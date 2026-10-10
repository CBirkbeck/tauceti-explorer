# Six operations, cohomological smoothness and biduality

This roadmap constructs exceptional operations on eligible maps of small v-stacks and develops cohomological smoothness, its geometric examples, biduality and conservativity. It builds on the diamond geometry and étale categories of the lower roadmaps. The plan is at target level: proof steps name the essential inputs; smaller lemmas remain inside those steps.

**Revision 2, issue #6955, Codex — codex-k3u5Fy, 10 October 2026.** All 90 original node ids and 31 planets are retained. The received independent review stays in the packet for a new independent review. No mathematical implementation is claimed.

The seven layers are planned. Four precise proof gaps and four supplier requests remain below; a planned layer is not a closed layer. The suggested Lean file elaborates at the pinned baseline with only admitted-proof warnings. Its register distinguishes actual typed declarations, formal or algebraic specializations and omitted geometric signatures. An omitted signature has its mathematical statement and required actual input recorded; it is not an elaborated declaration or a passed test.

## Conventions and ownership

Work on characteristic-p perfectoid test spaces, with p prime. Unless a target specifies F_ℓ or ℓ-power torsion, Λ is a commutative ring killed by an integer n prime to p. The enhanced D_ét is a presentable stable infinity category; its homotopy category and the ordinary Mathlib derived category are distinguished. Pullback, pushforward, tensor, internal Hom, étale extension by zero and proper base change are imported from DiamondEtaleCohomology C0–C7. EnhancedDerivedSheaves supplies the higher categorical constructions, rather than an arbitrary ordinary category with similarly named functors.

Canonical compactification belongs to **DiamondEtaleCohomology:C4**, effective v-descent to **DiamondsAndVStacks:D3**, and ECD §§11–13 geometry to **DiamondsAndVStacks:D5**, as required by RS-05 and RT-AREA-padic-1/11. S0 owns compactifiability and its calculus; it consumes the C4 construction. Actual node imports now replace the stale C0–C7, E0/E2/E3 and P1 blanket requests. Current TauCetiRoadmap and the current read-only Tau Ceti library were checked as well as the pins; existing supernatural order, index and Lagrange results are baseline citations.

Dimension takes values in the nonnegative integers together with −∞ for the empty space and +∞ for unbounded dimension (ECD Definition 21.1, p. 122). Local finiteness does not give a single global bound on a non-quasicompact target. The practical smoothness criterion imposes a finite bound after each strictly totally disconnected base change; its disjoint-union counterexample explains the correction to the v4 global wording.

For nonzero Λ, an invertible object locally represented by Λ[n] has cohomological degree −n. The degree is genuinely locally constant and can differ on different connected components. No uniqueness of degree is asserted for the zero ring. Reduction uses the actual map ℤ/ℓ^m → F_ℓ; general ℓ-power-torsion rings enter by extension of scalars, without assuming they map to F_ℓ.

Positive S6 statements use **Spa(C,O_C)** with C complete and algebraically closed of characteristic p. Strict total disconnection of an arbitrary Spa(C,C⁺) does not replace this base hypothesis. B is the actual O⁺-valued absolute perfectoid ball on Perf; μ_n supplies the Tate twist; Spd ℚ_p and all relative ball opens are named geometric objects. For averaging a free finite fibre of cardinal m, the mate is m⁻¹ times the canonical étale comparison. An arbitrary eligible map does not split its unit.

## Sources and library baseline

All source results and proof sketches below are in our own words. Locators use theorem, section and printed page numbers. No source passages or restricted reference files are reproduced. ECD v4 §§22–25 were read in full and their enhancement, compactification, constructibility and dimension dependencies were rechecked. Huber was read from the maintainer-cleared library only for the indicated consumer inputs.

- [Peter Scholze, Étale cohomology of diamonds](https://arxiv.org/abs/1709.07343v4): arXiv:1709.07343v4 (14 April 2026), final version to appear in Astérisque; 168 pp.. §22 Proper pushforward (pp. 127–139), read in full §23 Cohomologically smooth morphisms (pp. 140–151), read in full §24 Examples of smooth morphisms (pp. 151–158), read in full §25 Biduality (pp. 158–161), read in full statements of §§17–21 cited in these proofs (17.1–17.6, 18.1–18.10, 19.1–19.2, 19.5, 20.7–20.10, 20.17, 21.11–21.16) Accessed 6 October 2026; PDF page = printed page. Revision 2: ECD v4 §§22–25, pp. 127–161, read in full on 10 October 2026; prior dependency read log retained as provenance. Source results are stated in our own words with numbered locators; source excerpts removed. Revision 2 dependency recheck: §§17–19 cited enhancement, hyperdescent, compactification and proper-base-change statements read on 10 October 2026, including the component/topos computation on p. 110; §§20–21 locators rechecked for constructibility and dimension conventions. Preceding §7.6 component description and §3.1/3.8 completeness convention checked as needed. Revision 2 final dependency windows: Definition 3.1 and Proposition 3.8, pp. 14–15; Proposition 20.7, p. 115; Proposition 20.17, pp. 121–122; Proposition 21.11 and Remark 21.12 with proof, pp. 124–125, read 10 October 2026.
- [Roland Huber, Étale Cohomology of Rigid Analytic Varieties and Adic Spaces](https://link.springer.com/book/10.1007/978-3-663-09991-8): Aspects of Mathematics E30, 1996. Theorem 6.2.2 and Remark 6.2.4, p. 329; Theorem 7.2.2, p. 368; Proposition 7.4.4 and Theorems 7.5.1, 7.5.3 with Lemma 7.5.4, pp. 387–395, read on 10 October 2026. Only statements and proof dependencies needed for the H3 consumer were read, not the whole book.

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. Each of the 24 citations was read at its pin.

| Baseline declaration | Role |
| --- | --- |
| `mathlib:LocallyConstant` | Locally constant functions X → Y on a topological space; for profinite K, C⁰(K, Λ) with Λ discrete is LocallyConstant K Λ. |
| `mathlib:Subgroup.index` | The index Nat.card (G ⧸ H) of a subgroup; for open subgroups of a profinite group it is finite and agrees with profiniteIndex (ProfiniteProPGroups Layer 1). |
| `mathlib:JacobsonSpace` | A space in which closed points are dense in every closed subset (closure (Z ∩ closedPoints X) = Z). |
| `mathlib:nonempty_inter_closedPoints` | In a Jacobson space every nonempty locally closed subset contains a closed point. |
| `mathlib:JacobsonSpace.of_isOpenEmbedding` | An open subspace of a Jacobson space is Jacobson (with closed points the closed points of the ambient space it contains, Topology.IsOpenEmbedding.preimage_closedPoints). |
| `tauceti:TauCeti.profiniteOrder` | The existing supernatural order, defined primewise from finite quotients. |
| `tauceti:Subgroup.profiniteIndex` | The existing supernatural index, not a newly planned construction. |
| `tauceti:Subgroup.profiniteOrder_eq_mul_profiniteIndex` | For a closed subgroup of a compact totally disconnected topological group, ambient order equals subgroup order times supernatural index. |
| `tauceti:OpenSubgroup.profiniteIndex_eq_ofNat_index` | For an open subgroup, supernatural index agrees with its positive finite ordinary index. |
| `mathlib:CategoryTheory.Adjunction.comp_counit_app` | Composition formula for the counit; the shriekTrace API specializes this baseline formula. |
| `mathlib:ModuleCat.extendRestrictScalarsAdj` | Extension and restriction of scalars along an actual map of commutative rings are adjoint. |
| `mathlib:DerivedCategory` | The existing derived category of an abelian category; this is not the stable infinity category. |
| `mathlib:DerivedCategory.singleFunctor` | The module concentrated in a specified degree. |
| `mathlib:DerivedCategory.IsLE` | Upper cohomological bound in the actual standard t-structure. |
| `mathlib:DerivedCategory.IsGE` | Lower cohomological bound in the actual standard t-structure. |
| `mathlib:LocallyConstant.evalₗ` | Evaluation at a specified point as a linear functional, used for the Dirac obstruction. |
| `mathlib:TopCat.Presheaf.stalk` | Actual stalk, as the colimit over open neighborhoods. |
| `mathlib:Module.Dual.eval` | Canonical linear map into the double dual, used for the degree-zero point test. |
| `mathlib:ValuationSubring` | Valuation subrings of a field; the refinement proof uses these actual subrings, not a placeholder space. |
| `mathlib:IsLocalRing.exists_factor_valuationRing` | A map from a local ring to a field factors through a valuation subring by a local map. It supplies the proper residue valuation after localizing a finite-type domain at a nonzero maximal ideal. |
| `mathlib:finite_of_finite_type_of_isJacobsonRing` | A field algebra of finite type over a Jacobson ring is module-finite; over an algebraically closed field this is the Zariski-lemma step. |
| `mathlib:HasDerivedCategory.standard` | The existing localized derived category model, selected as a local instance in the prototype. |
| `mathlib:PadicInt.toZModPow` | The actual p-adic residue map modulo p^n used to define the concrete Haar indicator test. |
| `mathlib:PadicInt.compactSpace` | Compactness of the actual p-adic integer carrier used in the infinite Haar tests. |

## Supplier contracts and closure boundaries

The packet’s prerequisite lists give exact node ids. The supplier audit records the newly read contracts; their proof obligations remain with their owners. H3 now has explicit arbitrary-plus-ring/all-G duality and trace contracts. Cleared Huber Theorem 7.5.3 and Lemma 7.5.4 have that scope, but reading them does not complete H3’s separate proof plan. H5 retains its non-discrete local curve-compactification obligation.

The two former S6 detection gaps have a target-level proof: relative compactification is an open fibre product of total compactification, giving component openness in the residue-field valuation space; local valuation domination and Zariski lemma supply a closed valuation refining each basic-open point. Closed-stalk vanishing is then a sheaf argument on an actual Jacobson space. These steps appear in full at S6/closed-points-detect-vanishing. This does not assert that a general inverse limit is Jacobson.

### Huber duality over Spa(C, C⁺) with C⁺ ≠ O_C (inherited)

The exact higher-rank/all-G contracts now exist in H3/unbounded-open-coefficient-curve-duality and H3/plus-ring-top-trace-constancy, but their owner retains the higher-rank effacement, support-comparison and duality proof obligations. Hub96 Theorems 7.2.2 and 7.5.3 and Lemma 7.5.4 (pp. 368, 390–395) were read in the maintainer-cleared library on 10 October 2026 and have the needed scope. This packet records that source evidence and consumes H3; it does not rewrite or close that owner’s proof plan.

Consumers: `DiamondSixOperations:S5/ball-smooth`.

### Local compactification of smooth rigid curves over a non-discretely valued field (inherited)

The biduality proof needs the local form (L) of ClassicalAdicEtaleCohomology:H5/geometric-curve-compactification-export: every point of a quasicompact separated smooth rigid curve over an algebraically closed complete C has a neighbourhood embedding into a proper smooth curve. H5 records that Lütkebohmert's Theorem 5.3 is stated over discretely valued fields; the gap is owned there.

Consumers: `DiamondSixOperations:S6/biduality`.

### Nonfree profinite image-relation quotient geometry

For a qcqs 0-truncated profinite action on an eligible map, establish the image-relation quotient as a locally spatial diamond relative to the base, prove q proper and quasi-pro-étale, and the quotient eligibility/compactification/dimension facts used in ECD 24.3. D3/locally-profinite-torsors supplies these only for torsors; nonfree actions have stabilizers and finite quotient maps need not be étale. Requested from DiamondsAndVStacks:D4, importing D5 spatiality and C4 compactification rather than duplicating them.

Consumers: `DiamondSixOperations:S5/averaging-transformation`, `DiamondSixOperations:S5/nonfree-quotient-smooth`.

### Diamond fibre-dimension bound is not supplied by the analytic bound

C8/analytic-dimension-bound states fibreDimension ≤ analyticDimTrg for morphisms of analytic adic spaces. S1 applies this inequality to arbitrary locally spatial diamonds and their canonical compactifications. Establish fibreDimension(f) ≤ diamondDimTrg(f) for maps representable in locally spatial diamonds, via field-point/presentation comparison, and the compactification dimension comparison used in ECD 22.5. The analytic statement and the definition C8/diamond-dim-trg alone do not establish the transported inequality. Request this from C8 rather than planning its dimension theory here.

Consumers: `DiamondSixOperations:S1/compactification-cd-bound`, `DiamondSixOperations:S1/spatial-compactification-cd-bound`.

### Request to EnhancedDerivedSheaves:E2

Refine the actual hypercover and descent exports to the geometric presentation used by ECD 22.16–22.18: every small v-stack admits an augmented simplicial v-hypercover by quasiseparated locally spatial diamonds, with matching v-cover maps; two choices admit a common such refinement. E2/hypercover and E2/unbounded-hypercover-descent provide the topos definitions/descent, not this representable geometric existence theorem. Import D4 and C2 geometry, without a new stack theory.

Consumers: `DiamondSixOperations:S2/hypercover-independence`, `DiamondSixOperations:S2/hypercover-support-diagram`, `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/lower-shriek-base-change`.

### Request to EnhancedDerivedSheaves:E3

Neeman coproduct criterion with its compact-generation hypotheses: for an exact left adjoint L between compactly generated triangulated homotopy categories of the relevant presentable stable categories, its right adjoint preserves coproducts iff L carries compact generators to compact objects. Include the canonical bounded-constructible/spatial test-site application used in ECD 23.7. Existing E3 adjoint, Kan extension and mates nodes supply those constructions; they do not state this compactness criterion.

Consumers: `DiamondSixOperations:S4/direct-sum-criterion`.

### Request to DiamondsAndVStacks:D4

ECD proof of 24.3: for a continuous profinite K-action over Y on an eligible Y′ → Y, with K × Y′ → Y′ ×_Y Y′ 0-truncated and qcqs, form the quotient by the image relation, prove q : Y′ → Y′/K proper and quasi-pro-étale and f/K separated, representable in locally spatial diamonds and eligible. Import D5 for spatiality and C4 for the equivariant canonical compactification. This is the nonfree image-relation quotient, not the stack quotient retaining stabilizers and not merely D3’s torsor statement.

Consumers: `DiamondSixOperations:S5/averaging-transformation`, `DiamondSixOperations:S5/nonfree-quotient-smooth`.

### Request to DiamondEtaleCohomology:C8

Supply the diamond/v-stack form fibreDimension(f) ≤ diamondDimTrg(f) for maps representable in locally spatial diamonds, and the equality/comparison of dim.trg before and after canonical compactification used in ECD 22.5. The current analytic-dimension-bound is restricted to analytic adic spaces; diamond-dim-trg defines the invariant but does not supply this inequality. Import C4 compactification and D5 point presentations.

Consumers: `DiamondSixOperations:S1/compactification-cd-bound`, `DiamondSixOperations:S1/spatial-compactification-cd-bound`.

## Source findings and review resolutions

| Finding | Retained independent verdict | Current treatment |
| --- | --- | --- |
| E1, proof of Theorem 24.1, p. 152 (arXiv:1709.07343v4) | confirmed | Proposition 23.10 applies to compactifiable maps representable in spatial diamonds; add the check that f : B → * is compactifiable: B is separated, its canonical compactification is B‾(R, R⁺) = R°, and B → B‾ is the open subfunctor {\|T\| ≤ 1} (pullback along t ∈ R° is the rational subset {\|t\| ≤ 1} of Spa(R, R⁺)), so Proposition 22.3(i) applies. |
| E2, proof of Proposition 25.4, p. 161 (arXiv:1709.07343v4) | rejected | Rejected source-error verdict retained. The alternative valuation-refinement proof is now written from pinned local-domination and Zariski-lemma inputs, and the component-openness claim follows from relative compactification’s fibre-product identity and compactifiability. This improves this plan’s closure; it establishes no mistake in the source’s projective-model argument. |
| E3, Proposition 25.4, p. 161 (arXiv:1709.07343v4) | rejected | Rejected misprint verdict retained. All base-field signatures explicitly include completeness; ECD Definitions 3.1/Proposition 3.8 provide the paper’s convention. |
| E4, Proposition 23.10(i), p. 145 (arXiv:1709.07343v4) | confirmed | Confirmed local-dimension correction retained. The counterexample is descended on the target component cover via 23.15, with local dim.trg finiteness retained. The reviewer’s historical explanation mentioning source locality is not used for this step. |

E1 adds the missing rational-open compactifiability check for the ball. E2 and E3 remain rejected as source-error claims: the alternate valuation proof improves closure, and explicit completeness pins a convention. E4 retains the confirmed per-spatial-base-change dimension correction and uses target locality for its disjoint-union example.

## Suggested signatures and tests

| Packet occurrences | Typed relative | Specialization | Omitted |
| --- | ---: | ---: | ---: |
| declarations | 1 | 7 | 91 |
| api | 7 | 18 | 116 |
| tests | 0 | 15 | 58 |

Counts here are occurrences in target/API/test lists; some names appear in both a target and its API. The Lean file has 47 distinct named declarations plus its concrete example signatures. Comments do not count as declarations. Typed-relative Haar uses actual compact groups and unit indices. Specializations use actual ModuleCat/DerivedCategory, finite indexing fibres, ring maps, valuation subrings and topological sheaves. They do not supply geometric six-operation signatures.

The concrete examples include two different component shifts, a rank-two non-example, the negative cohomological shift sign, F₅ averaging over Fin 2, Haar over C₂ and ℤ₂, the ℤ₅ obstruction and a Dirac distribution outside the density image. They do not assume the computation or obstruction they test. Ball, roots-of-unity and valued-plus duality examples require the absent actual supplier carriers and remain named mathematical specifications.

Each target below states its signature coverage. Every definition/construction has an API and at least three mathematical tests. Full signatures omitted under PROTOCOL §13 must be supplied on the actual named carriers; they must never be encoded as opaque Prop fields.

## S0. Compactifiable morphisms

Stage `DiamondSixOperations:S0`: **planned**.

Remaining acceptance inputs:

- Full compactifiability/local-splitting signatures require the actual v-stack and geometric morphism carriers; the relative factorization prototype states only its displayed Mathlib specialization.

### Compactifiable morphisms of v-stacks

`DiamondSixOperations:S0/compactifiable-morphism` · definition · planet: **Compactifiable morphism**

A morphism f : Y′ → Y of v-stacks is compactifiable if there are a v-stack Z, an open immersion j : Y′ → Z and a partially proper morphism g : Z → Y with f = g ∘ j. Open immersions are those of DiamondsAndVStacks D3 (every pullback to a perfectoid space is representable by an open immersion); partially proper morphisms are those of ECD Definition 18.4 (separated, with unique lifts from Spa(R, R°) to Spa(R, R⁺) for perfectoid Tate R and open integrally closed R⁺), owned by DiamondEtaleCohomology C4. No quasicompactness, representability or dimension condition is part of the definition; those enter only through the eligible classes (S0/eligible-morphism, S0/spatial-eligible-morphism). The factorisation is not part of the data: by S0/compactifiable-iff-separated-open there is a canonical one, through the canonical compactification of C4.

Hypotheses:

- f a morphism of v-stacks on Perf (characteristic-p perfectoid spaces); no smallness assumption.
- Open immersion and partially proper are the supplier notions of DiamondsAndVStacks D3 and DiamondEtaleCohomology C4 (ECD Definitions 10.7 and 18.4), used without change.

Named declarations: `IsCompactifiable`.

Construction or proof:

1. Define IsCompactifiable f as the existence of (Z, j, g) with j an open immersion, g partially proper and g ∘ j = f.
2. Open immersions and partially proper maps are separated (D3, C4), so a compactifiable map is separated (composites of separated maps are separated, D3).
3. Proper maps are partially proper (ECD 18.3 with 18.9, owned by C4) and open immersions are compactifiable with g the identity; both are recorded as constructors.

Direct prerequisites: `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Definition 22.2, p. 128. The factorization defining compactifiability.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), §22, after Definition 22.2, p. 128. The factorisation is canonical (S0/compactifiable-iff-separated-open), which is why only existence is stored.

Uses:

- ECD Definitions 22.4, 22.13 and 22.18: the domain of the exceptional direct image Rf_! is a class of compactifiable maps
- ECD Definition 23.8: ℓ-cohomological smoothness requires f compactifiable
- ECD Propositions 24.2–24.4 (proofs): quotient maps and smooth analytic maps are shown compactifiable via Proposition 22.3
- VStackSheavesAndLisseCategories:VS0 (Fargues–Scholze IV.1): charts of Artin v-stacks are separated cohomologically smooth, hence compactifiable, maps
- AdicCoefficientsAndComparisons:L3–L4 (ECD 27.4–27.5): the scheme-to-diamond comparison of Rf_! needs the diamond map compactifiable

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `IsCompactifiable.mk` | constructor | If j : Y′ → Z is an open immersion and g : Z → Y is partially proper then g ∘ j is compactifiable. | specialization: Relative factorization constructor on the displayed O,P. |
| `IsCompactifiable.of_isOpenImmersion` | constructor | Every open immersion is compactifiable (take g the identity, which is partially proper). | specialization: Relative factorization with P.ContainsIdentities. |
| `IsCompactifiable.of_isPartiallyProper` | constructor | Every partially proper morphism, in particular every proper morphism, is compactifiable (take j the identity). | specialization: Relative factorization with O.ContainsIdentities. |
| `IsCompactifiable.isSeparated` | projection | A compactifiable morphism is separated. | specialization: Relative factorization with O≤S, P≤S and composition stability of S. |
| `isCompactifiable_iff` | characterisation | f is compactifiable iff f is separated and the natural map Y′ → (Y′)‾^{/Y} into the canonical compactification of C4 is an open immersion (S0/compactifiable-iff-separated-open). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsCompactifiable.baseChange` | functoriality | Compactifiability is stable under base change along any map of v-stacks (S0/compactifiable-base-change). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsCompactifiable.comp` | structure | A composite of compactifiable morphisms is compactifiable (S0/compactifiable-composition). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsCompactifiable.of_separated_etale` | compatibility | A separated étale morphism (D3) is compactifiable (S0/separated-etale-compactifiable). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `IsCompactifiable.id` | degenerate | For every v-stack Y, the identity of Y is compactifiable. | specialization: Relative identity test with both genuine ContainsIdentities laws. |
| `IsCompactifiable.generic_point_inclusion` | computation | For C complete algebraically closed and C⁺ ⊊ O_C an open bounded valuation subring, j : Spa(C, O_C) → Spa(C, C⁺) is a compactifiable open immersion and its canonical compactification over Spa(C, C⁺) is the identity of Spa(C, C⁺): every map Spa(R, R°) → Spa(C, C⁺) factors through Spa(C, O_C). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `not_isCompactifiable_doubled_origin` | non-example | Let B be the perfectoid closed unit ball over Spa(C, O_C) and Y′ = B ⊔_{B∖{0}} B the ball with doubled origin (two copies glued along the open complement of the origin). The map Y′ → B is étale and surjective but not separated, so it is not compactifiable. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsCompactifiable.proper` | characterisation | A proper map of v-stacks (quasicompact, separated, universally closed; ECD 18.1) is compactifiable with canonical compactification itself. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Acceptance:

- The identity, open immersions, proper maps and separated étale maps are compactifiable; the doubled-origin ball over the ball is not (it is not separated).

Suggested target signatures:

- `IsCompactifiable`: specialization. Relative factorization in a Mathlib category with displayed morphism properties O,P; geometric open immersions/partial properness are omitted.

Actual input required: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.

### Compactifiability through the canonical compactification

`DiamondSixOperations:S0/compactifiable-iff-separated-open` · theorem · planet: **Canonical factorisation of a compactifiable map**

Let f : Y′ → Y be a morphism of v-stacks, and when f is separated let (Y′)‾^{/Y} → Y be its canonical compactification (DiamondEtaleCohomology C4, ECD Proposition 18.6) with the natural map Y′ → (Y′)‾^{/Y}. Then f is compactifiable if and only if f is separated and Y′ → (Y′)‾^{/Y} is an open immersion. In that case f = f‾ ∘ j with j : Y′ → (Y′)‾^{/Y} the open immersion and f‾ : (Y′)‾^{/Y} → Y partially proper; this is the canonical factorisation used to define Rf_!.

Hypotheses:

- f a morphism of v-stacks; the canonical compactification exists for separated f (C4).

Named declarations: `isCompactifiable_iff_isSeparated_and_isOpenImmersion`.

Construction or proof:

1. (⇐) The map (Y′)‾^{/Y} → Y is partially proper (C4, ECD Corollary 18.8(i)), so Y′ → (Y′)‾^{/Y} → Y exhibits f as compactifiable.
2. (⇒) Let Y′ → Z → Y be an open immersion followed by a partially proper map. Open immersions and partially proper maps are separated (D3, C4), so f is separated.
3. By the universal property of the canonical compactification (C4, ECD 18.6) the open immersion extends uniquely to h : (Y′)‾^{/Y} → Z over Y; h is still an injection.
4. Hence Y′ → (Y′)‾^{/Y} is the pullback of the open immersion Y′ → Z along h, and open immersions are stable under pullback (D3).

Direct prerequisites: `DiamondSixOperations:S0/compactifiable-morphism`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.3(i), p. 128. Statement; the target of the natural map is the canonical compactification (overline with superscript /Y lost in the text layer).

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.3(i), p. 128. The first half of the proof.

Acceptance:

- For j : Spa(C, O_C) → Spa(C, C⁺) the natural map is j itself and is open; for the doubled-origin ball the map is not separated and the criterion fails.

Suggested target signatures:

- `isCompactifiable_iff_isSeparated_and_isOpenImmersion`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.

### Compactifiability is stable under base change

`DiamondSixOperations:S0/compactifiable-base-change` · theorem

Let f : Y′ → Y and Ỹ → Y be morphisms of v-stacks with pullback f̃ : Ỹ′ = Y′ ×_Y Ỹ → Ỹ. If f is compactifiable, then f̃ is compactifiable.

Hypotheses:

- Any morphism Ỹ → Y of v-stacks.

Named declarations: `IsCompactifiable.baseChange`.

Construction or proof:

1. By S0/compactifiable-iff-separated-open, f is separated and Y′ → (Y′)‾^{/Y} is an open immersion.
2. Separatedness is stable under base change (D3), and the canonical compactification commutes with base change in Y: (Ỹ′)‾^{/Ỹ} = (Y′)‾^{/Y} ×_Y Ỹ (C4, proof of ECD Corollary 18.8, which reduces to the formula (Y′)‾^{/Y} = (Y′)‾ ×_{Y‾} Y).
3. So Ỹ′ → (Ỹ′)‾^{/Ỹ} is a pullback of the open immersion Y′ → (Y′)‾^{/Y}, hence an open immersion; apply the criterion again.

Direct prerequisites: `DiamondSixOperations:S0/compactifiable-iff-separated-open`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.3(ii), p. 128. Statement (f̃ appears as fe in the text layer).

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.3, p. 128. The route through part (i).

Acceptance:

- The pullback of the compactifiable open immersion Spa(C, O_C) → Spa(C, C⁺) along Spa(C′, C′⁺) → Spa(C, C⁺) is compactifiable.

Suggested target signatures:

- `IsCompactifiable.baseChange`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.

### Compactifiability is v-local on the target

`DiamondSixOperations:S0/compactifiable-v-local` · theorem

Let f : Y′ → Y and g : Ỹ → Y be morphisms of v-stacks with pullback f̃ : Ỹ′ → Ỹ. If f̃ is compactifiable and g is a surjective map of v-stacks, then f is compactifiable.

Hypotheses:

- g surjective as a map of v-stacks (not merely topologically surjective; D4 separates the two).

Named declarations: `IsCompactifiable.of_baseChange_of_surjective`.

Construction or proof:

1. By S0/compactifiable-iff-separated-open applied to f̃, f̃ is separated and Ỹ′ → (Ỹ′)‾^{/Ỹ} is an open immersion.
2. Separatedness and being an open immersion descend along surjections of v-stacks (D3, ECD Proposition 10.11).
3. The canonical compactification commutes with base change (C4), so Ỹ′ → (Ỹ′)‾^{/Ỹ} is the pullback of Y′ → (Y′)‾^{/Y} along the surjection (Y′)‾^{/Y} ×_Y Ỹ → (Y′)‾^{/Y}; the latter is an open immersion, and part (i) gives the claim.

Direct prerequisites: `DiamondSixOperations:S0/compactifiable-iff-separated-open`, `DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.3(iii), p. 128. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.3, p. 128. The reformulation as v-locality.

Acceptance:

- Compactifiability of a map to Spa(C, C⁺) can be tested after pullback to a strictly totally disconnected cover.

Suggested target signatures:

- `IsCompactifiable.of_baseChange_of_surjective`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.

### Composites of compactifiable morphisms

`DiamondSixOperations:S0/compactifiable-composition` · theorem

If Y₁ → Y₂ and Y₂ → Y₃ are compactifiable morphisms of v-stacks, then the composite Y₁ → Y₃ is compactifiable.

Hypotheses:

- Both maps compactifiable; no representability is needed.

Named declarations: `IsCompactifiable.comp`.

Construction or proof:

1. By S0/compactifiable-v-local we may work v-locally on Y₃ and assume Y₃, hence every Yᵢ, separated (compactifiable maps are separated).
2. Then Y₂ → (Y₂)‾^{/Y₃} and Y₁ → (Y₁)‾^{/Y₂} are open immersions (part (i)).
3. With Y‾ the absolute canonical compactification and (Y′)‾^{/Y} = (Y′)‾ ×_{Y‾} Y (C4, proof of ECD Corollary 18.8), the natural map Y₁ → (Y₁)‾^{/Y₃} is the composite Y₁ → (Y₁)‾ ×_{(Y₂)‾} Y₂ → (Y₁)‾ ×_{(Y₂)‾} (Y₂)‾^{/Y₃} = (Y₁)‾ ×_{(Y₃)‾} Y₃; the first map is the open immersion of part (i) for Y₁ → Y₂, the second the pullback of the open immersion Y₂ → (Y₂)‾^{/Y₃}.
4. Composites of open immersions are open immersions (D3); apply part (i).

Direct prerequisites: `DiamondSixOperations:S0/compactifiable-iff-separated-open`, `DiamondSixOperations:S0/compactifiable-v-local`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.3(iv), p. 128. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.3(iv), p. 128. The reduction to separated targets.

Acceptance:

- The composite of the open immersion D ⊂ B (open unit disc in the ball) and of B → * is compactifiable.

Suggested target signatures:

- `IsCompactifiable.comp`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.

### Compactifiability is local on the source for open covers

`DiamondSixOperations:S0/compactifiable-local-on-source` · theorem

Let f : Y′ → Y be separated and representable in locally spatial diamonds, and suppose Y′ is covered by open subfunctors V ⊂ Y′ with f|_V : V → Y compactifiable. Then f is compactifiable. Moreover, for every such open V ⊂ Y′ the composite V → Y′ → (Y′)‾^{/Y} is an open immersion.

Hypotheses:

- f separated and representable in locally spatial diamonds (D5); the cover is by open subfunctors (D4: open subsets of |Y′|).

Named declarations: `IsCompactifiable.of_openCover`.

Construction or proof:

1. It suffices to show that for every open V ⊂ Y′ with f|_V compactifiable, V → (Y′)‾^{/Y} is an open immersion; then Y′ is a union of open subfunctors of (Y′)‾^{/Y}.
2. Replace Y by (Y′)‾^{/Y} (so Y′ ⊂ Y is an injection) and work v-locally on Y (D3 descent of open immersions): Y = Spa(A, A⁺) strictly totally disconnected.
3. By ECD Proposition 10.5 (sub-v-sheaves of a totally disconnected space are filtered colimits of pro-constructible generalizing subsets, D3), Y′ is a filtered union of open subspaces Spa(A, (A⁺)′) of Y′ with A⁺ ⊂ (A⁺)′; a quasicompact V lies in one of them.
4. For x ∈ V choose a rational subset U = {|fᵢ| ≤ |g|} of Y with x ∈ Spa(A, (A⁺)′) ∩ U ⊂ V; then U ⊂ (V)‾^{/Y} = V‾ and V ⊂ V‾ is open, so U ∩ V is open in U, giving an open neighbourhood of x in Y contained in Y′.

Direct prerequisites: `DiamondSixOperations:S0/compactifiable-iff-separated-open`, `DiamondsAndVStacks:D5/relative-representability`, `DiamondsAndVStacks:D3/sub-v-sheaves-of-totally-disconnected-spaces`, `DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.3(v), p. 128. Statement, first sentence.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.3(v), p. 128. The reduction to the open-immersion assertion.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.3(v), p. 129. The conclusion of the local argument.

Acceptance:

- A union of two compactifiable open subspaces of a separated locally spatial diamond over Spa(C, O_C) is compactifiable.

Suggested target signatures:

- `IsCompactifiable.of_openCover`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.

### Separated étale maps are compactifiable

`DiamondSixOperations:S0/separated-etale-compactifiable` · theorem

Every separated étale morphism f : Y′ → Y of v-stacks (étale in the sense of DiamondsAndVStacks D3, hence locally separated and representable after pullback to perfectoid spaces) is compactifiable.

Hypotheses:

- f separated and étale.

Named declarations: `IsCompactifiable.of_isSeparated_of_isEtale`.

Construction or proof:

1. By S0/compactifiable-v-local we may assume Y = X is a strictly totally disconnected perfectoid space; then Y′ = X′ is a perfectoid space separated and étale over X (D3).
2. By S0/compactifiable-local-on-source (X′ is locally spatial and f is separated) we may assume X′ quasicompact.
3. A quasicompact separated étale perfectoid space over a strictly totally disconnected X is a finite disjoint union of quasicompact open subspaces of X (every étale cover of X splits, D1), so X′ → ⊔ X → X is an open immersion followed by a finite étale, hence proper, map.

Direct prerequisites: `DiamondSixOperations:S0/compactifiable-v-local`, `DiamondSixOperations:S0/compactifiable-local-on-source`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.3(vi), p. 128. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.3(vi), p. 129. The local structure used.

Acceptance:

- A finite étale map and a quasicompact open immersion are compactifiable; the doubled-origin ball (étale, not separated) is excluded by hypothesis.

Suggested target signatures:

- `IsCompactifiable.of_isSeparated_of_isEtale`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.

### Maps with local sections after pullback to strictly totally disconnected spaces

`DiamondSixOperations:S0/locally-split-map` · definition

A morphism g : Z → Y′ of v-stacks is locally split if it is separated and surjective (as a map of v-stacks) and, for every strictly totally disconnected perfectoid space X with a map X → Y′, every point of |X| has an open neighbourhood U ⊂ X over which Z ×_{Y′} U → U admits a section. The condition is stored as data on each use; it is not implied by universal openness, by being a v-cover, or by ℓ-cohomological smoothness, and ECD records that the source-descent statement fails without it.

Hypotheses:

- Strictly totally disconnected perfectoid spaces are those of DiamondsAndVStacks D1; surjectivity of maps of v-stacks is that of D4.

Named declarations: `IsLocallySplit`.

Construction or proof:

1. Define IsLocallySplit g as: g separated, g surjective, and the local-section condition on every strictly totally disconnected test space.
2. Since X is quasicompact and totally disconnected, the neighbourhoods can be refined to a finite partition of X into open and closed subsets carrying sections; this normal form is the constructor IsLocallySplit.of_clopen_sections.

Direct prerequisites: `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`, `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.3(vii), p. 128. The condition, in the stated form.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.3, footnote 5, p. 128. Why the condition is part of the data.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Remark 23.14 and following paragraph, p. 150. The second use of the condition.

Uses:

- ECD Proposition 22.3(vii): the hypothesis on g in source descent of compactifiability
- ECD Remark after 23.14, p. 150: the compactifiability hypothesis in the converse of 23.13 may be dropped when the smooth surjection is locally split
- VStackSheavesAndLisseCategories:VS1 (Fargues–Scholze IV.3.5): formally smooth maps have local sections after pullback to strictly totally disconnected spaces; VS1 proves that, and this predicate is its conclusion

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `IsLocallySplit.isSeparated` | projection | A locally split map is separated. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsLocallySplit.surjective` | projection | A locally split map is a surjection of v-stacks. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsLocallySplit.of_section` | constructor | A separated map with a global section s (g ∘ s = id) is locally split. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsLocallySplit.of_clopen_sections` | constructor | If for every strictly totally disconnected X → Y′ there is a finite partition of X into open and closed subsets over each of which Z ×_{Y′} X has a section, and g is separated and surjective, then g is locally split. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsLocallySplit.baseChange` | functoriality | If g : Z → Y′ is locally split and Y″ → Y′ is any map, then Z ×_{Y′} Y″ → Y″ is locally split. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsLocallySplit.comp` | structure | A composite of locally split maps is locally split. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsLocallySplit.of_separated_etale_surjective` | compatibility | A separated étale surjection is locally split, because every étale cover of a strictly totally disconnected space splits (D1). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `IsLocallySplit.id` | degenerate | The identity of any v-stack is locally split. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsLocallySplit.openCover` | computation | For an open cover {Uᵢ} of a v-sheaf Y′, the map ⊔ᵢ Uᵢ → Y′ is locally split (it is separated étale and surjective). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `not_isLocallySplit_field_extension` | non-example | For complete algebraically closed C ⊊ C′, the map Spa(C′, O_C′) → Spa(C, O_C) is a separated surjection of v-sheaves without a section over the strictly totally disconnected Spa(C, O_C) (a section would be a continuous C-algebra map C′ → C), so it is not locally split. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsLocallySplit.trivial_torsor` | characterisation | For a profinite group K and a strictly totally disconnected X, the projection K × X → X is locally split. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Acceptance:

- Separated étale surjections are locally split; Spa(C′, O_C′) → Spa(C, O_C) for C ⊊ C′ is a separated v-cover that is not.

Suggested target signatures:

- `IsLocallySplit`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.

### Descent of compactifiability along locally split maps

`DiamondSixOperations:S0/compactifiable-source-descent` · theorem

Let f : Y′ → Y be separated and representable in locally spatial diamonds, and let g : Z → Y′ be locally split (S0/locally-split-map) with f ∘ g compactifiable. Then f is compactifiable. Consequently, for separated maps representable in locally spatial diamonds, compactifiability is étale local on the source. Whether the local-splitting hypothesis can be replaced by universal openness of g is open (ECD footnote 5); the older statement without it is false and is not a target.

Hypotheses:

- f separated, representable in locally spatial diamonds; g locally split (separated, surjective, local sections over strictly totally disconnected spaces).

Named declarations: `IsCompactifiable.of_comp_of_isLocallySplit`.

Construction or proof:

1. As in part (v), replace Y by (Y′)‾^{/Y}; it suffices to show that the injection Y′ → Y is an open immersion, which can be checked v-locally on Y (D3): Y = Spa(A, A⁺) strictly totally disconnected, so Y′ is a locally spatial diamond.
2. By S0/compactifiable-local-on-source we may assume Y′ quasicompact; then Y′ is itself strictly totally disconnected (a quasicompact open of a sub-v-sheaf of Y, ECD 10.5 and 7.6).
3. Now g has local sections over Y′, so Y′ is covered by opens V over which f|_V factors through the compactifiable f ∘ g; compactifiability of f|_V follows by cancellation (S0/compactifiable-cancellation, g separated), and part (v) concludes.

Direct prerequisites: `DiamondSixOperations:S0/locally-split-map`, `DiamondSixOperations:S0/compactifiable-local-on-source`, `DiamondSixOperations:S0/compactifiable-cancellation`, `DiamondSixOperations:S0/compactifiable-iff-separated-open`, `DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondsAndVStacks:D5/relative-representability`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.3(vii), p. 128. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.3(vii), p. 129. Where the hypothesis is used.

Acceptance:

- A separated étale surjection g satisfies the hypothesis; the field extension Spa(C′, O_C′) → Spa(C, O_C) does not, and no conclusion is drawn from it.

Suggested target signatures:

- `IsCompactifiable.of_comp_of_isLocallySplit`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.

### Cancellation for compactifiable morphisms

`DiamondSixOperations:S0/compactifiable-cancellation` · theorem

Let f : Y′ → Y and g : Y → Z be morphisms of v-stacks with g separated. If g ∘ f is compactifiable, then f is compactifiable.

Hypotheses:

- g separated; no hypothesis on f beyond the morphism. Representability and dimension hypotheses on f are not produced by this statement and must be supplied separately in S0/eligible-morphism.

Named declarations: `IsCompactifiable.of_comp`.

Construction or proof:

1. f is separated: g ∘ f is separated and g is separated (D3 cancellation).
2. There are injections Y′ → (Y′)‾^{/Y} → (Y′)‾^{/Z}: with the absolute formula of C4, (Y′)‾^{/Y} = (Y′)‾ ×_{Y‾} Y → (Y′)‾ ×_{Z‾} Z = (Y′)‾^{/Z} is the pullback of Y → Y‾^{/Z}, which is injective because g is separated (C4).
3. The composite is an open immersion (part (i) for g ∘ f), and the first map is its pullback along the second, hence an open immersion; part (i) concludes.

Direct prerequisites: `DiamondSixOperations:S0/compactifiable-iff-separated-open`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.3(viii), p. 128. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.3(viii), p. 129. The proof.

Acceptance:

- For Y′ ⊂ Y an open subspace of a compactifiable Y → Z with Y → Z separated, the inclusion is compactifiable (consistent with S0/compactifiable-morphism, open immersions).

Suggested target signatures:

- `IsCompactifiable.of_comp`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.

### Eligible morphisms: the domain of the exceptional operations

`DiamondSixOperations:S0/eligible-morphism` · definition · planet: **Eligible morphism**

A morphism f : Y′ → Y of small v-stacks is eligible if (a) f is compactifiable (S0/compactifiable-morphism), (b) f is representable in locally spatial diamonds (DiamondsAndVStacks D5), and (c) locally dim.trg f < ∞ (DiamondEtaleCohomology C8: after pullback to any spatial diamond X → Y, every quasicompact open subspace of Y′ ×_Y X has finite dim.trg over X; the bound depends on the open). These are exactly the hypotheses of ECD Definition 22.18, Theorem 23.1 and Proposition 23.3; with nΛ = 0 for some n prime to p they make Rf_! and Rf^! defined. Local finiteness is not a global bound; the globally finite variant is S0/spatial-eligible-morphism.

Hypotheses:

- f a morphism of small v-stacks (D4); the three conditions are independent and all three are stored.

Named declarations: `IsEligible`.

Construction or proof:

1. Define IsEligible f as the conjunction of IsCompactifiable f, IsRepresentableInLocallySpatialDiamonds f (D5) and LocallyFiniteDimTrg f (C8).
2. Base change: (a) by S0/compactifiable-base-change, (b) since representability in locally spatial diamonds is a condition on pullbacks (D5), (c) by C8/diamond-dim-base-change, which bounds dim.trg of a pullback by that of the map.
3. Composition: (a) by S0/compactifiable-composition, (b) by D5 (composites of maps representable in locally spatial diamonds), (c) by C8/diamond-dim-composition applied on quasicompact opens.
4. Separated étale maps: (a) S0/separated-etale-compactifiable, (b) étale maps into locally spatial diamonds have locally spatial source (D5/quasi-pro-etale-and-fibre-product-permanence), (c) dim.trg of an étale map is 0 (completed residue fields agree).

Direct prerequisites: `DiamondSixOperations:S0/compactifiable-morphism`, `DiamondsAndVStacks:D5/relative-representability`, `DiamondEtaleCohomology:C8/locally-finite-dim-trg`, `DiamondEtaleCohomology:C8/diamond-dim-base-change`, `DiamondEtaleCohomology:C8/diamond-dim-composition`, `DiamondSixOperations:S0/compactifiable-base-change`, `DiamondSixOperations:S0/compactifiable-composition`, `DiamondSixOperations:S0/separated-etale-compactifiable`, `DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Convention 22.1, p. 127. The standing hypotheses (b) and (c).

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Definition 22.18, p. 137. The three conditions together, as the domain of Rf_!.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), §22, p. 135. The meaning of locally dim.trg f < ∞.

Uses:

- ECD Definition 22.18 and Propositions 22.19–22.23: the domain on which Rf_! is constructed and satisfies base change, colimit preservation, composition and the projection formula
- ECD Theorem 23.1, Proposition 23.3 and Proposition 23.16(i): the domain on which Rf^! exists and the formal identities hold
- ECD Definition 23.8: an ℓ-cohomologically smooth map is in particular eligible
- VStackSheavesAndLisseCategories:VS0, VS2: stacky and solid six-functor constructions descend the eligible-class operations along charts
- AdicCoefficientsAndComparisons:L3 (ECD 27.4): the comparison of Rf_! with Huber's requires the diamond map eligible
- IgusaVarietiesAndTorsionConcentration:IG.3: the maps whose compactly supported cohomology is computed must be supplied with eligibility witnesses

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `IsEligible.mk` | constructor | From IsCompactifiable f, representability of f in locally spatial diamonds and LocallyFiniteDimTrg f. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsEligible.isCompactifiable` | projection | An eligible map is compactifiable. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsEligible.representable` | projection | An eligible map is representable in locally spatial diamonds. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsEligible.locallyFiniteDimTrg` | projection | An eligible map has locally finite dim.trg. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsEligible.baseChange` | functoriality | If f is eligible and Ỹ → Y is any map of small v-stacks, the pullback f̃ is eligible. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsEligible.comp` | structure | Composites of eligible maps are eligible. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsEligible.of_separated_etale` | compatibility | A separated étale map of small v-stacks is eligible. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsEligible.of_isSpatialEligible` | relation | A spatial-eligible map (S0/spatial-eligible-morphism) is eligible. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsEligible.restrict_open` | other | If f is eligible and V ⊂ Y′ is open, then f\|_V is eligible (open immersions are separated étale; compose). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `IsEligible.id` | degenerate | The identity of a small v-stack is eligible. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsEligible.ball` | computation | The structure map of the absolute ball B → * (S5/perfectoid-ball) is eligible, with dim.trg equal to 1. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `not_isEligible_infinite_dimTrg` | non-example | For complete algebraically closed C ⊂ C′ with tr.c̃(C′/C) = ∞, the map Spa(C′, O_C′) → Spa(C, O_C) is qcqs and representable in spatial diamonds but not eligible, because dim.trg is infinite on its only (quasicompact) open. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsEligible.openDisc` | computation | The open unit disc D ⊂ B over Spa(C, O_C) maps eligibly to Spa(C, O_C), although D is not quasicompact: on each closed subdisc dim.trg is 1. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Acceptance:

- Separated étale maps, open immersions, the ball B → * and the punctured open disc over Spa(C, O_C) are eligible; a qcqs map with infinite dim.trg is not.

Suggested target signatures:

- `IsEligible`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.

### Spatial-eligible morphisms: the quasicompact domain of Rf_!

`DiamondSixOperations:S0/spatial-eligible-morphism` · definition

A morphism f : Y′ → Y of small v-stacks is spatial-eligible if it is compactifiable, representable in spatial diamonds (D5: representable in locally spatial diamonds and qcqs) and dim.trg f < ∞ globally (C8: one finite bound over all spatial diamond test objects). These are the hypotheses of ECD Definition 22.4, Theorem 22.5 and Propositions 22.8–22.12. The canonical compactification (Y′)‾^{/Y} of a spatial-eligible map need not be representable in spatial diamonds; the stronger hypothesis that it is enters only in S1/spatial-compactification-cd-bound.

Hypotheses:

- f a morphism of small v-stacks; the finite bound on dim.trg is global.

Named declarations: `IsSpatialEligible`.

Construction or proof:

1. Define IsSpatialEligible f as the conjunction of IsCompactifiable f, representability in spatial diamonds and diamondDimTrg f < ∞ (C8).
2. Representable in spatial diamonds ⇔ representable in locally spatial diamonds and qcqs (D5), so spatial-eligible = eligible + quasicompact + quasiseparated + a global dim.trg bound.
3. Stability: base change (S0/compactifiable-base-change, D5, C8/diamond-dim-base-change), composition (S0/compactifiable-composition, D5, C8/diamond-dim-composition), and restriction to quasicompact opens of the source.

Direct prerequisites: `DiamondSixOperations:S0/compactifiable-morphism`, `DiamondsAndVStacks:D5/relative-representability`, `DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondEtaleCohomology:C8/diamond-dim-base-change`, `DiamondEtaleCohomology:C8/diamond-dim-composition`, `DiamondSixOperations:S0/eligible-morphism`, `DiamondSixOperations:S0/compactifiable-base-change`, `DiamondSixOperations:S0/compactifiable-composition`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Definition 22.4, p. 129. The hypotheses of the quasicompact definition.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Theorem 22.5, p. 130. The compactification of a spatial-eligible map need not be spatial; spatiality of it is an extra hypothesis.

Uses:

- ECD Definition 22.4, Theorem 22.5, Propositions 22.8–22.12: the domain of Rf_! = Rf‾_* j_! and its first properties
- ECD Definition 22.13 and Proposition 22.14: the restrictions f|_V to opens quasicompact over the base are spatial-eligible
- ECD Propositions 23.7 and 23.10: the direct-sum and practical smoothness criteria are stated for maps representable in spatial diamonds

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `IsSpatialEligible.mk` | constructor | From compactifiability, representability in spatial diamonds and a finite dim.trg bound. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsSpatialEligible.isEligible` | projection | A spatial-eligible map is eligible. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsSpatialEligible.qcqs` | projection | A spatial-eligible map is quasicompact and quasiseparated. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsSpatialEligible.dimTrg_lt_top` | projection | diamondDimTrg f < ∞. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `isSpatialEligible_iff` | characterisation | f is spatial-eligible iff f is eligible, qcqs and of globally finite dim.trg. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsSpatialEligible.baseChange` | functoriality | Stable under base change along any map of small v-stacks. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsSpatialEligible.comp` | structure | Stable under composition. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsSpatialEligible.restrict_qc_open` | other | If f is eligible and V ⊂ Y′ is an open subspace that is quasicompact over a spatial Y, then f\|_V is spatial-eligible; this is the input of the left Kan extension in S2. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `IsSpatialEligible.id` | degenerate | The identity of a spatial diamond is spatial-eligible. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsSpatialEligible.ball` | computation | B × X → X is spatial-eligible for every affinoid perfectoid X, with dim.trg 1. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `not_isSpatialEligible_openDisc` | non-example | The open unit disc D → Spa(C, O_C) is eligible but not spatial-eligible: it is not quasicompact. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsSpatialEligible.qc_open_immersion` | computation | A quasicompact open immersion into a spatial diamond is spatial-eligible with dim.trg 0. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Acceptance:

- The ball B → * is spatial-eligible; the open unit disc D → Spa(C, O_C) is eligible but not spatial-eligible (not quasicompact).

Suggested target signatures:

- `IsSpatialEligible`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.

### Cancellation in the eligible class, with its extra hypotheses retained

`DiamondSixOperations:S0/eligible-cancellation` · theorem

Let f : Y′ → Y and g : Y → Z be morphisms of small v-stacks. If g ∘ f is eligible, g is separated, f is representable in locally spatial diamonds and locally dim.trg f < ∞, then f is eligible. The two last hypotheses are not consequences of the others in this statement and are kept explicit.

Hypotheses:

- g separated; f representable in locally spatial diamonds with locally dim.trg f < ∞.

Named declarations: `IsEligible.of_comp`.

Construction or proof:

1. Compactifiability of f is S0/compactifiable-cancellation (g separated).
2. The other two conditions are hypotheses; S0/eligible-morphism then applies.

Direct prerequisites: `DiamondSixOperations:S0/compactifiable-cancellation`, `DiamondSixOperations:S0/eligible-morphism`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.3(viii), p. 128. Only compactifiability cancels in the source.

Acceptance:

- For an open subspace Y′ ⊂ Y of an eligible Y → Z, the inclusion is eligible.

Suggested target signatures:

- `IsEligible.of_comp`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.

## S1. Quasicompact proper-support pushforward and the dimension estimate

Stage `DiamondSixOperations:S1`: **planned**.

Remaining acceptance inputs:

- Supply the diamond fibre-dimension and compactification comparison requested from C8; its analytic inequality is insufficient.
- Express the canonical functors, compact-Hausdorff slice equivalence, actual bounded-below topological sheaves and continuity cocone on the unavailable diamond/etale carriers, as listed in signatureCoverage.

### The proper pushforward Rf_! = Rf‾_* ∘ j_! of a spatial-eligible map

`DiamondSixOperations:S1/lower-shriek-quasicompact` · construction · planet: **Proper pushforward Rf_!**

Let f : Y′ → Y be spatial-eligible (S0/spatial-eligible-morphism) and Λ with nΛ = 0, n prime to p. Write f = f‾ ∘ j with j : Y′ → (Y′)‾^{/Y} the open immersion and f‾ : (Y′)‾^{/Y} → Y the canonical compactification (S0/compactifiable-iff-separated-open); f‾ is proper because f is quasicompact (C4, ECD Corollary 18.8(vi)). Define Rf_! := Rf‾_* ∘ j_! : D_ét(Y′, Λ) → D_ét(Y, Λ), with j_! the exact left adjoint of j^* for the étale map j (DiamondEtaleCohomology C5, ECD 19.1) and Rf‾_* the right adjoint of f‾^* on the unbounded D_ét (C3, ECD Lemma 17.5). The compactification (Y′)‾^{/Y} is a small v-stack, in general not a spatial diamond; its D_ét and Rf‾_* are the general ones of C2–C3. The construction is first made on stable ∞-categories (C2's enhancement) and then passed to homotopy categories, so that S2 can left Kan extend it.

Hypotheses:

- f spatial-eligible: compactifiable, representable in spatial diamonds, dim.trg f < ∞.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).

Named declarations: `lowerShriekQC`.

Construction or proof:

1. Take the canonical factorisation; f‾ is proper since f is quasicompact (C4).
2. j_! : D_ét(Y′, Λ) → D_ét((Y′)‾^{/Y}, Λ) is C5's extension by zero for the open immersion j; it is exact and commutes with base change.
3. Rf‾_* is C3's pushforward on unbounded D_ét; by S1/compactification-cd-bound it has cohomological dimension ≤ 3 dim.trg f, which is what makes the unbounded composite well behaved (base change, sums).
4. Set Rf_! := Rf‾_* ∘ j_! at the level of enhanced categories, and record it on homotopy categories.

Direct prerequisites: `DiamondSixOperations:S0/spatial-eligible-morphism`, `DiamondSixOperations:S0/compactifiable-iff-separated-open`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Definition 22.4, p. 129. The definition (the overline and /Y on f‾ are lost in the text layer).

Source: [ECD](https://arxiv.org/abs/1709.07343v4), §22, before Definition 22.4, p. 129. The quasicompact factorisation through the proper canonical compactification.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Definition 22.4, p. 129. Why the dimension bound S1/compactification-cd-bound is needed.

Uses:

- ECD Theorem 22.5 and Propositions 22.8–22.12: the first properties of the exceptional direct image
- ECD Definition 22.13: on sheaves with proper support Rf_! is given by Rf‾_* j_!, and Rf_!A_V = R(f|_V)_!(j_V^*A)
- ECD Lemma 23.6 and Propositions 23.7, 23.10: proper pushforward along profinite projections and the constructibility criteria are stated for this Rf_!
- VStackSheavesAndLisseCategories:VS1 (FS IV.2.1): the constructibility condition in universal local acyclicity is a statement about R(f ∘ j)_!
- ClassicalAdicEtaleCohomology:H4/perfectoid-support-image-comparison: the classical-to-diamond comparison of Rf_! for the relative ball is phrased with this Rf‾_* j_!

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `lowerShriekQC_eq` | characterisation | Rf_! ≅ Rf‾_* ∘ j_! for the canonical factorisation (definitional). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekQC_of_isProper` | compatibility | If f is proper (so its canonical compactification is f itself), Rf_! ≅ Rf_*. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekQC_etale` | compatibility | If f is quasicompact separated étale, Rf_! agrees with C5's left adjoint of f^* (S1/lower-shriek-etale-agreement-qc). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekQC_factorisation` | characterisation | For any factorisation f = g ∘ j′ with j′ an open immersion and g proper, Rf_! ≅ Rg_* ∘ j′_! (S1/factorisation-independence). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekQC_amplitude` | other | Rf_! carries D_ét^{≥0} to D_ét^{≥0} and its cohomology vanishes in degrees > 3 dim.trg f on objects in degree 0 (S1/compactification-cd-bound). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekQC_baseChange` | functoriality | g^*Rf_! ≅ Rf̃_!g′^* for every map g : Ỹ → Y of small v-stacks (S1/lower-shriek-base-change-qc). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekQC_comp` | functoriality | R(f ∘ g)_! ≅ Rf_! ∘ Rg_! for composable spatial-eligible maps (S1/lower-shriek-composition-qc). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekQC_projection` | relation | Rf_!B ⊗^L A ≅ Rf_!(B ⊗^L f^*A) (S1/projection-formula-qc). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekQC_sum` | other | Rf_! commutes with arbitrary direct sums (S1/lower-shriek-direct-sums-qc). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `lowerShriekQC_id` | degenerate | For f the identity of a spatial diamond, Rf_! ≅ id. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekQC_generic_point` | non-example | Assume Λ ≠ 0. For C⁺ ⊂ O_C of rank 2 and j : U = Spa(C, O_C) → Y = Spa(C, C⁺), the canonical compactification of j is Y, Rj_!Λ = j_!Λ, and RΓ(Y, Rj_!Λ) = 0, whereas RΓ(Y, Rj_*Λ) = Λ; so Rf_! is not Rf_* for non-proper f. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekQC_finite_etale` | compatibility | For a finite étale f, Rf_! ≅ Rf_* ≅ f_! (the pushforward of a finite étale map is exact and equals C5's left adjoint). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekQC_ball_degree_two` | computation | For f : B × Spa(C, O_C) → Spa(C, O_C), R^i f_!Λ = 0 for i ≠ 2 and R²f_!Λ(1) ≅ Λ, compatibly with Huber's ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support under the diamond comparison. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Acceptance:

- For f proper, Rf_! = Rf_*; for a quasicompact open immersion j, Rj_! is C5's extension by zero; for j : Spa(C, O_C) → Spa(C, C⁺) with C⁺ of rank 2, RΓ(Spa(C, C⁺), Rj_!Λ) = 0 while RΓ(Spa(C, C⁺), Rj_*Λ) = Λ.

Suggested target signatures:

- `lowerShriekQC`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.

### Independence of the factorisation and the canonical comparisons

`DiamondSixOperations:S1/factorisation-independence` · theorem

Let f : Y′ → Y be spatial-eligible, Λ with nΛ = 0 for n prime to p, and f = g ∘ j′ with j′ : Y′ → Z an open immersion and g : Z → Y proper. Then there is a natural equivalence Rg_* ∘ j′_! ≅ Rf_! of functors D_ét(Y′, Λ) → D_ét(Y, Λ), compatible with morphisms of such factorisations and transitive. In particular: (a) if f is proper then Rf_! ≅ Rf_*; (b) if f is a quasicompact open immersion with proper compactification, Rf_! ≅ f_!. This is ECD's Definition 22.4 made independent of the choice of compactification, the diamond counterpart of ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence.

Hypotheses:

- f spatial-eligible; j′ an open immersion; g proper.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).

Named declarations: `lowerShriekQC_factorisation`.

Construction or proof:

1. Since g is partially proper, the universal property of the canonical compactification (C4, ECD 18.6) gives a unique h : (Y′)‾^{/Y} → Z over Y with h ∘ j = j′; h is proper (both are proper over Y and Z → Y is separated).
2. h⁻¹(j′(Y′)) = j(Y′): a point of (Y′)‾^{/Y}(R, R⁺) = Y′(R, R°) ×_{Y(R,R°)} Y(R, R⁺) mapping into the open Y′ ⊂ Z is the image under j of the induced point of Y′(R, R⁺), since both have the same restriction to Spa(R, R°) and the same image in Y.
3. Proper base change (C5, ECD Theorem 19.2, with the corrected pullback U′ = U ×_Y Y′ of PAPER-SCHOLZE-17/E53) for h and the open immersion j′ gives j′_! ≅ Rh_* j_! on D⁺_ét.
4. Hence Rg_* j′_! ≅ Rg_* Rh_* j_! ≅ Rf‾_* j_! on D⁺_ét. Both sides commute with Postnikov limits (Rg_*, Rf‾_* are right adjoints, j_!, j′_! are t-exact and D_ét is left-complete, C2), so the equivalence extends to all of D_ét.
5. (a) and (b) are the factorisations (Y′ = Y′ → Y) and (Y′ → Y‾ → Y).

Direct prerequisites: `DiamondSixOperations:S1/lower-shriek-quasicompact`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Definition 22.4, p. 129. The definition fixes the canonical factorisation; independence of it is the target of this node.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Theorem 19.2, p. 108. The proper base change used for the comparison map h.

Acceptance:

- For the finite étale map ⊔ X → X both factorisations (canonical, and (id, f)) give Rf_* = f_!; for a proper f the canonical compactification is f itself.

Suggested target signatures:

- `lowerShriekQC_factorisation`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.

### The 3·dim.trg bound for the canonical compactification

`DiamondSixOperations:S1/compactification-cd-bound` · theorem · planet: **The 3·dim.trg bound**

Let f : Y′ → Y be spatial-eligible, Λ with nΛ = 0 for n prime to p, and f = f‾ ∘ j the canonical factorisation. Then Rf‾_* has bounded cohomological dimension: for every A ∈ D_ét((Y′)‾^{/Y}, Λ) concentrated in degree 0, R^i f‾_* A = 0 for i > 3 dim.trg f. Since j_* is exact (C8, ECD Remark 21.14, for the quasicompact separated quasi-pro-étale open inclusion), also R^i f_* A = 0 for A ∈ D_ét(Y′, Λ) in degree 0 and i > 3 dim.trg f. No spatiality of (Y′)‾^{/Y} is assumed; the sharper 2 dim.trg f bound under that extra hypothesis is S1/spatial-compactification-cd-bound.

Hypotheses:

- f spatial-eligible; d = dim.trg f < ∞.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).
- No assumption that (Y′)‾^{/Y} is a spatial diamond.

Named declarations: `lowerShriekQC_cd_le_three_mul`.

Construction or proof:

1. By C3 (ECD 17.6: Rf‾_* commutes with base change on D⁺ for the qcqs f‾) reduce to Y strictly totally disconnected, then by stalks to Y = Spa(C, C⁺) and global sections: show H^i((Y′)‾^{/Y}, A) = 0 for i > 3d.
2. Let s be the closed point, U = Y ∖ {s}, V = f‾⁻¹(U) (the misprint V = f⁻¹(U) is PAPER-SCHOLZE-17/E98). Proper base change (C5, ECD 19.2) gives RΓ((Y′)‾^{/Y}, j_!j^*A) = 0, so one may assume j^*A = 0, i.e. A is supported on the fibre over s.
3. By ECD Propositions 13.12 and 13.9 (D5/reduction-to-spatial-and-hausdorff-cohomology, D5/berkovich-quotient) the maximal Hausdorff quotient T of |(Y′)‾^{/Y}|, which is also that of the spectral space |Y′ ×_{Spa(C,C⁺)} Spa(C, O_C)|, comes with a map (Y′)‾^{/Y} → T representable in locally spatial diamonds; the induced g : (Y′)‾^{/Y} → T × Y is proper and representable in spatial diamonds with dim.trg g = d.
4. For g apply the spatial argument (S1/spatial-compactification-cd-bound): R^i g_*A = 0 for i > 2d.
5. For h : T × Y → Y and B in degree 0 trivial on T × U: H^i(T × Y, B) = H^i(T, B|_{T×{s}}) (proper base change), and by S1/proper-dim-zero-topological-comparison and ECD 13.13 this is cohomology of the spectral space |Y′ ×_{Spa(C,C⁺)} Spa(C, O_C)| of dimension ≤ dim f ≤ d (the requested C8 diamond fibre-dimension comparison, recorded as a gap; the analytic-dimension-bound alone is insufficient), which vanishes above d by Scheiderer's bound (C8/spectral-cohomological-bound).
6. Combine through the Leray spectral sequence of f‾ = h ∘ g: 2d + d = 3d.

Direct prerequisites: `DiamondSixOperations:S1/lower-shriek-quasicompact`, `DiamondSixOperations:S1/spatial-compactification-cd-bound`, `DiamondSixOperations:S1/proper-dim-zero-topological-comparison`, `DiamondsAndVStacks:D5/reduction-to-spatial-and-hausdorff-cohomology`, `DiamondsAndVStacks:D5/berkovich-quotient`, `DiamondEtaleCohomology:C8/spectral-cohomological-bound`, `DiamondEtaleCohomology:C8/fibre-dimension`, `DiamondEtaleCohomology:C8/analytic-dimension-bound`, `DiamondEtaleCohomology:C8/qpetale-direct-image`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`, `DiamondEtaleCohomology:C8`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Theorem 22.5, p. 130. The conclusion for f and its route through j_*.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Theorem 22.5, p. 130. Why the nonspatial argument through the Hausdorff quotient is needed.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Theorem 22.5, p. 131. The topological step.

Acceptance:

- For the ball B × Spa(C, O_C) → Spa(C, O_C) (d = 1) the bound gives vanishing above degree 3, while the actual top degree of Rf_! is 2 (consistent with the sharper spatial bound, since B‾ is spatial).

Suggested target signatures:

- `lowerShriekQC_cd_le_three_mul`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.

### The 2·dim.trg bound when the compactification is spatial

`DiamondSixOperations:S1/spatial-compactification-cd-bound` · theorem

In the situation of S1/compactification-cd-bound assume in addition that (Y′)‾^{/Y} → Y is representable in spatial diamonds. Then R^i f‾_* A = 0 for every A ∈ D_ét((Y′)‾^{/Y}, Λ) in degree 0 and i > 2 dim.trg f. This is a separate declaration from the 3·dim.trg bound, with the extra hypothesis stated.

Hypotheses:

- f spatial-eligible; the canonical compactification is representable in spatial diamonds (an additional hypothesis).
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).

Named declarations: `lowerShriekQC_cd_le_two_mul_of_spatial`.

Construction or proof:

1. Reduce as in S1/compactification-cd-bound to Y = Spa(C, C⁺), A with j^*A = 0 supported over the closed point s.
2. (Y′)‾^{/Y} is now a spatial diamond, dim((Y′)‾^{/Y} ∖ V) = dim (f‾)⁻¹(s) ≤ dim f‾ ≤ dim.trg f‾ = dim.trg f (the compactification adds only specialisations, so the completed residue fields at maximal points are those of Y′).
3. For maximal points y′ (all in Y′) cd_ℓ(y′) ≤ dim.trg f by C8/point-cd-geometric-bound (ECD 21.16, ℓ ≠ p).
4. C8/spatial-cohomological-bound (ECD 21.11) gives H^i = 0 for i > d + d = 2d.

Direct prerequisites: `DiamondSixOperations:S1/lower-shriek-quasicompact`, `DiamondEtaleCohomology:C8/spatial-cohomological-bound`, `DiamondEtaleCohomology:C8/point-cd-geometric-bound`, `DiamondEtaleCohomology:C8/analytic-dimension-bound`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`, `DiamondEtaleCohomology:C8`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Theorem 22.5, p. 130. The refinement and its additional hypothesis (the f there is f‾).

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Theorem 22.5, p. 130. The spatial case of the proof.

Acceptance:

- For the ball over Spa(C, C⁺) (compactification spatial, d = 1) R^i f‾_* vanishes above 2, which is sharp: R²f_!Λ ≠ 0.

Suggested target signatures:

- `lowerShriekQC_cd_le_two_mul_of_spatial`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.

### Proper diamonds of dim.trg 0 over a strictly totally disconnected space

`DiamondSixOperations:S1/proper-dim-zero-classification` · theorem · planet: **Proper diamonds of dim.trg 0**

Let X be a strictly totally disconnected perfectoid space. The functor T ↦ X ×_{π₀X} T from compact Hausdorff spaces over π₀X to proper diamonds over X is an equivalence onto the proper diamonds f : Y → X with dim.trg f = 0. For X = Spa(C, C⁺) these are exactly the T × Spa(C, C⁺), T compact Hausdorff.

Hypotheses:

- X strictly totally disconnected (D1); proper as in ECD 18.1 (C4); dim.trg as in C8.

Named declarations: `properDimTrgZero_equiv_compHaus`.

Construction or proof:

1. Given Y → X proper with dim.trg 0, choose a quasi-pro-étale surjection X̃ → Y from a strictly totally disconnected space (D5/universally-open-presentation).
2. Its compactification X̃‾^{/X} → X is a proper map of strictly totally disconnected spaces inducing isomorphisms on completed residue fields (dim.trg 0), hence of the form X ×_{π₀X} S for a profinite S → π₀X (D1/topological-classification-of-pro-etale-maps).
3. With X_S = X ×_{π₀X} S → Y surjective, R = X_S ×_Y X_S is proper and pro-étale over X, so R = X ×_{π₀X} S′ with S′ ⊂ S × S closed; T = S/S′ is compact Hausdorff and Y = X ×_{π₀X} T.
4. Full faithfulness is ECD Example 11.12 (D4/compact-hausdorff-diamonds), relative over π₀X.

Direct prerequisites: `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondsAndVStacks:D1/topological-classification-of-pro-etale-maps`, `DiamondsAndVStacks:D5/universally-open-presentation`, `DiamondsAndVStacks:D4/compact-hausdorff-diamonds`, `DiamondsAndVStacks:D3/locally-profinite-torsors`, `DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.6, p. 131. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.6, p. 131. The end of the proof.

Acceptance:

- For T = [0, 1] and X = Spa(C, O_C), [0, 1] × Spa(C, O_C) is a proper diamond of dim.trg 0 whose underlying space is the interval, not a spectral space.

Suggested target signatures:

- `properDimTrgZero_equiv_compHaus`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.

### Continuity of cohomology along cofiltered limits of qcqs diamonds

`DiamondSixOperations:S1/qcqs-diamond-continuity` · lemma

Let Y be a small v-sheaf, Λ any ring, C ∈ D⁺_ét(Y, Λ), and Zᵢ → Y a cofiltered inverse system of qcqs diamonds with inverse limit Z. Then RΓ(Z, C) = colimᵢ RΓ(Zᵢ, C). For spatial Zᵢ this is ECD Proposition 14.9 (owned by DiamondEtaleCohomology C0); the qcqs case is the claim in the proof of ECD 22.7.

Hypotheses:

- Zᵢ qcqs diamonds with qcqs transition maps; C bounded below.

Named declarations: `qcqsDiamond_cohomology_continuous`.

Construction or proof:

1. Write the Zᵢ compatibly as quotients of affinoid perfectoid spaces Xᵢ as in ECD Lemma 11.22 (D5/limits-and-finite-stage-comparisons).
2. The equivalence relations Rᵢ = Xᵢ ×_{Zᵢ} Xᵢ are spatial diamonds (ECD Proposition 12.3, D4/small-v-sheaves-and-small-v-stacks), as are the iterated fibre products.
3. Apply the spatial continuity of C0 (ECD 14.9) to the limits of the Xᵢ, the Rᵢ, the Rᵢ ×_{Xᵢ} Rᵢ, …, and conclude by v-descent of RΓ along the Čech nerves (C2 hyperdescent; colimits commute with the totalisations of bounded-below objects in each degree).

Direct prerequisites: `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `DiamondEtaleCohomology:C0/etale-cohomology-continuity`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.7, p. 132. Statement and proof route.

Acceptance:

- For Zᵢ = T × Spa(C, O_C) with T compact Hausdorff the cofiltered neighbourhoods U ×_{π₀X} S of a point compute the stalk, as used in 22.7.

Suggested target signatures:

- `qcqsDiamond_cohomology_continuous`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.

### Étale sheaves on a proper dim.trg 0 diamond are topological sheaves

`DiamondSixOperations:S1/proper-dim-zero-topological-comparison` · theorem

Let X be strictly totally disconnected and f : Y → X proper with dim.trg f = 0, so Y = X ×_{π₀X} T (S1/proper-dim-zero-classification). Then pullback along the map of topoi t : Y_v → |Y| induces an equivalence D⁺(|Y|, Λ) ≃ D⁺_ét(Y, Λ), where D⁺(|Y|, Λ) is the derived category of sheaves of Λ-modules on the topological space |Y|.

Hypotheses:

- X strictly totally disconnected; f proper of dim.trg 0; Λ any ring; bounded-below objects only.

Named declarations: `properDimTrgZero_topological_equiv`.

Construction or proof:

1. t^*F lies in D⁺_ét(Y_v, Λ) for every sheaf F on |Y| (definition of D_ét, C2).
2. (i) F → Rt_*t^*F is an isomorphism: on stalks, neighbourhoods of y ∈ |Y| are cofinal with the qcqs U ×_{π₀X} S (U ⊂ X a quasicompact open, S the closure of an open neighbourhood in T), with cofiltered limit the generalisations Spa(C(y), C(y)⁺) of y; S1/qcqs-diamond-continuity reduces the stalk to RΓ(Spa(C(y), C(y)⁺), t^*F) = F_y (strictly local, C8/strictly-disconnected-acyclic).
3. (ii) t^*Rt_*G → G is an isomorphism for small v-sheaves G étale after pullback to a strictly totally disconnected cover, by the same cofinality on stalks.

Direct prerequisites: `DiamondSixOperations:S1/proper-dim-zero-classification`, `DiamondSixOperations:S1/qcqs-diamond-continuity`, `DiamondEtaleCohomology:C8/strictly-disconnected-acyclic`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.7, p. 131. Statement (the superscript + on D_ét is on the preceding line).

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.7, p. 132. The stalk computation.

Acceptance:

- For Y = [0, 1] × Spa(C, O_C), H^i_ét(Y, Λ) = H^i([0, 1], Λ) = Λ for i = 0 and 0 otherwise.

Suggested target signatures:

- `properDimTrgZero_topological_equiv`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.

### Base change for Rf_! (spatial-eligible case)

`DiamondSixOperations:S1/lower-shriek-base-change-qc` · theorem · planet: **Base change for Rf_!**

Let f : Y′ → Y be spatial-eligible, Λ with nΛ = 0 for n prime to p, and g : Ỹ → Y any map of small v-stacks with pullbacks f̃ : Ỹ′ → Ỹ and g′ : Ỹ′ → Y′. There is a natural base-change equivalence g^*Rf_! ≃ Rf̃_!g′^* of functors D_ét(Y′, Λ) → D_ét(Ỹ, Λ), on all of the unbounded category.

Hypotheses:

- f spatial-eligible; g arbitrary.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).

Named declarations: `lowerShriekQC_baseChange`.

Construction or proof:

1. The canonical factorisation is compatible with base change (C4), so f̃‾ is the pullback of f‾ and j̃ that of j.
2. j_! commutes with base change (C5, ECD 19.1).
3. Rf‾_* commutes with base change on D⁺ for the qcqs f‾ (C3, ECD 17.6); since Rf‾_* has finite cohomological dimension (S1/compactification-cd-bound), the unbounded version of 17.6 applies.

Direct prerequisites: `DiamondSixOperations:S1/lower-shriek-quasicompact`, `DiamondSixOperations:S1/compactification-cd-bound`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.8, p. 132. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.8, p. 132. Proof route.

Acceptance:

- Pulling back the ball B × X → X along a point Spa(C, C⁺) → X computes the stalk of R²f_!Λ as H²_c of the ball over Spa(C, C⁺).

Suggested target signatures:

- `lowerShriekQC_baseChange`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.

### Composition of Rf_! (spatial-eligible case)

`DiamondSixOperations:S1/lower-shriek-composition-qc` · theorem

Let g : Y″ → Y′ and f : Y′ → Y be spatial-eligible and Λ with nΛ = 0 for n prime to p. There is a natural equivalence Rf_! ∘ Rg_! ≃ R(f ∘ g)_! of functors D_ét(Y″, Λ) → D_ét(Y, Λ).

Hypotheses:

- f, g spatial-eligible (so f ∘ g is, S0/spatial-eligible-morphism).
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).

Named declarations: `lowerShriekQC_comp`.

Construction or proof:

1. Factor Y″ →j₁ (Y″)‾^{/Y′} →j₂ (Y″)‾^{/Y} →g₂ (Y′)‾^{/Y} →f₁ Y, with g₁ : (Y″)‾^{/Y′} → Y′ and j₃ : Y′ → (Y′)‾^{/Y}.
2. Then Rf_!Rg_! = Rf₁_* j₃! Rg₁_* j₁! and R(f ∘ g)_! = Rf₁_* Rg₂_* j₂! j₁!.
3. Proper base change (C5, ECD 19.2) for the proper (Y″)‾^{/Y} → (Y′)‾^{/Y} and the open j₃, made unbounded by S1/compactification-cd-bound applied to (Y″)‾^{/Y′} → Y′, gives j₃! Rg₁_* = Rg₂_* j₂!.

Direct prerequisites: `DiamondSixOperations:S1/lower-shriek-quasicompact`, `DiamondSixOperations:S1/compactification-cd-bound`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.9, p. 132. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.9, p. 133. The key identity.

Acceptance:

- For an open immersion followed by a finite étale map the composite formula reduces to j_! followed by f_*.

Suggested target signatures:

- `lowerShriekQC_comp`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.

### Agreement with the étale left adjoint (quasicompact case)

`DiamondSixOperations:S1/lower-shriek-etale-agreement-qc` · theorem

Let f : Y′ → Y be a quasicompact separated étale map of small v-stacks and Λ with nΛ = 0 for n prime to p. Then C5's f_! (the left adjoint of f^*, ECD Definition 19.1) agrees with Rf_! of S1/lower-shriek-quasicompact, via a natural transformation f_!^ét → Rf_!.

Hypotheses:

- f quasicompact, separated, étale (so spatial-eligible with dim.trg 0, S0).
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).

Named declarations: `lowerShriekQC_eq_etaleLowerShriek`.

Construction or proof:

1. Construct f_!^ét → Rf_! as adjoint to id → f^*Rf_!, using base change f^*Rf_! = Rπ₂!π₁^* (S1/lower-shriek-base-change-qc) for the projections π₁, π₂ : Y′ ×_Y Y′ → Y′ and id = Rπ₂!RΔ!Δ^*π₁^* → Rπ₂!π₁^*, Δ being open and closed.
2. Both sides commute with base change; reduce to Y strictly totally disconnected, where Y′ is a disjoint union of quasicompact opens of Y (S0/separated-etale-compactifiable) and the claim is clear for an open immersion.

Direct prerequisites: `DiamondSixOperations:S1/lower-shriek-quasicompact`, `DiamondSixOperations:S1/lower-shriek-base-change-qc`, `DiamondSixOperations:S0/separated-etale-compactifiable`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`, `DiamondSixOperations:S1/lower-shriek-composition-qc`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.10, p. 133. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.10, p. 133. The construction of the comparison map.

Acceptance:

- For a finite étale cover of degree d the comparison is the identification of f_! with f_* (trace not involved).

Suggested target signatures:

- `lowerShriekQC_eq_etaleLowerShriek`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.

### Projection formula (spatial-eligible case)

`DiamondSixOperations:S1/projection-formula-qc` · theorem · planet: **Projection formula**

Let f : Y′ → Y be a spatial-eligible map of small v-sheaves and Λ with nΛ = 0 for n prime to p. There is an isomorphism Rf_!B ⊗^L_Λ A ≃ Rf_!(B ⊗^L_Λ f^*A), functorial in B ∈ D_ét(Y′, Λ) (on the source) and A ∈ D_ét(Y, Λ) (on the base). The extension to small v-stacks is part of S2/projection-formula.

Hypotheses:

- f spatial-eligible between small v-sheaves (as printed).
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).

Named declarations: `lowerShriekQC_projection`.

Construction or proof:

1. Open immersion j: the map j_!(B ⊗ j^*A) → j_!B ⊗ A adjoint to B ⊗ j^*A = j^*(j_!B ⊗ A) is an isomorphism: reduce to Y strictly totally disconnected, where D_ét(Y) = D(|Y|) (C2), and check on the closed complement i, where i^*(j_!B ⊗ A) = i^*j_!B ⊗ i^*A = 0.
2. General: Rf‾_*j_!B ⊗ A → Rf‾_*(j_!B ⊗ f‾^*A) ≅ Rf‾_*j_!(B ⊗ j^*f‾^*A) by the standard adjunction map and the open case.
3. To test it, reduce by C3 (17.6) to Y = Spa(C, C⁺) and global sections; for A = j_{U!}A_U with U = Y ∖ {s} both sides vanish by proper base change (C5, 19.2); so A is concentrated at s and then constant.
4. A constant complex is a filtered colimit of perfect complexes; the perfect case is clear and colimits are handled by S1/lower-shriek-direct-sums-qc.

Direct prerequisites: `DiamondSixOperations:S1/lower-shriek-quasicompact`, `DiamondSixOperations:S1/lower-shriek-direct-sums-qc`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.11, p. 133. Statement; B on the source, A on the base.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.11, p. 134. The last step.

Acceptance:

- For B = Λ and f the ball over Spa(C, O_C): Rf_!Λ ⊗ A ≃ Rf_!f^*A, so H²_c(B, f^*M) ≅ M(−1) for a Λ-module M.

Suggested target signatures:

- `lowerShriekQC_projection`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.

### Rf_! commutes with direct sums (spatial-eligible case)

`DiamondSixOperations:S1/lower-shriek-direct-sums-qc` · theorem

Let f : Y′ → Y be a spatial-eligible map of small v-sheaves and Λ with nΛ = 0 for n prime to p. For every family (Aᵢ)_{i∈I} in D_ét(Y′, Λ), the natural map ⊕ᵢ Rf_!Aᵢ → Rf_!(⊕ᵢ Aᵢ) is an isomorphism.

Hypotheses:

- f spatial-eligible between small v-sheaves.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).

Named declarations: `lowerShriekQC_preservesCoproducts`.

Construction or proof:

1. By S1/lower-shriek-base-change-qc reduce to Y = Spa(C, C⁺) and global sections.
2. In a fixed degree d both sides depend only on τ^{≥ d − 3 dim.trg f}Aᵢ (S1/compactification-cd-bound), so assume the Aᵢ uniformly bounded below.
3. The claim becomes that RΓ((Y′)‾^{/Y}, −) commutes with direct sums on D^{≥−n}_ét: these are v-cohomology groups of small sheaves, and the κ-small v-topos of the qcqs v-sheaf (Y′)‾^{/Y} is coherent, so SGA 4 VI 5.2 applies (D0/filtered-colimits-and-cohomology-on-coherent-sites).

Direct prerequisites: `DiamondSixOperations:S1/lower-shriek-quasicompact`, `DiamondSixOperations:S1/compactification-cd-bound`, `DiamondSixOperations:S1/lower-shriek-base-change-qc`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.12, p. 134. Statement, first part.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.12, p. 135. The key input.

Acceptance:

- For f the ball over Spa(C, O_C) and Aᵢ = Λ for i ∈ ℕ: H²_c(B, ⊕Λ) = ⊕ Λ(−1).

Suggested target signatures:

- `lowerShriekQC_preservesCoproducts`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.

## S2. Non-quasicompact maps and small v-stacks

Stage `DiamondSixOperations:S2`: **planned**.

Remaining acceptance inputs:

- Supply the narrowly requested geometric hypercover existence/common refinement from E2. Existing E0/E2/E3 and C2 constructions now have exact imported nodes.
- Express the augmented support diagram, relative Kan universal property and canonical pasting identities on those actual infinity-category/diamond carriers, as listed in signatureCoverage.

### Sheaves with proper support over the base

`DiamondSixOperations:S2/proper-support-subcategory` · definition

Let f : Y′ → Y be an eligible map of quasiseparated locally spatial diamonds (S0/eligible-morphism), with canonical factorisation j : Y′ → (Y′)‾^{/Y} and partially proper f‾. D_ét,prop/Y(Y′, Λ) is the full ∞-subcategory of D_ét(Y′, Λ) of objects A with A ≃ j_{V!}j_V^*A for some open subspace j_V : V → Y′ that is quasicompact over Y (V → Y quasicompact). For such A and V, j_!A is supported on the closure of V in (Y′)‾^{/Y}, which is proper over Y. The subcategory is stable under pullback along maps of quasiseparated locally spatial diamonds over Y.

Hypotheses:

- Y, Y′ quasiseparated locally spatial diamonds; f eligible.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

Named declarations: `properSupportSubcategory`.

Construction or proof:

1. Define the full subcategory by the existence of a quasicompact-over-Y open V with A ≃ j_{V!}j_V^*A (C5 extension by zero for open immersions).
2. Every A ∈ D_ét(Y′, Λ) is the filtered colimit of A_V = j_{V!}j_V^*A over the filtered poset of such V (Y′ is a union of them, Y being quasiseparated locally spatial).
3. Pullback along Ỹ → Y preserves the condition, since quasicompactness over Y and j_{V!} are stable under base change (C5).

Direct prerequisites: `DiamondSixOperations:S0/eligible-morphism`, `DiamondsAndVStacks:D5/spatial-diamond`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `DiamondEtaleCohomology:C2/v-hyperdescent`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Definition 22.13, p. 135. The defining condition (D_ét,prop/Y(Y′, Λ) ⊂ D_ét(Y′, Λ); the primes on Y′ sit on the next line of the text layer).

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Definition 22.13, p. 135. The meaning of the subcategory.

Uses:

- ECD Definition 22.13: Rf_! is the left Kan extension of Rf‾_* j_! from this subcategory
- ECD §22, construction before Lemma 22.16: its fibrewise version over a simplicial hypercover is a coCartesian fibration over Δ
- ECD Proposition 22.21 and 22.23 (proofs): composition and projection formula are first identified on proper-support objects

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `mem_properSupportSubcategory_iff` | characterisation | A lies in D_ét,prop/Y(Y′, Λ) iff A ≃ j_{V!}j_V^*A for an open V ⊂ Y′ quasicompact over Y. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `properSupportSubcategory.extendByZero_mem` | constructor | For V ⊂ Y′ open and quasicompact over Y and B ∈ D_ét(V, Λ), j_{V!}B lies in the subcategory. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `properSupportSubcategory.colimit_eq` | other | Every A ∈ D_ét(Y′, Λ) is the filtered colimit of j_{V!}j_V^*A over the opens V quasicompact over Y. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `properSupportSubcategory.pullback_mem` | functoriality | Pullback along a map Ỹ → Y of quasiseparated locally spatial diamonds carries D_ét,prop/Y(Y′, Λ) into D_ét,prop/Ỹ(Ỹ′, Λ). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `properSupportSubcategory.of_isQuasicompact` | compatibility | If f is quasicompact (spatial-eligible), the subcategory is all of D_ét(Y′, Λ). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `properSupportSubcategory_of_qc` | degenerate | If Y′ → Y is quasicompact, every object of D_ét(Y′, Λ) has proper support (take V = Y′). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `properSupportSubcategory_disc` | computation | For the open unit disc D → Spa(C, O_C) and the closed subdisc V of radius \|ϖ\|, j_{V!}Λ ∈ D_ét,prop(D, Λ). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `not_mem_properSupportSubcategory_const` | non-example | Assume Λ ≠ 0. The constant sheaf Λ on the open unit disc D over Spa(C, O_C) does not have proper support: Λ ≃ j_{V!}j_V^*Λ fails for every quasicompact V ⊊ D, since its stalks off V are nonzero. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Acceptance:

- For f : D → Spa(C, O_C) the open disc, j_{V!}Λ for V a closed subdisc lies in the subcategory, Λ itself does not.

Suggested target signatures:

- `properSupportSubcategory`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.

### Rf_! over a quasiseparated locally spatial base, by left Kan extension

`DiamondSixOperations:S2/lower-shriek-locally-spatial` · construction · planet: **Rf_! by left Kan extension**

Let f : Y′ → Y be an eligible map of quasiseparated locally spatial diamonds and Λ with nΛ = 0, n prime to p. Define Rf_! : D_ét(Y′, Λ) → D_ét(Y, Λ) as the left Kan extension (EnhancedDerivedSheaves E3, HTT 4.3.2.14, along the full inclusion) of the functor Rf‾_* ∘ j_! : D_ét,prop/Y(Y′, Λ) → D_ét(Y, Λ) (S2/proper-support-subcategory). It is a functor of stable ∞-categories; the left Kan extension is not replaced by a choice of representatives of complexes. On D_ét,prop/Y it is Rf‾_*j_!, and for A_V = j_{V!}j_V^*A one has Rf_!A_V = R(f|_V)_!(j_V^*A) where the terms are computed by S1/lower-shriek-quasicompact after restricting Y to spatial quasicompact opens W: V ×_Y W is quasicompact and the eligible restriction over W has a finite global dimension bound. Relative quasicompactness of V → Y alone does not make f|_V spatial-eligible when Y is not quasicompact. Its left Kan universal property is the equivalence of spaces of natural transformations Nat(Rf_!, H) ≃ Nat(Rf‾_*j_!, H|_{D_ét,prop/Y}) for every functor H on D_ét(Y′, Λ); this specifies the extension and comparison up to contractible choice, not just some extension with the correct objects.

Hypotheses:

- f eligible between quasiseparated locally spatial diamonds.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

Named declarations: `lowerShriekLocSpatial`.

Construction or proof:

1. Rf‾_*j_! is defined on D_ét,prop/Y: for A = j_{V!}j_V^*A, Rf‾_*j_!A = Rf‾_*g_*j′_{V!}(j_V^*A) = R(f|_V)_!(j_V^*A) with g : V‾^{/Y} → (Y′)‾^{/Y} the closed immersion and j′_V : V → V‾^{/Y}, so its values are those of the quasicompact construction. To compare with S1, first restrict the base to a spatial quasicompact open W ⊂ Y. Then V_W is quasicompact and locally finite dim.trg gives a finite bound there; the local S1 values and their coherent base-change identifications descend by C2. No uniform global bound over a non-quasicompact Y is inferred.
2. D_ét(Y, Λ) is presentable (C2), so the left Kan extension along the full inclusion exists (E3, HTT 4.3.2.14) and restricts to Rf‾_*j_! on the subcategory. Apply the left Kan universal property for existence and uniqueness of the comparison transformations, before identifying their pointwise support-colimit formula.
3. By the pointwise formula (HTT 4.3.2.2) and filteredness of the index (S2/proper-support-subcategory), Rf_!A = colim_V Rf_!A_V.

Direct prerequisites: `DiamondSixOperations:S2/proper-support-subcategory`, `DiamondSixOperations:S1/lower-shriek-quasicompact`, `DiamondSixOperations:S0/spatial-eligible-morphism`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `DiamondEtaleCohomology:C2/v-hyperdescent`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`, `DiamondSixOperations:S1/lower-shriek-base-change-qc`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Definition 22.13, p. 135. Rf_! is defined as a left Kan extension of Rf‾_* j_!.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Definition 22.13, p. 135. The pointwise formula.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), §22, p. 135. Why the construction is made by an ∞-categorical left Kan extension.

Uses:

- ECD Propositions 22.14 and 22.15: colimit preservation and base change over locally spatial bases
- ECD Lemma 22.16: the fibres of the hypercover construction are these functors
- VStackSheavesAndLisseCategories:VS0 (FS IV.5): partially compactly supported functors Rβ_{!+}, Rβ_{!−} are built on this construction

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `lowerShriekLocSpatial_restrict` | characterisation | On D_ét,prop/Y(Y′, Λ), Rf_! ≅ Rf‾_* ∘ j_! (the unit of the left Kan extension is an equivalence along a full inclusion). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekLocSpatial_colim` | characterisation | Rf_!A ≅ colim_V R(f\|_V)_!(j_V^*A) over opens V quasicompact over Y (S2/filtered-support-formula). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekLocSpatial_eq_qc` | compatibility | If f is spatial-eligible, Rf_! agrees with S1/lower-shriek-quasicompact. For a relatively quasicompact eligible f over a non-quasicompact base, this comparison is made after restriction to spatial quasicompact opens of the base; quasicompactness alone supplies no uniform global dim.trg bound. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekLocSpatial_preservesColimits` | other | Rf_! preserves all colimits (S2/lower-shriek-colimits-locally-spatial). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekLocSpatial_baseChange` | functoriality | g^*Rf_! ≃ Rf̃_!g′^* for g : Ỹ → Y a map of quasiseparated locally spatial diamonds (S2/lower-shriek-base-change-locally-spatial). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekLocSpatial_isLeftKanExtension` | universal-property | Rf_! with the identification on D_ét,prop/Y is a left Kan extension: natural transformations Rf_! → G correspond to transformations Rf‾_*j_! → G\|_{D_prop}. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `lowerShriekLocSpatial_qc` | degenerate | If f is spatial-eligible, the construction agrees with S1/lower-shriek-quasicompact. For a relatively quasicompact eligible f over a non-quasicompact base, the S1 comparison holds on each spatial quasicompact base open. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekLocSpatial_openDisc` | computation | For the open unit disc f : D → Spa(C, O_C), R²f_!Λ(1) ≅ Λ and R^i f_!Λ = 0 for i ≠ 2 (colimit of the closed subdiscs, with isomorphic transition maps). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekLocSpatial_ne_pushforward` | non-example | Assume Λ ≠ 0. For the open unit disc, Rf_*Λ = Λ in degree 0 (D is cohomologically a point, H4) while Rf_!Λ = Λ(−1)[−2]; the left Kan extension is not Rf‾_* applied to j_! of all objects. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Acceptance:

- For the open unit disc D → Spa(C, O_C), Rf_!Λ = colim_r R(f|_{D_r})_!Λ over closed subdiscs D_r, which is Λ(−1)[−2].

Suggested target signatures:

- `lowerShriekLocSpatial`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.

### The filtered-support formula for Rf_!

`DiamondSixOperations:S2/filtered-support-formula` · theorem

For f : Y′ → Y eligible between quasiseparated locally spatial diamonds and A ∈ D_ét(Y′, Λ), the natural map colim_V R(f|_V)_!(j_V^*A) → Rf_!A, over the filtered poset of opens V ⊂ Y′ quasicompact over Y, is an equivalence, and R(f|_V)_!(j_V^*A) = Rf‾_*j_!(j_{V!}j_V^*A). The terms use S2/lower-shriek-locally-spatial and are identified with S1 locally on spatial quasicompact opens of Y; f|_V need not have a uniform global dim.trg bound.

Hypotheses:

- f eligible between quasiseparated locally spatial diamonds.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

Named declarations: `lowerShriekLocSpatial_colim`.

Construction or proof:

1. Pointwise formula for left Kan extensions along full inclusions (E3, HTT 4.3.2.2): Rf_!A = colim over (D_ét,prop/Y)/A.
2. The subdiagram of objects A_V → A is cofinal in that slice (every B → A with B proper-support factors through some A_V, B = j_{W!}j_W^*B with W ⊂ V), and it is filtered (S2/proper-support-subcategory).
3. The identification of the terms is the closed-immersion computation in S2/lower-shriek-locally-spatial.

Direct prerequisites: `DiamondSixOperations:S2/lower-shriek-locally-spatial`, `DiamondSixOperations:S2/proper-support-subcategory`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Definition 22.13, p. 135. The identification of the terms.

Acceptance:

- For a disjoint union Y′ = ⊔ᵢ Vᵢ of quasicompact opens over Y, Rf_!A = ⊕ᵢ R(f|_{Vᵢ})_!A|_{Vᵢ}.

Suggested target signatures:

- `lowerShriekLocSpatial_colim`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.

### Rf_! preserves colimits over a locally spatial base

`DiamondSixOperations:S2/lower-shriek-colimits-locally-spatial` · theorem

For f : Y′ → Y eligible between quasiseparated locally spatial diamonds and Λ with nΛ = 0 (n prime to p), Rf_! : D_ét(Y′, Λ) → D_ét(Y, Λ) commutes with all direct sums, equivalently (HA 1.4.4.1(2), E3) with all colimits.

Hypotheses:

- As in S2/lower-shriek-locally-spatial.

Named declarations: `lowerShriekLocSpatial_preservesColimits`.

Construction or proof:

1. Write each Aᵢ as colim_V A_{i,V}; then Rf_!(⊕ᵢAᵢ) = colim_V R(f|_V)_!j_V^*(⊕ᵢAᵢ) = colim_V ⊕ᵢ R(f|_V)_!j_V^*Aᵢ by S1/lower-shriek-direct-sums-qc after restricting Y to spatial quasicompact opens, as in S2/lower-shriek-locally-spatial; the resulting equality is local on the base.
2. Exchange the colimits and use S2/filtered-support-formula for each Aᵢ.
3. An exact functor of stable presentable categories preserving direct sums preserves all colimits (E3).

Direct prerequisites: `DiamondSixOperations:S2/filtered-support-formula`, `DiamondSixOperations:S1/lower-shriek-direct-sums-qc`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.14, p. 135. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.14, p. 136. The quasicompact input.

Acceptance:

- Rf_! of a countable direct sum of skyscrapers on the open disc is the direct sum of their compactly supported cohomologies.

Suggested target signatures:

- `lowerShriekLocSpatial_preservesColimits`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.

### Base change for Rf_! over locally spatial bases

`DiamondSixOperations:S2/lower-shriek-base-change-locally-spatial` · theorem

Let f : Y′ → Y be eligible between quasiseparated locally spatial diamonds, Λ with nΛ = 0 (n prime to p), and g : Ỹ → Y a map of quasiseparated locally spatial diamonds with pullbacks f̃, g′. There is a natural base-change equivalence g^*Rf_! ≃ Rf̃_!g′^*. The base Ỹ must be quasiseparated, as the construction of Rf̃_! requires (correction PAPER-SCHOLZE-17/E99 of the printed 'any map of locally spatial diamonds').

Hypotheses:

- g a map of quasiseparated locally spatial diamonds (corrected hypothesis).
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

Named declarations: `lowerShriekLocSpatial_baseChange`.

Construction or proof:

1. The transformation: j_! commutes with base change (C5) and Rf‾_* has a base-change map (C3); this gives g^*Rf‾_*j_! → Rf̃‾_*j̃_!g′^* on D_ét,prop/Y and, by the universal property of the left Kan extension, g^*Rf_! → Rf̃_!g′^*.
2. On D_ét,prop/Y it is an equivalence by S1/lower-shriek-base-change-qc applied to f|_V locally on spatial quasicompact base opens. For a base change, refine the source and target base covers and use the coherent S1 comparison of S2/lower-shriek-locally-spatial; no global dimension bound on f|_V over a non-quasicompact base is assumed.
3. Both functors commute with the filtered colimit A = colim A_V: g^*Rf_! by definition, Rf̃_!g′^* by S2/lower-shriek-colimits-locally-spatial.

Direct prerequisites: `DiamondSixOperations:S2/lower-shriek-locally-spatial`, `DiamondSixOperations:S1/lower-shriek-base-change-qc`, `DiamondSixOperations:S2/lower-shriek-colimits-locally-spatial`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.15, p. 136. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.15, p. 136. The proof.

Acceptance:

- Pulling back the open disc over Spa(C, O_C) to a strictly totally disconnected X gives the open disc over X, and R²f_!Λ(1) pulls back to the constant sheaf Λ.

Suggested target signatures:

- `lowerShriekLocSpatial_baseChange`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.

### The coherent support diagram over a simplicial v-hypercover

`DiamondSixOperations:S2/hypercover-support-diagram` · construction

Let f : Y′ → Y be an eligible map of small v-stacks, Y• → Y a simplicial v-hypercover with every Yᵢ a quasiseparated locally spatial diamond (EnhancedDerivedSheaves E2), Y′• = Y′ ×_Y Y•, and Λ with nΛ = 0 (n prime to p). Construct: (1) the coCartesian fibrations over Δ classified by i ↦ D_ét(Y′ᵢ, Λ), i ↦ D_ét((Y′ᵢ)‾^{/Yᵢ}, Λ) and i ↦ D_ét(Yᵢ, Λ) with pullback functors (E0, E3; Liu–Zheng's diagrams of ringed topoi, the étale condition passing to full subcategories); (2) the full sub-fibration D_ét,prop/Y•(Y′•, Λ)⁰ with fibres D_ét,prop/Yᵢ(Y′ᵢ, Λ), again coCartesian because pullback preserves proper support (S2/proper-support-subcategory); (3) the fully faithful left adjoint j•! of j•^*, fibrewise jᵢ!, and the right adjoint Rf‾•_* of f‾•^*, fibrewise Rf‾ᵢ_*; (4) Rf•!⁰ : D_ét(Y′•, Λ)⁰ → D_ét(Y•, Λ)⁰, the left Kan extension of Rf‾•_* j•! along D_ét,prop/Y•(Y′•, Λ)⁰ ⊂ D_ét(Y′•, Λ)⁰ (HTT 4.3.2.14). All four are functors over Δ of ∞-categories, not of homotopy categories.

Hypotheses:

- Y• → Y a simplicial v-hypercover by quasiseparated locally spatial diamonds; f eligible (so each fᵢ is eligible, S0). The hypercover includes an augmentation, face and degeneracy maps satisfying the simplicial identities, with each augmented matching map Y_i → (cosk_{i−1}Y•)_i a v-cover. The support sub-fibration has its displayed proper-support fibres and the pullback coCartesian edges, not merely a predicate on unrelated objects.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

Named declarations: `hypercoverSupportDiagram`, `lowerShriekHypercover`.

Construction or proof:

1. Diagram of categories: the functor Δ → Cat_∞, i ↦ D_ét(Yᵢ, Λ), comes from the diagram of v-topoi (E3, as in Liu–Zheng §2); unstraighten to a coCartesian fibration (E0).
2. The sub-fibration of proper-support objects is coCartesian because pullback preserves the condition (S2/proper-support-subcategory).
3. j•! exists fibrewise and commutes with pullback (C5), hence is a functor over Δ, fully faithful and left adjoint to j•^*; Rf‾•_* is the relative right adjoint of f‾•^*, fibrewise Rf‾ᵢ_*.
4. The left Kan extension of Rf‾•_* j•! exists by HTT 4.3.2.14 (E3), D_ét(Y•, Λ)⁰ being fibrewise presentable (C2). Its universal property is taken in functors over Δ; it specifies the extension together with the comparison map and its contractible uniqueness.

Direct prerequisites: `DiamondSixOperations:S2/proper-support-subcategory`, `DiamondSixOperations:S2/lower-shriek-locally-spatial`, `DiamondSixOperations:S0/eligible-morphism`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`, `EnhancedDerivedSheaves:E2/hypercover`, `EnhancedDerivedSheaves:E2/hypercovers-and-cohomological-descent`, `EnhancedDerivedSheaves:E2/unbounded-hypercover-descent`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `DiamondEtaleCohomology:C2/v-hyperdescent`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), §22, construction before Lemma 22.16, p. 136. The coherent diagram of coefficient categories.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), §22, construction before Lemma 22.16, p. 136. The support subcategories.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), §22, construction before Lemma 22.16, p. 137. The fibrewise left Kan extension.

Uses:

- ECD Lemmas 22.16–22.17 and Definition 22.18: passage to coCartesian sections defines Rf_! for small v-stacks
- ECD Propositions 22.19, 22.21, 22.23 (proofs): base change, composition and the projection formula are proved by repeating the construction over Δ × Δ¹ and comparing on proper-support objects
- VStackSheavesAndLisseCategories:VS0: descent of exceptional operations along charts of Artin v-stacks uses the same coherent diagrams

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `hypercoverSupportDiagram.fibre` | projection | The fibre of D_ét,prop/Y•(Y′•, Λ)⁰ over [i] is D_ét,prop/Yᵢ(Y′ᵢ, Λ). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `hypercoverSupportDiagram.isCocartesian` | structure | D_ét,prop/Y•(Y′•, Λ)⁰ → Δ is a coCartesian fibration and its inclusion into D_ét(Y′•, Λ)⁰ preserves coCartesian edges. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `hypercoverSupportDiagram.extendByZero_fibre` | projection | j•! is fibrewise jᵢ! and is fully faithful and left adjoint to j•^*. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `hypercoverSupportDiagram.pushforward_fibre` | projection | Rf‾•_* is fibrewise Rf‾ᵢ_*. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekHypercover_fibre` | characterisation | Over [i], Rf•!⁰ is Rfᵢ! of S2/lower-shriek-locally-spatial (S2/fibrewise-lower-shriek). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriekHypercover_cocartesian` | structure | Rf•!⁰ preserves coCartesian edges (S2/cocartesian-preservation). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `hypercoverSupportDiagram.refine` | functoriality | A map of hypercovers Ỹ• → Y• over Y induces a map of diagrams, compatible with Rf•!⁰ (S2/hypercover-independence). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `hypercoverSupportDiagram_constant` | degenerate | For the constant hypercover of a quasiseparated locally spatial Y, the ambient coefficient diagram is constant with fibre D_ét(Y′, Λ), its support subdiagram has fibre D_ét,prop/Y(Y′, Λ), and Rf•!⁰ is S2/lower-shriek-locally-spatial. The two fibres coincide if f is quasicompact. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `hypercoverSupportDiagram_qc` | computation | If f is quasicompact, every fibre of the support sub-fibration is the whole fibre, and Rf•!⁰ is fibrewise Rf‾ᵢ_*jᵢ!. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `hypercoverSupportDiagram_homotopy_category_insufficient` | non-example | Choosing objects fibrewise in homotopy categories does not define a functor to coCartesian sections: the diagram i ↦ Ho D_ét(Yᵢ, Λ) does not determine D_ét(Y, Λ) (descent fails for homotopy categories), so the construction must be made in Cat_∞. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Acceptance:

- For the constant hypercover Y• = Y (Y quasiseparated locally spatial) the diagram is constant and Rf•!⁰ is S2/lower-shriek-locally-spatial in every degree.

Suggested target signatures:

- `hypercoverSupportDiagram`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.
- `lowerShriekHypercover`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.

### The fibres of the hypercover construction

`DiamondSixOperations:S2/fibrewise-lower-shriek` · lemma

In the situation of S2/hypercover-support-diagram, the functor Rf•!⁰ is given in the fibre over [i] ∈ Δ by Rfᵢ! : D_ét(Y′ᵢ, Λ) → D_ét(Yᵢ, Λ) of S2/lower-shriek-locally-spatial.

Hypotheses:

- As in S2/hypercover-support-diagram.

Named declarations: `lowerShriekHypercover_fibre`.

Construction or proof:

1. Because D_ét,prop/Y•(Y′•, Λ)⁰ is coCartesian over Δ, for A ∈ D_ét(Y′ᵢ, Λ) the inclusion D_ét,prop/Yᵢ(Y′ᵢ, Λ)/A → D_ét,prop/Y•(Y′•, Λ)⁰/A is cofinal.
2. The index category is filtered; by HTT 4.3.1.7 (E3) the colimits computing the two left Kan extensions agree.

Direct prerequisites: `DiamondSixOperations:S2/hypercover-support-diagram`, `DiamondSixOperations:S2/lower-shriek-locally-spatial`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Lemma 22.16, p. 137. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Lemma 22.16, p. 137. Proof.

Acceptance:

- For the constant hypercover this is the tautology Rf_! = Rf_!.

Suggested target signatures:

- `lowerShriekHypercover_fibre`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.

### Rf•!⁰ preserves coCartesian edges

`DiamondSixOperations:S2/cocartesian-preservation` · lemma

The functor Rf•!⁰ : D_ét(Y′•, Λ)⁰ → D_ét(Y•, Λ)⁰ of S2/hypercover-support-diagram sends coCartesian edges to coCartesian edges; hence it restricts to coCartesian sections, D_ét,cart(Y′•, Λ) → D_ét,cart(Y•, Λ).

Hypotheses:

- As in S2/hypercover-support-diagram.

Named declarations: `lowerShriekHypercover_cocartesian`.

Construction or proof:

1. A coCartesian edge over [i] → [k] is A → α^*A; its image is Rfᵢ!A → Rf_k!α′^*A by S2/fibrewise-lower-shriek.
2. This is the base-change map, an equivalence by S2/lower-shriek-base-change-locally-spatial (the Yᵢ quasiseparated locally spatial).

Direct prerequisites: `DiamondSixOperations:S2/fibrewise-lower-shriek`, `DiamondSixOperations:S2/lower-shriek-base-change-locally-spatial`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Lemma 22.17, p. 137. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Lemma 22.17, p. 137. Proof.

Acceptance:

- For the constant hypercover every edge is an identity.

Suggested target signatures:

- `lowerShriekHypercover_cocartesian`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.

### The exceptional direct image Rf_! for eligible maps of small v-stacks

`DiamondSixOperations:S2/lower-shriek` · construction · planet: **Exceptional direct image Rf_!**

Let f : Y′ → Y be an eligible map of small v-stacks (compactifiable, representable in locally spatial diamonds, locally dim.trg f < ∞) and Λ with nΛ = 0, n prime to p. Choose a simplicial v-hypercover Y• → Y by quasiseparated locally spatial diamonds and define Rf_! as the composite D_ét(Y′, Λ) ≃ D_ét,cart(Y′•, Λ) → D_ét,cart(Y•, Λ) ≃ D_ét(Y, Λ) of hyperdescent (C2, ECD 17.3) and the restriction of Rf•!⁰ to coCartesian sections (S2/cocartesian-preservation); ECD's Rf_! is its homotopy-category functor. It is independent of the hypercover (S2/hypercover-independence) and agrees with S2/lower-shriek-locally-spatial when Y is a quasiseparated locally spatial diamond and with S1/lower-shriek-quasicompact when f is spatial-eligible. The domain is the eligible class; for maps of Artin v-stacks that are not representable in locally spatial diamonds, the operations are VStackSheavesAndLisseCategories VS0's, not this construction.

Hypotheses:

- f eligible between small v-stacks.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

Named declarations: `lowerShriek`.

Construction or proof:

1. Existence of a hypercover by quasiseparated locally spatial diamonds (E2: every small v-stack has a v-cover by a disjoint union of strictly totally disconnected spaces).
2. Hyperdescent identifies D_ét(Y, Λ) and D_ét(Y′, Λ) with coCartesian sections (C2, ECD 17.3).
3. Rf•!⁰ restricts to coCartesian sections by S2/cocartesian-preservation; compose.

Direct prerequisites: `DiamondSixOperations:S2/hypercover-support-diagram`, `DiamondSixOperations:S2/cocartesian-preservation`, `DiamondSixOperations:S0/eligible-morphism`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `DiamondEtaleCohomology:C2/v-hyperdescent`, `EnhancedDerivedSheaves:E2/hypercover`, `EnhancedDerivedSheaves:E2/hypercovers-and-cohomological-descent`, `EnhancedDerivedSheaves:E2/unbounded-hypercover-descent`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), §22, after Lemma 22.17, p. 137. The construction by coCartesian sections.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Definition 22.18, p. 137. ECD's Rf_! is the homotopy-category functor.

Uses:

- ECD Theorem 23.1: Rf^! is the right adjoint of this functor
- ECD Definition 23.8 and Propositions 23.10–23.12: cohomological smoothness compares Rf^! with f^*
- ECD Theorem 25.1: RΓ_c and Poincaré duality on smooth curves over Spa(C, O_C)
- VStackSheavesAndLisseCategories:VS0–VS2: the stacky and solid operations restrict to this one on the eligible class
- IgusaVarietiesAndTorsionConcentration:IG.3: compactly supported cohomology of Igusa-type diamonds over Spd C
- AdicCoefficientsAndComparisons:L0, L4: ℓ-adic and mixed-characteristic Rf_! are built from and compared with this functor

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `lowerShriek_eq_locSpatial` | compatibility | If Y is a quasiseparated locally spatial diamond, Rf_! ≅ S2/lower-shriek-locally-spatial. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriek_eq_qc` | compatibility | If f is spatial-eligible, Rf_! ≅ Rf‾_* ∘ j_! (S1/lower-shriek-quasicompact). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriek_hypercover_indep` | characterisation | Rf_! does not depend on the hypercover, up to a coherent equivalence (S2/hypercover-independence). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriek_baseChange` | functoriality | g^*Rf_! ≃ Rf̃_!g′^* for every map g of small v-stacks (S2/lower-shriek-base-change). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriek_preservesColimits` | other | Rf_! preserves all colimits (S2/lower-shriek-colimits). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriek_comp` | functoriality | R(f ∘ g)_! ≃ Rf_! ∘ Rg_! (S2/lower-shriek-composition). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriek_id` | simp | R(id)_! ≃ id, compatibly with the composition equivalence. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriek_etale` | compatibility | For f separated étale, Rf_! ≅ C5's f_! (S2/lower-shriek-etale-agreement). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriek_projection` | relation | Rf_!B ⊗^L A ≃ Rf_!(B ⊗^L f^*A) (S2/projection-formula). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `lowerShriek_id_test` | degenerate | R(id_Y)_! ≅ id for every small v-stack Y. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriek_open_immersion` | compatibility | For an open immersion j : U → Y of small v-stacks, Rj_! is C5's extension by zero j_!. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriek_classifying_not_eligible` | non-example | For a nontrivial profinite group K acting trivially, the map [*/K] → * is not representable in locally spatial diamonds (its fibre over a point is not a diamond), so R(−)_! of this section does not apply; such stacky maps are VS0's. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `lowerShriek_ball_point` | computation | For f : B → *, Rf_!Λ ≅ Λ(−1)[−2] (S5/ball-smooth with Rf_!Rf^!Λ → Λ an isomorphism here). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Acceptance:

- For Y a quasiseparated locally spatial diamond and the constant hypercover, Rf_! is S2/lower-shriek-locally-spatial; for (Spa ℚ_p)^♢ → * it is defined since that map is eligible (S5/spd-qp-smooth).

Suggested target signatures:

- `lowerShriek`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.

### Independence of the hypercover

`DiamondSixOperations:S2/hypercover-independence` · theorem

The functor Rf_! of S2/lower-shriek does not depend on the choice of the hypercover: for two simplicial v-hypercovers Y• → Y and Ỹ• → Y by quasiseparated locally spatial diamonds there is a natural equivalence between the two functors, obtained through a common refinement, and these equivalences are compatible with further refinement (form a coherent system).

Hypotheses:

- Y• and Ỹ• hypercovers as in S2/lower-shriek.

Named declarations: `lowerShriek_hypercover_indep`.

Construction or proof:

1. Choose a common refinement Z• → Y• ×_Y Ỹ• by quasiseparated locally spatial diamonds (E2).
2. A map of hypercovers Z• → Y• induces a map of support diagrams (S2/hypercover-support-diagram, refine) compatible with Rf•!⁰ on fibres (S2/fibrewise-lower-shriek and base change S2/lower-shriek-base-change-locally-spatial), hence an equivalence of the functors on coCartesian sections (both identify with D_ét(Y, Λ) by hyperdescent, C2).
3. Compatibility for chains of refinements follows from the same construction over Δ × Δ¹ × Δ¹ (E0).

Direct prerequisites: `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/hypercover-support-diagram`, `DiamondSixOperations:S2/lower-shriek-base-change-locally-spatial`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`, `EnhancedDerivedSheaves:E2/hypercover`, `EnhancedDerivedSheaves:E2/hypercovers-and-cohomological-descent`, `EnhancedDerivedSheaves:E2/unbounded-hypercover-descent`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `DiamondEtaleCohomology:C2/v-hyperdescent`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Definition 22.18, p. 137. Statement and proof route.

Acceptance:

- For Y quasiseparated locally spatial, the constant hypercover and any hypercover give the same Rf_!.

Suggested target signatures:

- `lowerShriek_hypercover_indep`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.

### Base change for Rf_! (general)

`DiamondSixOperations:S2/lower-shriek-base-change` · theorem · planet: **Base change for Rf_!**

Let f : Y′ → Y be an eligible map of small v-stacks, Λ with nΛ = 0 (n prime to p), and g : Ỹ → Y any map of small v-stacks with pullbacks f̃ : Ỹ′ → Ỹ, g′ : Ỹ′ → Y′. There is a natural base-change equivalence g^*Rf_! ≃ Rf̃_!g′^* of functors D_ét(Y′, Λ) → D_ét(Ỹ, Λ), constructed at the enhanced level.

Hypotheses:

- f eligible; g arbitrary map of small v-stacks.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

Named declarations: `lowerShriek_baseChange`.

Construction or proof:

1. Choose hypercovers Y• → Y and Ỹ• → Ỹ by quasiseparated locally spatial diamonds with a map g• : Ỹ• → Y• over g (E2).
2. Repeat S2/hypercover-support-diagram over Δ × Δ¹ (E0): the edge over Δ¹ is pullback along g•; the fibrewise left Kan extension preserves coCartesian edges in both directions by S2/lower-shriek-base-change-locally-spatial.
3. Passing to coCartesian sections gives g^*Rf_! ≃ Rf̃_!g′^*.

Direct prerequisites: `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/hypercover-support-diagram`, `DiamondSixOperations:S2/lower-shriek-base-change-locally-spatial`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`, `EnhancedDerivedSheaves:E2/hypercover`, `EnhancedDerivedSheaves:E2/hypercovers-and-cohomological-descent`, `EnhancedDerivedSheaves:E2/unbounded-hypercover-descent`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.19, p. 137. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.19, p. 138. Proof route.

Acceptance:

- Base change of the ball B → * along any perfectoid X → * gives the relative ball B × X → X, so Rf_!Λ pulls back to R(f_X)_!Λ.

Suggested target signatures:

- `lowerShriek_baseChange`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.

### Rf_! preserves colimits (general)

`DiamondSixOperations:S2/lower-shriek-colimits` · theorem

For f : Y′ → Y eligible between small v-stacks and Λ with nΛ = 0 (n prime to p), Rf_! commutes with all direct sums, equivalently with all colimits.

Hypotheses:

- As in S2/lower-shriek.

Named declarations: `lowerShriek_preservesColimits`.

Construction or proof:

1. By S2/lower-shriek-base-change, pullback along a hypercover is conservative and commutes with Rf_!, so it suffices to treat Y quasiseparated locally spatial.
2. There it is S2/lower-shriek-colimits-locally-spatial; HA 1.4.4.1(2) (E3) passes from direct sums to colimits.

Direct prerequisites: `DiamondSixOperations:S2/lower-shriek-colimits-locally-spatial`, `DiamondSixOperations:S2/lower-shriek-base-change`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.20, p. 138. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.20, p. 138. Proof.

Acceptance:

- The input of the adjoint functor theorem in S3/upper-shriek.

Suggested target signatures:

- `lowerShriek_preservesColimits`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.

### Composition of Rf_! (general)

`DiamondSixOperations:S2/lower-shriek-composition` · theorem · planet: **Composition of Rf_!**

Let g : Y″ → Y′ and f : Y′ → Y be eligible maps of small v-stacks and Λ with nΛ = 0 (n prime to p). There is a natural equivalence Rf_! ∘ Rg_! ≃ R(f ∘ g)_! of functors D_ét(Y″, Λ) → D_ét(Y, Λ), coherent with identities and associative for triple composites.

Hypotheses:

- f, g eligible (so f ∘ g is, S0/eligible-morphism).

Named declarations: `lowerShriek_comp`.

Construction or proof:

1. Choose a hypercover Y• → Y by quasiseparated locally spatial diamonds and pull back to Y′•, Y″• (again such hypercovers, f, g being representable in locally spatial diamonds).
2. On D_ét,prop/Y•(Y″•, Λ)⁰ the functors Rf•!⁰ ∘ Rg•!⁰ and R(f ∘ g)•!⁰ are identified by S1/lower-shriek-composition-qc and its proof (fibrewise proper base change).
3. All three functors preserve colimits (S2/lower-shriek-colimits), so both sides are left Kan extensions of their restrictions and the identification extends (E3); pass to coCartesian sections.

Direct prerequisites: `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/hypercover-support-diagram`, `DiamondSixOperations:S1/lower-shriek-composition-qc`, `DiamondSixOperations:S2/lower-shriek-colimits`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.21, p. 138. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.21, p. 138. Proof route.

Acceptance:

- For an open immersion followed by the ball over Spa(C, O_C), compactly supported cohomology of an open subdisc is computed by composing j_! and Rf_!.

Suggested target signatures:

- `lowerShriek_comp`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.

### Agreement with the étale left adjoint (general)

`DiamondSixOperations:S2/lower-shriek-etale-agreement` · theorem

For f : Y′ → Y a separated étale map of small v-stacks and Λ with nΛ = 0 (n prime to p), C5's f_! (left adjoint of f^*, ECD 19.1) agrees with Rf_! of S2/lower-shriek.

Hypotheses:

- f separated étale (eligible by S0/eligible-morphism).

Named declarations: `lowerShriek_eq_etaleLowerShriek`.

Construction or proof:

1. The comparison transformation is constructed as in S1/lower-shriek-etale-agreement-qc.
2. By base change reduce to Y strictly totally disconnected; both functors commute with direct sums (C5, S2/lower-shriek-colimits), so reduce to Y′ quasicompact, which is S1/lower-shriek-etale-agreement-qc.

Direct prerequisites: `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S1/lower-shriek-etale-agreement-qc`, `DiamondSixOperations:S2/lower-shriek-colimits`, `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.22, p. 138. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.22, p. 138. Proof.

Acceptance:

- For the open unit disc as an open subspace of the ball, Rj_! is extension by zero.

Suggested target signatures:

- `lowerShriek_eq_etaleLowerShriek`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.

### Projection formula (general)

`DiamondSixOperations:S2/projection-formula` · theorem · planet: **Projection formula**

Let f : Y′ → Y be an eligible map of small v-stacks and Λ with nΛ = 0 (n prime to p). There is a functorial isomorphism Rf_!B ⊗^L_Λ A ≃ Rf_!(B ⊗^L_Λ f^*A) for B ∈ D_ét(Y′, Λ) and A ∈ D_ét(Y, Λ), compatible as A varies. ECD prints the statement for small v-sheaves; the extension to small v-stacks is the same argument through a hypercover by quasiseparated locally spatial diamonds and hyperdescent (C2, ECD 17.3), recorded here.

Hypotheses:

- f eligible between small v-stacks (the v-sheaf restriction of the printed statement is removed by hyperdescent).
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

Named declarations: `lowerShriek_projection`.

Construction or proof:

1. Fix A; on Rf•!⁰ consider the endofunctors − ⊗ A|_{Y′•} and − ⊗ A|_{Y•}; both Rf•!⁰(− ⊗ A|_{Y′•}) and Rf•!⁰(−) ⊗ A|_{Y•} are left Kan extensions from D_ét,prop/Y•(Y′•, Λ)⁰.
2. On proper-support objects compare both with Rf‾•_*(j•!(−) ⊗ f‾•^*A|) using j•! ⊣ j•^* and f‾•^* ⊣ Rf‾•_* and that pullback is monoidal (C3); fibrewise these are the open-immersion projection formula and S1/projection-formula-qc.
3. Both functors preserve coCartesian edges, so pass to coCartesian sections and hyperdescent (C2); compatibility in A is checked in the homotopy category.

Direct prerequisites: `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/hypercover-support-diagram`, `DiamondSixOperations:S1/projection-formula-qc`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `DiamondEtaleCohomology:C2/v-hyperdescent`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 22.23, p. 139. Statement (printed for small v-sheaves).

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.23, p. 139. The descent step.

Acceptance:

- With B = Λ: Rf_!Λ ⊗ A ≃ Rf_!f^*A; for the ball this computes R f_!f^*A = A(−1)[−2].

Suggested target signatures:

- `lowerShriek_projection`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.

### Coherence of the exchange equivalences

`DiamondSixOperations:S2/exchange-pasting-coherence` · theorem

The base-change equivalences of S2/lower-shriek-base-change, the composition equivalences of S2/lower-shriek-composition and the projection-formula isomorphisms of S2/projection-formula satisfy the pasting identities: (a) base change along a composite Ỹ₂ → Ỹ₁ → Y is the vertical pasting of the two base changes; (b) for composable eligible f, g and any base change, the base change of R(f ∘ g)_! ≃ Rf_!Rg_! is the horizontal pasting of the base changes of Rf_! and Rg_!; (c) the composition equivalences are associative and unital; (d) base change for identities and for an identity base map is the identity. These hold at the enhanced level and are part of the public interface.

Hypotheses:

- Eligible maps of small v-stacks; Λ with nΛ = 0, n prime to p.

Named declarations: `lowerShriek_baseChange_comp`, `lowerShriek_comp_assoc`.

Construction or proof:

1. Each identity is obtained by running the construction of S2/hypercover-support-diagram over Δ × [1]ⁿ (n = 2 for (a), (b); n = 3 for associativity), i.e. through products of simplicial indexing categories (E0).
2. Uniqueness of left Kan extensions (E3) identifies the two transformations once they agree on proper-support objects, where they reduce to the pasting identities of proper base change and of j_! (C5) and of Rf‾_* (C3).

Direct prerequisites: `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondSixOperations:S2/lower-shriek-composition`, `DiamondSixOperations:S2/projection-formula`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.19, p. 138. The pattern: iterate the construction over products of indexing categories.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 22.23, p. 139. Coherence in the projection formula.

Acceptance:

- For open immersions, base change and composition equivalences reduce to the canonical isomorphisms of C5's j_!.

Suggested target signatures:

- `lowerShriek_baseChange_comp`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.
- `lowerShriek_comp_assoc`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.

## S3. Exceptional inverse image and the formal identities

Stage `DiamondSixOperations:S3`: **planned**.

Remaining acceptance inputs:

- Express full geometric exceptional adjunction, tensor/internal-Hom, twists and exchange maps on C2/C3/E3’s actual carriers. The scalar and trace prototypes use actual module adjunctions and are explicitly specialized.

### The exceptional inverse image Rf^!

`DiamondSixOperations:S3/upper-shriek` · construction · planet: **Exceptional inverse image Rf^!**

Let f : Y′ → Y be an eligible map of small v-stacks (S0/eligible-morphism) and Λ with nΛ = 0, n prime to p. Rf^! : D_ét(Y, Λ) → D_ét(Y′, Λ) is the right adjoint of Rf_! (S2/lower-shriek), constructed at the level of presentable stable ∞-categories by the adjoint functor theorem (EnhancedDerivedSheaves E3, HTT 5.5.2.9), which applies because Rf_! preserves all colimits (S2/lower-shriek-colimits) and both categories are presentable (C2). It is exact; it is a right adjoint, so it preserves all limits; the adjunction Rf_! ⊣ Rf^! is part of the data. Rf^! is defined only for eligible f: every statement using it carries the eligibility hypotheses of the map whose Rf^! appears.

Hypotheses:

- f eligible between small v-stacks.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

Named declarations: `upperShriek`, `lowerShriekUpperShriekAdj`.

Construction or proof:

1. D_ét(Y′, Λ) and D_ét(Y, Λ) are presentable stable ∞-categories (C2, ECD Lemma 17.1).
2. Rf_! preserves all colimits (S2/lower-shriek-colimits).
3. The adjoint functor theorem (E3, HTT 5.5.2.9) produces a right adjoint, unique up to a contractible choice; it is exact as a right adjoint between stable categories.
4. Pass to homotopy categories to obtain ECD's Rf^! with the adjunction isomorphism Hom(Rf_!A, B) ≅ Hom(A, Rf^!B).

Direct prerequisites: `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/lower-shriek-colimits`, `DiamondSixOperations:S0/eligible-morphism`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Theorem 23.1, p. 140. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Theorem 23.1, p. 140. Proof.

Uses:

- ECD Propositions 23.3–23.4 and Definition 23.8: Verdier duality and the definition of cohomological smoothness compare Rf^! with f^*
- ECD Theorem 25.1 and Proposition 25.4: the Verdier dual RHom(A, Rf^!F_ℓ) and its biduality and conservativity
- VStackSheavesAndLisseCategories:VS0 (FS IV.1.11–1.17): the stacky Rf^! is defined by descending this functor along charts
- VStackSheavesAndLisseCategories:VS1 (FS IV.2.23): ULA objects are dualizable in a 2-category of cohomological correspondences built from Rf_! and Rf^!
- AdicCoefficientsAndComparisons:L0, L3: ℓ-adic Rf^! and the comparison with schemes transport this right adjoint

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `lowerShriekUpperShriekAdj` | universal-property | Rf_! ⊣ Rf^!: Hom(Rf_!A, B) ≅ Hom(A, Rf^!B) naturally in A ∈ D_ét(Y′, Λ), B ∈ D_ét(Y, Λ). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `upperShriek_preservesLimits` | other | Rf^! preserves all limits and is exact. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `upperShriek_id` | simp | R(id)^! ≃ id. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `upperShriek_comp` | functoriality | R(f ∘ g)^! ≃ Rg^! ∘ Rf^!, compatible with the composition of Rf_! (S3/upper-shriek-composition). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `upperShriek_etale` | compatibility | For f separated étale, Rf^! ≃ f^* (S3/upper-shriek-etale). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `upperShriek_restrictScalars` | compatibility | Rf^! commutes with restriction of scalars along Λ′ → Λ (S3/upper-shriek-change-of-rings). | specialization: Right-adjoint mate along an actual ring map and ModuleCat extension/restriction functors. The specified left-adjoint scalar comparison is required. |
| `upperShriek_internalHom` | relation | Rf^!RHom(A, B) ≅ RHom(f^*A, Rf^!B) (S3/upper-shriek-internal-hom). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `upperShriek_pushforward` | relation | For a cartesian square with eligible horizontal g, Rg^!Rf_* ≅ Rf′_*Rg̃^! (S3/upper-shriek-pushforward-exchange). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `dualizingObject` | data | D_f := Rf^!Λ ∈ D_ét(Y′, Λ), the dualizing complex; it is invertible when f is ℓ-cohomologically smooth (S4/dualizing-complex). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `upperShriek_id_test` | degenerate | R(id_Y)^! ≃ id. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `upperShriek_openImmersion` | compatibility | For an open immersion j : U → Y of small v-stacks, Rj^! ≃ j^* (right adjoint of j_!). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `upperShriek_ne_pullback_profinite` | non-example | Assume Λ ≠ 0. For q : S × Spa(C, O_C) → Spa(C, O_C) with S an infinite profinite set, Rq^!Λ is the sheaf of Λ-valued distributions T ↦ Hom(C⁰(T, Λ), Λ) and is not q^*Λ (S5/profinite-quotient-upper-shriek). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `upperShriek_ball` | computation | For the ball f : B → *, Rf^!Λ ≅ Λ(1)[2] canonically (S5/ball-smooth). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Acceptance:

- For an open immersion j, Rj^! = j^*; for the ball B → *, Rf^!Λ = Λ(1)[2] (S5/ball-smooth).

Suggested target signatures:

- `upperShriek`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.
- `lowerShriekUpperShriekAdj`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual enhanced etale categories and the constructed exceptional adjunction; two coefficient rings, actual ring map and derived scalar functors; tensor/internal-Hom with their unit, specified counit/twisted transformations and commuting diagrams.

### Rf^! commutes with restriction of scalars

`DiamondSixOperations:S3/upper-shriek-change-of-rings` · theorem

Let f be eligible and g : Λ′ → Λ a map of rings killed by integers prime to p. With res_g : D_ét(−, Λ) → D_ét(−, Λ′) restriction of scalars along g, there is a natural equivalence res_g ∘ Rf^! ≃ Rf^! ∘ res_g of functors D_ét(Y, Λ) → D_ét(Y′, Λ′).

Hypotheses:

- f eligible; Λ′ → Λ a ring map with both rings killed by integers prime to p.

Named declarations: `upperShriek_restrictScalars`.

Construction or proof:

1. Restriction of scalars is right adjoint to − ⊗^L_{Λ′} Λ (C3, change of coefficients).
2. Rf_!(− ⊗^L_{Λ′} Λ) ≃ Rf_!(−) ⊗^L_{Λ′} Λ by the projection formula (S2/projection-formula), applied over Λ′ with A = Λ the constant sheaf.
3. Pass to right adjoints (mates, E3).

Direct prerequisites: `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S2/projection-formula`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `DiamondEtaleCohomology:C3/change-of-coefficients`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Remark 23.2, p. 140. Statement and proof.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Remark 23.2, p. 140. Statement.

Acceptance:

- For Λ′ = ℤ/ℓ^m → Λ = F_ℓ: Rf^!(F_ℓ) computed over F_ℓ and over ℤ/ℓ^m agree as ℤ/ℓ^m-complexes; used in the proof of ECD 23.4.

Suggested target signatures:

- `upperShriek_restrictScalars`: specialization. Right-adjoint mate along an actual ring map and ModuleCat extension/restriction functors. The specified left-adjoint scalar comparison is required.

Actual input required: Actual enhanced etale categories and the constructed exceptional adjunction; two coefficient rings, actual ring map and derived scalar functors; tensor/internal-Hom with their unit, specified counit/twisted transformations and commuting diagrams.

### Verdier duality for Rf_!

`DiamondSixOperations:S3/verdier-duality-lower-shriek` · theorem · planet: **Verdier duality**

Let f : Y′ → Y be eligible and Λ with nΛ = 0 (n prime to p). For A ∈ D_ét(Y′, Λ) and B ∈ D_ét(Y, Λ) there is a natural isomorphism RHom_Λ(Rf_!A, B) ≅ Rf_*RHom_Λ(A, Rf^!B), RHom being C3's internal Hom on D_ét.

Hypotheses:

- f eligible.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

Named declarations: `verdierDuality`.

Construction or proof:

1. For C ∈ D_ét(Y, Λ): Hom(C, RHom(Rf_!A, B)) = Hom(C ⊗ Rf_!A, B) = Hom(Rf_!(f^*C ⊗ A), B) (S2/projection-formula) = Hom(f^*C ⊗ A, Rf^!B) (S3/upper-shriek) = Hom(f^*C, RHom(A, Rf^!B)) = Hom(C, Rf_*RHom(A, Rf^!B)) (C3 tensor–Hom and f^* ⊣ Rf_*).
2. Yoneda; the identification is made at the enhanced level so that it is natural (E3).

Direct prerequisites: `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S2/projection-formula`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `DiamondEtaleCohomology:C3/change-of-coefficients`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.3(i), p. 140. Statement, (i).

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.3, p. 141. Proof route.

Acceptance:

- Taking global sections over Y = Spa(C, O_C): RHom(RΓ_c(Y′, A), B) ≅ RHom(A, Rf^!B), the form used in ECD 25.1 and 25.4.

Suggested target signatures:

- `verdierDuality`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual enhanced etale categories and the constructed exceptional adjunction; two coefficient rings, actual ring map and derived scalar functors; tensor/internal-Hom with their unit, specified counit/twisted transformations and commuting diagrams.

### Rf^! of an internal Hom

`DiamondSixOperations:S3/upper-shriek-internal-hom` · theorem

Let f : Y′ → Y be eligible and Λ with nΛ = 0 (n prime to p). For A, B ∈ D_ét(Y, Λ) there is a natural isomorphism Rf^!RHom_Λ(A, B) ≅ RHom_Λ(f^*A, Rf^!B).

Hypotheses:

- f eligible.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

Named declarations: `upperShriek_internalHom`.

Construction or proof:

1. For C ∈ D_ét(Y′, Λ): Hom(C, Rf^!RHom(A, B)) = Hom(Rf_!C, RHom(A, B)) = Hom(Rf_!C ⊗ A, B) = Hom(Rf_!(C ⊗ f^*A), B) = Hom(C ⊗ f^*A, Rf^!B) = Hom(C, RHom(f^*A, Rf^!B)).
2. Yoneda, at the enhanced level.

Direct prerequisites: `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S2/projection-formula`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.3(ii), p. 140. Statement, (ii).

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.3, p. 141. Proof.

Acceptance:

- With B = Λ and f smooth: Rf^!RHom(A, Λ) ≅ RHom(f^*A, D_f), the input of ECD 23.17 and 25.4.

Suggested target signatures:

- `upperShriek_internalHom`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual enhanced etale categories and the constructed exceptional adjunction; two coefficient rings, actual ring map and derived scalar functors; tensor/internal-Hom with their unit, specified counit/twisted transformations and commuting diagrams.

### Identity and composition laws for Rf^!

`DiamondSixOperations:S3/upper-shriek-composition` · theorem

For eligible g : Y″ → Y′ and f : Y′ → Y (Λ with nΛ = 0, n prime to p) there are natural equivalences R(id)^! ≃ id and R(f ∘ g)^! ≃ Rg^! ∘ Rf^!, the mates of R(id)_! ≃ id and of Rf_! ∘ Rg_! ≃ R(f ∘ g)_! (S2/lower-shriek-composition) under the adjunctions of S3/upper-shriek; they are associative and unital, and compatible with the composition of Rf_! through the units and counits.

Hypotheses:

- f, g eligible.

Named declarations: `upperShriek_comp`.

Construction or proof:

1. Right adjoints compose: Rg^! ∘ Rf^! is right adjoint to Rf_! ∘ Rg_! ≃ R(f ∘ g)_!, hence equivalent to R(f ∘ g)^! by uniqueness of adjoints (E3).
2. Associativity and unitality are the mates of S2/exchange-pasting-coherence (c).

Direct prerequisites: `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S2/lower-shriek-composition`, `DiamondSixOperations:S2/exchange-pasting-coherence`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.4, p. 143. A use of the composition law (Rh^!Rf^! = R(f ∘ h)^! = R(g ∘ f′)^! = Rf′^!Rg^!) together with S3/upper-shriek-etale.

Acceptance:

- For an open immersion followed by a finite étale map, R(f ∘ j)^! = j^*Rf^! = j^*f^*.

Suggested target signatures:

- `upperShriek_comp`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual enhanced etale categories and the constructed exceptional adjunction; two coefficient rings, actual ring map and derived scalar functors; tensor/internal-Hom with their unit, specified counit/twisted transformations and commuting diagrams.

### Rf^! = f^* for separated étale maps

`DiamondSixOperations:S3/upper-shriek-etale` · theorem

If f : Y′ → Y is a separated étale map of small v-stacks and Λ with nΛ = 0 (n prime to p), then Rf^! ≃ f^* canonically, compatibly with composition.

Hypotheses:

- f separated étale.

Named declarations: `upperShriek_etale`.

Construction or proof:

1. By S2/lower-shriek-etale-agreement, Rf_! is C5's left adjoint f_! of f^*.
2. Both Rf^! and f^* are right adjoints of Rf_! ≃ f_!; uniqueness of adjoints (E3).

Direct prerequisites: `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S2/lower-shriek-etale-agreement`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.4, p. 143. The identity used in ECD 23.4.

Acceptance:

- For a disjoint union of opens ⊔Uᵢ → Y, Rf^! is the family of restrictions.

Suggested target signatures:

- `upperShriek_etale`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual enhanced etale categories and the constructed exceptional adjunction; two coefficient rings, actual ring map and derived scalar functors; tensor/internal-Hom with their unit, specified counit/twisted transformations and commuting diagrams.

### The formal exceptional base change Rg^!Rf_* ≃ Rf′_*Rg̃^!

`DiamondSixOperations:S3/upper-shriek-pushforward-exchange` · theorem · planet: **Exceptional base change**

Let Y′ →g̃ Y, X′ →g X, f : Y → X, f′ : Y′ → X′ be a cartesian square of small v-stacks with g eligible (compactifiable, representable in locally spatial diamonds, locally dim.trg g < ∞), and Λ with nΛ = 0 (n prime to p). Then g̃ is eligible (S0/eligible-morphism, base change) and for A ∈ D_ét(Y, Λ) there is a natural isomorphism Rg^!Rf_*A ≅ Rf′_*Rg̃^!A. No eligibility hypothesis on f is needed. This is ECD 23.16(i); it is proved here, before cohomological smoothness, because the proof of ECD 23.4 uses it.

Hypotheses:

- g eligible; f an arbitrary map of small v-stacks.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

Named declarations: `upperShriek_pushforward_exchange`.

Construction or proof:

1. Base change S2/lower-shriek-base-change for g along f gives f^*Rg_! ≃ Rg̃_!f′^* as functors D_ét(X′, Λ) → D_ét(Y, Λ).
2. Pass to right adjoints: the right adjoint of f^*Rg_! is Rg^!Rf_*, that of Rg̃_!f′^* is Rf′_*Rg̃^! (S3/upper-shriek, C3); the mate of an equivalence is an equivalence (E3).

Direct prerequisites: `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondSixOperations:S0/eligible-morphism`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.16(i), p. 151. Hypotheses (only on g).

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.16, p. 151. Proof.

Acceptance:

- For g an open immersion it is the base change j^*Rf_* ≅ Rf′_*j̃^* of C3; for g = h : X × S → X with S profinite, it gives Rh′_*Rf′^! = Rf^!Rh_*, used in ECD 23.4.

Suggested target signatures:

- `upperShriek_pushforward_exchange`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual enhanced etale categories and the constructed exceptional adjunction; two coefficient rings, actual ring map and derived scalar functors; tensor/internal-Hom with their unit, specified counit/twisted transformations and commuting diagrams.

### Units, traces, the twisted-pullback transformation and mates

`DiamondSixOperations:S3/adjunction-calculus` · construction

For an eligible f : Y′ → Y and Λ with nΛ = 0 (n prime to p), construct at the enhanced level: (1) the unit A → Rf^!Rf_!A and the counit (trace) tr_f : Rf_!Rf^!B → B of Rf_! ⊣ Rf^!; (2) the twisted-pullback transformation τ_f : Rf^!Λ ⊗^L_Λ f^*(−) → Rf^!(−), adjoint to Rf_!(Rf^!Λ ⊗ f^*B) ≃ Rf_!Rf^!Λ ⊗ B →(tr ⊗ id) B (projection formula S2/projection-formula); (3) evaluation RHom(A, B) ⊗ A → B and coevaluation for invertible objects, and the tensor–Hom adjunction on D_ét (C3); (4) for a cartesian square with f eligible and g arbitrary, the base-change transformation g̃^*Rf^! → Rf′^!g^* (when f is eligible) adjoint to Rf′_!g̃^*Rf^! ≃ g^*Rf_!Rf^! → g^* (S2/lower-shriek-base-change and tr_f), and the transformation Rf^!Λ ⊗ f^* → Rf^! restricted along open immersions used in ECD 23.4(iii)–(iv); (5) the mates of all exchange equivalences of S2. These are compatible with composition (traces compose: tr_{f∘g} = tr_f ∘ Rf_!(tr_g)Rf^!) and with base change, and they are tested on finite étale maps and open immersions before any smoothness statement uses them.

Hypotheses:

- f is eligible. In the cartesian square defining (4), the base-change leg g is arbitrary; f′ is the eligible pullback of f.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

Named declarations: `shriekTrace`, `twistedPullbackTransformation`, `upperShriekBaseChangeTransformation`.

Construction or proof:

1. (1) is the adjunction of S3/upper-shriek; (2)–(4) are composites of the projection formula, base change and (co)units, made functorial by E3's mates.
2. Composition of traces is the mate of S3/upper-shriek-composition; compatibility with base change is the mate of S2/exchange-pasting-coherence.
3. Tests: for f = j an open immersion, Rj^! = j^*, tr_j is the counit j_!j^* → id and τ_j is the identity; for f finite étale, Rf^! = f^*, Rf_! = f_*, and tr_f : f_*f^* → id is the classical trace (sum over the fibres).

Direct prerequisites: `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/upper-shriek-composition`, `DiamondSixOperations:S2/projection-formula`, `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondSixOperations:S2/exchange-pasting-coherence`, `DiamondSixOperations:S3/upper-shriek-etale`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `DiamondEtaleCohomology:C3/change-of-coefficients`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.4(i), p. 141. The twisted-pullback transformation of (2), over F_ℓ.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.4(i), p. 141. Its construction from the projection formula.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.12(iii), p. 147. The base-change transformation of (4).

Uses:

- ECD Proposition 23.4 (i)–(iv): the four equivalent criteria are statements that τ_f or base-change transformations are equivalences
- ECD Definition 23.8 and Proposition 23.12: smoothness makes τ_f an equivalence with invertible Rf^!Λ
- ECD Propositions 24.2–24.3: the averaging transformation q^* → Rq^! is built from a trace q_*q^* → id
- ECD Theorem 24.1: the ball's dualizing isomorphism is adjoint to Huber's trace
- VStackSheavesAndLisseCategories:VS1 (FS IV.2.23): units and counits of the correspondence 2-category

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `shriekTrace` | data | tr_f : Rf_!Rf^!B → B, the counit of Rf_! ⊣ Rf^!. | specialization: Actual counit of a specified ordinary categorical adjunction. |
| `twistedPullbackTransformation` | data | τ_f : Rf^!Λ ⊗^L f^*B → Rf^!B, adjoint to (tr_f ⊗ id) ∘ (projection formula). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `upperShriekBaseChangeTransformation` | data | For a cartesian square with f eligible and g an arbitrary map of small v-stacks, g̃^*Rf^! → Rf′^!g^*, adjoint to Rf′_!g̃^*Rf^! ≃ g^*Rf_!Rf^! → g^*. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `shriekTrace_comp` | functoriality | tr_{f∘g} = tr_f ∘ Rf_!(tr_g)(Rf^!) under the composition equivalences. | specialization: The actual counit of the composite specified adjunction, with its equality of components. |
| `twistedPullbackTransformation_openImmersion` | simp | For f an open immersion, τ_f is the identity of j^*. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `twistedPullbackTransformation_etale` | simp | For f separated étale, τ_f is the identity of f^* under Rf^! ≃ f^*. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `shriekTrace_finiteEtale` | compatibility | For f finite étale, tr_f : f_*f^* → id is the classical trace map (summation over fibres). | specialization: Algebraic sum on an actual finite fibre, before normalization. |
| `twistedPullbackTransformation_baseChange` | relation | τ is compatible with base change along any map of small v-stacks through upperShriekBaseChangeTransformation. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `twistedPullback_id` | degenerate | For f the identity, τ_f is the identity and tr_f is the identity. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `shriekTrace_openImmersion` | computation | For an open immersion j, tr_j : j_!j^*B → B is the counit of j_! ⊣ j^*. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `shriekTrace_finiteEtale_degree` | computation | For f : Y′ → Y finite étale of constant degree d, tr_f ∘ unit : Λ → f_*f^*Λ → Λ is multiplication by d. | specialization: Actual finite sum of diagonal elements equals cardinal times the element. |
| `twistedPullback_not_iso_profinite` | non-example | Assume Λ ≠ 0 and take T infinite (for example T = S). For q : S × Spa(C, O_C) → Spa(C, O_C), S an infinite profinite set, τ_q is not an equivalence: on global sections over an open and closed T ⊂ S, Rq^!M is RHom(C⁰(T, Λ), M) while Rq^!Λ ⊗ q^*M is RHom(C⁰(T, Λ), Λ) ⊗ M, and these differ for M = ⊕_ℕ Λ because C⁰(T, Λ) is free of infinite rank; Rq^! does not commute with direct sums, matching criterion (iii) of S4/strictly-local-criteria. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Acceptance:

- For a finite étale cover of degree d of a connected base, tr_f ∘ (unit) on Λ is multiplication by d.

Suggested target signatures:

- `shriekTrace`: specialization. Actual counit of a specified ordinary categorical adjunction.
- `twistedPullbackTransformation`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.
- `upperShriekBaseChangeTransformation`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual enhanced etale categories and the constructed exceptional adjunction; two coefficient rings, actual ring map and derived scalar functors; tensor/internal-Hom with their unit, specified counit/twisted transformations and commuting diagrams.

## S4. Cohomological smoothness with the revised descent hypotheses

Stage `DiamondSixOperations:S4`: **planned**.

Remaining acceptance inputs:

- Supply Neeman’s compact-generator/coproduct criterion from E3 for the direct-sum criterion.
- Express the full four local criteria, practical condition (iii), derived coefficient reduction, locally constant degree and twisted-pullback comparisons on the actual geometric suppliers.

### Criteria for Rf^! to be a twisted pullback over a strictly totally disconnected base

`DiamondSixOperations:S4/strictly-local-criteria` · theorem · planet: **Criteria over strictly totally disconnected bases**

Let X be a strictly totally disconnected perfectoid space, f : Y → X a compactifiable map from a locally spatial diamond Y with locally dim.trg f < ∞ (so f is eligible), and ℓ ≠ p a prime. The following are equivalent: (i) the twisted-pullback transformation τ_f : Rf^!F_ℓ ⊗_{F_ℓ} f^* → Rf^! of functors D_ét(X, F_ℓ) → D_ét(Y, F_ℓ) (S3/adjunction-calculus) is an equivalence; (ii) Rf^! is equivalent to A ⊗_{F_ℓ} f^* for some A ∈ D_ét(Y, F_ℓ); (iii) Rf^! commutes with arbitrary direct sums, and for every connected component X₀ = Spa(C, C⁺) of X and open j : U ⊂ X₀ with pullbacks f_U : V → U, f₀ : Y₀ → X₀, j′ : V → Y₀, the map j′_!Rf_U^!F_ℓ → Rf₀^!j_!F_ℓ adjoint to Rf₀!j′_!Rf_U^!F_ℓ = j_!Rf_U!Rf_U^!F_ℓ → j_!F_ℓ is an equivalence; (iv) for every affinoid pro-étale g : X′ → X with pullback h : Y′ → Y, f′ : Y′ → X′, the base-change transformation h^*Rf^! → Rf′^!g^* is an equivalence, and for X₀, U as in (iii) the transformation j′_!Rf_U^! → Rf₀^!j_! of functors D_ét(U, F_ℓ) → D_ét(Y₀, F_ℓ) is an equivalence.

Hypotheses:

- X strictly totally disconnected (D1); Y locally spatial; f compactifiable with locally dim.trg f < ∞; ℓ ≠ p.

Named declarations: `upperShriek_twist_tfae`.

Construction or proof:

1. (i) ⇒ (ii) ⇒ (iii): clear, f^* and ⊗ commute with sums; the second part of (iii) holds for twisted pullbacks.
2. (iii) ⇒ (iv), first part: write g = lim gᵢ with gᵢ affinoid étale; h_* = Rh_* is exact and conservative (C8/qpetale-direct-image, ECD Remark 21.14), so it suffices that h_*h^*Rf^! → Rf^!g_*g^* is an equivalence; g_*g^* = colim gᵢ*gᵢ^*, and Rf^! commutes with colimits (it commutes with sums, E3), reducing to étale gᵢ, where gᵢ^* = Rgᵢ^! and S3/upper-shriek-composition, S3/upper-shriek-etale apply.
3. (iii) ⇒ (iv), second part: the objects K of D_ét(U, F_ℓ) satisfying it form a triangulated subcategory closed under sums containing every j″_!F_ℓ for open j″ : U″ ⊂ U, which generate (C9/compact-generators, U strictly totally disconnected).
4. (iv) ⇒ (i): check on fibres; by the first part of (iv) reduce to X = Spa(C, C⁺) strictly local and a geometric point y over x; replace X by the generalisations X₁ of x; by the second part and triangles reduce K to i_*K₀ and then to a constant K₀; bounded case by triangles, D⁺ by the finite cohomological dimension of Rf_! (S1/compactification-cd-bound), D⁻ by Postnikov limits since Rf^! preserves limits and Rf^!F_ℓ ∈ D^{≤0} (computed via C8/injection-direct-image, ECD Lemma 21.13, and exactness of Hom(−, F_ℓ) at a geometric point).
5. K₀ = V[0] with V = C⁰(S, F_ℓ) for a profinite S: with h : X × S → X, (iv) gives Rf′^!h^*F_ℓ = h′^*Rf^!F_ℓ; apply Rh′_* and S3/upper-shriek-pushforward-exchange (ECD 23.16(i)) to get Rf^!Rh_*h^*F_ℓ = Rh′_*h′^*Rf^!F_ℓ, and S4/profinite-projection-pushforward translates this into Rf^!V = V ⊗ Rf^!F_ℓ.

Direct prerequisites: `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/upper-shriek-pushforward-exchange`, `DiamondSixOperations:S3/upper-shriek-composition`, `DiamondSixOperations:S3/upper-shriek-etale`, `DiamondSixOperations:S4/profinite-projection-pushforward`, `DiamondSixOperations:S1/compactification-cd-bound`, `DiamondEtaleCohomology:C8/qpetale-direct-image`, `DiamondEtaleCohomology:C8/injection-direct-image`, `DiamondEtaleCohomology:C9/compact-generators`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondSixOperations:S0/eligible-morphism`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.4, p. 141. Hypotheses.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.4, p. 142. The easy implications.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Remark 23.5, p. 142. Meaning of (iv).

Acceptance:

- For the ball B × X → X all four conditions hold (S5/ball-smooth); for q : S × X → X with S infinite profinite, (iii) fails (Rq^! does not commute with sums).

Suggested target signatures:

- `upperShriek_twist_tfae`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### The twisted-pullback criterion for ℓ-power-torsion coefficients

`DiamondSixOperations:S4/strictly-local-criteria-torsion` · theorem

Under the equivalent conditions of S4/strictly-local-criteria, for every ℓ-power-torsion ring Λ (ℓ^m Λ = 0 for some m) the transformation τ_f : Rf^!Λ ⊗_Λ f^* → Rf^! of functors D_ét(X, Λ) → D_ét(Y, Λ) is an equivalence.

Hypotheses:

- As in S4/strictly-local-criteria; Λ ℓ-power torsion.

Named declarations: `upperShriek_twist_of_ellTorsion`.

Construction or proof:

1. Λ is a ℤ/ℓ^m-algebra; by S3/upper-shriek-change-of-rings reduce to Λ = ℤ/ℓ^m.
2. Every K ∈ D_ét(X, ℤ/ℓ^m) is filtered by m copies of K ⊗ F_ℓ, reducing to K from D_ét(X, F_ℓ), and so to Rf^!(ℤ/ℓ^m) ⊗_{ℤ/ℓ^m} F_ℓ → Rf^!F_ℓ being an isomorphism.
3. Condition (iv) also holds for ℤ/ℓ^m by the same filtration; reduce to X = Spa(C, C⁺) connected, use the standard periodic resolution of F_ℓ over ℤ/ℓ^m and Rf^!(ℤ/ℓ^m) ∈ D^{≤0}, proved as for F_ℓ using that ℤ/ℓ^m is self-injective.

Direct prerequisites: `DiamondSixOperations:S4/strictly-local-criteria`, `DiamondSixOperations:S3/upper-shriek-change-of-rings`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `DiamondEtaleCohomology:C3/change-of-coefficients`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.4, p. 142. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.4, p. 144. Proof route.

Acceptance:

- For Λ = ℤ/ℓ² and the ball, Rf^!ℤ/ℓ² ≅ ℤ/ℓ²(1)[2] (S5/ball-smooth).

Suggested target signatures:

- `upperShriek_twist_of_ellTorsion`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### Pushforward along a profinite projection

`DiamondSixOperations:S4/profinite-projection-pushforward` · lemma

Let S be a profinite set, Y a small v-sheaf, h : Y × S → Y the projection, and Λ a ring with nΛ = 0 for some n prime to p. For C ∈ D_ét(Y, Λ) there is a natural isomorphism Rh_*h^*C ≃ C⁰(S, Λ) ⊗_Λ C, with C⁰(S, Λ) the Λ-module of continuous (locally constant) maps S → Λ. ECD states this for any ring Λ, but the printed proof passes through Rh_! and the projection formula, which need nΛ = 0 with n prime to p; the statement is restricted accordingly (PAPER-SCHOLZE-17/E69), which covers its only use (Λ = F_ℓ in S4/strictly-local-criteria).

Hypotheses:

- S profinite; Y a small v-sheaf; nΛ = 0, n prime to p (corrected hypothesis).

Named declarations: `profiniteProjection_pushforward_pullback`.

Construction or proof:

1. h is proper (quasicompact separated universally closed, C4) and spatial-eligible with dim.trg 0, so Rh_* ≅ Rh_! (S1/factorisation-independence (a)).
2. Projection formula (S1/projection-formula-qc): Rh_!h^*C ≅ Rh_!h^*Λ ⊗^L C = Rh_*h^*Λ ⊗^L C.
3. Write S = lim Sᵢ with Sᵢ finite; Rh_*h^*Λ = colim Rhᵢ*hᵢ^*Λ = colim Λ^{Sᵢ} = C⁰(S, Λ) by continuity (C0, ECD Proposition 14.9). C⁰(S, Λ) is a free Λ-module (flat), so ⊗^L = ⊗.

Direct prerequisites: `DiamondSixOperations:S1/factorisation-independence`, `DiamondSixOperations:S1/projection-formula-qc`, `DiamondEtaleCohomology:C0/std-etale-acyclic`, `DiamondEtaleCohomology:C0/unbounded-comparison-std`, `DiamondEtaleCohomology:C2/etale-test-on-one-cover`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Lemma 23.6, p. 144. Printed hypothesis on Λ (corrected here).

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Lemma 23.6, p. 144. Proof route, which needs nΛ = 0 with n prime to p.

Acceptance:

- S finite of cardinality m: Rh_*h^*C = C^m; S = ℤ_p: Rh_*h^*Λ = C⁰(ℤ_p, Λ), a free module of countable rank.

Suggested target signatures:

- `profiniteProjection_pushforward_pullback`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### Rf^! commutes with sums iff Rf_! preserves constructibility

`DiamondSixOperations:S4/direct-sum-criterion` · theorem

Let X be strictly totally disconnected, f : Y → X a compactifiable map from a spatial diamond Y with dim.trg f < ∞, and ℓ ≠ p. Then Rf^! : D_ét(X, F_ℓ) → D_ét(Y, F_ℓ) commutes with arbitrary direct sums if and only if for every constructible sheaf F of F_ℓ-vector spaces on Y_ét and every i ≥ 0, R^i f_!F is constructible on X_ét.

Hypotheses:

- X strictly totally disconnected; Y spatial; f compactifiable with dim.trg f < ∞ (spatial-eligible); ℓ ≠ p.

Named declarations: `upperShriek_preservesCoproducts_iff`.

Construction or proof:

1. Y satisfies the hypothesis of ECD 20.10: every quasicompact separated étale U → Y has ℓ-cohomological dimension ≤ N = 3 dim.trg f, by S1/compactification-cd-bound (X has cohomological dimension 0).
2. By C9/finite-field-compact-objects (ECD 20.10), D_ét(Y, F_ℓ) and D_ét(X, F_ℓ) are compactly generated, with compact objects the bounded complexes with constructible cohomology; so the constructibility condition says that Rf_! preserves compact objects.
3. Neeman's criterion (E3: for F ⊣ G between compactly generated triangulated categories, G preserves sums iff F preserves compacts).

Direct prerequisites: `DiamondSixOperations:S1/compactification-cd-bound`, `DiamondEtaleCohomology:C9/finite-field-compact-objects`, `DiamondEtaleCohomology:C9/compact-generators`, `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S0/spatial-eligible-morphism`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`, `DiamondEtaleCohomology:C7/constructible-sheaf`, `DiamondEtaleCohomology:C7/constructible-limit-descent`, `DiamondEtaleCohomology:C7/constructible-filtration`, `DiamondEtaleCohomology:C7/perfect-constructible`, `DiamondEtaleCohomology:C7/perfect-constructible-over-field`, `DiamondEtaleCohomology:C7/perfect-constructible-filtration`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.7, p. 144. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.7, p. 145. Proof.

Acceptance:

- For the ball over a strictly totally disconnected X both sides hold (H4/perfectoid-base-constructibility-transfer); for q : S × X → X with S infinite profinite both fail: R⁰q_!F_ℓ = C⁰(S, F_ℓ) is not constructible.

Suggested target signatures:

- `upperShriek_preservesCoproducts_iff`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### Invertible objects of D_ét

`DiamondSixOperations:S4/invertible-object` · definition

For a locally spatial diamond Y and a ring Λ (in the applications F_ℓ or an ℓ-power-torsion ring), an object D ∈ D_ét(Y, Λ) is invertible if it is locally isomorphic to Λ[n] for some integer n, where locally may be taken equivalently in the v-, the quasi-pro-étale or the étale topology of Y. For Λ ≠ 0, the shift index n is uniquely determined and locally constant on |Y|; its cohomological degree is −n. For the zero ring every shift is zero, so invertibility is meaningful but a unique degree is not. Invertible objects are ⊗-invertible (D ⊗ RHom(D, Λ) ≃ Λ); the converse is not part of the definition.

Hypotheses:

- Y a locally spatial diamond; the three topologies give the same notion (ECD's 'equivalently').

Named declarations: `IsInvertibleObject`.

Construction or proof:

1. Define IsInvertible D as: there is an étale cover {Uᵢ → Y} and integers nᵢ with D|_{Uᵢ} ≃ Λ[nᵢ].
2. Equivalence of the v-, quasi-pro-étale and étale versions: for an isomorphism D|_{Ỹ} ≃ Λ[n] over a v-cover Ỹ → Y, n is constant on an open and closed stratification and the sheaf of isomorphisms D ≃ Λ[n] is separated, étale and surjective over Y by v-descent (ECD proof of 23.12(i); D3/etale-and-finite-etale-are-v-stacks), so it has étale-local sections.
3. For Λ ≠ 0, local constancy and uniqueness of n follow from the unique degree in which the stalk cohomology is nonzero. No unique degree is claimed for Λ = 0.

Direct prerequisites: `DiamondsAndVStacks:D5/spatial-diamond`, `DiamondsAndVStacks:D3/etale-and-finite-etale-are-v-stacks`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `DiamondEtaleCohomology:C3/change-of-coefficients`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Definition 23.8, p. 145. The definition, over F_ℓ.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.12, p. 149. Why the topologies agree.

Uses:

- ECD Definition 23.8: the dualizing complex of an ℓ-cohomologically smooth map is required to be invertible
- ECD Propositions 23.10(iv), 23.12(i) and 23.13: invertibility of Rf^!F_ℓ is a criterion and is stable under composition
- ECD Theorem 25.1: biduality with respect to Rf^!F_ℓ is equivalent to naive biduality because Rf^!F_ℓ is invertible
- VStackSheavesAndLisseCategories:VS0: the dualizing complex of a smooth chart of an Artin v-stack is invertible

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `IsInvertibleObject.shift` | constructor | If D is invertible then D[m] is invertible for every m ∈ ℤ. | specialization: Shift of a discrete derived-module family. |
| `IsInvertibleObject.const` | constructor | Λ[n] is invertible. | specialization: The specified module unit in a specified shift. |
| `IsInvertibleObject.tensor` | structure | Tensor products of invertible objects are invertible. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsInvertibleObject.pullback` | functoriality | Pullback along any map of locally spatial diamonds preserves invertibility. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `isInvertibleObject_iff_etale_local` | characterisation | D is invertible iff étale locally ≃ Λ[n] iff quasi-pro-étale locally ≃ Λ[n] iff v-locally ≃ Λ[n]. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsInvertibleObject.tensor_dual` | relation | For invertible D, the evaluation D ⊗ RHom(D, Λ) → Λ is an isomorphism and RHom(D, Λ) is invertible. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsInvertibleObject.degree` | data | Assuming Λ ≠ 0, degree(D) is the uniquely determined locally constant function \|Y\| → ℤ with value −n at y when D_y ≃ Λ[n]. Thus Λ[n] has cohomological degree −n. Distinct connected components can have different degrees; no global shift index is required. | specialization: A genuine LocallyConstant map on a discrete component space, with Nontrivial coefficients and cohomological sign −n; degree_spec states the relation. |
| `IsInvertibleObject.of_reduction` | other | For Λ = ℤ/ℓ^m with m ≥ 1: if D ⊗^L_{ℤ/ℓ^m} F_ℓ is invertible then D is invertible over ℤ/ℓ^m (ECD proof of 23.12(i)). General ℓ-power-torsion coefficient rings are handled by extension of scalars from ℤ/ℓ^m; there is no assumed map Λ → F_ℓ for an arbitrary such ring. | specialization: The degree-zero finite-free module case over the actual rings Z/ell^m and F_ell and their ring map. The full derived/local statement is omitted. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `IsInvertibleObject.const_zero` | degenerate | Λ = Λ[0] is invertible, with degree 0. The stated degree is uniquely determined when Λ ≠ 0. | specialization: Actual derived ring module, one discrete component. |
| `IsInvertibleObject.tate_twist` | computation | On Spa(C, O_C), Λ(1)[2] is invertible of degree −2 (μ_n is constant after choosing roots of unity). The stated degree is uniquely determined when Λ ≠ 0. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `not_isInvertibleObject_extensionByZero` | non-example | Assume Λ ≠ 0. For C⁺ ≠ O_C and j : Spa(C, O_C) → Spa(C, C⁺), j_!Λ is not invertible: its stalk at the closed point is 0. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `not_isInvertibleObject_sum` | non-example | Assume Λ ≠ 0 and Y is nonempty. Λ ⊕ Λ is not invertible (rank 2 stalks). | specialization: Actual degree-zero rank-two F_5 module is not a shifted rank-one module. |
| `IsInvertibleObject.disjoint_shifts` | computation | For nonzero Λ and Y the disjoint union of two geometric points, the object restricting to Λ on one point and Λ[1] on the other is invertible. Its degree is 0 on the first component and −1 on the second; a single global shift is not required. | specialization: Actual F_5 derived modules on Bool: shifts 0 and 1 are locally invertible with no single global shift. |

Acceptance:

- Λ[2] and Λ(1)[2] (étale locally Λ[2]) are invertible; j_!Λ for a proper open j is not.

Suggested target signatures:

- `IsInvertibleObject`: specialization. Discrete families in the actual derived category of modules, each locally a shifted unit. No equivalence with geometric D_et is assumed.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### ℓ-cohomologically smooth morphisms

`DiamondSixOperations:S4/cohomologically-smooth` · definition · planet: **ℓ-cohomologically smooth morphism**

Let f : Y′ → Y be a separated map of small v-stacks that is representable in locally spatial diamonds, and ℓ ≠ p a prime. Then f is ℓ-cohomologically smooth if f is compactifiable, locally dim.trg f < ∞, and for every strictly totally disconnected perfectoid space X with a map X → Y and pullback f_X : Y′ ×_Y X → X, the functor Rf_X^! : D_ét(X, F_ℓ) → D_ét(Y′ ×_Y X, F_ℓ) is equivalent to D_{f_X} ⊗_{F_ℓ} f_X^* for some invertible object D_{f_X} (S4/invertible-object). The equivalence must be natural in the coefficient object, because it is an equivalence of functors. It need not be the canonical twisted-pullback transformation or be chosen compatibly for different base changes; those are conclusions (S4/smooth-twisted-pullback, S4/smooth-upper-shriek-base-change). The printed 'D_{f_X} ⊗ f^*' should read f_X^* (PAPER-SCHOLZE-17/E64). The notion is defined only for separated maps representable in locally spatial diamonds; smoothness of stacky maps (e.g. [*/G] → *) is VStackSheavesAndLisseCategories VS0's.

Hypotheses:

- f separated and representable in locally spatial diamonds; ℓ ≠ p.

Named declarations: `IsCohomologicallySmooth`.

Construction or proof:

1. Define IsCohomologicallySmooth ℓ f as: f compactifiable, LocallyFiniteDimTrg f, and for all strictly totally disconnected X → Y there are an invertible D and an equivalence Rf_X^! ≃ D ⊗ f_X^* (S3/upper-shriek over the eligible f_X).
2. f is then eligible (S0/eligible-morphism) and every pullback f_X is eligible, so Rf_X^! is defined.

Direct prerequisites: `DiamondSixOperations:S0/eligible-morphism`, `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S4/invertible-object`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`, `DiamondsAndVStacks:D5/relative-representability`, `DiamondEtaleCohomology:C8/locally-finite-dim-trg`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Definition 23.8, p. 145. The definition.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Definition 23.8, p. 145. The functor equivalence need not be the canonical twisted-pullback map; its canonical form follows from the criteria.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Remark 23.9, p. 145. Scope: separated maps representable in locally spatial diamonds only.

Uses:

- ECD Propositions 23.11–23.17: openness, dualizing complexes, composition, descent and smooth base change
- ECD §24: the ball, profinite quotients, smooth analytic maps and Spd ℚ_p are shown smooth
- ECD Theorem 25.1: biduality for X smooth over Spa(C, O_C)
- VStackSheavesAndLisseCategories:VS0 (FS IV.1.1): Artin v-stacks are defined by separated cohomologically smooth surjective charts
- BunGAndNewtonStrata:BG2–BG4: Bun_G is a smooth Artin v-stack; its charts and strata are cohomologically smooth
- GeometricSatakeAndFusion:GS0: graded pieces of the congruence filtration and open Schubert cells are cohomologically smooth
- VectorBundlesAndIsocrystals:VB3: positive Banach–Colmez spaces are cohomologically smooth
- RelativeFarguesFontaine:RF2: Div¹ → * is cohomologically smooth

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `IsCohomologicallySmooth.isEligible` | projection | An ℓ-cohomologically smooth map is eligible. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsCohomologicallySmooth.isSeparated` | projection | An ℓ-cohomologically smooth map is separated. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsCohomologicallySmooth.twist` | projection | For f smooth, τ_f : Rf^!Λ ⊗ f^* → Rf^! is an equivalence for ℓ-power-torsion Λ, and Rf^!Λ is invertible (S4/smooth-twisted-pullback). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `isCohomologicallySmooth_iff` | characterisation | For f compactifiable and representable in spatial diamonds: smooth iff dim.trg f_X < ∞ after every strictly totally disconnected base change X → Y, constructibility of R^i f_{X!} on constructibles, the open-immersion condition over geometric points, and invertibility of Rf_X^!F_ℓ (S4/practical-smoothness-criterion). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsCohomologicallySmooth.baseChange` | functoriality | Stable under base change along any map of small v-stacks (S4/smooth-stable-under-base-change). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsCohomologicallySmooth.comp` | structure | Stable under composition (S4/smooth-composition). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsCohomologicallySmooth.of_baseChange` | other | v-local on the target, given locally dim.trg f < ∞ (S4/smooth-v-local-on-target). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsCohomologicallySmooth.isUniversallyOpen` | relation | Smooth maps are universally open (S4/smooth-universally-open). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsCohomologicallySmooth.of_separated_etale` | compatibility | Separated étale maps are smooth with dualizing complex Λ (S4/etale-maps-smooth). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `IsCohomologicallySmooth.id` | degenerate | The identity of a small v-stack is ℓ-cohomologically smooth with dualizing complex Λ. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `IsCohomologicallySmooth.ball` | computation | The ball B → * is ℓ-cohomologically smooth for every ℓ ≠ p, with Rf^!Λ ≅ Λ(1)[2] (S5/ball-smooth). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `not_isCohomologicallySmooth_profinite` | non-example | Assume X is nonempty. For S an infinite profinite set and X strictly totally disconnected, S × X → X is not ℓ-cohomologically smooth: Rq^!F_ℓ is the sheaf of distributions, not invertible. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `not_isCohomologicallySmooth_origin` | non-example | The origin 0 : Spa(C, O_C) → B × Spa(C, O_C) of the perfectoid ball is a closed immersion (proper, hence compactifiable, with dim.trg 0) whose image is not open, so it is not ℓ-cohomologically smooth (S4/smooth-universally-open). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Acceptance:

- Separated étale maps (D = Λ), the ball B → * (D = Λ(1)[2]), (Spa ℚ_p)^♢ → * and smooth analytic maps are ℓ-cohomologically smooth; S × X → X for S infinite profinite is not.

Suggested target signatures:

- `IsCohomologicallySmooth`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### A practical criterion for ℓ-cohomological smoothness

`DiamondSixOperations:S4/practical-smoothness-criterion` · theorem

Let f : Y′ → Y be a compactifiable map of small v-stacks representable in spatial diamonds and ℓ ≠ p. Then f is ℓ-cohomologically smooth iff: (i) for each strictly totally disconnected X → Y, dim.trg f_X < ∞; (ii) for every strictly totally disconnected X → Y and every constructible étale sheaf F of F_ℓ-vector spaces on Y′ ×_Y X, R^i f_{X!}F is constructible on X for all i ≥ 0; (iii) for every X = Spa(C, C⁺) → Y (C algebraically closed, C⁺ open bounded valuation subring) and quasicompact open j : U → X, with f_U, j′ the pullbacks, the map j′_!Rf_U^!F_ℓ → Rf_X^!j_!F_ℓ adjoint to Rf_X!j′_!Rf_U^!F_ℓ = j_!Rf_U!Rf_U^!F_ℓ → j_!F_ℓ is an equivalence; (iv) for every strictly totally disconnected X → Y, Rf_X^!F_ℓ ∈ D_ét(Y′ ×_Y X, F_ℓ) is invertible. Here (i) is local on the target. The printed uniform global bound in ECD 23.10 is too strong over arbitrary non-quasicompact Y (source issue E4); it agrees with the printed condition when Y is spatial. Apply the printed criterion to each spatial base change, and use the definition of smoothness to descend.

Hypotheses:

- f compactifiable and representable in spatial diamonds; ℓ ≠ p.

Named declarations: `isCohomologicallySmooth_iff_practical`.

Construction or proof:

1. Given (ii), condition (iii) for quasicompact U implies it for all U by S4/direct-sum-criterion and a filtered colimit over quasicompact opens.
2. By S4/direct-sum-criterion, (ii) is equivalent to Rf_X^! commuting with direct sums; with (iii) this is criterion (iii) of S4/strictly-local-criteria, equivalent to τ_{f_X} being an equivalence; (iv) supplies invertibility.
3. Conversely, after each strictly totally disconnected base change the definition gives (ii) of S4/strictly-local-criteria. That node gives (i), (iii) and (iv) there, and S4/direct-sum-criterion gives constructibility. Spatial representability makes each Y′ ×_Y X quasicompact, so local finiteness gives the finite bound for each f_X in (i), with no uniform bound over all X. This does not use the later global theorem S4/smooth-twisted-pullback.

Direct prerequisites: `DiamondSixOperations:S4/strictly-local-criteria`, `DiamondSixOperations:S4/direct-sum-criterion`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/invertible-object`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.10, p. 145. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.10, p. 146. Proof.

Acceptance:

- ECD's proof of 24.1 checks exactly (i)–(iv) for the ball, with Huber's constructibility, duality and trace as inputs.

Suggested target signatures:

- `isCohomologicallySmooth_iff_practical`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### ℓ-cohomologically smooth maps are universally open

`DiamondSixOperations:S4/smooth-universally-open` · theorem · planet: **Smooth maps are universally open**

Let f : Y′ → Y be a separated map of small v-stacks, representable in locally spatial diamonds and ℓ-cohomologically smooth for some ℓ ≠ p. Then f is universally open: for every X → Y the map |Y′ ×_Y X| → |X| is open.

Hypotheses:

- f separated, representable in locally spatial diamonds, ℓ-cohomologically smooth.

Named declarations: `IsCohomologicallySmooth.isUniversallyOpen`.

Construction or proof:

1. Reduce to Y = X strictly totally disconnected and Y′ spatial; it suffices that the image of |Y′| → |X| is open, and since it is generalising, that it is constructible.
2. Rf_!Rf^!F_ℓ is constructible (Rf^!F_ℓ invertible hence constructible, S4/practical-smoothness-criterion (ii)); its support is constructible.
3. The support equals the image: if s ∉ image, Rf^!F_ℓ lives over X ∖ {s}, so does Rf_!Rf^!F_ℓ; if s is in the image, with U = X ∖ {s}, condition (iii) shows Rf_!Rf^!F_ℓ|_s has stalk that of Rf_!Rf^!F_ℓ at s, and Hom(Rf_!Rf^!F_ℓ|_s, F_ℓ) = Hom(Rf^!F_ℓ|_s, Rf^!F_ℓ) ≠ 0 since the fibre over s is nonempty.

Direct prerequisites: `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/practical-smoothness-criterion`, `DiamondSixOperations:S4/strictly-local-criteria`, `DiamondSixOperations:S4/smooth-twisted-pullback`, `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`, `DiamondEtaleCohomology:C7/constructible-sheaf`, `DiamondEtaleCohomology:C7/constructible-limit-descent`, `DiamondEtaleCohomology:C7/constructible-filtration`, `DiamondEtaleCohomology:C7/perfect-constructible`, `DiamondEtaleCohomology:C7/perfect-constructible-over-field`, `DiamondEtaleCohomology:C7/perfect-constructible-filtration`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.11, p. 146. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.11, p. 146. Key step.

Acceptance:

- The origin of the perfectoid ball has non-open image, so its inclusion is not smooth; open immersions are.

Suggested target signatures:

- `IsCohomologicallySmooth.isUniversallyOpen`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### The dualizing complex of an ℓ-cohomologically smooth map

`DiamondSixOperations:S4/dualizing-complex` · construction · planet: **Dualizing complex D_f = Rf^!Λ**

For f : Y′ → Y separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, and Λ an ℓ-power-torsion ring, the dualizing complex is D_f := Rf^!Λ ∈ D_ét(Y′, Λ). It is invertible, étale locally isomorphic to Λ[n] with n locally constant, the canonical transformation τ_f : D_f ⊗_Λ f^* → Rf^! is an equivalence, and D_f commutes with every base change: g′^*D_f ≃ D_{f̃}. Its local degree is −2 dim at points where f is a smooth analytic map of relative dimension d in the sense of S5 (D = Λ(d)[2d]).

Hypotheses:

- f ℓ-cohomologically smooth; Λ ℓ-power torsion.

Named declarations: `dualizingComplex`.

Construction or proof:

1. Define D_f := Rf^!Λ (S3/upper-shriek); invertibility and τ_f an equivalence are S4/smooth-twisted-pullback; base change is S4/smooth-upper-shriek-base-change.

Direct prerequisites: `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S4/smooth-twisted-pullback`, `DiamondSixOperations:S4/smooth-upper-shriek-base-change`, `DiamondSixOperations:S4/invertible-object`, `DiamondSixOperations:S4/cohomologically-smooth`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.12(i), p. 147. Definition and invertibility.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.12(iii), p. 147. Base change.

Uses:

- ECD Propositions 23.13, 23.16(iii) and 23.17: composition, exchange with pullback and smooth pullback of internal Hom are computed by tensoring with D_f
- ECD Theorem 24.1 and Propositions 24.2–24.5: the examples identify D_f (Λ(1)[2] for the ball; q^*D_{f/K} for quotients)
- ECD Theorem 25.1: Verdier duality RHom(−, D_f) and its biduality
- VStackSheavesAndLisseCategories:VS0 (FS IV.1.17): the dualizing complex of a smooth stacky map is glued from those of charts
- BunGAndNewtonStrata:BG3: the ℓ-dimension of strata is read off from the degree of D_f

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `dualizingComplex_def` | characterisation | D_f = Rf^!Λ. | specialization: The displayed point-module definition. |
| `dualizingComplex_isInvertible` | projection | D_f is invertible (S4/invertible-object). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `upperShriek_eq_dualizing_tensor_pullback` | characterisation | Rf^! ≃ D_f ⊗_Λ f^* via τ_f. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `dualizingComplex_baseChange` | functoriality | g′^*D_f ≃ D_{f̃} for every cartesian square. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `dualizingComplex_comp` | relation | D_{f∘g} ≃ D_g ⊗ g^*D_f for composable smooth maps (S4/smooth-composition). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `dualizingComplex_etale` | compatibility | For f separated étale, D_f ≃ Λ. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `dualizingComplex_restrictScalars` | compatibility | For Λ → Λ′ of ℓ-power-torsion rings, D_f over Λ′ is D_f ⊗_Λ Λ′. | specialization: Scalar mate evaluated at the actual coefficient module; the geometric tensor comparison is omitted. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `dualizingComplex_id` | degenerate | D_{id} ≅ Λ. | specialization: Actual identity endofunctor on modules. |
| `dualizingComplex_ball` | computation | For the ball B → *, D_f ≅ Λ(1)[2] (S5/ball-smooth). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `dualizingComplex_finiteEtale` | compatibility | For a finite étale f, D_f ≅ Λ and τ_f is the identification Rf^! = f^*. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `dualizingComplex_not_const_profinite` | non-example | Assume S is infinite, X is nonempty and Λ ≠ 0. For the profinite projection q : S × X → X (not smooth), Rq^!Λ is the sheaf of distributions on S, not étale-locally Λ[n]. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Acceptance:

- D_f = Λ for f separated étale; D_f = Λ(1)[2] for the ball; for a composite D_{f∘g} = D_g ⊗ g^*D_f.

Suggested target signatures:

- `dualizingComplex`: specialization. Specified right endofunctor on actual modules evaluated at the ring module. No geometric smoothness or invertibility inferred.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### Rf^! is a twisted pullback for smooth f

`DiamondSixOperations:S4/smooth-twisted-pullback` · theorem

Let f : Y′ → Y be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, and Λ ℓ-power torsion. Then τ_f : Rf^!Λ ⊗_Λ f^* → Rf^! is an equivalence of functors D_ét(Y, Λ) → D_ét(Y′, Λ), and Rf^!Λ is invertible, étale locally ≃ Λ[n]. In particular the a priori unspecified equivalence of the definition is the canonical transformation τ_f, and the dualizing object is Rf^!Λ.

Hypotheses:

- f ℓ-cohomologically smooth; Λ ℓ-power torsion.

Named declarations: `IsCohomologicallySmooth.upperShriek_twist`.

Construction or proof:

1. Over a strictly totally disconnected Y = X: the definition gives (ii) of S4/strictly-local-criteria, hence (i) and, by S4/strictly-local-criteria-torsion, τ_f over Λ; first take Λ = ℤ/ℓ^m: reduction to F_ℓ and S4/invertible-object give invertibility over ℤ/ℓ^m. For general ℓ-power-torsion Λ, extend scalars from ℤ/ℓ^m using S3/upper-shriek-change-of-rings. This does not tensor an arbitrary Λ over a nonexistent ring map Λ → F_ℓ.
2. Base change between strictly totally disconnected spaces (first step of S4/smooth-upper-shriek-base-change) shows that Rf^! commutes with pullback along a v-hypercover X̃• → Y by disjoint unions of strictly totally disconnected spaces.
3. Then τ_f can be checked after pullback to X̃₀, where it holds; invertibility descends étale locally by S4/invertible-object.

Direct prerequisites: `DiamondSixOperations:S4/strictly-local-criteria`, `DiamondSixOperations:S4/strictly-local-criteria-torsion`, `DiamondSixOperations:S4/invertible-object`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-upper-shriek-base-change`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `DiamondSixOperations:S3/upper-shriek-change-of-rings`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.12(i), p. 147. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.12, p. 149. Descent of the equivalence.

Acceptance:

- For the ball, Rf^!M = M(1)[2] for every Λ-module M.

Suggested target signatures:

- `IsCohomologicallySmooth.upperShriek_twist`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### Quasicompact smooth Rf_! preserves perfect-constructible complexes

`DiamondSixOperations:S4/smooth-perfect-constructible` · theorem

Let f : Y′ → Y be separated, representable in locally spatial diamonds, ℓ-cohomologically smooth and quasicompact, and Λ ℓ-power torsion. For every perfect-constructible A ∈ D_ét(Y′, Λ), Rf_!A ∈ D_ét(Y, Λ) is perfect-constructible. No such statement is made for an arbitrary proper map.

Hypotheses:

- f quasicompact and ℓ-cohomologically smooth; Λ ℓ-power torsion; A perfect-constructible (C7).

Named declarations: `IsCohomologicallySmooth.lowerShriek_perfectConstructible`.

Construction or proof:

1. By base change (S2/lower-shriek-base-change) and v-descent of perfect-constructibility (C7) assume Y strictly totally disconnected; Y′ is then spatial of bounded cohomological dimension (S1/compactification-cd-bound).
2. By C9/compact-iff-perfect-constructible (ECD 20.17) compact objects of D_ét(Y′, Λ), D_ét(Y, Λ) are the perfect-constructible complexes.
3. Rf_! preserves compacts iff Rf^! preserves sums (Neeman, E3), which holds since Rf^! = D_f ⊗ f^* (S4/smooth-twisted-pullback).

Direct prerequisites: `DiamondSixOperations:S4/smooth-twisted-pullback`, `DiamondEtaleCohomology:C9/compact-iff-perfect-constructible`, `DiamondSixOperations:S1/compactification-cd-bound`, `DiamondSixOperations:S2/lower-shriek-base-change`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`, `DiamondEtaleCohomology:C7/constructible-sheaf`, `DiamondEtaleCohomology:C7/constructible-limit-descent`, `DiamondEtaleCohomology:C7/constructible-filtration`, `DiamondEtaleCohomology:C7/perfect-constructible`, `DiamondEtaleCohomology:C7/perfect-constructible-over-field`, `DiamondEtaleCohomology:C7/perfect-constructible-filtration`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.12(ii), p. 147. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.12, p. 149. Proof.

Acceptance:

- RΓ_c(B × Spa(C, O_C), Λ) = Λ(−1)[−2] is perfect; R q_!Λ for the non-smooth q : S × X → X (S infinite) is C⁰(S, Λ), not perfect.

Suggested target signatures:

- `IsCohomologicallySmooth.lowerShriek_perfectConstructible`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### Rf^! of a smooth map commutes with arbitrary base change

`DiamondSixOperations:S4/smooth-upper-shriek-base-change` · theorem

Let f : Y′ → Y be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, Λ ℓ-power torsion, and g : Ỹ → Y any map of small v-stacks (ECD writes v-sheaves), with pullbacks f̃, g′. Then the base-change transformation g′^*Rf^! → Rf̃^!g^* (S3/adjunction-calculus) is an equivalence; in particular g′^*D_f ≃ D_{f̃}.

Hypotheses:

- f ℓ-cohomologically smooth; g arbitrary; Λ ℓ-power torsion.

Named declarations: `IsCohomologicallySmooth.upperShriek_baseChange`.

Construction or proof:

1. Over a strictly totally disconnected base τ_f is an equivalence with Rf^!Λ invertible (S4/strictly-local-criteria with S4/strictly-local-criteria-torsion and S4/invertible-object), so for Y = X, Ỹ = X̃ strictly totally disconnected it suffices to show g′^*D_f ≃ D_{f̃}: by condition (iv) of S4/strictly-local-criteria reduce to connected X = Spa(C, O_C), X̃ = Spa(C̃, O_C̃) (using commutation with j_* for quasicompact opens), Y′ spatial.
2. Rf_!Rf^!F_ℓ is constructible, so Hom(Rf_!Rf^!F_ℓ, F_ℓ) = Hom(F_ℓ, F_ℓ) on Y′ is finite and π₀Y′ is finite; assume Y′ connected, so Ỹ′ is connected (C6, ECD 19.5(iii)) and D_f = L[n], D_{f̃} = L̃[ñ] for local systems.
3. The comparison g′^*L[n] → L̃[ñ] is nonzero (via the diagram with RΓ(Y′_ét, F_ℓ) ≅ RΓ(Ỹ′_ét, F_ℓ), C6), forcing ñ ≥ n with equality giving an isomorphism; choose C̃ maximising ñ (bounded by 3 dim.trg f).
4. Over Spa(C, O_C) use a v-hypercover X̃• with X̃₀ = X̃ and hyperdescent D_ét ≃ D_cart,ét (C2, ECD 17.3): Rf_! is termwise Rf̃ᵢ_!, its termwise right adjoints preserve cartesian objects by the case already shown, so they form the right adjoint of the cartesian Rf̃•_!, giving base change along X̃ → X.
5. General Ỹ → Y: cover by disjoint unions of strictly totally disconnected spaces and combine the base changes.

Direct prerequisites: `DiamondSixOperations:S4/strictly-local-criteria`, `DiamondSixOperations:S4/strictly-local-criteria-torsion`, `DiamondSixOperations:S4/invertible-object`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S4/practical-smoothness-criterion`, `DiamondEtaleCohomology:C6/invariance-complete-extension`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.12(iii), p. 147. Statement (printed for v-sheaves Ỹ).

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.12, p. 148. The degree comparison.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.12, p. 149. The hypercover step.

Acceptance:

- For the ball, base change along Spa(C′, O_C′) → Spa(C, O_C) carries Λ(1)[2] to Λ(1)[2].

Suggested target signatures:

- `IsCohomologicallySmooth.upperShriek_baseChange`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### Composites of ℓ-cohomologically smooth maps

`DiamondSixOperations:S4/smooth-composition` · theorem · planet: **Composition and descent of smoothness**

Let g : Y″ → Y′ and f : Y′ → Y be separated morphisms of small v-stacks, ℓ ≠ p. If f and g are representable in locally spatial diamonds and ℓ-cohomologically smooth, then f ∘ g is representable in locally spatial diamonds and ℓ-cohomologically smooth, with D_{f∘g} ≃ D_g ⊗ g^*D_f.

Hypotheses:

- f, g separated, representable in locally spatial diamonds, ℓ-cohomologically smooth.

Named declarations: `IsCohomologicallySmooth.comp`.

Construction or proof:

1. f ∘ g is eligible (S0/eligible-morphism, composition).
2. Over strictly totally disconnected X → Y: R(f∘g)_X^! ≃ Rg^!Rf^! (S3/upper-shriek-composition) ≃ D_g ⊗ g^*(D_f ⊗ f^*) by S4/smooth-twisted-pullback and S4/smooth-upper-shriek-base-change (for g over the non-perfectoid Y′ ×_Y X).

Direct prerequisites: `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-twisted-pullback`, `DiamondSixOperations:S4/smooth-upper-shriek-base-change`, `DiamondSixOperations:S3/upper-shriek-composition`, `DiamondSixOperations:S0/eligible-morphism`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.13, p. 149. Statement, first part.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.13, p. 150. Proof.

Acceptance:

- Bⁿ → * is smooth with D = Λ(n)[2n] as an iterated composite of balls.

Suggested target signatures:

- `IsCohomologicallySmooth.comp`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### Smoothness descends along smooth surjections

`DiamondSixOperations:S4/smooth-descent-along-smooth-surjection` · theorem

Let g : Y″ → Y′ and f : Y′ → Y be separated morphisms of small v-stacks and ℓ ≠ p. If g and f ∘ g are representable in locally spatial diamonds and ℓ-cohomologically smooth, g is surjective, and f is representable in diamonds and compactifiable, then f is representable in locally spatial diamonds and ℓ-cohomologically smooth. The hypotheses that f is representable in diamonds and compactifiable and that g is surjective are part of the statement.

Hypotheses:

- g, f ∘ g representable in locally spatial diamonds and smooth; g surjective; f separated, representable in diamonds and compactifiable.

Named declarations: `IsCohomologicallySmooth.of_comp_of_surjective`.

Construction or proof:

1. Representability of f in locally spatial diamonds: by D5 (ECD 13.4) check after pullback to strictly totally disconnected Y; for quasicompact open V ⊂ Y″ the image U ⊂ Y′ is open (S4/smooth-universally-open) and quasicompact; |U| is the quotient of |V| by an open qcqs equivalence relation, so spectral with |V| → |U| spectral (D0/spectral-quotient-criterion, ECD 2.10), U is spatial (D5/quasi-pro-etale-and-fibre-product-permanence, the converse for universally open covers).
2. locally dim.trg f ≤ dim.trg(f ∘ g) < ∞, using the modified tr.c̃ (C8, DIMTRG).
3. Over strictly totally disconnected Y: Rg^!(Rf^!F_ℓ) = R(f∘g)^!F_ℓ = Rg^!F_ℓ ⊗ g^*Rf^!F_ℓ is invertible and Rg^!F_ℓ is invertible, so g^*Rf^!F_ℓ, hence Rf^!F_ℓ (g surjective), is invertible.
4. τ_f is an equivalence after applying the conservative Rg^! = Rg^!F_ℓ ⊗ g^* (g smooth surjective): Rg^!Rf^! = R(f∘g)^! = Rg^!F_ℓ ⊗ g^*Rf^!F_ℓ ⊗ g^*f^* = Rg^!(Rf^!F_ℓ ⊗ f^*).

Direct prerequisites: `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-universally-open`, `DiamondSixOperations:S4/smooth-twisted-pullback`, `DiamondSixOperations:S3/upper-shriek-composition`, `DiamondsAndVStacks:D5/relative-representability`, `DiamondsAndVStacks:D0/spectral-quotient-criterion`, `DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`, `DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondSixOperations:S0/compactifiable-morphism`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.13, p. 149. Statement, second part.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.13, p. 150. The dimension step.

Acceptance:

- A map whose pullback along a smooth chart is the ball is smooth, provided it is compactifiable and representable in diamonds.

Suggested target signatures:

- `IsCohomologicallySmooth.of_comp_of_surjective`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### Descent of representability along universally open covers

`DiamondSixOperations:S4/representability-descent` · theorem

Let f : Y′ → Y be a separated 0-truncated map of small v-stacks representable in diamonds, and g : Y″ → Y′ a universally open (for example ℓ-cohomologically smooth), separated and surjective map of small v-stacks such that f ∘ g is representable in locally spatial diamonds. Then f is representable in locally spatial diamonds. Moreover, if g is in addition locally split (S0/locally-split-map), the hypothesis that f is compactifiable can be removed from S4/smooth-descent-along-smooth-surjection, by S0/compactifiable-source-descent; without local splitting this is not known, and ℓ-cohomological smoothness of g alone is not used as evidence for it.

Hypotheses:

- f separated, 0-truncated, representable in diamonds; g universally open, separated, surjective; f ∘ g representable in locally spatial diamonds.

Named declarations: `representableInLocallySpatial_of_universallyOpen_cover`, `IsCohomologicallySmooth.of_comp_of_isLocallySplit`.

Construction or proof:

1. The first paragraph of the proof of S4/smooth-descent-along-smooth-surjection uses only universal openness of g: images of quasicompact opens are quasicompact opens with spectral underlying space (D0/spectral-quotient-criterion), so f is representable in locally spatial diamonds (D5).
2. For the second statement: when g is locally split, S0/compactifiable-source-descent applied to f and g gives f compactifiable (f is separated and now representable in locally spatial diamonds, and f ∘ g is compactifiable as it is smooth).

Direct prerequisites: `DiamondSixOperations:S4/smooth-universally-open`, `DiamondSixOperations:S0/compactifiable-source-descent`, `DiamondSixOperations:S0/locally-split-map`, `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`, `DiamondsAndVStacks:D5/relative-representability`, `DiamondsAndVStacks:D0/spectral-quotient-criterion`, `DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Remark 23.14, p. 149. Conclusion (the full hypotheses are given in the statement).

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Remark after 23.14, p. 150. The open question; the locally split case is the theorem here.

Acceptance:

- A separated étale surjection g is locally split, so smoothness of f can be tested along it without assuming compactifiability.

Suggested target signatures:

- `representableInLocallySpatial_of_universallyOpen_cover`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.
- `IsCohomologicallySmooth.of_comp_of_isLocallySplit`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### ℓ-cohomological smoothness is stable under base change

`DiamondSixOperations:S4/smooth-stable-under-base-change` · theorem

Let f : Y′ → Y be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, and g : Ỹ → Y any map of small v-stacks with pullback f̃. Then f̃ is ℓ-cohomologically smooth.

Hypotheses:

- f smooth; g arbitrary.

Named declarations: `IsCohomologicallySmooth.baseChange`.

Construction or proof:

1. Compactifiability, representability and locally finite dim.trg are stable under base change (S0/eligible-morphism); the condition over strictly totally disconnected X → Ỹ is the condition for X → Ỹ → Y.

Direct prerequisites: `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S0/eligible-morphism`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.15, p. 150. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.15, p. 150. Proof.

Acceptance:

- B × X → X is smooth for every X, by base change of B → *.

Suggested target signatures:

- `IsCohomologicallySmooth.baseChange`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### ℓ-cohomological smoothness is v-local on the target, with dim.trg finiteness retained

`DiamondSixOperations:S4/smooth-v-local-on-target` · theorem

Let f : Y′ → Y be separated and representable in locally spatial diamonds, g : Ỹ → Y a surjective map of small v-stacks with pullback f̃. If f̃ is ℓ-cohomologically smooth and locally dim.trg f < ∞, then f is ℓ-cohomologically smooth. Local finiteness of dim.trg f is a hypothesis on f itself; ECD does not show that it can be checked v-locally.

Hypotheses:

- f separated, representable in locally spatial diamonds, locally dim.trg f < ∞ (hypothesis on f); g surjective.

Named declarations: `IsCohomologicallySmooth.of_baseChange_of_surjective`.

Construction or proof:

1. f is compactifiable by S0/compactifiable-v-local; so f is eligible with the given dimension hypothesis.
2. Reduce to Y = X, Ỹ = X̃ strictly totally disconnected; then the simplicial v-hypercover argument of S4/smooth-upper-shriek-base-change with X̃₀ = X̃ identifies Rf^! with the descended twisted pullback.

Direct prerequisites: `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S0/compactifiable-v-local`, `DiamondSixOperations:S4/smooth-upper-shriek-base-change`, `DiamondSixOperations:S4/smooth-twisted-pullback`, `DiamondEtaleCohomology:C8/locally-finite-dim-trg`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.15, p. 150. Statement, converse.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.15, p. 150. Why the dimension hypothesis is retained.

Acceptance:

- Smoothness of (Spa ℚ_p)^♢ → * is deduced from its pullback to Spa(C, O_C) (S5/spd-qp-smooth), dim.trg being finite there directly.

Suggested target signatures:

- `IsCohomologicallySmooth.of_baseChange_of_surjective`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### Smooth base change

`DiamondSixOperations:S4/smooth-base-change` · theorem · planet: **Smooth base change**

Let Y′ →g̃ Y, f′ : Y′ → X′, f : Y → X, g : X′ → X be a cartesian square of small v-stacks, nΛ = 0 with n prime to p, g separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, and Λ ℓ-power torsion. Then for every A ∈ D_ét(Y, Λ) the base-change morphism g^*Rf_*A → Rf′_*g̃^*A is an isomorphism; f is arbitrary.

Hypotheses:

- g smooth; f arbitrary; Λ ℓ-power torsion.

Named declarations: `IsCohomologicallySmooth.pushforward_baseChange`.

Construction or proof:

1. S3/upper-shriek-pushforward-exchange (23.16(i)): Rg^!Rf_* ≅ Rf′_*Rg̃^!.
2. S4/smooth-twisted-pullback: Rg^! = D_g ⊗ g^*, Rg̃^! = D_{g̃} ⊗ g̃^* with D_{g̃} = f′^*D_g (S4/smooth-upper-shriek-base-change).
3. So D_g ⊗ g^*Rf_*A ≅ Rf′_*(f′^*D_g ⊗ g̃^*A) = D_g ⊗ Rf′_*g̃^*A (projection formula for an invertible object, C3); cancel the invertible D_g.

Direct prerequisites: `DiamondSixOperations:S3/upper-shriek-pushforward-exchange`, `DiamondSixOperations:S4/smooth-twisted-pullback`, `DiamondSixOperations:S4/smooth-upper-shriek-base-change`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.16(ii), p. 151. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.16, p. 151. Proof.

Acceptance:

- For g the ball over X: RΓ(B × Y, A) computed fibrewise; for g the profinite projection (not smooth) only quasicompact base change C3 applies.

Suggested target signatures:

- `IsCohomologicallySmooth.pushforward_baseChange`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### Rf^! commutes with smooth pullback

`DiamondSixOperations:S4/smooth-upper-shriek-exchange` · theorem

In the cartesian square of S4/smooth-base-change, assume g separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, Λ ℓ-power torsion, and in addition f compactifiable and representable in locally spatial diamonds with locally dim.trg f < ∞, so that Rf^! and Rf′^! are defined (the hypothesis on f is missing in print, PAPER-SCHOLZE-17/E66). Then for A ∈ D_ét(X, Λ) the map g̃^*Rf^!A → Rf′^!g^*A, adjoint to Rf^!A → Rf^!Rg_*g^*A = Rg̃_*Rf′^!g^*A, is an equivalence.

Hypotheses:

- g smooth; f eligible (added hypothesis); Λ ℓ-power torsion.

Named declarations: `IsCohomologicallySmooth.upperShriek_exchange`.

Construction or proof:

1. f′ is eligible by base change (S0/eligible-morphism) and Rf^!Rg_* ≅ Rg̃_*Rf′^! by S3/upper-shriek-pushforward-exchange for the eligible f.
2. Tensor with the invertible Rg̃^!Λ: g̃^*Rf^!A ⊗ Rg̃^!Λ = Rg̃^!Rf^!A = Rf′^!Rg^!A = Rf′^!(g^*A ⊗ Rg^!Λ) (S3/upper-shriek-composition, S4/smooth-twisted-pullback).
3. Rf′^!(g^*A ⊗ Rg^!Λ) = Rf′^!g^*A ⊗ f′^*Rg^!Λ (Rg^!Λ invertible) and f′^*Rg^!Λ = Rg̃^!Λ (S4/smooth-upper-shriek-base-change); the printed F_ℓ in these formulas should be Λ (PAPER-SCHOLZE-17/E67).

Direct prerequisites: `DiamondSixOperations:S3/upper-shriek-pushforward-exchange`, `DiamondSixOperations:S4/smooth-twisted-pullback`, `DiamondSixOperations:S4/smooth-upper-shriek-base-change`, `DiamondSixOperations:S3/upper-shriek-composition`, `DiamondSixOperations:S0/eligible-morphism`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.16(iii), p. 151. Printed hypotheses (f's hypotheses are added).

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.16, p. 151. Proof route.

Acceptance:

- ECD 24.6's proof applies this to g : X̃ → X an open subset of a ball over X.

Suggested target signatures:

- `IsCohomologicallySmooth.upperShriek_exchange`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### Smooth pullback commutes with internal Hom

`DiamondSixOperations:S4/smooth-pullback-internal-hom` · theorem

Let f : Y → X be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, and Λ ℓ-power torsion (the coefficient hypothesis is missing in print, PAPER-SCHOLZE-17/E68). There is a functorial isomorphism f^*RHom(A, B) ≅ RHom(f^*A, f^*B) for A, B ∈ D_ét(X, Λ).

Hypotheses:

- f smooth; Λ ℓ-power torsion (added).

Named declarations: `IsCohomologicallySmooth.pullback_internalHom`.

Construction or proof:

1. S3/upper-shriek-internal-hom: Rf^!RHom(A, B) ≅ RHom(f^*A, Rf^!B).
2. Rf^! = f^* ⊗ D_f with D_f invertible (S4/smooth-twisted-pullback); cancel D_f on both sides.

Direct prerequisites: `DiamondSixOperations:S3/upper-shriek-internal-hom`, `DiamondSixOperations:S4/smooth-twisted-pullback`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 23.17, p. 151. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.17, p. 151. Proof.

Acceptance:

- Used in ECD 25.1's proof to transport biduality along the smooth surjection Y → X.

Suggested target signatures:

- `IsCohomologicallySmooth.pullback_internalHom`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

### Separated étale maps and open immersions are ℓ-cohomologically smooth

`DiamondSixOperations:S4/etale-maps-smooth` · theorem

Every separated étale map f : Y′ → Y of small v-stacks is ℓ-cohomologically smooth for every ℓ ≠ p, with Rf^! ≃ f^* and D_f ≃ Λ; in particular open immersions are.

Hypotheses:

- f separated étale.

Named declarations: `IsCohomologicallySmooth.of_separated_etale`.

Construction or proof:

1. f is eligible (S0/eligible-morphism).
2. Rf^! ≃ f^* (S3/upper-shriek-etale), so the definition holds with D = Λ, which is invertible.

Direct prerequisites: `DiamondSixOperations:S0/eligible-morphism`, `DiamondSixOperations:S3/upper-shriek-etale`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/invertible-object`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Theorem 25.1, p. 160. Open immersions are used as smooth maps.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 23.4, p. 143. Rg^! = g^* for étale g.

Acceptance:

- Open subsets of the ball are smooth over *, by composition with S5/ball-smooth.

Suggested target signatures:

- `IsCohomologicallySmooth.of_separated_etale`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.

## S5. Examples: the ball, quotients and analytic smooth maps

Stage `DiamondSixOperations:S5`: **planned**.

Remaining acceptance inputs:

- H3’s higher-rank/all-G proof obligations remain inherited, despite the now-read cleared Hub96 statements. H3’s exact new contracts replace a blanket rank-one supplier assumption.
- Supply the D4 nonfree image-relation quotient and its proper/quasi-pro-etale/eligibility properties.
- Express the actual ball/O⁺, roots-of-unity twist, Spd Q_p, full continuous action and all ball-open test family on geometric carriers. Haar and finite averaging computations already use faithful algebraic carriers and concrete tests.

### The absolute perfectoid ball B

`DiamondSixOperations:S5/perfectoid-ball` · definition · planet: **Absolute perfectoid ball B**

B is the v-sheaf on Perf (characteristic-p perfectoid spaces) with B(R, R⁺) = R⁺ for affinoid perfectoid Spa(R, R⁺), extended by gluing; f : B → * is its structure map, * = Spd F_p the final v-sheaf. For an affinoid perfectoid X = Spa(R, R⁺), B × X = Spa(R⟨T^{1/p^∞}⟩, R⁺⟨T^{1/p^∞}⟩), the perfectoid closed unit ball over X; for X perfectoid it is the diamond of the relative closed unit ball B_X of AdicEtaleGeometry A2 (its perfection). B is not the ordinary analytic unit disc over a mixed-characteristic base; the comparison with B_Y^♢ for analytic Y over ℤ_p goes through S5/analytic-smooth-is-cohomologically-smooth. B → * is separated and compactifiable: its canonical compactification is R ↦ R°, into which B is the open subfunctor {|T| ≤ 1}; it is representable in spatial diamonds with dim.trg 1.

Hypotheses:

- Perf is the site of characteristic-p perfectoid spaces of D2; the coordinate T ∈ O⁺(B).

Named declarations: `Ball`.

Construction or proof:

1. Define B(R, R⁺) = R⁺; it is a v-sheaf because O⁺ is (D2/v-descent-of-functions).
2. Over X = Spa(R, R⁺), B × X represents T ↦ (map to X, element of O⁺), which is Spa(R⟨T^{1/p^∞}⟩, R⁺⟨T^{1/p^∞}⟩) (characteristic p: p-th roots of T exist uniquely), compatible with A2's B_X after perfection (D6/gluing-and-the-diamond-functor).
3. Canonical compactification over *: B‾(R, R⁺) = B(R, R°) = R° (C4, ECD 18.6); B → B‾ pulls back along t ∈ R° to the rational subset {|t| ≤ 1} of Spa(R, R⁺), an open immersion, so B → * is compactifiable (S0/compactifiable-iff-separated-open).
4. dim.trg(B × X → X) = 1: completed residue fields of points of the perfectoid ball have modified topological transcendence degree ≤ 1 over the base (C8/analytic-dim-trg via the ball's diamond).

Direct prerequisites: `DiamondsAndVStacks:D2/v-descent-of-functions`, `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`, `AdicEtaleGeometry:A2/relative-closed-polydisc`, `DiamondSixOperations:S0/compactifiable-iff-separated-open`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`, `DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondEtaleCohomology:C8/analytic-dim-trg`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Theorem 24.1, p. 152. The definition of B.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Theorem 24.1, p. 152. dim.trg f = 1.

Uses:

- ECD Theorem 24.1: the basic example of an ℓ-cohomologically smooth map
- ECD Propositions 24.4–24.6: smooth analytic maps, Spd ℚ_p and the geometric-base criterion reduce to the ball
- ECD Theorem 25.1 (proof): the auxiliary space {f − T = 0} ⊂ X × B_C is smooth over X
- VStackSheavesAndLisseCategories:VS4 (FS V.2.1): contractibility of Banach–Colmez torsors reduces to the cohomology of the perfectoid open unit ball
- VectorBundlesAndIsocrystals:VB3: positive Banach–Colmez spaces are presented by perfectoid balls

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `Ball.app` | characterisation | Maps X → B from an affinoid perfectoid X = Spa(R, R⁺) are the elements of R⁺. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `Ball.prod_affinoid` | compatibility | B × Spa(R, R⁺) ≅ Spa(R⟨T^{1/p^∞}⟩, R⁺⟨T^{1/p^∞}⟩), the perfectoid closed unit ball. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `Ball.diamond_relativeBall` | compatibility | For a perfectoid space X, B × X ≅ (B_X)^♢ with B_X AdicEtaleGeometry A2's relative closed unit ball. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `Ball.isCompactifiable` | structure | B → * is compactifiable, with canonical compactification R ↦ R° and B ⊂ B‾ the open {\|T\| ≤ 1}. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `Ball.isSpatialEligible` | structure | B → * is spatial-eligible with dim.trg 1. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `Ball.coordinate` | data | The coordinate T ∈ O⁺(B)(B), universal element. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `Ball.openDisc` | other | For a complete algebraically closed perfectoid C of characteristic p, let K = F_p((t^{1/p^∞}))^∧. The punctured open unit disc D_C^× is Spa(K, O_K) × Spa(C, O_C), and is an open subspace of B × Spa(C, O_C) (ECD proof of 24.5). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `Ball.point_C` | computation | B(Spa(C, C⁺)) = C⁺ for a perfectoid field C. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `Ball.compactification_ne` | non-example | B → * is not partially proper: the canonical compactification B‾(R, R⁺) = R° differs from B(R, R⁺) = R⁺ whenever R⁺ ≠ R°. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `Ball.dimTrg` | computation | dim.trg(B → *) = 1. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `Ball.prod_point` | degenerate | B × Spa(C, O_C) is the perfectoid closed unit disc Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩) over C. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Acceptance:

- B × Spa(C, O_C) = Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩); B(Spa(C, C⁺)) = C⁺ ≠ B‾(Spa(C, C⁺)) = O_C.

Suggested target signatures:

- `Ball`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.

### Tate twists Λ(d) on small v-stacks

`DiamondSixOperations:S5/tate-twist` · definition

Let n be prime to p and Λ a ring with nΛ = 0. μ_n is the étale sheaf on * = Spd F_p of n-th roots of unity, μ_n(R, R⁺) = {x ∈ R : xⁿ = 1}; it is finite étale over * (n invertible). Λ(1) := Λ ⊗_{ℤ/n} μ_n, Λ(d) := Λ(1)^{⊗d} for d ≥ 0 and Λ(−d) := RHom(Λ(d), Λ); for a small v-stack Y, Λ_Y(d) is the pullback to Y. Λ(d) is invertible and étale locally ≅ Λ; over Spa(C, C⁺) a choice of compatible roots of unity trivialises it. The definition is independent of n with nΛ = 0. It agrees with the classical Λ ⊗ μ_n on analytic adic spaces used in ClassicalAdicEtaleCohomology H3.

Hypotheses:

- n prime to p, nΛ = 0.

Named declarations: `tateTwist`.

Construction or proof:

1. μ_n is represented by the finite étale cover of * attached to the finite étale F_p-algebra F_p[x]/(xⁿ − 1) (n invertible); it is an étale sheaf (D3), split over every algebraically closed perfectoid field.
2. Λ(1) is locally ≅ Λ (choose a primitive n-th root of unity étale locally), hence invertible in the sense of S4/invertible-object.
3. For m | n, μ_m = μ_n[m] and Λ ⊗_{ℤ/m} μ_m ≅ Λ ⊗_{ℤ/n} μ_n when mΛ = 0, so the twist does not depend on n.
4. Under D6's equivalence of étale sites (D6/etale-site-comparison) it is the classical Λ(1) of H3.

Direct prerequisites: `DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`, `DiamondsAndVStacks:D6/etale-site-comparison`, `DiamondSixOperations:S4/invertible-object`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `DiamondEtaleCohomology:C3/change-of-coefficients`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Theorem 24.1, p. 152. The normalisation Λ(1)[2] of the ball's dualizing complex uses this twist.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Theorem 24.1, p. 152. The twisted trace.

Uses:

- ECD Theorem 24.1: D_f ≅ Λ(1)[2] for the ball
- ClassicalAdicEtaleCohomology:H3/curve-trace: Huber's trace R²f_!μ_n → ℤ/n is twisted by μ_n
- ECD Theorem 25.1 (proof): Poincaré duality on a smooth curve pairs RΓ_c(U, Λ(1)[2]) with RΓ(U, Λ)

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `tateTwist_zero` | simp | Λ(0) = Λ. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `tateTwist_add` | relation | Λ(a) ⊗ Λ(b) ≅ Λ(a + b) for a, b ∈ ℤ. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `tateTwist_isInvertible` | structure | Λ(d) is invertible, étale locally ≅ Λ. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `tateTwist_pullback` | functoriality | f^*Λ_Y(d) ≅ Λ_{Y′}(d) for every map f : Y′ → Y. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `tateTwist_trivialise` | other | Over Spa(C, C⁺) with C algebraically closed, a compatible system of primitive roots of unity gives Λ(d) ≅ Λ. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `tateTwist_classical` | compatibility | For an analytic adic space Y over ℤ_p, Λ_{Y^♢}(1) corresponds to Huber's Λ ⊗ μ_n under D6's étale-site equivalence. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `tateTwist_zero_test` | degenerate | Λ(0) ≅ Λ. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `tateTwist_point` | computation | Over Spa(C, O_C) with C algebraically closed, H⁰(Spa(C, O_C), Λ(1)) ≅ Λ, non-canonically. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `tateTwist_not_const_Qp` | non-example | Over (Spa ℚ_p)^♢ with ℓ odd and μ_ℓ ⊄ ℚ_p (p ≢ 1 mod ℓ), F_ℓ(1) is not isomorphic to F_ℓ: Gal(ℚ̄_p/ℚ_p) acts on μ_ℓ through a nontrivial character, so H⁰((Spa ℚ_p)^♢, F_ℓ(1)) = 0. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Acceptance:

- Over Spa(C, O_C), Λ(1) ≅ Λ after choosing ζ_n ∈ C; Galois acts on μ_n by the cyclotomic character over Spa ℚ_p^♢.

Suggested target signatures:

- `tateTwist`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.

### The ball is ℓ-cohomologically smooth with dualizing complex Λ(1)[2]

`DiamondSixOperations:S5/ball-smooth` · theorem · planet: **Cohomological smoothness of the ball**

The structure map f : B → * of the absolute perfectoid ball (S5/perfectoid-ball) is ℓ-cohomologically smooth for every prime ℓ ≠ p, and for every ring Λ with nΛ = 0 (n prime to p) there is a canonical isomorphism D_f = Rf^!Λ ≅ Λ(1)[2], adjoint to the trace Rf_!Λ(1) → Λ[−2] obtained from Huber's trace by base change. This concerns the absolute perfectoid ball; ordinary analytic discs over a mixed-characteristic base are S5/analytic-smooth-is-cohomologically-smooth.

Hypotheses:

- ℓ ≠ p; Λ with nΛ = 0, n prime to p (for the isomorphism, decompose Λ into ℓ-primary parts).
- The exact H3 unbounded-open-coefficient-curve-duality and plus-ring-top-trace-constancy contracts are imported with their inherited proof gaps. The maintainer-cleared Hub96 Theorems 7.2.2 and 7.5.3 and Lemma 7.5.4 have now been read at the needed arbitrary-plus-ring scope; this supplies source evidence, not completion of the separate H3 plan.

Named declarations: `Ball.isCohomologicallySmooth`, `Ball.dualizingComplex_iso`.

Construction or proof:

1. Check S4/practical-smoothness-criterion. (i) dim.trg f = 1.
2. (ii) Constructibility: for X strictly totally disconnected and F constructible on B × X, choose X → Spa(K, O_K), K = F_p((ϖ^{1/p^∞}))^∧, factoring through Spa(C, O_C) (C the completed algebraic closure, X has no nonsplit finite étale covers); write X = lim Xᵢ with Xᵢ of topologically finite type and descend F to Fᵢ (C7, ECD 20.7); R^j f_{X!}F = g^*R^j f_{Xᵢ!}Fᵢ by S2/lower-shriek-base-change and the classical comparison, constructible by H4/perfectoid-base-constructibility-transfer (Hub96 6.2.2).
3. (iii) For X = Spa(C, C⁺), use H3/unbounded-open-coefficient-curve-duality: for every G in unbounded D of the curve, the trace identifies RHom(G,j′_!F_ℓ(1)[2]) with RHom(Rf_!G,j_!F_ℓ). The already independently constructed exceptional adjunction then gives the specified open-extension mate by Yoneda. Restricting G to j′_!G_U would not suffice. Hub96 Theorem 7.5.3 and Lemma 7.5.4, pp. 390–395, give the natural classical trace map at arbitrary C⁺; H3 retains its proof obligations.
4. (iv) Huber's trace Rf_{C!}F_ℓ(1) → F_ℓ[−2] (H3/curve-trace, H3/relative-ball-compact-support, with R^i f_{C!} = 0 for i > 2 by H3/lower-shriek-cohomological-dimension) pulls back to X; adjunction gives α : F_ℓ(1)[2] → Rf_X^!F_ℓ. By (iii) and S4/strictly-local-criteria, Rf_X^!F_ℓ commutes with quasi-pro-étale base change, so α can be checked on connected components Spa(C, C⁺), where it is Hub96 7.5.3 (H3/unbounded-open-coefficient-curve-duality and plus-ring-top-trace-constancy).
5. Canonicity: α is adjoint to the base-changed trace, independent of choices; for general Λ, use S4/smooth-twisted-pullback and the ℓ-primary decomposition.

Direct prerequisites: `DiamondSixOperations:S5/perfectoid-ball`, `DiamondSixOperations:S5/tate-twist`, `DiamondSixOperations:S4/practical-smoothness-criterion`, `DiamondSixOperations:S4/strictly-local-criteria`, `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondSixOperations:S4/smooth-twisted-pullback`, `ClassicalAdicEtaleCohomology:H4/perfectoid-base-constructibility-transfer`, `ClassicalAdicEtaleCohomology:H3/duality-open-extension-compatibility`, `ClassicalAdicEtaleCohomology:H3/curve-poincare-duality`, `ClassicalAdicEtaleCohomology:H3/curve-trace`, `ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension`, `ClassicalAdicEtaleCohomology:H3/curve-trace-base-change`, `DiamondEtaleCohomology:C7/constructible-sheaf`, `DiamondEtaleCohomology:C7/constructible-limit-descent`, `DiamondEtaleCohomology:C7/constructible-filtration`, `DiamondEtaleCohomology:C7/perfect-constructible`, `DiamondEtaleCohomology:C7/perfect-constructible-over-field`, `DiamondEtaleCohomology:C7/perfect-constructible-filtration`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `ClassicalAdicEtaleCohomology:H3/unbounded-open-coefficient-curve-duality`, `ClassicalAdicEtaleCohomology:H3/general-analytic-smooth-trace`, `ClassicalAdicEtaleCohomology:H3/plus-ring-top-trace-constancy`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Theorem 24.1, p. 152. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Theorem 24.1, p. 152. Condition (iii).

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Theorem 24.1, p. 153. Condition (iv).

Source: [Hub96](https://link.springer.com/book/10.1007/978-3-663-09991-8), Theorems 7.2.2 and 7.5.3; Lemma 7.5.4, pp. 368, 390–395. The trace isomorphism and its natural duality map have arbitrary analytic bases and plus rings. The coefficients are bounded below in 7.5.3 but the first argument is unrestricted, which is the scope needed for the all-G open-coefficient mate.

Acceptance:

- R²f_!Λ(1) ≅ Λ on B × Spa(C, O_C); the ball over any strictly totally disconnected X has D ≅ Λ(1)[2].

Suggested target signatures:

- `Ball.isCohomologicallySmooth`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.
- `Ball.dualizingComplex_iso`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.

### The normalised Λ-valued Haar measure of a profinite group of pro-order prime to ℓ

`DiamondSixOperations:S5/normalized-haar-measure` · construction

Let K be a profinite group whose supernatural order profiniteOrder K is prime to ℓ (Tau Ceti ProfiniteProPGroups, Layer 1), and Λ an ℓ-power-torsion ring. The normalised Λ-valued Haar measure is the Λ-linear map μ_K : C⁰(K, Λ) → Λ with μ_K(1_{gH}) = [K : H]^{−1} for every open subgroup H and g ∈ K; it is well defined because every [K : H] divides profiniteOrder K (Lagrange) and is therefore a unit in Λ, and it is left and right invariant with total volume μ_K(1) = 1. If Λ ≠ 0 and K has an open subgroup of index divisible by ℓ (in particular if its pro-order is divisible by ℓ), no such measure exists: [K : H] is then divisible by ℓ for some H and cannot be inverted, so prime-to-ℓ averaging is unavailable.

Hypotheses:

- profiniteOrder K prime to ℓ; ℓ^mΛ = 0.

Named declarations: `normalizedHaar`.

Construction or proof:

1. A locally constant function is constant on cosets of some open normal H; set μ_K(φ) = [K : H]^{−1} Σ_{gH ∈ K/H} φ(g).
2. Independence of H: for H′ ⊂ H open normal, [K : H′] = [K : H][H : H′] and each H-coset is a union of [H : H′] H′-cosets.
3. [K : H] = profiniteIndex H K divides profiniteOrder K (Lagrange, ProfiniteProPGroups Layer 1, agreement with Subgroup.index), so it is prime to ℓ and invertible in Λ.
4. Invariance under left and right translation is invariance of the finite averages.

Direct prerequisites: `tauceti:TauCeti.profiniteOrder`, `tauceti:Subgroup.profiniteIndex`, `tauceti:Subgroup.profiniteOrder_eq_mul_profiniteIndex`, `tauceti:OpenSubgroup.profiniteIndex_eq_ofNat_index`, `mathlib:Subgroup.index`, `mathlib:LocallyConstant`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 24.2, p. 153. The measure and its normalisation.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 24.2, p. 153. Normalised finite-level traces.

Uses:

- ECD Proposition 24.2 (proof): the trace q_*q^* → id is the colimit of the normalised finite-level traces, defining q^* → Rq^!
- ECD Proposition 24.3 (proof): integration over the K-action gives q_*Λ → Λ
- tauceti:TauCetiRoadmap/ProfiniteProPGroups Layer 1: Lagrange for the supernatural order gives invertibility of every open index

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `normalizedHaar_indicator` | simp | μ_K(1_{gH}) = [K : H]^{−1} for H open. | typed-relative: Actual coset indicator volume times index equals one. |
| `normalizedHaar_one` | simp | μ_K(1) = 1. | typed-relative: Actual normalized total mass. |
| `normalizedHaar_translate` | relation | μ_K(φ(k · −)) = μ_K(φ) = μ_K(φ(− · k)) for k ∈ K. | typed-relative: Actual left translations; normalizedHaar_translate_right gives the right translations. |
| `normalizedHaar_index_isUnit` | other | For H ⊂ K open, the image of [K : H] in Λ is a unit. | typed-relative: Coprime index and ell-power annihilation imply the index is a unit; pro-order-to-coprimality uses the cited pinned Lagrange theorem. |
| `normalizedHaar_pushforward` | functoriality | For a surjection K → K/N with N closed normal, μ_K restricted to functions pulled back from K/N is μ_{K/N}. | typed-relative: Actual continuous surjective group homomorphism and composition of locally constant functions. |
| `normalizedHaar_finite` | compatibility | For K finite of order prime to ℓ, μ_K(φ) = \|K\|^{−1} Σ_{k∈K} φ(k). | typed-relative: Actual finite group average expressed as volume times cardinal equals the sum. |
| `normalizedHaar_unique` | extensionality | Any Λ-linear functional ν on C⁰(K,Λ) invariant under left translations with ν(1)=1 equals μ_K. Finite coset averages determine all locally constant functions. | typed-relative: Actual invariant normalized linear functional; no conclusion is assumed. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `normalizedHaar_trivial` | degenerate | For K trivial, μ_K(φ) = φ(1). | specialization: Actual subsingleton group evaluation. |
| `normalizedHaar_Zp` | computation | For K = ℤ_p, ℓ ≠ p and Λ = F_ℓ: μ(1_{p^kℤ_p}) = p^{−k} mod ℓ. | specialization: Actual multiplicative copy of additive Z_2 and F_5: volume of 2^n Z_2 times 2^n equals one. |
| `normalizedHaar_finite_cyclic` | computation | For K = ℤ/m with ℓ ∤ m: μ(1_{0}) = m^{−1}. | specialization: Actual multiplicative copy of additive Z/2 and F_5: volume of the identity equals three. |
| `not_exists_normalizedHaar_proEll` | non-example | For K = ℤ_ℓ and Λ = F_ℓ there is no Λ-linear invariant μ with μ(1) = 1: invariance forces μ(1_{ℓℤ_ℓ}) · ℓ = 1 in F_ℓ, which is impossible; pro-ℓ quotients cannot use prime-to-ℓ averaging. | specialization: Actual Z_5/F_5 invariant normalized functional is impossible; also a finite Z/ell quotient obstruction is stated. |

Acceptance:

- For K = ℤ_p and ℓ ≠ p, μ(1_{a+p^kℤ_p}) = p^{−k} ∈ Λ; for K = ℤ_ℓ and Λ ≠ 0 no normalised measure exists. The trivial pro-ℓ group is outside this obstruction.

Suggested target signatures:

- `normalizedHaar`: typed-relative. Actual compact Hausdorff totally disconnected topological group, discrete commutative coefficient ring and unit open indices. The source prime-to-ell assumption supplies these indices by the cited pinned Lagrange theorem.

Actual input required: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.

### The averaging transformation q^* → Rq^! for profinite quotients

`DiamondSixOperations:S5/averaging-transformation` · construction

Let f : Y′ → Y be eligible (hence separated and representable in locally spatial diamonds), K a profinite group of pro-order prime to ℓ acting on Y′ over Y such that K × Y′ → Y′ ×_Y Y′ is 0-truncated and qcqs (in particular for free actions, where it is an injection), q : Y′ → Y′/K the quotient by the image relation, and Λ ℓ-power torsion. Using the normalised Haar measure (S5/normalized-haar-measure), construct a natural transformation α_q : q^* → Rq^! of functors D_ét(Y′/K, Λ) → D_ét(Y′, Λ), adjoint to a trace Rq_!q^* = Rq_*q^* = q_*q^* → id. For free actions the trace is the colimit over open H ⊂ K of the normalised finite-level traces [K : H]^{−1}tr_{H,K} : q_{H,K*}q_{H,K}^* → id for q_{H,K} : Y′/H → Y′/K; in general it is induced by Rq^!Λ ⊗ q^* → Rq^! and the map Λ → Rq^!Λ adjoint to the integration q_*Λ → Λ over the K-action. The construction uses the quotient-geometric input that q is proper and quasi-pro-étale (for nonfree actions, the precise supplier extension is recorded as a request and gap), so Rq_! = Rq_* = q_* is exact (C8/qpetale-direct-image).

Hypotheses:

- f eligible; K pro-order prime to ℓ; action 0-truncated and qcqs over Y; Λ ℓ-power torsion.
- The image-relation quotient exists and q is proper and quasi-pro-étale; nonfree quotient geometry is a recorded supplier gap. The normalized trace construction itself does not require f cohomologically smooth; that is required by S5/free-quotient-smooth and S5/nonfree-quotient-smooth.

Named declarations: `averagingTransformation`.

Construction or proof:

1. In the free case, q is the profinite torsor described by D3/locally-profinite-torsors, reduced to perfectoid atlases via D4; its finite-level quotient maps are finite étale. In the nonfree case they need not be étale: use the separately requested image-relation quotient geometry to obtain q proper and quasi-pro-étale, not the torsor argument. Thus Rq_! = Rq_* (S1/factorisation-independence) and Rq_* = q_* has cohomological dimension 0 (C8/qpetale-direct-image).
2. Free case: q_*q^* = colim_H q_{H,K*}q_{H,K}^* (continuity, C0), and the normalised traces are compatible in H (S5/normalized-haar-measure); their colimit is the trace q_*q^* → id.
3. General case: integration over the K-action defines q_*Λ → Λ v-locally on the quotient and descends. Fibres are K-orbits (with stabilizers allowed), not necessarily products with K. Compose the induced Λ → Rq^!Λ with τ_q (S3/adjunction-calculus).
4. Adjunction (S3/upper-shriek) gives α_q.

Direct prerequisites: `DiamondSixOperations:S5/normalized-haar-measure`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S1/factorisation-independence`, `DiamondEtaleCohomology:C8/qpetale-direct-image`, `DiamondsAndVStacks:D3/locally-profinite-torsors`, `DiamondEtaleCohomology:C0/std-etale-acyclic`, `DiamondEtaleCohomology:C0/unbounded-comparison-std`, `DiamondEtaleCohomology:C2/etale-test-on-one-cover`, `DiamondSixOperations:S0/eligible-morphism`, `DiamondsAndVStacks:D4`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 24.2, p. 153. The free-action construction.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 24.3, p. 155. The nonfree construction.

Uses:

- ECD Proposition 24.2: q^*R(f/K)^! → Rq^!R(f/K)^! = Rf^! is shown to be an equivalence
- ECD Proposition 24.3: q^*R(f/K)^! ≃ Rf^! in the nonfree case and the direct-summand argument for constructibility
- VectorBundlesAndIsocrystals:VB3, BunGAndNewtonStrata:BG3: quotients of smooth spaces by profinite groups of pro-order prime to ℓ (e.g. [*/G_b(E)] charts)

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `averagingTransformation_trace` | characterisation | α_q is adjoint to the normalised trace q_*q^* → id. | specialization: A normalized finite sum of a constant equals that constant; requires the finite cardinal to be a unit, not an arbitrary eligible map. |
| `averagingTransformation_finite` | compatibility | For a free action of a finite K of order m prime to ℓ, identify Rq^! ≃ q^* by S3/upper-shriek-etale. Then α_q is multiplication by m^{−1} on q^*, not the canonical identification itself; its adjoint normalized trace is m^{−1} times the sum over the fibre. | specialization: The actual finite-fibre natural transformation has m inverse components, rather than identity. |
| `averagingTransformation_comp_unit` | relation | The composite F → q_*q^*F → F (unit then trace) is the identity, so R(f/K)_!F is a direct summand of Rf_!q^*F. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `averagingTransformation_baseChange` | functoriality | α_q is compatible with base change along Ỹ → Y. | specialization: Normalized finite sums are unchanged under the displayed equivalence of finite indexing fibres. |
| `averagingTransformation_restrict_subgroup` | relation | For a free action and an open H ⊂ K, the normalized trace for q : Y′ → Y′/K is the composite of the normalized traces for q_H : Y′ → Y′/H and q_{H,K} : Y′/H → Y′/K. Taking mates gives α_q as q_H^*α_{q_{H,K}} followed by α_{q_H} evaluated at Rq_{H,K}^!; the finite factor [K : H]^{−1} is already in α_{q_{H,K}} and is not applied a second time. | specialization: Finite coset/subgroup Fubini model: the product cardinal is inverted exactly once, with its two factors once each. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `averagingTransformation_trivial_group` | degenerate | For K trivial, α_q is the identity of id^* = id^!. | specialization: Actual singleton finite-fibre normalization. |
| `averagingTransformation_finite_free` | computation | For K = ℤ/m (ℓ ∤ m) acting freely, under Rq^! ≃ q^*, α_q is multiplication by m^{−1}; the trace q_*q^*Λ → Λ is m^{−1} times the sum over the fibre. The trace composed with the unit is the identity. Take, for example, Λ = F_5 and m = 2 to distinguish α_q from the canonical identification. | specialization: Actual Fin 2/F_5 mean of one indicator equals three, mean of one equals one and three differs from one. |
| `averagingTransformation_not_iso_profinite` | non-example | Take K = ℤ_r for a prime r ≠ ℓ, Λ = F_ℓ and nonempty X = Spa(C, O_C). For the free translation action on Y′ = K × X over X, q : Y′ → X is proper quasi-pro-étale and α_q : q^* → Rq^! is not an equivalence: Rq^!Λ is the sheaf of distributions (S5/profinite-quotient-upper-shriek). This example concerns the averaging construction for an eligible f; f = q is not ℓ-cohomologically smooth, so the smooth-quotient theorem does not assert an equivalence here. | specialization: Actual Z_2/F_5 Dirac distribution at the non-isolated identity is not a locally constant Haar density. The geometric sheaf identification is omitted. |
| `averagingTransformation_proEll_unavailable` | non-example | Assume Λ ≠ 0. For K = ℤ_ℓ there is no normalised measure, and the construction does not apply (S5/normalized-haar-measure). | specialization: Finite quotient of order ell obstruction with an actual linear functional, invariance and total mass, not an assumed failure. |

Acceptance:

- For K finite of order prime to ℓ acting freely, α_q is q^* → q^* (q étale) and the trace is |K|^{−1} times the sum over K.

Suggested target signatures:

- `averagingTransformation`: specialization. Finite-fibre natural endomorphism of the actual diagonal ModuleCat functor; its components are m inverse times identity.

Actual input required: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.

### Quotients by free actions of profinite groups of pro-order prime to ℓ

`DiamondSixOperations:S5/free-quotient-smooth` · theorem · planet: **Quotients by free profinite actions**

Let f : Y′ → Y be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth (ℓ ≠ p), and K a profinite group of pro-order prime to ℓ acting freely on Y′ over Y (K × Y′ → Y′ ×_Y Y′ an injection). Then f/K : Y′/K → Y is separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, and for Λ ℓ-power torsion and the normalised Haar measure there is a natural equivalence Rf^! ≃ q^*R(f/K)^! of functors D_ét(Y, Λ) → D_ét(Y′, Λ), q : Y′ → Y′/K the quotient. The coefficient hypothesis 'Λ ℓ-power torsion' is missing in print (PAPER-SCHOLZE-17/E100). Rq^! itself is not q^* (S5/profinite-quotient-upper-shriek).

Hypotheses:

- f smooth; K of pro-order prime to ℓ acting freely over Y; Λ ℓ-power torsion (added).

Named declarations: `IsCohomologicallySmooth.quotient_free`.

Construction or proof:

1. Reduce to Y = X strictly totally disconnected: Y′/K is locally spatial and quasiseparated (D0/spectral-quotient-criterion, ECD 2.10; D3/locally-profinite-torsors, ECD 10.13), separated by the valuative criterion, with canonical compactification (Y′)‾^{/Y}/K, the inclusion being open because (Y′)‾ → (Y′)‾/K is a quotient map; locally dim.trg f/K = dim.trg f.
2. The transformation q^*R(f/K)^! → Rq^!R(f/K)^! = Rf^! (S5/averaging-transformation, S3/upper-shriek-composition) is an equivalence for F_ℓ: check locally on Y′ (spatial), test against constructible F (C9/finite-field-compact-objects, ECD 20.10), descend F to F_H on Y′/H (C7, ECD 20.7), and compute Hom(F, q^*R(f/K)^!A) as colim_{H′} Hom(R(f/H′)_!F_{H′}, A).
3. The system R(f/H′)_!F_{H′} has split injective transition maps (normalised traces) and colimit Rf_!F, which is compact; hence it is eventually constant and equal to Rf_!F, giving Hom(F, q^*R(f/K)^!A) = Hom(F, Rf^!A).
4. Then f/K satisfies criterion (iii) of S4/strictly-local-criteria and R(f/K)^!F_ℓ is invertible, so f/K is ℓ-cohomologically smooth.

Direct prerequisites: `DiamondSixOperations:S5/averaging-transformation`, `DiamondSixOperations:S5/normalized-haar-measure`, `DiamondSixOperations:S4/strictly-local-criteria`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S3/upper-shriek-composition`, `DiamondEtaleCohomology:C9/finite-field-compact-objects`, `DiamondsAndVStacks:D0/spectral-quotient-criterion`, `DiamondsAndVStacks:D3/locally-profinite-torsors`, `DiamondEtaleCohomology:C7/constructible-sheaf`, `DiamondEtaleCohomology:C7/constructible-limit-descent`, `DiamondEtaleCohomology:C7/constructible-filtration`, `DiamondEtaleCohomology:C7/perfect-constructible`, `DiamondEtaleCohomology:C7/perfect-constructible-over-field`, `DiamondEtaleCohomology:C7/perfect-constructible-filtration`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`, `DiamondsAndVStacks:D4/quotient-presentations-of-diamonds`, `DiamondsAndVStacks:D5/spatial-v-sheaf-criterion`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 24.2, p. 153. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 24.2, p. 154. The key compactness step.

Acceptance:

- T_{C_p}^♢ = T̃_{C_p}^♢/ℤ_p for the compatible-root torus T̃ (used in S5/analytic-smooth-is-cohomologically-smooth); a pro-ℓ group is excluded.

Suggested target signatures:

- `IsCohomologicallySmooth.quotient_free`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.

### Rq^! for a profinite quotient is a sheaf of distributions, not q^*

`DiamondSixOperations:S5/profinite-quotient-upper-shriek` · theorem

In the situation of S5/free-quotient-smooth one also has Rf^! = Rq^!R(f/K)^!, but Rq^! ≠ q^* in general. After base change q becomes S × Spa(C, O_C) → Spa(C, O_C) for a profinite set S and algebraically closed C, and then Rq^!Λ is the sheaf on S sending an open and closed T ⊂ S to the distributions Hom_Λ(C⁰(T, Λ), Λ); For a nonzero coefficient ring the infinite case yields the distribution obstruction; a concrete witness is S = ℤ_r, r ≠ ℓ, Λ = F_ℓ, for which the distribution sheaf is not q^*Λ. No non-isomorphism is claimed for Λ = 0. A choice of Haar measure gives a natural map q^* → Rq^! (S5/averaging-transformation), which need not be an isomorphism (and is not one in the concrete infinite example above). Statements must therefore be made after composing with the quotient's structure map, as in S5/free-quotient-smooth.

Hypotheses:

- S profinite, C algebraically closed; Λ with nΛ = 0, n prime to p.

Named declarations: `profiniteProjection_upperShriek_distributions`.

Construction or proof:

1. Rf^! = Rq^!R(f/K)^! is S3/upper-shriek-composition for f = (f/K) ∘ q (q is eligible: proper quasi-pro-étale, dim.trg 0).
2. For q : S × Spa(C, O_C) → Spa(C, O_C) and T ⊂ S open and closed with inclusion i_T: Hom(Λ_T, Rq^!Λ) = Hom(Rq_!Λ_T, Λ) = Hom(C⁰(T, Λ), Λ), using Rq_! = Rq_* and S4/profinite-projection-pushforward.
3. For the concrete infinite example S = ℤ_r, Λ = F_ℓ, the Dirac distribution at a non-isolated point is not represented by a locally constant density for Haar measure: a density giving zero integral on every clopen disjoint from that point is zero there, and by local constancy also near the point. Thus the averaging map is not surjective; the distribution sheaf is not a rank-one local system. The zero-ring case has both objects zero. On every clopen neighbourhood Haar gives a nonzero germ (the volume of a smaller coset is a unit). With F_ell coefficients, if the distribution sheaf were a rank-one local system this nonzero map from the constant rank-one sheaf would be an isomorphism on stalks, contradicting the Dirac germ. Thus failure of this particular comparison is upgraded to the claimed non-local-system assertion in the concrete witness.

Direct prerequisites: `DiamondSixOperations:S3/upper-shriek-composition`, `DiamondSixOperations:S4/profinite-projection-pushforward`, `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S5/free-quotient-smooth`, `DiamondSixOperations:S1/factorisation-independence`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Remark after Proposition 24.2, p. 153. The caution.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Remark after Proposition 24.2, p. 153. The computation.

Acceptance:

- For S finite of size m, Rq^!Λ = Λ^S = q^*Λ (finite étale); for S = ℤ_p and Λ = F_ℓ, ℓ ≠ p, the distributions are Hom(C⁰(ℤ_p, Λ), Λ), which is not C⁰(ℤ_p, Λ).

Suggested target signatures:

- `profiniteProjection_upperShriek_distributions`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.

### Quotients by non-free profinite actions with smooth fibres

`DiamondSixOperations:S5/nonfree-quotient-smooth` · theorem · planet: **Quotients by non-free profinite actions**

Let f : Y′ → Y be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, K a profinite group of pro-order prime to ℓ acting on Y′ over Y with K × Y′ → Y′ ×_Y Y′ 0-truncated and qcqs, and Y′/K the quotient by the image equivalence relation. Then f/K : Y′/K → Y is separated and representable in locally spatial diamonds. If moreover for every complete algebraically closed C with open bounded valuation subring C⁺ and every Spa(C, C⁺) → Y the pullback Y′/K ×_Y Spa(C, C⁺) → Spa(C, C⁺) is ℓ-cohomologically smooth, then f/K is ℓ-cohomologically smooth and, for Λ ℓ-power torsion (PAPER-SCHOLZE-17/E100) and the normalised Haar measure, Rf^! ≃ q^*R(f/K)^!.

Hypotheses:

- As in S5/free-quotient-smooth but the action only 0-truncated and qcqs; fibrewise smoothness of the quotient over geometric points is a hypothesis.

Named declarations: `IsCohomologicallySmooth.quotient_nonfree`.

Construction or proof:

1. As in S5/free-quotient-smooth, Y′/K → Y is compactifiable, representable in locally spatial diamonds with locally dim.trg f/K = dim.trg f.
2. The averaging transformation α_q (S5/averaging-transformation) from integration over the K-action.
3. Check S4/practical-smoothness-criterion with Y = X strictly totally disconnected, Y′ quasicompact: (i) clear; (ii) for constructible F on Y′/K, F → q_*q^*F = Rq_!q^*F → Rq_!Rq^!F → F is the identity, so R(f/K)_!F is a direct summand of the constructible Rf_!q^*F; (iii) is the fibrewise hypothesis.
4. Then R(f/K)^! commutes with quasi-pro-étale base change (S4/strictly-local-criteria), so q^*R(f/K)^! → Rf^! can be checked on geometric fibres, where it holds by hypothesis; this gives (iv).

Direct prerequisites: `DiamondSixOperations:S5/averaging-transformation`, `DiamondSixOperations:S4/practical-smoothness-criterion`, `DiamondSixOperations:S4/strictly-local-criteria`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S5/free-quotient-smooth`, `DiamondEtaleCohomology:C7/constructible-sheaf`, `DiamondEtaleCohomology:C7/constructible-limit-descent`, `DiamondEtaleCohomology:C7/constructible-filtration`, `DiamondEtaleCohomology:C7/perfect-constructible`, `DiamondEtaleCohomology:C7/perfect-constructible-over-field`, `DiamondEtaleCohomology:C7/perfect-constructible-filtration`, `DiamondsAndVStacks:D4`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 24.3, p. 155. Hypotheses.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 24.3, p. 156. The constructibility step.

Acceptance:

- T_Y for Y over Spa ℤ_p^cycl is the quotient of the compatible-root torus T̃_Y by a nonfree ℤ_p-action (S5/analytic-smooth-is-cohomologically-smooth).

Suggested target signatures:

- `IsCohomologicallySmooth.quotient_nonfree`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.

### Smooth morphisms of analytic adic spaces are ℓ-cohomologically smooth

`DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth` · theorem · planet: **Smooth analytic maps are cohomologically smooth**

Let f : Y′ → Y be a separated smooth morphism of analytic adic spaces over Spa ℤ_p, smooth meaning locally on Y′ an étale map Y′ → Bⁿ_Y followed by the projection Bⁿ_Y → Y (AdicEtaleGeometry:A2/smooth-morphism-ball-charts; Bⁿ_Y = Spa(A⟨T₁, …, Tₙ⟩, A⁺⟨T₁, …, Tₙ⟩) over affinoid Y = Spa(A, A⁺)). Then f^♢ : (Y′)^♢ → Y^♢ is ℓ-cohomologically smooth for every ℓ ≠ p.

Hypotheses:

- f separated, locally étale over relative balls (A2); Y, Y′ analytic over Spa ℤ_p; ℓ ≠ p.

Named declarations: `IsCohomologicallySmooth.of_adic_smooth`.

Construction or proof:

1. f^♢ is representable in locally spatial diamonds (D6/etale-site-comparison, ECD 15.6) and compactifiable by S0/compactifiable-local-on-source and S0/separated-etale-compactifiable (ECD 22.3).
2. By S4/smooth-composition and S4/etale-maps-smooth reduce to Bⁿ_Y → Y, by induction to n = 1, and, covering B_Y by the two tori T_Y = {|T| = 1} and {|T − 1| = 1} (A2/relative-torus), to T_Y → Y.
3. Characteristic p: T_Y^♢ is an open subspace of B × Y^♢; S5/ball-smooth and S4/smooth-stable-under-base-change.
4. Over ℚ_p (after base change to C_p, S4/smooth-v-local-on-target): the compatible-root torus T̃_{C_p} = Spa C_p⟨T^{±1/p^∞}⟩ (P1) is a ℤ_p-torsor over T_{C_p}, so T_{C_p}^♢ = T̃_{C_p}^♢/ℤ_p with T̃^♢ open in a ball over (Spa C_p)^♢; apply S5/free-quotient-smooth (ℤ_p has pro-order prime to ℓ).
5. Mixed characteristic: v-locally Y lives over Spa ℤ_p^cycl; then T_Y is the quotient of T̃_Y by a nonfree ℤ_p-action whose geometric fibres were just shown smooth; apply S5/nonfree-quotient-smooth and descend along the v-cover (S4/smooth-v-local-on-target, dim.trg being finite for smooth adic maps, C8/analytic-dimension-bound).

Direct prerequisites: `DiamondSixOperations:S5/ball-smooth`, `DiamondSixOperations:S5/free-quotient-smooth`, `DiamondSixOperations:S5/nonfree-quotient-smooth`, `DiamondSixOperations:S4/smooth-composition`, `DiamondSixOperations:S4/etale-maps-smooth`, `DiamondSixOperations:S4/smooth-stable-under-base-change`, `DiamondSixOperations:S4/smooth-v-local-on-target`, `DiamondSixOperations:S0/compactifiable-local-on-source`, `DiamondSixOperations:S0/separated-etale-compactifiable`, `AdicEtaleGeometry:A2/smooth-morphism-ball-charts`, `AdicEtaleGeometry:A2/relative-torus`, `AdicEtaleGeometry:A2/relative-closed-polydisc`, `DiamondsAndVStacks:D6/etale-site-comparison`, `DiamondsAndVStacks:D3/locally-profinite-torsors`, `DiamondEtaleCohomology:C8/analytic-dimension-bound`, `PerfectoidSpaces:P1/perfectoid-field-definition`, `PerfectoidSpaces:P1/tilt-of-perfectoid-field`, `PerfectoidSpaces:P1/perfected-tate-algebra`, `PerfectoidSpaces:P1/cyclotomic-perfectoid-field`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 24.4, p. 156. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 24.4, p. 156. Reduction to the ball.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 24.4, p. 156. The mixed-characteristic step.

Acceptance:

- Smooth rigid curves over C and their open subsets are ℓ-cohomologically smooth over Spa(C, O_C); this is the input of S6/biduality.

Suggested target signatures:

- `IsCohomologicallySmooth.of_adic_smooth`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.

### (Spa ℚ_p)^♢ → * is ℓ-cohomologically smooth

`DiamondSixOperations:S5/spd-qp-smooth` · theorem · planet: **Smoothness of Spd ℚ_p**

For every prime ℓ ≠ p, the map (Spa ℚ_p)^♢ → * is ℓ-cohomologically smooth.

Hypotheses:

- ℓ ≠ p.

Named declarations: `SpdQp.isCohomologicallySmooth`.

Construction or proof:

1. Let K_∞ be the cyclotomic ℤ_p-extension of ℚ_p; K_∞^♭ ≅ F_p((t^{1/p^∞}))^∧ (P1), and (Spa ℚ_p)^♢ = Spa(F_p((t^{1/p^∞}))^∧, O_{F_p((t^{1/p^∞}))^∧})/ℤ_p (D6/spd-is-a-spatial-diamond with the Galois tower).
2. After pullback along the v-cover Spa(C, O_C) → * (C algebraically closed of characteristic p), (Spa ℚ_p)^♢ × Spa(C, O_C) = D^×_C/ℤ_p with D^×_C the punctured open unit disc, an open subset of B × Spa(C, O_C) (S5/perfectoid-ball).
3. D^×_C → Spa(C, O_C) is smooth (S5/ball-smooth, S4/etale-maps-smooth, S4/smooth-composition) and ℤ_p acts freely with pro-order prime to ℓ, so S5/free-quotient-smooth applies.
4. Descend along the v-cover by S4/smooth-v-local-on-target, (Spa ℚ_p)^♢ → * having locally finite dim.trg (dim.trg 1 on quasicompact opens).

Direct prerequisites: `DiamondSixOperations:S5/ball-smooth`, `DiamondSixOperations:S5/free-quotient-smooth`, `DiamondSixOperations:S5/perfectoid-ball`, `DiamondSixOperations:S4/etale-maps-smooth`, `DiamondSixOperations:S4/smooth-composition`, `DiamondSixOperations:S4/smooth-v-local-on-target`, `DiamondsAndVStacks:D6/spd-is-a-spatial-diamond`, `PerfectoidSpaces:P1/perfectoid-field-definition`, `PerfectoidSpaces:P1/tilt-of-perfectoid-field`, `PerfectoidSpaces:P1/perfected-tate-algebra`, `PerfectoidSpaces:P1/cyclotomic-perfectoid-field`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 24.5, p. 156. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 24.5, p. 157. Proof.

Acceptance:

- Div¹ = (Spa Q̆_p)^♢/φ^ℤ consumers (RelativeFarguesFontaine RF2) use this together with étale quotients.

Suggested target signatures:

- `SpdQp.isCohomologicallySmooth`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.

### A smoothness criterion over a general perfectoid base

`DiamondSixOperations:S5/geometric-base-criterion` · theorem

Let X be a perfectoid space, Y a locally spatial diamond and f : Y → X compactifiable with locally dim.trg f < ∞. Then f is ℓ-cohomologically smooth iff (i) Rf^!F_ℓ is invertible, i.e. étale locally ≅ F_ℓ[d], and (ii) for every X̃ → X that is an open subset of a finite-dimensional ball Bⁿ_X, with pullback f̃ : Ỹ → X̃, the transformation τ_{f̃} : Rf̃^!F_ℓ ⊗ f̃^* → Rf̃^! is an equivalence.

Hypotheses:

- X perfectoid; Y locally spatial; f compactifiable, locally dim.trg f < ∞.

Named declarations: `isCohomologicallySmooth_iff_geometricBase`.

Construction or proof:

1. Necessity: S4/smooth-twisted-pullback and S4/smooth-stable-under-base-change.
2. Sufficiency: reduce to X affinoid perfectoid and Y spatial. For X̃ ⊂ Bⁿ_X open, g : Ỹ → Y is smooth (S5/ball-smooth, base change and S4/etale-maps-smooth), so g^*Rf^!F_ℓ ≃ Rf̃^!F_ℓ by S4/smooth-upper-shriek-exchange (with f eligible), and Rf̃^!F_ℓ is invertible.
3. For X′ strictly totally disconnected over X, write X′ = lim X̃ᵢ with X̃ᵢ affinoid open subsets of finite-dimensional balls over X; it suffices to check h^*Rf^!F_ℓ ⊗ f′^* → Rf′^! on quasicompact separated étale V′ → Y′, which come from a finite stage (D5/limits-and-finite-stage-comparisons, ECD 11.23(iii)); reduce to global sections and apply Rh_*.
4. Rh_*Rf′^! = Rf^!Rg_* (S3/upper-shriek-pushforward-exchange) = Rf^!F_ℓ ⊗ f^*Rg_* (condition (ii)) = Rf^!F_ℓ ⊗ Rh_*f′^* (C3, 17.6) = Rh_*(h^*Rf^!F_ℓ ⊗ f′^*) (projection formula for the invertible Rf^!F_ℓ).

Direct prerequisites: `DiamondSixOperations:S5/ball-smooth`, `DiamondSixOperations:S4/smooth-twisted-pullback`, `DiamondSixOperations:S4/smooth-stable-under-base-change`, `DiamondSixOperations:S4/smooth-upper-shriek-exchange`, `DiamondSixOperations:S4/etale-maps-smooth`, `DiamondSixOperations:S3/upper-shriek-pushforward-exchange`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 24.6, p. 157. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 24.6, p. 158. The final computation.

Acceptance:

- For Y = B × X both conditions hold with d = 2.

Suggested target signatures:

- `isCohomologicallySmooth_iff_geometricBase`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.

## S6. Biduality and conservativity

Stage `DiamondSixOperations:S6`: **planned**.

Remaining acceptance inputs:

- H5’s local curve compactification over a non-discretely valued field remains inherited.
- Express the full geometric duality, global-sections/open-extension maps and counterexamples over the exact Spa(C,O_C) base. Valuation refinement and the component-openness proof now close the two earlier mathematical detection gaps; the sheaf and valuation prototypes are actual Mathlib specializations.

### The Verdier dual and the naive dual over a geometric point

`DiamondSixOperations:S6/verdier-dual` · construction

Let C be a complete algebraically closed nonarchimedean field of characteristic p, f : X → Spa(C, O_C) an eligible map from a locally spatial diamond, and Λ with nΛ = 0 (n prime to p). The Verdier dual is 𝔻_X := RHom_Λ(−, Rf^!Λ) : D_ét(X, Λ)^op → D_ét(X, Λ) and the naive dual is RHom_Λ(−, Λ). The biduality maps A → 𝔻_X𝔻_X A and A → RHom(RHom(A, Λ), Λ) are the evaluation maps. When f is ℓ-cohomologically smooth and Λ is ℓ-power torsion, Rf^!Λ is invertible (S4/dualizing-complex), so 𝔻_X = RHom(−, Λ) ⊗ Rf^!Λ and the two biduality maps correspond. On Spa(C, O_C) itself D_ét = D(Λ) and 𝔻 is the linear dual.

Hypotheses:

- f eligible from a locally spatial diamond to Spa(C, O_C); for the comparison of the two duals f is ℓ-cohomologically smooth and Λ ℓ-power torsion.

Named declarations: `verdierDual`, `naiveDual`.

Construction or proof:

1. Define both duals from C3's internal Hom and S3/upper-shriek's Rf^!Λ; the biduality maps are the unit of the tensor–Hom adjunction applied to evaluation.
2. For invertible D = Rf^!Λ: RHom(A, D) = RHom(A, Λ) ⊗ D and RHom(RHom(A, D), D) = RHom(RHom(A, Λ), Λ) (S4/invertible-object), compatibly with evaluation.
3. Verdier duality S3/verdier-duality-lower-shriek gives RΓ(X, 𝔻_X A) = RHom(RΓ_c(X, A), Λ) for X → Spa(C, O_C).

Direct prerequisites: `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S4/dualizing-complex`, `DiamondSixOperations:S4/invertible-object`, `DiamondSixOperations:S3/verdier-duality-lower-shriek`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `DiamondEtaleCohomology:C3/change-of-coefficients`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Theorem 25.1, p. 158. The two biduality maps and their equivalence.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 25.4, p. 161. The Verdier dual in the conservativity statement.

Uses:

- ECD Theorem 25.1 and Remarks 25.2–25.3: biduality A ≃ 𝔻𝔻A for bounded constructible or perfect-constructible A
- ECD Proposition 25.4 and Remarks 25.5–25.6: conservativity of 𝔻
- VStackSheavesAndLisseCategories:VS5 (FS V.6): Verdier biduality on Bun_G is compared stratumwise with this one; it is a separate result

API:

| Name | Role | Mathematical statement | Suggested form |
| --- | --- | --- | --- |
| `verdierDual_apply` | characterisation | 𝔻_X A = RHom(A, Rf^!Λ). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `verdierDual_const` | simp | 𝔻_X Λ = Rf^!Λ. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `verdierDual_eq_naive_tensor` | compatibility | For f smooth and Λ ℓ-power torsion, 𝔻_X A ≅ RHom(A, Λ) ⊗ D_f. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `bidualityMap` | data | The evaluation map A → 𝔻_X𝔻_X A. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `verdierDual_globalSections` | relation | RΓ(X, 𝔻_X A) ≅ RHom(RΓ_c(X, A), Λ). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `verdierDual_extendByZero` | relation | For j : U → X a quasicompact open, 𝔻_X(j_!B) ≅ Rj_*𝔻_U(B) and RHom(j_!Λ, Λ) = Rj_*Λ. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `verdierDual_pullback_smooth` | functoriality | For g : X′ → X smooth, g^*𝔻_X ≅ D_g^{−1} ⊗ 𝔻_{X′}g^* (S4/smooth-pullback-internal-hom and S4/smooth-upper-shriek-base-change). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Unit-test specifications:

| Name | Kind | Statement | Suggested form |
| --- | --- | --- | --- |
| `verdierDual_point` | degenerate | For X = Spa(C, O_C), 𝔻 is the linear dual RHom_Λ(−, Λ) on D(Λ). | specialization: Actual canonical double-linear-dual map for F_5; the geometric point comparison is omitted. |
| `verdierDual_ball` | computation | For the ball over Spa(C, O_C), 𝔻(Λ) ≅ Λ(1)[2]. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `naiveDual_extendByZero_valuedPlus` | non-example | Over Spa(C, C⁺) with C⁺ ≠ O_C and j : Spa(C, O_C) → Spa(C, C⁺), RHom(j_!F_ℓ, F_ℓ) = Rj_*F_ℓ = F_ℓ, so the naive double dual of j_!F_ℓ is F_ℓ ≠ j_!F_ℓ (S6/biduality-counterexample). | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |
| `verdierDual_contravariant` | characterisation | 𝔻 is an exact contravariant functor: 𝔻(A[1]) = (𝔻A)[−1]. | omitted: Requires the displayed actual supplier input; no replacement signature is asserted. |

Acceptance:

- 𝔻 of Λ_X is Rf^!Λ; on the ball over Spa(C, O_C), 𝔻(Λ) = Λ(1)[2].

Suggested target signatures:

- `verdierDual`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.
- `naiveDual`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.

### Biduality for ℓ-cohomologically smooth diamonds over Spa(C, O_C)

`DiamondSixOperations:S6/biduality` · theorem · planet: **Biduality over Spa(C, O_C)**

Let C be a complete algebraically closed nonarchimedean field of characteristic p with ring of integers O_C, X a locally spatial diamond, separated and ℓ-cohomologically smooth over Spa(C, O_C) for some ℓ ≠ p, and A ∈ D_ét(X, F_ℓ) bounded with constructible cohomology. Then the naive biduality map A → RHom_{F_ℓ}(RHom_{F_ℓ}(A, F_ℓ), F_ℓ) is an equivalence; equivalently (Rf^!F_ℓ being invertible) the Verdier biduality map A → 𝔻_X𝔻_X A is. The base is Spa(C, O_C); over Spa(C, C⁺) with C⁺ ≠ O_C the statement is false (S6/biduality-counterexample).

Hypotheses:

- C complete algebraically closed of characteristic p; base Spa(C, O_C) (C⁺ = O_C is essential).
- X separated, locally spatial, ℓ-cohomologically smooth over Spa(C, O_C); A bounded with constructible cohomology sheaves.
- The curve compactification input (H5/geometric-curve-compactification-export, local form (L)) is used with the scope recorded by its owner.

Named declarations: `biduality`.

Construction or proof:

1. Reduce to X spatial and A in degree 0; by C7 (ECD 20.8) A is filtered by j_!L with j : U → X quasicompact separated étale and L a local system; étale localisation makes j an open immersion and L constant (C7, ECD 20.7, on strict localisations, whose quasicompact opens are strictly local).
2. For A = j_!F_ℓ, RHom(j_!F_ℓ, F_ℓ) = Rj_*F_ℓ, and it suffices that j_!M → RHom(Rj_*F_ℓ, M) is an equivalence for every M ∈ D(F_ℓ).
3. Choose a quasi-pro-étale surjection X̃ = lim X̃ᵢ → X from a strictly totally disconnected space (D5/universally-open-presentation, ECD 11.24); Ũ = {|f| ≤ |ϖ|} for some f ∈ H⁰(X̃, O⁺) (ECD Lemma 7.6, D1); by continuity of H⁰(−, O⁺/ϖ) (C0, ECD 14.9; O⁺/ϖ étale by C2, ECD 14.12) descend f to f ∈ H⁰(X, O⁺/ϖ) with U = {f = 0}.
4. Let Y = {f − T = 0} ⊂ X × B_C (B_C the perfectoid ball over Spa(C, O_C)); Y → X is smooth surjective (open in a pullback of the ball, S5/ball-smooth, S4/etale-maps-smooth) and Y → B_C is smooth; using S4/smooth-pullback-internal-hom and smooth base change (S4/smooth-base-change) replace j : U → X by {T = 0} ⊂ B_C.
5. Now X is a quasicompact smooth rigid curve over C, smooth over Spa(C, O_C) by S5/analytic-smooth-is-cohomologically-smooth; it suffices to prove RΓ(X, j_!M) ≃ RHom(Rj_*F_ℓ, M). The cone of α_X is supported on the finite frontier of U (H5/curve-boundary-contributions) and is a direct summand of the cone for a proper smooth curve X′ ⊃ neighbourhoods (H5/curve-boundary-direct-summand, H5/geometric-curve-compactification-export (L)).
6. For X′ proper: with M = Rf^!M′, RHom(Rj_*F_ℓ, M) = RHom(RΓ(U, F_ℓ), M′) and RΓ(X′, j_!M) = RΓ_c(U, Rf^!M′) (S3/verdier-duality-lower-shriek); both commute with colimits in M because RΓ_c(U, Rf^!F_ℓ) and RΓ(U, F_ℓ) are finite (S4/practical-smoothness-criterion (ii)), so M = F_ℓ; Poincaré duality on U (Verdier duality with the invertible Rf^!F_ℓ, S4/dualizing-complex) dualises in finite-dimensional vector spaces, and the identification of the maps is H5/curve-compactification-duality (the check ECD leaves to the reader, PAPER-SCHOLZE-17/E72).

Direct prerequisites: `DiamondSixOperations:S6/verdier-dual`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/dualizing-complex`, `DiamondSixOperations:S4/smooth-pullback-internal-hom`, `DiamondSixOperations:S4/smooth-base-change`, `DiamondSixOperations:S4/etale-maps-smooth`, `DiamondSixOperations:S4/practical-smoothness-criterion`, `DiamondSixOperations:S3/verdier-duality-lower-shriek`, `DiamondSixOperations:S5/ball-smooth`, `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`, `ClassicalAdicEtaleCohomology:H5/curve-boundary-contributions`, `ClassicalAdicEtaleCohomology:H5/curve-boundary-direct-summand`, `ClassicalAdicEtaleCohomology:H5/geometric-curve-compactification-export`, `ClassicalAdicEtaleCohomology:H5/curve-compactification-duality`, `DiamondsAndVStacks:D5/universally-open-presentation`, `DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`, `DiamondEtaleCohomology:C0/std-etale-acyclic`, `DiamondEtaleCohomology:C0/unbounded-comparison-std`, `DiamondEtaleCohomology:C2/etale-test-on-one-cover`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `DiamondEtaleCohomology:C7/constructible-sheaf`, `DiamondEtaleCohomology:C7/constructible-limit-descent`, `DiamondEtaleCohomology:C7/constructible-filtration`, `DiamondEtaleCohomology:C7/perfect-constructible`, `DiamondEtaleCohomology:C7/perfect-constructible-over-field`, `DiamondEtaleCohomology:C7/perfect-constructible-filtration`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Theorem 25.1, p. 158. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Theorem 25.1, p. 159. The reduction.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Theorem 25.1, p. 160. The compactification step.

Acceptance:

- For X = B × Spa(C, O_C) and A = j_!F_ℓ with U the closed subdisc of radius |ϖ|, the double dual of j_!F_ℓ is j_!F_ℓ.

Suggested target signatures:

- `biduality`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.

### Finiteness of cohomology of smooth diamonds over Spa(C, O_C)

`DiamondSixOperations:S6/finiteness-of-cohomology` · theorem

In the situation of S6/biduality, if X is quasicompact then Hⁱ(X, A) is a finite-dimensional F_ℓ-vector space for every i ∈ ℤ and every bounded A with constructible cohomology.

Hypotheses:

- As in S6/biduality, X quasicompact.

Named declarations: `finite_cohomology_of_smooth`.

Construction or proof:

1. Reduce as in S6/biduality to A = j_!F_ℓ, and étale localise so that Rf^!F_ℓ = F_ℓ[d].
2. RΓ(X, j_!M) = RHom(Rj_*F_ℓ, M) (the claim proved in S6/biduality) = RHom_{D(F_ℓ)}(Rf_!Rj_*F_ℓ, M)[−d].
3. The left side commutes with all colimits in M (C9/global-sections-coproducts, ECD 20.10), so Rf_!Rj_*F_ℓ ∈ D(F_ℓ) is compact, i.e. bounded with finite cohomology; take M = F_ℓ.

Direct prerequisites: `DiamondSixOperations:S6/biduality`, `DiamondEtaleCohomology:C9/global-sections-coproducts`, `DiamondSixOperations:S2/lower-shriek`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Theorem 25.1, p. 158. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Theorem 25.1, p. 159. Proof.

Acceptance:

- H⁰(B × Spa(C, O_C), F_ℓ) = F_ℓ and the higher groups vanish; for the closed annulus H¹ = F_ℓ(−1).

Suggested target signatures:

- `finite_cohomology_of_smooth`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.

### Biduality fails over Spa(C, C⁺) with C⁺ ≠ O_C

`DiamondSixOperations:S6/biduality-counterexample` · theorem · planet: **Failure of biduality over Spa(C, C⁺)**

Let C be complete algebraically closed, C⁺ ⊊ O_C an open bounded valuation subring, X = Spa(C, C⁺) and j : U = Spa(C, O_C) → X the open immersion (the generic point). Then for A = j_!F_ℓ, RHom_{F_ℓ}(j_!F_ℓ, F_ℓ) = Rj_*F_ℓ = j_*F_ℓ = F_ℓ, so the double dual of A is F_ℓ ≠ j_!F_ℓ. Hence the hypothesis C⁺ = O_C in S6/biduality is essential, even for X → Spa(C, C⁺) the identity, which is ℓ-cohomologically smooth.

Hypotheses:

- C⁺ ⊊ O_C.

Named declarations: `not_biduality_valuedPlus`.

Construction or proof:

1. RHom(j_!F_ℓ, F_ℓ) = Rj_*RHom(F_ℓ, j^*F_ℓ) = Rj_*F_ℓ (C5 adjunction j_! ⊣ j^*).
2. X is strictly local and U is the generic point; Rj_*F_ℓ = j_*F_ℓ = F_ℓ (étale cohomology of Spa(C, O_C) vanishes in positive degrees and j_*F_ℓ is constant since every open neighbourhood of the closed point is X).
3. So the double dual is RHom(F_ℓ, F_ℓ) = F_ℓ, whose stalk at the closed point is F_ℓ while that of j_!F_ℓ is 0.

Direct prerequisites: `DiamondSixOperations:S6/verdier-dual`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `DiamondSixOperations:S4/etale-maps-smooth`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Remark 25.2, p. 158. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Remark 25.2, p. 158. The computation.

Acceptance:

- Exactly the open immersion of S0's test IsCompactifiable.generic_point_inclusion; its canonical compactification is X.

Suggested target signatures:

- `not_biduality_valuedPlus`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.

### Biduality and perfectness for ℓ-power-torsion coefficients

`DiamondSixOperations:S6/biduality-torsion-coefficients` · theorem

In the situation of S6/biduality let Λ be an ℓ-power-torsion ring and A ∈ D_ét(X, Λ) perfect-constructible. Then the biduality map A → RHom_Λ(RHom_Λ(A, Λ), Λ) is an equivalence, and if X is quasicompact, RΓ(X, A) is a perfect complex of Λ-modules (the printed 'A-modules' is PAPER-SCHOLZE-17/E65).

Hypotheses:

- As in S6/biduality; Λ ℓ-power torsion (ℓ^mΛ = 0); A perfect-constructible (C7).

Named declarations: `biduality_ellTorsion`, `perfect_globalSections`.

Construction or proof:

1. By C9/compact-iff-perfect-constructible (ECD 20.17) reduce to A = j_!Λ for quasicompact separated étale j : U → X.
2. The theorem for j_!F_ℓ gives it for j_!ℤ/ℓ^m by the five lemma (filtration by F_ℓ), and then for j_!Λ by extension of scalars.
3. For the biduality map (footnote 6): Rj_*Λ = Rj_*ℤ/ℓ^m ⊗^L_{ℤ/ℓ^m} Λ because j is qcqs of finite cohomological dimension, so Rj_* commutes with colimits; hence RHom_Λ(RHom_Λ(j_!Λ, Λ), Λ) = RHom_Λ(Rj_*Λ, Λ) = RHom_{ℤ/ℓ^m}(Rj_*ℤ/ℓ^m, Λ), and RHom_{ℤ/ℓ^m}(Rj_*ℤ/ℓ^m, Λ) = j_!Λ follows from the proof of S6/biduality (the M-version, with M = Λ).
4. Perfectness: RΓ(X, j_!Λ) = RΓ(X, j_!ℤ/ℓ^m) ⊗^L Λ and RΓ(X, j_!ℤ/ℓ^m) is perfect over ℤ/ℓ^m (finite cohomology over each F_ℓ-graded piece, S6/finiteness-of-cohomology, and finite Tor-amplitude).

Direct prerequisites: `DiamondSixOperations:S6/biduality`, `DiamondSixOperations:S6/finiteness-of-cohomology`, `DiamondEtaleCohomology:C9/compact-iff-perfect-constructible`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`, `DiamondEtaleCohomology:C3/change-of-coefficients`, `DiamondEtaleCohomology:C7/constructible-sheaf`, `DiamondEtaleCohomology:C7/constructible-limit-descent`, `DiamondEtaleCohomology:C7/constructible-filtration`, `DiamondEtaleCohomology:C7/perfect-constructible`, `DiamondEtaleCohomology:C7/perfect-constructible-over-field`, `DiamondEtaleCohomology:C7/perfect-constructible-filtration`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Remark 25.3, p. 158. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Remark 25.3, footnote 6, p. 158. The coefficient-change argument.

Acceptance:

- For Λ = ℤ/ℓ² and A = Λ on the ball over Spa(C, O_C), RΓ = Λ is perfect and A is its own double dual.

Suggested target signatures:

- `biduality_ellTorsion`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.
- `perfect_globalSections`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.

### Closed points detect vanishing on proper perfectoid spaces over Spa(C, O_C)

`DiamondSixOperations:S6/closed-points-detect-vanishing` · lemma

Let C be complete algebraically closed nonarchimedean of characteristic p, k its residue field, and X an affinoid perfectoid space, proper over Spa(C, O_C) and compactifiable over it, whose connected components are Spa(C′, C′⁺) with C′ complete algebraically closed and C′⁺ ⊂ O_{C′} open and integrally closed. Then |X| is a Jacobson space (Mathlib JacobsonSpace: every nonempty locally closed subset contains a point closed in |X|), and an object A ∈ D(|X|, F_ℓ) whose stalks vanish at all closed points of |X| is zero.

Hypotheses:

- X as in the proof of ECD Proposition 25.4 (the compactification of a strictly totally disconnected cover).

Named declarations: `closedPoints_detect_zero`.

Construction or proof:

1. Use the compactified strictly totally disconnected cover from the proof of conservativity. Write S = Spa(C,O_C), g:T→Z with T strictly totally disconnected and Z→S compactifiable. The relative and total compactifications satisfy T̄^{/Z} = T̄^{/S} ×_{Z̄^{/S}} Z, by C4/canonical-compactification (the same identity with partial properness relative to S). By S0/compactifiable-iff-separated-open, Z→Z̄^{/S} is open, hence T̄^{/Z} is open in T̄^{/S}. This proves the component-openness assertion used in ECD, rather than taking it as an extra unexplained geometric input.
2. The component projection T→π₀T extends to T̄^{/S}: the target S×π₀T is proper (S1/proper-dim-zero-classification). C4’s limit preservation identifies each fibre with the compactification over S of the original field component Spa(C′,C′⁺). C4/compactification-affinoid-formula and C5/compactified-field-point-topos identify that fibre with ZR(k′/k), for the residue fields k′ and k. Each nonempty open subset of this ZR space contains its generic field valuation, and is irreducible. Thus intersecting T̄^{/Z} with these fibres gives its connected components, open inside the corresponding ZR spaces. After compactifying over S they are the full fibres. No plus ring C′⁺ is assumed to be a valuation ring in the compactified cover.
3. For Jacobsonity of ZR(K/k), k algebraically closed, take V₀ in a nonempty basic open U_A intersected with a closed subset Z, where A is a finite-type k-subalgebra of K and A⊆V₀. Choose W minimal among valuation rings with A⊆W⊆V₀. Intersections of descending chains are valuation rings: if x is absent from one ring, x⁻¹ lies in every member by comparability. This supplies the Zorn lower bounds.
4. Let B be the image of A in κ(W). If κ(W)/k is not algebraic and B is not a field, pick a nonzero nonunit b in B and a maximal ideal containing b. The local domain B_m embeds in κ(W). The baseline IsLocalRing.exists_factor_valuationRing supplies a valuation ring U of κ(W) dominating B_m; b remains a nonunit, so U is proper and contains B. If B is a field, the baseline finite_of_finite_type_of_isJacobsonRing (Zariski lemma) makes it finite algebraic over k, hence B=k. Choose a transcendental t in κ(W), embed k[t]_(t), and use the same local domination theorem; t is a nonunit, again giving a proper U containing B.
5. The inverse image W′ of U under W→κ(W) is a valuation ring of K: for x outside W, x⁻¹ is in the maximal ideal of W and therefore W′; for x in W but outside W′, its nonzero residue is outside U so its inverse residue is in U. The inclusion W′⊊W preserves A, contradicting minimality. Hence κ(W)/k is algebraic, and κ(W)=k. Any valuation ring V⊆W containing k contains the maximal ideal of W (use x⁻¹ outside W for a nonunit x); V is the preimage of a valuation ring in κ(W)=k containing k, so V=W. This is closedness of W in ZR. Because W⊆V₀, W specializes V₀ and lies in Z as well as U_A. This proves every nonempty locally closed subset contains an ambient closed point, without asserting an arbitrary inverse-limit Jacobson theorem.
6. Open subspaces inherit Jacobsonity by mathlib:JacobsonSpace.of_isOpenEmbedding. Components are closed, so a point closed in a component is closed in the whole space; any nonempty locally closed subset meets a component. This passes Jacobsonity to the compactified cover.
7. For a sheaf F on a Jacobson space with zero stalks at ambient closed points, a nonzero section over an open U has nonempty support closed in U, hence a nonempty locally closed support in the whole space. By mathlib:nonempty_inter_closedPoints it contains a closed point, where the germ cannot vanish. This contradiction proves F=0. Apply it to every cohomology sheaf; completeness of the derived-category t-structure then gives A=0.

Direct prerequisites: `mathlib:JacobsonSpace`, `mathlib:JacobsonSpace.of_isOpenEmbedding`, `mathlib:nonempty_inter_closedPoints`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `mathlib:ValuationSubring`, `mathlib:IsLocalRing.exists_factor_valuationRing`, `mathlib:finite_of_finite_type_of_isJacobsonRing`, `DiamondSixOperations:S0/compactifiable-iff-separated-open`, `DiamondSixOperations:S1/proper-dim-zero-classification`, `DiamondsAndVStacks:D1/components-of-totally-disconnected`, `DiamondEtaleCohomology:C4/compactification-affinoid-formula`, `DiamondEtaleCohomology:C5/compactified-field-point-topos`, `ClassicalAdicEtaleCohomology:H1:henselian/zariski-riemann-space-as-limit`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 25.4, p. 161. The statement used.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 25.4, p. 161. The required geometric closed-point detection is supplied by the expanded compactification and valuation proof here. This does not revive the rejected source-error claim E2.

Acceptance:

- The lemma concerns all complexes, not only constructible ones: for j_!F with F ≠ 0 on a nonempty open U ⊂ |X|, U contains a point closed in |X| at which the stalk is nonzero, as the lemma predicts.

Suggested target signatures:

- `closedPoints_detect_zero`: specialization. Actual topological ModuleCat sheaf vanishing on a Jacobson space, with the genuine sheafification instance. The perfectoid comparison is omitted.

Actual input required: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.

### Conservativity of Verdier duality over Spa(C, O_C)

`DiamondSixOperations:S6/verdier-conservativity` · theorem · planet: **Conservativity of Verdier duality**

Let C be an complete algebraically closed nonarchimedean field of characteristic p, X a locally spatial diamond with f : X → Spa(C, O_C) compactifiable with locally dim.trg f < ∞, and A ∈ D_ét(X, F_ℓ) with RHom_{F_ℓ}(A, Rf^!F_ℓ) = 0. Then A = 0. No smoothness or constructibility is assumed; the base Spa(C, O_C) is essential (S6/conservativity-counterexample).

Hypotheses:

- f compactifiable (hence eligible with the dimension hypothesis); base Spa(C, O_C).

Named declarations: `verdierDual_conservative`.

Construction or proof:

1. Assume X quasicompact; take g : X̃ → X quasi-pro-étale surjective from a strictly totally disconnected space (D5/universally-open-presentation) and its compactification g‾ : X̃‾^{/X} → X, proper with dim.trg 0, so Rg‾^! is defined (S0, S3).
2. 0 = Rg‾^!RHom(A, Rf^!F_ℓ) = RHom(g‾^*A, R(f ∘ g‾)^!F_ℓ) (S3/upper-shriek-internal-hom, S3/upper-shriek-composition); it suffices that g‾^*A = 0, so replace X by X̃‾^{/X}.
3. Now X is affinoid perfectoid, compactifiable over Spa(C, O_C), with components Spa(C′, C′⁺) (C′⁺ open integrally closed in O_{C′}); D_ét(X, F_ℓ) = D(|X|, F_ℓ) (C0); replacing X by its compactification over Spa(C, O_C) and A by its extension by zero, X is proper.
4. For every open U ⊂ X, RHom(RΓ_c(U, A), F_ℓ) = RΓ(U, RHom(A, Rf^!F_ℓ)) = 0 (S3/verdier-duality-lower-shriek), hence RΓ_c(U, A) = 0; with U = X and U = X ∖ {x}, x closed, the stalk Aₓ is the cone, so Aₓ = 0 at closed points.
5. S6/closed-points-detect-vanishing gives A = 0.

Direct prerequisites: `DiamondSixOperations:S6/verdier-dual`, `DiamondSixOperations:S6/closed-points-detect-vanishing`, `DiamondSixOperations:S3/upper-shriek-internal-hom`, `DiamondSixOperations:S3/upper-shriek-composition`, `DiamondSixOperations:S3/verdier-duality-lower-shriek`, `DiamondsAndVStacks:D5/universally-open-presentation`, `DiamondSixOperations:S0/eligible-morphism`, `DiamondEtaleCohomology:C0/std-etale-acyclic`, `DiamondEtaleCohomology:C0/unbounded-comparison-std`, `DiamondEtaleCohomology:C2/etale-test-on-one-cover`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Proposition 25.4, p. 161. Hypotheses.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), proof of Proposition 25.4, p. 161. The stalk step.

Acceptance:

- Combined with S6/biduality: for bounded constructible A, B on smooth X, a map inducing an isomorphism on Verdier duals is an isomorphism.

Suggested target signatures:

- `verdierDual_conservative`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.

### Conservativity fails over Spa(C, C⁺) with C⁺ ≠ O_C

`DiamondSixOperations:S6/conservativity-counterexample` · theorem

Let X = Spa(C, C⁺) with C⁺ ⊊ O_C, i : {s} → |X| the inclusion of the closed point, and a nonzero Λ with nΛ = 0, n prime to p. Then RHom_Λ(i_*Λ, Λ) = 0 although i_*Λ ≠ 0 (D_ét(X, Λ) = D(|X|, Λ), X being strictly totally disconnected). Hence S6/verdier-conservativity fails over Spa(C, C⁺): f = id is ℓ-cohomologically smooth with Rf^!Λ = Λ.

Hypotheses:

- C⁺ ⊊ O_C; Λ ≠ 0; nΛ = 0 for n prime to p.

Named declarations: `not_verdierDual_conservative_valuedPlus`.

Construction or proof:

1. D_ét(X, Λ) = D(|X|, Λ) (C0); |X| is a chain of points with closed point s and generic point η, and i_*Λ is the skyscraper at s.
2. Hom(i_*Λ, Λ[k]) = Hom(Λ, i^!Λ[k]) and i^!Λ = 0: the triangle i_*i^!Λ → Λ → Rj_*j^*Λ with Rj_*j^*Λ = Λ (S6/biduality-counterexample, j the open complement of s) shows i^!Λ = 0.

Direct prerequisites: `DiamondSixOperations:S6/verdier-conservativity`, `DiamondSixOperations:S6/biduality-counterexample`, `DiamondEtaleCohomology:C0/std-etale-acyclic`, `DiamondEtaleCohomology:C0/unbounded-comparison-std`, `DiamondEtaleCohomology:C2/etale-test-on-one-cover`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/proper-base-change-unbounded`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Remark 25.5, p. 161. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Remark 25.5, p. 161. The computation.

Acceptance:

- The same space and sheaves as in S6/biduality-counterexample: j_!Λ and i_*Λ are the two halves of Λ.

Suggested target signatures:

- `not_verdierDual_conservative_valuedPlus`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.

### Conditional conservativity for general coefficient rings

`DiamondSixOperations:S6/conservativity-general-coefficients` · theorem

Let Λ be a ring killed by some n prime to p such that for every M ∈ D(Λ), RHom_Λ(M, Λ) = 0 implies M = 0. Then S6/verdier-conservativity holds with Λ in place of F_ℓ: for f : X → Spa(C, O_C) compactifiable with locally dim.trg f < ∞ and A ∈ D_ét(X, Λ), RHom_Λ(A, Rf^!Λ) = 0 implies A = 0. This is a conditional statement, not an unconditional extension: the ring hypothesis fails for Λ = O_K with K spherically complete and non-discretely valued and M = k its residue field (corrected example, PAPER-SCHOLZE-17/E101; such O_K is not killed by any n, so it illustrates only the ring-theoretic condition), and it is not known in which generality (for instance for noetherian Λ) it holds.

Hypotheses:

- Λ killed by n prime to p, with the stated conservativity of RHom_Λ(−, Λ) on D(Λ) (a hypothesis).

Named declarations: `verdierDual_conservative_of_ring`.

Construction or proof:

1. Follow S6/verdier-conservativity with Λ: the reductions to X proper affinoid perfectoid over Spa(C, O_C) use only Verdier duality and base change, valid for nΛ = 0.
2. RHom_Λ(RΓ_c(U, A), Λ) = RΓ(U, RHom(A, Rf^!Λ)) = 0 implies RΓ_c(U, A) = 0 by the ring hypothesis.
3. Stalks at closed points vanish; S6/closed-points-detect-vanishing (its last step works for any coefficient ring) gives A = 0.

Direct prerequisites: `DiamondSixOperations:S6/verdier-conservativity`, `DiamondSixOperations:S6/closed-points-detect-vanishing`, `DiamondSixOperations:S3/verdier-duality-lower-shriek`.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Remark 25.6, p. 161. Statement.

Source: [ECD](https://arxiv.org/abs/1709.07343v4), Remark 25.6, p. 161. The open question.

Acceptance:

- Λ = ℤ/ℓ^m satisfies the hypothesis (self-injective, so RHom(M, Λ) = Hom(H^{−∗}M, Λ) and Λ is a cogenerator).

Suggested target signatures:

- `verdierDual_conservative_of_ring`: omitted. Requires the displayed actual supplier input; no replacement signature is asserted.

Actual input required: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.
