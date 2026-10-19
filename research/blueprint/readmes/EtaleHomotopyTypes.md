# Étale homotopy types and pro-spaces

This roadmap constructs the raw étale homotopy type as a pro-simplicial set, its relative mapping classes and its p-completed complex comparison. The main outputs are arithmetic orbit bijections, representability of maps into pro-classifying spaces, finite étale base change, and a Betti–étale comparison with explicit cohomological hypotheses. These feed anabelian reconstruction and the Galois action on symplectic K-theory.

The specification uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every target below is mathematical work to perform. The packet is a complete planning pass: all seven layers are planned, with seven explicit proof or integration leaves and fourteen supplier contracts. It does not assert mathematical closure or implementation.

## Conventions and interfaces

Fix universes for schemes, geometric points, simplicial sets and small cofiltered indexing categories. A geometric-point presentation is chosen small only with its change-of-presentation comparison. Rigid covers can have infinitely many pieces. Pointed pro-objects use compatible actual vertices; replacement by merely unrelated points at different levels is invalid.

| Object | Meaning | Comparison that must be proved |
| --- | --- | --- |
| `Pro(SSet)` | D0’s ordinary, size-controlled pro-category | Its ordinary Hom formula is a limit of filtered colimits. |
| Raw homotopy | Isaksen localization by homotopy pro-local systems | Distinct from the strict levelwise weak-equivalence model. |
| `π_n(X)` | Raw homotopy pro-group, pro-abelian for n≥2 | Not its inverse-limit group. |
| `Mat(X)` | Derived limit / ordinary homotopy limit | Its homotopy groups are the topological groups `π_n^top`. |
| Finite-étale `π₁` | IG.0’s profinite group from the geometric fiber functor | Identified with the completion of raw π₁, and with raw π₁ itself only in the stated profinite scope. |
| `Pro(Sp_p-fin)` | Homotopy-coherent pro-category of p-finite types | BHH’s model comparison is required; ordinary `Pro(Ho(SSet))` is insufficient. |
| Relative maps over B | Morphisms in `Ho(Pro(SSet))↓B`, or in `Ho(Pro(SSet)_*)↓(B,b)` | The slice of the homotopy category is not the homotopy category of a slice. |

Path transport is normalized so target loops act on π₁-homomorphisms by `φ ↦ αφα⁻¹`. Connected pro-spaces have a levelwise connected representative. Path-connectedness means connected materialization; the two predicates are related by EH.2 under profinite homotopy hypotheses.

The complex domain is quasi-projective schemes over C and their simplicial objects. Analytic complex points use the ordinary Euclidean topology. Discrete points of a simplicial scheme form a simplicial set with n-simplices X_n(C), not the constant set X_0(C). A specified grading is a decomposition by open-and-closed simplicial subschemes respected by every operator. It is input data, not an assumed functorial partition of arbitrary simplicial schemes.

## Existing owners and library boundary

| Input | Exact owner or contract |
| --- | --- |
| Ordinary Pro, reindexing, universe comparisons | `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`, extended by R1. |
| Ordinary simplicial homotopy, covering and unstable limit theory | Current `TauCetiRoadmap/AlgebraicTopology`, Stage 8 and the explicit Part II contract R2. Native Kan groups follow the direction of Mathlib PR 42435; this is not a baseline declaration. |
| Discrete BG/EG and ordinary covering coefficients | `StableHomotopyKTheory:H.1/classifying-space-of-group`, `classifying-space-of-group-is-KG1`, `translation-category-classifying-space`, `coverings-fundamental-group-local-coefficients`; R9 supplies the missing nerve fibration API. |
| Pro-p generation and structure | Existing `ProfiniteProPGroups` Layers 3–4 and current Tau Ceti generation/abelian pro-p declarations; R13–R14 request their homotopy-group adapters. |
| Profinite compactness | Current `TauCeti.Topology.Compactness.InverseSystem` already supplies the compact and finite compatible-family theorems; R5 imports them through `ProfiniteProPGroups` Layer 0. They postdate the pin. |
| Hypercovers and cohomological descent | `EnhancedDerivedSheaves:E2/hypercover` and `E2/bounded-below-hypercover-descent`; R12 supplies the distinct topological realization theorem. |
| Homotopy-coherent category infrastructure | `EnhancedDerivedSheaves:E0`, with Part II contract R4. |
| Étale site and cohomology | Native `Scheme.smallEtaleTopology`, native `CategoryTheory.Sheaf.H`, and `SchemeAndStackFoundations:SF.2/etale-cohomology-limits`. |
| Finite étale π₁ and arithmetic groups | `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group` and `IG.1/arithmetic-exact-sequence`, with R6–R7. |
| Finite-coefficient étale/analytic comparison | `InverseGaloisAndArithmeticFundamentalGroups:IG.3/finite-coefficient-comparison`. |
| Analytification and analytic sheaf/singular comparison | `ComplexComparisonPartII:C0/repair-analytification` and `C5/repair-sheaf-singular-comparison`; use one shared carrier, with G6/R10 identifying its integration. |
| Finite-coefficient K(pi,1) and scheme applications | NC.0’s key definition, `raw-homotopy-comparison`, `field`, `smooth-curve`, `products`, `elementary-fibration`, `artin-neighbourhood`; R11 preserves these owners. |

Current AlgebraicTopology and Completed/UniversalCovers were read in full, with their relevant suggested declarations. Current ProfiniteProPGroups Layers 0, 3 and 4 and Tau Ceti’s inverse-system, generation and abelian pro-p structure statements were also checked. Ordinary universal covers, group classification and existing compactness are inputs. No new target duplicates them. The open analytification integration is recorded as G6, not represented by another analytic-space definition.

The any-field smooth-curve statement of Schmidt–Stix Lemma 2.7(a) is broader than NC.0’s present characteristic-zero curve proof; R11 requests that extension in the same direction. Its product and elementary-fibration applications remain characteristic zero. The raw classifying morphism and elementary-fiber sequence are supplied here so NC.0 can use them. In particular EH.3 does not depend on NC.0’s application to prove the sequence that application needs.

The source’s geometric projection-family and strongly hyperbolic neighbourhood existence argument belongs with NC.0/NC.1’s scheme applications through R11. This roadmap takes an elementary fibration with its compactification as input; the fibration’s existence is a separate geometric theorem. A¹ localization belongs to `MotivicEtaleKTheory:M.5a`; the cited realization there must retain its completion/coefficient and characteristic hypotheses. No uncompleted arbitrary-characteristic A¹ equivalence is an endpoint of this roadmap. The A_g-specific Betti identification, Γ-space group completion and spectrum-level Galois action belong to `ArithmeticKTheoryPartIISymplecticGaloisAction`.

## Pinned declaration ledger

Each declaration below was read at the recorded pin. Current-library additions are listed as owner imports above, rather than inserted into this ledger.

| Declaration | Native module | What is reused |
| --- | --- | --- |
| `mathlib:SSet` | `Mathlib/AlgebraicTopology/SimplicialSet/Basic.lean` | Simplicial sets as presheaves on the simplex category; no pro-space homotopy theory. |
| `mathlib:SSet.KanComplex` | `Mathlib/AlgebraicTopology/SimplicialSet/KanComplex.lean` | The Kan fibrancy predicate, relative to the scoped Quillen morphism properties; not a completed model structure. |
| `mathlib:SSet.KanComplex.hornFilling` | `Mathlib/AlgebraicTopology/SimplicialSet/KanComplex.lean` | Extension over every horn for a Kan complex. |
| `mathlib:HomotopicalAlgebra.ModelCategory` | `Mathlib/AlgebraicTopology/ModelCategory/Basic.lean` | Abstract model-category axioms, including lifting and factorization classes; no instance for the pro-space models used here. |
| `mathlib:TopCat.toSSet` | `Mathlib/AlgebraicTopology/SingularSet.lean` | Native singular simplicial set, with the universe lift of the real standard simplex. |
| `mathlib:TopCat.toSSetObjEquiv` | `Mathlib/AlgebraicTopology/SingularSet.lean` | Singular n-simplices are equivalent to continuous maps from the real standard n-simplex. |
| `mathlib:sSetTopAdj` | `Mathlib/AlgebraicTopology/SingularSet.lean` | Geometric realization is left adjoint to the singular set functor. |
| `mathlib:TopCat.toSSetIsoConst` | `Mathlib/AlgebraicTopology/SingularSet.lean` | For a totally disconnected space the singular set is naturally isomorphic to the constant set. |
| `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology` | `Mathlib/AlgebraicGeometry/Sites/Etale.lean` | The small étale Grothendieck topology on the existing étale category. |
| `mathlib:CategoryTheory.Sheaf.H` | `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean` | Native abelian sheaf cohomology, with its sheafification and Ext hypotheses. |
| `mathlib:ContinuousMap.evalAlgHom` | `Mathlib/Topology/ContinuousMap/Algebra.lean` | Evaluation at a point as an algebra homomorphism; the topological semiring and algebra structures are parameters. |
| `mathlib:ContinuousMap.compRightAlgHom` | `Mathlib/Topology/ContinuousMap/Algebra.lean` | Precomposition by a continuous map as an algebra homomorphism on continuous functions. |
| `mathlib:CategoryTheory.Ind` | `Mathlib/CategoryTheory/Limits/Indization/Category.lean` | The existing Ind category, with its size and hom-universe choices. D0 supplies the ordinary dual Pro interface. |
| `mathlib:CategoryTheory.Functor.diag` | `Mathlib/CategoryTheory/Products/Basic.lean` | The native diagonal functor C→C×C, used by the light Betti diagonal specialization. |
| `mathlib:CategoryTheory.Functor.uncurry` | `Mathlib/CategoryTheory/Functor/Currying.lean` | Uncurries a bifunctor C→D→E to C×D→E; its object/map formulas identify diagonal singular simplices. |

## Layer overview

| Layer | Targets | Status |
| --- | --- | --- |
| EH.0 | Homotopy theory of pro-spaces (5 targets) | planned |
| EH.1 | Coverings and classifying pro-spaces (9 targets) | planned |
| EH.2 | Materialization and relative monodromy (10 targets) | planned |
| EH.3 | Rigid étale types and finite-cover comparison (8 targets) | planned |
| EH.4 | Arithmetic relative mapping classes (7 targets) | planned |
| EH.5 | Betti realization and analytic descent (3 targets) | planned |
| EH.6 | p-completion and Betti–étale comparison (9 targets) | planned |

Every target has an exact node identifier shared with the packet. The proof steps identify construction obligations; supplier contracts and G1–G7 are their explicit unresolved leaves. A definition or construction has its full usable API, at least three discriminating tests and its consumers. The Lean file states only what existing pinned carriers permit.

## EH.0. Homotopy theory of pro-spaces

Discharge G1 and supplier R1–R3 ordinary/pro foundations.

### Homotopy pro-local systems

**Target:** `EtaleHomotopyTypes:EH.0/pro-space-homotopy-data` (definition).

Specialize D0’s size-controlled Pro category to simplicial sets, with pointed objects represented by compatible actual vertices. A local system on X=(X_i) is a local system on one level, modulo pullback to a later level; its morphisms use the corresponding filtered colimit. The homotopy pro-local system Π_nX consists of the ordinary fundamental-groupoid homotopy local systems on the levels. For a pointed representative put π_n(X,x)=(π_n(X_i,x_i)); π_0 is pro-set-valued, π_1 pro-group-valued, and π_n is pro-abelian for n≥2. Connected means isomorphic to a levelwise connected diagram. This does not mean that its homotopy limit is path-connected.

**Hypotheses and conventions:** Small cofiltered presentations in fixed universes; ordinary simplicial homotopy supplied by AlgebraicTopology.

**Direct inputs:** `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`, `mathlib:CategoryTheory.Ind`, `mathlib:SSet`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Construction or proof.**

1. Use the imported Pro carrier and finite-diagram reindexing; retain the universe of the indexing category.
2. Pull local systems back along transition maps and pass to the filtered colimit category. Ordinary homotopy groups and their path transport come from AlgebraicTopology.
3. Define the homotopy pro-local systems with their transition morphisms, and compare evaluation at a compatible vertex with the levelwise π_n system.

**API.**

- `proPi_map` (functoriality): Pointed maps induce pro-homomorphisms, preserving identity and composition.
- `localSystem_pullback` (functoriality): Pullback is compatible with reindexing and composition, up to the specified natural isomorphisms.
- `proPi_evaluate` (compatibility): For connected pointed X, evaluation of Π_nX at its point is π_n(X,x).
- `constant_pi` (compatibility): For a constant pointed simplicial set, the pro-homotopy groups are the constant ordinary homotopy groups.

**Discriminating tests.**

- `constant_circle` (computation): For the constant singular circle, π_1 is constant Z and every π_n for n≥2 is zero.
- `two_components` (non-example): The constant two-point set has π_0 with two elements; a single basepoint cannot detect deletion of the other component.
- `sign_local_system` (non-example): On the constant circle, the integral sign local system has monodromy -1, unlike the constant integral system; both must occur in the local-system category.

**Consumers.** EH.0 Isaksen model and cohomological detection: States weak equivalence independently of global points. EH.3 étale type: Defines its raw pro-homotopy groups before any profinite completion.

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [I01] §§4–6, pp. 6–10; Corollary 7.5, pp. 12–13. The local-system formulation handles components and basepoint transport before reducing to the connected pointed case.

**Planet:** Homotopy pro-local systems.

### Isaksen homotopy model structure

**Target:** `EtaleHomotopyTypes:EH.0/isaksen-model` (construction).

On Pro(SSet), take weak equivalences to be maps inducing an isomorphism of π_0 and of every homotopy pro-local system Π_nX→f*Π_nY, n≥1. Cofibrations are essentially levelwise monomorphisms, and fibrations have the right lifting property against trivial cofibrations. These classes form Isaksen’s simplicial model structure and induce its pointed model and homotopy categories. Every object is cofibrant. Its strict predecessor instead inverts essentially levelwise ordinary weak equivalences. Factorizations here are not asserted functorial.

**Hypotheses and conventions:** Small cofiltered presentations in fixed universes; ordinary simplicial homotopy supplied by AlgebraicTopology.

**Direct inputs:** `EtaleHomotopyTypes:EH.0/pro-space-homotopy-data`, `mathlib:HomotopicalAlgebra.ModelCategory`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `DiamondsAndVStacks:D0`.

**Construction or proof.**

1. Import the proper simplicial Kan–Quillen model from the existing topology owner, including the ordinary obstruction theory requested there.
2. Use cofinite reindexing and finite predecessor matching objects. The increasing connectivity bound gives Isaksen’s strong fibrations (Definition 6.5).
3. Apply the two factorizations and lifting theorem, I01 Propositions 15.1, 15.2, 15.4; then the pushout-product argument of §16. Properness is isolated in the next target because its original proof needs the published correction.

**API.**

- `weakEquivalence_homotopyLocalSystems` (characterisation): Weak equivalence is equivalent to the stated π_0 and Π_n conditions.
- `all_cofibrant` (instance): Every pro-simplicial set, and every pointed one, is cofibrant.
- `strict_to_homotopy` (functoriality): Identity induces the localization functor from strict homotopy to Isaksen homotopy.
- `hom_fibrant_quotient` (characterisation): For fibrant Y, Hom in the homotopy category is strict maps X→Y modulo simplicial homotopy.

**Discriminating tests.**

- `constant_kan_equivalence` (compatibility): On constant pointed connected Kan complexes, weak equivalence is the ordinary π_n equivalence in every degree.
- `postnikov_tower` (non-example): For K=∏_{n≥1}K(Z,n), the map cK→(P_m K)_m is an Isaksen equivalence but not a strict equivalence: every finite truncation misses nonzero higher homotopy groups. This avoids relying on a finiteness claim about a particular sphere.
- `not_just_h1` (non-example): The map from the singular S² to a point is not an Isaksen equivalence even though it preserves π_0 and π_1.

**Consumers.** SS Appendix A: Supplies mapping classes, cylinders, coverings as fibrations and derived classifying maps. EH.6 completion: Separates raw homotopy localization from the p-local completion model.

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [I01] Definitions 6.1–6.3, Theorem 6.4, pp. 9–10; §§12–16, pp. 20–32. Supplies the homotopy-pro-group model, including the nonfunctorial factorization qualification.

**Planet:** Isaksen model structure.

### Properness and strong fibrations

**Target:** `EtaleHomotopyTypes:EH.0/properness` (theorem).

Isaksen’s model structure is left and right proper. A strong fibration is a fibration, and arbitrary fibrations are retracts of suitable strong-fibration presentations. Consequently pullback along a fibration preserves weak equivalences, also for maps over a fixed pro-space.

**Hypotheses and conventions:** Small cofiltered presentations in fixed universes; ordinary simplicial homotopy supplied by AlgebraicTopology.

**Direct inputs:** `EtaleHomotopyTypes:EH.0/isaksen-model`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Construction or proof.**

1. Left properness follows from cofibrancy of every object.
2. For right properness, reduce a fibration to a retract of a strong fibration and use the levelwise connectivity criterion. Read and incorporate the correction in Isaksen 2004 Remark 4.14 before claiming this reduction proved (G1).
3. Apply the right-proper pullback square; do not substitute the strict model’s weak equivalences.

**Check.** Test a pullback of a weak equivalence along a covering; no Kan assumption on its base is inserted.

**Source.** [I01] Definition 6.5, p. 10; Proposition 17.1, pp. 32–33. The source’s model-specific properness argument needs its subsequent correction; that proof leaf is G1. [SS] Appendix A opening and Lemma A.5, pp. 853–855. Uses properness for pullback in the homotopy-pro-group model.

### Connected pointed homotopy detection

**Target:** `EtaleHomotopyTypes:EH.0/connected-detection` (theorem).

For connected pointed pro-spaces, a pointed map is an Isaksen weak equivalence exactly when it induces an isomorphism of pro-groups π_n for every n≥1. A pointed morphism whose underlying morphism is an isomorphism in the unpointed homotopy category is an isomorphism in the pointed homotopy category.

**Hypotheses and conventions:** Small cofiltered presentations in fixed universes; ordinary simplicial homotopy supplied by AlgebraicTopology.

**Direct inputs:** `EtaleHomotopyTypes:EH.0/isaksen-model`.

**Construction or proof.**

1. Represent the map after cofinite reindexing; use path transport on connected levels to recover all stalks of Π_n from the selected one.
2. Apply the weak-equivalence criterion, and use the forgetful pointed model functor reflecting weak equivalences for the isomorphism assertion.

**Check.** A map of two-component objects preserving only the chosen component is outside this test.

**Source.** [I01] Corollary 7.5, pp. 12–13; pointed model-category consequence. Connectedness removes the need to test the other components through homotopy local systems.

### Local-coefficient detection

**Target:** `EtaleHomotopyTypes:EH.0/cohomological-detection` (theorem).

A map f:X→Y of pro-spaces is an Isaksen weak equivalence if and only if π_0(f) is a pro-set isomorphism, Π_1X→f*Π_1Y is an isomorphism of pro-local systems, and H^m(Y,L)→H^m(X,f*L) is an isomorphism for every m≥0 and every abelian local system L on Y. Here cohomology for a system represented on Y_i is the filtered colimit over later levels of ordinary cohomology with pulled-back coefficients; finite constant coefficients alone do not state this criterion.

**Hypotheses and conventions:** Small cofiltered presentations in fixed universes; ordinary simplicial homotopy supplied by AlgebraicTopology.

**Direct inputs:** `EtaleHomotopyTypes:EH.0/pro-space-homotopy-data`, `EtaleHomotopyTypes:EH.0/isaksen-model`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Construction or proof.**

1. A weak equivalence admits a level presentation with connectivity increasing arbitrarily far, so ordinary local-coefficient comparison gives every fixed cohomological degree in the filtered colimit.
2. Conversely replace by a cofibration and test maps into strongly fibrant objects. A finite Moore–Postnikov lifting tower has obstruction classes in local cohomology; kill each using the assumed isomorphisms.
3. Pass to the inverse limit of the matching fibrations and use the model’s fibrant retract theorem. The ordinary local-coefficient Whitehead and Moore–Postnikov inputs are explicitly requested from AlgebraicTopology, not asserted by its existing Kan predicate.

**Check.** Keep the integral sign system on S¹ in the test class; do not infer this theorem from a mod-p cohomology comparison.

**Source.** [I01] §18, Proposition 18.4, pp. 34–36. The obstruction-theoretic characterization quantifies over all local systems, together with π_0 and Π_1.

## EH.1. Coverings and classifying pro-spaces

Obtain the ordinary covering/first-Postnikov inputs R2 and discrete nerve API R9; carry corrected properness G1.

### Coverings of pro-spaces

**Target:** `EtaleHomotopyTypes:EH.1/pro-covering` (definition).

A simplicial covering p:E→X has the unique lifting property for every vertex inclusion Δ[0]→Δ[n], including every choice of vertex. A pro-covering is a pro-morphism isomorphic to a levelwise simplicial covering; connected Galois coverings have a levelwise presentation with E_i/Aut_Xi(E_i)≅X_i. Universal pointed coverings are formed from the levelwise universal simplicial coverings. The deck group is a pro-group, not an unqualified single discrete group.

**Hypotheses and conventions:** Pointed connected pro-spaces where specified; arbitrary pro-groups, without a hidden finite-index restriction.

**Direct inputs:** `EtaleHomotopyTypes:EH.0/pro-space-homotopy-data`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `StableHomotopyKTheory:H.1/coverings-fundamental-group-local-coefficients`.

**Construction or proof.**

1. Import ordinary simplicial covering theory, compared by realization with the already owned topological universal-cover API; this extension is requested from AlgebraicTopology.
2. Use D0 reindexing to make a finite covering diagram levelwise. Define the pro-cover property invariantly under pro-isomorphism.
3. Apply the ordinary pointed universal-cover functor levelwise and retain its transition maps and deck actions.

**API.**

- `cover_pullback` (structure): Pullback of a pro-covering is a pro-covering; finite degree is preserved under base change.
- `universalCover_pi` (compatibility): On connected pointed levels the universal covering kills π_1 and preserves π_n for n≥2.
- `deckGroup_pro` (equivalence): The deck pro-group of the pointed universal covering is π_1(X,x).
- `constant_cover_realization` (compatibility): For a constant simplicial covering its realization agrees with the ordinary covering-space interface.

**Discriminating tests.**

- `identity_cover` (degenerate): The identity covering has one point over each vertex and trivial deck group.
- `double_circle_cover` (computation): The connected degree-two cover of the singular circle corresponds to 2Z⊂Z and has deck group Z/2.
- `kan_not_cover` (non-example): The Kan fibration Sing(S¹)→* is not a covering: the fiber contains nonconstant singular simplices, violating uniqueness over a vertex.

**Consumers.** EH.3 finite étale base change: Recognizes the rigid étale type of a finite étale cover. EH.1 subgroup covering: Constructs the cover classified by a sub-pro-group.

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [SS] Appendix A.1, Definition A.1 and preceding paragraphs, p. 853. The unique vertex-lift definition and its levelwise pro-version are stronger than the Kan fibration condition.

**Planet:** Coverings of pro-spaces.

### Covering associated to a sub-pro-group

**Target:** `EtaleHomotopyTypes:EH.1/subgroup-covering` (construction).

For connected pointed X and a monomorphism U↪π_1(X,x) of pro-groups, construct h:X_U→X in the connected pointed homotopy category. For every connected pointed W, composition with h bijects Hom(W,X_U) with the pointed homotopy classes f:W→X for which π_1(f) factors through U. This universal property specifies X_U over X up to unique isomorphism there. No finite-index hypothesis is imposed on U.

**Hypotheses and conventions:** Pointed connected pro-spaces where specified; arbitrary pro-groups, without a hidden finite-index restriction.

**Direct inputs:** `EtaleHomotopyTypes:EH.1/pro-covering`, `EtaleHomotopyTypes:EH.0/isaksen-model`, `DiamondsAndVStacks:D0`.

**Construction or proof.**

1. Represent the subgroup monomorphism levelwise after reindexing, using images if necessary; build the ordinary subgroup covers at each level.
2. Use ordinary lifting uniqueness to define their transition maps, and cofinite reindexing to compare choices.
3. Apply the levelwise lifting criterion and pass to homotopy classes into a fibrant target; the resulting representability gives the independence statement.

**API.**

- `subgroupCover_lift_iff` (universal-property): A pointed homotopy class lifts exactly when its pro-π_1 factors through U.
- `subgroupCover_monotone` (functoriality): An inclusion U↪V over π_1 gives X_U→X_V over X, compatible with composition.
- `subgroupCover_full` (simp): The full subgroup gives the identity cover.
- `subgroupCover_trivial` (compatibility): The trivial sub-pro-group gives the universal pointed cover.

**Discriminating tests.**

- `circle_twoZ` (computation): For constant Sing(S¹) and U=2Z the representing cover is the ordinary degree-two cover.
- `whole_subgroup` (degenerate): For U=π_1(X), h is an isomorphism over X.
- `circle_zero` (non-example): For U=0⊂Z the cover of Sing(S¹) is universal and has infinite fiber; restricting the construction to finite covers would fail this test.

**Consumers.** SS A.2 and A.3: Characterizes liftable maps and transports connected covers under equivalence.

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [SS] Proposition A.2, p. 854. The subgroup is a monomorphism of pro-groups and its factorization property is in the connected pointed homotopy category.

**Planet:** Subgroup coverings.

### Coverings under homotopy equivalence

**Target:** `EtaleHomotopyTypes:EH.1/covering-equivalence` (theorem).

Pullback along an Isaksen weak equivalence between connected pro-spaces induces an equivalence on their categories of connected coverings.

**Hypotheses and conventions:** Pointed connected pro-spaces where specified; arbitrary pro-groups, without a hidden finite-index restriction.

**Direct inputs:** `EtaleHomotopyTypes:EH.1/subgroup-covering`, `EtaleHomotopyTypes:EH.0/properness`.

**Construction or proof.**

1. Transport sub-pro-groups along the pro-π_1 isomorphism and use the covering universal property to get the category equivalence.

**Check.** A bare levelwise fibration is not promoted to a pro-fibration by this argument; the covering matching-map property is essential.

**Source.** [SS] Lemma A.3, p. 854. Subgroup classification transports connected covers along a weak equivalence.

### Coverings are pro-fibrations

**Target:** `EtaleHomotopyTypes:EH.1/covering-fibration` (theorem).

Every pro-covering is a fibration in Isaksen’s model structure.

**Hypotheses and conventions:** Pointed connected pro-spaces where specified; arbitrary pro-groups, without a hidden finite-index restriction.

**Direct inputs:** `EtaleHomotopyTypes:EH.1/pro-covering`, `EtaleHomotopyTypes:EH.0/isaksen-model`, `DiamondsAndVStacks:D0`.

**Construction or proof.**

1. For fibrancy use a cofinite level presentation; the relative matching maps are coverings, hence co-1-fibrations. Apply the strong-fibration criterion, and pass to isomorphic presentations.

**Check.** A levelwise Kan fibration without the covering matching condition is not certified by this result.

**Source.** [SS] Lemma A.4, p. 854. Cofinite relative matching maps are coverings, giving strong fibrations.

### Base change of homotopy isomorphisms

**Target:** `EtaleHomotopyTypes:EH.1/cover-basechange-in-ho` (theorem).

For maps f:X→W and g:Y→W and an isomorphism γ:X≅Y in Ho(Pro(SSet)) with gγ=f, every pro-covering W′→W admits an isomorphism γ′:X×_W W′≅Y×_W W′ in the homotopy category, compatible with γ and the maps to W′. Choices can be made compatibly with morphisms of the covering. If W′/W is connected Galois, the induced cohomology isomorphisms with any constant abelian group A are equivariant for its deck pro-group action. Existence, rather than uniqueness of γ′, is asserted.

**Hypotheses and conventions:** Pointed connected pro-spaces where specified; arbitrary pro-groups, without a hidden finite-index restriction.

**Direct inputs:** `EtaleHomotopyTypes:EH.1/covering-equivalence`, `EtaleHomotopyTypes:EH.0/properness`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `EtaleHomotopyTypes:EH.1/covering-fibration`.

**Construction or proof.**

1. Replace W by a fibrant object and transport the connected covering category along the equivalence; handle components separately.
2. Represent γ and the structural homotopy by actual maps into fibrant replacements. Lift that homotopy along the covering to make the maps compatible.
3. Right properness identifies the strict pullbacks with the required derived pullbacks. Deck transformations commute with these lifted maps, giving equivariance after cohomology.

**Check.** For W′=W choose γ′=γ. Do not claim canonical uniqueness for a general homotopy isomorphism.

**Source.** [SS] Proposition A.6, pp. 855–856. A homotopy equivalence in the slice of the homotopy category can be transported along a covering; its proof supplies deck equivariance.

### Classifying pro-space and fibrant replacement

**Target:** `EtaleHomotopyTypes:EH.1/pro-classifying-space` (construction).

For a pro-group G=(G_i) use H.1’s discrete nerves BG_i and EG_i levelwise. On a cofinite directed presentation define G_i* = ∏_{j≤i}G_j, embed G_i by all transition maps (including the identity factor), and set B*G_i=E(G_i*)/G_i for the resulting right action. Then BG→B*G is a levelwise ordinary weak equivalence and B*G is fibrant in the Isaksen pointed model. BG is not declared fibrant merely because each level is Kan.

**Hypotheses and conventions:** Pointed connected pro-spaces where specified; arbitrary pro-groups, without a hidden finite-index restriction.

**Direct inputs:** `EtaleHomotopyTypes:EH.0/isaksen-model`, `DiamondsAndVStacks:D0`, `StableHomotopyKTheory:H.1/classifying-space-of-group`, `StableHomotopyKTheory:H.1/translation-category-classifying-space`, `StableHomotopyKTheory:H.1/classifying-space-of-group-is-KG1`.

**Construction or proof.**

1. Import the discrete free, contractible EG and its quotient; build G* from finite predecessor products.
2. The diagonal inclusion of G_i into G_i* is injective, and the product projection to predecessor factors is surjective. The associated nerve map is a Kan fibration; this discrete lemma is requested from H.1.
3. Check the relative matching maps for B*G are co-1-fibrations. Both quotient models have π_1=G_i and no higher groups, so the comparison is a level weak equivalence.

**API.**

- `proBG_pi` (compatibility): π_1(BG)=G and π_n(BG)=0 for n≥2, using H.1’s discrete computations.
- `proBG_map` (functoriality): Homomorphisms of pro-groups induce pointed maps, compatible with composition.
- `proBG_fibrantReplacement` (characterisation): BG→B*G is a weak equivalence with fibrant codomain; reindexing choices give the same derived object.
- `proEG_quotient` (compatibility): Each pro-level EG→BG has its given deck action and quotient isomorphism.

**Discriminating tests.**

- `trivial_proBG` (degenerate): B1 is contractible and its π_1 is trivial.
- `finite_Cp` (computation): For constant C_p, BC_p has π_1=C_p and all π_n for n≥2 zero; it need not have finitely many nondegenerate simplices.
- `padic_system` (compatibility): For G=(Z/p^r), π_1(BG) is this inverse system; it is not the constant discrete additive group Z_p.

**Consumers.** EH.1 pro-BG representability: Computes derived maps by strict maps into B*G. EH.4 arithmetic orbit theorem: Models the étale type of a field and its π_1.

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [SS] Lemma A.14, pp. 862–864. Adds a pro-level fibrant replacement to the already owned discrete BG and EG.

**Planet:** Classifying pro-spaces.

### Full faithfulness of pro-classifying spaces

**Target:** `EtaleHomotopyTypes:EH.1/proBG-full-faithful` (theorem).

For pro-groups G,H the nerve map identifies Hom_Pro(Grp)(G,H) with strict pointed pro-simplicial maps BG→BH and with pointed Isaksen homotopy classes BG→BH.

**Hypotheses and conventions:** Pointed connected pro-spaces where specified; arbitrary pro-groups, without a hidden finite-index restriction.

**Direct inputs:** `EtaleHomotopyTypes:EH.1/pro-classifying-space`.

**Construction or proof.**

1. Strict nerve maps are determined by their one-simplex map, and the two-simplex identities impose the homomorphism law.
2. Replace BH with B*H; the auxiliary map to BH* is injective on strict pointed maps because the intervening map is a pointed covering. The same π_1 computation proves injectivity after localization.

**Check.** For constant groups the pointed quotient retains homomorphisms, whereas forgetting the point introduces target conjugation.

**Source.** [SS] Lemma A.15, pp. 863–864. The strict maps and localized pointed maps both recover the homomorphisms of pro-groups.

### Maps into classifying pro-spaces

**Target:** `EtaleHomotopyTypes:EH.1/classifying-representability` (theorem).

For connected pointed X and any pro-group G, π_1 induces a natural bijection Hom_Ho(Pro(SSet)_*)(X,BG)≅Hom_Pro(Grp)(π_1(X),G).

**Hypotheses and conventions:** Pointed connected pro-spaces where specified; arbitrary pro-groups, without a hidden finite-index restriction.

**Direct inputs:** `EtaleHomotopyTypes:EH.1/pro-classifying-space`, `EtaleHomotopyTypes:EH.0/connected-detection`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `EtaleHomotopyTypes:EH.1/proBG-full-faithful`.

**Construction or proof.**

1. Use the ordinary first Postnikov truncation X_i→BΠ_1X_i. Inclusion of the chosen object gives BG_i→BΠ_1X_i and is a level weak equivalence when the levels are connected.
2. Represent maps into fibrant B*G. Ordinary maps from a groupoid nerve to a group nerve and pointed homotopies correspond to homomorphisms; pointing removes conjugation.
3. Use the lim-colim Hom formula and reindexing for the pro statement. The first Postnikov construction is part of the requested ordinary topology interface.

**Check.** For constant X=S¹ this gives elements of G. For constant X=S² it gives exactly one class; unpointed maps between BGs give conjugacy classes instead.

**Source.** [SS] Proposition A.16 and proof, pp. 864–866. Fundamental groupoids provide the first truncation before the pro-BG fibrant replacement computes derived maps.

**Planet:** Pro-BG representability.

### The first classifying morphism

**Target:** `EtaleHomotopyTypes:EH.1/classifying-morphism` (construction).

For connected pointed X define c_X:X→Bπ_1(X) in the pointed homotopy category as the unique class corresponding to id under pro-BG representability. Call X a raw K(π,1) when π_n(X)=0 for all n≥2. Then c_X is an isomorphism if and only if X is a raw K(π,1). This is a property of the full pro-homotopy type, distinct from a finite- or p-coefficient convention on schemes.

**Hypotheses and conventions:** Pointed connected pro-spaces where specified; arbitrary pro-groups, without a hidden finite-index restriction.

**Direct inputs:** `EtaleHomotopyTypes:EH.1/classifying-representability`, `EtaleHomotopyTypes:EH.0/connected-detection`.

**Construction or proof.**

1. Use representability with G=π_1(X) to obtain the actual morphism class.
2. Naturality follows from the uniqueness part of the bijection. Its π_1 map is the identity; the target’s higher groups vanish.
3. Apply connected detection. NC.0 owns the separately hypothesized comparison with its finite-coefficient scheme predicate.

**API.**

- `classifying_pi1` (simp): π_1(c_X)=id under the canonical BG identification.
- `classifying_natural` (functoriality): For pointed f:X→Y, c_Y∘f=Bπ_1(f)∘c_X.
- `classifying_isIso_iff` (characterisation): c_X is invertible exactly when every π_n(X), n≥2, vanishes.
- `classifying_BG` (compatibility): For BG the classifying map is the identity under π_1(BG)=G.

**Discriminating tests.**

- `point_aspherical` (degenerate): The one-point pro-space is a raw K(π,1).
- `circle_aspherical` (compatibility): The constant singular circle is raw K(Z,1) and its c_X is an isomorphism.
- `sphere_obstruction` (non-example): The constant singular S² is not raw K(π,1), since π_2=Z, despite π_1=0.

**Consumers.** NC.0/raw-homotopy-comparison: Supplies the raw side of the finite-coefficient comparison without taking ownership of that comparison. EH.4 product targets: Reduces maps into aspherical targets to pro-group maps.

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [SS] Definition A.17 and Corollary A.18, p. 866. The defining classifying map is specified by the identity of π_1, and the higher-group criterion detects its invertibility.

**Planet:** Raw K(π,1) criterion.

## EH.2. Materialization and relative monodromy

Read and verify the convergence inputs G2, with the genuine totalization tower; obtain R2/R3/R5.

### Homotopy limit and topological homotopy groups

**Target:** `EtaleHomotopyTypes:EH.2/materialization` (construction).

Let Mat(X) denote the right-derived limit of a small pro-simplicial set, represented by the ordinary homotopy limit of a levelwise Kan diagram. For a pointed X define π_n^top(X,x)=π_n(Mat(X),x), with pointed sets in degree zero. The derived constant/limit adjunction identifies it with Hom_Ho(Pro(SSet)_*)(cS^n,X). Call X path-connected when Mat(X) is path-connected. Its comparison to lim_i π_n(X_i,x_i) is canonical; invertibility requires the separate profiniteness theorem.

**Hypotheses and conventions:** Small pointed pro-simplicial diagrams; path-connectedness, profiniteness and surjectivity are required exactly where stated.

**Direct inputs:** `EtaleHomotopyTypes:EH.0/isaksen-model`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `DiamondsAndVStacks:D0`.

**Construction or proof.**

1. Constant objects preserve cofibrations and trivial cofibrations, so constant and limit form a Quillen adjunction.
2. Use I01 Proposition 8.4’s levelwise Kan and Postnikov-tower argument to identify the derived limit with the ordinary homotopy limit.
3. The requested unstable homotopy-limit interface uses a Reedy fibrant cosimplicial replacement C^q=∏_{i_q→…→i_0}X_i0 and actual Tot_m=Map(sk_m Δ^•,C^•), including all compatibility equations. A single C^m is not Tot_m.

**API.**

- `materialization_derivedAdjunction` (universal-property): Derived maps cK→X are naturally maps K→Mat(X).
- `materialization_reindex` (compatibility): Cofinal reindexing and Isaksen weak equivalence preserve Mat up to ordinary weak equivalence.
- `topPi_comparison` (functoriality): Projections induce natural π_n^top(X)→lim π_n(X_i), with the prescribed low-degree algebra.
- `pathConnected_iff` (characterisation): Path-connectedness means π_0(Mat(X)) is a singleton, rather than only π_0(X)=*.

**Discriminating tests.**

- `constant_space` (compatibility): Mat(cK)≃K for a Kan complex K.
- `finite_sets` (computation): For a system of finite sets considered as discrete spaces, Mat is the discrete set of compatible tuples and has no positive homotopy groups.
- `tot_not_degree` (non-example): For the discrete diagram *→{0,1} sending * to 0, a degree-zero choice (*,1) in the cosimplicial replacement has no extension to Tot_1. The compatibility equations exclude it; retaining only independent product coordinates would admit it.

**Consumers.** EH.2 Theorem A.8: Relates topological and pro-homotopy groups. EH.6 Et_p: Produces an ordinary simplicial set from a completed pro-object.

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [I01] Proposition 8.2, Corollary 8.3 and Proposition 8.4, pp. 14–15. Uses Postnikov replacement to compare the derived limit for the two pro-space models. [SS] Appendix A.2.2, p. 857. Defines the topological homotopy groups and distinguishes path-connectedness from pro-connectedness.

**Planet:** Materialization of pro-spaces.

### Vanishing of profinite derived limits

**Target:** `EtaleHomotopyTypes:EH.2/profinite-derived-limits` (theorem).

For an inverse system G of finite groups over a small cofiltered category, the nonabelian derived-limit pointed set lim¹G is trivial. For a system A of finite abelian groups, lim^s A=0 for every s≥1. The assertion is invariant under pro-isomorphism, so it applies to profinite pro-groups represented by finite groups, without assuming countable indexing.

**Hypotheses and conventions:** Small pointed pro-simplicial diagrams; path-connectedness, profiniteness and surjectivity are required exactly where stated.

**Direct inputs:** `DiamondsAndVStacks:D0`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Construction or proof.**

1. Pass to a cofinite directed presentation. Embed G_i in G_i*=∏_{j≤i}G_j through all transition maps. Its matching projections are surjective and the product system is derived-limit acyclic.
2. The finite quotients G_i*/G_i are sets with transitive G_i* action; compactness supplies compatible lifts, giving the nonabelian lim¹ assertion.
3. In the abelian case use 0→A→A*→A*/A→0, acyclicity of A*, and dimension shifting. The higher derived-limit formalism is included in the topology supplier contract. Current Tau Ceti already supplies inverse-system compactness; do not rebuild it.

**Check.** Use the system Z/p^r to obtain lim¹=0. The unrestricted discrete system Z with multiplication by p is outside the finite/profinite hypothesis and cannot be accepted by this proof.

**Source.** [SS] Lemma A.7, pp. 856–857. Uses finite-predecessor product resolutions and compactness; no Mittag–Leffler tower restriction is inserted.

**Planet:** Profinite derived-limit vanishing.

### Homotopy groups of profinite pro-spaces

**Target:** `EtaleHomotopyTypes:EH.2/profinite-holim-groups` (theorem).

If pointed X has π_0(X)=* and every π_n(X), n≥1, is a profinite pro-group, then Mat(X) is path-connected and π_n^top(X)→lim π_n(X) is an isomorphism for all n≥1; the degree-zero comparison is a bijection of singleton pointed sets. No finiteness of the whole simplicial sets or uniform Postnikov bound is assumed.

**Hypotheses and conventions:** Small pointed pro-simplicial diagrams; path-connectedness, profiniteness and surjectivity are required exactly where stated.

**Direct inputs:** `EtaleHomotopyTypes:EH.2/materialization`, `EtaleHomotopyTypes:EH.2/profinite-derived-limits`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Construction or proof.**

1. Apply the genuine Reedy totalization tower. Its fringe spectral sequence has E_2^{s,t}=lim^s π_t(X), with abelian groups for t≥2 and the pointed-set/group interpretations on the low fringe.
2. Use profinite-derived-limit vanishing. Verify the connectivity and complete-convergence hypotheses for this tower, not only collapse of the displayed E_2 page; this is the explicit unread Bousfield–Kan proof obligation G2.
3. The edge comparison is induced by the projections, hence agrees with the canonical map and is natural.

**Check.** For X=B(Z/p^r), the materialization is K(Z_p,1) as an ordinary homotopy type; π_1 is the underlying abstract group of the inverse limit, with its profinite topology available separately. A statement only about inverse limits of π_1 cannot certify path-connectedness or the higher comparisons.

**Source.** [SS] Theorem A.8 and proof, pp. 857–858. The proof needs the actual partial-totalization tower and the connectivity and complete-convergence hypotheses, recorded in G2.

**Planet:** Profinite homotopy-limit theorem.

### Endpoint-preserving pro-cylinders

**Target:** `EtaleHomotopyTypes:EH.2/relative-cylinder` (construction).

For a pro-simplicial set X with two distinct specified vertices x_0,x_1, form Cyl₂(X) from X×Δ[1] by collapsing each {x_i}×Δ[1] to its own vertex. The endpoint map X⊔_{ {x_0,x_1} }X→Cyl₂(X) is a cofibration and the projection to X is an Isaksen weak equivalence. These maps form a cylinder in the undercategory of the two-point set. The projection need not be a fibration.

**Hypotheses and conventions:** Small pointed pro-simplicial diagrams; path-connectedness, profiniteness and surjectivity are required exactly where stated.

**Direct inputs:** `EtaleHomotopyTypes:EH.0/isaksen-model`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Construction or proof.**

1. Construct the quotient levelwise and use ordinary relative simplicial cylinder theory, preserving its two endpoint inclusions.
2. Each quotient projection contracts the interval relative to the two selected vertices in the ordinary homotopy sense, so the pro-projection is a weak equivalence.
3. Use this cylinder only for cofibrant domains in the undercategory; the interval with its two distinct endpoints supplies the domain for paths.

**API.**

- `cylinder_endpoint_cofibration` (structure): The combined endpoint inclusion is a cofibration in the two-point undercategory.
- `cylinder_projection_weakEquivalence` (characterisation): The projection is a weak equivalence and composes with either endpoint to the identity.
- `path_relative_homotopy` (characterisation): Maps from Δ[1] into a fibrant target modulo this cylinder give endpoint-preserving path classes.

**Discriminating tests.**

- `two_points_cylinder` (degenerate): For X={x_0,x_1}, Cyl₂(X) is X and the projection is the identity.
- `third_point_interval` (non-example): For X={x_0,x_1,a}, Cyl₂(X) is two isolated vertices together with Δ[1] over a. This projection is not a Kan fibration: a Kan horn witnessing an inverse to the directed edge has no filler.
- `fixed_endpoints` (compatibility): For X=Δ[1] with its endpoints, a homotopy fixes both endpoints at every time, as required for ordinary relative path homotopy.

**Consumers.** EH.2 path transport: Defines the path groupoid in the homotopy category without a false fibration assertion.

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [SS] Appendix A.2.3, p. 858, corrected cylinder assertion. Only a cofibration and a weak equivalence are required; the printed fibration claim has the elementary counterexample recorded in E2.

### Monodromy on pointed mapping classes

**Target:** `EtaleHomotopyTypes:EH.2/path-transport` (construction).

For pointed pro-spaces X and two points y_0,y_1 of Y, a path class u:y_0→y_1 in Mat(Y) induces a bijection u_*:Hom_Ho(Pro(SSet)_*)(X,(Y,y_0))→Hom(X,(Y,y_1)). Identity paths act identically and composition of paths composes these bijections. At y_0=y_1 this is the π_1^top(Y,y_0) action. Use the convention for which the induced action on fundamental-group homomorphisms is φ↦αφα⁻¹.

**Hypotheses and conventions:** Small pointed pro-simplicial diagrams; path-connectedness, profiniteness and surjectivity are required exactly where stated.

**Direct inputs:** `EtaleHomotopyTypes:EH.2/materialization`, `EtaleHomotopyTypes:EH.2/relative-cylinder`, `EtaleHomotopyTypes:EH.0/isaksen-model`.

**Construction or proof.**

1. Replace Y by a fibrant target. Extend the pair consisting of f:X→Y and the path u along X∨Δ[1]→X×Δ[1], a trivial cofibration.
2. The terminal restriction gives a pointed map to (Y,y_1). Use relative homotopies to prove independence of extension, representative path and fibrant replacement.
3. Concatenation and inversion prove the action laws. Compare the induced map of loops with conjugation using the same path-order convention.

**API.**

- `transport_id` (simp): Transport along the constant path fixes every pointed class.
- `transport_comp` (functoriality): Transport along a composite equals successive transport.
- `transport_pi1` (compatibility): For a loop α, the induced π_1 homomorphism is αφα⁻¹.
- `transport_natural` (functoriality): Transport is natural under pointed source maps and target maps carrying the chosen path.

**Discriminating tests.**

- `BG_conjugation` (computation): For X=BC₂,Y=BS₃, a transposition homomorphism is transported to each of its conjugates in S₃.
- `abelian_target` (compatibility): For X=S¹,Y=BC₃, loop transport fixes each homomorphism Z→C₃.
- `transport_empty_paths` (non-example): For a constant two-point target, distinct points have no connecting path; no transport bijection between those basepoints is postulated.

**Consumers.** EH.2 forgetful orbit formula: Describes the fibers of forgetting the point. EH.4 geometric orbit theorem: Identifies the geometric fundamental-group action on arithmetic mapping classes.

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [SS] Lemma A.9 and Lemma A.12, pp. 858–860. Lifting a path in a fibrant replacement defines monodromy and identifies its group action with target conjugation.

**Planet:** Monodromy on mapping classes.

### Pointed maps modulo monodromy

**Target:** `EtaleHomotopyTypes:EH.2/unpointed-orbits` (theorem).

If Y is path-connected, forgetting points induces a bijection Hom_Ho(Pro(SSet)_*)(X,Y)/π_1^top(Y)≅Hom_Ho(Pro(SSet))(X,Y), for any pointed X.

**Hypotheses and conventions:** Small pointed pro-simplicial diagrams; path-connectedness, profiniteness and surjectivity are required exactly where stated.

**Direct inputs:** `EtaleHomotopyTypes:EH.2/path-transport`.

**Construction or proof.**

1. Represent an unpointed map into a fibrant target; connect its image of the source point to the target point and transport.
2. An unpointed homotopy has a basepoint track; its loop is precisely the orbit ambiguity, proving injectivity of the orbit map.

**Check.** For BC₂→BS₃, the trivial homomorphism and the conjugacy class of transposition homomorphisms give exactly two unpointed classes.

**Source.** [SS] Theorem A.10, p. 859. The quotient computes unpointed maps when the target is path-connected.

**Planet:** Pointed-to-unpointed orbit formula.

### Pointed lifts of unpointed isomorphisms

**Target:** `EtaleHomotopyTypes:EH.2/unpointed-isomorphism-lift` (theorem).

If pointed X is unpointedly isomorphic to connected pointed Y and every π_n(Y), n≥1, is a profinite pro-group, every such unpointed isomorphism admits a pointed isomorphism lift.

**Hypotheses and conventions:** Small pointed pro-simplicial diagrams; path-connectedness, profiniteness and surjectivity are required exactly where stated.

**Direct inputs:** `EtaleHomotopyTypes:EH.2/unpointed-orbits`, `EtaleHomotopyTypes:EH.2/profinite-holim-groups`, `EtaleHomotopyTypes:EH.0/connected-detection`.

**Construction or proof.**

1. EH.2’s profinite homotopy-limit theorem gives paths between the necessary points.
2. The absolute orbit theorem supplies a pointed lift, whose underlying unpointed isomorphism makes it a pointed isomorphism.

**Check.** The lift need not be unique, and forgetting the pro-connected/profinite hypotheses is not justified.

**Source.** [SS] Corollary A.11, p. 859. Profiniteness provides path-connectedness and the pointed lift reflects invertibility.

### Pointed lifting over a base

**Target:** `EtaleHomotopyTypes:EH.2/relative-surjection` (theorem).

Let pointed X,Y map to pointed B. If Y and B are path-connected and π_1^top(Y)→π_1^top(B) is surjective, forgetting points gives a surjection from Hom in Ho(Pro(SSet)_*)↓(B,b) to Hom in Ho(Pro(SSet))↓B. These are slices of homotopy categories: their structural triangles commute as morphism classes; no chosen null-homotopy is part of a morphism.

**Hypotheses and conventions:** Small pointed pro-simplicial diagrams; path-connectedness, profiniteness and surjectivity are required exactly where stated.

**Direct inputs:** `EtaleHomotopyTypes:EH.2/unpointed-orbits`, `EtaleHomotopyTypes:EH.2/path-transport`.

**Construction or proof.**

1. Lift the underlying unpointed map to a pointed one using target path-connectedness.
2. The two composites to B differ by a loop at b. Surjectivity on topological π_1 lifts that loop to Y.
3. Transport by its inverse to obtain a pointed map in the relative Hom set.

**Check.** For B=* this recovers the absolute surjection. Replacing the source with Ho(Pro(SSet)_*/B) changes the mapping problem and fails the stated interface.

**Source.** [SS] Theorem A.13(a), pp. 860–862. A loop lifted from B corrects a pointed representative so its structural triangle commutes in the pointed homotopy category.

### Relative isomorphisms lift

**Target:** `EtaleHomotopyTypes:EH.2/relative-isomorphism-lift` (theorem).

Under the hypotheses of relative-surjection, any isomorphism in Ho(Pro(SSet))↓B has a preimage that is an isomorphism in Ho(Pro(SSet)_*)↓(B,b).

**Hypotheses and conventions:** Small pointed pro-simplicial diagrams; path-connectedness, profiniteness and surjectivity are required exactly where stated.

**Direct inputs:** `EtaleHomotopyTypes:EH.2/relative-surjection`, `EtaleHomotopyTypes:EH.0/connected-detection`.

**Construction or proof.**

1. Use relative-surjection to lift the given map.
2. Its underlying unpointed map is an isomorphism, so it is an isomorphism in the pointed homotopy category. The inverse also commutes with the structure map because the original triangle does.

**Check.** No uniqueness of the lift or of its pointed inverse class beyond ordinary categorical inversion is claimed.

**Source.** [SS] Theorem A.13(a), last assertion, pp. 860–862. The pointed lift reflects invertibility on underlying homotopy types.

### Stabilizer quotient for relative maps

**Target:** `EtaleHomotopyTypes:EH.2/relative-orbits` (theorem).

With the same hypotheses, let S_X⊂π_1^top(B,b) be the stabilizer of the pointed structure class p_X under monodromy, and Δ_XY its preimage under π_1^top(Y,y)→π_1^top(B,b). Monodromy restricts to the pointed relative Hom set, and its Δ_XY-orbits biject with Hom_Ho(Pro(SSet))↓B(X,Y). The whole π_1(Y) need not preserve the relative subset.

**Hypotheses and conventions:** Small pointed pro-simplicial diagrams; path-connectedness, profiniteness and surjectivity are required exactly where stated.

**Direct inputs:** `EtaleHomotopyTypes:EH.2/relative-surjection`, `EtaleHomotopyTypes:EH.2/path-transport`.

**Construction or proof.**

1. Naturality of path transport identifies the loops preserving the structural triangle with Δ_XY.
2. Use the absolute orbit theorem to characterize pairs with the same unpointed class; the relative constraint forces the loop into Δ_XY.
3. Use the relative surjection for existence, giving the claimed bijection.

**Check.** For B=*, Δ_XY=π_1^top(Y). For X=B=BG with identity structure, its stabilizer is Z(G); when G=S₃ this stabilizer is trivial, so replacing Δ by the full π_1(Y) would be wrong.

**Source.** [SS] Theorem A.13(b), pp. 861–862. The correct relative quotient uses the preimage of the structural-map stabilizer.

**Planet:** Relative stabilizer orbit formula.

## EH.3. Rigid étale types and finite-cover comparison

Read coefficient comparison G3, geometric-unibranch profiniteness G4 and elementary-fibration theorem G5; integrate R6/R8.

### Rigid étale covers

**Target:** `EtaleHomotopyTypes:EH.3/rigid-cover` (definition).

For a locally noetherian scheme X in a fixed universe, a rigid cover is a disjoint union U=∐_x U_x indexed by its geometric points in the chosen small presentation, each U_x connected, étale and separated over X, with a specified lift u_x of x. Morphisms preserve these lifts. The geometric-point presentation and its universe enlargement comparisons are retained. A rigid pullback along f:X→Y uses the component of X×_Y U_f(x) containing the specified lifted point, separately for every x; this may repeat a component of the ordinary pullback.

**Hypotheses and conventions:** Locally noetherian schemes, degreewise for simplicial schemes; all finite-type, geometric-unibranch and characteristic restrictions in the statement are retained.

**Direct inputs:** `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `DiamondsAndVStacks:D0`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `SchemeAndStackFoundations:SF.0`.

**Construction or proof.**

1. Use the small étale site and a size-controlled geometric-point indexing family; existence of connected components as open subschemes follows from local noetherianity.
2. Take connected pointed components of the ordinary fiber products. A point-preserving map between connected étale separated neighborhoods is unique.
3. Prove the rigid pullback universal property. Size and choice compatibility are part of supplier contract R1, rather than a claim that a class of all geometric points is a small set.

**API.**

- `rigidCover_map_unique` (extensionality): There is at most one rigid cover map over a fixed base map.
- `rigidPullback_lift` (universal-property): Rigid maps V→f*U over Z→X correspond to rigid maps V→U over Z→Y.
- `rigidPullback_comp` (compatibility): Iterated rigid pullback agrees, by its canonical isomorphism, with pullback along the composite.
- `rigidCover_etale` (structure): Each chosen connected piece is separated étale; the disjoint union is a covering family, with no finite-component requirement.

**Discriminating tests.**

- `chosen_algebraic_point` (computation): Over an algebraically closed field, a connected étale neighborhood of the canonical point is Spec of that field and its chosen lift is unique.
- `repeat_components` (non-example): For A¹_C→Spec C and the canonical point cover of Spec C, ordinary pullback has one connected component A¹_C. Rigid pullback has a separate copy for each geometric point of A¹_C, including distinct copies chosen at 0 and 1. Replacing it by the ordinary pullback loses the rigid data.
- `finite_not_required` (non-example): On A¹_C the indexing includes its infinitely many complex closed points; a definition demanding a finite index family would reject the required rigid covers.

**Consumers.** EH.3 rigid hypercovers: Supplies matching covers and their rigid pullbacks. FGV A.2.2: Ensures functoriality survives algebraic field automorphisms.

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [IEt] Definitions 5.1, 5.3 and Proposition 5.5, pp. 13–14. The separated, connected pointed pieces make maps unique; rigid pullback is not ordinary base change.

**Planet:** Rigid étale covers.

### Rigid hypercovers of simplicial schemes

**Target:** `EtaleHomotopyTypes:EH.3/rigid-hypercover` (construction).

A rigid hypercover U_•→X of a scheme is an augmented simplicial scheme whose map U_n→(cosk^X_{n−1}U)_n is a rigid cover for every n≥0, with U_0→X in degree zero. For simplicial X_• use an augmented bisimplicial U_{a,b}, with U_{a,−1}=X_a, whose rows are rigid hypercovers and whose maps in a preserve the rigid lifts. HRR(X_•) has at most one map between any two objects, is nonempty and cofiltered, and admits rigid pullbacks along simplicial scheme maps. Generic hypercovers and descent remain E2’s construction.

**Hypotheses and conventions:** Locally noetherian schemes, degreewise for simplicial schemes; all finite-type, geometric-unibranch and characteristic restrictions in the statement are retained.

**Direct inputs:** `EtaleHomotopyTypes:EH.3/rigid-cover`, `EnhancedDerivedSheaves:E2/hypercover`, `DiamondsAndVStacks:D0`.

**Construction or proof.**

1. Use E2’s augmented matching-object convention. Recursively choose rigid covers; the split degeneracies are constructed through latching components with their specified points.
2. For finite diagrams form rigid limits by taking the connected pointed components of the ordinary matching fiber products; include the induced degeneracies, as in IEt Remarks 6.9 and 6.13.
3. The rigid-limit universal property supplies cones and uniqueness supplies equalizers. A finite-degree right Kan construction gives cofinality into ∏_{a≤m}HRR(X_a), for every m.

**API.**

- `rigidHypercover_degree_zero` (projection): The first matching map is the rigid cover U_0→X, never an omitted condition.
- `rigidHypercover_pullback` (functoriality): Rigid pullback preserves matching covers and has the universal property of IEt Proposition 6.10.
- `HRR_cofiltered` (structure): The size-controlled HRR index is nonempty and cofiltered.
- `HRR_finite_degree_cofinal` (compatibility): For every finite m, HRR(X_•)→∏_{a≤m}HRR(X_a) is cofinal.

**Discriminating tests.**

- `cech_refinement` (compatibility): An étale Čech hypercover admits rigid refinements compatible with its specified point lifts; its degree-one matching map is to U_0×_X U_0.
- `missing_degree_zero` (non-example): The empty augmented simplicial object over a nonempty scheme is not a rigid hypercover, even if all its positive-degree conditions are vacuous.
- `constant_scheme` (compatibility): HRR(X) and HRR(cX) yield equivalent indexing systems; the diagonal construction on a constant scheme recovers the ordinary étale type.

**Consumers.** EH.3 étale topological type: Makes the diagonal component systems into pro-objects. EH.6 comparison zigzag: Gives common refinements for the analytic comparison maps.

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [IEt] Definitions 6.2–6.4, pp. 16–17; Proposition 6.10, pp. 17–18; Proposition 6.14 and 6.17, pp. 19–20. The rigid matching data and rigid limits supply the cofiltered indexing and finite-degree cofinality used by the diagonal.

**Planet:** Rigid hypercovers.

### Rigid étale topological type

**Target:** `EtaleHomotopyTypes:EH.3/etale-type` (construction).

For a degreewise locally noetherian simplicial scheme X_• define Et(X_•) by the pro-system U↦diag π_0(U_{a,b}), U∈HRR(X_•). For an ordinary scheme use its constant simplicial object. A compatible geometric point determines a vertex of this pro-object. Rigid pullback gives functorial maps, compatible with compositions through the rigid universal isomorphisms. Define raw étale π_n by EH.0’s pro-homotopy groups; the finite-étale profinite group is a separate comparison, not its definition.

**Hypotheses and conventions:** Locally noetherian schemes, degreewise for simplicial schemes; all finite-type, geometric-unibranch and characteristic restrictions in the statement are retained.

**Direct inputs:** `EtaleHomotopyTypes:EH.3/rigid-hypercover`, `EtaleHomotopyTypes:EH.0/pro-space-homotopy-data`, `mathlib:SSet`.

**Construction or proof.**

1. Apply π_0 to each scheme in a rigid bisimplicial hypercover and take the diagonal n↦π_0(U_n,n).
2. Use the universal rigid pullback to give an index functor and the comparison map of diagrams. Track the canonical coherence isomorphisms in any strictification.
3. Finite-degree cofinality controls the skeleta. It gives the IEt comparison to the realization of the degreewise pro-types, without declaring those pro-objects strictly isomorphic.

**API.**

- `etaleType_map` (functoriality): Every scheme map induces a pro-map, with identity and composition after the chosen coherence identifications.
- `etaleType_point` (constructor): A geometric basepoint yields a compatible pro-vertex and pointed maps for point-preserving morphisms.
- `etaleType_constant` (compatibility): The constant simplicial scheme construction agrees with the ordinary rigid étale type.
- `etaleType_coproduct` (compatibility): Et sends disjoint unions to coproducts in pro-spaces; materialization or completion is not inferred to preserve these coproducts.

**Discriminating tests.**

- `separably_closed_type` (degenerate): For separably closed k, Et(Spec k) is weakly contractible.
- `finite_field_type` (computation): For F_q, Et(Spec F_q)≃B Gal(F_q^sep/F_q) with Gal≅Zhat as a pro-group, not constant discrete Z.
- `simplicial_Cp` (non-example): For the simplicial C-scheme B(C_p), the raw diagonal has the homotopy type BC_p. Replacing X_• by X_0 would give a point and is wrong.

**Consumers.** SS §2: Supplies all raw étale mapping classes and finite-cover transport. FGV A.2.2: Supplies the input to p-completion, before materialization.

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [IEt] §3, pp. 8–10, definitions of Et and sEt; Propositions 3.1–3.2 and Theorem 3.3. The simultaneous rigid system and its diagonal differ as pro-objects from merely realizing the degreewise pro-types, although the latter maps by weak equivalence. [FGV] Appendix A.2.2, equations (A.8)–(A.9), pp. 307–308. Uses the simultaneous bisimplicial rigid cover diagonal for a simplicial variety.

**Planet:** Étale topological type.

### Cohomology of the rigid étale type

**Target:** `EtaleHomotopyTypes:EH.3/etale-cohomology` (comparison).

For locally noetherian X, the rigid type has H^m(Et(X),L)≅H^m_et(X,L) for locally constant abelian étale sheaves L in the ordinary étale local-system range, naturally in X, L and every m≥0. This includes arbitrary constant abelian groups, not only finite groups. For a degreewise locally noetherian simplicial scheme, constant finite coefficients have the corresponding total/diagonal comparison. It uses the same native sheaf cohomology and the E2 bounded-below descent comparison.

**Hypotheses and conventions:** Locally noetherian schemes, degreewise for simplicial schemes; all finite-type, geometric-unibranch and characteristic restrictions in the statement are retained.

**Direct inputs:** `EtaleHomotopyTypes:EH.3/etale-type`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`, `SchemeAndStackFoundations:SF.2/etale-cohomology-limits`, `mathlib:CategoryTheory.Sheaf.H`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Construction or proof.**

1. Compare the local system on the simplicial component diagram with its pullback to the hypercover’s étale site.
2. Use E2’s bounded-below hypercover descent for the sheaf concentrated in degree zero, and take the filtered colimit over refinements. This requires the local-system acyclicity/refinement theorem, not the false claim that any cover is acyclic.
3. Read the proof and precise coefficient range of Friedlander Proposition 5.9 or a primary public replacement (G3); IEt’s citation alone does not close this step. Finite-degree descent then compares total and diagonal constant-coefficient cohomology.

**Check.** For separably closed k and constant A, H^0=A and H^m=0 for m>0. For a field, compare with SF.2/etale-galois-comparison; do not claim vanishing of higher Galois cohomology.

**Source.** [IEt] §2 after Theorem 2.10, p. 7, citing Friedlander Proposition 5.9; §3, pp. 8–10. States the cohomology comparison but the full arbitrary-local-system proof and range remain reading obligation G3. [SS] §2.1–2.2, pp. 822–824; Proposition 2.3, p. 824. The geometric Galois-cohomology transport uses all constant abelian groups.

### Raw and finite étale homotopy groups

**Target:** `EtaleHomotopyTypes:EH.3/fundamental-group-comparison` (comparison).

For connected locally noetherian X the profinite completion of the raw pro-group π_1(Et(X),x) identifies with IG.0’s finite-étale fundamental group, compatibly with finite-cover fibers. If X is noetherian and geometrically unibranch, each raw π_n, n≥1, is a profinite pro-group, and π_1 itself identifies with that finite-étale group in Pro(Grp). For a field this identifies Et(Spec k) with BG_k in the raw homotopy category.

**Hypotheses and conventions:** Locally noetherian schemes, degreewise for simplicial schemes; all finite-type, geometric-unibranch and characteristic restrictions in the statement are retained.

**Direct inputs:** `EtaleHomotopyTypes:EH.3/etale-type`, `EtaleHomotopyTypes:EH.1/classifying-morphism`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`.

**Construction or proof.**

1. Use the finite-cover classification of the rigid type and the geometric fiber to identify finite quotients of the raw π_1 with finite étale covers.
2. For geometric-unibranch noetherian schemes invoke the precise Artin–Mazur Theorem 11.1; its proof is unread and remains G4. Do not replace it by the abstract compactness of finite groups.
3. For a field use the finite Galois hypercover system to model Et by BG_k, equivalently the field’s higher asphericity. NC.0 owns the cohomological field conclusion.

**Check.** A non-unibranch nodal rational curve may have a nonprofinite raw fundamental pro-group; finite completion must remain explicit. The pro-étale Noohi group is another construction and is not substituted here.

**Source.** [SS] Notation before §2, p. 822; Appendix A.3, pp. 862–866. Separates raw SGA3-type π_1 from its finite-étale completion and invokes Artin–Mazur Theorem 11.1 for geometric-unibranch profiniteness.

### Finite étale base change

**Target:** `EtaleHomotopyTypes:EH.3/finite-etale-basechange` (theorem).

For finite étale W′→W between locally noetherian schemes, Et(W′)→Et(W) is a finite pro-covering. For every X→W in this scope the natural map Et(X×_W W′)→Et(X)×_{Et(W)}Et(W′) is an isomorphism of pro-simplicial sets. Consequently a relative homotopy isomorphism Et(X)≅Et(Y) over Et(W) lifts along W′, compatibly with projections, with the existence and deck-equivariance qualifications of EH.1.

**Hypotheses and conventions:** Locally noetherian schemes, degreewise for simplicial schemes; all finite-type, geometric-unibranch and characteristic restrictions in the statement are retained.

**Direct inputs:** `EtaleHomotopyTypes:EH.3/etale-type`, `EtaleHomotopyTypes:EH.1/pro-covering`, `EtaleHomotopyTypes:EH.1/cover-basechange-in-ho`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`.

**Construction or proof.**

1. For constant degree d, refine rigid covers so W′ splits as d copies on every connected hypercover piece. Treat varying finite degree on its open-and-closed degree loci.
2. On this cofinal system π_0(U×_W W′)→π_0(U) is a simplicial degree-d covering and the base-change square of component simplicial sets is cartesian.
3. Pass to the pro-system. Apply EH.1’s covering base-change result to homotopy isomorphisms; this final application adds no uniqueness assertion.

**Check.** For the trivial d-fold cover the type is the d-fold disjoint union at each split level. For a connected quadratic field extension, the associated BG map is a covering of degree two rather than an isomorphism.

**Source.** [SS] Lemmas 2.1–2.2 and proofs, pp. 822–823. Refines the rigid index until the finite cover splits on every connected piece; the resulting comparison is an actual pro-isomorphism.

**Planet:** Finite étale base change.

### Galois-equivariant geometric cohomology transport

**Target:** `EtaleHomotopyTypes:EH.3/geometric-galois-cohomology` (theorem).

If k-varieties X,Y have Et(X)≅Et(Y) in Ho(Pro(SSet))↓Et(k), then for every abelian group A and every m≥0 there is an isomorphism H^m_et(Y_kbar,A)→H^m_et(X_kbar,A) of G_k-modules, natural in A. Here kbar is a fixed separable closure (or its algebraic closure with the purely inseparable étale comparison). The isomorphism is induced by the lifted finite-cover system; an abstract group isomorphism alone is insufficient.

**Hypotheses and conventions:** Locally noetherian schemes, degreewise for simplicial schemes; all finite-type, geometric-unibranch and characteristic restrictions in the statement are retained.

**Direct inputs:** `EtaleHomotopyTypes:EH.3/finite-etale-basechange`, `EtaleHomotopyTypes:EH.3/etale-cohomology`, `SchemeAndStackFoundations:SF.2/etale-cohomology-limits`, `EtaleHomotopyTypes:EH.0/cohomological-detection`, `EtaleHomotopyTypes:EH.1/cover-basechange-in-ho`.

**Construction or proof.**

1. Apply EH.1 covering base change once to the pro-covering of Et(k) formed by the entire pointed finite Galois extension tower. This supplies an isomorphism of the pulled-back towers compatible with their deck action; unrelated choices of finite-cover lifts would not suffice.
2. Apply cohomology of the rigid type to this tower, keeping homotopy invariance for arbitrary constant abelian A and the deck-equivariant projection maps.
3. Take the filtered colimit of scheme cohomology along the affine field-extension system. SF.2’s limit theorem identifies this with the geometric cohomology, and the deck actions give the actual G_k action.

**Check.** For X=Y and the identity choose the identity on cohomology. Infinite A is still in scope; a finite-coefficient Artin comparison cannot replace G3.

**Source.** [SS] Proposition 2.3, p. 824. The finite-extension covering tower, its deck action and affine-limit cohomology give the geometric Galois-module isomorphism.

**Planet:** Galois-equivariant cohomology.

### Étale homotopy sequence for elementary fibrations

**Target:** `EtaleHomotopyTypes:EH.3/elementary-fibration-sequence` (theorem).

Let f:X→Y be an elementary fibration of smooth connected varieties in characteristic zero, with affine curve fibers, and geometric x↦y. Form the cofiltered pointed finite étale Galois cover system 𝒴 of Y and 𝒳=X×_Y𝒴. The geometric fiber, 𝒳 and 𝒴 have the Friedlander homotopy fiber sequence with all primes; finite-cover invariance identifies its higher groups with those of X and Y. This gives …→π_n Et(X_y)→π_n Et(X)→π_n Et(Y)→π_{n−1}Et(X_y)→… in the appropriate pro-group ranges. In particular, when Y is raw K(π,1), its low-degree part is 1→π_1 Et(X_y)→π_1 Et(X)→π_1 Et(Y)→1.

**Hypotheses and conventions:** Locally noetherian schemes, degreewise for simplicial schemes; all finite-type, geometric-unibranch and characteristic restrictions in the statement are retained.

**Direct inputs:** `EtaleHomotopyTypes:EH.3/finite-etale-basechange`, `EtaleHomotopyTypes:EH.3/fundamental-group-comparison`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `SchemeAndStackFoundations:SF.0`.

**Construction or proof.**

1. Import the geometric elementary-fibration input from SchemeAndStackFoundations:SF.0: a smooth proper geometrically connected curve family with finite étale boundary and nonempty affine complement fibers. NC.0’s K(pi,1) application consumes this homotopy sequence; it cannot supply the foundational sequence in return.
2. Over the pointed finite Galois covers, use Friedlander Theorem 11.5’s all-prime homotopy-fiber comparison (unread, G5). Its π_1 trivialization and finite-cover invariance give the claimed higher terms.
3. The low-degree injectivity requires π_2(Y)=0. NC.0 owns the deduction that X is K(π,1) when its affine-curve fibers and Y are K(π,1); do not derive the full sequence from the arithmetic π_1 exact sequence alone.

**Check.** For a trivial elementary fibration C×Y→Y, the sequence agrees with the product maps and the usual geometric fiber inclusion. This target does not assert the same theorem for arbitrary smooth nonproper families.

**Source.** [SS] Notation before §2, p. 822; Proposition 2.8, pp. 827–828, invoking Friedlander Theorem 11.5. Supplies the exact geometric hypotheses and cover-system reduction; the cited homotopy-fiber theorem is G5.

## EH.4. Arithmetic relative mapping classes

Obtain the precise arithmetic interfaces R7 and the existing NC.0 raw bridge and product theorem; close the propagated G1–G5 inputs.

### Pointed arithmetic lifting

**Target:** `EtaleHomotopyTypes:EH.4/arithmetic-pointed-lift` (theorem).

Let X,Y be connected finite-type k-varieties, with Y geometrically connected and geometrically unibranch. Choose geometric points over one separably closed extension of k and its induced separable closure kbar. The forgetful map Hom_Ho(Pro(SSet)_*)↓Et(k)(Et(X),Et(Y))→Hom_Ho(Pro(SSet))↓Et(k)(Et(X),Et(Y)) is surjective.

**Hypotheses and conventions:** X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch.

**Direct inputs:** `EtaleHomotopyTypes:EH.2/relative-surjection`, `EtaleHomotopyTypes:EH.2/relative-isomorphism-lift`, `EtaleHomotopyTypes:EH.2/profinite-holim-groups`, `EtaleHomotopyTypes:EH.3/fundamental-group-comparison`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Construction or proof.**

1. Identify Et(k) with BG_k. Geometric unibranchness of the noetherian Y makes its homotopy pro-groups profinite, so EH.2 gives path-connected materializations.
2. Import the geometric/arithmetic fundamental-group exact sequence from IG.1; apply the relative lifting theorem and its isomorphism assertion.

**Check.** The relative category is the slice of the homotopy category. Connectedness of Y over k alone cannot replace geometric connectedness.

**Source.** [SS] Proposition 2.4(a), p. 825. The geometric connectedness of Y makes its arithmetic fundamental-group map surjective; profiniteness gives the required topological path and loop comparisons.

**Planet:** Pointed arithmetic lifting.

### Pointed lifts of arithmetic isomorphisms

**Target:** `EtaleHomotopyTypes:EH.4/arithmetic-isomorphism-lift` (theorem).

Under arithmetic-pointed-lift’s hypotheses, every isomorphism over Et(k) in the unpointed homotopy category has a pointed isomorphism lift over (Et(k),kbar).

**Hypotheses and conventions:** X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch. Geometric basepoints are chosen over one separably closed extension, as in arithmetic-pointed-lift.

**Direct inputs:** `EtaleHomotopyTypes:EH.4/arithmetic-pointed-lift`, `EtaleHomotopyTypes:EH.2/relative-isomorphism-lift`.

**Construction or proof.**

1. Apply the relative isomorphism-lifting theorem using the same profinite and geometric-connectivity verifications as arithmetic-pointed-lift.

**Check.** No canonical choice of pointed lift is asserted.

**Source.** [SS] Proposition 2.4(a), second assertion, p. 825. The relative pointed lift of an underlying homotopy isomorphism remains invertible.

### Geometric monodromy quotient

**Target:** `EtaleHomotopyTypes:EH.4/geometric-orbits-surjection` (theorem).

Under arithmetic-pointed-lift’s hypotheses, π_1^et(Y_kbar,y) acts on pointed relative mapping classes, and forgetting points induces a surjection from its orbit set to the unpointed relative Hom set. This action is through the actual underlying abstract geometric fundamental group identified by EH.2, not through its finite quotients one at a time.

**Hypotheses and conventions:** X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch. Geometric basepoints are chosen over one separably closed extension, as in arithmetic-pointed-lift.

**Direct inputs:** `EtaleHomotopyTypes:EH.4/arithmetic-pointed-lift`, `EtaleHomotopyTypes:EH.2/relative-orbits`, `EtaleHomotopyTypes:EH.3/fundamental-group-comparison`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Construction or proof.**

1. The exact fundamental-group sequence identifies the geometric group with the kernel of π_1(Y)→G_k.
2. The kernel maps to the identity of G_k and therefore preserves the pointed structure class. It is contained in Δ_XY from the relative orbit theorem.
3. The relative pointed lifting surjection descends through this subgroup quotient; it need not yet be injective.

**Check.** For k separably closed this reduces to the absolute target-loop orbit formula.

**Source.** [SS] Proposition 2.4(b), p. 825. The geometric group is the kernel of the arithmetic map and is contained in the relative stabilizer preimage.

**Planet:** Geometric monodromy quotient.

### Arithmetic orbit bijection

**Target:** `EtaleHomotopyTypes:EH.4/geometric-orbits-bijection` (theorem).

Under arithmetic-pointed-lift’s hypotheses, if every open subgroup of G_k has trivial center, the geometric orbit surjection is bijective. The center condition is the strongly center-free predicate owned by IG.1, with all open subgroups included.

**Hypotheses and conventions:** X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch. Geometric basepoints are chosen over one separably closed extension, as in arithmetic-pointed-lift. Every open subgroup of the absolute Galois group G_k has trivial center.

**Direct inputs:** `EtaleHomotopyTypes:EH.4/geometric-orbits-surjection`, `EtaleHomotopyTypes:EH.2/relative-orbits`, `EtaleHomotopyTypes:EH.2/path-transport`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Construction or proof.**

1. If g stabilizes the structure class of Et(X)→BG_k, the conjugation formula says that g centralizes the image U of the raw pro-fundamental group in G_k.
2. The finite-type connected-variety openness theorem requested from IG.1 says that U is open, including when X is not geometrically unibranch. The open subgroup generated by U and g has g in its center, so g=1.
3. Thus S_X=1 and Δ_XY is exactly the geometric kernel. Apply the relative orbit theorem.

**Check.** Trivial center of G_k alone is not the supplied hypothesis: the argument uses the center of the open subgroup generated by U and g. No automatic triviality of the geometric-group action is claimed.

**Source.** [SS] Proposition 2.4(c) and proof, p. 825. Triviality of the structure-class stabilizer follows by centralizing an open arithmetic image.

**Planet:** Arithmetic orbit bijection.

### Outer fundamental-group map

**Target:** `EtaleHomotopyTypes:EH.4/outer-map-factorization` (theorem).

Under arithmetic-pointed-lift’s hypotheses and strongly center-free G_k, applying π_1 to a pointed relative class and quotienting by target geometric conjugation yields a basepoint-independent map from unpointed relative homotopy classes to Hom_out,Gk(π_1^et(X),π_1^et(Y)). Here π_1^et(X) may first be a raw pro-group; because the target is profinite each map factors uniquely through X’s finite-étale profinite completion. This map agrees with the usual outer arithmetic homomorphism of a scheme map.

**Hypotheses and conventions:** X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch. Geometric basepoints are chosen over one separably closed extension, as in arithmetic-pointed-lift. Every open subgroup of the absolute Galois group G_k has trivial center.

**Direct inputs:** `EtaleHomotopyTypes:EH.4/geometric-orbits-bijection`, `EtaleHomotopyTypes:EH.2/path-transport`, `EtaleHomotopyTypes:EH.3/fundamental-group-comparison`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Construction or proof.**

1. Use the native Pro(Grp) functor and the profinite-completion universal property imported from IG.0/IG.1.
2. Path transport acts on the group homomorphism by conjugation by precisely the geometric target group. The supplier’s outer Hom quotient therefore receives a well-defined orbit map.
3. Apply the arithmetic orbit bijection. Compare scheme morphisms before taking either quotient, and use the usual geometric-basepoint path torsors for independence.

**Check.** For X=Spec k and a rational point of Y this gives its arithmetic section up to geometric conjugation. It does not give an arbitrary chosen section homomorphism from the unpointed class.

**Source.** [SS] Corollary 2.5 and preceding definitions, p. 826. The conjugation action on π_1 is compatible with geometric monodromy, so the map descends through the same orbit quotient.

**Planet:** Outer fundamental-group map.

### Open-image orbit bijection

**Target:** `EtaleHomotopyTypes:EH.4/open-image-orbits` (theorem).

Under arithmetic-pointed-lift’s hypotheses and strongly center-free G_k, the arithmetic orbit bijection restricts to pointed relative classes inducing homomorphisms with open image, modulo π_1(Y_kbar), and unpointed π_1-open relative classes. Openness is tested in the target profinite topology after the finite-étale completion of the source.

**Hypotheses and conventions:** X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch. Geometric basepoints are chosen over one separably closed extension, as in arithmetic-pointed-lift. Every open subgroup of the absolute Galois group G_k has trivial center.

**Direct inputs:** `EtaleHomotopyTypes:EH.4/geometric-orbits-bijection`, `EtaleHomotopyTypes:EH.4/outer-map-factorization`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Construction or proof.**

1. The supplier’s continuous conjugation automorphisms preserve open subgroups. Hence π_1-openness is constant on every geometric orbit.
2. Restrict the established bijection to that invariant predicate. Its definition agrees on the unpointed side by outer-map-factorization.

**Check.** A surjective fundamental-group map is open. The trivial image in an infinite profinite target need not be open; no set-theoretic image test suffices.

**Source.** [SS] Corollary 2.6, p. 826. Conjugation preserves open images, so the orbit bijection restricts to this invariant subset.

### Maps into products of étale K(pi,1) varieties

**Target:** `EtaleHomotopyTypes:EH.4/aspherical-product-maps` (theorem).

Let k have characteristic zero and strongly center-free G_k. Let Y_1,Y_2 be geometrically connected, geometrically unibranch k-varieties whose raw higher étale homotopy pro-groups vanish. For every k-variety X, projections give a bijection Hom_Ho(Pro(SSet))↓Et(k)(Et(X),Et(Y_1×_kY_2))≅Hom(Et(X),Et(Y_1))×Hom(Et(X),Et(Y_2)).

**Hypotheses and conventions:** The field k has characteristic zero and every open subgroup of G_k has trivial center. Y_1 and Y_2 are geometrically connected and geometrically unibranch, with vanishing raw higher étale homotopy pro-groups. X is any finite-type k-variety; its connected components are treated separately.

**Direct inputs:** `EtaleHomotopyTypes:EH.4/geometric-orbits-bijection`, `EtaleHomotopyTypes:EH.1/classifying-representability`, `AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison`, `AnabelianGeometryAndNonabelianChabauty:NC.0/products`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Construction or proof.**

1. Reduce X to its finitely many connected components. Import NC.0’s characteristic-zero K(pi,1) product theorem and its raw/cohomological bridge.
2. Use IG.1’s characteristic-zero product formula π_1(Y_1×Y_2)=π_1(Y_1)×_Gkπ_1(Y_2). EH.1’s full faithfulness for B gives the pointed relative Hom product.
3. The geometric target group is the product of the two geometric groups. The product action quotient is the product of orbit quotients; apply the arithmetic orbit bijections.

**Check.** Use two hyperbolic smooth curves supplied by NC.0. The source X need not itself be K(pi,1), and the target hypothesis cannot be replaced with vanishing of H¹ alone.

**Source.** [SS] Lemma 2.9 and proof, pp. 828–829. Uses raw asphericity of the product, the arithmetic fundamental-group fiber product, and the product geometric-conjugation action.

**Planet:** Maps into K(pi,1) products.

## EH.5. Betti realization and analytic descent

Resolve analytification identity G6/R10 and topological local-section/descent interfaces; verify algebraic evaluation gluing on that carrier.

### Algebraic evaluation of singular simplices

**Target:** `EtaleHomotopyTypes:EH.5/evaluation-representability` (theorem).

For compact Hausdorff T put C(T,C) for the existing complex algebra of continuous functions, with the ordinary Euclidean topology on C. For a quasi-projective complex scheme X, evaluation T→Spec(C(T,C))(C) induces a natural bijection Hom_C(Spec C(T,C),X)≅C(T,X(C)_an). It is natural in continuous maps of T and in algebraic maps of X. In particular T=Δⁿ identifies the algebraic formula for singular n-simplices with Mathlib’s native singular simplices, including its universe lift.

**Hypotheses and conventions:** T is compact Hausdorff. X is quasi-projective over C, with the analytic topology supplied by ComplexComparison.

**Direct inputs:** `mathlib:ContinuousMap.evalAlgHom`, `mathlib:ContinuousMap.compRightAlgHom`, `mathlib:TopCat.toSSetObjEquiv`, `ComplexComparisonPartII:C0/repair-analytification`.

**Construction or proof.**

1. For affine X the bijection is the ordinary algebra-homomorphism/point correspondence, with its coordinatewise continuity.
2. For general quasi-projective X choose a finite partition of unity on T subordinate to the inverse images of an affine cover. Use supports to extend suitable coordinate products by zero and obtain maps on distinguished opens of Spec C(T,C).
3. Glue the scheme maps and verify uniqueness on the distinguished cover. The support/denominator argument must justify each extension; treating an arbitrary unbounded continuous function times a partition function as automatically continuous at the boundary is not enough.
4. Precomposition of continuous functions commutes with evaluation. The imported analytification carrier and its affine coordinate tests identify the native singular set.

**Check.** For X=A¹_C the bijection is exactly C(T,C). For T=* it is the usual complex point set. For X=Spec(C[ε]/ε²), every evaluation sends ε to zero; the statement introduces no replacement analytic carrier.

**Source.** [FGV] Lemma A.7 and proof, p. 306; Definition A.8, p. 307. Affine evaluation and a finite partition-of-unity gluing recover the analytic singular-simplex functor.

**Planet:** Algebraic singular-simplex evaluation.

### Betti realization of simplicial varieties

**Target:** `EtaleHomotopyTypes:EH.5/betti-diagonal` (construction).

For a simplicial quasi-projective complex scheme X_•, define Sing_an(X_•)=diag([a],[b])↦Sing_b(X_a(C)_an). Equivalently its n-simplices are X_n(C(Δⁿ,C)). Define D(X_•)_n=X_n(C), with discrete complex points in the second direction; constant singular simplices give D(X_•)→Sing_an(X_•). On a constant scheme this is exactly the existing singular functor on its analytification.

**Hypotheses and conventions:** Quasi-projective complex schemes, degreewise for simplicial schemes; compact Hausdorff test spaces and smoothness where stated.

**Direct inputs:** `EtaleHomotopyTypes:EH.5/evaluation-representability`, `mathlib:TopCat.toSSet`, `mathlib:TopCat.toSSetObjEquiv`, `mathlib:TopCat.toSSetIsoConst`, `ComplexComparisonPartII:C0/repair-analytification`, `mathlib:CategoryTheory.Functor.diag`, `mathlib:CategoryTheory.Functor.uncurry`.

**Construction or proof.**

1. Compose the given simplicial analytic space with Mathlib’s singular functor and precompose with the simplex diagonal. No new singular-simplex definition is needed.
2. Use algebraic evaluation degreewise to identify the diagonal with X_n(C(Δⁿ,C)); check both faces and degeneracies, since both indices move.
3. Constant simplices define the natural map from the diagonal discrete-point object.

**API.**

- `bettiDiagonal_constant` (compatibility): For cX, the diagonal realization is naturally isomorphic to TopCat.toSSet(X_an).
- `bettiDiagonal_map` (functoriality): A map of simplicial analytic spaces gives a simplicial map, preserving identity and composition.
- `bettiDiagonal_evaluation` (characterisation): Its n-simplices identify with X_n(C(Δⁿ,C)) with the diagonal simplicial operators.
- `discretePoints_to_betti` (compatibility): The natural point map sends a complex point in degree n to the constant singular n-simplex in X_n.

**Discriminating tests.**

- `affine_line_betti` (computation): For constant A¹_C the result is weakly contractible; its discrete points object has one component for each complex number.
- `simplicial_BCp_betti` (computation): For the simplicial finite constant scheme BC_p over C, the diagonal is BC_p, not a point.
- `constant_native` (compatibility): For a constant quasi-projective scheme X the natural isomorphism agrees degreewise with Mathlib’s native singular simplices; for a finite reduced scheme it agrees with the native constant-set comparison.

**Consumers.** EH.6 comparison zigzag: Is the analytic endpoint and receives the more functorial discrete points. FGV Appendix A.3: Consumes the diagonal on a simplicial atlas; the A_g-specific identification remains in its existing owner.

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [FGV] Definition A.8 and preceding identity, p. 307; properties (i)–(ii), p. 305. The diagonal synchronizes the scheme and singular directions; the discrete point functor retains the simplicial scheme direction.

**Planet:** Betti diagonal realization.

### Betti descent for smooth surjections

**Target:** `EtaleHomotopyTypes:EH.5/smooth-cech-descent` (theorem).

For a smooth surjection U→V of smooth quasi-projective complex varieties, let U_n=U×_V⋯×_V U with n+1 factors. Then Sing_an(U_•)→Sing_an(V) is a weak equivalence. More generally the comparison zigzag uses analytic descent for étale hypercovers of complex varieties, including singular varieties; this second assertion uses local analytic homeomorphisms and the imported topological hypercover theorem, not a manifold assertion for singular V.

**Hypotheses and conventions:** Quasi-projective complex schemes, degreewise for simplicial schemes; compact Hausdorff test spaces and smoothness where stated.

**Direct inputs:** `EtaleHomotopyTypes:EH.5/betti-diagonal`, `EnhancedDerivedSheaves:E2`, `ComplexComparisonPartII:C0/repair-analytification`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Construction or proof.**

1. For smooth U,V, analytification is a surjective submersion, so the differential-geometric local-section theorem supplies local sections.
2. The Čech nerve of a map with local sections is a topological hypercover. Apply the E2 realization theorem, then the native singular/realization comparison.
3. For an étale hypercover, use that analytic étale maps are local homeomorphisms. Apply the same E2 theorem degreewise and the bisimplicial diagonal weak-equivalence theorem.

**Check.** For the identity cover the augmentation is an equivalence. For a surjection of sets with inappropriate topologies local sections are not automatic. The source’s claim that arbitrary smooth-surjection source and target are smooth manifolds requires the smoothness hypothesis stated here.

**Source.** [FGV] Example A.10, p. 311; Appendix A.2.3, pp. 309–310. The smooth-surjection case uses submersion local sections; the étale-hypercover case is the one needed for the comparison zigzag.

**Planet:** Smooth Čech descent.

## EH.6. p-completion and Betti–étale comparison

Integrate E0’s homotopy-coherent framework and BHH adapter; discharge strictification G7 and inherited coefficient/analytic gaps; verify graded consumer hypotheses.

### p-finite spaces

**Target:** `EtaleHomotopyTypes:EH.6/p-finite-space` (definition).

For a prime p, a space is p-finite when π_0 is finite and for every basepoint its positive homotopy groups are finite p-groups and vanish above a uniform finite degree. Regard these as homotopy types, or Kan representatives closed under equivalence. Write Sp_p-fin for their essentially small category and Pro(Sp_p-fin) for its homotopy-coherent pro-category. Arbitrary finite π_1 is not allowed unless it is a p-group; degreewise finiteness of a simplicial model is neither the definition nor a replacement for truncation.

**Hypotheses and conventions:** A fixed prime p, declared universe bounds, and the individual finite-type or specified-grading hypotheses; no unrestricted infinite-coproduct preservation.

**Direct inputs:** `EtaleHomotopyTypes:EH.0/pro-space-homotopy-data`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations`, `EnhancedDerivedSheaves:E0`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`.

**Construction or proof.**

1. Use the imported ordinary homotopy groups and truncations to define the full subcategory.
2. Take a small skeleton in the declared universe. Retain all finite component sets, and compare Kan representatives through the homotopy-coherent localization requested from E0.
3. Prove finite homotopy-limit closure and use finite Postnikov decompositions with finite p-group actions.

**API.**

- `pFinite_equivalence` (compatibility): The predicate is invariant under weak homotopy equivalence.
- `pFinite_finiteLimits` (structure): The terminal space and finite homotopy limits of p-finite spaces are p-finite.
- `pFinite_EM` (constructor): K(A,n) is p-finite for a finite abelian p-group A and n≥1; B P is p-finite for a finite p-group P.
- `pFinite_components` (projection): Every component has the finite p-group and truncation properties, with one common bound for the finite component set.

**Discriminating tests.**

- `finite_discrete` (degenerate): Every finite discrete set, including the empty set and a two-element set, is p-finite.
- `finite_group_order` (non-example): BC_p is p-finite, whereas BC_q is not p-finite for a different prime q.
- `unbounded_EM` (non-example): The product of K(F_p,n) over n≥1 has finite homotopy groups in each degree but is not p-finite, because no truncation bound exists.

**Consumers.** EH.6 p-profinite completion: Defines the target finite test category. FGV A.2.2: Prevents substitution of simplicial-degree finiteness for homotopy finiteness.

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [FGV] Appendix A.2.2, p. 307, definition before (A.9). Uses finite components, finite p-group homotopy and an eventual truncation bound. [BHH] Definition 7.3.1 and Propositions 7.3.4–7.3.6, pp. 68–70. Identifies the finite test category and its finite homotopy-limit closure.

**Planet:** p-finite spaces.

### p-profinite completion

**Target:** `EtaleHomotopyTypes:EH.6/p-profinite-completion` (construction).

For a pro-space X, construct X^∧_p in Pro(Sp_p-fin) with a unit X→X^∧_p, characterized by equivalences of derived mapping spaces Map(X^∧_p,K)≃Map(X,K) for every p-finite K. Extend this to all p-profinite targets by their limit formula. On a small cofiltered representative, maps to a constant K are the filtered colimit of derived level mapping spaces. In particular the unit preserves continuous F_p cohomology in every degree. Completion is not materialization and is not defined as levelwise group completion alone.

**Hypotheses and conventions:** A fixed prime p, declared universe bounds, and the individual finite-type or specified-grading hypotheses; no unrestricted infinite-coproduct preservation.

**Direct inputs:** `EtaleHomotopyTypes:EH.6/p-finite-space`, `EtaleHomotopyTypes:EH.0/isaksen-model`, `DiamondsAndVStacks:D0`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `EnhancedDerivedSheaves:E0`.

**Construction or proof.**

1. Use the strict model on Pro(SSet) for this localization. Take the BHH finite test set K_p: finite discrete spaces, BC_p and K(C_p,n) for n≥2.
2. Apply IC’s test-object localization and its nilpotent fibrant characterization; BHH’s finite-limit closure comparison identifies the result with a system of p-finite types. The model/infinity-category adapter is the separate next target.
3. The mapping-space unit is the localization universal property; K(F_p,n) gives continuous cohomology preservation. This construction is applied to the raw representative of Et, without equating strict and Isaksen weak equivalences.

**API.**

- `pCompletion_unit` (constructor): The unit is natural in X in the homotopy-coherent sense.
- `pCompletion_mapping` (universal-property): Precomposition with the unit is an equivalence of derived mapping spaces to every p-profinite target.
- `pCompletion_idempotent` (characterisation): Completing a p-profinite type again is canonically equivalent to it.
- `pCompletion_cohomology` (compatibility): Continuous cohomology with F_p coefficients agrees through the unit in all degrees.

**Discriminating tests.**

- `pFinite_fixed` (computation): For X=BC_p or any finite discrete set, completion agrees with that constant p-finite type.
- `prime_to_p_group` (computation): For q≠p, the p-profinite completion of BC_q is contractible; mod-p acyclicity here is used together with its finite prime-to-p group structure.
- `infinite_set_completion` (non-example): The p-profinite completion of an infinite discrete set is its pro-finite-set completion, not the constant infinite discrete set and not a single connected point.

**Consumers.** EH.6 étale p-realization: Separates preservation of continuous cohomology from the materialization comparison. FGV A.2.2: Supplies the middle arrow of (A.9).

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [IC] Theorem 2.2, pp. 4–5; Definition 3.1 and Theorem 3.3, pp. 5–6. Localizes strict pro-spaces using mapping spaces to a set of fibrant test spaces, with essentially levelwise test-nilpotent fibrant objects. [BHH] §7.3, Proposition 7.3.6 and Corollary 7.3.8, pp. 70–71. The test localization has underlying infinity-category Pro(Sp_p-fin). [FGV] Appendix A.2.2, pp. 308–309. The unit preserves continuous mod-p cohomology before the homotopy limit is taken.

**Planet:** p-profinite completion.

### Model for homotopy-coherent p-profinite types

**Target:** `EtaleHomotopyTypes:EH.6/p-model-comparison` (comparison).

The underlying infinity-category of the K_p-localized strict model of Pro(SSet) is equivalent to Pro(Sp_p-fin). Under this equivalence the derived constant/limit adjunction identifies its materialization with the ordinary homotopy limit of a strict fibrant representative. Thus Lurie’s finite-type comparison can be applied to the completion constructed above. This assertion does not identify the strict model with the Isaksen homotopy-pro-group model.

**Hypotheses and conventions:** A fixed prime p, declared universe bounds, and the individual finite-type or specified-grading hypotheses; no unrestricted infinite-coproduct preservation.

**Direct inputs:** `EtaleHomotopyTypes:EH.6/p-profinite-completion`, `EtaleHomotopyTypes:EH.2/materialization`, `EnhancedDerivedSheaves:E0`, `DiamondsAndVStacks:D0`.

**Construction or proof.**

1. Apply the general comparison of a localized strict pro-model with the infinity-pro-category of its finite test closure.
2. Use BHH’s p-finite closure theorem. Compare the constant functors on the common finite types; uniqueness of right adjoints identifies derived limit with materialization.
3. Record the exact native infinity-category and universe interface as supplier contract R4; the absence of an implementation is not evidence that ordinary Pro(Ho(SSet)) suffices.

**Check.** The comparison must preserve derived mapping spaces and the constant/limit adjunction, not only π_0 of Hom. A bare equivalence with Pro(Ho(SSet)) fails this acceptance test.

**Source.** [BHH] Theorem 7.1.2, pp. 62–64; Corollary 7.3.8, pp. 70–71. Identifies the localized pro-model with the homotopy-coherent pro-category of p-finite spaces.

### Materialized p-completed étale type

**Target:** `EtaleHomotopyTypes:EH.6/etale-p-realization` (construction).

For degreewise locally noetherian simplicial X, put Et_p(X)=Mat(Et(X)^∧_p), an ordinary homotopy type represented by a simplicial set. The projections and completion unit give a canonical map H^m_et(X,F_p)→H^m(Et_p(X),F_p). This map is not asserted to be an isomorphism for arbitrary X. The scheme-functorial construction is a functor of homotopy-coherent types; a strictly functorial chosen simplicial-set model is the separate strictification obligation G7.

**Hypotheses and conventions:** A fixed prime p, declared universe bounds, and the individual finite-type or specified-grading hypotheses; no unrestricted infinite-coproduct preservation.

**Direct inputs:** `EtaleHomotopyTypes:EH.3/etale-type`, `EtaleHomotopyTypes:EH.3/etale-cohomology`, `EtaleHomotopyTypes:EH.6/p-model-comparison`, `EtaleHomotopyTypes:EH.2/materialization`.

**Construction or proof.**

1. Apply the completion to the actual rigid inverse system and choose a strict fibrant p-finite presentation through the model comparison.
2. Take the derived limit, using the existing native simplicial-set carrier.
3. Pull cohomology classes along all limit projections, and use continuous cohomology preservation to obtain the displayed map. Keep strictification G7 explicit for a chosen point-set functor.

**API.**

- `etaleP_map` (functoriality): Maps of simplicial schemes induce maps of the materialized p-types coherently with identity and composition.
- `etaleP_cohomology_map` (constructor): The canonical cohomology comparison is induced by the completion unit and limit projections.
- `etaleP_constant_field` (example): For separably closed k, Et_p(Spec k) is contractible.
- `etaleP_finite_type` (compatibility): Under the finite-type hypotheses of the next theorem, the displayed map is an isomorphism in every degree.

**Discriminating tests.**

- `closed_field` (degenerate): Over C the p-realization of Spec C is a point.
- `BCp_realization` (computation): For the simplicial C-scheme BC_p, Et_p is BC_p, with H¹=F_p. The sufficient H¹=0 criterion is not a necessary condition for every individual comparison.
- `infinite_discrete_failure` (non-example): For an infinite disjoint union of Spec C, H⁰_et consists of all F_p-valued functions on the component set. Raw materialization of the pro-finite-set completion has additional ultrafilter components, so its H⁰ need not coincide. Completion/materialization cannot silently commute with this infinite coproduct.

**Consumers.** FGV A.2.2: Is the ordinary simplicial-set endpoint of the p-adic comparison. EH.6 graded construction: Repairs the unqualified use on infinite component families.

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [FGV] Appendix A.2.2, (A.9), pp. 307–309. Defines the composite raw type, p-profinite completion and homotopy limit, with an explicit warning about cohomology of the last step.

**Planet:** p-completed étale realization.

### Finite-type materialization comparison

**Target:** `EtaleHomotopyTypes:EH.6/finite-type-cohomology` (theorem).

For a p-profinite space P, assume H⁰_cont(P,F_p)=F_p via the unit, H¹_cont(P,F_p)=0, and every H^m_cont(P,F_p) is finite-dimensional. Then P is simply connected of finite type in Lurie’s sense: all its higher homotopy pro-p groups are topologically finitely generated. The projection map H^m_cont(P,F_p)→H^m(Mat(P),F_p) is an isomorphism for every m. Consequently Et_p(X) computes mod-p étale cohomology whenever X has these cohomological properties. A finite number of components is handled one connected component at a time.

**Hypotheses and conventions:** A fixed prime p, declared universe bounds, and the individual finite-type or specified-grading hypotheses; no unrestricted infinite-coproduct preservation.

**Direct inputs:** `EtaleHomotopyTypes:EH.6/p-model-comparison`, `EtaleHomotopyTypes:EH.6/etale-p-realization`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations`, `EnhancedDerivedSheaves:E0`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets`.

**Construction or proof.**

1. Use the homotopy-coherent adapter to view the completed rigid object as Lurie’s p-profinite P.
2. Apply Corollary 3.4.10 and Theorem 3.4.12 to obtain simple connectivity and finite type; apply Proposition 3.3.8 to the canonical projection-induced map.
3. For finite components, completion preserves the finite component decomposition and the limit splits accordingly. Apply the connected assertion componentwise.

**Check.** A countable discrete scheme fails the H⁰ hypothesis. A smooth proper positive-genus curve has nonzero H¹, so this criterion alone proves no materialized comparison for that curve; its raw K(pi,1) theorem remains available. B(C_p) shows the stated conditions are sufficient rather than necessary.

**Source.** [DAG13] Definition 3.3.2 and Proposition 3.3.8, pp. 82–86; Corollary 3.4.10 and Theorem 3.4.12, pp. 91–93. The exact finite-type criterion includes connected H⁰, vanishing H¹ and degreewise finite cohomology. [FGV] Appendix A.2.2, p. 309. The materialization step is justified only after its cohomological finiteness conditions are supplied; the theorem-number repair is recorded in E4.

**Planet:** Finite-type materialization theorem.

### Componentwise p-completed realization

**Target:** `EtaleHomotopyTypes:EH.6/graded-etale-p` (construction).

Given a specified decomposition X_•=∐_{a∈A}X_•,a by open-and-closed simplicial subschemes preserved by every face and degeneracy, define Et_p^gr(X)=∐_a Et_p(X_a). Maps carry each specified summand into a specified target summand, together with the induced map of grading sets. If each summand has H⁰_et=F_p, H¹_et=0 and degreewise finite-dimensional mod-p cohomology, its comparison is an isomorphism, and the graded coproduct computes the full componentwise cohomology, with products over A in cohomology. This is a construction on specified graded objects and does not assert such a decomposition exists functorially for every simplicial scheme.

**Hypotheses and conventions:** A fixed prime p, declared universe bounds, and the individual finite-type or specified-grading hypotheses; no unrestricted infinite-coproduct preservation.

**Direct inputs:** `EtaleHomotopyTypes:EH.6/finite-type-cohomology`, `EtaleHomotopyTypes:EH.6/etale-p-realization`, `EtaleHomotopyTypes:EH.3/etale-type`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Construction or proof.**

1. Apply raw completion and materialization separately on each supplied simplicial summand. Form the ordinary coproduct only at the end.
2. Functoriality uses the actual map on grading sets and each component map; it cannot be reconstructed from an arbitrary decomposition of each X_n independently.
3. The cochain complex of a coproduct is the product of the component cochain complexes. Exactness of products of vector spaces gives the cohomology assertion.

**API.**

- `gradedEtaleP_summand` (projection): The a-summand is canonically Et_p(X_a).
- `gradedEtaleP_map` (functoriality): A map preserving the given grading induces a map of the coproduct realizations.
- `gradedEtaleP_cohomology` (characterisation): Its mod-p cohomology is the product of the component cohomologies in each degree.
- `gradedEtaleP_finite_grading` (compatibility): For finite A it agrees, up to canonical equivalence, with raw Et_p on the corresponding finite disjoint union.

**Discriminating tests.**

- `infinite_points_repaired` (computation): For X=∐_{a∈N}Spec C with its displayed grading, Et_p^gr(X) is the ordinary discrete N and H⁰ is F_p^N.
- `one_grade` (compatibility): For a single specified grade the construction agrees with raw Et_p; for no grades it is empty.
- `unstable_grade_rejected` (non-example): A separate partition of each X_n that a face merges or a degeneracy fails to preserve is not an input grading and cannot be used to form this functor.

**Consumers.** FGV Appendix A.4–A.5: Treats genus-graded disjoint unions without applying a connected finite-type theorem to the union. EH.6 comparison: Allows comparison for arbitrarily many grades under the hypotheses on each grade.

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [FGV] Appendix A.2.2–A.2.3, pp. 307–310; graded applications in A.4–A.5, pp. 312–315. The consumer uses a prescribed genus grading; applying the connected comparison to each grade avoids a false infinite-coproduct preservation assertion.

### Betti–étale comparison zigzag

**Target:** `EtaleHomotopyTypes:EH.6/comparison-zigzag` (construction).

For a simplicial quasi-projective C-scheme X and its rigid hypercovers U, set Z_X=holim_U Sing_an(U), where the analytic realization of U uses the diagonal of all its simplicial directions. There is a natural zigzag Sing_an(X)←Z_X→Et_p(X); the left arrow is a weak equivalence. The right arrow is induced by the component map of every connected singular simplex and the completion unit. For a specified grading use the coproduct of these zigzags on the grades. The resulting homotopy-category map is independent of cofinal refinements.

**Hypotheses and conventions:** A fixed prime p, declared universe bounds, and the individual finite-type or specified-grading hypotheses; no unrestricted infinite-coproduct preservation.

**Direct inputs:** `EtaleHomotopyTypes:EH.5/betti-diagonal`, `EtaleHomotopyTypes:EH.5/smooth-cech-descent`, `EtaleHomotopyTypes:EH.3/rigid-hypercover`, `EtaleHomotopyTypes:EH.6/etale-p-realization`, `EtaleHomotopyTypes:EH.2/materialization`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Construction or proof.**

1. A singular simplex is connected, so its image lies in one connected component of U_a,b. These assignments commute with all face and degeneracy maps and give maps to diag π_0 U.
2. Analytic étale hypercover descent gives Sing_an(U)→Sing_an(X) as a weak equivalence. The nerve of the nonempty cofiltered rigid index is contractible, so the homotopy limit of this objectwise weak equivalence to the constant diagram still maps by equivalence to Sing_an(X).
3. Compose the compatible component maps with the completion unit and apply derived limit. Use homotopy-coherent functoriality to obtain the zigzag independently of cofinal refinement; G7 records the stronger strictly chosen point-set version.

**API.**

- `comparison_left_equivalence` (characterisation): The left arrow of the zigzag is a weak equivalence.
- `comparison_refinement` (compatibility): Cofinal rigid refinement gives the same comparison morphism in the homotopy category.
- `comparison_scheme_map` (functoriality): Comparison commutes with algebraic maps of simplicial schemes over C.
- `comparison_discrete_points` (compatibility): The composite from discrete complex points has the algebraic field-automorphism naturality stated in the final theorem.

**Discriminating tests.**

- `point_zigzag` (degenerate): For Spec C all three homotopy types and both maps are contractible equivalences.
- `finite_etale_naturality` (compatibility): For a finite disjoint union of Spec C the zigzag preserves every labeled point and every permutation.
- `simplicial_not_degree_zero` (non-example): For the simplicial scheme BC_p it yields BC_p at both endpoints and the expected identity comparison, rather than the point X_0.

**Consumers.** EH.6 cohomological comparison: Supplies the map to which the finite-type theorem applies. FGV diagram (A.6): Connects discrete points, analytic Betti realization and p-completed étale realization.

**Check.** The hypotheses and the indicated canonical map are retained under every use.

**Source.** [FGV] Appendix A.2.3, pp. 309–310. Uses a compatible hypercover family of analytic-to-component maps and then a homotopy limit, rather than a nonexistent direct canonical lift into every cover.

**Planet:** Betti–étale comparison zigzag.

### Mod-p Betti–étale comparison

**Target:** `EtaleHomotopyTypes:EH.6/betti-etale-cohomology` (comparison).

For simplicial quasi-projective X over C, assume H⁰_et(X,F_p)=F_p, H¹_et(X,F_p)=0 and degreewise finite-dimensional mod-p étale cohomology. Then the comparison zigzag induces an isomorphism on mod-p cohomology and homology in every degree. The statement also holds for a specified open-and-closed simplicial grading with these hypotheses on each grade, using Et_p^gr. Finite constant-coefficient Artin comparison and the analytic sheaf/singular comparison are the existing suppliers; no unrestricted infinite-coefficient analytic comparison is used.

**Hypotheses and conventions:** A fixed prime p, declared universe bounds, and the individual finite-type or specified-grading hypotheses; no unrestricted infinite-coproduct preservation.

**Direct inputs:** `EtaleHomotopyTypes:EH.6/comparison-zigzag`, `EtaleHomotopyTypes:EH.6/finite-type-cohomology`, `EtaleHomotopyTypes:EH.6/graded-etale-p`, `InverseGaloisAndArithmeticFundamentalGroups:IG.3/finite-coefficient-comparison`, `ComplexComparisonPartII:C5/repair-sheaf-singular-comparison`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`.

**Construction or proof.**

1. Apply the existing finite-coefficient Artin comparison degreewise, then bounded-below descent/first-quadrant totalization to the simplicial scheme.
2. Use the supplier’s paracompact semilocally contractible analytic sheaf/singular comparison; check that the induced cohomology map is precisely that from the hypercover component maps, not merely an abstract group isomorphism.
3. Apply the finite-type materialization theorem to identify the other endpoint. Over the field F_p, natural universal coefficients turn a cohomology isomorphism into a homology isomorphism. For the grading apply this on each grade, using direct sums in homology and products in cohomology.

**Check.** For projective space over C the hypothesis H¹=0 and finite-dimensionality hold; this gives the familiar mod-p comparison, not a weak equivalence of its integral Betti type with a p-completed type. For an infinite discrete union use the graded construction explicitly.

**Source.** [FGV] Appendix A.2.3, pp. 309–310; property (iii), p. 305. Combines Artin comparison, analytic local-contractibility comparison and the finite-type materialization condition.

### Field-automorphism naturality of discrete points

**Target:** `EtaleHomotopyTypes:EH.6/automorphism-naturality` (theorem).

For any σ∈Aut(C) and a σ-semilinear morphism f:X→X′ of simplicial quasi-projective C-schemes, the composite D(X)→Et_p(X) from the comparison zigzag is natural after twisting by σ, as a map of homotopy types. The same holds on specified gradings carried by f. The intervening Sing_an map is required only for continuous σ, namely identity and complex conjugation. For a simplicial scheme over Q this gives an Aut(C)-action on its p-realization in the homotopy-coherent sense and equivariance of its discrete-point map. Strict point-set action and functorial chosen models are G7, not an implementation claim.

**Hypotheses and conventions:** A fixed prime p, declared universe bounds, and the individual finite-type or specified-grading hypotheses; no unrestricted infinite-coproduct preservation.

**Direct inputs:** `EtaleHomotopyTypes:EH.6/comparison-zigzag`, `EtaleHomotopyTypes:EH.5/evaluation-representability`, `EtaleHomotopyTypes:EH.3/rigid-cover`, `EtaleHomotopyTypes:EH.6/p-model-comparison`, `ComplexComparisonPartII:C0/repair-analytification`, `EnhancedDerivedSheaves:E0`.

**Construction or proof.**

1. Semilinear base change sends rigid covers and their specified geometric lifts to rigid covers, and gives coherent maps of raw étale types. Completion and materialization preserve that coherent functoriality.
2. Define the point-to-étale map directly by the algebraic lifts of complex points to the rigid system; prove its equality with the composite comparison. This avoids needing an analytic map for a discontinuous automorphism.
3. For identity and conjugation, evaluation of continuous functions supplies the analytic semilinear comparison as well. For a Q-model use its descent identifications and their cocycle law to obtain the coherent group action. Reading/proving the stronger functorial strictification remains G7.

**Check.** Conjugation acts continuously on A¹(C). A discontinuous field automorphism still acts on its discrete complex points and raw étale data, but does not define an analytic self-map. A statement making every σ act continuously on Sing_an(A¹) fails this test.

**Source.** [FGV] Properties (i)–(ii), p. 305; Appendix A.2.2–A.2.3, pp. 308–310; application to (6.2), pp. 259–260. The algebraic point-to-étale composite is natural for all field automorphisms; the analytic middle term only has continuous semilinear naturality.

## Supplier contracts

These are mathematical inputs with their original owners. An open contract does not assert that a supplier has implemented it.

### R1. DiamondsAndVStacks:D0

Supply the universe-polymorphic Pro(C)=Ind(Cᵒᵖ)ᵒᵖ carrier for small cofiltered simplicial diagrams; cofinite directed reindexing with finite predecessor sets; level representations of finite diagrams and monomorphisms, cofinal refinement, and rigid geometric-point size/choice comparison. Extend the existing D0 node rather than introducing another generic Pro category.

Home: DiamondsAndVStacks:D0. Consumers: `EtaleHomotopyTypes:EH.0/isaksen-model`, `EtaleHomotopyTypes:EH.1/subgroup-covering`, `EtaleHomotopyTypes:EH.1/covering-fibration`, `EtaleHomotopyTypes:EH.1/pro-classifying-space`, `EtaleHomotopyTypes:EH.2/materialization`, `EtaleHomotopyTypes:EH.2/profinite-derived-limits`, `EtaleHomotopyTypes:EH.3/rigid-cover`, `EtaleHomotopyTypes:EH.3/rigid-hypercover`, `EtaleHomotopyTypes:EH.6/p-profinite-completion`, `EtaleHomotopyTypes:EH.6/p-model-comparison`.

### R2. tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead

AlgebraicTopology, Part II: supply the proper simplicial Kan–Quillen model on native SSet; ordinary homotopy local systems and local-coefficient obstruction/Whitehead theory; functorial first and finite Postnikov truncations; simplicial covering classification compatible with existing topological universal covers; unstable Reedy homotopy limits, derived limits including nonabelian lim¹, and the exact connectivity/complete-convergence interface G2. Native Kan groups are already the existing Stage 8 direction and PR 42435, not a new EtaleHomotopyTypes target. For smooth Čech descent consume existing differential-geometric submersion/local-section results, supplying only any missing adapter.

Home: AlgebraicTopology, Part II. Consumers: `EtaleHomotopyTypes:EH.0/pro-space-homotopy-data`, `EtaleHomotopyTypes:EH.0/isaksen-model`, `EtaleHomotopyTypes:EH.0/properness`, `EtaleHomotopyTypes:EH.0/cohomological-detection`, `EtaleHomotopyTypes:EH.1/pro-covering`, `EtaleHomotopyTypes:EH.1/classifying-representability`, `EtaleHomotopyTypes:EH.2/materialization`, `EtaleHomotopyTypes:EH.2/profinite-derived-limits`, `EtaleHomotopyTypes:EH.2/profinite-holim-groups`, `EtaleHomotopyTypes:EH.2/relative-cylinder`, `EtaleHomotopyTypes:EH.3/elementary-fibration-sequence`, `EtaleHomotopyTypes:EH.5/smooth-cech-descent`, `EtaleHomotopyTypes:EH.6/p-finite-space`, `EtaleHomotopyTypes:EH.6/p-profinite-completion`, `EtaleHomotopyTypes:EH.6/finite-type-cohomology`, `EtaleHomotopyTypes:EH.6/comparison-zigzag`.

### R3. tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality

Supply native singular cohomology with all local coefficient systems, its derived mapping-space interpretation, cohomological homotopy invariance and coproduct cochains. This is the existing ordinary topology owner, not a new étale cohomology implementation.

Home: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality. Consumers: `EtaleHomotopyTypes:EH.0/pro-space-homotopy-data`, `EtaleHomotopyTypes:EH.0/cohomological-detection`, `EtaleHomotopyTypes:EH.1/cover-basechange-in-ho`, `EtaleHomotopyTypes:EH.3/etale-cohomology`, `EtaleHomotopyTypes:EH.6/graded-etale-p`.

### R4. EnhancedDerivedSheaves:E0

Supply homotopy-coherent localization, functor categories, derived mapping spaces, and homotopy-coherent Pro of an essentially small infinity-category, with size comparisons. The application of BHH to p-finite spaces is EH.6’s own target; E0 owns the general infinity-categorical framework. Do not replace this with ordinary Pro(Ho(SSet)).

Home: EnhancedDerivedSheaves, Part II. Consumers: `EtaleHomotopyTypes:EH.6/p-finite-space`, `EtaleHomotopyTypes:EH.6/p-profinite-completion`, `EtaleHomotopyTypes:EH.6/p-model-comparison`, `EtaleHomotopyTypes:EH.6/finite-type-cohomology`, `EtaleHomotopyTypes:EH.6/automorphism-naturality`.

### R5. tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations

Reuse profinite finite-quotient systems and their limits; import the already implemented compactness declarations TauCeti.exists_forall_map_eq_of_compact_t2 and TauCeti.exists_forall_map_eq_of_finite from current Tau Ceti, with explicit transport to native Pro representatives. Those declarations are newer than the pin and are not baseline claims. Add no inverse-system compactness target here.

Home: tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations. Consumers: `EtaleHomotopyTypes:EH.2/profinite-derived-limits`, `EtaleHomotopyTypes:EH.6/p-finite-space`, `EtaleHomotopyTypes:EH.6/finite-type-cohomology`.

### R6. InverseGaloisAndArithmeticFundamentalGroups:IG.0

Supply the geometric-point and finite-étale fiber-functor interface, profinite completion of raw Pro(Grp) with its universal property and correspondence of finite quotients. IG.0/etale-fundamental-group already owns the finite-étale group; EH.3 owns its comparison with raw étale homotopy.

Home: InverseGaloisAndArithmeticFundamentalGroups:IG.0. Consumers: `EtaleHomotopyTypes:EH.3/rigid-cover`.

### R7. InverseGaloisAndArithmeticFundamentalGroups:IG.1

Use IG.1/arithmetic-exact-sequence for geometrically connected targets. Extend the stage to the open arithmetic image for every connected finite-type k-variety; the characteristic-zero arithmetic product fiber-product formula; continuous outer Hom over G_k modulo geometric conjugation and its open-image predicate; and the strongly center-free predicate, importing actual field instances from NC.1 rather than reproving them. No pro-étale Noohi group is substituted.

Home: Inverse Galois and arithmetic fundamental groups, Part II. Consumers: `EtaleHomotopyTypes:EH.4/arithmetic-pointed-lift`, `EtaleHomotopyTypes:EH.4/geometric-orbits-surjection`, `EtaleHomotopyTypes:EH.4/geometric-orbits-bijection`, `EtaleHomotopyTypes:EH.4/outer-map-factorization`, `EtaleHomotopyTypes:EH.4/open-image-orbits`, `EtaleHomotopyTypes:EH.4/aspherical-product-maps`.

### R8. SchemeAndStackFoundations:SF.0

Supply connected open components of locally noetherian schemes, their size-controlled geometric points and separated étale matching fiber products; the elementary-fibration geometric input is a smooth proper geometrically connected curve family with finite étale boundary and nonempty affine complement fibers. The homotopy-fiber theorem belongs to EH.3; NC.0 consumes it.

Home: Scheme and stack foundations, Part II. Consumers: `EtaleHomotopyTypes:EH.3/rigid-cover`, `EtaleHomotopyTypes:EH.3/rigid-hypercover`, `EtaleHomotopyTypes:EH.3/elementary-fibration-sequence`.

### R9. StableHomotopyKTheory:H.1

Extend the existing discrete BG/EG and covering interfaces by the nerve fibration criterion for a surjective group homomorphism and its compatibility with translation-category quotients. This is discrete input to B*G; pro-classifying spaces remain EH.1.

Home: StableHomotopyKTheory:H.1. Consumers: `EtaleHomotopyTypes:EH.1/pro-classifying-space`.

### R10. ComplexComparisonPartII:C0/repair-analytification

Use the same complex analytic carrier and analytification functor as ComplexComparisonPartII:C0/repair-analytification. Its tracked upstream PR 196 is OPEN at 4bd72379658126cbe9be935656396f0c9dac4de0 on 2026-10-18; identify the accepted upstream layer when it lands. Require quasi-projective topology, finite fiber products, étale local homeomorphisms, and analytic realization of a smooth morphism between smooth schemes as a submersion. This is an integration contract, not another construction of analytification.

Home: ComplexComparisonPartII:C0/repair-analytification. Consumers: `EtaleHomotopyTypes:EH.5/evaluation-representability`, `EtaleHomotopyTypes:EH.5/betti-diagonal`, `EtaleHomotopyTypes:EH.5/smooth-cech-descent`, `EtaleHomotopyTypes:EH.6/automorphism-naturality`.

### R11. AnabelianGeometryAndNonabelianChabauty:NC.0

Keep the existing finite-coefficient K(pi,1) predicate, raw-homotopy-comparison, smooth-curve, products, elementary-fibration and artin-neighbourhood nodes in NC.0. Its current smooth-curve node is characteristic zero; add the broader raw smooth-connected any-field affine-or-positive-genus curve statement of Schmidt–Stix Lemma 2.7(a), p. 827, via Schmidt 1996 Proposition 15, preserving the characteristic-zero scope of the existing proof. Replace NC.0’s raw foundational gaps with EH.1/classifying-morphism and EH.3/fundamental-group-comparison, and its elementary homotopy-sequence gap with EH.3/elementary-fibration-sequence. The cohomological/raw equivalence itself remains NC.0’s obligation. The projection-family and strongly hyperbolic Artin-neighbourhood existence argument of Schmidt–Stix Lemma 6.3, pp. 847–849, belongs with the NC.0/NC.1 geometric applications, not the pro-space foundations. Its finite-type normal compactification, ample r-fold embedding with r≥2, generic linear projection and prescribed-point containment require the source-qualified SGA4 XI 3.3 supplier; this proof is not supplied by the K(pi,1) tower theorem itself.

Home: Anabelian geometry and nonabelian Chabauty, Part II. Consumers: `EtaleHomotopyTypes:EH.4/aspherical-product-maps`.

### R12. EnhancedDerivedSheaves:E2

Extend the generic hypercover input by topological hypercover realization for maps admitting local sections, analytic étale hypercovers, cofinal refinement and the levelwise-to-diagonal comparison for bisimplicial singular sets. Reuse E2/hypercover and E2/bounded-below-hypercover-descent for their existing definitions and sheaf comparison; those nodes alone are not a theorem about weak homotopy equivalences of topological realizations.

Home: EnhancedDerivedSheaves, Part II. Consumers: `EtaleHomotopyTypes:EH.5/smooth-cech-descent`.

### R13. tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation

Import existing Layer 3 pro-p groups and topological finite generation, using current TauCeti.IsTopologicallyFinitelyGenerated in Topology/Algebra/Group/Generation.lean. The native predicate means that a finite subset generates a dense subgroup. Transport that predicate to the profinite groups associated to homotopy pro-groups; do not define it again. This is a current-library integration request, not a declaration claimed at f790474.

Home: ProfiniteProPGroups, existing Layer 3 and current Tau Ceti generation API. Consumers: `EtaleHomotopyTypes:EH.6/p-finite-space`, `EtaleHomotopyTypes:EH.6/finite-type-cohomology`.

### R14. tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets

Import the existing Layer 4 compact Z_p-module and finitely generated abelian pro-p structure interface. Current TauCeti.IsProP.exists_continuousMulEquiv_pi_padicInt_prod_pi_zmod in Topology/Algebra/Group/Profinite/ProP/StructureTheorem.lean supplies the topological decomposition into finitely many Z_p and finite cyclic p-power factors for a compact totally disconnected abelian pro-p group with topological finite generation. Adapt it to higher homotopy groups when invoking DAG XIII Proposition 3.3.8; do not re-plan the group structure theorem or claim it at the pin.

Home: ProfiniteProPGroups, existing Layer 4 and current Tau Ceti abelian pro-p structure API. Consumers: `EtaleHomotopyTypes:EH.6/finite-type-cohomology`.

## Explicit proof and integration leaves

All seven layers have target-level prerequisite closure to native declarations, exact existing nodes, requested supplier stages, or one of these leaves. None is marked mathematically closed.

### G1. Corrected properness proof

I01 Proposition 17.1 needs its subsequent correction in Isaksen, Strict model structures for pro-categories, Remark 4.14, published Trans. AMS 356 (2004). The public initial arXiv strict-model version inspected does not contain that correction. Read the corrected argument or a complete primary replacement and verify right properness for the homotopy-pro-group model; strict properness alone does not prove it.

Needed by `EtaleHomotopyTypes:EH.0/properness`.

### G2. Unstable totalization convergence

Theorem A.8 invokes Bousfield–Kan XI 5.2 and XI 7.1 for the homotopy-limit spectral sequence, IX 5.1 for connectivity and IX 5.4 for complete convergence, including the nonabelian/pointed-set fringe. That book is not cleared in the maintainer library and was not obtained. Supply a public primary proof or a cleared reading of these precise inputs. Lemma A.7 plus a formally collapsed E₂ page does not discharge them.

Needed by `EtaleHomotopyTypes:EH.2/profinite-holim-groups`.

### G3. Arbitrary local-system étale comparison

IEt cites Friedlander Proposition 5.9 for the étale cohomology comparison. Neither that book nor Artin–Mazur is cleared in the private index. Read a public primary proof giving the full local-system coefficient range and the simplicial diagonal comparison. The finite-coefficient Artin comparison in IG.3 does not cover arbitrary constant abelian A required by Schmidt–Stix Proposition 2.3.

Needed by `EtaleHomotopyTypes:EH.3/etale-cohomology`, `EtaleHomotopyTypes:EH.3/geometric-galois-cohomology`.

### G4. Geometric-unibranch profiniteness

Schmidt–Stix invokes Artin–Mazur Theorem 11.1 for profiniteness of all raw homotopy pro-groups of a noetherian geometrically unibranch scheme. The primary proof has not been read and the book is not cleared. Recover that proof and its exact hypotheses from a public primary source or cleared library; finite-étale π₁ classification alone does not give higher profiniteness.

Needed by `EtaleHomotopyTypes:EH.3/fundamental-group-comparison`.

### G5. Elementary-fibration homotopy theorem

The finite-Galois-cover reduction in Schmidt–Stix Proposition 2.8 cites Friedlander Theorem 11.5 with all primes. That primary proof is unread and the book is not cleared. Verify the geometric fiber, action/trivialization and pro-system hypotheses and the low-degree exactness. A proper-smooth completed fiber theorem alone is not the required nonproper elementary-fibration theorem.

Needed by `EtaleHomotopyTypes:EH.3/elementary-fibration-sequence`.

### G6. Analytification integration identity

ComplexComparisonPartII:C0 supplies the correct planned carrier, but its claimed upstream input is an open PR, not an accepted layer in current read-only main. Reconcile that exact carrier and accepted layer when available; neither Tau Ceti at the pin nor current main was found to supply a ready-to-use analytification functor. Do not introduce an incompatible replacement carrier here.

Needed by `EtaleHomotopyTypes:EH.5/evaluation-representability`, `EtaleHomotopyTypes:EH.5/betti-diagonal`, `EtaleHomotopyTypes:EH.5/smooth-cech-descent`.

### G7. Strict functorial models and automorphism actions

The BHH/IC construction gives a homotopy-coherent completion and materialization. FGV’s footnote about preferred inverse systems does not by itself construct a strictly functorial point-set completion on those systems, prove the necessary coherent refinement comparisons, or an honest strict Aut(C) action on a chosen SSet. Supply and verify that model-level strictification before exporting the stronger strict functor/action. The roadmap distinguishes this leaf from the coherent naturality and action it already specifies.

Needed by `EtaleHomotopyTypes:EH.6/etale-p-realization`, `EtaleHomotopyTypes:EH.6/comparison-zigzag`, `EtaleHomotopyTypes:EH.6/automorphism-naturality`.

## Source qualifications

The statements above are in our own words and use the corrected formulas. All five source findings below were independently confirmed on 2026-10-19; E3 is scoped to property (iii) and its coproduct application, since page 309 already states finiteness. Their provenance, counterexamples, version hashes and review reasons are recorded in the packet. The bounded correction search found no applicable published correction; it does not establish novelty.

- **EtaleHomotopyTypes/E1**, [SS], Theorem A.8 proof, p. 857. That product is the degree-n term of the cosimplicial replacement. Partial totalization is Map(sk_n Δ^•,C^•), with compatibility equations, after the required fibrant replacement. Check: The product omits the naturality constraints. For *→{0,1}, a degree-zero pair with second entry 1 has no extension to Tot_1.

- **EtaleHomotopyTypes/E2**, [SS], Appendix A.2.3 cylinder paragraph, p. 858. It is a weak equivalence, and its endpoint map is a cofibration. Fibrancy of the projection is unnecessary and false in general. Check: For a three-point discrete X with two marked points, the cylinder over the third point is Δ[1]. The projection Δ[1]→* is not a Kan fibration, since Δ[1] has no inverse-edge horn filler.

- **EtaleHomotopyTypes/E3**, [FGV], Appendix A.2 property (iii), p. 305; A.2.2, pp. 307–309; coproduct application in A.5, pp. 315–316. Retain page 309’s finiteness requirement. Use connected H⁰=F_p, H¹=0 and degreewise finite-dimensional cohomology for the connected finite-type criterion. For an infinite specified grading, complete and materialize each summand before taking the ordinary coproduct. Check: For an infinite discrete scheme, completion is a pro-finite-set system and materialization has ultrafilter points. Arbitrary functions on those points give additional H⁰ classes; the original infinite discrete scheme has only its original components.

- **EtaleHomotopyTypes/E4**, [FGV], Appendix A.2.2, p. 309, DAG XIII citation. Use Theorem 3.4.12 together with Proposition 3.3.8; the connectedness condition appears explicitly in that theorem. Check: Theorem 3.4.2 is an orthogonal-factorization statement; Theorem 3.4.12 states the cohomological finite-type criterion.

- **EtaleHomotopyTypes/E5**, [FGV], Example A.10, p. 311. For the stated manifold argument, require V smooth, whence U is smooth. Analytic étale hypercover descent over singular varieties uses a different local-homeomorphism argument. Check: The identity of a singular quasi-projective curve is a smooth surjection as a morphism, but its analytification need not be a smooth manifold. The descent conclusion can still hold; this counterexample concerns the proof assertion.

## References and exact versions

Locators in Isaksen, BHH and DAG XIII use internal author/postprint pages; locators in Schmidt–Stix and FGV use published journal pages. Hashes and access dates are in the packet. No restricted book was read or copied. Unread primary book proofs are precisely G2–G5.

- **[SS]** Alexander Schmidt; Jakob Stix. [Anabelian geometry with étale homotopy types](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf). Annals of Mathematics 184 (2016), 817–868; published PDF. Read: §§2.1–2.3, pp. 822–829; Appendix A.1–A.3, pp. 852–866; Lemma 6.3 and projection-family proof, pp. 847–849, for the geometric ownership boundary.

- **[FGV]** Tony Feng; Søren Galatius; Akshay Venkatesh. [The Galois action on symplectic K-theory](https://link.springer.com/content/pdf/10.1007/s00222-022-01127-8.pdf). Inventiones Mathematicae 230 (2022), 225–319; published PDF. Read: Appendix A.2.1–A.2.3, pp. 304–310; Example A.10, p. 311; consumer interfaces in A.3–A.5.

- **[I01]** Daniel C. Isaksen. [A model structure on the category of pro-simplicial sets](https://arxiv.org/pdf/math/0106152v1). arXiv:math/0106152v1, 18 June 2001; author pagination, not journal pagination. Read: §§4–8, pp. 6–16: local systems, model structure, detection, homotopy limit; Target statements in §§15–18, pp. 25–36; proof of §18 and the properness discussion in §17 inspected; the subsequent properness correction is unread.

- **[IEt]** Daniel C. Isaksen. [Etale realization on the A1-homotopy theory of schemes](https://arxiv.org/pdf/math/0106158v2). arXiv:math/0106158v2, 10 February 2003; author pagination. Read: §§2–3, pp. 4–10; §§5–6, pp. 13–20: rigid covers, pullbacks, rigid limits and finite-degree cofinality.

- **[IC]** Daniel C. Isaksen. [Completions of pro-spaces](https://arxiv.org/pdf/math/0404303v1). arXiv:math/0404303v1, 16 April 2004; author pagination; published Math. Z. 250 (2005), 113–143. Read: Theorem 2.2, pp. 4–5; Definition 3.1 and Theorem 3.3, pp. 5–6; §§5–6, pp. 9–13, coefficient-versus-homology distinctions and localization statements.

- **[BHH]** Ilan Barnea; Yonatan Harpaz; Geoffroy Horel. [Pro-categories in homotopy theory](https://www.math.univ-paris13.fr/~harpaz/pro_categories.pdf). author postprint, 77 pages; locators use internal pages; published AGT 17 (2017), 567–643. Read: §7.1, Theorem 7.1.2, pp. 62–64; §7.3, Definition 7.3.1 and Corollary 7.3.8, pp. 68–71; §6 Theorem 6.0.5, pp. 60–61 inspected for boundary.

- **[DAG13]** Jacob Lurie. [Derived Algebraic Geometry XIII: Rational and p-adic Homotopy Theory](https://www.math.ias.edu/~lurie/papers/DAG-XIII.pdf). 15 December 2011; author pagination. Read: §3.3, Definition 3.3.2, Proposition 3.3.8, pp. 82–86; §3.4, Corollary 3.4.10 and Theorem 3.4.12, pp. 91–93.

## Suggested Lean file and acceptance

The companion suggested file uses the native singular functor on a supplied simplicial topological space, the native diagonal and uncurrying functors, and the existing continuous-function algebra. The evaluation/precomposition theorem records the naturality required by algebraic evaluation. The constant-diagram and simplex comparisons pin its relation to the existing carrier. Its examples check degree zero, evaluation of the unit, and a nonconstant coordinate.

The full rigid-type, model-category, completion and analytification targets require carrier APIs absent at the pins, so their signatures remain in this document. No dummy proposition or uninterpreted data definition stands in for them. The suggested file elaborates at the pins, with only admitted-proof warnings. This verifies those signatures and lightweight definitions; it proves none of the mathematical milestones.

Acceptance of the roadmap requires checking the canonical maps in addition to abstract isomorphism types: finite étale base-change squares, the stabilizer quotient in a slice of the homotopy category, the BHH constant/limit adjunction, the finite-type cohomology projection, and the direct algebraic discrete-point map. The curve, BC_p and countable-discrete tests exercise distinct scopes. P¹ fails the raw K(pi,1) test through π₂, while positive-genus curves use NC.0; nonzero H¹ prevents use of the finite-type sufficient criterion alone. An infinite union of points uses the specified componentwise construction.
