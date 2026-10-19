# General algebraic K-theory

Construct algebraic K-theory on the existing exact-category substrate, compare the Q, plus, symmetric monoidal and S models, and extend the ring theory to all integer degrees. The central applications are localization, relative and nonunital theory, the Laurent Fundamental Theorem, products, enhanced invariance, Tor-unital excision, noetherian completion gluing, and symmetric Dedekind localization with its residue maps.

The specification comprises the canonical targets of the two part packets and the additional targets in the [main packet](../packets/GeneralAlgebraicKTheory.json). Imported node identifiers remain unchanged. The main packet's `importRefinements` specifies the contracts used here. All assertions below are mathematical targets or explicitly cited existing inputs; none is an implementation claim.

## Conventions and existing substrate

Use exact structures on preadditive categories with a zero object and binary biproducts. The pinned `TauCeti.ExactStructure`, its conflations and transport, `ExactK0`, its object-class map and universal property, and the split exact structure on finite projectives are inputs. K.1 builds Q on those carriers. The induced exact structure on the existing conflation category is a target, rather than a second conflation-category carrier.

For an essentially small category choose a small model in its declared universe and transport all constructions along the specified equivalence. For R : Type u, finite projectives are essentially u-small at the pins. Use their small model to form K(R) and its groups in universe u. Intrinsic exact-category theorems do not assume an ambient abelian category.

Write K(A)=ΩBQ(A), based at zero, and K_n(A)=π_nK(A)=π_(n+1)BQ(A) for n≥0. The comparison π₁BQ(A)≅ExactK0(A) preserves the specified two-edge object loops and conflation relations. The ordinary conflation category E(A) and the Q-type extension-action category EA have different morphisms.

For a Waldhausen category W, K(W)=Ω|wS•W|; retain the nerve direction of the weak equivalences. S₀W is zero and S₁W≃W. The relative S₀ of the identity is W; its augmented path construction contracts to the original S₀W by an extra degeneracy. Realization of levelwise fibres uses the stated connectedness/goodness or Bousfield–Friedlander hypotheses.

Rings are unital and associative unless specified otherwise. The pinned ModuleCat R uses left modules; a right R-module is represented by ModuleCat Rᵐᵒᵖ. Retain both actions in a noncommutative tensor product. Direct sum is the operation group-completed in the symmetric monoidal model. Ring multiplication is a separate biexact pairing; the usual internal commutative ring-spectrum product requires a commutative ring and the full coherence input.

K^B is the Bass nonconnective spectrum and IK is the Frobenius-pair model. Negative indices are integers: K_(−n)=LⁿK₀ for n≥0. NK_j is the kernel of evaluation at zero, also for negative j. The Laurent decomposition has four summands K_j, K_(j−1), NK_j and NK_j. Multiplication by [t] raises degree by one and splits the boundary. For a unit u, [u⁻¹]=−[u]; the resulting multiplication maps are not inverses.

Use integral unitization I⁺=Z⋉I. Nonunital K-theory is the fibre of the augmentation to Z. Relative quotient fibres and perfect-support fibres are different constructions. Completion gluing identifies the vertical fibres of the localization maps, under its noetherian hypothesis.

In the hermitian component, R is Dedekind, M is an invertible R-module with R-linear involution, and S is a set of nonzero prime ideals. The canonical residue coefficient is RHom_R(R/p,M)=(p^−1M/M)[−1]; uniformizers only give coordinates on this line. Symmetric residue devissage includes dyadic primes. The corresponding quadratic assertion is restricted to non-dyadic residues. The torsion-heart duality uses M[1].

## Ownership and construction order

| Supplier | Input and boundary |
| --- | --- |
| GrothendieckEulerForms; pinned Tau Ceti | Exact structures, exact K₀ and its projective resolution comparison. The current roadmap supplies the general degree-zero resolving-subcategory theorem. K.3 adds the higher theorem. ExactK0.ofLE_surjective is not cofinality. |
| StableHomotopyKTheory H.1–H.5 | Nerves, Theorems A/B, plus and group completion, good realization, spectra and generic coherent recognition. K.4:construction owns the S deloopings; H.5:S-delooping assembles them. K.7 owns the K-theoretic pairing. |
| KTheoryLowDegrees Z.1, U.1/U.2 and U.6 | Finite projectives and scalar-extension interfaces, classical absolute K₀/K₁, patching. K.2:plus supplies the early Q comparison. U.6 receives the stronger relative π₁ comparison; it does not feed K.5 or K.6. |
| K2SymbolsBrauer; K3BlochGroups | Steinberg/plus and field symbol presentations; the indecomposable K₃ comparison with its stated hypotheses. The comparison register adds no duplicate presentation. |
| Current DGAInfinity Layers 5 and 7 | Enhanced derived modules, perfect envelopes, quotients and Verdier comparisons. The exact-category fully-exact criterion is a DGAInfinity, Part II extension contract with Keller 11.7/12.1 hypotheses. |
| Current StablePeriodicCurved Layers 0–3 | Frobenius exact data, stable quotient and triangulation, and generic complex Frobenius structures. K.6 adds Frobenius pairs, the homotopy-acyclic pair and IK, rather than rebuilding their carriers. |
| GeneralAlgebraicKTheoryPartII KII.2/amalgam | The E₁ replacement algebra for a derived Milnor square and its localizing-invariant square. The Tor-unital specialization checks that replacement is the quotient ring. |
| GeometryOfNumbersAndQuadraticArithmetic GN.6; HermitianKTheoryOfPoincareCategories HK.0/HK.6/HK.7 | Import the canonical residue line and symmetric GW residue sequence already owned by GN.6. Stable Poincaré localization/surgery, symmetric-heart Witt devissage and flavour comparisons are explicit supplier contracts. K.3:hermitian applies them to the torsion category and computes boundaries. |
| SchemeKTheoryOperations S.1–S.6 | Global Perf, coherent G-theory, support continuity and scheme Fundamental Theorems. The ring and affine results here feed these constructions; no global scheme theorem feeds K.6. |
| KTheoryFiniteLocalFields, Part II | Finite-Artin K₃ calculations and their prime range for the enhanced-invariance counterexample. Finite-field computations alone do not supply them. |

The numerical layer labels organize the exposition. The construction order is the following component order; it is also the dependency contract for the proposed sublayers.

| Component | Required preceding interfaces |
| --- | --- |
| K.1; early K.2:plus | Exact/K₀ substrate, H.1/H.2/H.3/H.4, finite-projective scalar extension. The ring functor precedes all relative/nonconnective theory. |
| Early K.3 | Exact-category additivity, resolution, devissage and abelian localization use Q and Theorems A/B. Cofinality is a separate component after the S-theoretic theorem. |
| K.4:construction → H.5:S-delooping | Waldhausen categories, S, additivity and relative S establish deloopings before generic spectrum assembly. Products are not an input of assembly. |
| K.7:products | Biexact S grids and the assembled spectrum, with the early K₀/K₁ adapter. This component precedes product-boundary, transfer and Bass consumers. |
| Early K.5 → K.6 | Relative fibres, projective triples and Milnor K₁–K₀ results precede Bass/Frobenius nonconnective theory. They do not use U.6 or Tor-unital excision. |
| K.3:hermitian | K.6, GN.6 and the specified HK/stable Poincaré suppliers. GN.6 imports only the early classical components, never this hermitian specialization. |
| K.5:Tor-unital | K.6 and Part II KII.2. This component does not feed K.6 or the replacement-algebra supplier. |
| K.2:low-degree-comparisons; remaining K.7 | Import the explicitly qualified absolute comparisons, enhanced invariance, matrix corners and continuity. |

## Layer targets and checks

### K.1 — The Q-construction and smallness

Build Q from admissible spans on the existing exact structure. Prove its universal property, small-model transport, the object-class π₁ comparison and elementary K-group properties. The maximal tree consists of the distinguished zero inflations; it does not contain every arrow from zero.

#### Exact categories and Quillen's category Q(A)

`GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction` · construction · planet: **The Q-construction**

For an exact category A the category Q(A) has the objects of A; a morphism from A to B is an equivalence class of diagrams in which A is received by an admissible epimorphism out of a subobject of B and that subobject is an admissible monomorphism into B, two such diagrams being equivalent when an isomorphism between them is the identity on A and on B. Composition is by pullback of the two middle objects. Equivalently a morphism from A to B is an admissible subobject of B together with an admissible epimorphism from it onto A. Two kinds of morphism are distinguished, the admissible monomorphisms and the oppositely oriented admissible epimorphisms; both are closed under composition, every morphism factors as one of the second kind followed by one of the first, uniquely up to isomorphism, the morphisms from the zero object to B correspond to the admissible subobjects of B, and the isomorphisms of Q(A) correspond to the isomorphisms of A.

**Hypotheses and conventions.**

- Import TauCeti.ExactStructure on a preadditive category with a zero object and binary biproducts: its ConflationClass supplies the kernel–cokernel pairs and its E0/E1/E2 fields with their duals the composition and base/cobase-change axioms. No competing exact-category carrier is defined. Composition in Q needs exactly two pinned facts: base change of a conflation along any map is a conflation with the same kernel (ExactStructure.conflation_baseChange), and the pullback of an admissible monomorphism along an admissible epimorphism is an admissible monomorphism, being a kernel of the composite deflation (ExactStructure.conflation_comp_of_isPullback; Bühler, Proposition 2.15). Both are proved from E1op, E2op and the kernel–cokernel property.
- Quillen's axiom (c) (Weibel, Exercise II.7.8(3); Bühler's 'obscure axiom', Proposition 2.16) is used by no node of this roadmap: every proof step is phrased in E0–E2, their duals and the kernel–cokernel property, as the composition step above shows. For the pinned carrier that axiom holds only for a morphism that has a cokernel (dually, a kernel), which is the hypothesis of Bühler's Proposition 2.16. The K-book defines exact categories inside an ambient abelian category (Definition II.7.0), which the pinned carrier does not have; the proofs here are intrinsic, and where a statement needs an ambient abelian category (the closure hypothesis of Gillet–Waldhausen) that category is part of the data, with the pinned induced structure.
- The equivalence classes of the defining diagrams must form a set; this is guaranteed for a small exact category, and the next node says how a small model is chosen.
- Composition uses the pullback of an admissible epimorphism along an arbitrary map, which exists and is again an admissible epimorphism by the base-change axiom; this is where the exactness axioms are used.

**Construction or proof.**

1. Define the morphisms as equivalence classes of the displayed diagrams and check that the relation is an equivalence relation.
2. Define composition: for A ↞ B₂ ↣ B and B ↞ C₂ ↣ C form the pullback B₂ ×_B C₂ of the admissible epimorphism C₂ ↠ B along B₂ ↣ B (E2op). Its map to C₂ is an admissible monomorphism by ExactStructure.conflation_comp_of_isPullback and its map to B₂ an admissible epimorphism by ExactStructure.conflation_baseChange, so the composite A ↞ B₂ ×_B C₂ ↣ C is again of the required form by E1 and E1op.
3. Prove associativity and the identity laws from the universal property of the pullback, which is the representative-independence the stage text asks for.
4. Prove the subobject description: a morphism determines and is determined by an admissible subobject of the target together with an admissible epimorphism from it, so that morphisms out of the zero object are the admissible subobjects.
5. Prove the factorisation of every morphism into an oppositely oriented admissible epimorphism followed by an admissible monomorphism, unique up to isomorphism.
6. Prove that the isomorphisms of Q(A) are exactly those of A, and that Q of the opposite category is isomorphic to Q(A) with the two kinds of morphism exchanged.
7. Record the instance: the split exact structure on an additive category, where the admissible epimorphisms are the split surjections, and check that the construction does not silently identify it with a non-split one.

**API.**

| Declaration | Contract |
| --- | --- |
| QCat | The category Q(A) attached to an exact structure. |
| QCat.hom_equiv_subobject | A morphism is an admissible subobject together with an admissible epimorphism onto the source. |
| QCat.inflation | The morphism attached to an admissible monomorphism. |
| QCat.deflation | The oppositely oriented morphism attached to an admissible epimorphism. |
| QCat.factor | Every morphism factors as a deflation followed by an inflation, uniquely up to isomorphism. |
| QCat.hom_zero | Morphisms out of the zero object are the admissible subobjects. |
| QCat.isoQ_equiv_iso | The isomorphisms of Q(A) are those of A. |
| QCat.op | Q of the opposite exact category is isomorphic to Q(A). |

**Uses.**

- K.1, the universal property: The factorisation is exactly what makes a functor out of Q(A) determined by its values on the two kinds of morphism.
- K.1, the K-groups: The K-groups are the homotopy groups of the realisation of the nerve of this category.
- K.3, all four fundamental theorems: Each is proved by showing that a functor between Q-categories is a homotopy equivalence.
- K.4, the comparison with the S-construction: The comparison is a statement about this category.

**Checks.**

- **hom_from_zero** (degenerate): Morphisms from the zero object to B are the admissible subobjects of B.
- **split_case** (non-example): For the split exact structure the admissible epimorphisms are the split surjections; the construction must not use arbitrary epimorphisms.
- **iso_correspondence** (computation): The isomorphisms of Q(A) are those of A.
- **op_iso** (computation): Q of the opposite category is isomorphic to Q(A), exchanging the two kinds of morphism.

**Acceptance.**

- Morphisms from the zero object to B correspond to the admissible subobjects of B.
- Isomorphisms of Q(A) correspond to isomorphisms of A, so the construction does not collapse the automorphism groups.
- Q of the opposite exact category is isomorphic to Q(A), which is the symmetry the subsequent comparisons use.
- For the split exact structure the admissible epimorphisms are the split surjections; a definition that used all epimorphisms would fail this.

**Prerequisites:** `tauceti:TauCeti.ExactStructure`, `tauceti:TauCeti.ExactStructure.conflation_baseChange`, `tauceti:TauCeti.ExactStructure.conflation_comp_of_isPullback`.

**Sources:** Weibel.KBook.IV, Definition 6.1 with 6.1.1, p. IV.53 — The construction with its composition.; Weibel.KBook.IV, 6.1.2 (Subobjects) and the paragraph after it, p. IV.53 — The subobject description and the two consequences.; Weibel.KBook.IV, 6.1, the paragraph on the two distinguished kinds of morphism, p. IV.53 — The factorisation; it is what the universal property of the next node rests on.; Buhler.ExactCategories, Proposition 2.15, p. 10, and Proposition 2.16 with Remark 2.17, pp. 10–11 (arXiv v2) — Proposition 2.15 is the composition step, proved from E1op and the kernel property; Proposition 2.16 is Quillen's axiom (c), valid only under its cokernel hypothesis and used by no node here.; Weibel.KBook.II, Exercise 7.8, pp. II.70–71 — Quillen's axiom (c) in the source's numbering, with its kernel and cokernel hypotheses.; Quillen.Higher1973, Section2, PDF15–20/publication pp99–104, full images read — Original Q spans, universal property, K0 relation calculation, small skeleton transport and finite-data continuity checked. The embedding paragraph omits details and is not cited as its proof..

#### The universal property of Q(A)

`GeneralAlgebraicKTheory:K.1/Q-construction-universal-property` · lemma

To give a functor out of Q(A) it is enough to give an object for each object of A, a map for each admissible monomorphism and a map for each admissible epimorphism, such that each of the two assignments is functorial and such that for every bicartesian square with admissible monomorphisms horizontally and admissible epimorphisms vertically the two composites agree; the functor is then unique. In particular an exact functor of exact categories induces a functor of the Q-categories, and hence a map of K-groups. The proof is the factorisation of the previous node together with the rewriting of a deflation followed by an inflation into the normal form, which is what the bicartesian condition supplies.

**Hypotheses and conventions.**

- A is an exact category and the target is any category.
- The bicartesian squares in question are those coming from an admissible layer, that is from a pair of composable admissible monomorphisms.
- Uniqueness is up to equality of functors, not merely up to isomorphism, because the factorisation is unique up to unique isomorphism.

**Construction or proof.**

1. Observe that every morphism of Q(A) is a deflation followed by an inflation, so a functor is determined by its values on those two classes.
2. Check that the two functoriality conditions make the assignment well defined on each class separately.
3. Check that a composite of two morphisms in normal form is again put in normal form by the bicartesian condition, which is what gives functoriality of the whole assignment.
4. Deduce that an exact functor induces a functor of Q-categories, since it carries admissible monomorphisms, admissible epimorphisms and bicartesian squares to the same.
5. Record the two uses the layer makes of it: the functor to the Grothendieck group used in the next node, and the functoriality of the K-groups.

**API.**

| Declaration | Contract |
| --- | --- |
| QCat.lift | The functor out of Q(A) determined by the data. |
| QCat.lift_inflation | Its value on an inflation. |
| QCat.lift_deflation | Its value on a deflation. |
| QCat.lift_unique | Uniqueness of the functor. |
| QCat.map | The functor induced by an exact functor. |

**Uses.**

- K.1, the fundamental group: The comparison with the Grothendieck group is built with this property, not by counting.
- K.1, functoriality of the K-groups: Every map of K-groups in this roadmap comes from an exact functor through this lemma.

**Checks.**

- **exact_functor_induces** (computation): An exact functor induces a functor of Q-categories.
- **determined_by_two_classes** (compatibility): Two functors agreeing on inflations and deflations are equal.
- **bicartesian_needed** (non-example): Without the bicartesian condition the assignment is not functorial; the condition is not decorative.

**Acceptance.**

- An exact functor induces a functor of Q-categories and hence maps of all K-groups.
- The functor sending every inflation to the identity and every deflation to translation by the class of its kernel exists, by this property; it is what proves the fundamental-group theorem.
- The bicartesian condition cannot be dropped: without it the assignment is not functorial on composites.

**Prerequisites:** `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`.

**Sources:** Weibel.KBook.IV, 6.1, the factorisation, and 6.2, the proof, pp. IV.53 to IV.54 — The factorisation this lemma turns into a universal property, and the use Weibel makes of it in the next node. Weibel does not state the universal property as a numbered result; the statement here is assembled from the factorisation and from the construction of the functor in the proof of Proposition 6.2, and the packet says so rather than attributing a numbered theorem to the source.; Quillen.Higher1973, Section2, PDF15–20/publication pp99–104, full images read — Original Q spans, universal property, K0 relation calculation, small skeleton transport and finite-data continuity checked. The embedding paragraph omits details and is not cited as its proof..

#### Small models, transport of the exact structure and independence

`GeneralAlgebraicKTheory:K.1/small-models-and-transport` · comparison

The K-groups are defined for a small exact category. An exact category with only a set of isomorphism classes is replaced by an equivalent small subcategory, and the choice is irrelevant because an equivalence of exact categories induces a homotopy equivalence of the realisations; the comparison is natural in exact functors. Tau Ceti already has the algebraic half of this: it transports an exact structure along an additive equivalence and proves that the Grothendieck group is invariant under that transport and under exact equivalences, with the small-model choice fixed once. What is missing is the same statement for Q(A) and for the higher groups, and this node states it.

**Hypotheses and conventions.**

- The exact category has a set of isomorphism classes; the small subcategory is equivalent to it as an exact category, that is by an equivalence carrying conflations to conflations in both directions.
- Naturality is in exact functors: a square of exact functors and equivalences commutes up to a natural isomorphism, and isomorphic exact functors induce the same map.
- The pinned Tau Ceti transport is along an additive equivalence with the exact structure carried across; that is the hypothesis this node reuses.
- Universe discipline: the pinned ExactK0 E lives in Type w for [EssentiallySmall.{w} C], so the small model, its Q-category, nerve and realisation are taken w-small and every K-group lives in universe w. For a ring R : Type u the pinned EssentiallySmall.{u} instance of the finitely generated projectives fixes w = u. No universe is raised silently when passing to the model.

**Construction or proof.**

1. Record the pinned statements: transport of an exact structure along an equivalence, invariance of the Grothendieck group under that transport, and invariance under an exact equivalence.
2. Prove that an exact equivalence induces an isomorphism of Q-categories and hence a homotopy equivalence of realisations.
3. Prove that isomorphic exact functors induce isomorphic functors of Q-categories and therefore the same maps of K-groups.
4. Deduce independence of the small model, and state the naturality in exact functors, which is the higher-degree transport target.
5. Record that the basepoint may be taken to be any zero object, since there is a unique map between two zero objects in Q(A) and hence a canonical path.

**Acceptance.**

- The K-groups do not depend on the choice of small model, and the isomorphism is natural in exact functors.
- In degree zero the statement is Tau Ceti's pinned invariance of the Grothendieck group, and the two must agree.
- The choice of zero object does not matter.
- The comparison of the fundamental group with ExactK0 E : Type w is made on a w-small model, so the two groups live in the same universe.

**Prerequisites:** `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`, `tauceti:TauCeti.ExactStructure.transport`, `tauceti:TauCeti.ExactK0.transportEquiv`, `tauceti:TauCeti.ExactK0.mapEquiv`.

**Sources:** Weibel.KBook.IV, Definition 6.3.1 and the surrounding remark, p. IV.55 — Functoriality and the independence of the model up to isomorphic functors..

#### The fundamental group of the Q-construction is the Grothendieck group

`GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0` · theorem · planet: **The fundamental group of the Q-construction**

For an exact structure E on an essentially w-small category, with the pinned ExactK0 E : Type w, the realisation of the nerve of Q(E) on the w-small model of the previous nodes is a connected complex whose fundamental group at the zero object is ExactK0 E; the element corresponding to ExactK0.of A is the based loop made of the two edges from the zero object to A, the admissible monomorphism and the oppositely oriented admissible epimorphism. Both directions of the isomorphism come from universal properties: ExactK0.lift of the two-edge loops in one direction, and in the other the map on fundamental groups induced, through the classification of coverings, by the functor from Q(E) to ExactK0 E that the universal property of Q provides. No counting argument is used.

**Hypotheses and conventions.**

- C is preadditive with a zero object and binary biproducts and [EssentiallySmall.{w} C], as the pinned ExactK0 E : Type w requires. The realisation is formed on a w-small model and transported by K.1/small-models-and-transport, whose degree-zero part is ExactK0.transportEquiv.
- The orientation of the loop is fixed once and for all as in the source, and every subsequent comparison uses that orientation.
- The Grothendieck group is the pinned ExactK0 E, generated by the objects with a relation for each conflation; its class map is ExactK0.of, its universal property ExactK0.lift (with liftEquiv) out of an ExactK0.AdditiveInvariant with values in a commutative group, and its extensionality ExactK0.hom_ext.

**Construction or proof.**

1. Choose the distinguished inflation edge 0 ↣ A for each nonzero vertex A of the small Q-model as a maximal tree. These edges form a star. Do not take every morphism out of 0: the distinct edge represented by A ↠ 0 supplies the K₀ generator loop and must remain outside the tree.
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
- For finite-dimensional vector spaces, the two Q-morphisms 0 → F corresponding to the subobjects 0 and F are distinct. The first is the chosen tree edge; killing both would incorrectly kill the generator of K₀(F) = ℤ.

**Prerequisites:** `GeneralAlgebraicKTheory:K.1/Q-construction-universal-property`, `GeneralAlgebraicKTheory:K.1/small-models-and-transport`, `StableHomotopyKTheory:H.1/coverings-fundamental-group-local-coefficients`, `tauceti:TauCeti.ExactK0`, `tauceti:TauCeti.ExactK0.of`, `tauceti:TauCeti.ExactK0.of_conflation`, `tauceti:TauCeti.ExactK0.AdditiveInvariant`, `tauceti:TauCeti.ExactK0.lift`, `tauceti:TauCeti.ExactK0.liftEquiv`, `tauceti:TauCeti.ExactK0.hom_ext`, `tauceti:TauCeti.ExactK0.transportEquiv`, `mathlib:CategoryTheory.nerve`, `mathlib:SSet.toTop`, `mathlib:HomotopyGroup`.

**Sources:** Weibel.KBook.IV, Proposition 6.2 with its proof, p. IV.54 — The theorem, the representative of a class and the maximal-tree proof.; Weibel.KBook.IV, Proof of Proposition 6.2 and Example 6.2.3, p. IV.54 — The generators, the additivity relation and the functor to the Grothendieck group from which the inverse map is built.; Quillen.Higher1973, Section2, PDF15–20/publication pp99–104, full images read — Original Q spans, universal property, K0 relation calculation, small skeleton transport and finite-data continuity checked. The embedding paragraph omits details and is not cited as its proof..

#### The K-groups of an exact category

`GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories` · definition · planet: **The K-groups of an exact category**

For a small exact category A, define BQ(A) as the realisation of the nerve of Q(A), and KSpace(A) = ΩBQ(A) based at the zero object. Define K_n(A) = π_n KSpace(A) = π_(n+1) BQ(A), for n ≥ 0. The groups are abelian, including degree zero by the preceding ExactK0 comparison. Exact functors give maps and naturally isomorphic exact functors give homotopic maps. Essentially small inputs use the preceding small-model transport. The ring specialisation and its scalar-extension functor belong to the early K.2:plus ring node; scheme specialisations belong to SchemeKTheoryOperations:S.2.

**Hypotheses and conventions.**

- A is small, or has a set of isomorphism classes and is replaced by a small model as in the earlier node.
- The basepoint is a zero object, and the choice does not matter.
- Indexing: K_n(A) = π_n KSpace(A) = π_(n+1) BQ(A). Degree zero is π₀ of the loop space and π₁ of BQ, compared with ExactK0.

**Construction or proof.**

1. Construct BQ(A), then its based loop space KSpace(A); define KGroup(A,n) as π_n of that loop space, equivalently π_(n+1) of BQ(A).
2. Prove that the groups are abelian in every degree, in degree zero by the previous node and above by the standard argument for homotopy groups in degree at least two.
3. Prove functoriality from the universal property, and that isomorphic exact functors give the same maps.
4. Keep this node generic in exact categories; import the early ring specialisation in its consumers and leave scheme specialisations to S.2.
5. Record what is pinned: the nerve of a category, the realisation of a simplicial set and the homotopy groups of a pointed space all exist in Mathlib, and no K-theory space is built from them.

**API.**

| Declaration | Contract |
| --- | --- |
| KSpace | The based loop space ΩBQ(A), whose π₀ is ExactK0(A). |
| KGroup | π_n KSpace(A), equivalently π_(n+1) BQ(A). |
| KGroup.addCommGroup | The abelian group structure, in every degree including zero. |
| KGroup.map | The map induced by an exact functor. |
| KGroup.map_of_natIso | Isomorphic exact functors induce the same map. |
| KGroup.zero_eq_exactK0 | In degree zero the group is the pinned Grothendieck group. |

**Uses.**

- Every subsequent layer of this roadmap: K.2 compares these groups with the plus construction, K.3 proves the fundamental theorems about them, K.4 compares them with the Waldhausen construction and K.5 makes them relative.
- K.6 and K.7: The nonconnective extension takes this connective theory as input, and the invariance and product statements are about it; their ring forms go through the early ring model of K.2:plus.
- The consumer roadmaps: ArithmeticKTheory, K2SymbolsBrauer, K3BlochGroups and the rest import these groups by name.

**Checks.**

- **degree_zero** (degenerate): The zeroth group is the Grothendieck group.
- **zero_category** (degenerate): The zero exact category has vanishing K-groups.
- **loop_indexing** (non-example): BQ(A) is connected but π₀ KSpace(A) = ExactK0(A); the two spaces must not be identified.
- **opposite** (compatibility): The groups of a category and of its opposite agree.

**Acceptance.**

- In degree zero the definition agrees with the Grothendieck group.
- The zero exact category has contractible K-theory, so all its groups vanish.
- BQ(A) is connected even when ExactK0(A) is nonzero; KSpace(A) has π₀ = ExactK0(A). Confusing BQ with its loop space fails this test.
- The groups of a category and of its opposite agree.

**Prerequisites:** `GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0`, `GeneralAlgebraicKTheory:K.1/small-models-and-transport`, `mathlib:CategoryTheory.nerve`, `mathlib:SSet.toTop`, `mathlib:HomotopyGroup`.

**Sources:** Weibel.KBook.IV, Definition 6.3, p. IV.54 — Formula in Definition 6.3; the preceding sentence defines KA as ΩBQA. ; Quillen.Higher1973, Section2, PDF15–20/publication pp99–104, full images read — Original Q spans, universal property, K0 relation calculation, small skeleton transport and finite-data continuity checked. The embedding paragraph omits details and is not cited as its proof..

#### Elementary properties: opposites, finite products and filtered colimits

`GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups` · theorem

The K-groups of an exact category and of its opposite agree, since the two Q-categories are isomorphic; the direct sum of two exact categories is exact with Q of the sum the product of the Q-categories, so the K-groups of a finite direct sum are the products of the K-groups; and the K-groups commute with filtered colimits of exact categories, because the filtered colimit carries an exact structure, Q commutes with it and so do the classifying space and its homotopy groups. The direct sum makes the realisation a homotopy-commutative H-space, and the induced addition is the group operation. These are statements about exact categories only; their ring forms (finite products of rings, filtered colimits of rings through idempotent matrices, opposite rings) belong to the early ring model K.2/functorial-K-theory-of-a-ring.

**Hypotheses and conventions.**

- The products are finite; the colimits are over small filtering categories of exact categories and exact functors, and the colimit carries the exact structure whose conflations are the images of conflations at some stage (Weibel, Exercise II.7.9, through the axioms of Exercise II.7.8(1)–(2)).
- The H-space structure is the one induced by the direct sum, and the identification with the group structure is part of the statement.

**Construction or proof.**

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

**Prerequisites:** `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `StableHomotopyKTheory:H.1/filtered-colimits-of-categories`, `mathlib:CategoryTheory.Limits.HasFilteredColimits`.

**Sources:** Weibel.KBook.IV, Elementary properties 6.4, pp. IV.55 to IV.56 — All three statements with their proofs; the ring examples in the same passage are the ring model's (K.2/functorial-K-theory-of-a-ring).; Quillen.Higher1973, Section2, PDF15–20/publication pp99–104, full images read — Original Q spans, universal property, K0 relation calculation, small skeleton transport and finite-data continuity checked. The embedding paragraph omits details and is not cited as its proof..

### K.2 — The early ring model and component splitting

Use the early functor K(R) from K.2:plus. Component translations give a space-level product description after choices of points in group-completed components; they do not split the spectrum.

#### What the product description does not say

`GeneralAlgebraicKTheory:K.2/no-natural-product-splitting` · comparison

The loop space of the realisation of Q of the finitely generated projectives over a ring is homotopy equivalent to the product of the discrete zeroth K-group with the plus construction on the classifying space of the stable general linear group. The equivalence is of spaces and depends on a choice of representative in each component. It is not an equivalence of infinite-loop spaces splitting the K-theory spectrum as a product, and the translations used to move between components are not natural in the ring. This node records the distinction as a non-example, because the product formula is exactly the kind of statement that is easy to over-read, and because the stage text names it.

**Hypotheses and conventions.**

- The ring is unital; the zeroth K-group is taken with its discrete topology.
- Choose a point in each component of the group-completed K-space. Such a point can be represented by a formal difference of projective modules; no projective representative of every K0 class is required.
- The infinite-loop structure on the left is that of the connective Ω-spectrum that StableHomotopyKTheory:H.5:S-delooping assembles from the K.4:construction deloopings, or that of the group completion (H.4); the statement is about that structure.

**Construction or proof.**

1. State the product description with the choice made explicit.
2. State what is natural: the comparison commutes with ring maps and with block sum.
3. State the non-example: the splitting is not one of infinite-loop spaces, and no natural choice of component representatives exists in general.
4. Record the consequence for computations: a class in a non-zero component is compared with one in the zero component only after a translation, and the translation must be carried along in any argument.

**Acceptance.**

- The description is of spaces after a choice, not of infinite-loop spaces.
- The translations between components are not natural in the ring.
- Statements proved in the zero component do not transport to the other components for free.

**Prerequisites:** `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`.

**Sources:** Weibel.KBook.IV, Corollary 7.2, p. IV.62 — The product description, with the Ω the loop-space convention requires.

### K.2:low-degree-comparisons — Low-degree comparison register

Register the exact owner-provided K₁/K₂/indecomposable K₃ comparisons. Matsumoto remains field-specific; no claim presents all K₃ of every ring by Bloch groups.

#### The explicit models in degrees one, two and three

`GeneralAlgebraicKTheory:K.2:low-degree-comparisons/explicit-low-degree-models` · comparison

Combining the plus-equals-Q theorem with the low-degree roadmaps identifies the first three K-groups of a ring with their classical models: the first is the quotient of the stable general linear group by its elementary subgroup, the second is the second homology of that elementary subgroup, equivalently the kernel of the Steinberg group over it, and the third is described by Suslin's sequence relating it to the Bloch group. None of the three is proved here: each is owned by another roadmap, and this node is the register that records which, states the combination, and fixes what the combination does and does not assert. The identifications are unconditional for the class of rings the owning statements are proved for; they are not field-specific.

**Hypotheses and conventions.**

- The ring has a unit; the stable general linear group and its elementary subgroup are the colimits of the finite ones.
- The identification in degree one is the statement of KTheoryLowDegrees, in degree two that of K2SymbolsBrauer and in degree three that of K3BlochGroups; this node only combines them with the plus comparison.
- Neither pinned library has the stable elementary subgroup, the stable general linear group, the Steinberg group, the Bloch group or any of the three K-groups, which is what makes this a register rather than a construction.

**Construction or proof.**

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

**Prerequisites:** `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `KTheoryLowDegrees:U.6`, `K2SymbolsBrauer:T.1:plus`, `K3BlochGroups:V.4`.

**Sources:** Weibel.KBook.IV, Corollary 7.2 and Definition 6.3.2, pp. IV.55 and IV.62 — The bridge this register rests on; the low-degree identifications themselves are the other roadmaps’ statements and are not quoted from this source..

#### Matsumoto's presentation is field-specific, and the other identifications are not

`GeneralAlgebraicKTheory:K.2:low-degree-comparisons/matsumoto-is-field-specific` · comparison

The identifications of the first three K-groups with their classical models hold for the stated class of rings. Matsumoto's presentation of the second K-group by symbols subject to the Steinberg relation is a different kind of statement: it is a theorem about FIELDS and does not extend to general rings. This node states the distinction, names the owner of each half, and records the error it exists to prevent, namely quoting the symbol presentation as though it were part of the general low-degree comparison.

**Hypotheses and conventions.**

- Matsumoto's theorem is for a field; the second K-group of a general commutative ring is not presented by symbols in this way.
- The general identification of the second K-group with the second homology of the stable elementary subgroup is unconditional for rings with a unit and is a different statement.
- Neither statement exists in the pinned libraries, which have no symbol presentation of any K-group.

**Construction or proof.**

1. State the general identification and its owner.
2. State Matsumoto's presentation and its owner, with the field hypothesis explicit.
3. Record that the first is used unconditionally in the atlas and the second only over a field.
4. Record the non-example: for a general commutative ring the symbol map from the tensor square of the units need be neither injective nor surjective onto the second K-group, so the presentation fails.
5. Record that the Dennis-Stein symbols, which do present the second K-group of a suitable local ring, are the other roadmap's answer to the general case.

**Acceptance.**

- The general low-degree identifications are unconditional for their stated ring class.
- Matsumoto's presentation is a theorem about fields and is quoted as such wherever it is used.
- The symbol map for a general commutative ring is not an isomorphism onto the second K-group.

**Prerequisites:** `GeneralAlgebraicKTheory:K.2:low-degree-comparisons/explicit-low-degree-models`, `K2SymbolsBrauer:T.2:symbols`.

**Sources:** Weibel.KBook.IV, §7, the opening and Corollary 7.2, pp. IV.61 to IV.62 — The unconditional half. Matsumoto’s theorem is in chapter III of the same book, which was not read for this job; it is imported from K2SymbolsBrauer and the packet does not quote it..

### K.2:plus — Ring functoriality, plus comparison and group completion

Extend scalars exactly on split projectives without a flatness hypothesis. Prove plus–Q through the extension-action category, preserve object and automorphism classes, and compare the symmetric monoidal core model with Q/S.

#### Scalar extension as an exact functor of finitely generated projectives, without a flatness hypothesis

`GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality` · construction

For a unital ring homomorphism f from A to B, possibly noncommutative, the scalar-extension functor f_! = B ⊗_A − of KTheoryLowDegrees Z.1 (Z.1/extend-scalars, the left adjoint of restriction of scalars, for arbitrary unital rings) restricts to an additive functor from the finitely generated projective A-modules to the finitely generated projective B-modules (Z.1/extend-scalars-finite-projective). This node makes it an exact functor of the pinned exact categories: the exact structure on finitely generated projectives is the split one (finiteProjectiveModulesExactStructure_eq_split), and every additive functor is exact for split structures (ExactStructure.isConflationExact_split), so no flatness hypothesis is needed. The identity and composition natural isomorphisms of Z.1/extend-scalars make f ↦ f_! a pseudofunctor into exact functors, which is what makes the K-theory of a ring functorial in K.2/functorial-K-theory-of-a-ring. Neither the arbitrary-ring functor nor its preservation of finitely generated projectives is in the pinned libraries; they are Z.1's, and this node does not rebuild them.

**Hypotheses and conventions.**

- The ring map is unital and the rings need not be commutative; the extension of scalars is Z.1's ExtendScalars (in the K-book's right-module notation P ↦ P ⊗_A B), not Mathlib's ModuleCat.extendScalars, which is stated for commutative rings and is used only for the comparison in the commutative case.
- No flatness is assumed. Flatness would be needed to preserve arbitrary exact sequences, and is not needed here because the exact structure on finitely generated projectives is the split one.
- The categories are the pinned full subcategories (finiteProjectiveModules R).FullSubcategory with finiteProjectiveModulesExactStructure R, each with the pinned EssentiallySmall.{u} instance, for rings in one universe u.

**Construction or proof.**

1. Import from KTheoryLowDegrees Z.1 the functor ExtendScalars f with its unit and composition natural isomorphisms, and its restriction to an additive functor between the finitely generated projectives (Z.1/extend-scalars-finite-projective (b) and (d)).
2. Prove that the restriction is conflation-exact for the pinned structures: rewrite both with finiteProjectiveModulesExactStructure_eq_split and apply ExactStructure.isConflationExact_split; record that this is where the absence of a flatness hypothesis comes from.
3. Transport the unit and composition isomorphisms of Z.1/extend-scalars to natural isomorphisms of exact functors, so that f ↦ f_! respects identities and composites up to the specified isomorphisms.
4. For commutative rings, compare f_! with Mathlib's ModuleCat.extendScalars through Z.1's natural isomorphism.
5. Record the contrast on all finitely generated modules, where exactness of base change genuinely needs flatness.

**API.**

| Declaration | Contract |
| --- | --- |
| projBaseChange | The exact functor f_! between the pinned exact categories of finitely generated projectives, for a unital ring map f. |
| projBaseChange_exact | It is conflation-exact, by additivity alone, for the split structure. |
| projBaseChange_id | The exact functor of the identity ring map is naturally isomorphic to the identity. |
| projBaseChange_comp | Compatibility with composition of ring maps, through Z.1's composition isomorphism. |
| projBaseChange_no_flat | No flatness hypothesis is needed here, unlike on all finitely generated modules. |
| projBaseChange_comm | For commutative rings it is naturally isomorphic to the restriction of Mathlib's ModuleCat.extendScalars. |

**Uses.**

- K.2:plus, the ring model: K.2/functorial-K-theory-of-a-ring defines the map of K-theory spaces of a ring map as K of this exact functor.
- K.2:plus, the plus comparison: The comparison is asserted to commute with ring maps, which needs this functor.
- K.5: Relative K-theory of a ring map is the homotopy fibre of the map this functor induces.

**Checks.**

- **no_flatness** (computation): The functor is exact without any flatness hypothesis.
- **free_case** (computation): It carries a finite free module to a finite free module of the same rank.
- **composition** (compatibility): It is compatible with composition of ring maps.
- **modules_need_flat** (non-example): On all finitely generated modules exactness does need flatness; a formalisation that dropped it there would be wrong.
- **noncommutative_map** (computation): For the inclusion of a field k into the matrix ring M₂(k), neither ring being commutative in the second case, the functor sends k to M₂(k), free of rank one over M₂(k); in K₀(M₂(k)) ≅ ℤ, generated by the simple module k², the class of M₂(k) is twice that generator, so the induced map ℤ = K₀(k) → K₀(M₂(k)) = ℤ is multiplication by 2.

**Acceptance.**

- Base change along any unital ring map, including noncommutative ones, induces an exact functor of the categories of finitely generated projectives, with no flatness hypothesis.
- Base change on all finitely generated modules is exact only under a flatness hypothesis; the two must not be confused.
- The exact functors attached to an identity and to a composite of ring maps are the identity and the composite, up to the natural isomorphisms of Z.1/extend-scalars.

**Prerequisites:** `KTheoryLowDegrees:Z.1/extend-scalars`, `KTheoryLowDegrees:Z.1/extend-scalars-finite-projective`, `mathlib:ModuleCat.extendScalars`, `tauceti:TauCeti.ExactStructure.isConflationExact_split`, `tauceti:TauCeti.ExactStructure`, `tauceti:TauCeti.finiteProjectiveModules`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure_conflation_iff`.

**Sources:** Weibel.KBook.IV, Definition 6.3.2, p. IV.55 — The definition of the K-theory of a ring for an arbitrary ring with unit, and the transfer in the opposite direction; the arbitrary-ring scope is why the noncommutative functor of Z.1 is used.; Weibel.KBook.IV, Definition 6.3.3, p. IV.55 — The flatness hypothesis where it is genuinely needed, on all finitely generated modules; the contrast with finitely generated projectives is the point of this node..

#### The extension category and the fibration over Q(A)

`GeneralAlgebraicKTheory:K.2:plus/extension-category-and-the-fibration` · construction

For a small exact category A, EA has objects its conflations A₀ ↣ B ↠ C and Q-type three-row diagrams (IV.7.3.1) as morphisms, modulo isomorphism of the intermediate quotient. The right column defines t : EA → QA. Its fibre E_C is a groupoid: its arrows are pairs of isomorphisms on the kernel and middle terms over id_C. The functor Core(A) → E_0, A₀ ↦ (A₀ = A₀ ↠ 0), is an equivalence. Direct sum on kernel and middle terms defines a Core(A)-action leaving t fixed. This EA is distinct from the ordinary category of conflations used in exact-category additivity; it has no ordinary kernel-term or middle-term projection to A. The following nodes construct its fibre products, cartesian lifts and localised fibration separately.

**Hypotheses and conventions.**

- A is a small exact category with its pinned ExactStructure; this construction and the fibre-zero equivalence require no split-exactness assumption.
- Q-type morphisms have the orientation of IV.7.3.1: the target kernel embeds in the source kernel, and the source middle term embeds in the target middle term.

**Construction or proof.**

1. Define the extension category with the source's morphisms (7.3.1) and the functor t to Q(A) taking a sequence to its quotient term, the right column of (7.3.1) being a morphism of Q(A). Record that the left column is an admissible monomorphism from the sub term of the target into that of the source and the middle column an admissible monomorphism from the total term of the source into that of the target, so that EA carries no exact sub- or total-term functors to A.
2. Prove that the quotient functor to Q(A) is fibred and identify the fibre over the zero object with the groupoid of isomorphisms.
3. Over id_C, the intermediate quotient is C and the kernel and middle arrows are isomorphisms by the kernel–cokernel property. Over C=0, the map from the kernel to the middle term is an isomorphism, giving the displayed equivalence with Core(A).
4. Use biproducts of conflations for the Core(A)-action; the action commutes with t and with its morphisms. The pullback, fibre-localisation and contractibility arguments are separate nodes below.

**API.**

| Declaration | Contract |
| --- | --- |
| ExtCat | The extension category of an exact category. |
| ExtCat.quot | The quotient-term functor, which is the one fibred over Q(A). |
| ExtCat.fibre_zero | The fibre over the zero object is the groupoid of isomorphisms. |

**Uses.**

- K.2:plus, the plus-equals-Q theorem: The theorem is proved by applying the fibration criterion to the localised extension category.
- Weibel IV.7.3 to 7.5, as distinct from V.1.1.1: The category of conflations with ordinary morphisms, not this one, is the extension category of the Additivity Theorem and the second term of the S-construction; the two are kept apart.

**Checks.**

- **fibre_is_iso_groupoid** (degenerate): The fibre over the zero object is the groupoid of isomorphisms.
- **split_needed** (non-example): For a non-split exact category the comparison category is not connected, so the hypothesis cannot be dropped.
- **quotient_functor_to_Q** (computation): The right column of every morphism (7.3.1) is a morphism of Q(A), and composing morphisms of EA composes these columns, so taking the quotient term is a functor t from EA to Q(A).
- **not_directly_fibred** (non-example): The fibration criterion does not apply to the extension category over Q(A) itself unless the category is zero; the localised functor must be used.
- **not_the_conflation_category** (non-example): EA is not the category of conflations: its morphisms over an identity of Q(A) are pairs of isomorphisms (Weibel 7.4), whereas a conflation X ↣ X ↠ 0 with X nonzero has the zero endomorphism in the category of conflations; a formalisation that reused the category of conflations here would lose the identification of the fibre over 0 with the groupoid of isomorphisms.

**Acceptance.**

- E_0 is equivalent to Core(A), preserving automorphisms.
- The quotient-column functor and direct-sum action preserve identity and composition.
- For a nonzero object X, the ordinary conflation (X = X → 0) has a zero endomorphism, while its EA fibre has only invertible endomorphisms.

**Prerequisites:** `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`, `mathlib:CategoryTheory.Core`.

**Sources:** Weibel.KBook.IV, Definition 7.3 with (7.3.1), p. IV.62 — The extension category.; Weibel.KBook.IV, §7, the opening of the section, p. IV.61 — The place where the source fixes the split-exactness hypothesis of this construction..

#### Cartesian lifts of Q-morphisms in the extension category

`GeneralAlgebraicKTheory:K.2:plus/extension-cartesian-lifts` · construction

For φ:C′→C represented by C′↞C″↣C and E=(A↣B↠C), form B′=B×_C C″ and let A′ be the kernel of the composite deflation B′↠C″↠C′. Then φ*E=(A′↣B′↠C′) and the induced Q-type diagram gives a cartesian arrow φ*E→E over φ. Pullback choices yield canonically isomorphic functors E_C→E_C′; identity and composition hold up to coherent natural isomorphism. The Core(A)-action commutes with these lifts, so localisation by it remains fibred with fibre Core(A)⁻¹E_C.

**Hypotheses and conventions.**

- Choose representatives and pullbacks; do not assert literal choice-free equality of functors.
- Kernel inclusions and middle inclusions are admissible by base change and composition of deflations.

**Construction or proof.**

1. Base change the conflation along C″↣C. Compose the resulting deflation with C″↠C′ and take its admissible kernel A′. The induced A→A′ and B′→B are inflations; the diagram has the orientation of IV.7.3.1.
2. For any EA-arrow whose base factors through φ, its middle arrow factors uniquely through B′ by the pullback, and the kernel arrow then factors by the kernel universal property. This proves the cartesian universal property, not just existence of a diagram.
3. Apply universal properties to maps in E_C. Uniqueness gives representative independence, natural isomorphisms for id and composition, and the associativity coherence for triple composition.
4. Pullback along C″ commutes with adding a split summand on kernel and middle terms. The resulting natural isomorphisms respect the action and cartesian arrows; use H.4’s cartesian-action localisation theorem to identify the localised fibres.
5. For 0↣C the lift sends (A↣B↠C) to A=A→0. For 0↞C it sends it to B=B→0. These two calculations are used in the fibration criterion.

**API.**

| Declaration | Contract |
| --- | --- |
| ExtCat.baseChange | The fibre functor φ* defined by pullback and composite kernel. |
| ExtCat.cartesianArrow | The canonical cartesian arrow φ*E→E over φ. |
| ExtCat.baseChange_comp | Coherent natural isomorphism (ψφ)*≅φ*ψ*, with conventions fixed by domains. |
| ExtCat.baseChange_zero_inflation | Base change along 0↣C extracts the kernel. |
| ExtCat.baseChange_zero_deflation | Base change along 0↞C extracts the middle term. |

**Uses.**

- The consuming nodes listed in this roadmap: For φ:C′→C represented by C′↞C″↣C and E=(A↣B↠C), form B′=B×_C C″ and let A′ be the kernel of the composite deflation B′↠C″↠C′. Then φ*E=(A′↣B′↠C′) and the induced Q-type diagram gives a cartesian arrow φ*E→E over φ. Pullback choices yield canonically isomorphic functors E_C→E_C′; identity and composition hold up to coherent natural isomorphism. The Core(A)-action commutes with these lifts, so localisation by it remains fibred with fibre Core(A)⁻¹E_C.

**Checks.**

- **cartesian_identity** (degenerate): Lifting id_C gives a sequence canonically isomorphic to E.
- **cartesian_direction** (non-example): An arrow E→φ*E would project from C to C′ and cannot lie over φ when C′ and C differ.
- **zero_lifts** (computation): For a split extension A↣A⊕C↠C the two zero lifts yield A and A⊕C respectively.

**Acceptance.**

- The cartesian arrow projects to φ:C′→C, hence must run from φ*E to E.
- The two lifts from zero recover kernel and middle term respectively.

**Prerequisites:** `GeneralAlgebraicKTheory:K.2:plus/extension-category-and-the-fibration`, `tauceti:TauCeti.ExactStructure.conflation_baseChange`, `tauceti:TauCeti.ExactStructure.conflation_comp_of_isPullback`, `StableHomotopyKTheory:H.4`.

**Sources:** Weibel.KBook.IV, Lemma 7.7, Exercise 7.2 and Exercise 7.5, pp. IV.63–65; text and p.63 image read 2026-10-01 — The cartesian construction; the final proof sentence reverses the arrow and is corrected by source issue E-extension-base-change-direction..

#### Monoidal products in the extension fibres

`GeneralAlgebraicKTheory:K.2:plus/extension-fibre-product` · construction

For E_i=(A_i ↣ B_i ↠ C) in E_C, define E_1 * E_2=(A_1⊕A_2 ↣ B_1×_C B_2 ↠ C). Its unit is (0 ↣ C = C). This is a symmetric monoidal groupoid. The split-extension functor η_C : Core(A) → E_C, A ↦ (A ↣ A⊕C ↠ C), is faithful and strong symmetric monoidal. If A is split exact every object of E_C is isomorphic to η_C(A); consequently the action category ⟨Core(A), E_C⟩ is connected.

**Hypotheses and conventions.**

- Pullbacks of admissible epimorphisms and the pinned kernel–cokernel and biproduct lemmas are used.
- Split exactness is required only for the last connectedness assertion.

**Construction or proof.**

1. Pull back B_1↠C along B_2↠C. The induced map to C is a deflation and its kernel is A_1⊕A_2: the two inclusions identify the kernel through the pullback universal property.
2. Define products of arrows by the same universal property. Obtain unit, associator and symmetry from iterated pullbacks over C; verify the coherence diagrams by their projections.
3. The pullback of two split extensions identifies with (A_1⊕A_2)⊕C. These identifications make η_C strong monoidal. Its middle arrow retains the original isomorphism of A, so it is faithful.
4. A chosen splitting of E identifies it with η_C(A). In the action category, translation by A relates this object to the unit, proving connectedness. No such argument is made for a nonsplit extension.

**API.**

| Declaration | Contract |
| --- | --- |
| ExtFibre.tensor | The displayed pullback product in E_C. |
| ExtFibre.unit | The sequence 0 ↣ C = C. |
| ExtFibre.split | The faithful symmetric monoidal split-extension functor η_C. |
| ExtFibre.splitEssentiallySurjective | For split exact A, every E_C-object is isomorphic to η_C(A₀). |

**Uses.**

- The consuming nodes listed in this roadmap: For E_i=(A_i ↣ B_i ↠ C) in E_C, define E_1 * E_2=(A_1⊕A_2 ↣ B_1×_C B_2 ↠ C). Its unit is (0 ↣ C = C). This is a symmetric monoidal groupoid. The split-extension functor η_C : Core(A) → E_C, A ↦ (A ↣ A⊕C ↠ C), is faithful and strong symmetric monoidal. If A is split exact every object of E_C is isomorphic to η_C(A); consequently the action category ⟨Core(A), E_C⟩ is connected.

**Checks.**

- **fibre_product_zero** (degenerate): At C=0 the product identifies with direct sum.
- **fibre_product_split** (computation): η_C(A₁)*η_C(A₂) ≅ η_C(A₁⊕A₂), compatibly with quotient C.
- **nonsplit_fibre** (non-example): A nonsplit extension is not isomorphic to η_C of its kernel.

**Acceptance.**

- At C=0, * is direct sum on Core(A).
- The product retains the common quotient C rather than replacing it by C⊕C.

**Prerequisites:** `GeneralAlgebraicKTheory:K.2:plus/extension-category-and-the-fibration`, `tauceti:TauCeti.ExactStructure.conflation_baseChange`, `tauceti:TauCeti.ExactStructure.conflation_biprod`.

**Sources:** Weibel.KBook.IV, Lemma 7.5 and Remark 7.5.2, pp. IV.62–63; read in full 2026-10-01 — The product, unit, faithful split functor and split-exact connectedness..

#### Contractibility of the localised extension-action category

`GeneralAlgebraicKTheory:K.2:plus/localised-extension-fibre-equivalence` · theorem

For split exact A and S=Core(A), the map B(S⁻¹S)→B(S⁻¹E_C) induced by η_C is a homotopy equivalence. The action-category fibre L=⟨S,E_C⟩ is contractible: its monoidal product makes BL a connected H-space and the diagonal gives id≃[2]; the homotopy inverse cancels one summand to give id≃0.

**Hypotheses and conventions.**

- The generic action-localisation fibration S⁻¹S→S⁻¹E_C→⟨S,E_C⟩ is supplied by H.4 under its faithful-action and translation-injectivity conditions.
- Use CW realisation and the connected, homotopy associative H-space inverse supplied by H.4.

**Construction or proof.**

1. Apply the product and connectedness node. The action-category product is induced by *; direct sums give the compatible action.
2. For E=(A↣B↠C), the maps A→A⊕A and B→B×_C B are diagonals. Their target is E*E, and the action-category morphism gives a natural transformation from identity to doubling.
3. Realise to obtain id_BL≃[2]. Compose with the H-space inverse in one summand: x*(inverse x) is null and (x*x)*(inverse x)≃x by associativity and the inverse laws, proving id_BL null-homotopic.
4. Use the generic localisation fibration and contractibility of its base to identify its fibre with its total space.

**Acceptance.**

- The diagonal contraction takes place in the action category, not in E_C itself.
- For a nonsplit A, connectedness fails and this argument is unavailable.

**Prerequisites:** `GeneralAlgebraicKTheory:K.2:plus/extension-fibre-product`, `StableHomotopyKTheory:H.4`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`.

**Sources:** Weibel.KBook.IV, Proposition 7.6, p. IV.63; read in full 2026-10-01 — The diagonal contraction and localisation fibration; the generic homotopy and action results have supplier requests..

#### The localised extension category fibres over Q

`GeneralAlgebraicKTheory:K.2:plus/localised-extension-fibration` · theorem

For split exact A and S=Core(A), B(S⁻¹S)→B(S⁻¹EA)→BQA is a homotopy fibration based at 0. Every base-change functor between localised fibres is a homotopy equivalence.

**Hypotheses and conventions.**

- The fibre-localisation and fibre-equivalence constructions above are used.
- Quillen Theorem B and Q-factorisation are imported.

**Construction or proof.**

1. For 0↣C, compose η_C with base change. On S it extracts A, so after localisation it is identity. Fibre equivalence makes this base change an equivalence.
2. For 0↞C, the same composite is translation A↦A⊕C on S⁻¹S. Translation is invertible in the localised group-completion category, so this base change is an equivalence.
3. For any φ:C′→C, use φ∘(0↣C′)=(0↣C) or φ∘(0↞C′)=(0↞C) for the two distinguished classes; apply two-out-of-three to the coherent base-change composites. Factor a general Q-arrow into those two classes.
4. Apply Theorem B to the fibred localised functor and identify the fibre at zero with S⁻¹E_0≃S⁻¹S.

**Acceptance.**

- The middle fibre functor is localised: Theorem B is not applied directly to EA→QA.
- Naturality is up to the coherent isomorphisms of cartesian lifts.

**Prerequisites:** `GeneralAlgebraicKTheory:K.2:plus/extension-cartesian-lifts`, `GeneralAlgebraicKTheory:K.2:plus/localised-extension-fibre-equivalence`, `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`, `StableHomotopyKTheory:H.2/quillen-theorem-b`, `StableHomotopyKTheory:H.4`.

**Sources:** Weibel.KBook.IV, Theorem 7.8 and proof, pp. IV.63–64; read in full 2026-10-01 — The two zero lifts and the homotopy-fibration criterion..

#### Contractibility of the extension category and its localisation

`GeneralAlgebraicKTheory:K.2:plus/extension-category-contractibility` · theorem

For every exact A, BEA is contractible. For split exact A, B(S⁻¹EA) is also contractible; combined with the localised fibration it identifies B(S⁻¹S) with ΩBQA.

**Hypotheses and conventions.**

- Let iQA have the objects of A and only admissible inflations as arrows.
- Subdivision preserves realisation by H.1–H.2, and H.4 supplies invariance under localising an already invertible action.

**Construction or proof.**

1. Send A↣B↠C to the arrow A↣B of iQA. Quotient objects are unique up to the kernel–cokernel isomorphism, and the diagram (7.3.1) is precisely a subdivision morphism with the source end reversed. This gives EA≃Sub(iQA).
2. The zero object is initial in iQA; apply H.1’s initial-object contraction and H.2’s subdivision equivalence to obtain BEA contractible.
3. On a contractible classifying space each translation of the S-action is a homotopy equivalence. H.4’s action-localisation theorem therefore makes EA→S⁻¹EA an equivalence on realisation.
4. Combine with the localised fibration and its canonical connecting map to get the plus-versus-Q comparison, naturally in split-exact functors.

**Acceptance.**

- No split-exactness assumption is used for contractibility of BEA.
- The equivalence with subdivision respects the unusual variance of EA morphisms.

**Prerequisites:** `GeneralAlgebraicKTheory:K.2:plus/extension-category-and-the-fibration`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`, `StableHomotopyKTheory:H.2`, `StableHomotopyKTheory:H.4`.

**Sources:** Weibel.KBook.IV, Proof of Theorem 7.1 and Exercise 7.3, pp. IV.64–65; read in full 2026-10-01 — The subdivision equivalence and the contraction; exercise 7.3 is expanded here..

#### The plus-equals-Q theorem

`GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q` · theorem · planet: **The plus-equals-Q theorem**

For a split exact category with isomorphism groupoid S, the LOOP SPACE of the realisation of Q(A) is the realisation of the localisation of S at itself, so the K-groups of A are those of the symmetric monoidal groupoid S in every non-negative degree. For the finitely generated projective modules over a ring this gives that the loop space of the realisation of Q is the product of the zeroth K-group with the plus construction on the classifying space of the stable general linear group, and hence that the K-groups defined from the Q-construction agree with those defined from the plus construction in every degree. The product description is a description of the space after choosing representatives of the components; it is not a claim that the infinite-loop structure splits as a product, and the translations between components are not natural.

**Hypotheses and conventions.**

- A is split exact and S is its groupoid of isomorphisms; the localisation is the one at the translation action, which is faithful.
- The identification with the product is at the level of spaces, after a choice of component representatives, exactly as the stage text demands.
- The comparison commutes with ring maps and with block sum; it is not asserted to commute with the noncanonical translations between components.

**Construction or proof.**

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

**Prerequisites:** `GeneralAlgebraicKTheory:K.2:plus/extension-category-and-the-fibration`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `StableHomotopyKTheory:H.4`, `GeneralAlgebraicKTheory:K.2:plus/localised-extension-fibration`, `GeneralAlgebraicKTheory:K.2:plus/extension-category-contractibility`.

**Sources:** Weibel.KBook.IV, Theorem 7.1 and Corollary 7.2, pp. IV.61 to IV.62 — The theorem: it is the LOOP SPACE ΩBQA that is B(S⁻¹S); the loop-space convention requires the Ω.

#### Cofinality: a finitely generated projective has a complement making the sum free

`GeneralAlgebraicKTheory:K.2:plus/cofinality-of-projective-modules` · lemma

Every finitely generated projective module over a ring is a direct summand of a finite free module, so it has a complement whose sum with it is free, and that complement is again finitely generated projective. Consequently the monoidal inclusion of the finite free modules into the groupoid of finitely generated projectives is cofinal, and the group-completion cofinality theorem (Weibel, Cofinality Theorem IV.4.11, owned by StableHomotopyKTheory H.4) gives, through the plus-equals-Q theorem, that the K-groups of the split exact category of finite free modules and of the finitely generated projectives agree in every positive degree, while their zeroth groups need not. This is why the stable general linear group, which sees only free modules, detects the higher K-groups of a ring even when projectives are not free. Mathlib has the module-theoretic half; this node adds the K-theoretic consequence without using the late exact-category cofinality theorem of K.3, which comes after K.4.

**Hypotheses and conventions.**

- The ring has a unit; the module is finitely generated and projective.
- The complement is the kernel of the surjection from the finite free module, which is finitely generated and projective because the surjection splits.
- The finite free modules form a full subcategory of the finitely generated projectives closed under extensions (an extension of free modules splits), so it is a split exact category, and its automorphism groups are those computed in the projectives; these are the hypotheses of Cofinality Theorem IV.4.11(b).
- The K-theoretic conclusion is only for the groups in positive degrees; in degree zero the free category has a proper subgroup in general.

**Construction or proof.**

1. Record Mathlib's statement: a finitely generated projective module is a retract of a finite free module, with the two maps composing to the identity.
2. Deduce that the kernel of the retraction is the image of the complementary idempotent, hence finitely generated and projective, and that the sum of the module with it is free.
3. Conclude that the inclusion of the groupoid of finite free modules into the groupoid of finitely generated projectives is a cofinal monoidal functor with the same automorphism groups.
4. Apply the group-completion cofinality theorem (H.4) to identify the basepoint components of the two group completions, and transport through the plus-equals-Q theorem for the two split exact categories to get the agreement of the positive K-groups.
5. For a counterexample in degree zero, choose a projective whose K₀ class is outside the subgroup generated by free modules, for example a nonprincipal invertible ideal over a Dedekind domain with nontrivial Picard group. Its determinant detects the missing class. Non-freeness alone is insufficient: a non-free stably free module has a free K₀ class. The general exact-category cofinality theorem, K.3/cofinality-degree-zero-correction, recovers the positive-degree statement after K.4 and is not needed here.

**Acceptance.**

- Every finitely generated projective has a complement making the sum free.
- The higher K-groups of the free and of the projective categories agree; the zeroth ones need not.
- The degree-zero counterexample uses a nontrivial determinant class over a Dedekind domain; a non-free stably free module is not a counterexample.
- The proof uses only group completion and the plus comparison, not Waldhausen K-theory.

**Prerequisites:** `mathlib:Module.Finite.exists_comp_eq_id_of_projective`, `mathlib:LinearMap.ker_eq_range_of_comp_eq_id`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `StableHomotopyKTheory:H.4`.

**Sources:** Weibel.KBook.IV, Cofinality Theorem 4.11 with its proof, and the paragraph before Corollary 4.11.1, pp. IV.44–45 — The cofinality this node proves and the group-completion theorem it applies; Corollary 4.11.1 is the resulting product description..

#### The early ring model: functorial connective K-theory of unital rings

`GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring` · construction

For every unital, possibly noncommutative ring R : Type u, let P(R) be the pinned full subcategory (TauCeti.finiteProjectiveModules R).FullSubcategory with the pinned exact structure finiteProjectiveModulesExactStructure R, which is the split one (finiteProjectiveModulesExactStructure_eq_split), and the pinned EssentiallySmall.{u} instance. Set K(R) := KSpace(P(R)) = ΩBQ(P(R)) on the K.1 small model and K_n(R) := KGroup(P(R), n), in universe u. A unital ring map f : R → S induces K(f) := K(f_!) through the exact scalar-extension functor of K.2:plus/scalar-extension-and-functoriality, with K(id) ≃ id and K(g ∘ f) ≃ K(g) ∘ K(f) through its unit and composition isomorphisms. The model has four further properties, each the ring form of a generic K.1 statement: (i) π₀ K(R) ≅ RingK0 R ≅ ExactK0(P(R)), sending [P] to the class of P, naturally in R; (ii) the projections induce K_n(R × S) ≅ K_n(R) × K_n(S) for every n ≥ 0; (iii) for a small filtered diagram of unital rings with colimit R, colim K_n(R_i) ≅ K_n(R), computed on the equivalent categories of idempotent matrices, which are strictly functorial; (iv) Hom_R(−, R) is an exact equivalence P(R)^op ≃ P(R^op), so K_n(R^op) ≅ K_n(R). This one node owns the ring model: it depends neither on the plus comparison nor on the nonconnective theory, K.5 imports it, and the late K.6 and K.7 import it rather than rebuilding it.

**Hypotheses and conventions.**

- Unital associative rings and unital maps in one universe u; no commutativity, noetherian, flatness or invariant-basis-number hypothesis. The noncommutative scalar extension is KTheoryLowDegrees:Z.1/extend-scalars and is not in the pinned libraries.
- Universe and smallness: P(R) is essentially u-small by the pinned instance, K(R) is formed on its K.1 small model, and K(R), K_n(R) and ExactK0(P(R)) live in universe u; the choice of model is irrelevant by K.1/small-models-and-transport.
- Filtered diagrams are small; finite idempotent matrices, the matrices between them and the finitely many equations among these descend to a stage. The transition maps of the diagram need not be injective; the source's instance is a filtered union of subrings.
- Duality: for P in P(R), Hom_R(P, R) is a finitely generated projective right R-module, that is a left R^op-module, and P → Hom_{R^op}(Hom_R(P, R), R) is an isomorphism; the functor is contravariant.

**Construction or proof.**

1. Import the pinned exact category P(R) with its essentially small instance and apply K.1 to its small model. Construct K(f) from the exact functor f_! of K.2:plus through K.1's functoriality, and obtain K(id) ≃ id and K(g ∘ f) ≃ K(g) ∘ K(f) from the natural isomorphisms of f_!, since isomorphic exact functors induce homotopic maps (K.1).
2. Degree zero: K.1/pi1-BQ-equals-K0 gives π₀ K(R) ≅ ExactK0(P(R)), and KTheoryLowDegrees:Z.1/ring-k0-exact gives RingK0 R ≃ ExactK0(P(R)); both send [P] to the class of P, and naturality in f holds because RingK0.map f (Z.1/ring-k0-map) and the map of f_! agree on classes (ExactK0.hom_ext).
3. Products: the central idempotents (1, 0) and (0, 1) of R × S split each finitely generated projective module as the sum of its two parts; scalar extension along the two projections is an exact equivalence P(R × S) ≃ P(R) × P(S), and K.1/elementary-properties-of-K-groups for direct sums gives the product formula in every degree.
4. Filtered colimits: replace P(R) by the equivalent idempotent-matrix category, the idempotent completion of the finite free modules (KTheoryLowDegrees:Z.1/projective-karoubi), which is strictly functorial in ring maps by applying them to matrix entries and is compatible with f_! because the scalar extension of the idempotent module P(e) is P(f(e)) (KTheoryLowDegrees:Z.1/extend-scalars-finite-projective (c)); objects, morphisms and equations descend to a stage, so it commutes with filtered colimits of rings as an exact category, and K.1's filtered-colimit statement with the small-model independence gives colim K_n(R_i) ≅ K_n(R).
5. Opposite ring: Hom_R(−, R) is additive, sends R to R^op and hence finite free modules to finite free modules and summands to summands, and the evaluation map to the double dual is an isomorphism (checked on R and extended to summands), so it is an equivalence P(R)^op ≃ P(R^op), exact for the split structures. K.1's statement for opposite categories then gives K_n(R^op) ≅ K_n(R).
6. Leave the naturality of the plus comparison to its own node, and record that K.5's relative ring theory uses this K(R) and the actual map K(f).

**API.**

| Declaration | Contract |
| --- | --- |
| KSpace.ofRing | The K-theory space K(R) = ΩBQ(P(R)) of a unital ring, in the ring's universe. |
| KSpace.ofRing_map | The map K(f) induced by a unital ring homomorphism through projBaseChange. |
| KSpace.ofRing_map_id | The identity ring homomorphism induces the identity, with the small-model comparison. |
| KSpace.ofRing_map_comp | Composition of unital ring maps induces composition of K-space maps up to the specified natural homotopy. |
| KGroup.ofRing_zero_equiv | π₀ K(R) ≅ RingK0 R ≅ ExactK0(P(R)), natural in R, sending [P] to its class. |
| KGroup.ofRing_prod | Compatibility with finite products of rings. |
| KGroup.ofRing_colimit | Compatibility with filtered colimits of rings, through the idempotent-matrix model. |
| KGroup.ofRing_op | K_n(R^op) ≅ K_n(R), induced by the exact duality P(R)^op ≃ P(R^op). |

**Uses.**

- K.5: Relative K-theory is the homotopy fibre of the map this functor induces, and the Milnor-square sequence identifies its K₀ end through the degree-zero comparison.
- K.6 and K.7: The nonconnective extension, Morita invariance and the product and colimit statements for rings import this functor instead of redefining it.
- The consumer roadmaps: Every roadmap that speaks of the K-theory of a ring imports this functor.

**Checks.**

- **product_ring** (computation): The two projections R × S → R,S give the product isomorphism in degree zero and every higher degree.
- **scalar_identity_composition** (compatibility): Identity and two composable ring maps give the same K-map as the corresponding tensor unit/associativity isomorphisms.
- **nonflat_projectives** (non-example): ℤ → ℤ/2 induces exact scalar extension on the split projective category although it is not flat on all modules.
- **filtered_idempotent_descent** (computation): An idempotent matrix over a filtered colimit and an equality between two maps descend at a sufficiently large stage.
- **degree_zero_ring** (compatibility): The degree-zero group of K(R) is RingK0 R, and K₀(f) is RingK0.map f; for R = ℤ it is ℤ generated by [ℤ].
- **duality_not_identity** (non-example): For a commutative ring the isomorphism K₀(R^op) ≅ K₀(R) induced by duality, composed with R^op = R, sends [P] to [Hom_R(P, R)]; for a Dedekind domain it inverts the ideal class of an invertible ideal, so it is not the identity when the class group has an element of order greater than two.

**Acceptance.**

- The two projections R × S → R, S give the product isomorphism in degree zero and every higher degree.
- Identity and two composable ring maps give the same K-map as the corresponding tensor unit and associativity isomorphisms.
- In degree zero the model is RingK0 R, with K₀(f) = RingK0.map f.
- An idempotent matrix over a filtered colimit, and an equality between two maps, descend at a sufficiently large stage.
- The isomorphism K_n(R^op) ≅ K_n(R) is induced by the contravariant duality, not by an identification of the two categories.

**Prerequisites:** `GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`, `GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0`, `GeneralAlgebraicKTheory:K.1/small-models-and-transport`, `KTheoryLowDegrees:Z.1/projective-karoubi`, `KTheoryLowDegrees:Z.1/extend-scalars-finite-projective`, `KTheoryLowDegrees:Z.1/ring-k0-exact`, `KTheoryLowDegrees:Z.1/ring-k0-map`, `tauceti:TauCeti.finiteProjectiveModules`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split`, `tauceti:TauCeti.ExactK0.hom_ext`.

**Sources:** Weibel.KBook.IV, Definition 6.3.2 and Elementary properties 6.4, pp. IV.55 to IV.56 — The functor and the two compatibilities.; Weibel.KBook.IV, Elementary Properties 6.4, the ring instances, pp. IV.55–56 — The opposite-ring statement and the idempotent-matrix model; the source states the colimit for a filtered union of subrings, and the node proves it for filtered colimits by the same descent..

#### Early absolute K0/K1 comparison for rings

`GeneralAlgebraicKTheory:K.2:plus/zero-one-ring-comparison` · comparison

For every unital associative ring R, the exact-projective K-space has π0 naturally RingK0(R) and π1 at zero naturally GL(R)/E(R). The π1 comparison sends a stabilized automorphism to its plus/Q loop; scalar extension commutes with both comparisons. This is the degree0/1 adapter, not a new classical K0/K1 construction.

**Hypotheses and conventions.**

- Use finite projectives with their split exact structure. Classical projective K0 and stable GL/E are supplied by KTheoryLowDegrees U.1/U.2.

**Construction or proof.**

1. The maximal-tree Q calculation supplies π0 of ΩBQ(P(R)) as projective K0.
2. Apply the early plus-equals-Q comparison and group-completion cofinality of free modules to identify the basepoint component with BGL(R)+.
3. The plus fundamental-group theorem identifies π1 with GL(R)/E(R), with the quotient induced by the actual BGL map. In the plus/Q comparison the automorphism square represents this loop, as IV7.2 and Ex7.9 specify.
4. Ring maps induce the stable matrix map, preserve E, and induce scalar extension on projectives. Naturality of the comparison proves the two commuting squares without choosing a natural splitting of all components.

**Acceptance.**

- Available before K.5 and U.6. Neither the relative π1 theorem nor the K2/Steinberg/Suslin aggregator is used.

**Prerequisites:** `GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `GeneralAlgebraicKTheory:K.2:plus/cofinality-of-projective-modules`, `KTheoryLowDegrees:U.1`, `KTheoryLowDegrees:U.2`, `StableHomotopyKTheory:H.3`.

**Sources:** Weibel.KBook.IV, Definition1.1–1.1.2,chapterpp2–3;Theorem7.1/Cor7.2,pp61–62;Ex7.9,p65 — Degree0/1 statements and ring-map proof read in the author chapter; the automorphism-square identification was read with Ex7.9. This node combines those inputs, without importing the subsequent relative comparison..

#### The symmetric monoidal projective model

`GeneralAlgebraicKTheory:K.2:plus/symmetric-monoidal-projective-model` · construction · planet: **Projective core group completion**

For a unital ring R, let P(R)^≃ be the maximal groupoid of finitely generated projective right R-modules with direct sum. Its symmetric monoidal group completion is a connective spectrum K⊕(R). There is a natural equivalence Ω∞K⊕(R)≃ΩBQ(P(R)), and after S-spectrum assembly an equivalence of connective spectra K⊕(R)≃Kconn(R). The comparison takes an object P to its ExactK0 class and its automorphisms to their K1 classes.

**Hypotheses and conventions.**

- The exact structure is the pinned split exact finite-projective structure, transported to right modules through Rᵒᵖ. Use the core, not the category of all module maps.
- Symmetric monoidal group completion, spectra and their recognition are H.4/H.5 inputs. Tensor product is a separate biexact operation; direct sum is the group-completed operation.

**Construction or proof.**

1. Apply H.4 group completion to the essentially small core with direct sum.
2. Use the existing free-module cofinality and plus–Q comparison, matching the object and stabilized automorphism maps.
3. Use the S–Q comparison and H.5 recognition to promote the infinite-loop-space comparison to connective spectra, naturally in arbitrary unital ring maps.

**API.**

| Declaration | Contract |
| --- | --- |
| KTheory.projectiveCoreCompletion | Group-complete the symmetric monoidal core of finite projectives. |
| KTheory.projectiveCoreCompletion_map | Scalar extension induces maps respecting identities, composition and direct sum. |
| KTheory.projectiveCoreCompletion_Q | The natural comparison with ΩBQ preserves object classes and automorphism loops. |
| KTheory.projectiveCoreCompletion_S | After H.5 assembly the Q comparison agrees with the S-model comparison. |

**Uses.**

- Bhatt–Scholze §12 and determinant construction: Provides the K-theory domain while the determinant target remains a consumer.
- GeneralAlgebraicKTheory:K.7/compared-model-filtered-continuity: Makes continuity a comparison of models, not only of abstract groups.

**Checks.**

- **field_components** (computation): π0K⊕(k)=Z and the one-dimensional module has class 1.
- **field_automorphisms** (computation): π1K⊕(k)=k×, with a scalar u giving its unit class.
- **zero_ring** (degenerate): K⊕ of the zero ring is contractible.
- **core_matters** (non-example): The nerve of the category of all projectives and all homomorphisms is contractible because 0 is initial; for k=F3 it cannot give K1=C2.

**Acceptance.**

- For a field k, π0 is Z by rank and π1 is k×.
- The zero ring has contractible K⊕.

**Prerequisites:** `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `GeneralAlgebraicKTheory:K.2:plus/cofinality-of-projective-modules`, `GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality`, `GeneralAlgebraicKTheory:K.4:construction/iS-versus-Q`, `StableHomotopyKTheory:H.4`, `StableHomotopyKTheory:H.5:S-delooping`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split`.

**Sources:** BS.Grassmannian, Definitions 12.13 and 12.16, pp.58–59; §12.2, pp.55–57 — The symmetric monoidal model and its projective-module specialization, compared with the existing Q/plus/S models..

### K.3 — Exact-category theorems and Dedekind specialization

Prove additivity, general resolution, devissage and abelian Serre localization with natural boundaries. Transfers retain finite resolutions by finitely generated projectives. The cofinality and hermitian components follow their stated suppliers. The hermitian targets retain canonical residue lines, characteristic-two symmetric theory and the quadratic restriction.

#### The 3×3 lemma for exact categories

`GeneralAlgebraicKTheory:K.3/three-by-three-lemma` · lemma

For the pinned exact structure, consider a commutative 3×3 diagram whose three columns are conflations. If either (i) the middle row and one of the outer rows are conflations, or (ii) the two outer rows are conflations and the composite of the two maps of the middle row is zero, then the remaining row is a conflation.

**Hypotheses and conventions.**

- E is the pinned TauCeti.ExactStructure; no ambient abelian category, no weak idempotent completeness and no form of Quillen's axiom (c) is assumed.
- In case (ii) the vanishing of the middle composite is a hypothesis: it is what identifies the first map of the middle row as a kernel, and without it the middle row need not be a complex.

**Construction or proof.**

1. Case (i) with the first two rows conflations (the other case is dual): push out the first row along A′ → A (E2) to factor the morphism of the first two rows through a conflation A ↣ D ↠ C′ with the same quotient (ExactStructure.conflation_cobaseChange; Bühler, Proposition 3.1); both squares of the factorisation are bicartesian (ExactStructure.bicartesianSq_of_isPushout_of_isInflation and its dual).
2. Identify the cokernels of B′ ↣ D and of D ↣ B through the maps induced out of the pushout, and prove the one commutativity not given by construction from the pushout property of the square on A′, B′, A and D.
3. Conclude with the Noether isomorphism for exact categories (ExactStructure.exists_conflation_comp; Bühler, Lemma 3.5) that the third row is a conflation.
4. Case (ii): push out under the second map of the first row and the middle column, obtain a map to the third term of the middle row and show, by the pullback characterisation (Bühler, Proposition 2.12), that it is a deflation and that the middle row's second map is one; then use the vanishing composite and the dual characterisation with the kernel of a composite deflation (ExactStructure.conflation_comp_of_isPullback; Bühler, Proposition 2.15) to show that the first map of the middle row is its kernel.

**Acceptance.**

- Both cases hold in every exact category, with no abelian embedding.
- In case (ii) the hypothesis that the middle composite vanishes cannot be dropped.
- For the canonical exact structure of an abelian category the statement is the classical nine lemma.

**Prerequisites:** `tauceti:TauCeti.ExactStructure`, `tauceti:TauCeti.ExactStructure.conflation_cobaseChange`, `tauceti:TauCeti.ExactStructure.conflation_baseChange`, `tauceti:TauCeti.ExactStructure.bicartesianSq_of_isPushout_of_isInflation`, `tauceti:TauCeti.ExactStructure.exists_conflation_comp`, `tauceti:TauCeti.ExactStructure.conflation_comp_of_isPullback`.

**Sources:** Buhler.ExactCategories, Corollary 3.6 (3 × 3-Lemma) with its proof, pp. 13–14 (arXiv v2) — The statement; the proof steps follow Bühler's two cases.; Buhler.ExactCategories, Proposition 3.1 and Lemma 3.5, pp. 12–13 (arXiv v2) — The factorisation of case (i); Lemma 3.5 is the Noether isomorphism that Tau Ceti already has..

#### The exact category of conflations

`GeneralAlgebraicKTheory:K.3/exact-category-of-conflations` · construction

For an exact structure E on a preadditive category A with a zero object and binary biproducts, the pinned category of conflations (TauCeti.ExactStructure.ConflationCategory: the full subcategory of short complexes on the conflations, with all morphisms of short complexes) carries an exact structure whose conflations are the sequences σ′ → σ → σ″ of conflations whose sub-term, total-term and quotient-term components are E-conflations. With it, written E(A), the three projection functors s, t, q to A are exact, the coproduct functor ∐ : A × A → E(A), (X, Z) ↦ (X ↣ X ⊞ Z ↠ Z), is exact, s ↣ t ↠ q is a short exact sequence of exact functors, and it is universal: exact functors B → E(A) correspond to short exact sequences of exact functors B → A. This is the extension category of Weibel V.1.1.1 and II.9.3, on which the Additivity Theorem is proved; it is not the category EA of IV.7.3 that K.2:plus uses for the plus comparison.

**Hypotheses and conventions.**

- E is the pinned TauCeti.ExactStructure; the construction is intrinsic in E0–E2, with no ambient abelian category and no form of Quillen's axiom (c).
- A conflation of E(A) is a sequence σ′ → σ → σ″ of objects and morphisms of the pinned category of conflations whose three columns are E-conflations; its rows are conflations because they are objects of that category.
- For K-theory, A is essentially small; then so is E(A).

**Construction or proof.**

1. Kernel–cokernel pairs: a morphism of conflations whose composite into σ″ vanishes factors uniquely through σ′ componentwise, because each column is a kernel–cokernel pair, and the components commute with the row maps because the column inflations are monomorphisms; dually for cokernels. Closure under isomorphism is componentwise.
2. E0 and E0op: the identity of a conflation is componentwise the identity, whose columns are conflations.
3. E1: a composite of two inflations of E(A) is componentwise a composite of inflations (E1), and its componentwise cokernels form a conflation by the 3×3 lemma (i) applied to the first two rows (K.3/three-by-three-lemma). E1op is dual.
4. E2: for an inflation σ′ ↣ σ with cokernel σ″ and any morphism σ′ → ρ take componentwise pushouts, which exist by E2 in A. Each new column is a conflation with the old cokernel (ExactStructure.conflation_cobaseChange), the two maps of the pushout row compose to zero by the pushout property, and the pushout row is a conflation by the 3×3 lemma (ii), its outer rows ρ and σ″ being conflations. The componentwise pushout is a pushout in E(A) because morphisms of conflations are determined componentwise. E2op is dual, with componentwise pullbacks (ExactStructure.conflation_baseChange).
5. Exactness of s, t and q is the definition of the conflations of E(A); ∐ is exact because a biproduct of conflations is a conflation (ExactStructure.conflation_biprod).
6. Universal property: an exact functor F : B → E(A) gives the short exact sequence s∘F ↣ t∘F ↠ q∘F of exact functors, and a short exact sequence F′ ↣ F ↠ F″ gives B ↦ (F′B ↣ FB ↠ F″B), exact because the conflations of E(A) are componentwise (Weibel, Definition V.1.1(a)).
7. Essential smallness: a conflation is determined up to isomorphism by three objects of a small skeleton of A and two morphisms between them.

**API.**

| Declaration | Contract |
| --- | --- |
| ConflationCategory.exactStructure | The exact structure on E.ConflationCategory whose conflations are the componentwise ones. |
| ConflationCategory.conflation_iff | A sequence of conflations is a conflation of E(A) exactly when its three columns are E-conflations. |
| ConflationCategory.isConflationExact_sub | The sub-term functor s : E(A) → A is exact. |
| ConflationCategory.isConflationExact_total | The total-term functor t : E(A) → A is exact. |
| ConflationCategory.isConflationExact_quot | The quotient-term functor q : E(A) → A is exact. |
| ConflationCategory.coprod | The exact functor ∐ : A × A → E(A), (X, Z) ↦ (X ↣ X ⊞ Z ↠ Z). |
| ConflationCategory.sub_quot_coprod | (s, q) ∘ ∐ = id and t ∘ ∐ ≅ ⊞. |
| ConflationCategory.exactFunctorEquiv | Exact functors B → E(A) correspond to short exact sequences of exact functors B → A. |
| ConflationCategory.essentiallySmall | E(A) is essentially small when A is. |

**Uses.**

- K.3/additivity-for-exact-categories (Weibel V.1.1.1 and the proof of V.1.2): Additivity is proved in this universal case: t is homotopic to s ∐ q on K(E(A)), by the Extension Theorem V.1.3 for this category.
- Weibel V.1.4 and Exercises V.1.5–1.6: The categories of admissibly exact sequences of length n are iterated extension categories of this kind.
- Weibel II.9.3 and IV.8.3: For an exact category regarded as a Waldhausen category, the second term of the S-construction is this category with the cofibrations of II.9.3.

**Checks.**

- **componentwise_conflations** (characterisation): A sequence of conflations is a conflation of E(A) if and only if its three columns are E-conflations; a sequence that is a kernel–cokernel pair of short complexes but has a column that is not an E-conflation is not one.
- **coprod_section** (computation): (s, q) ∘ ∐ is the identity of A × A, and t ∘ ∐ is naturally isomorphic to the biproduct functor.
- **k0_of_extension_category** (compatibility): (s, q) induces ExactK0 (E(A)) ≃ ExactK0 A × ExactK0 A, with inverse induced by ∐ (Weibel, Proposition II.9.3.1).
- **not_abelian** (non-example): For the category of abelian groups with its canonical exact structure, E(Ab) is not an abelian category (Bühler, Remark 3.10), so its exact structure is not the canonical structure of an abelian category.

**Acceptance.**

- The conflations of E(A) are exactly the componentwise ones.
- (s, q) ∘ ∐ is the identity of A × A and t ∘ ∐ is the biproduct functor.
- ExactK0 of E(A) is ExactK0 A × ExactK0 A through (s, q), with inverse induced by ∐: the degree-zero shadow of the Extension Theorem (Weibel, Proposition II.9.3.1).
- For the canonical structure of an abelian category, E(A) is not abelian (Bühler, Remark 3.10), so no abelian-category argument may be applied to it.

**Prerequisites:** `tauceti:TauCeti.ExactStructure`, `tauceti:TauCeti.ExactStructure.ConflationCategory`, `tauceti:TauCeti.ExactStructure.conflation_cobaseChange`, `tauceti:TauCeti.ExactStructure.conflation_baseChange`, `tauceti:TauCeti.ExactStructure.conflation_biprod`, `GeneralAlgebraicKTheory:K.3/three-by-three-lemma`.

**Sources:** Weibel.KBook.V, Universal Example 1.1.1, p. V.1 — The object and the claim that it is exact, which the source does not prove.; Buhler.ExactCategories, Exercise 3.9 (Heller) and Remark 3.10, p. 16 (arXiv v2) — The componentwise exact structure, stated as an exercise; the proof steps are this roadmap's, from Bühler's Corollary 3.6 and Proposition 2.12.; Weibel.KBook.II, Extension Categories 9.3 and Proposition 9.3.1, pp. II.92–93 — The three functors and the degree-zero test..

#### The Additivity theorem

`GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories` · theorem · planet: **The Additivity theorem**

Let E(A) be the exact category of conflations of an exact category A (K.3/exact-category-of-conflations), with the exact functors s, t and q taking the sub, total and quotient terms. The functor (s, q) from Q(E(A)) to the product of two copies of Q(A) is a homotopy equivalence (the Extension Theorem); equivalently, for a short exact sequence of exact functors the middle one induces the sum of the maps induced by the outer two, as maps of H-spaces and hence on all K-groups. Two corollaries follow at once: for an admissible filtration of an exact functor with exact quotients the induced map is the sum of the maps of the quotients, and for a bounded admissibly exact sequence of exact functors the alternating sum of the induced maps is zero. This node is the exact-category theorem, proved by Quillen's Theorem A; the Waldhausen form is K.4/waldhausen-additivity, proved separately in K.4:construction.

**Hypotheses and conventions.**

- The functors are exact and the sequences of functors are pointwise conflations; A is essentially small, and so is E(A).
- For the filtration corollary the successive quotient functors must themselves be exact.
- The equivalence is of H-spaces, so the conclusion is an equality of maps of K-groups and not merely of their effect on classes.

**Construction or proof.**

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

**Prerequisites:** `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.3/exact-category-of-conflations`, `StableHomotopyKTheory:H.2/quillen-theorem-a`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`, `tauceti:TauCeti.ExactStructure.conflation_cobaseChange`, `tauceti:TauCeti.ExactStructure.conflation_baseChange`.

**Sources:** Weibel.KBook.V, Additivity Theorem 1.2 with its proof, p. V.2 — The theorem and the first line of its proof, in the form that covers exact and Waldhausen categories at once.; Weibel.KBook.V, Extension Theorem 1.3 and its proof for exact categories, pp. V.2–4 — The theorem and the Theorem A argument the proof steps follow.; Weibel.KBook.V, Corollary 1.2.1 and Proposition 1.8, pp. V.2 and V.9 — The two corollaries with their proofs..

#### Contract both comma categories in one-step resolution

`GeneralAlgebraicKTheory:K.3/one-step-resolution-comma` · lemma

Let P be a replete full subcategory of an essentially small exact category H, with the induced exact structure. Suppose P is extension closed, every H-admissible subobject of a P-object lies in P, and every H-object admits an H-admissible epimorphism from a P-object. Then QP→QH induces a homotopy equivalence on classifying spaces.

**Hypotheses and conventions.**

- For every H-conflation 0→M′→M→M″→0, M∈P implies M′∈P; M″ is allowed to be any H-object. Closure only for epimorphisms between P-objects is insufficient.
- P contains a zero object and is closed under isomorphisms and extensions. All covers and subobjects in the hypotheses are admissible in H.
- The exact structure on P is induced from H. The full subcategory C of QH on P-objects need not equal QP on morphisms.

**Construction or proof.**

1. Factor QP→C→QH. For QP→C, the over-comma at P is the poset of H-admissible layers (P0,P1) with quotient in P and both P/P1 and P1/P0 in P. Ambient admissible-subobject closure puts P0,P1 in P.
2. The functor (P0,P1)↦(0,P1) has natural comparisons to the identity and to the constant (0,0); hence this comma category contracts.
3. For C→QH, the under-comma at M consists of Q-arrows M→P. Factor such an arrow as i_! j^!, with j:P̄↠M and i:P̄↣P. Ambient admissible-subobject closure applied to P̄↣P puts P̄ in P. Removing i is the right-adjoint retraction onto the epimorphic subcategory.
4. In the opposite epimorphic category, choose P*↠M. The functor (P↠M)↦(P×_M P*↠M) compares to the identity and the constant P*. Its objects are in P: the pullback is an extension of P* by ker(P↠M), both in P. The stated ambient closure puts ker(P↠M) in P even though M need not be in P; ordinary resolving kernel closure would not justify this step.
5. Apply the imported Theorem A twice; the adjunction and natural transformations are the actual contractions.

**Acceptance.**

- Check the actual maps and the stated scope, rather than only equality of cardinalities.
- For finite-dimensional vector spaces the identity inclusion gives the identity equivalence.
- For a category lacking kernel closure, the pullback contraction is not licensed.
- A full exact inclusion need not induce a full inclusion of Q-categories; retain C as an intermediate category.
- For R=k[ε]/(ε²), finite projectives cover finite R-modules and are closed under kernels of epimorphisms between projectives, but εR↣R has nonprojective source. That weaker resolving condition does not license the one-step contraction for the ambient module category.

**Prerequisites:** `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`, `StableHomotopyKTheory:H.2/quillen-theorem-a`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`.

**Sources:** Quillen.Higher1973, Section4 Theorem3 full proof, PDF24–25/publication pp108–109 — Read at the stated locator; direct deductions and quoted upstream inputs are distinguished in the proof outline..

#### Resolution dimensions and successive exact subcategories

`GeneralAlgebraicKTheory:K.3/bounded-resolution-filtration` · lemma

Under the resolving hypotheses, H_n={M:resolution length≤n by P} is extension closed, H_n⊂H_(n+1) satisfies the one-step theorem, and K(P)≃K(H) if every H-object has finite P-resolution.

**Hypotheses and conventions.**

- Use admissible resolutions in the essentially small exact category H. P is a replete full exact subcategory closed under extensions and kernels of H-admissible epimorphisms between P-objects.
- Every H-object admits an H-admissible epimorphism from a P-object. This sufficient cover condition supplies Quillen’s Corollary 1(b); no projectivity or functorial lifting of covers is assumed.
- For the equivalence with K(H), every H-object has finite P-resolution length. The stronger ambient-subobject closure required by the preceding one-step theorem is proved for H_n⊂H_(n+1), not assumed for P⊂H.

**Construction or proof.**

1. For every H-conflation 0→M′→M→M″→0, prove by induction: M∈H_n and M″∈H_(n+1) imply M′∈H_n; M′,M″∈H_(n+1) imply M∈H_(n+1); M,M″∈H_(n+1) imply M′∈H_(n+1). These are the three inequalities in Quillen’s lemma on publication p.110.
2. Reduce the inequalities to n=0. For the first, pull back a P-cover of M″ whose kernel lies in P; the pullback lies in P by extension closure, and its epimorphism onto that P-cover has kernel M′ in P. For the second, choose 0→P′→P→M″→0 and let X=M×_(M″)P. Cover X by a P-object P*. The composite P*→P is an admissible epimorphism between P-objects, so its kernel R lies in P. The induced epimorphism R→M′ has kernel K in P by the first inequality, since M′ has length at most one. The kernel of P*→M is an extension of P′ by K, hence is in P; this is the required length-one resolution, without projective lifting. For the third, pull back M′↣M along a P-cover P→M with kernel in P. The induced kernel K of P→M″ lies in P by the first inequality, and 0→ker(P→M)→K→M′→0 is a length-one P-resolution.
3. The second inequality makes H_n and H_(n+1) exact subcategories. The first proves ambient admissible-subobject closure for H_n inside H_(n+1). Every object of H_(n+1) has a cover from P⊂H_n with kernel in H_n. Apply one-step-resolution-comma with ambient category H_(n+1), rather than H.
4. The essentially small filtered union is H; use the earlier finite-data continuity of Q and K. No functorial choice of finite resolutions is assumed.

**Acceptance.**

- Check the actual maps and the stated scope, rather than only equality of cardinalities.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/one-step-resolution-comma`, `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`.

**Sources:** Quillen.Higher1973, Section4 Corollary1 and its three-inequality proof, PDF25–27/publication pp109–111 — Read at the stated locator; direct deductions and quoted upstream inputs are distinguished in the proof outline..

#### The Resolution theorem

`GeneralAlgebraicKTheory:K.3/resolution-theorem` · theorem · planet: **The Resolution theorem**

Let P be a full exact subcategory of an exact category H, closed under extensions and under kernels of admissible surjections in H, and suppose every object of H has a finite resolution by objects of P. Then the inclusion induces a homotopy equivalence of K-theory spaces and isomorphisms of all K-groups. The proof reduces to resolutions of length one by filtering H by the subcategories of objects with resolutions of bounded length, and the length-one case is handled by a comma-category argument. The standing instances are the finitely generated projectives inside the modules of finite projective dimension, and, for a regular noetherian ring, the finitely generated projectives inside all finitely generated modules, which gives the agreement of K-theory and G-theory.

**Hypotheses and conventions.**

- P is full in H, closed under extensions and under kernels of admissible surjections in H; finite resolutions exist for every object of H.
- For the ring instance, use the finite-projective-resolution hypotheses of the adopted regular noetherian theorem. The vector-bundle scheme comparison needs the global-resolution hypotheses of V.3.4; separatedness is part of that stated sufficient scope. The failure example is the doubled-origin affine plane, not the line.
- The closure under kernels of admissible surjections is essential and is what makes the filtration argument work.

**Construction or proof.**

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

**Prerequisites:** `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`, `StableHomotopyKTheory:H.2/quillen-theorem-a`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`, `tauceti:TauCeti.ExactStructure.resolutionEquiv`, `tauceti:TauCeti.moduleResolutionEquiv`, `GeneralAlgebraicKTheory:K.3/bounded-resolution-filtration`.

**Sources:** Weibel.KBook.V, Resolution Theorem 3.1 with the opening of its proof, p. V.20 — The theorem and the structure of its proof.; Weibel.KBook.II, Example 8.2.4, p. II.77; Exercise 9.10(d), p. II.100 — The exercise and dimension n ≥ 2 in Example 8.2.4 identify the intended scheme; see the scoped sourceIssues entry..

#### Transfer maps and the projection formula

`GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula` · lemma

If a ring map makes the target a module admitting a finite resolution by finitely generated projectives over the source, then restriction of scalars gives an exact functor between the categories H(S) and H(R) of modules admitting finite resolutions by finitely generated projectives, and through the resolution isomorphisms a transfer map of K-groups in the direction opposite to the ring map. Transfers compose when both maps satisfy the hypothesis. For commutative rings the projection formula holds: the transfer of the product of a pulled-back class with a class upstairs is the product of the class with the transfer. The hypothesis is finite projective dimension WITH finitely generated resolving modules; finite projective dimension alone is not the source's hypothesis.

**Hypotheses and conventions.**

- The target ring is, as a module over the source, of finite projective dimension with finitely generated resolving projectives.
- For the projection formula the rings are commutative. Weibel V.3.3.2 states the formula in all nonnegative degrees; it uses the biexact pairings requested from the early products prefix of K.7, not merely the K₀ action.
- Composition of transfers requires the same hypothesis for the second map.

**Construction or proof.**

1. Define H(R) to mean modules admitting finite resolutions by finitely generated projectives (not arbitrary modules of finite projective dimension). Restriction sends P(S) to H(R) because S has such a resolution. More generally it sends H(S) to H(R) by resolving its finitely many resolving S-projectives over R; it is exact on the inherited exact structures.
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

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/resolution-theorem`, `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`, `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`.

**Sources:** Weibel.KBook.V, V.3.2 and V.3.3.2, p. V.21 — The K-theory transfer with the finite resolution by finitely generated projectives hypothesis. ; Weibel.KBook.V, V.3.3.2, p. V.21, projection-formula paragraph — All-degree projection formula via H(S) × P(R) → H(R) and the resolution equivalences. Its biexact pairing must be available through the requested early K.7 products prefix..

#### The actual two intersection functors in dévissage

`GeneralAlgebraicKTheory:K.3/devissage-intersection-contraction` · lemma

For B⊂A closed under subobjects, quotients and finite sums, with a finite B-filtration of each A-object, the layer comma category J(M) is contractible and QB→QA is a homotopy equivalence.

**Hypotheses and conventions.**

- A is abelian, B is a full exact abelian subcategory. B need not be closed under extensions in A.

**Construction or proof.**

1. Identify (QB→QA)/M with layers (M0,M1)⊂M for which M1/M0 lies in B.
2. If M/M′ lies in B, define r(M0,M1)=(M0∩M′,M1∩M′) in J(M′) and s(M0,M1)=(M0∩M′,M1) in J(M).
3. The quotient for s embeds into (M1/M0)⊕(M/M′), so belongs to B by the stated closure, without extension closure. There are natural arrows ir→s←id and ri=id.
4. Thus J(M′)→J(M) is a homotopy equivalence. Iterate along a finite filtration to J(0), the one-object poset, and apply Theorem A.
5. For finite-length A choose B semisimple: the division-ring corollary follows using finite sums and filtered unions. For nilpotent ideals this is a G-theory assertion; it does not imply nilinvariance of projective-module K-theory.

**Acceptance.**

- Check the actual maps and the stated scope, rather than only equality of cardinalities.

**Prerequisites:** `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`, `StableHomotopyKTheory:H.2/quillen-theorem-a`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`.

**Sources:** Quillen.Higher1973, Section5 Theorem4 full proof, PDF28–29/publication pp112–113 — Read at the stated locator; direct deductions and quoted upstream inputs are distinguished in the proof outline..

#### The Devissage theorem

`GeneralAlgebraicKTheory:K.3/devissage-theorem` · theorem · planet: **The Devissage theorem**

Let an exact abelian subcategory of an abelian category be closed under subobjects and quotients, and suppose every object of the ambient category has a finite filtration whose successive quotients lie in the subcategory. Then the inclusion induces a homotopy equivalence of K-theory spaces and isomorphisms of all K-groups. The proof is again by the comma-category criterion, the comma category being equivalent to the ordered set of layers with quotient in the subcategory, contracted by two explicit intersections. The standing instances are the identification of the G-theory of a ring modulo a nilpotent ideal with that of the quotient, and the G-theory of the torsion modules for an element as a colimit.

**Hypotheses and conventions.**

- The subcategory is abelian, exact in the ambient category, and closed under subobjects and quotients; both categories have a set of isomorphism classes.
- Every object of the ambient category has a finite filtration with successive quotients in the subcategory.
- The successive-quotient functors attached to the filtration are NOT assumed exact, which is exactly why additivity for filtrations does not prove this theorem; the source gives an example.

**Construction or proof.**

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

**Prerequisites:** `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `StableHomotopyKTheory:H.2/quillen-theorem-a`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`, `tauceti:TauCeti.simpleClassBasis`, `GeneralAlgebraicKTheory:K.3/devissage-intersection-contraction`.

**Sources:** Weibel.KBook.V, Devissage Theorem 4.1 with the opening of its proof, p. V.33 — The theorem and the criterion its proof uses.; Weibel.KBook.V, Open Problem 4.1.1, p. V.33 — The open problem; it is why no Waldhausen form of this node exists in K.4..

#### Isomorphic quotient objects compute localization comma categories

`GeneralAlgebraicKTheory:K.3/localization-isomorphic-comma-subcategory` · lemma

For B Serre in a small abelian A and L∈A/B, let F_L⊂L\Qloc contain (A,u) with u:L≅loc(A). Then BF_L≃B(L\Qloc). In particular F_0≃QB.

**Hypotheses and conventions.**

- Use the pinned Serre quotient infrastructure and its calculus-of-fractions supplier from H.1–H.2.
- The exact structure is the full abelian one.

**Construction or proof.**

1. An object of the comma fibre of F_L→L\Qloc can be represented by a layer A₁⊂A₂⊂A whose quotient in A/B is the prescribed object L with its prescribed structure map. Modulo the unique representative isomorphisms this fibre is the poset of such layers.
2. The quotient construction lifts the relevant subobject, giving nonemptiness. Two layers have a common refinement using intersection on the lower terms and sum on the upper terms; kernels and cokernels of changes vanish in A/B because B is Serre. Retain the quotient identification with L.
3. Thus each fibre poset is directed and its nerve contractible. Apply Theorem A. At L=0, loc(A)=0 exactly when A∈B, so F_0 is QB with the same Q-spans.

**Acceptance.**

- For L=0 the inclusion QB→0\Qloc is the specific fibre equivalence.
- The full quotient identification is retained in each layer; a bare poset of arbitrary subobjects is insufficient.

**Prerequisites:** `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`, `GeneralAlgebraicKTheory:K.1/Q-construction-universal-property`, `StableHomotopyKTheory:H.2/quillen-theorem-a`, `StableHomotopyKTheory:H.1/filtered-colimits-of-categories`, `mathlib:CategoryTheory.ObjectProperty.IsSerreClass`.

**Sources:** Weibel.KBook.V, Claims5.1.2–5.1.3, p.V.36; read in full 2026-10-02 — The directed layer-poset fibres, including F_0≃QB.; Quillen.Higher1973, Section5 Theorem5 and Lemmas1–5, PDF29–32/publication pp113–116, full proof read — Checked the layers/intersection directed poset, epimorphic kernel pushout, filtered image models, postcomposition natural transformation and final zero-inflation square against these decomposed nodes..

#### Models of a quotient object with kernel functor

`GeneralAlgebraicKTheory:K.3/localization-model-category` · construction

For N∈A define E_N with objects h:A→N invertible modulo B and Q-span morphisms making the two maps to N agree. The kernel of h belongs to B and defines k_N:E_N→QB. Its full subcategory E′_N consists of epimorphic h. Postcomposition by a map g:N→N′ invertible modulo B defines g_*:E_N→E_N′.

**Hypotheses and conventions.**

- A is abelian and B Serre; kernel and cokernel of h lie in B.
- Kernel maps of Q-spans are formed with the abelian exact structure.

**Construction or proof.**

1. Restrict each admissible span over N to its kernels. Pullback and kernel universal properties give an admissible span in B, with independence and composition inherited from Q.
2. Postcompose object maps and preserve the same span; invertibility modulo B is stable under composition. For g, ker(h)⊂ker(gh) gives a natural Q-inflation k_N→k_N′g_*.
3. Identity and composition of postcomposition are literal functor laws. Define E′_N as the epimorphic-object full subcategory.

**API.**

| Declaration | Contract |
| --- | --- |
| LocalizationModel | The category E_N of quotient-isomorphism lifts h:A→N and Q-spans over N. |
| LocalizationModel.kernel | The kernel functor k_N to QB. |
| LocalizationModel.epimorphic | The full subcategory E′_N. |
| LocalizationModel.postcompose | The functor g_* for g invertible modulo B. |
| LocalizationModel.postcompose_id | Postcomposition by identity is identity. |
| LocalizationModel.postcompose_comp | Postcomposition by g′g is the composite. |
| LocalizationModel.kernel_postcompose | Natural inflation ker(h)→ker(gh). |

**Uses.**

- The consuming nodes listed in this roadmap: For N∈A define E_N with objects h:A→N invertible modulo B and Q-span morphisms making the two maps to N agree. The kernel of h belongs to B and defines k_N:E_N→QB. Its full subcategory E′_N consists of epimorphic h. Postcomposition by a map g:N→N′ invertible modulo B defines g_*:E_N→E_N′.

**Checks.**

- **localization_identity_model** (degenerate): The kernel of (N,id_N) is zero.
- **localization_model_epic** (computation): If h is onto, its kernel gives the exact sequence 0→ker(h)→A→N→0.
- **localization_model_postcomposition** (computation): The displayed kernel inclusion lies in B and is natural in Q-spans.

**Acceptance.**

- For h=id_N the kernel is zero.
- For g=id_N the postcomposition functor is identity.

**Prerequisites:** `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`, `GeneralAlgebraicKTheory:K.1/Q-construction-universal-property`, `mathlib:CategoryTheory.ObjectProperty.IsSerreClass`.

**Sources:** Weibel.KBook.V, Definitions before Claim5.1.4 and Claim5.1.6, pp.V.36–37; read in full 2026-10-02 — The model category, epimorphic part, kernel functor and postcomposition.; Quillen.Higher1973, Section5 Theorem5 and Lemmas1–5, PDF29–32/publication pp113–116, full proof read — Checked the layers/intersection directed poset, epimorphic kernel pushout, filtered image models, postcomposition natural transformation and final zero-inflation square against these decomposed nodes..

#### The kernel functor on epimorphic models is an equivalence on realisation

`GeneralAlgebraicKTheory:K.3/localization-epimorphic-kernel-equivalence` · lemma

The kernel functor k′:E′_N→QB induces a homotopy equivalence.

**Hypotheses and conventions.**

- Use Q-morphism factorisation in both orders in an abelian category and pushouts of kernels.

**Construction or proof.**

1. For T∈QB, consider k′/T. Its full subcategory of objects with structure Q-arrow a distinguished reversed deflation is contractible, with initial object (N,id_N,0↞T).
2. Write a general structure Q-arrow ker(h)→T in the alternate form ker(h)↣T₀↞T, obtained by pushing out its usual span. Push out ker(h)↣A along ker(h)↣T₀ to obtain A₀→N with kernel T₀. The resulting object has the distinguished reversed-deflation structure arrow T₀↞T.
3. The pushout universal property gives a left adjoint from k′/T to that subcategory. Its unit and counit give a realisation equivalence. Hence k′/T is contractible and Theorem A applies.

**Acceptance.**

- The subcategory’s initial object is (N,id_N,0↞T), with the correct Q-direction.
- The new model remains epic onto N and has kernel T₀.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/localization-model-category`, `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`, `StableHomotopyKTheory:H.2/quillen-theorem-a`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`.

**Sources:** Weibel.KBook.V, Claim5.1.4, p.V.36; read in full 2026-10-02 — The distinguished-deflation subcategory, pushout adjoint and Theorem A.; Quillen.Higher1973, Section5 Theorem5 and Lemmas1–5, PDF29–32/publication pp113–116, full proof read — Checked the layers/intersection directed poset, epimorphic kernel pushout, filtered image models, postcomposition natural transformation and final zero-inflation square against these decomposed nodes..

#### Epimorphic models compute all localization models

`GeneralAlgebraicKTheory:K.3/localization-epimorphic-models` · lemma

The inclusion E′_N→E_N is a realisation equivalence, and k_N:E_N→QB is one. If g:N→N′ is invertible modulo B, then g_* is a realisation equivalence.

**Hypotheses and conventions.**

- Let I_N be the poset of subobjects N_i⊂N with N/N_i∈B. It has terminal object N.

**Construction or proof.**

1. The image functor E_N→I_N is fibred. Its fibre at N_i is E′_{N_i}; base change for N_j⊂N_i takes h to h⁻¹(N_j)→N_j and preserves its kernel.
2. The epimorphic-kernel equivalence therefore makes every base change an equivalence. Theorem B identifies a fibre over N with E_N because BI_N is contractible. This proves E′_N≃E_N and the kernel equivalence.
3. For g use the natural inflation k_N→k_N′g_* from the model construction. Its realised homotopy and the two kernel equivalences give g_* an equivalence by two-out-of-three.

**Acceptance.**

- The fibre at terminal subobject N is precisely the epic-model category.
- The postcomposition result uses kernel naturality, not arbitrary inversion of g in A.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/localization-model-category`, `GeneralAlgebraicKTheory:K.3/localization-epimorphic-kernel-equivalence`, `StableHomotopyKTheory:H.2/quillen-theorem-b`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`.

**Sources:** Weibel.KBook.V, Claims5.1.5–5.1.6, pp.V.36–37; read in full 2026-10-02 — The image-poset fibration and natural kernel comparison.; Quillen.Higher1973, Section5 Theorem5 and Lemmas1–5, PDF29–32/publication pp113–116, full proof read — Checked the layers/intersection directed poset, epimorphic kernel pushout, filtered image models, postcomposition natural transformation and final zero-inflation square against these decomposed nodes..

#### Filtered models compute the quotient-isomorphism fibre

`GeneralAlgebraicKTheory:K.3/localization-filtered-models` · lemma

For L∈A/B let I_L contain lifts (N,loc(N)≅L), with maps over L. It is filtered; F_L is the filtered colimit of E_N. Each E_N→F_L is a realisation equivalence, and the base-change map L\Qloc→0\Qloc for 0↣L is a realisation equivalence.

**Hypotheses and conventions.**

- Use the quotient calculus of fractions to refine finitely many representatives and equalities.
- Use H.1’s compatibility of nerves/classifying spaces and homotopy groups with filtered colimits.

**Construction or proof.**

1. The quotient fraction representation gives a common model for two lifts and a refinement equalising any two maps; hence I_L is filtered. Send h:A→N to the inverse of loc(h) followed by the chosen loc(N)≅L, giving the object of F_L.
2. Every object and morphism of F_L is represented after such a refinement, and any equality of representatives holds after a further refinement. This proves the colimit identification on objects and Q-hom sets.
3. All transition maps g_* are realisation equivalences by the preceding node. Filtered-colimit compatibility therefore makes every E_N→F_L a realisation equivalence.
4. The composite E_N→F_L→L\Qloc→0\Qloc sends h to (A,0↣loc(A)); the kernel functor followed by QB→0\Qloc sends it to (ker(h),0). The kernel inflation gives a natural transformation between these composites.
5. The kernel route and the F_L inclusion route are equivalences. Two-out-of-three proves the zero-inflation base-change equivalence. Opposite-category symmetry supplies the zero-deflation case; factorisation and two-out-of-three supply every Q-arrow.

**Acceptance.**

- For L=0 the comparison recovers QB.
- The quotient-object lift and its isomorphism are part of I_L; arbitrary objects N are not the indexing category.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/localization-isomorphic-comma-subcategory`, `GeneralAlgebraicKTheory:K.3/localization-epimorphic-models`, `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`, `StableHomotopyKTheory:H.1/filtered-colimits-of-categories`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`.

**Sources:** Weibel.KBook.V, Claim5.1.7 and conclusion of Theorem5.1, p.V.37; read in full 2026-10-02 — The filtered model colimit and kernel-inflation homotopy.; Quillen.Higher1973, Section5 Theorem5 and Lemmas1–5, PDF29–32/publication pp113–116, full proof read — Checked the layers/intersection directed poset, epimorphic kernel pushout, filtered image models, postcomposition natural transformation and final zero-inflation square against these decomposed nodes..

#### Quillen's localisation theorem for a Serre subcategory

`GeneralAlgebraicKTheory:K.3/abelian-localization-theorem` · theorem · planet: **Quillen's localisation theorem**

For a Serre subcategory of a small abelian category, the sequence of K-theory spaces of the subcategory, of the category and of the quotient is a homotopy fibration, so there is a long exact sequence of K-groups ending in the right-exact sequence of Grothendieck groups. It is natural for exact functors of pairs. The theorem is asserted for ABELIAN categories: the stage text's warning is that it may not be asserted for an arbitrary exact subcategory of an exact category without the extra hypotheses the chosen exact-category localisation theorem requires, and this roadmap keeps localisation for exact and Waldhausen categories in K.4, where those hypotheses are stated.

**Hypotheses and conventions.**

- The ambient category is small abelian and the subcategory is Serre, that is closed under subobjects, quotients and extensions.
- The quotient is the abelian quotient category, whose construction Mathlib supports through Serre classes and the localisation of a category.
- The theorem is not asserted for exact categories that are not abelian; the corresponding statements are the Waldhausen localisation theorem of K.4 and the nonconnective localisation of K.6.

**Construction or proof.**

1. K.3/localization-isomorphic-comma-subcategory identifies the comma fibre over zero with QB.
2. K.3/localization-filtered-models proves all base-change maps of comma fibres are realisation equivalences, with the model category, epic-kernel comparison and image-poset fibration supplied by its prerequisite nodes.
3. Apply H.2’s Theorem B to Qloc:QA→Q(A/B), loop the fibre sequence and take homotopy groups. Since every quotient object is represented by an A-object, K₀(A)→K₀(A/B) is surjective.
4. The degree-one connecting map retains the fixed sign convention; downstream residue comparisons must identify the actual boundary map, not just the abstract groups.

**Acceptance.**

- The long exact sequence ends in the right-exact sequence of Grothendieck groups.
- The boundary from the first K-group of the quotient sends the class of an endomorphism invertible modulo the subcategory to the difference of the classes of its cokernel and kernel, with the sign fixed here.
- The statement is for abelian categories; it may not be quoted for an arbitrary exact subcategory.
- For a Dedekind domain the sequence relates the K-groups of the ring, of its fraction field and of its residue fields.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/devissage-theorem`, `GeneralAlgebraicKTheory:K.3/resolution-theorem`, `GeneralAlgebraicKTheory:K.1/Q-construction-universal-property`, `StableHomotopyKTheory:H.2/quillen-theorem-b`, `StableHomotopyKTheory:H.1/filtered-colimits-of-categories`, `mathlib:CategoryTheory.ObjectProperty.IsSerreClass`, `GeneralAlgebraicKTheory:K.3/localization-filtered-models`, `GeneralAlgebraicKTheory:K.3/localization-isomorphic-comma-subcategory`.

**Sources:** Weibel.KBook.V, Abelian Localization Theorem 5.1 with (5.1.1), p. V.35 — The theorem and the sequence.; Weibel.KBook.V, Exercise 5.1, pp. V.37–38 — The boundary map in degree one; the source states it as an exercise and this roadmap fixes the sign here..

#### Cofinality, with the correction in degree zero

`GeneralAlgebraicKTheory:K.3/cofinality-degree-zero-correction` · theorem

Component: `GeneralAlgebraicKTheory:K.3:cofinality`.

For an exact subcategory closed under extensions and cofinal in an exact category, the realisation of the smaller Q-category is the covering space of the larger corresponding to the subgroup of the Grothendieck group; hence the K-groups agree in every positive degree, while the zeroth group of the subcategory is only a subgroup of that of the category. There is a Waldhausen form with a surjection from the Grothendieck group, giving a homotopy fibration onto the discrete quotient and a short exact sequence in degree zero. The idempotent completion is the standard example where the zeroth group genuinely changes: an exact category is cofinal in its idempotent completion and the positive K-groups agree, so no statement of agreement in degree zero may be made.

**Hypotheses and conventions.**

- The subcategory is exact, closed under extensions and cofinal, meaning every object of the ambient category has a complement making the sum lie in the subcategory.
- The Waldhausen form requires a cylinder functor satisfying the cylinder axiom, which K.4 defines. The route of the general exact-category form through Waldhausen Cofinality IV.8.9 needs the subcategory to be saturated as well as cofinal (the author's correction, recorded as GeneralAlgebraicKTheory/E-cofinality-saturated); for an exact category the weak equivalences are the isomorphisms, which are saturated, so the exact-category statement is unaffected.
- The degree-zero group of the subcategory is a subgroup of the ambient one, and the inclusion is generally proper.
- The general proof needs the late K.4 fibration theorem and the comparison of the S- and Q-constructions, so this node belongs after K.4. It keeps its id and the parent K.3 because no stage K.3:cofinality exists yet, and records the proposed late parent in proposedParentStageId. The special case of Weibel's Exercise IV.6.6, the subcategory cut out by a surjection from K₀ to a group, needs only Theorems A and B. ExactK0.ofLE_surjective compares exact structures on one category and does not prove cofinal-subcategory K₀ injectivity.

**Construction or proof.**

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

**Prerequisites:** `GeneralAlgebraicKTheory:K.4/fibration-theorem`, `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`, `GeneralAlgebraicKTheory:K.4:construction/iS-versus-Q`, `StableHomotopyKTheory:H.2/quillen-theorem-a`, `StableHomotopyKTheory:H.2/quillen-theorem-b`, `mathlib:CategoryTheory.Idempotents.Karoubi`.

**Sources:** Weibel.KBook.IV, Cofinality 6.4.1, p. IV.56 — The exact-category form, with the source’s own note that its general proof goes through the Waldhausen form.; Weibel.KBook.V, Cofinality Theorem 2.3, p. V.14 — The Waldhausen form with the degree-zero correction.; Weibel.KBook.IV, Exercise 6.6 (Gersten), p. IV.60, and Waldhausen Cofinality 8.9, p. IV.72 — The Theorem A and B special case, and the Waldhausen cofinality theorem through which the source proves the general case; the missing saturation hypothesis of 8.9 is recorded under sourceIssues..

#### Weak equivalences detected by a Grothendieck quotient

`GeneralAlgebraicKTheory:K.3/grothendieck-class-weak-equivalences` · definition

Component: `GeneralAlgebraicKTheory:K.3:cofinality`.

For p:K₀(C,v)↠G define w_p by f:A→B ∈w_p iff p[B]=p[A]. For a cofibration this is equivalent to p[B/A]=0. Then v⊂w_p, the new structure has factorization, and w_p is saturated and satisfies extension. Its acyclic objects form C₀={A | p[A]=0}.

**Hypotheses and conventions.**

- C is a small pointed Waldhausen category with factorization; v denotes its original weak equivalences.
- p:K₀(C,v)→G is onto, with G an abelian group. This is the late cofinality component, after K.4, not a prerequisite of early exact-category localization.

**Construction or proof.**

1. The Grothendieck presentation gives [B]=[A]+[B/A] for a cofibration and [A]=[B] for v-equivalences. Thus the displayed equality is independent of any factorization chosen for f.
2. Two-of-three is transitivity/cancellation of equality in G. In a diagram of conflations, additivity of Grothendieck classes shows that if the two outer arrows preserve p-class, the middle does too; the same equality proves the gluing axiom under cofibration pushouts.
3. The original factorization of f is still a factorization for w_p, since v⊂w_p. The zero-map condition is precisely p[A]=0, giving C₀ with its inherited cofibrations and v weak equivalences.

**API.**

| Declaration | Contract |
| --- | --- |
| KTheory.classWeakEquivalences | A map lies in w_p exactly when p[B]=p[A]. |
| KTheory.classWeakEquivalences_cof | On cofibrations it is the zero class of the quotient. |
| KTheory.classWeakEquivalences_contains | The original weak equivalences are contained in w_p. |
| KTheory.classWeakEquivalences_saturated | The new structure satisfies saturation, extension and the Waldhausen gluing axiom. |
| KTheory.classAcyclic | The acyclic objects are exactly the kernel-class objects. |

**Uses.**

- K.6 Schlichting11.17 and11.7; K.3/cofinality-degree-zero-correction: Supplies cofinality after K.4 without assuming a cylinder functor.

**Checks.**

- **class_weak_zero** (degenerate): For p=0, every map is class-weak.
- **class_weak_identity** (compatibility): Identity maps always preserve p-class.
- **class_weak_cof_quotient** (computation): A cofibration with quotient D is class-weak exactly when p[D]=0.
- **class_weak_not_all** (non-example): For bounded complexes of finite-dimensional k-vector spaces with quasi-isomorphisms and p=Euler characteristic:K₀≅Z, the map0→k concentrated in degree0 is not class-weak.

**Acceptance.**

- For p=0, every map is in w_p and every object is acyclic. For p=id, w_p preserves the actual K₀ class rather than only its image in a further quotient.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/waldhausen-factorization`, `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`.

**Sources:** ThomasonTrobaugh.1990, Theorem1.10.1 and full proof, printed pp.275–277/PDF15–16; read scan images2026-10-02 — The source’s cylinder proof is adapted exactly as SchlichtingAppendixA.4 specifies: use existential factorizations and the read A.3 fibration. Suspensions are chosen only for fixed finite filtrations; no functorial suspension is assumed..

#### The class-weak S-construction realizes the quotient group

`GeneralAlgebraicKTheory:K.3/grothendieck-class-fibre-nerve` · lemma

Component: `GeneralAlgebraicKTheory:K.3:cofinality`.

For each n, w_pS_nC→G^n sends a filtration to its successive p-class increments and induces a nerve equivalence. These equivalences are compatible with simplicial faces and degeneracies, and identify |w_pS.C| with BG.

**Hypotheses and conventions.**

- C is a small pointed Waldhausen category with factorization; v denotes its original weak equivalences.
- p:K₀(C,v)→G is onto, with G an abelian group. This is the late cofinality component, after K.4, not a prerequisite of early exact-category localization.

**Construction or proof.**

1. Every g∈G is represented by an object: a difference [A]−[B] becomes [A⊕ΣB], choosing B↣I→0 by factorization, so [ΣB]=−[B]. Surjectivity of p and finite sums give all g.
2. For a tuple (g₁,…,g_n), choose representing objects C_i and their cumulative-sum filtration C_g. Factor the map C_g→0 in S_nC, using approximation-lifts-S-filtrations for identity, to choose a quotient filtration ΣC_g with increments −g_i.
3. The zero-tuple fibre has an initial zero filtration: 0→A_i is w_p for every component because all increments and hence all p[A_i] vanish. Adding C_g takes the zero fibre into the g fibre; adding ΣC_g takes the g fibre into the zero fibre.
4. Their composites add a fixed filtration whose increments are zero. The summand inclusion from each original filtration to that sum is a natural w_p transformation, so both composites are naturally homotopic to identity. Thus every fibre is contractible.
5. The increment map’s faces add adjacent increments and its degeneracies insert0, exactly the bar faces and degeneracies of G. H.2’s realization result gives |w_pS.C|≃BG. Only the class map is required to be simplicially natural; the choices of C_g and its suspension prove equivalence degreewise and need not form a functorial suspension.

**Acceptance.**

- Negative classes require the chosen suspension; surjectivity of p alone does not make all group elements represented by a positive direct sum without this step.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/grothendieck-class-weak-equivalences`, `GeneralAlgebraicKTheory:K.4/approximation-lifts-S-filtrations`, `GeneralAlgebraicKTheory:K.4:construction/S-construction`, `StableHomotopyKTheory:H.1`, `StableHomotopyKTheory:H.2`.

**Sources:** ThomasonTrobaugh.1990, Theorem1.10.1 and full proof, printed pp.275–277/PDF15–16; read scan images2026-10-02 — The source’s cylinder proof is adapted exactly as SchlichtingAppendixA.4 specifies: use existential factorizations and the read A.3 fibration. Suspensions are chosen only for fixed finite filtrations; no functorial suspension is assumed..

#### Cofinality with non-functorial factorizations

`GeneralAlgebraicKTheory:K.3/cofinality-with-factorizations` · theorem

Component: `GeneralAlgebraicKTheory:K.3:cofinality`.

For C₀={A | p[A]=0}, K(C₀,v)→K(C,v)→G_discrete is a homotopy fibration. Hence K_i(C₀,v)≅K_i(C,v) for i>0 and K₀(C₀,v) identifies with ker(p)⊂K₀(C,v).

**Hypotheses and conventions.**

- C is a small pointed Waldhausen category with factorization; v denotes its original weak equivalences.
- p:K₀(C,v)→G is onto, with G an abelian group. This is the late cofinality component, after K.4, not a prerequisite of early exact-category localization.

**Construction or proof.**

1. Apply fibration-with-factorizations to v⊂w_p, using the proved saturation/extension/factorization hypotheses.
2. The class-weak fibre nerve identifies its third K-space as ΩBG≃G_discrete by the H.1 bar/loop contract.
3. The long exact sequence gives the positive-degree isomorphisms and degree-zero injection with image ker(p). The map to G is p by the actual Grothendieck presentation, so the degree-zero identification is map-level.
4. The spectrum version is obtained subsequent by H.5’s assembly and the bar-model Eilenberg–MacLane spectrum; no H.5 spectrum construction is an input of this space-level theorem.

**Acceptance.**

- For p=0 it gives the identity inclusion C₀=C. For p=id it gives K₀(C₀)=0 while all positive groups agree; degree-zero equality with C is not asserted.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/grothendieck-class-fibre-nerve`, `GeneralAlgebraicKTheory:K.4/fibration-with-factorizations`, `StableHomotopyKTheory:H.1`.

**Sources:** ThomasonTrobaugh.1990, Theorem1.10.1 and full proof, printed pp.275–277/PDF15–16; read scan images2026-10-02 — The source’s cylinder proof is adapted exactly as SchlichtingAppendixA.4 specifies: use existential factorizations and the read A.3 fibration. Suspensions are chosen only for fixed finite filtrations; no functorial suspension is assumed..

#### Relative triples for an additive functor

`GeneralAlgebraicKTheory:K.3/additive-functor-relative-K0` · construction

For an additive functor T:C→D between small additive categories, define K₀^cl(T) by triples(P,α,Q), α:TP≅TQ, modulo isomorphism, direct-sum additivity and [(P,α,Q)]+[(Q,β,R)]=[(P,βα,R)]. Its difference map sends the triple to[P]−[Q] in split K₀(C). The convention for idempotent completions is stated with each application.

**Hypotheses and conventions.**

- Classical additive K₁ is generated by object automorphisms with direct-sum and composition relations. This is independent of nonsplit exact K₁ until its comparison theorem is invoked.

**Construction or proof.**

1. The commuting-square morphisms make the triple category additive. Impose its split exact relations and the composition relation.
2. Composition with identity shows [(P,id,P)]=0. An isomorphism γ:P≅Q in C gives [(P,Tγ,Q)]=0 by isomorphism of triples with an identity triple.
3. The inverse of[(P,α,Q)] is[(Q,α⁻¹,P)]. A triangular shear changes neither class: conjugate/stabilize its off-diagonal block and use the elementary Whitehead relations. This also allows the negative-inverse convention used in Ex2.17(a).
4. The difference map respects both relations. Functorial commuting squares induce maps on triples; a specified natural isomorphism of the square gives the same induced map.
5. This classical additive construction uses its stated automorphism presentation directly. It does not import the subsequent Quillen K1/K2 comparison aggregator.

**API.**

| Declaration | Contract |
| --- | --- |
| RelativeAdditiveTriple | Objects P,Q of C and an isomorphism TP≅TQ. |
| ClassicalRelativeK0 | The abelian group presented by triple sum and composition relations. |
| ClassicalRelativeK0.difference | The map to split K0(C),[(P,α,Q)]↦[P]−[Q]. |
| ClassicalRelativeK0.map | Maps from additive commuting squares with a specified comparison isomorphism. |

**Uses.**

- K.6 finite-defect index and flasque cone comparison: Provides the classical K1/K0 exact germ before the negative construction.

**Checks.**

- **relative_identity** (degenerate): For T=id, every triple is induced by an isomorphism in C and its class is zero.
- **relative_zero_functor** (computation): For C→0, the difference map identifies this group with split K0(C).
- **relative_not_nonsplit** (non-example): On finite abelian p-groups the split group remembers cyclic-length summands; do not impose all short exact sequences unless using the exact version.

**Acceptance.**

- Use the split exact additive structure here. No identification with the homotopy fibre of an arbitrary exact functor is silently used.

**Prerequisites:** .

**Sources:** Weibel.KBook.II, II2.10,combinedPDF85/printed77;Exercise2.17(a–b),PDF89/printed81 — Read Definition2.10 and all parts of Exercise2.17. General additive-category formulation is the stable-object version of the projective-module argument; Karoubi1970 Theorem2.1 states it..

#### The stable automorphism boundary of a cofinal additive functor

`GeneralAlgebraicKTheory:K.3/additive-functor-stable-boundary` · lemma

If every object of D is a direct summand of some TP, there is a natural boundary δ:K₁^cl(D)→K₀^cl(T). Choose X⊕Y≅TP and extend α∈Aut(X) by id_Y; send it to[(P,α⊕id_Y,P)]. The result is independent of complements and transports.

**Hypotheses and conventions.**

- Cofinality here means direct-summand density, not surjectivity on objects. Use idempotent-completed categories if that is the application’s convention.

**Construction or proof.**

1. Given two choices P,P′, add their complements and use the swap on TP⊕TP′. The stabilized extended automorphisms differ by conjugation and an identity summand, which do not change the triple class.
2. The composition relation proves δ(αβ)=δ(α)+δ(β); direct-sum additivity proves compatibility with stabilization. Hence δ descends from object automorphisms to classical K1.
3. If α=Tγ, its triple class is zero by the preceding node. The complement argument also proves naturality for cofinal additive squares: use the transported complement rather than new independent choices.

**Acceptance.**

- Use the split exact additive structure here. No identification with the homotopy fibre of an arbitrary exact functor is silently used.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/additive-functor-relative-K0`.

**Sources:** Weibel.KBook.II, II2.10.2 and Exercise2.17(c),PDF85,89 — Read Definition2.10 and all parts of Exercise2.17. General additive-category formulation is the stable-object version of the projective-module argument; Karoubi1970 Theorem2.1 states it..

#### The classical five-term sequence of an additive functor

`GeneralAlgebraicKTheory:K.3/additive-functor-five-term` · lemma

For a cofinal additive T:C→D, K₁^cl(C)→K₁^cl(D)→K₀^cl(T)→K₀^split(C)→K₀^split(D) is natural and exact at its three interior terms. No surjectivity onto the last K0(D) is asserted.

**Hypotheses and conventions.**

- The split additive groups are those in the two preceding nodes. Karoubi’s convention replaces both categories by their idempotent completions.

**Construction or proof.**

1. At K0(C), if[TP]=[TQ], group-completion equality supplies X with TP⊕X≅TQ⊕X. Cofinality puts X into a summand of TH; adding the complementary summand gives an actual triple(P⊕H,α,Q⊕H) mapping to[P]−[Q].
2. At relative K0, direct sums and inverse triples put any element into one triple. If its difference is zero, stabilize until P⊕H≅Q⊕H in C; this replaces the triple by an automorphism triple, which is in the image of δ.
3. At K1(D), δ(α)=0 means that after adding identity triples the chosen automorphism triple is a product of induced isomorphism triples and elementary block changes. Whitehead’s stabilized elementary block matrices represent zero in classical K1. Thus the class of α is induced from a C-automorphism. Conversely induced automorphisms have zero boundary.
4. The maps are the actual difference, scalar functor and stable automorphism boundary, so the preceding naturality gives a natural exact sequence rather than a group-order coincidence.

**Acceptance.**

- Use the split exact additive structure here. No identification with the homotopy fibre of an arbitrary exact functor is silently used.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/additive-functor-stable-boundary`.

**Sources:** Weibel.KBook.II, II2.10/Exercise2.17(d–e),PDF85,89;Karoubi1970 Theorem2.1,PDF27 (stated with proof referred to Bass) — Read Definition2.10 and all parts of Exercise2.17. General additive-category formulation is the stable-object version of the projective-module argument; Karoubi1970 Theorem2.1 states it..

#### Base change of a finite field transfer through an Artin algebra

`GeneralAlgebraicKTheory:K.3/finite-field-transfer-base-change` · lemma

For E/F finite and F′/F any field extension, write B=E⊗F F′=∏B_j, with residue fields E_j and local lengths ℓ_j=length_(B_j)B_j. Then res_(F′/F) Tr_(E/F)=Σ_j ℓ_j Tr_(E_j/F′)res_(E_j/E) on every connective K_n. Multiplicity is local module length, not the nilpotence exponent of the maximal ideal.

**Hypotheses and conventions.**

- Finite-dimensional vector spaces carry their existing split exact structure. B need not be reduced; F′ need not be finite or algebraic over F.

**Construction or proof.**

1. Both composites of scalar extension and restriction of scalars are represented by the naturally isomorphic exact functors V↦V⊗E(E⊗F F′) and V↦V⊗F F′ from finite E-vector spaces to finite F′-vector spaces.
2. Decompose B into its Artin local factors and select a finite composition series of each B_j as an E–F′ bimodule, using its B_j-module composition series. Every subquotient is E_j. Tensoring over the field E preserves its short exact sequences.
3. Apply exact-functor additivity to this finite filtration. The subquotient functor is scalar extension E→E_j followed by restriction E_j→F′; its ℓ_j copies give the displayed sum.
4. A different series has the same multiplicities by Jordan–Hölder. The source’s G-theory base-change theorem also gives the square in the finite/flat case, but no scheme K-theory is used by this derivation.

**Acceptance.**

- The ring-level statement is upstream of symbol comparisons; scheme analogues consume it subsequent.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`, `GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality`.

**Sources:** Weibel.KBook.V, V3.5.3 and3.7.2 pp23–25 (exact tensor functors);V4.2.1 pp34 (Artin filtrations);direct derivation of arbitrary field base change — Read the indicated source statement and its proof or exercise hint. The exact-functor decomposition below supplies the explicit ring case; it is not attributed to a scheme-only theorem..

#### Compute the first localization boundary by kernel and cokernel

`GeneralAlgebraicKTheory:K.3/localization-degree-one-index` · lemma

For a Serre subcategory B⊂A and α:X→X becoming invertible in A/B, the boundary of its K1 class is[cokerα]−[kerα] in K0(B). For a central element s inverted in a noetherian ring, this gives ∂[s]=[R/sR]−[ann_R(s)] in the torsion Grothendieck group.

**Hypotheses and conventions.**

- Use the source’s positive cokernel-minus-kernel orientation, and the actual localization fibration of K3.

**Construction or proof.**

1. Represent the automorphism class by the Q-construction square 0↣X↠0 with vertical α, as in IVEx7.9. Its side and exterior edges collapse to the basepoint.
2. Lift the square through the localized-model category. The endpoint discrepancy of the lift is the kernel and cokernel conflations of α, now objects of B. The maximal-tree K0 computation gives their difference[cokerα]−[kerα]. Additivity makes it independent of stabilized representatives.
3. For multiplication by s on R, substitute its kernel ann_R(s) and cokernel R/sR. If R is a domain or s a non-zero-divisor the kernel vanishes.
4. The class of an automorphism is its explicit Q-construction square here; an identification of all exact-category K1 with a classical presentation is unnecessary.

**Acceptance.**

- The ring-level statement is upstream of symbol comparisons; scheme analogues consume it subsequent.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`, `GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0`.

**Sources:** Weibel.KBook.V, VEx5.1 p38 andExample6.1.2 p38;IVEx7.9 p65 (square representing the automorphism) — Read the indicated source statement and its proof or exercise hint. The exact-functor decomposition below supplies the explicit ring case; it is not attributed to a scheme-only theorem.; Quillen.Higher1973, Section5 Theorem5 and Lemmas1–5, PDF29–32/publication pp113–116, full proof read — Checked the layers/intersection directed poset, epimorphic kernel pushout, filtered image models, postcomposition natural transformation and final zero-inflation square against these decomposed nodes..

#### The DVR boundary is the normalized valuation

`GeneralAlgebraicKTheory:K.3/dvr-degree-one-boundary` · lemma

For a DVR R with fraction field F, residue field k and uniformizer π, the K1(F)=F×→K0(k)=Z boundary sends π to1 and a to v(a). This is the ring-level supplier of the tame-symbol comparison; S3 imports its scheme version.

**Hypotheses and conventions.**

- Normalized additive valuation has v(π)=1. Torsion dévissage identifies[R/πR] with the one-dimensional k-space.

**Construction or proof.**

1. Apply localization-degree-one-index to multiplication by π. Its cokernel is k and its kernel is zero.
2. Units lift from R and therefore have zero boundary. Write a=uπ^m and use the boundary homomorphism to get v(a)=m, including negative m.
3. This computation needs only abelian ring localization, resolution and dévissage; it has no prerequisite in SchemeKTheoryOperationsS3.

**Acceptance.**

- The ring-level statement is upstream of symbol comparisons; scheme analogues consume it subsequent.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/localization-degree-one-index`, `GeneralAlgebraicKTheory:K.3/devissage-theorem`, `GeneralAlgebraicKTheory:K.3/resolution-theorem`.

**Sources:** Weibel.KBook.V, V6.1.2 p38 andDedekind sequence6.6 p41 — Read the indicated source statement and its proof or exercise hint. The exact-functor decomposition below supplies the explicit ring case; it is not attributed to a scheme-only theorem..

#### Transport the right product action through the localization boundary

`GeneralAlgebraicKTheory:K.3/localization-product-boundary` · lemma

A biexact pairing A×C→A′ preserving the Serre subcategories induces ∂(x·y)=∂x·y on the right for x in K(A/B) and y in K(C). On the left the graded formula is ∂(y·x)=(−1)^deg(y)y·∂x. Thus δ_n=(−1)^(n−1)∂_n is the uniformizer-last Milnor boundary normalization in degree n.

**Hypotheses and conventions.**

- Choose the right-module suspension convention of VEx5.3. The alternative boundary δ_n is a degreewise normalization of the LES, not a competing definition of the symbol.

**Construction or proof.**

1. The exact pairing gives a map of the localization fibration tensored with K(C), via early biexact products. The generic H5 homotopy-fibre pairing commutes with the right boundary; require that supplier with its suspension convention.
2. Commuting a degree-i class across the degree−1 boundary yields the left sign(−1)^i. Multiplying ∂_n by(−1)^(n−1) cancels this sign for left coefficient products.
3. For DVR symbols {u1,…,u_(n−1),π}, the coefficient class lifts from R and δ_n returns the reduced unit symbol. δ_n vanishes on symbols of units; these formulas and bilinear relations determine all Milnor-symbol residues.

**Acceptance.**

- The ring-level statement is upstream of symbol comparisons; scheme analogues consume it subsequent.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`, `GeneralAlgebraicKTheory:K.7/biexact-stabilized-pairing`, `StableHomotopyKTheory:H.5:spectra`, `GeneralAlgebraicKTheory:K.3/dvr-degree-one-boundary`.

**Sources:** Weibel.KBook.V, VEx5.3 p38,IVEx1.23 (generic fibration pairing);V6.6.1 pp41–42 — Read the indicated source statement and its proof or exercise hint. The exact-functor decomposition below supplies the explicit ring case; it is not attributed to a scheme-only theorem.; Quillen.Higher1973, Section5 Theorem5 and Lemmas1–5, PDF29–32/publication pp113–116, full proof read — Checked the layers/intersection directed poset, epimorphic kernel pushout, filtered image models, postcomposition natural transformation and final zero-inflation square against these decomposed nodes..

#### Dedekind localization and primary torsion

`GeneralAlgebraicKTheory:K.3/dedekind-S-localization-and-torsion` · construction

Component: `GeneralAlgebraicKTheory:K.3:hermitian`.

Let R be a Dedekind domain with fraction field K and S a set of nonzero prime ideals. Define R_S={x∈K | v_p(x)≥0 for every nonzero p outside S}. It is the filtered union of the invertible fractional ideals R_D for effective divisors D supported on S, where R_D allows the pole orders specified by D. Let T_S be the abelian category of finitely generated R-modules killed by some finite product of powers of primes in S, and Perf_S(R) the perfect complexes with homology in T_S.

**Hypotheses and conventions.**

- The elements of S are prime ideals, not chosen prime elements. Without a class-group hypothesis R_S need not be presented by inverting one chosen element per prime.
- T_S objects have finite support even when S is infinite. Finite type and torsion are required.

**Construction or proof.**

1. Use the valuation description of fractional ideals to form R_D and their directed union. It proves flatness of R_S and R_S⊗_R R_S≅R_S.
2. Finite generation identifies torsion objects with finite sums of p-primary modules. The Serre conditions follow by checking subobjects, quotients and extensions.
3. Use global dimension one to identify the bounded derived category of T_S with the full perfect support category; establish the bounded torsion t-structure.

**API.**

| Declaration | Contract |
| --- | --- |
| DedekindLocalization.ofPrimeSet | Form the valuation subring and its localization map from R. |
| DedekindLocalization.mem_iff | Membership is nonnegative valuation outside S. |
| DedekindLocalization.fractionalIdeal_colimit | Realize R_S as the filtered union of the invertible R_D. |
| DedekindTorsion.primaryDecomposition | Each finite torsion object splits into finitely many p-primary summands. |
| DedekindTorsion.perfectHeart | The support t-structure has heart T_S and bounded derived category equivalent to Perf_S(R). |

**Uses.**

- Calmès et al. Proposition 2.1.3 and Theorem 2.2.4: Supplies the support category and the finite-to-infinite-S passage.

**Checks.**

- **empty** (degenerate): S=∅ gives R_S=R, T_S=0 and Perf_S=0.
- **all** (computation): S all primes gives R_S=K and T_S the finitely generated torsion modules.
- **integers** (computation): R=Z and S={(p)} gives R_S=Z[1/p], and T_S consists of finite p-power-torsion groups.
- **nonprincipal** (non-example): For a nonprincipal prime p, the construction uses p^(-n) as fractional ideals; it does not demand an element generating p.

**Acceptance.**

- S empty gives R_S=R and T_S=0; all nonzero primes give R_S=K.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`, `EnhancedDerivedSheaves:E5:abstract`.

**Sources:** CalmesIII, Definition preceding Lemma 2.1.2 and its proof, pp.33–34; Lemma 2.1.4, pp.34–35 — Valuation localization, the finite-support torsion category and its perfect-complex model..

#### Dedekind Poincaré localization

`GeneralAlgebraicKTheory:K.3/dedekind-poincare-localization` · theorem

Component: `GeneralAlgebraicKTheory:K.3:hermitian`.

For a Dedekind domain R, an invertible R-module M with involution and a set S of nonzero primes, Perf_S(R)→Perf(R)→Perf(R_S) is a Poincaré–Verdier sequence for each structure Q_M^≥m, m∈Z∪{−∞,+∞}. Hence the associated Grothendieck–Witt and L spectra have the support localization fibre sequences. This does not identify the support term with residue fields in the quadratic flavour.

**Hypotheses and conventions.**

- Use the actual Poincaré structures and Verdier/localization machinery from GN.6/HK.0; exact-category Qʰ alone does not supply them.
- No invertibility-of-two assumption. Localization before devissage is valid for the flavour family.

**Construction or proof.**

1. The flat localization R→R_S is a derived localization and its fibre is generated by perfect torsion objects from R_D/R.
2. Use divisor classes to show Pic(R)→Pic(R_S) and hence K0(R)→K0(R_S) are surjective.
3. Apply the generic Poincaré localization criterion with the induced coefficient and shift; its K0 condition is now checked.

**Acceptance.**

- S=∅ makes the support spectrum zero.
- Quadratic localization is retained, while quadratic residue-field devissage at 2 is not inferred.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/dedekind-S-localization-and-torsion`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6`, `HermitianKTheoryOfPoincareCategories:HK.0`.

**Sources:** CalmesIII, Proposition 2.1.3 and proof, p.34; Lemma 2.1.2, pp.33–34 — Verifies the Dedekind hypotheses for the imported localization theorem..

#### Shifted duality on the torsion heart

`GeneralAlgebraicKTheory:K.3/shifted-torsion-duality` · comparison

Component: `GeneralAlgebraicKTheory:K.3:hermitian`.

On Perf_S(R), the duality RHom_R(−,M[1]) restricts to T_S and is canonically T↦Hom_R(T,M_S/M), where M_S=R_S⊗_R M. In the symmetric flavour the induced space of forms on a torsion-heart object is discrete and identifies with symmetric bilinear linking pairings valued in M_S/M; the nondegenerate forms correspond to perfect such pairings.

**Hypotheses and conventions.**

- R is Dedekind, M is an invertible line with involution, and T has finite S-primary support. The shift by +1 is essential.
- Discreteness is a statement about the space of symmetric forms on heart objects, not that the entire Poincaré structure spectrum is discrete.

**Construction or proof.**

1. Apply RHom_R(T,−) to M→M_S→M_S/M. The middle term has no maps or higher Ext from T.
2. Global dimension one and injectivity of the divisible coefficient identify the resulting shifted dual with ordinary Hom on T_S.
3. Take the symmetric homotopy fixed-point form space. Its nonnegative homotopy is concentrated in degree zero on these objects, giving the linking-pairing description.

**Acceptance.**

- For R=Z, S={(p)} and T=Z/p, the dual is Hom(T,Z[1/p]/Z)≅Z/p.
- Using M without the shift moves the torsion dual out of the heart.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/dedekind-S-localization-and-torsion`, `GeneralAlgebraicKTheory:K.3/dedekind-poincare-localization`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

**Sources:** CalmesIII, Lemma 2.1.4 with proof, pp.34–35 — The t-structure and duality identify the linking-form heart without assuming 2 invertible..

#### Symmetric torsion devissage

`GeneralAlgebraicKTheory:K.3/symmetric-torsion-devissage` · theorem · planet: **Symmetric torsion devissage**

Component: `GeneralAlgebraicKTheory:K.3:hermitian`.

The sum of residue restriction functors ⊕_(p∈S)(Perf(R/p),Q^s_(RHom_R(R/p,M))[r])→(Perf_S(R),Q^s_M[r]) induces equivalences on K, Grothendieck–Witt and L spectra for every integer r. The canonical residue coefficient is (p^−1M/M)[−1]. It includes dyadic primes. The functor on the enhanced derived categories is generally not fully faithful, despite full faithfulness on the semisimple heart.

**Hypotheses and conventions.**

- Use finite-support direct sums. The residue coefficient comparison is GN.6/dedekind-residue-duality-line.
- Generic symmetric-heart L-theory, finite-length Witt devissage and the fundamental K/GW/L comparison are supplier obligations, not provided by exact K0 or ordinary K devissage alone.

**Construction or proof.**

1. Reduce to finite S by filtered continuity and primary decomposition.
2. For K use bounded-complex comparison and Quillen devissage for the torsion heart.
3. For L use the shifted self-dual t-structure, the symmetric-heart theorem, and finite-length symmetric/antisymmetric Witt devissage, retaining characteristic two.
4. Use the generic K/GW/L fibre sequence to obtain GW equivalence from the K and L equivalences. Transport arbitrary shifts using the supplier’s shift/sign convention.

**Acceptance.**

- R=Z, S={(2)} and r=1 still gives symmetric devissage.
- Ext¹_R(R/p,R/p) is nonzero, so a fully faithful enhanced residue embedding is not asserted.
- The uniformizer form has coefficient (M/pM)[r−1], not (M/pM)[r].

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/dedekind-S-localization-and-torsion`, `GeneralAlgebraicKTheory:K.3/shifted-torsion-duality`, `GeneralAlgebraicKTheory:K.3/devissage-theorem`, `GeneralAlgebraicKTheory:K.4/gillet-waldhausen`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-residue-duality-line`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6`, `HermitianKTheoryOfPoincareCategories:HK.6`.

**Sources:** CalmesIII, Lemma 2.2.1 and Corollary 2.2.3, pp.37–38; Theorem 2.2.4 and proof, pp.38–39 — The residue restriction is a Poincaré functor and the theorem proves the three invariant equivalences..

#### Symmetric L-theory localization

`GeneralAlgebraicKTheory:K.3/dedekind-symmetric-L-localization` · theorem

Component: `GeneralAlgebraicKTheory:K.3:hermitian`.

Under the Dedekind hypotheses, ⊕_(p∈S)L(R/p;Q^s_(RHom_R(R/p,M))[r])→L(R;Q^s_M[r])→L(R_S;Q^s_(M_S)[r]) is a fibre sequence, for each integer r. Its GW counterpart is imported from GN.6/dedekind-symmetric-localization. A uniformizer identifies the residue coefficient with (M/pM)[r−1]; the canonical sequence makes no such choices.

**Hypotheses and conventions.**

- No prime above 2 is removed for symmetric theory. The direct sum is finite-support.

**Construction or proof.**

1. Compose the support localization sequence with symmetric torsion devissage.
2. Use GN.6’s coefficient identification only after retaining the canonical twisted maps.
3. Compare the GW sequence with its existing GN.6 node rather than creating a second owner of that theorem.

**Acceptance.**

- For R=Z and S={(2)}, the left term retains the −1 residue shift.
- After choosing uniformizers, changing a choice changes coordinates, not the canonical localization sequence.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/dedekind-poincare-localization`, `GeneralAlgebraicKTheory:K.3/symmetric-torsion-devissage`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-symmetric-localization`.

**Sources:** CalmesIII, Theorem 7, pp.4–5; Corollary 2.2.5 and Remark 2.2.6, p.39 — The L companion of the already-owned GW residue localization sequence..

#### The lattice linking boundary

`GeneralAlgebraicKTheory:K.3/lattice-linking-boundary` · construction

Component: `GeneralAlgebraicKTheory:K.3:hermitian`.

Let (V,b) be a nondegenerate M_S-valued symmetric form on a finite projective R_S-module. Choose a finite projective integral R-lattice P⊂V with P⊂P*, where P*={x∈V | b(x,P)⊂M}. The finite S-primary module T=P*/P has nonsingular symmetric linking pairing c([x],[y])=b(x,y) mod M in M_S/M. The class of (T,c) in the symmetric L0 group of the torsion category with shifted coefficient M[1] is the localization boundary ∂0[V,b], independent of the integral lattice in that L group.

**Hypotheses and conventions.**

- R is Dedekind. Lattice existence uses the K0/Pic extension argument; P* is formed inside V.
- Independence is equality of L/Witt classes, not isometry of the finite linking modules. The target carries the +1 coefficient shift.

**Construction or proof.**

1. Extend the finite projective module and clear the finitely many denominators to produce an integral lattice.
2. Dualize its inclusion; the cofiber is P*/P with the displayed linking form. Check well-definedness and nonsingularity using the double dual identification.
3. Apply generic Poincaré surgery to identify this cofiber class with the connecting map. Compare nested lattices and then a common refinement to prove independence.

**API.**

| Declaration | Contract |
| --- | --- |
| LinkingBoundary.ofIntegralLattice | Form P*/P and its M_S/M-valued pairing. |
| LinkingBoundary.pairing_mk | The value on quotient representatives is b(x,y) mod M. |
| LinkingBoundary.nonsingular | The adjoint of c is an isomorphism with the linking dual. |
| LinkingBoundary.independent | Different integral lattices represent the same L0 class. |
| LinkingBoundary.localization | The linking class is ∂0 of the generic form. |

**Uses.**

- GeneralAlgebraicKTheory:K.3/second-residue-formula: Computes the localization boundary on rank-one forms.
- Calmès et al. Proposition 2.1.5: Supplies an explicit lattice representative for the canonical boundary.

**Checks.**

- **unimodular** (degenerate): P=P* gives the zero linking module.
- **uniformizer** (computation): For a DVR and form ⟨πu⟩ on K, choose P=R; T=π^−1R/R has induced residue class ⟨ū⟩ in uniformizer coordinates.
- **different_lattices** (non-example): For ⟨1⟩ over K of a DVR, P=R gives zero module while P=πR gives R/π²; their linking Witt classes agree although their lengths differ.

**Acceptance.**

- An already unimodular R-lattice P=P* gives zero boundary.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/dedekind-S-localization-and-torsion`, `GeneralAlgebraicKTheory:K.3/shifted-torsion-duality`, `GeneralAlgebraicKTheory:K.3/dedekind-poincare-localization`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

**Sources:** CalmesIII, Proposition 2.1.5 and proof, pp.35–36 — An explicit representative for the shifted symmetric boundary..

#### The second residue formula

`GeneralAlgebraicKTheory:K.3/second-residue-formula` · theorem

Component: `GeneralAlgebraicKTheory:K.3:hermitian`.

For a DVR R with fraction field K, uniformizer π and residue field k, identify the canonical residue line using π. For a unit u∈R×, the symmetric boundary satisfies δ⟨u⟩=0 and δ⟨πu⟩=⟨ū⟩. More generally δ⟨π^n u⟩ is zero for even n and ⟨ū⟩ for odd n, as a Witt/L0 class. The formula identifies the canonical boundary with the classical second residue map.

**Hypotheses and conventions.**

- Use symmetric forms and the coefficient/shift identification specified by π. Diagonal decomposition is not claimed in characteristic two for arbitrary symmetric forms.

**Construction or proof.**

1. Use P=R for the unit and uniformizer rank-one forms in the lattice linking construction.
2. The unit lattice is self-dual; the uniformizer lattice quotient is the residue line with coefficient ū.
3. Multiplication of the vector by a power of π reduces the exponent modulo two.

**Acceptance.**

- δ⟨1⟩=0 and δ⟨π⟩=⟨1⟩.
- δ⟨π²u⟩=0, so the formula depends on valuation parity.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/lattice-linking-boundary`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-residue-duality-line`.

**Sources:** CalmesIII, Lemma 2.2.9 and Remark 2.2.10, pp.40–41 — The boundary agrees with second residue in the specified coordinates..

#### Residue maps under ramification

`GeneralAlgebraicKTheory:K.3/ramified-residue-compatibility` · application

Component: `GeneralAlgebraicKTheory:K.3:hermitian`.

Maps between Dedekind localization sequences use canonical residue duality lines and derived restriction data. They are not in general the maps induced by bare residue-field extensions after arbitrary independent uniformizer choices. For Z→Z[i] at 2 and (1+i), the residue fields are both F2, but the induced residue L map is zero; the corresponding K0 residue map is multiplication by the ramification degree 2.

**Hypotheses and conventions.**

- Use the canonical twisted coefficients before choosing uniformizers. This example concerns the induced localization map, not ordinary scalar extension between the two residue fields.

**Construction or proof.**

1. Compare the two support localization sequences under scalar extension.
2. The torsion image of Z/2 in Z[i] has length two at (1+i), giving multiplication by two on K0 after devissage.
3. The source calculation on symmetric residue L-theory gives zero. This distinguishes the canonical ramified map from the identity of F2.

**Acceptance.**

- The K0 map sends 1 to 2, although the residue field map is the identity.
- The residue L map is zero in this example.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/symmetric-torsion-devissage`, `GeneralAlgebraicKTheory:K.3/dedekind-symmetric-L-localization`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-residue-duality-line`.

**Sources:** CalmesIII, Remark 2.2.6, p.39 — The ramified example prevents dropping the residue-line data..

#### The dyadic boundary of quadratic devissage

`GeneralAlgebraicKTheory:K.3/dyadic-quadratic-devissage-boundary` · application

Component: `GeneralAlgebraicKTheory:K.3:hermitian`.

Symmetric residue devissage above includes dyadic primes. It does not extend to quadratic structures at those primes: ΩLq(F2)→Lq(Z)→Lq(Z[1/2]) is not a fibre sequence. For a set S of non-dyadic primes of a Dedekind domain, the quadratic version follows from the symmetric result and the equivalence of flavours after inverting 2 on the residue fields.

**Hypotheses and conventions.**

- This asserts failure of the proposed residue-field devissage sequence, not failure of Poincaré localization with the true support category.
- Use periodic quadratic L-theory, distinct from the genuine symmetric flavour.

**Construction or proof.**

1. Import the coefficient/flavour comparison over rings with 2 invertible, and apply it at each non-dyadic residue field.
2. For Z at 2, the displayed sequence would contradict the known quadratic L2(Z) term; use the field and integer L computations from the hermitian owners.
3. Retain the support-category fibre sequence from localization in all flavours.

**Acceptance.**

- The source sequence with F2 cannot replace the true quadratic support term.
- Removing only dyadic primes is sufficient for the quadratic residue comparison stated here.

**Prerequisites:** `GeneralAlgebraicKTheory:K.3/dedekind-poincare-localization`, `GeneralAlgebraicKTheory:K.3/symmetric-torsion-devissage`, `HermitianKTheoryOfPoincareCategories:HK.7`, `GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3`.

**Sources:** CalmesIII, Remarks 2.2.7–2.2.8, pp.39–40 — The quadratic counterexample and the non-dyadic range are part of the routed source contract..

### K.4 — Waldhausen comparisons and localization

Prove approximation, change-of-weak-equivalence localization and bounded-complex comparison, retaining each factorization, closure and saturation hypothesis. The Gillet–Waldhausen model uses quasi-isomorphisms, not only chain homotopy equivalences.

#### Trivial cofibrations compute the weak-equivalence nerve

`GeneralAlgebraicKTheory:K.4/trivial-cofibration-nerve` · lemma

In a saturated Waldhausen category with a cylinder satisfying the cylinder axiom, the inclusion co_w C→wC of weak-equivalence cofibrations is a realisation equivalence.

**Hypotheses and conventions.**

- Both categories have every object of C; their morphisms differ.
- Cylinder cofibration and naturality axioms are required, not just an arbitrary functorial factorisation.

**Construction or proof.**

1. In the comma category over B, an object is a weak equivalence f:A→B. Its mapping cylinder T(f) has projection p:T(f)→B a weak equivalence and front/back inclusions j₁:A→T(f), j₂:B→T(f) cofibrations.
2. Since p∘j₁=f and p∘j₂=id, saturation makes both inclusions weak equivalences. Mapping-cylinder naturality for a cofibration A→A′ gives a weak-equivalence cofibration T(f)→T(f′), using the cylinder cofibration axiom and saturation.
3. These data define a functor T on the comma category, with natural transformations id→T←constant(B,id). Its nerve is therefore contractible.
4. Apply H.2’s Theorem A to the inclusion. The same construction applies to C(m,v) and S_nC, with pointwise cylinders.

**Acceptance.**

- Both comma natural transformations consist of trivial cofibrations.
- No cylinder-free factorisation hypothesis is substituted.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`, `StableHomotopyKTheory:H.2/quillen-theorem-a`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`.

**Sources:** Weibel.KBook.IV, Exercise 8.15, p.IV.75; read 2026-10-02; Waldhausen Lemma1.6.3 proof is the same cylinder contraction — The exercise’s comma-cylinder argument expanded with front and back inclusions..

#### Relative S identifies the change-of-equivalences bicategory

`GeneralAlgebraicKTheory:K.4/localization-relative-S-comparison` · comparison

For v⊂w on the same cofibration category C satisfying the fibration theorem hypotheses, let f:(C^w,v)→(C,v). Forgetting chosen quotients gives equivalences S_nf ≃ co_w,n C and vS_m(S_nf) ≃ v·co_w,n(S_mC), natural in m,n. Thus |vS.(S.f)| ≃ |v·co_w.S.C| compatibly with |vS.C|.

**Hypotheses and conventions.**

- C^w consists of objects with 0→C in w.
- The extension axiom and saturation identify w-cofibrations with cofibrations whose quotient lies in C^w.

**Construction or proof.**

1. For a cofibration A↣B with quotient Q, compare its sequence to A=A→0. If Q is w-trivial, extension gives A→B in w. Conversely, compare to 0→Q=Q using the w-equivalence A→B and saturation to obtain Q w-trivial.
2. An object of S_nf is a filtration C₀↣⋯↣C_n with all consecutive quotients w-trivial, together with choices of those quotients and their S-diagrams. Forget them to a chain of w-cofibrations.
3. The fibre over each such chain is the groupoid of choices of cokernels and quotient squares. Any two choices have a unique compatible isomorphism fixing the chain, so forgetting is fully faithful and essentially surjective.
4. Exchange S_m with the chain direction and apply the same argument objectwise. The universal property of quotients makes the comparisons natural in both simplicial directions and compatible with the map from vS.C.
5. Realise the resulting bisimplicial equivalences using H.2.

**Acceptance.**

- S₀f retains the object C₀ of C; it is not set to the zero category.
- The comparison commutes with the relative-sequence maps, so an abstract equivalence of spaces alone is insufficient.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/S-construction`, `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`, `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`, `StableHomotopyKTheory:H.2/bisimplicial-realization-lemma`.

**Sources:** Weibel.KBook.V, Proof of Theorem2.1, pp.V.12–13; read in full 2026-10-02 — The relative-S comparison and its naturality, used after the cylinder nerve reduction..

#### The Waldhausen localisation (fibration) theorem

`GeneralAlgebraicKTheory:K.4/fibration-theorem` · theorem · planet: **The fibration theorem**

Let a category with cofibrations carry two classes of weak equivalences, the smaller inside the larger, each making it a Waldhausen category, and let the subcategory of objects that are trivial for the larger class carry the smaller class. If the larger structure has a cylinder functor satisfying the cylinder axiom and the larger class satisfies saturation and the extension axiom, then the three K-theory spaces form a homotopy fibration, with the expected long exact sequence ending in the right-exact sequence of Grothendieck groups. Every hypothesis is used, and this node lists them as hypotheses rather than as background.

**Hypotheses and conventions.**

- Two classes of weak equivalences on the same category with cofibrations, the smaller contained in the larger.
- The larger structure has a cylinder functor satisfying the cylinder axiom; the larger class satisfies saturation and the extension axiom.
- The subcategory is the full Waldhausen subcategory of objects whose map from the zero object lies in the larger class, with the smaller class of weak equivalences.

**Construction or proof.**

1. Form the bicategory v·w.C of commuting squares. The inclusion of wC as vertically constant squares is a realisation equivalence by H.2’s swallowing lemma: at vertical nerve degree m, evaluation at the first object is a retraction and the arrows of the string give a natural transformation from its composite with the constant string to identity.
2. For each m identify the horizontal category with wC(m,v). Apply K.4/trivial-cofibration-nerve with pointwise cylinder to replace it by co_w C(m,v). Repeat for S_nC and realise both directions.
3. Use K.4/localization-relative-S-comparison to identify |v·co_w.S.C| with |vS.(S.f)|, compatibly with |vS.C|. The relative S-fibration now identifies its homotopy fibre with |vS.C^w|. Loop to obtain K(C^w,v)→K(C,v)→K(C,w).
4. The long exact sequence ends with K₀(C^w,v)→K₀(C,v)→K₀(C,w)→0. The last map is surjective because both categories have the same objects and w adds relations to their Grothendieck presentation.
5. General exact-functor localisation and central ring localisation have a separate possible cokernel in degree zero when the target contains new projectives. That qualification must not be transferred to this same-object change-of-weak-equivalences theorem.

**Acceptance.**

- The localisation sequence for a central multiplicative set of non-zero-divisors holds with the support term.
- Thomason's cofinality theorem is the special case with the Grothendieck-class weak equivalences.
- None of the four hypotheses may be dropped; the source's counterexamples show the statement fails without them.
- The map K₀(C,v)→K₀(C,w) is surjective for this same-object change of weak equivalences; central localisation of rings with new projectives is a separate statement.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`, `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`, `GeneralAlgebraicKTheory:K.4/trivial-cofibration-nerve`, `GeneralAlgebraicKTheory:K.4/localization-relative-S-comparison`, `StableHomotopyKTheory:H.2`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`.

**Sources:** Weibel.KBook.V, Waldhausen Localization Theorem 2.1, p. V.12 — The theorem with all four hypotheses.; Weibel.KBook.V, Theorem 2.6.3 and Caveat 7.1.1, pp. V.17 and V.52 — The standing instance and the warning that motivates K.6..

#### Iterated mapping cylinders of a simplex diagram

`GeneralAlgebraicKTheory:K.4/iterated-mapping-cylinder` · construction

For A₀→⋯→A_n define T(A₀)=A₀ and T(A₀→⋯→A_n)=T(T(A₀→⋯→A_{n−1})→A_n). It has a natural projection to A_n and compatible maps from every face cylinder. These give a functor from the nondegenerate face poset of Δ[n] to A. On a weak-equivalence string the projection and every face map are weak equivalences.

**Hypotheses and conventions.**

- A has the Waldhausen cylinder with its exactness/cofibration axiom and cylinder weak-equivalence axiom.
- The two-variable cylinder is applied to the composite of the earlier projection and the last string map.

**Construction or proof.**

1. Define the object and projection recursively. The last-face map is the front cylinder inclusion; for n=1 the first-face map is the back inclusion.
2. For i<n and n>1 define the face map by applying the cylinder functor to the already constructed face-cylinder map over id_A_n. Naturality of the front inclusion and the induction prove all ∂_i∂_j=∂_{j−1}∂_i identities.
3. Projections commute with face maps. The cylinder axiom makes each projection weak; on a weak-equivalence string, saturation then makes every face map weak.
4. For a finite nonsingular simplicial set X and q:X→N(wF/B), apply the construction to each nondegenerate simplex’s string. Nonsingularity makes its face category a poset, so the face identities glue to a functor T_q:simp^nd(X)→wF/B, with projection natural transformation T_q→q_*.

**API.**

| Declaration | Contract |
| --- | --- |
| IteratedCylinder | The recursive cylinder object of a composable string. |
| IteratedCylinder.projection | The natural weak-equivalence projection to the final vertex. |
| IteratedCylinder.face | Compatible cylinder maps for nondegenerate faces. |
| IteratedCylinder.face_comp | The face identities and their naturality. |
| Approximation.cylinderDiagram | The functor T_q to wF/B and its projection to q_*. |

**Uses.**

- The consuming nodes listed in this roadmap: For A₀→⋯→A_n define T(A₀)=A₀ and T(A₀→⋯→A_n)=T(T(A₀→⋯→A_{n−1})→A_n). It has a natural projection to A_n and compatible maps from every face cylinder. These give a functor from the nondegenerate face poset of Δ[n] to A. On a weak-equivalence string the projection and every face map are weak equivalences.

**Checks.**

- **iterated_cylinder_vertex** (degenerate): At a vertex the cylinder is the object itself.
- **iterated_cylinder_edge** (computation): At an edge it is T(A₀→A₁), with front and back inclusions.
- **iterated_cylinder_faces** (computation): The two codimension-two face maps agree.
- **iterated_cylinder_weak** (computation): For a weak-equivalence string all face maps and projections are weak equivalences.

**Acceptance.**

- For a one-arrow string the construction is the original mapping cylinder with its two inclusions.
- Two ways of passing to a codimension-two face give the same cylinder map.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`, `StableHomotopyKTheory:H.2`.

**Sources:** Waldhausen.KSpaces, Proof of Theorem1.6.7, printed pp.356–357 (PDF39–40); images read 2026-10-02 — The recursive cylinder, face maps and natural transformation..

#### The cylinder boundary is a cofibration

`GeneralAlgebraicKTheory:K.4/approximation-cylinder-boundary` · lemma

The cylinder diagram T_q on a finite nonsingular X extends in F/B to its poset of simplicial subsets, taking inclusions to cofibrations and unions to pushouts. The critical boundary map t(∂x)→t(x) is a cofibration for every nondegenerate simplex x.

**Hypotheses and conventions.**

- Use the preceding iterated cylinder and the exactness/cofibration axiom Cyl1.
- The extension is in F/B, not necessarily wF/B, because a union colimit need not map weakly to B.

**Construction or proof.**

1. Induct on skeleton dimension, setting t of a union to the pushout of the two pieces over their intersection. For a simplex x, T_q already supplies t(x); the only obstruction is its boundary latching map.
2. Let Λ^n_n x be the union of all proper faces except the last. The cylinder recursion and pushout preservation identify t(Λ^n_n x) with T(t(∂d_nx)→A_n). Its attachment to d_nx identifies t(∂x)→t(x) with t(d_nx) ∪_{t(∂d_nx)} T(t(∂d_nx)→A_n) → T(t(d_nx)→A_n).
3. The arrow-category map (t(∂d_nx)→A_n)→(t(d_nx)→A_n) is a cofibration by the induction and identity on A_n. The cylinder axiom says its front-inclusion arrow map is a cofibration in the arrow category; its latching condition is exactly the displayed boundary map.
4. Thus all attachments exist. Fixed pushouts and their universal properties give the union law and compatibility with inclusions; the object maps to B are induced from the original simplex maps.

**Acceptance.**

- The last-face attachment is checked explicitly, rather than assuming all finite colimits exist in A.
- The extension is asserted in the larger comma category F/B.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4/iterated-mapping-cylinder`, `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`.

**Sources:** Waldhausen.KSpaces, Proof of the sublemma to Theorem1.6.7, printed pp.357–358 (PDF40–41); images read 2026-10-02 — The horn decomposition, union pushout and cylinder latching calculation..

#### Approximation comma categories are contractible

`GeneralAlgebraicKTheory:K.4/approximation-comma-contractibility` · lemma

For F satisfying approximation between saturated Waldhausen categories, with a cylinder on A satisfying its axiom, every comma category wF/B has contractible classifying space.

**Hypotheses and conventions.**

- H.2 supplies the last-vertex equivalence from the simplex-category nerve, its nonsingular face-poset variant, simplicial approximation of maps from finite subdivided spheres, and the CW Whitehead theorem.
- The iterated-cylinder diagram and boundary construction are specific to F; the topological detection lemmas belong to H.2.

**Construction or proof.**

1. App2 applied to 0→B makes wF/B nonempty. Coproducts in F/B and App2 give a common target for any two objects; saturation and reflection show the arrows to it belong to wF/B, proving connectedness.
2. More generally, if a diagram in wF/B has a cone in F/B with vertex (A′,F(A′)→B), apply App2 to that vertex to get (A″,F(A″)≃B). Saturation in B and reflection by F make all cone arrows weak equivalences. The cone therefore exists in wF/B.
3. For q:X→N(wF/B), X finite and nonsingular, replace its face-poset diagram by T_q using the projection natural transformation. The boundary construction extends T_q to simplicial subsets of X; since X is terminal in that poset, it gives a cone in F/B.
4. Use the previous cone-improvement step to contract T_q in wF/B. The natural transformation contracts q_*, and the last-vertex equivalences transfer the contraction to q.
5. Represent every homotopy class by a map from a finite subdivided sphere using H.2. All such maps contract; the connected CW classifying space is weakly contractible, hence contractible by Whitehead.

**Acceptance.**

- Connectedness alone is not used to conclude contractibility.
- The contraction covers every finite subdivided sphere, giving vanishing in all degrees.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4/iterated-mapping-cylinder`, `GeneralAlgebraicKTheory:K.4/approximation-cylinder-boundary`, `StableHomotopyKTheory:H.2`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`.

**Sources:** Waldhausen.KSpaces, Theorem1.6.7, printed pp.354–359 (PDF37–42); text and images read 2026-10-02 — The cone-improvement observation, finite nonsingular detection and last-vertex conclusion..

#### Approximation lifts filtered objects

`GeneralAlgebraicKTheory:K.4/approximation-lifts-S-filtrations` · lemma

If F:A→B has Waldhausen’s approximation property, so does S_nF:S_nA→S_nB for every n.

**Hypotheses and conventions.**

- F reflects weak equivalences and every F(A)→B factors as F of a cofibration followed by a weak equivalence.
- S_n weak equivalences are objectwise; gluing extends the comparison to quotient diagrams.

**Construction or proof.**

1. Induct on the filtration length. Having lifted A′_{0,n−1} and its map to B_{0,n−1}, form A_{0,n} ∪_{A_{0,n−1}} A′_{0,n−1}.
2. The given filtration map induces F of this pushout → B_{0,n}. Apply approximation to obtain a cofibration to A′_{0,n} and a weak equivalence F(A′_{0,n})→B_{0,n}.
3. The composite A′_{0,n−1}↣pushout↣A′_{0,n} defines the next filtration cofibration. Choose quotient objects; the gluing axiom identifies their images up to weak equivalence with the target quotient objects.
4. Objectwise reflection of weak equivalences gives App1 for S_nF. The induction supplies App2, including the latching pushout condition.

**Acceptance.**

- For n=1 the assertion is the original approximation property.
- The construction lifts quotients and the latching cofibration, not only individual filtration objects.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/S-construction`, `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`.

**Sources:** Waldhausen.KSpaces, Lemma1.6.6, printed p.353 (PDF36); read 2026-10-02 — The filtration-length induction with its pushout..

#### The Approximation theorem

`GeneralAlgebraicKTheory:K.4/approximation-theorem` · theorem · planet: **The Approximation theorem**

Let an exact functor of saturated Waldhausen categories detect weak equivalences, and suppose the approximate lifting property holds: every map out of the image of an object factors as the image of a map followed by a weak equivalence. If the source has a cylinder functor satisfying the cylinder axiom, then the functor induces homotopy equivalences of the weak-equivalence S-constructions and of the K-theory spaces. The theorem is what produces the standard models of K-theory by complexes, and the source records that it fails without the cylinder hypothesis, with an explicit pair of categories whose Grothendieck groups differ.

**Hypotheses and conventions.**

- Both categories are saturated; the functor detects weak equivalences in both directions.
- The approximate lifting property holds, and the factoring map may be taken to be a cofibration.
- The source has a cylinder functor satisfying the cylinder axiom. The source records that without it the conclusion fails.

**Construction or proof.**

1. Apply K.4/approximation-comma-contractibility and H.2’s Theorem A to get |wA|≃|wB|.
2. K.4/approximation-lifts-S-filtrations verifies the same hypotheses for every S_nF, including the induced pointwise cylinder and reflection of weak equivalences. Thus |wS_nA|≃|wS_nB| for all n.
3. Realise the degreewise equivalences by H.2’s bisimplicial realisation theorem and loop, giving K(A)≃K(B).
4. The cylinder-free App counterexample remains: the split-exact and nonsplit-exact models of an exact category can have distinct K₀. The strong cylinder and saturation hypotheses have not been replaced by a mere objectwise approximation property.

**Acceptance.**

- The K-theory of a ring is that of its perfect complexes.
- The K-theory of an abelian category is that of its bounded complexes.
- Without the cylinder hypothesis the theorem is false, and the source's counterexample witnesses it.
- Enlarging the cofibrations with the same weak equivalences does not change K-theory.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4/fibration-theorem`, `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`, `GeneralAlgebraicKTheory:K.4/approximation-comma-contractibility`, `GeneralAlgebraicKTheory:K.4/approximation-lifts-S-filtrations`, `StableHomotopyKTheory:H.2/quillen-theorem-a`, `StableHomotopyKTheory:H.2/bisimplicial-realization-lemma`.

**Sources:** Weibel.KBook.V, Waldhausen Approximation Theorem 2.4 with its proof, p. V.15 — The theorem with its three conditions and the first step of the proof.; Weibel.KBook.V, Changing cofibrations 2.5.1, p. V.16 — The consequence about changing cofibrations.; Waldhausen.KSpaces, Theorem1.6.7, printed pp.354–359 (PDF37–42); read 2026-10-02 — The previously omitted finite-diagram argument is now decomposed into separate nodes..

#### The Gillet-Waldhausen comparison

`GeneralAlgebraicKTheory:K.4/gillet-waldhausen` · theorem · planet: **The Gillet-Waldhausen comparison**

For an exact category closed under kernels of surjections in an ambient abelian category, the inclusion into the bounded complexes, with degreewise admissible monomorphisms as cofibrations and QUASI-ISOMORPHISMS as weak equivalences, induces a homotopy equivalence of K-theory spaces. The closure hypothesis is what makes the acyclic objects the admissibly exact complexes; without it the source gives a repaired statement in which quasi-isomorphisms are computed in the category of left exact functors and cofinality is used. Quasi-isomorphisms may not be replaced by chain homotopy equivalences in categories where the two differ.

**Hypotheses and conventions.**

- The exact category is given as a full subcategory of an abelian category M, closed under extensions and carrying the pinned induced structure (ExactStructure.fullSubcategory of ExactStructure.abelian M), and closed under kernels of surjections in M, in the source's sense (Weibel II.7.0.1). The ambient M is part of the data, since the pinned carrier has no Gabriel–Quillen embedding.
- The weak equivalences are the quasi-isomorphisms computed in M, not chain homotopy equivalences. The intrinsic statement without the closure hypothesis computes them in the category of left exact functors (the Gabriel–Quillen embedding of Weibel's Exercise II.7.8), which neither library has; that statement is recorded, not decomposed.
- The proof uses the fibration theorem and a cylinder functor on the complexes, namely the mapping cylinder.

**Construction or proof.**

1. Record the Waldhausen structure on the bounded complexes and the mapping cylinder that makes the fibration theorem applicable.
2. Prove that for a bounded range the acyclic objects are the admissibly exact complexes, using the closure hypothesis.
3. Compute the K-theory of the categories of complexes concentrated in a bounded range by additivity, and identify the cofibre of the comparison map with the K-theory of the category through the Euler characteristic.
4. Pass to the colimit over the range and apply the fibration theorem to the inclusion of the isomorphisms in the quasi-isomorphisms.
5. State the intrinsic statement without the closure hypothesis and what it costs: the quasi-isomorphisms must be computed in the left exact functors and cofinality must be invoked.
6. Record the degree-zero shadow, that the Grothendieck group of the bounded complexes is that of the category with the alternating-sum formula, and the non-example about chain homotopy equivalences.

**Acceptance.**

- The K-theory of an exact category is that of its bounded complexes with quasi-isomorphisms.
- In degree zero the comparison is the alternating-sum formula for the class of a complex.
- Replacing quasi-isomorphisms by chain homotopy equivalences changes the statement and needs its own argument.
- Without the closure hypothesis the naive statement can fail in degree zero; the intrinsic form is the one to use.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4/approximation-theorem`, `GeneralAlgebraicKTheory:K.4/fibration-theorem`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `tauceti:TauCeti.ExactStructure.abelian`, `tauceti:TauCeti.ExactStructure.fullSubcategory`.

**Sources:** Weibel.KBook.V, Theorem 2.2 (Gillet-Waldhausen) with the opening of its proof, p. V.13 — The theorem and the structure of its proof.; Weibel.KBook.V, Remark 2.2.1, p. V.14 — The intrinsic statement without the closure hypothesis..

#### Factor a finite diagram without a cylinder

`GeneralAlgebraicKTheory:K.4/finite-poset-factorization` · lemma

If C has factorization, every map X→Y of finite-poset diagrams factors X↣Z→Y into a latching cofibration and a pointwise weak equivalence.

**Hypotheses and conventions.**

- P is finite; no global functorial choice is asserted.

**Construction or proof.**

1. Remove a maximal p and factor on P\{p} by induction.
2. Form the relative latching colimit at p using cofibrant-poset-diagrams. Its map to Y(p) factors by the objectwise existence property as a cofibration to Z(p) followed by a weak equivalence.
3. The universal property gives all structural arrows into Z(p) and extends the natural transformation. This supplies the required latching condition and finishes the finite induction.

**Acceptance.**

- This factors a fixed finite diagram without constructing a cylinder functor on all C.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/waldhausen-factorization`, `GeneralAlgebraicKTheory:K.4:construction/cofibrant-poset-diagrams`.

**Sources:** Schlichting.NegativeK.2003, AppendixA.9 p.26 — Read AppendixA in full, pp.24–27. The packet owns the general non-functorial factorization apparatus in early K.4; K.6 imports it. Generic finite-poset nerve and realization facts remain precise H.1/H.2 requests..

#### Contract the approximation comma categories

`GeneralAlgebraicKTheory:K.4/approximation-factorization-comma` · lemma

Suppose F:A→B satisfies approximation, A has factorization, and both weak-equivalence classes are saturated. Then every comma category (wF↓B) is contractible.

**Hypotheses and conventions.**

- F preserves cofibrations, their pushouts and weak equivalences; it reflects weak equivalences and satisfies App2.
- The finite-poset nerve test is imported from H.1, not asserted as an already built baseline fact.

**Construction or proof.**

1. App2 applied to 0→B gives an object of (wF↓B). For a functor P→(wF↓B) with P finite, factor 0→X as a cofibrant diagram Y→X, pointwise weak, by finite-poset-factorization.
2. Its colimit exists and is preserved by F because it is assembled from cofibration pushouts. The quotient maps induce F(colimY)→B; App2 factors this through F(Z) weakly equivalent to B.
3. For each p, F(Y(p))→F(Z) is weak by saturation, because both map weakly to B. Reflection gives Y(p)→Z weak. Thus X←Y→constant(Z) is a diagramwise contraction in the actual comma category.
4. For two objects the finite discrete-poset case gives connectedness. Every finite sphere map into the nerve factors, after subdivision, through a finite-poset nerve and is null by the preceding construction. The requested H.1/H.2 finite-poset/CW test gives contractibility. No inference uses an infinite discrete poset of all components.

**Acceptance.**

- The weak arrows of the contraction lie over B and use the actual weak-equivalence comma category.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4/finite-poset-factorization`, `StableHomotopyKTheory:H.1`, `StableHomotopyKTheory:H.2`.

**Sources:** Schlichting.NegativeK.2003, Proof of ApproximationA.2 and LemmaA.10 pp.26–27 — Read AppendixA in full, pp.24–27. The packet owns the general non-functorial factorization apparatus in early K.4; K.6 imports it. Generic finite-poset nerve and realization facts remain precise H.1/H.2 requests..

#### Approximation without a functorial cylinder

`GeneralAlgebraicKTheory:K.4/approximation-with-factorizations` · theorem

Under the preceding saturation, factorization and App1/App2 hypotheses, F:wA→wB and wS.F:wS.A→wS.B induce equivalences on nerve realizations and hence on K-theory.

**Hypotheses and conventions.**

- A and B are Waldhausen categories; A has factorization and F satisfies approximation. No factorization assumption on B or functorial cylinder on A is imposed beyond these hypotheses.

**Construction or proof.**

1. Apply TheoremA to the contracted comma categories for F.
2. approximation-lifts-S-filtrations proves App1/App2 for S_nF by its pushout induction. Applying it to id_A shows S_nA has factorization. Saturation is inherited degreewise.
3. Repeat the comma argument for every S_nF; H.2’s realization contract promotes degreewise nerve equivalences to a weak-equivalence S-construction equivalence. Loop to obtain the K-map equivalence.

**Acceptance.**

- The usual cylinder approximation theorem is a specialization; Frobenius pairs need only the weaker factorization hypothesis.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4/approximation-factorization-comma`, `GeneralAlgebraicKTheory:K.4/approximation-lifts-S-filtrations`, `StableHomotopyKTheory:H.2`.

**Sources:** Schlichting.NegativeK.2003, AppendixA.2 p.24 and its proof pp.26–27 — Read AppendixA in full, pp.24–27. The packet owns the general non-functorial factorization apparatus in early K.4; K.6 imports it. Generic finite-poset nerve and realization facts remain precise H.1/H.2 requests..

#### Acyclic cofibrations have the weak-equivalence nerve

`GeneralAlgebraicKTheory:K.4/acyclic-cofibrations-with-factorizations` · lemma

For a saturated Waldhausen category with factorization, the inclusion wC∩cofC→wC induces a nerve equivalence.

**Hypotheses and conventions.**

- The factorization is existential and saturation is required.

**Construction or proof.**

1. For each B, the comma category of acyclic cofibrations mapping weakly to B contains identity(B). A finite-poset diagram gives X→constant(B).
2. Factor X∨constant(B)→constant(B) by finite-poset-factorization through Y. The structural arrows of X are cofibrations, and cofibrant-poset-diagrams makes Y’s structural arrows cofibrations.
3. Saturation with Y→constant(B) makes every structural arrow of Y weak. The maps X→Y and constant(B)→Y are pointwise cofibrations and weak equivalences, so they form a contraction in the actual comma category.
4. Use the finite-poset nerve test and TheoremA. This supplies the cylinder-free replacement for K.4/trivial-cofibration-nerve.

**Acceptance.**

- Dropping saturation would not justify weak equivalences on Y’s structural arrows.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4/finite-poset-factorization`, `GeneralAlgebraicKTheory:K.4:construction/cofibrant-poset-diagrams`, `StableHomotopyKTheory:H.1`, `StableHomotopyKTheory:H.2`.

**Sources:** Schlichting.NegativeK.2003, AppendixA.11 p.27 — Read AppendixA in full, pp.24–27. The packet owns the general non-functorial factorization apparatus in early K.4; K.6 imports it. Generic finite-poset nerve and realization facts remain precise H.1/H.2 requests..

#### Fibration without a functorial cylinder

`GeneralAlgebraicKTheory:K.4/fibration-with-factorizations` · theorem

Let v⊂w be weak equivalences on the same cofibration category, with both Waldhausen structures. If the w structure has factorization and w satisfies saturation and extension, K(C^w,v)→K(C,v)→K(C,w) is a homotopy fibration. The K₀ map of the last two terms is surjective.

**Hypotheses and conventions.**

- Only w-factorizations are needed. C^w consists of the objects whose zero map is in w, equipped with v.

**Construction or proof.**

1. Use the same swallowing/relative-S proof as K.4/fibration-theorem, replacing only the cylinder contraction by acyclic-cofibrations-with-factorizations. Apply this in finite v-diagram categories and S_nC, using their finite factorization and filtration contracts.
2. The relative-S comparison uses quotient choices, saturation and extension, and does not use a cylinder. Its relative S-fibration identifies the homotopy fibre as before.
3. Loop and take the long exact sequence. Since the same objects generate both Grothendieck groups and w adds relations, K₀(C,v)→K₀(C,w) is onto. This does not assert degree-zero surjectivity for a ring localization whose target has new projectives.

**Acceptance.**

- Frobenius-pair change of weak equivalences gives Schlichting11.18 without a functorial cylinder.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4/acyclic-cofibrations-with-factorizations`, `GeneralAlgebraicKTheory:K.4/finite-poset-factorization`, `GeneralAlgebraicKTheory:K.4/approximation-lifts-S-filtrations`, `GeneralAlgebraicKTheory:K.4/localization-relative-S-comparison`, `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`, `StableHomotopyKTheory:H.2`.

**Sources:** Schlichting.NegativeK.2003, AppendixA.3 p.25 and its proof p.27; compared with read Waldhausen§1.6 — Read AppendixA in full, pp.24–27. The packet owns the general non-functorial factorization apparatus in early K.4; K.6 imports it. Generic finite-poset nerve and realization facts remain precise H.1/H.2 requests..

### K.4:construction — The S-construction, additivity and deloopings

Construct the actual S-diagram categories with chosen pushouts along cofibrations, additivity and relative S. Retain the weak-equivalence nerve, latching cofibrations and the realization hypotheses at each delooping step.

#### Categories with cofibrations, Waldhausen categories and their extra axioms

`GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories` · definition · planet: **Waldhausen category**

A CATEGORY WITH COFIBRATIONS is a category with a subcategory of cofibrations such that every isomorphism is a cofibration, there is a distinguished zero object whose map to every object is a cofibration, and pushouts along cofibrations exist with cofibrations stable under cobase change. A WALDHAUSEN CATEGORY adds a subcategory of weak equivalences containing the isomorphisms, closed under composition and satisfying the gluing axiom, that the pushout of a map of cofibration squares whose components are weak equivalences is a weak equivalence. Three further axioms are used only by subsequent theorems and are stated separately: SATURATION, that in a composable pair whose composite is a weak equivalence one factor is a weak equivalence exactly when the other is; the EXTENSION axiom, that a map of cofibration sequences whose sub and quotient maps are weak equivalences has total map a weak equivalence; and the CYLINDER axiom for a cylinder functor. An exact category is a Waldhausen category with the admissible monomorphisms as cofibrations and the isomorphisms as weak equivalences.

**Hypotheses and conventions.**

- The categories are small, so that the weak-equivalence classes form a set and the Grothendieck group is defined.
- An exact functor preserves the zero object, cofibrations, weak equivalences and the pushouts along cofibrations.
- Saturation, extension and the cylinder axiom are NOT part of the definition; each theorem of K.4 names the ones it uses.

**Construction or proof.**

1. State the three cofibration axioms and the gluing axiom, in the source's order.
2. Define exact functors and Waldhausen subcategories.
3. Define the Grothendieck group of a Waldhausen category by generators the weak-equivalence classes and relations from the cofibration sequences, which is the degree-zero invariant the whole layer refines.
4. State saturation, the extension axiom and the cylinder axiom separately, each with the theorem that uses it.
5. Record the two standing examples: an exact category with admissible monomorphisms and isomorphisms, whose cofibration sequences are the admissible exact sequences; and bounded complexes over an exact category with degreewise admissible monomorphisms and quasi-isomorphisms.
6. Record the warning the source attaches to the second example: the Grothendieck group of the unbounded complexes vanishes by the Eilenberg swindle, so boundedness is not decorative.
7. Record what the pinned libraries have: Mathlib's model categories have cofibrations, fibrations and weak equivalences but are not Waldhausen categories, and the gluing axiom is not isolated anywhere.

**API.**

| Declaration | Contract |
| --- | --- |
| CategoryWithCofibrations | The three cofibration axioms. |
| WaldhausenCategory | Cofibrations together with weak equivalences and the gluing axiom. |
| WaldhausenCategory.IsSaturated | The saturation axiom, as a separate hypothesis. |
| WaldhausenCategory.HasExtensionAxiom | The extension axiom, as a separate hypothesis. |
| WaldhausenCategory.CylinderFunctor | A cylinder functor and its axiom. |
| WaldhausenCategory.K0 | The Grothendieck group. |
| WaldhausenCategory.ofExact | An exact category as a Waldhausen category. |
| WaldhausenCategory.exactFunctor | Exact functors between Waldhausen categories. |

**Uses.**

- K.4:construction, the S-construction: The construction consumes exactly this data.
- K.4, the fibration and approximation theorems: Each names which of the three extra axioms it uses.
- K.6 and K.7: The nonconnective spectrum and the derived invariance statement are about the K-theory of a Waldhausen category.

**Checks.**

- **exact_is_waldhausen** (computation): An exact category is a Waldhausen category with the stated structure.
- **K0_agrees** (compatibility): Its Grothendieck group is that of the exact category.
- **unbounded_complexes_vanish** (non-example): The Grothendieck group of the unbounded complexes vanishes, so a definition that forgot boundedness would be wrong.
- **axioms_separate** (non-example): Saturation, extension and the cylinder axiom are independent extra hypotheses, not part of the definition.

**Acceptance.**

- An exact category is a Waldhausen category, and its cofibration sequences are the admissible exact sequences.
- The Grothendieck group of a Waldhausen category specialises to that of an exact category in the first example.
- The Grothendieck group of the unbounded complexes over an exact category vanishes; the bounded ones give the group of the category.
- Saturation, extension and the cylinder axiom are separate hypotheses and no theorem here may assume them silently.

**Prerequisites:** `mathlib:CategoryTheory.Limits.HasPushouts`, `tauceti:TauCeti.ExactStructure`.

**Sources:** Weibel.KBook.II, Definition 9.1 with (W0) to (W2), p. II.87 — The cofibration axioms.; Weibel.KBook.II, Definition 9.1.1 and Definition 9.1.2, pp. II.87 to II.88 — The definition and the degree-zero invariant.; Weibel.KBook.IV, Extension axiom 8.2.1, p. IV.67 — The extension axiom..

#### Waldhausen's S-construction and the induced cofibrations

`GeneralAlgebraicKTheory:K.4:construction/S-construction` · construction · planet: **Waldhausen's S-construction**

For a category with cofibrations, the n-th term of the S-construction is the category whose objects are sequences of n cofibrations together with a compatible choice of all subquotients, with morphisms the natural transformations of such diagrams; the zeroth term is trivial, the first is the category itself, and the second is the extension category, whose three face maps are the quotient, total and sub functors. The faces delete a row and a column and the degeneracies duplicate, and they are exact, so the terms form a simplicial category with cofibrations; taking the subcategories of weak equivalences gives a simplicial category whose realisation is the object of the next node. The cofibrations of the n-th term are NOT the objectwise ones: a map is a cofibration when for every triple of indices the induced map of cofibration sequences is a cofibration of the second term, which is a condition on the canonical maps out of the pushouts. The stage text's warning is exactly this, and this node states it as a hypothesis rather than a remark.

**Hypotheses and conventions.**

- The ambient category is a small category with cofibrations; for the weak-equivalence subcategories it is a Waldhausen category.
- The choices of subquotients are part of the data of an object and must be compatible with the displayed staircase diagram.
- The cofibrations of the n-th term are defined by the latching condition stated above; objectwise cofibrations do not in general satisfy the pushout conditions required.

**Construction or proof.**

1. Define the objects of the n-th term with their compatible choices of subquotients.
2. Define the morphisms and the latching condition that makes a morphism a cofibration, and prove that the resulting structure is a category with cofibrations.
3. Define the faces and degeneracies by deleting and duplicating rows and columns and prove that they are exact and satisfy the simplicial identities.
4. Identify the second term with the extension category E(C) of Weibel II.9.3, the category of cofibration sequences with the cofibrations of II.9.3, and its three faces with the quotient, total and sub functors. For an exact category regarded as a Waldhausen category this is the pinned category of conflations, TauCeti.ExactStructure.ConflationCategory, not the category EA of IV.7.3 with its Q-type morphisms. It is the category Waldhausen additivity is about.
5. Define the subcategories of weak equivalences and check that they are preserved.
6. Record the warning as a non-example: a map that is objectwise a cofibration need not satisfy the latching condition, and a formalisation that defined the cofibrations objectwise would not have a category with cofibrations.

**API.**

| Declaration | Contract |
| --- | --- |
| SConstruction | The n-th term of the S-construction. |
| SConstruction.cofibration | The latching condition defining its cofibrations. |
| SConstruction.face | The face functors. |
| SConstruction.degeneracy | The degeneracy functors. |
| SConstruction.simplicial | The simplicial identities. |
| SConstruction.two_eq_ext | The second term is the extension category. |

**Uses.**

- K.4:construction, the K-theory space: The space is built from the weak-equivalence subcategories of these terms.
- K.4:construction, additivity and the relative S-construction: Both are statements about this simplicial category and its relative version S.f.
- K.6: The nonconnective spectrum applies this construction to a Frobenius pair.

**Checks.**

- **S2_is_extension** (computation): The second term is the extension category of the ambient category.
- **faces_exact** (computation): The faces and degeneracies are exact.
- **latching_not_objectwise** (non-example): A map that is objectwise a cofibration need not be a cofibration of the n-th term.
- **S1_trivial** (degenerate): The first term is the ambient category and the zeroth is trivial.

**Acceptance.**

- The zeroth term is trivial, the first is the category itself and the second is the extension category.
- The three faces from the second term to the first are the quotient, the total and the sub functors.
- The cofibrations of the n-th term are given by the latching condition; the objectwise definition is a non-example.
- For an exact category the second term is the pinned category of conflations with the cofibrations of II.9.3, not the category EA of K.2:plus.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`, `tauceti:TauCeti.ExactStructure.ConflationCategory`.

**Sources:** Weibel.KBook.IV, Definition 8.3 with (8.3.0), p. IV.67 — The construction.; Weibel.KBook.IV, Definition 8.3.1, p. IV.67 — The faces and degeneracies; Weibel.KBook.IV, §8.3, the low terms, p. IV.67 — The low terms: S0C = 0 and S1C = C.

#### The K-theory space of a Waldhausen category

`GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category` · definition

The K-theory space of a small Waldhausen category is the loop space of the realisation of the weak-equivalence S-construction, and its K-groups are the homotopy groups of that loop space, so the n-th K-group is the (n+1)-st homotopy group of the realisation. The fundamental group of the realisation is the Grothendieck group of the category, which fixes the indexing; the realisation is an H-space under coproduct. Applying the S-construction degreewise gives the iterated multisimplicial categories S.ⁿC; the equivalences between the realisations of consecutive ones are K.4/delooping-and-the-spectrum, and their assembly into the connective Ω-spectrum is StableHomotopyKTheory:H.5:S-delooping.

**Hypotheses and conventions.**

- The category is small and Waldhausen; no extra axiom is needed for the definition.
- The basepoint is the trivial object of the zeroth term, whose realisation is a point.
- The iterated construction S.ⁿC is formed here, as the stage text's 'iterate S'; the identification of consecutive realisations is K.4/delooping-and-the-spectrum, and the Ω-spectrum is assembled by StableHomotopyKTheory:H.5:S-delooping. Neither is claimed by this node, which precedes both.

**Construction or proof.**

1. Define the bisimplicial object and its realisation, and define the K-theory space as its loop space.
2. Prove that the fundamental group of the realisation is the Grothendieck group, by the presentation of the fundamental group of a simplicial space whose zeroth term is a point.
3. Define the K-groups with the stated shift and prove that they are abelian.
4. Record the H-space structure induced by the coproduct.
5. Construct the iterated S-construction S.ⁿC degreewise, as multisimplicial Waldhausen categories with their weak-equivalence nerves; the equivalences |wS.ⁿC| ≃ Ω|wS.ⁿ⁺¹C| are proved in K.4/delooping-and-the-spectrum and the spectrum is assembled in H.5:S-delooping.
6. Record the canonical map from the realisation of the weak-equivalence subcategory to the K-theory space, and that it is not a homotopy equivalence in general.

**API.**

| Declaration | Contract |
| --- | --- |
| WaldhausenCategory.KSpace | The K-theory space. |
| WaldhausenCategory.KGroup | Its K-groups, with the stated shift. |
| WaldhausenCategory.pi1_eq_K0 | The fundamental group of the realisation is the Grothendieck group. |
| WaldhausenCategory.KSpace_map | The map induced by an exact functor. |
| WaldhausenCategory.hSpace | The H-space structure from the coproduct. |
| WaldhausenCategory.iteratedS | The multisimplicial Waldhausen categories S.ⁿC obtained by applying the S-construction degreewise n times, with their weak-equivalence nerves; the deloopings between them are K.4/delooping-and-the-spectrum's. |

**Uses.**

- K.4, every theorem of the layer: Additivity, delooping, fibration and approximation are all statements about this space.
- K.5: The relative theory is the homotopy fibre of a map of these spaces.
- K.6: The nonconnective spectrum is built from this space applied to the iterated suspension of a Frobenius pair.

**Checks.**

- **pi1_is_K0** (computation): The fundamental group of the realisation is the Grothendieck group.
- **exact_category_case** (compatibility): For an exact category the groups agree with the Q-construction groups.
- **not_group_completion** (non-example): The map from the weak-equivalence subcategory is not a homotopy equivalence in general.
- **trivial_category** (degenerate): The K-theory space of the zero Waldhausen category is contractible.

**Acceptance.**

- The fundamental group of the realisation is the Grothendieck group, which is what fixes the indexing.
- For an exact category the groups agree with those of K.1, by the comparison of the next node.
- The canonical map from |wC| to K(C) need not be a homotopy equivalence or a group completion; the split exact case is supplied by K.2:plus/H.4.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/S-construction`, `mathlib:CategoryTheory.nerve`, `mathlib:SSet.toTop`, `mathlib:HomotopyGroup`.

**Sources:** Weibel.KBook.IV, Proposition 8.4 and Definition 8.5, p. IV.68 — The degree-zero identification and the definition.; Weibel.KBook.IV, Infinite Loop Structure 8.5.5, p. IV.69 — The iteration of the construction; the delooping equivalences it invokes are K.4/delooping-and-the-spectrum's and the spectrum is H.5:S-delooping's..

#### Edgewise S-diagrams and composable Q-spans

`GeneralAlgebraicKTheory:K.4:construction/edgewise-S-Q-diagrams` · construction

For an exact A, the functor iS_{2n+1}A→iQ_nA sends a filtration indexed by n′<⋯<0′<0<⋯<n to the Q-chain with vertices A(j′,j), and arrows A(j′,j)↞A((j+1)′,j)↣A((j+1)′,j+1). It is an equivalence in every degree and these functors commute with the edgewise simplicial operators.

**Hypotheses and conventions.**

- iQ_nA is the groupoid of length-n composable Q-arrows and their componentwise isomorphisms.
- Q-arrows are isomorphism classes of admissible spans; quotient choices are retained in S and forgotten only modulo those isomorphisms.

**Construction or proof.**

1. Read off the diagonal and near-diagonal subquotients to form the spans. Quotient exactness gives deflation and inflation legs. The intermediate squares are pullbacks, so removing a diagonal vertex gives exactly composition in Q. This proves compatibility with every face; duplication gives the degeneracies.
2. Reconstruct a flag inductively from a Q-chain. At the last span X↞U↣Y, pull back the previously reconstructed flag in X along U↠X, prepend its kernel and append Y. Base n=0 is the single object. Exact base change gives a flag of length 2n+1.
3. Choose its quotient objects. The reconstructed diagonal spans recover the given Q-chain. Changing span representatives or pullbacks gives the unique compatible isomorphism fixing the diagonal objects.
4. A componentwise isomorphism of Q-chains uniquely extends to all intermediate pullbacks, kernels and quotients. Conversely a flag isomorphism restricts to that chain isomorphism. This gives full faithfulness as well as essential surjectivity.
5. The forward functor is independent of reconstruction choices and strictly respects operators because equal composite spans are equal in Q’s isomorphism-class hom sets.

**API.**

| Declaration | Contract |
| --- | --- |
| SConstruction.edgewiseQ | The simplicial functor given by diagonal subquotients and the displayed spans. |
| SConstruction.edgewiseQ_degreeEquiv | The degree-n equivalence iS_{2n+1}A≌iQ_nA. |
| SConstruction.edgewiseQ_faces | Face operators agree with span composition by the intermediate pullback square. |
| SConstruction.edgewiseQ_degeneracies | Duplicating an index inserts an identity Q-arrow. |

**Uses.**

- The consuming nodes listed in this roadmap: For an exact A, the functor iS_{2n+1}A→iQ_nA sends a filtration indexed by n′<⋯<0′<0<⋯<n to the Q-chain with vertices A(j′,j), and arrows A(j′,j)↞A((j+1)′,j)↣A((j+1)′,j+1). It is an equivalence in every degree and these functors commute with the edgewise simplicial operators.

**Checks.**

- **edgewise_Q_zero** (degenerate): At n=0 this is identity on objects and isomorphisms.
- **edgewise_Q_span** (computation): At n=1 the inverse flag is ker(U→X)↣U↣Y.
- **edgewise_Q_composition** (computation): Deleting a diagonal index composes the adjacent Q-spans by pullback.

**Acceptance.**

- At n=0 the functor is identity on Core(A).
- At n=1 a span X↞U↣Y recovers the flag ker(U→X)↣U↣Y.
- The comparison does not require additivity, delooping or a spectrum.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/S-construction`, `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`, `tauceti:TauCeti.ExactStructure.conflation_baseChange`, `StableHomotopyKTheory:H.2`.

**Sources:** Waldhausen.KSpaces, §1.9, printed pp.375–376 (PDF57–58); page images read 2026-10-02 — The triangular subquotient diagram, degreewise equivalence and edgewise simplicial map..

#### Isomorphic exact functors induce homotopies on object S

`GeneralAlgebraicKTheory:K.4:construction/object-S-isomorphism-homotopy` · lemma

An isomorphism between exact functors of categories with cofibrations induces a simplicial homotopy on δ.C=Ob(S.C). Consequently δ.C→N(iS.C) is a realisation equivalence, natural in C.

**Hypotheses and conventions.**

- C is small with cofibrations; the functor isomorphism has invertible components.
- The object homotopy is stronger than merely a homotopy of category nerves.

**Construction or proof.**

1. Write the isomorphism as F:C×[1]→C′. For α:[n]→[1], send an S_n-object A:Ar[n]→C through (A,Ar(α)), then through Ar[1]→[1], then F. The functor Ar[1]→[1] sends (0,0) to 0 and (0,1),(1,1) to 1.
2. Invertibility of F along [1] ensures the resulting square diagram still has its cofibrations and quotient squares. Compatibility with order maps gives a simplicial homotopy with the two required endpoints.
3. For each m, isomorphism strings C(m,i) are exactly equivalent to C by evaluation and the constant string. Their composites are naturally isomorphic to identity. The first part makes every face and degeneracy of δ.C(m,i) a homotopy equivalence.
4. Realise the bisimplicial object to identify δ.C with N(iS.C), using H.2’s levelwise-equivalence theorem.

**Acceptance.**

- At constant α=0 and α=1 the homotopy is δ.f and δ.f′.
- A noninvertible natural transformation is not substituted for the isomorphism hypothesis.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/S-construction`, `StableHomotopyKTheory:H.2/bisimplicial-realization-lemma`.

**Sources:** Waldhausen.KSpaces, Lemma 1.4.1 and its corollary, printed pp.335–336 (PDF18–19); read 2026-10-01 — The explicit interval construction and its realisation consequence..

#### Comparison of the S-construction with the Q-construction

`GeneralAlgebraicKTheory:K.4:construction/iS-versus-Q` · comparison

For a small exact category A with isomorphisms as weak equivalences, |iS.A|≃BQA naturally in exact functors. Use edgewise subdivision of iS.A and its degreewise equivalence with iQ.A; the swallowing lemma identifies BQA with |iQ.A|. The object-S map gives the same comparison, including the automorphism class in π₂. No additivity, relative delooping or spectrum is required.

**Hypotheses and conventions.**

- A is small exact; cofibrations are its admissible inflations and weak equivalences its isomorphisms.
- H.2 owns the generic edgewise realisation homeomorphism and the swallowing lemma for double nerves.

**Construction or proof.**

1. H.2’s edgewise realisation homeomorphism identifies |iS.A| with |iS.^e A|. The edgewise-S-Q diagram node gives |iS.^e A|≃|iQ.A| by degreewise equivalence.
2. Apply the swallowing lemma to Core(QA)⊂QA to identify BQA with |iQ.A|. Its proof evaluates a string at the first object and uses its successive arrows as a natural transformation from the constant string.
3. The object-S equivalence gives a commuting square with the same diagonal-subquotient map δ.^e A→NQA, so this is the object comparison as well.
4. The automorphism’s two-dimensional cell is sent to its Q square by the displayed diagonal spans, identifying the π₂ automorphism classes. Naturality follows by applying an exact functor to every quotient and pullback.

**Acceptance.**

- For an exact category the Waldhausen and Quillen K-groups agree in every degree.
- The class of an automorphism corresponds under the comparison.
- The comparison is natural in exact functors.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.4:construction/edgewise-S-Q-diagrams`, `GeneralAlgebraicKTheory:K.4:construction/object-S-isomorphism-homotopy`, `StableHomotopyKTheory:H.2`.

**Sources:** Weibel.KBook.IV, §8.6, p. IV.69 — The comparison and its attribution; Weibel.KBook.IV, Exercise 8.5(c) and the opening of Exercise 8.6, p. IV.74 — The two middle steps, which the source leaves as exercises; Waldhausen.KSpaces, §1.9, printed pp.375–376 (PDF57–58); read 2026-10-02 — The comparison and commuting object/category square..

#### The simplex fibres in Waldhausen additivity

`GeneralAlgebraicKTheory:K.4:construction/additivity-simplex-fibre` · construction

Let f:δ.E(C)→δ.C send a cofibration sequence to its subobject. For y∈δ_nC define F_y=Δ[n]×_{δ.C}δ.E(C). An m-simplex is (u:[m]→[n], A↣D↠B) in E(S_mC) with A=u*y. Quotient projection p_y:F_y→δ.C has a section q_y given by the last vertex n and the sequence 0↣B=B; p_yq_y=id. The next node contracts q_yp_y to identity.

**Hypotheses and conventions.**

- E(C) has the induced cofibration structure of S₂C; fibre diagrams are literal simplicial pullbacks.
- Every vertex restriction of an S_n-object is the zero S_0-object, so q_y is defined.

**Construction or proof.**

1. Identify Ob S_m E(C) with Ob E(S_m C) via the exchange of the two arrow-index categories and the latching pushout condition.
2. Define F_y and p_y by projection to the quotient filtration B; check faces and degeneracies using the fixed quotient diagrams.
3. At the constant order map to n the subfiltration is zero. Send B to the sequence 0↣B=B over that map, defining q_y. Its quotient is B, giving p_yq_y=id.
4. At n=0 the fibre consists of sequences 0↣B′↠B with B′→B an isomorphism. The previous exact-equivalence homotopy identifies it with δ.C.

**API.**

| Declaration | Contract |
| --- | --- |
| AdditivityFibre | The simplicial pullback over y of the subobject projection. |
| AdditivityFibre.quotient | Its map p_y to the quotient filtration. |
| AdditivityFibre.lastVertexSection | The section q_y at the last vertex with zero subobject. |
| AdditivityFibre.quotient_section | p_y∘q_y=id. |

**Uses.**

- The consuming nodes listed in this roadmap: Let f:δ.E(C)→δ.C send a cofibration sequence to its subobject. For y∈δ_nC define F_y=Δ[n]×_{δ.C}δ.E(C). An m-simplex is (u:[m]→[n], A↣D↠B) in E(S_mC) with A=u*y. Quotient projection p_y:F_y→δ.C has a section q_y given by the last vertex n and the sequence 0↣B=B; p_yq_y=id. The next node contracts q_yp_y to identity.

**Checks.**

- **additivity_fibre_zero** (degenerate): For n=0 all subobjects are zero and the fibre is equivalent to δ.C.
- **additivity_quotient_section** (computation): The quotient of (0↣B=B) is B.
- **additivity_fibre_not_point** (non-example): With nontrivial K₀(C), δ.C and these fibres need not be contractible.

**Acceptance.**

- For n=0, F_y≃δ.C; it is not assumed contractible.
- p_yq_y=id on quotient filtrations, including their chosen quotient squares.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/S-construction`, `GeneralAlgebraicKTheory:K.4:construction/object-S-isomorphism-homotopy`.

**Sources:** Waldhausen.KSpaces, Proof of Lemma 1.4.3, printed pp.337–338 (PDF20–21); page images read 2026-10-01 — The explicit simplicial fibre, quotient projection and split section..

#### The pushout contraction of an additivity fibre

`GeneralAlgebraicKTheory:K.4:construction/additivity-pushout-homotopy` · lemma

For each y, the maps id_Fy and q_yp_y are simplicially homotopic. For (u,E) and v:[m]→[1], put ū(j)=u(j) if v(j)=0 and ū(j)=n if v(j)=1. The natural map u*y→ū*y induces E→Ē by cobase change in S_mC. This homotopy fixes q_y and keeps the quotient filtration B unchanged, making p_y and q_y homotopy inverses.

**Hypotheses and conventions.**

- Choose pushouts in C once, including identity and zero cases, rather than independently in each S_mC.
- The map u*y→ū*y is uniquely determined by the order-category morphism u≤ū.

**Construction or proof.**

1. The coordinate formula ū is monotone, commutes with precomposition in Δ/[1], starts at u and ends at the constant n. The induced map of arrow categories gives A=u*y→Ā=ū*y.
2. Push out A↣D along A→Ā in S_mC, obtaining Ā↣D̄↠B̄. The pointwise pushouts in C give S_mC’s required pushouts and preserve the quotient filtration: B̄ canonically identifies with B.
3. Choose identity pushouts literally when A→Ā is identity, and the quotient pushout when Ā=0. This makes the v=0 endpoint identity and the v=1 endpoint q_yp_y. It also fixes the image of q_y.
4. Uniqueness of the arrow-category morphism ensures the first step commutes with every order map. Fixed pointwise pushout choices commute with deletion and repetition of coordinates; hence the second step does too. These verify the full simplicial homotopy identities, not only endpoint maps.

**Acceptance.**

- The two endpoints and the fixed-section condition hold as simplicial maps.
- Independent pushout choices in each degree do not suffice: compatibility under face and degeneracy maps is required.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/additivity-simplex-fibre`, `GeneralAlgebraicKTheory:K.4:construction/S-construction`.

**Sources:** Waldhausen.KSpaces, Proof of the sublemma to Lemma 1.4.3, printed pp.339–340 (PDF22–23); page images read 2026-10-01 — The last-vertex contraction lifted by pointwise pushout, including choices and simplicial compatibility..

#### Additivity for object simplicial S-constructions

`GeneralAlgebraicKTheory:K.4:construction/object-S-additivity` · theorem

For any small category with cofibrations, (sub,quotient):δ.E(C)→δ.C×δ.C is a realisation homotopy equivalence.

**Hypotheses and conventions.**

- No weak-equivalence, cylinder, saturation or extension axiom is used.
- H.2 supplies the simplicial form of Quillen Theorem B via the category of simplices.

**Construction or proof.**

1. Each vertex restriction F_0→F_y is an equivalence: quotient projections p_0 and p_y are homotopy equivalences by the pushout contraction and commute with that restriction.
2. Any order map [m]→[n] sits in a triangle with a map [0]→[m]. Two-out-of-three therefore proves every change-of-simplex map F_{u*y}→F_y is an equivalence.
3. Apply the simplicial Theorem B criterion. It follows from categorical Theorem B on the category of simplices, identifying its comma fibres with the simplex categories of F_y, together with the subdivision-realisation equivalence from H.2.
4. At the unique zero simplex, the homotopy fibre is δ.C, via B↦(0↣B=B). Compare this fibration to the product fibration with the split section (A,B)↦(A↣A∨B↠B). It is identity on base and fibre, hence an equivalence of total spaces.
5. The split map is a section of (sub,quotient). Since it is an equivalence, its retraction is the desired equivalence.

**Acceptance.**

- The comparison is identity on fibre and base, rather than an unsupported appeal to a split section alone.
- The statement applies even when C has no specified weak equivalences.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/additivity-pushout-homotopy`, `GeneralAlgebraicKTheory:K.4:construction/object-S-isomorphism-homotopy`, `StableHomotopyKTheory:H.2/quillen-theorem-b`, `StableHomotopyKTheory:H.2`.

**Sources:** Waldhausen.KSpaces, Lemma 1.4.3 and Lemmas 1.4.A–B, printed pp.336–338 (PDF19–21); text and images read 2026-10-01 — The simplex-fibre criterion and comparison to the product fibration..

#### Additivity for Waldhausen categories

`GeneralAlgebraicKTheory:K.4/waldhausen-additivity` · theorem · planet: **Additivity for Waldhausen categories**

For a Waldhausen category the map from the weak-equivalence S-construction of the extension category to the product of two copies of that of the category, taking a cofibration sequence to its sub and quotient terms, is a homotopy equivalence. Equivalently, for a cofibration sequence of exact functors the middle induces the sum of the outer two. No saturation, extension or cylinder axiom is needed. This is the Waldhausen form; its simplicial proof is required here and is not deduced merely from the exact-category theorem; with a cylinder functor satisfying the cylinder axiom it gives that the cone is null-homotopic and hence that suspension is a homotopy inverse on K-theory.

**Hypotheses and conventions.**

- The category is a small Waldhausen category; the theorem needs none of the three extra axioms.
- The extension category is the second term S₂C of the S-construction, the category of cofibration sequences with the cofibrations of Weibel II.9.3; for an exact category it is the pinned category of conflations.
- A cofibration sequence of functors requires the canonical map out of the pushout to be a cofibration for every cofibration of the source, which is a condition on the functors, not only on their values.
- The suspension consequence does need a cylinder functor satisfying the cylinder axiom.

**Construction or proof.**

1. Apply object-S-additivity to C(m,w), the category of strings of m composable weak equivalences in C with objectwise cofibrations. The gluing axiom makes pushouts of these strings weak-equivalence strings, so C(m,w) is a category with cofibrations.
2. The extension and S-constructions commute with this string construction: δ_n C(m,w)=N_m(wS_n C), and the same for E(C). These are natural identifications in both m and n.
3. The object theorem gives an equivalence δ.E(C(m,w))→δ.C(m,w)² for every m. Realise in m using H.2’s levelwise-equivalence theorem and bisimplicial realisation lemma, yielding |wS.E(C)|≃|wS.C|².
4. For a cofibration sequence of exact functors use the universal functor to E(C); the inverse of (sub,quotient) is the split sum, giving the middle-functor additivity relation. Apply repeatedly for filtrations and alternating sums.
5. With a cylinder satisfying its axiom, the cone is weakly equivalent to zero and its cofibration sequence id↣cone↠suspension gives suspension=−id on K-theory. This consequence is kept under its extra hypothesis.

**Acceptance.**

- A cofibration sequence of exact functors gives the additivity relation on all K-groups.
- Under the cylinder axiom the cone is null-homotopic and suspension induces minus the identity.
- The theorem needs none of the three extra axioms; the corollaries about the cone do need the cylinder axiom.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/S-construction`, `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`, `StableHomotopyKTheory:H.2/quillen-theorem-a`, `StableHomotopyKTheory:H.2/quillen-theorem-b`, `GeneralAlgebraicKTheory:K.4:construction/object-S-additivity`, `StableHomotopyKTheory:H.2/bisimplicial-realization-lemma`.

**Sources:** Weibel.KBook.V, Additivity Theorem 1.2 and Example 1.2.3, p. V.2 — The theorem in the form that covers Waldhausen categories, and the suspension consequence.; Waldhausen.KSpaces, Theorem 1.4.2, printed p.336 (PDF19); read 2026-10-01 — The passage from cofibration-only additivity to weak-equivalence strings..

#### Relative S-construction fibration and iterated delooping

`GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum` · theorem · planet: **The delooping theorem**

For an exact functor f : B → C of small Waldhausen categories let S.f be the simplicial Waldhausen category with Sₙf = SₙB ×_{SₙC} Sₙ₊₁C (Weibel IV.8.5.3): its objects are pairs (B∗, C∗) with f(B∗) = ∂₀C∗, C sits inside it as the objects (0, C = ⋯ = C), and the projection Sₙf → SₙB is exact. Realising the wS.-direction first, the levelwise sequences |wS.C| → |wS.(Sₙf)| → |wS.(SₙB)| realise to a homotopy fibration sequence Ω|wS.(S.B)| → |wS.C| → |wS.(S.f)| → |wS.(S.B)| based at the zero objects (Weibel V.1.7), whose first map, composed with the equivalence |wS.B| ≃ Ω|wS.(S.B)| of the case f = id_B, is homotopic to the map induced by f (Weibel, Exercise V.1.7). For f = id the relative term is the simplicial path object of wS.S.C and is contractible (IV.8.5.4), so |wS.C| ≃ Ω|wS.(S.C)| naturally in exact functors; applied to S.ⁿC this gives natural equivalences |wS.ⁿC| ≃ Ω|wS.ⁿ⁺¹C| for every n ≥ 1. StableHomotopyKTheory:H.5:S-delooping imports these maps and assembles the connective Ω-spectrum; this node does not re-plan spectrum assembly or products. The initial map |wC| → Ω|wS.C| is canonical but is not generally a group completion: Waldhausen K-theory also imposes the cofibration-sequence relations. The group-completion comparison for split exact categories with isomorphisms as weak equivalences is K.2:plus/H.4’s separate theorem.

**Hypotheses and conventions.**

- B and C are small Waldhausen categories and f is exact; no saturation, extension or cylinder axiom is needed.
- Degreewise input: Sₙf is equivalent to the extension category E(C, Sₙf, SₙB) of SₙB by C (Weibel II.9.3), so Waldhausen additivity in the form of Corollary V.1.3.1 (K.4/waldhausen-additivity) makes (sub, quotient) : wS.(Sₙf) → wS.C × wS.(SₙB) a homotopy equivalence. Hence each |wS.C| → |wS.(Sₙf)| → |wS.(SₙB)| is a split homotopy fibration sequence over the zero object, its fibre inclusion induced by C ↦ (0, C = ⋯ = C), naturally in n.
- Realisation input: the realisation theorem for levelwise homotopy fibration sequences of simplicial spaces, requested from StableHomotopyKTheory:H.2 (Waldhausen 1978, Lemma 5.2, as the K-book quotes it; Bousfield–Friedlander 1978, Theorem B.4). Its hypotheses hold here: (a) the levelwise sequences are homotopy fibration sequences, by the previous hypothesis; (b) every base term |wS.(SₙB)|, and every total term |wS.(Sₙf)|, is connected, because the zeroth term of an S-construction is the zero category (Weibel IV.8.4), which gives the connectivity form of the theorem and makes the π∗-Kan and π₀ conditions of the bisimplicial form automatic; (c) every space is the realisation of a multisimplicial set, so the simplicial spaces n ↦ |wS.(Sₙ−)| have cellular degeneracies and are good and proper, and realising in the wS.-direction first is legitimate by the bisimplicial realisation lemma (StableHomotopyKTheory:H.2/bisimplicial-realization-lemma).
- The relative K-theory space of f is Ω²|wS.(S.f)|, K.5's Waldhausen relative theory (Weibel IV.8.5.3).
- In the proof of V.1.7 the source exchanges the roles of B and C; the roles above follow IV.8.5.3 and the statement, and the misprint is recorded as GeneralAlgebraicKTheory/E-relative-S-proof-roles.
- For f = id_C the relative construction is the simplicial path object P(S.C), with degree n equal to S_{n+1}C. Its contraction uses the extra degeneracy and augmentation to S₀C, not the false equality S₀f = 0 printed in IV.8.5.4 (source issue E-relative-S-zero-term).

**Construction or proof.**

1. Define S.f by the pullback SₙB ×_{SₙC} Sₙ₊₁C with the Waldhausen structure of IV.8.5.3, with the exact maps C → S.f → S.B, and record that for f = id it is the simplicial path object of S.C, contractible by the extra degeneracy of the augmented simplicial path construction, whose augmentation target is S₀C = 0 (IV.8.5.4, corrected). Its degree-zero term S₀(id_C) is S₁C ≃ C, not 0.
2. Prove the equivalence Sₙf ≃ E(C, Sₙf, SₙB), natural in n, and apply K.4/waldhausen-additivity to obtain the split fibration sequences |wS.C| → |wS.(Sₙf)| → |wS.(SₙB)|.
3. Check the hypotheses of the H.2 realisation theorem as listed (levelwise fibration sequences, connected base and total terms, realisations of multisimplicial sets, basepoints at the zero objects), realise in the wS.-direction first, and conclude that Ω|wS.(S.B)| → |wS.C| → |wS.(S.f)| → |wS.(S.B)| is a homotopy fibration sequence, the fibre of |wS.(S.f)| → |wS.(S.B)| over the zero object being identified with |wS.C| by the canonical map from the levelwise fibres (StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence).
4. Identify the first map: the map of sequences S.id_B → S.f given by id_B on B and f on the second factor is compatible with the two fibration sequences, so the first map is the equivalence |wS.B| ≃ Ω|wS.(S.B)| of the case f = id followed by the map induced by f (Weibel, Exercise V.1.7, whose hint is this naturality).
5. Specialise to f = id to get |wS.C| ≃ Ω|wS.(S.C)|, natural in exact functors; iterate on S.ⁿC for n ≥ 1 and export these maps to H.5:S-delooping, which alone assembles the spectrum.
6. Record the non-example: the first map from |wC| to Ω|wS.C| need not be a group completion for an arbitrary Waldhausen category; a group-completion theorem requires the separate split exact hypotheses of K.2:plus/H.4.
7. Record the degree-minus-one consequence the source gives, that the first homotopy group of the relative realisation is the cokernel of the map of Grothendieck groups, which is where negative K-theory first appears.

**Acceptance.**

- For every n ≥ 1 the natural map |wS.ⁿC| → Ω|wS.ⁿ⁺¹C| is an equivalence; these are the maps the spectrum-assembly owner consumes.
- After the identification |wS.B| ≃ Ω|wS.(S.B)|, the first map of the fibration sequence is the map induced by f.
- No group-completion equivalence is claimed for arbitrary Waldhausen categories: for finite abelian p-groups with their usual exact structure, [ℤ/p²] = 2[ℤ/p] in exact K₀, but these classes are independent in the group completion of the direct-sum monoid.
- The first homotopy group of the relative realisation is the cokernel of the map of Grothendieck groups.
- The realisation step is not asserted for arbitrary levelwise fibrations of simplicial spaces: the connectivity and goodness hypotheses are checked here.
- For f = id_C, S₀f ≃ C while the augmented path object contracts to S₀C = 0; a nonzero category C distinguishes these two terms.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4/waldhausen-additivity`, `GeneralAlgebraicKTheory:K.4:construction/S-construction`, `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`, `StableHomotopyKTheory:H.2`, `StableHomotopyKTheory:H.2/bisimplicial-realization-lemma`, `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`.

**Sources:** Weibel.KBook.V, Proposition 1.7 with its proof, p. V.8 — The displayed sequence (its first term looped; the earlier transcription omitted Ω) and the realisation lemma the proof invokes; the proof's exchange of B and C is recorded under sourceIssues.; Weibel.KBook.IV, Relative K-theory spaces 8.5.3 and Lemma 8.5.4, p. IV.69 — The relative construction and the roles of B and C used here.; Weibel.KBook.IV, Infinite Loop Structure 8.5.5, p. IV.69 — Natural delooping equivalence in IV.8.5.5, whose fibration input is V.1.7.; Weibel.KBook.V, Exercise 1.7, p. V.10 — The identification of the first map; the source leaves it as an exercise and the proof steps carry it out..

#### Non-functorial Waldhausen factorizations

`GeneralAlgebraicKTheory:K.4:construction/waldhausen-factorization` · definition

A Waldhausen category has factorization if every morphism f:A→B is a composite A↣Z→B of a cofibration and a weak equivalence. This is an existence property; no functorial assignment of Z is part of it.

**Hypotheses and conventions.**

- C is a small Waldhausen category. This property is independent of specifying a cylinder functor.

**Construction or proof.**

1. Define the explicit quantified factorization property on the existing Waldhausen structure.
2. A cylinder functor satisfying the cylinder axiom gives this property by its factorization of any f.
3. The Frobenius-pair verification is owned by the consumer K.6/frobenius-pair-factorization, which imports this existence property. It is not an input from K.6 to early K.4.

**API.**

| Declaration | Contract |
| --- | --- |
| Waldhausen.HasFactorization | Every map admits the specified cofibration–weak-equivalence composite. |
| Waldhausen.HasFactorization.factor | For a given map, obtain an existential intermediate object and the two arrows. |
| Waldhausen.HasFactorization.ofCylinder | A cylinder satisfying its axiom supplies this existence property. |

**Uses.**

- K.6 Frobenius-pair K-theory; Schlichting11.2,11.15–11.18: Supplies approximation and fibration without choosing a functorial cylinder.

**Checks.**

- **factor_cofibration** (degenerate): For a cofibration f, factor it as f followed by identity.
- **factor_identity** (compatibility): The identity map factors through its own source, with both arrows identity.
- **factor_not_automatic** (non-example): Finite pointed sets with monomorphism cofibrations and isomorphism weak equivalences fail the property: the collapse from a two-element pointed set to a point cannot be a monomorphism followed by an isomorphism.

**Acceptance.**

- The condition records existential cofibration–weak-equivalence factorizations, without constructing a cylinder or importing the subsequent Frobenius-pair theory.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`.

**Sources:** Schlichting.NegativeK.2003, AppendixA.1 and A.5 p.24–25; Remark11.2 p.20 — Read AppendixA in full, pp.24–27. The packet owns the general non-functorial factorization apparatus in early K.4; K.6 imports it. Generic finite-poset nerve and realization facts remain precise H.1/H.2 requests..

#### Cofibrant diagrams on a finite poset

`GeneralAlgebraicKTheory:K.4:construction/cofibrant-poset-diagrams` · construction

For a finite poset P, define the cofibrations in C^P by the latching condition: X→Y is cofibrant at p if the colimit over ({0}×{p})∪([1]×P_{<p}) exists and its map to Y(p) is a cofibration. Weak equivalences are pointwise. Cofibrant diagrams have colimits, assembled by finitely many pushouts along cofibrations.

**Hypotheses and conventions.**

- C has cofibrations and a zero object; P is finite. Predecessor-closed subposets, not arbitrary subposets, are used in the induction.

**Construction or proof.**

1. For predecessor-closed S′⊂S⊂P_{<p}, induct on |S| to construct the relative colimit I(S,p). Remove a maximal q outside S′; glue Y(q) to the smaller colimit along its latching object. The map from I(S′,p) remains a cofibration under this pushout and composition. This is A.7.
2. Add a new terminal element with X=0 to obtain the colimit of any cofibrant P-diagram.
3. If X’s structural arrows are cofibrations, A.8’s pushout comparison shows that Y’s structural arrows are cofibrations as well. For maximal q∈S the map Y(q)→I(S,p) is a cofibration. This supplies the arrowwise cofibrations used in the comma contraction.

**API.**

| Declaration | Contract |
| --- | --- |
| CofibrantPosetDiagram | The finite-poset diagram with the specified latching cofibrations. |
| CofibrantPosetDiagram.latching | The relative colimit at each vertex. |
| CofibrantPosetDiagram.colimit | The colimit exists and is built by cofibration pushouts. |
| CofibrantPosetDiagram.structural_cof | The target’s structural arrows are cofibrations if those of the source are. |
| CofibrantPosetDiagram.map | Natural transformations satisfying the latching condition are its cofibrations. |

**Uses.**

- K.6 Frobenius-pair K-theory; Schlichting11.2,11.15–11.18: Supplies approximation and fibration without choosing a functorial cylinder.

**Checks.**

- **poset_diagram_empty** (degenerate): For empty P the colimit is the zero object.
- **poset_diagram_singleton** (compatibility): For singleton P the latching condition is exactly the original cofibration condition.
- **poset_diagram_objectwise_not_enough** (non-example): In finite pointed sets on [1], take X constant at a point and Y(0) a two-element pointed set, Y(1) a point, with collapse structural map. The map X→Y is objectwise injective, but its latching map is the collapse Y(0)→Y(1), hence is not a cofibration.

**Acceptance.**

- For P=[1], the condition is X(0)↣Y(0) and X(1)⊔_{X(0)}Y(0)↣Y(1).

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`.

**Sources:** Schlichting.NegativeK.2003, AppendixA.6–A.8 pp.25–26 — Read AppendixA in full, pp.24–27. The packet owns the general non-functorial factorization apparatus in early K.4; K.6 imports it. Generic finite-poset nerve and realization facts remain precise H.1/H.2 requests..

#### Swallowing a second weak-map nerve direction

`GeneralAlgebraicKTheory:K.4:construction/weak-double-nerve-swallow` · lemma

If A⊂B is a wide subcategory, the double category AB of commuting squares with vertical arrows in A and horizontal arrows in B has nerve realization equivalent to NB via constant vertical strings. Applied to wS_nC it removes the extra weak-map nerve direction in the pairing.

**Hypotheses and conventions.**

- A and B have the same objects; vertical and horizontal composition preserve the commuting squares. Small categories and the H.2 good-realization convention are used.

**Construction or proof.**

1. For each fixed vertical nerve degree m, evaluate A₀→⋯→A_m at A₀ to define A_mB→B. The constant-string inclusion is its right inverse.
2. The composites A₀→A_i give a natural transformation from the constant-string composite to the identity on A_mB, with horizontal maps in B. The nerve therefore gives a homotopy equivalence in every vertical degree.
3. Realize degreewise using H.2. Apply this with the same weak-map subcategory in both directions of S_nC, naturally in n and exact functors. This gives |wwS^(2)C|≃|wS^(2)C|.

**Acceptance.**

- There is no cylinder, saturation or extension hypothesis for this particular nerve comparison. The wide-subcategory condition is explicit.

**Prerequisites:** `StableHomotopyKTheory:H.1`, `StableHomotopyKTheory:H.2`.

**Sources:** Waldhausen.KSpaces, Swallowing Lemma1.6.5, printed p.352/PDF35, image inspected; pairing paragraph p.342/PDF25 — Read the full evaluation/constant-string proof against the image and its product application. The needed same-object hypothesis is explicit here..

### K.5 — Relative, Milnor and Tor-unital theories

Construct the relative homotopy fibre and its low-degree maps, unitization and Milnor patching sequence. Relative π₀ excision is available before U.6. Unrestricted higher excision is false. The Tor-unital component supplies the all-degree sufficient condition through nonconnective theory and the enhanced excision supplier.

#### Relative K-theory as a homotopy fibre

`GeneralAlgebraicKTheory:K.5/relative-K-theory` · definition · planet: **Relative K-theory**

For a unital ring homomorphism f the RELATIVE K-THEORY space K(f) is the homotopy fibre, at the basepoint of the target, of the induced map K(f) of the ring model (K.2/functorial-K-theory-of-a-ring), and the relative groups are its homotopy groups; they fit into a long exact sequence with the absolute groups, ending in the zeroth relative group mapping to the zeroth group of the source. All the relative groups, the zeroth one included, are abelian, because the functorial H-space structure on the K-theory space makes the fibre one. A pair consisting of a possibly noncommutative ring and a two-sided ideal is treated through the quotient map A → A/I. For an exact functor of Waldhausen categories the relative theory is the double loop space of the relative S-construction of K.4:construction, and its sequence ends one step further, with the cokernel of the map of Grothendieck groups appearing as a first negative group. The identification of the relative groups of a pair in degrees zero and one with the classical groups K₀(I) and K₁(A, I) = GL(I)/E(A, I) is KTheoryLowDegrees:U.6/relative-K1-homotopy-comparison, which imports this node; it is not asserted here.

**Hypotheses and conventions.**

- The rings are unital and the map is unital; for a pair the ideal is two-sided (Mathlib's Ideal with [I.IsTwoSided], whose quotient ring is Ideal.Quotient.ring), and no commutativity is assumed.
- The homotopy fibre is taken at the basepoint of the target, and the H-space structure used for the group laws is the functorial one.
- The Waldhausen version needs the relative S-construction and its fibration, which is K.4:construction's theorem K.4/delooping-and-the-spectrum.
- The classical relative groups are KTheoryLowDegrees U.5's, and their comparison with this fibre is U.6's; both lie downstream of this node, so no statement of this node uses them.

**Construction or proof.**

1. Define the relative space as the homotopy fibre (StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence) and the relative groups as its homotopy groups.
2. Record the long exact sequence and its end in degree zero.
3. Prove that every relative group is abelian, from the functorial H-space structure.
4. Define the relative theory of a pair through the quotient map by a two-sided ideal. When the quotient map has a ring section, the fibre sequence splits and the relative groups are the kernels of K_n(A) → K_n(A/I).
5. Record the Waldhausen version, the double loop space of the relative S-construction, and the extra term at the end of its sequence.
6. Record what the pinned libraries have: Mathlib has the homotopy fibre of a map of complexes but no K-theory space, so nothing of this exists at the pins.

**API.**

| Declaration | Contract |
| --- | --- |
| relativeK | The relative K-theory space of a ring map. |
| relativeK.group | The relative groups. |
| relativeK.addCommGroup | Their abelian group structure, degree zero included. |
| relativeK.les | The long exact sequence with the absolute groups. |
| relativeK.ofPair | The relative theory of a ring and a two-sided ideal, through the quotient map; its identification in degrees zero and one with K₀(I) and K₁(A, I) is KTheoryLowDegrees U.6's. |
| relativeK.waldhausen | The Waldhausen relative theory and its extra term. |

**Uses.**

- K.5, excision: Excision is the question of when the relative groups depend only on the ideal.
- K.6: The extra term at the end of the Waldhausen sequence is the first negative K-group, which is where the nonconnective theory starts.
- K.7: The products are asserted compatible with the relative groups.
- KTheoryLowDegrees:U.6/relative-K1-homotopy-comparison: Identifies π₀ and π₁ of the fibre for a pair with the classical K₀(I) and K₁(A, I).

**Checks.**

- **identity_map** (degenerate): The relative theory of the identity is trivial.
- **split_pair** (computation): When the quotient map A → A/I has a ring section, the fibre sequence splits: π_n K(A, I) is the kernel of K_n(A) → K_n(A/I) and K_n(A) ≅ K_n(A/I) ⊕ π_n K(A, I) naturally; for the double ring A ⊕ I with its projection to A this gives π₀ K(A ⊕ I, 0 ⊕ I) = ker(K₀(A ⊕ I) → K₀(A)).
- **abelian_in_degree_zero** (degenerate): The zeroth relative group is abelian; it is a homotopy set made a group by the H-space structure, and that structure must be carried.
- **waldhausen_extra_term** (computation): The Waldhausen relative sequence has the cokernel of the map of Grothendieck groups as an extra term.

**Acceptance.**

- The relative groups are abelian in every degree, including degree zero.
- For a pair whose quotient map has a ring section the relative groups are the kernels of K_n(A) → K_n(A/I).
- The Waldhausen relative sequence has one more term than the ring one, the cokernel of the map of Grothendieck groups.
- The relative theory of the identity map is trivial.
- No identification of the relative groups of a pair with K₀(I) or K₁(A, I) is asserted here; that comparison is KTheoryLowDegrees U.6's.

**Prerequisites:** `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`, `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`, `mathlib:Ideal.Quotient.ring`.

**Sources:** Weibel.KBook.IV, Relative groups 1.11.1, p. IV.8 — The definition, the sequence and the abelian-group statement.; Weibel.KBook.IV, Exercise 1.15, p. IV.16 — The identification of the low relative groups for a pair, stated by the source as an exercise with hints; KTheoryLowDegrees:U.6/relative-K1-homotopy-comparison owns it and imports this node, which does not assert it..

#### Support complexes and the localization fibre

`GeneralAlgebraicKTheory:K.5/relative-versus-support` · comparison

For a central multiplicative set S in a unital ring R, define support K-theory from the Waldhausen category of bounded complexes of finite projectives that become acyclic after S-localization. The localization theorem identifies its K-theory space with the canonical homotopy fibre over zero of K(R)→K(S⁻¹R), although the two models have different definitions. At spectrum level its connective K-spectrum is the connective cover of that fibre: the full nonconnective support spectrum can have negative groups, and the cokernel of K₀(R)→K₀(S⁻¹R) maps into its degree−1 group. When S contains zero divisors, S-torsion modules of finite projective resolution need not model support K-theory; bounded support complexes remain the correct model.

**Hypotheses and conventions.**

- R is a unital associative ring and S is central. The comparison with S-torsion modules of finite projective resolution additionally requires that all elements of S are nonzerodivisors.
- The support Waldhausen category consists of bounded finite-projective complexes whose localization is acyclic, with the specified quasi-isomorphisms as weak equivalences.
- The space comparison uses the K.4 fibration and approximation theorems and the cofinal image of localization; the nonconnective comparison and negative groups belong to K.6.

**Construction or proof.**

1. Apply the fibration theorem to the weak class detected after localization. Approximation identifies the resulting third term with the K-space of the cofinal category of localized projectives.
2. Use cofinality to compare that category with all finite projectives over S⁻¹R. The fibre over zero is unchanged; the possible extra components are measured by the K₀ quotient. This identifies the support and relative space models naturally.
3. The connective support spectrum omits negative homotopy groups of the full stable fibre. The nonconnective localization exact sequence continues through K₀(R)→K₀(S⁻¹R)→K₋₁(R on S); it does not assert surjectivity of the first map.
4. Under the nonzerodivisor hypothesis compare with S-torsion modules having finite projective resolutions. With zero divisors that simpler category can fail, as the source counterexamples show.

**Acceptance.**

- Support and relative spaces of this localization map are naturally equivalent after the localization comparison theorem.
- A connective spectrum need not be the full stable fibre when K₀(R)→K₀(S⁻¹R) has a nonzero cokernel.
- The torsion-module replacement requires nonzerodivisors; bounded support complexes still define the space for central S with zero divisors.

**Prerequisites:** `GeneralAlgebraicKTheory:K.5/relative-K-theory`, `GeneralAlgebraicKTheory:K.4/fibration-theorem`, `GeneralAlgebraicKTheory:K.4/approximation-theorem`.

**Sources:** Weibel.KBook.V, Theorem 2.6.3 with proof, chapter p.V.17; Theorem 7.1 and Caveat 7.1.1, p.V.52; Definition 7.6.3, p.V.56 (PDF pages equal chapter pages) — Independent paraphrase of the comparison of support complexes with the localization fibre and its connective cover, retaining the negative-cokernel qualification..

#### Nonunital rings, the unitisation and the comparison with the unital theory

`GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation` · construction

A ring without unit is treated through a specified unitisation, the canonical augmented ring obtained by adjoining the integers, and its K-theory is defined as the relative theory of the augmentation. The unitisation is pinned in Mathlib with its universal property, and nothing K-theoretic is built on it there. The comparison with the usual theory is the statement that for a nonunital ring contained as a two-sided ideal in a unital ring there is a map from the theory defined this way to the relative theory of the pair, and the question of when it is an isomorphism is exactly excision, which is the next node's subject.

**Hypotheses and conventions.**

- The nonunital ring is an associative ring without unit; the unitisation is the canonical one over the integers, which is the pinned construction.
- The augmentation is the ring map to the integers and the relative theory is that of the augmentation.
- The comparison map exists for any unital ring containing the nonunital one as a two-sided ideal, and no claim is made about its being an isomorphism here.

**Construction or proof.**

1. Record the pinned unitisation with its universal property and record that nothing K-theoretic is built on it at the pins.
2. Define the K-theory of a nonunital ring as the relative theory of the augmentation.
3. Construct the comparison map to the relative theory of a pair, using functoriality of the relative theory in maps of pairs.
4. Prove the elementary properties: the construction agrees with the usual one when the ring happens to be unital and the inclusion is split, and it is functorial for maps of nonunital rings.
5. Record that the question of when the comparison is an isomorphism is excision, and hand it to the next node.

**API.**

| Declaration | Contract |
| --- | --- |
| nonunitalK | The K-theory of a nonunital ring through its unitisation. |
| nonunitalK.map | Functoriality in maps of nonunital rings. |
| nonunitalK.compare | The comparison map to the relative theory of a pair. |
| nonunitalK.of_unital | Agreement with the usual theory for a unital ring. |
| nonunitalK.unitization_pinned | The unitisation is Mathlib’s, with its universal property. |

**Uses.**

- K.5, excision: Excision is the statement that the comparison map is an isomorphism.
- K.6: The four axioms for negative K-theory are stated for nonunital rings, and the ideal axiom uses this construction.

**Checks.**

- **unital_case** (compatibility): For a unital ring the construction agrees with the usual theory.
- **functorial** (computation): It is functorial for maps of nonunital rings.
- **comparison_exists** (computation): The comparison map exists for every unital ring containing the ring as an ideal.
- **no_excision_claimed** (non-example): The comparison map is not asserted to be an isomorphism; that is the next node’s hypothesis-laden statement.

**Acceptance.**

- For a unital ring the construction agrees with the usual theory.
- The comparison map to the relative theory of a pair exists for every unital ring containing the nonunital one as an ideal.
- The construction is functorial for maps of nonunital rings.
- No excision statement is made here.

**Prerequisites:** `GeneralAlgebraicKTheory:K.5/relative-K-theory`, `mathlib:Unitization`.

**Sources:** Weibel.KBook.IV, Absolute Excision 1.11.2, p. IV.9 — The unitisation and the comparison map; the excision question itself is the next node..

#### Excision holds under hypotheses, and fails without them

`GeneralAlgebraicKTheory:K.5/excision-and-its-failure` · theorem

A nonunital ring satisfies absolute excision in degree n when the comparison map of the previous node is an isomorphism for every unital ring containing it as an ideal. Every nonunital ring satisfies it in degree zero. In degree one it holds exactly when the ring is idempotent, that is equal to its own square, which is both the criterion and the counterexample: a nonunital ring with a proper square fails excision for the first K-group. In general it holds in degrees one to n exactly when the first n torsion groups of the integers over the unitisation vanish, and a ring for which all of them vanish, called homologically unital, satisfies excision in all degrees. The criteria are quoted from Suslin and Suslin-Wodzicki as the source quotes them, with their proofs outside what was read.

**Hypotheses and conventions.**

- The nonunital ring is associative; the unitisation is the canonical one and the torsion groups are taken over it.
- Absolute excision is quantified over ALL unital rings containing the ring as a two-sided ideal, which is what makes it a property of the ring alone.
- The criteria are quoted, not proved: the source attributes them to Suslin and to Suslin and Wodzicki and does not prove them, and neither does this roadmap.

**Construction or proof.**

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

**Prerequisites:** `GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation`, `GeneralAlgebraicKTheory:K.5/relative-K-theory`.

**Sources:** Weibel.KBook.IV, Absolute Excision 1.11.2, p. IV.9 — The definition, the degree-zero statement, the degree-one criterion, the general criterion and the notion of an H-unital ring..

#### Milnor's sequence is exact at the pair of K₁-groups

`GeneralAlgebraicKTheory:K.5/milnor-square-K1-exactness` · lemma

For a Milnor square, the sequence K₁(B) → K₁(S) × K₁(T) → K₁(C) of classical K₁-groups, with first map (K₁(p), K₁(q)) and second map (x, y) ↦ K₁(φ)(x) · K₁(ψ)(y)⁻¹, is exact at K₁(S) × K₁(T). This is the one exactness position of Milnor's K₁–K₀ sequence that KTheoryLowDegrees Z.1 does not decompose.

**Hypotheses and conventions.**

- A Milnor square: unital, possibly noncommutative rings S, T and C in one universe, a surjective unital map φ : S → C, a unital map ψ : T → C, and B = RingHom.pullback φ ψ with its projections p : B → S and q : B → T, the convention of KTheoryLowDegrees Z.1. Equivalently (Weibel III.2.6), a unital map f : R → S carrying a two-sided ideal I of R isomorphically onto a two-sided ideal of S, with T = R/I and C = S/I; then B ≅ R.
- Surjectivity of φ is essential: it is what makes the patched modules finitely generated projective and what lets elementary matrices over C lift to S.
- K₁ is the classical GL/E of KTheoryLowDegrees U.2, written multiplicatively; its identification with π₁ of the ring model is KTheoryLowDegrees U.6's and is not used.

**Construction or proof.**

1. The composite is trivial: φ ∘ p = ψ ∘ q (RingHom.pullback_comm_sq) and K₁ is functorial (KTheoryLowDegrees:U.2/K1-map).
2. Let x = [g] and y = [h] with K₁(φ)(x) = K₁(ψ)(y). Represent g and h in one GL_n (KTheoryLowDegrees:U.1/finite-representatives) and enlarge n until φ(g) = ψ(h) · ē with ē in E_n(C) (the stable elementary subgroup, KTheoryLowDegrees:U.1/stable-elementary-subgroup).
3. Lift ē to e in E_n(S), which is possible because φ is surjective (KTheoryLowDegrees:U.1/elementary-surjective-map); then φ(g e⁻¹) = ψ(h).
4. A pair of invertible matrices over S and T with equal images in C is an invertible matrix over the pullback B, its inverse being the pair of inverses; so (g e⁻¹, h) lies in GL_n(B), and its class in K₁(B) maps to ([g], [h]) because e is elementary.

**Acceptance.**

- Every pair of classes with the same image in K₁(C) comes from K₁(B).
- The lemma uses the surjectivity of φ only through the lifting of elementary matrices; the lifting of invertible matrices is neither needed nor true in general.
- No exactness at K₁(B) is asserted: the sequence starts there.

**Prerequisites:** `KTheoryLowDegrees:U.2/K1`, `KTheoryLowDegrees:U.2/K1-map`, `KTheoryLowDegrees:U.1/finite-representatives`, `KTheoryLowDegrees:U.1/stable-elementary-subgroup`, `KTheoryLowDegrees:U.1/elementary-surjective-map`, `mathlib:RingHom.pullback`, `mathlib:RingHom.pullback_comm_sq`.

**Sources:** Weibel.KBook.III, Proof of Theorem 2.6, the last step, p. III.15 — The argument of the proof steps; in the notation here S is S, T is R/I and C is S/I..

#### Milnor's K₁–K₀ Mayer–Vietoris sequence for a Milnor square

`GeneralAlgebraicKTheory:K.5/milnor-square-mayer-vietoris` · theorem · planet: **Milnor's Mayer–Vietoris sequence**

For a Milnor square the sequence K₁(B) → K₁(S) × K₁(T) → K₁(C) → K₀(B) → K₀(S) × K₀(T) → K₀(C) is exact at each of its four interior terms. Its maps are (K(p), K(q)), then (x, y) ↦ K(φ)x − K(ψ)y (written multiplicatively on K₁), then the Milnor boundary ∂ of KTheoryLowDegrees:Z.1/milnor-boundary, which sends a gluing matrix a ∈ GL_n(C) to [FreePatch(a)] − n[B] with the gluing orientation fixed there, then (K₀(p), K₀(q)), then the difference of K₀(φ) and K₀(ψ). The K₀-groups are RingK0, which is the degree-zero group of the ring model (K.2/functorial-K-theory-of-a-ring), and the K₁-groups are the classical GL/E. The sequence is natural in morphisms of Milnor squares. It is the low-degree excision statement for a Milnor square: in the ideal form f : R → S, exactness at K₀(R) and at K₀(S) × K₀(R/I) carries the classical excision for K₀, and exactness at K₁(S) × K₁(R/I) the degree-one surjectivity of K₁(R, I) → K₁(S, I) (Weibel, Remark III.2.2.1); nothing further is asserted. Bass's continuation into negative degrees (Weibel III.4.3) is K.6's.

**Hypotheses and conventions.**

- A Milnor square: unital, possibly noncommutative rings S, T and C in one universe, a surjective unital map φ : S → C, a unital map ψ : T → C, and B = RingHom.pullback φ ψ with its projections p : B → S and q : B → T, the convention of KTheoryLowDegrees Z.1. Equivalently (Weibel III.2.6), a unital map f : R → S carrying a two-sided ideal I of R isomorphically onto a two-sided ideal of S, with T = R/I and C = S/I; then B ≅ R.
- Surjectivity of φ is essential: it is what makes the patched modules finitely generated projective and what lets elementary matrices over C lift to S.
- The K₀-groups are Z.1's RingK0 and are identified with π₀ of the ring model by K.2/functorial-K-theory-of-a-ring; the K₁-groups are KTheoryLowDegrees U.2's GL/E. The identification of the latter with π₁ of the ring model (KTheoryLowDegrees U.6 with the plus comparison) lies downstream of K.5 and is not used, so the sequence is not stated for the homotopy groups of the ring model in degree one.
- No surjectivity onto K₀(C) is asserted, and no term to the left of K₁(B).

**Construction or proof.**

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

**Prerequisites:** `GeneralAlgebraicKTheory:K.5/milnor-square-K1-exactness`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `KTheoryLowDegrees:Z.1/milnor-finite-projective`, `KTheoryLowDegrees:Z.1/milnor-boundary`, `KTheoryLowDegrees:Z.1/milnor-boundary-kernel`, `KTheoryLowDegrees:Z.1/milnor-exact-at-k0`, `KTheoryLowDegrees:Z.1/milnor-exact-at-pair`, `mathlib:RingHom.pullback`.

**Sources:** Weibel.KBook.III, Theorem 2.6 (Mayer–Vietoris) with its proof, p. III.15 — The theorem; its proof derives the K₀ positions from II.2.9 (Milnor patching, owned by KTheoryLowDegrees Z.1) and the K₁ positions from the lifting of elementary matrices.; Weibel.KBook.III, Remark 2.2.1 and Exercise 2.3, pp. III.13 and III.16 — The degree-one surjectivity and the failure of degree-one excision that bound what this node asserts.; Weibel.KBook.III, Theorem 5.8, p. III.41 — The only extension to K₂ the source gives, under its hypothesis..

#### Relative projective triples are components of the K-fibre

`GeneralAlgebraicKTheory:K.5/relative-triples-to-components` · lemma

For f:R→S, the natural triple/path comparison K₀^cl(f*)→π₀fib(K(R)→K(S)) is an isomorphism. It takes(P,α,Q) to the virtual difference[P]−[Q] with the path to zero supplied by α:f*P≅f*Q. It respects the K1(S) boundary.

**Hypotheses and conventions.**

- Unital associative rings and unital maps. Only relative degree zero is compared here; the spectrum degree-one comparison remains U.6.

**Construction or proof.**

1. Use the exact-projective K model of early K2; projective exact sequences are split. The canonical path of an object isomorphism in the S/Q model gives the proposed fibre point. Direct-sum additivity and composition of paths verify the defining triple relations.
2. Scalar extension has cofinal image because free S-modules are images of free R-modules and every projective S-module is a summand of a free one. Thus the classical five-term sequence applies.
3. Compare K1(R)→K1(S)→K0^cl(f*)→K0(R)→K0(S) with the fibre long exact sequence. Early degree0/degree1 comparisons identify the four absolute terms. The middle boundary sends a stabilized automorphism α to its loop and hence to[(R^n,α,R^n)], exactly the stable triple boundary.
4. Exactness and the outer isomorphisms give the middle isomorphism by the five lemma. This proves only the required degree0 contract and does not assume π1 of the fibre equals the classical relative K1 group.

**Acceptance.**

- The comparison uses the actual automorphism boundary and projective patching, rather than a negative absolute exact sequence.

**Prerequisites:** `GeneralAlgebraicKTheory:K.5/relative-K-theory`, `GeneralAlgebraicKTheory:K.3/additive-functor-five-term`, `GeneralAlgebraicKTheory:K.2:plus/zero-one-ring-comparison`.

**Sources:** Weibel.KBook.II, II2.10 and Ex2.17;IV Ex1.16,chapterp16 — ExerciseII2.3 and DefinitionII2.10/Ex2.17 read; the homotopy comparison is ExerciseIV1.15–1.16, whose full statement and hint were read. The proof below is a separate direct derivation combining those inputs..

#### Ideal K-zero through the augmented-ring patching square

`GeneralAlgebraicKTheory:K.5/ideal-zero-patching` · lemma

For I⊂R, the classical triple group K0^cl(R→R/I) is naturally ker(K0(R⋉I)→K0(R)), where(R⋉I) has multiplication(r,i)(s,j)=(rs,rj+is+ij). The two projections are r and r+i. The comparison respects the automorphism boundary and the map to K0(R).

**Hypotheses and conventions.**

- Unital associative rings and unital maps. Only relative degree zero is compared here; the spectrum degree-one comparison remains U.6.

**Construction or proof.**

1. R⋉I is the pullback R×_(R/I)R. Patch a triple(P,α,Q) along this square to its projective module M(P,α,Q). Subtract the diagonal patched Q; under the Q-projection the difference vanishes, and under the P-projection it is[P]−[Q].
2. Split-sum relations follow from direct sums of patched modules. For composition, the three-way patched object gives[M(P,α,Q)]+[M(Q,β,H)]−[diagonalQ]=[M(P,βα,H)] after stabilization; this is the standard Milnor patching calculation.
3. Conversely any projective over the pullback is a patched pair with an isomorphism of its reductions. A virtual class whose Q-projection is zero becomes, after adding a diagonal projective, a difference of a patched triple and its diagonal Q. Stable changes and elementary matrices give precisely the triple relations.
4. The gluing of a free automorphism triple is the Milnor boundary. Hence this isomorphism commutes with both the K1(R/I) boundary and the difference map. Compose with relative-triples-to-components.

**Acceptance.**

- The comparison uses the actual automorphism boundary and projective patching, rather than a negative absolute exact sequence.

**Prerequisites:** `GeneralAlgebraicKTheory:K.5/relative-triples-to-components`, `GeneralAlgebraicKTheory:K.5/milnor-square-mayer-vietoris`.

**Sources:** Weibel.KBook.II, ExerciseII2.3(c),II2.10 and ExerciseIV1.15 (augmented-ring hint),combinedPDF86 andIVp16 — ExerciseII2.3 and DefinitionII2.10/Ex2.17 read; the homotopy comparison is ExerciseIV1.15–1.16, whose full statement and hint were read. The proof below is a separate direct derivation combining those inputs..

#### Excision for components of relative K-theory

`GeneralAlgebraicKTheory:K.5/ideal-degree-zero-excision` · lemma

If f:R→S identifies I with an ideal J of S, then π0K(R,I)→π0K(S,J) is an isomorphism. Its proof is early K5 and does not depend on late U6 relative π1.

**Hypotheses and conventions.**

- Unital associative rings and unital maps. Only relative degree zero is compared here; the spectrum degree-one comparison remains U.6.

**Construction or proof.**

1. The square R⋉I→S⋉J over R→S is a pullback with surjective right augmentation. Its K1(S⋉J)→K1(S) map is onto because augmentation has the diagonal section.
2. Milnor K1–K0 exactness therefore gives 0→K0(R⋉I)→K0(R)⊕K0(S⋉J)→K0(S) exact, including surjectivity of the last map from the S⋉J section.
3. Take kernels of the split augmentations. The induced map ker(K0(R⋉I)→K0R)→ker(K0(S⋉J)→K0S) is an isomorphism. Apply ideal-zero-patching and relative-triples-to-components to obtain the natural fibre-component statement.
4. Applying this to Z⋉I→R identifies relative π0 with the nonunital unitization model. This is the degree-zero input used by K6’s downward contraction argument.

**Acceptance.**

- The comparison uses the actual automorphism boundary and projective patching, rather than a negative absolute exact sequence.

**Prerequisites:** `GeneralAlgebraicKTheory:K.5/ideal-zero-patching`, `GeneralAlgebraicKTheory:K.5/milnor-square-mayer-vietoris`, `GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation`.

**Sources:** Weibel.KBook.II, ExerciseII2.3(a),combinedPDF86/printed78;the split augmented-ring square realizes its hint — ExerciseII2.3 and DefinitionII2.10/Ex2.17 read; the homotopy comparison is ExerciseIV1.15–1.16, whose full statement and hint were read. The proof below is a separate direct derivation combining those inputs..

#### Excision data and Milnor squares

`GeneralAlgebraicKTheory:K.5/excision-data-and-milnor-squares` · construction · planet: **Milnor excision data**

An excision datum consists of a unital ring map f:A→B, two-sided ideals I⊂A and J⊂B, and the requirement that f restrict to an isomorphism I≅J of nonunital rings. The quotient square A→B, A/I→B/J is both a pullback and a pushout in unital rings and has surjective quotient maps. For a functor F to spectra, excision on this datum means that its square is homotopy cartesian, equivalently fib(F(A)→F(A/I))→fib(F(B)→F(B/J)) is an equivalence.

**Hypotheses and conventions.**

- The algebraic datum is allowed for associative rings. The domain-base-change theorem below is restricted to commutative rings.
- An arbitrary pullback of rings without a surjective side is not called a Milnor square here.

**Construction or proof.**

1. Use RingHom.pullback for the underlying ring pullback. The ideal identification proves that A maps bijectively to the pullback.
2. The common ideal kills the difference between the two quotient descriptions; the universal property proves the pushout assertion.
3. Use the generic fibre/pullback equivalence for spectra. Keep the datum separate from the assertion that K-theory satisfies excision on it.

**API.**

| Declaration | Contract |
| --- | --- |
| ExcisionDatum.toPullback | Identify A with B×_(B/J)(A/I). |
| ExcisionDatum.toPushout | The quotient square is a pushout in unital rings. |
| ExcisionDatum.fibreComparison | Map the two relative fibres using f and its quotient map. |
| ExcisionDatum.excisive_iff | Fibre comparison is an equivalence exactly when the square of spectra is cartesian. |

**Uses.**

- Bhatt–Mathew Definition 1.11: Supplies the datum imported by arc-topology excision.
- GeneralAlgebraicKTheory:K.5/tor-unital-excision: Separates its algebraic input from the Tor-unital theorem.

**Checks.**

- **zero_ideal** (degenerate): For I=J=0 the relative fibres are zero for every F.
- **whole_ideal** (computation): For I=A and J=B, the datum forces f to be an isomorphism.
- **milnor_example** (computation): For A=k[x,y]/(xy), B=k[x], I=(x)⊂A and J=(x)⊂B, the quotient square is the pullback k[x]×_k k[y].

**Acceptance.**

- I=0 gives an excision datum for every f, with the horizontal quotient maps identities.
- I=A forces J=B and f an isomorphism.

**Prerequisites:** `mathlib:RingHom.pullback`, `GeneralAlgebraicKTheory:K.5/relative-K-theory`, `StableHomotopyKTheory:H.5:spectra`.

**Sources:** BM.Arc, Definition 1.11, pp.5–6; Definition 4.12, p.31 — Algebraic excision data and the fibre criterion are distinct from any descent theorem for an arc-sheaf..

#### Excision data after domain base change

`GeneralAlgebraicKTheory:K.5/domain-base-change-of-excision-data` · theorem

If (A,I)→(B,J) is a commutative excision datum and A→V is a map to an integral domain, then the tensor-base-changed quotient square is again a Milnor square: V→(B⊗_A V)×_((B/J)⊗_A V)((A/I)⊗_A V) is an isomorphism.

**Hypotheses and conventions.**

- All rings in the datum are commutative; V is an integral domain. No flatness is required of A→V.

**Construction or proof.**

1. Tensor the right-exact sequence for the original Milnor square; this gives surjectivity onto the new pullback.
2. The kernel is an ideal of V. If its localization to Frac(V) is zero, torsion-freeness makes it zero.
3. Over the fraction field the image of I is either zero or the unit ideal, and in either case the tensor square is a pullback. This proves injectivity.

**Acceptance.**

- The construction holds for V=Frac(A) when A is a domain.
- Retain the domain hypothesis when the map A→V is nonflat; right exactness alone proves only surjectivity.

**Prerequisites:** `GeneralAlgebraicKTheory:K.5/excision-data-and-milnor-squares`.

**Sources:** BM.Arc, Lemma 4.13 and proof, pp.31–32 — The domain hypothesis is the reason arbitrary base change is not asserted..

#### Tor-unital nonunital rings

`GeneralAlgebraicKTheory:K.5/tor-unital-nonunital-rings` · definition · planet: **Tor-unital rings**

Component: `GeneralAlgebraicKTheory:K.5:Tor-unital`.

For an associative nonunital ring I, put I⁺=Z⋉I using the pinned Unitization. Call I Tor-unital if the multiplication Z⊗^L_(I⁺)Z→Z is an equivalence, or equivalently Tor_n^(I⁺)(Z,Z)=0 for every n>0. The two Z modules use the augmentation I⁺→Z. This is integral Tor-unitality, not only bar acyclicity after tensoring with Q.

**Hypotheses and conventions.**

- Tensor factors are a right and a left I⁺-module; noncommutative rings are allowed.
- The degree-zero tensor map is already an isomorphism, and Tor1 identifies with I/I². Derived tensor is imported from the enhanced module supplier.

**Construction or proof.**

1. Use the canonical augmentation of Unitization and its augmentation ideal.
2. Apply the augmentation short exact sequence to identify Tor1 with I/I².
3. Identify the higher homology of the derived tensor with Tor, giving the equivalent criterion.

**API.**

| Declaration | Contract |
| --- | --- |
| NonunitalRing.IsTorUnital | Vanishing of every positive Tor group of the augmented unitization. |
| NonunitalRing.isTorUnital_iff_derivedTensor | The augmentation-derived tensor multiplication is an equivalence. |
| NonunitalRing.torOne_unitization | Tor1^(I⁺)(Z,Z) is naturally I/I². |
| NonunitalRing.isTorUnital_iso | Transport the predicate along nonunital ring isomorphisms. |

**Uses.**

- Scholze, Berkovich Motives, p.46: Checks that the open unit ball has ambient-independent K-theory.
- GeneralAlgebraicKTheory:K.5/tor-unital-excision: Supplies the exact excision hypothesis.

**Checks.**

- **zero** (degenerate): I=0 gives Z⊗^L_Z Z=Z.
- **unital** (computation): A unital I is Tor-unital: I⁺≅Z×I and Z is a projective summand.
- **square_zero** (non-example): For I=Fp with zero multiplication, Tor1^(I⁺)(Z,Z)=Fp≠0, so it is not Tor-unital.

**Acceptance.**

- Zero and unital rings viewed as nonunital rings are Tor-unital.
- The square-zero nonunital ring Fp has nonzero Tor1=Fp.

**Prerequisites:** `mathlib:Unitization`, `EnhancedDerivedSheaves:E5:abstract`.

**Sources:** Tamme.Excision, Definition 21, Lemma 22 and Example 24, pp.11–12 — Specializes derived Tor-unitality to the augmentation of a nonunital ring.; Scholze.Berkovich, Footnote 2, p.5; p.46 — This integral notion is the hypothesis used for the nonunital ideal A_<1..

#### Flat idempotent ideals are Tor-unital

`GeneralAlgebraicKTheory:K.5/flat-idempotent-ideal-criterion` · theorem

Component: `GeneralAlgebraicKTheory:K.5:Tor-unital`.

If a nonunital ring I is flat as a right module over I⁺ and I²=I, then I is Tor-unital. More generally a two-sided ideal I in a unital ring A that is flat as a right A-module and idempotent makes A→A/I Tor-unital. To deduce intrinsic Tor-unitality from the second statement, apply it to A=I⁺ or use a separately justified change-of-unitization criterion.

**Hypotheses and conventions.**

- Flatness must be over the ring in the Tor calculation; idempotence alone only kills Tor1.

**Construction or proof.**

1. The exact sequence 0→I→A→A/I→0 and flatness give a flat resolution of length one.
2. Tensor with A/I. The resulting degree-one term is I/I²=0 and higher terms vanish.
3. Set A=I⁺ for the intrinsic version. The filtered-multiplication model in the Berkovich consumer supplies flatness over its chosen unital model and the canonical-unitization comparison must be retained.

**Acceptance.**

- A nonunital ring with local units satisfies the intrinsic Tor-unital condition.
- The criterion does not claim that every idempotent ideal is flat.

**Prerequisites:** `GeneralAlgebraicKTheory:K.5/tor-unital-nonunital-rings`.

**Sources:** Scholze.Berkovich, p.46, flat idempotent ideal argument — The application must supply the actual flat-module and unitization comparison, not only I²=I.; Tamme.Excision, Example 24, p.12 — Relates unitization Tor-unitality to the ambient quotient map..

#### Suslin excision via the derived square

`GeneralAlgebraicKTheory:K.5/tor-unital-excision` · theorem · planet: **Tor-unital excision**

Component: `GeneralAlgebraicKTheory:K.5:Tor-unital`.

For an associative Tor-unital nonunital ring I and every unital A containing I as a two-sided ideal, the canonical map Knc(I):=fib(Knc(I⁺)→Knc(Z))→fib(Knc(A)→Knc(A/I)) is an equivalence of spectra. Thus nonunital K-theory is independent of the ambient ring under this hypothesis. The induced comparison of classical relative groups is an isomorphism in every nonnegative degree.

**Hypotheses and conventions.**

- Use nonconnective K-theory for the spectrum statement. Agreement with the classical models is supplied by K.6 and Part II.
- No converse or finite-degree Tor criterion is inferred from Tamme’s sufficiency theorem.

**Construction or proof.**

1. The square I⁺→Z, A→A/I is a homotopy pullback of E1-ring spectra, since its quotient maps are surjective.
2. Tor-unitality and Tamme Lemma 23 identify Z⊗^L_(I⁺)A with A/I. Apply the Part II replacement-algebra theorem: its replacement algebra has this underlying spectrum and the canonical multiplication is an equivalence of E1-rings.
3. The replacement square is cartesian under every localizing invariant, in particular Knc. Taking horizontal fibres proves the assertion.
4. Equivalently Tamme’s direct proof uses the lax-pullback exact sequence of perfect categories. Do not replace this by the generally false claim that Perf(A)→Perf(A/I) is a Verdier localization.

**Acceptance.**

- I=0 gives equivalent zero fibres.
- A unital ring considered nonunital recovers its ordinary Knc.
- Square-zero I is outside the theorem; no unconditional Milnor-square excision follows.

**Prerequisites:** `GeneralAlgebraicKTheory:K.5/tor-unital-nonunital-rings`, `GeneralAlgebraicKTheory:K.5/excision-data-and-milnor-squares`, `GeneralAlgebraicKTheoryPartII:KII.2/amalgam`, `GeneralAlgebraicKTheory:K.7/nonunital-bass-fibre`, `GeneralAlgebraicKTheory:K.6/bass-spectrum-homotopy-groups`.

**Sources:** Tamme.Excision, Theorem 1, p.1; Theorems 15,18,26,28 and proof of Theorem 1, pp.9–14 — A read direct proof of the all-degree sufficient condition.; Scholze.Berkovich, Footnote 2, p.5; p.46 — Gives the precise excision theorem required by the Berkovich consumer..

### K.6 — Nonconnective theory and affine support gluing

Develop Bass contractions and spectra, the associative-ring projective-line category, Nil terms and the Laurent decomposition, then Frobenius IK and its additive-cone comparison. Use enhanced maps for invariance and idempotent completion at degree zero. Negative vanishing for arbitrary abelian categories is not asserted. Principal-support localization and noetherian completion gluing use perfect kernels.

#### Flasque rings, infinite sum rings and the Eilenberg swindle

`GeneralAlgebraicKTheory:K.6/flasque-rings-and-the-swindle` · definition · planet: **Flasque ring**

A ring is FLASQUE, in Karoubi's sense, when there is a bimodule M, finitely generated projective as a right module, together with a bimodule isomorphism from the direct sum of the ring with M onto M. For a flasque ring the zeroth K-group vanishes, because for every finitely generated projective P the natural isomorphism from the direct sum of P with its tensor product against M onto that tensor product makes the class of P equal to zero; this is the Eilenberg swindle. When the underlying right module structure on M is the ring itself the ring is called an INFINITE SUM RING, and the cone rings are examples, hence flasque. The notion has nothing to do with the flasque sheaves that both pinned libraries call by that name, and a formalisation must not reuse the name.

**Hypotheses and conventions.**

- R is a ring, not necessarily commutative; M is an R-bimodule, finitely generated projective as a right module.
- The isomorphism is of bimodules and is part of the data, not merely an abstract isomorphism of underlying modules.
- The pinned libraries' IsFlasque is the sheaf-theoretic notion;  the name must be kept apart.

**Construction or proof.**

1. Define the flasque structure as a record carrying the bimodule and the isomorphism.
2. Prove the swindle: for every finitely generated projective P, tensoring the defining isomorphism with P gives that the class of P vanishes in the zeroth K-group, so that group is trivial.
3. Define an infinite sum ring as a flasque ring whose bimodule is the ring itself as a right module, and record the equivalent formulation the source gives through a ring map from the infinite matrix ring.
4. Record the cone ring of a ring as an example, namely the ring of row-and-column finite infinite matrices, and prove that it is an infinite sum ring.
5. Use the existing idempotent completion: idempotent completion exists in Mathlib, and the flasque notion of this node does not.

**API.**

| Declaration | Contract |
| --- | --- |
| IsFlasqueRing | The bimodule and the isomorphism witnessing flasqueness. |
| IsFlasqueRing.K0_eq_zero | The zeroth K-group of a flasque ring vanishes. |
| IsInfiniteSumRing | A flasque ring whose bimodule is the ring as a right module. |
| coneRing | The cone ring of a ring, the row-and-column finite infinite matrices. |
| coneRing_isInfiniteSumRing | The cone ring is an infinite sum ring, hence flasque. |

**Uses.**

- K.6, the axioms for negative K-theory: Vanishing on flasque rings is one of the four axioms that characterise a theory of negative K-theory.
- K.6, the nonconnective construction: The flasque route to a nonconnective spectrum, which the stage text names, is built from these rings.
- The libraries: At these pins the K-theoretic notion is absent and that the name is taken; a formalisation must choose a different name.

**Checks.**

- **cone_ring_flasque** (computation): The cone ring of any ring is flasque.
- **K0_vanishes** (degenerate): The zeroth K-group of a flasque ring is trivial.
- **infinite_sum_is_flasque** (computation): Every infinite sum ring is flasque, by taking the bimodule to be the ring.
- **nonzero_field** (non-example): A nonzero field k is not flasque: a finite-dimensional right k-module M cannot satisfy k⊕M≅M, by dimension.

**Acceptance.**

- The cone ring of any ring is flasque, so its zeroth K-group vanishes; this is the standard example.
- A flasque ring has vanishing zeroth K-group; the converse is false and the node does not claim it.
- A nonzero field is not flasque.

**Prerequisites:** `mathlib:Matrix`, `mathlib:RingHom`.

**Sources:** Kbook.2013, II.2.1.3 (Example 2.1.3), printed p. 69 (PDF p. 77) — The definition and the swindle; Kbook.2013, Exercise I.1.8 (Cone Ring), printed p. 5 (PDF p. 13) — The cone ring; it is an exercise, not an item I.1.8.

#### Contracted functors and the contraction LF

`GeneralAlgebraicKTheory:K.6/contracted-functors` · construction

For a functor F from rings to abelian groups define LF(R) to be the cokernel of the difference map from the direct sum of F of the polynomial ring in t and of the polynomial ring in t inverse into F of the Laurent polynomial ring. Call F ACYCLIC when the four-term sequence, from F of the ring through those two, to the Laurent ring and onto LF, is exact for every ring; call it CONTRACTED when it is acyclic and the defining surjection onto LF admits a splitting natural in both the ring and the variable. Iterating gives the functors NLF and L-squared F. This is the machine that produces the negative K-groups, and the naturality of the splitting is the part that does the work.

**Hypotheses and conventions.**

- F is a functor from rings to abelian groups; the polynomial and Laurent rings are over the given ring.
- The splitting of a contracted functor is natural in the variable as well as in the ring; naturality in the ring alone is not enough for the iteration.
- The notation F with subscript minus one is the source's alternative name for LF and is recorded so that the literature can be read.

**Construction or proof.**

1. Define LF as the displayed cokernel and prove that it is functorial.
2. Define the four-term sequence and the acyclicity and contractedness conditions.
3. Prove the elementary closure properties: a direct sum of contracted functors is contracted, and a natural retract of a contracted functor is contracted.
4. Define the iterates NF, NLF and L-squared F and record the source's formula for the value of a contracted functor on a Laurent ring in several variables, as a sum of copies of the iterates indexed by a formal polynomial in two symbols.
5. Record the two examples the source gives: the zeroth K-group is contracted with contraction the first negative group, and the special first K-group iterates to the same place.

**API.**

| Declaration | Contract |
| --- | --- |
| contraction | The functor LF. |
| IsAcyclic | The acyclicity predicate. |
| IsContracted | Acyclicity together with the natural splitting. |
| IsContracted.splitting | The splitting, natural in the ring and the variable. |
| contraction_iterate | The iterates NLF and L-squared F. |
| IsContracted.sum | A direct sum of contracted functors is contracted. |

**Uses.**

- K.6, the negative K-groups: They are defined as the iterated contraction of the zeroth K-group.
- K.6, the fundamental theorem: The theorem is the statement that the zeroth and first K-groups are contracted, with the splitting given by multiplication by the variable.
- SchemeKTheoryOperations S.5: The scheme-level fundamental theorem is the same statement for a different input, and the contraction formalism is shared.

**Checks.**

- **K0_contracted** (computation): The zeroth K-group is a contracted functor.
- **iterate_agrees** (compatibility): The iterated contraction of the special first K-group is the first negative K-group.
- **naturality_in_t** (non-example): The splitting is natural in the variable; a splitting natural only in the ring does not make the functor contracted.
- **retract_closed** (computation): A natural retract of a contracted functor is contracted.

**Acceptance.**

- The zeroth K-group is a contracted functor, and its contraction is the first negative K-group; this is the source's starting point.
- The iterated contraction of the special first K-group is again the first negative K-group, which is the consistency the source records.
- A functor that is acyclic but has no natural splitting is not contracted, and the iteration is then unavailable; the distinction is the content of the definition.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/flasque-rings-and-the-swindle`, `mathlib:Polynomial`, `mathlib:LaurentPolynomial`.

**Sources:** Kbook.2013, III.4.1.1 (Definition 4.1.1), printed p. 210 (PDF p. 218) — The definition.

#### Bass's negative K-groups

`GeneralAlgebraicKTheory:K.6/negative-k-groups` · definition · planet: **Bass's negative K-groups**

For n positive define the n-th negative K-group of a ring inductively as the cokernel of the difference map from the direct sum of the (n-1)-st negative group of the two polynomial rings into that of the Laurent ring; the case n = 1 starts from the zeroth K-group of the early ring functor (K.2:plus). In the notation of the contraction this says K_{−n} = Lⁿ K_0 (Definition III.4.1.1). Each is a functor from rings to abelian groups. The first negative group is what the Fundamental Theorem for the zeroth K-group produces: that theorem gives a split exact sequence exhibiting the zeroth K-group of the Laurent ring as the direct sum of the zeroth group, the first negative group and two copies of the N-term, which is the obstruction to homotopy invariance. That K_0 and every K_{−n} are contracted functors, with that decomposition, is K.6/negative-k-groups-are-contracted; this node is the definition, and its identification with the negative homotopy of the Bass spectrum is K.6/bass-spectrum-homotopy-groups.

**Hypotheses and conventions.**

- R is a ring; the groups are defined for every ring, with no regularity or noetherian hypothesis.
- The definition is by iterated contraction, so it depends on the previous node's machine and on nothing else.
- The N-terms are the cokernels of the maps from the K-group of the ring to that of the polynomial ring, and vanish exactly when the K-group in that degree is homotopy invariant.

**Construction or proof.**

1. Define the groups by the displayed induction and prove functoriality.
2. Record that the Fundamental Theorem for the zeroth K-group, which makes these cokernels the contractions of contracted functors and gives the four-term decomposition of the zeroth group of the Laurent ring, is proved in K.6/negative-k-groups-are-contracted, not here.
3. Read off from Definition III.4.1.1 that the first negative group is the contraction LK_0, and more generally that K_{−n} = Lⁿ K_0, so that the two definitions agree.
4. Prove the elementary consequences: the groups commute with finite products of rings, and they vanish on a flasque ring, both of which follow from the corresponding statements in degree zero.
5. Record the alternative approach of Karoubi and Villamayor that the source mentions, and that it is not the one developed here.

**API.**

| Declaration | Contract |
| --- | --- |
| negativeK | The n-th negative K-group. |
| negativeK_functor | Functoriality in the ring. |
| negativeK_one | The first negative group is the contraction of the zeroth K-group. |
| negativeK_eq_contraction_iterate | K_{−n} = Lⁿ K_0: the n-th negative group is the n-fold contraction of the zeroth K-group. |
| negativeK_flasque | The negative groups of a flasque ring vanish. |
| negativeK_prod | Compatibility with finite products of rings. |

**Uses.**

- K.6, the axioms: Bass’s groups are the model that satisfies the four axioms, which is what makes the axioms non-vacuous.
- K.6, the nonconnective spectrum: The spectrum is built so that its negative homotopy groups are these groups.
- K.7: The products and the invariance statements are asserted for the nonconnective theory, hence for these groups as well.
- K.6, Mayer–Vietoris and excision for Milnor squares; Clausen–Mathew–Morrow, the proof of Proposition 4.34 (p. 35): Bass's groups are the non-positive homotopy of the nonconnective K-theory whose birelative term that proof needs concentrated in degrees ≥ 0 (K.6/milnor-square-excision-in-nonpositive-degrees).

**Checks.**

- **regular_vanishes** (computation): For a regular noetherian ring the negative groups vanish.
- **flasque_vanishes** (computation): For a flasque ring they vanish.
- **laurent_four_pieces** (computation): The zeroth group of the Laurent ring decomposes into four named pieces.
- **not_from_connective** (non-example): The groups are not the negative homotopy of the connective spectrum, which is zero; a formalisation that identified them would be wrong.

**Acceptance.**

- For a regular noetherian ring every negative group vanishes, which is the theorem of a subsequent node.
- For a flasque ring every negative group vanishes, which is one of the axioms.
- The groups are not defined by homotopy groups of a connective spectrum; the connective model has no negative homotopy, and inferring vanishing from that absence is the error the stage text forbids.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/contracted-functors`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `mathlib:LaurentPolynomial`, `tauceti:TauCeti.ExactK0`.

**Sources:** Kbook.2013, III.4.1 (Definition 4.1), printed p. 210 (PDF p. 218) — The definition; Kbook.2013, III.3.7 (Fundamental Theorem for K0 3.7), printed p. 206 (PDF p. 214) — The first negative group from the Fundamental Theorem for K0; Kbook.2013, III.4.1.1, the paragraph after the definition, printed p. 210 (PDF p. 218) — K_{−n} = Lⁿ K_0.

#### The projective line over an associative ring, as a gluing category

`GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring` · construction

Let R be a unital associative ring, not necessarily commutative. The category mod-P¹_R has as objects the triples F = (M₊, M₋, α) in which M₊ is a right R[t]-module, M₋ a right R[t⁻¹]-module and α : M₊ ⊗_{R[t]} R[t,t⁻¹] → M₋ ⊗_{R[t⁻¹]} R[t,t⁻¹] an isomorphism of R[t,t⁻¹]-modules; a morphism is a pair of module maps compatible with the gluing isomorphisms. It is abelian, with kernels and cokernels taken componentwise, because inverting the central element t is exact. VB(P¹_R) is the full exact subcategory of triples whose components M₊ and M₋ are finitely generated projective, and K(P¹_R) := K(VB(P¹_R)), the K-theory of that exact category (K.1, on a small model). The twist is F(n) = (M₊, M₋, t⁻ⁿα), with the two maps X₀ = (1, 1/t) and X₁ = (t, 1) from F(n−1) to F(n); the exact functors u_i : P(R) → VB(P¹_R) send P to (P[t], P[t⁻¹], tⁱ), so that u_i(P)(n) = u_{i−n}(P); and π_* and R¹π_* : mod-P¹_R → mod-R are the kernel and the cokernel of d : M₊ × M₋ → M₋ ⊗_{R[t⁻¹]} R[t,t⁻¹], d(x, y) = α(x) − y. This is NOT the scheme P¹ over an affine scheme Spec R: for noncommutative R there is no such scheme, and nothing here uses one. For commutative R the source records that mod-P¹_R and VB(P¹_R) are equivalent to the quasi-coherent sheaves and the vector bundles on the scheme P¹_R; that comparison belongs to SchemeKTheoryOperations S.5, which imports this node, and no node of this roadmap uses it.

**Hypotheses and conventions.**

- R is a unital associative ring and modules are right modules, as in the source. The element t is central in R[t], so R[t,t⁻¹] is the localisation of R[t] (and of R[t⁻¹]) at a central element, and the two base changes into R[t,t⁻¹] are exact.
- The gluing α is part of the data of an object: two triples with isomorphic components and different gluings are in general not isomorphic (unit test pi_u1).
- VB(P¹_R) is closed under extensions in mod-P¹_R and essentially small; K(P¹_R) is computed on a small model, as K.1 prescribes.
- The functors u_i land in VB(P¹_R) and are exact because the exact structure on P(R) is the split one and base change is additive (K.2:plus scalar extension).
- Right-module convention: in these gluing-category arguments P(R) means the pinned finite projective modules over Rᵐᵒᵖ, not ModuleCat R (which consists of left modules). The early ring model uses left modules; transport the right-module K-groups to that model through K.2/functorial-K-theory-of-a-ring’s opposite-ring duality, naturally in ring maps. No identification of left and right module categories is assumed.

**Construction or proof.**

1. Define mod-P¹_R, with morphisms the pairs (f₊, f₋) such that (f₋ ⊗ 1) ∘ α = α′ ∘ (f₊ ⊗ 1), and prove that it is abelian with componentwise kernels and cokernels, using that R[t] → R[t,t⁻¹] and R[t⁻¹] → R[t,t⁻¹] are flat (localisation at the central element t).
2. Define VB(P¹_R), prove that it is an exact subcategory closed under extensions, take a small model and set K(P¹_R) := K(VB(P¹_R)) by K.1.
3. Define the twists F(n) and the maps X₀, X₁ : F(n−1) → F(n), and prove that the Koszul sequence 0 → F(−2) → F(−1)² → F → 0, with maps (X₁, −X₀) and (X₀, X₁), is exact for every F in mod-P¹_R and lies in VB(P¹_R) when F does.
4. Define u_i : P(R) → VB(P¹_R), P ↦ (P ⊗_R R[t], P ⊗_R R[t⁻¹], tⁱ), prove that it is exact, and prove u_i(P)(n) = u_{i−n}(P) naturally in P.
5. Define π_* and R¹π_* by the four-term exact sequence 0 → π_*F → M₊ × M₋ → M₋ ⊗ R[t,t⁻¹] → R¹π_*F → 0 with d(x, y) = α(x) − y, and compute them on u_0(R), u_1(R) and u_2(R) (the unit tests).
6. Prove functoriality in R: a unital ring map R → R′ induces base change mod-P¹_R → mod-P¹_{R′} componentwise, exact on VB and compatible with the twists, with the u_i, with identities and with composition (K.2:plus scalar extension).

**API.**

| Declaration | Contract |
| --- | --- |
| ProjectiveLine.Module | The abelian category mod-P¹_R of glued triples (M₊, M₋, α), with morphisms compatible with the gluing. |
| ProjectiveLine.VectorBundle | The full exact subcategory VB(P¹_R) of triples with finitely generated projective components. |
| ProjectiveLine.KSpace | K(P¹_R) := K(VB(P¹_R)), by K.1 on a small model. |
| ProjectiveLine.twist | The twist F(n) = (M₊, M₋, t⁻ⁿα), with the maps X₀ = (1, 1/t) and X₁ = (t, 1) : F(n−1) → F(n). |
| ProjectiveLine.u | The exact functor u_i : P(R) → VB(P¹_R), P ↦ (P[t], P[t⁻¹], tⁱ). |
| ProjectiveLine.u_twist | u_i(P)(n) ≅ u_{i−n}(P), naturally in P. |
| ProjectiveLine.koszul | The Koszul sequence 0 → F(−2) → F(−1)² → F → 0 is exact for every F. |
| ProjectiveLine.directImage | π_* and R¹π_* : mod-P¹_R → mod-R, the kernel and the cokernel of d(x, y) = α(x) − y. |
| ProjectiveLine.map | Base change along a unital ring map R → R′, exact on VB and compatible with the twists, with the u_i, with identities and with composition. |

**Uses.**

- K.6, the projective-line splitting (K-book V.1.5.4): K(R) × K(R) ≃ K(P¹_R) through u_0 and u_1 is a statement about this category, proved with its Koszul sequence and twists.
- K.6, the t-torsion localisation sequences (Ex. V.7.5) and Nil_n(R) ≅ NK_{n+1}(R) (V.8.1): Nil(R) is the category of objects (M, 0, 0) with a length-one resolution by objects of VB(P¹_R), and the restriction j^*F = M₋ is the chart R[t⁻¹].
- SchemeKTheoryOperations S.5, the projective-line and projective-bundle theorems for schemes: For commutative R the source identifies VB(P¹_R) with the vector bundles on the scheme P¹_R; S.5 imports this ring-level object and its splitting and makes that comparison.

**Checks.**

- **pi_u0** (computation): π_*(u_0(R)) ≅ R and R¹π_*(u_0(R)) = 0.
- **pi_u1** (non-example): π_*(u_1(R)) = 0 and R¹π_*(u_1(R)) = 0, so, if R is nonzero, u_1(R) is not isomorphic to u_0(R) although both have components R[t] and R[t⁻¹]; a definition that forgot the gluing would identify them.
- **R1pi_u2** (computation): R¹π_*(u_2(R)) ≅ R and π_*(u_2(R)) = 0.
- **zero_ring** (degenerate): For R = 0 the category VB(P¹_0) is zero, so K(P¹_0) is contractible.
- **u_twist_shift** (compatibility): u_i(P)(n) ≅ u_{i−n}(P) for all integers i and n, naturally in P.

**Acceptance.**

- π_*(u_0(R)) ≅ R and R¹π_*(u_0(R)) = 0, while π_*(u_1(R)) = 0 = R¹π_*(u_1(R)): for nonzero R, u_0(R) and u_1(R) have isomorphic components and are not isomorphic, which is what the gluing records.
- R¹π_*(u_2(R)) ≅ R: in the cokernel of (x, y) ↦ t²x − y from R[t] × R[t⁻¹] to R[t,t⁻¹] exactly the coefficient of t survives.
- For R = 0 the category VB(P¹_0) is zero and K(P¹_0) is contractible.
- The construction makes sense for every associative ring and uses no scheme; a definition through the centre of R, or through Spec of anything, is not this object.

**Prerequisites:** `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `mathlib:ModuleCat`, `mathlib:Polynomial`, `mathlib:LaurentPolynomial`.

**Sources:** Kbook.2013, V.1, 'The projective line over a ring', printed p. 370 (PDF p. 378) — The gluing category and its vector bundles; Kbook.2013, V.1, the same paragraph, printed p. 370 (PDF p. 378) — The direct image functors; Kbook.2013, V.1, the same paragraph and the next, printed pp. 370 to 371 (PDF pp. 378 to 379) — The comparison for commutative R (S.5's, not used here) and the functors u_i; Kbook.2013, V.1.5.4, proof, printed p. 371 (PDF p. 379) — The twists and the Koszul sequence.

#### The two-chart Koszul sequence

`GeneralAlgebraicKTheory:K.6/projective-line-koszul` · lemma

For every gluing module F and integer n, 0→F(n−2)→F(n−1)²→F(n)→0 is exact, with maps (X₁,−X₀) and (X₀,X₁). It is a conflation of vector bundles when F is a vector bundle, and is natural in F.

**Hypotheses and conventions.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Construction or proof.**

1. On the plus chart the maps are (t,−1) and (1,t); on the minus chart they are (1,−s) and (s,1), where s=t⁻¹. Each sequence is split exact: the second map has a component equal to identity, and its kernel is the displayed first map.
2. Centrality of t and the gluing square identify these chart sequences. Componentwise exactness in the abelian gluing category proves exactness; projectivity of the chart components gives the vector-bundle conflation.

**Acceptance.**

- The signs give (1,t)(t,−1)=0 on the plus chart. This is valid over a noncommutative ring.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring`.

**Sources:** Quillen.HigherI.1973, §8.3, typescript p.135 / publication p.143 / PDF p.59, displayed sequence after Theorem3.1 — Read text and image. This is Quillen’s explicitly written two-chart sequence, with the roadmap’s right-module convention..

#### Eventual regularity and projectivity of sections

`GeneralAlgebraicKTheory:K.6/projective-line-eventual-regularity` · lemma

For every vector bundle F in the ring gluing category there is n₀ such that for all n≥n₀ and every left R-module N, H¹(F(n)⊗_R N)=0 and H⁰(F(n))⊗_R N≅H⁰(F(n)⊗_R N). Moreover H⁰(F(n)) is a finitely generated projective right R-module.

**Hypotheses and conventions.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Construction or proof.**

1. Choose finite generators on both charts. Clearing the finitely many powers of the central t in their gluing expressions gives a componentwise surjection L=u_a(R)^m→F for some a,m. Its kernel F′ is a vector bundle because the target is projective on each chart. The same construction applies to F′. This is the elementary two-chart version of §8.1 Lemma1.1(d).
2. The chart sequences split and remain exact after tensoring any left R-module N. The Čech complex has degrees0,1 only. Since H¹(L(n)⊗N)=0 for n large (the monomial calculation for u_a), the long exact sequence gives H¹(F(n)⊗N)=0. Applying the same argument to F′ gives its eventual vanishing.
3. Apply H⁰ to F′(n)→L(n)→F(n). Tensor its right-exact row by N and compare with the H⁰ row after tensoring. The monomial base-change isomorphism for L makes the map for F surjective; first doing this for F′ makes that map an isomorphism for sufficiently large n.
4. Tensoring F(n) by N is exact on both charts, and all resulting H¹ groups vanish in this range, so H⁰(F(n)⊗N) is exact in N. Base change therefore makes H⁰(F(n)) flat. The finite free presentations coming from L and a presentation for F′ show that H⁰(F(n)) is finitely presented. Flat and finitely presented implies projective.

**Acceptance.**

- For u_i(R), H⁰(u_i(R)(n)) has basis of n−i+1 monomials when n≥i; H¹ vanishes in this range.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring`.

**Sources:** Quillen.HigherI.1973, §8.1 Lemma1.1(d), typescript p.130 / publication p.138 / PDF p.54; Lemma1.12 with proof, typescript p.133 / publication p.141 / PDF p.57; §8.3 typescript p.135 / publication p.143 / PDF p.59 — The packet spells out the central-variable chart adaptation of Quillen’s proof, including arbitrary-module tensoring, finite presentation and flatness. Quillen leaves the noncommutative adaptation checks to the reader..

#### Regularity and global generation on the two charts

`GeneralAlgebraicKTheory:K.6/projective-line-regularity-lemmas` · lemma

Call F regular when H¹(F(−1))=0. If F is regular, H¹(F(k))=0 for all k≥−1 and evaluation u_0(H⁰F)→F is onto. H⁰ is exact on regular vector-bundle conflations; for a regular vector bundle F, H⁰(F(k)) is finitely generated projective for every k≥−1.

**Hypotheses and conventions.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Construction or proof.**

1. Apply the Koszul sequence to F(k), starting at k=0: H¹(F(k−1))²→H¹(F(k))→H²(F(k−2))=0. Induct from H¹(F(−1))=0.
2. For k≥1, the H⁰ sequence of 0→F(k−2)→F(k−1)²→F(k)→0 makes multiplication by X₀,X₁ onto, because H¹(F(k−2))=0. Thus H⁰(F(k)) is generated in degree0. Localizing these section maps on each chart, and using the eventual finite-generation presentation, proves evaluation onto.
3. On a conflation of regular bundles the H¹ of the first term vanishes, so H⁰ gives a short exact sequence. All positive twists stay regular.
4. For k≥−1, the same Koszul sequence in the form 0→F(k)→F(k+1)²→F(k+2)→0 gives a short exact H⁰ sequence. Its two terms on the right are finitely generated projective for k large by eventual-regularity. Descending induction, splitting the surjection onto the last projective term, proves finite projectivity for every k≥−1.

**Acceptance.**

- u_0(P)=O⊗P is regular; u_1(P)=O(−1)⊗P is not regular for nonzero projective P, since H¹(u_1(P)(−1))≅P.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/projective-line-koszul`, `GeneralAlgebraicKTheory:K.6/projective-line-eventual-regularity`.

**Sources:** Quillen.HigherI.1973, §8.1 Lemmas1.2,1.3,1.7, typescript p.131 / publication p.139 / PDF p.55; Lemma1.13 typescript p.133 / publication p.141 / PDF p.57; §8.3 typescript p.135 / publication p.143 / PDF p.59 — Read the proofs. In rank2 they reduce to the displayed two-chart Koszul sequence and its Čech long exact sequence..

#### The canonical resolution of a regular gluing bundle

`GeneralAlgebraicKTheory:K.6/projective-line-canonical-resolution` · construction

Let MR be the exact subcategory of regular vector bundles. Define T₀F=H⁰F, Z₀F=ker(u_0(T₀F)→F), and T₁F=H⁰(Z₀F(1)). These are exact functors T₀,T₁:MR→P(Rᵐᵒᵖ), and evaluation gives a natural conflation 0→u_1(T₁F)→u_0(T₀F)→F→0 in VB(P¹_R). The first term need not lie in MR.

**Hypotheses and conventions.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Construction or proof.**

1. Global generation makes the evaluation onto; finite projectivity of T₀ makes its source a vector bundle, hence the chart-split kernel Z₀ is a vector bundle. Since evaluation induces identity on H⁰, its Čech sequence gives H⁰(Z₀)=0 and H¹(Z₀)=0. Thus Z₀(1) is regular.
2. T₁=H⁰(Z₀(1)) is finitely generated projective. Evaluation on Z₀(1), twisted back by −1, gives an epimorphism u_1(T₁)→Z₀. Let W be its vector-bundle kernel.
3. The twisted evaluation induces an isomorphism on H⁰, so H⁰(W(1))=0. In the untwisted sequence H⁰(Z₀)=H⁰(u_1T₁)=H¹(u_1T₁)=0, so H¹(W)=0. Therefore W(1) is regular; its global generation and zero H⁰ force W(1)=0. This proves u_1(T₁)≅Z₀.
4. T₀ is exact on MR. The kernel diagram of the evaluation maps and the snake lemma show that Z₀ is exact on regular conflations. Its twist by1 takes values in MR; exactness of H⁰ there proves exactness of T₁. All constructions commute with morphisms of regular bundles.

**API.**

| Declaration | Contract |
| --- | --- |
| P1.T0 | H⁰ on MR, as a finite projective right module. |
| P1.Z0 | The kernel of evaluation. |
| P1.T1 | H⁰(Z₀(1)), as a finite projective right module. |
| P1.canonicalResolution | The specified three-term conflation in VB. |
| P1.canonicalResolution_natural | Bundle morphisms induce commuting maps of the resolution. |
| P1.T0_T1_exact | Both coefficient functors preserve conflations of MR. |

**Uses.**

- K.6/projective-line-splitting and t-torsion-localisation-sequences: Provides the explicit ring-level resolution or localization input, before the scheme consumers.

**Checks.**

- **p1_resolution_trivial** (degenerate): For F=u_0(0), both coefficient modules and all resolution terms are zero.
- **p1_resolution_O** (computation): For u_0(P), T₀=P and T₁=0.
- **p1_resolution_O1** (computation): For u_{−1}(P), T₀=P² and T₁=P.
- **p1_resolution_not_MR** (non-example): For nonzero P, the first term u_1(P) of the O(1) resolution is not regular.

**Acceptance.**

- For F=u_0(P), (T₀,T₁)=(P,0). For F=u_{−1}(P)=O(1)⊗P, (T₀,T₁)=(P²,P). The resolution is a VB conflation, without the false claim u_1(P)∈MR.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/projective-line-regularity-lemmas`.

**Sources:** Quillen.HigherI.1973, §8.1 construction1.9–1.11, typescript p.132 / publication p.140 / PDF p.56; Lemma1.14 typescript p.134 / publication p.142 / PDF p.58; §8.3 typescript p.135 / publication p.143 / PDF p.59 — Rank2 adaptation is expanded explicitly; the coefficient projectivity and exactness are checked rather than hidden inside ExerciseV.1.3..

#### The regular filtration gives a K-equivalence

`GeneralAlgebraicKTheory:K.6/projective-line-regular-filtration` · lemma

For MR(n)={F | F(−n) is regular}, the inclusions MR(n)→MR(n−1) and MR→VB(P¹_R) induce K-equivalences.

**Hypotheses and conventions.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Construction or proof.**

1. By regularity, MR(n)⊂MR(n−1); each is extension-closed. Eventual regularity makes their union, as n decreases without bound, equal to VB.
2. Twists by1 and2 give exact functors MR(n−1)→MR(n). The Koszul conflation 0→F→F(1)²→F(2)→0 yields, by exact-category additivity, the alternating map 2·twist1−twist2. Composing with inclusion in either order is homotopic to identity, on the appropriate regular category. Thus each adjacent inclusion is a K-equivalence.
3. Filtered continuity of K for small exact categories identifies K(VB) with the homotopy colimit of these equivalent K-spaces. In particular K(MR)→K(VB) is a K-equivalence.

**Acceptance.**

- This transports H⁰-based maps from MR to K(VB); it does not extend H⁰ to an exact functor on all vector bundles.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/projective-line-regularity-lemmas`, `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`.

**Sources:** Quillen.HigherI.1973, §8.2 Lemma2.2 with proof, typescript p.134 / publication p.142 / PDF p.58; §8.3 typescript p.135 / publication p.143 / PDF p.59 — The adjacent inclusion inverse is specified in the roadmap’s MR(n) convention, which is the negative of Quillen’s indexing..

#### The K-theory of the projective line over a ring: K(R) × K(R) ≃ K(P¹_R)

`GeneralAlgebraicKTheory:K.6/projective-line-splitting` · theorem

For every unital associative ring R the exact functors u_0 and u_1 induce a homotopy equivalence (u_0, u_1) : K(R) × K(R) → K(P¹_R), so that K_n(P¹_R) ≅ K_n(R) ⊕ K_n(R) for every n ≥ 0, naturally in R; and (u_{i+1})_* + (u_{i+1})_* ≃ (u_i)_* + (u_{i+2})_* for every integer i. Equivalently (u_0, u_0 − u_1) is a homotopy equivalence, which is the form the proof of V.8.1 uses. No commutativity is assumed. For commutative R and the scheme P¹_R this is the case of a trivial bundle of rank two in the projective bundle theorem V.1.5, which SchemeKTheoryOperations S.5 owns and which imports this ring statement.

**Hypotheses and conventions.**

- R is a unital associative ring, not necessarily commutative; K is the connective K-theory of the exact categories P(R) and VB(P¹_R) (K.1 and the early ring node of K.2:plus).
- The statement is connective, in degrees n ≥ 0; nothing is claimed here about negative K-groups of P¹_R.
- The noncommutative inputs are projective-line-eventual-regularity, projective-line-regularity-lemmas, projective-line-canonical-resolution and projective-line-regular-filtration, read and expanded from Quillen §8.1–3. The resolution is in VB, not entirely in MR.

**Construction or proof.**

1. Apply the Koszul sequence to u_i(P) and use u_i(P)(n) = u_{i−n}(P): this is a short exact sequence u_{i+2} ↣ u_{i+1}² ↠ u_i of exact functors P(R) → VB(P¹_R), and Additivity gives (u_{i+1})_* + (u_{i+1})_* ≃ (u_i)_* + (u_{i+2})_*.
2. Call F Mumford-regular when R¹π_*(F(−1)) = 0; write MR ⊂ VB(P¹_R) for the exact subcategory of such F and MR(n) for the F with F(−n) in MR. VB(P¹_R) is the increasing union of the MR(n) as n → −∞, so K(VB(P¹_R)) is the filtered colimit of the K(MR(n)) (K.1, filtered colimits).
3. Each inclusion MR(n) ⊂ MR(n−1) is a K-equivalence: the Koszul sequence gives exact functors back into MR(n), and Additivity makes their alternating sum a homotopy inverse (the argument of Lemma V.1.5.2 with r = 1).
4. For F in MR construct Quillen’s canonical resolution 0 → u_1(T_1F) → u_0(T_0F) → F → 0 by exact functors T_0 = π_* and T_1 : MR → P(R). The sequence takes values in VB(P¹_R), not in MR: u_1(P) need not be Mumford-regular. Additivity gives (u_0, u_1)_* ∘ (T_0, −T_1)_* ≃ the inclusion K(MR) → K(VB), an equivalence by the preceding steps. Hence (u_0, u_1)_* has a right homotopy inverse.
5. The exact functors v_i : MR → P(R), v_i(F) = π_*(F(i)), for i = 0,1 induce maps on K(VB) by composing with a homotopy inverse of K(MR) → K(VB). Compute them first on u_0 and u_{−1}, which do land in MR: (v_0u_0, v_0u_{−1}) = (id, 2·id) and (v_1u_0, v_1u_{−1}) = (2·id, 3·id). The Koszul relation u_1 = 2u_0 − u_{−1} on K(VB) then gives v_0u_1 = 0 and v_1u_1 = id. Thus (v_0, v_1)_* ∘ (u_0, u_1)_* is triangular with diagonal identities. Together with the right inverse above this proves the equivalence; it does not apply π_* as an exact functor on all vector bundles.
6. Naturality in R follows from the base-change functoriality of the gluing category; the form (u_0, u_0 − u_1) follows by an invertible change of basis.

**Acceptance.**

- For a field F, K_0(P¹_F) ≅ ℤ², with basis the classes of u_0(F) and u_1(F).
- In K_0(P¹_R), [u_0(R)] + [u_2(R)] = 2[u_1(R)], the relation the Koszul sequence gives.
- The theorem holds for noncommutative R, where there is no scheme P¹_R; an argument through Spec R does not prove this node.
- For a nonzero field F, u_1(F) = O(−1) is not Mumford-regular: R¹π_*(u_1(F)(−1)) = R¹π_*u_2(F) ≅ F. The proof must not factor u_1 through MR.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring`, `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.6/projective-line-koszul`, `GeneralAlgebraicKTheory:K.6/projective-line-canonical-resolution`, `GeneralAlgebraicKTheory:K.6/projective-line-regular-filtration`.

**Sources:** Kbook.2013, V.1.5.4 (Theorem 1.5.4) and the sentence before it, printed p. 371 (PDF p. 379) — The theorem; Kbook.2013, V.1.5.4, proof, printed p. 371 (PDF p. 379) — The Koszul relation, and the reduction to the proof of V.1.5; Kbook.2013, Exercise V.1.3, printed p. 375 (PDF p. 383) — The gluing-category proof is left as an exercise, with a pointer to Quillen that was not followed; Kbook.2013, V.1.5.2 (Lemma 1.5.2) with its proof, printed p. 369 (PDF p. 377) — The Mumford-regular filtration, for a projective bundle over a scheme; the node adapts it; Kbook.2013, V.1.5, the proof of Theorem 1.5, printed p. 370 (PDF p. 378) — The triangularity argument, for a projective bundle over a scheme; the node adapts it; Quillen.HigherI.1973, §8.3 Theorem3.1, typescript p.135 / publication p.143 / PDF p.59 — Primary source for the arbitrary associative-ring result. All omitted chart checks used here are supplied in the prerequisite nodes..

#### The Nil category of a ring and the Nil groups

`GeneralAlgebraicKTheory:K.6/nil-category-and-nil-groups` · definition

For a unital ring R, Nil(R) is the category of pairs (P, ν) in which P is a finitely generated projective R-module and ν is a nilpotent endomorphism of P, with morphisms the module maps commuting with the endomorphisms; it is an exact category, an exact subcategory of the endomorphism category, whose conflations are the sequences of pairs that are exact on the underlying modules. The forgetful functor Nil(R) → P(R), (P, ν) ↦ P, is exact and is split by the exact functor P ↦ (P, 0). The Nil spectrum Nil(R) is the homotopy fibre of the forgetful map K(Nil(R)) → K(R), and Nil_n(R) := π_n Nil(R), the kernel of K_n Nil(R) → K_n(R); because of the splitting, K(Nil(R)) ≃ K(R) × Nil(R) and K_n Nil(R) ≅ K_n(R) ⊕ Nil_n(R) for n ≥ 0. Nil(R) is equivalent to the category H_{1,T}(R[t]) of t-torsion R[t]-modules with a resolution of length at most one by finitely generated projective R[t]-modules: (P, ν) goes to P_ν, the module P on which t acts by ν, resolved by the characteristic sequence 0 → P[t] → P[t] → P_ν → 0 whose first map is t − ν.

**Hypotheses and conventions.**

- R is unital and associative; ν is nilpotent, not merely an endomorphism: the group built from all endomorphisms is a different and larger object (unit test nilpotent_required).
- Nil_n(R) is defined for n ≥ 0 from connective K-theory; negative degrees are not defined here.
- The equivalence with H_{1,T}(R[t]) uses T = {tⁿ}, a set of central nonzerodivisors of R[t].

**Construction or proof.**

1. Define Nil(R), its morphisms and its exact structure, and prove that the forgetful functor and the zero section are exact, with forget ∘ zero = id.
2. Deduce from the functoriality of K (K.1) that K(Nil(R)) ≃ K(R) × Nil(R), with Nil(R) the homotopy fibre of the forgetful map, and that K_n Nil(R) ≅ K_n(R) ⊕ Nil_n(R) naturally in R.
3. Prove the equivalence Nil(R) ≃ H_{1,T}(R[t]) of Lemma II.7.8.2: the characteristic sequence resolves P_ν, and conversely a t-torsion module with a length-one projective resolution is projective over R, by the Tor sequence the source gives.
4. Record the degree-zero description: Nil_0(R) is generated by the classes [(Rⁿ, ν)] − n[(R, 0)] with ν a nilpotent matrix.
5. Prove functoriality in unital ring maps by base change of pairs.

**API.**

| Declaration | Contract |
| --- | --- |
| NilCat | Nil(R), with its exact structure. |
| NilCat.forget | The exact forgetful functor (P, ν) ↦ P. |
| NilCat.zero | The exact zero section P ↦ (P, 0), a section of the forgetful functor. |
| nilGroup | Nil_n(R) := π_n of the homotopy fibre of K(Nil(R)) → K(R), for n ≥ 0. |
| KGroup.nilCat_decomposition | K_n Nil(R) ≅ K_n(R) ⊕ Nil_n(R), naturally in R. |
| NilCat.equivTorsion | Nil(R) ≃ H_{1,T}(R[t]), (P, ν) ↦ P_ν. |
| nilGroup_map | Base change along unital ring maps. |

**Uses.**

- K.6, Nil_n(R) ≅ NK_{n+1}(R) (K-book V.8.1): The Nil groups are the terms the N-groups of the Fundamental Theorem are identified with.
- K.6, the t-torsion localisation sequences: K(H_{1,T}(R[t])) is K(Nil(R)) through the equivalence, which is how the localisation sequences acquire the fibre K(R) × Nil(R).
- K.7, products: The tensor pairing End(k) × Nil(A) → Nil(A) makes Nil_0(A) a module (II.7.4.4); the products node records it as an application of its machine.

**Checks.**

- **nil0_field** (computation): For a field F, Nil_0(F) = 0.
- **nil0_dual_numbers** (computation): For A = k[ε]/(ε²) over a field k, Nil_0(A) ≅ (1 + εt·k[t])^× ≠ 0.
- **K0_nil_split** (characterisation): K_0 Nil(R) ≅ K_0(R) ⊕ Nil_0(R) through the zero section and the forgetful functor.
- **nilpotent_required** (non-example): Dropping nilpotence changes the object: (ℤ, 2) is an endomorphism of ℤ that is not nilpotent, and its class 1 − 2t in the endomorphism group of ℤ (Almkvist) is non-zero, while Nil_0(ℤ) = 0.

**Acceptance.**

- K_0 Nil(R) = K_0(R) ⊕ Nil_0(R), as the source states in II.7.4.4.
- For a field F every (Fⁿ, ν) is filtered by the kernels of the powers of ν with quotients of the form (F^a, 0), so Nil_0(F) = 0.
- For A = k[ε]/(ε²) with k a field, Nil_0(A) ≅ (1 + εt·k[t])^× is non-zero (the source's Example III.3.8.1).

**Prerequisites:** `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `mathlib:IsNilpotent`, `mathlib:Polynomial`.

**Sources:** Kbook.2013, II.7.4.4 (Example 7.4.4), printed p. 133 (PDF p. 141) — The Nil category and the split forgetful functor; Kbook.2013, IV.6.7, printed p. 324 (PDF p. 332) — The Nil spectrum and the Nil groups in every degree; Kbook.2013, II.7.8.2 (Lemma 7.8.2) with its proof, printed p. 138 (PDF p. 146) — The equivalence with t-torsion modules; Kbook.2013, III.3.8.1 (Example 3.8.1), printed p. 207 (PDF p. 215) — The non-zero Nil group of a truncated polynomial ring, used as a unit test.

#### The resolution diagram for chart localization

`GeneralAlgebraicKTheory:K.6/projective-line-localisation-models` · construction

Let H₁ be the gluing modules with a length-one VB resolution and H₁,t those whose minus chart is zero. Let P be the split exact category of minus-chart projectives that extend from VB. Define F=QVB×_{QP}E(P), where E(P) is the exact-sequence category with target in QP. Define G with objects K↣V↠M⊕Q, where K,V,Q∈VB and M∈H₁,t, with the admissible span diagrams of V.7.3. The maps h:G→QH₁,t and f:G→F send this data respectively to M and (Q,j*K↣j*V↠j*Q). T=isoVB acts by adding a bundle to K and V, and the maps are equivariant.

**Hypotheses and conventions.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Construction or proof.**

1. Chart kernels/cokernels identify H₁,t with H₁,T(R[t]). The forward functor sends M to (M,0); conversely a VB resolution of (M,0) gives a length-one projective resolution on the plus chart. The existing Nil equivalence and its characteristic resolution give the inverse embedding and its naturality.
2. VB is resolving in H₁: it is extension-closed; a kernel of a VB epimorphism to an H₁ object has projective components by Schanuel’s argument on each chart; every H₁ object has a VB resolution by definition. Thus the resolution theorem gives K(VB)≃K(H₁).
3. The category P contains free minus-chart modules and is cofinal in all finitely generated projectives, but j* is not claimed essentially surjective. All exact sequences in P split. Use the actual extension category and cartesian lift construction of K.2:plus for F.
4. Apply j* to K↣V↠M⊕Q: j*M=0, so the resulting quotient is j*Q, not j*M. This is the corrected map f, and addition of a bundle acts on its kernel and middle term. The span description and base changes follow the same pullback/pushout formulas as V.7.3 and Ex.7.1.

**API.**

| Declaration | Contract |
| --- | --- |
| P1.localisationModels | The equivariant diagram QH₁,t←G→F over QVB→QP. |
| P1.localisationModels_h | h sends a resolution to its torsion quotient M. |
| P1.localisationModels_f | f remembers Q and the split extension with quotient j*Q. |
| P1.localisationModels_action | isoVB adds to kernel and middle object, equivariantly. |
| P1.torsionChartEquiv | H₁,t≃H₁,T(R[t]), retaining the exact structures. |

**Uses.**

- K.6/projective-line-splitting and t-torsion-localisation-sequences: Provides the explicit ring-level resolution or localization input, before the scheme consumers.

**Checks.**

- **p1_torsion_zero** (degenerate): The zero gluing module corresponds to the zero torsion module.
- **p1_torsion_nil_resolution** (computation): For ν=0 on P, the chart pair (t,1) gives u_1(P)↣u_0(P) with quotient (P,0).
- **p1_chart_not_essentially_surjective** (non-example): Cofinality via free summands is sufficient; the construction does not assert that every chart projective extends individually.

**Acceptance.**

- For M=(P_ν,0), the resolution u_1(P)↣u_0(P) realizes an object of H₁. Chart restriction is identity on this torsion model.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring`, `GeneralAlgebraicKTheory:K.6/nil-category-and-nil-groups`, `GeneralAlgebraicKTheory:K.3/resolution-theorem`, `GeneralAlgebraicKTheory:K.2:plus/extension-cartesian-lifts`.

**Sources:** Kbook.V.chapter, V.7.2–7.3, pp.52–53/PDF52–53; V.7.8 pp.57–58/PDF57–58; Ex.V.7.5 p.59/PDF59 — Read the direct proof and exercises. This is its central two-chart adaptation, without use of a scheme or a downstream S.3 theorem..

#### Contractibility of the resolution fibres

`GeneralAlgebraicKTheory:K.6/projective-line-resolution-fibres` · lemma

For M∈H₁,t, the category G_M of VB epimorphisms V↠M with admissible monomorphisms over M is contractible. The Segal subdivision identifies it with the fibre of h up to nerve equivalence; consequently h and T⁻¹h are homotopy equivalences.

**Hypotheses and conventions.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Construction or proof.**

1. Choose a VB resolution V₀↠M. On G_M use the functor V↠M ↦ V⊕V₀↠M with quotient map q+q₀. The two summand inclusions give natural transformations id→(−⊕V₀)←constant(V₀). Both are admissible monomorphisms with vector-bundle quotients. This contracts the nerve.
2. The Segal subdivision sends an admissible monomorphism of presentations to its quotient-plus-M diagram, giving the fibre equivalence described in Ex.V.7.2. The cartesian base changes of h and TheoremA give h a nerve equivalence.
3. T acts trivially on the h target. Equivariance and the fibre contraction make this action invertible on the source at nerve level; the monoidal localization equivalence of the H.4 request gives G→T⁻¹G a nerve equivalence as well.

**Acceptance.**

- The sum contraction uses arrows in G_M. The pullback projections V×_M V₀→V,V₀ are generally epimorphisms and cannot replace those monomorphisms.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/projective-line-localisation-models`, `StableHomotopyKTheory:H.1`, `StableHomotopyKTheory:H.4`.

**Sources:** Kbook.V.chapter, V.7.3.1, pp.53–54/PDF53–54; V.7.8 pp.57–58 — The source’s pullback projection contraction does not lie in the stated monomorphism category. The packet supplies the sum contraction and records the discrepancy separately..

#### Directed projective lattices for the chart extension

`GeneralAlgebraicKTheory:K.6/projective-line-directed-lattices` · lemma

For a split extension A₋↣V₋↠Q₋ in P, the poset of vector-bundle lattices V⊂j_*V₋ with j*V=V₋ and image equal to a fixed vector bundle Q is nonempty and directed. It is the comma model needed for f’s fibre over Q.

**Hypotheses and conventions.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Construction or proof.**

1. Choose vector-bundle extensions of A₋ and Q₋ and a splitting V₋≅A₋⊕Q₋. In the common Laurent module, their plus-chart lattices define a vector-bundle lattice whose projection onto Q is onto. Its minus chart is the given extension. This proves nonemptiness without claiming arbitrary chart projectives extend.
2. Write I=u_1(R)↣u_0(R) using X₁=(t,1). On the plus chart, I⁻ⁿK enlarges the kernel lattice K by t⁻ⁿ; on the minus chart it leaves the same submodule. For two lattices V,V′ over Q, choose n clearing the finitely many Laurent denominators of their plus-chart generators relative to K=ker(V→Q). Then V″=V+I⁻ⁿK contains both lattices.
3. The sequence K↣V↠Q splits on each chart because Q’s chart modules are projective. Thus V″ has projective finitely generated components (on the plus chart it is t⁻ⁿK₊⊕Q₊ after a splitting; on the minus chart it is V₋), and is again a VB lattice with quotient Q. This establishes directedness.
4. The comma-category morphisms reduce to inclusion of these lattices after fixing their chart identification. Its nerve is contractible by the filtered-poset contract. This is the only denominator argument used in the chart adaptation of V.7.3.2.

**Acceptance.**

- Central t is essential for these lattice enlargements and their chart gluing. No smoothness, scheme normalization or commutativity of R is used.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/projective-line-localisation-models`, `StableHomotopyKTheory:H.1`.

**Sources:** Kbook.V.chapter, V.7.3.2 p.54/PDF54; Lemma7.8.1 and proof of7.6.1 pp.57–58/PDF57–58 — The source explains the replacement s⁻¹K→I⁻ⁿK. Here its two-chart module construction and projectivity are explicit..

#### Identify the two chart-localization maps

`GeneralAlgebraicKTheory:K.6/projective-line-localisation-comparison` · lemma

The maps T⁻¹h:T⁻¹G→QH₁,t and T⁻¹f:T⁻¹G→T⁻¹F are nerve equivalences. The induced fibre map QH₁,t→QVB agrees, up to additive inverse, with the canonical inclusion into QH₁ and the resolution equivalence. Hence K(H₁,t)→K(VB)→K(P) is a homotopy fibration.

**Hypotheses and conventions.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Construction or proof.**

1. For f, subdivision of presentations over Q reduces its fibre map to the extension functor. TheoremA and directed-lattices contract its comma categories. Cartesian base changes and TheoremB give a global nerve equivalence; equivariant monoidal localization preserves it.
2. The extension functor’s target lies in the split exact P. The localized total extension category is contractible, using the cofinal isoVB action and the H.4 contract specified in requests. The same cartesian-extension square as K.2:plus/localised-extension-fibration then gives T⁻¹F→QVB→QP a homotopy fibration.
3. Compare the maps of G to QH₁: one sends the resolution to M and one to Q. Additivity says their sum is the quotient M⊕Q. This quotient functor maps to the middle V; the natural Q arrows 0↣V and M⊕Q→V give its null homotopy. Therefore the M and Q maps are additive inverses. This is V.7.4’s sign calculation, using VB↪H₁ resolution.
4. Loop and identify K(VB)≃K(H₁). Composing the fibre equivalence with additive inverse yields the canonical inclusion fibre map. Cofinality K(P)→K(R[s]) identifies the homotopy fibre over zero and all positive-degree groups, while retaining the possible degree-zero cokernel of chart restriction.

**Acceptance.**

- The fibre inclusion has the canonical sign after the additive inverse correction. The proof never concludes surjectivity of K₀(VB)→K₀(R[s]) from cofinality.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/projective-line-resolution-fibres`, `GeneralAlgebraicKTheory:K.6/projective-line-directed-lattices`, `GeneralAlgebraicKTheory:K.2:plus/localised-extension-fibration`, `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `GeneralAlgebraicKTheory:K.3/cofinality-degree-zero-correction`, `StableHomotopyKTheory:H.4`.

**Sources:** Kbook.V.chapter, V.7.2.1 pp.52–53, Lemmas7.3.1–7.4 pp.53–55, V.7.8 pp.57–58, Ex.7.5 p.59 (same PDF pages) — Formal gluing-category adaptation of the read direct proof, with split chart extensions and the explicit directed-lattice lemma supplying its hypotheses..

#### Localisation at t: the sequences through R[t] and through P¹_R

`GeneralAlgebraicKTheory:K.6/t-torsion-localisation-sequences` · theorem

Let R be a unital ring and T = {tⁿ} ⊂ R[t], a set of central nonzerodivisors. (a) The inclusion of H_{1,T}(R[t]) and the localisation R[t] → R[t,t⁻¹] give a homotopy fibration K(H_{1,T}(R[t])) → K(R[t]) → K(R[t,t⁻¹]) of connective K-theory spaces, whose long exact sequence ends with K_0(H_{1,T}(R[t])) → K_0(R[t]) → K_0(R[t,t⁻¹]), a map that need not be onto (Caveat V.7.1.1). (b) Write H_1 for the objects of mod-P¹_R with a length-one resolution by objects of VB(P¹_R) and H_{1,t} ⊂ H_1 for those of the form (M, 0, 0). Then M ↦ (M, 0, 0) is an equivalence H_{1,T}(R[t]) ≃ H_{1,t}, the restriction j^* : VB(P¹_R) → P(R[t⁻¹]), j^*F = M₋, is exact, and K(H_{1,T}(R[t])) → K(P¹_R) → K(R[t⁻¹]) is a homotopy fibration. (c) Restriction to the chart R[t], F ↦ M₊, maps the sequence of (b) to that of (a), identically on the fibre. Through Nil(R) ≃ H_{1,T}(R[t]) the fibre of both is K(Nil(R)) ≃ K(R) × Nil(R).

**Hypotheses and conventions.**

- t is central in R[t] and a nonzerodivisor, so the Localisation Theorem V.7.1 applies with S = T; for a multiplicative set containing zero divisors the torsion category does not model the fibre (the source's Ex. V.2.9, recorded by K.5).
- H_{1,T}(R[t]) and the category H_T(R[t]) of all t-torsion modules of finite projective dimension have the same K-theory by the Resolution Theorem, as in Corollary II.7.7.3; the sequences use H_{1,T} because that is the category equivalent to Nil(R).
- For noncommutative R the chart fibration is proved through projective-line-localisation-models, resolution-fibres, directed-lattices and localisation-comparison. SchemeKTheoryOperations S.3/S.5 import the commutative specialization; they are not inputs here.

**Construction or proof.**

1. Use the direct central-nonzerodivisor proof V.7.2–7.4 and its resolution/extension diagram, expanded in the projective-line localization prerequisites. For the affine R[t] case replace bundles by projectives and the lattice enlargements I⁻ⁿK by t⁻ⁿK. This uses neither scheme support K-theory nor a late S.3 input.
2. Replace H_T(R[t]) by H_{1,T}(R[t]) by the Resolution Theorem: H_{1,T} is closed under extensions and under kernels of surjections in H_T, and every object of H_T has a finite resolution by objects of H_{1,T} (the argument of Corollary II.7.7.3).
3. For (b), apply projective-line-localisation-comparison and its canonical map identification, with H₁,t≃H₁,T(R[t]) and K(VB)≃K(H₁) supplied by the localization-models node. These prove the exercise’s required fibration, rather than citing its statement alone.
4. (c): the base change mod-P¹_R → mod-R[t], F ↦ M₊, is exact, carries H_{1,t} identically onto H_{1,T}(R[t]), VB(P¹_R) into P(R[t]) and P(R[t⁻¹]) into P(R[t,t⁻¹]), and so induces a map of fibration sequences that is the identity on the fibres.
5. Record Caveat V.7.1.1: the connective sequence (a) ends with a map K_0(R[t]) → K_0(R[t,t⁻¹]) that need not be onto; its continuation uses negative K-groups.

**Acceptance.**

- In degree zero, (a) is the exact sequence K_0 H_T(R[t]) → K_0(R[t]) → K_0(R[t,t⁻¹]) of Corollary II.7.7.4.
- The fibres of (a) and (b) are the same space K(Nil(R)); the class of (R, 0) goes to [R[t]/tR[t]] in (a) and to [(R, 0, 0)] = [u_0(R)] − [u_1(R)] in (b).
- The centrality and nonzerodivisor hypotheses on T are used; they are not decorative.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring`, `GeneralAlgebraicKTheory:K.6/nil-category-and-nil-groups`, `GeneralAlgebraicKTheory:K.4/approximation-theorem`, `GeneralAlgebraicKTheory:K.4/fibration-theorem`, `GeneralAlgebraicKTheory:K.3/resolution-theorem`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.6/projective-line-localisation-comparison`.

**Sources:** Kbook.2013, V.7.1 (Theorem 7.1) and the paragraph after it, printed pp. 420 to 421 (PDF pp. 428 to 429) — Sequence (a), for S = T, and the indirect proof this node follows; Kbook.2013, V.7.1.1 (Caveat 7.1.1), printed p. 421 (PDF p. 429) — Why the connective sequence stops at K_0; Kbook.2013, Exercise V.3.14, printed p. 399 (PDF p. 407) — The identification of the support term with the torsion category; Kbook.2013, II.7.7.3 (Corollary 7.7.3), printed p. 137 (PDF p. 145) — The reduction from H_S to H_{1,S}, in degree zero; the same resolution argument gives every degree; Kbook.2013, Exercise V.3.13, printed p. 399 (PDF p. 407) — K(P¹_R) through modules with short resolutions; Kbook.2013, Exercise V.7.5, printed p. 429 (PDF p. 437) — Sequence (b): the torsion objects on P¹_R; Kbook.2013, Exercise V.7.5(b)–(c), printed p. 429 (PDF p. 437) — Sequence (b): the fibration, stated for an associative ring as an exercise (s = 1/t).

#### The Nil inclusion factors through the forgetful map on K-theory

`GeneralAlgebraicKTheory:K.6/nil-inclusion-is-forgetful` · lemma

Let R be a unital associative ring and I : Nil(R) → H_1(P¹_R) send (P, ν) to (P_ν, 0, 0). Under the resolution equivalence K(H_1(P¹_R)) ≃ K(P¹_R), the induced map is homotopic to ((u_0)_* − (u_1)_*) ∘ forget_*. In particular it vanishes on the reduced Nil homotopy fibre in every nonnegative degree.

**Hypotheses and conventions.**

- Use the right-module gluing convention of projective-line-over-a-ring, transported to the early ring model by opposite-ring duality.
- ν is nilpotent, and H_1 is the category of objects admitting a length-one vector-bundle resolution, as in t-torsion-localisation-sequences.

**Construction or proof.**

1. For (P, ν), the pair of maps (t − ν, 1 − t⁻¹ν) defines u_1(P) → u_0(P): the gluing square commutes since (1 − t⁻¹ν)t = t − ν.
2. Its plus component is injective with cokernel P_ν by the characteristic sequence. Its minus component is invertible, with inverse the finite sum Σ_j(t⁻¹ν)^j, since ν is nilpotent. Thus 0 → u_1(P) → u_0(P) → (P_ν,0,0) → 0 is exact in the gluing category.
3. Maps commuting with ν give maps of these resolutions. Consequently this is a conflation of exact functors Nil(R) → H_1(P¹_R), with first two terms u_1∘forget and u_0∘forget. Apply K.3 additivity and the resolution equivalence.
4. On the homotopy fibre of forget_* the factorization is null, proving the reduced-Nil vanishing. Split injectivity of u_0−u_1 alone would not imply this.

**Acceptance.**

- For ν = 0 the resolution is the standard u_1(P) ↣ u_0(P) ↠ (P,0,0).
- For ν² = 0, (1−t⁻¹ν)⁻¹ = 1+t⁻¹ν on the second chart.
- For R = ℤ, P = ℤ and ν = 1, the second-chart map 1−t⁻¹ is not invertible; this pair is outside Nil(R), so the argument cannot omit nilpotence.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring`, `GeneralAlgebraicKTheory:K.6/nil-category-and-nil-groups`, `GeneralAlgebraicKTheory:K.6/t-torsion-localisation-sequences`, `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`.

**Sources:** Kbook.2013, Proof of Theorem V.8.1, book p.430 (full PDF p.438; chapter V PDF pp.60–61), with the characteristic resolution of Lemma II.7.8.2 — The source states the zero-endomorphism restriction. This node supplies the explicit nilpotent-endomorphism resolution needed to identify the map on the whole Nil category; this is the reviewer’s derivation..

#### Nil_n(R) ≅ NK_{n+1}(R)

`GeneralAlgebraicKTheory:K.6/nil-groups-are-NK` · theorem

For every unital ring R and every n ≥ 0 there is a natural isomorphism NK_{n+1}(R) ≅ Nil_n(R), where NK_{n+1}(R) is the cokernel of the split injection K_{n+1}(R) → K_{n+1}(R[t]) (equivalently of K_{n+1}(R) → K_{n+1}(R[t⁻¹])). It comes from the localisation sequence (b) of K.6/t-torsion-localisation-sequences, K_{n+1}(R[t⁻¹]) → K_n(R) ⊕ Nil_n(R) → K_n(P¹_R) → K_n(R[t⁻¹]) (the source's (8.1.1)), in which the summand K_n(R) maps to K_n(P¹_R) by u_0 − u_1 and Nil_n(R) maps to zero; the sequence therefore splits into 0 → K_n(R) → K_n(P¹_R) → K_n(R) → 0 and the isomorphism K_{n+1}(R[t⁻¹])/K_{n+1}(R) ≅ Nil_n(R).

**Hypotheses and conventions.**

- R is unital and associative. For commutative R the source uses the scheme sequence V.7.6.1; for noncommutative R it uses the gluing-category sequence of Ex. V.7.5, and this node uses the latter for every R.
- n ≥ 0: both sides are defined from connective K-theory.
- The isomorphism is natural in unital ring maps.

**Construction or proof.**

1. Substitute Nil(R) ≃ H_{1,t} into the fibration (b) to obtain (8.1.1), with K_n H_{1,t} = K_n(R) ⊕ Nil_n(R).
2. Identify the map on the summand K_n(R): the composite P(R) → Nil(R) → H_1, P ↦ (P, 0, 0), sits in the exact sequence u_1(P) ↣ u_0(P) ↠ (P, 0, 0), obtained by tensoring P with 0 → O(−1) → O → (R, 0, 0) → 0, so by Additivity it induces u_0 − u_1.
3. By nil-inclusion-is-forgetful, the entire map K(Nil(R)) → K(P¹_R) factors as (u_0 − u_1) ∘ forget, so it vanishes on Nil_n(R). The projective-line splitting then identifies its K_n(R) summand with a split direct summand of K_n(P¹_R).
4. j^* u_0(P) = P ⊗_R R[t⁻¹], so j^* ∘ u_0 is the base change K(R) → K(R[t⁻¹]) that splits off K_n(R) from K_n(R[t⁻¹]) = K_n(R) ⊕ NK_n(R).
5. Conclude by the source's diagram chase that (8.1.1) splits as stated and that the boundary K_{n+1}(R[t⁻¹]) → K_n(R) ⊕ Nil_n(R) induces NK_{n+1}(R) ≅ Nil_n(R), naturally in R.

**Acceptance.**

- For n = 0 this is Nil_0(R) ≅ NK_1(R), the classical Proposition III.3.5.3.
- For A = k[ε]/(ε²), NK_1(A) ≅ Nil_0(A) ≅ (1 + εt·k[t])^× is non-zero, so N-terms genuinely occur.
- No regularity is assumed.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/t-torsion-localisation-sequences`, `GeneralAlgebraicKTheory:K.6/projective-line-splitting`, `GeneralAlgebraicKTheory:K.6/nil-category-and-nil-groups`, `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.6/nil-inclusion-is-forgetful`.

**Sources:** Kbook.2013, V.8.1 (Theorem 8.1), printed p. 430 (PDF p. 438) — The theorem; Kbook.2013, V.8.1, proof, printed p. 430 (PDF p. 438) — The localisation sequence the proof starts from; Kbook.2013, V.8.1, proof, continued, printed p. 430 (PDF p. 438) — The map on the summand K_n(R); Kbook.2013, V.8.1, proof, end, printed p. 430 (PDF p. 438) — The splitting and the conclusion; Kbook.2013, III.3.5.3 (Proposition 3.5.3), printed p. 205 (PDF p. 213) — The classical degree-zero case, an acceptance test.

#### The Fundamental Theorem in positive degrees: exactness

`GeneralAlgebraicKTheory:K.6/fundamental-theorem-positive-degrees` · theorem

For every unital ring R and every n ≥ 1 the sequence 0 → K_n(R) → K_n(R[t]) ⊕ K_n(R[t⁻¹]) → K_n(R[t,t⁻¹]) → K_{n−1}(R) → 0 is exact. The first map is the pair of base changes, the second their difference, and the last, ∂, is the boundary of the t-localisation sequence (a) of K.6/t-torsion-localisation-sequences followed by the forgetful retraction K_{n−1} Nil(R) = K_{n−1}(R) ⊕ Nil_{n−1}(R) → K_{n−1}(R). The splitting of ∂ is K.6/multiplication-by-t-splits-the-boundary; with the maps t ↦ 1 it makes the sequence naturally split.

**Hypotheses and conventions.**

- R is unital and associative and n ≥ 1, where K_n is Quillen's; degree zero is Bass's theorem for K_0 (K.6/negative-k-groups-are-contracted) and the negative degrees are Bass's.
- The transfer along f : R[t] → R = R[t]/(t) is the finite-projective-dimension transfer of K.3, since R has the resolution 0 → R[t] → R[t] → R → 0 over R[t].

**Construction or proof.**

1. Base change mod-P¹_R → mod-R[t] maps the localisation sequence (b) to (a) (part (c) of K.6/t-torsion-localisation-sequences), giving a commutative ladder of long exact sequences that is the identity on the terms K_n(H_{1,T}(R[t])).
2. In the lower row, the map K_n(R) → K_n Nil(R) → K_n(R[t]) on the summand K_n(R) is the transfer f_* along f : R[t] → R, which is zero by Additivity applied to 0 → M[t] → M[t] → M → 0 (Example V.3.5.1).
3. In the upper row, Nil_n(R) → K_n(P¹_R) is zero and K_n(R) → K_n(P¹_R) is u_0 − u_1 (the proof of K.6/nil-groups-are-NK).
4. Chase the ladder to obtain the exactness of Seq(K_n, R) for n ≥ 1, with ∂ as stated; injectivity on the left is split by t ↦ 1.

**Acceptance.**

- For n = 1 the sequence is the classical Fundamental Theorem for K_1 (III.3.6) under the plus = Q identification of K.2:plus.
- The theorem is asserted only for n ≥ 1; for n ≤ 0 the corresponding sequence is Bass's (K.6/negative-k-groups-are-contracted), not a consequence of this node.
- No regularity hypothesis is used: the terms NK_n(R) ≅ Nil_{n−1}(R) sit inside the middle terms.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/t-torsion-localisation-sequences`, `GeneralAlgebraicKTheory:K.6/nil-groups-are-NK`, `GeneralAlgebraicKTheory:K.6/projective-line-splitting`, `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`, `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`.

**Sources:** Kbook.2013, V.8.2 (Theorem 8.2), printed p. 430 (PDF p. 438) — The theorem (the bracket is the source's); Kbook.2013, V.8.2, proof, printed p. 431 (PDF p. 439) — The ladder; Kbook.2013, V.8.2, proof, continued, printed p. 431 (PDF p. 439) — Exactness in positive degrees; Kbook.2013, V.3.5.1 (Example 3.5.1), printed p. 388 (PDF p. 396) — The vanishing of the transfer.

#### Multiplication by the class of t splits the boundary

`GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary` · lemma

Let [t] ∈ K_1(ℤ[t,t⁻¹]) be the class of the unit t, and for a unital ring R and x ∈ K_n(R), n ≥ 0, let {t, x} ∈ K_{n+1}(R[t,t⁻¹]) be the external product of [t] with x for the pairing induced by the biexact functor ⊗_ℤ : P(ℤ[t,t⁻¹]) × P(R) → P(R[t,t⁻¹]) (K.7/products-from-biexact-functors). Then the boundary ∂ of the t-localisation sequence satisfies ∂({t, x}) = x̄, where x̄ is the image of x under K_n(R) → K_n(R[t]/tR[t]) = K_n(R) → K_n(H_{1,T}(R[t])), that is the class (x, 0) in K_n(R) ⊕ Nil_n(R). Consequently x ↦ {t, x} is a right inverse of the boundary of the Fundamental Theorem, natural in R, and with the maps t ↦ 1 it splits the sequence of K.6/fundamental-theorem-positive-degrees. The sign is the one the source's conventions give, ∂[t] = [ℤ[t]/tℤ[t]]; with another sign convention for ∂ a universal sign ±1 appears and must be carried.

**Hypotheses and conventions.**

- R is unital and associative; the pairing is external, with ℤ[t,t⁻¹] as the left factor, so no commutativity of R is needed.
- [t] is the class of the unit t in the classical K_1(ℤ[t,t⁻¹]) = GL/E (KTheoryLowDegrees U.2 and U.3/units-to-K1), carried to Quillen's K_1, the first homotopy group of the K-theory space, by the plus = Q comparison (K.2:plus/plus-equals-Q) and π_1 BGL(ℤ[t,t⁻¹])⁺ = GL/E with the matrix-loop compatibility (StableHomotopyKTheory H.3, requested). The identification of the classical low-degree models registered in K.2:low-degree-comparisons is not used: that stage lies downstream of K.6.
- The boundary is linear for the pairing because the biexact functors ⊗_ℤ with P(R) carry the t-localisation fibration for ℤ[t] to that for R[t]; this compatibility is the content of Exercise V.8.1 and Ex. IV.1.23, and it is proved here from the naturality of K.7's pairing.

**Construction or proof.**

1. The biexact functors P(ℤ[t]) × P(R) → P(R[t]), P(ℤ[t,t⁻¹]) × P(R) → P(R[t,t⁻¹]) and H_{1,T}(ℤ[t]) × P(R) → H_{1,T}(R[t]), all given by ⊗_ℤ, are compatible with the functors of the two t-localisation sequences (a). They are exact in each variable because the objects of H_{1,T}(ℤ[t]) are free abelian groups (Lemma II.7.8.2), so tensoring over ℤ with a projective R-module preserves their resolutions.
2. By K.7's pairing and its naturality in each variable, these functors give a map from the smash product of the ℤ[t]-sequence with K(R) to the R[t]-sequence that commutes with the boundaries (Ex. IV.1.23); hence ∂(y · x) = ∂(y) · x for y ∈ K_{m+1}(ℤ[t,t⁻¹]) and x ∈ K_n(R) (Exercise V.8.1).
3. Compute ∂[t] = [ℤ[t]/tℤ[t]] in K_0 H_{1,T}(ℤ[t]), the class of (ℤ, 0) in K_0 Nil(ℤ), and observe that its product with x is x̄.
4. Conclude that ∂ ∘ {t, −} is the inclusion of K_n(R) as the first summand of K_n(R) ⊕ Nil_n(R), so that after the forgetful retraction it is the identity; naturality in R follows from the naturality of the pairing in its second variable.

**Acceptance.**

- ∂({t, [R]}) = [R] in K_0(R): the product of the unit class with t has boundary the unit class.
- x ↦ {t, x} commutes with the maps induced by unital ring maps R → R′.
- Only the external product with the fixed class [t] over ℤ is used, never an internal product on K_*(R), so the lemma holds for noncommutative R.

**Prerequisites:** `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `GeneralAlgebraicKTheory:K.6/t-torsion-localisation-sequences`, `GeneralAlgebraicKTheory:K.6/nil-category-and-nil-groups`, `GeneralAlgebraicKTheory:K.6/fundamental-theorem-positive-degrees`, `KTheoryLowDegrees:U.3/units-to-K1`, `KTheoryLowDegrees:U.2/K1`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `StableHomotopyKTheory:H.3`, `StableHomotopyKTheory:H.5:spectra`.

**Sources:** Kbook.2013, V.8.2, proof, the splitting, printed p. 431 (PDF p. 439) — The splitting and the formula; Kbook.2013, Exercise V.8.1, printed p. 434 (PDF p. 442) — The boundary formula, for the general central nonzerodivisor; Kbook.2013, Exercise IV.1.23, printed p. 276 (PDF p. 284) — Pairings of fibrations commute with the boundaries (the exercise's displayed diagram, which the text layer does not carry).

#### K_1, K_0 and every K_{−n} are contracted functors: K_{−n} = Lⁿ K_0

`GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted` · theorem

The functors K_1 and K_0 on unital rings are contracted in the sense of Definition III.4.1.1, with LK_1 = K_0 and LK_0 = K_{−1}: for every R the sequences 0 → K_i(R) → K_i(R[t]) ⊕ K_i(R[t⁻¹]) → K_i(R[t,t⁻¹]) → K_{i−1}(R) → 0, for i = 1 and i = 0, are exact with splittings natural in R and in t, and K_0(R[t,t⁻¹]) ≅ K_0(R) ⊕ K_{−1}(R) ⊕ NK_0(R) ⊕ NK_0(R). Consequently every K_{−n}, n ≥ 0, is a contracted functor with L K_{−n} = K_{−n−1}, that is K_{−n} = Lⁿ K_0, with naturally split exact sequences 0 → K_{−n}(R) → K_{−n}(R[t]) ⊕ K_{−n}(R[t⁻¹]) → K_{−n}(R[t,t⁻¹]) → K_{−n−1}(R) → 0, and NL K_{−n} ≅ LN K_{−n}.

**Hypotheses and conventions.**

- R is unital and associative; the splittings are natural in the ring and in the variable, which is what contractedness requires.
- In degree one the splitting is multiplication by [t] (K.6/multiplication-by-t-splits-the-boundary); in degree zero it is obtained from degree one in a second variable, as in the source's proof of III.3.7.
- The negative groups are Bass's, defined by iterated cokernels (K.6/negative-k-groups); this node proves that the iteration is the contraction of contracted functors.

**Construction or proof.**

1. Degree one: K.6/fundamental-theorem-positive-degrees at n = 1, with the splitting x ↦ {t, x} and the maps t ↦ 1, shows that K_1 is contracted with LK_1 = K_0 (under plus = Q this is III.3.6).
2. Degree zero (III.3.7): apply degree one in the variable t to R[s], R[s⁻¹] and R[s,s⁻¹]; the natural decompositions make the map K_1(R[s,t,t⁻¹]) ⊕ K_1(R[s⁻¹,t,t⁻¹]) → K_1(R[s,s⁻¹,t,t⁻¹]) a direct sum of maps, so its cokernel, which is K_0(R[t,t⁻¹]) by degree one in the variable s, inherits a natural splitting; this gives the sequence for K_0 and the four-term decomposition.
3. Prove Proposition III.4.2: the kernel and the cokernel of a morphism of contracted functors are contracted, NF and LF are contracted when F is, and NLF ≅ LNF.
4. Induct: K_{−n−1} = L K_{−n} by Definition III.4.1, and L of a contracted functor is contracted, so every K_{−n} is contracted (Example III.4.1.2).

**Acceptance.**

- K_0(R[t,t⁻¹]) ≅ K_0(R) ⊕ K_{−1}(R) ⊕ NK_0(R) ⊕ NK_0(R) naturally, as III.3.7 states.
- For R regular noetherian NK_0(R) = 0 = K_{−1}(R) (Theorem II.7.8), so K_0(R[t,t⁻¹]) ≅ K_0(R).
- An acyclic functor need not be contracted (Ex. III.4.1): the contractedness of K_{−n} uses the natural splittings, not only exactness.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/contracted-functors`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/fundamental-theorem-positive-degrees`, `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`.

**Sources:** Kbook.2013, III.3.6 (Fundamental Theorem for K1 3.6), printed p. 205 (PDF p. 213) — Degree one, in the classical form; Kbook.2013, III.3.7 (Fundamental Theorem for K0 3.7), printed p. 206 (PDF p. 214) — Degree zero; Kbook.2013, III.3.7, proof, printed p. 206 (PDF p. 214) — The two-variable argument; Kbook.2013, III.4.1.2 (Example 4.1.2), printed p. 210 (PDF p. 218) — Every negative group is contracted; Kbook.2013, III.4.2 (Proposition 4.2), printed p. 211 (PDF p. 219) — The closure properties the induction uses; Kbook.2013, III.4.1.1, the paragraph after the definition, printed p. 210 (PDF p. 218) — Bass's groups are the iterated contractions of K_0.

#### The Fundamental Theorem with Nil terms, in every degree

`GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms` · theorem

For every unital ring R and every integer n there is a canonically split exact sequence 0 → K_n(R) → K_n(R[t]) ⊕ K_n(R[t⁻¹]) → K_n(R[t,t⁻¹]) → K_{n−1}(R) → 0, natural in R, in which the splitting of the boundary is multiplication by the class of the variable t in K_1(ℤ[t,t⁻¹]) and the maps t ↦ 1 give the rest of the splitting; for n ≤ 0 the groups are Bass's and the sequence is the one that makes K_n a contracted functor. Writing NK_n(R) for the cokernel of K_n(R) → K_n(R[t]), this gives K_n(R[t,t⁻¹]) ≅ K_n(R) ⊕ K_{n−1}(R) ⊕ NK_n(R) ⊕ NK_n(R), and for n ≥ 0 the N-terms are Nil groups: NK_{n+1}(R) ≅ Nil_n(R). When the N-terms vanish the decomposition has the two terms K_n(R) ⊕ K_{n−1}(R). The scheme form (V.8.3) is not part of this node: SchemeKTheoryOperations S.5 owns it and imports this ring theorem, and no prerequisite of this node lies in that roadmap.

**Hypotheses and conventions.**

- R is unital and associative and n is any integer: K_n is Quillen's for n ≥ 0 and Bass's for n < 0.
- The Nil category is the category of pairs of a finitely generated projective module and a nilpotent endomorphism, and the Nil groups are the reduced part of its K-theory (K.6/nil-category-and-nil-groups); the identification NK_{n+1} ≅ Nil_n is for n ≥ 0.
- The vanishing of the N-terms for a regular noetherian ring is not part of this node: in degrees ≤ 0 it comes from II.7.8 through the contraction, which is all that K.6/vanishing-for-regular-noetherian-rings needs; in positive degrees it is the homotopy invariance of K-theory for regular rings (V.6.3), which this roadmap records but does not decompose.

**Construction or proof.**

1. n ≥ 1: exactness is K.6/fundamental-theorem-positive-degrees, and the splitting of the boundary by x ↦ {t, x} is K.6/multiplication-by-t-splits-the-boundary; the maps t ↦ 1 split the left half.
2. n ≤ 0: K_0 and every K_{−n} are contracted with LK_{−n} = K_{−n−1} (K.6/negative-k-groups-are-contracted), which is the sequence in these degrees; in degree zero its splitting is induced from multiplication by t in degree one, as in the proof of III.3.7.
3. The four-term decomposition follows from the split sequence and the definition of NK_n.
4. Identify the N-terms with the Nil groups in degrees n + 1 ≥ 1 by K.6/nil-groups-are-NK.
5. Record the relation to the contracted-functor formalism: the theorem says exactly that every K_n, n ∈ ℤ, is a contracted functor with LK_n = K_{n−1}.
6. Record the boundary with the scheme roadmap: the scheme form V.8.3 is SchemeKTheoryOperations S.5's, which imports this node; the earlier prerequisite on S.5 was the reverse of the stage order and is removed.

**Acceptance.**

- For a singular ring the N-terms can be non-zero and the decomposition has four terms; no node may drop them (for A = k[ε]/(ε²), NK_1(A) ≅ Nil_0(A) ≠ 0).
- The splitting is by multiplication by the class of the variable, and a different splitting would change the identification of the boundary.
- When NK_n(R) = 0 the decomposition has the two terms K_n(R) ⊕ K_{n−1}(R).

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/fundamental-theorem-positive-degrees`, `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`, `GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted`, `GeneralAlgebraicKTheory:K.6/nil-groups-are-NK`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/contracted-functors`, `mathlib:LaurentPolynomial`.

**Sources:** Kbook.2013, V.8.2 (Theorem 8.2), printed p. 430 (PDF p. 438) — The theorem (the bracket is the source's); Kbook.2013, V.8.1 (Theorem 8.1), printed p. 430 (PDF p. 438) — The identification of the N-terms with Nil; Kbook.2013, V.8, the opening paragraph, printed p. 430 (PDF p. 438) — The regular case; Kbook.2013, V.8.2, proof, printed p. 431 (PDF p. 439) — The non-positive degrees come from Bass's contraction.

#### The axioms a theory of negative K-theory must satisfy

`GeneralAlgebraicKTheory:K.6/axioms-for-negative-k-theory` · definition

A theory of negative K-theory for possibly non-unital rings is a sequence of functors in degrees at most zero together with natural boundary maps from the K-group of a quotient to the next group down of the ideal, satisfying four axioms: in degree zero the functor is the Grothendieck group; for every two-sided ideal the five-term sequence through the ideal, the ring and the quotient is exact; every flasque ring has vanishing groups in all degrees at most zero; and the inclusion of a ring in its infinite matrix ring induces isomorphisms in all those degrees. Bass's groups form such a theory. The axioms are what a second construction must be checked against, and they are the interface through which this layer's nonconnective spectrum is compared with the Bass groups.

**Hypotheses and conventions.**

- The rings are allowed to be non-unital, which is what makes the ideal axiom usable.
- The matrix ring in the fourth axiom is the union of the finite matrix rings.
- The four axioms determine the negative theory canonically by bass-cone-uniqueness (III.4.5), including its boundary maps; checking the axioms remains necessary for any alternative model.

**Construction or proof.**

1. State the four axioms in the source's order.
2. Record that Bass's negative K-groups satisfy them, with the source's pointers to the contraction and the exercises where each axiom is checked.
3. Record the role of the flasque axiom: it is the one that forces the theory to be non-trivial in negative degrees rather than being extendable by zero.
4. Record that the excision-type axiom is stated for non-unital rings and that restricting to unital rings weakens it.
5. Record the use this layer makes of the axioms: any second construction, including the flasque-enlargement route the stage text names, is compared with Bass's groups by checking them.
6. Apply bass-cone-uniqueness only after the four axioms have been established for the candidate; no duplicate definition of negative ring groups is introduced.

**API.**

| Declaration | Contract |
| --- | --- |
| NegativeKTheory | The functors in degrees at most zero together with the boundary maps. |
| NegativeKTheory.k0 | Axiom one: in degree zero the functor is the Grothendieck group. |
| NegativeKTheory.exact_ideal | Axiom two: the five-term sequence of an ideal is exact. |
| NegativeKTheory.flasque | Axiom three: a flasque ring has vanishing groups. |
| NegativeKTheory.matrix | Axiom four: the inclusion in the infinite matrix ring is an isomorphism. |
| bassTheory | Bass’s negative groups form such a theory. |

**Uses.**

- K.6, the nonconnective spectrum: The axioms are the interface through which a second construction is compared with the Bass groups.
- K.6, the flasque rings: The third axiom is the only place the flasque notion enters the characterisation.
- The stage text: The text asks for independence of the enlargement; the axioms are what that independence is checked against.

**Checks.**

- **bass_satisfies** (computation): Bass’s groups satisfy all four axioms.
- **nonunital** (non-example): The second axiom is stated for non-unital rings; restricting to unital rings weakens it.
- **infinite_matrices** (non-example): The fourth axiom is about the infinite matrix ring, not the finite ones.
- **degree_zero** (computation): In degree zero the theory is the Grothendieck group, so the axioms extend the existing definition rather than replacing it.

**Acceptance.**

- Bass's groups satisfy all four axioms.
- A theory that is zero in all negative degrees fails the flasque axiom only if some flasque ring has a non-zero group, so the axiom must be read together with the exactness axiom; the source's formulation is the one recorded here.
- The fourth axiom is about the infinite matrix ring, not about finite matrix rings, and the distinction matters.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/flasque-rings-and-the-swindle`, `mathlib:Matrix`.

**Sources:** Kbook.2013, III.4.4 (Definition 4.4), printed p. 213 (PDF p. 221) — The definition; Kbook.2013, III.4.4, axioms (3)–(4), printed p. 213 (PDF p. 221) — The last two axioms, checked against the node's list; Kbook.2013, III.4.4.1 (Example 4.4.1), printed p. 214 (PDF p. 222) — Bass's groups satisfy the axioms.

#### Mayer–Vietoris for a Milnor square, continued into negative degrees

`GeneralAlgebraicKTheory:K.6/mayer-vietoris-for-negative-k` · theorem

Let f : R → S be a homomorphism of unital rings and I ⊂ R an ideal that f maps isomorphically onto an ideal J of S, so that R → S, R/I → S/J is a Milnor square. The Mayer–Vietoris sequence of Theorem III.2.6, K_1(R) → K_1(S) ⊕ K_1(R/I) → K_1(S/J) → K_0(R) → K_0(S) ⊕ K_0(R/I) → K_0(S/J), continues as a long exact sequence of Bass's negative K-groups: … → K_{1−n}(S/J) → K_{−n}(R) → K_{−n}(S) ⊕ K_{−n}(R/I) → K_{−n}(S/J) → K_{−n−1}(R) → … for every n ≥ 0, each negative boundary being the contraction of the one above it. The sequence starts at K_1(R): no exactness is asserted at K_n for n ≥ 2, where excision fails in general. The K_1–K_0 part is imported from K.5 (K.5/milnor-square-mayer-vietoris); the spectrum form in degrees ≤ 0 is K.6/milnor-square-excision-in-nonpositive-degrees. This is the form of excision available in negative degrees, and one of the two reasons the negative groups are useful.

**Hypotheses and conventions.**

- The square is the one determined by a ring map and an ideal carried bijectively onto an ideal (a Milnor square); no commutativity is assumed.
- The sequence is asserted from K_1(R) downward only; it continues downwards indefinitely, which is what distinguishes the negative groups from the connective theory.
- The K_1–K_0 part of the sequence (III.2.6), with its boundary, is K.5/milnor-square-mayer-vietoris and is imported, natural in maps of Milnor squares. There K_1 is the classical GL/E (KTheoryLowDegrees U.2); for the contraction it is identified with Quillen's K_1, naturally in the ring, by the plus = Q comparison (K.2:plus/plus-equals-Q) and π_1 BGL(R)⁺ = GL(R)/E(R) (StableHomotopyKTheory H.3, requested), not through K.2:low-degree-comparisons, which lies downstream of K.6.

**Construction or proof.**

1. State the hypotheses and note that the square stays a Milnor square after R ↦ R[t], R[t⁻¹], R[t,t⁻¹] (with I[t] and so on), so the K_1–K_0 sequence exists for each of these squares, naturally.
2. Import the K_1–K_0 Mayer–Vietoris sequence of III.2.6 (K.5/milnor-square-mayer-vietoris), and pass from the classical K_1 to Quillen's, naturally in the ring, through the plus = Q comparison and π_1 BGL(R)⁺ = GL(R)/E(R) (H.3).
3. Use that K_1, K_0 and every K_{−n} are contracted (K.6/negative-k-groups-are-contracted), and check that every map of the sequence is a morphism of contracted functors of the Milnor square: for the maps induced by ring maps this is naturality; for the boundary it is the compatibility of the patching boundary with the natural splittings, which the source leaves implicit and which is a proof obligation of this node.
4. Apply L: on naturally split sequences of contracted functors with compatible maps L is exact (the argument of Proposition III.4.2), and it turns the K_1–K_0 sequence into the K_0–K_{−1} sequence, whose first three terms are the last three of the K_1–K_0 sequence; splice, and iterate.
5. Record the consequence: an excision failure in degree zero is measured by a first negative group, which is how the negative groups are computed in practice.

**Acceptance.**

- Dayton's example III.4.3.1: for the Milnor square of the n-dimensional tetrahedron over a field F the sequence gives K_{−n}(Δ_n(F)) ≅ ℤ, so the negative groups of singular rings can be non-zero.
- The sequence does not terminate below, which is what makes the negative groups a genuinely infinite family.
- No statement is made at K_2 or above, and the connective theory has no negative groups: the continuation is a statement about Bass's groups, equivalently about K^B (K.6/bass-spectrum-homotopy-groups).

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted`, `GeneralAlgebraicKTheory:K.6/contracted-functors`, `GeneralAlgebraicKTheory:K.5/milnor-square-mayer-vietoris`, `KTheoryLowDegrees:U.2/K1`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `StableHomotopyKTheory:H.3`.

**Sources:** Kbook.2013, III.4.3 (Theorem 4.3), printed pp. 212–213 (PDF pp. 220–221) — The theorem; the displayed sequence follows on p. 213; Kbook.2013, III.4, the paragraph before Theorem 4.3, printed p. 212 (PDF p. 220) — The proof by contraction; Kbook.2013, III.2.6 (Theorem 2.6), printed p. 195 (PDF p. 203) — The K_1–K_0 part, imported from K.5; Kbook.2013, III.4.3.1 (Example 4.3.1), printed p. 213 (PDF p. 221) — Dayton's example, an acceptance test.

#### The nonconnective Bass K-theory spectrum

`GeneralAlgebraicKTheory:K.6/nonconnective-spectrum` · construction · planet: **The Bass K-theory spectrum**

For a functor E from rings to spectra, let LE be the homotopy cofiber of the map from the homotopy pushout of the two polynomial spectra over the spectrum of the ring into the spectrum of the Laurent ring, and let the desuspended functor be its loop space; there is a cofibration sequence natural in both arguments. Multiplication by the class of the variable, the external product with [x] ∈ K_1(ℤ[x,x⁻¹]) (K.7/products-from-biexact-functors), gives a natural map from the K-theory spectrum to its desuspension, which the Fundamental Theorem shows is the inclusion of the minus-one-connective cover; iterating gives maps of the k-fold desuspensions, each the inclusion of a deeper connective cover, and the nonconnective Bass spectrum is the homotopy colimit of that diagram. Its homotopy groups, the K-groups in non-negative degrees and Bass's negative groups below, are computed in K.6/bass-spectrum-homotopy-groups.

**Hypotheses and conventions.**

- E is a functor from rings to spectra; for the main statements E is a functorial model of connective K-theory of rings, here the early ring functor of K.2:plus with the spectrum that K.4:construction and StableHomotopyKTheory H.5:S-delooping assemble.
- The homotopy pushout, the homotopy cofiber, loops and the homotopy colimit are taken in spectra, which StableHomotopyKTheory H.5:spectra supplies; neither pinned library has spectra, as the pinned declarations show.
- The comparison map is multiplication by the class of the variable in the first K-group of the Laurent polynomial ring over the integers, an instance of K.7's pairing; the atlas stage order places K.7 after K.6, and the roadmap's restructuring proposal asks for an early K.7 product stage.

**Construction or proof.**

1. Define the functor LE by the displayed homotopy cofiber and the desuspension as its loop space, and record the natural cofibration sequence.
2. Construct the comparison map as the external product with a map S¹ → K(ℤ[x,x⁻¹]) representing [x] (IV.1.10.2, Ex. IV.4.14), followed by K(R[x,x⁻¹]) → LK(R); record that the Fundamental Theorem identifies it with the inclusion of the (−1)-connective cover (IV.10.2, the topological form V.8.4).
3. Iterate the construction to obtain maps from the (k−1)-fold desuspension to the k-fold one.
4. Define the nonconnective spectrum as the homotopy colimit of the resulting diagram (IV.10.4).
5. Record naturality in the ring and in the model: the construction is natural in E, so two models with a natural equivalence give equivalent nonconnective spectra.
6. Leave the computation of the homotopy groups to K.6/bass-spectrum-homotopy-groups, to which the API items bassSpectrum_pi_nonneg and bassSpectrum_pi_neg are promoted.

**API.**

| Declaration | Contract |
| --- | --- |
| deloop | The functor LE and its desuspension. |
| deloop_cofibration | The natural cofibration sequence. |
| bassSpectrum | The nonconnective Bass K-theory spectrum. |
| bassSpectrum_natural | Naturality in the ring and in the model of connective K-theory. |
| bassSpectrum_independent | Two naturally equivalent models of connective K-theory give equivalent nonconnective spectra. |

**Uses.**

- K.6, localisation: The nonconnective formulation of localisation is a statement about this spectrum and is what makes the boundary maps extend into negative degrees.
- K.7: The invariance and product statements are asserted at the level of this spectrum, not only of the connective one.
- The stage text: The flasque-enlargement route the text names is an alternative construction; it is compared with this one through the axioms of the previous node.

**Checks.**

- **agrees_above_zero** (non-example): In non-negative degrees the homotopy groups are the K-groups of the connective spectrum.
- **degree_minus_one** (computation): In degree minus one the homotopy group is the first negative K-group.
- **regular_case** (computation): For a regular noetherian ring the negative homotopy vanishes.
- **model_independence** (computation): Two models of connective K-theory related by a natural equivalence give equivalent nonconnective spectra.

**Acceptance.**

- In non-negative degrees the nonconnective spectrum has the K-groups of the connective one, which is the agreement the stage text asks for.
- In degree minus k it has Bass's k-th negative group.
- The construction uses no regularity hypothesis, and for a regular noetherian ring it produces a spectrum with vanishing negative homotopy, which is the vanishing theorem and not an input.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/axioms-for-negative-k-theory`, `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.5:S-delooping`.

**Sources:** Kbook.2013, IV.10.1 (Definition 10.1), printed p. 349 (PDF p. 357) — The construction; Kbook.2013, IV.10.2 (Fundamental Theorem 10.2), printed p. 349 (PDF p. 357) — The first desuspension; Kbook.2013, IV.10, before Theorem 10.2, printed p. 349 (PDF p. 357) — The comparison map is a product with the class of x; Kbook.2013, IV.10.3 (Corollary 10.3), printed p. 349 (PDF p. 357) — The iteration (the corollary's last clause carries the misprint recorded as E1); Kbook.2013, IV.10.4 (Definition 10.4), printed p. 350 (PDF p. 358) — The Bass spectrum.

#### The homotopy groups of the Bass spectrum are the K-groups and Bass's negative groups

`GeneralAlgebraicKTheory:K.6/bass-spectrum-homotopy-groups` · theorem

For every unital ring R the canonical map K(R) → K^B(R) induces isomorphisms K_n(R) ≅ π_n K^B(R) for all n ≥ 0, and for every n ≥ 1 there is an isomorphism π_{−n} K^B(R) ≅ K_{−n}(R) = Lⁿ K_0(R) with Bass's negative group; both are natural in unital ring maps. The isomorphism in degree −k is the one Corollary IV.10.3 constructs: the composite of multiplication by x, K_{−k}(R) → K_{1−k}(R[x,x⁻¹]), with K_{1−k}(R[x,x⁻¹]) ≅ π_{1−k}Λ^{k−1}K(R[x,x⁻¹]) → π_{−k}Λ^kK(R), so the contraction splittings of Bass's groups are realised by multiplication by x on spectra. This is the identification of the negative groups of rings with Bass's construction that the stage text asks for; for Schlichting's IK(R) the same groups are obtained by the ring clause of K.6/agreement-and-vanishing-of-negative-K, which proves that comparison.

**Hypotheses and conventions.**

- K^B(R) is the homotopy colimit of the iterated desuspensions of K.6/nonconnective-spectrum, built from a functorial model of connective K-theory of rings (the early ring node of K.2:plus, with the spectrum of K.4:construction and H.5:S-delooping).
- The negative groups are Bass's iterated contractions; the connective model K(R) has π_{−n} K(R) = 0 for n ≥ 1, so the identification has to go through K^B.
- Corollary IV.10.3 is read with the misprint E1 corrected.

**Construction or proof.**

1. The first desuspension: the Fundamental Theorem in every degree (K.6/fundamental-theorem-with-nil-terms) gives π_n LK(R) ≅ K_{n−1}(R) for n > 0, and with the theorems for K_1 and K_0 it gives π_0 ΛK(R) = K_0(R), π_{−1} ΛK(R) = K_{−1}(R) and π_n ΛK(R) = 0 for n < −1; so K(R) → ΛK(R) is the (−1)-connective cover (IV.10.2, the topological form V.8.4).
2. Iterate (Corollary IV.10.3): Λ^{k−1}K(R) → Λ^kK(R) is the (−k)-connective cover, with π_n Λ^kK(R) ≅ K_n(R) for n > −k and π_{−k}Λ^kK(R) ≅ K_{−k}(R) through the composite with multiplication by x, using that every K_{−n} is contracted.
3. Pass to the homotopy colimit (Definition IV.10.4): π_n K^B(R) is the colimit of the π_n Λ^kK(R), which is attained at a finite stage, giving the stated isomorphisms.
4. Naturality in R: Λ and the homotopy colimit are functorial, and every map in the previous steps is natural in R; multiplication by x is natural by K.6/multiplication-by-t-splits-the-boundary.
5. Record that π_{−n} of the connective spectrum is zero for every ring, which is why the vanishing of Bass's groups can never be read off from K(R).

**Acceptance.**

- π_{−1}K^B(R) ≅ K_{−1}(R) = coker(K_0(R[t]) ⊕ K_0(R[t⁻¹]) → K_0(R[t,t⁻¹])).
- For Dayton's n-dimensional tetrahedron Δ_n(F) over a field F, π_{−n}K^B(Δ_n(F)) ≅ ℤ (III.4.3.1), while π_{−n}K(Δ_n(F)) = 0.
- The isomorphisms commute with the maps induced by unital ring homomorphisms.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms`, `GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`.

**Sources:** Kbook.2013, IV.10, the opening paragraph, printed p. 349 (PDF p. 357) — The purpose: the negative homotopy is Bass's groups (the source's own spelling kept); Kbook.2013, IV.10.3, proof, printed p. 350 (PDF p. 358) — The identification in degree −k, through multiplication by x; Kbook.2013, IV.10.4 (Definition 10.4), last sentence, printed p. 350 (PDF p. 358) — The homotopy groups of the Bass spectrum; Kbook.2013, V.8.4 (Theorem 8.4), printed p. 432 (PDF p. 440) — The topological Fundamental Theorem the first step uses.

#### Excision for a Milnor square in degrees at most zero

`GeneralAlgebraicKTheory:K.6/milnor-square-excision-in-nonpositive-degrees` · theorem

Let f : R → S be a homomorphism of unital associative rings and I ⊂ R a two-sided ideal that f maps bijectively onto a two-sided ideal J = f(I) of S, so that R → S, R/I → S/J is a Milnor square: R is the pullback of S and R/I over S/J, and S → S/J is onto. Write 𝕂 = K^B for the Bass spectrum and 𝕂(R, I) for the homotopy fibre of 𝕂(R) → 𝕂(R/I), and similarly 𝕂(S, J). Then the induced map 𝕂(R, I) → 𝕂(S, J) is an isomorphism on π_n for every n ≤ 0. In particular its homotopy fibre, the birelative term, is concentrated in degrees ≥ 0 (its π_n vanishes for n ≤ −1, and its π_0 is the cokernel of the map on π_1), and, applied to ℤ ⋉ I → R, π_n 𝕂(R, I) depends only on the nonunital ring I for n ≤ 0. In degree one this node records only the classical statement: the classical relative groups K_1(R, I) = GL(I)/E(R, I) → K_1(S, J) form a surjection, because both are quotients of GL(I) = GL(J) (Remark III.2.2.1, the exactness at K_1(S) ⊕ K_1(R/I) of K.5/milnor-square-mayer-vietoris). The spectrum form of that surjection — π_1 𝕂(R, I) → π_1 𝕂(S, J) onto, equivalently the birelative term concentrated in degrees ≥ 1 — needs the identification of π_1 of K.5's relative fibre with GL(I)/E(R, I), which is KTheoryLowDegrees U.6's and lies downstream of K.6; it is handed to U.6 by request and is not asserted here. Nothing is claimed in degrees ≥ 2, and the degree-one map is not claimed injective: excision for K_1 already fails (Swan's example, Ex. III.2.3), and the general criteria are K.5/excision-and-its-failure's. This is the non-positive part of Bass's excision theorem (Bass, Algebraic K-theory, Theorem XII.8.3, as Clausen–Mathew–Morrow cite it). The proof of Clausen–Mathew–Morrow's Proposition 4.34 uses only that the birelative term is concentrated in degrees ≥ 0, which this node proves; their parenthesis 'even ≥ 1' is U.6's.

**Hypotheses and conventions.**

- The rings are unital and associative, f is unital, and f restricted to I is a bijection onto the two-sided ideal J = f(I) of S; the pullback property and the surjectivity of S → S/J then hold automatically. These are the Milnor-square hypotheses of Clausen–Mathew–Morrow's Theorem 4.33 and Proposition 4.34; no commutativity is assumed.
- 𝕂 is the Bass nonconnective spectrum; by the ring clause of K.6/agreement-and-vanishing-of-negative-K, Schlichting's IK has the same homotopy groups in degrees ≤ 0, so the statement does not depend on that choice.
- The degree-zero input is the actual early K5 ideal-degree-zero-excision proof: relative projective triples map to fibre components, ideal patching identifies them with augmented-ring kernels, and a split Milnor square proves independence of the ambient ring. Only π1 comparison remains the subsequent U6 obligation.
- Only isomorphisms in degrees ≤ 0 are asserted for 𝕂; the degree-one statement is the classical one, and its spectrum form is U.6's.

**Construction or proof.**

1. Check the Milnor-square facts: R ≅ S ×_{S/J} R/I, and the square is preserved by R ↦ R[t], R[t⁻¹], R[t,t⁻¹], with I[t] and so on, so the pairs form a category of Milnor squares closed under polynomial and Laurent extension.
2. Connective and nonconnective relative theories agree in degrees ≥ 0: K(R) → 𝕂(R) is an isomorphism on π_n for n ≥ 0 (K.6/bass-spectrum-homotopy-groups), so comparing the two long exact sequences of the pair gives π_0 K(R, I) ≅ π_0 𝕂(R, I), and likewise for (S, J).
3. Degree zero: apply K5/ideal-degree-zero-excision, whose three separate nodes construct the fibre-component map, verify its automorphism boundary, identify the augmented-ring kernel and prove excision by the split augmented Milnor square. The commuting unitization triangle gives the stated π0 comparison. Absolute negative Mayer–Vietoris alone is not used as this proof.
4. Negative degrees: the cofibration sequence 𝕂(A) → 𝕂(A[t]) ∪_{𝕂(A)} 𝕂(A[t⁻¹]) → 𝕂(A[t,t⁻¹]) → Σ𝕂(A) of the Bass construction is natural in the ring A (IV.10.1) and its last map is split naturally by multiplication by t (K.6/fundamental-theorem-with-nil-terms, K.6/bass-spectrum-homotopy-groups). Taking homotopy fibres along A = R → R/I gives the same naturally split sequence for the relative spectra, so π_{n−1}𝕂(R, I) is naturally the contraction L of the functor (R, I) ↦ π_n 𝕂(R, I) on Milnor squares, and the map to (S, J) is a morphism of contracted functors.
5. Induct downwards: a morphism of contracted functors that is an isomorphism in degree n induces an isomorphism of their contractions (the argument of Proposition III.4.2), so the degree-zero isomorphism gives isomorphisms in every negative degree.
6. Consequences: the long exact sequence of the fibre of 𝕂(R, I) → 𝕂(S, J) shows that the birelative term has π_n = 0 for n ≤ −1 and π_0 equal to the cokernel of the map on π_1; applying the theorem to ℤ ⋉ I → R shows that π_n 𝕂(R, I), n ≤ 0, depends only on I. Compare K.6/mayer-vietoris-for-negative-k, which states the continuation of the classical Mayer–Vietoris sequence.
7. Degree one, classical: K_1(R, I) → K_1(S, J) is onto because both are quotients of GL(I) = GL(J) (Remark III.2.2.1); this is imported as the exactness at K_1(S) ⊕ K_1(R/I) of K.5/milnor-square-mayer-vietoris. Record that the spectrum form belongs to KTheoryLowDegrees U.6, which proves it from its relative comparison and this classical exactness.
8. Record what is not claimed: injectivity in degree one fails in general (Remark III.2.2.1 and Ex. III.2.3), and excision in degrees ≥ 2 needs the hypotheses of K.5/excision-and-its-failure.

**Acceptance.**

- Applied to ℤ ⋉ I → R, the theorem makes π_n 𝕂(R, I), n ≤ 0, an invariant of the nonunital ring I alone, which is how K_n(I) of a nonunital ring can be read off from any unital ring containing it.
- Swan's square (R the upper triangular 2 × 2 matrices over a field F, I its strictly upper triangular ideal, R_0 = F ⊕ I ⊂ R): the classical degree-one map K_1(R_0, I) ≅ F → K_1(R, I) = 0 is onto but not injective, which is why only surjectivity is recorded in degree one.
- The birelative term in the proof of Clausen–Mathew–Morrow's Proposition 4.34 is concentrated in degrees ≥ 0, which is all that proof uses ('it suffices to show that F is also concentrated in degrees ≥0'); the refinement to degrees ≥ 1 is U.6's.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/bass-spectrum-homotopy-groups`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms`, `GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted`, `GeneralAlgebraicKTheory:K.6/contracted-functors`, `GeneralAlgebraicKTheory:K.6/mayer-vietoris-for-negative-k`, `GeneralAlgebraicKTheory:K.5/excision-and-its-failure`, `GeneralAlgebraicKTheory:K.5/relative-K-theory`, `GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation`, `GeneralAlgebraicKTheory:K.5/milnor-square-mayer-vietoris`, `StableHomotopyKTheory:H.5:spectra`, `GeneralAlgebraicKTheory:K.5/ideal-degree-zero-excision`.

**Sources:** Kbook.2013, IV.10.1 (Definition 10.1), printed p. 349 (PDF p. 357) — The cofibration sequence whose naturality in R lets the contraction pass to relative spectra; Kbook.2013, Exercise IV.10.1, printed p. 351 (PDF p. 359) — The source's route to the same conclusion, through the classical K_0(I); this node replaces that identification, which is U.6's, by K.5's degree-zero excision; Kbook.2013, III.2.2.1 (Remark 2.2.1), printed p. 193 (PDF p. 201) — The classical degree-one surjectivity, and why injectivity is not claimed; CMM.2021, Theorem 4.33, p. 35 — Milnor-square hypotheses for associative rings.; CMM.2021, Proposition 4.34, proof, p. 35 — The proof uses the comparison fibre of nonconnective relative K-theories being concentrated in nonnegative degrees. Bass Theorem XII.8.3 remains an unread input.; CMM.2021, arXiv:1803.10897v2 p35,full proof of Proposition4.34 read — Two fibre comparisons preserve π≥0 because the necessary positive absolute terms are isomorphisms. Henselian relative connective spectra are1-connective from K0-isomorphism and K1-surjectivity; their birelative fibre is0-connective. The nonconnective birelative fibre is0-connective by the proved relative π≤0 excision; its stronger1-connectivity still needs U6..

#### Vanishing of the negative K-groups for a regular noetherian ring

`GeneralAlgebraicKTheory:K.6/vanishing-for-regular-noetherian-rings` · theorem

For a regular noetherian ring the N-groups vanish in every degree, so the Fundamental Theorem degenerates and every negative K-group vanishes. In the intended finite-dimensional applications this is what makes the nonconnective and the connective theories agree. The converse is emphatically not available: the connective model has no homotopy in negative degrees for any ring whatever, and inferring from that absence that a singular ring has vanishing negative K-groups is a mistake the stage text names and this node records as a non-example.

**Hypotheses and conventions.**

- R is regular noetherian, that is every module has a finite projective resolution; the noetherian hypothesis is part of the statement.
- The vanishing of the N-groups for such a ring is the source's statement in the section on the Fundamental Theorem, proved there by resolution.
- The statement is about the Bass groups, equivalently about the negative homotopy of the nonconnective spectrum.

**Construction or proof.**

1. Record the vanishing of the N-groups for a regular noetherian ring, with the resolution argument the source gives.
2. Substitute into the Fundamental Theorem to obtain the two-term decomposition of the K-groups of the Laurent ring.
3. Deduce by induction on the degree that every negative K-group vanishes.
4. State the non-example: the connective model has zero homotopy in negative degrees for every ring, so that absence carries no information, and a proof of vanishing for a singular ring must come from the Bass definition or from the nonconnective spectrum.
5. Record an example where the negative groups do not vanish, so that the statement has content: the source's exercises and the Mayer-Vietoris theorem produce non-zero first negative groups for suitable singular rings.

**Acceptance.**

- For a regular noetherian ring all negative groups vanish and the nonconnective spectrum is connective.
- For a singular ring they need not vanish, and the Mayer-Vietoris sequence is how they are computed.
- The vanishing may not be inferred from the connective model, which is the error the stage text forbids by name.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.6/mayer-vietoris-for-negative-k`.

**Sources:** Kbook.2013, III.4.1, after Definition 4.1, printed p. 210 (PDF p. 218) — The vanishing itself, stated by the source; the packet had not cited it; Kbook.2013, V.8, the opening paragraph, printed p. 430 (PDF p. 438) — The vanishing of the N-terms; Kbook.2013, I.3.7.1 (Definition 3.7.1), printed p. 23 (PDF p. 31) — The definition of regular; the roadmap's 'II.6.5 and I.3.7.1' merged two places.

#### Frobenius categories, Frobenius pairs and their derived categories

`GeneralAlgebraicKTheory:K.6/frobenius-pairs` · definition · planet: **Frobenius pair**

Import FrobeniusExactData, the additive stable quotient and its triangulation from StablePeriodicCurved Layers 0–1, including enough relative projectives and injectives. A Frobenius pair is a fully faithful exact inclusion A₀⊂A₁ of small Frobenius categories carrying projective-injectives into projective-injectives; D(A) is the Verdier quotient of their stable categories. For an exact category E, bounded complexes with degreewise split conflations and the homotopy-acyclic subcategory form its Frobenius pair, whose derived category is Dᵇ(E). The generic complex Frobenius structure is imported from StablePeriodicCurved Layer 3; the homotopy-acyclic pair and its K-theory are the targets here.

**Hypotheses and conventions.**

- The categories are small; the inclusion is fully faithful and exact and preserves projective-injective objects.
- The stable category is triangulated, with the shift given by the cokernel of an inflation into an injective object.
- For the example, the conflations of the complex category are the degreewise split ones, and the subcategory is the complexes homotopy equivalent to acyclic complexes; acyclic has the exact-category meaning, that each differential factors through a conflation.

**Construction or proof.**

1. Import the upstream Frobenius data, stable quotient and triangulation; compare their projective-injective ideal with the pinned exact structure.
2. Define the inclusion of Frobenius models, the Verdier quotient D(A), and functoriality for maps of pairs using the upstream quotient API.
3. Use the generic bounded-complex Frobenius structure, identify the homotopy-acyclic full subcategory, and prove the quotient comparison with Dᵇ(E).

**API.**

| Declaration | Contract |
| --- | --- |
| FrobeniusPair | A fully faithful inclusion of small Frobenius categories preserving projective-injectives. |
| FrobeniusPair.derived | The derived category, the Verdier quotient of the stable categories. |
| FrobeniusPair.map | A map of pairs induces a triangle functor of derived categories. |
| FrobeniusPair.ofExact | The bounded complexes over an exact category, with the homotopy-acyclic ones. |

**Uses.**

- K.6, the flasque envelope: The functors F and S are endofunctors of the category of Frobenius pairs; the whole construction lives there.
- K.6, the IK-spectrum: The K-theory space is that of the Waldhausen category attached to a Frobenius pair, inflations as cofibrations and derived isomorphisms as weak equivalences.
- K.7, derived invariance: The correct hypothesis of derived Morita invariance is a map of Frobenius pairs inducing an equivalence of derived categories.
- StablePeriodicCurved Layers 0–3: Imports its generic carrier and stable/complex triangulations; no second Frobenius category or stable quotient is planned.

**Checks.**

- **split_is_frobenius** (compatibility): The split exact structure is Frobenius; this is Tau Ceti’s pinned instance and the definition here must agree with it.
- **complexes_are_a_pair** (computation): The bounded complexes over an exact category form a Frobenius pair.
- **derived_is_bounded_derived** (computation): Its derived category is the bounded derived category of the exact category.
- **projinj_coincide** (non-example): Dropping the coincidence of projectives and injectives breaks the triangulation; an exact category with enough projectives only is not a Frobenius category.

**Acceptance.**

- Bounded complexes over an exact category form a Frobenius pair with derived category the bounded derived category.
- A map of Frobenius pairs induces a triangle functor of derived categories.
- The stable category of a Frobenius category is triangulated; without the coincidence of projectives and injectives it is not.
- The split exact structure on an additive category is Frobenius, which is Tau Ceti's pinned instance and the degenerate test of the definition.

**Prerequisites:** `tauceti:TauCeti.ExactStructure.IsFrobenius`, `tauceti:TauCeti.ExactStructure.split_isFrobenius`, `mathlib:CategoryTheory.ObjectProperty.IsTriangulated`, `mathlib:CategoryTheory.ObjectProperty.trW`, `tauceti:TauCeti.ExactK0`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `tauceti:TauCetiRoadmap/StablePeriodicCurved#layer-0-additive-ideals-and-frobenius-exact-categories`, `tauceti:TauCetiRoadmap/StablePeriodicCurved#layer-1-the-triangulated-stable-category`, `tauceti:TauCetiRoadmap/StablePeriodicCurved#layer-3-differential-modules-and-periodic-complexes`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-7-dg-and-a-quotients-verdier-comparison-and-k₀-localization`.

**Sources:** Schlichting.NegativeK.2003, §3.3 to 3.5, pp. 8 to 9 — The definitions.; Schlichting.NegativeK.2003, §5.3 and Definition 5.4, p. 11 — The standing example and the definition it feeds..

#### The countable flasque envelope and the suspension of a Frobenius pair

`GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension` · construction · planet: **The countable flasque envelope**

The COUNTABLE ENVELOPE of a small exact category has as objects the sequences of inflations, with morphism groups the limit over the source index of the colimit over the target index; it is exact, has exact countable coproducts, and is FLASQUE: the functor sending a sequence to the countable sum of its shifts satisfies the direct sum of the identity with it being naturally isomorphic to it, which is the Eilenberg swindle in functorial form. Applied to a Frobenius pair this gives an endofunctor F of Frobenius pairs whose derived category has countable coproducts and is c-compactly generated by the original, so that the idempotent completion of the original derived category is the c-compact part of the enlarged one. The SUSPENSION S of a pair is the enlarged Frobenius category together with the objects that vanish in the quotient of the enlarged derived category by the original, so that the derived category of the suspension is exactly that quotient. The natural transformations from the identity through F to S then satisfy the axioms of the model set-up, and this is the flasque enlargement and suspension the stage text asks for.

**Hypotheses and conventions.**

- The exact category and the Frobenius pairs are small; the envelope is taken with the source's morphism formula, not with a naive colimit.
- Flasque is used in Karoubi's sense of the earlier node, a functor T with the identity plus T naturally isomorphic to T, and has nothing to do with the sheaf-theoretic predicate the pinned libraries call by that name.
- c-compact means that the represented functor commutes with countable coproducts; the generation statement is by countable homotopy colimits.

**Construction or proof.**

1. Construct the countable envelope and prove that it is exact with exact countable coproducts.
2. Prove the flasqueness lemma by constructing the shift functor on sequences and the natural isomorphism, which is the swindle.
3. Define F on Frobenius pairs, prove that the enlarged pair is a Frobenius pair and that the derived category embeds fully faithfully in the enlarged one.
4. Prove that the enlarged derived category has countable coproducts and is c-compactly generated by the original, and deduce that the idempotent completion of the original is the c-compact part of the enlargement.
5. Define the suspension as the enlarged category together with the objects vanishing in the quotient, and prove that its derived category is that quotient.
6. Prove that the identity, F and S satisfy the three conditions of the model set-up: the functors preserve exact sequences, the zeroth group of an enlargement vanishes, and the sequence from a pair through its enlargement to its suspension is exact.

**API.**

| Declaration | Contract |
| --- | --- |
| countableEnvelope | The countable envelope of a small exact category. |
| countableEnvelope_isFlasque | The envelope is flasque, with the shift functor as witness. |
| FrobeniusPair.enlarge | The endofunctor F of Frobenius pairs. |
| FrobeniusPair.enlarge_generates | The enlarged derived category is c-compactly generated by the original. |
| FrobeniusPair.suspension | The suspension endofunctor S. |
| FrobeniusPair.setup | The identity, F and S satisfy the three conditions of the model set-up. |

**Uses.**

- K.6, the negative groups of a model: The groups are defined as the zeroth group of an iterated suspension.
- K.6, the IK-spectrum: The structure maps of the spectrum come from the square built out of the enlargement and the suspension.
- K.6, the axioms: The vanishing of the zeroth group on an enlargement is the flasqueness axiom, here proved rather than assumed.

**Checks.**

- **envelope_flasque** (computation): The countable envelope is flasque.
- **IK0_of_enlargement_vanishes** (computation): The zeroth group of an enlarged pair is zero.
- **suspension_derived** (computation): The derived category of the suspension is the quotient of the enlarged derived category by the original.
- **finite_vectors_not_flasque** (non-example): The exact category of finite-dimensional k-vector spaces admits no exact functor T with id⊕T≅T: applying it to k contradicts finite dimension.

**Acceptance.**

- The countable envelope is flasque, so the zeroth group of an enlarged pair vanishes; this is the swindle in the form the construction needs.
- The derived category of the suspension is the quotient of the enlarged derived category by the original.
- The three conditions of the set-up hold for the category of Frobenius pairs, which is what makes the negative groups of the next node well defined.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/frobenius-pairs`, `GeneralAlgebraicKTheory:K.6/flasque-rings-and-the-swindle`, `mathlib:CategoryTheory.Idempotents.Karoubi`.

**Sources:** Schlichting.NegativeK.2003, Lemma 4.2, p. 9 — The flasqueness of the envelope with its proof.; Schlichting.NegativeK.2003, §4.1, Definition 4.3, Proposition 4.4 and Definition 4.7, pp. 9 to 10 — The envelope, the functor F, its properties and the suspension.; Schlichting.NegativeK.2003, Theorem 4.8, p. 10 — The verification that the flasque route satisfies the axioms..

#### Stable classes modulo a dense triangulated subcategory

`GeneralAlgebraicKTheory:K.6/dense-triangulated-stable-classes` · construction

For an essentially small triangulated category T and strictly full dense triangulated A⊂T, define X∼Y when X⊕A₁≅Y⊕A₂ for A₁,A₂∈A. The quotient is an abelian group G_A under ⊕, with Euler relations; X∈A iff its quotient class is zero, and G_A≅K₀(T)/im K₀(A).

**Hypotheses and conventions.**

- Density means each X is a direct summand of an object of A. Both categories have triangulated structures and A is strictly full.

**Construction or proof.**

1. Reflexivity uses zero, symmetry swaps the isomorphism, and transitivity adds the two A-summands. Direct sum respects this relation. A complement X′ with X⊕X′∈A provides an additive inverse in the quotient.
2. If X⊕A₁≅A₂, the split triangle A₁→X⊕A₁→X shows X∈A by two-out-of-three. The converse uses X itself as an A-summand.
3. For a triangle X→Y→Z choose complements X′,Z′ with X⊕X′,Z⊕Z′ in A. Add the two split triangles for those complements. The enlarged middle object Y⊕X′⊕Z′ is in A, proving [Y]=[X]+[Z] in G_A.
4. The universal Euler-relation map K₀(T)→G_A is onto. Every K₀ class is represented by an object, since [ΣX]=−[X]; its kernel consists exactly of classes of A-objects by the zero-class criterion. This proves the claimed quotient isomorphism.

**API.**

| Declaration | Contract |
| --- | --- |
| DenseClasses | Stable direct-sum quotient of T by A. |
| DenseClasses.zero_iff | class(X)=0 iff X∈A. |
| DenseClasses.euler | A distinguished triangle gives class(Y)=class(X)+class(Z). |
| DenseClasses.quotientEquiv | G_A≃K₀(T)/im K₀(A). |

**Uses.**

- K.6/nonconnective-spectrum-and-derived-invariance: Supplies an explicit comparison or factorization used in the spectrum construction, rather than assuming a functorial cylinder.

**Checks.**

- **all_objects** (computation): If A=T the quotient is zero.
- **euler_parity** (computation): For bounded complexes of finite-dimensional k-spaces, A={Euler characteristic even}; G_A≅ℤ/2 and k[0] has nonzero class.
- **stable_zero_not_ordinary_zero** (non-example): A nonzero A-object has zero quotient class, so ordinary object isomorphism classes are the wrong quotient.

**Acceptance.**

- The construction uses stable addition by A-objects, not ordinary isomorphism classes alone.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/frobenius-pairs`, `mathlib:CategoryTheory.ObjectProperty.IsTriangulated`.

**Sources:** Thomason.Classification.1997, Lemma2.2, pp.5–6/PDF5–6 — Read the full proof, and §1.6 for representation of every K₀ class by an object. Symbols damaged in the text layer are reconstructed from the Euler relations..

#### The K-zero criterion for a dense triangulated subcategory

`GeneralAlgebraicKTheory:K.6/dense-triangulated-class-criterion` · lemma

For a strictly full dense triangulated A⊂T, X∈A iff [X] lies in im K₀(A)→K₀(T). Dense subcategories correspond to subgroups of K₀(T), and K₀(A)→K₀(T) is injective.

**Hypotheses and conventions.**

- T is essentially small; A is strictly full, triangulated and dense.

**Construction or proof.**

1. Apply the stable-class quotient and its zero-class criterion to get the membership statement.
2. For a subgroup H⊂K₀(T), the objects with class in H form a strictly full triangulated category A_H. It is dense since X⊕ΣX has class0. Every class is represented by an object, so im K₀(A_H)=H. Membership recovers A from its image.
3. For N=ker(K₀(A)→K₀(T)), the dense subcategories of A corresponding to0 and N remain dense in T. Their images in K₀(T) are both0, so the classification identifies them. Their images in K₀(A) must then agree, giving N=0.

**Acceptance.**

- Even Euler characteristic is a dense but non-thick subcategory; the criterion does not assert closure under every direct summand.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/dense-triangulated-stable-classes`.

**Sources:** Thomason.Classification.1997, Theorem2.1 and Corollary2.3, pp.5–6/PDF5–6 — Read both proofs in full; the injected K₀ subgroup is the actual one used in cofinality..

#### The set-up: negative K-groups of a triangulated category with models

`GeneralAlgebraicKTheory:K.6/schlichting-set-up` · definition

For a small triangulated category the zeroth invariant is the zeroth K-group of its idempotent completion. A SET-UP consists of a category of models with a functor to small triangulated categories, together with endofunctors F and S and natural transformations from the identity through F to S, such that both preserve exact sequences, the zeroth invariant of an enlargement vanishes, and the sequence from a model through its enlargement to its suspension is exact; a sequence of small triangulated categories is EXACT when the composite is zero, the first functor is fully faithful and the induced functor from the Verdier quotient to the third is cofinal. The negative groups of a model are then the zeroth invariant of its iterated suspension. Taking the models to be Frobenius pairs and the functors of the previous node gives the negative K-groups of an exact category, of a ring, of a scheme and of a differential graded algebra.

**Hypotheses and conventions.**

- The categories are small; cofinal means fully faithful with every object a direct summand of one in the image.
- The idempotent completion carries a canonical triangulated structure, which is what makes the zeroth invariant well defined.
- The axiomatic form is deliberate: the source records that it allows models other than Frobenius pairs, which it does not develop.

**Construction or proof.**

1. Define an exact sequence of small triangulated categories, and record the three elementary facts the construction uses: the idempotent completion is triangulated, the zeroth K-group classifies dense triangulated subcategories, and an exact sequence induces an exact sequence of zeroth invariants.
2. State the three conditions of the set-up and define the negative groups as the zeroth invariant of the iterated suspension.
3. Instantiate at Frobenius pairs and record the resulting definitions for an exact category, for a ring through its finitely generated projectives, for a quasi-compact quasi-separated scheme and for a differential graded algebra.
4. Record the source's observation about the zeroth invariant: if the exact category is idempotent complete the zeroth invariant is the usual zeroth K-group, and otherwise it is that of the idempotent completion, which is where the degree-zero correction of this theory sits.
5. Record the two maps of the classical five-term sequence that this construction extends, and that neither is injective or surjective in general, which is the reason the theory exists.

**API.**

| Declaration | Contract |
| --- | --- |
| IsExactSequence | An exact sequence of small triangulated categories, with the cofinality condition. |
| IK0 | The zeroth invariant, the K-group of the idempotent completion. |
| NegativeKSetup | A category of models with F, S and the three conditions. |
| negativeIK | The negative groups of a model. |
| negativeIK_frobenius | The instance at Frobenius pairs. |
| IK0_eq_K0_of_idempotentComplete | For an idempotent complete exact category the zeroth invariant is the usual zeroth K-group. |

**Uses.**

- K.6, the localisation theorem: The long exact sequence is a statement about these groups and uses only the three conditions.
- K.6, agreement: The comparison with Bass’s groups is a statement about this definition.
- K.7: The filtered-colimit statement in non-positive degrees is proved at this level of generality.

**Checks.**

- **idempotent_complete_case** (computation): For an idempotent complete exact category the zeroth invariant is the usual zeroth K-group.
- **frobenius_instance** (computation): Frobenius pairs with the envelope and the suspension satisfy the set-up.
- **quasi_iso_invariance** (computation): A quasi-isomorphism of differential graded algebras induces isomorphisms of all the groups.
- **cofinal_not_equivalence** (non-example): The third functor of an exact sequence is required to be cofinal, not an equivalence; requiring an equivalence would exclude the intended examples.

**Acceptance.**

- For a ring the construction gives groups in every non-positive degree, with the zeroth one the zeroth K-group of the idempotent completion.
- The set-up is satisfied by Frobenius pairs, which is the previous node's theorem, so the definition is non-vacuous.
- A quasi-isomorphism of differential graded algebras induces isomorphisms of all these groups, because it induces an equivalence of derived categories.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `GeneralAlgebraicKTheory:K.6/dense-triangulated-class-criterion`.

**Sources:** Schlichting.NegativeK.2003, Definition 1.1, Facts 1.2, Set-up 1.3 and Definition 1.4, pp. 4 to 5 — The set-up and the definition.; Schlichting.NegativeK.2003, §5.5, p. 11 — The degree-zero identification..

#### Localisation in negative degrees, and the first negative group as an obstruction

`GeneralAlgebraicKTheory:K.6/schlichting-set-up-and-negative-localization` · theorem

An exact sequence of models induces a long exact sequence of the negative groups in every non-positive degree, with a connecting map constructed by lifting an object through the enlargement; a map whose derived functor is cofinal, in particular an equivalence, induces isomorphisms in all those degrees. The first negative group has an exact meaning: it vanishes for a model exactly when, for every exact sequence out of that model, the Verdier quotient of the idempotent completions is again idempotent complete. So the negative groups are the obstruction to the classical five-term sequence continuing, and the first of them is the obstruction to idempotent completeness of quotients. This is the localisation clause of the stage text in the nonconnective formulation.

**Hypotheses and conventions.**

- The sequence is exact in the sense of the previous node, so the third functor is only required to be cofinal.
- The long exact sequence is asserted in degrees at most zero; its continuation to all degrees is the spectrum-level statement of a subsequent node.
- The connecting map is defined on objects by choosing a lift through the enlargement and is proved independent of the lift.

**Construction or proof.**

1. Construct the connecting map: lift an object of the third derived category to the enlargement of the second, observe that its image in the third suspension vanishes, and take the class of its image in the first suspension.
2. Prove independence of the lift, using that the difference of two lifts has cone in the enlargement of the first, whose zeroth invariant vanishes.
3. Prove that the map respects distinguished triangles, so that it is defined on the group, and iterate to every non-positive degree.
4. Prove exactness at the three places, which the source does by a diagram chase using the classification of dense subcategories.
5. Deduce the cofinality corollary by applying the theorem to the sequence with zero first term.
6. Prove the obstruction characterisation of the first negative group in both directions.

**Acceptance.**

- An exact sequence of exact categories whose bounded derived categories form an exact sequence gives a long exact sequence of negative groups.
- A derived equivalence induces isomorphisms in all non-positive degrees, so resolution gives an isomorphism.
- The first negative group vanishes exactly when the relevant Verdier quotients of idempotent completions are idempotent complete.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/schlichting-set-up`, `GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension`.

**Sources:** Schlichting.NegativeK.2003, Lemma 1.6, Theorem 1.7, Corollary 1.8 and Remark 1.9, pp. 5 to 6 — The localisation theorem with its corollary and the obstruction remark.; Schlichting.NegativeK.2003, §5.5, p. 11 — The instance for exact categories and the localisation example..

#### Additivity and filtered colimits for the negative groups

`GeneralAlgebraicKTheory:K.6/additivity-and-colimits-for-negative-K` · theorem

If a natural transformation of maps of models is objectwise an inflation then the quotient is again a map of models and the induced maps in every non-positive degree add: the middle one is the sum of the outer two. For exact categories this gives the usual additivity of a short exact sequence of exact functors. The negative groups also commute with filtered colimits of models, and hence with filtered colimits of exact categories, because the colimit of the enlargements is again flasque and additivity makes its groups vanish. Both statements are proved directly from the axioms of the set-up, and both are needed by the vanishing theorem.

**Hypotheses and conventions.**

- The index category of the colimit is small and filtered.
- The additivity hypothesis is that the transformation is objectwise an inflation, not merely a natural transformation.
- The statements are for degrees at most zero; the source does not treat positive degrees here, and the corresponding positive statement belongs to the connective theory.

**Construction or proof.**

1. Prove additivity in degree zero and propagate it to every degree by applying it to the iterated suspension.
2. Deduce the exact-functor form: a short exact sequence of exact functors gives additivity of the induced maps, using that a map factoring through the subcategory induces zero and that the cone of the canonical map is acyclic.
3. Prove that a filtered colimit of models is a model and that the colimit of the enlargements is flasque, so its groups vanish by additivity.
4. Compare the two long exact sequences, of the colimit of the sequences and of the sequence of the colimits, and conclude by iteration.
5. Record the corollary for exact categories, obtained from the equivalence of the colimit of the complex categories with the complex category of the colimit.

**Acceptance.**

- A short exact sequence of exact functors gives additivity in every non-positive degree.
- The negative groups of a filtered colimit of exact categories are the colimit of the negative groups.
- The proofs use only the axioms of the set-up, so they apply to any model category satisfying them.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/schlichting-set-up-and-negative-localization`.

**Sources:** Schlichting.NegativeK.2003, Theorem 6.1, Corollary 6.2, Lemma 6.3 and Corollary 6.4, pp. 13 to 14 — Additivity and the colimit statements..

#### Existential factorization in a Frobenius pair

`GeneralAlgebraicKTheory:K.6/frobenius-pair-factorization` · lemma

The Waldhausen category of a Frobenius pair has the factorization property of K.4:construction/waldhausen-factorization. This holds in its opposite too and requires no functorial choice of injectives.

**Hypotheses and conventions.**

- Small Frobenius pairs; cofibrations are inflations and weak equivalences are the maps inverted in their Verdier derived category. Maps of pairs preserve the exact structures and projective-injectives.

**Construction or proof.**

1. For f:A→B choose an inflation i:A↣I into a projective-injective. The graph (f,i):A→B⊕I is an inflation: compose i with the split graph inflation I→B⊕I after extending f:A→B when B is injective, or, in general, use the pushout of i along f and the exact-category graph lemma. The latter shows (f,i) is an inflation without requiring B injective.
2. The projection pr_B:B⊕I→B is an isomorphism in the stable category, since I is projective-injective, hence in the Verdier quotient. Its composite with (f,i) is f.
3. For the opposite choose a deflation P↠B from a projective-injective; the dual graph gives the required factorization. The opposite S-construction reverses filtrations and interchanges admissible subobjects and quotients, giving the natural K(Aᵒᵖ)≃K(A) comparison.

**Acceptance.**

- The projection has domain B⊕I; the printed A⊕I in Remark11.2 is corrected in the source issue.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/frobenius-pairs`, `GeneralAlgebraicKTheory:K.4:construction/waldhausen-factorization`.

**Sources:** Schlichting.NegativeK.2003, Remark11.2, p.20/PDF20; AppendixA.5, p.25 — Read text and p.20 image. Factorization is existential, and the early K.4 apparatus is imported rather than recreated..

#### The weak inflation replacement of an exact functor

`GeneralAlgebraicKTheory:K.6/frobenius-replacement-category` · construction

For F:A→B inducing a derived equivalence, form C_F with objects (a,i:F(a)↣b), and componentwise maps commuting with i. Conflations are evaluated at a,b and b/F(a). Its full subcategory C of weak inflations is Frobenius; with C₀=C_{F₀} it is a Frobenius pair. The embedding a↦(a,id) and projection (a,i,b)↦a are inverse K-equivalences.

**Hypotheses and conventions.**

- Small Frobenius pairs; cofibrations are inflations and weak equivalences are the maps inverted in their Verdier derived category. Maps of pairs preserve the exact structures and projective-injectives.

**Construction or proof.**

1. The cokernel functor identifies C_F with admissible short exact sequences whose first object comes from F. The exact-category 3×3 and pullback/pushout lemmas prove the specified pointwise conflations form an exact structure.
2. Enough projectives and injectives in A,B, and preservation by F, provide pointwise resolutions in C_F. Its projective-injectives are exactly the objects with a and b projective-injective.
3. Saturate the pairs first. Cone-zero inflations form an extension-, kernel-of-deflation- and cokernel-of-inflation-closed full subcategory containing those projective-injectives, hence a Frobenius category C. The subcategory C₀ consists of a∈A₀ and b∈B₀ and inherits the same condition.
4. The retraction onto a is literal on a↦(a,id); in the other direction (id,i):(a,id)→(a,i,b) is a natural pointwise weak equivalence. Objectwise natural weak equivalences induce homotopies on the wS construction.

**API.**

| Declaration | Contract |
| --- | --- |
| FrobeniusReplacement | Objects (a,i:F(a)↣b) with i weak. |
| FrobeniusReplacement.exactStructure | Conflations on a,b,coker(i). |
| FrobeniusReplacement.toSource | Projection to a. |
| FrobeniusReplacement.toTarget | Projection to b. |
| FrobeniusReplacement.sourceKEquiv | The source embedding and retraction induce inverse K-equivalences. |

**Uses.**

- K.6/nonconnective-spectrum-and-derived-invariance: Supplies an explicit comparison or factorization used in the spectrum construction, rather than assuming a functorial cylinder.

**Checks.**

- **identity_embedding** (computation): For F=id, a↦(a,id) retracts onto a.
- **zero_to_injective** (compatibility): (0,0↣I) is allowed for projective-injective I and is weakly zero.
- **nonweak_cokernel** (non-example): For F=id on bounded complexes over k, 0↣k[0] has nonzero derived cokernel and is excluded.

**Acceptance.**

- The weak-inflation condition is essential; arbitrary inflations do not give the stated retraction homotopy.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/frobenius-pairs`, `GeneralAlgebraicKTheory:K.6/frobenius-pair-factorization`, `GeneralAlgebraicKTheory:K.3/three-by-three-lemma`, `StableHomotopyKTheory:H.1`, `StableHomotopyKTheory:H.2`.

**Sources:** Schlichting.NegativeK.2003, Proposition11.15 proof, pp.22–23/PDF22–23 — Read full proof; C_F and its weak-inflation subcategory are distinguished, including the quotient conflation condition..

#### Strictify the roof diagram for dual approximation

`GeneralAlgebraicKTheory:K.6/frobenius-roof-strictification` · lemma

If F induces a derived equivalence, the target projection C→B from the weak-inflation replacement satisfies dual App2: for c=(a,F(a)↣b) and b′→b, there are a deflation c₃↠c in C and a weak map b′→pr_B(c₃) commuting over b. It also reflects weak equivalences.

**Hypotheses and conventions.**

- Small Frobenius pairs; cofibrations are inflations and weak equivalences are the maps inverted in their Verdier derived category. Maps of pairs preserve the exact structures and projective-injectives.

**Construction or proof.**

1. Full faithfulness and essential surjectivity in the Verdier quotients give the roof diagram of11.16: F(a)→b, F(a₂)→b₂, F(a₁)→b₁←b′, with horizontal weak maps and the two vertical source maps. The squares commute in the stable category, hence up to maps through projective-injectives. The required Verdier common-roof rule is a named categorical supplier below.
2. Factor F(a₂)→b₂ into an inflation followed by a weak equivalence. If gf and h differ by a map through a projective-injective I and f is an inflation, extend the map into I across f by injectivity. Subtract the resulting correction from g. Apply this to make the upper square strictly commute.
3. Choose F(a₁)↣I and b′↣J with I,J injective. Add I to b₁ to strictify the lower square, then J to strictify the right square while preserving the lower one. Adding projective-injectives does not change weak-equivalence status.
4. Choose a deflation (P,F(P)↣Q)↠(a₂,F(a₂)↣b₂) from a projective-injective C-object. Replace the bottom object by (a₁⊕P,F(a₁⊕P)↣b₁⊕Q). The lower vertical maps become deflations. Pull back them along the upper maps in C to obtain c₃. The universal property produces b′→b₃, and two-out-of-three makes it weak.
5. A map in C is pointwise weak. If its b-component is weak, its a-component becomes weak because the horizontal inflations are weak and F reflects derived isomorphisms. This proves App1.

**Acceptance.**

- The approximation is for the opposite projection and uses deflations; one cannot switch it silently to a statement with inflations.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/frobenius-replacement-category`, `GeneralAlgebraicKTheory:K.6/frobenius-pair-factorization`, `StableHomotopyKTheory:H.1`.

**Sources:** Schlichting.NegativeK.2003, Proposition11.15, diagram11.16 and the pullback proof, p.23/PDF23 — Read entire proof. The construction is Schlichting’s Frobenius translation; the original TT diagram is separately inspected.; TT.HigherK.1990, 1.9.8.3–1.9.8.4, printed pp.272–274/PDF14–15 — Published scan images read. TT treats complicial biWaldhausen categories; its hypotheses are not asserted for arbitrary Frobenius categories..

#### Derived invariance through the replacement and approximation

`GeneralAlgebraicKTheory:K.6/frobenius-derived-invariance` · theorem

A map of Frobenius pairs inducing an equivalence of derived categories induces K(A)≃K(B), and hence IK(A)≃IK(B).

**Hypotheses and conventions.**

- Small Frobenius pairs; cofibrations are inflations and weak equivalences are the maps inverted in their Verdier derived category. Maps of pairs preserve the exact structures and projective-injectives.

**Construction or proof.**

1. The source embedding A→C is a K-equivalence by its explicit retraction and natural weak equivalence.
2. Apply K.4/approximation-with-factorizations to (C→B)ᵒᵖ using the strictification lemma, saturation of the derived-isomorphism weak class and existential factorization of both opposite Frobenius pairs. Convert opposite K-theories back by reversing S-filtrations.
3. Every suspension SⁿF is a derived equivalence by the flasque-envelope/suspension construction. Apply the space comparison in every spectrum level; the natural structure squares identify the resulting level maps.

**Acceptance.**

- The hypothesis is an actual map of Frobenius pairs; an abstract equivalence of naked triangulated categories is not substituted.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/frobenius-roof-strictification`, `GeneralAlgebraicKTheory:K.4/approximation-with-factorizations`, `GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension`.

**Sources:** Schlichting.NegativeK.2003, Proposition11.15, pp.22–23; Theorem4.8, p.10 — The read approximation proof is decomposed in the prerequisites; the levelwise suspension step gives the spectrum comparison..

#### Cofinality of Frobenius models

`GeneralAlgebraicKTheory:K.6/frobenius-model-cofinality` · theorem

If a map of Frobenius pairs induces a cofinal derived functor, K(A)→K(B) is an isomorphism on positive homotopy groups and an injection on π₀.

**Hypotheses and conventions.**

- Small Frobenius pairs; cofibrations are inflations and weak equivalences are the maps inverted in their Verdier derived category. Maps of pairs preserve the exact structures and projective-injectives.

**Construction or proof.**

1. Let B₁ be the full subcategory of B-objects whose derived images are isomorphic to objects in im D(A). It is Frobenius with the inherited projective-injectives; D(A)→D(B₁,B₀) is an equivalence, so derived invariance identifies K(A) with this K-space.
2. Density and the triangulated class criterion say b∈B₁ exactly when its class in K₀(D(B))/im K₀(D(A)) is zero. For the associated Waldhausen category, the canonical presentation by cofibration relations and derived weak maps identifies its K₀ with K₀(D(B)); triangles are represented by Frobenius conflations after adding projective-injectives.
3. Apply early K.3/cofinality-with-factorizations to that actual quotient class map and the Frobenius factorization property. It gives the discrete fibre quotient, the positive-degree isomorphisms and the π₀ injection.

**Acceptance.**

- Cofinality need not give a surjection on π₀; the missing classes are the displayed quotient.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/frobenius-derived-invariance`, `GeneralAlgebraicKTheory:K.6/dense-triangulated-class-criterion`, `GeneralAlgebraicKTheory:K.3/cofinality-with-factorizations`.

**Sources:** Schlichting.NegativeK.2003, Proposition11.17, pp.23–24; Facts1.2, p.4; AppendixA.4, p.25 — Read proof and dense-subcategory input. This spells out the K₀-class criterion used when applying A.4..

#### Fibration for nested Frobenius weak classes

`GeneralAlgebraicKTheory:K.6/frobenius-nested-weak-fibration` · lemma

For full thick stable-triangulated subcategories D₀⊂D₁⊂stable(B), let B_i consist of objects representing them. Then K(B₁,B₀)→K(B,B₀)→K(B,B₁) is a homotopy-fibre sequence.

**Hypotheses and conventions.**

- Small Frobenius pairs; cofibrations are inflations and weak equivalences are the maps inverted in their Verdier derived category. Maps of pairs preserve the exact structures and projective-injectives.
- Each D_i is closed under direct factors and contains the zero object.

**Construction or proof.**

1. Each B_i is closed under extensions, kernels of deflations and cokernels of inflations and contains the projective-injectives of B. It inherits a Frobenius exact structure.
2. The corresponding weak classes v⊂w are the maps inverted in the two Verdier quotients. They are saturated, satisfy extension/gluing, and have the factorization property: the graph construction has projective-injective quotient error, which both weak classes invert.
3. The w-acyclic objects with the v weak class are exactly (B₁,B₀). Apply K.4/fibration-with-factorizations. K(B,B) is contractible since every wS_n object maps weakly to0. This gives the square11.19 and the asserted fibre.

**Acceptance.**

- This is the same underlying category with nested weak classes; here its K₀ map is surjective. General cofinal functors are treated separately.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/frobenius-pair-factorization`, `GeneralAlgebraicKTheory:K.4/fibration-with-factorizations`.

**Sources:** Schlichting.NegativeK.2003, Proposition11.18, p.24/PDF24; AppendixA.3, p.25 — Read proof. The generic theorem belongs to K.4 and is explicitly imported..

#### The completion comparison and the homotopy groups of IK

`GeneralAlgebraicKTheory:K.6/frobenius-completion-spectrum` · lemma

Let Â=(B,FA₀), where B⊂FA consists of objects zero in D(SA). Then D(Â) is the idempotent completion of D(A). The maps K(Â)≃ΩK(SA) make the completed-level spectrum an Ω-spectrum, and IK(A)→ÎK(A) is a stable equivalence. Thus π_iIK(A)=π_iK(A) for i>0, K₀(D(A)῀) for i=0, and K₀(D(S^{−i}A)῀) for i<0.

**Hypotheses and conventions.**

- Small Frobenius pairs; cofibrations are inflations and weak equivalences are the maps inverted in their Verdier derived category. Maps of pairs preserve the exact structures and projective-injectives.

**Construction or proof.**

1. D(A)→D(FA)→D(SA) is exact and D(FA) is idempotent complete. Its zero kernel contains precisely the completion of the dense image of D(A), so D(A)→D(Â) is the idempotent-completion embedding.
2. Model cofinality gives positive π-isomorphisms and a π₀ injection for K(A)→K(Â). Nested-weak fibration applied in FA has the other two corners K(FA) and K(FA,FA) contractible, giving K(Â)≃ΩK(SA). Looping the cofinality map identifies ΩK(SA) with ΩK(ŜA).
3. These maps, for all iterated suspensions, give an Ω-spectrum ÎK. The level map from IK is an isomorphism on positive π, and the positive-degree definition of stable groups then gives a stable equivalence. Read off π₀ from the completed level and negative groups from its iterated suspension levels.

**Acceptance.**

- The uncompleted IK level need not be an Ω-space equivalence at π₀; ΩIK is an Ω-spectrum.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/frobenius-model-cofinality`, `GeneralAlgebraicKTheory:K.6/frobenius-nested-weak-fibration`, `GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension`.

**Sources:** Schlichting.NegativeK.2003, Theorem11.7 proof, pp.21–22/PDF21–22 — Read proof, with comparison inputs11.17 and11.18 decomposed rather than taken as black boxes..

#### Localization of the Frobenius IK spectra in all degrees

`GeneralAlgebraicKTheory:K.6/frobenius-spectrum-localization` · theorem

An exact sequence of Frobenius pairs A→B→C gives a natural homotopy-fibre sequence IK(A)→IK(B)→IK(C), and a long exact sequence in every integer degree.

**Hypotheses and conventions.**

- Small Frobenius pairs; cofibrations are inflations and weak equivalences are the maps inverted in their Verdier derived category. Maps of pairs preserve the exact structures and projective-injectives.
- Exact means D(A)→D(B)→D(C) is exact with the Verdier-quotient functor cofinal.

**Construction or proof.**

1. Replace C by its saturation: the subcategory C₀ becomes all objects zero in D(C). The associated Waldhausen category has the same cofibrations and weak maps, hence the same K-space.
2. Let B₁⊂B consist of objects zero in D(C). It inherits the Frobenius structure and projective-injectives of B. The two maps A→(B₁,B₀) and (B,B₁)→C are derived-cofinal; model cofinality makes their looped K-spaces equivalences.
3. Nested-weak fibration makes the square for these two B-pairs homotopy cartesian. Substitute the looped comparisons to obtain the looped K-space square11.12.
4. Suspension preserves exact sequences of pairs. Repeat this comparison at every Sⁿ level. Since ΩIK is an Ω-spectrum by the completion comparison, these cartesian looped-level squares imply the cartesian spectrum square. The stable homotopy fibre supplies the connecting maps in all integer degrees, naturally in exact-sequence maps.

**Acceptance.**

- No unjustified connective-space equivalence at degree zero is used in the cofinality substitutions.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/frobenius-completion-spectrum`, `GeneralAlgebraicKTheory:K.6/frobenius-nested-weak-fibration`, `GeneralAlgebraicKTheory:K.6/frobenius-model-cofinality`, `StableHomotopyKTheory:H.5:spectra`.

**Sources:** Schlichting.NegativeK.2003, Theorem11.10 proof, p.22/PDF22, and saturation qualification — Read full proof. Saturation is needed to obtain the quotient-to-C map of pairs, and does not change its Waldhausen K-theory..

#### The IK-theory spectrum of a Frobenius pair, and what it computes

`GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance` · theorem · planet: **Schlichting's IK-theory spectrum**

A Frobenius pair is a Waldhausen category with the inflations as cofibrations and the maps inverted in the derived category as weak equivalences, so it has a K-theory space. The enlargement has a contractible K-theory space, functorially, because the flasqueness of the envelope gives a functorial homotopy from the identity to a self-map; the square built from the pair, its enlargement and its suspension then yields a natural map from the K-theory space to the loop space of the suspension's, and the sequence of these spaces is the IK-THEORY SPECTRUM. Its loop spectrum is an omega-spectrum; its homotopy groups are the Quillen K-groups in positive degrees, the zeroth K-group of the idempotent completion of the derived category in degree zero, and the negative groups of the earlier nodes below. An exact sequence of pairs gives a homotopy cartesian square and a long exact sequence in ALL degrees, and a map inducing an equivalence of derived categories induces a homotopy equivalence of K-theory spaces. This is the nonconnective spectrum of the stage text, built by flasque enlargement and suspension.

**Hypotheses and conventions.**

- The Waldhausen structure is the one named: inflations as cofibrations, derived isomorphisms as weak equivalences.
- The construction needs a factorisation of every map into a cofibration followed by a weak equivalence, which the source supplies without functoriality; the appendix replaces Waldhausen's cylinder functor by that weaker hypothesis.
- The degree-zero value is the group of the idempotent completion, which differs from the K-group of the category itself when that is not idempotent complete.

**Construction or proof.**

1. Attach the Waldhausen category to a Frobenius pair and define its K-theory space as the loop space of the realisation of the weak-equivalence S-construction.
2. Prove that the K-theory space of an enlargement is contractible, functorially: the flasqueness isomorphism gives a functorial homotopy between a self-map and the sum of it with the identity, and an H-space inverse then contracts.
3. Build the commutative square from the pair, its enlargement, its suspension and the pair regarded as a pair with itself, whose two corners are contractible, and take the resulting map to the loop space.
4. Define the spectrum as the sequence of K-theory spaces of the iterated suspensions with these structure maps.
5. Use frobenius-completion-spectrum for the completed Ω-spectrum and its stable comparison, including the positive/zero/negative degree distinctions.
6. Apply frobenius-spectrum-localization, whose proof uses saturation, nested-weak fibration, cofinality and exactness of all suspensions.
7. Import frobenius-derived-invariance and frobenius-model-cofinality. Their proofs use the weak-inflation replacement and dual approximation, with the generic nonfunctorial apparatus owned once in early K.4.
8. The negative test is the explicit odd-prime stable Artin pair above; mere reliance on weak equivalences in the construction is no longer offered as a proof of non-invariance.

**Acceptance.**

- The homotopy groups are the Quillen K-groups above degree zero, so the spectrum extends the connective theory rather than replacing it.
- In negative degrees they are the groups defined from the set-up, so the two constructions of the layer agree.
- For an exact category the resulting groups agree with Bass's and Thomason's, which is the next node.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension`, `GeneralAlgebraicKTheory:K.6/schlichting-set-up-and-negative-localization`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.6/frobenius-derived-invariance`, `GeneralAlgebraicKTheory:K.6/frobenius-completion-spectrum`, `GeneralAlgebraicKTheory:K.6/frobenius-spectrum-localization`.

**Sources:** Schlichting.NegativeK.2003, Definitions 11.1 and 11.4, Lemma 11.3, pp. 20 to 21 — The construction of the spectrum.; Schlichting.NegativeK.2003, Theorem 11.7, p. 21 — The computation of the homotopy groups.; Schlichting.NegativeK.2003, Theorem 11.10 and §11.13, pp. 21–22 — Localisation at the spectrum level and the instance for exact categories.; Schlichting.NegativeK.2003, Proposition 11.15, p. 22 — The derived-invariance statement, with the bracketed words supplying from the surrounding text what the scan drops..

#### Karoubi’s direct filtration in the discrete additive case

`GeneralAlgebraicKTheory:K.6/karoubi-direct-filtration` · construction

An A-filtration of an additive category C gives each X a directed family of split decompositions X=A_i⊕X_i with A_i∈A. Every map A→X factors through some A_i and every map X→A factors through some projection X→A_i; filtrations are compatible with⊕. The maps factoring through A form a two-sided additive ideal. Define C/A with the same objects and morphisms modulo that ideal.

**Hypotheses and conventions.**

- A is a strictly full additive subcategory and is closed under the indicated finite summands. Hom groups use the discrete0/1 quasi-norm, so the source’s approximate factorizations are exact.

**Construction or proof.**

1. State F1 directed compatibility of inclusions and projections, F2/F3 the two factorization conditions, and F4 the sum condition. The two descriptions of finite-support maps agree by F2/F3.
2. Composition on either side preserves factorization through A. Directedness combines two factorizations into one A-object, so sums and negatives remain in the ideal. Thus the quotient composition is well-defined.
3. The identity ofX lies in that ideal iff X belongs toA (with its stipulated summand closure). Quotient zero-objects are exactly the old subcategory, not arbitrary zero classes in K0.

**API.**

| Declaration | Contract |
| --- | --- |
| KaroubiFiltration | Actual split directed decompositions and the F1–F4 conditions. |
| KaroubiFiltration.finiteIdeal | Morphisms factoring through an A-object. |
| KaroubiFiltration.quotient | Same objects and quotient Hom groups. |
| KaroubiFiltration.zeroObjects | An object becomes zero exactly when it belongs toA. |

**Uses.**

- The negative comparison and triangulated-invariance tests of K.6/K.7: Provides an actual cone, quotient or test model with all hypotheses, instead of assuming the desired comparison.

**Checks.**

- **finite_vectors** (computation): Truncations of a countable sequence of finite projectives give the finite-support ideal.
- **identity_of_old** (computation): If X∈A, id_X factors through X and vanishes in the quotient.
- **one_sided_insufficient** (non-example): Maps out of finite objects alone do not prove the factorization ideal is compatible with maps into them.

**Acceptance.**

- Retain both source and target factorization conditions. For a normed category they require approximation and closure; this node claims the discrete case only.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/frobenius-pairs`, `mathlib:CategoryTheory.Idempotents.Karoubi`.

**Sources:** Karoubi.Derived.1970, §1 Definition1.5,Propositions1.7–1.9,Lemma1.11,PDF9–21 — Definitions and ideal proof read..

#### The finite-defect index and the cone boundary

`GeneralAlgebraicKTheory:K.6/karoubi-index-and-cone-boundary` · lemma

For A⊂C a direct filtration, the relative index group K₀(C→C/A) is K₀(A^♮). The exact sequence K₁^cl(C)→K₁^cl(C/A)→K₀(A^♮)→K₀(C^♮)→K₀((C/A)^♮) is natural. If C is flasque, its two middle absolute groups vanish, so the index boundary K₁^cl(C/A)→K₀(A^♮) is an isomorphism.

**Hypotheses and conventions.**

- The classical additive-functor relative K0 triples and their five-term sequence are required from early K.3; this is independent of U.6’s relative ring K1 comparison.

**Construction or proof.**

1. Represent an index class by a graded stable triple(X,Y,α). Outside sufficiently large finite A-summands, α has degree0 in the quotient. In the discrete case choose the source’s approximation exactly on that complementary part, using the two factorization conditions.
2. Use the source’s graded normal form E=H⊕H and a finite graded cutoff E_i. With F_i the image of the degree-one part of the lifted isomorphism, write α′ as the block matrix (α′_i,0;λ,α′′_i), with complementary block of degree0. Define Ind by the finite graded triple d̄(E_i,F_i,α′_i), exactly as in the source p38. Translate it to ordinary K0 via Theorem2.9. It is not an arbitrary difference of the degree-zero summands: retain the graded triple and its isomorphism.
3. For nested cutoffs E_j=E_i⊕E_ij and F_j=F_i⊕F_ij, the added triple is quasi-trivial after the shear (1,0;μ,1), which is elementary of degree0. This proves independence. The composition relation and the source’s two inverse maps prove the finite-defect index isomorphism (pp38–40).
4. The inverse sends a difference of old objects to its zero quotient-isomorphism triple. Splitting off the degree0 complement shows both composites are identity. Apply the early classical five-term sequence.
5. For a swindle T with id⊕T≅T, direct-sum additivity kills both K0 and automorphism K1: [X]+[TX]=[TX], and[X,α]+[TX,Tα]=[TX,Tα].

**Acceptance.**

- The natural index is the bridge invoked in1971,p73; it is a filtered-category statement, not a literal isomorphism between suspension and polynomial rings.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/karoubi-direct-filtration`, `GeneralAlgebraicKTheory:K.3/additive-functor-five-term`, `GeneralAlgebraicKTheory:K.6/flasque-rings-and-the-swindle`.

**Sources:** Karoubi.Derived.1970, §2 Theorem2.13 proof,Proposition2.16,PDF36–40;§3 swindle and boundary,PDF50–51 — Read finite-cutoff independence and both inverse maps; source matrix displays must be consulted during implementation..

#### Karoubi’s derived groups from a flasque cone

`GeneralAlgebraicKTheory:K.6/karoubi-flasque-derived-groups` · construction

For a small additive category A, the source’s cone CA has objects countable sequences drawn from finitely many A-object types and controlled matrix morphisms (finite sums of permutant matrices in the discrete case). Finite sequences identifyA as a filtered subcategory. Put SA=CA/A and Kar_{−n}(A)=K₀((SⁿA)^♮), n≥0. These derived groups have the natural localization boundary for direct filtrations.

**Hypotheses and conventions.**

- Use the controlled source cone, not an unexamined category of all infinite matrices. Idempotent completion is part of K0 in every degree.

**Construction or proof.**

1. Truncations give the A-filtration. Controlled matrix morphisms to or from a finite sequence factor through a finite truncation, verifying F2/F3; directedness and sum compatibility are explicit.
2. Repeat each sequence countably and flatten ℕ×ℕ by a bijection. Matrix entries repeat blockwise; controlled morphisms remain controlled. Adding one column is a permutation, giving a natural id⊕T≅T and flasqueness.
3. Iterate the quotient construction. The cone preserves direct-filtered exact sequences (source3.12), and the quotient three-by-three lemma gives exact suspension sequences (3.13–3.14). The finite-defect index provides the initial K1/K0 exact germ.
4. Define the connecting map using the intermediate category CA/A′ for A′⊂A. Its map from A/A′ to this intermediate quotient and the inverse suspension identification give the boundary. The source’s two three-by-three diagrams prove exactness (3.23).
5. Uniqueness: a comparison in degree0 extends recursively through the suspension boundary. The same intermediate quotient diagram makes it commute with every localization boundary (3.21), so the result is natural and independent of the selected admissible flasque resolution.

**API.**

| Declaration | Contract |
| --- | --- |
| KaroubiCone | Finite-type countable sequences and the controlled matrix Hom groups. |
| KaroubiCone.swindle | The repeated-sequence functor and natural id⊕T≅T. |
| KaroubiSuspension | The direct-filtered quotient CA/A. |
| KaroubiNegative | K0 of the idempotent completion of each iterated suspension. |
| KaroubiNegative.boundary | Natural direct-filtration localization boundaries. |

**Uses.**

- The negative comparison and triangulated-invariance tests of K.6/K.7: Provides an actual cone, quotient or test model with all hypotheses, instead of assuming the desired comparison.

**Checks.**

- **finite_sequence** (computation): An old finite sequence becomes zero in the suspension.
- **countable_reindexing** (computation): Adding the initial column to ℕ×ℕ is absorbed by a bijection.
- **uncontrolled_maps** (non-example): Arbitrary column-finite matrices without the source’s row/control condition are not silently admitted as morphisms.

**Acceptance.**

- The source uses cohomological indexn≥0 for these algebraically negative groups. A topological Banach-category periodicity theorem is not imported.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/karoubi-direct-filtration`, `GeneralAlgebraicKTheory:K.6/karoubi-index-and-cone-boundary`.

**Sources:** Karoubi.Derived.1970, §1 example3/Thm1.6,PDF11–13;§3 Thm3.2/3.10,Def3.11,Props3.12–14,Thms3.21/3.23,PDF41–57 — The cone, exactness and derived-group uniqueness proofs are read; their source diagrams are retained as implementation locators..

#### Compare Karoubi’s negative groups with Bass contractions

`GeneralAlgebraicKTheory:K.6/karoubi-bass-contraction-comparison` · comparison

For any unital associative ring R and n≥0, Kar_{−n}(R)≅LⁿK₀(R)=K^Bass_(−n)(R), naturally in ring maps and the polynomial/Laurent maps. In1971 the source denotes Kar_{−n} by K^n. The discrete0/1 norm turns its summable series into finite polynomials.

**Hypotheses and conventions.**

- The Karoubi theory is the derived cone theory in the preceding node, with idempotent completion. Only the nonpositive algebraic range is asserted.

**Construction or proof.**

1. The finite-defect index and flasque cone identify K₁^cl(SR),K₁^cl(SR⟨t⟩),K₁^cl(SR⟨t⁻¹⟩),K₁^cl(SR⟨t,t⁻¹⟩) with the corresponding degree0 groups ofR and its polynomial/Laurent rings. These are the filtered-category comparisons printed before Theorem3.2, and are compatible with both polynomial inclusions.
2. Apply the K1 Laurent decomposition of§II (2.1–2.7) to the suspension ring and transport its exact maps and splitting through that index diagram. Repeating at successive flasque suspensions gives the natural sequence0→Kar_(−n)(R)→Kar_(−n)(R[t])⊕Kar_(−n)(R[t⁻¹])→Kar_(−n)(R[t,t⁻¹])→Kar_(−n−1)(R)→0 of Theorem3.2.
3. Its cokernel says L Kar_(−n)=Kar_(−n−1). Since Kar₀ is the ordinary projective K0, induction identifies each group with LⁿK0, which defines the Bass groups. This is a group and map comparison; it does not identify the suspension rings with polynomial extensions.
4. Equivalently, once the four nonunital ring axioms have been checked for a proposed cone model, bass-cone-uniqueness supplies the canonical boundary-compatible comparison. This alternative is recorded as a criterion, not as an unchecked assertion of those axioms for IK.

**Acceptance.**

- Check the polynomial inclusion square in the filtered index comparison, not just the group orders. No current claim is made about positive topological Karoubi groups.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/karoubi-index-and-cone-boundary`, `GeneralAlgebraicKTheory:K.6/karoubi-flasque-derived-groups`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted`.

**Sources:** Karoubi.Bott.1971, §II2.1–2.7,66–72;§III before Thm3.2 and Thm3.2,73–74 — Full K1 Laurent proof and the degree≥0 cohomological contraction theorem read, including the imported filtered-category construction now decomposed above..

#### Finite domination of a chain complex

`GeneralAlgebraicKTheory:K.6/finite-chain-domination` · definition

For A fully embedded in an additive U, a bounded complex V in U is A-dominated if a finite complex D in A admits chain maps f:V→D,g:D→V and h:gf≃id_V. The homotopy idempotent fg is not assumed to be an actual degreewise idempotent.

**Hypotheses and conventions.**

- Use the existing HomologicalComplex and Homotopy carriers; arbitrary finite degree support is shifted into nonnegative degrees for the source formulas.

**Construction or proof.**

1. Store the finite support, the two chain maps and the specified homotopy.
2. An actual finite A-complex is dominated by itself. Domination is preserved by chain homotopy equivalence, direct sums and shifts.
3. gf≃id implies (fg)²≃fg, but generally not (fg)²=fg. The next construction supplies an actual finite idempotent model.

**API.**

| Declaration | Contract |
| --- | --- |
| FiniteChainDomination | A finite A-complex D, chain maps f,g and homotopy gf≃id. |
| FiniteChainDomination.transport | Transport along a chain homotopy equivalence. |
| FiniteChainDomination.fg | fg is idempotent up to the induced homotopy. |
| FiniteChainDomination.sum | Direct sums of the given finite dominations. |

**Uses.**

- Schlichting7.1 additive and arbitrary-ring agreement: Identifies the bounded-complex quotient model with the additive suspension and its boundary.

**Checks.**

- **self_domination** (degenerate): A finite A-complex has f=g=id,h=0.
- **contractible_domination** (computation): A contractible complex is dominated by the zero complex.
- **homotopy_not_idempotent** (non-example): A supplied homotopy (fg)²≃fg does not justify an idempotent-completion object (D,fg).

**Acceptance.**

- Track the actual quotient functor and chain homotopies; idempotent completion and the selected K0 subgroup remain explicit.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/karoubi-direct-filtration`.

**Sources:** Ranicki.Finiteness.1985, §3 Proposition3.1 and relative Proposition3.2,pp118–123/PDF14–19 — The indicated proof was read, including matrix formulas where needed. This node separates an input of the additive-cone/Frobenius comparison..

#### Lift a quotient complex through a Karoubi filtration

`GeneralAlgebraicKTheory:K.6/karoubi-quotient-complex-lifting` · lemma

Every bounded complex over U/A is isomorphic in the quotient to the image of a bounded complex over U. A bounded U-complex becomes contractible over U/A exactly when it is A-dominated.

**Hypotheses and conventions.**

- U is A-filtered by the directed split filtration. Quotient morphisms are only classes modulo maps through A, so arbitrary differential lifts need not square to zero.

**Construction or proof.**

1. Lift the differential maps. Start at the bottom with d1. The defect d1d2 factors through A; choose a split old summand in the domain large enough to contain that factorization, and restrict d2 to its complementary summand. This kills the defect exactly. Continue upwards finitely. Removing old summands does not change quotient objects, yielding the quotient-complex isomorphism (Carlsson–Pedersen751–752).
2. For a quotient contraction, lift its homotopy maps r_i. At the top, id−r_(n−1)d_n factors through A. Choose a split old summand A_n containing that factorization. Descend, enlarging A_(i−1) so d_i(A_i) lies in it and the next contraction defect factors through it.
3. These A_i form a finite A-complex. Inclusion g:A•→V and f=id−rd−dr:V→A• give gf≃id_V. Conversely an A-domination becomes domination by zero in the quotient, hence contractibility.
4. The same finite cutoff argument makes a quotient chain map strict after removing old source summands. This supplies the strict map needed for the cylinder comparison; no claim is made that an arbitrary representative was already a chain map.

**Acceptance.**

- Track the actual quotient functor and chain homotopies; idempotent completion and the selected K0 subgroup remain explicit.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/karoubi-direct-filtration`, `GeneralAlgebraicKTheory:K.6/finite-chain-domination`.

**Sources:** CarlssonPedersen.Controlled.1995, Proposition4.7 and proof of Theorem4.1,pp751–752/PDF21–22;CP7.2–7.5 — The indicated proof was read, including matrix formulas where needed. This node separates an input of the additive-cone/Frobenius comparison..

#### Turn finite domination into a finite idempotent complex

`GeneralAlgebraicKTheory:K.6/finite-domination-idempotent-model` · construction

Every A-dominated complex in U is chain homotopy equivalent in U^♮ to a finite complex in A^♮. There is an explicit idempotent p on F=⊕D_i, with [V]=[F,p]−[D_odd] in K0(A^♮). Its image class in K0(U^♮) is the Euler class of V.

**Hypotheses and conventions.**

- D is supported in0,…,n after a shift; the homotopy convention is gf−id=dh+hd. The idempotent uses f,g,h and d_D, not the uncorrected fg.

**Construction or proof.**

1. The input convention is gf−id=dh+hd. Set H=−h, giving id−gf=dH+Hd, before using Ranicki’s matrices. Construct C′_i=⊕_(j≤i)D_j with alternating block differentials p and 1−p. In the even-degree matrix p, the diagonal on D_j is fg for even j and 1−fg for odd j; the adjacent block D_(j+1)→D_j is (−1)^(j+1)d_D; the block D_j→D_k for j<k is (−1)^(j+1)fH^(k−j)g. Entries farther above the diagonal vanish. Use the displayed matrices in Proposition3.1, pp118–119, with the displayed degree signs. The chain-map and homotopy identities give the two consecutive composites zero.
2. With the same H convention, the inclusion with final component f and the row (H^ig,H^(i−1)g,…,g) give inverse chain equivalences V⇄C′. The identity blocks in the second homotopy are as in the proof on p120; transport the homotopies consistently when returning to the input h convention.
3. For i≥n every C′_i=F and d′ alternates p,1−p, so(d′)²=0 gives p²=p. Truncate at n with top idempotent p for even n and1−p for odd n. The maps identity in lower degrees and this top idempotent are inverse chain equivalences to the finite idempotent complex E.
4. Euler summation gives [E]=[F,p]−[D_odd]. This is valid also for A⊂U: every matrix entry of p has source/target in A because f,g compose through D, and A is full.

**API.**

| Declaration | Contract |
| --- | --- |
| FiniteDomination.idempotent | The actual finite block idempotent p on ⊕D_i. |
| FiniteDomination.finiteModel | The truncated complex E in A^♮ with the parity-dependent top idempotent. |
| FiniteDomination.modelEquivalence | Chain homotopy equivalence V≃E in U^♮. |
| FiniteDomination.euler | [V]=[F,p]−[D_odd], including its image in U^♮. |

**Uses.**

- Schlichting7.1 additive and arbitrary-ring agreement: Identifies the bounded-complex quotient model with the additive suspension and its boundary.

**Checks.**

- **domination_degree_zero** (computation): If f,g split strictly and D has only degree0, p=fg is the usual projector.
- **domination_identity** (computation): For identity domination the Euler class is the usual alternating sum of D_i.
- **parity_matters** (non-example): For odd top degree use1−p; replacing it by p changes the Euler formula.
- **homotopy_sign_changes_matrix** (non-example): A non-strict domination with gf−id=dh+hd uses H=−h in the displayed projector. Substituting h without this change reverses the odd homotopy blocks and need not give p²=p.

**Acceptance.**

- Track the actual quotient functor and chain homotopies; idempotent completion and the selected K0 subgroup remain explicit.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/finite-chain-domination`.

**Sources:** Ranicki.Finiteness.1985, Proposition3.1 full proof,pp118–122/PDF14–18;Proposition3.2,123/PDF19 — The indicated proof was read, including matrix formulas where needed. This node separates an input of the additive-cone/Frobenius comparison..

#### Return finite idempotent complexes when their Euler class lifts

`GeneralAlgebraicKTheory:K.6/restricted-completion-complex-return` · lemma

A finite complex E in A^♮ is homotopy equivalent to a finite A-complex exactly when its Euler class belongs to im(K0(A)→K0(A^♮)). More generally an A-dominated V in U has a finite A^K-model, where K is the preimage of imK0(U) under K0(A^♮)→K0(U^♮).

**Hypotheses and conventions.**

- A^K denotes the full subcategory of A^♮ on object classes in K. U^K is obtained by adjoining these objects to U. The map is to K0(U^♮), not an unstated identification K0(U)=K0(U^♮).

**Construction or proof.**

1. From the top degree down, add the elementary contractible complex (A_i,1−p_i) in degrees i,i−1. Replace (A_i,p_i)⊕(A_i,1−p_i) by A_i; all idempotents above degree0 become identities (Ranicki115–116).
2. Only (A0,p0) remains. If its reduced Euler class is zero, choose old objects B,C with (A0,p0)⊕B≅C. Adding the elementary contractible B-complex removes this final projector too.
3. For the relative version, finite-domination-idempotent-model gives its sole obstruction class. Its image equals the Euler class of V in U, so it lies in K. The same reduction places the finite model in A^K.
4. Apply this also to U⊂U^K: every bounded U^K-complex whose Euler class lifts to U can return to U. This is the restricted-completion comparison used in CP7.6–7.7.

**Acceptance.**

- Track the actual quotient functor and chain homotopies; idempotent completion and the selected K0 subgroup remain explicit.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/finite-domination-idempotent-model`.

**Sources:** Ranicki.Finiteness.1985, Proposition2.1 pp115–116/PDF11–12;relative Proposition3.2 pp122–123/PDF18–19;CP§5 and7.4 — The indicated proof was read, including matrix formulas where needed. This node separates an input of the additive-cone/Frobenius comparison..

#### Identify the quotient and acyclic complex models

`GeneralAlgebraicKTheory:K.6/karoubi-complex-approximation` · lemma

Let C(U) have degreewise split-monic cofibrations and chain-homotopy weak equivalences; let w be the maps becoming homotopy equivalences in C(U/A). Then K(C(U),w)≃K(C(U/A)), and K(C(U)^w)≃K(C(A^K)). The same strictification gives the Verdier quotient equivalence after the indicated restricted completion.

**Hypotheses and conventions.**

- Bounded complex models, their standard mapping cylinders and the explicit quotient functor are used. K is the preimage subgroup of restricted-completion-complex-return.

**Construction or proof.**

1. The mapping cylinder of f has degree p terms U_p⊕U_(p−1)⊕V_p and differential (d,−1,0;0,−d,0;0,f,d). Its projection to V is weak, with the source’s specified contraction. Saturation and extension follow from mapping-cone identities (CP§4).
2. App1 for C(U,w)→C(U/A) is its definition. Quotient-complex lifting and strictification followed by the mapping cylinder give App2. Apply early K4 approximation.
3. The acyclic objects are precisely the A-dominated complexes. In U^K each is homotopy equivalent to an A^K-complex by the finite-domination model and Euler class return. For f:A•→B• and a homotopy equivalence i:B•→A′• with inverse r, take T(if). The map f′=(f,hf,r):T(if)→B• satisfies f′j1=f and is weak; the chain-map equality uses dh+hd=ri−id (CP7.7,p22–23). This verifies the second App2.
4. The two restricted-completion fibre diagrams have the same middle and quotient K-theories, hence equivalent fibres (CP7.6). The finite roof and strictification argument also identifies the homotopy-category Verdier quotient with the quotient complex category, as invoked in Schlichting7.1; for an idempotent-complete A the restricted fibre is A itself.

**Acceptance.**

- Track the actual quotient functor and chain homotopies; idempotent completion and the selected K0 subgroup remain explicit.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/karoubi-quotient-complex-lifting`, `GeneralAlgebraicKTheory:K.6/restricted-completion-complex-return`, `GeneralAlgebraicKTheory:K.4/approximation-theorem`, `GeneralAlgebraicKTheory:K.4/fibration-theorem`, `GeneralAlgebraicKTheory:K.3/cofinality-degree-zero-correction`.

**Sources:** CardenasPedersen.Filtration.1997, §4,§5,§6,full§7.1–7.9,preprintpp9–24;matrix and fibre diagrams inspected;Schlichting7.1 — The indicated proof was read, including matrix formulas where needed. This node separates an input of the additive-cone/Frobenius comparison..

#### Compare the additive cone with the Frobenius negative model

`GeneralAlgebraicKTheory:K.6/additive-cone-frobenius-comparison` · comparison

For a small idempotent-complete additive A, A→CA→SA gives the exact sequence of bounded-complex Frobenius models required for IK localization. Hence IK_(−n)(A)≅K0((SⁿA)^♮), naturally with the cone boundary. For projectives over an arbitrary associative ring, the Karoubi–Bass comparison identifies this with Bass K_(−n)(R).

**Hypotheses and conventions.**

- Each additive category has its split exact structure. Cone CA is the controlled flasque cone above; SA=CA/A. At subsequent stages use the source’s idempotent-completion convention.

**Construction or proof.**

1. Apply karoubi-complex-approximation to the cone filtration. The bounded complexes with split conflations form Frobenius categories with contractible projective-injectives. Their derived categories are the bounded homotopy categories, and the quotient comparison gives an exact sequence of these models.
2. The countable repeat functor on CA extends degreewise to bounded complexes, with id⊕T≅T. Negative additivity gives IK_i(CA)=0 for i≤0.
3. The exact sequence and IK localization give the natural boundary isomorphism IK_i(SA)≅IK_(i−1)(A) for i≤0. Iterating reaches IK0(SⁿA)=K0((SⁿA)^♮). Naturality uses the same quotient and connecting map, not independent group isomorphisms.
4. For A=P(R), the classical finite-projective carrier is idempotent complete. Compose with karoubi-bass-contraction-comparison, preserving polynomial maps and boundaries. No equality of suspension and polynomial rings is used.

**Acceptance.**

- Track the actual quotient functor and chain homotopies; idempotent completion and the selected K0 subgroup remain explicit.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/karoubi-complex-approximation`, `GeneralAlgebraicKTheory:K.6/karoubi-flasque-derived-groups`, `GeneralAlgebraicKTheory:K.6/frobenius-spectrum-localization`, `GeneralAlgebraicKTheory:K.6/additivity-and-colimits-for-negative-K`, `GeneralAlgebraicKTheory:K.6/karoubi-bass-contraction-comparison`.

**Sources:** Schlichting.NegativeK.2003, Theorem7.1 additive/ring proof pp14–15;CP7.1–7.9;Karoubi1970§3 — The indicated proof was read, including matrix formulas where needed. This node separates an input of the additive-cone/Frobenius comparison..

#### Agreement with Bass, Karoubi and Pedersen–Weibel, and the vanishing theorems

`GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K` · theorem

The groups the Frobenius-pair route constructs are the classical ones for rings and additive categories: for a ring R, not necessarily commutative, IK_i(R) is naturally isomorphic to Bass's and Pedersen's K_i(R) for every i ≤ 0, and for an additive category A, IK_i(A) is naturally isomorphic to Karoubi's and Pedersen and Weibel's K_i(A) for every i ≤ 0. The first negative group of an exact category has a presentation: it is the monoid of isomorphism classes of idempotents of the unbounded derived category under direct sum, modulo those that split, so it vanishes exactly when that category is idempotent complete. It vanishes for every small abelian category, and every negative group vanishes for a small noetherian abelian category; the vanishing for a regular ring follows, because the inclusion of the finitely generated projectives into the finitely generated modules is then a derived equivalence and the latter category is abelian. The2003 source states the all-negative vanishing for arbitrary small abelian categories as Conjecture9.7. This is a historical source statement, not a claim that it remains open today; subsequent work of Neeman gives counterexamples (Neeman, arXiv:2006.16536v2, introduction pp1–2: an abelian heart with nonzero K−2). The scheme clauses of the source — agreement with Thomason's K^B_i(X) for a quasi-compact quasi-separated scheme, which the source proves from Thomason's projective line theorem and Thomason–Trobaugh 6.6(b), and the vanishing of negative G-theory of a noetherian scheme — are not part of this node: they need Perf(X), K(X) and G(X), which SchemeKTheoryOperations S.1 and S.2 define after this layer, and they are handed to S.5 and S.2 by request.

**Hypotheses and conventions.**

- The ring is arbitrary, not necessarily commutative; the additive category is small.
- Noetherian abelian means every object is noetherian; the proof runs through the categories of objects with an endomorphism and the nilpotent ones.
- The vanishing for a regular ring is deduced, not assumed, and is the theorem of Bass that the stage text names.

**Construction or proof.**

1. Apply additive-cone-frobenius-comparison: the quotient-complex lifting, finite-domination idempotent model, restricted Euler-class completion and two approximation maps are separately decomposed. The flasque cone then supplies the boundary identification in each nonpositive degree.
2. For arbitrary associative rings, compose that boundary-compatible additive model comparison with karoubi-bass-contraction-comparison. The comparison uses the CP/Ranicki proofs.
3. Prove the presentation of the first negative group: identify it with the zeroth group of the unbounded derived category by the Eilenberg swindle on bounded-above and bounded-below complexes, then apply the classification of dense subcategories.
4. Prove the vanishing of the first negative group of a small abelian category, and then the vanishing of all of them for a noetherian abelian category by descending induction, using the sequence of the nilpotent endomorphism category, the polynomial category and the Laurent category together with additivity.
5. Deduce the vanishing for a regular ring.
6. Record Conjecture9.7 as the historical2003 statement; do not present general abelian-category vanishing as a current theorem or current open problem. The noetherian theorem and degree−1 theorem retain their separate scopes.
7. Record the handoff: agreement with Thomason's groups of a quasi-compact quasi-separated scheme, and the vanishing of negative G-theory of a noetherian scheme (an instance of the noetherian abelian theorem for Coh(X)), are SchemeKTheoryOperations S.5's and S.2's, which import this node; no node of this roadmap depends on them.

**Acceptance.**

- For a regular ring the negative K-groups vanish, which reproves Bass's theorem from this construction.
- The first negative group of an exact category vanishes exactly when its unbounded derived category is idempotent complete.
- Do not assert all-negative vanishing for arbitrary small abelian categories: the 2003 conjecture is historical and Neeman supplies counterexamples. The degree−1 and noetherian theorems remain valid.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`, `GeneralAlgebraicKTheory:K.6/additivity-and-colimits-for-negative-K`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/vanishing-for-regular-noetherian-rings`, `GeneralAlgebraicKTheory:K.6/karoubi-bass-contraction-comparison`, `GeneralAlgebraicKTheory:K.6/additive-cone-frobenius-comparison`.

**Sources:** Schlichting.NegativeK.2003, Theorem 7.1, the ring and additive-category clauses, pp. 14 to 15 — The ring and additive-category clauses; the scheme clause between them (Thomason's groups of a quasi-compact quasi-separated scheme) is SchemeKTheoryOperations S.5's and is elided here.; Schlichting.NegativeK.2003, Proof of Theorem 7.1, the ring case, p. 15 — The ring case is deduced from the additive-category case and Karoubi's comparison.; Schlichting.NegativeK.2003, Remark 7.2, p. 15 — The alternative route through the noncommutative projective line.; Schlichting.NegativeK.2003, Lemma 8.1 and Corollary 8.2, p. 15 — The presentation of the first negative group.; Schlichting.NegativeK.2003, §9, Examples 9.5 and 9.6, Conjecture 9.7 and Remark 9.8, pp. 16 to 17 — The vanishing theorems, the regular case and the conjecture..

#### The cone proof of uniqueness for negative ring theories

`GeneralAlgebraicKTheory:K.6/bass-cone-uniqueness` · lemma

Every theory satisfying axioms-for-negative-k-theory is canonically naturally isomorphic to Bass’s. For the cone ring C(R) and suspension S(R)=C(R)/M∞R, its boundary identifies E_n(S(R)) with E_(n−1)(R), n≤0. Starting with the degree0 identification determines every negative comparison and its boundary compatibility.

**Hypotheses and conventions.**

- Nonunital rings and the actual M∞ corner inclusions belong to the axioms. Flasqueness applies to C(R).

**Construction or proof.**

1. The ideal sequence M∞R→C(R)→S(R), matrix stability and the vanishing of the flasque middle term give the boundary isomorphism. Define h_(n−1)(R)=∂′ h_n(SR) ∂⁻¹.
2. For an ideal I⊂R, use the common quotient C(R)/M∞I and the map M∞(R/I)→C(R)/M∞I. Naturality of both theories’ boundaries identifies the original I-boundary with the composite through S(I). The comparison therefore commutes with that boundary, by the exact diagram in III.4.5.
3. This constructs the comparison recursively and proves its uniqueness from the four stated axioms, including stability under the actual nonunital corner maps. Verifying that stability for a candidate is a separate obligation: the K.7 nonunital adapter supplies it for Bass spectra. The uniqueness proof assumes the axiom and does not depend on that subsequent verification theorem.

**Acceptance.**

- The proof neither asserts S(R[t])=S(R)[t] nor uses a scheme comparison.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/axioms-for-negative-k-theory`.

**Sources:** Kbook.2013, Definitions III.4.4–4.4.2 and Theorem III.4.5 with its boundary diagram, printed pp.213–214 / combined PDF pp.221–222 — Full uniqueness proof and its boundary diagram read. .

#### Affine perfect complexes with principal support

`GeneralAlgebraicKTheory:K.6/affine-perfect-support-theory` · construction

For a commutative ring A and t∈A, Perf_(t)(A) is the full enhanced subcategory of perfect A-complexes P for which P⊗^L_A A[1/t] is acyclic. Its nonconnective K-theory is naturally fib(Knc(A)→Knc(A[1/t])). Use bounded finite-projective complexes and idempotent completion as the affine model; its K-theory agrees with the Bass–Schlichting ring spectrum.

**Hypotheses and conventions.**

- The localization sequence is exact up to idempotent completion. The image on K0 need not exhaust K0(A[1/t]).
- Global scheme support theory remains SchemeKTheoryOperations S.3. Generic enhanced perfect categories and quotients come from DGAInfinity.

**Construction or proof.**

1. Import the enhanced Perf carrier and the derived localization kernel. The compact-localization argument gives the quotient after idempotent completion.
2. Use the Frobenius-pair localization theorem of K.6 with the bounded-complex model, keeping the degree-zero completion correction.
3. Identify the ambient perfect-complex spectrum with ring Knc through the K.4 and K.6 comparisons.

**API.**

| Declaration | Contract |
| --- | --- |
| KTheory.affinePrincipalSupport | Full enhanced subcategory killed by localization at t. |
| KTheory.affinePrincipalSupport_iff | P has support in V(t) exactly when P[1/t] is acyclic. |
| KTheory.affinePrincipalSupport_baseChange | Derived scalar extension sends t-supported perfect complexes to the corresponding support category. |
| KTheory.affinePrincipalSupport_fibre | Identify its Knc with the fibre of the principal-open localization map, naturally in A and t. |

**Uses.**

- GeneralAlgebraicKTheory:K.6/noetherian-completion-gluing: Identifies both vertical fibres with the correct support theory.
- SchemeKTheoryOperations:S.3: Exports the affine comparison while global supports remain the scheme owner.

**Checks.**

- **zero** (degenerate): t=0 gives the whole perfect category and fibre Knc(A).
- **unit** (degenerate): t=1 gives the zero support category and contractible fibre.
- **field_polynomial** (computation): For A=k[x] and t=x, devissage identifies the support K-theory with K(k), whereas relative K(A→A/(x)) is contractible by homotopy invariance.

**Acceptance.**

- For t=0, Perf_(t)(A)=Perf(A); for t=1 it is the zero category.

**Prerequisites:** `tauceti:TauCetiRoadmap/DGAInfinity#layer-5-derived-modules-twisted-complexes-and-perfect-envelopes`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-7-dg-and-a-quotients-verdier-comparison-and-k₀-localization`, `GeneralAlgebraicKTheory:K.4/gillet-waldhausen`, `GeneralAlgebraicKTheory:K.6/frobenius-spectrum-localization`, `GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K`.

**Sources:** BM.Arc, Example 6.1, p.47 — The fibres used by formal gluing are the support fibres.; TT.HigherK.1990, Proto-localization 5.1–5.2, printed pp.337–339; nonconnective Localization 7.4, printed p.365 — Affine principal-open localization gives this support sequence; global scheme constructions are imported by their owner..

#### Noetherian completion gluing

`GeneralAlgebraicKTheory:K.6/noetherian-completion-gluing` · theorem

For a commutative noetherian ring A, an element t∈A and the ordinary t-adic completion Â=lim_n A/(t^n), the square Knc(A)→Knc(Â), Knc(A[1/t])→Knc(Â[1/t]) is homotopy cartesian. The two vertical fibres are Knc(Perf_(t)(A)) and Knc(Perf_(t)(Â)); derived completion induces an equivalence of these support categories.

**Hypotheses and conventions.**

- A is noetherian. No assertion for arbitrary nonnoetherian completion is included.
- The vertical maps invert t. Horizontal maps complete. Support theory is not the fibre of A→A/t.

**Construction or proof.**

1. Noetherian completion is flat and preserves A/(t^n). Perfect complexes killed by localization are built from the Koszul support generator and its retracts; the Koszul complex A→t A generates the perfect support category. Completion identifies the homology of its derived endomorphism complex, since these finitely generated modules are killed by a power of t.
2. Flatness identifies the completed derived endomorphism complex. Equivalence on this generator and closure under finite cones, shifts and retracts identifies the two support categories under derived tensor with Â.
3. Compare the principal-support localization sequences to identify the vertical fibres; their equivalence proves the square cartesian.

**Acceptance.**

- For t=0 and A=k, horizontal maps are identities with zero fibres; vertical fibres are K(k).
- For a unit t, Â=0 and the vertical maps are identities, so both support fibres vanish.
- For nilpotent t, Â=A and A[1/t]=0, so the square remains cartesian.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/affine-perfect-support-theory`.

**Sources:** BM.Arc, Example 6.1, p.47 — Adopts exactly the noetherian principal-completion theorem and corrects the stated fibre direction.; TT.HigherK.1990, Localization 7.4, printed p.365; Bhatt–Mathew Example 6.1, p.47 for completion — The proof passes through support categories, not quotient-relative K-theory..

#### The exact-versus-split fibre

`GeneralAlgebraicKTheory:K.6/exact-versus-split-fibre` · theorem

For a small idempotent-complete exact category E, let E⊕ carry its split exact structure and let fpEff(E) be the abelian category of finitely presented effaceable additive functors Eᵒᵖ→Ab. There is a natural fibre sequence IK(fpEff(E))→IK(E⊕)→IK(E). For a general small E first take the idempotent completion. No all-negative equivalence between E⊕ and E is inferred from a vanishing conjecture for arbitrary abelian categories.

**Hypotheses and conventions.**

- Effaceable means every map from a representable is killed by precomposition with a deflation. Use the enhanced/Frobenius models, not only triangle equivalences.

**Construction or proof.**

1. A finitely presented effaceable functor has a projective resolution 0→A→B→C→F→0 coming from a conflation in E. This proves that fpEff(E) is abelian and extension closed.
2. Let Ê consist of extensions of objects of fpEff(E) by representables. It is extension closed in Mod(E). The displayed finite resolutions and Keller’s fully exact resolution criterion identify Dᵇ(E⊕) with Dᵇ(Ê).
3. For fpEff(E)⊂Ê, verify the dual criterion by lifting the representable subobject across a deflation; the resulting cokernel remains effaceable. Thus Dᵇ(fpEff(E)) embeds fully faithfully with image the acyclic E complexes. Lemma 11.7 passes the bounded/unbounded cofinality step used by Theorem 12.1.
4. Apply the Frobenius-pair localization theorem to these enhanced comparisons. The source’s conditional consequence assuming general abelian vanishing remains conditional; Neeman’s counterexamples prevent treating that assumption as a theorem.

**Acceptance.**

- If E is already split exact, effaceable functors vanish and the comparison is an equivalence.
- The theorem does not assert negative vanishing for every small abelian category.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/frobenius-spectrum-localization`, `GeneralAlgebraicKTheory:K.6/frobenius-derived-invariance`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-5-derived-modules-twisted-complexes-and-perfect-envelopes`.

**Sources:** Schlichting.NegativeK.2003, Theorem 10.1 and Lemma 10.3 with proof, pp.18–19; §11, p.19 — The fibre identifies the difference between exact and split structures.; Keller.Derived1996, Lemma 11.7 and Theorem 12.1, printed pp.15–16/PDF pp.16–17 — The fully exact subcategory criteria invoked in the proof, and their dual..

### K.7 — Products, continuity and enhanced invariance

Construct one coherent biexact pairing, import it in all product consumers, and prove Morita/corner naturality and continuity. Invariance requires a map of enhanced models; the triangulated counterexample has a separate finite-Artin numerical proof obligation.

#### The bisimplicial S-grid of a biexact functor

`GeneralAlgebraicKTheory:K.7/biexact-S-grid` · construction

Component: `GeneralAlgebraicKTheory:K.7:products`.

For filtrations A∈S_mA and B∈S_nB, the grid ((i,j),(k,l))↦F(A_{ij},B_{kl}) gives an object of S_mS_nC, naturally in both simplex variables. Weak maps in each argument give the two weak-map nerve directions of wwS_mS_nC.

**Hypotheses and conventions.**

- Small Waldhausen categories and a biexact functor F; F is zero when either argument is zero, exact in each argument, and its pushout-product map is a cofibration.

**Construction or proof.**

1. Exactness in each variable gives zero diagonals, quotient identifications and the single-direction pushout squares. The joint latching inclusion is exactly F(A′,B)∪_{F(A,B)}F(A,B′)↣F(A′,B′); the pushout-product hypothesis makes this a cofibration.
2. For a cofibration of S_m objects, the induced map is objectwise a cofibration and the relative latching maps are again pushout products. Thus F(A,−) is exact as a functor into S_mC, including the Waldhausen structure, and the same holds after interchanging variables.
3. Restriction along Δ maps gives the two face/degeneracy compatibilities. Naturality of F makes the weak-map squares commute. If either filtration is the zero one, the output grid is zero, which makes the realized map factor through the smash quotient.

**API.**

| Declaration | Contract |
| --- | --- |
| BiexactSGrid | F:S_mA×S_nB→S_mS_nC with the joint latching condition. |
| BiexactSGrid.simplex_natural | Compatibility with both simplicial directions. |
| BiexactSGrid.zero_left | A zero input gives a zero grid. |
| BiexactSGrid.pushoutProduct | The grid latching map is the displayed pushout product. |

**Uses.**

- K.6/multiplication-by-t-splits-the-boundary and K.7/products-from-biexact-functors: Constructs the early pairing actually used by the Bass/Fundamental-Theorem route.

**Checks.**

- **zero_flag** (computation): If one input flag is zero all F(A_ij,B_kl) are zero.
- **vector_tensor_grid** (computation): For finite-dimensional k-spaces, a grid of flags has quotient (A_j/A_i)⊗(B_l/B_k); dimensions multiply.
- **sum_functor_excluded** (non-example): F(A,B)=A⊕B on vector spaces is not a pairing input: F(A,0)=A rather than0.

**Acceptance.**

- Separate exactness alone is not silently substituted for the joint latching condition.

**Prerequisites:** `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`, `GeneralAlgebraicKTheory:K.4:construction/S-construction`.

**Sources:** Waldhausen.KSpaces, §1.5 pairing paragraph, printed p.342/PDF25, full text and image read — The source indicates the bisimplicial map, smash quotient and two-fold delooping. The grid verification and explicit coherence transport below are the explicit elaboration of this construction, not a claim that the paragraph proves a modern E∞ recognition theorem..

#### Stabilize the S-grid to a K-spectrum pairing

`GeneralAlgebraicKTheory:K.7/biexact-stabilized-pairing` · lemma

Component: `GeneralAlgebraicKTheory:K.7:products`.

The S-grid yields a natural pairing K(A)∧K(B)→K(C), inducing K_i(A)⊗K_j(B)→K_{i+j}(C), with degree-zero formula [a]·[b]=[F(a,b)].

**Hypotheses and conventions.**

- Small Waldhausen categories and a biexact functor F; F is zero when either argument is zero, exact in each argument, and its pushout-product map is a cofibration.

**Construction or proof.**

1. Realize the grid in both directions. Remove the second weak-map direction with K.4:construction/weak-double-nerve-swallow and use the iterated-S delooping comparisons. At the first two delooped levels this is the source’s |wSA|∧|wSB|→|wwS²C| map.
2. Repeat the same construction on S^rA and S^sB to obtain compatible level pairings into S^{r+s}C. The structure-map squares are natural in the grid; H.5’s spectrum-pairing assembly turns them into the displayed smash pairing.
3. An object gives the basic S₁ loop. The grid of two such loops gives the loop for F(a,b), so the induced map on K₀ has the stated formula. Compose representing spheres in degrees i,j with the pairing to obtain the higher products.

**Acceptance.**

- Spectrum assembly is a precise H.5 supplier; this node owns the K-theoretic grid and its structure-map compatibility.

**Prerequisites:** `GeneralAlgebraicKTheory:K.7/biexact-S-grid`, `GeneralAlgebraicKTheory:K.4:construction/weak-double-nerve-swallow`, `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`, `StableHomotopyKTheory:H.5:S-delooping`, `StableHomotopyKTheory:H.5:spectra`.

**Sources:** Waldhausen.KSpaces, §1.5 pairing paragraph, printed p.342/PDF25, full text and image read — The source indicates the bisimplicial map, smash quotient and two-fold delooping. The grid verification and explicit coherence transport below are the explicit elaboration of this construction, not a claim that the paragraph proves a modern E∞ recognition theorem..

#### Transport biexact natural isomorphisms to pairing homotopies

`GeneralAlgebraicKTheory:K.7/biexact-pairing-coherence` · lemma

Component: `GeneralAlgebraicKTheory:K.7:products`.

Natural exact-functor isomorphisms between iterated biexact composites give homotopies between the induced K-pairings. Associator, unit and symmetry diagrams yield the corresponding coherent pairing diagrams. For symmetric tensor product the sphere twist gives (−1)^{ij} on K_i⊗K_j.

**Hypotheses and conventions.**

- Small Waldhausen categories and a biexact functor F; F is zero when either argument is zero, exact in each argument, and its pushout-product map is a cofibration.

**Construction or proof.**

1. Apply each natural isomorphism to every grid entry. It gives a natural transformation of the weak-map categories, hence a nerve homotopy, naturally in all simplex variables. Iterate for triple and higher grids.
2. The pentagon, triangle and symmetry identities for the underlying functors identify the boundary diagrams of the grid homotopies. H.5’s multilinear assembly transports these compatible homotopies to spectra. The tensor unit is identified by the actual natural isomorphisms F(1,−)≅id and F(−,1)≅id.
3. Swapping the two grid directions realizes the permutation of the two representing sphere factors. Import its degree (−1)^{ij} from H.5, and compose it with the symmetry isomorphism. This proves graded commutativity on groups.
4. A bare additive equivalence supplies no unit or monoidal coherence: tensoring by a nontrivial line bundle sends [R] to[L]. Thus Morita product comparisons require the explicitly compatible input and target pairing data. A modern E∞ refinement additionally requires the full coherent multilinear recognition supplier, not merely a binary homotopy.

**Acceptance.**

- Finite coherence diagrams and the full E∞ refinement are distinguished; no absent recognition theorem is treated as already formalized.

**Prerequisites:** `GeneralAlgebraicKTheory:K.7/biexact-stabilized-pairing`, `StableHomotopyKTheory:H.1`, `StableHomotopyKTheory:H.5:spectra`.

**Sources:** Waldhausen.KSpaces, §1.5 pairing paragraph, printed p.342/PDF25, full text and image read — The source indicates the bisimplicial map, smash quotient and two-fold delooping. The grid verification and explicit coherence transport below are the explicit elaboration of this construction, not a claim that the paragraph proves a modern E∞ recognition theorem..

#### External products from biexact functors: the K-theoretic pairing and its coherence

`GeneralAlgebraicKTheory:K.7/products-from-biexact-functors` · construction · planet: **External products in K-theory**

Component: `GeneralAlgebraicKTheory:K.7:products`.

A biexact functor induces a pairing of K-theory. For exact categories A, B, C and a functor F : A × B → C exact in each variable with F(A, 0) = F(0, B) = 0, transport through the Q–S comparison of the iterated-S-grid pairing gives a pairing K(A) ∧ K(B) → K(C) and bilinear products K_i(A) ⊗ K_j(B) → K_{i+j}(C), which in degree zero send [A] ⊗ [B] to [F(A, B)]. For Waldhausen categories the same holds for a biexact functor satisfying Waldhausen's condition that F(A′, B) ∪_{F(A,B)} F(A, B′) → F(A′, B′) is a cofibration for all cofibrations A ↣ A′ and B ↣ B′: the induced map wS.A × wS.B → wwS.S.C gives a pairing K(A) ∧ K(B) → K(C) of spectra, natural in exact functors and natural transformations of each variable. If F is associative, unital or symmetric up to coherent natural isomorphism, the pairing is associative, unital or symmetric up to homotopies transported from those isomorphisms; the homotopies are data. For algebras A and B over a commutative ring k, ⊗_k : P(A) × P(B) → P(A ⊗_k B) gives the external product K(A) ∧ K(B) → K(A ⊗_k B), and for a commutative ring R the internal product that makes K(R) a commutative ring spectrum and K_*(R) a graded ring with unit [R]. This node is the only owner of the K-theoretic pairing K(A) ∧ K(B) → K(C) and its coherence: the smash product of spectra, its own coherence and the sign of the twist on spheres are imported from StableHomotopyKTheory H.5:spectra, the connective K-theory spectrum from K.4:construction and H.5:S-delooping, and the assembly of that spectrum requires no product.

**Hypotheses and conventions.**

- A, B and C are small exact or Waldhausen categories and the functor is biexact, with Waldhausen's cofibration condition in the Waldhausen case.
- For the ring case the tensor product is over a fixed commutative base k and the modules are finitely generated projective over the respective k-algebras; the external product needs no commutativity of the algebras.
- The unit is the class of the base ring as a module over itself, and the symmetry is the swap of the two factors; the coherence homotopies are transported from the coherence isomorphisms of the tensor product, not asserted.

**Construction or proof.**

1. State biexactness for exact and for Waldhausen categories and the induced bilinear map on the zeroth groups (II.7.4, II.9.5.1), with the formula [A]·[B] = [F(A, B)].
2. Use biexact-S-grid and biexact-stabilized-pairing: verify the joint latching cofibration, construct the bisimplicial map, remove the doubled weak-map nerve by the swallowing lemma, and assemble the compatible iterated-S level maps through H.5.
3. Prove naturality in exact functors and natural transformations of each variable; this is what makes the pairing compatible with maps of fibration sequences, as K.6/multiplication-by-t-splits-the-boundary uses.
4. Use biexact-pairing-coherence to transport natural associator/unit/symmetry isomorphisms and their diagrams. The full coherent multilinear/E∞ recognition step is a stated H.5 supplier requirement, not attributed to Waldhausen’s one-page indication.
5. Specialise to rings: the external product K(A) ∧ K(B) → K(A ⊗_k B) and, for a commutative ring, the internal product with unit [R]; record Tau Ceti's pinned degree-zero product statement for the split model as the baseline instance and say exactly what it does and does not give.
6. Record the other applications of the same machine, in particular the pairing that makes the Nil groups a module over the zeroth K-group (II.7.4.4), and that SchemeKTheoryOperations S.6 extends this pairing to schemes and imports it.

**API.**

| Declaration | Contract |
| --- | --- |
| KTheory.biexactPairing | The pairing induced by a biexact functor. |
| KTheory.biexactPairing_natural | The pairing is natural in exact functors and natural transformations of each variable, and so maps fibration sequences in one variable to fibration sequences. |
| KTheory.biexactPairing_K0 | In degree zero the pairing sends [A] ⊗ [B] to [F(A, B)]. |
| KTheory.externalProduct | The external product of the K-groups of two algebras. |
| KTheory.mul | The internal product for a commutative ring. |
| KTheory.mul_assoc | The associativity homotopy. |
| KTheory.mul_one | The unit homotopy, with unit the class of the ring. |
| KTheory.mul_comm_graded | The symmetry homotopy, giving graded commutativity. |

**Uses.**

- K.6, the Fundamental Theorem and the Bass spectrum: Multiplication by [t] ∈ K_1(ℤ[t,t⁻¹]) is the external product of this node; it splits the boundary of the Fundamental Theorem (K.6/multiplication-by-t-splits-the-boundary) and defines the maps of the Bass delooping (K.6/nonconnective-spectrum).
- K.7, graded commutativity: The symmetry homotopy is what produces the sign in the commutativity of the total K-group.
- K.7, compatibilities: The product is asserted compatible with relative groups, boundaries and transfers.
- SchemeKTheoryOperations S.6: The scheme-level external product is the same construction for a different input.

**Checks.**

- **K0_is_a_ring** (computation): The zeroth K-group of a commutative ring is a commutative ring.
- **unit_is_the_class_of_R** (computation): The unit of the product is the class of the ring as a module over itself.
- **tensor_of_classes** (compatibility): The product of the classes of two modules is the class of their tensor product; this is the pinned Tau Ceti statement.
- **homotopies_are_data** (non-example): The associativity and symmetry are given by transported coherence isomorphisms, not asserted.

**Acceptance.**

- The zeroth K-group of a commutative ring is a commutative ring with unit the class of the ring itself.
- The pinned Tau Ceti statement that the class of a tensor product is the product of the classes is the degree-zero instance and is cited, not reproved.
- The pairing is bilinear, so it is determined by its values on classes of modules, which is what makes it computable.

**Prerequisites:** `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`, `GeneralAlgebraicKTheory:K.4:construction/iS-versus-Q`, `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.5:S-delooping`, `tauceti:TauCeti.SplitK0.of_mul_of`, `tauceti:TauCeti.SplitK0`, `mathlib:TensorProduct`, `GeneralAlgebraicKTheory:K.7/biexact-stabilized-pairing`, `GeneralAlgebraicKTheory:K.7/biexact-pairing-coherence`.

**Sources:** Kbook.2013, II.7, 'Products', and Lemma 7.4, printed p. 132 (PDF p. 140) — The definition and the pairing on K0; Kbook.2013, II.9.5.2 (Definition 9.5.2), printed p. 165 (PDF p. 173) — The Waldhausen version (the pairing of spectra is IV.8.11, not here); Kbook.2013, II.7.4.1 (Application 7.4.1), printed p. 132 (PDF p. 140) — The tensor product; Kbook.2013, IV.6.6 (Definition 6.6), printed p. 322 (PDF p. 330) — Higher products for exact categories; Kbook.2013, IV.8.11 (Products), printed p. 342 (PDF p. 350) — The pairing of spectra.

#### Morita invariance

`GeneralAlgebraicKTheory:K.7/morita-invariance` · theorem · planet: **Morita invariance**

Two rings are Morita equivalent when their module categories are equivalent; the structure theorem says that this happens exactly when there is a finitely generated projective generator of one whose endomorphism ring is the other, and that the equivalence is then given by tensoring against a bimodule. Since K-theory is defined from the category of finitely generated projective modules, and an equivalence of module categories restricts to an equivalence of those subcategories, Morita equivalent rings have isomorphic K-groups in every degree, connective and negative alike. The standard instance is the matrix ring: the ring and its ring of n by n matrices for n ≥ 1 are Morita equivalent, so their K-theories agree. The comparison is additive and natural for the chosen equivalence. Compatibility with an external product requires a commuting diagram of the relevant biexact functors. An internal unital ring comparison additionally requires compatible unit-preserving monoidal data; an arbitrary Morita equivalence does not supply those data.

**Hypotheses and conventions.**

- R and S are rings, not necessarily commutative; the module categories are of right modules, as the source has them.
- The equivalence is an additive equivalence of abelian categories; Morita theory says that every such equivalence is of the tensor form.
- Both pinned instances, the matrix equivalence of module categories and the Morita predicate with its matrix instance, exist in Mathlib and are cited, so the node is a comparison for them rather than a construction.
- The matrix case requires n ≥ 1 (equivalently a nonempty finite index type). A Morita equivalence is not assumed monoidal. Right modules are represented by ModuleCat Rᵐᵒᵖ at the pin and compared with the early left-module ring model through K.2’s opposite-ring comparison.

**Construction or proof.**

1. Record the pinned material: the equivalence between modules over a ring and modules over its matrix ring, the Morita equivalence predicate and its matrix instance.
2. State the structure theorem in the source's form: an equivalence is given by tensoring against a bimodule, the bimodule is a finitely generated projective generator, and the other ring is its endomorphism ring.
3. Deduce that the equivalence restricts to an exact equivalence of the categories of finitely generated projective modules, so it induces isomorphisms on all K-groups by the functoriality of K under exact functors (K.1) applied to the early ring model P(R) of K.2:plus, which this node imports rather than re-defining.
4. Negative degrees: the bimodule giving the equivalence also gives equivalences over R[t], R[t⁻¹] and R[t,t⁻¹], compatibly with the maps between them, so the isomorphism passes to the cokernels that define Bass's groups (K.6/negative-k-groups).
5. Record the instance for matrix rings and the source's exercise that the matrix ring over a ring is Morita equivalent to it.
6. Given equivalences on the two inputs and the target together with a natural isomorphism between the two composite biexact functors, apply naturality of K.7/products-from-biexact-functors to obtain the external-product comparison. Only in a compatible unit-preserving monoidal setting does this become an internal unital ring isomorphism.
7. Record the source's remark that the Morita equivalence classes are not the isomorphism classes, so the statement has content.

**API.**

| Declaration | Contract |
| --- | --- |
| KTheory.moritaEquiv | The induced isomorphism of K-groups from a Morita equivalence. |
| KTheory.moritaEquiv_matrix | The instance for the matrix ring. |
| KTheory.moritaEquiv_mul | Given Morita equivalences of both input categories and the target, and a compatible natural isomorphism of their external-product biexact functors, the induced K-group isomorphisms commute with that external product. |
| moritaStructure | The structure theorem: the equivalence is tensoring against a projective generator. |
| KTheory.moritaEquiv_negative | The isomorphism holds in negative degrees as well. |

**Uses.**

- K.6: One of the four axioms for negative K-theory is matrix invariance, which this node supplies in the finite case.
- K.7, the products: The compatibility statement is what lets a computation be transported along a Morita equivalence.
- The libraries: Mathlib has the predicate and the matrix instance; what is missing is the K-theoretic consequence.

**Checks.**

- **matrix_invariance** (compatibility): For n ≥ 1, K_*(M_n(R)) ≅ K_*(R); the n = 0 case over a field fails.
- **not_isomorphism** (non-example): Morita equivalent rings need not be isomorphic, so the statement is not vacuous.
- **respects_product** (non-example): For a commutative ring with an invertible module L whose class differs from [R] in K₀, the Morita autoequivalence L ⊗_R − sends [R] to [L]. Thus it is not a unital K₀-ring automorphism. A product comparison must carry additional monoidal/biexact compatibility data.
- **negative_degrees** (computation): The isomorphism holds in negative degrees.

**Acceptance.**

- For n ≥ 1 a ring and its n by n matrix ring have isomorphic K-groups in every degree; M₀(k) is the zero ring and has K₀ = 0, whereas K₀(k) = ℤ.
- External-product compatibility carries the natural isomorphism of biexact functors as data; no unital ring isomorphism is inferred from a bare Morita equivalence.
- Morita equivalent rings need not be isomorphic, so the theorem is not a triviality.

**Prerequisites:** `mathlib:ModuleCat.matrixEquivalence`, `mathlib:IsMoritaEquivalent`, `mathlib:IsMoritaEquivalent.matrix`, `mathlib:Matrix`, `tauceti:TauCeti.ExactK0`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`.

**Sources:** Kbook.2013, II.2.7 (Theorem 2.7), printed p. 75 (PDF p. 83) — The structure theorem; Kbook.2013, II.2.7.1 (Corollary 2.7.1), printed p. 76 (PDF p. 84) — Degree zero; Kbook.2013, II.2.7.2 (Example 2.7.2), printed p. 76 (PDF p. 84) — The matrix ring; Kbook.2013, IV.6.3.5 (Morita Invariance 6.3.5), printed p. 321 (PDF p. 329) — All degrees.

#### Derived invariance needs an enhancement, not a triangulated equivalence

`GeneralAlgebraicKTheory:K.7/derived-morita-and-enhancements` · comparison

At the derived level the invariance statement is about enhanced categories: K-theory is invariant under an equivalence of the underlying differential graded or stable categories of perfect complexes, and the enhancement is part of the hypothesis. A bare equivalence of triangulated categories is not enough, because the K-theory of a Waldhausen category is built from the category with its cofibrations and weak equivalences, not from the homotopy category alone, and mapping cones in a triangulated category are not functorial. This node states what the correct hypothesis is, records the failure of the naked form as a non-example, and says exactly which data a formalisation must carry. The stage text names this as the trap of the layer.

**Hypotheses and conventions.**

- The categories are the perfect complexes over the rings, with their standard Waldhausen structure.
- The hypothesis is an equivalence of enhancements: a quasi-equivalence of differential graded categories, or an equivalence of the associated stable infinity-categories.
- Neither pinned library has enhanced categories or a K-theory of them, which is recorded here as the reason the node is a comparison and not a construction.

**Construction or proof.**

1. Record the source's construction of K-theory from a category with cofibrations and weak equivalences, so that it is visible which data the construction consumes.
2. State the invariance: an exact equivalence of Waldhausen categories induces a homotopy equivalence of K-theory spectra, and more generally an equivalence of enhancements does. The Waldhausen form is K.4's approximation theorem and Schlichting's form (Proposition 11.15) is stated in K.6/nonconnective-spectrum-and-derived-invariance; this node imports both and adds the enhanced formulation and the non-example.
3. State the non-example: a triangulated equivalence of homotopy categories does not by itself induce an isomorphism on K-theory, because the homotopy category forgets the weak equivalences that the construction uses.
4. Record the elementary part that does survive: an equivalence of homotopy categories does induce an isomorphism on the zeroth K-group, since that group depends only on the triangulated structure.
5. Name the data a formalisation must carry: the category, its cofibrations, its weak equivalences, and the functor's exactness, and record that dropping any of them breaks the statement.

**Acceptance.**

- An exact equivalence of Waldhausen categories induces a homotopy equivalence on K-theory, in every degree.
- A triangulated equivalence induces an isomorphism on the zeroth group but is not sufficient for the higher groups.
- Tau Ceti's pinned exact-equivalence invariance for the zeroth group is the degree-zero shadow of this statement and is cited as baseline.

**Prerequisites:** `GeneralAlgebraicKTheory:K.7/morita-invariance`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`, `GeneralAlgebraicKTheory:K.4/approximation-theorem`, `tauceti:TauCeti.ExactK0.mapEquiv`, `mathlib:CategoryTheory.Functor.IsEquivalence`.

**Sources:** Kbook.2013, II.9.1.1 (Definition 9.1.1), printed p. 158 (PDF p. 166) — The data a K-theory is built from; Kbook.2013, II.9.7 (Theorem 9.7, Approximation Theorem), printed p. 167 (PDF p. 175) — The invariance statement at the level of Waldhausen categories, which is what the enhancement hypothesis provides; Schlichting.NegativeK.2003, Definition 11.1 and Proposition 11.15, pp. 20 and 22 — Derived invariance for maps of Frobenius pairs: the hypothesis is a map of models, not a bare triangulated equivalence.

#### The nonunital extension of the Bass spectrum

`GeneralAlgebraicKTheory:K.7/nonunital-bass-fibre` · construction

For A define K^B_nu(A)=fib(K^B(ℤ⋉A)→K^B(ℤ)) using the canonical augmentation. This is functorial for nonunital homomorphisms. When A is unital, (z,a)↦(z,z·1_A+a) identifies ℤ⋉A with ℤ×A as augmented unital rings and gives a natural equivalence K^B_nu(A)≃K^B(A) for unital maps.

**Hypotheses and conventions.**

- Associative nonunital rings and nonunital ring homomorphisms; ordinary K^B on unital rings is the existing Bass nonconnective spectrum.

**Construction or proof.**

1. Reuse K.5’s unitization with product (z,a)(w,b)=(zw,zb+wa+ab). Its augmentation is a unital map toℤ; a nonunital h induces the unital augmentation-preserving map (z,a)↦(z,h(a)). Apply the existing functor K^B and take its homotopy fibre.
2. For unital A the displayed product-ring isomorphism has inverse (z,c)↦(z,c−z1_A). Verify multiplication and augmentation. Finite-product compatibility identifies K^B(ℤ⋉A) with K^B(ℤ)×K^B(A); the augmentation is projection, so its fibre is K^B(A).
3. This comparison is natural for unital maps. For a nonunital h:A→B the product-ring coordinate map instead is (z,c)↦(z,h(c)+z(1_B−h(1_A))). Its extra summand must be retained; the next node calculates the induced fibre map.

**API.**

| Declaration | Contract |
| --- | --- |
| NonunitalBass | The fibre of K^B of the unitization augmentation. |
| NonunitalBass.map | A nonunital ring map induces the fibre map. |
| NonunitalBass.unitalEquiv | For unital A, K^B_nu(A)≃K^B(A). |

**Uses.**

- K.7/invariance-under-filtered-colimits-and-products; K.6/agreement-and-vanishing-of-negative-K: Extends continuity to the actual nonunital matrix diagram and verifies the map in the stabilization axiom.

**Checks.**

- **zero_ring** (computation): A=0 gives fib(id:K^B(ℤ)→K^B(ℤ)), hence zero spectrum.
- **unital_integer_ring** (compatibility): For A=ℤ the unitization is ℤ×ℤ and the fibre is the second K^B(ℤ).
- **corner_not_product_map** (non-example): For the corner ℤ→M₂(ℤ), the second component sends (z,c) to diag(c,z), not diag(c,0); ignoring z breaks unitality.

**Acceptance.**

- This definition uses nonconnective fibres. It is not a claim that every connective excision map is an equivalence.

**Prerequisites:** `GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation`, `GeneralAlgebraicKTheory:K.5/relative-K-theory`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.6/bass-spectrum-homotopy-groups`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `StableHomotopyKTheory:H.5:spectra`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`.

**Sources:** Kbook.2013, IV.6.3.5–6.4, III.4.4 axiom4, and II.2.7.2; formal adapter for the nonunital corner maps — The matrix Morita and unital continuity statements are source inputs. The explicit unitization decomposition and corner-map calculation below are the explicit derivation supplying the missing adapter; they are not attributed to an unread source proof..

#### Identify a nonunital fibre map between unital rings

`GeneralAlgebraicKTheory:K.7/nonunital-map-idempotent-extension` · lemma

For a possibly nonunital homomorphism h:A→B between unital rings, put e=h(1_A). Under K^B_nu(A)≃K^B(A) and K^B_nu(B)≃K^B(B), its map is induced by the exact functor P(A)→P(B), P↦P⊗_A eB for right modules. This functor preserves finite projectives.

**Hypotheses and conventions.**

- h preserves multiplication and addition; e²=e and h(a)e=eh(a)=h(a). The left A-action on eB is unital.

**Construction or proof.**

1. The right ideal eB is a direct summand of the free right B-module B, and a finite projective P is a summand of A^m. Tensor therefore makes P⊗_A eB a summand of (eB)^m; split exact sequences are preserved.
2. Under the product-ring coordinates, the unitized map acts on the B component through the orthogonal idempotents e and1−e. Extension of scalars on a projective pair (U,P) over ℤ×A yields the pair (U, (U⊗_ℤ(1−e)B)⊕(P⊗_A eB)) over ℤ×B. Check the map on each summand using its identity idempotent.
3. The fibre inclusion is represented by P↦(0,P). The displayed extension sends it to (0,P⊗_A eB), proving the claimed map in connective K-theory. The polynomial and Laurent versions carry the same idempotent and tensor decomposition; their naturality passes through the Bass construction to all degrees.

**Acceptance.**

- For h unital, e=1 and this reduces to ordinary extension of scalars; for h=0, e=0 and the fibre map is zero.

**Prerequisites:** `GeneralAlgebraicKTheory:K.7/nonunital-bass-fibre`, `GeneralAlgebraicKTheory:K.7/morita-invariance`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`.

**Sources:** Kbook.2013, IV.6.3.5–6.4, III.4.4 axiom4, and II.2.7.2; formal adapter for the nonunital corner maps — The matrix Morita and unital continuity statements are source inputs. The explicit unitization decomposition and corner-map calculation below are the explicit derivation supplying the missing adapter; they are not attributed to an unread source proof..

#### Corner embeddings become identity under matrix Morita

`GeneralAlgebraicKTheory:K.7/matrix-corner-morita-naturality` · lemma

Let n≥1, A_n=M_n(R), and h_n:A_n→A_{n+1} the upper-left corner map. The standard right-module Morita functors Φ_n(P)=P⊗_{A_n}R^n identify K^B_nu(h_n) with id on K^B(R), coherently under iterated corner embeddings.

**Hypotheses and conventions.**

- R is any unital associative ring; R^n is the column (M_n(R),R)-bimodule, n≥1.

**Construction or proof.**

1. Set e=diag(I_n,0)∈A_{n+1}. The preceding node identifies the corner K-map with P↦P⊗_{A_n}eA_{n+1}.
2. The multiplication isomorphism eA_{n+1}⊗_{A_{n+1}}R^{n+1}≅eR^{n+1} and the coordinate projection eR^{n+1}≅R^n give a natural bimodule isomorphism. Associating tensors proves Φ_{n+1}(P⊗eA_{n+1})≅Φ_n(P).
3. These coordinate isomorphisms compose literally for successive upper-left corners. The induced natural exact-functor isomorphisms yield compatible K-homotopies. Thus the colimit diagram of matrix spectra is identified with the constant spectrum K^B(R), rather than merely identifying its individual objects.

**Acceptance.**

- On K₀, the corner sends the rank-one primitive idempotent to the same primitive idempotent, hence to1 under Φ_n. The regular module of M_n(R) maps to rank n over R, so it is not the normalized generator.

**Prerequisites:** `GeneralAlgebraicKTheory:K.7/nonunital-map-idempotent-extension`, `GeneralAlgebraicKTheory:K.7/morita-invariance`.

**Sources:** Kbook.2013, IV.6.3.5–6.4, III.4.4 axiom4, and II.2.7.2; formal adapter for the nonunital corner maps — The matrix Morita and unital continuity statements are source inputs. The explicit unitization decomposition and corner-map calculation below are the explicit derivation supplying the missing adapter; they are not attributed to an unread source proof..

#### Filtered continuity of the nonunital Bass spectrum

`GeneralAlgebraicKTheory:K.7/nonunital-filtered-continuity` · theorem

For a small filtered diagram of nonunital rings A_i, hocolim_i K^B_nu(A_i)≃K^B_nu(colim_i A_i). In particular the corner inclusion R=M₁(R)→M_∞(R) induces K^B(R)≃K^B_nu(M_∞(R)).

**Hypotheses and conventions.**

- Associative nonunital rings and nonunital ring homomorphisms; ordinary K^B on unital rings is the existing Bass nonconnective spectrum.

**Construction or proof.**

1. Unitization preserves filtered colimits: the ℤ coefficient is unchanged and every finite sum/product in the nonunital part is represented at a finite stage. Thus colim(ℤ⋉A_i)≅ℤ⋉colim A_i as augmented unital rings.
2. First obtain unital K^B continuity directly: positive/zero degrees are the early K.2 continuity theorem, and negative degrees commute with filtered colimits by polynomial/Laurent extension and cokernel iteration. The Bass homotopy-group identification and stable Whitehead give the spectrum comparison. Apply this to the unitizations. The constant augmentation spectrum K^B(ℤ) has itself as hocolim because a nonempty filtered index has contractible nerve.
3. Filtered homotopy colimits of spectra commute with finite homotopy limits; in particular they commute with these augmentation fibres. This gives the comparison equivalence. The generic stable-category statement is an H.5 supplier, explicitly requested below.
4. Apply this to the corner matrix diagram and use matrix-corner-morita-naturality to identify all transitions with identity. Its hocolim is K^B(R), with the actual first-corner map as comparison.

**Acceptance.**

- The theorem permits nonunital transitions. An unital-ring colimit of the corner system is not substituted.

**Prerequisites:** `GeneralAlgebraicKTheory:K.7/nonunital-bass-fibre`, `GeneralAlgebraicKTheory:K.7/matrix-corner-morita-naturality`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/bass-spectrum-homotopy-groups`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `StableHomotopyKTheory:H.5:spectra`.

**Sources:** Kbook.2013, IV.6.3.5–6.4, III.4.4 axiom4, and II.2.7.2; formal adapter for the nonunital corner maps — The matrix Morita and unital continuity statements are source inputs. The explicit unitization decomposition and corner-map calculation below are the explicit derivation supplying the missing adapter; they are not attributed to an unread source proof..

#### Filtered colimits and finite products in the nonconnective theory

`GeneralAlgebraicKTheory:K.7/invariance-under-filtered-colimits-and-products` · theorem

The connective statements — K_n(R × R′) ≅ K_n(R) × K_n(R′) for a finite product of unital rings and colim_i K_n(R_i) ≅ K_n(colim_i R_i) for a filtered colimit, n ≥ 0 — belong to the early ring node (K.2/functorial-K-theory-of-a-ring, from K.1/elementary-properties-of-K-groups) and are imported, not re-proved here. This node adds their nonconnective refinements. (a) For every n ≥ 1, Bass's K_{−n} takes finite products of rings to products (K.6/negative-k-groups) and commutes with filtered colimits of rings, because R ↦ R[t], R[t⁻¹], R[t,t⁻¹] commute with filtered colimits and so do cokernels. (b) Hence the Bass spectrum satisfies K^B(R × R′) ≃ K^B(R) × K^B(R′) and hocolim_i K^B(R_i) ≃ K^B(colim_i R_i), the maps being isomorphisms on π_n for every integer n by (a), the connective statements and K.6/bass-spectrum-homotopy-groups. (c) For Frobenius pairs and exact categories the non-positive filtered-colimit statement is K.6/additivity-and-colimits-for-negative-K's (Schlichting's Lemma 6.3 and Corollary 6.4), cited here, not restated. (d) The infinite matrix ring M(R) = colim_n M_n(R) uses corner embeddings, which are nonunital. Its continuity statement is supplied by nonunital-filtered-continuity, using unitization fibres and matrix-corner-morita-naturality. The target is the nonunital spectrum K^B_nu(M(R)); the actual corner inclusion induces the comparison. Infinite products are not claimed.

**Hypotheses and conventions.**

- Filtered colimits are over small filtered categories of unital rings and unital maps and are taken in rings; products are finite.
- The connective statements are imported from the early ring node; this node owns only the nonconnective refinements, for Bass's groups, the Bass spectrum and Schlichting's IK.
- The pinned library has filtered colimits of categories but not the K-theoretic statement, as the pinned declarations show.
- Clause(d) imports the explicit nonunital unitization/fibre adapter and the corner-map compatibility calculation. No transition is treated as unital.

**Construction or proof.**

1. Import the connective finite-product and filtered-colimit statements for rings from K.2/functorial-K-theory-of-a-ring, which applies K.1/elementary-properties-of-K-groups to idempotent-matrix models.
2. Negative degrees: finite products from K.6/negative-k-groups; filtered colimits by induction on n, since polynomial and Laurent extensions and cokernels commute with filtered colimits.
3. Spectrum level: compare π_n in every degree, using K.6/bass-spectrum-homotopy-groups with the connective statements for n ≥ 0 and the previous step for n < 0.
4. Frobenius pairs: cite K.6/additivity-and-colimits-for-negative-K for the non-positive filtered-colimit statement.
5. Apply nonunital-filtered-continuity to the corner matrix diagram. The standard Morita bimodules identify every transition with identity by matrix-corner-morita-naturality; the fibre-map calculation includes the complementary augmentation idempotent.

**Acceptance.**

- The negative K-groups of a finite product ring are the products of the negative K-groups, and K^B(R × R′) ≃ K^B(R) × K^B(R′).
- The negative K-groups of a filtered colimit of rings are the colimits of the negative K-groups.
- Neither statement is claimed for infinite products; the source records that those are different.
- The corner map M_n(R) → M_{n+1}(R), A ↦ diag(A,0), sends 1 to diag(1,0), not to 1 for a nonzero R. The theorem for unital filtered diagrams cannot be applied before unitisation.

**Prerequisites:** `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/bass-spectrum-homotopy-groups`, `GeneralAlgebraicKTheory:K.6/additivity-and-colimits-for-negative-K`, `GeneralAlgebraicKTheory:K.7/morita-invariance`, `mathlib:CategoryTheory.Limits.HasFilteredColimits`, `GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation`, `GeneralAlgebraicKTheory:K.5/relative-K-theory`, `GeneralAlgebraicKTheory:K.7/nonunital-filtered-continuity`.

**Sources:** Kbook.2013, II.2, the paragraph after Example 2.1.3, printed p. 69 (PDF p. 77) — Products in degree zero; the connective statement is the early ring node's and is identified to specify the boundary; Kbook.2013, IV.6.4 (Elementary properties 6.4), printed p. 321 (PDF p. 329) — Products in all non-negative degrees, the connective statement imported from the early ring node; Kbook.2013, IV.6.4, the filtered-colimit clause, printed p. 321 (PDF p. 329) — Filtered colimits in all non-negative degrees, the connective statement imported from the early ring node; Schlichting.NegativeK.2003, Lemma 6.3 and Corollary 6.4, pp. 13–14 — Filtered colimits in non-positive degrees, stated in K.6/additivity-and-colimits-for-negative-K and cited here.

#### The total K-group is a graded-commutative ring

`GeneralAlgebraicKTheory:K.7/graded-commutativity` · theorem

For a commutative ring the internal product makes the direct sum of the K-groups a graded ring, and the symmetry homotopy makes it graded commutative: the product of a class in degree p and one in degree q equals minus one to the power p times q times the product in the other order. In degree one the statement specialises to the anticommutativity of the symbol of two units, and the product of a class in degree zero with one in degree one is given by the action of the zeroth K-group. The sign is a consequence of the symmetry of the tensor product together with the sign rule of the smash product of spheres, and it is not a convention that can be chosen.

**Hypotheses and conventions.**

- R is commutative; the total K-group is the direct sum over non-negative degrees, or over all degrees in the nonconnective theory.
- The sign comes from the symmetry homotopy of the previous node and from the standard sign of the graded smash; the node records both contributions.
- The pinned libraries have no first K-group at all, as the pinned declarations show, so the degree-one specialisation cannot be stated against them.
- The scheme form of graded commutativity is SchemeKTheoryOperations S.6's, which imports this node; this node does not depend on S.6, which the atlas places after K.7.

**Construction or proof.**

1. State the graded ring structure and the graded commutativity with the sign.
2. Specialise to two classes in degree one: the symbol of two units is the inverse of the symbol in the other order.
3. Specialise to degrees zero and one: the product is the module action of the zeroth K-group, and multiplication by the class of the ring is the identity.
4. Record the source's statement that the first K-group of the Laurent polynomial ring over the integers contains the class of the variable and that multiplication by it is the splitting of the fundamental theorem (K.6/multiplication-by-t-splits-the-boundary), so the product structure and K.6 are linked.
5. Record the non-example: for a non-commutative ring there is no internal product of this kind, only the external one, and the graded ring statement fails.

**Acceptance.**

- The total K-group of a commutative ring is graded commutative.
- In degree one the symbol is anticommutative, which is the classical statement.
- Multiplication by the class of the variable in the first K-group of the integral Laurent ring is the splitting of K.6's fundamental theorem.

**Prerequisites:** `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`, `StableHomotopyKTheory:H.5:spectra`.

**Sources:** Kbook.2013, IV.1.10 (Theorem 1.10, Loday), printed p. 266 (PDF p. 274) — Graded commutativity; the packet cited 'IV.1 and the product structure (PDF p. 302)' with a formula that is not in the source; Kbook.2013, V.8.2 (Theorem 8.2), printed p. 430 (PDF p. 438) — Multiplication by the class of the variable.

#### Compatibility of the product with relative groups, boundaries and transfers

`GeneralAlgebraicKTheory:K.7/compatibility-with-relative-groups-and-transfers` · lemma

The external product is compatible with the other structure of the theory. It descends to relative groups, so that the product of an absolute class and a relative class is relative; it commutes with the boundary maps of the localisation sequences up to the expected sign, that is, the boundary is K_*(R)-linear up to sign (a module map, not a derivation of a ring); and it satisfies the projection formula for a transfer, namely that the transfer of a product of a class pulled back along the map with a class upstairs equals the product of the first with the transfer of the second. Each is a separate assertion with its own proof and none follows from the construction of the product alone.

**Hypotheses and conventions.**

- The relative groups are those of a ring map or of an ideal, as the source defines them.
- The boundary maps are those of the localisation and Mayer-Vietoris sequences.
- The transfer is the one attached to a finite map with the appropriate finiteness hypothesis, which the node records rather than assumes.

**Construction or proof.**

1. State the relative compatibility and record which pairing it refers to.
2. State the linearity of the boundary with respect to the product, with its sign: the boundary is a map of K_*(R)-modules, not a derivation of a ring. The instance for the localisation at the variable t is K.6/multiplication-by-t-splits-the-boundary.
3. State the projection formula for a transfer, with the hypothesis on the map under which the transfer exists.
4. Record that each of the three is used elsewhere in the atlas: the linearity of the boundary in the localisation sequences, the projection formula in the transfer arguments.
5. Record what is not claimed: no compatibility with an infinite product, and no statement about a transfer along a map that is not finite.

**Acceptance.**

- The boundary of the product of a class from the base with a class of the localisation is the product of that class with the boundary, with the expected sign.
- The projection formula holds for a finite map.
- None of the three follows from bilinearity alone; each is a separate statement.

**Prerequisites:** `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `GeneralAlgebraicKTheory:K.7/graded-commutativity`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`, `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`, `GeneralAlgebraicKTheory:K.5/relative-K-theory`.

**Sources:** Kbook.2013, V.3.12 (Projection Formula 3.12), printed p. 395 (PDF p. 403) — The projection formula for the transfer; Kbook.2013, IV.8.11 (Products), printed p. 342 (PDF p. 350) — The spectrum-level pairing the compatibilities are statements about.

#### The K-zero tensor comparison and multiplication by a unit in K-one

`GeneralAlgebraicKTheory:K.7/unit-multiplication-and-K0-tensor-comparison` · lemma

Component: `GeneralAlgebraicKTheory:K.7:products`.

Two concrete consequences of the product structure serve as the unit tests of the layer. First, the comparison in degree zero: the product of the classes of two finitely generated projective modules is the class of their tensor product, so that the map from the tensor square of the zeroth K-group to itself is determined on classes; Tau Ceti has exactly this statement for the split model and it is cited as baseline. Second, multiplication in degree one: the product of the class of a unit in the first K-group with a class in the zeroth K-group is computed by the action, and multiplication by the class [u] of a unit in the first K-group raises degree by one; since [u⁻¹] = −[u] in the first K-group, multiplication by [u⁻¹] is the negative of multiplication by [u] (it is not an inverse, and neither map is an automorphism of a K-group). The second cannot be stated against the pinned libraries, which have no first K-group. More precisely, for a commutative ring R, u∈R× and finite projective P, [u]·[P] is the K1 class of u·id_P. The unit map R×→K1(R) is the stabilized one-by-one matrix map, not a determinant map in the opposite direction.

**Hypotheses and conventions.**

- R is commutative; the modules are finitely generated projective.
- The unit is an element of the unit group of the ring, and its class in the first K-group is its image under the determinant-like map.
- At these pins the first K-group is absent from both pinned trees, so the second statement has no baseline and must be built.

**Construction or proof.**

1. State the degree-zero comparison and cite the pinned Tau Ceti statement for the split model.
2. Record the gap between the split model and the general one: the pinned statement is for the split K-zero and a comparison with the exact-category model is needed before it can be used in general.
3. State the degree-one multiplication: the product of the class [u] of a unit with a class in the zeroth K-group is computed by the action and raises degree by one; since [u⁻¹] = −[u] in the first K-group, multiplication by [u⁻¹] is the negative of multiplication by [u], not an inverse.
4. Record that these two are the unit tests by which a formalisation of the product is checked, and that failing either means the construction is wrong.
5. Record the source's statement of the map from units to the first K-group, and the fact that it is an isomorphism for a commutative local ring, which is where the second test is most easily checked.

**Acceptance.**

- The product of two classes is the class of the tensor product; this is the pinned Tau Ceti statement for the split model.
- Multiplication by [u⁻¹] is the negative of multiplication by [u], because [u] + [u⁻¹] = [uu⁻¹] = 0 in the first K-group; neither map is an automorphism of a K-group.
- Neither statement can be checked in degree one against the pinned libraries, since the first K-group is absent there.

**Prerequisites:** `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `tauceti:TauCeti.SplitK0.of_mul_of`, `tauceti:TauCeti.SplitK0`, `GeneralAlgebraicKTheory:K.2:plus/zero-one-ring-comparison`, `KTheoryLowDegrees:U.2`.

**Sources:** Kbook.2013, II.7.4.1 (Application 7.4.1), printed p. 132 (PDF p. 140) — The K0 comparison; Kbook.2013, III.1.1.1 (Example 1.1.1, SK1), printed p. 180 (PDF p. 188) — Units in K1; [u] + [u⁻¹] = [u u⁻¹] = 0 since K1 is additive in the product of units.

#### Two Artin module models with equivalent triangulated stable categories

`GeneralAlgebraicKTheory:K.7/stable-artin-module-models` · construction

For an odd primep, the finite-module categories over R₁=ℤ/p² and R₂=𝔽_p[ε]/ε² are Frobenius. With monomorphisms as cofibrations and stable isomorphisms as weak equivalences, their stable categories are both equivalent to finite-dimensional 𝔽_p vector spaces with suspension id and split distinguished triangles.

**Hypotheses and conventions.**

- p is odd, as in the source counterexample. Objects are finitely generated modules over the indicated finite rings, not arbitrary infinite modules.

**Construction or proof.**

1. Each finite module decomposes as a finite direct sum of free modules and copies of the simple module𝔽_p (elementary divisors for ℤ/p² and the length≤2 nilpotent Jordan decomposition for dual numbers). The free modules are precisely the projective-injectives and vanish stably.
2. Inflation from𝔽_p is fully faithful stably: a simple-to-simple map factoring through a free module is zero, since the inclusion lands in its socle and projection to the simple kills that socle. The module decomposition makes inflation essentially surjective.
3. The chosen injective hull of the simple module isR. Multiplication byp orε identifies R/simple with simple, hence suspension is id. Every triangle is a sum of rotations of the identity triangle because any map of finite vector spaces splits into its isomorphism and zero parts.

**API.**

| Declaration | Contract |
| --- | --- |
| ArtinStableModel | Finite modules with monic cofibrations and stable-isomorphism weak equivalences. |
| ArtinStableModel.projectiveInjective | The free modules are the projective-injective objects. |
| ArtinStableModel.simpleEquivalence | Stable category≃finite𝔽_p vector spaces. |
| ArtinStableModel.suspension | Multiplication byp orε identifies suspension with identity. |

**Uses.**

- The negative comparison and triangulated-invariance tests of K.6/K.7: Provides an actual cone, quotient or test model with all hypotheses, instead of assuming the desired comparison.

**Checks.**

- **p_three** (computation): The two rings areℤ/9 and𝔽₃[ε]/ε²; their free modules disappear stably.
- **simple_survives** (computation): The simple module𝔽_p has nonzero stable identity.
- **enhancement_absent** (non-example): A triangulated equivalence alone supplies no exact map between the two Waldhausen models.

**Acceptance.**

- The resulting equivalence of triangulated categories is not asserted to lift to an exact weak-equivalence-preserving map between the two ring module models.

**Prerequisites:** `GeneralAlgebraicKTheory:K.6/frobenius-pairs`, `GeneralAlgebraicKTheory:K.6/frobenius-pair-factorization`.

**Sources:** Schlichting.TriangulatedCounterexample.2002, §§0.2–0.3,1.1–1.4,112–113 — Full module and suspension argument read..

#### The K-theory fibration for each Artin stable module model

`GeneralAlgebraicKTheory:K.7/stable-artin-k-fibration` · lemma

For either R₁ orR₂ there is a natural homotopy fibration K(R)→K(𝔽_p)→K(mM(R)), where mM(R) is the stable-weak-equivalence module model. Consequently K₄(mM(R)) injects intoK₃(R), with image the kernel ofK₃(R)→K₃(𝔽_p).

**Hypotheses and conventions.**

- Use the opposite Waldhausen construction or the existential Frobenius factorization/fibration apparatus of early K.4.

**Construction or proof.**

1. The acyclic objects for stable weak equivalences are the projective-injectives. The change from isomorphism weak equivalences to stable weak equivalences gives the fibration K(P(R))→K(M(R))→K(mM(R)).
2. Dévissage of the finite-length abelian categoryM(R) identifies its exact K-theory withK(𝔽_p), using the unique simple object.
3. The long exact sequence and K₄(𝔽_p)=0 give the displayed injection. The finite-field calculation is the L.1 supplier, not a fresh construction here.

**Acceptance.**

- The source fibration uses exactM(R), not its split-exact version.

**Prerequisites:** `GeneralAlgebraicKTheory:K.7/stable-artin-module-models`, `GeneralAlgebraicKTheory:K.4/fibration-with-factorizations`, `GeneralAlgebraicKTheory:K.3/devissage-theorem`, `KTheoryFiniteLocalFields:L.1`.

**Sources:** Schlichting.TriangulatedCounterexample.2002, §§1.5–1.6,113–114 — Full fibration and dévissage proof read; the derived-invariance theorem is not assumed to prove its own counterexample..

#### The two stable models have different fourth K-groups

`GeneralAlgebraicKTheory:K.7/naked-triangulated-invariance-counterexample` · application

For an odd primep, despite the triangulated equivalence above, K₄(mM(ℤ/p²)) has p-primary subgroupC_(p²), while K₄(mM(𝔽_p[ε]/ε²)) has p-primary subgroupC_p⊕C_p. Their Waldhausen K-theories are therefore inequivalent.

**Hypotheses and conventions.**

- Numerical inputs: K₃(ℤ/p²)=C_(p²)⊕C_(p²−1); K₃(𝔽_p[ε]/ε²)=C_p⊕C_p⊕C_(p²−1); K₃(𝔽_p)=C_(p²−1),K₄(𝔽_p)=0. The Artin K3 calculations are explicitly requested, not claimed newly proved here.

**Construction or proof.**

1. The stable-artin-k-fibration identifiesK4 with the kernel ofK3(R)→K3(𝔽_p). Its entire p-primary subgroup maps to0 because the target has order prime top.
2. The first source p-primary group contains an element of orderp². The second has exponentp, so cannot contain such an element. This distinguishes the K4 groups without needing the actual map on the prime-to-p summand.
3. Thus an equivalence of underlying triangulated stable categories is insufficient. Preserve the positive invariance theorem for a map of Frobenius pairs inducing a derived equivalence; the counterexample lacks that map.

**Acceptance.**

- At p=3 the distinguishing p-primary groups areC9 andC3×C3, not different cardinalities. The unread EF82/ALPS85 calculation inputs are recorded separately.

**Prerequisites:** `GeneralAlgebraicKTheory:K.7/stable-artin-k-fibration`, `GeneralAlgebraicKTheory:K.7/stable-artin-module-models`.

**Sources:** Schlichting.TriangulatedCounterexample.2002, §§1.6–1.7,114;§2.1–2.2,114–115 — Counterexample proof read; only its separately cited finite-ring K3 computations remain unexamined..

#### Filtered continuity of the compared models

`GeneralAlgebraicKTheory:K.7/compared-model-filtered-continuity` · theorem

For a filtered system of unital rings R_i, the canonical map colim_i Kconn(R_i)→Kconn(colim_i R_i) is an equivalence of connective spectra. The symmetric monoidal, Q, plus and S comparisons commute with this map, including finite-projective object classes and stabilized automorphism classes.

**Hypotheses and conventions.**

- The colimit is filtered, in unital rings. This is not an arbitrary inverse-limit or completion theorem.

**Construction or proof.**

1. Represent each finite projective by a finite idempotent matrix. Descend its entries and equations to one stage.
2. Descend finite matrices for isomorphisms, their inverse equations, and stabilization witnesses to a subsequent common stage. Thus the projective core and its symmetric monoidal structure descend.
3. Apply H.4 group completion and spectrum filtered-colimit compatibility, and transport the comparison through the natural Q/plus/S equivalences.

**Acceptance.**

- A finite idempotent and its complementary idempotent descend together.
- An automorphism inverse relation holds at some common subsequent stage; descent of objects alone does not establish K1 continuity.

**Prerequisites:** `GeneralAlgebraicKTheory:K.2:plus/symmetric-monoidal-projective-model`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `StableHomotopyKTheory:H.1/filtered-colimits-of-categories`, `StableHomotopyKTheory:H.5:spectra`.

**Sources:** BS.Grassmannian, §5, proof of Corollary 5.6, pp.19–20; Definitions 12.13,12.16, pp.58–59 — Finite-presentation continuity for the K-model used by the Grassmannian consumer..

## Routed-source coverage

Each routed item resolves to the following mathematical target or supplier contract. This is a target index; the full statements and proofs are specified above or by the named owner.

| Routed item | Target or supplier | Contract |
| --- | --- | --- |
| PAPER-CALMES-ETAL-26/10 | GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-symmetric-localization, GeneralAlgebraicKTheory:K.3/dedekind-symmetric-L-localization | Import the existing GW residue sequence and add its L companion with canonical coefficient. |
| PAPER-CALMES-ETAL-26/300 | GeneralAlgebraicKTheory:K.3/dedekind-S-localization-and-torsion, GeneralAlgebraicKTheory:K.3/dedekind-poincare-localization, GeneralAlgebraicKTheory:K.3/symmetric-torsion-devissage | The Dedekind hermitian specialization is built on the classical exact-category results. |
| PAPER-CALMES-ETAL-26/301 | GeneralAlgebraicKTheory:K.3/dedekind-S-localization-and-torsion | Valuation localization and finite-support torsion/perfect categories. |
| PAPER-CALMES-ETAL-26/302 | GeneralAlgebraicKTheory:K.3/dedekind-S-localization-and-torsion | Empty/all-prime and nonprincipal-prime tests; multiplicative-localization specialization. |
| PAPER-CALMES-ETAL-26/303 | GeneralAlgebraicKTheory:K.3/dedekind-S-localization-and-torsion, GeneralAlgebraicKTheory:K.3/dedekind-poincare-localization | Flat epimorphism and perfect torsion generation, with fibre (R_S/R)[−1]. |
| PAPER-CALMES-ETAL-26/304 | GeneralAlgebraicKTheory:K.3/dedekind-poincare-localization | Verify the Dedekind instance of the imported Poincaré localization criterion. |
| PAPER-CALMES-ETAL-26/305 | GeneralAlgebraicKTheory:K.3/shifted-torsion-duality | Shifted torsion duality and discrete symmetric form spaces. |
| PAPER-CALMES-ETAL-26/306 | GeneralAlgebraicKTheory:K.3/lattice-linking-boundary | Lattice quotient linking form represents the shifted boundary. |
| PAPER-CALMES-ETAL-26/307 | GeometryOfNumbersAndQuadraticArithmetic:GN.6 | Request the generic restriction-of-scalars criterion in the stable Poincaré supplier; B perfect over A and N→RHom_A(B,M) an equivalence. |
| PAPER-CALMES-ETAL-26/308 | GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-residue-duality-line | Import the already-owned residue coefficient, including the −1 shift. |
| PAPER-CALMES-ETAL-26/309 | GeneralAlgebraicKTheory:K.3/symmetric-torsion-devissage, GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-residue-duality-line | Apply the generic Poincaré functor criterion for each p∈S. |
| PAPER-CALMES-ETAL-26/310 | GeneralAlgebraicKTheory:K.3/symmetric-torsion-devissage | K/GW/L symmetric devissage, all shifts and dyadic primes. |
| PAPER-CALMES-ETAL-26/311 | GeneralAlgebraicKTheory:K.3/dedekind-symmetric-L-localization, GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-symmetric-localization | Choice-free symmetric residue localization. |
| PAPER-CALMES-ETAL-26/312 | GeneralAlgebraicKTheory:K.3/ramified-residue-compatibility | Ramification requires canonical residue coefficients; F2 example. |
| PAPER-CALMES-ETAL-26/313 | GeneralAlgebraicKTheory:K.3/dyadic-quadratic-devissage-boundary | Quadratic residue devissage only away from dyadic primes. |
| PAPER-CALMES-ETAL-26/314 | GeneralAlgebraicKTheory:K.3/dyadic-quadratic-devissage-boundary | The proposed F2 quadratic fibre sequence fails. |
| PAPER-CALMES-ETAL-26/315 | GeneralAlgebraicKTheory:K.3/second-residue-formula | Rank-one boundary and valuation parity. |
| PAPER-CALMES-ETAL-26/316 | GeneralAlgebraicKTheory:K.3/second-residue-formula | Identification with the classical second residue map. |
| PAPER-BHATT-SCHOLZE-17/A1213 | GeneralAlgebraicKTheory:K.2:plus/symmetric-monoidal-projective-model, StableHomotopyKTheory:H.4 | Import general symmetric monoidal group completion; specialize to projectives and compare models. |
| PAPER-BHATT-SCHOLZE-17/A1216 | GeneralAlgebraicKTheory:K.2:plus/symmetric-monoidal-projective-model | Reuse the pinned split exact projectives unchanged; ring model comparison preserves automorphism loops. |
| PAPER-BHATT-SCHOLZE-17/D518 | GeneralAlgebraicKTheory:K.7/compared-model-filtered-continuity, SchemeKTheoryOperations:S.3 | Ring continuity is here; the general affine/scheme perfect-support continuity application is requested from the support owner. |
| PAPER-BHATT-SCHOLZE-17/k-theory-additivity | GeneralAlgebraicKTheory:K.4/waldhausen-additivity-theorem, GeneralAlgebraicKTheory:K.6/affine-perfect-support-theory, SchemeKTheoryOperations:S.1 | Import additivity and the affine perfect comparison; global Perf(X) is the scheme owner. |
| PAPER-BHATT-SCHOLZE-17/localization-g-theory | GeneralAlgebraicKTheory:K.3/abelian-localization-theorem, GeneralAlgebraicKTheory:K.3/devissage-theorem, SchemeKTheoryOperations:S.2 | Import general Serre localization/devissage; identifying coherent sheaf quotient/support categories is the scheme application, including the K0-surjectivity condition. |
| PAPER-BHATT-MATHEW-21/18 | GeneralAlgebraicKTheory:K.5/excision-data-and-milnor-squares | Algebraic datum and spectrum fibre criterion, with no unrestricted K-excision assertion. |
| PAPER-BHATT-MATHEW-21/90 | GeneralAlgebraicKTheory:K.5/domain-base-change-of-excision-data | Commute excision data with base change to an integral domain. |
| PAPER-BHATT-MATHEW-21/120 | GeneralAlgebraicKTheory:K.6/affine-perfect-support-theory, GeneralAlgebraicKTheory:K.6/noetherian-completion-gluing | Noetherian principal completion gluing uses the vertical perfect-support fibres. |
| PAPER-SCHOLZE-26/36 | GeneralAlgebraicKTheory:K.5/tor-unital-nonunital-rings, GeneralAlgebraicKTheory:K.5/flat-idempotent-ideal-criterion, GeneralAlgebraicKTheory:K.5/tor-unital-excision | Integral Tor-unital excision is proved using Tamme/Part II. The Berkovich consumer must establish its flat unitization model; Banach/almost-module constructions remain its own targets. |

## Remaining mathematical obligations

All ten stages have target-level plans. The following proof-source obligations and precise supplier interfaces remain part of the specification; target coverage does not assert their closure.

### The excision criteria are quoted, not proved

The imported K.5/excision-and-its-failure finite-degree necessity criterion is quoted in Weibel IV.1.11.2 from Suslin/Suslin–Wodzicki. This pass reads and adopts Tamme’s direct proof of all-degree Tor-unital sufficiency, which closes the Scholze consumer contract. It does not prove the converse, truncated criterion, or degree-one necessity. Those three claims in the imported node retain this proof-source gap; obtain and read the original proofs or replace them with a direct classical argument. Square-zero failure must be justified through that remaining criterion or an explicit calculation.

Needed by: `GeneralAlgebraicKTheory:K.5/excision-and-its-failure`.

### The finite Artin K-three calculations underlying the read counterexample remain inputs

Schlichting 2002 §§1.6–1.7, pp.114–115, and the deduction of unequal stable K4 groups were read. The separate Evens–Friedlander 1982 and Aisbett–Lluis-Puebla–Snaith 1985 finite-ring K3 calculations were not obtained and independently read (the attempted AMS PDF was inaccessible). The p=3 test in the imported node particularly needs its precise range checked. Request the finite-Artin extension from KTheoryFiniteLocalFields, Part II; do not treat the old self-request to K.5 as an input.

Needed by: `GeneralAlgebraicKTheory:K.7/naked-triangulated-invariance-counterexample`.

### Supplier interfaces

- **StableHomotopyKTheory:H.4**: Group completion of a symmetric monoidal groupoid, the plus construction, the stable general linear group and the cofinal stabilisation argument, including the Cofinality Theorem for a cofinal monoidal functor with the same automorphism groups (Weibel IV.4.11(b)), which K.2:plus/cofinality-of-projective-modules now uses instead of the late exact-category cofinality. AUDIT-28 records H.4 as owning exactly the comparison K.2:plus needs, so this packet states the plus-equals-Q theorem and cites H.4 for the group-completion side rather than building it.
- **StableHomotopyKTheory:H.1**: The homotopy-theoretic apparatus the K.1 and K.3 proofs use: the classification of coverings by morphism-inverting functors with the maximal-tree presentation of π₁, the fact that a natural transformation gives a homotopy (so adjoints are homotopy equivalences and categories with an initial object are contractible), and the commutation of classifying spaces with filtered colimits. The nodes cite the integrated H.1 nodes coverings-fundamental-group-local-coefficients, natural-transformations-adjoints-contractibility and filtered-colimits-of-categories by id.
- **StableHomotopyKTheory:H.5:S-delooping**: Assemble the connective Ω-spectrum from the iterated S-construction and the natural deloopings |wS.ⁿC| ≃ Ω|wS.ⁿ⁺¹C| supplied by K.4:construction (K.4/delooping-and-the-spectrum), with its indexing π_i = K_i for i ≥ 0. Spectrum assembly consumes that prefix; it is not a prerequisite of additivity or of the relative S-fibration. Generic smash products belong to H.5:spectra, and the K-theory-specific biexact pairings and their coherence to K.7, so the pairing clause of the integrated H.5:S-delooping node should move to K.7.
- **KTheoryLowDegrees:U.6**: The identification of the first homotopy group of the plus construction with the quotient of the stable general linear group by its elementary subgroup, compatibly with determinant and transfer. K.2:low-degree-comparisons imports it by name and does not re-plan it. U.6 also owns the comparison of π₀ and π₁ of K.5's relative fibre for a pair with K₀(I) and K₁(A, I) (U.6/relative-K1-homotopy-comparison); K.5 does not assert it, and U.6 should cite this packet's node GeneralAlgebraicKTheory:K.5/relative-K-theory rather than the integrated decomposition id.
- **KTheoryLowDegrees:Z.1**: Finitely generated projective modules as summands of finite free modules, with complements, scalar extension along arbitrary (noncommutative) unital ring maps and the ring Grothendieck group, and Milnor patching with the K₀ end of the Mayer–Vietoris sequence. These are planned in the KTheoryLowDegrees--U.1 packet and cited here by node id: Z.1/extend-scalars and Z.1/extend-scalars-finite-projective (K.2:plus scalar extension), Z.1/projective-karoubi, Z.1/ring-k0-exact and Z.1/ring-k0-map (the ring model), and Z.1/milnor-finite-projective, Z.1/milnor-boundary, Z.1/milnor-boundary-kernel, Z.1/milnor-exact-at-k0 and Z.1/milnor-exact-at-pair (K.5's Mayer–Vietoris node). The one missing position of Milnor's sequence, exactness at K₁(S) × K₁(T), is planned in K.5 because KTheoryLowDegrees U.5, its natural owner, lies downstream of K.5 (through SchemeKTheoryOperations S.3).
- **K2SymbolsBrauer:T.1:plus**: The identification of the second K-group with the second homology of the stable elementary subgroup and with the second homotopy group of the K-theory space.
- **K2SymbolsBrauer:T.2:symbols**: Matsumoto's presentation of the second K-group of a FIELD by symbols. K.2:low-degree-comparisons states that it is field-specific and imports it from here.
- **K3BlochGroups:V.4**: Suslin's exact sequence relating the third K-group to the Bloch group, which is the explicit degree-three model K.2:low-degree-comparisons registers.
- **StableHomotopyKTheory:H.2**: RT-AREA-ktheory-1/15. The realisation theorem for levelwise homotopy fibration sequences of simplicial spaces, stated and proved in a model the relative S.-construction satisfies: for maps V. → W. → X. of simplicial spaces with compatible basepoints such that each Vₙ → Wₙ → Xₙ is a homotopy fibration sequence (Vₙ → hofib(Wₙ → Xₙ) over the basepoint is a weak equivalence), every Xₙ is connected, and the simplicial spaces are good (degeneracies closed cofibrations, automatic for realisations of multisimplicial sets), the sequence |V.| → |W.| → |X.| is a homotopy fibration sequence, the fibre identification being the canonical map into the homotopy fibre over the realised basepoint, so Ω|X.| → |V.| → |W.| → |X.| is one with the canonical connecting map. Either standard form may be adopted: Waldhausen 1978 (Algebraic K-theory of generalized free products, Lemma 5.2, as quoted in Weibel V.1.7) or Bousfield–Friedlander 1978 (Theorem B.4, for bisimplicial sets, with the π∗-Kan condition and the π₀ fibration condition, both implied when every Xₙ and Wₙ is connected); the locators are the red team's and verifier's and were not re-read here. This is neither the diagonal lemma nor the levelwise-equivalence theorem H.2 already plans, and it must not be stated for arbitrary levelwise fibrations without the connectivity (or π∗-Kan) hypothesis. Consumer: K.4/delooping-and-the-spectrum, which verifies the hypotheses for n ↦ (|wS.C| → |wS.(Sₙf)| → |wS.(SₙB)|).
- **StableHomotopyKTheory:H.4**: Consumers K.2:plus/localised-extension-fibre-equivalence, extension-cartesian-lifts and extension-category-contractibility need the generic monoidal action-localisation results of Weibel IV.4.7.1 and Exercises 4.6–4.7, 4.11: a faithful compatible action with injective automorphism translations gives the homotopy fibration S⁻¹S→S⁻¹E→⟨S,E⟩; a cartesian action localises a fibred functor with localised fibres; if translations already induce realisation equivalences then E→S⁻¹E is a realisation equivalence. H.4 also supplies a homotopy inverse for connected homotopy-associative CW H-spaces. These are generic supplier obligations; the new nodes verify the specific extension-category constructions and do not purport to close H.4.
- **StableHomotopyKTheory:H.2**: Consumer K.4:construction/object-S-additivity needs Waldhausen’s simplicial Theorem-B form (K-spaces Lemma 1.4.B, printed p.337): for f:X→Y, if every order-map pullback between simplex fibres Δ[n]×_Y X is a realisation equivalence, each such pullback square is homotopy cartesian. Obtain this by categorical Theorem B on the category of simplices, its comma-fibre identification, and the natural equivalence from the simplex-category nerve to realisation. This is a generic translation of the existing H.2 Theorem B, not a second K-theory owner.
- **StableHomotopyKTheory:H.2**: The edgewise subdivision realization homeomorphism for d[n]=[n]^op*[n]. The K-theory-specific swallowing comparison is already supplied by K.4:construction/weak-double-nerve-swallow in the imported part.
- **StableHomotopyKTheory:H.2**: K.4/approximation-comma-contractibility and K.4/iterated-mapping-cylinder need the last-vertex map |N simp(X)|→|X| and its realisation equivalence, the left-adjoint retraction to nondegenerate simplex posets for nonsingular X, representation of homotopy classes by finite subdivided sphere maps into a simplicial realisation, and CW Whitehead for weakly contractible classifying spaces (Waldhausen proof1.6.7, printed pp.355,359/PDF38,42). These are generic homotopy supplier results, independent of K-theory. The finite sphere and connectedness hypotheses must be retained.
- **StableHomotopyKTheory:H.1**: For a nonempty small category, if every functor from a finite poset contracts by natural-transformation zigzags, its nerve realization is contractible. Use finite two-point posets for connectedness and finite subdivisions of sphere maps for higher groups; do not apply the hypothesis to an infinite discrete component set. Also provide TheoremA for the weak-equivalence comma categories. Needed by `GeneralAlgebraicKTheory:K.4/approximation-factorization-comma`, `GeneralAlgebraicKTheory:K.4/acyclic-cofibrations-with-factorizations`.
- **StableHomotopyKTheory:H.1**: For an abelian discrete group G, the realization of its bar nerve BG has loop space equivalent to G_discrete, with the loop class map equal to the bar generator. The finite class-weak filtration proof imports this elementary space result; spectrum assembly belongs to H.5 subsequent. Needed by `GeneralAlgebraicKTheory:K.3/cofinality-with-factorizations`.
- **StableHomotopyKTheory:H.1**: Nerve homotopies from natural transformations and the good degreewise-realization lemma for the evaluation/constant-string swallowing comparison, naturally in the S direction. Needed by `GeneralAlgebraicKTheory:K.4:construction/weak-double-nerve-swallow`.
- **StableHomotopyKTheory:H.2**: Nerve homotopies from natural transformations and the good degreewise-realization lemma for the evaluation/constant-string swallowing comparison, naturally in the S direction. Needed by `GeneralAlgebraicKTheory:K.4:construction/weak-double-nerve-swallow`.
- **StableHomotopyKTheory:H.5:spectra**: A homotopy-fibre sequence of right E-module spectra retains its module boundary. Specify the suspension orientation: right multiplication has no sign, moving a degree-i left coefficient across a degree−1 boundary contributes(−1)^i. K3/localization-product-boundary applies this generic fact to exact-category localisation; early ring products alone do not prove it. Needed by `GeneralAlgebraicKTheory:K.3/localization-product-boundary`.
- **KTheoryLowDegrees:U.1**: Early classical projective K0 and stable-matrix elementary/Whitehead calculus, used by K.2:plus/zero-one-ring-comparison. These are imported constructions, not owned anew here.
- **KTheoryLowDegrees:U.2**: Classical ring K1=GL/E and its stabilized automorphism class with scalar-extension naturality, for K.2:plus/zero-one-ring-comparison. The relative U.6 comparison is not a prerequisite.
- **StableHomotopyKTheory:H.3**: The based plus fundamental-group quotient π1(X+) = π1(X)/P and its map-level naturality, with P perfect normal, for the absolute degree0/1 ring comparison. No rational Hurewicz theorem is requested here; that belongs to H.6.
- **StableHomotopyKTheory:H.5:spectra**: The generic spectrum toolkit K.6 and K.7 build on: homotopy pushouts and cofibres, loops and desuspensions, homotopy colimits of sequences, connective covers, homotopy fibres with their long exact sequences, stable homotopy groups indexed by all integers, and the smash product of spectra with its associativity, unit and symmetry and the sign of the twist on S^p ∧ S^q. K.7/products-from-biexact-functors builds the K-theoretic pairing K(A) ∧ K(B) → K(C) on this smash product and is its only owner; H.5:spectra is asked for the generic smash product only. Needed by `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`, `GeneralAlgebraicKTheory:K.6/milnor-square-excision-in-nonpositive-degrees`, `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `GeneralAlgebraicKTheory:K.7/graded-commutativity`.
- **StableHomotopyKTheory:H.5:S-delooping**: The connective K-theory spectrum of a small Waldhausen category, and of an exact category, assembled from the iterated S-construction and the deloopings of K.4:construction (K.4/delooping-and-the-spectrum), functorial in exact functors and natural transformations; applied to the early ring model of K.2:plus it is the functorial model of connective K-theory of rings that the Bass delooping takes as input. No product structure is asked of spectrum assembly: the pairing is K.7's (RT-AREA-ktheory-1/4). This request replaces the earlier request to GeneralAlgebraicKTheory:K.3, which does not construct Waldhausen spectra. Needed by `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`.
- **StableHomotopyKTheory:H.3**: The absolute degree-one comparison K.6 uses, from H.3's plus construction: for a connected space X and a perfect normal subgroup P of π_1X, π_1(X⁺_P) = π_1(X)/P, natural for maps carrying the selected perfect subgroup into the selected one; applied to X = BGL(R) and P = E(R) (perfect, by the Whitehead lemma of KTheoryLowDegrees U.1), this gives π_1 BGL(R)⁺ ≅ GL(R)/E(R) = K_1(R) (KTheoryLowDegrees U.2's classical K_1), natural in unital ring maps, and compatible with matrix loops: the loop in BGL(R) given by g ∈ GL_n(R) goes to the class of g in GL(R)/E(R). With the plus = Q comparison (K.2:plus/plus-equals-Q) this identifies the classical K_1 with the first homotopy group of the K-theory space, which K.6 uses for the class [t] of the unit t ∈ ℤ[t,t⁻¹] and for applying the contraction to the classical K_1–K_0 Mayer–Vietoris sequence. K.6 cites H.3 rather than K.2:low-degree-comparisons/explicit-low-degree-models or KTheoryLowDegrees U.6, which lie downstream of K.6 in the assembled atlas. Needed by `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`, `GeneralAlgebraicKTheory:K.6/mayer-vietoris-for-negative-k`.
- **StableHomotopyKTheory:H.1**: The Segal subdivision of a small category has naturally homotopy-equivalent nerve realization, and a nonempty filtered poset has contractible nerve. Needed in the resolution-fibre and directed-lattice comma models. Needed by `GeneralAlgebraicKTheory:K.6/projective-line-resolution-fibres`, `GeneralAlgebraicKTheory:K.6/projective-line-directed-lattices`.
- **StableHomotopyKTheory:H.4**: Monoidal localization of an acted-on category preserves an equivariant nerve equivalence and is itself a nerve equivalence when every action acts invertibly on the nerve. For the split exact chart category P, a cofinal monoidal functor isoVB→isoP gives contractibility of the localized extension category and base-change fibre comparisons. Retain the actual action and cofinality hypotheses, not an arbitrary nonsplit direct-sum group-completion claim. Needed by `GeneralAlgebraicKTheory:K.6/projective-line-resolution-fibres`, `GeneralAlgebraicKTheory:K.6/projective-line-localisation-comparison`.
- **StableHomotopyKTheory:H.1**: Verdier localization/common-roof calculus for a triangulated stable category and a triangulated subcategory: derived full faithfulness/essential surjectivity produce the common roof diagram11.16, with stable commutativity witnessed by maps through projective-injectives. This is the categorical input to the explicit Frobenius strictification, not an assertion that every Frobenius category has a functorial cylinder. Needed by `GeneralAlgebraicKTheory:K.6/frobenius-roof-strictification`.
- **StableHomotopyKTheory:H.2**: Objectwise natural weak equivalences of exact functors induce natural transformations on each wS_n category; the nerve homotopies realize to the same homotopy of K-spaces. Preserve the good realization assumptions used in K.4. Needed by `GeneralAlgebraicKTheory:K.6/frobenius-replacement-category`.
- **StableHomotopyKTheory:H.5:spectra**: Filtered homotopy colimits of spectra commute with finite homotopy limits, specifically fib(X_i→Y_i), and a constant spectrum has itself as hocolim over a nonempty filtered index. These map-level comparisons are needed for nonunital unitization fibres; group-level unital continuity alone does not provide them. Needed by `GeneralAlgebraicKTheory:K.7/nonunital-filtered-continuity`.
- **StableHomotopyKTheory:H.1**: A natural isomorphism of exact multifunctors gives a natural transformation of their weak-map S-grid categories and a nerve homotopy, compatible with the pentagon/triangle/symmetry diagrams. Needed by `GeneralAlgebraicKTheory:K.7/biexact-pairing-coherence`.
- **StableHomotopyKTheory:H.5:spectra**: Assemble compatible multilinear pairings on iterated deloopings into smash pairings of spectra; preserve natural associativity/unit/symmetry diagrams and the degree(−1)^{ij} of the sphere twist. A commutative/E∞ ring-spectrum claim additionally needs the full coherent multilinear recognition theorem. The K-theoretic grids are owned by early K.7:products. Needed by `GeneralAlgebraicKTheory:K.7/biexact-stabilized-pairing`, `GeneralAlgebraicKTheory:K.7/biexact-pairing-coherence`.
- **KTheoryFiniteLocalFields:L.1**: For the stable Artin counterexample, K3(Fp) is cyclic of order p²−1 and K4(Fp)=0; this is the single-owner higher finite-field calculation, including agreement with the exact ring K model. Needed by `GeneralAlgebraicKTheory:K.7/stable-artin-k-fibration`.
- **StableHomotopyKTheory:H.4**: Symmetric monoidal group completion of the finite-projective core, functorial for strong symmetric monoidal functors, and its connective-spectrum recognition. Compare its stabilized automorphism loops with the plus/Q map, not merely its component group. Needed by `GeneralAlgebraicKTheory:K.2:plus/symmetric-monoidal-projective-model`.
- **StableHomotopyKTheory:H.5:spectra**: Filtered colimits of connective spectra commute with homotopy groups and with the model comparisons used by the projective core completion. Needed by `GeneralAlgebraicKTheory:K.7/compared-model-filtered-continuity`.
- **EnhancedDerivedSheaves:E5:abstract**: Derived tensor/Hom of modules, with the unitization augmentation Tor calculation; enhanced bounded categories of the finite torsion heart and support complexes. This supplies carriers only, not the Dedekind or Tor-unital excision theorem. Needed by `GeneralAlgebraicKTheory:K.5/tor-unital-nonunital-rings`, `GeneralAlgebraicKTheory:K.3/dedekind-S-localization-and-torsion`.
- **tauceti:TauCetiRoadmap/DGAInfinity#layer-5-derived-modules-twisted-complexes-and-perfect-envelopes**: Reuse enhanced derived modules and perfect envelopes. Additional exact-category finite-resolution/fully-exact criteria needed by the exact-versus-split fibre are a DGAInfinity, Part II supplier extension, with Keller 11.7/12.1 hypotheses retained. Needed by `GeneralAlgebraicKTheory:K.6/affine-perfect-support-theory`, `GeneralAlgebraicKTheory:K.6/exact-versus-split-fibre`.
- **tauceti:TauCetiRoadmap/DGAInfinity#layer-7-dg-and-a-quotients-verdier-comparison-and-k₀-localization**: Reuse enhanced quotients and their Verdier comparison. The affine principal-open support/compact localization interface must retain idempotent completion; global scheme K-theory is not imported back into K.6. Needed by `GeneralAlgebraicKTheory:K.6/affine-perfect-support-theory`.
- **GeometryOfNumbersAndQuadraticArithmetic:GN.6**: Geometry of numbers, quadratic forms and homogeneous arithmetic, Part II: provide the actual stable Poincaré category and structure family, Poincaré–Verdier localization criterion with K0-surjectivity, generic symmetric-heart L theorem, finite-length symmetric/antisymmetric Witt devissage, K/GW/L fundamental fibre comparison and filtered continuity. Lemma 2.2.1 of Calmès III additionally needs the restriction-of-scalars duality criterion N≃RHom_A(B,M) for B perfect over A. Existing exact-category Qʰ and GW fibre nodes alone do not provide these stable results. The already-owned residue-line and symmetric GW localization nodes are cited directly. Needed by `GeneralAlgebraicKTheory:K.3/dedekind-poincare-localization`, `GeneralAlgebraicKTheory:K.3/shifted-torsion-duality`, `GeneralAlgebraicKTheory:K.3/symmetric-torsion-devissage`, `GeneralAlgebraicKTheory:K.3/lattice-linking-boundary`.
- **HermitianKTheoryOfPoincareCategories:HK.0**: Import the flavour-family/shift convention with a canonical residue coefficient and the full integer shift indexing; retain the underlying GN.6 stable Poincaré supplier obligations. Needed by `GeneralAlgebraicKTheory:K.3/dedekind-poincare-localization`.
- **HermitianKTheoryOfPoincareCategories:HK.6**: Import the symmetric-heart and surgery interface used to reduce L of the torsion category to its finite-length Witt groups, with no invertibility-of-two assumption for symmetric forms. Needed by `GeneralAlgebraicKTheory:K.3/symmetric-torsion-devissage`.
- **HermitianKTheoryOfPoincareCategories:HK.7**: Comparison of quadratic and symmetric flavours after 2 is invertible, not an unconditional integral identification. Needed by `GeneralAlgebraicKTheory:K.3/dyadic-quadratic-devissage-boundary`.
- **GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3**: The periodic quadratic integer/field L computations needed to refute the naive dyadic residue sequence. Use the actual staged arithmetic tables, not genuine-symmetric groups. Needed by `GeneralAlgebraicKTheory:K.3/dyadic-quadratic-devissage-boundary`.
- **KTheoryFiniteLocalFields:L.5**: KTheoryFiniteLocalFields, Part II: verify the finite-Artin K3 inputs used by Schlichting 2002 for Z/p² and Fp[ε]/ε², including the prime range and p=3 case. The original sources remain a proof-audit gap; this is not supplied by the old self-request to K.5. Needed by `GeneralAlgebraicKTheory:K.7/naked-triangulated-invariance-counterexample`.

### Outgoing interfaces

- **SchemeKTheoryOperations:S.5**: An ownership handoff, not an input: no node of this packet depends on S.5, and no edge S.5 → K.6 may be added, since K.6 precedes S.2 to S.5 in the atlas and the edge would close a cycle. S.5 owns the scheme forms and imports the ring theorems of K.6. (1) Thomason's projective line and projective bundle theorems for quasi-compact quasi-separated schemes, compared for X = Spec R with K.6/projective-line-over-a-ring and K.6/projective-line-splitting (the source identifies VB(P¹_R) with the vector bundles on the scheme P¹_R only for commutative R). (2) The Fundamental Theorem for schemes (K-book V.8.3, Thomason–Trobaugh 6.6(b)), compared on affine schemes with K.6/fundamental-theorem-with-nil-terms and K.6/nil-groups-are-NK. (3) The scheme clause removed from K.6/agreement-and-vanishing-of-negative-K by RT-AREA-ktheory-1/17: for a quasi-compact quasi-separated scheme X, IK_i(X) ≅ Thomason's K^B_i(X) for i ≤ 0 (Schlichting, Theorem 7.1, proved there from Thomason's projective line theorem and Thomason–Trobaugh 6.6(b)), keeping the qcqs hypotheses and giving, for X = Spec R, the explicit comparison with the ring clause of K.6/agreement-and-vanishing-of-negative-K and with K.6/bass-spectrum-homotopy-groups.
- **SchemeKTheoryOperations:S.2**: An ownership handoff, not an input: the second scheme clause removed from K.6/agreement-and-vanishing-of-negative-K by RT-AREA-ktheory-1/17. For a noetherian scheme X, negative G-theory vanishes: IK_n(Coh(X)) = 0 for n < 0, as the instance for the small noetherian abelian category Coh(X) of the theorem K.6/agreement-and-vanishing-of-negative-K proves for noetherian abelian categories, with an explicit comparison of S.2's nonconnective G-theory with IK of Coh(X). No node of this packet depends on S.2.
- **SchemeKTheoryOperations:S.6**: An ownership handoff, not an input: external products for schemes, supports and relative theories, and the graded commutativity of the total K-group of a scheme, are S.6's and extend K.7/products-from-biexact-functors and K.7/graded-commutativity, which S.6 imports. AUDIT-28 records this as a duplication with K.7; the ring-level pairing is developed here. The former prerequisite of K.7/graded-commutativity on S.6 was the reverse of the stage order (S.6 requires K.7) and is removed.
- **KTheoryLowDegrees:U.6**: An ownership handoff, not an input: the spectrum form of the degree-one clause of Bass's excision for a Milnor square (f : R → S carrying a two-sided ideal I bijectively onto an ideal J). U.6 proves that π_1 𝕂(R, I) → π_1 𝕂(S, J) is onto, equivalently that the birelative term of relative nonconnective K-theory is concentrated in degrees ≥ 1 (the 'even ≥ 1' of Clausen–Mathew–Morrow, Proposition 4.34), from its identification of π_1 of the relative fibre of GeneralAlgebraicKTheory:K.5/relative-K-theory with GL(I)/E(R, I) (U.6/relative-K1-homotopy-comparison), the classical surjectivity K_1(R, I) → K_1(S, J) (the exactness at K_1(S) ⊕ K_1(R/I) of GeneralAlgebraicKTheory:K.5/milnor-square-mayer-vietoris), and the agreement of connective and nonconnective relative theory in degrees ≥ 0 (K.6/bass-spectrum-homotopy-groups). K.6 proves the isomorphisms in degrees ≤ 0 (K.6/milnor-square-excision-in-nonpositive-degrees) and records only the classical degree-one surjectivity; no node of this packet depends on the spectrum form, because U.6 lies downstream of K.6 in the assembled atlas. The early K5/ideal-degree-zero-excision now supplies relative π0 with its actual boundary and patched-module comparison. For CMM4.34, compare absolute K→KB in all degrees≥0 and then take two fibres; use henselian K0-isomorphism and K1-surjectivity for connective relative1-connectivity. Do not infer relative π0 from negative absolute MV. The extra nonconnective birelative1-connectivity needs the positive relativeπ1 surjection after U6’s comparison;0-connectivity suffices for the cartesian square.
- **SchemeKTheoryOperations:S.3**: Ownership handoff, not an input: for the Bhatt–Scholze Corollary 5.6 consumer, supply filtered continuity of perfect-complex K-theory with a compatibly finitely presented support datum, as in TT 3.20. The present ring continuity and affine principal-support model are inputs, not a replacement for arbitrary global support theory.

## Pinned inputs

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Use the following existing declarations at their stated strength. The source records in the packet retain the statement-checking evidence.

| Existing declaration | Module | Interface |
| --- | --- | --- |
| mathlib:CategoryTheory.Core | Mathlib/CategoryTheory/Core.lean | The maximal subgroupoid of a category, the groupoid of isomorphisms that the plus comparison localises. |
| mathlib:CategoryTheory.Idempotents.Karoubi | Mathlib/CategoryTheory/Idempotents/Karoubi.lean | The idempotent completion, the standard witness that cofinality changes the group in degree zero. |
| mathlib:CategoryTheory.Limits.HasFilteredColimits | Mathlib/CategoryTheory/Limits/Filtered.lean | The property that a category admits filtered colimits. This does not construct filtered colimits of categories or prove their nerve compatibility; those are StableHomotopyKTheory H.1 inputs. |
| mathlib:CategoryTheory.Limits.HasPushouts | Mathlib/CategoryTheory/Limits/Shapes/Pullback/HasPullback.lean | The generic existence property for pushouts. Waldhausen data require chosen pushouts only along cofibrations, not this stronger all-pushouts property. |
| mathlib:CategoryTheory.ObjectProperty.IsSerreClass | Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean | Serre classes in an abelian category, the hypothesis of Quillen's localisation theorem; the localisation long exact sequence itself is absent. |
| mathlib:CategoryTheory.nerve | Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean | The nerve of a category, the first ingredient of the K-theory space. |
| mathlib:HomotopyGroup | Mathlib/Topology/Homotopy/HomotopyGroup.lean | The homotopy groups of a pointed space, the third; no K-theory space is built from these three at the pins. |
| mathlib:LinearMap.ker_eq_range_of_comp_eq_id | Mathlib/Algebra/Module/Submodule/Range.lean | The complement is the image of the complementary idempotent, the other half. |
| mathlib:Module.Finite.exists_comp_eq_id_of_projective | Mathlib/RingTheory/Finiteness/Projective.lean | A finitely generated projective module is a retract of a finite free module, the module-theoretic half of K.2:plus's cofinality node. |
| mathlib:ModuleCat.extendScalars | Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean | Extension of scalars between module categories, pinned between commutative rings only. The functor along an arbitrary unital ring map is KTheoryLowDegrees:Z.1/extend-scalars, which agrees with this one for commutative rings; K.2:plus cites this declaration only for that comparison. |
| mathlib:SSet.toTop | Mathlib/AlgebraicTopology/SingularSet.lean | The realisation of a simplicial set, the second ingredient. |
| mathlib:Unitization | Mathlib/Algebra/Algebra/Unitization.lean | The canonical unitisation of a nonunital ring with its universal property, exactly the unitisation K.5 specifies; nothing K-theoretic is built on it at the pins. |
| tauceti:TauCeti.ExactK0 | TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean | The Grothendieck group of an exact category, which the fundamental-group theorem of K.1 identifies with the first homotopy group of the Q-construction. |
| tauceti:TauCeti.ExactK0.mapEquiv | TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean | Invariance of that group under an exact equivalence, likewise. |
| tauceti:TauCeti.ExactK0.ofLE_surjective | TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean | The comparison of the Grothendieck groups of two exact structures on one category, which the audit records is NOT cofinality; K.3's cofinality node says so. |
| tauceti:TauCeti.ExactK0.transportEquiv | TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean | Invariance of that group under the transport, the degree-zero form of the independence K.1 states in every degree. |
| tauceti:TauCeti.ExactStructure | TauCeti/CategoryTheory/Exact/ExactStructure.lean | Quillen exact structures on an additive category, with conflations and admissible monomorphisms and epimorphisms. This is the stated input of K.1 and it is fully built; the Q-construction is built ON it, not instead of it. |
| tauceti:TauCeti.ExactStructure.isConflationExact_split | TauCeti/CategoryTheory/Exact/Functor.lean | Every additive functor is conflation-exact for split exact structures. This is why scalar extension on finitely generated projectives needs no flatness hypothesis, which is what K.2:plus asks for. |
| tauceti:TauCeti.ExactStructure.resolutionEquiv | TauCeti/CategoryTheory/GrothendieckGroup/ProjectiveResolution.lean | The degree-zero resolution isomorphism, proved under the stronger hypothesis that every resolving object is projective; K.3 states the general theorem in every degree and cites this as the pinned special case. |
| tauceti:TauCeti.ExactStructure.transport | TauCeti/CategoryTheory/Exact/Equivalence.lean | Transport of an exact structure along an additive equivalence, the pinned half of K.1's small-model target. |
| tauceti:TauCeti.moduleResolutionEquiv | TauCeti/Algebra/Category/ModuleCat/CartanMap.lean | The instance of that isomorphism for modules with finite projective resolutions. |
| tauceti:TauCeti.simpleClassBasis | TauCeti/RepresentationTheory/GrothendieckGroup/SimpleBasis.lean | The Grothendieck group of finitely generated modules over an artinian ring is free on the simple classes, which is devissage in degree zero; K.3 states the theorem in every degree. |
| tauceti:TauCeti.finiteProjectiveModules | TauCeti/Algebra/Category/ModuleCat/CartanMap.lean | Object property of finitely generated projective R-modules, R : Type u. Its full subcategory has an anonymous EssentiallySmall.{u} instance in this pinned file (CartanMap.lean, section 'Essential smallness'; not indexed by name), which fixes the universe of ExactK0 and of K(R) at u. |
| tauceti:TauCeti.finiteProjectiveModulesExactStructure | TauCeti/Algebra/Category/ModuleCat/CartanMap.lean | Existing exact structure on the full subcategory of finitely generated projectives; import this carrier rather than reconstruct it. |
| tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split | TauCeti/Algebra/Category/ModuleCat/CartanMap.lean | The induced exact structure is equal to the split structure. This is the input that makes arbitrary scalar extension exact on projectives. |
| tauceti:TauCeti.finiteProjectiveModulesExactStructure_conflation_iff | TauCeti/Algebra/Category/ModuleCat/CartanMap.lean | Conflations are exactly short exact sequences after inclusion in ModuleCat R. |
| tauceti:TauCeti.ExactK0.of | TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean | Existing object-class map to ExactK0; the π₁ comparison must preserve this map. |
| tauceti:TauCeti.ExactK0.of_conflation | TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean | Existing conflation-additivity relation for the class map. |
| tauceti:TauCeti.ExactK0.liftEquiv | TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean | Existing universal property: conflation-additive invariants are additive homomorphisms out of ExactK0. |
| tauceti:TauCeti.ExactK0.lift | TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean | The homomorphism out of ExactK0 induced by a conflation-additive invariant; the map from ExactK0 to the fundamental group of the Q-construction is this lift of the two-edge loops. |
| tauceti:TauCeti.ExactK0.hom_ext | TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean | Two homomorphisms out of ExactK0 agreeing on object classes are equal; it checks one composite of the fundamental-group comparison. |
| tauceti:TauCeti.ExactK0.AdditiveInvariant | TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean | An isomorphism-invariant, conflation-additive function on objects with values in an abelian group: the datum ExactK0.lift consumes. Its values must lie in a commutative group, which is why the fundamental-group node proves commutativity before lifting. |
| tauceti:TauCeti.ExactStructure.conflation_baseChange | TauCeti/CategoryTheory/Exact/BaseChange.lean | Base change of a conflation along any morphism is a conflation with the same kernel: the admissible-epimorphism half of composition in Q, and the dual step of the exact category of conflations. |
| tauceti:TauCeti.ExactStructure.conflation_cobaseChange | TauCeti/CategoryTheory/Exact/BaseChange.lean | Cobase change of a conflation along any morphism is a conflation with the same cokernel (Bühler, Proposition 2.12); an input of the 3×3 lemma and of the exact category of conflations. |
| tauceti:TauCeti.ExactStructure.conflation_comp_of_isPullback | TauCeti/CategoryTheory/Exact/BaseChange.lean | The pullback of a deflation along an inflation is a kernel of the composite deflation, so the pullback of an admissible monomorphism along an admissible epimorphism is an admissible monomorphism (Bühler, Proposition 2.15). It is the admissible-monomorphism half of composition in Q and is proved from E1op and the kernel property alone, without Quillen's axiom (c). |
| tauceti:TauCeti.ExactStructure.exists_conflation_comp | TauCeti/CategoryTheory/Exact/BaseChange.lean | The Noether isomorphism for a composite of two inflations (Bühler, Lemma 3.5), the last step of the 3×3 lemma. |
| tauceti:TauCeti.ExactStructure.bicartesianSq_of_isPushout_of_isInflation | TauCeti/CategoryTheory/Exact/Bicartesian.lean | A pushout of an inflation is a bicartesian square (Bühler, Proposition 2.12), used in the 3×3 lemma. |
| tauceti:TauCeti.ExactStructure.conflation_biprod | TauCeti/CategoryTheory/Exact/Biproduct.lean | A biproduct of two conflations is a conflation; it makes the coproduct functor into the exact category of conflations exact. |
| tauceti:TauCeti.ExactStructure.ConflationCategory | TauCeti/CategoryTheory/Exact/Conflation.lean | The category of conflations of an exact structure: the full subcategory of short complexes on the conflations, with its three projection functors and functoriality in conflation-exact functors. It is the carrier of the extension category E(A) that K.3 makes exact; the pinned file puts no exact structure on it. |
| mathlib:RingHom.pullback | Mathlib/RingTheory/LocalRing/Pullback.lean | The pullback of two ring maps as a subring of the product, for arbitrary (noncommutative) rings: the ring B of a Milnor square. |
| mathlib:RingHom.pullback_comm_sq | Mathlib/RingTheory/LocalRing/Pullback.lean | The pullback square of rings commutes, which makes the composite of the first two maps of the Milnor sequence vanish. |
| mathlib:Ideal.Quotient.ring | Mathlib/RingTheory/Ideal/Quotient/Defs.lean | The quotient of a possibly noncommutative ring by a two-sided ideal ([I.IsTwoSided]) is a ring; it is the quotient map through which K.5 treats a pair (A, I) without narrowing to commutative rings. |
| tauceti:TauCeti.ExactStructure.abelian | TauCeti/CategoryTheory/Exact/Abelian.lean | The canonical exact structure of all short exact sequences on an abelian category: the ambient structure of Gillet–Waldhausen's closure hypothesis, where the ambient abelian category is data. |
| tauceti:TauCeti.ExactStructure.fullSubcategory | TauCeti/CategoryTheory/Exact/ExtensionClosed.lean | The exact structure induced on an extension-closed full subcategory; with ExactStructure.abelian it presents an exact category inside a given abelian category, the form in which the K-book's Definition II.7.0 is used here. |
| mathlib:CategoryTheory.Functor.IsEquivalence | Mathlib/CategoryTheory/Equivalence.lean | Equivalence of categories, the hypothesis of the invariance statements; the enhanced version K.7 needs is not pinned and the comparison node says so. |
| mathlib:CategoryTheory.ObjectProperty.IsTriangulated | Mathlib/CategoryTheory/Triangulated/Subcategory.lean | Triangulated subcategories, pinned; the input to a Verdier quotient, which is not itself pinned. |
| mathlib:CategoryTheory.ObjectProperty.trW | Mathlib/CategoryTheory/Triangulated/Subcategory.lean | The class of maps whose cone lies in a triangulated subcategory, pinned; the morphisms a Verdier quotient inverts. |
| mathlib:IsMoritaEquivalent | Mathlib/RingTheory/Morita/Basic.lean | The Morita equivalence predicate, pinned; K.7 supplies the K-theoretic consequence, which is absent. |
| mathlib:IsMoritaEquivalent.matrix | Mathlib/RingTheory/Morita/Matrix.lean | The instance that a ring is Morita equivalent to its matrix ring, pinned and cited by the invariance node. |
| mathlib:IsNilpotent | Mathlib/Algebra/GroupWithZero/Basic.lean | Nilpotence of an element (some power is zero), the condition on the endomorphisms of the Nil category. |
| mathlib:LaurentPolynomial | Mathlib/Algebra/Polynomial/Laurent.lean | The Laurent polynomial ring, the third term of that sequence and the ring whose K-theory the fundamental theorem decomposes. |
| mathlib:Matrix | Mathlib/LinearAlgebra/Matrix/Defs.lean | Matrices, out of which the cone ring and the infinite matrix ring of the flasque and axiom nodes are built. |
| mathlib:ModuleCat | Mathlib/Algebra/Category/ModuleCat/Basic.lean | The category of modules over a ring, not necessarily commutative; the components of the glued triples of the projective line over a ring live in it. |
| mathlib:ModuleCat.matrixEquivalence | Mathlib/RingTheory/Morita/Matrix.lean | The equivalence between modules over a ring and modules over its matrix ring, which is the pinned form of the Morita instance K.7 cites. |
| mathlib:Polynomial | Mathlib/Algebra/Polynomial/Basic.lean | The polynomial ring in one variable, one of the two rings in the four-term sequence that defines the contraction. |
| mathlib:RingHom | Mathlib/Algebra/Ring/Hom/Defs.lean | Ring maps, the morphisms of the functors this layer defines. |
| mathlib:TensorProduct | Mathlib/LinearAlgebra/TensorProduct/Defs.lean | The tensor product, the biexact functor from which the external products of K.7 are built. |
| tauceti:TauCeti.ExactStructure.IsFrobenius | TauCeti/CategoryTheory/Exact/Frobenius.lean | The Frobenius condition on an exact structure, PINNED in Tau Ceti: it is the hypothesis of the second construction of K.6, and the packet cites it rather than defining it again. |
| tauceti:TauCeti.ExactStructure.split_isFrobenius | TauCeti/CategoryTheory/Exact/Frobenius.lean | The split exact structure is Frobenius, pinned; it is the degenerate unit test of the Frobenius-pair node. |
| tauceti:TauCeti.SplitK0 | TauCeti/CategoryTheory/GrothendieckGroup/Split.lean | The split model of the zeroth K-group, in which the pinned product statement is proved. |
| tauceti:TauCeti.SplitK0.of_mul_of | TauCeti/CategoryTheory/GrothendieckGroup/Monoidal.lean | The pinned statement that the product of the classes of two objects is the class of their tensor product, the degree-zero unit test of K.7's product. |

## Source conventions and corrections

Each node gives theorem/section and page locators. Chapter PDFs, combined-book pagination and preprint pagination are distinct. The packet records versions, access dates and reading boundaries; an imported source record does not imply an independent reading of every cited page. The main source additions use the public preprints listed below.

- **Weibel.KBook.II**: Charles A. Weibel, [The K-book: An introduction to algebraic K-theory, Chapter II: The Grothendieck group K_0](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf). Author's online chapter file Kbook.II.pdf, 106 pages; chapter page numbers equal PDF page numbers.
- **Weibel.KBook.III**: Charles A. Weibel, [The K-book: An introduction to algebraic K-theory, Chapter III: K_1 and K_2 of a ring](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf). Author's online chapter file Kbook.III.pdf, 73 pages; chapter page numbers equal PDF page numbers.
- **Weibel.KBook.IV**: Charles A. Weibel, [The K-book: An introduction to algebraic K-theory, Chapter IV: Definitions of higher K-theory](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf). Author's online chapter file Kbook.IV.pdf, 93 pages; chapter page numbers equal PDF page numbers.
- **Weibel.KBook.V**: Charles A. Weibel, [The K-book: An introduction to algebraic K-theory, Chapter V: The fundamental theorems of higher K-theory](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf). Author's online chapter file Kbook.V.pdf, 90 pages; chapter page numbers equal PDF page numbers.
- **Buhler.ExactCategories**: Theo Bühler, [Exact categories](https://arxiv.org/pdf/0811.1480v2). arXiv:0811.1480v2 (22 April 2009), 67 pages, the preprint of Expositiones Mathematicae 28 (2010), 1–69; printed page numbers equal PDF page numbers of the arXiv file. The journal version was not read.
- **Waldhausen.KSpaces**: Friedhelm Waldhausen, [Algebraic K-theory of spaces](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/kspaces.pdf). 1985 LNM1126, pp.318–419; public101-page scan. Explicit PDF/printed-page pairs are given at each locator; the scan omits a subsequent page, so no global offset is used.
- **Schlichting.NegativeK.2003**: Marco Schlichting, [Negative K-theory of derived categories](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf). Author preprint dated16June2003,28pages; no assertion about the published2006 edition.
- **ThomasonTrobaugh.1990**: Robert W. Thomason and Thomas Trobaugh, [Higher algebraic K-theory of schemes and of derived categories](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/tt.pdf). Published chapter in The Grothendieck Festschrift, vol.III (1990), pp.247–435; institutional two-page-spread scan, not a preprint.
- **Quillen.Higher1973**: Daniel Quillen, [Higher algebraic K-theory:I](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf). LNM341 (1973); Rochester-hosted scan; top typescript and bottom publication pagination differ
- **Kbook.2013**: Charles A. Weibel, [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf). Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013)
- **CMM.2021**: Dustin Clausen, Akhil Mathew and Matthew Morrow, [K-theory and topological cyclic homology of henselian pairs](https://arxiv.org/pdf/1803.10897v2). arXiv:1803.10897v2 (20 July 2020, the revised and final version); published in J. Amer. Math. Soc. 34 (2021), 411–473, which was not compared.
- **Quillen.HigherI.1973**: Daniel Quillen, [Higher algebraic K-theory I](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf). Rochester-hosted scan of Higher algebraic K-theory I, Lecture Notes in Mathematics 341 (1973), publication pp.85–147. Each page has separate typescript and publication numbering; PDF54–59 has typescript130–135 and publication138–143.
- **Kbook.V.chapter**: Charles A. Weibel, [The K-book, separately hosted author chapterV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf). Author chapter downloaded2026-10-02; distinguish its chapter pagination from the combined2013 draft.
- **Thomason.Classification.1997**: R. W. Thomason, [The classification of triangulated subcategories](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/8FA43E2F659E004A21FE2F0652743CE8/S0010437X97000067a.pdf/div-class-title-the-classification-of-triangulated-subcategories-div.pdf). Published Compositio Mathematica105 (1997), pp.1–27; Cambridge-hosted PDF.
- **TT.HigherK.1990**: R. W. Thomason and Thomas Trobaugh, [Higher algebraic K-theory of schemes and of derived categories](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/tt.pdf). Published chapter in The Grothendieck FestschriftIII, pp.247–435. Institutional scan,95 two-page spreads.
- **Karoubi.Derived.1970**: Max Karoubi, [Foncteurs dérivés et K-théorie](https://webusers.imj-prg.fr/~max.karoubi/Publications/07.pdf). Séminaire Heidelberg–Saarbrücken–Strasbourg1967/68, ExposéIV, Lecture Notes in Mathematics136(1970),107–186; author scan80pages.
- **Karoubi.Bott.1971**: Max Karoubi, [La périodicité de Bott en K-théorie générale](https://webusers.imj-prg.fr/~max.karoubi/Publications/09.pdf). Annales scientifiques de l’École Normale Supérieure,4e série4(1971),63–95; Numdam digitized published copy on author site.
- **Schlichting.TriangulatedCounterexample.2002**: Marco Schlichting, [A note on K-theory and triangulated categories](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlk.pdf). Inventiones Mathematicae150(2002),111–116,DOI10.1007/s00222-002-0231-1. Published institutional scan.
- **Neeman.NegativeCounterexample.2021**: Amnon Neeman, [A counterexample to vanishing conjectures for negative K-theory](https://arxiv.org/pdf/2006.16536v2). arXiv:2006.16536v2,30January2021
- **CardenasPedersen.Filtration.1997**: Manuel Cárdenas and Erik Kjær Pedersen, [On the Karoubi filtration of a category](https://archive.mpim-bonn.mpg.de/547/1/preprint_1995_16.pdf). MPIM1995-16 preprint,1995; finalK-Theory12(1997),165–191
- **CarlssonPedersen.Controlled.1995**: Gunnar Carlsson and Erik Kjær Pedersen, [Controlled algebra and the Novikov conjectures for K- and L-theory](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/carlped.pdf). Topology34(1995),731–758, published scan
- **Ranicki.Finiteness.1985**: Andrew Ranicki, [The algebraic theory of finiteness obstruction](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/finite.pdf). Mathematica Scandinavica57(1985),105–126, published scan
- **CalmesIII**: Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus and Wolfgang Steimle, [Hermitian K-theory for stable infinity-categories III: Grothendieck–Witt groups of rings](https://arxiv.org/pdf/2009.07225v4). arXiv v4, 28 April 2026, 63 pages; locators below are preprint pages, not Annals pagination.
- **BS.Grassmannian**: Bhargav Bhatt and Peter Scholze, [Projectivity of the Witt vector affine Grassmannian](https://arxiv.org/pdf/1507.06490v3). arXiv v3, 21 February 2017, 61 pages.
- **BM.Arc**: Bhargav Bhatt and Akhil Mathew, [The arc-topology](https://arxiv.org/pdf/1807.04725v4). arXiv v4, 14 December 2020, 64 pages.
- **Scholze.Berkovich**: Peter Scholze, [Berkovich Motives](https://arxiv.org/pdf/2412.03382v3). arXiv v3, 22 January 2026, 65 pages.
- **Tamme.Excision**: Georg Tamme, [Excision in algebraic K-theory revisited](https://arxiv.org/pdf/1703.03331v3). arXiv v3, 28 May 2018, 15 pages; Compositio Math.154 (2018),1801–1814.
- **Keller.Derived1996**: Bernhard Keller, [Derived categories and their uses](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/keller.pdf). Author-hosted survey; printed pp.15–16 are PDF pp.16–17.

Use these mathematical corrections in the targets above. They are scoped to the specified versions; correction-list and novelty evidence is recorded in the packet.

- **Weibel.KBook.V, Author chapter Kbook.V.pdf, Remark 3.4.2, p. V.22; version hashed in sourceVersions, read 2026-09-29**: Use the affine plane with a double origin: glue two copies of Spec(k[x,y]) along the punctured plane. Then K₀(VB(X)) ≅ ℤ and G₀(X) ≅ K₀(Perf(X)) ≅ ℤ². The cited II.8.2.4 explicitly assumes dimension n ≥ 2, and II.Ex.9.10(d) uses the plane. The line has a nontrivial Picard group: transition units k[t,t⁻¹]× modulo the two copies of k[t]× give Pic(X) ≅ ℤ. Rank and determinant show that the class of a nontrivial line bundle cannot equal the class of O_X, so K₀(VB(X)) cannot be just the rank group ℤ. The plane is the actual example in both of the cited chapter-II locations. The equivalence of vector-bundle categories for the plane is quoted there from EGA IV(5.9); its proof is not claimed read or formalised here.
- **Weibel.KBook.V, Author chapter Kbook.V.pdf, proof of Proposition 1.7, p. V.8; version hashed in sourceVersions, read 2026-09-30**: For f : B → C with Sn f = Sn B ×_{Sn C} Sn+1 C as in IV.8.5.3, Sn f is equivalent to the extension category E(C, Sn f, Sn B) of Sn B by C; (s, q) : wS.(Sn f) → wS.C × wS.(Sn B) is a homotopy equivalence; the degreewise fibration sequences are |wS.C| → |wS.(Sn f)| → |wS.(Sn B)|, with Xn = |wS.C| for all n. Realising these gives the sequence Ω|wS.(S.B)| → |wS.C| → |wS.(S.f)| → |wS.(S.B)| that the proposition states. In IV.8.5.3 an object of Sn f is a pair (B∗, C∗) with f(B∗) = ∂0 C∗, the subcategory C sits inside Sn f as the objects (0, C = ··· = C), and the exact projection is Sn f → Sn B; so the sub term of the extension is C and the quotient term Sn B. With the roles as printed the realisation would be Ω|wS.(S.C)| → |wS.B| → |wS.(S.f)| → |wS.(S.C)|, contradicting the displayed statement and Exercise V.1.7, which identifies the first map as the one induced by f : B → C.
- **Weibel.KBook.IV, Author chapter Kbook.IV.pdf, Waldhausen Cofinality 8.9, p. IV.72, and Kbook.V.pdf, Corollary 2.3.1, p. V.15; versions hashed in sourceVersions, read 2026-09-30**: Add saturation to the cofinal, extension-closed Waldhausen-subcategory hypotheses in both statements; retain the extra K0 condition where specified. Taken from the author's own correction list, which amends GSM 145 p.372 (IV.8.9), p.417 (V.2.3.1), p.180 (II.9.4) and p.189 (Ex. II.9.14) in this way; the packet did not re-derive the necessity of the hypothesis. The packet uses 8.9 only through the proof of Cofinality 6.4.1 for exact categories, whose weak equivalences are the isomorphisms and hence saturated, so no statement of the packet is affected.
- **Weibel.KBook.IV, Author chapter Kbook.IV.pdf, proof of Lemma 8.5.4, p. IV.69; SHA-256 in sourceVersions; read 2026-09-30**: For f = id_C, S₀f ≃ S₁C ≃ C. The augmented simplicial path construction contracts by its extra degeneracy to the original degree-zero term S₀C = 0; after applying wS in the other direction the augmentation target wS.S₀C is likewise contractible. Substitution of n = 0 in the defining pullback Sₙf = SₙC ×_{SₙC} Sₙ₊₁C gives S₀f ≃ C. The immediately preceding path-space identification proves the intended conclusion with augmentation to S₀C. IV.8.9.2 on p. IV.72 also correctly uses s₀B, rather than s₀id_B, as the point.
- **Weibel.KBook.IV, Author chapter Kbook.IV.pdf, Lemma7.7 proof, p.IV.63, final two lines; read text and page image 2026-10-01; hash in sourceVersions.**: The cartesian arrow is η_E:φ*(E)→E, as in the lemma statement. Its middle-term arrow is β:B′→B, the pullback inclusion, not B′→B′. The quotient functor takes the cartesian arrow to φ:C′→C. Its source must therefore have quotient C′, namely φ*E. The defining pullback gives β:B′=B×_C C″→B. Taking C′=0 and φ the inflation 0↣C gives φ*E=(A=A→0), whose middle term is A, distinguishing it from B for a nonzero quotient C.
- **Kbook.2013, IV.10.3 (Corollary 10.3), printed p. 349 (PDF p. 357); identical in the chapter file Kbook.IV.pdf of 17 August 2012**: Replace the unbound homotopy index by −k, giving K_{−k}(R)≅π_{−k}Λ^{k−1}K(R)≅π_{−k}Λ^kK(R). n is not bound in that clause (the preceding clause is 'for n > −k'); since Λ^{k−1}K(R) is the (−k)-connective cover of Λ^kK(R), the group meant is π_{−k}Λ^{k−1}K(R), which equals π_{−k}Λ^kK(R).
- **Kbook.V.chapter, DefinitionV.7.3, p.53/PDF53, inspected text and image**: The localized quotient in f:G→F is T⁻¹Q, not T⁻¹M. The full split extension is T⁻¹K↣T⁻¹P↠T⁻¹Q. M is S-torsion, hence T⁻¹M=0. The target extension category has quotient T⁻¹Q, which can be nonzero already for M=0 and P=Q.
- **Kbook.V.chapter, LemmaV.7.3.1 proof, pp.53–54/PDF53–54, inspected text and both page images**: Use P↠M ↦ P⊕P₀↠M with quotient q+q₀. The two summand inclusions give id→T←constant(P₀), through admissible monomorphisms. The pullback projections are not generally monomorphisms: for M=0 and P=P₀=R≠0, projection R²→R has nonzero kernel. The sum inclusions are split monomorphisms and compatible with the quotient maps, so they give the required contraction in the stated category.
- **Schlichting.NegativeK.2003, Remark11.2 p.20/PDF20, text and image inspected**: The projection has domain B⊕I, following the preceding graph inflation A↣B⊕I. The actual composite is pr_B∘(f,i)=f. The stated A⊕I domain is not composable with that graph.
- **Schlichting.NegativeK.2003, Lemma10.3 proof, p.18/PDF18, text and image inspected**: Finitely presented functors are closed under cokernels and extensions; representables are projective and their extensions split, but their arbitrary cokernels need not be representable. On finite free abelian groups, coker(Hom(−,ℤ)→×2 Hom(−,ℤ)) has value ℤ/2 at ℤ and cannot be represented by a finite free object. The subsequent argument uses finite presentations and effaceability to deduce the closure of fpC.
- **BM.Arc, Example 6.1, arXiv v4 p.47**: Use the vertical localization arrows, whose fibres are K(Perf_(t)(A)) and K(Perf_(t)(Â)). For A=k and t=0 the completion arrows are identities with zero fibres, while the support category is Perf(k) and has K0=Z.
- **CalmesIII, Lemma 2.1.2, arXiv v4 p.34**: The fibre of R→R_S is (R_S/R)[−1]. R embeds in R_S and its cokernel is R_S/R; the following filtered fractional-ideal argument uses this cokernel.
- **CalmesIII, Lemma 2.2.2, arXiv v4 p.37**: The defining elements of p^−1 lie in K=Frac(R) and satisfy x·p⊂R. For R=Z and p=(2), the element 1/2 must belong to the inverse ideal. Restricting x to R gives the wrong ideal and destroys its residue line.
- **BS.Grassmannian, Remark 12.11, arXiv v3 p.58**: The component group of ΩBX is π1(BX), not π1(X). For the discrete additive E∞ monoid N, π1(X)=0 while π0ΩBX=Z. The paper uses 1-connected to mean path connected, by its own footnote 29; that convention is retained.
