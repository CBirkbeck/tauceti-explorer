# Roadmap: pro-étale descent, diamonds and small v-stacks

Diamonds make it possible to use perfectoid covers to study spaces that are not themselves perfectoid. This roadmap constructs their ordinary sheaf and groupoid-valued stack foundations, develops spatial geometry, and relates analytic and integral pre-adic spaces to v-sheaves. Its outputs include quotient presentations, an atlas-independent underlying space, effective descent for the morphism classes used in those presentations, and the analytic étale-site comparison. These are the geometric inputs for diamond étale cohomology, the six operations, and the diamond descriptions of period spaces and Shimura varieties.

## Scope and ownership

Tau Ceti already has, and this roadmap uses without restating: the pro-constructible calculus and the spectrality of pro-constructible subspaces (`TauCeti.IsProConstructible`, `TauCeti.IsProConstructible.spectralSpace`, `TauCeti.IsSpectralMap.continuous_constructibleTopology`), the patch criterion for spectrality (`TauCeti.spectralSpace_of_isClopen_generateFrom`), the spectrality of `Spv`, `Cont` and `Spa` (`TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`; AdicSpaces Layers 1–2), and the Huber pairs, rational subsets and adic structure presheaf of AdicSpaces Layers 2–3. From Mathlib it uses `SpectralSpace`, `IsSpectralMap`, `WithConstructibleTopology`, `GeneralizingMap`, `Ind`, `Stonean` and `CompHaus.projectivePresentation`, the descent API `Pseudofunctor.IsStack` and `DescentData`, and the Ext-based sheaf cohomology `Sheaf.H`. D0.1, D0.3 and D0.5 state in one clause how they extend these: locally spectral spaces and relative spectral maps, images of pro-constructible subsets under spectral maps, and the Hochster dual.


D1 imports the perfectoid pro-étale morphism calculus from P6. D2 constructs topologies on that category; it does not define the morphisms themselves. D6 imports the tower construction from A4 and proves the resulting geometric quotient and comparison. D5 constructs the Berkovich spectrum of a complete Tate ring (D5.13) from Mathlib's `MulRingSeminorm` and Tau Ceti's `Spa`, and extends it from affinoids to small v-sheaves (D5.14).

General canonical compactification, including ECD §18, belongs to the étale cohomology of diamonds downstream of this roadmap (DiamondEtaleCohomology); D3 proves only the elementary special construction needed for its descent argument, and D5 owns the early minimal-plus-ring extension needed for its spatial reduction; its missing input is stated in §5.15. Ordinary profinite sheaves and ordinary ultrafilter stalks belong to D0; their infinity-valued and hypercomplete enhancements belong to the enhanced derived-sheaf roadmap (EnhancedDerivedSheaves), which consumes these foundations. The comparison `PreAdic.diamond_integralScheme` of integral pre-adic diamondification with the adic-coefficient functors of schemes (AdicCoefficientsAndComparisons L1) and the divisor geometry of symmetric powers of Spd O_E (RelativeFarguesFontaine) consume D6 and are not targets here.

## Conventions

Fix a prime p. `Perfd` denotes perfectoid spaces of all characteristics; `Perf` is its characteristic-p subcategory. D1–D3 use Perfd where appropriate. From D4 onwards diamonds and v-stacks are on Perf. A superscript ♯ denotes a marked untilt and ♭ its tilt. Marking includes the identification `(X♯)♭ ≅ X`; all morphisms of marked untilts respect this identification. `Spd(A,A⁺)` in the Tate construction uses a Tate ℤₚ-algebra and an open integrally closed subring of its power-bounded elements. The integral construction in D6 allows arbitrary complete Huber pairs over ℤₚ and retains nonanalytic points.

“qc” means quasicompact, “qs” quasiseparated, and “qcqs” both. For ordinary sheaves use the object and morphism notions of D0 separately. For a map of stacks, qs requires a diagonal that is both qc and qs, since that diagonal need not be injective. An object being qc does not automatically mean its map to the final object is qc. Topological surjectivity means surjectivity of the underlying spaces; sheaf or stack surjectivity means local lifting on the relevant site. The converse from the first to the second needs the stated qc hypothesis.

Write `x ⤳ y` when y is a specialization of x. A generalizing subset contains every generalization of its points. Localization at y has the generalizations of y as its underlying space. Spectral maps between locally spectral spaces are tested on pairs of spectral opens, not by imposing global compactness on the source. A totally disconnected perfectoid space has split open covers; its underlying topological space can have nontrivial specialization chains. Strict total disconnectedness requires split étale covers and algebraically closed component fields.

Étale and quasi-pro-étale maps of stacks include local separatedness. Finite étale maps are automatically separated. Fibre products of stacks are 2-fibre products, with an isomorphism between the two images as part of each object. Quotient stacks retain automorphisms; their sheaves of isomorphism classes are taken only after stackification. Perfectoid representability is tested in the particular morphism definitions that require it, rather than imposed on arbitrary diamond maps.

Cohomology in D0 and in the Hausdorff comparison of D5 is ordinary abelian sheaf cohomology. `Hⁿ` can use Mathlib's Ext-based `Sheaf.H`; its Čech complexes, spectral sequences, Grothendieck abelian categories and enough injectives are imported. Almost vanishing of integral structure sheaves is distinct from actual vanishing. The analytic étale-site equivalence in D6 is an equivalence of the étale categories, while full faithfulness of diamondification requires a seminormal rigid source over a fixed field.

API names below describe the interfaces to implement. Examples specify both the expected behaviour and cases a definition must distinguish. [Suggested.lean](Suggested.lean) gives suggested typed forms; the mathematical statements here specify the full interfaces, including the geometric identifications needed to instantiate those forms.

## Exact supplier contracts

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The dependencies beside each target name the declarations or layer that supply its inputs. Existing definitions retain their library namespaces. In particular, D0 extends `SpectralSpace`, `IsSpectralMap` and `TauCeti.IsProConstructible`; it does not introduce competing versions of these predicates.

| Supplier | Interface used here |
| --- | --- |
| `PerfectoidSpaces:P0` | Almost algebra, its ideals and almost descent |
| `PerfectoidSpaces:P1` | Tilting, marked untilts and their classification by primitive Witt-vector elements |
| `PerfectoidSpaces:P2` | Rational-affinoid geometry, completed residue fields, completed tensor products, integral elements and almost acyclicity |
| `PerfectoidSpaces:P3` | Almost purity |
| `PerfectoidSpaces:P4` | Morphisms, valuative criteria and completed base change |
| `PerfectoidSpaces:P5` | Finite-stage étale comparison |
| `PerfectoidSpaces:P6` | Pro-étale morphisms and their stability, affinoid pro-étale objects as pro-objects, and κ-small perfectoid spaces |
| `AdicEtaleGeometry:A1` | Analytic/étale finite-projective comparison and the adic étale calculus |
| `AdicEtaleGeometry:A4` | Finite étale torsor towers with perfectoid uniform completion |
| `SchemeAndStackFoundations:SF.2` | Scheme-theoretic flat-cover refinements used in the perfectoid ball argument |
| `AdicSpacesPartII:R0`, `R2` | Rigid seminormalization; arbitrary-height valuation algebra and integral pre-adic mapping spaces |


The perfectoid and adic suppliers form the same geometric bundle as this roadmap. SchemeAndStackFoundations supplies the lower-tier scheme-cover refinement; the layer references above fix the precise inputs. D0 supplies the ordinary coherent-topos and stack constructions used by the later layers.

## How to read the build

The construction has seven layers. The four independent foundation strands in D0 can be developed separately; their interfaces must meet before the geometric descent arguments use them.

| Layer | Construction | Principal outputs |
| --- | --- | --- |
| [D0](#d0) | Spectral topology, size bounds, ordinary coherent sites and stacks | Quotient and limit criteria; pro-categories; ordinary cohomological comparisons; stackification |
| [D1](#d1) | Disconnected perfectoid covers | Universally open strictly totally disconnected covers, topological classification and integral flatness |
| [D2](#d2) | Pro-étale and v-sites | Small sheaves, subcanonicity, descent and acyclicity of functions, vector bundles |
| [D3](#d3) | Effective descent and morphisms of stacks | Affinoid and separated pro-étale descent, étale and quasi-pro-étale classes, immersions and torsors |
| [D4](#d4) | Quotients and underlying spaces | Diamonds, small v-sheaves and v-stacks, geometric point criteria and topological quotients |
| [D5](#d5) | Spatial geometry | Permanence and limits, universally open presentations, relative representability, Berkovich spectra and Hausdorff reduction |
| [D6](#d6) | Diamondification | Analytic diamonds and their étale sites; integral pre-adic v-sheaves and seminormal rigid full faithfulness |

<a id="d0"></a>

## Layer 0: Spectral, categorical and size foundations

The topology strand is used to control atlases and their quotients. The ordinary-site strand supplies the cohomological arguments for descent, the size strand controls changes of site, and the stack strand supplies the 2-categorical constructions. Their common inputs are existing library carriers rather than a new foundational category.

*Spectral topology and its dual.*

<a id="d0-1"></a>

### 0.1 Locally spectral spaces and spectral maps between them

A spectral space is a quasicompact topological space with a basis of quasicompact open subsets stable under finite intersection in which every irreducible closed subset has a unique generic point. A locally spectral space is a space admitting an open cover by spectral subspaces. A map f : X → Y of spectral spaces is spectral if it is continuous and the preimage of every quasicompact open is quasicompact open; a map of locally spectral spaces is spectral if for every spectral open U of X mapping into a spectral open V of Y the restriction U → V is spectral. Use Mathlib's SpectralSpace for the absolute notion and extend it by the locally spectral predicate and the relative map condition. A non-qc open inclusion into a spectral space is locally spectral; its domain need not itself be spectral, and it is not an absolute spectral map.

The relative definition quantifies over pairs (U, V) of spectral opens, not over a chosen cover: any definition using a single cover has to be proved independent of the cover.

Construct the following interfaces and prove the stated properties:

- `IsLocallySpectralSpace`: The predicate on a topological space: it admits an open cover by subspaces that are spectral.
- `IsLocallySpectralSpace.of_spectralSpace`: Every spectral space is locally spectral.
- `IsLocallySpectralSpace.isOpen_isCompact_basis`: A locally spectral space has a basis of quasicompact opens and is sober and locally quasiseparated.
- `IsSpectralMap.locally`: The predicate that a continuous map of locally spectral spaces is spectral, in the sense of ECD 2.1.
- `IsSpectralMap.locally_iff_of_cover`: It is enough to check the condition for the members of one cover of the source by spectral opens mapping into spectral opens of the target.
- `IsSpectralMap.locally_iff_isSpectralMap`: For a map of spectral spaces the relative notion agrees with Mathlib's IsSpectralMap.
- `IsSpectralMap.locally_comp`: Composites of spectral maps of locally spectral spaces are spectral.
- `IsLocallySpectralSpace.isOpen`: An open subspace of a locally spectral space is locally spectral.

**Checks.**

- `qcqs_affinoid_is_spectral`: Spa(A, A^+) of a Huber pair with a pair of definition is spectral, hence locally spectral; a definition that does not accept it is wrong.
- `disjoint_union_of_spectral_is_locally_spectral_not_spectral`: An infinite disjoint union of nonempty spectral spaces is locally spectral and not quasicompact, so it is locally spectral but not spectral: the two predicates must not coincide.
- `open_immersion_is_spectral`: The inclusion of a quasicompact open subspace of a spectral space is a spectral map; the inclusion of a non-quasicompact open subspace of a spectral space is continuous but not spectral (a non-example).
- `agrees_with_mathlib_on_spectral_spaces`: For X, Y spectral, IsSpectralMap.locally f is equivalent to IsSpectralMap f.

The source locators are [ECD](#source-ecd) — Section 2, Definition 2.1, p. 10; [ECD](#source-ecd) — Section 2, Definition 2.1, second paragraph, p. 10.

*Needs:* `mathlib:SpectralSpace`, `mathlib:IsSpectralMap`, `mathlib:Topology.IsOpenEmbedding.spectralSpace`, `mathlib:QuasiSeparatedSpace`, `tauceti:TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`.

<a id="d0-2"></a>

### 0.2 The constructible topology of a spectral space is profinite

Let X be a spectral space. Recall that T subset X is constructible if it lies in the boolean algebra generated by the quasicompact open subsets, and that the constructible topology is generated by the constructible subsets. Then X with its constructible topology is a profinite set, that is, compact Hausdorff and totally disconnected; and if X = lim X_i is an inverse limit of finite T0 spaces along spectral maps then X with the constructible topology is the inverse limit of the X_i with the discrete topology. The new assertions here are Hausdorffness, total disconnectedness and the identification with the finite-T0 limit presentation.

The finite-T0 limit assertion assumes a chosen cofiltered presentation with spectral transition maps. Construct the presentation afterward using the pro-category equivalence, so the compactness argument does not depend on that equivalence. Mathlib's compactSpace_withConstructibleTopology assumes CompactSpace, QuasiSober, PrespectralSpace and QuasiSeparatedSpace, which SpectralSpace supplies.

The source locators are [ECD](#source-ecd) — Section 2, paragraph after Theorem 2.2, p. 10.

*Needs:* `mathlib:WithConstructibleTopology`, `mathlib:compactSpace_withConstructibleTopology`, `mathlib:constructibleTopology_eq_generateFrom_isConstructible`, `mathlib:Topology.IsConstructible`, `mathlib:Profinite`, `mathlib:TotallyDisconnectedSpace`, `mathlib:Profinite.asLimit`.

<a id="d0-3"></a>

### 0.3 Pro-constructible subsets: closedness in the constructible topology and stability under spectral images

Extend the existing TauCeti.IsProConstructible predicate, defined as closedness in WithConstructibleTopology. For a spectral space X it is equivalent to being an intersection of constructible subsets. The image of a pro-constructible subset under a spectral map between spectral spaces is pro-constructible. Existing compactness, intersections, inverse images and induced spectral-space structures are imported, never rebuilt. Locally, check on spectral opens.

X, Y spectral; f spectral. The image statement needs Lemma 2.3's identification of pro-constructible with constructibly closed and the profiniteness of the constructible topology.

The source locators are [ECD](#source-ecd) — Section 2, Lemma 2.3 with proof, p. 10; [ECD](#source-ecd) — Section 2, proof of Lemma 2.3, p. 10.

*Needs:* `mathlib:Topology.IsConstructible`, `mathlib:Topology.IsLocallyConstructible`, `mathlib:IsRetrocompact`, `mathlib:WithConstructibleTopology`, `tauceti:TauCeti.ValuationSpectrum.isProConstructible_val_preimage_spa`, [D0.2](#d0-2), `tauceti:TauCeti.IsProConstructible`, `tauceti:TauCeti.IsSpectralMap.continuous_constructibleTopology`.

<a id="d0-4"></a>

### 0.4 The closure of a pro-constructible subset is its set of specializations

Let X be a spectral space and S a pro-constructible subset. Then the closure of S in X is exactly the set of specializations of points of S. In particular a pro-constructible subset that is stable under specialization is closed, and a pro-constructible generalizing subset of a spectral space is an intersection of quasicompact open subsets.

X spectral, S pro-constructible. The last sentence is the dual statement used repeatedly in ECD sections 7, 9 and 11 and is proved by the same argument applied to the complement.

The source locators are [ECD](#source-ecd) — Section 2, Lemma 2.4 with proof, pp. 10-11; [ECD](#source-ecd) — Section 2, proof of Lemma 2.4, p. 11.

*Needs:* `mathlib:StableUnderSpecialization`, `mathlib:StableUnderGeneralization`, `mathlib:specializes_iff_mem_closure`, [D0.3](#d0-3).

<a id="d0-5"></a>

### 0.5 Hochster dual topology

For a spectral space X, the inverse topology is generated by complements of qc opens of X. It is spectral, has the same constructible topology, and reverses specialization; applying the operation twice recovers the original topology. Maps are spectral for the original topologies iff spectral for the inverse topologies.

Spectral X and Y.

Construct the following interfaces and prove the stated properties:

- `Spectral.inverseTopology`: Topology generated by complements of qc opens.
- `Spectral.inverseTopology_spectral`: The inverse topology on a spectral space is spectral.
- `Spectral.inverseTopology_inverse`: Double inverse topology equals the original topology.
- `Spectral.inverseTopology_specializes`: x specializes to y in the inverse topology iff y specializes to x originally.

**Checks.**

- `inverse_discrete_finite`: A finite discrete space is unchanged.
- `inverse_sierpinski`: On the two-point Sierpiński space the open singleton switches points.
- `inverse_patch_unchanged`: The constructible topology is unchanged.

The source locators are [KL15](#source-kl15) — §8.1, Definition 8.1.4, p. 157.

*Needs:* [D0.13](#d0-13), [D0.2](#d0-2).

<a id="d0-6"></a>

### 0.6 Profinite connected-component space

For a spectral space X, ConnectedComponents X with the quotient topology is profinite. Its clopens correspond exactly to clopens of X; the component of x is the intersection of all clopen neighbourhoods of x.

Spectral X.

The source locators are [ECD](#source-ecd) — §7, proof of Lemma 7.2, pp. 29–30.

*Needs:* `mathlib:ConnectedComponents`, [D0.13](#d0-13), [D0.2](#d0-2).

*Quotients, limits and pro-objects.*

<a id="d0-7"></a>

### 0.7 A surjective generalizing spectral map is a quotient map

Let f : Y → X be a surjective, generalizing spectral map of spectral spaces. Then f is a quotient map. Here generalizing means that every generalization of a point in the image lifts, which Mathlib records as GeneralizingMap. Separately, a continuous surjection from a quasicompact space onto a compact Hausdorff space is a quotient map.

Both quotient criteria are used: the first because all maps of analytic adic spaces are generalizing, the second for the Berkovich quotient of section 13. The second statement needs no spectrality: S quasicompact, T compact Hausdorff, f continuous surjective.

The source locators are [ECD](#source-ecd) — Section 2, Lemma 2.5 with proof, p. 11; [ECD](#source-ecd) — Section 2, Lemma 2.6 with proof, p. 11.

*Needs:* `mathlib:GeneralizingMap`, `mathlib:Topology.IsQuotientMap`, `mathlib:IsCompact.image`, [D0.4](#d0-4), [D0.3](#d0-3).

<a id="d0-8"></a>

### 0.8 Quotients by pro-constructible equivalence relations are T0, with invariant neighbourhoods

Let X be a quasiseparated locally spectral space and R inside X x X a pro-constructible equivalence relation whose two projections s, t : R → X are quasicompact and generalizing. Then the quotient space X/R is T0. Moreover for every quasicompact open W inside X there is an open R-invariant subset U containing W with U contained in E', where E' is an R-invariant intersection of a nonempty family of quasicompact open subsets.

Assume X is qs and locally spectral, R is pro-constructible, and both projections are qc and generalizing. For E = t(s⁻¹(W)), choose a qc open W′ containing E. The invariant neighbourhood is contained in E′ = t(s⁻¹(W′)); containment in E itself is not available. Note the hypotheses do not make X/R spectral: Remark 2.8 exhibits any compact Hausdorff space as such a quotient of profinite sets.

Construct U by removing the closure of t(s⁻¹(X ∖ W′)); generalizing projections make that closure invariant. The resulting inclusions W ⊆ U ⊆ W′ ⊆ E′ give the required neighbourhood, and separating distinct orbits gives T0. Compact Hausdorff quotients show why spectrality needs the additional basis condition below.

**Checks.**

- `qc_relation_projection_required`: On the infinite discrete space ℕ, the universal relation has locally spectral, open, generalizing projections, but the inverse image of {0} under its first projection is {0}×ℕ, which is not quasicompact. The only nonempty invariant open is ℕ, and it cannot lie in an intersection of quasicompact opens. This excludes the version of D0.8 and the open case of D0.9 with only local spectrality.

The source locators are [ECD](#source-ecd) — Section 2, Lemma 2.7, p. 11; [ECD](#source-ecd) — Section 2, proof of Lemma 2.7, p. 12; [Stacks quotient spaces](#source-stacks-0apa) — §39.19, Lemmas 39.19.3–39.19.4 (Tags 0APA–0APB); scheme-theoretic counterparts of the invariant-neighbourhood argument.

*Needs:* `mathlib:GeneralizingMap`, `mathlib:T0Space`, `mathlib:Topology.IsQuotientMap`, [D0.4](#d0-4), [D0.3](#d0-3), [D0.7](#d0-7).

<a id="d0-9"></a>

### 0.9 When a quotient by a pro-constructible equivalence relation is spectral, and the open case

For spectral X, consider a pro-constructible equivalence relation R ⊂ X × X with generalizing projections. Suppose the quotient topology on X/R has an open basis whose inverse images under q:X→X/R are qc. Under this extra condition, X/R is spectral, and q is both spectral and generalizing. There is also a local version: under the qs, locally spectral and qc-projection hypotheses of D0.8, openness of the projections makes X/R locally spectral and qs, with q open, spectral and qcqs. Keep the basis or openness hypothesis; pro-constructibility and generalizing projections alone do not ensure spectrality of the quotient.

The basis hypothesis in the first statement is not automatic; the second statement replaces it by openness of R → X, which is the hypothesis checked in the later geometric applications. ECD Remark 2.8 is the counterexample forbidding the unconditional assertion.

The source locators are [ECD](#source-ecd) — Section 2, Lemma 2.9 with proof, pp. 12-13; [ECD](#source-ecd) — Section 2, Lemma 2.10 with proof, p. 13; [ECD](#source-ecd) — Section 2, Remark 2.8, p. 12.

*Needs:* `mathlib:SpectralSpace`, `mathlib:QuasiSeparatedSpace`, `mathlib:IsSpectralMap`, [D0.8](#d0-8), [D0.2](#d0-2).

<a id="d0-10"></a>

### 0.10 Cofiltered inverse limits of spectral spaces along spectral maps

Take a cofiltered diagram (X_i) of spectral spaces with spectral transition maps, and form its inverse limit X. Spectrality is retained by X and by every projection X→X_i. For spectral Y, a continuous map Y→X is spectral precisely when each projected map Y→X_i is spectral. If a spectral map Y→X has generalizing composites with every projection, it is itself generalizing. Such a map is a quotient map whenever it is also surjective.

I cofiltered; all transition maps spectral. The generalizing statement uses Tychonoff for the constructible topologies.

Construct the limit as the compatible locus in the product. Apply the imported pro-constructible product calculus to the equations for compatibility. Lift generalizations by compactness in the constructible topologies, then apply the generalizing quotient criterion for the final assertion.

The source locators are [ECD](#source-ecd) — Section 2, Lemma 2.11 with proof, pp. 13-14; [ECD](#source-ecd) — Section 2, proof of Lemma 2.11, p. 14.

*Needs:* `mathlib:SpectralSpace`, `mathlib:IsSpectralMap`, `mathlib:CategoryTheory.IsCofiltered`, `mathlib:GeneralizingMap`, [D0.13](#d0-13), [D0.7](#d0-7).

<a id="d0-11"></a>

### 0.11 Spectral submersions

A spectral submersion is a surjective spectral map f:X→Y of spectral spaces such that, for every subset U⊆Y, if f⁻¹(U) is qc open then U is open. It is weaker than an ordinary submersion (Mathlib Topology.IsQuotientMap). Equivalently it suffices to test constructible U; surjectivity and patch compactness then also imply qc of U.

Spectral X and Y.

Construct the following interfaces and prove the stated properties:

- `IsSpectralSubmersion`: Surjectivity, spectrality and descent of qc-openness.
- `IsSpectralSubmersion.iff_constructible`: Test descent of openness on constructible subsets of the target.
- `IsSpectralSubmersion.of_quotient`: A surjective spectral quotient map is a spectral submersion.
- `IsSpectralSubmersion.comp`: Composites of spectral submersions are spectral submersions.

**Checks.**

- `spectral_submersion_identity`: The identity on every spectral space is a spectral submersion.
- `spectral_submersion_generalizing`: A surjective generalizing spectral map is a spectral submersion.
- `spectral_submersion_not_arbitrary_quotient`: For the valuation-ring/product-ring map of Arc Remark 2.18, the preimage of the generic point is closed (the nonprincipal-ultrafilter locus), although the generic point is not closed. The map is a spectral submersion but fails to be an ordinary quotient map.
- `nonsurjective_excluded`: The inclusion of one point into the two-point discrete space is spectral but is not a spectral submersion. Dropping surjectivity gives the wrong result.

The source locators are [Arc](#source-arc) — §2, Definition 2.14 and Remark 2.15, p. 12; Remark 2.18, pp. 13–14 (spectral submersion without the quotient property).

*Needs:* `mathlib:IsSpectralMap`, `mathlib:Topology.IsQuotientMap`, [D0.2](#d0-2).

<a id="d0-12"></a>

### 0.12 Limits of spectral submersions

Let f_i:X_i→Y_i be a morphism of small cofiltered diagrams of spectral spaces and spectral transition maps. If every f_i is a spectral submersion then lim f_i is a spectral submersion. The ordinary quotient-map property is not preserved in this statement: Arc Remark 2.18 supplies an inverse system of ordinary submersions whose limit is not a submersion.

Small cofiltered diagram; all transition maps spectral.

The source locators are [Arc](#source-arc) — §2, Lemma 2.17 and Remark 2.18, pp. 12–13.

*Needs:* [D0.11](#d0-11), [D0.10](#d0-10).

<a id="d0-13"></a>

### 0.13 Pro-categories, and spectral spaces as the pro-category of finite T0 spaces

For a category C, the pro-category Pro(C) has as objects cofiltered diagrams in C and Hom(lim Y_i, lim Z_j) = lim_j colim_i Hom(Y_i, Z_j). The construction is needed in the generality of a small category C, with the variant Pro_kappa(C) of pro-systems whose index category is bounded by a cutoff cardinal kappa. The category of spectral spaces with spectral maps is equivalent to Pro(finite T0 spaces); equivalently every spectral space is an inverse limit of finite T0 spaces. Build the pro-object interface from Mathlib's Ind-completion. Use Pro(C) = Ind(Cᵒᵖ)ᵒᵖ as the carrier. Flattening iterated pro-systems is a functor, not a claimed equivalence Pro(Pro(C)) ≃ Pro(C). The equivalence with spectral spaces uses finite T0 spaces and spectral maps, not arbitrary finite Hausdorff spaces.

C small, or at least essentially small on the relevant slices, which is how ECD uses it (X_et^aff is essentially small for a kappa-small X). Only the κ-bounded variant uses the cutoff-cardinal theorem.

Use finite distributive sublattices of the lattice of qc opens to construct the finite T0 quotients. Refinement defines the cofiltered diagram; qc opens descend to finite stages, which proves the Hom formula and the spectral-space equivalence. Define a flattening functor for iterated systems without asserting Pro(Pro(C)) ≃ Pro(C).

Construct the following interfaces and prove the stated properties:

- `CategoryTheory.Pro`: The pro-category of a category C, with objects cofiltered diagrams and the double-limit Hom formula.
- `CategoryTheory.Pro.mk`: A cofiltered diagram in C determines an object of Pro(C).
- `CategoryTheory.Pro.homEquiv`: Hom_{Pro C}(lim Y_i, lim Z_j) is naturally lim_j colim_i Hom_C(Y_i, Z_j).
- `CategoryTheory.Pro.hasCofilteredLimits`: Pro(C) has all cofiltered limits when C has finite limits, and the limit is computed by concatenating index categories.
- `CategoryTheory.Pro.flatten`: Flatten a cofiltered system of pro-objects to its cofiltered limit in Pro(C); no equivalence with all of Pro(Pro(C)) is asserted.
- `CategoryTheory.Pro.equivProOp`: Pro(C) is equivalent to the opposite of Ind(C^op), compatibly with Mathlib's Ind.
- `SpectralSpace.equivProFiniteTZero`: The category of spectral spaces with spectral maps is equivalent to Pro(finite T0 spaces).
- `SpectralSpace.asProLimit`: Every spectral space is canonically the inverse limit of its finite T0 spectral quotients.

**Checks.**

- `profinite_case`: Pro(finite sets) is equivalent to the category of profinite sets, compatibly with Mathlib's Profinite.asLimit.
- `constant_diagram`: For the terminal category (one object and its identity morphism only), Pro(C) is equivalent to C. This assertion is not made for a general one-object monoid category.
- `spec_is_spectral`: Under the equivalence, Spec of a ring goes to the system of its finite T0 quotients; a construction that does not reproduce PrimeSpectrum's spectral structure is wrong.
- `hom_is_not_the_naive_limit`: For source and target the system of finite quotients ℤ/pⁿℤ representing ℤ_p, lim_j colim_i Hom contains the identity. An element of colim_i lim_j Hom factors through one finite source quotient and has finite image, so cannot represent that identity.

The source locators are [ECD](#source-ecd) — Section 2, Theorem 2.2, p. 10; [ECD](#source-ecd) — Section 7, Proposition 7.10 and proof of Lemma 7.11, pp. 33-34.

*Needs:* `mathlib:CategoryTheory.Ind`, `mathlib:CategoryTheory.IsCofiltered`, `mathlib:CategoryTheory.Limits.HasLimits`, `mathlib:Profinite`, `mathlib:Profinite.asLimit`, [D0.2](#d0-2).

<a id="d0-14"></a>

### 0.14 Ordinal assembly of cofiltered limits

Every small cofiltered category with uncountably many objects and arrows, of cardinality λ, is an increasing union of cofiltered subcategories I_α (α<λ), each of cardinality at most max(ℵ₀,|α|), after closing a chosen enumeration under identities, compositions and finite cones. For a countable cofiltered category one constructs a cofinal sequence of cone choices. For any diagram F with the indicated limits, lim_I F ≅ lim_α lim_{I_α} F. This is cardinal induction via ordinal chains of subdiagrams, not the false claim that every cofiltered category admits a cofinal ordinal chain.

Small cofiltered category; chosen enumeration of objects and arrows. For uncountable λ use subcategories, not necessarily full subcategories.

Closing under finite cones includes equalizers of parallel arrows as well as cones over pairs of objects. Iterate the closure countably many times at each stage to keep the stated cardinal bound. The ordinal chain is a chain of subcategories; it is not itself claimed to be cofinal in the original index category.

Construct the following interfaces and prove the stated properties:

- `Cofiltered.ordinalAssembly`: An enumerated increasing family of small cofiltered subcategories covering all objects and arrows.
- `Cofiltered.ordinalAssembly_cardinal`: Each proper initial stage has the stated smaller cardinal bound.
- `Cofiltered.limit_ordinalAssembly`: The limit over I is the ordinal limit of the subdiagram limits.

**Checks.**

- `ordinal_countable_sequence`: For I=ℕᵒᵖ, the countable construction can be the identity sequence.
- `ordinal_terminal_diagram`: A terminal indexing category has its one-stage limit.
- `ordinal_union_cones`: A compatible family of cones on the subcategories determines a unique cone on their union.

The source locators are [ECD](#source-ecd) — §11, proofs of Lemma 11.22 and Proposition 11.23, pp. 63–64; §12, proof of Lemma 12.17, pp. 73–74.

*Needs:* `mathlib:CategoryTheory.IsCofiltered`, `mathlib:CategoryTheory.Limits.HasLimits`, `mathlib:Ordinal`.

<a id="d0-15"></a>

### 0.15 Hochster realization: every spectral space is the prime spectrum of a ring

Let X be a topological space. The following are equivalent: X is spectral; there is a ring A with X homeomorphic to Spec A; X can be written as an inverse limit of finite T0 spaces. Use Mathlib's spectral-space instance on Spec A for that implication. The other directions require a finite-T0 inverse-system construction and an actual commutative ring realizing X.

Share the inverse-limit construction with the pro-category equivalence. The ring-realization direction requires a separate construction; finite commutative rings, whose spectra are discrete, cannot realize arbitrary finite T0 spaces.

**Missing input.** The ring-realization implication remains a construction to supply: ECD Theorem 2.2 states the result without proving it. The required proof must exhibit the ring and identify its primes and topology; the finite-T0 presentation alone does not furnish that ring.

The source locators are [ECD](#source-ecd) — Section 2, Theorem 2.2, p. 10.

*Needs:* `mathlib:PrimeSpectrum`, `mathlib:SpectralSpace`, `mathlib:PrimeSpectrum.comap`, `mathlib:PrimeSpectrum.localization_comap_range`, [D0.13](#d0-13).

<a id="d0-16"></a>

### 0.16 Profinite presentations of compact Hausdorff spaces and extremally disconnected covers

For a compact Hausdorff space T, the Stone-Čech compactification of the underlying discrete set of T is a profinite (indeed extremally disconnected) space S with a continuous surjection S → T, and the induced equivalence relation R inside S x S is a closed subspace, hence profinite. Consequently every compact Hausdorff space is a quotient of a profinite set by a profinite equivalence relation. Mathlib has `StoneCech`, `Stonean`, the Stonean adjunction and the projective presentation of a compact Hausdorff object; the further construction is the identification of the induced equivalence relation as profinite and the resulting presentation used in ECD Remark 2.8 and Example 11.12.

T compact Hausdorff. The surjectivity of S → T uses that T is compact Hausdorff and the universal property of the Stone-Čech compactification of a discrete set. The equivalence relation R = S x_T S is closed in S x S because T is Hausdorff.

Construct the following interfaces and prove the stated properties:

- `CompHaus.profinitePresentation`: For T compact Hausdorff, a profinite S with a continuous surjection S → T.
- `CompHaus.profinitePresentation_surjective`: The structure map of the presentation is surjective.
- `CompHaus.profinitePresentation_rel`: The induced equivalence relation S x_T S is a closed subspace of S x S, hence profinite.
- `CompHaus.profinitePresentation_isQuotientMap`: T carries the quotient topology from S, so T is the coequalizer of the two projections of S x_T S in compact Hausdorff spaces.
- `CompHaus.profinitePresentation_of_stonean`: The presentation may be taken with S extremally disconnected, agreeing with Mathlib's CompHaus.projectivePresentation.
- `Profinite.quotient_compHaus`: Conversely, the quotient of a profinite set by a closed equivalence relation is compact Hausdorff.

**Checks.**

- `interval`: The unit interval admits a profinite presentation; the induced relation is closed and the quotient recovers the interval.
- `profinite_case`: If T is already profinite the identity is a presentation and the relation is the diagonal (the degenerate case).
- `not_every_quotient_is_profinite`: The quotient of a profinite set by a closed equivalence relation is in general only compact Hausdorff and not profinite (a non-example, which is the whole content of Remark 2.8).
- `agrees_with_mathlib_projective_presentation`: The extremally disconnected presentation agrees with CompHaus.projectivePresentation composed with CompHaus.toProfinite.

The source locators are [ECD](#source-ecd) — Section 2, Remark 2.8, p. 12; [ECD](#source-ecd) — Section 11, Example 11.12, p. 58.

*Needs:* `mathlib:StoneCech`, `mathlib:Stonean`, `mathlib:Stonean.stoneCechAdjunction`, `mathlib:CompHaus.projectivePresentation`, `mathlib:CompHaus.epi_iff_surjective`, `mathlib:CompHaus.toProfinite`, `mathlib:Profinite`, [D0.7](#d0-7).

*Ordinary sites and cohomology.*

<a id="d0-17"></a>

### 0.17 Quasicompact and quasiseparated objects and morphisms in a topos; algebraic topoi

Let T be a topos. An object X of T is quasicompact if every jointly surjective family of maps X_i → X has a finite jointly surjective subfamily; X is quasiseparated if for all quasicompact Y, Z over X the fibre product is quasicompact; a map f : Y → X is quasicompact if for all quasicompact Z over X the fibre product Z x_X Y is quasicompact, and quasiseparated if its diagonal is quasicompact. T is algebraic if there is a generating full subcategory C of qcqs objects, stable under fibre products, such that X → * is quasiseparated for X in C. These predicates extend Mathlib's site and sheaf categories; they also apply to categories with the relevant colimits and pullbacks.

Keep object qc separate from map qc when the final object is not qs, as on the big perfectoid site. The categories of small sheaves attached to large sites in ECD are not quite topoi, so the definitions must be stated for a category with the relevant colimits and pullbacks, not only for a genuine topos.

Prove composition and base-change stability for the map predicates. Establish the diagonal criterion for qs objects in the algebraic setting and descent of qs through jointly surjective covers. When the terminal object is qc, a qc map X→* makes X qc. The terminal-object hypothesis is essential: the identity of a non-qc terminal object is a qc morphism. The converse needs the relevant assumptions on the final object.

Construct the following interfaces and prove the stated properties:

- `CategoryTheory.Sheaf.IsQuasicompact`: The predicate that an object of a category of sheaves is quasicompact.
- `CategoryTheory.Sheaf.IsQuasiseparated`: The predicate that an object is quasiseparated.
- `CategoryTheory.Sheaf.Hom.IsQuasicompact`: The predicate that a morphism is quasicompact, defined by pullback along maps from quasicompact objects.
- `CategoryTheory.Sheaf.Hom.isQuasiseparated_iff_diagonal`: A morphism is quasiseparated exactly when its diagonal is quasicompact.
- `CategoryTheory.Sheaf.IsAlgebraic`: Every sheaf admits a jointly epimorphic family of qcqs generators whose maps to the terminal object are quasiseparated. SGA VI 2.2 implies the full subcategory of coherent objects is stable under fibre products. Omitting the terminal-map condition gives only a locally coherent topos.
- `CategoryTheory.Sheaf.isQuasiseparated_iff_of_cover`: In an algebraic setting the conditions may be checked after pullback to one cover by objects of the generating subcategory (SGA 4 VI Corollaries 1.17, 2.6 and 2.8).
- `CategoryTheory.Sheaf.isQuasicompact_of_isQuasicompact_terminal`: If the terminal object is quasicompact and X→* is a quasicompact morphism, then X is quasicompact. Without the terminal-object hypothesis the implication fails: the identity of the terminal object is always quasicompact.
- `CategoryTheory.Sheaf.Hom.isQuasicompact_comp`: Quasicompact and quasiseparated morphisms are stable under composition and base change.

**Checks.**

- `perfectoid_space`: A perfectoid space is quasicompact, respectively quasiseparated, as a v-sheaf exactly when its underlying topological space is (ECD Proposition 8.3).
- `final_object_not_quasiseparated`: For sheaves on Perfd the final object is not quasiseparated, so 'X quasicompact' and 'X → * quasicompact' must not be defined by the same predicate (a non-example).
- `finite_coproduct`: A finite coproduct of quasicompact sheaves is quasicompact; an infinite coproduct of noninitial sheaves is not quasicompact.
- `agrees_with_topological_qcqs`: For sheaves on a topological space, the notions agree with quasicompactness and quasiseparatedness of the corresponding open set.

The source locators are [ECD](#source-ecd) — Section 8, recollection of SGA 4 VI, p. 40; [ECD](#source-ecd) — Section 8, p. 40; [ECD](#source-ecd) — Section 8, warning, p. 41; [SGA 4 VI](#source-sga4vi) — Exposé VI §§1–2, Definitions 1.1, 1.7, 1.13, 2.3 and Corollaries 1.17, 2.6, 2.8; transcription pp. 121–142 (PDF pp. 127–148), original marginal pagination is separate.

*Needs:* `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.Limits.HasLimits`, `mathlib:CategoryTheory.Precoherent`, `mathlib:CategoryTheory.coherentTopology`, `mathlib:CategoryTheory.EffectiveEpiFamily`.

<a id="d0-18"></a>

### 0.18 Filtered colimits of abelian sheaves and their cohomology on an algebraic topos

Let (C, J) be a site with a generating full subcategory of qcqs objects stable under fibre products, so that the category of sheaves is algebraic. Then for a filtered diagram of abelian sheaves F_j the colimit is computed sectionwise on qcqs objects, and for every qcqs object X and every i the natural map colim_j H^i(X, F_j) → H^i(X, colim_j F_j) is an isomorphism. The same holds for sheaves of sets and of groups in degrees 0, respectively 0 and 1.

Quasicompactness and quasiseparatedness of X are both needed: quasicompactness for degree zero and quasiseparatedness to control the Čech terms. Mathlib has the abelian structure on sheaves, exactness of sheafification and the Ext-theoretic definition of sheaf cohomology, but not this comparison.

The source locators are [ECD](#source-ecd) — Section 8, proof of Proposition 8.2, pp. 39-40; [ECD](#source-ecd) — Section 8, proof of Proposition 8.2, p. 40; [SGA 4 VI](#source-sga4vi) — Exposé VI §5, Corollary 5.2 and Lemma 5.4; transcription pp. 167–168 (PDF pp. 173–174), original marginal pagination is separate.

*Needs:* `mathlib:CategoryTheory.sheafIsAbelian`, `mathlib:CategoryTheory.presheafToSheaf`, `mathlib:CategoryTheory.Sheaf.cohomologyPresheaf`, `mathlib:CategoryTheory.IsFiltered`, `mathlib:CategoryTheory.Limits.HasFilteredColimits`, [D0.17](#d0-17), [D0.19](#d0-19).

<a id="d0-19"></a>

### 0.19 Cech-to-derived spectral sequence, Leray spectral sequence, and the acyclic-basis comparison

For a site (C, J), a cover of an object X and an abelian sheaf F there is a spectral sequence from the Čech cohomology of the cover with coefficients in the presheaves H^q(F) converging to H^{p+q}(X, F). For a morphism of topoi f:Y→X, whose inverse image on abelian sheaves is exact, there is a Leray spectral sequence H^p(X, R^q f_* F) converging to H^{p+q}(Y, F). If B is a basis of the site consisting of objects on which F is acyclic and on which the covers of the site can be refined by covers by objects of B, then Čech cohomology computed on B agrees with sheaf cohomology. Mathlib has the Čech complex functor and Ext-theoretic sheaf cohomology, but none of these three comparisons.

The acyclic-basis comparison needs a basis stable under the fibre products used in the Čech nerve, which is exactly the generating subcategory of the algebraic topos. ECD applies all three only through their formal consequences; no finiteness is assumed. For Leray, the site functor must induce a geometric morphism; a continuous site functor alone is insufficient. The exact inverse-image left adjoint ensures that direct image preserves injectives.

Use an injective resolution of F and the Čech double complex. The acyclic comparison requires a basis stable under the fibre products in the nerve. For Leray, construct an exact inverse-image left adjoint so that the right adjoint preserves injectives; continuity of a site functor alone is not enough. Include the bounded-below relative Leray form of Stacks 0734.

The source locators are [ECD](#source-ecd) — Section 8, proof of Proposition 8.8, p. 43; [ECD](#source-ecd) — Section 8, Proposition 8.5(iii) and its proof, pp. 41-42; [Stacks Leray](#source-stacks-leray) — Lemma 21.14.5 (0732) and Lemma 21.14.7 (0734).

*Needs:* `mathlib:CategoryTheory.Sheaf.cohomologyPresheaf`, `mathlib:CategoryTheory.cechComplexFunctor`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.EnoughInjectives`, `mathlib:CategoryTheory.IsGrothendieckAbelian`, `mathlib:CategoryTheory.SpectralSequence`, `mathlib:CategoryTheory.Abelian.SpectralObject`, `mathlib:CategoryTheory.sheafIsAbelian`.

<a id="d0-20"></a>

### 0.20 Flasque constant sheaves

For an irreducible topological space X and an abelian group A, the constant sheaf has sections A on every nonempty open and the zero group on the empty open. All restriction maps are surjective, so it is flasque and H^i(X,A_X)=0 for i>0. A spectral space with a generic point is such an X.

Irreducible X; abelian group A.

The source locators are [Stacks constant sheaves](#source-stacks-02uw) — Lemma 20.20.2, tag 02UW (stable tag pagination).

*Needs:* `mathlib:CategoryTheory.Sheaf.cohomologyPresheaf`, [D0.19](#d0-19).

<a id="d0-21"></a>

### 0.21 Cohomology of limits of coherent topoi

Let (E_i) be a small cofiltered diagram of coherent topoi with coherent transition morphisms, E its topos limit and p_i:E→E_i. Fix i and an abelian sheaf F_i, and put F=p_i^*F_i. For every n≥0 the canonical colim_{j→i} H^n(E_j,p_{ji}^*F_i) → H^n(E,F) is an isomorphism. More generally allow compatible filtered systems of sheaves as in SGA VI 8.7.7. Coherence supplies the filtered-colimit compatibility of derived direct images required by VI 8.7.1.

Small cofiltered diagram; coherent topoi and coherent transition morphisms; sheaf descends from a stage or compatible system as in VI 8.7.7.

The source locators are [SGA 4 VI](#source-sga4vi) — Exposé VI §8.7, Theorem 8.7.1 and Corollary 8.7.7; transcription pp. 223–225 (PDF pp. 229–231), original marginal pagination is separate; [ECD](#source-ecd) — §14, proof of Proposition 14.9, p. 86.

*Needs:* [D0.17](#d0-17), [D0.18](#d0-18), [D0.19](#d0-19).

<a id="d0-22"></a>

### 0.22 Ordinary sheaves on profinite sets

For a profinite set S, ordinary Set- or Ab-valued sheaves are equivalent to contravariant functors on the Boolean algebra of clopens sending the empty set to the terminal object and finite disjoint unions to products. For S=βI (I discrete), clopens identify with subsets of I. For a family of sets or abelian groups A_i, the sheaf J↦∏_{i∈J} A_i has stalk at an ultrafilter U equal to colim_{J∈U}∏_{i∈J}A_i, the ordinary ultraproduct; stalk isomorphisms detect sheaf isomorphisms. No infinity-categorical extension or hypercompletion theorem is asserted here.

S profinite; ordinary Set or Ab coefficients. For the ultrafilter formula, I is discrete.

The source locators are [Arc](#source-arc) — §3, Proposition 3.10, Example 3.12, Construction 3.13, Lemma 3.14 and Definition 3.15, pp. 18–20; ordinary Set/Ab specialization.

*Needs:* `mathlib:StoneCech`, `mathlib:Profinite`, `mathlib:CategoryTheory.Sheaf`, [D0.16](#d0-16).

*Size bounds.*

<a id="d0-23"></a>

### 0.23 Existence of a cofinal class of cutoff cardinals

There is a cofinal class of uncountable cardinals kappa such that: for all cardinals lambda < kappa one has 2^lambda < kappa, so kappa is a strong limit; for all countable sequences of cardinals less than kappa the supremum is less than kappa, so the cofinality of kappa is larger than omega; and for all lambda < kappa there is a strong limit cardinal kappa_lambda < kappa whose cofinality is larger than lambda. Such kappa are automatically cofinal among the kappa_lambda for lambda < kappa.

No large-cardinal assumption is required; the proof is a transfinite construction of the beth hierarchy inside ZFC. The third clause is what makes bounded unions of bounded families admissible, and is the clause ECD uses in Lemma 11.22 and Lemma 12.17 to bound limits.

The source locators are [ECD](#source-ecd) — Section 4, Lemma 4.1 with proof, pp. 19-20; [ECD](#source-ecd) — Section 4, discussion after Lemma 4.1, pp. 19-20.

*Needs:* `mathlib:Cardinal`, `mathlib:Cardinal.mk`, `mathlib:Cardinal.IsStrongLimit`, `mathlib:Ordinal`, `mathlib:Cardinal.beth`, `mathlib:Ordinal.cof`.

<a id="d0-24"></a>

### 0.24 Cardinality of a completion with a bounded dense subset

Let κ be an uncountable strong-limit cardinal of uncountable cofinality and λ an infinite cardinal less than κ. If a Hausdorff first-countable topological group has a dense subset A of cardinality at most λ, then its separated completion has cardinality at most λ^ℵ₀ ≤ 2^λ < κ: each point is a limit of a sequence in A. Finite λ is handled separately (a finite dense subset of a Hausdorff space is closed); no false bound λ^ℵ₀ ≤ 2^λ for arbitrary finite λ is used.

Hausdorff first-countable topological group and its separated completion; λ is infinite and λ < κ; κ is uncountable strong limit with uncountable cofinality.

The source locators are [ECD](#source-ecd) — Section 4, Remark 4.3, p. 20.

*Needs:* `mathlib:Cardinal`, `mathlib:Cardinal.power_le_power_left`, `mathlib:UniformSpace.Completion`, `mathlib:FirstCountableTopology`, `mathlib:Cardinal.IsStrongLimit`, [D0.23](#d0-23).

*Groupoid-valued stacks.*

<a id="d0-25"></a>

### 0.25 Stackification of a groupoid-valued prestack and its universal property

Let (C, J) be a site and F a prestack on C, that is, a functor from C^op to groupoids, equivalently a pseudofunctor into Cat with groupoid values. There is a stack F^+ with a map F → F^+ that is universal among maps to stacks: composition with it is an equivalence between the category of maps F^+ → G and the category of maps F → G, for every stack G. Reuse Mathlib's DescentData, IsPrestack, IsStack and toDescentData for the descent interface. Construct stackification on this existing pseudofunctor carrier.

F is required only to be a prestack, not a stack; the universal property is a 2-categorical one and must be stated as an equivalence of categories of morphisms, not a bijection. Mathlib IsStack is stated for a pseudofunctor from LocallyDiscrete C^op to Cat, which is the shape the construction should produce.

First sheafify Hom presheaves compatibly with composition, then add effective objects represented by descent data and compare them through common refinements. Express the universal property with strong transformations and modifications. For groupoid-valued input, all arrows remain invertible. Local essential surjectivity and Hom sheafification determine the construction.

Construct the following interfaces and prove the stated properties:

- `CategoryTheory.Functor.stackification`: The associated stack of a prestack for a Grothendieck topology.
- `CategoryTheory.Functor.toStackification`: The canonical map from a prestack to its stackification.
- `CategoryTheory.Functor.isStack_stackification`: The stackification is a stack, in the sense of Mathlib's IsStack class.
- `CategoryTheory.Functor.stackificationUniversal`: For every stack G, composition with the canonical map is an equivalence of categories of morphisms from the stackification to G and from the prestack to G.
- `CategoryTheory.Functor.stackification_isLocallyBijective`: The canonical map is locally essentially surjective and locally fully faithful.
- `CategoryTheory.Functor.stackification_of_isStack`: If the prestack is already a stack the canonical map is an equivalence.
- `CategoryTheory.Functor.stackification_discrete`: On a discrete prestack coming from a presheaf of sets, stackification is Mathlib's sheafification.

**Checks.**

- `sheafification_agreement`: For a prestack with discrete fibres the stackification is the sheafification of the corresponding presheaf of sets.
- `already_a_stack`: If F is a stack the unit is an equivalence (the degenerate case).
- `classifying_stack_has_automorphisms`: Stackification of the one-object groupoid prestack with automorphism sheaf a nontrivial G is BG. It retains G as automorphisms of the trivial torsor; the sheaf of isomorphism classes would erase them.
- `torsor_isomorphism_classes`: For the prestack of G-torsors the sheaf of isomorphism classes of the stackification is the sheafification of the presheaf of isomorphism classes; equality before sheafification is a non-example.

The source locators are [ECD](#source-ecd) — Section 9, Definition 9.1, p. 44; [Stacks stackification](#source-stacks-stackification) — Section 8.8 (Tag 02ZM), Lemmas 8.8.1–8.8.3; Tag 02ZP, Lemma 8.9.1.

*Needs:* `mathlib:CategoryTheory.Pseudofunctor.DescentData`, `mathlib:CategoryTheory.Pseudofunctor.IsPrestack`, `mathlib:CategoryTheory.Pseudofunctor.IsStack`, `mathlib:CategoryTheory.Pseudofunctor.toDescentData`, `mathlib:CategoryTheory.Pseudofunctor.sheafHom`, `mathlib:CategoryTheory.presheafToSheaf`, `mathlib:CategoryTheory.Pseudofunctor`, `mathlib:CategoryTheory.Groupoid`, `mathlib:CategoryTheory.Pseudofunctor.StrongTrans`, `mathlib:CategoryTheory.Pseudofunctor.StrongTrans.Modification`.

<a id="d0-26"></a>

### 0.26 Two-fibre products of stacks and quotients of groupoid objects

For maps of stacks G_1 → G_3 and G_2 → G_3 the 2-fibre product is the stack sending X to the groupoid of triples (a, b, iso) with a in G_1(X), b in G_2(X) and an isomorphism of their images; it is a stack and has the expected 2-universal property. For a groupoid object (X, R) in sheaves, with source and target maps s, t : R → X, the quotient stack is the stackification of the objectwise groupoid prestack with objects X(T) and arrows R(T); its stackification has locally trivial R-torsors as objects; it comes with a map X → [X/R] and an equivalence R = X x_{[X/R]} X, and its sheaf of isomorphism classes is the sheafification of X/R. The isomorphism-class sheaf and the quotient stack must be kept apart until the absence of automorphisms has been proved.

A 2-fibre product is not a 1-categorical fibre product: taking the strict fibre product in Cat, which Mathlib provides through Cat.HasLimits, gives the wrong answer unless one of the maps is an isofibration. The comparison R = X x_{[X/R]} X requires the groupoid axioms and holds as stated; it is the abstract form of ECD Proposition 11.3(ii).

Morphisms between triples must respect the chosen comparison isomorphism. Prove the 2-universal property in the category of transformations and invertible modifications. Stackify the objectwise groupoid to form [X/R], recover the atlas relation, and only afterward sheafify isomorphism classes. The trivial torsor of BG must retain G as its automorphism group.

Construct the following interfaces and prove the stated properties:

- `CategoryTheory.Stack.twoFibreProduct`: The 2-fibre product of two maps of stacks over a common target.
- `CategoryTheory.Stack.twoFibreProduct_isStack`: The 2-fibre product of stacks is a stack.
- `CategoryTheory.Stack.twoFibreProductUniversal`: Its 2-universal property: maps into it are triples consisting of two maps and a 2-isomorphism between their composites.
- `CategoryTheory.Stack.quotient`: The quotient stack of a groupoid object in sheaves: stackify the objectwise groupoid of X(T) and R(T); the result classifies locally trivial R-torsors.
- `CategoryTheory.Stack.quotient_pullback`: R is the 2-fibre product of X with itself over the quotient stack.
- `CategoryTheory.Stack.quotient_isoClasses`: The sheaf of isomorphism classes of the quotient stack is the sheafification of the naive quotient presheaf.
- `CategoryTheory.Stack.quotient_isSheaf_iff`: The quotient stack is a sheaf exactly when all stabilizers are trivial.
- `CategoryTheory.Stack.quotient_descent`: Objects and morphisms over the quotient stack are objects and morphisms over X with descent data along R.

**Checks.**

- `free_discrete_quotient`: For a free action of a discrete group the quotient stack is the sheaf quotient.
- `classifying_stack`: For X the final object and R a sheaf of nontrivial groups G, the quotient is BG, which is not a sheaf and has automorphism sheaf G.
- `strict_pullback_is_wrong`: The strict fibre product of categories differs from the 2-fibre product already for two points mapping to the same object of a groupoid with a nontrivial automorphism (a non-example).
- `iso_classes_needs_sheafification`: For a G-torsor P with no global section, stackification of the action groupoid P/G has a global object, while the objectwise quotient has no global section. Its sheafification supplies the missing section.

The source locators are [ECD](#source-ecd) — Section 11, Proposition 11.3(ii) and (iii), p. 54; [ECD](#source-ecd) — Section 12, Definition 12.4 and Proposition 12.3, pp. 69-70; [Stacks stackification](#source-stacks-stackification) — Tag 04Y1 and Tag 044O, Definition 78.20.1.

*Needs:* `mathlib:CategoryTheory.Pseudofunctor.IsStack`, `mathlib:CategoryTheory.Pseudofunctor.DescentData`, `mathlib:CategoryTheory.Pseudofunctor`, `mathlib:CategoryTheory.Bicategory`, `mathlib:CategoryTheory.Cat.HasLimits.limitCone`, `mathlib:CategoryTheory.Groupoid`, [D0.25](#d0-25).

### Examples

The Sierpiński two-point space fixes the specialization convention: true generalizes false, and the inverse topology reverses that relation. The unit interval supplies a compact Hausdorff quotient of a profinite presentation that is not itself profinite. The infinite discrete universal relation in 0.8 distinguishes local spectrality from quasicompactness.

### Dependencies

Mathlib and Tau Ceti supply the spectral, categorical, sheaf and cardinal carriers named in the supplier contracts. The four strands in this layer join at the quotient, coherent-topos, size and stack interfaces.

<a id="d1"></a>

## Layer 1: Disconnected perfectoid spaces

The purpose of disconnected covers is to turn geometry into valuation-field components and profinite parameter spaces. Work with the perfectoid spaces, residue fields, affinoid limits and pro-étale morphisms supplied by P2/P4/P6. Total disconnectedness and strict total disconnectedness are separate predicates, and universal openness requires a cover construction beyond w-localization.

*Split covers and component fields.*

<a id="d1-1"></a>

### 1.1 Totally disconnected perfectoid spaces

Call a perfectoid space X totally disconnected when it is quasi-compact quasi-separated and each of its open covers admits a splitting, that is, for every open cover {U_i} of X the map from the disjoint union of the U_i to X admits a section. These are the analogues of profinite sets in the perfectoid setting. The name refers to the connected components of |X|, which are the fibres of the projection to the profinite set pi_0(X) and are of the form Spa(K, K^+); it does not say that |X| is a totally disconnected topological space.

X is required to be qcqs; without quasicompactness the splitting condition is vacuous on the pieces of an infinite disjoint union and the structure theory fails. The condition is on open covers, not on étale covers: the étale version is the strictly totally disconnected condition of ECD 7.15, which is strictly stronger.

Construct the following interfaces and prove the stated properties:

- `IsTotallyDisconnectedPerfectoid`: The predicate on a perfectoid space: qcqs, and every open cover splits.
- `IsTotallyDisconnectedPerfectoid.qcqs`: A totally disconnected perfectoid space is quasicompact and quasiseparated.
- `IsTotallyDisconnectedPerfectoid.splitting`: A chosen splitting of any given open cover.
- `IsTotallyDisconnectedPerfectoid.isClosed`: The condition passes to closed subspaces.
- `IsTotallyDisconnectedPerfectoid.isAffinoid`: A totally disconnected perfectoid space is affinoid (ECD 7.5).
- `IsTotallyDisconnectedPerfectoid.pi0`: The projection to the profinite set of connected components.
- `IsTotallyDisconnectedPerfectoid.fibre_eq_spa`: Each fibre of that projection is Spa(K, K^+) for a perfectoid field K and an open bounded valuation subring.
- `IsTotallyDisconnectedPerfectoid.of_components`: Conversely a qcqs perfectoid space all of whose connected components have that form is totally disconnected.

**Checks.**

- `point`: Spa(K, K^+) with K perfectoid and K^+ an open bounded valuation subring is totally disconnected.
- `finite_disjoint_union`: A finite disjoint union of totally disconnected perfectoid spaces is totally disconnected; an infinite union of nonempty summands is not quasicompact, hence is not totally disconnected in this sense (the degenerate case and a non-example).
- `perfectoid_ball_is_not`: The perfectoid closed unit disc over an algebraically closed C is qcqs but not totally disconnected, since it is connected with more than one closed point.
- `agrees_with_profinite`: For X = S x Spa(C, O_C) with S profinite, X is totally disconnected and pi_0(X) = S; a definition that does not recover S is wrong.

The source locators are [ECD](#source-ecd) — Section 7, Definition 7.1, p. 29.

*Needs:* `mathlib:SpectralSpace`, `mathlib:ConnectedComponents`, `mathlib:Profinite`, [D0.1](#d0-1), `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`.

<a id="d1-2"></a>

### 1.2 Fargues' characterisation of spectral spaces all of whose open covers split

Let X be spectral. The following are equivalent: every open cover splits; every connected component has a unique closed point; global sections on ordinary set-valued sheaves sends epimorphisms to surjections; global sections on abelian sheaves is exact; every abelian sheaf has vanishing H^i for i>0; every abelian sheaf has vanishing H^1. This is the Fargues characterization with the epimorphism condition on set-valued sections: ECD 7.2(iii) overstates the set-valued condition as preservation of all finite colimits. For the two-point discrete X, global sections is the product functor Set×Set→Set and does not preserve binary coproducts. No finite-colimit-preservation claim for set-valued global sections is made.

X spectral. The equivalence of the last four conditions is formal; the substance is (i) equivalent to (ii) and (iv) implies (i). Recall that every nonempty spectral space has at least one closed point, by Zorn and the nonemptiness of cofiltered limits of nonempty spectral spaces.

The source locators are [ECD](#source-ecd) — Section 7, Lemma 7.2 with proof, pp. 29-30; [ECD](#source-ecd) — Section 7, remark before the proof of Lemma 7.2, p. 30.

*Needs:* `mathlib:SpectralSpace`, `mathlib:CategoryTheory.Sheaf.cohomologyPresheaf`, `mathlib:ConnectedComponents`, `mathlib:Profinite`, [D0.2](#d0-2), [D1.1](#d1-1).

<a id="d1-3"></a>

### 1.3 Connected components of a totally disconnected perfectoid space, and affinoidness

For a totally disconnected perfectoid X, construct the continuous component projection X→π₀(X) and prove that π₀(X) is profinite. Describe its fibres as valuation spectra Spa(K,K⁺), where K is perfectoid and K⁺ is a valuation subring that is open and bounded. The description also characterizes total disconnectedness among qcqs perfectoid spaces: having all components of this form is sufficient. Prove additionally that every totally disconnected perfectoid X is affinoid.

X totally disconnected. For the converse the hypothesis is on all connected components; a qcqs perfectoid space with some component of this form need not be totally disconnected.

The source locators are [ECD](#source-ecd) — Section 7, Lemma 7.3 with proof, pp. 30-31; [ECD](#source-ecd) — Section 7, Lemma 7.5 with proof, p. 31.

*Needs:* `mathlib:ConnectedComponents`, `mathlib:Profinite`, `mathlib:SpectralSpace`, [D1.2](#d1-2), [D0.2](#d0-2), `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`, [D0.6](#d0-6), `PerfectoidSpaces:P2/completed-residue-fields`, `PerfectoidSpaces:P4/residue-field-point-injection`.

<a id="d1-4"></a>

### 1.4 Strictly totally disconnected perfectoid spaces

Define strict total disconnectedness for a perfectoid X by requiring qcqs together with a splitting of each étale covering. Among qcqs perfectoid spaces, an equivalent condition is the following component description: each component is Spa(C,C⁺) for an algebraically closed perfectoid field C and an open bounded valuation subring C⁺.

The condition is on étale covers rather than open covers; it implies total disconnectedness but is strictly stronger. The characterisation uses that finite étale covers of Spa(K, K^+) come from finite extensions of K, so K must be algebraically closed.

Construct the following interfaces and prove the stated properties:

- `IsStrictlyTotallyDisconnected`: The predicate on a perfectoid space: qcqs, and every étale cover splits.
- `IsStrictlyTotallyDisconnected.isTotallyDisconnected`: A strictly totally disconnected space is totally disconnected.
- `IsStrictlyTotallyDisconnected.component_eq`: Every connected component is Spa(C, C^+) with C algebraically closed.
- `IsStrictlyTotallyDisconnected.of_components`: Conversely this condition on components implies strict total disconnectedness.
- `IsStrictlyTotallyDisconnected.isClosed`: The condition passes to closed subspaces, and to pro-constructible generalizing subsets.
- `IsStrictlyTotallyDisconnected.splitting_etale`: A chosen splitting of any given étale cover.

**Checks.**

- `algebraically_closed_point`: Spa(C, C^+) with C algebraically closed is strictly totally disconnected.
- `cyclotomic_field_is_not`: Spa(K, K^+) with K perfectoid but not algebraically closed is totally disconnected and not strictly totally disconnected (a non-example separating the two classes).
- `finite_disjoint_union`: A finite disjoint union of strictly totally disconnected spaces is strictly totally disconnected (the degenerate case).
- `profinite_times_point`: S x Spa(C, O_C) for S profinite is strictly totally disconnected, which is the shape produced by Lemma 7.19.

The source locators are [ECD](#source-ecd) — Section 7, Definition 7.15 and Proposition 7.16 with proof, p. 36.

*Needs:* `mathlib:ConnectedComponents`, [D1.3](#d1-3), [D1.1](#d1-1), `PerfectoidSpaces:P5/finite-stage-descent-of-qcqs-etale-objects`, `PerfectoidSpaces:P3/etale-site-tilting-and-etale-almost-acyclicity`, `PerfectoidSpaces:P2/completed-residue-fields`.

*Valuative subspaces and integral flatness.*

<a id="d1-5"></a>

### 1.5 Pro-constructible generalizing subsets of a totally disconnected space are affinoid perfectoid

Let X be a totally disconnected perfectoid space and U a pro-constructible generalizing subset of |X|. Then U is an intersection of subsets of the form {|f| at most 1} for f in H^0(X, O_X). In particular U carries a natural structure of affinoid perfectoid space, which is again totally disconnected. In particular every quasicompact open subset of X is affinoid.

X totally disconnected; U pro-constructible and generalizing. A finite intersection of sets {|f| at most 1} inside an affinoid perfectoid space is a rational subset; an infinite intersection is a cofiltered limit of affinoid perfectoids, hence affinoid perfectoid. The generalizing hypothesis is essential: a pro-constructible subset that is not generalizing is not of this form.

The source locators are [ECD](#source-ecd) — Section 7, Lemma 7.6 and Remark 7.7 with proof, pp. 31-32.

*Needs:* `mathlib:Topology.IsConstructible`, `mathlib:StableUnderGeneralization`, [D0.3](#d0-3), [D1.3](#d1-3), `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`, `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`.

<a id="d1-6"></a>

### 1.6 Automatic flatness over a totally disconnected base

Choose a totally disconnected affinoid perfectoid base X=Spa(R,R⁺), an affinoid perfectoid Y=Spa(S,S⁺), and a morphism f:Y→X. For any pseudouniformizer varpi in R, reduction of the integral-ring map gives a flat R⁺/varpi-algebra S⁺/varpi. Surjectivity of the underlying map |f| strengthens this to faithful flatness. The conclusion concerns these reduced integral rings over this particular base; it does not assert flatness for arbitrary perfectoid-ring morphisms.

X totally disconnected and Y affinoid perfectoid; no hypothesis at all on f beyond that. Faithful flatness needs surjectivity of |f|, not surjectivity of Spec. The statement is about the integral rings modulo a pseudouniformizer; it says nothing about R → S.

Reduce componentwise to valuation rings. Torsion-freeness over a valuation domain gives flatness via the imported Bézout-domain criterion. Test faithful flatness at maximal ideals using topological surjectivity and residue-field fibres. The integral reduction modulo ϖ is the conclusion; no flatness of R → S is asserted.

The source locators are [ECD](#source-ecd) — Section 7, Proposition 7.23 with proof, pp. 38-39; [ECD](#source-ecd) — Section 7, proof of Proposition 7.23, p. 38.

*Needs:* `mathlib:Module.Flat`, `mathlib:Module.FaithfullyFlat`, `mathlib:ValuationSubring`, `mathlib:PrimeSpectrum.comap_surjective_of_faithfullyFlat`, [D1.3](#d1-3), `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`, `PerfectoidSpaces:P2/completed-residue-fields`, `PerfectoidSpaces:P4/residue-field-point-injection`, `mathlib:Module.Flat.flat_iff_torsion_eq_bot_of_isBezout`.

*Localization and open covers.*

<a id="d1-7"></a>

### 1.7 w-local and w-strictly local perfectoid spaces

Require three conditions for w-locality of a perfectoid X: X is qcqs, its open coverings split, and its set Xᶜ of closed points is closed. These say exactly that |X| is w-local spectral, and imply total disconnectedness. Define w-strict locality by adding algebraic closedness of every completed residue field K(x); this implies strict total disconnectedness. The stronger predicates supply the w-localization construction, while the later geometric arguments use the two disconnectedness predicates.

The extra condition over total disconnectedness is exactly the closedness of the set of closed points.

Construct the following interfaces and prove the stated properties:

- `IsWLocalSpectralSpace`: A spectral space in which every open cover splits and the set of closed points is closed.
- `IsWLocalPerfectoid`: A perfectoid space whose underlying space is w-local.
- `IsWLocalPerfectoid.isTotallyDisconnected`: A w-local perfectoid space is totally disconnected.
- `IsWLocalPerfectoid.isClosed_closedPoints`: The set of closed points is closed.
- `IsWStrictlyLocalPerfectoid`: A w-local perfectoid space all of whose completed residue fields are algebraically closed.
- `IsWStrictlyLocalPerfectoid.isStrictlyTotallyDisconnected`: A w-strictly local space is strictly totally disconnected.

**Checks.**

- `w_local_implies_totally_disconnected`: Every w-local perfectoid space is totally disconnected.
- `totally_disconnected_not_w_local`: A totally disconnected perfectoid space whose set of closed points is not closed is a non-example, so the two predicates must not be defeq.
- `w_localization_is_w_local`: X^wl is w-local for every qcqs perfectoid X (the construction test).
- `w_strictly_local_of_algebraically_closed`: For C algebraically closed, Spa(C, C^+) is w-strictly local (the degenerate one-component case).

The source locators are [ECD](#source-ecd) — Section 7, Definition 7.4, p. 30; [ECD](#source-ecd) — Section 7, Definition 7.17 and the remark before it, p. 36.

*Needs:* `mathlib:SpectralSpace`, `mathlib:IsClosed`, [D1.1](#d1-1), [D1.4](#d1-4), `PerfectoidSpaces:P2/completed-residue-fields`.

<a id="d1-8"></a>

### 1.8 The w-localization functor and its pro-etale presentation

The inclusion of the category of w-local perfectoid spaces with w-local maps into the category of qcqs perfectoid spaces admits a right adjoint X maps to X^wl, and the adjunction map X^wl → X is pro-étale. If X is affinoid then X^wl → X is an inverse limit of surjective maps of the form a finite disjoint union of rational subsets U_i → X, and in particular affinoid pro-étale. The underlying space is the w-localization of the spectral space |X|, with pi_0(X^wl) = |X|_cons and the component over x the localization X_x, and O^+ on X^wl is the varpi-adic completion of the pullback of O^+_X. The component X_x consists of generalizations of x. The source says “left adjoint” but its final-object universal property and counit X^wl → X have the right-adjoint direction. The inclusion of w-local spaces with w-local maps is not full; no counit isomorphism for every already-w-local X is asserted.

X qcqs; the affinoid case is proved first and glued by the open-subspace lemma below. The construction is not universally open: ECD says so explicitly, which is why the separate cover of 7.18 is needed.

Specify w-local morphisms as maps carrying closed points to closed points. The inclusion is not full. Its right-adjoint Hom equivalence is Hom_wl(W,X^wl) ≅ Hom(W,X); the map to X is its counit. Construct the affinoid case by limits of finite disjoint rational covers and complete O⁺ in the pseudouniformizer topology, then glue using compatibility with open subspaces. Universal openness requires the separate construction below.

Construct the following interfaces and prove the stated properties:

- `Perfectoid.wLocalization`: The w-localization X^wl of a qcqs perfectoid space.
- `Perfectoid.wLocalization.toBase`: The adjunction map X^wl → X.
- `Perfectoid.wLocalization.isWLocal`: X^wl is w-local.
- `Perfectoid.wLocalization.adjunction`: Hom_wlocal(W, X^wl) ≅ Hom_qcqs(W, X), naturally, with counit X^wl → X; the left functor forgets the restriction to w-local maps.
- `Perfectoid.wLocalization.isProEtale`: The adjunction map is pro-étale, and affinoid pro-étale when X is affinoid.
- `Perfectoid.wLocalization.pi0`: pi_0(X^wl) is |X| with the constructible topology, and the component over x is the localization of |X| at x.
- `Perfectoid.wLocalization.isOpenEmbedding`: For U a quasicompact open subset of X, U^wl → X^wl is a quasicompact open embedding, and quasicompact open covers induce open covers.
- `Perfectoid.wLocalization.surjective`: The adjunction map is surjective, hence a v-cover.

**Checks.**

- `already_w_local`: For a one-point Spa(C,O_C), the counit is an isomorphism. Already-w-local spaces with more than one specialization point need not have this property.
- `point_with_valuation_ring`: Take a perfectoid field C whose residue field has a nontrivial rank-one valuation, and let C⁺ be its inverse-image valuation ring in O_C. Then X=Spa(C,C⁺) has two specialization points and is w-local, but π₀(X^wl)=|X|_cons has two points whereas π₀(X) has one. The counit is therefore not an isomorphism; already-w-local is insufficient.
- `pi0_is_constructible_topology`: pi_0(X^wl) is |X| with its constructible topology; a construction that returns |X| with its own topology is wrong.
- `not_universally_open`: X^wl → X is not universally open in general, so it must not be confused with the cover of ECD 7.18 (a non-example).

The source locators are [ECD](#source-ecd) — Section 7, Proposition 7.12 with proof, pp. 33-35; [ECD](#source-ecd) — Section 7, proof of Lemma 7.13, p. 34; [ECD](#source-ecd) — Section 7, Lemma 7.14 with proof, pp. 35-36; [BS15](#source-bs15) — §2.1, Definition 2.1.1, Lemmas 2.1.9–2.1.10 and Remark 2.1.11, pp. 6–8.

*Needs:* `mathlib:SpectralSpace`, `mathlib:WithConstructibleTopology`, `mathlib:UniformSpace.Completion`, [D0.7](#d0-7), [D0.10](#d0-10), [D1.7](#d1-7), `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`, [D0.6](#d0-6), [D0.13](#d0-13).

<a id="d1-9"></a>

### 1.9 Every affinoid perfectoid space has a universally open affinoid pro-etale strictly totally disconnected cover

Let X be an affinoid perfectoid space. Then there is an affinoid perfectoid space X tilde with an affinoid pro-étale, surjective and universally open map X tilde → X such that X tilde is strictly totally disconnected. If kappa is a cutoff cardinal and X is kappa-small then X tilde may be taken kappa-small. The construction differs from the w-localization precisely in that it is universally open, which the w-localization is not.

X affinoid; kappa a cutoff cardinal in the sense of ECD 4.1. The cardinality count uses that the set of isomorphism classes of affinoid étale surjections onto X has cardinality less than kappa. The countable iteration uses that countable unions of cardinals less than kappa are less than kappa, which is clause (ii) of the cutoff lemma, and P6's affinoid approximation for the finite-stage descent.

Form simultaneous refinements of the affinoid étale covers, iterate countably and use finite-stage descent to split the covers on the resulting limit. Track the number of covers and the completed ring cardinality at each step. This uses P6's small-space and approximation interfaces, not a redefinition of pro-étale morphisms.

Construct the following interfaces and prove the stated properties:

- `Perfectoid.stdCover`: For an affinoid perfectoid X, a strictly totally disconnected affinoid perfectoid X tilde over X.
- `Perfectoid.stdCover.isProEtale`: The structure map is affinoid pro-étale.
- `Perfectoid.stdCover.surjective`: The structure map is surjective, hence a v-cover.
- `Perfectoid.stdCover.universallyOpen`: The structure map is universally open.
- `Perfectoid.stdCover.isStrictlyTotallyDisconnected`: X tilde is strictly totally disconnected.
- `Perfectoid.stdCover.small`: If X is kappa-small then X tilde may be chosen kappa-small, for kappa a cutoff cardinal.
- `Perfectoid.stdCover.oneStep`: The single step X_infinity, the limit over finite products of all affinoid étale surjections, which is already universally open.

**Checks.**

- `already_std`: If X is already strictly totally disconnected the identity is such a cover (the degenerate case).
- `universally_open`: The cover is universally open, unlike the w-localization; a construction that produces X^wl is wrong.
- `point`: For X=Spa(C,C⁺) with C algebraically closed, the identity is an admissible universally open strictly totally disconnected cover.
- `smallness`: For X kappa-small the cover is kappa-small, so the construction stays inside the kappa-small site.

The source locators are [ECD](#source-ecd) — Section 7, Lemma 7.18 with proof, pp. 36-37; [ECD](#source-ecd) — Section 7, remark before Lemma 7.18, p. 36.

*Needs:* `mathlib:Cardinal`, [D0.23](#d0-23), [D1.4](#d1-4), [D0.24](#d0-24), `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `PerfectoidSpaces:P5/finite-stage-descent-of-qcqs-etale-objects`.

*Pro-étale maps over a strictly totally disconnected base.*

<a id="d1-10"></a>

### 1.10 Quasicompact separated maps to a strictly totally disconnected base are pro-etale iff their rank-one fibres are profinite

Fix a strictly totally disconnected perfectoid base X and a qc separated morphism f : Y → X. The pro-étale condition on f is equivalent to the following fibre condition: at each rank-one point x = Spa(C, O_C), some profinite S_x identifies Y_x with x × S_x. Either condition also makes Y strictly totally disconnected and f affinoid pro-étale. Affinoid Y automatically supplies the separatedness hypothesis, since morphisms between affinoid perfectoid spaces are separated.

X strictly totally disconnected; f quasicompact and separated. Without separatedness the conclusion fails, as Remark 7.21 records on the topological side. Here x x S denotes the limit of x x S_i over a presentation of S as a limit of finite sets.

The source locators are [ECD](#source-ecd) — Section 7, Lemma 7.19 with proof, p. 37.

*Needs:* `mathlib:Profinite`, [D1.4](#d1-4), [D1.5](#d1-5), [D0.3](#d0-3), `PerfectoidSpaces:P4/valuative-criterion-separatedness`, `PerfectoidSpaces:P4/maps-of-affinoid-perfectoid-spaces-are-separated`.

<a id="d1-11"></a>

### 1.11 Perfectoid spaces pro-etale over a strictly totally disconnected space are classified by spectral data

Let T be spectral with every connected component a totally ordered chain of specializations. A spectral map S→T with S spectral is affinoid pro-étale if S→T×_{π₀(T)}π₀(S) is a pro-constructible generalizing embedding. A spectral map from a locally spectral S is pro-étale if S has an open cover by spectral subspaces on which the map is affinoid pro-étale. Here spectral for locally spectral spaces means the restriction between any spectral open subspaces is quasicompact, as in ECD 2.1; it does not require S itself to be quasicompact. For strictly totally disconnected perfectoid X, Y↦|Y| gives equivalences between affinoid pro-étale spaces over X and affinoid pro-étale spectral maps to |X|, and between arbitrary pro-étale spaces over X and pro-étale locally spectral maps to |X|. The κ-small restrictions use the same cutoff cardinal on spaces and topological sources. The inverse uses the varpi-adic completion of the pullback of O^+_X and valuations pulled back from X, and glues on spectral opens.

X strictly totally disconnected. If S is spectral and S → T is pro-étale it need not be affinoid pro-étale: the analogue of the separatedness condition can fail, which ECD records as Remark 7.21. The valuations on the inverse are obtained by pullback from X, which is what makes the inverse land in perfectoid spaces.

The source locators are [ECD](#source-ecd) — Section 7, Definition 7.20, second clause, and Remark 7.21, p. 38; [ECD](#source-ecd) — Section 7, Corollary 7.22 with proof, p. 38.

*Needs:* `mathlib:SpectralSpace`, `mathlib:IsSpectralMap`, `mathlib:Profinite`, `mathlib:UniformSpace.Completion`, [D1.10](#d1-10), [D1.5](#d1-5), [D0.1](#d0-1), [D0.6](#d0-6).

### Examples

Spa(K,K⁺) fixes the component-field test: open covers split, while split étale covers require K algebraically closed. A nonempty infinite disjoint union fails the quasicompactness condition. The w-localization counit is directed towards the original space, as its factorization test specifies.

### Dependencies

Layer 0; PerfectoidSpaces Layers P0–P4 and P6; SchemeAndStackFoundations SF.2 for flat-cover refinements.

<a id="d2"></a>

## Layer 2: The pro-étale and v-topologies

Construct the sites only after the covering condition and the P6 morphism calculus are available. Affinoid perfectoid objects provide the finite covering basis used in smallness and cohomology. Pro-étale comparison precedes v-descent; almost flatness over the D1 bases then supplies the v-Čech arguments.

*Sites, smallness and algebraicity.*

<a id="d2-1"></a>

### 2.1 The big pro-etale site of perfectoid spaces

Let Perfd be the category of perfectoid spaces and Perfd_kappa the full subcategory of kappa-small ones. The big pro-étale site is the Grothendieck topology on Perfd, respectively Perfd_kappa, in which a family {f_i : Y_i → X} is a covering if all f_i are pro-étale and for every quasicompact open U of X there is a finite subset J of the index set and quasicompact opens V_i of Y_i for i in J with U contained in the union of the images f_i(V_i). The quasicompactness condition is the same one that appears in the definition of the fpqc topology for schemes; point-surjectivity of an unrestricted family is not the definition.

The covering condition has two parts and both are needed: pro-étaleness of each member, and the finite-quasicompact-image condition. Dropping the second gives a class that is not stable under the operations a pretopology needs. Pro-etale morphisms of perfectoid spaces, their stability under composition and base change and the pro-category equivalence are supplied by PerfectoidSpaces:P6; the site construction uses this imported calculus.

Construct the following interfaces and prove the stated properties:

- `Perfd.proEtalePrecoverage`: The precoverage on Perfd whose members are pro-étale families satisfying the finite quasicompact image condition.
- `Perfd.proEtaleTopology`: The Grothendieck topology it generates.
- `Perfd.proEtalePrecoverage.isStableUnderBaseChange`: Coverings are stable under base change.
- `Perfd.proEtalePrecoverage.isStableUnderComposition`: Coverings are stable under composition.
- `Perfd.proEtaleTopology_le_of_analytic`: Analytic and étale covers are pro-étale covers, so the analytic and étale topologies are coarser.
- `Perfd.proEtaleCover.refineAffinoid`: Every pro-étale covering is refined by one all of whose members are affinoid perfectoid.
- `Perfd.proEtaleTopology.small`: The topology restricts to Perfd_kappa and the inclusion is a continuous functor of sites.
- `Perfd.mem_proEtaleCover_iff`: Membership is the conjunction of pro-étaleness and the quasicompact image condition.

**Checks.**

- `single_surjective_pro_etale`: A surjective pro-étale map of qcqs perfectoid spaces is a covering.
- `analytic_cover`: A jointly surjective family of open immersions is a covering (the degenerate case).
- `point_surjective_is_not_enough`: A pro-étale family that is surjective on points but where no finite subfamily covers a given quasicompact open by images of quasicompact opens is not a covering (the required non-example).
- `matches_scheme_condition`: The image condition is literally Mathlib's quasi-compact cover condition for schemes, transported along the analogy; a definition that is not equivalent to it is wrong.

The source locators are [ECD](#source-ecd) — Section 8, Definition 8.1(i), p. 39; [ECD](#source-ecd) — Section 8, remark after Definition 8.1, p. 39.

*Needs:* `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:CategoryTheory.Pretopology`, `mathlib:CategoryTheory.Precoverage`, `mathlib:AlgebraicGeometry.Scheme.qcPrecoverage`, `mathlib:AlgebraicGeometry.Scheme.ProEt.precoverage`, `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`, `PerfectoidSpaces:P6/pro-etale-map`, `PerfectoidSpaces:P6/pro-etale-stability-and-limits`, `PerfectoidSpaces:P6/kappa-small-perfectoid-space`.

<a id="d2-2"></a>

### 2.2 The small pro-etale site of a perfectoid space, and the v-site

For a perfectoid space X, the pro-étale site X_proet is the Grothendieck topology on the category of perfectoid spaces pro-étale over X, with the same coverings as in the big site; there is a kappa-small variant. The v-site is the Grothendieck topology on Perfd, respectively Perfd_kappa, in which a family {f_i : Y_i → X} is a covering if for every quasicompact open U of X there is a finite subset J and quasicompact opens V_i of Y_i for i in J with U contained in the union of the images; no condition at all is placed on the maps themselves. There is no small v-site of a perfectoid space, since by design it would contain all perfectoid spaces over X.

The v-covering condition is the pro-étale one with the pro-étaleness dropped; this is the only difference. ECD records that no small v-site exists, so a formalisation must not try to define one.

Construct the following interfaces and prove the stated properties:

- `Perfd.vPrecoverage`: The precoverage on Perfd defined by the finite quasicompact image condition alone.
- `Perfd.vTopology`: The v-topology it generates.
- `Perfectoid.proEtaleSite`: The small pro-étale site of a perfectoid space X.
- `Perfd.proEtaleTopology_le_vTopology`: Every pro-étale cover is a v-cover.
- `Perfd.isVCover_iff_surjective`: A map of qcqs perfectoid spaces is a v-cover exactly when it is surjective on points.
- `Perfd.vPrecoverage.isStableUnderBaseChange`: v-coverings are stable under base change and composition.
- `Perfectoid.proEtaleSite.hasFiniteLimits`: The small pro-étale site has fibre products, supplied by the stability of pro-étale maps.
- `Perfd.vTopology.small`: The v-topology restricts to Perfd_kappa compatibly with the inclusion.

**Checks.**

- `surjection_is_v_cover`: A surjective map of affinoid perfectoid spaces is a v-cover.
- `pro_etale_is_v`: Every pro-étale cover is a v-cover. For an algebraically closed perfectoid field C, the perfectoid closed unit disc maps surjectively to Spa(C, O_C), hence is a v-cover, but is not pro-étale: its rank-one fibre is not profinite (D1.10).
- `no_small_v_site`: The category of perfectoid spaces over X with v-covers is not essentially small, so no small v-site is constructed (the degenerate case that must be refused).
- `empty_cover`: The empty family covers the empty perfectoid space and nothing else.

The source locators are [ECD](#source-ecd) — Section 8, Definition 8.1(ii) and (iii), p. 39; [ECD](#source-ecd) — Section 8, remark after Definition 8.1, p. 39.

*Needs:* `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:CategoryTheory.Pretopology`, `mathlib:CategoryTheory.Over`, `mathlib:AlgebraicGeometry.Scheme.qcPrecoverage`, [D2.1](#d2-1), `PerfectoidSpaces:P6/pro-etale-map`, `PerfectoidSpaces:P6/pro-etale-stability-and-limits`, `PerfectoidSpaces:P6/kappa-small-perfectoid-space`.

<a id="d2-3"></a>

### 2.3 Cohomology does not depend on the cutoff cardinal, and small sheaves

For cutoff cardinals kappa ≤ kappa' as in ECD 4.1 and a kappa-small perfectoid space X, the pullback functor from sheaves on X_proet,kappa to sheaves on X_proet,kappa' is fully faithful and preserves cohomology: for every sheaf of sets, respectively of groups, respectively of abelian groups F, the unit is an isomorphism and the higher direct images vanish in the relevant degrees. The same holds for pro-étale or v-cohomology on Perfd_kappa and their slices. Consequently one defines the category of small sheaves as the filtered colimit over all kappa, and a sheaf commuting with omega_1-filtered colimits of affinoid perfectoid rings is small.

kappa, kappa' cutoff cardinals in the sense of ECD 4.1; X kappa-small. The relevant degrees are zero for sheaves of sets, zero and one for sheaves of groups, and all degrees for abelian groups. Smallness matters because the large sites are not small categories, so 'all sheaves' would not be generated under colimits by the representables.

Compare size-bounded affinoid bases by approximating larger covers with smaller ones. The split strictly totally disconnected refinements give the unit and higher-direct-image assertions. For the change-of-cutoff pullback use κ ≤ κ′ and a κ-small X; the larger-cutoff cohomology then identifies with the smaller-cutoff cohomology.

The source locators are [ECD](#source-ecd) — Section 8, Proposition 8.2 with proof, pp. 39-40; [ECD](#source-ecd) — Section 8, after Proposition 8.2, p. 40.

*Needs:* `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.presheafToSheaf`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.IsFiltered`, [D0.23](#d0-23), [D0.18](#d0-18), [D0.19](#d0-19), [D2.1](#d2-1), [D2.2](#d2-2), `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `PerfectoidSpaces:P6/pro-etale-map`, `PerfectoidSpaces:P6/pro-etale-stability-and-limits`, `PerfectoidSpaces:P6/kappa-small-perfectoid-space`.

<a id="d2-4"></a>

### 2.4 The categories of small sheaves on Perfd and on a pro-etale site are algebraic

The categories of small sheaves on Perfd for either the big pro-étale or the v-topology, and the category of small sheaves on X_proet for a perfectoid space X, are algebraic in the sense of SGA 4 VI: a basis of qcqs objects stable under fibre products is given in all cases by the affinoid perfectoid spaces. Moreover a perfectoid space X is quasicompact, respectively quasiseparated, in any of these settings if and only if |X| is quasicompact, respectively quasiseparated. For a map of stacks on such a site, quasiseparatedness is required to mean that the diagonal is quasicompact and quasiseparated, which for stacks is not automatic since the diagonal need not be injective.

The final object of these categories is not quasiseparated, so object-level and map-level quasicompactness must be kept apart, as recorded in the object/morphism distinction in D0. ECD leaves the proof to the reader; the content is the verification of the axioms of an algebraic topos for the affinoid basis.

The source locators are [ECD](#source-ecd) — Section 8, Proposition 8.3, p. 41; [ECD](#source-ecd) — Section 8, Convention 8.4, p. 41.

*Needs:* `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.Precoherent`, [D0.17](#d0-17), [D2.1](#d2-1), [D2.2](#d2-2), [D2.3](#d2-3), `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`.

*Structure sheaves and descent.*

<a id="d2-5"></a>

### 2.5 Comparison of the pro-etale and etale sites, and the structure sheaves on the pro-etale site

Let X be a perfectoid space and nu : X_proet → X_et the natural map of sites. For every sheaf F on X_et the adjunction F → nu_* nu^* F is an equivalence, and for F abelian R^i nu_* nu^* F = 0 for i at least 1. For an affinoid pro-étale Y = lim Y_i over an affinoid open X_0 of X the natural map colim_i F(Y_i) → (nu^* F)(Y) is an isomorphism. The presheaves O and O^+ on X_proet are small sheaves, and for X affinoid perfectoid H^i(X_proet, O) = 0 for i > 0 and H^i(X_proet, O^+) is almost zero for i > 0.

X a perfectoid space; the affinoid case is the substance and the general case is local. The almost vanishing for O^+ is genuinely almost and not exact; this is inherited from the almost acyclicity on affinoid perfectoids supplied by P2.

The source locators are [ECD](#source-ecd) — Section 8, Proposition 8.5 with proof, pp. 41-42; [ECD](#source-ecd) — Section 8, proof of Proposition 8.5, p. 42.

*Needs:* `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.Sheaf.cohomologyPresheaf`, [D2.2](#d2-2), [D2.3](#d2-3), [D0.19](#d0-19), `PerfectoidSpaces:P3/etale-site-tilting-and-etale-almost-acyclicity`, `PerfectoidSpaces:P2/sheaf-theorem-and-almost-acyclicity`, `PerfectoidSpaces:P5/finite-stage-descent-of-qcqs-etale-objects`, `PerfectoidSpaces:P0/almost-modules-over-perfectoid-base`, `PerfectoidSpaces:P6/pro-etale-map`, `PerfectoidSpaces:P6/pro-etale-stability-and-limits`, `PerfectoidSpaces:P6/kappa-small-perfectoid-space`.

<a id="d2-6"></a>

### 2.6 The big pro-etale site is subcanonical

On the big pro-étale site, both assignments X ↦ O_X(X) and X ↦ O⁺_X(X) satisfy the small-sheaf condition. Representable presheaves also satisfy it: for a perfectoid X, the assignment Y ↦ Hom(Y, X) is a small pro-étale sheaf. Thus this topology is subcanonical.

The reduction to the small site uses that a cover in the big site is also a cover in the small pro-étale site of the target.

The source locators are [ECD](#source-ecd) — Section 8, Corollary 8.6 with proof, p. 42.

*Needs:* `mathlib:CategoryTheory.GrothendieckTopology.Subcanonical`, [D2.5](#d2-5), [D0.7](#d0-7), [D2.1](#d2-1).

<a id="d2-7"></a>

### 2.7 O and O^+ are v-sheaves and the v-site is subcanonical

The presheaves O and O^+ on the v-site are small sheaves, and the v-site is subcanonical: for every perfectoid space X the functor Y mapsto Hom(Y, X) is a small v-sheaf.

Since O^+ inside O is the subpresheaf of functions of absolute value at most 1, and that condition may be checked after a v-cover, it is enough to prove that O is a v-sheaf. Separatedness of O is immediate because O(X) injects into the product of the completed residue fields.

Refine an affinoid v-cover over a totally disconnected base and use the faithful flatness of S⁺/ϖ over R⁺/ϖ to obtain the integral Čech exactness modulo ϖ. Pass to completed integral rings using the supplied almost-exactness comparison, invert ϖ for O, and check the plus condition by valuations. For a general affinoid X, first use a disconnected pro-étale cover. Subcanonicity follows by reconstructing maps from compatible functions and valuations.

The source locators are [ECD](#source-ecd) — Section 8, Theorem 8.7 with proof, p. 43; [ECD](#source-ecd) — Section 8, proof of Theorem 8.7, p. 43; [Sch12](#source-sch12) — §6, Proposition 6.18 and proof, p. 38.

*Needs:* `mathlib:CategoryTheory.GrothendieckTopology.Subcanonical`, `mathlib:Module.FaithfullyFlat`, [D1.6](#d1-6), [D1.8](#d1-8), [D2.6](#d2-6), [D2.2](#d2-2), `PerfectoidSpaces:P0/almost-modules-over-perfectoid-base`, `PerfectoidSpaces:P2/completed-tensor-plus-ring-almost-formula`.

<a id="d2-8"></a>

### 2.8 Higher v-acyclicity and almost acyclicity on affinoid perfectoid spaces

Let X be an affinoid perfectoid space. Then H^i_v(X, O) = 0 for i > 0, and H^i_v(X, O^+) is almost zero for i > 0. Together with the v-sheaf property this is Theorem 1.2 of the introduction: v-cohomology of O on an affinoid perfectoid space is concentrated in degree zero, where it is R, and v-cohomology of O^+ is almost concentrated in degree zero, where it is R^+.

X affinoid perfectoid; no totally disconnectedness is assumed in the statement, only in the first step of the proof. The vanishing for O^+ is only almost; this is not a defect of the proof.

The passage from reduction modulo ϖ to the completed Čech complex needs a bounded-below, degreewise ϖ-torsion-free comparison from P2. Prove it degree by degree with Milnor exact sequences and products of almost-zero groups; control both lim and lim¹. The bounded-complex version alone does not justify this step. Pro-étale disconnected refinements and the D0 acyclic-basis comparison then extend the result to all affinoid perfectoid X.

The source locators are [ECD](#source-ecd) — Section 8, Proposition 8.8 with proof, p. 43; [ECD](#source-ecd) — Section 1, Theorem 1.2, p. 3.

*Needs:* `mathlib:CategoryTheory.Sheaf.cohomologyPresheaf`, [D1.6](#d1-6), [D1.8](#d1-8), [D0.19](#d0-19), [D2.7](#d2-7), [D2.5](#d2-5), `PerfectoidSpaces:P0/almost-modules-over-perfectoid-base`, `PerfectoidSpaces:P2`, [D0.18](#d0-18), [D2.4](#d2-4).

<a id="d2-9"></a>

### 2.9 Pro-étale and v vector bundles

For a perfectoid space X, pullback gives equivalences between finite locally free O_X-modules on its analytic site, its étale site, its small pro-étale site (completed structural sheaf), the corresponding big pro-étale site and Perf/X with the v-topology. On an affinoid perfectoid Spa(R,R⁺), these are finite projective R-modules. For a rigid variety X/K, the comparison among the pro-étale versions and the v-site Perf_K/X with completed O also holds, by descent on perfectoid covers. It does not assert that every v-vector bundle on a general rigid X comes from an analytic O_X-vector bundle.

Completed structural sheaves on the pro-étale sites; rigid-site v-objects are perfectoid spaces mapping directly to X; no diamond functor in the construction.

The substantive v-descent step is convergent matrix descent. Find a stable integral lattice and, locally, a basis for which the two pullback bases differ by a matrix equal to 1 modulo topological nilpotents. Establish this first over perfectoid fields and spread it out. Use higher v-acyclicity to correct the matrix successively, verify convergence in the completed tensor products, and prove effectivity. Import the analytic/étale finite-projective comparison from A1. Ordinary faithfully flat module descent does not replace this completed-cover argument.

The source locators are [KL16](#source-kl16) — §3.5, Theorem 3.5.8 and proof, p. 76; [Heuer](#source-heuer) — §2.1, site conventions and citation [27, Theorem 3.5.8], pp. 5–6.

*Needs:* [D2.2](#d2-2), [D2.7](#d2-7), [D2.8](#d2-8), `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `AdicEtaleGeometry:A1/etale-site`.

### Examples

A surjective affinoid map gives a v-cover; a perfectoid disc over an algebraically closed point gives one that is not pro-étale. An empty covering family covers exactly the empty space. Higher cohomology of integral functions is almost zero, whereas the corresponding statement for functions is actual vanishing.

### Dependencies

Layers 0–1; PerfectoidSpaces P0–P3 and P6; AdicEtaleGeometry A1 for the analytic/étale finite-projective comparison.

<a id="d3"></a>

## Layer 3: Effective descent and morphisms of stacks

Subcanonicity gives descent of morphisms immediately, but descent of objects requires reconstruction of both the perfectoid algebra and its plus ring. The separated pro-étale argument uses strictly totally disconnected bases. These results then justify the target-local morphism tests, so those tests must not be used to prove their own descent inputs.

*Effectivity of descent.*

<a id="d3-1"></a>

### 3.1 The prestacks of perfectoid spaces over a base, and full faithfulness of v-descent for morphisms

Assign to each perfectoid base X the groupoid F(X) of perfectoid spaces over X. Restriction to a v-cover Y→X induces a fully faithful functor from F(X) to the descent-data category F(Y/X) of ECD 9.1: compatible morphisms on the cover descend uniquely. Establish the same full-faithfulness statement after restricting the objects to each of four classes: affinoid perfectoid, separated pro-étale perfectoid, separated étale perfectoid, and finite étale perfectoid. The subsequent effectivity statements concern these four restrictions.

The only input is subcanonicity of the v-site; no restriction on the v-cover or on the spaces is needed. The abstract notion of descent data and the assertion that a stack has an equivalence onto it are supplied by Mathlib descent API; apply it to the geometric prestacks.

The source locators are [ECD](#source-ecd) — Section 9, Definition 9.1, p. 44; [ECD](#source-ecd) — Section 9, Lemma 9.2 with proof, p. 44.

*Needs:* `mathlib:CategoryTheory.Pseudofunctor.DescentData`, `mathlib:CategoryTheory.Pseudofunctor.IsPrestack`, `mathlib:CategoryTheory.Pseudofunctor.toDescentData`, `mathlib:CategoryTheory.Pseudofunctor.sheafHom`, [D2.7](#d2-7), [D0.25](#d0-25).

<a id="d3-2"></a>

### 3.2 A subset whose preimage is cut out by functions is itself cut out by functions

Work over a totally disconnected affinoid perfectoid X=Spa(R,R⁺). Let X tilde=Spa(R tilde,R tilde⁺) be affinoid perfectoid over X, with A ⊂ |X tilde|. Suppose an affinoid perfectoid surjection Y=Spa(S,S⁺)→X makes the inverse image of A in |Y tilde|, for Y tilde=X tilde×_X Y, an intersection of inequalities |g|≤1 with g∈S tilde. Then A itself is an intersection of inequalities |f|≤1 for f∈R tilde. Include the auxiliary point-lifting result: a rational subset of a perfectoid ball over (C,C⁺) has a (C,C⁺)-point if it maps onto Spa(C,C⁺).

X totally disconnected; the conclusion is about the ring R tilde, not R tilde^+. The proof has three reduction steps, each of which is a separate argument: to X connected, to the residue field algebraically closed, and then the ball argument.

Reduce to a connected component, then to an algebraically closed residue field, and finally to the rational ball section argument. SF.2 supplies a finite flat locally free refinement of a finitely presented faithfully flat cover over a strictly henselian local ring. Over C⁺/C⁰⁰ the fraction field is algebraically closed; extend a generic section by properness. Strict henselianity alone does not split arbitrary finite flat covers. R2 must allow arbitrary-height valuation rings: flat finite type implies finite presentation, and the formal specialization step must lift the required field-valued point to an O_C-valued point.

The source locators are [ECD](#source-ecd) — Section 9, Lemma 9.4 with proof, pp. 45-46; [ECD](#source-ecd) — Section 9, Lemma 9.5 with proof, pp. 46-47.

*Needs:* `mathlib:ValuationSubring`, `mathlib:LinearMap.charpoly`, `mathlib:Module.Free`, `mathlib:IsAlgClosed`, [D1.5](#d1-5), [D0.3](#d0-3), [D1.3](#d1-3), `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`, `SchemeAndStackFoundations:SF.2`, `AdicSpacesPartII:R2`, `AdicSpacesPartII:R2/specialisation-map`.

<a id="d3-3"></a>

### 3.3 Effective v-descent for affinoid perfectoid spaces over a totally disconnected base

For affinoid perfectoid X, write F(X) for the groupoid of affinoid perfectoid spaces over X. If X is totally disconnected and Y→X is a v-cover with affinoid perfectoid Y, restriction gives an equivalence F(X)≃F(Y/X). Effectivity requires reconstruction of the Tate ring together with its integral subring; a descent theorem for functions alone does not establish this equivalence.

X totally disconnected and Y affinoid: both hypotheses are used, the first for automatic flatness, the second for the almost faithfully flat descent of algebras. The descent of the subring of integral elements is a separate step, carried out by the following lemma on subsets cut out by |f| at most 1.

Descend the almost algebra modulo a pseudouniformizer and reconstruct a perfectoid Tate algebra with compatible completed base change. This needs the general-base mod-pseudouniformizer reconstruction theorem, whose exact hypotheses must be supplied in addition to tilting equivalence. Descend the plus ring separately through the preceding function-cut-out subset criterion.

The source locators are [ECD](#source-ecd) — Section 9, Proposition 9.3 with proof, p. 44; [ECD](#source-ecd) — Section 9, proof of Proposition 9.3, p. 44.

*Needs:* `mathlib:Module.FaithfullyFlat`, [D1.6](#d1-6), [D1.1](#d1-1), [D3.1](#d3-1), [D3.2](#d3-2), `PerfectoidSpaces:P0/almost-modules-over-perfectoid-base`, `PerfectoidSpaces:P1/tilting-equivalence-and-explicit-tilt`, `PerfectoidSpaces:P0/almost-faithfully-flat-descent`.

<a id="d3-4"></a>

### 3.4 Effective v-descent for separated pro-etale perfectoid spaces over a strictly totally disconnected base

For each perfectoid X, let F(X) classify separated pro-étale perfectoid spaces over X. Once X is strictly totally disconnected, any v-cover Y→X gives an equivalence between F(X) and the category F(Y/X) of descent data. Thus the restriction functor is essentially surjective as well as fully faithful under this base hypothesis.

X strictly totally disconnected; the separatedness assumption on the pro-étale objects cannot be dropped, and ECD says so explicitly. One may assume Y strictly totally disconnected as well, by refining along the universally open cover.

Use the D1 classification on the strictly totally disconnected base, descend the profinite component parameter and its pro-constructible generalizing image, and apply the function-cut-out subset criterion to recover the perfectoid structure. The elementary special construction used in ECD Lemma 9.9 is proved here; it does not assume the later general canonical compactification theorem.

The source locators are [ECD](#source-ecd) — Section 9, Proposition 9.6 with proof, p. 47.

*Needs:* [D0.8](#d0-8), [D0.9](#d0-9), [D1.11](#d1-11), [D1.4](#d1-4), [D1.5](#d1-5), [D3.3](#d3-3), [D3.1](#d3-1).

<a id="d3-5"></a>

### 3.5 Separated etale and finite etale perfectoid spaces form v-stacks

Effective v-descent holds for the groupoid of separated étale objects over each perfectoid base, and for the groupoid of finite étale objects. These stack assertions give local criteria for morphisms. Given f : Y → X and a v-cover X̃ → X, write f̃ for the pullback. Étaleness or finite étaleness of f̃ implies the corresponding property of f. If X is strictly totally disconnected, pro-étaleness of f̃ likewise implies pro-étaleness of f.

The étale case needs separatedness, as in the pro-étale case. The finite étale case does not, because finite étale maps are automatically separated. The last three implications are the v-local nature of the three classes of morphisms, which is what makes the definitions of section 10 work.

The source locators are [ECD](#source-ecd) — Section 9, Proposition 9.7 with proof, pp. 47-48; [ECD](#source-ecd) — Section 9, Lemma 9.9 and Corollary 9.11, p. 49.

*Needs:* `mathlib:CategoryTheory.Pseudofunctor.IsStack`, [D3.4](#d3-4), [D1.9](#d1-9), [D1.11](#d1-11), [D0.9](#d0-9), [D0.7](#d0-7), `PerfectoidSpaces:P5/finite-stage-descent-of-qcqs-etale-objects`, `PerfectoidSpaces:P3/almost-purity-theorem`.

*Morphisms and their target-local tests.*

<a id="d3-6"></a>

### 3.6 Etale, finite etale and quasi-pro-etale morphisms of pro-etale stacks

Let f : Y' → Y be a map of pro-étale stacks on Perfd. Local separatedness means that Y' has an open cover on which f becomes separated. The map f is quasi-pro-étale if it is locally separated and for every strictly totally disconnected perfectoid space X with a map X → Y the pullback Y' x_Y X is representable and Y' x_Y X → X is pro-étale; f is étale if it is locally separated and for every perfectoid space X with a map X → Y the pullback is representable and étale over X; f is finite étale if for every perfectoid space X with a map X → Y the pullback is representable and finite étale over X. Local separatedness is part of the definition of étale and quasi-pro-étale, by ECD Convention 10.2; it is not imposed on finite étale maps, which are automatically separated.

Local separatedness is part of the definition, not a consequence: ECD makes it a standing convention because otherwise a slightly different definition would be wanted. Perfectoid representability belongs to these morphism tests. It is not a condition on every morphism of diamonds. A map from a perfectoid source to a v-sheaf is automatically locally separated. A map is automatically locally separated if Y' is a perfectoid space and Y is a v-sheaf.

Construct the following interfaces and prove the stated properties:

- `Perfd.Stack.IsQuasiProEtale`: The predicate on a locally separated map of pro-étale stacks defined by pullback to strictly totally disconnected perfectoid spaces.
- `Perfd.Stack.IsEtale`: The corresponding predicate defined by pullback to arbitrary perfectoid spaces.
- `Perfd.Stack.IsFiniteEtale`: The predicate defined by representable finite étale pullbacks; local separatedness is automatic.
- `Perfd.Stack.IsLocallySeparated`: The standing hypothesis of Convention 10.2, that f becomes separated on an open cover of the source.
- `Perfd.Stack.isQuasiProEtale_comp`: Composites of quasi-pro-étale maps are quasi-pro-étale, and likewise in the étale and finite étale cases.
- `Perfd.Stack.isQuasiProEtale_of_comp`: If g and g composed with f are in the class then so is f.
- `Perfd.Stack.isQuasiProEtale_pullback`: The classes are stable under base change.
- `Perfd.Stack.isQuasiProEtale_iff_isProEtale`: For a map of perfectoid spaces over a strictly totally disconnected base, quasi-pro-étale is equivalent to pro-étale.
- `Perfd.Stack.isEtale_iff_of_perfectoid`: For a map of perfectoid spaces the étale and finite étale predicates agree with the absolute ones.

**Checks.**

- `pro_etale_of_perfectoid_spaces`: A pro-étale map of perfectoid spaces is quasi-pro-étale; the converse fails for a general base (a non-example).
- `open_immersion`: An open immersion is étale, and a finite disjoint union of isomorphisms is finite étale (the degenerate cases).
- `locally_separated_is_needed`: For a morphism failing local separatedness, both the étale and quasi-pro-étale predicates are false even when their other pullback conditions are postulated. This checks that Convention 10.2 is present in each predicate; it asserts no unsupported geometric quotient example.
- `agrees_with_absolute_notion`: For a map of perfectoid spaces the predicates agree with the usual étale and finite étale notions of ECD section 6.

The source locators are [ECD](#source-ecd) — Section 10, Definition 10.1 and Convention 10.2, pp. 49-50; [ECD](#source-ecd) — Section 10, Proposition 10.3 and Proposition 10.4, p. 50.

*Needs:* `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.MorphismProperty`, [D1.4](#d1-4), [D2.1](#d2-1), [D3.5](#d3-5), `PerfectoidSpaces:P6/pro-etale-map`, `PerfectoidSpaces:P6/pro-etale-stability-and-limits`, `PerfectoidSpaces:P6/kappa-small-perfectoid-space`.

<a id="d3-7"></a>

### 3.7 Sub-v-sheaves of a totally disconnected space are ind-representable, and quasicompact injections

Let X be a totally disconnected perfectoid space and Y a sub-v-sheaf of X. Then Y is ind-representable: it is the filtered colimit of the Y_i inside Y inside X that are pro-constructible generalizing subsets of X, each of which is affinoid pro-étale over X. Consequently a quasicompact injection f : Y' → Y of v-stacks is quasi-pro-étale, and for every totally disconnected perfectoid space X over Y the fibre product Y' x_Y X is represented by a pro-constructible generalizing subset of X.

X totally disconnected; Y only a sub-v-sheaf, with no representability assumed. The corollary needs quasicompactness of the injection to pass from ind-representable to representable.

The source locators are [ECD](#source-ecd) — Section 10, Proposition 10.5 with proof, pp. 50-51; [ECD](#source-ecd) — Section 10, Corollary 10.6 with proof, p. 51.

*Needs:* `mathlib:Topology.IsConstructible`, `mathlib:StableUnderGeneralization`, [D1.5](#d1-5), [D0.3](#d0-3), [D3.6](#d3-6), [D2.7](#d2-7).

<a id="d3-8"></a>

### 3.8 Open and closed immersions, separated maps and 0-truncated maps of pro-etale stacks

Let f : Y' → Y be a map of pro-étale stacks. It is an open immersion if for every perfectoid space X over Y the pullback Y' x_Y X → X is representable by an open immersion; a closed immersion if for every totally disconnected perfectoid space X over Y the pullback is representable by a closed immersion; separated if the diagonal is a closed immersion; 0-truncated if for all perfectoid X the functor of groupoids Y'(X) → Y(X) is faithful. A pro-étale stack Y is separated if Y → the final object is separated; this last notion needs care, since Y separated does not imply Y quasiseparated.

Closed immersions are tested only on totally disconnected bases, because it is there that sub-v-sheaves are ind-representable. 0-truncatedness is equivalent to asking that Y' x_Y X is a sheaf for all X, and to asking that the diagonal of f is an injection; separated maps are 0-truncated. The absolute notion differs from quasiseparatedness of the object. ECD Remark 10.8 asserts existence of some characteristic-p perfectoid X for which X/φ^ℤ is separated but not quasiseparated; it does not assert this for every X (the empty X already rules that out).

Construct the following interfaces and prove the stated properties:

- `Perfd.Stack.IsOpenImmersion`: The predicate defined by representable open-immersion pullbacks.
- `Perfd.Stack.IsClosedImmersion`: The predicate defined by representable closed-immersion pullbacks over totally disconnected bases.
- `Perfd.Stack.IsSeparated`: The predicate that the diagonal is a closed immersion.
- `Perfd.Stack.IsZeroTruncated`: The predicate that the map is faithful on groupoids of points.
- `Perfd.Stack.isZeroTruncated_iff_diagonal_injection`: 0-truncatedness is equivalent to the diagonal being an injection, and to the fibres being sheaves.
- `Perfd.Stack.isSeparated_iff_valuative`: The valuative criterion for separatedness of ECD 10.9.
- `Perfd.Stack.isSeparated_uniqueness_general_pair`: The variant for a general perfectoid Tate pair, ECD 10.10.
- `Perfd.Stack.isSeparated_comp`: The four classes are stable under composition and base change.
- `Perfd.Stack.isSeparated_of_perfectoid`: For a map of perfectoid spaces the notions agree with those of PerfectoidSpaces:P4.

**Checks.**

- `open_immersion_of_perfectoid_spaces`: An open immersion of perfectoid spaces is an open immersion of v-sheaves and conversely.
- `separated_not_quasiseparated`: There exists a characteristic-p perfectoid X for which X/φ^ℤ is separated and not quasiseparated, as in ECD Remark 10.8. Instantiate a suitable nonempty X when typing this test; do not quantify universally over X.
- `classifying_stack_not_zero_truncated`: The classifying stack of a nontrivial locally profinite group is not 0-truncated (the degenerate stack case).
- `valuative_criterion`: A map of perfectoid spaces is separated exactly when the valuative criterion holds, matching PerfectoidSpaces:P4.

The source locators are [ECD](#source-ecd) — Section 10, Definition 10.7 and Remark 10.8, p. 51; [ECD](#source-ecd) — Section 10, Proposition 10.9 and Proposition 10.10, pp. 51-52.

*Needs:* `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.Functor.Faithful`, [D3.7](#d3-7), [D3.6](#d3-6), [D1.1](#d1-1), `PerfectoidSpaces:P4/valuative-criterion-separatedness`, `PerfectoidSpaces:P4/maps-of-affinoid-perfectoid-spaces-are-separated`.

<a id="d3-9"></a>

### 3.9 The classes of morphisms may be checked v-locally on the target

Let f : Y' → Y be a map of v-stacks, g : Y tilde → Y a surjective map of v-stacks and f tilde the pullback of f. If f tilde is quasicompact, respectively quasiseparated, then so is f; if f tilde is an open, respectively closed, immersion then so is f; if f tilde is separated then so is f; if f tilde is finite étale then so is f; if f tilde is separated and étale then f is separated and étale; if f tilde is separated and quasi-pro-étale then f is separated and quasi-pro-étale.

The last two statements use separatedness to apply the descent theorems of section 9. These arguments do not supply descent of arbitrary nonseparated étale or quasi-pro-étale objects. For the quasi-pro-étale statement one reduces to X strictly totally disconnected, and for the étale statement to X arbitrary.

The source locators are [ECD](#source-ecd) — Section 10, Proposition 10.11 with proof, pp. 52-53.

*Needs:* [D3.5](#d3-5), [D3.4](#d3-4), [D3.7](#d3-7), [D3.8](#d3-8), [D0.7](#d0-7), [D2.2](#d2-2).

*Locally profinite torsors.*

<a id="d3-10"></a>

### 3.10 Torsors under a locally profinite group and their pro-etale presentation

For a topological space T let T underline be the v-sheaf sending X to the continuous maps from |X| to T. Let G be a locally profinite group. A G underline-torsor is a map f : X tilde → X of v-stacks with an action of G underline over X such that v-locally on X there is a G underline-equivariant isomorphism between X tilde and G underline times X. If X is a perfectoid space, then X tilde is representable by a perfectoid space, X tilde → X is pro-étale, universally open and a v-cover; for every open subgroup K of G the pushout X tilde_K along the discrete G-set G/K is separated étale over X, the transition map X tilde_{K'} → X tilde_K is finite étale when K' inside K has finite index, and X tilde is the inverse limit of the X tilde_K.

G locally profinite; X a perfectoid space. The conclusion that X tilde is representable is a theorem, not part of the definition. The functor T mapsto T underline is the bridge between topology and v-sheaves and is used again for the Berkovich quotient in D5 and for the compact Hausdorff diamonds in D4.

Construct the following interfaces and prove the stated properties:

- `Perfd.underlineSheaf`: The v-sheaf T underline attached to a topological space T, sending X to the continuous maps from |X| to T.
- `Perfd.underlineSheaf.isVSheaf`: T underline is a v-sheaf.
- `Perfd.underlineSheaf.functorial`: T mapsto T underline is functorial and sends profinite sets to affinoid perfectoid spaces after multiplying by a base point.
- `Perfd.IsTorsor`: The predicate that f is a G underline-torsor, defined by v-local triviality.
- `Perfd.Torsor.representable`: A G underline-torsor over a perfectoid space is representable by a perfectoid space.
- `Perfd.Torsor.isProEtale`: It is pro-étale, universally open and a v-cover.
- `Perfd.Torsor.levelSpace`: For K an open subgroup, the pushout X tilde_K along G/K, which is separated étale over X.
- `Perfd.Torsor.levelSpace_finiteEtale`: For K' of finite index in K the transition map is finite étale.
- `Perfd.Torsor.asLimit`: X tilde is the inverse limit of the X tilde_K over open subgroups K.

**Checks.**

- `split_torsor`: G underline times X is a G underline-torsor over X and its level spaces are disjoint unions of copies of X (the degenerate case).
- `finite_group`: For G finite, a G underline-torsor is a finite étale Galois cover with group G; a definition that does not recover this is wrong.
- `profinite_over_geometric_point`: For X = Spa(C, O_C) and G profinite, a torsor is X times S for S a profinite set with a free transitive G-action.
- `not_etale`: For G infinite profinite and X nonempty the torsor X tilde → X is pro-étale and not étale (a non-example separating the two classes).

The source locators are [ECD](#source-ecd) — Section 10, Definition 10.12, p. 53; [ECD](#source-ecd) — Section 10, Lemma 10.13 with proof, pp. 53-54.

*Needs:* `mathlib:ContinuousMap`, `mathlib:ProfiniteGrp`, `mathlib:TotallyDisconnectedSpace`, [D3.9](#d3-9), [D3.6](#d3-6), [D2.2](#d2-2), [D0.7](#d0-7).

### Examples

The trivial-group torsor is the identity. An infinite profinite-group torsor over a nonempty base is pro-étale and fails the étale fibre test. A classifying stack retains the automorphism group of the trivial torsor, which separates the stack from its sheaf of isomorphism classes.

### Dependencies

Layers 0–2; PerfectoidSpaces P0–P6 for the specified almost-algebra, residue-field, completed-base-change and pro-étale inputs.

<a id="d4"></a>

## Layer 4: Diamonds and small v-stacks

Pass to characteristic p and construct the quotient as an actual sheaf quotient. A chosen atlas is a presentation, not additional structure on the resulting diamond. The underlying-space construction must compare presentations and preserve open subobjects before it is used to define spatiality. Small stacks retain their 2-categorical relations.

*Diamonds from equivalence relations.*

<a id="d4-1"></a>

### 4.1 Diamonds and pro-etale equivalence relations

Use Perf, the characteristic-p perfectoid category, for this and the following layers. A pro-étale sheaf Y on Perf is a diamond when it has a sheaf-quotient presentation Y≅X/R with X a perfectoid space and R ⊂ X×X a representable equivalence relation for which both projection maps are pro-étale. Call this a pro-étale equivalence relation. The definition does not impose representability of the diagonal by a perfectoid space.

Characteristic p is part of the setting from section 11 onwards; general analytic adic spaces over Z_p enter only through D6. R is required to be representable and the projections pro-étale; the diagonal of Y is not assumed representable, and ECD says explicitly why.

Construct the following interfaces and prove the stated properties:

- `Perf`: The full subcategory of perfectoid spaces of characteristic p, with its pro-étale and v-topologies.
- `Perf.IsProEtaleEquivRel`: The predicate that a representable equivalence relation on a perfectoid space has pro-étale projections.
- `Perf.Diamond`: The predicate on a pro-étale sheaf on Perf that it admits a presentation as such a quotient.
- `Perf.Diamond.ofPerfectoid`: Every characteristic p perfectoid space is a diamond.
- `Perf.Diamond.presentation`: A chosen presentation Y = X/R, together with the maps X → Y and R → X x X.
- `Perf.Diamond.isSmall`: Every diamond is a small sheaf.
- `Perf.Diamond.relation_eq`: For a presentation, the natural map R → X x_Y X is an isomorphism.
- `Perf.Diamond.quasiProEtale_atlas`: The map X → Y from a presentation is surjective and quasi-pro-étale.

**Checks.**

- `representable`: A characteristic p perfectoid space is a diamond, with R the diagonal (the degenerate case).
- `profinite_quotient`: For S profinite with a free action of a finite group G, S underline times Spa(C, O_C) modulo G is a diamond which is a perfectoid space.
- `compact_hausdorff`: For T compact Hausdorff, T underline times Spa(K, O_K) is a diamond whose underlying space is T, which is not spectral in general (a required test of this layer).
- `not_every_v_sheaf`: Not every v-sheaf is a diamond; the definition must not be weakened to 'v-sheaf with a surjection from a perfectoid space' (a non-example, since that is the definition of a small v-sheaf).

The source locators are [ECD](#source-ecd) — Section 11, Definition 11.1 and Definition 11.2, p. 54; [ECD](#source-ecd) — Section 11, remark after Definition 11.2, p. 54.

*Needs:* `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.GrothendieckTopology`, [D2.1](#d2-1), [D2.3](#d2-3), [D3.6](#d3-6), `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`, `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`.

<a id="d4-2"></a>

### 4.2 Quotients by pro-etale equivalence relations, independence of the atlas, and quasi-pro-etaleness of the atlas

Let X be in Perf and R inside X x X a pro-étale equivalence relation. Then the quotient sheaf Y = X/R is a diamond; the natural map R → X x_Y X of sheaves on Perf is an isomorphism; for any pro-étale cover X tilde → X by a perfectoid space the induced R tilde on X tilde is again a pro-étale equivalence relation and X tilde/R tilde → Y is an isomorphism; and the map X → Y is quasi-pro-étale.

The last statement is the substantial one and needs the descent of separated pro-étale spaces over a strictly totally disconnected base. For the last statement one first replaces X by a disjoint union of affinoid opens, which makes s and t separated.

The source locators are [ECD](#source-ecd) — Section 11, Proposition 11.3 with proof, pp. 54-55; [ECD](#source-ecd) — Section 11, Proposition 11.4 with proof, p. 55.

*Needs:* [D4.1](#d4-1), [D3.4](#d3-4), [D3.9](#d3-9), [D3.6](#d3-6), [D0.26](#d0-26), `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`, `PerfectoidSpaces:P6/pro-etale-map`, `PerfectoidSpaces:P6/pro-etale-stability-and-limits`, `PerfectoidSpaces:P6/kappa-small-perfectoid-space`.

<a id="d4-3"></a>

### 4.3 A pro-etale sheaf is a diamond exactly when it admits a surjective quasi-pro-etale map from a perfectoid space

A pro-étale sheaf Y on Perf admits a diamond presentation exactly when it has a quasi-pro-étale atlas q:X→Y with perfectoid X and q surjective as a sheaf map. When X is a coproduct of strictly totally disconnected spaces, its kernel relation R=X×_Y X is pro-étale and the sheaf quotient X/R recovers Y. Deduce three closure statements: a sheaf covered quasi-pro-étale by a diamond is a diamond; a quasi-pro-étale source over a diamond is a diamond; and the sheaf quotient of a diamond by an equivalence relation with quasi-pro-étale projections is a diamond.

The atlas may always be taken to be a disjoint union of strictly totally disconnected perfectoid spaces, which is how every later argument uses it. In the last statement R is only assumed to be a pro-étale sheaf; it is automatically a diamond because s is quasi-pro-étale.

The source locators are [ECD](#source-ecd) — Section 11, Proposition 11.5 with proof, p. 56; [ECD](#source-ecd) — Section 11, Propositions 11.6, 11.7 and 11.8, p. 56.

*Needs:* [D4.2](#d4-2), [D4.1](#d4-1), [D3.6](#d3-6), [D3.9](#d3-9), [D1.4](#d1-4).

<a id="d4-4"></a>

### 4.4 Diamonds are sheaves for the v-topology

Let Y be a diamond. Then Y is a sheaf for the v-topology. Moreover, if f : Y' → Y is an injection of v-sheaves and Y is a diamond, then Y' is a diamond; and a qcqs map f : Y → X of diamonds is an isomorphism if and only if f(K, K^+) is a bijection for every algebraically closed perfectoid field K with an open and bounded valuation subring K^+.

The proof follows an argument of Fargues. The presentation may be taken with X a disjoint union of totally disconnected perfectoid spaces. In the isomorphism criterion the qcqs hypothesis cannot be dropped, and the test fields must be algebraically closed.

The source locators are [ECD](#source-ecd) — Section 11, Proposition 11.9 with proof, pp. 56-57; [ECD](#source-ecd) — Section 11, Proposition 11.10 and Lemma 11.11, p. 57.

*Needs:* [D4.3](#d4-3), [D3.4](#d3-4), [D3.7](#d3-7), [D2.7](#d2-7), [D1.5](#d1-5), `PerfectoidSpaces:P4/valuative-criterion-separatedness`, `PerfectoidSpaces:P4/maps-of-affinoid-perfectoid-spaces-are-separated`.

*Underlying spaces and compact Hausdorff examples.*

<a id="d4-5"></a>

### 4.5 The underlying topological space of a diamond and the open-subfunctor correspondence

Let Y be a diamond with a presentation Y = X/R. There is a canonical bijection between |X|/|R| and the set of equivalence classes of maps Spa(K, K^+) → Y, where K runs over perfectoid fields with an open and bounded valuation subring K^+, two maps being equivalent if they are dominated by a third through surjective maps. The quotient topology induced on this set by the surjection |X| → |Y| is independent of the presentation, and |Y| with that topology is the underlying topological space of Y. Any open subfunctor of Y is a diamond, and U mapsto |U| is a bijection between open immersions into Y and open subsets of |Y|; a surjection of diamonds induces a quotient map on underlying spaces.

The equivalence relation on the set of maps from Spa(K, K^+) is an equivalence relation, which itself needs the surjectivity of a fibre product of surjections of such spectra. Independence of the presentation is proved by comparing two presentations through a third.

Prove domination is an equivalence relation using common perfectoid-field refinements and fibre products of surjective field spectra. Compare atlases through a third atlas and use the quotient topology to descend opens. The equality of the point sets alone is insufficient for presentation-independent topology.

Construct the following interfaces and prove the stated properties:

- `Perf.Diamond.space`: The underlying topological space |Y| of a diamond Y.
- `Perf.Diamond.space_eq_quotient`: For any presentation Y = X/R, |Y| is the quotient |X|/|R| with the quotient topology.
- `Perf.Diamond.space_eq_points`: |Y| is in canonical bijection with the equivalence classes of maps Spa(K, K^+) → Y.
- `Perf.Diamond.space_functorial`: Y mapsto |Y| is a functor to topological spaces.
- `Perf.Diamond.openSubfunctorEquiv`: Open immersions into Y correspond bijectively to open subsets of |Y|.
- `Perf.Diamond.isQuotientMap_of_surjective`: A surjection of diamonds induces a quotient map of underlying spaces.
- `Perf.Diamond.space_of_perfectoid`: For a perfectoid space the construction returns the usual underlying topological space.
- `Perf.Diamond.isOpenImmersion_iff`: A map of diamonds is an open immersion exactly when it is an isomorphism onto the open subfunctor attached to an open subset of |Y|.

**Checks.**

- `perfectoid_space`: For Y a perfectoid space, |Y| is the underlying space of Y.
- `compact_hausdorff`: For Y = T underline times Spa(K, O_K), |Y| = T; in particular |Y| need not be spectral (the required non-example).
- `independent_of_presentation`: Two presentations of the same diamond give the same topology; a construction depending on the atlas is wrong.
- `open_subfunctors`: Open subfunctors of a perfectoid space correspond to open subsets, matching the classical statement (the degenerate case).

The source locators are [ECD](#source-ecd) — Section 11, Proposition 11.13 and Definition 11.14, pp. 59-60; [ECD](#source-ecd) — Section 11, Proposition 11.15 with proof, p. 60.

*Needs:* [D4.1](#d4-1), [D4.2](#d4-2), [D0.7](#d0-7), [D3.9](#d3-9), [D2.2](#d2-2), `PerfectoidSpaces:P2/completed-residue-fields`, `PerfectoidSpaces:P4/residue-field-point-injection`.

<a id="d4-6"></a>

### 4.6 Compact Hausdorff spaces embed fully faithfully into diamonds

Fix a perfectoid field K of characteristic p. The functor sending a compact Hausdorff space T to T underline times Spa(K, O_K) is a fully faithful functor from compact Hausdorff spaces to diamonds over Spa(K, O_K). For S profinite, S underline times Spa(K, O_K) is the affinoid perfectoid space Spa(C^0(S, K), C^0(S, O_K)). The underlying topological space of T underline times Spa(K, O_K) is T, so it can be far from spectral.

T compact Hausdorff; K perfectoid of characteristic p. Full faithfulness uses that every surjection of compact Hausdorff spaces is a quotient map. This is one of the required tests of the layer, and it is what shows that the underlying space of a diamond need not be spectral.

The source locators are [ECD](#source-ecd) — Section 11, Example 11.12 with proof, pp. 58-59; [ECD](#source-ecd) — Section 11, Example 11.12, p. 58.

*Needs:* [D0.16](#d0-16), [D4.1](#d4-1), [D4.2](#d4-2), [D3.10](#d3-10), [D4.5](#d4-5), `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`.

*Small sheaves, stacks and their quotients.*

<a id="d4-7"></a>

### 4.7 Small v-sheaves and small v-stacks

For a v-sheaf Y on Perf, smallness means the existence of a perfectoid atlas X→Y that is surjective in v-sheaves. For a v-stack Y, require a surjective perfectoid atlas whose kernel 2-fibre product X×_Y X is a small v-sheaf. Prove that diamonds are small, that a v-sheaf receiving a surjection from a diamond is small, and that qc v-sheaves and qcqs v-stacks satisfy the respective smallness conditions.

The smallness condition on R in the stack case is what makes the notion manageable; without it the 2-fibre product could fail to be small. Quasicompact objects are automatically small, because one may cover by the disjoint union of all maps from perfectoid spaces and then extract a finite subcover.

Construct the following interfaces and prove the stated properties:

- `Perf.IsSmallVSheaf`: The predicate that a v-sheaf admits a surjection from a perfectoid space.
- `Perf.IsSmallVStack`: The predicate that a v-stack admits a surjection from a perfectoid space with small diagonal fibre product.
- `Perf.IsSmallVSheaf.ofDiamond`: Every diamond is a small v-sheaf.
- `Perf.IsSmallVSheaf.ofSurjectionFromDiamond`: A v-sheaf with a surjection from a diamond is small.
- `Perf.IsSmallVStack.ofQuasicompact`: Every quasicompact v-sheaf, and every qcqs v-stack, is small.
- `Perf.IsSmallVSheaf.relation_isDiamond`: For a surjection from a diamond, the relation is a diamond and the quotient is the given sheaf.
- `Perf.IsSmallVSheaf.relation_locallySpatial`: If the sheaf is quasiseparated and the atlas locally spatial then the relation is locally spatial; if the sheaf is qcqs and the atlas spatial then the relation is spatial.
- `Perf.IsSmallVStack.fibreProduct`: Small v-stacks are stable under 2-fibre products.

**Checks.**

- `diamond`: Every diamond is a small v-sheaf (the degenerate case).
- `classifying_stack`: The classifying stack of a locally profinite nontrivial group G over a geometric point is a small v-stack that is not a v-sheaf.
- `quasicompact_is_small`: A quasicompact v-sheaf is small without any further hypothesis.

The source locators are [ECD](#source-ecd) — Section 12, Definition 12.1, Remark 12.2 and Definition 12.4, pp. 69-70; [ECD](#source-ecd) — Section 12, Proposition 12.3 with proof, p. 70.

*Needs:* [D4.4](#d4-4), [D4.1](#d4-1), [D2.2](#d2-2), [D0.26](#d0-26), [D0.17](#d0-17), [D3.10](#d3-10).

<a id="d4-8"></a>

### 4.8 Underlying spaces, open sub-v-stacks, fibre products, and surjectivity versus topological surjectivity

Let Y be a small v-stack with a presentation Y = X/R, X a diamond, R a small v-sheaf and R tilde → R a surjection from a diamond. There is a canonical bijection between |X|/|R tilde| and the set of maps Spa(K, K^+) → Y modulo the domination relation, and the quotient topology is independent of the presentation; this defines |Y|. Open sub-v-stacks of Y correspond bijectively to open subsets of |Y|, and a surjection of small v-stacks induces a quotient map of spaces. Fibre products of small v-stacks are small v-stacks and the map from the space of the fibre product to the fibre product of the spaces is surjective. Finally, if f is a surjection of v-stacks then |f| is surjective; conversely if f is quasicompact and |f| is surjective then f is a surjection of v-stacks. Without the quasicompactness hypothesis the converse fails.

The two-step presentation is genuine: one could also define |Y| first for small v-sheaves and then for stacks, and the two agree because |R tilde| → |R| is surjective.

Resolve the small relation R by a diamond atlas before taking its topological quotient. The fibre-product map on underlying spaces is surjective, rather than automatically a homeomorphism. Establish local lifting from geometric points for the qc converse to topological surjectivity; keep the qc assumption when applying it.

The source locators are [ECD](#source-ecd) — Section 12, Proposition 12.7, Definition 12.8, Proposition 12.9 and Proposition 12.10, pp. 70-71; [ECD](#source-ecd) — Section 12, Lemma 12.11 with proof, p. 72.

*Needs:* [D4.7](#d4-7), [D4.5](#d4-5), [D0.17](#d0-17), [D3.9](#d3-9), [D2.2](#d2-2), [D0.26](#d0-26), [D0.14](#d0-14).

<a id="d4-9"></a>

### 4.9 Isomorphism and injectivity criteria on geometric points

For a qcqs morphism f:Y′→Y of v-stacks, geometric-point evaluation characterizes isomorphisms: f is an isomorphism exactly when Y′(K,K⁺)→Y(K,K⁺) is an equivalence of groupoids for every algebraically closed perfectoid K and every open bounded valuation subring K⁺. There is a separate injectivity criterion for small v-sheaves. Assume f is qcqs or that both objects are locally spatial. Then sheaf injectivity is equivalent to injectivity of all evaluations on perfectoid fields with open bounded valuation subrings. A third equivalent condition requires both injectivity of |f| and finality of f among maps from small v-sheaves whose underlying spaces factor continuously through |Y′|; equivalently, Y′≅Y×_{underline(|Y|)}underline(|Y′|).

Here quasiseparatedness of a map of stacks is meant in the sense of ECD Convention 8.4. The isomorphism criterion is the tool by which almost every identification in sections 11 to 15 is proved.

The source locators are [ECD](#source-ecd) — Section 12, Lemma 12.5 with proof, p. 70; [ECD](#source-ecd) — Section 12, Proposition 12.15 with proof, pp. 72-73.

*Needs:* [D4.4](#d4-4), [D4.7](#d4-7), [D4.8](#d4-8), [D3.7](#d3-7), [D3.10](#d3-10), `PerfectoidSpaces:P4/valuative-criterion-separatedness`, `PerfectoidSpaces:P4/maps-of-affinoid-perfectoid-spaces-are-separated`.

<a id="d4-10"></a>

### 4.10 Small quotients of v-sheaves

For a small v-sheaf F with an action of a locally profinite group G, the v-sheaf quotient Q=F/underline(G) is small and |Q| is homeomorphic to |F|/G with the quotient topology. A quotient diamond is obtained when the relation is pro-étale and representable by a perfectoid presentation. No formula for set-valued π₀ is asserted without additional hypotheses.

Small F; a continuous sheaf action of underline(G) for locally profinite G.

**Checks.**

- `dense_orbits`: Translation by ℤ on ℤ_p has dense orbits. X is totally disconnected, so (π₀X)/ℤ has many elements, but X/ℤ has the indiscrete topology and one component. The unrestricted formula fails.
- `trivial_group`: For G={1}, the comparison is the identity on π₀X.
- `profinite_transitive_action`: For X=G profinite acting on itself by translation, both sides have one element.

**Missing input.** For each cited period torsor, supply invariant-clopen separation or a geometric proof of transitivity on components with the actual space and group hypotheses; connectedness of Y alone is insufficient.

The source locators are [GLX](#source-glx) — §3, Lemma 3.2, first assertion, pp. 16–17.

*Needs:* [D3.10](#d3-10), [D4.7](#d4-7), [D4.8](#d4-8), [D4.2](#d4-2).

### Examples

The empty relation presents the empty diamond. The diagonal relation presents a perfectoid space. The compact-Hausdorff diamond attached to the unit interval has the unit interval as its underlying space, so spectrality of underlying spaces cannot define all diamonds.

### Dependencies

Layers 0–3; PerfectoidSpaces P2 and P6 for the perfectoid category and its pro-étale morphisms.

<a id="d5"></a>

## Layer 5: Spatial geometry and Hausdorff reduction

First establish spatiality, qc injections and finite étale permanence. Then construct spatial limits and universally open presentations; use these to prove quasi-pro-étale permanence and local étale structure. The later limit-based point localization is distinct from the early localization needed for finite étale permanence. The Berkovich spectrum of a complete Tate ring is constructed here before it is extended to small v-sheaves; relative representability and Hausdorff reduction use the ordinary D0 sheaf theory.

*Spatiality and its first permanence properties.*

<a id="d5-1"></a>

### 5.1 Spatial and locally spatial diamonds, and spatial v-sheaves

Spatiality of a diamond Y requires sheaf-theoretic qcqs and an open basis of |Y| formed by the images |U| of qc open subdiamonds U↪Y. Local spatiality means that spatial open subdiamonds cover Y. Apply the same definitions to v-sheaves, requiring smallness for locally spatial v-sheaves. These conditions involve the subfunctors, rather than spectrality of |Y| alone. Perfectoid spaces are locally spatial; the spatial ones are exactly the qcqs perfectoid spaces.

The basis must consist of qc open subfunctors, with qc and qs in the sheaf-theoretic sense; spectrality of the underlying space alone does not define spatiality. Quasicompactness and quasiseparatedness are meant in the topos sense of D0, applied to the v-topos of Perf.

Construct the following interfaces and prove the stated properties:

- `Perf.Diamond.IsSpatial`: The predicate on a diamond: qcqs, with a basis of quasicompact open subfunctors.
- `Perf.Diamond.IsLocallySpatial`: The predicate that Y has an open cover by spatial diamonds.
- `Perf.VSheaf.IsSpatial`: The same condition for a v-sheaf.
- `Perf.Diamond.IsSpatial.spectralSpace`: |Y| is a spectral space, and locally spectral in the locally spatial case.
- `Perf.Diamond.IsSpatial.quasicompactOpen`: A quasicompact open subfunctor of a spatial diamond is spatial.
- `Perf.Diamond.IsLocallySpatial.isSpectralMap`: For Y' locally spatial over Y, the induced map |Y'| → |Y| is spectral and generalizing.
- `Perf.Diamond.IsLocallySpatial.qcqs_iff`: Y is quasicompact, respectively quasiseparated, exactly when |Y| is.
- `Perf.Diamond.isSpatial_of_perfectoid`: A perfectoid space is locally spatial, and spatial exactly when qcqs.
- `Perf.Diamond.IsLocallySpatial.generalizations_totallyOrdered`: The set of generalizations of a point of |Y| is totally ordered.

**Checks.**

- `qcqs_perfectoid`: A qcqs perfectoid space is a spatial diamond; a non-quasicompact one is locally spatial and not spatial (the degenerate cases).
- `compact_hausdorff_not_spatial`: T underline times Spa(K, O_K) for T compact Hausdorff and not profinite is qcqs and not spatial (the required non-example).
- `space_is_spectral`: Spatiality implies spectrality of |Y|; the required basis consists of qc open subfunctors, not merely arbitrary topological opens.
- `open_subfunctor`: Quasicompact open subfunctors of a spatial diamond are spatial, and the |U| form a basis.

The source locators are [ECD](#source-ecd) — Section 11, Definition 11.17, p. 61; [ECD](#source-ecd) — Section 12, Definition 12.12, p. 72.

*Needs:* [D4.5](#d4-5), [D4.1](#d4-1), [D0.17](#d0-17), [D0.1](#d0-1), [D0.9](#d0-9), [D4.7](#d4-7), [D4.6](#d4-6).

<a id="d5-2"></a>

### 5.2 Quasicompact injections and finite etale maps into a (locally) spatial object

Let Y be a locally spatial diamond and f : Y' → Y a quasicompact injection of v-sheaves. Then Y' is a locally spatial diamond, |Y'| inside |Y| is pro-constructible and generalizing with the subspace topology, and Y' is the fibre product of Y with |Y'| underline over |Y| underline. If instead Y is a (locally) spatial diamond and Y' → Y is a finite étale map of pro-étale sheaves then Y' is a (locally) spatial diamond; the same holds with 'diamond' replaced by 'v-sheaf' and Y spatial.

Y locally spatial; in the injection case quasicompactness of f is needed. The finite étale statement is proved by a local analysis of |Y'| as a tree over |Y| and does not use the universally open presentation, which is why it comes before it. The v-sheaf version of the finite étale statement, ECD Lemma 12.16, has the identical proof and is needed before Theorem 12.18 identifies the two notions.

Finite étale permanence needs an early localization at a point before the spatial limit theorem. Intersect qc open neighbourhoods as a sub-v-sheaf and show that pullback to a strictly totally disconnected atlas is its pro-constructible generalizing perfectoid subspace. Prove the finite étale spectral-tree argument there and spread it to a qc neighbourhood. The later inverse-limit localization uses the spatial limit theorem, whose proof already needs finite étale permanence, so it cannot serve as this earlier input.

The source locators are [ECD](#source-ecd) — Section 11, Proposition 11.20 with proof, p. 62; [ECD](#source-ecd) — Section 11, Lemma 11.21 and Section 12, Lemma 12.16, pp. 62, 73.

*Needs:* [D5.1](#d5-1), [D3.7](#d3-7), [D4.9](#d4-9), [D1.5](#d1-5), [D4.3](#d4-3), [D0.9](#d0-9), [D0.3](#d0-3).

*Limits and universally open presentations.*

<a id="d5-3"></a>

### 5.3 Cofiltered limits of diamonds and of small v-sheaves, and finite-stage etale comparisons

Let Y_i be a cofiltered inverse system of diamonds with qcqs transition maps and Y its limit. Then Y is a diamond, |Y| → lim |Y_i| is a continuous bijection, and the maps Y → Y_i are qcqs; if all Y_i are (locally) spatial then so is Y and |Y| → lim |Y_i| is a homeomorphism. If kappa is a cutoff cardinal, the index category is kappa-small and all Y_i are kappa'-small for some kappa' < kappa, then Y is kappa-small. For a cofiltered system of qcqs diamonds, base change gives equivalences from the 2-colimit of the categories of finite étale, of qcqs étale, and of quasicompact separated étale objects over the Y_i to the corresponding categories over Y. The same statements hold for small v-sheaves.

Transition maps qcqs. The smallness clause uses clause (iii) of the cutoff cardinal lemma. In the étale statements all maps are locally separated by Convention 10.2, which is what makes the reduction to the quasicompact separated case possible.

Use ordinal chains of cofiltered subdiagrams for cardinal induction, with a countable cofinal sequence in the countable case. For finite-stage equivalence prove essential surjectivity and descent of morphisms, then pass from finite étale and qc separated étale objects to qcqs étale objects by finite open gluing. The κ-small limit bound uses the third clause of the cutoff theorem, not merely the strong-limit condition.

The source locators are [ECD](#source-ecd) — Section 11, Lemma 11.22 with proof, pp. 63-64; [ECD](#source-ecd) — Section 11, Proposition 11.23 and Lemma 12.17, pp. 64, 73-74.

*Needs:* [D5.1](#d5-1), [D5.2](#d5-2), [D0.10](#d0-10), [D0.23](#d0-23), [D3.5](#d3-5), [D4.7](#d4-7), `PerfectoidSpaces:P5/finite-stage-descent-of-qcqs-etale-objects`, [D0.14](#d0-14).

<a id="d5-4"></a>

### 5.4 The universally open strictly totally disconnected presentation of a spatial diamond, and its converse

Use E for the class of étale maps obtained by composing qc open immersions and finite étale maps. Every spatial diamond Y has a strictly totally disconnected perfectoid presentation X → Y which is universally open, surjective and quasi-pro-étale, with a cofiltered E-presentation. When Y is κ-small for a cutoff cardinal κ, choose X κ-small as well. In the other direction, a qcqs diamond is spatial if it has a universally open surjective quasi-pro-étale cover by a perfectoid space; a (locally) spatial diamond may replace that covering space. The key splitting criterion constructs a strictly totally disconnected perfectoid space from a spatial diamond on which every surjective E-cover has a section.

The class of étale maps used is not all étale maps but those that are composites of quasicompact open immersions and finite étale maps; this is exactly the class produced by the local structure theorem and is what makes the cardinality count work. The converse uses the open case of the spectral quotient criterion.

Split the restricted class of étale covers consisting of qc open immersions followed by finite étale maps and identify the resulting limit with a strictly totally disconnected perfectoid space. Recover its perfectoid algebra using the same general-base reconstruction input as D3. Universal openness and the open spectral quotient criterion prove the converse. Keep this presentation ahead of quasi-pro-étale permanence.

The source locators are [ECD](#source-ecd) — Section 11, Proposition 11.24 with proof, p. 65; [ECD](#source-ecd) — Section 11, Proposition 11.26 and Lemma 11.27, pp. 65-67.

*Needs:* [D5.1](#d5-1), [D5.3](#d5-3), [D0.9](#d0-9), [D1.9](#d1-9), [D1.4](#d1-4), [D0.23](#d0-23), [D4.4](#d4-4), [D3.10](#d3-10).

<a id="d5-5"></a>

### 5.5 Quasi-pro-etale maps into a locally spatial diamond, and fibre products

Local spatiality passes from a diamond Y to any pro-étale sheaf Y′ with a quasi-pro-étale morphism Y′ → Y; the morphism includes local separatedness under Convention 10.2. Fibre products preserve spatiality and local spatiality. For a qcqs diamond Y, a universally open surjective quasi-pro-étale cover by a (locally) spatial diamond already forces Y to be spatial.

The proofs use the universally open strictly totally disconnected presentation, which is why these statements come after it and not with the injection and finite étale cases. The last statement is ECD Remark 11.25 and is the form in which the converse of the presentation theorem is applied.

The source locators are [ECD](#source-ecd) — Section 11, Corollary 11.28 and Corollary 11.29 with proofs, pp. 67-68; [ECD](#source-ecd) — Section 11, Remark 11.25, p. 65.

*Needs:* [D5.4](#d5-4), [D5.2](#d5-2), [D0.9](#d0-9), [D4.3](#d4-3), [D3.6](#d3-6), [D5.1](#d5-1).

*Local geometry and geometric point criteria.*

<a id="d5-6"></a>

### 5.6 The two-out-of-three property for quasi-pro-etale, etale and finite etale maps

Consider f : Y₁ → Y₂ and g : Y₂ → Y₃ in locally spatial diamonds, with h=g∘f. Suppose f is a surjective quasi-pro-étale map, h is quasi-pro-étale, and g is separated. These hypotheses force g to be quasi-pro-étale. Requiring f and h both étale forces g to be étale; requiring both finite étale forces g to be finite étale.

All three of the hypotheses on f, g and h are needed; ECD gives no version without the separatedness of g. The proof is a careful reduction to the case of a connected strictly totally disconnected base.

The source locators are [ECD](#source-ecd) — Section 11, Proposition 11.30 with proof, pp. 68-69.

*Needs:* [D5.5](#d5-5), [D5.4](#d5-4), [D4.4](#d4-4), [D3.8](#d3-8), [D1.10](#d1-10), [D1.5](#d1-5), `PerfectoidSpaces:P4/residue-field-point-injection`.

<a id="d5-7"></a>

### 5.7 Local structure of etale maps of locally spatial diamonds

Let f : Y' → Y be an étale map of locally spatial diamonds. Then for every point y' of |Y'| with image y, there are open neighbourhoods V' of y' in Y' and V of y in Y containing f(V') such that the restriction of f to V' factors as a quasicompact open immersion of V' into some W followed by a finite étale map W → V. This generalizes the corresponding local structure theorem for étale maps of perfectoid spaces, and by Convention 10.2 f is required to be locally separated, which is necessary since the restriction is separated.

Locally separatedness is required and ECD says why: the factorization forces the restriction to be separated. The conclusion is local on both source and target; no global factorization is claimed.

The source locators are [ECD](#source-ecd) — Section 11, Lemma 11.31 with proof, p. 69.

*Needs:* [D5.1](#d5-1), [D5.3](#d5-3), [D3.5](#d3-5), [D3.6](#d3-6), [D3.8](#d3-8), [D4.5](#d4-5), [D5.8](#d5-8).

<a id="d5-8"></a>

### 5.8 Localization of a spatial diamond

For a spatial diamond Y and y∈|Y|, let Y_y be the inverse limit of all qc open subdiamonds U⊆Y containing y, along inclusions. It is spatial; |Y_y| is the generalization set of y with the induced topology, and its map to Y is a qc injection. Morphisms whose underlying image is contained in that generalization set factor uniquely through Y_y. This is a diamond localization, not a new definition of a local ring.

Spatial Y; y∈|Y|.

Construct the following interfaces and prove the stated properties:

- `Perf.Diamond.localization`: The inverse limit of qc open neighbourhoods of y.
- `Perf.Diamond.localization_toBase`: Canonical qc injection into Y.
- `Perf.Diamond.localization_space`: Underlying space is the generalizations of y.
- `Perf.Diamond.localization_lift`: Unique factorization for morphisms with image in that generalization set.

**Checks.**

- `localization_closed_point_chain`: In a valuation-field diamond with one closed point, localization at that closed point is the whole diamond.
- `localization_generic_point_chain`: Localization at a maximal generalization has only its generalizations, not all its specializations.
- `localization_open_compatibility`: Localizing an open neighbourhood U of y gives the same Y_y.

The source locators are [ECD](#source-ecd) — Proof of Lemma 11.31, p. 69; construction justified by Proposition 11.23.

*Needs:* [D5.3](#d5-3), [D5.1](#d5-1), [D3.7](#d3-7).

<a id="d5-9"></a>

### 5.9 Locally closed generalizing subdiamonds

For a locally spatial diamond Y and a locally closed subset D⊆|Y| stable under generalization, the sub-v-sheaf Y_D consists of maps T→Y whose underlying image is contained in D. It is a locally spatial diamond, its underlying space is D with the subspace topology, and it represents this factorization condition. Generalizing means closed under generalizations in |Y|, not under specializations.

Locally spatial Y; D locally closed and generalizing.

Construct the following interfaces and prove the stated properties:

- `Perf.Diamond.generalizingSubdiamond`: Maps whose images lie in D.
- `Perf.Diamond.generalizingSubdiamond_space`: Its underlying space is D with its induced topology.
- `Perf.Diamond.generalizingSubdiamond_lift`: A map factors uniquely precisely when its underlying image lies in D.

**Checks.**

- `generalizing_subdiamond_whole`: D=|Y| gives Y.
- `generalizing_subdiamond_open`: For open D it is the existing open subdiamond.
- `generalizing_subdiamond_empty`: D=∅ gives the empty diamond.
- `generalizing_subdiamond_direction`: In a nontrivial specialization chain, the singleton closed point is not generalizing and the theorem does not apply.

The source locators are [HK](#source-hk) — §2.1, the locally closed generalizing subdiamond construction and its proof, p. 14.

*Needs:* [D1.5](#d1-5), [D5.2](#d5-2), [D5.1](#d5-1), [D4.5](#d4-5).

<a id="d5-10"></a>

### 5.10 Profinite products and closed projection

For a profinite set P and a locally spatial diamond S, underline(P)×S is locally spatial and |underline(P)×S|≅P×|S|. The projection to S is qc, separated and universally closed; hence it sends closed subsets to closed subsets after any locally spatial base change. Compactness of P is essential for closedness of the projection.

P profinite; S locally spatial.

The source locators are [HK](#source-hk) — Proof of Proposition 9.3.4, printed p. 60.

*Needs:* [D5.3](#d5-3), [D4.6](#d4-6), [D3.8](#d3-8).

<a id="d5-11"></a>

### 5.11 A spatial v-sheaf with enough quasi-pro-etale points is a spatial diamond

A spatial v-sheaf Y is a spatial diamond if some perfectoid X admits a quasi-pro-étale map f:X→Y that is surjective on underlying points. Sheaf surjectivity of f is not required. Equivalently, each y∈|Y| must occur in the image of a quasi-pro-étale map Spa(C,C⁺)→Y with C algebraically closed. This is a criterion expressed through the points of Y.

The map f is not assumed quasicompact, so Lemma 12.11 does not apply and f need not be a surjection of v-sheaves. The proof needs the analogues for spatial v-sheaves of the finite étale permanence and the limit theorem, which is why those are stated separately.

The source locators are [ECD](#source-ecd) — Section 12, Theorem 12.18 and Remark 12.19 with proof, p. 75; [ECD](#source-ecd) — Section 12, Proposition 12.20 and Lemma 12.21, pp. 75-76.

*Needs:* [D5.1](#d5-1), [D5.4](#d5-4), [D5.2](#d5-2), [D5.3](#d5-3), [D4.3](#d4-3), [D4.7](#d4-7), [D3.10](#d3-10), [D0.23](#d0-23).

*Relative representability and Hausdorff reduction.*

<a id="d5-12"></a>

### 5.12 Maps representable in diamonds and in (locally) spatial diamonds

A map f : Y' → Y of v-stacks is representable in diamonds if for every diamond X with a map X → Y the fibre product Y' x_Y X is a diamond; it is representable in (locally) spatial diamonds if for every (locally) spatial diamond X over Y the fibre product is a (locally) spatial diamond. For a map of diamonds that is representable in (locally) spatial diamonds one says simply that it is a (locally) spatial map. A map is representable in spatial diamonds exactly when it is representable in locally spatial diamonds and qcqs. All these notions are examples of 0-truncated maps.

The pro-étale locality and the v-locality conditions in the two descent statements are different: for representability in diamonds a surjection of pro-étale stacks suffices, while for representability in locally spatial diamonds one needs quasiseparatedness of f as well. These are the notions in which the six-operations formalism is indexed, so their exact form matters.

For a surjection of pro-étale stacks on the target, representability in diamonds descends; representability in locally spatial diamonds also descends when f is qs. For a surjection of v-stacks, the locally spatial descent assertion assumes f is already representable in diamonds and is qs. Include ECD Lemma 13.5: a qs small v-sheaf over an underlined profinite S is locally spatial if its fibres are locally spatial and it has a surjective qcqs map from a locally spatial diamond. A separated map is quasi-pro-étale exactly when it is representable in locally spatial diamonds and its fibres at Spa(C,O_C), for algebraically closed C, are pro-étale.

Construct the following interfaces and prove the stated properties:

- `Perf.Stack.RepresentableInDiamonds`: The predicate that all fibre products over diamonds are diamonds.
- `Perf.Stack.RepresentableInLocallySpatialDiamonds`: The corresponding predicate for locally spatial diamonds.
- `Perf.Stack.RepresentableInSpatialDiamonds`: The corresponding predicate for spatial diamonds.
- `Perf.Stack.representableInSpatial_iff`: Representability in spatial diamonds is representability in locally spatial diamonds together with qcqs.
- `Perf.Stack.representable_pullback`: The three classes are stable under base change.
- `Perf.Stack.representable_of_pullback`: The three descent statements, with their different surjectivity and quasiseparatedness hypotheses.
- `Perf.Stack.isQuasiProEtale_iff_fibres`: A separated map is quasi-pro-étale exactly when it is representable in locally spatial diamonds with pro-étale geometric fibres.
- `Perf.Stack.representable_isZeroTruncated`: All three classes consist of 0-truncated maps.

**Checks.**

- `diamond_base`: For Y a diamond, f is representable in diamonds exactly when Y' is a diamond (the degenerate case).
- `quasi_pro_etale`: A quasi-pro-étale map of locally spatial diamonds is representable in locally spatial diamonds.
- `not_representable_in_perfectoid_spaces`: A morphism of diamonds need not be representable in perfectoid spaces; the definition must not impose that (the required non-example).
- `classifying_stack`: The map from a geometric point to the classifying stack of a locally profinite group is representable in locally spatial diamonds and quasi-pro-étale.

The source locators are [ECD](#source-ecd) — Section 13, Definition 13.1, Definition 13.3 and Proposition 13.4, pp. 76-77; [ECD](#source-ecd) — Section 13, Proposition 13.6 with proof, pp. 78-79.

*Needs:* [D5.1](#d5-1), [D5.5](#d5-5), [D4.3](#d4-3), [D4.7](#d4-7), [D3.6](#d3-6), [D5.6](#d5-6), [D3.8](#d3-8).

<a id="d5-13"></a>

### 5.13 The Berkovich spectrum of a complete Tate ring and the maximal Hausdorff quotient of Spa

Let R be a complete Tate ring and ϖ a topologically nilpotent unit of R. The Berkovich spectrum M(R) is the set of continuous nonarchimedean multiplicative seminorms |·| : R → ℝ≥0 with |ϖ| = 1/2, with the topology of pointwise convergence. It is compact Hausdorff. For a second topologically nilpotent unit ϖ′, raising each seminorm to the exponent that renormalizes |ϖ′| to 1/2 is a homeomorphism between the two spectra, so M(R) is canonically independent of ϖ. For an open integrally closed subring R⁺ contained in the power-bounded elements R° (so (R,R⁺) is a Huber pair), every point of Spa(R,R⁺) has a unique rank-one generalization; sending a point to the seminorm given by that generalization is a continuous surjection Spa(R,R⁺) → M(R), which is a quotient map and identifies M(R) with the maximal Hausdorff quotient of Spa(R,R⁺): every continuous map from Spa(R,R⁺) to a Hausdorff space factors uniquely through it. Sending a seminorm to the corresponding rank-one point is a section of sets, not asserted to be continuous.

R complete Tate; ϖ a topologically nilpotent unit; R⁺ open, integrally closed and contained in R°. Boundedness of a multiplicative seminorm with respect to a ring of definition is equivalent to continuity, which is the condition used in the definition. ECD states the result for affinoid perfectoid spaces; its argument uses only that R is complete Tate, and the general form is what D5.14 extends to small v-sheaves.

Continuity and the normalization bound a seminorm by 1 on a ring of definition, so M(R) is a closed subspace of a product of compact intervals, and compactness is Tychonoff; Hausdorffness is separation by evaluation at elements of R. For a fixed ring of definition R₀ with ϖ-adic topology, prove that continuity, multiplicativity and |ϖ|=1/2 force |a|≤1 for a∈R₀ (use powers of a), and that the normalized seminorm conditions define a closed subset of the resulting product. This specializes the bounded Banach-ring spectrum construction of KL15 §2.3. The map from Spa(R,R⁺) is continuous because the value of |f| at the rank-one generalization of x is determined by the rational subsets containing x, and it is a quotient map by the compact Hausdorff criterion of D0.7.

Construct the following interfaces and prove the stated properties:

- `BerkovichSpectrum`: The set of continuous nonarchimedean multiplicative seminorms on R normalized by |ϖ| = 1/2, with the topology of pointwise convergence.
- `BerkovichSpectrum.compactSpace_t2Space`: For a complete Tate ring, M(R) is compact Hausdorff.
- `BerkovichSpectrum.fieldPoint`: For a complete nontrivially valued nonarchimedean field, construct its normalized point; `fieldPoint_apply` gives the logarithmic rescaling formula in the field Check.
- `BerkovichSpectrum.changeNormalization`: The canonical homeomorphism between the spectra normalized at two topologically nilpotent units.
- `BerkovichSpectrum.ofSpa`: The continuous surjection Spa(R,R⁺) → M(R) sending a point to its rank-one generalization.
- `BerkovichSpectrum.isQuotientMap_ofSpa`: That surjection is a quotient map.
- `BerkovichSpectrum.universal`: Every continuous map from Spa(R,R⁺) to a Hausdorff space factors uniquely through M(R).
- `BerkovichSpectrum.section`: The set-theoretic section of `ofSpa` selecting the rank-one point of a seminorm.

**Checks.**

- `field`: For a complete nontrivially valued nonarchimedean field K and 0<‖ϖ‖<1, M(K) is a single point. Its value at x is ‖x‖ raised to log(1/2)/log‖ϖ‖; log‖ϖ‖<0 makes the denominator nonzero.
- `gauss_point`: For the Tate algebra K⟨T⟩, the Gauss seminorm rescaled to send ϖ to 1/2 is a point of M(K⟨T⟩) and M(K⟨T⟩) has more than one point; a construction returning a point for every affinoid is wrong.
- `not_injective_on_spa`: A rank-two point of Spa(K⟨T⟩, O_K⟨T⟩) and its rank-one generalization have the same image in M(K⟨T⟩), so `ofSpa` is not injective; a construction that returns Spa itself, which is not Hausdorff, is wrong (a non-example).
- `normalization_square`: For ϖ′ = ϖ², the change-of-normalization map sends |·| to |·|^{1/2}.
- `unit_normalization_excluded`: Normalization at 1 would require both |1|=1 and |1|=1/2, so that spectrum is empty. Taking R⁺=K for a nontrivially valued field similarly violates the power-bounded-subring hypothesis and makes Spa(K,K) empty; it cannot map surjectively onto the one-point M(K).

The source locators are [ECD](#source-ecd) — Section 13, Definition 13.7, Remark 13.8 and Proposition 13.9 with proof, p. 79; [KL15](#source-kl15) — §2.3, Definition 2.3.2 and Remark 2.3.3, p. 34 (bounded spectrum and completion).

*Needs:* `mathlib:MulRingSeminorm`, `mathlib:IsTopologicallyNilpotent`, `mathlib:IsAdic`, [D0.7](#d0-7), `tauceti:TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`.

<a id="d5-14"></a>

### 5.14 The Berkovich space and the maximal Hausdorff quotient of a small v-sheaf

Take the Berkovich spectrum M(R) of a complete Tate ring, with its normalization |ϖ|=1/2 and its change-of-normalization homeomorphisms, and the maximal Hausdorff quotient Spa(R,R⁺)→M(R) from D5.13. Extend this affinoid-perfectoid functor to small v-sheaves by left Kan extension through perfectoid atlases: B(Y)=colim_{X→Y} M(O(X)) over affinoid perfectoid X. It preserves colimits and has |Y|→B(Y). For qcqs v-sheaves this is the maximal Hausdorff quotient and B(Y) is compact Hausdorff. The section selecting maximal generalizations is set-theoretic and need not be continuous. This target proves ECD 13.10–13.11; the seminorm spectrum and the affinoid maximal-Hausdorff theorem are D5.13.

|X|_B is canonically independent of the choice of varpi. The map |Y|_B → |Y| is a section of sets, not a continuous map; this is stated explicitly by ECD and must not be strengthened.

Apply left Kan extension along affinoid perfectoid atlases to the spectrum of D5.13, prove that the extension preserves colimits, and identify the maximal Hausdorff quotient for qcqs v-sheaves by writing such a v-sheaf as a quotient of spatial diamonds and using the closed-relation quotient criterion of D0.16. Both atlas and relation yield compact Hausdorff Berkovich spaces; the compact image of the relation in the product is closed, which makes the quotient Hausdorff. Compactness of the atlas alone would not suffice.

Construct the following interfaces and prove the stated properties:

- `Perf.berkovich`: The functor Y mapsto |Y|_B from small v-sheaves to topological spaces.
- `Perf.berkovich_affinoid`: For a complete perfectoid Tate pair (R,R⁺), B(Spd(R,R⁺)) is the spectrum M(R) of D5.13.
- `Perf.berkovich_indep_varpi`: The extension uses the normalization-independent spectrum of D5.13, hence does not depend on a chosen pseudouniformizer.
- `Perf.berkovich_compactHausdorff`: For Y qcqs, |Y|_B is compact Hausdorff.
- `Perf.berkovich_isQuotientMap`: |Y| → |Y|_B is a continuous quotient map.
- `Perf.berkovich_section`: The set-theoretic section |Y|_B → |Y| satisfies q∘s=id; it need not be continuous (it is continuous in the profinite and single-point cases).
- `Perf.berkovich_universal`: Any continuous map from |Y| to a Hausdorff space factors uniquely through |Y|_B.
- `Perf.berkovich_preservesColimits`: The functor preserves colimits, which is how it is extended from affinoids.

**Checks.**

- `point`: For X = Spa(C, C^+), |X|_B is a point (the degenerate case).
- `disc`: For an affinoid perfectoid disc with ring R, B(X)=M(R) as in D5.13; no identification with the spectrum of the ordinary rigid disc is asserted.
- `section_not_continuous`: The maximal-generalization section is a set section q∘s=id; continuity is not part of its specification.
- `compact_hausdorff_diamond`: For Y = T underline times Spa(K, O_K) with T compact Hausdorff, |Y|_B = T.
- `nonclosed_relation_excluded`: The quotient of the circle ℝ/ℤ by its dense subgroup ℚ/ℤ is not Hausdorff. It is excluded by the closed-relation step; a quotient construction using only compactness of the source would give the wrong result.

The source locators are [ECD](#source-ecd) — Section 13, Definition 13.7, Remark 13.8 and Proposition 13.9, p. 79; [ECD](#source-ecd) — Section 13, Proposition 13.10 and Proposition 13.11, pp. 79-80.

*Needs:* [D0.7](#d0-7), [D0.16](#d0-16), [D4.5](#d4-5), [D5.1](#d5-1), [D4.7](#d4-7), [D3.10](#d3-10), `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`, [D5.13](#d5-13).

<a id="d5-15"></a>

### 5.15 A quasicompact separated diamond maps representably to its maximal Hausdorff quotient, and the cohomology comparison

Let Y be a quasicompact separated diamond. Then the map Y → |Y|_B underline is representable in locally spatial diamonds; equivalently a general quasicompact separated diamond differs from a locally spatial one only through a map to a compact Hausdorff space. Moreover, for f : |Y| → |Y|_B the pullback f^* induces a fully faithful functor from D^+(|Y|_B, Z) to D^+(|Y|, Z), so that H^i(|Y|_B, F) is isomorphic to H^i(|Y|, f^* F) for every abelian sheaf F on |Y|_B. This cohomological assertion is proved with ordinary sheaf cohomology, not with the later diamond coefficient category.

Y quasicompact and separated. The second statement is ECD 13.13, which uses D0's ordinary sheaf foundations. Canonical compactifications are not assumed to remain spatial, which is why this nonspatial geometry is needed.

For geometric representability, prove the early extension from the rank-one locus into Spa(C,C⁺_min)/G, where C⁺_min is the integral closure of F_p + C⁰⁰. Existence needs a direct extension lemma; the separatedness criterion gives uniqueness only. For the cohomological assertion, establish ordinary proper-base-change and closed-neighbourhood continuity for arbitrary abelian sheaves and every degree on this valuative, possibly nonspatial source. Irreducible-fibre acyclicity and the coherent-topos limit theorem alone do not provide that comparison. These two inputs must be established before claiming the full reduction theorem.

**Missing inputs.** The extension contract is `Perf.minimalPlusExtension`: for C algebraically closed perfectoid of characteristic p, a profinite group G acting continuously on C, and the minimal open integrally closed subring C⁺_min containing F_p+C⁰⁰, restriction along Spa(R,R°)→Spa(R,R⁺), for a characteristic-p totally disconnected perfectoid affinoid (R,R⁺), must induce a bijection of maps into Spa(C,C⁺_min)/G. The stalk contract is `Perf.berkovich_stalkComparison`: for the stated Y, b∈B(Y), an abelian sheaf F on B(Y), and n≥0, identify (Rⁿf_*f^*F)_b with Hⁿ(f⁻¹(b), the constant sheaf F_b). Specify and prove the closed-neighbourhood continuity that constructs this identification. The irreducible-fibre theorem then gives F_b in degree zero and zero in positive degrees; it does not construct the identification.

**Checks.**

- `nonhausdorff_fibre`: A rank-two valuative component can have two comparable points over one Berkovich point. The comparison must cover this non-Hausdorff fibre; a theorem restricted to Hausdorff sources is insufficient.
- `closed_neighbourhoods_not_clopen`: The compact Hausdorff base [0,1] has no clopen neighbourhood basis at an interior point. Use interleaved open and closed neighbourhoods, rather than silently assuming a profinite base.

The source locators are [ECD](#source-ecd) — Section 13, Proposition 13.12 with proof, pp. 80-81; [ECD](#source-ecd) — Section 13, Proposition 13.13 with proof, p. 81.

*Needs:* [D5.14](#d5-14), [D5.12](#d5-12), [D5.5](#d5-5), [D5.4](#d5-4), [D3.10](#d3-10), [D3.8](#d3-8), [D0.19](#d0-19), [D0.4](#d0-4), [D0.20](#d0-20), [D5.8](#d5-8), `PerfectoidSpaces:P4/residue-field-point-injection`.

*Components of group quotients.*

<a id="d5-16"></a>

### 5.16 Components of restricted group quotients

Let a topological group G act continuously on X and give both orbit spaces their quotient topologies. If B=(ConnectedComponents X)/G is totally disconnected, then the canonical map B→ConnectedComponents(X/G) is a bijection of sets. A sufficient condition is that G-invariant clopens of X separate distinct G-orbits of components. In particular, for spectral X and profinite G with continuous action, B is profinite and the formula holds. For a locally spatial diamond torsor F→Y under G(Q_p) or Γ_K and connected base Y, the desired conclusion is transitivity on π₀(F); this requires verifying the separation hypothesis or an independent geometric transitivity proof. The printed universal GLX 3.2 is false; the period-torsor application still needs the separation or transitivity input just stated.

Continuous action; the component-orbit space B is totally disconnected, or its stated sufficient separation hypothesis. Compact specialization: spectral X and profinite G.

Connected components map into connected components of the orbit space, giving the canonical map of sets. Total disconnectedness of the component-orbit space prevents distinct orbits from acquiring a new connected union. The profinite specialization uses invariant clopens and compactness. For the G(Q_p)-torsors in the cited period-space applications, prove orbit separation or geometric component transitivity separately; G(Q_p) need not be compact. A Galois group Γ_K is profinite, but the compact specialization also needs the torsor space to be spectral. Neither the group hypothesis nor connectedness of the quotient alone supplies that space hypothesis. The unrestricted component formula in GLX Lemma 3.2 is false.

**Checks.**

- `dense_orbits`: Translation by ℤ on ℤ_p has dense orbits. X is totally disconnected, so (π₀X)/ℤ has many elements, but X/ℤ has the indiscrete topology and one component. The unrestricted formula fails.
- `trivial_group`: For G={1}, the comparison is the identity on π₀X.
- `profinite_transitive_action`: For X=G profinite acting on itself by translation, both sides have one element.

**Missing input.** For each cited period torsor, supply invariant-clopen separation or a geometric proof of transitivity on components with the actual space and group hypotheses; connectedness of Y alone is insufficient.

The source locators are [GLX](#source-glx) — §3, Lemma 3.2, pp. 16–17 (component assertion requires the hypothesis stated above); Proposition 3.12, p. 24; §6, Proposition 6.6(2), p. 45, and Lemma 6.12, p. 50.

*Needs:* [D0.6](#d0-6), [D4.10](#d4-10).

### Examples

At a field the normalized spectrum is one point. Replacing ϖ by ϖ² changes each value by its square root, while normalization at 1 gives an empty spectrum. The closed-relation hypothesis is tested against the non-Hausdorff dense-orbit quotient of the circle.

### Dependencies

Layers 0–4; PerfectoidSpaces P2, P4 and P5. Its affinoid Berkovich spectrum is constructed here; no higher-tier spectrum supplier is assumed.

<a id="d6"></a>

## Layer 6: Analytic and integral diamondification

Marked untilts provide the mapping functors. Analytic rational gluing produces diamonds, whereas the broader integral pre-adic mapping functor produces v-sheaves and retains the special fibre. The final rigid comparison fixes a base field and assumes seminormality on the source.

*Marked untilts and analytic diamonds.*

<a id="d6-1"></a>

### 6.1 Spd Z_p and Spd(A, A^+) by marked untilts

Let Spd Z_p be the functor on Perf sending X to the set of isomorphism classes of pairs (X sharp, iota) where X sharp is a perfectoid space and iota is an identification of the tilt of X sharp with X. For a Tate Z_p-algebra A with an open integrally closed subring A^+ inside the power-bounded elements A°, let Spd(A, A^+) send X to the set of isomorphism classes of pairs consisting of such an (X sharp, iota) together with a continuous map of pairs (A, A^+) → (O(X sharp), O^+(X sharp)). Both are v-sheaves. Marked untilts have no automorphisms, which is what makes these functors and not stacks. A Tate pair must be distinguished from an arbitrary formal base such as (Z_p, Z_p), which is treated by D6/pre-adic-diamondification rather than the Tate-only construction.

Functoriality is not formal: for f : X' → X and an untilt X sharp of X, one defines (X')sharp using that perfectoid spaces over X sharp are equivalent to perfectoid spaces over its tilt, which is the slice equivalence of P2. Absence of automorphisms of the pair (X sharp, iota) follows from the same equivalence. The v-sheaf property of Spd(A, A^+) follows from that of Spd Z_p together with the v-sheaf property of O and O^+.

Construct the following interfaces and prove the stated properties:

- `Perf.SpdZp`: The functor on Perf of marked untilts.
- `Perf.SpdZp.isVSheaf`: Spd Z_p is a v-sheaf.
- `Perf.SpdZp.noAutomorphisms`: A marked untilt has no nontrivial automorphisms, so the functor is set-valued.
- `Perf.Spd`: Spd(A, A^+) for a Tate Z_p-pair, as marked untilts together with a continuous map of pairs.
- `Perf.Spd.isVSheaf`: Spd(A, A^+) is a v-sheaf.
- `Perf.Spd.functorial`: (A, A^+) mapsto Spd(A, A^+) is a contravariant functor on Tate Z_p-pairs.
- `Perf.Spd.ofPerfectoid`: For a perfectoid pair, Spd(A, A^+) is represented by Spa of the tilt.
- `Perf.Spd.rationalSubset`: For U a rational subset of Spa(A, A^+), Spd(O(U), O^+(U)) → Spd(A, A^+) is the open subfunctor attached to U.

**Checks.**

- `perfectoid_pair`: For (A, A^+) perfectoid, Spd(A, A^+) is Spa of the tilt (the degenerate case).
- `spd_qp`: Spd Q_p is a v-sheaf that is not representable by a perfectoid space, which is a distinction the construction must detect.
- `no_automorphisms`: The groupoid of marked untilts of a fixed X is discrete; a construction producing a nontrivial automorphism group is wrong.
- `formal_base_excluded`: (Z_p, Z_p) is not a Tate pair, so Spd(Z_p, Z_p) is not defined by this construction (a required non-example).

The source locators are [ECD](#source-ecd) — Section 15, Lemma 15.1 with proof, pp. 89-90; [ECD](#source-ecd) — Section 15, proof of Lemma 15.1, p. 89; [ECD](#source-ecd) — Section 15, Lemma 15.2 with proof, p. 90.

*Needs:* `mathlib:WittVector`, [D2.7](#d2-7), [D2.8](#d2-8), [D4.1](#d4-1), [D4.4](#d4-4), `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`, `PerfectoidSpaces:P1/untilts-classified-by-primitive-ideals`, `PerfectoidSpaces:P1/tilt-of-perfectoid-tate-ring`, `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`, `PerfectoidSpaces:P0/almost-modules-over-perfectoid-base`, `AdicEtaleGeometry:A4/perfectoid-cover-presentation`, `AdicEtaleGeometry:A4/finite-etale-effective-descent-along-tower`, `AdicEtaleGeometry:A1/etale-site-generalized`, `AdicEtaleGeometry:A1/finite-etale-site`, `AdicEtaleGeometry:A1/yoneda-adic-fibre-products`.

<a id="d6-2"></a>

### 6.2 Descent of marked untilts along a v-cover

Let X = Spa(R, R^+) be an affinoid perfectoid space of characteristic p, Y = Spa(S, S^+) → X a v-cover, and Y sharp = Spa(S sharp, S sharp+) an untilt of Y such that the two induced untilts of Z = Y x_X Y = Spa(T, T^+) agree. Then there is a unique untilt X sharp = Spa(R sharp, R sharp+) of X whose pullback to Y is Y sharp. Concretely R sharp = W(R^+)/xi with varpi sharp inverted, for a primitive element xi of W(R^+), and R sharp+ is determined by R^+.

X affinoid perfectoid of characteristic p; the v-cover may be taken affinoid by the quasicompactness condition. After replacing ϖ by a sufficiently small p-power root, choose a primitive degree-one element ξ with ξ ≡ p modulo the Teichmüller element [ϖ]. Thus R♯=(W(R⁺)/(ξ))[[ϖ]⁻¹], where [ϖ] denotes its image in the quotient. The kernel classification is supplied by P1. The congruence is inside W(R⁺); it does not involve the nonintegral expression p·[ϖ]⁻¹.

Classify untilts by primitive degree-one Witt-vector elements, compare their generators on the two pullbacks to the Čech overlap, and descend the compatible primitive ideal. Reconstruct the untilt ring and its integral subring with the P1/P2 classification and D2 function descent, then prove uniqueness as a marked untilt.

**Checks.**

- `characteristic_p_untilt`: For the characteristic-p untilt itself, ξ=p and W(R⁺)/(p)=R⁺, so inverting [ϖ] recovers R. This tests the primitive-element convention and distinguishes the quotient from inverting p, which would annihilate this untilt.

The source locators are [ECD](#source-ecd) — Section 15, proof of Lemma 15.1, pp. 89-90; [ECD](#source-ecd) — Section 15, proof of Lemma 15.1, p. 90.

*Needs:* `mathlib:WittVector`, [D2.7](#d2-7), [D2.8](#d2-8), `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`, `PerfectoidSpaces:P1/untilts-classified-by-primitive-ideals`, `PerfectoidSpaces:P0/almost-modules-over-perfectoid-base`, `AdicEtaleGeometry:A4/perfectoid-cover-presentation`, `AdicEtaleGeometry:A4/finite-etale-effective-descent-along-tower`, `AdicEtaleGeometry:A1/etale-site-generalized`, `AdicEtaleGeometry:A1/finite-etale-site`, `AdicEtaleGeometry:A1/yoneda-adic-fibre-products`.

<a id="d6-3"></a>

### 6.3 Spd(A, A^+) is a spatial diamond with |Spd(A, A^+)| = |Spa(A, A^+)|

Let A be a Tate Z_p-algebra with an open integrally closed subring A^+ inside the power-bounded elements A°. Choose a cofiltered inverse system of finite groups G_i with surjective transition maps and a compatible filtered direct system of finite étale G_i-torsors A → A_i such that A_infinity has no nonsplit finite étale covers, with A_i^+ the integral closure of A^+ and A_infinity^+ the closure of the colimit inside the uniform completion. Then Spd(A_i, A_i^+) → Spd(A, A^+) is a G_i-torsor of v-sheaves, Spd of the completion of A_infinity is the inverse limit and is a G underline-torsor over Spd(A, A^+) for G the limit of the G_i, and it is an affinoid perfectoid space. Hence Spd(A, A^+) is a spatial diamond with |Spd(A, A^+)| = |Spa(A, A^+)|.

The existence of the tower with perfectoid completion is ECD Lemma 15.3 and is supplied by AdicEtaleGeometry:A4, which supplies this tower construction. The G_i-torsor statement uses the finite étale descent theorem for Tate rings, ECD Theorem 6.1.

Use A4 for the torsor tower and its perfectoid completion. Prove the finite-group and profinite-group torsor identifications with the D3 descent theorem and the D6 untilt functors. The completed perfectoid atlas then gives the diamond presentation; compare its topological quotient with Spa(A,A⁺) and use D5 to establish spatiality.

The source locators are [ECD](#source-ecd) — Section 15, Lemma 15.3 with proof, p. 90; [ECD](#source-ecd) — Section 15, Proposition 15.4 with proof, pp. 90-91.

*Needs:* `mathlib:ProfiniteGrp`, [D6.1](#d6-1), [D5.4](#d5-4), [D3.10](#d3-10), [D5.3](#d5-3), [D5.1](#d5-1), [D4.5](#d4-5), `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`, `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `AdicEtaleGeometry:A4/perfectoid-cover-presentation`, `AdicEtaleGeometry:A4/finite-etale-effective-descent-along-tower`, `AdicEtaleGeometry:A1/etale-site-generalized`, `AdicEtaleGeometry:A1/finite-etale-site`, `AdicEtaleGeometry:A1/yoneda-adic-fibre-products`.

<a id="d6-4"></a>

### 6.4 Gluing Spd along rational subsets and the diamond of an analytic adic space

If U is a rational open subset of Spa(A, A^+) then Spd(O(U), O^+(U)) → Spd(A, A^+) is the open subfunctor corresponding to U under the identification of the underlying spaces. Consequently the functor (A, A^+) mapsto Spd(A, A^+) glues: for Y an analytic adic space over Z_p the diamond associated with Y is the v-sheaf Y diamond sending X in Perf to the set of isomorphism classes of triples ((X sharp, iota), f : X sharp → Y) where X sharp is a perfectoid space with an identification iota of its tilt with X. The construction is functorial in Y, compatible with restriction to open subspaces, with the relevant fibre products, and with the tilt on perfectoid spaces.

Y is required to be an analytic adic space over Z_p; the construction works in the generality of adic spaces as defined with a structure presheaf that need not be a sheaf, provided the space is analytic. The gluing step is the identification of Spd of a rational localization with an open subfunctor, which rests on the identification of underlying spaces.

Construct the following interfaces and prove the stated properties:

- `Adic.diamond`: The v-sheaf Y diamond attached to an analytic adic space Y over Z_p.
- `Adic.diamond_affinoid`: For Y = Spa(A, A^+) affinoid, Y diamond is Spd(A, A^+).
- `Adic.diamond_openImmersion`: An open immersion of analytic adic spaces induces an open immersion of diamonds, and rational subsets give the corresponding open subfunctors.
- `Adic.diamond_functorial`: Y mapsto Y diamond is a functor from analytic adic spaces over Z_p to locally spatial diamonds.
- `Adic.diamond_perfectoid`: For Y perfectoid, Y diamond is the tilt of Y; the construction extends the tilting equivalence.
- `Adic.diamond_fibreProduct`: The construction is compatible with the fibre products of analytic adic spaces over Z_p that exist.
- `Adic.diamond_space`: |Y diamond| = |Y| as topological spaces.
- `Adic.diamond_isLocallySpatial`: Y diamond is a locally spatial diamond.

**Checks.**

- `spd_qp`: Spd Q_p is the diamond of Spa(Q_p, Z_p).
- `rigid_disc`: The diamond of the rigid analytic closed unit disc over Q_p is a locally spatial diamond with the same underlying space.
- `perfectoid_disc`: For the perfectoid closed unit disc the construction returns its tilt (the degenerate case).
- `finite_etale_cover_and_rational_open`: A finite étale cover and a rational open of an affinoid go to a finite étale map and an open immersion of diamonds; a construction that does not is wrong.

The source locators are [ECD](#source-ecd) — Section 15, discussion before Definition 15.5, p. 91; [ECD](#source-ecd) — Section 15, Definition 15.5, p. 91.

*Needs:* [D6.3](#d6-3), [D6.1](#d6-1), [D4.5](#d4-5), [D3.8](#d3-8), [D5.1](#d5-1), `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`, `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`, `AdicEtaleGeometry:A4/perfectoid-cover-presentation`, `AdicEtaleGeometry:A4/finite-etale-effective-descent-along-tower`, `AdicEtaleGeometry:A1/etale-site-generalized`, `AdicEtaleGeometry:A1/finite-etale-site`, `AdicEtaleGeometry:A1/yoneda-adic-fibre-products`.

<a id="d6-5"></a>

### 6.5 The diamond of an analytic adic space is locally spatial and its etale and finite etale sites agree

Let Y be an analytic adic space over Z_p. Then Y diamond is a locally spatial diamond with |Y diamond| = |Y|. Moreover there are equivalences of sites between the étale site of Y diamond and the étale site of Y, and between their finite étale sites. Prove full faithfulness and essential surjectivity on the étale categories separately. This is an equivalence of étale categories on the already constructed diamond; it is not full faithfulness of the diamond functor on all analytic adic spaces, and it is not the later derived left-completion comparison.

Y analytic adic over Z_p. The statement about sites is about the categories of étale objects, not about the functor Y mapsto Y diamond being fully faithful.

The source locators are [ECD](#source-ecd) — Section 15, Lemma 15.6 with proof, p. 91; [ECD](#source-ecd) — Section 1, Theorem 1.5, p. 4.

*Needs:* [D6.4](#d6-4), [D6.3](#d6-3), [D5.7](#d5-7), [D5.3](#d5-3), [D3.10](#d3-10), [D4.5](#d4-5), `PerfectoidSpaces:P3/etale-site-tilting-and-etale-almost-acyclicity`, `AdicEtaleGeometry:A4/perfectoid-cover-presentation`, `AdicEtaleGeometry:A4/finite-etale-effective-descent-along-tower`, `AdicEtaleGeometry:A1/etale-site-generalized`, `AdicEtaleGeometry:A1/finite-etale-site`, `AdicEtaleGeometry:A1/yoneda-adic-fibre-products`.

*Integral pre-adic v-sheaves.*

<a id="d6-6"></a>

### 6.6 Pre-adic diamondification

Fix a prime p. For any pre-adic space X over Spa(ℤ_p,ℤ_p), define X^diamond on characteristic-p perfectoid S by isomorphism classes of marked untilts (S^sharp,ι:(S^sharp)^flat≅S) over ℤ_p together with a morphism S^sharp→X. Morphisms pull back marked untilts. It is a v-sheaf; X need not be analytic or Tate and X^diamond need not be a diamond. For every complete Huber pair (A,A⁺) over ℤ_p this gives Spd(A,A⁺); on formal schemes use their associated pre-adic space with its full integral locus, not only the analytic generic fibre.

Pre-adic spaces over Spa(ℤ_p,ℤ_p), including nonanalytic loci; marked untilts from P1/P2; pair morphisms preserve A⁺ and are continuous.

The R2 pre-adic interface must include complete nonnoetherian integral pairs such as (O_C,O_C), gluing, and maps from perfectoid untilts. Apply v-descent of marked untilts and the mapping functor. Compare with analytic diamondification on the analytic locus. Products and finite symmetric-group quotients use D4.

Construct the following interfaces and prove the stated properties:

- `PreAdic.diamond`: Isomorphism classes of marked untilts with a map to X.
- `PreAdic.Spd`: The v-sheaf for an arbitrary complete Huber pair over ℤ_p.
- `PreAdic.diamond_map`: A pre-adic morphism induces a v-sheaf morphism, respecting identities and composition.
- `PreAdic.diamond_isVSheaf`: The mapping presheaf satisfies v-descent.
- `PreAdic.diamond_analytic`: On analytic X it equals the existing analytic diamondification.
- `PreAdic.diamond_formal`: For Spf A, the integral v-sheaf is Spd(A,A); its analytic generic-fibre locus agrees with analytic diamondification.

**Checks.**

- `integral_spd_oe`: For a finite extension E/ℚ_p, Spd O_E is Spd(O_E,O_E), retaining the special-fibre locus.
- `integral_spd_oc`: For a complete algebraically closed extension C/ℚ_p, Spd O_C is Spd(O_C,O_C), not Spd(C,O_C).
- `integral_pair_variants`: Spd(R,R) and Spd(R⁺,R⁺) use the two different complete integral rings and their own continuous maps; neither is silently replaced by Spd(R[1/ϖ],R⁺).
- `integral_formal_affine`: The integral v-sheaf of Spf A is Spd(A,A).
- `integral_symmetric_power`: Products (Spd O_E)^d exist as small v-sheaves and their Σ_d quotient uses D4’s small quotient construction.

The source locators are [Berkeley](#source-berkeley) — Lecture 18, §18.1, Lemma 18.1.1, p. 161 (PDF p. 171).

*Needs:* [D6.2](#d6-2), [D2.7](#d2-7), `PerfectoidSpaces:P1/marked-untilt`, `PerfectoidSpaces:P2/tilting-slice-equivalence`, `AdicSpacesPartII:F0/formal-spectrum`, `AdicSpacesPartII:R2`, `mathlib:CategoryTheory.Functor.IsFibered`.

<a id="d6-7"></a>

### 6.7 Integral Galois quotient

Let K be a complete nonarchimedean field in which p is topologically nilpotent, C a completed algebraic closure and G_K=Gal(K^sep/K). Then Spd O_C→Spd O_K is a proper v-cover and (Spd O_C)/underline(G_K)≅Spd O_K. This is a sheaf quotient, not a G_K-torsor assertion on the integral special fibre.

Complete nonarchimedean K with topologically nilpotent p; C completed algebraic closure; profinite G_K.

The Galois quotient is a quotient in small v-sheaves. Establish the proper v-cover and effective quotient through the integral mapping functor. The special-fibre action has stabilizers, so the analytic Galois torsor statement cannot be extended unchanged to the integral locus.

The source locators are [Berkeley](#source-berkeley) — Lecture 18, §18.1, Lemma 18.1.2 and proof, pp. 161–162 (PDF pp. 171–172).

*Needs:* [D6.6](#d6-6), [D4.10](#d4-10), [D5.10](#d5-10).

<a id="d6-8"></a>

### 6.8 Topology of pre-adic diamondification

For a pre-adic space X over Spa ℤ_p, the point map |X^diamond|→|X| is a continuous surjection. If X is analytic it is a homeomorphism. For general nonanalytic X it need not be a homeomorphism: Berkeley Example 18.2.1 gives extra opens detected by topological nilpotence on the diamondification.

Pre-adic X over Spa ℤ_p.

The source locators are [Berkeley](#source-berkeley) — Lecture 18, §18.2, Example 18.2.1 and Proposition 18.2.2, p. 162 (PDF p. 172).

*Needs:* [D6.6](#d6-6), [D4.8](#d4-8), [D6.4](#d6-4).

*Seminormal rigid full faithfulness.*

<a id="d6-9"></a>

### 6.9 Seminormal rigid full faithfulness

Fix a complete nonarchimedean field K over ℚ_p. If X is a seminormal rigid K-variety and Y any rigid K-variety, then Hom_K(X,Y)→Hom_{Spd K}(X^diamond,Y^diamond) is bijective. Diamondification factors through seminormalization, so its restriction to seminormal rigid K-varieties is fully faithful. All maps are over the fixed base Spd K. No full faithfulness on all analytic adic spaces is asserted.

Rigid varieties over a fixed K/ℚ_p; seminormal source X.

Import rigid seminormalization and the equality O_X ≅ ν_*Ô_X for a seminormal source from R0, including perfectoid seminormality and affinoid recovery. Recover morphisms locally from completed structural functions, compare plus rings, and glue. Keep both Hom sets over the fixed K/Spd K base. The geometric result factors through seminormalization.

The source locators are [Berkeley](#source-berkeley) — Lecture 10, §10.2, Proposition 10.2.3 and proof, p. 78 (PDF p. 88); [KL16](#source-kl16) — Theorem 8.2.3, printed p. 162 and proof p. 163; [HK](#source-hk) — §2.2, rigid-analytic diamond conventions and seminormal full faithfulness, p. 15.

*Needs:* [D6.4](#d6-4), [D6.5](#d6-5), [D2.9](#d2-9), `AdicSpacesPartII:R0`.
### Examples

A perfectoid pair diamondifies to its tilt. Spd(ℤₚ,ℤₚ) retains the integral locus and uses the pre-adic construction, whereas the Tate construction requires a topologically nilpotent unit. Full faithfulness uses a seminormal rigid source over the specified ground field.

### Dependencies

Layers 0–5; PerfectoidSpaces P0–P2 and P5; AdicEtaleGeometry A1 and A4; AdicSpacesPartII R0 and R2 for seminormal rigid and integral pre-adic carriers.

## Downstream consumers

DiamondEtaleCohomology and DiamondSixOperations use the spatial, representability and site interfaces. FarguesFontaineDiamonds, RelativeFarguesFontaine and PerfectoidShimuraVarieties use analytic diamondification and marked untilts. EnhancedDerivedSheaves consumes the ordinary coherent-topos foundations, and AdicCoefficientsAndComparisons consumes integral pre-adic diamondification. These consumers build their own coefficient and period-space geometry from the results specified here.

## References

Page numbers are those of the linked manuscripts, rather than a different journal layout. For SGA 4, use the transcription page numbers with the PDF positions stated beside them; its original marginal pagination is a separate numbering. Stacks Project references use stable tags and lemma numbers instead of pages.

<a id="source-ecd"></a>

- **ECD**: Peter Scholze, [Etale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4). arXiv:1709.07343v4, manuscript dated 15 April 2026; printed pp. 1–168.
<a id="source-berkeley"></a>

- **Berkeley**: Peter Scholze and Jared Weinstein, [Berkeley lectures on p-adic geometry](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf). author manuscript dated 27 March 2020; printed lecture pagination.
<a id="source-arc"></a>

- **Arc**: Bhargav Bhatt and Akhil Mathew, [The arc-topology](https://arxiv.org/pdf/1807.04725v4). arXiv:1807.04725v4.
<a id="source-kl15"></a>

- **KL15**: Kiran Kedlaya and Ruochuan Liu, [Relative p-adic Hodge theory: foundations](https://arxiv.org/pdf/1301.0792). arXiv:1301.0792, author version of Astérisque 371 (2015).
<a id="source-kl16"></a>

- **KL16**: Kiran Kedlaya and Ruochuan Liu, [Relative p-adic Hodge theory II: imperfect period rings](https://arxiv.org/pdf/1602.06899). arXiv:1602.06899, author manuscript.
<a id="source-heuer"></a>

- **Heuer**: Ben Heuer, [A p-adic Simpson correspondence for smooth proper rigid varieties](https://arxiv.org/pdf/2307.01303v3). arXiv:2307.01303v3; used for the site conventions and attribution of the vector-bundle comparison.
<a id="source-hk"></a>

- **HK**: Sean Howe and Christian Klevdal, [Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem](https://arxiv.org/pdf/2308.11064v2). arXiv:2308.11064v2.
<a id="source-glx"></a>

- **GLX**: Ian Gleason, Dong Gyu Lim and Yujie Xu, [The connected components of affine Deligne–Lusztig varieties](https://arxiv.org/pdf/2208.07195v3). arXiv:2208.07195v3, 10 November 2025.
<a id="source-sch12"></a>

- **Sch12**: Peter Scholze, [Perfectoid spaces](https://arxiv.org/pdf/1111.4914). arXiv:1111.4914, author manuscript.
<a id="source-sga4vi"></a>

- **SGA 4 VI**: Alexander Grothendieck and Jean-Louis Verdier, [Théorie des topos et cohomologie étale des schémas, Tome 2, Exposé VI](https://pi.math.cornell.edu/~dkmiller/bin/sga4-2.pdf). freely hosted French transcription; Exposé VI numbering.
<a id="source-stacks-0apa"></a>

- **Stacks quotient spaces**: The Stacks Project Authors, [Stacks Project: quotient spaces](https://stacks.math.columbia.edu/tag/0APA). Stable section and tag numbering.
<a id="source-stacks-02uw"></a>

- **Stacks constant sheaves**: The Stacks Project Authors, [Stacks Project: cohomology of sheaves](https://stacks.math.columbia.edu/tag/02UW). Stable section and tag numbering.
<a id="source-stacks-stackification"></a>

- **Stacks stackification**: The Stacks Project Authors, [Stacks Project: stackification and quotient stacks](https://stacks.math.columbia.edu/tag/02ZM). Stable section and tag numbering.
<a id="source-bs15"></a>

- **BS15**: Bhargav Bhatt and Peter Scholze, [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf). author-hosted manuscript, with its own printed pagination.
<a id="source-stacks-leray"></a>

- **Stacks Leray**: The Stacks Project Authors, [Stacks Project: Leray spectral sequence](https://stacks.math.columbia.edu/tag/072X). Stable section and tag numbering.
