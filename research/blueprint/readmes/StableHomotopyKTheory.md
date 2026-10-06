# Algebraic topology of spaces and manifolds, Part II: homotopy foundations for algebraic K-theory

This roadmap extends the Tau Ceti roadmap *Algebraic topology of spaces and manifolds* (`tauceti:TauCetiRoadmap/AlgebraicTopology`, stages 1–8) and its companion *Universal covers*. It starts where they stop: they supply singular and twisted chains, van Kampen, excision, CW and cellular machinery, Serre fibrations with their homology spectral sequence, Kan homotopy groups, Hurewicz and Whitehead. This Part II builds the homotopy theory that the Q-, plus- and S-constructions of algebraic K-theory consume: classifying spaces of categories and Quillen's Theorems A and B, homotopy fibres and the realisation theorems for simplicial spaces, the plus construction with the obstruction theory of abelian spaces, group completion of symmetric monoidal groupoids, a concrete model of spectra with its stable homotopy category, smash product, Eilenberg–Mac Lane spectra and Postnikov sections, the assembly of the K-theory spectrum, and the coefficient, completion and spectral-sequence machinery of stable homotopy theory.

The title and base follow the accepted restructuring RS-33. Every layer below is planned only as far as RS-33's `keeps` statement for it, and the mathematics RS-33 assigns to other owners is imported through the links it records. The document renders the blueprint packet `research/blueprint/packets/StableHomotopyKTheory.json`; the packet and this document agree declaration by declaration. Nothing here is formalised: every node keeps implementation status `unchecked`, and the suggested Lean file `research/blueprint/suggested/StableHomotopyKTheory.lean` gives signatures only.

## Scope and completion criterion

The roadmap is complete when the libraries supply the following, with the stated hypotheses and maps.

1. **Classifying spaces (H.1).** BC = |NC| from Mathlib's `CategoryTheory.nerve` and `SSet.toTop`, functorial in functors, with homotopies from natural transformations, homotopy equivalences from adjunctions, contractibility of categories with initial or terminal objects, the product and filtered-colimit comparisons, the CW structure, π₀, coverings and π₁ through the localisation C[C⁻¹], local systems as morphism-inverting functors, homology of categories with coefficients and its comparison with homology of BC, and BG as a K(G,1) with the bar/group-homology comparison.
2. **Homotopy fibres and Quillen's theorems (H.2).** Path-space homotopy fibres and homotopy pullbacks with transport along paths, the long exact sequence with its pointed-set end and π₁-action, quasi-fibrations and their local criteria, realisation of simplicial spaces (diagonal lemma, properness, the levelwise-equivalence and levelwise-fibration theorems), Bousfield–Kan homotopy colimits and Thomason's theorem, the homology spectral sequence of a functor, and Quillen's Theorems A and B with their prefibred forms.
3. **The plus construction (H.3).** Acyclic spaces and maps, the cell-attachment plus construction with its π₁, homology and acyclicity, the universal property, uniqueness and functoriality up to homotopy, universal central extensions and the relative forms; the obstruction theory of abelian spaces (Eilenberg–Mac Lane spaces, representability of cohomology, principal Postnikov towers, Hatcher 4.72–4.74), H-spaces as abelian spaces, Serre classes and Cartan–Serre.
4. **Group completion (H.4).** S⁻¹S for symmetric monoidal groupoids, Quillen's theorem that it localises homology, group completions and their uniqueness, the comparisons B(S⁻¹S) ≃ ℤ × BGL(R)⁺ and K₀(R) × BGL(R)⁺ through cofinality, independence of strictification, Segal's Γ-spaces and the Bhatt–Scholze model of E∞-monoids with the group-completion adjunction, and the hermitian applications of Calmès et al.
5. **Spectra (H.5:spectra).** Symmetric spectra of simplicial sets as the concrete model: integer-graded homotopy groups, stable equivalences, the stable model structure, the stable homotopy category as a triangulated category, mapping cones and fibres with their long exact sequences, smash product with the pairing on homotopy groups and its signs, ring, module and operadic algebra spectra, Eilenberg–Mac Lane spectra of groups, rings and chain complexes, cohomology representability, Postnikov sections, sequential homotopy colimits, and the comparison with deloopings, E∞-monoids and Picard groupoids.
6. **The K-theory spectrum (H.5:S-delooping).** The K-theory symmetric spectrum of a Waldhausen category assembled from the deloopings proved in GeneralAlgebraicKTheory:K.4:construction, its homotopy groups and functoriality. H.5 is the aggregate of H.5:spectra and H.5:S-delooping.
7. **Coefficients, completion and spectral sequences (H.6).** Moore spectra and E/m, the Bockstein sequence and the universal coefficient sequence (not naturally split), the mod-pʳ tower and ℚ_p/ℤ_p coefficients, homotopy limits of towers and the Milnor sequence with a nonzero lim¹ example, p-completion and its homotopy groups, rationalisation and the arithmetic square, filtered spectra, exact couples and their spectral sequences with convergence theorems, the Atiyah–Hirzebruch spectral sequence, and multiplicative Moore spectra (Araki–Toda, Burklund).

## Ownership and dependencies

- **Imported, never rebuilt.** Mathlib's nerve, realisation, simplicial homotopies, Kan complexes, homotopy groups and fundamental groupoids, CW complexes, H-spaces, group homology, Dold–Kan, localisation of categories, the Grothendieck construction, comma categories, symmetric monoidal categories, the Grothendieck group of a monoid, triangulated categories, t-structures and spectral objects; Tau Ceti's local coefficient systems, induced maps and basepoint change on homotopy groups, the loop-space shift, K(G,1) recognition and split K₀.
- **Tau Ceti AlgebraicTopology** stage 1 (van Kampen), 2 (relative and twisted singular chains), 3 (excision), 4 (CW pairs, cellular homology, cofibrations, the skeletal exact couple), 5 (Serre fibrations and the homology Serre spectral sequence), 6 (singular cohomology) and 8 (relative homotopy, Kan homotopy groups, Hurewicz, Whitehead); **UniversalCovers** stages 2 and 4.
- **Other proposed roadmaps.** GeneralAlgebraicKTheory:K.4:construction supplies additivity and the deloopings of the S-construction (node K.4/delooping-and-the-spectrum); KTheoryLowDegrees:U.1 and Z.1 supply Whitehead's lemma, perfectness of E(R) and free complements; K2SymbolsBrauer:T.1:classical supplies the recognition theorem for universal central extensions; ArithmeticGaloisDuality:R02.1 supplies lim and lim¹ of towers; EnhancedDerivedSheaves:E0 and E5:abstract supply the abstract stable and E∞ interfaces that the concrete model realises.
- **Exported.** K.1–K.7 of GeneralAlgebraicKTheory, KTheoryLowDegrees, K2SymbolsBrauer, K3BlochGroups, ArithmeticKTheory, BorelRegulators, KTheoryFiniteLocalFields, MotivicEtaleKTheory, SchemeKTheoryOperations, RefinedTraceMethods, HabiroRings, HabiroNumberFields, EllipticKTheory and EnhancedDerivedSheaves:E5:spectra-comparison consume these layers. The K-theoretic biexact pairing K(A) ∧ K(B) → K(C) belongs to GeneralAlgebraicKTheory:K.7, which builds it on the smash product of H.5:spectra.

## Encoding conventions

These choices are part of the specification.

- **Spaces.** Spaces are Mathlib `TopCat`; realisations are Mathlib's `SSet.toTop`. Statements about products of infinite complexes are made in compactly generated spaces and say so; a homotopy-theoretic statement never silently uses the ordinary product topology.
- **Homotopy fibres.** F(f, b) consists of pairs (a, γ) with γ(0) = f(a) and γ(1) = b (Quillen, Hatcher). Weibel's paths run from the basepoint to f(e); reversing paths identifies the two, and the node H.2/homotopy-fibre-and-long-exact-sequence records that homeomorphism. The connecting map is the loop-space inclusion composed with Tau Ceti's loop-space shift.
- **Low degrees.** π₀ terms are pointed sets and π₁ terms groups; exactness at a pointed set means the preimage of the base point, and the π₁(B)-action on π₀(F) is part of the statement.
- **Weak equivalences.** A weak homotopy equivalence induces a bijection on π₀ and isomorphisms on all π_n at every basepoint. Homotopy-cartesian squares are defined with weak equivalences; for CW complexes these are homotopy equivalences by Whitehead.
- **Plus construction.** X⁺_P denotes any acyclic map with π₁-kernel P; the cell-attachment model is one choice. Uniqueness is up to homotopy equivalence under X, never equality of chosen spaces, and functoriality is up to homotopy.
- **Spectra.** The concrete model is symmetric spectra of simplicial sets (Schwede; Hovey–Shipley–Smith). Naive homotopy groups π̂_k are colimits; true homotopy groups π_k are those of a stably fibrant replacement and agree with π̂_k for semistable spectra. The suspension is S¹ ∧ −, the shift is Σ in the stable homotopy category, and the sign of the twist on S^p ∧ S^q is (−1)^{pq}.
- **Coefficients.** E/m is the cofibre of m : E → E and π_n(E; ℤ/m) = π_n(E/m) for all n ∈ ℤ. The universal coefficient sequence is exact but not naturally split; completion is a homotopy limit and never replaced by tensoring with ℤ_p without the finiteness theorem.
- **Spectral sequences.** A filtered spectrum is indexed by ℤ with increasing maps; d_r has bidegree (−r, r − 1). Convergence is a theorem with explicit hypotheses; displaying an E₂ page proves nothing about the abutment.

## H.1 — Nerves, classifying spaces and basepoints

This layer composes Mathlib's nerve and realisation to obtain classifying spaces, and proves the category-to-space comparisons the K-theory constructions use. RS-33 narrows it: ordinary local systems, twisted chains, van Kampen, CW and Whitehead machinery are imported from Tau Ceti; this layer constructs no second nerve, realisation or universal cover.

**Objects.** BC = |NC| for a small category C, with BF for functors (`CategoryTheory.classifyingSpace`); its CW structure with one n-cell per string of n composable non-identity arrows; BG = B(SingleObj G) for a group; the homology H_*(C; M) of a category with coefficients in a functor M : C ⥤ ModuleCat R.

**Theorems.** Natural transformations give homotopies, so adjoints and equivalences give homotopy equivalences and categories with initial or terminal objects are contractible (Quillen, Proposition 2 and corollaries). B(C × D) ≅ BC × BD for a finite factor or in compactly generated spaces. Homotopy groups and homology commute with filtered colimits of categories, and filtered categories are contractible (Quillen, Proposition 3). π₀(BC) is the set of components; coverings of BC are morphism-inverting functors, so π₁(BC) is the automorphism group in C[C⁻¹], with the maximal-tree presentation; local systems on BC are morphism-inverting functors. H_*(C; M) computes the derived functors of colim and agrees with H_*(BC; M) for local systems. BG is a K(G,1) in Tau Ceti's sense, conjugate homomorphisms give freely homotopic maps, and the nerve of SingleObj G is the bar construction, so H_*(BG; M) is Mathlib's group homology. Classifying spaces of groupoids are 1-types.

**Tests.** The trivial group has contractible BG; conjugate homomorphisms induce freely homotopic maps; H₁(BG; ℤ) is the abelianisation (unit tests of H.1/classifying-space-of-group and H.1/bar-complex-comparison).

### Declarations of H.1

#### `H.1/nerve-and-classifying-space` — Classifying space of a small category and of a functor — planet: *Classifying space of a category*

*Construction.* For a small category C let BC = |NC| be the geometric realisation (Mathlib's SSet.toTop) of the nerve NC (Mathlib's CategoryTheory.nerve), whose p-simplices are strings X₀ → X₁ → ⋯ → X_p of composable morphisms, with i-th face deleting X_i (composing at interior positions) and i-th degeneracy inserting an identity. A functor F : C ⥤ D induces BF = |N F| : BC → BD, and B(G ∘ F) = BG ∘ BF, B(id) = id, so B is a functor Cat ⥤ TopCat (the composite SSet.toTop ∘ nerveFunctor). For a skeletally small category (finitely generated projective modules, say) one realises an equivalent small category; any two choices give homotopy equivalent realisations (H.1/adjunction-homotopy-equivalence).

**Hypotheses.** C, D small categories (objects and morphisms in a fixed universe u), so that nerve C is an SSet.{u} and SSet.toTop applies. No topology beyond Mathlib's TopCat is assumed; the compactly generated product enters only in H.1/classifying-space-prod.

**Construction or proof outline.**

1. Define classifyingSpace C := SSet.toTop.obj (nerve C) and classifyingSpaceMap F := SSet.toTop.map (nerveMap F); functoriality is that of the composite functor SSet.toTop ⋙ (nerveFunctor restricted to small categories) (Weibel IV Characterization 3.1(1), Definition 3.1.4).
2. The 0-cells are the objects of C and the 1-cells the non-identity morphisms; in general the n-cells are the strings of n composable non-identity morphisms (Recipe 3.1.1; the CW structure is the node H.1/classifying-space-cw-structure).
3. For a poset P the nerve is the simplicial complex of finite chains, so BP is the realisation of the order complex (Quillen §1, LNM p. 89); for a group G viewed as a one-object category this gives the classifying space BG (H.1/classifying-space-of-group).

**API.**

- `CategoryTheory.classifyingSpace` (constructor): For a small category C, classifyingSpace C = SSet.toTop.obj (nerve C) : TopCat.
- `CategoryTheory.classifyingSpaceMap` (functoriality): A functor F : C ⥤ D gives classifyingSpaceMap F : classifyingSpace C ⟶ classifyingSpace D, equal to SSet.toTop.map (nerveMap F).
- `CategoryTheory.classifyingSpaceMap_id` (functoriality): classifyingSpaceMap (𝟭 C) = 𝟙 (classifyingSpace C).
- `CategoryTheory.classifyingSpaceMap_comp` (functoriality): classifyingSpaceMap (F ⋙ G) = classifyingSpaceMap F ≫ classifyingSpaceMap G.
- `CategoryTheory.classifyingSpaceFunctor` (structure): The functor Cat.{u,u} ⥤ TopCat.{u}, C ↦ classifyingSpace C, isomorphic to nerveFunctor ⋙ SSet.toTop.
- `CategoryTheory.classifyingSpace_vertex` (constructor): Each object X of C gives a point (vertex) [X] of classifyingSpace C, the image of the 0-simplex X; classifyingSpaceMap F sends [X] to [F X].
- `CategoryTheory.classifyingSpace_edge` (constructor): Each morphism f : X ⟶ Y gives a path classifyingSpace.edge f from [X] to [Y] (the image of the 1-simplex f), with edge (𝟙 X) the constant path up to reparametrisation and edge (f ≫ g) homotopic rel endpoints to (edge f).trans (edge g).
- `CategoryTheory.classifyingSpace_eq_toTop_nerve` (compatibility): classifyingSpace C = SSet.toTop.obj (nerve C) by definition, so every SSet.toTop and nerve lemma applies.

**Unit tests.**

- `classifyingSpace_fin_two_homeomorph_unitInterval` (computation): classifyingSpace (Fin 2) (the ordered set 0 < 1) is homeomorphic to the unit interval, with vertices 0 and 1 the endpoints.
- `classifyingSpace_empty` (degenerate): classifyingSpace of the empty category is the empty space, and of the one-object one-morphism category is a single point.
- `classifyingSpace_discrete` (computation): For a set S viewed as a discrete category, classifyingSpace S is homeomorphic to S with the discrete topology.
- `classifyingSpaceMap_not_full` (non-example): There is a continuous map classifyingSpace (Fin 2) ⟶ classifyingSpace (Fin 2) (the reflection of the interval) that is not classifyingSpaceMap of any functor: B is faithful but not full.

**Uses.** GeneralAlgebraicKTheory:K.1 (Q-construction): K(A) is defined as ΩBQA, the loop space of the classifying space of Quillen's Q-category; functors between exact categories act through B.; Weibel IV §§3–4: every homotopy-theoretic statement about a category (contractible, homotopy equivalence, fibre) is a statement about B of it; ArithmeticKTheory:N.3:finite-generation/rank-filtration: nerves of the rank-filtered Q-categories and of the Tits building poset, and their realisations; K3BlochGroups:V.1/bst-plus: BG for G = St(A), E(A), GL(A), as input of the plus construction.

**Acceptance.** B(Fin (n+1)) for the ordered set 0 < ⋯ < n is the standard topological n-simplex (Weibel IV Characterization 3.1(2)). B of the empty category is empty and B of the one-morphism category is a point (Weibel IV p. 24). B of the one-object category with two morphisms 1, σ (σ² = 1) has one n-cell in each dimension and is RP^∞ (Weibel IV Example 3.1.2).

**Prerequisites.** `mathlib:CategoryTheory.nerve`, `mathlib:CategoryTheory.nerveMap`, `mathlib:CategoryTheory.nerveFunctor`, `mathlib:SSet.toTop`.

**Sources.** Quillen-HigherK-I-1973, §1, LNM p. 89 (PDF 5); Weibel-KBook-IV, Characterization 3.1, Recipe 3.1.1 and Definition 3.1.4, pp. IV.24–25.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Basic`, namespace `CategoryTheory`.

#### `H.1/classifying-space-cw-structure` — The CW structure on the realisation of a simplicial set

*Construction.* For a simplicial set X, the realisation |X| carries a CW structure (Mathlib's Topology.CWComplex) whose n-cells are indexed by the nondegenerate n-simplices of X, the characteristic map of x being the composite Δⁿ → |X| of the topological simplex with the image of x; a simplicial map induces a cellular map. For X = NC the n-cells are the strings of n composable non-identity morphisms, a subcategory C ⊆ D gives a subcomplex BC ⊆ BD, and B(⊔ C_α) = ⊔ BC_α.

**Hypotheses.** X is any simplicial set (no finiteness); the topology on |X| is the weak (colimit) topology of Mathlib's SSet.toTop.

**Construction or proof outline.**

1. Realisation is a colimit of topological simplices over the category of simplices of X, hence |X| = colim over skeleta of pushouts attaching Δⁿ along ∂Δⁿ for each nondegenerate n-simplex (Eilenberg–Zilber lemma: every simplex is uniquely a degeneracy of a nondegenerate one).
2. These pushouts are exactly the cell attachments of a relative CW structure on the skeletal filtration; the colimit topology is the weak topology (Weibel IV Definition 3.1.4, citing [May, §14]).
3. A simplicial map sends the n-skeleton to the n-skeleton, so its realisation is cellular; nondegenerate simplices of NC are strings with no identity arrow (Recipe 3.1.1).

**API.**

- `SSet.toTopCWComplex` (instance): For X : SSet, a Topology.CWComplex structure on the underlying space of SSet.toTop.obj X.
- `SSet.toTopCWComplex_cell_equiv` (characterisation): The n-cells of SSet.toTopCWComplex X are in bijection with the nondegenerate n-simplices of X.
- `SSet.toTop_map_cellular` (functoriality): For f : X ⟶ Y, SSet.toTop.map f maps the n-skeleton of |X| into the n-skeleton of |Y|.
- `CategoryTheory.classifyingSpace_subcomplex` (compatibility): For a subcategory C ⊆ D, classifyingSpace C is (homeomorphic to) a subcomplex of classifyingSpace D.

**Unit tests.**

- `toTopCWComplex_stdSimplex_cells` (computation): The CW structure on |Δ[n]| has exactly C(n+1, k+1) cells of dimension k.
- `toTopCWComplex_point` (degenerate): |Δ[0]| has exactly one cell, of dimension 0, although Δ[0] has a simplex in every degree.
- `toTopCWComplex_compat_skeleton` (compatibility): The n-skeleton of the CW structure equals the realisation of Mathlib's n-skeleton of X (the simplicial subset generated by simplices of dimension ≤ n).
- `toTopCWComplex_not_all_simplices` (non-example): For C the one-object category of a nontrivial group G, the 1-cells of BC are the non-identity elements of G, not all elements of G.

**Uses.** Weibel IV Recipe 3.1.1: the explicit cells of BC: objects, non-identity morphisms, composable strings; H.1/filtered-colimits-of-categories: compact subsets of BC lie in finite subcomplexes, which lift to some BC_i; tauceti:TauCetiRoadmap/AlgebraicTopology stage 8 (Whitehead): classifying spaces are CW complexes, so weak equivalences between them are homotopy equivalences; H.3/plus-construction-by-cell-attachment: BG and BGL(R) are CW complexes to which 2- and 3-cells are attached.

**Acceptance.** For C = Fin (n+1), |NC| has one top cell and is the n-simplex. The 1-skeleton of BC is the graph with vertices objects and edges non-identity morphisms (used by H.1/maximal-tree-presentation). Do not count degenerate simplices as cells: B of the one-morphism category has a single 0-cell and no higher cells.

**Prerequisites.** `mathlib:SSet.toTop`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

**Sources.** Weibel-KBook-IV, Definition 3.1.4, p. IV.25; Weibel-KBook-IV, Characterization 3.1 (4)–(5), p. IV.24.

**Suggested home.** `TauCeti/AlgebraicTopology/SimplicialSet/RealizationCW`, namespace `SSet`.

#### `H.1/classifying-space-op-homeomorph` — B(C^op) is canonically homeomorphic to BC

*Lemma.* For a small category C there is a canonical cellular homeomorphism BC ≅ B(C^op), natural in functors F (B(F^op) corresponds to BF), sending each vertex to itself and the cell of a string X₀ → ⋯ → X_n to the cell of the reversed string in C^op by the order-reversing affine map of Δⁿ. It is not of the form BF for a functor F : C → C^op in general; for a group it is homotopic to, but not equal to, B of the isomorphism g ↦ g⁻¹.

**Hypotheses.** C small.

**Construction or proof outline.**

1. The nerve of C^op is the simplicial set NC with faces and degeneracies reindexed by i ↦ n − i (the opposite simplicial set).
2. Realisation of the opposite simplicial set is homeomorphic to the realisation by the affine involutions of the simplices, compatible with faces after reindexing (Quillen §1 (3)).

**Acceptance.** For C = Fin 2 the homeomorphism is the reflection t ↦ 1 − t of the interval. For a group G it is based-homotopic, not equal, to B of the isomorphism SingleObj G ≅ (SingleObj G)^op, g ↦ g⁻¹: the first sends the 1-cell of g to that cell traversed backwards, the second to the 1-cell of g⁻¹; both induce the same map on π₁ of these K(G, 1)s.

**Prerequisites.** `H.1/nerve-and-classifying-space`.

**Sources.** Quillen-HigherK-I-1973, §1, formula (3), LNM p. 91 (PDF 7); Weibel-KBook-IV, p. IV.25.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Basic`, namespace `CategoryTheory`.

#### `H.1/classifying-space-prod` — Classifying space of a product of categories

*Theorem.* For small categories C, D the projections induce a continuous bijection B(C × D) → BC × BD. It is a homeomorphism if BC or BD is a finite CW complex (finitely many non-identity composable strings), and it is always a homeomorphism onto the product taken in compactly generated spaces. In particular B(C × Fin 2) ≅ BC × [0,1].

**Hypotheses.** C, D small; the homeomorphism onto the ordinary product needs one factor finite, otherwise the compactly generated product topology.

**Construction or proof outline.**

1. On nerves, N(C × D) ≅ NC × ND (the nerve is a right adjoint and preserves products; on simplices, a string in C × D is a pair of strings).
2. Realisation commutes with finite products of simplicial sets when the product is formed in compactly generated spaces (Milnor 1957, imported by Quillen §1 (4); the proof is not read here and is recorded in the packet gap 'Realisation of products').
3. If one factor has finitely many cells it is compact, and the k-ification of the product with a compact Hausdorff space does not change the topology, giving the homeomorphism onto the ordinary product.

**Acceptance.** B(Fin 2 × Fin 2) is the square [0,1]² with its standard triangulation into two 2-simplices. Do not identify B(C × D) with BC × BD in the ordinary product topology without the finiteness hypothesis (both infinite).

**Prerequisites.** `H.1/nerve-and-classifying-space`, `mathlib:CategoryTheory.nerve`.

**Sources.** Quillen-HigherK-I-1973, §1, formula (4), LNM pp. 91–92 (PDF 7–8); Weibel-KBook-IV, Characterization 3.1 (6), p. IV.24.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Basic`, namespace `CategoryTheory`.

#### `H.1/natural-transformations-adjoints-contractibility` — A natural transformation induces a homotopy

*Lemma.* Let F₀, F₁ : C ⥤ D be functors between small categories and η : F₀ ⟶ F₁ a natural transformation. Then there is a homotopy H : BC × [0,1] → BD from BF₀ to BF₁, namely B of the functor C × Fin 2 ⥤ D determined by (F₀, F₁, η), composed with B(C × Fin 2) ≅ BC × [0,1]; on each vertex [X] its track is the edge path of η_X. Consequently functors related by a zig-zag of natural transformations induce homotopic maps. (The consequences for adjoints, equivalences and initial or terminal objects are the nodes H.1/adjunction-homotopy-equivalence and H.1/contractible-of-initial-or-terminal.)

**Hypotheses.** C, D small; the identification B(C × Fin 2) ≅ BC × [0,1] uses that B(Fin 2) is a finite complex (H.1/classifying-space-prod).

**Construction or proof outline.**

1. A natural transformation η : F₀ ⟶ F₁ is the same as a functor C × Fin 2 ⥤ D restricting to F_i on C × {i} (Quillen Prop. 2 proof).
2. Apply B and precompose with the inverse of B(C × Fin 2) → BC × B(Fin 2) = BC × [0,1], a homeomorphism because B(Fin 2) is finite (H.1/classifying-space-prod).

**Acceptance.** The track of the homotopy at [X] is the edge classifyingSpace.edge (η.app X). Comparable monotone maps f ≤ g : P → Q of posets give homotopic maps BP → BQ (the case of a preorder, used by ArithmeticKTheory:N.3). A natural isomorphism gives a homotopy, but not a homotopy relative to a basepoint unless η is the identity there.

**Prerequisites.** `H.1/nerve-and-classifying-space`, `H.1/classifying-space-prod`.

**Sources.** Quillen-HigherK-I-1973, §1, Proposition 2, LNM p. 92 (PDF 8); Weibel-KBook-IV, Homotopy-theoretic properties 3.2, p. IV.25.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Basic`, namespace `CategoryTheory.NatTrans`.

#### `H.1/adjunction-homotopy-equivalence` — Adjoint functors and equivalences induce homotopy equivalences

*Lemma.* If L : C ⥤ D is left adjoint to R : D ⥤ C (small categories), then BL : BC → BD and BR : BD → BC are mutually inverse homotopy equivalences. In particular an equivalence of small categories induces a homotopy equivalence of classifying spaces, so B of a skeletally small category is well defined up to homotopy equivalence.

**Hypotheses.** C, D small.

**Construction or proof outline.**

1. The unit id_C ⟶ R ∘ L and counit L ∘ R ⟶ id_D are natural transformations, so B(R ∘ L) ≃ id and B(L ∘ R) ≃ id (H.1/natural-transformations-adjoints-contractibility), and B(R ∘ L) = BR ∘ BL by functoriality (Quillen Prop. 2 Cor. 1).
2. An equivalence of categories has an adjoint inverse (Weibel IV Example 3.2.1).

**Acceptance.** The inclusion of a skeleton into a skeletally small category is a homotopy equivalence of classifying spaces. A functor with an adjoint is a homotopy equivalence even if it is not an equivalence of categories (e.g. C → 1 when C has a terminal object).

**Prerequisites.** `H.1/natural-transformations-adjoints-contractibility`.

**Sources.** Quillen-HigherK-I-1973, §1, Proposition 2, Corollary 1, LNM p. 92 (PDF 8); Weibel-KBook-IV, 3.2 and Example 3.2.1, p. IV.26.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Basic`, namespace `CategoryTheory.Adjunction`.

#### `H.1/contractible-of-initial-or-terminal` — Categories with an initial or terminal object are contractible

*Lemma.* A small category with an initial object or a terminal object has contractible classifying space. In particular for a functor F : C ⥤ D and an object d of D, the comma categories D/d (objects over d) and d\D are contractible, and so are F/d and d\F whenever F has a right, respectively left, adjoint.

**Hypotheses.** C small and nonempty with an initial (or terminal) object.

**Construction or proof outline.**

1. If C has an initial object then the functor C → 1 to the one-morphism category has a left adjoint (the inclusion of the initial object), so BC ≃ B1 = point (H.1/adjunction-homotopy-equivalence; Quillen Prop. 2 Cor. 2).
2. D/d has the terminal object id_d (Weibel IV Example 3.2.2).

**Acceptance.** The comma category C/d has terminal object id_d and is contractible. An additive category has the zero object as initial object, so BA is contractible; the interesting space is B(iso A) (Weibel IV §4 opening). The empty category has no initial object and B∅ = ∅ is not contractible.

**Prerequisites.** `H.1/adjunction-homotopy-equivalence`.

**Sources.** Quillen-HigherK-I-1973, §1, Proposition 2, Corollary 2, LNM p. 92 (PDF 8); Weibel-KBook-IV, Example 3.2.2, p. IV.26.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Basic`, namespace `CategoryTheory.Limits`.

#### `H.1/filtered-colimits-of-categories` — Homotopy groups commute with filtered colimits of categories

*Lemma.* Let I be a filtered small category, i ↦ C_i a functor I ⥤ Cat with colimit C (computed in Cat), and choose compatible objects X_i of C_i with common image X. Then the canonical map colim_i π_n(BC_i, [X_i]) → π_n(BC, [X]) is a bijection for all n ≥ 0 (a group isomorphism for n ≥ 1), and π₀(BC) = colim_i π₀(BC_i).

**Hypotheses.** I filtered (nonempty, every two objects have a common target, parallel arrows are coequalised). The colimit is taken in Cat; filtered colimits of categories commute with finite limits of nerves.

**Construction or proof outline.**

1. Filtered colimits commute with finite limits of sets, so NC = colim_i NC_i levelwise; a simplicial subset with finitely many nondegenerate simplices lifts to some NC_i, uniquely after enlarging i (Quillen Prop. 3 proof).
2. Every compact subset of a CW complex lies in a finite subcomplex (Mathlib Topology.CWComplex and H.1/classifying-space-cw-structure), so spheres and homotopies of spheres in BC lift to some BC_i; this gives surjectivity and injectivity of the colimit map.

**Acceptance.** A mapping telescope category ∫_{ℕ} C has realisation homotopy equivalent to B(colim C_n) (Weibel IV Exercise 3.5). For GL(R) = colim GL_n(R): π_n(BGL(R)) = colim π_n(BGL_n(R)).

**Prerequisites.** `H.1/nerve-and-classifying-space`, `H.1/classifying-space-cw-structure`.

**Sources.** Quillen-HigherK-I-1973, §1, Proposition 3, LNM p. 92 (PDF 8).

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Basic`, namespace `CategoryTheory`.

#### `H.1/filtered-colimit-homotopy-equivalence` — Filtered colimits along homotopy equivalences

*Lemma.* In the situation of H.1/filtered-colimits-of-categories, if every transition functor C_i → C_{i'} is a homotopy equivalence then every C_i → C is a homotopy equivalence.

**Hypotheses.** I filtered; transition functors homotopy equivalences.

**Construction or proof outline.**

1. Replace I by the cofinal category i\I, which has initial object id_i; each π_n(BC_i) → colim is then an isomorphism, so BC_i → BC is a weak equivalence (H.1/filtered-colimits-of-categories).
2. A weak equivalence between CW complexes is a homotopy equivalence (Whitehead's theorem, Tau Ceti AlgebraicTopology stage 8).

**Acceptance.** Do not apply when transition functors are not homotopy equivalences: the inclusions GL_n(R) → GL_{n+1}(R) are not homotopy equivalences of classifying spaces.

**Prerequisites.** `H.1/filtered-colimits-of-categories`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Sources.** Quillen-HigherK-I-1973, §1, Proposition 3, Corollary 1, LNM p. 93 (PDF 9).

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Basic`, namespace `CategoryTheory`.

#### `H.1/filtered-category-contractible` — Filtered categories are contractible

*Lemma.* Every filtered small category I has contractible classifying space.

**Hypotheses.** I filtered (in particular nonempty).

**Construction or proof outline.**

1. I is the filtered colimit of the functor i ↦ I/i, and each I/i has a terminal object, hence is contractible (H.1/contractible-of-initial-or-terminal).
2. The transition functors between contractible categories are homotopy equivalences, so BI ≃ B(I/i) ≃ point (H.1/filtered-colimit-homotopy-equivalence; Quillen Prop. 3 Cor. 2).

**Acceptance.** A directed poset (ℕ with ≤) is contractible. The discrete category on two objects is not filtered and B of it is two points.

**Prerequisites.** `H.1/filtered-colimit-homotopy-equivalence`, `H.1/contractible-of-initial-or-terminal`.

**Sources.** Quillen-HigherK-I-1973, §1, Proposition 3, Corollary 2, LNM p. 93 (PDF 9); Weibel-KBook-IV, Exercise 3.4, p. IV.34.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Basic`, namespace `CategoryTheory.IsFiltered`.

#### `H.1/filtered-colimit-homology` — Homology of classifying spaces commutes with filtered colimits

*Lemma.* For I filtered and C = colim_i C_i in Cat, and any abelian group A, the canonical map colim_i H_n(BC_i; A) → H_n(BC; A) is an isomorphism for every n, natural in the diagram. The same holds for the category homology H_n(C; M) of H.1/category-homology when M is the restriction of a functor on C.

**Hypotheses.** I filtered; constant coefficients A, or coefficient functors restricted along C_i → C.

**Construction or proof outline.**

1. The normalised chain complex of NC is the filtered colimit of those of NC_i, since each nondegenerate simplex of NC lies in the image of some NC_i (H.1/filtered-colimits-of-categories, first step).
2. Filtered colimits of abelian groups are exact, so homology commutes with them; compare with singular homology through H.1/homology-of-small-categories (cellular chains of BC are normalised chains of NC).

**Acceptance.** For the increasing rank-filtered subcategories Q_m of Q(P(A)), colim_m H_i(BQ_m; ℤ) ≅ H_i(BQ; ℤ) (the use in ArithmeticKTheory:N.3). H_*(BGL(R)) = colim_n H_*(BGL_n(R)) (used in H.4/gl-telescope-plus-comparison).

**Prerequisites.** `H.1/filtered-colimits-of-categories`, `H.1/homology-of-small-categories`.

**Sources.** Quillen-HigherK-I-1973, §1, Proposition 3 and proof, LNM p. 92 (PDF 8); Weibel-KBook-IV, Exercise 3.5, p. IV.34.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Basic`, namespace `CategoryTheory`.

#### `H.1/pi0-classifying-space` — Path components of a classifying space

*Lemma.* π₀(BC) is the quotient of the set of objects of C by the equivalence relation generated by X ∼ Y whenever there is a morphism X → Y, i.e. the set of connected components of C (Mathlib's ConnectedComponents C); BC is path-connected iff C is connected. For the Grothendieck construction ∫_I X of X : I ⥤ Cat, π₀(B∫_I X) = colim_i π₀(BX(i)).

**Hypotheses.** C small.

**Construction or proof outline.**

1. The path components of a CW complex are the vertices modulo the incidence relation of edges (H.1/classifying-space-cw-structure); vertices are objects and edges morphisms (Weibel IV Lemma 3.3).

**Acceptance.** For a G-set X, π₀ of the translation category is the orbit set X/G (Weibel IV 3.3.1). π₀ of B(iso P(R)) is the set of isomorphism classes of finitely generated projective modules.

**Prerequisites.** `H.1/nerve-and-classifying-space`, `H.1/classifying-space-cw-structure`.

**Sources.** Weibel-KBook-IV, Lemma 3.3, p. IV.27.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Basic`, namespace `CategoryTheory`.

#### `H.1/coverings-fundamental-group-local-coefficients` — Coverings of BC are morphism-inverting functors — planet: *Coverings of a classifying space*

*Theorem.* For a small category C, the functor sending a covering space E → BC to X ↦ (fibre of E over the vertex [X]) is an equivalence between the category of covering spaces of BC and the category of morphism-inverting functors C ⥤ Type (those sending every morphism to a bijection), with inverse F ↦ (B(∫_C F) → BC), the realisation of the Grothendieck construction. Equivalently, morphism-inverting functors are functors C[C⁻¹] ⥤ Type from the localisation of C at all morphisms.

**Hypotheses.** C small; covering spaces in Mathlib's sense (IsCoveringMap); BC is locally path-connected and semilocally simply connected, being a CW complex.

**Construction or proof outline.**

1. Given a covering E → BC, path lifting along the edges classifyingSpace.edge f defines bijections E_[X] → E_[Y] functorial in f, so X ↦ E_[X] is morphism-inverting (Quillen §1, LNM p. 90).
2. Given F morphism-inverting, the projection ∫_C F → C realises to a map whose fibre over [X] is F(X); local triviality is checked cell by cell: over an open simplex X₀ → ⋯ → X_n the inverse image is the product with F(X₀), since the transition maps are bijections (Quillen §1; Weibel IV Exercise 3.1).
3. The two constructions are inverse up to natural isomorphism by the unique path lifting property (Tau Ceti UniversalCovers stage 2 lifting and classification).

**Acceptance.** For a group G, coverings of BG correspond to G-sets (Weibel IV 3.3.1 and Exercise 3.2). For H ⊂ G the homotopy fibre of BH → BG is the discrete set G/H, while the strict fibre category of SingleObj H → SingleObj G is a point (Weibel IV Exercise 3.3).

**Prerequisites.** `H.1/nerve-and-classifying-space`, `H.1/classifying-space-cw-structure`, `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`, `H.1/translation-category-classifying-space`.

**Sources.** Weibel-KBook-IV, Exercise 3.1, pp. IV.33–34; Local coefficients 3.5.1, p. IV.29; Quillen-HigherK-I-1973, §1 'Coverings of BC and the fundamental group', Proposition 1, LNM p. 90 (PDF 6).

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Basic`, namespace `CategoryTheory`.

#### `H.1/fundamental-groupoid-localization` — π₁ of BC is the automorphism group in C[C⁻¹]

*Theorem.* For a small category C, the fundamental groupoid of BC restricted to the vertices is equivalent to the localisation C[C⁻¹] of C at all its morphisms (Mathlib's MorphismProperty.Localization at ⊤, or the free groupoid on C modulo composition), by the functor sending X to [X] and f to the path class of classifyingSpace.edge f. Hence π₁(BC, [X]) ≅ Aut_{C[C⁻¹]}(X), naturally in functors C ⥤ D.

**Hypotheses.** C small.

**Construction or proof outline.**

1. Every point of BC is joined to a vertex inside its open cell, so the vertex-restricted fundamental groupoid is equivalent to the full one.
2. Morphism-inverting functors C ⥤ Type are functors C[C⁻¹] ⥤ Type (universal property of the localisation), and coverings of BC are functors from its fundamental groupoid to Type (Tau Ceti UniversalCovers stage 2); H.1/coverings-fundamental-group-local-coefficients identifies these two categories compatibly with fibre functors.
3. A functor between groupoids inducing an equivalence on categories of Type-valued functors compatible with evaluation at objects is an equivalence (Gabriel–Zisman I 1.2, not read; recorded as part of the packet gap 'Gabriel–Zisman imports').

**Acceptance.** π₁(BG) = G for a group G (Weibel IV Application 3.4.1). π₁(BM) is the group completion of the monoid M (Weibel IV Application 3.4.2). For the poset ℕ, C[C⁻¹] is the indiscrete groupoid and π₁(Bℕ) = 1.

**Prerequisites.** `H.1/coverings-fundamental-group-local-coefficients`, `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`.

**Sources.** Quillen-HigherK-I-1973, §1, Proposition 1, LNM p. 90 (PDF 6); Weibel-KBook-IV, Application 3.4.2, p. IV.28.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Basic`, namespace `CategoryTheory`.

#### `H.1/maximal-tree-presentation` — Presentation of π₁(BC) from a maximal tree

*Lemma.* Let C be a nonempty connected small category and T a maximal tree (a set of morphisms whose graph in the 1-skeleton of BC is a tree containing every object). Then π₁(BC, [c₀]) is generated by symbols [f], one for each morphism f of C, subject to [t] = 1 for t ∈ T, [id_X] = 1, and [f][g] = [f ∘ g] for composable f, g (in the order of the loop), the class of f : X → Y being the tree path from c₀ to X, the edge f, and the tree path back. The presentation does not depend on c₀.

**Hypotheses.** C nonempty and connected; maximal trees exist by Zorn's lemma.

**Construction or proof outline.**

1. The 1-skeleton is a graph whose fundamental group is free on the non-tree non-identity edges (Weibel IV p. 27).
2. The 2-cells are attached along the composable pairs (f, g), imposing [f][g] = [f ∘ g]; higher cells do not change π₁; apply van Kampen to the 2-skeleton (Tau Ceti AlgebraicTopology stage 1; Weibel IV Lemma 3.4).

**Acceptance.** With T empty and C = SingleObj G, π₁(BG) = G. For C = Fin 2 × Fin 2 (a commutative square) π₁ is trivial.

**Prerequisites.** `H.1/classifying-space-cw-structure`, `H.1/fundamental-groupoid-localization`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid`.

**Sources.** Weibel-KBook-IV, Lemma 3.4, p. IV.27.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Basic`, namespace `CategoryTheory`.

#### `H.1/local-systems-as-functors` — Local coefficient systems on BC are morphism-inverting functors

*Comparison.* For a small category C and a ring R, restriction along C → (vertex fundamental groupoid of BC), X ↦ [X], f ↦ [edge f], is an equivalence between Tau Ceti's local coefficient systems of R-modules on BC (functors FundamentalGroupoid BC ⥤ ModuleCat R) and morphism-inverting functors C ⥤ ModuleCat R, compatible with pullback along BF for functors F : C ⥤ D and with constant systems.

**Hypotheses.** C small; R a ring; morphism-inverting means every morphism goes to an isomorphism.

**Construction or proof outline.**

1. By H.1/fundamental-groupoid-localization the vertex fundamental groupoid of BC is equivalent to C[C⁻¹].
2. Functors C[C⁻¹] ⥤ ModuleCat R are exactly morphism-inverting functors C ⥤ ModuleCat R (universal property of localisation).
3. Compatibility with pullback follows from naturality of the localisation equivalence in C.

**Acceptance.** A G-module M is a local system on BG (Weibel IV 3.5.1 and Application 3.4.2). The constant system R corresponds to the constant functor; a non-morphism-inverting functor (for example X ↦ R on Fin 2 with the zero map) is not a local system.

**Prerequisites.** `H.1/fundamental-groupoid-localization`, `tauceti:TauCeti.LocalCoefficientSystem`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`.

**Sources.** Weibel-KBook-IV, Local coefficients 3.5.1, p. IV.29.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Basic`, namespace `CategoryTheory`.

#### `H.1/category-homology` — Homology of a small category with coefficients in a functor

*Definition.* For a small category C and a functor M : C ⥤ ModuleCat R, H_n(C; M) is the n-th homology of the chain complex C_*(C; M) with C_n = ⊕_{X₀ → ⋯ → X_n} M(X₀) (sum over n-simplices of NC) and boundary Σ (−1)^i d_i, where d₀ uses M(f₁) : M(X₀) → M(X₁) and the other faces are identities on the summand; equivalently the homology of the simplicial R-module n ↦ ⊕_{NC_n} M(X₀) (its alternating face map complex, or the normalised complex). H₀(C; M) = colim_C M.

**Hypotheses.** C small, R a ring; no condition on M (it need not be morphism-inverting).

**Construction or proof outline.**

1. Build the simplicial module from NC and M (a coefficient system on the category of simplices), take Mathlib's alternatingFaceMapComplex, then homology (Weibel IV 3.5).
2. Normalised and unnormalised complexes are chain homotopy equivalent (Mathlib's Dold–Kan normalisation comparison), so either computes H_*(C; M).
3. Identify H₀ with the cokernel of ⊕_{X₀→X₁} M(X₀) → ⊕_X M(X), x ↦ (−x, fx), which is colim M (Weibel IV 3.5).

**API.**

- `CategoryTheory.categoryHomology` (constructor): categoryHomology C M n : ModuleCat R, the n-th homology of the chain complex categoryChainComplex C M.
- `CategoryTheory.categoryChainComplex` (data): The chain complex with n-th term ⊕_{σ ∈ (nerve C) _[n]} M (σ.obj 0), the alternating face map complex of the simplicial module.
- `CategoryTheory.categoryHomology.map` (functoriality): A natural transformation M ⟶ M' induces maps on categoryHomology C _ n, with map_id and map_comp.
- `CategoryTheory.categoryHomology.mapOfFunctor` (functoriality): A functor F : C ⥤ D and a coefficient M on D induce categoryHomology C (F ⋙ M) n ⟶ categoryHomology D M n, functorial in F.
- `CategoryTheory.categoryHomology.longExactSequence` (other): A short exact sequence 0 → M' → M → M'' → 0 of functors gives a natural long exact sequence in categoryHomology C _ n.
- `CategoryTheory.categoryHomologyZeroIsoColimit` (characterisation): categoryHomology C M 0 ≅ colim M, naturally in M.
- `CategoryTheory.categoryHomology.normalizedIso` (equivalence): The homology of the normalised complex (sums over nondegenerate simplices) is naturally isomorphic to categoryHomology C M n.

**Unit tests.**

- `categoryHomology_zero_eq_colimit_const` (computation): For C connected and M the constant functor at A, categoryHomology C M 0 ≅ A.
- `categoryHomology_of_terminal` (degenerate): If C has a terminal object t then categoryHomology C M n = 0 for n > 0 and categoryHomology C M 0 ≅ M t.
- `categoryHomology_singleObj_compat` (compatibility): For C = SingleObj G and M a G-representation, categoryHomology C M n ≅ groupHomology M n (H.1/bar-complex-comparison).
- `categoryHomology_not_cohomology` (non-example): For G = ℤ/2 and trivial coefficients ℤ, categoryHomology (SingleObj G) ℤ 2 = 0 while group cohomology H²(G; ℤ) = ℤ/2: homology cannot be replaced by trivial-coefficient cohomology.

**Uses.** H.4/quillen-localization-of-homology: the spectral sequence of a cofibred functor has E² = H_p(D; H_q(fibre)), homology of D with coefficients in a functor; ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence: E²_{p,q} = H_p(D, H_q(T ↓ −)) for a functor T : C → D; H.1/homology-of-small-categories: compared with singular homology of BC with local coefficients; K3BlochGroups:V.1/canonical-comparison-interface: group homology of G as homology of SingleObj G.

**Acceptance.** H₀(C; M) = colim_{c∈C} M(c). For C = SingleObj G and a G-module M this is the bar complex computing group homology (H.1/bar-complex-comparison).

**Prerequisites.** `mathlib:CategoryTheory.nerve`.

**Sources.** Weibel-KBook-IV, (3.5) The homology of C and BC, p. IV.28; Quillen-HigherK-I-1973, §1 'The homology of BC', LNM p. 91 (PDF 7).

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Homology`, namespace `CategoryTheory`.

#### `H.1/category-homology-derived-colimit` — Homology of a category computes derived functors of colim

*Theorem.* For a small category C and a ring R, the functors M ↦ H_n(C; M) on Fun(C, ModuleCat R) form a universal homological δ-functor with H₀ = colim, so H_n(C; M) ≅ L_n colim(M), the left derived functors of colim : Fun(C, ModuleCat R) → ModuleCat R.

**Hypotheses.** C small, R a ring; Fun(C, ModuleCat R) has enough projectives (sums of representables R[C(X, −)]).

**Construction or proof outline.**

1. H_*(C; −) is an exact δ-functor because the chain complex is exact in M (H.1/category-homology long exact sequence).
2. It is effaceable in positive degrees: for a representable projective R[C(X, −)] the complex is the chains of the nerve of X\C, which has an initial object and is contractible (H.1/contractible-of-initial-or-terminal), so H_n = 0 for n > 0 (Quillen §1, citing Gabriel–Zisman App. II 3.3).
3. A universal δ-functor agreeing with colim in degree 0 is the derived functor.

**Acceptance.** For C with a terminal object, colim is evaluation at it and is exact, so H_n = 0 for n > 0. For C = SingleObj G this recovers Tor^{ℤG}_n(ℤ, M).

**Prerequisites.** `H.1/category-homology`, `H.1/contractible-of-initial-or-terminal`.

**Sources.** Quillen-HigherK-I-1973, §1, formula (1), LNM p. 91 (PDF 7).

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Homology`, namespace `CategoryTheory`.

#### `H.1/homology-of-small-categories` — Homology of BC with local coefficients is homology of C — planet: *Homology of a small category*

*Theorem.* For a small category C and a morphism-inverting functor L : C ⥤ ModuleCat R, regarded as a local coefficient system on BC (H.1/local-systems-as-functors), there is an isomorphism H_n(BC; L) ≅ H_n(C; L) between singular homology of BC with local coefficients (Tau Ceti AlgebraicTopology stage 2 twisted chains) and the homology of C with coefficients in L, natural in (C, L). Dually for cohomology with derived limits. For constant coefficients this is H_n(BC; A) ≅ H_n(C; A).

**Hypotheses.** C small; L morphism-inverting (a local system); singular homology with local coefficients as planned in Tau Ceti AlgebraicTopology stage 2.

**Construction or proof outline.**

1. Filter BC by skeleta (H.1/classifying-space-cw-structure); the relative homology of consecutive skeleta with coefficients L is ⊕ over nondegenerate n-simplices of L(X₀) concentrated in degree n, so the skeletal spectral sequence has E¹_{p,q} = 0 for q ≠ 0 (Quillen §1, compare Segal 1968 §5.1, not read).
2. The E¹-row is the normalised complex of H.1/category-homology (cellular chains with local coefficients), so the spectral sequence degenerates and gives the isomorphism; the cellular–singular comparison with local coefficients is imported from Tau Ceti AlgebraicTopology stage 4 (cellular homology) and stage 2 (twisted chains); its local-coefficient form is recorded in the packet gap 'Cellular homology with local coefficients'.
3. Weibel IV 3.5.1 gives the same isomorphism citing [Wh, VI.4.8].

**Acceptance.** H₁(BG; ℤ) ≅ G/[G, G] for a group G (H.1 stage test). For a nontrivial G-module M, H₀(BG; M) is the coinvariants M_G, not M.

**Prerequisites.** `H.1/category-homology`, `H.1/local-systems-as-functors`, `H.1/classifying-space-cw-structure`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

**Sources.** Quillen-HigherK-I-1973, §1 'The homology of BC', formula (2), LNM p. 91 (PDF 7); Weibel-KBook-IV, Local coefficients 3.5.1, p. IV.29.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Homology`, namespace `CategoryTheory`.

#### `H.1/classifying-space-of-group` — Classifying space of a discrete group — planet: *Classifying space of a group*

*Definition.* For a group G, BG := B(SingleObj G), the classifying space of G viewed as a one-object category; its nerve has n-simplices the n-tuples (g₁, …, g_n) ∈ Gⁿ with d₀ dropping g₁, d_n dropping g_n and d_i multiplying g_i g_{i+1}. A homomorphism φ : G → H induces Bφ : BG → BH, based at the unique vertex, functorially. BG is a connected CW complex with one vertex and one 1-cell for each nontrivial element of G.

**Hypotheses.** G a group in universe u (the same definition applies to monoids).

**Construction or proof outline.**

1. Apply H.1/nerve-and-classifying-space to SingleObj G and to the functor SingleObj.mapHom φ (Weibel IV Example 3.1.3).
2. The nerve of SingleObj G is the bar construction (the quotient EG/G of Mathlib's simplicial G-set EG by the diagonal action), which is the identification recorded in H.1/bar-complex-comparison.

**API.**

- `Group.classifyingSpace` (constructor): Group.classifyingSpace G := CategoryTheory.classifyingSpace (SingleObj G) : TopCat.
- `Group.classifyingSpace.map` (functoriality): A monoid hom φ : G →* H gives Group.classifyingSpace.map φ, with map_id and map_comp, equal to classifyingSpaceMap (SingleObj.mapHom G H φ).
- `Group.classifyingSpace.basepoint` (data): The unique vertex of Group.classifyingSpace G; map φ preserves it.
- `Group.classifyingSpace.loop` (constructor): Each g ∈ G gives a loop at the basepoint (the edge of g), with loop 1 null-homotopic and loop (g * h) homotopic to (loop g).trans (loop h).
- `Group.classifyingSpace.pathConnected` (instance): Group.classifyingSpace G is path-connected.
- `Group.classifyingSpace.fundamentalGroupMulEquiv` (equivalence): FundamentalGroup (Group.classifyingSpace G) basepoint ≃* G, sending the class of loop g to g, natural in G (H.1/classifying-space-of-group-is-KG1).
- `Group.classifyingSpace.homologyIso` (compatibility): H_n(Group.classifyingSpace G; M) ≅ groupHomology M n for a G-representation M viewed as a local system (H.1/bar-complex-comparison).

**Unit tests.**

- `classifyingSpace_trivial_contractible` (degenerate): Group.classifyingSpace (trivial group) is contractible (indeed a point).
- `classifyingSpace_H1_abelianization` (computation): H₁(Group.classifyingSpace G; ℤ) ≅ Additive (Abelianization G), naturally in G.
- `classifyingSpace_zmod2_cells` (computation): Group.classifyingSpace (Multiplicative (ZMod 2)) has exactly one cell in each dimension (it is RP^∞).
- `classifyingSpace_conj_freely_homotopic` (characterisation): For φ : G →* H and h ∈ H, Group.classifyingSpace.map φ and Group.classifyingSpace.map (h • φ • h⁻¹) are freely homotopic (H.1/conjugate-homomorphisms-freely-homotopic) but in general not homotopic relative to the basepoint.
- `classifyingSpace_not_contractible_Z` (non-example): Group.classifyingSpace (Multiplicative ℤ) has π₁ ≅ ℤ and is not contractible, although ℤ is torsion-free and acyclic in positive degrees ≥ 2.

**Uses.** H.3/plus-construction-by-cell-attachment: BG⁺ and BGL(R)⁺ are plus constructions on classifying spaces of groups; H.4/gl-telescope-plus-comparison: BGL_n(R) and BGL(R) = colim BGL_n(R); K3BlochGroups:V.1/bst-plus: BSt(A) and BE(A); KTheoryFiniteLocalFields:L.1/quillen-fibration: BGL(F_q) compared with the homotopy fibre of ψ^q − 1.

**Acceptance.** Bℤ/2 = RP^∞ (Weibel IV Example 3.1.2). B of the trivial group is a point.

**Prerequisites.** `H.1/nerve-and-classifying-space`.

**Sources.** Weibel-KBook-IV, Example 3.1.3, p. IV.25; Weibel-KBook-IV, Application 3.4.1, p. IV.28.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Group`, namespace `Group`.

#### `H.1/translation-category-classifying-space` — Classifying spaces of translation categories

*Lemma.* For a group G acting on a set X, the translation category ∫_G X (objects x ∈ X, morphisms g : x → gx) has B(∫_G X) homotopy equivalent to ⊔_{orbits} BG_x (stabilisers); for X = G/H, B(∫_G X) ≃ BH. For X = G with left translation, ∫_G G is an indiscrete groupoid, so B(∫_G G) is contractible, and B(∫_G G) → BG is the universal covering of BG.

**Hypotheses.** G a group acting on a set X.

**Construction or proof outline.**

1. Each orbit is a connected component (H.1/pi0-classifying-space); within a component the inclusion of the full subcategory on one object x, which is SingleObj G_x, is an equivalence of categories, hence a homotopy equivalence (H.1/adjunction-homotopy-equivalence).
2. For X = G every object is initial (unique morphism between any two objects), so B(∫_G G) is contractible (H.1/contractible-of-initial-or-terminal); the projection ∫_G G → SingleObj G is the Grothendieck construction of the morphism-inverting functor G, so it realises to a covering (H.1/coverings-fundamental-group-local-coefficients) with contractible total space (Weibel IV Exercise 3.2).

**Acceptance.** B(∫_G (G/H)) ≃ BH. For the trivial action on a set X, B(∫_G X) ≃ X × BG.

**Prerequisites.** `H.1/pi0-classifying-space`, `H.1/adjunction-homotopy-equivalence`, `H.1/contractible-of-initial-or-terminal`, `H.1/classifying-space-of-group`.

**Sources.** Weibel-KBook-IV, Translation categories 3.3.1, p. IV.27; Exercise 3.2, p. IV.34.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Group`, namespace `Group`.

#### `H.1/classifying-space-of-group-is-KG1` — BG is a K(G,1) — planet: *BG is a K(G,1)*

*Theorem.* For every group G, the space BG is an Eilenberg–Mac Lane space K(G, 1) in the sense of Tau Ceti (path-connected, π₁(BG) ≅ G and π_n(BG) = 0 for n ≥ 2), with the isomorphism π₁(BG, *) ≅ G sending the loop of g to g; a homomorphism φ : G → H induces φ on π₁. Consequently BG is the K(G,1) of Tau Ceti UniversalCovers stage 4 for every group, constructed rather than assumed.

**Hypotheses.** G any group.

**Construction or proof outline.**

1. π₁(BG) ≅ G by H.1/maximal-tree-presentation with T empty (Weibel IV Application 3.4.1), naturally in G.
2. The universal cover is B(∫_G G), which is contractible (H.1/translation-category-classifying-space), so π_n(BG) ≅ π_n(B(∫_G G)) = 0 for n ≥ 2 (covering maps induce isomorphisms on π_n for n ≥ 2, Tau Ceti HomotopyGroup covering lemmas).

**Acceptance.** π_n(Bℤ) = 0 for n ≥ 2 and Bℤ ≃ S¹. B(G × H) ≃ BG × BH as K(G×H, 1) (Tau Ceti product stability of K(G,1)).

**Prerequisites.** `H.1/classifying-space-of-group`, `H.1/maximal-tree-presentation`, `H.1/translation-category-classifying-space`, `tauceti:TauCetiRoadmap/UniversalCovers#stage-4-applications`.

**Sources.** Weibel-KBook-IV, Application 3.4.1, p. IV.28.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Group`, namespace `Group`.

#### `H.1/conjugate-homomorphisms-freely-homotopic` — Conjugate homomorphisms induce freely homotopic maps

*Lemma.* Let φ : G → H be a homomorphism and h ∈ H, and let φ^h(g) = h φ(g) h⁻¹. Then Bφ and Bφ^h : BG → BH are freely homotopic; the homotopy moves the basepoint around the loop of h, and on π₁ the two maps differ by conjugation by h. In particular an inner automorphism of G induces a map BG → BG freely homotopic to the identity.

**Hypotheses.** G, H groups.

**Construction or proof outline.**

1. Left multiplication by h defines a natural isomorphism from SingleObj.mapHom φ to SingleObj.mapHom φ^h (naturality is h φ(g) = φ^h(g) h).
2. A natural transformation induces a homotopy (H.1/natural-transformations-adjoints-contractibility) whose track at the vertex is the loop of h.

**Acceptance.** For G abelian and φ = id, conjugation acts trivially. The free homotopy is not in general a based homotopy: on π₁ the maps differ by an inner automorphism.

**Prerequisites.** `H.1/natural-transformations-adjoints-contractibility`, `H.1/classifying-space-of-group`.

**Sources.** Weibel-KBook-IV, Homotopy-theoretic properties 3.2, p. IV.25.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Group`, namespace `Group`.

#### `H.1/bar-complex-comparison` — The nerve of a group is the bar construction

*Comparison.* For a group G and a G-representation M over a commutative ring k, the chain complex C_*(SingleObj G; M) of H.1/category-homology is isomorphic, compatibly with differentials and naturally in (G, M), to Mathlib's inhomogeneous chain complex of G with coefficients in M (the bar complex), so H_n(SingleObj G; M) ≅ groupHomology M n; composed with H.1/homology-of-small-categories this gives H_n(BG; M) ≅ H_n(G; M), natural in G and M and compatible with groupHomology.π.

**Hypotheses.** G a group, k a commutative ring, M : Rep k G; group homology as defined in Mathlib by inhomogeneous chains.

**Construction or proof outline.**

1. An n-simplex of N(SingleObj G) is (g₁, …, g_n) and the summand M(X₀) is M; the face d₀ acts through the first group element, d_i multiplies adjacent entries, d_n drops the last, which are the inhomogeneous differentials up to the reindexing (g₁, …, g_n) ↦ (g_n⁻¹, …) fixed by the side of the action (Weibel IV 3.4.2 and 3.5).
2. Match Mathlib's convention for the action (Rep k G with left action, chains Gⁿ → M) by composing with the inversion homeomorphism of H.1/classifying-space-op-homeomorph if needed; record the convention as an API lemma.
3. Naturality in G holds on the nose for the chain isomorphism; naturality of the homology isomorphism with respect to groupHomology.map follows.

**Acceptance.** H₁(BG; ℤ) ≅ G/[G, G] (Weibel IV p. 28). For G = ℤ/n and trivial ℤ coefficients, H_{2i−1}(BG; ℤ) ≅ ℤ/n and H_{2i}(BG; ℤ) = 0 for i ≥ 1.

**Prerequisites.** `H.1/category-homology`, `H.1/homology-of-small-categories`, `H.1/classifying-space-of-group`, `mathlib:groupHomology`.

**Sources.** Weibel-KBook-IV, Application 3.4.2 and (3.5), p. IV.28.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Group`, namespace `Group`.

#### `H.1/groupoid-nerve-one-type` — Classifying spaces of groupoids are 1-types

*Lemma.* If C is a small groupoid, its nerve is a Kan complex, BC has π₀(BC) = isomorphism classes of objects, π₁(BC, [X]) ≅ Aut(X) and π_n(BC) = 0 for n ≥ 2, and BC is homotopy equivalent to ⊔_{[X] ∈ C/≅} B Aut(X). In particular B(Core S) ≃ ⊔ B Aut(s) for any category S.

**Hypotheses.** C a small groupoid (all morphisms invertible).

**Construction or proof outline.**

1. Horn filling in the nerve of a groupoid: every horn Λ[n, k] → NC extends because all arrows are invertible (nerves are 2-coskeletal, Mathlib's CategoryTheory.Nerve.cosk₂Iso).
2. The inclusion of the full subcategory on a set of representatives of isomorphism classes is an equivalence of categories, hence a homotopy equivalence (H.1/adjunction-homotopy-equivalence); that subcategory is ⊔ SingleObj Aut(X), and each B Aut(X) is a K(Aut X, 1) (H.1/classifying-space-of-group-is-KG1).

**Acceptance.** For the groupoid of finite sets and bijections, B ≃ ⊔_n BΣ_n (Weibel IV Example 4.1.1(a)). For a non-groupoid such as Fin 2 the nerve is not Kan.

**Prerequisites.** `H.1/adjunction-homotopy-equivalence`, `H.1/classifying-space-of-group-is-KG1`, `H.1/pi0-classifying-space`, `mathlib:SSet.KanComplex`.

**Sources.** BhattScholze-WittGrassmannian-2017, Appendix §12, pp. 55–56; Weibel-KBook-IV, Definition 4.1, p. IV.36.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Basic`, namespace `CategoryTheory`.

**Coverage.** Status `planned`. Remaining refinements: Proofs imported from Milnor 1957 (realisation of products) and Gabriel–Zisman (gaps 'Realisation of products', 'Gabriel–Zisman imports'); Cellular comparison with local coefficients (gap).

## H.2 — Homotopy fibres and Quillen's theorems

RS-33 narrows this layer to path-space homotopy fibres and pullbacks with their maps and path-dependent transport, the fibre long exact sequence with its pointed-set end, Quillen's Theorems A and B with their distinct hypotheses, the quasi-fibration lemma, the bisimplicial diagonal and iterated realisation and the levelwise-equivalence theorem; Kan homotopy groups and their comparison, based pairs and basepoint transport on homotopy groups are imported. The red-team finding RT-AREA-ktheory-1/15 adds the realisation theorem for levelwise homotopy fibre sequences, and the maintainer's Nikolaus–Scholze source adds the properties of realisations of proper simplicial spaces and Bousfield–Kan homotopy colimits.

**Objects.** Weak homotopy equivalences; the homotopy fibre F(f, b) and homotopy pullback; the connecting map; quasi-fibrations; the realisation of simplicial spaces and bisimplicial sets; proper simplicial spaces; Bousfield–Kan homotopy colimits; the canonical map from a comma category to a homotopy fibre.

**Theorems.** Every map factors through a Hurewicz fibration with fibre the homotopy fibre; for Serre fibrations the fibre is the homotopy fibre; the long exact sequence of a homotopy fibre with the π₁-action at its end; transport of fibres along paths; homotopy-cartesian squares over contractible bases and their pasting; Dold–Lashof's local criteria; Quillen's quasi-fibration lemma; the diagonal lemma; realisation preserves finite limits; the gluing lemma; levelwise weak equivalences of proper simplicial spaces realise to weak equivalences; levelwise homotopy fibre sequences with connected bases realise to homotopy fibre sequences (Waldhausen, Bousfield–Friedlander; Weibel V.1.7); Thomason's theorem B(∫F) ≃ hocolim BF and the homology spectral sequence of a functor; Quillen's Theorem A, its prefibred form (with the identification of Quillen's prefibred functors with Mathlib's `Functor.IsPreFibered`), Theorem B and its prefibred form; the fibre sequence BN → BG → BQ of a group extension.

**Consumers.** GeneralAlgebraicKTheory K.1–K.4 use Theorems A and B, the realisation lemmas and the levelwise fibration theorem for additivity, localisation and the relative S-fibration; their hypotheses are checked there for the specific exact and Waldhausen categories.

### Declarations of H.2

#### `H.2/weak-homotopy-equivalence` — Weak homotopy equivalences of spaces

*Definition.* A continuous map f : X → Y is a weak homotopy equivalence if it induces a bijection π₀(X) → π₀(Y) and, for every x ∈ X and n ≥ 1, an isomorphism π_n(X, x) → π_n(Y, f x) (Mathlib's cubical homotopy groups, Tau Ceti's induced maps HomotopyGroup.mapHom). Weak homotopy equivalences satisfy two-out-of-three and contain homotopy equivalences; between CW complexes (more generally spaces of CW homotopy type) they are homotopy equivalences by Whitehead's theorem, imported from Tau Ceti AlgebraicTopology stage 8.

**Hypotheses.** X, Y arbitrary topological spaces; all basepoints, not one.

**Construction or proof outline.**

1. Define the predicate from the bijection on π₀ and the isomorphisms on π_n at every basepoint (Hatcher §4.1, before Theorem 4.5).
2. Two-out-of-three and invariance under homotopy follow from functoriality of HomotopyGroup.mapHom and homotopy invariance of induced maps (Tau Ceti HomotopyGroup.map_eq_of_homotopicRel with basepoint transport).

**API.**

- `TauCeti.IsWeakHomotopyEquivalence` (constructor): IsWeakHomotopyEquivalence f :↔ Function.Bijective (π₀ map of f) ∧ ∀ x n, Function.Bijective (HomotopyGroup.map f (n+1) at x).
- `TauCeti.IsWeakHomotopyEquivalence.comp` (relation): If f and g are weak homotopy equivalences so is g ∘ f; if g and g ∘ f are, so is f; if f and g ∘ f are, so is g.
- `ContinuousMap.HomotopyEquiv.isWeakHomotopyEquivalence` (compatibility): The forward map of a homotopy equivalence X ≃ₕ Y is a weak homotopy equivalence.
- `TauCeti.IsWeakHomotopyEquivalence.of_homotopic` (relation): If f is homotopic to g and f is a weak homotopy equivalence then so is g.
- `TauCeti.IsWeakHomotopyEquivalence.homotopyEquiv_of_cw` (compatibility): A weak homotopy equivalence between CW complexes is the forward map of a homotopy equivalence (Whitehead, Tau Ceti AlgebraicTopology stage 8).

**Unit tests.**

- `isWeakHomotopyEquivalence_id` (degenerate): The identity of any space is a weak homotopy equivalence.
- `isWeakHomotopyEquivalence_contractible` (computation): Any map between contractible spaces is a weak homotopy equivalence.
- `isWeakHomotopyEquivalence_not_pi0` (non-example): The inclusion of one point into a two-point discrete space is not a weak homotopy equivalence (π₀ fails), although it is an isomorphism on all π_n at its basepoint.
- `isWeakHomotopyEquivalence_iff_homotopyEquiv_cw` (compatibility): For CW complexes X, Y, f is a weak homotopy equivalence iff it is the forward map of a homotopy equivalence.

**Uses.** H.2/quasi-fibration: a quasi-fibration is a map whose fibre inclusions into homotopy fibres are weak homotopy equivalences; H.2/levelwise-equivalence-theorem: levelwise weak equivalences of proper simplicial spaces realise to weak equivalences; H.5:spectra/stable-equivalence: levelwise weak equivalences of spectra are stable equivalences; H.3/acyclic-map-homology-criterion: homology isomorphisms between simple spaces are compared with weak equivalences.

**Acceptance.** A homotopy equivalence is a weak homotopy equivalence. The inclusion of a point in the Warsaw circle is a weak homotopy equivalence that is not a homotopy equivalence; Whitehead's theorem needs CW hypotheses.

**Prerequisites.** `mathlib:HomotopyGroup.Pi`, `tauceti:HomotopyGroup.mapHom`, `mathlib:ContinuousMap.HomotopyEquiv`.

**Sources.** Hatcher-AlgebraicTopology, §4.1, paragraph before Theorem 4.5, printed p. 346 (PDF 355).

**Suggested home.** `TauCeti/AlgebraicTopology/HomotopyFiber/Basic`, namespace `TauCeti`.

#### `H.2/homotopy-fibre-and-long-exact-sequence` — Homotopy fibre of a map — planet: *Homotopy fibre*

*Definition.* For a continuous map f : A → B and b ∈ B, the homotopy fibre F(f, b) is the subspace of A × C(I, B) (compact-open topology) of pairs (a, γ) with γ(0) = f(a) and γ(1) = b; it is pointed by (a₀, const) when f(a₀) = b, and comes with the projection F(f, b) → A, (a, γ) ↦ a. The strict fibre f⁻¹(b) includes as the pairs with constant γ. Convention pinned: paths run from f(a) to b (Quillen, Hatcher); Weibel's F(f) uses paths from the basepoint to f(e), and reversing paths is a natural homeomorphism between the two. A sequence F → A → B with F → B constant is a homotopy fibre sequence when the evident map F → F(f, b) is a weak homotopy equivalence.

**Hypotheses.** f continuous; no fibration hypothesis; b any point of B.

**Construction or proof outline.**

1. Define homotopyFiber f b as the pullback of A × C(I,B) along evaluation at 0 and 1 (Hatcher §4.3 'Pathspace constructions', the fibre of E_f → B).
2. A commutative square (f′ : A′ → B′, f : A → B, α : A′ → A, β : B′ → B) with β(b′) = b induces F(f′, b′) → F(f, b), (a, γ) ↦ (α a, β ∘ γ), functorially.
3. The relation to Weibel's convention is the homeomorphism (a, γ) ↦ (a, γ reversed) (Weibel IV 1.2).

**API.**

- `TauCeti.homotopyFiber` (constructor): homotopyFiber f b : TopCat, the subspace {p : A × C(I, B) | p.2 0 = f p.1 ∧ p.2 1 = b}.
- `TauCeti.homotopyFiber.proj` (projection): The continuous projection homotopyFiber f b → A.
- `TauCeti.homotopyFiber.basepoint` (data): For a₀ with f a₀ = b, the point (a₀, constant path).
- `TauCeti.homotopyFiber.ofFiber` (constructor): The inclusion of the strict fibre f ⁻¹' {b} sending a to (a, const).
- `TauCeti.homotopyFiber.map` (functoriality): A commutative square of spaces induces a map of homotopy fibres, with map_id and map_comp.
- `TauCeti.homotopyFiber.loopSpaceInclusion` (constructor): For f a₀ = b, the map Ω B b → homotopyFiber f b, ω ↦ (a₀, ω), the fibre inclusion of the next term of the Puppe sequence.
- `TauCeti.homotopyFiber.ofHomotopy` (relation): Homotopic maps f ≃ g (by a homotopy H) have homotopy-equivalent homotopy fibres over each b, by concatenation with the tracks of H.
- `TauCeti.homotopyFiber.reverseHomeomorph` (equivalence): The homeomorphism with Weibel's convention (paths from b to f a) given by reversing paths.
- `TauCeti.IsHomotopyFiberSequence` (constructor): For maps i : F → A and f : A → B with f ∘ i constant at b and a chosen null-homotopy, the predicate that the induced F → homotopyFiber f b is a weak homotopy equivalence.

**Unit tests.**

- `homotopyFiber_id_contractible` (degenerate): homotopyFiber (𝟙 B) b is contractible for every b.
- `homotopyFiber_point_eq_loopSpace` (computation): For the inclusion of the point b into B, homotopyFiber is homeomorphic to Ω B b = LoopSpace B b.
- `homotopyFiber_toPoint` (computation): For the constant map A → point, homotopyFiber is homeomorphic to A.
- `homotopyFiber_ofFiber_not_weakEquiv` (non-example): For the inclusion SingleObj H → SingleObj G of a proper subgroup, realised, the strict fibre is a point but the homotopy fibre is the discrete set G/H, so ofFiber is not a weak homotopy equivalence.

**Uses.** H.3/acyclic-spaces-and-maps: acyclic maps are defined by acyclicity of the homotopy fibre; KTheoryFiniteLocalFields:L.1/quillen-fibration: BGL(F_q)⁺ is identified with the homotopy fibre of ψ^q − 1 on BU and K_n(F_q) read off its long exact sequence; H.2/quillen-theorem-b: B(Y\f) is identified with the homotopy fibre of Bf; GeneralAlgebraicKTheory:K.5: relative K-theory space as a homotopy fibre of the map of K-theory spaces; SchemeKTheoryOperations:S.3: homotopy fibres of maps of K-theory spaces in localisation sequences.

**Acceptance.** For the inclusion of a point {b} → B, F = ΩB, the loop space at b (Hatcher p. 408). For H ⊂ G the homotopy fibre of BH → BG is the discrete set G/H while the strict fibre category is a point (Weibel IV Exercise 3.3). Record whether each low-degree homotopy set is a pointed set or a group (H.2/long-exact-sequence).

**Prerequisites.** `mathlib:Path`, `H.2/weak-homotopy-equivalence`.

**Sources.** Weibel-KBook-IV, Homotopy Fiber 1.2, p. IV.3; Hatcher-AlgebraicTopology, §4.3 'Pathspace constructions', printed p. 407 (PDF 416).

**Suggested home.** `TauCeti/AlgebraicTopology/HomotopyFiber/Basic`, namespace `TauCeti`.

#### `H.2/mapping-path-space-fibration` — Every map factors through a fibration

*Lemma.* For f : A → B, the mapping path space E_f = {(a, γ) : γ(0) = f(a)} ⊂ A × C(I, B) with p(a, γ) = γ(1) is a Hurewicz fibration (homotopy lifting for all spaces), hence a Serre fibration in the sense of Tau Ceti AlgebraicTopology stage 5; the inclusion A → E_f, a ↦ (a, const), is a homotopy equivalence (E_f deformation retracts onto A) with p ∘ incl = f; the fibre of p over b is homotopyFiber f b.

**Hypotheses.** f continuous; I = [0,1] with the compact-open topology on C(I, B), which is exponential because I is locally compact.

**Construction or proof outline.**

1. Lift a homotopy g_t : X → B with initial lift x ↦ (h x, γ_x) by g̃_t(x) = (h x, γ_x followed by g|[0,t](x)); continuity by the exponential law for C(I, B) (Hatcher Prop. 4.64).
2. Truncating paths to initial segments deformation retracts E_f onto A (Hatcher p. 407).

**Acceptance.** For f a fibration the inclusion E ↪ E_p is a fibre homotopy equivalence (H.2/fibre-to-homotopy-fibre). For f the inclusion of a point, E_f is the based path space PB, which is contractible.

**Prerequisites.** `H.2/homotopy-fibre-and-long-exact-sequence`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

**Sources.** Hatcher-AlgebraicTopology, §4.3, Proposition 4.64, printed p. 407 (PDF 416).

**Suggested home.** `TauCeti/AlgebraicTopology/HomotopyFiber/Basic`, namespace `TauCeti`.

#### `H.2/fibre-to-homotopy-fibre` — For a fibration the fibre is the homotopy fibre

*Lemma.* If p : E → B is a Hurewicz fibration then the inclusion of each strict fibre p⁻¹(b) into homotopyFiber p b is a homotopy equivalence (E ↪ E_p is a fibre homotopy equivalence); if p is a Serre fibration (Tau Ceti AlgebraicTopology stage 5 carrier) it is a weak homotopy equivalence. Hence for a Serre fibration p⁻¹(b) → E → B is a homotopy fibre sequence.

**Hypotheses.** p a Hurewicz fibration for the homotopy-equivalence statement; a Serre fibration (disc lifting) for the weak-equivalence statement.

**Construction or proof outline.**

1. Lift the homotopy g_t(e, γ) = γ(t) on E_p starting at (e, γ) ↦ e; the lift is a fibre-preserving deformation of E_p into E (Hatcher Prop. 4.65).
2. For Serre fibrations, compare the long exact sequences of p and of E_p → B (Hatcher Theorem 4.41 and H.2/long-exact-sequence) and apply the five lemma at every basepoint, including the pointed-set end with the π₁-action of H.2/fibre-sequence-low-degree.

**Acceptance.** The projection B × F → B: the inclusion of F into the homotopy fibre is a homotopy equivalence. For a covering map the fibre is discrete and is the homotopy fibre up to weak equivalence (covering maps are Hurewicz fibrations, Mathlib IsCoveringMap.liftHomotopy).

**Prerequisites.** `H.2/mapping-path-space-fibration`, `H.2/long-exact-sequence`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

**Sources.** Hatcher-AlgebraicTopology, §4.3, Proposition 4.65, printed p. 408 (PDF 417).

**Suggested home.** `TauCeti/AlgebraicTopology/HomotopyFiber/Basic`, namespace `TauCeti`.

#### `H.2/connecting-map` — Connecting map of a homotopy fibre

*Construction.* For f : A → B and a₀ ∈ A with f(a₀) = b, the connecting map ∂ : π_{n+1}(B, b) → π_n(F(f, b), (a₀, const)) for n ≥ 0 is the composite of the loop-space shift π_{n+1}(B, b) ≅ π_n(ΩB, const) (Tau Ceti HomotopyGroup.pathLoopSpaceMulEquiv, with Mathlib's π₁ ≅ π₀(Ω) in degree 0) with the map induced by the inclusion ΩB → F(f, b), ω ↦ (a₀, ω). It is a group homomorphism for n ≥ 1 and a map of pointed sets for n = 0, natural for commutative squares.

**Hypotheses.** Based at a₀ with f(a₀) = b; n ≥ 0.

**Construction or proof outline.**

1. Use the loop-space shift isomorphism of Tau Ceti (HomotopyGroup.pathLoopSpaceMulEquiv) and HomotopyGroup.mapHom of the inclusion ΩB → F(f, b) (H.2/homotopy-fibre-and-long-exact-sequence API loopSpaceInclusion).
2. Naturality: a square (α, β) induces maps of loop spaces and of homotopy fibres commuting with the inclusions (Hatcher §4.3 identification of π_{i+1}(B, A) with π_i(F_f)).

**API.**

- `TauCeti.homotopyFiber.connecting` (constructor): connecting f a₀ (n) : HomotopyGroup.Pi (n+1) B b → HomotopyGroup.Pi n (homotopyFiber f b) basepoint.
- `TauCeti.homotopyFiber.connectingHom` (constructor): For n ≥ 1, connecting as a group homomorphism.
- `TauCeti.homotopyFiber.connecting_naturality` (functoriality): For a commutative square, connecting commutes with the induced maps on π_{n+1} of the bases and π_n of the homotopy fibres.
- `TauCeti.homotopyFiber.connecting_eq_loopShift` (characterisation): connecting = (loopSpaceInclusion)_* ∘ (loop-space shift isomorphism).

**Unit tests.**

- `connecting_id_eq_zero` (degenerate): For f = 𝟙 B, connecting is the trivial map.
- `connecting_point_bijective` (computation): For the inclusion of the point b into B, connecting is bijective in every degree (it is the loop-space shift).
- `connecting_basepointChange` (compatibility): Under change of basepoint along a path in A (TauCeti.homotopyGroupMulEquivOfPath) connecting is conjugated by the corresponding transports.
- `connecting_not_hom_degree_zero` (non-example): In degree 0 the target π₀(F) is only a pointed set: for BH → BG with H = Σ₂ ⊂ G = Σ₃ the homotopy fibre is the discrete space G/H and connecting is g ↦ gH : G → G/H; no group structure on G/H makes it a homomorphism, since its kernel would be the non-normal subgroup H.

**Uses.** H.2/long-exact-sequence: the boundary of the long exact sequence of a homotopy fibre; H.2/quillen-theorem-b: the long exact sequence ⋯ → π_{i+1}(BC′) → π_i(B(Y\f)) → ⋯ uses this ∂; KTheoryFiniteLocalFields:L.1/quillen-fibration: the boundary π_{n+1}BU → π_n F Ψ^q computes K_n(F_q).

**Acceptance.** For f = id_B the connecting map lands in π_n of a contractible space and is zero. For the path fibration of a point, ∂ is the loop-space shift isomorphism.

**Prerequisites.** `H.2/homotopy-fibre-and-long-exact-sequence`, `tauceti:HomotopyGroup.pathLoopSpaceMulEquiv`, `tauceti:HomotopyGroup.mapHom`, `mathlib:LoopSpace`.

**Sources.** Weibel-KBook-IV, Homotopy Fiber 1.2, p. IV.3; Hatcher-AlgebraicTopology, §4.3, printed p. 407 (PDF 416).

**Suggested home.** `TauCeti/AlgebraicTopology/HomotopyFiber/Basic`, namespace `TauCeti`.

#### `H.2/long-exact-sequence` — Long exact sequence of a homotopy fibre — planet: *Long exact sequence of a homotopy fibre*

*Theorem.* For f : A → B and a₀ ∈ A with f(a₀) = b, write F = F(f, b) pointed at ā₀ = (a₀, const). The sequence ⋯ → π_{n+1}(B, b) →∂ π_n(F, ā₀) → π_n(A, a₀) → π_n(B, b) →∂ ⋯ → π₁(B, b) →∂ π₀(F) → π₀(A) → π₀(B) is exact: exactness at each term means image = kernel (preimage of the base point for pointed sets). The terms π_n are abelian groups for n ≥ 2, groups for n = 1 and pointed sets for n = 0, and the maps are homomorphisms where both sides are groups. The sequence is natural in commutative squares.

**Hypotheses.** a₀ with f(a₀) = b; no fibration hypothesis on f (the homotopy fibre makes it one up to homotopy).

**Construction or proof outline.**

1. Replace f by the fibration E_f → B with fibre F (H.2/mapping-path-space-fibration); A ≃ E_f.
2. For a Serre fibration p : E → B with fibre F, p_* : π_n(E, F, x₀) → π_n(B, b) is an isomorphism for n ≥ 1 (Hatcher Theorem 4.41, the relative homotopy groups and the long exact sequence of the based pair from Tau Ceti AlgebraicTopology stage 8).
3. Splice with the long exact sequence of the based pair (E, F) (Tau Ceti AlgebraicTopology stage 8 item 1), identify the resulting boundary with H.2/connecting-map, and check exactness at π₀(F), π₀(A) directly.

**Acceptance.** For the path fibration ΩB → PB → B, π_{n+1}(B) ≅ π_n(ΩB). Exhibit a fibration where π₁(B) → π₀(F) is not injective and π₀(F) is not a group (H.2/fibre-sequence-low-degree): the sequence of pointed sets is exact but carries the extra π₁-action. For BH → BG with H ⊂ G: 1 → H → G → G/H → * gives π₀F = G/H.

**Prerequisites.** `H.2/homotopy-fibre-and-long-exact-sequence`, `H.2/connecting-map`, `H.2/mapping-path-space-fibration`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Sources.** Hatcher-AlgebraicTopology, §4.2, Theorem 4.41, printed p. 376 (PDF 385); Weibel-KBook-IV, Homotopy Fiber 1.2, p. IV.3; Quillen-HigherK-I-1973, §1 'The exact homotopy sequence', LNM p. 96 (PDF 12).

**Suggested home.** `TauCeti/AlgebraicTopology/HomotopyFiber/Basic`, namespace `TauCeti`.

#### `H.2/fibre-sequence-low-degree` — The π₁-action at the pointed-set end of the fibre sequence

*Lemma.* For f : A → B with f(a₀) = b and F = F(f, b), the group π₁(B, b) acts on the set π₀(F) by transporting the path coordinate (concatenation with loops at b); the connecting map ∂ : π₁(B, b) → π₀(F) is the orbit map of the base point. Two elements of π₀(F) have the same image in π₀(A) iff they lie in the same π₁(B, b)-orbit, and the stabiliser of [ā₀] is the image of π₁(A, a₀) → π₁(B, b). Similarly π₂(B) → π₁(F) has central image when A is a point.

**Hypotheses.** a₀ with f(a₀) = b.

**Construction or proof outline.**

1. Define the action by (a, γ) · ω = (a, γ · ω) for ω a loop at b; it respects homotopy classes.
2. If (a, γ), (a′, γ′) have path-connected images in A, a path from a to a′ transports γ to a path γ″ from f(a′) to b, and γ″⁻¹ · γ′ is a loop ω with (a′, γ″) · ω = (a′, γ′); conversely an orbit maps to one component.
3. The stabiliser computation is the exactness at π₁(B) of H.2/long-exact-sequence.

**Acceptance.** For BH → BG with H ⊂ G a subgroup, π₀F = G/H with π₁(BG) = G acting by left translation; the stabiliser of the coset H is H = image of π₁(BH).

**Prerequisites.** `H.2/long-exact-sequence`.

**Sources.** Weibel-KBook-IV, Homotopy Fiber 1.2, p. IV.3; Weibel-KBook-IV, Exercise 3.3, p. IV.34.

**Suggested home.** `TauCeti/AlgebraicTopology/HomotopyFiber/Basic`, namespace `TauCeti`.

#### `H.2/homotopy-fibre-transport` — Transport of homotopy fibres along paths in the base

*Construction.* For f : A → B and a path ω from b to b′ in B, transport T_ω : F(f, b) → F(f, b′), (a, γ) ↦ (a, γ · ω), is a homotopy equivalence with homotopy inverse T_{ω⁻¹}; its homotopy class depends only on the path class of ω, T_{const} ≃ id and T_{ω·ω′} ≃ T_{ω′} ∘ T_ω, so b ↦ F(f, b) is a functor from the fundamental groupoid of B to the homotopy category of spaces. Transport commutes with the projections to A and intertwines the connecting maps with Tau Ceti's change-of-basepoint isomorphisms on π_*(B).

**Hypotheses.** f continuous; ω a path in B.

**Construction or proof outline.**

1. Concatenation of paths is continuous on the path spaces (compact-open topology) and associative and unital up to homotopy rel endpoints (Mathlib Path.Homotopy).
2. A homotopy of paths ω ≃ ω′ rel endpoints gives a homotopy T_ω ≃ T_{ω′} by concatenating with the intermediate paths (Hatcher Prop. 4.61 proof, for the fibration E_f → B).
3. Compatibility with ∂ uses the definition of ∂ through ΩB and the basepoint change TauCeti.homotopyGroupMulEquivOfPath.

**API.**

- `TauCeti.homotopyFiber.transport` (constructor): transport f ω : homotopyFiber f b → homotopyFiber f b′ for ω : Path b b′.
- `TauCeti.homotopyFiber.transportHomotopyEquiv` (equivalence): transport f ω is a homotopy equivalence with inverse transport f ω.symm.
- `TauCeti.homotopyFiber.transport_homotopic` (relation): Homotopic paths rel endpoints give homotopic transports.
- `TauCeti.homotopyFiber.transport_trans` (functoriality): transport f (ω.trans ω′) is homotopic to transport f ω′ ∘ transport f ω; transport along a constant path is homotopic to the identity.
- `TauCeti.homotopyFiber.connecting_transport` (compatibility): connecting at b′ ∘ (basepoint change along ω on π_{n+1} B) = (transport f ω)_* ∘ connecting at b.

**Unit tests.**

- `transport_refl_homotopic_id` (degenerate): transport f (Path.refl b) is homotopic to the identity.
- `transport_loopSpace` (computation): For the inclusion of the point b, transport along a loop ω is right concatenation by ω on Ω B b.
- `transport_comm_proj` (characterisation): proj ∘ transport f ω = proj.
- `transport_not_identity_onPi0` (non-example): For BH → BG and a loop g ∉ H, transport acts on π₀(homotopyFiber) = G/H nontrivially; transport is not the identity on π₀.

**Uses.** GeneralAlgebraicKTheory:K.2:plus: the K-theoretic boundary maps are used at varying basepoints; the transport must be constructed before using the boundary; H.2/quillen-theorem-b: the homotopy fibres over different objects Y are compared along the edges of BC′; H.3/plus-relative-fibre-comparison: fibres of plus constructions are compared over the base.

**Acceptance.** For a constant loop ω, T_ω is homotopic to the identity. For the inclusion of a point, transport along a loop ω acts on ΩB by right concatenation.

**Prerequisites.** `H.2/homotopy-fibre-and-long-exact-sequence`, `H.2/connecting-map`, `tauceti:TauCeti.homotopyGroupMulEquivOfPath`.

**Sources.** Hatcher-AlgebraicTopology, §4.3, Proposition 4.61, printed p. 405 (PDF 414).

**Suggested home.** `TauCeti/AlgebraicTopology/HomotopyFiber/Basic`, namespace `TauCeti`.

#### `H.2/homotopy-pullback` — Homotopy pullbacks and homotopy-cartesian squares

*Definition.* For maps f : A → B and g : C → B, the homotopy pullback A ×ʰ_B C is the space of triples (a, γ, c) with γ a path from f(a) to g(c). A commutative square with E′ → E over h : B′ → B (maps p′ : E′ → B′, p : E → B, α : E′ → E, p ∘ α = h ∘ p′) is homotopy-cartesian if the canonical map E′ → B′ ×ʰ_B E, e′ ↦ (p′ e′, const, α e′), is a weak homotopy equivalence. Quillen uses homotopy equivalence; the two agree for spaces of CW homotopy type (Whitehead), and the node fixes weak homotopy equivalence as the definition.

**Hypotheses.** Maps of topological spaces; the square commutes strictly.

**Construction or proof outline.**

1. Define the homotopy pullback as the pullback of A × C(I, B) × C along evaluations (Quillen §1, LNM p. 96).
2. The homotopy fibre is the homotopy pullback along the inclusion of a point: F(f, b) = A ×ʰ_B {b}.

**API.**

- `TauCeti.homotopyPullback` (constructor): homotopyPullback f g : TopCat, triples (a, γ, c) with γ 0 = f a, γ 1 = g c.
- `TauCeti.homotopyPullback.fst` (projection): The projections to A and C, and the homotopy between f ∘ fst and g ∘ snd given by γ.
- `TauCeti.homotopyPullback.symm` (equivalence): homotopyPullback f g ≅ homotopyPullback g f by reversing paths.
- `TauCeti.IsHomotopyCartesian` (constructor): A commutative square is homotopy-cartesian if the comparison map to the homotopy pullback is a weak homotopy equivalence.
- `TauCeti.homotopyPullback.point_eq_homotopyFiber` (compatibility): homotopyPullback f (point b) ≅ homotopyFiber f b.
- `TauCeti.IsHomotopyCartesian.of_serreFibration` (compatibility): The pullback square of a Serre fibration (Tau Ceti AlgebraicTopology stage 5 carrier) along any map is homotopy-cartesian.

**Unit tests.**

- `homotopyPullback_point_point` (computation): homotopyPullback (point b) (point b) is the loop space Ω B b.
- `isHomotopyCartesian_id` (degenerate): The square with two identity maps is homotopy-cartesian.
- `isHomotopyCartesian_iff_fiber` (characterisation): For B′ contractible, the square is homotopy-cartesian iff E′ → homotopyFiber p (h b′) is a weak homotopy equivalence (H.2/homotopy-cartesian-contractible-base).
- `not_isHomotopyCartesian_strictFiber` (non-example): For a proper subgroup H ⊂ G the square (strict fibre point → BH over point → BG) is not homotopy-cartesian.

**Uses.** H.2/quillen-theorem-b: Theorem B states that the square with Y\f → C over Y\C′ → C′ is homotopy-cartesian; H.2/homotopy-cartesian-pasting: the proof of Theorem B pastes homotopy-cartesian squares; H.3/plus-relative-fibre-comparison: relative plus constructions preserve homotopy-cartesian squares of fibres.

**Acceptance.** A pullback square of a Serre fibration is homotopy-cartesian. The square with the strict fibre of BH → BG is not homotopy-cartesian for H ≠ G.

**Prerequisites.** `H.2/homotopy-fibre-and-long-exact-sequence`, `H.2/weak-homotopy-equivalence`.

**Sources.** Quillen-HigherK-I-1973, §1 'The exact homotopy sequence', LNM p. 96 (PDF 12).

**Suggested home.** `TauCeti/AlgebraicTopology/HomotopyFiber/Basic`, namespace `TauCeti`.

#### `H.2/homotopy-cartesian-contractible-base` — Homotopy-cartesian squares over a contractible base

*Lemma.* If B′ is contractible, a commutative square E′ → E over B′ → B is homotopy-cartesian iff for one (equivalently every) b′ ∈ B′ the induced map E′ → F(p, h(b′)) is a weak homotopy equivalence.

**Hypotheses.** B′ contractible.

**Construction or proof outline.**

1. For contractible B′ the projection B′ ×ʰ_B E → {b′} ×ʰ_B E = F(p, h b′) is a homotopy equivalence (contract B′ and transport, H.2/homotopy-fibre-transport).
2. Compose with the comparison map and use two-out-of-three (H.2/weak-homotopy-equivalence).

**Acceptance.** With B′ = point this is the definition of a homotopy fibre sequence.

**Prerequisites.** `H.2/homotopy-pullback`, `H.2/homotopy-fibre-transport`.

**Sources.** Quillen-HigherK-I-1973, §1 'The exact homotopy sequence', LNM pp. 96–97 (PDF 12–13).

**Suggested home.** `TauCeti/AlgebraicTopology/HomotopyFiber/Basic`, namespace `TauCeti`.

#### `H.2/homotopy-cartesian-pasting` — Pasting homotopy-cartesian squares

*Lemma.* Given two adjacent commutative squares, (1) on the left and (2) on the right, with (2) homotopy-cartesian, the composite square (1)+(2) is homotopy-cartesian iff (1) is. Also, a square whose two horizontal maps are weak homotopy equivalences is homotopy-cartesian.

**Hypotheses.** Squares commute strictly; weak homotopy equivalence as the comparison notion.

**Construction or proof outline.**

1. The homotopy pullback along a composite is the iterated homotopy pullback up to natural homotopy equivalence (concatenate paths), so the comparison maps factor through each other.
2. Apply two-out-of-three (H.2/weak-homotopy-equivalence); for horizontal equivalences compare homotopy fibres by H.2/long-exact-sequence and the five lemma.

**Acceptance.** Used in the final step of the proof of Theorem B: (1)+(3) and (3) homotopy-cartesian imply (1) homotopy-cartesian (Quillen p. 99).

**Prerequisites.** `H.2/homotopy-pullback`, `H.2/long-exact-sequence`.

**Sources.** Quillen-HigherK-I-1973, Proof of Theorem B, LNM p. 99 (PDF 15).

**Suggested home.** `TauCeti/AlgebraicTopology/HomotopyFiber/Basic`, namespace `TauCeti`.

#### `H.2/comma-category-to-homotopy-fibre` — From comma categories to homotopy fibres

*Construction.* For a functor f : C ⥤ C′ and an object Y of C′, the forgetful functor j : Y\f → C (objects (X, v : Y → fX)) and the natural transformation from the constant functor at Y to f ∘ j given by v induce a null-homotopy of B(f ∘ j) to the vertex [Y], hence a canonical map B(Y\f) → F(Bf, [Y]) (after reversing paths to the pinned convention), natural in Y for the transition functors u* : Y′\f → Y\f. Dually for f/Y.

**Hypotheses.** f a functor between small categories; Y an object of C′.

**Construction or proof outline.**

1. The transformation (X, v) ↦ v : Y ⟶ f X gives a homotopy from the constant map at [Y] to B(f ∘ j) (H.1/natural-transformations-adjoints-contractibility), i.e. a map B(Y\f) → homotopyFiber (Bf) [Y] (Quillen §1, LNM p. 96; Weibel IV Example 3.2.3).
2. Naturality in u : Y → Y′ follows from the compatibility of the homotopies with u*.

**API.**

- `CategoryTheory.commaToHomotopyFiber` (constructor): commaToHomotopyFiber f Y : classifyingSpace (StructuredArrow Y f) ⟶ homotopyFiber (classifyingSpaceMap f) [Y].
- `CategoryTheory.commaToHomotopyFiber_proj` (characterisation): proj ∘ commaToHomotopyFiber f Y = classifyingSpaceMap (StructuredArrow.proj Y f).
- `CategoryTheory.commaToHomotopyFiber_naturality` (functoriality): For u : Y ⟶ Y′, commaToHomotopyFiber at Y composed with B(u*) is homotopic to transport along edge u composed with commaToHomotopyFiber at Y′.
- `CategoryTheory.costructuredArrowToHomotopyFiber` (constructor): The dual map from B(f/Y) (CostructuredArrow f Y) to the homotopy fibre.

**Unit tests.**

- `commaToHomotopyFiber_id` (degenerate): For f = 𝟭 C′ both source and target are contractible, so commaToHomotopyFiber is a weak homotopy equivalence.
- `commaToHomotopyFiber_subgroup` (computation): For SingleObj H → SingleObj G (H ⊂ G), the comma category ∗\f is the action category of H acting on G by translation, equivalent to the discrete category H\G of cosets, and commaToHomotopyFiber is a weak homotopy equivalence onto the discrete homotopy fibre, which has one point for each coset.
- `commaToHomotopyFiber_fiber_compat` (compatibility): Restricted to the strict fibre f⁻¹(Y) ⊆ Y\f (objects (X, id)), it agrees with homotopyFiber.ofFiber.
- `commaToHomotopyFiber_not_equiv` (non-example): For the inclusion of the object 0 into Fin 2 the comma category 1\f is empty while the homotopy fibre over 1 is contractible: the map is not a weak equivalence without Theorem B's hypothesis.

**Uses.** H.2/quillen-theorem-b: Theorem B asserts that this canonical map is a weak homotopy equivalence; GeneralAlgebraicKTheory:K.3: the localisation and dévissage proofs identify homotopy fibres of BQ-maps with comma categories.

**Acceptance.** If f = id, the map B(Y\C′) → F(id, [Y]) is a map between contractible spaces.

**Prerequisites.** `H.2/homotopy-fibre-and-long-exact-sequence`, `H.1/natural-transformations-adjoints-contractibility`, `mathlib:CategoryTheory.StructuredArrow`, `mathlib:CategoryTheory.CostructuredArrow`.

**Sources.** Weibel-KBook-IV, Example 3.2.3, p. IV.26; Quillen-HigherK-I-1973, §1, LNM p. 96 (PDF 12).

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/QuillenAB`, namespace `CategoryTheory`.

#### `H.2/quasi-fibration` — Quasi-fibrations

*Definition.* A continuous map p : E → B is a quasi-fibration if for every b ∈ B the inclusion of the strict fibre p⁻¹(b) into the homotopy fibre F(p, b) is a weak homotopy equivalence; equivalently (B path-connected) p_* : π_i(E, p⁻¹(b), x₀) → π_i(B, b) is bijective for all b, x₀ ∈ p⁻¹(b), i ≥ 0. Serre fibrations are quasi-fibrations; a quasi-fibration has the long exact sequence of its strict fibres.

**Hypotheses.** p continuous; the definition quantifies over all points b of B.

**Construction or proof outline.**

1. Define the predicate through H.2/homotopy-fibre-and-long-exact-sequence and H.2/weak-homotopy-equivalence (Hatcher §4.K, alternative condition).
2. Equivalence with the relative-homotopy formulation: the triangle p⁻¹(b) → F_b → E_p with E ≃ E_p and the long exact sequence of the based pair (Hatcher p. 479).

**API.**

- `TauCeti.IsQuasiFibration` (constructor): IsQuasiFibration p :↔ ∀ b, IsWeakHomotopyEquivalence (homotopyFiber.ofFiber p b).
- `TauCeti.IsQuasiFibration.of_serreFibration` (compatibility): A Serre fibration (Tau Ceti AlgebraicTopology stage 5) is a quasi-fibration (H.2/fibre-to-homotopy-fibre).
- `TauCeti.IsQuasiFibration.longExactSequence` (other): For a quasi-fibration the strict fibre p⁻¹(b) → E → B has the long exact sequence of H.2/long-exact-sequence with F replaced by p⁻¹(b).
- `TauCeti.IsQuasiFibration.iff_relative` (characterisation): For B path-connected, IsQuasiFibration p ↔ ∀ b x₀ i, p_* : π_i(E, p⁻¹ b, x₀) → π_i(B, b) is bijective.

**Unit tests.**

- `isQuasiFibration_prod_fst` (computation): The projection B × F → B is a quasi-fibration.
- `isQuasiFibration_mappingCylinder_iff` (characterisation): The projection of the mapping cylinder of f onto I is a quasi-fibration iff f is a weak homotopy equivalence.
- `isQuasiFibration_id` (degenerate): The identity of any space is a quasi-fibration.
- `not_isQuasiFibration_two_intervals` (non-example): The map [0, 1/2] ⊔ [1/2, 1] → [0, 1] given by the two inclusions is not a quasi-fibration: its homotopy fibres are all two points, but its fibre over 0 is one point.

**Uses.** H.2/quasi-fibration-lemma: realisations of diagrams of spaces over a nerve with homotopy-equivalence transitions are quasi-fibrations; H.2/quillen-theorem-b: Bp₂ : BS(f) → BC′^op is a quasi-fibration, giving the homotopy-cartesian square.

**Acceptance.** The projection of the mapping cylinder M_f → I is a quasi-fibration iff f is a weak homotopy equivalence (Hatcher p. 479).

**Prerequisites.** `H.2/homotopy-fibre-and-long-exact-sequence`, `H.2/weak-homotopy-equivalence`, `H.2/fibre-to-homotopy-fibre`.

**Sources.** Hatcher-AlgebraicTopology, §4.K 'Quasifibrations', printed p. 479 (PDF 488); Quillen-HigherK-I-1973, §1, lemma preceding 'Proof of Theorem B', LNM p. 97 (PDF 13).

**Suggested home.** `TauCeti/AlgebraicTopology/HomotopyFiber/QuasiFibration`, namespace `TauCeti`.

#### `H.2/dold-lashof-criteria` — Local criteria for quasi-fibrations (Dold–Lashof)

*Lemma.* A map p : E → B is a quasi-fibration if (a) B = V₁ ∪ V₂ with V_i open and p restricted over V₁, V₂ and V₁ ∩ V₂ quasi-fibrations; or (b) B = ∪ B_n increasing with every compact subset in some B_n and each p⁻¹(B_n) → B_n a quasi-fibration; or (c) there is a deformation of E into E′ covering a deformation of B into B′ with E′ → B′ a quasi-fibration and the end map p⁻¹(b) → p⁻¹(F₁ b) a weak homotopy equivalence for each b.

**Hypotheses.** As stated; Hatcher proves (a) only when all fibres are path-connected and leaves the general case as an exercise; Quillen's application (diagrams over a nerve whose spaces need not be connected) needs the general case of Dold–Lashof 1959, Lemmas 1.3–1.5 (not read).

**Construction or proof outline.**

1. (a) by a Mayer–Vietoris argument on relative homotopy groups (Hatcher Lemma 4K.3 proof, path-connected fibres).
2. (b) by compactness of spheres and their homotopies.
3. (c) by comparing the long exact sequences of the deformed pairs.
4. The general case of (a) without connectivity of fibres is imported from Dold–Lashof 1959 Lemma 1.4 (gap: 'Dold–Lashof criteria for disconnected fibres').

**Acceptance.** The mapping-cylinder projection example is checked by (c). Do not use (a) for disconnected fibres before the general case is supplied.

**Prerequisites.** `H.2/quasi-fibration`.

**Sources.** Hatcher-AlgebraicTopology, §4.K, Lemma 4K.3, printed p. 480 (PDF 489); Hatcher-AlgebraicTopology, §4.K, proof of Lemma 4K.3, printed p. 480 (PDF 489).

**Suggested home.** `TauCeti/AlgebraicTopology/HomotopyFiber/QuasiFibration`, namespace `TauCeti`.

#### `H.2/simplicial-space-realisation` — Realisation of simplicial spaces and bisimplicial sets

*Definition.* For a simplicial space X : SimplexCategoryᵒᵖ ⥤ TopCat, the realisation |X| is the coend ∫ⁿ X_n × Δⁿ (quotient of ⊔ X_n × Δⁿ by the face and degeneracy identifications), functorial in X. For a bisimplicial set T (a simplicial object in SSet, T_{p,q}) define |T| = |p ↦ |T_{p,•}|| (realise in q, then in p); for a levelwise discrete simplicial space this is Mathlib's SSet.toTop. Realisation is a left adjoint (to Y ↦ (n ↦ C(Δⁿ, Y))), hence preserves colimits.

**Hypotheses.** X any simplicial object in TopCat; the coend is formed in TopCat (Mathlib's colimits).

**Construction or proof outline.**

1. Define |X| as a coend (or a colimit over the category of simplices) in TopCat; its right adjoint is the singular simplicial space (Quillen §1, Lemma hypothesis).
2. For X levelwise discrete, |X| agrees with SSet.toTop of the underlying simplicial set by the coend formula defining SSet.toTop (left Kan extension of the topological simplex).
3. For a bisimplicial set, the realisation of a product of representables Δ[r] ⊠ Δ[s] is Δ^r × Δ^s (H.1/classifying-space-prod with finite factors).

**API.**

- `TauCeti.SimplicialSpace.realization` (constructor): realization : SimplicialObject TopCat ⥤ TopCat, the coend of X_n × Δⁿ.
- `TauCeti.SimplicialSpace.realizationAdj` (universal-property): realization ⊣ singular simplicial space Y ↦ (n ↦ C(Δⁿ, Y)).
- `TauCeti.SimplicialSpace.realization_discrete` (compatibility): For a simplicial set X viewed as a levelwise discrete simplicial space, realization ≅ SSet.toTop.obj X.
- `TauCeti.BisimplicialSet.realization` (constructor): For T : SimplicialObject SSet, the realisation of the simplicial space p ↦ SSet.toTop.obj (T.obj p).
- `TauCeti.BisimplicialSet.diagonal` (constructor): The diagonal simplicial set n ↦ T_{n,n} (not Mathlib's SimplicialObject.diagonal, which is the long-edge map).
- `TauCeti.SimplicialSpace.realization_preservesColimits` (other): realization preserves all colimits.

**Unit tests.**

- `realization_const` (degenerate): The realisation of the constant simplicial space at Y is homeomorphic to Y.
- `realization_box_stdSimplex` (computation): For the bisimplicial set Δ[r] ⊠ Δ[s], the realisation is homeomorphic to Δ^r × Δ^s.
- `realization_discrete_compat` (compatibility): For a simplicial set X, the realisation of the discrete simplicial space is SSet.toTop.obj X.
- `bisimplicial_diagonal_not_mathlib_diagonal` (non-example): TauCeti.BisimplicialSet.diagonal (Δ[1] ⊠ Δ[1]) is the nerve of Fin 2 × Fin 2, with four vertices; Mathlib's SimplicialObject.diagonal is instead the long-edge map X _⦋n⦌ ⟶ X _⦋1⦌ of a single simplicial object, a different construction that must not be used here.

**Uses.** H.2/bisimplicial-realization-lemma: the three realisations of a bisimplicial space are compared; H.2/levelwise-equivalence-theorem: realisations of proper simplicial spaces are homotopy invariant; GeneralAlgebraicKTheory:K.4:construction: |wS.C| is the realisation of a bisimplicial set; deloopings realise multisimplicial sets; H.5:S-delooping/k-theory-symmetric-spectrum: the levels of the K-theory spectrum are realisations of multisimplicial sets.

**Acceptance.** The realisation of the constant simplicial space at Y is Y. |Δ[r] ⊠ Δ[s]| = Δ^r × Δ^s (Weibel IV 3.10.1).

**Prerequisites.** `mathlib:SSet.toTop`, `mathlib:CategoryTheory.SimplicialObject`, `H.1/classifying-space-prod`.

**Sources.** Quillen-HigherK-I-1973, §1, Lemma preceding the proof of Theorem A, LNM p. 94 (PDF 10); Weibel-KBook-IV, Definition 3.6, p. IV.29.

**Suggested home.** `TauCeti/AlgebraicTopology/SimplicialSpace/Realization`, namespace `TauCeti`.

#### `H.2/bisimplicial-realization-lemma` — Realisation of bisimplicial spaces: diagonal and iterated realisations agree

*Lemma.* For a bisimplicial space T, realising first in q then in p, first in p then in q, and realising the diagonal simplicial space p ↦ T_{p,p} give spaces related by homeomorphisms functorial in T. In particular the realisation of a bisimplicial set is homeomorphic to the realisation of its diagonal simplicial set.

**Hypotheses.** Realisation of simplicial spaces is the left adjoint of H.2/simplicial-space-realisation, so it commutes with colimits. The representable case uses the product homeomorphism |Δ[r] × Δ[s]| ≅ Δ^r × Δ^s (finite complexes, H.1/classifying-space-prod).

**Construction or proof outline.**

1. Check the three realisations agree functorially on bisimplicial spaces of the form h^{rs} × S = Hom(−, r) × Hom(−, s) × S, using |Hom(·, r) × Hom(·, s) × S| = Δ^r × Δ^s × S.
2. Every T has a canonical presentation as the coequaliser of ⊔ h^{r′s′} × T_{rs} ⇉ ⊔ h^{rs} × T_{rs} → T.
3. All three functors commute with colimits, so the homeomorphisms extend from representables to all T (Quillen §1 Lemma).

**Acceptance.** The diagonal of the bisimplicial set T(f) in the proof of Theorem A is the nerve of S(f). The realisation of the product bicategory A ⊗ B is BA × BB (Weibel IV Example 3.10.1). Scope: this node does not supply the levelwise-equivalence theorem (H.2/levelwise-equivalence-theorem) nor the levelwise-fibration theorem (H.2/levelwise-fibration-realisation).

**Prerequisites.** `H.2/simplicial-space-realisation`, `H.1/classifying-space-prod`.

**Sources.** Quillen-HigherK-I-1973, §1, Lemma preceding the proof of Theorem A, LNM pp. 94–95 (PDF 10–11); Weibel-KBook-IV, Definition 3.6, p. IV.29.

**Suggested home.** `TauCeti/AlgebraicTopology/SimplicialSpace/Realization`, namespace `TauCeti`.

#### `H.2/proper-simplicial-space` — Proper simplicial spaces

*Definition.* A simplicial space X is proper if for every n the latching map L_n X → X_n is a Hurewicz cofibration (has the homotopy extension property), where L_n X ⊆ X_n is the union of the images of the degeneracies s_i : X_{n−1} → X_n. Levelwise discrete simplicial spaces (simplicial sets) and the simplicial spaces p ↦ |T_{p,•}| obtained from bisimplicial sets are proper; X is proper when it is good (degeneracies closed cofibrations) in Segal's sense.

**Hypotheses.** Spaces in compactly generated weak Hausdorff spaces for the realisation theorems that use properness (Nikolaus–Scholze Appendix C); the definition itself makes sense in TopCat.

**Construction or proof outline.**

1. Define the latching object as the coequaliser of the degeneracies (Nikolaus–Scholze Appendix C, before Proposition C.3).
2. For X = |T_{p,•}|, L_n X is the realisation of the simplicial subset of degenerate simplices, a subcomplex, and CW inclusions are h-cofibrations (Tau Ceti AlgebraicTopology stage 4).

**API.**

- `TauCeti.SimplicialSpace.latching` (constructor): latching X n : the union of the images of the degeneracies in X_n, with its inclusion.
- `TauCeti.SimplicialSpace.IsProper` (constructor): IsProper X :↔ ∀ n, the latching inclusion is a Hurewicz cofibration.
- `TauCeti.SimplicialSpace.isProper_discrete` (example): A levelwise discrete simplicial space is proper.
- `TauCeti.SimplicialSpace.isProper_realization_bisimplicial` (example): For a bisimplicial set T, p ↦ SSet.toTop.obj (T.obj p) is proper.

**Unit tests.**

- `isProper_const` (degenerate): A constant simplicial space at any space Y is proper: its latching maps are identities.
- `isProper_nerve_discrete_category` (computation): The nerve of a category viewed as a discrete simplicial space is proper.
- `isProper_compat_bisimplicial` (compatibility): The realisation of a bisimplicial set computed through a proper simplicial space agrees with the diagonal realisation (H.2/bisimplicial-realization-lemma).
- `not_isProper_bad_degeneracy` (non-example): The 1-skeletal simplicial space with X₀ a point and X₁ = {0} ∪ {1/k : k ≥ 1} ⊂ ℝ, the degeneracy picking 0, is not proper: {0} ⊂ X₁ is not an h-cofibration, since a deformation of a neighbourhood of 0 into {0} would have to move the points 1/k, which are path components of X₁.

**Uses.** H.2/levelwise-equivalence-theorem: the hypothesis under which levelwise weak equivalences realise to weak equivalences; H.2/bousfield-kan-homotopy-colimit: the simplicial space defining hocolim is proper, so hocolim is homotopy invariant; H.2/levelwise-fibration-realisation: goodness/properness hypothesis of the Waldhausen–Bousfield–Friedlander lemma.

**Acceptance.** The nerve of a topological category with degeneracies closed cofibrations is proper.

**Prerequisites.** `H.2/simplicial-space-realisation`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

**Sources.** NikolausScholze-TC-2018, Appendix C, paragraph before Proposition C.3, p. 161.

**Suggested home.** `TauCeti/AlgebraicTopology/SimplicialSpace/Proper`, namespace `TauCeti`.

#### `H.2/realisation-preserves-finite-limits` — Realisation of simplicial spaces preserves finite limits

*Lemma.* In compactly generated weak Hausdorff spaces, the realisation |−| of simplicial spaces commutes with finite limits; in particular |X ×_Y Z| ≅ |X| ×_{|Y|} |Z| and |X × Z| ≅ |X| × |Z|.

**Hypotheses.** All spaces compactly generated weak Hausdorff; limits formed there. In Mathlib's TopCat (not k-ified) only the product with a locally compact factor is covered.

**Construction or proof outline.**

1. Finite products: Schwede, Symmetric spectra, Proposition A.37(ii) (cited by Nikolaus–Scholze, not read here).
2. Pullbacks: the underlying-set functor of the realisation is the coend of underlying sets, which commutes with finite limits by Gabriel–Zisman III; the comparison is a continuous bijection between closed subspaces of a product (Nikolaus–Scholze Prop. C.1 proof).

**Acceptance.** For bisimplicial sets this recovers |T × T′| ≅ |T| × |T′| in compactly generated spaces.

**Prerequisites.** `H.2/simplicial-space-realisation`.

**Sources.** NikolausScholze-TC-2018, Appendix C, Proposition C.1, p. 160.

**Suggested home.** `TauCeti/AlgebraicTopology/SimplicialSpace/Realization`, namespace `TauCeti`.

#### `H.2/gluing-lemma` — The gluing lemma for pushouts along h-cofibrations

*Lemma.* Given a map of spans (B ← A → C) → (B′ ← A′ → C′) in which A → B and A′ → B′ are Hurewicz cofibrations and the three components are weak homotopy equivalences, the induced map of pushouts B ∪_A C → B′ ∪_{A′} C′ is a weak homotopy equivalence.

**Hypotheses.** A → B and A′ → B′ h-cofibrations; components weak homotopy equivalences; compactly generated weak Hausdorff spaces.

**Construction or proof outline.**

1. Boardman–Vogt, Proposition 4.8(b), cited by Nikolaus–Scholze Lemma C.2 (not read; recorded in the packet gap 'Gluing lemma proof').

**Acceptance.** The mapping cylinder M_f of a weak equivalence f is weakly equivalent to the target, applied with A = X ⊔ X.

**Prerequisites.** `H.2/weak-homotopy-equivalence`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

**Sources.** NikolausScholze-TC-2018, Appendix C, Lemma C.2 (Gluing Lemma), p. 161.

**Suggested home.** `TauCeti/AlgebraicTopology/SimplicialSpace/Proper`, namespace `TauCeti`.

#### `H.2/levelwise-equivalence-theorem` — Levelwise weak equivalences of proper simplicial spaces realise to weak equivalences — planet: *Realisation lemma*

*Theorem.* Let f : X → Y be a map of proper simplicial spaces such that every f_n : X_n → Y_n is a weak homotopy equivalence. Then |f| : |X| → |Y| is a weak homotopy equivalence. For bisimplicial sets: if each X_{p,•} → Y_{p,•} is a weak homotopy equivalence of realisations, then |X| → |Y| (equivalently |diag X| → |diag Y|) is a weak homotopy equivalence, and a homotopy equivalence since both are CW complexes.

**Hypotheses.** X, Y proper (H.2/proper-simplicial-space); for bisimplicial sets properness is automatic.

**Construction or proof outline.**

1. Filter |X| by skeleta; |Sk_n X| is the pushout of |Sk_{n−1} X| ← L_n X × |Δⁿ| ∪ X_n × |∂Δⁿ| → X_n × Δⁿ, whose top map is an h-cofibration when X is proper (pushout-product axiom) (Nikolaus–Scholze Prop. C.3 proof).
2. By induction on n and on the latching filtration, L_n X → L_n Y are weak equivalences, so |Sk_n X| → |Sk_n Y| are weak equivalences by the gluing lemma (H.2/gluing-lemma).
3. Pass to the colimit along h-cofibrations: homotopy groups commute with sequential colimits along closed cofibrations by compactness.
4. For bisimplicial sets apply the result to p ↦ |X_{p,•}| (proper by H.2/proper-simplicial-space) and use H.2/bisimplicial-realization-lemma; Whitehead (Tau Ceti AlgebraicTopology stage 8) upgrades to a homotopy equivalence (Weibel IV Theorem 3.6.1(i)).

**Acceptance.** Weibel IV Example 3.6.2: the canonical functor D\F → C is a homotopy equivalence, by projecting the bisimplicial set of pairs of strings onto NC. Without properness the conclusion can fail; do not apply to arbitrary simplicial spaces.

**Prerequisites.** `H.2/proper-simplicial-space`, `H.2/gluing-lemma`, `H.2/bisimplicial-realization-lemma`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `H.2/weak-homotopy-equivalence`.

**Sources.** NikolausScholze-TC-2018, Appendix C, Proposition C.3, p. 161; Weibel-KBook-IV, Theorem 3.6.1(i), p. IV.29.

**Suggested home.** `TauCeti/AlgebraicTopology/SimplicialSpace/Proper`, namespace `TauCeti`.

#### `H.2/levelwise-fibration-realisation` — Realisation of levelwise homotopy fibre sequences (Waldhausen, Bousfield–Friedlander) — planet: *Realisation of levelwise fibrations*

*Theorem.* Let V → W → X be maps of good (proper) simplicial spaces with compatible basepoints such that each V_n → W_n → X_n is a homotopy fibre sequence (V_n → F(W_n → X_n) a weak homotopy equivalence) and every X_n is path-connected. Then |V| → |W| → |X| is a homotopy fibre sequence, the fibre identification being the canonical map into the homotopy fibre over the realised basepoint; hence Ω|X| → |V| → |W| → |X| is one, with the canonical connecting map. For bisimplicial sets the connectivity of all X_n may be replaced by the π_*-Kan condition and the π₀ fibration condition of Bousfield–Friedlander.

**Hypotheses.** Good/proper simplicial spaces (automatic for realisations of multisimplicial sets). Each X_n path-connected (or the Bousfield–Friedlander π_*-Kan and π₀ conditions); the conclusion fails for arbitrary levelwise fibrations without it.

**Construction or proof outline.**

1. Replace the maps levelwise by fibrations (H.2/mapping-path-space-fibration) without changing realisations up to weak equivalence (H.2/levelwise-equivalence-theorem).
2. Waldhausen 1978, Lemma 5.2, or Bousfield–Friedlander 1978, Theorem B.4: compare the realisation of the levelwise homotopy fibres with the homotopy fibre of the realisation using the connectivity of X_n to make the realisation of a levelwise quasi-fibration a quasi-fibration (H.2/quasi-fibration, H.2/dold-lashof-criteria). These proofs are not read here (packet gap 'Levelwise fibration lemma proof').

**Acceptance.** Weibel V Proposition 1.7: for an exact functor f : B → C, Ω|wS.(S.B)| → |wS.C| → |wS.(S.f)| → |wS.(S.B)| is a homotopy fibration, by applying the lemma to n ↦ (|wS.C| → |wS.(S_n f)| → |wS.(S_n B)|), which are split fibrations of connected spaces (S_n f ≃ E(C, S_n f, S_n B) by Weibel IV 8.5.3; Weibel's proof of V.1.7 prints the roles of B and C exchanged, packet source issue StableHomotopyKTheory/E4). Connectivity is needed: for X = Δ[1]/∂Δ[1] viewed as a levelwise discrete simplicial space, each ∗ → ∗ → X_n is a homotopy fibre sequence (X_n is discrete), but after realisation ∗ → ∗ → S¹ is not, the homotopy fibre of ∗ → S¹ being ΩS¹ ≃ ℤ; here X_n is disconnected for n ≥ 1.

**Prerequisites.** `H.2/levelwise-equivalence-theorem`, `H.2/mapping-path-space-fibration`, `H.2/quasi-fibration`, `H.2/dold-lashof-criteria`, `H.2/homotopy-fibre-and-long-exact-sequence`.

**Sources.** Weibel-KBook-V, Proposition 1.7 and proof, p. V.8.

**Suggested home.** `TauCeti/AlgebraicTopology/SimplicialSpace/Fibration`, namespace `TauCeti`.

#### `H.2/bousfield-kan-homotopy-colimit` — Bousfield–Kan homotopy colimit of a diagram of spaces

*Definition.* For a small category I and X : I ⥤ TopCat, hocolim_I X is the realisation of the simplicial space n ↦ ⊔_{i₀ → ⋯ → i_n} X(i₀) (sum over n-simplices of NI), with d₀ using X(i₀ → i₁) and the other faces and degeneracies acting on the string. It maps to BI (collapse each X(i₀) to a point); for X constant at a point, hocolim_I X = BI; for X : I ⥤ Type (discrete spaces), hocolim_I X = B(∫_I X). Convention: Nikolaus–Scholze print X(i_n) in Definition C.4, which is the formula for contravariant X; with covariant X and strings i₀ → ⋯ → i_n the coefficient is X(i₀).

**Hypotheses.** I small; X a covariant functor to TopCat.

**Construction or proof outline.**

1. Define the simplicial space with the face maps above; it is proper because its latching object is the inclusion of a union of summands (Nikolaus–Scholze, after Definition C.4).
2. Homotopy invariance (Proposition C.5): a levelwise weak equivalence X → X′ induces a weak equivalence of hocolims, by H.2/levelwise-equivalence-theorem.

**API.**

- `TauCeti.hocolim` (constructor): hocolim I X : TopCat, the realisation of the simplicial space of strings with coefficients X(i₀).
- `TauCeti.hocolim.toNerve` (projection): The map hocolim I X → classifyingSpace I.
- `TauCeti.hocolim.map` (functoriality): A natural transformation X ⟶ X′ induces hocolim I X → hocolim I X′, with map_id and map_comp.
- `TauCeti.hocolim.isWeakHomotopyEquivalence_map` (relation): If every component of X ⟶ X′ is a weak homotopy equivalence then so is hocolim.map (Nikolaus–Scholze Prop. C.5).
- `TauCeti.hocolim.const_point` (example): hocolim I (const point) ≅ classifyingSpace I.
- `TauCeti.hocolim.toColimit` (projection): The canonical map hocolim I X → colim X.

**Unit tests.**

- `hocolim_const_point` (computation): hocolim I (const point) is homeomorphic to classifyingSpace I.
- `hocolim_terminal` (degenerate): If I has a terminal object t, hocolim I X → X t is a homotopy equivalence.
- `hocolim_discrete_grothendieck` (compatibility): For X : I ⥤ Type viewed as discrete spaces, hocolim I X ≅ classifyingSpace (Grothendieck X).
- `hocolim_ne_colim_span` (non-example): For the span point ← S⁰ → point, colim is a point but hocolim is the suspension of S⁰, i.e. S¹.

**Uses.** H.2/quasi-fibration-lemma: the map X_I = hocolim_I X → BI is the map shown to be a quasi-fibration; H.2/thomason-homotopy-colimit-theorem: B(∫_I F) ≃ hocolim_I BF; RefinedTraceMethods:RT.2: the spectrum-level homotopy colimits of Nikolaus–Scholze build on the space-level construction (spectrum version owned by RT.2).

**Acceptance.** hocolim of the constant point diagram is BI. For I the walking span, hocolim is the double mapping cylinder.

**Prerequisites.** `H.2/simplicial-space-realisation`, `H.2/proper-simplicial-space`, `H.2/levelwise-equivalence-theorem`.

**Sources.** NikolausScholze-TC-2018, Appendix C, Definition C.4 and Proposition C.5, p. 162; Quillen-HigherK-I-1973, §1, lemma preceding 'Proof of Theorem B', LNM p. 97 (PDF 13).

**Suggested home.** `TauCeti/AlgebraicTopology/HomotopyColimit/BousfieldKan`, namespace `TauCeti`.

#### `H.2/realisation-is-homotopy-colimit` — Realisation of a proper simplicial space is its homotopy colimit

*Theorem.* Let X be a proper simplicial space (H.2/proper-simplicial-space) in compactly generated weak Hausdorff spaces. Then the natural comparison map hocolim_{Δ^op} X → |X| from the Bousfield–Kan homotopy colimit (H.2/bousfield-kan-homotopy-colimit), induced by the last-vertex maps B(Δ↓[n]) → Δⁿ, is a weak homotopy equivalence. Equivalently (Nikolaus–Scholze Lemma B.7): after Dwyer–Kan localisation at the levelwise weak homotopy equivalences, geometric realisation restricted to proper simplicial spaces is naturally equivalent to the ∞-categorical colimit Fun(N(Δ^op), S) → S.

**Hypotheses.** X proper; all spaces compactly generated weak Hausdorff (so h-cofibrations are closed, Nikolaus–Scholze footnote 44). Without properness the statement holds for the fat realisation over Δ_inj instead (Nikolaus–Scholze Remark B.8); it is not claimed for |−|.

**Construction or proof outline.**

1. Realisation preserves levelwise weak equivalences between proper simplicial spaces (H.2/levelwise-equivalence-theorem), and so does hocolim_{Δ^op} (Nikolaus–Scholze Proposition C.5, H.2/bousfield-kan-homotopy-colimit); hence both sides of the comparison are invariant under replacing X by a levelwise weakly equivalent proper simplicial space.
2. In the Reedy model structure on Fun(Δ^op, Top) (weak equivalences levelwise) every cofibrant object is proper, and |−| is left Quillen with right adjoint Y ↦ Y^{|Δ^•|}, which is weakly equivalent to the constant-diagram functor; so the left derived functor of |−| is left adjoint to the constant diagram, i.e. it is the homotopy colimit (Nikolaus–Scholze Lemma B.7 proof, citing Reedy 1974 and Hirschhorn Chapter 15; packet gap 'Reedy model structure on simplicial spaces').
3. By the first step the derived functor is computed on proper X without cofibrant replacement, which gives the comparison for every proper X.

**Uses.** RefinedTraceMethods:RT.2: the realisation of proper paracyclic spaces is deduced from Lemma B.7 (Nikolaus–Scholze Appendix B after Construction B.9); the paracyclic and spectrum-level versions are owned by RT.2; H.2/quasi-fibration-lemma: realisations of diagrams of simplicial spaces may be read as homotopy colimits.

**Acceptance.** For a simplicial set K viewed as a levelwise discrete simplicial space (proper by H.2/proper-simplicial-space), hocolim_{Δ^op} K = B(Δ↓K)^op ≃ |K| (H.2/bousfield-kan-homotopy-colimit, discrete case): the simplex category of K has the homotopy type of K. For the constant simplicial space at Y (proper: its latching inclusions are identities), |X| = Y and hocolim_{Δ^op} X = Y × B(Δ^op) ≃ Y, since Δ has the terminal object [0] and so BΔ is contractible (H.1/contractible-of-initial-or-terminal).

**Prerequisites.** `H.2/proper-simplicial-space`, `H.2/levelwise-equivalence-theorem`, `H.2/bousfield-kan-homotopy-colimit`, `H.2/weak-homotopy-equivalence`.

**Sources.** NikolausScholze-TC-2018, Appendix B, Lemma B.7 with proof and footnote 44, p. 149 (arXiv pagination; p. 386 in Acta Math.).

**Suggested home.** `TauCeti/AlgebraicTopology/HomotopyColimit/BousfieldKan`, namespace `TauCeti`.

#### `H.2/quasi-fibration-lemma` — Quillen's quasi-fibration lemma for diagrams of spaces over a nerve

*Lemma.* Let I be a small category and i ↦ X_i a functor to topological spaces, and let g : X_I → BI be the realisation of the map from p ↦ ⊔_{i₀→⋯→i_p} X_{i₀} to the nerve of I (that is, hocolim_I X → BI). If every induced map X_i → X_{i′} is a homotopy equivalence then g is a quasi-fibration: for every b ∈ BI the map g⁻¹(b) → F(g, b) is a weak homotopy equivalence. When the spaces involved have CW homotopy type the square g⁻¹(b) → X_I over {b} → BI is homotopy-cartesian.

**Hypotheses.** Every transition map X_i → X_{i′} (for arrows i → i′ of I) is a homotopy equivalence. The proof uses the Dold–Lashof criteria including disconnected fibres (H.2/dold-lashof-criteria).

**Construction or proof outline.**

1. By the Dold–Lashof criterion (b) it suffices to show g restricted to each skeleton F_p of BI is a quasi-fibration.
2. Let U be F_p minus the barycentres of the p-cells and V = F_p − F_{p−1}; by criterion (a) it suffices to treat U, V and U ∩ V; over each open p-cell g is a product, which handles V and U ∩ V.
3. For U apply criterion (c) using induction on p and the radial fibre-preserving deformation of Δ^p minus its barycentre onto ∂Δ^p.
4. If the deformation moves x in the cell of i₀ → ⋯ → i_p to the face with vertices j₀ < ⋯ < j_q, then g⁻¹(x) = X_{i₀}, g⁻¹(x′) = X_{k₀} with k₀ = i_{j₀}, and the induced map is the transition map of i₀ → k₀, a homotopy equivalence by hypothesis (Quillen §1 Lemma proof).

**Acceptance.** Applied to Y ↦ B(Y\f) under the hypothesis of Theorem B, yields that BS(f) → BC′^op is a quasi-fibration. Applied to the map realising q ↦ (⊔ B(C′/fX₀)^op → NC_q), whose fibres have final objects and so are contractible, it promotes these levelwise homotopy equivalences to the homotopy equivalence Bp₁ in the proof of Theorem A (Quillen's alternative to Tornehave A.3).

**Prerequisites.** `H.2/bousfield-kan-homotopy-colimit`, `H.2/quasi-fibration`, `H.2/dold-lashof-criteria`.

**Sources.** Quillen-HigherK-I-1973, §1, lemma and proof preceding 'Proof of Theorem B', LNM pp. 97–98 (PDF 13–14); Weibel-KBook-IV, Theorem 3.6.1(ii), p. IV.29.

**Suggested home.** `TauCeti/AlgebraicTopology/HomotopyFiber/QuasiFibration`, namespace `TauCeti`.

#### `H.2/thomason-homotopy-colimit-theorem` — Thomason's theorem: the Grothendieck construction models the homotopy colimit

*Theorem.* For a small category D and a functor F : D ⥤ Cat, there is a canonical weak homotopy equivalence hocolim_D (B ∘ F) → B(∫_D F), natural in F; equivalently the diagonal of the bisimplicial set δN(D, F) with (n, m)-simplices pairs (d₀ → ⋯ → d_n, a string of length m in F(d₀)) maps by a weak equivalence to the nerve of the Grothendieck construction. For a functor T : C ⥤ D and F_T(d) = T/d, the projection ∫_D F_T → C has a left adjoint, so BC ≃ B(∫_D F_T) ≃ hocolim_d B(T/d).

**Hypotheses.** D small; F takes values in small categories; the Grothendieck construction is Mathlib's CategoryTheory.Grothendieck.

**Construction or proof outline.**

1. Thomason 1979, Theorem 1.2 (cited by Kahn, Theorem 1.4.3; proof not read here, recorded in the packet gap 'Thomason homotopy colimit theorem proof'): the comparison map sends a pair of strings to the composite string in ∫_D F.
2. For T : C ⥤ D, ∫_D (T/−) is the comma category T/D; the source functor s : C → T/D, c ↦ (c, id) is left adjoint to the projection p₁ (Kahn Lemma 1.4.5), hence a homotopy equivalence (H.1/adjunction-homotopy-equivalence).

**Acceptance.** For F constant at a category E, B(D × E) ≃ BD × BE. For F : D ⥤ Type (discrete categories) it reduces to hocolim_D F = B(∫_D F) of H.2/bousfield-kan-homotopy-colimit.

**Prerequisites.** `H.2/bousfield-kan-homotopy-colimit`, `mathlib:CategoryTheory.Grothendieck`, `H.1/adjunction-homotopy-equivalence`.

**Sources.** Kahn-RankSpectralSequence-2011, Theorem 1.4.3 and Lemma 1.4.5, p. 6–7.

**Suggested home.** `TauCeti/AlgebraicTopology/HomotopyColimit/Thomason`, namespace `CategoryTheory`.

#### `H.2/functor-homology-spectral-sequence` — The homology spectral sequence of a functor

*Theorem.* For a functor T : C ⥤ D between small categories and an abelian group A there is a first-quadrant spectral sequence E²_{p,q} = H_p(D; d ↦ H_q(T/d; A)) ⇒ H_{p+q}(C; A), natural in T, with H_p(D; −) the homology of D with coefficients in a functor (H.1/category-homology). If T is cofibred, the coefficient functor may be replaced by d ↦ H_q(T⁻¹(d); A), recovering Weibel IV Exercise 3.7.

**Hypotheses.** C, D small; A an abelian group (or a module over a ring).

**Construction or proof outline.**

1. Form the double complex with (p, q)-term the free abelian group (tensor A) on pairs (d_p → ⋯ → d₀ → T(c₀), c₀ → ⋯ → c_q); filtering by columns gives H_*(C; A) because each T/... comma category has a terminal object (Weibel IV Exercise 3.7).
2. Filtering by rows gives E² as stated, using H.2/thomason-homotopy-colimit-theorem for the identification with the homotopy colimit (Kahn Corollary 1.4.6).
3. Construct the spectral sequence from the double complex with Mathlib's spectral objects (CategoryTheory.Abelian.SpectralObject and its E₂ homological spectral sequence), first-quadrant convergence being automatic.

**Acceptance.** For T = id the E² page is concentrated in q = 0 and the spectral sequence collapses. For the projection ρ : S⁻¹X → ⟨S, S⟩ (cofibred with fibre X) it gives the spectral sequence of Weibel IV Theorem 4.8.

**Prerequisites.** `H.1/category-homology`, `H.2/thomason-homotopy-colimit-theorem`, `mathlib:CategoryTheory.Abelian.SpectralObject`.

**Sources.** Weibel-KBook-IV, Exercise 3.7, p. IV.34; Kahn-RankSpectralSequence-2011, Corollary 1.4.6, p. 7.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Homology`, namespace `CategoryTheory`.

#### `H.2/quillen-theorem-a` — Quillen's Theorem A — planet: *Quillen's Theorem A*

*Theorem.* Let f : C ⥤ C′ be a functor between small categories. If the comma category Y\f of pairs (X, v : Y → fX) is contractible for every object Y of C′, then Bf is a homotopy equivalence. Dually, it suffices that every f/Y be contractible.

**Hypotheses.** C, C′ small.

**Construction or proof outline.**

1. Form S(f), the category of triples (X, Y, v : Y → fX), with functors p₁ : S(f) → C and p₂ : S(f) → C′^op.
2. Let T(f) be the bisimplicial set of pairs (Y_p → ⋯ → Y₀ → fX₀, X₀ → ⋯ → X_q); its diagonal is NS(f) (H.2/bisimplicial-realization-lemma), and forgetting the first component realises to Bp₁.
3. Realising in p gives, in each q, ⊔_{X₀→⋯→X_q} B(C′/fX₀)^op → NC_q, a homotopy equivalence since C′/fX₀ has a final object; by H.2/levelwise-equivalence-theorem (or the quasi-fibration lemma) Bp₁ is a homotopy equivalence.
4. Realising T(f) → N(C′^op) in q gives fibres B(Y₀\f), contractible by hypothesis, so p₂ is a homotopy equivalence.
5. Compare with f = id_{C′} through S(f) → S(id_{C′}), (X, Y, v) ↦ (fX, Y, v), compatible with p₁ and p₂; since Y\id_{C′} has an initial object the same argument applies, and two-out-of-three gives Bf a homotopy equivalence.
6. The dual statement follows by applying the theorem to f^op and H.1/classifying-space-op-homeomorph.

**Acceptance.** A simplicial map of simplicial complexes whose inverse image of every closed simplex is contractible is a homotopy equivalence (Quillen's example). The inclusion of monoids ℕ → ℤ gives Bℕ ≃ Bℤ ≃ S¹ (Weibel IV Example 3.7.2). Source and target functors from the Segal subdivision are homotopy equivalences (Weibel IV Exercise 3.9).

**Prerequisites.** `H.2/bisimplicial-realization-lemma`, `H.2/levelwise-equivalence-theorem`, `H.2/quasi-fibration-lemma`, `H.1/contractible-of-initial-or-terminal`, `H.1/classifying-space-op-homeomorph`, `mathlib:CategoryTheory.StructuredArrow`.

**Sources.** Quillen-HigherK-I-1973, §1, Theorem A, LNM p. 93 (PDF 9); proof LNM pp. 95–96 (PDF 11–12); Weibel-KBook-IV, 3.7 Quillen's Theorem A with proof, p. IV.30.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/QuillenAB`, namespace `CategoryTheory`.

#### `H.2/prefibred-iff-fibre-adjoint` — Quillen's prefibred functors are SGA 1 prefibered functors

*Lemma.* For a functor f : C ⥤ C′, the inclusion of the fibre f⁻¹(Y) into the comma category Y\f has a right adjoint for every Y (Quillen's and Weibel's 'prefibred') iff f is prefibered in the sense of SGA 1 VI.6.1 (Mathlib's CategoryTheory.Functor.IsPreFibered: every u : Y → f(X) has a cartesian lift). In that case B(f⁻¹(Y)) ≃ B(Y\f), and base change u* : f⁻¹(Y′) → f⁻¹(Y) is defined up to natural isomorphism as f⁻¹(Y′) → Y\f → f⁻¹(Y). Dually for precofibred and F/Y.

**Hypotheses.** f a functor between small categories.

**Construction or proof outline.**

1. A right adjoint to f⁻¹(Y) → Y\f assigns to (X, u : Y → fX) an object u*X of f⁻¹(Y) with a map u*X → X over u, terminal among maps from objects of the fibre over u: this is a cartesian lift of u in the sense of SGA 1 (and Mathlib's IsCartesian).
2. An adjoint gives a homotopy equivalence (H.1/adjunction-homotopy-equivalence; Weibel IV 3.7.3).

**Acceptance.** The projection ∫_C F → C of a Grothendieck construction of F : C^op ⥤ Cat is prefibred, with base change F(u).

**Prerequisites.** `mathlib:CategoryTheory.Functor.IsPreFibered`, `mathlib:CategoryTheory.StructuredArrow`, `H.1/adjunction-homotopy-equivalence`.

**Sources.** Weibel-KBook-IV, Fibered and Cofibered functors 3.7.3, p. IV.31.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/QuillenAB`, namespace `CategoryTheory`.

#### `H.2/quillen-theorem-a-prefibred` — Theorem A for prefibred and precofibred functors

*Theorem.* If f : C ⥤ C′ is prefibred or precofibred and every fibre f⁻¹(Y) is contractible, then Bf is a homotopy equivalence.

**Hypotheses.** f prefibred (H.2/prefibred-iff-fibre-adjoint) or precofibred; fibres contractible.

**Construction or proof outline.**

1. The adjoint gives B(f⁻¹(Y)) ≃ B(Y\f) (respectively B(f/Y)), so the comma categories are contractible; apply H.2/quillen-theorem-a or its dual (Quillen §1 Corollary to Theorem A; Weibel IV Corollary 3.7.4).

**Acceptance.** The projection of a Grothendieck construction with contractible fibres is a homotopy equivalence.

**Prerequisites.** `H.2/quillen-theorem-a`, `H.2/prefibred-iff-fibre-adjoint`.

**Sources.** Weibel-KBook-IV, Corollary 3.7.4, p. IV.31.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/QuillenAB`, namespace `CategoryTheory`.

#### `H.2/quillen-theorem-b` — Quillen's Theorem B — planet: *Quillen's Theorem B*

*Theorem.* Let f : C ⥤ C′ be a functor such that for every arrow u : Y → Y′ of C′ the induced functor u* : Y′\f → Y\f is a homotopy equivalence. Then for every object Y of C′ the square with Y\f → C over Y\C′ → C′ is homotopy-cartesian, so the canonical map B(Y\f) → F(Bf, [Y]) of H.2/comma-category-to-homotopy-fibre is a weak homotopy equivalence, and for X ∈ f⁻¹(Y) there is an exact sequence ⋯ → π_{i+1}(BC′, [Y]) → π_i(B(Y\f), (X, id_Y)) → π_i(BC, [X]) → π_i(BC′, [Y]) → ⋯ ending in pointed sets. Dually with f/Y.

**Hypotheses.** Every transition functor Y′\f → Y\f is a homotopy equivalence; contractibility of comma categories alone (Theorem A) does not produce a fibration sequence. Weak homotopy equivalence in the homotopy-cartesian definition (H.2/homotopy-pullback); spaces involved are CW complexes, so these are homotopy equivalences.

**Construction or proof outline.**

1. As in Theorem A, p₁ : S(f) → C is a homotopy equivalence.
2. Bp₂ : BS(f) → BC′^op is the realisation of T(f) → N(C′^op); apply the quasi-fibration lemma to Y ↦ B(Y\f), whose transition maps are homotopy equivalences by hypothesis, so Bp₂ is a quasi-fibration and the square Y\f → S(f) over pt → C′^op is homotopy-cartesian.
3. Form the diagram with squares (1) Y\f → S(f) over Y\C′ → S(id_{C′}), (2) S(f) → C over S(id_{C′}) → C′, and (3) Y\C′ → S(id_{C′}) over pt → C′^op; the horizontal comparison maps marked are homotopy equivalences.
4. (1)+(3) is homotopy-cartesian by the previous step and (3) is homotopy-cartesian, so (1) is (H.2/homotopy-cartesian-pasting); composing with (2), whose horizontal maps are homotopy equivalences, gives the theorem (Quillen, proof of Theorem B).
5. The exact sequence is H.2/long-exact-sequence for Bf with the fibre identified.

**Acceptance.** The target functor t : EA → QA is fibred, but Theorem B does not apply to it unless A ≅ 0 (Weibel IV Exercise 7.4); S⁻¹EA → QA does satisfy it for split exact A (Weibel IV Theorem 7.8). The long exact sequence keeps the basepoint (X, id_Y) and the pointed-set end terms. Additivity and localisation consumers must verify the transition hypothesis for their specific functors.

**Prerequisites.** `H.2/quillen-theorem-a`, `H.2/quasi-fibration-lemma`, `H.2/homotopy-pullback`, `H.2/homotopy-cartesian-pasting`, `H.2/comma-category-to-homotopy-fibre`, `H.2/long-exact-sequence`.

**Sources.** Quillen-HigherK-I-1973, §1, Theorem B and Corollary, LNM p. 97 (PDF 13); proof LNM pp. 98–99 (PDF 14–15); Weibel-KBook-IV, 3.8 Quillen's Theorem B with proof, p. IV.31.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/QuillenAB`, namespace `CategoryTheory`.

#### `H.2/quillen-theorem-b-prefibred` — Theorem B for prefibred functors

*Theorem.* If f is prefibred and every base change u* : f⁻¹(Y′) → f⁻¹(Y) is a homotopy equivalence (or f precofibred with every cobase change a homotopy equivalence), then for every Y the sequence f⁻¹(Y) → C → C′ realises to a homotopy fibre sequence, with the long exact sequence ⋯ → π_{i+1}(BC′) → π_i(B f⁻¹(Y)) → π_i(BC) → π_i(BC′) → ⋯.

**Hypotheses.** f prefibred with base changes homotopy equivalences, or precofibred with cobase changes homotopy equivalences.

**Construction or proof outline.**

1. The adjoint identifications B(f⁻¹(Y)) ≃ B(Y\f) (H.2/prefibred-iff-fibre-adjoint) are compatible with u* and the base changes, so the transition functors of comma categories are homotopy equivalences; apply H.2/quillen-theorem-b (Weibel IV Corollary 3.8.1, Exercise 3.6).

**Acceptance.** For a surjective group homomorphism G → Q with kernel N the cobase changes are conjugations, giving BN → BG → BQ (H.2/group-extension-fibration).

**Prerequisites.** `H.2/quillen-theorem-b`, `H.2/prefibred-iff-fibre-adjoint`.

**Sources.** Weibel-KBook-IV, Corollary 3.8.1, p. IV.32.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/QuillenAB`, namespace `CategoryTheory`.

#### `H.2/group-extension-fibration` — Classifying spaces of a group extension form a fibre sequence

*Lemma.* For a short exact sequence of groups 1 → N → G → Q → 1, the sequence BN → BG → BQ is a homotopy fibre sequence; in particular π₁ gives back 1 → N → G → Q → 1 and π_n vanish for n ≥ 2. For a central extension 1 → A → S → P → 1 this is the input to the plus-construction fibration BA → BS⁺ → BP⁺ (H.3/plus-uce-fibration).

**Hypotheses.** N normal in G with quotient Q.

**Construction or proof outline.**

1. The functor SingleObj G ⥤ SingleObj Q is precofibred with fibre SingleObj N: an object of f/∗ is an element q ∈ Q, and the inclusion of the fibre has a left adjoint choosing lifts; cobase change along q ∈ Q is conjugation by a lift of q, an isomorphism of SingleObj N up to natural isomorphism.
2. Apply H.2/quillen-theorem-b-prefibred (Weibel IV Exercise 3.6(c)).

**Acceptance.** For G = N × Q the fibre sequence splits. For ℤ → ℤ → ℤ/n (multiplication by n): Bℤ ≃ S¹ → S¹ → B(ℤ/n).

**Prerequisites.** `H.2/quillen-theorem-b-prefibred`, `H.1/classifying-space-of-group`.

**Sources.** Weibel-KBook-IV, Exercise 3.6(c), p. IV.34.

**Suggested home.** `TauCeti/AlgebraicTopology/ClassifyingSpace/Group`, namespace `Group`.

**Coverage.** Status `planned`. Remaining refinements: Dold–Lashof general criteria, Boardman–Vogt gluing, Waldhausen/Bousfield–Friedlander levelwise fibration lemma and Thomason's theorem are quoted (gaps); Kahn's cellular-functor results (2.3.6–2.3.7, requested by ArithmeticKTheory:N.3:finite-generation) are not planned here: they are specific to the rank filtration and stay with that consumer.

## H.3 — The plus construction

RS-33 keeps the cell-attachment plus construction for connected CW-type spaces and perfect normal subgroups, the quotient π₁, all pulled-back local-coefficient homology isomorphisms, acyclicity, the qualified universal property and uniqueness, functoriality with subgroup data, and the relative and fibre comparisons, together with the generic plus and central-extension consequences. The red-team finding RT-AREA-ktheory-1/5 makes this layer the owner of the H-space and obstruction-theory inputs: triviality of the π₁-action on H-spaces, Hatcher's Proposition 4.74 with its Postnikov and obstruction-theory input, the H-space recognition statements of Weibel IV.1.3, 1.5, 1.8, and rational Hurewicz for H-spaces. The universal-central-extension recognition theorem is imported from K2SymbolsBrauer (RT-AREA-ktheory-1/30).

**Objects.** Acyclic spaces and maps; plus constructions as acyclic maps with prescribed kernel, the perfect radical, and the cell-attachment model; abelian spaces; Eilenberg–Mac Lane spaces K(A, n).

**Theorems.** An acyclic space has perfect π₁ with H₂ = 0; acyclic maps are surjective on π₁ with perfect kernel and are exactly the local-coefficient homology isomorphisms; the cell-attachment construction has π₁ = π₁X/P, is an integral homology isomorphism and is acyclic; cohomology is represented by K(A, n); abelian CW complexes have principal Postnikov towers; obstructions to lifting through principal fibrations; extension into abelian spaces; the homology Whitehead theorem for abelian spaces and for H-spaces; the universal property (proved for abelian targets, which covers every H-space target in the atlas), uniqueness and functoriality up to homotopy; recognition of plus constructions into H-spaces; π₁ of the fibre is the universal central extension and π₂(BG⁺) = H₂(P); BP⁺ is the universal cover of BG⁺; the fibration BA → BS⁺ → BP⁺; plus constructions of fibre sequences; Serre class theory and Cartan–Serre for H-spaces.

**Tests.** Plus with the trivial subgroup is a weak equivalence; for a perfect group G, BG⁺ is simply connected with the integral homology of BG and π₂(BG⁺) ≅ H₂(G; ℤ) by Hurewicz.

### Declarations of H.3

#### `H.3/acyclic-spaces-and-maps` — Acyclic spaces

*Definition.* A topological space F is acyclic if its reduced integral singular homology vanishes: H̃_n(F; ℤ) = 0 for all n (equivalently F is nonempty, path-connected and H_n(F; ℤ) = 0 for n ≥ 1). Group homology with nontrivial local coefficients, not trivial-coefficient cohomology, is what acyclic maps test (H.3/acyclic-map-homology-criterion).

**Hypotheses.** F any topological space; singular homology as in Mathlib (AlgebraicTopology.singularHomologyFunctor).

**Construction or proof outline.**

1. Define IsAcyclicSpace F by vanishing of reduced integral singular homology (Weibel IV Definition 1.3).
2. Path-connectedness follows from H₀(F; ℤ) = ℤ (Mathlib's singularHomology₀ computation).

**API.**

- `TauCeti.IsAcyclicSpace` (constructor): IsAcyclicSpace F :↔ ∀ n, IsZero (reduced singular homology of F with ℤ coefficients in degree n).
- `TauCeti.IsAcyclicSpace.pathConnected` (projection): An acyclic space is path-connected and nonempty.
- `TauCeti.IsAcyclicSpace.of_contractible` (compatibility): A ContractibleSpace is acyclic.
- `TauCeti.IsAcyclicSpace.of_homotopyEquiv` (relation): Acyclicity is invariant under homotopy equivalence (indeed under weak homotopy equivalence).
- `TauCeti.IsAcyclicSpace.perfect_fundamentalGroup` (projection): For acyclic F, Group.IsPerfect (FundamentalGroup F x) and H₂ of it vanishes (H.3/acyclic-space-perfect-fundamental-group).

**Unit tests.**

- `isAcyclicSpace_point` (degenerate): A one-point space is acyclic.
- `not_isAcyclicSpace_empty` (non-example): The empty space is not acyclic (H₀ = 0 ≠ ℤ in reduced homology convention: reduced H₋₁ ≠ 0).
- `not_isAcyclicSpace_circle` (non-example): The circle is not acyclic: H₁(S¹; ℤ) = ℤ.
- `isAcyclicSpace_poincare_sphere_minus_point` (computation): The Poincaré homology 3-sphere minus a point is acyclic but has nontrivial perfect π₁ ≅ the binary icosahedral group SL₂(F₅).
- `isAcyclicSpace_contractible_compat` (compatibility): IsAcyclicSpace F holds whenever ContractibleSpace F (Mathlib).

**Uses.** H.3/acyclic-map: acyclic maps are maps with acyclic homotopy fibre; Weibel IV Exercise 1.2: the plus construction of an acyclic space is contractible; K3BlochGroups:V.1/bst-plus-two-connected: acyclicity of fibres of plus constructions in the Steinberg comparison.

**Acceptance.** A contractible space is acyclic. The Volodin space X(R) ⊂ BGL(R) is acyclic with π₁ image E(R) (Weibel IV Example 1.3.2, cited from Suslin). BG for a perfect group with H₂(G) = 0 is not acyclic in general (it has H₃).

**Prerequisites.** `mathlib:AlgebraicTopology.singularHomologyFunctor`.

**Sources.** Weibel-KBook-IV, Definition 1.3, p. IV.4.

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/acyclic-space-perfect-fundamental-group` — An acyclic space has perfect fundamental group with vanishing H₂

*Lemma.* If F is acyclic then F is path-connected, G = π₁(F) is perfect, and H₂(G; ℤ) = 0.

**Hypotheses.** F acyclic and of CW homotopy type (so that F → BG classifying the universal cover exists).

**Construction or proof outline.**

1. H₀(F) = ℤ gives connectedness; G/[G, G] = H₁(F; ℤ) = 0 (Hurewicz in degree 1, Tau Ceti AlgebraicTopology stage 8) gives perfectness.
2. The homotopy fibre of the classifying map F → BG is the universal cover F̃ (H.2/long-exact-sequence and H.1/classifying-space-of-group-is-KG1), with H₁(F̃; ℤ) = 0.
3. The Serre spectral sequence E²_{pq} = H_p(G; H_q(F̃; ℤ)) ⇒ H_{p+q}(F; ℤ) (Tau Ceti AlgebraicTopology stage 5, monodromy local system over the base BG) gives the exact sequence H₂(F) → H₂(G) → H₁(F̃)_G, so H₂(G; ℤ) = 0 (Weibel IV Lemma 1.3.1).

**Acceptance.** For the Poincaré sphere minus a point, π₁ is the binary icosahedral group, perfect with H₂ = 0.

**Prerequisites.** `H.3/acyclic-spaces-and-maps`, `H.1/classifying-space-of-group-is-KG1`, `H.2/long-exact-sequence`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `mathlib:Group.IsPerfect`.

**Sources.** Weibel-KBook-IV, Lemma 1.3.1 with proof, p. IV.4.

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/acyclic-map` — Acyclic maps

*Definition.* A map f : X → Y of based path-connected spaces of CW homotopy type is acyclic if its homotopy fibre F(f, y₀) is acyclic. Then π₁(X) → π₁(Y) is surjective and its kernel is a perfect normal subgroup (H.3/acyclic-map-fundamental-group).

**Hypotheses.** X, Y based path-connected of CW homotopy type; homotopy fibre over the basepoint (any basepoint gives a homotopy-equivalent fibre, H.2/homotopy-fibre-transport).

**Construction or proof outline.**

1. Define IsAcyclicMap f := IsAcyclicSpace (homotopyFiber f y₀) (Weibel IV Definition 1.4).
2. Independence of the basepoint: transport of homotopy fibres along paths (H.2/homotopy-fibre-transport).

**API.**

- `TauCeti.IsAcyclicMap` (constructor): IsAcyclicMap f :↔ IsAcyclicSpace (homotopyFiber f y₀).
- `TauCeti.IsAcyclicMap.surjective_pi1` (projection): For acyclic f, FundamentalGroup.map f is surjective.
- `TauCeti.IsAcyclicMap.ker_isPerfect` (projection): The kernel of the map on π₁ is a perfect normal subgroup.
- `TauCeti.IsAcyclicMap.comp` (relation): Composites of acyclic maps are acyclic; if g ∘ f and f are acyclic, so is g.
- `TauCeti.IsAcyclicMap.iff_homology` (characterisation): IsAcyclicMap f ↔ f induces isomorphisms on homology with every local coefficient system pulled back from π₁(Y) (H.3/acyclic-map-homology-criterion).

**Unit tests.**

- `isAcyclicMap_id` (degenerate): The identity map is acyclic.
- `isAcyclicMap_toPoint_iff` (characterisation): X → point is acyclic iff X is acyclic.
- `isAcyclicMap_homotopyEquiv` (compatibility): The forward map of a homotopy equivalence is acyclic.
- `not_isAcyclicMap_point_into_acyclic` (non-example): The inclusion of a point into an acyclic space F with π₁(F) ≠ 1 (the Poincaré sphere minus a point) is an integral homology isomorphism but not acyclic: it is not surjective on π₁, and its homotopy fibre is the loop space of F, which is not acyclic.

**Uses.** H.3/plus-construction-predicate: a plus construction is an acyclic map with prescribed kernel on π₁; H.3/acyclic-map-homology-criterion: acyclic maps are exactly the local-coefficient homology isomorphisms; H.4/gl-telescope-plus-comparison: the map from B Aut(S) to the basepoint component of the group completion is acyclic.

**Acceptance.** X → point is acyclic iff X is acyclic (Weibel IV Example 1.4.2). A homotopy equivalence is acyclic.

**Prerequisites.** `H.3/acyclic-spaces-and-maps`, `H.2/homotopy-fibre-and-long-exact-sequence`, `H.2/homotopy-fibre-transport`.

**Sources.** Weibel-KBook-IV, Definition 1.4, p. IV.4.

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/acyclic-map-fundamental-group` — Acyclic maps are surjective on π₁ with perfect kernel

*Lemma.* If f : X → Y is acyclic then π₁(X) → π₁(Y) is surjective and its kernel P is a perfect normal subgroup of π₁(X), namely the image of the perfect group π₁(F(f)).

**Hypotheses.** f acyclic.

**Construction or proof outline.**

1. The homotopy fibre is path-connected and π₁F(f) is perfect (H.3/acyclic-space-perfect-fundamental-group).
2. Exactness of π₁F(f) → π₁X → π₁Y → π₀F(f) = * (H.2/long-exact-sequence) gives surjectivity, and the kernel is the image of a perfect group, hence perfect (Weibel IV Definition 1.4 and the following remark).

**Acceptance.** For BGL(R) → BGL(R)⁺ the kernel is E(R).

**Prerequisites.** `H.3/acyclic-map`, `H.3/acyclic-space-perfect-fundamental-group`, `H.2/long-exact-sequence`.

**Sources.** Weibel-KBook-IV, Definition 1.4, p. IV.4.

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/acyclic-map-homology-criterion` — Acyclic maps are local-coefficient homology isomorphisms — planet: *Acyclic map criterion*

*Theorem.* A map f : X → Y of connected CW complexes is acyclic if and only if H_*(X; M) → H_*(Y; M) is an isomorphism for every π₁(Y)-module M (pulled back to X).

**Hypotheses.** X, Y connected CW complexes; M ranges over all π₁(Y)-modules, including ℤ[π₁Y]. Uses the Serre spectral sequence with local coefficients in the base (Tau Ceti AlgebraicTopology stage 5 constructs it with the monodromy system H_q(F; R) for a constant ring R); the twisted-coefficient form needed here is derived through the universal cover in both directions, recorded as the packet gap 'Serre spectral sequence with twisted total-space coefficients'.

**Construction or proof outline.**

1. If f is acyclic, π₁F(f) → π₁Y is trivial, so π₁F(f) acts trivially on M and H_q(F(f); M) = 0 for q ≠ 0 by universal coefficients; the Serre spectral sequence H_p(Y; H_q(F(f); M)) ⇒ H_{p+q}(X; M) collapses.
2. Conversely, if π₁Y = 0 and f is an integral homology isomorphism, comparing the Serre spectral sequences of F(f) → X → Y and ∗ → Y → Y gives H̃_*(F(f); ℤ) = 0.
3. In general pass to the universal cover Ỹ and X̃ = X ×_Y Ỹ: H_*(Ỹ; ℤ) ≅ H_*(Y; ℤ[π₁Y]) and H_*(X̃; ℤ) ≅ H_*(X; ℤ[π₁Y]), so X̃ → Ỹ is an integral homology isomorphism with simply connected target, and F(f̃) ≅ F(f) by path lifting (Weibel IV Lemma 1.6 proof). The same universal-cover argument proves the forward direction for arbitrary M by writing chains with local coefficients M as C_*(X̃) ⊗_{ℤ[π₁Y]} M.

**Acceptance.** An integral homology isomorphism with non-perfect kernel on π₁ is not acyclic; test with a map inducing an isomorphism on integral homology only. The comparison must be proved for ℤ[π₁Y] coefficients, not only for trivial modules.

**Prerequisites.** `H.3/acyclic-map`, `H.2/homotopy-fibre-and-long-exact-sequence`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`, `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`.

**Sources.** Weibel-KBook-IV, Lemma 1.6 with proof, p. IV.5.

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/plus-construction-predicate` — Plus constructions as acyclic maps

*Definition.* For a based connected CW complex X and a perfect normal subgroup P ⊆ π₁(X), a map f : X → Y is a plus construction relative to P if f is acyclic and P is the kernel of π₁(X) → π₁(Y). The notation X⁺ means the plus construction relative to the perfect radical (largest perfect subgroup) of π₁(X).

**Hypotheses.** X based connected CW complex; P perfect and normal in π₁(X).

**Construction or proof outline.**

1. Define IsPlusConstruction f P := IsAcyclicMap f ∧ ker (π₁ f) = P (Weibel IV Definition 1.4.1).
2. The perfect radical exists: the subgroup generated by all perfect subgroups is perfect and normal (Weibel IV Exercise 1.5).

**API.**

- `TauCeti.IsPlusConstruction` (constructor): IsPlusConstruction f P :↔ IsAcyclicMap f ∧ (FundamentalGroup.map f).ker = P.
- `TauCeti.perfectRadical` (constructor): The largest perfect subgroup of a group, normal (Weibel IV Exercise 1.5).
- `TauCeti.IsPlusConstruction.pi1_quotient` (characterisation): For a plus construction, π₁(Y) ≅ π₁(X) ⧸ P.
- `TauCeti.IsPlusConstruction.homology_iso` (projection): A plus construction induces isomorphisms on homology with coefficients pulled back from π₁(X)/P (H.3/acyclic-map-homology-criterion).

**Unit tests.**

- `isPlusConstruction_trivial_iff` (degenerate): f is a plus construction relative to the trivial subgroup iff f is a weak homotopy equivalence.
- `isPlusConstruction_acyclic_toPoint` (computation): For X acyclic, X → point is a plus construction relative to π₁(X).
- `perfectRadical_perfect_group` (computation): For a perfect group G, perfectRadical G = ⊤; for an abelian group it is ⊥.
- `not_isPlusConstruction_nonperfect` (non-example): No map is a plus construction relative to a non-perfect subgroup: the kernel of an acyclic map on π₁ is perfect.

**Uses.** GeneralAlgebraicKTheory:K.2:plus: BGL(R) → BGL(R)⁺ is the plus construction relative to E(R); K3BlochGroups:V.1/bst-plus: BSt(A) → BSt(A)⁺ relative to the whole perfect group; H.4/gl-telescope-plus-comparison: recognising the basepoint component of the group completion as a plus construction.

**Acceptance.** If X is acyclic, X → point is a plus construction relative to π₁(X) (Weibel IV Example 1.4.2). Relative to P = 1, plus constructions are homotopy equivalences (Weibel IV Exercise 1.2(b)).

**Prerequisites.** `H.3/acyclic-map`, `mathlib:Group.IsPerfect`.

**Sources.** Weibel-KBook-IV, Definition 1.4.1, p. IV.5.

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/plus-construction-by-cell-attachment` — The plus construction by attaching 2- and 3-cells — planet: *Plus construction*

*Construction.* For a connected CW complex X and a perfect normal subgroup P ⊆ π₁(X) there is a relative CW complex X ⊆ X⁺_P obtained by attaching 2-cells along loops representing a generating set of P, which kills exactly P on π₁, and then 3-cells along maps S² → X ∪ (2-cells) representing a basis of the free summand of H₂ created by the 2-cells. The resulting inclusion X → X⁺_P is a plus construction relative to P (H.3/plus-fundamental-group, H.3/plus-integral-homology, H.3/plus-is-acyclic). The construction depends on choices; only the homotopy type under X is canonical (H.3/plus-construction-uniqueness).

**Hypotheses.** X connected CW complex; P perfect and normal (for P only perfect, Hatcher kills the normal closure).

**Construction or proof outline.**

1. Hatcher's version: let p : X_P → X be the covering with π₁(X_P) = P (Tau Ceti UniversalCovers stage 2), so H₁(X_P) = P/[P,P] = 0; apply Proposition 4.40 to X_P (attach 2-cells to kill π₁(X_P), then 3-cells killing the new free H₂, using Hurewicz in degree 2) to get X_P⁺, and glue X_P⁺ to the mapping cylinder M_p along X_P (Hatcher §4.2).
2. Weibel's version (Exercise 1.4): attach one 2-cell e_p for each p ∈ P; H₂ gains the free summand on the [e_p], each represented by h_p : S² → Y since P is perfect; attach 3-cells along the h_p.
3. Both constructions give a relative CW complex (Tau Ceti AlgebraicTopology stage 4 cell attachments).

**API.**

- `TauCeti.plusConstruction` (constructor): plusConstruction X P : a CW complex containing X as a subcomplex, built by 2- and 3-cell attachments (choices included in the data).
- `TauCeti.plusConstruction.incl` (data): The inclusion X → plusConstruction X P.
- `TauCeti.plusConstruction.isPlusConstruction` (characterisation): IsPlusConstruction (plusConstruction.incl X P) P.
- `TauCeti.plusConstruction.relCW` (structure): The pair (plusConstruction X P, X) is a relative CW complex with cells only in dimensions 2 and 3.
- `TauCeti.plusConstruction.pi1Equiv` (equivalence): π₁(plusConstruction X P) ≃* π₁(X) ⧸ P (H.3/plus-fundamental-group).

**Unit tests.**

- `plusConstruction_bot` (degenerate): For P = ⊥, plusConstruction.incl X ⊥ is a homotopy equivalence.
- `plusConstruction_acyclic_contractible` (computation): If X is acyclic, plusConstruction X π₁(X) is contractible (Weibel IV Exercise 1.2(a)).
- `plusConstruction_perfect_group_simplyConnected` (computation): For a perfect group G, plusConstruction (BG) ⊤ is simply connected with the same integral homology as BG, and π₂ ≅ H₂(G; ℤ) by Hurewicz (Tau Ceti AlgebraicTopology stage 8).
- `plusConstruction_not_unique_on_nose` (non-example): Two runs of the construction with different generating sets give spaces that are homotopy equivalent under X but not homeomorphic; no lemma may assert equality of the chosen spaces.

**Uses.** GeneralAlgebraicKTheory:K.2:plus: a concrete model of BGL(R)⁺ with a CW structure; Weibel IV Constructions 1.9(i): functorial models of BGL(R)⁺ by pushout along BGL(ℤ) → BGL(ℤ)⁺; K3BlochGroups:V.4/pi3-bm-plus: BM⁺ for the monomial group.

**Acceptance.** Plus construction relative to the trivial subgroup is a homotopy equivalence (roadmap H.3 test). For the Poincaré homology sphere X = S³/SL₂(F₅), X⁺ is homotopy equivalent to S³ (Weibel IV Exercise 1.1, first part). The composite S³ → X → X⁺ is not an equivalence: it has degree |SL₂(F₅)| = 120 on H₃ (packet source issue StableHomotopyKTheory/E6). Do not export the local-coefficient isomorphism without H.3/plus-is-acyclic.

**Prerequisites.** `H.3/plus-construction-predicate`, `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Sources.** Hatcher-AlgebraicTopology, §4.2, Proposition 4.40 with proof and the construction following it, printed p. 374 (PDF 383); Weibel-KBook-IV, Exercise 1.4, p. IV.14; Theorem 1.5(1), p. IV.5.

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/plus-fundamental-group` — π₁ of the plus construction

*Theorem.* For the cell-attachment plus construction X → X⁺_P, the induced map π₁(X) → π₁(X⁺_P) is surjective with kernel exactly P (for P perfect normal).

**Hypotheses.** X connected CW complex, P perfect normal.

**Construction or proof outline.**

1. Attaching 2-cells along loops generating P kills the normal closure of P, which is P (van Kampen for cell attachments, Tau Ceti AlgebraicTopology stage 1).
2. Attaching 3-cells does not change π₁ (cellular approximation, Tau Ceti AlgebraicTopology stage 4).

**Acceptance.** For X = BGL(R), P = E(R): π₁(BGL(R)⁺) = GL(R)/E(R) = K₁(R), natural for ring maps (the use in GeneralAlgebraicKTheory:K.6).

**Prerequisites.** `H.3/plus-construction-by-cell-attachment`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

**Sources.** Hatcher-AlgebraicTopology, §4.2, construction after Proposition 4.40, printed p. 374 (PDF 383).

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/plus-integral-homology` — The plus construction is an integral homology isomorphism

*Theorem.* The cell-attachment plus construction X → X⁺_P induces isomorphisms H_*(X; ℤ) → H_*(X⁺_P; ℤ).

**Hypotheses.** X connected CW complex, P perfect normal.

**Construction or proof outline.**

1. For H₁(X) = 0: the 2-cells add a free summand to H₂ split by H₁(X) = 0 and the 3-cells kill it, so H_*(X) ≅ H_*(X⁺) (Hatcher Prop. 4.40).
2. General P: X⁺/M_p ≅ X_P⁺/X_P, so H_*(X⁺, M_p) = H_*(X_P⁺, X_P) = 0 by excision (Tau Ceti AlgebraicTopology stage 3), and M_p ≃ X.

**Acceptance.** For a perfect group G, BG → BG⁺ is an integral homology isomorphism onto a simply connected space.

**Prerequisites.** `H.3/plus-construction-by-cell-attachment`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-3-subdivision-excision-and-mayer--vietoris`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Sources.** Hatcher-AlgebraicTopology, §4.2, Proposition 4.40, printed p. 374 (PDF 383).

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/plus-is-acyclic` — The plus construction is acyclic: local-coefficient homology isomorphism

*Theorem.* For the cell-attachment plus construction f : X → X⁺_P and every π₁(X)/P-module M (viewed as a local system on X⁺_P and pulled back to X), f induces isomorphisms H_*(X; M) → H_*(X⁺_P; M). Equivalently (H.3/acyclic-map-homology-criterion) f is acyclic, so it is a plus construction in the sense of H.3/plus-construction-predicate.

**Hypotheses.** X connected CW complex, P perfect normal.

**Construction or proof outline.**

1. Let π = π₁(X)/P = π₁(X⁺_P) (H.3/plus-fundamental-group). The universal cover of X⁺_P restricts over X to the regular cover X_P with deck group π; the lifted 2- and 3-cells exhibit the universal cover as a plus construction of X_P relative to π₁(X_P) = P, so H_*(X_P; ℤ) → H_*((X⁺_P)~; ℤ) is an isomorphism (H.3/plus-integral-homology applied π-equivariantly).
2. Hence the relative cellular chain complex C_*(X̃⁺, X_P) is a bounded-below acyclic complex of free ℤ[π]-modules, hence contractible; tensoring with any π-module M gives H_*(X⁺_P, X; M) = 0 (twisted chains, Tau Ceti AlgebraicTopology stage 2).
3. No source read proves the local-coefficient form for the cell-attachment construction; the argument is packet-authored (packet gap 'Acyclicity of the cell-attachment plus construction').

**Acceptance.** For P = π₁(X) perfect and M = ℤ[π₁X/P] = ℤ this is the integral statement. For X = BG, f is acyclic and its homotopy fibre is acyclic with π₁ the universal central extension of P (H.3/plus-pi2-universal-central-extension).

**Prerequisites.** `H.3/plus-integral-homology`, `H.3/plus-fundamental-group`, `H.3/acyclic-map-homology-criterion`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`, `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`.

**Sources.** Weibel-KBook-IV, Definition 1.1, p. IV.2; Weibel-KBook-IV, Theorem 1.5(1) and paragraph before it, p. IV.5.

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/abelian-space` — Abelian spaces

*Definition.* A path-connected space X is abelian if π₁(X, x) acts trivially on π_n(X, x) for all n ≥ 1 (Tau Ceti's TauCeti.fundamentalGroupMulAut is trivial); for n = 1 the action is conjugation, so π₁(X) is abelian. The condition is independent of the basepoint. Connected H-spaces are abelian (H.3/hspace-is-abelian).

**Hypotheses.** X path-connected; π_n with the action of Tau Ceti's TauCeti.fundamentalGroupMulAut.

**Construction or proof outline.**

1. Define IsAbelianSpace X by triviality of the π₁-action on all homotopy groups at one basepoint (Hatcher §4.1, after Example 4.? on the π₁ action).
2. Basepoint independence: change of basepoint along a path intertwines the actions (TauCeti.homotopyGroupMulEquivOfPath).

**API.**

- `TauCeti.IsAbelianSpace` (constructor): IsAbelianSpace X x :↔ PathConnectedSpace X ∧ ∀ n, TauCeti.fundamentalGroupMulAut (n := n) is trivial at x.
- `TauCeti.IsAbelianSpace.of_basepoint` (relation): IsAbelianSpace X x ↔ IsAbelianSpace X y for x, y in a path-connected X.
- `TauCeti.IsAbelianSpace.of_simplyConnected` (compatibility): A simply connected space is abelian.
- `TauCeti.IsAbelianSpace.of_hSpace` (compatibility): A path-connected H-space (Mathlib HSpace) is abelian (H.3/hspace-is-abelian).
- `TauCeti.IsAbelianSpace.commGroup_pi1` (projection): For abelian X, π₁(X) is commutative.

**Unit tests.**

- `isAbelianSpace_point` (degenerate): A point is abelian.
- `isAbelianSpace_circle` (computation): S¹ is abelian (π₁ = ℤ abelian, higher π vanish).
- `not_isAbelianSpace_rp2` (non-example): RP² is not abelian: π₁ = ℤ/2 acts by −1 on π₂ ≅ ℤ.
- `isAbelianSpace_topologicalGroup` (compatibility): A path-connected topological group, with Mathlib's IsTopologicalGroup.toHSpace, is abelian.

**Uses.** H.3/abelian-homology-whitehead: homology isomorphisms between abelian CW complexes are homotopy equivalences; H.3/serre-class-theorem: Serre class theory holds for abelian spaces, in particular for H-spaces such as BGL(R)⁺; H.3/postnikov-principal-fibrations: abelian CW complexes have Postnikov towers of principal fibrations.

**Acceptance.** Simply connected spaces are abelian. RP^{2n} is not abelian: π₁ acts by −1 on π_{2n} ≅ ℤ (SSAT p. 38).

**Prerequisites.** `tauceti:TauCeti.fundamentalGroupMulAut`, `tauceti:TauCeti.homotopyGroupMulEquivOfPath`.

**Sources.** Hatcher-AlgebraicTopology, §4.1, printed p. 342 (PDF 351).

**Suggested home.** `TauCeti/AlgebraicTopology/ObstructionTheory/Abelian`, namespace `TauCeti`.

#### `H.3/hspace-is-abelian` — Connected H-spaces are abelian

*Lemma.* If X is a path-connected H-space (Mathlib's HSpace, unit e), then the action of π₁(X, e) on π_n(X, e) is trivial for every n ≥ 1; in particular X is abelian and π₁(X) is commutative.

**Hypotheses.** X path-connected with an HSpace structure (homotopy unit relative to e).

**Construction or proof outline.**

1. For a loop γ and f : (Sⁿ, s₀) → (X, e), the map (s, t) ↦ γ(t) · f(s) is a homotopy from f to the action γ·f, using the unit homotopies rel e (Hatcher Example 4A.3, with Proposition 4A.2 identifying the action with free homotopy classes).

**Acceptance.** Topological groups and loop spaces (Mathlib's HSpace instances for Path x x) are abelian spaces. BGL(R)⁺ is an H-space and hence abelian (used by H.3/hspace-homology-whitehead).

**Prerequisites.** `H.3/abelian-space`, `mathlib:HSpace`.

**Sources.** Hatcher-AlgebraicTopology, §4.A, Example 4A.3, printed p. 422 (PDF 431).

**Suggested home.** `TauCeti/AlgebraicTopology/ObstructionTheory/Abelian`, namespace `TauCeti`.

#### `H.3/eilenberg-maclane-space` — Eilenberg–Mac Lane spaces K(A, n) as CW complexes

*Construction.* For n ≥ 1 and a group A (abelian for n ≥ 2) there is a connected CW complex K(A, n) with π_n(K(A, n)) ≅ A and π_i = 0 for i ≠ n, unique up to homotopy equivalence among CW complexes, with based homotopy classes of maps K(A, n) → K(B, n) in bijection with homomorphisms A → B (for n = 1 and B non-abelian, free homotopy classes correspond to homomorphisms modulo conjugation in B); K(A, 1) is BA (H.1/classifying-space-of-group-is-KG1).

**Hypotheses.** n ≥ 1; A abelian when n ≥ 2.

**Construction or proof outline.**

1. Start from a wedge of n-spheres indexed by generators of A, attach (n+1)-cells along relations to get π_n = A (Hurewicz, Tau Ceti AlgebraicTopology stage 8), then kill higher homotopy groups inductively by attaching cells (Hatcher §4.2, 'Eilenberg–MacLane Spaces').
2. Uniqueness and the bijection on maps: extend maps cell by cell, the obstructions lying in vanishing homotopy groups (Hatcher Proposition 4.30 and the lemma used in its proof).

**API.**

- `TauCeti.EilenbergMacLaneSpace` (constructor): EilenbergMacLaneSpace A n : TopCat with a CW structure, for n ≥ 1.
- `TauCeti.EilenbergMacLaneSpace.homotopyGroupEquiv` (characterisation): π_n(EilenbergMacLaneSpace A n) ≃ A and π_i = 0 for i ≠ n.
- `TauCeti.EilenbergMacLaneSpace.homotopyEquivOfPi` (universal-property): Any CW complex Y with π_n(Y) ≅ A and other π_i = 0 is homotopy equivalent to EilenbergMacLaneSpace A n.
- `TauCeti.EilenbergMacLaneSpace.mapEquiv` (universal-property): Based homotopy classes EilenbergMacLaneSpace A n → EilenbergMacLaneSpace B n biject with homomorphisms A → B.
- `TauCeti.EilenbergMacLaneSpace.isEilenbergMacLaneSpaceOne` (compatibility): For n = 1 it satisfies Tau Ceti's IsEilenbergMacLaneSpaceOne.

**Unit tests.**

- `eilenbergMacLaneSpace_trivial` (degenerate): EilenbergMacLaneSpace 0 n is contractible.
- `eilenbergMacLaneSpace_Z_one` (computation): EilenbergMacLaneSpace ℤ 1 is homotopy equivalent to the circle.
- `eilenbergMacLaneSpace_one_compat` (compatibility): EilenbergMacLaneSpace A 1 is homotopy equivalent to Group.classifyingSpace A.
- `eilenbergMacLaneSpace_not_moore` (non-example): EilenbergMacLaneSpace (ℤ/2) 1 = RP^∞ is not the Moore space RP² : H₂(RP^∞; ℤ) = 0 but π₂(RP²) ≠ 0.

**Uses.** H.3/cohomology-representability: H^n(X; A) ≅ [X, K(A, n)]; H.3/postnikov-principal-fibrations: the fibres and k-invariants of Postnikov towers are K(π, n)'s; H.5:spectra/eilenberg-maclane-spectrum: the levels of the Eilenberg–Mac Lane spectrum HA are K(A, n)'s.

**Acceptance.** K(ℤ, 1) ≃ S¹ and K(ℤ/2, 1) ≃ RP^∞. K(ℤ, 2) ≃ CP^∞.

**Prerequisites.** `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `H.1/classifying-space-of-group-is-KG1`.

**Sources.** Hatcher-AlgebraicTopology, §4.2 'Eilenberg–MacLane Spaces' and Proposition 4.30, printed pp. 365–366 (PDF 374–375).

**Suggested home.** `TauCeti/AlgebraicTopology/ObstructionTheory/Abelian`, namespace `TauCeti`.

#### `H.3/cohomology-representability` — Cohomology is represented by Eilenberg–Mac Lane spaces

*Theorem.* For a CW complex X, an abelian group G and n ≥ 1, the map T : ⟨X, K(G, n)⟩ → H^n(X; G), [f] ↦ f*(α), with α ∈ H^n(K(G, n); G) the fundamental class (corresponding to id_G under H^n(K(G,n); G) ≅ Hom(H_n K(G,n), G) ≅ Hom(G, G)), is a natural bijection, where ⟨−, −⟩ denotes based homotopy classes and H^n is singular cohomology (Tau Ceti AlgebraicTopology stage 6).

**Hypotheses.** X a CW complex (or of CW homotopy type); n ≥ 1; G abelian.

**Construction or proof outline.**

1. The functors h^n(X) = ⟨X, K(G, n)⟩ form a reduced cohomology theory on based CW complexes (wedge axiom, exactness from cofibre sequences, suspension iso from ΩK(G, n+1) ≃ K(G, n)) (Hatcher §4.3 proof of Theorem 4.57).
2. A cohomology theory with the same coefficients as H̃^*(−; G) and a natural map is isomorphic to it (uniqueness of cohomology theories on CW complexes, Hatcher Theorem 4.59, by cellular comparison with Tau Ceti AlgebraicTopology stages 4 and 6).

**Acceptance.** ⟨X, K(ℤ, 1)⟩ = H¹(X; ℤ) = [X, S¹] (Hatcher §4.3, Exercise 2). k-invariants of Postnikov towers are classes in H^{n+1}(X_{n−1}; π_n X).

**Prerequisites.** `H.3/eilenberg-maclane-space`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

**Sources.** Hatcher-AlgebraicTopology, §4.3, Theorem 4.57, printed p. 393 (PDF 402).

**Suggested home.** `TauCeti/AlgebraicTopology/ObstructionTheory/Abelian`, namespace `TauCeti`.

#### `H.3/postnikov-principal-fibrations` — Postnikov towers of principal fibrations for abelian spaces

*Theorem.* Every connected CW complex X has a Postnikov tower ⋯ → X_n → X_{n−1} → ⋯ → X_1 with maps X → X_n inducing isomorphisms on π_i for i ≤ n, π_i(X_n) = 0 for i > n, X → lim X_n a weak homotopy equivalence, and X_n → X_{n−1} a fibration with fibre K(π_n X, n). The tower can be chosen with each X_n → X_{n−1} a principal fibration, i.e. the homotopy fibre of a map k_n : X_{n−1} → K(π_n X, n+1), iff π₁(X) acts trivially on π_n(X) for all n > 1 (in particular for abelian X).

**Hypotheses.** X connected CW complex.

**Construction or proof outline.**

1. Construct X_n by attaching cells to X to kill π_i for i > n (Hatcher §4.3 'Postnikov towers').
2. Principality: the k-invariant is the obstruction class in H^{n+1}(X_{n−1}; π_n X) with trivial coefficients, defined because the action is trivial (H.3/cohomology-representability); conversely a principal fibration has trivial action (Hatcher Theorem 4.69).

**Acceptance.** For X = K(G, 1) the tower is constant from n = 1. For RP² the action is nontrivial and no tower of principal fibrations exists.

**Prerequisites.** `H.3/abelian-space`, `H.3/eilenberg-maclane-space`, `H.3/cohomology-representability`, `H.2/mapping-path-space-fibration`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

**Sources.** Hatcher-AlgebraicTopology, §4.3, Theorem 4.69, printed p. 412 (PDF 421).

**Suggested home.** `TauCeti/AlgebraicTopology/ObstructionTheory/Abelian`, namespace `TauCeti`.

#### `H.3/obstruction-lifting` — Obstructions to extending maps through a principal fibration

*Theorem.* Let X_n → X_{n−1} be the principal fibration pulled back from the path fibration over K = K(π_n X, n+1) along k_n, (W, A) a CW pair and W → X_{n−1} a map with a lift A → X_n. The map W ∪ CA → K determines ω_n ∈ H^{n+1}(W ∪ CA; π_n X) ≅ H^{n+1}(W, A; π_n X), and a lift W → X_n extending the given one on A exists iff ω_n = 0.

**Hypotheses.** (W, A) a CW pair; the fibration principal (H.3/postnikov-principal-fibrations).

**Construction or proof outline.**

1. A lift W → X_n is a null-homotopy of W → X_{n−1} → K extending the given one on A, i.e. an extension of W ∪ CA → K over CW (pullback description of X_n).
2. Such an extension exists iff W ∪ CA → K is null-homotopic (homotopy extension for (CW, W ∪ CA), Tau Ceti AlgebraicTopology stage 4), iff its class ω_n vanishes (H.3/cohomology-representability) (Hatcher Proposition 4.72).

**Acceptance.** If H^{n+1}(W, A; π_n X) = 0 there is no obstruction at stage n.

**Prerequisites.** `H.3/postnikov-principal-fibrations`, `H.3/cohomology-representability`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

**Sources.** Hatcher-AlgebraicTopology, §4.3, Proposition 4.72 with proof, printed p. 417 (PDF 426).

**Suggested home.** `TauCeti/AlgebraicTopology/ObstructionTheory/Abelian`, namespace `TauCeti`.

#### `H.3/abelian-extension-corollary` — Extending maps into abelian spaces

*Theorem.* If X is a connected abelian CW complex and (W, A) a CW pair with H^{n+1}(W, A; π_n X) = 0 for all n, then every map A → X extends to a map W → X.

**Hypotheses.** X connected abelian CW complex; (W, A) a CW pair.

**Construction or proof outline.**

1. Lift inductively through the principal Postnikov tower (H.3/postnikov-principal-fibrations), the obstructions vanishing by hypothesis (H.3/obstruction-lifting).
2. Pass to W → lim X_n and compress to X using the weak equivalence X → lim X_n and the compression lemma (Hatcher Lemma 4.6), as in the paragraph before Corollary 4.73.

**Acceptance.** Used with W the mapping cylinder of a homology isomorphism to build a retraction (H.3/abelian-homology-whitehead).

**Prerequisites.** `H.3/obstruction-lifting`, `H.3/postnikov-principal-fibrations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

**Sources.** Hatcher-AlgebraicTopology, §4.3, Corollary 4.73, printed p. 417 (PDF 426).

**Suggested home.** `TauCeti/AlgebraicTopology/ObstructionTheory/Abelian`, namespace `TauCeti`.

#### `H.3/abelian-homology-whitehead` — Homology Whitehead theorem for abelian spaces — planet: *Homology Whitehead theorem for abelian spaces*

*Theorem.* If X and Y are connected abelian CW complexes and f : X → Y induces isomorphisms on all integral homology groups, then f is a homotopy equivalence.

**Hypotheses.** X, Y connected abelian CW complexes (or of CW homotopy type).

**Construction or proof outline.**

1. Replace f by the inclusion of a subcomplex via the mapping cylinder (Tau Ceti AlgebraicTopology stage 4).
2. H_*(Y, X) = 0 gives H^{n+1}(Y, X; π_n X) = 0 by universal coefficients, so the identity of X extends to a retraction Y → X (H.3/abelian-extension-corollary); hence π_n(Y) → π_n(Y, X) is onto and π₁(X) acts trivially on π_n(Y, X).
3. Relative Hurewicz with trivial π₁-action (Tau Ceti AlgebraicTopology stage 8, in the form of Hatcher Theorem 4.37) gives π_n(Y, X) = 0 for all n, so f is a weak equivalence and by Whitehead a homotopy equivalence (Hatcher Proposition 4.74).

**Acceptance.** Simply connected case: Hatcher Corollary 4.33. The abelian hypothesis cannot be dropped: Hatcher's example before Proposition 4.74 (S¹ ∨ Sⁿ with an (n+1)-cell attached so that the composite with the collapse onto Sⁿ has degree 2 − 1 = 1) maps to S¹ by a homology isomorphism that is not a homotopy equivalence, because π₁ acts nontrivially on π_n.

**Prerequisites.** `H.3/abelian-extension-corollary`, `H.3/abelian-space`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

**Sources.** Hatcher-AlgebraicTopology, §4.3, Proposition 4.74 with proof, printed p. 418 (PDF 427).

**Suggested home.** `TauCeti/AlgebraicTopology/ObstructionTheory/Abelian`, namespace `TauCeti`.

#### `H.3/hspace-homology-whitehead` — Homology isomorphisms between H-spaces are homotopy equivalences

*Lemma.* Let X and Y be path-connected H-spaces of CW homotopy type and f : X → Y a map inducing an isomorphism H_*(X; ℤ) ≅ H_*(Y; ℤ). Then f is a homotopy equivalence. (f need not be an H-map.)

**Hypotheses.** X, Y path-connected H-spaces with the homotopy type of CW complexes.

**Construction or proof outline.**

1. H-spaces are abelian (H.3/hspace-is-abelian); apply H.3/abelian-homology-whitehead after CW replacement.
2. Weibel's hint (trivial action of π₁(Y) on the homotopy fibre by [Wh, IV.3.6] and relative Hurewicz) is replaced by this route.

**Acceptance.** BGL(R)⁺ ≃ H whenever BGL(R) → H is an integral homology isomorphism into an H-space (H.3/plus-hspace-recognition).

**Prerequisites.** `H.3/hspace-is-abelian`, `H.3/abelian-homology-whitehead`.

**Sources.** Weibel-KBook-IV, Exercise 1.3, p. IV.14.

**Suggested home.** `TauCeti/AlgebraicTopology/ObstructionTheory/Abelian`, namespace `TauCeti`.

#### `H.3/plus-construction-universal-property` — Universal property of the plus construction — planet: *Universal property of the plus construction*

*Theorem.* Let f : X → Y be a plus construction relative to P and g : X → Z a map to a connected space of CW homotopy type with P ⊆ ker(π₁ g). Then there is h : Y → Z with h ∘ f ≃ g, and h is unique up to homotopy. For Z abelian this is proved from H.3/abelian-extension-corollary; for general Z it needs obstruction theory with local coefficients (Weibel IV Theorem 1.5(2), proof in Berrick §5, not read).

**Hypotheses.** X, Y, Z connected of CW homotopy type; P perfect normal in π₁(X) with P ⊆ ker(π₁ g). Uniqueness is up to homotopy, never literal equality of maps; for non-abelian Z the obstruction theory with twisted coefficients is the packet gap 'Plus-construction universal property for non-abelian targets'.

**Construction or proof outline.**

1. Model f as the relative CW inclusion X ⊆ X⁺ (H.3/plus-construction-by-cell-attachment, unique up to homotopy under X by H.3/plus-construction-uniqueness).
2. Abelian Z: the obstruction groups H^{n+1}(X⁺, X; π_n Z) vanish since H_*(X⁺, X; ℤ) = 0 (H.3/plus-integral-homology) and universal coefficients; extend by H.3/abelian-extension-corollary. Uniqueness: apply the same to (X⁺ × I, X⁺ × ∂I ∪ X × I).
3. General Z: the obstructions lie in H^{n+1}(X⁺, X; π_n Z) with local coefficients through π₁(X⁺) → π₁(Z) and vanish by acyclicity (H.3/plus-is-acyclic); the twisted obstruction theory is the source boundary (Weibel cites Berrick §5).

**Acceptance.** Functoriality of BGL(R)⁺ in R holds only up to homotopy and follows from (2) (Weibel IV 1.1.2). Lemma 4.4.1 (group completion of group-like H-spaces) uses this with abelian targets. Do not replace (2) by an assumed structure field.

**Prerequisites.** `H.3/plus-construction-by-cell-attachment`, `H.3/plus-is-acyclic`, `H.3/plus-integral-homology`, `H.3/abelian-extension-corollary`, `H.3/abelian-space`.

**Sources.** Weibel-KBook-IV, Theorem 1.5 and the paragraph before it, p. IV.5; Hatcher-AlgebraicTopology, §4.2 Exercise 23, printed p. 420 (PDF 429).

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/plus-construction-uniqueness` — Uniqueness of the plus construction up to homotopy under X

*Lemma.* If f : X → Y and f′ : X → Y′ are both plus constructions relative to P, then the map h : Y → Y′ with h ∘ f ≃ f′ given by H.3/plus-construction-universal-property is a homotopy equivalence. Thus X⁺_P is well defined up to homotopy equivalence under X, but different choices are not equal.

**Hypotheses.** As in H.3/plus-construction-universal-property (abelian-target case suffices when Y, Y′ are H-spaces).

**Construction or proof outline.**

1. Apply the universal property in both directions; the composites are maps Y → Y under X, hence homotopic to the identity by uniqueness (packet-authored; Weibel states it with 'In particular').

**Acceptance.** Any two models of BGL(R)⁺ are homotopy equivalent (Weibel IV Definition 1.1 remark).

**Prerequisites.** `H.3/plus-construction-universal-property`.

**Sources.** Weibel-KBook-IV, Theorem 1.5(3), p. IV.5.

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/plus-construction-functoriality` — Functoriality of the plus construction up to homotopy

*Lemma.* Let φ : X → X′ be a map of connected CW complexes and P ⊆ π₁(X), P′ ⊆ π₁(X′) perfect normal subgroups with φ_*(P) ⊆ P′. Then there is φ⁺ : X⁺_P → X′⁺_{P′}, unique up to homotopy, with φ⁺ ∘ f ≃ f′ ∘ φ; (ψ ∘ φ)⁺ ≃ ψ⁺ ∘ φ⁺ and id⁺ ≃ id. Strictly functorial models exist (Weibel IV Constructions 1.9) but the statements here are only up to homotopy.

**Hypotheses.** φ carries the selected perfect subgroup into the selected one.

**Construction or proof outline.**

1. Apply H.3/plus-construction-universal-property to f′ ∘ φ : X → X′⁺, which kills P since φ_*(P) ⊆ P′ = ker(π₁ f′).
2. Composition and identities follow from uniqueness up to homotopy.

**Acceptance.** Ring maps R → R′ induce BGL(R)⁺ → BGL(R′)⁺, unique up to homotopy (Weibel IV 1.1.2); for P = E(R) the condition holds because ring maps preserve elementary matrices.

**Prerequisites.** `H.3/plus-construction-universal-property`.

**Sources.** Weibel-KBook-IV, 1.1.2, p. IV.3.

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/plus-hspace-recognition` — Recognising plus constructions into H-spaces

*Theorem.* Let X be a connected CW complex whose fundamental group has perfect commutator subgroup P = [π₁X, π₁X] (for example X = BGL(R), P = E(R)), and let g : X → H be a map to a path-connected H-space of CW homotopy type. Then g factors up to homotopy through X → X⁺_P by a map g⁺ whose effect on homotopy groups is independent of the factorisation; if moreover g induces an isomorphism H_*(X; ℤ) ≅ H_*(H; ℤ), then g is acyclic and g⁺ : X⁺_P → H is a homotopy equivalence.

**Hypotheses.** H a path-connected H-space of CW homotopy type; X⁺_P must itself be an H-space for the last clause (true for BGL(R)⁺, Weibel IV Exercise 1.11).

**Construction or proof outline.**

1. π₁(H) is abelian (H.3/hspace-is-abelian), so P = [π₁X, π₁X] maps trivially; H is abelian, so H.3/plus-construction-universal-property (abelian-target case) gives g⁺, unique up to homotopy, which fixes its effect on π_* (Weibel IV Theorem 1.8).
2. If g is an integral homology isomorphism, so is g⁺ (H.3/plus-integral-homology); X⁺_P and H are H-spaces, so g⁺ is a homotopy equivalence (H.3/hspace-homology-whitehead); then g ≃ g⁺ ∘ f is acyclic (Weibel IV Remark 1.8.1, Exercise 1.3).

**Acceptance.** BGL(F_q)⁺ ≃ the homotopy fibre of ψ^q − 1 on BU, by applying the recognition to Quillen's Brauer-lift map (Weibel IV Theorem 1.12, the use in KTheoryFiniteLocalFields:L.1). Z × BGL(R)⁺ ≃ the group completion of ⊔ BGL_n(R) (H.4/gl-telescope-plus-comparison).

**Prerequisites.** `H.3/plus-construction-universal-property`, `H.3/hspace-homology-whitehead`, `H.3/plus-integral-homology`, `H.3/hspace-is-abelian`.

**Sources.** Weibel-KBook-IV, Theorem 1.8 and Remark 1.8.1, p. IV.6.

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/plus-pi2-universal-central-extension` — π₂ of a plus construction and universal central extensions — planet: *π₂ of BG⁺ and universal central extensions*

*Theorem.* Let P be a perfect normal subgroup of a group G and f : BG → BG⁺ the plus construction relative to P, with homotopy fibre F(f). Then π₁F(f) is the universal central extension of P and π₂(BG⁺) ≅ H₂(P; ℤ). For G = GL(R), P = E(R) this identifies π₂BGL(R)⁺ with H₂(E(R); ℤ), the kernel of the Steinberg extension.

**Hypotheses.** P perfect normal in G; the recognition theorem for universal central extensions (a central extension X of a perfect group is universal iff H₁(X) = H₂(X) = 0, with kernel H₂(P) by Hopf's formula) is the node K2SymbolsBrauer:T.1/recognition-theorem with the kernel computation K2SymbolsBrauer:T.1:classical/uce-kernel-h2 (RT-AREA-ktheory-1/30).

**Construction or proof outline.**

1. The homotopy sequence gives π₂(BG) = 0 → π₂(BG⁺) → π₁F(f) → G → G/P → 1, so π₁F(f) is an extension of P by π₂(BG⁺) (H.2/long-exact-sequence).
2. π₂(BG⁺) is central in π₁F(f): the image of π₂(B) → π₁(F) of a fibre sequence is central (H.2/fibre-sequence-low-degree, the Whitehead product argument of [Wh, IV.3.5]).
3. F(f) is acyclic, so π₁F(f) is perfect with H₂ = 0 (H.3/acyclic-space-perfect-fundamental-group).
4. The recognition theorem (K2SymbolsBrauer:T.1/recognition-theorem) identifies π₁F(f) as the universal central extension of P, whose kernel is H₂(P; ℤ) (Weibel IV Proposition 1.7).

**Acceptance.** K₂(R) = π₂BGL(R)⁺ ≅ H₂(E(R); ℤ) (Weibel IV Corollary 1.7.1). For P = G perfect, π₂(BG⁺) ≅ H₂(G; ℤ) agrees with Hurewicz on the simply connected BG⁺. Naturality in R must be checked on representatives, since the plus construction is only homotopy functorial.

**Prerequisites.** `H.3/plus-is-acyclic`, `H.3/acyclic-space-perfect-fundamental-group`, `H.2/long-exact-sequence`, `H.2/fibre-sequence-low-degree`, `K2SymbolsBrauer:T.1/recognition-theorem`, `K2SymbolsBrauer:T.1:classical/uce-kernel-h2`.

**Sources.** Weibel-KBook-IV, Proposition 1.7 with proof and Corollary 1.7.1, p. IV.6.

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/plus-universal-cover` — BP⁺ is the universal cover of BG⁺

*Lemma.* Let P be a perfect normal subgroup of G and BG → BG⁺ the plus construction relative to P. Then BP⁺ (plus relative to all of P) is homotopy equivalent to the universal covering space of BG⁺, compatibly with the maps from BP; hence π_n(BP⁺) ≅ π_n(BG⁺) for n ≥ 2, naturally in (G, P). For G = GL(R), P = E(R): BE(R)⁺ is the universal cover of BGL(R)⁺ and K_n(R) ≅ π_n BE(R)⁺ for n ≥ 2; for a commutative ring, BSL(R)⁺ → BGL(R)⁺ is an isomorphism on π_n for n ≥ 2.

**Hypotheses.** P perfect normal in G.

**Construction or proof outline.**

1. BP is homotopy equivalent to the covering space of BG with group P (H.1/translation-category-classifying-space); pull back the universal cover of BG⁺ (whose π₁ is G/P) to BG to get this covering (Weibel IV Exercise 1.8 hint).
2. The restriction of the universal cover of BG⁺ is a plus construction of the cover relative to P (lifting cells as in H.3/plus-is-acyclic), so by uniqueness (H.3/plus-construction-uniqueness) it is BP⁺.
3. Covering maps induce isomorphisms on π_n for n ≥ 2 (Tau Ceti IsCoveringMap.homotopyGroupMulEquiv).

**Acceptance.** π₁(BE(R)⁺) = 0 and π₂(BE(R)⁺) ≅ K₂(R). For P = G this is the identity.

**Prerequisites.** `H.3/plus-is-acyclic`, `H.3/plus-construction-uniqueness`, `H.1/translation-category-classifying-space`, `tauceti:IsCoveringMap.homotopyGroupMulEquiv`.

**Sources.** Weibel-KBook-IV, Exercise 1.8, pp. IV.14–15.

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/plus-uce-fibration` — The plus-construction fibration of a universal central extension

*Lemma.* If A → S → P is a universal central extension (S and P perfect), there is a homotopy fibre sequence BA → BS⁺ → BP⁺. Consequently π_n(BS⁺) = 0 for n ≤ 2, π_n(BS⁺) ≅ π_n(BP⁺) for n ≥ 3, and π₃(BP⁺) ≅ H₃(S; ℤ) by Hurewicz. For S = St(R), P = E(R): K_n(R) ≅ π_n BSt(R)⁺ for n ≥ 3 and K₃(R) ≅ H₃(St(R); ℤ).

**Hypotheses.** A → S → P universal central extension; plus constructions relative to the whole perfect groups.

**Construction or proof outline.**

1. BA → BS → BP is a fibre sequence (H.2/group-extension-fibration); since A is central, π₁(BP) acts trivially on H_*(BA) and the fibration is principal (BA is a topological group model K(A,1)).
2. Apply plus constructions: the induced BS⁺ → BP⁺ has homotopy fibre BA because the comparison of Serre spectral sequences (Tau Ceti AlgebraicTopology stage 5) shows the map from BA to the homotopy fibre is a homology isomorphism of simple spaces (H.3/abelian-homology-whitehead) — the relative plus argument of H.3/plus-relative-fibre-comparison.
3. π₁(BS⁺) = 0, π₂(BS⁺) = H₂(S) = 0 for a universal central extension, so BS⁺ is 2-connected and Hurewicz (Tau Ceti AlgebraicTopology stage 8) gives π₃(BS⁺) ≅ H₃(S); the long exact sequence identifies π₃(BP⁺) (Weibel IV Exercise 1.9).

**Acceptance.** K₃(R) ≅ H₃(St(R); ℤ) (the use in K3BlochGroups:V.1/k3-h3-steinberg). For the trivial extension of a perfect group with H₂ = 0, BA is a point.

**Prerequisites.** `H.2/group-extension-fibration`, `H.3/plus-relative-fibre-comparison`, `H.3/plus-pi2-universal-central-extension`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

**Sources.** Weibel-KBook-IV, Exercise 1.9, p. IV.15.

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/plus-relative-fibre-comparison` — Plus constructions of fibre sequences

*Theorem.* Let F → E → B be a homotopy fibre sequence of connected CW complexes, P ⊆ π₁(E) a perfect normal subgroup with trivial image in π₁(B), and suppose π₁(B) acts trivially on H_*(F; ℤ) and B is abelian. Factor E → E⁺_P → B (H.3/plus-construction-universal-property) and let F′ be the homotopy fibre of E⁺_P → B. Then the induced map F → F′ is an isomorphism on integral homology. Consequently, if F → F⁺ is a plus construction with F⁺ abelian and F′ is abelian, then F⁺ ≃ F′ under F and F⁺ → E⁺_P → B is a homotopy fibre sequence.

**Hypotheses.** The precise hypotheses are those of the comparison of Serre spectral sequences: base path-connected with trivial action of π₁(B) on the homology of the fibres; fibres simple so that the homology Whitehead theorem applies.

**Construction or proof outline.**

1. Factor E → E⁺ over B using the universal property for maps into B (H.3/plus-construction-universal-property); compare the Serre spectral sequences of F → E → B and F′ → E⁺ → B (Tau Ceti AlgebraicTopology stage 5); since E → E⁺ is a homology isomorphism, F → F′ induces an isomorphism on E² and abutments, hence on homology (Zeeman comparison).
2. F′ is simple when it is an H-space or simply connected, so F⁺ → F′ is a homotopy equivalence (H.3/abelian-homology-whitehead).
3. No source read states the general relative plus construction; the form here is packet-authored around Weibel IV Exercise 1.9 and the roadmap's requirement ('Include the relative construction needed to compare fibres after applying plus'); recorded in the gap 'Relative plus construction'.

**Acceptance.** The universal central extension case BA → BS⁺ → BP⁺ (H.3/plus-uce-fibration). For a product E = F × B with P ⊆ π₁F the conclusion is (F × B)⁺ ≃ F⁺ × B (Weibel IV Exercise 1.7 for products of groups).

**Prerequisites.** `H.3/plus-construction-universal-property`, `H.3/abelian-homology-whitehead`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `H.2/homotopy-pullback`.

**Sources.** Weibel-KBook-IV, Exercise 1.9, p. IV.15.

**Suggested home.** `TauCeti/AlgebraicTopology/PlusConstruction/Basic`, namespace `TauCeti`.

#### `H.3/serre-class-theorem` — Serre class theory for abelian spaces — planet: *Serre class theorem*

*Theorem.* Let C be one of: finitely generated abelian groups, P-torsion groups, finite P-torsion groups. For a path-connected abelian space X (in particular a connected H-space, such as BGL(R)⁺ or a component of the K-theory space), π_n(X) ∈ C for all n ≥ 1 iff H_n(X; ℤ) ∈ C for all n > 0; and if π_i(X) ∈ C for i < n then the Hurewicz map π_n(X) → H_n(X) is an isomorphism modulo C.

**Hypotheses.** X path-connected and abelian (trivial π₁-action on all π_n, n ≥ 1).

**Construction or proof outline.**

1. Mod-C Hurewicz for abelian spaces by induction on the Postnikov tower of principal fibrations (H.3/postnikov-principal-fibrations) and the Serre spectral sequence with trivial coefficients (Tau Ceti AlgebraicTopology stage 5), using that H_*(K(A, n)) ∈ C for A ∈ C (Hatcher SSAT Theorem 1.8 and its lemmas).
2. The equivalence of the two conditions follows from mod-C Hurewicz applied to the stages of the tower (SSAT Theorem 1.7).

**Acceptance.** S¹ ∨ S² is not abelian and has π₂ not finitely generated although its homology is (SSAT p. 14): the abelian hypothesis is needed. If H_*(BGL(R)⁺) is finitely generated in each degree then K_n(R) is finitely generated for n ≥ 1 (the use in ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion). The same reduction for hermitian K-theory (Calmès et al. Remark 2.3.20): for a number ring O the groups GW^q_n(O; ε) are finitely generated as soon as the integral homology of the components of Ω^∞GW^q(O; ε), which are connected H-spaces, is finitely generated in each degree.

**Prerequisites.** `H.3/abelian-space`, `H.3/postnikov-principal-fibrations`, `H.3/eilenberg-maclane-space`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Sources.** Hatcher-SpectralSequences-SSAT, Chapter 1 'Serre Classes', Theorems 1.7 and 1.8, p. 14; CalmesEtAl-HermitianKIII-2026, Remark 2.3.20, pp. 48–49.

**Suggested home.** `TauCeti/AlgebraicTopology/SerreClass/Basic`, namespace `TauCeti`.

#### `H.3/rational-hurewicz-hspace` — Rational homotopy of H-spaces (Cartan–Serre)

*Theorem.* Let X be a path-connected H-space of CW homotopy type with H_n(X; ℚ) finite-dimensional for each n. Then H*(X; ℚ) is a free graded-commutative algebra (polynomial on even and exterior on odd generators) and X_ℚ is a product of Eilenberg–Mac Lane spaces K(ℚ, n_i); π_*(X) ⊗ ℚ has a basis in bijection with the free generators, and the rational Hurewicz map π_n(X) ⊗ ℚ → H_n(X; ℚ) is injective with image the primitive elements of the Hopf algebra H_*(X; ℚ).

**Hypotheses.** X path-connected H-space (hence abelian, H.3/hspace-is-abelian), finite type rational homology. The degree-one factor π₁(X) ⊗ ℚ is included (π₁ abelian).

**Construction or proof outline.**

1. Hopf–Borel: the rational cohomology of a connected H-space of finite type is a free graded-commutative Hopf algebra (Hatcher Theorem 3C.4, cited by SSAT p. 39; not re-read here).
2. Cartan–Serre: for an abelian space with such rational cohomology, the product of the maps to K(ℚ, n_i) given by the generators is a rationalisation, so π_*(X) ⊗ ℚ has the stated basis (SSAT Theorem 1.24, via rational localisation of abelian spaces, SSAT Theorem 1.23).
3. The identification of the image of rational Hurewicz with the primitives is Milnor–Moore; it is not proved in the sources read (packet gap 'Primitives and rational Hurewicz for H-spaces').

**Acceptance.** π_*(U) ⊗ ℚ is ℚ in odd degrees (SSAT Example 1.25). RP^{2n} shows the abelian hypothesis is needed (SSAT p. 38). Borel's computation of K_n(O_F) ⊗ ℚ uses H_*(BGL(O_F)⁺; ℚ) = stable cohomology of arithmetic groups (BorelRegulators:R.3).

**Prerequisites.** `H.3/hspace-is-abelian`, `H.3/abelian-space`, `H.3/eilenberg-maclane-space`, `H.3/serre-class-theorem`.

**Sources.** Hatcher-SpectralSequences-SSAT, Chapter 1, Theorem 1.24 and the paragraph after its proof, pp. 38–39.

**Suggested home.** `TauCeti/AlgebraicTopology/SerreClass/Rational`, namespace `TauCeti`.

**Coverage.** Status `planned`. Remaining refinements: Non-abelian-target universal property and the general relative plus construction (gaps); Milnor–Moore primitives (gap).

## H.4 — Homotopy group completion

RS-33 keeps the homotopy group completion of a symmetric monoidal groupoid through S⁻¹S or an explicit equivalent model, the comparison of π₀ with the algebraic group completion and split K₀, homology localisation and cofinal stabilisation, the cofinality theorem with its projective-module comparison to BGL(R)⁺ (with component and ring-map naturality, countability and phantom restrictions, and no natural product splitting), and coherence or strictification independence. Algebraic K₀, projective complements, stable GL and plus are imported. The maintainer adds Bhatt–Scholze §12 (the Fin_*-Segal construction, the coherent subset model and the bar/group-completion adjunction) and Calmès et al. §3.2 (Grothendieck–Witt spaces of ℤ and topological variants).

**Objects.** The core of a symmetric monoidal category as a symmetric monoidal groupoid; actions ⟨S, X⟩ and S⁻¹X; S⁻¹S and K(S) = B(S⁻¹S); group completions of H-spaces; special Γ-spaces; Segal's summing-functor Γ-space; the coherent subset E∞-monoid N(C); topological variants of functors on rings.

**Theorems.** BS is a homotopy-commutative H-space; π₀(S⁻¹S) is the Grothendieck group; S⁻¹X → ⟨S, S⟩ is cofibred and invertible actions do not change homotopy type; Quillen's localisation theorem; group completions of group-like spaces are equivalences, unique up to phantom maps under countability; the fibration S⁻¹S → S⁻¹X → ⟨S, X⟩; block sum makes BGL(R)⁺ an H-space and ℤ × BGL(R)⁺ a group completion; B(S⁻¹S) ≃ ℤ × BGL(R)⁺ for based free modules; the cofinal-sequence comparison; the cofinality theorem and B(iso P(R)⁻¹ iso P(R)) ≃ K₀(R) × BGL(R)⁺; strictification independence; Segal's delooping theorem; group completion as ΩB, left adjoint to the inclusion of grouplike monoids; Picard groupoids are the grouplike N(C); the Grothendieck–Witt spaces of ℤ are plus constructions on their stable automorphism groups.

### Declarations of H.4

#### `H.4/symmetric-monoidal-groupoid-core` — The core of a symmetric monoidal category is a symmetric monoidal groupoid

*Construction.* For a symmetric monoidal category (S, □, e), the core Core S (all objects, only isomorphisms) inherits a symmetric monoidal structure: □ restricts to isomorphisms and the unit, associativity and symmetry constraints are isomorphisms. A symmetric monoidal groupoid is a symmetric monoidal category all of whose morphisms are invertible; Core is the right adjoint of the inclusion of symmetric monoidal groupoids into symmetric monoidal categories with strong monoidal functors. Examples: Core of finitely generated projective R-modules under ⊕ (not strict: the symmetry on M ⊕ M is the swap), finite sets under ⊔, based free modules F(R) = ⊔_n GL_n(R) under block sum, Pic(R) under ⊗.

**Hypotheses.** S symmetric monoidal (Mathlib MonoidalCategory + SymmetricCategory); direct sum is not assumed strictly associative or strictly commutative.

**Construction or proof outline.**

1. The tensor product of two isomorphisms is an isomorphism, and the structure isomorphisms of S lie in Core S, so the coherence axioms hold there (Bhatt–Scholze p. 54; Weibel IV Definition 4.1).
2. Strong monoidal functors S → T restrict to Core.

**API.**

- `CategoryTheory.Core.monoidalCategory` (instance): For S monoidal, a MonoidalCategory structure on Core S with tensor of isomorphisms.
- `CategoryTheory.Core.symmetricCategory` (instance): For S symmetric monoidal, a SymmetricCategory structure on Core S.
- `CategoryTheory.Core.inclusion_monoidal` (compatibility): The inclusion Core S ⥤ S is strict monoidal and braided.
- `CategoryTheory.Core.mapMonoidal` (functoriality): A strong (braided) monoidal functor F : S ⥤ T induces a strong (braided) monoidal functor Core S ⥤ Core T, compatible with composition.
- `CategoryTheory.Core.isoClassesMonoid` (data): The commutative monoid of isomorphism classes of Core S under □, equal to π₀ of B(Core S).

**Unit tests.**

- `core_finset_pi0` (computation): For finite sets under disjoint union, the monoid of isomorphism classes of the core is ℕ.
- `core_of_groupoid` (degenerate): If S is already a groupoid, Core S ≌ S as symmetric monoidal categories.
- `core_projective_symmetry_not_id` (non-example): In Core of finitely generated projective ℤ-modules, the symmetry on ℤ ⊕ ℤ is the swap, not the identity: the structure is not strict.
- `core_isoClasses_splitK0` (compatibility): For an additive category A, the Grothendieck group of isoClassesMonoid (Core A, ⊞) is Tau Ceti's SplitK0 A (TauCeti.SplitK0.grothendieckAddGroupEquiv).

**Uses.** H.4/symmetric-monoidal-S-inverse-S: S⁻¹S is formed for S = iso S; H.4/coherent-subset-construction: the Segal E∞-monoid N(C) of a symmetric monoidal groupoid; KTheoryLowDegrees:Z.3/ring-spectrum-det: Vect(R) → Pic^ℤ(R) as a symmetric monoidal functor of groupoids (Bhatt–Scholze Prop. 12.3); GeneralAlgebraicKTheory:K.2:plus: iso P(R) with direct sum.

**Acceptance.** π₀(B Core S) is the commutative monoid of isomorphism classes S^iso. For projective modules the symmetry c_{M,M} is not the identity when M ≠ 0 (Bhatt–Scholze Example 12.2(i)).

**Prerequisites.** `mathlib:CategoryTheory.SymmetricCategory`, `mathlib:CategoryTheory.Core`.

**Sources.** BhattScholze-WittGrassmannian-2017, Appendix §12, p. 54; Weibel-KBook-IV, Definition 4.1 and Examples 4.1.1, pp. IV.36–37.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Basic`, namespace `CategoryTheory`.

#### `H.4/classifying-space-hspace` — The classifying space of a symmetric monoidal category is a homotopy-commutative H-space

*Lemma.* For a symmetric monoidal category S with countably many morphisms (or with products taken in compactly generated spaces), BS is an H-space with multiplication B(□) ∘ (B(S × S) ≅ BS × BS)⁻¹ and unit the vertex [e]; it is homotopy associative and homotopy commutative, π₀(BS) is the commutative monoid of components and H₀(BS; ℤ) = ℤ[π₀ BS]. If e is initial in S (e.g. S additive), BS is contractible.

**Hypotheses.** The homeomorphism B(S × S) ≅ BS × BS (H.1/classifying-space-prod) needs a finite factor or compactly generated products; for countable CW complexes the ordinary product is already a CW complex, which covers S = F(R) for countable R. In general Mathlib's HSpace must be applied to the compactly generated product (packet gap 'Realisation of products').

**Construction or proof outline.**

1. The unit isomorphisms e □ s ≅ s ≅ s □ e are natural transformations, hence homotopies (H.1/natural-transformations-adjoints-contractibility), making [e] a two-sided unit up to homotopy rel [e] after the standard modification; associativity and symmetry constraints give the homotopies (Weibel IV §4 opening).
2. If e is initial, BS is contractible (H.1/contractible-of-initial-or-terminal).

**Acceptance.** B(Finset under ⊔) is contractible but B(Core) ≃ ⊔ BΣ_n is not (Weibel IV §4 opening and 4.1.1(a)). For S = Pic(R), B Pic(R) ≃ Pic(R) × B(R^×) (Weibel IV Example 4.1.1(d)).

**Prerequisites.** `H.4/symmetric-monoidal-groupoid-core`, `H.1/classifying-space-prod`, `H.1/natural-transformations-adjoints-contractibility`, `H.1/contractible-of-initial-or-terminal`, `mathlib:HSpace`.

**Sources.** Weibel-KBook-IV, §4 opening, p. IV.36.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Basic`, namespace `CategoryTheory`.

#### `H.4/symmetric-monoidal-S-inverse-S` — Quillen's S⁻¹S construction for a symmetric monoidal groupoid — planet: *Quillen's S⁻¹S construction*

*Construction.* For a symmetric monoidal groupoid S in which translations Aut(s) → Aut(s □ t) are injective, S⁻¹S has objects pairs (m, n) and morphisms equivalence classes of composites (m₁, m₂) → (s □ m₁, s □ m₂) → (n₁, n₂), two composites being equivalent when an isomorphism α : s ≅ t identifies their second parts. S⁻¹S is symmetric monoidal with (m, n) □ (m′, n′) = (m □ m′, n □ n′), m ↦ (m, e) is monoidal, and K(S) := B(S⁻¹S), K_n(S) := π_n B(S⁻¹S). A strict monoidal functor S → T induces S⁻¹S → T⁻¹T.

**Hypotheses.** Every morphism of S an isomorphism; translations faithful (needed for composition to be well defined up to unique isomorphism and for Theorem 4.8).

**Construction or proof outline.**

1. Define S⁻¹S as ⟨S, S × S⟩ for the diagonal action (H.4/monoidal-action-category), equivalently by Weibel's explicit description (Definition 4.2, Explanation 4.2.1).
2. The monoidal structure is componentwise (Remark 4.2.2); there is a morphism (e, e) → (m, n) □ (n, m) giving inverses on π₀, not natural (Exercise 4.3).

**API.**

- `CategoryTheory.SInvS` (constructor): SInvS S : the category S⁻¹S, for S a symmetric monoidal groupoid with faithful translations.
- `CategoryTheory.SInvS.incl` (data): The strong monoidal functor S ⥤ SInvS S, m ↦ (m, e).
- `CategoryTheory.SInvS.monoidal` (instance): The symmetric monoidal structure on SInvS S, componentwise.
- `CategoryTheory.SInvS.map` (functoriality): A strict (or strong, via H.4/strictification-independence) monoidal functor F : S ⥤ T induces SInvS S ⥤ SInvS T, with map_id and map_comp up to natural isomorphism.
- `CategoryTheory.SInvS.kSpace` (constructor): kSpace S := classifyingSpace (SInvS S), the K-theory space; K n S := π_n (kSpace S).
- `CategoryTheory.SInvS.pi0Equiv` (equivalence): π₀ (kSpace S) ≃ Algebra.GrothendieckGroup (isomorphism classes of S) (H.4/S-inverse-S-pi0).
- `CategoryTheory.SInvS.swap` (other): The functor ι : (m, n) ↦ (n, m) inducing the homotopy inverse of the H-space kSpace S (not a natural inverse).

**Unit tests.**

- `SInvS_pic_K0` (computation): For S = Pic(R) (R commutative), π₀ kSpace S ≅ Pic(R), π₁ ≅ Rˣ and π_n = 0 for n ≥ 2.
- `SInvS_trivial` (degenerate): For the trivial symmetric monoidal groupoid (one object, one morphism), kSpace is contractible.
- `SInvS_pi0_compat` (compatibility): For S = Core of an additive category A with ⊞, π₀ kSpace S ≅ TauCeti.SplitK0 A, compatibly with the classes of objects.
- `SInvS_no_natural_inverse` (non-example): There is no natural transformation from the constant functor at (e, e) to id □ swap on SInvS S when S = F(ℤ) (Weibel IV Exercise 4.3).
- `SInvS_not_all_maps` (non-example): Using the category P(R) of all maps instead of iso P(R) gives a contractible classifying space (0 is initial), not K(R).

**Uses.** GeneralAlgebraicKTheory:K.2:plus: the + = Q theorem identifies ΩBQ(P(R)) with B(S⁻¹S) for S = iso P(R); H.4/quillen-localization-of-homology: Theorem 4.8 computes the homology of S⁻¹S; BorelRegulators:R.1/finite-type-plus-consequences: the H-space B(S⁻¹S) and its basepoint component BGL(O_F)⁺.

**Acceptance.** Pic(R) with π₀ already a group gives K₀ = Pic(R), K₁ = R^× and K_n = 0 for n ≥ 2 (Weibel IV Example 4.4.2). There is no natural transformation 0 ⇒ id □ ι on S⁻¹S (Weibel IV Exercise 4.3): the homotopy inverse is not given by a natural transformation. Do not use the nerve of all projective-module maps; BP(R) is contractible, only iso P(R) carries the group completion input.

**Prerequisites.** `H.4/symmetric-monoidal-groupoid-core`, `H.4/monoidal-action-category`.

**Sources.** Weibel-KBook-IV, Definition 4.2, Explanation 4.2.1, Remark 4.2.2, Definition 4.3, pp. IV.37–38; Carlsson-Deloopings-Handbook-2005, §1.2, Definition 7, printed p. 9 (PDF 23).

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Basic`, namespace `CategoryTheory`.

#### `H.4/monoidal-action-category` — Actions of monoidal categories and the categories ⟨S, X⟩ and S⁻¹X

*Construction.* A monoidal category S acts on a category X by a functor □ : S × X → X with coherent natural isomorphisms s □ (t □ x) ≅ (s □ t) □ x and e □ x ≅ x. The category ⟨S, X⟩ has the objects of X and morphisms x → y equivalence classes of pairs (s, φ : s □ x → y), (s, φ) ∼ (s′, φ′) when an isomorphism s ≅ s′ identifies φ′ with φ. Write S⁻¹X = ⟨S, S × X⟩ for the diagonal action; S⁻¹S is the case X = S. If S is symmetric, S acts on S⁻¹X by s □ (t, x) = (s □ t, x), and this action is invertible (each translation a homotopy equivalence).

**Hypotheses.** S monoidal (symmetric for the action on S⁻¹X); X any category; for S a groupoid with faithful translations, morphisms of ⟨S, X⟩ have unique representatives up to unique isomorphism.

**Construction or proof outline.**

1. Define ⟨S, X⟩ by Weibel's Definition 4.7.1, as the translation category of the action (compare H.1/translation-category-classifying-space for monoids acting on sets).
2. Invertibility of the action on S⁻¹X: the natural transformation (t, x) ↦ (s □ t, s □ x) relates the translation by s with the other-coordinate translation, giving a homotopy inverse (Weibel IV Definition 4.7.1).

**API.**

- `CategoryTheory.MonoidalAction` (structure): An action of a monoidal category S on X: a functor S × X ⥤ X with coherent associativity and unit isomorphisms.
- `CategoryTheory.MonoidalActionCategory` (constructor): MonoidalActionCategory S X : the category ⟨S, X⟩ (not Mathlib's ActionCategory of a monoid acting on a type).
- `CategoryTheory.MonoidalActionCategory.loc` (constructor): loc S X := MonoidalActionCategory S (S × X), the category S⁻¹X.
- `CategoryTheory.MonoidalActionCategory.proj` (projection): The projection S⁻¹X ⥤ ⟨S, S⟩, (s, x) ↦ s.
- `CategoryTheory.MonoidalActionCategory.incl` (data): The functor X ⥤ S⁻¹X, x ↦ (e, x), and the translations X ⥤ S⁻¹X, x ↦ (s, x).
- `CategoryTheory.MonoidalActionCategory.contractible_self` (example): If S is a groupoid, ⟨S, S⟩ has initial object e, so its classifying space is contractible.

**Unit tests.**

- `actionCategory_trivial_action` (degenerate): For the trivial monoidal category acting on X, ⟨S, X⟩ ≌ X.
- `actionCategory_nat_telescope` (computation): For S = ℕ acting on ⊔ X_n through a sequence of functors, ⟨S, X⟩ is the mapping telescope category (Weibel IV Exercise 4.2).
- `actionCategory_monoid_set` (compatibility): For a discrete X with the action of a monoid M = π₀ S on its objects, ⟨S, X⟩ agrees with the translation category of H.1/translation-category-classifying-space when S is discrete.
- `actionCategory_not_X` (non-example): For S = ℕ acting on itself by addition, ⟨S, S⟩ is the poset ℕ (contractible), not the discrete category ℕ.

**Uses.** H.4/quillen-localization-of-homology: Theorem 4.8 is a statement about S⁻¹X for all X; H.4/S-inverse-S-fibration: S⁻¹S → S⁻¹X → ⟨S, X⟩ is a homotopy fibration for monic X; GeneralAlgebraicKTheory:K.2:plus: the + = Q theorem uses ⟨S, EA⟩ and S⁻¹EA (Weibel IV §7).

**Acceptance.** If every arrow of S is an isomorphism, e is initial in ⟨S, S⟩ and B⟨S, S⟩ is contractible. For S = ℕ acting on ⊔ X_n via a sequence X₀ → X₁ → ⋯, ⟨ℕ, X⟩ is the mapping telescope (Weibel IV Exercise 4.2).

**Prerequisites.** `H.4/symmetric-monoidal-groupoid-core`, `H.1/translation-category-classifying-space`.

**Sources.** Weibel-KBook-IV, Definitions 4.7 and 4.7.1, p. IV.41.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Basic`, namespace `CategoryTheory`.

#### `H.4/S-inverse-S-pi0` — π₀ of S⁻¹S is the Grothendieck group of the monoid of components

*Lemma.* The canonical map from the Grothendieck group of the commutative monoid π₀(S) = S^iso to π₀ B(S⁻¹S) induced by m ↦ (m, e) is an isomorphism of abelian groups, inverse to (m, n) ↦ [m] − [n]. Hence K₀(S) = π₀ B(S⁻¹S) agrees with Mathlib's Algebra.GrothendieckGroup of the monoid of isomorphism classes, and for S = Core of an additive category with ⊞ with Tau Ceti's SplitK0.

**Hypotheses.** S symmetric monoidal groupoid with faithful translations.

**Construction or proof outline.**

1. The function α(m, n) = [m] − [n] is invariant along both kinds of morphisms of S⁻¹S, hence defines π₀ B(S⁻¹S) → Algebra.GrothendieckGroup π₀(S) (H.1/pi0-classifying-space); it is inverse to the map from the universal property (Algebra.GrothendieckGroup.lift) (Weibel IV Lemma 4.3.1).
2. Compare with TauCeti.SplitK0.grothendieckAddGroupEquiv for additive categories.

**Acceptance.** For S = F(R) (based free modules), K₀(S) = ℤ, not K₀(R). For S = iso P(R), K₀(S) = K₀(R).

**Prerequisites.** `H.4/symmetric-monoidal-S-inverse-S`, `mathlib:Algebra.GrothendieckGroup`, `mathlib:Algebra.GrothendieckGroup.lift`, `tauceti:TauCeti.SplitK0.grothendieckAddGroupEquiv`, `H.1/pi0-classifying-space`.

**Sources.** Weibel-KBook-IV, Lemma 4.3.1 with proof, p. IV.38.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Basic`, namespace `CategoryTheory`.

#### `H.4/group-completion` — Group completions of homotopy-commutative H-spaces

*Definition.* Let X be a homotopy-commutative, homotopy-associative H-space. A group completion of X is an H-space map f : X → Y to an H-space Y such that π₀(Y) is the group completion of the commutative monoid π₀(X) (via f) and, for every commutative ring k, the induced map identifies H_*(Y; k) with the localisation π₀(X)⁻¹ H_*(X; k) of the Pontryagin ring at the multiplicative set π₀(X) ⊂ H₀(X; k). When X is a CW complex, Y is taken to be one, and is then group-like.

**Hypotheses.** X, Y H-spaces (Mathlib HSpace) that are homotopy associative and commutative; Y a CW complex when X is.

**Construction or proof outline.**

1. Define IsGroupCompletion f by the π₀ condition (Algebra.GrothendieckGroup universal map is an isomorphism) and the homology condition for all k (Weibel IV Definition 4.4).
2. The Pontryagin product makes H_*(X; k) a graded-commutative ring with H₀ = k[π₀X] (Weibel IV p. 38, citing [Wh, III.7]).

**API.**

- `TauCeti.IsGroupCompletion` (constructor): IsGroupCompletion f :↔ f is an H-map ∧ π₀ f is a group completion of monoids ∧ ∀ k, H_*(Y; k) ≅ π₀(X)⁻¹ H_*(X; k) via f.
- `TauCeti.IsGroupCompletion.pi0Equiv` (projection): π₀(Y) ≃ Algebra.GrothendieckGroup π₀(X).
- `TauCeti.IsGroupCompletion.homologyLocalization` (projection): The induced map π₀(X)⁻¹ H_*(X; k) → H_*(Y; k) is an isomorphism of rings.
- `TauCeti.IsGroupCompletion.of_groupLike` (example): If X is group-like, 𝟙 X is a group completion.
- `TauCeti.IsGroupCompletion.basepointComponent` (projection): For a group completion of a CW complex, the basepoint component Y₀ is an H-space with π₁(Y₀) abelian.

**Unit tests.**

- `isGroupCompletion_id_groupLike` (degenerate): For a homotopy-commutative group-like H-space G (for example an abelian topological group), the identity of G is a group completion.
- `isGroupCompletion_N_to_Z` (computation): The inclusion ℕ → ℤ of discrete monoids is a group completion.
- `isGroupCompletion_pi0_compat` (compatibility): For a group completion, π₀ f agrees with Algebra.GrothendieckGroup.of under the identification π₀(Y) ≃ Algebra.GrothendieckGroup π₀(X).
- `not_isGroupCompletion_pi0_only` (non-example): The map ⊔_n BΣ_n → ℤ (discrete) inducing the group completion on π₀ is not a group completion: it fails the homology condition (the correct target is ℤ × BΣ_∞⁺).

**Uses.** H.4/quillen-localization-of-homology: B(S⁻¹S) is a group completion of BS; H.4/gl-telescope-plus-comparison: Z × BGL(R)⁺ is a group completion of ⊔ BGL_n(R); CalmesEtAl GW of ℤ (Section 3.2): GW^s_cl(ℤ) is defined as the homotopy-theoretic group completion of the groupoid of forms.

**Acceptance.** For a group-like X, the identity is a group completion (Weibel IV Lemma 4.4.1). BS → B(S⁻¹S) is a group completion (H.4/quillen-localization-of-homology).

**Prerequisites.** `mathlib:HSpace`, `mathlib:Algebra.GrothendieckGroup`, `H.4/classifying-space-hspace`.

**Sources.** Weibel-KBook-IV, Definition 4.4, p. IV.38.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Basic`, namespace `TauCeti`.

#### `H.4/action-projection-cofibred` — The projection S⁻¹X → ⟨S, S⟩ is cofibred

*Lemma.* If S = Core S has faithful translations and S acts on X, the projection ρ : S⁻¹X → ⟨S, S⟩, (s, x) ↦ s, is cofibred (precofibred with cobase changes composing coherently) with fibre over s isomorphic to X, the cobase change along a morphism of ⟨S, S⟩ represented by (t, t □ s ≅ s′) being the translation x ↦ t □ x.

**Hypotheses.** S a symmetric monoidal groupoid with faithful translations.

**Construction or proof outline.**

1. Construct, for each (s, x) and each morphism s → s′ of ⟨S, S⟩, a cocartesian lift using the representative (t, φ); faithfulness of translations makes the representative unique up to unique isomorphism, so the lift is well defined (Weibel IV Exercise 4.5, Quillen; statement only in the source, proof packet-authored).

**Acceptance.** For X = point, ρ is the identity of ⟨S, S⟩. Used with H.2/functor-homology-spectral-sequence in the proof of Theorem 4.8.

**Prerequisites.** `H.4/monoidal-action-category`, `H.2/prefibred-iff-fibre-adjoint`.

**Sources.** Weibel-KBook-IV, Exercise 4.5, p. IV.46.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Basic`, namespace `CategoryTheory`.

#### `H.4/invertible-action-equivalence` — Invertible actions do not change the homotopy type

*Lemma.* If S = Core S has faithful translations and acts invertibly on X (each translation X → X a homotopy equivalence), then each functor X → S⁻¹X, x ↦ (s, x), is a homotopy equivalence. In particular S⁻¹Y ≃ S⁻¹(S⁻¹Y) for every category Y with an S-action.

**Hypotheses.** S a symmetric monoidal groupoid with faithful translations; the action on X invertible.

**Construction or proof outline.**

1. ρ : S⁻¹X → ⟨S, S⟩ is cofibred with fibre X and cobase changes the translations, which are homotopy equivalences (H.4/action-projection-cofibred); Theorem B for cofibred functors (H.2/quillen-theorem-b-prefibred) gives a homotopy fibre sequence X → S⁻¹X → ⟨S, S⟩, and ⟨S, S⟩ is contractible (Weibel IV Exercise 4.6 hint).

**Acceptance.** S acts invertibly on S⁻¹Y, giving S⁻¹Y ≃ S⁻¹(S⁻¹Y). For X = S with the regular action, which is not invertible unless π₀(S) is a group, the conclusion fails: S → S⁻¹S is not a homotopy equivalence for S = F(R).

**Prerequisites.** `H.4/action-projection-cofibred`, `H.2/quillen-theorem-b-prefibred`, `H.4/monoidal-action-category`.

**Sources.** Weibel-KBook-IV, Exercise 4.6, p. IV.46.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Basic`, namespace `CategoryTheory`.

#### `H.4/quillen-localization-of-homology` — Quillen's theorem: S⁻¹X localises homology; B(S⁻¹S) is a group completion — planet: *Group completion theorem*

*Theorem.* Let S be a symmetric monoidal groupoid with faithful translations acting on a category X, and S⁻¹X = ⟨S, S × X⟩. Then the map (π₀S)⁻¹H_q(X; k) → H_q(S⁻¹X; k) induced by x ↦ (e, x) is an isomorphism for all q and every commutative ring k. In particular BS → B(S⁻¹S) is a group completion (H.4/group-completion).

**Hypotheses.** Every map in S is an isomorphism; translations Aut(s) → Aut(s □ t) are injective.

**Construction or proof outline.**

1. The projection ρ : S⁻¹X → ⟨S, S⟩ is cofibred with fibre X (H.4/action-projection-cofibred).
2. The homology spectral sequence of the cofibred functor ρ has E²_{pq} = H_p(⟨S, S⟩; H_q(X)) ⇒ H_{p+q}(S⁻¹X) (H.2/functor-homology-spectral-sequence).
3. Localising at π₀S ⊂ H₀(S) is exact and π₀S already acts invertibly on H_*(S⁻¹X), giving E²_{pq} = H_p(⟨S, S⟩; M_q) with M_q = (π₀S)⁻¹H_q(X).
4. Each M_q is morphism-inverting, hence a local system on B⟨S, S⟩ (H.1/local-systems-as-functors), and ⟨S, S⟩ is contractible because e is initial; so H_p(⟨S, S⟩; M_q) vanishes for p ≠ 0 (H.1/homology-of-small-categories) and the spectral sequence degenerates (Weibel IV Theorem 4.8 proof, following Grayson's 'Higher algebraic K-theory II', p. 221, not read).
5. The group completion statement follows with Remark 4.2.2 and H.4/S-inverse-S-pi0.

**Acceptance.** K₁(S) = colim_s H₁(Aut(s); ℤ) (Weibel IV Corollary 4.8.1). Barratt–Priddy–Quillen–Segal: for finite sets K(Sets_fin) ≃ ℤ × BΣ_∞⁺ (Weibel IV 4.9.2–4.9.3; the identification with Ω^∞S^∞ is cited, not proved).

**Prerequisites.** `H.4/symmetric-monoidal-S-inverse-S`, `H.4/action-projection-cofibred`, `H.2/functor-homology-spectral-sequence`, `H.1/local-systems-as-functors`, `H.1/homology-of-small-categories`, `H.4/S-inverse-S-pi0`, `H.4/group-completion`.

**Sources.** Weibel-KBook-IV, Definitions 4.7, 4.7.1, (4.7.2) and Theorem 4.8 with proof, pp. IV.41–42.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Basic`, namespace `CategoryTheory`.

#### `H.4/group-completion-uniqueness` — Group completions of group-like H-spaces

*Lemma.* If X is a group-like H-space (CW), X is its own group completion and every group completion f : X → Y is a homotopy equivalence.

**Hypotheses.** X, Y H-spaces of CW type; X group-like (π₀ X a group).

**Construction or proof outline.**

1. f is a homology isomorphism with all coefficients k, hence an isomorphism on π₀ and on π₁ = H₁ of the (abelian) basepoint components.
2. On basepoint components f is a plus construction relative to the trivial subgroup into an H-space; by H.3/plus-hspace-recognition (abelian targets) or directly H.3/hspace-homology-whitehead it is a homotopy equivalence (Weibel IV Lemma 4.4.1, which invokes Theorem 1.5).

**Acceptance.** Pic(R): S and S⁻¹S are homotopy equivalent (Weibel IV Example 4.4.2). ℤ × BGL(R)⁺ is a group completion of ⊔ BGL_n(R) directly (Weibel IV Exercise 4.9).

**Prerequisites.** `H.4/group-completion`, `H.3/hspace-homology-whitehead`.

**Sources.** Weibel-KBook-IV, Lemma 4.4.1 with proof, p. IV.39.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Basic`, namespace `TauCeti`.

#### `H.4/group-completion-uniqueness-countable` — Uniqueness of group completions up to phantom maps

*Theorem.* Group completions are not unique up to homotopy when phantom maps exist: if f : X → Y is a group completion and φ is phantom, f + φ is again one. If π₀(X) is countable or has a countable cofinal submonoid, any two group completions f′ : X → X′, f″ : X → X″ are related by a homotopy equivalence g : X′ → X″, unique up to weak homotopy, with g ∘ f′ weakly homotopic to f″.

**Hypotheses.** H-spaces of CW type; countability of π₀(X) or of a cofinal submonoid.

**Construction or proof outline.**

1. Phantom perturbations preserve the defining homology and π₀ conditions (Weibel IV p. 39).
2. The uniqueness theorem is Caradus–Clarke–McGibbon–Thomason [CCMT, 1.2], quoted by Weibel; its proof is not read (packet gap 'CCMT uniqueness of group completions').

**Acceptance.** Exhibit the dependence of uniqueness on countability; do not state strict uniqueness up to homotopy in general.

**Prerequisites.** `H.4/group-completion`, `H.4/group-completion-uniqueness`.

**Sources.** Weibel-KBook-IV, Phantom maps paragraph and Theorem 4.4.3, p. IV.39.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Basic`, namespace `TauCeti`.

#### `H.4/S-inverse-S-fibration` — The fibration S⁻¹S → S⁻¹X → ⟨S, X⟩

*Lemma.* Suppose every map of X is monic and each translation Aut_S(s) → Aut_X(s □ x) is injective. Then for each object x of X the sequence S⁻¹S → S⁻¹X → ⟨S, X⟩ (s ↦ s □ x, then projection to the second factor) is a homotopy fibre sequence. In particular, if ⟨S, X⟩ is contractible then S⁻¹S → S⁻¹X is a homotopy equivalence.

**Hypotheses.** Every morphism of X monic; translations into Aut_X(s □ x) injective; S a symmetric monoidal groupoid with faithful translations.

**Construction or proof outline.**

1. Show π : S⁻¹X → ⟨S, X⟩ and S⁻¹π : S⁻¹(S⁻¹X) → ⟨S, X⟩ are cofibred and use H.4/invertible-action-equivalence and H.2/quillen-theorem-b-prefibred (Weibel IV Exercise 4.7 hint).

**Acceptance.** Used in the + = Q theorem: ⟨S, EA⟩ contractible gives S⁻¹S ≃ S⁻¹EA (GeneralAlgebraicKTheory:K.2:plus, Weibel IV §7). The invertibility statement 4.7.1 is the special case of the action of S on S⁻¹X.

**Prerequisites.** `H.4/monoidal-action-category`, `H.4/invertible-action-equivalence`, `H.2/quillen-theorem-b-prefibred`.

**Sources.** Weibel-KBook-IV, Exercise 4.7, p. IV.46.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Basic`, namespace `CategoryTheory`.

#### `H.4/plus-hspace-block-sum` — Block sum makes BGL(R)⁺ an H-space and ℤ × BGL(R)⁺ a group completion

*Lemma.* For a ring R, the block-sum homomorphisms GL_m(R) × GL_n(R) → GL_{m+n}(R) ⊂ GL(R) induce maps BGL_m(R) × BGL_n(R) → BGL(R)⁺ which assemble, via the universal property of the plus construction, into a homotopy-associative, homotopy-commutative H-space structure on BGL(R)⁺, natural in R up to homotopy; the resulting map ⊔_n BGL_n(R) → ℤ × BGL(R)⁺ is an H-space map and a group completion (H.4/group-completion), with π₁ = K₁(R) acting trivially on all π_n.

**Hypotheses.** R a ring; plus construction relative to E(R), which is perfect and normal (KTheoryLowDegrees:U.1).

**Construction or proof outline.**

1. Block sum BGL(R) × BGL(R) → BGL(R) → BGL(R)⁺ kills E(R) × E(R) on π₁, and (BGL(R) × BGL(R))⁺ ≃ BGL(R)⁺ × BGL(R)⁺ (Weibel IV Exercise 1.7), so it factors through BGL(R)⁺ × BGL(R)⁺ (H.3/plus-construction-universal-property with abelian target: the target is an H-space once the structure is built inductively on skeleta, Weibel IV Exercise 1.11).
2. Homotopy associativity and commutativity: conjugation by permutation matrices relates the two orders and induces maps homotopic to the identity on BGL(R)⁺ (inner automorphisms act trivially, H.1/conjugate-homomorphisms-freely-homotopic, after plus).
3. The group-completion property: H_*(ℤ × BGL(R)⁺) = ℤ[t, t⁻¹] ⊗ colim H_*(BGL_n(R)) = (π₀)⁻¹H_*(⊔ BGL_n(R)) (Weibel IV Exercise 4.9).

**Acceptance.** The H-space BGL(R)⁺ is abelian, so π₁ = K₁(R) acts trivially on K_n(R) (H.3/hspace-is-abelian), as BorelRegulators requires. BGL(ℤ)⁺ has π₁ = ℤ/2.

**Prerequisites.** `H.3/plus-construction-universal-property`, `H.3/plus-hspace-recognition`, `H.1/conjugate-homomorphisms-freely-homotopic`, `H.4/group-completion`, `KTheoryLowDegrees:U.1/whitehead-lemma`, `KTheoryLowDegrees:U.1/stable-elementary-perfect`, `mathlib:Matrix.GeneralLinearGroup`.

**Sources.** Weibel-KBook-IV, Exercise 1.11, p. IV.15; Exercise 4.9, p. IV.46.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/GL`, namespace `TauCeti`.

#### `H.4/gl-telescope-plus-comparison` — B(S⁻¹S) ≃ ℤ × BGL(R)⁺ for based free modules — planet: *B(S⁻¹S) ≃ ℤ × BGL(R)⁺*

*Theorem.* For a ring R let S = F(R) = ⊔_n GL_n(R), the symmetric monoidal groupoid of based free modules Rⁿ under concatenation and block sum. Then B(S⁻¹S) is a group completion of BS and B(S⁻¹S) ≃ ℤ × BGL(R)⁺, the basepoint component Y_S receiving an acyclic map from BGL(R) (via the mapping telescope) that is a plus construction relative to E(R). The product decomposition is a space-level statement after choosing component representatives; it is not a natural splitting of infinite loop spaces.

**Hypotheses.** E(R) = [GL(R), GL(R)] is a perfect normal subgroup of GL(R) (Whitehead; KTheoryLowDegrees:U.1). The product decomposition uses translations between components, which are not natural (Weibel IV 1.1.2).

**Construction or proof outline.**

1. The homomorphisms η_n : GL_n(R) → Aut_{S⁻¹S}(Rⁿ, Rⁿ), g ↦ (g, 1), are compatible with stabilisation up to the natural transformation η ⇒ η(□R), giving a map from the mapping telescope of BGL_n(R) into the basepoint component Y_S (Weibel IV proof of Theorem 4.9; telescope by H.1/filtered-colimits-of-categories).
2. By Theorem 4.8, H_*(B(S⁻¹S)) is the localisation of H_*(BS) at {eⁿ}, i.e. the colimit along ⊕R, so H_*(B(S⁻¹S)) ≅ H_*(Y_S) ⊗ ℤ[e, e⁻¹] with H_*(Y_S) ≅ colim H_*(BGL_n(R)) = H_*(BGL(R)) (H.1/filtered-colimit-homology).
3. Thus BGL(R) → Y_S is an integral homology isomorphism into an H-space, so H.3/plus-hspace-recognition gives BGL(R)⁺ ≃ Y_S and the map is acyclic.

**Acceptance.** Quadratic forms: K(Quad^ε(A)) ≃ εL₀(A) × BεO⁺ (Weibel IV Example 4.12.2). The components of B(S⁻¹S) are indexed by ℤ = K₀(F(R)), not by K₀(R). Naturality holds for ring maps and block sum up to the stated homotopies; translations between components are not natural.

**Prerequisites.** `H.4/quillen-localization-of-homology`, `H.3/plus-hspace-recognition`, `H.1/filtered-colimit-homology`, `H.4/plus-hspace-block-sum`, `KTheoryLowDegrees:U.1/whitehead-lemma`, `KTheoryLowDegrees:U.1/stable-elementary-perfect`.

**Sources.** Weibel-KBook-IV, Theorem 4.9 with proof, pp. IV.42–43.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/GL`, namespace `TauCeti`.

#### `H.4/cofinal-sequence-plus-comparison` — Group completion with a cofinal sequence of objects

*Theorem.* Let S = Core S be a symmetric monoidal groupoid with faithful translations and a cofinal sequence s_{n+1} = s_n □ a_n (every s has s′ with s □ s′ ≅ s_n for some n), and Aut(S) = colim_n Aut(s_n). Then the commutator subgroup E of Aut(S) is perfect and normal, K₁(S) = Aut(S)/E, the plus construction B Aut(S)⁺ relative to E is the basepoint component of B(S⁻¹S), and B(S⁻¹S) ≃ K₀(S) × B Aut(S)⁺.

**Hypotheses.** S has a cofinal sequence as stated; faithful translations. Perfectness and normality of E are imported from Bass (p. 355), not read (packet gap 'Bass commutator lemma for Aut(S)').

**Construction or proof outline.**

1. The mapping telescope gives an acyclic map from B Aut(S) to the basepoint component of B(S⁻¹S), by the homology computation of H.4/quillen-localization-of-homology as in Theorem 4.9; an acyclic map is by definition a plus construction (H.3/plus-construction-predicate) (Weibel IV Theorem 4.10 proof).
2. E perfect normal and K₁ = Aut(S)/E: Bass, 'essentially on p. 355'.

**Acceptance.** Finite sets: B(S⁻¹S) ≃ ℤ × BΣ_∞⁺ (Barratt–Priddy–Quillen–Segal, Weibel IV 4.9.3). Free G-sets: K(G-Sets_fin) ≃ ℤ × B(G ≀ Σ_∞)⁺ (Weibel IV Example 4.10.1). Hermitian forms over ℤ: the positive components of the classical Grothendieck–Witt spaces are plus constructions of the infinite orthogonal and symplectic groups (H.4/hermitian-group-completion-integers). ε-quadratic forms over a number ring O: every form is an orthogonal summand of an ε-hyperbolic form, so with the hyperbolic sequence every component of the quadratic Grothendieck–Witt space is B O_{∞,∞}(O)⁺ for ε = 1 and B Sp^q_∞(O)⁺ for ε = −1 (Calmès et al. Remark 2.3.20).

**Prerequisites.** `H.4/quillen-localization-of-homology`, `H.3/plus-construction-predicate`, `H.3/acyclic-map-homology-criterion`.

**Sources.** Weibel-KBook-IV, Theorem 4.10 with proof, pp. IV.43–44; CalmesEtAl-HermitianKIII-2026, Remark 2.3.20, pp. 48–49.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Basic`, namespace `CategoryTheory`.

#### `H.4/cofinality-theorem` — Quillen's cofinality theorem for symmetric monoidal groupoids

*Theorem.* Let f : S → T be a cofinal monoidal functor of symmetric monoidal groupoids with faithful translations (for every t there are t′ and s with t □ t′ ≅ f(s)). (a) If T acts on X then S acts via f and S⁻¹X ≃ T⁻¹X. (b) If Aut_S(s) ≅ Aut_T(f s) for all s, the basepoint components of K(S) = B(S⁻¹S) and K(T) are homotopy equivalent, so K_n(S) ≅ K_n(T) for n ≥ 1 (K₀ may differ).

**Hypotheses.** f cofinal and monoidal; for (b) f induces isomorphisms on automorphism groups.

**Construction or proof outline.**

1. (a) By cofinality S acts invertibly on X iff T does; H.4/invertible-action-equivalence gives S⁻¹X ≃ T⁻¹(S⁻¹X) ≅ S⁻¹(T⁻¹X) ≃ T⁻¹X (Weibel IV Theorem 4.11 proof).
2. (b) Theorem 4.8 gives H_*(Y_S) = colim_{s∈S} H_*(B Aut(s)) = colim_{s∈S} H_*(B Aut(fs)) ≅ colim_{t∈T} H_*(B Aut(t)) = H_*(Y_T) using cofinality of the translation categories (H.4/quillen-localization-of-homology).
3. The induced H-space map Y_S → Y_T is an integral homology isomorphism of connected H-spaces, hence a homotopy equivalence (H.3/hspace-homology-whitehead).

**Acceptance.** The one-object subcategory R^× is cofinal in Pic(R) (Weibel IV p. 44). F(R) → iso P(R) is cofinal (H.4/cofinality-projective-modules).

**Prerequisites.** `H.4/invertible-action-equivalence`, `H.4/quillen-localization-of-homology`, `H.3/hspace-homology-whitehead`.

**Sources.** Weibel-KBook-IV, Cofinality Theorem 4.11 with proof, pp. IV.44–45.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Basic`, namespace `CategoryTheory`.

#### `H.4/cofinality-projective-modules` — Cofinality: the group completion of iso P(R) is K₀(R) × BGL(R)⁺ — planet: *Cofinality theorem*

*Theorem.* For a ring R and S = iso P(R) (finitely generated projective modules and isomorphisms, under ⊕), B(S⁻¹S) ≃ K₀(R) × BGL(R)⁺, the basepoint component being BGL(R)⁺ via the cofinal inclusion F(R) → iso P(R) (every finitely generated projective module is a direct summand of a finite free module). The comparison preserves components and is natural in ring maps up to homotopy; it is not a natural product splitting.

**Hypotheses.** Every finitely generated projective R-module is a direct summand of a finite free module (KTheoryLowDegrees:Z.1). F(R) → iso P(R) induces isomorphisms on automorphism groups of the free modules.

**Construction or proof outline.**

1. F(R) → iso P(R) is cofinal (KTheoryLowDegrees:Z.1; Weibel IV Example 4.1.1(c)).
2. Combine H.4/cofinality-theorem(b) with H.4/gl-telescope-plus-comparison for the basepoint component, and H.4/S-inverse-S-pi0 for π₀ = K₀(R) (Weibel IV Corollary 4.11.1).

**Acceptance.** Check K₀(F(R)) = ℤ against K₀(iso P(R)) = K₀(R) for a ring with nontrivial projective modules. Consumers must use this component-preserving comparison, not a claimed natural product splitting.

**Prerequisites.** `H.4/cofinality-theorem`, `H.4/gl-telescope-plus-comparison`, `H.4/S-inverse-S-pi0`, `KTheoryLowDegrees:Z.1/free-summand-data`.

**Sources.** Weibel-KBook-IV, Corollary 4.11.1, p. IV.45; Example 4.1.1(c), p. IV.36.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/GL`, namespace `TauCeti`.

#### `H.4/strictification-independence` — Independence of the group completion from strictification

*Lemma.* A strong symmetric monoidal functor F : S → T between symmetric monoidal groupoids with faithful translations induces a functor S⁻¹S → T⁻¹T (well defined up to natural isomorphism, using the monoidal structure isomorphisms of F), and if F is an equivalence of categories then B(S⁻¹S) → B(T⁻¹T) is a homotopy equivalence. Hence K(S) does not depend on replacing S by a strict (or skeletal) model, and naturally isomorphic monoidal functors induce homotopic maps.

**Hypotheses.** F strong symmetric monoidal (structure isomorphisms F(s) □ F(t) ≅ F(s □ t), F(e) ≅ e).

**Construction or proof outline.**

1. Define F⁻¹F : S⁻¹S → T⁻¹T on objects (m, n) ↦ (Fm, Fn) and on morphisms by transporting (s, f, g) with the structure isomorphisms; coherence (Mathlib's monoidal coherence) makes this a functor.
2. A monoidal natural isomorphism F ≅ F′ induces a natural isomorphism F⁻¹F ≅ F′⁻¹F′, hence a homotopy (H.1/natural-transformations-adjoints-contractibility).
3. If F is an equivalence with monoidal inverse G, then G⁻¹G is a homotopy inverse. Alternatively compare homology through H.4/quillen-localization-of-homology. (Weibel IV Exercise 4.4 is the case S^op; the general lemma is packet-authored, answering the roadmap's strictification requirement.)

**Acceptance.** The skeleton of iso P(R) (a strict model) gives a homotopy equivalent K-theory space. K(S) ≃ K(S^op) (Weibel IV Exercise 4.4).

**Prerequisites.** `H.4/symmetric-monoidal-S-inverse-S`, `H.1/natural-transformations-adjoints-contractibility`, `H.4/quillen-localization-of-homology`.

**Sources.** Weibel-KBook-IV, Exercise 4.4, p. IV.46.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Basic`, namespace `CategoryTheory`.

#### `H.4/gamma-space` — Special Γ-spaces (E∞-monoids in Segal's model)

*Definition.* Let Fin_* be the category of finite pointed sets [n] = {0, 1, …, n} pointed at 0. A (special) Γ-space, or E∞-monoid in Segal's strict model, is a functor X : Fin_* ⥤ SSet such that X([0]) is weakly contractible and each Segal map X([n]) → ∏_{i=1}^n X([1]), induced by the maps [n] → [1] collapsing everything except i to 0, is a weak homotopy equivalence (of realisations). π₀X := π₀|X([1])| is a commutative monoid via [2] → [1] (sending only 0 to 0); X is grouplike if π₀X is a group.

**Hypotheses.** Strict functors to simplicial sets (Kan complexes when needed); the ∞-categorical E∞-monoids of Bhatt–Scholze Definition 12.4 are modelled by these, which is the comparison recorded in EnhancedDerivedSheaves:E5:abstract.

**Construction or proof outline.**

1. Define the Segal maps and the conditions (Carlsson §1.2 Definition 1; Bhatt–Scholze Definition 12.4).
2. The monoid structure on π₀ comes from the addition map X([1]) × X([1]) ≃ X([2]) → X([1]) (Bhatt–Scholze p. 56).

**API.**

- `TauCeti.GammaSpace` (structure): A functor Fin_* ⥤ SSet (Fin_* modelled as finite pointed types or NonemptyFinLinOrd-free skeleton [n]).
- `TauCeti.GammaSpace.IsSpecial` (constructor): The Segal conditions: X [0] weakly contractible and Segal maps weak equivalences.
- `TauCeti.GammaSpace.pi0Monoid` (data): The commutative monoid π₀ X([1]) under the addition induced by [2] → [1].
- `TauCeti.GammaSpace.IsGrouplike` (constructor): IsGrouplike X :↔ π₀ X is a group.
- `TauCeti.GammaSpace.underlying` (projection): The underlying space |X([1])|, pointed by X([0]).

**Unit tests.**

- `gammaSpace_const_point_special` (degenerate): The constant Γ-space at a point is special and grouplike.
- `gammaSpace_discrete_abelian` (computation): For an abelian group A, the discrete Γ-space [n] ↦ Aⁿ is special with π₀ = A.
- `gammaSpace_pi0_compat` (compatibility): For the Γ-space of a commutative monoid M ([n] ↦ Mⁿ, discrete), pi0Monoid is M with its own addition.
- `gammaSpace_not_special_two_points` (non-example): The constant Γ-space at a two-point discrete simplicial set is not special: X([0]) is not contractible and the Segal map X([2]) → X([1])² is not a bijection on π₀.

**Uses.** H.4/segal-gamma-space-delooping: Segal's machine turns special Γ-spaces into connective spectra; H.4/coherent-subset-construction: the Γ-space N(C) of a symmetric monoidal groupoid; KTheoryLowDegrees:Z.3/ring-spectrum-det: Bhatt–Scholze §12 builds det : K(R) → Pic^ℤ(R) through E∞-monoids.

**Acceptance.** The constant functor at a point is a special Γ-space with π₀ = 0. For an abelian group A, [n] ↦ Aⁿ (discrete) is a grouplike special Γ-space.

**Prerequisites.** `mathlib:SSet`, `H.2/weak-homotopy-equivalence`.

**Sources.** BhattScholze-WittGrassmannian-2017, Appendix §12, Definition 12.4, p. 56; Carlsson-Deloopings-Handbook-2005, §1.2, Definition 1, printed p. 6 (PDF 20).

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Segal`, namespace `TauCeti`.

#### `H.4/segal-gamma-space-delooping` — Segal's Γ-space construction from categories with sums and the delooping machine

*Construction.* For a category C with a zero object and categorical sums, Sum_C(X) is the category of summing functors on subsets of a finite pointed set X (φ(∅) a zero object and φ(S) ⊕ φ(T) → φ(S ∪ T) an isomorphism when S ∩ T = {∗}) with natural isomorphisms; Sp₁(C) = N ∘ Sum_C(−) is a special Γ-space, iterating gives Sp_n(C) and maps σ_n : Sp_n(C) → ΩSp_{n+1}(C). Segal's theorem (quoted): σ_n are weak equivalences for n ≥ 1, σ₀ is a group completion, and the construction gives a functor to connective Ω-spectra; for finite sets it gives the sphere spectrum, for finitely generated projective modules the K-theory spectrum.

**Hypotheses.** C has a zero object and categorical sums, and functors preserve them; symmetric monoidal categories without categorical sums (such as iso P(R)) use H.4/coherent-subset-construction instead. Carlsson prints the range 'n > 1'; the delooping for n ≥ 1 is Segal's Proposition 1.4 (Bhatt–Scholze Proposition 12.10), recorded in H.4/segal-delooping-theorem.

**Construction or proof outline.**

1. Sum_C(f)(φ)(S) = φ(f⁻¹(S)) makes Sum_C a functor Fin_* → CAT (Carlsson §1.2).
2. Proposition 2: Sum_C(∅) is the contractible category of zero objects; Sum_C(n) → ∏ Sum_C(1) is an equivalence with inverse θ(φ₁, …, φ_n)({i₁, …, i_s}) = φ_{i₁}(1) ⊕ ⋯ ⊕ φ_{i_s}(1) (proof given), so Sp₁(C) is special (H.1/adjunction-homotopy-equivalence).
3. Sum_C(X) again has zero objects and sums, so the construction iterates; Sum_C(1) ≃ C gives ΣN.C → Sp₁(C) and adjoints σ_n.
4. The delooping and group-completion statements are H.4/segal-delooping-theorem.

**API.**

- `TauCeti.summingFunctors` (constructor): summingFunctors C X : the category Sum_C(X) for C with zero object and binary coproducts.
- `TauCeti.segalGammaSpace` (constructor): segalGammaSpace C : GammaSpace, [n] ↦ nerve (summingFunctors C [n]).
- `TauCeti.segalGammaSpace.isSpecial` (characterisation): segalGammaSpace C is special (Carlsson Proposition 2).
- `TauCeti.segalGammaSpace.map` (functoriality): A functor preserving zero objects and sums induces a map of Γ-spaces, functorially.
- `TauCeti.segalSpectrum` (constructor): The Ω-spectrum obtained by iterating (H.4/segal-delooping-theorem), with levels Sp_n(C).

**Unit tests.**

- `segalGammaSpace_finset_sphere` (computation): For finite sets under ⊔, the associated spectrum is the sphere spectrum (Barratt–Priddy–Quillen–Segal; quoted).
- `segalGammaSpace_zero_category` (degenerate): For C the category with one object (a zero object), segalGammaSpace C is the constant point.
- `segalGammaSpace_pi0_K0` (compatibility): For C = finitely generated projective R-modules, π₀ of the group completion is K₀(R) = Algebra.GrothendieckGroup of isomorphism classes.
- `segalGammaSpace_not_without_sums` (non-example): iso P(R) has no categorical sums (⊕ is not a coproduct in the groupoid), so Sum_C does not apply to it directly.

**Uses.** H.5:spectra/connective-spectra-via-deloopings: Segal's machine produces connective Ω-spectra from special Γ-spaces; KTheoryLowDegrees:Z.3/graded-line-components: the K-theory spectrum of a symmetric monoidal groupoid via E∞-monoids; Weibel IV Machine Methods 4.5.2: infinite loop space machines produce K(S) and the K-theory spectrum.

**Acceptance.** For an abelian group A the bar construction B^n.A gives the Eilenberg–Mac Lane spectrum, a case not induced by categorical sums (Carlsson §1.2 and p. 9). Compare π₀ of the resulting spectrum with the Grothendieck group of the monoid of components.

**Prerequisites.** `H.4/gamma-space`, `H.1/adjunction-homotopy-equivalence`, `H.4/segal-delooping-theorem`.

**Sources.** Carlsson-Deloopings-Handbook-2005, §1.2, Definition 1, Proposition 2 with proof, Theorem 3, Examples 4–5, printed pp. 6–8 (PDF 20–22).

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Segal`, namespace `TauCeti`.

#### `H.4/coherent-subset-construction` — The Segal E∞-monoid N(C) of a symmetric monoidal groupoid

*Construction.* For a symmetric monoidal groupoid C and a finite pointed set (S, s), N(C)(S) is the nerve of the groupoid of families (X_T)_{T ⊆ S∖{s}} of objects of C with an isomorphism X_∅ ≅ 1 and compatible isomorphisms X_{T⊔T′} ≅ X_T ⊗ X_{T′} for disjoint T, T′ (compatible with the unit, associativity and symmetry constraints); a pointed map f : (S, s) → (S′, s′) sends (X_T) to (X_{f⁻¹(T′)})_{T′}. This is a strict functor Fin_* → Kan complexes and a special Γ-space with π₀ N(C) = C/≅ (Bhatt–Scholze Construction 12.5, with the nullary unit condition added).

**Hypotheses.** C a symmetric monoidal groupoid; the unit condition X_∅ ≅ 1 is required (Bhatt–Scholze omit it: the known issue PAPER-BHATT-SCHOLZE-17/E54).

**Construction or proof outline.**

1. Define the groupoid of coherent families and the functoriality by preimages, a strict functor (Bhatt–Scholze Construction 12.5).
2. The Segal map N(C)([n]) → N(C)^n, (X_T) ↦ (X_{{1}}, …, X_{{n}}), is an equivalence of groupoids: a family is determined up to unique isomorphism by its singletons, using the symmetric monoidal axioms (Mac Lane coherence, Mathlib); nerves of groupoids are Kan (H.1/groupoid-nerve-one-type).
3. π₀ = isomorphism classes with ⊗ (Bhatt–Scholze proof of Proposition 12.15).

**API.**

- `TauCeti.coherentSubsetGammaSpace` (constructor): coherentSubsetGammaSpace C : GammaSpace, the strict model N(C).
- `TauCeti.coherentSubsetGammaSpace.isSpecial` (characterisation): coherentSubsetGammaSpace C is special.
- `TauCeti.coherentSubsetGammaSpace.pi0Equiv` (equivalence): pi0Monoid (coherentSubsetGammaSpace C) ≃ the monoid of isomorphism classes of C under ⊗.
- `TauCeti.coherentSubsetGammaSpace.map` (functoriality): A strong symmetric monoidal functor induces a map of Γ-spaces, compatible with composition up to natural isomorphism of groupoids.
- `TauCeti.coherentSubsetGammaSpace.level_one` (characterisation): N(C)([1]) is the nerve of C (up to the unit identification).

**Unit tests.**

- `coherentSubset_level_zero` (degenerate): N(C)([0]) is the nerve of a groupoid with one object up to unique isomorphism (X_∅ ≅ 1), hence contractible; without the unit condition it would be the nerve of C, not contractible.
- `coherentSubset_vect_pi0` (computation): For C = Vect(ℤ) under ⊕, π₀ N(C) = ℕ (ranks).
- `coherentSubset_pic_grouplike` (characterisation): For C = Pic(R), N(C) is grouplike with π₀ = Pic(R).
- `coherentSubset_naive_not_functor` (non-example): The naive assignment S ↦ N(C)^{S∖{s}} with f ↦ (⊗_{t ∈ f⁻¹(t′)} X_t) is not strictly functorial (Bhatt–Scholze Remark 12.6).

**Uses.** KTheoryLowDegrees:Z.3/ring-spectrum-det: K(C) for C = Vect(R) and Pic^ℤ(R) is defined from N(C) (Bhatt–Scholze Definition 12.13); H.4/picard-groupoid-grouplike: a symmetric monoidal groupoid is Picard iff N(C) is grouplike; H.4/group-completion-adjunction: K(C) = ΩB N(C) as a grouplike E∞-monoid.

**Acceptance.** For C = Vect(R) under ⊕, N(C) is the E∞-monoid whose group completion is the K-theory space of R. For C = Pic(R) under ⊗, N(C) is already grouplike.

**Prerequisites.** `H.4/gamma-space`, `H.4/symmetric-monoidal-groupoid-core`, `H.1/groupoid-nerve-one-type`.

**Sources.** BhattScholze-WittGrassmannian-2017, Appendix §12, Construction 12.5 and Remark 12.6, pp. 56–57.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Segal`, namespace `TauCeti`.

#### `H.4/segal-delooping-theorem` — Segal's delooping theorem for special Γ-spaces — planet: *Segal's delooping theorem*

*Theorem.* For a special Γ-space X, let BX be the realisation of the simplicial space obtained by restricting X along Segal's functor Δ^op → Fin_*, [m] ↦ [m]; BX carries a special Γ-space structure and there is a natural map X → ΩBX. If X is k-connected then BX is (k+1)-connected; X → ΩBX is a weak equivalence iff X is grouplike; π₀(ΩBX) = π₁(BX) is the group completion of π₀(X); and for grouplike X the sequence X, BX, B²X, … is a connective Ω-spectrum.

**Hypotheses.** X special; realisations of simplicial spaces as in H.2/simplicial-space-realisation.

**Construction or proof outline.**

1. Segal 1974, Proposition 1.4 (quoted by Bhatt–Scholze Proposition 12.10); its proof is not read (packet gap 'Segal delooping proof'). The ingredients are H.2/levelwise-fibration-realisation applied to the simplicial path fibration and H.4/quillen-localization-of-homology style homology computation for the group-completion statement.
2. π₀(ΩBX) = π₁(BX) (Bhatt–Scholze Remark 12.11, with the misprint π₁(X) corrected, known issue PAPER-BHATT-SCHOLZE-17/E20).

**Acceptance.** For X the discrete Γ-space of an abelian group A, B^n X realises to K(A, n), recovering the Eilenberg–Mac Lane spectrum. For finite sets, ΩB N(Fin) ≃ ℤ × BΣ_∞⁺ ≃ Ω^∞S^∞.

**Prerequisites.** `H.4/gamma-space`, `H.2/simplicial-space-realisation`, `H.2/levelwise-fibration-realisation`.

**Sources.** BhattScholze-WittGrassmannian-2017, Appendix §12, Proposition 12.10 and Remark 12.11, p. 58.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Segal`, namespace `TauCeti`.

#### `H.4/group-completion-adjunction` — Group completion as a left adjoint

*Theorem.* The functor X ↦ X^gp := ΩBX from special Γ-spaces (E∞-monoids) to grouplike ones is left adjoint to the inclusion of grouplike E∞-monoids, at the level of homotopy theories (Bhatt–Scholze Corollary 12.12); the unit X → ΩBX is a group completion in the sense of H.4/group-completion for X = N(C), and for C a symmetric monoidal groupoid with faithful translations ΩB N(C) ≃ B(C⁻¹C).

**Hypotheses.** Statements at the level of the ∞-categories (or homotopy categories) of E∞-monoids; the comparison with Quillen's S⁻¹S model uses H.4/quillen-localization-of-homology and uniqueness of group completions (H.4/group-completion-uniqueness-countable for countable π₀).

**Construction or proof outline.**

1. Adjunction: Bhatt–Scholze Corollary 12.12, from Proposition 12.10 (H.4/segal-delooping-theorem).
2. Comparison with S⁻¹S: both maps BC → ΩB N(C) and BC → B(C⁻¹C) are group completions (homology localisation), hence related by an equivalence for countable π₀ (H.4/group-completion-uniqueness-countable); Weibel 4.5.2 cites May–Thomason for the uniqueness of machines (not read).

**Acceptance.** For C = Pic(R), the unit is an equivalence (C is Picard). For C = Vect(R), ΩB N(C) ≃ K₀(R) × BGL(R)⁺ by H.4/cofinality-projective-modules.

**Prerequisites.** `H.4/segal-delooping-theorem`, `H.4/coherent-subset-construction`, `H.4/quillen-localization-of-homology`, `H.4/group-completion-uniqueness-countable`.

**Sources.** BhattScholze-WittGrassmannian-2017, Appendix §12, Corollary 12.12, p. 58.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Segal`, namespace `TauCeti`.

#### `H.4/picard-groupoid-grouplike` — Picard groupoids are exactly the grouplike N(C)

*Lemma.* A symmetric monoidal groupoid C is a Picard groupoid (every object invertible under ⊗) iff the E∞-monoid N(C) is grouplike; then N(C) → ΩB N(C) is an equivalence, the underlying space of K(C) is the 1-truncated space |N(C)|, and K(C) is a 1-truncated connective spectrum (H.5:spectra/picard-one-truncated-spectra).

**Hypotheses.** C a symmetric monoidal groupoid.

**Construction or proof outline.**

1. π₀ N(C) is the monoid of isomorphism classes under ⊗ (H.4/coherent-subset-construction), a group iff every object is invertible (Bhatt–Scholze Proposition 12.15 proof).
2. Grouplike gives N(C) ≃ ΩB N(C) (H.4/segal-delooping-theorem); |N(C)| is 1-truncated (H.1/groupoid-nerve-one-type).

**Acceptance.** Pic(R) and Pic^ℤ(R) are Picard groupoids. Vect(R) under ⊕ is not Picard (rank is additive and nonnegative).

**Prerequisites.** `H.4/coherent-subset-construction`, `H.4/segal-delooping-theorem`, `H.1/groupoid-nerve-one-type`.

**Sources.** BhattScholze-WittGrassmannian-2017, Appendix §12, Proposition 12.15 and the paragraph after it, pp. 58–59.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Segal`, namespace `TauCeti`.

#### `H.4/hermitian-group-completion-integers` — Classical Grothendieck–Witt spaces of the integers as plus constructions

*Application.* The classical Grothendieck–Witt spaces GW_cl(ℤ) of the integers are the group completions B(S⁻¹S) of the symmetric monoidal groupoids S of nondegenerate forms over ℤ under orthogonal sum. In each case below every form is an orthogonal summand of one in the stated cofinal sequence, the colimit automorphism group has perfect commutator subgroup, and H.4/cofinal-sequence-plus-comparison identifies the positive (basepoint) component with a plus construction: symmetric forms, π₀ = ℤ ⊕ ℤ (generated by ⟨1⟩, ⟨−1⟩), component B O_{⟨∞,∞⟩}(ℤ)⁺; symplectic forms, π₀ = ℤ, component B Sp_∞(ℤ)⁺; quadratic forms, π₀ = ℤ ⊕ ℤ (H and E₈), component B O_{∞,∞}(ℤ)⁺; (−1)-quadratic forms, π₀ = ℤ ⊕ ℤ/2 (rank and Arf invariant), component B Sp^q_∞(ℤ)⁺.

**Hypotheses.** The classification of forms over ℤ (Serre; Browder for the Arf invariant) and the perfectness of the commutator subgroups are inputs quoted by Calmès et al., not proved here.

**Construction or proof outline.**

1. Apply H.4/cofinal-sequence-plus-comparison to S with the cofinal sequence n·(⟨1⟩ ⊥ ⟨−1⟩), n·H_s, n·H_q, n·H⁰_{−q} respectively (Calmès et al. §3.2, cases (1)-symmetric, (−1)-symmetric, (1)-quadratic, (−1)-quadratic).
2. π₀ is the Grothendieck group of isomorphism classes (H.4/S-inverse-S-pi0) computed from the classification theorems quoted there.

**Acceptance.** π₀ GW^q_cl(ℤ) = ℤ ⊕ ℤ with generators H and E₈ (Calmès et al. p. 55). π₀ GW^{−q}_cl(ℤ) has 2-torsion, from the Arf invariant.

**Prerequisites.** `H.4/cofinal-sequence-plus-comparison`, `H.4/S-inverse-S-pi0`.

**Sources.** CalmesEtAl-HermitianKIII-2026, Section 3.2, pp. 54–55, cases (1)-symmetric through (−1)-quadratic.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Hermitian`, namespace `TauCeti`.

#### `H.4/simplicial-ring-topological-realisation` — Topological variants of functors on rings via simplicial rings

*Construction.* For a functor F from rings to spaces (or spectra) and a topological ring A (for example ℝ), the topological variant is F^top(A) = |n ↦ F(C(Δⁿ, A))|, the realisation of F applied to the simplicial ring of continuous maps from the topological n-simplex with pointwise operations; there is a natural map F(A) → F^top(A) from the 0-simplices. For F = K, GW, L this gives K^top, GW^top, L^top of ℝ.

**Hypotheses.** F a functor to simplicial sets or spaces (realisations as in H.2/simplicial-space-realisation); A a topological ring.

**Construction or proof outline.**

1. The simplicial ring n ↦ C(Δⁿ, A) uses Mathlib's topological simplices (SimplexCategory.toTop) and pointwise ring structure; apply F levelwise and realise (Calmès et al. Lemma 3.2.11 proof, following Schlichting §10).
2. The comparisons K^top(ℝ) ≃ ko, GW^top₀ = GW₀ and the 1-connective cover identifications are quoted from Schlichting 2017 (not read; packet gap 'Topological K-theory of ℝ via simplicial rings').

**API.**

- `TauCeti.topologicalVariant` (constructor): topologicalVariant F A := realisation of n ↦ F (C(Δⁿ, A)) as a simplicial ring.
- `TauCeti.topologicalVariant.unit` (data): The natural map F A → topologicalVariant F A from 0-simplices.
- `TauCeti.topologicalVariant.map` (functoriality): Natural in F and in continuous ring maps A → A′.
- `TauCeti.simplicialRingOfContinuous` (constructor): The simplicial ring n ↦ C(SimplexCategory.toTop n, A) with pointwise operations.

**Unit tests.**

- `topologicalVariant_const` (degenerate): For a constant functor F, topologicalVariant F A ≃ F A.
- `topologicalVariant_discrete_ring` (computation): For A with the discrete topology, C(Δⁿ, A) = A and topologicalVariant F A ≃ F A.
- `topologicalVariant_pi0_K` (compatibility): π₀ K^top(ℝ) = K₀(ℝ) = ℤ.
- `topologicalVariant_not_discrete_K1` (non-example): π₁ K^top(ℝ) = ℤ/2 differs from K₁(ℝ) = ℝ^×: the topological variant is not the algebraic K-theory.

**Uses.** CalmesEtAl, Lemma 3.2.11: comparison of GW of ℝ with topological orthogonal and symplectic spaces; RefinedTraceMethods:RT.4:topological: topological K-theory of real and complex numbers as the connective covers ko, ku.

**Acceptance.** For F constant, F^top(A) = F(A). K^top(ℝ) ≃ ko, so π₁K^top(ℝ) = ℤ/2 (quoted).

**Prerequisites.** `H.2/simplicial-space-realisation`, `mathlib:SimplexCategory.toTop`.

**Sources.** CalmesEtAl-HermitianKIII-2026, Section 3.2, proof of Lemma 3.2.11, p. 59.

**Suggested home.** `TauCeti/AlgebraicTopology/GroupCompletion/Topological`, namespace `TauCeti`.

**Coverage.** Status `planned`. Remaining refinements: Segal 1974, CCMT, Bass p. 355 and Schlichting §10 are quoted (gaps).

## H.5 — Spectra and deloopings (aggregate)

H.5 is the aggregate of H.5:spectra and H.5:S-delooping (RS-33: kept as a re-export, not a third construction). Its realising declarations are H.5:spectra/symmetric-spectrum and H.5:S-delooping/k-theory-symmetric-spectrum. The return comparison with the abstract ∞-category of spectra is EnhancedDerivedSheaves:E5:spectra-comparison, which consumes H.5 and never feeds back into H.5:spectra.

**Coverage.** Status `planned`.

## H.5:spectra — The concrete spectrum model

RS-33 keeps the concrete simplicial-compatible spectrum model, suspension spectra, loops and shifts, integer-indexed homotopy groups and stable equivalences, functorial replacements, the stable homotopy category and the fibre/cofibre long exact sequences; stability, shifts, signs and finite biproducts are verified in the model against the abstract interface of EnhancedDerivedSheaves:E0 and E5:abstract. It keeps Eilenberg–Mac Lane spectra of chain complexes, their homotopy and cohomology comparisons and functorial truncations (RT-AREA-ktheory-1/16), and locates here the generic concrete smash product, the homotopy-group pairing and the concrete operadic/E∞ realisation. From Bhatt–Scholze it takes the connective-spectrum comparison with iterated deloopings and the Picard/1-truncated comparison.

**Choice of model.** Symmetric spectra of simplicial sets: a spectrum has pointed simplicial sets X_n with Σ_n-actions and equivariant structure maps X_n ∧ S¹ → X_{n+1}. This model is compatible with simplicial sets, has a point-set symmetric monoidal smash product with unit S (needed for ring spectra and the K-theory pairing), and contains the K-theory spectra of Waldhausen categories directly (Schwede I.3.50). Its subtlety, that naive homotopy groups can differ from true ones, is handled by semistability: Ω-spectra, suspension spectra, Eilenberg–Mac Lane spectra and K-theory spectra are semistable.

**Theorems.** π̂_*-isomorphisms are stable equivalences, and stable equivalences are detected by true homotopy groups; the stable model structure; the stable homotopy category as the localisation at stable equivalences, additive and triangulated; long exact sequences of cofibres and fibres, which agree up to a shift; finite wedges and products agree; the derived smash product makes SHC closed symmetric monoidal; the twist on spheres has sign (−1)^{pq}; the pairing on homotopy groups is associative, unital and graded commutative; HA is an Ω-spectrum with homotopy A in degree 0, HR is a ring spectrum and HR-modules model D(R) (Shipley); the Eilenberg–Mac Lane functor on chain complexes has π_k(HC) = H_k(C); [Σ^∞_+X, Σ^k HA] = H^k(X; A); connective covers and Postnikov sections with their triangle form a t-structure; sequential homotopy colimits commute with homotopy groups; connective spectra are sequences of deloopings and are equivalent to grouplike E∞-monoids; Picard groupoids are 1-truncated connective spectra.

### Declarations of H.5:spectra

#### `H.5:spectra/simplicial-spheres-and-smash` — Pointed simplicial sets, smash product and simplicial spheres

*Construction.* For pointed simplicial sets K, L, the smash product K ∧ L is the quotient (K × L)/(K ∨ L) by the wedge K × {*} ∪ {*} × L; it is symmetric monoidal on pointed simplicial sets with unit S⁰ = Δ[0]₊. The simplicial circle is S¹ = Δ[1]/∂Δ[1] and Sⁿ = (S¹)^{∧n}, with Σ_n acting by permuting the smash factors; |Sⁿ| is homeomorphic to the n-sphere and |K ∧ L| ≅ |K| ∧ |L| when the product is formed in compactly generated spaces. The pointed mapping simplicial set and loop functor Ω K = map_*(S¹, K) are right adjoint to S¹ ∧ −.

**Hypotheses.** Pointed simplicial sets (Under Δ[0] in SSet); realisation of products as in H.1/classifying-space-prod.

**Construction or proof outline.**

1. Define the wedge and smash as pushouts in SSet (Mathlib has colimits of simplicial sets); associativity, unit and symmetry follow from those of the product.
2. S¹ = Δ[1]/∂Δ[1] has exactly two nondegenerate simplices (vertex and 1-cell), so |S¹| is a circle (H.1/classifying-space-cw-structure); Sⁿ is the n-fold smash with the coordinate-permuting Σ_n-action used in symmetric spectra (Schwede Definition 3.1, Hovey–Shipley–Smith §1.1).

**API.**

- `SSet.Pointed` (structure): Pointed simplicial sets: Under (Δ[0]) in SSet, with the wedge as coproduct.
- `SSet.Pointed.smash` (constructor): smash K L := (K ⊗ L) ⧸ (K ∨ L), a pointed simplicial set.
- `SSet.Pointed.smashMonoidal` (instance): A symmetric monoidal structure on pointed simplicial sets with tensor smash and unit S⁰.
- `SSet.Pointed.circle` (constructor): circle := Δ[1] ⧸ ∂Δ[1], pointed at the image of the boundary.
- `SSet.Pointed.sphere` (constructor): sphere n := circle^{∧ n} with the Σ_n-action permuting factors; sphere 0 = S⁰.
- `SSet.Pointed.loop` (constructor): loop K := pointed mapping simplicial set from circle to K, right adjoint to circle ∧ −.
- `SSet.Pointed.toTop_smash` (compatibility): SSet.toTop (smash K L) is homeomorphic to the smash product of realisations formed in compactly generated spaces.

**Unit tests.**

- `sphere_zero` (degenerate): sphere 0 = S⁰ = Δ[0]₊ and smash S⁰ K ≅ K.
- `circle_cells` (computation): circle has exactly one nondegenerate 0-simplex and one nondegenerate 1-simplex, and its realisation is homeomorphic to the circle.
- `sphere_toTop` (compatibility): SSet.toTop (sphere n) is homeomorphic to the topological n-sphere (one 0-cell and one n-cell).
- `smash_not_product` (non-example): smash circle circle is not circle ⊗ circle: the latter realises to the torus, the former to S².

**Uses.** H.5:spectra/symmetric-spectrum: levels of a symmetric spectrum are pointed simplicial sets with structure maps X_n ∧ S¹ → X_{n+1}; H.5:spectra/suspension-spectrum: Σ^∞K has levels K ∧ Sⁿ; H.6/moore-spectrum: Moore spaces and spectra are built from spheres by attaching cells.

**Acceptance.** |S¹ ∧ S¹| ≃ S² (two-sphere). S⁰ ∧ K ≅ K.

**Prerequisites.** `mathlib:SSet`, `mathlib:SSet.toTop`, `H.1/classifying-space-prod`, `H.1/classifying-space-cw-structure`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter I, Definition 3.1, p. 34 (PDF 35); HoveyShipleySmith-SymmetricSpectra-2000, Section 1.1 and Definition 1.2.2.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Symmetric`, namespace `SSet.Pointed`.

#### `H.5:spectra/symmetric-spectrum` — Symmetric spectra of simplicial sets — planet: *Symmetric spectrum*

*Definition.* A symmetric spectrum X consists of pointed simplicial sets X_n (n ≥ 0) with basepoint-preserving left Σ_n-actions and pointed maps σ_n : X_n ∧ S¹ → X_{n+1} such that every iterate σ^m : X_n ∧ S^m → X_{n+m} is Σ_n × Σ_m-equivariant. Morphisms are levelwise equivariant maps commuting with the structure maps; the category Sp of symmetric spectra has all limits and colimits (levelwise). Forgetting the symmetric group actions gives the underlying sequential spectrum. This is the concrete spectrum model of the roadmap, compatible with simplicial sets; geometric realisation levelwise gives symmetric spectra of spaces.

**Hypotheses.** Pointed simplicial sets and simplicial spheres from H.5:spectra/simplicial-spheres-and-smash.

**Construction or proof outline.**

1. Define the data and the equivariance condition (Schwede Definition 3.1 for simplicial sets; Hovey–Shipley–Smith Definition 1.2.2).
2. Limits and colimits are formed levelwise with the induced actions and structure maps (Schwede Example 3.5).

**API.**

- `TauCeti.SymmSpectrum` (structure): Symmetric spectra of simplicial sets: levels, Σ_n-actions and equivariant structure maps.
- `TauCeti.SymmSpectrum.Hom` (structure): Morphisms: levelwise equivariant pointed maps commuting with structure maps; a category with all limits and colimits.
- `TauCeti.SymmSpectrum.toSequential` (projection): The forgetful functor to sequential spectra (no symmetric group actions).
- `TauCeti.SymmSpectrum.level` (projection): The evaluation functor X ↦ X_n to pointed simplicial sets with Σ_n-action.
- `TauCeti.SymmSpectrum.sphere` (constructor): The sphere spectrum S with S_n = Sⁿ.
- `TauCeti.SymmSpectrum.realization` (functoriality): Levelwise realisation to symmetric spectra of spaces, preserving all constructions up to natural isomorphism.

**Unit tests.**

- `symmSpectrum_zero` (degenerate): The trivial spectrum (a point in each level) is a zero object of the category of symmetric spectra.
- `symmSpectrum_sphere_level` (computation): sphere.level 2 = S² with Σ₂ acting by swapping the two circle factors (a map of degree −1 on |S²|).
- `symmSpectrum_colimit_levelwise` (characterisation): Colimits of symmetric spectra are computed levelwise: (colim X^i)_n = colim (X^i)_n.
- `symmSpectrum_not_sequential` (non-example): A sequential spectrum need not admit a symmetric structure compatible with the given structure maps: the Σ₂-equivariance condition on X₀ ∧ S² → X₂ is a genuine condition.

**Uses.** GeneralAlgebraicKTheory:K.4:construction: the K-theory spectrum of a Waldhausen category is a symmetric spectrum with levels |wS^{(n)}C| (H.5:S-delooping/k-theory-symmetric-spectrum); RefinedTraceMethods:RT.1: THH and its cyclotomic structure are formed in spectra with a smash product; EnhancedDerivedSheaves:E5:spectra-comparison: the concrete model is compared with the abstract ∞-category of spectra; HabiroRings:HR.2/spectral-habiro-completion: spectral Habiro completion uses concrete spectra with cofibres and homotopy limits; SchemeKTheoryOperations:S.4: presheaves of spectra on schemes and their hypercohomology.

**Acceptance.** The sphere spectrum S (Sⁿ in level n) is a symmetric spectrum (Schwede Example 1.8). The Eilenberg–Mac Lane spectrum HA is one (Schwede Example 1.14; H.5:spectra/eilenberg-maclane-spectrum).

**Prerequisites.** `H.5:spectra/simplicial-spheres-and-smash`, `EnhancedDerivedSheaves:E5:abstract`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter I, Definition 3.1, p. 34 (PDF 35); HoveyShipleySmith-SymmetricSpectra-2000, Definition 1.2.2.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Symmetric`, namespace `TauCeti`.

#### `H.5:spectra/naive-homotopy-groups` — Naive stable homotopy groups indexed by the integers

*Definition.* For a sequential (or symmetric) spectrum X and k ∈ ℤ, the naive homotopy group π̂_k X = colim_n π_{k+n}|X_n| is the colimit, over n ≥ max(0, 2 − k), of the stabilisation maps π_{k+n}|X_n| → π_{k+n+1}|X_{n+1}| sending f to σ_n ∘ (f ∧ S¹). These are abelian groups, functorial in X, with natural isomorphisms π̂_k(ΩX) ≅ π̂_{k+1}X and π̂_k X ≅ π̂_{k+1}(S¹ ∧ X). A π̂_*-isomorphism is a map inducing isomorphisms on all π̂_k.

**Hypotheses.** X a sequential or symmetric spectrum; homotopy groups of realisations (Mathlib HomotopyGroup, Tau Ceti functoriality and loop-space shift).

**Construction or proof outline.**

1. Define the stabilisation maps through suspension of representing maps and take the filtered colimit of abelian groups (Schwede Definition 2.1).
2. Loop and suspension isomorphisms are compatible with stabilisation, giving the shifts (Schwede (2.3)–(2.4) and Proposition 2.6), using Tau Ceti's HomotopyGroup.pathLoopSpaceMulEquiv.

**API.**

- `TauCeti.SymmSpectrum.naivePi` (constructor): naivePi X k : AddCommGroup, the colimit of π_{k+n} |X_n| for k : ℤ.
- `TauCeti.SymmSpectrum.naivePi.map` (functoriality): A morphism induces homomorphisms on naivePi, with map_id and map_comp.
- `TauCeti.SymmSpectrum.naivePi_loop` (relation): naivePi (Ω X) k ≃+ naivePi X (k + 1), natural in X.
- `TauCeti.SymmSpectrum.naivePi_susp` (relation): naivePi X k ≃+ naivePi (S¹ ∧ X) (k + 1), natural in X.
- `TauCeti.SymmSpectrum.IsNaivePiIso` (constructor): A morphism f is a π̂_*-isomorphism if naivePi.map f k is bijective for all k.
- `TauCeti.SymmSpectrum.naivePi_of_level` (constructor): The canonical map π_{k+n} |X_n| → naivePi X k.

**Unit tests.**

- `naivePi_sphere_zero` (computation): naivePi sphere 0 ≅ ℤ, generated by the identity of S⁰.
- `naivePi_trivial` (degenerate): naivePi of the trivial spectrum is 0 in every degree.
- `naivePi_sphere_negative` (computation): naivePi sphere k = 0 for k < 0.
- `naivePi_not_true_pi` (non-example): For the free symmetric spectrum F₁S¹ (not semistable), naivePi differs from the true homotopy groups: naivePi₀ (F₁ S¹) is a countable sum of copies of ℤ while π₀ = ℤ (Schwede §I.6).
- `naivePi_omegaSpectrum_compat` (compatibility): For an Ω-spectrum X, naivePi X k ≅ π_k |X_0| for k ≥ 0 and ≅ π₀ |X_{−k}| for k < 0.

**Uses.** H.5:spectra/stable-equivalence: π̂_*-isomorphisms are stable equivalences; H.6/bockstein-long-exact-sequence: π_*(E/m) and the universal coefficient sequence are stated on homotopy groups; H.5:S-delooping/k-theory-spectrum-homotopy-groups: π_i K(C) = K_i(C) for i ≥ 0.

**Acceptance.** π̂_k S = π^s_k, the stable stems; π̂_k S = 0 for k < 0. π̂_* HA = A in degree 0 (H.5:spectra/eilenberg-maclane-spectrum).

**Prerequisites.** `H.5:spectra/symmetric-spectrum`, `tauceti:HomotopyGroup.pathLoopSpaceMulEquiv`, `tauceti:HomotopyGroup.mapHom`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter I, Definition 2.1 and §2.1, pp. 23–24 (PDF 24–25).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Symmetric`, namespace `TauCeti`.

#### `H.5:spectra/omega-spectra-and-eilenberg-maclane` — Ω-spectra and connective spectra

*Definition.* A symmetric spectrum X is an Ω-spectrum if every adjoint structure map σ̃_n : |X_n| → Ω|X_{n+1}| is a weak homotopy equivalence (each X_n Kan, or after realisation); then π̂_k X ≅ π_{k+n}|X_n| for k + n ≥ 0, and π̂_k X = π₀|X_{−k}| for k < 0. X is connective if π̂_k X = 0 (equivalently true π_k X = 0) for k < 0. Eilenberg–Mac Lane spectra (H.5:spectra/eilenberg-maclane-spectrum) and the K-theory spectrum (H.5:S-delooping/iterated-S-construction-omega-spectrum) are Ω-spectra. Negative homotopy groups depend on the chosen deloopings, not on the zeroth space.

**Hypotheses.** Kan levels (or realisation) so that Ω is the homotopically correct loop space.

**Construction or proof outline.**

1. Define IsOmegaSpectrum through H.2/weak-homotopy-equivalence of the adjoint structure maps (Schwede Definition 1.15).
2. For an Ω-spectrum the colimit defining π̂_k stabilises at the first defined stage (loop-space shift).

**API.**

- `TauCeti.SymmSpectrum.IsOmegaSpectrum` (constructor): IsOmegaSpectrum X :↔ ∀ n, IsWeakHomotopyEquivalence (adjoint of σ_n : |X_n| → Ω |X_{n+1}|).
- `TauCeti.SymmSpectrum.IsConnective` (constructor): IsConnective X :↔ ∀ k < 0, naivePi X k = 0 (true homotopy groups for non-semistable X).
- `TauCeti.SymmSpectrum.IsOmegaSpectrum.naivePi_eq` (characterisation): For an Ω-spectrum, naivePi X k ≅ π_{k+n} |X_n| for every n with k + n ≥ 0.
- `TauCeti.SymmSpectrum.IsOmegaSpectrum.semistable` (relation): Ω-spectra are semistable (H.5:spectra/semistable).

**Unit tests.**

- `isOmegaSpectrum_trivial` (degenerate): The trivial spectrum is an Ω-spectrum.
- `isOmegaSpectrum_HA` (computation): HA is an Ω-spectrum with naivePi (HA) 0 ≅ A.
- `not_isOmegaSpectrum_sphere` (non-example): The sphere spectrum is not an Ω-spectrum: S¹ → ΩS² is not a weak equivalence, since π₂(ΩS²) = π₃(S²) = ℤ while π₂(S¹) = 0.
- `isConnective_sphere` (computation): The sphere spectrum is connective.

**Uses.** H.5:spectra/stable-homotopy-category: morphisms in SHC are homotopy classes of maps into (injective) Ω-spectra; H.5:spectra/connective-spectra-via-deloopings: connective Ω-spectra are sequences of deloopings; GeneralAlgebraicKTheory:K.6/nonconnective-spectrum: the nonconnective K-theory spectrum is an Ω-spectrum with nonzero negative homotopy.

**Acceptance.** π_n of the Eilenberg–Mac Lane spectrum of A is A in degree 0 and zero otherwise. Weibel IV 8.5.5: the S.-construction gives a connective Ω-spectrum with π_i = K_i for i ≥ 0. Negative homotopy groups of a spectrum depend on the chosen deloopings (Weibel IV §2 remark on K_m(R; Z/ℓ) for m < 2).

**Prerequisites.** `H.5:spectra/symmetric-spectrum`, `H.5:spectra/naive-homotopy-groups`, `H.2/weak-homotopy-equivalence`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter I, Definition 1.15, p. 17 (PDF 18); Carlsson-Deloopings-Handbook-2005, §1.1, printed p. 4 (PDF 18); Weibel-KBook-IV, Spectra 2.3.1, p. IV.19; Infinite Loop Structure 8.5.5, p. IV.69.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Symmetric`, namespace `TauCeti`.

#### `H.5:spectra/suspension-spectrum` — Suspension spectra, free spectra and the sphere spectrum

*Construction.* For a pointed simplicial set K, the suspension spectrum Σ^∞K has levels K ∧ Sⁿ with Σ_n permuting the sphere coordinates and structure maps the canonical isomorphisms; Σ^∞ is left adjoint to evaluation at level 0. The sphere spectrum is S = Σ^∞S⁰. More generally the free spectrum F_m K (left adjoint to evaluation at level m) has levels Σ_{n+} ∧_{Σ_{n−m}} K ∧ S^{n−m}; F_m S⁰ represents the desuspension S^{−m} in the stable homotopy category, so spheres Sⁿ exist for all n ∈ ℤ. Σ^∞_+ X := Σ^∞(X₊).

**Hypotheses.** K a pointed simplicial set.

**Construction or proof outline.**

1. Define levels and structure maps (Schwede Example 1.13 for spaces; Example 3.20 for free spectra).
2. The adjunction Σ^∞ ⊣ ev₀ and F_m ⊣ ev_m are checked levelwise from the universal property of the free Σ_n-object.

**API.**

- `TauCeti.SymmSpectrum.suspensionSpectrum` (constructor): suspensionSpectrum K with levels K ∧ Sⁿ.
- `TauCeti.SymmSpectrum.suspensionAdj` (universal-property): suspensionSpectrum ⊣ level 0.
- `TauCeti.SymmSpectrum.free` (constructor): free m K, left adjoint to evaluation at level m (forgetting the Σ_m-action).
- `TauCeti.SymmSpectrum.sphereSpectrum_eq` (characterisation): sphere = suspensionSpectrum S⁰.
- `TauCeti.SymmSpectrum.naivePi_suspension` (characterisation): naivePi (suspensionSpectrum K) k is the k-th stable homotopy group colim_n π_{k+n}|K ∧ Sⁿ|.

**Unit tests.**

- `suspensionSpectrum_point` (degenerate): suspensionSpectrum of the one-point pointed simplicial set is the trivial spectrum.
- `suspensionSpectrum_naivePi_zero_S0` (computation): naivePi (suspensionSpectrum S⁰) 0 ≅ ℤ.
- `suspensionSpectrum_connective` (characterisation): suspensionSpectrum K is connective for every K.
- `free_one_not_piIso` (non-example): The map free 1 S¹ → sphere adjoint to the identity is a stable equivalence but not a π̂_*-isomorphism.

**Uses.** H.5:spectra/eilenberg-maclane-cohomology: [Σ^∞_+ X, ΣⁿHA] ≅ Hⁿ(X; A); K3BlochGroups:V.4/pi3ind-ahss: π_*(Σ^∞ BG₊) for a discrete group G; H.6/moore-spectrum: S/m is the cofibre of m : S → S.

**Acceptance.** π̂_k Σ^∞K = π^s_k(K), the stable homotopy groups of K; Σ^∞K is connective. F₁S¹ is stably equivalent to S but not π̂_*-isomorphic to it (Schwede §I.6).

**Prerequisites.** `H.5:spectra/symmetric-spectrum`, `H.5:spectra/simplicial-spheres-and-smash`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter I, Example 1.13, p. 15 (PDF 16); Schwede-SymmetricSpectra-2012, Chapter I, Example 1.8, p. 12 (PDF 13).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Symmetric`, namespace `TauCeti`.

#### `H.5:spectra/loop-shift-suspension` — Loop, suspension and shift of spectra

*Construction.* For a symmetric spectrum X: the loop spectrum ΩX has levels Ω X_n (simplicial loops of a fibrant replacement, or loops of realisations) and the suspension S¹ ∧ X has levels S¹ ∧ X_n, adjoint to each other; the shift sh X has (sh X)_n = X_{1+n} with Σ_n acting through Σ_n → Σ_{1+n}; λ_X : S¹ ∧ X → sh X is the map built from the structure maps and the twist. The loop and suspension maps shift naive homotopy groups by one (H.5:spectra/naive-homotopy-groups).

**Hypotheses.** Symmetric spectra; Ω computed after Kan replacement levelwise (Ex^∞ or realisation).

**Construction or proof outline.**

1. Define ΩX, S¹ ∧ X and the adjunction levelwise (Schwede §2.1); define sh X and λ_X (Schwede Example 3.9).
2. π̂_k(ΩX) ≅ π̂_{k+1} X and π̂_k X ≅ π̂_{k+1}(S¹ ∧ X) (Schwede Proposition 2.6).

**API.**

- `TauCeti.SymmSpectrum.loop` (constructor): loop X with levels Ω (X_n) (after levelwise Kan replacement).
- `TauCeti.SymmSpectrum.susp` (constructor): susp X := S¹ ∧ X levelwise.
- `TauCeti.SymmSpectrum.suspLoopAdj` (universal-property): susp ⊣ loop.
- `TauCeti.SymmSpectrum.shift` (constructor): shift X with levels X_{1+n} and restricted actions.
- `TauCeti.SymmSpectrum.lambda` (data): λ_X : susp X ⟶ shift X, natural in X.

**Unit tests.**

- `loop_trivial` (degenerate): loop of the trivial spectrum is trivial.
- `naivePi_shift` (computation): naivePi (shift X) k ≅ naivePi X (k + 1).
- `loop_susp_sphere` (compatibility): susp sphere is isomorphic to the shifted free spectrum and naivePi (susp sphere) 1 ≅ ℤ.
- `shift_not_susp` (non-example): shift (free 1 S¹) is not π̂_*-isomorphic to susp (free 1 S¹), so λ is not a π̂_*-isomorphism for that spectrum (it is not semistable).

**Uses.** H.5:spectra/stable-homotopy-category: the suspension functor is the shift of the triangulated structure; GeneralAlgebraicKTheory:K.6/nonconnective-spectrum: loops and desuspensions of spectra in the Bass delooping; H.5:spectra/semistable: semistability is defined by λ_X being a π̂_*-isomorphism.

**Acceptance.** Ω and S¹ ∧ − are mutually inverse up to stable equivalence (Schwede II Proposition 2.2). π̂_k(sh X) ≅ π̂_{k+1} X.

**Prerequisites.** `H.5:spectra/symmetric-spectrum`, `H.5:spectra/naive-homotopy-groups`, `H.5:spectra/simplicial-spheres-and-smash`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter I, §2.1 and Proposition 2.6, pp. 23–24 (PDF 24–25); Schwede-SymmetricSpectra-2012, Chapter I, Example 3.9, p. 37 (PDF 38).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Symmetric`, namespace `TauCeti`.

#### `H.5:spectra/semistable` — Semistable symmetric spectra

*Definition.* A symmetric spectrum X is semistable if λ_X : S¹ ∧ X → sh X is a π̂_*-isomorphism. Ω-spectra, suspension spectra, Eilenberg–Mac Lane spectra, the K-theory spectra of Waldhausen categories and all spectra underlying orthogonal spectra are semistable; for semistable spectra the naive and true homotopy groups agree, and stable equivalences between semistable spectra are exactly π̂_*-isomorphisms.

**Hypotheses.** X a symmetric spectrum of simplicial sets.

**Construction or proof outline.**

1. Define via λ_X (Schwede Definition 3.14); closure properties (realisation, π̂_*-isomorphism invariance, wedges) are Schwede Propositions 3.15–3.16.
2. Agreement of naive and true homotopy groups is Schwede Proposition 6.3 (H.5:spectra/true-homotopy-groups).

**API.**

- `TauCeti.SymmSpectrum.IsSemistable` (constructor): IsSemistable X :↔ IsNaivePiIso (lambda X).
- `TauCeti.SymmSpectrum.IsSemistable.of_omega` (relation): Ω-spectra are semistable.
- `TauCeti.SymmSpectrum.IsSemistable.of_suspension` (relation): Suspension spectra are semistable.
- `TauCeti.SymmSpectrum.IsSemistable.of_naivePiIso` (relation): If f : A → B is a π̂_*-isomorphism, A is semistable iff B is.

**Unit tests.**

- `isSemistable_sphere` (computation): The sphere spectrum is semistable.
- `isSemistable_trivial` (degenerate): The trivial spectrum is semistable.
- `not_isSemistable_free_one` (non-example): free 1 S¹ is not semistable.
- `isSemistable_HA` (compatibility): HA is semistable, so its naive and true homotopy groups both equal A in degree 0.

**Uses.** H.5:spectra/stable-equivalence: for semistable spectra stable equivalences are π̂_*-isomorphisms; H.5:S-delooping/k-theory-symmetric-spectrum: the K-theory symmetric spectrum is semistable, so its homotopy groups are the naive ones.

**Acceptance.** The sphere spectrum is semistable; F₁S¹ is not. A spectrum whose underlying sequential spectrum is an Ω-spectrum from some level on is semistable.

**Prerequisites.** `H.5:spectra/loop-shift-suspension`, `H.5:spectra/naive-homotopy-groups`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter I, Definition 3.14, p. 38 (PDF 39).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Symmetric`, namespace `TauCeti`.

#### `H.5:spectra/stable-equivalence` — Stable equivalences of symmetric spectra

*Definition.* A morphism f : X → Y of symmetric spectra is a stable equivalence if for every injective Ω-spectrum E the induced map [Y, E] → [X, E] on homotopy classes of maps (homotopies X ∧ Δ[1]₊ → E) is bijective (Hovey–Shipley–Smith). Every π̂_*-isomorphism is a stable equivalence, f is a stable equivalence iff it induces isomorphisms of true homotopy groups, and between semistable spectra stable equivalences are exactly π̂_*-isomorphisms. Levelwise weak equivalences are stable equivalences.

**Hypotheses.** Injective Ω-spectra: Ω-spectra with the right lifting property against levelwise cofibrations that are levelwise weak equivalences.

**Construction or proof outline.**

1. Definition via injective Ω-spectra (Hovey–Shipley–Smith Definition 3.1.3).
2. Characterisation by true homotopy groups: Schwede Theorem 6.2; π̂_*-isomorphisms are stable equivalences (same theorem); semistable case Schwede Proposition 6.3.

**API.**

- `TauCeti.SymmSpectrum.stableEquivalences` (constructor): The MorphismProperty of stable equivalences.
- `TauCeti.SymmSpectrum.stableEquivalence_of_naivePiIso` (relation): Every π̂_*-isomorphism is a stable equivalence.
- `TauCeti.SymmSpectrum.stableEquivalence_iff_truePi` (characterisation): f is a stable equivalence iff it induces isomorphisms on true homotopy groups.
- `TauCeti.SymmSpectrum.stableEquivalence_iff_naivePi_of_semistable` (characterisation): Between semistable spectra, f is a stable equivalence iff it is a π̂_*-isomorphism.
- `TauCeti.SymmSpectrum.stableEquivalences.twoOutOfThree` (relation): Stable equivalences satisfy two-out-of-three and contain levelwise weak equivalences.

**Unit tests.**

- `stableEquivalence_id` (degenerate): The identity is a stable equivalence.
- `stableEquivalence_free_one_sphere` (computation): free 1 S¹ → sphere is a stable equivalence.
- `stableEquivalence_levelwise` (compatibility): A levelwise weak homotopy equivalence of symmetric spectra is a stable equivalence.
- `not_stableEquivalence_zero_sphere` (non-example): The map from the trivial spectrum to the sphere spectrum is not a stable equivalence: π₀ differs.

**Uses.** H.5:spectra/stable-homotopy-category: SHC is the localisation at stable equivalences; H.5:S-delooping/k-theory-spectrum-functoriality: exact functors inducing homotopy equivalences on K-theory spaces give stable equivalences of K-theory spectra; EnhancedDerivedSheaves:E5:spectra-comparison: the comparison functor sends stable equivalences to equivalences of the ∞-category of spectra.

**Acceptance.** S ∧ X → X is a stable equivalence for every X. F₁S¹ → S is a stable equivalence but not a π̂_*-isomorphism.

**Prerequisites.** `H.5:spectra/symmetric-spectrum`, `H.5:spectra/naive-homotopy-groups`, `H.5:spectra/omega-spectra-and-eilenberg-maclane`, `H.5:spectra/semistable`, `H.2/weak-homotopy-equivalence`.

**Sources.** HoveyShipleySmith-SymmetricSpectra-2000, Definition 3.1.3; Schwede-SymmetricSpectra-2012, Chapter I, Theorem 6.2, p. 107 (PDF 108).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Symmetric`, namespace `TauCeti`.

#### `H.5:spectra/true-homotopy-groups` — True homotopy groups of symmetric spectra

*Definition.* For a symmetric spectrum X and k ∈ ℤ, the true homotopy group π_k X is the naive homotopy group π̂_k(QX) of a functorial stably fibrant (injective Ω-spectrum) replacement QX; equivalently π_k X = [S^k, X] in the stable homotopy category, with S^k = Σ^k S for k ≥ 0 and F_{−k}S⁰ for k < 0. There is a natural map π̂_k X → π_k X, an isomorphism for semistable X.

**Hypotheses.** A functorial stably fibrant replacement (H.5:spectra/stable-model-structure).

**Construction or proof outline.**

1. Define π_k X := π̂_k(QX) (Schwede Definition 6.1); naturality from functoriality of Q.
2. Representability by spheres in SHC: Schwede II Example 1.8 and §4.

**API.**

- `TauCeti.SymmSpectrum.pi` (constructor): pi X k := naivePi (stablyFibrantReplacement X) k.
- `TauCeti.SymmSpectrum.naivePiToPi` (data): The natural map naivePi X k → pi X k.
- `TauCeti.SymmSpectrum.naivePiToPi_iso_of_semistable` (characterisation): naivePiToPi is an isomorphism for semistable X.
- `TauCeti.SymmSpectrum.pi_eq_SHC_hom` (equivalence): pi X k ≃ (S^k ⟶ X) in the stable homotopy category.

**Unit tests.**

- `pi_sphere_zero` (computation): pi sphere 0 ≅ ℤ.
- `pi_trivial` (degenerate): pi of the trivial spectrum vanishes.
- `pi_free_one` (compatibility): pi (free 1 S¹) k ≅ pi sphere k for all k.
- `pi_ne_naivePi_free_one` (non-example): naivePiToPi (free 1 S¹) 0 is not injective.

**Uses.** H.6/bockstein-long-exact-sequence: homotopy groups of cofibres E/m; H.5:spectra/postnikov-sections: connectivity and truncation are defined through true homotopy groups; K3BlochGroups:V.1/hopf-minus-one-product-refinement: stable homotopy groups of spheres acting on homotopy groups.

**Acceptance.** π_k S = π^s_k. π_*(F₁S¹) = π^s_* although π̂_*(F₁S¹) is larger.

**Prerequisites.** `H.5:spectra/naive-homotopy-groups`, `H.5:spectra/stable-equivalence`, `H.5:spectra/stable-model-structure`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter I, Definition 6.1 and Proposition 6.3, pp. 106–107 (PDF 107–108).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Symmetric`, namespace `TauCeti`.

#### `H.5:spectra/stable-model-structure` — The stable model structure on symmetric spectra

*Theorem.* The category of symmetric spectra of simplicial sets admits a (cofibrantly generated, simplicial) model structure whose weak equivalences are the stable equivalences, whose cofibrations are the projective cofibrations, and whose fibrant objects are the Ω-spectra with Kan levels; there is also the positive projective (and flat) stable model structure with the same weak equivalences. Functorial factorisations give functorial cofibrant and fibrant replacements. Its homotopy category is the stable homotopy category.

**Hypotheses.** Mathlib's HomotopicalAlgebra.ModelCategory; the Kan–Quillen model structure on simplicial sets is used levelwise (not in Mathlib; recorded as the packet gap 'Kan–Quillen model structure').

**Construction or proof outline.**

1. Construct the projective level model structure from the levelwise Kan–Quillen structure and Bousfield-localise at the maps F_{n+1}(K ∧ S¹) → F_n K (Hovey–Shipley–Smith Theorem 3.4.4; Schwede III Theorem 4.11).
2. Fibrant objects are Ω-spectra with Kan levels (Hovey–Shipley–Smith §3.4).

**Acceptance.** Cofibrant replacement of S is S itself. The stable model structure is stable: suspension is invertible on the homotopy category.

**Prerequisites.** `H.5:spectra/stable-equivalence`, `H.5:spectra/omega-spectra-and-eilenberg-maclane`, `mathlib:HomotopicalAlgebra.ModelCategory`.

**Sources.** HoveyShipleySmith-SymmetricSpectra-2000, Theorem 3.4.4; Schwede-SymmetricSpectra-2012, Chapter III, Theorem 4.11, p. 366 (PDF 367).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/StableHomotopyCategory`, namespace `TauCeti`.

#### `H.5:spectra/stable-homotopy-category` — The stable homotopy category — planet: *Stable homotopy category*

*Construction.* The stable homotopy category SHC is the localisation γ : Sp → SHC of symmetric spectra at the stable equivalences (Mathlib's MorphismProperty.Localization), with hom-sets [X, Y] = homotopy classes of maps from X to a chosen injective Ω-spectrum replacement of Y; a morphism of spectra is a stable equivalence iff γ of it is an isomorphism. SHC is additive (finite sums and products agree), the suspension Σ = S¹ ∧ − is an autoequivalence, and π_k X = [S^k, X].

**Hypotheses.** Choices of injective Ω-spectrum replacements; any two choices give canonically isomorphic categories.

**Construction or proof outline.**

1. Define SHC with morphisms [X, ωY] (Schwede II Definition 1.1) and prove the localisation property (Theorem 1.6), matching Mathlib's MorphismProperty.Localization through its universal property.
2. Additivity: finite coproducts and products agree (Schwede II Proposition 1.10, Corollary 1.13; H.5:spectra/finite-biproducts).
3. Σ is an equivalence (Schwede II Proposition 2.2).

**API.**

- `TauCeti.SHC` (constructor): The stable homotopy category, with objects symmetric spectra.
- `TauCeti.SHC.γ` (projection): γ : SymmSpectrum ⥤ SHC, a localisation functor at stableEquivalences (Functor.IsLocalization).
- `TauCeti.SHC.isIso_γ_iff` (characterisation): IsIso (γ.map f) ↔ f is a stable equivalence.
- `TauCeti.SHC.preadditive` (instance): SHC is additive.
- `TauCeti.SHC.shiftFunctor` (instance): HasShift SHC ℤ with shift 1 = Σ.
- `TauCeti.SHC.homSphereEquiv` (equivalence): (S^k ⟶ X) in SHC ≃ pi X k.

**Unit tests.**

- `SHC_zero_object` (degenerate): The trivial spectrum is a zero object of SHC.
- `SHC_hom_sphere_HA` (computation): (γ S ⟶ γ (HA)) ≃ A.
- `SHC_localization_compat` (compatibility): SHC is equivalent to (stableEquivalences).Localization (Mathlib) compatibly with γ.
- `SHC_not_levelwise` (non-example): The localisation at levelwise weak equivalences only is not SHC: F₁S¹ → S is not inverted there.

**Uses.** EnhancedDerivedSheaves:E5:spectra-comparison: SHC is compared with the homotopy category of the ∞-category of spectra; H.6/filtered-spectrum-spectral-sequence: filtered spectra give spectral objects in the triangulated category SHC; GeneralAlgebraicKTheory:K.5: relative K-theory as a fibre in SHC.

**Acceptance.** The functor γ sends F₁S¹ → S to an isomorphism. SHC(S, HA) = A.

**Prerequisites.** `H.5:spectra/stable-equivalence`, `H.5:spectra/stable-model-structure`, `mathlib:CategoryTheory.MorphismProperty.Localization`, `H.5:spectra/finite-biproducts`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Definition 1.1, p. 217 (PDF 218); Schwede-SymmetricSpectra-2012, Chapter II, Theorem 1.6, p. 218 (PDF 219).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/StableHomotopyCategory`, namespace `TauCeti`.

#### `H.5:spectra/mapping-cone-and-homotopy-fibre` — Mapping cones and homotopy fibres of spectra

*Construction.* For a morphism f : X → Y of symmetric spectra, the mapping cone C(f) = Y ∪_f (Δ[1] ∧ X) (with Δ[1] pointed at 1) and the homotopy fibre F(f) = X ×_Y Y^{Δ[1]} (levelwise on Kan replacements) come with natural maps Y → C(f) → S¹ ∧ X and ΩY → F(f) → X. They are functorial in commutative squares and preserve stable equivalences.

**Hypotheses.** Symmetric spectra; homotopy fibres after levelwise Kan replacement.

**Construction or proof outline.**

1. Levelwise mapping cones and homotopy fibres with induced actions and structure maps (Schwede II Examples 2.4, 2.6; Schwede I §2 for sequential spectra).
2. Homotopy invariance: from the long exact sequences (H.5:spectra/cofibre-long-exact-sequence).

**API.**

- `TauCeti.SymmSpectrum.mappingCone` (constructor): mappingCone f with maps inr : Y ⟶ mappingCone f and δ : mappingCone f ⟶ susp X.
- `TauCeti.SymmSpectrum.homotopyFiber` (constructor): homotopyFiber f with maps ι : homotopyFiber f ⟶ X and ∂ : loop Y ⟶ homotopyFiber f.
- `TauCeti.SymmSpectrum.mappingCone.map` (functoriality): Commutative squares induce maps of mapping cones and homotopy fibres, functorially.
- `TauCeti.SymmSpectrum.mappingCone_stableEquivalence` (relation): A map of arrows whose components are stable equivalences induces a stable equivalence of mapping cones and of homotopy fibres.

**Unit tests.**

- `mappingCone_id_trivial` (degenerate): mappingCone (𝟙 X) is stably contractible.
- `mappingCone_toZero` (computation): mappingCone (X ⟶ 0) ≅ susp X.
- `homotopyFiber_fromZero` (computation): homotopyFiber (0 ⟶ Y) ≅ loop Y.
- `mappingCone_not_quotient` (non-example): For a non-injective map, the strict cofibre (quotient) differs from the mapping cone: for X ⟶ 0 the quotient is 0 but the mapping cone is susp X.

**Uses.** H.6/moore-spectrum: S/m is the mapping cone of m : S → S; H.5:spectra/triangulated-structure: distinguished triangles are mapping-cone triangles; GeneralAlgebraicKTheory:K.6/milnor-square-excision-in-nonpositive-degrees: homotopy fibres and cofibres of maps of K-theory spectra.

**Acceptance.** C(id_X) is contractible (stably trivial). C(S → *) = S¹ ∧ S.

**Prerequisites.** `H.5:spectra/symmetric-spectrum`, `H.5:spectra/loop-shift-suspension`, `H.2/homotopy-fibre-and-long-exact-sequence`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Examples 2.4 and 2.6, pp. 229–230 (PDF 230–231).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/StableHomotopyCategory`, namespace `TauCeti`.

#### `H.5:spectra/cofibre-long-exact-sequence` — Long exact sequences of homotopy groups for cofibres and fibres of spectra

*Theorem.* For every morphism f : X → Y of symmetric spectra, the sequences ⋯ → π_k X → π_k Y → π_k C(f) →δ π_{k−1} X → ⋯ and ⋯ → π_k F(f) → π_k X → π_k Y → π_{k−1} F(f) → ⋯ of abelian groups are exact in all integer degrees, naturally in f, both for naive and true homotopy groups.

**Hypotheses.** None beyond f a morphism of symmetric spectra (naive version for sequential spectra; true version via fibrant replacement).

**Construction or proof outline.**

1. Naive cofibre sequence: Schwede I Proposition 2.12 (exactness at π̂_k Y from the null-homotopy and at the other terms by stabilising representatives).
2. Naive fibre sequence: Schwede I Proposition 2.17, levelwise from H.2/long-exact-sequence and passage to the colimit (filtered colimits are exact).
3. True homotopy groups: apply to a stably fibrant replacement of f (H.5:spectra/stable-model-structure).

**Acceptance.** For m : S → S, the cofibre sequence gives π_k S/m (H.6/bockstein-long-exact-sequence). Unlike for spaces, all terms are abelian groups and the sequence continues in negative degrees.

**Prerequisites.** `H.5:spectra/mapping-cone-and-homotopy-fibre`, `H.5:spectra/naive-homotopy-groups`, `H.5:spectra/true-homotopy-groups`, `H.2/long-exact-sequence`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter I, Proposition 2.12, p. 27 (PDF 28).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/StableHomotopyCategory`, namespace `TauCeti`.

#### `H.5:spectra/fibre-cofibre-shift` — Fibre and cofibre sequences agree up to a shift

*Lemma.* For f : X → Y, the natural map F(f) → Ω C(f) (and S¹ ∧ F(f) → C(f)) is a stable equivalence; equivalently, homotopy-cartesian squares of spectra are homotopy-cocartesian and conversely. The connecting maps of the two long exact sequences correspond under this identification, with the sign of the loop–suspension convention pinned by Schwede (2.4).

**Hypotheses.** Symmetric spectra.

**Construction or proof outline.**

1. Compare the two long exact sequences through the natural map F(f) → ΩC(f) and apply the five lemma (Schwede I Corollary 2.13 and 2.18, in which levelwise h-cofibrations and Serre fibrations give the same sequences).
2. Use H.5:spectra/stable-equivalence characterisation by homotopy groups.

**Acceptance.** F(X → 0) = X and ΩC(X → 0) = ΩΣX ≃ X. This stability fails for spaces: the fibre of S¹ → point is S¹, not Ω of its cofibre.

**Prerequisites.** `H.5:spectra/cofibre-long-exact-sequence`, `H.5:spectra/mapping-cone-and-homotopy-fibre`, `H.5:spectra/stable-equivalence`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter I, Corollaries 2.13 and 2.18, pp. 28–30 (PDF 29–31).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/StableHomotopyCategory`, namespace `TauCeti`.

#### `H.5:spectra/finite-biproducts` — Finite wedges and products of spectra agree

*Lemma.* For symmetric spectra X, Y the canonical map X ∨ Y → X × Y is a π̂_*-isomorphism (hence a stable equivalence), and π̂_k of an arbitrary wedge is the sum, π̂_k of a finite product the product, of the π̂_k. Consequently finite coproducts and products in SHC agree and SHC is additive.

**Hypotheses.** Finite products for the product statement; arbitrary wedges for the sum statement.

**Construction or proof outline.**

1. Schwede I Proposition 2.19: homotopy groups commute with wedges (compactness) and finite products (levelwise), and the map from the wedge to the product is a π̂_*-isomorphism because the inclusion of a wedge of spaces into the product is highly connected after suspension.
2. Additivity of SHC: Schwede II Proposition 1.12 and Corollary 1.13.

**Acceptance.** S ∨ S → S × S is a stable equivalence but not a levelwise weak equivalence (level 1: S¹ ∨ S¹ → S¹ × S¹).

**Prerequisites.** `H.5:spectra/naive-homotopy-groups`, `H.5:spectra/stable-equivalence`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter I, Proposition 2.19, p. 30 (PDF 31).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/StableHomotopyCategory`, namespace `TauCeti`.

#### `H.5:spectra/triangulated-structure` — The stable homotopy category is triangulated — planet: *Triangulated stable homotopy category*

*Theorem.* With shift Σ and distinguished triangles those isomorphic in SHC to mapping-cone triangles X → Y → C(f) → ΣX, the stable homotopy category is a triangulated category (Mathlib's Pretriangulated and IsTriangulated), and γ sends cofibre sequences to distinguished triangles. The resulting stable structure agrees with the abstract stable-category interface of EnhancedDerivedSheaves:E0 (homotopy category of a stable ∞-category), whose comparison is EnhancedDerivedSheaves:E5:spectra-comparison.

**Hypotheses.** SHC as in H.5:spectra/stable-homotopy-category.

**Construction or proof outline.**

1. Axioms (T0)–(T4) from the properties of mapping cones, additivity and Σ an equivalence (Schwede II Theorem 2.9 and its axiomatisation through cofibration categories).
2. Instantiate Mathlib's Pretriangulated and IsTriangulated classes.

**Acceptance.** π_* is a homological functor on SHC (Mathlib's Functor.IsHomological). Rotation of X → Y → C(f) → ΣX introduces the sign −Σf.

**Prerequisites.** `H.5:spectra/stable-homotopy-category`, `H.5:spectra/mapping-cone-and-homotopy-fibre`, `H.5:spectra/cofibre-long-exact-sequence`, `mathlib:CategoryTheory.Pretriangulated`, `mathlib:CategoryTheory.IsTriangulated`, `EnhancedDerivedSheaves:E0`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Theorem 2.9, p. 231 (PDF 232).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/StableHomotopyCategory`, namespace `TauCeti`.

#### `H.5:spectra/smash-product` — The smash product of symmetric spectra — planet: *Smash product of spectra*

*Construction.* The smash product X ∧ Y of symmetric spectra is the universal recipient of a bimorphism, i.e. of Σ_p × Σ_q-equivariant maps X_p ∧ Y_q → (X ∧ Y)_{p+q} compatible with the structure maps; concretely (X ∧ Y)_n = ⋁_{p+q=n} Σ_{n+} ∧_{Σ_p × Σ_q} X_p ∧ Y_q modulo the relations from the structure maps. With the associativity isomorphism and the twist isomorphism (which involves the shuffle permutation χ_{q,p}), ∧ is a closed symmetric monoidal structure on symmetric spectra with strict unit S and internal function spectra Hom(Y, Z).

**Hypotheses.** Symmetric spectra of simplicial sets; the closed structure uses the internal Hom spectrum.

**Construction or proof outline.**

1. Construct X ∧ Y as a coequaliser realising the universal bimorphism (Schwede I Construction 5.6).
2. Associativity, symmetry with the shuffle χ_{q,p}, unit S and the adjunction with Hom (Schwede I Theorem 5.10; Hovey–Shipley–Smith §2.2).

**API.**

- `TauCeti.SymmSpectrum.smash` (constructor): smash X Y with the universal bimorphism.
- `TauCeti.SymmSpectrum.smash.desc` (universal-property): Morphisms smash X Y ⟶ Z correspond bijectively to bimorphisms (X, Y) → Z.
- `TauCeti.SymmSpectrum.monoidal` (instance): A symmetric monoidal category structure (smash, sphere) on symmetric spectra.
- `TauCeti.SymmSpectrum.internalHom` (constructor): The internal Hom spectrum, right adjoint to smash − Y (closed monoidal).
- `TauCeti.SymmSpectrum.smash_suspensionSpectrum` (compatibility): smash (suspensionSpectrum K) (suspensionSpectrum L) ≅ suspensionSpectrum (K ∧ L).
- `TauCeti.SymmSpectrum.mapSpace` (constructor): The simplicial mapping space map(X, Y) of morphisms, giving SymmSpectrum a simplicial enrichment.

**Unit tests.**

- `smash_sphere_left` (degenerate): smash sphere X ≅ X (strict unit).
- `smash_level_zero` (computation): (smash X Y)_0 = X_0 ∧ Y_0.
- `smash_suspension_compat` (compatibility): smash (suspensionSpectrum S⁰) X ≅ X compatibly with the unit isomorphism.
- `smash_twist_sphere_sign` (non-example): The twist on smash (S¹-shifted sphere) (S¹-shifted sphere) is not the identity in SHC: it acts by −1 on π₂ (H.5:spectra/twist-sign).

**Uses.** GeneralAlgebraicKTheory:K.7/products-from-biexact-functors: the K-theoretic pairing K(A) ∧ K(B) → K(C) is built on this smash product; H.6/coefficient-spectrum: E/m = E ∧ S/m; H.5:spectra/ring-spectrum: ring spectra are monoids for ∧; RefinedTraceMethods:RT.2: THH(R) as a cyclic bar construction in symmetric spectra.

**Acceptance.** S ∧ X ≅ X. Σ^∞K ∧ Σ^∞L ≅ Σ^∞(K ∧ L).

**Prerequisites.** `H.5:spectra/symmetric-spectrum`, `H.5:spectra/simplicial-spheres-and-smash`, `H.5:spectra/suspension-spectrum`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter I, Construction 5.6 and Theorem 5.10, pp. 83–85 (PDF 84–86).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Smash`, namespace `TauCeti`.

#### `H.5:spectra/derived-smash-product` — The derived smash product on the stable homotopy category

*Theorem.* Smashing with a flat (S-cofibrant) symmetric spectrum preserves stable equivalences; hence the smash product has a left derived functor ∧^L making SHC a closed symmetric monoidal category with strict unit S, with γ lax symmetric monoidal and γ(A) ∧^L γ(B) ≅ γ(A ∧ B) when A or B is flat. ∧^L is exact in each variable for the triangulated structure.

**Hypotheses.** Flat resolutions as in Schwede I Construction 5.53.

**Construction or proof outline.**

1. Smashing with flat spectra preserves level and stable equivalences (Schwede I Propositions 5.50, 5.54).
2. Construct ∧^L using functorial flat resolution and verify the closed symmetric monoidal structure (Schwede II Theorem 3.1); exactness in each variable (Schwede II §3).

**Acceptance.** X ∧^L S ≅ X. HA ∧^L HB has π₀ = A ⊗ B and π₁ = Tor(A, B).

**Prerequisites.** `H.5:spectra/smash-product`, `H.5:spectra/stable-homotopy-category`, `H.5:spectra/triangulated-structure`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Theorem 3.1, p. 239 (PDF 240).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Smash`, namespace `TauCeti`.

#### `H.5:spectra/twist-sign` — The sign of the twist on spheres

*Lemma.* In the stable homotopy category, the twist isomorphism S^p ∧^L S^q → S^q ∧^L S^p, composed with the identifications with S^{p+q}, is multiplication by (−1)^{pq}.

**Hypotheses.** Spheres S^p = Σ^p S, p, q ∈ ℤ, with Schwede's chosen isomorphisms α_{p,q} : S^{p+q} → S^p ∧^L S^q.

**Construction or proof outline.**

1. The twist of S¹ ∧ S¹ is a map of degree −1 on S² (permutation of coordinates), and degrees multiply (Schwede I Lemma 1.10 for the degree of permutations of spheres; II Propositions 4.4 and 4.8 for the graded bookkeeping).

**Acceptance.** For p = q = 1 the twist is −1. For p even the twist is the identity.

**Prerequisites.** `H.5:spectra/derived-smash-product`, `H.5:spectra/suspension-spectrum`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Propositions 4.4 and 4.8, pp. 250–251 (PDF 251–252).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Smash`, namespace `TauCeti`.

#### `H.5:spectra/homotopy-group-pairing` — The smash pairing on homotopy groups

*Construction.* For symmetric spectra X, Y there is a natural biadditive pairing · : π_p X ⊗ π_q Y → π_{p+q}(X ∧^L Y), x · y = (x ∧ y) ∘ α_{p,q}, associative and unital (with 1 ∈ π₀ S), graded commutative in the sense that τ_*(x · y) = (−1)^{pq} y · x, and compatible with maps: (f ∧ f′)_*(y · y′) = (−1)^{m′n} f_*(y) · f′_*(y′) for f of degree m, f′ of degree m′ and y ∈ π_n. If X is (k−1)-connected and Y is (l−1)-connected, X ∧^L Y is (k+l−1)-connected and π_k X ⊗ π_l Y → π_{k+l}(X ∧^L Y) is an isomorphism.

**Hypotheses.** True homotopy groups; derived smash product.

**Construction or proof outline.**

1. Define the pairing by smashing representatives and composing with α_{p,q} (Schwede II §4, (4.13)); the action of π^s_* on π_* X is the case Y = S (Schwede I Example 1.11).
2. Sign rules: Schwede II Proposition 4.11 with H.5:spectra/twist-sign.
3. Bottom-degree isomorphism: Schwede II Proposition 5.22.

**API.**

- `TauCeti.SymmSpectrum.piPairing` (constructor): piPairing : pi X p →+ pi Y q →+ pi (X ∧ᴸ Y) (p + q).
- `TauCeti.SymmSpectrum.piPairing_assoc` (relation): piPairing is associative under the associativity isomorphism of ∧ᴸ.
- `TauCeti.SymmSpectrum.piPairing_comm` (relation): τ_* (x · y) = (−1)^{pq} y · x.
- `TauCeti.SymmSpectrum.piPairing_unit` (simp): The class 1 ∈ pi S 0 is a two-sided unit.
- `TauCeti.SymmSpectrum.piPairing_naturality` (functoriality): (f ∧ f′)_*(y · y′) = (−1)^{m′n} f_* y · f′_* y′ for f′ of degree m′ and y ∈ π_n Y (Schwede II (4.12)).
- `TauCeti.SymmSpectrum.piPairing_bottom_iso` (characterisation): For (k−1)- and (l−1)-connected X, Y the pairing in degrees k, l is an isomorphism.

**Unit tests.**

- `piPairing_sphere_ring` (computation): pi S * with piPairing is a graded-commutative ring with pi S 0 ≅ ℤ.
- `piPairing_zero_spectrum` (degenerate): piPairing with the trivial spectrum is zero.
- `piPairing_HA_HB` (compatibility): For abelian groups A, B, piPairing in degrees (0, 0) for HA, HB is the canonical map A ⊗ B → π₀(HA ∧ᴸ HB), an isomorphism.
- `piPairing_not_commutative` (non-example): piPairing is not commutative without sign: for ι ∈ pi S¹ 1 (S¹ = ΣS), ι · ι = −τ_*(ι · ι).

**Uses.** GeneralAlgebraicKTheory:K.7/graded-commutativity: graded commutativity of products on K-groups; H.6/moore-spectrum-multiplication: products on mod-m homotopy groups; K3BlochGroups:V.1/hopf-minus-one-product-refinement: products with η ∈ π^s_1.

**Acceptance.** π_*S = π^s_* is a graded-commutative ring under this pairing (η² ≠ 0 in π₂). For HA, HB: π₀(HA ∧^L HB) ≅ A ⊗ B (connectivity statement).

**Prerequisites.** `H.5:spectra/derived-smash-product`, `H.5:spectra/twist-sign`, `H.5:spectra/true-homotopy-groups`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Proposition 4.11, p. 252 (PDF 253).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Smash`, namespace `TauCeti`.

#### `H.5:spectra/ring-spectrum` — Symmetric ring spectra and module spectra

*Definition.* A symmetric ring spectrum is a monoid (R, μ : R ∧ R → R, ι : S → R) in symmetric spectra, equivalently Σ_n × Σ_m-equivariant multiplications R_n ∧ R_m → R_{n+m} with unit maps S⁰ → R₀, S¹ → R₁ satisfying associativity, unit and centrality conditions; commutative if μ ∘ twist = μ. A (right) R-module is an M with action M ∧ R → M. Module spectra over R form a stable model category whose homotopy category is triangulated.

**Hypotheses.** Symmetric spectra with the smash product of H.5:spectra/smash-product.

**Construction or proof outline.**

1. Definition by explicit multiplication maps (Schwede I Definitions 1.3, 1.5) and its equivalence with monoids for ∧ (Schwede I Theorem 5.25).
2. Model structure on R-modules (Schwede IV §1; Shipley Corollary 2.15 for HR).

**API.**

- `TauCeti.SymmRingSpectrum` (structure): Monoids in (SymmSpectrum, smash, sphere): multiplication and unit with associativity and unit laws.
- `TauCeti.SymmRingSpectrum.IsCommutative` (constructor): The commutativity condition μ ∘ braiding = μ.
- `TauCeti.SymmRingSpectrum.Module` (structure): Right modules: M with M ∧ R ⟶ M associative and unital.
- `TauCeti.SymmRingSpectrum.levelMul` (characterisation): A ring spectrum is equivalently given by equivariant level multiplications R_n ∧ R_m → R_{n+m} with unit maps (Schwede I Theorem 5.25).
- `TauCeti.SymmRingSpectrum.piRing` (projection): pi R * is a graded ring via H.5:spectra/homotopy-group-pairing, graded-commutative if R is commutative.

**Unit tests.**

- `sphere_initial_ring` (characterisation): sphere is the initial symmetric ring spectrum.
- `ringSpectrum_trivial` (degenerate): The trivial spectrum is a (zero) ring spectrum, terminal among ring spectra.
- `ringSpectrum_HZ_pi` (compatibility): pi (HZ) 0 ≅ ℤ as rings.
- `ringSpectrum_moore_two_not_ring` (non-example): The mod-2 Moore spectrum S/2 admits no homotopy-unital multiplication: 2 ≠ 0 on S/2 (π₂(S/2) = ℤ/4), so it is not a ring spectrum even up to homotopy.

**Uses.** H.6/burklund-moore-multiplicative: E_n-algebra structures on Moore spectra; KTheoryLowDegrees:Z.3/ring-spectrum-det: K(R) as a ring spectrum and det as a map of E∞-ring spectra; RefinedTraceMethods:RT.4:q-Hodge: S_R ⊗ Hℤ ≃ HR as ring spectra; HabiroRings:HR.2/the-monoidal-structure: module spectra over S[q^{±1}].

**Acceptance.** S is the initial ring spectrum. For a commutative ring R, HR is a commutative ring spectrum (H.5:spectra/eilenberg-maclane-ring).

**Prerequisites.** `H.5:spectra/smash-product`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter I, Definitions 1.3 and 1.5, pp. 9–10 (PDF 10–11); Theorem 5.25, p. 92 (PDF 93).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Ring`, namespace `TauCeti`.

#### `H.5:spectra/operadic-algebras` — Operads and E∞-algebras in symmetric spectra

*Construction.* An operad O of symmetric spectra is a sequence O(n) with right Σ_n-actions, a unit S → O(1) and associative, equivariant, unital composition maps; an O-algebra is a spectrum A with maps O(n) ∧_{Σ_n} A^{∧n} → A. For an E∞ operad of simplicial sets (contractible O(n) with free Σ_n-action), O-algebras realise E∞-ring spectra; commutative symmetric ring spectra are Com-algebras. Algebras over suitable operads carry model structures with weak equivalences the underlying stable equivalences, and E∞-algebras and commutative symmetric ring spectra have equivalent homotopy theories (in the positive model structure). The comparison with the abstract E∞-algebras of EnhancedDerivedSheaves:E5:abstract is part of EnhancedDerivedSheaves:E5:spectra-comparison.

**Hypotheses.** Positive (flat) stable model structure for model structures on algebras; the E∞/commutative comparison is quoted (Schwede III §6), not proved in the passages read (packet gap 'Model structures on algebras over operads').

**Construction or proof outline.**

1. Define operads and algebras (Schwede III Definitions 5.3, 5.4); operads of simplicial sets give operads of spectra by Σ^∞₊ (Example 5.6).
2. Model structures on O-algebras: Schwede III §6 (quoted).

**API.**

- `TauCeti.SymmSpectrum.Operad` (structure): Operads in symmetric spectra: O n with Σ_n-action, unit and composition.
- `TauCeti.SymmSpectrum.Operad.Algebra` (structure): Algebras over an operad.
- `TauCeti.SymmSpectrum.Operad.ofSSet` (constructor): The operad Σ^∞₊ O for an operad O of simplicial sets.
- `TauCeti.SymmSpectrum.Operad.comAlgebraEquiv` (equivalence): Com-algebras are exactly commutative symmetric ring spectra.
- `TauCeti.SymmSpectrum.Operad.IsEInfty` (constructor): An operad of simplicial sets is E∞ if each O(n) is contractible with free Σ_n-action.

**Unit tests.**

- `operad_com_algebra_HR` (computation): For a commutative ring R, HR is a Com-algebra.
- `operad_trivial_algebra` (degenerate): The trivial spectrum is an algebra over every operad.
- `operad_ass_ring_compat` (compatibility): Algebras over the associative operad are exactly symmetric ring spectra (H.5:spectra/ring-spectrum).
- `operad_moore_two_not_A2` (non-example): S/2 admits no algebra structure over the associative operad, nor any unital A₂-structure.

**Uses.** H.6/burklund-moore-multiplicative: E_n-structures on Moore spectra are algebras over little-cubes operads; KTheoryLowDegrees:Z.3/ring-spectrum-det: E∞-ring structure on K(R); HabiroRings:HR.2/spherical-rational-localization: E∞-refinement of spherical group rings S[ℤ].

**Acceptance.** Com-algebras are commutative symmetric ring spectra; Ass-algebras are ring spectra (Schwede III Examples 5.9–5.10). HR for commutative R is a Com-algebra.

**Prerequisites.** `H.5:spectra/smash-product`, `H.5:spectra/ring-spectrum`, `H.5:spectra/stable-model-structure`, `EnhancedDerivedSheaves:E5:abstract`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter III, Definitions 5.3–5.4 and Examples 5.9–5.12, pp. 368–370 (PDF 369–371).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Operad`, namespace `TauCeti`.

#### `H.5:spectra/eilenberg-maclane-spectrum` — Eilenberg–Mac Lane spectra of abelian groups — planet: *Eilenberg–Mac Lane spectra*

*Construction.* For an abelian group A, the Eilenberg–Mac Lane spectrum HA has n-th level the reduced A-linearisation A[Sⁿ] (the simplicial abelian group A ⊗ ℤ̃[Sⁿ]), with Σ_n permuting sphere coordinates and structure maps (Σ a_i x_i) ∧ y ↦ Σ a_i (x_i ∧ y). Each |A[Sⁿ]| is a K(A, n) (Dold–Thom), HA is an Ω-spectrum with π₀ HA = A and π_k HA = 0 for k ≠ 0, and A ↦ HA is an additive functor Ab → Sp. For the integers, HZ = (ℤ̃[Sⁿ]) as in Hovey–Shipley–Smith Example 1.2.5.

**Hypotheses.** A abelian. The identification |A[Sⁿ]| ≃ K(A, n) uses the Dold–Kan correspondence (Mathlib) and the computation of homotopy groups of simplicial abelian groups as homology of their normalised complexes (Moore), not in the libraries (packet gap 'Homotopy groups of simplicial abelian groups').

**Construction or proof outline.**

1. Define the levels and structure maps (Schwede I Example 1.14; Hovey–Shipley–Smith Example 1.2.5).
2. π_k |A[Sⁿ]| = H̃_k(Sⁿ; A), via the normalised chains of A[Sⁿ] (Mathlib's Dold–Kan normalised Moore complex) and Moore's theorem; hence A[Sⁿ] is a K(A, n) (H.3/eilenberg-maclane-space) and σ̃_n is a weak equivalence (Schwede I p. 17).
3. Hence HA is an Ω-spectrum with naive (= true) homotopy concentrated in degree 0 (Schwede I after Definition 1.15).

**API.**

- `TauCeti.SymmSpectrum.eilenbergMacLane` (constructor): eilenbergMacLane A with levels the reduced linearisation A[Sⁿ].
- `TauCeti.SymmSpectrum.eilenbergMacLane.map` (functoriality): A homomorphism A → B induces HA ⟶ HB, additively and functorially.
- `TauCeti.SymmSpectrum.eilenbergMacLane.isOmegaSpectrum` (characterisation): eilenbergMacLane A is an Ω-spectrum.
- `TauCeti.SymmSpectrum.eilenbergMacLane.piZeroEquiv` (equivalence): pi (eilenbergMacLane A) 0 ≃+ A and pi (eilenbergMacLane A) k = 0 for k ≠ 0.
- `TauCeti.SymmSpectrum.eilenbergMacLane.level_kpi` (compatibility): |level n| is an Eilenberg–Mac Lane space K(A, n) (H.3/eilenberg-maclane-space).
- `TauCeti.SymmSpectrum.eilenbergMacLane.uniqueness` (universal-property): For connective X, (X ⟶ HA) in SHC ≃ Hom(π₀ X, A); a spectrum with homotopy concentrated in degree 0 is uniquely isomorphic to H(π₀ X) (Schwede II Theorem 5.25).

**Unit tests.**

- `eilenbergMacLane_zero` (degenerate): eilenbergMacLane 0 is the trivial spectrum.
- `eilenbergMacLane_pi_Z` (computation): pi (eilenbergMacLane ℤ) 0 ≅ ℤ and pi (eilenbergMacLane ℤ) 1 = 0.
- `eilenbergMacLane_level_one` (compatibility): |level 1 of eilenbergMacLane A| is homotopy equivalent to Group.classifyingSpace A (both K(A, 1)).
- `eilenbergMacLane_not_sphere` (non-example): eilenbergMacLane ℤ is not stably equivalent to the sphere spectrum: pi S 3 = ℤ/24 ≠ 0.

**Uses.** H.6/bockstein-long-exact-sequence: the mod-m homotopy of HA is A/m in degree 0 and A[m] in degree 1; H.6/atiyah-hirzebruch-spectral-sequence: the E² page of the AHSS involves homology with coefficients in π_q E, i.e. HA-homology; RefinedTraceMethods:RT.4:q-Hodge: HR and S_R ⊗ Hℤ ≃ HR; EnhancedDerivedSheaves:E5:spectra-comparison: the Eilenberg–Mac Lane functor compared with the abstract D(ℤ) → Sp.

**Acceptance.** H(ℤ/2) has π₀ = ℤ/2. H is additive: H(A ⊕ B) ≅ HA × HB ≃ HA ∨ HB.

**Prerequisites.** `H.5:spectra/symmetric-spectrum`, `H.5:spectra/omega-spectra-and-eilenberg-maclane`, `H.3/eilenberg-maclane-space`, `mathlib:CategoryTheory.Abelian.DoldKan.equivalence`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter I, Example 1.14, p. 16 (PDF 17); HoveyShipleySmith-SymmetricSpectra-2000, Example 1.2.5.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/EilenbergMacLane`, namespace `TauCeti`.

#### `H.5:spectra/eilenberg-maclane-ring` — HR as a ring spectrum and HR-modules

*Construction.* For a ring R, HR is a symmetric ring spectrum with multiplication R[S^p] ∧ R[S^q] → R[S^{p+q}], (Σ a_i x_i) ∧ (Σ b_j y_j) ↦ Σ a_i b_j (x_i ∧ y_j), commutative when R is; an R-module M makes HM an HR-module spectrum. For commutative R, the homotopy category of HR-module spectra is equivalent, as a triangulated category, to the derived category D(R) (Shipley), with HR ↔ R.

**Hypotheses.** R a ring (commutative for the commutative ring spectrum and for Shipley's comparison).

**Construction or proof outline.**

1. The multiplication is the linearisation of the smash of spheres (Schwede I Example 1.14 and §1; Hovey–Shipley–Smith).
2. Shipley: a zig-zag of weak monoidal Quillen equivalences HZ-Mod ↔ Sp^Σ(sAb) ↔ Sp^Σ(ch₊) ↔ Ch, giving Ho(HR-Mod) ≃ D(R) (Shipley, Theorem 1.1 and Corollary 2.15).

**API.**

- `TauCeti.SymmSpectrum.eilenbergMacLaneRing` (constructor): eilenbergMacLaneRing R : SymmRingSpectrum with underlying spectrum eilenbergMacLane R.
- `TauCeti.SymmSpectrum.eilenbergMacLaneRing.isCommutative` (instance): For commutative R, eilenbergMacLaneRing R is commutative.
- `TauCeti.SymmSpectrum.eilenbergMacLaneModule` (constructor): For an R-module M, eilenbergMacLane M is an eilenbergMacLaneRing R-module.
- `TauCeti.SymmSpectrum.eilenbergMacLaneRing.piRingEquiv` (equivalence): pi (eilenbergMacLaneRing R) 0 ≃+* R.
- `TauCeti.SymmSpectrum.HRModDerivedEquiv` (equivalence): For commutative R, the homotopy category of HR-modules is equivalent to DerivedCategory (ModuleCat R) as triangulated categories (Shipley).

**Unit tests.**

- `eilenbergMacLaneRing_Z_pi` (computation): pi (eilenbergMacLaneRing ℤ) 0 ≃+* ℤ.
- `eilenbergMacLaneRing_zero` (degenerate): eilenbergMacLaneRing of the zero ring is the trivial ring spectrum.
- `eilenbergMacLaneRing_unit_compat` (compatibility): The unit S → HR induces ℤ → R on π₀, the canonical ring map.
- `eilenbergMacLaneRing_smash_not_self` (non-example): HF₂ ∧ᴸ HF₂ is not HF₂: its π₁ is nonzero (the dual Steenrod algebra has ξ₁ in degree 1), so HR ∧ᴸ HR ≠ HR in general.

**Uses.** RefinedTraceMethods:RT.4:q-Hodge: HR as a ring spectrum and S_R ⊗ Hℤ ≃ HR; H.5:spectra/eilenberg-maclane-of-chain-complex: HC for a complex of R-modules is an HR-module; H.6/atiyah-hirzebruch-spectral-sequence: module spectral sequences over π^s_* and HR.

**Acceptance.** π_* HR = R in degree 0 as a ring. HR-modules with homotopy concentrated in degree 0 are HM for R-modules M.

**Prerequisites.** `H.5:spectra/eilenberg-maclane-spectrum`, `H.5:spectra/ring-spectrum`, `mathlib:DerivedCategory`.

**Sources.** Shipley-HZAlgebra-2007, Theorem 1.1 and §2, pp. 2–6; Schwede-SymmetricSpectra-2012, Chapter I, Example 1.14, p. 16 (PDF 17).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/EilenbergMacLane`, namespace `TauCeti`.

#### `H.5:spectra/eilenberg-maclane-of-chain-complex` — The Eilenberg–Mac Lane spectrum of a chain complex

*Construction.* There is a functor H : Ch(ℤ) → Sp (to HZ-modules) from unbounded chain complexes of abelian groups, sending quasi-isomorphisms to stable equivalences, with natural isomorphisms π_k(HC) ≅ H_k(C) for all k ∈ ℤ, HA[0] ≅ HA for an abelian group A, H(C[1]) ≃ ΣHC, exact for the triangulated structures, and inducing an equivalence D(ℤ) ≃ Ho(HZ-Mod); for complexes of R-modules it lands in HR-modules. On connective complexes it is levelwise the Dold–Kan correspondence: (HC)_n ≃ Γ(τ_{≥0}(C ⊗ C̃(Sⁿ))).

**Hypotheses.** Unbounded chain complexes of abelian groups (or R-modules); the derived functor H = U L^{mon} c R of Shipley.

**Construction or proof outline.**

1. Define H as the composite U ∘ L ∘ c ∘ R of Shipley's zig-zag through Sp^Σ(sAb) and Sp^Σ(ch₊) (Shipley §2), using Mathlib's Dold–Kan equivalence levelwise for the Sp^Σ(sAb) ↔ Sp^Σ(ch₊) step.
2. π_k(HC) ≅ H_k(C): the equivalence of homotopy categories sends shifts of the unit to shifts of the unit, and π_k = [S^k, −] on HZ-modules corresponds to [ℤ[k], −] = H_k on D(ℤ) (Shipley Corollary 2.15).
3. Compatibility with HA: for C = A[0] the construction gives HA up to natural stable equivalence (H.5:spectra/eilenberg-maclane-spectrum, uniqueness of EM spectra).

**API.**

- `TauCeti.SymmSpectrum.eilenbergMacLaneComplex` (constructor): eilenbergMacLaneComplex : ChainComplex ℤ (all degrees) ⥤ module spectra over HZ.
- `TauCeti.SymmSpectrum.eilenbergMacLaneComplex.piIso` (characterisation): pi (eilenbergMacLaneComplex C) k ≅ homology C k for all k : ℤ, naturally.
- `TauCeti.SymmSpectrum.eilenbergMacLaneComplex.quasiIso` (relation): Quasi-isomorphisms go to stable equivalences.
- `TauCeti.SymmSpectrum.eilenbergMacLaneComplex.shift` (compatibility): H(C[1]) ≃ Σ H(C) naturally, and distinguished triangles go to distinguished triangles.
- `TauCeti.SymmSpectrum.eilenbergMacLaneComplex.single` (compatibility): H(A[0]) ≃ eilenbergMacLane A naturally in A.

**Unit tests.**

- `eilenbergMacLaneComplex_zero` (degenerate): The zero complex goes to a stably trivial spectrum.
- `eilenbergMacLaneComplex_single` (compatibility): eilenbergMacLaneComplex (A concentrated in degree 0) is stably equivalent to eilenbergMacLane A.
- `eilenbergMacLaneComplex_negative` (computation): For C = ℤ concentrated in degree −2, pi (H C) (−2) ≅ ℤ: negative homotopy is retained.
- `eilenbergMacLaneComplex_not_formal_over_Z4` (non-example): Over ℤ/4 the complex ℤ/4 →(·2) ℤ/4 (degrees 1, 0) has homology ℤ/2 in degrees 0 and 1 but is not quasi-isomorphic to the sum of its homology as ℤ/4-complexes, so its HZ/4-module spectrum is not a sum of shifted H(ℤ/2)'s as HZ/4-modules.

**Uses.** EnhancedDerivedSheaves:E5:spectra-comparison: the Eilenberg–Mac Lane functor D(ℤ) → Sp; SchemeKTheoryOperations:S.4: spectra of hypercohomology of complexes of sheaves; H.6/filtered-spectrum-spectral-sequence: the filtered chain complex case of the spectral sequence of a filtered spectrum.

**Acceptance.** For the complex ℤ →(·m) ℤ in degrees 1, 0, H(C) ≃ H(ℤ/m). π_k H(C) for C with H_* = ℤ in degrees 0 and −1 has π₀ = ℤ and π_{−1} = ℤ.

**Prerequisites.** `H.5:spectra/eilenberg-maclane-ring`, `H.5:spectra/eilenberg-maclane-spectrum`, `mathlib:CategoryTheory.Abelian.DoldKan.equivalence`, `H.5:spectra/triangulated-structure`.

**Sources.** Shipley-HZAlgebra-2007, §2, p. 6; Corollary 2.15.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/EilenbergMacLane`, namespace `TauCeti`.

#### `H.5:spectra/eilenberg-maclane-cohomology` — Eilenberg–Mac Lane spectra represent ordinary cohomology

*Theorem.* For a pointed simplicial set (or CW complex) K, an abelian group A and k ≥ 0, the natural map H̃^k(K; A) → [Σ^∞K, Σ^k HA]_{SHC} = H^k(Σ^∞K; A) is an isomorphism, and the right side vanishes for k < 0; unpointed: [Σ^∞_+X, Σ^k HA] ≅ H^k(X; A) (singular cohomology, Tau Ceti AlgebraicTopology stage 6). Dually π_k(HA ∧^L Σ^∞K) ≅ H̃_k(K; A).

**Hypotheses.** K a pointed simplicial set (cohomology of its realisation).

**Construction or proof outline.**

1. [Σ^∞K, Σ^k HA] ≅ [K, A[S^k]] since HA is an Ω-spectrum and Σ^∞ ⊣ ev₀; and [K, A[S^k]] ≅ [K, K(A, k)] ≅ H̃^k(K; A) (H.3/cohomology-representability) (Schwede II Proposition 6.23).
2. Homology: π_k(HA ∧ Σ^∞K) is the colimit of π_{k+n}(A[S^n] ∧ K) = H̃_{k+n}(S^n ∧ K; A) by Dold–Thom (Schwede II Definition 6.21 and Proposition 6.23 bracket remark).

**Acceptance.** For X a point, [Σ^∞_+ pt, Σ^k HA] = A for k = 0 and 0 otherwise. H^1(S¹; ℤ) = ℤ via [Σ^∞_+S¹, ΣHℤ].

**Prerequisites.** `H.5:spectra/eilenberg-maclane-spectrum`, `H.5:spectra/suspension-spectrum`, `H.5:spectra/stable-homotopy-category`, `H.3/cohomology-representability`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Proposition 6.23, p. 279 (PDF 280).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/EilenbergMacLane`, namespace `TauCeti`.

#### `H.5:spectra/postnikov-sections` — Connective covers and Postnikov sections of spectra — planet: *Postnikov sections and connective covers*

*Construction.* For every n ∈ ℤ, the inclusion of (n−1)-connected spectra into SHC has a right adjoint X ↦ τ_{≥n}X = X⟨n⟩ (the (n−1)-connected cover, counit q_n : X⟨n⟩ → X) and the inclusion of (n+1)-coconnected spectra (π_k = 0 for k > n) has a left adjoint X ↦ τ_{≤n}X = P_n X (unit p_n); there is a unique δ making X⟨n+1⟩ → X → P_n X → ΣX⟨n+1⟩ a distinguished triangle, with π_k(X⟨n⟩) = π_k X for k ≥ n and 0 below, π_k(P_n X) = π_k X for k ≤ n and 0 above. X is the homotopy colimit of the covers as n → −∞ and the homotopy limit of its Postnikov tower. The pair (connective, coconnective) is a t-structure on SHC with heart equivalent to abelian groups via π₀ and H.

**Hypotheses.** Functoriality in SHC (not on the point-set level); point-set functorial models via the positive model structure are not needed here.

**Construction or proof outline.**

1. Construct the cover from the localising subcategory generated by S^n (Schwede II Proposition 5.21 and Theorem 8.1), the section as the cone (Theorem 8.3).
2. π_* computations and uniqueness of δ (Schwede II Lemma 5.27).
3. t-structure and heart: Schwede II Remark 5.26 and Theorem 5.25; instantiate Mathlib's Triangulated.TStructure.
4. Homotopy limit of the Postnikov tower: Milnor sequence with lim¹ = 0 (Schwede II p. 297; H.6/milnor-sequence).

**API.**

- `TauCeti.SHC.connectiveCover` (constructor): connectiveCover n : SHC ⥤ SHC with counit q n : connectiveCover n X ⟶ X.
- `TauCeti.SHC.postnikovSection` (constructor): postnikovSection n : SHC ⥤ SHC with unit p n : X ⟶ postnikovSection n X.
- `TauCeti.SHC.postnikovTriangle` (other): The distinguished triangle connectiveCover (n+1) X ⟶ X ⟶ postnikovSection n X ⟶ Σ connectiveCover (n+1) X.
- `TauCeti.SHC.pi_connectiveCover` (characterisation): pi (connectiveCover n X) k ≅ pi X k for k ≥ n and = 0 for k < n.
- `TauCeti.SHC.pi_postnikovSection` (characterisation): pi (postnikovSection n X) k ≅ pi X k for k ≤ n and = 0 for k > n.
- `TauCeti.SHC.postnikovTStructure` (instance): The Postnikov t-structure on SHC (Mathlib Triangulated.TStructure) with heart ≃ abelian groups.
- `TauCeti.SHC.connectiveCover_adj` (universal-property): connectiveCover n is right adjoint to the inclusion of (n−1)-connected spectra.

**Unit tests.**

- `connectiveCover_connective` (degenerate): For connective X, connectiveCover 0 X ≅ X.
- `postnikovSection_zero_HA` (computation): postnikovSection 0 (connectiveCover 0 X) ≅ eilenbergMacLane (pi X 0).
- `connectiveCover_KU_ku` (compatibility): connectiveCover 0 KU ≅ ku, with pi ku 2 ≅ ℤ and pi ku (−2) = 0.
- `connectiveCover_not_identity_negative` (non-example): For X = Σ^{−1} HZ, connectiveCover 0 X = 0 although X ≠ 0: covers erase negative homotopy.

**Uses.** RefinedTraceMethods:RT.4:topological: ku as the connective cover of KU; KTheoryLowDegrees:Z.3/determinant-truncation: the determinant factors through the 1-truncation of K(R); HabiroRings:HR.2/the-solid-comparison-is-bounded-below: the Postnikov t-structure and bounded-below spectra; SchemeKTheoryOperations:S.4: Postnikov towers of spectra in descent spectral sequences.

**Acceptance.** τ_{≥0} KU = ku (Schwede I Examples 1.19–1.20 give ku and KU; the connective cover map ku → KU is an isomorphism on π_k for k ≥ 0). The connective cover of a connective spectrum is itself; P₀ of a connective X is Hπ₀X. The connective cover must not silently erase negative K-groups: τ_{≥0} of nonconnective K-theory loses K_{<0}.

**Prerequisites.** `H.5:spectra/stable-homotopy-category`, `H.5:spectra/triangulated-structure`, `H.5:spectra/true-homotopy-groups`, `mathlib:CategoryTheory.Triangulated.TStructure`, `H.5:spectra/eilenberg-maclane-spectrum`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Theorems 8.1 and 8.3, pp. 295–296 (PDF 296–297).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Postnikov`, namespace `TauCeti`.

#### `H.5:spectra/sequential-homotopy-colimit` — Sequential homotopy colimits of spectra

*Construction.* For a sequence X₀ → X₁ → X₂ → ⋯ of spectra, the homotopy colimit (mapping telescope) hocolim X_n fits into a distinguished triangle ⊕X_n →(1 − shift) ⊕X_n → hocolim X_n → Σ⊕X_n; for every homological functor E (for example π_k) the map colim E(X_n) → E(hocolim X_n) is an isomorphism, and for cohomological E there is the Milnor sequence 0 → lim¹ E(ΣX_n) → E(hocolim X_n) → lim E(X_n) → 0. On the point-set level the telescope of symmetric spectra computes it.

**Hypotheses.** Countable sequences; SHC has countable sums (wedges).

**Construction or proof outline.**

1. Define the homotopy colimit in the triangulated category with sums (Schwede II Definition 5.3); colimit property of homological functors and Milnor sequence for cohomological ones (Schwede II Lemma 5.6, (5.7)–(5.8)).
2. Point-set telescope: Schwede II Proposition 5.11 and I Example 2.21.

**API.**

- `TauCeti.SHC.hocolimSeq` (constructor): hocolimSeq (X : ℕ ⥤ SHC) with maps φ n : X n ⟶ hocolimSeq X and the defining triangle.
- `TauCeti.SHC.hocolimSeq_pi` (characterisation): colim_n pi (X n) k ≅ pi (hocolimSeq X) k.
- `TauCeti.SHC.hocolimSeq_milnor` (other): For cohomological E, 0 → lim¹ E(Σ X n) → E(hocolimSeq X) → lim E(X n) → 0 is exact (lim¹ of a tower of abelian groups from ArithmeticGaloisDuality:R02.1).
- `TauCeti.SymmSpectrum.telescope` (constructor): The point-set mapping telescope of a sequence of symmetric spectra, representing hocolimSeq.

**Unit tests.**

- `hocolimSeq_const` (degenerate): For the constant sequence with identity maps, hocolimSeq X ≅ X 0.
- `hocolimSeq_mul_rational` (computation): For S →1 S →2 S →3 ⋯ (multiplication by n at stage n), pi (hocolimSeq) 0 ≅ ℚ.
- `hocolimSeq_pi_compat` (compatibility): The colimit of pi agrees with pi of the point-set telescope.
- `hocolimSeq_not_sum` (non-example): The homotopy colimit is not the sum: for the constant sequence S with identity maps hocolimSeq ≅ S, whereas pi₀ of ⊕_n S is ⊕_n ℤ.

**Uses.** H.6/rationalisation: E_ℚ as the homotopy colimit of E → E → ⋯ along multiplication by 1, 2, 3, …; H.6/qp-zp-coefficients: E ∧ S/p^∞ as the homotopy colimit of E/p^r; GeneralAlgebraicKTheory:K.6/nonconnective-spectrum: the Bass delooping as a homotopy colimit; HabiroRings:HR.2/spectral-habiro-completion: filtered colimits of spectra.

**Acceptance.** π_k commutes with sequential homotopy colimits (Schwede II Corollary 5.10). X ≃ hocolim of its connective covers X⟨n⟩ as n → −∞ (H.5:spectra/postnikov-sections).

**Prerequisites.** `H.5:spectra/triangulated-structure`, `H.5:spectra/finite-biproducts`, `H.5:spectra/naive-homotopy-groups`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Definition 5.3 and Lemma 5.6, pp. 256–258 (PDF 257–259).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/HomotopyColimit`, namespace `TauCeti`.

#### `H.5:spectra/connective-spectra-via-deloopings` — Connective spectra are sequences of deloopings

*Comparison.* The homotopy theory of connective spectra is equivalent to that of sequences (X_i)_{i≥0} of pointed spaces with X_i (i−1)-connected (π_j X_i = 0 for j < i) and weak equivalences X_i ≃ ΩX_{i+1}: a connective Ω-spectrum X gives (|X_i|), and conversely a sequence of deloopings defines a sequential Ω-spectrum whose symmetric replacement is connective. Under this equivalence π_k of the spectrum is π_{k+i} X_i.

**Hypotheses.** Pointed spaces of CW homotopy type; 'i-connected' in Bhatt–Scholze's convention means π_j = 0 for j < i (their footnote 29).

**Construction or proof outline.**

1. Bhatt–Scholze define connective spectra as the limit of S_* ←Ω S_*^{≥1} ←Ω ⋯ (Definition 12.8); the strict model is the Ω-spectrum (H.5:spectra/omega-spectra-and-eilenberg-maclane) with symmetric structure supplied by the comparison of sequential and symmetric spectra (Schwede I §7, not read in detail; Hovey–Shipley–Smith §4).
2. Connectivity of the levels is equivalent to connectivity of the spectrum for Ω-spectra.

**Acceptance.** The K-theory spectrum of a Waldhausen category is the sequence |wS^{(n)}C| (H.5:S-delooping/iterated-S-construction-omega-spectrum). HA corresponds to (K(A, i))_i.

**Prerequisites.** `H.5:spectra/omega-spectra-and-eilenberg-maclane`, `H.4/segal-delooping-theorem`.

**Sources.** BhattScholze-WittGrassmannian-2017, Appendix §12, Definition 12.8 and footnote 29, p. 57.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Connective`, namespace `TauCeti`.

#### `H.5:spectra/grouplike-einfty-connective-spectra` — Grouplike E∞-monoids are connective spectra

*Theorem.* Segal's machine X ↦ (X, BX, B²X, …) (H.4/segal-delooping-theorem) gives an equivalence between the homotopy theory of grouplike special Γ-spaces (grouplike E∞-monoids) and that of connective spectra, inverse to taking the underlying infinite loop space with its E∞-structure; any two such equivalences agree (May–Thomason).

**Hypotheses.** Equivalence of homotopy theories (∞-categories, or homotopy categories with the model-categorical comparison); proofs quoted: Segal 1974 Proposition 3.4, Lurie HA 5.2.6.10, May–Thomason 1978 (not read; packet gap 'Infinite loop space machine equivalence').

**Construction or proof outline.**

1. Segal's construction lands in connective Ω-spectra by H.4/segal-delooping-theorem; the inverse uses that every connective spectrum has a canonical E∞-monoid structure since finite coproducts and products agree (H.5:spectra/finite-biproducts) (Bhatt–Scholze sketch after Theorem 12.9).

**Acceptance.** The Γ-space of an abelian group A corresponds to HA. N(Fin) (finite sets) is not grouplike (π₀ = ℕ); its group completion ΩB N(Fin) corresponds to the sphere spectrum (Barratt–Priddy–Quillen).

**Prerequisites.** `H.5:spectra/connective-spectra-via-deloopings`, `H.4/segal-delooping-theorem`, `H.4/gamma-space`, `H.5:spectra/finite-biproducts`.

**Sources.** BhattScholze-WittGrassmannian-2017, Appendix §12, Theorem 12.9, p. 57.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Connective`, namespace `TauCeti`.

#### `H.5:spectra/picard-one-truncated-spectra` — Picard groupoids are 1-truncated connective spectra

*Theorem.* For a Picard groupoid C (symmetric monoidal groupoid with all objects invertible), the spectrum K(C) associated with the grouplike E∞-monoid N(C) has underlying space |N(C)|, π₀ K(C) = C/≅, π₁ K(C) = Aut(1) and π_k = 0 otherwise; this gives an equivalence between Picard groupoids (with symmetric monoidal functors and monoidal natural isomorphisms) and 1-truncated connective spectra.

**Hypotheses.** C Picard; equivalence at the level of homotopy 2-categories / homotopy theories; Patel's comparison [Pat12, §3] quoted (packet gap 'Picard groupoids versus 1-truncated spectra').

**Construction or proof outline.**

1. N(C) is grouplike (H.4/picard-groupoid-grouplike) and 1-truncated (H.1/groupoid-nerve-one-type), so K(C) = Segal spectrum of N(C) is connective with π_k = 0 for k ≥ 2 (H.5:spectra/grouplike-einfty-connective-spectra).
2. The equivalence identifies both sides with grouplike E∞-monoids in groupoids (Bhatt–Scholze p. 59, citing Patel).

**Acceptance.** Pic^ℤ(R) gives the 1-truncated spectrum with π₀ = Pic(R) × H⁰(Spec R, ℤ), π₁ = R^×. The stable symmetric structure on Pic^ℤ(R) involves the sign (−1)^{fg} (Bhatt–Scholze Example 12.2(iii)).

**Prerequisites.** `H.5:spectra/grouplike-einfty-connective-spectra`, `H.4/picard-groupoid-grouplike`, `H.1/groupoid-nerve-one-type`, `H.5:spectra/postnikov-sections`.

**Sources.** BhattScholze-WittGrassmannian-2017, Appendix §12, after the proof of Proposition 12.15, p. 59.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Connective`, namespace `TauCeti`.

**Coverage.** Status `planned`. Remaining refinements: Kan–Quillen model structure, Moore's theorem for simplicial abelian groups, operadic model structures, the infinite loop space machine equivalence and Patel's Picard comparison are quoted (gaps); Homotopy limits of cosimplicial spectra with the Bousfield–Kan spectral sequence and Thomason's descent convergence criteria (requested by SchemeKTheoryOperations:S.4) and presheaves of spectra are not planned in this pass.

## H.5:S-delooping — Assembly of the K-theory spectrum

RS-33 narrows this layer to the assembly of the iterated Waldhausen S-construction as a connective spectrum in the H.5:spectra model, with the model, indexing and naturality comparisons, using the additivity theorem, the relative S-fibration and the delooping theorem supplied by GeneralAlgebraicKTheory:K.4:construction; the smash product and pairing are re-exported from H.5:spectra (the declarations H.5:spectra/smash-product, H.5:spectra/derived-smash-product and H.5:spectra/homotopy-group-pairing), and the biexact external product belongs to GeneralAlgebraicKTheory:K.7 (RT-AREA-ktheory-1/4). The K-theory symmetric spectrum of Schwede I.3.50 has n-th level |wS^{(n)}C|, is a positive Ω-spectrum and is semistable, so its homotopy groups are K_i(C) for i ≥ 0 and vanish below.

### Declarations of H.5:S-delooping

#### `H.5:S-delooping/k-theory-symmetric-spectrum` — The K-theory symmetric spectrum of a Waldhausen category — planet: *K-theory spectrum*

*Construction.* For a small Waldhausen category C (with chosen zero object, cofibrations and weak equivalences), the K-theory spectrum K(C) is the symmetric spectrum with n-th level the realisation |w S^{(n)} C| of the n-fold iterated (cubical) S-construction S^{{1,…,n}}C (diagonal of the n-simplicial set of weak equivalences), Σ_n permuting the n directions, and structure maps S¹ ∧ |wS^{(n)}C| → |wS^{(n+1)}C| induced by the inclusion of 1-simplices (S₁C ≅ C). It is a positive Ω-spectrum, semistable, with zeroth level |wC| (not group-completed).

**Hypotheses.** C a small Waldhausen category; the S^Q-construction with the cube conditions of Schwede I Example 3.50; the deloopings |wS^{(n)}C| ≃ Ω|wS^{(n+1)}C| for n ≥ 1 are supplied by GeneralAlgebraicKTheory:K.4:construction (additivity and the relative S-fibration).

**Construction or proof outline.**

1. Define S^Q_n C for finite sets Q as functors from the arrow category of [n]^Q satisfying the zero, cofibration-cube and pushout conditions (Schwede I Example 3.50); a choice of ordering of Q identifies it with the iterated S-construction.
2. The Σ_n-action permutes Q = {1, …, n}; the structure maps come from S₁C = C and the realisation of the multisimplicial set (H.2/simplicial-space-realisation, H.2/bisimplicial-realization-lemma).
3. Positive Ω-spectrum: the adjoint structure maps for n ≥ 1 are the deloopings of K.4:construction (Waldhausen §1.5; Weibel IV 8.5.5, V 1.7, whose fibration input is H.2/levelwise-fibration-realisation).

**API.**

- `TauCeti.WaldhausenCategory.kSpectrum` (constructor): kSpectrum C : SymmSpectrum with levels |w S^{(n)} C|.
- `TauCeti.WaldhausenCategory.kSpectrum.map` (functoriality): An exact functor F : C → D induces kSpectrum.map F, with map_id and map_comp on the nose.
- `TauCeti.WaldhausenCategory.kSpectrum.level_zero` (characterisation): level 0 of kSpectrum C is the nerve of wC (realised: |wC|).
- `TauCeti.WaldhausenCategory.kSpectrum.isPositiveOmega` (characterisation): kSpectrum C is a positive Ω-spectrum (GeneralAlgebraicKTheory:K.4:construction deloopings).
- `TauCeti.WaldhausenCategory.kSpectrum.isSemistable` (characterisation): kSpectrum C is semistable.
- `TauCeti.WaldhausenCategory.kSpectrum.sequentialComparison` (compatibility): The underlying sequential spectrum agrees with Weibel's Ω|wS.C|, |wS.C|, |wS.S.C|, … up to the indexing shift and natural weak equivalence.

**Unit tests.**

- `kSpectrum_zero_category` (degenerate): kSpectrum of the trivial Waldhausen category (one object) is the trivial spectrum.
- `kSpectrum_finiteSets_sphere` (computation): kSpectrum of finite pointed sets is stably equivalent to the sphere spectrum (quoted Barratt–Priddy–Quillen–Segal).
- `kSpectrum_pi0_K0` (compatibility): pi (kSpectrum C) 0 ≅ K₀(C) (Weibel IV Proposition 8.4).
- `kSpectrum_level_zero_not_groupCompleted` (non-example): level 0 of kSpectrum (finite projective R-modules) is |w C|, not Ω|wS.C|: its π₀ is the monoid of iso classes, not K₀(R); only from level 1 on is it an Ω-spectrum.

**Uses.** GeneralAlgebraicKTheory:K.6/nonconnective-spectrum: the connective K-theory spectrum input to the Bass delooping; GeneralAlgebraicKTheory:K.7/products-from-biexact-functors: K(A) ∧ K(B) → K(C) is built from the symmetric structure and the smash product of H.5:spectra; KTheoryFiniteLocalFields:L.1/k-theory-mod-m: K(R; ℤ/m) = K(R)/m (H.6/coefficient-spectrum); SchemeKTheoryOperations:S.2: K and G spectra of schemes as Waldhausen K-theory of perfect complexes.

**Acceptance.** For C = finite pointed sets with injections as cofibrations, K(C) ≃ S (Barratt–Priddy–Quillen–Segal). For an exact category with isomorphisms as weak equivalences, Ω|iS.C| ≃ ΩBQC (Waldhausen 1.9, via GeneralAlgebraicKTheory).

**Prerequisites.** `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`, `H.5:spectra/symmetric-spectrum`, `H.5:spectra/semistable`, `H.2/simplicial-space-realisation`, `H.2/bisimplicial-realization-lemma`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter I, Example 3.50, pp. 55–57 (PDF 56–58); Weibel-KBook-IV, Infinite Loop Structure 8.5.5, p. IV.69.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/KTheory`, namespace `TauCeti`.

#### `H.5:S-delooping/iterated-S-construction-omega-spectrum` — The iterated S.-construction is a connective Ω-spectrum — planet: *Iterated S-construction spectrum*

*Theorem.* For a small Waldhausen category C with K(C) = Ω|wS.C| and π₁|wS.C| ≅ K₀(C), the K-theory symmetric spectrum (H.5:S-delooping/k-theory-symmetric-spectrum) is, from level 1 on, an Ω-spectrum: |wS^{(n)}C| → Ω|wS^{(n+1)}C| is a weak homotopy equivalence for n ≥ 1, using the deloopings supplied by GeneralAlgebraicKTheory:K.4:construction. Hence its true homotopy groups are π_i K(C) = π_{i+1}|wS.C| = K_i(C) for i ≥ 0 and 0 for i < 0. The biexact pairing K(A) ∧ K(B) → K(C) is not part of this node; it is owned by GeneralAlgebraicKTheory:K.7, which consumes the smash product of H.5:spectra.

**Hypotheses.** C small Waldhausen category; the S.-construction, additivity, the relative S.-fibration and the delooping |wS^{(n)}C| ≃ Ω|wS^{(n+1)}C| are supplied by GeneralAlgebraicKTheory:K.4:construction (requested).

**Construction or proof outline.**

1. π₁ of a simplicial space X. with X₀ a point is the free group on π₀(X₁) modulo ∂₁x = ∂₂x·∂₀x; for X. = BwS.C this is K₀(C) (Weibel IV Proposition 8.4).
2. The deloopings for n ≥ 1 are those of K.4:construction (Weibel V 1.7 with H.2/levelwise-fibration-realisation).
3. Assemble: an Ω-spectrum from level 1 has π_i = π_{i+1} of level 1 for i ≥ 0 (H.5:spectra/omega-spectra-and-eilenberg-maclane), and the spectrum is connective since level n is (n−1)-connected.

**Acceptance.** For an exact category A with isomorphisms as weak equivalences, |iS.A| ≃ BQA (Waldhausen 1.9; Weibel IV Exercises 8.5–8.6). Relative groups end with K₀(B) → K₀(C) → K₋₁(f) → 0 (Weibel IV Exercise 8.11). A sequence of spaces without the fibration theorem does not count as the spectrum.

**Prerequisites.** `H.5:S-delooping/k-theory-symmetric-spectrum`, `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`, `H.5:spectra/omega-spectra-and-eilenberg-maclane`, `H.5:spectra/true-homotopy-groups`, `H.2/levelwise-fibration-realisation`.

**Sources.** Weibel-KBook-IV, Proposition 8.4 with proof, Definition 8.5, 8.5.3–8.5.5, pp. IV.68–69; Weibel-KBook-V, Proposition 1.7 and Remark 1.7.1, p. V.8.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/KTheory`, namespace `TauCeti`.

#### `H.5:S-delooping/k-theory-spectrum-functoriality` — Functoriality and homotopy invariance of the K-theory spectrum

*Lemma.* Exact functors F : C → D induce maps of K-theory spectra, strictly functorially; a natural weak equivalence F ⇒ F′ of exact functors induces a homotopy (in the stable homotopy category, equality) K(F) = K(F′); an exact equivalence of Waldhausen categories induces a stable equivalence. The assembly is compatible with the sequential model (Weibel IV 8.5.5) and with Quillen's Q-construction for exact categories up to natural stable equivalence.

**Hypotheses.** Exact functors between small Waldhausen categories; natural weak equivalences (pointwise in w).

**Construction or proof outline.**

1. Functoriality of S^Q and of realisation; a natural weak equivalence gives a functor C × [1] → w-morphisms, hence a homotopy of realisations levelwise (H.1/natural-transformations-adjoints-contractibility applied in the w-direction).
2. Exact equivalences have exact inverses up to natural isomorphism.

**Acceptance.** The identity functor induces the identity. Weibel IV Exercises 8.5–8.6 compare with BQ.

**Prerequisites.** `H.5:S-delooping/k-theory-symmetric-spectrum`, `H.1/natural-transformations-adjoints-contractibility`, `H.5:spectra/stable-equivalence`.

**Sources.** Weibel-KBook-IV, Definition 8.5 and 8.5.3, p. IV.68.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/KTheory`, namespace `TauCeti`.

**Coverage.** Status `planned`.

## H.6 — Coefficients, completion and spectral sequences

RS-33 keeps the spectrum cofibres E/m with their Bockstein maps and exact sequences in all integer degrees without assuming a splitting, the actual E/pʳ tower and its homotopy limit, the spectrum Milnor sequence with map-level naturality and its reduction under module-level Mittag-Leffler and lim¹ conditions (imported from ArithmeticGaloisDuality:R02.1), the finiteness and Tate-term hypotheses for tensor-with-ℤ_p comparisons, filtered-spectrum exact couples with differentials and convergence under explicit completeness, boundedness and connectivity hypotheses, rationalisation and the arithmetic fracture square, and the comparison of the ordinary Eilenberg–Mac Lane/CW filtration case with Tau Ceti stage 4. RT-AREA-ktheory-1/23 makes H.6 the supplier of the generic exact-couple machinery used by SchemeKTheoryOperations:S.4, and RT-AREA-ktheory-2/29 places Burklund's multiplicative Moore spectra here.

**Objects.** Moore spectra S/m; E/m and π_*(E; ℤ/m); the mod-pʳ tower and S/p^∞; homotopy limits of towers; p-completion; rationalisation; filtered spectra and exact couples.

**Theorems.** The Bockstein long exact sequence; the universal coefficient sequence 0 → π_n E ⊗ ℤ/m → π_n(E; ℤ/m) → π_{n−1}(E)[m] → 0, split but not naturally unless m ≡ 2 mod 4 and non-split for π₂(S/2) = ℤ/4; ℚ_p/ℤ_p coefficients; the Milnor sequence and a tower with nonzero lim¹; the ℓ-adic extension with its Tate-module term and the Ext/Hom description of π_*(X^∧_p); finite generation implies π_*(X^∧_p) = π_* X ⊗ ℤ_p; criteria for p-completeness; rational spectra are generalised Eilenberg–Mac Lane spectra; the arithmetic square; the spectral sequence of a filtered spectrum with convergence for exhaustive bounded-below filtrations and for complete towers with connectivity; the Atiyah–Hirzebruch spectral sequence; Araki–Toda products on S/ℓ^ν and Burklund's E_n-structures on S/8, S/32 and S/p^{n+1}.

**Acceptance.** A Bockstein sequence with a nonzero torsion right term (π₂(S/2) = ℤ/4; K₂(ℤ; ℤ/2) = ℤ/4) and a tower with a nonzero derived-limit obstruction (H.6/nonzero-lim-one-example) are part of the layer.

### Declarations of H.6

#### `H.6/moore-spectrum` — Moore spectra S/m — planet: *Moore spectrum*

*Construction.* For an integer m ≥ 1, the mod-m Moore spectrum S/m is the mapping cone of m : S → S (multiplication by m on the sphere spectrum), with the distinguished triangle S →m S → S/m →δ S¹. It is a connective Moore spectrum for ℤ/m: H₀(S/m; ℤ) = ℤ/m and H_k = 0 otherwise; π₀(S/m) = ℤ/m. Moore spectra are unique up to (non-unique) isomorphism in SHC, and homomorphisms of H₀ lift to maps but not functorially; for m odd (or ℤ/m 2-divisible) the lift is preferred.

**Hypotheses.** m ≥ 1; the point-set model is the mapping cone of a representative of m (for example the degree-m self-map of S¹ on level 1 of the free spectrum), well defined up to isomorphism in SHC.

**Construction or proof outline.**

1. Define S/m as the mapping cone (H.5:spectra/mapping-cone-and-homotopy-fibre) of m · id_S (Schwede II Definition 6.33 and the triangle in Remark/Example around Proposition 6.48).
2. Homology: the long exact sequence in HZ-homology gives H₀ = ℤ/m, others zero.
3. Limited functoriality: Schwede II Theorem 6.43 and Remark 6.44.

**API.**

- `TauCeti.SHC.moore` (constructor): moore m : SHC with the distinguished triangle S →(m) S → moore m →(δ) Σ S.
- `TauCeti.SHC.moore.homologyZero` (characterisation): H₀(moore m; ℤ) ≅ ZMod m and H_k = 0 for k ≠ 0.
- `TauCeti.SHC.moore.piZero` (characterisation): pi (moore m) 0 ≅ ZMod m and pi (moore m) k = 0 for k < 0.
- `TauCeti.SHC.moore.bockstein` (data): The connecting map δ : moore m → Σ S.
- `TauCeti.SHC.moore.liftHom` (universal-property): Every homomorphism ZMod m → ZMod m′ lifts to a map moore m → moore m′ inducing it on H₀ (not functorially).

**Unit tests.**

- `moore_one_trivial` (degenerate): moore 1 is a zero object of SHC.
- `moore_two_pi_two` (computation): pi (moore 2) 2 ≅ ZMod 4, generated by a lift of η.
- `moore_homology_compat` (compatibility): H_k(moore m; ℤ) ≅ H̃_{k+n−1}(P^n(ℤ/m); ℤ) for n ≥ 2, where P^n(ℤ/m) = S^{n−1} ∪_m eⁿ is Weibel's Moore space, whose only nonzero reduced homology is H̃_{n−1} = ℤ/m (Weibel prints H̃_n, packet source issue StableHomotopyKTheory/E5); so H₀(moore m) = ℤ/m and H_k = 0 otherwise.
- `moore_two_not_ring` (non-example): 2 • 𝟙 (moore 2) ≠ 0 in SHC, so S/2 admits no unital multiplication.

**Uses.** H.6/coefficient-spectrum: E/m := E ∧ S/m; H.6/burklund-moore-multiplicative: E_n-algebra structures on S/p^q; RefinedTraceMethods:RT.5: Moore spectra with multiplicative structures in the Meyer–Wagner computation; KTheoryFiniteLocalFields:L.4/moore-spectrum-splitting-for-hz-modules: HZ ∧ S/m ≃ H(ℤ/m) and splittings for HZ-modules.

**Acceptance.** π₂(S/2) ≅ ℤ/4 (Schwede II Proposition 6.48), so S/2 is not a ring spectrum and 2 · id_{S/2} ≠ 0. S/1 is stably trivial.

**Prerequisites.** `H.5:spectra/mapping-cone-and-homotopy-fibre`, `H.5:spectra/suspension-spectrum`, `H.5:spectra/triangulated-structure`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Definition 6.33, p. 284 (PDF 285); Proposition 6.48, p. 287 (PDF 288); Weibel-KBook-IV, Definition 2.1, p. IV.18.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Coefficients`, namespace `TauCeti`.

#### `H.6/coefficient-spectrum` — Spectra with finite coefficients E/m

*Construction.* For a spectrum E and m ≥ 1, E/m is the cofibre of m : E → E, canonically E/m ≃ E ∧^L S/m in SHC, with the triangle E →m E → E/m →β ΣE; the mod-m homotopy groups are π_n(E; ℤ/m) := π_n(E/m) for all n ∈ ℤ, natural in E. For an Ω-spectrum E, π_n(E; ℤ/m) = colim_r π_{n+r}(E_r; ℤ/m) with Weibel's space-level groups [P^{n+r}(ℤ/m), E_r].

**Hypotheses.** E any spectrum (no connectivity assumption; negative degrees included).

**Construction or proof outline.**

1. Define E/m := mappingCone (m • 𝟙 E) (H.5:spectra/mapping-cone-and-homotopy-fibre) and identify with E ∧^L S/m by exactness of ∧^L (H.5:spectra/derived-smash-product).
2. Compare with Weibel's colimit formula (Weibel IV 2.3.1) through the Ω-spectrum levels.

**API.**

- `TauCeti.SHC.modM` (constructor): modM E m := mappingCone (m • 𝟙 E) with the triangle E →(m) E → modM E m →(β) Σ E.
- `TauCeti.SHC.modM.smashIso` (equivalence): modM E m ≅ E ∧ᴸ moore m naturally in E.
- `TauCeti.SHC.modM.functor` (functoriality): modM − m is an exact functor SHC ⥤ SHC.
- `TauCeti.SHC.piMod` (constructor): piMod E m n := pi (modM E m) n for n : ℤ.
- `TauCeti.SHC.modM.HA` (example): modM (HA) m has pi₀ ≅ A ⧸ mA and pi₁ ≅ A[m].

**Unit tests.**

- `modM_one` (degenerate): modM E 1 is a zero object.
- `modM_HZ` (computation): modM (eilenbergMacLane ℤ) m ≅ eilenbergMacLane (ZMod m).
- `modM_smash_compat` (compatibility): modM E m ≅ E ∧ᴸ moore m, so piMod (sphere) m 0 ≅ ZMod m.
- `modM_not_tensor` (non-example): piMod E m n is not π_n(E) ⊗ ℤ/m in general: for E = Σ H(ℤ/2) and m = 2, piMod E 2 2 ≅ ℤ/2 (the torsion term) while π₂(E) ⊗ ℤ/2 = 0.

**Uses.** HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class: K_m(R; ℤ/ℓ) and its universal coefficient sequence; KTheoryFiniteLocalFields:L.1/k-theory-mod-m: mod-m K-theory of finite fields; EllipticKTheory:E.5/geometric-elliptic-k-modules: K_n(X; ℤ/ℓ^r) for schemes; ArithmeticKTheory:N.6/finite-coefficient-divisibility-kernel: K(−; ℤ/m) with exact UCT compatible with ring maps.

**Acceptance.** (HA)/m has π₀ = A/m and π₁ = A[m]. K(R)/m defines K_n(R; ℤ/m) (Weibel IV Definition 2.4).

**Prerequisites.** `H.6/moore-spectrum`, `H.5:spectra/mapping-cone-and-homotopy-fibre`, `H.5:spectra/derived-smash-product`.

**Sources.** Weibel-KBook-IV, Definition 2.4 and Spectra 2.3.1, pp. IV.19–20; Schwede-SymmetricSpectra-2012, Chapter II, Remark 6.51, p. 288 (PDF 289).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Coefficients`, namespace `TauCeti`.

#### `H.6/bockstein-long-exact-sequence` — The Bockstein long exact sequence

*Theorem.* For every spectrum E and m ≥ 1 there is a natural long exact sequence ⋯ → π_n E →m π_n E → π_n(E; ℤ/m) →β π_{n−1} E →m π_{n−1} E → ⋯ in all degrees n ∈ ℤ, where β is induced by the connecting map E/m → ΣE.

**Hypotheses.** Any spectrum E.

**Construction or proof outline.**

1. Apply the long exact sequence of the triangle E →m E → E/m → ΣE (H.5:spectra/cofibre-long-exact-sequence; Weibel IV 2.1.1 for spaces via the cofibration S^{n−1} →ℓ S^{n−1} → P^n).

**Acceptance.** For E = S, m = 2: π₁ S →2 π₁ S is zero (π₁ S = ℤ/2), giving 0 → π₂(S) ⊗ ℤ/2 = ℤ/2 → π₂(S/2) → π₁(S)[2] = ℤ/2 → 0 (H.6/mod-l-homotopy-and-bockstein-sequence). Naturality in E commutes with the connecting maps.

**Prerequisites.** `H.6/coefficient-spectrum`, `H.5:spectra/cofibre-long-exact-sequence`.

**Sources.** Weibel-KBook-IV, 2.1.1 and Universal Coefficient Sequence 2.2, p. IV.18; Schwede-SymmetricSpectra-2012, Chapter I, Proposition 2.12, p. 27 (PDF 28).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Coefficients`, namespace `TauCeti`.

#### `H.6/mod-l-homotopy-and-bockstein-sequence` — The universal coefficient sequence for mod-m homotopy — planet: *Universal coefficient (Bockstein) sequence*

*Theorem.* For every spectrum E, m ≥ 1 and n ∈ ℤ there is a natural short exact sequence 0 → π_n(E) ⊗ ℤ/m → π_n(E; ℤ/m) → π_{n−1}(E)[m] → 0, where A[m] is the m-torsion subgroup. It splits (non-naturally) unless m ≡ 2 mod 4, and is not split in general for m ≡ 2 mod 4: π₂(S; ℤ/2) = π₂(S/2) ≅ ℤ/4. For K-theory: 0 → K_n(C) ⊗ ℤ/m → K_n(C; ℤ/m) → K_{n−1}(C)[m] → 0. Also π_n(E; ℤ/q₁q₂) ≅ π_n(E; ℤ/q₁) × π_n(E; ℤ/q₂) for coprime q₁, q₂.

**Hypotheses.** Any spectrum E; for spaces m ≥ 2 and degree restrictions as in Weibel IV 2.2.

**Construction or proof outline.**

1. Extract the short exact sequence from H.6/bockstein-long-exact-sequence: coker(m) = π_n ⊗ ℤ/m and ker(m) = π_{n−1}[m] (Weibel IV 2.2).
2. Splitting for m ≢ 2 mod 4: the identity of S/m has order m (Weibel IV 2.5 with Neisendorfer's argument Prop. 2.3); non-splitting for m = 2 from π₂(S/2) = ℤ/4 (Schwede II Proposition 6.48; Weibel IV Example 2.2.1).
3. Coprime factorisation: S/q₁ ∨ S/q₂ → S/ℓ is an equivalence (Weibel IV Proposition 2.7).

**Acceptance.** Nonsplit example: π_{m+2}(S^m; ℤ/2) = ℤ/4 for m ≥ 3 and π₂(BO; ℤ/2) = ℤ/4 (Weibel IV Example 2.2.1). K₂(ℤ; ℤ/2) ≅ ℤ/4 has a nonzero torsion right-hand term (Weibel IV Example 2.5.1). The Bott element in K₂(R; ℤ/ℓ) depends on the chosen splitting (Weibel IV Remark 2.5.3).

**Prerequisites.** `H.6/bockstein-long-exact-sequence`, `H.6/moore-spectrum`, `mathlib:AddSubgroup.torsionBy`.

**Sources.** Weibel-KBook-IV, Definition 2.1, 2.1.1, Universal Coefficient Sequence 2.2, Example 2.2.1, Proposition 2.3, 2.3.1, Definition 2.4, Theorem 2.5, Proposition 2.7, pp. IV.18–21; Schwede-SymmetricSpectra-2012, Chapter II, Proposition 6.48, p. 287 (PDF 288).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Coefficients`, namespace `TauCeti`.

#### `H.6/moore-spectrum-change-of-coefficients` — Transition maps between Moore spectra and the mod-p^r tower

*Construction.* For a prime p and r ≥ 1 there are maps ι_r : S/p^r → S/p^{r+1} realising multiplication by p : ℤ/p^r → ℤ/p^{r+1} on H₀ and ρ_r : S/p^{r+1} → S/p^r realising the reduction ℤ/p^{r+1} → ℤ/p^r, fitting into maps of defining triangles (identity and p on the two sphere terms), compatible with the Bocksteins; they induce maps E/p^r → E/p^{r+1} and E/p^{r+1} → E/p^r and the tower ⋯ → E/p^{r+1} → E/p^r → ⋯ → E/p. On homotopy they give the maps of universal coefficient sequences induced by p : ℤ/p^r → ℤ/p^{r+1} and reduction.

**Hypotheses.** p prime; the maps are chosen as maps of triangles (TR3), unique up to the indeterminacy of Moore-spectrum maps; for p odd the choices are canonical (2-divisibility).

**Construction or proof outline.**

1. Construct ι_r and ρ_r by the morphism-of-triangles axiom applied to (1, p) and (p, 1) on S →(p^r) S (H.5:spectra/triangulated-structure; Schwede II Theorem 9.9(iii) uses ψ_n : S/p^n → S/p^{n+1} realising p).
2. Naturality in E via ∧^L.

**API.**

- `TauCeti.SHC.moore.incl` (constructor): moore.incl p r : moore (p^r) ⟶ moore (p^(r+1)) realising multiplication by p on H₀.
- `TauCeti.SHC.moore.reduce` (constructor): moore.reduce p r : moore (p^(r+1)) ⟶ moore (p^r) realising reduction on H₀.
- `TauCeti.SHC.moore.incl_bockstein` (compatibility): δ ∘ incl = δ up to the identification of the sphere terms (incl is a map of triangles with components 1 and p).
- `TauCeti.SHC.modTower` (constructor): The tower r ↦ modM E (p^r) with transition maps induced by moore.reduce.
- `TauCeti.SHC.modTower.uct` (compatibility): The transition maps induce on the universal coefficient sequences the maps given by reduction on π_n ⊗ ℤ/p^r and by multiplication by p on the torsion terms.

**Unit tests.**

- `moore_incl_H0` (computation): H₀(moore.incl p r) is multiplication by p : ZMod (p^r) → ZMod (p^(r+1)).
- `moore_reduce_H0` (computation): H₀(moore.reduce p r) is the reduction ZMod (p^(r+1)) → ZMod (p^r).
- `modTower_HZ` (compatibility): For E = HZ the tower is the tower of H(ℤ/p^r) with reduction maps.
- `moore_incl_not_unique_p2` (non-example): For p = 2 the lift of multiplication by 2 to moore 2 ⟶ moore 4 is not unique: two lifts differ by a map factoring through η.

**Uses.** EllipticKTheory:E.5/finite-elliptic-k-descent: cofibre transition maps induced by ℤ/ℓ^r → ℤ/ℓ^{r+1}, x ↦ ℓx; KTheoryFiniteLocalFields:L.2/localisation-bockstein-compatibility: compatibility of Bocksteins with change of coefficients; H.6/p-completion: the tower E/p^r.

**Acceptance.** ρ_r ∘ ι_r realises multiplication by p on S/p^r up to the indeterminacy. The colimit of the ι_r is S/p^∞ (H.6/qp-zp-coefficients); the limit of the ρ_r defines p-completion (H.6/p-completion).

**Prerequisites.** `H.6/moore-spectrum`, `H.6/coefficient-spectrum`, `H.5:spectra/triangulated-structure`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Theorem 9.9(iii), p. 304 (PDF 305); Weibel-KBook-IV, 2.9 The ℓ-adic completion, p. IV.22.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Coefficients`, namespace `TauCeti`.

#### `H.6/qp-zp-coefficients` — ℚ_p/ℤ_p coefficients and their universal coefficient sequence

*Theorem.* For a prime p let S/p^∞ = hocolim_r S/p^r along ι_r, a Moore spectrum for ℤ/p^∞ = ℚ_p/ℤ_p. For every spectrum E, E ∧^L S/p^∞ = hocolim_r E/p^r and there is a natural short exact sequence 0 → π_n(E) ⊗ ℚ_p/ℤ_p → π_n(E; ℚ_p/ℤ_p) → π_{n−1}(E){p} → 0, where A{p} is the p-power torsion; the connecting map is a Bockstein. If π_{n+1}(E) is finite then π_n(E){p} ≅ π_{n+1}(E; ℚ_p/ℤ_p).

**Hypotheses.** p prime; sequential homotopy colimit in SHC.

**Construction or proof outline.**

1. π_* commutes with sequential homotopy colimits (H.5:spectra/sequential-homotopy-colimit); take the colimit of the universal coefficient sequences: ι_r is induced by the identity on the source sphere and multiplication by p on the target sphere of p^r, so it acts by multiplication by p on the terms π_n(E) ⊗ ℤ/p^r and by the inclusions π_{n−1}(E)[p^r] ⊆ π_{n−1}(E)[p^{r+1}] on the torsion terms, with colimits π_n(E) ⊗ ℚ_p/ℤ_p and π_{n−1}(E){p}; filtered colimits are exact (Weibel IV Exercise 2.6 and 2.9 pattern).
2. The finiteness consequence: if π_{n+1} E is finite then π_{n+1}E ⊗ ℚ_p/ℤ_p = 0.

**Acceptance.** For E = HZ, E ∧ S/p^∞ ≃ H(ℚ_p/ℤ_p): π₀ = ℚ_p/ℤ_p and π₁ = 0 since ℤ has no p-torsion; for E = S, π₀(S/p^∞) = ℚ_p/ℤ_p. K_n(R){ℓ} ≅ K_{n+1}(R; ℚ_ℓ/ℤ_ℓ) when K_{n+1}(R) is finite (ArithmeticKTheory request).

**Prerequisites.** `H.6/moore-spectrum-change-of-coefficients`, `H.5:spectra/sequential-homotopy-colimit`, `H.6/mod-l-homotopy-and-bockstein-sequence`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, §9.3, p. 303 (PDF 304); Weibel-KBook-IV, 2.9 The ℓ-adic completion, p. IV.22.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Coefficients`, namespace `TauCeti`.

#### `H.6/homotopy-limit-of-tower` — Homotopy limits of towers of spectra

*Construction.* For a tower ⋯ → X₂ → X₁ → X₀ in SHC, a homotopy limit holim X_r is an object with compatible maps to the X_r fitting into a distinguished triangle holim X_r → ∏_r X_r →(1 − shift) ∏_r X_r → Σ holim X_r; it exists, is unique up to non-unique isomorphism, and on the point-set level is computed by the limit of a tower of fibrations between stably fibrant spectra. Maps of towers induce maps of homotopy limits (not uniquely in general).

**Hypotheses.** Countable products exist in SHC; point-set model via stable fibrant replacement (H.5:spectra/stable-model-structure).

**Construction or proof outline.**

1. Dualise Schwede II Definition 5.3 (homotopy colimits) using products; existence from countable products and the octahedral axiom (H.5:spectra/triangulated-structure).
2. Point-set model: replace the tower by stable fibrations and take the levelwise limit (Schwede II p. 297 uses holim of the Postnikov tower).

**API.**

- `TauCeti.SHC.holimTower` (constructor): holimTower X with projections π r : holimTower X ⟶ X r and the defining triangle with 1 − shift on products.
- `TauCeti.SHC.holimTower.map` (functoriality): A map of towers induces a (non-unique) map of homotopy limits compatible with the projections.
- `TauCeti.SHC.holimTower.const` (example): holimTower of the constant tower with identities is X.
- `TauCeti.SymmSpectrum.towerLimit` (constructor): The point-set limit of a tower of stable fibrations between stably fibrant spectra, representing holimTower.

**Unit tests.**

- `holimTower_const` (degenerate): holimTower (constant tower at X, identity maps) ≅ X.
- `holimTower_zero_maps` (computation): For a tower with all transition maps zero, holimTower has pi_k ≅ lim¹ of the tower of pi_{k+1} = 0, so holimTower ≅ 0.
- `holimTower_point_set_compat` (compatibility): For a tower of stable fibrations of Ω-spectra, holimTower is represented by the levelwise limit.
- `holimTower_not_lim_pi` (non-example): pi of holimTower is not lim of pi in general: for S ←(p) S ←(p) ⋯, lim pi₀ = 0 but pi_{−1} holimTower ≅ ℤ_p/ℤ ≠ 0 (H.6/nonzero-lim-one-example).

**Uses.** H.6/milnor-sequence: π_* of a homotopy limit; H.6/p-completion: E^∧_p = holim E/p^r; KTheoryFiniteLocalFields:L.5/tr-of-smooth-fp-algebra: TR as a homotopy limit of TR^n along restriction maps; HabiroRings:HR.2/spectral-habiro-completion: completions as homotopy inverse limits.

**Acceptance.** holim of a constant tower with identity maps is X. X ≃ holim P_n X for the Postnikov tower (H.5:spectra/postnikov-sections).

**Prerequisites.** `H.5:spectra/stable-homotopy-category`, `H.5:spectra/triangulated-structure`, `H.5:spectra/stable-model-structure`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Definition 5.3, p. 256 (PDF 257); proof of Theorem 8.3, p. 297 (PDF 298).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Completion`, namespace `TauCeti`.

#### `H.6/milnor-sequence` — The Milnor lim¹ sequence for homotopy limits of towers — planet: *Milnor lim¹ sequence*

*Theorem.* For a tower X of spectra and k ∈ ℤ there is a natural short exact sequence 0 → lim¹_r π_{k+1}(X_r) → π_k(holim X_r) → lim_r π_k(X_r) → 0, where lim and lim¹ are the inverse limit and its first derived functor for towers of abelian groups (ArithmeticGaloisDuality:R02.1). If the tower π_{k+1}(X_r) is Mittag-Leffler (for example finite groups, or surjective transition maps) then π_k(holim X_r) ≅ lim_r π_k(X_r); lim and lim¹ are invariant under pro-isomorphism of towers and vanish on pro-zero towers. Natural for maps of towers.

**Hypotheses.** Countable towers; lim¹ of towers of abelian groups and its Mittag-Leffler vanishing imported from ArithmeticGaloisDuality:R02.1 (requested).

**Construction or proof outline.**

1. Apply π_k (which commutes with products) to the defining triangle holim → ∏X_r →(1−shift) ∏X_r; the kernel and cokernel of 1 − shift on ∏π are lim and lim¹ (dual of Schwede II Lemma 5.6 and Remark 5.9; used on p. 298).
2. Mittag-Leffler vanishing and pro-invariance: ArithmeticGaloisDuality:R02.1 (with Mathlib's IsMittagLeffler for the set-level condition).

**Acceptance.** Finite groups: lim¹ = 0, so π_k(holim) = lim π_k. Exhibit a tower with nonzero lim¹ (H.6/nonzero-lim-one-example).

**Prerequisites.** `H.6/homotopy-limit-of-tower`, `ArithmeticGaloisDuality:R02.1/lim-one`, `ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one`, `mathlib:CategoryTheory.Functor.IsMittagLeffler`, `H.5:spectra/true-homotopy-groups`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, proof of Theorem 8.3, p. 297 (PDF 298); Schwede-SymmetricSpectra-2012, Chapter II, Lemma 5.6 and Remark 5.9, pp. 257–258 (PDF 258–259); Weibel-KBook-IV, 2.9 The ℓ-adic completion, p. IV.22.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Completion`, namespace `TauCeti`.

#### `H.6/nonzero-lim-one-example` — A tower with nonzero lim¹

*Lemma.* For a prime p, the tower ⋯ →p S →p S →p S of sphere spectra (multiplication by p) has π₀ lim = lim(⋯ →p ℤ →p ℤ) = 0 and lim¹(⋯ →p ℤ →p ℤ) ≅ ℤ_p/ℤ ≠ 0, so π_{−1}(holim) ≅ ℤ_p/ℤ, which is uncountable, although every term has π_{−1} = 0. Hence homotopy limits cannot be replaced by inverse limits of homotopy groups without a Mittag-Leffler hypothesis.

**Hypotheses.** p prime.

**Construction or proof outline.**

1. The tower ⋯ →p ℤ →p ℤ has lim = 0 and lim¹ = coker(∏ℤ →(1−p·shift) ∏ℤ) ≅ ℤ_p/ℤ (standard computation via the short exact sequence of towers 0 → p^rℤ → ℤ → ℤ/p^r → 0 and lim of ℤ/p^r = ℤ_p, using ArithmeticGaloisDuality:R02.1).
2. Apply H.6/milnor-sequence with k = −1: π_{−1}(holim) ≅ lim¹ π₀ = ℤ_p/ℤ.

**Acceptance.** This is the roadmap's acceptance test 'a tower with a nonzero derived-limit obstruction'.

**Prerequisites.** `H.6/milnor-sequence`, `mathlib:PadicInt`, `ArithmeticGaloisDuality:R02.1/lim-one`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Remark 5.9, p. 258 (PDF 259).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Completion`, namespace `TauCeti`.

#### `H.6/p-completion` — p-completion of spectra — planet: *p-completion of spectra*

*Construction.* For a prime p and a spectrum E, the p-completion is E^∧_p := holim_r E/p^r along the reduction maps (H.6/moore-spectrum-change-of-coefficients), with the natural map E → E^∧_p; equivalently E^∧_p ≅ F(S/p^∞, ΣE) (Schwede II §9.3, Theorem 9.9(iii)), the Bousfield localisation at S/p. E is p-complete if E → E^∧_p is an isomorphism. p-completion is exact, and E^∧_p is p-local.

**Hypotheses.** Homotopy limit of the specific tower E/p^r with reduction maps (the derived inverse system).

**Construction or proof outline.**

1. Define by H.6/homotopy-limit-of-tower applied to modTower; the comparison with F(S/p^∞, ΣE) is Schwede II Theorem 9.9(iii) (with Spanier–Whitehead self-duality of S/p^n, Remark 9.11).
2. Exactness: holim and E ↦ E/p^r are exact.
3. Weibel IV 2.9 defines the ℓ-adic completion as the homotopy limit of E ∧ P^∞(ℤ/ℓ^ν).

**API.**

- `TauCeti.SHC.pCompletion` (constructor): pCompletion p E := holimTower (modTower E p) with the map E ⟶ pCompletion p E.
- `TauCeti.SHC.pCompletion.functor` (functoriality): pCompletion p is an exact functor on SHC (on objects and, up to the lim¹ ambiguity, on maps via the F(S/p^∞, Σ−) model).
- `TauCeti.SHC.pCompletion.isoFunction` (equivalence): pCompletion p E ≅ internal Hom (moore p^∞) (Σ E) (Schwede II Theorem 9.9).
- `TauCeti.SHC.IsPComplete` (constructor): E is p-complete if E ⟶ pCompletion p E is an isomorphism.
- `TauCeti.SHC.pCompletion.isPComplete` (characterisation): pCompletion p E is p-complete.

**Unit tests.**

- `pCompletion_zero` (degenerate): pCompletion p 0 = 0.
- `pCompletion_sphere_pi0` (computation): pi (pCompletion p sphere) 0 ≅ ℤ_p (PadicInt p).
- `pCompletion_HQ` (compatibility): pCompletion p (eilenbergMacLane ℚ) = 0, since Ext(ℤ/p^∞, ℚ) = Hom(ℤ/p^∞, ℚ) = 0 (H.6/completion-ext-hom-sequence).
- `pCompletion_not_tensor` (non-example): pi (pCompletion p (eilenbergMacLane (ℚ_p/ℤ_p))) 1 ≅ ℤ_p (the Tate module), not π₁ ⊗ ℤ_p = 0: completion of homotopy groups is not tensoring with ℤ_p.

**Uses.** KTheoryFiniteLocalFields:L.1/completed-k-theory: p-completed K-theory of finite and local fields; KTheoryFiniteLocalFields:L.4/integral-and-p-typical-tc-agree-after-completion: comparison after p-completion; HabiroRings:HR.2/spectral-habiro-completion: completion of spectra along an element, generalising p; ArithmeticKTheory:N.5/primary-bockstein-localisation: ℓ-adic K-theory and its Bocksteins.

**Acceptance.** S^∧_p has π₀ = ℤ_p. H(ℤ/p) is p-complete; HQ^∧_p = 0.

**Prerequisites.** `H.6/homotopy-limit-of-tower`, `H.6/moore-spectrum-change-of-coefficients`, `H.6/coefficient-spectrum`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, §9.3 and Theorem 9.9(iii), pp. 303–304 (PDF 304–305); Weibel-KBook-IV, 2.9 The ℓ-adic completion, p. IV.22.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Completion`, namespace `TauCeti`.

#### `H.6/l-adic-completion-milnor-sequence` — ℓ-adic homotopy groups: the lim¹ extension and the Tate-module term

*Theorem.* For a prime ℓ and a spectrum E, π_n(E; ℤ_ℓ) := π_n(E^∧_ℓ) fits into 0 → lim¹_ν π_{n+1}(E; ℤ/ℓ^ν) → π_n(E; ℤ_ℓ) → lim_ν π_n(E; ℤ/ℓ^ν) → 0. If the groups π_{n+1}(E; ℤ/ℓ^ν) are finite the lim¹ term vanishes and π_n(E; ℤ_ℓ) is an extension of the ℓ-adic Tate module T_ℓ π_{n−1}(E) by the ℓ-adic completion of π_n(E). Consequently π_n(E; ℤ_ℓ) agrees with π_n(E) ⊗ ℤ_ℓ only under additional hypotheses (H.6/completion-finite-type).

**Hypotheses.** Tower E/ℓ^ν with reduction maps; finiteness of π_{n+1}(E; ℤ/ℓ^ν) for the vanishing of lim¹.

**Construction or proof outline.**

1. The Milnor sequence for holim E/ℓ^ν (H.6/milnor-sequence, H.6/p-completion).
2. Finite groups are Mittag-Leffler, so lim¹ vanishes; lim_ν of the universal coefficient sequences (H.6/mod-l-homotopy-and-bockstein-sequence with H.6/moore-spectrum-change-of-coefficients) gives 0 → lim π_n/ℓ^ν → lim π_n(E; ℤ/ℓ^ν) → lim π_{n−1}[ℓ^ν] → 0 (exact since the left tower is surjective), i.e. the completion and the Tate module (Weibel IV 2.9).

**Acceptance.** Index check: by the formula the Tate module of π_{n−1}(E) contributes to π_n(E; ℤ_ℓ), so the Tate module ℤ_ℓ of K₁(ℂ) = ℂ^× appears in K₂(ℂ; ℤ_ℓ). Weibel's printed example 'K₁(ℂ; ℤ_ℓ) = π₁(K(ℂ); ℤ_ℓ) is ℤ_ℓ' (p. IV.22) is inconsistent with that formula (source issue StableHomotopyKTheory/E2). Exhibit a tower with nonzero lim¹ before replacing completion by an inverse limit (H.6/nonzero-lim-one-example). Keep the Tate module term: completion is not tensoring with ℤ_ℓ in general.

**Prerequisites.** `H.6/milnor-sequence`, `H.6/p-completion`, `H.6/mod-l-homotopy-and-bockstein-sequence`, `H.6/moore-spectrum-change-of-coefficients`.

**Sources.** Weibel-KBook-IV, 2.9 The ℓ-adic completion, p. IV.22.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Completion`, namespace `TauCeti`.

#### `H.6/completion-ext-hom-sequence` — Homotopy groups of the p-completion: Ext and Hom

*Theorem.* For every spectrum X and k ∈ ℤ there is a natural short exact sequence 0 → Ext(ℤ/p^∞, π_k X) → π_k(X^∧_p) → Hom(ℤ/p^∞, π_{k−1} X) → 0. Here Hom(ℤ/p^∞, A) = T_p A is the p-adic Tate module and Ext(ℤ/p^∞, A) is the derived p-completion of A (equal to the p-adic completion A^∧_p when A has bounded p-torsion).

**Hypotheses.** Any spectrum X; p prime.

**Construction or proof outline.**

1. From X^∧_p = F(S/p^∞, ΣX) and the universal coefficient sequence for maps out of the Moore spectrum S/p^∞ (Schwede II Theorem 9.9(iv)).

**Acceptance.** For X = S: π₀(S^∧_p) = Ext(ℤ/p^∞, ℤ) = ℤ_p. For X = H(ℚ_p/ℤ_p): π₁(X^∧_p) = Hom(ℤ/p^∞, ℚ_p/ℤ_p) = ℤ_p.

**Prerequisites.** `H.6/p-completion`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Theorem 9.9(iv), (9.10), p. 304 (PDF 305).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Completion`, namespace `TauCeti`.

#### `H.6/completion-finite-type` — Completion of homotopy groups is tensoring with ℤ_p under finite generation

*Theorem.* If π_k(X) is finitely generated for all k (or just for k and k − 1), then π_k(X^∧_p) ≅ π_k(X) ⊗ ℤ_p naturally, via the map induced by X → X^∧_p and ℤ_p-linearity. Without finiteness this fails in both directions: the Tate module term Hom(ℤ/p^∞, π_{k−1}X) can be nonzero and Ext(ℤ/p^∞, A) differs from A ⊗ ℤ_p for A not finitely generated.

**Hypotheses.** π_k X and π_{k−1} X finitely generated abelian groups.

**Construction or proof outline.**

1. For a finitely generated abelian group A, Hom(ℤ/p^∞, A) = 0 (A has no divisible p-torsion) and Ext(ℤ/p^∞, A) ≅ A^∧_p ≅ A ⊗ ℤ_p (Mathlib's AdicCompletion.ofTensorProductEquivOfFiniteNoetherian for the Noetherian ring ℤ and the ideal (p), with the identification of ℤ's (p)-adic completion with ℤ_p).
2. Insert into H.6/completion-ext-hom-sequence.

**Acceptance.** π_k(S^∧_p) = π^s_k ⊗ ℤ_p: ℤ_p in degree 0 and the p-primary part of π^s_k for k > 0. For X = H(ℚ_p/ℤ_p) the hypothesis fails and π₁(X^∧_p) = ℤ_p ≠ 0.

**Prerequisites.** `H.6/completion-ext-hom-sequence`, `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`, `mathlib:PadicInt`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Theorem 9.9(iv), p. 304 (PDF 305); Weibel-KBook-IV, 2.9, p. IV.22.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Completion`, namespace `TauCeti`.

#### `H.6/p-complete-criteria` — Criteria for p-completeness

*Lemma.* A spectrum E is p-complete (E → E^∧_p an isomorphism) iff E ≅ F(S/p^∞, ΣE), iff the homotopy limit of ⋯ →p E →p E vanishes. In particular: (a) if a fixed power p^N annihilates π_k E for all k, then E is p-complete; (b) E/p^r is p-complete; (c) fibres, cofibres, retracts and homotopy limits of p-complete spectra are p-complete; (d) a map of p-complete spectra is an equivalence iff it is one after smashing with S/p.

**Hypotheses.** p prime.

**Construction or proof outline.**

1. (a) If p^N kills π_*E then Ext(ℤ/p^∞, π_k E) = π_k E and Hom(ℤ/p^∞, π_{k−1} E) = 0 for all k (groups of bounded exponent), so E → E^∧_p is a π_*-isomorphism (H.6/completion-ext-hom-sequence); the vanishing of holim(⋯ →p E) follows from the Milnor sequence (H.6/milnor-sequence) since the tower of homotopy groups is pro-zero.
2. (c) completion is exact and commutes with homotopy limits (holim commutes with holim).
3. (d) the S/p-localisation property of p-completion (Schwede II §9.4, Bousfield localisation at S/p).

**Acceptance.** H(ℤ/p^r) is p-complete; S is not (π₀ = ℤ ≠ ℤ_p).

**Prerequisites.** `H.6/p-completion`, `H.6/completion-ext-hom-sequence`, `H.6/milnor-sequence`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Remark 9.8 and Theorem 9.9, pp. 303–304 (PDF 304–305); Weibel-KBook-IV, 2.9, p. IV.22.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Completion`, namespace `TauCeti`.

#### `H.6/rationalisation` — Rationalisation of spectra

*Construction.* The rationalisation of a spectrum E is E_ℚ := HQ ∧^L E, equivalently the homotopy colimit of E →1 E →2 E →3 ⋯ (multiplication by n at stage n), with the natural map E → E_ℚ inducing π_*(E_ℚ) ≅ π_*(E) ⊗ ℚ. Rational spectra (π_* uniquely divisible) are exactly the HQ-local ones, and π_* is an equivalence from the rational stable homotopy category to graded ℚ-vector spaces: every rational spectrum is a generalized Eilenberg–Mac Lane spectrum ∏ Σ^k H(V_k).

**Hypotheses.** Any spectrum E.

**Construction or proof outline.**

1. Define as hocolim (H.5:spectra/sequential-homotopy-colimit); π_* commutes with it and colim(π →n π) = π ⊗ ℚ (Schwede II §9.2, Theorem 9.2 for R = ℚ).
2. HQ ∧^L E ≃ E_ℚ: HQ is a Moore spectrum for ℚ (Schwede II Example 6.36).
3. Rational spectra are generalized EM spectra (Schwede II Theorem 9.6).

**API.**

- `TauCeti.SHC.rationalization` (constructor): rationalization E := hocolimSeq (E →(1) E →(2) E →(3) ⋯) with the map E ⟶ rationalization E.
- `TauCeti.SHC.rationalization.pi` (characterisation): pi (rationalization E) k ≅ pi E k ⊗ ℚ naturally.
- `TauCeti.SHC.rationalization.smashHQ` (equivalence): rationalization E ≅ eilenbergMacLane ℚ ∧ᴸ E.
- `TauCeti.SHC.IsRational` (constructor): E is rational if each pi E k is uniquely divisible; equivalently E ≅ rationalization E.
- `TauCeti.SHC.rational_generalizedEM` (characterisation): A rational E is isomorphic to ∏_k Σ^k eilenbergMacLane (pi E k).

**Unit tests.**

- `rationalization_zero` (degenerate): rationalization 0 = 0.
- `rationalization_sphere` (computation): rationalization sphere ≅ eilenbergMacLane ℚ.
- `rationalization_HZp` (compatibility): rationalization (eilenbergMacLane (ZMod p)) = 0, matching (ℤ/p) ⊗ ℚ = 0.
- `rationalization_moore_zero` (non-example): rationalization (moore p) = 0 although moore p ≠ 0: rationalisation is not faithful on finite spectra.

**Uses.** H.6/arithmetic-fracture-square: the rational corner of the arithmetic square; HabiroRings:HR.2/spherical-rational-localization: rationalisation of spherical group rings; BorelRegulators:R.3: rational K-theory as rational homotopy of the K-theory spectrum.

**Acceptance.** S_ℚ ≃ HQ (π^s_k ⊗ ℚ = 0 for k > 0). (H(ℤ/p))_ℚ = 0.

**Prerequisites.** `H.5:spectra/sequential-homotopy-colimit`, `H.5:spectra/eilenberg-maclane-spectrum`, `H.5:spectra/derived-smash-product`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Theorems 9.2 and 9.6, pp. 300–302 (PDF 301–303).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Completion`, namespace `TauCeti`.

#### `H.6/arithmetic-fracture-square` — The arithmetic fracture square — planet: *Arithmetic fracture square*

*Theorem.* For every spectrum X the square with X → ∏_p X^∧_p on top, rationalisations vertically, and X_ℚ → (∏_p X^∧_p)_ℚ at the bottom is homotopy cartesian; the profinite completion X^∧ = F(S(ℚ/ℤ), ΣX) is ∏_p X^∧_p. Hence the long exact sequence ⋯ → π_k X → ℚ ⊗ π_k X ⊕ ∏_p π_k(X^∧_p) → ℚ ⊗ ∏_p π_k(X^∧_p) → π_{k−1} X → ⋯. For bounded-below X with finitely generated homotopy groups, π_k(X^∧_p) = π_k X ⊗ ℤ_p and the sequence becomes the arithmetic square of π_k X.

**Hypotheses.** Any spectrum X (the square is homotopy cartesian without connectivity hypotheses in SHC; the finite-type corollary needs finite generation).

**Construction or proof outline.**

1. The rotated triangle HQ → S(ℚ/ℤ) → S¹ → ΣHQ and exactness of F(−, ΣX) and rationalisation give the homotopy cartesian square (Schwede II Theorem 9.9(i)).
2. S(ℚ/ℤ) ≃ ⋁_p S/p^∞ gives the product decomposition (Theorem 9.9(ii)).
3. Finite-type case from H.6/completion-finite-type.

**Acceptance.** For X = S: ℤ → ℚ ⊕ ∏ℤ_p → ℚ ⊗ ∏ℤ_p = 𝔸_f is the arithmetic square of ℤ. For X = HQ all completions vanish and the square is trivially cartesian.

**Prerequisites.** `H.6/rationalisation`, `H.6/p-completion`, `H.2/homotopy-pullback`, `H.5:spectra/triangulated-structure`, `H.6/completion-finite-type`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, Theorem 9.9(i)–(ii) and the following paragraph, p. 304 (PDF 305).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Completion`, namespace `TauCeti`.

#### `H.6/filtered-spectrum` — Filtered spectra, towers and their associated graded

*Definition.* A filtered spectrum is a functor X : (ℤ, ≤) → SHC (on the point-set level, a sequence of maps of symmetric spectra … → X_{s−1} → X_s → …) with associated graded gr_s X = C(X_{s−1} → X_s); it is exhaustive towards X if hocolim_s X_s ≃ X, bounded below if X_s = 0 for s ≪ 0, and complete (Hausdorff) if holim_{s → −∞} X_s = 0. A tower is the dual notion (… → Y_{s+1} → Y_s → …) with fibres F_s = fib(Y_s → Y_{s−1}); the Postnikov, skeletal (Σ^∞_+ of CW skeleta), and Adams-type filtrations are examples.

**Hypotheses.** Indexing by ℤ with arrows increasing s; point-set models of the maps (cofibrations) for the point-set version.

**Construction or proof outline.**

1. Lurie, Higher Algebra Definition 1.2.2.9 (filtered objects of a stable ∞-category) gives the definition and the extension to complexes in Gap(ℤ ∪ {−∞}, C) recording the cofibres X(i, j) = cofib(X_i → X_j).
2. On the SHC level, the cofibres are chosen by TR1 and the octahedral axiom makes them coherent up to non-unique isomorphism; on the point-set level they are mapping cones (H.5:spectra/mapping-cone-and-homotopy-fibre).

**API.**

- `TauCeti.SHC.FilteredSpectrum` (structure): A functor ℤ ⥤ SHC (or a sequence of maps of symmetric spectra) with chosen cofibres.
- `TauCeti.SHC.FilteredSpectrum.gr` (constructor): gr X s := cofibre (X (s−1) ⟶ X s) with the triangle X (s−1) ⟶ X s ⟶ gr X s ⟶ Σ X (s−1).
- `TauCeti.SHC.FilteredSpectrum.IsExhaustive` (constructor): hocolim of X s maps isomorphically to the target X.
- `TauCeti.SHC.FilteredSpectrum.IsComplete` (constructor): holim_{s → −∞} X s = 0.
- `TauCeti.SHC.FilteredSpectrum.IsBoundedBelow` (constructor): X s = 0 for s ≪ 0.
- `TauCeti.SHC.FilteredSpectrum.toSpectralObject` (compatibility): A filtered spectrum gives a spectral object in the triangulated category SHC (Mathlib Triangulated.SpectralObject) with H(i ≤ j) = cofibre (X i ⟶ X j).

**Unit tests.**

- `filteredSpectrum_const` (degenerate): The constant filtration X s = X has gr = 0 and is exhaustive but not complete (unless X = 0).
- `filteredSpectrum_postnikov_gr` (computation): For the Postnikov tower, gr_n ≅ Σⁿ H(π_n X).
- `filteredSpectrum_spectralObject_compat` (compatibility): toSpectralObject followed by pi_0 (Mathlib mapHomologicalFunctor) is an abelian spectral object whose E₁ terms are pi of gr.
- `filteredSpectrum_complete_not_exhaustive` (non-example): The filtration X_s = 0 for all s of a spectrum X ≠ 0 is complete but not exhaustive; the filtration X_s = X for all s is exhaustive but not complete — completeness and exhaustiveness are independent.

**Uses.** H.6/filtered-spectrum-spectral-sequence: the exact couple and spectral sequence of a filtered spectrum; SchemeKTheoryOperations:S.4/codimension-support-filtration: the coniveau filtration of K-theory spectra by codimension of support; MotivicEtaleKTheory:M.6b: the motivic filtration and its spectral sequence; H.6/atiyah-hirzebruch-spectral-sequence: the skeletal filtration of Σ^∞_+ X.

**Acceptance.** The skeletal filtration of Σ^∞_+ X for a CW complex X, with gr_s = ⋁_{s-cells} S^s. The Postnikov tower τ_{≤n} X (H.5:spectra/postnikov-sections), complete for every X.

**Prerequisites.** `H.5:spectra/stable-homotopy-category`, `H.5:spectra/mapping-cone-and-homotopy-fibre`, `H.5:spectra/sequential-homotopy-colimit`, `H.6/homotopy-limit-of-tower`.

**Sources.** Lurie-HigherAlgebra-2017, §1.2.2, Definition 1.2.2.9, p. 52.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/SpectralSequence`, namespace `TauCeti`.

#### `H.6/exact-couple` — Exact couples and their derived couples

*Definition.* An exact couple in an abelian category is a triangle of morphisms D →i D →j E →k D (bigraded) exact at each vertex; its derived couple (i(D), H(E, jk), i′, j′, k′) is again exact, and iterating gives the spectral sequence E^r with d_r = j ∘ i^{−(r−1)} ∘ k. A filtered spectrum gives the exact couple D^1_{s,t} = π_{s+t} X_s, E^1_{s,t} = π_{s+t} gr_s X with i, j, k from the triangles X_{s−1} → X_s → gr_s X → ΣX_{s−1}; the ordinary case of the skeletal filtration of a CW complex is the exact couple of Tau Ceti AlgebraicTopology stage 4, which this generic notion instantiates.

**Hypotheses.** An abelian category (abelian groups for homotopy); bigrading conventions pinned with d_r of bidegree (−r, r − 1).

**Construction or proof outline.**

1. Define exact couples and derived couples; exactness of the derived couple and the identification of E^r with Mathlib's spectral sequence pages through spectral objects (Mathlib CategoryTheory.Abelian.SpectralObject).
2. The filtered-spectrum exact couple from the long exact sequences of the triangles (H.5:spectra/cofibre-long-exact-sequence).

**API.**

- `TauCeti.ExactCouple` (structure): Objects D, E with maps i : D ⟶ D, j : D ⟶ E, k : E ⟶ D (graded) exact at each vertex.
- `TauCeti.ExactCouple.derived` (constructor): The derived couple, again exact.
- `TauCeti.ExactCouple.page` (constructor): page r := E of the (r−1)-fold derived couple with differential j ∘ k.
- `TauCeti.ExactCouple.toSpectralSequence` (compatibility): The pages and differentials form a Mathlib CategoryTheory.SpectralSequence.
- `TauCeti.SHC.FilteredSpectrum.exactCouple` (constructor): The exact couple of a filtered spectrum: D = pi of X s, E = pi of gr X s.

**Unit tests.**

- `exactCouple_zero_E` (degenerate): If E = 0 then i is an isomorphism and all pages vanish.
- `exactCouple_two_stage` (computation): For a filtration 0 = X_{−1} → X₀ → X₁ = X with gr₁ = X₁/X₀, E² = E^∞ and there is a short exact sequence 0 → coker(d₁ : π_{n+1} gr₁ → π_n X₀) → π_n X → ker(d₁ : π_n gr₁ → π_{n−1} X₀) → 0.
- `exactCouple_spectralObject_compat` (compatibility): The spectral sequence of exactCouple agrees from E₂ on with Mathlib's spectral sequence of the associated abelian spectral object.
- `exactCouple_not_complex` (non-example): An exact couple is not a chain complex: j ∘ k is a differential only on E, and D carries no differential.

**Uses.** MotivicEtaleKTheory:M.6b: exact couples, differentials and convergence for the motivic filtration; SchemeKTheoryOperations:S.4/k-coniveau-spectral-sequence: the coniveau exact couple of K-theory with supports; tauceti:TauCetiRoadmap/AlgebraicTopology stage 4: the skeletal filtration exact couple of a CW complex is an instance.

**Acceptance.** For a filtration with all maps X_{s−1} → X_s isomorphisms, E = 0. The skeletal filtration of a CW complex with E = HZ gives the cellular chain complex as E¹ (Tau Ceti AlgebraicTopology stage 4).

**Prerequisites.** `mathlib:CategoryTheory.Abelian.SpectralObject`, `mathlib:CategoryTheory.SpectralSequence`, `H.5:spectra/cofibre-long-exact-sequence`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

**Sources.** Lurie-HigherAlgebra-2017, §1.2.2, Construction 1.2.2.6 and Proposition 1.2.2.7, p. 49.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/SpectralSequence`, namespace `TauCeti`.

#### `H.6/filtered-spectrum-spectral-sequence` — The spectral sequence of a filtered spectrum — planet: *Spectral sequence of a filtered spectrum*

*Construction.* For a filtered spectrum X there is a spectral sequence E¹_{s,t} = π_{s+t}(gr_s X) with d_r : E^r_{s,t} → E^r_{s−r, t+r−1}, natural in X, obtained from the exact couple of H.6/exact-couple, equivalently by applying π₀ to the spectral object of X in SHC (Mathlib's Triangulated.SpectralObject.mapHomologicalFunctor and Abelian.SpectralObject.spectralSequence). Its putative abutment is π_*(colim X) with the filtration F_s π_n = image(π_n X_s → π_n colim X). Convergence is the subject of H.6/spectral-sequence-convergence-exhaustive and H.6/spectral-sequence-convergence-complete; displaying an E₂ page does not presume convergence.

**Hypotheses.** X a filtered spectrum; π_* homological on SHC.

**Construction or proof outline.**

1. Spectral object: H(i ≤ j) = cofibre(X_i → X_j) with connecting maps from the octahedral axiom (H.5:spectra/triangulated-structure; Lurie HA Construction 1.2.2.6 and Proposition 1.2.2.7).
2. Apply π₀ (homological) and Mathlib's spectral sequence of a spectral object; identify E¹ = π_*(gr X) and the differentials with those of the exact couple.

**API.**

- `TauCeti.SHC.FilteredSpectrum.spectralSequence` (constructor): spectralSequence X : CategoryTheory.SpectralSequence of abelian groups with E¹ = pi (gr X s) (s + t).
- `TauCeti.SHC.FilteredSpectrum.spectralSequence.E1` (characterisation): E¹_{s,t} ≅ pi (gr X s) (s + t), with d₁ the composite gr_s → ΣX_{s−1} → Σgr_{s−1}.
- `TauCeti.SHC.FilteredSpectrum.spectralSequence.map` (functoriality): A map of filtered spectra induces a map of spectral sequences.
- `TauCeti.SHC.FilteredSpectrum.abutmentFiltration` (constructor): F_s π_n := image of pi (X s) n in pi (colim X) n.

**Unit tests.**

- `spectralSequence_trivial` (degenerate): For the zero filtered spectrum all pages vanish.
- `spectralSequence_single_step` (computation): For X concentrated in one filtration step, E¹ = E^∞ = π_* of that step.
- `spectralSequence_compat_exactCouple` (compatibility): The spectral sequence agrees with that of the exact couple (H.6/exact-couple).
- `spectralSequence_E2_not_abutment` (non-example): For the constant filtration X s = X (exhaustive, not bounded below), E¹ = 0 but π_*(colim X) = π_* X ≠ 0: without convergence hypotheses the spectral sequence says nothing about the abutment.

**Uses.** SchemeKTheoryOperations:S.4/hypercohomology-spectral-sequence: descent and coniveau spectral sequences of K-theory spectra; MotivicEtaleKTheory:M.6b: the motivic spectral sequence; KTheoryFiniteLocalFields:L.4/multiplicative-tate-spectral-sequence: Tate and homotopy fixed point spectral sequences as spectral sequences of filtered spectra.

**Acceptance.** The skeletal filtration of Σ^∞_+ X gives the Atiyah–Hirzebruch spectral sequence (H.6/atiyah-hirzebruch-spectral-sequence). For X with X_s → X_{s+1} isomorphisms, E¹ = 0.

**Prerequisites.** `H.6/filtered-spectrum`, `H.6/exact-couple`, `mathlib:CategoryTheory.Triangulated.SpectralObject`, `mathlib:CategoryTheory.Triangulated.SpectralObject.mapHomologicalFunctor`, `mathlib:CategoryTheory.Abelian.SpectralObject`, `H.5:spectra/triangulated-structure`.

**Sources.** Lurie-HigherAlgebra-2017, §1.2.2, Definition 1.2.2.9, p. 52; Weibel-KBook-IV, Exercise 3.7, p. IV.34.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/SpectralSequence`, namespace `TauCeti`.

#### `H.6/spectral-sequence-convergence-exhaustive` — Convergence for exhaustive filtrations bounded below

*Theorem.* Let X be a filtered spectrum with X_s = 0 for s ≪ 0. Then its spectral sequence converges strongly to π_*(colim_s X_s): for fixed (s, t) the differentials out of E^r_{s,t} vanish for r ≫ 0, E^∞_{s,t} = colim_r E^r_{s,t}, and E^∞_{s,t} ≅ F_s π_{s+t} / F_{s−1} π_{s+t} with F_s = image(π X_s → π colim X), F_s = 0 for s ≪ 0 and colim_s F_s = π. If moreover X_s → colim X is an equivalence for s ≫ 0 (finite filtration), the spectral sequence collapses at a finite page in each degree.

**Hypotheses.** X_s = 0 for s ≪ 0; homotopy groups commute with sequential colimits (H.5:spectra/sequential-homotopy-colimit).

**Construction or proof outline.**

1. Lurie HA Proposition 1.2.2.14 for stable ∞-categories with t-structure compatible with sequential colimits; in SHC the Postnikov t-structure (H.5:spectra/postnikov-sections) is compatible with sequential homotopy colimits since π_* commutes with them.

**Acceptance.** The Atiyah–Hirzebruch spectral sequence for a CW complex X converges to E_*(X) (skeletal filtration bounded below). First-quadrant spectral sequences converge strongly.

**Prerequisites.** `H.6/filtered-spectrum-spectral-sequence`, `H.5:spectra/sequential-homotopy-colimit`, `H.5:spectra/postnikov-sections`.

**Sources.** Lurie-HigherAlgebra-2017, §1.2.2, Proposition 1.2.2.14 and proof, pp. 52–53.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/SpectralSequence`, namespace `TauCeti`.

#### `H.6/spectral-sequence-convergence-complete` — Convergence for complete towers with connectivity

*Theorem.* Let ⋯ → Y_{s+1} → Y_s → ⋯ → Y_0 = Y be a tower with homotopy limit holim Y_s and fibres F_s = fib(Y_s → Y_{s−1}), and E¹_{s,t} = π_{t−s} F_s. (a) If the connectivity of F_s tends to ∞ with s (for each n, π_n F_s = 0 for s ≫ 0), then the spectral sequence converges strongly to π_*(holim Y_s), the lim¹ terms vanish and holim Y_s ≃ Y if the tower is a resolution. (b) In general, if the tower is complete (holim of the fibres of Y → Y_s vanishes) and lim¹_r E^r = 0 (for example, finitely many nonzero differentials into each spot), the spectral sequence converges conditionally and then strongly (Boardman).

**Hypotheses.** (a) uniform connectivity; (b) completeness and the vanishing of the derived E^∞-term RE_∞.

**Construction or proof outline.**

1. (a) For fixed n, π_n Y_s → π_n Y_{s−1} is an isomorphism for s ≫ 0, so the towers are eventually constant (Mittag-Leffler), lim¹ = 0 and π_n(holim) = lim (H.6/milnor-sequence); the finite-stage spectral sequences converge by H.6/spectral-sequence-convergence-exhaustive applied to the finite filtrations, and passing to the limit is exact.
2. (b) Boardman, Conditionally convergent spectral sequences (1999), Theorems 7.1 and 8.2: not read (packet gap 'Boardman conditional convergence').

**Acceptance.** Postnikov towers: fibres Σⁿ Hπ_n X have connectivity n → ∞, so the tower converges to X. Do not assert convergence of a complete tower with infinitely many nonzero differentials into a spot without RE_∞ = 0.

**Prerequisites.** `H.6/filtered-spectrum-spectral-sequence`, `H.6/milnor-sequence`, `H.6/spectral-sequence-convergence-exhaustive`, `H.6/homotopy-limit-of-tower`.

**Sources.** Schwede-SymmetricSpectra-2012, Chapter II, proof of Theorem 8.3, p. 297 (PDF 298).

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/SpectralSequence`, namespace `TauCeti`.

#### `H.6/atiyah-hirzebruch-spectral-sequence` — The Atiyah–Hirzebruch spectral sequence

*Application.* For a spectrum E and a CW complex X (or the classifying space BG of a discrete group), the skeletal filtration of Σ^∞_+X gives a spectral sequence E²_{p,q} = H_p(X; π_q E) ⇒ E_{p+q}(X) = π_{p+q}(E ∧^L Σ^∞_+X), with E² the cellular (equivalently singular, Tau Ceti AlgebraicTopology stage 4) homology with coefficients π_q E, converging strongly when X is finite-dimensional or E is bounded below. For E = S and X = BG it has E² = H_p(G; π^s_q) ⇒ π^s_{p+q}(Σ^∞ BG₊) (H.1/bar-complex-comparison), a module spectral sequence over π^s_*. For E = HA it reduces to the cellular chain complex of Tau Ceti stage 4.

**Hypotheses.** X a CW complex; E a spectrum; convergence as stated.

**Construction or proof outline.**

1. Filter Σ^∞_+X by the suspension spectra of skeleta: gr_p = Σ^∞(X^{(p)}/X^{(p−1)}) ≃ ⋁_{p-cells} S^p, so E¹_{p,q} = C_p^{cell}(X; π_q E) and d₁ is the cellular differential (Tau Ceti AlgebraicTopology stage 4 exact couple, compared, not reconstructed).
2. Convergence: bounded-below filtration (H.6/spectral-sequence-convergence-exhaustive); for E bounded below, each total degree receives contributions from finitely many p.
3. Module structure over π^s_* from the pairing (H.5:spectra/homotopy-group-pairing).

**Acceptance.** For X = point, E² = π_q E concentrated in p = 0. For E = HZ, the AHSS collapses at E² to cellular homology.

**Prerequisites.** `H.6/filtered-spectrum-spectral-sequence`, `H.6/spectral-sequence-convergence-exhaustive`, `H.5:spectra/suspension-spectrum`, `H.5:spectra/derived-smash-product`, `H.1/bar-complex-comparison`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

**Sources.** Lurie-HigherAlgebra-2017, §1.2.2, Definition 1.2.2.9, p. 52.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/SpectralSequence`, namespace `TauCeti`.

#### `H.6/moore-spectrum-multiplication` — Products on mod-ℓ^ν homotopy

*Theorem.* For a prime power ℓ^ν with ℓ^ν ∉ {2, 3, 4, 8}, the Moore spectrum S/ℓ^ν admits a homotopy associative and homotopy commutative multiplication with unit (Araki–Toda), and for a homotopy commutative ring spectrum E the groups π_*(E; ℤ/ℓ^ν) form a graded-commutative ring, natural in E; for ℓ^ν = 2 no unital multiplication exists, and for 3, 4, 8 associativity or commutativity fails.

**Hypotheses.** ℓ^ν outside the exceptional set; E a homotopy ring spectrum.

**Construction or proof outline.**

1. Araki–Toda's construction of the multiplication (quoted by Weibel IV Theorem 2.8; not read, packet gap 'Araki–Toda products on Moore spectra').
2. For S/2 the non-existence follows from π₂(S/2) = ℤ/4 (H.6/moore-spectrum).
3. Products on π_*(E; ℤ/ℓ^ν) via E/ℓ^ν ∧ E/ℓ^ν ≃ E ∧ E ∧ S/ℓ^ν ∧ S/ℓ^ν → E ∧ S/ℓ^ν (H.5:spectra/homotopy-group-pairing).

**Acceptance.** K_*(F_q; ℤ/ℓ) is a graded ring with Bott element (KTheoryFiniteLocalFields:L.1/mod-m-products). S/2: 2 · id ≠ 0.

**Prerequisites.** `H.6/moore-spectrum`, `H.5:spectra/homotopy-group-pairing`, `H.5:spectra/ring-spectrum`.

**Sources.** Weibel-KBook-IV, Theorem 2.8, p. IV.21.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Coefficients`, namespace `TauCeti`.

#### `H.6/burklund-moore-multiplicative` — Burklund's E_n-algebra structures on Moore spectra

*Theorem.* (Burklund, Theorems 1.1, 1.2, 1.5.) The Moore spectrum S/8 admits an E₁-algebra structure, and S/p² does for p odd. More generally S/2^q admits an E_n-algebra structure for q ≥ (3/2)(n + 1) (so S/8 is E₁ and S/32 is E₂) and S/p^q admits an E_n-algebra structure for q ≥ n + 1 when p is odd. In a stably E_m-monoidal category C (m ≥ 2) with v : I → 1_C such that 1_C/v admits a right unital multiplication, for each n ≤ m there is a tower of E_n-algebras ⋯ → 1_C/v^{n+3} → 1_C/v^{n+2} → 1_C/v^{n+1}, and each 1_C/v^q has a unique v-compatible E_n-algebra structure.

**Hypotheses.** Stable presentably E_m-monoidal ∞-categories (spectra as the main case); E_n-algebras in the sense of EnhancedDerivedSheaves:E5:abstract, realised in symmetric spectra by H.5:spectra/operadic-algebras.

**Construction or proof outline.**

1. Burklund's obstruction theory for E_n-structures on quotients (§2) and the categorified Adams spectral sequence of Patchkoria–Pstrągowski (§4); not read beyond the statements (packet gap 'Burklund's proof').

**Acceptance.** S/2 admits no E₁-structure (no unital multiplication); S/8 does. For p ≥ 5, S/p is already homotopy commutative and associative; S/3 has a multiplication that is not homotopy associative (Weibel IV p. 21; H.6/moore-spectrum-multiplication); S/p² is E₁ for every odd p.

**Prerequisites.** `H.6/moore-spectrum`, `H.5:spectra/operadic-algebras`, `EnhancedDerivedSheaves:E5:abstract`, `H.6/moore-spectrum-change-of-coefficients`.

**Sources.** Burklund-MultiplicativeMoore-2022, Theorems 1.1, 1.2 and 1.5, pp. 1–2.

**Suggested home.** `TauCeti/AlgebraicTopology/Spectra/Coefficients`, namespace `TauCeti`.

**Coverage.** Status `planned`. Remaining refinements: Boardman's conditional convergence, Araki–Toda and Burklund's proofs are quoted (gaps); The Eilenberg–Moore spectral sequence requested by KTheoryFiniteLocalFields:L.1 is not in H.6's stage text and is not planned here.

## Dependency order

| Layer | Depends inside this roadmap | Depends on other roadmaps and Tau Ceti layers |
| --- | --- | --- |
| H.1 | — | Tau Ceti AlgebraicTopology stage 1, Tau Ceti AlgebraicTopology stage 2, Tau Ceti AlgebraicTopology stage 4, Tau Ceti AlgebraicTopology stage 8, Tau Ceti UniversalCovers stage 2, Tau Ceti UniversalCovers stage 4 |
| H.2 | H.1 | Tau Ceti AlgebraicTopology stage 4, Tau Ceti AlgebraicTopology stage 5, Tau Ceti AlgebraicTopology stage 8 |
| H.3 | H.1, H.2 | K2SymbolsBrauer:T.1, K2SymbolsBrauer:T.1:classical, Tau Ceti AlgebraicTopology stage 1, Tau Ceti AlgebraicTopology stage 2, Tau Ceti AlgebraicTopology stage 3, Tau Ceti AlgebraicTopology stage 4, Tau Ceti AlgebraicTopology stage 5, Tau Ceti AlgebraicTopology stage 6, Tau Ceti AlgebraicTopology stage 8, Tau Ceti UniversalCovers stage 2 |
| H.4 | H.1, H.2, H.3 | KTheoryLowDegrees:U.1, KTheoryLowDegrees:Z.1 |
| H.5 | — | — |
| H.5:spectra | H.1, H.2, H.3, H.4 | EnhancedDerivedSheaves:E0, EnhancedDerivedSheaves:E5:abstract, Tau Ceti AlgebraicTopology stage 6 |
| H.5:S-delooping | H.1, H.2, H.5:spectra | GeneralAlgebraicKTheory:K.4 |
| H.6 | H.1, H.2, H.5:spectra | ArithmeticGaloisDuality:R02.1, EnhancedDerivedSheaves:E5:abstract, Tau Ceti AlgebraicTopology stage 4 |

Within the roadmap the order is H.1 → H.2 → H.3 → H.4, H.2 → H.5:spectra → H.6, and H.5:spectra together with GeneralAlgebraicKTheory:K.4:construction → H.5:S-delooping; H.5 aggregates its two sub-layers. H.2 feeds GeneralAlgebraicKTheory:K.4:construction (levelwise fibration theorem), which feeds H.5:S-delooping: this is the ordering RT-AREA-ktheory-1/4 asked for. No arrow is reversed by assuming a downstream comparison.

## Acceptance checks

- BC = SSet.toTop (nerve C) is used literally; B(Fin 2) is the interval and B of the one-object category with two morphisms is RP^∞.
- A natural isomorphism gives a homotopy, not a based homotopy: conjugate homomorphisms give freely homotopic maps BG → BH that differ on π₁ by conjugation.
- The homotopy fibre of BH → BG is G/H while the strict fibre category is a point; the long exact sequence ends in pointed sets with the π₁-action.
- Theorem B is applied only when the transition functors of comma categories are homotopy equivalences; t : EA → QA is fibred but fails the hypothesis.
- The levelwise fibration theorem carries its connectivity (or π_*-Kan) hypothesis; the levelwise-equivalence theorem carries properness.
- Plus with the trivial subgroup is a weak equivalence; BG⁺ of a perfect group is simply connected with π₂ = H₂(G); the universal property is used only for abelian targets unless the obstruction-theory gap is closed.
- Homology Whitehead needs abelian spaces: Hatcher's S¹ ∨ Sⁿ ∪ e^{n+1} example is a homology isomorphism that is not a homotopy equivalence.
- B(S⁻¹S) has components ℤ for based free modules and K₀(R) for projective modules; translations between components are not natural; there is no natural transformation 0 ⇒ id □ swap.
- The core, not the category of all maps, carries group completion: BP(R) is contractible.
- Naive and true homotopy groups differ for F₁S¹; for semistable spectra they agree.
- The twist on S¹ ∧ S¹ is −1 in the stable homotopy category.
- π_k(HC) = H_k(C) in negative degrees too; the connective cover erases negative homotopy, so it is never applied to nonconnective K-theory silently.
- π₂(S/2) = ℤ/4: the universal coefficient sequence is not split, and S/2 is not a ring spectrum.
- The tower ⋯ →p S →p S has π_{−1}(holim) = ℤ_p/ℤ ≠ 0.
- π₁(H(ℚ_p/ℤ_p)^∧_p) = ℤ_p: completion is not tensoring with ℤ_p without finite generation.
- The constant filtration has zero E¹ page but nonzero abutment: no convergence without hypotheses.
- The K-theory spectrum's zeroth level is |wC| (not group-completed); from level 1 it is an Ω-spectrum and π_i = K_i for i ≥ 0.

## Gaps and source boundaries

Each gap names the exact missing input and the declarations that need it; none is papered over.

- **Realisation of products** (needed by `H.1/classifying-space-prod`, `H.4/classifying-space-hspace`). |K × L| ≅ |K| × |L| in compactly generated spaces (Milnor 1957), and the k-ification needed to make B(S × S) → BS × BS a homeomorphism for infinite complexes, are imported by Quillen and Nikolaus–Scholze (via Schwede Proposition A.37) and not read. Mathlib's TopCat has the ordinary product topology; the H-space structure on BS needs either countable complexes or compactly generated products. Next action: read Schwede, Symmetric spectra, Appendix A.2 (Propositions A.35–A.37) and plan the compactly generated product as a node or a request to the owner of compactly generated spaces.
- **Gabriel–Zisman imports** (needed by `H.1/fundamental-groupoid-localization`, `H.1/category-homology-derived-colimit`). Quillen cites Gabriel–Zisman App. I 3.2, I 1.2 and App. II 3.3 for local triviality of B∫F → BC, the groupoid-equivalence criterion and the derived-colimit identification; not read. The steps are standard but their proofs are not sourced.
- **Cellular homology with local coefficients** (needed by `H.1/homology-of-small-categories`). The comparison of cellular and singular homology with local coefficients (Whitehead VI.4.8, cited by Weibel) is needed for H_*(BC; L) ≅ H_*(C; L); Tau Ceti AlgebraicTopology stage 4 plans the constant-coefficient comparison and stage 2 twisted chains. Either stage 4 extends to local systems or a node is added here.
- **Dold–Lashof criteria for disconnected fibres** (needed by `H.2/dold-lashof-criteria`, `H.2/quasi-fibration-lemma`). Hatcher proves Lemma 4K.3(a) only for path-connected fibres; Quillen's quasi-fibration lemma needs the general case (Dold–Lashof, Illinois J. Math. 3 (1959), Lemmas 1.3–1.5; Project Euclid open access, not read). Next action: read Dold–Lashof §1.
- **Gluing lemma proof** (needed by `H.2/gluing-lemma`). Boardman–Vogt, Proposition 4.8(b) (cited by Nikolaus–Scholze Lemma C.2) is not read.
- **Reedy model structure on simplicial spaces** (needed by `H.2/realisation-is-homotopy-colimit`). Nikolaus–Scholze's proof of Lemma B.7 uses the Reedy model structure on Fun(Δ^op, Top) and that realisation is left Quillen for it, citing Reedy 1974 and Hirschhorn Chapter 15 (not read); the pinned libraries have model categories (HomotopicalAlgebra.ModelCategory) but neither the Quillen model structure on spaces nor Reedy structures. Next action: read Hirschhorn Theorem 18.7.4 (realisation of a Reedy cofibrant simplicial object is its homotopy colimit) and decide whether to plan the Reedy structure here or request it from the owner of model structures.
- **Levelwise fibration lemma proof** (needed by `H.2/levelwise-fibration-realisation`). Waldhausen 1978 Lemma 5.2 / Bousfield–Friedlander 1978 Theorem B.4 are not available in public versions read here; the statement is taken from Weibel V.1.7 (read) and the RT-AREA-ktheory-1/15 verifier. Next action: read Bousfield–Friedlander Appendix B or Goerss–Jardine IV.4.
- **Thomason homotopy colimit theorem proof** (needed by `H.2/thomason-homotopy-colimit-theorem`). Thomason 1979 (Math. Proc. Cambridge) Theorem 1.2 is quoted from Kahn; its proof is not read.
- **Serre spectral sequence with twisted total-space coefficients** (needed by `H.3/acyclic-map-homology-criterion`). Tau Ceti AlgebraicTopology stage 5 constructs the Serre spectral sequence for a constant coefficient ring; Weibel IV Lemma 1.6 uses π₁(Y)-module coefficients on the total space. The node routes both directions through the universal cover, which needs only constant coefficients plus the identification H_*(X̃; ℤ) ≅ H_*(X; ℤ[π₁Y]) (twisted chains, stage 2); that identification is stated, not sourced.
- **Acyclicity of the cell-attachment plus construction** (needed by `H.3/plus-is-acyclic`). No source read proves the local-coefficient homology isomorphism for the cell-attachment model (Hatcher proves integral homology; Weibel defers to Exercise 1.4 and Berrick §5). The packet gives a proof via the regular cover with group π₁/P; it should be checked against Berrick, An approach to algebraic K-theory (1982), §5, or Hausmann–Husemoller (1979).
- **Plus-construction universal property for non-abelian targets** (needed by `H.3/plus-construction-universal-property`, `H.3/plus-construction-uniqueness`). The abelian-target case is proved from Hatcher Corollary 4.73; the general case needs obstruction theory with local coefficients (Whitehead, Elements of Homotopy Theory, Chapters V–VI; Berrick §5), not read. Every consumer in the atlas uses H-space or abelian targets (BGL(R)⁺, BU, group completions), which the proved case covers.
- **Relative plus construction** (needed by `H.3/plus-relative-fibre-comparison`, `H.3/plus-uce-fibration`). The general relative plus construction comparing fibres after applying plus is stated in a packet-authored form around Weibel IV Exercise 1.9; no source read states it in general (Berrick's book is the standard reference).
- **Primitives and rational Hurewicz for H-spaces** (needed by `H.3/rational-hurewicz-hspace`). The identification of the image of rational Hurewicz with the primitives of H_*(X; ℚ) is Milnor–Moore (Annals 1965), not read; the Cartan–Serre counting statement is read (Hatcher SSAT Theorem 1.24), and Hopf–Borel (Hatcher AT Theorem 3C.4) is cited, not re-read.
- **Homotopy groups of simplicial abelian groups** (needed by `H.5:spectra/eilenberg-maclane-spectrum`). Moore's theorem π_n(A) ≅ H_n(N A) for simplicial abelian groups (and Dold–Thom for A[K]) is needed to identify |A[Sⁿ]| with K(A, n); Mathlib has Dold–Kan but not homotopy groups of simplicial sets, and Tau Ceti AlgebraicTopology stage 8 plans Kan homotopy groups only. Next action: plan Moore's theorem as a node once Kan homotopy groups exist, or request it from stage 8.
- **Kan–Quillen model structure** (needed by `H.5:spectra/stable-model-structure`). Mathlib has the generating cofibrations and anodyne maps of simplicial sets but no Kan–Quillen ModelCategory instance (a TODO there); the stable model structure on symmetric spectra is built levelwise from it. No atlas stage plans it; it is a Mathlib-direction foundation.
- **Model structures on algebras over operads** (needed by `H.5:spectra/operadic-algebras`). The positive model structures on commutative symmetric ring spectra and E∞-algebras and their comparison (Schwede III §6; Shipley 2004) are quoted, not read.
- **Infinite loop space machine equivalence** (needed by `H.5:spectra/grouplike-einfty-connective-spectra`, `H.4/segal-delooping-theorem`). Segal 1974 (Topology 13), Proposition 1.4 and §3, and May–Thomason 1978 are quoted through Bhatt–Scholze and Carlsson; not read. Next action: read Segal 1974 §§1–4.
- **Picard groupoids versus 1-truncated spectra** (needed by `H.5:spectra/picard-one-truncated-spectra`). Patel 2012 §3, cited by Bhatt–Scholze, is not read.
- **CCMT uniqueness of group completions** (needed by `H.4/group-completion-uniqueness-countable`). Caradus–Clarke–McGibbon–Thomason [CCMT, 1.2] quoted by Weibel IV Theorem 4.4.3; not read.
- **Bass commutator lemma for Aut(S)** (needed by `H.4/cofinal-sequence-plus-comparison`). Perfectness and normality of the commutator subgroup of Aut(S) = colim Aut(s_n) are taken by Weibel from Bass p. 355; not read. For GL(R) the input is KTheoryLowDegrees:U.1.
- **Topological K-theory of ℝ via simplicial rings** (needed by `H.4/simplicial-ring-topological-realisation`). The comparisons K^top(ℝ) ≃ ko and the GW and L statements are quoted by Calmès et al. from Schlichting 2017 §10; not read.
- **Araki–Toda products on Moore spectra** (needed by `H.6/moore-spectrum-multiplication`). Araki–Toda (Osaka J. Math. 1965–66) and Browder's scholium are quoted by Weibel IV Theorem 2.8; not read.
- **Burklund's proof** (needed by `H.6/burklund-moore-multiplicative`). Only the statements of Burklund's Theorems 1.1–1.5 are read; the proof (obstruction theory for E_n-quotients and the Patchkoria–Pstrągowski categorified Adams spectral sequence) is not.
- **Boardman conditional convergence** (needed by `H.6/spectral-sequence-convergence-complete`). Boardman, Conditionally convergent spectral sequences (1999), is not available at the URL tried (hopf.math.purdue.edu returned 404); part (b) of the convergence node is quoted, part (a) is proved from the Milnor sequence and the exhaustive case.

## Requests to other roadmaps

- `GeneralAlgebraicKTheory:K.4:construction`: The node GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum: Waldhausen additivity, the relative S.-fibration and the deloopings |wS^{(n)}C| ≃ Ω|wS^{(n+1)}C| for n ≥ 1, natural in exact functors, on which the assembly of the K-theory symmetric spectrum rests (RS-33; RT-AREA-ktheory-1/4). Its fibration input is H.2/levelwise-fibration-realisation of this packet.
- `KTheoryLowDegrees:U.1`: The nodes KTheoryLowDegrees:U.1/whitehead-lemma ([GL(A), GL(A)] = E(A)) and KTheoryLowDegrees:U.1/stable-elementary-perfect (E(A) perfect), the perfect normal subgroup for BGL(A)⁺.
- `KTheoryLowDegrees:Z.1`: The node KTheoryLowDegrees:Z.1/free-summand-data: every finitely generated projective module is a direct summand of a finite free module with explicit complement, giving cofinality of F(R) in iso P(R).
- `K2SymbolsBrauer:T.1:classical`: The recognition theorem for universal central extensions (K2SymbolsBrauer:T.1/recognition-theorem) and the kernel H₂(P; ℤ) (K2SymbolsBrauer:T.1:classical/uce-kernel-h2), planned there per RT-AREA-ktheory-1/30, with the stage edge T.1:classical → H.3.
- `ArithmeticGaloisDuality:R02.1`: lim and lim¹ of towers of abelian groups with the six-term sequence and Mittag-Leffler vanishing (ArithmeticGaloisDuality:R02.1/lim-one, R02.1/mittag-leffler-lim-one), plus invariance of lim and lim¹ under pro-isomorphism of towers and their vanishing on pro-zero towers (requested by KTheoryFiniteLocalFields; please add if not yet a node).
- `EnhancedDerivedSheaves:E0`: The abstract stable-category interface (zero object, fibres and cofibres, suspension equivalence, triangulated homotopy category) against which the triangulated structure of the stable homotopy category of symmetric spectra is checked; the comparison itself is EnhancedDerivedSheaves:E5:spectra-comparison.
- `EnhancedDerivedSheaves:E5:abstract`: Symmetric monoidal stable ∞-categories and E_n-/E∞-algebras abstractly, used to state Burklund's theorem and the E∞ refinement; the concrete operadic model in symmetric spectra is H.5:spectra/operadic-algebras.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid`: Van Kampen for cell attachments (fundamental groupoid colimit theorem and its based corollaries), used for π₁ of classifying spaces and of plus constructions.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`: Relative singular homology and twisted singular chains with local coefficients (item 6), with pullback and naturality, for the comparison H_*(BC; L) ≅ H_*(C; L) and the local-coefficient acyclicity statements.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-3-subdivision-excision-and-mayer--vietoris`: Excision for CW pairs, used in the homology computation of the plus construction.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`: CW pairs, cellular homology and its comparison with singular homology (also with local coefficients), cofibrations and homotopy extension, mapping cylinders, cellular approximation, and the skeletal-filtration exact couple, of which H.6/exact-couple is the generic notion.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`: The Serre-fibration carrier with its pullback and map APIs, and the homology Serre spectral sequence with monodromy local system H_q(F; R) and its comparison (naturality) theorem.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`: Singular cohomology of spaces, for the representability H^n(X; G) ≅ [X, K(G, n)] and its spectrum form.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`: Based pairs and their long exact sequence of relative homotopy groups, Kan homotopy groups with the comparison to cubical homotopy groups, the Hurewicz and relative Hurewicz theorems (including Hatcher Theorem 4.37 form), and Whitehead's theorem for CW complexes and spaces of CW type.
- `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`: Covering-space lifting and classification for the comparison of coverings of BC with morphism-inverting functors and for the covering X_P of the plus construction.
- `tauceti:TauCetiRoadmap/UniversalCovers#stage-4-applications`: K(G,1) recognition, products and homotopy invariance (Tau Ceti IsEilenbergMacLaneSpaceOne), which BG is shown to satisfy.

## Mistakes found in the sources

- **StableHomotopyKTheory/E1** (misprint, Projectivity of the Witt vector affine Grassmannian, Appendix §12, p. 55, paragraph before Definition 12.4, in arXiv:1507.06490v3). Printed: “the simplicial set N (C) whose n-simplices are chains of n − 1 morphisms,”. Correction: whose n-simplices are chains of n composable morphisms X₀ → X₁ → ⋯ → X_n Reason: The display that follows shows f₀, …, f_{n−1}, i.e. n morphisms between n + 1 objects; 0-simplices are objects (zero morphisms) and 1-simplices are morphisms, as the next sentence says. Known: new.
- **StableHomotopyKTheory/E2** (error, The K-book: An introduction to algebraic K-theory, Chapter IV: Definitions of higher K-theory, Chapter IV, 2.9 The ℓ-adic completion, p. IV.22, in the author's chapter file Kbook.IV.pdf (SHA-256 9f1c1b8c…)). Printed: “K₁(C; Z_ℓ) = π₁(K(C); Z_ℓ) is Z_ℓ”. Correction: By the formula of 2.9, π_n(E; ℤ_ℓ) is an extension of T_ℓ π_{n−1}(E) by the ℓ-adic completion of π_n(E); for E = K(ℂ), n = 1: K₁(ℂ) = ℂ^× is divisible, so its completion vanishes, and T_ℓ K₀(ℂ) = T_ℓ ℤ = 0; hence K₁(ℂ; ℤ_ℓ) = 0 and the Tate module ℤ_ℓ of ℂ^× appears in K₂(ℂ; ℤ_ℓ). Reason: Direct application of the extension stated in the same paragraph; recorded in the reviewed decomposition (REVIEW-EXT-01-EXT-15) and re-checked here. Known: new.
- **StableHomotopyKTheory/E3** (misprint, On topological cyclic homology, Appendix C, Definition C.4, p. 162, in arXiv:1707.01799). Printed: “hocolim X := | ∐_{i0→...→in} X(in) |”. Correction: For a covariant X : I → Top and strings i₀ → ⋯ → i_n the coefficient is X(i₀) (or the strings are written in the opposite direction). Reason: With X(i_n) the last face map d_n, which drops i_n, would need a map X(i_n) → X(i_{n−1}) against the arrow; the formula as printed is the one for contravariant diagrams. Known: PAPER-NIKOLAUS-SCHOLZE-18/E18 (recorded by the paper extraction).
- **StableHomotopyKTheory/E4** (misprint, The K-book: An introduction to algebraic K-theory, Chapter V: The fundamental theorems of higher K-theory, Proof of Proposition 1.7, p. V.8, in the author's chapter file Kbook.V.pdf (SHA-256 52dcc8ee…)). Printed: “equivalent to the extension category E(B, Sn f, Sn C) of B by Sn C ... |wS.B| → |wS.(Sn f.)| → |wS.(Sn C)| ... (so that Xn = |wS.B| for all n)”. Correction: S_n f is equivalent to the extension category E(C, S_n f, S_n B) of S_n B by C, and the degreewise split fibrations are |wS.C| → |wS.(S_n f)| → |wS.(S_n B)|, with X_n = |wS.C|; their realisation is the sequence Ω|wS.(S.B)| → |wS.C| → |wS.(S.f)| → |wS.(S.B)| that the proposition states. Reason: By IV.8.5.3, S_n f = S_n B ×_{S_n C} S_{n+1} C contains C as the objects (0, C = ⋯ = C) and projects exactly onto S_n B, so the sub term is C and the quotient term S_n B; with the printed roles the realisation would have |wS.B| as its second term, contradicting the statement. Known: GeneralAlgebraicKTheory/E-relative-S-proof-roles (recorded by the GeneralAlgebraicKTheory K.1 packet).
- **StableHomotopyKTheory/E5** (misprint, The K-book: An introduction to algebraic K-theory, Chapter IV: Definitions of higher K-theory, §2, paragraph before Definition 2.1, p. IV.18, and proof of Proposition 2.7, p. IV.21, in Kbook.IV.pdf (SHA-256 9f1c1b8c…)). Printed: “It is characterized as having only one nonzero reduced integral homology group, namely H̃ m (P ) = Z/ℓ.”. Correction: P^m(ℤ/ℓ) = S^{m−1} ∪_ℓ e^m has only one nonzero reduced integral homology group, H̃_{m−1}(P) = ℤ/ℓ (and H̃_{m−1}(P) = ℤ/q₁ × ℤ/q₂ in the proof of Proposition 2.7). Reason: The same sentence defines P^m(ℤ/ℓ) by attaching an m-cell to S^{m−1} by a degree-ℓ map; its cellular chain complex ℤ →ℓ ℤ in degrees m and m − 1 has homology ℤ/ℓ in degree m − 1 and 0 in degree m (ℓ ≥ 1). Known: new.
- **StableHomotopyKTheory/E6** (error, The K-book: An introduction to algebraic K-theory, Chapter IV: Definitions of higher K-theory, Exercise 1.1, second paragraph, p. IV.14, in Kbook.IV.pdf (SHA-256 9f1c1b8c…)). Printed: “conclude that the canonical map S 3 → X + is a homotopy equivalence.”. Correction: X⁺ is homotopy equivalent to S³ (by the first part of the exercise there is a homotopy equivalence S³ → X⁺), but the canonical composite S³ → X = S³/Γ → X⁺ is not one: equivalently, the degree-one map X → S³ collapsing the complement of a ball is a plus construction. Reason: S³ → S³/Γ is a 120-sheeted covering of closed oriented 3-manifolds, of degree 120 on H₃, and X → X⁺ is an isomorphism on H₃; so the composite multiplies H₃ ≅ ℤ by 120. Known: new.
- **StableHomotopyKTheory/E7** (misprint, The K-book: An introduction to algebraic K-theory, Chapter IV: Definitions of higher K-theory, Proposition 2.7 and the last line of its proof, p. IV.21, in Kbook.IV.pdf (SHA-256 9f1c1b8c…)). Printed: “πm (X; Z/q1 ) × πm (X; Z/q1 )”. Correction: π_m(X; ℤ/q₁) × π_m(X; ℤ/q₂). Reason: The displayed formula just before uses [P^m(ℤ/q₁), X] × [P^m(ℤ/q₂), X]; the repeated q₁ is a slip. Known: K3BlochGroups/E-V4-5 (confirmed by REV-K3BlochGroups--V.4).

## Pinned imports

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

- `mathlib:AddSubgroup.torsionBy` — The m-torsion subgroup A[m] of an additive group. (`Mathlib/Algebra/Module/Torsion/Basic.lean`)
- `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian` — For a finite module M over a Noetherian ring, AdicCompletion I R ⊗ M ≃ AdicCompletion I M. (`Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean`)
- `mathlib:Algebra.GrothendieckGroup` — The Grothendieck group of a commutative monoid, Localization ⊤, with of and the universal property lift. (`Mathlib/GroupTheory/MonoidLocalization/GrothendieckGroup.lean`)
- `mathlib:Algebra.GrothendieckGroup.lift` — Universal property: (M →* G) ≃ (GrothendieckGroup M →* G) for a commutative group G. (`Mathlib/GroupTheory/MonoidLocalization/GrothendieckGroup.lean`)
- `mathlib:AlgebraicTopology.singularHomologyFunctor` — Singular homology C ⥤ TopCat ⥤ C in degree n, for coefficients in a category with homology. (`Mathlib/AlgebraicTopology/SingularHomology/Basic.lean`)
- `mathlib:CategoryTheory.Abelian.DoldKan.equivalence` — The Dold–Kan equivalence SimplicialObject A ≌ ChainComplex A ℕ for abelian A. (`Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean`)
- `mathlib:CategoryTheory.Abelian.SpectralObject` — Spectral objects in an abelian category, with pages, differentials and the induced spectral sequences (E₂ homological, first quadrant). (`Mathlib/Algebra/Homology/SpectralObject/Basic.lean`)
- `mathlib:CategoryTheory.Core` — The core of a category: the groupoid with the same objects and only the isomorphisms. (`Mathlib/CategoryTheory/Core.lean`)
- `mathlib:CategoryTheory.CostructuredArrow` — The comma category F/d of pairs (c, F c ⟶ d) (costructured arrows). (`Mathlib/CategoryTheory/Comma/StructuredArrow/Basic.lean`)
- `mathlib:CategoryTheory.Functor.IsMittagLeffler` — The Mittag-Leffler condition for cofiltered systems of sets. (`Mathlib/CategoryTheory/CofilteredSystem.lean`)
- `mathlib:CategoryTheory.Functor.IsPreFibered` — SGA 1 VI.6.1 prefibered functor: every arrow into the image of an object has a cartesian lift. (`Mathlib/CategoryTheory/FiberedCategory/Fibered.lean`)
- `mathlib:CategoryTheory.Grothendieck` — The Grothendieck construction ∫ F of a functor F : C ⥤ Cat, with its projection to C. (`Mathlib/CategoryTheory/Grothendieck.lean`)
- `mathlib:CategoryTheory.IsTriangulated` — Triangulated categories: pretriangulated categories satisfying the octahedral axiom. (`Mathlib/CategoryTheory/Triangulated/Triangulated.lean`)
- `mathlib:CategoryTheory.MorphismProperty.Localization` — The localisation of a category at a class of morphisms, with its universal property. (`Mathlib/CategoryTheory/Localization/Construction.lean`)
- `mathlib:CategoryTheory.Pretriangulated` — Pretriangulated categories: shift, distinguished triangles and the axioms TR1–TR4 minus the octahedron. (`Mathlib/CategoryTheory/Triangulated/Pretriangulated.lean`)
- `mathlib:CategoryTheory.SimplicialObject` — Simplicial objects SimplexCategoryᵒᵖ ⥤ C; with C = SSet these are bisimplicial sets, with C = TopCat simplicial spaces. (`Mathlib/AlgebraicTopology/SimplicialObject/Basic.lean`)
- `mathlib:CategoryTheory.SpectralSequence` — Spectral sequences: pages of complexes with the identification of homology with the next page (no convergence theory). (`Mathlib/Algebra/Homology/SpectralSequence/Basic.lean`)
- `mathlib:CategoryTheory.StructuredArrow` — The comma category d\F of pairs (c, d ⟶ F c) (structured arrows). (`Mathlib/CategoryTheory/Comma/StructuredArrow/Basic.lean`)
- `mathlib:CategoryTheory.SymmetricCategory` — Symmetric monoidal categories: braided monoidal categories whose braiding is involutive. (`Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean`)
- `mathlib:CategoryTheory.Triangulated.SpectralObject` — Spectral objects in a triangulated category; mapHomologicalFunctor turns them into abelian spectral objects. (`Mathlib/CategoryTheory/Triangulated/SpectralObject.lean`)
- `mathlib:CategoryTheory.Triangulated.SpectralObject.mapHomologicalFunctor` — A homological functor sends a triangulated spectral object to a spectral object in an abelian category. (`Mathlib/CategoryTheory/Triangulated/SpectralObject.lean`)
- `mathlib:CategoryTheory.Triangulated.TStructure` — t-structures on a pretriangulated category. (`Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean`)
- `mathlib:CategoryTheory.nerve` — The nerve of a category: n-simplices are functors Fin (n+1) ⥤ C, i.e. strings of n composable arrows. (`Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean`)
- `mathlib:CategoryTheory.nerveFunctor` — The nerve as a functor Cat ⥤ SSet. (`Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean`)
- `mathlib:CategoryTheory.nerveMap` — The simplicial map nerve C ⟶ nerve D induced by a functor C ⥤ D. (`Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean`)
- `mathlib:ContinuousMap.HomotopyEquiv` — Homotopy equivalences between topological spaces, with refl, symm, trans. (`Mathlib/Topology/Homotopy/Equiv.lean`)
- `mathlib:DerivedCategory` — The derived category of an abelian category, as a localisation of cochain complexes at quasi-isomorphisms. (`Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`)
- `mathlib:Group.IsPerfect` — A group is perfect if its commutator subgroup is ⊤. (`Mathlib/GroupTheory/IsPerfect.lean`)
- `mathlib:HSpace` — H-space structure: a continuous multiplication with a two-sided unit up to homotopy relative to the unit (no associativity or inverses). (`Mathlib/Topology/Homotopy/HSpaces.lean`)
- `mathlib:HomotopicalAlgebra.ModelCategory` — Model categories (CM1–CM5) with fibrations, cofibrations and weak equivalences. (`Mathlib/AlgebraicTopology/ModelCategory/Basic.lean`)
- `mathlib:HomotopyGroup.Pi` — The n-th homotopy group π_ n X x as homotopy classes of generalized loops (cubical model). (`Mathlib/Topology/Homotopy/HomotopyGroup.lean`)
- `mathlib:LoopSpace` — The loop space Ω X x = Path x x. (`Mathlib/Topology/Homotopy/HomotopyGroup.lean`)
- `mathlib:Matrix.GeneralLinearGroup` — The general linear group GL n R of invertible n × n matrices. (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`)
- `mathlib:PadicInt` — The p-adic integers ℤ_p. (`Mathlib/NumberTheory/Padics/PadicIntegers.lean`)
- `mathlib:Path` — Continuous paths between two points with the compact-open topology on the path space. (`Mathlib/Topology/Path.lean`)
- `mathlib:SSet` — Simplicial sets. (`Mathlib/AlgebraicTopology/SimplicialSet/Basic.lean`)
- `mathlib:SSet.KanComplex` — Kan complexes: simplicial sets with the right lifting property against all horn inclusions. (`Mathlib/AlgebraicTopology/SimplicialSet/KanComplex.lean`)
- `mathlib:SSet.toTop` — Geometric realisation SSet ⥤ TopCat, the left Kan extension of the topological simplex along the Yoneda embedding. (`Mathlib/AlgebraicTopology/SingularSet.lean`)
- `mathlib:SimplexCategory.toTop` — The topological simplices as a cosimplicial space. (`Mathlib/AlgebraicTopology/TopologicalSimplex.lean`)
- `mathlib:Topology.RelCWComplex.closedCell` — Closed cells of a classical (relative) CW complex structure (classes Topology.RelCWComplex and Topology.CWComplex: characteristic maps, closure finiteness, weak topology). (`Mathlib/Topology/CWComplex/Classical/Basic.lean`)
- `mathlib:groupHomology` — Group homology H_n(G, A) of a representation, defined as the homology of the inhomogeneous chain complex. (`Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean`)
- `mathlib:sSetTopAdj` — The adjunction SSet.toTop ⊣ TopCat.toSSet between realisation and the singular simplicial set. (`Mathlib/AlgebraicTopology/SingularSet.lean`)
- `tauceti:HomotopyGroup.mapHom` — The group homomorphism on homotopy groups induced by a based continuous map, with mapHom_id and mapHom_comp. (`TauCeti/Topology/Homotopy/HomotopyGroup/Map.lean`)
- `tauceti:HomotopyGroup.pathLoopSpaceMulEquiv` — The loop-space shift π_(m+1)(Ω X x) ≃* π_(m+2) X x. (`TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean`)
- `tauceti:IsCoveringMap.homotopyGroupMulEquiv` — A covering map induces isomorphisms on π_n for n ≥ 2. (`TauCeti/Topology/Homotopy/HomotopyGroup/Covering.lean`)
- `tauceti:TauCeti.LocalCoefficientSystem` — A local coefficient system on a space: a functor from Mathlib's fundamental groupoid to ModuleCat R, with pullback, transport and monodromy. (`TauCeti/AlgebraicTopology/LocalCoefficient.lean`)
- `tauceti:TauCeti.SplitK0.grothendieckAddGroupEquiv` — Split K₀ of an additive category is the Grothendieck group of the monoid of isomorphism classes under biproduct. (`TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`)
- `tauceti:TauCeti.fundamentalGroupMulAut` — The action FundamentalGroup X x →* MulAut (HomotopyGroup N X x) of π₁ on π_n. (`TauCeti/AlgebraicTopology/FundamentalGroup/FundamentalGroupAction.lean`)
- `tauceti:TauCeti.homotopyGroupMulEquivOfPath` — Change of basepoint along a path: HomotopyGroup N X x ≃* HomotopyGroup N X y, depending only on the path class. (`TauCeti/AlgebraicTopology/FundamentalGroup/BasepointChange.lean`)

## References

- Daniel Quillen, *Higher algebraic K-theory: I*, Algebraic K-theory I (Battelle 1972), Lecture Notes in Math. 341, Springer 1973, pp. 85–147; scanned copy (63 PDF pages). Locators give LNM page (printed at page foot) and PDF page.. <https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf>
- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory, Chapter IV: Definitions of higher K-theory*, Author's online chapter file Kbook.IV.pdf (93 pages; chapter page numbers equal PDF page numbers). The published book (AMS GSM 145, 2013) has different page numbers; theorem numbers are those of this file.. <https://www.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf>
- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory, Chapter V: The fundamental theorems of higher K-theory*, Author's online chapter file Kbook.V.pdf (90 pages; chapter page numbers equal PDF page numbers). <https://www.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf>
- Gunnar Carlsson; volume editors Eric M. Friedlander and Daniel R. Grayson, *Deloopings in algebraic K-theory (Handbook of K-theory, vol. 1, chapter I.1)*, Handbook of K-theory, Springer 2005, vol. 1, pp. 3–37; campaign library copy of the two-volume Handbook (1177 PDF pages). No public URL verified for this copy..
- Allen Hatcher, *Algebraic Topology*, Author's free online edition AT.pdf (560 PDF pages, PDF metadata dated 26 October 2022), downloaded from the author's Cornell page; printed page = PDF page − 9 in the pages read. Cambridge University Press print edition 2002 has the same theorem numbering. Provenance check by independent review: re-fetched from the URL above on 2026-09-15 (22:11 UTC) into the reviewer's scratch directory; SHA-256 identical to the value recorded here; PDF CreationDate 26 October 2022.. <https://pi.math.cornell.edu/~hatcher/AT/AT.pdf>
- Stefan Schwede, *Symmetric spectra (book project)*, Preliminary version v3.0, April 12, 2012, 449 PDF pages; printed page = PDF page − 1. <https://www.math.uni-bonn.de/~schwede/SymSpec-v3.pdf>
- Mark Hovey, Brooke Shipley, Jeff Smith, *Symmetric spectra*, J. Amer. Math. Soc. 13 (2000), 149–208; read as arXiv:math/9801077v2 (77 pages). <https://arxiv.org/abs/math/9801077v2>
- Thomas Nikolaus, Peter Scholze, *On topological cyclic homology*, Acta Math. 221 (2018), 203–409; read as arXiv:1707.01799 (169 pages). <https://arxiv.org/abs/1707.01799>
- Bhargav Bhatt, Peter Scholze, *Projectivity of the Witt vector affine Grassmannian*, Invent. Math. 209 (2017); read as arXiv:1507.06490v3 (61 pages). <https://arxiv.org/abs/1507.06490v3>
- B. Calmès, E. Dotto, Y. Harpaz, F. Hebestreit, M. Land, K. Moi, D. Nardin, T. Nikolaus, W. Steimle, *Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings*, Ann. of Math. 204 (2026), no. 1; read as arXiv:2009.07225 (63 pages). <https://arxiv.org/abs/2009.07225>
- Robert Burklund, *Multiplicative structures on Moore spectra*, arXiv:2203.14787 (20 pages). <https://arxiv.org/abs/2203.14787>
- Jacob Lurie, *Higher Algebra*, Author's PDF, 1553 pages (version downloaded 2026-10-06). <https://www.math.ias.edu/~lurie/papers/HA.pdf>
- Allen Hatcher, *Spectral Sequences (Chapter 1 of the book project 'Spectral Sequences in Algebraic Topology')*, Author's chapter file SSch1.pdf (67 pages). <https://pi.math.cornell.edu/~hatcher/SSAT/SSch1.pdf>
- Bruno Kahn, *Towards a functorial construction of Quillen's rank spectral sequence (rank spectral sequence note)*, arXiv:1108.2441v3 (19 pages). <https://arxiv.org/abs/1108.2441v3>
- Brooke Shipley, *HZ-algebra spectra are differential graded algebras*, Amer. J. Math. 129 (2007), 351–379; read as arXiv:math/0209215 (22 pages). <https://arxiv.org/abs/math/0209215>
