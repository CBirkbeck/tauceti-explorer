# Belyi maps, dessins d’enfants, and three-point covers, Part II: inverse Galois theory and arithmetic fundamental groups

The first prerequisite is [BelyiMaps](../../../content/tau-ceti/BelyiMaps/README.md). Its three-point covers, dessins, descent and arithmetic actions provide the existing model. This continuation treats finite covers of general schemes, arbitrary branch sets, Hilbert specialization, arithmetic embedding problems and Hurwitz families. The accepted RS-29 ownership decisions keep the three-point constructions with BelyiMaps and give the general adapters to this roadmap. The general inverse Galois problem over ℚ remains open.

A finite cover turns geometry into a finite permutation action. Choosing a geometric point supplies the fiber on which that action operates; changing the point gives a path torsor and an inner ambiguity. Over a nonclosed field the arithmetic fundamental group remembers the constant-field Galois action. Hilbert irreducibility then turns regular function-field realizations into number-field realizations, while rigidity and Hurwitz spaces organize the covers from which those realizations arise. Embedding problems supply a separate arithmetic construction, whose weak solutions must be distinguished from proper field realizations.

This is a complete target-level plan of IG.0–IG.6: 137 nodes, with 20 definitions, 31 constructions, 8 comparisons, 63 theorems, 8 lemmas and 7 applications. The definitions and constructions have 203 API items and 154 tests; 33 planets identify the central objects and theorems. All seven stages are planned and none is closed. The 27 explicit gaps and 49 supplier requests describe the remaining proof and carrier interfaces. Every implementation status is unchecked. No source is claimed to have been fully decomposed merely because its target statements have been planned.

## Conventions and baseline

Write Γₖ for the absolute Galois group of k. The category FEt(X) retains the finite étale structural morphism Y→X and its X-morphisms; fibers are covariant in covers. On affines this category is opposite to finite étale algebras. Étale paths are natural isomorphisms of fiber functors, and transport acts by conjugation. Pro-étale fundamental groups are Noohi groups; they are not generally inverse limits of discrete groups.

For branch tuples use right-to-left permutation composition and the ordered product g₁⋯gᵣ. The positive Hurwitz move replaces (a,b) by (aba⁻¹,a). Product one and generation are separate conditions on raw tuples. Inner classes divide by simultaneous G-conjugation; absolute classes use the normalizer of a specified faithful permutation representation; T-systems divide generating free-group homomorphisms by Aut(G). An ordinary marked fiber and a tame tangential fiber are different constructions.

Arithmetic Frobenius is x↦xᵠ; geometric Frobenius is its inverse. Positive inertia conjugation uses the cyclotomic character χ defined by σ(ζ)=ζ^χ(σ); right cover pullback uses the inverse convention. The existing BelyiMaps product order is transported explicitly. In positive characteristic a free prime-to-p presentation does not describe the whole tame fundamental group. Field of moduli and field of definition, connectedness and regular constants, weak and proper embedding solutions, and a G-cover and its ordinary quotient cover each retain their own hypotheses.

In the specialization component, T is the parameter of native RatFunc k and Y is the outer polynomial variable. The reduced denominator defines regularity. A removable pole is canceled first; total RatFunc evaluation at a genuine pole does not provide a ring homomorphism. Degree preservation requires both coefficient regularity and nonvanishing of the leading numerator, and does not imply irreducibility.

The pinned implemented baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The 67 declaration statements were inspected at those pins. Current roadmap main df8020193b157c047bcaa0381c3f0d6c3f605dcb and current Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were read separately. Current roadmap plans are imports, not implemented baseline declarations. ProfiniteArithmetic and PeripheralActions supply their current conventions; BelyiMaps11–13 supplies the three-point and arithmetic interfaces, ProfiniteProPGroups5 the generic weak finite embedding carrier and arbitrary abelian-kernel obstruction, and PolynomialGaloisGroups9 the existing generic polynomial group predicate.

Native abstract Galois categories do not establish the scheme fiber-functor instance. Native affine finite étale algebras do not establish the global scheme gluing bridge. Native finite Schur–Zassenhaus existence does not establish profinite complement conjugacy. These differences are recorded as exact nodes or gaps rather than strengthened library citations. The retained fifteen-node rational-specialization component uses Polynomial.toSubring instead of rebuilding its coefficient lift.

## Layers and dependency route

| Layer | Construction route | Coverage | Planets |
| --- | --- | --- | --- |
| IG.0 | Construct the finite-cover category and its geometric fiber instance before applying abstract Galois-category classification. Extend from finite covers to integral and adic local systems and then to Noohi/pro-étale reconstruction, preserving their different topologies. | planned | Finite étale covers, Étale fundamental group, Galois algebras, Étale local systems, Noohi groups, Pro-étale fundamental group |
| IG.1 | Construct the arithmetic exact sequence, basepoint transport and local decomposition/inertia maps. Give the precise proper smooth and tame specialization scopes, and isolate algebraically closed characteristic-zero base extension from the proper-only native source. | planned | Arithmetic fundamental group, Decomposition and inertia, Tame fundamental group, Smooth proper specialization, Arithmetic representations |
| IG.2 | Define scheme-point Hilbert subsets and thin sets, build guarded rational specialization, and establish number-field irreducibility, disjointness and local approximation. The norm map, quantitative thin-set bound, Frattini image criterion and absolute-Galois normal-subgroup continuation have separate statements. | planned | Rational functions regular at a point, Rational-coefficient polynomial specialization, Hilbert subsets, Hilbert irreducibility, Regular full-group specialization, Absolute Galois normal subgroups |
| IG.3 | Build raw branch tuples and braid actions before imposing Nielsen conditions. Treat exterior free-group epimorphisms separately from sphere product-one tuples. Import the existing three-point Riemann existence and descend general branch covers with the exact moduli obstruction, inertia and lifting-invariant conventions. | planned | Riemann existence for covers, Nielsen classes, Hurwitz braid action, Exterior epimorphisms, Rational rigidity |
| IG.4 | Extend the existing generic weak embedding problem to actual arithmetic properness and place restrictions. Supply the restricted finite-coefficient duality kernel, Schmidt–Wingberg shrinking and Fitting-supplement induction, supersolvable and quaternion local realizations, and the admissible unramified Γ-group interfaces. | planned | Proper embedding problems, Abelian lifting obstruction, Galois localization kernels, Split nilpotent embedding theorem, Shafarevich theorem |
| IG.5 | Construct configuration and topological Hurwitz carriers, then algebraic tame and admissible moduli in general marked genus. Separate fixed-degree coefficient comparison from stability, and geometric-component counts from point counts. Field-algebra patching is a prerequisite to, rather than a replacement for, formal branched-cover patching. | planned | Configuration spaces, Topological Hurwitz spaces, Arithmetic Hurwitz moduli, Admissible G-covers, Hurwitz component invariants |
| IG.6 | Expose finite Galois field and polynomial certificates and transport them through specialization. Give a concrete dihedral-eight model, import existing symmetric-group and dessin results, and keep generic-polynomial universality and the general inverse Galois frontier as precisely quantified problems. | planned | Realization certificates |

Ordinary finite-cover paths, restricted tame tangential fibers, integral thin-set bounds, the restricted finite-module global duality kernel and finite Hurwitz cohomology/trace/weight adapters are owned here at tier six. Their broader anabelian, sieve, global-duality and weight-theory consumers import these kernels downstream. They are not cited as upward prerequisites. General curve moduli, quotient stacks, sites, topology and reductive-group inputs remain with their existing owners.

## Target specifications

The packet IDs below are stable review and implementation references. Every prerequisite is an implemented declaration, a local node or an existing supplier node/stage. Stage imports have an explicit request in the supplier table. Each proof route is a construction plan; an original proof not yet inspected is named in the gap ledger. Source locators refer to the precise versions in the bibliography.

### IG.0

Construct the finite-cover category and its geometric fiber instance before applying abstract Galois-category classification. Extend from finite covers to integral and adic local systems and then to Noohi/pro-étale reconstruction, preserving their different topologies.

<a id="IG-0-finite-etale-covers"></a>
#### Finite étale covers of a scheme

**IG.0/finite-etale-covers** · definition. Planet: Finite étale covers.

For a scheme X, FEt(X) is the full subcategory of Over X on finite étale structural morphisms. Its arrows are X-morphisms. Pullback along f:X′→X is a functor f*:FEt(X)→FEt(X′), with coherent identity/composition isomorphisms. The affine comparison is FEt(Spec R)≃CommAlgCat.FiniteEtale R opposite, with the native finite-étale algebra carrier.

Proof route:

1. Use native Over, finite morphisms and Étale predicates; prove persistence under pullback and composition.
2. Finite coproducts are disjoint unions; fiber products are scheme pullbacks. On affine charts use the algebraic finite-étale anti-equivalence and glue with effective descent.

Prerequisites: SchemeAndStackFoundations:SF.0; SchemeAndStackFoundations:SF.1; mathlib:AlgebraicGeometry.Etale; mathlib:AlgebraicGeometry.IsFinite; mathlib:AlgebraicGeometry.Scheme.Etale.

Uses:

- SGA1 V §7; IG.1 arithmetic sequence: Finite cover pullback is the functor that induces maps on π₁.

API:

- FiniteEtaleCover.of (constructor): A finite étale morphism Y→X gives an object, with its exact structural map.
- FiniteEtaleCover.hom_ext (extensionality): Arrows are equal exactly when their underlying scheme maps are equal.
- FiniteEtaleCover.pullback (functoriality): Pullback respects identities and composition up to the scheme pullback comparisons.
- FiniteEtaleCover.affineEquivalence (equivalence): Over Spec R this category is the opposite of the native finite-étale R-algebra category.

Tests:

- FiniteEtaleCover.empty_test (computation): The empty scheme is the initial cover and has empty geometric fiber.
- FiniteEtaleCover.split_test (computation): The n-fold disjoint union of X is a cover; pullback is the n-fold split cover.
- FiniteEtaleCover.ramification_test (non-example): Over characteristic zero the map A¹→A¹, z↦z², is finite but not an object at zero; its restriction over Gm is an object.

Acceptance:

- The empty scheme is the initial cover and has empty geometric fiber.
- The n-fold disjoint union of X is a cover; pullback is the n-fold split cover.
- Over characteristic zero the map A¹→A¹, z↦z², is finite but not an object at zero; its restriction over Gm is an object.

Sources:

- [sga1](#source-sga1), Exposé V §§1–4, printed pp.89–104; §7 pp.115–116. Supplies the finite-cover category and its categorical axioms.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration. The geometric-fiber clause of empty_test, restriction-to-Gm clause of ramification_test and explicit pullback coherence isomorphisms still require the geometric bridge.
Recorded gaps: Scheme Galois-category bridge.

<a id="IG-0-geometric-fiber"></a>
#### The geometric fibre functor

**IG.0/geometric-fiber** · construction.

A geometric point x:Spec Ω→X, with Ω separably closed, gives Fib_x:FEt(X)→FintypeCat by geometric fiber. Finite étale Ω-schemes are finite disjoint unions of Spec Ω. Fib_x on an affine cover corresponds to Hom_R-alg(A,Ω), with arrows covariant on schemes and contravariant on algebras. If X is nonempty connected, Fib_x is a native PreGaloisCategory.FiberFunctor and FEt(X) is a native GaloisCategory.

Proof route:

1. Identify each finite étale geometric fiber with its points.
2. Prove preservation of finite limits, coproducts, finite-group quotients and epis from the affine calculation plus descent.
3. Use locally constant finite rank and connectedness to reflect isomorphisms; verify the native FiberFunctor fields rather than a private axiom list.

Prerequisites: [IG.0/finite-etale-covers](#IG-0-finite-etale-covers); SchemeAndStackFoundations:SF.1.

Uses:

- SGA1 V §7; IG.0 étale π₁: Automorphisms of this specific fiber functor define the scheme group.

API:

- GeometricFiber.obj (data): Fib_x(Y) is the finite set of lifts Spec Ω→Y above x.
- GeometricFiber.map_apply (simp): An arrow h:Y→Z acts by y↦h∘y.
- GeometricFiber.pullbackIso (compatibility): Fib_x(f*Y) is naturally Fib_{f∘x}(Y).
- GeometricFiber.reflectsIso (characterisation): For connected X, a cover arrow is an isomorphism iff its fiber map is bijective.

Tests:

- GeometricFiber.identity_test (computation): The identity cover has a one-element fiber.
- GeometricFiber.split_test (computation): The fiber of X⊔X has exactly two points.
- GeometricFiber.disconnected_test (non-example): For X=X₁⊔X₂ with x in X₁, the inclusion X₁→X is fiberwise bijective but is not an isomorphism; reflection requires connectedness.

Acceptance:

- The identity cover has a one-element fiber.
- The fiber of X⊔X has exactly two points.
- For X=X₁⊔X₂ with x in X₁, the inclusion X₁→X is fiberwise bijective but is not an isomorphism; reflection requires connectedness.

Sources:

- [sga1](#source-sga1), Exposé V §§4–7, printed pp.97–116. Geometric fibers satisfy the Galois-category axioms.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Scheme Galois-category bridge.

<a id="IG-0-etale-fundamental-group"></a>
#### The étale fundamental group

**IG.0/etale-fundamental-group** · construction. Planet: Étale fundamental group.

For a nonempty connected scheme X with geometric point x, π₁^ét(X,x)=Aut(Fib_x) with the native profinite fiber-functor topology. Its tautological action yields FEt(X)≃finite continuous π₁^ét(X,x)-sets. Connected nonempty covers correspond to transitive nonempty sets; pointed connected covers correspond to open subgroups and pointed Galois covers to open normal subgroups. For a disconnected scheme apply the construction to the connected component containing the point; no point sees all components.

Proof route:

1. Apply the native Galois-category reconstruction to the verified instance, not a new reconstruction theorem.
2. Identify connectedness with absence of nontrivial coproduct decompositions; recover subgroup/stabilizer descriptions from the finite-action equivalence.

Prerequisites: [IG.0/geometric-fiber](#IG-0-geometric-fiber).

Uses:

- IG.1 exact sequence; arithmetic dynamics: Cover restriction is read as restriction of finite actions.

API:

- EtaleFundamentalGroup.action (structure): Each geometric fiber has a continuous tautological action.
- EtaleFundamentalGroup.coverEquivalence (equivalence): The fiber functor with its action is an equivalence to finite continuous actions.
- EtaleFundamentalGroup.map (functoriality): A pointed scheme map gives a continuous group homomorphism, compatible with cover pullback and composition.
- EtaleFundamentalGroup.openSubgroupCover (universal-property): An open subgroup gives a pointed connected cover with that subgroup as the image of its π₁.

Tests:

- EtaleFundamentalGroup.sepClosed_test (computation): For Spec Ω with Ω separably closed the group is trivial.
- EtaleFundamentalGroup.transitivity_test (computation): A quadratic separable field cover has a transitive two-point action, unlike the split algebra K×K.
- EtaleFundamentalGroup.component_test (non-example): For X=Spec Ω⊔Spec Ω, π₁ at either point is trivial but the fiber functor on all covers is not an equivalence to finite sets.

Acceptance:

- For Spec Ω with Ω separably closed the group is trivial.
- A quadratic separable field cover has a transitive two-point action, unlike the split algebra K×K.
- For X=Spec Ω⊔Spec Ω, π₁ at either point is trivial but the fiber functor on all covers is not an equivalence to finite sets.

Sources:

- [sga1](#source-sga1), Exposé V §§7–8, printed pp.115–118. Reconstruction and the subgroup correspondence for finite covers.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Scheme Galois-category bridge.

<a id="IG-0-basepoint-and-components"></a>
#### Base-point change and connected components

**IG.0/basepoint-and-components** · construction.

For connected X and geometric points x,y, Path_X(x,y)=Isom(Fib_x,Fib_y). Composition and inverses of natural isomorphisms form the groupoid of geometric points; each path set is a nonempty profinite left/right torsor under the two fundamental groups. A choice α transports g to αgα⁻¹; changing α changes the transported homomorphism by an inner automorphism. Cover components are π₁-orbits. This ordinary finite-cover path groupoid is passed to NC.0, which owns its broader anabelian and nonabelian continuations.

Proof route:

1. Use Galois reconstruction and the prorepresenting fiber system for existence of natural isomorphisms.
2. Calculate transport on a fiber and the change-of-choice formula; use transitive orbits for components.

Prerequisites: [IG.0/etale-fundamental-group](#IG-0-etale-fundamental-group).

Uses:

- SGA1 V §§5–7; downstream NC.0: Preserves basepoint choices, their topology and the exact inner ambiguity.

API:

- EtalePath.id (constructor): The identity natural isomorphism is the path at x.
- EtalePath.comp (structure): Natural-isomorphism composition is associative, with identities and inverses.
- EtalePath.transport (functoriality): A path gives a continuous group isomorphism by conjugation, compatible with composition.
- EtalePath.torsor (characterisation): The actions on paths are free and transitive; replacing a path changes transport by inner conjugation.

Tests:

- EtalePath.field_test (computation): At one geometric point of Spec K the path set is Γ_K, with its regular actions.
- EtalePath.disconnected_test (non-example): Two points in different components of a split scheme have no fiber-functor isomorphism: the cover of just one component distinguishes them.
- EtalePath.choice_test (computation): For a connected S₃-Galois cover, changing a path by a transposition conjugates the 3-cycle transport to its inverse.

Acceptance:

- At one geometric point of Spec K the path set is Γ_K, with its regular actions.
- Two points in different components of a split scheme have no fiber-functor isomorphism: the cover of just one component distinguishes them.
- For a connected S₃-Galois cover, changing a path by a transposition conjugates the 3-cycle transport to its inverse.

Sources:

- [sga1](#source-sga1), Exposé V §§5–7, printed pp.104–116. Comparison of fiber functors and component interpretation.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Scheme Galois-category bridge.

<a id="IG-0-field-and-torus-comparisons"></a>
#### Field and multiplicative-group acceptance comparisons

**IG.0/field-and-torus-comparisons** · comparison.

For any field K, identify the group of Spec K at a separable closure with Gal(K^sep/K), using ModularCurves Layer0D. For algebraically closed K of characteristic zero, identify π₁^ét(Gm,K,1) with the Tate module lim μ_n(K), using ProfiniteArithmetic and PeripheralActions. A chosen compatible system of roots gives an isomorphism with Ẑ; the Tate-module identification is the invariant one. Reuse BelyiMaps12.5–12.6 for its punctured-line specializations.

Proof route:

1. Match the affine finite-cover fiber with the imported field Galois-set functor.
2. Match the power covers z↦z^n and their fibers with the imported Tate-module tower.

Prerequisites: [IG.0/etale-fundamental-group](#IG-0-etale-fundamental-group); tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions; tauceti:TauCetiRoadmap/BelyiMaps#layer-12-profinite-powers-the-fundamental-group-and-the-branch-cycle-theorem; tauceti:TauCetiRoadmap/BelyiMaps#layer-13-the-pro-ℓ-peripheral-theorem-and-faithfulness.

Acceptance:

- For a separably closed field the group is trivial; for C× the degree-n power cover gives the μ_n fiber.
- Changing compatible roots changes a Z-hat coordinate, but preserves the Tate module comparison.

Sources:

- [sga1](#source-sga1), Exposé V Proposition8.1, p.117; XIII Corollary2.12, p.290. Connects the scheme group with field and punctured-curve finite covers.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Scheme Galois-category bridge.

<a id="IG-0-finite-galois-algebras"></a>
#### Finite Galois algebras and torsors

**IG.0/finite-galois-algebras** · definition. Planet: Galois algebras.

For a field K and finite group H, an H-Galois algebra is a finite étale K-algebra A with an H-action by K-algebra automorphisms such that Spec A is an H-torsor: its geometric fiber is a free transitive H-set. A may be disconnected. Equivalently the canonical map A⊗_K A→∏_{h∈H}A, a⊗b↦(a·h(b))_h, is an isomorphism. For N normal in H, A^N is an H/N-Galois algebra. Use the torsor convention once and translate the right action on points against the left algebra action.

Proof route:

1. Use the finite étale affine fiber anti-equivalence to test the torsor condition after a separable closure.
2. Compute the tensor map on the split function algebra and descend its isomorphism. Invariants correspond to orbit sets.

Prerequisites: [IG.0/finite-etale-covers](#IG-0-finite-etale-covers); [IG.0/geometric-fiber](#IG-0-geometric-fiber); SchemeAndStackFoundations:SF.1.

Uses:

- Merkurjev–Scavia Lemma3.2; IG.4 weak lifting: A weak homomorphism lift yields a torsor algebra, not automatically a realization.

API:

- GaloisAlgebra.split (constructor): The function algebra K^H with translation action is an H-Galois algebra.
- GaloisAlgebra.torsorMap (characterisation): The displayed tensor-to-product map is an algebra isomorphism exactly for the torsor condition.
- GaloisAlgebra.invariants (compatibility): A^N is H/N-Galois for normal N; A^H=K.
- GaloisAlgebra.homClass (equivalence): Isomorphism classes correspond to continuous homomorphisms Gal(K^sep/K)→H up to H-conjugacy; fields correspond to surjective homomorphisms.

Tests:

- GaloisAlgebra.split_test (computation): K^H is valid even when |H|>1 and is not a field.
- GaloisAlgebra.quadratic_test (computation): A separable quadratic extension with its nontrivial involution is a C₂-Galois algebra.
- GaloisAlgebra.weak_test (non-example): The trivial homomorphism Γ_K→C₂ corresponds to K×K, not a quadratic field.

Acceptance:

- K^H is valid even when |H|>1 and is not a field.
- A separable quadratic extension with its nontrivial involution is a C₂-Galois algebra.
- The trivial homomorphism Γ_K→C₂ corresponds to K×K, not a quadratic field.

Sources:

- [merkurjev-scavia](#source-merkurjev-scavia), §1.2 pp.1–2; Lemma3.2 pp.8–9. The lifting dictionary includes Galois algebras, which need not be fields.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Scheme Galois-category bridge.

<a id="IG-0-finite-etale-idempotents"></a>
#### Idempotents representing finite étale homomorphisms

**IG.0/finite-etale-idempotents** · theorem.

For a finite étale R-algebra A and any R-algebra B, R-algebra maps A→B correspond naturally to those idempotents e∈A⊗_R B for which e(A⊗_R B) maps isomorphically to B under its B-algebra structure. The general set of idempotents is larger: it parametrizes clopen summands. This natural correspondence supplies the affine representability calculation for finite covers.

Proof route:

1. After an étale splitting cover, A becomes a finite product and a homomorphism selects locally one coordinate.
2. Glue the selected rank-one summand; descend idempotents and the algebra isomorphism.

Prerequisites: [IG.0/finite-etale-covers](#IG-0-finite-etale-covers); SchemeAndStackFoundations:SF.1.

Acceptance:

- For A=R×R, the rank-one idempotents select an algebra map; the idempotent 1 is not such a selector unless rank is one.

Sources:

- [kedlaya-liu](#source-kedlaya-liu), Definition1.2.2 and Lemma1.2.3, PDF p.13. Representability is a distinguished class of idempotents, not every idempotent.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Scheme Galois-category bridge.

<a id="IG-0-integral-monodromy"></a>
#### Integral local systems with finite monodromy

**IG.0/integral-monodromy** · theorem.

If X is connected, normal and locally noetherian and L is an étale locally constant free Z-sheaf of rank r<∞, its monodromy π₁^ét(X,x)→GL_r(Z) has finite image. The frame Isom torsor is an étale sheaf; the finite orbit of one frame gives a finite étale surjective cover trivializing L. The whole frame torsor is generally infinite. For rank ten this applies to the numerical Picard local system in Schröer; that geometric sheaf and its specialization are supplied by the Enriques/Picard owners.

Proof route:

1. Use the normal-base comparison for locally constant sheaves to discrete π₁-actions, then compactness gives finite image.
2. Choose the finite image orbit of a frame, recover its cover from reconstruction, and trivialize by evaluation.

Prerequisites: [IG.0/etale-fundamental-group](#IG-0-etale-fundamental-group); SchemeAndStackFoundations:SF.2.

Acceptance:

- A constant Z^r-system has trivial image; a monodromy character containing p^Z belongs to the rational stackified setting and cannot be substituted.

Sources:

- [schroer](#source-schroer), Proposition5.5, PDF p.15. Uses finite integral monodromy; the finite orbit avoids treating the entire frame space as finite.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Scheme Galois-category bridge.

<a id="IG-0-adic-local-systems"></a>
#### Integral, isogeny and rational local systems

**IG.0/adic-local-systems** · definition. Planet: Étale local systems.

For a scheme X and prime p, Zp-Loc(X) consists of compatible finite locally free Z/p^n-sheaves with reduction isomorphisms T_{n+1}/p^n≃T_n. Zp-ILoc(X) is the isogeny category, with Hom groups tensored with Qp. Qp-Loc(X) is the étale stackification of that prestack, so its local lattices need not combine to a global one. Tensor products, pullbacks and finite-extension-of-Qp coefficient actions use the same reductions and stack descent.

Proof route:

1. Construct the compatible reduction category; use native finite-module and inverse-system language.
2. Invert p in morphisms and then apply the supplier stackification. Prove reduction and tensor/pullback comparison maps.

Prerequisites: [IG.0/etale-fundamental-group](#IG-0-etale-fundamental-group); SchemeAndStackFoundations:SF.2; SchemeAndStackFoundations:SF.1.

Uses:

- Kedlaya–Liu perfectoid chapters via Remark1.4.3: Finite-cover equivalences transport integral and isogeny categories, but not rational stackifications in general.

API:

- AdicLocalSystem.reduction (projection): Reduction modulo p^n is finite locally free and has the specified transition isomorphism.
- AdicLocalSystem.pullback (functoriality): Pullback commutes with all reductions and tensor products.
- IsogenyLocalSystem.hom (characterisation): Isogeny Hom is integral Hom⊗Qp, with composition induced bilinearly.
- RationalLocalSystem.stackification (universal-property): Étale descent data in the isogeny prestack give rational local systems; the canonical functor is fully faithful.

Tests:

- AdicLocalSystem.constant_test (computation): The constant rank-r tower has reductions (Z/p^n)^r.
- AdicLocalSystem.reduction_test (non-example): A tower with unrelated ranks is not an integral local system.
- AdicLocalSystem.nodal_test (non-example): Gluing rank-one trivial systems on two P¹ components meeting twice with one transition p gives a Qp-local system with no global integral lattice.

Acceptance:

- The constant rank-r tower has reductions (Z/p^n)^r.
- A tower with unrelated ranks is not an integral local system.
- Gluing rank-one trivial systems on two P¹ components meeting twice with one transition p gives a Qp-local system with no global integral lattice.

Sources:

- [kedlaya-liu](#source-kedlaya-liu), Definition1.4.1; Remarks1.4.2–1.4.4 and1.4.12, PDF pp.20–23. Pins the three different categories and coefficient extension.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Scheme Galois-category bridge.

<a id="IG-0-adic-representations"></a>
#### Representations and bounded lattice schemes

**IG.0/adic-representations** · construction.

For connected X with geometric x, Zp-Loc(X) is tensor-equivalent to continuous finite free Zp-representations of π₁^ét; Zp-ILoc(X) is tensor-equivalent to continuous finite-dimensional Qp-representations. Compact image has a stable lattice. For T∈Zp-Loc and m≥0, L_m(T) is the finite étale scheme parametrizing lattices between p^mT and p^(-m)T. Its incidence subscheme records inclusion; finite sums give a canonical join. A faithfully finite étale ring map is effective descent for isogeny local systems. For normal noetherian X the isogeny-to-rational functor is an equivalence; the nodal examples show the hypothesis matters.

Proof route:

1. Apply finite-cover reconstruction level by level. A compact image has bounded denominators and the sum of its translates of one lattice is a stable lattice.
2. Reduce L_m to a finite Grassmannian of submodules modulo p^(2m); construct the inclusion scheme after trivialization modulo p^(4m).
3. Join finitely many lattices to make the finite étale descent datum integral; check that one closure step stabilizes locally and descends globally.

Prerequisites: [IG.0/adic-local-systems](#IG-0-adic-local-systems).

Uses:

- Kedlaya–Liu Lemma1.4.8: Finite sums in a bounded lattice scheme make finite étale isogeny descent effective.

API:

- AdicLocalSystem.representationEquivalence (equivalence): The equivalence identifies the fiber representation and all morphisms.
- LatticeScheme.baseChange (functoriality): L_m(T_Y)=L_m(T)×_X Y.
- LatticeScheme.incidence (relation): The finite étale incidence locus represents inclusion of the two lattice parameters.
- LatticeScheme.join (universal-property): The join is the least lattice containing each lattice in the finite family.

Tests:

- LatticeScheme.rankOne_test (computation): For trivial rank one, L_m has 2m+1 geometric points, the lattices p^aZp with −m≤a≤m.
- LatticeScheme.zeroBound_test (computation): L_0(T) is the identity cover.
- LatticeScheme.nodal_test (non-example): The nodal p-gluing rational local system is outside the isogeny category despite being locally inside it.

Acceptance:

- For trivial rank one, L_m has 2m+1 geometric points, the lattices p^aZp with −m≤a≤m.
- L_0(T) is the identity cover.
- The nodal p-gluing rational local system is outside the isogeny category despite being locally inside it.

Sources:

- [kedlaya-liu](#source-kedlaya-liu), Remarks1.4.4–1.4.7; Lemma1.4.8 and Remark1.4.9, pp.21–23. Constructs finite lattice parameter spaces and uses them for isogeny descent.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Scheme Galois-category bridge.

<a id="IG-0-noohi-groups"></a>
#### Noohi groups and infinite Galois categories

**IG.0/noohi-groups** · definition. Planet: Noohi groups.

A Hausdorff topological group G with open subgroups as a neighborhood basis is Noohi if its canonical map G→Aut(forget:G-Set_cont→Set) is a homeomorphism, where automorphisms have pointwise stabilizer topology. An infinite Galois category has disjoint connected-component decompositions, all colimits and finite limits, a set of connected generators, and a faithful conservative fiber functor preserving those operations. Categorical tameness means Aut(F) acts transitively on each connected-object fiber. For a tame infinite Galois category, Aut(F) is Noohi and the continuous-action functor is an equivalence.

Proof route:

1. Construct the pointwise topology on natural automorphisms, identify stabilizers, and compare continuous actions.
2. Prove reconstruction using connected generators and categorical tameness, following Theorem7.2.5.

Prerequisites: SchemeAndStackFoundations:SF.2.

Uses:

- Bhatt–Scholze7.4; Caraiani–Scholze1.13: Locally constant pro-étale sheaves require infinite-action reconstruction.

API:

- NoohiGroup.toAut (characterisation): The reconstruction map is a topological group isomorphism.
- InfiniteGaloisCategory.componentAction (structure): Connected object fibers are transitive precisely under categorical tameness.
- InfiniteGaloisCategory.actionEquivalence (equivalence): For a tame pair the fiber functor identifies the category with continuous discrete actions.
- NoohiGroup.openSubgroup (instance): An open subgroup of a Noohi group is Noohi.

Tests:

- NoohiGroup.profinite_test (computation): Every profinite group is Noohi.
- NoohiGroup.discrete_test (computation): Every discrete group is Noohi; infinite Z is not profinite.
- NoohiGroup.tameness_test (non-example): Reconstruction of all continuous actions needs categorical tameness; the remaining infinite-category axioms alone do not assert transitivity.

Acceptance:

- Every profinite group is Noohi.
- Every discrete group is Noohi; infinite Z is not profinite.
- Reconstruction of all continuous actions needs categorical tameness; the remaining infinite-category axioms alone do not assert transitivity.

Sources:

- [bhatt-scholze](#source-bhatt-scholze), Definitions7.1.1,7.2.1,7.2.4; Theorem7.2.5, PDF pp.63–66. The relevant group is Noohi; categorical tameness is unrelated to prime-to-p ramification.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Noohi and pro-étale carrier signatures.

<a id="IG-0-proetale-fundamental-group"></a>
#### Pro-étale fundamental groups and torsors

**IG.0/proetale-fundamental-group** · construction. Planet: Pro-étale fundamental group.

For connected locally topologically noetherian X, Loc(X_proét), the category of locally constant set sheaves, with its geometric stalk is a tame infinite Galois category. Define π₁^proét(X,x)=Aut(stalk) with pointwise topology. It is Noohi and Loc(X_proét)≃π₁^proét-Set_cont. Its profinite completion is π₁^ét. If X is geometrically unibranch, the comparison is already an isomorphism. For a Noohi target H, locally trivial H-torsors for its continuous-value sheaf correspond as a groupoid to continuous homomorphisms π₁^proét→H, with arrows conjugations. In particular this applies to GL_r(E) for a p-adic local field E and to J_b(Qp) in the Caraiani–Scholze application; the reductive target geometry is imported.

Proof route:

1. Use Cov(X): étale schemes satisfying the valuative properness condition, allowing infinite fibers, to prove the infinite-category axioms and tameness.
2. Apply infinite reconstruction; restrict to finite actions for profinite completion, and to target H-actions for the torsor groupoid.
3. For geometrically unibranch X, a connected Cov object is finite étale, proving the stronger comparison.

Prerequisites: [IG.0/noohi-groups](#IG-0-noohi-groups); [IG.0/etale-fundamental-group](#IG-0-etale-fundamental-group); SchemeAndStackFoundations:SF.2; EnhancedDerivedSheaves:E2.

Uses:

- Caraiani–Scholze1.13 and4.3.14: Classifies J_b(Qp)-torsors without assuming compact monodromy.
- Kedlaya–Liu1.4.11: Rational local systems become actual pro-étale sheaves.

API:

- ProetaleFundamentalGroup.actionEquivalence (equivalence): The equivalence is compatible with geometric stalks.
- ProetaleFundamentalGroup.toEtale (compatibility): The map induces the profinite completion; finite continuous actions agree.
- ProetaleFundamentalGroup.torsorEquivalence (equivalence): Hom_cont(π₁,H)//H is the H-torsor groupoid, including all conjugation arrows.
- ProetaleFundamentalGroup.map (functoriality): Pointed scheme maps induce continuous homomorphisms, with base-point transport up to inner automorphism.

Tests:

- ProetaleFundamentalGroup.normal_test (computation): For connected normal locally noetherian X, pro-étale and étale π₁ agree.
- ProetaleFundamentalGroup.node_test (non-example): The nodal rational curve has an infinite loop detected by Qp monodromy p; finite π₁ alone does not classify this local system.
- ProetaleFundamentalGroup.conjugacy_test (computation): Unmarked H-torsors give homomorphisms up to conjugacy, whereas a chosen fiber point removes that quotient.

Acceptance:

- For connected normal locally noetherian X, pro-étale and étale π₁ agree.
- The nodal rational curve has an infinite loop detected by Qp monodromy p; finite π₁ alone does not classify this local system.
- Unmarked H-torsors give homomorphisms up to conjugacy, whereas a chosen fiber point removes that quotient.

Sources:

- [bhatt-scholze](#source-bhatt-scholze), Lemma7.3.9; Lemma7.4.1, Definition7.4.2; Lemmas7.4.3/7.4.7/7.4.10, PDF pp.67–71. Gives the finite comparison and continuous target classification.
- [caraiani-scholze](#source-caraiani-scholze), Proposition1.13, Remarks1.14/4.3.14, pp.656–657,721. Uses a noncompact p-adic group torsor, beyond finite-cover classification.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Noohi and pro-étale carrier signatures.

### IG.1

Construct the arithmetic exact sequence, basepoint transport and local decomposition/inertia maps. Give the precise proper smooth and tame specialization scopes, and isolate algebraically closed characteristic-zero base extension from the proper-only native source.

<a id="IG-1-arithmetic-exact-sequence"></a>
#### The arithmetic fundamental-group sequence

**IG.1/arithmetic-exact-sequence** · theorem. Planet: Arithmetic fundamental group.

For a quasi-compact geometrically connected scheme X over a field k, with a geometric point in X_{k̄}, the natural continuous sequence 1→π₁^ét(X_{k̄})→π₁^ét(X)→Gal(k^sep/k)→1 is exact. Here k̄ is an algebraic closure, not an arbitrary algebraically closed overfield in positive characteristic. A k-rational point gives a section, and changing a path or a point gives the usual conjugacy ambiguity. The induced outer arithmetic action is independent of a section.

Proof route:

1. Descend finite étale covers of X_{k̄} and their morphisms to finite separable extensions of k.
2. Apply the finite Galois cover exact sequence to X_{k_i}→X and pass to the inverse limit of profinite groups.
3. A rational section of schemes induces a group section; calculate its outer action.

Prerequisites: [IG.0/etale-fundamental-group](#IG-0-etale-fundamental-group); [IG.0/basepoint-and-components](#IG-0-basepoint-and-components); [IG.0/field-and-torus-comparisons](#IG-0-field-and-torus-comparisons); SchemeAndStackFoundations:SF.1.

Acceptance:

- For Spec k, the geometric kernel is trivial and the quotient map is the identity of Γ_k.
- A rational point gives a section; exactness alone does not choose one.

Sources:

- [sga1](#source-sga1), Exposé IX Theorem6.1 and Corollary6.4, printed pp.195–196. Gives the exact field sequence, its quasi-compactness hypothesis and rational splitting.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Geometric specialization carrier.

<a id="IG-1-decomposition-inertia"></a>
#### Scheme decomposition and inertia groups

**IG.1/decomposition-inertia** · construction. Planet: Decomposition and inertia.

Let X be a normal integral locally noetherian scheme, L/K(X) a finite Galois extension with group G, and Y its finite normalization (assume finiteness, for example X Nagata). At a geometric or valuation point y above x, D_y stabilizes the point and I_y is the kernel of its residue-field action. Conjugating y conjugates D_y,I_y. On the discrete-valuation curve range D_y/I_y≃Gal(κ(y)/κ(x)) when the residue extension is separable; |I_y|=e only under the defectless finite-valuation hypotheses, including the characteristic-zero curve range. For intermediate covers G/H, D- and I-orbits give residue-degree/ramification data. Local henselian-field groups are imported from LocalFieldsRamification, and the curve-place dictionary from AlgebraicCurves8.

Proof route:

1. Use normalization, integral closure and the imported valuation decomposition sequence.
2. Compute geometric fibers and coset stabilizers via finite Galois actions; keep point choices and conjugation maps explicit.

Prerequisites: [IG.0/etale-fundamental-group](#IG-0-etale-fundamental-group); SchemeAndStackFoundations:SF.0; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius.

Uses:

- IG.2 specialized ramification; IG.3 branch cycles: Translate geometric cycles into arithmetic place data.

API:

- SchemeInertia.decomposition (projection): D_y is the point stabilizer in G.
- SchemeInertia.inertia (projection): I_y is the residue-action kernel inside D_y.
- SchemeInertia.conjugate (compatibility): Transport to gy is conjugation by g.
- SchemeInertia.intermediateOrbits (characterisation): On G/H, orbit sizes encode places; under the stated defectless valuation hypotheses inertia orbit lengths are ramification indices.

Tests:

- SchemeInertia.power_test (computation): For z↦z^n in characteristic zero, inertia at zero has order n; over a nonzero geometric point it is trivial.
- SchemeInertia.unramified_test (computation): For an unramified local extension I=1 and D is the residue Galois group.
- SchemeInertia.wild_test (non-example): For an Artin–Schreier cover of A¹ in characteristic p, inertia at infinity contains a nontrivial p-group.

Acceptance:

- For z↦z^n in characteristic zero, inertia at zero has order n; over a nonzero geometric point it is trivial.
- For an unramified local extension I=1 and D is the residue Galois group.
- For an Artin–Schreier cover of A¹ in characteristic p, inertia at infinity contains a nontrivial p-group.

Sources:

- [sga1](#source-sga1), Exposé V §2, pp.90–95; X Lemma3.6, pp.214–215. Relates curve ramification to finite covers and local inertia.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Geometric specialization carrier.

<a id="IG-1-tame-and-prime-to-p"></a>
#### Tame and prime-to-p fundamental quotients

**IG.1/tame-and-prime-to-p** · construction. Planet: Tame fundamental group.

For a smooth curve U over an algebraically closed field of characteristic exponent p, with smooth proper compactification and punctures D, π₁^t(U) is the quotient classifying covers whose ramification along D is tame. Its kernel in π₁^ét is the closed normal subgroup generated by wild inertia. The maximal prime-to-p quotient π₁^(p′)(U) classifies finite quotients of order prime to p. Tame and prime-to-p are different quotients: tame monodromy groups may have order divisible by p. Peripheral tame inertia is the prime-to-p Tate module, and p=1 means no primes excluded. Import the existing Tate and peripheral power carriers through BelyiMaps12–13 and current ProfiniteArithmetic/PeripheralActions. The restricted curve-boundary tangential fiber is IG.1/tame-tangential-fiber; the later nonabelian owner consumes it.

Proof route:

1. Translate the local tame inertia quotient of LocalFieldsRamification into the normalization condition for covers.
2. Use intersections of finite quotient kernels for the two distinct global quotients; compare their finite-cover categories.

Prerequisites: [IG.1/decomposition-inertia](#IG-1-decomposition-inertia); [IG.0/etale-fundamental-group](#IG-0-etale-fundamental-group); tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration; tauceti:TauCetiRoadmap/BelyiMaps#layer-12-profinite-powers-the-fundamental-group-and-the-branch-cycle-theorem; tauceti:TauCetiRoadmap/BelyiMaps#layer-13-the-pro-ℓ-peripheral-theorem-and-faithfulness.

Uses:

- Wood invariant; IG.5 tame reduction: Separate local tameness from the stronger group-order restriction.

API:

- TameFundamentalGroup.quotient (projection): The quotient kills exactly the closed normal wild-inertia subgroup.
- TameFundamentalGroup.coverEquivalence (equivalence): Finite actions correspond to tamely ramified covers relative to the chosen compactification.
- PrimeToFundamentalGroup.lift (universal-property): Every continuous map to a finite group of order prime to p factors uniquely through the maximal prime-to-p quotient.
- TameFundamentalGroup.peripheral (compatibility): Peripheral inertia has the imported prime-to-p Tate carrier; no cyclotomic generator is canonical.

Tests:

- TameFundamentalGroup.power_test (computation): On Gm in characteristic p, z↦z^n is tame for p∤n.
- TameFundamentalGroup.artinSchreier_test (non-example): y^p−y=x is finite étale on A¹ but its wild infinity inertia is killed in the tame quotient.
- TameFundamentalGroup.unramifiedP_test (non-example): An ordinary proper elliptic curve in characteristic p has an étale cyclic-p cover: tame because no boundary exists, but absent from the prime-to-p quotient.

Acceptance:

- On Gm in characteristic p, z↦z^n is tame for p∤n.
- y^p−y=x is finite étale on A¹ but its wild infinity inertia is killed in the tame quotient.
- An ordinary proper elliptic curve in characteristic p has an étale cyclic-p cover: tame because no boundary exists, but absent from the prime-to-p quotient.

Sources:

- [sga1](#source-sga1), Exposé XIII §§2.1–2.4, pp.277–285; §§2.10–2.12 pp.289–290. Prime-to-residue-characteristic quotients and tame peripheral presentations.
- [wood21](#source-wood21), §5, pp.10–12. The arithmetic lifting invariant requires prime-to-characteristic Tate generators.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Geometric specialization carrier.

<a id="IG-1-proper-specialization"></a>
#### Smooth proper specialization

**IG.1/proper-specialization** · theorem. Planet: Smooth proper specialization.

For a proper smooth scheme over a henselian discrete valuation ring with geometrically connected fibers, geometric specialization gives a surjection π₁(X_{η̄})→π₁(X_{s̄}), up to the chosen base-point transport. If the residue characteristic is p>0 it is an isomorphism on maximal prime-to-p quotients. If the residue characteristic is zero it is an isomorphism on the full groups. The induced restriction of finite covers agrees with specialization. No full isomorphism in mixed characteristic is asserted.

Proof route:

1. Extend special-fiber finite covers by the proper lifting and henselian comparison of SGA1.
2. Use smoothness to lift prime-to-p covers in the converse direction and identify fiber functors.

Prerequisites: [IG.0/etale-fundamental-group](#IG-0-etale-fundamental-group); [IG.0/basepoint-and-components](#IG-0-basepoint-and-components); SchemeAndStackFoundations:SF.4.

Acceptance:

- For a proper smooth curve in equal characteristic zero, specialization is an isomorphism.
- In mixed residue characteristic p only the prime-to-p isomorphism is asserted.

Sources:

- [sga1](#source-sga1), Exposé X Theorem3.8 and Corollary3.9, p.217; proof §§3.6–3.7 pp.214–216. Supplies surjectivity and prime-to-p/full-characteristic-zero specialization.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Geometric specialization carrier.

<a id="IG-1-punctured-specialization"></a>
#### Tame specialization with a relative boundary

**IG.1/punctured-specialization** · theorem.

Let X/S be a smooth proper relative curve over a strictly henselian DVR, and D a disjoint union of sections. For U=X−D, geometric specialization identifies maximal prime-to-p fundamental groups, and identifies their peripheral inertia generators after transport of the common prime-to-p Tate module. Use the chosen tame comparison maps; assert the prime-to-p isomorphism, not an unrestricted tame-group isomorphism. A finite G-cover with p∤|G| specializes with its inertia orders and geometric connectedness unchanged.

Proof route:

1. Apply the relative tame lifting theorem of SGA1 to the punctured smooth pair.
2. Compare fibers and local Kummer covers at each section, tracking Tate transport and conjugation.

Prerequisites: [IG.1/tame-and-prime-to-p](#IG-1-tame-and-prime-to-p); [IG.1/proper-specialization](#IG-1-proper-specialization); SchemeAndStackFoundations:SF.3.

Acceptance:

- For P¹ with three disjoint sections, prime-to-p branch inertia survives specialization.
- Colliding sections violate the hypotheses and may change the fundamental group.

Sources:

- [sga1](#source-sga1), Exposé XIII Theorem2.4, pp.282–285; Corollary2.8, p.288; §§2.10–2.12 pp.289–290. Controls the prime-to-p punctured-curve comparison.
- [wood21](#source-wood21), Theorem5.3 and proof, pp.10–12. The corrected invariant comparison uses common tame Tate generators.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Geometric specialization carrier.

<a id="IG-1-finite-field-frobenius"></a>
#### Frobenius and cyclotomic normalization

**IG.1/finite-field-frobenius** · comparison.

For a geometrically connected variety over Fq, the arithmetic quotient is Gal(F̄q/Fq)≃Ẑ, imported from LocalFieldsRamification4. Arithmetic Frobenius is a↦a^q. On the tame peripheral Tate module it acts by multiplication by q, so geometric Frobenius acts by q⁻¹. Use the same arithmetic/geometric convention in all lifting-invariant twists and component counts. For the punctured line this agrees with BelyiMaps12 and PeripheralActions, after restricting the prime-to-characteristic Tate module.

Proof route:

1. Apply the field acceptance comparison and the arithmetic sequence.
2. Check the action directly on each μ_n, n prime to q, then pass to the limit.

Prerequisites: [IG.1/arithmetic-exact-sequence](#IG-1-arithmetic-exact-sequence); [IG.1/tame-and-prime-to-p](#IG-1-tame-and-prime-to-p); tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group; tauceti:TauCetiRoadmap/BelyiMaps#layer-12-profinite-powers-the-fundamental-group-and-the-branch-cycle-theorem; tauceti:TauCetiRoadmap/BelyiMaps#layer-13-the-pro-ℓ-peripheral-theorem-and-faithfulness.

Acceptance:

- Arithmetic Frobenius raises tame inertia to the q-th power; geometric Frobenius gives q inverse in the prime-to-q Tate units.

Sources:

- [wood21](#source-wood21), §5 Theorem5.3, pp.10–12. Fixes the inverse cyclotomic convention for the discrete-action invariant.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Geometric specialization carrier.

<a id="IG-1-charzero-base-extension"></a>
#### Characteristic-zero algebraically closed base extension

**IG.1/charzero-base-extension** · theorem.

For an algebraically closed extension k⊂k′ of characteristic-zero fields and a connected finite-type k-scheme X, pullback induces an equivalence FEt(X)≃FEt(X_{k′}), hence an isomorphism of geometric π₁. For proper X the corresponding algebraically closed invariance holds in every characteristic by SGA1 X; the nonproper characteristic-p assertion is not exported. The analytic finite-cover comparison for complex finite-type schemes is the general Riemann-existence input of IG.3, rather than the three-point Belyi special case.

Proof route:

1. For the nonproper characteristic-zero statement, supply the algebraic spreading and extension comparison in the original invariance proof; a complex embedding of a finite model alone does not compare arbitrary large algebraically closed extensions.
2. For proper schemes use the algebraic proper invariance theorem.

Prerequisites: [IG.0/etale-fundamental-group](#IG-0-etale-fundamental-group); SchemeAndStackFoundations:SF.1; [IG.3/general-riemann-existence](#IG-3-general-riemann-existence).

Acceptance:

- A finite étale cover over C stays in the same covering category after an algebraically closed characteristic-zero extension.
- Artin–Schreier covers of A¹ in characteristic p rule out silently exporting the nonproper statement there.

Sources:

- [sga1](#source-sga1), Exposé X Corollary1.8, printed p.204 (proper case); XII Theorem5.1 and Corollary5.2, pp.251–253 (complex finite-cover comparison). Proper invariance and characteristic-zero finite-cover comparison.
- [chen](#source-chen), Remark4.2.4, arXiv v2 p.46. Needs the extension of algebraically closed fields, beyond just an embedding into C.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Geometric specialization carrier; Nonproper characteristic-zero base-extension proof.

<a id="IG-1-arithmetic-representation"></a>
#### Arithmetic representations as finite outer orbits

**IG.1/arithmetic-representation** · definition. Planet: Arithmetic representations.

For a geometrically connected variety X over a finitely generated characteristic-zero field K, a prime ℓ, and a continuous representation ρ:π₁^ét(X_{K̄})→GL_r(Q̄ℓ), call ρ arithmetic when its isomorphism class has finite orbit under Γ_K through the outer action from the arithmetic exact sequence. Conjugacy means change of basis in GL_r(Q̄ℓ); no chosen arithmetic splitting enters the definition. This definition alone implies neither finite image nor geometric origin.

Proof route:

1. Construct the action on representation isomorphism classes using a lift in the arithmetic group and verify independence under inner conjugation.
2. Use the finite-orbit criterion; with the quotient topology on classes do not replace it by an unsupported openness statement.

Prerequisites: [IG.1/arithmetic-exact-sequence](#IG-1-arithmetic-exact-sequence); [IG.0/adic-local-systems](#IG-0-adic-local-systems).

Uses:

- Landesman–Litt9.1: Imports this property into a separate low-rank finite-monodromy theorem.

API:

- ArithmeticRepresentation.conjugate (compatibility): Arithmeticity is invariant under a change of basis.
- ArithmeticRepresentation.baseExtension (functoriality): Restricting to a finite extension of K preserves arithmeticity.
- ArithmeticRepresentation.orbit (characterisation): Arithmeticity is equivalent to finiteness of the orbit set.
- ArithmeticRepresentation.innerIndependent (relation): Changing an arithmetic lift by a geometric element changes ρ only by conjugation.

Tests:

- ArithmeticRepresentation.trivial_test (computation): The trivial representation has an orbit of size one.
- ArithmeticRepresentation.finite_test (computation): A finite-image representation is arithmetic when π₁ of the geometric finite-type variety is topologically finitely generated; finiteness follows from finite homomorphism counting.
- ArithmeticRepresentation.image_test (non-example): The unipotent representation n↦[[1,n_ℓ],[0,1]] of the geometric Tate group has infinite image; cyclotomic scaling is conjugate by diag(χ_ℓ,1), so its class has a one-element arithmetic orbit. Finite orbit is not a definition of finite monodromy.

Acceptance:

- The trivial representation has an orbit of size one.
- A finite-image representation is arithmetic when π₁ of the geometric finite-type variety is topologically finitely generated; finiteness follows from finite homomorphism counting.
- The unipotent representation n↦[[1,n_ℓ],[0,1]] of the geometric Tate group has infinite image; cyclotomic scaling is conjugate by diag(χ_ℓ,1), so its class has a one-element arithmetic orbit. Finite orbit is not a definition of finite monodromy.

Sources:

- [landesman-litt](#source-landesman-litt), Definition9.1.1, arXiv v4 p.45. Exactly the finite outer-orbit definition, without its downstream finiteness theorem.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Geometric specialization carrier.

<a id="IG-1-stack-and-family-exactness"></a>
#### Family exactness and moduli outer actions

**IG.1/stack-and-family-exactness** · comparison.

For the universal n-punctured genus-g curve over the characteristic-zero moduli stack, in the hyperbolic stable range 2g−2+n>0, the arithmetic and geometric family π₁ sequences are exact and their outer actions commute with specialization from a dominant K-point. The geometric punctured curve group is the profinite completion of its topological group. The profinite exactness step requires the precise centreless-kernel criterion used by Landesman–Litt, together with its hypotheses on the topological extension; centrelessness by itself is not asserted to preserve every abstract exact sequence. Finite étale stacks use representable covers and geometric stalks. General stack construction and the universal curve come from R09.4 and SF.3.

Proof route:

1. Étale-locally apply finite-cover descent and the scheme homotopy exact sequence; descend the compatible stalk actions.
2. For the geometric universal curve, apply topological bundle exactness and the exact profinite-completion criterion, then finite-cover comparison.
3. Use the dominant generic-point map for finite-index image and compare outer actions.

Prerequisites: [IG.1/arithmetic-exact-sequence](#IG-1-arithmetic-exact-sequence); [IG.1/charzero-base-extension](#IG-1-charzero-base-extension); [IG.3/general-riemann-existence](#IG-3-general-riemann-existence); AlgebraicModuliForArithmeticGeometry:R09.4; SchemeAndStackFoundations:SF.3.

Acceptance:

- The genus-zero three-puncture fiber is free of rank two.
- Stabilizer terms are retained in the stack group and the hyperbolic range is checked.

Sources:

- [landesman-litt](#source-landesman-litt), Proof of Theorem9.1.2, diagrams(9.1)/(9.2), arXiv v4 pp.46–47. Uses topological exactness and Anderson1974 Proposition3, not a general completion-exactness claim.
- [evw](#source-evw), §7.4, pp.766–768. Finite-cover stack adapters are needed for the labelled hyperelliptic comparison.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Stack completion exactness source; Geometric specialization carrier.

<a id="IG-1-tame-tangential-fiber"></a>
#### Tame tangential fibers at a smooth curve boundary

**IG.1/tame-tangential-fiber** · construction.

Let C/k be a smooth curve, P a k-rational smooth point and v a nonzero tangent vector at P. A local parameter t normalized by v identifies the strict henselian punctured branch with its tame Kummer tower t^(1/n), n invertible in k. Define the fiber of a finite cover tame at P from its lift to this tower; prove coordinate independence up to the ordinary path torsor. This gives a fiber functor on covers tame at the boundary, its cyclic Tate inertia and its arithmetic section over k when the tangent is k-rational. In positive characteristic it concerns tame covers, not arbitrary wild covers or a free presentation of the full tame group.

Proof route:

1. Apply the strict-henselian tame local Kummer classification, with invertible indices.
2. Use changes of normalized parameter and henselian roots of units to identify the towers.
3. Check fiber-functor laws by finite tame descent and identify the arithmetic tangent section.

Prerequisites: [IG.0/finite-etale-covers](#IG-0-finite-etale-covers); [IG.0/geometric-fiber](#IG-0-geometric-fiber); [IG.0/basepoint-and-components](#IG-0-basepoint-and-components); [IG.1/decomposition-inertia](#IG-1-decomposition-inertia); [IG.1/tame-and-prime-to-p](#IG-1-tame-and-prime-to-p); tauceti:TauCetiRoadmap/BelyiMaps#layer-12-profinite-powers-the-fundamental-group-and-the-branch-cycle-theorem; tauceti:TauCetiRoadmap/BelyiMaps#layer-13-the-pro-ℓ-peripheral-theorem-and-faithfulness.

Uses:

- Wood3.13; IG.5 marked infinity: Produces the exact restricted marking used by these theorems.

API:

- TameTangentialFiber.obj (data): The fiber consists of lifts into the tame parameter tower.
- TameTangentialFiber.changeParameter (equivalence): Changing the normalized local parameter gives naturally isomorphic fiber functors, with the path ambiguity recorded.
- TameTangentialFiber.inertia (compatibility): Local inertia is the prime-to-characteristic Tate module, with the imported peripheral character convention.
- TameTangentialFiber.section (structure): A k-rational tangent gives an arithmetic section on the tame branch.

Tests:

- TameTangentialFiber.power_test (computation): For z^n=t, n invertible, the fiber has n elements and inertia rotates it transitively.
- TameTangentialFiber.unit_test (computation): For t′=t(1+t), the strict-henselian n-th root of 1+t identifies the two Kummer fibers.
- TameTangentialFiber.wild_test (non-example): In characteristic p the Artin–Schreier cover y^p−y=t⁻¹ is wild and is excluded from this tame fiber domain.

Acceptance:

- For z^n=t, n invertible, the fiber has n elements and inertia rotates it transitively.
- For t′=t(1+t), the strict-henselian n-th root of 1+t identifies the two Kummer fibers.
- In characteristic p the Artin–Schreier cover y^p−y=t⁻¹ is wild and is excluded from this tame fiber domain.

Sources:

- [sga1](#source-sga1), Exposé XIII §§2.1–2.4, printed pp.277–285; §§2.10–2.12 pp.289–290. Tame local models and the required prime-to-characteristic limitation.
- [wood](#source-wood), Definition3.12 and Theorem3.13, published pp.394–398. The restricted tangential convention used in the arithmetic lift comparison.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

<a id="IG-1-homogeneous-space-fundamental-group"></a>
#### Finite stabilizers and homogeneous fundamental groups

**IG.1/homogeneous-space-fundamental-group** · theorem.

Let k have characteristic zero, G/k be connected semisimple and algebraically simply connected, and V a homogeneous G-space with finite geometric stabilizer H at v. The pointed map G_kbar→V_kbar is an H-torsor universal finite étale cover, and π₁^ét(V_kbar,v)≃H. The arithmetic sequence is 1→H→π₁^ét(V,v)→Γ_k→1; without a rational point it supplies an outer action, not a chosen splitting.

Proof route:

1. Import the algebraic group and finite quotient carriers.
2. Over C prove π₁^ét(G,1)=1 using finite-cover comparison and the topological simply connected semisimple-group calculation; descend by characteristic-zero base extension.
3. Identify the quotient H-torsor and its deck group, then apply the arithmetic exact sequence.

Prerequisites: [IG.0/finite-etale-covers](#IG-0-finite-etale-covers); [IG.0/etale-fundamental-group](#IG-0-etale-fundamental-group); [IG.1/arithmetic-exact-sequence](#IG-1-arithmetic-exact-sequence); [IG.1/charzero-base-extension](#IG-1-charzero-base-extension); [IG.3/general-riemann-existence](#IG-3-general-riemann-existence); tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups; tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors.

Acceptance:

- For H=1, V_kbar=G_kbar has trivial geometric group.
- For G=SL₂ and H={±1}, PGL₂ has geometric fundamental group C₂.
- Gm is not semisimple and has infinite Tate fundamental group, so algebraic-group terminology alone cannot imply this theorem.

Sources:

- [harpaz-wittenberg20](#source-harpaz-wittenberg20), §5.1 and Proposition5.1 proof, arXiv v2 pp.18–19. Exact finite-stabilizer fundamental-group and outer-action interface.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Semisimple-group simply connected comparison.

### IG.2

Define scheme-point Hilbert subsets and thin sets, build guarded rational specialization, and establish number-field irreducibility, disjointness and local approximation. The norm map, quantitative thin-set bound, Frattini image criterion and absolute-Galois normal-subgroup continuation have separate statements.

<a id="IG-2-regular-subring"></a>
#### Rational functions regular at a point

**IG.2/regular-subring** · construction. Planet: Rational functions regular at a point.

For t ∈ K, construct the native subring Rₜ of K(T) whose elements are exactly f with denom(f)(t) ≠ 0, using the monic reduced denominator. Its operations and inclusion are inherited from K(T).

Hypotheses: K is an arbitrary field, with no characteristic assumption. T is the rational-function parameter and Y the separate polynomial variable. Additional hypotheses appear in the statement..

Proof route:

1. Use RatFunc.denom_zero and denom_one for the nullary operations.
2. RatFunc.denom_add_dvd and denom_mul_dvd reduce closure under addition and multiplication to nonvanishing of the product of the input denominators. Evaluation of a divisor of a polynomial with nonzero value is nonzero.
3. For negation, write −f = (−num(f))/denom(f) using RatFunc.num_div_denom; RatFunc.denom_dvd shows that denom(−f) divides denom(f). Bundle these closure facts with the native Subring constructor.

Prerequisites: mathlib:Subring; mathlib:Subring.subtype; mathlib:RatFunc.denom; mathlib:RatFunc.num; mathlib:RatFunc.denom_zero; mathlib:RatFunc.denom_one; mathlib:RatFunc.denom_ne_zero; mathlib:RatFunc.denom_add_dvd; mathlib:RatFunc.denom_mul_dvd; mathlib:RatFunc.denom_dvd; mathlib:RatFunc.num_div_denom; mathlib:RatFunc.denom_algebraMap; mathlib:Polynomial.evalRingHom.

Uses:

- Dèbes §5.2.2, specialization-map step in Proposition 5.2.5, printed p.138: Select a ring on which evaluation respects algebra, by excluding reduced coefficient poles.
- IG.2 rational specialization: Provide a native subring for Polynomial.toSubring and for the restriction of native evaluation.

API:

- TauCeti.RationalSpecialization.mem_regularSubring (characterisation): For f ∈ K(T), f belongs to Rₜ exactly when denom(f)(t) ≠ 0; this API item is the following membership node.
- TauCeti.RationalSpecialization.algebraMap_mem_regularSubring (coercion): Every image of q ∈ K[T] in K(T) belongs to Rₜ, since its reduced denominator is one.
- TauCeti.RationalSpecialization.regularSubring_le_iff (characterisation): For a native subring A of K(T), A ≤ Rₜ exactly when denom(f)(t) ≠ 0 for every f ∈ A. Use inherited Subring extensionality and operation laws.

Tests:

- TauCeti.RationalSpecialization.regularSubring.zero_test (degenerate): The zero rational function belongs to R₀ over ℚ.
- TauCeti.RationalSpecialization.regularSubring.cancellation_test (compatibility): Over ℚ, (T²−1)/(T−1) belongs to R₁ because its reduced representative is T+1.
- TauCeti.RationalSpecialization.regularSubring.pole_test (non-example): Over ℚ, T⁻¹ does not belong to R₀.

Acceptance:

- Reduction must cancel removable factors before deciding regularity.
- Rₜ is a subring, and the value zero alone does not certify a pole.

Sources:

- [mathlib-ratfunc](#source-mathlib-ratfunc), RatFunc.eval, eval_add and eval_mul; Basic reduced-denominator API. The node is a new interface or a stated deduction from the exact native declarations listed as prerequisites, not a claim that the source already declares this node.
- [debes](#source-debes), §5.2.1–5.2.2, printed pp.136–138. Motivation: specializing rational-coefficient polynomials requires a well-defined specialization map and a finite exceptional set. This elementary component does not prove Proposition 5.2.5 or Hilbert irreducibility.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-2-regular-membership"></a>
#### Membership by reduced denominator

**IG.2/regular-membership** · lemma.

For t ∈ K and f ∈ K(T), f ∈ Rₜ if and only if denom(f)(t) ≠ 0.

Hypotheses: K is an arbitrary field, with no characteristic assumption. T is the rational-function parameter and Y the separate polynomial variable. Additional hypotheses appear in the statement..

Proof route:

1. Unfold the carrier of regularSubring; the inherited subring structure does not change membership.

Prerequisites: [IG.2/regular-subring](#IG-2-regular-subring).

Acceptance:

- Both directions use the reduced denominator, including denom(0)=1.

Sources:

- [mathlib-ratfunc](#source-mathlib-ratfunc), RatFunc.eval, eval_add and eval_mul; Basic reduced-denominator API. The node is a new interface or a stated deduction from the exact native declarations listed as prerequisites, not a claim that the source already declares this node.
- [debes](#source-debes), §5.2.1–5.2.2, printed pp.136–138. Motivation: specializing rational-coefficient polynomials requires a well-defined specialization map and a finite exceptional set. This elementary component does not prove Proposition 5.2.5 or Hilbert irreducibility.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-2-regular-evaluation"></a>
#### Evaluation on the regular subring

**IG.2/regular-evaluation** · construction.

Construct eₜ : Rₜ → K as a native ring homomorphism, with eₜ(f)=RatFunc.eval(id,t,f). Thus its value is num(f)(t)/denom(f)(t).

Hypotheses: K is an arbitrary field, with no characteristic assumption. T is the rational-function parameter and Y the separate polynomial variable. Additional hypotheses appear in the statement..

Proof route:

1. Use regular-membership to supply the two nonvanishing hypotheses in each of RatFunc.eval_add and eval_mul.
2. Use RatFunc.eval_zero and eval_one for the remaining homomorphism fields. The underlying function is the existing evaluation, restricted to Rₜ.

Prerequisites: [IG.2/regular-subring](#IG-2-regular-subring); [IG.2/regular-membership](#IG-2-regular-membership); mathlib:RingHom; mathlib:RatFunc.eval; mathlib:RatFunc.eval_zero; mathlib:RatFunc.eval_one; mathlib:RatFunc.eval_add; mathlib:RatFunc.eval_mul; mathlib:RatFunc.eval_algebraMap.

Uses:

- IG.2 specialization-map-regular and conditional ring laws: Map the lifted coefficient polynomial along a genuine ring homomorphism.
- Dèbes §5.2.2, printed p.138: Supply the rational-coefficient part of a specialization morphism; extending across algebraic roots remains a separate obligation.

API:

- TauCeti.RationalSpecialization.evalRegular_apply (compatibility): For f ∈ Rₜ, eₜ(f) equals the native RatFunc.eval(id,t,f), including its normalized numerator and denominator convention.
- TauCeti.RationalSpecialization.evalRegular_polynomial (compatibility): For q ∈ K[T], evaluate its image in Rₜ using the canonical polynomial-membership proof: eₜ(q)=q(t).
- TauCeti.RationalSpecialization.evalRegular_surjective (other): The map eₜ is surjective onto K: a ∈ K is attained by the constant polynomial a. Ring-map operation laws come from the native bundle.

Tests:

- TauCeti.RationalSpecialization.evalRegular.one_test (degenerate): Over ℚ, e₀(1)=1.
- TauCeti.RationalSpecialization.evalRegular.parameter_test (computation): Over ℚ, e₃(T)=3, with T carried into R₃ by the polynomial inclusion.
- TauCeti.RationalSpecialization.evalRegular.kernel_test (non-example): Over ℚ, e₂(T−2)=0, so this ring map must allow a nontrivial kernel.

Acceptance:

- The evaluation map need not be injective: T−t is in its kernel.
- It is surjective since every constant value is attained.

Sources:

- [mathlib-ratfunc](#source-mathlib-ratfunc), RatFunc.eval, eval_add and eval_mul; Basic reduced-denominator API. The node is a new interface or a stated deduction from the exact native declarations listed as prerequisites, not a claim that the source already declares this node.
- [debes](#source-debes), §5.2.1–5.2.2, printed pp.136–138. Motivation: specializing rational-coefficient polynomials requires a well-defined specialization map and a finite exceptional set. This elementary component does not prove Proposition 5.2.5 or Hilbert irreducibility.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-2-polynomial-specialization"></a>
#### Rational-coefficient polynomial specialization

**IG.2/polynomial-specialization** · construction. Planet: Rational-coefficient polynomial specialization.

For t ∈ K and p=Σₙ cₙ(T)Yⁿ ∈ K(T)[Y], define spₜ(p)=Σₙ RatFunc.eval(id,t,cₙ)Yⁿ ∈ K[Y], using a finite sum over the native support of p. This is a total function. Ring laws are asserted only when all input coefficients are regular at t.

Hypotheses: K is an arbitrary field, with no characteristic assumption. T is the rational-function parameter and Y the separate polynomial variable. Additional hypotheses appear in the statement..

Proof route:

1. Use Polynomial.sum with monomial n (RatFunc.eval(id,t,cₙ)); no new polynomial carrier is introduced.
2. RatFunc.eval_zero ensures that coefficients outside the original support remain zero. Keep the total coefficient function distinct from the ring map defined on Rₜ.

Prerequisites: mathlib:Polynomial.sum; mathlib:RatFunc.eval; mathlib:RatFunc.eval_zero; mathlib:Polynomial.coeff_monomial.

Uses:

- Dèbes §5.2.1 Hilbert subsets, printed p.136: Give a precise one-parameter, one-variable meaning to P(t,Y) using the existing reduced-fraction evaluation.
- IG.2 specialization-degree and IG.6 explicit specializations: Keep the outer variable and its coefficients visible, so degree loss can be checked before arithmetic conclusions are transported.

API:

- TauCeti.RationalSpecialization.coeff_specialize (projection): The coefficient of Yⁿ in spₜ(p) is RatFunc.eval(id,t,p.coeff(n)); this API item is the following coefficient node.
- TauCeti.RationalSpecialization.specialize_C (simp): For f ∈ K(T), spₜ(C(f))=C(RatFunc.eval(id,t,f)).
- TauCeti.RationalSpecialization.specialize_X (simp): Specialization fixes Y, the outer polynomial variable, for every t.
- TauCeti.RationalSpecialization.specialize_zero (simp): Specialization sends the zero polynomial to zero for every t.
- TauCeti.RationalSpecialization.specialize_polynomialCoefficients (compatibility): For p ∈ K[T][Y], first map its coefficients into K(T) and then specialize; the result equals the native Polynomial.map along evaluation K[T] → K at t.

Tests:

- TauCeti.RationalSpecialization.specialize.zero_test (degenerate): Over ℚ, sp₀(0)=0.
- TauCeti.RationalSpecialization.specialize.quadratic_test (computation): Over ℚ, sp₂(Y²−T)=Y²−2.
- TauCeti.RationalSpecialization.specialize.pole_multiplication_test (non-example): Over ℚ at t=0, sp₀(C(T)C(T⁻¹))=1 while sp₀(C(T))sp₀(C(T⁻¹))=0.
- TauCeti.RationalSpecialization.specialize.degree_drop_test (non-example): Over ℚ, sp₀(TY+1)=1 has natural degree zero even though TY+1 has degree one and every coefficient is regular at zero.

Acceptance:

- The variable T is replaced by t; the polynomial variable Y is unchanged.
- At poles the total function still returns a polynomial, but its multiplication law can fail.

Sources:

- [mathlib-ratfunc](#source-mathlib-ratfunc), RatFunc.eval, eval_add and eval_mul; Basic reduced-denominator API. The node is a new interface or a stated deduction from the exact native declarations listed as prerequisites, not a claim that the source already declares this node.
- [debes](#source-debes), §5.2.1–5.2.2, printed pp.136–138. Motivation: specializing rational-coefficient polynomials requires a well-defined specialization map and a finite exceptional set. This elementary component does not prove Proposition 5.2.5 or Hilbert irreducibility.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-2-specialization-coefficients"></a>
#### Coefficients after specialization

**IG.2/specialization-coefficients** · lemma.

For every t ∈ K, p ∈ K(T)[Y] and n ∈ ℕ, the coefficient of Yⁿ in spₜ(p) is RatFunc.eval(id,t,p.coeff(n)).

Hypotheses: K is an arbitrary field, with no characteristic assumption. T is the rational-function parameter and Y the separate polynomial variable. Additional hypotheses appear in the statement..

Proof route:

1. Apply Polynomial.coeff_sum and coeff_monomial to the finite defining sum.
2. At an index in p.support only its own term survives; outside support the coefficient is zero by Polynomial.mem_support_iff and RatFunc.eval_zero.

Prerequisites: [IG.2/polynomial-specialization](#IG-2-polynomial-specialization); mathlib:Polynomial.coeff_sum; mathlib:Polynomial.coeff_monomial; mathlib:Polynomial.mem_support_iff; mathlib:RatFunc.eval_zero.

Acceptance:

- The statement holds at a pole as a statement about the total function.

Sources:

- [mathlib-polynomial](#source-mathlib-polynomial), Polynomial.coeff_sum, coeff_monomial and mem_support_iff. The node is a new interface or a stated deduction from the exact native declarations listed as prerequisites, not a claim that the source already declares this node.
- [debes](#source-debes), §5.2.1–5.2.2, printed pp.136–138. Motivation: specializing rational-coefficient polynomials requires a well-defined specialization map and a finite exceptional set. This elementary component does not prove Proposition 5.2.5 or Hilbert irreducibility.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-2-specialization-map-regular"></a>
#### Compatibility with polynomial coefficient maps

**IG.2/specialization-map-regular** · lemma.

For q ∈ Rₜ[Y], spₜ(map(inclusion,q))=map(eₜ,q), where inclusion is the native map Rₜ → K(T).

Hypotheses: K is an arbitrary field, with no characteristic assumption. T is the rational-function parameter and Y the separate polynomial variable. Additional hypotheses appear in the statement..

Proof route:

1. Use specialization-coefficients on the left and Polynomial.coeff_map on both polynomial maps.
2. The resulting coefficient equality is the defining underlying function of evalRegular. Apply Polynomial.ext.

Prerequisites: [IG.2/regular-subring](#IG-2-regular-subring); [IG.2/regular-evaluation](#IG-2-regular-evaluation); [IG.2/specialization-coefficients](#IG-2-specialization-coefficients); mathlib:Subring.subtype; mathlib:Polynomial.map; mathlib:Polynomial.coeff_map; mathlib:Polynomial.ext.

Acceptance:

- The right side is an actual polynomial ring map on a domain where evaluation is defined.

Sources:

- [mathlib-polynomial](#source-mathlib-polynomial), Polynomial.coeff_map and Polynomial.ext. The node is a new interface or a stated deduction from the exact native declarations listed as prerequisites, not a claim that the source already declares this node.
- [debes](#source-debes), §5.2.1–5.2.2, printed pp.136–138. Motivation: specializing rational-coefficient polynomials requires a well-defined specialization map and a finite exceptional set. This elementary component does not prove Proposition 5.2.5 or Hilbert irreducibility.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-2-specialization-add"></a>
#### Specialization preserves addition

**IG.2/specialization-add** · lemma.

For p,q ∈ K(T)[Y] whose every coefficient has nonzero denominator at t, spₜ(p + q)=spₜ(p) + spₜ(q).

Hypotheses: K is an arbitrary field, with no characteristic assumption. T is the rational-function parameter and Y the separate polynomial variable. Additional hypotheses appear in the statement..

Proof route:

1. Use regular-membership to lift p and q with the existing Polynomial.toSubring; Polynomial.map_toSubring recovers p and q under inclusion.
2. Apply Polynomial.map_add to the lifted polynomials, then specialization-map-regular to their sum.
3. Apply Polynomial.map_add for eₜ and identify both factors using specialization-map-regular. No unrestricted ring map K(T) → K is constructed.

Prerequisites: [IG.2/regular-membership](#IG-2-regular-membership); [IG.2/specialization-map-regular](#IG-2-specialization-map-regular); mathlib:Polynomial.toSubring; mathlib:Polynomial.map_toSubring; mathlib:Polynomial.map_add.

Acceptance:

- Every coefficient-regularity hypothesis is retained; the multiplication pole test fails if it is removed.

Sources:

- [mathlib-polynomial](#source-mathlib-polynomial), Polynomial.toSubring, map_toSubring and map_add. The node is a new interface or a stated deduction from the exact native declarations listed as prerequisites, not a claim that the source already declares this node.
- [debes](#source-debes), §5.2.1–5.2.2, printed pp.136–138. Motivation: specializing rational-coefficient polynomials requires a well-defined specialization map and a finite exceptional set. This elementary component does not prove Proposition 5.2.5 or Hilbert irreducibility.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-2-specialization-mul"></a>
#### Specialization preserves multiplication

**IG.2/specialization-mul** · lemma.

For p,q ∈ K(T)[Y] whose every coefficient has nonzero denominator at t, spₜ(p · q)=spₜ(p) · spₜ(q).

Hypotheses: K is an arbitrary field, with no characteristic assumption. T is the rational-function parameter and Y the separate polynomial variable. Additional hypotheses appear in the statement..

Proof route:

1. Use regular-membership to lift p and q with the existing Polynomial.toSubring; Polynomial.map_toSubring recovers p and q under inclusion.
2. Apply Polynomial.map_mul to the lifted polynomials, then specialization-map-regular to their product.
3. Apply Polynomial.map_mul for eₜ and identify both factors using specialization-map-regular. No unrestricted ring map K(T) → K is constructed.

Prerequisites: [IG.2/regular-membership](#IG-2-regular-membership); [IG.2/specialization-map-regular](#IG-2-specialization-map-regular); mathlib:Polynomial.toSubring; mathlib:Polynomial.map_toSubring; mathlib:Polynomial.map_mul.

Acceptance:

- Every coefficient-regularity hypothesis is retained; the multiplication pole test fails if it is removed.

Sources:

- [mathlib-polynomial](#source-mathlib-polynomial), Polynomial.toSubring, map_toSubring and map_mul. The node is a new interface or a stated deduction from the exact native declarations listed as prerequisites, not a claim that the source already declares this node.
- [debes](#source-debes), §5.2.1–5.2.2, printed pp.136–138. Motivation: specializing rational-coefficient polynomials requires a well-defined specialization map and a finite exceptional set. This elementary component does not prove Proposition 5.2.5 or Hilbert irreducibility.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-2-denominator-product"></a>
#### Denominator product of a polynomial

**IG.2/denominator-product** · construction.

For p ∈ K(T)[Y], define D(p) ∈ K[T] to be the product over n ∈ p.support of denom(p.coeff(n)). It is a product with repetitions, not a least common denominator. The empty product for p=0 is one.

Hypotheses: K is an arbitrary field, with no characteristic assumption. T is the rational-function parameter and Y the separate polynomial variable. Additional hypotheses appear in the statement..

Proof route:

1. Use the native finite coefficient support and RatFunc.denom; multiplication occurs in K[T].
2. The choice of native reduced denominator makes D intrinsic to p. Coefficients that are zero contribute no support index; their denominator would be one.

Prerequisites: mathlib:RatFunc.denom; mathlib:RatFunc.denom_zero; mathlib:RatFunc.denom_algebraMap; mathlib:Polynomial.mem_support_iff.

Uses:

- IG.2 specialization-guard and finite-bad-specializations: Replace all coefficient-domain conditions by one nonzero polynomial whose root set is finite.
- Dèbes Proposition 5.2.5, printed pp.137–138: Isolate the elementary rational-coefficient contribution to the finite exceptional set, without claiming to account for algebraic-root specialization.

API:

- TauCeti.RationalSpecialization.denominatorProduct_zero (simp): D(0)=1.
- TauCeti.RationalSpecialization.denominatorProduct_C (simp): For f ∈ K(T), D(C(f))=denom(f), including f=0.
- TauCeti.RationalSpecialization.denominatorProduct_polynomialCoefficients (compatibility): For p ∈ K[T][Y], the polynomial obtained by mapping coefficients into K(T) has denominator product one.

Tests:

- TauCeti.RationalSpecialization.denominatorProduct.zero_test (degenerate): Over ℚ, D(0)=1.
- TauCeti.RationalSpecialization.denominatorProduct.repeated_pole_test (computation): Over ℚ, D(T⁻¹Y+T⁻¹)=T², not T.
- TauCeti.RationalSpecialization.denominatorProduct.cancellation_test (compatibility): Over ℚ, D(C((T²−1)/(T−1)))=1.

Acceptance:

- Repeated denominator factors remain repeated in D.
- Apparent poles removed by cancellation contribute no factor.

Sources:

- [mathlib-ratfunc](#source-mathlib-ratfunc), RatFunc.eval, eval_add and eval_mul; Basic reduced-denominator API. The node is a new interface or a stated deduction from the exact native declarations listed as prerequisites, not a claim that the source already declares this node.
- [debes](#source-debes), §5.2.1–5.2.2, printed pp.136–138. Motivation: specializing rational-coefficient polynomials requires a well-defined specialization map and a finite exceptional set. This elementary component does not prove Proposition 5.2.5 or Hilbert irreducibility.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-2-denominator-product-nonzero"></a>
#### Nonvanishing denominator product

**IG.2/denominator-product-nonzero** · lemma.

For every p ∈ K(T)[Y], D(p) is a nonzero polynomial in K[T], including p=0.

Hypotheses: K is an arbitrary field, with no characteristic assumption. T is the rational-function parameter and Y the separate polynomial variable. Additional hypotheses appear in the statement..

Proof route:

1. Every factor is nonzero by RatFunc.denom_ne_zero. A finite product in the domain K[T] is nonzero, with empty product one.

Prerequisites: [IG.2/denominator-product](#IG-2-denominator-product); mathlib:RatFunc.denom_ne_zero.

Acceptance:

- This theorem does not say D(p)(t) is nonzero at every t.

Sources:

- [mathlib-ratfunc](#source-mathlib-ratfunc), RatFunc.eval, eval_add and eval_mul; Basic reduced-denominator API. The node is a new interface or a stated deduction from the exact native declarations listed as prerequisites, not a claim that the source already declares this node.
- [debes](#source-debes), §5.2.1–5.2.2, printed pp.136–138. Motivation: specializing rational-coefficient polynomials requires a well-defined specialization map and a finite exceptional set. This elementary component does not prove Proposition 5.2.5 or Hilbert irreducibility.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-2-denominator-product-domain"></a>
#### The exact coefficient-regularity locus

**IG.2/denominator-product-domain** · lemma.

For all p ∈ K(T)[Y] and t ∈ K, D(p)(t) ≠ 0 if and only if denom(p.coeff(n))(t) ≠ 0 for every n ∈ ℕ.

Hypotheses: K is an arbitrary field, with no characteristic assumption. T is the rational-function parameter and Y the separate polynomial variable. Additional hypotheses appear in the statement..

Proof route:

1. Polynomial.eval_prod turns D(p)(t) into a finite product of denominator values. A product over a field is nonzero exactly when each factor is nonzero.
2. Outside p.support the coefficient is zero, so RatFunc.denom_zero supplies denominator one. Extend the finite conjunction to all n.

Prerequisites: [IG.2/denominator-product](#IG-2-denominator-product); mathlib:Polynomial.eval_prod; mathlib:Polynomial.mem_support_iff; mathlib:RatFunc.denom_zero.

Acceptance:

- For p=0 the equivalence has two true sides.

Sources:

- [mathlib-polynomial](#source-mathlib-polynomial), Polynomial.eval_prod and mem_support_iff. The node is a new interface or a stated deduction from the exact native declarations listed as prerequisites, not a claim that the source already declares this node.
- [debes](#source-debes), §5.2.1–5.2.2, printed pp.136–138. Motivation: specializing rational-coefficient polynomials requires a well-defined specialization map and a finite exceptional set. This elementary component does not prove Proposition 5.2.5 or Hilbert irreducibility.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-2-specialization-degree"></a>
#### Degree preservation by the leading coefficient

**IG.2/specialization-degree** · lemma.

If RatFunc.eval(id,t,leadingCoeff(p)) ≠ 0, then natDegree(spₜ(p))=natDegree(p). This sufficient condition needs no additional hypothesis on lower coefficients for the total coefficient function.

Hypotheses: K is an arbitrary field, with no characteristic assumption. T is the rational-function parameter and Y the separate polynomial variable. Additional hypotheses appear in the statement..

Proof route:

1. Above natDegree(p), Polynomial.coeff_eq_zero_of_natDegree_lt and RatFunc.eval_zero make all specialized coefficients zero; apply Polynomial.natDegree_le_iff_coeff_eq_zero.
2. At natDegree(p), specialization-coefficients identifies the coefficient with the assumed nonzero leading-coefficient value. Apply Polynomial.natDegree_eq_of_le_of_coeff_ne_zero.

Prerequisites: [IG.2/specialization-coefficients](#IG-2-specialization-coefficients); mathlib:Polynomial.coeff_eq_zero_of_natDegree_lt; mathlib:Polynomial.natDegree_le_iff_coeff_eq_zero; mathlib:Polynomial.natDegree_eq_of_le_of_coeff_ne_zero; mathlib:RatFunc.eval_zero.

Acceptance:

- TY+1 at t=0 fails the hypothesis and loses degree.
- At a regular point a vanishing leading coefficient can give a lower-degree irreducible polynomial; irreducibility alone does not preserve degree.

Sources:

- [mathlib-polynomial](#source-mathlib-polynomial), Polynomial.natDegree_eq_of_le_of_coeff_ne_zero and high-coefficient tests. The node is a new interface or a stated deduction from the exact native declarations listed as prerequisites, not a claim that the source already declares this node.
- [debes](#source-debes), §5.2.1–5.2.2, printed pp.136–138. Motivation: specializing rational-coefficient polynomials requires a well-defined specialization map and a finite exceptional set. This elementary component does not prove Proposition 5.2.5 or Hilbert irreducibility.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-2-specialization-guard"></a>
#### A polynomial guard for regular specialization

**IG.2/specialization-guard** · theorem.

If (D(p)·num(leadingCoeff(p)))(t) ≠ 0, then every coefficient of p is regular at t and natDegree(spₜ(p))=natDegree(p).

Hypotheses: K is an arbitrary field, with no characteristic assumption. T is the rational-function parameter and Y the separate polynomial variable. Additional hypotheses appear in the statement..

Proof route:

1. The nonzero product value gives D(p)(t) ≠ 0 and num(leadingCoeff(p))(t) ≠ 0. Apply denominator-product-domain.
2. Apply coefficient regularity at n=natDegree(p) to its leading coefficient. The defining fraction in RatFunc.eval is nonzero since both numerator and denominator values are nonzero.
3. Apply specialization-degree.

Prerequisites: [IG.2/denominator-product-domain](#IG-2-denominator-product-domain); [IG.2/specialization-degree](#IG-2-specialization-degree); mathlib:RatFunc.eval; mathlib:RatFunc.num; mathlib:Polynomial.evalRingHom.

Acceptance:

- For p=TY+1 the guard includes T, so t=0 is excluded.
- The guard ensures degree and regularity; it does not ensure irreducibility.

Sources:

- [mathlib-ratfunc](#source-mathlib-ratfunc), RatFunc.eval, eval_add and eval_mul; Basic reduced-denominator API. The node is a new interface or a stated deduction from the exact native declarations listed as prerequisites, not a claim that the source already declares this node.
- [debes](#source-debes), §5.2.1–5.2.2, printed pp.136–138. Motivation: specializing rational-coefficient polynomials requires a well-defined specialization map and a finite exceptional set. This elementary component does not prove Proposition 5.2.5 or Hilbert irreducibility.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-2-finite-bad-specializations"></a>
#### Finiteness of bad specialization parameters

**IG.2/finite-bad-specializations** · theorem.

For nonzero p ∈ K(T)[Y], the set of t ∈ K where either a coefficient has a pole or natDegree(spₜ(p)) differs from natDegree(p) is finite.

Hypotheses: K is an arbitrary field, with no characteristic assumption. T is the rational-function parameter and Y the separate polynomial variable. Additional hypotheses appear in the statement..

Proof route:

1. The polynomial G=D(p)·num(leadingCoeff(p)) is nonzero: use denominator-product-nonzero, Polynomial.leadingCoeff_ne_zero and RatFunc.num_ne_zero.
2. The contrapositive of specialization-guard puts every bad parameter in the root set of G.
3. Apply Polynomial.finite_setOfPred_isRoot and Set.Finite.subset. This is valid over finite fields too, without asserting existence of a good parameter.

Prerequisites: [IG.2/denominator-product-nonzero](#IG-2-denominator-product-nonzero); [IG.2/specialization-guard](#IG-2-specialization-guard); mathlib:Polynomial.leadingCoeff_ne_zero; mathlib:RatFunc.num_ne_zero; mathlib:Polynomial.finite_setOfPred_isRoot; mathlib:Set.Finite.subset.

Acceptance:

- Y²−T is regular and degree two at every t, although its irreducibility changes.
- Over F₂, (T²−T)Y+1 loses degree at every parameter; finiteness remains true.

Sources:

- [mathlib-roots](#source-mathlib-roots), Polynomial.finite_setOfPred_isRoot and Set.Finite.subset. The node is a new interface or a stated deduction from the exact native declarations listed as prerequisites, not a claim that the source already declares this node.
- [debes](#source-debes), §5.2.1–5.2.2, printed pp.136–138. Motivation: specializing rational-coefficient polynomials requires a well-defined specialization map and a finite exceptional set. This elementary component does not prove Proposition 5.2.5 or Hilbert irreducibility.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-2-simultaneous-finite-avoidance"></a>
#### Simultaneous avoidance for a finite polynomial family

**IG.2/simultaneous-finite-avoidance** · theorem.

Let K be infinite, s a finite set of nonzero polynomials in K(T)[Y], and A a finite subset of K. There exists t ∈ K outside A such that every coefficient of every p ∈ s is regular at t and every spₜ(p) has the same natural degree as p.

Hypotheses: K is an arbitrary field, with no characteristic assumption. T is the rational-function parameter and Y the separate polynomial variable. Additional hypotheses appear in the statement..

Proof route:

1. For each p ∈ s, finite-bad-specializations supplies a finite bad set. Induct on s using Set.Finite.union to unite them and A.
2. Use Set.Finite.exists_notMem in the infinite field K to choose t outside that union. Its nonmembership gives each regularity and degree assertion.

Prerequisites: [IG.2/finite-bad-specializations](#IG-2-finite-bad-specializations); mathlib:Set.Finite.union; mathlib:Set.Finite.exists_notMem.

Acceptance:

- The empty family reduces to avoiding A.
- The statement must not be read as preserving irreducibility, prescribed Galois groups or linear disjointness.

Sources:

- [mathlib-roots](#source-mathlib-roots), Set.Finite.union and Set.Finite.exists_notMem. The node is a new interface or a stated deduction from the exact native declarations listed as prerequisites, not a claim that the source already declares this node.
- [debes](#source-debes), §5.2.1–5.2.2, printed pp.136–138. Motivation: specializing rational-coefficient polynomials requires a well-defined specialization map and a finite exceptional set. This elementary component does not prove Proposition 5.2.5 or Hilbert irreducibility.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-2-hilbert-subsets"></a>
#### Hilbert subsets and Hilbertian fields

**IG.2/hilbert-subsets** · definition. Planet: Hilbert subsets.

For an integral k-variety X, a Hilbert datum consists of a nonempty open U⊂X and finitely many finite étale morphisms V_i→U with V_i integral. Its subset of scheme points consists of x∈U such that each fiber V_i×_U Spec κ(x) is connected. Rational and closed-point membership are the corresponding restrictions. For A¹ over a characteristic-zero field k, the polynomial form uses finitely many irreducible separable polynomials in k(T)[Y] of positive Y-degree, with the regularity and nonzero guards of the rational specialization component. Call k Hilbertian if every such one-variable Hilbert datum has a rational point; the infinitude and finite avoidance consequences are separate theorems.

Proof route:

1. Define connected fibers on actual scheme points, not only k-points.
2. Translate finite étale affine covers into guarded polynomial factorizations and compare fiber connectedness with irreducibility.

Prerequisites: [IG.0/finite-etale-covers](#IG-0-finite-etale-covers); [IG.0/geometric-fiber](#IG-0-geometric-fiber); [IG.2/specialization-guard](#IG-2-specialization-guard); SchemeAndStackFoundations:SF.0.

Uses:

- Harpaz–Wittenberg Theorem4.2: Norm pullback needs a residue-field, not a rational-point-only, notion.
- IG.2 full-group specialization: Connected G-torsor fibers give the full group.

API:

- HilbertSubset.mem (characterisation): Membership is connectedness of every finite étale fiber at the residue field.
- HilbertSubset.inter (constructor): Finite intersections over the same variety are represented by the combined datum and intersected open.
- HilbertSubset.rationalRestriction (projection): Rational membership evaluates fibers over k, while closed membership uses the residue extension.
- HilbertSubset.polynomialComparison (equivalence): The guarded polynomial datum gives exactly irreducible specialized polynomials of the required degree.

Tests:

- HilbertSubset.square_test (computation): For Y²−T over Q on Gm, a rational t belongs exactly when t is not a rational square.
- HilbertSubset.generic_test (computation): The generic point belongs when each V_i is integral.
- HilbertSubset.residue_test (non-example): For the identity open datum every nonrational closed point belongs; a rational-point-only carrier would lose it.

Acceptance:

- For Y²−T over Q on Gm, a rational t belongs exactly when t is not a rational square.
- The generic point belongs when each V_i is integral.
- For the identity open datum every nonrational closed point belongs; a rational-point-only carrier would lose it.

Sources:

- [debes](#source-debes), §5.2 Definition5.2.2, printed pp.135–137. Polynomial Hilbert subsets require regular coefficients and preserved degrees.
- [harpaz-wittenberg20](#source-harpaz-wittenberg20), §1.1 p.6. Hilbert subsets are defined at all scheme points.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

<a id="IG-2-number-field-hilbert"></a>
#### Hilbert irreducibility over number fields

**IG.2/number-field-hilbert** · theorem. Planet: Hilbert irreducibility.

Every number field is Hilbertian. Given finitely many irreducible separable positive-Y-degree polynomials over K(T₁,…,T_r), r≥1, and a nonzero parameter guard, their simultaneous Hilbert set in K^r is Zariski dense. In one variable it remains infinite after avoiding any finite set. This strengthens coefficient regularity and degree preservation by adding irreducibility, and requires the arithmetic proof of Hilbert irreducibility.

Proof route:

1. Use the selected Hilbert-irreducibility proof, with Dörge’s arithmetic estimate, to obtain a nonempty Hilbert subset of a lattice of integral parameters.
2. Reduce finitely many conditions to one by the fiber product/primitive-element argument, then preserve a guard by intersecting an open.
3. Iterate outside finite avoidance sets; for several parameters use affine-line slicing with the nonzero coefficients controlled.

Prerequisites: [IG.2/hilbert-subsets](#IG-2-hilbert-subsets); [IG.2/simultaneous-finite-avoidance](#IG-2-simultaneous-finite-avoidance); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

Acceptance:

- Y²−T has infinitely many nonsquare rational specializations.
- A number-field assumption is essential; over an algebraically closed field every specialized quadratic splits.

Sources:

- [debes](#source-debes), §§5.3–5.4, printed pp.138–153. Gives the number-field Hilbert proof and the simultaneous form.
- [serre](#source-serre), §3.4 Theorem3.4.1 and §3.4, printed pp.25–30. States Hilbertian number fields and the thin-set formulation.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration. Only the one-parameter single-polynomial consequence is typed; finite families, nonzero guards, multiple parameters and Zariski density remain whole declaration obligations.

<a id="IG-2-thin-sets"></a>
#### Thin sets for specialization

**IG.2/thin-sets** · definition.

For an integral variety X over a characteristic-zero field k, a subset of X(k) is thin if it lies in a finite union of rational points of proper closed subvarieties and images Y(k)→X(k) of dominant generically finite separable maps of degree≥2 with Y integral and no rational section at the generic point. Use the field degree, not merely the size of a fiber. Complements of full-group Hilbert conditions on affine space contain the complement of a thin set after excluding branch and coefficient guards.

Proof route:

1. Construct the two types of thin datum and their finite-union relation.
2. For proper subgroups of the generic Galois group use quotient covers; failure of full image lies in their rational images.

Prerequisites: [IG.2/hilbert-subsets](#IG-2-hilbert-subsets); SchemeAndStackFoundations:SF.0.

Uses:

- Masser–Zannier Lemma5.1: Integral thin-set counts measure bad ℓ-adic image specializations.

API:

- ThinSet.closed (constructor): Rational points of a proper closed subvariety form a thin set.
- ThinSet.coverImage (constructor): A degree≥2 generically finite separable integral cover supplies a thin image.
- ThinSet.union (structure): Finite unions and subsets of thin sets are thin.
- ThinSet.fullGroupComplement (compatibility): The bad full-group specializations are contained in a thin set plus the displayed guard divisor.

Tests:

- ThinSet.squares_test (computation): Squares in Q are a thin image of z↦z².
- ThinSet.affineSpace_test (non-example): Q^r is not thin for r≥1 by Hilbert irreducibility.
- ThinSet.identity_test (non-example): The identity map has degree one and does not qualify as a type-II thin datum.

Acceptance:

- Squares in Q are a thin image of z↦z².
- Q^r is not thin for r≥1 by Hilbert irreducibility.
- The identity map has degree one and does not qualify as a type-II thin datum.

Sources:

- [serre](#source-serre), §3.1 Definitions3.1.1/3.1.2 and §3.3, printed pp.19–27. Finite unions of the two geometric types and their Hilbert interpretation.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

<a id="IG-2-regular-full-group"></a>
#### Full-group specialization of regular covers

**IG.2/regular-full-group** · theorem. Planet: Regular full-group specialization.

Let K be a number field and L/K(T) a finite Galois extension with group G such that K is algebraically closed in L. Its normalization is a geometrically connected G-cover over an open U⊂P¹_K. For infinitely many t∈U(K), avoiding any prescribed finite set, the fiber is Spec L_t for a field with Gal(L_t/K)≃G. The isomorphism uses the chosen G-action and is defined up to conjugacy after changing the fiber marking. For a defining polynomial retain the nonzero denominator, discriminant and leading-coefficient guards; a full-group specialization cannot be inferred from degree alone.

Proof route:

1. Build a finite étale G-torsor over the branch complement and record geometric connectedness from regularity.
2. Apply number-field Hilbert irreducibility to connectedness of its finite fiber; a connected G-torsor is a G-Galois field.
3. Translate into polynomial conditions using the native specialization map and a primitive element.

Prerequisites: [IG.2/number-field-hilbert](#IG-2-number-field-hilbert); [IG.0/finite-galois-algebras](#IG-0-finite-galois-algebras); [IG.1/decomposition-inertia](#IG-1-decomposition-inertia); [IG.2/thin-sets](#IG-2-thin-sets); SchemeAndStackFoundations:SF.0.

Acceptance:

- The C₂ cover Y²=T has full image at a nonsquare and loses full image at a square.

Sources:

- [serre](#source-serre), §3.3 Proposition3.3.1 and §3.4, printed pp.25–30. Hilbert specialization preserves a regular cover’s full Galois group.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

<a id="IG-2-disjoint-specializations"></a>
#### Infinitely many linearly disjoint full-group fibers

**IG.2/disjoint-specializations** · theorem.

Under the regular-cover hypotheses, for every finite extension M/K there are infinitely many t giving full-group L_t/K with L_t linearly disjoint from M. There is a sequence of such fibers that is mutually linearly disjoint (each new field disjoint from the compositum of its predecessors). If G≠1 they are pairwise distinct. The trivial-group case gives K repeatedly and must not claim infinitely many distinct extensions.

Proof route:

1. Base-change the regular torsor by a Galois closure of M; regularity keeps its generic connectedness.
2. Apply the Hilbert condition for full geometric action after this base change and compare the combined arithmetic group.
3. Choose parameters recursively, including all previous parameters and the previous field compositum in the avoidance datum.

Prerequisites: [IG.2/regular-full-group](#IG-2-regular-full-group); [IG.2/number-field-hilbert](#IG-2-number-field-hilbert); [IG.0/finite-galois-algebras](#IG-0-finite-galois-algebras).

Acceptance:

- For a fixed quadratic M/Q choose a quadratic specialization distinct from M; the theorem excludes an arbitrary fixed finite compositum too.

Sources:

- [serre](#source-serre), §3.3–3.4, printed pp.25–30. The regular Hilbert specialization method allows disjointness from a fixed finite extension.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

<a id="IG-2-hilbert-local-conditions"></a>
#### Hilbert specialization with local conditions

**IG.2/hilbert-local-conditions** · theorem.

For a number field K, a Hilbert subset H⊂A^r_K, and a finite set S of places, H(K) is dense in ∏_{v∈S}A^r(K_v). Thus any nonempty product of prescribed local open conditions contains a full-group specialization outside any additional nonzero guard. The statement is for affine parameter space; weak approximation on an arbitrary variety is not assumed. In the BCDT application use its rational modular parameter line and its actual 3-adic open condition.

Proof route:

1. Apply IG.2/general-hilbert-local-approximation: affine space has weak approximation for all finite place sets, and the complement of this Hilbert condition is thin.
2. Intersect the local opens with the guard complement and take a Hilbert point; use local constancy of finite étale algebra isomorphism types to express extension prescriptions.

Prerequisites: [IG.2/number-field-hilbert](#IG-2-number-field-hilbert); [IG.2/regular-full-group](#IG-2-regular-full-group); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence; [IG.2/general-hilbert-local-approximation](#IG-2-general-hilbert-local-approximation).

Acceptance:

- Quadratic nonsquares occur in any nonempty prescribed finite collection of local parameter opens.
- Nonempty opens and a genuine Hilbert condition are required; a closed exact-value constraint can force splitting.

Sources:

- [bcdt](#source-bcdt), Theorem2.2.1 proof, author PDF p.19 / published p.864, citing Ekedahl Theorem1.3. The proof requires local Hilbert conditions, not ordinary irreducibility alone.
- [serre](#source-serre), §9.2, printed pp.88–91. Local constancy of specialized finite covers supplies the neighborhood condition.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Quantitative and local Hilbert proof sources.

<a id="IG-2-norm-pullback-hilbert"></a>
#### Hilbert pullback through geometrically integral norm maps

**IG.2/norm-pullback-hilbert** · theorem.

For the norm map b:Q′→Q between quasi-trivial tori in the Harpaz–Wittenberg construction, with geometrically integral generic fiber, and a Hilbert subset H⊂Q, construct a Hilbert subset H′⊂Q′ contained in b⁻¹(H), with H′(k)=b⁻¹(H)(k) in that construction. Track membership at all scheme points through connected residue-field fibers; do not assert equality of every scheme-point subset merely from the rational-point equality. The general pullback theorem needs geometrically integral generic fiber and the specified shrinking of the open domain.

Proof route:

1. Pull back the finite cover datum to the generic fiber, using geometric integrality to retain irreducibility.
2. Shrink the domain until each pullback is finite étale and integral; compare its rational fibers.
3. Use the norm map’s exact torus construction and field embeddings, with all-point inclusion verified separately.

Prerequisites: [IG.2/hilbert-subsets](#IG-2-hilbert-subsets); ReductiveGroupsPartII:RG2.0a; SchemeAndStackFoundations:SF.0; ReductiveGroupsPartII:RG2.0a/norm-torus.

Acceptance:

- For the identity norm map the Hilbert set is unchanged.
- A finite disconnected generic norm fiber cannot be substituted for a geometrically integral one.

Sources:

- [harpaz-wittenberg20](#source-harpaz-wittenberg20), Proof of Theorem4.2, arXiv v2 pp.13–17. Uses the norm map and geometrically integral pullback in the Hilbert condition.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Norm Hilbert all-point comparison.

<a id="IG-2-frattini-full-image"></a>
#### Frattini detection of full profinite image

**IG.2/frattini-full-image** · theorem.

Let P be profinite and let its Frattini subgroup Φ(P) be open. A closed subgroup J≤P equals P if its image in P/Φ(P) is all of that finite quotient. Apply this to a specialization image of a continuous family representation: a Hilbert condition preserving the finite Frattini quotient forces the full original image. For compact ℓ-adic analytic groups, openness of Φ is a distinct structural input with its exact hypotheses; it is not asserted for all profinite groups. Here Φ(P) is the intersection of the maximal proper open subgroups. The existing pro-p Frattini theory is the pro-p specialization; the stated general profinite closed-image criterion is the local extension owned here.

Proof route:

1. A proper closed subgroup lies in a maximal open subgroup; the Frattini subgroup lies in that maximal subgroup, contradicting surjectivity.
2. Reduce specialization to the finite quotient and apply the full-group Hilbert condition.

Prerequisites: [IG.2/regular-full-group](#IG-2-regular-full-group); tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations; tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation.

Acceptance:

- A proper subgroup of a finite p-group cannot surject to its Frattini quotient.
- A finite quotient chosen without the Frattini property need not detect full profinite image.

Sources:

- [masser-zannier](#source-masser-zannier), Proof of Lemma5.1, published p.659. Uses the finite Frattini quotient of the compact ℓ-adic image and an integral thin-set bound.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Quantitative and local Hilbert proof sources.

<a id="IG-2-integral-thin-count"></a>
#### The integral thin-set counting kernel

**IG.2/integral-thin-count** · theorem.

If E⊂Q^r is thin and r≥1, then # {a∈E∩Z^r: |a_i|≤N for all i} is O_E(N^(r−1/2) log N) for integers N≥2. State the implied constant as an existential positive real depending on the fixed thin datum. The source’s restricted multidimensional large-sieve proof is built here: reduction of type-II covers at good primes, a positive-density set of primes with a omitted-fiber proportion, and the box large sieve. General sieves and prime-pattern theory import this kernel into their later tier; they are not prerequisites here.

Proof route:

1. Handle proper closed subvarieties by a polynomial zero count.
2. For each degree≥2 cover extract a positive-density set of good primes and a uniformly positive excluded proportion from Frobenius/fiber counts.
3. Apply the multidimensional box large sieve at the square-root scale, sum finitely many cover contributions and track constants.

Prerequisites: [IG.2/thin-sets](#IG-2-thin-sets); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

Acceptance:

- Squares in the rank-one box number O(N^1/2), agreeing with the stated upper bound.
- Constants depend on the thin set; no uniform constant over all covers is asserted.

Sources:

- [masser-zannier](#source-masser-zannier), Proof of Lemma5.1, p.659, citing Cohen and Serre Lectures on the Mordell–Weil theorem. Provides the exact quantitative target; the cited large-sieve proof is not yet source-certified.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Quantitative and local Hilbert proof sources.

<a id="IG-2-absolute-galois-normal-subgroups"></a>
#### Normal subgroups of absolute Galois groups

**IG.2/absolute-galois-normal-subgroups** · theorem. Planet: Absolute Galois normal subgroups.

For a field k finitely generated over Q, every closed normal topologically finitely generated subgroup N of Γ_k is trivial. More generally the cited Fried–Jarden result applies to Hilbertian fields in its exact original scope, which must be read before exporting that generality. This separately named normal-subgroup continuation is stronger than Hilbert irreducibility alone; ownership is proposed locally under the assigned area finding, subject to the maintainer accepting the continuation.

Proof route:

1. Read Fried–Jarden, Field Arithmetic, third edition Proposition16.11.6 and its Weissauer input; the original proofs are a recorded source obligation.
2. Apply the theorem to k, which is Hilbertian because it is finitely generated over Q. Track closedness, normality and topological finite generation separately.
3. Do not weaken the conclusion to finite index: a finite-index absolute Galois subgroup is itself an absolute Galois group of a finite extension and has infinitely many independent quadratic characters.

Prerequisites: [IG.2/number-field-hilbert](#IG-2-number-field-hilbert); tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations.

Acceptance:

- The trivial subgroup satisfies the conclusion.
- A finite-index subgroup is not a counterexample: its absolute Galois group is not topologically finitely generated.

Sources:

- [schmidt-stix](#source-schmidt-stix), Theorem7.1 proof, published p.850. Names this stronger normal-subgroup input and its original Fried–Jarden citation.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Absolute Galois original proof and ownership.

<a id="IG-2-quadratic-specialization-example"></a>
#### A worked disjoint quadratic family

**IG.2/quadratic-specialization-example** · application.

Over Q use Y²−T. Its generic splitting field Q(T)(√T) is regular C₂-Galois, its branch points on P¹ are 0 and ∞, and for any prime p its t=p fiber gives Q(√p). Distinct primes give distinct quadratic fields; any finite set of distinct prime square classes is independent, so the corresponding quadratic fields are mutually linearly disjoint with compositum degree 2^n. The polynomial is separable and irreducible at p; its field ramification and discriminant are p when p≡1 mod4 and 4p otherwise. Include the archimedean split condition for positive p.

Proof route:

1. Compute the power cover and its inertia.
2. Use square-class independence from prime valuations to calculate compositum degrees.
3. Import the quadratic number-field discriminant and place formulas; do not use an irreducibility-only certificate for ramification.

Prerequisites: [IG.2/regular-full-group](#IG-2-regular-full-group); [IG.2/disjoint-specializations](#IG-2-disjoint-specializations); [IG.1/decomposition-inertia](#IG-1-decomposition-inertia); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

Acceptance:

- At positive prime p the fiber is Q(sqrt(p)), while at t=1 it splits; exclude t=0 as branch.

Sources:

- [serre](#source-serre), §3.1–3.3, pp.19–27. The square-map Hilbert example; the stated square-class calculation is an explicit elementary specialization.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

<a id="IG-2-general-hilbert-local-approximation"></a>
#### Hilbert points with weak approximation

**IG.2/general-hilbert-local-approximation** · theorem.

Let k be a number field and X a smooth geometrically integral k-variety with weak approximation for every finite set of places. Let U⊂X be a nonempty open and H⊂U(k) a Hilbert subset defined by finitely many integral finite etale covers. For every finite S and nonempty product of open neighborhoods in X(k_v), v∈S, there is a point of H in that product, avoiding any specified proper closed subset. More generally, under weak weak approximation outside a fixed finite exceptional set S₀, the same conclusion holds for S disjoint from S₀. Mere weak approximation for the originally prescribed S is insufficient for this proof, which adds auxiliary places. No numerical bound on the selected point is asserted.

Proof route:

1. Express the failure of connected fibers as a thin set, using the finitely many proper-subgroup resolvent covers and include the excluded closed set.
2. Serre3.5.3 supplies auxiliary places outside S∪S₀ and a product open avoiding the thin set. Its type-II step chooses primes splitting completely in the constant field of the Galois closure; keep that hypothesis.
3. Apply weak approximation on the union of prescribed and auxiliary places; smoothness allows avoiding the boundary locally. The resulting point belongs to the Hilbert set and satisfies every prescribed neighborhood.

Prerequisites: [IG.2/hilbert-subsets](#IG-2-hilbert-subsets); [IG.2/thin-sets](#IG-2-thin-sets); [IG.2/regular-full-group](#IG-2-regular-full-group); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence; SchemeAndStackFoundations:SF.3.

Acceptance:

- For X=A¹, H consisting of nonsquare parameters and S={real place}, every positive interval contains a nonsquare rational Hilbert point.
- Smooth rational varieties have weak approximation at all finite place sets and satisfy this form.
- A variety known to approximate only at the original S does not supply approximation at the added auxiliary primes.

Sources:

- [serre](#source-serre), Theorem3.5.3 and proof, Lemma3.5.5, Theorem3.5.7; §§3.5–3.6 printed pp.28–33. Read proof of the auxiliary-place argument and its constant-field splitting condition.
- [bcdt](#source-bcdt), Proof of Theorem2.2.1, author final copy p.19 / published p.864. The rational modular parameter curve has the required weak approximation and the prescribed 3-adic open.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

### IG.3

Build raw branch tuples and braid actions before imposing Nielsen conditions. Treat exterior free-group epimorphisms separately from sphere product-one tuples. Import the existing three-point Riemann existence and descend general branch covers with the exact moduli obstruction, inertia and lifting-invariant conventions.

<a id="IG-3-general-riemann-existence"></a>
#### Riemann existence for finite covers

**IG.3/general-riemann-existence** · theorem. Planet: Riemann existence for covers.

For a complex finite-type scheme X, analytification gives an equivalence from finite étale X-schemes to finite topological covering spaces of X(C), compatible with geometric fibers and pullback. On a smooth connected complex curve C−D, finite transitive monodromy representations correspond to connected finite étale covers, which extend uniquely by normalization to finite branched covers of the smooth proper compactification. The smooth quasi-projective arbitrary-dimensional range needed for bounded covers uses this general theorem. The three-point curve/dessin specialization and its GAGA comparison remain BelyiMaps0–3 and5–12 imports.

Proof route:

1. Build local analytic covers from finite actions and descent; algebraize their finite analytic algebras by the finite-cover Riemann-existence theorem.
2. For curves extend over each puncture with the local z↦z^e model and normalize the algebraic curve.
3. Use the imported coherent analytic/morphism comparisons at the algebraization step; their proper GAGA alone is not a nonproper finite-cover theorem.

Prerequisites: [IG.0/etale-fundamental-group](#IG-0-etale-fundamental-group); ComplexComparisonPartII:C0; ComplexComparisonPartII:C3; ComplexComparisonPartII:C4; tauceti:TauCetiRoadmap/BelyiMaps#layer-0-permutation-triples; AlgebraicModuliForArithmeticGeometry:R09.7.

Acceptance:

- For a punctured complex line, finite covers match finite monodromy actions and connectedness is transitivity.
- Higher-dimensional spaces use the finite-type analytic comparison, not a curve-only statement.

Sources:

- [sga1](#source-sga1), Exposé XII Theorem5.1 and Corollary5.2, printed pp.251–253. The general finite-type finite-cover comparison extends beyond three branch points.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: General nonproper Riemann-existence algebraization.

<a id="IG-3-bounded-cover-count"></a>
#### Finitely many bounded-degree geometric covers

**IG.3/bounded-cover-count** · theorem.

For a connected smooth quasi-projective variety X over an algebraically closed characteristic-zero field, π₁^ét(X) is topologically finitely generated, and for each integer d≥1 only finitely many connected finite étale covers of degree≤d exist up to X-isomorphism. Over C, use a finite CW homotopy type; each index-n subgroup is detected by a continuous homomorphism to S_n and its stabilizer. The topological fundamental group has dense image in π₁^ét. Density suffices here; injectivity additionally needs residual finiteness, which is not claimed for arbitrary X.

Proof route:

1. Use a finite CW model to obtain finitely many topological generators, then Riemann existence and profinite completion.
2. Count images of the finitely many generators in each S_n, n≤d; take conjugacy classes of stabilizers.
3. Apply characteristic-zero algebraically closed base extension to reduce general fields to C.

Prerequisites: [IG.3/general-riemann-existence](#IG-3-general-riemann-existence); [IG.1/charzero-base-extension](#IG-1-charzero-base-extension); tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations; ComplexComparisonPartII:C4.

Acceptance:

- For a d-generated profinite group there are at most (n!)^d homomorphisms to S_n, bounding degree-n covers.
- The group needs topological finite generation; an infinite-rank free profinite group can have infinitely many double covers.

Sources:

- [gao-habegger](#source-gao-habegger), LemmaB.2 and proof, arXiv v3 p.58. Uses the general-dimensional comparison and finite topological generation.
- [sga1](#source-sga1), Exposé XII Corollary5.2, printed pp.252–253. Identifies the profinite completion, and thus the dense topological image.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: General nonproper Riemann-existence algebraization; Nonproper characteristic-zero base-extension proof.

<a id="IG-3-branch-tuples"></a>
#### Branch tuples and Nielsen classes

**IG.3/branch-tuples** · definition. Planet: Nielsen classes.

For a finite group G and r≥0, raw branch tuples are functions Fin r→G. Their ordered product, generated subgroup H=⟨g_i⟩, and class multiplicity are separate data. A sphere Nielsen tuple has product one; it is connected as a G-cover exactly when H=G. For specified conjugacy classes impose g_i∈C_i. The inner Nielsen class quotients by simultaneous G-conjugation; the absolute class for a chosen permutation representation G≤S_d quotients by its normalizer in S_d with the relevant class condition. An unramified puncture may carry identity. Disk tuples allow arbitrary boundary product, interpreted as inverse infinity inertia on P¹.

Proof route:

1. Define the data on the native finite function/list carrier and subgroup closure.
2. Construct actual quotient relations and show invariants descend to the specified quotients; ordering and boundary remain explicit.

Prerequisites: mathlib:Subgroup; [IG.3/general-riemann-existence](#IG-3-general-riemann-existence).

Uses:

- EVW§2; Wood21 Theorem3.1; IG.5 marked components: Raw tuples, product-one tuples and generating tuples have different Hurwitz carriers.

API:

- BranchTuple.product (data): The ordered product uses the fixed left-to-right order; the empty product is one.
- BranchTuple.generated (data): The subgroup is the closure of the coordinate range.
- NielsenClass.inner (constructor): Simultaneous conjugation gives the inner quotient, preserving product-one and generation.
- NielsenClass.absolute (compatibility): The absolute quotient uses the chosen permutation embedding and its normalizer, not Aut(G) without that datum.

Tests:

- BranchTuple.empty_test (computation): The empty tuple has product one and generates only the trivial subgroup.
- BranchTuple.nongenerating_test (non-example): In S₃ the tuple ((12),(12)) has product one but generates C₂, not S₃.
- BranchTuple.s3_test (computation): ((12),(23),(132)) has product one and generates S₃, using right-to-left permutation composition.

Acceptance:

- The empty tuple has product one and generates only the trivial subgroup.
- In S₃ the tuple ((12),(12)) has product one but generates C₂, not S₃.
- ((12),(23),(132)) has product one and generates S₃, using right-to-left permutation composition.

Sources:

- [evw](#source-evw), §§2.1–2.3, pp.736–740. Marked disk monodromy allows arbitrary tuples and connectedness is a separate condition.
- [wood21](#source-wood21), §3, pp.4–5. Uses all tuples before restricting to the generating locus.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration. The inner and absolute raw quotients are typed; fixed-class sphere restrictions, class multiplicity and the faithful-representation subtype still need their exact signatures.

<a id="IG-3-hurwitz-braid-action"></a>
#### The Hurwitz braid action

**IG.3/hurwitz-braid-action** · construction. Planet: Hurwitz braid action.

Use the native braid group B_r. Fix the left action σ_i:(…,a,b,…)↦(…,aba⁻¹,a,…), with inverse (a,b)↦(b,b⁻¹ab). Verify the far-commutativity and braid relations and descend to inner Nielsen classes. It preserves ordered total product, the literal generated subgroup and the multiset of conjugacy classes. For ordered distinct classes use the pure or color-preserving braid subgroup; the full braid group permutes the class ordering. EVW’s chosen geometric half-twist may be the inverse generator; record the comparison with Wood’s convention.

Proof route:

1. Compute the adjacent three-coordinate relation and disjoint-pair commutation.
2. Construct the braid action through its presentation and check invariants.
3. Match the chosen oriented path in configuration space to the stated half-twist; invert generators for the other convention.

Prerequisites: [IG.3/branch-tuples](#IG-3-branch-tuples); tauceti:TauCeti.BraidGroup.

Uses:

- Wood21 component invariant; Seguin concatenation: Controls both the lift product and the exact monodromy subgroup.

API:

- HurwitzMove.apply (simp): The two affected entries are aba⁻¹ and a.
- HurwitzMove.inverse (equivalence): The inverse sends (a,b) to (b,b⁻¹ab).
- HurwitzAction.product (compatibility): Total product is unchanged exactly, not merely up to conjugacy.
- HurwitzAction.generated (compatibility): The generated subgroup is unchanged exactly, and class multiplicities are unchanged.

Tests:

- HurwitzAction.noncommuting_test (computation): For a=(12),b=(23) in S₃ the move gives ((13),(12)), not the plain swap.
- HurwitzAction.inverse_test (computation): Applying a move and then its inverse returns the original tuple.
- HurwitzAction.colored_test (non-example): A full braid generator swaps the positions of two distinct classes, so fixed ordered class conditions require a colored subgroup.

Acceptance:

- For a=(12),b=(23) in S₃ the move gives ((13),(12)), not the plain swap.
- Applying a move and then its inverse returns the original tuple.
- A full braid generator swaps the positions of two distinct classes, so fixed ordered class conditions require a colored subgroup.

Sources:

- [wood21](#source-wood21), §3, PDF pp.4–5. Displays the left Hurwitz move used here.
- [evw](#source-evw), §§2.1–2.2, pp.737–739. Supplies the monodromy interpretation and orientation-sensitive braid action.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-3-braid-orbit-monoid"></a>
#### The braid-orbit monoid

**IG.3/braid-orbit-monoid** · construction.

For a conjugacy-invariant subset c⊂G, take all c-valued finite tuples in every length, quotient each by B_r, and concatenate. This is an associative unital graded monoid, including length zero and non-generating tuples. Its generated subgroup and ordered product are attached to a representative; product is an exact braid invariant. A tuple of total product one is central in this orbit monoid. The generating locus is preserved by braid moves but is not the whole carrier.

Proof route:

1. Use block braids for well-defined concatenation and associativity.
2. Move a block past a tuple by repeated Hurwitz moves; the conjugation factor is the first block’s total product, proving centrality when that product is one.

Prerequisites: [IG.3/hurwitz-braid-action](#IG-3-hurwitz-braid-action).

Uses:

- Wood21 stable classification; Seguin Proposition6.1: Central order blocks allow cancellation and bounded-core reduction.

API:

- BraidOrbitMonoid.concat (constructor): The product is represented by tuple concatenation.
- BraidOrbitMonoid.unit (simp): The empty tuple is a two-sided identity.
- BraidOrbitMonoid.degree (structure): Length and class multiplicity are additive.
- BraidOrbitMonoid.productOneCentral (relation): Product-one blocks commute with every orbit class.

Tests:

- BraidOrbitMonoid.empty_test (computation): Length zero remains in the monoid even for nontrivial G.
- BraidOrbitMonoid.identity_test (computation): Adding an identity puncture changes the length but not the generated subgroup.
- BraidOrbitMonoid.generation_test (non-example): An S₃ tuple of repeated (12) belongs to the monoid despite having proper monodromy.

Acceptance:

- Length zero remains in the monoid even for nontrivial G.
- Adding an identity puncture changes the length but not the generated subgroup.
- An S₃ tuple of repeated (12) belongs to the monoid despite having proper monodromy.

Sources:

- [evw](#source-evw), §3.3 and Proposition3.4, published pp.743–745. Concatenation and central stabilization elements.
- [wood21](#source-wood21), Theorem3.1 proof, pp.5–6. Localizes the full monoid, then restricts to generating tuples.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

<a id="IG-3-exterior-epimorphisms"></a>
#### Exterior epimorphisms and T-systems

**IG.3/exterior-epimorphisms** · definition. Planet: Exterior epimorphisms.

For a finite group G and free group F_r, generating r-tuples identify with surjective homomorphisms F_r→G. Exterior epimorphisms quotient by Inn(G). Nielsen equivalence is the Aut(F_r) precomposition action e↦e∘α⁻¹; inner automorphisms of F_r act by target conjugation, so this descends to Out(F_r). T_r-systems further quotient by Aut(G), which commutes with precomposition. The minimal generator number d(G) is the least r admitting a surjection; it is not the order of G.

Proof route:

1. Use the native free-group universal property, then characterize surjectivity by subgroup closure of images.
2. Define the conjugacy equivalence and quotient actions; compute precomposition by an inner free-group automorphism.

Prerequisites: [IG.3/branch-tuples](#IG-3-branch-tuples); mathlib:FreeGroup.

Uses:

- Chen Wiegold/Garion and McCullough–Wanderley statements: The conjectures are about the appropriate orbit set, not branch-point product-one tuples.

API:

- ExteriorEpi.ofTuple (equivalence): Generating tuples are equivalent to surjections from F_r.
- ExteriorEpi.outAction (structure): Out(F_r) acts after the inner target quotient.
- TSystem.quotient (constructor): Aut(G) acts on exterior epimorphisms and its orbit quotient defines T_r.
- GeneratorNumber.exists (characterisation): r≥d(G) exactly when a generating r-tuple exists, allowing identity padding.

Tests:

- ExteriorEpi.cyclic_test (computation): A generating one-tuple of C_n is an element of order n.
- ExteriorEpi.noncyclic_test (non-example): C₂×C₂ has d=2 and has no exterior epimorphism from F₁.
- ExteriorEpi.inner_test (computation): Conjugating the free-group domain changes a generating tuple by simultaneous target conjugation and is trivial on exterior classes.

Acceptance:

- A generating one-tuple of C_n is an element of order n.
- C₂×C₂ has d=2 and has no exterior epimorphism from F₁.
- Conjugating the free-group domain changes a generating tuple by simultaneous target conjugation and is trivial on exterior classes.

Sources:

- [chen](#source-chen), §1.1 p.5 and §1.6 p.12, arXiv v2. Separates Nielsen equivalence, exterior epimorphisms and T-systems.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-3-nielsen-open-statements"></a>
#### Named Nielsen transitivity conjectures

**IG.3/nielsen-open-statements** · application.

These are named open propositions and are never premises. Chen Conjecture1.1.3 asks, for every finite G and r≥d(G)+1, that Out(F_r) act transitively on Epi(F_r,G)/Inn(G); the Wiegold nonabelian-simple case is a specialization. McCullough–Wanderley §4 asks, for q outside {3,5,7,9,11}, that T₂(SL₂(F_q)) be classified bijectively by the Aut(F_q)-orbit of tr([a,b]), with the orbit of 2 excluded. T₂ quotients also by Aut(G), so an exact trace is not invariant for nonprime fields. Chen Question1.4.1 asks, for finite nonabelian simple G and φ:F₂↠G, whether ord(φ([a,b])) divides the size of the Out⁺(F₂)-orbit of its exterior class. None is an assertion about product-one branch tuples.

Proof route:

1. Transcribe the mathematical quantifiers in own words against Chen’s source locators.
2. Expose each as a named proposition, with no theorem asserting it; verify its equivalence relation against the exterior/T-system definitions.

Prerequisites: [IG.3/exterior-epimorphisms](#IG-3-exterior-epimorphisms).

Acceptance:

- The free-rank parameter refers to generating tuples modulo inner conjugacy, not sphere tuples with product one.
- For nonprime q, a field automorphism can change the exact trace while preserving its weak trace and T-system.
- No open conjecture is used to prove a later theorem.

Sources:

- [chen](#source-chen), Conjecture1.1.3 p.5; Question1.4.1 p.11, arXiv v2. Exact quantifiers and open status.
- [mw](#source-mw), §4 p.487; Trace Theorem pp.481–482. Primary T-system conjecture with weak trace and its exceptional fields, correcting the secondary formulation.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Exact open Nielsen predicates.

<a id="IG-3-branch-cycle-realization"></a>
#### Realizing general generating sphere tuples

**IG.3/branch-cycle-realization** · construction.

For G finite, r distinct points on P¹(C), and a generating tuple (g₁,…,g_r) with product one and nonidentity entries at actual branch points, construct a connected G-Galois cover with those positively oriented local monodromies. Allow identity entries only as labelled unramified punctures. Its local ramification index is ord(g_i), and Riemann–Hurwitz reads 2g(Y)−2=|G|(−2+Σ_i(1−1/ord(g_i))). Inner equivalence gives G-equivariant cover isomorphism classes. For r=3 import the Belyi permutation-triple and dessin construction; do not rebuild it.

Proof route:

1. Construct the topological cover by the sphere fundamental-group presentation and the regular action of G.
2. Apply general Riemann existence and normalization; compute local cycle lengths and Riemann–Hurwitz.

Prerequisites: [IG.3/branch-tuples](#IG-3-branch-tuples); [IG.3/general-riemann-existence](#IG-3-general-riemann-existence); [IG.1/decomposition-inertia](#IG-1-decomposition-inertia); SchemeAndStackFoundations:SF.3; tauceti:TauCetiRoadmap/BelyiMaps#layer-3-finite-enumeration-and-character-theoretic-counts; tauceti:TauCetiRoadmap/BelyiMaps#layer-5-the-thrice-punctured-sphere-and-its-fundamental-group.

Uses:

- IG.5 Hurwitz geometry; IG.3 rigidity and real descent: Turns exact tuples into actual covers with ramification data.

API:

- BranchCover.ofTuple (constructor): Produces the finite morphism, G-action, branch labels and monodromy comparison.
- BranchCover.inertia (compatibility): The specified inertia cyclic subgroup has order ord(g_i).
- BranchCover.innerClass (characterisation): Changing all g_i by one conjugation preserves the G-cover class.
- BranchCover.genus (data): Its genus satisfies the displayed Riemann–Hurwitz equation.

Tests:

- BranchCover.cyclic_test (computation): The tuple (a,a⁻¹) in C_n yields z↦z^n with genus zero.
- BranchCover.nongenerating_test (non-example): A product-one tuple generating H<G induces a disconnected G-torsor, not a connected G-cover.
- BranchCover.identity_test (computation): An identity label has ramification index one and contributes zero to Riemann–Hurwitz.

Acceptance:

- The tuple (a,a⁻¹) in C_n yields z↦z^n with genus zero.
- A product-one tuple generating H<G induces a disconnected G-torsor, not a connected G-cover.
- An identity label has ramification index one and contributes zero to Riemann–Hurwitz.

Sources:

- [sga1](#source-sga1), Exposé XII Theorem5.1, pp.251–253; XIII Corollary2.12, p.290. Algebraizes finite monodromy covers and supplies the tame sphere presentation.
- [serre](#source-serre), §8.1, printed pp.81–83. General rigid G-covers use product-one generating branch tuples.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: General cover descent signature.

<a id="IG-3-rational-rigidity"></a>
#### Rational rigidity with its descent hypotheses

**IG.3/rational-rigidity** · theorem. Planet: Rational rigidity.

Let K have characteristic zero, G be finite with Z(G)=1, and P₁,…,P_r distinct K-rational points of P¹. Let C_i be nonidentity conjugacy classes, rational under every power relatively prime to |G|. Suppose the generating product-one locus in ∏C_i is nonempty and is one simultaneous G-conjugacy orbit. Then there is a regular G-cover of P¹_K, unramified outside the P_i, with geometric inertia classes C_i, unique up to G-equivariant isomorphism. The centralizer of a generating tuple is Z(G), so triviality removes the G-cover descent automorphism. Rational classes and rigidity are both checked; a nonempty passport does not establish either. Use Belyi’s criterion for the three-point special case.

Proof route:

1. Form the geometric cover class by branch-cycle realization; conjugation on a positive inertia generator uses χ(σ), while transporting a right cover action may use χ(σ)⁻¹. State the convention adapter explicitly.
2. Rationality makes the class locus Galois-stable; rigidity makes it one orbit.
3. Use trivial centralizer and Serre’s torsor lemma to extend the geometric quotient to the arithmetic group, giving effective descent and regularity.

Prerequisites: [IG.3/branch-cycle-realization](#IG-3-branch-cycle-realization); [IG.1/arithmetic-exact-sequence](#IG-1-arithmetic-exact-sequence); [IG.0/finite-galois-algebras](#IG-0-finite-galois-algebras); SchemeAndStackFoundations:SF.1; tauceti:TauCetiRoadmap/BelyiMaps#layer-11-fields-of-moduli-fields-of-definition-and-galois-orbits.

Acceptance:

- The transposition/transposition/3-cycle S₃ classes form one inner orbit and descend regularly.
- Centerlessness and rationality of each class are retained; a field-of-moduli assertion alone is insufficient.

Sources:

- [serre](#source-serre), Theorem8.1.1 and Lemma8.1.3, printed pp.81–83. The centerless rational rigid tuple theorem in this exact field range.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: General cover descent signature.

<a id="IG-3-general-cover-moduli-descent"></a>
#### Field of moduli and the central descent obstruction

**IG.3/general-cover-moduli-descent** · construction.

For a G-cover of P¹_{K̄} with Galois-invariant G-equivariant isomorphism class, the field of moduli is the fixed field of that class stabilizer. Choose a rational or imported tangential basepoint on the branch complement and comparison isomorphisms h_σ in G/Z(G). Their obstruction h_σh_τh_{στ}⁻¹ defines a continuous H²(Γ_K,Z(G)) class, with the exact action supplied by the G-cover convention. The class vanishes exactly when the comparisons lift to effective G-cover descent over K. Choices change the cocycle by a coboundary; a model of the target and its branch divisor are part of the problem. General three-point field-of-moduli theory is imported from Belyi11.

Proof route:

1. Use the arithmetic π₁ sequence and its chosen section to obtain comparison elements modulo the centralizer.
2. Compute the central two-cocycle and change-of-choice identities.
3. Use finite-level effective descent for the finite cover and normalization; compare a vanishing cocycle with an actual model.

Prerequisites: [IG.1/arithmetic-exact-sequence](#IG-1-arithmetic-exact-sequence); [IG.3/branch-cycle-realization](#IG-3-branch-cycle-realization); SchemeAndStackFoundations:SF.1; SchemeAndStackFoundations:SF.2; tauceti:TauCetiRoadmap/BelyiMaps#layer-11-fields-of-moduli-fields-of-definition-and-galois-orbits.

Uses:

- Wewers Example1.10; Hurwitz rational points: A rational coarse moduli point is not automatically a model of an unmarked G-cover.

API:

- CoverDescent.moduliField (data): The fixed field uses the stabilizer of the specified cover class and labels.
- CoverDescent.obstruction (data): The comparison lifts define the specified central continuous H² class.
- CoverDescent.changeChoices (compatibility): Different compatible lifts/sections change the cocycle by a coboundary and preserve its class.
- CoverDescent.modelIff (characterisation): Vanishing is equivalent to an effective model with the given target and G-action.

Tests:

- CoverDescent.centerless_test (computation): If Z(G)=1 the central obstruction vanishes.
- CoverDescent.real_test (non-example): For the SL₂(F₅) four-branch example below, a real field of moduli has a nonzero obstruction.
- CoverDescent.labels_test (non-example): Fixing branch labels can change the stabilizer and field of moduli; the unlabeled field cannot be substituted.

Acceptance:

- If Z(G)=1 the central obstruction vanishes.
- For the SL₂(F₅) four-branch example below, a real field of moduli has a nonzero obstruction.
- Fixing branch labels can change the stabilizer and field of moduli; the unlabeled field cannot be substituted.

Sources:

- [wewers-fmfd](#source-wewers-fmfd), Definition1.1, Proposition1.2 and Proposition1.5, arXiv v1 pp.4–6. Makes the field-of-definition obstruction explicit without equating it with field of moduli.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: General cover descent signature.

<a id="IG-3-real-moduli-counterexample"></a>
#### A four-branch real moduli obstruction

**IG.3/real-moduli-counterexample** · application.

Take G=SL₂(F₅), the nonsplit double cover of A₅, and g₁,g₂ the order-three lifts of (123),(345). The tuple (g₁,g₂,g₂⁻¹,g₁⁻¹) generates G and has product one. Wewers’s path of four branch points S_t={±1±√(−t)}, 0<|t|<1, gives for negative real t a connected G-cover whose class is invariant under complex conjugation. Its comparing elements are the two lifts of (12)(45), both of order four. No comparing element squares to one, so the cover has field of moduli R and no G-cover model over R. For positive t the branch points occur in conjugate pairs and a real model exists. Check the order-three lifts and the chosen path, not merely a generic moduli warning.

Proof route:

1. Use branch-cycle realization for the specified tuple and branch positions.
2. Compute conjugation along Wewers’s upper-half-plane parameter path and the two possible comparison elements.
3. Apply the real descent criterion: an actual descent comparison must be an involution. The central sign is nontrivial.

Prerequisites: [IG.3/branch-cycle-realization](#IG-3-branch-cycle-realization); [IG.3/general-cover-moduli-descent](#IG-3-general-cover-moduli-descent).

Acceptance:

- The Wewers SL₂(F₅) example has real moduli but a nonneutral real descent obstruction.

Sources:

- [wewers-fmfd](#source-wewers-fmfd), Proposition1.8, Theorem1.9 and Example1.10, arXiv v1 pp.7–9. Gives a worked four-point field-of-moduli/definition separation.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: General cover descent signature.

<a id="IG-3-rigid-s3-comparison"></a>
#### A rigid S₃ cover and its dessin

**IG.3/rigid-s3-comparison** · application.

In S₃ the classes (transposition,transposition,3-cycle) have a single generating product-one inner orbit and trivial centralizer. They are rational classes. The triple ((12),(23),(132)) realizes that orbit. Import the Belyi triple/dessin correspondence and apply it to the degree-three map y↦y³−3y after the affine branch-coordinate change taking −2,+2,∞ to 0,1,∞. The Galois closure has group S₃, inertia orders 2,2,3, and is regular over Q. The dessin and the exact triple agree; this particular passport computation does not prove that passports determine all Belyi pairs.

Proof route:

1. Enumerate the six ordered distinct-transposition pairs and their product inverse; identify their one conjugacy orbit.
2. Check the critical points ±1 and branch values ∓2. Use the imported analytic/algebraic and dessin comparisons.

Prerequisites: [IG.3/rational-rigidity](#IG-3-rational-rigidity); tauceti:TauCetiRoadmap/BelyiMaps#layer-3-finite-enumeration-and-character-theoretic-counts; tauceti:TauCetiRoadmap/BelyiMaps#layer-5-the-thrice-punctured-sphere-and-its-fundamental-group; tauceti:TauCetiRoadmap/BelyiMaps#layer-11-fields-of-moduli-fields-of-definition-and-galois-orbits.

Acceptance:

- Count the generating triples modulo simultaneous conjugation and obtain exactly one orbit.
- Translate the right-action convention before matching the imported Belyi triple.

Sources:

- [serre](#source-serre), §8.1 Theorem8.1.1, pp.81–83. The explicit class calculation is a small rigid realization; the three-point comparison is imported.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: General cover descent signature.

<a id="IG-3-lifting-invariant"></a>
#### The braid lifting invariant

**IG.3/lifting-invariant** · construction.

For finite G and a conjugacy-invariant generating subset c, import the universal marked central extension U(G,c) and its class-degree map from InductionRestrictionPartII. For a c-tuple g define Π(g)=[g₁]⋯[g_r] in U(G,c). It is braid-invariant and multiplicative on the full orbit monoid. Its projection to G is the boundary product and its degree vector is the class multiplicity. A product-one tuple lies in the central kernel; one must retain the degree vector rather than identify that whole infinite kernel with the reduced Schur multiplier.

Proof route:

1. Use the supplier presentation relation [aba⁻¹][a]=[a][b] to verify each Hurwitz move.
2. Compute the two projections on generators and concatenate.

Prerequisites: [IG.3/braid-orbit-monoid](#IG-3-braid-orbit-monoid); InductionRestrictionPartII:RS.2/universal-marked-property; InductionRestrictionPartII:RS.2/class-degree-map; InductionRestrictionPartII:RS.2/universal-kernel.

Uses:

- Wood21 Theorem3.1; LWZB12.5; Seguin fields of components: Classifies stable components and their arithmetic action.

API:

- LiftingInvariant.tuple (constructor): A tuple is sent to its ordered marked lift product.
- LiftingInvariant.braid (compatibility): Each braid move leaves the element unchanged.
- LiftingInvariant.concat (functoriality): Concatenation maps to multiplication in U(G,c).
- LiftingInvariant.projections (data): The G-projection and class-degree vector are the stated product and multiplicity.

Tests:

- LiftingInvariant.empty_test (computation): The empty tuple has invariant one and zero class-degree vector.
- LiftingInvariant.braid_test (computation): The invariants of (a,b) and (aba⁻¹,a) are equal.
- LiftingInvariant.degree_test (non-example): Adding an identity or a full order block changes the class-degree vector; the multiplier alone cannot record all components.

Acceptance:

- The empty tuple has invariant one and zero class-degree vector.
- The invariants of (a,b) and (aba⁻¹,a) are equal.
- Adding an identity or a full order block changes the class-degree vector; the multiplier alone cannot record all components.

Sources:

- [wood21](#source-wood21), §3 and Theorem3.1, pp.4–6. The tuple lift product detects stabilized generating braid orbits.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: General cover descent signature.

<a id="IG-3-stable-braid-classification"></a>
#### Stable generating braid-orbit classification

**IG.3/stable-braid-classification** · theorem.

For finite G and conjugacy-invariant generating c, there exists M depending on (G,c) such that for every class multiplicity vector m with every coordinate at least M, Π induces a bijection between generating c-tuple braid orbits of multiplicity m and the elements of U(G,c) of degree m. Boundary-product constraints are imposed by restricting both sides to the same G-projection. This theorem does not classify non-generating tuples; adequate class multiplicity alone does not force generation.

Proof route:

1. Use the finite-group cancellation lemma to move a full order block of an arbitrary conjugate to a chosen element while retaining the generating locus.
2. Show concatenation maps become bijections once all multiplicities are large.
3. Localize by the product of all central order blocks; its group is U(G,c). Cancel in the stable range and obtain surjectivity by inserting a generating core.

Prerequisites: [IG.3/lifting-invariant](#IG-3-lifting-invariant); [IG.3/eventual-class-element-extraction](#IG-3-eventual-class-element-extraction).

Acceptance:

- Every class multiplicity must exceed the same threshold; large total length alone is insufficient.
- Only generating tuples are classified, although the localization proof uses the full tuple monoid.

Sources:

- [wood21](#source-wood21), Theorem3.1 and full proof, pp.5–6. Replaces the withdrawn EVW12 orbit assertion with a proof, still using Fried–Völklein Appendix Lemma3.
- [wood21](#source-wood21), Remark5.4, pp.11–12. Generation is indispensable in stable component classification.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Stable braid cancellation proof; General cover descent signature.

<a id="IG-3-arithmetic-lift-comparison"></a>
#### Tate-twisted arithmetic lifting invariants

**IG.3/arithmetic-lift-comparison** · comparison.

For general finite G and rational class union c, import the inverse-Tate-twisted U(G,c) SET action and compare the lift-product invariant of a tame marked cover with its topological tuple, as in Wood2021 Theorems3.1/5.3. For Wood2019 Theorem3.13 retain its narrower F_ε wreath-product subgroup G, single outside involution class c and chosen embedding at infinity. With m the total geometric branch multiplicity (including infinity when ramified), the proof convention is J=[c₀]^m I(φ,u) φ(δ_∞)⁻¹ in U(G,c). Here u is the specified norm-compatible root-of-unity input and δ_∞ is the chosen positive tame generator. If infinity is unramified its factor is one. Do not export this specific formula for arbitrary class unions, and reconcile the statement/proof inversion by the generator choice.

Proof route:

1. Use the common prime-to-p peripheral Tate identification; compare chosen generators at every finite branch place.
2. Apply Wood21 Theorem5.3 to make the lift product independent of the chosen Tate generator by twisting.
3. Compare the global arithmetic product place by place with Wood19 Theorem3.13, retaining its normalization exponent.

Prerequisites: [IG.3/lifting-invariant](#IG-3-lifting-invariant); [IG.3/stable-braid-classification](#IG-3-stable-braid-classification); [IG.1/tame-tangential-fiber](#IG-1-tame-tangential-fiber); InductionRestrictionPartII:RS.3/cyclotomic-twist; InductionRestrictionPartII:RS.3/discrete-action.

Acceptance:

- An unramified infinity factor is one.
- A general rational class union uses the Wood2021 twisted set action; the Wood2019 explicit involution formula is restricted to its own inputs.

Sources:

- [wood21](#source-wood21), Theorem3.1 pp.4–6; Theorem5.3 and Remark5.4 pp.10–12. General Tate covariance and the generating-cover invariant.
- [wood](#source-wood), Theorem3.13, full proof, published pp.394–398. The narrower explicit comparison with its infinity correction and inversion convention.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: General cover descent signature.

<a id="IG-3-finite-coefficient-comparison"></a>
#### Étale/Betti comparison with finite coefficients

**IG.3/finite-coefficient-comparison** · theorem.

For a finite-type complex scheme X and a finite abelian group A, the natural comparison H^i_ét(X,A)→H^i(X^an,A) is an isomorphism for every i≥0, functorial in X and A and compatible with cup products and finite-cover pullback. Its construction uses the analytification morphism of sites. The topological sheaf/singular comparison is imported; the finite-coefficient étale comparison kernel is owned here, with the original SGA4 proof an explicit reading obligation.

Proof route:

1. Construct the map of constant sheaves under analytification.
2. Reduce by finite-cover descent and excision to Artin elementary fibrations; compare the finite-coefficient spectral sequences.
3. Compose with the supplied topological sheaf/singular comparison and prove naturality.

Prerequisites: [IG.3/general-riemann-existence](#IG-3-general-riemann-existence); ComplexComparisonPartII:C5/repair-sheaf-singular-comparison; SchemeAndStackFoundations:SF.2.

Acceptance:

- A point has H⁰=A and higher groups zero in both theories.
- For Gm(C), H¹ with constant finite A is A; infinite coefficients are outside the stated comparison.

Sources:

- [landesman-litt](#source-landesman-litt), Lemma2.3.3 proof, p.16; citing SGA4 Exposé XI §§4.4–4.6. Identifies the exact finite-coefficient comparison input, whose original proof remains to be read.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Artin and residual-finiteness original proofs.

<a id="IG-3-artin-good-neighborhoods"></a>
#### Artin good neighborhoods

**IG.3/artin-good-neighborhoods** · construction.

Every point of a smooth complex variety has a Zariski-open neighborhood U obtainable by a finite tower of elementary fibrations with smooth affine curve fibers. Its analytification is a K(π,1); hence group cohomology H^i(π₁(U^an),A) agrees naturally with Betti and étale cohomology for finite abelian A. The topology of the neighborhood and the chosen point are data. Do not assert that an arbitrary smooth open is already a K(π,1).

Proof route:

1. Read and implement SGA4 XI §4.6 elementary-fibration induction.
2. Use the punctured-curve universal-cover calculation and fibration long exact homotopy sequence to prove asphericity.
3. Identify group cohomology with local-system cohomology and apply the finite comparison.

Prerequisites: [IG.3/finite-coefficient-comparison](#IG-3-finite-coefficient-comparison); ComplexComparisonPartII:C0; SchemeAndStackFoundations:SF.3.

Uses:

- Landesman–Litt Lemma2.3.3: Supplies the local comparison and asphericity, without owning its later representation theorem.

API:

- ArtinNeighborhood.point (data): The chosen point belongs to the specified Zariski open.
- ArtinNeighborhood.tower (data): The elementary fibration tower has its affine curve fibers and compactification boundaries.
- ArtinNeighborhood.aspherical (characterisation): All positive higher homotopy groups of U^an vanish.
- ArtinNeighborhood.cohomology (compatibility): The finite group/Betti/étale comparisons are the natural ones.

Tests:

- ArtinNeighborhood.affineLine_test (computation): A¹(C) is a contractible good neighborhood.
- ArtinNeighborhood.torus_test (computation): Gm(C) is K(Z,1).
- ArtinNeighborhood.projectiveLine_test (non-example): P¹(C) has π₂=Z, so the whole variety cannot be substituted for its good open neighborhood.

Acceptance:

- A¹(C) is a contractible good neighborhood.
- Gm(C) is K(Z,1).
- P¹(C) has π₂=Z, so the whole variety cannot be substituted for its good open neighborhood.

Sources:

- [landesman-litt](#source-landesman-litt), Proof of Lemma2.3.3, p.16, quoting SGA4 XI §4.6. Good neighborhoods are the original source-dependent kernel used to kill classes after étale pullback.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Artin and residual-finiteness original proofs.

<a id="IG-3-curve-topological-density"></a>
#### Topological density for smooth complex curves

**IG.3/curve-topological-density** · theorem.

For a smooth connected complex curve, possibly punctured, the natural π₁^top→π₁^ét is injective with dense image: Riemann existence identifies the target with the profinite completion, and surface/free groups are residually finite. Consequently a continuous homomorphism from π₁^ét to a Hausdorff topological group has finite image if its restriction to π₁^top has finite image. Density alone suffices for the last implication.

Proof route:

1. Apply finite-cover comparison to the completion map.
2. Prove residual finiteness for the surface/free group presentations, with the original surface-group input still a proof obligation.
3. The image of the dense subgroup lies in a finite closed subset of the Hausdorff target; continuity gives the same containment for the entire group.

Prerequisites: [IG.3/general-riemann-existence](#IG-3-general-riemann-existence); ComplexComparisonPartII:C0.

Acceptance:

- The completion map Z→Z-hat for Gm is injective and dense.
- A finite image of the dense subgroup is closed in a Hausdorff target and remains the full image.

Sources:

- [landesman-litt](#source-landesman-litt), §9.1 p.47, citing SGA1 XII Corollary5.2. The finite-image passage used in the arithmetic application.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Artin and residual-finiteness original proofs.

<a id="IG-3-eventual-class-element-extraction"></a>
#### Eventual extraction of a class element

**IG.3/eventual-class-element-extraction** · theorem.

Let G be finite and c a single conjugacy class generating G. There is N(G,c) such that whenever n≥N, any generating tuple in c^n is braid-equivalent to (g,g₂,…,g_n), for any specified g∈c, with g₂,…,g_n still generating G. The tuple need not have product one. The single-class condition is essential to this statement: one cannot extract a missing class from a tuple in a union merely because the union generates.

Proof route:

1. If n>d|c|, where d is the common order, pigeonhole gives d+1 copies of one class element; pull them to the front.
2. A length-d block has product one. Braiding it around the remaining generating tuple conjugates the block by any word in that tuple, preserving the remainder.
3. Conjugate its value to the specified g, remove one leading entry and retain the redundant copy so the remainder still generates.

Prerequisites: [IG.3/branch-tuples](#IG-3-branch-tuples); [IG.3/hurwitz-braid-action](#IG-3-hurwitz-braid-action); [IG.3/braid-orbit-monoid](#IG-3-braid-orbit-monoid).

Acceptance:

- For G=C₂ and its nontrivial class, long tuples consist of the involution and extraction preserves generation of the remainder.
- For c a union of two different generating-capable classes in S₃, class multiplicity is braid invariant, so a 3-cycle cannot be extracted from an all-transposition tuple.
- Verify that extraction preserves the exact product and does not impose product one.

Sources:

- [evw](#source-evw), Proposition3.4 and full proof, published pp.744–745. The elementary single-class extraction used in stabilization.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

### IG.4

Extend the existing generic weak embedding problem to actual arithmetic properness and place restrictions. Supply the restricted finite-coefficient duality kernel, Schmidt–Wingberg shrinking and Fitting-supplement induction, supersolvable and quaternion local realizations, and the admissible unramified Γ-group interfaces.

<a id="IG-4-proper-local-embedding-problem"></a>
#### Proper solutions with local prescriptions

**IG.4/proper-local-embedding-problem** · definition. Planet: Proper embedding problems.

For an imported FiniteEmbeddingProblem Γ_K with epimorphisms π:Γ_K→Q and α:E→Q, a proper solution is an imported weak solution β:Γ_K→E that is surjective. For each v in a finite set S of places choose a compatible local lift β_v:Γ_{K_v}→E. A global solution satisfies the local prescription when its restriction is conjugate to β_v by an element of ker α, using the chosen decomposition embedding. A weaker prescription of the local extension alone uses E-conjugacy. Distinguish these two moduli problems. Proper solutions correspond to E-Galois field extensions above the specified Q-extension; weak solutions correspond to E-Galois algebras.

Proof route:

1. Keep the upstream weak carrier, openness condition and commuting square. Add surjectivity and the two explicitly stated equivalence relations.
2. Apply the field/torsor correspondence and compare decomposition embeddings, whose changes give conjugate maps.

Prerequisites: tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-5-presentations-extensions-and-the-rank-interpretations; [IG.0/finite-galois-algebras](#IG-0-finite-galois-algebras); [IG.1/decomposition-inertia](#IG-1-decomposition-inertia).

Uses:

- Shafarevich theorem; Grunwald prescriptions; marked unramified extensions: Ensures a solution realizes the whole group with the stated local data.

API:

- ProperEmbeddingSolution.toWeak (compatibility): Forgetting surjectivity returns precisely the imported IsSolution.
- ProperEmbeddingSolution.field (equivalence): A proper solution gives an E-field realization, and its fixed kernel field is the specified Q-field.
- LocalPrescription.changePlace (compatibility): Changing a decomposition embedding gives the indicated conjugate prescription.
- LocalPrescription.kernelConjugacy (characterisation): For lifts of the same π_v the equivalence fixes the quotient and is conjugacy by ker α.

Tests:

- ProperEmbeddingSolution.trivialWeak_test (non-example): For E=C₂ and Q=1, the trivial weak solution is not proper.
- ProperEmbeddingSolution.identity_test (computation): When α is an isomorphism the unique compatible lift is proper because π is surjective.
- LocalPrescription.quotient_test (non-example): E-conjugation can alter a fixed quotient map; it cannot replace kernel conjugacy for a fixed marked embedding problem.

Acceptance:

- For E=C₂ and Q=1, the trivial weak solution is not proper.
- When α is an isomorphism the unique compatible lift is proper because π is surjective.
- E-conjugation can alter a fixed quotient map; it cannot replace kernel conjugacy for a fixed marked embedding problem.

Sources:

- [schmidt-wingberg](#source-schmidt-wingberg), Introduction and Theorems14–15, PDF pp.1–2,20–22. The distinction between solutions and proper solutions drives the solvable realization proof.
- [dlan](#source-dlan), §§2.3–2.4, pp.1014–1016. Cohomology classes and twisting describe local lift equivalence.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Arithmetic embedding signatures.

<a id="IG-4-abelian-kernel-obstruction"></a>
#### Finite abelian-kernel obstruction and pullback

**IG.4/abelian-kernel-obstruction** · theorem. Planet: Abelian lifting obstruction.

Let 1→A→E→Q→1 be an extension of finite groups with A abelian, and π:Γ→Q continuous. Conjugation defines the Q-action on A, independent of the lift. The imported extension class e∈H²(Q,A) pulls back to π*e∈H²_cont(Γ,A_π). A weak lift exists exactly when π*e=0. Its A-conjugacy classes form a torsor under H¹_cont(Γ,A_π) once a lift has been chosen. Pullback is natural for continuous homomorphisms of profinite source groups and compatible homomorphisms of extensions. This criterion does not assert a proper lift. Reuse the current generic profinite extension/cohomology dictionary of ProfiniteProPGroups5; supply only the arbitrary finite abelian coefficient adapter and explicit naturality.

Proof route:

1. Use the upstream continuous section and factor-set construction, with finite discrete coefficients.
2. Compute the defect of a chosen lift and its change under a continuous one-cochain.
3. Identify splitting of the pulled-back extension with a lift; quotient the difference cocycles by A-conjugacy.

Prerequisites: [IG.4/proper-local-embedding-problem](#IG-4-proper-local-embedding-problem); tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-5-presentations-extensions-and-the-rank-interpretations.

Acceptance:

- A split extension has zero obstruction and a weak solution.
- A zero obstruction is not evidence of surjectivity; the split algebra is a weak-solution test.

Sources:

- [merkurjev-scavia](#source-merkurjev-scavia), §1.2 and Proposition2.1, PDF pp.2,5. States arbitrary abelian-kernel lifting and its Galois-algebra interpretation.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Arithmetic embedding signatures.

<a id="IG-4-finite-galois-localization"></a>
#### Finite Galois localization and Sha kernels

**IG.4/finite-galois-localization** · definition. Planet: Galois localization kernels.

For a number field K and a finite discrete Γ_K-module A, define Sha^i(K,A) as the kernel of H^i(K,A)→∏_v H^i(K_v,A). Define Sha^i_S(K,A) by requiring zero localization outside the finite set S. Use modified Tate cohomology at real places in the Poitou–Tate complexes, with the comparison to ordinary positive-degree groups stated. The Cartier dual is A^D=Hom(A,μ_∞) with the induced Galois action. For finite S the localization defect is the cokernel of H¹(K,A)→∏_{v∈S}H¹(K_v,A). These restricted finite-module definitions move down from the higher ArithmeticGaloisDuality tier.

Proof route:

1. Construct restriction maps using the imported field decomposition maps and continuous cohomology.
2. Form kernels/cokernels in the finite discrete coefficient range and check independence of decomposition embeddings.
3. Construct the evaluation pairing with A^D and record archimedean modifications.

Prerequisites: [IG.1/arithmetic-exact-sequence](#IG-1-arithmetic-exact-sequence); tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Uses:

- Schmidt–Wingberg steps2–4; Wood tame central lift; HW cyclic lifts: Separates globally vanishing obstructions from merely local solvability.

API:

- FiniteGaloisLocalization.sha (constructor): The kernel is defined using all places, including the specified real-place convention.
- FiniteGaloisLocalization.shaS (constructor): The S-kernel uses vanishing at every place outside S.
- FiniteGaloisLocalization.dual (data): The Cartier dual has its contragredient cyclotomic action and evaluation pairing.
- FiniteGaloisLocalization.naturality (functoriality): Coefficient maps commute with localization, restriction and the induced kernel maps.

Tests:

- FiniteGaloisLocalization.emptyS_test (computation): Sha^i_∅=Sha^i.
- FiniteGaloisLocalization.trivial_test (computation): For A=0 every kernel and localization defect is zero.
- FiniteGaloisLocalization.real_test (non-example): For K_v=R and A=Z/2, positive-degree real cohomology need not vanish; dropping all archimedean terms is incorrect.

Acceptance:

- Sha^i_∅=Sha^i.
- For A=0 every kernel and localization defect is zero.
- For K_v=R and A=Z/2, positive-degree real cohomology need not vanish; dropping all archimedean terms is incorrect.

Sources:

- [dlan](#source-dlan), §2.6, Propositions2.5 and Lemma2.6, pp.1018–1019. Uses precisely these finite-module localization kernels.
- [schmidt-wingberg](#source-schmidt-wingberg), Definitions8–9, p.10; Lemma10 and proof, p.11 (arXiv v1). The localization defects used for controlled embedding solutions.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Arithmetic embedding signatures.

<a id="IG-4-restricted-poitou-tate"></a>
#### Finite-coefficient Poitou–Tate input

**IG.4/restricted-poitou-tate** · theorem.

For a number field K and a finite Γ_K-module A with Cartier dual A^D, the restricted-product local Tate pairings make the global images of H¹(K,A) and H¹(K,A^D) orthogonal complements. For a finite place set S, the dual of the localization defect in H¹ is Sha¹_S(K,A^D)/Sha¹(K,A^D). There is also the perfect duality Sha²(K,A)×Sha¹(K,A^D)→Q/Z. State all maps, the unramified restricted-product subgroups outside a finite ramified set, and the modified real terms. This finite-coefficient kernel is owned here to obey the bottom-up tier order; the broader duality roadmap imports it.

Proof route:

1. Apply local class field duality to finite coefficients and unramified subgroups.
2. Prove the finite-level global reciprocity exact complex and its dual kernel statements.
3. Identify the finite S quotient by taking the annihilator of the projection to S; verify the real-place modifications.

Prerequisites: [IG.4/finite-galois-localization](#IG-4-finite-galois-localization); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma.

Acceptance:

- For an empty place set the localization cokernel is zero.
- Real places use the modified terms and the dual carries its Galois action.

Sources:

- [dlan](#source-dlan), §2.6, equation2.3 and Proposition2.5, pp.1018–1019. States the exact pairing and finite-S quotient but cites the original global duality proof.
- [schmidt-wingberg](#source-schmidt-wingberg), Definitions8–9, p.10; Lemma10 and proof, p.11 (arXiv v1). Uses the same finite-module duality.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Original finite-module global duality proof; Arithmetic embedding signatures.

<a id="IG-4-solution-twisting"></a>
#### Twisting abelian-kernel solutions

**IG.4/solution-twisting** · construction.

Fix a weak lift β of π in an abelian-kernel finite embedding problem. A continuous crossed homomorphism z:Γ_K→A_π gives the lift γ↦z(γ)β(γ), and every other lift is obtained uniquely this way before A-conjugacy. Prescribed compatible local lifts determine local H¹ difference classes. They are globally achievable exactly when their class in the finite-S localization defect vanishes. Properness is a separate condition on the image and can be forced only with an applicable auxiliary-prime theorem.

Proof route:

1. Calculate the crossed-homomorphism equation from the two lifts.
2. Compare local differences and apply the localization cokernel definition; identify coboundaries with A-conjugacy.

Prerequisites: [IG.4/abelian-kernel-obstruction](#IG-4-abelian-kernel-obstruction); [IG.4/finite-galois-localization](#IG-4-finite-galois-localization); [IG.4/restricted-poitou-tate](#IG-4-restricted-poitou-tate).

Uses:

- SW proof Theorem15; Grunwald–Wang corrections: Records the local adjustment without claiming all weak lifts become proper.

API:

- EmbeddingTwist.apply (constructor): zβ is a weak lift with the same quotient map.
- EmbeddingTwist.difference (characterisation): β′β⁻¹ is the unique crossed homomorphism relating actual lifts.
- EmbeddingTwist.localize (compatibility): Twisting restricts to twisting by the local cocycle.
- EmbeddingTwist.localCriterion (characterisation): The localization-defect class is zero exactly when the local difference classes are globally realizable.

Tests:

- EmbeddingTwist.zero_test (computation): The trivial cocycle fixes β.
- EmbeddingTwist.action_test (non-example): When Q acts nontrivially on A a difference cocycle is crossed, rather than an ordinary group homomorphism.
- EmbeddingTwist.proper_test (non-example): Twisting a proper lift can produce a nonproper lift; for C₂→1 twisting by its own inverse produces the trivial lift.

Acceptance:

- The trivial cocycle fixes β.
- When Q acts nontrivially on A a difference cocycle is crossed, rather than an ordinary group homomorphism.
- Twisting a proper lift can produce a nonproper lift; for C₂→1 twisting by its own inverse produces the trivial lift.

Sources:

- [dlan](#source-dlan), Proposition2.2 and equation2.2, pp.1015–1016. Fixes the multiplication order in twisting.
- [schmidt-wingberg](#source-schmidt-wingberg), Proof of Theorem15, steps3–4, PDF pp.27–32. Separates properness and local correction from weak solvability.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Arithmetic embedding signatures.

<a id="IG-4-grunwald-wang-boundary"></a>
#### Grunwald–Wang and its exceptional class

**IG.4/grunwald-wang-boundary** · theorem.

For a number field K and a positive integer m, Sha¹(K,μ_m) is either zero or cyclic of order two in the Grunwald–Wang exceptional case. The exceptional possibility must be retained in cyclic local prescriptions. Over Q the everywhere-local fourth- and eighth-power principle gives Sha¹(Q,μ₄)=Sha¹(Q,μ₈)=0; duality therefore gives Sha²(Q,Z/4)=Sha²(Q,Z/8)=0. These statements concern the everywhere-local kernels; they do not remove the Wang obstruction to arbitrary finite-place cyclic C₈ prescriptions.

Proof route:

1. Use the explicit valuation and real-place argument for Q fourth/eighth powers.
2. State the general exceptional-case criterion with its dyadic root-of-unity conditions, using the exact original theorem as a proof obligation.
3. Apply restricted duality to obtain the stated constant-module degree-two vanishings.

Prerequisites: [IG.4/finite-galois-localization](#IG-4-finite-galois-localization); [IG.4/restricted-poitou-tate](#IG-4-restricted-poitou-tate); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

Acceptance:

- Retain the possible order-two exceptional obstruction for 2-power roots.
- Away from the exceptional hypotheses use the zero defect; do not assert it universally.

Sources:

- [harpaz-wittenberg23](#source-harpaz-wittenberg23), §7, Lemma7.6 and argument, PDF pp.28–31. The Q calculation and the exact order-two general alternative.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Original finite-module global duality proof; Arithmetic embedding signatures.

<a id="IG-4-independent-cyclic-eight-lifts"></a>
#### Two independent cyclic degree-eight lifts

**IG.4/independent-cyclic-eight-lifts** · application.

Let p and q be distinct positive primes congruent to 1 modulo 8. The quadratic characters of Q(√p) and Q(√(2q)) admit surjective lifts Γ_Q→Z/8. Their pair is surjective onto (Z/8)², so the compositum has degree 64. Its three quadratic subfields are Q(√p), Q(√(2q)), Q(√(2pq)); none is Q(√(−1)), Q(√2), or Q(√(−2)). Independence is verified modulo 2 and then by the finite abelian Frattini criterion, rather than assumed for arbitrary two cyclic lifts.

Proof route:

1. Apply the cyclic eight-lift obstruction criterion and the local checks in the source.
2. The two quadratic square classes are independent by p,q valuations.
3. A subgroup of (Z/8)² surjective modulo 2 is the whole group; enumerate its quadratic characters.

Prerequisites: [IG.4/abelian-kernel-obstruction](#IG-4-abelian-kernel-obstruction); [IG.4/grunwald-wang-boundary](#IG-4-grunwald-wang-boundary); [IG.2/frattini-full-image](#IG-2-frattini-full-image).

Acceptance:

- The distinct quadratic characters give independent mod-two images, so their C₈ lifts generate C₈² by Frattini.

Sources:

- [harpaz-wittenberg23](#source-harpaz-wittenberg23), Lemma7.6 and final proof, PDF pp.28–31. A concrete two-lift construction, distinct from general Grunwald prescriptions.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Arithmetic embedding signatures.

<a id="IG-4-free-operator-shrinking"></a>
#### Free operator-group shrinking

**IG.4/free-operator-shrinking** · theorem.

Let G be finite, p prime, F(d) the free pro-p G-operator group on d free G-orbits. For ν=(i,j), i≥j≥1, put F(d)^ν=(F(d)^i∩F(d)_j)F(d)^(i+1), using descending p-central and lower-central series, with ν+1=(i,j+1) if j<i and (i+1,1) otherwise. Write E(d,ν)=F(d)^ν/F(d)^(ν+1). Fix n,t, an integer k and a finite F_p[G]-module T. There is m₀≥n such that for every m≥m₀ and every t classes in Tate H^k(G,E(m,ν)⊗T), some surjective G-operator map F(m)→F(n) sends them to zero. There is also the Proposition7 version for t classes in Tate degree −2 of F(m)/F(m)^ν⋊G or F(m)/F(m)^ν, with coefficient E(m,ν)⊗T, killed by the corresponding map to n. The module action of the quotient F(m)/F(m)^ν on coefficients is trivial. These are separately typed maps of group-and-coefficient cohomology, not a map killing arbitrary classes in every degree at once.

Proof route:

1. The iterated-commutator p-power map from the j-th tensor power of the Frattini quotient surjects onto E(d,ν) (Proposition5).
2. Chevalley–Warning gives a surjective F_p[G]-linear shrinking map killing the finite list of tensor elements (Proposition2); lift it by the free G-operator property and Frattini generation.
3. Dimension shifting reduces Proposition6 to Tate degree −1. For Proposition7 use Tate H^−2=H₁, the low-degree homology sequence of the semidirect product and two successive shrinkings.
4. Keep the four arithmetic uses in the Theorem15 induction separate; the free operator group is an imported free pro-p construction.

Prerequisites: tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-5-presentations-extensions-and-the-rank-interpretations; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma; tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation; tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets.

Acceptance:

- The map stays surjective after killing a finite prescribed class list.
- The refinement successor at (i,i) is (i+1,1), and the degree −2 variant is homology H₁, not ordinary H².

Sources:

- [schmidt-wingberg](#source-schmidt-wingberg), Propositions2,5–7 and proofs, PDF pp.3–11. Supplies the shrinking input used four different ways in the arithmetic induction.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Arithmetic embedding signatures.

<a id="IG-4-induced-proper-solutions"></a>
#### Induced abelian proper solutions

**IG.4/induced-proper-solutions** · theorem.

Let K/k be a finite Galois extension of global fields with group G, p a prime and n≥0. Every finite embedding problem with kernel the G-module F_p[G]^n over the quotient Γ_k↠G has a proper solution. H²(G,F_p[G]^n)=0, so the finite-group extension splits; its pulled-back obstruction vanishes, yielding a weak solution; choose auxiliary primes splitting completely in K (away from 2 for number fields) and local homomorphisms whose images generate the whole kernel. Shapiro and Grunwald–Wang produce a twist matching them, which forces surjectivity. This statement is for the induced module, not every abelian kernel.

Proof route:

1. Use Shapiro and the infinite supply of cyclic p-extensions of K, with disjointness and the stated local conditions, for the induced kernel.
2. Dualize the finite-S cokernel and use Chebotarev to select a finite detecting family of split primes.
3. State the p=char k additive-cohomology branch separately.

Prerequisites: [IG.4/proper-local-embedding-problem](#IG-4-proper-local-embedding-problem); [IG.4/restricted-poitou-tate](#IG-4-restricted-poitou-tate); [IG.4/solution-twisting](#IG-4-solution-twisting); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

Acceptance:

- At n=0 there is no kernel and the given quotient is already proper.
- For positive n use H² of the finite group G, then local generator conditions to force full image.

Sources:

- [schmidt-wingberg](#source-schmidt-wingberg), Proposition11 and entire proof, PDF p.11. Induced-module vanishing and auxiliary generators force properness.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Arithmetic embedding signatures.

<a id="IG-4-cyclic-ramification-correction"></a>
#### Cyclic ramification correction

**IG.4/cyclic-ramification-correction** · theorem.

Let Ω/K/k be finite Galois extensions of global fields with char(k)≠p and μ_p⊂K. Let T be finite, containing Ram(Ω/k), primes above p and S∞ (for a function field S∞ is a fixed nonempty finite set). Put S=cs(Ω/k)∪T. Let A be a finite F_p[Gal(K/k)]-module and y∈H¹(k_S/K,A), unramified at every P above T and zero over Ram(K/k)∪S_p∪S∞. Then there is x∈H¹(k_S/k,A) whose localization at v∈T equals (cor_K^k y)_v and whose localization is cyclic for v outside T. Cyclic means split by a cyclic local extension. The proof strengthens this by constructing z with z_P=y_P above T, and at each newly ramified P, cyclic z_P and zero z_{σP} for nonidentity σ. Its p=2 branch combines three classes; it is not the char(k)=p Artin–Schreier branch, which belongs separately to Theorem15.

Proof route:

1. Apply finite-S duality and the cokernel-capture lemma.
2. Select new primes with the required split/Frobenius properties and solve the character corrections by reciprocity.
3. For characteristic p use the three additive classes and their specified disjoint ramification supports.

Prerequisites: [IG.4/induced-proper-solutions](#IG-4-induced-proper-solutions); [IG.4/solution-twisting](#IG-4-solution-twisting); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

Acceptance:

- A zero y permits zero x.
- Retain zero localization at ramified, p-adic and infinity places; p=2 uses the three-class correction.

Sources:

- [schmidt-wingberg](#source-schmidt-wingberg), Theorem13 and full proof, PDF pp.13–20. Exact class hypotheses, corestriction conclusion and conjugate-prime correction.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Arithmetic embedding signatures.

<a id="IG-4-split-nilpotent-proper-solutions"></a>
#### Split nilpotent proper embedding theorem

**IG.4/split-nilpotent-proper-solutions** · theorem. Planet: Split nilpotent embedding theorem.

For a number field k, every finite split embedding problem for Γ_k with nilpotent kernel has a proper solution. More precisely, Schmidt–Wingberg Theorem15 realizes each finite free-operator quotient F(n)/F(n)^ν⋊G above a given G-extension K/k, with the old ramified, p-adic and infinite places split over K and every new ramified place split in K/k and having cyclic totally ramified local extension over k, in the theorem’s hypotheses and inductive choices. Arbitrary nonsplit nilpotent embedding problems are not included.

Proof route:

1. Induct on the refined filtration. Shrink the local H² classes at old bad places using induced modules.
2. Shrink the resulting global Sha² obstruction using the finite-module duality surjection and Tate twist.
3. Obtain properness from the degree-one induced-kernel theorem and auxiliary-prime cokernel capture.
4. Twist once more to restore local prescriptions and cyclic new ramification. Maintain the local conditions through every shrinking map.
5. Every finite nilpotent G-operator kernel is a quotient of a finite free-operator quotient; descend the proper solution through that quotient.

Prerequisites: [IG.4/free-operator-shrinking](#IG-4-free-operator-shrinking); [IG.4/induced-proper-solutions](#IG-4-induced-proper-solutions); [IG.4/cyclic-ramification-correction](#IG-4-cyclic-ramification-correction); [IG.4/abelian-kernel-obstruction](#IG-4-abelian-kernel-obstruction); [IG.4/restricted-poitou-tate](#IG-4-restricted-poitou-tate).

Acceptance:

- For an identity kernel the original quotient is proper.
- A nonsplit arbitrary-kernel problem is outside the theorem.

Sources:

- [schmidt-wingberg](#source-schmidt-wingberg), Theorems14–15 and their entire proof, PDF pp.20–32. The complete constructive solvable realization input.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Original finite-module global duality proof; Arithmetic embedding signatures.

<a id="IG-4-fitting-supplement"></a>
#### Fitting supplements for solvable groups

**IG.4/fitting-supplement** · construction.

For a finite group G define F(G) as the supremum of its nilpotent normal subgroups. Prove that it is normal, characteristic and nilpotent, hence the largest nilpotent normal subgroup. For a nontrivial finite solvable G, the native Frattini subgroup Φ(G) is properly contained in F(G). Every normal subgroup N not contained in Φ(G) has a proper supplement U<G with N∨U=G. In particular F(G) has such a solvable supplement, and multiplication F(G)⋊U→G is surjective. The inductive kernel is F(G).

Proof route:

1. Use the finite-group Fitting and Frattini structure theorems with their exact finite-solvable hypotheses.
2. Choose a maximal subgroup missing an element of N to get NU=G.
3. Check the conjugation semidirect multiplication map and nilpotence of F(G).

Prerequisites: mathlib:Subgroup; mathlib:frattini; mathlib:Group.IsNilpotent; mathlib:Group.IsSolvable.

Uses:

- Schmidt–Wingberg Propositions16–17, pp.32–33; IG.4 Shafarevich theorem: Supplies the precise normal nilpotent kernel and smaller solvable supplement in the induction.

API:

- FittingSubgroup.normal (structure): F(G) is normal and characteristic.
- FittingSubgroup.nilpotent (structure): For finite G, the subgroup F(G) is nilpotent.
- FittingSubgroup.le (universal-property): Every nilpotent normal subgroup N of finite G satisfies N≤F(G).
- FittingSubgroup.frattini_lt (compatibility): For finite nontrivial solvable G, Φ(G)<F(G).
- FittingSubgroup.supplement (constructor): For finite nontrivial solvable G there is U<G with F(G)∨U=G; the semidirect multiplication homomorphism is surjective.

Tests:

- FittingSubgroup.abelian_test (degenerate): For a finite abelian group, F(G)=G, including the trivial group.
- FittingSubgroup.s3_test (computation): For S₃, F(G) has order three and a subgroup generated by a transposition is a proper supplement.
- FittingSubgroup.s5_test (non-example): For S₅, F(G)=1=Φ(G), so the strict inclusion cannot be stated without solvability.

Acceptance:

- For a nontrivial p-group F(G)=G and Frattini is proper; for S₃ the supplement to C₃ is C₂.

Sources:

- [schmidt-wingberg](#source-schmidt-wingberg), Propositions16–17 and proofs, arXiv v1 pp.32–33. The final smaller-group induction; the structural theorem is cited to Huppert.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration. The supplement subgroup is typed; the semidirect multiplication map and its surjectivity remain part of the group construction.
Recorded gaps: Finite solvable structural proof; Arithmetic embedding signatures.

<a id="IG-4-shafarevich-solvable-realization"></a>
#### Shafarevich solvable realization

**IG.4/shafarevich-solvable-realization** · theorem. Planet: Shafarevich theorem.

Every finite solvable group G is the Galois group of a finite Galois extension of every number field k. Induct on |G|: realize the proper supplement U of F(G), solve the split nilpotent problem F(G)⋊U properly, then take the quotient field realizing G. The trivial group is realized by k itself. This theorem supplies solvable realizations; it leaves the general finite-group inverse Galois problem over Q open.

Proof route:

1. Apply the Fitting-supplement theorem and induction to U.
2. Use the split nilpotent proper theorem above the U-extension.
3. Take the fixed field of the kernel of F(G)⋊U→G and compute its Galois group.

Prerequisites: [IG.4/fitting-supplement](#IG-4-fitting-supplement); [IG.4/split-nilpotent-proper-solutions](#IG-4-split-nilpotent-proper-solutions); mathlib:IsGalois.normalAutEquivQuotient.

Acceptance:

- C₂, C₃ and D₈ are covered, while A₅ is outside the solvable hypothesis.
- The final quotient group is obtained from the normal fixed field of a proper solution.

Sources:

- [schmidt-wingberg](#source-schmidt-wingberg), Theorem of Shafarevich in Introduction, PDF pp.1–2, concluding proof p.32. Proof-faithful finite solvable theorem.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Recorded gaps: Finite solvable structural proof; Arithmetic embedding signatures.

<a id="IG-4-supersolvable-grunwald"></a>
#### Supersolvable Grunwald prescriptions

**IG.4/supersolvable-grunwald** · theorem.

Let G be finite supersolvable and k a number field. For a finite place set S containing no finite place whose residue characteristic divides |G|, and local Galois extensions L_v/k_v whose groups embed in G, there is a proper G-Galois extension L/k inducing exactly L_v at every v∈S. Specify embeddings when marked local homomorphisms are required. The excluded-prime condition is essential: the cyclic order-eight Wang phenomenon prevents the unconditional all-place version.

Proof route:

1. Apply the proved Brauer–Manin density theorem for smooth proper compactifications of homogeneous spaces with finite supersolvable geometric stabilizer, retaining its outer-action form.
2. Identify local G-torsors with points of SL_n/G and use weak approximation outside the bad places.
3. Add auxiliary cyclic decomposition prescriptions forcing the global image to equal G; then recover the fields and their completions.

Prerequisites: [IG.4/proper-local-embedding-problem](#IG-4-proper-local-embedding-problem); [IG.0/finite-galois-algebras](#IG-0-finite-galois-algebras); SchemeAndStackFoundations:SF.4; ReductiveGroupsPartII:RG2.0a; [IG.2/number-field-hilbert](#IG-2-number-field-hilbert); [IG.4/auxiliary-class-properness](#IG-4-auxiliary-class-properness); [IG.4/finite-quotient-approximation](#IG-4-finite-quotient-approximation).

Acceptance:

- For C₃, prescribed good-place cyclic extensions are realized by a surjective global character.
- Places whose residue characteristic divides |G| are excluded.

Sources:

- [harpaz-wittenberg20](#source-harpaz-wittenberg20), TheoremB and its corollary, PDF pp.3–5; proof §§6.1–6.4, pp.20–23. Separates supersolvable local realization from the solvable existence theorem.
- [dlan](#source-dlan), Proposition2.4, published p.1018. Identifies local H¹ surjectivity with quotient-space approximation.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Homogeneous-space arithmetic proof input; Arithmetic embedding signatures.

<a id="IG-4-quaternion-all-place-prescriptions"></a>
#### Quaternion prescriptions at every place

**IG.4/quaternion-all-place-prescriptions** · theorem.

For a generalized quaternion group Q_{2^m} (m≥3), a number field k, an arbitrary finite place set S and local Galois extensions with groups embedded in Q_{2^m}, a proper quaternion realization inducing those extensions exists. The all-place improvement uses the vanishing of the unramified Brauer quotient of SL_n/Q_{2^m}, in addition to supersolvability. It is not a theorem for every nilpotent or supersolvable group.

Proof route:

1. Use the finite-quaternion unramified Brauer computation.
2. Apply the same homogeneous-space density/local torsor argument, now with no bad-place restriction.
3. Force properness using auxiliary local subgroups.

Prerequisites: [IG.4/supersolvable-grunwald](#IG-4-supersolvable-grunwald).

Acceptance:

- For Q₈ retain embeddings of the prescribed local groups into Q₈ and permit bad places under this separate theorem.

Sources:

- [harpaz-wittenberg20](#source-harpaz-wittenberg20), Discussion after the corollary, PDF p.4. Explicitly invokes Demarche2010 Corollary3/Remark7 for the all-place improvement.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Homogeneous-space arithmetic proof input; Arithmetic embedding signatures.

<a id="IG-4-collective-degree-realization"></a>
#### Collectively coprime realization degrees

**IG.4/collective-degree-realization** · theorem.

For a finite group G and number field k, there are finite extensions k_i/k whose degrees have greatest common divisor one and regular G-realizations over every k_i(t). This does not assert that one k_i equals k. Use the Hilbert subset attached to SL_n→SL_n/G and a degree-one zero-cycle supported on it; spread along rational curves to obtain the regular form with the precise geometric input in Harpaz–Wittenberg Remark7.11.

Proof route:

1. Move a degree-one zero-cycle into a Hilbert subset on the smooth quotient by induction on dimension.
2. Each support residue field gives a full-group fiber.
3. Apply the cited rational-connectedness regular-cover construction for the regular refinement, keeping its proof obligation explicit.

Prerequisites: [IG.2/hilbert-subsets](#IG-2-hilbert-subsets); [IG.4/proper-local-embedding-problem](#IG-4-proper-local-embedding-problem); SchemeAndStackFoundations:SF.4.

Acceptance:

- A greatest-common-divisor-one list of extension degrees need not contain degree one.
- Do not deduce a realization over the original number field from this conclusion.

Sources:

- [harpaz-wittenberg20](#source-harpaz-wittenberg20), Remark7.11, PDF p.28. The collectively coprime-degree result is independent of the general inverse Galois conjecture.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Homogeneous-space arithmetic proof input; Arithmetic embedding signatures.

<a id="IG-4-base-no-unramified-extension"></a>
#### No unramified split-infinity extension of the base

**IG.4/base-no-unramified-extension** · theorem.

Import the native NumberField.finrank_eq_one_of_unramified: a finite extension of Q with unramified integral closure has degree one; there is no additional infinite-place hypothesis. For a finite separable extension of F_q(t) unramified at every place and split at infinity, the curve Hurwitz genus formula forces its geometric degree to be one, and splitting at infinity eliminates a nontrivial constant-field extension. This node supplies the function-field conclusion and the adapter to the imported number-field theorem.

Proof route:

1. Use the implemented number-field theorem, without planning its discriminant proof again.
2. Apply the unramified separable Hurwitz formula over an algebraic closure: 2g−2=−2d requires d=1.
3. An everywhere unramified residual extension is constant; a split rational infinity place forces its constant degree to be one.

Prerequisites: mathlib:NumberField.finrank_eq_one_of_unramified; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-.

Acceptance:

- A nontrivial constant extension of F_q(t) is unramified but fails splitting at infinity.
- The number-field conclusion invokes the native degree-one theorem.

Sources:

- [wood](#source-wood), §2.1, published p.383. The base unramified-extension input.
- [lwzb](#source-lwzb), §2.1, PDF pp.10–11. Used for admissibility of Γ-groups.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Arithmetic embedding signatures.

<a id="IG-4-unramified-gamma-groups"></a>
#### Unramified admissible Γ-groups

**IG.4/unramified-gamma-groups** · definition.

Let Q₀ be Q or F_q(t), Γ finite, and K/Q₀ a Γ-extension. Put Δ=2|Γ| over Q and Δ=q(q−1)|Γ| over F_q(t). Let K# be the maximal everywhere-unramified, split-infinity extension of K all of whose finite subextensions have degree prime to Δ. The exact extension of Γ by H=Gal(K#/K) has Schur–Zassenhaus complements, which induce Γ-actions on H; complements are conjugate, so the action is canonical only up to H-inner conjugacy. A profinite Γ-group is admissible when it is pro-prime-to-|Γ| and topologically generated by h⁻¹γ(h), for h∈H,γ∈Γ. Its Γ-coinvariants are therefore trivial. The particular arithmetic H also has the stronger prime-to-Δ condition.

Proof route:

1. Form the extension from the characteristic field condition and take prime-to-Δ quotients.
2. Apply profinite Schur–Zassenhaus to choose complements and compare them.
3. Identify the quotient by the closed normal commutator subgroup with a forbidden base unramified split-infinity extension.

Prerequisites: [IG.4/base-no-unramified-extension](#IG-4-base-no-unramified-extension); [IG.4/proper-local-embedding-problem](#IG-4-proper-local-embedding-problem); [IG.4/coprime-profinite-complements](#IG-4-coprime-profinite-complements).

Uses:

- LWZB PropertyE and finite quotients; Wood marked extensions: Defines the actual arithmetic profinite object whose finite quotients are counted.

API:

- UnramifiedGammaGroup.complement (constructor): A complement supplies the Γ-action, with conjugacy as its exact independence statement.
- UnramifiedGammaGroup.baseChange (compatibility): Finite Γ-stable quotients correspond to characteristic prime-to-Δ unramified split-infinity fields.
- AdmissibleGammaGroup.coinvariants (characterisation): The closed normal subgroup generated by h⁻¹γ(h) is the whole group.
- AdmissibleGammaGroup.quotient (functoriality): Every finite Γ-equivariant quotient remains admissible.

Tests:

- AdmissibleGammaGroup.trivial_test (computation): The trivial group is admissible.
- AdmissibleGammaGroup.trivialAction_test (non-example): A nontrivial group with trivial Γ-action is not admissible.
- UnramifiedGammaGroup.constants_test (non-example): The constant F_{q²}(t) extension is unramified but fails split infinity and must be excluded.

Acceptance:

- The trivial group is admissible.
- A nontrivial group with trivial Γ-action is not admissible.
- The constant F_{q²}(t) extension is unramified but fails split infinity and must be excluded.

Sources:

- [lwzb](#source-lwzb), Definition2.1 and Proposition2.2 with proof, PDF pp.10–11. Pins Δ, the choice of action, and admissibility.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Arithmetic embedding signatures; Profinite complement conjugacy proof.

<a id="IG-4-property-e"></a>
#### Central Property E

**IG.4/property-e** · definition.

An admissible profinite Γ-group H has Property E if for every finite admissible Γ-quotient H→F and every nonsplit central Γ-equivariant extension 1→C_p→E→F→1 with p∤Δ, the quotient map has a proper Γ-equivariant lift H→E. This is a restricted family of central problems; it is not projectivity for all finite embedding problems. A weak lift here is automatically proper: a proper image still surjecting to F would have trivial intersection with the prime-order kernel and would split the extension.

Proof route:

1. Use the imported finite embedding carrier and add the Γ-equivariance condition.
2. For a weak lift apply the prime-order intersection dichotomy and nonsplitting to prove surjectivity.

Prerequisites: [IG.4/proper-local-embedding-problem](#IG-4-proper-local-embedding-problem); [IG.4/unramified-gamma-groups](#IG-4-unramified-gamma-groups); tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-5-presentations-extensions-and-the-rank-interpretations.

Uses:

- LWZB Theorem2.5; admissible quotient distribution: Distinguishes this property from general projectivity.

API:

- PropertyE.lift (universal-property): Every specified nonsplit prime central problem has an equivariant proper lift.
- PropertyE.weakIsProper (characterisation): Nonsplitting plus a prime-order central kernel makes a weak lift proper.
- PropertyE.finiteReduction (compatibility): Each problem factors through a finite Γ-stable quotient.
- PropertyE.admissibility (data): The ambient H retains its prime-to-Δ admissibility hypotheses.

Tests:

- PropertyE.nonsplit_test (computation): A weak lift to C_{p²} over C_p is automatically surjective.
- PropertyE.split_test (non-example): The section F→C_p×F is weak and nonproper, so nonsplitting cannot be dropped.
- PropertyE.generalKernel_test (non-example): The nonsplit map C₄×C₂→C₂ given by the first coordinate modulo2 has kernel C₂² and a weak lift with image C₄×{1}; hence automatic properness needs the prime-order kernel hypothesis.

Acceptance:

- A weak lift to C_{p²} over C_p is automatically surjective.
- The section F→C_p×F is weak and nonproper, so nonsplitting cannot be dropped.
- The nonsplit map C₄×C₂→C₂ given by the first coordinate modulo2 has kernel C₂² and a weak lift with image C₄×{1}; hence automatic properness needs the prime-order kernel hypothesis.

Sources:

- [lwzb](#source-lwzb), Definition2.4 and Theorem2.5, PDF pp.11–13. The special central property of the arithmetic admissible group.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Arithmetic embedding signatures.

<a id="IG-4-unramified-property-e"></a>
#### Property E for the arithmetic unramified group

**IG.4/unramified-property-e** · theorem.

The group Gal(K#/K) with any of the conjugate Γ-actions above has Property E. Lift the finite central embedding problem globally over Q₀, then twist by a global character to make its restriction match inertia at each finite place and the entire decomposition group at infinity. The residual extension is everywhere unramified and split infinity over K, of degree prime to Δ, and hence factors through K#. In the profinite reduction choose a Γ-stable open normal U with U∩ker α=1; normality is necessary to form the quotient.

Proof route:

1. Solve the central weak embedding problem using the global obstruction criterion in the root-of-unity-free base range.
2. Apply the global-character lemma to the finite inertia prescriptions and the full infinity prescription.
3. Use the defining maximality of K# and the nonsplit prime-kernel argument for properness.

Prerequisites: [IG.4/property-e](#IG-4-property-e); [IG.4/abelian-kernel-obstruction](#IG-4-abelian-kernel-obstruction); [IG.4/restricted-poitou-tate](#IG-4-restricted-poitou-tate); [IG.4/solution-twisting](#IG-4-solution-twisting); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

Acceptance:

- A nonsplit prime-order central problem has properness once a weak lift exists.
- The corrected local conditions and prime exclusions are part of the extension theorem.

Sources:

- [lwzb](#source-lwzb), Theorem2.5 and Lemmas2.6–2.7, with proofs, PDF pp.11–13. Finite-prime inertia is prescribed; prescribing whole finite decomposition groups would be stronger.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Original finite-module global duality proof; Central global-character criterion; Arithmetic embedding signatures.

<a id="IG-4-tame-central-lift"></a>
#### Tame central lift after adjoining roots

**IG.4/tame-central-lift** · theorem.

Use Wood’s precise setting: a finite F with an epimorphism ε:F→C₂, and c a single conjugacy class consisting of all involutions outside ker ε. Let K be a global field of characteristic prime to |F| and φ:Γ_K→F tame with inertia in c∪{1}. Import the reduced Schur cover S_c→F and set L=K(μ_{4|S_c|}). There is a tame lift Γ_L→S_c of φ|_{Γ_L}. The proof uses vanishing of the central H² obstruction over L, since the coefficient exponent divides |μ_L| and the everywhere-local dual H¹ kernel vanishes in this trivial-action range. It then adjusts local lifts by characters to retain tameness. The dyadic μ₄ condition is retained.

Proof route:

1. Use the imported reduced central cover and the actual prime divisors of its finite kernel.
2. Check local tame lift equations, including Frobenius x Frobenius⁻¹=x^{Nv}; remove p-primary factors at residue characteristic p.
3. Apply Sha² duality and the everywhere-split character argument, and then the Grunwald–Wang correction with μ₄ to obtain the tame lift.

Prerequisites: [IG.4/abelian-kernel-obstruction](#IG-4-abelian-kernel-obstruction); [IG.4/restricted-poitou-tate](#IG-4-restricted-poitou-tate); [IG.4/grunwald-wang-boundary](#IG-4-grunwald-wang-boundary); [IG.4/solution-twisting](#IG-4-solution-twisting); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence; InductionRestrictionPartII:RS.1/reduced-cover; InductionRestrictionPartII:RS.1/conjugacy-bijection.

Acceptance:

- Use the one outside-involution class and retain the tame, global and characteristic hypotheses.
- The trivial lift need not have full image in the covering group; field realization is not claimed here.

Sources:

- [wood](#source-wood), Lemma3.2 and full proof, published pp.389–390. The global lift lemma needed to define the arithmetic invariant.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Original finite-module global duality proof; Arithmetic embedding signatures.

<a id="IG-4-global-arithmetic-invariant"></a>
#### The global arithmetic lifting invariant

**IG.4/global-arithmetic-invariant** · construction.

In the exact setting of the tame central lift, choose a lift φ̃:Γ_L→S_c and c₀∈c. For f∈S_c above c∪{1}, let z(f) be the unique element in its conjugacy class above c₀ or 1, using the supplier’s bijection of lifted classes. For u∈μ_L and every finite place v of L choose β_v in inertia mapping to u in the maximal tame abelian exponent-|S_c| local class-field quotient. Define I(φ,u)=∏_{v finite}z(φ̃(β_v)). The factors commute and only finitely many are nontrivial. The result lies in the reduced multiplier A[|μ_K|]; it is independent of lifts, β_v, c₀ and conjugacy choices and is a homomorphism μ_L→A[|μ_K|]. Keep the finite-place product and its root-of-unity normalization; this construction is not claimed for arbitrary unions of classes.

Proof route:

1. Use the class-bijection API to define z and prove all factors commute.
2. Central lift changes give a global character; reciprocity makes its finite-place product one.
3. Check conjugacy independence, centrality, |μ_K|-torsion and the power law using Lemmas3.3–3.11.

Prerequisites: [IG.4/tame-central-lift](#IG-4-tame-central-lift); InductionRestrictionPartII:RS.2/universal-kernel; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

Uses:

- Wood Theorem3.13; IG.3 arithmetic/geometric comparison; marked extension refinements: Makes a geometric component invariant into the specified arithmetic root-of-unity invariant.

API:

- ArithmeticLiftingInvariant.product (constructor): The finite-place product is defined and lands in A[|μ_K|].
- ArithmeticLiftingInvariant.choiceIndependent (compatibility): All the stated auxiliary choices give the same value.
- ArithmeticLiftingInvariant.power (functoriality): I(φ,u^a)=I(φ,u)^a for integers a.
- ArithmeticLiftingInvariant.conjugacy (compatibility): Conjugating the representation leaves the invariant unchanged.

Tests:

- ArithmeticLiftingInvariant.identity_test (computation): The value at u=1 is one.
- ArithmeticLiftingInvariant.noRamification_test (computation): If every finite inertia image of the chosen lift is trivial the product is one.
- ArithmeticLiftingInvariant.scope_test (non-example): For classes of general order the involution-class z and ε parity proof do not apply; one cannot reuse this definition without a new theorem.

Acceptance:

- The value at u=1 is one.
- If every finite inertia image of the chosen lift is trivial the product is one.
- For classes of general order the involution-class z and ε parity proof do not apply; one cannot reuse this definition without a new theorem.

Sources:

- [wood](#source-wood), Definition3.1 and Lemmas3.3–3.11, full proofs, published pp.388–393. Exact arithmetic construction and its independence statements.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Arithmetic embedding signatures.

<a id="IG-4-marked-arithmetic-extensions"></a>
#### Marked extensions and their infinity types

**IG.4/marked-arithmetic-extensions** · definition.

For a global field Q with chosen infinity place and Q^sep embedded in Q_∞^sep, a marked (G,c)-extension is a finite Galois field M/Q, an isomorphism Gal(M/Q)≃G, and a Q_∞-algebra homomorphism m:M⊗Q Q_∞→Q_∞^sep. Finite inertia images lie in c∪{1}; infinity has its own type Γ_{Q_∞}→G defined using m. Isomorphisms preserve the group identification and marking. In Wood Proposition4.4 distinguish the ramified-quadratic-infinity branch with fixed image ⟨(1,τ)⟩ from the split-infinity branch with a chosen twist y of the surjection. The bijection needs nontrivial C₂ quotient and exact monodromy/type G′; allowing a group G′ inside the base kernel invalidates it. In the tame quadratic function-field case the discriminant divisor satisfies Disc(M)=Disc(K)^{|G′|/2}.

Proof route:

1. A marking selects a distinguished embedded representative and hence an actual homomorphism, rather than just its conjugacy class.
2. Apply the two constructions in Proposition4.4 under the stated quotient and type hypotheses and check their inverses.
3. Compute the tame quadratic ramification exponents and retain the infinity contribution.

Prerequisites: [IG.4/proper-local-embedding-problem](#IG-4-proper-local-embedding-problem); [IG.4/base-no-unramified-extension](#IG-4-base-no-unramified-extension); [IG.4/unramified-gamma-groups](#IG-4-unramified-gamma-groups).

Uses:

- Wood Theorems4.5–4.7; rational points of marked Hurwitz schemes: Pins the exact arithmetic objects parametrized by finite-field points.

API:

- MarkedExtension.infinityType (data): The marking defines the entire local homomorphism, with its chosen decomposition embedding.
- MarkedExtension.embeddedRepresentative (characterisation): Each isomorphism class has the specified representative inside Q^sep with inclusion marking.
- MarkedExtension.quadraticCorrespondence (equivalence): The ramified and split-infinity branches give their separately specified surjection/twist correspondences.
- MarkedExtension.discriminant (compatibility): The tame quadratic divisor equality includes infinity when ramified.

Tests:

- MarkedExtension.splitInfinity_test (computation): Trivial infinity type means every selected local factor is Q_∞.
- MarkedExtension.ramifiedInfinity_test (computation): The ramified quadratic type sends tame inertia to the chosen involution and the specified Frobenius lift to one.
- MarkedExtension.quotient_test (non-example): Taking G′ with trivial C₂ projection gives no quadratic fixed field, so fails the printed unqualified converse.

Acceptance:

- Trivial infinity type means every selected local factor is Q_∞.
- The ramified quadratic type sends tame inertia to the chosen involution and the specified Frobenius lift to one.
- Taking G′ with trivial C₂ projection gives no quadratic fixed field, so fails the printed unqualified converse.

Sources:

- [wood](#source-wood), Definition4.3 and Proposition4.4 with proof, published pp.402–403. The two marked correspondences have different infinity and twist data.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

<a id="IG-4-identity-root-invariant"></a>
#### Identity-root obstruction for the arithmetic invariant

**IG.4/identity-root-invariant** · theorem.

For every admissible input to IG.4/global-arithmetic-invariant, I(φ,1)=1. Hence for nonidentity h in the correction group, the refined count with condition I(φ,1)=h is zero at every height where its denominator is nonzero. It cannot have normalized limiting average one. This is an obstruction to the arbitrary-root formulation; it chooses no replacement conjecture.

Proof route:

1. Use the homomorphism μ_L→A and evaluate at its identity.
2. Every extension fails a prescribed nonidentity value at u=1, so the numerator is empty.
3. On every nonzero-denominator height the ratio is zero.

Prerequisites: [IG.4/global-arithmetic-invariant](#IG-4-global-arithmetic-invariant).

Acceptance:

- The identity target h=1 imposes no restriction when u=1.
- A nonidentity target h is impossible at u=1 even if it is attainable at a primitive root.
- No moment limit is asserted at heights with zero denominator.

Sources:

- [wood](#source-wood), Definition3.1 and Lemma3.11, published pp.388–393; Conjecture5.1 p.411. The homomorphism property exposes the identity-root boundary.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

<a id="IG-4-auxiliary-class-properness"></a>
#### Auxiliary cyclic prescriptions force full image

**IG.4/auxiliary-class-properness** · theorem.

For a finite constant group G over a number field k, assume localization H¹(k,G)→∏_{v∈S}H¹(k_v,G) is onto for every finite set S of good places. Add distinct good finite places with unramified local characters whose arithmetic Frobenius values meet every conjugacy class of G. Any global character matching these conditions is surjective. Thus its fixed field is a G-realization with the originally prescribed local subgroup data, up to conjugacy.

Proof route:

1. There are enough good finite places and every cyclic Frobenius character is an unramified local character.
2. A proper subgroup misses a conjugacy class: its transitive action on cosets has a derangement, since the identity contributes more than one fixed point to the Burnside average one.
3. An image meeting every class therefore equals G; translate the character to a field.

Prerequisites: [IG.4/proper-local-embedding-problem](#IG-4-proper-local-embedding-problem); tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius.

Acceptance:

- For G=C₃, an auxiliary Frobenius generator rules out the trivial character.
- For S₃, a subgroup C₃ misses transpositions and a subgroup C₂ misses 3-cycles.
- Without auxiliary conditions a matching H¹ class may have trivial image and classify a split Galois algebra.

Sources:

- [harpaz-wittenberg20](#source-harpaz-wittenberg20), Introduction Grunwald application, pp.3–6; Remark7.11 pp.28–29. Arithmetic application of auxiliary cyclic local conditions.
- [dlan](#source-dlan), Proposition2.4 and proof, published pp.1016–1017. Full image is forced rather than inferred from a nonabelian H¹ class.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

<a id="IG-4-coprime-profinite-complements"></a>
#### Coprime profinite complements

**IG.4/coprime-profinite-complements** · theorem.

Let E be profinite, N a closed normal subgroup, and Γ=E/N finite. Suppose every finite continuous quotient of N has order coprime to |Γ|. There exists a continuous group section Γ→E. Any two such sections are conjugate by an element of N; therefore the induced Γ-actions on N give isomorphic Γ-groups. The implemented finite complement-existence theorem is reused. The separate finite complement-conjugacy theorem and its passage through compatible finite quotients are explicit original-proof obligations.

Proof route:

1. Pass to the cofinal finite quotients of E whose kernels lie in N; each normal image of N is a Hall subgroup.
2. Apply the native finite complement-existence result. Prove the finite conjugacy input in the precise Ribes–Zalesskii theorem, rather than infer it from existence.
3. Use compactness of the section and conjugator conditions to obtain a compatible continuous section and a conjugating element in the inverse limit.

Prerequisites: mathlib:Subgroup.exists_right_complement'_of_coprime; tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations.

Acceptance:

- For a split semidirect product, the displayed Γ factor is a complement.
- For E=C₃⋊C₂=S₃, all order-two complements are conjugate by C₃.
- The central extension C₄→C₂ has kernel C₂ and no section, so the coprimality hypothesis cannot be dropped.

Sources:

- [lwzb](#source-lwzb), Paragraph before Definition2.1, arXiv v2 p.10, citing Ribes–Zalesskii2010 Theorem2.3.15. The section and conjugacy input used to define the arithmetic Γ-action; original theorem not read.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Profinite complement conjugacy proof.

<a id="IG-4-finite-quotient-approximation"></a>
#### Approximation and nonabelian localization

**IG.4/finite-quotient-approximation** · theorem.

Let k be a number field, F a finite k-group embedded in SL_n, and X=SL_n/F. For every finite set S of places, X(k) is dense in ∏_{v∈S}X(k_v) if and only if the localization map H¹(k,F)→∏_{v∈S}H¹(k_v,F) is surjective. Nonconstant F uses its actual Galois action and cocycles; constant groups reduce to continuous homomorphisms modulo conjugacy. The equivalence is independent of the chosen embedding. A class in H¹(k,F) need not be a field realization: full image is a separate auxiliary-place criterion for constant groups.

Proof route:

1. Use the quotient torsor and the connecting maps X(k)→H¹(k,F); H¹(k,SL_n)=1 makes them onto, globally and locally.
2. The local connecting map is locally constant, and each class is one SL_n(k_v)-orbit. Approximation therefore implies localization surjectivity.
3. Conversely choose a global torsor class matching the local classes, lift the local comparison points to SL_n(k_v), and apply weak approximation in SL_n.

Prerequisites: [IG.4/proper-local-embedding-problem](#IG-4-proper-local-embedding-problem); [IG.0/finite-galois-algebras](#IG-0-finite-galois-algebras); [IG.1/homogeneous-space-fundamental-group](#IG-1-homogeneous-space-fundamental-group); tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary; SchemeAndStackFoundations:SF.1.

Acceptance:

- For F=1 the statement reduces to weak approximation of SL_n.
- For constant C₂, H¹(k,C₂)=k×/k×² and the criterion concerns prescribed square classes.
- A global trivial class matches split local torsors but has trivial image, so it cannot certify a nontrivial field.

Sources:

- [dlan](#source-dlan), Proposition2.4, published p.1018; §2.5 discussion pp.1016–1018. The exact weak-approximation/localization equivalence.
- [harpaz-wittenberg20](#source-harpaz-wittenberg20), Introduction Grunwald application pp.3–4. Uses this quotient criterion for supersolvable groups.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

<a id="IG-4-wang-cyclic-eight-counterexample"></a>
#### Wang’s cyclic-eight local obstruction

**IG.4/wang-cyclic-eight-counterexample** · theorem.

There is no cyclic degree-eight extension L/Q for which L⊗Q Q₂ is the unramified degree-eight field extension of Q₂. Thus a supersolvable group such as C₈ does not satisfy arbitrary local Grunwald prescriptions when bad places are included. This is a nonexistence result for the indicated single place and local field, not a failure of every C₈ realization.

Proof route:

1. The identity x⁸−16=(x²−2)(x²+2)(x²−2x+2)(x²+2x+2) and the square classes of 2,−2,−1 show that 16 is an eighth power in Q_v for every v≠2, including the real place.
2. For a cyclic degree-eight extension this implies 16 is a local norm at every v≠2. The product formula for global reciprocity forces it to be a local norm at 2 as well.
3. In an unramified degree-eight extension of Q₂ the valuation of every norm is divisible by eight, whereas v₂(16)=4. This contradiction gives the claimed obstruction.

Prerequisites: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants; [IG.4/grunwald-wang-boundary](#IG-4-grunwald-wang-boundary).

Acceptance:

- The forbidden local algebra is a field of unramified degree eight, not an arbitrary split degree-eight algebra.
- The numerical obstruction is 4 not divisible by 8.
- Cyclic degree-eight extensions of Q exist, for example the degree-eight subfield of Q(ζ₁₇); the theorem excludes only this completion.

Sources:

- [harpaz-wittenberg20](#source-harpaz-wittenberg20), Introduction p.4, citing Wang1948. The bad-place boundary; the norm argument above is given independently in this plan, without claiming to have read Wang’s original article.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

### IG.5

Construct configuration and topological Hurwitz carriers, then algebraic tame and admissible moduli in general marked genus. Separate fixed-degree coefficient comparison from stability, and geometric-component counts from point counts. Field-algebra patching is a prerequisite to, rather than a replacement for, formal branched-cover patching.

<a id="IG-5-configuration-spaces"></a>
#### Ordered and unordered configurations

**IG.5/configuration-spaces** · definition. Planet: Configuration spaces.

For a Hausdorff space T define PConf_n(T) as injective functions Fin n→T with subspace topology, and Conf_n(T) as its quotient by S_n. For the open disc or C use the standard configuration and boundary basepoint convention. Algebraically PConf_n(A¹) is the principal open ∏_{i<j}(x_i−x_j)≠0 in A^n; its R-points require every difference to be a unit, not merely unequal. Conf_n(A¹) is the discriminant-nonvanishing space of monic degree-n polynomials. Conf_n(P¹) is the discriminant open in projective binary forms of degree n. Ordered→unordered is the finite étale S_n-torsor, including n=0,1 conventions.

Proof route:

1. Use the native subtype/quotient topologies. Show that disjoint coordinate neighborhoods give the permutation covering.
2. Construct the polynomial maps using elementary symmetric functions and the discriminant.
3. Check the functor of R-points and descend the finite étale torsor; compare complex analytification.

Prerequisites: SchemeAndStackFoundations:SF.0; SchemeAndStackFoundations:SF.1.

Uses:

- EVW finite Hurwitz covers; Wood marked schemes; LWZB branch-count degree: Configuration is the branch morphism base, with labels controlling S_n descent.

API:

- Configuration.ordered (constructor): Injective tuples give ordered topological configurations; unit-difference tuples give algebraic points.
- Configuration.forgetOrder (functoriality): The quotient map is a covering and its scheme comparison is a finite étale S_n-torsor.
- Configuration.polynomial (equivalence): Unordered affine configurations correspond to monic separable polynomials over fields.
- Configuration.complexComparison (compatibility): The algebraic complex points agree with the topological configurations.

Tests:

- Configuration.empty_test (computation): n=0 is a point in both conventions.
- Configuration.one_test (computation): n=1 gives T, respectively A¹ or P¹.
- Configuration.nonunit_test (non-example): Over Z the distinct values0 and2 do not give a point of PConf₂ because their difference is not a unit.

Acceptance:

- n=0 is a point in both conventions.
- n=1 gives T, respectively A¹ or P¹.
- Over Z the distinct values0 and2 do not give a point of PConf₂ because their difference is not a unit.

Sources:

- [evw](#source-evw), §2.1 and §§7.1,7.3,7.5, published pp.736–737,765–767. Both topological and scheme configuration bases.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

<a id="IG-5-configuration-braid-group"></a>
#### Configurations and punctured-disc groups

**IG.5/configuration-braid-group** · theorem.

For the interior of a closed disc, Conf_n is a K(B_n,1), with the standard adjacent exchange loops corresponding to the imported Artin generators. The boundary-based fundamental group of the n-punctured disc is FreeGroup(Fin n) on positively oriented small loops. In the affine line the ordered boundary product is unconstrained; adding the infinity loop gives product one. The disc mapping-class identification is an external continuation adapter, not a prerequisite from the higher MappingClassGroupsAndCanonicalRepresentations roadmap.

Proof route:

1. Deform the punctured disc onto a wedge of n circles, preserving the chosen loops.
2. Use the forget-last-point fibration of ordered configurations, inductively prove vanishing of higher homotopy groups and identify pure braids.
3. Pass to the S_n cover and compare the adjacent exchanges with the Artin presentation.

Prerequisites: [IG.5/configuration-spaces](#IG-5-configuration-spaces); mathlib:FreeGroup; tauceti:TauCeti.BraidGroup.

Acceptance:

- For n=0,1 the braid group is trivial; for n=2 it is infinite cyclic.

Sources:

- [evw](#source-evw), §2.1, published pp.736–738. Configuration asphericity and the two fundamental-group identifications.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Hurwitz geometry signatures.

<a id="IG-5-topological-hurwitz-covers"></a>
#### Marked topological Hurwitz spaces

**IG.5/topological-hurwitz-covers** · construction. Planet: Topological Hurwitz spaces.

For finite G let S_n=G^n with the IG.3 braid action. The associated cover E B_n×_{B_n}S_n→Conf_n(D) is Hur_{G,n}. Restrict independently to entries in a conjugacy-invariant c, to generating tuples, or to both, giving Hur^c, CHur and CHur^c with fibers c^n, generating G-tuples and generating c-tuples. No product-one restriction is imposed in this disc definition. A marked branched G-cover has a point over the boundary basepoint, a G-torsor away from the branch points and normalized local branched extension. Its connectedness is exactly surjectivity of monodromy. This classification identifies the associated spaces with marked covers.

Proof route:

1. Form the associated cover from the verified covering universal space and action.
2. Classify unramified covers by actual based monodromy and extend at each puncture by its cyclic local model.
3. Restrict to the four invariant fiber subsets and identify connectedness with transitivity on the regular G-fiber.

Prerequisites: [IG.5/configuration-braid-group](#IG-5-configuration-braid-group); [IG.3/hurwitz-braid-action](#IG-3-hurwitz-braid-action); [IG.3/general-riemann-existence](#IG-3-general-riemann-existence).

Uses:

- EVW stability geometry; LWZB analytic comparison; Wood component degree bounds: Provides the finite covers without hidden generation or boundary constraints.

API:

- TopologicalHurwitz.cover (constructor): The associated covering has exactly the stated fiber and projection.
- TopologicalHurwitz.restrictedLoci (compatibility): Class and generating inclusions commute with the projection.
- TopologicalHurwitz.monodromy (equivalence): Marked cover classes with fixed branch positions correspond to actual tuples.
- TopologicalHurwitz.connected (characterisation): The covering curve is connected exactly on the generating locus.

Tests:

- TopologicalHurwitz.empty_test (computation): At n=0 only the trivial image is possible; CHur is empty unless G=1.
- TopologicalHurwitz.degree_test (computation): The degree of Hur^c→Conf_n is |c|^n.
- TopologicalHurwitz.product_test (non-example): A one-puncture C₂ disc cover is allowed with nontrivial boundary product; forcing product one deletes it.

Acceptance:

- At n=0 only the trivial image is possible; CHur is empty unless G=1.
- The degree of Hur^c→Conf_n is |c|^n.
- A one-puncture C₂ disc cover is allowed with nontrivial boundary product; forcing product one deletes it.

Sources:

- [evw](#source-evw), Definition2.2 and §2.3, published pp.738–740. Corrects the ordering of the four fibers and keeps arbitrary tuples.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Hurwitz geometry signatures.

<a id="IG-5-forget-hurwitz-marking"></a>
#### Forgetting the boundary marking

**IG.5/forget-hurwitz-marking** · construction.

Simultaneous G-conjugation on every Hurwitz fiber commutes with braid transport. Forgetting the selected boundary lift is the G-quotient. The stabilizer of a tuple with exact monodromy subgroup H is C_G(H), constant on its component; on the generating locus it is Z(G). Thus the quotient is free when G is centerless and monodromy is full. Keep exact H before the quotient and conjugacy classes of H after it.

Proof route:

1. Check conjugation against each braid formula.
2. Compare marking changes and their induced tuple conjugation.
3. Compute the stabilizer as the intersection of centralizers of the entries.

Prerequisites: [IG.5/topological-hurwitz-covers](#IG-5-topological-hurwitz-covers); [IG.3/hurwitz-braid-action](#IG-3-hurwitz-braid-action).

Uses:

- EVW arithmetic unmarked Hurwitz scheme; marked/unmarked moduli descent: Keeps stabilizers rather than identifying every quotient with a free torsor.

API:

- HurwitzMarking.conjugate (structure): G acts compatibly with the branch projection and braid transport.
- HurwitzMarking.forget (functoriality): The quotient forgets precisely the boundary lift.
- HurwitzMarking.stabilizer (characterisation): The stabilizer is C_G(H) for exact image H.
- HurwitzMarking.centerless (compatibility): On the generating locus for Z(G)=1 the action is free.

Tests:

- HurwitzMarking.central_test (computation): Every central element fixes every tuple.
- HurwitzMarking.s3_test (computation): A generating S₃ tuple has trivial stabilizer.
- HurwitzMarking.subgroup_test (non-example): For the trivial tuple in centerless S₃ the stabilizer is all S₃, so centerlessness alone does not imply freeness.

Acceptance:

- Every central element fixes every tuple.
- A generating S₃ tuple has trivial stabilizer.
- For the trivial tuple in centerless S₃ the stabilizer is all S₃, so centerlessness alone does not imply freeness.

Sources:

- [evw](#source-evw), §§2.2–2.3 and Corollary6.2 proof, published pp.738–740,763–764. Correct stabilizers and the unmarked cover quotient.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Hurwitz geometry signatures.

<a id="IG-5-tame-g-cover"></a>
#### Tame G-covers in families

**IG.5/tame-g-cover** · definition.

For |G| invertible on S, a tame G-cover of P¹_S is a finite morphism from a proper smooth relative curve with a specified G-action, geometrically connected fibers in the full-monodromy variant, a relative reduced finite étale branch divisor, a G-torsor away from it, and cyclic local Kummer models with ramification orders prime to every residue characteristic. The branch divisor is the exact nonétale locus. Marking at unramified infinity is an actual section over infinity; tangential marking is the imported first-order parameter fiber functor and permits ramified infinity. These conventions are distinct.

Proof route:

1. Define the family on the imported relative curve and finite-cover carriers.
2. Check the local Kummer conditions and their base-change stability.
3. Define unramified and tangential marking using their actual fiber functors.

Prerequisites: [IG.0/finite-etale-covers](#IG-0-finite-etale-covers); [IG.1/tame-and-prime-to-p](#IG-1-tame-and-prime-to-p); SchemeAndStackFoundations:SF.3; tauceti:TauCetiRoadmap/BelyiMaps#layer-12-profinite-powers-the-fundamental-group-and-the-branch-cycle-theorem; tauceti:TauCetiRoadmap/BelyiMaps#layer-13-the-pro-ℓ-peripheral-theorem-and-faithfulness.

Uses:

- Arithmetic Hurwitz moduli and specialization; arbitrary-genus admissible covers: Provides the tame cover fiber category and distinguishes the infinity markings.

API:

- TameGCover.pullback (functoriality): Base change preserves the specified cover, G-action and exact branch divisor.
- TameGCover.inertia (data): Geometric branch points have the cyclic prime-to-characteristic Kummer inertia.
- TameGCover.unramifiedMark (constructor): An infinity section defines an actual torsor marking when infinity is unramified.
- TameGCover.tangentialMark (compatibility): The first-order parameter marking agrees with the ordinary fiber on unramified covers.

Tests:

- TameGCover.identity_test (computation): The identity P¹ cover for G=1 has empty exact branch divisor.
- TameGCover.kummer_test (computation): z↦z^m with m invertible is tame, branched at0 and∞.
- TameGCover.artinSchreier_test (non-example): y^p−y=x in characteristic p is étale over A¹ but wild at∞ and fails the tame family condition.

Acceptance:

- The identity P¹ cover for G=1 has empty exact branch divisor.
- z↦z^m with m invertible is tame, branched at0 and∞.
- y^p−y=x in characteristic p is étale over A¹ but wild at∞ and fails the tame family condition.

Sources:

- [evw](#source-evw), §7.1, published p.765. The connected tame cover and exact branch divisor.
- [lwzb](#source-lwzb), §11.1, PDF pp.41–42. Marked and unramified-infinity variants.
- [evw12](#source-evw12), §8.2.2, PDF pp.42–43. Tangential construction only; counting results of this withdrawn paper are not used.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Hurwitz geometry signatures.

<a id="IG-5-arithmetic-hurwitz-moduli"></a>
#### Arithmetic Hurwitz stacks and schemes

**IG.5/arithmetic-hurwitz-moduli** · construction. Planet: Arithmetic Hurwitz moduli.

Construct the stack of tame connected G-covers with n branch points and fixed target P¹, over Z[1/|G|]. It is a separated smooth DM stack with finite étale coarse branch map to Conf_n(P¹); for Z(G)=1 its coarse points over any field classify actual G-covers. Without centerlessness, coarse rational points record invariant isomorphism classes and require descent obstruction checks. The affine-branch variant is the disjoint union of the ramified-infinity and unramified-infinity pullbacks of the projective schemes. Rational class unions give open-and-closed arithmetic loci. The unramified-infinity marked full-monodromy stack is a scheme finite étale over Conf_n(A¹), for arbitrary finite G, because marking kills the vertical automorphisms. The tangential marked scheme used by Wood19 is restricted to centerless involution-generated G, and has its separately fixed infinity type.

Proof route:

1. Apply the center-free descent lemma and tame deformation uniqueness with moving branch points.
2. Algebraize the versal deformation, glue its local models by descent, and prove the branch morphism étale.
3. Use the constant prime-to-characteristic cover count for properness/finiteness; treat stack automorphisms before coarse descent.
4. For ordinary unramified marking calculate the remaining vertical stabilizer as trivial and prove representability.

Prerequisites: [IG.5/tame-g-cover](#IG-5-tame-g-cover); [IG.5/forget-hurwitz-marking](#IG-5-forget-hurwitz-marking); [IG.3/bounded-cover-count](#IG-3-bounded-cover-count); AlgebraicModuliForArithmeticGeometry:R09.4; SchemeAndStackFoundations:SF.4.

Uses:

- Wood extension counts; LWZB versal families; Landesman–Litt §7.3: Constructs one moduli carrier with exact connectedness and automorphism boundaries.

API:

- ArithmeticHurwitz.branch (structure): The branch map is finite étale in the specified prime-to-|G| range.
- ArithmeticHurwitz.classLocus (constructor): Invertible-power-stable class data define open-and-closed arithmetic loci.
- ArithmeticHurwitz.centerlessDescent (characterisation): For centerless G the coarse field points classify actual covers.
- ArithmeticHurwitz.markedRepresentability (compatibility): An ordinary unramified infinity marking yields a scheme for arbitrary finite G.

Tests:

- ArithmeticHurwitz.central_test (non-example): For an unmarked connected C₂-cover, the vertical C₂ automorphism remains; the stack is not automatically a fine scheme.
- ArithmeticHurwitz.marked_test (computation): A G-equivariant automorphism fixing an unramified marked point is identity for a connected cover.
- ArithmeticHurwitz.infinity_test (non-example): A cover ramified at∞ is in the affine-branch variant but not the unramified-infinity marked variant.

Acceptance:

- For an unmarked connected C₂-cover, the vertical C₂ automorphism remains; the stack is not automatically a fine scheme.
- A G-equivariant automorphism fixing an unramified marked point is identity for a connected cover.
- A cover ramified at∞ is in the affine-branch variant but not the unramified-infinity marked variant.

Sources:

- [romagny-wewers](#source-romagny-wewers), Propositions4.4–4.5/4.10, Theorem4.11, Corollary4.12 and Remark4.15(ii), pp.323–331. Descent, deformation, algebraization and gluing.
- [lwzb](#source-lwzb), Theorem11.1, Lemma11.2, Proposition11.4, PDF pp.41–43. Arbitrary-group unramified marking.
- [wood](#source-wood), Theorem4.5(1)–(2), published pp.403–404. Its tangential scheme has a more restricted group and class range.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Original tame/admissible moduli construction proofs; Hurwitz geometry signatures.

<a id="IG-5-arbitrary-monodromy-marked-moduli"></a>
#### Marked moduli with arbitrary monodromy

**IG.5/arbitrary-monodromy-marked-moduli** · construction.

For any finite G and r≥0, define the groupoid of possibly disconnected G-torsor covers of P¹ minus r specified distinct finite punctures, extended by normalization, with an ordinary marked point above unramified infinity. Permit trivial inertia at a listed puncture and preserve the exact monodromy subgroup H≤G. Over a complex configuration the marked fiber is all tuples in G^r with product one; the full-monodromy open-and-closed locus imposes generation. Components are braid orbits on these fibers. Before forgetting the mark, H is an actual subgroup; after it, only its conjugacy class remains. This is the separate supplier for Seguin’s concatenation and bounded cores; the connected exact-branch scheme above cannot replace it.

Proof route:

1. Construct the finite local system of marked monodromy homomorphisms, using general Riemann existence and finite-cover descent.
2. Algebraize and descend the parameterized possibly disconnected cover functor with ordinary infinity marking, using Emsalem’s construction and the Kanev alternative.
3. Identify exact H and inactive puncture loci locally and show they are preserved by transport.

Prerequisites: [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli); [IG.5/topological-hurwitz-covers](#IG-5-topological-hurwitz-covers); [IG.3/branch-cycle-realization](#IG-3-branch-cycle-realization); AlgebraicModuliForArithmeticGeometry:R09.4.

Uses:

- Wood routes345 and315–319; Seguin component product and finite Galois quotient: Avoids applying connected moduli to possibly disconnected bounded cores.

API:

- ArbitraryMarkedHurwitz.monodromy (equivalence): The geometric marked fiber consists of all product-one tuples, including proper H and identity entries.
- ArbitraryMarkedHurwitz.fullLocus (compatibility): The connected locus is precisely H=G.
- ArbitraryMarkedHurwitz.exactImage (data): Exact H is preserved by marked transport and recorded by each component.
- ArbitraryMarkedHurwitz.inactivePuncture (constructor): Insertion of identity adds a specified unramified puncture without changing the cover image.

Tests:

- ArbitraryMarkedHurwitz.empty_test (computation): r=0 gives the trivial torsor with marked fiber and H=1 for every G.
- ArbitraryMarkedHurwitz.identity_test (computation): The tuple(1,…,1) is permitted and has H=1.
- ArbitraryMarkedHurwitz.properImage_test (non-example): For G=S₃ the product-one tuple((12),(12)) has H=C₂ and must survive; CHur deletes it.

Acceptance:

- r=0 gives the trivial torsor with marked fiber and H=1 for every G.
- The tuple(1,…,1) is permitted and has H=1.
- For G=S₃ the product-one tuple((12),(12)) has H=C₂ and must survive; CHur deletes it.

Sources:

- [seguin](#source-seguin), §§2.2.2–2.2.6 and2.3.1–2.3.3, PDF pp.4–9. States the arbitrary-tuple marked component conventions.
- [emsalem](#source-emsalem), Théorème3 and construction, pp.62–64. Original arithmetic moduli construction; connected branches alone need enlargement.
- [kanev](#source-kanev), Theorems4.13 and4.17, PDF pp.20–22. Alternative pointed construction; full proof collation remains required.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Original tame/admissible moduli construction proofs; Hurwitz geometry signatures.

<a id="IG-5-hurwitz-analytic-comparison"></a>
#### Analytic and topological Hurwitz comparison

**IG.5/hurwitz-analytic-comparison** · theorem.

Analytification of the algebraic tame Hurwitz stack agrees with the analytic cover stack, and its ordinary marked unramified-infinity scheme agrees with the topological associated cover of configurations. Its product-one full-monodromy fiber is the specified Nielsen tuple set; components are braid orbits. For the EVW unmarked affine-branch scheme and centerless G the complex space is CHur_{G,n}/G. No Frobenius equivariance is supplied by this complex comparison.

Proof route:

1. Apply general finite-cover Riemann existence on every fixed fiber.
2. Compare local Artinian deformation functors and their algebraizations via relative stack GAGA.
3. The resulting map over configuration space is a fiberwise bijection of covers and therefore an analytic/topological isomorphism.

Prerequisites: [IG.3/general-riemann-existence](#IG-3-general-riemann-existence); [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli); [IG.5/arbitrary-monodromy-marked-moduli](#IG-5-arbitrary-monodromy-marked-moduli); [IG.5/topological-hurwitz-covers](#IG-5-topological-hurwitz-covers); [IG.5/forget-hurwitz-marking](#IG-5-forget-hurwitz-marking); ComplexComparisonPartII:C3; AlgebraicModuliForArithmeticGeometry:R09.4.

Acceptance:

- A marked fiber is a raw tuple, whereas forgetting the mark introduces simultaneous conjugation and central stabilizers.

Sources:

- [evw](#source-evw), Lemma7.4 and proof, published pp.766–767. Unmarked centerless case.
- [lwzb](#source-lwzb), Proposition11.5, Theorem11.7 and §11.3, PDF pp.43–45. Stack and ordinary marked comparison via Hall relative GAGA.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Original tame/admissible moduli construction proofs; Hurwitz geometry signatures.

<a id="IG-5-admissible-g-covers"></a>
#### Admissible G-covers of marked curves

**IG.5/admissible-g-covers** · definition. Planet: Admissible G-covers.

Over Z[1/|G|], an admissible G-cover of a prestable n-pointed genus-g curve D/S is a finite G-equivariant C→D, with C a nodal proper flat curve, a G-torsor over the complement of nodes and markings, cyclic marking model x=ξ^e, and node model xy=a^e, ξη=a, x=ξ^e,y=η^e. The node stabilizer acts by ξ↦ζξ, η↦ζ⁻¹η: the action is balanced. ACV-admissible covers allow disconnected C; the connected-source variant requires C prestable with connected geometric fibers. Morphisms are cartesian diagrams preserving G-action and labels, and can move the target curve. Stability of the target is imposed for the proper stack Adm̄_{g,n}(G), with 2g−2+n>0.

Proof route:

1. Import nodal marked curves, local rings and quotient descent.
2. Define the marking/node charts and balanced cyclic action; prove étale-local invariance and base change.
3. Specify connectedness and stability independently, then construct the fiber category.

Prerequisites: [IG.5/tame-g-cover](#IG-5-tame-g-cover); SchemeAndStackFoundations:SF.3; AlgebraicModuliForArithmeticGeometry:R09.4.

Uses:

- Chen general genus items21/23/33/127; NonabelianLevelStructures imports only(1,1): Owns the general carrier and compactification without duplicating elliptic G-structure theory.

API:

- AdmissibleGCover.baseChange (functoriality): The charts and balanced action persist under arbitrary base change.
- AdmissibleGCover.connectedLocus (characterisation): The connected-source variant is open and closed in the ACV carrier.
- AdmissibleGCover.smoothLocus (compatibility): C is smooth over S iff D is smooth; this locus agrees with tame marked G-covers.
- AdmissibleGCover.nodeCharacters (data): The two faithful branch characters at each node are inverse.

Tests:

- AdmissibleGCover.trivial_test (computation): The identity cover of a stable marked curve is admissible for G=1.
- AdmissibleGCover.node_test (computation): At a node with cyclic order e the inverse-character action preserves ξη=a.
- AdmissibleGCover.unbalanced_test (non-example): Characters ζ,ζ with ζ²≠1 are unbalanced and cannot be used in a generically smooth admissible family.

Acceptance:

- The identity cover of a stable marked curve is admissible for G=1.
- At a node with cyclic order e the inverse-character action preserves ξη=a.
- Characters ζ,ζ with ζ²≠1 are unbalanced and cannot be used in a generically smooth admissible family.

Sources:

- [chen](#source-chen), Definitions2.1.1–2.1.6 and Remark2.1.5, preprint pp.13–15. Gives the general-(g,n) carrier, despite the paper’s subsequent elliptic focus.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Original tame/admissible moduli construction proofs; Hurwitz geometry signatures.

<a id="IG-5-admissible-stacks-and-stable-curves"></a>
#### Admissible stacks and stable marked G-curves

**IG.5/admissible-stacks-and-stable-curves** · theorem.

For 2g−2+n>0 the admissible-cover stack over Z[1/|G|] is proper DM with the stated smooth tame locus. Connected admissible covers are equivalent to stable marked G-curves with marking decomposed R=⊔R_i, G preserving R_i, R_i/G≃S, and quotient genus g: the forward marking uses the reduced ramification divisor at ramified labels and the full étale fiber at unramified labels; the inverse is the quotient C→C/G. Quotients commute with base change and have the required node/marking charts. For a connected smooth cover over a fixed target, the vertical G-equivariant automorphism group is Z(G). General-(g,n) finite étale rigidification and the exceptional(1,1) G-structure compactification remain separate contracts.

Proof route:

1. Use finite tame quotient charts to identify C/G and its base-change behavior.
2. Use Riemann–Hurwitz componentwise to verify stability and construct inverse functors on markings.
3. Apply the ACV twisted-cover construction for proper DM representability; compute vertical smooth automorphisms as the center.

Prerequisites: [IG.5/admissible-g-covers](#IG-5-admissible-g-covers); [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli); SchemeAndStackFoundations:SF.4; AlgebraicModuliForArithmeticGeometry:R09.4.

Acceptance:

- At a node the two inertia characters are inverse; an unbalanced node is excluded.
- Central vertical automorphisms survive unless a marking rigidifies them.

Sources:

- [chen](#source-chen), Propositions2.4.4/2.4.6/2.4.8 and Theorem2.4.9, preprint pp.21–23; §2.5 pp.23–30. Equivalence and smooth central automorphisms; general properness cites ACV.
- [lwzb](#source-lwzb), Theorem11.1 and Remark11.3, PDF pp.42–43. Separates a marked ramified point from the scheme-producing unramified marking.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Original tame/admissible moduli construction proofs; Hurwitz geometry signatures.

<a id="IG-5-ordered-configuration-compactification"></a>
#### A normal-crossings configuration compactification

**IG.5/ordered-configuration-compactification** · construction.

For n≥2, PConf_n(A¹)≃M_{0,n+1}×Aff, by sending a tuple to its pointed P¹ and affine frame(p₂−p₁,p₁). Aff≃Gm×Ga. Hence X_n=M̄_{0,n+1}×P¹×P¹ is proper smooth over Z and contains PConf_n as the complement of a relative normal-crossings divisor. For n=0,1 use the point and P¹ compactifications separately. General stable genus-zero moduli and its boundary are imported from R09.4, not reconstructed here.

Proof route:

1. Normalize the first two labeled points using their unit difference.
2. Use the imported universal stable marked curve and boundary charts.
3. Take the product with the two explicit projective-line compactifications.

Prerequisites: [IG.5/configuration-spaces](#IG-5-configuration-spaces); AlgebraicModuliForArithmeticGeometry:R09.4; SchemeAndStackFoundations:SF.3.

Uses:

- EVW7.7; Wood4.7; LWZB10.3: A normal-crossings compactification enables the fixed-degree nonproper comparison.

API:

- ConfigurationCompactification.frame (equivalence): The affine frame and normalized pointed curve give the stated isomorphism for n≥2.
- ConfigurationCompactification.open (structure): The original ordered configuration is the specified open in X_n.
- ConfigurationCompactification.boundary (data): The reduced boundary is relative normal crossings.
- ConfigurationCompactification.permutation (compatibility): Permutation transport is handled on the open cover and comparison; an extension of every permutation to this product model is not assumed.

Tests:

- ConfigurationCompactification.two_test (computation): For n=2, M̄_{0,3}=Spec Z and X₂=P¹×P¹.
- ConfigurationCompactification.one_test (non-example): The two-point frame formula is undefined for n=1; its separate P¹ compactification is required.
- ConfigurationCompactification.unit_test (non-example): Dividing by p₂−p₁ requires it to be a unit over the base ring, not merely nonzero.

Acceptance:

- For n=2, M̄_{0,3}=Spec Z and X₂=P¹×P¹.
- The two-point frame formula is undefined for n=1; its separate P¹ compactification is required.
- Dividing by p₂−p₁ requires it to be a unit over the base ring, not merely nonzero.

Sources:

- [evw](#source-evw), Lemma7.6 and full proof, published pp.767–768. The ordered compactification used for nonproper cohomology comparison.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Hurwitz geometry signatures.

<a id="IG-5-tame-cohomological-specialization"></a>
#### Tame cohomological specialization with symmetry

**IG.5/tame-cohomological-specialization** · theorem.

Let A be a henselian DVR with characteristic-zero fraction field, X/A proper smooth, D a reduced relative normal-crossings divisor, U=X−D, and U′→U finite étale as in EVW Proposition7.7. For every prime ℓ invertible in A, its geometric special and generic cohomology with Z/ℓ coefficients are isomorphic, equivariantly for a finite group acting compatibly on U′ and U over A. Construct the comparison from compactly supported cohomology of j!π*(Z/ℓ), its vanishing-cycle triangle and duality. For use here require the prime-to-residue-characteristic cover range, which ensures the exact tame boundary/local-acyclicity input rather than claiming it for arbitrary wild boundary degeneration.

Proof route:

1. Check relative boundary tameness of π*(Z/ℓ), and state the exact local-acyclicity hypothesis.
2. Use proper base change and vanishing of the boundary vanishing cycles to obtain a compact-support isomorphism.
3. Use smooth-fiber Poincaré duality; track finite symmetry through the sheaf maps.

Prerequisites: [IG.5/ordered-configuration-compactification](#IG-5-ordered-configuration-compactification); [IG.1/tame-and-prime-to-p](#IG-1-tame-and-prime-to-p); EnhancedDerivedSheaves:E2; SchemeAndStackFoundations:SF.2; [IG.3/finite-coefficient-comparison](#IG-3-finite-coefficient-comparison).

Acceptance:

- The normal-crossings compactification and prime-to-residue tame Galois closure are both retained.
- An arbitrary wild finite cover of the open is not covered.

Sources:

- [evw](#source-evw), Proposition7.7 and full proof, published pp.768–769. The nonproper comparison maps; the underlying vanishing-cycle theorem remains an imported proof input.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Nonproper cohomology kernel and coefficient tower; Hurwitz geometry signatures.

<a id="IG-5-fixed-degree-mod-l-comparison"></a>
#### Fixed-degree Hurwitz mod-ℓ comparison

**IG.5/fixed-degree-mod-l-comparison** · comparison.

For a center-free finite G, a rational generating conjugacy class c, q prime to |G|, fixed n and prime ℓ>max(|G|,q,n), compare H^i(Hur^c_n(C),Z/ℓ) with H^i_ét(Hur^c_{n,F̄_q},Z/ℓ). First pull back to PConf_n, use the equivariant specialization and Artin comparison, then take S_n-invariants. Since ℓ>n, invariants are exact and identify the unordered cohomology. The comparison concerns fixed n and has no Frobenius-equivariance or homological-stability assertion. The same construction in the marked prime-to-|G| range is used by Wood and LWZB.

Proof route:

1. Apply the ordered compactification specialization to the ordered Hurwitz cover.
2. Apply finite-coefficient Artin comparison at the characteristic-zero fiber.
3. Use transfer/descent and ℓ∤n! to take S_n invariants.

Prerequisites: [IG.5/tame-cohomological-specialization](#IG-5-tame-cohomological-specialization); [IG.5/hurwitz-analytic-comparison](#IG-5-hurwitz-analytic-comparison); SchemeAndStackFoundations:SF.2; [IG.3/finite-coefficient-comparison](#IG-3-finite-coefficient-comparison).

Acceptance:

- The comparison is for each fixed n and ℓ∤n!, so invariants under the ordering group are exact.

Sources:

- [evw](#source-evw), Equation7.8.2 and proof, published pp.769–770. The exact fixed-degree comparison, distinct from7.8.3 stability.
- [lwzb](#source-lwzb), Lemma10.3 and proof, PDF pp.39,46. Marked cover application.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Nonproper cohomology kernel and coefficient tower; Hurwitz geometry signatures.

<a id="IG-5-coefficient-tower-comparison"></a>
#### Coefficient towers and rational Betti dimensions

**IG.5/coefficient-tower-comparison** · theorem.

For fixed n the comparison maps extend compatibly to Z/ℓ^a for every a≥1, using the same ordered compactification and ℓ∤n!. Establish finite generation and the inverse-system Mittag–Leffler condition before passing to Z_ℓ and Q_ℓ. Then smooth dimension-n component Y satisfies dim H^i_c,ét(Y_{F̄_q},Q_ℓ)=dim H^{2n−i}(Y_C,Q). For a finite-rank Z_ℓ cohomology module the rational rank is at most the Z/ℓ dimension, using the universal coefficient exact sequence. No arbitrary interchange of inverse limit and cohomology is assumed.

Proof route:

1. Construct the coefficient-compatible specialization/Artin maps and the finite-coefficient exact sequences.
2. Prove the finite-generation/ML passage for this finite-type tame cover and descend S_n invariants.
3. Apply Poincaré duality and the universal-coefficient inequality.

Prerequisites: [IG.5/fixed-degree-mod-l-comparison](#IG-5-fixed-degree-mod-l-comparison); [IG.5/tame-cohomological-specialization](#IG-5-tame-cohomological-specialization); EnhancedDerivedSheaves:E1; EnhancedDerivedSheaves:E2; SchemeAndStackFoundations:SF.2; [IG.3/finite-coefficient-comparison](#IG-3-finite-coefficient-comparison).

Acceptance:

- Transition maps commute with reduction modulo ℓ^a.
- The inverse-limit claim requires finite generation and Mittag–Leffler, not a single mod-ℓ isomorphism.

Sources:

- [wood](#source-wood), Theorem4.7 proof, published pp.405–406. States the tower passage that must be made explicit.
- [evw](#source-evw), End of Proposition7.8 proof, published p.770. Rational-rank versus mod-ℓ bound.
- [lwzb](#source-lwzb), Lemma10.3 proof, PDF p.46. Component compact-support dimensions.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Nonproper cohomology kernel and coefficient tower; Hurwitz geometry signatures.

<a id="IG-5-restricted-hurwitz-trace-kernel"></a>
#### Finite Hurwitz cohomology and trace kernel

**IG.5/restricted-hurwitz-trace-kernel** · theorem.

For the smooth finite-type dimension-n Hurwitz schemes in the tame prime-to-|G| range, finite ℓ-adic cohomology, Poincaré duality and the geometric-Frobenius compact-support trace formula give #Y(F_q)=∑_i(−1)^iTr(Frob_q|H^i_c(Ȳ,Q_ℓ)). Every eigenvalue has complex absolute value at most q^{i/2}; for a Frobenius-fixed geometrically connected component the top compact-support term is Q_ℓ(−n) and contributes q^n. Own only this finite Hurwitz coefficient/weight kernel here: the higher EtaleDuality and DeligneWeights roadmaps import it, rather than becoming upward dependencies.

Proof route:

1. Use the finite-coefficient six-functor and local-acyclicity contracts in the lower-tier foundations.
2. Prove smooth duality, finite-dimensionality and the trace formula for the finite Hurwitz covers.
3. Supply the compact-support weight estimate in this exact finite-type range and identify the top component term.

Prerequisites: [IG.5/coefficient-tower-comparison](#IG-5-coefficient-tower-comparison); EnhancedDerivedSheaves:E2; SchemeAndStackFoundations:SF.2.

Acceptance:

- For affine n-space, compact-support top cohomology contributes q^n using geometric Frobenius.
- Use weights and duality in the smooth nonproper setting; ordinary-cohomology trace alone is wrong.

Sources:

- [wood](#source-wood), Theorem4.7 proof, published pp.405–406. The exact weight and trace input used for the fixed-degree bound.
- [lwzb](#source-lwzb), Lemma10.3 and §12, PDF pp.46–55. Finite Hurwitz cohomology and component-count applications.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Nonproper cohomology kernel and coefficient tower; Hurwitz geometry signatures.

<a id="IG-5-fixed-degree-point-estimate"></a>
#### Fixed-degree uniform Hurwitz point estimate

**IG.5/fixed-degree-point-estimate** · theorem.

For Wood’s finite centerless involution-generated G and class union c, fixed n≥1, there is K_n depending on G,c,n such that for every q prime to |G|, each class multiplicity vector summing to n, each allowed infinity type and each Frobenius-fixed geometric component C, |#C(F_q)−q^n|≤K_n q^{n−1/2}. Bound K_n by the finitely many complex Betti dimensions in fixed degree via the coefficient-tower comparison and weights. This theorem supplies no uniform bound in n and uses no result of the withdrawn EVW12 counting argument.

Proof route:

1. Bound all lower compact-support Betti dimensions using the fixed-degree complex comparison.
2. Apply the geometric-Frobenius trace formula and the q^{i/2} bounds for i≤2n−1.
3. Sum the finitely many dimensions into K_n, independent of q and the chosen component.

Prerequisites: [IG.5/restricted-hurwitz-trace-kernel](#IG-5-restricted-hurwitz-trace-kernel); [IG.5/coefficient-tower-comparison](#IG-5-coefficient-tower-comparison); [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli); [IG.5/finite-degree-component-bound](#IG-5-finite-degree-component-bound).

Acceptance:

- The leading coefficient is the number of Frobenius-fixed geometric components, not all components.
- K_n may depend on n; no uniform growing-branch estimate is asserted.

Sources:

- [wood](#source-wood), Theorem4.7 and full proof, published pp.404–406. Exact fixed-degree asymptotic with a degree-dependent constant.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Nonproper cohomology kernel and coefficient tower; Hurwitz geometry signatures.

<a id="IG-5-hurwitz-points-and-extensions"></a>
#### Hurwitz points and marked extensions

**IG.5/hurwitz-points-and-extensions** · theorem.

For the ordinary marked unramified-infinity scheme over F_q, rational points are triples consisting of a regular geometrically connected G-extension of F_q(t), its specified Galois-group isomorphism, and an infinity embedding with trivial local type. For G=H⋊Γ and c the nonidentity elements whose order equals that of their Γ-image, H admissible, this identifies the point count with the LWZB extension count N(H,Γ,q^n,F_q(t)). For Wood’s separate tangential scheme, use precisely her prescribed tame inertia g∈c∪{1} and Frobenius lift equal to one; the multiplicity degree is the degree of finite branch divisors. Splitting infinity rules out enlarged constants. These two marking conventions are not conflated.

Proof route:

1. Use fine moduli and effective G-equivariant descent, retaining the marking.
2. Translate covers to their function fields and distinguish regularity from mere connectedness.
3. Compute the branch-degree exponent q^n and the infinity type with the chosen local embedding.

Prerequisites: [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli); [IG.4/marked-arithmetic-extensions](#IG-4-marked-arithmetic-extensions); [IG.4/unramified-gamma-groups](#IG-4-unramified-gamma-groups).

Acceptance:

- A rational marked point fixes the infinity Frobenius lift, as well as the tame inertia type.
- A coarse rational point without the mark can have a descent obstruction.

Sources:

- [lwzb](#source-lwzb), Lemma10.2 and proof, PDF pp.39,45–46. Corrects the degree argument q^n and excludes identity from c.
- [wood](#source-wood), Theorem4.5(2), published p.404. The separately specified tangential infinity type.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Hurwitz geometry signatures.

<a id="IG-5-hurwitz-component-invariants"></a>
#### Specialization and component lifting invariants

**IG.5/hurwitz-component-invariants** · theorem. Planet: Hurwitz component invariants.

Over algebraically closed fields of characteristic prime to |G|, the marked Hurwitz points have an inverse-Tate-twisted lift-product invariant in the imported U(G,c) slice with their boundary product and nonnegative class degrees. It is constant on components and compatible with tame specialization after transport of the Tate generator torsor. Geometric Frobenius acts by the inverse-q power SET action. In the generating locus where every class occurs at least M, components are in bijection with the corresponding lift-invariant slice, by stable braid classification and the component comparison. Outside that stable locus no bijection is asserted.

Proof route:

1. Identify complex components with braid orbits and use the marked tuple lift product.
2. Use the common peripheral Tate module to compare specializations, including the boundary marking.
3. Transport the generating stable bijection and verify the geometric-Frobenius convention.

Prerequisites: [IG.3/stable-braid-classification](#IG-3-stable-braid-classification); [IG.3/lifting-invariant](#IG-3-lifting-invariant); [IG.3/arithmetic-lift-comparison](#IG-3-arithmetic-lift-comparison); [IG.5/hurwitz-analytic-comparison](#IG-5-hurwitz-analytic-comparison); [IG.1/tame-and-prime-to-p](#IG-1-tame-and-prime-to-p); [IG.5/coefficient-tower-comparison](#IG-5-coefficient-tower-comparison); InductionRestrictionPartII:RS.3/discrete-action.

Acceptance:

- The component invariant carries inverse Tate twist and exact class degrees.
- Geometric components cannot be identified with rational points without Frobenius fixedness.

Sources:

- [lwzb](#source-lwzb), Theorem12.1, Corollary12.2, Theorem12.4, Corollary12.6, PDF pp.48–50. Components, specialization and Frobenius.
- [wood21](#source-wood21), Theorem5.3 and Remark5.4, PDF pp.10–12. Corrected generating stable classification.
- [evw12](#source-evw12), Proposition8.7.1 proof, PDF pp.52–54. Only the tangential-marking specialization proof is used from this withdrawn source.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Hurwitz geometry signatures.

<a id="IG-5-frobenius-component-count"></a>
#### Frobenius-fixed component formulas

**IG.5/frobenius-component-count** · theorem.

For fixed finite G and rational generating class union c⊂G∖{1}, n≥1 and q prime to |G|, let d(q) be the number of q-power orbits in c/G. The finite lift/degrees formula is b(G,c,q,n)=∑_m nr_{q−1}(W_{q⁻¹}(m)), where m ranges over q-invariant nonnegative multiplicity vectors of total n whose image in G^ab is zero, W is the supplier’s twist correction in the reduced central kernel, and nr counts power roots there. The actual number π of Frobenius-fixed components satisfies π=b+O_G(n^{d(q)−2}), uniformly in q,n; b=0 implies π=0. For each q residue a modulo |G|², a positive-weight lattice count gives the exact nonempty allowed residue set E_a modulo M_a and positive leading coefficient r_{a,b}, with π=0 outside E_a and π=r_{a,b}n^{d(q)−1}+O_G(n^{d(q)−2}) on it. Omit n=0 and require strictly positive lattice weights; zero weights break finiteness.

Proof route:

1. Count fixed points of the imported twisted U-slice and split by the multiplicity vector.
2. Bound the components whose minimum class count is below M using the exact low-class-count orbit estimate.
3. Count the congruence lattice in a strictly positive weighted simplex and retain its periodic residues and positivity criterion.

Prerequisites: [IG.5/hurwitz-component-invariants](#IG-5-hurwitz-component-invariants); [IG.5/general-fixed-fiber-equation](#IG-5-general-fixed-fiber-equation).

Acceptance:

- Degree vectors obey total n and abelianized-degree zero.
- If a fixed-fiber power equation has no root, its contribution is zero.

Sources:

- [lwzb](#source-lwzb), Proposition12.7 and Corollary12.9 with proofs, PDF pp.50–52. Exact fixed-component formula with corrected n≥1 domain and positive weights.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Low-class orbit and lattice proof input; Hurwitz geometry signatures.

<a id="IG-5-semidirect-component-comparison"></a>
#### Semidirect components versus quotient components

**IG.5/semidirect-component-comparison** · theorem.

For finite admissible Γ-group H, G=H⋊Γ and c the nonidentity elements with order equal to their Γ-image, impose gcd(q(q−1),|H|)=1 and n≥1. Then π_{G,c}(q,n)=π_{Γ,Γ∖1}(q,n)+O_G(n^{d_Γ(q)−2}), uniformly in q,n, with common allowed residue classes modulo M_a for q≡a mod |G|², zero outside them and positive lower bound C_G n^{d_Γ(q)−1} inside them for sufficiently large n. The q−1 coprimality is essential: for H=F₃² with inversion by Γ=C₂ and q≡1 mod3, a reduced multiplier of order3 gives three times the stable fixed-component count, rather than equality.

Proof route:

1. Use admissibility to identify G^ab with Γ^ab and the relevant class sets.
2. Apply the reduced-kernel comparison whose extra kernel has order prime to q−1; deduce equality of b formulas.
3. Combine with the low-class-count bounds and the periodic positive-weight lattice estimate.

Prerequisites: [IG.5/frobenius-component-count](#IG-5-frobenius-component-count); [IG.4/unramified-gamma-groups](#IG-4-unramified-gamma-groups); InductionRestrictionPartII:RS.5/admissible-inertia-classes; InductionRestrictionPartII:RS.5/admissible-abelianization; InductionRestrictionPartII:RS.5/reduced-kernel-primary; InductionRestrictionPartII:RS.5/compatible-correction.

Acceptance:

- The coprimality with q(q−1) is checked, not replaced by coprimality with q alone.

Sources:

- [lwzb](#source-lwzb), Theorem10.4 and proof, Lemma12.10, PDF pp.39–40,53–55. Correct coprimality and common residues.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Low-class orbit and lattice proof input; Hurwitz geometry signatures.

<a id="IG-5-product-one-component-monoid"></a>
#### The product-one component monoid

**IG.5/product-one-component-monoid** · construction.

For arbitrary finite G use marked possibly disconnected product-one Hurwitz components in all lengths, permitting identity punctures and recording exact monodromy H. Concatenation gives their graded component monoid, with empty tuple unit. For rational classes c, class multiplicities add, exact image becomes ⟨H₁,H₂⟩ and the invariant Π multiplies. The absolute Galois action respects the product under Seguin’s nested-image condition H₁⊂H₂ or H₂⊂H₁. It is not asserted to respect every product of unrelated-image components.

Proof route:

1. Identify components with product-one braid orbits in the ordinary marked moduli.
2. Use concatenation and block-braid interchanges to define the product and prove its grading/image formulas.
3. Apply Seguin’s branch-cycle arithmetic action and its nested-image proof of Galois compatibility.

Prerequisites: [IG.5/arbitrary-monodromy-marked-moduli](#IG-5-arbitrary-monodromy-marked-moduli); [IG.3/braid-orbit-monoid](#IG-3-braid-orbit-monoid); [IG.3/lifting-invariant](#IG-3-lifting-invariant).

Uses:

- Seguin bounded-core reduction; Wood routes315–319: Provides the arithmetic product used to control components in all lengths.

API:

- ProductOneComponents.concat (constructor): Concatenation defines the graded product.
- ProductOneComponents.image (data): The exact image of a product is the generated join of the two exact subgroups.
- ProductOneComponents.lift (compatibility): Π and class multiplicities multiply/add.
- ProductOneComponents.galoisNested (compatibility): Galois action commutes with products satisfying the nested-image condition.

Tests:

- ProductOneComponents.unit_test (computation): The empty tuple is the unit with H=1.
- ProductOneComponents.identity_test (computation): Adding an identity puncture preserves H and product one while increasing length.
- ProductOneComponents.nonGenerating_test (non-example): The S₃ tuple((12),(12)) is a valid component with H=C₂ and cannot be discarded in a bounded core.

Acceptance:

- The empty tuple is the unit with H=1.
- Adding an identity puncture preserves H and product one while increasing length.
- The S₃ tuple((12),(12)) is a valid component with H=C₂ and cannot be discarded in a bounded core.

Sources:

- [seguin](#source-seguin), §§2.2.3–2.3.3 and Theorem3.3(ii),(iii), PDF pp.5–9,11–13. Product-one arithmetic component monoid and nested-image qualification.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Hurwitz geometry signatures.

<a id="IG-5-bounded-core-galois-reduction"></a>
#### Bounded cores and a finite Galois quotient

**IG.5/bounded-core-galois-reduction** · theorem.

Let G be finite and c a rational conjugacy-invariant set. Every marked product-one c-component can be reduced to a bounded-length core of the same exact image H≤G followed by full order blocks of elements of c∩H, with Seguin’s explicit bound depending only on G,c. The residual factors have nested image in H, so the Galois product law applies. A single finite extension of the base number field that defines every component of every core degree up to that bound controls the Galois action on all such components. The proof must keep product one through each removal; an arbitrary truncated tuple is not a core. For involution-only c the full order blocks have length two, giving the separate bounded-core specialization.

Proof route:

1. Apply the repeated-class extraction and order-block removal argument to a generating core in its exact subgroup H.
2. Bound the residual core uniformly over the finitely many H and use the nested-image Galois product theorem.
3. There are finitely many components in the bounded core degrees; intersect their stabilizers to obtain one finite Galois quotient.

Prerequisites: [IG.5/product-one-component-monoid](#IG-5-product-one-component-monoid); [IG.3/stable-braid-classification](#IG-3-stable-braid-classification).

Acceptance:

- The bounded core retains the exact monodromy subgroup H; extracted blocks have product one.
- No passage from a proper H to the whole G is allowed.

Sources:

- [seguin](#source-seguin), Corollary2.13(iii), Proposition6.1 and its entire preceding proof, PDF pp.8–9,23–25. Precise product-one core reduction and finite quotient.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Hurwitz geometry signatures.

<a id="IG-5-double-cover-trace-zero"></a>
#### Double covers and trace-zero normal forms

**IG.5/double-cover-trace-zero** · theorem.

With2 invertible, a finite flat rank-two cover algebra splits as O⊕L⁻¹ by half its trace; multiplication on L⁻¹ is a section of L². Conversely this data reconstructs the rank-two algebra. In the smooth hyperelliptic case its reduced branch divisor is the zero divisor of that section. Over a labelled genus-zero quotient with a distinguished branch section, étale-local coordinates and line-bundle frames give y²=λ∏(x−a_i), with λ a unit and odd n=2g+1, infinity the remaining branch point. Taking an étale square root of λ makes the equation monic. Do not invoke this form for non-flat covers or residue characteristic2.

Proof route:

1. Use trace/2 to split the unit and trace-zero summands, then Cayley–Hamilton to compute the square.
2. Glue the trace-zero line and multiplication section under change of frame.
3. Apply the imported relative genus-zero/Picard trivialization and identify the branch degree2g+2.

Prerequisites: SchemeAndStackFoundations:SF.3; AlgebraicModuliForArithmeticGeometry:R09.4.

Acceptance:

- The trace splitting uses one half, so characteristic two is excluded.
- The zero branch section gives a non-smooth cover and cannot be called a smooth hyperelliptic fiber.

Sources:

- [evw](#source-evw), §8.8, published pp.778–779. The monic odd-degree polynomial family; the trace-zero adapter is the explicit rank-two algebra derivation routed by its extraction.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Hurwitz geometry signatures.

<a id="IG-5-lifted-affine-coordinate-group"></a>
#### The lifted affine coordinate group

**IG.5/lifted-affine-coordinate-group** · definition.

For odd n define B_n over Z[1/2] by triples(a,b,d) with a,d units, b arbitrary and d²=a^n. Its action on a monic double-cover equation is x′=ax+b,y′=dy. The group law is(a,b,d)(a′,b′,d′)=(aa′,ab′+b,dd′). Since n is odd, set u=d/a^{(n−1)/2}; then a=u² and d=u^n, so B_n≃Gm⋉Ga with action on Ga by u². In particular B_n is smooth and geometrically connected. This is an algebraic group on exact coordinates, not a quotient of points by forgetting the square-root lift.

Proof route:

1. Verify preservation of the monic leading coefficient and multiplication law.
2. Construct the mutually inverse parameterization u and(a,d).
3. Use the explicit Gm×Ga scheme description for smoothness and connectedness.

Prerequisites: [IG.5/double-cover-trace-zero](#IG-5-double-cover-trace-zero); SchemeAndStackFoundations:SF.0.

Uses:

- Labelled hyperelliptic quotient adapter; EVW monodromy image: A connected lifted-coordinate torsor preserves the full π₁ image.

API:

- LiftedAffineGroup.mul (structure): Composition uses the displayed law and preserves d²=a^n.
- LiftedAffineGroup.oddParameter (equivalence): For odd n the u parameter gives a= u²,d=u^n.
- LiftedAffineGroup.action (functoriality): The group acts on the cover with its hyperelliptic involution and distinguished infinity.
- LiftedAffineGroup.connected (characterisation): The explicit geometric scheme is Gm×Ga and is connected.

Tests:

- LiftedAffineGroup.identity_test (computation): (1,0,1) is identity.
- LiftedAffineGroup.involution_test (computation): (1,0,−1) acts by the hyperelliptic involution and is not discarded.
- LiftedAffineGroup.even_test (non-example): For even n, d/a^{n/2}=±1 gives two components; the odd connectedness conclusion fails.

Acceptance:

- (1,0,1) is identity.
- (1,0,−1) acts by the hyperelliptic involution and is not discarded.
- For even n, d/a^{n/2}=±1 gives two components; the odd connectedness conclusion fails.

Sources:

- [evw](#source-evw), §8.8 polynomial family, published pp.778–779. The lifted-coordinate group is the source-consumer adapter supplied by the reviewed extraction, with its proof given here.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration. The point group and odd parameterization are typed; the relative scheme action and connectedness assertion still require the scheme quotient carrier.

<a id="IG-5-labelled-hyperelliptic-family"></a>
#### The labelled hyperelliptic quotient adapter

**IG.5/labelled-hyperelliptic-family** · construction.

For n=2g+1 odd over Z[1/2], the monic polynomial family y²=∏_{i=1}^n(x−a_i) on PConf_n, with all finite branch points labelled and infinity distinguished, presents the labelled smooth hyperelliptic stack as [PConf_n/B_n], where B_n is the lifted affine group above. Isomorphisms preserve the labels, the distinguished ramification point and the hyperelliptic involution. The quotient is established by étale-local double-cover normal forms and their exact Isom sheaves. General quotient stacks are imported; no claim is made that every stable nodal hyperelliptic Jacobian is an abelian scheme.

Proof route:

1. Use the trace-zero theorem for étale-local essential surjectivity.
2. Show every cover isomorphism has the affine/lifted scaling form with d²=a^n.
3. Check the composition law and descend the Isom sheaves to the quotient-stack equivalence.

Prerequisites: [IG.5/double-cover-trace-zero](#IG-5-double-cover-trace-zero); [IG.5/lifted-affine-coordinate-group](#IG-5-lifted-affine-coordinate-group); [IG.5/configuration-spaces](#IG-5-configuration-spaces); AlgebraicModuliForArithmeticGeometry:R09.4.

Uses:

- EVW hyperelliptic monodromy adapter; AP smooth-locus comparison: Connects the explicit polynomial family with the labelled moduli object.

API:

- LabelledHyperellipticFamily.cover (constructor): The monic family has the n finite labels and distinguished infinity.
- LabelledHyperellipticFamily.normalForm (equivalence): Every object is étale-locally in the stated normal form.
- LabelledHyperellipticFamily.isomSheaf (characterisation): Its label/involution-preserving isomorphisms are precisely B_n coordinate changes.
- LabelledHyperellipticFamily.quotient (compatibility): The Isom-sheaf identity gives the imported quotient-stack equivalence.

Tests:

- LabelledHyperellipticFamily.genusOne_test (computation): For n=3 the compactification is genus1 with four labelled branch points.
- LabelledHyperellipticFamily.deck_test (computation): The transformation d=−1 preserves the labels and acts as the hyperelliptic involution.
- LabelledHyperellipticFamily.repeatedRoot_test (non-example): A repeated a_i leaves PConf_n and does not give a smooth family.

Acceptance:

- For n=3 the compactification is genus1 with four labelled branch points.
- The transformation d=−1 preserves the labels and acts as the hyperelliptic involution.
- A repeated a_i leaves PConf_n and does not give a smooth family.

Sources:

- [evw](#source-evw), §8.8, published pp.778–779. The monic family used by the consumer; the quotient equivalence is the explicit routed adapter.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Hurwitz geometry signatures.

<a id="IG-5-finite-cover-image-lemmas"></a>
#### Finite-cover criteria for full monodromy image

**IG.5/finite-cover-image-lemmas** · theorem.

For a map of connected locally noetherian DM stacks f:U→X, its map on étale π₁ is surjective exactly when every connected finite étale cover of X stays connected after pullback. A representable smooth surjection with nonempty geometrically connected fibers satisfies this condition and U is connected. A nonempty dense open in a connected normal locally noetherian DM stack also satisfies it: the pulled-back connected normal cover stays irreducible. Thus the connected B_n-torsor and the restriction from a compact-type hyperelliptic locus to its smooth dense open preserve finite and ℓ-adic monodromy images, whenever the stated abelian scheme exists on the locus.

Proof route:

1. Translate finite covers into finite continuous π₁-sets for the stack carrier.
2. For smooth connected fibers, a clopen partition has disjoint open images, contradicting connectedness of the base cover.
3. For normal dense opens use irreducibility of connected normal covers, checked on an atlas.

Prerequisites: [IG.0/etale-fundamental-group](#IG-0-etale-fundamental-group); [IG.5/lifted-affine-coordinate-group](#IG-5-lifted-affine-coordinate-group); [IG.5/labelled-hyperelliptic-family](#IG-5-labelled-hyperelliptic-family); SchemeAndStackFoundations:SF.4.

Acceptance:

- An open dense inclusion into a normal connected scheme induces surjective étale π₁; a general dominant map requires its finite-cover criterion.

Sources:

- [evw](#source-evw), §8.8, published pp.778–779; explicit finite-cover proof in its routed items132–133. These are the image-preservation adapters, with proofs stated independently of any unqualified nodal Jacobian assertion.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Hurwitz geometry signatures.

<a id="IG-5-formal-curve-patching"></a>
#### Field patching for curves over a complete DVR

**IG.5/formal-curve-patching** · theorem.

Let T be a complete DVR with parameter t, and X̂ a smooth connected projective T-curve with connected closed fiber X and function field F. For U⊂X put R_U={f∈F regular at each point of U}, let R̂_U be its t-adic completion and F_U=Frac(R̂_U) for U≠X; define F_X=F. For U₁,U₂⊂X, inside F_{U₁∩U₂} the intersection F_{U₁}∩F_{U₂} is F_{U₁∪U₂}, and every invertible matrix on the overlap factors into matrices from the two patches. Consequently finite-dimensional vector spaces over F_{U₁∪U₂} are equivalent to pairs over F_{U₁},F_{U₂} with an overlap isomorphism. The tensor equivalence extends to finite separable commutative algebras and finite-group Galois algebras, with effective actions. It is not an equivalence of just field extensions: connectedness/properness must be checked after gluing.

Proof route:

1. Use the precise patch rings and their inclusions; apply the intersection calculation of Theorem4.9.
2. Prove matrix factorization by the complete-DVR iteration and projective-curve approximation of Theorem4.10.
3. Glue vector spaces by the inverse fiber-product construction of Theorem4.11 and transport algebra multiplications and G-actions by the tensor equivalence of Theorem7.1.

Prerequisites: [IG.0/finite-galois-algebras](#IG-0-finite-galois-algebras); SchemeAndStackFoundations:SF.1; SchemeAndStackFoundations:SF.3.

Acceptance:

- Patching split torsor algebras may give a disconnected global algebra.
- The displayed field patch equivalence does not alone provide a formal branched-cover patching theorem.

Sources:

- [hh](#source-hh), Notation4.3 p.9; Theorems4.9–4.11 pp.12–13; Theorem7.1 p.22. Exact patch-field diagram and tensor extension, with the field/algebra distinction.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Wild patching and Abhyankar proof sources; Hurwitz geometry signatures.

<a id="IG-5-abhyankar-affine-curve-realization"></a>
#### Abhyankar affine-curve realization

**IG.5/abhyankar-affine-curve-realization** · theorem.

Let k be algebraically closed of characteristic p>0, C/k smooth connected proper of genus g and D a nonempty set of r geometric points. A finite group G is a quotient of π₁^ét(C−D) exactly when G/p(G) can be generated by at most2g+r−1 elements, where p(G) is the normal subgroup generated by its p-subgroups. For A¹ this says exactly that G is quasi-p. The r>0 and algebraically closed hypotheses are retained. This is a wild affine-curve theorem; it is not a realization theorem over finite fields or number fields.

Proof route:

1. Use the maximal prime-to-p quotient for necessity.
2. For sufficiency apply the exact Raynaud–Harbater wild construction/patching theorem, retaining the local lifting and deformation inputs.
3. Check the special case g=0,r=1 and separate finite-field descent.

Prerequisites: [IG.5/formal-curve-patching](#IG-5-formal-curve-patching); [IG.1/tame-and-prime-to-p](#IG-1-tame-and-prime-to-p); [IG.0/etale-fundamental-group](#IG-0-etale-fundamental-group).

Acceptance:

- For A¹ in characteristic p, the quotient condition is that G be generated by its p-subgroups.
- For a punctured genus-g curve, G/p(G) needs at most 2g+r−1 generators.

Sources:

- [hops](#source-hops), Conjecture3.2 (solved statement), p.8; §3.3, Theorems3.6/3.8/3.11/3.13, pp.10–13. Primary authors give the precise necessity and the Raynaud–Harbater proof route; full original sufficiency proofs remain a gap.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Wild patching and Abhyankar proof sources; Hurwitz geometry signatures.

<a id="IG-5-versal-phi-cover-families"></a>
#### Versal families with specified topological monodromy

**IG.5/versal-phi-cover-families** · construction.

For a finite H, stable (g,n) with 2g−2+n>0 and φ:π₁(Σ_{g,0,n},v₀)↠H, construct over C a scheme M with a dominant étale map to M_{g,n}, an H-Galois finite étale cover of its punctured universal curve, a point m and a fiber identification inducing φ. After a further dominant étale cover obtained from an étale multisection, the punctured family has a section and M→M_{g,n} lifts to M_{g,n+1}. The Hurwitz stack has vertical isotropy Z(H); a scheme étale chart does not assert that the stack is a scheme.

Proof route:

1. Use the exact general-genus Hurwitz stack and choose an étale chart through the specified φ-cover.
2. Use the analytic comparison to identify the selected fiber with φ.
3. Shrink and spread a separable generic multisection of the punctured universal curve, then base change to obtain the section.

Prerequisites: [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli); [IG.5/hurwitz-analytic-comparison](#IG-5-hurwitz-analytic-comparison); [IG.5/admissible-stacks-and-stable-curves](#IG-5-admissible-stacks-and-stable-curves); AlgebraicModuliForArithmeticGeometry:R09.4.

Uses:

- Landesman–Litt §7.3 and §§8–9: Supplies only existence and the monodromy interface; the representation theorems stay with their owner.

API:

- VersalPhiFamily.chart (data): M→M_{g,n} is dominant étale and contains the chosen φ-cover point.
- VersalPhiFamily.cover (data): The punctured universal curve carries the finite étale H-cover.
- VersalPhiFamily.monodromy (compatibility): Its identified selected complex fiber induces φ up to the chosen basepoint transport.
- VersalPhiFamily.withSection (constructor): Further dominant étale base change provides a section and the M_{g,n+1} lift.

Tests:

- VersalPhiFamily.trivial_test (computation): For H=1 the cover is the identity punctured family.
- VersalPhiFamily.elliptic_test (computation): For (g,n)=(1,1), a surjection F₂↠C₂ produces a nontrivial degree-two punctured fiber.
- VersalPhiFamily.central_test (non-example): For H=C₂ the unmarked stack has nontrivial central isotropy; the scheme chart cannot be declared its coarse-space isomorphism.

Acceptance:

- For H=1 the cover is the identity punctured family.
- For (g,n)=(1,1), a surjection F₂↠C₂ produces a nontrivial degree-two punctured fiber.
- For H=C₂ the unmarked stack has nontrivial central isotropy; the scheme chart cannot be declared its coarse-space isomorphism.

Sources:

- [landesman-litt](#source-landesman-litt), Definition7.3.1 and proof of Theorem7.2.1, p.37; citing Wewers1998 Theorem4. The exact versal-family existence input; original Wewers proof remains an obligation.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Hurwitz geometry signatures; Versal-family original construction.

<a id="IG-5-general-fixed-fiber-equation"></a>
#### General rational-class fixed-fiber formula

**IG.5/general-fixed-fiber-equation** · theorem.

For rational c⊂G∖{1}, q prime to |G|, and a q-invariant class multiplicity vector m whose abelianized degree vanishes, use the imported twisted SET action on the finite reduced-central-kernel torsor over m. Its fixed elements form the solutions of h^(q−1)=W_{q⁻¹}(m), after the same root/action normalization as LWZB. Thus their number is nr_{q−1}(W_{q⁻¹}(m)); it is zero unless W lies in the (q−1)-power image, otherwise it is |A[q−1]|. This owns the general class-union equation; RS.4’s square-obstruction formulas apply only to involutions and are not used here as a general supplier.

Proof route:

1. Choose a lift of the degree vector in the finite torsor.
2. Compute its displacement under the imported twisted action and define W in that convention.
3. Translate fixedness to the power equation; translation by A[q−1] identifies every nonempty solution set.

Prerequisites: [IG.3/lifting-invariant](#IG-3-lifting-invariant); InductionRestrictionPartII:RS.3/discrete-action.

Acceptance:

- If W=1 the fixed fiber has |A[q−1]| elements.
- If W is outside the power image its fixed fiber is empty.

Sources:

- [lwzb](#source-lwzb), Proposition12.7, proof and defining b formula, PDF pp.50–52. The general fixed-slice computation with rational classes.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Hurwitz geometry signatures.

<a id="IG-5-finite-degree-component-bound"></a>
#### Component bound from finite étale degree

**IG.5/finite-degree-component-bound** · theorem.

For fixed centerless G and n, let D_n be the constant finite étale rank of the parent marked Hurwitz scheme over the connected configuration scheme Conf_n/Z[1/|G|]. In every allowed geometric fiber the scheme has at most D_n connected components. Any pairwise disjoint open-and-closed pieces with specified inertia multidegrees and infinity type together have at most D_n components. The bound is uniform in the residue characteristic; it does not require an H⁰ comparison.

Proof route:

1. Each allowed geometric configuration space is connected: it is the discriminant-nonzero coefficient open.
2. Every component of a finite étale cover of a connected base surjects onto it and has positive fiber degree.
3. Sum the positive component degrees and use that the specified pieces are disjoint inside the same parent.

Prerequisites: [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli); [IG.5/configuration-spaces](#IG-5-configuration-spaces).

Acceptance:

- For a split cover of rank D, the component count is exactly D.
- A connected double cover has one component and rank two, so the theorem is an upper bound.
- The different infinity-type pieces must be disjoint parts of one parent; summing ranks of unrelated parents would change the constant.

Sources:

- [wood](#source-wood), Theorem4.5(1)–(2), published pp.403–405. Derives a uniform component bound directly from the parent rank.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

### IG.6

Expose finite Galois field and polynomial certificates and transport them through specialization. Give a concrete dihedral-eight model, import existing symmetric-group and dessin results, and keep generic-polynomial universality and the general inverse Galois frontier as precisely quantified problems.

<a id="IG-6-realization-certificates"></a>
#### Field and polynomial realization certificates

**IG.6/realization-certificates** · definition. Planet: Realization certificates.

For fields K,L with a native K-algebra structure and finite G, a field realization certificate consists of finite dimensionality, IsGalois K L and a group isomorphism Gal(L/K)≃G. A polynomial certificate for f∈K[Y] consists of separability and a group isomorphism Gal(f.SplittingField/K)≃G; irreducibility is an additional predicate, not required by the splitting-field notion. An explicit extension includes its generating elements and relations, and an explicit cover includes its finite map and generic-function-field comparison. These refinements retain their actual supplier carriers.

Proof route:

1. Use native Field, Algebra, FiniteDimensional, IsGalois, AlgEquiv and polynomial SplittingField.
2. Obtain finite Galois data for a separable splitting field and preserve it under K-algebra equivalence.
3. Keep a reducible separable polynomial certificate distinct from a primitive irreducible presentation.

Prerequisites: mathlib:IsGalois; mathlib:Polynomial.SplittingField; mathlib:IsGalois.card_aut_eq_finrank; mathlib:IsGalois.of_separable_splitting_field.

Uses:

- IG.6 exports; downstream arithmetic dynamics: Returns actual extensions and isomorphisms with every side condition.

API:

- FieldRealization.groupEquiv (projection): Returns the specified Gal(L/K)≃G.
- FieldRealization.degree (characterisation): [L:K]=|G| follows from the certificate.
- PolynomialRealization.toField (constructor): The separable splitting field yields the native field certificate.
- FieldRealization.transport (functoriality): A K-algebra equivalence transports the certificate and the group isomorphism.

Tests:

- Realization.trivial_test (computation): K/K has the trivial-group certificate.
- Realization.reducible_test (computation): Over Q, (Y²−2)(Y²−3) is separable and realizes C₂×C₂ although it is reducible.
- Realization.degree_test (non-example): Q(∛2)/Q has degree3 but is not Galois and cannot certify C₃.

Acceptance:

- K/K has the trivial-group certificate.
- Over Q, (Y²−2)(Y²−3) is separable and realizes C₂×C₂ although it is reducible.
- Q(∛2)/Q has degree3 but is not Galois and cannot certify C₃.

Sources:

- [serre](#source-serre), §1.1 pp.1–2; §3.3 pp.23–25. Realization is a Galois extension with its exact group, not merely a polynomial degree.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.

<a id="IG-6-specialization-export"></a>
#### Specialization with its realization data

**IG.6/specialization-export** · construction.

For the regular finite G-cover and guarded integral model of IG.2/regular-full-group, export at a rational Hilbert point t the connected finite étale fiber, its G-action, its field L_t and Gal(L_t/K)≃G. For a polynomial model return its coefficientwise specialization, nonzero denominator/discriminant guard, degree and separability certificates, and splitting-field comparison. Full-group preservation must use the Hilbert/full-monodromy theorem, not the coefficient guard alone. Finite-place and disjointness data are exported only when their corresponding IG.2 hypotheses were chosen.

Proof route:

1. Apply the native coefficient specialization component and its guard.
2. Use connected Hilbert fibers and the G-torsor criterion for the group isomorphism.
3. Transport through the generic-root integral model; preserve the specified local and linear-disjointness witnesses.

Prerequisites: [IG.6/realization-certificates](#IG-6-realization-certificates); [IG.2/regular-full-group](#IG-2-regular-full-group); [IG.2/hilbert-subsets](#IG-2-hilbert-subsets); [IG.2/specialization-guard](#IG-2-specialization-guard); [IG.2/disjoint-specializations](#IG-2-disjoint-specializations); [IG.2/hilbert-local-conditions](#IG-2-hilbert-local-conditions).

Uses:

- Explicit realizations and consumer exports: Makes every specialization side condition part of the output.

API:

- SpecializationExport.field (data): Returns L_t/K, its finite Galois structure and group equivalence.
- SpecializationExport.polynomial (data): Returns the specialized polynomial and its guarded degree/separability witnesses.
- SpecializationExport.roots (compatibility): The integral-model root map identifies the specialized splitting field.
- SpecializationExport.disjoint (projection): Returns L_t∩M=K only with the chosen disjointness hypothesis.

Tests:

- SpecializationExport.quadratic_test (computation): Y²−T at a prime p yields Q(√p) and the C₂ group certificate.
- SpecializationExport.badHilbert_test (non-example): At t=4 its denominator and discriminant guards hold, but the fiber splits; a Hilbert hypothesis is essential.
- SpecializationExport.pole_test (non-example): A coefficient1/(T−1) cannot be specialized at1 via the regular coefficient map.

Acceptance:

- Y²−T at a prime p yields Q(√p) and the C₂ group certificate.
- At t=4 its denominator and discriminant guards hold, but the fiber splits; a Hilbert hypothesis is essential.
- A coefficient1/(T−1) cannot be specialized at1 via the regular coefficient map.

Sources:

- [debes](#source-debes), Proposition5.2.5, printed pp.137–139; §5.3 pp.150–153. Full group uses the resolvent/integral-model proof.
- [serre](#source-serre), Propositions3.3.1/3.3.3 and Corollary3.3.4, pp.23–24. Connected regular specializations and disjointness.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Realization and generic-polynomial signatures.

<a id="IG-6-cyclic-worked-realizations"></a>
#### Cyclic realization examples

**IG.6/cyclic-worked-realizations** · application.

Certify Q(√p)/Q for a positive prime p with polynomial Y²−p and C₂; certify the irreducible polynomial Y³−3Y+1, discriminant81, with C₃; certify Φ₅(Y)=Y⁴+Y³+Y²+Y+1 with C₄ via ζ₅↦ζ₅². For arbitrary finite cyclic groups import the abelian class-field/solvable realization theorem rather than infer them from one cyclic polynomial. The three examples include exact degree, separability, normality and group isomorphisms.

Proof route:

1. For the quadratic use Eisenstein and both roots in Q(√p).
2. For the cubic use the rational-root test, square nonzero discriminant and the degree-three transitive-group criterion from PolynomialGaloisGroups.
3. For Φ₅ use cyclotomic irreducibility, the primitive fifth-root basis and Gal≃(Z/5Z)× with generator2.

Prerequisites: [IG.6/realization-certificates](#IG-6-realization-certificates); [IG.4/shafarevich-solvable-realization](#IG-4-shafarevich-solvable-realization); tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-2-the-dictionary-between-galois-theory-and-permutations; tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-3-the-discriminant-and-the-alternating-group; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

Acceptance:

- Check Y³−3Y+1 irreducibility and discriminant81, and check Φ₅ has degree4 and cyclic Galois group.

Sources:

- [serre](#source-serre), §§1.1–1.2, printed pp.1–4. Elementary cyclic examples; the explicit specialization at T=0 is verified separately.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

<a id="IG-6-dihedral-eight-realization"></a>
#### A degree-eight dihedral realization

**IG.6/dihedral-eight-realization** · construction.

Let α=2^(1/4) in R and L=Q(α,i) inside C. Y⁴−2 is Eisenstein, Q(α) is real and does not contain i, so [L:Q]=8. Its four roots α,iα,−α,−iα lie in L and are distinct, making L its Galois splitting field. Define r(α)=iα,r(i)=i and s(α)=α,s(i)=−i. Then r⁴=s²=1, srs=r⁻¹ and these generate all eight automorphisms, yielding Gal(L/Q)≃D₈ (the group of order8). This convention is explicit: some sources call this D₄.

Proof route:

1. Construct the native intermediate field adjoin{α,i} and its real/complex tower.
2. Extend the root assignments to algebra automorphisms using the degree-eight basis.
3. Verify the dihedral relations on α,i and prove exactly eight normal forms r^j s^e.

Prerequisites: [IG.6/realization-certificates](#IG-6-realization-certificates); mathlib:IntermediateField; tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-2-the-dictionary-between-galois-theory-and-permutations; tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-3-the-discriminant-and-the-alternating-group.

Uses:

- IG.4 cyclic/dihedral acceptance; realization exports: Checks properness by the actual automorphism group.

API:

- DihedralEight.alpha (data): α satisfies α⁴=2 and lies in the real subfield.
- DihedralEight.rotation (constructor): The specified assignment defines the order-four automorphism r.
- DihedralEight.reflection (constructor): Complex conjugation is s and satisfies srs=r⁻¹.
- DihedralEight.realization (equivalence): Normal forms yield the group isomorphism and polynomial certificate.

Tests:

- DihedralEight.degree_test (computation): The splitting field has degree8, not4.
- DihedralEight.rotation_test (computation): r² sends α to−α and fixes i, so r has order4.
- DihedralEight.nonabelian_test (non-example): sr(α)=−iα while rs(α)=iα; replacing D₈ by C₄×C₂ fails.

Acceptance:

- The splitting field has degree8, not4.
- r² sends α to−α and fixes i, so r has order4.
- sr(α)=−iα while rs(α)=iα; replacing D₈ by C₄×C₂ fails.

Sources:

- [serre](#source-serre), §1.2 p.2, dihedral embedding example. Motivates the degree-eight convention; the x⁴−2 splitting-field computation is the explicit derivation here.

Signature boundary: Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Recorded gaps: Realization and generic-polynomial signatures.

<a id="IG-6-symmetric-family-import"></a>
#### The existing symmetric-group family

**IG.6/symmetric-family-import** · comparison.

For every n≥1 import PolynomialGaloisGroups Layer9’s explicit integral degree-n irreducible polynomial with full symmetric Galois group. Its native supplier predicate includes separability and surjectivity of the action on the splitting-field root set. Convert the action isomorphism and a root enumeration into a Gal≃S_n realization certificate. Retain the supplier’s separate small-degree branches and modular factorization witnesses. Do not replan the CRT family or claim its Layer10 alternating examples give every alternating group.

Proof route:

1. Use the current full-symmetric predicate and its injective native Galois action.
2. Identify the root set with Fin n using separability and splitting.
3. Transport the group isomorphism into the field certificate.

Prerequisites: [IG.6/realization-certificates](#IG-6-realization-certificates); tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-9-sₙ-as-a-galois-group-over-ℚ.

Acceptance:

- For n=1 the group is trivial; for n=2 it is C₂.
- The imported predicate includes separability and surjectivity of the permutation action.

Sources:

- [serre](#source-serre), §4.4, printed pp.40–42. The general symmetric family is already assigned to the current upstream supplier.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

<a id="IG-6-belyi-arithmetic-interface"></a>
#### Dessins, inertia and arithmetic conventions

**IG.6/belyi-arithmetic-interface** · comparison.

Import BelyiMaps12.4–12.12 for the arithmetic outer action on the three-punctured line, inertia classes and the degree-d permutation-triple/dessin correspondence. Positive local inertia and arithmetic conjugation σ̃γσ̃⁻¹ use χ(σ) defined by σ(ζ)=ζ^χ(σ); a right cover-pullback convention uses the inverse. Record the reversal/reindexing adapter from the supplier’s τ∞τ₁τ₀=1 to this roadmap’s g₁g₂g₃=1. Degrees d and group exponents e remain distinct. The branch-cycle classes alone are a passport and do not determine a dessin. Preserve G-cover versus ordinary-cover equivalence and field of moduli versus field of definition.

Proof route:

1. Read the current supplier’s maps and transport the fiber and loop conventions.
2. Compute the cyclotomic exponent on the Kummer tower and verify it in each chosen action convention.
3. Reuse the existing permutation-triple correspondence with explicit order and conjugacy adapters.

Prerequisites: [IG.0/basepoint-and-components](#IG-0-basepoint-and-components); [IG.1/tame-tangential-fiber](#IG-1-tame-tangential-fiber); [IG.3/arithmetic-lift-comparison](#IG-3-arithmetic-lift-comparison); tauceti:TauCetiRoadmap/BelyiMaps#layer-12-profinite-powers-the-fundamental-group-and-the-branch-cycle-theorem; tauceti:TauCetiRoadmap/BelyiMaps#layer-13-the-pro-ℓ-peripheral-theorem-and-faithfulness.

Acceptance:

- Distinguish positive-inertia exponent χ from the right cover-action exponent χ inverse.
- Complex conjugation has exponent −1, so alone cannot distinguish the two conventions.

Sources:

- [sga1](#source-sga1), Exposé XIII Corollary2.12, p.290. Tame inertia and the relation, with its prime-to-p restriction.
- [serre](#source-serre), §7.3, pp.69–71. Rational conjugacy and branch-cycle arithmetic.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

<a id="IG-6-faithful-dessin-action-import"></a>
#### The imported faithful action on dessins

**IG.6/faithful-dessin-action-import** · comparison.

Import current BelyiMaps13.5’s faithful Gal(Q̄/Q) action on genus-zero dessins, with its stated plane-tree refinement. Its proof encodes a moved algebraic number in a polynomial Belyi map and preserves it through the normalized composition argument. Consequently the action on all dessins is faithful. This is a specific theorem of the supplier; do not replace it with an unproved anabelian reconstruction statement or claim that any fixed finite passport detects every Galois element.

Proof route:

1. Reuse the exact polynomial Belyification and normalized rigidity lemmas already in BelyiMaps13.
2. Compose the faithful subtype action with its inclusion into all dessin classes.

Prerequisites: [IG.6/belyi-arithmetic-interface](#IG-6-belyi-arithmetic-interface); tauceti:TauCetiRoadmap/BelyiMaps#layer-13-the-pro-ℓ-peripheral-theorem-and-faithfulness.

Acceptance:

- A nonidentity automorphism moves an algebraic number and the imported encoding gives a moved dessin; do not re-prove the encoding here.

Sources:

- [serre](#source-serre), §8.3, printed pp.86–87, Belyi discussion. Motivation only; the complete current BelyiMaps13.5 proof supplies the stronger precise faithfulness scope.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

<a id="IG-6-inverse-galois-frontier"></a>
#### The inverse Galois frontier

**IG.6/inverse-galois-frontier** · application.

Expose the general inverse Galois problem over Q as the named proposition: every finite group G admits a finite Galois extension L/Q with Gal(L/Q)≃G. Expose the regular problem over Q(T) separately, requiring Q algebraically closed in L; regular realization plus Hilbert irreducibility implies realization over Q. These are open general problems, not theorems or assumptions in this roadmap. The solved-family index comprises finite solvable groups over number fields (IG.4), all S_n (imported), centerless rational-rigid tuples with their hypotheses (IG.3), and quasi-p groups over A¹ of algebraically closed characteristic-p fields (IG.5); the last has a different base field.

Proof route:

1. Define the propositions by the realization certificate, adding regularity in the rational-function version.
2. Prove only the implication from a particular regular certificate by guarded Hilbert specialization.
3. Attach the exact theorem and field flags to each solved entry; do not promote the index to a universal theorem.

Prerequisites: [IG.6/realization-certificates](#IG-6-realization-certificates); [IG.6/specialization-export](#IG-6-specialization-export); [IG.4/shafarevich-solvable-realization](#IG-4-shafarevich-solvable-realization); [IG.6/symmetric-family-import](#IG-6-symmetric-family-import); [IG.3/rational-rigidity](#IG-3-rational-rigidity); [IG.5/abhyankar-affine-curve-realization](#IG-5-abhyankar-affine-curve-realization).

Acceptance:

- The general and regular propositions are displayed as open, with no uses as hypotheses.
- Shafarevich covers solvable groups; symmetric groups use the existing polynomial roadmap.

Sources:

- [serre](#source-serre), Introduction and §§3.3/8.1, pp.1,23–25,81–83. Separates the general question from proved conditional constructions.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

<a id="IG-6-generic-polynomial-universality"></a>
#### Generic-polynomial universality

**IG.6/generic-polynomial-universality** · definition.

For a fixed finite G and base field K, a G-generic polynomial is a separable polynomial f over K(T₁,…,T_r) whose regular splitting field has group G, together with universality: over each infinite overfield L/K, every G-Galois extension of L is isomorphic to the splitting field of a specialization outside the specified coefficient/discriminant guard. Universality is stronger than regularity or full-group preservation at Hilbert points. The existence problem is named for each (K,G); no universal positive assertion for all finite groups is made, because generic-polynomial existence has obstructions. For char(K)≠2, Y²−T gives the worked C₂ example, since every quadratic field is L(√a) for a nonsquare a.

Proof route:

1. Use native rational-function coefficient fields and the guarded specialization map.
2. Quantify over actual overfields and actual finite Galois extensions, including their algebra equivalence.
3. For C₂ use the quadratic-generator normal form; prove the guard T≠0 and the splitting-field equivalence.

Prerequisites: [IG.6/realization-certificates](#IG-6-realization-certificates); [IG.6/specialization-export](#IG-6-specialization-export); tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-2-the-dictionary-between-galois-theory-and-permutations; tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-3-the-discriminant-and-the-alternating-group.

Uses:

- IG.6 universality frontier: Keeps the stronger quantified output separate from the Hilbert theorem.

API:

- GenericPolynomial.genericGroup (projection): The generic splitting field has the prescribed group and regular constants.
- GenericPolynomial.guard (data): The coefficient and discriminant domain is specified.
- GenericPolynomial.realize (universal-property): Every G-extension over an infinite overfield is the splitting field of an allowed specialization.
- GenericPolynomial.transport (functoriality): Base extension restricts the universal quantifier and transports the polynomial certificate.

Tests:

- GenericPolynomial.quadratic_test (computation): Y²−T over a characteristic≠2 field realizes every quadratic extension of an infinite overfield.
- GenericPolynomial.square_test (non-example): Specializing the quadratic at a square gives a split algebra; universality does not mean every allowed parameter has group C₂.
- GenericPolynomial.constant_test (non-example): The constant family Y²−2 over Q has group C₂ but cannot realize Q(√3); a generic group alone does not imply universality.

Acceptance:

- Y²−T over a characteristic≠2 field realizes every quadratic extension of an infinite overfield.
- Specializing the quadratic at a square gives a split algebra; universality does not mean every allowed parameter has group C₂.
- The constant family Y²−2 over Q has group C₂ but cannot realize Q(√3); a generic group alone does not imply universality.

Sources:

- [serre](#source-serre), §§1.1/3.3, pp.1–2,23–25. Provides the quadratic construction and distinction from ordinary specialization; the general universality predicate is specified here.

Signature boundary: Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Recorded gaps: Realization and generic-polynomial signatures.

## Supplier contracts

A request imports mathematics from its existing owner. It does not create a second implementation here. A stage-level request remains open until an exact supplier node or declaration is available.

- **SchemeAndStackFoundations:SF.0**: Finite morphisms and finite étale scheme pullbacks; relative Spec and finite-algebra anti-equivalence on affines. Consumers: [IG.0/finite-etale-covers](#IG-0-finite-etale-covers), [IG.1/decomposition-inertia](#IG-1-decomposition-inertia), [IG.2/hilbert-subsets](#IG-2-hilbert-subsets), [IG.2/thin-sets](#IG-2-thin-sets), [IG.2/regular-full-group](#IG-2-regular-full-group), [IG.2/norm-pullback-hilbert](#IG-2-norm-pullback-hilbert), [IG.5/configuration-spaces](#IG-5-configuration-spaces), [IG.5/lifted-affine-coordinate-group](#IG-5-lifted-affine-coordinate-group).
- **SchemeAndStackFoundations:SF.1**: Effective fpqc descent for finite étale algebras/schemes, finite group quotients and torsors; stackification of the isogeny prestack. Consumers: [IG.0/finite-etale-covers](#IG-0-finite-etale-covers), [IG.0/geometric-fiber](#IG-0-geometric-fiber), [IG.0/finite-galois-algebras](#IG-0-finite-galois-algebras), [IG.0/finite-etale-idempotents](#IG-0-finite-etale-idempotents), [IG.0/adic-local-systems](#IG-0-adic-local-systems), [IG.1/arithmetic-exact-sequence](#IG-1-arithmetic-exact-sequence), [IG.1/charzero-base-extension](#IG-1-charzero-base-extension), [IG.3/rational-rigidity](#IG-3-rational-rigidity), [IG.3/general-cover-moduli-descent](#IG-3-general-cover-moduli-descent), [IG.5/configuration-spaces](#IG-5-configuration-spaces), [IG.5/formal-curve-patching](#IG-5-formal-curve-patching), [IG.4/finite-quotient-approximation](#IG-4-finite-quotient-approximation).
- **SchemeAndStackFoundations:SF.2**: Small étale and pro-étale sites, geometric stalks, locally constant sheaves, weakly étale covers and w-contractible stalk models in the locally topologically noetherian range. Consumers: [IG.0/integral-monodromy](#IG-0-integral-monodromy), [IG.0/adic-local-systems](#IG-0-adic-local-systems), [IG.0/noohi-groups](#IG-0-noohi-groups), [IG.0/proetale-fundamental-group](#IG-0-proetale-fundamental-group), [IG.3/general-cover-moduli-descent](#IG-3-general-cover-moduli-descent), [IG.5/tame-cohomological-specialization](#IG-5-tame-cohomological-specialization), [IG.5/fixed-degree-mod-l-comparison](#IG-5-fixed-degree-mod-l-comparison), [IG.5/coefficient-tower-comparison](#IG-5-coefficient-tower-comparison), [IG.5/restricted-hurwitz-trace-kernel](#IG-5-restricted-hurwitz-trace-kernel), [IG.3/finite-coefficient-comparison](#IG-3-finite-coefficient-comparison).
- **EnhancedDerivedSheaves:E2**: The replete pro-étale topos and its inverse-limit/descent input used for local systems; no second repleteness construction. Consumers: [IG.0/proetale-fundamental-group](#IG-0-proetale-fundamental-group), [IG.5/tame-cohomological-specialization](#IG-5-tame-cohomological-specialization), [IG.5/coefficient-tower-comparison](#IG-5-coefficient-tower-comparison), [IG.5/restricted-hurwitz-trace-kernel](#IG-5-restricted-hurwitz-trace-kernel).
- **SchemeAndStackFoundations:SF.4**: Proper finite-cover lifting over henselian DVRs and deformation of smooth proper schemes, with fiber identification. Consumers: [IG.1/proper-specialization](#IG-1-proper-specialization), [IG.4/supersolvable-grunwald](#IG-4-supersolvable-grunwald), [IG.4/collective-degree-realization](#IG-4-collective-degree-realization), [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli), [IG.5/admissible-stacks-and-stable-curves](#IG-5-admissible-stacks-and-stable-curves), [IG.5/finite-cover-image-lemmas](#IG-5-finite-cover-image-lemmas).
- **SchemeAndStackFoundations:SF.3**: Smooth proper curve compactifications with relative disjoint sections, the universal stable pointed curve and its punctured family. Consumers: [IG.1/punctured-specialization](#IG-1-punctured-specialization), [IG.1/stack-and-family-exactness](#IG-1-stack-and-family-exactness), [IG.3/branch-cycle-realization](#IG-3-branch-cycle-realization), [IG.5/tame-g-cover](#IG-5-tame-g-cover), [IG.5/admissible-g-covers](#IG-5-admissible-g-covers), [IG.5/ordered-configuration-compactification](#IG-5-ordered-configuration-compactification), [IG.5/double-cover-trace-zero](#IG-5-double-cover-trace-zero), [IG.5/formal-curve-patching](#IG-5-formal-curve-patching), [IG.3/artin-good-neighborhoods](#IG-3-artin-good-neighborhoods), [IG.2/general-hilbert-local-approximation](#IG-2-general-hilbert-local-approximation).
- **AlgebraicModuliForArithmeticGeometry:R09.4**: Representable finite étale covers of Deligne–Mumford stacks, geometric points and effective descent; stable curve moduli and universal-family charts. Consumers: [IG.1/stack-and-family-exactness](#IG-1-stack-and-family-exactness), [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli), [IG.5/arbitrary-monodromy-marked-moduli](#IG-5-arbitrary-monodromy-marked-moduli), [IG.5/hurwitz-analytic-comparison](#IG-5-hurwitz-analytic-comparison), [IG.5/admissible-g-covers](#IG-5-admissible-g-covers), [IG.5/admissible-stacks-and-stable-curves](#IG-5-admissible-stacks-and-stable-curves), [IG.5/ordered-configuration-compactification](#IG-5-ordered-configuration-compactification), [IG.5/double-cover-trace-zero](#IG-5-double-cover-trace-zero), [IG.5/labelled-hyperelliptic-family](#IG-5-labelled-hyperelliptic-family), [IG.5/versal-phi-cover-families](#IG-5-versal-phi-cover-families).
- **SchemeAndStackFoundations:SF.0**: Integral finite-type scheme points, residue fields, fiber products and connected finite étale fibers for Hilbert subsets. Consumers: [IG.2/hilbert-subsets](#IG-2-hilbert-subsets), [IG.2/thin-sets](#IG-2-thin-sets), [IG.2/regular-full-group](#IG-2-regular-full-group), [IG.2/norm-pullback-hilbert](#IG-2-norm-pullback-hilbert).
- **ReductiveGroupsPartII:RG2.0a**: Weil restriction of quasi-trivial tori and the specified norm map with geometrically integral generic fiber. Consumers: [IG.2/norm-pullback-hilbert](#IG-2-norm-pullback-hilbert), [IG.4/supersolvable-grunwald](#IG-4-supersolvable-grunwald).
- **ComplexComparisonPartII:C0**: Analytification of finite-type complex schemes and coherent modules, and pullback of finite algebra sheaves. Consumers: [IG.3/general-riemann-existence](#IG-3-general-riemann-existence), [IG.3/artin-good-neighborhoods](#IG-3-artin-good-neighborhoods), [IG.3/curve-topological-density](#IG-3-curve-topological-density).
- **ComplexComparisonPartII:C3**: Proper coherent GAGA needed for finite cover algebraization after compactification, including algebraic spaces. Consumers: [IG.3/general-riemann-existence](#IG-3-general-riemann-existence), [IG.5/hurwitz-analytic-comparison](#IG-5-hurwitz-analytic-comparison).
- **ComplexComparisonPartII:C4**: Analytic/algebraic morphism comparison and finite topological models in the smooth quasi-projective complex range; no curve-only contract is silently widened. Consumers: [IG.3/general-riemann-existence](#IG-3-general-riemann-existence), [IG.3/bounded-cover-count](#IG-3-bounded-cover-count).
- **SchemeAndStackFoundations:SF.3**: Normalization and Riemann–Hurwitz for finite maps of smooth proper curves, with local ramification indices. Consumers: [IG.3/branch-cycle-realization](#IG-3-branch-cycle-realization).
- **SchemeAndStackFoundations:SF.4**: Effective torsor and quotient descent for finite constant stabilizers; only the homogeneous-space adapter, not a general new moduli stack. Consumers: [IG.4/supersolvable-grunwald](#IG-4-supersolvable-grunwald), [IG.4/collective-degree-realization](#IG-4-collective-degree-realization).
- **ReductiveGroupsPartII:RG2.0a**: Weil restriction of finite étale algebras and quasi-trivial tori used in the restricted homogeneous-space argument. Consumers: [IG.4/supersolvable-grunwald](#IG-4-supersolvable-grunwald).
- **AlgebraicModuliForArithmeticGeometry:R09.4**: Stable marked curves, finite quotient/torsor stacks, effective finite-cover moduli and rigidification. The general Hurwitz carrier and its marking adapters stay in IG.5. Consumers: [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli), [IG.5/arbitrary-monodromy-marked-moduli](#IG-5-arbitrary-monodromy-marked-moduli), [IG.5/admissible-g-covers](#IG-5-admissible-g-covers), [IG.5/admissible-stacks-and-stable-curves](#IG-5-admissible-stacks-and-stable-curves), [IG.5/ordered-configuration-compactification](#IG-5-ordered-configuration-compactification), [IG.5/labelled-hyperelliptic-family](#IG-5-labelled-hyperelliptic-family).
- **EnhancedDerivedSheaves:E1**: Derived inverse limits and the exact finite-module Mittag–Leffler criterion for the specified coefficient tower. Consumers: [IG.5/coefficient-tower-comparison](#IG-5-coefficient-tower-comparison).
- **EnhancedDerivedSheaves:E2**: Finite-coefficient constructible sheaves, compact support, proper base change and the relative normal-crossings local-acyclicity maps in the finite Hurwitz range. Consumers: [IG.5/tame-cohomological-specialization](#IG-5-tame-cohomological-specialization), [IG.5/coefficient-tower-comparison](#IG-5-coefficient-tower-comparison), [IG.5/restricted-hurwitz-trace-kernel](#IG-5-restricted-hurwitz-trace-kernel).
- **SchemeAndStackFoundations:SF.2**: Finite-coefficient étale cohomology and the finite-cover/tame nearby-cycle foundations; broadened duality and weights remain restricted targets here. Consumers: [IG.5/tame-cohomological-specialization](#IG-5-tame-cohomological-specialization), [IG.5/fixed-degree-mod-l-comparison](#IG-5-fixed-degree-mod-l-comparison), [IG.5/coefficient-tower-comparison](#IG-5-coefficient-tower-comparison), [IG.5/restricted-hurwitz-trace-kernel](#IG-5-restricted-hurwitz-trace-kernel).
- **ComplexComparisonPartII:C0**: CW/topological curve and fibration carriers, the sphere/free/surface presentations and the homotopy sequence with chosen basepoints. Consumers: [IG.3/artin-good-neighborhoods](#IG-3-artin-good-neighborhoods), [IG.3/curve-topological-density](#IG-3-curve-topological-density).
- **AlgebraicModuliForArithmeticGeometry:R09.7**: Resolution and normal-crossings compactification of smooth complex finite-type schemes needed in SGA1 XII5.1; import the lower-tier resolution construction rather than replan it. Consumers: [IG.3/general-riemann-existence](#IG-3-general-riemann-existence).
- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula**: Use the existing layer contract for No unramified split-infinity extension of the base. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.4/base-no-unramified-extension](#IG-4-base-no-unramified-extension).
- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-**: Use the existing layer contract for Scheme decomposition and inertia groups, No unramified split-infinity extension of the base. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.1/decomposition-inertia](#IG-1-decomposition-inertia), [IG.4/base-no-unramified-extension](#IG-4-base-no-unramified-extension).
- **tauceti:TauCetiRoadmap/BelyiMaps#layer-0-permutation-triples**: Use the existing layer contract for Riemann existence for finite covers. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.3/general-riemann-existence](#IG-3-general-riemann-existence).
- **tauceti:TauCetiRoadmap/BelyiMaps#layer-11-fields-of-moduli-fields-of-definition-and-galois-orbits**: Use the existing layer contract for Rational rigidity with its descent hypotheses, Field of moduli and the central descent obstruction, A rigid S₃ cover and its dessin. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.3/rational-rigidity](#IG-3-rational-rigidity), [IG.3/general-cover-moduli-descent](#IG-3-general-cover-moduli-descent), [IG.3/rigid-s3-comparison](#IG-3-rigid-s3-comparison).
- **tauceti:TauCetiRoadmap/BelyiMaps#layer-12-profinite-powers-the-fundamental-group-and-the-branch-cycle-theorem**: Use the existing layer contract for Field and multiplicative-group acceptance comparisons, Tame and prime-to-p fundamental quotients, Frobenius and cyclotomic normalization, Unramified admissible Γ-groups, Tame G-covers in families, Tame tangential fibers at a smooth curve boundary, Dessins, inertia and arithmetic conventions. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.0/field-and-torus-comparisons](#IG-0-field-and-torus-comparisons), [IG.1/tame-and-prime-to-p](#IG-1-tame-and-prime-to-p), [IG.1/finite-field-frobenius](#IG-1-finite-field-frobenius), [IG.5/tame-g-cover](#IG-5-tame-g-cover), [IG.1/tame-tangential-fiber](#IG-1-tame-tangential-fiber), [IG.6/belyi-arithmetic-interface](#IG-6-belyi-arithmetic-interface).
- **tauceti:TauCetiRoadmap/BelyiMaps#layer-13-the-pro-ℓ-peripheral-theorem-and-faithfulness**: Use the existing layer contract for Field and multiplicative-group acceptance comparisons, Tame and prime-to-p fundamental quotients, Frobenius and cyclotomic normalization, Tame G-covers in families, Tame tangential fibers at a smooth curve boundary, Dessins, inertia and arithmetic conventions, The imported faithful action on dessins. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.0/field-and-torus-comparisons](#IG-0-field-and-torus-comparisons), [IG.1/tame-and-prime-to-p](#IG-1-tame-and-prime-to-p), [IG.1/finite-field-frobenius](#IG-1-finite-field-frobenius), [IG.5/tame-g-cover](#IG-5-tame-g-cover), [IG.1/tame-tangential-fiber](#IG-1-tame-tangential-fiber), [IG.6/belyi-arithmetic-interface](#IG-6-belyi-arithmetic-interface), [IG.6/faithful-dessin-action-import](#IG-6-faithful-dessin-action-import).
- **tauceti:TauCetiRoadmap/BelyiMaps#layer-3-finite-enumeration-and-character-theoretic-counts**: Use the existing layer contract for Realizing general generating sphere tuples, A rigid S₃ cover and its dessin. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.3/branch-cycle-realization](#IG-3-branch-cycle-realization), [IG.3/rigid-s3-comparison](#IG-3-rigid-s3-comparison).
- **tauceti:TauCetiRoadmap/BelyiMaps#layer-5-the-thrice-punctured-sphere-and-its-fundamental-group**: Use the existing layer contract for Realizing general generating sphere tuples, A rigid S₃ cover and its dessin. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.3/branch-cycle-realization](#IG-3-branch-cycle-realization), [IG.3/rigid-s3-comparison](#IG-3-rigid-s3-comparison).
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants**: Use the existing layer contract for Hilbert irreducibility over number fields, Hilbert specialization with local conditions, The integral thin-set counting kernel, A worked disjoint quadratic family, Finite Galois localization and Sha kernels, Finite-coefficient Poitou–Tate input, Grunwald–Wang and its exceptional class, Induced abelian proper solutions, Cyclic ramification correction, Property E for the arithmetic unramified group, Tame central lift after adjoining roots, The global arithmetic lifting invariant, Cyclic realization examples. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.2/number-field-hilbert](#IG-2-number-field-hilbert), [IG.2/hilbert-local-conditions](#IG-2-hilbert-local-conditions), [IG.2/integral-thin-count](#IG-2-integral-thin-count), [IG.2/quadratic-specialization-example](#IG-2-quadratic-specialization-example), [IG.4/finite-galois-localization](#IG-4-finite-galois-localization), [IG.4/restricted-poitou-tate](#IG-4-restricted-poitou-tate), [IG.4/grunwald-wang-boundary](#IG-4-grunwald-wang-boundary), [IG.4/induced-proper-solutions](#IG-4-induced-proper-solutions), [IG.4/cyclic-ramification-correction](#IG-4-cyclic-ramification-correction), [IG.4/unramified-property-e](#IG-4-unramified-property-e), [IG.4/tame-central-lift](#IG-4-tame-central-lift), [IG.4/global-arithmetic-invariant](#IG-4-global-arithmetic-invariant), [IG.6/cyclic-worked-realizations](#IG-6-cyclic-worked-realizations), [IG.4/wang-cyclic-eight-counterexample](#IG-4-wang-cyclic-eight-counterexample).
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence**: Use the existing layer contract for Hilbert irreducibility over number fields, Hilbert specialization with local conditions, The integral thin-set counting kernel, A worked disjoint quadratic family, Finite Galois localization and Sha kernels, Finite-coefficient Poitou–Tate input, Grunwald–Wang and its exceptional class, Induced abelian proper solutions, Cyclic ramification correction, Property E for the arithmetic unramified group, Tame central lift after adjoining roots, The global arithmetic lifting invariant, Cyclic realization examples. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.2/number-field-hilbert](#IG-2-number-field-hilbert), [IG.2/hilbert-local-conditions](#IG-2-hilbert-local-conditions), [IG.2/integral-thin-count](#IG-2-integral-thin-count), [IG.2/quadratic-specialization-example](#IG-2-quadratic-specialization-example), [IG.4/finite-galois-localization](#IG-4-finite-galois-localization), [IG.4/restricted-poitou-tate](#IG-4-restricted-poitou-tate), [IG.4/grunwald-wang-boundary](#IG-4-grunwald-wang-boundary), [IG.4/induced-proper-solutions](#IG-4-induced-proper-solutions), [IG.4/cyclic-ramification-correction](#IG-4-cyclic-ramification-correction), [IG.4/unramified-property-e](#IG-4-unramified-property-e), [IG.4/tame-central-lift](#IG-4-tame-central-lift), [IG.4/global-arithmetic-invariant](#IG-4-global-arithmetic-invariant), [IG.6/cyclic-worked-realizations](#IG-6-cyclic-worked-realizations), [IG.2/general-hilbert-local-approximation](#IG-2-general-hilbert-local-approximation).
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality**: Use the existing layer contract for Finite Galois localization and Sha kernels. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.4/finite-galois-localization](#IG-4-finite-galois-localization).
- **tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius**: Use the existing layer contract for Scheme decomposition and inertia groups, Auxiliary cyclic prescriptions force full image. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.1/decomposition-inertia](#IG-1-decomposition-inertia), [IG.4/auxiliary-class-properness](#IG-4-auxiliary-class-properness).
- **tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration**: Use the existing layer contract for Tame and prime-to-p fundamental quotients. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.1/tame-and-prime-to-p](#IG-1-tame-and-prime-to-p).
- **tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group**: Use the existing layer contract for Frobenius and cyclotomic normalization. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.1/finite-field-frobenius](#IG-1-finite-field-frobenius).
- **tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors**: Use the existing layer contract for Finite stabilizers and homogeneous fundamental groups. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.1/homogeneous-space-fundamental-group](#IG-1-homogeneous-space-fundamental-group).
- **tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions**: Use the existing layer contract for Field and multiplicative-group acceptance comparisons. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.0/field-and-torus-comparisons](#IG-0-field-and-torus-comparisons).
- **tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-2-the-dictionary-between-galois-theory-and-permutations**: Use the existing layer contract for Cyclic realization examples, A degree-eight dihedral realization, Generic-polynomial universality. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.6/cyclic-worked-realizations](#IG-6-cyclic-worked-realizations), [IG.6/dihedral-eight-realization](#IG-6-dihedral-eight-realization), [IG.6/generic-polynomial-universality](#IG-6-generic-polynomial-universality).
- **tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-3-the-discriminant-and-the-alternating-group**: Use the existing layer contract for Cyclic realization examples, A degree-eight dihedral realization, Generic-polynomial universality. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.6/cyclic-worked-realizations](#IG-6-cyclic-worked-realizations), [IG.6/dihedral-eight-realization](#IG-6-dihedral-eight-realization), [IG.6/generic-polynomial-universality](#IG-6-generic-polynomial-universality).
- **tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-9-sₙ-as-a-galois-group-over-ℚ**: Use the existing layer contract for The existing symmetric-group family. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.6/symmetric-family-import](#IG-6-symmetric-family-import).
- **tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality**: Use the existing layer contract for Finite Galois localization and Sha kernels, Finite-coefficient Poitou–Tate input, Free operator-group shrinking. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.4/finite-galois-localization](#IG-4-finite-galois-localization), [IG.4/restricted-poitou-tate](#IG-4-restricted-poitou-tate), [IG.4/free-operator-shrinking](#IG-4-free-operator-shrinking).
- **tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma**: Use the existing layer contract for Finite Galois localization and Sha kernels, Finite-coefficient Poitou–Tate input, Free operator-group shrinking. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.4/finite-galois-localization](#IG-4-finite-galois-localization), [IG.4/restricted-poitou-tate](#IG-4-restricted-poitou-tate), [IG.4/free-operator-shrinking](#IG-4-free-operator-shrinking).
- **tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-5-presentations-extensions-and-the-rank-interpretations**: Use the existing layer contract for Proper solutions with local prescriptions, Finite abelian-kernel obstruction and pullback, Free operator-group shrinking, Central Property E. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.4/proper-local-embedding-problem](#IG-4-proper-local-embedding-problem), [IG.4/abelian-kernel-obstruction](#IG-4-abelian-kernel-obstruction), [IG.4/free-operator-shrinking](#IG-4-free-operator-shrinking), [IG.4/property-e](#IG-4-property-e).
- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups**: Use the existing layer contract for Finite stabilizers and homogeneous fundamental groups. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced. Consumers: [IG.1/homogeneous-space-fundamental-group](#IG-1-homogeneous-space-fundamental-group).
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors**: Use the existing layer contract for Wang’s cyclic-eight local obstruction. Exact restrictions are in these nodes; this is an import, not a second construction. Consumers: [IG.4/wang-cyclic-eight-counterexample](#IG-4-wang-cyclic-eight-counterexample).
- **tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations**: Use the existing layer contract for Frattini detection of full profinite image, Normal subgroups of absolute Galois groups, Finitely many bounded-degree geometric covers, Coprime profinite complements. Exact restrictions are in these nodes; this is an import, not a second construction. Consumers: [IG.2/frattini-full-image](#IG-2-frattini-full-image), [IG.2/absolute-galois-normal-subgroups](#IG-2-absolute-galois-normal-subgroups), [IG.3/bounded-cover-count](#IG-3-bounded-cover-count), [IG.4/coprime-profinite-complements](#IG-4-coprime-profinite-complements).
- **tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation**: Use the existing layer contract for Frattini detection of full profinite image. Exact restrictions are in these nodes; this is an import, not a second construction. Consumers: [IG.2/frattini-full-image](#IG-2-frattini-full-image), [IG.4/free-operator-shrinking](#IG-4-free-operator-shrinking).
- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary**: Use the existing layer contract for Approximation and nonabelian localization. Exact restrictions are in these nodes; this is an import, not a second construction. Consumers: [IG.4/finite-quotient-approximation](#IG-4-finite-quotient-approximation).
- **tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets**: Import the stated layer contracts; the consuming node statements give the exact restricted interface. Consumers: [IG.4/free-operator-shrinking](#IG-4-free-operator-shrinking).

## Remaining proof and carrier obligations

All stages have complete target-level coverage. Closure requires these exact obligations and the supplier contracts; the current plan claims neither proofs nor complete native signatures.

### Scheme Galois-category bridge

At the pin the abstract Galois-category and finite-étale-algebra APIs exist, but the connected scheme FEt category, geometric fiber instance, quotients and affine-to-scheme gluing have no complete native bridge. Build the exact carrier above before the omitted scheme and local-system Lean signatures; no abstract axioms are treated as a proof for schemes.

Needed by: [IG.0/finite-etale-covers](#IG-0-finite-etale-covers), [IG.0/geometric-fiber](#IG-0-geometric-fiber), [IG.0/etale-fundamental-group](#IG-0-etale-fundamental-group), [IG.0/basepoint-and-components](#IG-0-basepoint-and-components), [IG.0/field-and-torus-comparisons](#IG-0-field-and-torus-comparisons), [IG.0/finite-galois-algebras](#IG-0-finite-galois-algebras), [IG.0/finite-etale-idempotents](#IG-0-finite-etale-idempotents), [IG.0/integral-monodromy](#IG-0-integral-monodromy), [IG.0/adic-local-systems](#IG-0-adic-local-systems), [IG.0/adic-representations](#IG-0-adic-representations).

### Noohi and pro-étale carrier signatures

The pin has the scheme pro-étale site but no Noohi or infinite Galois-category reconstruction API. Construct the explicit Loc/Cov and continuous target groupoids before stating these in Lean; the categorical set-sized generator argument in Bhatt–Scholze7.4.1 is also an explicit proof obligation.

Needed by: [IG.0/noohi-groups](#IG-0-noohi-groups), [IG.0/proetale-fundamental-group](#IG-0-proetale-fundamental-group).

### Stack completion exactness source

Read Anderson1974 Proposition3 and the topological bundle hypotheses in full before certifying the geometric moduli π₁ exactness proof. Landesman–Litt pp.46–47 explicitly cites it; no unconditional centreless-kernel theorem is substituted.

Needed by: [IG.1/stack-and-family-exactness](#IG-1-stack-and-family-exactness).

### Geometric specialization carrier

The native scheme π₁ bridge and supplier smooth-pair lifting are required before the exact specialization and scheme-inertia signatures can be stated. The complete SGA1 target statements are specified above.

Needed by: [IG.1/arithmetic-exact-sequence](#IG-1-arithmetic-exact-sequence), [IG.1/decomposition-inertia](#IG-1-decomposition-inertia), [IG.1/tame-and-prime-to-p](#IG-1-tame-and-prime-to-p), [IG.1/proper-specialization](#IG-1-proper-specialization), [IG.1/punctured-specialization](#IG-1-punctured-specialization), [IG.1/finite-field-frobenius](#IG-1-finite-field-frobenius), [IG.1/charzero-base-extension](#IG-1-charzero-base-extension), [IG.1/arithmetic-representation](#IG-1-arithmetic-representation), [IG.1/stack-and-family-exactness](#IG-1-stack-and-family-exactness).

### Quantitative and local Hilbert proof sources

Read Ekedahl1990 Theorem1.3 and its proof, Cohen’s integral thin-set large-sieve proof, and Serre’s compact-analytic Frattini proposition in full before certifying these proof chains. The papers naming them were read; those references alone do not certify the missing proofs.

Needed by: [IG.2/hilbert-local-conditions](#IG-2-hilbert-local-conditions), [IG.2/integral-thin-count](#IG-2-integral-thin-count), [IG.2/frattini-full-image](#IG-2-frattini-full-image).

### Norm Hilbert all-point comparison

The norm construction requires exact all-point inclusion and rational-fiber equality after shrinking. Resolve the algebraic residue-field argument before strengthening the target to equality on all scheme points; no such strengthened equality is used.

Needed by: [IG.2/norm-pullback-hilbert](#IG-2-norm-pullback-hilbert).

### Absolute Galois original proof and ownership

Read Fried–Jarden2008 Proposition16.11.6 and Weissauer’s original theorem from a cleared source before certifying this stronger target. The ownership proposal gives it the named IG.2 continuation; the extraction’s UNACCEPTED route cannot be declared accepted by this blueprint.

Needed by: [IG.2/absolute-galois-normal-subgroups](#IG-2-absolute-galois-normal-subgroups).

### Stable braid cancellation proof

Read Fried–Völklein1991 Appendix Lemma3 in full or supply its finite-group braid proof. Wood21’s full stable proof was read, but this cancellation input is cited there rather than proved.

Needed by: [IG.3/stable-braid-classification](#IG-3-stable-braid-classification).

### Exact open Nielsen predicates

Chen Conjectures1.1.3/1.1.4 and Question1.4.1 were collated with the primary McCullough–Wanderley2013 weak-trace formulation and its exceptional q. Read Garion2008’s original transitivity conjecture and complete the Out/Aut and field-automorphism convention collation before typing these open predicates. They are never used as theorem premises.

Needed by: [IG.3/nielsen-open-statements](#IG-3-nielsen-open-statements).

### General nonproper Riemann-existence algebraization

SGA1 XII5.1 is stronger than proper coherent GAGA; its local finite analytic-algebra algebraization and gluing proof is a target-level proof obligation. The arbitrary-dimensional finite-CW input in Gao–Habegger also needs its exact source and proof before certification.

Needed by: [IG.3/general-riemann-existence](#IG-3-general-riemann-existence), [IG.3/bounded-cover-count](#IG-3-bounded-cover-count).

### General cover descent signature

The native scheme-cover and continuous H²/torsor carriers must be connected before the general r-branch descent and Tate-twist signatures can be stated. The real example additionally needs a checked SL₂(F₅) double-cover model and the four-branch path computation.

Needed by: [IG.3/branch-cycle-realization](#IG-3-branch-cycle-realization), [IG.3/rational-rigidity](#IG-3-rational-rigidity), [IG.3/general-cover-moduli-descent](#IG-3-general-cover-moduli-descent), [IG.3/real-moduli-counterexample](#IG-3-real-moduli-counterexample), [IG.3/rigid-s3-comparison](#IG-3-rigid-s3-comparison), [IG.3/lifting-invariant](#IG-3-lifting-invariant), [IG.3/stable-braid-classification](#IG-3-stable-braid-classification), [IG.3/arithmetic-lift-comparison](#IG-3-arithmetic-lift-comparison).

### Original finite-module global duality proof

The exact restricted Poitou–Tate statements and their use were read in DLAN §2.6 and Schmidt–Wingberg. Their cited original proof of global duality was not read. Supply the finite-coefficient reciprocity exact-complex proof, with unramified restricted products and modified real terms; this is not a request to the higher ArithmeticGaloisDuality tier.

Needed by: [IG.4/restricted-poitou-tate](#IG-4-restricted-poitou-tate), [IG.4/grunwald-wang-boundary](#IG-4-grunwald-wang-boundary), [IG.4/split-nilpotent-proper-solutions](#IG-4-split-nilpotent-proper-solutions), [IG.4/unramified-property-e](#IG-4-unramified-property-e), [IG.4/tame-central-lift](#IG-4-tame-central-lift).

### Finite solvable structural proof

Read or prove the finite-group structure input Φ(G)<F(G) for nontrivial finite solvable G, cited by Schmidt–Wingberg to Huppert. The complete arithmetic induction was read; do not certify the cited group-theoretic input without its proof.

Needed by: [IG.4/fitting-supplement](#IG-4-fitting-supplement), [IG.4/shafarevich-solvable-realization](#IG-4-shafarevich-solvable-realization).

### Homogeneous-space arithmetic proof input

The exact supersolvable, quaternion and collective-degree conclusions are source-checked. Their geometric fibration/descent theorem, Demarche’s quaternion Brauer computation and the regular collective-degree refinement cited to Colliot-Thélène2000 need full proof collation. Keep these restricted arithmetic targets here under the tier order; route broader homogeneous-space geometry separately through the manager.

Needed by: [IG.4/supersolvable-grunwald](#IG-4-supersolvable-grunwald), [IG.4/quaternion-all-place-prescriptions](#IG-4-quaternion-all-place-prescriptions), [IG.4/collective-degree-realization](#IG-4-collective-degree-realization).

### Central global-character criterion

LWZB’s full finite/profinite argument was read, but its central global lift invokes Malle–Matzat Theorem10.2, whose proof was not read. Supply this restricted root-of-unity-free global central criterion from the finite-coefficient kernel above; do not silently infer proper solvability for every central problem.

Needed by: [IG.4/unramified-property-e](#IG-4-unramified-property-e).

### Arithmetic embedding signatures

The current TauCeti FiniteEmbeddingProblem and generic extension dictionary must be reconciled with the pinned roadmap imports; number-field place, continuous cohomology, free operator filtration, and Cartier-dual carriers remain unavailable at the pinned build. Omit exact affected signatures rather than invent obstruction or proper-solution axioms.

Needed by: [IG.4/proper-local-embedding-problem](#IG-4-proper-local-embedding-problem), [IG.4/abelian-kernel-obstruction](#IG-4-abelian-kernel-obstruction), [IG.4/finite-galois-localization](#IG-4-finite-galois-localization), [IG.4/restricted-poitou-tate](#IG-4-restricted-poitou-tate), [IG.4/solution-twisting](#IG-4-solution-twisting), [IG.4/grunwald-wang-boundary](#IG-4-grunwald-wang-boundary), [IG.4/independent-cyclic-eight-lifts](#IG-4-independent-cyclic-eight-lifts), [IG.4/free-operator-shrinking](#IG-4-free-operator-shrinking), [IG.4/induced-proper-solutions](#IG-4-induced-proper-solutions), [IG.4/cyclic-ramification-correction](#IG-4-cyclic-ramification-correction), [IG.4/split-nilpotent-proper-solutions](#IG-4-split-nilpotent-proper-solutions), [IG.4/fitting-supplement](#IG-4-fitting-supplement), [IG.4/shafarevich-solvable-realization](#IG-4-shafarevich-solvable-realization), [IG.4/supersolvable-grunwald](#IG-4-supersolvable-grunwald), [IG.4/quaternion-all-place-prescriptions](#IG-4-quaternion-all-place-prescriptions), [IG.4/collective-degree-realization](#IG-4-collective-degree-realization), [IG.4/base-no-unramified-extension](#IG-4-base-no-unramified-extension), [IG.4/unramified-gamma-groups](#IG-4-unramified-gamma-groups), [IG.4/property-e](#IG-4-property-e), [IG.4/unramified-property-e](#IG-4-unramified-property-e), [IG.4/tame-central-lift](#IG-4-tame-central-lift), [IG.4/global-arithmetic-invariant](#IG-4-global-arithmetic-invariant).

### Original tame/admissible moduli construction proofs

Romagny–Wewers descent/deformation/gluing and LWZB comparison were read. Complete the cited Wewers admissible-cover and ACV proper-DM construction, Hall relative stack GAGA, and Emsalem/Kanev enlargement to disconnected covers with inactive punctures. Until the actual fiber category and representability proof are connected, all geometric moduli signatures are omitted.

Needed by: [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli), [IG.5/arbitrary-monodromy-marked-moduli](#IG-5-arbitrary-monodromy-marked-moduli), [IG.5/hurwitz-analytic-comparison](#IG-5-hurwitz-analytic-comparison), [IG.5/admissible-g-covers](#IG-5-admissible-g-covers), [IG.5/admissible-stacks-and-stable-curves](#IG-5-admissible-stacks-and-stable-curves).

### Nonproper cohomology kernel and coefficient tower

Read the cited relative vanishing-cycle/local-acyclicity proof, finite-coefficient Artin comparison and their coefficient-compatible maps. Prove ML/finite-generation and invariant descent before the Qℓ passage. The finite Hurwitz duality/trace/weight proof must be supplied here under the tier order; none is certified by naming a higher supplier.

Needed by: [IG.5/tame-cohomological-specialization](#IG-5-tame-cohomological-specialization), [IG.5/fixed-degree-mod-l-comparison](#IG-5-fixed-degree-mod-l-comparison), [IG.5/coefficient-tower-comparison](#IG-5-coefficient-tower-comparison), [IG.5/restricted-hurwitz-trace-kernel](#IG-5-restricted-hurwitz-trace-kernel), [IG.5/fixed-degree-point-estimate](#IG-5-fixed-degree-point-estimate).

### Low-class orbit and lattice proof input

LWZB component-count proofs were read, but Ellenberg–Venkatesh2005 Lemma3.3, used to bound components outside the stable range, was not read. Supply that exact estimate and verify strictly positive lattice weights and the n≥1 boundary before certification.

Needed by: [IG.5/frobenius-component-count](#IG-5-frobenius-component-count), [IG.5/semidirect-component-comparison](#IG-5-semidirect-component-comparison).

### Wild patching and Abhyankar proof sources

A lawful primary field-patching version was read: Harbater–Hartmann4.9–4.11/7.1. Supply its complete §3 approximation/factorization proof and the formal branched-cover patching theorem used in the Raynaud–Harbater construction. HOPS §3.3 proof outlines were read; original Raynaud/Harbater sufficiency proofs still require full reading and formal local lifting/deformation contracts. Field-algebra patching alone does not certify those formal cover constructions.

Needed by: [IG.5/formal-curve-patching](#IG-5-formal-curve-patching), [IG.5/abhyankar-affine-curve-realization](#IG-5-abhyankar-affine-curve-realization).

### Hurwitz geometry signatures

Native finite-cover, stack, branched-cover, analytic comparison and ℓ-adic cohomology carriers are unavailable at the pinned build. Ordinary configuration subtype/quotient, tuple and affine-coordinate signatures can be stated; omit the exact remaining node/API/test declarations and list their IDs in the suggested file.

Needed by: [IG.5/configuration-braid-group](#IG-5-configuration-braid-group), [IG.5/topological-hurwitz-covers](#IG-5-topological-hurwitz-covers), [IG.5/forget-hurwitz-marking](#IG-5-forget-hurwitz-marking), [IG.5/tame-g-cover](#IG-5-tame-g-cover), [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli), [IG.5/arbitrary-monodromy-marked-moduli](#IG-5-arbitrary-monodromy-marked-moduli), [IG.5/hurwitz-analytic-comparison](#IG-5-hurwitz-analytic-comparison), [IG.5/admissible-g-covers](#IG-5-admissible-g-covers), [IG.5/admissible-stacks-and-stable-curves](#IG-5-admissible-stacks-and-stable-curves), [IG.5/ordered-configuration-compactification](#IG-5-ordered-configuration-compactification), [IG.5/tame-cohomological-specialization](#IG-5-tame-cohomological-specialization), [IG.5/fixed-degree-mod-l-comparison](#IG-5-fixed-degree-mod-l-comparison), [IG.5/coefficient-tower-comparison](#IG-5-coefficient-tower-comparison), [IG.5/restricted-hurwitz-trace-kernel](#IG-5-restricted-hurwitz-trace-kernel), [IG.5/fixed-degree-point-estimate](#IG-5-fixed-degree-point-estimate), [IG.5/hurwitz-points-and-extensions](#IG-5-hurwitz-points-and-extensions), [IG.5/hurwitz-component-invariants](#IG-5-hurwitz-component-invariants), [IG.5/frobenius-component-count](#IG-5-frobenius-component-count), [IG.5/semidirect-component-comparison](#IG-5-semidirect-component-comparison), [IG.5/product-one-component-monoid](#IG-5-product-one-component-monoid), [IG.5/bounded-core-galois-reduction](#IG-5-bounded-core-galois-reduction), [IG.5/double-cover-trace-zero](#IG-5-double-cover-trace-zero), [IG.5/labelled-hyperelliptic-family](#IG-5-labelled-hyperelliptic-family), [IG.5/finite-cover-image-lemmas](#IG-5-finite-cover-image-lemmas), [IG.5/formal-curve-patching](#IG-5-formal-curve-patching), [IG.5/abhyankar-affine-curve-realization](#IG-5-abhyankar-affine-curve-realization), [IG.5/versal-phi-cover-families](#IG-5-versal-phi-cover-families), [IG.5/general-fixed-fiber-equation](#IG-5-general-fixed-fiber-equation).

### Artin and residual-finiteness original proofs

Read SGA4 XI §§4.4–4.6, construct the elementary-fibration tower and coefficient-compatible site maps; supply the original residual-finiteness proof for compact surface groups. These are finite kernels owned here because general downstream comparison/representation roadmaps are later-tier.

Needed by: [IG.3/finite-coefficient-comparison](#IG-3-finite-coefficient-comparison), [IG.3/artin-good-neighborhoods](#IG-3-artin-good-neighborhoods), [IG.3/curve-topological-density](#IG-3-curve-topological-density).

### Versal-family original construction

Read Wewers1998 Theorem4, match its general genus/marking stack and chosen-cover point, and prove the dominant étale multisection construction with the section contract.

Needed by: [IG.5/versal-phi-cover-families](#IG-5-versal-phi-cover-families).

### Realization and generic-polynomial signatures

The native finite Galois field/polynomial certificate, complex-adjoin D₈ carrier and finite solvable realization signature now elaborate. Generic multi-parameter coefficient fields, regular cover models and their full-group integral specialization bridge remain missing. Omit those exact declarations and enumerate their node/API/test IDs in Suggested.lean.

Needed by: [IG.6/specialization-export](#IG-6-specialization-export), [IG.6/dihedral-eight-realization](#IG-6-dihedral-eight-realization), [IG.6/generic-polynomial-universality](#IG-6-generic-polynomial-universality).

### Semisimple-group simply connected comparison

Supply the original topology-to-finite-etale proof that an algebraically simply connected semisimple group in characteristic zero has trivial étale π₁. Algebraic simple connectedness is not by itself a proof about the scheme fiber functor.

Needed by: [IG.1/homogeneous-space-fundamental-group](#IG-1-homogeneous-space-fundamental-group).

### Profinite complement conjugacy proof

Read Ribes–Zalesskii2010 Theorem2.3.15 from a cleared source, including finite complement conjugacy and the inverse-limit argument. The pinned Mathlib Schur–Zassenhaus theorem supplies finite existence only. No Belyi layer is cited as supplying this result.

Needed by: [IG.4/coprime-profinite-complements](#IG-4-coprime-profinite-complements), [IG.4/unramified-gamma-groups](#IG-4-unramified-gamma-groups).

### Nonproper characteristic-zero base-extension proof

Read the original algebraically closed extension-invariance argument cited by Gao–Habegger LemmaB.2 (Cadoret Corollary6.5/Remark6.8 and SGA1 XIII). SGA1 X1.8 was read and supplies the proper case only. The finite-type nonproper characteristic-zero statement has its own exact target and remains an original-proof obligation.

Needed by: [IG.1/charzero-base-extension](#IG-1-charzero-base-extension), [IG.3/bounded-cover-count](#IG-3-bounded-cover-count).

## Routed-source coverage

The ledger checks 151 candidate routed items against this plan. Of them, 150 are assigned to this roadmap or its native/import adapters; Chen/4 is the separately owned congruence theorem and is excluded. Withdrawn EVW12 counting conclusions and unrelated results of the cited papers are not premises. This is target coverage, not a source-by-source summary or an assertion of complete source decomposition.

| Routed item | Owner(s) | Disposition |
| --- | --- | --- |
| PAPER-BREUIL-CONRAD-DIAMOND-ETAL-01/ekedahl-hilbert-irreducibility | [IG.2/general-hilbert-local-approximation](#IG-2-general-hilbert-local-approximation), [IG.2/hilbert-local-conditions](#IG-2-hilbert-local-conditions) | planned here or supplier adapter |
| PAPER-CARAIANI-SCHOLZE-17/125 | [IG.0/proetale-fundamental-group](#IG-0-proetale-fundamental-group) | planned here or supplier adapter |
| PAPER-CHEN-24/4 | NonabelianLevelStructures (PAPER-CHEN-24 route6; design pending) | owned elsewhere; excluded from this blueprint |
| PAPER-CHEN-24/5 | [IG.3/exterior-epimorphisms](#IG-3-exterior-epimorphisms) | planned here or supplier adapter |
| PAPER-CHEN-24/6 | [IG.3/nielsen-open-statements](#IG-3-nielsen-open-statements) | planned here or supplier adapter |
| PAPER-CHEN-24/7 | [IG.3/nielsen-open-statements](#IG-3-nielsen-open-statements) | planned here or supplier adapter |
| PAPER-CHEN-24/18 | [IG.3/nielsen-open-statements](#IG-3-nielsen-open-statements) | planned here or supplier adapter |
| PAPER-CHEN-24/21 | [IG.5/admissible-g-covers](#IG-5-admissible-g-covers) | planned here or supplier adapter |
| PAPER-CHEN-24/23 | [IG.5/admissible-g-covers](#IG-5-admissible-g-covers), [IG.5/admissible-stacks-and-stable-curves](#IG-5-admissible-stacks-and-stable-curves) | planned here or supplier adapter |
| PAPER-CHEN-24/33 | [IG.5/admissible-stacks-and-stable-curves](#IG-5-admissible-stacks-and-stable-curves) | planned here or supplier adapter |
| PAPER-CHEN-24/127 | [IG.5/admissible-g-covers](#IG-5-admissible-g-covers), [IG.5/admissible-stacks-and-stable-curves](#IG-5-admissible-stacks-and-stable-curves) | planned here or supplier adapter |
| PAPER-CHEN-24/129 | [IG.1/charzero-base-extension](#IG-1-charzero-base-extension), [IG.3/general-riemann-existence](#IG-3-general-riemann-existence) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/1 | mathlib:AlgebraicTopology.singularChainComplexFunctor, mathlib:AlgebraicTopology.singularHomologyFunctor | native import |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/2 | tauceti:TauCeti.BraidGroup | native import |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/4 | mathlib:MonoidAlgebra | native import |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/8 | [IG.5/configuration-spaces](#IG-5-configuration-spaces) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/9 | [IG.5/configuration-braid-group](#IG-5-configuration-braid-group) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/10 | [IG.5/configuration-braid-group](#IG-5-configuration-braid-group) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/11 | [IG.3/hurwitz-braid-action](#IG-3-hurwitz-braid-action) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/12 | [IG.5/topological-hurwitz-covers](#IG-5-topological-hurwitz-covers) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/13 | [IG.5/topological-hurwitz-covers](#IG-5-topological-hurwitz-covers) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/14 | [IG.5/forget-hurwitz-marking](#IG-5-forget-hurwitz-marking) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/15 | [IG.5/topological-hurwitz-covers](#IG-5-topological-hurwitz-covers) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/16 | [IG.5/topological-hurwitz-covers](#IG-5-topological-hurwitz-covers), [IG.3/branch-cycle-realization](#IG-3-branch-cycle-realization) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/17 | [IG.3/branch-tuples](#IG-3-branch-tuples), [IG.5/topological-hurwitz-covers](#IG-5-topological-hurwitz-covers) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/22 | [IG.3/braid-orbit-monoid](#IG-3-braid-orbit-monoid) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/24 | [IG.3/eventual-class-element-extraction](#IG-3-eventual-class-element-extraction) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/61 | [IG.5/configuration-spaces](#IG-5-configuration-spaces) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/62 | [IG.5/tame-g-cover](#IG-5-tame-g-cover) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/63 | [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/64 | [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/65 | [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/66 | [IG.5/ordered-configuration-compactification](#IG-5-ordered-configuration-compactification) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/67 | [IG.5/ordered-configuration-compactification](#IG-5-ordered-configuration-compactification) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/68 | [IG.5/tame-cohomological-specialization](#IG-5-tame-cohomological-specialization) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/117 | [IG.3/general-cover-moduli-descent](#IG-3-general-cover-moduli-descent), [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/118 | [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/119 | [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/120 | [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/124 | [IG.5/fixed-degree-mod-l-comparison](#IG-5-fixed-degree-mod-l-comparison), [IG.5/coefficient-tower-comparison](#IG-5-coefficient-tower-comparison) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/128 | [IG.5/lifted-affine-coordinate-group](#IG-5-lifted-affine-coordinate-group) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/129 | [IG.5/lifted-affine-coordinate-group](#IG-5-lifted-affine-coordinate-group) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/130 | [IG.5/labelled-hyperelliptic-family](#IG-5-labelled-hyperelliptic-family) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/131 | [IG.5/labelled-hyperelliptic-family](#IG-5-labelled-hyperelliptic-family) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/132 | [IG.5/finite-cover-image-lemmas](#IG-5-finite-cover-image-lemmas) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/133 | [IG.5/finite-cover-image-lemmas](#IG-5-finite-cover-image-lemmas) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/136 | [IG.5/double-cover-trace-zero](#IG-5-double-cover-trace-zero) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/riemann-existence-punctured-line | [IG.3/general-riemann-existence](#IG-3-general-riemann-existence), [IG.5/hurwitz-analytic-comparison](#IG-5-hurwitz-analytic-comparison) | planned here or supplier adapter |
| PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/mod-l-comparison | [IG.5/fixed-degree-mod-l-comparison](#IG-5-fixed-degree-mod-l-comparison) | planned here or supplier adapter |
| PAPER-GAO-HABEGGER-19/22 | [IG.3/bounded-cover-count](#IG-3-bounded-cover-count) | planned here or supplier adapter |
| PAPER-GAO-HABEGGER-19/77 | [IG.3/general-riemann-existence](#IG-3-general-riemann-existence) | planned here or supplier adapter |
| PAPER-GAO-HABEGGER-19/78 | [IG.3/bounded-cover-count](#IG-3-bounded-cover-count) | planned here or supplier adapter |
| PAPER-GAO-HABEGGER-19/79 | [IG.1/charzero-base-extension](#IG-1-charzero-base-extension) | planned here or supplier adapter |
| PAPER-HARPAZ-WITTENBERG-20/10 | [IG.2/hilbert-subsets](#IG-2-hilbert-subsets) | planned here or supplier adapter |
| PAPER-HARPAZ-WITTENBERG-20/74 | [IG.2/norm-pullback-hilbert](#IG-2-norm-pullback-hilbert) | planned here or supplier adapter |
| PAPER-HARPAZ-WITTENBERG-20/79 | [IG.1/homogeneous-space-fundamental-group](#IG-1-homogeneous-space-fundamental-group) | planned here or supplier adapter |
| PAPER-HARPAZ-WITTENBERG-20/103 | [IG.4/supersolvable-grunwald](#IG-4-supersolvable-grunwald) | planned here or supplier adapter |
| PAPER-HARPAZ-WITTENBERG-20/105 | [IG.4/quaternion-all-place-prescriptions](#IG-4-quaternion-all-place-prescriptions) | planned here or supplier adapter |
| PAPER-HARPAZ-WITTENBERG-20/106 | [IG.4/wang-cyclic-eight-counterexample](#IG-4-wang-cyclic-eight-counterexample) | planned here or supplier adapter |
| PAPER-HARPAZ-WITTENBERG-20/130 | [IG.4/collective-degree-realization](#IG-4-collective-degree-realization) | planned here or supplier adapter |
| PAPER-HARPAZ-WITTENBERG-20/143 | [IG.4/finite-quotient-approximation](#IG-4-finite-quotient-approximation) | planned here or supplier adapter |
| PAPER-HARPAZ-WITTENBERG-20/144 | [IG.4/auxiliary-class-properness](#IG-4-auxiliary-class-properness) | planned here or supplier adapter |
| PAPER-HARPAZ-WITTENBERG-23/122 | [IG.4/independent-cyclic-eight-lifts](#IG-4-independent-cyclic-eight-lifts) | planned here or supplier adapter |
| PAPER-HARPAZ-WITTENBERG-23/123 | [IG.4/independent-cyclic-eight-lifts](#IG-4-independent-cyclic-eight-lifts) | planned here or supplier adapter |
| PAPER-HARPAZ-WITTENBERG-23/124 | [IG.4/independent-cyclic-eight-lifts](#IG-4-independent-cyclic-eight-lifts) | planned here or supplier adapter |
| PAPER-HARPAZ-WITTENBERG-23/126 | [IG.4/independent-cyclic-eight-lifts](#IG-4-independent-cyclic-eight-lifts) | planned here or supplier adapter |
| PAPER-HARPAZ-WITTENBERG-23/130 | [IG.4/grunwald-wang-boundary](#IG-4-grunwald-wang-boundary), [IG.4/independent-cyclic-eight-lifts](#IG-4-independent-cyclic-eight-lifts) | planned here or supplier adapter |
| PAPER-HARPAZ-WITTENBERG-23/136 | [IG.4/grunwald-wang-boundary](#IG-4-grunwald-wang-boundary), [IG.4/independent-cyclic-eight-lifts](#IG-4-independent-cyclic-eight-lifts) | planned here or supplier adapter |
| PAPER-KEDLAYA-LIU-15/7 | [IG.0/finite-etale-idempotents](#IG-0-finite-etale-idempotents) | planned here or supplier adapter |
| PAPER-KEDLAYA-LIU-15/22 | [IG.0/adic-local-systems](#IG-0-adic-local-systems) | planned here or supplier adapter |
| PAPER-KEDLAYA-LIU-15/23 | [IG.0/adic-representations](#IG-0-adic-representations) | planned here or supplier adapter |
| PAPER-KEDLAYA-LIU-15/24 | [IG.0/adic-local-systems](#IG-0-adic-local-systems), [IG.0/adic-representations](#IG-0-adic-representations) | planned here or supplier adapter |
| PAPER-KEDLAYA-LIU-15/25 | [IG.0/adic-representations](#IG-0-adic-representations) | planned here or supplier adapter |
| PAPER-KEDLAYA-LIU-15/26 | [IG.0/adic-representations](#IG-0-adic-representations) | planned here or supplier adapter |
| PAPER-KEDLAYA-LIU-15/29 | [IG.0/adic-local-systems](#IG-0-adic-local-systems) | planned here or supplier adapter |
| PAPER-LANDESMAN-LITT-24/74 | [IG.1/arithmetic-representation](#IG-1-arithmetic-representation) | planned here or supplier adapter |
| PAPER-LANDESMAN-LITT-24/75 | [IG.1/arithmetic-exact-sequence](#IG-1-arithmetic-exact-sequence) | planned here or supplier adapter |
| PAPER-LANDESMAN-LITT-24/76 | [IG.3/curve-topological-density](#IG-3-curve-topological-density) | planned here or supplier adapter |
| PAPER-LANDESMAN-LITT-24/116 | [IG.3/artin-good-neighborhoods](#IG-3-artin-good-neighborhoods), [IG.3/finite-coefficient-comparison](#IG-3-finite-coefficient-comparison) | planned here or supplier adapter |
| PAPER-LANDESMAN-LITT-24/125 | [IG.5/versal-phi-cover-families](#IG-5-versal-phi-cover-families) | planned here or supplier adapter |
| PAPER-LIU-WOOD-ZUREICKBROWN-24/6 | [IG.4/coprime-profinite-complements](#IG-4-coprime-profinite-complements), [IG.4/unramified-gamma-groups](#IG-4-unramified-gamma-groups) | planned here or supplier adapter |
| PAPER-LIU-WOOD-ZUREICKBROWN-24/7 | [IG.4/unramified-gamma-groups](#IG-4-unramified-gamma-groups) | planned here or supplier adapter |
| PAPER-LIU-WOOD-ZUREICKBROWN-24/9 | [IG.4/property-e](#IG-4-property-e), [IG.4/unramified-property-e](#IG-4-unramified-property-e) | planned here or supplier adapter |
| PAPER-LIU-WOOD-ZUREICKBROWN-24/30 | [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli) | planned here or supplier adapter |
| PAPER-LIU-WOOD-ZUREICKBROWN-24/31 | [IG.5/hurwitz-analytic-comparison](#IG-5-hurwitz-analytic-comparison) | planned here or supplier adapter |
| PAPER-LIU-WOOD-ZUREICKBROWN-24/32 | [IG.5/hurwitz-points-and-extensions](#IG-5-hurwitz-points-and-extensions) | planned here or supplier adapter |
| PAPER-LIU-WOOD-ZUREICKBROWN-24/33 | [IG.5/tame-cohomological-specialization](#IG-5-tame-cohomological-specialization), [IG.5/fixed-degree-mod-l-comparison](#IG-5-fixed-degree-mod-l-comparison) | planned here or supplier adapter |
| PAPER-LIU-WOOD-ZUREICKBROWN-24/34 | [IG.5/hurwitz-points-and-extensions](#IG-5-hurwitz-points-and-extensions) | planned here or supplier adapter |
| PAPER-LIU-WOOD-ZUREICKBROWN-24/37 | [IG.5/hurwitz-component-invariants](#IG-5-hurwitz-component-invariants) | planned here or supplier adapter |
| PAPER-LIU-WOOD-ZUREICKBROWN-24/38 | [IG.5/hurwitz-component-invariants](#IG-5-hurwitz-component-invariants) | planned here or supplier adapter |
| PAPER-LIU-WOOD-ZUREICKBROWN-24/39 | [IG.3/stable-braid-classification](#IG-3-stable-braid-classification) | planned here or supplier adapter |
| PAPER-LIU-WOOD-ZUREICKBROWN-24/40 | [IG.5/frobenius-component-count](#IG-5-frobenius-component-count), [IG.5/general-fixed-fiber-equation](#IG-5-general-fixed-fiber-equation) | planned here or supplier adapter |
| PAPER-LIU-WOOD-ZUREICKBROWN-24/41 | [IG.5/semidirect-component-comparison](#IG-5-semidirect-component-comparison) | planned here or supplier adapter |
| PAPER-MASSER-ZANNIER-20/27 | [IG.2/frattini-full-image](#IG-2-frattini-full-image), [IG.2/integral-thin-count](#IG-2-integral-thin-count) | planned here or supplier adapter |
| PAPER-MERKURJEV-SCAVIA-26/3 | [IG.4/proper-local-embedding-problem](#IG-4-proper-local-embedding-problem), [IG.4/abelian-kernel-obstruction](#IG-4-abelian-kernel-obstruction) | planned here or supplier adapter |
| PAPER-MERKURJEV-SCAVIA-26/8 | [IG.4/abelian-kernel-obstruction](#IG-4-abelian-kernel-obstruction) | planned here or supplier adapter |
| PAPER-MERKURJEV-SCAVIA-26/9 | [IG.0/finite-galois-algebras](#IG-0-finite-galois-algebras) | planned here or supplier adapter |
| PAPER-MERKURJEV-SCAVIA-26/10 | [IG.0/finite-galois-algebras](#IG-0-finite-galois-algebras) | planned here or supplier adapter |
| PAPER-SCHROER-23/248 | [IG.0/integral-monodromy](#IG-0-integral-monodromy) | planned here or supplier adapter |
| PAPER-WOOD-19/19 | [IG.4/base-no-unramified-extension](#IG-4-base-no-unramified-extension) | planned here or supplier adapter |
| PAPER-WOOD-19/34 | [IG.4/global-arithmetic-invariant](#IG-4-global-arithmetic-invariant) | planned here or supplier adapter |
| PAPER-WOOD-19/35 | [IG.4/tame-central-lift](#IG-4-tame-central-lift) | planned here or supplier adapter |
| PAPER-WOOD-19/39 | [IG.4/tame-central-lift](#IG-4-tame-central-lift), [IG.4/grunwald-wang-boundary](#IG-4-grunwald-wang-boundary) | planned here or supplier adapter |
| PAPER-WOOD-19/41 | [IG.4/global-arithmetic-invariant](#IG-4-global-arithmetic-invariant) | planned here or supplier adapter |
| PAPER-WOOD-19/42 | [IG.4/global-arithmetic-invariant](#IG-4-global-arithmetic-invariant) | planned here or supplier adapter |
| PAPER-WOOD-19/44 | [IG.4/global-arithmetic-invariant](#IG-4-global-arithmetic-invariant) | planned here or supplier adapter |
| PAPER-WOOD-19/45 | [IG.4/global-arithmetic-invariant](#IG-4-global-arithmetic-invariant) | planned here or supplier adapter |
| PAPER-WOOD-19/46 | [IG.4/global-arithmetic-invariant](#IG-4-global-arithmetic-invariant) | planned here or supplier adapter |
| PAPER-WOOD-19/47 | [IG.4/global-arithmetic-invariant](#IG-4-global-arithmetic-invariant) | planned here or supplier adapter |
| PAPER-WOOD-19/48 | [IG.4/global-arithmetic-invariant](#IG-4-global-arithmetic-invariant) | planned here or supplier adapter |
| PAPER-WOOD-19/49 | [IG.4/global-arithmetic-invariant](#IG-4-global-arithmetic-invariant) | planned here or supplier adapter |
| PAPER-WOOD-19/50 | [IG.4/global-arithmetic-invariant](#IG-4-global-arithmetic-invariant) | planned here or supplier adapter |
| PAPER-WOOD-19/51 | [IG.4/global-arithmetic-invariant](#IG-4-global-arithmetic-invariant) | planned here or supplier adapter |
| PAPER-WOOD-19/54 | [IG.1/tame-and-prime-to-p](#IG-1-tame-and-prime-to-p) | planned here or supplier adapter |
| PAPER-WOOD-19/55 | [IG.3/lifting-invariant](#IG-3-lifting-invariant), [IG.3/arithmetic-lift-comparison](#IG-3-arithmetic-lift-comparison) | planned here or supplier adapter |
| PAPER-WOOD-19/56 | [IG.1/tame-and-prime-to-p](#IG-1-tame-and-prime-to-p), [IG.1/tame-tangential-fiber](#IG-1-tame-tangential-fiber) | planned here or supplier adapter |
| PAPER-WOOD-19/57 | [IG.3/lifting-invariant](#IG-3-lifting-invariant) | planned here or supplier adapter |
| PAPER-WOOD-19/58 | [IG.4/marked-arithmetic-extensions](#IG-4-marked-arithmetic-extensions) | planned here or supplier adapter |
| PAPER-WOOD-19/59 | [IG.5/hurwitz-component-invariants](#IG-5-hurwitz-component-invariants) | planned here or supplier adapter |
| PAPER-WOOD-19/60 | [IG.5/hurwitz-component-invariants](#IG-5-hurwitz-component-invariants) | planned here or supplier adapter |
| PAPER-WOOD-19/61 | [IG.3/arithmetic-lift-comparison](#IG-3-arithmetic-lift-comparison) | planned here or supplier adapter |
| PAPER-WOOD-19/71 | [IG.4/marked-arithmetic-extensions](#IG-4-marked-arithmetic-extensions) | planned here or supplier adapter |
| PAPER-WOOD-19/72 | [IG.4/marked-arithmetic-extensions](#IG-4-marked-arithmetic-extensions) | planned here or supplier adapter |
| PAPER-WOOD-19/73 | [IG.4/marked-arithmetic-extensions](#IG-4-marked-arithmetic-extensions) | planned here or supplier adapter |
| PAPER-WOOD-19/74 | [IG.4/marked-arithmetic-extensions](#IG-4-marked-arithmetic-extensions) | planned here or supplier adapter |
| PAPER-WOOD-19/75 | [IG.4/marked-arithmetic-extensions](#IG-4-marked-arithmetic-extensions) | planned here or supplier adapter |
| PAPER-WOOD-19/76 | [IG.5/configuration-spaces](#IG-5-configuration-spaces) | planned here or supplier adapter |
| PAPER-WOOD-19/77 | [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli) | planned here or supplier adapter |
| PAPER-WOOD-19/78 | [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli) | planned here or supplier adapter |
| PAPER-WOOD-19/79 | [IG.5/hurwitz-points-and-extensions](#IG-5-hurwitz-points-and-extensions) | planned here or supplier adapter |
| PAPER-WOOD-19/80 | [IG.5/hurwitz-component-invariants](#IG-5-hurwitz-component-invariants), [IG.3/stable-braid-classification](#IG-3-stable-braid-classification) | planned here or supplier adapter |
| PAPER-WOOD-19/81 | [IG.5/hurwitz-component-invariants](#IG-5-hurwitz-component-invariants), [IG.3/arithmetic-lift-comparison](#IG-3-arithmetic-lift-comparison) | planned here or supplier adapter |
| PAPER-WOOD-19/85 | [IG.5/ordered-configuration-compactification](#IG-5-ordered-configuration-compactification) | planned here or supplier adapter |
| PAPER-WOOD-19/86 | [IG.5/tame-cohomological-specialization](#IG-5-tame-cohomological-specialization), [IG.5/coefficient-tower-comparison](#IG-5-coefficient-tower-comparison) | planned here or supplier adapter |
| PAPER-WOOD-19/88 | [IG.5/fixed-degree-point-estimate](#IG-5-fixed-degree-point-estimate) | planned here or supplier adapter |
| PAPER-WOOD-19/134 | [IG.3/stable-braid-classification](#IG-3-stable-braid-classification) | planned here or supplier adapter |
| PAPER-WOOD-19/135 | [IG.5/tame-cohomological-specialization](#IG-5-tame-cohomological-specialization) | planned here or supplier adapter |
| PAPER-WOOD-19/136 | [IG.1/tame-tangential-fiber](#IG-1-tame-tangential-fiber), [IG.5/arithmetic-hurwitz-moduli](#IG-5-arithmetic-hurwitz-moduli) | planned here or supplier adapter |
| PAPER-WOOD-19/142 | [IG.4/marked-arithmetic-extensions](#IG-4-marked-arithmetic-extensions) | planned here or supplier adapter |
| PAPER-WOOD-19/144 | [IG.4/identity-root-invariant](#IG-4-identity-root-invariant) | planned here or supplier adapter |
| PAPER-WOOD-19/255 | [IG.3/stable-braid-classification](#IG-3-stable-braid-classification), [IG.3/braid-orbit-monoid](#IG-3-braid-orbit-monoid) | planned here or supplier adapter |
| PAPER-WOOD-19/257 | [IG.1/tame-tangential-fiber](#IG-1-tame-tangential-fiber) | planned here or supplier adapter |
| PAPER-WOOD-19/258 | [IG.5/tame-cohomological-specialization](#IG-5-tame-cohomological-specialization), [IG.1/tame-tangential-fiber](#IG-1-tame-tangential-fiber) | planned here or supplier adapter |
| PAPER-WOOD-19/259 | [IG.5/coefficient-tower-comparison](#IG-5-coefficient-tower-comparison) | planned here or supplier adapter |
| PAPER-WOOD-19/314 | [IG.5/finite-degree-component-bound](#IG-5-finite-degree-component-bound) | planned here or supplier adapter |
| PAPER-WOOD-19/315 | [IG.5/product-one-component-monoid](#IG-5-product-one-component-monoid) | planned here or supplier adapter |
| PAPER-WOOD-19/316 | [IG.5/product-one-component-monoid](#IG-5-product-one-component-monoid) | planned here or supplier adapter |
| PAPER-WOOD-19/317 | [IG.5/bounded-core-galois-reduction](#IG-5-bounded-core-galois-reduction) | planned here or supplier adapter |
| PAPER-WOOD-19/318 | [IG.5/bounded-core-galois-reduction](#IG-5-bounded-core-galois-reduction) | planned here or supplier adapter |
| PAPER-WOOD-19/319 | [IG.5/bounded-core-galois-reduction](#IG-5-bounded-core-galois-reduction) | planned here or supplier adapter |
| PAPER-WOOD-19/345 | [IG.5/arbitrary-monodromy-marked-moduli](#IG-5-arbitrary-monodromy-marked-moduli) | planned here or supplier adapter |

## Source corrections and version boundaries

The plan applies existing Wood/19 E2, E3 and E7, Kedlaya–Liu E94 and Chen E5 findings with their restricted conventions. It does not reassign their independent-review verdicts. The packet records the exact imported files and consuming nodes.

### InverseGaloisAndArithmeticFundamentalGroups/E1

misprint; Author working text, printed p.136 (physical p.148), sentence immediately before Definition 5.2.2

Issue, in our words: The explanatory sentence indexes the polynomials by r, the number of parameter variables, although the family has n polynomials.

Correction: The polynomial index ranges from 1 to n, not from 1 to r.

Reason: The page introduces n polynomials P₁,…,Pₙ and r parameter variables. Irreducibility gives positive Y-degree for each of the n polynomials. The displayed Hilbert-set definition on the same page correctly uses n. The index was verified visually, not inferred from OCR.

Version/search boundary: 2026-09-27: current author-hosted V2-ArithRevDte-v2.pdf, exact hash in sourceVersions, still prints r. 2026-09-27: author institutional profile https://pro.univ-lille.fr/pierre-debes/ and indexed author teaching page; no correction for this index found. 2026-09-27: public search for Pierre Dèbes Arithmétique des revêtements de la droite errata 5.2.2; no matching erratum found. This report is scoped to the author working text, not a publisher edition.

### InverseGaloisAndArithmeticFundamentalGroups/E2

misprint; §3.2.1: arXiv1408.0859v1 PDF p.9 and v2 PDF p.11. Publisher PDF and author-hosted copy returned HTTP403; this finding is scoped to these preprints.

Issue, in our words: The example uses y^p−y=x^(−n), with x the affine-line coordinate and n positive prime to p, and describes the resulting covers as etale over the whole affine line.

Correction: With that affine coordinate use y^p−y=x^n. Alternatively keep x^(−n) on the punctured line, or use x as a parameter at infinity instead of the affine coordinate.

Reason: x^(−n) has a pole at x=0. The Artin–Schreier extension has nontrivial wild inertia there because the pole order is prime to p; it is not etale over that point. The corrected x^n equation has derivative −1 in y and defines an etale cover over the affine line, ramified at infinity. The exponent and affine-coordinate wording were also checked visually in v2 PDF p.11.

Version/search boundary: 2026-10-09: arXiv history has v1 (2014) and final v2 (2017); §3.2.1 of both still has the negative exponent. Exact hashes appear in sourceVersions. 2026-10-09: AMS DOI10.1090/bull/1594 record/PDF and Harbater institutional abhsurvey.pdf could not be served (HTTP403); no claim against the published version. 2026-10-09: public search for the paper title with errata and the authors’ institutional listings located no correction.

## Bibliography and inspected scope

These references identify the texts actually inspected. Printed page numbers are used where the source prints them; preprint PDF locators are marked explicitly and are not silently assigned publisher pagination. Hashes, access dates and version checks are in the packet. A source listed here is not a claim that every cited background proof was read. No restricted source file or source passage is reproduced.

<a id="source-debes"></a>
- **debes** — Pierre Dèbes, [Arithmétique des revêtements de la droite](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf). 303-page author-hosted working text V2-ArithRevDte-v2.pdf; PDF creation metadata 2024-05-16; accessed 2026-09-27. Inspected: §§5.2–5.4, printed pp.135–146 and 150–153, including the guarded specialization, Hilbert–Dörge and full-group arguments; Chapter9 not read..

<a id="source-mathlib-ratfunc"></a>
- **mathlib-ratfunc** — The Mathlib contributors, [Reduced rational functions and their evaluation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/RatFunc/AsPolynomial.lean). Pinned Mathlib source, Apache-2.0; read 2026-09-27. Inspected: AsPolynomial lines 22–88 and 108–211; Basic lines 880–920, 929–1005, 1040–1073. Evaluation is total but its ring laws have denominator hypotheses. The planned regular subring bundles precisely these hypotheses..

<a id="source-mathlib-polynomial"></a>
- **mathlib-polynomial** — The Mathlib contributors, [Polynomial coefficients, subring lifts and degree bounds](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Subring.lean). Pinned Mathlib source, Apache-2.0; read 2026-09-27. Inspected: Subring lines 27–93 in full; Lifts lines 28–93 as a duplicate-construction screen; Basic coefficient, support, extensionality and sum statements; Coeff coefficient-sum and product statements; Eval/Defs map and evaluation statements; Eval/Coeff lines 22–86; Degree/Defs leading coefficient and Degree/Operations degree tests; Degree/Lemmas lines 74–82..

<a id="source-mathlib-roots"></a>
- **mathlib-roots** — The Mathlib contributors, [Finitely many roots and finite-set avoidance](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Roots.lean). Pinned Mathlib source, Apache-2.0; read 2026-09-27. Inspected: Roots lines 106–157, including finite_setOfPred_isRoot; Data/Set/Finite/Basic lines 496–510 and 825–848..

<a id="source-harpaz-wittenberg"></a>
- **harpaz-wittenberg** — Yonatan Harpaz and Olivier Wittenberg, [The Massey vanishing conjecture for number fields](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf). Author final copy revised 9 December 2021, 33 pages, of Duke Mathematical Journal 172 (2023), 1–41, DOI 10.1215/00127094-2022-0004; not publisher pagination. Inspected: Physical/printed author-copy pp.28–31, using the matching stored source after the author host failed DNS resolution. Lemma 7.6 and its proof, the degree-64 field construction in Lemma 7.7, the Grunwald–Wang consequence on p.30 and the final duality step on p.31. These support the six retained IG.4 source obligations, not the IG.2 component. The rest of the paper was not read for this checkpoint..

<a id="source-sga1"></a>
- **sga1** — A. Grothendieck and M. Raynaud, [Revêtements étales et groupe fondamental (SGA 1)](https://arxiv.org/pdf/math/0206203v2). Recomposed 2003 edition, arXiv math/0206203v2. Inspected: Exposé V §§4–8, printed pp.97–118; IX §§5–6 pp.189–197; X §§3.6–3.9 pp.214–217 and Corollary1.8 p.204; XII §§4.6–5.2 pp.251–253; XIII §§2.1–2.4 pp.280–285 and §§2.10–2.12 pp.289–290. These selected arguments were inspected; this is not a reading of the whole volume..

<a id="source-bhatt-scholze"></a>
- **bhatt-scholze** — B. Bhatt and P. Scholze, [The pro-étale topology for schemes](https://arxiv.org/pdf/1309.1198v2). arXiv:1309.1198v2, 72 PDF pages. Inspected: §§7.1–7.4, PDF pp.63–71.

<a id="source-evw"></a>
- **evw** — J. Ellenberg, A. Venkatesh and C. Westerland, [Homological stability for Hurwitz spaces and the Cohen–Lenstra conjecture over function fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf). Annals of Mathematics 183 (2016), 729–786. Inspected: §§2.1–2.4, pp.736–741; §§7.1–7.9, pp.764–772.

<a id="source-chen"></a>
- **chen** — W. Y. Chen, [Nonabelian level structures, Nielsen equivalence, and Markoff triples](https://arxiv.org/pdf/2011.12940v2). arXiv:2011.12940v2; locators refer to this preprint, not the published pagination. Inspected: §1.1 pp.3–5; §1.4 p.11; §§2.1,2.4,2.5 pp.13–15,22–30; §4.2 p.46.

<a id="source-landesman-litt"></a>
- **landesman-litt** — A. Landesman and D. Litt, [Canonical representations of surface groups](https://arxiv.org/pdf/2205.15352v4). arXiv:2205.15352v4, 23 February 2025. Inspected: Lemma2.3.3 p.16; §7.3 p.37; §9.1 pp.45–47.

<a id="source-kedlaya-liu"></a>
- **kedlaya-liu** — K. S. Kedlaya and R. Liu, [Relative p-adic Hodge theory: foundations](https://arxiv.org/pdf/1301.0792v5). arXiv:1301.0792v5. Inspected: §1.2 p.13; §1.4 pp.20–23.

<a id="source-lwzb"></a>
- **lwzb** — Y. Liu, M. Matchett Wood and D. Zureick-Brown, [A predicted distribution for Galois groups of maximal unramified extensions](https://arxiv.org/pdf/1907.05002v2). arXiv:1907.05002v2. Inspected: §2 pp.10–13; §§10–12 pp.38–55.

<a id="source-wood"></a>
- **wood** — M. Matchett Wood, [Nonabelian Cohen–Lenstra moments](https://par.nsf.gov/servlets/purl/10152050). Duke Mathematical Journal168 (2019), 377–427, published NSF copy. Inspected: §2 p.388; §3 pp.390–399; §4 pp.402–406.

<a id="source-wood21"></a>
- **wood21** — M. Matchett Wood, [An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf). Research in the Mathematical Sciences8 (2021), author copy, 13 pages. Inspected: Entire paper, especially Theorem3.1 pp.4–6; Theorem5.3 and Remark5.4 pp.10–12.

<a id="source-harpaz-wittenberg20"></a>
- **harpaz-wittenberg20** — Y. Harpaz and O. Wittenberg, [Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://arxiv.org/pdf/1802.09605v2). arXiv:1802.09605v2. Inspected: Introduction pp.3–6; §§3–4 pp.13–17; Remark7.11 pp.28–29.

<a id="source-harpaz-wittenberg23"></a>
- **harpaz-wittenberg23** — Y. Harpaz and O. Wittenberg, [The Massey vanishing conjecture for number fields](https://arxiv.org/pdf/1904.06512v2). arXiv:1904.06512v2. Inspected: §7, Lemma7.6 and final argument, pp.28–31.

<a id="source-merkurjev-scavia"></a>
- **merkurjev-scavia** — A. Merkurjev and F. Scavia, [Galois representations modulo p that do not lift modulo p²](https://arxiv.org/pdf/2410.12560v1). arXiv:2410.12560v1; locators refer to this preprint. Inspected: §1.2 pp.1–2; Proposition2.1 p.5; Lemma3.2 pp.8–9.

<a id="source-masser-zannier"></a>
- **masser-zannier** — D. Masser and U. Zannier, [Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf). Annals of Mathematics191 (2020), 635–674. Inspected: Proof of Lemma5.1 p.659.

<a id="source-schroer"></a>
- **schroer** — S. Schröer, [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3). arXiv:2004.07025v3. Inspected: Proposition5.5, PDF p.15.

<a id="source-caraiani-scholze"></a>
- **caraiani-scholze** — A. Caraiani and P. Scholze, [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Annals of Mathematics186 (2017), 649–766. Inspected: Proposition1.13 and Remark1.14 pp.656–657; Remark4.3.14 p.721.

<a id="source-seguin"></a>
- **seguin** — B. Seguin, [Fields of definition of components of Hurwitz spaces](https://beranger-seguin.fr/assets/pdf/articles/fielddef.pdf). Author PDF, 25 pages. Inspected: §§2.2–2.3 pp.4–9; Theorem3.3 pp.11–13; Proposition6.1 pp.23–25.

<a id="source-romagny-wewers"></a>
- **romagny-wewers** — M. Romagny and S. Wewers, [Hurwitz spaces](https://imag.umontpellier.fr/~romagny/articles/hurwitz_spaces.pdf). Groupes de Galois arithmétiques et différentiels, Séminaires et Congrès13 (2006), 313–341. Inspected: §4, pp.323–331.

<a id="source-schmidt-stix"></a>
- **schmidt-stix** — A. Schmidt and J. Stix, [Anabelian geometry with étale homotopy types](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf). Annals of Mathematics184 (2016), 817–868. Inspected: Theorem7.1 and proof, p.850.

<a id="source-evw12"></a>
- **evw12** — J. Ellenberg, A. Venkatesh and C. Westerland, [Homological stability and the Cohen–Lenstra conjecture over function fields, II](https://arxiv.org/pdf/1212.0923v1). arXiv:1212.0923v1; withdrawn paper; used only for explicitly checked geometric constructions, never its counting assertions. Inspected: §8.2.2 pp.42–43; Proposition8.7.1 proof pp.52–54.

<a id="source-gao-habegger"></a>
- **gao-habegger** — Z. Gao and P. Habegger, [Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/pdf/1801.05762v3). arXiv:1801.05762v3. Inspected: LemmaB.2 and proof, p.58.

<a id="source-emsalem"></a>
- **emsalem** — M. Emsalem, [Familles de revêtements de la droite projective](https://www.numdam.org/item/10.24033/bsmf.2250.pdf). Bulletin de la Société Mathématique de France123 (1995), 47–85. Inspected: Théorème3, pp.62–64.

<a id="source-cau"></a>
- **cau** — A. Cau, [Fields of moduli of isolated components of Hurwitz spaces](https://www.numdam.org/item/10.5802/jtnb.811.pdf). Journal de Théorie des Nombres de Bordeaux24 (2012), 557–583. Inspected: Théorème3.2, pp.569–570.

<a id="source-debes-douai"></a>
- **debes-douai** — P. Dèbes and J.-C. Douai, [Algebraic covers: field of moduli versus field of definition](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/A19-DebesDouai1FMvsFD.pdf). Annales scientifiques de l’École Normale Supérieure30 (1997), 303–338. Inspected: Field-of-moduli obstruction discussion; pp.303–310.

<a id="source-kanev"></a>
- **kanev** — V. Kanev, [Hurwitz moduli varieties parameterizing pointed covers of an algebraic curve](https://arxiv.org/pdf/2403.12756v2). arXiv:2403.12756v2. Inspected: Theorems4.13 and4.17, PDF pp.20–22; beginning of proof only.

<a id="source-bcdt"></a>
- **bcdt** — C. Breuil, B. Conrad, F. Diamond and R. Taylor, [On the modularity of elliptic curves over Q: wild 3-adic exercises](https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf). Author final copy corresponding to JAMS14 (2001), 843–939. Inspected: Theorem2.2.1 proof, author PDF p.19 / published p.864.

<a id="source-dlan"></a>
- **dlan** — C. Demarche, G. Lucchini Arteche and D. Neftin, [Approximation faible et principe local-global pour les espaces homogènes à stabilisateur fini résoluble](https://www.numdam.org/item/10.5802/aif.3104.pdf). Annales de l’Institut Fourier67 (2017), 1009–1040. Inspected: §2, Propositions2.2/2.4/2.5 and Lemma2.6, pp.1015–1019.

<a id="source-serre"></a>
- **serre** — J.-P. Serre, [Topics in Galois Theory](https://indico.math.cnrs.fr/event/11410/attachments/4760/7351/SerreTopicsGaloisTheory.pdf). Second edition, 2008. Inspected: §§1.1–1.2 pp.1–4; §§3.1–3.6 pp.19–33 (including §3.5.3 auxiliary-place thin-set argument); §§7.1–7.3 pp.65–71; §8.1 pp.81–83; §9.2 pp.88–91..

<a id="source-mw"></a>
- **mw** — D. McCullough and M. Wanderley, [Nielsen equivalence of generating pairs of SL(2,q)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/12B5FCFADCAFE740B31DEE5BB112DB85/S0017089512000675a.pdf/nielsen_equivalence_of_generating_pairs_of_sl2q.pdf). Glasgow Mathematical Journal55 (2013), 481–509. Inspected: §§1–5 pp.481–489; T-system conjecture §4 p.487.

<a id="source-hh"></a>
- **hh** — D. Harbater and J. Hartmann, [Patching over Fields](https://arxiv.org/pdf/0710.1392v1). arXiv:0710.1392v1 download; PDF header 26 January 2023; use the recorded hash. Inspected: §2 pp.2–4; §§4–5 pp.9–14; §7 pp.21–23.

<a id="source-hops"></a>
- **hops** — D. Harbater, A. Obus, R. Pries and K. Stevenson, [Abhyankar’s conjectures in Galois theory](https://arxiv.org/pdf/1408.0859v1). arXiv:1408.0859v1. Inspected: §§3.1–3.3 pp.7–14; Conjecture3.2 p.8; Theorems3.6/3.8/3.11/3.13 pp.10–13.

<a id="source-schmidt-wingberg"></a>
- **schmidt-wingberg** — A. Schmidt and K. Wingberg, [Safarevic’s theorem on solvable Galois groups](https://arxiv.org/pdf/math/9809211v1). arXiv:math/9809211v1, 34 pages. Inspected: Introduction pp.1–2; Propositions5–7 pp.6–9; Proposition11 p.11; Theorem13 and proof pp.13–20; Theorem15 and final induction pp.30–34..

<a id="source-wewers-fmfd"></a>
- **wewers-fmfd** — S. Wewers, [Field of moduli and field of definition of Galois covers](https://arxiv.org/pdf/math/0108003v1). arXiv:math/0108003v1. Inspected: §1, Definitions1.1/1.4; Propositions1.2/1.5/1.8; Theorem1.9; Example1.10, pp.4–9.

<a id="source-hops-v2"></a>
- **hops-v2** — D. Harbater, A. Obus, R. Pries and K. Stevenson, [Abhyankar’s conjectures in Galois theory: Current status and future directions](https://arxiv.org/pdf/1408.0859v2). arXiv:1408.0859v2, 16 July 2017; inspected §3.2.1 only. Inspected: §3.2.1, PDF p.11; the whole v2 paper was not read.

## Implemented baseline interfaces

These references supply only the statements recorded here; broader reductions remain in the corresponding node proof routes.

- mathlib:Subring — Native subring with inherited ring operations; no private ring carrier. Source module: Mathlib/Algebra/Ring/Subring/Defs.lean.
- mathlib:Subring.subtype — The inclusion ring map from a native subring. Source module: Mathlib/Algebra/Ring/Subring/Defs.lean.
- mathlib:RingHom — Native bundled ring homomorphisms. Source module: Mathlib/Algebra/Ring/Hom/Defs.lean.
- mathlib:RatFunc.eval — Total evaluation of reduced numerator divided by reduced denominator; at a pole its field value is zero. Source module: Mathlib/FieldTheory/RatFunc/AsPolynomial.lean.
- mathlib:RatFunc.eval_zero — Native evaluation sends zero to zero. Source module: Mathlib/FieldTheory/RatFunc/AsPolynomial.lean.
- mathlib:RatFunc.eval_one — Native evaluation sends one to one. Source module: Mathlib/FieldTheory/RatFunc/AsPolynomial.lean.
- mathlib:RatFunc.eval_C — Native evaluation of a constant rational function. Source module: Mathlib/FieldTheory/RatFunc/AsPolynomial.lean.
- mathlib:RatFunc.eval_X — Native evaluation of the parameter. Source module: Mathlib/FieldTheory/RatFunc/AsPolynomial.lean.
- mathlib:RatFunc.eval_add — Addition law requires both evaluated denominators nonzero. Source module: Mathlib/FieldTheory/RatFunc/AsPolynomial.lean.
- mathlib:RatFunc.eval_mul — Multiplication law requires both evaluated denominators nonzero. Source module: Mathlib/FieldTheory/RatFunc/AsPolynomial.lean.
- mathlib:RatFunc.eval_algebraMap — Evaluation of the image of a polynomial agrees with polynomial evaluation. Source module: Mathlib/FieldTheory/RatFunc/AsPolynomial.lean.
- mathlib:RatFunc.denom — Monic reduced denominator in K[T]. Source module: Mathlib/FieldTheory/RatFunc/Basic.lean.
- mathlib:RatFunc.num — Corresponding normalized numerator in K[T]. Source module: Mathlib/FieldTheory/RatFunc/Basic.lean.
- mathlib:RatFunc.denom_ne_zero — Every reduced denominator is nonzero, including the denominator of zero. Source module: Mathlib/FieldTheory/RatFunc/Basic.lean.
- mathlib:RatFunc.denom_zero — The reduced denominator of zero is one. Source module: Mathlib/FieldTheory/RatFunc/Basic.lean.
- mathlib:RatFunc.denom_one — The reduced denominator of one is one. Source module: Mathlib/FieldTheory/RatFunc/Basic.lean.
- mathlib:RatFunc.denom_algebraMap — Every polynomial has reduced denominator one. Source module: Mathlib/FieldTheory/RatFunc/Basic.lean.
- mathlib:RatFunc.denom_dvd — A nonzero polynomial q is divisible by the reduced denominator exactly when a fraction with denominator q represents the rational function. Source module: Mathlib/FieldTheory/RatFunc/Basic.lean.
- mathlib:RatFunc.denom_add_dvd — The denominator of a sum divides the product of the input denominators. Source module: Mathlib/FieldTheory/RatFunc/Basic.lean.
- mathlib:RatFunc.denom_mul_dvd — The denominator of a product divides the product of the input denominators. Source module: Mathlib/FieldTheory/RatFunc/Basic.lean.
- mathlib:RatFunc.num_div_denom — The normalized fraction represents its rational function. Source module: Mathlib/FieldTheory/RatFunc/Basic.lean.
- mathlib:RatFunc.num_ne_zero — A nonzero rational function has nonzero numerator. Source module: Mathlib/FieldTheory/RatFunc/Basic.lean.
- mathlib:Polynomial.sum — Finite summation over nonzero coefficients. Source module: Mathlib/Algebra/Polynomial/Basic.lean.
- mathlib:Polynomial.coeff_sum — Coefficient extraction commutes with polynomial coefficient sums. Source module: Mathlib/Algebra/Polynomial/Coeff.lean.
- mathlib:Polynomial.coeff_monomial — The coefficient formula for a monomial. Source module: Mathlib/Algebra/Polynomial/Basic.lean.
- mathlib:Polynomial.mem_support_iff — Polynomial support consists exactly of the nonzero coefficient indices. Source module: Mathlib/Algebra/Polynomial/Basic.lean.
- mathlib:Polynomial.ext — Polynomials are determined by their coefficients. Source module: Mathlib/Algebra/Polynomial/Basic.lean.
- mathlib:Polynomial.map — Native polynomial change of coefficients along a ring map. Source module: Mathlib/Algebra/Polynomial/Eval/Defs.lean.
- mathlib:Polynomial.coeff_map — Coefficient formula for change of coefficients. Source module: Mathlib/Algebra/Polynomial/Eval/Coeff.lean.
- mathlib:Polynomial.map_add — Change of coefficients preserves addition. Source module: Mathlib/Algebra/Polynomial/Eval/Defs.lean.
- mathlib:Polynomial.map_mul — Change of coefficients preserves multiplication. Source module: Mathlib/Algebra/Polynomial/Eval/Defs.lean.
- mathlib:Polynomial.evalRingHom — Polynomial evaluation as a ring homomorphism. Source module: Mathlib/Algebra/Polynomial/Eval/Defs.lean.
- mathlib:Polynomial.toSubring — A polynomial whose coefficients lie in a native subring is already liftable to a polynomial over that subring. Source module: Mathlib/RingTheory/Polynomial/Subring.lean.
- mathlib:Polynomial.map_toSubring — Mapping the native subring lift back recovers the original polynomial. Source module: Mathlib/RingTheory/Polynomial/Subring.lean.
- mathlib:Polynomial.eval_prod — Evaluation of a finite product is the product of evaluations. Source module: Mathlib/Algebra/Polynomial/Eval/Defs.lean.
- mathlib:Polynomial.leadingCoeff_ne_zero — The leading coefficient is nonzero exactly for nonzero polynomials. Source module: Mathlib/Algebra/Polynomial/Degree/Defs.lean.
- mathlib:Polynomial.coeff_eq_zero_of_natDegree_lt — Coefficients above natural degree vanish. Source module: Mathlib/Algebra/Polynomial/Degree/Operations.lean.
- mathlib:Polynomial.natDegree_le_iff_coeff_eq_zero — Natural-degree upper bounds characterized by high coefficients. Source module: Mathlib/Algebra/Polynomial/Degree/Lemmas.lean.
- mathlib:Polynomial.natDegree_eq_of_le_of_coeff_ne_zero — A degree upper bound is exact if its top coefficient is nonzero. Source module: Mathlib/Algebra/Polynomial/Degree/Operations.lean.
- mathlib:Polynomial.finite_setOfPred_isRoot — A nonzero polynomial over a domain has finitely many roots. Source module: Mathlib/Algebra/Polynomial/Roots.lean.
- mathlib:Set.Finite.subset — A subset of a finite set is finite. Source module: Mathlib/Data/Set/Finite/Basic.lean.
- mathlib:Set.Finite.union — A union of two finite sets is finite. Source module: Mathlib/Data/Set/Finite/Basic.lean.
- mathlib:Set.Finite.exists_notMem — An infinite type has an element outside any finite set. Source module: Mathlib/Data/Set/Finite/Basic.lean.
- mathlib:Subgroup — Native subgroup carrier and inherited group operations. Source module: Mathlib/Algebra/Group/Subgroup/Defs.lean.
- mathlib:FreeGroup — Native free group on a generator type, with its universal homomorphism lift. Source module: Mathlib/GroupTheory/FreeGroup/Basic.lean.
- mathlib:IntermediateField — Native intermediate fields with the inherited algebra structure. Source module: Mathlib/FieldTheory/IntermediateField/Basic.lean.
- mathlib:IsGalois — Separable and normal field extension, without a finite-degree assumption built into the class. Source module: Mathlib/FieldTheory/Galois/Basic.lean.
- mathlib:IsGalois.card_aut_eq_finrank — For a finite-dimensional Galois extension, the automorphism group cardinality equals the extension degree. Source module: Mathlib/FieldTheory/Galois/Basic.lean.
- mathlib:IsGalois.normalAutEquivQuotient — For a normal subgroup of a finite Galois group, the quotient is isomorphic to the Galois group of its fixed field. Source module: Mathlib/FieldTheory/Galois/Basic.lean.
- mathlib:IsGalois.of_separable_splitting_field — A splitting field of a separable polynomial is a Galois extension. Source module: Mathlib/FieldTheory/Galois/Basic.lean.
- mathlib:Polynomial.SplittingField — Native splitting field of a polynomial, with its canonical algebra structure. Source module: Mathlib/FieldTheory/SplittingField/Construction.lean.
- tauceti:TauCeti.BraidGroup — Artin braid group with generator, far-commutativity and braid relations, and universal homomorphism lift. Source module: TauCeti/GroupTheory/SpecificGroups/Braid.lean.
- mathlib:NumberField.finrank_eq_one_of_unramified — An integral closure of Z in a number field which is unramified over Z forces rational degree one. Source module: Mathlib/NumberTheory/NumberField/ExistsRamified.lean.
- mathlib:CommAlgCat.FiniteEtale — Native full subcategory of commutative R-algebras with finite and etale structure. Source module: Mathlib/RingTheory/Etale/Finite.lean.
- mathlib:CategoryTheory.GaloisCategory — Native Galois-category axioms; scheme instances still have to be established. Source module: Mathlib/CategoryTheory/Galois/Basic.lean.
- mathlib:CategoryTheory.PreGaloisCategory.FiberFunctor — Native exact finite-set fiber-functor axioms. Source module: Mathlib/CategoryTheory/Galois/Basic.lean.
- mathlib:CategoryTheory.PreGaloisCategory.functorToContAction — The native Galois reconstruction functor is an equivalence for the stated category and fiber functor hypotheses. Source module: Mathlib/CategoryTheory/Galois/Equivalence.lean.
- mathlib:Subgroup.exists_right_complement'_of_coprime — A normal subgroup of coprime cardinality and index has a complement; this declaration does not assert complement conjugacy. Source module: Mathlib/GroupTheory/SchurZassenhaus.lean.
- mathlib:AlgebraicTopology.singularChainComplexFunctor — The singular-chain functor with a preadditive coefficient category and coproducts. Source module: Mathlib/AlgebraicTopology/SingularHomology/Basic.lean.
- mathlib:AlgebraicTopology.singularHomologyFunctor — Singular homology after the additional CategoryWithHomology assumption. Source module: Mathlib/AlgebraicTopology/SingularHomology/Basic.lean.
- mathlib:MonoidAlgebra — The native finitely supported monoid-algebra carrier and convolution product. Source module: Mathlib/Algebra/MonoidAlgebra/Defs.lean.
- mathlib:AlgebraicGeometry.Etale — The native etale morphism predicate, with pullback instances and the Scheme.Etale category. Source module: Mathlib/AlgebraicGeometry/Morphisms/Etale.lean.
- mathlib:AlgebraicGeometry.IsFinite — The native finite scheme morphism predicate, which includes affine morphisms. Source module: Mathlib/AlgebraicGeometry/Morphisms/Finite.lean.
- mathlib:AlgebraicGeometry.Scheme.Etale — The native category of all etale schemes over X; the finite subcategory is the new interface here. Source module: Mathlib/AlgebraicGeometry/Morphisms/Etale.lean.
- mathlib:frattini — Intersection of maximal subgroups; a finite discrete group specialization is native. Source module: Mathlib/GroupTheory/Frattini.lean.
- mathlib:Group.IsNilpotent — Nilpotence by termination of the upper central series. Source module: Mathlib/GroupTheory/Nilpotent.lean.
- mathlib:Group.IsSolvable — Solvability by termination of the derived series, with the current namespaced class. Source module: Mathlib/GroupTheory/Solvable.lean.

## Signature inventory

The suggested file enumerates every target, API and test by name. Its native declarations elaborate, but missing scheme, stack, continuous cohomology, arithmetic place and coefficient-tower declarations are whole omissions. The packet’s signatureCoverage ledger records the typed names and exact omitted API/test names per node. A typed native special case never replaces the broader mathematical target.
