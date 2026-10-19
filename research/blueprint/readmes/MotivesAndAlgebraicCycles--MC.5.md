# Nori motives and diagram categories — MC.5

This part supplies the proof interfaces for the canonical MC.5 objects in the
[whole-roadmap packet](../packets/MotivesAndAlgebraicCycles.json). Its companion
[packet](../packets/MotivesAndAlgebraicCycles--MC.5.json) records the dependencies,
APIs, tests and source findings. This is a target-level plan: no construction of
Nori motives is claimed to be formalized. Coverage is **planned**. The four exact
supplier gaps below prevent a claim of closure.

The construction starts with finite-dimensional linear algebra. Compatible
endomorphisms of finite pieces of a diagram give a coefficient coalgebra and an
abelian category with a faithful exact fibre. Reconstruction of an abelian
category from its faithful fibre proves the universal property. Algebraic good
pairs then supply the diagram for motives. Cellular filtrations extend it to all
pairs; inverse excision edges make the tensor construction well-defined. After
inverting the Lefschetz object, diagonal/Gysin pairings give rigidity. Finally,
comparison-valued cohomology supplies the second fibre, and Harrer's cellular
correspondence construction gives the realization of geometric motives.

## Scope, conventions and existing owners

For the motivic application, **the base field and the coefficient field are Q**.
This is the setting of the canonical MC.5 definitions and MC.6 fibre extension
imported here. The linear reconstruction results are stated over an arbitrary
field K. Some geometric inputs are stated over a subfield k of C as in their
sources; they are applied at k=Q. Harrer's theorem is available more generally,
but a new base-field-parametrized category of Nori motives is not introduced.
Varieties are reduced separated schemes of finite type. Nilpotents are invisible
to the complex point space. An irreducible Q-variety need not be geometrically
connected; Artin factors are retained.

Representations use the native functor carrier from the free path category to
ModuleCat(K). Left endomorphism-algebra modules correspond to **right** comodules
over its finite dual. CategoryTheory.End uses multiplication a b = a after b.
No surjectivity of algebra restriction, or injectivity of dual transitions, is
assumed. A finite full diagram has finitely many vertices; it can have infinitely
many edges, whose linear constraints stabilize in a finite-dimensional ambient
space.

Complexes are cochain complexes, with H^i(A[r])=H^{i+r}(A). Thus an object in
degree n is A[−n], and a contravariant triangulated realization reverses shifts.
The geometric convention is M(P¹)=Q ⊕ Q(1)[2]. The Nori Lefschetz object is
L=H_N^1(G_m,{1})=Q_N(−1) in the abelian heart. The comparison sends Q(1) to
L[0], and Q(1)[2] to L[−2]. Twisting does not itself add a cohomological shift.

For a commuting double complex in bidegree (i,j), this plan uses
D=d_first+(-1)^i d_second. Harrer Convention 1.1.3, pp. 18–19, uses
D_H=d_second+(-1)^j d_first. Multiplication by (-1)^(ij) on that bidegree
intertwines D and D_H. Every cited double-totalization or tensor comparison
is conjugated by this chain isomorphism; for three directions, apply it at
each iterated totalization. This translation is part of the construction,
including the external-product signs, rather than an identification of the
two written differentials.

The unchanged MC.5 definition nodes remain canonical:

| Imported object | Existing node suffix and role |
| --- | --- |
| Diagram and representation | diagram: vertices, edges, distinguished identities and representations |
| Coefficient coalgebra | endomorphism-coalgebra: colimit of finite dual algebras |
| Diagram category | diagram-category: finite right comodules and faithful exact fibre |
| Graded products | graded-multiplicative-diagram: generic signed multiplicative representation |
| Localization | diagram-localisation: vertex/tensor inversion at a rank-one object |
| Algebraic pair diagrams | effective-pairs-diagram: Pairs, Good and VGood with reversed pullbacks and boundaries |
| Nori categories | nori-motives: effective and integer-Tate categories, objects H_N^i(X,Y) |
| Geometric motives | MC.4/effective-geometric-motives and MC.4/tate-stabilised-motives |
| Second abstract fibre | MC.6/fibre-functor-extension; its arbitrary-pair geometric input is identified below |

Unqualified old MC.5 suffixes in this document refer to the whole-roadmap packet.
New nodes have prefix MotivesAndAlgebraicCycles:MC.5/completion-. The finite-end
model expresses the existing end algebra on native carriers. Cellular filtration,
complex, cover, corrected excision, correspondence action and bridge data have
their own new APIs. Generic quiver representations, topological duality, finite
correspondences, motivic localization, and formal periods keep their existing
owners.

## Library and roadmap boundary

The pinned baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Statements were read at
those commits, rather than inferred from declaration names.

| Existing declaration | What it supplies |
| --- | --- |
| mathlib:CategoryTheory.End | Endomorphisms with multiplication x*y=y≫x, agreeing with composition of functions. Source module: Mathlib/CategoryTheory/Endomorphism.lean. |
| mathlib:Subalgebra | Subalgebras with inherited scalar, ring and module structure; used for compatible endomorphism families. Source module: Mathlib/Algebra/Algebra/Subalgebra/Basic.lean. |
| mathlib:exists_finite_inj_algHom_of_fg | For a nontrivial finite-type algebra over a field, an injective finite polynomial-algebra map exists. Its variable count is not identified with Krull dimension in this declaration; that geometric adapter remains a named input. Source module: Mathlib/RingTheory/NoetherNormalization.lean. |
| mathlib:Module.Dual | The linear dual Hom_R(M,R), not a finite-dual coalgebra on arbitrary infinite algebras. Source module: Mathlib/LinearAlgebra/Dual/Defs.lean. |
| mathlib:DerivedCategory | The native localization of integer cochain complexes in an abelian category, with explicit HasDerivedCategory universe parameter. Source module: Mathlib/Algebra/Homology/DerivedCategory/Basic.lean. |
| tauceti:TauCeti.FGComoduleCat | The full subcategory of right comodules with Module.Finite underlying module; over a field these are finite-dimensional. Source module: TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean. |
| tauceti:TauCeti.FGComoduleCat.tensorUnit | For a commutative base semiring and a coefficient bialgebra, the standard finite-comodule tensor unit and monoidal structure already exist. Source module: TauCeti/Algebra/Coalgebra/Comodule/Finite/Monoidal.lean. |
| tauceti:TauCeti.TopTriple.singularHomologyδ | The connecting map H_n(X,Y)→H_m(Y,Z) for m+1=n. Source module: TauCeti/AlgebraicTopology/Singular/Triple.lean. |
| tauceti:TauCeti.TopTriple.singularHomology_exact_inner | Exactness at the inner-pair term in the triple sequence. Source module: TauCeti/AlgebraicTopology/Singular/Triple.lean. |
| tauceti:TauCeti.TopTriple.singularHomology_exact_total | Exactness at H_n(X,Z) in the triple sequence. Source module: TauCeti/AlgebraicTopology/Singular/Triple.lean. |
| tauceti:TauCeti.TopTriple.singularHomology_exact_outer | Exactness at the outer-pair term in the triple sequence. Source module: TauCeti/AlgebraicTopology/Singular/Triple.lean. |
| tauceti:TauCeti.TopTriple.singularHomologyδ_naturality | The naturality square of the connecting map for a morphism of TopTriples, with the same m+1=n hypothesis. Source module: TauCeti/AlgebraicTopology/Singular/Triple.lean. |

The aggregate library-coverage file has no MotivesAndAlgebraicCycles entry at this
checkout. AUDIT-35 is a useful list of search leads, but has no independent review
object. Neither is presented as an accepted audit. The statements in the table
were checked independently.

Current Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 additionally contains
Algebra/Coalgebra/Comodule/Finite/Abelian.lean: finite-comodule abelianness and
preservation of finite limits and colimits by the underlying-module forgetful
functor over a Noetherian base with flat coefficient coalgebra. It is absent at
the pin. The existing finite-comodules-abelian target records that pin bridge;
after repinning, import this implementation. Do not develop it again. Generic
finite-comodule monoidal, symmetric and rigid machinery already exists at the
pin; Nori-specific coefficient multiplication and its geometric pairings are the
work here.

The current upstream AlgebraicTopology, RepresentationTheory/QuiverRepresentations
and RealAlgebraicGeometry README and Suggested files were inspected. Quiver
representations are functors Paths(Q)→ModuleCat(K). AlgebraicTopology owns CW
cohomology, products, finite-cover descent and manifold duality.
RealAlgebraicGeometry explicitly excludes triangulation; it cannot be cited as
already supplying that theorem. Searches of the current roadmaps and Tau Ceti
found no Nori diagram construction. A public Mathlib/Zulip search found the
[prefunctor discussion](https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/prefunctor.3F.html)
as a design lead for quiver representations; it does not supply a Nori
implementation. Absence from that search is not a completeness claim about open
Mathlib work.

## Dependency route and proof targets

The order below follows the construction, rather than any source's chapter
order. Each construction's API is selected from the uses listed beside it.
Checks are mathematical acceptance criteria. The worked tests must distinguish
the specified object from plausible incorrect constructions, even where the
heavy carrier has no Lean prototype yet.

### A. Linear reconstruction

#### Finite diagram endomorphisms in the native representation category

Node: MotivesAndAlgebraicCycles:MC.5/completion-finite-end-model.

For a field K and a diagram D represented by T in finite-dimensional K-vector spaces, the algebra E_F of the existing endomorphism-coalgebra node, for a finite subdiagram F, is the subalgebra of the product of End_K(T(v)) cut out by T(e) a_v = a_w T(e) for every edge e:v→w in F. It is naturally isomorphic to the categorical endomorphism algebra of the extended functor Paths(F)→ModuleCat(K), and is finite-dimensional. Restriction along F⊆G is a unital algebra homomorphism E_G→E_F; no surjectivity is asserted. Finite here means finitely many vertices and a finite set of constraints, or all constraints on those vertices: over K their common kernel is already cut out by finitely many constraints.

Dependencies: MotivesAndAlgebraicCycles:MC.5/diagram, mathlib:CategoryTheory.End, mathlib:Subalgebra, tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-1-representations-of-a-quiver-as-kq-modules.

Proof route:

1. Use the existing representation carrier, not a second category of quiver representations. A natural endomorphism is exactly its family of vertex maps satisfying edge naturality.
2. Composition agrees with CategoryTheory.End multiplication: the later factor acts first in the written product a b = a∘b. Restrict families to define transition maps.
3. Embed E_F linearly in the finite product of finite-dimensional endomorphism spaces. For infinitely many edge constraints on a finite vertex set, finite-dimensional descending-chain stabilization gives an equivalent finite constraint set.

Planning API:

| Name | Contract |
| --- | --- |
| Nori.compatibleEnd (constructor) | The subalgebra of vertex endomorphism families satisfying all edge commutation equations. |
| Nori.compatibleEnd.eval (projection) | Evaluation at a vertex is a unital algebra homomorphism to its module endomorphism algebra. |
| Nori.compatibleEnd.restrict (functoriality) | Restriction to a subdiagram is a unital algebra homomorphism; identity and successive restrictions agree. |
| Nori.compatibleEnd.endEquiv (equivalence) | An algebra equivalence with the native endomorphism algebra of the extended path-category functor. |
| Nori.compatibleEnd.finiteDimensional (structure) | Finite vertices and finite-dimensional vertex spaces imply finite dimension, without assuming finite hom sets. |

Uses:

- MotivesAndAlgebraicCycles:MC.5/completion-finite-dual: Its finite algebra is dualized to the coefficient coalgebra.
- MotivesAndAlgebraicCycles:MC.5/completion-abelian-reconstruction: Compatible endomorphisms on finite pieces control the reconstruction.

Discriminating unit tests:

- **Nori.compatibleEnd.isolatedVertex** (computation): One isolated vertex K² gives Mat₂(K), of dimension four; a scalar-only construction fails.
- **Nori.compatibleEnd.identityVersusZero** (characterisation): Two one-dimensional vertices joined by the identity give K, while a zero arrow gives K×K. Ignoring arrows identifies these incorrectly.
- **Nori.compatibleEnd.jordanLoop** (computation): A loop acting by the size-two nilpotent Jordan block has centralizer {[[a,b],[0,a]]}, of dimension two. Taking all endomorphisms fails.

Checks:

- The family model is the existing endomorphism-algebra construction expressed on native carriers.

Sources:

- [HM17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf), Definition 7.1.8 and Remark 7.1.9, pp. 136–137; Definition 7.1.10 and Remark 7.1.11, pp. 137–138. The finite construction is the algebra of compatible vertex endomorphisms; passing to paths imposes no extra conditions.
- [VW](https://arxiv.org/pdf/1111.5146v1), Proposition 2.6, pp. 13–15. Finite diagram endomorphisms form a finite algebra inside a product of module endomorphisms.

#### Left modules and right finite-dual comodules

Node: MotivesAndAlgebraicCycles:MC.5/completion-finite-dual.

For a finite-dimensional unital K-algebra E, the dual vector space E∨ has comultiplication dual to multiplication and counit evaluation at 1. Finite-dimensional left E-modules are equivalent, over their underlying K-vector spaces, to TauCeti.FGComoduleCat K E∨ of right comodules. For a basis (e_i) of E with dual basis (e_i∨), the coaction is m↦Σ_i e_i m⊗e_i∨. Applied to E_F, this identifies the finite module model of C(F,T) with the existing finite-comodule carrier. The equivalence intertwines restriction of scalars along E_G→E_F with corestriction along E_F∨→E_G∨.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-finite-end-model, mathlib:Module.Dual, tauceti:TauCeti.FGComoduleCat.

Proof route:

1. Dualize the algebra laws using the finite-dimensional tensor-dual isomorphism; do not equip an arbitrary infinite algebra dual with this coalgebra structure.
2. Check the coaction formula is independent of the basis via the action–coaction adjunction. Transposing the two coaction identities recovers the two module identities.
3. On morphisms both functors retain the linear map; the action relation is equivalent to the coaction relation. Apply the same adjunction to an algebra map to check transition compatibility.

Checks:

- For E=K the coaction is m↦m⊗1.
- For E=K×K the two orthogonal idempotents give the two homogeneous components of a comodule.
- For E=Mat_2(K) its standard column module uses the displayed order of multiplication; replacing E by its opposite without changing the action fails this check.

Sources:

- [HM17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf), Lemma 7.5.4, pp. 168–170. The adjunction between a finite projective algebra action and a right coaction on its dual gives the equivalence and its variance.
- [VW](https://arxiv.org/pdf/1111.5146v1), Satz 5.23, pp. 80–81. The finite equivalence is the first step of the diagram-coalgebra description.

#### Finite support descent for the Nori coalgebra

Node: MotivesAndAlgebraicCycles:MC.5/completion-filtered-descent.

Let (A_i) be a filtered system of K-coalgebras and let A be its coalgebra colimit, whose underlying vector space is the filtered colimit. Every finite-dimensional right A-comodule is corestricted from a finite-dimensional A_i-comodule at some index. Every comodule map between two such objects is represented at a common later index; equality of two represented maps holds at a common later index whenever it holds over A. Consequently the 2-colimit of the finite-comodule categories is equivalent to FGComoduleCat K A. In particular A(D,T)=colim_F E_F∨ gives the existing diagram category, with faithful exact forgetful functor. Neither the coalgebra transition maps nor the algebra restriction maps need be injective or surjective.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-finite-dual, MotivesAndAlgebraicCycles:MC.5/finite-comodules-abelian, tauceti:TauCeti.FGComoduleCat.

Proof route:

1. Choose a basis of a finite-dimensional V. Its finitely many coaction coefficients lift simultaneously to some A_i.
2. Counitality and coassociativity are finitely many equations. A⊗A and higher finite tensor powers commute with filtered colimits over K, so all these equations hold at a later common index. This step is essential when transitions are not monomorphisms.
3. A linear map has finitely many entries; its coaction-compatibility equations descend in the same way. Equality of represented maps is eventual equality, not equality at their initial index.
4. At a finite stage E_F embeds as a left E_F-module into a finite sum of vertex modules by simultaneous evaluation on bases. Every finite E_F-module is a quotient of finitely many regular modules. Thus every diagram object is a subquotient of a finite sum of vertices, independently of universality.
5. Use these statements for essential surjectivity and full faithfulness of the 2-colimit comparison. Abelian/exact structure comes from the existing finite-comodule result, rather than a new comodule theory.

Checks:

- A one-vertex diagram gives the finite-dual equivalence without a limit.
- Adjoining an identity edge changes neither end algebra nor coalgebra.
- Adding an edge may kill coalgebra coefficients: the argument must still descend equations at a later stage.

Sources:

- [HM17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf), Corollary 7.5.7 and its proof, pp. 170–172. Finite comodules descend through the filtered coalgebra system and recover the diagram category.
- [VW](https://arxiv.org/pdf/1111.5146v1), Satz 5.23, pp. 80–81. The statement identifies the filtered diagram category with the comodule category.

#### Reconstruction of an abelian category from its faithful fibre

Node: MotivesAndAlgebraicCycles:MC.5/completion-abelian-reconstruction.

Let A be an essentially small K-linear abelian category with a faithful exact K-linear functor U:A→Vect_fd(K). Regard a small skeleton of A, with all of its morphisms, as a diagram. The canonical functor A→C(A,U) is an equivalence over Vect_fd(K). This is reconstruction of the abelian category, prior to any tensor or rigidity assertion.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-filtered-descent.

Proof route:

1. For an object p, finite copowers and kernels give the internal object Hom_K(U(p),p). Impose the finitely many commutator equations for End_A(p) to construct X(p) with fibre E(p), the centralizer algebra.
2. Composition equips X(p) with a right E(p)-action. Cokernels of finite presentations define X(p)⊗_{E(p)}M internally in A; no arbitrary cocompleteness is needed.
3. Evaluation X(p)⊗_{E(p)}U(p)→p is an actual map. Its fibre is the usual evaluation isomorphism, so faithful exactness reflects its being an isomorphism.
4. The constructions are compatible under p↦p⊕q. Pass to the filtered diagram categories of the additive/subquotient hulls, as in the cited proof. This constructs the inverse functor and proves fullness; faithfulness alone never supplies a lift of a linear map.

Checks:

- For A=Vect_fd(K), the reconstruction recovers A, not the category of all vector spaces.
- For A the finite left modules of a finite-dimensional algebra and U the forgetful functor, the regular module detects the full action.
- The proof explicitly constructs X(p); it does not assume that every U-linear map is motivic.

Sources:

- [HM17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf), Theorem 7.1.20, p. 142; Lemma 7.3.16, pp. 155–158; Proposition 7.3.18 and proof of Theorem 7.1.20, pp. 158–160. The finite regular-module object and compatible finite-piece functors prove full faithfulness and essential surjectivity.
- [VW](https://arxiv.org/pdf/1111.5146v1), Satz 3.28, p. 55, with Satz 3.27, pp. 51–55. The thesis supplies the reconstruction equivalence used to obtain universality.

#### Universal factorisation with specified fibre compatibility

Node: MotivesAndAlgebraicCycles:MC.5/completion-universal-factorisation.

For a diagram representation T:D→Vect_fd(K), an essentially small K-linear abelian category A, a faithful exact U:A→Vect_fd(K), a representation F:D→A and a specified isomorphism U F≅T, there is a faithful exact K-linear L:C(D,T)→A, a lift isomorphism L T̃≅F, and a fibre isomorphism U L≅ω compatible with the specified diagram isomorphism. The groupoid of such compatible factorizations is contractible: the comparison isomorphism is unique over the specified fibre data and diagram lift. This does not assert unique arbitrary automorphisms of an unmarked functor.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-abelian-reconstruction.

Proof route:

1. Transport the specified isomorphism to compare T with U F. Diagram functoriality gives C(D,T)→C(A,U). Compose with the inverse of the reconstruction equivalence.
2. The resulting functor is exact and faithful because both constructions commute with the faithful exact fibres.
3. For two factorizations, compare on vertex objects and then finite sums, kernels and cokernels using generation. Faithfulness gives uniqueness for maps whose fibre is prescribed; check independence of finite presentations and compatibility on overlap.
4. Apply the same uniqueness to composites to obtain the equivalence of any two marked universal categories.

Checks:

- The identity factorisation of C(D,T) is recovered up to the specified unique isomorphism.
- A zero-valued diagram gives the zero abelian category.
- Changing an unmarked fibre identification is not erased by the uniqueness claim.

Sources:

- [HM17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf), Theorem 7.1.13 and Corollary 7.1.15, pp. 138–140; Propositions 7.4.1–7.4.2, pp. 164–165. Functoriality in diagrams followed by reconstruction gives existence; generation and faithful fibre compatibility give uniqueness.
- [VW](https://arxiv.org/pdf/1111.5146v1), Satz 4.3, pp. 60–62. The thesis proves the factorisation property after reconstruction of the target category.

### B. Algebraic pairs and cellular realization

#### Finite Betti cohomology of algebraic pairs

Node: MotivesAndAlgebraicCycles:MC.5/completion-pair-finiteness.

For a reduced separated finite-type k-scheme X, a closed reduced subscheme Y and an embedding k↪C, H^i(X(C),Y(C);Q) is finite-dimensional and vanishes outside a finite nonnegative range. A finite family of closed subvarieties can be treated by compatible semialgebraic triangulation after compactification; this gives the relative finite-type and closed-cover excision statements needed below. X(C) need not itself be the realization of a finite simplicial complex: nonproper spaces need an open-subcomplex or finite CW homotopy model.

Dependencies: ComplexComparisonPartII:C0/repair-analytification, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality.

Proof route:

1. Apply complex analytification from its owner and express finitely many equations and inequations in real coordinates.
2. For an affine chart, use compatible triangulation of a projective compactification, its boundary and the prescribed closed subvarieties. The noncompact open part has a finite CW homotopy model, not necessarily a compact finite realization. For a separated variety not assumed quasiprojective, choose a finite affine open cover; its intersections are affine and finite-cover descent reduces finiteness to these charts.
3. Consume the existing CW/cohomology finite-generation theorem and extend coefficients to Q. A simultaneous triangulation also makes algebraic closed covers excisive.
4. The generic compatible semialgebraic triangulation proof is the explicit external gap recorded for this node; the current RealAlgebraicGeometry roadmap excludes triangulation.

Checks:

- For X=Spec(Q(i)) over Q, H^0 has rational dimension two after the chosen embedding into C.
- For (A¹,{0,1}), H^1=Q and H^0=0.
- Nilpotent thickening of a pair does not change its complex point space.

Sources:

- [HM17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf), Proposition 2.6.10, p. 66, and Note 2.6.11; relative deformation-retraction argument in the proof of Proposition 2.6.9, pp. 67–70; Corollary 2.6.14, p. 70. Compatible semialgebraic triangulation and the singular comparison give finiteness for pairs.

#### Cohomological exactness and naturality before reconstruction

Node: MotivesAndAlgebraicCycles:MC.5/completion-triple-adapter.

For Z⊆Y⊆X closed algebraic subvarieties, transpose Tau Ceti’s homological sequence over Q to obtain the natural exact sequence …→H^i(X,Y)→H^i(X,Z)→H^i(Y,Z)→δ H^{i+1}(X,Y)→…. For a map of triples the square with the two δ maps commutes, with no sign change. Together with pullback and identities these maps define the existing singular-cohomology-representation of the pair diagram. These checks precede use of the universal category.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-pair-finiteness, MotivesAndAlgebraicCycles:MC.5/effective-pairs-diagram, mathlib:Module.Dual, tauceti:TauCeti.TopTriple.singularHomologyδ, tauceti:TauCeti.TopTriple.singularHomology_exact_inner, tauceti:TauCeti.TopTriple.singularHomology_exact_total, tauceti:TauCeti.TopTriple.singularHomology_exact_outer, tauceti:TauCeti.TopTriple.singularHomologyδ_naturality, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality.

Proof route:

1. Make the analytic maps into a native TopTriple and use the pinned homological δ from the outer pair to the inner pair.
2. Over a field Hom_Q(−,Q) is exact. Identify relative cohomology with the dual of relative homology using the imported universal-coefficient comparison.
3. Transpose all three exactness statements and the naturality square. The order of the two terms reverses, giving the displayed cohomological sequence.
4. Check the point/empty pair and (A¹,{0,1}) explicitly to fix degree zero and the boundary sign.

Checks:

- For ∅⊆{0,1}⊆A¹, the cokernel of Q→Q², a↦(a,a), is H^1(A¹,{0,1})=Q.
- For Z=Y the inner relative term is zero and the outer-to-total map is the identity.
- A commuting map of triples induces a commuting δ square before any Nori lift is constructed.

Sources:

- [HM17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf), Definition 9.1.1, pp. 205–206; relative cohomology sequence (2.2), p. 32. The pair representation includes functoriality arrows in the reversed geometric direction and the connecting arrows of triples.

#### Affine dimension bound in relative cohomology

Node: MotivesAndAlgebraicCycles:MC.5/completion-affine-vanishing.

For an affine complex variety X of dimension n, its analytic space has the homotopy type of a finite CW complex of dimension at most n. Hence H^q(X;R)=0 for q>n for every constant coefficient ring R. For a closed subvariety Z⊆X, the same vanishing holds for H^q(X,Z;R), by reducing first to the components of X not contained in Z so that dim Z<n. The assertion concerns homotopy dimension, not the real dimension 2n of a smooth analytic locus.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-pair-finiteness, MotivesAndAlgebraicCycles:MC.5/completion-triple-adapter, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations.

Proof route:

1. Use the affine analytic homotopy-dimension input named in the gap register; it is not a consequence of general triangulation or of finite CW type alone.
2. Remove components lying in Z using closed-cover excision. Apply the absolute affine bound to X and the smaller-dimensional closed part Z.
3. The long exact sequence of the pair gives the relative bound, including degree n+1.

Checks:

- For affine curves there is no cohomology above degree one.
- For (A¹,{0,1}) the degree-one group survives, showing the bound is sharp.
- The projective line has H²≠0 and does not satisfy the affine bound.

Sources:

- [HM17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf), Theorem 2.3.12 and Corollary 2.3.15, pp. 39–40. The affine homotopy-dimension theorem gives the absolute and relative vanishing used by the direct Basic Lemma proof.

#### A sourced proof of Nori's Basic Lemma

Node: MotivesAndAlgebraicCycles:MC.5/completion-basic-lemma-proof.

Let k⊆C, let X be an affine reduced finite-type k-scheme of dimension n, and let W⊆X be closed of dimension <n. There is a closed Z⊇W of dimension <n with X∖Z smooth, H^q(X(C),Z(C);Z)=0 for q≠n, and H^n(X(C),Z(C);Z) finite free. The result implies the same concentration and a finite free top group for every constant coefficient ring. The empty variety is handled separately; n=0 permits Z=∅. This supplies the proof input of the existing basic-lemma node.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-affine-vanishing, SchemeAndStackFoundations:SF.4, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality.

Proof route:

1. Enlarge W by the nonsmooth locus and by lower-dimensional irreducible components when necessary; this still has dimension <n in characteristic zero.
2. Use the specific compactification/normal-crossings and ample-hyperplane input requested from SF.4 (Lemma 2.5.8). Excision identifies the relative cohomology with that of a smooth compactification minus one boundary, relative to the other.
3. Poincaré–Lefschetz duality identifies the low degrees with high relative degrees of the pair with boundaries interchanged. The swapped complement is affine, so relative affine vanishing kills those degrees. The original X is affine and kills the degrees >n; its proper modification need not be affine.
4. Repeat over every prime field. Finiteness plus universal coefficients then exclude integral torsion in the top degree and give finite freeness. Obtain arbitrary constant coefficients by the coefficient-change theorem.
5. The normal-crossings arrangement and affine analytic bound are named inputs, not consequences of the universal property.

Checks:

- For n=0, Z=∅ and H^0 is free on the complex points, including nontrivial Artin components.
- For X=A¹ and W={0,1}, Z=W gives H^1=Z.
- The hypothesis dim W<n is necessary: W=X forces the relative pair to be zero and cannot leave a smaller-dimensional Z.

Sources:

- [HM17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf), Theorem 2.5.2, pp. 45–46; Lemma 2.5.8 and direct proof in §2.5.2, pp. 47–49. Resolution, a normal-crossings compactification with the swapped complement affine, and duality give concentration; coefficient variation proves freeness.

#### Good algebraic filtrations

Node: MotivesAndAlgebraicCycles:MC.5/completion-cellular-filtration.

A cellular filtration of an affine variety X of dimension n is a finite increasing sequence of closed reduced subvarieties ∅=F_{−1}X⊆F_0X⊆…⊆F_nX=X, with dim F_i≤i, smooth F_i∖F_{i−1}, and relative integral cohomology of (F_i,F_{i−1}) finite free and concentrated in degree i. Repeated equal levels are allowed with zero relative cohomology. One may enlarge a prescribed dimension-bounded filtration to one of this form. Such filtrations exist by descending application of the Basic Lemma; compatible filtrations for a finite acyclic diagram of morphisms exist after enlargement.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-basic-lemma-proof, MotivesAndAlgebraicCycles:MC.5/effective-pairs-diagram.

Proof route:

1. Construct F_{n−1} containing the prescribed closed subset by the Basic Lemma, then descend dimension. Insert repeated zero relative levels when a dimension is skipped.
2. For a finite acyclic diagram, order the objects and include the closures of images of already chosen lower stages. A morphism does not increase the dimension of its image; apply the prescribed-filtration version.
3. Common enlargement of two filtrations gives comparison maps of their cellular complexes. These are not claims about a universally chosen functorial filtration.

Planning API:

| Name | Contract |
| --- | --- |
| Nori.CellularFiltration.level (projection) | The closed level F_i, extended by ∅ below −1 and by X above n. |
| Nori.CellularFiltration.relative (data) | The good pair (F_i,F_{i−1},i), with its integral concentration and freeness witness. |
| Nori.CellularFiltration.enlarge (constructor) | Enlarge a prescribed dimension-bounded filtration; this is existence data, not a canonical choice. |
| Nori.CellularFiltration.map (functoriality) | A map preserving levels induces maps of relative terms; identity and composition agree with pair pullback. |
| Nori.CellularFiltration.common (compatibility) | Two filtrations have a common enlargement, giving comparison maps of the associated complexes. |

Uses:

- MotivesAndAlgebraicCycles:MC.5/completion-cellular-complex: Its terms and differential are the relative motives of successive levels.
- MotivesAndAlgebraicCycles:MC.5/completion-all-pairs-extension: Compatible enlargement allows independence of choices and geometric functoriality.

Discriminating unit tests:

- **Nori.CellularFiltration.point** (degenerate): For X=Spec Q, F_0=X and the only term is H^0(X)=Q.
- **Nori.CellularFiltration.affineLineTwoPoints** (computation): For A¹ with F_0={0,1}, the cellular complex is Q²→Q with differential the quotient by the diagonal; its cohomology is Q in degree zero only.
- **Nori.CellularFiltration.repeatedLevel** (characterisation): A repeated level contributes the zero object. Replacing it by the unit would change the cohomology.

Checks:

- Every level is a closed algebraic subvariety, not a topological skeleton.
- The degree of a relative term is its filtration index, so one cannot put the whole variety in degree zero indiscriminately.

Sources:

- [HM17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf), Proposition 9.2.3 and Corollary 9.2.4, pp. 210–211. Successive applications of the Basic Lemma give filtrations and compatible enlargements.

#### The complex attached to a good filtration

Node: MotivesAndAlgebraicCycles:MC.5/completion-cellular-complex.

In C(VGood,H_B), a cellular filtration F of X gives the cochain complex C_F^i(X)=H_N^i(F_iX,F_{i−1}X). Its differential is the connecting map for F_{i−1}⊆F_i⊆F_{i+1}. The square of the differential is zero by triple exactness and naturality. Maps of filtered varieties give contravariant cochain maps. The Betti image is naturally quasi-isomorphic, in the derived category, to relative/absolute singular cochains of the corresponding filtered variety; a strict natural cochain equivalence is not asserted.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-cellular-filtration, MotivesAndAlgebraicCycles:MC.5/completion-triple-adapter, MotivesAndAlgebraicCycles:MC.5/completion-filtered-descent, mathlib:DerivedCategory.

Proof route:

1. Use the actual boundary edges in the very-good-pair representation, then apply the diagram-category inclusion. Check d² after the faithful exact Betti functor using triple exactness; no new boundary map is chosen.
2. A filtered geometric map gives pullback in every degree; the naturality square proved before reconstruction makes it a cochain map.
3. The filtration exact couple is concentrated on its cellular diagonal. Its edge comparison identifies the cellular complex with singular cochains in the derived category.
4. For a finite complex of varieties, totalize the resulting double complex with d_total=d_cell+(−1)^i d_other on cellular degree i.

Planning API:

| Name | Contract |
| --- | --- |
| Nori.CellularComplex.term (projection) | The degree-i object is H_N^i(F_i,F_{i−1}). |
| Nori.CellularComplex.d (data) | The degree-i differential is the indicated triple boundary. |
| Nori.CellularComplex.map (functoriality) | A filtration-preserving morphism induces a contravariant cochain map, preserving identities and reversing composition. |
| Nori.CellularComplex.betti (compatibility) | The derived Betti image computes RΓ_sing(X,Q). |
| Nori.CellularComplex.refinement (compatibility) | For F_i⊆G_i the filtered identity gives C_G→C_F, with the geometric identity as its Betti realization; hence it is a quasi-isomorphism. |

Uses:

- MotivesAndAlgebraicCycles:MC.5/completion-all-pairs-extension: The Čech totalization takes these complexes as its entries.
- MotivesAndAlgebraicCycles:MC.5/completion-comparison-zigzag: Comparison maps become actual quasi-isomorphisms before localization.

Discriminating unit tests:

- **Nori.CellularComplex.point** (degenerate): The rational point Spec Q gives Q[0].
- **Nori.CellularComplex.nonzeroBoundary** (computation): The filtration {0,1}⊆A¹ gives a rank-one differential Q²→Q, so the two points do not survive independently in H^0.
- **Nori.CellularComplex.refinementIdentity** (characterisation): The map from a filtration to itself is the identity; comparison through any common enlargement gives the same identity in the derived category.

Checks:

- Differentials are connecting maps, not zero by definition.
- The comparison is a derived comparison with a constructed map or zigzag.

Sources:

- [HM17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf), Definition 9.2.17 and Proposition 9.2.18, pp. 214–215. The terms are consecutive relative motives and the differential is the triple boundary.
- [HARRER](https://arxiv.org/pdf/1609.05516), Definition 4.2.1 and Proposition 4.2.3, pp. 128–129. The cellular Nori complex computes singular cohomology and supports filtered functoriality.

#### Finite affine cover and filtration data

Node: MotivesAndAlgebraicCycles:MC.5/completion-affine-cover.

For a separated finite-type variety X choose a finite ordered affine open cover U_i. Its strictly increasing-index Čech terms are the finite disjoint unions U_{i_0}∩…∩U_{i_p}. These intersections are affine because X is separated, and the normalized cover direction is bounded by the number of opens. A cover-filtration consists of this cover and compatible cellular filtrations of the intersection diagram. For a finite acyclic geometric diagram, covers and filtrations can be chosen simultaneously after affine refinement. Pullbacks of affine opens along arbitrary morphisms are refined by affine opens; they are not assumed affine.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-cellular-filtration, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent.

Proof route:

1. Finite type gives a finite affine cover, and separatedness gives affine intersections.
2. Choose filtrations on the finite intersection diagram by the compatible-enlargement result. For functoriality first refine inverse images by affines, then repeat this construction.
3. Use the alternating finite-cover complex for ordinary morphisms. If the full repeated-index Čech object is used instead, apply normalization and its explicit quasi-isomorphism before claiming boundedness.
4. Totalize with the cochain Čech sign, and use the imported finite-cover descent theorem for the Betti comparison.

Planning API:

| Name | Contract |
| --- | --- |
| Nori.AffineCover.intersection (projection) | The affine scheme of an increasing index tuple and its face inclusions. |
| Nori.AffineCover.total (constructor) | The Čech totalization of the cellular complexes with the displayed total differential. |
| Nori.AffineCover.augmentation (data) | The derived augmentation comparing the totalization with the realization of X. |
| Nori.AffineCover.refine (functoriality) | An affine refinement, with compatible filtrations, induces a comparison morphism; refinements compose. |
| Nori.AffineCover.bettiDescent (compatibility) | The Betti augmentation is a quasi-isomorphism by finite-cover descent. |

Uses:

- MotivesAndAlgebraicCycles:MC.5/completion-all-pairs-extension: Covers extend affine realization to all separated varieties.
- MotivesAndAlgebraicCycles:MC.5/completion-geometric-effective: The ordinary-morphism realization is the graph case of the correspondence realization.

Discriminating unit tests:

- **Nori.AffineCover.singleton** (degenerate): For affine X covered by itself the totalization is C_F(X).
- **Nori.AffineCover.projectiveLine** (computation): The two standard affine charts of P¹ have overlap G_m; the totalization yields H^0=Q, H²=Q(−1), and H¹=0.
- **Nori.AffineCover.repeatedIndex** (non-example): The unnormalized Čech nerve of even a singleton cover has terms in arbitrarily high cover degree, so finite cover cardinality alone does not bound that complex.

Checks:

- A one-open affine cover reduces to the affine cellular complex.
- A finite number of opens makes the normalized cover direction bounded.

Sources:

- [HM17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf), Definitions 9.2.7, 9.2.12–9.2.13 and Lemmas 9.2.9–9.2.16, pp. 212–214. Covers and compatible filtrations are the data for Čech realization; the normalized finite-cover variant has the same augmentation.
- [HARRER](https://arxiv.org/pdf/1609.05516), Lemma 7.1.1, p. 198. Separatedness makes the fibre product of two affine schemes over the variety affine.

#### Choice-independent realization and comparison of pair diagrams

Node: MotivesAndAlgebraicCycles:MC.5/completion-all-pairs-extension.

There is a contravariant realization on bounded complexes of separated varieties with formal Q-linear combinations of morphisms, valued in the bounded derived category of C(VGood,H_B). On an affine filtration it is C_F; on a general variety it is the affine-cover totalization. Choice comparisons are canonical derived isomorphisms satisfying identity, cocycle and naturality. Define R(X,Y)=Cone(R(X)→R(Y))[−1]. Its cohomology gives a representation of all pairs extending the original very-good-pair representation. Hence C(VGood,H_B)→C(Good,H_B)→C(Pairs,H_B) are equivalences. The natural sequence of a triple and the sequence with supports are represented motivically.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-cellular-complex, MotivesAndAlgebraicCycles:MC.5/completion-affine-cover, MotivesAndAlgebraicCycles:MC.5/completion-universal-factorisation.

Proof route:

1. For affine refinements construct cochain maps first; their Betti maps compute the identity and hence are quasi-isomorphisms. The derived Betti functor is conservative because the fibre is faithful exact.
2. For two choices use a common affine cover refinement followed by a common enlargement of filtrations on a single finite diagram. Invert the constructed quasi-isomorphisms. A third simultaneous choice proves the cocycle law and independence of the intermediate cover.
3. Use simultaneous choices for a morphism, a composite and a homotopy. Their chain relations descend to the derived category; one must not infer existence or equality of motivic maps merely from equality of vector spaces.
4. Take cones for pairs. The cone identity for a nested triple yields R(X,Y)→R(X,Z)→R(Y,Z)→R(X,Y)[1], so its long cohomology sequence has the required δ.
5. Apply the marked universal property to the extended all-pairs representation. Uniqueness and generation make the two comparison functors inverse equivalences.

Checks:

- On an original very good pair concentrated in degree n, R(X,Y)≅H_N^n(X,Y)[−n].
- On a general pair, R has all its cohomology groups; no concentration is assumed.
- For U=X∖Z, the cone of R(X)→R(U), shifted by −1, yields the support sequence.

Sources:

- [HM17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf), Proposition 9.2.18, Corollary 9.2.20, Definition 9.2.21 and Theorem 9.2.22, pp. 215–217. The cover/filtration construction extends the representation and compares the three diagram categories.
- [HARRER](https://arxiv.org/pdf/1609.05516), Proposition 7.2.3 and Theorem 7.2.4, pp. 201–204. Actual refinement maps and common-cover/common-enlargement zigzags prove the cocycle and naturality of comparison isomorphisms; the graph-only case supplies the mechanism here.

### C. Tensor, localization and rigidity

#### The good-pair diagram with inverse excision edges

Node: MotivesAndAlgebraicCycles:MC.5/completion-excision-completion.

Let Good be the integral-good-pair diagram, represented over Q. Form Good_ex by adjoining the inverse of the cohomological restriction (S,T,n)→(S∖U,T∖U,n) whenever U is open in S and contained in T, with the representation assigning actual inverses to the new edges. The restriction is an isomorphism by algebraic closed-pair excision. In the diagram category its inverse already exists; hence C(Good_ex,H_B)≃C(Good,H_B), compatibly with fibres. For a boundary (Y,Z,n)→(X,Y,n+1) and a good pair (A,B,m), put S=Y×A∪X×B and T=Z×A∪X×B. The inverse excision edge from (Y×A,Z×A∪Y×B,n+m) to (S,T,n+m), followed directly by the boundary of X×A⊇S⊇T, defines the product boundary. Both endpoints of this boundary are good. It is unnecessary to pass through (S,Z×A∪Y×B,n+m), which need not be a good pair.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-all-pairs-extension, MotivesAndAlgebraicCycles:MC.5/completion-pair-finiteness, MotivesAndAlgebraicCycles:MC.5/completion-finite-end-model, MotivesAndAlgebraicCycles:MC.5/completion-universal-factorisation.

Proof route:

1. The complement of Y×A in S is U=(X∖Y)×B, an open subset of S lying in T; T∩(Y×A)=Z×A∪Y×B. Thus the new inverse excision edge has exactly the required source and target.
2. Excision identifies H*(S,T) with the source product pair, so this intermediate pair is good. Künneth identifies the boundary target with the product of the other two good vertices.
3. Construct the inverse excision map already in C(Good,H_B), since a faithful exact functor reflects isomorphisms. Each such inverse is present at the same finite diagram containing the original isomorphism, so no uncontrolled limit is needed.
4. The marked universal property supplies functors in both directions between the original and enlarged diagram categories; generation and compatibility show they are inverse.
5. Use Good_ex for the tensor proof. Transfer the resulting tensor structure to the equivalent very-good-pair category; do not require a product on the raw very-good-pair quiver.

Planning API:

| Name | Contract |
| --- | --- |
| Nori.GoodExcision.incl (constructor) | The original good-pair diagram embeds with unchanged vertex representation. |
| Nori.GoodExcision.inverse (data) | The adjoined edge represents the inverse of the indicated excision restriction. |
| Nori.GoodExcision.categoryEquiv (equivalence) | The induced diagram category is equivalent over rational vector spaces to C(Good,H_B). |
| Nori.GoodExcision.boundaryProduct (data) | The two-edge path just specified realizes the product of a boundary and an identity. |
| Nori.GoodExcision.finiteSupport (compatibility) | Every inverse edge and every finite product path can be represented over one finite endomorphism algebra. |

Uses:

- MotivesAndAlgebraicCycles:MC.5/completion-tensor-assembly: Product maps for all original generators must exist before assembling the coefficient bialgebra.
- MotivesAndAlgebraicCycles:MC.5/graded-multiplicative-diagram: This replaces the unsupported claim that the unmodified good-pair diagram already has boundary products.

Discriminating unit tests:

- **Nori.GoodExcision.emptyOpen** (degenerate): For U=∅, the inverse excision map is the identity.
- **Nori.GoodExcision.nonGoodIntermediate** (non-example): Take X=A¹, Y={0,1}, Z=∅, n=0; A=A² and B the smooth affine cubic y²=x³−x, m=2. The inserted pair (Y×A∪X×B,Y×B) has nonzero H¹ and H², and is not good in degree two. The two-edge construction avoids it.
- **Nori.GoodExcision.boundaryRank** (computation): For X=A¹, Y={0,1}, Z=∅ and (A,B)=(A¹,{0,1}), the product boundary Q²⊗Q→Q⊗Q has rank one. A zero map or a reversed restriction fails this test.

Checks:

- The new edge goes against restriction, not in the original geometric direction.
- The abelian category and its coalgebra description are preserved up to canonical fibre-compatible equivalence.

Sources:

- [HM25](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-errata/buch-errata.pdf), Erratum dated 2025-06-27, the added definition and corrected Proposition 9.3.1, pp. 222–224; corrected proof of Theorem 9.3.4, p. 225. Inverse excision edges repair the direction error and do not change the universal abelian category. The two-edge path here uses the boundary for the excised lower term directly.

#### Tensor structure from finite coefficient maps

Node: MotivesAndAlgebraicCycles:MC.5/completion-tensor-assembly.

The Nori coalgebra of good pairs, after the inverse-excision completion, is a commutative bialgebra. Its multiplication is dual to the finite endomorphism-algebra maps induced by products of diagram vertices and generator maps. The native tensor product on finite right comodules therefore makes effective Nori motives a symmetric Q-linear abelian tensor category, with faithful exact tensor Betti functor. For the usual cohomological cross product κ(a⊗b)=a×b, the underlying boundary products are δa×b on the first factor and a×δb on the second; the latter is (−1)^deg(a) times the geometric total-boundary path. The ordinary symmetry is (−1)^{nm} times geometric interchange on degree n,m vertices. Equivalently, for the source convention τ^{-1}(a⊗b)=(−1)^{nm}a×b, a first-factor edge of parity r contributes (−1)^{rm}, and a second-factor edge contributes no sign.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-excision-completion, MotivesAndAlgebraicCycles:MC.5/completion-filtered-descent, MotivesAndAlgebraicCycles:MC.5/completion-triple-adapter, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality, tauceti:TauCeti.FGComoduleCat.tensorUnit.

Proof route:

1. Construct products of pullback generators geometrically. Construct boundary products by the preceding node and the cochain Leibniz rule. Inverse excision generators tensor to inverse excision isomorphisms. All constructions have finite support.
2. For finite diagrams F,G choose a finite H containing their products and all product paths. Endomorphisms of H act on the external tensor representation, giving E_H→E_F⊗E_G. The finite-dimensional identity End(T_F⊠T_G)=End(T_F)⊗End(T_G) follows by expressing the edge conditions as kernels and using exactness of tensor over a field.
3. Dualize to E_F∨⊗E_G∨→E_H∨ and pass to the filtered colimit. At a common finite stage, product coherence and units give the bialgebra identities; finite support descent makes choices independent.
4. Apply the existing finite-comodule tensor and symmetry machinery. The explicit sign transport is needed to turn graded geometric interchange into the ordinary symmetry seen by the fibre functor.
5. Tensor is exact in each variable because the fibre functor is faithful exact, its tensor comparison is an isomorphism, and tensoring vector spaces is exact.

Checks:

- Two boundary generators give the Koszul interchange sign before the sign-corrected tensor is formed.
- On a degree-one class the geometric factor swap is negative, while the fibre of the categorical symmetry is the ordinary flip.
- The tensor unit is H_N^0(Spec Q)=Q and Künneth is realized by an actual motivic map.

Sources:

- [HM25](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-errata/buch-errata.pdf), Definition 8.1.3 and Proposition 8.1.5, pp. 180–183; corrected Proposition 9.3.1 and Theorem 9.3.4, pp. 222–225. A multiplicative representation gives coefficient multiplication, once all boundary products and inverse excisions are present.
- [BVHP](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/huber-TT1.pdf), Definitions 2.11–2.15 and Theorem 2.18, pp. 11–14. The graded tensor relations and their sign correction give an ordinary symmetric tensor category.

#### Tensor inversion of the Nori Lefschetz object

Node: MotivesAndAlgebraicCycles:MC.5/completion-tate-localisation.

Let L=H_N^1(G_m,{1})=Q_N(−1) in effective Nori motives. The existing localization at L is equivalent to the diagram category obtained by adjoining all integer Tate twists to the corrected good-pair diagram, and to finite comodules over the coefficient bialgebra localized at the group-like coefficient of L. The Betti functor extends with ω_B(L)=Q, and L becomes tensor-invertible. Effective→full Nori motives is faithful exact; fullness is not asserted. The ungraded symmetry on L⊗L is the identity even though its geometric degree-one factor swap acts by −1.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-tensor-assembly, MotivesAndAlgebraicCycles:MC.5/diagram-localisation.

Proof route:

1. Use the existing object-inversion construction; supply its rank-one fibre and symmetry hypotheses using the explicit Betti generator and the sign-corrected tensor.
2. Identify the localized coefficient with the group-like coefficient of L and extend coactions. Negative twists are dual powers of the rank-one object.
3. Compare the vertex representations and invoke marked universality; check the unit, evaluation and inverse-twist maps rather than identifying only dimensions.

Checks:

- L⊗L^{-1}→1 is an isomorphism with the prescribed evaluation.
- The objects Q_N(j) satisfy Q_N(i)⊗Q_N(j)≅Q_N(i+j) for all integers, including negative ones.
- The proof never uses fullness of the effective inclusion.

Sources:

- [HM25](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-errata/buch-errata.pdf), Definition 9.3.2, Proposition 9.3.3, Theorem 9.3.4 and Remark 9.3.5, pp. 224–225; Proposition 8.2.5, pp. 190–192. Tensor localization agrees with diagram and coefficient localization; fullness of the effective inclusion is not supplied.

#### Duality on generators and rigidity

Node: MotivesAndAlgebraicCycles:MC.5/completion-rigidity-proof.

Over Q with rational coefficients the full Nori category is rigid, and its Betti functor is a neutral fibre functor. For the normal-crossings generator H_N^n(X,Y), with (X,Y)=(W∖D_∞,D_0∖D_∞) from a smooth projective n-dimensional W, its dual is H_N^n(W∖D_0,D_∞∖D_0)(n). The coevaluation is constructed by the diagonal class and Gysin maps with supports; its Betti dual pairing is perfect by Poincaré–Lefschetz duality. Generators and subquotient rigidity extend this to every object. In particular, for any algebraic pair (X,Y), the dual object of H_N^i(X,Y) has Betti realization H_i(X(C),Y(C);Q) by finite-dimensional universal coefficients. Dualizing the cohomological triple sequence gives the natural exact homological triple sequence, with connecting map from degree i+1 of (X,Y) to degree i of (Y,Z). For disconnected varieties all statements are componentwise: top cohomology is not asserted to be a single Tate object without geometric connectedness/irreducibility.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-tate-localisation, MotivesAndAlgebraicCycles:MC.5/completion-all-pairs-extension, MotivesAndAlgebraicCycles:MC.5/nori-generators, MotivesAndAlgebraicCycles:MC.5/nori-gysin-isomorphism, MotivesAndAlgebraicCycles:MC.5/nori-duality-morphism, MotivesAndAlgebraicCycles:MC.5/rigidity-criterion, SchemeAndStackFoundations:SF.4, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality.

Proof route:

1. Use resolution/principalization and an affine-bundle replacement to obtain the existing normal-crossings generator statement; these geometric inputs are part of the SF.4 request.
2. Retain the rational Artin H^0 object and its trace: the diagonal need not split into geometrically connected components over Q. Check the existing Gysin construction on complex components and descend the total diagonal class; do not replace the Artin factor by a rank-one Tate object.
3. Construct coevaluation via the support map from the diagonal into the product pair, and the tensor comparison already established. Poincaré–Lefschetz duality makes its fibre a perfect pairing.
4. Use the existing rigidity criterion over Q. The antipode/strong-dual identities propagate through finite sums and subquotients because the fibre is exact and finite-dimensional. Dualize the previously constructed pair objects and triple maps to obtain the homological exports, with the underlying Betti identification supplied by universal coefficients. Do not claim rigidity of the effective category.

Checks:

- The dual of Q_N(−1) is Q_N(1), which belongs to the full category.
- For Spec Q(i), H^0 has rank two; a rank-one Tate replacement fails.
- Coevaluation and evaluation satisfy both triangle identities after the faithful Betti functor.

Sources:

- [HM25](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-errata/buch-errata.pdf), Corollary 9.2.23, pp. 221–222; Lemmas 9.3.8–9.3.9 and Theorem 9.3.10, pp. 225–228; Proposition 8.3.4, pp. 194–196. Normal-crossings generators carry geometric perfect pairings, and the rigidity criterion propagates duals through generated subquotients.
- [HMS14](https://arxiv.org/pdf/1105.0865v5), Lemma 1.13 and Theorem 1.14, p. 8; Appendix C, Proposition C.4, pp. 27–28. This is Nori’s generator-based rigidity argument, used with the corrected component hypotheses of the existing packet.

### D. The two fibres

#### Relative de Rham data required by the Nori fibre extension

Node: MotivesAndAlgebraicCycles:MC.5/completion-de-rham-interface.

Over Q, the geometric input to the de Rham Nori fibre is a functor on algebraic pairs (X,Y,n)↦H_dR^n(X,Y/Q), with pullback, triple boundary, finite dimension, products, unit, integer Tate twist, and a natural comparison H_dR^n(X,Y/Q)⊗_Q C≅H_B^n(X,Y;Q)⊗_Q C compatible with all these maps. For arbitrary singular pairs the de Rham object is defined by smooth proper hypercover descent or the h-topology and the shifted cone for Y→X; it is not the naive Kähler complex of a singular scheme. This is the exact input contract to the already-owned MC.6/fibre-functor-extension. Its existence beyond the current smooth/proper and curve comparisons is an explicitly recorded supplier gap.

Dependencies: ComplexComparisonPartII:C0/repair-analytification, ComplexComparisonPartII:C5/repair-proper-de-rham-betti, ComplexComparisonPartII:C5/multiplicative-period-interface, MotivesAndAlgebraicCycles:MC.6/fibre-functor-extension, MotivesAndAlgebraicCycles:MC.5/completion-triple-adapter.

Proof route:

1. Consume the existing smooth de Rham complex, proper comparison and product/trace interface from ComplexComparisonPartII.
2. The missing extension must construct smooth proper hypercovers of a pair, prove cohomological descent and independence, and transport the shifted-cone boundary and multiplicative comparisons. The h-topological construction in the source is an alternative with the same contract.
3. Do not infer the arbitrary-pair comparison from the current C5 smooth proper theorem. Record the extension as a distinct proposed continuation of that roadmap and keep this stage planned until its owner is installed.

Checks:

- On a smooth proper X, the comparison specializes to the existing C5 comparison.
- For Y=X the shifted cone is acyclic, so all relative groups vanish.
- The node is a geometric supplier contract, not a second construction of abstract fibre-functor extension.

Sources:

- [HM17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf), Definitions 3.3.6 and 3.2.6, pp. 88–89 and 84; Proposition 3.3.7, p. 89; Definition 5.4.1 and Lemma 5.4.2, pp. 111–112; Lemma 5.5.1, Definitions 5.5.3–5.5.4 and Lemma 5.5.5, pp. 113–115. These supply relative de Rham cohomology and the comparison in the singular case through descent, rather than the naive singular de Rham complex.

#### Betti and de Rham fibre functors on full Nori motives

Node: MotivesAndAlgebraicCycles:MC.5/completion-two-fibres.

Using the relative geometric de Rham input, the existing MC.6 fibre-functor extension gives an exact faithful tensor functor ω_dR:MM_Nori(Q,Q)→Vect_fd(Q), the existing exact faithful tensor Betti functor ω_B:MM_Nori(Q,Q)→Vect_fd(Q), and a tensor natural comparison ω_dR(−)⊗_Q C≅ω_B(−)⊗_Q C. All integer twists, evaluation and coevaluation are included. Both are neutral rational fibre functors. The existing canonical Nori definitions and MC.6 extension are used over Q; extending the motivic base field is outside this pass.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-de-rham-interface, MotivesAndAlgebraicCycles:MC.5/completion-universal-factorisation, MotivesAndAlgebraicCycles:MC.5/completion-rigidity-proof, MotivesAndAlgebraicCycles:MC.6/fibre-functor-extension.

Proof route:

1. Form the abelian comparison category of two finite rational vector spaces with an isomorphism over C. Its Betti projection is faithful exact because C is faithfully flat over Q.
2. Apply the already-owned fibre extension to the pair representation, then the tensor comparison on good generators and uniqueness extend it to the category.
3. The inverse Lefschetz object maps to the dual rank-one comparison object, so the construction extends to every integer twist and respects duality.

Checks:

- Both fibres are Q-linear neutral fibre functors on the same full Nori category.
- For a negative Tate twist, comparison is the inverse power of the Lefschetz scalar.
- The comparison commutes with triple boundaries, not merely with pullbacks.

Sources:

- [HM25](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-errata/buch-errata.pdf), Theorem 9.1.10, pp. 211–212, and its proof in §9.3.1, pp. 228–229. Comparison-valued representations extend by marked universality and the rank-one Tate localization.

#### The Tate pair and its normalized period

Node: MotivesAndAlgebraicCycles:MC.5/completion-tate-period.

For (G_m,{1}) over Q, H_B^1(G_m,{1};Q) is one-dimensional and maps isomorphically to H_B^1(G_m;Q); H_B^0(G_m,{1};Q)=0. The de Rham degree-one class is dz/z, its Betti dual generator is the counterclockwise unit loop, and the comparison pairing has value 2πi. Thus the Lefschetz comparison matrix is (2πi), its inverse twist has scalar (2πi)^{-1}, and integer tensor powers have (2πi)^r. No formal-period algebra or transcendence statement is constructed here.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-two-fibres, ComplexComparisonPartII:C5/curve-residue-localization, MotivesAndAlgebraicCycles:MC.5/completion-tate-localisation.

Proof route:

1. Use the pair long exact sequence: H^0(G_m)→H^0({1}) is an isomorphism, so degree-one relative and absolute cohomology agree.
2. Use the curve residue/comparison input for dz/z and the counterclockwise loop, with the complex exponential normalization.
3. Tensor compatibility and the explicit inverse-object evaluation determine every integer power.

Checks:

- Reversing the loop changes the value to −2πi.
- For the constant degree-zero point object, the comparison scalar is 1.
- The scalar is attached to specified rational and de Rham generators, not determined by dimensions alone.

Sources:

- [HM17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf), Example 11.1.4, p. 246; Proposition 9.1.2, p. 206. The chosen logarithmic form and positively oriented circle fix the Tate period and rank-one comparison.
- [HMS14](https://arxiv.org/pdf/1105.0865v5), Definition 1.3, p. 4, and Definition 1.11, p. 7. The relative and absolute descriptions of the Lefschetz object agree.

### E. Finite correspondences and geometric realization

#### The sheaf input to equivariant Nori filtrations

Node: MotivesAndAlgebraicCycles:MC.5/completion-constructible-basic-lemma.

Let X be an affine Q-variety of dimension n, W⊂X closed of dimension <n, and R either Z or Q. Let F be a sheaf of R-modules on X(C), locally constant on the members of a finite stratification by locally closed Q-subvarieties, with finite free stalks. There is a dense Zariski open U⊆X∖W with complement of dimension <n such that H^q(X(C),j!j*F)=0 for q≠n and H^n(X(C),j!j*F) is isomorphic to a finite direct sum of stalks of F. A finite family of such sheaves has a common choice of U, by applying the statement to their direct sum. In particular the top group is finite free. This stronger statement is the input for quotient-invariant filtrations; it is not inferred from the constant-sheaf Basic Lemma.

Dependencies: ComplexComparisonPartII:C0/repair-analytification, MotivesAndAlgebraicCycles:MC.5/completion-pair-finiteness, mathlib:exists_finite_inj_algHom_of_fg.

Proof route:

1. Replace F by extension by zero from X∖W, then use Noether normalization to reduce along a finite map to affine n-space. The pinned algebraic normalization theorem supplies a finite injective polynomial-algebra map, not the identification of its number of variables with dimension; the dimension/finite-Spec adapter is part of the recorded supplier gap.
2. On affine n-space enlarge the bad locus to a hypersurface and choose a coordinate projection whose restriction to that hypersurface is finite and surjective. Its coefficient sheaf vanishes on the hypersurface and is locally constant on the complement.
3. Use the variation of base change in Theorem 2.5.12, not unrestricted base change for a nonproper projection. Its exact hypothesis is that the ambient map is a locally trivial topological fibre bundle and the non-locally-constant locus is proper over the base. Fibrewise, retract a punctured affine line onto a finite embedded tree whose vertices are the bad points; its relative sheaf cohomology is in degree one and is a finite sum of stalks on the edges.
4. Algebraic stratification of the branch locus makes R¹π_*F locally constant on strata and all other direct images vanish. Induct on dimension and use the Leray spectral sequence to obtain the displayed concentration and top group. The analytic constructibility/base-change/stratification adapters are exact missing inputs in the supplier gap.
5. Use a direct sum to impose the same open set for the finite collection of quotient sheaves required by the equivariant proof.

Checks:

- For a zero-dimensional X, the assertion is the finite direct sum of its stalks in degree zero.
- For F the constant Z-sheaf on A¹, with W={0,1}, U=A¹∖W gives H¹=Z.
- The map π need not be proper; base change is used only with its proper bad locus and fibre-bundle hypotheses.

Sources:

- [HM17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf), Theorem 2.5.7, p. 47; Nori’s proof in §2.5.3, Lemmas 2.5.9–2.5.11 and Theorem 2.5.12, pp. 49–52. The Noether-normalization and coordinate-projection induction gives concentration and identifies the top group as a finite sum of stalks.
- [HARRER](https://arxiv.org/pdf/1609.05516), Theorem 4.3.8, p. 132, and the proof of Theorem 4.4.3, pp. 134–136. The coefficient-linear form and its simultaneous use for quotient sheaves give the precise equivariant input.

#### Equivariant cellularity and finite quotient invariants

Node: MotivesAndAlgebraicCycles:MC.5/completion-equivariant-filtration.

Let a finite group G act by Q-scheme automorphisms on an affine Q-variety X. Given a finite standard filtration G_i(X), with dim G_i(X)≤i, there is a larger G-invariant standard filtration F_i(X), dim F_i(X)≤i, which is integrally cellular, whose quotient filtration on X/G is integrally cellular, and for which quotient pullback is an isomorphism C•_(F/G)(X/G)≅C•_F(X)^G in effective Nori motives. Invariants are the kernel of the finite family of maps g−id in the existing abelian category. At each stage any prescribed lower-dimensional closed subset can be included. The same construction gives nice filtrations at the disjoint, isolated quotient arrows of a finite acyclic diagram, under the endpoint and no-intervening-object conditions of Harrer Lemma 4.4.7.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-constructible-basic-lemma, MotivesAndAlgebraicCycles:MC.5/completion-cellular-filtration, MotivesAndAlgebraicCycles:MC.5/completion-cellular-complex, SchemeAndStackFoundations:SF.4.

Proof route:

1. For the finite quotient π:X→X/G, pushforward of analytic sheaves is exact by proper base change and finite fibres. On every orbit the kernel of the difference maps into the product over G is the constant diagonal subgroup; its image and cokernel have finite free integral stalks by Lemma 4.4.2.
2. Apply the preceding constructible-sheaf Basic Lemma over Z simultaneously to extension by zero of the constant sheaf, its finite pushforward, and the image/cokernel difference sheaves. This gives a dense open complement where all their relative cohomology is concentrated in the top degree. Its proof adapters are recorded in the geometric supplier gap. The integral version ensures membership in the canonical integral-good diagram before rational realization.
3. The two exact sequences identify integral relative cohomology of the quotient with the G-invariants upstairs; extension to Q commutes with these finite kernels. Include the nonsmooth loci upstairs and the inverse image of the nonsmooth locus downstairs in the prescribed bad subset. Pull the closed complement back to obtain an invariant closed subset containing it, and induct on dimension to obtain the filtrations with smooth successive differences.
4. The quotient pullback is an actual morphism of Nori complexes. Its factorization through the invariant kernels is checked by faithful Betti realization; exactness identifies their fibres, and conservativity proves it is an isomorphism.
5. For the diagram version assume each chosen quotient arrow has endpoints disjoint from those of every other chosen quotient, is the only arrow between its endpoints, and has no factorization through a third object. Induct by terminal quotient pairs, keeping a previously fixed initial segment when it contains both or neither endpoint of each quotient arrow.

Checks:

- For the trivial group, quotient pullback is the identity cellular complex.
- For the transitive G-set G/H, where H is a point stabilizer, regarded as a finite reduced split scheme, H^0 of the quotient is the diagonal Q inside Q^(G/H), and pullback identifies it with invariants.
- The quotient map and invariants commute with the cellular differential; an invariant choice of individual vector spaces alone does not satisfy the theorem.

Sources:

- [HARRER](https://arxiv.org/pdf/1609.05516), Theorem 4.3.8, p. 132; Lemmas 4.4.1–4.4.2, pp. 132–133; Theorems 4.4.3 and 4.4.5, pp. 134–137; Definition 4.4.6 and Lemma 4.4.7, pp. 137–138. Constructible-sheaf vanishing yields simultaneous good pairs upstairs and downstairs, with quotient pullback identifying invariant cohomology and then Nori complexes.

#### Finite correspondences on cellular Nori complexes

Node: MotivesAndAlgebraicCycles:MC.5/completion-correspondence-action.

For smooth affine Q-varieties X,Y, an integral finite correspondence α:X↝Y determines, after compatible cellular filtrations and enlargement, a contravariant map of Nori cellular complexes. A finite correspondence is a finite Q-linear combination of integral closed subvarieties of X×Y finite and surjective over a connected component of X. The map is defined by the associated multivalued morphism and the invariant finite-cover trace, with its multiplicities; it is additive in α and extends graph pullback. Its cohomological Betti map is the usual correspondence action. This construction uses the finite-correspondence carrier of MC.4/M.5a and the symmetric-power/trace geometry requested below; no replacement category of correspondences is introduced.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-cellular-complex, MotivesAndAlgebraicCycles:MC.5/completion-equivariant-filtration, MotivicEtaleKTheory:M.5a, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent.

Proof route:

1. On a connected smooth X, encode an effective correspondence of degree d by X→Sym^d(Y); subtract effective parts only after constructing the additive action. Smoothness gives normality, the hypothesis of the multivalued-morphism comparison. Clear the finitely many rational denominators to choose integral cellular refinements for the finitely many effective integral constituents; extend the resulting maps Q-linearly only after additivity.
2. Choose an admissible filtration preserved by the correspondence. Construct the map through symmetric powers and rational invariants/trace as in §4.6; the transfer is a sum over sheets and retains multiplicities.
3. An equality of two effective sums may require a larger filtration before the corresponding maps agree. Use Proposition 4.7.2 before group-completing, then extend Q-linearly.
4. Graphs give the previously defined pullback. The symmetric-power/trace geometric constructions are a precise supplier gap, rather than silently identified with the divided-power algebra already in Mathlib.

Planning API:

| Name | Contract |
| --- | --- |
| Nori.CorrespondenceCellular.map (constructor) | The contravariant cellular map after an admissible common filtration. |
| Nori.CorrespondenceCellular.graph (compatibility) | The graph of f gives ordinary pullback f*. |
| Nori.CorrespondenceCellular.add (relation) | Maps for α+β equal the sum of maps for α and β after a common enlargement. |
| Nori.CorrespondenceCellular.betti (compatibility) | Betti realization is the sum-with-multiplicities correspondence action on singular cohomology. |
| Nori.CorrespondenceCellular.enlarge (functoriality) | Enlargement comparison maps intertwine correspondence maps; identity enlargement gives the identity. |

Uses:

- MotivesAndAlgebraicCycles:MC.5/completion-simultaneous-correspondences: Composition and additivity must hold simultaneously on the comparison diagrams.
- MotivesAndAlgebraicCycles:MC.5/completion-geometric-effective: The geometric realization begins on complexes in SmCor.

Discriminating unit tests:

- **Nori.CorrespondenceCellular.graphIdentity** (degenerate): The diagonal correspondence of X induces the identity.
- **Nori.CorrespondenceCellular.multipleDiagonal** (computation): The correspondence r·Δ_X acts by r on every cellular term for r∈Q, including zero and negative r.
- **Nori.CorrespondenceCellular.twoPoints** (computation): A degree-two effective correspondence Spec(Q)↝Spec(Q)⊔Spec(Q) containing each point once induces Q²→Q, (a,b)↦a+b on H^0. Normalizing the trace by degree gives the wrong map.

Checks:

- This does not claim a strict functor for arbitrary initial independent filtration choices.
- Negative rational combinations are treated only after proving effective additivity.

Sources:

- [HARRER](https://arxiv.org/pdf/1609.05516), Theorems 3.7.5 and 3.7.7, pp. 114–116; Definition 4.6.2 and Lemmas 4.6.1/4.6.3 and Propositions 4.7.1–4.7.2, pp. 140–144. Multivalued morphisms encode finite correspondences and induce compatible, eventually additive cellular maps, including multiplicities.

#### Simultaneous filtration for correspondence relations

Node: MotivesAndAlgebraicCycles:MC.5/completion-simultaneous-correspondences.

Every finite hom-almost acyclic diagram of smooth affine Q-varieties and finite Q-correspondences admits compatible cellular filtrations after enlargement. Here the indexing category has finitely many objects and finite hom sets; arrows in both directions force the objects to coincide; each endomorphism monoid is a finite group; and these group elements act by graphs of actual scheme automorphisms. The resulting contravariant maps preserve composition, and all prescribed finite additive relations become equalities after a common enlargement. This includes diagrams encoding a composition, an additive relation, a chain-map equation and a chain homotopy. Product filtrations give external-product comparison maps compatible with these structures.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-correspondence-action, MotivesAndAlgebraicCycles:MC.5/completion-cellular-filtration, MotivesAndAlgebraicCycles:MC.5/completion-equivariant-filtration, MotivesAndAlgebraicCycles:MC.5/completion-tensor-assembly.

Proof route:

1. Choose filtrations for effective constituent correspondences. The quotient maps in the composition diagram need the nice equivariant filtrations of the preceding node; ordinary affine cellular filtrations alone are insufficient.
2. Use eventual additivity and Theorem 4.8.1 for composition. Induct over the finite partial order of objects, retaining already fixed source filtrations and enlarging the new terminal target. Finally enlarge it to be invariant under its finite automorphism group, as in Theorem 4.8.4.
3. For bounded complexes use their finite diagram of terms and components; the relations d²=0 and d f=f d are among the finite relations. Apply the same construction to the finite diagram of a homotopy.
4. The product filtration has level n equal to the union of F_i(X)×G_j(Y) over i+j=n. Field Künneth and relative Mayer–Vietoris give its cellularity and the tensor-complex comparison. Product filtrations need not be final among all filtrations (Remark 4.9.5), so permit arbitrary common enlargements when comparing choices. Translate Harrer’s totalization convention by the specified bidegree sign.

Checks:

- A commutative square of correspondences yields a commutative square after a common enlargement.
- A null-homotopic map gives a null-homotopic cellular map after enlarging the homotopy diagram.
- Finite group automorphisms are allowed only when represented by actual scheme automorphisms; arbitrary cyclic diagrams are outside the theorem.

Sources:

- [HARRER](https://arxiv.org/pdf/1609.05516), Definition 1.2.9, p. 20; Theorem 4.8.1, pp. 145–147; Definition 4.8.3 and Theorem 4.8.4, p. 148; Propositions 4.7.1–4.7.2, pp. 141–144; Definitions 4.9.1 and Propositions 4.9.2–4.9.7, pp. 149–154. Eventual composition and equivariant refinement give functorial filtrations for hom-almost acyclic diagrams; product comparisons survive further enlargement.

#### Cellular Nisnevich covers for correspondences

Node: MotivesAndAlgebraicCycles:MC.5/completion-nisnevich-bridge.

A cellular cover-filtration for a finite acyclic diagram in SmCor(Q,Q) consists of compatible affine, unifibrantly c-rigidified cd-Nisnevich covers of all vertices, with chosen componentwise lifts of its correspondence edges, and compatible cellular filtrations of the resulting Čech correspondence diagram. The lift includes bridge data specifying the correspondence over pairs of covering schemes and its compatibility with composition. Such covers exist over Q. The extra rigidification selects lifts consistently under composition, and a cd-cover is a finite composite of covers from elementary Nisnevich distinguished squares (Harrer Definition 5.3.1, p. 170). Unifibrancy means that each base point has a chosen covering member whose fibre is a single point with the same residue field; c-rigidification chooses such points constructibly and meets every connected component (Definition 6.1.1, pp. 179–180). Covers are chosen first and filtrations second. The total Nori complex is initially bounded below; its bounded cohomology makes it an object of the bounded derived category. The collection of combined cover-filtrations is connected by comparison zigzags, not asserted to be a directed poset.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-simultaneous-correspondences, MotivicEtaleKTheory:M.5a, SchemeAndStackFoundations:SF.4.

Proof route:

1. Use the finite-correspondence and Nisnevich interfaces of M.5a. For a finite diagram construct affine covers with lifted correspondence/bridge data using the cited existence theorem.
2. Form the finite Čech diagram of isomorphism classes of connected components over each base, using chosen representatives. Despite the unbounded repeated-index Čech complex, this diagram has finitely many objects and finite hom sets and is hom-almost acyclic: use Proposition 5.5.7, pp. 176–177, and Proposition 6.6.3, pp. 194–195. This finite diagram, rather than the full infinite set of Čech occurrences, is the input to the simultaneous-filtration theorem.
3. Only now choose compatible cellular filtrations on that finite diagram and induce them on every Čech term using Theorem 6.6.2, p. 194. Totalize in the bounded-below shape of Definition 7.1.5; conjugate the source differential by the specified sign before using our convention. A repeated-index Čech direction is not bounded.
4. The existence proof needs the precise cover-lifting/bridge geometry in the supplier gap. Ordinary open-cover pullback alone does not lift a finite correspondence.

Planning API:

| Name | Contract |
| --- | --- |
| Nori.CellularCoverFiltration.cover (projection) | The affine, unifibrantly c-rigidified cd-Nisnevich covering families, with their chosen lifts and finite connected-component Čech diagram. |
| Nori.CellularCoverFiltration.bridge (projection) | The lifted correspondence over source and target covers, with its projection compatibility. |
| Nori.CellularCoverFiltration.total (constructor) | The total complex Tot^{i,−j,−k} C_F^i(Čech_j(U_k→X_k)), with the contravariant source grading fixed. |
| Nori.CellularCoverFiltration.compare (data) | A functorial refinement supplies an actual quasi-isomorphism of total complexes. |
| Nori.CellularCoverFiltration.graph (compatibility) | Graph correspondences agree, in the derived category, with the ordinary-morphism cover construction. |

Uses:

- MotivesAndAlgebraicCycles:MC.5/completion-comparison-zigzag: The zigzag construction compares any two total complexes.
- MotivesAndAlgebraicCycles:MC.5/completion-geometric-effective: Simultaneous covers make a functor on bounded complexes of finite correspondences.

Discriminating unit tests:

- **Nori.CellularCoverFiltration.affineIdentity** (degenerate): The identity cover on a smooth affine X recovers its filtered cellular complex.
- **Nori.CellularCoverFiltration.coverThenFilter** (non-example): A refinement of covers goes in the opposite direction to an enlargement of filtrations. A single directed-limit construction without both kinds of arrows does not define the comparison.
- **Nori.CellularCoverFiltration.graphComposite** (characterisation): For graphs of X→Y→Z, the lifted diagram for the composite gives the same derived map as the composition of the two graph maps.

Checks:

- Each bridge remembers the given finite correspondence and its degree/multiplicity.
- The ordinary graph case is compatible with affine cover refinement.

Sources:

- [HARRER](https://arxiv.org/pdf/1609.05516), Definitions 5.2.1 and 5.2.4, pp. 158–159; Definition 5.2.7, pp. 160–161; Definition 5.2.14 and Proposition 5.2.15, pp. 163–165; Definition 5.3.1, p. 170; Definitions 5.5.6 and Proposition 5.5.7, pp. 176–177; Definition 6.1.1, pp. 179–180; Definition 6.5.1 and Theorem 6.5.3, pp. 192–193; Definition 7.1.2, Theorem 7.1.3 and Remark 7.1.4, p. 198. Bridges lift correspondences through suitably rigidified affine Nisnevich covers; the two directions of refinement require zigzags.

#### Comparison maps for cover-filtration choices

Node: MotivesAndAlgebraicCycles:MC.5/completion-comparison-zigzag.

For a bounded complex X• of smooth varieties with finite correspondences, and any two cellular Nisnevich cover-filtrations F,G, there is a derived isomorphism φ_FG:C_G(X•)≅C_F(X•). It is independent of auxiliary common covers and filtration enlargements, satisfies φ_FF=id and φ_FG φ_GH=φ_FH, and is natural for maps of complexes of correspondences. Each isomorphism is a zigzag of explicitly constructed refinement quasi-isomorphisms. The derived Betti functor detects these quasi-isomorphisms but is not used to invent maps.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-nisnevich-bridge, MotivesAndAlgebraicCycles:MC.5/completion-simultaneous-correspondences, MotivesAndAlgebraicCycles:MC.5/completion-all-pairs-extension.

Proof route:

1. Choose a common affine Nisnevich refinement of the two covering systems before choosing common enlarged filtrations.
2. Construct the comparison maps of total complexes. Their Betti maps are quasi-isomorphisms by Čech descent and the cellular comparison.
3. For any two auxiliary choices choose a common further covering refinement, then enlarge all filtrations in the resulting finite diagram. The resulting commutative diagram proves independence.
4. Repeat with three choices for the cocycle and with a morphism for naturality. The fibre is faithful exact, hence its derived functor conservative; fullness is neither needed nor available.

Checks:

- A refinement followed by its inverse is the identity in the derived category.
- The three-choice cocycle holds before the realization is called a functor.
- For graphs this specializes to the ordinary variety realization.

Sources:

- [HARRER](https://arxiv.org/pdf/1609.05516), Lemma 7.1.8, Corollary 7.1.11, Proposition 7.2.3 and Theorem 7.2.4, pp. 199–204. Refinement maps are quasi-isomorphisms; common-cover/common-enlargement zigzags prove independence, cocycle and naturality.

#### Effective geometric motives have Nori realization

Node: MotivesAndAlgebraicCycles:MC.5/completion-geometric-effective.

Over Q there is a contravariant triangulated tensor functor R_N^eff:DM_gm^eff(Q,Q)→D^b(MM_Nori^eff(Q,Q)). On a smooth X its Betti image computes RΓ_sing(X(C),Q); on the motive of a very good pair (X,Y,n), its value is H_N^n(X,Y)[−n]. It extends the graph-only variety realization, is compatible with finite correspondences and carries the affine-line homotopy and Nisnevich Mayer–Vietoris relations to zero. Tensor compatibility is the natural external-product comparison of the constructed complexes. No equivalence of the two categories is asserted.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-comparison-zigzag, MotivesAndAlgebraicCycles:MC.5/completion-tensor-assembly, MotivesAndAlgebraicCycles:MC.4/effective-geometric-motives, MotivesAndAlgebraicCycles:MC.4/homotopy-invariance-and-mayer-vietoris, MotivicEtaleKTheory:M.5a, mathlib:DerivedCategory.

Proof route:

1. Assign a Nori total complex to a bounded complex in SmCor. The cocycle and naturality of choice comparisons define its derived functor on complexes and their homotopy category.
2. The imported Betti homotopy invariance and Nisnevich descent kill the HI and MV relations. Conservativity detects that their Nori total complexes are zero.
3. Descend through the localization defining geometric motives; extend to the idempotent completion using splitting of idempotents in the bounded derived category of an abelian category.
4. The Betti cohomology is bounded, so the result lies in D^b. Construct the external-product map on total complexes first; its Betti Künneth isomorphism and coherence make it a tensor comparison.
5. Check the Tate-shift convention using M(P¹)/M(point) rather than transferring a different normalization of the source Tate symbol.

Checks:

- R_N^eff(M(Spec Q))=Q_N[0].
- R_N^eff(M(A¹))≅Q_N[0].
- R_N^eff(M(P¹))≅Q_N[0]⊕Q_N(−1)[−2].
- The target is a derived category of an abelian category; its heart is not identified with all geometric motives.

Sources:

- [HARRER](https://arxiv.org/pdf/1609.05516), Theorem 7.3.1 and Remark 7.3.2, pp. 205–207; Theorem 7.4.10, pp. 209–210. The construction descends from complexes of correspondences to effective geometric motives and is tensor for field coefficients.

#### Tate-stabilized geometric comparison

Node: MotivesAndAlgebraicCycles:MC.5/completion-geometric-full.

With the MC.4 convention M(P¹)=Q⊕Q(1)[2], the realization sends Q(1) to Q_N(−1)[0], hence Q(1)[2] to Q_N(−1)[−2]. It extends to a contravariant triangulated symmetric tensor functor R_N:DM_gm(Q,Q)→D^b(MM_Nori(Q,Q)), compatible with Betti realization, effective inclusion, shifts and all integer twists. In general R_N(M(j)[r])≅R_N(M)⊗Q_N(−j)[−r]. It respects evaluation/coevaluation of dualizable objects. This is a sourced comparison functor, without a claim of fullness, faithfulness or equivalence.

Dependencies: MotivesAndAlgebraicCycles:MC.5/completion-geometric-effective, MotivesAndAlgebraicCycles:MC.5/completion-tate-localisation, MotivesAndAlgebraicCycles:MC.5/completion-rigidity-proof, MotivesAndAlgebraicCycles:MC.4/tate-stabilised-motives, MotivesAndAlgebraicCycles:MC.4/motive-of-projective-space.

Proof route:

1. Identify Harrer’s Λ_DM(1) with the usual MC.4 object Q(1): his displayed degrees are cochain degrees. The reduced projective-line summand is shifted by [−2], and Lemma 1.10.12 gives the reduced G_m complex shifted by [−1]. His Lemma 7.4.15 gives Q_N(−1)[0].
2. Use contravariance under shifts to obtain R_N(Q(1)[2])=Q_N(−1)[−2]. The image of Q(1) is tensor-invertible in the bounded derived category after adjoining Q_N(1).
3. Apply tensor localization and idempotent completion to extend the functor, using the existing MC.4 stabilization rather than constructing another category.
4. The monoidal comparison from the effective functor commutes with the stabilization transition. It preserves strong duality by the tensor functor identities; Betti comparison extends to all twists.

Checks:

- Q(1) has one-dimensional realization in cohomological degree zero; Q(1)[2] has it in degree two.
- R_N(M[1])=R_N(M)[−1].
- For a smooth projective d-fold, its geometric duality maps realize the Nori duality pairing with the displayed Tate normalization.

Sources:

- [HARRER](https://arxiv.org/pdf/1609.05516), Definition 1.10.6, pp. 47–48, and Lemma 1.10.12, p. 48; Lemma 7.4.15 and Theorems 7.4.16–7.4.17, pp. 212–213. The source represents the usual Tate object by a reduced projective-line complex shifted by [−2]; its cochain degrees and the contravariant shift rule give the full localization functor.

## Boundary-product check and source findings

The inverse-excision correction is a mathematical dependency of tensor
construction. It is not enough to know that two vector spaces have the same
dimension. Put

S=(Y×A) ∪ (X×B), T=(Z×A) ∪ (X×B), V=(Z×A) ∪ (Y×B).

Excision gives H*(S,T)≅H*(Y×A,Z×A ∪ Y×B). For the triple
X×A ⊇ S ⊇ T its boundary has the required target H^{n+m+1}(X×A,S).
Naturality for the inclusion T⊇V gives
δ_(S,T)=δ_(S,V) ∘ res_(T,V), where res_(T,V):H*(S,T)→H*(S,V).
Thus the two-edge path uses precisely the desired composite without requiring
(S,V,n+m) to be good. The equality is checked in cohomology before the tensor
category is assembled. Faithful exactness then checks the corresponding
identities between already constructed motivic maps.

For a concrete failure of the extra intermediate, take X=A¹, Y={0,1}, Z=∅,
n=0; take A=A² and B the smooth connected affine curve y²=x³−x, m=2.
The curve is an elliptic curve with one point removed; H⁰(B;Q)=Q and
H¹(B;Q)=Q². Both (Y,Z,0) and (X,Y,1) are good, and (A,B,2) is good.
For V=Y×B, the closed-cover Mayer–Vietoris sequence gives

H*(S,V) ≅ H*(Y×A,Y×B) ⊕ H*(X×B,Y×B).

The first summand has H²=Q⁴. The second equals H*(X,Y)⊗H*(B), so has
H¹=Q and H²=Q². Consequently H¹(S,V)≠0, and the intermediate is not a
degree-two good vertex. In contrast, (S,T,2) is good by excision. This check
uses compatible algebraic closed-cover excision, not an unjustified topological
open-cover assertion.

### MotivesAndAlgebraicCycles/E48

Version and location: HM17, Proposition 9.3.1, pp. 218–219, Version 6 author preprint.

The claimed product of a boundary with an identity is built using a functoriality arrow in the direction opposite to the cohomological pullback. The inclusion of pairs induces restriction from the larger pair to the smaller one; the path used in the proof needs the reverse map. An actual inverse excision isomorphism is required.

Correction: Adjoin inverse excision edges, prove that they preserve the diagram category, and construct a product path in that corrected diagram.

Status: Authors’ erratum dated 27 June 2025 in the annotated 1 July 2025 version, pp. 222–225; communicated by Paul Rodriguez. Effect: the proof.

Correction searches: Author errata page https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-errata/buch.html; Annotated 1 July 2025 PDF §9.3; arXiv:1105.0865v5 Appendix B and §1.

### MotivesAndAlgebraicCycles/E49

Version and location: HM25, Corrected product path after Proposition 9.3.1, p. 224, annotated 1 July 2025 author version only.

The corrected three-edge path still uses the intermediate vertex (Y×A∪X×B,Z×A∪Y×B,n+m) as a vertex of the good-pair diagram. Take X=A¹, Y={0,1}, Z=∅, n=0 and A=A², B the smooth connected affine plane cubic y²=x³−x, m=2 over Q. Both endpoint triples are integral good pairs. For S=Y×A∪X×B and V=Y×B, relative Mayer–Vietoris decomposes H*(S,V) as H*(Y×A,Y×B)⊕H*(X×B,Y×B). The second summand is H*(X,Y)⊗H*(B), giving H¹=Q and H²=Q², while the first adds H²=Q⁴. Thus H¹(S,V)≠0, so (S,V,2) is not a good vertex. The two-edge path through (S,Z×A∪X×B) is defined and equals the intended cohomological boundary by naturality.

Correction: Omit that intermediate vertex. After inverse excision use directly the boundary of X×A⊇Y×A∪X×B⊇Z×A∪X×B. Its source and target are good by excision and Künneth.

Status: new Effect: the proof.

Correction searches: Author errata landing page as accessed 19 October 2026; Annotated PDF dated 1 July 2025, corrected path on p. 224; Version 6 author preprint Proposition 9.3.1 for comparison.

E48 is already acknowledged by the authors. E49 is scoped to the annotated
author version read here; it is not a finding against unseen publisher text.
The counterexample and two-edge repair require independent review. Tensor is
transported to C(VGood) through the diagram-category equivalence: no raw product
on the VGood quiver is assumed, because excision intermediates can lose the
very-good geometric conditions.

## Exact supplier requests and remaining gaps

These are imports and named extensions of the owning roadmaps. They are not
claims that a broad stage name already proves a missing theorem.

- **tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-1-representations-of-a-quiver-as-kq-modules**: Use the native functor representation Paths(Q)→ModuleCat(K); only the compatible-endomorphism algebra is specialized here. No new path algebra or category of quiver representations is requested. Consumers: MotivesAndAlgebraicCycles:MC.5/completion-finite-end-model.
- **tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations**: Finite relative CW cohomology and finite generation for an analytified algebraic pair once its compatible finite homotopy/triangulation model is supplied. MC.5 supplies the algebraic specialization; AT does not own algebraic triangulation or the affine-dimension theorem. Consumers: MotivesAndAlgebraicCycles:MC.5/completion-pair-finiteness, MotivesAndAlgebraicCycles:MC.5/completion-affine-vanishing.
- **tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent**: Use the existing product, field Künneth, finite-cover trace and finite ordered-cover descent interfaces, including totalization signs. MC.5 constructs the algebraic-pair/finite-correspondence adapters, not these general topological results. Consumers: MotivesAndAlgebraicCycles:MC.5/completion-pair-finiteness, MotivesAndAlgebraicCycles:MC.5/completion-affine-cover, MotivesAndAlgebraicCycles:MC.5/completion-tensor-assembly, MotivesAndAlgebraicCycles:MC.5/completion-correspondence-action.
- **tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality**: Relative singular cochains and the field universal-coefficient identification with dual homology; triple exactness/naturality; external product boundary signs; Poincaré–Lefschetz duality for the oriented real blow-up/normal-crossings compactification pairs. The normal-crossings manifold-with-corners bridge is the geometric specialization needed by Basic Lemma and rigidity. Consumers: MotivesAndAlgebraicCycles:MC.5/completion-pair-finiteness, MotivesAndAlgebraicCycles:MC.5/completion-triple-adapter, MotivesAndAlgebraicCycles:MC.5/completion-basic-lemma-proof, MotivesAndAlgebraicCycles:MC.5/completion-tensor-assembly, MotivesAndAlgebraicCycles:MC.5/completion-rigidity-proof.
- **SchemeAndStackFoundations:SF.4**: In characteristic zero, embedded resolution/principalization of a prescribed boundary, a smooth proper normal-crossings compactification with the pair excision comparison, and the ample-hyperplane arrangement of HMS Version 6 Lemma 2.5.8 making the swapped complement affine while the original X is already affine. Also the affine-bundle (Jouanolou) replacement used for normal-crossings generators. These are named birational/compactification inputs, not an arbitrary-characteristic resolution claim. Consumers: MotivesAndAlgebraicCycles:MC.5/completion-basic-lemma-proof, MotivesAndAlgebraicCycles:MC.5/completion-rigidity-proof.
- **MotivicEtaleKTheory:M.5a**: The finite-correspondence category with integral multiplicities and Q-linearization, its bounded homotopy presentation modulo affine-line and Nisnevich Mayer–Vietoris relations, and its map to the existing effective geometric category. Do not reconstruct finite correspondences or motivic localization in MC.5. The extra symmetric-power action and correspondence-cover bridge are separately recorded gaps. Consumers: MotivesAndAlgebraicCycles:MC.5/completion-correspondence-action, MotivesAndAlgebraicCycles:MC.5/completion-nisnevich-bridge, MotivesAndAlgebraicCycles:MC.5/completion-geometric-effective.

### Compatible algebraic-pair triangulation and affine analytic dimension input

The exact target statements are specified, with HM17 Proposition 2.6.10 and the proof preceding Corollary 2.6.14 and Theorem 2.3.12 as sources. The first needs a relative compatible semialgebraic triangulation of compactifications and boundaries. The second needs the affine CW-dimension theorem of Hamm/Kaup/Narasimhan (HM17 cites Hamm 1983 Satz 1 with the 1986 correction), not just general finite CW type. Current RealAlgebraicGeometry explicitly excludes triangulation and current AlgebraicTopology starts from supplied CW/manifold carriers. Propose a RealAlgebraicGeometry Part II for the generic triangulation input, and a complex affine topology continuation for the affine theorem; acquire/read the cited primary proofs before marking these proof leaves closed. No unsupported existing stage is used as their owner.

Needed by: MotivesAndAlgebraicCycles:MC.5/completion-pair-finiteness, MotivesAndAlgebraicCycles:MC.5/completion-affine-vanishing, MotivesAndAlgebraicCycles:MC.5/completion-basic-lemma-proof.

### Normal-crossings topological duality adapter

AlgebraicTopology Stage 6 supplies manifold Poincaré–Lefschetz duality, but application to two normal-crossings boundaries requires an oriented real blow-up/manifold-with-corners model and its relative comparison. HM17 Theorem 2.4.5, pp. 42–45, uses this algebraic-pair duality. The existing roadmap does not state this algebraic corners adapter. Install it in a continuation of geometric/complex topology, with exact source proof, before calling this chain closed.

Needed by: MotivesAndAlgebraicCycles:MC.5/completion-basic-lemma-proof, MotivesAndAlgebraicCycles:MC.5/completion-rigidity-proof.

### Arbitrary-pair multiplicative de Rham comparison needs an owner

ComplexComparisonPartII:C5 currently supplies smooth proper comparison and regular-singular/nonproper curve interfaces, not smooth proper hypercover descent for arbitrary singular pairs. MC.6/fibre-functor-extension already owns the abstract extension, so do not duplicate it. Propose a ComplexComparison Part III for the exact geometric contract in completion-de-rham-interface (HM17 Definitions 3.3.6 and 3.2.6, Proposition 3.3.7, Definition 5.4.1, Lemmas 5.4.2/5.5.1/5.5.5 and Definition 5.5.4), including product and triple-boundary compatibility. The full MC.5 de Rham target is conditional on that supplier; the curve Tate computation can use the existing C5 curve interface independently.

Needed by: MotivesAndAlgebraicCycles:MC.5/completion-de-rham-interface, MotivesAndAlgebraicCycles:MC.5/completion-two-fibres, MotivesAndAlgebraicCycles:MC.5/completion-tate-period.

### Stratified Betti sheaves, finite quotients and correspondence bridges

The sourced comparison theorem is fully specified and its main construction decomposed, but its geometric proof inputs need a lower-tier owner: finite symmetric powers of the relevant separated/AF schemes with sum/composition/product laws; the geometric adapters to the constructible-sheaf Basic Lemma proof (HM17 Theorem 2.5.7, p. 47, and Nori’s proof in §2.5.3, pp. 49–52): Noether normalization as a finite map to affine n-space with the dimension identification, algebraic stratifications for the higher direct image of the coordinate projection, and the fibre-bundle/proper-bad-locus base-change statement of Theorem 2.5.12; proper-base-change and extension-by-zero adapters for finite quotient sheaves; the normal-base equivalence between finite correspondences and multivalued morphisms (Harrer Theorems 3.7.5/3.7.7); the finite-cover rational invariant/trace action; and the cover-lifting/bridge existence theorem of Harrer chapters 5–6, especially Theorem 6.5.3. These are not the divided-power algebra of a module in Mathlib. Extend SchemeAndStackFoundations in the direction of finite quotients and relative cycles, with these precise targets, then import them here. Generic symmetric products are not redeveloped in MC.5; equivariant cellularity, the Nori correspondence action and totalization are its adapters. The sheaf Basic Lemma now has its own precise target and sourced inductive proof route; its analytic/geometric adapters remain here as gaps. The ordinary constant-sheaf Basic Lemma is not substituted for it.

Needed by: MotivesAndAlgebraicCycles:MC.5/completion-constructible-basic-lemma, MotivesAndAlgebraicCycles:MC.5/completion-equivariant-filtration, MotivesAndAlgebraicCycles:MC.5/completion-correspondence-action, MotivesAndAlgebraicCycles:MC.5/completion-nisnevich-bridge, MotivesAndAlgebraicCycles:MC.5/completion-comparison-zigzag, MotivesAndAlgebraicCycles:MC.5/completion-geometric-effective, MotivesAndAlgebraicCycles:MC.5/completion-geometric-full.

The four gaps are part of this completed planning pass, and keep MC.5 planned
rather than closed. They specify the remaining proofs and ownership decisions;
they do not turn a named comparison into an assumed implementation. The de Rham
contract depends on the geometric supplier, while the abstract extension remains
MC.6's existing target. The Tate curve computation can also be checked using
C5/curve-residue-localization without asserting an arbitrary-pair comparison.

## Assembly and planets

The whole-roadmap nodes retain their identifiers, APIs and tests. The completion
nodes supply proof refinements and adapters, not competing definitions. Assembly
must reconcile the following routes:

| Existing MC.5 target | Completion nodes supplying its proof |
| --- | --- |
| endomorphism-coalgebra | completion-finite-end-model, completion-finite-dual, completion-filtered-descent |
| diagram-category-generation | completion-filtered-descent |
| diagram-category-universal-property | completion-abelian-reconstruction, completion-universal-factorisation |
| singular-cohomology-representation | completion-pair-finiteness, completion-triple-adapter |
| basic-lemma | completion-affine-vanishing, completion-basic-lemma-proof |
| cellular-realisation-functor | completion-cellular-filtration, completion-cellular-complex, completion-affine-cover, completion-all-pairs-extension |
| nori-tensor-category | completion-excision-completion, completion-tensor-assembly, completion-tate-localisation |
| nori-rigidity | completion-rigidity-proof |

This is a proof replacement map, not an instruction to add every listed node as
a prerequisite of every old construction. In particular, split the old
effective-pairs-diagram's effective vertices and edges from its localized/tensor
clauses: basic pair cohomology and the Basic Lemma require only the former.
Prove finite-stage generation in completion-filtered-descent before universality;
remove the old generation node's reliance on universal factorisation when
assembling that proof. Keep the coefficient construction independent of the
category-equivalence consequence. These separations prevent circular proof
dependencies when the canonical definitions and their refinements are combined.
The complete diagram-category equivalence is used after construction, rather
than assumed in its own proof. Formal-period algebras and torsors stay in MC.6.

The proposed MC.5 planet selection **replaces**, rather than adds to, the old
selection; assembly should retain at most six total:

- Nori coalgebra: MotivesAndAlgebraicCycles:MC.5/completion-filtered-descent.
- Nori's universal property: MotivesAndAlgebraicCycles:MC.5/completion-universal-factorisation.
- Nori's Basic Lemma: MotivesAndAlgebraicCycles:MC.5/completion-basic-lemma-proof.
- Nori tensor structure: MotivesAndAlgebraicCycles:MC.5/completion-tensor-assembly.
- Rigidity of Nori motives: MotivesAndAlgebraicCycles:MC.5/completion-rigidity-proof.
- Nori realization: MotivesAndAlgebraicCycles:MC.5/completion-geometric-full.

## Suggested Lean file and validation boundary

The [suggested file](../suggested/MotivesAndAlgebraicCycles--MC.5.lean) follows the
12 October WORKERS shape rule. The README is definitive. It contains one light,
real-bodied definition: the compatible-endomorphism subalgebra over a native
ModuleCat-valued functor. Its finite-dimension and native End-equivalence
milestones are propositions with admitted proofs. Two proved evaluation examples
check zero and identity. The three stronger tests above remain exact mathematical
requirements; they require finite diagram examples that are not developed in the
prototype.

The triple-boundary exactness and naturality examples invoke the pinned Tau Ceti
theorems directly. The finite-comodule examples check the existing monoidal
carrier and tensor unit. They are import checks, not new planned topology or
comodule theory. There are no admitted data definitions, fake proposition-valued
construction fields, or miniature implementations of Nori motives.

The coalgebra colimit, universal diagram category, algebraic cellular filtration,
Nori and geometric realization functors and arbitrary-pair de Rham comparison
have no pinned carriers in this prototype. Their complete statements, APIs,
tests and compatibility requirements are retained above. Elaborating the
suggested file establishes signature compatibility only.

Validation: the packet checker reports zero errors and zero warnings. The
suggested file elaborates with lean-check at the recorded pins; its only warnings
are the two admitted theorem proofs. No Lean language server or library build is
part of this validation.

## Sources and version ledger

All mathematical descriptions above are in the roadmap's own words. Locators
refer to the particular freely readable texts listed below, not to a publisher's
different pagination. The sources are available to a contributor without a
private local copy. The hashes make the two book versions distinguishable.

### HMS14

Annette Huber and Stefan Müller-Stach, [On the relation between Nori Motives and Kontsevich Periods](https://arxiv.org/pdf/1105.0865v5). arXiv:1105.0865v5, 21 May 2014. Accessed 2026-10-19.

SHA-256: e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563.

Read for the targets above: §1, Appendix B, Appendix C, Appendix D.

### HM17

Annette Huber and Stefan Müller-Stach, with contributions by Benjamin Friedrich and Jonas von Wangenheim, [Periods and Nori Motives](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf). Free author preprint Version 6, title dated 16 January 2017; author landing page identifies final version as 20 February 2017; page numbers are those of this preprint. Accessed 2026-10-19.

SHA-256: a77d6efa07d426114558c08aa6684979bb42b1dc08825c10f026d8de702c6326.

Read for the targets above: §§2.3–2.6, 3.3, 5.4–5.5, 7.1–7.5, 8.1–8.3, 9.1–9.3, 10.1; Tate period example in §11.1.

### HM25

Annette Huber and Stefan Müller-Stach, with contributions by Benjamin Friedrich and Jonas von Wangenheim, [Periods and Nori Motives, annotated version](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-errata/buch-errata.pdf). Author annotated version, 1 July 2025; page numbers differ from the published book and from Version 6. Accessed 2026-10-19.

SHA-256: 6d08014f21a616abb4ba7e177effad4d15e4a215b0f234ce3a4605c20a02b731.

Read for the targets above: §8.1, §8.2, §8.3; §9.1; corrected §9.3, including erratum of 27 June 2025; §10.1; authors’ errata landing page.

### VW

Jonas von Wangenheim, [Nori-Motive und Tannaka-Theorie](https://arxiv.org/pdf/1111.5146v1). arXiv:1111.5146v1; arXiv submission 22 November 2011, downloaded PDF internal title date 13 September 2018; identified by hash. Accessed 2026-10-19.

SHA-256: ac48f5a80a465807602c2a410cbfac68ccfdfc1540532c86d19f7374ddc428d2.

Read for the targets above: §2.1–2.2, §§3.3–3.4, §4, §5.4, especially Satz 5.23.

### HARRER

Daniel Harrer, [Comparison of the Categories of Motives defined by Voevodsky and Nori](https://arxiv.org/pdf/1609.05516). Freiburg doctoral thesis, 2016, arXiv:1609.05516; printed thesis page numbers. Accessed 2026-10-19.

SHA-256: 26cd326422cd4ae1444d9a7ca60cebf74723450de522003de33784a4e09e3a06.

Read for the targets above: Conventions 1.1.3 and Definition 1.2.9; §1.10, §§3.7–3.9, chapter 4, §§5.2–5.5, §§6.5–6.6, §§7.1–7.4.

### BVHP

Luca Barbieri-Viale, Annette Huber and Mike Prest, [Tensor structure for Nori motives](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/huber-TT1.pdf). Free author preprint; published in Pacific Journal of Mathematics 306 (2020); cited page numbers are of the 19-page preprint. Accessed 2026-10-19.

SHA-256: 1bab85843513dd77f4d2b485f4a357d217a5f4283b05b15f7ad01af595dc92ce.

Read for the targets above: §1.3–1.11, §2.11–2.18, §4.

The authors' [book landing page](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/mantel.html)
identifies Version 6 as the final author text while warning that pagination
differs from the printed volume. Their
[errata page](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-errata/buch.html)
identifies the July 2025 annotated version and the product-direction correction.
HM17 locators and HM25 locators must not be interchanged. The original HMS paper
provides the route and names; the finite reconstruction proofs are supplied by
the book and von Wangenheim, and the geometric comparison by Harrer.
