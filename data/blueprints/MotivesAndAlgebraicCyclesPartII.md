# Algebraic cycles, pure and mixed motives, Part II: Berkovich motives

Construct a theory of integral étale motivic sheaves for Banach rings, archimedean and nonarchimedean, and extend it to small arc-stacks. The central objects are finitary derived arc-sheaves, their ball-invariant subcategory, and its Tate stabilization. The targets include cancellation over arbitrary small arc-stacks, the rational Adams decomposition of motivic K-theory, stable six operations and rigidity, comparison with algebraic étale motives over algebraically closed discrete fields, and a nearby-cycle description by locally nilpotent monodromy over a completed Laurent-series algebraic closure.

This is a continuation of `MotivesAndAlgebraicCycles`. Its parent supplies algebraic motivic input within its existing range. The enhanced integral étale category needed for the discrete-field comparison is constructed explicitly in BM.10. The Banach arc-topology, effective and stable motivic categories, and their comparison maps belong here. Banach spectra, Berkovich analytic geometry, general enhanced-category infrastructure, ordinary Jacobians and the diamond étale formalism keep their existing owners. The detailed interfaces are specified after the layers.

## Conventions and library interface

All rings are commutative and unital. Banach-ring maps are contractive. Completed tensor products and completed filtered colimits use the Banach category imported from `TropicalAndBerkovichArithmetic:TB.0`. The spectrum M(A) is the Berkovich spectrum. Marc(A) denotes the **arc-sheafification** of its representable; the entire Banach arc-site is not assumed subcanonical. A geometric Banach point uses a nondiscrete algebraically closed complete valued field. Discrete fields in BM.10 have the trivial norm. “Strict” abbreviates “strictly totally disconnected” in the sense of BM.0, including the residue-field condition.

Choose a universe and an uncountable regular cardinal cutoff κ before constructing the sites. Category-valued descent, slices, tensor products and changes of cutoff are enhanced constructions. D(Z) denotes the stable infinity-category of complexes of abelian groups; statements involving it retain the enhancement. Dfin is formed from hypercomplete derived arc-sheaves. Left completion and derived inverse limits are part of the conventions. The ordinary triangulated derived category appears only through the homotopy-category compatibility check.

For the discrete-field mapping formula the normalization is Map(M(X)(−j),Z)_Q≃K(X)_Q^(j)[−2j], so π_i=K_{i+2j}(X)_Q^(j). This follows from the Tate convention and is checked on P¹ in BM.10.

Use cohomological shifts: an abelian group placed in degree zero and shifted by [−1] lies in degree one. The effective Tate object is the reduced free G_m motive shifted by [−1]. It is Z at the usual complex point, the sign object at the real point, and Gbar_m[−1] on the nonarchimedean locus. Negative Tate powers are introduced by stabilization. Kmot is spectrum-valued integrally; its rational Tate decomposition lives in the rational linear category. For a residue field of characteristic zero the residue-characteristic exponent is p=1; otherwise it is its characteristic prime. Prime inversion and derived prime-to-p completion always name this exponent.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Three existing declarations are used directly:

| Existing declaration | Interface used |
| --- | --- |
| `mathlib:NormedField` | The field/norm carrier of the light BM.3 predicate. |
| `mathlib:IsUltrametricDist` | The strong metric triangle inequality for its subgroup and norm-one laws. |
| `mathlib:CategoryTheory.GrothendieckTopology` | Sieve topology axioms for the Banach arc-site; the enhanced sheaf category is supplied separately. |

The existing derived, condensed, quasi-categorical and abelian-variety structures are inputs to their owners. They do not already furnish the presentable stable motivic infinity-categories in this roadmap. Current Tau Ceti and the current upstream roadmaps are also checked before introducing a carrier. The suggested file prototypes the BM.3 field predicate and its API over the existing normed-field carriers. The constructions whose carriers require the other layers are mathematical targets in this definitive document.

## Layer order

BM.0–BM.6 build the arc-site, effective categories, Tate theory and rational K-theory. BM.7 and BM.8 are independent branches from these foundations: the K-cofiber calculations and the stable six-functor construction. BM.9 establishes rigidity; BM.10 combines it with the K branch for discrete fields. BM.11 builds nearby cycles and the explicit monodromy model. BM.12 branches from the stable rigidity and torsion comparisons to the v-stack interface. Each target below gives its direct prerequisites. Internal names link to targets; external names are exact packet nodes or supplier stages.

| Layer | Mathematical output |
| --- | --- |
| BM.0 | The Banach arc-site |
| BM.1 | Finitary sheaves and proper base change |
| BM.2 | Effective motives and ball localization |
| BM.3 | Reduced units and the Tate object |
| BM.4 | Transfers and geometric-point comparisons |
| BM.5 | Cancellation over every small arc-stack |
| BM.6 | Motivic K-theory and Adams weights |
| BM.7 | The K-theory of one-units |
| BM.8 | Stable motives and six operations |
| BM.9 | Rigidity and mixed Tate sheaves |
| BM.10 | Integral algebraic étale motives |
| BM.11 | Nearby cycles and motivic monodromy |
| BM.12 | The v-stack and overconvergent comparison |

The targets below specify the constructions and their proof routes. Each definition or construction has a user API, three discriminating checks and its consuming uses. Additional acceptance conditions record what establishes a theorem, including the coefficient and enhanced-structure constraints.

## BM.0 — The Banach arc-site

Construct the finite-surjectivity arc-site, small arc-stacks, its strictly totally disconnected basis and quasi-pro-étale maps. Prove repleteness and seminormed compact assembly; import the Banach and Berkovich toolkit.

**Worked example.** Let A=C×C with the maximum norm and the usual complex absolute value. Its spectrum consists of two points. The two projections A→C induce inclusions of these two points; together they form an arc-cover. Either projection alone misses one point. Both factors are strictly totally disconnected, and the product is again strict. Replacing this finite product by a bounded product indexed by an infinite set introduces the ultrafilter points of βI. Checking only the principal points then fails to describe the spectrum. The zero-ring check is different: its empty spectrum admits the empty covering family.

<a id="seminormed-assembly"></a>

### Compact assembly of seminormed rings

**Theorem — `BM.0/seminormed-assembly`.** The category of commutative unital seminormed rings and contractive maps has filtered colimits commuting with finite limits and is generated under colimits by objects admitting a sequential presentation along weakly compact maps; hence it is compactly assembled. A map f:X→Y is weakly compact when every Y→colim_i Z_i factors after composition with f through some Z_i. This assertion is not made for complete Banach rings.

**Hypotheses and conventions.** Seminorms may vanish identically; the zero ring is allowed. Use the nonstable definition of compact assembly and a fixed universe.

**Construction or proof.**

1. Import the nonstable compact-assembly criterion requested from E5. Express a free generator of radius r as the colimit of radii r′>r; contraction of radii gives weakly compact transition maps.
2. Present arbitrary seminormed rings by free rings and impose relations by finite limits/colimits; verify filtered colimits commute with the finite limits in this category. Completion is a separate functor, so the argument does not assert compact assembly after completion.

**Acceptance.** Verify the lifting condition is imposed on the composite from X, not on Y. The Banach completion functor must not be used to transfer the conclusion without proof. Check generation under colimits by sequential weakly compact presentations; do not require every object itself to have such a presentation.

**Direct prerequisites.** `TropicalAndBerkovichArithmetic:TB.0/banach-ring-category`, `EnhancedDerivedSheaves:E5:presentability`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §2.1, Definition 2.7, Remark 2.8, Proposition 2.9, pp. 9–10. The radius-shrinking presentation supplies compact assembly in the seminormed category.

**Atlas planet:** Seminormed compact assembly.

<a id="arc-site"></a>

### Banach arc-topology

**Definition — `BM.0/arc-site`.** On the opposite category of Banach rings, a family {A→B_i} covers exactly when a finite subfamily induces a surjection ⨿ M(B_i)→M(A). Let Marc(A) be the arc-sheafification of its representable presheaf. A small arc-stack is a sheaf of spaces admitting a presentation as a small colimit of these representables at some uncountable regular cardinal cutoff κ; identify the compatible enlargements of κ.

**Hypotheses and conventions.** All ring morphisms are contractive and completed tensor products are the categorical pushouts. Choose a universe and a regular uncountable κ large enough for the presentation.

**Uses.** BM.1 and BM.2: Defines the common descent site and bases of the sheaf categories. BM.12: Distinguishes the Banach arc-site from the scheme arc-site and the v-site.

**API.**

- `arc_cover_pullback` (functoriality): A cover remains a cover after any Banach-ring base change.
- `arc_cover_field_test` (characterisation): A family covers iff some finite subfamily has the geometric-point lifting property.
- `marc_sheafification` (universal-property): Marc carries completed pushouts to fibre products and has the stated sheafification universal property.

**Checks.**

- **Check `zero_ring`** (degenerate): The empty family covers the zero ring because its spectrum is empty. Arrows A→0 do not cover a nonzero A.
- **Check `finite_subcover`** (non-example): A jointly surjective infinite family without a finite jointly surjective subfamily is not declared a cover.
- **Check `uniformization`** (compatibility): A→A^u gives an isomorphism of Marc objects even when it is not an isomorphism of rings.

**Construction or proof.**

1. Use TB spectra of pushouts to show pullback stability of finite spectral surjectivity, and compose finite covers.
2. Apply the existing GrothendieckTopology carrier to the generated sieves, and the requested enhanced sheaf machinery to sheafify representables. Show the change-of-cutoff functors agree on κ-small objects.

**Acceptance.** Prove equivalence with lifting a geometric Banach-field point after a field extension. Do not identify Marc(A)(B) with contractive ring maps on the entire site.

**Direct prerequisites.** `TropicalAndBerkovichArithmetic:TB.0/banach-ring-category`, `TropicalAndBerkovichArithmetic:TB.0/contractive-colimits`, `TropicalAndBerkovichArithmetic:TB.0/completed-residue-fields`, `mathlib:CategoryTheory.GrothendieckTopology`, `EnhancedDerivedSheaves:E0`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §3, Definition 3.1, Propositions 3.2–3.3, pp. 14–15. Finite jointly surjective spectra define the site; representables need sheafification.

**Atlas planet:** Banach arc-topology.

<a id="arc-examples"></a>

### Uniformization and geometric arc-covers

**Theorem — `BM.0/arc-examples`.** Analytic covers are arc-covers. Uniform completion induces Marc(A)≃Marc(A^u). The product of completed residue fields is an arc-cover. In characteristic p, the norm-corrected perfection is arc-equivalent. Over the complex numbers, the Gelfand transform identifies Marc(A) with the compact-Hausdorff space M(A) viewed as a condensed sheaf; over the reals retain complex conjugation.

**Hypotheses and conventions.** Use uniform completion and rescaled norms in perfection, not an algebraic perfection with arbitrary norm. The residue-field product uses bounded families with its product norm.

**Construction or proof.**

1. Check the geometric-field lifting criterion for each construction using the imported residue-field and Gelfand theorems.
2. Use spectral-radius equality to identify geometric maps through uniformization. For real rings descend the complex description with its involution.

**Acceptance.** The real case retains its involution. The product of residue fields is not asserted to have algebraically closed residues.

**Direct prerequisites.** [BM.0/arc-site](#arc-site), `TropicalAndBerkovichArithmetic:TB.0/gelfand-representation`, `TropicalAndBerkovichArithmetic:TB.0/uniform-unit-hierarchy`, `TropicalAndBerkovichArithmetic:TB.0/completed-residue-fields`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §3, Examples 3.4–3.8 and Proposition 3.9, pp. 15–16. The main examples explain what geometry the arc-sheafification retains.

<a id="strict-basis"></a>

### Strictly totally disconnected Banach rings

**Definition — `BM.0/strict-basis`.** A Banach ring A is strictly totally disconnected if it is analytic and uniform, M(A) is profinite, and each completed residue field is algebraically closed. Its associated arc-sheaf is the corresponding strictly totally disconnected affine object.

**Hypotheses and conventions.** Analytic means that a finite family of topologically nilpotent elements generates the unit ideal.

**Uses.** BM.1 finitary sheaves: The finitary condition is tested on this basis. BM.4 and BM.5: Free-motive evaluation and cancellation reduce to this basis.

**API.**

- `strict_clopen` (structure): Restriction to a clopen spectral subset is strictly totally disconnected.
- `strict_residue` (projection): At every spectral point the completed residue field is algebraically closed.
- `strict_products` (constructor): Finite products and the bounded product of nondiscrete algebraically closed Banach fields are strictly totally disconnected.

**Checks.**

- **Check `field`** (computation): A nondiscrete complete algebraically closed valued field is strictly totally disconnected.
- **Check `real_field`** (non-example): The usual real Banach field fails the residue algebraic-closure condition despite its singleton spectrum.
- **Check `ultrafilters`** (computation): For an infinite bounded product of such fields the spectrum is βI, and includes nonprincipal ultrafilters; it is not the discrete set I.

**Construction or proof.**

1. Combine the imported analytic/uniform predicates with the profinite spectrum and algebraically closed completed residue fields.
2. Keep the residue-field condition as part of the structure exposed by the API; a totally disconnected spectrum alone is insufficient.

**Acceptance.** Identify clopen restrictions and finite products with the same predicates.

**Direct prerequisites.** [BM.0/arc-site](#arc-site), `TropicalAndBerkovichArithmetic:TB.0/uniform-unit-hierarchy`, `TropicalAndBerkovichArithmetic:TB.0/completed-residue-fields`, `TropicalAndBerkovichArithmetic:TB.0/idempotents-and-clopens`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §3, Definition 3.10 and Proposition 3.11, pp. 16–17. Strict disconnectedness includes residue algebraic closure, analyticity and uniformity.

**Atlas planet:** Strictly totally disconnected rings.

<a id="strict-descent"></a>

### Strict basis and restricted subcanonicity

**Theorem — `BM.0/strict-descent`.** Every Banach ring has an arc-cover by a strictly totally disconnected ring. The arc-topology is subcanonical on the full strictly totally disconnected subcategory, and on perfectoid rings with |p|<1. This is restricted subcanonicity, not subcanonicity of the entire Banach site.

**Hypotheses and conventions.** In the perfectoid assertion p is a prime and the perfectoid norm convention is the imported one.

**Construction or proof.**

1. Choose algebraic closures of completed residue fields and use their bounded product to obtain the cover. Use the Banach-ultraproduct description to check all new residues are algebraically closed.
2. For strict rings reconstruct sections using profinite clopens; for perfectoids use the v-descent theorem imported from DiamondsAndVStacks.

**Acceptance.** Check the infinite product includes its ultraproduct points. A proof may not replace arc-sheafification globally by Yoneda.

**Direct prerequisites.** [BM.0/strict-basis](#strict-basis), [BM.0/arc-examples](#arc-examples), `DiamondsAndVStacks:D1`, `DiamondsAndVStacks:D2`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §3, Proposition 3.11, Corollary 3.12, Theorems 3.13–3.14, pp. 16–18. The strict basis covers the site and has effective representable descent.

**Atlas planet:** Strict basis descent.

<a id="quasi-pro-etale"></a>

### Quasi-pro-étale Banach maps

**Definition — `BM.0/quasi-pro-etale`.** A map A→B is quasi-pro-étale if for each geometric point A→C with C nondiscrete algebraically closed, the uniform completion of B⊗̂_A C is Cont(S,C) for a profinite set S. If both A and B are strictly totally disconnected, such maps A→B identify with profinite sets over M(A).

**Hypotheses and conventions.** Base change includes uniform completion; use continuous C-valued functions with the supremum norm.

**Uses.** BM.1 proper base change: Gives the scope of the finitary projection formula. BM.9 monadicity: Supplies the proper maps used for module-category descent.

**API.**

- `qproet_base_change` (functoriality): Quasi-pro-étale maps are stable under base change and composition.
- `qproet_strict_equivalence` (equivalence): For A strictly totally disconnected, the category of quasi-pro-étale A-algebras B that are also strictly totally disconnected is equivalent to profinite sets over M(A).
- `qproet_clopen` (compatibility): Clopen restrictions are quasi-pro-étale.

**Checks.**

- **Check `identity`** (degenerate): The identity corresponds to a one-point fibre.
- **Check `profinite_fibre`** (computation): For C nondiscrete algebraically closed and an infinite profinite S, Cont(S,C) is strictly totally disconnected and quasi-pro-étale over C, but need not be finite étale over C.
- **Check `ball_nonexample`** (non-example): A positive-dimensional closed ball over C is not quasi-pro-étale: its spectrum is not a profinite geometric fibre.

**Construction or proof.**

1. For both source and target strictly totally disconnected, use the strict-basis description and clopen gluing to construct the profinite-set equivalence.
2. Check the condition pointwise and prove stability under completed base change and composition.

**Acceptance.** Show analytic covers of strict bases are quasi-pro-étale.

**Direct prerequisites.** [BM.0/strict-descent](#strict-descent), `TropicalAndBerkovichArithmetic:TB.0/gelfand-representation`, `TropicalAndBerkovichArithmetic:TB.0/contractive-colimits`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §4, Definition 4.3 and Lemmas 4.4–4.6, pp. 19–20. The geometric fibre condition is profinite continuous functions, not finite étaleness.

**Atlas planet:** Quasi-pro-étale maps.

<a id="arc-replete"></a>

### Repleteness of the arc-topos

**Theorem — `BM.0/arc-replete`.** In the Banach arc-topos, inverse limits of countable towers of epimorphisms remain epimorphic. Consequently its hypercomplete space-valued sheaves are Postnikov complete by the requested Mondal–Reinecke theorem; do not infer the consequence solely from the abelian derived repleteness theorem.

**Hypotheses and conventions.** Countable inverse systems; preserve the chosen cardinal cutoff by enlargement when necessary.

**Construction or proof.**

1. On geometric field points lift a countable tower of covers successively to field extensions, and complete the directed union. The resulting extension provides a simultaneous lift.
2. Use the finite-subfamily criterion to promote local lifts to epimorphisms of sheaves. Apply precisely the general replete hypercomplete infinity-topos Postnikov theorem requested from E2.

**Acceptance.** Distinguish countable repleteness from a claim that all limits preserve epimorphisms. Record the E2 space-valued hypothesis; its existing derived-category statement alone is insufficient.

**Direct prerequisites.** [BM.0/arc-site](#arc-site), [BM.0/strict-descent](#strict-descent), `EnhancedDerivedSheaves:E2`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §4, proof of Theorem 4.20, p. 24; §3, geometric-point cover criterion, pp. 14–15. Proper base change uses repleteness of this site and the general Postnikov theorem.

## BM.1 — Finitary sheaves and proper base change

Construct finitary derived arc-sheaves and prove continuity, geometric-point and complex comparisons, finite-cohomological-dimension proper base change, finitary adjoints and excision.

**Worked example.** Take A=Cont([0,1],C), with its supremum norm. The complex comparison identifies Dfin(Marc(A),Z) with the left-completed derived category on [0,1]. For U=(0,1] and Z={0}, the localization triangle j_!Z_U→Z_[0,1]→i_*Z_Z has stalks 0→Z→Z at 0 and Z→Z→0 at a positive point. Thus the two restriction computations determine the extension-by-zero convention. The inclusion {0}→[0,1] is not open and is not a finitary injection. The identity of [0,1] is finitary, since its relative continuity square is cartesian regardless of any absolute continuity assertion.

<a id="finitary-descent"></a>

### Finitary strict-basis hypersheaf theorem

**Theorem — `BM.1/finitary-descent`.** Any space-valued functor on strictly totally disconnected Banach rings which preserves finite products and filtered colimits extends uniquely to a hypercomplete arc-sheaf. For abelian-group-valued such functors positive cohomology vanishes on strict bases. The same criterion applies to compactly assembled target categories with the required finite-limit compatibility.

**Hypotheses and conventions.** The colimits of rings are completed filtered colimits. For the generalized target use the exact compact-assembly hypotheses, not just presentability.

**Construction or proof.**

1. Extend n-truncated functors along quasi-pro-étale maps; Lemma 4.7 gives filtered continuity of this extension.
2. Prove the splitting lemma: an arc-cover of a strict base is a completed filtered colimit of split maps. Use seminormed compact assembly to reduce to finitely many approximate relations; a surjective open subset of affine space has a section by algebraic closure and clopen patching.
3. For each n commute the finite descent limit through the filtered colimit of split maps, then pass to the Postnikov limit. The abelian assertion follows from the same computation.

**Acceptance.** Check that the infinite totalization is handled after truncation, not exchanged with a filtered colimit without a bound.

**Direct prerequisites.** [BM.0/seminormed-assembly](#seminormed-assembly), [BM.0/quasi-pro-etale](#quasi-pro-etale), [BM.0/strict-descent](#strict-descent), `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E5:presentability`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §4, Theorem 4.1, Remark 4.2, Lemmas 4.7–4.9, pp. 19–22. Filtered split approximation and finite truncations establish hyperdescent.

**Atlas planet:** Finitary arc-descent.

<a id="finitary-category"></a>

### Finitary derived arc-sheaves

**Definition — `BM.1/finitary-category`.** Dfin(X,Z) is the full stable infinity-subcategory of derived hypercomplete abelian arc-sheaves whose restriction to strictly totally disconnected Banach rings over X commutes with filtered colimits. It is equivalently the category of finite-product- and filtered-colimit-preserving functors from this basis to D(Z).

**Hypotheses and conventions.** X is a small arc-stack. Use the enhanced derived category, rather than only its homotopy category.

**Uses.** BM.2 effective motives: Provides the category in which ball invariance is imposed. BM.7 K-theory: Its spectral counterpart hosts motivic K-theory.

**API.**

- `dfin_restriction` (equivalence): Restriction gives the stated basis-functor equivalence.
- `dfin_pullback_tensor` (functoriality): Derived pullbacks are symmetric monoidal and compose coherently.
- `dfin_truncations` (structure): The full subcategory is stable under colimits and truncations and is left complete.

**Checks.**

- **Check `strict_value`** (computation): At a strict base positive cohomology of a degree-zero finitary sheaf vanishes.
- **Check `bounded_continuity`** (compatibility): A bounded-below finitary object commutes with filtered colimits of arbitrary Banach algebras.
- **Check `complex_point`** (compatibility): At the usual complex point the homotopy category agrees with the unbounded derived category of abelian groups: the cohomology of Z[0] is Z in degree zero and zero in every other degree.

**Construction or proof.**

1. Apply the strict-basis hypersheaf criterion degreewise/enhanced to construct the restriction equivalence.
2. Compute colimits and truncations on the strict basis; this proves stability under both and left completeness. Tensor and pullback are the inherited derived operations.

**Acceptance.** For bounded-below objects extend continuity to all Banach rings. For unbounded objects require a uniform cohomological-dimension bound to make that extension.

**Direct prerequisites.** [BM.1/finitary-descent](#finitary-descent), `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §4, Definition 4.10, Remark 4.11, Propositions 4.12–4.13, pp. 22–23. Finitarity is imposed on the strict basis to control unbounded Postnikov limits.

**Atlas planet:** Finitary arc-sheaves.

<a id="geometric-comparisons"></a>

### Complex and geometric-point comparison

**Theorem — `BM.1/geometric-comparisons`.** For a complex Banach algebra A, Dfin(Marc(A),Z) is the left-completed derived category of sheaves on the compact Hausdorff space M(A). For every finitary object M, a nondiscrete Banach field K and completed algebraic closure C, M(K)≃M(C)^{hG_K}, with continuous Galois action. For M bounded below, the stalk at x of Rν_*M on M(A) equals M(K(x)).

**Hypotheses and conventions.** The Galois action uses continuous discrete modules inside the condensed/profinite action category. The stalk formula is stated for bounded-below finitary objects.

**Construction or proof.**

1. On strict complex bases identify the arc-site with profinite sets over M(A); finitary objects become ordinary sheaves, then descend.
2. Use the profinite Galois site to compute values at a Banach field. Extend bounded-below continuity to identify neighbourhood germs with the completed residue field.

**Acceptance.** Retain left completion. Over the complex point the category is D(Z); do not infer all complex-base effective motives equal all finitary sheaves.

**Direct prerequisites.** [BM.1/finitary-category](#finitary-category), [BM.0/arc-examples](#arc-examples), [BM.0/quasi-pro-etale](#quasi-pro-etale), `EnhancedDerivedSheaves:E2`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §4, Theorem 4.14, Propositions 4.15–4.16, pp. 23–24. Complex sheaves and continuous Galois cohomology give two computations of finitary objects.

**Atlas planet:** Geometric-point comparison.

<a id="finitary-maps"></a>

### Finitary maps and open immersions

**Definition — `BM.1/finitary-maps`.** A map f:Y→X is finitary if, for every completed filtered colimit A=colim A_i of strict rings, the square colim Y(A_i)→Y(A) over colim X(A_i)→X(A) is cartesian. An open immersion is a map whose pullback to every Marc(A) is induced by an open subset of M(A). Finitary injections are exactly open immersions.

**Hypotheses and conventions.** The condition is relative; it is not absolute filtered continuity of Y in an arbitrary base.

**Uses.** BM.1 excision: Open extension by zero is a finitary left adjoint. BM.2 free motives: Finitary maps to affine space admit effective left adjoints.

**API.**

- `finitary_stability` (functoriality): Finitary maps compose, pull back, and are closed under colimits in the slice.
- `finitary_cancellation` (relation): If g and g∘f are finitary then f is finitary.
- `open_iff_finitary_injection` (characterisation): A monomorphism is finitary exactly when it is an open immersion.

**Checks.**

- **Check `identity`** (degenerate): Every identity is finitary even when X itself has no absolute continuity property.
- **Check `open_inequality`** (computation): The locus |a|<r is finitary, including its empty and full special cases.
- **Check `nonopen_point`** (non-example): A closed point which is not open in a complex interval is not a finitary injection into that interval.

**Construction or proof.**

1. Establish composition, pullback, cancellation against a finitary map and stability under colimits over X directly from the cartesian condition.
2. For |a|<r use the infimum norm description of filtered colimits to prove openness is finitary. Conversely compact clopen neighbourhood approximation at strict points turns a finitary injection into an open subset.

**Acceptance.** Use the relative square in every base-change statement.

**Direct prerequisites.** [BM.1/finitary-category](#finitary-category), `TropicalAndBerkovichArithmetic:TB.0/contractive-colimits`, `TropicalAndBerkovichArithmetic:TB.0/idempotents-and-clopens`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §4, Definitions 4.21–4.22 and Lemma 4.23, pp. 24–25. Relative continuity characterizes the maps used by finitary left adjoints.

**Atlas planet:** Finitary maps.

<a id="proper-dimension"></a>

### Proper maps and cohomological dimension

**Definition — `BM.1/proper-dimension`.** For a small arc-stack X, d(X) is the cohomological dimension of global sections on Dfin(X,Z), measured on degree-zero objects. A 0-truncated map f:Y→X is proper if it is qcqs. Define d(f)=sup_x d(Y_x) over geometric points x; locally finite dimension means finite dimension after pullback to each quasicompact substack of X.

**Hypotheses and conventions.** Dimension may be infinite; a finite bound is additional data for the theorems using it.

**Uses.** BM.1 proper base change: Supplies the exact boundedness assumption. BM.8 and BM.9: Controls pushforwards and the scope of rigidity.

**API.**

- `dimension_bound` (characterisation): The analytic spectral-space plus residue-Galois bound holds with the stated suprema.
- `proper_base_change` (functoriality): Properness is preserved by base change.
- `dimension_local` (compatibility): Local finite dimension can be checked on quasicompact target charts.

**Checks.**

- **Check `strict_zero`** (computation): A strict affine base has d=0 for finitary degree-zero sheaves.
- **Check `profinite_fibre`** (computation): A profinite fibre over an algebraically closed field has d=0.
- **Check `truncation_guard`** (non-example): The map B(C₂)→* for the constant cyclic group of order two is not 0-truncated, and hence is not proper in this sense.

**Construction or proof.**

1. Use the derived global-sections functor to define the vanishing bound. Define relative dimension by geometric fibres and use the strict basis to compare base changes.
2. Combine the stalk formula with the spectral sequence on M(A): for analytic A, d(Marc(A)) is at most cd(M(A))+sup_x cd(G_K(x)).

**Acceptance.** Keep topological cohomological dimension separate from covering dimension unless the required comparison theorem is supplied.

**Direct prerequisites.** [BM.1/finitary-category](#finitary-category), [BM.1/geometric-comparisons](#geometric-comparisons), `EnhancedDerivedSheaves:E2`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §4, Definitions 4.17, 4.19 and Corollary 4.18, pp. 23–24. Proper here is a sheaf-theoretic qcqs condition on 0-truncated maps; dimension is cohomological.

<a id="finitary-excision"></a>

### Finitary adjoints and excision

**Theorem — `BM.1/finitary-excision`.** For finitary f, the derived left adjoint f♯ to f* preserves finitary sheaves and satisfies the projection formula. For an open j:U→X with closed complement i:Z→X, j_!=j♯ and j_!j*M→M→i_*i*M is an exact triangle. The loci |2|>1 and |2|≤1 give the archimedean/nonarchimedean excision decomposition.

**Hypotheses and conventions.** X is a small arc-stack and M lies in Dfin(X,Z).

**Construction or proof.**

1. Construct the adjoint in the enhanced slice sheaf category and use composition of finitary maps to retain finitarity.
2. Check the projection formula on free generators. Identify the open/closed localization on strict bases, then descend the triangle; apply it to the two norm loci.

**Acceptance.** Verify j_! has zero restriction to the complementary closed substack. Do not treat the |2| threshold as a choice of a residue-characteristic prime.

**Direct prerequisites.** [BM.1/finitary-maps](#finitary-maps), [BM.1/finitary-category](#finitary-category), `EnhancedDerivedSheaves:E0`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §4, Propositions 4.24–4.25, pp. 25–26. Left adjoints and the open/closed triangle precede the motivic construction.

<a id="proper-base-change"></a>

### Proper base change for finitary sheaves

**Theorem — `BM.1/proper-base-change`.** For a 0-truncated proper map f:Y→X of small arc-sheaves with finite d(f), Rf_* preserves Dfin, has the fibrewise cohomological bound, and commutes with every base change on Dfin. If f is quasi-pro-étale it also satisfies the projection formula. No general proper projection formula is asserted at this stage.

**Hypotheses and conventions.** In the bounded-below preservation argument finite d(f) is unnecessary; the unbounded conclusion uses it.

**Construction or proof.**

1. Resolve the qcqs source by affine charts and prove bounded-below finitary preservation using all-Banach continuity.
2. Use repleteness and the requested space-valued Postnikov theorem plus finite d(f) to pass to unbounded objects. Base change is computed by slices and geometric fibres.
3. For quasi-pro-étale f write each fibre as an inverse limit of finite sets; finite-set projection and finitarity give the projection formula.

**Acceptance.** Reproduce the failure for P¹→* using the reduced multiplicative group once BM.3 is available. Verify base change with arbitrary small arc-stack pullbacks, not only geometric points.

**Direct prerequisites.** [BM.1/proper-dimension](#proper-dimension), [BM.0/arc-replete](#arc-replete), [BM.1/finitary-category](#finitary-category), [BM.0/quasi-pro-etale](#quasi-pro-etale).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §4, Theorem 4.20 and Example 4.26, pp. 24, 26. Proper base change holds before stabilization but projection has an extra restriction.

**Atlas planet:** Finitary proper base change.

## BM.2 — Effective motives and ball localization

Construct integral effective motivic sheaves, the explicit ball localization, free motivic sheaves and finitary left adjoints. Prove the forward torsion-invariance criterion; the rational truncation and complex-point calculations follow through the comparison layers.

**Worked example.** Over the usual complex point, the closed unit ball B contracts through the maps (s,t)↦st. For every effective M, evaluation along B→* is therefore an equivalence M(*)→M(B). Applying the free-motive universal property gives Zmot[B]≃Zmot[*]=Z. In the explicit localization the two maps from Δ⁰ into Δ¹=B give the same map after realization. The same procedure sends the empty domain to zero: its free abelian sheaf has no generators. These computations distinguish ball localization from the operation of replacing every free domain by a copy of the unit.

<a id="effective"></a>

### Effective motivic sheaves

**Definition — `BM.2/effective`.** Deff_mot(X) is the full subcategory of Dfin(X,Z) on ball-invariant objects: M(A)→M(A⟨T⟩₁) is an equivalence for every Banach ring A over X, where A⟨T⟩₁ is the free uniform Banach A-algebra with |T|≤1. Its tensor product is the ball localization of the derived tensor product.

**Hypotheses and conventions.** X is a small arc-stack; all coefficients here are integral étale coefficients.

**Uses.** BM.3 Tate object: The reduced free multiplicative-group motive is formed here. BM.8 stable motives: This is the category stabilized by Tate tensoring.

**API.**

- `effective_field_test` (characterisation): Ball invariance can be tested at nondiscrete algebraically closed Banach fields.
- `effective_pullback` (functoriality): Pullback preserves effective motives and their localized tensor product.
- `effective_colimits` (structure): Effective objects are closed under colimits in Dfin.

**Checks.**

- **Check `complex_point`** (compatibility): At Marc(C) for the usual complex field, effective motives are D(Z).
- **Check `nonarch_units`** (compatibility): The reduced multiplicative group is an effective object, although ordinary units retain ball-dependent one-units.
- **Check `integral_not_rational`** (non-example): The construction retains prime-to-residue-characteristic torsion; it is not defined by tensoring every object with Q.

**Construction or proof.**

1. Define the local objects for the displayed maps; use uniformization to remove any ambiguity in the free ball algebra.
2. Use finite-dimensional proper base change and the strict basis to test ball invariance on nondiscrete algebraically closed Banach fields; this also proves closure under colimits. Import the Berkovich closed-disc tree geometry and the requested residue Galois bounds for the dimension estimate.

**Acceptance.** Prove d(C⟨T⟩₁)≤3; the complex case has bound 2, the nonarchimedean tree contributes 1 and residue Galois dimension at most 2.

**Direct prerequisites.** [BM.1/finitary-category](#finitary-category), [BM.1/proper-base-change](#proper-base-change), `TropicalAndBerkovichArithmetic:TB.0/affinoid-algebras`, `DiamondEtaleCohomology:C8`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`, `TropicalAndBerkovichArithmetic:TB.1/gauss-line-and-discs`, `TropicalAndBerkovichArithmetic:TB.1/tree-hyperbolic-metric`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §5, Definitions 5.1–5.2, Lemma 5.3, Corollaries 5.4–5.5, pp. 26–27. Effective motives impose closed-unit-ball invariance inside finitary sheaves.

**Atlas planet:** Effective motivic sheaves.

<a id="ball-localization"></a>

### Explicit ball localization

**Construction — `BM.2/ball-localization`.** The inclusion Deff_mot(X)⊂Dfin(X,Z) has a symmetric monoidal left adjoint L_B. On a strict ring A, (L_B M)(A)=|[n]↦M(A⟨Δⁿ⟩)|, with Δⁿ=Bⁿ and the ordered-coordinate cosimplicial structure. The same formula holds on analytic finite-cohomological-dimension A. This is a presentable monoidal Verdier quotient with kernel the localizing tensor ideal generated by B-contractible objects.

**Hypotheses and conventions.** B-contractible means an endomorphism-valued ball homotopy joining the identity to zero. Use the ordered-coordinate simplex model; naive barycentric coordinate formulas need not be contractive over archimedean rings.

**Uses.** BM.4 transfers: The presheaf variant L_B^pre provides explicit free motives. BM.6 K-theory: The spectral localization is applied to connective K-theory.

**API.**

- `ball_localization_adjunction` (universal-property): Maps L_B M→N into a ball-invariant N are maps M→N.
- `ball_localization_values` (characterisation): Evaluation on strict and analytic finite-dimensional bases has the displayed realization formula.
- `ball_localization_tensor` (compatibility): L_B(M⊗N) agrees with L_B M⊗mot L_B N.

**Checks.**

- **Check `already_local`** (characterisation): The unit M→L_B M is invertible for a ball-invariant M.
- **Check `contractible_zero`** (degenerate): A B-contractible object localizes to zero.
- **Check `simplex_zero`** (computation): Δ⁰ is the base and Δ¹ is the unit ball with the distinct 0 and 1 endpoint maps; they become homotopic after localization.

**Construction or proof.**

1. Use finite ball dimension and proper base change to make the realization a finitary sheaf. The standard cosimplicial homotopies identify the two endpoints, prove ball invariance, and prove L_B²≃L_B.
2. Identify its kernel using the cones of M→Hom(Bⁿ,M); these cones are B-contractible. Apply the presentable monoidal-quotient extension requested from E5, rather than only the small stable Verdier quotient.

**Acceptance.** Prove both the unit universal property and idempotence. Specify the spectral variant needed by BM.6 using the same localization.

**Direct prerequisites.** [BM.2/effective](#effective), [BM.1/proper-base-change](#proper-base-change), `EnhancedDerivedSheaves:E5:abstract/verdier-quotient`, `EnhancedDerivedSheaves:E5:presentability`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §5, Proposition 5.6, Remark 5.7, Proposition 5.8, pp. 27–28. The ball singular construction computes a localization with a tensor-ideal kernel.

**Atlas planet:** Ball localization.

<a id="homotopy-rational"></a>

### Rational homotopy t-structure

**Theorem — `BM.2/homotopy-rational`.** Deff_mot(X,Q) is closed under truncations in Dfin(X,Q). Its induced t-structure is the rational homotopy t-structure.

**Hypotheses and conventions.** X is a small arc-stack; the archimedean and nonarchimedean geometric-point arguments are treated separately.

**Construction or proof.**

1. At a nonarchimedean algebraically closed point rational ball cohomology has amplitude [0,1]. The resulting two-column spectral sequence forces each cohomology sheaf of a ball-invariant object to be ball-invariant.
2. Use the geometric-point ball test and treat the complex locus using ordinary sheaves.

**Acceptance.** Do not use integral truncation stability here: that uses the transfer and torsion results of BM.4.

**Direct prerequisites.** [BM.2/effective](#effective), [BM.1/geometric-comparisons](#geometric-comparisons), `TropicalAndBerkovichArithmetic:TB.1/tree-hyperbolic-metric`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §5, Proposition 5.10, p. 30. Rational ball cohomological dimension one gives truncation stability.

<a id="torsion-forward"></a>

### Étale torsion is ball-invariant

**Theorem — `BM.2/torsion-forward`.** If M∈Dfin(X,Z/n) and |n|≥1 everywhere on X, invariance of M under extensions of algebraically closed Banach fields implies ball invariance.

**Hypotheses and conventions.** n≥1; invariance is required for every such field extension over X.

**Construction or proof.**

1. Reduce to a nondiscrete algebraically closed field and the constant Z/n sheaf. On the complex locus use the contractible disc.
2. On the nonarchimedean ball compute the first direct-image sheaf by Kummer branch labels on finite trees: outgoing labels sum at a branch and vanish on rays ending at the boundary. Peel off terminal intervals to show its cohomology vanishes. Higher terms vanish by the residue-Galois bound.

**Acceptance.** Use the |n|≥1 condition when taking Kummer roots of one-units. Do not invoke the reverse implication before the transfer theorem.

**Direct prerequisites.** [BM.2/effective](#effective), [BM.1/geometric-comparisons](#geometric-comparisons), `TropicalAndBerkovichArithmetic:TB.1/tree-hyperbolic-metric`, `TropicalAndBerkovichArithmetic:TB.1/gauss-line-and-discs`, `DiamondEtaleCohomology:C6`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §5, Proposition 5.9, pp. 28–30. Kummer cohomology on the Berkovich tree supplies the forward torsion implication.

<a id="free-motives"></a>

### Free motivic sheaves of open affine domains

**Construction — `BM.2/free-motives`.** For U⊂Aⁿ_X open, define Zmot[U] by ball-localizing the free derived abelian arc-sheaf on U. It is finitary and represents the functor M↦M(U) on effective motives. It commutes with base change and sends fibre products of such domains over X to tensor products. If X is analytic affine of finite cohomological dimension, these objects generate Deff_mot(X).

**Hypotheses and conventions.** n is finite; U is open. Finitarity of L_B^pre U is a theorem to prove, not an assumption on the representable U.

**Uses.** BM.3 and BM.5: Builds the reduced multiplicative-group motive and the cancellation generators. BM.9: Provides compact factorizations and dualizable generators.

**API.**

- `free_motive_hom` (universal-property): Map(Zmot[U],M)≃M(U), naturally in effective M.
- `free_motive_base_change` (functoriality): Pullback of Zmot[U] is Zmot of the pulled-back open domain.
- `free_motive_product` (compatibility): Zmot[U×_X V]≃Zmot[U]⊗Zmot[V].

**Checks.**

- **Check `point_unit`** (computation): Zmot[X] is the tensor unit.
- **Check `empty_zero`** (degenerate): Zmot[∅]=0, rather than a copy of Z.
- **Check `ball_unit`** (compatibility): The projection B_X→X induces an equivalence of free motives; before ball localization its free sheaf need not be constant.

**Construction or proof.**

1. In the nonarchimedean case exhaust U by subsets invariant under sufficiently small additive balls and take their quotients. In general use the source’s uniform approximation argument to prove finitarity of the ball singular construction.
2. Apply the localization adjunction for representability. For generation, use bounded closed subsets and neighbourhood continuity to detect fields of finite topological transcendence degree, then arbitrary geometric fields.

**Acceptance.** Check the generator argument uses uniformly bounded dimension before passing to neighbourhood limits.

**Direct prerequisites.** [BM.2/ball-localization](#ball-localization), [BM.1/finitary-maps](#finitary-maps), [BM.1/geometric-comparisons](#geometric-comparisons), `TropicalAndBerkovichArithmetic:TB.0/analytic-spaces`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §5.1, Lemma 5.11, Propositions 5.12–5.13, pp. 30–32. Open affine domains yield finitary free motives and detect effective sheaves.

**Atlas planet:** Free motivic sheaves.

<a id="effective-adjoints"></a>

### Effective left adjoints

**Theorem — `BM.2/effective-adjoints`.** If f:Y→Aⁿ_X→X is a composite of a finitary map and a finite-dimensional affine-space projection, then f*:Deff_mot(X)→Deff_mot(Y) has a left adjoint f♯ which commutes with base change and satisfies the projection formula.

**Hypotheses and conventions.** The factorization is part of the theorem’s hypotheses; arbitrary maps are not included.

**Construction or proof.**

1. Reduce by hyperdescent to strict bases and to the affine-space projection, using the finitary adjoint already established.
2. On generators define f♯Zmot[V/Y]=Zmot[V/X]. The product formula gives projection; the same formula gives base change and permits descent of the adjoint.

**Acceptance.** Check n=0 agrees with the finitary left adjoint after localization. On the complex point verify effective motives are D(Z) by the contraction argument.

**Direct prerequisites.** [BM.2/free-motives](#free-motives), [BM.1/finitary-excision](#finitary-excision), [BM.2/effective](#effective), `EnhancedDerivedSheaves:E0`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §5.1, Theorem 5.14, p. 32. The free-domain generators construct the left adjoint for the admitted factorization.

**Atlas planet:** Effective smooth adjoints.

## BM.3 — Reduced units and the Tate object

Construct one-units, the reduced multiplicative group and the Tate object. Prove ball invariance, the reduced free multiplicative-group calculation and compactness of the Tate object.

**Worked example.** Use the elementary field predicate on Q₂. For u=−1 one has ‖u−1‖=‖−2‖=1/2<1, so −1 is a one-unit. In Q₃ the corresponding norm is 1, so −1 is excluded. In both cases ‖−1‖=1: norm one alone does not characterize a one-unit. For an algebraically closed nonarchimedean field C, a pseudouniformizer π has ‖π‖<1 and its class in Gbar_m is nontrivial, since every one-unit has norm one. A unit with nontrivial residue also survives, even though its norm is one. Thus Gbar_m retains both residue units and valuation information.

<a id="one-units"></a>

### One-units

**Definition — `BM.3/one-units`.** For a nonarchimedean uniform Banach ring A, let A<1={a:|a|<1} and U¹(A)=1+A<1⊂A×. Let U¹ be the associated arc-sheaf of abelian groups. As a light pinned-library prototype on a normed field K, IsOneUnit(u) means ‖u−1‖<1 for u∈K×; an ultrametric hypothesis gives its subgroup and norm-one API.

**Hypotheses and conventions.** The ring version is restricted to the nonarchimedean uniform locus. For the prototype the NormedField and IsUltrametricDist carriers are the existing Mathlib ones; completeness is unnecessary for the elementary field identities.

**Uses.** BM.3 reduced units: Its sheaf quotient removes ball-dependent infinitesimal units. BM.7 K-cofibre: The nonunital ideal A<1 controls the discarded K-theory.

**API.**

- `one_unit_mul_inv` (structure): The identity is a one-unit; products and inverses of one-units are one-units.
- `one_unit_norm` (characterisation): In an ultrametric normed field a one-unit has norm exactly one.
- `one_unit_transport` (functoriality): An isometric unital field map preserves and reflects one-units; a contractive map preserves them.

**Checks.**

- **Check `identity`** (degenerate): The unit 1 is a one-unit since its difference from 1 has norm zero.
- **Check `norm_obstruction`** (non-example): A unit of norm different from 1 is not a one-unit in an ultrametric field.
- **Check `minus_one`** (computation): The unit −1 is a one-unit exactly when ‖2‖<1; in particular norm(2)=1 excludes it. This distinguishes <1 from ≤1.

**Construction or proof.**

1. Use the strong triangle inequality for multiplication and the geometric-series argument in complete rings for inversion. In a field first show a one-unit has norm one, then use u⁻¹−1=−u⁻¹(u−1).
2. Sheafify the subgroup inclusion. Keep A<1 distinguished from A≤1: a topologically nilpotent element can have norm equal to one before uniformization.

**Acceptance.** Compare the elementary field predicate with the uniform complete-field subgroup.

**Direct prerequisites.** `TropicalAndBerkovichArithmetic:TB.0/uniform-unit-hierarchy`, [BM.0/arc-site](#arc-site), `mathlib:NormedField`, `mathlib:IsUltrametricDist`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §5.2, discussion preceding Definition 5.15, p. 32; §2.3, p. 12. The strict norm threshold defines the subgroup removed from units.

**Atlas planet:** One-units.

<a id="reduced-units"></a>

### Reduced multiplicative group

**Definition — `BM.3/reduced-units`.** On a nonarchimedean small arc-stack define Gbar_m as the quotient G_m/U¹ in arc-sheaves of abelian groups, not the unsheafified pointwise quotient on every Banach ring. The reduction map is the canonical epimorphism from the multiplicative group.

**Hypotheses and conventions.** The nonarchimedean locus is |2|≤1 and all ring evaluations use uniformization where required.

**Uses.** BM.3 Tate: Identifies the reduced free multiplicative-group motive. BM.11 Galois gerbe: Its field value defines the extension class for MGC.

**API.**

- `reduced_units_quotient` (universal-property): Maps out are maps from G_m killing U¹.
- `reduced_units_pullback` (functoriality): The quotient is compatible with base change of small arc-stacks.
- `reduced_units_field` (compatibility): At an algebraically closed nondiscrete nonarchimedean field it is the displayed quotient of units.

**Checks.**

- **Check `one_unit_killed`** (degenerate): Every 1+a with |a|<1 maps to the identity.
- **Check `valuation_survives`** (non-example): A pseudouniformizer has nontrivial reduced class, as detected by its absolute value.
- **Check `residue_survives`** (non-example): A norm-one unit with residue different from 1 is not killed; the quotient retains more than the value group.

**Construction or proof.**

1. Form the abelian sheaf quotient and use the strict basis to compute geometric field values.
2. Derive natural multiplication, quotient maps and base change from the quotient universal property. Establish finitarity using filtered continuity on strict bases.

**Acceptance.** At a nonarchimedean geometric field C the value is C×/(1+C<1).

**Direct prerequisites.** [BM.3/one-units](#one-units), [BM.1/finitary-category](#finitary-category), `EnhancedDerivedSheaves:E0`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §5.2, Definition 5.15 and Theorem 5.16, pp. 32–33. The reduced group is an arc-sheaf quotient by one-units.

**Atlas planet:** Reduced multiplicative group.

<a id="reduced-free"></a>

### Ball invariance and the reduced free-unit motive

**Theorem — `BM.3/reduced-free`.** Gbar_m is finitary and ball-invariant. The tautological section induces Zmot[G_m]/Zmot[*]≃Gbar_m on the nonarchimedean locus.

**Hypotheses and conventions.** The reduced free motive is formed using the unit section 1.

**Construction or proof.**

1. Modulo a prime use Kummer torsion and the field-invariant-to-ball-invariant direction: residue-characteristic torsion vanishes and other torsion is étale. Rationally compute on the Berkovich tree, using Pic(C⟨T⟩)=0 and harmonic integral slopes to force constant reduced sections.
2. Group-complete the free commutative monoid and use characteristic polynomials Symⁿ(G_m)≃Aⁿ⁻¹×G_m for the unreduced group. Pass through the one-unit homotopies to deduce the reduced motive formula; do not assert this characteristic-polynomial isomorphism for Symⁿ(Gbar_m).

**Acceptance.** Track the basepoint 1 and reduced summand. Reproduce the P¹ counterexample to the unstabilized projection formula from Example 4.26.

**Direct prerequisites.** [BM.3/reduced-units](#reduced-units), [BM.2/free-motives](#free-motives), [BM.2/torsion-forward](#torsion-forward), `TropicalAndBerkovichArithmetic:TB.1/tree-hyperbolic-metric`, `TropicalAndBerkovichArithmetic:TB.1/annular-integral-slopes`, `TropicalAndBerkovichArithmetic:TB.0/affinoid-algebras`, `TropicalAndBerkovichArithmetic:TB.0`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §5.2, Theorem 5.16 and Proposition 5.17, pp. 32–34. Kummer classes, tree harmonicity and symmetric polynomials give the reduced free-motive identification.

**Atlas planet:** Reduced free multiplicative motive.

<a id="tate"></a>

### First Tate twist

**Definition — `BM.3/tate`.** For every small arc-stack X define Z(1)=cofib(Zmot[*]→Zmot[G_m])[−1], using the unit section. Write Z(n)=Z(1)⊗n for n≥0 in the effective category. Over the usual complex point Z(1)≃Z; over the real point the conjugation action is the sign action; on the nonarchimedean locus Z(1)≃Gbar_m[−1].

**Hypotheses and conventions.** Negative twists belong to the stable category constructed in BM.8.

**Uses.** BM.5 cancellation: Tensoring with this object is proved fully faithful. BM.8 stabilization: This precise object is coherently inverted.

**API.**

- `tate_base_change` (functoriality): Pullback carries the base Tate object to the Tate object on the source.
- `tate_reduced` (equivalence): The nonarchimedean identification is Z(1)[1]≃Gbar_m.
- `tate_tensor` (compatibility): For nonnegative m,n, Z(m)⊗Z(n)≃Z(m+n).

**Checks.**

- **Check `complex_tate`** (computation): Over C the object is Z in degree zero, not zero.
- **Check `real_sign`** (compatibility): Complex conjugation on the real realization acts by −1.
- **Check `nonarch_shift`** (compatibility): Over a nonarchimedean point the shift is Gbar_m[−1]; a formula without [−1] fails the defining cofiber identity.

**Construction or proof.**

1. Take the reduced motive and its specified cohomological shift. Use the previous reduced free-unit calculation on the nonarchimedean locus and ordinary complex topology on the archimedean locus.
2. Keep the base-change equivalences coherent so that stabilization can invert this same object.

**Acceptance.** Pin the cohomological shift by the equality with Gbar_m[−1], rather than an informal degree convention.

**Direct prerequisites.** [BM.2/free-motives](#free-motives), [BM.3/reduced-free](#reduced-free), [BM.1/geometric-comparisons](#geometric-comparisons).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §5.2, Definition 5.18, pp. 34–35. The Tate object is a shifted reduced multiplicative-group motive with different pointwise realizations.

**Atlas planet:** Tate twist.

<a id="annulus-compactness"></a>

### Annulus invariance and compact Tate object

**Theorem — `BM.3/annulus-compactness`.** For an open annulus T(r₁,r₂)⊂G_m with 0<r₁<r₂<∞, Zmot[T]→Zmot[G_m] is an equivalence. If the base X is strictly totally disconnected, Z(1) is compact in Deff_mot(X).

**Hypotheses and conventions.** Compactness is asserted on strict bases; general relative rigidity does not imply compact generation.

**Construction or proof.**

1. At an archimedean geometric point, use ordinary homology to compare a nonempty complex annulus with G_m. At a nonarchimedean geometric point, rescale so r₁<1<r₂. For the monic polynomial Tⁿ+Σ_{i<n}a_iT^i with fixed a₀∈T(r₁ⁿ,r₂ⁿ), all roots lie in the annulus exactly when |a_i|<min(r₂^{n−i},|a₀|r₁^{−i}) for 1≤i<n. These inequalities give open-polydisc fibres of Symⁿ(T)→T(r₁ⁿ,r₂ⁿ). Use ball invariance on the fibres and let n grow; the union of the target annuli is G_m.
2. Use finitarity to compare evaluation on open and closed annuli. A closed annulus is quasicompact of finite cohomological dimension, so evaluation preserves colimits, giving compactness.

**Acceptance.** Check the fibre inequalities control all roots, rather than only the product of roots. The radius uses the minimum of the two coefficient bounds. Check T²+T/2+4 over C₂ with r₁=1/4,r₂=4: its root of norm 1/8 must be excluded; see source finding E5.

**Direct prerequisites.** [BM.3/tate](#tate), [BM.2/free-motives](#free-motives), [BM.1/proper-base-change](#proper-base-change), `TropicalAndBerkovichArithmetic:TB.1/gauss-line-and-discs`, `TropicalAndBerkovichArithmetic:TB.1/annular-integral-slopes`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §5.2, Proposition 5.19, pp. 34–35. Newton polygons give annular invariance and compact representability.

**Atlas planet:** Compact Tate object.

## BM.4 — Transfers and geometric-point comparisons

Construct transfers, marked generalized Jacobians and the curve homotopies needed for explicit free motives. Prove torsion étale comparison, characteristic-prime invertibility, effective tilting and integral homotopy truncation.

**Worked example.** Let X=P¹_C with marks 0 and ∞. Every degree-zero line bundle is trivial. Two nonzero marked trivializations give a pair (a,b)∈(C×)²; dividing by the simultaneous scalar leaves the single coordinate a/b. Hence the marked Jacobian is G_m, as predicted by the torus rank r−1=1. For x,y away from the marks, the rational section (t−x)/(t−y) has marked value ratio x/y, with the chosen ordering of trivializations. Every nonzero ratio has an nth root in algebraically closed C, so multiplication by n is surjective on these points. When char(C)=p and n=p, this calculation still works even though the multiplication map is inseparable. It supplies divisibility of marked classes, not an étale-cover assertion.

<a id="transfers"></a>

### Banach presheaves with transfers

**Definition — `BM.4/transfers`.** For a strictly totally disconnected X form a category on uniform Banach algebras over X, with maps A→B given by maps of arc-sheaves of commutative monoids N[Marc(A)/X]→N[Marc(B)/X]. A presheaf with transfer is an additive functor from this category to abelian groups; finitary means commuting with completed filtered colimits of all Banach algebras over X.

**Hypotheses and conventions.** Composition is composition of monoid-sheaf maps; it is not defined using scheme finite correspondences.

**Uses.** BM.4 transfer sheafification: Transfers compare field extensions and rational Čech descent. BM.5 cancellation: Finite étale diagrams are summed with multiplicity in the rational inverse.

**API.**

- `transfer_restriction` (compatibility): Restricting along actual Banach maps recovers the underlying presheaf.
- `transfer_additivity` (structure): Disjoint multisets give sums of pullback/trace maps, with multiplicities.
- `transfer_composition` (functoriality): Composition of multivalued maps agrees with composition of induced transfer maps.

**Checks.**

- **Check `identity_transfer`** (degenerate): A singleton identity multiset acts as the identity.
- **Check `multiplicity`** (computation): The multiset consisting of d copies of the identity acts by multiplication by d, including d=0.
- **Check `finite_etale_trace`** (compatibility): For a degree-d finite étale map, trace after pullback equals d, without requiring a global ordering of the fibres.

**Construction or proof.**

1. Use the free commutative monoid adjunction and composition to define the category, its additive functors and ordinary restriction.
2. Construct the evaluation/trace maps encoded by finite multisets; check identity and composition before deriving sheafification.

**Acceptance.** State the direction of the algebra morphisms and induced restriction maps explicitly.

**Direct prerequisites.** [BM.0/arc-site](#arc-site), [BM.1/finitary-descent](#finitary-descent), `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E5:animation`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §6, Definition 6.2, pp. 35–36. Transfers are encoded by free arc-monoids on affine Banach objects.

**Atlas planet:** Banach transfers.

<a id="curve-shrinking"></a>

### Curve compactification after shrinking

**Theorem — `BM.4/curve-shrinking`.** Given a smooth connected analytic curve U over a nondiscrete algebraically closed nonarchimedean field C and two C-points x,x′, there is a connected open neighbourhood U′⊂U of both points, embedded in a smooth projective C-curve X, with X∖U′ a finite disjoint union of closed discs. One can choose a C-point in each boundary disc.

**Hypotheses and conventions.** The assertion allows shrinking U while retaining both marked points. Choose a proper neighbourhood when necessary so the boundary is nonempty.

**Construction or proof.**

1. Choose a connected affinoid neighbourhood of a path joining the two points and apply van der Put’s normal-affinoid embedding with complement finite nonsingular reduction points.
2. Refine the formal/analytic neighbourhoods of these smooth reduction points to disjoint closed-disc boundary pieces. Remove them to obtain U′, retaining x,x′ by choosing the neighbourhoods away from these points. This last analytic refinement is a required TB supplier request, not a conclusion already stated in Corollary 1.3.

**Acceptance.** Verify both original points remain in U′. Do not claim an arbitrary given affinoid has the required disc complement without modification.

**Direct prerequisites.** `TropicalAndBerkovichArithmetic:TB.0/analytic-spaces`, `TropicalAndBerkovichArithmetic:TB.1/gauss-line-and-discs`, `TropicalAndBerkovichArithmetic:TB.0`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §6, proof of Lemma 6.4, p. 37; van der Put, Corollary 1.3, p. 159 (proof pp. 159–161). The curve argument needs a shrunken disc-boundary domain; the cited affinoid theorem first gives smooth missing reduction points. [Marius van der Put, *The class group of a one-dimensional affinoid space*](https://www.numdam.org/item/AIF_1980__30_4_155_0/), Theorem 1.1, pp. 155–158; Corollary 1.3 and proof, pp. 159–161. A normal one-dimensional affinoid embeds in a complete smooth curve with only finitely many nonsingular points missing in reduction.

<a id="marked-jacobian"></a>

### Generalized Jacobian with marked trivializations

**Construction — `BM.4/marked-jacobian`.** For a smooth projective geometrically connected C-curve X and r≥1 distinct C-points Z={z₁,…,z_r}, construct J_Z classifying degree-zero line bundles with a trivialization at each z_i, modulo isomorphism. It is a semiabelian variety with exact sequence 1→G_m^{r−1}→J_Z→Jac(X)→0. For every prime ℓ, [ℓ]:J_Z(C)→J_Z(C) is surjective, including ℓ=char(C).

**Hypotheses and conventions.** C is algebraically closed; X and Z satisfy the displayed smoothness and distinctness assumptions. The trivializations are modulo simultaneous scalar automorphisms, hence the torus rank is r−1.

**Uses.** BM.4 curve homotopy: Divides O(x−x′) by a prime while preserving every boundary normalization. BM.4 explicit free motives: Enables the torsion field-invariance argument.

**API.**

- `marked_jacobian_moduli` (universal-property): C-points are the stated isomorphism classes with tensor-product group law.
- `marked_jacobian_exact` (structure): Forgetting trivializations has kernel G_m^{r−1}.
- `marked_jacobian_division` (constructor): Every marked degree-zero class admits an ℓth root for each prime ℓ.

**Checks.**

- **Check `one_mark`** (degenerate): For r=1 the torus kernel is trivial and J_Z≃Jac(X).
- **Check `two_marks_rational`** (computation): For X=P¹ and r=2, J_Z≃G_m; the ratio of the two trivializations is the coordinate.
- **Check `diagonal_scalars`** (characterisation): Multiplying all trivializations by the same scalar leaves the class unchanged. Without marks the Picard stack retains scalar automorphisms and is not this r≥1 moduli problem.

**Construction or proof.**

1. Use the existing relative Picard/Jacobian roadmap for Pic⁰(X). Over it form the torsor of fibre trivializations at Z and divide by the diagonal scalar action; the fibre is (G_m)^r/G_m. Descend this torsor construction to obtain the representing semiabelian group.
2. Surjectivity of [ℓ] follows from the torus and abelian-variety cases and the extension sequence. In characteristic ℓ this is surjectivity on algebraically closed points, not an étale-isogeny assertion.

**Acceptance.** Construct the representing extension and its C-point moduli equivalence. The BLR nodal Picard example supports the torus-extension pattern; it is not cited as a direct marked-modulus representability theorem.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`, `AnalyticStacks:AS.1`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §6, proof of Lemma 6.4, p. 37; compare BLR §9.2, Proposition 3, p. 244 and Example 8, pp. 246–247. The transfer proof uses divisibility in a marked Picard extension; the ordinary Jacobian alone does not remember boundary trivializations. [Siegfried Bosch, Werner Lütkebohmert and Michel Raynaud, *Néron Models*](https://doi.org/10.1007/978-3-642-51438-8), §9.2, Proposition 3, p. 244; Example 8, pp. 246–247; Proposition 10, p. 249. Smooth proper Picard varieties and normalization of nodal curves exhibit the abelian and toric components used as background for the marked construction.

**Atlas planet:** Marked generalized Jacobian.

<a id="line-domain-motives"></a>

### Rational motives of finite-boundary line domains

**Lemma — `BM.4/line-domain-motives`.** Let U,V⊂A¹_C be open with complements in P¹_C finite disjoint unions of closed discs. Then Qmot[U](V) is concentrated in degree zero and is the cokernel of N[U](V×B)⊗Q→N[U](V)⊗Q given by the difference of endpoints. If U has d+1 boundary discs, Qmot[U]≃Q⊕(Gbar_m⊗Q)^d.

**Hypotheses and conventions.** C is nondiscrete algebraically closed nonarchimedean; the complement includes a disc around infinity.

**Construction or proof.**

1. Use excision and annulus invariance to split the motive into the unit and boundary reduced-unit summands. Compute mappings using the residue-unit and rational boundary-degree coordinates.
2. For surjectivity use P_t(T)=∏(T−a_i)^{k_i}−t, with |t| between s₁ and s₂. Choose every k_i so r₁^{k_i}<s₁ and n=Σk_i so r₂ⁿ>s₂. Outside the outer disc the product has norm at least r₂ⁿ; inside the ith deleted disc it has norm at most r₁^{k_i}, since the other centre distances are one. Thus every root lies in U. The resulting boundary-degree vectors span all rational slopes. For injectivity interpolate polynomial coefficients; the Newton inequalities keep roots in the domain when product coordinates agree up to one-units.

**Acceptance.** An open disc has d=0 and an annulus has d=1. Use the corrected base P¹_C in the source’s line-domain notation. Verify the corrected exponent k_i in the inner-disc estimate, the sign T₁−T₂ in the nearby-point ratio, and the d rather than e boundary-coordinate count per annular source; see source findings E1–E4.

**Direct prerequisites.** [BM.4/transfers](#transfers), [BM.3/annulus-compactness](#annulus-compactness), [BM.3/reduced-free](#reduced-free), [BM.1/finitary-excision](#finitary-excision), `TropicalAndBerkovichArithmetic:TB.1/annular-integral-slopes`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §6, Lemma 6.5 and proof, pp. 37–39. Explicit boundary slopes identify the rational transfer quotient with the actual motive.

<a id="curve-homotopy"></a>

### Prime-divisible curve homotopies

**Lemma — `BM.4/curve-homotopy`.** For a smooth connected curve U over C as above, x,x′∈U(C), and a prime ℓ, there are n≥0 and points x_i,x′_i∈U(C) for which [x]+ℓΣ[x_i] and [x′]+ℓΣ[x′_i] are B-homotopic in N[U].

**Hypotheses and conventions.** C is nondiscrete, complete, algebraically closed and nonarchimedean. Use separated smooth curves without boundary, including the curve models needed in the field-extension argument.

**Construction or proof.**

1. Shrink around x,x′ and compactify with closed-disc boundary. Choose one boundary point per disc and divide O(x−x′) by ℓ in the marked generalized Jacobian.
2. Use rational-section approximation, requested from the curve/affinoid supplier, to choose a divisor for the root line bundle supported away from the boundary and section value 1 at each mark. Express its positive and negative degree-zero parts as sums of C-points.
3. Interpolate the two corresponding tautological sections by ts₁+(1−t)s₂. Their ratio is a one-unit on each boundary disc, so this section never vanishes there, and the interpolating effective divisors stay in U.

**Acceptance.** Prove support remains away from the entire boundary discs, not just the marked centres. Include ℓ equal to the residue characteristic without assuming [ℓ] is étale.

**Direct prerequisites.** [BM.4/curve-shrinking](#curve-shrinking), [BM.4/marked-jacobian](#marked-jacobian), [BM.4/transfers](#transfers), [BM.3/one-units](#one-units), `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, `TropicalAndBerkovichArithmetic:TB.0/analytic-spaces`, `TropicalAndBerkovichArithmetic:TB.0`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §6, Lemma 6.4 and proof, pp. 36–37. Marked divisibility and boundary-unit interpolation give the homotopy after adding prime multiples.

<a id="transfer-sheafification"></a>

### Ball-invariant transfer sheafification

**Theorem — `BM.4/transfer-sheafification`.** A finitary ball-invariant abelian presheaf with transfers on a strict nonarchimedean base has ball-invariant derived arc-sheafification after inverting every prime ℓ with |ℓ|<1 somewhere on the base. Its reduction modulo n is invariant under algebraically closed field extension. Rationally its values on open and affine domains in A¹_A are already unchanged by derived arc-sheafification.

**Hypotheses and conventions.** The presheaf has the full transfer structure of BM.4, not just trace maps for a selected cover. Keep track of the localized coefficient ring when interpreting the modulo-n assertion.

**Construction or proof.**

1. Compute sheafification through the strict basis and quasi-pro-étale sheafification; retain finitarity.
2. For torsion reduce a field extension to topological transcendence degree one and use a smooth curve model. A C-section gives injectivity and the prime-divisible homotopy gives surjectivity.
3. Rational transfers give finite étale descent; on the Berkovich line use the finite-boundary domain calculation to split the two-domain Čech sequence.

**Acceptance.** Treat the rational Čech argument separately from the torsion argument.

**Direct prerequisites.** [BM.4/transfers](#transfers), [BM.4/curve-homotopy](#curve-homotopy), [BM.4/line-domain-motives](#line-domain-motives), [BM.1/finitary-descent](#finitary-descent).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §6, Theorem 6.3, pp. 35–36. The curve and line-domain lemmas prove exactly the sheafification needed for free motives.

**Atlas planet:** Transfer sheafification.

<a id="explicit-free"></a>

### Explicit free motivic sheaves

**Theorem — `BM.4/explicit-free`.** For a finitary arc-sheaf of sets U over a nonarchimedean small arc-stack X, and strict A over X, Zmot[U](A) after inverting all primes ℓ with |ℓ|<1 somewhere on M(A) is the group completion of L_B^pre N[U](A). Rationally the formula also computes values on affine arc-subsets of A¹_A. Modulo n with |n|≥1 everywhere on X, Zmot[U]/n is invariant under algebraically closed field extensions.

**Hypotheses and conventions.** The explicit group completion is taken in the animated/spectral sense appropriate to the free abelian object, not only on π₀.

**Construction or proof.**

1. The homology presheaves of the group-completed ball singular monoid have finitary transfers. Apply transfer sheafification to prove the resulting arc-sheaf is ball-invariant.
2. Identify its universal property with the free effective motive, and use the rational and torsion clauses of the sheafification theorem for the two extra formulas.

**Acceptance.** Do not assert the formula integrally without the bad-prime inversion.

**Direct prerequisites.** [BM.4/transfer-sheafification](#transfer-sheafification), [BM.2/free-motives](#free-motives), [BM.2/ball-localization](#ball-localization), `EnhancedDerivedSheaves:E5:animation`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §6, Theorem 6.1 and proof, p. 35. The free effective motive has a cycle/singular construction with explicit coefficient restrictions.

**Atlas planet:** Explicit free motives.

<a id="torsion-comparison"></a>

### Torsion motives and characteristic-prime invertibility

**Theorem — `BM.4/torsion-comparison`.** For M∈Dfin(X,Z/n) and |n|≥1 everywhere, ball invariance is equivalent to invariance under algebraically closed field extension. If |p|_A<1 for a prime p, multiplication by p is invertible in Deff_mot(Marc(A)). If |p|≥1 everywhere on M(A), its p-power torsion subcategory is the left-completed derived category of p-power torsion étale sheaves.

**Hypotheses and conventions.** Distinguish the strict Banach norm condition |p|_A<1 from the pointwise condition in the second clause.

**Construction or proof.**

1. The forward direction in the equivalence uses generation by free open-domain motives and the explicit-free modulo-n theorem; combine it with the previously proved reverse direction.
2. For |p|<1 reduce by geometric descent and tilting of perfectoid arc-sites to characteristic p, where the Artin–Schreier exact sequence and contraction of the additive ball force F_p=0.
3. On strict bases the remaining torsion objects are ordinary sheaves on a profinite set. Descend and retain left completion.

**Acceptance.** Over a geometric field with residue characteristic p, effective motives are Z[1/p]-linear and prime-to-p torsion is D(Z/n). At the usual complex point the integral category is D(Z), not its rationalization.

**Direct prerequisites.** [BM.2/torsion-forward](#torsion-forward), [BM.4/explicit-free](#explicit-free), [BM.2/free-motives](#free-motives), `DiamondsAndVStacks:D2`, `DiamondEtaleCohomology:C2`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §6, Corollary 6.6 and Theorem 6.7, p. 39; §1, Proposition 1.5, p. 4. The two torsion regimes are distinguished by the norm of the prime.

**Atlas planet:** Torsion étale comparison.

<a id="effective-tilting"></a>

### Effective motivic tilting

**Theorem — `BM.4/effective-tilting`.** For a small arc-stack X with |p|<1 everywhere and tilt X♭, tilting induces Deff_mot(X)≃Deff_mot(X♭); both categories are Z[1/p]-linear.

**Hypotheses and conventions.** The tilted arc-stack is formed using the perfectoid basis and its arc-site equivalence.

**Construction or proof.**

1. Use perfectoid arc-descent to identify sites. Ordinary ball invariance implies perfectoid-ball invariance by filtered continuity.
2. Conversely compare the usual ball to its p-power-root tower; trace divided by p gives compatible splittings after p is inverted, so perfectoid-ball invariance implies ordinary ball invariance.

**Acceptance.** Verify the inverse direction, rather than merely transporting the sheaf category.

**Direct prerequisites.** [BM.4/torsion-comparison](#torsion-comparison), [BM.0/strict-descent](#strict-descent), `DiamondsAndVStacks:D2`, [BM.4/transfers](#transfers).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §6, Proposition 6.8 and proof, pp. 39–40. Tilting preserves precisely the ball-local objects once p is invertible.

**Atlas planet:** Effective tilting.

<a id="homotopy-integral"></a>

### Integral homotopy t-structure

**Theorem — `BM.4/homotopy-integral`.** For every small arc-stack X, Deff_mot(X) is closed under the truncations of Dfin(X,Z), hence inherits the integral homotopy t-structure.

**Hypotheses and conventions.** Use the intrinsic rational and torsion effective subcategories with their already proved truncation stability.

**Construction or proof.**

1. Apply the arithmetic triangle M→M⊗Q→M⊗Q/Z. The remaining issue is that the image of a map from a rational degree-zero effective sheaf to a torsion one is effective.
2. A field-extension class in that image descends by finitarity to a topologically finite-type algebra over the smaller algebraically closed field, which admits a section. This proves field-invariance of the image; the torsion criterion finishes.

**Acceptance.** Do not infer integral truncation stability merely by separately rationalizing and reducing modulo primes without controlling the connecting image.

**Direct prerequisites.** [BM.2/homotopy-rational](#homotopy-rational), [BM.4/torsion-comparison](#torsion-comparison), [BM.2/free-motives](#free-motives).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §6, Corollary 6.9, p. 40. The rational-to-torsion image argument closes the integral truncation proof.

## BM.5 — Cancellation over every small arc-stack

Prove Tate cancellation over arbitrary small arc-stacks, including the explicit rational inverse and permutation coherence. Compute symmetric powers, projective cells and the rational classifying-space motive.

**Worked example.** Apply the rational inverse construction to an element represented on a closed annulus. For sufficiently large N, the two multivalued counting constructions on an element in the image of the Tate unit have total multiplicities N and N−1. Their difference is N−(N−1)=1, so the resulting eventual sequence recovers the original class. A component occurring with multiplicity p in residue characteristic p contributes p to this count; counting only distinct roots changes the answer. On the basepoint summand the two counts agree and their difference is zero. The bound on N belongs to the chosen representative and its homotopies; the inverse takes eventual sequences precisely to make this independent of that bound.

<a id="tate-permutation"></a>

### Tate permutation homotopies

**Lemma — `BM.5/tate-permutation`.** Every permutation acts trivially on Z(1)⊗n in the homotopy category, for every n≥0 and every small arc-stack. This is the noncoherent assertion used before cancellation; the coherent enhancement is deduced after cancellation.

**Hypotheses and conventions.** Keep the Koszul sign: the swap on Gbar_m⊗Gbar_m is −1 because Z(1)=Gbar_m[−1].

**Construction or proof.**

1. Identify the reduced motive of A²∖{0} with Z(2)[3] using the two standard affine charts.
2. Elementary unipotents act by ball homotopies; they generate SL₂. Reduce coordinate interchange to diag(−1,1). Multiplication by −1 is trivial on the reduced free G_m motive because the total multiplicity is zero. Reduce general permutations to adjacent transpositions.

**Acceptance.** Do not use cancellation in this lemma’s proof. The reduced G_m swap and the Tate swap have different signs.

**Direct prerequisites.** [BM.3/tate](#tate), [BM.3/reduced-free](#reduced-free), [BM.2/free-motives](#free-motives), [BM.1/finitary-excision](#finitary-excision).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §7, Lemma 7.3 and discussion preceding its proof, p. 43. The elementary homotopy assertion precedes the coherent consequence.

<a id="rational-cancellation-inverse"></a>

### Rational cancellation inverse

**Lemma — `BM.5/rational-cancellation-inverse`.** Over a nondiscrete algebraically closed nonarchimedean field C, for each finitary sheaf of sets U and i≥0, construct a natural operation from π_i Hom(Qmot[(G_m,*)],Qmot[U×(G_m,*)]) to eventually defined sequences in π_i Qmot[U]. Its composite with the Tate unit is the constant sequence, it kills the basepoint summand, and its other composite becomes the identity using Tate interchange.

**Hypotheses and conventions.** A sequence is identified after restricting to all sufficiently large integers N. Use étale multivalued spaces with finite geometric fibres and multiplicities; these étale spaces may be nonseparated as points collide.

**Construction or proof.**

1. Represent a class on a closed annulus times a subdivided simplicial sphere using the explicit-free formula. Form Y₁ from the Nth-root-of-unity discs and Y₂ from p₁^N=p₂ in the multivalued graph. For sufficiently large N both fibre over étale spaces with finite geometric fibres and open-ball fibres; the étale spaces need not be separated.
2. Sum the induced maps to N[U] with multiplicities and take their difference. On the unit image the counts are N and N−1, hence the difference is one; on the basepoint summand they coincide.
3. Check invariance under all representing homotopies and refinements. Use the noncoherent swap lemma twice to prove the other composite is the identity.

**Acceptance.** Check N−(N−1)=1 including residue-characteristic multiplicities. No claim that a fixed N works for every homotopy class. Allow the nonseparated étale spaces needed at collisions; finiteness of geometric fibres does not make these finite étale morphisms.

**Direct prerequisites.** [BM.4/explicit-free](#explicit-free), [BM.4/transfers](#transfers), [BM.3/annulus-compactness](#annulus-compactness), [BM.5/tate-permutation](#tate-permutation), `TropicalAndBerkovichArithmetic:TB.1/gauss-line-and-discs`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §7, proof of Theorem 7.1, pp. 41–43. The eventual-sequence construction gives both inverse identities and handles multiplicity collisions.

<a id="cancellation"></a>

### Cancellation over any base

**Theorem — `BM.5/cancellation`.** For every small arc-stack X, tensoring by Z(1):Deff_mot(X)→Deff_mot(X) is fully faithful; equivalently M→Hom(Z(1),M⊗Z(1)) is an equivalence for every effective M.

**Hypotheses and conventions.** There is no field or smoothness assumption on X.

**Construction or proof.**

1. Use the annulus model and proper base change to compare the relevant internal Homs with ambient derived sheaves. Restrict to strict bases; compactness of Tate reduces to their geometric stalks.
2. At the complex point Tate is the unit; with torsion coefficients apply the torsion étale comparison. In the rational nonarchimedean case apply the explicit eventual inverse on free generators. Combine rational and torsion tests integrally and descend.

**Acceptance.** Prove the adjunction unit equivalence, not only injectivity on π₀. After cancellation, deduce homotopy-coherent triviality of the symmetric-group actions using the discrete endomorphism space of the unit.

**Direct prerequisites.** [BM.5/rational-cancellation-inverse](#rational-cancellation-inverse), [BM.5/tate-permutation](#tate-permutation), [BM.3/annulus-compactness](#annulus-compactness), [BM.1/proper-base-change](#proper-base-change), [BM.4/torsion-comparison](#torsion-comparison), [BM.2/free-motives](#free-motives).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §7, Theorem 7.1 and Remark 7.2, pp. 40–43; §1, Theorem 1.9, p. 6. The pointwise proof and compact Tate object establish cancellation over arbitrary small arc-stacks.

**Atlas planet:** Cancellation theorem.

<a id="projective-cells"></a>

### Symmetric powers and projective motives

**Theorem — `BM.5/projective-cells`.** For n≥0, Symⁿ(Q(1))≃Q(n). The cofiber of Zmot[Pⁿ⁻¹]→Zmot[Pⁿ] is Z(n)[2n] for n≥1. There is a canonical decomposition Qmot[BG_m]≃⊕_{n≥0}Q(n)[2n]; Pⁿ maps to the summands with 0≤i≤n through the class of O(1).

**Hypotheses and conventions.** The splitting asserted here is rational; the cell cofiber is integral. BG_m free motives use left Kan extension from smooth charts.

**Construction or proof.**

1. Use coherent Tate symmetry after cancellation to identify rational symmetric powers. Construct the projective cell cofibers using the affine chart and A¹-fibration over Pⁿ⁻¹.
2. Animate the augmentation-ideal filtration on the group algebra of a 1-connective abelian group. Its graded terms have increasing connectivity. The projective cell filtration splits it and proves convergence to the displayed direct sum.

**Acceptance.** P⁰ maps to the n=0 unit summand; P¹ has the two expected summands. The result is a direct sum, not an unverified product decomposition.

**Direct prerequisites.** [BM.5/cancellation](#cancellation), [BM.5/tate-permutation](#tate-permutation), [BM.3/tate](#tate), [BM.2/free-motives](#free-motives), `EnhancedDerivedSheaves:E5:animation`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §8, Corollaries 8.1–8.2 and proof, p. 44. Symmetry and increasing connectivity identify the classifying-space motive and its finite projective truncations.

**Atlas planet:** Projective Tate cells.

## BM.6 — Motivic K-theory and Adams weights

Construct spectral motivic K-theory and prove its rational classifying-space comparison and canonical direct-sum Adams splitting.

**Worked example.** The rational P² motive is the sum of weights Q, Q(1)[2] and Q(2)[4]. The corresponding three-stage piece of the classifying-space and K-theory filtration has ψ²-eigenvalues 1,2,4. Writing ψ for ψ², the three idempotents on this finite piece are (ψ−2)(ψ−4)/3, −(ψ−1)(ψ−4)/2 and (ψ−1)(ψ−2)/6. Their values on the three eigenvalues are respectively (1,0,0), (0,1,0) and (0,0,1). This explains how Adams operations make the splitting canonical. Passage to all weights uses increasing connectivity of the filtration, which is the reason the final formula is a direct sum.

<a id="motivic-k"></a>

### Spectral motivic K-theory

**Construction — `BM.6/motivic-k`.** Let Kcn(A) be the connective K-theory spectrum of the underlying abstract ring, obtained by E-infinity group completion of finite projective modules. Define Kmot as its universal ball-invariant arc-sheaf of spectra. Kmot is finitary and has its induced E-infinity ring structure.

**Hypotheses and conventions.** This integral object is spectrum-valued, not an object of D(Z) by definition. The spectral ball-localization uses the same site and test balls.

**Uses.** BM.6 Adams splitting: Compares rational K-theory with Tate weights. BM.7 one-unit cofiber: Supplies the universal comparison map for explicit evaluations.

**API.**

- `motivic_k_universal` (universal-property): Maps from Kmot to a local spectral sheaf correspond to maps from Kcn.
- `motivic_k_multiplication` (structure): The map from Kcn is multiplicative and Kmot is an E-infinity ring sheaf.
- `motivic_k_finitary` (compatibility): Evaluation on the strict basis commutes with filtered colimits.

**Checks.**

- **Check `rank_unit`** (computation): A rank-one free module maps to the multiplicative unit and rank-zero to zero.
- **Check `ball_local`** (characterisation): Kmot(A)→Kmot(A⟨T⟩₁) is an equivalence although Kcn need not have this property.
- **Check `complex_rational`** (computation): At the complex point Kmot⊗Q is ⊕_{n≥0}Q[2n], so it is not merely the degree-zero rank sheaf.

**Construction or proof.**

1. Import the connective multiplicative ring K-theory model from K.2:plus with the precise group-completion enhancement requested there.
2. Use the Breen–Deligne resolution contract requested from E5:animation to resolve the sheafified group completion by classifying spaces of products of GL_n, and these by GL_n charts. Their free ball-invariant spectral sheaves are finitary by the free-domain theorem.
3. Apply symmetric monoidal spectral localization to obtain the universal E-infinity structure.

**Acceptance.** The map Kcn→Kmot is universal among ball-invariant arc-sheaves of spectra. Do not replace the integral spectrum by ordinary chain complexes.

**Direct prerequisites.** `GeneralAlgebraicKTheory:K.2:plus`, [BM.2/ball-localization](#ball-localization), [BM.2/free-motives](#free-motives), `EnhancedDerivedSheaves:E5:animation`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §8, Definition 8.3 and Proposition 8.4, pp. 44–45. Spectral group completion and the GL-chart resolution establish finitarity before rationalization.

**Atlas planet:** Motivic K-theory.

<a id="flag-invariants"></a>

### Rational flag invariants

**Lemma — `BM.6/flag-invariants`.** The Σ_n-invariants in Qmot[GL_n/G_m^n], with the permutation action of the normalizer, are Q[0].

**Hypotheses and conventions.** n≥1 and coefficients are rational so finite-group invariants are direct summands.

**Construction or proof.**

1. Induct on n: Σ_{n−1}-invariants identify with Qmot[Pⁿ⁻¹] via the smooth projection and the preceding flag fibre.
2. Use cancellation to make endomorphisms of its finite Tate decomposition upper triangular with rational diagonal. The required classical flag realization, requested in the MC.2 direction, identifies which diagonal entries of the averaging idempotent are one: precisely the degree-zero entry.

**Acceptance.** Verify n=1 directly and n=2 using the two Tate cells of P¹. Record the realization input rather than asserting arbitrary realizations are conservative.

**Direct prerequisites.** [BM.5/projective-cells](#projective-cells), [BM.5/cancellation](#cancellation), [BM.2/effective-adjoints](#effective-adjoints), `MotivesAndAlgebraicCycles:MC.2`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §8, proof of Proposition 8.5, pp. 45–46. The flag calculation reduces rational K-theory to the maximal torus and fixes the averaging idempotent.

<a id="k-adams"></a>

### Canonical rational motivic K-splitting

**Theorem — `BM.6/k-adams`.** The multiplicative line-bundle map Qmot[BG_m]→Kmot⊗Q is an equivalence. The separated descending motivic filtration has graded pieces Q(n)[2n] for n≥0 and is canonically split by Adams operations: ψ² acts as 2ⁿ on weight n, giving Kmot⊗Q≃⊕_{n≥0}Q(n)[2n].

**Hypotheses and conventions.** General ring E-infinity Adams functoriality is the requested S.6 extension; its existing regular-scheme API alone is insufficient.

**Construction or proof.**

1. Use the normalizer of the maximal torus and the rational flag-invariant calculation to compare the GL_n classifying spaces to the symmetric algebra of BG_m. Pass to group completion.
2. Transfer the convergent augmentation filtration from BG_m. Distinct eigenvalues 2ⁿ give canonical weight projectors compatible with finite stages; increasing connectivity identifies the colimit splitting with the direct sum.

**Acceptance.** Check ψ² has eigenvalues 1,2,4 in the first three weights. State multiplication sends weights (m,n) to m+n.

**Direct prerequisites.** [BM.6/motivic-k](#motivic-k), [BM.6/flag-invariants](#flag-invariants), [BM.5/projective-cells](#projective-cells), `SchemeKTheoryOperations:S.6`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §8, Proposition 8.5 and Corollary 8.6, pp. 45–46; §1, Theorem 1.7(i)–(ii), p. 5. The rational comparison is split by distinct Adams eigenvalues, not by a noncanonical chosen basis.

**Atlas planet:** Motivic Adams splitting.

## BM.7 — The K-theory of one-units

Construct and identify the one-unit K-cofibre under root hypotheses, prove its field E-infinity refinement, perfectoid and general analytic descent, and the smooth-completion rational comparison.

**Worked example.** For an algebraically closed nonarchimedean C with valuation ring O_C and residue field k, nonunital excision identifies K(C<1) with fib(K(O_C)→K(k)). The cofiber E_K(C) consequently sits in the triangle K(O_C)→K(C)⊕K(k)→E_K(C). If k has characteristic p, the requested p-completed comparison K(O_C)^∧p≃K(C)^∧p cancels the first summand, giving E_K(C)^∧p≃K(k)^∧p≃Z_p. Away from p, E_K identifies with Kmot. Arithmetic fracture glues these algebra structures using rank on the overlap. The integral algebra structure therefore needs more than the abstract fact that E_K is a cofiber.

<a id="unit-k-cofiber"></a>

### One-unit K-cofiber

**Construction — `BM.7/unit-k-cofiber`.** For a nonarchimedean uniform Banach ring A admitting a topologically nilpotent unit T with a compatible unbounded sequence of roots, set I=A<1. Import its Tor-unital almost-module K-theory K(I) from RT.5 and define E_K(A)=cofib(K(I)→K(A)); define E_Kcn similarly using connective covers. E_K commutes with completed filtered colimits within this root-admitting class. On totally disconnected A, E_Kcn≃E_K.

**Hypotheses and conventions.** The root data are retained through the diagrams used for continuity. K(I) is the unitization-independent nonunital K-theory, not K₀ of the abstract group 1+I.

**Uses.** BM.7 explicit evaluation: Identifies motivic K-theory at strict bases and geometric fields. BM.11 algebraic comparison: The support exact sequence supplies the extra Laurent-series summand.

**API.**

- `unit_k_natural` (functoriality): A root-compatible contractive map induces a natural map of cofiber sequences.
- `unit_k_unitization` (compatibility): Replacing Z⊕I by another unitization leaves K(I) and E_K canonically unchanged.
- `unit_k_continuity` (structure): The cofiber commutes with completed filtered colimits in the stated class.

**Checks.**

- **Check `zero_ideal`** (degenerate): For I=0, the nonunital K-term is zero and the cofiber is K(A).
- **Check `field_model`** (compatibility): For a valued field C, K(I)=fib(K(O_C)→K(k)), with the maps to K(C) retained.
- **Check `root_guard`** (non-example): For A=Q_p, I=pZ_p has I/I²≃F_p, so Tor₁ over Z⊕I of the two augmentation modules Z is nonzero. This A lacks arbitrarily deep roots of a pseudouniformizer and does not satisfy this Tor-unital root-admitting construction.

**Construction or proof.**

1. Use the RT.5 flat idempotent ideal/almost-category theorem and the K.5 excision contract to identify the nonunital K-spectrum, independent of an ambient unitization.
2. Set B=Z⊕I and localize at T. TT invariance of supported perfect complexes under derived closed-fibre-preserving completion gives completed continuity after taking the cofiber. For totally disconnected rings reduce to fields and use the missing valuation-ring connective/nonconnective contract recorded as a gap.

**Acceptance.** Check independence of unitization. Verify the derived closed fibre hypothesis before invoking TT.

**Direct prerequisites.** [BM.3/one-units](#one-units), `RefinedTraceMethods:RT.5/almost-module-k`, `RefinedTraceMethods:RT.5/continuous-extension`, `GeneralAlgebraicKTheory:K.5`, `SchemeKTheoryOperations:S.3/derived-closed-base-change-excision`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.7/invariance-under-filtered-colimits-and-products`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §8, discussion before Proposition 8.7 and Proposition 8.8, pp. 46–47. The imported almost-category theorem defines the nonunital term and completion invariance gives continuity.

**Atlas planet:** One-unit K-cofiber.

<a id="analytic-kh"></a>

### Root-free analytic KH-cofiber

**Theorem — `BM.7/analytic-kh`.** For every analytic nonarchimedean Banach ring A the root-free homotopy K-theory cofiber E_KH(A)=cofib(KH(A<1)→KH(A)) is an analytic sheaf. If all sheaves on M(A) are Postnikov complete, E_KH(A)⊗Q is finitary, ball-invariant, arc-hypercomplete and equals Kmot(A)⊗Q. For totally disconnected A this is E_K(A)⊗Q.

**Hypotheses and conventions.** The definition of the relative KH term uses its truncating/ideal-independent model and ball localization; it does not assume the raw ideal was Tor-unital. The needed general KH cdh-descent supplier has no live routed roadmap; this contract is a recorded gap.

**Construction or proof.**

1. Import KH as the A¹-invariant version of nonconnective K-theory and its truncating property through the K.5 request. Noetherian approximation reduces analytic descent to formal models and admissible blowups.
2. Use the missing general cdh-descent theorem for KH. The pro-cdh theorem followed by ball localization is an alternative proof route recorded in the same ownership gap, rather than an extra simultaneous requirement.
3. Use rational finite étale traces and Postnikov convergence as in the perfectoid argument. The valuation-ring A¹-invariance contract gives the ball calculation and the replacement of KH by K on totally disconnected bases.

**Acceptance.** Keep both the root-free scope and the Postnikov restriction on the rational identification. Do not replace integral KH cdh descent by a height-one-localized K-theory statement.

**Direct prerequisites.** `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.5`, `GeneralAlgebraicKTheory:K.7/invariance-under-filtered-colimits-and-products`, [BM.1/finitary-descent](#finitary-descent), `EnhancedDerivedSheaves:E2`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §8, Theorem 8.13 and proof, pp. 49–50. The truncating KH model removes the root hypothesis and formal-model descent supplies the analytic sheaf property.

**Atlas planet:** Analytic KH-cofiber descent.

<a id="unit-k-vanishing"></a>

### One-unit connective K-theory contracts

**Theorem — `BM.7/unit-k-vanishing`.** The universal ball-invariant arc-sheaf under A↦Kcn(A<1) is zero on the root-admitting nonarchimedean class.

**Hypotheses and conventions.** Use the same nonunital and connective-cover conventions as E_K.

**Construction or proof.**

1. Choose the functorial unitization Z⊕A<1. The map GL_n(Z⊕A<1)→GL_n(Z) has ball-contractible fibres by scaling the infinitesimal matrix part.
2. Apply group-completion resolution and ball localization to kill its relative connective K-theory.

**Acceptance.** Check contraction preserves invertibility throughout the unit ball.

**Direct prerequisites.** [BM.7/unit-k-cofiber](#unit-k-cofiber), [BM.6/motivic-k](#motivic-k), [BM.2/ball-localization](#ball-localization).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §8, Proposition 8.7, p. 47. Matrix fibres exhibit the contraction of the discarded connective K-term.

<a id="perfectoid-k-descent"></a>

### Perfectoid analytic K-cofiber descent

**Theorem — `BM.7/perfectoid-k-descent`.** For perfectoid A with |p|_A<1, E_K(A) is an analytic sheaf. If all sheaves on M(A) are Postnikov complete, E_K(A)⊗Q is the value of a finitary ball-invariant arc-hypersheaf and equals Kmot(A)⊗Q.

**Hypotheses and conventions.** Retain the Postnikov hypothesis for the rational identification, not for analytic descent itself.

**Construction or proof.**

1. Identify fib(K(A<1)→K(A)) with continuous K-theory of torsion almost A≤1-modules using two Verdier sequences.
2. Closed subsets yield idempotent complete almost algebras; localization on two closed pieces gives a categorical excision square. Continuous K-theory sends this to a pullback, proving analytic descent.
3. Rational trace descent gives profinite étale descent. Use Postnikov completeness to compare the analytic/profinite reconstruction with arc-hypersheafification. Perfectoid-ball invariance reduces by support excision to the valuation-ring A¹-invariance contract recorded as a gap.

**Acceptance.** Finite covering dimension of M(A) is a sufficient Postnikov condition through the requested E2 theorem. Do not claim analytic descent alone proves unbounded arc-hyperdescent.

**Direct prerequisites.** [BM.7/unit-k-cofiber](#unit-k-cofiber), `RefinedTraceMethods:RT.5/continuous-extension`, `RefinedTraceMethods:RT.5/almost-module-k`, [BM.4/effective-tilting](#effective-tilting), [BM.1/finitary-descent](#finitary-descent), `EnhancedDerivedSheaves:E2`, `DiamondsAndVStacks:D1`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §8, Theorem 8.11, Corollary 8.12 and proof, pp. 48–49. Torsion almost modules give analytic descent; the rational arc comparison needs Postnikov convergence.

**Atlas planet:** Perfectoid K-cofiber descent.

<a id="smooth-completion-k"></a>

### Smooth-completion motivic K-comparison

**Theorem — `BM.7/smooth-completion-k`.** If C is a nondiscrete algebraically closed nonarchimedean field and A is a Banach C-algebra such that A≤1 is the completion of a smooth O_C-algebra, then Kmot(A)⊗Q≃cofib(K(A<1)→K(A))⊗Q, naturally in A.

**Hypotheses and conventions.** The hypothesis is on the actual ring of elements of norm at most one, not merely the existence of some unrelated smooth model. The root-admitting interpretation of K(A<1) uses the roots available from the algebraically closed coefficient field.

**Construction or proof.**

1. Apply analytic KH-cofiber descent to the smooth formal model. Use the valuation-ring homotopy-invariance and smooth-model K/KH comparison contract recorded in the supplier gap to replace the relative KH-cofiber by the K-cofiber.
2. Use TT to compare the supported terms through completion. Establish the finite-dimensional spectral/Postnikov hypothesis on the smooth affinoid before invoking the rational arc comparison. The result is precisely the cofiber formula displayed in the statement.

**Acceptance.** State and verify Kmot(A)_Q≃E_K(A)_Q with the natural map from connective K(A); do not interchange the source and target of the nonunital inclusion. Check the case A=C and the closed unit ball of a smooth formal O_C-model.

**Direct prerequisites.** [BM.7/analytic-kh](#analytic-kh), `SchemeKTheoryOperations:S.3/derived-closed-base-change-excision`, `TropicalAndBerkovichArithmetic:TB.0/affinoid-algebras`, [BM.1/proper-dimension](#proper-dimension), `EnhancedDerivedSheaves:E2`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §1, Theorem 1.7(iv), p. 5; §8, Proposition 8.8 and Theorem 8.13, pp. 47, 49–50. The smooth formal-model formula is obtained from the supported K-theory square and completion.

<a id="strict-k-formula"></a>

### Explicit motivic K-theory on strict bases

**Theorem — `BM.7/strict-k-formula`.** Fix a set S of primes. On nonarchimedean strict A with |ℓ|≥1 everywhere for every prime ℓ∉S, E_K(A)[1/S] is finitary, ball-invariant and an arc-sheaf of spectra, and equals Kmot(A)[1/S]. In particular for nondiscrete algebraically closed nonarchimedean C of residue-characteristic exponent p, Kmot(C)≃E_K(C)[1/p], with p=1 in residue characteristic zero.

**Hypotheses and conventions.** The spectral field formula uses the geometric root property; no arbitrary Banach-ring integral formula is asserted.

**Construction or proof.**

1. Use one-unit connective K-vanishing and continuity to compare E_Kcn with the universal localized object.
2. Torsion field invariance uses Gabber–Suslin rigidity: the available L.2 request handles its henselian part, and the full geometric contract is the recorded missing Part-II supplier.
3. Rationally use perfectoid descent for |p|<1, and the KH analytic-descent route for equal characteristic zero. Combine rational and torsion data and apply the strict-basis hypersheaf criterion.

**Acceptance.** When residue characteristic is zero, [1/p] is the identity. The prime set is controlled pointwise over the entire strict base.

**Direct prerequisites.** [BM.7/unit-k-vanishing](#unit-k-vanishing), [BM.7/unit-k-cofiber](#unit-k-cofiber), [BM.7/perfectoid-k-descent](#perfectoid-k-descent), [BM.7/analytic-kh](#analytic-kh), [BM.4/torsion-comparison](#torsion-comparison), `KTheoryFiniteLocalFields:L.2`, [BM.1/finitary-descent](#finitary-descent).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §8, Theorem 8.9 and proof, pp. 47–49; §1, Theorem 1.7(iii), p. 5. The cofiber identifies the universal sheaf after exactly the necessary prime inversion.

**Atlas planet:** Explicit motivic K-theory.

<a id="field-cofiber-ring"></a>

### Integral field-cofiber E-infinity structure

**Theorem — `BM.7/field-cofiber-ring`.** For a nondiscrete algebraically closed nonarchimedean field C, E_K(C) without inverting the residue characteristic has a natural E-infinity K(C)-algebra structure.

**Hypotheses and conventions.** This conclusion equips a cofiber with an additional structure; it does not come from a general rule assigning ring structures to cofibers.

**Construction or proof.**

1. Away from p use the equivalence with Kmot. For residue characteristic p>0 request K(O_C)^∧p≃K(C)^∧p and K(k)^∧p≃Z_p for perfect k; these imply E_K(C)^∧p≃Z_p.
2. The overlap map to Q_p is rank followed by the scalar inclusion. Glue the two E-infinity K(C)-algebras by arithmetic fracture. If the residue characteristic exponent is 1 only the first piece is needed.

**Acceptance.** Check compatibility on the overlap as maps of algebras, not only homotopy groups.

**Direct prerequisites.** [BM.7/strict-k-formula](#strict-k-formula), `KTheoryFiniteLocalFields:L.5`, `EnhancedDerivedSheaves:E5:presentability`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §8, Corollary 8.10 and proof, pp. 47–48. Prime inversion and p-completion glue to an integral cofiber algebra through the rank map.

**Atlas planet:** Integral field-cofiber algebra.

## BM.8 — Stable motives and six operations

Invert the Tate object coherently, prove projective-line duality and affine pushforward, and apply the abstract six-functor construction to small arc-stacks, including stable tilting.

**Worked example.** At the usual complex point, Tate is Z, so the motive of P¹ is Z⊕Z[2]. The right adjoint gives f_*Z=RΓ(P¹,Z)=Z⊕Z[−2]. Projective-line duality predicts f♯Z≃(f_*Z)⊗Z(1)[2], which here is Z[2]⊕Z, agreeing with the free P¹ motive after reordering. Both the shift [2] and the Tate factor are fixed by this identity. In a nonarchimedean fibre Tate is Gbar_m[−1], so omitting it would no longer pass this calculation under base change.

<a id="stable"></a>

### Stable motivic sheaves

**Construction — `BM.8/stable`.** Dmot(X)=Deff_mot(X)[Z(1)⊗−1] is the symmetric monoidal presentable stable infinity-category universally inverting Tate. It is the colimit of successive Tate tensor functors in PrL and equivalently the limit of internal-Hom functors: objects are sequences (M_n) with M_n≃Hom(Z(1),M_{n+1}). The map Deff_mot(X)→Dmot(X) is fully faithful.

**Hypotheses and conventions.** X is any small arc-stack. Coherent Tate symmetry is supplied after cancellation, before applying tensor inversion.

**Uses.** BM.8 six operations: Makes the projective-line duality twist invertible. BM.9–BM.11: Hosts rigid categories, algebraic étale comparison and nearby cycles.

**API.**

- `stable_universal` (universal-property): A colimit-preserving symmetric monoidal functor out of Deff with invertible Tate factors uniquely through Dmot.
- `stable_twists` (structure): For all integers m,n the twists satisfy Z(m)⊗Z(n)≃Z(m+n).
- `stable_effective_embedding` (compatibility): The canonical functor from effective motives is fully faithful and compatible with pullback.

**Checks.**

- **Check `complex_stable`** (compatibility): At the complex point stabilization does not change D(Z), since Tate is the unit.
- **Check `inverse_twist`** (computation): Z(1)⊗Z(−1)≃Z, a negative twist that need not exist effectively.
- **Check `effective_sequence`** (compatibility): The image of M has nth term M(n), with the bonding equivalence provided by cancellation.

**Construction or proof.**

1. Deduce coherent permutation triviality from cancellation and the discrete endomorphism space of the unit, then apply the existing formal-inversion theorem.
2. Use the colimit/adjoint-limit comparison in presentable categories to obtain the sequence model. Cancellation identifies an effective M with the sequence M(n), proving full faithfulness.

**Acceptance.** Verify the sequence bonding maps have Hom(Z(1),−), not tensor by Z(1).

**Direct prerequisites.** [BM.2/effective](#effective), [BM.3/tate](#tate), [BM.5/cancellation](#cancellation), [BM.5/tate-permutation](#tate-permutation), `EnhancedDerivedSheaves:E5:abstract/formal-tensor-inversion`, `EnhancedDerivedSheaves:E5:presentability/tensor-product-and-module-base-change`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §9, Definition 9.1, p. 50. Coherent inversion and cancellation identify the stable category and its effective subcategory.

**Atlas planet:** Stable motivic sheaves.

<a id="projective-duality"></a>

### Projective-line duality

**Theorem — `BM.8/projective-duality`.** For f:P¹_X→X, f♯≃f_*⊗Z(1)[2] on Dmot(P¹_X). Consequently f_* has the stable projection formula.

**Hypotheses and conventions.** X is any small arc-stack; f♯ is the effective smooth adjoint extended to the stabilization.

**Construction or proof.**

1. Construct the unit from the G_m-torsor O(Δ) on P¹×_X P¹, trivialized off the diagonal. Construct the counit using reduced P¹-cohomology and the invertible Tate object.
2. Check both triangle identities after restriction to affine-chart generators and geometric fibres; the remaining endomorphism is the identity on the unit by the explicit reduced G_m computation.

**Acceptance.** Track both [2] and Z(1). Explain why this assertion does not contradict the effective-category counterexample.

**Direct prerequisites.** [BM.8/stable](#stable), [BM.2/effective-adjoints](#effective-adjoints), [BM.3/tate](#tate), [BM.1/finitary-excision](#finitary-excision), [BM.5/projective-cells](#projective-cells).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §9, Proposition 9.3 and proof, pp. 51–52. Diagonal and reduced-cohomology maps yield the duality adjunction.

**Atlas planet:** Projective-line duality.

<a id="stable-tilt"></a>

### Stable motivic tilting

**Theorem — `BM.8/stable-tilt`.** If |p|<1 everywhere on a small arc-stack X, there is a symmetric monoidal equivalence Dmot(X)≃Dmot(X♭) compatible with effective motives and Tate twists.

**Hypotheses and conventions.** Use the same tilted-site construction as effective tilting.

**Construction or proof.**

1. Transport the reduced multiplicative-group description through tilting and identify the Tate object.
2. Apply the universal property of tensor inversion to the effective equivalence and its inverse.

**Acceptance.** Check the equivalence carries Z(n) to Z(n) for negative as well as positive n.

**Direct prerequisites.** [BM.4/effective-tilting](#effective-tilting), [BM.8/stable](#stable), [BM.3/tate](#tate).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §9, Proposition 9.7, pp. 52–53. Effective tilting preserves the object inverted in stable motives.

**Atlas planet:** Stable tilting.

<a id="stable-affine-push"></a>

### Stable affine pushforward

**Theorem — `BM.8/stable-affine-push`.** For f:Marc(B)→Marc(A) of finite cohomological dimension, if Marc(B) embeds into a finite-dimensional ball over Marc(A), then f_* on stable motives preserves all colimits, commutes with every base change and satisfies the projection formula. The same holds arc-locally on the target for such maps.

**Hypotheses and conventions.** The embedding and finite-dimension hypotheses are explicit; the broader proper result follows after point rigidity.

**Construction or proof.**

1. Apply effective proper base change levelwise in the sequence model of stabilization.
2. Reduce the projection formula to geometric fields and then to a one-dimensional ball. Embed it in P¹ and apply projective-line duality and open/closed excision. Descend the resulting identity.

**Acceptance.** Check each level of the stable sequence is preserved by pushforward.

**Direct prerequisites.** [BM.8/stable](#stable), [BM.8/projective-duality](#projective-duality), [BM.1/proper-base-change](#proper-base-change), [BM.1/finitary-excision](#finitary-excision).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §9, Theorem 9.2 and proof, pp. 50–51. The stable projective-line calculation upgrades the affine proper projection formula.

**Atlas planet:** Stable proper pushforward.

<a id="six-operations"></a>

### Six operations on small arc-stacks

**Theorem — `BM.8/six-operations`.** The assignment X↦Dmot(X) extends to a six-functor formalism on small arc-stacks for the class of !-able maps constructed by the abstract extension theorem from finite-cohomological-dimension affine maps. Open immersions are !-able with j_! left adjoint to j*. Étale maps, meaning finitary maps with finite geometric fibres, are cohomologically étale. Smooth boundaryless maps of analytic K-spaces are cohomologically smooth.

**Hypotheses and conventions.** Do not assert every map is !-able. For the analytic smooth statement K is a nondiscrete Banach field and the morphism is without boundary.

**Construction or proof.**

1. Apply the AS.0 construction principle and its extension theorem to the affine pushforward data, verifying the base-change, projection and descent axioms from BM.1–BM.8.
2. Exhaust |a|<1 by affine |a|≤c pieces to compute j_!. Étale maps reduce to finite fibres and the smooth case reduces to affine space/P¹ duality on local charts.

**Acceptance.** Export adjunctions, projection, base change, composition and localization as coherent functorial identities. Keep boundaryless smoothness in the statement of analytic duality.

**Direct prerequisites.** [BM.8/stable-affine-push](#stable-affine-push), [BM.8/projective-duality](#projective-duality), [BM.1/finitary-excision](#finitary-excision), [BM.1/finitary-maps](#finitary-maps), `AnalyticStacks:AS.0`, `TropicalAndBerkovichArithmetic:TB.0/analytic-spaces`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §9, Propositions 9.4–9.5, Corollary 9.6, p. 52. The abstract construction is imported; this target verifies and applies it to Berkovich motives.

**Atlas planet:** Motivic six operations.

## BM.9 — Rigidity and mixed Tate sheaves

Prove compact generation at nondiscrete geometric points, relative rigidity, quasi-pro-étale monadicity and weak categorical Künneth. Construct the pointwise Artin–Tate subcategory and prove arc-descent and rigidity.

**Worked example.** Let X be the disjoint union of two usual complex points. Its motivic category is D(Z)×D(Z), with unit (Z,Z) and componentwise tensor. The two clopen-extension objects (Z,0) and (0,Z) are compact dualizable generators. The diagonal unit generates both, because each is an idempotent summand of it. Hence the pointwise mixed Tate condition gives DMT(X)=Dmot(X) in this case. This verifies strict-base global Tate generation and the compactness of the unit in a finite-product example. Relative rigidity over a general analytic base uses compact morphisms and trace-class exhaustions; the finite-product computation does not impose compact generation on that conclusion.

<a id="geometric-rigidity"></a>

### Compact generators at geometric points

**Theorem — `BM.9/geometric-rigidity`.** For a nondiscrete algebraically closed Banach field C, Dmot(C) is compactly generated with compact unit and compact objects exactly the dualizable objects. In equal characteristic, given a splitting k→C of its residue field, the Zmot[X_C](−j), for X smooth projective over k and j≥0, are compact generators. The discrete algebraically closed case is supplied by BM.10.

**Hypotheses and conventions.** The good-reduction generator description requires both equal characteristic and the chosen splitting.

**Construction or proof.**

1. Use stable tilting to reduce to equal characteristic. Proper smooth duality shows the displayed generators are dualizable; the unit is compact, so they are compact.
2. Detect a vanishing motive by induction on topological transcendence degree of geometric field extensions. Type-(4) points reduce by balls and type-(3) by annuli and Tate twists.
3. For the remaining residue-transcendence case use smooth finite-type models and the L5 alterations theorem to produce projective compactifications with normal-crossing boundary after alteration. Trace descent and localization reduce to lower dimension. Do not replace alterations by resolution of singularities.

**Acceptance.** Verify the torsion subcategory is detected by the unit before doing the rational induction. Use compact=dualizable only after proving the unit compact.

**Direct prerequisites.** [BM.8/stable-tilt](#stable-tilt), [BM.8/six-operations](#six-operations), [BM.3/annulus-compactness](#annulus-compactness), [BM.2/free-motives](#free-motives), `AdicCoefficientsAndComparisons:L5`, `TropicalAndBerkovichArithmetic:TB.1/gauss-line-and-discs`, `EnhancedDerivedSheaves:E5:presentability/rigid-presentable-categories`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §10, Proposition 10.1 and proof, p. 53. Good-reduction projective generators are obtained by geometric-field induction and alterations.

**Atlas planet:** Geometric-point rigidity.

<a id="compact-factorizations"></a>

### Compact morphisms of relative motives

**Lemma — `BM.9/compact-factorizations`.** If X is analytic affine of finite cohomological dimension, or satisfies the qcqs fibre hypotheses of the relative-rigidity target, and U⊂V⊂Aⁿ_X are open with U→V factoring through a quasicompact subset K, then Zmot[U]→Zmot[V] is a compact morphism. Such maps and their negative Tate twists provide compact-morphism exhaustions of generators, and tensor products of generating compact morphisms are compact.

**Hypotheses and conventions.** Compact morphism is the E5 categorical notion, not a synonym for having compact source and target.

**Construction or proof.**

1. The induced map on mapping functors factors through evaluation at K, which preserves filtered colimits by finite-dimensional continuity.
2. Exhaust each open V by relatively compact U and use open affine-domain generation. In the general one-point quotient case use the profinite quotient argument of ECD 21.9 through the C8 request and invariant open domains. Tensor products correspond to products of these strict inclusions.

**Acceptance.** Check generators are exhausted by compact transitions even when the generators themselves are not compact.

**Direct prerequisites.** [BM.2/free-motives](#free-motives), `EnhancedDerivedSheaves:E5:presentability/compact-morphisms`, `EnhancedDerivedSheaves:E5:presentability/strongly-continuous-filtered-colimits`, [BM.1/proper-base-change](#proper-base-change), `DiamondEtaleCohomology:C8`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §10, proof of Proposition 10.3, pp. 54–55. Strict domain inclusions provide the compact morphisms needed for compact assembly.

<a id="qproet-monadic"></a>

### Quasi-pro-étale monadicity

**Theorem — `BM.9/qproet-monadic`.** For a proper quasi-pro-étale f:Y→X, f_* induces Dmot(Y)≃Mod_{f_*Z}(Dmot(X)). If Y=lim_i Y_i is a cofiltered limit of such maps, then Dmot(Y)≃colim_i Dmot(Y_i) in presentable stable categories.

**Hypotheses and conventions.** No surjectivity assumption is needed; the relevant conservative functor is f_* on source objects.

**Construction or proof.**

1. Fibres are profinite sets, so f has cohomological dimension zero, colimit-preserving pushforward and projection. Global sections on profinite fibres detect source objects, proving f_* conservative.
2. Apply the exact Barr–Beck–Lurie criterion and identify the monad by projection. Finitarity gives f_*Z=colim_i f_i*Z; the E5 module-base-change theorem gives the categorical colimit.

**Acceptance.** Identify which adjoint is conservative. For an empty fibre the module category over the zero algebra is the zero category.

**Direct prerequisites.** [BM.8/stable](#stable), [BM.1/proper-base-change](#proper-base-change), [BM.0/quasi-pro-etale](#quasi-pro-etale), `EnhancedDerivedSheaves:E5:abstract/barr-beck-lurie`, `EnhancedDerivedSheaves:E5:presentability/tensor-product-and-module-base-change`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §10, Lemma 10.4, p. 55. Conservative pushforward and the projection formula identify the module category.

<a id="general-proper-push"></a>

### Proper pushforward after geometric rigidity

**Theorem — `BM.9/general-proper-push`.** For every proper 0-truncated map of locally finite cohomological dimension between small arc-stacks, stable f_* preserves colimits, commutes with arbitrary base change and satisfies the projection formula. Reapplying the AS.0 extension procedure with this proper class gives the enlarged class of !-able maps.

**Hypotheses and conventions.** The basic objects for testing !-ability remain affine arc-stacks.

**Construction or proof.**

1. Use the stable sequence model and finitary proper base change for colimits and base change locally.
2. Check projection at geometric points. At each such point the target category is compactly generated by dualizables, so linearity extends from dualizable generators to all objects. Apply the abstract extension with this verified proper class.

**Acceptance.** Do not move this projection formula before the proof of geometric-point rigidity.

**Direct prerequisites.** [BM.9/geometric-rigidity](#geometric-rigidity), [BM.1/proper-base-change](#proper-base-change), [BM.8/stable](#stable), [BM.8/six-operations](#six-operations), `AnalyticStacks:AS.0`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §10, Corollary 10.2 and its following discussion, pp. 53–54. Geometric compact generation removes the earlier finite-ball-embedding restriction.

**Atlas planet:** General proper projection.

<a id="mixed-tate"></a>

### Pointwise Artin–Tate motives

**Definition — `BM.9/mixed-tate`.** DMT(X) is the full subcategory of Dmot(X) whose pullback to every nondiscrete algebraically closed geometric point Marc(C)→X lies in the localizing stable subcategory generated by all Z(n), n∈Z. The localizing closure includes colimits, shifts and retracts.

**Hypotheses and conventions.** This is the pointwise Artin–Tate convention of Definition 10.7. At a general base it is not defined as the global closure of its Tate objects.

**Uses.** BM.9 descent: The pointwise definition must descend under geometric field extensions. BM.11 Galois stacks: The explicit Dqc models describe these subcategories.

**API.**

- `mixed_tate_fibre_test` (characterisation): Membership is precisely the stated geometric-point condition.
- `mixed_tate_pullback` (functoriality): Pullback preserves the subcategory.
- `mixed_tate_tensor` (structure): The tensor unit, Tate twists and tensor products of its objects belong to it.

**Checks.**

- **Check `tate_member`** (computation): Every Z(n) belongs for positive, zero and negative n.
- **Check `artin_member`** (compatibility): An object trivialized to sums of Tate objects by a finite étale cover belongs even when it is not globally constant.
- **Check `point_test`** (characterisation): At a nondiscrete algebraically closed point the category is exactly the localizing Tate closure, not the whole motivic category by definition.

**Construction or proof.**

1. Define the full subcategory using all geometric pullbacks and the explicitly generated fibre categories.
2. Use tensor closure of the Tate-generated point categories and base-change functoriality to obtain tensor and pullback stability.

**Acceptance.** No general stability under f_! is claimed.

**Direct prerequisites.** [BM.8/stable](#stable), [BM.9/geometric-rigidity](#geometric-rigidity), `EnhancedDerivedSheaves:E5:presentability/tensor-product-and-module-base-change`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §10.1, Definition 10.7, p. 56. The mixed Tate condition is tested geometrically, allowing Artin phenomena globally.

**Atlas planet:** Mixed Artin–Tate motives.

<a id="relative-rigidity"></a>

### Rigidity over analytic bases

**Theorem — `BM.9/relative-rigidity`.** If A is analytic of finite cohomological dimension, Dmot(Marc(A)) is rigid. More generally this holds for a qcqs arc-sheaf X of finite cohomological dimension such that each x∈|X| is the image of a quasi-pro-étale map Marc(C(x))→X from a nondiscrete algebraically closed Banach field. Here rigid has the E5 presentable-monoidal meaning, including compact unit and the trace-class criterion; compact generation is not asserted.

**Hypotheses and conventions.** The pointwise quasi-pro-étale presentation is an additional hypothesis in the general qcqs case.

**Construction or proof.**

1. Use compact-morphism generator exhaustions and the stable compact-assembly criterion to prove categorical dualizability. Finite cohomological dimension makes the unit compact.
2. At a point X=Marc(C)/G, descend compact objects together with their duals and duality maps along finite-level profinite quotients using quasi-pro-étale monadicity and the strongly continuous compact-object theorem.
3. Spread fibrewise dualizables to closed neighbourhoods. Extend their restrictions from countable unions of closed neighbourhoods by zero to obtain trace-class exhaustions, and apply the rigid-category criterion.

**Acceptance.** Verify all right adjoints in the filtered descent preserve colimits before using compact-object descent.

**Direct prerequisites.** [BM.9/compact-factorizations](#compact-factorizations), [BM.9/geometric-rigidity](#geometric-rigidity), [BM.9/qproet-monadic](#qproet-monadic), `EnhancedDerivedSheaves:E5:presentability/strongly-continuous-filtered-colimits`, `EnhancedDerivedSheaves:E5:presentability/dualizable-compactly-assembled-categories`, `EnhancedDerivedSheaves:E5:presentability/rigid-presentable-categories`, [BM.1/finitary-excision](#finitary-excision).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §10, Proposition 10.3 and proof, pp. 54–55. Compact assembly and trace-class spreading prove relative rigidity without a compact-generation claim.

**Atlas planet:** Relative motivic rigidity.

<a id="weak-kunneth"></a>

### Weak categorical Künneth

**Theorem — `BM.9/weak-kunneth`.** For X→S←Y with X,Y,S qcqs and satisfying the hypotheses of relative rigidity, exterior tensor product gives a fully faithful functor Dmot(X)⊗_{Dmot(S)}Dmot(Y)→Dmot(X×_S Y).

**Hypotheses and conventions.** Only full faithfulness is concluded; essential surjectivity is not part of this theorem.

**Construction or proof.**

1. Relative tensor products of rigid categories are rigid; reduce full faithfulness to the adjunction unit evaluated on tensor generators and then pushed to S.
2. The resulting identity is f_*M⊗g_*N≃(f×_S g)_*(M⊠N), which follows from proper-base-change/projection identities of the admitted six-functor setting, locally on these qcqs bases.

**Acceptance.** A statement replacing fully faithful by equivalence is rejected.

**Direct prerequisites.** [BM.9/relative-rigidity](#relative-rigidity), [BM.9/general-proper-push](#general-proper-push), [BM.8/six-operations](#six-operations), `EnhancedDerivedSheaves:E5:presentability/tensor-product-and-module-base-change`, `EnhancedDerivedSheaves:E5:presentability/rigid-presentable-categories`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §10, Corollary 10.6 and proof, pp. 55–56. The ordinary Künneth projection identity proves full faithfulness of the relative tensor functor.

**Atlas planet:** Weak categorical Künneth.

<a id="mixed-tate-descent"></a>

### Arc-descent and rigidity of Artin–Tate motives

**Theorem — `BM.9/mixed-tate-descent`.** X↦DMT(X) is an arc-sheaf of symmetric monoidal presentable stable categories. On strictly totally disconnected X it is generated globally by all Z(n). For X satisfying the relative-rigidity hypotheses, DMT(X) is rigid.

**Hypotheses and conventions.** Global Tate generation is asserted for strictly totally disconnected bases, not for arbitrary X.

**Construction or proof.**

1. For an algebraically closed extension C′/C compare compact presentations. A compact transition which factors through a mixed Tate object after extension descends to a finite-transcendence, finite-type algebra and a section back to C; thus the factorization already exists over C.
2. On strict bases the right adjoint to the Tate-generated inclusion preserves colimits, so its counit is an equivalence by stalks. Repeat compact/trace-class exhaustions inside this subcategory to obtain rigidity.

**Acceptance.** Use descent of compact factorizations rather than descent of a chosen arbitrary infinite presentation.

**Direct prerequisites.** [BM.9/mixed-tate](#mixed-tate), [BM.9/relative-rigidity](#relative-rigidity), `EnhancedDerivedSheaves:E5:presentability/strongly-continuous-filtered-colimits`, [BM.9/compact-factorizations](#compact-factorizations), `EnhancedDerivedSheaves:E5:presentability/rigid-presentable-categories`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §10.1, Propositions 10.8–10.10, pp. 56–57. Compact-factorization descent makes the geometric Tate condition local and rigid.

**Atlas planet:** Artin–Tate descent.

## BM.10 — Integral algebraic étale motives

Construct the presentable stable infinity-category of integral algebraic étale motives over a field and its comparison maps. For algebraically closed discrete fields prove compact dualizable generation, rational K-theory and prime-to-characteristic completed mapping formulas, and equivalence with Berkovich motives. Normalize the rational mapping spectrum by K(X)_Q^(j)[−2j], with π_i=K_{i+2j}(X)_Q^(j).

**Worked example.** Put k=F_pbar with the trivial norm and take X=Spec(k). Filtered continuity from finite fields gives K(k)_Q=Q in degree zero. The rational mapping formula therefore gives Map(Z(−j),Z)_Q=Q[0] for j=0 and zero for j≠0. After completion away from p, the same maps are Zhat_{p′}(j), with the Tate-module twist retained. Rational and finite-coefficient sectors thus behave differently; identifying them would destroy the integral comparison. The projective-line formula Zmot[P¹_k]=Z⊕Z(1)[2] fixes the common Tate normalization on its two sides.

<a id="algebraic-etale"></a>

### Integral algebraic étale motives

**Construction — `BM.10/algebraic-etale`.** For a field k, DM_et(k,Z) is the presentable Z-linear stable infinity-category generated by motives of smooth finite-type k-schemes, imposing étale descent and A¹-invariance and then inverting the reduced G_m object shifted by [−1]. Use the tensor induced by products of schemes. Its algebraic Tate object is the shifted reduced G_m motive, agreeing with the convention in BM.3.

**Hypotheses and conventions.** The construction is enhanced and presentable; it is not merely the triangulated category of bounded geometric Nisnevich motives. No unrestricted Galois hyperdescent theorem is part of the definition.

**Uses.** BM.10 comparison: Provides the exact domain of the equivalence over algebraically closed discrete k. BM.11 nearby cycles: Interprets the special-fibre objects appearing in monodromy pairs.

**API.**

- `algebraic_etale_universal` (universal-property): A colimit-preserving monoidal functor is determined by its values on smooth schemes satisfying the three stated relations.
- `algebraic_etale_tate` (structure): The Tate twist is invertible and agrees with the reduced G_m convention.
- `algebraic_etale_base_change` (functoriality): Field extension induces coherent symmetric monoidal pullback.

**Checks.**

- **Check `affine_line`** (computation): The motive of A¹_k is the unit.
- **Check `projective_line`** (computation): The motive of P¹_k is Z⊕Z(1)[2].
- **Check `positive_characteristic_torsion`** (non-example): In characteristic p its étale p-power torsion category vanishes; prime-to-p torsion is retained. A raw Nisnevich category cannot silently replace this category.

**Construction or proof.**

1. Start with enhanced derived presheaves on Sm/k, impose étale local descent and the A¹ projection equivalences by presentable monoidal localization.
2. Apply coherent Tate inversion. Use the parent geometric-motive and M.5a transfer constructions only for their actual Nisnevich/geometric range; the étale enhancement and comparison to that partial input are the present target and the explicit M.5a request.

**Acceptance.** Show the stated universal property in presentable symmetric monoidal Z-linear categories. Document the topology and enhancements in the comparison to the parent construction. For positive characteristic, retain the coefficient restrictions in the cited transfer-free comparison; Corollary 5.5.5 alone does not compare a transfer-free presentation.

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.4/effective-geometric-motives`, `MotivicEtaleKTheory:M.5a`, `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E5:abstract/verdier-quotient`, `EnhancedDerivedSheaves:E5:abstract/formal-tensor-inversion`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §11, Remark 11.2, p. 57; Cisinski–Déglise, §§2.2, 5.1, 5.5, pp. 25–27, 42–44, 53–56. The integral presentable étale category must be distinguished from the parent’s geometric triangulated Nisnevich category. [Denis-Charles Cisinski and Frédéric Déglise, *Étale motives*](https://arxiv.org/abs/1305.5361v4), §2.2, pp. 25–27; §5.1, pp. 42–44; Corollaries 5.5.5 and 5.5.7, pp. 55–56 (arXiv v4 pagination). Corollary 5.5.5 compares the with-transfer and h models over fields. Corollary 5.5.7 gives the transfer-free comparison only in characteristic zero or with 2 invertible; the full enhanced integral bridge is an explicit supplier request.

**Atlas planet:** Algebraic étale motives.

<a id="discrete-generators"></a>

### Discrete algebraically closed field generators

**Theorem — `BM.10/discrete-generators`.** For algebraically closed k with the trivial Banach norm, Dmot(k) is generated by compact dualizable Zmot[X](−j), where X is smooth projective over k and j∈Z. The unit is compact, so compact objects are precisely the dualizable ones.

**Hypotheses and conventions.** The Banach norm is trivial; do not apply the nondiscrete geometric theorem directly to k.

**Construction or proof.**

1. Let K=k((T)) with |T|=1/2. Annulus continuity identifies f_*Z for f:Marc(K)→Marc(k) with Z⊕Z(−1)[−1], a dualizable object.
2. Apply the geometric-point good-reduction argument over the completed algebraic closure of K, and descend the finite-presentation data together with Artin motives through finite extensions of K. Each finite extension is again a Laurent-series field over k, so the same split-pushforward calculation applies. This gives f♯ on generators, and hence in general, with f♯Z dual to f_*Z and compact. Its unit retract is compact; conservativity of f* and the descended good-reduction generators give the stated generation over k.

**Acceptance.** The generator twists here range over every integer. Together with BM.9 this covers both discrete and nondiscrete algebraically closed Banach fields. Do not apply the algebraically closed field theorem directly to nonclosed K=k((T)); include the finite-extension Artin generators in the descent argument.

**Direct prerequisites.** [BM.9/geometric-rigidity](#geometric-rigidity), [BM.3/annulus-compactness](#annulus-compactness), [BM.9/general-proper-push](#general-proper-push), [BM.8/stable](#stable), [BM.2/effective-adjoints](#effective-adjoints).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §11, Theorem 11.1 and proof, pp. 57–58. A Laurent-series extension and its split pushforward prove compact generation at a discrete point.

**Atlas planet:** Discrete-field motivic generators.

<a id="algebraic-mapping-input"></a>

### Mapping formulas for algebraic étale motives

**Theorem — `BM.10/algebraic-mapping-input`.** For algebraically closed k, smooth projective X/k and integer j, Map_DM_et(k,Z)(M(X)(−j),Z)_Q≃K(X)_Q^(j)[−2j], and after prime-to-char(k) completion the mapping spectrum is RΓ_proet(X,Zhat_{p′}(j)). These formulas and compact dualizable smooth-projective generators detect the algebraic comparison.

**Hypotheses and conventions.** With cohomological shifts and homotopy groups π_i, the rational formula is π_i Map(M(X)(−j),Z)_Q=K_{i+2j}(X)_Q^(j); the shift cannot be suppressed. Completion and mapping spectra are derived; use p=1 in characteristic zero.

**Construction or proof.**

1. Use the requested M.5a transfer/étale enhancement bridge to the algebraic derived model. Apply Cisinski–Déglise rigidity for torsion and their rational Beilinson comparison on regular schemes; S.6 identifies the gamma-graded terms with Adams weights.
2. Use étale descent, the prime-to-characteristic torsion rigidity theorem and rational alteration traces together with localization and Tate inversion to obtain smooth-projective compact dualizable generation. The rational use of alteration degrees is legitimate after rationalization; no integral prime-to-coefficient alteration degree is assumed. EDS enhancement gives mapping-spectrum comparisons.

**Acceptance.** The source’s triangulated comparisons must be realized by the actual enhanced functors; a list of isomorphic Hom groups alone is insufficient. Record the request for the prime-to-characteristic completed/pro-étale realization, rather than dropping the completion. For X=P¹_k and j=1, π_{−2} is K_0(P¹_k)_Q^(1)=Q, while π_0=H⁰(P¹_k,Q(1))=0. An unshifted K spectrum fails this check.

**Direct prerequisites.** [BM.10/algebraic-etale](#algebraic-etale), `MotivicEtaleKTheory:M.5a`, `SchemeKTheoryOperations:S.6`, `AdicCoefficientsAndComparisons:L5`, `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E2`.

**Source.** [Denis-Charles Cisinski and Frédéric Déglise, *Étale motives*](https://arxiv.org/abs/1305.5361v4), Cisinski–Déglise, Theorem 4.5.2, p. 41; Theorem 5.2.2, p. 44 (proof p. 47); Corollaries 5.5.5 and 5.5.7, pp. 55–56; Scholze, Remark 11.2, p. 57. The formula Hom(Q_X,Q_X(j)[q])=Gr^j_γ K_{2j−q}(X)_Q fixes the shift, and torsion rigidity supplies the completed side; the enhanced transfer-free bridge remains requested.

<a id="discrete-mapping"></a>

### Motivic mapping formulas over a discrete field

**Theorem — `BM.10/discrete-mapping`.** For k algebraically closed with trivial norm, smooth projective X/k and j∈Z, Map_Dmot(k)(Zmot[X](−j),Z)_Q≃K(X)_Q^(j)[−2j], so π_i is K_{i+2j}(X)_Q^(j). After prime-to-characteristic profinite completion the mapping spectrum is RΓ_proet(X,Zhat_{p′}(j)).

**Hypotheses and conventions.** Use derived completion and cohomological shifts, with the same π_i grading as in the algebraic mapping input.

**Construction or proof.**

1. Pass to a completed algebraic closure C of k((T)) and apply the smooth-completion K formula. The support localization sequence compares K(X_OC), K(X_C) and K(X).
2. TT supported excision reduces the special-fibre support term to K(X); its Adams weight shifts by one. Induct on weight to match this extra summand with the Laurent-series f♯Z summand. Torsion maps follow from the effective torsion theorem and inverse limits of finite coefficients.

**Acceptance.** Check the weight shift in the support term and the Laurent-series [−1] shift together. Negative rational weights vanish in the specified smooth regular range. Check the j=1 projective-line summand occurs at π_{−2}, not π_0; see E6 for the omitted source shift.

**Direct prerequisites.** [BM.10/discrete-generators](#discrete-generators), [BM.7/smooth-completion-k](#smooth-completion-k), [BM.6/k-adams](#k-adams), `SchemeKTheoryOperations:S.3/derived-closed-base-change-excision`, `SchemeKTheoryOperations:S.6`, [BM.4/torsion-comparison](#torsion-comparison), `EnhancedDerivedSheaves:E2`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §11, Theorem 11.1, proof pp. 57–58. The support term has the weight shift needed to recover algebraic K-theory from good reduction.

**Atlas planet:** Discrete-field motivic cohomology.

<a id="algebraic-comparison"></a>

### Berkovich and algebraic étale motives

**Comparison — `BM.10/algebraic-comparison`.** For algebraically closed discrete k the canonical symmetric monoidal functor DM_et(k,Z)→Dmot(k), sending a smooth scheme to its Berkovich motive, is an equivalence. A comparison for arbitrary nonclosed fields requires a separately specified descent versus hyperdescent convention and is not asserted here.

**Hypotheses and conventions.** k is algebraically closed. The comparison uses the integral étale category of BM.10.

**Construction or proof.**

1. Check the smooth-scheme functor satisfies étale descent, A¹-invariance and G_m-stability and hence factors through the universal category.
2. Compare the rational and prime-to-characteristic completed maps on compact dualizable smooth-projective generators using the two mapping-formula targets. Characteristic-p torsion vanishes on both sides. Arithmetic reconstruction gives full faithfulness; the discrete generation theorem gives essential surjectivity.

**Acceptance.** Require the comparison to identify Tate objects and smooth-scheme generators, not merely produce an abstract categorical equivalence.

**Direct prerequisites.** [BM.10/algebraic-etale](#algebraic-etale), [BM.10/algebraic-mapping-input](#algebraic-mapping-input), [BM.10/discrete-generators](#discrete-generators), [BM.10/discrete-mapping](#discrete-mapping), [BM.4/torsion-comparison](#torsion-comparison), `EnhancedDerivedSheaves:E2`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §11, Remark 11.2 and Theorem 11.1, pp. 57–58; §1, Proposition 1.13, p. 7. Agreement on generators and their mapping spectra establishes the enhanced equivalence.

## BM.11 — Nearby cycles and motivic monodromy

Construct nearby cycles with compatible roots and prove descendability. Over the algebraic closure of a finite field construct the two motivic Galois stacks, identify their quasi-coherent categories and the locally nilpotent monodromy description over the completed Laurent-series algebraic closure.

**Worked example.** Over k=F_pbar, take the rational object A=Q⊕Q(1). Define N:A→A⊗Q(−1) to take the first summand by the identity into Q(1)⊗Q(−1)=Q and to kill the second summand. The second iterate is zero, while N is nonzero. The associated two-step unipotent coaction is represented by 1+tN, with the parameter carrying the dual twist. Under the monodromy equivalence this is a motive over C whose nearby cycles are A. By comparison, a nonzero scalar endomorphism of a one-dimensional rational representation, after trivializing the twist, has every iterate nonzero and is excluded. The definition must retain finite nilpotent subrepresentations and the coherent coaction.

<a id="nearby"></a>

### Motivic nearby cycles

**Construction — `BM.11/nearby`.** Let k be algebraically closed, C a completed algebraic closure of k((T)) with |T|=1/2, and f:Marc(C)→Marc(k). Choose a topologically nilpotent unit π and compatible roots π^(1/n) for n prime to the residue-characteristic exponent p. With g:tilde G_m→Marc(k) the inverse prime-to-p power tower, identify f_*Z≃g_*Z. Define Ψ:Dmot(C)≃Mod_{f_*Z}(Dmot(k))→Dmot(k) by extension of scalars along g_*Z→Z induced by the unit section.

**Hypotheses and conventions.** This construction uses the chosen roots, not just the abstract residue field. In characteristic zero p=1, so every positive integer is prime to p.

**Uses.** BM.11 descendability: The augmentation makes nearby cycles conservative. BM.11 monodromy: The chosen section identifies its value with the underlying monodromy object.

**API.**

- `nearby_scalar_extension` (characterisation): Under the module equivalence Ψ is −⊗_{f_*Z}Z.
- `nearby_tate` (compatibility): Ψ preserves all Tate twists and the tensor unit.
- `nearby_good_reduction` (compatibility): For smooth projective X/k, Ψ(Zmot[X_C])≃Zmot[X].

**Checks.**

- **Check `unit`** (degenerate): Ψ(Z)=Z.
- **Check `twist`** (compatibility): Ψ(Z(n))=Z(n) for all integers n.
- **Check `projective_line`** (computation): For the good-reduction projective line, Ψ(Zmot[P¹_C])≃Z⊕Z(1)[2], with the two summands induced by the unit section and reduced projective-line class.

**Construction or proof.**

1. Good-reduction generators and Barr–Beck identify Dmot(C) with modules over f_*Z. Annulus continuity identifies that algebra with g_*Z; both have unit and cofiber Q(−1)[−1].
2. The compatible roots give the comparison to the tower and its augmentation at 1. Use module extension of scalars to define Ψ coherently as a symmetric monoidal colimit-preserving functor.

**Acceptance.** Track the direction of the algebra augmentation and its scalar-extension functor.

**Direct prerequisites.** [BM.10/discrete-generators](#discrete-generators), [BM.9/general-proper-push](#general-proper-push), [BM.3/annulus-compactness](#annulus-compactness), `EnhancedDerivedSheaves:E5:abstract/barr-beck-lurie`, `EnhancedDerivedSheaves:E5:presentability/tensor-product-and-module-base-change`, [BM.8/stable](#stable).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §11, Definition 11.3 and preceding construction, pp. 58–59. Nearby cycles is an augmented-algebra base change depending on roots.

**Atlas planet:** Motivic nearby cycles.

<a id="mg-residue"></a>

### Residue-field motivic Galois stack

**Construction — `BM.11/mg-residue`.** Fix k=an algebraic closure of F_p. Define MG_k over Z[1/p] by a line L and compatible derived isomorphisms L⊗^L Z/n≃μ_n(k)⊗Z R for every n prime to p. Equivalently MG_k≃B G_m^rat, where the group G_m^rat has coordinate ring Q[t,t⁻¹]×_Q Z[1/p], where the first map to Q evaluates t at 1. Dqc(MG_k) is compactly generated by L^n for n∈Z.

**Hypotheses and conventions.** The fibre product is a fibre product of rings over Q with Z[1/p]→Q; it is not their direct product. Compatibility includes the transition maps between the different n.

**Uses.** BM.11 Tate identification: Supplies the explicit special-fibre mixed Tate category. BM.11 MGC: It is the base of the value-group gerbe.

**API.**

- `mg_line` (projection): The tautological line has the specified coherent reductions for all prime-to-p n.
- `mg_arithmetic_fibres` (characterisation): The rational fibre is BG_m and every finite prime-to-p fibre is a point.
- `mg_line_generators` (structure): All integer powers of L are compact dualizable generators of Dqc(MG_k).

**Checks.**

- **Check `rational_weights`** (computation): Rationally the line powers are distinct G_m characters.
- **Check `finite_fibre`** (computation): Modulo ℓ≠p the line is the constant μ_ℓ(k)-line and the category is D(F_ℓ).
- **Check `bad_prime`** (non-example): The stack is over Z[1/p], so its characteristic-p fibre is empty; it must not introduce a p-torsion Tate sector.

**Construction or proof.**

1. Construct the line-with-Kummer-trivializations moduli functor using the AS.1 derived quasi-coherent stack machinery and identify it with the displayed group classifying stack.
2. Check its fibres: over F_ℓ for ℓ≠p the stack is a point; over Q it is BG_m. Pushforward preserves colimits and the powers of the line are compact generators, checked on these arithmetic fibres.

**Acceptance.** Do not omit the fibre-product gluing at the identity.

**Direct prerequisites.** [BM.9/mixed-tate](#mixed-tate), `AnalyticStacks:AS.1`, `EnhancedDerivedSheaves:E2`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §11, construction before Proposition 11.6, pp. 59–60. The residue-field Tate category is modeled by a line with all compatible finite-coefficient trivializations.

**Atlas planet:** Residue motivic Galois stack.

<a id="nearby-descendable"></a>

### Descendability of nearby cycles

**Theorem — `BM.11/nearby-descendable`.** The augmentation f_*Z→Z defining Ψ is descendable. Consequently Ψ is conservative.

**Hypotheses and conventions.** Use thick tensor-ideal generation in the module category, not solely convergence of an unbounded Amitsur limit.

**Construction or proof.**

1. The fibre of g_*Z→Z is Q(−1)[−1]; its g_*Z-module action factors through Z, as follows after rationalization from the free E-infinity algebra on Q(−1)[−1].
2. The resulting two-step filtration by inflated Z-modules puts the algebra in the thick tensor ideal generated by Z. Apply the imported descendability theorem.

**Acceptance.** Check the module-action factorization as well as the underlying cofiber computation.

**Direct prerequisites.** [BM.11/nearby](#nearby), `EnhancedDerivedSheaves:E5:abstract/descendable-algebras`, [BM.6/k-adams](#k-adams).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §11, Proposition 11.4 and proof, p. 59. The two-step augmented-algebra filtration proves descendability.

<a id="mg-valued"></a>

### Valued-field motivic Galois gerbe

**Construction — `BM.11/mg-valued`.** For k=F_pbar and C the completed algebraic closure of k((T)), define MG_C over MG_k by adjoining a derived map (C×/(1+C<1))[−1]→L whose reductions modulo every n prime to p are the fixed Kummer identifications. Equivalently classify extensions L→Ltilde→(C×/(1+C<1))⊗R with the prescribed restriction to reduced integral units. The map h:MG_C→MG_k is a gerbe banded by Hom(Q,L), with h_*O having O in degree 0 and L∨⊗Q in degree 1.

**Hypotheses and conventions.** The value group C×/O_C× is identified with Q using the norm normalization. The extension restriction to O_C×/(1+C<1) is the canonical L→L⊗Q→L⊗Q/Z[1/p] triangle.

**Uses.** BM.11 Galois equivalence: The augmented E-infinity algebra h_*O is compared with f_*Z. BM.11 monodromy: Its band representations give the locally nilpotent operator.

**API.**

- `mgc_extension` (universal-property): Its R-points are the displayed extensions with compatible integral-unit restriction.
- `mgc_band` (structure): The relative gerbe band is Hom(Q,L), with the specified value-group normalization.
- `mgc_roots_section` (constructor): Compatible roots of π give a section h by splitting reduced units into value-group and integral-unit parts.

**Checks.**

- **Check `value_group`** (computation): The quotient of reduced units by reduced integral units is Q, not Z.
- **Check `finite_coefficients`** (compatibility): Modulo n prime to p the gerbe retains the prescribed Kummer identifications; a bare rational gerbe is insufficient.
- **Check `chosen_split`** (characterisation): A compatible root system yields a neutral gerbe. Its section is choice-dependent, even though the gerbe itself is defined without choosing it.

**Construction or proof.**

1. Construct the extension moduli with its derived finite-coefficient compatibilities. Quotienting reduced units by integral reduced units gives the value-group Q and identifies the band.
2. Compute the quasi-coherent cohomology of this affine unipotent band using its rational additive-group model; preserve the extension class, not only the two cohomology groups.

**Acceptance.** Specify the derived extension and all modulus compatibilities.

**Direct prerequisites.** [BM.11/mg-residue](#mg-residue), [BM.3/one-units](#one-units), [BM.3/reduced-units](#reduced-units), `AnalyticStacks:AS.1`, `EnhancedDerivedSheaves:E2`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §11, definition of MG_C and ensuing computation, pp. 60–61. The gerbe retains both Kummer torsion data and the rational value group.

**Atlas planet:** Valued motivic Galois gerbe.

<a id="tate-residue-model"></a>

### Mixed Tate categories and motivic t-structures

**Theorem — `BM.11/tate-residue-model`.** For k=F_pbar and C as in nearby cycles, Dqc(MG_k)≃DMT(k), taking L to Z(1). Also DMT(C)⊗_{DMT(k)}Dmot(k)≃Dmot(C). The t-structures on DMT(k) and DMT(C) generated connectively by all Tate twists make Ψ conservative and t-exact.

**Hypotheses and conventions.** The t-structure claim concerns the mixed Tate subcategories, not an unconditional motivic t-structure on all Dmot(k).

**Construction or proof.**

1. Import Quillen finite-field K-theory and filtered continuity to obtain K(F_pbar)_Q=Q[0]. Compare maps between powers of L and Tate twists rationally and modulo n to prove full faithfulness and identify the mixed Tate image.
2. The algebra f_*Z lies in DMT(k), so module base change gives the tensor-product identity. Cover MG_k by Spec Z[1/p]; the augmentation of the free E-infinity algebra on Q[−1] is coconnectively faithfully flat, proving t-exactness together with descendability.

**Acceptance.** Check that maps between different rational Tate weights vanish. Do not claim this describes all motives over F_pbar absolutely.

**Direct prerequisites.** [BM.11/mg-residue](#mg-residue), [BM.11/nearby-descendable](#nearby-descendable), [BM.9/mixed-tate-descent](#mixed-tate-descent), [BM.10/discrete-mapping](#discrete-mapping), `KTheoryFiniteLocalFields:L.1`, `GeneralAlgebraicKTheory:K.7/invariance-under-filtered-colimits-and-products`, `EnhancedDerivedSheaves:E5:presentability/tensor-product-and-module-base-change`, `AnalyticStacks:AS.1`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §11, Propositions 11.5–11.8, pp. 59–60. Finite-field K-theory makes the Tate category explicit and the module algebra descends to it.

**Atlas planet:** Mixed Tate Galois description.

<a id="monodromy-category"></a>

### Locally nilpotent motivic monodromy pairs

**Definition — `BM.11/monodromy-category`.** Over Dmot(k), define the monodromy-pair category as representations of the neutral affine unipotent band Hom(Q,Z(1)) obtained from a chosen section of MG_C→MG_k. Use its coalgebra/comodule model to specify all coherent structure. Under the characteristic-zero additive-group representation correspondence, this is an object A with a locally nilpotent operator N:A→A⊗Q(−1); local nilpotence means an exhaustive filtered union of subrepresentations on which a finite iterate of N vanishes, interpreted in the comodule category.

**Hypotheses and conventions.** k=F_pbar in the explicit Galois-stack model. The operator has rational negative Tate twist; it is not a general arbitrary endomorphism. The comodule formulation fixes the derived coherence; vanishing solely on cohomology is not the definition.

**Uses.** BM.11 final equivalence: Makes the target of the nearby-cycle monodromy theorem unambiguous. Reader examples: Checks nontrivial unipotent as well as trivial monodromy.

**API.**

- `monodromy_forget` (projection): The underlying-object functor forgets the band coaction and retains the operator in its twisted form.
- `monodromy_morphisms` (characterisation): Morphisms are equivariant maps, with the required higher coherence.
- `monodromy_tensor` (structure): Tensor product has N_{A⊗B}=N_A⊗1+1⊗N_B and compatible twists.

**Checks.**

- **Check `zero_operator`** (degenerate): Every A with trivial band action gives (A,0).
- **Check `rank_two_nilpotent`** (computation): The standard two-step unipotent representation has N≠0 and N²=0, so the category cannot be restricted to zero operators.
- **Check `nonnilpotent_excluded`** (non-example): Over a rational trivialization of the twist, a nonzero one-dimensional scalar operator is not locally nilpotent and is excluded.

**Construction or proof.**

1. Neutralize the gerbe using compatible roots and identify its quasi-coherent category with representations of its band.
2. Use the AS.1 affine-group/comodule construction and the characteristic-zero additive-group finite-stage correspondence, requested explicitly there, to identify representations with locally nilpotent twisted operators. Morphisms are coherent equivariant maps, hence commute with N under this correspondence.

**Acceptance.** Keep the comodule model as the precise category definition until the derived operator equivalence is established by the AS.1 request.

**Direct prerequisites.** [BM.11/mg-valued](#mg-valued), `AnalyticStacks:AS.1`, `EnhancedDerivedSheaves:E5:presentability/tensor-product-and-module-base-change`, [BM.8/stable](#stable).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §11, discussion after Theorem 11.9, pp. 61–62. Neutralizing the value-group gerbe turns its representations into locally nilpotent monodromy.

<a id="galois-equivalence"></a>

### Galois-stack description of valued motives

**Theorem — `BM.11/galois-equivalence`.** Dqc(MG_C)≃DMT(C), and Dmot(C)≃Dmot(k)⊗_{Dqc(MG_k)}Dqc(MG_C), for k=F_pbar and C as above.

**Hypotheses and conventions.** The equivalences preserve the natural Dqc(MG_k)-linear symmetric monoidal structures.

**Construction or proof.**

1. Construct the map h_*O→f_*Z from the reduced-unit Tate class. Both have the same unit and rational degree-one summand. Identify the induced degree-one map with the identity of the normalized value group Q, not just an unspecified nonzero scalar.
2. Use the module descriptions on both sides and the residue Tate model to obtain the first equivalence. Apply module-category base change for the full-motive identity.

**Acceptance.** An equality of the underlying two-term complexes without algebra compatibility is insufficient.

**Direct prerequisites.** [BM.11/mg-valued](#mg-valued), [BM.11/tate-residue-model](#tate-residue-model), [BM.11/nearby](#nearby), `EnhancedDerivedSheaves:E5:presentability/tensor-product-and-module-base-change`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §11, Theorem 11.9 and proof, p. 61. The value-group computation identifies the actual algebra and hence the full relative category.

**Atlas planet:** Motivic Galois gerbe equivalence.

<a id="monodromy-equivalence"></a>

### Nearby cycles and monodromy equivalence

**Theorem — `BM.11/monodromy-equivalence`.** For k=F_pbar and C the completed algebraic closure of k((T)), compatible prime-to-p roots of π give a symmetric monoidal equivalence Dmot(C)≃{(A,N):A∈Dmot(k), N:A→A⊗Q(−1) locally nilpotent}. Ψ corresponds to forgetting N. With rational coefficients the choice of π alone suffices.

**Hypotheses and conventions.** Use the monodromy-pair category’s coherent comodule convention. The explicit proof is stated over F_pbar. Extension to other residue fields requires the positive-characteristic base-change argument following Proposition 11.4, rather than dropping this specialization silently.

**Construction or proof.**

1. The compatible roots give a section of the value-group gerbe. Combine its neutral representation description with the Galois-stack equivalence and relative tensor-product identity.
2. Identify extension of scalars along the section with the underlying-object functor, so this equivalence realizes Ψ. Rationally the ordinary G_m tower already has the needed cohomology and a single π defines the augmentation.

**Acceptance.** Check the Tate object has zero monodromy. The theorem is a relative description over Dmot(k), not an absolute classification of all motives.

**Direct prerequisites.** [BM.11/galois-equivalence](#galois-equivalence), [BM.11/monodromy-category](#monodromy-category), [BM.11/nearby-descendable](#nearby-descendable), [BM.11/tate-residue-model](#tate-residue-model).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §11, Corollary 11.10 and proof, pp. 61–62; §1, Theorem 1.14, p. 7. A chosen gerbe section gives the relative monodromy description and the nearby-cycle forgetful functor.

**Atlas planet:** Motivic monodromy equivalence.

## BM.12 — The v-stack and overconvergent comparison

Compare perfect characteristic-p Banach arc-stacks with partially proper v-stacks, track canonical compactification, and identify prime-to-p torsion motives with overconvergent étale sheaves and the finite-dimensional spatial-diamond categorical retract.

**Worked example.** Fix n prime to p and a geometric Huber pair (C,C+), with generic rank-one point (C,O_C). The constant complex Z/n has the identity Z/n→Z/n as its specialization map and passes the overconvergence criterion. A complex whose natural specialization map is 0→Z/n fails it, since n>1 makes that map noninvertible. Replacing C+ by O_C changes the test pair but leaves the value of an object coming from the arc-category unchanged. For a finite-dimensional spatial diamond, the full inclusion I and its right adjoint R satisfy R∘I≃id; the colimit-preserving property of R gives the categorical retract. This computation says nothing further about compact generation of the retract.

<a id="normed-v-comparison"></a>

### Normed arc-stacks and partially proper v-stacks

**Construction — `BM.12/normed-v-comparison`.** On perfect analytic Banach F_p-algebras with a chosen norm, construct a*:vStack/N→arcStack and its fully faithful right adjoint b*:arcStack→vStack/N, where N is the canonical positive-real norm torsor. Explicitly (b*Y)(R,R+)=Y(R) and a*X is the sheafification of R↦X(R,R°). The essential image of b* is the partially proper v-stacks, characterized by independence of R+. For separated X, b*a*X is its canonical compactification.

**Hypotheses and conventions.** All rings here are perfect analytic characteristic-p Banach rings. Choose cardinal cutoffs before taking their compatible union.

**Uses.** BM.12 torsion comparison: Provides the map from a v-stack to its Berkovich arc version. BM.12 categorical retract: Allows compact relative domains to be compared with quasicompact smooth diamond domains.

**API.**

- `arc_v_adjunction` (universal-property): a* is left adjoint to b*, with b* fully faithful.
- `arc_v_image` (characterisation): The essential image is exactly the plus-insensitive, partially proper v-stacks.
- `arc_v_compactification` (compatibility): For separated X the comparison unit gives the canonical partially proper compactification.

**Checks.**

- **Check `plus_independence`** (compatibility): b*Y has equal values on (R,R+) and (R,R°).
- **Check `norm_base`** (characterisation): Keeping a chosen norm gives vStack/N; it does not identify this category with all vStack without changing the test category.
- **Check `compactification`** (characterisation): An already partially proper separated X is unchanged by b*a*, while a non-partially-proper separated X is replaced by its envelope.

**Construction or proof.**

1. At the ring level use the forgetful functor on Huber pairs and its adjoints R↦(R,R°) and R↦(R,integral closure of F_p+R°°). Verify finite-limit and cover compatibility on the opposite sites.
2. Obtain the sheaf adjunction and compute the unit/counit. Use the C4 canonical-compactification universal property to identify b*a* on separated v-stacks.

**Acceptance.** Track which functor is right adjoint and where the norm torsor enters.

**Direct prerequisites.** [BM.0/arc-site](#arc-site), `DiamondsAndVStacks:D2`, `DiamondsAndVStacks:D4`, `DiamondsAndVStacks:D6`, `DiamondEtaleCohomology:C4`, `EnhancedDerivedSheaves:E0`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §12, Proposition 12.1 and Corollary 12.2, pp. 62–63. The chosen norm requires the torsor base and the plus-insensitive image is partially proper.

**Atlas planet:** Partially proper v-stack comparison.

<a id="normfree-arc"></a>

### Norm-free Tate arc-stack comparison

**Construction — `BM.12/normfree-arc`.** Use perfectoid Tate F_p-algebras without a chosen norm to define arcStack′ and functors a′*:vStack→arcStack′, b′*:arcStack′→vStack. Equivalently use Huber pairs with the topology generated by surjectivity on rank-one points. In this topology Spa(R,R°)→Spa(R,R+) is a cover, so the choice of plus subring disappears after sheafification.

**Hypotheses and conventions.** This is a variant of the fixed-norm site, not an unannounced change to BM.0. A norm on a fixed base recovers the earlier relative theory.

**Uses.** BM.12 overconvergence: Its plus-forgetting property identifies the essential image of torsion pullback. BM.12 retract: Places the two coefficient categories over a spatial diamond.

**API.**

- `normfree_rank_one` (characterisation): The topology is tested by rank-one surjectivity on the Huber-pair test category.
- `normfree_plus_cover` (structure): Spa(R,R°)→Spa(R,R+) is a cover.
- `normfree_relative` (compatibility): After choosing a norm on a base, the relative category agrees with the fixed-norm construction.

**Checks.**

- **Check `full_plus`** (degenerate): For R+=R° the plus-cover is the identity.
- **Check `smaller_plus`** (compatibility): Replacing R+ by a smaller allowed integral subring changes the adic test space but not its arc-sheafification.
- **Check `higher_rank`** (characterisation): The topology ignores additional higher-rank points for covering surjectivity; it is not simply the v-topology with another name.

**Construction or proof.**

1. Choose norms locally on a fixed Tate base and use independence of compatible norms to glue the motivic categories.
2. Compare rank-one covers with the plus-forgetting sheafification, then construct the two functors exactly as in the normed comparison.

**Acceptance.** Prove the restriction to a normed base agrees with the original motivic category.

**Direct prerequisites.** [BM.12/normed-v-comparison](#normed-v-comparison), `DiamondsAndVStacks:D6`, `DiamondsAndVStacks:D2`, [BM.0/arc-site](#arc-site).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §12, discussion after Corollary 12.2 and before Proposition 12.3, p. 63. The Tate variant removes the norm-torsor base while retaining the stronger rank-one topology.

**Atlas planet:** Norm-free arc-stacks.

<a id="overconvergent-torsion"></a>

### Torsion motives as overconvergent étale sheaves

**Comparison — `BM.12/overconvergent-torsion`.** For a small characteristic-p v-stack X, let Y=a′*X and n prime to p. There is a fully faithful embedding Dmot(Y,Z/n)≃Det(Y,Z/n)→Det(X,Z/n). Its essential image consists of the overconvergent objects: the stalk at any higher-rank geometric point Spa(C,C+) agrees with that at its generic rank-one point Spa(C,O_C). The embedding respects pullback, tensor and proper finite-cohomological-dimension pushforward.

**Hypotheses and conventions.** Det is the enhanced left-completed étale category supplied by DiamondEtaleCohomology. The stalk condition uses the natural specialization map, not an abstract equality of groups.

**Construction or proof.**

1. Reduce by descent to strictly totally disconnected X. Use the C0/C2 comparison with sheaves on π₀X and its overconvergent essential-image characterization.
2. Pass from bounded-below to unbounded using the strict-base Postnikov computation. Check the three functor compatibilities on this basis and descend.

**Acceptance.** All these statements use n prime to p; no p-torsion diamond equivalence is inferred. The higher-rank specialization map must be invertible, excluding a sheaf with different generic and higher-rank stalks.

**Direct prerequisites.** [BM.12/normfree-arc](#normfree-arc), [BM.4/torsion-comparison](#torsion-comparison), `DiamondEtaleCohomology:C0`, `DiamondEtaleCohomology:C2`, [BM.9/general-proper-push](#general-proper-push).

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §12, Proposition 12.3 and proof, p. 63. Prime-to-p torsion motives retain exactly the plus-independent, overconvergent étale information.

<a id="diamond-retract"></a>

### Spatial-diamond categorical retract

**Theorem — `BM.12/diamond-retract`.** If X is a spatial diamond of finite cohomological dimension and n is prime to p, the preceding full inclusion Det(Y,Z/n)→Det(X,Z/n), Y=a′*X, has a colimit-preserving right adjoint. Det(X,Z/n) is compactly generated. Thus Det(Y,Z/n) is a retract of a compactly generated presentable category; compact generation of Det(Y,Z/n) itself is not asserted.

**Hypotheses and conventions.** Use the compact-generation hypotheses and cohomological bounds from C9.

**Construction or proof.**

1. A generating compact map Zmot[U]→Zmot[V] for a strict domain inclusion becomes a map factoring through the homology of a quasicompact smooth diamond W/X. This is compact in Det(X,Z/n).
2. Hence the full inclusion preserves compact morphisms; the E5 adjoint criterion makes its right adjoint colimit-preserving. Import C9 compact generation to obtain the retract.

**Acceptance.** Do not upgrade a retract of a compactly generated category to a compactly generated category without an additional theorem.

**Direct prerequisites.** [BM.12/overconvergent-torsion](#overconvergent-torsion), [BM.9/compact-factorizations](#compact-factorizations), `EnhancedDerivedSheaves:E5:presentability/dualizable-compactly-assembled-categories`, `EnhancedDerivedSheaves:E5:presentability/compact-morphisms`, `DiamondEtaleCohomology:C9`, `DiamondSixOperations:S2`.

**Source.** [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), §12, Proposition 12.4 and proof, pp. 63–64. Compact-morphism preservation identifies the motivic category as a categorical retract.

**Atlas planet:** Overconvergent categorical retract.

## Supplier contracts and ownership

Exact existing nodes appear in each target's prerequisite list. A stage-level reference below has a requested contract because the packet needs a particular range, enhancement or map. Reading the supplier's current statement is essential: for example stable compact assembly does not supply the nonstable seminormed criterion, bounded Nisnevich motives do not supply presentable étale motives, and a plus-space model does not by itself supply multiplicative spectral K-theory. The following contracts describe what the cited owner must export; they introduce no second copy of its theory here. Any part outside the owner’s existing scope belongs to a Part II continuation with that roadmap as first prerequisite. The packet records this restructuring proposal. Existing narrower nodes supply only the ranges they actually state.

### Interface 1: `EnhancedDerivedSheaves:E0`

Enhanced space-valued sheaves and derived sheaves on cardinal-cutoff sites, hypersheafification, slices, coherent pullback and descent of adjoints. Give the actual enhanced category and change-of-cutoff comparison; ordinary triangulated sheaf cohomology alone is insufficient.

**Consumers:** [BM.0/arc-site](#arc-site), [BM.1/finitary-descent](#finitary-descent), [BM.1/finitary-excision](#finitary-excision), [BM.2/effective-adjoints](#effective-adjoints), [BM.3/reduced-units](#reduced-units), [BM.4/transfers](#transfers), [BM.10/algebraic-etale](#algebraic-etale), [BM.10/algebraic-mapping-input](#algebraic-mapping-input), [BM.12/normed-v-comparison](#normed-v-comparison).

### Interface 2: `EnhancedDerivedSheaves:E2`

The general Mondal–Reinecke theorem that the hypercomplete infinity-topos of a replete ordinary topos is Postnikov complete; also the finite-covering-dimension Postnikov criterion for sheaves on compact Hausdorff spaces, derived inverse-limit/completion and arithmetic reconstruction for the mapping spectra used here. The existing abelian-derived repleteness and locally weakly contractible space statements alone do not supply the first assertion.

**Consumers:** [BM.0/arc-replete](#arc-replete), [BM.1/geometric-comparisons](#geometric-comparisons), [BM.1/proper-dimension](#proper-dimension), [BM.7/perfectoid-k-descent](#perfectoid-k-descent), [BM.7/analytic-kh](#analytic-kh), [BM.7/smooth-completion-k](#smooth-completion-k), [BM.10/algebraic-mapping-input](#algebraic-mapping-input), [BM.10/discrete-mapping](#discrete-mapping), [BM.10/algebraic-comparison](#algebraic-comparison), [BM.11/mg-residue](#mg-residue), [BM.11/mg-valued](#mg-valued).

### Interface 3: `EnhancedDerivedSheaves:E5:presentability`

The nonstable compact-assembly criterion for seminormed rings used in Proposition 2.9; the presentable monoidal Verdier quotient for a localizing tensor ideal; spectral ball localization and E-infinity arithmetic fracture. These are additions to the precise existing stable compact-assembly and small Verdier-quotient nodes, which are cited separately.

**Consumers:** [BM.0/seminormed-assembly](#seminormed-assembly), [BM.1/finitary-descent](#finitary-descent), [BM.2/ball-localization](#ball-localization), [BM.7/field-cofiber-ring](#field-cofiber-ring).

### Interface 4: `EnhancedDerivedSheaves:E5:animation`

Free animated commutative monoids and their group completions, augmentation-ideal filtration with connectivity convergence, and the Breen–Deligne group-completion resolution in the exact form cited by Scholze Proposition 8.4 (Aoki Theorem 4.4). Supply primary-source verification of that general resolution.

**Consumers:** [BM.4/transfers](#transfers), [BM.4/explicit-free](#explicit-free), [BM.5/projective-cells](#projective-cells), [BM.6/motivic-k](#motivic-k).

### Interface 5: `AnalyticStacks:AS.0`

Apply no new motivic definitions here: export Mann’s six-functor construction principle, the extension theorem Scholze 5.19 = Heyer–Mann 3.4.11, coherent base-change/projection and cohomological étaleness/smoothness criteria. BM.8 verifies these axioms for Banach motives.

**Consumers:** [BM.8/six-operations](#six-operations), [BM.9/general-proper-push](#general-proper-push).

### Interface 6: `AnalyticStacks:AS.1`

Derived quasi-coherent categories and tensor descent for the algebraic stacks MG_k and MG_C; affine-group comodule categories; identify representations of Hom(Q,L) with coherent locally nilpotent L-dual-rational-twisted operators, including unbounded derived objects. This operator/comodule equivalence must be proved, not inferred just on cohomology.

**Consumers:** [BM.4/marked-jacobian](#marked-jacobian), [BM.11/mg-residue](#mg-residue), [BM.11/tate-residue-model](#tate-residue-model), [BM.11/mg-valued](#mg-valued), [BM.11/monodromy-category](#monodromy-category).

### Interface 7: `GeneralAlgebraicKTheory:K.2:plus`

Connective ring K-theory as the functorial E-infinity group completion of finite projective modules, enhanced to connective spectra and multiplicative for tensor product; the existing plus-space component description is a partial input, not an infinite-loop product splitting.

**Consumers:** [BM.6/motivic-k](#motivic-k).

### Interface 8: `GeneralAlgebraicKTheory:K.5`

Suslin excision for a Tor-unital nonunital ideal I, with K(I)=fib(K(Z⊕I)→K(Z)) independent of unitization and its map to ambient K(A). Also the relative/truncating KH model for arbitrary idempotent ideals and A¹ localization needed to define the root-free KH-cofiber. Neither unrestricted K-excision nor automatic Tor-unitality of every ideal is allowed.

**Consumers:** [BM.7/unit-k-cofiber](#unit-k-cofiber), [BM.7/analytic-kh](#analytic-kh).

### Interface 9: `SchemeKTheoryOperations:S.6`

Functorial multiplicative Adams operations on rational connective ring K-theory for the abstract rings in the Banach site and compatibility with line bundles, supported completion and the codimension-one weight shift. Existing regular-noetherian-scheme operations supply only that narrower range; the E-infinity/all-ring extension must be explicit.

**Consumers:** [BM.6/k-adams](#k-adams), [BM.10/algebraic-mapping-input](#algebraic-mapping-input), [BM.10/discrete-mapping](#discrete-mapping).

### Interface 10: `KTheoryFiniteLocalFields:L.1`

Quillen’s finite-field K calculation and compatibility with inclusions, followed by filtered continuity to K(F_pbar)_Q=Q[0]. Only the latter consequence is used for the residue Tate category.

**Consumers:** [BM.11/tate-residue-model](#tate-residue-model).

### Interface 11: `KTheoryFiniteLocalFields:L.2`

Prime-to-residue-characteristic K-rigidity for the henselian pairs entering the field-cofiber comparison, with the actual maps and Bocksteins. The full geometric Gabber–Suslin field-extension assertion remains in the routed-ownership gap.

**Consumers:** [BM.7/strict-k-formula](#strict-k-formula).

### Interface 12: `KTheoryFiniteLocalFields:L.5`

Verify and supply K(O_C)^∧p≃K(C)^∧p for algebraically closed complete C and K(k)^∧p≃Z_p for perfect characteristic-p fields, in the exact form cited as Hesselholt–Nikolaus Lemma 1.3.7 and Kratzer Corollary 5.5 in Scholze Corollary 8.10. This p-completed K statement is beyond a bare THH calculation and needs the trace/K comparison. Preserve p=2 as well.

**Consumers:** [BM.7/field-cofiber-ring](#field-cofiber-ring).

### Interface 13: `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`

Import the represented Pic⁰/Jacobian and functorial line-bundle moduli on a smooth proper geometrically connected curve. The new marked-trivialization torus torsor is constructed in BM.4; do not duplicate the ordinary Jacobian.

**Consumers:** [BM.4/marked-jacobian](#marked-jacobian).

### Interface 14: `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`

Multiplication by every positive integer is surjective on points of an abelian variety over an algebraically closed field, including inseparable multiplication in its characteristic. Combine with the torus case to prove the new semiabelian divisibility.

**Consumers:** [BM.4/marked-jacobian](#marked-jacobian).

### Interface 15: `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`

Rational sections/divisors on smooth projective curves and their approximation/Riemann–Roch API. The analytic extension to controlling entire boundary discs is requested from TB.0 rather than attributed to algebraic point interpolation alone.

**Consumers:** [BM.4/curve-homotopy](#curve-homotopy).

### Interface 16: `AdicCoefficientsAndComparisons:L5`

The field-case de Jong alteration and normal-crossing compactification theorem with its dominance, generic-finiteness and base-extension hypotheses, and the proper-hypercover descent route when the degree is not invertible. Rational trace splitting may be used only rationally.

**Consumers:** [BM.9/geometric-rigidity](#geometric-rigidity), [BM.10/algebraic-mapping-input](#algebraic-mapping-input).

### Interface 17: `DiamondsAndVStacks:D1`

Perfectoid strict bases and the almost structure-sheaf localization on closed subsets needed by torsion almost modules. Retain the actual plus subrings and complete idempotent algebra structures.

**Consumers:** [BM.0/strict-descent](#strict-descent), [BM.7/perfectoid-k-descent](#perfectoid-k-descent).

### Interface 18: `DiamondsAndVStacks:D2`

Perfectoid arc/v-basis descent and tilting of the corresponding sites, with cutoff and cover conditions. The Banach arc-site itself is constructed here and is not identified with the scheme arc-site.

**Consumers:** [BM.0/strict-descent](#strict-descent), [BM.4/torsion-comparison](#torsion-comparison), [BM.4/effective-tilting](#effective-tilting), [BM.12/normed-v-comparison](#normed-v-comparison), [BM.12/normfree-arc](#normfree-arc).

### Interface 19: `DiamondsAndVStacks:D4`

Small v-stacks and cardinal-cutoff geometry, their fibre products and geometric-point descriptions for the v/arc comparison.

**Consumers:** [BM.12/normed-v-comparison](#normed-v-comparison).

### Interface 20: `DiamondsAndVStacks:D6`

Perfectoid Huber-pair and analytic diamond interface, the plus-subring and norm-free Tate presentations and site comparisons used by BM.12.

**Consumers:** [BM.12/normed-v-comparison](#normed-v-comparison), [BM.12/normfree-arc](#normfree-arc).

### Interface 21: `DiamondEtaleCohomology:C0`

Étale/pro-étale/v site comparison, including the strict-base description by sheaves on π₀ and the overconvergent essential-image criterion from ECD 13.13/22.7; prove the unbounded strict-base passage.

**Consumers:** [BM.12/overconvergent-torsion](#overconvergent-torsion).

### Interface 22: `DiamondEtaleCohomology:C2`

Enhanced left-completed étale category Det for small v-stacks, coherent descent, and its correct finite-coefficient interpretation.

**Consumers:** [BM.4/torsion-comparison](#torsion-comparison), [BM.12/overconvergent-torsion](#overconvergent-torsion).

### Interface 23: `DiamondEtaleCohomology:C4`

Canonical partially proper compactification, separatedness hypotheses, universal property and the functorial identification used by b*a*. No claim that every envelope is spatial.

**Consumers:** [BM.12/normed-v-comparison](#normed-v-comparison).

### Interface 24: `DiamondEtaleCohomology:C6`

Algebraically closed base-field invariance in its precise finite-coefficient range, including nonarchimedean extensions. Use as a torsion input, not an integral equivalence of all étale objects.

**Consumers:** [BM.2/torsion-forward](#torsion-forward).

### Interface 25: `DiamondEtaleCohomology:C8`

Geometric-point-as-profinite-quotient theorem and analytic/residue Galois cohomological-dimension bounds, including the closed-disc bound used in Lemma 5.3. Keep strict cohomological dimension for Z coefficients distinct from torsion cd.

**Consumers:** [BM.2/effective](#effective), [BM.9/compact-factorizations](#compact-factorizations).

### Interface 26: `DiamondEtaleCohomology:C9`

Compact generation for Det of the finite-dimensional spatial diamond in Proposition 12.4, with uniform cohomological bounds on qc separated étale charts. The conclusion is used for the ambient category only.

**Consumers:** [BM.12/diamond-retract](#diamond-retract).

### Interface 27: `DiamondSixOperations:S2`

The enhanced proper-support homology of quasicompact smooth diamond domains and its pullback, tensor and base-change comparison in the range used for the compact-factorization argument.

**Consumers:** [BM.12/diamond-retract](#diamond-retract).

### Interface 28: `MotivicEtaleKTheory:M.5a`

The finite-correspondence, Nisnevich-transfer and cancellation inputs in their existing range, plus the precise integral étale change-of-topology and transfer-free/with-transfer comparison over algebraically closed fields. The presentable infinity enhancement, positive-characteristic coefficient inversion and map-level comparison must be specified; the existing bounded Nisnevich theory is only partial. Cisinski–Déglise Corollary 5.5.7 directly covers characteristic-zero bases or coefficients with 2 invertible. In positive odd characteristic, inversion of the characteristic alone leaves a 2-primary comparison to justify separately; Corollary 5.5.5 is a with-transfer comparison and does not supply that missing bridge.

**Consumers:** [BM.10/algebraic-etale](#algebraic-etale), [BM.10/algebraic-mapping-input](#algebraic-mapping-input).

### Interface 29: `MotivesAndAlgebraicCycles:MC.2`

The classical rational flag-variety realization for the normalizer permutation action, showing the averaging idempotent on the finite Tate decomposition retains exactly the degree-zero diagonal. Supply compatibility with the algebraic/étale comparison; no arbitrary-realization conservativity is assumed.

**Consumers:** [BM.6/flag-invariants](#flag-invariants).

### Interface 30: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`

Canonical all-degree continuous cohomology of profinite groups with discrete coefficients, its filtered-colimit interface and comparison with the condensed/profinite Galois-action site. Use the existing upstream carrier rather than define a second continuous-cohomology theory.

**Consumers:** [BM.1/geometric-comparisons](#geometric-comparisons).

### Interface 31: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`

Continuous Galois cohomological-dimension and closed-subgroup bounds on Z-modules in the geometric field cases, via the upstream canonical continuous-cohomology carrier.

**Consumers:** [BM.1/geometric-comparisons](#geometric-comparisons), [BM.2/effective](#effective).

### Interface 32: `TropicalAndBerkovichArithmetic:TB.0`

Analytic refinements used by the owned curve targets: pass from the smooth missing reduction points in van der Put Corollary 1.3 to pairwise disjoint closed-disc boundaries after shrinking around two retained points; prove rational-section approximation preserving value 1 at chosen centres and no zero/pole on each entire boundary disc. Also Pic(C⟨T⟩)=0 and analytic line-bundle descent as needed by reduced-unit invariance. Do not re-plan the marked Jacobian or the final prime-divisible curve homotopy.

**Consumers:** [BM.4/curve-shrinking](#curve-shrinking), [BM.4/curve-homotopy](#curve-homotopy), [BM.3/reduced-free](#reduced-free).

## Open proof leaves and comparison boundary

These are precise unestablished inputs, rather than assumptions hidden in the target statements. They are recorded in the packet for ownership and source verification. Their dependent targets retain their mathematical statements. The K-theory branches are not described as closed.

### BM-G1 — No live owner for general KH cdh descent

The corrected extraction routes integral KH cdh descent to GeneralAlgebraicKTheoryPartIITelescopicLocalization, which is not a live or reserved roadmap in this checkout. The live GeneralAlgebraicKTheoryPartII supplies a height-one-localized cdh statement and cannot replace it. Needed contract: noetherian finite-dimensional KH cdh descent, with formal-model/admissible-blowup comparison. A pro-cdh K proof followed by ball localization is an alternative, routed to a second absent descent/rigidity Part II. The maintainer must assign the general descent owner; neither absent identifier is used as a prerequisite.

**Direct consumers:** [BM.7/analytic-kh](#analytic-kh).

### BM-G2 — No live owner for valuation-ring K inputs

SchemeKTheoryOperationsPartIIDescentAndRigidity from the extraction is not live; the actual SchemeKTheoryOperationsPartII concerns formal K/Euler theory. Needed contracts: A¹-invariance of K for valuation rings, vanishing of negative K in the field/valuation comparisons used for totally disconnected rings, and the relative K/KH cofiber comparison for completions of smooth O_C-models. The ordinary S.5 regular-noetherian theorem does not cover nonnoetherian valuation rings. These proof leaves remain unestablished here and require a correctly assigned Part-II supplier.

**Direct consumers:** [BM.7/unit-k-cofiber](#unit-k-cofiber), [BM.7/perfectoid-k-descent](#perfectoid-k-descent), [BM.7/analytic-kh](#analytic-kh), [BM.7/smooth-completion-k](#smooth-completion-k).

### BM-G3 — No live owner for the full geometric K-rigidity input

The missing descent/rigidity Part II also owns the Gabber–Suslin finite-coefficient geometric algebraically-closed-field invariance used in Theorem 8.9. L.2 is requested for the henselian comparison it actually plans; it is not silently promoted to the full geometric statement. The exact map and prime-to-residue-characteristic conditions need a source-checked owner.

**Direct consumers:** [BM.7/strict-k-formula](#strict-k-formula).

### BM-G4 — RigDA comparison has no supplied theorem

No target asserts Dmot(X)≃Ayoub RigDA(X). The corrected brief explicitly says that no roadmap plans RigDA and that this paper does not prove that comparison. The revised Binda–Kato–Vezzani route must import these Berkovich foundations and provide a separate source-checked comparison if required. This is a boundary/comparison gap, not a dependency assumed by any node.

The corrected paper routing assigns 45 items to this Part II; each has an explicit target map in `extractionCoverage` in the packet. The remaining 19 extraction items are imported from their existing owners or accounted for by the proof leaves above. The root-ideal almost-module theorem is imported from `RefinedTraceMethods:RT.5/almost-module-k`. Ordinary Jacobians are imported from the upstream `JacobianChallenge`; BM.4 owns the marked-trivialization extension and its analytic curve application. Algebraic étale motives and their precise enhanced comparison are stated in BM.10, with the existing motivic inputs and the requested transfer comparison distinguished.

## Sources and locator conventions

Every source description and mathematical statement in this document is original paraphrase. Scholze locators use the internal pagination of arXiv v3, not the JAMS page numbers. Cisinski–Déglise locators use arXiv v4. The packet records hashes for the public PDFs actually inspected. The two published journal editions have not been compared against their preprints.

- [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3). arXiv:2412.03382v3, 22 January 2026; JAMS 39 (2026), 697–764. Read 19 October 2026. Read all of the 65-page v3 preprint, including proofs and references, with focused rereading of §§4–11. Every Scholze page locator here uses the preprint internal pagination, not JAMS pagination. The published JAMS PDF was not compared.

- [Marius van der Put, *The class group of a one-dimensional affinoid space*](https://www.numdam.org/item/AIF_1980__30_4_155_0/). Annales de l’Institut Fourier 30 (1980), no. 4, 155–164. Read 19 October 2026. Theorem 1.1, Lemma 1.2, Corollary 1.3 and proofs, pp. 155–161. The reduction-complement statement is distinguished from the additional analytic disc-boundary refinement.

- [Siegfried Bosch, Werner Lütkebohmert and Michel Raynaud, *Néron Models*](https://doi.org/10.1007/978-3-642-51438-8). Ergebnisse der Mathematik und ihrer Grenzgebiete (3) 21, Springer, 1990. Read 19 October 2026. Maintainer-cleared copy read in place: §9.2, pp. 243–249, especially Proposition 3, Example 8 and Proposition 10. Used for proper Picard and nodal normalization background; not claimed as a direct reduced-modulus marked-Picard theorem. No source file or passage is included.

- [Denis-Charles Cisinski and Frédéric Déglise, *Étale motives*](https://arxiv.org/abs/1305.5361v4). arXiv:1305.5361v4, 5 December 2014; published Compositio Math. 152 (2016), 556–666. Read 19 October 2026. Read §2.2, pp. 25–28; §4.5, p. 41; §5.2, theorem p. 44 and proof p. 47; the comparison construction, Theorem 5.5.3 and Corollaries 5.5.5/5.5.7 with proofs, pp. 53–56. Locators use arXiv v4 internal pagination. The infinity-enhancement and full transfer-free comparison are explicit supplier contracts, with the characteristic-zero or 2-invertible range of Corollary 5.5.7 retained.

The marked Jacobian construction uses the Picard and normalization background of Bosch–Lütkebohmert–Raynaud, §9.2, Proposition 3, Example 8 and Proposition 10, pp. 244–249. Its reduced-modulus torus quotient is constructed here with explicit trivializations and the diagonal scalar action; the whole marked theorem is not attributed to that book. Van der Put, Corollary 1.3, p. 159, gives missing smooth points in a reduction. The stronger disjoint-disc boundary refinement and rational-section control are a separate analytic supplier contract.

Cisinski–Déglise, Theorem 4.5.2, p. 41, provides torsion rigidity in its stated range; Theorem 5.2.2, pp. 44–45, supplies the rational comparison; Theorem 5.5.3 and Corollary 5.5.5, pp. 53–56, provide the comparison with the usual algebraic motivic categories over the fields in question. The presentable infinity-enhancement, transfer-free étale presentation and map compatibility remain explicit parts of the `MotivicEtaleKTheory:M.5a` contract.

Two corrections already recorded by the paper extraction are respected: the finite-boundary line-domain computation uses P¹_C, and the bounded product of completed residue fields is analytically reduced before being called totally disconnected. Strict disconnectedness is asserted only after algebraic closure of the residues. These corrections carry the source-issue references `PAPER-SCHOLZE-26/E2` and `PAPER-SCHOLZE-26/E3` in the packet.

## Local source calculations requiring correction

These findings concern the inspected preprint and author copy, not the inaccessible version of record. The independent review confirms E1–E5 and adds E6; the correction search and individual verdicts are recorded in the packet.

### E1 — §6, proof of Lemma 6.5, p. 38, polynomial root-containment calculation (arXiv v3; same expressions in the author copy).

With r₂>1>r₁ and n=Σk_i, the outer exclusion uses |T|≥r₁>1 and calls the product norm r₂ⁿ. The inner exclusion uses |T−a_j|=|a_i| for j≠i and bounds the product by r₁ⁿ.

**Corrected calculation.** For |T|≥r₂ the product norm is |T|ⁿ≥r₂ⁿ. For |T−a_i|≤r₁, distinct residue classes give |T−a_j|=|a_i−a_j|=1 for j≠i; hence the product norm is at most r₁^{k_i}. Choose every k_i with r₁^{k_i}<s₁ and the total n with r₂ⁿ>s₂.

**Verification.** The outer displayed threshold contradicts r₁<1. In the inner disc only the ith factor is small; making other k_j large cannot strengthen its exponent to n. The corrected inequalities exclude both types of forbidden roots and preserve the factorization into Symⁿ(U).

### E2 — §6, proof of Lemma 6.5, p. 38, ratio of two nearby point coordinates (arXiv v3; author copy).

The expansion of (T₁−a_j)/(T₂−a_j) uses the numerator difference T₂−T₁ after subtracting 1.

**Corrected calculation.** The difference from 1 is (T₁−T₂)/(T₂−a_j).

**Verification.** Subtract 1 using the common denominator. The sign has no effect on the strict one-unit estimate, since the absolute value is unchanged.

### E3 — §6, proof of Lemma 6.5, p. 38, final subgroup-containment display (arXiv v3; author copy).

The residue-unit subgroup is shown as included in an isolated Q before an arrow into Q⊕(C×/(1+C<1))^d⊗Q.

**Corrected calculation.** State that 0⊕(C×/(1+C<1))^d⊗Q is contained in the image of (N[U])(*)⊗Q→Q⊕(C×/(1+C<1))^d⊗Q.

**Verification.** Differences of the two point classes have zero rank coordinate and the computed residue-unit coordinate. The intended containment concerns that image, not a subgroup of Q.

### E4 — §6, proof of Lemma 6.5, p. 38, top-right term of the domain-decomposition diagram (arXiv v3; author copy).

Each domain V_i contributes a displayed degree-coordinate factor Q^e in the top-right direct sum, whereas the bottom term has degree-coordinate factor Q^{de}.

**Corrected calculation.** Each annular V_i has one boundary degree for each of the d boundary coordinates of U, so the summand is Q^d. Summing over e domains gives Q^{de}.

**Verification.** The preceding mapping calculation gives d times the number of boundary coordinates of the source. For one annular source this is d; the displayed Q^e would incorrectly give e² instead of de in the combined degree-coordinate part.

### E5 — §5.2, proof of Proposition 5.19, p. 35, coefficient inequality for the annulus fibre (arXiv v3; same in the author copy).

The coefficient bound for a monic polynomial with constant coefficient a₀ and every root in T(r₁,r₂) uses max(r₂^{n−i},|a₀|r₁^{−i}).

**Corrected calculation.** Use min(r₂^{n−i},|a₀|r₁^{−i}): the upper and lower root-radius bounds impose both strict coefficient inequalities.

**Verification.** Over C₂, take T²+T/2+4 with |2|=1/2 and r₁=1/4, r₂=4. Its constant coefficient has norm 1/4 in (r₁²,r₂²), and |a₁|=2 is less than the displayed maximum 4. Newton slopes give root norms 2 and 1/8, so one root is outside the annulus. The corrected minimum is 1 and excludes this polynomial. With the corrected minimum the fixed-a₀ fibre is still an open polydisc and the motive argument is preserved.

The author’s linked copy was checked at pp. 35, 38 and 57 on 19 October 2026; the same expressions remain. The arXiv submission history still ends at v3. The author’s paper list has no separate Berkovich-motives correction link, and the Crossref record has no correction relation or update entry. The version-of-record PDF returned HTTP 403. These bounded searches do not establish that no correction exists elsewhere.

### E6 — §11, Theorem 11.1, p. 57, rational mapping-spectrum formula (arXiv v3 and author copy).

The rational mapping object from Zmot[X](−j) to Z is identified with the weight-j K-theory piece without a grading shift.

**Corrected calculation.** With Z(1) the reduced G_m motive shifted by [−1], Map(Zmot[X](−j),Z)_Q is K(X)_Q^(j)[−2j]; equivalently its π_i is K_{i+2j}(X)_Q^(j).

**Verification.** The rational splitting Kmot_Q=⊕_n Q(n)[2n] in Proposition 8.5 fixes the [−2j] shift. Independently, Cisinski–Déglise Theorem 5.2.2, p. 44, gives Hom(Q_X,Q_X(j)[q])=Gr^j_γ K_{2j−q}(X)_Q. For X=P¹ and j=1, the Picard K_0 weight occurs at π_{−2}, whereas π_0=H⁰(P¹,Q(1))=0. The version of record was not inspected.
