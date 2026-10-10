# Roadmap: algebraic topology of spaces and manifolds, Part II: homotopy foundations for algebraic K-theory

Build Quillen’s Theorems A and B, plus and group completion, symmetric spectra, K-theory spectrum assembly, products, coefficients, completion and filtered convergence, starting with Mathlib’s simplicial/category theory and Tau Ceti’s homotopy/covering theory.

## Scope and ownership

This extends **Algebraic topology of spaces and manifolds**. The following mathematics enters through its owners’ interfaces.

- **AlgebraicTopology**, stages 1–4, owns van Kampen, singular and relative chains, twisted chains with local coefficients, excision, cellular homology, mapping cylinders, cellular approximation and CW cofibrations. Stages 5–6 own Serre fibrations, the homology Serre spectral sequence and ordinary cohomology. Stage 8 owns cubical/Kan homotopy comparison, based relative homotopy, absolute and simply connected relative Hurewicz, and Whitehead. Realisation-specific cell indexing and comparisons with category chains belong here. The extensions for arbitrary fibre pairs and twisted cellular comparisons are stated explicitly below.
- **UniversalCovers**, stages 2–4, owns cover classification, covering-induced homotopy isomorphisms, basepoint change and recognition of aspherical spaces. Group classifying spaces and bar comparisons are local.
- **GrothendieckEulerForms**, layer 2, and Tau Ceti's `TauCeti.SplitK0.grothendieckAddGroupEquiv` own algebraic split K₀. Mathlib owns algebraic group completion. This roadmap constructs a space and identifies its components with those groups.
- **IntegralLattices** and **OrthogonalSpinGroups** supply their stated form carriers, orthogonal sums and isometry-group interfaces for the classical orthogonal-sum example. The new target here is its classifying-space and plus comparison.

Local foundations are universal central extensions (Layer 3); stable general-linear groups, elementary perfectness and projective complements (Layer 4); stable and operadic comparisons (Layer 5); Waldhausen categories, S-construction, additivity and relative-S delooping (Layer 6); and countable abelian-tower limits, lim¹ and Mittag-Leffler criteria (Layer 7).

Nerves, realisation, local coefficient carriers, universal covers, split K₀, chain cones and abstract spectral-sequence pages retain their supplier objects.

## Conventions

Small categories have objects and morphisms in fixed universes. Universe changes use `ULift` or Mathlib's small-category interfaces; they do not discard size hypotheses. Classifying spaces are the composite of `CategoryTheory.nerveFunctor` and `SSet.toTop`. A category with no objects has empty realisation. A based space includes an actual point, and based maps include its preservation equation.

Products, mapping spaces and simplicial topological constructions use compactly generated weak Hausdorff spaces where required. A finite CW factor permits the ordinary product topology. No assertion about an arbitrary infinite product silently uses that exception. The CW structure on a realisation has a cell for each nondegenerate simplex, rather than a cell for each simplex.

Composition follows Mathlib. In `SingleObj G`, `f ≫ g = g*f`. In the π₁, the product of the classes of paths p and q is represented by q followed by p. Thus the edge labelled g*h is homotopic to the edge h followed by the edge g. The explicit bar comparison inverts each entry without reversing its tuple; coefficient transport and the first face use that same convention.

The homotopy fibre F(f,b) consists of pairs (a,γ) with γ a path from f(a) to b. Reversing γ compares it with the basepoint-to-f(a) convention. The homotopy boundary sends a loop at b to (a₀,loop), with that endpoint direction. Groups occur in positive absolute homotopy degrees; degree zero is a pointed set. Relative π₂ need not be abelian. Every relative group uses a point in the subspace.

A weak homotopy equivalence is bijective on path components and on all π-groups at every basepoint. Homotopy-cartesian squares use an actual comparison to a path-space homotopy pullback. Quasifibrations only compare strict fibres with homotopy fibres; they do not assert a lifting property.

Plus constructions use a connected space of CW type and a specified perfect normal subgroup of its π₁. Their homology condition ranges over every local coefficient system pulled back from the quotient group. Their uniqueness and functoriality are assertions about maps up to homotopy or about coherent functorial models, not equalities of selected cell attachments.

Symmetric spectra have pointed simplicial-set levels and equivariant iterated structure maps. Naive π-groups are stabilised level π-groups; true π-groups are computed after stable replacement. They agree only under the semistability hypotheses. Homotopy groups are indexed by all integers. Suspension raises degree by one, so π_k(ΣE) = π_(k−1)(E). The symmetry on sphere factors of degrees r and s has sign (−1)^(rs).

For a map f, the stable triangle is X → Y → C(f) → ΣX; the boundary on π_k lowers degree by one. For m ≥ 1, E/m is C(m·id_E). The transition E/p^(r+1) → E/p^r comes from the square with p on the source and identity on the target. The maps on the two outer groups in its Bockstein short exact sequence differ: quotient reduction on π_k(E)/p^r and multiplication by p on the torsion term.

Filtered spectra are coherent point-set diagrams with derived cofibres. Their increasing homological spectral sequence has E¹_(s,t) = π_(s+t)(gr_s E) and d_r of bidegree (−r,r−1). A complete decreasing tower has E¹_(s,t) = π_(t−s)(fib(Y_s → Y_(s−1))) and the separately specified differential. Completeness, exhaustiveness and vanishing of derived limits are distinct assumptions; no displayed page by itself states convergence.

## Exact supplier contracts

### From Mathlib

Use `CategoryTheory.nerve`, `nerveMap`, `nerveFunctor`, `SSet.toTop` and `sSetTopAdj` as defined. Simplicial cells use `SSet.relativeCellComplex`, `SSet.Subcomplex`, `SSet.nonDegenerate`, standard simplices and `TopCat.diskBoundaryInclusion`. Ordinary chains use `SSet.chainComplex` and `AlgebraicTopology.singularHomologyFunctor`; normalised simplicial modules use the Dold–Kan equivalence. Category coefficients live in `ModuleCat R` and use its AB5 instance for exact filtered colimits. A derived-colimit comparison uses `CategoryTheory.Functor.leftDerived`, with `HasProjectiveResolutions` proved or supplied for the diagram category; the existence of that instance is not inferred from the module category alone.

Compact generation uses `CompactlyGenerated`, `CompactlyGenerated.of`, `compactlyGeneratedToTop` and `TopologicalSpace.compactlyGenerated`. The weak-Hausdorff subcategory, its closed products/mapping objects and closed-embedding pushouts are the extensions below. Padic residue comparisons use `PadicInt.toZModPow`, `PadicInt.lift_spec` and `PadicInt.lift_unique` from `NumberTheory.Padics.RingHoms`. Category-localisation and covering comparisons use `CategoryTheory.FreeGroupoid`, comma categories, `CategoryTheory.Grothendieck` and Mathlib's fibre-category interfaces. Monoidal constructions use `CategoryTheory.Core`, `MonoidalCategory` and `SymmetricCategory`; the algebraic component group is `Algebra.GrothendieckGroup`. The model-category construction uses `HomotopicalAlgebra.ModelCategory`, rather than a private collection of lifting predicates. Triangles use `CategoryTheory.Pretriangulated`; spectral-sequence pages use `CategoryTheory.Abelian.SpectralObject` and `SpectralSequence`. Completion comparisons use `AdicCompletion` and its finite-module tensor-product theorem under its Noetherian and finite-generation hypotheses.

### From Tau Ceti

Use `HomotopyGroup.map` and its homomorphism form, `TauCeti.homotopyGroupEquivOfPath`, the fundamental-group action and `HomotopyGroup.loopSpaceMulEquiv`. The path-component/loop comparison is `HomotopyGroup.zerothHomotopyLoopSpaceEquivFundamentalGroup`. Use `TauCeti.LocalCoefficientSystem` with its constant and pullback functors, `TauCeti.CoveringSpace` with its monodromy functor, and `TauCeti.IsEilenbergMacLaneSpaceOne` with its asphericity condition. Comparisons preserve these basepoints, composition and coefficient handedness. Their Lean modules are `TauCeti.Topology.Homotopy.HomotopyGroup.{Map,BasepointChange,FundamentalGroupAction,LoopSpace}`, `TauCeti.AlgebraicTopology.LocalCoefficient`, `TauCeti.Topology.Covering.Monodromy` and `TauCeti.AlgebraicTopology.EilenbergMacLane.Basic`.

### From the neighbouring roadmaps

The ordinary-topology contracts above include naturality and actual induced maps. Twisted chains mean chains with a functor on the π₁oid, rather than a chosen representation with its action omitted. Serre's spectral sequence means the local system H_q(F;R) on the base, its differential, its filtration on total-space homology, and convergence under the specified skeletal hypotheses. A fibre pair that is not an NDR pair uses the extension below, not an unproved invocation of the NDR-only relative theorem.

Monoidal inputs include associators, unitors and symmetry. Local Waldhausen and derived-limit foundations precede assembly and completion.

## How to read the build

Layers 1–2 build category spaces, chains and fibre tools for Quillen’s theorems. Layers 3–4 construct plus and group completion. Layer 5 constructs spectra; Layer 6 assembles K-theory deloopings; Layer 7 supplies coefficients, completion and filtered convergence. Subsections give contracts, API, checks, sources and prerequisites. `Suggested.lean` records representative signatures and tests; its closing comment names the remaining full interfaces. This document is the mathematical specification.

Reference abbreviations below are Q (Quillen), W IV/V (Weibel), C (Carlsson), H AT/SS (Hatcher), S (Schwede), HSS, BF, NS, BS, HA (Lurie), Sh (Shipley), HK III (Calmès et al.) and Bu (Burklund). M and TC in prerequisites mean the exact Mathlib and Tau Ceti suppliers above. Names are relative to the topic namespace: for example `naivePi` in Layer 5 means `SymmSpectrum.naivePi`.

## Layer 1: Classifying spaces and category homology

### 1.1 Classifying space of a small category and of a functor

For small C,D in fixed object/morphism universes, define `classifyingSpace C=|N C|` and `classifyingSpaceMap F=|N F|`. Vertices and edges give a π₁oid functor: the two-simplex identifies edge(f≫g) with edge(f) followed by edge(g). Make universe changes explicit.

- `classifyingSpace`: BC=|nerve C|.
- `classifyingSpaceMap`: BF=|nerveMap F|.
- `classifyingSpaceMap_id`: B(id)=id.
- `classifyingSpaceMap_comp`: B(F⋙G)=BF≫BG.
- `classifyingSpaceFunctor`: The functor B is nerveFunctor⋙toTop.
- `classifyingSpace_vertex`: X gives the vertex [X].
- `classifyingSpace_edge`: f:X→Y gives an edge path [X]→[Y].
- `classifyingSpace_eq_toTop_nerve`: Unfold BC to the nerve realisation.
- `classifyingSpaceMap_vertex`: BF([X])=[FX].
- `classifyingSpaceMap_edge`: BF carries edge(f) to edge(Ff), after vertex identifications.
- `classifyingSpace_edge_comp`: edge(f≫g)≃edge(f)⋅edge(g) rel endpoints; edge(id)≃constant.
- `classifyingSpace_edgeFunctor`: The vertices and edge classes define C→Π₁(BC).
- `classifyingSpace_joined_vertex`: Every point is joined to a vertex.
- `classifyingSpaceMap_universes`: Use matching object and morphism universes; apply ULift/AsSmall otherwise. For Elements→C require coefficient universe ≤ object universe.

**Checks.**

- `classifyingSpace_fin_two_homeomorph_unitInterval`: classifyingSpace (Fin 2) (the ordered set 0 < 1) is homeomorphic to the unit interval, with vertices 0 and 1 the endpoints.
- `classifyingSpace_empty`: classifyingSpace of the empty category is the empty space, and of the one-object one-morphism category is a single point.
- `classifyingSpace_discrete`: For a set S viewed as a discrete category, classifyingSpace S is homeomorphic to S with the discrete topology.
- `classifyingSpaceMap_not_full`: There is a continuous map classifyingSpace (Fin 2) ⟶ classifyingSpace (Fin 2) (the reflection of the interval) that is not classifyingSpaceMap of any functor: B is faithful but not full.

(Q §1, LNM p. 89; W IV Characterization 3.1, Recipe 3.1.1 and Def. 3.1.4, pp. IV.24–25.)

*Needs:* M.

### 1.2 The realised boundary inclusion is the disk boundary inclusion

Prove `toTop_boundary_arrowIso_diskBoundaryInclusion`: the realised arrow ∂Δ[n]→Δ[n] is isomorphic to ∂Dⁿ→Dⁿ in `Arrow TopCat`, n≥0. Include the maps in this isomorphism; at n=0 the boundary is empty and the disk a point.

(W IV Def. 3.1.4, p. IV.25; Q §1, LNM p. 89.)

*Needs:* M.

### 1.3 The CW structure on the realisation of a simplicial set

Construct `toTopCWComplex X` for every simplicial set. Nondegenerate n-simplices are its n-cells, with realised characteristic maps; maps preserve skeleta and monos give closed subcomplexes. Under Mathlib's indexing, simplicial skeleton n+1 realises to topological skeleton n.

- `SSet.toTopCWComplex`: The CW structure on |X|.
- `SSet.toTopCWComplex_cell_equiv`: n-cells correspond to nondegenerate n-simplices.
- `SSet.toTop_map_cellular`: |f| preserves skeleta.
- `classifyingSpace_subcomplex`: A subcategory gives a CW subcomplex.
- `SSet.toTop_t2Space`: |X| is Hausdorff.
- `SSet.toTop_isCompact_subset_finite_subcomplex`: A compact subset lies in a finite subcomplex.
- `SSet.toTop_map_isClosedEmbedding_of_mono`: A simplicial mono realises to a closed subcomplex embedding.
- `SSet.toTop_stronglyLocallyContractibleSpace`: Contractible open sets form a neighbourhood basis.
- `classifyingSpace_sigma`: B(∐Cᵢ)≅∐BCᵢ, respecting inclusions.

**Checks.**

- `toTopCWComplex_stdSimplex_cells`: The CW structure on |Δ[n]| has exactly C(n+1, k+1) cells of dimension k.
- `toTopCWComplex_point`: |Δ[0]| has exactly one cell, of dimension 0, although Δ[0] has a simplex in every degree.
- `toTopCWComplex_compat_skeleton`: With T2Space (SSet.toTop.obj X), the range of SSet.toTop.map (X.skeleton (n + 1)).ι equals the CW n-skeleton Topology.CWComplex.skeleton univ n.
- `toTopCWComplex_not_all_simplices`: For C the one-object category of a nontrivial group G, the 1-cells of BC are the non-identity elements of G, not all elements of G.

(W IV Def. 3.1.4, p. IV.25; W IV Characterization 3.1 (4)–(5), p. IV.24.)

*Needs:* AlgebraicTopology, §1.2, M.

### 1.4 Realisations are strongly locally contractible

Prove `toTop_stronglyLocallyContractibleSpace`: every point of |X| has a basis of contractible open neighbourhoods, without a local-finiteness assumption, including points incident to infinitely many cells.

(H AT Appendix, Prop. A.4 and proof, p. 522.)

*Needs:* §1.3.

### 1.5 Realisations of monomorphisms are closed subcomplex embeddings

Prove `toTop_map_isClosedEmbedding_of_mono`: a simplicial mono realises to a closed embedding with the nondegenerate-cell subcomplex as image.

(H AT Appendix, discussion before Prop. A.1, pp. 519–520; W IV Characterization 3.1(4), p. IV.24.)

*Needs:* §1.3, M.

### 1.6 Compact sets in a realisation lie in finite subcomplexes

Prove `toTop_isCompact_subset_finite_subcomplex`: every compact K⊆|X| lies in a simplicial subobject with finitely many nondegenerate simplices. Finiteness does not count degeneracies, which occur in unbounded degrees even for a point.

(H AT Appendix, Prop. A.1 and proof, p. 520.)

*Needs:* §1.3.

### 1.7 B(C^op) is canonically homeomorphic to BC

Construct the `classifyingSpace_opHomeomorph`: reverse each arrow string and its affine coordinates, fixing vertices. This gives BC≅B(Cᵒᵖ) without choosing a functor C→Cᵒᵖ.

(Q §1, formula (3), LNM p. 91; W IV p. IV.25.)

*Needs:* §1.1, M.

### 1.8 Classifying space of a product of categories

The projections give a continuous bijection `classifyingSpace_prodMap`: B(C×D)→BC×BD. Prove it is an ordinary-product homeomorphism when either nerve has finitely many nondegenerate simplices; in particular B(C×[1])≅BC×I.

(Q §1, formula (4), LNM p. 92.)

*Needs:* §1.1, M.

### 1.9 Classifying space of a product, compactly generated case

Construct `classifyingSpace_prodHomeomorph_k` for arbitrary small C,D using the compactly generated product. The ordinary product agrees when both categories have countably many arrows.

Use Mathlib’s compactly generated carrier to construct the full subcategory `CGWH` cut out by: every compact Hausdorff image is closed. Its product is k(X×Y), and its mapping object is the k-ified compact-open space. Construct `CGWH.cartesianClosed`, `CGWH.limits` and closed-embedding pushouts `CGWH.closedPushout`; the latter agree with ordinary pushouts. These are category/closure extensions of the carrier. (S, App. A, Def. 2.3 and Props. 2.4–2.5, pp. 421–423; NS, Constr. B.6 and Prop. C.1, pp. 157–160.)

**Checks.**

- `cgwh_compact_factor`: a compact Hausdorff factor has the ordinary product topology.
- `cgwh_mapping_point`: maps from a point recover Y, with its topology.
- `cgwh_closed_pushout`: gluing two intervals at their endpoints gives the ordinary circle; the closed embedding remains closed in the pushout.

(Q §1, formula (4), LNM p. 92; W IV Characterization 3.1 (6), p. IV.24.)

*Needs:* §1.8, §1.1.

### 1.10 A natural transformation induces a homotopy

For η:F₀→F₁, realise C×[1]→D to construct `classifyingSpace_homotopy η`, with edge(η_c) as its track. A zigzag of transformations gives a map homotopy without requiring invertible components.

(Q §1, Prop. 2, LNM p. 92; W IV Homotopy-theoretic properties 3.2, p. IV.25.)

*Needs:* §1.1, §1.8.

### 1.11 Adjoint functors and equivalences induce homotopy equivalences

Prove `classifyingSpace_homotopyEquiv_of_adjunction`: realising the unit/counit of L⊣R makes BL and BR homotopy inverse. Deduce equivalence invariance and invariance under a small skeleton of a skeletally small category.

(Q §1, Prop. 2, Cor. 1, LNM p. 92; W IV 3.2 and Example 3.2.1, p. IV.26.)

*Needs:* §1.10.

### 1.12 Categories with an initial or terminal object are contractible

Prove `classifyingSpace_contractible_of_hasInitial` and its terminal-object version by natural-transformation contractions. An empty category meets neither hypothesis.

(Q §1, Prop. 2, Cor. 2, LNM p. 92; W IV Example 3.2.2, p. IV.26.)

*Needs:* §1.11.

### 1.13 The nerve commutes with filtered colimits of categories

For a filtered small diagram of small categories, construct `nerve_filteredColimitIso`, respecting every stage inclusion. Finite strings and their equalities occur at a common stage, so the nerve commutes with this colimit degreewise.

(Q §1, before Prop. 3, LNM p. 92.)

*Needs:* M.

### 1.14 Homotopy groups commute with filtered colimits of categories

Prove `classifyingSpace_filteredColimit_pi`: πₙ commutes with filtered categorical colimits, with a basepoint represented at a stage and transported along inclusions. Include π₀ as sets; compact spheres and homotopies lie in finite subcomplexes.

(Q §1, Prop. 3, LNM p. 92.)

*Needs:* §1.1, §1.3, §1.13, §1.6, §1.5.

### 1.15 Filtered colimits along homotopy equivalences

If all transitions of a filtered small categorical diagram realise to homotopy equivalences, prove `classifyingSpace_filteredColimit_homotopyEquiv`: every stage comparison is a homotopy equivalence, by the π₀/πₙ comparison and CW Whitehead.

(Q §1, Prop. 3, Cor. 1, LNM p. 92.)

*Needs:* §1.14, AlgebraicTopology, TC.

### 1.16 Filtered categories are contractible

Prove `classifyingSpace_contractible_of_filtered`: filteredness contracts finite diagrams and hence finite subcomplexes; CW Whitehead upgrades weak contractibility to contractibility.

(Q §1, Prop. 3, Cor. 2, LNM p. 93; W IV Exercise 3.4, p. IV.34.)

*Needs:* §1.15, §1.12.

### 1.17 Homology of classifying spaces commutes with filtered colimits

Prove `classifyingSpace_filteredColimit_homology` for each commutative ring R, fixed coefficient module and n≥0, naturally in filtered small diagrams. Finite chain support and exact filtered module colimits supply the comparison.

(Q §1, Prop. 3 and proof, LNM p. 92; W IV Exercise 3.5, p. IV.34.)

*Needs:* §1.27, §1.13, §1.6, M.

### 1.18 Path components of a classifying space

Construct the `classifyingSpace_pi0Equiv`: components are objects modulo the equivalence relation generated by arrows in either direction. Specify its vertex equation; directed reachability alone is insufficient.

(W IV Lemma 3.3, p. IV.27.)

*Needs:* §1.1, §1.3, §1.6, AlgebraicTopology, M.

### 1.19 Realisations of simplicial coverings are covering maps

Prove `toTop_isCoveringMap` for a simplicial covering with unique simplex lifts after choosing a vertex lift. Identify the fibre at each vertex via open stars; an arbitrary simplicial mono has no such conclusion.

(Q §1 'Coverings of BC and the π₁', LNM p. 90; W IV Exercise 3.1, pp. IV.33–34.)

*Needs:* §1.3, M.

### 1.20 Coverings of BC are morphism-inverting functors

Construct `classifyingSpace_coveringEquivalence`: coverings of BC correspond to Set-valued functors inverting arrows. F gives B(F.Elements)→BC, fibre F(c) and transport F(f). Recover covering morphisms as well, with explicit universe lifts.

(W IV Exercise 3.1, pp. IV.33–34; Local coefficients 3.5.1, p. IV.29; Q §1 'Coverings of BC and the π₁', Prop. 1, LNM p. 90.)

*Needs:* §1.1, §1.3, §1.19, §1.4, M, TC.

### 1.21 π₁ of BC is the automorphism group in C[C⁻¹]

Construct `classifyingSpace_fundamentalGroupoidEquivalence`: the universal localisation of C at all arrows is equivalent to Π₁BC through the edge functor. Its automorphism group at c identifies π₁(BC,c); do not merely localise an endomorphism monoid.

(Q §1, Prop. 1, LNM p. 90; W IV Application 3.4.2, p. IV.28.)

*Needs:* §1.20, UniversalCovers, §1.1, §1.3, M.

### 1.22 Presentation of π₁(BC) from a maximal tree

For connected C and a rooted maximal tree, prove `classifyingSpace_pi1Presentation`: generators are non-tree edges, tree edges equal 1, and every composable pair gives the two-simplex relation, retaining endpoint data.

- `classifyingSpace_treePath`: The root-to-X path in T; reverse oppositely traversed edges.
- `classifyingSpace_treeLoop`: treePath(X)⋅edge(f)⋅treePath(Y)⁻¹.
- `classifyingSpace_maximalTreePresentation`: Hom(π₁BC,H) corresponds to arrow labels with id↦1, f≫g↦label(g)label(f), and tree edges↦1.
- `classifyingSpace_maximalTreePresentation_apply`: A homomorphism labels f by its value on treeLoop(f).

(W IV Lemma 3.4 and the group/monoid examples following it, pp. IV.27–28.)

*Needs:* §1.21, M.

### 1.23 Local coefficient systems on BC are morphism-inverting functors

For a ring R, construct `classifyingSpace_localSystemEquivalence` between local systems on BC and C→ModuleCat R inverting all arrows, by vertex evaluation and edge transport. Arbitrary category-homology coefficients need not invert arrows.

(W IV Local coefficients 3.5.1, p. IV.29; Q §1, after Prop. 1, LNM p. 90.)

*Needs:* §1.21, M, TC.

### 1.24 Homology of a small category with coefficients in a functor

Define `categoryHomology R C M n` from ⊕_(c₀→⋯→cₙ)M(c₀): d₀ applies M(f₁), interior faces compose and the last deletes the final vertex. Normalise the alternating-face complex. Coefficient and categorical maps respect identities/composition at chain level.

- `categoryHomology`: Hₙ of categoryChainComplex(C,M).
- `categoryChainComplex`: Degree n is ⊕_{σ∈NₙC}M(σ₀), with alternating faces.
- `categoryHomology.map`: A coefficient transformation induces Hₙ maps, preserving id/composition.
- `categoryHomology.mapOfFunctor`: F:C→D gives Hₙ(C,F*M)→Hₙ(D,M), functorially.
- `categoryHomology.longExactSequence`: A short exact coefficient sequence gives the homology LES.
- `categoryHomologyZeroIsoColimit`: H₀(C,M)≅colim M naturally.
- `categoryHomology.normalizedIso`: Normalisation preserves this homology.
- `categoryHomology.constIso`: For constant A, identify the complex with (nerve C).chainComplex A and its homology.
- `categorySimplicialModule`: The simplicial module with the degree-n terms and coefficient face maps.

**Checks.**

- `categoryHomology_zero_eq_colimit_const`: For C connected and M the constant functor at A, categoryHomology C M 0 ≅ A.
- `categoryHomology_of_terminal`: If C has a terminal object t then categoryHomology C M n = 0 for n > 0 and categoryHomology C M 0 ≅ M t.
- `categoryHomology_singleObj_compat`: For C = SingleObj G and M a G-representation, categoryHomology C M n ≅ groupHomology M n (§1.32).
- `categoryHomology_not_cohomology`: For G = ℤ/2 and trivial coefficients ℤ, categoryHomology (SingleObj G) ℤ 2 = 0 while group cohomology H²(G; ℤ) = ℤ/2: homology cannot be replaced by trivial-coefficient cohomology.

(W IV (3.5) The homology of C and BC, p. IV.28; Q §1 'The homology of BC', LNM p. 91.)

*Needs:* M.

### 1.25 Homology of a category computes derived functors of colim

Prove `categoryHomology_derivedColimit`, naturally in M. First construct `categoryModule_projectiveResolutions` for small C by sums of free representables, and identify the augmented bar resolution and its acyclicity.

- `categoryHomology_representable_isZero`: Hₙ₊₁(C,R[C(X,−)])=0.
- `categoryHomologyFunctor`: The functor M↦Hₙ(C,M).
- `categoryColim_additive`: colim on module-valued diagrams is additive.
- `categoryHomology_isDerivedColimit`: Hₙ(C,−)≅Lₙcolim; first construct projective resolutions of diagrams.
- `categoryHomology_isDerivedColimit_naturality`: The comparison commutes with every coefficient transformation.

(Q §1 'The homology of BC', unnumbered display before formula (1), LNM p. 91.)

*Needs:* §1.24, M.

### 1.26 Twisted cellular chains of a category

For morphism-inverting M, construct `classifyingSpace_twistedCellularChainIso` with normalised category chains. A simplex coefficient is at c₀; d₀ transports by f₁. Verify signs and transport in degrees one and two.

Prove `twistedExcision` for excisive CW triads and arbitrary local systems, and `twistedCellularSingularComparison` for a CW pair: its cellular complex with transported coefficients computes singular relative homology naturally. Skeletal relative groups are sums of the cell fibres; the connecting map gives the transported cellular boundary. These are the twisted extensions required for the category-chain comparison. (H AT, §3.H, pp. 327–329; Q, §1, pp. 89–90.)

**Checks.**

- `twisted_circle`: circle monodromy T gives differential T−1.
- `twisted_point`: a point has only degree-zero coefficient homology.
- `twisted_constant`: trivial transport recovers the supplied ordinary cellular comparison.

(Q §1 'The homology of BC', LNM p. 91; W IV Application 3.4.2, p. IV.28.)

*Needs:* §1.3, §1.23, §1.24, AlgebraicTopology.

### 1.27 Homology of BC with local coefficients is homology of C

Deduce `classifyingSpace_homologyIso_categoryHomology` for small C and morphism-inverting coefficients, naturally in both inputs and all n≥0, using twisted cellular-to-singular comparison and normalisation.

(Q §1 'The homology of BC', unnumbered display before formula (1), LNM p. 91; W IV Local coefficients 3.5.1, p. IV.29.)

*Needs:* §1.24, §1.23, §1.3, AlgebraicTopology, §1.26.

### 1.28 Classifying space of a discrete group

Define `Group.classifyingSpace G=B(SingleObj G)` with its vertex and based functorial homomorphism maps. Keep the Unit object universe compatible with morphism universes; lift explicitly for large groups.

- `Group.classifyingSpace`: BG=B(SingleObj G).
- `Group.classifyingSpace.map`: Bφ= B(SingleObj.mapHom φ), preserving id/composition.
- `Group.classifyingSpace.basepoint`: The unique vertex, preserved by Bφ.
- `Group.classifyingSpace.loop`: loop(gh)≃loop(h)⋅loop(g) rel endpoints; loop(1)≃constant, matching π₁ multiplication.
- `Group.classifyingSpace.pathConnected`: BG is path-connected.
- `Group.classifyingSpace.fundamentalGroupMulEquiv`: π₁(BG)≅G naturally, with loop(g)↦g.
- `Group.classifyingSpace.homologyIso`: Hₙ(BG;M)≅groupHomology(M,n); trivial ℤ coefficients give integral homology.
- `Group.classifyingSpace.fundamentalGroupMulEquiv_loop`: The π₁ comparison takes loop(g) to g and intertwines Bφ with φ.
- `Group.classifyingSpace.H1AddEquiv`: H₁(BG;ℤ)≅Additive(Abelianization G), naturally via the bar comparison.

**Checks.**

- `classifyingSpace_trivial_contractible`: Group.classifyingSpace (trivial group) is contractible (indeed a point).
- `classifyingSpace_H1_abelianization`: H₁(BG;ℤ)=G_ab naturally: Bφ induces φ_ab under this identification.
- `classifyingSpace_zmod2_cells`: Group.classifyingSpace (Multiplicative (ZMod 2)) has exactly one cell in each dimension (it is RP^∞).
- `classifyingSpace_conj_freely_homotopic`: Conjugate G→H homomorphisms give freely homotopic BG→BH maps; relative-basepoint homotopy need not exist.
- `classifyingSpace_not_contractible_Z`: Group.classifyingSpace (Multiplicative ℤ) has π₁ ≅ ℤ and is not contractible, although ℤ is torsion-free and acyclic in positive degrees ≥ 2.

(W IV Example 3.1.3, p. IV.25; W IV Application 3.4.1, p. IV.28.)

*Needs:* §1.1.

### 1.29 Classifying spaces of translation categories

Prove `translationCategory_covering` for a left G-set X, with fibre X over BG. For X=G the total space is contractible; for X=G/H, prove `translationCategory_subgroupComparison` with BH and the inclusion-induced map.

(W IV Translation categories 3.3.1, p. IV.27; Exercise 3.2, p. IV.34.)

*Needs:* §1.18, §1.11, §1.12, §1.28, §1.20, §1.3, M.

### 1.30 BG is a K(G,1)

Prove `Group.classifyingSpace_isKOne`: BG is connected, π₁≅G by loop(g)↦g and πₙ=0 for n≥2. Under Mathlib multiplication loop(gh) is h followed by g; retain based naturality.

(W IV Application 3.4.1, p. IV.28.)

*Needs:* §1.28, §1.22, §1.29, TC.

### 1.31 Conjugate homomorphisms induce freely homotopic maps

For ψ(g)=hφ(g)h⁻¹, construct a free homotopy Bφ≃Bψ with basepoint track edge(h). Conjugation is retained; a based homotopy is not asserted.

(W IV Homotopy-theoretic properties 3.2, p. IV.25.)

*Needs:* §1.10, §1.28, §1.1, TC.

### 1.32 The nerve of a group is the bar construction

Construct the coefficient-preserving `groupNerve_barChainIso` by inverting each bar entry without reversing the tuple. Category d₁(g,a)=g·a−a; pinned bar d₁(g,a)=g⁻¹·a−a. Compute d₂ to fix the h*g interior term.

**Checks.**

- `bar_boundary_low_degree`: The bar boundaries are d₁[g,a]=g⁻¹a−a and d₂[g,h,a]=[h,g⁻¹a]−[gh,a]+[g,a].
- `bar_composition_noncommuting`: For g=(01), h=(12) on Fin 3, (gh)(2)=0 and (hg)(2)=1.

(W IV Application 3.4.2 and (3.5), p. IV.28.)

*Needs:* §1.24, §1.27, §1.28, M.

### 1.33 The nerve of a groupoid is a Kan complex

Prove `nerve_groupoid_isKan` by inverse-filled outer horns and composition-filled inner horns. For a general category, only the inner-horn property applies.

(BS Appendix §12, p. 55 (arXiv v3).)

*Needs:* M.

### 1.34 Classifying spaces of groupoids are 1-types

Prove `classifyingSpace_groupoid_oneType` and B G≃⊔_[x]B Aut(x), using chosen component representatives and their actual inclusion maps. Each component has zero πₙ for n≥2.

(BS Appendix §12, pp. 55–56; W IV Def. 4.1, p. IV.36.)

*Needs:* §1.11, §1.30, §1.18, §1.3.

### Examples

The ordered category 0 → 1 realises to an interval; a discrete category realises to its discrete object set. The nonidentity arrows of a one-object group category are exactly its one-cells. In degree one, the bar boundary carries the chosen inverse action; its two-simplex relation agrees with edge composition.

### Dependencies

Nerve, realisation, CW and covering suppliers; preceding cells/chains for local comparisons.

## Layer 2: Homotopy fibres, realisation and Quillen’s theorems

### 2.1 Weak homotopy equivalences of spaces

Define `IsWeakHomotopyEquivalence f` by bijective π₀ and every positive πₙ at all source basepoints, including the empty/nonempty distinction. Give identity, two-out-of-three and homotopy invariance; CW Whitehead gives a homotopy inverse.

- `IsWeakHomotopyEquivalence`: Bijective π₀ and all positive πₙ at every basepoint.
- `IsWeakHomotopyEquivalence.comp`: Weak equivalences satisfy two-out-of-three.
- `ContinuousMap.HomotopyEquiv.isWeakHomotopyEquivalence`: A homotopy equivalence is weak.
- `IsWeakHomotopyEquivalence.of_homotopic`: Homotopic maps have the same weak-equivalence property.
- `IsWeakHomotopyEquivalence.homotopyEquiv_of_cw`: Between CW spaces, a weak equivalence admits a homotopy inverse.

**Checks.**

- `isWeakHomotopyEquivalence_id`: The identity of any space is a weak equivalence.
- `isWeakHomotopyEquivalence_contractible`: Any map between contractible spaces is a weak equivalence.
- `isWeakHomotopyEquivalence_not_pi0`: The inclusion of one point into a two-point discrete space is not a weak equivalence (π₀ fails), although it is an isomorphism on all π_n at its basepoint.
- `isWeakHomotopyEquivalence_iff_homotopyEquiv_cw`: For CW complexes X, Y, f is a weak equivalence iff it is the forward map of a homotopy equivalence.
- `isWeakHomotopyEquivalence_not_all_basepoints`: S¹⊔*→{a,b} is bijective on components and correct on all π at *. It fails at a circle point: π₁=ℤ maps to zero.

(H AT §4.1, Thm. 4.5, p. 346; H AT §4.1 CW Approximation, p. 352.)

*Needs:* AlgebraicTopology, M, TC.

### 2.2 Homotopy fibre of a map

Define `homotopyFiber f b={(a,γ):γ:f(a)→b}` with its path-subspace topology, projection and constant-path strict-fibre inclusion. For H:fi≃b, `fiberSequenceMapOfHomotopy` defines `IsHomotopyFiberSequenceOfHomotopy`; the strict predicate uses constant H. Compare the reversed endpoint convention.

- `homotopyFiber`: Pairs (a,γ) with γ(0)=f(a), γ(1)=b.
- `homotopyFiber.proj`: (a,γ)↦a.
- `homotopyFiber.basepoint`: If f(a₀)=b, choose (a₀,const).
- `homotopyFiber.ofFiber`: The strict fibre maps by a↦(a,const).
- `homotopyFiber.map`: A strict commutative square induces fibre maps, preserving id/composition.
- `homotopyFiber.loopSpaceInclusion`: ω↦(a₀,ω) from Ω(B,b).
- `homotopyFiber.ofHomotopy`: A homotopy f≃g compares fibres by concatenating its tracks.
- `homotopyFiber.reverseHomeomorph`: Reverse γ to compare paths b→f(a).
- `IsHomotopyFiberSequence`: For a chosen nullhomotopy H:fi≃b, require its comparison F→hofib(f,b) weak; the strict variant uses a constant H.

**Checks.**

- `homotopyFiber_id_contractible`: homotopyFiber (𝟙 B) b is contractible for every b.
- `homotopyFiber_point_eq_loopSpace`: For the inclusion of the point b into B, homotopyFiber is homeomorphic to Ω B b = LoopSpace B b.
- `homotopyFiber_toPoint`: For the constant map A → point, homotopyFiber is homeomorphic to A.
- `homotopyFiber_ofFiber_not_weakEquiv`: For proper H⊂G, BH→BG has a point strict fibre but homotopy-fibre components G/H. The comparison misses components.

(W IV Homotopy Fiber 1.2, p. IV.3; H AT §4.3 'Pathspace constructions', p. 407.)

*Needs:* §2.1, M.

### 2.3 Every map factors through a fibration

Construct E_f={(a,γ):γ(0)=f(a)} and endpoint p(a,γ)=γ(1). The mapping-path factorisation uses the constant-path inclusion A→E_f and proves p has HLP for every parameter space.

Define `IsHurewiczFibration p` by HLP for every space Z and every commuting initial-lift square Z×{0}→E over Z×I→B. Prove `IsHurewiczFibration.comp`, `pullback` and `isSerreFibration`. This is stronger than the disk-only predicate. (H AT, §4.2, pp. 375–376.)

**Checks.**

- `hurewicz_identity`: the identity map has HLP.
- `hurewicz_projection`: E×B→B lifts by retaining its E coordinate.
- `hurewicz_endpoint`: endpoint evaluation on the mapping-path space has HLP, whereas {0}→I does not lift the path t↦t.

(H AT §4.3, Prop. 4.64, p. 407.)

*Needs:* §2.2, AlgebraicTopology.

### 2.4 Mapping path space retracts onto its source

Prove `mappingPathSpace_homotopyEquiv`: retract to a and contract γ to its initial point, fixing constant paths. This retraction is not over B; its endpoint compatibility is the homotopy.

(H AT §4.3, Prop. 4.64, p. 407.)

*Needs:* §2.2.

### 2.5 Serre fibrations induce bijections on relative π-groups

Extend relative homotopy to arbitrary fibre pairs. For Serre p and b=p(e), prove `serreFibration_relativeHomotopy_bijective`: πₙ(E,p⁻¹b,e)→πₙ(B,b) bijective for n≥1, with group compatibility where defined, by disk lifting without an NDR hypothesis.

Construct `relativeDiskLift` using the pair-homeomorphism from a cylinder with bottom and side boundary to a disk cylinder with its bottom. This promotes the Serre disk HLP to relative disk lifting and proves the relative-group comparison even when the fibre inclusion is not NDR. (H AT, Prop. 4.48, pp. 376–377.)

(H AT §4.2, Thm. 4.41 and proof, p. 376.)

*Needs:* AlgebraicTopology.

### 2.6 For a fibration the fibre is the homotopy fibre

For Hurewicz p, prove the strict-fibre inclusion into hofib is a homotopy equivalence; for Serre p, prove a weak equivalence. The stronger result requires HLP for every parameter space.

(H AT §4.3, Prop. 4.65, p. 408.)

*Needs:* §2.3, §2.8, AlgebraicTopology, §2.9, §2.5, §2.4, TC.

### 2.7 Connecting map of a homotopy fibre

Construct `homotopyFiber.connecting`: loop shift followed by ω↦(a₀,ω), giving δ:πₙ₊₁B→πₙF. It is a homomorphism for n≥1 and a pointed map at zero; based naturality includes basepoint transports.

- `homotopyFiber.connecting`: δ:πₙ₊₁B→πₙhofib(f).
- `homotopyFiber.connectingHom`: For n≥1, δ is a group homomorphism.
- `homotopyFiber.connecting_naturality`: Strict squares commute with δ.
- `homotopyFiber.connecting_eq_loopShift`: δ is loop-shift followed by the loop inclusion.

**Checks.**

- `connecting_id_eq_zero`: For f = 𝟙 B, connecting is the trivial map.
- `connecting_point_bijective`: For the inclusion of the point b into B, connecting is bijective in every degree (it is the loop-space shift).
- `connecting_basepointChange`: A path δ:a₀→a₁ in the strict fibre changes the boundary by basepoint transport along (δ,const_b). Use the path equivalence in degree zero and its group form in positive degrees.
- `connecting_not_hom_degree_zero`: For Σ₂⊂Σ₃ the boundary is g↦gΣ₂. It cannot be a group homomorphism because Σ₂ is not normal; π₀ of the fibre is only a pointed set.

(W IV Homotopy Fiber 1.2, p. IV.3; H AT §4.3, p. 407.)

*Needs:* §2.2, M, TC.

### 2.8 Long exact sequence of a homotopy fibre

For every based continuous map, prove exactness at the recurring πₙF,πₙA,πₙB terms and π₀A. The π₀F end is a pointed-set sequence with the following π₁ action, not an abelian-group LES.

(H AT §4.2, Thm. 4.41, p. 376; W IV Homotopy Fiber 1.2, p. IV.3; Q §1 'The exact homotopy sequence', LNM p. 96.)

*Needs:* §2.2, §2.7, §2.3, AlgebraicTopology, §2.5, §2.4, TC.

### 2.9 The π₁-action at the pointed-set end of the fibre sequence

Construct the π₁(B,b) action on π₀F by appending loops. Its orbits are fibres of π₀F→π₀A; the constant-path stabiliser is im(π₁A→π₁B). Under the chosen multiplication, appending ω acts on the left by [ω].

(W IV Homotopy Fiber 1.2, p. IV.3; W IV Exercise 3.3, p. IV.34.)

*Needs:* §2.8.

### 2.10 Transport of homotopy fibres along paths in the base

Define `homotopyFiber.transport f ω` by (a,γ)↦(a,γ⋅ω). Its specified inverse is transport along ω⁻¹; path homotopy and concatenation give the homotopies. Boundary naturality includes the path between transported and selected fibre basepoints.

- `homotopyFiber.transport`: Along ω:b→b′, send (a,γ) to (a,γ⋅ω).
- `homotopyFiber.transportHomotopyEquiv`: The inverse up to homotopy is transport along ω⁻¹.
- `homotopyFiber.transport_homotopic`: Endpoint-fixed path homotopies give homotopic transports.
- `homotopyFiber.transport_trans`: Transport(ω⋅ω′)≃transport(ω′)∘transport(ω); constant transport≃id.
- `homotopyFiber.connecting_transport`: For σ:a₀→a₁ and ω=fσ, δ at a₁ after basepoint change along ω equals transported δ at a₀, then fibre basepoint change along (σ(t),ω|[t,1]), including the initial concatenation reparametrisation.

**Checks.**

- `transport_refl_homotopic_id`: transport f (Path.refl b) is homotopic to the identity.
- `transport_loopSpace`: For the inclusion of the point b, transport along a loop ω is γ ↦ γ.trans ω on Ω B b; on π₀(Ω B b) ≅ π₁(B, b) it is left multiplication by [ω] in Mathlib's group structure.
- `transport_comm_proj`: proj ∘ transport f ω = proj.
- `transport_not_identity_onPi0`: For BH → BG and a loop g ∉ H, transport acts on π₀(homotopyFiber) = G/H nontrivially; transport is not the identity on π₀.

(H AT §4.3, Prop. 4.61, p. 405.)

*Needs:* §2.2, §2.7, M, TC.

### 2.11 Homotopy pullbacks and homotopy-cartesian squares

Define the path pullback by (a,γ,c), γ:f(a)→g(c). A strict square's constant-path comparison defines `IsHomotopyCartesian`; a chosen commuting homotopy defines `IsHomotopyCartesianOfHomotopy`. Give projections, functoriality and fibration pullback comparison.

- `homotopyPullback`: Triples (a,γ,c), γ:f(a)→g(c).
- `homotopyPullback.fst`: The projections carry the track γ between their composites.
- `homotopyPullback.symm`: Swap a,c and reverse γ.
- `IsHomotopyCartesian`: The strict-square comparison to the path pullback is weak.
- `homotopyPullback.point_eq_homotopyFiber`: Pullback against a point b is hofib(f,b).
- `IsHomotopyCartesian.of_serreFibration`: A strict pullback of a Serre fibration is homotopy-cartesian.

**Checks.**

- `homotopyPullback_point_point`: homotopyPullback (point b) (point b) is the loop space Ω B b.
- `isHomotopyCartesian_id`: For any map p : E → B, the square with E′ = E, B′ = B, α = id, h = id and p′ = p is homotopy-cartesian (the comparison is the inclusion of E into the mapping path space of p).
- `isHomotopyCartesian_iff_fiber`: For B′ contractible, the square is homotopy-cartesian iff E′ → homotopyFiber p (h b′) is a weak equivalence (§2.12).
- `not_isHomotopyCartesian_strictFiber`: For a proper subgroup H ⊂ G the square (strict fibre point → BH over point → BG) is not homotopy-cartesian.

(Q §1 'The exact homotopy sequence', LNM p. 96.)

*Needs:* §2.2, §2.1, §2.3, §2.6, §2.8, §2.9, AlgebraicTopology.

### 2.12 Homotopy-cartesian squares over a contractible base

For contractible B, prove the compactly generated path pullback of A→B←C is homotopy equivalent to A×C, with chosen contraction/endpoint data. A square is homotopy-cartesian exactly when its product comparison is weak.

(Q §1 'The exact homotopy sequence', LNM pp. 96–97.)

*Needs:* §2.11, §2.10.

### 2.13 Pasting homotopy-cartesian squares

Prove homotopy-cartesian pasting: both squares imply the rectangle; given the right square, the left and outer rectangle conditions are equivalent. For homotopy-commuting squares use the concatenated chosen homotopies.

(Q Proof of Thm. B, LNM p. 99.)

*Needs:* §2.11, §2.8, §2.9, §2.3, §2.1, §2.6.

### 2.14 From comma categories to homotopy fibres

Construct the forward-arrow comparison `costructuredArrowToHomotopyFiber`: B(F↓d)→hofib(BF,[d]), with projection c and path F(c)→d. Its covariant change agrees with forward transport. The dual `commaToHomotopyFiber` uses d↓F and reversed paths.

- `commaToHomotopyFiber`: B(Y\\f)→hofib(Bf,[Y]), reversing the arrow track.
- `commaToHomotopyFiber_proj`: Its projection is B(StructuredArrow.proj).
- `commaToHomotopyFiber_naturality`: For u:Y→Y′, comma change and transport along edge(u)⁻¹ give homotopic comparisons.
- `costructuredArrowToHomotopyFiber`: B(f/Y)→hofib(Bf,[Y]) uses the forward arrow track.
- `commaToHomotopyFiber_fiberToComma`: On the strict category fibre, the comparison agrees up to homotopy with x↦(x,const).

**Checks.**

- `commaToHomotopyFiber_id`: For f = 𝟭 C′ both source and target are contractible, so commaToHomotopyFiber is a weak equivalence.
- `commaToHomotopyFiber_subgroup`: For H⊂G, ∗\f is the H-action groupoid on G. Its components are Hv; the fibre components are v⁻¹H. The comparison sends Hv↦v⁻¹H and every component is contractible.
- `commaToHomotopyFiber_fiber_compat`: Restricted to the strict fibre f⁻¹(Y) ⊆ Y\f (objects (X, id)), it agrees with homotopyFiber.ofFiber.
- `commaToHomotopyFiber_not_equiv`: For {0}→(0<1), 1\f is empty but the fibre at 1 is contractible. Theorem B’s hypothesis is essential.

(W IV Example 3.2.3, p. IV.26; Q §1, LNM p. 96.)

*Needs:* §2.2, §1.10, §2.10, §1.8, M.

### 2.15 Quasi-fibrations

Define `IsQuasiFibration p` by every strict-fibre comparison being weak. Prove the relative-homotopy characterisation, Serre implication and distinguished-subspace path-pullback comparison. This condition does not supply a continuous lifting function.

- `IsQuasiFibration`: Every strict-fibre comparison is weak.
- `IsQuasiFibration.of_serreFibration`: Serre fibrations are quasifibrations.
- `IsQuasiFibration.longExactSequence`: The homotopy-fibre LES becomes the strict-fibre LES.
- `IsQuasiFibration.iff_relative`: For surjective p and path-connected B, equivalently all πᵢ(E,p⁻¹b)→πᵢ(B,b) are bijective, with the low-degree pointed-set clauses.

**Checks.**

- `isQuasiFibration_prod_fst`: The projection B × F → B is a quasi-fibration.
- `isQuasiFibration_mappingCylinder_iff`: The projection of the mapping cylinder of f onto I is a quasi-fibration iff f is a weak equivalence.
- `isQuasiFibration_id`: The identity of any space is a quasi-fibration.
- `not_isQuasiFibration_two_intervals`: The map [0, 1/2] ⊔ [1/2, 1] → [0, 1] given by the two inclusions is not a quasi-fibration: its homotopy fibres are all two points, but its fibre over 0 is one point.

(H AT §4.K 'Quasifibrations', p. 479; Q §1, lemma preceding 'Proof of Thm. B', LNM p. 97.)

*Needs:* §2.2, §2.1, §2.6, §2.8, AlgebraicTopology.

### 2.16 Relative π-groups of excisive triads

For excisive triads (X;A,B) and (Y;C,D), let f carry A into C and B into D. If f gives bijections of both relative homotopy sets/groups πᵢ(A,A∩B)→πᵢ(C,C∩D) and πᵢ(B,A∩B)→πᵢ(D,C∩D) for i<n and surjections for i=n, at every basepoint, prove the same assertions for πᵢ(X,A)→πᵢ(Y,C), and symmetrically for the other pair. Interiors of A,B and C,D cover their respective spaces. Keep the low-degree pointed-set clauses and arbitrary-pair homotopy interfaces.

(H AT §4.K, Prop. 4K.1 and proof, pp. 476-478; May, Cor. 2.3, p. 94.)

*Needs:* AlgebraicTopology.

### 2.17 Dold–Lashof criterion for open covers

Prove the open-cover quasifibration criterion: if B is covered by open sets and the restriction over each finite intersection is a quasifibration, the whole map is a quasifibration. Begin with B=U∪V and restrictions over U,V,U∩V, then use the excisive-triad comparison for arbitrary covers. No numerability condition is needed in this criterion; none of the intersection hypotheses can be silently omitted.

**Checks.**

- `open_cover_intersection`: The intersection restriction must be distinguished as well as the two separate restrictions.

(H AT §4.K, Lemma 4K.3, p. 480; H AT §4.K, proof of Lemma 4K.3, p. 480; May, Cor. 2.4, p. 95.)

*Needs:* §2.15, §2.16, AlgebraicTopology.

### 2.18 Dold–Lashof criterion for exhaustions

Prove `IsQuasiFibration.of_exhaustion` for B=⋃Bₙ with each Bₙ distinguished and every compact subset contained at a finite stage. Require the compact homotopy factorisation in E; weak topology/compact support ensures relative representatives occur at a stage.

(H AT §4.K, Lemma 4K.3(b) and proof, p. 480; May, Thm. 2.6, p. 95.)

*Needs:* §2.15, §2.1.

### 2.19 Dold–Lashof criterion for deformations

Prove `IsQuasiFibration.of_deformation` for compatible E,B deformations into preserved E′,B′. Require p|E′ quasifibred, pD_E=D_Bp and every terminal fibre map a weak equivalence.

(H AT §4.K, Lemma 4K.3(c) and proof, pp. 480-481; May, Lem. 2.5, p. 95.)

*Needs:* §2.15, §2.1, §2.8, AlgebraicTopology.

### 2.20 Realisation of simplicial spaces and bisimplicial sets

Construct simplicial-space coend realisation and its singular adjoint, agreeing with SSet on discrete levels. For bisimplicial sets give iterated realisation, diagonal, transpose and external product, preserving the inclusions and naturality in compactly generated spaces.

- `SimplicialSpace.realization`: The coend ∫ⁿ Xₙ×Δⁿ.
- `SimplicialSpace.realizationAdj`: Realisation is left adjoint to Y↦C(Δⁿ,Y).
- `SimplicialSpace.realization_discrete`: Levelwise discrete realisation agrees with |X|.
- `BisimplicialSet.realization`: Iterated realisation of p↦|Tₚ|.
- `BisimplicialSet.diagonal`: The diagonal n↦Tₙ,ₙ.
- `SimplicialSpace.realization_preservesColimits`: Realisation preserves colimits.

**Checks.**

- `realization_const`: The realisation of the constant simplicial space at Y is homeomorphic to Y.
- `realization_box_stdSimplex`: For the bisimplicial set Δ[r] ⊠ Δ[s], the realisation is homeomorphic to Δ^r × Δ^s.
- `realization_discrete_compat`: For a simplicial set X, the realisation of the discrete simplicial space is SSet.toTop.obj X.
- `bisimplicial_diagonal_not_mathlib_diagonal`: The diagonal of Δ[1]⊠Δ[1] has four vertices. Mathlib’s single-object long-edge map Xₙ→X₁ is a different operation.

(Q §1, Lemma preceding the proof of Thm. A, LNM p. 94; W IV Def. 3.6, p. IV.29.)

*Needs:* §1.8, M.

### 2.21 Diagonal and iterated realisation

Construct the `BisimplicialSet.diagonalRealizationIso` with iterated realisation, compatible with transposition. Prove the compactly generated bisimplicial-space version using the simplex-product homeomorphism.

(Q §1, Lemma preceding the proof of Thm. A, LNM pp. 94–95; W IV Def. 3.6, p. IV.29.)

*Needs:* §2.20, §1.8.

### 2.22 Proper simplicial spaces

Define `SimplicialSpace.IsProper` by closed Hurewicz-cofibration latching inclusions. Latching means the degeneracy-image union with induced topology, empty at zero. Expand HEP at the older typed pin; discrete levels and one-direction bisimplicial realisation are proper.

- `SimplicialSpace.latching`: The degeneracy-image union in Xₙ and its inclusion.
- `SimplicialSpace.IsProper`: All latching inclusions are closed Hurewicz cofibrations.
- `SimplicialSpace.isProper_discrete`: Levelwise discrete objects are proper.
- `SimplicialSpace.isProper_realization_bisimplicial`: Realising one direction of a bisimplicial set gives a proper simplicial space.

**Checks.**

- `isProper_const`: A constant simplicial space at Y is proper: in degree 0 its latching inclusion is ∅ → Y, and in positive degrees it is the identity of Y; both have the homotopy extension property.
- `isProper_nerve_discrete_category`: The nerve of a category viewed as a discrete simplicial space is proper.
- `isProper_compat_bisimplicial`: For a bisimplicial set T, the latching subspace of p ↦ |T_{p,•}| in degree n is the realisation of the simplicial subset of degenerate (n, •)-simplices, a subcomplex.
- `not_isProper_bad_degeneracy`: Take X₀=* and X₁={0}∪{1/k:k≥1}, with s₀(*)=0. The point inclusion has no neighbourhood deformation: each 1/k is its own path component. This 1-skeletal simplicial space is not proper.

(NS Appendix C, paragraph before Prop. C.3, p. 161.)

*Needs:* §2.20, AlgebraicTopology.

### 2.23 Realisation of simplicial spaces preserves finite limits

Prove `SimplicialSpace.realization_finiteLimits` in compactly generated weak Hausdorff spaces: realisation preserves terminal objects, binary products and equalisers, hence all finite limits. Give the product and pullback comparison maps and naturality. This claim concerns the coend realisation with compactly generated topology and does not make the ordinary TopCat product automatically correct.

(NS Appendix C, Prop. C.1, p. 160.)

*Needs:* §2.20.

### 2.24 The gluing lemma for pushouts along h-cofibrations

Prove `closedHEP.gluingLemma` for maps of pushout diagrams of compactly generated weak Hausdorff spaces. Require the attaching maps in both diagrams to be closed Hurewicz cofibrations and the three vertical maps to be weak equivalences. Then their pushout map is a weak equivalence. All maps commute with the attaching maps; an arbitrary quotient need not preserve a weak equivalence.

(NS Appendix C, Lemma C.2 (Gluing Lemma), p. 161.)

*Needs:* §2.1, AlgebraicTopology.

### 2.25 Pushout products of h-cofibrations (Strøm's product theorem)

Prove `closedHEP.pushoutProduct`: the inclusion (A×Y)∪(X×B)→X×Y is a closed Hurewicz cofibration when A→X and B→Y are closed Hurewicz cofibrations in the chosen compactly generated category. The product topology and the closedness hypotheses are part of the assertion.

(NS Appendix C, proof of Prop. C.3, p. 161.)

*Needs:* AlgebraicTopology.

### 2.26 Weak equivalences of proper simplicial spaces

Prove `SimplicialSpace.realization_weakEquiv`: a levelwise weak equivalence between proper compactly generated simplicial spaces realises to a weak equivalence, by skeletal gluing and compactness. Both properness hypotheses are required.

(NS Appendix C, Prop. C.3, p. 161; W IV Thm. 3.6.1(i), p. IV.29.)

*Needs:* §2.22, §2.24, §2.21, AlgebraicTopology, §2.1, §2.25.

### 2.27 Realising levelwise homotopy fibre sequences

Prove `realization_fibreSequence_connected`: a map of proper simplicial spaces with compatible simplicial basepoints, levelwise homotopy-fibre sequences and connected base/fibre levels realises to a fibre sequence.

(W V Prop. 1.7 and proof, p. V.8; BF Appendix B, Thm. B.4 and following connectedness observation, p.121.)

*Needs:* §2.26, §2.15, §2.17, §2.2, §2.21, §2.18, §2.19.

### 2.28 The π_*-Kan fibre-square theorem

For a square V→X over W→Y of bisimplicial sets, assume every vertical row is homotopy-cartesian, X and Y are π_*-Kan and π₀X→π₀Y is a Kan fibration. Prove `bisimplicialFibreSequence_piStarKan`: its diagonal square is homotopy-cartesian. Define `PiStarKan` by the following horn condition: for m,t≥1, a∈X_(m,0) and k≤m, every compatible family ξᵢ∈πₜ(X_(m−1,*),dᵢa), i≠k, lifts to ξ∈πₜ(X_(m,*),a) with dᵢξ=ξᵢ. Define these groups using vertical Kan replacement. Row-connected X satisfies this condition; π₀-fibration is a separate assumption in the disconnected case.

(W V Prop. 1.7 and proof, p. V.8; BF Appendix B, §B.3, criterion B.3.1 and Thm. B.4, pp. 119–121; proof pp. 121–128.)

*Needs:* §2.2, §2.26, §2.21, AlgebraicTopology.

### 2.29 Bousfield–Kan homotopy colimit of a diagram of spaces

Define `SpaceDiagram.hocolim X` by realising ⊔_(c₀→⋯→cₙ)X(c₀), for small C and compactly generated values. In degree one d₀ applies X(f), d₁ retains the source point. Give its cocone, functorial maps and terminal-object comparison.

- `hocolim`: Realise strings i₀→⋯→iₙ weighted by X(i₀).
- `hocolim.toNerve`: Forget the coefficient point to map to BI.
- `hocolim.map`: Transformations induce hocolim maps, preserving id/composition.
- `hocolim.isWeakHomotopyEquivalence_map`: Objectwise weak equivalences induce weak hocolim maps for compactly generated Hausdorff values.
- `hocolim.const_point`: The constant-point hocolim is BI.
- `hocolim.toColimit`: The augmentation to colim X.

**Checks.**

- `hocolim_const_point`: hocolim I (const point) is homeomorphic to classifyingSpace I.
- `hocolim_terminal`: If I has a terminal object t, hocolim I X → X t is a homotopy equivalence.
- `hocolim_discrete_grothendieck`: For X : I ⥤ Type viewed as discrete spaces, hocolim I X ≅ classifyingSpace (Grothendieck X).
- `hocolim_ne_colim_span`: For the span point ← S⁰ → point, colim is a point but hocolim is the suspension of S⁰, i.e. S¹.

(NS Appendix C, Def. C.4 and Prop. C.5, p. 162; Q §1, lemma preceding 'Proof of Thm. B', LNM pp. 97–98.)

*Needs:* §2.20, §2.22, §2.26.

### 2.30 Realisation of a proper simplicial space is its homotopy colimit

For proper simplicial X, construct the `SimplicialSpace.realization_hocolimEquiv` over Δᵒᵖ, respecting the cocone. Properness ensures the ordinary coend computes the derived colimit. Construct `replacementAugmentation` from the simplicial replacement and compare its double realisation with |X| by the extra-degeneracy contraction and skeletal gluing. This supplies the comparison directly, without assuming an unstated Reedy model structure.

(NS Appendix B, Lemma B.7 with proof and footnote 44, p. 149 (arXiv pagination; p. 386 in Acta Math.).)

*Needs:* §2.22, §2.26, §2.29, §2.1.

### 2.31 Quasifibrations over a nerve

For X:C→spaces sending all arrows to weak equivalences, prove `SpaceDiagram.hocolim_to_classifyingSpace` is a quasifibration with fibre X(c) at each vertex, for the simplicial-replacement projection.

(Q §1, lemma and proof preceding 'Proof of Thm. B', LNM pp. 97–98; W IV Thm. 3.6.1(ii), p. IV.29.)

*Needs:* §2.29, §2.15, §2.17, §2.11, §2.18, §2.19, §1.3.

### 2.32 Thomason’s homotopy-colimit comparison

For F:C→Cat, construct the weak equivalence `thomasonMap`: B(∫F)→hocolim B(Fc), agreeing on each fibre inclusion. The Grothendieck construction retains its specified (c,x) objects and F-defined arrows.

(Kahn Thm. 1.4.3 and Lemma 1.4.5, p. 6–7.)

*Needs:* §2.29, §1.11, M.

### 2.33 The homology spectral sequence of a functor

Construct `functorHomologySpectralSequence`: E²_p,q=H_p(D;d↦H_q(F↓d;M))⇒H_p₊q(C;M), using covariant comma transport. State the twisted version with coefficient pullback/invertibility; first-quadrant filtration gives convergence.

(W IV Exercise 3.7, p. IV.34; Kahn Cor. 1.4.6, p. 7.)

*Needs:* §1.24, §1.12, M.

### 2.34 Quillen's Theorem A

Prove `quillenTheoremA` for small F:C→D: contractibility of every B(F↓d) makes BF a homotopy equivalence by CW Whitehead. Give its opposite-category dual.

(Q §1, Thm. A, LNM p. 93; proof LNM pp. 95–96; W IV 3.7 Quillen's Thm. A with proof, p. IV.30.)

*Needs:* §2.21, §2.26, §2.31, §1.12, §1.7, M.

### 2.35 Quillen's prefibred functors are SGA 1 prefibered functors

Prove `prefibred_comma_adjunction`: Quillen's prefibred condition is the SGA 1 condition that each strict-fibre inclusion in its comma category has a right adjoint compatible with projection. Do not strengthen it to arbitrary cartesian lifting.

(W IV Fibered and Cofibered functors 3.7.3, p. IV.31; Q §1, LNM p. 93.)

*Needs:* §1.11, M.

### 2.36 Theorem A for prefibred and precofibred functors

For prefibred F, contractible strict fibres imply `quillenTheoremA_prefibred` by fibre-to-comma adjunctions; give the precofibred dual. The fibres are nonempty.

(W IV Cor. 3.7.4, p. IV.31.)

*Needs:* §2.34, §2.35.

### 2.37 Quillen's Theorem B

Prove `quillenTheoremB`: if every d→d′ gives a homotopy equivalence B(F↓d)→B(F↓d′), its constructed comparison to hofib(BF,d) is weak. State the homotopy-cartesian square with the forward-arrow path and naturality.

(Q §1, Thm. B and Corollary, LNM p. 97; proof LNM pp. 98–99; W IV 3.8 Quillen's Thm. B with proof, p. IV.31.)

*Needs:* §2.34, §2.31, §2.11, §2.13, §2.14, §2.8, §2.12, §1.12.

### 2.38 Theorem B for prefibred functors

For prefibred F with homotopy-equivalent base-change functors on strict fibres, deduce `quillenTheoremB_prefibred`. Use the fibre inclusion and basepoint path; nonempty fibres alone do not suffice.

(W IV Cor. 3.8.1, p. IV.32.)

*Needs:* §2.37, §2.35, §2.14.

### 2.39 Classifying spaces of a group extension form a fibre sequence

For surjective G→Q with kernel N, prove BN→BG→BQ is a homotopy-fibre sequence with π₁ sequence N→G→Q. For a nonsurjective map, its homotopy fibre has extra coset components.

(W IV Exercise 3.6(c), p. IV.34.)

*Needs:* §2.38, §1.28.

### Examples

The fibre of an identity is contractible, while the fibre of a point mapping to X is ΩX. For a projection A × B → B, transport has the endpoint direction. A proper simplicial object and a merely levelwise equivalence are distinguished by the degeneracy cofibration hypotheses. The group-extension comparison uses a surjection with the kernel.

### Dependencies

Layer 1 and ordinary topology; properness, fibre hypotheses and CGWH products for realisation.

## Layer 3: Acyclic maps and the plus construction

### 3.1 Acyclic spaces

Define `IsAcyclicSpace F`: F is nonempty and path-connected, with Hₙ(F;ℤ)=0 for n>0, equivalently the augmentation induces homology isomorphisms. Apply this predicate to all homotopy fibres; positive homology vanishing alone admits the empty space.

- `IsAcyclicSpace`: Nonempty and H̃ₙ(F;ℤ)=0 for all n≥0.
- `IsAcyclicSpace.pathConnected`: An acyclic space is path-connected.
- `IsAcyclicSpace.of_contractible`: Contractible spaces are acyclic.
- `IsAcyclicSpace.of_homotopyEquiv`: Homotopy equivalence preserves acyclicity.
- `IsAcyclicSpace.perfect_fundamentalGroup`: π₁ of an acyclic space is superperfect.

**Checks.**

- `isAcyclicSpace_point`: A one-point space is acyclic.
- `not_isAcyclicSpace_empty`: The empty space is not acyclic (H₀ = 0 ≠ ℤ in reduced homology convention: reduced H₋₁ ≠ 0).
- `not_isAcyclicSpace_circle`: The circle is not acyclic: H₁(S¹; ℤ) = ℤ.
- `isAcyclicSpace_poincare_sphere_minus_point`: The Poincaré homology 3-sphere minus a point is acyclic but has nontrivial perfect π₁ ≅ the binary icosahedral group SL₂(F₅).
- `isAcyclicSpace_contractible_compat`: IsAcyclicSpace F holds whenever ContractibleSpace F (Mathlib).

(W IV Def. 1.3, p. IV.4.)

*Needs:* M.

### 3.2 An acyclic space has perfect π₁ with vanishing H₂

For acyclic F of CW type, prove `IsAcyclicSpace.perfect_and_H2`: π₁F is perfect with H₂(π₁F;ℤ)=0, by degree-one Hurewicz and the universal-cover fibration. Its π₁ need not be trivial.

(W IV Lemma 1.3.1 with proof, p. IV.4.)

*Needs:* §3.1, §1.30, §2.8, AlgebraicTopology, AlgebraicTopology stage 8, §3.16, §1.32, M.

### 3.3 Acyclic maps

Define `IsAcyclicMap f` by acyclicity of every hofib(f,y). Give identity, composition, homotopy invariance and descent. For connected CW spaces this is equivalent to homology isomorphisms for all pulled-back target local systems.

- `IsAcyclicMap`: Every homotopy fibre is acyclic.
- `IsAcyclicMap.surjective_pi1`: π₁f is surjective for connected spaces.
- `IsAcyclicMap.ker_isPerfect`: Its kernel is perfect normal.
- `IsAcyclicMap.comp`: Composites remain acyclic.
- `IsAcyclicMap.iff_homology`: For connected CW spaces, equivalently f is a homology isomorphism for every local system pulled back from Y.

**Checks.**

- `isAcyclicMap_id`: The identity map is acyclic.
- `isAcyclicMap_toPoint_iff`: X → point is acyclic iff X is acyclic.
- `isAcyclicMap_homotopyEquiv`: The forward map of a homotopy equivalence is acyclic.
- `not_isAcyclicMap_point_into_acyclic`: A point→(Poincaré sphere minus a point) is an integral homology isomorphism, but fails π₁ surjectivity and its loop-space fibre is not acyclic.

(W IV Def. 1.4, p. IV.4.)

*Needs:* §3.1, §2.2, §2.10.

### 3.4 Acyclic maps are surjective on π₁ with perfect kernel

Prove `IsAcyclicMap.surjective_pi1` and `perfect_ker` at every basepoint. The π₀ map is bijective since all homotopy fibres are nonempty and connected.

(W IV Def. 1.4, p. IV.4.)

*Needs:* §3.3, §3.2, §2.8.

### 3.5 Homology with local coefficients through a regular cover

For a connected CW regular G-cover, construct `regularCover_twistedChainIso`: twisted chains are C_*(X′;ℤ)⊗_(ℤ[G])M, using inverse deck action on the right and M on the left. This is natural; passing tensor through homology additionally requires flatness.

(H AT §3.H, Prop. 3H.4, p. 331.)

*Needs:* AlgebraicTopology, UniversalCovers.

### 3.6 Serre comparison on fibres

Prove `serreComparison_fibre`: a map of Serre fibrations with connected fibres, connected CW bases and trivial integral fibre-homology monodromy has a fibre homology isomorphism if the base and total maps do. Use the first-quadrant Serre comparison. In the proof compare the relative Serre spectral sequences and take the least degree where the fibre comparison fails: connectedness identifies the bottom column, so this first failure cannot be cancelled by higher rows.

(H SS 1, Prop. 1.12 with proof, pp. 20–21.)

*Needs:* AlgebraicTopology, §2.3.

### 3.7 Acyclic maps are local-coefficient homology isomorphisms

Prove `IsAcyclicMap.iff_homology` for connected CW spaces. The forward Serre sequence collapses; the converse recovers π₁ surjectivity via regular-cover coefficients and applies fibre comparison over a simply connected base. All target local systems are required.

- `IsAcyclicMap.of_comp`: For connected CW spaces, acyclic f and gf imply acyclic g.

(W IV Lemma 1.6 with proof, p. IV.5.)

*Needs:* §3.3, §2.2, AlgebraicTopology, UniversalCovers, §3.6, §3.5, §2.11.

### 3.8 Plus constructions as acyclic maps

Define `IsPlusConstruction f x P` by acyclicity and ker(π₁f)=P. For connected CW spaces identify the quotient and local-homology maps. Construct `perfectRadical G`, the largest perfect subgroup, prove normality/maximality and preservation under homomorphisms.

- `IsPlusConstruction`: Acyclic f with ker(π₁f)=P.
- `perfectRadical`: The subgroup generated by all perfect subgroups is perfect and normal.
- `IsPlusConstruction.pi1_quotient`: The induced quotient isomorphism π₁X/P≅π₁Y.
- `IsPlusConstruction.homology_iso`: Homology is preserved for every quotient local system.

**Checks.**

- `isPlusConstruction_trivial_iff`: f is a plus construction relative to the trivial subgroup iff f is a weak equivalence (§3.9).
- `isPlusConstruction_acyclic_toPoint`: For X acyclic, X → point is a plus construction relative to π₁(X).
- `perfectRadical_perfect_group`: For a perfect group G, perfectRadical G = ⊤; for an abelian group it is ⊥.
- `not_isPlusConstruction_nonperfect`: No map is a plus construction relative to a non-perfect subgroup: the kernel of an acyclic map on π₁ is perfect.

(W IV Def. 1.4.1, p. IV.5.)

*Needs:* §3.3, M.

### 3.9 Acyclic maps that are isomorphisms on π₁

Prove `IsAcyclicMap.isWeakHomotopyEquivalence_of_bijective_pi1` for connected source: the fibres are weakly contractible. With CW-type source/target, deduce a homotopy equivalence.

(W IV Exercise 1.2(b), p. IV.14; H AT §4.3 Exercise 16, p. 420.)

*Needs:* §3.3, §3.2, §2.8, AlgebraicTopology, M.

### 3.10 The plus construction by attaching 2- and 3-cells

For connected CW X and perfect normal P⊲π₁X, construct `plusConstruction X x P` by 2-cells killing P and 3-cells cancelling relative classes. The relative free ℤ[π₁X/P] complex in degrees 3,2 has identity differential, ensuring every quotient local-system comparison.

- `plusConstruction`: Attach only 2- and 3-cells to kill P with acyclic inclusion.
- `plusConstruction.incl`: The subcomplex inclusion X→X⁺ₚ.
- `plusConstruction.isPlusConstruction`: The inclusion satisfies IsPlusConstruction.
- `plusConstruction.relCW`: The relative CW cells have dimensions 2 and 3.
- `plusConstruction.pi1Equiv`: π₁X⁺ₚ≅π₁X/P.

**Checks.**

- `plusConstruction_bot`: For P = ⊥, plusConstruction.incl X ⊥ is a homotopy equivalence.
- `plusConstruction_acyclic_contractible`: If X is acyclic, plusConstruction X π₁(X) is contractible (Weibel IV Exercise 1.2(a)).
- `plusConstruction_perfect_group_simplyConnected`: For a perfect group G, plusConstruction (BG) ⊤ is simply connected with the same integral homology as BG, and π₂ ≅ H₂(G; ℤ) by Hurewicz (Tau Ceti AlgebraicTopology stage 8).
- `plusConstruction_not_unique_on_nose`: Different admissible cell choices give plus spaces homotopy equivalent under X; they are not equated as selected spaces.

(H AT §4.2, Prop. 4.40 with proof and the construction following it, p. 374; W IV Exercise 1.4, p. IV.14; Thm. 1.5(1), p. IV.5.)

*Needs:* §3.8, UniversalCovers, AlgebraicTopology.

### 3.11 π₁ of the plus construction

Under the connected CW/perfect-normal hypotheses, prove `plusConstruction.ker_pi1` and `pi1Equiv`, carrying the inclusion's basepoint and identifying its induced map with the quotient map.

(H AT §4.2, construction after Prop. 4.40, p. 374; W IV Exercise 1.4, p. IV.14.)

*Needs:* §3.10, AlgebraicTopology.

### 3.12 The plus construction is an integral homology isomorphism

Under the same hypotheses, prove `plusConstruction.homology_iso` in every degree, including zero, by tensoring the identity relative complex with constant coefficients.

(H AT §4.2, Prop. 4.40, p. 374.)

*Needs:* §3.10, AlgebraicTopology.

### 3.13 Local-coefficient acyclicity of plus

Prove `plusConstruction.localHomology_iso` for every local system on X⁺ by tensoring that relative group-ring complex. Deduce `isAcyclicMap`, naturally in coefficients.

(W IV Def. 1.1, p. IV.2; W IV Thm. 1.5(1) and paragraph before it, p. IV.5.)

*Needs:* §3.11, §3.7, AlgebraicTopology, UniversalCovers, §3.5.

### 3.14 Abelian spaces

Define `IsAbelianSpace`: connected with trivial π₁ action on every positive πₙ, including conjugation on π₁. Prove basepoint independence and the simple-space equivalence. Commutative π₁ alone is insufficient.

- `IsAbelianSpace`: Connected, with trivial π₁ action on every positive πₙ, including conjugation on π₁.
- `IsAbelianSpace.of_basepoint`: The condition is independent of basepoint.
- `IsAbelianSpace.of_simplyConnected`: Simply connected spaces are abelian.
- `IsAbelianSpace.of_hSpace`: Connected H-spaces are abelian.
- `IsAbelianSpace.commGroup_pi1`: An abelian space has commutative π₁.

**Checks.**

- `isAbelianSpace_point`: A point is abelian.
- `isAbelianSpace_circle`: S¹ is abelian (π₁ = ℤ abelian, higher π vanish).
- `not_isAbelianSpace_rp2`: RP² is not abelian: π₁ = ℤ/2 acts by −1 on π₂ ≅ ℤ.
- `isAbelianSpace_topologicalGroup`: A path-connected topological group, with Mathlib's IsTopologicalGroup.toHSpace, is abelian.

(H AT §4.1, p. 342.)

*Needs:* TC.

### 3.15 Connected H-spaces are abelian

Prove `hSpace_isAbelianSpace` for path-connected H-spaces at their unit, using the two unit homotopies. Homotopy associativity is not required.

(H AT §4.A, Example 4A.3, p. 422.)

*Needs:* §3.14, M, TC.

### 3.16 Eilenberg–Mac Lane spaces K(A, n) as CW complexes

For abelian A and n≥1, construct based CW K(A,n) with πₙ≅A and other positive π zero; let K(A,0) be discrete A. Define selected `map` representatives and a separate `mapClassesEquiv` on based homotopy classes.

- `EilenbergMacLaneSpace`: The CW model K(A,n), n≥1.
- `EilenbergMacLaneSpace.homotopyGroupEquiv`: πₙ≅A; other positive π-groups vanish.
- `EilenbergMacLaneSpace.homotopyEquivOfPi`: A CW space with these groups is homotopy equivalent to this model.
- `EilenbergMacLaneSpace.map`: A→+B induces K(A,n)→K(B,n); homotopy classes of such based maps correspond to homomorphisms.
- `EilenbergMacLaneSpace.isEilenbergMacLaneSpaceOne`: For n=1, identify the Tau Ceti K(A,1) predicate.

**Checks.**

- `eilenbergMacLaneSpace_trivial`: EilenbergMacLaneSpace 0 n is contractible.
- `eilenbergMacLaneSpace_Z_one`: EilenbergMacLaneSpace ℤ 1 is homotopy equivalent to the circle.
- `eilenbergMacLaneSpace_one_compat`: EilenbergMacLaneSpace A 1 is homotopy equivalent to Group.classifyingSpace A.
- `eilenbergMacLaneSpace_not_moore`: H₃(EilenbergMacLaneSpace (ℤ/2) 1; ℤ) ≅ H₃(RP^∞; ℤ) ≅ ℤ/2 ≠ 0, whereas the Moore space RP² = M(ℤ/2, 1) has H₃ = 0, so K(ℤ/2, 1) is not the Moore space.

(H AT §4.2 'Eilenberg–MacLane Spaces' and Prop. 4.30, pp. 365–366.)

*Needs:* AlgebraicTopology, §1.30.

### 3.17 Relative Hurewicz theorem with trivial π₁-action

Prove `relativeHurewicz_of_trivialAction` for a based (n−1)-connected NDR pair (X,A) of path-connected spaces, n≥2, with trivial π₁A action on πₙ(X,A). This group is abelian, Hᵢ(X,A;ℤ)=0 for i<n and the degree-n Hurewicz map is an isomorphism.

Construct `covering_relativeHomotopyEquiv` for a cover of based pairs (X′,A′)→(X,A), with A′ the full preimage and n≥2, by unique disk lifts and lifts of disk homotopies. A′ need not be connected. It commutes with the exact-sequence boundaries. (H AT, Prop. 4.1, p. 343, applied to disks and their homotopies.)

**Checks.**

- `relative_cover_identity`: the identity cover gives the identity.
- `relative_cover_disconnected_preimage`: the universal cover of (S¹,{*}) uses A′=ℤ and preserves relative π₂.
- `relative_cover_boundary`: the relative disk boundary lifts with its basepoint.

(H AT §4.2, Thm. 4.37 and Lemma 4.38 with proof, pp. 371–373.)

*Needs:* AlgebraicTopology, UniversalCovers, TC.

### 3.18 Recognition of principal Eilenberg–Mac Lane fibrations

For a connected CW pair with hofib(A→X)=K(π,n), π abelian and n≥1, prove `principalFibrationCriterion`: A is weakly equivalent over X to hofib(k:X→K(π,n+1)) iff π₁A acts trivially on πₙ₊₁(X,A).

(H AT §4.3, Lemma 4.70 with proof, p. 413.)

*Needs:* §3.17, §3.16, §2.3, §2.8, AlgebraicTopology.

### 3.19 The Postnikov tower converges

For a compatible Postnikov tower of connected CW X, prove `postnikovTower_limit_isWeakHomotopyEquivalence`: X→holim Xₙ is weak. Each πᵢ tower is eventually constant. `postnikovSectionExists` separately constructs one section; tower coherence is additional.

(H AT §4.3, Prop. 4.67 and Cor. 4.68 with proofs, pp. 410–411.)

*Needs:* §2.3, AlgebraicTopology.

### 3.20 Cohomology is represented by Eilenberg–Mac Lane spaces

Prove `cohomologyRepresentability`: based homotopy classes X→K(A,n) give H̃ⁿ(X;A), for based CW X,n≥1, naturally in X,A with the universal class specified. Unbased maps give ordinary Hⁿ; n=0 uses locally constant functions to discrete A.

(H AT §4.3, Thm. 4.57, p. 393.)

*Needs:* §3.16, AlgebraicTopology.

### 3.21 Postnikov towers of principal fibrations for abelian spaces

For abelian CW X, construct `postnikovTower` with principal K(πₙX,n) fibres, compatible X→Xₙ, bonding maps and k-invariants Xₙ₋₁→K(πₙX,n+1). State the homotopy truncation comparisons; abelianness supplies trivial action.

(H AT §4.3, Thm. 4.69, p. 412.)

*Needs:* §3.14, §3.16, §2.3, AlgebraicTopology, §3.18, §3.19.

### 3.22 Obstructions to extending maps through a principal fibration

For a principal K(A,n)-fibration classified by κ and a CW pair (W,V), an existing lift over V extends iff its obstruction in Hⁿ⁺¹(W,V;A) vanishes. Choices are governed by Hⁿ. Name `principalFibration_extensionObstruction`; retain pulled-back local coefficients in the twisted version. Construct `twistedExtensionObstruction` for a pulled-back K(A,n)-fibration with π₁ acting on A: the obstruction lies in Hⁿ⁺¹(W,V;A_ρ), vanishes exactly when the given lift extends, and the relative choices form an Hⁿ(W,V;A_ρ)-torsor. The principal, trivial-action case is its specialization. Apply this stagewise to the relative Postnikov tower of a CW target.

**Checks.**

- `twisted_obstruction_trivial`: trivial action recovers the principal obstruction.
- `twisted_obstruction_circle`: sign monodromy on ℤ gives T−1=−2, so replacing the local system by constant coefficients changes the obstruction complex.
- `twisted_obstruction_identity_pair`: W=V has zero relative obstructions and a unique relative extension class.

(H AT §4.3, Prop. 4.72 with proof, p. 417.)

*Needs:* §3.21, §3.20, AlgebraicTopology.

### 3.23 Extending maps into abelian spaces

For a connected abelian CW space X and a CW pair (W,V), prove `abelianExtension`: every map V→X extends to W if Hⁿ⁺¹(W,V;πₙX)=0 for all n≥1. These are the obstruction groups of the principal Postnikov tower. Thus an integral homology-equivalence inclusion satisfies this vanishing by universal coefficients; `abelianExtension_of_homologyIso` records that sufficient case in Lean. Use HEP to turn extension up to homotopy into an actual extension restricting to the original map.

**Checks.**

- `obstruction_shift`: The n=1 obstruction lies in H²(W,V;π₁X), not H¹.

(H AT §4.3, Cor. 4.73, p. 417.)

*Needs:* §3.22, §3.21, AlgebraicTopology, §3.19.

### 3.24 Homology Whitehead theorem for abelian spaces

Prove `abelianHomologyWhitehead`: an integral homology isomorphism between connected abelian CW spaces is a homotopy equivalence, by relative extension and uniqueness.

(H AT §4.3, Prop. 4.74 with proof, p. 418.)

*Needs:* §3.23, §3.14, AlgebraicTopology, §3.17.

### 3.25 Homology isomorphisms between H-spaces are homotopy equivalences

Deduce `hSpaceHomologyWhitehead`: any integral homology isomorphism between path-connected H-spaces of CW type is a homotopy equivalence. It need not be an H-map.

(W IV Exercise 1.3, p. IV.14.)

*Needs:* §3.15, §3.24.

### 3.26 Universal property of the plus construction

For connected CW plus f at P and g:X→Z killing P on π₁, prove `IsPlusConstruction.lift`: g factors through f uniquely up to homotopy for any connected CW-type Z. Use twisted relative obstructions; `lift_to_abelian` is the separate typed special case. Prove `plusExtensionObstructionVanish`: the relative cellular complex of the universal quotient cover of the plus pair is the free ℤ[π₁/P] complex with identity differential in degrees 3→2. Its Hom complex is acyclic for every quotient module. Thus all twisted extension obstructions and the relative homotopy obstructions vanish, giving existence and uniqueness. First replace spaces of CW type by CW models.

(W IV Thm. 1.5 and the paragraph before it, p. IV.5; H AT §4.3 Exercise 23, p. 420.)

*Needs:* §3.23, §3.14, §3.7, AlgebraicTopology.

### 3.27 Uniqueness of the plus construction up to homotopy under X

Prove `IsPlusConstruction.unique`: two connected CW plus constructions at P are homotopy equivalent under X, with the compatibility homotopy. `unique_of_abelian` is the separate stronger-target variant.

(W IV Thm. 1.5(3), p. IV.5.)

*Needs:* §3.26, §3.7, §3.9, AlgebraicTopology.

### 3.28 Functoriality of the plus construction up to homotopy

For φ preserving perfect normal P,P′, construct `IsPlusConstruction.map` with its homotopy-commuting square. Identity/composition hold in the homotopy category. A coherent `plusFunctorialModel` is separate from arbitrary attachment choices.

(W IV 1.1.2, p. IV.3.)

*Needs:* §3.26.

### 3.29 Recognising plus constructions into H-spaces

Prove `IsPlusConstruction.recognition_hSpace`: for connected CW plus X→Y with Y abelian and a homology isomorphism X→H to a connected CW-type H-space, the latter is acyclic and the lift Y→H is a homotopy equivalence under X.

(W IV Thm. 1.8 and Remark 1.8.1, p. IV.6.)

*Needs:* §3.26, §3.25, §3.12, §3.15, §3.24, §2.10.

### 3.30 π₂ of a plus construction and universal central extensions

For perfect normal P⊲G, prove `plusGroup_piTwo`: π₂(BG⁺ₚ)≅H₂(P;ℤ), retaining G/P action. In `plusGroup_fibreUCE`, π₁hofib(BG→BG⁺ₚ)→P is universal central with kernel H₂(P;ℤ). First construct the free-presentation central-extension foundation below.

- `plusConstruction.groupPi1Equiv`: For perfect normal P⊲G, π₁(BG)⁺ₚ≅G/P at the image vertex.
- `plusConstruction.groupPi1Equiv_incl`: The inclusion induces the quotient map under π₁BG≅G.
- `plusConstruction.pi2Equiv`: π₂(BG)⁺ₚ≅H₂(P;ℤ), with the coefficient universe lift.
- `plusConstruction.fiber_universalCentralExtension`: π₁hofib(BG→(BG)⁺ₚ)→P is the universal central extension, and its composite into G is induced by the fibre projection.

Build `UniversalCentralExtension` as a surjective homomorphism with central kernel and a unique lift to every central extension of its target. Prove existence for perfect P, the kernel–H₂ identification from Hopf’s formula, the superperfect-source recognition theorem, and naturality of lifts and kernels. **API:** `uce.lift`, `uce.lift_unique`, `uce.kernelH2`, `uce.source_superperfect`, `uce.map_kernelH2`. **Checks.**

- `uce_trivial`: the trivial group has the trivial extension.
- `uce_nonperfect`: a nonperfect cyclic group has no universal central extension.
- `uce_superperfect`: a central extension with superperfect source satisfies the universal property.
 (W III, Def. 5.3.1 and Thm. 5.4, pp. 37–38; H AT, §4.2, Hopf formula.)

(W IV Prop. 1.7 with proof and Cor. 1.7.1, p. IV.6.)

*Needs:* §3.13, §3.2, §2.8, §2.9, §3.30 (central extensions), §1.30.

### 3.31 Naturality of π₂(BG⁺) ≅ H₂(P; ℤ)

Prove `plusGroup_piTwo_naturality`: G→G′ preserving P,P′ induces exactly H₂(P;ℤ)→H₂(P′;ℤ) under the comparisons, with the selected basepoints and quotient actions.

(W IV Prop. 1.7 with proof and Cor. 1.7.1, p. IV.6.)

*Needs:* §3.30, §3.28, §2.10, §2.8, §3.30 (central extensions).

### 3.32 BP⁺ is the universal cover of BG⁺

For P⊆H⊆G and P perfect normal in G, identify the H/P-cover of BG⁺ₚ with BH⁺ₚ, respecting projection/deck action. Thus BP⁺ is its universal cover.

(W IV Exercise 1.8, pp. IV.14–15.)

*Needs:* §3.27, §1.29, §2.11, §4.14 (stable linear groups), TC.

### 3.33 The plus-construction fibration of a universal central extension

For the universal central extension A→E→P of perfect P, prove BA→BE⁺→BP⁺ is a homotopy-fibre sequence. BE⁺ is connected with π₁=π₂=0; the boundary identifies π₂BP⁺ with A.

(W IV Exercise 1.9, p. IV.15.)

*Needs:* §2.39, §3.34, §3.30, AlgebraicTopology, §3.18, §3.26, §3.7, §3.27, §3.16, §3.30 (central extensions).

### 3.34 Plus constructions of fibre sequences

For a connected CW fibre sequence F→E→B with simply connected B, plus f:E→E⁺ at perfect normal P and a chosen p⁺f≃p, prove `plusFibreSequence`: induced F→F′=hofib(p⁺) is an integral homology isomorphism. If F′ is simply connected it is plus at π₁F; if F′ is abelian and F⁺ at ker(π₁F→π₁F′) is abelian, identify F⁺≃F′ under F.

(W IV Exercise 1.9, p. IV.15.)

*Needs:* §3.26, §3.24, AlgebraicTopology, §2.11, §3.6, §3.7, §3.27, §2.10.

### 3.35 Serre classes in fibrations with trivial action

Define `SerreClass` by zero, subgroup, quotient, extension, tensor and Tor closure. Prove the bounded homology two-out-of-three fibration theorem for connected Serre fibrations with trivial action. Establish finite-generation, torsion and P-primary examples separately.

(H SS 1, Lemma 1.9 with proof, p. 15.)

*Needs:* AlgebraicTopology.

### 3.36 Homology of Eilenberg–Mac Lane spaces lies in the Serre class

For the classes of finitely generated abelian groups, finite P-primary groups and P-primary torsion groups, prove positive homology of K(A,n) belongs to the class when A does, n≥1. For the two finite-generation classes reduce K(A,1) to products of cyclic groups; for unrestricted P-torsion use its filtered union of finite subgroups, then iterate the path fibration. More general Serre classes need the K(A,1) closure theorem as an additional input. Finitely generated groups are not claimed closed under arbitrary filtered colimits.

(H SS 1, Lemma 1.10 with proof, pp. 15–16.)

*Needs:* §3.35, §3.16, §1.32, §1.17, AlgebraicTopology, M.

### 3.37 Serre class theory for abelian spaces

For C equal to finitely generated, finite P-primary or P-primary torsion abelian groups, prove `serreClass_abelianSpace`: for connected abelian CW X, all positive πₙ lie in C iff all positive Hₙ do. If πᵢ∈C for i<n, the degree-n Hurewicz map has kernel/cokernel in C.

(H SS 1 'Serre Classes', Theorems 1.7 and 1.8, p. 14; HK III Remark 2.3.20, pp. 48–49.)

*Needs:* §3.14, §3.21, §3.16, AlgebraicTopology, §3.35, §3.36.

### 3.38 Rational homotopy of H-spaces (Cartan–Serre)

For a path-connected H-space with finite-type rational homology, prove `rationalHurewicz_hSpace`: πₙ⊗ℚ injects into Hₙ(−;ℚ) with primitive image, n>0. Construct the rationalisation/Serre comparison. Add homotopy associativity for the Hopf-algebra formulation.

Construct `multiplicativeSerreSequence` for CW Serre fibrations with local coefficient cup products: dᵣ is a graded derivation and the abutment product respects the skeletal filtration. Compute rational K(A,n) cohomology for finite-dimensional rational A and n≥1: polynomial generators for even n, exterior for odd n. Name `rationalEMCohomology` and use these primitive generators in the rational H-space comparison. (H SS, §§1.2–1.4, pp. 22–45; H AT, Thm. 3C.4, p. 283.)

**Checks.**

- `rational_em_one`: K(ℚ,1) has an exterior degree-one generator.
- `rational_em_two`: K(ℚ,2) has a polynomial degree-two generator.
- `serre_product_point`: a point base recovers the fibre cup product; d(ab)=d(a)b+(−1)^|a|a d(b).

(H SS 1, Thm. 1.24 and the paragraph after its proof, pp. 38–39.)

*Needs:* §3.15, §3.14, §3.16, §3.37, AlgebraicTopology, AlgebraicTopology stage 8.

### Examples

Plus at the trivial subgroup is a weak equivalence. Plus of a perfect group’s classifying space is simply connected and retains its integral homology. Acyclicity with constant coefficients alone is insufficient for a nontrivial quotient π₁. The regular-cover calculation tests the local-coefficient condition.

### Dependencies

Layers 1–2 and ordinary (co)homology/obstruction theory; local central extensions precede plus comparisons.

## Layer 4: Homotopy group completion and deloopings

### 4.1 Symmetric tensor on the core

Construct `Core.monoidalCategory` and, for symmetric input, `Core.symmetricCategory` by inherited isomorphism coherence. The inclusion is strong monoidal. Strong monoidal functors induce core maps; symmetry requires braided functors. Iso-class carriers remain supplier objects.

- `Core.monoidalCategory`: Transport the full tensor coherence to Core S.
- `Core.symmetricCategory`: Transport the symmetry to Core S.
- `Core.inclusion_monoidal`: Core S→S is strict braided monoidal.
- `Core.mapMonoidal`: F.core is strong braided monoidal; inclusion and core-composition comparisons are monoidal.
- `Skeleton`: S carries the iso-class monoid, agreeing with π₀B(Core S) and Skeleton.monoidHom.

**Checks.**

- `core_finset_pi0`: For finite sets under disjoint union, the monoid of isomorphism classes of the core is ℕ.
- `core_of_groupoid`: If S is already a groupoid, Core S ≌ S as symmetric monoidal categories.
- `core_projective_symmetry_not_id`: In Core of finitely generated projective ℤ-modules, the symmetry on ℤ ⊕ ℤ is the swap, not the identity: the structure is not strict in the sense of Bhatt–Scholze Def. 12.1.
- `core_isoClasses_splitK0`: For additive A, Skeleton(Core A) is the multiplicative form of ObjectCode A; its Grothendieck group agrees with SplitK0 via the supplied equivalence.

(BS Appendix §12, p. 54; W IV Def. 4.1 and Examples 4.1.1, pp. IV.36–37.)

*Needs:* M.

### 4.2 The classifying-space H-structure

For small symmetric monoidal S, construct the associative/commutative H-space multiplication on BS with unit-object vertex, using k-products. The typed `classifyingSpace.hSpace` assumes countable objects/arrows for ordinary products. Name the HEP unit-strictification comparison.

- `classifyingSpace.hSpace`: The multiplication on BS comes from B(⊗) and the product comparison, with associative/commutative/unit homotopies.

(W IV §4 opening, p. IV.36.)

*Needs:* §4.1, §1.8, §1.10, §1.12, §1.9, AlgebraicTopology, M.

### 4.3 Quillen's S⁻¹S construction for a symmetric monoidal groupoid

Define `SInvS S` for a symmetric monoidal groupoid: (a,b)→(a′,b′) is represented by t and isomorphisms t⊗a≅a′,t⊗b≅b′, modulo isomorphism of t. Give tensor, inclusion (s,1), swap and braided strong-functor maps. Faithful translations are a separate hypothesis.

- `SInvS`: The pair category with simultaneous translation morphisms modulo isomorphism.
- `SInvS.incl`: The strong braided monoidal inclusion s↦(s,1).
- `SInvS.monoidal`: The componentwise tensor and its symmetry.
- `SInvS.map`: A strong braided monoidal F induces S⁻¹F, preserving id/composition up to coherent isomorphism.
- `SInvS.kSpace`: K(S)=B(S⁻¹S), Kₙ(S)=πₙK(S).
- `SInvS.pi0Equiv`: π₀K(S)≅GrothendieckGroup(Skeleton S), with (a,b)↦[a]−[b].
- `SInvS.swap`: Swapping coordinates induces the homotopy inverse.
- `FaithfulTranslations`: Injectivity of Aut(s)→Aut(s⊗t); holds for the listed free/projective, finite-set and Picard examples.

**Checks.**

- `SInvS_pic_K0`: For S = Pic(R) (R commutative), π₀ kSpace S ≅ Pic(R), π₁ ≅ Rˣ and π_n = 0 for n ≥ 2.
- `SInvS_trivial`: For the trivial symmetric monoidal groupoid (one object, one morphism), kSpace is contractible.
- `SInvS_pi0_compat`: For S = Core of an additive category A with ⊞, π₀ kSpace S ≅ SplitK0 A, compatibly with the classes of objects.
- `SInvS_no_natural_inverse`: For based free ℤ-modules there is no natural transformation id→id⊗swap implementing a strict H-space inverse.
- `SInvS_not_all_maps`: Using the category P(R) of all maps instead of iso P(R) gives a contractible classifying space (0 is initial), not K(R).
- `faithfulTranslations_basedFree`: F(R) has faithful translations: g ↦ g ⊕ 1 is injective on GL_n(R) (§4.15).

(W IV Def. 4.2, Explanation 4.2.1, Remark 4.2.2, Def. 4.3, pp. IV.37–38; C §1.2, Def. 7, p. 9.)

*Needs:* §4.1, §4.4.

### 4.4 Actions of monoidal categories and the categories ⟨S, X⟩ and S⁻¹X

For a coherent `MonoidalLeftAction`, define `MonoidalActionCategory S X` using translation arrows t⊙x→y modulo isomorphisms of t. The diagonal action gives S⁻¹X; supply stage inclusions, projection, restriction and the groupoid self-action contraction.

- `MonoidalCategory.MonoidalLeftAction`: Use the coherent MonoidalLeftAction with natural associators and unitors.
- `MonoidalActionCategory`: Objects x; translation morphisms represented by s⊙x→y.
- `MonoidalActionCategory.loc`: S⁻¹X=⟨S,S×X⟩ for the diagonal action.
- `MonoidalActionCategory.proj`: The projection (s,x)↦s into ⟨S,S⟩.
- `MonoidalActionCategory.incl`: Translations x↦(s,x), with the unit case as inclusion.
- `MonoidalActionCategory.contractible_self`: For a groupoid S, the unit is initial in ⟨S,S⟩, so its classifying space is contractible.
- `MonoidalAction.diag`: The diagonal action t⊙(s,x)=(t⊗s,t⊙x), with symmetry supplying its coherence.

**Checks.**

- `actionCategory_trivial_action`: For the trivial monoidal category acting on X, ⟨S, X⟩ ≌ X.
- `actionCategory_nat_telescope`: For S = ℕ acting on ⊔ X_n through a sequence of functors, ⟨S, X⟩ is the mapping telescope category (Weibel IV Exercise 4.2).
- `actionCategory_monoid_set`: For S and X discrete, ⟨S, X⟩ is isomorphic to Mathlib's ActionCategory (π₀ S) (Ob X) of induced monoid action.
- `actionCategory_not_X`: For S = ℕ acting on itself by addition, ⟨S, S⟩ is the poset ℕ (contractible), not the discrete category ℕ.

(W IV Definitions 4.7 and 4.7.1, p. IV.41.)

*Needs:* §4.1, §1.10, §1.12, M.

### 4.5 π₀ of S⁻¹S is the Grothendieck group of the monoid of components

Construct `SInvS.pi0Equiv` from π₀B(S⁻¹S) to the Grothendieck group of the commutative monoid of isomorphism classes. Specify (a,b)↦[a]−[b], written multiplicatively [a]/[b], and inclusion s↦(s,1). Prove the equations on vertices and on the inclusion, with addition induced by tensor and inverse by swapping. For based free modules, (rank 2,rank 1) has rank +1 and its swap has rank −1.

**Checks.**

- `rank_difference`: The component (2,1) in based free modules has rank +1 and (1,2) rank −1.

(W IV Lemma 4.3.1 with proof, p. IV.38.)

*Needs:* §4.3, §1.18, M, TC.

### 4.6 Group completions of homotopy-commutative H-spaces

Define `IsHomotopyAssocHSpace`, `IsHomotopyCommHSpace`, `pontryaginLocalization` and `IsGroupCompletion`: both H-spaces satisfy the two homotopy laws, f is an H-map, π₀f completes components and H_*(Y;k)≅π₀(X)⁻¹H_*(X;k) as unital graded rings for every commutative k.

- `IsGroupCompletion`: An H-map of homotopy-associative/commutative H-spaces, completing π₀ and localising homology over every commutative ring.
- `IsGroupCompletion.pi0Equiv`: π₀Y≅GrothendieckGroup(π₀X).
- `IsGroupCompletion.homologyLocalization`: The induced localisation map on Pontryagin homology is a ring isomorphism.
- `IsGroupCompletion.of_groupLike`: For grouplike X, id is a group completion.
- `IsGroupCompletion.basepointComponent`: For CW Y, its unit component is an abelian H-space.

**Checks.**

- `isGroupCompletion_id_groupLike`: For a homotopy-commutative group-like H-space G (for example an abelian topological group), the identity of G is a group completion.
- `isGroupCompletion_N_to_Z`: The inclusion ℕ → ℤ of discrete monoids is a group completion.
- `isGroupCompletion_pi0_compat`: For a group completion, π₀ f agrees with Algebra.GrothendieckGroup.of under the identification π₀(Y) ≃ Algebra.GrothendieckGroup π₀(X).
- `not_isGroupCompletion_pi0_only`: The map ⊔_n BΣ_n → ℤ (discrete) inducing the group completion on π₀ is not a group completion: it fails the homology condition (the correct target is ℤ × BΣ_∞⁺).

(W IV Def. 4.4, p. IV.38.)

*Needs:* §4.2, M.

### 4.7 The projection S⁻¹X → ⟨S, S⟩ is cofibred

For a coherent S-action with faithful translations, prove `MonoidalActionCategory.proj_isCofibred`: S⁻¹X→⟨S,S⟩ is cofibred, with specified fibres, cocartesian lifts and transition action. Equivalently its opposite is fibred.

(W IV Exercise 4.5, p. IV.46.)

*Needs:* §4.4, §2.35.

### 4.8 Invertible actions do not change the homotopy type

Under faithful translations, if every t⊙− gives a homotopy equivalence on BX, prove each actual `MonoidalActionCategory.incl_homotopyEquiv`: BX→B(S⁻¹X) is a homotopy equivalence, with the inverse tied to this map.

(W IV Exercise 4.6, p. IV.46.)

*Needs:* §4.7, §2.38, §4.4, AlgebraicTopology.

### 4.9 Quillen’s homological group completion

Prove `quillenGroupCompletion` for symmetric monoidal groupoids with faithful translations: BS→B(S⁻¹S) completes homotopy, including coherent H-space laws and all-degree homology localisation, using the action projection and Quillen's localisation argument.

(W IV Definitions 4.7, 4.7.1, (4.7.2) and Thm. 4.8 with proof, pp. IV.41–42.)

*Needs:* §4.3, §4.7, §2.33, §1.23, §1.27, §4.5, §4.6, §4.4, §1.12.

### 4.10 Group completions of group-like H-spaces

Prove `IsGroupCompletion.of_groupLike` for homotopy-associative/commutative X with component inverses. Any group completion of such X between CW-type spaces is a homotopy equivalence by translation and abelian homology Whitehead on unit components.

(W IV Lemma 4.4.1 with proof, p. IV.39.)

*Needs:* §4.6, §3.25.

### 4.11 Uniqueness of group completions up to phantom maps

For countable π₀X, two group completions with CW-type targets have equivalent targets; the comparison triangle is determined only up to phantom maps. A no-phantom corollary requires a separately stated finite-type filtration hypothesis.

(W IV Phantom maps paragraph and Thm. 4.4.3, p. IV.39.)

*Needs:* §4.6, §4.10.

### 4.12 The fibration S⁻¹S → S⁻¹X → ⟨S, X⟩

For symmetric monoidal groupoid S with faithful translations acting on X, assume every X-arrow monic and Aut_S(s)→Aut_X(s⊙x) injective for all s,x. Prove `SInvS.fibration`: S⁻¹S→S⁻¹X→⟨S,X⟩ is a homotopy-fibre sequence; contractible ⟨S,X⟩ gives an equivalence.

(W IV Exercise 4.7, p. IV.46.)

*Needs:* §4.4, §4.8, §2.38, §2.35.

### 4.13 A product of plus constructions is a plus construction

For connected CW-type plus maps at P,Q, prove their k-product is plus at P×Q. Identify product fibres and π₁ kernels, then use a CW-type replacement for uniqueness; an arbitrary ordinary product need not have the chosen CW structure.

(W IV Exercise 1.7, p. IV.14.)

*Needs:* §3.1, §3.3, §3.8, §2.2, AlgebraicTopology.

### 4.14 Stable linear groups and their plus H-space

Construct `stableGeneralLinearGroup R` by block-identity stabilisation and `stableElementaryGroup R`, for every unital ring including zero. Prove normality, perfectness and the stable Whitehead lemma using a third matrix index. Block sum gives BGL(R)⁺ its coherent H-space and ℤ×BGL(R)⁺ completes ⊔BGLₙ(R).

Construct `stableGeneralLinearGroup R` by block-identity stabilisation, its elementary subgroup E(R), and block-sum maps. Prove E(R) perfect and equal to the stable commutator subgroup, with naturality for ring homomorphisms. **API:** `stableGeneralLinearGroup.of`, `stableGeneralLinearGroup.of_stabilise`, `stableGeneralLinearGroup.blockSum`, `stableElementaryGroup.perfect`, `stableElementaryGroup.eq_commutator`. **Checks.**

- `stable_gl_rank_zero`: rank zero contributes the identity.
- `stable_gl_field`: over a field the stable determinant quotient is its unit group.
- `elementary_two_not_perfect`: E₂(𝔽₂) is not perfect, so stable perfectness does not apply at rank two.
 (W III, Lem. 1.3.2 and Whitehead Lem. 1.3.3, p. 4.)

(W IV Exercise 1.11, p. IV.15; Exercise 4.9, p. IV.46.)

*Needs:* §3.26, §3.29, §1.31, §4.6, §4.14 (stable linear groups), §4.13, §3.12, §1.17, §3.15, §3.28, M.

### 4.15 Based free modules and projective complements

Define `BasedFree R`: objects are rank labels n, automorphisms GLₙR, no arrows between labels; tensor is block sum with permutation symmetry. Row action gives Aut(n)≅GLₙRᵐᵒᵖ. Construct `toModuleCore`, its finite-projective lift and entrywise base change. Labels remain ℕ without IBN.

- `BasedFree`: The groupoid with objects ranks and matrices as isomorphisms; direct sum supplies the symmetric tensor.
- `BasedFree.autEquiv`: Aut(n)≅GLₙ(R)ᵐᵒᵖ; inversion compares its classifying space with BGLₙ(R).
- `BasedFree.toModuleCore`: The strong braided monoidal functor to the finite-projective core, represented in Lean by toModuleCore with a separate finite-projective-image target.
- `BasedFree.map`: Entrywise ring maps give strong braided functors, respecting base change and composition.
- `BasedFree.faithfulTranslations`: Block-identity translation is faithful.
- `BasedFree.cofinal`: For every finite projective P, find Q,n with P⊕Q≅Rⁿ.

**Checks.**

- `basedFree_isoClasses`: Skeleton (BasedFree R) ≃* Multiplicative ℕ for every ring R, including the zero ring.
- `basedFree_braiding_swap`: For R = ℤ the symmetry c_{1,1} is the matrix !![0, 1; 1, 0] ≠ 1.
- `basedFree_toProj_not_injective`: For R with R ≅ R² (e.g. End of a countably infinite-dimensional vector space) toProj.obj 1 ≅ toProj.obj 2 although 1 and 2 are not isomorphic in BasedFree R.
- `basedFree_aut_bijective`: For every n, toProj induces a bijection Aut n → Aut (toProj.obj n).

(W IV Example 4.1.1(c), p. IV.36.)

*Needs:* §4.1, §4.15 (projective complements), M.

### 4.16 B(S⁻¹S) ≃ ℤ × BGL(R)⁺ for based free modules

For unital R, prove `kSpace_basedFree_plus`: B(F(R)⁻¹F(R))≃ℤ×BGL(R)⁺, with the inclusion and difference-of-labels component map. Block matrices give faithful translations; plus identifies the unit component.

(W IV Thm. 4.9 with proof, pp. IV.42–43.)

*Needs:* §4.9, §3.29, §1.17, §4.14, §4.14 (stable linear groups), §4.5, §4.15, §4.4, §2.34.

### 4.17 The telescope map into the group completion is acyclic

For a well-pointed homotopy-commutative monoid and a cofinal product stabilisation, prove `telescope_isAcyclicMap`: the telescope maps acyclically to the Borel homotopy fibre, which is equivalent to ΩBM. Every component must divide a sufficiently long later product from every starting stage.

(HK III Section 3.2, (1)-symmetric case, p. 55; W IV Proof of Thm. 4.10, p. IV.44; Randal-Williams, Thm. 1.1 and Cor. 1.2, pp. 1–2.)

*Needs:* §4.9, §3.3, §3.7, §4.4, §2.34, §1.17.

### 4.18 Group completion with a cofinal sequence of objects

For a symmetric monoidal groupoid with faithful translations and cofinal sₙ₊₁=sₙ⊗aₙ, prove `kSpace_cofinal_plus`: B(S⁻¹S)≃K₀(S)×B Aut(s∞)⁺. Identify the stable automorphism telescope and its perfect commutator, then apply local-coefficient acyclicity componentwise. Prove `stableAutomorphism_commutatorPerfect` by representing each stable commutator at a finite stage, then using disjoint tensor blocks and the symmetry conjugations to rewrite it as a commutator of commutators after further stabilisation (Randal-Williams, Prop. 3.1, pp. 7–8).

(W IV Thm. 4.10 with proof, pp. IV.43–44; HK III Remark 2.3.20, pp. 48–49.)

*Needs:* §4.9, §3.8, §4.17, §4.5, §1.17, §2.34, §3.3, §3.15, §4.2.

### 4.19 Cofinality for actions: S⁻¹X ≃ T⁻¹X

For cofinal strong braided F:S→T between symmetric monoidal groupoids with faithful translations and a coherent T-action on X, prove `cofinality_action`: B(S⁻¹X)≃B(T⁻¹X). Cofinality means each t has a tensor complement to some F(s); action invertibility is equivalent after restriction.

(W IV Cofinality Thm. 4.11(a) with proof, p. IV.44.)

*Needs:* §4.8, §4.4, §1.10.

### 4.20 Quillen's cofinality theorem for symmetric monoidal groupoids

If additionally Aut(s)→Aut(Fs) is bijective, prove `cofinality`: B(S⁻¹S)→B(T⁻¹T) is bijective on every positive πₙ at every basepoint. Its π₀ need not be surjective.

(W IV Cofinality Thm. 4.11 with proof, pp. IV.44–45.)

*Needs:* §4.9, §3.25, §4.23, §1.34, §1.10.

### 4.21 Cofinality: the group completion of iso P(R) is K₀(R) × BGL(R)⁺

For the finite-projective core of unital R, prove `kSpace_projective_plus`: the space has components K₀(R) and unit component BGL(R)⁺. Construct free complements locally, and identify the based-free comparison on generators using direct sum.

(W IV Cor. 4.11.1, p. IV.45; Example 4.1.1(c), p. IV.36.)

*Needs:* §4.20, §4.16, §4.5, §4.15 (projective complements), §4.15.

### 4.22 Naturality of the comparison B(S⁻¹S) ≃ K₀ × BGL(R)⁺

Prove homotopy naturality of these comparisons under unital ring maps. Scalar extension preserves finite projectives/sums; on π₀ use induced K₀ map and on the unit component the entrywise stable GL plus map.

(W IV Functoriality 1.1.2, p. IV.3.)

*Needs:* §4.16, §4.14, §4.13, §4.21, §4.23, §4.15, §4.5, §3.28, §3.26, §3.15, §1.31.

### 4.23 Independence of the group completion from strictification

Prove `SInvS.map_homotopyEquiv` for a strong braided equivalence of strictifications, respecting inclusion and comparison composition. This identifies homotopy types, not categorical choices definitionally.

(W IV Exercise 4.4, p. IV.46.)

*Needs:* §4.3, §1.10, §4.9, M.

### 4.24 Special Γ-spaces (E∞-monoids in Segal's model)

Define covariant `GammaSpace:Fin_*→SSet`. `IsSpecial` means contractible X(0) and weak Segal maps X(n)→X(1)ⁿ; `IsVerySpecial` adds grouplike π₀X(1). Give induced commutative monoid, functorial maps and replacement invariance.

- `GammaSpace`: A functor Fin_*→SSet.
- `GammaSpace.IsSpecial`: X(0) is weakly contractible and the Segal maps are weak equivalences.
- `GammaSpace.pi0Monoid`: For special X, the Segal comparison and fold induce a commutative monoid on π₀|X(1)|.
- `GammaSpace.IsGrouplike`: Special X with grouplike component monoid.
- `GammaSpace.underlying`: |X(1)|, pointed by X(0).

**Checks.**

- `gammaSpace_const_point_special`: The constant Γ-space at a point is special and grouplike.
- `gammaSpace_discrete_abelian`: For an abelian group A, the discrete Γ-space [n] ↦ Aⁿ is special with π₀ = A.
- `gammaSpace_pi0_compat`: For the Γ-space of a commutative monoid M ([n] ↦ Mⁿ, discrete), pi0Monoid is M with its own addition.
- `gammaSpace_not_special_two_points`: The constant Γ-space at a two-point discrete simplicial set is not special: X([0]) is not contractible and the Segal map X([2]) → X([1])² is not a bijection on π₀.

(BS Appendix §12, Def. 12.4, p. 56; C §1.2, Def. 1, p. 6.)

*Needs:* §2.1, M.

### 4.25 Segal’s summing-functor construction

For small C with zero object and finite sums, define `summingFunctors` as coherent subset-sum diagrams and natural isomorphisms; their nerves form `segalGammaSpace C`. Construct the full `segalSpectrum` delooping/zero-space comparison separately from its underlying sequence `segalSpaces`.

- `summingFunctors`: Summing diagrams and natural isomorphisms form a groupoid.
- `segalGammaSpace`: A_C(n)=nerve(summingFunctors(C,n)).
- `segalGammaSpace.isSpecial`: A_C is special.
- `segalGammaSpace.map`: Zero/sum-preserving functors give functorial Γ-space maps.
- `segalSpaces`: The Γ-machine connective Ω-spectrum has zeroth space Ω|BA_C(1)|; segalSpaces is its underlying sequence, with a separate structure/comparison target.
- `segalIsoClasses`: Iso-classes under sums form a commutative monoid.
- `segalIsoClasses.mk_zero`: The zero class is the unit.
- `segalIsoClasses.mk_coprod`: [X⊔Y]=[X][Y].
- `segalGammaSpace.pi0IsoClasses`: π₀A_C(1)≅segalIsoClasses C before completion.
- `segalSpaces.pi0`: The completed zeroth-space components form a commutative group.
- `segalSpaces.toPi0`: The group-completion component homomorphism.
- `segalSpaces.pi0GrothendieckEquiv`: Completed components≅GrothendieckGroup(segalIsoClasses C).
- `segalSpaces.pi0GrothendieckEquiv_toPi0`: The equivalence sends the image of x to GrothendieckGroup.of(x).

**Checks.**

- `segalGammaSpace_finset_sphere`: Finite pointed sets under wedge produce S by Barratt–Priddy–Quillen–Segal (C, Ex. 4). Unpointed finite sets have no zero object.
- `segalGammaSpace_zero_category`: For C the category with one object (a zero object), segalGammaSpace C is the constant point.
- `segalGammaSpace_pi0_K0`: For finite projectives, π₀ of the completed space Ω|BA_C(1)| is split K₀(R). Using π₀A_C(1) instead leaves the direct-sum monoid.
- `segalGammaSpace_not_without_sums`: iso P(R) has no categorical sums (⊕ is not a coproduct in the groupoid), so Sum_C does not apply to it directly.
- `segalGammaSpace_rank_group_completion`: Finite-dimensional vector spaces have direct-sum monoid ℕ and completed component group ℤ; rank n maps to +n and negative ranks detect failure to complete.

(C §1.2, Def. 1, Prop. 2 with proof, Thm. 3, Examples 4–5, pp. 6–8; BS Appendix §12, Prop. 12.10, Cor. 12.12 and Def. 12.13, p. 58.)

*Needs:* §4.24, §1.11, §4.27, §4.28, M.

### 4.26 The Segal E∞-monoid N(C) of a symmetric monoidal groupoid

For symmetric monoidal groupoid C, define `coherentSubsetGammaSpace` by coherent subset tensor diagrams, including empty-subset unit laws. It is special with N(C)(1)≃nerve C; strong braided functors give its Γ-maps. Establish `symmetricTensorCoherence`: two composites of associators, unitors and symmetries between parenthesised finite tensor lists agree when they induce the same permutation, with naturality. This supplies the subset-diagram equations; it concerns the symmetric structure beyond Mathlib’s monoidal coherence.

- `coherentSubsetGammaSpace`: The coherent-subset Γ-model N(C).
- `coherentSubsetGammaSpace.isSpecial`: N(C) is special.
- `coherentSubsetGammaSpace.pi0Equiv`: π₀N(C)(1)≅Skeleton C as monoids.
- `coherentSubsetGammaSpace.map`: Strong braided monoidal functors give Γ-maps with coherent composition comparisons.
- `coherentSubsetGammaSpace.level_one`: Forget unit data to compare N(C)(1) with nerve C weakly.

**Checks.**

- `coherentSubset_level_zero`: Unit coherence makes N(C)(0) contractible. If it is omitted, the discrete monoid {1,e}, e²=e, gives two idempotent empty-subset choices and two components.
- `coherentSubset_vect_pi0`: For C = Vect(ℤ) under ⊕, π₀ N(C) = ℕ (ranks).
- `coherentSubset_pic_grouplike`: For C = Pic(R), N(C) is grouplike with π₀ = Pic(R).
- `coherentSubset_naive_not_functor`: The naive assignment S ↦ N(C)^{S∖{s}} with f ↦ (⊗_{t ∈ f⁻¹(t′)} X_t) is not strictly functorial (Bhatt–Scholze Remark 12.6).

**Checks.**

- `symmetric_coherence_three`: the two braid composites on three factors agree.
- `symmetric_coherence_inverse`: a swap followed by its reverse is identity.
- `symmetric_coherence_unit`: inserting then deleting the tensor unit is identity.

(BS Appendix §12, Construction 12.5 and Remark 12.6, pp. 56–57.)

*Needs:* §4.24, §4.1, §1.34, §1.33.

### 4.27 Segal's delooping theorem for special Γ-spaces

Prove `GammaSpace.delooping`: for special X the machine's adjoint maps are weak for levels n≥1, and at zero iff X is very special. The spectrum is connective; give the initial group-completion comparison.

(BS Appendix §12, Prop. 12.10 and Remark 12.11, p. 58.)

*Needs:* §4.24, §2.20, §2.27.

### 4.28 Segal's group-completion theorem for special Γ-spaces

Prove `GammaSpace.groupCompletion`: special X gives X(1)→Ω|X(S¹)| a homotopy group completion, including localisation and H-space laws. The π₀ Grothendieck comparison carries each generator to its canonical image.

(W IV Segal's ΩB Method 4.5.1, p. IV.39; W IV Machine Methods 4.5.2, p. IV.40.)

*Needs:* §4.24, §4.27, §4.6.

### 4.29 Group completion as a left adjoint

Prove `groupCompletionAdjunction` between the localised homotopy theories of E∞ monoids and grouplike E∞ monoids, with unit/counit laws. Its universal property concerns maps into grouplike targets.

(BS Appendix §12, Cor. 12.12, p. 58.)

*Needs:* §4.27, §4.26, §4.9, §4.11, §4.28.

### 4.30 Picard groupoids are exactly the grouplike N(C)

Prove `coherentSubsetGammaSpace.isVerySpecial_iff_picard`: every object is tensor-invertible iff π₀C is a group. A Picard groupoid gives π₀=iso-classes and π₁=Aut(1), retaining symmetry and self-braiding.

(BS Appendix §12, Prop. 12.15 and the paragraph after it, pp. 58–59.)

*Needs:* §4.26, §4.27, §1.34.

### 4.31 Classical Grothendieck–Witt plus spaces

Construct `classicalGrothendieckWittComparison` for symmetric unimodular ℤ-forms under orthogonal sum, identifying the completed groupoid space with stable orthogonal plus components. Consume the form/isometry suppliers; retain odd/even and 2-primary distinctions and this classical convention.

(HK III Section 3.2, pp. 54–55, cases (1)-symmetric through (−1)-quadratic.)

*Needs:* §4.18, §4.5.

### 4.32 Topological variants of functors on rings via simplicial rings

For simplicial-compatible F on unital rings and topological A, construct the realisation of F(C(Δⁿ,A)), its constant-function unit and functoriality; compare discrete A. Separately prove `topologicalKComparison` for ℝ,ℂ with continuous GL topology/stabilisation and connective KO/KU.

- `topologicalVariant`: Realise n↦F(C(Δⁿ,A)), when F is simplicial-compatible with the variance.
- `topologicalVariant.unit`: The map induced by constant functions.
- `topologicalVariant.map`: Natural in F and continuous ring maps.
- `simplicialRingOfContinuous`: n↦C(Δⁿ,A), with pointwise ring operations.

**Checks.**

- `topologicalVariant_const`: For a constant functor F, topologicalVariant F A ≃ F A.
- `topologicalVariant_discrete_ring`: For A with the discrete topology, C(Δⁿ, A) = A and topologicalVariant F A ≃ F A.
- `topologicalVariant_pi0_K`: π₀ K^top(ℝ) = K₀(ℝ) = ℤ.
- `topologicalVariant_not_discrete_K1`: π₁ K^top(ℝ) = ℤ/2 differs from K₁(ℝ) = ℝ^×: the topological variant is not the algebraic K-theory.

Construct the topological Bott equivalences `bottComplex` (Ω²(ℤ×BU)≃ℤ×BU) and `bottReal` (Ω⁸(ℤ×BO)≃ℤ×BO), then their connective covers KU and KO. The matrix inclusion uses the identity block; these are topological, not Clifford-algebra periodicity targets. (W IV, §§2.1–2.2, pp. 13–17.)

**Checks.**

- `bott_complex_coefficients`: π₂KU=ℤ and π₁KU=0.
- `bott_real_coefficients`: π₁KO=ℤ/2 and π₄KO=ℤ.
- `bott_connective`: connective KU,KO have no negative homotopy; their periodic extensions do.

(HK III Section 3.2, proof of Lemma 3.2.11, p. 59.)

*Needs:* §2.20, M.

### Examples

The category of all finite projective-module maps has a zero object and a contractible classifying space; its core has a different nerve. For free modules, the component monoid is ℕ and its group completion is ℤ. For a finite-dimensional-vector-space core, the zero component is the stable general-linear-group plus construction. Cofinality uses an actual complement.

### Dependencies

Layers 1–3, algebraic Grothendieck groups and the local stable linear-group/projective-complement foundations.

## Layer 5: Concrete symmetric spectra

### 5.1 Pointed simplicial sets, smash product and simplicial spheres

Use `SSet.Pointed=Under Δ[0]`. Define smash by collapsing the wedge, S⁰ as its unit, S¹=Δ[1]/∂Δ[1] and Sⁿ=(S¹)∧n. Construct closed symmetric tensor coherence, permutation actions, block-sum isomorphisms and compactly generated realisation comparisons. Strict loops model topological loops for Kan K; replace otherwise.

- `SSet.Pointed`: Under(Δ[0]) in SSet, with wedge as coproduct.
- `SSet.Pointed.smash`: K∧L=(K×L)/(K∨L).
- `SSet.Pointed.smashMonoidal`: The full symmetric monoidal structure, with unit S⁰.
- `SSet.Pointed.circle`: Δ[1]/∂Δ[1], based at the collapsed boundary.
- `SSet.Pointed.sphere`: Sⁿ=(S¹)∧n, with permutation action and S⁰ as unit.
- `SSet.Pointed.loop`: map_*(S¹,K), right adjoint to S¹∧−.
- `SSet.Pointed.toTop_smash`: Realisation respects smash in compactly generated spaces.
- `SSet.Pointed.sphereAddIso`: Sᵐ⁺ⁿ≅Sᵐ∧Sⁿ, compatible with block permutation actions and tensor coherence.

**Checks.**

- `sphere_zero`: sphere 0 = S⁰ = Δ[0]₊ and smash S⁰ K ≅ K.
- `circle_cells`: circle has exactly one nondegenerate 0-simplex and one nondegenerate 1-simplex, and its realisation is homeomorphic to the circle.
- `sphere_toTop`: The realisation of Sⁿ is a topological sphere. S¹∧S¹ has one nondegenerate vertex, one edge and two 2-simplices, so its cells are not the minimal sphere CW structure.
- `smash_not_product`: smash circle circle is not circle ⊗ circle: the latter realises to the torus, the former to S².

(S I, Def. 3.1, p. 34; HSS Section 1.1 and Def. 1.2.2.)

*Needs:* §1.8, §1.3, §1.9, M.

### 5.2 Symmetric spectra of simplicial sets

Define symmetric spectra by pointed Xₙ, Σₙ actions and σₙ:Xₙ∧S¹→Xₙ₊₁. Iterates are determined by σ: zero is the unitor, one is σ, successor uses the associator and σ. Require block Σₙ×Σₘ equivariance. Construct morphisms, levelwise limits/colimits, sequential forgetful functor and compactly generated realisation comparisons.

- `SymmSpectrum`: Levels Xₙ, Σₙ actions and iterated-equivariant structure maps.
- `Hom`: Equivariant level maps commuting with σ; limits/colimits are levelwise.
- `toSequential`: Forget actions to obtain the sequential spectrum.
- `level`: Evaluate at n, retaining the Σₙ action.
- `sphere`: Sₙ=Sⁿ with the canonical actions and σ.
- `realization`: Levelwise compactly generated realisation respects colimits and smash; finite-limit comparisons use §2.21, without an infinite-product/internal-Hom assertion.

**Checks.**

- `symmSpectrum_zero`: The trivial spectrum (a point in each level) is a zero object of the category of symmetric spectra.
- `symmSpectrum_sphere_level`: sphere.level 2 = S² with Σ₂ acting by swapping the two circle factors (a map of degree −1 on |S²|).
- `symmSpectrum_colimit_levelwise`: Colimits of symmetric spectra are computed levelwise: (colim X^i)_n = colim (X^i)_n.
- `symmSpectrum_not_sequential`: Take X₀=S⁰, X₁=S¹, X₂=Δ[2]/∂Δ[2], higher levels *, with σ₀=id and σ₁ selecting one of the two top simplices of S¹∧S¹. X₂ has only the identity pointed automorphism, whereas the twist exchanges those simplices; the iterated map is not invariant, so no symmetric structure exists.

(S I, Def. 3.1, p. 34; HSS Def. 1.2.2.)

*Needs:* §5.1.

### 5.3 Naive stable π-groups indexed by the integers

Define π̂ₖX=colimₙπₖ₊ₙ|Xₙ| over k+n≥2, by suspension and σ. Construct stabilisation from all levels k+n≥0, including π₀ as a set. Give functoriality, level-equivalence invariance and suspension/loop comparisons, using Kan levels for strict loops.

- `naivePi`: π̂ₖX=colimₙπₖ₊ₙ|Xₙ|.
- `naivePi.map`: Functorial additive maps on π̂ₖ.
- `naivePi_loop`: For Kan levels, π̂ₖΩX≅π̂ₖ₊₁X.
- `naivePi_susp`: π̂ₖX≅π̂ₖ₊₁(S¹∧X).
- `IsNaivePiIso`: All π̂ₖ maps are bijective.
- `naivePi_of_level`: πₖ₊ₙ|Xₙ|→π̂ₖX for k+n≥0.

**Checks.**

- `naivePi_sphere_zero`: naivePi sphere 0 ≅ ℤ, generated by the identity of S⁰.
- `naivePi_trivial`: naivePi of the trivial spectrum is 0 in every degree.
- `naivePi_sphere_negative`: naivePi sphere k = 0 for k < 0.
- `naivePi_not_true_pi`: For F₁S¹, π̂₀ is a countable direct sum of ℤ, while true π₀=ℤ (S I.3.20, p. 43; p. 108).
- `naivePi_omegaSpectrum_compat`: For an Ω-spectrum X, naivePi X k ≅ π_k |X_0| for k ≥ 0 and ≅ π₀ |X_{−k}| for k < 0.

(S I, Def. 2.1 and §2.1, pp. 23–24; S I, Prop. 3.8, p. 37.)

*Needs:* §5.2, TC.

### 5.4 Ω-spectra and connective spectra

Define `IsOmegaSpectrum` by weak realised adjoint maps |Xₙ|→Ω|Xₙ₊₁|. Its Kan-level version uses simplicial loops. Prove any level with k+n≥0 computes π̂ₖ. Naive connectivity implies true connectivity. Positive Ω-spectra only impose n≥1 and need a separate zero-space comparison.

- `IsOmegaSpectrum`: Every realised adjoint structure map |Xₙ|→Ω|Xₙ₊₁| is weak.
- `IsNaivelyConnective`: All negative π̂ vanish; this implies true connectivity.
- `IsOmegaSpectrum.naivePi_eq`: For Ω-spectra, each level map to π̂ is bijective when k+n≥0.

**Checks.**

- `isOmegaSpectrum_trivial`: The trivial spectrum is an Ω-spectrum.
- `isOmegaSpectrum_HA`: HA is an Ω-spectrum with naivePi (HA) 0 ≅ A.
- `not_isOmegaSpectrum_sphere`: The sphere spectrum is not an Ω-spectrum: S¹ → ΩS² is not a weak equivalence, since π₂(ΩS²) = π₃(S²) = ℤ while π₂(S¹) = 0.
- `isConnective_sphere`: The sphere spectrum is naively connective.

(S I, Def. 1.15, p. 17; C §1.1, p. 4 (chapter PDF 2); W IV Spectra 2.3.1, p. IV.19; remark after Def. 2.4, p. IV.20; Infinite Loop Structure 8.5.5, p. IV.69.)

*Needs:* §5.2, §5.3, §2.1.

### 5.5 Suspension spectra, free spectra and the sphere spectrum

Construct Σ∞K with levels K∧Sⁿ and Σ∞⊣evaluation₀. Construct Fₘ⊣evaluationₘ: zero below m, level m+n equal to Σₘ₊ₙ,₊∧_(1×Σₙ)(K∧Sⁿ), with the subgroup fixing the first m letters. Identify S=Σ∞S⁰ and suspension-spectrum stable groups; adjoin a basepoint for Σ∞₊.

- `suspensionSpectrum`: (Σ∞K)ₙ=K∧Sⁿ.
- `suspensionAdj`: Σ∞ is left adjoint to evaluation at zero.
- `free`: Fₘ is left adjoint to evaluation at m after forgetting its action.
- `sphereSpectrum_eq`: S≅Σ∞S⁰.
- `naivePi_suspension`: π̂ₖΣ∞K=colimₙπₖ₊ₙ|K∧Sⁿ|.

**Checks.**

- `suspensionSpectrum_point`: suspensionSpectrum of the one-point pointed simplicial set is the trivial spectrum.
- `suspensionSpectrum_naivePi_zero_S0`: naivePi (suspensionSpectrum S⁰) 0 ≅ ℤ.
- `suspensionSpectrum_connective`: suspensionSpectrum K is connective for every K.
- `free_one_not_piIso`: The map free 1 S¹ → sphere adjoint to the identity is a stable equivalence but not a π̂_*-isomorphism.

(S I, Example 1.13, p. 15; S I, Example 1.8, p. 12.)

*Needs:* §5.2, §5.1.

### 5.6 Loop, suspension and shift of spectra

Define suspension, strict loops and their adjunction, and (sh X)ₙ=X₁₊ₙ with the first-letter-fixing subgroup action. Define λ:S¹∧X→sh X by twist, σ and χₙ,₁, verifying the spectrum-map permutation identity. Homotopy calculations of strict loops use Kan levels.

- `loop`: Levelwise pointed S¹-mapping object; use Kan replacement for derived loops.
- `susp`: Levelwise S¹∧X.
- `suspLoopAdj`: susp⊣loop.
- `shift`: (sh X)ₙ=X₁₊ₙ with restricted actions.
- `lambda`: The σ-derived map λ:S¹∧X→sh X.

**Checks.**

- `loop_trivial`: loop of the trivial spectrum is trivial.
- `naivePi_shift`: For semistable X, π̂ₖ₊₁(sh X)≅π̂ₖX; F₁S¹ fails the unrestricted comparison.
- `loop_susp_sphere`: susp sphere ≅ shift sphere ≅ suspensionSpectrum S¹ (Schwede I Example 3.9) and naivePi (susp sphere) 1 ≅ ℤ.
- `shift_not_susp`: λ_{F₁S¹} : S¹ ∧ F₁S¹ → sh(F₁S¹) is not a π̂_*-isomorphism (it is the inclusion of a wedge summand with non-zero complement, Schwede I Example 8.30), so F₁S¹ is not semistable.

(S I, §2.1 and Prop. 2.6, pp. 23–24; S I, Example 3.9, p. 37.)

*Needs:* §5.2, §5.3, §5.1.

### 5.7 The naive homotopy long exact sequence of a mapping cone

For every spectrum map f, prove the naive cone LES in all integer degrees. Its boundary is C(f)→S¹∧X followed by inverse suspension. Use sequential cones after forgetting actions, without semistability.

(S I, (2.11), Prop. 2.12 and proof, pp. 26–28.)

*Needs:* §5.3, §5.6, §5.16.

### 5.8 The naive homotopy long exact sequence of a homotopy fibre

Construct path fibres after functorial Kan replacement and their natural naive LES π̂ₖF→π̂ₖX→π̂ₖY→π̂ₖ₋₁F. Boundary comes from ΩY→F and inverse loop shift; strict signatures require Kan source/target levels.

(S I, (2.15), Prop. 2.17 and proof, pp. 29–30.)

*Needs:* §5.3, §5.6, §5.16, §2.8, M.

### 5.9 Semistable symmetric spectra

Define semistability by λ a π̂-isomorphism. Prove invariance under π̂-isomorphisms and closure under wedges, finite products, suspension, shift and cones. Ω- and suspension spectra qualify; F₁S¹ is the counterexample to unrestricted semistability.

- `IsSemistable`: λ_X is a π̂-isomorphism.
- `IsSemistable.of_omega`: Ω-spectra are semistable.
- `IsSemistable.of_suspension`: Suspension spectra are semistable.
- `IsSemistable.of_naivePiIso`: A π̂-isomorphism f:X→Y gives semistability(X)↔semistability(Y).

**Checks.**

- `isSemistable_sphere`: The sphere spectrum is semistable.
- `isSemistable_trivial`: The trivial spectrum is semistable.
- `not_isSemistable_free_one`: free 1 S¹ is not semistable.

(S I, Def. 3.14, p. 38; S I, Propositions 3.15–3.16, pp. 38–39.)

*Needs:* §5.6, §5.3, §5.4, §5.5, §5.7.

### 5.10 Stable equivalences of symmetric spectra

Define injective spectra by lifting against mono level equivalences. Define stable f:X→Y by bijective [Y,E]→[X,E] for all injective Ω E, using the pointed simplicial cylinder quotient. Give two-out-of-three and inclusion of level equivalences; a π̂-isomorphism is sufficient rather than definitional.

- `stableEquivalences`: Maps detected as equivalences by homotopy classes into injective Ω-spectra.
- `stableEquivalences.twoOutOfThree`: Two-out-of-three; includes level equivalences.
- `IsInjective`: Extension against every mono that is a level equivalence.
- `homotopyClasses`: Maps modulo simplicial homotopy, with contravariant precomposition.

**Checks.**

- `stableEquivalence_id`: The identity is a stable equivalence.
- `stableEquivalence_free_one_sphere`: free 1 S¹ → sphere is a stable equivalence.
- `stableEquivalence_levelwise`: A levelwise weak homotopy equivalence of symmetric spectra is a stable equivalence.
- `not_stableEquivalence_zero_sphere`: The map from the trivial spectrum to the sphere spectrum is not a stable equivalence: π₀ differs.
- `fibre_cone_boundary_sign`: For a Kan-level fibre, cone boundary after suspended fibre boundary is minus the target inclusion.

(HSS Def. 3.1.3; S I, Thm. 6.2, p. 107; S I, Def. 4.11, p. 65.)

*Needs:* §5.2, §5.4, §2.1.

### 5.11 π̂_*-isomorphisms are stable equivalences

Prove every π̂-isomorphism stable by injective Ω replacements and homotopy lifting. Restrict the converse to semistable objects.

(S I, Thm. 4.23, p. 69; HSS Thm. 3.1.11, p. 24.)

*Needs:* §5.10, §5.3, §5.6, §5.4, §5.16, §5.7.

### 5.12 True π-groups of symmetric spectra

Construct functorial stable fibrant Q and X→QX, with Kan Ω targets. Define πₖX=π̂ₖQX, prove choice independence/functoriality and construct π̂→π. This is bijective for semistable X; stable maps are exactly π-isomorphisms. Define true connectivity by negative vanishing.

- `pi`: πₖX=π̂ₖ of a stable fibrant replacement.
- `naivePiToPi`: The replacement-induced map π̂ₖX→πₖX.
- `naivePiToPi_iso_of_semistable`: It is bijective for semistable X.
- `stableEquivalence_iff_truePi`: Stable equivalence↔bijective πₖ maps for all k.
- `stableEquivalence_iff_naivePi_of_semistable`: For semistable X,Y, stable equivalence↔π̂-isomorphism.
- `IsConnective`: All negative true π vanish; naive connectivity implies this condition.

**Checks.**

- `pi_sphere_zero`: pi sphere 0 ≅ ℤ.
- `pi_trivial`: pi of the trivial spectrum vanishes.
- `pi_free_one`: pi (free 1 S¹) k ≅ pi sphere k for all k.
- `pi_ne_naivePi_free_one`: naivePiToPi (free 1 S¹) 0 is not injective.

(S I, Def. 6.1, Thm. 6.2 and Prop. 6.3, pp. 106–107.)

*Needs:* §5.3, §5.10, §5.14, §5.9, §5.11.

### 5.13 The smash pairing of true π-groups

Construct the biadditive point-set pairing πₖX×πₗY→πₖ₊ₗ(X∧Y). Verify units, associativity, twist (−1)ᵏˡ and the two suspension compatibilities, with sign (−1)ᵏ in the second variable. Compare it with derived smash through ∧ᴸ→∧.

(S I, Thm. 6.16, p. 116.)

*Needs:* §5.12, §5.22, §5.6.

### 5.14 The stable model structure on symmetric spectra

Construct Kan–Quillen from horns, boundaries, anodyne maps, lifting and smallness, then the level/projective stable spectrum models. Stable fibrants have Kan Ω levels. Give positive/flat variants with the same weak equivalences and functorial factorisations/replacements; consume the abstract model-category machinery.

**Checks.**

- `kan_quillen_point`: The point is Kan; the inner horn inclusion Λ¹[2]→Δ[2] is anodyne; ∂Δ[1]→Δ[1] is a cofibration but is not a weak equivalence.

(HSS Thm. 3.4.4; S III, Thm. 4.11, p. 366.)

*Needs:* §5.10, §5.4, M.

### 5.15 The stable homotopy category

Localise at stable equivalences to define SHC and γ; γf is invertible iff f stable. Construct its additive structure and integer shifts tied to suspension. The additive natural comparison [Sᵏ,γX]≅πₖX defines SHC homotopy. Compare [Σ∞K,X] with pointed maps into an injective Kan Ω replacement's zero level, retaining universe enlargement.

- `SHC`: Localise symmetric spectra at stable equivalences.
- `γ`: The localisation functor γ.
- `isIso_γ_iff`: γ(f) invertible↔f stable.
- `preadditive`: The preadditive/additive structure.
- `shiftFunctor`: Integer shifts with [1]=Σ.
- `homSphereEquiv`: Additive comparison SHC(Sᵏ,γX)≅πₖX.
- `injectiveOmegaReplacement`: Functorial stable equivalence X→ωX, with ωX injective and Ω.
- `homSuspensionSpectrumEquiv`: For Kan Ω-spectrum X, [K,X₀]_*≅SHC(γΣ∞K,γX).

**Checks.**

- `SHC_zero_object`: The trivial spectrum is a zero object of
- `SHC_hom_sphere_HA`: (γ S ⟶ γ (HA)) ≃ A.
- `SHC_localization_compat`: SHC is equivalent to (stableEquivalences).Localization (Mathlib) compatibly with γ.
- `SHC_not_levelwise`: The localisation at levelwise weak equivalences only is not SHC: F₁S¹ → S is not inverted there.

(S II, Def. 1.1, p. 217; S II, Thm. 1.6, p. 218; S II, Examples 1.15 and 1.17, p. 225; HSS Cor. 5.1.3, p. 47.)

*Needs:* §5.10, §5.14, §5.19, §5.12, §5.6, M.

### 5.16 Mapping cones and homotopy fibres of spectra

Construct C(f) with the interval pointed at zero, attaching X to Y at one, and projection C(f)→S¹∧X. Construct derived path fibres with ΩY→F→X. Both are square-functorial; C(id) is contractible and C(X→0)=ΣX, fixing boundary endpoints.

- `mappingCone`: The cone with Y→C(f)→S¹∧X.
- `homotopyFiber`: The path fibre with ΩY→F(f)→X; replace non-Kan levels first.
- `mappingCone.map`: Strict squares give functorial cone and fibre maps.

**Checks.**

- `mappingCone_id_trivial`: mappingCone (𝟙 X) is stably contractible.
- `mappingCone_toZero`: mappingCone (X ⟶ 0) ≅ susp X.
- `homotopyFiber_fromZero`: homotopyFiber (0 ⟶ Y) ≅ loop Y.
- `mappingCone_not_quotient`: For a non-injective map, the strict cofibre (quotient) differs from the mapping cone: for X ⟶ 0 the quotient is 0 but the mapping cone is susp X.

(S II, Examples 2.4 and 2.6, pp. 229–230; S I, (2.10) and (2.14), pp. 27–29.)

*Needs:* §5.2, §5.6, §2.2.

### 5.17 Stable fibre and cofibre exact sequences

Construct natural true cone and derived-fibre LES in all integer degrees via replacements and naive comparisons. A square of stable equivalences induces stable cone/fibre comparisons. Register the general derived-fibre target separately from strict Kan-level signatures.

(S I, Prop. 2.12, p. 27; S I, Prop. 6.11, p. 112.)

*Needs:* §5.16, §5.3, §5.12, §2.8, §5.9, §5.7, §5.8.

### 5.18 Fibre and cofibre sequences agree up to a shift

For Kan-level X,Y, prove h:S¹∧F(f)→C(f) a π̂-isomorphism and stable equivalence. Derive the general comparison; its adjoint uses cone Kan replacement. Fix the boundary sign h_*(S¹∧δ_F(y))=−i_*(y) with these interval endpoints.

(S I, (2.16) and Prop. 2.17, p. 29.)

*Needs:* §5.7, §5.16, §5.10, §5.6, §5.11, §5.8.

### 5.19 Finite wedges and products of spectra agree

Prove finite wedge→product a π̂-isomorphism and stable equivalence, characterised by all four entries (id,0;0,id). Arbitrary wedges give direct-sum naive groups; only finite products are asserted. Deduce SHC biproducts.

(S I, Prop. 2.19, p. 30.)

*Needs:* §5.3, §5.10, §5.7, §5.11.

### 5.20 Products in the stable homotopy category

Construct SHC products from products of injective Ω replacements; prove their universal property and πₖ∏Xᵢ≅∏πₖXᵢ. γ preserves finite products; an arbitrary unreplaced point-set product need not compute this product.

- `hasProducts`: All small products in SHC.
- `piProdEquiv`: πₖ(∏Yⱼ)≅∏πₖYⱼ additively.

(S II, Prop. 1.10(ii) and proof, pp. 220–221.)

*Needs:* §5.15, §5.14, §5.12.

### 5.21 The stable homotopy category is triangulated

Define distinguished triangles as those isomorphic to localised cone triangles; compare elementary cofibrations. Prove the triangulated axioms, octahedra and Mathlib rotation (g,h,−Σf), with the cone projection.

**Checks.**

- `triangle_rotation_identity`: Rotating the identity-sphere triangle gives −Σid as its third arrow.

(S II, Thm. 2.9, p. 231.)

*Needs:* §5.15, §5.16, §5.17, M.

### 5.22 The smash product of symmetric spectra

Define bimorphisms by equivariant Xₚ∧Y_q→Zₚ₊q compatible with σ in both variables, including the second-variable block permutation. Construct smash by the symmetric-sequence coequaliser and its universal bijection. Supply level inclusions, shuffle twist, full closed symmetric tensor coherence and mapping-space enrichment.

- `smash`: The spectrum representing compatible equivariant bimorphisms.
- `smash.desc`: Hom(X∧Y,Z)≅Bimorphism(X,Y;Z), naturally.
- `monoidal`: The full symmetric tensor coherence with unit S.
- `internalHom`: The closed right adjoint to −∧Y.
- `smash_suspensionSpectrum`: Σ∞K∧Σ∞L≅Σ∞(K∧L).
- `mapSpace`: The simplicial mapping space, with composition and unit enrichment.
- `smash.ι`: The universal maps Xₚ∧Y_q→(X∧Y)ₚ₊q, jointly determining maps out of smash.

**Checks.**

- `smash_sphere_left`: smash sphere X ≅ X (strict unit).
- `smash_level_zero`: (smash X Y)_0 = X_0 ∧ Y_0.
- `smash_suspension_compat`: smash (suspensionSpectrum S⁰) X ≅ X compatibly with the unit isomorphism.
- `smash_twist_sphere_sign`: The twist on smash (S¹-shifted sphere) (S¹-shifted sphere) is not the identity in SHC: it acts by −1 on π₂ (§5.24).

(S I, Construction 5.6 and Thm. 5.10, pp. 83–85.)

*Needs:* §5.2, §5.1, §5.5.

### 5.23 The derived smash product on the stable homotopy category

Define `IsFlat X` by preservation of level cofibrations under X∧−. Equivalently each latching map LₙX→Xₙ is a cofibration of underlying pointed simplicial sets; no free Σₙ-action is required for this criterion. Construct functorial flat resolutions and prove smashing with a flat spectrum preserves stable equivalences. Derive the closed symmetric monoidal SHC product, exact in each input with unit S. The coherent lax symmetric comparison γX∧ᴸγY→γ(X∧Y) is invertible if either input is flat. (S, Def. I.5.41, p. 98; Prop. I.5.47, p. 100.)

**Checks.**

- `flat_sphere`: S and free spectra FₙK are flat.
- `flat_truncated_sphere`: S with its zero level deleted is not flat: its degree-two latching map identifies the two permutation copies.
- `flat_zero`: the zero spectrum is flat; smashing with it gives zero.

(S II, Thm. 3.1, p. 239; S II, Prop. 3.19 and (3.20), pp. 248–249.)

*Needs:* §5.22, §5.15, §5.21.

### 5.24 The sign of the twist on spheres

Construct αₘ,ₙ:Sᵐ⁺ⁿ≅Sᵐ∧ᴸSⁿ sending the fundamental class to ιₘιₙ, for all integers. Prove unit/associativity and τ αₘ,ₙ=αₙ,ₘ(−1)ᵐⁿ. Negative spheres use inverse shifts; twists (1,1) and (0,1) have degrees −1 and +1.

(S II, (4.3) and Prop. 4.4, p. 250.)

*Needs:* §5.23, §5.5, §5.12, §5.13, §5.15.

### 5.25 The smash pairing on π-groups

Construct the derived bilinear pairing by smashing representing sphere maps and precomposing α. Prove associativity, units, graded twist and naturality. For a degree-m′ second map and degree-n first class, the shifted naturality sign is (−1)ᵐ′ⁿ. Compare with the point-set pairing through the lax map.

- `piPairing`: The bilinear derived-smash pairing πₚX×π_qY→πₚ₊q(X∧ᴸY).
- `piPairing_assoc`: Associativity under the tensor associator.
- `piPairing_comm`: τ_*(xy)=(−1)ᵖq yx.
- `piPairing_unit`: The class 1∈π₀S is the two-sided unit.
- `piPairing_naturality`: For a degree-m′ second map and x∈πₙ, (f∧f′)_*(xy)=(−1)ᵐ′ⁿf_*(x)f′_*(y), with shifted tensor identifications.
- `piPairing_comp_psi`: The comparison ψ:X∧ᴸY→X∧Y sends the pairing to the point-set product.

**Checks.**

- `piPairing_sphere_ring`: pi S * with piPairing is a graded-commutative ring with pi S 0 ≅ ℤ.
- `piPairing_sphere_unit`: For Y = S and the unit 1 ∈ π₀S, x · 1 corresponds to x under X ∧ᴸ S ≅ X (unit isomorphism), for every x ∈ π_p X.
- `piPairing_iota_iota`: ι₁·ι₁ generates π₂(S¹∧ᴸS¹)=ℤ under the sphere-factor isomorphism; its swapped value is the negative generator.
- `piPairing_not_commutative`: piPairing is not commutative without sign: for ι ∈ pi S¹ 1 (S¹ = ΣS), ι · ι = −τ_*(ι · ι).
- `koszul_two_ones`: Swapping the degree-one sphere generators negates their degree-two product; swapping degrees zero and one does not.

(S II, Prop. 4.11, p. 252.)

*Needs:* §5.23, §5.24, §5.12.

### 5.26 Connectivity of smash products

For (k−1)-connected X and (l−1)-connected Y, prove X∧ᴸY (k+l−1)-connected and πₖX⊗πₗY≅πₖ₊ₗ(X∧ᴸY). This bottom-degree isomorphism does not extend to all degrees.

(S II, Prop. 5.22, p. 264.)

*Needs:* §5.39, §5.25, §5.23.

### 5.27 Symmetric ring spectra and module spectra

Define symmetric ring spectra as smash monoids with full unit/associativity laws, and right modules by M∧R→M with the laws. Commutativity means μτ=μ. Level products use smash inclusions; π-products use the point-set pairing followed by μ. Pin π₀ addition and its μ-induced product/unit.

- `SymmRingSpectrum`: A monoid object for smash, with full unit/associativity laws.
- `SymmRingSpectrum.IsCommutative`: μ∘τ=μ.
- `SymmRingSpectrum.Module`: A right action M∧R→M with full associativity/unit laws.
- `SymmRingSpectrum.levelMul`: Equivalent coherent equivariant level multiplications and sphere-unit maps.
- `SymmRingSpectrum.piRing`: The graded ring π_*R from μ and the derived pairing; graded commutative for commutative R.
- `SymmRingSpectrum.pi0Ring`: Its π₀ ring has the addition, multiplication from μ and unit from S→R.

**Checks.**

- `sphere_initial_ring`: sphere is the initial symmetric ring spectrum.
- `ringSpectrum_trivial`: The trivial spectrum is a (zero) ring spectrum, terminal among ring spectra.
- `ringSpectrum_HZ_pi`: pi (HZ) 0 ≅ ℤ as rings.
- `ringSpectrum_moore_two_not_ring`: The mod-2 Moore spectrum S/2 admits no homotopy-unital multiplication: 2 ≠ 0 on S/2 (π₂(S/2) = ℤ/4), so it is not a ring spectrum even up to homotopy.
- `matrix_unit_order`: Over M₂(ℤ), e₁₂e₂₁=e₁₁ while e₂₁e₁₂=e₂₂; the right action follows this order.

(S I, Definitions 1.3 and 1.5, pp. 9–10; Thm. 5.25, p. 92.)

*Needs:* §5.22.

### 5.28 Stable model structures on module spectra

Transfer absolute projective stable models to right R-modules via free–forgetful adjunction, monoid axiom and smallness. Underlying spectra detect weak equivalences/fibrations. Construct resolutions, triangulated localisation and derived free–forgetful adjunction; commutative R gives relative smash. Distinguish positive/flat variants.

- `SymmRingSpectrum.Module.stableModelCategory`: The absolute projective stable model structure on right R-modules.
- `SymmRingSpectrum.Module.HomotopyCategory`: The triangulated localisation Ho(R-Mod).
- `SymmRingSpectrum.Module.freeAdj`: The derived free–forgetful adjunction Ho(R-Mod)(X∧ᴸR,M)≅SHC(X,UM).

**Checks.**

- `moduleSpectra_sphere`: For R = sphere the model structure is the stable model structure of symmetric spectra.
- `moduleSpectra_free_hom`: Ho(R-Mod)(R, M) ≅ π₀ M.
- `moduleSpectra_forget_compat`: A morphism of R-modules is a weak equivalence iff it is a stable equivalence of underlying spectra.
- `moduleSpectra_not_level`: Over R=S, F₁S¹→S is stable but not level equivalent. The zero-ring case cannot furnish this distinction.

(S IV, Thm. 1.3, p. 386.)

*Needs:* §5.27, §5.22, §5.14, §5.21, M.

### 5.29 Operads and E∞-algebras in symmetric spectra

Define operads of symmetric spectra with right symmetric-group actions, unit S→O(1), substitution, and all associativity, unit, block permutation and equivariance equations. Define O-algebras by the action maps and equations. Include simplicial E∞ operads and their spectrum realisation, Com-algebras as commutative ring spectra, and the positive-model comparison between E∞ algebras and commutative symmetric ring spectra. For spectra of pointed simplicial sets, use the stable positive model structure: every spectrum-valued operad is admissible, and an aritywise stable equivalence induces an extension–restriction Quillen equivalence. No Σ-cofibrancy hypothesis is imposed in this positive statement. Derived functors use cofibrant algebra replacements; it does not assert that their underlying spectra are positively cofibrant. Thus Σ∞₊EΣₙ→Com rectifies E∞ rings. Name `operadPositiveModel` and `operadRectification`. (Pavlov–Scholbach, Thms. 4.1 and 4.6, Ex. 4.7, pp. 17–18.) Construct the abstract Eₙ-algebra interfaces and the comparison to concrete spectra for later quotient theorems; a sequence without substitution and its laws is not an operad.

- `Operad`: Spectrum-valued operads with all equivariant unit/composition axioms.
- `Operad.Algebra`: Full operad actions on spectra.
- `Operad.ofSSet`: Apply Σ∞₊ aritywise to a simplicial operad.
- `Operad.comAlgebraEquiv`: Com-algebras≅commutative symmetric ring spectra.
- `Operad.IsEInfty`: Each O(n) is contractible with free Σₙ action.

**Checks.**

- `operad_com_algebra_HR`: For a commutative ring R, HR is a Com-algebra.
- `operad_trivial_algebra`: The trivial spectrum is an algebra over every operad.
- `operad_ass_ring_compat`: Algebras over the associative operad are exactly symmetric ring spectra (§5.27).
- `operad_moore_two_not_A2`: S/2 admits no algebra structure over the associative operad, nor any unital A₂-structure.

**Checks.**

- `operad_unit`: the operad concentrated in arity one with value S has algebras equal to spectra.
- `operad_comm`: Com-algebras have the commutative ring-spectrum equations.
- `operad_rectification`: Barratt–Eccles→Com gives a positive Quillen equivalence; no absolute Ω replacement of the sphere by a commutative ring is inferred.

(S III, Definitions 5.3–5.4 and Examples 5.9–5.12, pp. 368–370.)

*Needs:* §5.22, §5.27, §5.14.

### 5.30 Eilenberg–Mac Lane spectra of abelian groups

Construct HA from reduced A[Sⁿ], with σ and Σₙ actions. Normalisation is quasi-isomorphic to A[n]; the simplicial-abelian homotopy/homology comparison proves Kan Ω status, π₀=A and other π=0. Give functorial additive maps, the degree-zero map comparison and uniqueness with specified π₀ identification.

- `eilenbergMacLane`: HA has reduced-linearisation levels A[Sⁿ].
- `eilenbergMacLane.map`: Homomorphisms give functorial additive HA→HB maps.
- `eilenbergMacLane.isOmegaSpectrum`: HA is Ω.
- `eilenbergMacLane.piZeroEquiv`: π₀HA≅A; πₖHA=0 for k≠0.
- `eilenbergMacLane.level_kpi`: Positive level n realises to K(A,n); level zero is discrete A.

**Checks.**

- `eilenbergMacLane_zero`: eilenbergMacLane 0 is the trivial spectrum.
- `eilenbergMacLane_pi_Z`: pi (eilenbergMacLane ℤ) 0 ≅ ℤ and pi (eilenbergMacLane ℤ) 1 = 0.
- `eilenbergMacLane_level_one`: |level 1 of eilenbergMacLane A| is homotopy equivalent to Group.classifyingSpace A (both K(A, 1)).
- `eilenbergMacLane_not_sphere`: eilenbergMacLane ℤ is not stably equivalent to the sphere spectrum: pi S 3 = ℤ/24 ≠ 0.
- `isSemistable_HA`: HA is an Ω-spectrum, hence semistable (§5.9), so its naive and true π-groups both equal A in degree 0.

Prove `simplicialAbelian_isKan` and `simplicialAbelian_piNormalized`: every simplicial abelian group is Kan and πₙ equals Hₙ of its Dold–Kan normalisation, naturally. Prove `reducedFree_normalizedSphere` for A[Sⁿ]: its normalisation is quasi-isomorphic to A[n] (not generally literally isomorphic for the smash-sphere model). (Sh, §2.2 and Prop. 4.4, pp. 5–6, 13.)

**Checks.**

- `simplicial_abelian_constant`: constant A has π₀=A and no positive π.
- `simplicial_abelian_shift`: Dold–Kan of A[1] has π₁=A.
- `normalized_smash_sphere`: S¹∧S¹ has extra normalised cells; its reduced chains have homology only in degree two.

(S I, Example 1.14, p. 16; HSS Example 1.2.5.)

*Needs:* §5.2, §5.4, §3.16, §5.12, §5.15, §5.9, M.

### 5.31 Maps into Eilenberg–Mac Lane spectra and their uniqueness

For connective A and X with πₖX=0 for k≥1, prove [A,X]≅Hom(π₀A,π₀X). If X has homotopy only at zero, construct Hπ₀X→X inducing id and prove invertibility. Deduce the heart equivalence with abelian groups.

(S II, Prop. 5.24 and Thm. 5.25, pp. 265-266.)

*Needs:* §5.39, §5.30, §5.12, §5.21.

### 5.32 HR as a ring spectrum and HR-modules

Construct HR for associative R, identifying its π₀ ring, and HM for Module Rᵐᵒᵖ M with its actual right action. Prove Ho(HR-Mod)≃D(right R-modules) as triangulated categories, compatible with underlying spectra; commutative R identifies relative smash with derived tensor. Matrix-unit order pins handedness.

- `eilenbergMacLaneRing`: HR with its ring structure, underlying H(R,+).
- `eilenbergMacLaneRing.isCommutative`: HR is commutative when R is.
- `eilenbergMacLaneModule`: For Module Rᵐᵒᵖ M, HM is a right HR-module.
- `eilenbergMacLaneRing.piRingEquiv`: π₀HR≅R as rings.
- `eilenbergMacLaneModule.carrierIso`: The module’s underlying spectrum is HM.

**Checks.**

- `eilenbergMacLaneRing_Z_pi`: pi (eilenbergMacLaneRing ℤ) 0 ≃+* ℤ.
- `eilenbergMacLaneRing_zero`: eilenbergMacLaneRing of the zero ring is the trivial ring spectrum.
- `eilenbergMacLaneRing_unit_compat`: The unit S → HR induces ℤ → R on π₀, the canonical ring map.
- `eilenbergMacLaneRing_smash_not_self`: HF₂ ∧ᴸ HF₂ is not HF₂: its π₁ is nonzero (the dual Steenrod algebra has ξ₁ in degree 1), so HR ∧ᴸ HR ≠ HR in general.
- `eilenbergMacLaneModule_carrier`: The underlying spectrum of eilenbergMacLaneModule R M is canonically HM.
- `eilenbergMacLaneModule_zero`: The zero right R-module gives a stably zero HR-module spectrum.
- `eilenbergMacLaneModule_right_order`: The regular right action over M₂(ℤ) sends (e₁₂,e₂₁) to e₁₁. The reversed product is e₂₂.

(S I, Example 1.14, p. 16; S IV, definition preceding Thm. 1.3, p. 386.)

*Needs:* §5.30, §5.27.

### 5.33 The Eilenberg–Mac Lane spectrum of a chain complex

Construct the unbounded cochain-to-HR-module functor and its underlying spectrum functor at R=ℤ, inducing D(ℤ)≃Ho(Hℤ-Mod). Its homotopy/shift identifications follow below; cochain degree two gives π₋₂. Construct the projective model on unbounded complexes (weak equivalences quasi-isomorphisms, fibrations degreewise surjections), the stable model on spectra in simplicial R-modules, and the weak monoidal Quillen zigzag through nonnegative chain-complex spectra. Name `complexProjectiveModel`, `simplicialModuleStableModel`, `HRModDerivedEquiv`, with derived unit/counit isomorphisms and their suspension compatibility (Sh, Prop. 2.10 and §§3–4, pp. 6–16).

- `eilenbergMacLaneComplex`: The full complex-to-Hℤ-module functor; the Lean declaration records its underlying spectrum functor on cochains.
- `eilenbergMacLaneComplex.quasiIso`: Quasi-isomorphisms induce stable equivalences.
- `HRModDerivedEquiv`: For commutative R, Ho(HR-Mod)≃D(ModuleCat R) as triangulated categories.

**Checks.**

- `eilenbergMacLaneComplex_zero`: The zero complex goes to a stably trivial spectrum.
- `eilenbergMacLaneComplex_single`: eilenbergMacLaneComplex (A concentrated in degree 0) is stably equivalent to eilenbergMacLane A.
- `eilenbergMacLaneComplex_negative`: For C = ℤ concentrated in degree −2, pi (H C) (−2) ≅ ℤ: negative homotopy is retained.
- `eilenbergMacLaneComplex_sees_differential`: For C = (ℤ →·2 ℤ) in homological degrees 1, 0, H(C) is not stably equivalent to H(C₀) ∨ ΣH(C₁) = HZ ∨ ΣHZ: π₀ H(C) = ℤ/2 ≠ ℤ.

**Checks.**

- `complex_model_zero`: the zero complex gives the zero module spectrum.
- `complex_model_acyclic`: ℤ→¹ℤ gives a contractible spectrum.
- `complex_model_unbounded`: arbitrary negative cochain degrees are retained, including ℤ in degree −2 with π₂=ℤ.

(Sh §2, p. 6; Cor. 2.15; Sh §2.2, p. 5.)

*Needs:* §5.32, §5.30, §5.21, §5.28, M.

### 5.34 Complex homology and spectrum homotopy

Prove πₖH(C)≅H⁻ᵏ(C) and H(C[1])≅ΣH(C), naturally for unbounded cochains and Mathlib's shift C[1]ⁿ=Cⁿ⁺¹. The derived functor is exact and H(A[0])≅HA. A degree-two group moves from π₋₂ to π₋₁ after [1].

**Checks.**

- `cochain_shift_witness`: ℤ in cochain degree 2 has spectrum π₋₂=ℤ; after [1] the nonzero group is π₋₁.

(Sh Cor. 2.15, p. 8.)

*Needs:* §5.33, §5.28, §5.12, §5.15, §5.31, §5.29 and §5.40, M.

### 5.35 Eilenberg–Mac Lane spectra represent ordinary cohomology

For CW X and integer n, prove [Σ∞₊X,ΣⁿHA]≅Hⁿ(X;A), naturally with reduced pointed form. Compare singular cochains, suspension and products. A point in degree zero gives A; negative space cohomology vanishes. Name `eilenbergMacLaneSmashHomology`: πₖ(HA∧ᴸΣ∞K)≅H̃ₖ(K;A).

(S II, Prop. 6.23, p. 279.)

*Needs:* §5.30, §5.5, §5.15, §3.20, AlgebraicTopology, §5.6, §5.9, §5.11.

### 5.36 Connective covers and Postnikov sections of spectra

Construct functorial covers X⟨n⟩→X and sections X→PₙX with retained π isomorphisms and complementary vanishing, their adjunctions and triangle X⟨n+1⟩→X→PₙX→ΣX⟨n+1⟩. Give the Postnikov t-structure/abelian heart and coherent tower limits. As n→−∞, X≅hocolim X⟨n⟩.

- `connectiveCover`: The n-connective-cover functor with counit X⟨n⟩→X.
- `postnikovSection`: The n-Postnikov-section functor with unit X→PₙX.
- `postnikovTriangle`: The distinguished triangle X⟨n+1⟩→X→PₙX→ΣX⟨n+1⟩.
- `pi_connectiveCover`: πₖX⟨n⟩≅πₖX for k≥n; zero otherwise.
- `pi_postnikovSection`: πₖPₙX≅πₖX for k≤n; zero otherwise.
- `postnikovTStructure`: The Postnikov t-structure, with heart equivalent to abelian groups.
- `connectiveCover_adj`: The cover is right adjoint to inclusion of n-connective spectra.

**Checks.**

- `connectiveCover_connective`: For connective X, connectiveCover 0 X ≅ X.
- `postnikovSection_zero_HA`: postnikovSection 0 (connectiveCover 0 X) ≅ eilenbergMacLane (pi X 0).
- `connectiveCover_wedge_example`: For X = HZ ∨ Σ²HZ ∨ Σ^{−2}HZ, connectiveCover 0 X ≅ HZ ∨ Σ²HZ and postnikovSection (−1) X ≅ Σ^{−2}HZ: π_k of the cover is π_k X for k ≥ 0 and 0 for k < 0.
- `connectiveCover_not_identity_negative`: For X = Σ^{−1} HZ, connectiveCover 0 X = 0 although X ≠ 0: covers erase negative homotopy.

(S II, Theorems 8.1 and 8.3, pp. 295–296.)

*Needs:* §5.15, §5.21, §5.12, §5.30, §5.39, §5.38, §5.31, §5.37, M.

### 5.37 Sequential homotopy colimits of spectra

Define sequential hocolim by the 1−shift triangle on ⊕Xₙ, with compatible inclusions. Compare coherent model telescopes and prove πₖhocolim≅colim πₖ. For contravariant cohomological E taking sums to products, prove its Milnor SES with lim¹ of suspended values. Model telescopes supply functoriality beyond chosen SHC cones.

- `hocolimSeq`: The telescope triangle for 1−shift on ⊕Xₙ, with the stage maps.
- `hocolimSeq_pi`: πₖhocolim X≅colimₙπₖXₙ.
- `hocolimSeq_milnor`: For cohomological E taking sums to products, 0→lim¹E(ΣXₙ)→E(hocolim X)→lim E(Xₙ)→0.
- `telescope`: The model telescope represents this triangle.

**Checks.**

- `hocolimSeq_const`: For the constant sequence with identity maps, hocolimSeq X ≅ X 0.
- `hocolimSeq_mul_rational`: For S →¹ S →² S →³ ⋯ with multiplier n+1 at stage n≥0, π₀hocolim≅ℚ.
- `hocolimSeq_pi_compat`: The colimit of pi agrees with pi of the point-set telescope.
- `hocolimSeq_not_sum`: The homotopy colimit is not the sum: for the constant sequence S with identity maps hocolimSeq ≅ S, whereas pi₀ of ⊕_n S is ⊕_n ℤ.

(S II, Def. 5.3 and Lemma 5.6, pp. 256–258.)

*Needs:* §5.21, §5.19, §5.12.

### 5.38 Cellular approximation in triangulated categories with sums

Let T be triangulated with arbitrary sums, C a set of compact objects, and E:Tᵒᵖ→Ab cohomological and carrying sums to products. Construct R in the closure of C under sums and extensions to the right, and u∈E(R), such that [G,R]→E(G), f↦E(f)(u), is bijective for every G∈C. Build the sequential cellular approximation and its telescope. For SHC establish sphere compactness, generation and the Brown representability; generic categorical representability is used only after constructing the object.

(S II, Prop. 5.14, pp. 260-261.)

*Needs:* §5.21, §5.37, §5.12.

### 5.39 Connective spectra are generated by spheres

Construct cellular approximations and prove connectivity generation: every isomorphism-invariant property containing Sⁿ and closed under sums/right distinguished extensions holds on (n−1)-connected spectra. Verify connectivity at attachments and all-π comparison maps, using the concrete spectrum model.

(S II, Prop. 5.21, p. 264.)

*Needs:* §5.38, §5.12, §5.21, §5.17.

### 5.40 Connective spectra are sequences of deloopings

Construct `sequentialStableModel` with stable π-isomorphisms, projective cofibrations and Kan Ω fibrants, and `symmetrisationQuillenEquivalence` for symmetrisation⊣forgetful, including replaced unit/counit. Compare connective Ω-spectra with deloopings whose ith space has πⱼ=0 for j<i. Construct `spectraInfinityCategory` by monoidal localisation, identifying its homotopy category with SHC, its tensor with derived smash, and its coherent finite limits with finite colimits.

**Checks.**

- `spectra_infinity_zero`: the zero spectrum is both initial and terminal.
- `spectra_infinity_cofibre`: the cofibre of id:S→S is zero, and its square is also a pullback.
- `spectra_infinity_unit`: tensoring with S is identity; ΣS has π₁=ℤ and π₀=0.

(BS Appendix §12, Def. 12.8 and footnote 29, p. 57; HSS Thm. 4.3.2, p. 42.)

*Needs:* §5.4.

### 5.41 Grouplike E∞-monoids are connective spectra

Construct sphere evaluation of special Γ-spaces and the derived equivalence between grouplike special Γ-spaces and connective spectra. The inverse is the infinite loop space with E∞ multiplication; compare equivalent machines while retaining all Γ structure maps.

(BS Appendix §12, Thm. 12.9, p. 57.)

*Needs:* §5.40, §4.27, §4.24, §5.19.

### 5.42 Picard groupoids are 1-truncated connective spectra

For a Picard groupoid C, construct K(C) with zero space BC, π₀=iso-classes, π₁=Aut(1) and other π zero. Prove the homotopy-theory equivalence with 1-truncated connective spectra, retaining transformations and self-braiding as the Hopf-map action.

**Checks.**

- `picard_discrete_group`: a discrete abelian group A gives HA, with π₀=A and π₁=0.
- `picard_one_object`: the one-object Picard groupoid with automorphisms A gives ΣHA.
- `picard_self_braiding`: graded lines over ℝ have the odd-line self-swap −1, so η on the odd component is nonzero.

(BS Appendix §12, after the proof of Prop. 12.15, p. 59.)

*Needs:* §5.41, §4.30, §1.34, §5.36.

### Examples

The sphere spectrum has π₀ = ℤ and no negative groups. The free symmetric spectrum in level one shows why naive groups need not compute stable groups. A two-sphere-factor twist in degrees one and one acts by −1. The Eilenberg–Mac Lane spectrum of ℤ has precisely one nonzero homotopy group, in degree zero.

### Dependencies

Layers 1–4 and Mathlib’s model, monoidal, derived and triangulated APIs; concrete models and comparisons are local.

## Layer 6: Assembly of the K-theory spectrum

### 6.1 The K-theory symmetric spectrum of a Waldhausen category

Build the Waldhausen inputs locally before the spectrum assembly. A Waldhausen category has a zero object, subcategories of cofibrations and weak equivalences containing all isomorphisms, zero-to-object cofibrations, closure of cofibrations under pushout along arbitrary maps, and the weak-equivalence gluing axiom for pushout squares. Define exact functors preserving this data, the cofibration-sequence category, SₙC as functors Ar[n]→C with zero diagonal and the specified cofibration/pushout quotient squares, and the iterated multisimplicial construction. Face and degeneracy functors must preserve every square and quotient. Define simplicial-set levels K(C)ₙ by diagonal nerves of wS⁽ⁿ⁾C, with realisation |wS⁽ⁿ⁾C| with Σₙ acting by permutation of directions, construct structure maps and prove iterated equivariance. This unreplaced spectrum has zeroth simplicial level nerve(wC); define its connective Ω-model by the positive delooping and Ω|wS.C| in level zero.

- `WaldhausenCategory.kSpectrum`: The iterated-S symmetric spectrum, levels |wS⁽ⁿ⁾C|, using the full local Waldhausen axioms.
- `WaldhausenCategory.kSpectrum.map`: Exact functors give spectrum maps preserving identities/composition.
- `WaldhausenCategory.kSpectrum.level_zero`: Level zero is nerve(wC).
- `WaldhausenCategory.kSpectrum.sequentialComparison`: Compare with Ω|wS•C|, |wS•C|, |wS•S•C|,… using the specified shift and replacement.

**Checks.**

- `kSpectrum_zero_category`: kSpectrum of the trivial Waldhausen category (one object) is the trivial spectrum.
- `kSpectrum_finiteSets_sphere`: kSpectrum of finite pointed sets is stably equivalent to the sphere spectrum (quoted Barratt–Priddy–Quillen–Segal).
- `kSpectrum_pi0_K0`: pi (kSpectrum C) 0 ≅ K₀(C) (via GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category, pi1_eq_K0).
- `kSpectrum_level_zero_not_groupCompleted`: level 0 of kSpectrum (finite projective R-modules) is |w C|, not Ω|wS.C|: its π₀ is the monoid of iso classes, not K₀(R); only from level 1 on is it an Ω-spectrum.

The weak-equivalence subcategory need not satisfy an extra extension axiom. **API:** `WaldhausenCategory.zero`, `cof_pushout`, `weak_gluing`, `ExactFunctor.comp`, `S.obj`, `S.face`, `S.degeneracy`, `S.oneEquiv`, `S.twoEquiv`.

**Checks.**

- `waldhausen_zero`: the zero category has terminal Sₙ.
- `s_zero_one`: S₀C is terminal and S₁C recovers C.
- `s_two_quotient`: S₂C records a cofibration and its specified quotient; a composable pair without the pushout quotient square fails.
- `exact_composition`: identity and composite exact functors preserve every axiom.
- `exact_not_cofibrations`: a zero-preserving functor that fails to preserve cofibrations is not exact.

(S I, Example 3.50, pp. 55–57; W IV Infinite Loop Structure 8.5.5, p. IV.69; Waldhausen, §§1.1–1.3, pp. 318–330.)

*Needs:* §5.2, §2.20, §2.21, §6.1–6.2.

### 6.2 The iterated S.-construction is a connective Ω-spectrum

Prove Waldhausen additivity |wS•E(C)|≃|wS•C|×|wS•C| by source/quotient. Construct the relative S-construction and its contraction/fibre sequence to deduce |wS⁽ⁿ⁾C|≃Ω|wS⁽ⁿ⁺¹⁾C| for n≥1. Assemble the connective Ω model with zero space Ω|wS•C| and compare the positive model.

- `WaldhausenCategory.kSpectrum.isPositiveOmega`: The positive adjoint structure maps are weak by relative-S delooping.
- `WaldhausenCategory.kSpectrum.isSemistable`: The resulting spectrum is semistable.

(W IV Prop. 8.4 with proof, Def. 8.5, 8.5.3–8.5.5, pp. IV.68–69; W V Prop. 1.7 and Remark 1.7.1, p. V.8; S I, Prop. 8.26(i) and Example 8.27, pp. 182–183; Waldhausen, Thm. 1.4.2 and Prop. 1.5.3, pp. 331–342.)

*Needs:* §6.1, §6.1–6.2, §5.4, §5.12, §5.9.

### 6.3 Functoriality and homotopy invariance of the K-theory spectrum

Construct exact-functor comparisons from finite-projective S-construction K-theory to the split-exact Γ/group-completion model, recovering K₀ and unit component BGL⁺. Preserve the split/non-split distinction. Separately prove the Barratt–Priddy–Quillen–Segal equivalence K(FinSet*)≃S with its intermediate categories.

(W IV Infinite Loop Structure 8.5.5, last paragraph, p. IV.69.)

*Needs:* §6.1, §1.10, §5.10, §6.1–6.2.

### Examples

The zero Waldhausen category assembles to the zero spectrum. Finite-dimensional vector spaces over a field recover their algebraic K₀ in degree zero. A mere sequence of realisations has no Ω-spectrum conclusion until the relative-S delooping equivalence is supplied.

### Dependencies

Layers 1–5 and local Waldhausen/additivity/relative-S targets; full group-completion and spectrum comparisons.

## Layer 7: Coefficients, completion and filtrations

### 7.1 Moore spectra S/m

For m≥1 define S/m as a cone of m:S→S, with triangle S→S→S/m→ΣS. It is connective, has π₀=ℤ/m and ordinary integral homology concentrated in degree zero. Every map ℤ/m→ℤ/m′ lifts to a spectrum map, uniquely if either modulus is odd; for two even moduli the indeterminacy is ℤ/gcd(2,m,m′). The extended carrier at m=0 is S∨ΣS, so its π₀ is ℤ but it also has H₁=ℤ; the positive-modulus homology assertion excludes this case. This also fixes the convention S/1=0.

- `moore`: The cofibre triangle S→ᵐS→S/m→ΣS, allowing m=0 for the carrier.
- `moore.homologyZero`: For m>0, H₀(S/m;ℤ)≅ℤ/m and all other H vanish.
- `moore.piZero`: π₀(S/m)≅ℤ/m and negative π vanish.
- `moore.bockstein`: The triangle boundary S/m→ΣS.
- `moore.liftHom`: Every ℤ/m→ℤ/m′ lifts, without functorial choice; for m,m′>0 and odd m′ the lift is unique.
- `moore.liftHom_piZero`: The lift induces the prescribed homomorphism under the π₀ comparisons.

**Checks.**

- `moore_one_trivial`: moore 1 is a zero object of
- `moore_two_pi_two`: pi (moore 2) 2 ≅ ZMod 4, generated by a lift of η.
- `moore_homology_compat`: For m≥1 and n≥2, Hₖ(S/m;ℤ)=H̃ₖ₊ₙ₋₁(Sⁿ⁻¹∪ₘeⁿ;ℤ): both are ℤ/m in spectrum degree zero and zero elsewhere.
- `moore_two_not_ring`: 2 • 𝟙 (moore 2) ≠ 0 in SHC, so S/2 admits no unital multiplication.
- `moore_zero_extended`: S/0=S∨ΣS has H₁=ℤ, so the positive-modulus homology clause fails at zero.

Construct `freudenthalSuspension`: for n-connected based CW X, n≥0, πᵢX→πᵢ₊₁ΣX is bijective for i≤2n and surjective for i=2n+1. Construct the stable Hopf class η and prove `sphere_firstStems`: π₁S=ℤ/2 generated by η, π₂S=ℤ/2 generated by η². Build `modTwoSquares` with naturality, suspension, Cartan and Adem laws; apply Sq² on CP² and Sq¹Sq²Sq¹=Sq²Sq² to prove `mooreTwo_piTwo`: π₂(S/2)=ℤ/4, with twice a lift of η equal to the image of η². These supply the finite-coefficient and stable-range inputs, rather than assuming the first stems. (H AT, Cor. 4.24, p. 360, §4.L, pp. 487–517; S, I.1, pp. 12–13; II.6.48, pp. 287–288; II.10.11, 10.13, pp. 319–320.)

**Checks.**

- `hopf_order_two`: η is nonzero but 2η=0 stably.
- `moore_two_order_four`: twice a generator in π₂(S/2) is nonzero and four times it is zero.
- `square_cp_two`: Sq² on the degree-two CP² generator is its nonzero square; squares above the input degree vanish.

(S II, Def. 6.33, p. 284; Construction 6.39, (6.41)–(6.42) and Thm. 6.43, pp. 285–286; Prop. 6.48 and (6.50), pp. 287–288; W IV Def. 2.1, p. IV.18.)

*Needs:* §5.16, §5.5, §5.21, §5.23, §5.30, §5.17.

### 7.2 Spectra with finite coefficients E/m

Define E/m=E∧ᴸS/m and πₙ(E;ℤ/m)=πₙ(E/m), for each integer n and m≥1. Smashing the Moore triangle gives a functorial distinguished triangle E→mE→E/m→ΣE. For an Ω-spectrum identify this with the colimit of space-level finite-coefficient groups [Pⁿ⁺ʳ(ℤ/m),Eᵣ] in the stable range. Construct the finite Moore duality D(S/m)≅Σ⁻¹S/m: Pᵈ represents Σᵈ⁻¹S/m, so the space-level degree is n+r, with no extra +1. The extended zero modulus remains E∨ΣE.

- `modM`: E/m=E∧ᴸS/m with triangle E→ᵐE→E/m→ΣE.
- `modM.smashIso`: The identification with derived smash.
- `modM.functor`: For fixed m, an exact functor in E.
- `piMod`: πₙ(E;ℤ/m)=πₙ(E/m).
- `modM.HA`: π₀(HA/m)≅A/mA and π₁(HA/m)≅A[m].

**Checks.**

- `modM_one`: modM E 1 is a zero object.
- `modM_HZ`: modM (eilenbergMacLane ℤ) m ≅ eilenbergMacLane (ZMod m).
- `modM_smash_compat`: modM E m ≅ E ∧ᴸ moore m, so piMod (sphere) m 0 ≅ ZMod m.
- `modM_not_tensor`: piMod E m n is not π_n(E) ⊗ ℤ/m in general: for E = Σ H(ℤ/2) and m = 2, piMod E 2 2 ≅ ℤ/2 (the torsion term) while π₂(E) ⊗ ℤ/2 = 0.

(W IV Def. 2.4 and Spectra 2.3.1, pp. IV.19–20; S II, Remark 6.51, p. 288.)

*Needs:* §7.1, §5.16, §5.23, §5.4.

### 7.3 The Bockstein long exact sequence

Apply the homotopy long exact sequence to the smashed triangle, giving πₙE→mπₙE→πₙ(E/m)→βπₙ₋₁E→mπₙ₋₁E. Construct the Bockstein from the chosen triangle's connecting map, prove all consecutive composites zero and exactness, and establish naturality for spectrum maps and for specified maps of coefficient triangles. Every degree, including negative degrees, is covered.

(W IV 2.1.1 and Universal Coefficient Sequence 2.2, p. IV.18; S I, Prop. 2.12, p. 27.)

*Needs:* §7.2, §5.17.

### 7.4 The universal coefficient sequence for mod-m homotopy

Extract the short exact sequence 0→πₙE/mπₙE→πₙ(E/m)→πₙ₋₁E[m]→0, with the quotient identified with πₙE⊗ℤ/m. The left map comes from E→E/m; the right is the Bockstein landing in the m-torsion subgroup. It need not split: π₂(S/2)=ℤ/4 is an extension of ℤ/2 by ℤ/2. In the shifted Eilenberg–Mac Lane example ΣH(ℤ/2) at n=2, the quotient term is zero and the torsion term is ℤ/2, which pins the one-degree shift.

(W IV Def. 2.1, 2.1.1, Universal Coefficient Sequence 2.2, Example 2.2.1, Prop. 2.3, 2.3.1, Def. 2.4, Thm. 2.5, Prop. 2.7, pp. IV.18–21; S II, Prop. 6.48, p. 287; S II, after (6.50), p. 288.)

*Needs:* §7.3, §7.1, M.

### 7.5 Peterson’s coefficient splitting

For m odd or 4 dividing m prove that the preceding coefficient short exact sequence splits for every spectrum and integer degree. Specify existence of a splitting, with no naturality assertion for chosen splittings. At m=2 the ℤ/4 example excludes the conclusion; at m=1 every coefficient term is zero. The positive-modulus theorem is distinct from the formal splitting of the extended zero cone.

(W IV after 2.1.1, p. IV.18; Universal Coefficient Sequence 2.2, p. IV.19.)

*Needs:* §7.4, §7.1.

### 7.6 Coprime decomposition of Moore spectra

For positive coprime q₁,q₂ construct the sum S/q₁∨S/q₂→S/(q₁q₂), with first inclusion multiplication by q₂ on π₀ and second by q₁, and prove it invertible. Smashing gives the product decomposition of coefficient π-groups, natural in E. For q₁=2,q₂=3 the two generators go to 3 and 2 modulo 6; this fixes the two inclusions, not just an unspecified Chinese-remainder isomorphism.

**Checks.**

- `chinese_remainder_generators`: For moduli 2,3 the CRT inclusions send 1 to 3 and 2 modulo 6.

(W IV Prop. 2.7, p. IV.21.)

*Needs:* §7.1, §7.4, §7.2, §5.19.

### 7.7 Transition maps between Moore spectra and the mod-p^r tower

Fix prime p. Choose inclusions S/pʳ→S/pʳ⁺¹ by the square (identity,p) on the two sphere terms, and reductions in the reverse direction by (p,identity). Their Bocksteins satisfy δᵣ₊₁ιᵣ=δᵣ and δᵣρᵣ=pδᵣ₊₁. On the coefficient short exact sequence, inclusion acts by multiplication by p on the quotient and identity on torsion, while reduction acts by reduction on the quotient and multiplication by p on torsion. For p=2,r=1, inclusion sends 1 mod 2 to 2 mod 4 and reduction sends 1 mod 4 to 1 mod 2. Build coherent point-set coefficient diagrams; at p=2 choices of Moore lifts need not be unique. The harmless r=0 term is S/1=0.

- `moore.incl`: S/pʳ→S/pʳ⁺¹ induces multiplication by p.
- `moore.reduce`: S/pʳ⁺¹→S/pʳ induces reduction.
- `moore.incl_bockstein`: Inclusion is a triangle map with sphere components (1,p), so δ∘incl=δ.
- `modTower`: The inverse tower E/pʳ with reduction transitions.
- `modTower.uct`: UCT transition: reduction on the quotient term, multiplication by p on the torsion term.

**Checks.**

- `moore_incl_H0`: H₀(moore.incl p r) is multiplication by p : ZMod (p^r) → ZMod (p^(r+1)).
- `moore_reduce_H0`: H₀(moore.reduce p r) is the reduction ZMod (p^(r+1)) → ZMod (p^r).
- `modTower_HZ`: For E = HZ the tower is the tower of H(ℤ/p^r) with reduction maps.
- `moore_incl_not_unique_p2`: For p = 2 the lift of multiplication by 2 to moore 2 ⟶ moore 4 is not unique: two lifts differ by a map factoring through η.
- `transition_two`: At p=2,r=1 inclusion sends 1 mod 2 to 2 mod 4; reduction sends 1 mod 4 to 1 mod 2.

(S II, Thm. 9.9(iii), p. 304; W IV 2.9 The ℓ-adic completion, p. IV.22.)

*Needs:* §7.1, §7.2, §5.21.

### 7.8 ℚ_p/ℤ_p coefficients and their universal coefficient sequence

Form S/p∞ as the telescope of the inclusions, and identify its degree-zero homology with ℚₚ/ℤₚ. For every E show E∧ᴸS/p∞=hocolim E/pʳ and derive 0→πₙE⊗ℚₚ/ℤₚ→πₙ(E;ℚₚ/ℤₚ)→πₙ₋₁E{p}→0. Here A{p} is the union of its p-power torsion subgroups. When πₙ₊₁E is finite the tensor term in degree n+1 vanishes and gives the torsion identification. The colimit uses inclusion maps, rather than reduction maps.

(S II, §9.3, p. 303; W IV 2.9 The ℓ-adic completion, p. IV.22.)

*Needs:* §7.7, §5.37, §7.4, §5.23, §7.2.

### 7.9 Homotopy limits of towers of spectra

For a countable tower X in SHC choose a fibre of 1−shift:∏Xᵣ→∏Xᵣ and compatible projections to its terms, giving the homotopy-limit triangle. A morphism of towers extends to a morphism of these triangles by TR3, without uniqueness or functor laws for the selected lift. Separately construct a functorial homotopy limit on coherent point-set towers by fibrant diagram replacement and a tower of fibrations, and identify its image with the triangle model. The separate construction is required whenever later naturality uses functorial limits.

- `holimTower`: The fibre triangle of 1−shift on ∏Xₙ and its projections.
- `holimTower.map`: Choose a triangle-completion map compatible with projections; uniqueness/functoriality is asserted only for coherent models.
- `holimTower.const`: The identity-transition constant tower has holim≅X.
- `towerLimit`: A stable-fibration tower of stably fibrant spectra has point-set limit representing holim.

**Checks.**

- `holimTower_const`: holimTower (constant tower at X, identity maps) ≅ X.
- `holimTower_zero_maps`: For a tower with all transition maps zero, lim and lim¹ of every tower π_k X_r vanish, so π_k(holimTower X) = 0 for all k and holimTower X ≅ 0 (via §7.10).
- `holimTower_point_set_compat`: For a tower of stable fibrations of Ω-spectra, holimTower is represented by the levelwise limit.
- `holimTower_not_lim_pi`: pi of holimTower is not lim of pi in general: for S ←(p) S ←(p) ⋯, lim pi₀ = 0 but pi_{−1} holimTower ≅ ℤ_p/ℤ ≠ 0 (§7.11).

(S II, Def. 5.3, p. 256; proof of Thm. 8.3, p. 297.)

*Needs:* §5.15, §5.21, §5.14, §5.20.

### 7.10 The Milnor lim¹ sequence for homotopy limits of towers

Build the countable abelian-tower limit and lim¹ as kernel and cokernel of 1−shift on the product. Prove the six-term exact sequence and agreement with derived inverse limit, plus lim¹ vanishing for Mittag-Leffler towers, in particular surjective towers or towers of finite groups. Apply these algebraic targets to obtain 0→lim¹πₖ₊₁Xᵣ→πₖholim X→limπₖXᵣ→0. Naturality is for maps of defining triangles, or for coherent point-set maps and the functorial construction. This algebraic foundation is local and precedes completion. **Foundation API:** `abelianTower.difference` sends (xᵣ) to (xᵣ−fᵣxᵣ₊₁); `abelianTower.limitKernel`, `abelianTower.limOneCokernel`, `abelianTower.sixTermExact`, `abelianTower.limOne_eq_zero_of_ML`. (Boardman, Eq. (1.3) and Thm. 1.4, p. 5.)

**Checks.**

- `tower_identity`: the identity tower has limit A and lim¹=0.
- `tower_zero_maps`: zero transition maps make the difference identity, so both groups are zero.
- `tower_surjective`: surjectivity lets one solve the difference equation recursively and gives lim¹=0; multiplication by p on ℤ fails this hypothesis.

(S II, proof of Thm. 8.3, p. 297; S II, Lemma 5.6 and Remark 5.9, pp. 257–258; W IV 2.9 The ℓ-adic completion, p. IV.22.)

*Needs:* §7.9, §7.10, §5.12, §5.20, M.

### 7.11 A tower with nonzero lim¹

For prime p, the sphere tower with transition p·id has lim π₀=0 and lim¹π₀=ℤₚ/ℤ, hence π₋₁holim=ℤₚ/ℤ although every term has π₋₁=0. Define `multiplicationTower.limOneEquiv` by (xₙ)↦∑pⁿxₙ mod ℤ. The series converges p-adically; on xₙ=yₙ−pyₙ₊₁ it telescopes to y₀. Digits prove surjectivity. If the sum is z∈ℤ, y₀=z and yₙ₊₁=(yₙ−xₙ)/p are integers by the partial-sum congruences and solve the difference equation. Infinite p-divisibility forces the inverse limit to zero. At p=2, 1/3 gives a nonzero coset.

(S II, Remark 5.9, p. 258.)

*Needs:* §7.10, M.

### 7.12 p-completion of spectra

For prime p define E∧ₚ=F(S/p∞,ΣE), with the unit adjoint to the smashed Bockstein, and identify it with holim E/pʳ along reductions. Construct its functor, exactness and natural unit, and prove p-locality, idempotence and independence of the coherent models. Define p-completeness by invertibility of this unit. The internal function spectrum and the specified reduction tower give the same completion, with an identified unit, rather than just isomorphic underlying objects.

- `pCompletion`: F(S/p∞,ΣE), with unit adjoint to id∧δ.
- `pCompletion.functor`: The exact completion functor with its object comparison.
- `IsPComplete`: Its unit is invertible.
- `pCompletion.isPComplete`: For prime p, E^∧ₚ is complete.
- `pCompletion.isoHolim`: For prime p, E^∧ₚ≅holim(E/pʳ).

**Checks.**

- `pCompletion_zero`: pCompletion p 0 = 0.
- `pCompletion_sphere_pi0`: pi (pCompletion p sphere) 0 ≅ ℤ_p (PadicInt p).
- `pCompletion_HQ`: pCompletion p (eilenbergMacLane ℚ) = 0, since Ext(ℤ/p^∞, ℚ) = Hom(ℤ/p^∞, ℚ) = 0 (§7.14).
- `pCompletion_not_tensor`: pi (pCompletion p (eilenbergMacLane (ℚ/ℤ))) 1 ≅ Hom(ℤ/p^∞, ℚ/ℤ) = ℤ_p (the Tate module), not π₁ ⊗ ℤ_p = 0: completion of π-groups is not tensoring with ℤ_p.

(S II, §9.3 and Thm. 9.9(iii), pp. 303–304; W IV 2.9 The ℓ-adic completion, p. IV.22.)

*Needs:* §7.9, §7.7, §7.2, §5.23, §7.8.

### 7.13 The completion extension and Tate module

Apply Milnor to the reduction tower, retaining the lim¹ term in πₙ(E∧ₚ). Taking the inverse limit of the coefficient short exact sequences gives 0→lim πₙE/pʳ→lim πₙ(E/pʳ)→Tₚπₙ₋₁E→0; the quotient tower is surjective and has zero lim¹. If the degree-(n+1) coefficient groups are finite, the Milnor lim¹ term also vanishes. This identifies the Tate-module contribution and states exactly which finiteness hypothesis removes which derived-limit term.

(W IV 2.9 The ℓ-adic completion, p. IV.22.)

*Needs:* §7.10, §7.12, §7.4, §7.7.

### 7.14 Homotopy groups of the p-completion: Ext and Hom

Prove the extension 0→Ext¹ℤ(ℤ/p∞,πₖE)→πₖ(E∧ₚ)→Homℤ(ℤ/p∞,πₖ₋₁E)→0. Construct these Hom and Ext comparisons from the coefficient systems and the derived abelian-tower computation; identify Hom with the Tate module. For bounded p-torsion, Ext agrees with ordinary p-adic completion because the inverse tower of torsion terms is pro-zero. This does not claim the individual finite-modulus Ext groups vanish. For arbitrary abelian A construct `generalMoore A` from a free presentation, connective with H₀=A and other integral homology zero. Prove `generalMoore.mappingUCT`: 0→Ext¹(A,π₁X)→[generalMoore A,X]→Hom(A,π₀X)→0. It gives the Prüfer-group case after shift; no functorial choice for all A is asserted. (S, Constr. II.6.39, Eq. (6.42), Thm. 6.43, pp. 285–286.)

**Checks.**

- `general_moore_zero`: A=0 gives zero.
- `general_moore_free`: A=ℤ gives S; the Ext term vanishes.
- `general_moore_two`: for A=ℤ/2 and X=S/2 the Ext term is nonzero, so π₀ does not determine the spectrum map uniquely.

(S II, Thm. 9.9(iv), (9.10), p. 304.)

*Needs:* §7.12, §7.8, §7.1.

### 7.15 Completion for finitely generated homotopy

If πₖE and πₖ₋₁E are finitely generated, identify πₖ(E∧ₚ) with πₖE⊗ℤₚ, naturally and compatibly with the unit. Prove the algebraic completion–tensor comparison for finitely generated abelian groups and the comparison between Mathlib's adic completion of ℤ at (p) and PadicInt p. For a shifted H(ℚₚ/ℤₚ), the Tate module survives and excludes the same formula without finite generation. Name `completionZEquiv`: AdicCompletion((p),ℤ)≃+*ℤₚ for prime p, characterized by all residue projections. Construct it from Mathlib’s `PadicInt.toZModPow`, `PadicInt.lift`, `PadicInt.lift_spec` and `PadicInt.lift_unique`, with inverse given by compatible residues. The finite-group summand is retained, so ℤ/p completes to ℤ/p, whereas a finite ℓ-group for ℓ≠p completes to zero.

**Checks.**

- `completion_integer_one`: every residue projection sends the completed integer 1 to 1.
- `completion_mod_p`: completion preserves ℤ/p.
- `completion_other_prime`: completion of ℤ/ℓ is zero for distinct primes ℓ,p.

(S II, Thm. 9.9(iv), p. 304; W IV 2.9, p. IV.22; S II, Remark 9.12 and the following paragraph, p. 306.)

*Needs:* §7.14, M.

### 7.16 Criteria for p-completeness

Construct S[1/p] as the p-multiplication telescope. Prove that p-completeness is equivalent to F(S[1/p],E)=0, and to vanishing of the homotopy limit of the multiplication-by-p E tower. These are predicates on the specified unit and the specified multiplication maps. Hℚ is killed by completion and is not p-complete unless zero; H(ℤ/p) is complete.

(S II, Remark 9.8 and Thm. 9.9, pp. 303–304; W IV 2.9, p. IV.22.)

*Needs:* §7.12, §7.10, §5.37, §7.8, §7.9, §5.23.

### 7.17 Mod-p equivalence detects equivalences of complete spectra

For maps between p-complete spectra prove that invertibility is detected by derived smash with S/p. Use the fibre, the closure theorem and the completeness criterion to show a complete fibre with zero mod-p reduction is zero. Without completeness a rational spectrum has zero mod-p reduction while remaining nonzero, so the hypothesis cannot be omitted.

(S II, Remark 9.8 and Thm. 9.9, pp. 303–304; W IV 2.9, p. IV.22.)

*Needs:* §7.16, §7.18, §7.2, §7.9, §5.21.

### 7.18 Closure properties of complete spectra

Prove closure of p-complete spectra under fibres, cofibres, retracts, arbitrary products and coherent homotopy limits of countable towers. Use the internal-Hom vanishing criterion and exactness. Do not infer closure under arbitrary coproducts: infinite sums of complete abelian groups need not be derived complete.

(S II, Remark 9.8 and Thm. 9.9, pp. 303–304; W IV 2.9, p. IV.22.)

*Needs:* §7.16, §5.23, §5.20, §7.9, §5.21.

### 7.19 Prime-power coefficient spectra are complete

Show E/pʳ is p-complete for every E and r≥1. The coefficient extension implies that p²ʳ kills each homotopy group, enough for the bounded-exponent theorem. It does not imply pʳ kills them: π₂(S/2)=ℤ/4 is the negative control. The r=0 extended term is zero and is also complete.

**Checks.**

- `torsion_bound_two`: π₂(S/2)=ℤ/4, so annihilation by 2 is false while annihilation by 4 holds.

(S II, Remark 9.8 and Thm. 9.9, pp. 303–304; W IV 2.9, p. IV.22.)

*Needs:* §7.20, §7.4, §7.2.

### 7.20 Bounded p-power exponent implies completeness

If one fixed pᴺ kills all π-groups of E, prove E is p-complete by the multiplication-tower criterion. A fixed degreewise bound proves the needed vanishing in that degree; the uniform bound is a sufficient reusable form. N=0 forces E=0. Keep the prime hypothesis in the signatures and distinguish bounded torsion from general unbounded p-primary torsion.

(S II, Remark 9.8 and Thm. 9.9, pp. 303–304; W IV 2.9, p. IV.22.)

*Needs:* §7.16, §7.10.

### 7.21 Rationalisation of spectra

Define the rational sphere by the telescope whose adjacent stage-n map is (n+1)·identity on S, starting with multiplication by one. Set Eℚ=Sℚ∧ᴸE and construct the unit. Prove exactness, coproduct preservation and πₖ(Eℚ)=πₖE⊗ℚ; identify it with the multiplication telescope on E. Rational means the unit is invertible, equivalently all π-groups are uniquely divisible; the unit gives the universal map into every rational spectrum. The stage-zero transition is one, not zero.

- `rationalization`: Sℚ∧ᴸE with its natural unit.
- `rationalization.pi`: πₖ(Eℚ)≅πₖE⊗ℚ.
- `IsRational`: All πₖ are uniquely divisible↔the rationalisation unit is invertible.
- `rationalizationFunctor`: The exact coproduct-preserving tensor functor, acting by id∧f.
- `rationalization.unit_natural`: The unit square commutes for every f.
- `rationalization.homEquiv`: For rational T, precomposition by E→Eℚ gives SHC(Eℚ,T)≅SHC(E,T).

**Checks.**

- `rationalization_zero`: rationalization 0 = 0.
- `rationalization_HZp`: rationalization (eilenbergMacLane (ZMod p)) = 0, matching (ℤ/p) ⊗ ℚ = 0.
- `rationalization_moore_zero`: rationalization (moore p) = 0 although moore p ≠ 0: rationalisation is not faithful on finite spectra.
- `rationalization_pi_zero_sphere`: pi (rationalization sphere) 0 ≅ ℚ (colim of ℤ →1 ℤ →2 ℤ →3 ⋯).
- `telescope_first_map`: The first two maps of the rational telescope multiply by 1 then 2, not by 0 then 1.

(S II, Theorems 9.2 and 9.6, pp. 300–302.)

*Needs:* §5.37, §5.30, §5.23, §7.10.

### 7.22 Rational spectra are generalized Eilenberg–Mac Lane spectra

Prove the Serre stable-stem finiteness input, or its sufficient rational vanishing form, from the mod-Serre-class Hurewicz theorem and stable suspension range. Identify Sℚ with Hℚ. For graded rational vector spaces V define HV=∏ₙΣⁿHVₙ and prove [A,HV]≅Hom_gr(π*A,V) for every A. Deduce the equivalence of rational spectra with graded ℚ-vector spaces, with the unique identity-on-homotopy map E→Hπ*E. The product includes all integer degrees, so no connectivity assumption is hidden.

- `rational_generalizedEM`: A rational E≅∏ₖΣᵏH(πₖE).
- `rationalization.smashHQ`: Eℚ≅Hℚ∧ᴸE.

**Checks.**

- `rationalization_sphere`: rationalization sphere ≅ eilenbergMacLane ℚ.

(S II, Thm. 9.6, p. 302; S I, Thm. 1.9, p. 12.)

*Needs:* §7.21, §5.30, §5.20, §5.23, §5.21.

### 7.23 The arithmetic fracture square

For every E prove the arithmetic fracture square and the distinguished triangle E→Eℚ⊕∏ₚE∧ₚ→(∏ₚE∧ₚ)ℚ→ΣE. The first arrow is the pair of units and the second is the difference of the two maps to the rationalised product. Construct the comparison F(cofib(S→Sℚ),ΣE)≅∏ₚE∧ₚ. Rationalisation stays outside the product: ℚ⊗∏ℤₚ and ∏ℚₚ are different. The finite-type homotopy corollary uses the preceding finite-generation theorem in each relevant degree.

(S II, Thm. 9.9(i)–(ii) and the following paragraph, p. 304.)

*Needs:* §7.21, §7.12, §5.21, §7.15, §5.20, §5.23, §7.8.

### 7.24 Filtered spectra, towers and their associated graded

A filtered spectrum is a coherent point-set diagram ℤ→Sp, localised at objectwise stable equivalences. Define grₛ by derived cofibre Xₛ₋₁→Xₛ, and build functorial replacements and all relative-cofibre comparisons needed by the spectral object. With a coherent augmentation to E, define exhaustiveness by hocolim X→E being an equivalence, bounded-below by eventual zero on the negative end, and completeness by holim on that end being zero. Identify exhaustiveness with the compatible homotopy-group criterion. The SHC-valued diagram is a consequence of this input, not a substitute for its coherence. Name `FilteredSpectrum.replace` for functorial objectwise replacement and `relativeCofibreSpectralObject` for all interval cofibres and connecting maps; coherent commuting cubes prove its exactness and octahedral identities.

- `FilteredSpectrum`: A coherent integer filtration, represented by ℤ→SymmSpectrum.
- `FilteredSpectrum.gr`: gr_s=cofib(X_s₋₁→X_s), with its triangle.
- `FilteredSpectrum.IsExhaustive`: The filtered hocolim-to-target map is invertible.
- `FilteredSpectrum.IsComplete`: The negative-direction holim is zero.
- `FilteredSpectrum.IsBoundedBelow`: X_s=0 for all sufficiently negative s.
- `FilteredSpectrum.toSpectralObject`: Coherent relative cofibres form a spectral object, satisfying all identities and invariant under replacement.

**Checks.**

- `filteredSpectrum_const`: The constant filtration X s = X has gr = 0 and is exhaustive but not complete (unless X = 0).
- `filteredSpectrum_postnikov_gr`: For the Whitehead filtration X_s = τ_{≥−s}X, gr_s ≅ Σ^{−s}H(π_{−s}X).
- `filteredSpectrum_spectralObject_compat`: toSpectralObject followed by pi_0 (Mathlib mapHomologicalFunctor) is an abelian spectral object whose E₁ terms are pi of gr.
- `filteredSpectrum_complete_not_exhaustive`: The zero filtration of nonzero E is complete but not exhaustive. The constant E filtration is exhaustive but not complete.

(HA §1.2.2, Def. 1.2.2.9, p. 52.)

*Needs:* §5.15, §5.16, §5.37, §7.9, §5.14.

### 7.25 Exact couples and their derived couples

Define a bigraded exact couple in any abelian category: D→iD→jE→kD, of degrees a,b,c and exact at each vertex. Construct its derived couple with D′=image i, E′=H(E,jk), and degrees a,b−a,c; iterate to the pages. In the homological convention a=(1,−1),b=(0,0),c=(−1,0), dᵣ has degree (−r,r−1), lowering total degree by one. In the two-column case δₙ:E₁,ₙ→E₀,ₙ and 0→coker δₙ→D₁,ₙ₋₁→ker δₙ₋₁→0 fix the extension indexing. Exactness imposes ji=kj=ik=0; it does not impose i²=0. For D=E=ℤ², i(x,y)=(x,0), j(x,y)=(y,0), k(x,y)=(0,y) gives an exact couple with i²=i≠0.

- `ExactCouple`: Bigraded D,E and maps i,j,k of degrees a,b,c, exact at all three vertices.
- `ExactCouple.derived`: D′=im i, E′=ker(jk)/im(jk); j-degree becomes b−a.
- `ExactCouple.page`: Page r≥1 is E of the (r−1)-derived couple; d_r has degree c+b−(r−1)a.
- `ExactCouple.toSpectralSequence`: For a=(1,−1),b=(0,0),c=(−1,0), d_r has degree (−r,r−1).
- `ExactCouple.twoStageBoundary`: δ_n=k then j: E_(1,n)→E_(0,n), i.e. πₙ₊₁gr₁→πₙX₀.
- `ExactCouple.twoStageCokernelIncl`: If negative D-columns vanish, coker δ_n→D_(1,n−1).
- `ExactCouple.twoStageKernelProj`: Under that hypothesis, D_(1,n−1)→ker δ_n₋₁.
- `ExactCouple.twoStageExtension`: The displayed cokernel–D–kernel complex is short exact, without a splitting assertion.

**Checks.**

- `exactCouple_zero_E`: For any bidegrees and an exact couple with every E(p,q) zero, every i(p,q) is an isomorphism and every page at every bidegree is zero.
- `exactCouple_two_stage`: With D=0 for p<0 and E supported in columns 0,1, pages r≥2 equal E². The abutment is the unsplit extension 0→coker δₙ→D(1,n−1)→ker δₙ₋₁→0; for X₀→X₁=X use δ:πₙ₊₁gr₁→πₙX₀.
- `exactCouple_not_complex`: The constant tuple couple i(x,y)=(x,0), j(x,y)=(y,0), k(x,y)=(0,y) is exact. j∘k=0, but i²=i and i²(1,0)=(1,0).
- `exact_idempotent`: For i(x,y)=(x,0), j(x,y)=(y,0), k(x,y)=(0,y), the couple is exact and i²(1,0)=(1,0).

(HA §1.2.2, Construction 1.2.2.6 and Prop. 1.2.2.7, p. 49.)

*Needs:* AlgebraicTopology, M.

### 7.26 The spectral sequence of a filtered spectrum

Construct the filtration spectral object and apply the homological π-functor to obtain E¹ₛ,ₜ=πₛ₊ₜgrₛ and dᵣ:(s,t)→(s−r,t+r−1), natural in coherent maps. Identify it with the derived exact-couple pages and with Mathlib's spectral-object pages, whose core starts at page two. Use endpoints p−r,p−1,p,p+r−1 and cochain degree −(p+q). The candidate abutment is π*hocolim X with filtration image(πₙXₛ→πₙhocolim X); convergence is a further theorem.

- `FilteredSpectrum.spectralSequence`: The spectral sequence with E¹_s,t=π_s₊t(gr_s).
- `FilteredSpectrum.spectralSequence.E1`: The E¹ identification sends d₁ to the composite through ΣX_s₋₁→Σgr_s₋₁.
- `FilteredSpectrum.spectralSequence.map`: A strict filtered-model transformation gives a spectral-sequence map, invariant under stable replacement.
- `FilteredSpectrum.abutmentFiltration`: The image filtration F_sπₙE=im(πₙX_s→πₙE) for an exhaustive target cocone.
- `FilteredSpectrum.exactCouple`: D_s,t=π_s₊tX_s; E_s,t=π_s₊tgr_s, with degrees (1,−1),(0,0),(−1,0).
- `FilteredSpectrum.coreE₁Homological`: The homological core uses deg(p,q)=−p−q and indices p−r,p−1,p,p+r−1, giving d_r:(p,q)→(p−r,q+r−1).

**Checks.**

- `spectralSequence_trivial`: For the zero filtered spectrum all pages vanish.
- `spectralSequence_single_step`: For X concentrated in one filtration step, E¹ = E^∞ = π_* of that step.
- `spectralSequence_compat_exactCouple`: The spectral sequence agrees with that of the exact couple (§7.25).
- `spectralSequence_E2_not_abutment`: The constant nonzero filtration has E¹=0 and nonzero colimit π. It is exhaustive but not bounded below, so its zero pages do not compute the abutment.

(HA §1.2.2, Def. 1.2.2.9, p. 52; W IV Exercise 3.7, p. IV.34.)

*Needs:* §7.24, §7.25, §5.21, §5.17, M.

### 7.27 Convergence for exhaustive filtrations bounded below

For an exhaustive filtration bounded below, prove strong convergence to π*E and E∞ₛ,ₜ=Fₛπₛ₊ₜ/Fₛ₋₁πₛ₊ₜ. The filtration on each homotopy group is exhaustive and zero sufficiently far left, and the exiting differentials eventually vanish at each position. A finite filtration gives collapse at a finite page. No connective hypothesis on E is required for this homological, bounded-below filtration theorem.

(HA §1.2.2, Prop. 1.2.2.14 and proof, pp. 52–53.)

*Needs:* §7.26, §5.37, §5.36.

### 7.28 Convergence for towers with fibres of increasing connectivity

For a tower Y indexed by s≥0, set F₀=Y₀ and Fₛ=fib(Yₛ→Yₛ₋₁), and L=holim Y. Use Xᵢ=fib(L→Y₋ᵢ₋₁), extending Yₛ=0 for s<0; then gr₋ₛX≅Fₛ. This gives E¹ₛ,ₜ=πₜ₋ₛFₛ and dᵣ:(s,t)→(s+r,t+r−1). If the fibres' connectivity tends uniformly to infinity in each fixed degree, prove Milnor lim¹ vanishes and strong convergence to π*L. For a tower under E, identify E→L as an equivalence exactly when holim fib(E→Yₛ)=0. A bare reversal Y₋ᵢ instead has colimit zero and the wrong graded shift.

(S II, proof of Thm. 8.3, p. 297.)

*Needs:* §7.26, §7.10, §7.27, §7.9.

### 7.29 Conditional and strong convergence for complete towers (Boardman)

Use Boardman’s indexing i:Aˢ⁺¹→Aˢ. Put A⁺=limₛ Aˢ, RA⁺=lim¹ₛ Aˢ and A⁻=colimₛ→−∞ Aˢ. Define Zʳ as the r-cycle groups, RE∞=lim¹ʳZʳ, K∞Aˢ=ker(Aˢ→A⁻), and W=colimₛ lim¹ʳ(K∞Aˢ∩im(Aˢ⁺ʳ→Aˢ)). Conditional convergence to A⁻ requires A⁺=RA⁺=0; conditional convergence to A⁺ requires A⁻=0. For the complete tower above with a half-plane of entering differentials, conditional convergence and RE∞=0 imply strong convergence. Finite first-page groups ensure the cycle towers are Mittag–Leffler. For a whole-plane sequence require W=0 as well. Register the conversion to the increasing homological indexing of §7.27; completeness and page stabilisation do not replace these hypotheses.

(S II, proof of Thm. 8.3, p. 297; Boardman, Def. 5.10, p. 19; Thm. 7.1, p. 20; Thm. 8.2, p. 24; Eq. (8.7), p. 25.)

*Needs:* §7.28, §7.10, §7.9.

### 7.30 The Atiyah–Hirzebruch spectral sequence

For any spectrum E and CW complex X, use the skeletal coherent filtration of E∧ᴸΣ∞₊X. Prove E²ₚ,q=Hₚ(X;π_qE), with dᵣ of the homological degree above, and strong convergence to πₚ₊q(E∧ᴸΣ∞₊X), by the bounded-below exhaustive filtration theorem. Finite dimensionality of X or bounded-below E makes each total-degree diagonal finite. For X=BG the coefficient calculation is the group-homology comparison of Layer 1; for E=HA it reduces to cellular/singular homology. The analogous cohomological sequence has separate convergence conditions.

(HA §1.2.2, Def. 1.2.2.9, p. 52.)

*Needs:* §7.26, §7.27, §5.5, §5.23, §1.32, AlgebraicTopology, §5.37.

### 7.31 Products on mod-ℓ^ν homotopy

For prime powers pʳ outside {2,3,4,8}, construct a homotopy associative and commutative unital Moore multiplication and the graded-commutative ring for a homotopy associative and commutative E. Record the distinctions at the exceptions: S/2 has no unital multiplication; S/3 has no homotopy associative multiplication; the Araki–Toda choice at 4 need not be associative and at 4 or 8 need not be commutative. Existence of another associative product on S/4 and the E₁ product on S/8 are compatible with these distinctions.

(W IV Thm. 2.8, p. IV.21; Bu Introduction, p. 1.)

*Needs:* §7.1, §5.25, §5.27.

### 7.32 Burklund's towers of E_n-algebra quotients

In a stable, stably Eₘ-monoidal ∞-category, m≥2, fix v:I→1 such that cofib(v) admits a right unital multiplication. Construct the specified v-compatible structures on 1/vᑫ as Eₙ-algebras for n≤m and q>n, with the reduction tower of Eₙ-algebra maps for q≥n+1. Prove uniqueness up to equivalence among v-compatible structures as defined in the source, not among every possible Eₙ structure on the carrier. Construct the abstract Eₙ interfaces and their concrete spectrum comparison in Layer 5, so no later abstract-sheaf package is a prerequisite.

(Bu Thm. 1.5, p. 2; Bu Thm. 5.2, p. 10; Bu Remark 5.7, p. 12.)

*Needs:* §7.1, §5.29, §5.29 and §5.40, §7.7.

### 7.33 Browder’s mod-coefficient products

For a homotopy associative and commutative ring spectrum E with πₖE=0 in negative degrees and in positive even degrees, prove homotopy associative and commutative products on E/pʳ for every prime power, including the four exceptional Moore moduli. Construct the unit and product and their compatibility with E→E/pʳ. The vanishing applies to E, not to the coefficient spectrum, so this statement does not force an impossible unital product on S/2.

(W IV Scholium 2.8.1, p. IV.21.)

*Needs:* §7.31, §5.27.

### 7.34 Burklund's E_n-algebra structures on Moore spectra

Construct the Eₙ-algebra structures on S/pᑫ in the specified ranges: q≥n+1 at odd primes and 2q≥3(n+1) at p=2. Thus S/8 is E₁ and S/32 is E₂, while S/p² is E₁ for odd p. Identify these with the abstract-algebra and concrete-spectrum comparison of Layer 5; the general quotient tower has the v-compatible uniqueness just stated, rather than uniqueness of arbitrary Moore algebra structures.

(Bu Theorems 1.1 and 1.2, p. 1.)

*Needs:* §7.1, §5.29, §5.29 and §5.40, §7.7, §7.32.

### Examples

For E = Hℤ, E/p has π₀ = ℤ/p and no extra degree-zero summand. For E = H(ℤ/p), its Bockstein sequence has a quotient term in degree zero and a torsion term in degree one. The doubling tower of ℤ has lim¹ = ℤ₂/ℤ. An exact couple can have E = 0 and nonzero D, and its i-map need not square to zero.

### Dependencies

Layers 3 and 5–6, abelian/spectral-object APIs and local tower/Ext foundations; prime, finiteness and convergence conditions remain explicit.

## Downstream consumers

General algebraic K-theory uses these category constructions, plus comparisons, K-theory spectra, products and coefficients. Low-degree K-theory and regulators use the central-extension comparisons. Étale and motivic K-theory use coherent spectra and filtered convergence. Abstract derived-sheaf theory uses the concrete stable presentation and operadic comparisons; arithmetic-duality developments use the countable-tower algebra. Each consumer imports these interfaces with the connectivity, prime and finiteness conditions.

## References

- Daniel Quillen, [Higher algebraic K-theory: I](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf), Lecture Notes in Mathematics 341 (1973), pp. 85–147; locators use printed LNM pages.
- Charles A. Weibel, [The K-book: An introduction to algebraic K-theory, Chapter IV: Definitions of higher K-theory](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), online Chapter IV; chapter page numbers.
- Charles A. Weibel, [The K-book: An introduction to algebraic K-theory, Chapter V: The fundamental theorems of higher K-theory](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), online Chapter V; chapter page numbers.
- Gunnar Carlsson; volume editors Eric M. Friedlander and Daniel R. Grayson, [Deloopings in algebraic K-theory (Handbook of K-theory, vol. 1, chapter I.1)](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/carldeloop.pdf), Handbook of K-theory I (2005), pp. 3–37; locators use printed pages.
- Allen Hatcher, [Algebraic Topology](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf), author’s online edition; printed pages and numbering of the 2002 edition.
- Stefan Schwede, [Symmetric spectra (book project)](https://www.math.uni-bonn.de/~schwede/SymSpec-v3.pdf), preliminary version 3.0, 12 April 2012; printed pages.
- Mark Hovey, Brooke Shipley, Jeff Smith, [Symmetric spectra](https://arxiv.org/abs/math/9801077v2), arXiv:math/9801077v2; manuscript pages.
- Thomas Nikolaus, Peter Scholze, [On topological cyclic homology](https://arxiv.org/abs/1707.01799), arXiv:1707.01799, 169-page version; manuscript pages.
- Bhargav Bhatt, Peter Scholze, [Projectivity of the Witt vector affine Grassmannian](https://arxiv.org/abs/1507.06490v3), arXiv:1507.06490v3; manuscript pages.
- B. Calmès, E. Dotto, Y. Harpaz, F. Hebestreit, M. Land, K. Moi, D. Nardin, T. Nikolaus, W. Steimle, [Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings](https://arxiv.org/abs/2009.07225), arXiv:2009.07225, 63-page version; manuscript pages.
- Robert Burklund, [Multiplicative structures on Moore spectra](https://arxiv.org/abs/2203.14787), arXiv:2203.14787, 20-page version; manuscript pages.
- Jacob Lurie, [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), September 2017 author’s edition; printed pages.
- Allen Hatcher, [Spectral Sequences (Chapter 1 of the book project 'Spectral Sequences in Algebraic Topology')](https://pi.math.cornell.edu/~hatcher/SSAT/SSch1.pdf), author’s SSch1.pdf, 67-page version; chapter pages.
- Bruno Kahn, [Towards a functorial construction of Quillen's rank spectral sequence (rank spectral sequence note)](https://arxiv.org/abs/1108.2441v3), arXiv:1108.2441v3; manuscript pages.
- Brooke Shipley, [HZ-algebra spectra are differential graded algebras](https://arxiv.org/abs/math/0209215), arXiv:math/0209215, 22-page version; manuscript pages.
- A. K. Bousfield and E. M. Friedlander, [Homotopy theory of Γ-spaces, spectra, and bisimplicial sets](https://ncatlab.org/nlab/files/BousfieldFriedlanderSpectra.pdf), Lecture Notes in Mathematics 658 (1978), pp. 80–130; printed pages.
- J. P. May, [Weak equivalences and quasifibrations](https://math.uchicago.edu/~may/PAPERS/67.pdf), 1990, pp. 91–101.
- O. Randal-Williams, [Group-completion, local coefficient systems and perfection](https://www.dpmms.cam.ac.uk/~or257/notes/GCrem.pdf), 2013.
- F. Waldhausen, [Algebraic K-theory of spaces](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/kspaces.pdf), 1985, §§1.1–1.5.
- C. Weibel, [The K-book, Chapter III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), §1.3 and §§5.3–5.4.
- J. M. Boardman, [Conditionally convergent spectral sequences](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/boardman-SS.pdf), 1999, Def. 5.10 and Thms. 7.1, 8.2.
- D. Pavlov and J. Scholbach, [Symmetric operads in abstract symmetric spectra](https://arxiv.org/abs/1410.5699), 2018 manuscript, Thms. 4.1, 4.6 and 4.9, pp. 17–19.
