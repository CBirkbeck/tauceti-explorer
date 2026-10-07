# Pro-étale descent, diamonds and small v-stacks

This roadmap constructs the ordinary foundations and geometric interfaces needed to pass from perfectoid spaces to diamonds, small v-stacks and the diamondification of analytic and integral pre-adic spaces. Its target-level plan covers D0–D6. Every declaration remains unchecked: this is a library architecture and source-based proof plan, with acceptance criteria for contributors and an independent review.

The [packet](../packets/DiamondsAndVStacks.json) continues the 72-node checkpoint and preserves its identifiers. It contains 90 nodes, 213 API items, 116 definition/construction tests and 41 planets. The [suggested file](../suggested/DiamondsAndVStacks.lean) gives concrete baseline-relative signatures; this document is definitive. Each stage is planned and remains open for the precisely listed source, supplier or signature refinements. “Complete” describes the target pass, rather than source closure or formalisation.

## Conventions and boundaries

Fix a prime p. Perfd denotes perfectoid spaces of all characteristics, while Perf denotes characteristic-p perfectoid spaces. Diamonds are sheaves of sets on Perf; v-stacks are groupoid-valued stacks. Untilts are marked by an isomorphism of their tilt with the test object, and all maps preserve that marking. Smallness is bounded at a cutoff cardinal satisfying the three clauses of ECD 4.1; changing the bound has the precise fully faithful and cohomology-preserving comparison below.

A quasicompact object and a quasicompact morphism to the final object are different notions. Quasiseparated morphisms use their quasicompact diagonal. The big perfectoid sheaf categories have the final-object warning of ECD §8; ordinary small-site topoi cannot silently replace those large categories. Coherent and algebraic topoi also have different hypotheses. A spectral space uses Mathlib’s existing predicate, and pro-constructibility uses Tau Ceti’s existing closedness in the constructible topology.

Write x ⤳ y when x specializes to y. The localization at y consists of x with x ⤳ y, hence the generalizations of y. Inverse spectral topology reverses this order. Pro(C) is the opposite of Ind(Cᵒᵖ); its Hom formula is lim over target stages of colim over source stages. Flattening Pro(Pro(C)) is a functor, not a claimed equivalence. Spectral presentations use finite T0 spaces, not finite Hausdorff spaces.

A multiplicative-seminorm presentation of the affinoid Berkovich quotient is normalized at a topologically nilpotent unit ϖ by |ϖ|=1/2; changing ϖ gives the canonical change-of-normalization homeomorphism. The rank-one section of the quotient is a function and need not be continuous. The normalized complete-Tate construction and maximal-Hausdorff theorem are requested from TB.0; D5 imports them and proves the small-v-sheaf extension.

The accepted [RS-05 proposal](../restructure/RS-05.result.json) controls ownership. PerfectoidSpaces P2/P4/P5/P6 supplies ring, morphism and limit foundations. Its P6 owns ECD 7.8–7.11 and the κ-small perfectoid calculus of 4.2–4.4. AdicSpacesPartII:A1 supplies adic étale sites, and A4 supplies ECD 15.3’s perfectoid torsor presentation. DiamondEtaleCohomology:C4 owns general canonical compactification, ECD §18; the elementary construction in ECD 9.9 is a D3 descent proof, and has no backward dependency on C4. Derived coefficient theory and higher sheaf models are supplied by their own roadmaps.

## Sources and verification

The pinned baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Statements of the 106 cited declarations were read at these commits. There is no reviewed library-audit entry or integrated decomposition for this roadmap. The full AdicSpaces and AnalyticToricGeometry upstream readers supplied the style and boundary comparisons. Source versions are recorded by URL, access date and hashes in the packet; publication versions are distinguished from manuscripts.

- **ecd — [Etale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4)**, Peter Scholze. arXiv:1709.07343, manuscript dated 15 April 2026; page numbers are the printed page numbers of that file, which run from 1 to 168. Read passages: Downloaded from arxiv.org on 24 September 2026 and hashed; the hash reproduces the copy already in the working scratch space byte for byte. Section 1, Introduction, pp. 2-9: Definitions 1.1, 1.3, 1.4, 1.7 and Theorems 1.2, 1.5, 1.6, 1.8, 1.9, 1.10 read in full. Section 2, Spectral spaces, pp. 10-14: Definition 2.1 to Lemma 2.11 with all proofs. Section 3, Perfectoid spaces, pp. 14-19: Definition 3.1, Remarks 3.2 and 3.3, Example 3.4, Corollary 3.20, Definitions 3.21 and 3.23, Example 3.22 and Theorem 3.24 read; the rest of the section is PerfectoidSpaces' material and was read only for the statements imported here. Section 4, Set-theoretic bounds, pp. 19-21: Lemma 4.1 to Proposition 4.4 with all proofs. Section 5, Morphisms of perfectoid spaces, p. 21: Definition 5.1, Example 5.2 and Proposition 5.3 read; the rest belongs to PerfectoidSpaces:P4. Section 6, Etale morphisms, p. 29: Proposition 6.5 read; the rest belongs to PerfectoidSpaces:P5 and P6. Section 7, Totally disconnected spaces, pp. 29-39: Definition 7.1 to Proposition 7.23 with all proofs. Section 8, The pro-etale and v-topology, pp. 39-43: Definition 8.1 to Proposition 8.8 with all proofs, and the recollection of SGA 4 VI on pp. 40-41. Section 9, Descent, pp. 44-49: Definition 9.1 to Corollary 9.11 with all proofs. Section 10, Morphisms of v-stacks, pp. 49-54: Definition 10.1 to Lemma 10.13 with all proofs. Section 11, Diamonds, pp. 54-69: Definition 11.1 to Lemma 11.31 with all proofs. Section 12, Small v-stacks, pp. 69-76: Definition 12.1 to Lemma 12.21 with all proofs. Section 13, Spatial morphisms, pp. 76-81: Definition 13.1 to Proposition 13.13 with all proofs. Section 14, Comparison of etale, pro-etale and v-cohomology, p. 81: Definition 14.1 read for the definition of the three sites; the rest belongs to DiamondEtaleCohomology. Section 15, Analytic adic spaces as diamonds, pp. 89-92: Lemma 15.1 to Lemma 15.6 with all proofs. Section 16, General base change results, p. 92: Theorem 16.1 and Remark 16.2 read for the boundary with DiamondEtaleCohomology; not used here. codex-rYXgzb, 7 October 2026: re-fetched v4, reproduced SHA-256; §§2, 4, 7–13, 15 read against the checkpoint; §14.9 and §22.12 read for the newly routed coherent-topos inputs. This is an arXiv manuscript, not a collation with a published edition.
- **berkeley — [Berkeley lectures on p-adic geometry](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf)**, Peter Scholze and Jared Weinstein. Author-hosted manuscript, 27 March 2020; printed lecture numbering. Read passages: Lectures 8–10 and 17 for the geometric comparisons; Proposition 10.2.3 with proof; §§18.1–18.2 with proofs, including 18.1.1, 18.1.2, 18.2.1 and 18.2.2.
- **arc — [The arc-topology](https://arxiv.org/pdf/1807.04725v4)**, Bhargav Bhatt and Akhil Mathew. arXiv v4. Read passages: §2: Definitions 2.14–2.15, Lemma 2.17 and Remark 2.18, including the valuation counterexample; §3: ordinary specializations of the profinite/sheaf and ultrafilter statements surrounding Propositions 3.10–3.14. The categorical-valued infinity-theorems are not claimed in D0.
- **kl15 — [Relative p-adic Hodge theory: foundations](https://arxiv.org/pdf/1301.0792)**, Kiran Kedlaya and Ruochuan Liu. Author arXiv version of Astérisque 371 (2015). Read passages: §8.1, Definition 8.1.4 and the inverse topology; analytic/étale definitions used for supplier comparison.
- **kl16 — [Relative p-adic Hodge theory II: imperfect period rings](https://arxiv.org/pdf/1602.06899)**, Kiran Kedlaya and Ruochuan Liu. Author arXiv PDF accessed 7 October 2026. Read passages: Theorem 3.5.8 and its proof: analytic, étale, pro-étale and v-vector bundles for a perfectoid space; Theorem 8.2.3 and proof, seminormality and recovery of analytic functions from completed pro-étale functions.
- **heuer — [A p-adic Simpson correspondence for smooth proper rigid varieties](https://arxiv.org/pdf/2307.01303)**, Ben Heuer. arXiv v3, 21 January 2025; not asserted to be the published layout. Read passages: Opening site conventions and the vector-bundle comparison attributed to [27, Theorem 3.5.8]; bibliography identifies [27] as Kedlaya–Liu II, not their foundations paper.
- **hk — [Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem](https://arxiv.org/pdf/2308.11064v2)**, Sean Howe and Christian Klevdal. arXiv v2; the routed Inventiones article is not fully collated. Read passages: §2 diamond and rigid-space conventions, locally closed generalizing subdiamonds and seminormal rigid full faithfulness; proof of Proposition 9.3.4, profinite products and closed images under projection.
- **glx — [The connected components of affine Deligne–Lusztig varieties](https://arxiv.org/pdf/2208.07195v3)**, Ian Gleason, Dong Gyu Lim and Yujie Xu. arXiv v3, 10 November 2025; E01 inherits the earlier extraction worker’s published-page verification and the independent extraction review’s preprint verification, distinguished in sourceVersions.. Read passages: Lemma 3.2 with proof and its use in Proposition 3.12, Proposition 6.6(2) and Lemma 6.12; underlying quotient theorem is retained; unrestricted component formula is rejected.
- **sch12 — [Perfectoid spaces](https://arxiv.org/pdf/1111.4914)**, Peter Scholze. Author arXiv PDF. Read passages: Proposition 6.18 and proof: completed tensor products and the almost formula for integral elements needed in ECD 8.7.
- **sga4vi — [Théorie des topos et cohomologie étale des schémas, Tome 2, Exposé VI](https://pi.math.cornell.edu/~dkmiller/bin/sga4-2.pdf)**, Alexander Grothendieck and Jean-Louis Verdier. Freely hosted French transcription; printed Exposé and theorem numbering, not PDF page numbering. Read passages: VI §§1–2: definitions of quasicompact and quasiseparated objects and morphisms, coherent/algebraic topoi; Corollaries 1.17, 2.6 and 2.8 with proofs. VI 5.1–5.4 with proof of filtered-colimit cohomology. VI 8.7.1–8.7.7: assumptions and proof of the cohomology-of-limit comparison.
- **stacks-0apa — [Stacks Project: quotient spaces](https://stacks.math.columbia.edu/tag/0APA)**, The Stacks Project Authors. Live Stacks Project tag read 7 October 2026; theorem numbering at that access. Read passages: Tags 0APA and 0APB with proofs; comparison with the generalizing topological argument of ECD 2.7.
- **stacks-02uw — [Stacks Project: cohomology of sheaves](https://stacks.math.columbia.edu/tag/02UW)**, The Stacks Project Authors. Live Stacks Project tag read 7 October 2026; theorem numbering at that access. Read passages: Lemma 20.20.2: constant abelian sheaves on an irreducible topological space are flasque; the proof uses nonempty-open intersections and does not need noetherianity.
- **stacks-stackification — [Stacks Project: stackification and quotient stacks](https://stacks.math.columbia.edu/tag/02ZM)**, The Stacks Project Authors. Live tags read 7 October 2026. Read passages: Tags 02ZN, 02ZO, 02ZP and 04Y1: stackification construction, universal property and compatibility with 2-fibre products. Tag 044O: quotient prestack and stack. Tags 0571–0572 for the supplier fppf refinement request; Tag 047C is not the refinement theorem.

The earlier checkpoint’s ECD read log is retained as provenance; the current pass re-fetched the hashed v4 manuscript and checked the required statements and proofs of §§2, 4, 7–13 and 15, plus the routed §14.9/§22.12 inputs. Berkeley 18.1–18.2, KL16 3.5.8/8.2.3, the SGA VI comparisons and the routed Arc/HK/GLX passages control the added targets. Hochster’s original ring-realization proof was not obtainable from the attempted open AMS link; this remains a recorded source gap.

## Layer overview

| Layer | Targets | Status | Planets |
|---|---|---|---|
| D0 | Spectral topology, ordinary sites, and size | planned; 26 nodes | 6 |
| D1 | Totally disconnected perfectoid spaces | planned; 11 nodes | 6 |
| D2 | Pro-étale and v-topologies | planned; 9 nodes | 5 |
| D3 | Effective descent and morphisms of stacks | planned; 10 nodes | 6 |
| D4 | Diamonds and small v-stacks | planned; 10 nodes | 6 |
| D5 | Spatial geometry and relative representability | planned; 15 nodes | 6 |
| D6 | Analytic and integral pre-adic diamondification | planned; 9 nodes | 6 |

## D0 — Spectral topology, ordinary sites, and size

The input is the pinned spectral and adic-spectrum calculus. This layer supplies the missing relative and inverse-topology interfaces, the pro-category, ordinary coherent-topos comparisons, bounded cardinal arithmetic and groupoid-valued stack constructions. Compactness in the constructible topology drives the image and quotient arguments; it does not turn every spectral surjection into a quotient map. Ordinary Set/Ab sheaves and ordinary derived categories are the scope of the cohomological interfaces. The higher categorical extensions in the arc paper have the outward supplier direction to EnhancedDerivedSheaves.

**Target coverage.** RS-05 narrows D0 onto the missing ordinary interfaces and names the Tau Ceti AdicSpaces anchor as the supplier of the spectral, constructible and patch calculus. That anchor is real: the pinned Tau Ceti library has the valuation spectrum, its patch topology with quasicompactness and the closed embedding into a product of copies of Bool, pro-constructibility of the loci where finitely many functions have absolute value at most one, and spectrality of both Spa(A, A^+) and the locus of continuous valuations. What this layer plans is what neither that anchor nor Mathlib has: locally spectral spaces and relative spectral maps, the profiniteness of the constructible topology, the quotient criteria of ECD 2.7 to 2.10, cofiltered limits, the pro-category, Hochster realization, the cutoff cardinal, the coherent-topos interface, the three cohomological comparisons, and ordinary stackification.

### locally-spectral-space — Locally spectral spaces and spectral maps between them

**Definition.** A spectral space is a quasicompact topological space with a basis of quasicompact open subsets stable under finite intersection in which every irreducible closed subset has a unique generic point. A locally spectral space is a space admitting an open cover by spectral subspaces. A map f : X -> Y of spectral spaces is spectral if it is continuous and the preimage of every quasicompact open is quasicompact open; a map of locally spectral spaces is spectral if for every spectral open U of X mapping into a spectral open V of Y the restriction U -> V is spectral. Mathlib's SpectralSpace is exactly the first notion; the locally spectral notion and the relative spectrality condition for locally spectral spaces are absent at the pinned commit and are what this node adds. A non-qc open inclusion into a spectral space is locally spectral; its domain need not itself be spectral, and it is not an absolute spectral map.

Identifier: `DiamondsAndVStacks:D0/locally-spectral-space`.

**Hypotheses and conventions.**

- Mathlib's SpectralSpace is stated as T0 + CompactSpace + QuasiSober + QuasiSeparatedSpace + PrespectralSpace, which is the same predicate; IsSpectralMap is stated for arbitrary topological spaces, so the absolute spectral-map notion is already available and only the locally spectral relative version is missing.
- The relative definition quantifies over pairs (U, V) of spectral opens, not over a chosen cover: any definition using a single cover has to be proved independent of the cover.

**Construction or proof.**

1. Take Mathlib's SpectralSpace as the absolute notion and IsSpectralMap as the absolute map notion.
2. Define IsLocallySpectralSpace as the existence of an open cover by subspaces satisfying SpectralSpace.
3. Define the relative spectrality of a continuous map of locally spectral spaces by the condition of ECD 2.1 on spectral opens, and prove it is equivalent to the condition for one cover by spectral opens, using that a quasicompact open subspace of a spectral space is spectral (Mathlib's Topology.IsOpenEmbedding.spectralSpace).
4. Prove the two notions agree when both spaces are spectral.

**Uses that determine the API.**

- ECD Lemma 2.7 and Lemma 2.10: The hypotheses are stated for a quasiseparated locally spectral space X and conclude that the quotient is locally spectral and quasiseparated, so the relative notion is what the conclusion of 2.10 is about.
- ECD Proposition 11.18(iii) and Proposition 11.19: The underlying space of a locally spatial diamond is locally spectral, and maps between them are spectral and generalizing: the statement is exactly this predicate.
- DiamondsAndVStacks:D5 and DiamondEtaleCohomology:C0: Spatiality of a diamond is a condition relating the v-sheaf to the spectrality of its space; every statement there quantifies over locally spectral spaces.

**Named API.**

- `IsLocallySpectralSpace` (data): The predicate on a topological space: it admits an open cover by subspaces that are spectral.
- `IsLocallySpectralSpace.of_spectralSpace` (instance): Every spectral space is locally spectral.
- `IsLocallySpectralSpace.isOpen_isCompact_basis` (characterisation): A locally spectral space has a basis of quasicompact opens and is sober and locally quasiseparated.
- `IsSpectralMap.locally` (data): The predicate that a continuous map of locally spectral spaces is spectral, in the sense of ECD 2.1.
- `IsSpectralMap.locally_iff_of_cover` (characterisation): It is enough to check the condition for the members of one cover of the source by spectral opens mapping into spectral opens of the target.
- `IsSpectralMap.locally_iff_isSpectralMap` (compatibility): For a map of spectral spaces the relative notion agrees with Mathlib's IsSpectralMap.
- `IsSpectralMap.locally_comp` (functoriality): Composites of spectral maps of locally spectral spaces are spectral.
- `IsLocallySpectralSpace.isOpen` (structure): An open subspace of a locally spectral space is locally spectral.

**Unit tests.**

- `qcqs_affinoid_is_spectral` (non-example): Spa(A, A^+) of a Huber pair with a pair of definition is spectral, hence locally spectral; a definition that does not accept it is wrong.
- `disjoint_union_of_spectral_is_locally_spectral_not_spectral` (non-example): An infinite disjoint union of nonempty spectral spaces is locally spectral and not quasicompact, so it is locally spectral but not spectral: the two predicates must not coincide.
- `open_immersion_is_spectral` (non-example): The inclusion of a quasicompact open subspace of a spectral space is a spectral map; the inclusion of a non-quasicompact open subspace of a spectral space is continuous but not spectral (a non-example).
- `agrees_with_mathlib_on_spectral_spaces` (compatibility): For X, Y spectral, IsSpectralMap.locally f is equivalent to IsSpectralMap f.

**Acceptance.**

- Spa(A, A^+) for a Huber pair with a pair of definition is spectral: Tau Ceti's spectralSpace_spa_of_pairOfDefinition. Every perfectoid space is locally spectral, and a qcqs one is spectral.

**Direct prerequisites.** `mathlib:SpectralSpace`, `mathlib:IsSpectralMap`, `mathlib:Topology.IsOpenEmbedding.spectralSpace`, `mathlib:QuasiSeparatedSpace`, `tauceti:TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, Definition 2.1, p. 10 — The definition this node formalises, verbatim.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, Definition 2.1, second paragraph, p. 10 — The relative condition, which is the part Mathlib does not have..

**Signature refinement.** The affinoid test uses the pinned Tau Ceti Spa carrier and spectralSpace_spa_of_pairOfDefinition; its dependency module is not elaborated in the shared build. The Mathlib-relative predicates and the other topological tests are stated.

The precise entries left out of the suggested declarations are `qcqs_affinoid_is_spectral`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### constructible-topology-profinite — The constructible topology of a spectral space is profinite

**Theorem.** Let X be a spectral space. Recall that T subset X is constructible if it lies in the boolean algebra generated by the quasicompact open subsets, and that the constructible topology is generated by the constructible subsets. Then X with its constructible topology is a profinite set, that is, compact Hausdorff and totally disconnected; and if X = lim X_i is an inverse limit of finite T0 spaces along spectral maps then X with the constructible topology is the inverse limit of the X_i with the discrete topology. Mathlib has the constructible topology and its quasicompactness but not its Hausdorffness, total disconnectedness, or the identification of the limit presentation.

Identifier: `DiamondsAndVStacks:D0/constructible-topology-profinite`.

**Hypotheses and conventions.**

- X spectral. The limit statement is conditional on a given presentation of X as a cofiltered inverse limit of finite T0 spaces along spectral maps; that such a presentation exists is the pro-category node, which rests on this one and not conversely.
- Mathlib's compactSpace_withConstructibleTopology assumes CompactSpace, QuasiSober, PrespectralSpace and QuasiSeparatedSpace, which SpectralSpace supplies.

**Construction or proof.**

1. Quasicompactness is Mathlib's compactSpace_withConstructibleTopology.
2. Hausdorffness and total disconnectedness: the constructible subsets are open and closed for the constructible topology by construction and separate points because the quasicompact opens do (X is T0 and has a basis of quasicompact opens).
3. For the limit statement, the preimages of subsets of the X_i are exactly the subsets that are open and closed for the constructible topology, which is the computation made in the proof of ECD Lemma 2.3.

**Acceptance.**

- For X = Spec(A) with A a product of countably many fields, X_cons is the Stone space of the boolean algebra of subsets of the index set, and X is not discrete.

**Direct prerequisites.** `mathlib:WithConstructibleTopology`, `mathlib:compactSpace_withConstructibleTopology`, `mathlib:constructibleTopology_eq_generateFrom_isConstructible`, `mathlib:Topology.IsConstructible`, `mathlib:Profinite`, `mathlib:TotallyDisconnectedSpace`, `mathlib:Profinite.asLimit`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, paragraph after Theorem 2.2, p. 10 — The exact statement of this node, which every quasicompactness argument of ECD sections 2, 7, 9, 11 and 13 uses.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, paragraph after Theorem 2.2, p. 10 — Fixes the convention, which agrees with Mathlib's constructibleTopology..

**Theorem signature.** Proposed name `TauCeti.Diamonds.ConstructibleTopologyProfinite`; a baseline-relative prototype is typed. The typed form is a baseline-relative specialization; the definitive target includes all hypotheses and auxiliary conclusions in the reader.
### pro-constructible-subsets — Pro-constructible subsets: closedness in the constructible topology and stability under spectral images

**Lemma.** Extend the existing TauCeti.IsProConstructible predicate, defined as closedness in WithConstructibleTopology. For a spectral space X it is equivalent to being an intersection of constructible subsets. The image of a pro-constructible subset under a spectral map between spectral spaces is pro-constructible. Existing compactness, intersections, inverse images and induced spectral-space structures are imported, never rebuilt. Locally, check on spectral opens.

Identifier: `DiamondsAndVStacks:D0/pro-constructible-subsets`.

**Hypotheses and conventions.**

- X, Y spectral; f spectral. The image statement needs Lemma 2.3's identification of pro-constructible with constructibly closed and the profiniteness of the constructible topology.

**Construction or proof.**

1. Reuse TauCeti.IsProConstructible as closedness in the constructible topology and its existing subspace calculus. Identify constructible subsets with the clopens of this compact zero-dimensional Hausdorff topology by a finite subcover argument.
2. Conversely a constructibly closed subset is an intersection of constructibly clopen subsets, and a constructibly clopen subset is constructible: write X as a cofiltered inverse limit of finite T0 spaces X_i, so that a clopen subset for the constructible topology is the preimage of a subset of some X_i.
3. For the image: in the constructible topologies f is a continuous map of compact Hausdorff spaces and S is closed, so f(S) is closed, hence pro-constructible.

**Acceptance.**

- The image of Spa(K, O_K) in Spa(K, K^+) is pro-constructible and generalizing but not open when K^+ is not O_K.
- The set of rank-one points of a spectral space need not be pro-constructible, which is why ECD never asserts it.

**Direct prerequisites.** `mathlib:Topology.IsConstructible`, `mathlib:Topology.IsLocallyConstructible`, `mathlib:IsRetrocompact`, `mathlib:WithConstructibleTopology`, `tauceti:TauCeti.ValuationSpectrum.isProConstructible_val_preimage_spa`, `DiamondsAndVStacks:D0/constructible-topology-profinite`, `tauceti:TauCeti.IsProConstructible`, `tauceti:TauCeti.IsSpectralMap.continuous_constructibleTopology`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, Lemma 2.3 with proof, p. 10 — The statement and both halves of its proof.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, proof of Lemma 2.3, p. 10 — The proof step that forces the profiniteness node to come first..

**Theorem signature.** Proposed name `TauCeti.Diamonds.ProConstructibleSubsets`; a baseline-relative prototype is typed. The typed form is a baseline-relative specialization; the definitive target includes all hypotheses and auxiliary conclusions in the reader.
### closure-of-pro-constructible — The closure of a pro-constructible subset is its set of specializations

**Lemma.** Let X be a spectral space and S a pro-constructible subset. Then the closure of S in X is exactly the set of specializations of points of S. In particular a pro-constructible subset that is stable under specialization is closed, and a pro-constructible generalizing subset of a spectral space is an intersection of quasicompact open subsets.

Identifier: `DiamondsAndVStacks:D0/closure-of-pro-constructible`.

**Hypotheses and conventions.**

- X spectral, S pro-constructible. The last sentence is the dual statement used repeatedly in ECD sections 7, 9 and 11 and is proved by the same argument applied to the complement.

**Construction or proof.**

1. A specialization of a point of S clearly lies in the closure.
2. Conversely let x have no generalization in S. The set X_x of generalizations of x is the intersection of the quasicompact opens containing x, so it is pro-constructible, and X_x meets S in the empty set.
3. Hence the (X minus U) intersected with S cover S as U runs over quasicompact open neighbourhoods of x; S is quasicompact in the constructible topology and each X minus U is constructible, so some single U has U meeting S in the empty set.
4. So x has an open neighbourhood missing S and is not in the closure.

**Acceptance.**

- Mathlib has StableUnderSpecialization and StableUnderGeneralization but no statement of this kind; the unit test is that for S a single point the conclusion is the standard description of the closure of a point in a sober space.

**Direct prerequisites.** `mathlib:StableUnderSpecialization`, `mathlib:StableUnderGeneralization`, `mathlib:specializes_iff_mem_closure`, `DiamondsAndVStacks:D0/pro-constructible-subsets`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, Lemma 2.4 with proof, pp. 10-11 — The statement; the proof is quoted in the steps.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, proof of Lemma 2.4, p. 11 — The quasicompactness step, which is where the profinite constructible topology is used..

**Theorem signature.** Proposed name `TauCeti.Diamonds.ClosureOfProConstructible`; a baseline-relative prototype is typed. The typed form is a baseline-relative specialization; the definitive target includes all hypotheses and auxiliary conclusions in the reader.
### generalizing-surjection-is-quotient — A surjective generalizing spectral map is a quotient map

**Lemma.** Let f : Y -> X be a surjective, generalizing spectral map of spectral spaces. Then f is a quotient map. Here generalizing means that every generalization of a point in the image lifts, which Mathlib records as GeneralizingMap. Separately, a continuous surjection from a quasicompact space onto a compact Hausdorff space is a quotient map.

Identifier: `DiamondsAndVStacks:D0/generalizing-surjection-is-quotient`.

**Hypotheses and conventions.**

- Both halves are used constantly: the first because all maps of analytic adic spaces are generalizing, the second for the Berkovich quotient of section 13.
- The second statement needs no spectrality: S quasicompact, T compact Hausdorff, f continuous surjective.

**Construction or proof.**

1. First statement: let S be a subset of X whose preimage T is open. Then Y minus T is closed, hence pro-constructible, so its image X minus S is pro-constructible by Lemma 2.3.
2. As f is generalizing this image is closed under specialization, hence closed by Lemma 2.4; so S is open.
3. Second statement: for x in T the open neighbourhoods are cofinal with the closed ones; a quasicompactness argument produces an open U_x with f inverse of its closure contained in U, which gives U_x contained in V.

**Acceptance.**

- A bijective continuous spectral map need not be a homeomorphism without the generalizing hypothesis; ECD uses the hypothesis in every application (2.9, 7.13, 7.14, 9.6, 10.11, 11.13, 11.20, 13.9).

**Direct prerequisites.** `mathlib:GeneralizingMap`, `mathlib:Topology.IsQuotientMap`, `mathlib:IsCompact.image`, `DiamondsAndVStacks:D0/closure-of-pro-constructible`, `DiamondsAndVStacks:D0/pro-constructible-subsets`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, Lemma 2.5 with proof, p. 11 — First half, with its proof.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, Lemma 2.6 with proof, p. 11 — Second half, used for the Berkovich quotient in Proposition 13.9 and Proposition 13.11..

**Theorem signature.** Proposed name `TauCeti.Diamonds.GeneralizingSurjectionIsQuotient`; a baseline-relative prototype is typed. The typed form is a baseline-relative specialization; the definitive target includes all hypotheses and auxiliary conclusions in the reader.
### pro-constructible-equivalence-relation — Quotients by pro-constructible equivalence relations are T0, with invariant neighbourhoods

**Theorem.** Let X be a quasiseparated locally spectral space and R inside X x X a pro-constructible equivalence relation whose two projections s, t : R -> X are quasicompact and generalizing. Then the quotient space X/R is T0. Moreover for every quasicompact open W inside X there is an open R-invariant subset U containing W with U contained in E', where E' is an R-invariant intersection of a nonempty family of quasicompact open subsets.

Identifier: `DiamondsAndVStacks:D0/pro-constructible-equivalence-relation`.

**Hypotheses and conventions.**

- X quasiseparated and locally spectral; R pro-constructible; s and t quasicompact and generalizing. ECD's own statement writes the conclusion with E rather than E', and its proof observes that the inclusion U inside E fails for the E it defines and holds for E' = t(s inverse of W'); the corrected statement is the one used later and the one recorded here.
- Note the hypotheses do not make X/R spectral: Remark 2.8 exhibits any compact Hausdorff space as such a quotient of profinite sets.

**Construction or proof.**

1. For W quasicompact open, s inverse of W is quasicompact open, so E = t(s inverse of W) is quasicompact, pro-constructible, generalizing and R-invariant; pick a quasicompact open W' containing E, so E is an intersection of quasicompact opens.
2. Let Z = X minus W'. Then s inverse of Z is closed, hence pro-constructible, and T = t(s inverse of Z) is pro-constructible; its closure is R-invariant because s is generalizing.
3. U = X minus closure of T is an open R-invariant subset with W inside U inside W', and U is contained in E' = t(s inverse of W').
4. For T0: lift distinct points to x, y with disjoint orbits; the orbits are pro-constructible quasicompact, so their union is a spectral space with a maximal point, and a generalization argument rules out the mixed case; then separate by an R-invariant open produced by the first part.

**Acceptance.**

- Remark 2.8: even when X is profinite the quotient can be an arbitrary compact Hausdorff space, so no spectrality can be added to the conclusion.
- A test: for X profinite and R the graph of a free finite group action, X/R is profinite.

**Direct prerequisites.** `mathlib:GeneralizingMap`, `mathlib:T0Space`, `mathlib:Topology.IsQuotientMap`, `DiamondsAndVStacks:D0/closure-of-pro-constructible`, `DiamondsAndVStacks:D0/pro-constructible-subsets`, `DiamondsAndVStacks:D0/generalizing-surjection-is-quotient`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, Lemma 2.7, p. 11 — The statement of the node.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, proof of Lemma 2.7, p. 12 — ECD itself records that the statement of 2.7 must be read with E', which this node states as the corrected form.; [stacks-0apa](https://stacks.math.columbia.edu/tag/0APA), Tags 0APA and 0APB — Comparison source for invariant qc neighbourhoods: the scheme/flat argument does not replace ECD’s generalizing topological hypotheses..

**Theorem signature.** Proposed name `TauCeti.Diamonds.ProConstructibleEquivalenceRelation`; the full signature is explicitly omitted from declarations until its required interface can be stated. The ordinary categorical/topological carrier for this precise statement is not yet connected to the prototype (bounded ordinal subcategory assembly, coherent topoi/derived comparisons, or the groupoid-object and isomorphism-class stack interfaces). Build it from this node’s pinned categorical APIs and proof steps; there is no geometry assumed as an opaque predicate.
### spectral-quotient-criterion — When a quotient by a pro-constructible equivalence relation is spectral, and the open case

**Theorem.** Let X be a spectral space and R inside X x X a pro-constructible equivalence relation whose projections s, t are generalizing. Assume X/R has a basis for its topology given by open subsets whose preimages in X are quasicompact. Then X/R is a spectral space and X -> X/R is a spectral generalizing map. In the situation of the previous node, if in addition R -> X is open then X/R is locally spectral and quasiseparated and X -> X/R is an open spectral qcqs map. Neither statement can be strengthened to 'every quotient of a spectral space by such a relation is spectral'.

Identifier: `DiamondsAndVStacks:D0/spectral-quotient-criterion`.

**Hypotheses and conventions.**

- The basis hypothesis in the first statement is not automatic; the second statement replaces it by openness of R -> X, which is what all later applications verify.
- ECD Remark 2.8 is the counterexample forbidding the unconditional assertion.

**Construction or proof.**

1. The opens whose preimage is quasicompact are stable under finite intersection; uniqueness of generic points holds since X/R is T0 by the previous node.
2. Existence of generic points: the preimages of the relevant opens are quasicompact opens, compact Hausdorff for the constructible topology, and all nonempty, so their intersection is nonempty.
3. X -> X/R is spectral by the basis hypothesis, and generalizing by the final paragraph of the proof of the previous node together with the generalizing hypothesis on t.
4. Open case: for U quasicompact open in X, t(s inverse of U) is a quasicompact R-invariant open, which is the preimage of the image of U, so X -> X/R is open; then reduce to X quasicompact and produce the required basis.

**Acceptance.**

- ECD Remark 2.8: taking X the Stone-Cech compactification of a compact Hausdorff space Y viewed as a discrete set, X is profinite, X -> Y is a continuous surjection and the induced R is closed, hence profinite, but Y is an arbitrary compact Hausdorff space.
- Applied in Proposition 11.24 and Corollary 11.28 to show |Y| is spectral for a spatial diamond.

**Direct prerequisites.** `mathlib:SpectralSpace`, `mathlib:QuasiSeparatedSpace`, `mathlib:IsSpectralMap`, `DiamondsAndVStacks:D0/pro-constructible-equivalence-relation`, `DiamondsAndVStacks:D0/constructible-topology-profinite`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, Lemma 2.9 with proof, pp. 12-13 — The first half.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, Lemma 2.10 with proof, p. 13 — The second half, which is the form used in sections 11 and 13.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, Remark 2.8, p. 12 — The exact assertion the roadmap text tells this layer not to get wrong..

**Theorem signature.** Proposed name `TauCeti.Diamonds.SpectralQuotientCriterion`; the full signature is explicitly omitted from declarations until its required interface can be stated. The ordinary categorical/topological carrier for this precise statement is not yet connected to the prototype (bounded ordinal subcategory assembly, coherent topoi/derived comparisons, or the groupoid-object and isomorphism-class stack interfaces). Build it from this node’s pinned categorical APIs and proof steps; there is no geometry assumed as an opaque predicate.
### cofiltered-limits-of-spectral-spaces — Cofiltered inverse limits of spectral spaces along spectral maps

**Theorem.** Let X_i, i in I, be a cofiltered inverse system of spectral spaces along spectral maps, with inverse limit X. Then X is spectral, the maps X -> X_i are spectral, and a map Y -> X from a spectral space is spectral if and only if all composites Y -> X_i are. If Y is a spectral space with a spectral map Y -> X such that all composites Y -> X_i are generalizing then Y -> X is generalizing; if in addition Y -> X is surjective then it is a quotient map.

Identifier: `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`.

**Hypotheses and conventions.**

- I cofiltered; all transition maps spectral. The generalizing statement uses Tychonoff for the constructible topologies.

**Construction or proof.**

1. Spectrality of the limit follows from the identification of spectral spaces with the pro-category of finite T0 spaces.
2. For the generalizing statement: replace Y by the localization at y; for each i the preimage in Y of the chosen generalization in X_i is a nonempty pro-constructible subset, and these form a cofiltered system, so the intersection is nonempty by Tychonoff applied to the constructible topology.
3. The final clause is the previous quotient-map lemma.

**Acceptance.**

- Spa of an inverse limit of affinoid perfectoid spaces has underlying space the inverse limit of the underlying spaces (ECD Proposition 6.5 and section 7); the acceptance test is that this is consistent.

**Direct prerequisites.** `mathlib:SpectralSpace`, `mathlib:IsSpectralMap`, `mathlib:CategoryTheory.IsCofiltered`, `mathlib:GeneralizingMap`, `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`, `DiamondsAndVStacks:D0/generalizing-surjection-is-quotient`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, Lemma 2.11 with proof, pp. 13-14 — The statement, with the generalizing addendum in the same lemma.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, proof of Lemma 2.11, p. 14 — The Tychonoff step..

**Theorem signature.** Proposed name `TauCeti.Diamonds.CofilteredLimitsOfSpectralSpaces`; a baseline-relative prototype is typed. The typed form is a baseline-relative specialization; the definitive target includes all hypotheses and auxiliary conclusions in the reader.
### pro-category-of-finite-t0-spaces — Pro-categories, and spectral spaces as the pro-category of finite T0 spaces

**Construction.** For a category C, the pro-category Pro(C) has as objects cofiltered diagrams in C and Hom(lim Y_i, lim Z_j) = lim_j colim_i Hom(Y_i, Z_j). The construction is needed in the generality of a small category C, with the variant Pro_kappa(C) of pro-systems whose index category is bounded by a cutoff cardinal kappa. The category of spectral spaces with spectral maps is equivalent to Pro(finite T0 spaces); equivalently every spectral space is an inverse limit of finite T0 spaces. Mathlib has Ind but no Pro at the pinned commit. Use Pro(C) = Ind(Cᵒᵖ)ᵒᵖ as the carrier. Flattening iterated pro-systems is a functor, not a claimed equivalence Pro(Pro(C)) ≃ Pro(C). The equivalence with spectral spaces uses finite T0 spaces and spectral maps, not arbitrary finite Hausdorff spaces.

Identifier: `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`.

Atlas planet: **Pro-category of finite T0 spaces**.

**Hypotheses and conventions.**

- C small, or at least essentially small on the relevant slices, which is how ECD uses it (X_et^aff is essentially small for a kappa-small X).
- Pro_kappa requires the cutoff cardinal, so the cutoff node is a prerequisite of the bounded variant only.

**Construction or proof.**

1. Define Pro(C) as (Ind(C^op))^op, or directly as cofiltered diagrams with the stated Hom formula, and prove the two agree.
2. Prove Pro(C) has all cofiltered limits and that the natural functor Pro(Pro(C)) -> Pro(C) exists, which is the step ECD uses to compose affinoid pro-etale maps in Lemma 7.11(i).
3. Prove the equivalence with spectral spaces by sending a spectral space to the system of its finite T0 quotients, using that the constructible topology is profinite.

**Uses that determine the API.**

- ECD Proposition 7.10: The category of affinoid pro-etale maps over an affinoid perfectoid X is Pro(X_et^aff); the kappa-small version is Pro_kappa(X_et^aff), so both the plain and the bounded pro-category are needed.
- ECD Lemma 7.11(i) and (iv): Composition of affinoid pro-etale maps is the functor Pro(Pro C) -> Pro C; existence of all small limits in X_pro-et^aff is existence of cofiltered limits in Pro(C) plus finite limits in C.
- ECD Definition 7.20 and Corollary 7.22: The purely topological classification of pro-etale maps over a strictly totally disconnected base is stated in the category of spectral spaces, which is this pro-category.

**Named API.**

- `CategoryTheory.Pro` (data): The pro-category of a category C, with objects cofiltered diagrams and the double-limit Hom formula.
- `CategoryTheory.Pro.mk` (constructor): A cofiltered diagram in C determines an object of Pro(C).
- `CategoryTheory.Pro.homEquiv` (universal-property): Hom_{Pro C}(lim Y_i, lim Z_j) is naturally lim_j colim_i Hom_C(Y_i, Z_j).
- `CategoryTheory.Pro.hasCofilteredLimits` (structure): Pro(C) has all cofiltered limits when C has finite limits, and the limit is computed by concatenating index categories.
- `CategoryTheory.Pro.flatten` (functoriality): Flatten a cofiltered system of pro-objects to its cofiltered limit in Pro(C); no equivalence with all of Pro(Pro(C)) is asserted.
- `CategoryTheory.Pro.equivProOp` (equivalence): Pro(C) is equivalent to the opposite of Ind(C^op), compatibly with Mathlib's Ind.
- `SpectralSpace.equivProFiniteTZero` (equivalence): The category of spectral spaces with spectral maps is equivalent to Pro(finite T0 spaces).
- `SpectralSpace.asProLimit` (characterisation): Every spectral space is canonically the inverse limit of its finite T0 spectral quotients.

**Unit tests.**

- `profinite_case` (compatibility): Pro(finite sets) is equivalent to the category of profinite sets, compatibly with Mathlib's Profinite.asLimit.
- `constant_diagram` (non-example): For the terminal category (one object and its identity morphism only), Pro(C) is equivalent to C. This assertion is not made for a general one-object monoid category.
- `spec_is_spectral` (non-example): Under the equivalence, Spec of a ring goes to the system of its finite T0 quotients; a construction that does not reproduce PrimeSpectrum's spectral structure is wrong.
- `hom_is_not_the_naive_limit` (non-example): For source and target the system of finite quotients ℤ/pⁿℤ representing ℤ_p, lim_j colim_i Hom contains the identity. An element of colim_i lim_j Hom factors through one finite source quotient and has finite image, so cannot represent that identity.

**Acceptance.**

- For C the category of finite sets, Pro(C) is the category of profinite sets; the equivalence restricts to the standard one.
- Pro(Pro(C)) -> Pro(C) is used in Lemma 7.11(i) and must exist for a general category C.

**Direct prerequisites.** `mathlib:CategoryTheory.Ind`, `mathlib:CategoryTheory.IsCofiltered`, `mathlib:CategoryTheory.Limits.HasLimits`, `mathlib:Profinite`, `mathlib:Profinite.asLimit`, `DiamondsAndVStacks:D0/constructible-topology-profinite`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, Theorem 2.2, p. 10 — The statement of the equivalence.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, Proposition 7.10 and proof of Lemma 7.11, pp. 33-34 — Why the general pro-category, and not only the profinite case, is needed..

**Signature refinement.** Instantiate the typed Pro.homEquiv with the inverse systems Z/p^n and connect their limit with the p-adic integer carrier. The limit-colimit order is already literal in the prototype; this arithmetic discrimination test is not instantiated.

The precise entries left out of the suggested declarations are `hom_is_not_the_naive_limit`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### hochster-realization — Hochster realization: every spectral space is the prime spectrum of a ring

**Theorem.** Let X be a topological space. The following are equivalent: X is spectral; there is a ring A with X homeomorphic to Spec A; X can be written as an inverse limit of finite T0 spaces. Mathlib proves that Spec A is spectral; the two remaining implications, in particular Hochster's realization of an arbitrary spectral space as a prime spectrum, are absent at the pinned commit and are what this node plans, with an actual ring or inverse-system construction and not an unproved representation axiom.

Identifier: `DiamondsAndVStacks:D0/hochster-realization`.

**Hypotheses and conventions.**

- The roadmap text for this layer explicitly requires the construction, not an axiom.
- The inverse-limit implication is the cheap one and is shared with the pro-category node; the ring construction is the substantial one.

**Construction or proof.**

1. Spec A spectral: Mathlib's instance on PrimeSpectrum.
2. Spectral implies inverse limit of finite T0 spaces: take the quotients of X by the equivalence relations generated by finitely many quasicompact opens.
3. Inverse limit of finite T0 spaces implies Spec of a ring: realize a finite T0 space as Spec of a finite ring, then realize the inverse limit as Spec of a filtered colimit of rings, using that Spec turns filtered colimits of rings into cofiltered limits of spectral spaces.

**Acceptance.**

- Spec of a field is a point; Spec of a discrete valuation ring is the Sierpinski space; the construction must produce these in the two-point cases.
- ECD uses this only through the equivalence with Pro(finite T0 spaces), so a continuation that proves only the inverse-limit half still serves sections 7 to 13.

**Direct prerequisites.** `mathlib:PrimeSpectrum`, `mathlib:SpectralSpace`, `mathlib:PrimeSpectrum.comap`, `mathlib:PrimeSpectrum.localization_comap_range`, `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, Theorem 2.2, p. 10 — The statement; ECD gives no proof and attributes it to Hochster..

**Theorem signature.** Proposed name `TauCeti.Diamonds.hochsterRealization`; a baseline-relative prototype is typed. The typed form is a baseline-relative specialization; the definitive target includes all hypotheses and auxiliary conclusions in the reader.
### profinite-presentation-of-compact-hausdorff — Profinite presentations of compact Hausdorff spaces and extremally disconnected covers

**Construction.** For a compact Hausdorff space T, the Stone-Cech compactification of the underlying discrete set of T is a profinite (indeed extremally disconnected) space S with a continuous surjection S -> T, and the induced equivalence relation R inside S x S is a closed subspace, hence profinite. Consequently every compact Hausdorff space is a quotient of a profinite set by a profinite equivalence relation. Mathlib has StoneCech, Stonean, the Stonean adjunction and the projective presentation of a compact Hausdorff object; what this node adds is the identification of the induced equivalence relation as profinite and the resulting presentation used in ECD Remark 2.8 and Example 11.12.

Identifier: `DiamondsAndVStacks:D0/profinite-presentation-of-compact-hausdorff`.

**Hypotheses and conventions.**

- T compact Hausdorff. The surjectivity of S -> T uses that T is compact Hausdorff and the universal property of the Stone-Cech compactification of a discrete set.
- The equivalence relation R = S x_T S is closed in S x S because T is Hausdorff.

**Construction or proof.**

1. Take S = beta(T_discrete), which is extremally disconnected, hence profinite.
2. The identity of T_discrete extends to a continuous map S -> T, which is surjective because its image is compact and contains T.
3. R = S x_T S is closed in S x S since T is Hausdorff, and a closed subspace of a profinite set is profinite.
4. Conclude S/R = T as topological spaces by the quotient-map lemma for a continuous surjection from a quasicompact space onto a compact Hausdorff space.

**Uses that determine the API.**

- ECD Remark 2.8: To show that the quotient of a spectral space by a pro-constructible equivalence relation with generalizing quasicompact projections need not be spectral.
- ECD Example 11.12: To show that T -> the v-sheaf sent to continuous maps into T is a fully faithful functor from compact Hausdorff spaces to diamonds, which is one of D4's required tests.
- ECD Proposition 13.12: To reduce a quasicompact separated diamond to a spatial one after pulling back along a profinite cover of its maximal Hausdorff quotient.

**Named API.**

- `CompHaus.profinitePresentation` (constructor): For T compact Hausdorff, a profinite S with a continuous surjection S -> T.
- `CompHaus.profinitePresentation_surjective` (characterisation): The structure map of the presentation is surjective.
- `CompHaus.profinitePresentation_rel` (structure): The induced equivalence relation S x_T S is a closed subspace of S x S, hence profinite.
- `CompHaus.profinitePresentation_isQuotientMap` (universal-property): T carries the quotient topology from S, so T is the coequalizer of the two projections of S x_T S in compact Hausdorff spaces.
- `CompHaus.profinitePresentation_of_stonean` (compatibility): The presentation may be taken with S extremally disconnected, agreeing with Mathlib's CompHaus.projectivePresentation.
- `Profinite.quotient_compHaus` (relation): Conversely, the quotient of a profinite set by a closed equivalence relation is compact Hausdorff.

**Unit tests.**

- `interval` (characterisation): The unit interval admits a profinite presentation; the induced relation is closed and the quotient recovers the interval.
- `profinite_case` (degenerate): If T is already profinite the identity is a presentation and the relation is the diagonal (the degenerate case).
- `not_every_quotient_is_profinite` (non-example): The quotient of a profinite set by a closed equivalence relation is in general only compact Hausdorff and not profinite (a non-example, which is the whole content of Remark 2.8).
- `agrees_with_mathlib_projective_presentation` (compatibility): The extremally disconnected presentation agrees with CompHaus.projectivePresentation composed with CompHaus.toProfinite.

**Acceptance.**

- For T = [0,1] this exhibits the unit interval as a quotient of a profinite set; ECD Remark 2.8 uses exactly this to show that quotients of spectral spaces need not be spectral, and Example 11.12 uses it to embed compact Hausdorff spaces into diamonds.

**Direct prerequisites.** `mathlib:StoneCech`, `mathlib:Stonean`, `mathlib:Stonean.stoneCechAdjunction`, `mathlib:CompHaus.projectivePresentation`, `mathlib:CompHaus.epi_iff_surjective`, `mathlib:CompHaus.toProfinite`, `mathlib:Profinite`, `DiamondsAndVStacks:D0/generalizing-surjection-is-quotient`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 2, Remark 2.8, p. 12 — The construction, verbatim.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Example 11.12, p. 58 — The same construction, reused to build the compact-Hausdorff diamonds that are a required test of D4..
### quasicompact-objects-in-a-topos — Quasicompact and quasiseparated objects and morphisms in a topos; algebraic topoi

**Definition.** Let T be a topos. An object X of T is quasicompact if every jointly surjective family of maps X_i -> X has a finite jointly surjective subfamily; X is quasiseparated if for all quasicompact Y, Z over X the fibre product is quasicompact; a map f : Y -> X is quasicompact if for all quasicompact Z over X the fibre product Z x_X Y is quasicompact, and quasiseparated if its diagonal is quasicompact. T is algebraic if there is a generating full subcategory C of qcqs objects, stable under fibre products, such that X -> * is quasiseparated for X in C. These are SGA 4 VI Definitions 1.1, 1.7, 1.13 and 2.3, recalled in ECD section 8; Mathlib has no such notions at the pinned commit.

Identifier: `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`.

Atlas planet: **Algebraic topos**.

**Hypotheses and conventions.**

- The object-level and map-level notions must be kept apart: if the final object is not quasiseparated, as for sheaves on Perfd, then X quasicompact is not equivalent to X -> * quasicompact. ECD warns about this explicitly and the roadmap text for this layer repeats the warning.
- The categories of small sheaves attached to large sites in ECD are not quite topoi, so the definitions must be stated for a category with the relevant colimits and pullbacks, not only for a genuine topos.

**Construction or proof.**

1. Define quasicompactness of an object by the finite-subcover condition on jointly surjective families.
2. Define quasiseparatedness of an object, and quasicompactness and quasiseparatedness of a map, as above.
3. Define an algebraic topos by the existence of a generating subcategory C as above; record the two one-directional implications X quasiseparated implies X -> * quasiseparated, and X -> * quasicompact implies X quasicompact, with the counterexamples showing the converses fail.

**Uses that determine the API.**

- ECD Proposition 8.3: The categories of small sheaves on Perfd for the pro-etale or v-topology, and on the pro-etale site of a perfectoid space, are algebraic with the affinoid perfectoid spaces as the generating subcategory.
- ECD Definition 10.7, Proposition 10.11, Definition 11.17 and Definition 12.12: Quasicompactness and quasiseparatedness of a v-sheaf are the defining conditions of spatial and locally spatial objects and the hypotheses of the v-local criteria.
- ECD Lemma 12.11 and Theorem 12.18: A quasicompact map which is surjective on points is a surjection of v-stacks: the statement is about the map-level notion.

**Named API.**

- `CategoryTheory.Sheaf.IsQuasicompact` (data): The predicate that an object of a category of sheaves is quasicompact.
- `CategoryTheory.Sheaf.IsQuasiseparated` (data): The predicate that an object is quasiseparated.
- `CategoryTheory.Sheaf.Hom.IsQuasicompact` (data): The predicate that a morphism is quasicompact, defined by pullback along maps from quasicompact objects.
- `CategoryTheory.Sheaf.Hom.isQuasiseparated_iff_diagonal` (characterisation): A morphism is quasiseparated exactly when its diagonal is quasicompact.
- `CategoryTheory.Sheaf.IsAlgebraic` (structure): The predicate that a category of sheaves is algebraic, packaged with the generating subcategory of qcqs objects.
- `CategoryTheory.Sheaf.isQuasiseparated_iff_of_cover` (characterisation): In an algebraic setting the conditions may be checked after pullback to one cover by objects of the generating subcategory (SGA 4 VI Corollaries 1.17, 2.6 and 2.8).
- `CategoryTheory.Sheaf.isQuasicompact_of_isQuasicompact_terminal` (relation): If X -> * is quasicompact then X is quasicompact; the converse fails.
- `CategoryTheory.Sheaf.Hom.isQuasicompact_comp` (functoriality): Quasicompact and quasiseparated morphisms are stable under composition and base change.

**Unit tests.**

- `perfectoid_space` (characterisation): A perfectoid space is quasicompact, respectively quasiseparated, as a v-sheaf exactly when its underlying topological space is (ECD Proposition 8.3).
- `final_object_not_quasiseparated` (non-example): For sheaves on Perfd the final object is not quasiseparated, so 'X quasicompact' and 'X -> * quasicompact' must not be defined by the same predicate (a non-example).
- `finite_coproduct` (non-example): A finite coproduct of quasicompact sheaves is quasicompact; an infinite coproduct of noninitial sheaves is not quasicompact.
- `agrees_with_topological_qcqs` (characterisation): For sheaves on a topological space, the notions agree with quasicompactness and quasiseparatedness of the corresponding open set.

**Acceptance.**

- For sheaves on Perfd with the v-topology the final object is not quasiseparated, and the two notions genuinely differ: this is ECD's warning on p. 41 and is a required non-example.
- For the topos of sheaves on a spectral space, its terminal object is qcqs; object and terminal-map qc/qs notions agree. Merely having a terminal object in a site does not ensure this.

**Direct prerequisites.** `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.Limits.HasLimits`, `mathlib:CategoryTheory.Precoherent`, `mathlib:CategoryTheory.coherentTopology`, `mathlib:CategoryTheory.EffectiveEpiFamily`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, recollection of SGA 4 VI, p. 40 — The definition of a quasicompact object, with ECD's own reference.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, p. 40 — The definition of an algebraic topos and the standing hypothesis of ECD sections 8 to 13.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, warning, p. 41 — The distinction this node must record and which every later qcqs statement depends on.; [sga4vi](https://pi.math.cornell.edu/~dkmiller/bin/sga4-2.pdf), VI Definitions 1.1, 1.7, 1.13 and 2.3; Corollaires 1.17, 2.6, 2.8 — Precise qc/qs conventions and generating-basis detection, with proofs read; objects and morphisms are kept distinct..

**Signature refinement.** Connect the typed sheaf-object qc/qs predicates to the geometric perfectoid Yoneda objects and to opens in a topological sheaf topos. The big-site final-object warning needs the size-bounded sheaf model. The typed finite-coproduct test states only the finite clause; the noninitial infinite clause is not yet typed.

The precise entries left out of the suggested declarations are `perfectoid_space`, `final_object_not_quasiseparated`, `finite_coproduct`, `agrees_with_topological_qcqs`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### cutoff-cardinal — Existence of a cofinal class of cutoff cardinals

**Theorem.** There is a cofinal class of uncountable cardinals kappa such that: for all cardinals lambda < kappa one has 2^lambda < kappa, so kappa is a strong limit; for all countable sequences of cardinals less than kappa the supremum is less than kappa, so the cofinality of kappa is larger than omega; and for all lambda < kappa there is a strong limit cardinal kappa_lambda < kappa whose cofinality is larger than lambda. Such kappa are automatically cofinal among the kappa_lambda for lambda < kappa.

Identifier: `DiamondsAndVStacks:D0/cutoff-cardinal`.

Atlas planet: **Cutoff cardinal**.

**Hypotheses and conventions.**

- No large cardinal axiom and no universe is used; the proof is a transfinite construction of the beth hierarchy inside ZFC.
- The third clause is what makes bounded unions of bounded families admissible, and is the clause ECD uses in Lemma 11.22 and Lemma 12.17 to bound limits.

**Construction or proof.**

1. Show first that for any cardinal lambda there is a strong limit cardinal of cofinality larger than lambda: build the beth hierarchy by transfinite induction and take beth_mu for mu of cofinality larger than lambda.
2. Build a sequence kappa(0), kappa(1), ... indexed by ordinals, with kappa(0) a strong limit of uncountable cofinality, kappa(mu) for a successor a strong limit of cofinality larger than kappa(mu-), and unions at limits.
3. For mu of uncountable cofinality, kappa(mu) satisfies all three conditions; these are cofinal in the cardinals.

**Acceptance.**

- Beth_omega is a strong limit of cofinality omega, so it fails condition (ii): the second clause is not automatic.
- The intuitive reading recorded by ECD: one may always take power sets and countable unions, and any construction taking fewer than kappa steps on objects of size uniformly bounded below kappa.

**Direct prerequisites.** `mathlib:Cardinal`, `mathlib:Cardinal.mk`, `mathlib:Cardinal.IsStrongLimit`, `mathlib:Ordinal`, `mathlib:Cardinal.beth`, `mathlib:Ordinal.cof`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 4, Lemma 4.1 with proof, pp. 19-20 — The statement of the node; ECD's proof is reproduced in the steps.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 4, discussion after Lemma 4.1, pp. 19-20 — The working form of the lemma, which is how every later smallness argument uses it..

**Theorem signature.** Proposed name `TauCeti.Diamonds.CutoffCardinal`; a baseline-relative prototype is typed. The typed form is a baseline-relative specialization; the definitive target includes all hypotheses and auxiliary conclusions in the reader.
### completion-cardinality-bound — Cardinality of a completion with a bounded dense subset

**Lemma.** Let κ be an uncountable strong-limit cardinal of uncountable cofinality and λ an infinite cardinal less than κ. If a Hausdorff first-countable topological group has a dense subset A of cardinality at most λ, then its separated completion has cardinality at most λ^ℵ₀ ≤ 2^λ < κ: each point is a limit of a sequence in A. Finite λ is handled separately (a finite dense subset of a Hausdorff space is closed); no false bound λ^ℵ₀ ≤ 2^λ for arbitrary finite λ is used.

Identifier: `DiamondsAndVStacks:D0/completion-cardinality-bound`.

**Hypotheses and conventions.**

- Hausdorff first-countable topological group and its separated completion
- λ is infinite and λ < κ
- κ is uncountable strong limit with uncountable cofinality

**Construction or proof.**

1. Choose from a countable neighbourhood basis a sequence of dense-set elements converging to each completion point. Hausdorffness gives uniqueness of limits, hence the cardinal bound by the set of sequences.
2. For infinite λ, ℵ₀ ≤ λ and λ^ℵ₀ ≤ (2^λ)^ℵ₀ = 2^λ. Apply the strong-limit inequality.
3. A finite dense subset in a Hausdorff space is the whole space; this is a separate finite case.

**Acceptance.**

- ECD applies this with A a perfectoid Tate ring and A_0 a dense subalgebra: the application is in D2 and P6, not here.
- Without first countability the bound fails, so the hypothesis cannot be dropped.

**Direct prerequisites.** `mathlib:Cardinal`, `mathlib:Cardinal.power_le_power_left`, `mathlib:UniformSpace.Completion`, `mathlib:FirstCountableTopology`, `mathlib:Cardinal.IsStrongLimit`, `DiamondsAndVStacks:D0/cutoff-cardinal`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 4, Remark 4.3, p. 20 — The counting argument, stated here in the conditional form the roadmap text demands..

**Theorem signature.** Proposed name `TauCeti.Diamonds.CompletionCardinalityBound`; a baseline-relative prototype is typed. The typed form is a baseline-relative specialization; the definitive target includes all hypotheses and auxiliary conclusions in the reader.
### filtered-colimits-and-cohomology-on-coherent-sites — Filtered colimits of abelian sheaves and their cohomology on an algebraic topos

**Theorem.** Let (C, J) be a site with a generating full subcategory of qcqs objects stable under fibre products, so that the category of sheaves is algebraic. Then for a filtered diagram of abelian sheaves F_j the colimit is computed sectionwise on qcqs objects, and for every qcqs object X and every i the natural map colim_j H^i(X, F_j) -> H^i(X, colim_j F_j) is an isomorphism. The same holds for sheaves of sets and of groups in degrees 0, respectively 0 and 1.

Identifier: `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`.

**Hypotheses and conventions.**

- Quasicompactness and quasiseparatedness of X are both needed: quasicompactness for degree zero and quasiseparatedness to control the Cech terms.
- Mathlib has the abelian structure on sheaves, exactness of sheafification and the Ext-theoretic definition of sheaf cohomology, but not this comparison.

**Construction or proof.**

1. Sectionwise computation on qcqs objects: the sheaf condition on a qcqs object involves only finitely many terms in each degree, so it commutes with filtered colimits.
2. The cohomology statement: reduce to Cech cohomology of covers by objects of the generating subcategory using the Cech-to-derived spectral sequence, then pass to the filtered colimit of Cech complexes.
3. SGA VI 5.4: on a generating qc basis stable under fibre products, finite-cover Čech complexes commute with filtered colimits; filtered colimits of basis-acyclic sheaves stay basis-acyclic. Dimension shifting gives VI 5.2. ECD 22.12 is a consumer, not an extra theorem here.

**Acceptance.**

- This is exactly the mechanism by which ECD proves Proposition 8.2: cohomology does not depend on the cutoff cardinal.
- The statement fails without quasicompactness: an infinite disjoint union of points is a non-example.

**Direct prerequisites.** `mathlib:CategoryTheory.sheafIsAbelian`, `mathlib:CategoryTheory.presheafToSheaf`, `mathlib:CategoryTheory.Sheaf.cohomologyPresheaf`, `mathlib:CategoryTheory.IsFiltered`, `mathlib:CategoryTheory.Limits.HasFilteredColimits`, `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, proof of Proposition 8.2, pp. 39-40 — The statement in the exact form ECD needs, and the degree ranges for sets, groups and abelian groups.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, proof of Proposition 8.2, p. 40 — The proof, which is why the Cech-to-derived comparison is a prerequisite.; [sga4vi](https://pi.math.cornell.edu/~dkmiller/bin/sga4-2.pdf), VI Corollaire 5.2 and Lemma 5.4 — Filtered-colimit cohomology is proved by finite-cover Čech acyclicity and exact filtered colimits, not asserted for every topological site..

**Theorem signature.** Proposed name `TauCeti.Diamonds.FilteredColimitsAndCohomologyOnCoherentSites`; the full signature is explicitly omitted from declarations until its required interface can be stated. The ordinary categorical/topological carrier for this precise statement is not yet connected to the prototype (bounded ordinal subcategory assembly, coherent topoi/derived comparisons, or the groupoid-object and isomorphism-class stack interfaces). Build it from this node’s pinned categorical APIs and proof steps; there is no geometry assumed as an opaque predicate.
### cech-to-derived-comparison — Cech-to-derived spectral sequence, Leray spectral sequence, and the acyclic-basis comparison

**Theorem.** For a site (C, J), a cover of an object X and an abelian sheaf F there is a spectral sequence from the Cech cohomology of the cover with coefficients in the presheaves H^q(F) converging to H^{p+q}(X, F). For a morphism of sites f there is a Leray spectral sequence H^p(X, R^q f_* F) converging to H^{p+q}(Y, F). If B is a basis of the site consisting of objects on which F is acyclic and on which the covers of the site can be refined by covers by objects of B, then Cech cohomology computed on B agrees with sheaf cohomology. Mathlib has the Cech complex functor and Ext-theoretic sheaf cohomology, but none of these three comparisons.

Identifier: `DiamondsAndVStacks:D0/cech-to-derived-comparison`.

**Hypotheses and conventions.**

- The acyclic-basis comparison needs a basis stable under the fibre products used in the Cech nerve, which is exactly the generating subcategory of the algebraic topos.
- ECD applies all three only through their formal consequences; no finiteness is assumed.

**Construction or proof.**

1. Construct the Cech-to-derived spectral sequence from the filtration of an injective resolution by the Cech nerve of the cover.
2. Construct the Leray spectral sequence as the Grothendieck spectral sequence of the composite of global sections and pushforward, using that pushforward preserves injectives.
3. Deduce the acyclic-basis comparison by induction on degree from the Cech-to-derived spectral sequence and the vanishing of the higher presheaves on B.

**Acceptance.**

- ECD uses the Cech-to-sheaf spectral sequence by name in the proof of Proposition 8.8 and of Proposition 8.2.
- Degenerate case: for a cover by a single isomorphism the Cech-to-derived spectral sequence degenerates to the identity.

**Direct prerequisites.** `mathlib:CategoryTheory.Sheaf.cohomologyPresheaf`, `mathlib:CategoryTheory.cechComplexFunctor`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.EnoughInjectives`, `mathlib:CategoryTheory.IsGrothendieckAbelian`, `mathlib:CategoryTheory.SpectralSequence`, `mathlib:CategoryTheory.Abelian.SpectralObject`, `mathlib:CategoryTheory.sheafIsAbelian`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, proof of Proposition 8.8, p. 43 — ECD's use of the Cech-to-derived spectral sequence by name, in the proof of the v-acyclicity theorem that D2 owns.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, Proposition 8.5(iii) and its proof, pp. 41-42 — The acyclic-basis pattern: acyclicity is proved on a basis of affinoids and transported to the site..

**Theorem signature.** Proposed name `TauCeti.Diamonds.CechToDerivedComparison`; the full signature is explicitly omitted from declarations until its required interface can be stated. The ordinary categorical/topological carrier for this precise statement is not yet connected to the prototype (bounded ordinal subcategory assembly, coherent topoi/derived comparisons, or the groupoid-object and isomorphism-class stack interfaces). Build it from this node’s pinned categorical APIs and proof steps; there is no geometry assumed as an opaque predicate.
### stackification — Stackification of a groupoid-valued prestack and its universal property

**Construction.** Let (C, J) be a site and F a prestack on C, that is, a functor from C^op to groupoids, equivalently a pseudofunctor into Cat with groupoid values. There is a stack F^+ with a map F -> F^+ that is universal among maps to stacks: composition with it is an equivalence between the category of maps F^+ -> G and the category of maps F -> G, for every stack G. Mathlib at the pinned commit has DescentData, IsPrestack, IsStack and the comparison functor to descent data, but no stackification; this node plans only the stackification and its universal property and reuses the pinned descent API for everything else.

Identifier: `DiamondsAndVStacks:D0/stackification`.

Atlas planet: **Stackification**.

**Hypotheses and conventions.**

- F is required only to be a prestack, not a stack; the universal property is a 2-categorical one and must be stated as an equivalence of categories of morphisms, not a bijection.
- The pinned Mathlib IsStack is stated for a pseudofunctor from LocallyDiscrete C^op to Cat, which is the shape the construction should produce.

**Construction or proof.**

1. For a general groupoid-valued pseudofunctor, first quotient locally equal morphisms, then glue morphisms; this sheafifies its Hom-presheaves. When the pinned IsPrestack holds this step is already done. Mathlib sheafHom describes the existing Hom-sheaf; it is not itself a construction of a new prestack.
2. Then add objects: F^+(X) is the colimit over covers R of X of the categories of descent data F.DescentData for R, which is Mathlib's DescentData.
3. Prove the filtered-colimit structure on covers using the pullback functors and the equivalences pullFunctorEquivalence and exists_equivalence_of_sieve_eq of the pinned library.
4. Prove F^+ is a stack and verify the universal property against the pinned IsStack.

**Uses that determine the API.**

- ECD Definition 9.1 and Proposition 9.3, 9.6, 9.7: Each descent statement is the assertion that a specific prestack is a stack; the stackification is what gives the ambient category in which the assertion is a comparison of two objects.
- ECD Definition 12.4 and section 10: Small v-stacks are stacks for the v-topology, and morphisms of v-stacks are defined by pullback, which needs the ambient 2-category of stacks with 2-fibre products.
- DiamondsAndVStacks:D4: Quotients of groupoids in v-sheaves are formed as the stackification of the naive quotient prestack, which is how a quotient with genuine stabilizers is kept apart from its sheaf of isomorphism classes.

**Named API.**

- `CategoryTheory.Functor.stackification` (data): The associated stack of a prestack for a Grothendieck topology.
- `CategoryTheory.Functor.toStackification` (constructor): The canonical map from a prestack to its stackification.
- `CategoryTheory.Functor.isStack_stackification` (instance): The stackification is a stack, in the sense of the pinned IsStack class.
- `CategoryTheory.Functor.stackificationUniversal` (universal-property): For every stack G, composition with the canonical map is an equivalence of categories of morphisms from the stackification to G and from the prestack to G.
- `CategoryTheory.Functor.stackification_isLocallyBijective` (characterisation): The canonical map is locally essentially surjective and locally fully faithful.
- `CategoryTheory.Functor.stackification_of_isStack` (compatibility): If the prestack is already a stack the canonical map is an equivalence.
- `CategoryTheory.Functor.stackification_discrete` (compatibility): On a discrete prestack coming from a presheaf of sets, stackification is Mathlib's sheafification.

**Unit tests.**

- `sheafification_agreement` (characterisation): For a prestack with discrete fibres the stackification is the sheafification of the corresponding presheaf of sets.
- `already_a_stack` (degenerate): If F is a stack the unit is an equivalence (the degenerate case).
- `classifying_stack_has_automorphisms` (non-example): Stackification of the one-object groupoid prestack with automorphism sheaf a nontrivial G is BG. It retains G as automorphisms of the trivial torsor; the sheaf of isomorphism classes would erase them.
- `torsor_isomorphism_classes` (non-example): For the prestack of G-torsors the sheaf of isomorphism classes of the stackification is the sheafification of the presheaf of isomorphism classes; equality before sheafification is a non-example.

**Acceptance.**

- For F a sheaf of sets viewed as a discrete prestack, stackification is sheafification, and must agree with Mathlib's presheafToSheaf.
- For the prestack of torsors under a sheaf of groups, the stackification is the stack of torsors, and its isomorphism classes on X form the sheafification of the presheaf of non-abelian H^1.

**Direct prerequisites.** `mathlib:CategoryTheory.Pseudofunctor.DescentData`, `mathlib:CategoryTheory.Pseudofunctor.IsPrestack`, `mathlib:CategoryTheory.Pseudofunctor.IsStack`, `mathlib:CategoryTheory.Pseudofunctor.toDescentData`, `mathlib:CategoryTheory.Pseudofunctor.sheafHom`, `mathlib:CategoryTheory.presheafToSheaf`, `mathlib:CategoryTheory.Pseudofunctor`, `mathlib:CategoryTheory.Groupoid`, `mathlib:CategoryTheory.Pseudofunctor.StrongTrans`, `mathlib:CategoryTheory.Pseudofunctor.StrongTrans.Modification`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 9, Definition 9.1, p. 44 — ECD's own definition of descent data and of what it means to be a stack, which is what the pinned Mathlib API already provides and what stackification must be universal for.; [stacks-stackification](https://stacks.math.columbia.edu/tag/02ZM), Section 8.8 (Tag 02ZM), Lemmas 8.8.1–8.8.3; Tag 02ZP, Lemma 8.9.1 — Actual construction by Hom-sheafification and adjoining descent objects, with equivalence of morphism categories. ECD only supplies the motivating descent use..

**Signature refinement.** State local essential surjectivity and Hom sheafification for the actual strong-transformation unit, then connect the groupoid-object and torsor examples. The universal equivalence and discrete-presheaf agreement are typed. The SingleObj group calculation is only the objectwise automorphism calculation, not a constructed classifying stack.

The precise entries left out of the suggested declarations are `CategoryTheory.Functor.stackification_isLocallyBijective`, `classifying_stack_has_automorphisms`, `torsor_isomorphism_classes`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### groupoid-quotients-and-two-fibre-products — Two-fibre products of stacks and quotients of groupoid objects

**Construction.** For maps of stacks G_1 -> G_3 and G_2 -> G_3 the 2-fibre product is the stack sending X to the groupoid of triples (a, b, iso) with a in G_1(X), b in G_2(X) and an isomorphism of their images; it is a stack and has the expected 2-universal property. For a groupoid object (X, R) in sheaves, with source and target maps s, t : R -> X, the quotient stack is the stackification of the objectwise groupoid prestack with objects X(T) and arrows R(T); its stackification has locally trivial R-torsors as objects; it comes with a map X -> [X/R] and an equivalence R = X x_{[X/R]} X, and its sheaf of isomorphism classes is the sheafification of X/R. The isomorphism-class sheaf and the quotient stack must be kept apart until the absence of automorphisms has been proved.

Identifier: `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`.

**Hypotheses and conventions.**

- A 2-fibre product is not a 1-categorical fibre product: taking the strict fibre product in Cat, which Mathlib provides through Cat.HasLimits, gives the wrong answer unless one of the maps is an isofibration.
- The comparison R = X x_{[X/R]} X requires the groupoid axioms and holds as stated; it is the abstract form of ECD Proposition 11.3(ii).

**Construction or proof.**

1. Define the 2-fibre product objectwise and check the stack condition from the stack conditions of the three inputs.
2. Define the objectwise groupoid prestack with objects X(T) and arrows R(T), and stackify it. Its objects are then locally trivial R-torsors; do not discard the arrows.
3. Prove X -> [X/R] is a surjection of stacks and R = X x_{[X/R]} X.
4. Prove that the sheaf of isomorphism classes of [X/R] is the sheafification of the naive quotient presheaf, and that [X/R] is a sheaf exactly when the stabilizers are trivial.

**Uses that determine the API.**

- ECD Proposition 11.3: Every property of a diamond X/R is proved through the identification R = X x_Y X and the independence of the presentation.
- ECD Definition 12.4, Proposition 12.7, Definition 12.8: The underlying topological space of a small v-stack is defined from a presentation Y = X/R with R a small v-sheaf and a surjection from a diamond onto R.
- ECD Definition 10.12 and Lemma 10.13: A group action defines a groupoid quotient retaining stabilizers; a torsor is the free-action case. The classifying stack of GL_n(Q_p) is the introductory example.

**Named API.**

- `CategoryTheory.Stack.twoFibreProduct` (data): The 2-fibre product of two maps of stacks over a common target.
- `CategoryTheory.Stack.twoFibreProduct_isStack` (instance): The 2-fibre product of stacks is a stack.
- `CategoryTheory.Stack.twoFibreProductUniversal` (universal-property): Its 2-universal property: maps into it are triples consisting of two maps and a 2-isomorphism between their composites.
- `CategoryTheory.Stack.quotient` (constructor): The quotient stack of a groupoid object in sheaves: stackify the objectwise groupoid of X(T) and R(T); the result classifies locally trivial R-torsors.
- `CategoryTheory.Stack.quotient_pullback` (characterisation): R is the 2-fibre product of X with itself over the quotient stack.
- `CategoryTheory.Stack.quotient_isoClasses` (relation): The sheaf of isomorphism classes of the quotient stack is the sheafification of the naive quotient presheaf.
- `CategoryTheory.Stack.quotient_isSheaf_iff` (characterisation): The quotient stack is a sheaf exactly when all stabilizers are trivial.
- `CategoryTheory.Stack.quotient_descent` (equivalence): Objects and morphisms over the quotient stack are objects and morphisms over X with descent data along R.

**Unit tests.**

- `free_discrete_quotient` (characterisation): For a free action of a discrete group the quotient stack is the sheaf quotient.
- `classifying_stack` (non-example): For X the final object and R a sheaf of nontrivial groups G, the quotient is BG, which is not a sheaf and has automorphism sheaf G.
- `strict_pullback_is_wrong` (non-example): The strict fibre product of categories differs from the 2-fibre product already for two points mapping to the same object of a groupoid with a nontrivial automorphism (a non-example).
- `iso_classes_needs_sheafification` (non-example): For a G-torsor P with no global section, stackification of the action groupoid P/G has a global object, while the objectwise quotient has no global section. Its sheafification supplies the missing section.

**Acceptance.**

- For R the graph of a free action of a discrete group G on X, [X/R] is the sheaf quotient X/G.
- For X the final object and R = G a sheaf of nontrivial groups, [X/R] = BG has automorphism group G at every point and is not a sheaf: this is the test that distinguishes the two constructions.
- ECD Proposition 11.3(ii) and Proposition 12.3 are the instances used later.

**Direct prerequisites.** `mathlib:CategoryTheory.Pseudofunctor.IsStack`, `mathlib:CategoryTheory.Pseudofunctor.DescentData`, `mathlib:CategoryTheory.Pseudofunctor`, `mathlib:CategoryTheory.Bicategory`, `mathlib:CategoryTheory.Cat.HasLimits.limitCone`, `mathlib:CategoryTheory.Groupoid`, `DiamondsAndVStacks:D0/stackification`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Proposition 11.3(ii) and (iii), p. 54 — The two facts about groupoid quotients that this node states abstractly and D4 instantiates.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 12, Definition 12.4 and Proposition 12.3, pp. 69-70 — The definition that presupposes 2-fibre products of v-stacks and the quotient presentation.; [stacks-stackification](https://stacks.math.columbia.edu/tag/02ZM), Tag 04Y1 and Tag 044O, Definition 78.20.1 — Stackification preserves 2-fibre products. The quotient construction is the objectwise groupoid followed by stackification; its generalization from algebraic spaces to sheaves uses only the stated groupoid/descent axioms..

**Signature refinement.** The actual TwoFibreObject and pseudofunctor product are typed. Still define the groupoid object in sheaves, its quotient pseudofunctor and atlas transformations, and the category of maps with invertible modifications needed for the universal property. The SingleObj example computes the product objectwise; it does not construct the sheaf quotient or BG.

The precise entries left out of the suggested declarations are `CategoryTheory.Stack.twoFibreProductUniversal`, `CategoryTheory.Stack.quotient`, `CategoryTheory.Stack.quotient_pullback`, `CategoryTheory.Stack.quotient_isoClasses`, `CategoryTheory.Stack.quotient_isSheaf_iff`, `CategoryTheory.Stack.quotient_descent`, `free_discrete_quotient`, `classifying_stack`, `iso_classes_needs_sheafification`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### inverse-spectral-topology — Hochster dual topology

**Construction.** For a spectral space X, the inverse topology is generated by complements of qc opens of X. It is spectral, has the same constructible topology, and reverses specialization; applying the operation twice recovers the original topology. Maps are spectral for the original topologies iff spectral for the inverse topologies.

Identifier: `DiamondsAndVStacks:D0/inverse-spectral-topology`.

**Hypotheses and conventions.**

- Spectral X and Y

**Construction or proof.**

1. Identify qc opens with a bounded distributive lattice L. The inverse topology corresponds to Lᵒᵖ under prime-filter duality.
2. Use finite distributive sublattices and their finite T0 spectra to obtain compactness and sobriety. Constructible clopens are unchanged; specialization is reversed.

**Uses that determine the API.**

- KL15 §8.1 and spectral quotient arguments: Distinguish patch closedness from inverse-topology closedness.

**Named API.**

- `Spectral.inverseTopology` (constructor): Topology generated by complements of qc opens.
- `Spectral.inverseTopology_spectral` (instance): The inverse topology on a spectral space is spectral.
- `Spectral.inverseTopology_inverse` (compatibility): Double inverse topology equals the original topology.
- `Spectral.inverseTopology_specializes` (characterisation): x specializes to y in the inverse topology iff y specializes to x originally.

**Unit tests.**

- `inverse_discrete_finite` (computation): A finite discrete space is unchanged.
- `inverse_sierpinski` (computation): On the two-point Sierpiński space the open singleton switches points.
- `inverse_patch_unchanged` (compatibility): The constructible topology is unchanged.

**Acceptance.**

- A finite discrete space is unchanged.
- On the two-point Sierpiński space the open singleton switches points.
- The constructible topology is unchanged.

**Direct prerequisites.** `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`, `DiamondsAndVStacks:D0/constructible-topology-profinite`.

**Sources.** [kl15](https://arxiv.org/pdf/1301.0792), Definition 8.1.4 — The inverse topology target, distinct from ring realization..
### spectral-components-profinite — Profinite connected-component space

**Theorem.** For a spectral space X, ConnectedComponents X with the quotient topology is profinite. Its clopens correspond exactly to clopens of X; the component of x is the intersection of all clopen neighbourhoods of x.

Identifier: `DiamondsAndVStacks:D0/spectral-components-profinite`.

Atlas planet: **Profinite component space**.

**Hypotheses and conventions.**

- Spectral X

**Construction or proof.**

1. Compactness passes to the quotient. Separate distinct components using clopens: in a qc spectral space quasi-components equal components, proved by the finite-T0 inverse presentation.
2. Clopen separation proves Hausdorffness and total disconnectedness of the quotient; use the patch compactness proof only to establish existence of the separating finite partition.

**Acceptance.**

- For a spectral space X, ConnectedComponents X with the quotient topology is profinite. Its clopens correspond exactly to clopens of X; the component of x is the intersection of all clopen neighbourhoods of x.

**Direct prerequisites.** `mathlib:ConnectedComponents`, `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`, `DiamondsAndVStacks:D0/constructible-topology-profinite`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Proof of Lemma 7.2, connected components paragraph — Supplies the profiniteness input used but not previously stated..

**Theorem signature.** Proposed name `TauCeti.Diamonds.SpectralComponentsProfinite`; a baseline-relative prototype is typed. The typed form is a baseline-relative specialization; the definitive target includes all hypotheses and auxiliary conclusions in the reader.
### spectral-submersion — Spectral submersions

**Definition.** A spectral submersion is a surjective spectral map f:X→Y of spectral spaces such that, for every subset U⊆Y, if f⁻¹(U) is qc open then U is open. It is weaker than an ordinary submersion (Mathlib Topology.IsQuotientMap). Equivalently it suffices to test constructible U; surjectivity and patch compactness then also imply qc of U.

Identifier: `DiamondsAndVStacks:D0/spectral-submersion`.

Atlas planet: **Spectral submersion**.

**Hypotheses and conventions.**

- Spectral X and Y

**Construction or proof.**

1. Reuse IsQuotientMap for ordinary submersions. Define the extra spectral predicate with the explicit qc-open antecedent.
2. Spectral surjections are quotient maps for patch topologies; thus f⁻¹(U) constructible implies U constructible. Apply the constructible test.

**Uses that determine the API.**

- Arc Proposition 2.17; ECD quotient warnings: Pass the qc-open condition through limits without claiming arbitrary-open descent.

**Named API.**

- `IsSpectralSubmersion` (constructor): Surjectivity, spectrality and descent of qc-openness.
- `IsSpectralSubmersion.iff_constructible` (characterisation): Test descent of openness on constructible subsets of the target.
- `IsSpectralSubmersion.of_quotient` (compatibility): A surjective spectral quotient map is a spectral submersion.
- `IsSpectralSubmersion.comp` (functoriality): Composites of spectral submersions are spectral submersions.

**Unit tests.**

- `spectral_submersion_identity` (degenerate): The identity on every spectral space is a spectral submersion.
- `spectral_submersion_generalizing` (compatibility): A surjective generalizing spectral map is a spectral submersion.
- `spectral_submersion_not_arbitrary_quotient` (non-example): The inverse-limit map of Arc Remark 2.18 is a spectral submersion and fails to be an ordinary quotient map.

**Acceptance.**

- The identity on every spectral space is a spectral submersion.
- A surjective generalizing spectral map is a spectral submersion.
- The inverse-limit map of Arc Remark 2.18 is a spectral submersion and fails to be an ordinary quotient map.

**Direct prerequisites.** `mathlib:IsSpectralMap`, `mathlib:Topology.IsQuotientMap`, `DiamondsAndVStacks:D0/constructible-topology-profinite`.

**Sources.** [arc](https://arxiv.org/pdf/1807.04725v4), Definitions 2.14–2.15 — The qc-open and constructible criteria; no arbitrary-open quotient claim..

**Signature refinement.** Instantiate the valuation-ring tower of Arc Remark 2.18 as a spectral TopCat diagram and prove the non-open saturated subset has open inverse image. The spectral-submersion predicate and the identity/generalizing cases are typed.

The precise entries left out of the suggested declarations are `spectral_submersion_not_arbitrary_quotient`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### spectral-submersions-under-limits — Limits of spectral submersions

**Theorem.** Let f_i:X_i→Y_i be a morphism of small cofiltered diagrams of spectral spaces and spectral transition maps. If every f_i is a spectral submersion then lim f_i is a spectral submersion. The ordinary quotient-map property is not preserved in this statement: Arc Remark 2.18 supplies an inverse system of ordinary submersions whose limit is not a submersion.

Identifier: `DiamondsAndVStacks:D0/spectral-submersions-under-limits`.

**Hypotheses and conventions.**

- Small cofiltered diagram; all transition maps spectral

**Construction or proof.**

1. Surjectivity follows by compactness in the patch topologies. A qc open upstairs descends to a finite stage; patch clopen descent and surjectivity identify the candidate subset downstairs at a sufficiently late stage.
2. Apply the constructible criterion there, and pull back its open subset.
3. Retain the Remark 2.18 example using a valuation ring of infinite rank and its finite-rank truncations: the punctured subset at the limit has open inverse image but is not open.

**Acceptance.**

- Let f_i:X_i→Y_i be a morphism of small cofiltered diagrams of spectral spaces and spectral transition maps. If every f_i is a spectral submersion then lim f_i is a spectral submersion. The ordinary quotient-map property is not preserved in this statement: Arc Remark 2.18 supplies an inverse system of ordinary submersions whose limit is not a submersion.

**Direct prerequisites.** `DiamondsAndVStacks:D0/spectral-submersion`, `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`.

**Sources.** [arc](https://arxiv.org/pdf/1807.04725v4), Lemma 2.17 and Remark 2.18 — The limit theorem and the counterexample are both acceptance requirements..

**Theorem signature.** Proposed name `TauCeti.Diamonds.SpectralSubmersionsUnderLimits`; a baseline-relative prototype is typed. The typed form is a baseline-relative specialization; the definitive target includes all hypotheses and auxiliary conclusions in the reader.
### ordinal-assembly-of-cofiltered-diagrams — Ordinal assembly of cofiltered limits

**Construction.** Every small cofiltered category with uncountably many objects and arrows, of cardinality λ, is an increasing union of cofiltered subcategories I_α (α<λ), each of cardinality at most max(ℵ₀,|α|), after closing a chosen enumeration under identities, compositions and finite cones. For a countable cofiltered category one constructs a cofinal sequence of cone choices. For any diagram F with the indicated limits, lim_I F ≅ lim_α lim_{I_α} F. This is cardinal induction via ordinal chains of subdiagrams, not the false claim that every cofiltered category admits a cofinal ordinal chain.

Identifier: `DiamondsAndVStacks:D0/ordinal-assembly-of-cofiltered-diagrams`.

**Hypotheses and conventions.**

- Small cofiltered category; chosen enumeration of objects and arrows
- For uncountable λ use subcategories, not necessarily full subcategories

**Construction or proof.**

1. Close each initial enumerated set by countably many steps adding compositions and witnesses for finite cones; union at limit stages. Closure does not increase infinite cardinality.
2. All arrows eventually occur, so compatible cones on the subcategories are exactly cones on I; deduce the displayed limit isomorphism by its universal property.
3. For countable I enumerate all objects, arrows and finite coherence problems and successively choose dominating cones; prove cofinality, not just objectwise dominance.
4. Apply transfinite induction on cardinality in ECD 11.22–11.23 and 12.17 using this decomposition.

**Uses that determine the API.**

- ECD 11.22, 11.23, 12.17: Justifies proving permanence by finite and ordinal limits plus induction on diagram cardinality.

**Named API.**

- `Cofiltered.ordinalAssembly` (constructor): An enumerated increasing family of small cofiltered subcategories covering all objects and arrows.
- `Cofiltered.ordinalAssembly_cardinal` (data): Each proper initial stage has the stated smaller cardinal bound.
- `Cofiltered.limit_ordinalAssembly` (universal-property): The limit over I is the ordinal limit of the subdiagram limits.

**Unit tests.**

- `ordinal_countable_sequence` (computation): For I=ℕᵒᵖ, the countable construction can be the identity sequence.
- `ordinal_terminal_diagram` (degenerate): A terminal indexing category has its one-stage limit.
- `ordinal_union_cones` (characterisation): A compatible family of cones on the subcategories determines a unique cone on their union.

**Acceptance.**

- For I=ℕᵒᵖ, the countable construction can be the identity sequence.
- A terminal indexing category has its one-stage limit.
- A compatible family of cones on the subcategories determines a unique cone on their union.

**Direct prerequisites.** `mathlib:CategoryTheory.IsCofiltered`, `mathlib:CategoryTheory.Limits.HasLimits`, `mathlib:Ordinal`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Proofs of Propositions 11.22, 11.23 and 12.17 — Explicates the compressed ordinal reduction without an invalid blanket cofinality assertion..

**Signature refinement.** Package subcategories allowing restricted arrow sets (not full subcategories), their increasing ordinal chain, exhaustive union of objects and arrows, and the cardinal bounds. A bare ordinal cofinal replacement of every small cofiltered category would be false.

The precise entries left out of the suggested declarations are `Cofiltered.ordinalAssembly`, `Cofiltered.ordinalAssembly_cardinal`, `Cofiltered.limit_ordinalAssembly`, `ordinal_countable_sequence`, `ordinal_terminal_diagram`, `ordinal_union_cones`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### constant-sheaf-on-irreducible-space — Flasque constant sheaves

**Theorem.** For an irreducible topological space X and an abelian group A, the constant sheaf has sections A on every nonempty open and the zero group on the empty open. All restriction maps are surjective, so it is flasque and H^i(X,A_X)=0 for i>0. A spectral space with a generic point is such an X.

Identifier: `DiamondsAndVStacks:D0/constant-sheaf-on-irreducible-space`.

**Hypotheses and conventions.**

- Irreducible X; abelian group A

**Construction or proof.**

1. Every pair of nonempty opens intersects, so every locally constant function is constant.
2. The restriction maps are identities between nonempty opens, and maps to the zero group when the target is empty; hence flasqueness.
3. Use the ordinary flasque-acyclicity comparison for sheaf cohomology, within D0’s ordinary sites.

**Acceptance.**

- For an irreducible topological space X and an abelian group A, the constant sheaf has sections A on every nonempty open and the zero group on the empty open. All restriction maps are surjective, so it is flasque and H^i(X,A_X)=0 for i>0. A spectral space with a generic point is such an X.

**Direct prerequisites.** `mathlib:CategoryTheory.Sheaf.cohomologyPresheaf`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`.

**Sources.** [stacks-02uw](https://stacks.math.columbia.edu/tag/02UW), Lemma 20.20.2 — Used for the fibres with a generic point in ECD 13.13..

**Theorem signature.** Proposed name `TauCeti.Diamonds.ConstantSheafOnIrreducibleSpace`; the full signature is explicitly omitted from declarations until its required interface can be stated. The ordinary categorical/topological carrier for this precise statement is not yet connected to the prototype (bounded ordinal subcategory assembly, coherent topoi/derived comparisons, or the groupoid-object and isomorphism-class stack interfaces). Build it from this node’s pinned categorical APIs and proof steps; there is no geometry assumed as an opaque predicate.
### coherent-topos-limit-cohomology — Cohomology of limits of coherent topoi

**Theorem.** Let (E_i) be a small cofiltered diagram of coherent topoi with coherent transition morphisms, E its topos limit and p_i:E→E_i. Fix i and an abelian sheaf F_i, and put F=p_i^*F_i. For every n≥0 the canonical colim_{j→i} H^n(E_j,p_{ji}^*F_i) → H^n(E,F) is an isomorphism. More generally allow compatible filtered systems of sheaves as in SGA VI 8.7.7. Coherence supplies the filtered-colimit compatibility of derived direct images required by VI 8.7.1.

Identifier: `DiamondsAndVStacks:D0/coherent-topos-limit-cohomology`.

**Hypotheses and conventions.**

- Small cofiltered diagram
- Coherent topoi and coherent transition morphisms
- Sheaf descends from a stage or compatible system as in VI 8.7.7

**Construction or proof.**

1. Construct the limit site from coherent objects coming from stages, with finite covers detected after refinement.
2. SGA VI 8.7.2–8.7.6 prove the derived-direct-image formula on the limit; verify their filtered-colimit hypotheses via VI 5.1.
3. Apply VI 8.7.7 to the morphism to the point and the stage sheaf. ECD 14.9 uses this result; its diamond-site theorem remains DiamondEtaleCohomology’s.

**Acceptance.**

- Let (E_i) be a small cofiltered diagram of coherent topoi with coherent transition morphisms, E its topos limit and p_i:E→E_i. Fix i and an abelian sheaf F_i, and put F=p_i^*F_i. For every n≥0 the canonical colim_{j→i} H^n(E_j,p_{ji}^*F_i) → H^n(E,F) is an isomorphism. More generally allow compatible filtered systems of sheaves as in SGA VI 8.7.7. Coherence supplies the filtered-colimit compatibility of derived direct images required by VI 8.7.1.

**Direct prerequisites.** `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`.

**Sources.** [sga4vi](https://pi.math.cornell.edu/~dkmiller/bin/sga4-2.pdf), VI 8.7.1–8.7.7, especially Corollaire 8.7.7 — Exact hypotheses and cohomology comparison, not a general theorem about arbitrary topos limits.; [ecd](https://arxiv.org/pdf/1709.07343v4), Proof of Proposition 14.9 — Consumer of this ordinary coherent-topos theorem..

**Theorem signature.** Proposed name `TauCeti.Diamonds.CoherentToposLimitCohomology`; the full signature is explicitly omitted from declarations until its required interface can be stated. The ordinary categorical/topological carrier for this precise statement is not yet connected to the prototype (bounded ordinal subcategory assembly, coherent topoi/derived comparisons, or the groupoid-object and isomorphism-class stack interfaces). Build it from this node’s pinned categorical APIs and proof steps; there is no geometry assumed as an opaque predicate.
### ordinary-sheaves-on-profinite-sets — Ordinary sheaves on profinite sets

**Theorem.** For a profinite set S, ordinary Set- or Ab-valued sheaves are equivalent to contravariant functors on the Boolean algebra of clopens sending the empty set to the terminal object and finite disjoint unions to products. For S=βI (I discrete), clopens identify with subsets of I. For a family of sets or abelian groups A_i, the sheaf J↦∏_{i∈J} A_i has stalk at an ultrafilter U equal to colim_{J∈U}∏_{i∈J}A_i, the ordinary ultraproduct; stalk isomorphisms detect sheaf isomorphisms. No infinity-categorical extension or hypercompletion theorem is asserted here.

Identifier: `DiamondsAndVStacks:D0/ordinary-sheaves-on-profinite-sets`.

**Hypotheses and conventions.**

- S profinite; ordinary Set or Ab coefficients
- For the ultrafilter formula, I is discrete

**Construction or proof.**

1. Clopens form a basis; compactness refines every cover of a clopen to a finite partition. Basis-sheaf comparison gives the equivalence.
2. Identify βI with the ultrafilter Stone space and its clopens with P(I); the neighbourhoods of U are J∈U.
3. Compute the stalk by the filtered neighbourhood colimit; the equivalence relation identifies sections that agree on a U-large set, which is the ultraproduct. Use enough topological points for conservativity.

**Acceptance.**

- For a profinite set S, ordinary Set- or Ab-valued sheaves are equivalent to contravariant functors on the Boolean algebra of clopens sending the empty set to the terminal object and finite disjoint unions to products. For S=βI (I discrete), clopens identify with subsets of I. For a family of sets or abelian groups A_i, the sheaf J↦∏_{i∈J} A_i has stalk at an ultrafilter U equal to colim_{J∈U}∏_{i∈J}A_i, the ordinary ultraproduct; stalk isomorphisms detect sheaf isomorphisms. No infinity-categorical extension or hypercompletion theorem is asserted here.

**Direct prerequisites.** `mathlib:StoneCech`, `mathlib:Profinite`, `mathlib:CategoryTheory.Sheaf`, `DiamondsAndVStacks:D0/profinite-presentation-of-compact-hausdorff`.

**Sources.** [arc](https://arxiv.org/pdf/1807.04725v4), §3, profinite sheaves and ultrafilter stalks (ordinary specialization) — Only ordinary sheaves are owned here; categorical-valued infinity-theorems route outward to EnhancedDerivedSheaves..

**Theorem signature.** Proposed name `TauCeti.Diamonds.OrdinarySheavesOnProfiniteSets`; the full signature is explicitly omitted from declarations until its required interface can be stated. The ordinary categorical/topological carrier for this precise statement is not yet connected to the prototype (bounded ordinal subcategory assembly, coherent topoi/derived comparisons, or the groupoid-object and isomorphism-class stack interfaces). Build it from this node’s pinned categorical APIs and proof steps; there is no geometry assumed as an opaque predicate.

**Stage acceptance.** The definitions, API and discriminating tests above cover every target of D0. Every prerequisite chain ends at the pinned baseline, an exact foreign node, a supplier request or an explicit gap. The following work is required before closing the stage:

- Hochster realization has no proof in the source
- Signature refinement: instantiate and state the explicitly omitted API/tests of DiamondsAndVStacks:D0/locally-spectral-space, DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces, DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos, DiamondsAndVStacks:D0/stackification, DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, DiamondsAndVStacks:D0/spectral-submersion, DiamondsAndVStacks:D0/ordinal-assembly-of-cofiltered-diagrams. See signatureCoverage for each name, statement and required interface; prove no implementations here.
- Named theorem signatures: supply the carrier/interface and state DiamondsAndVStacks:D0/pro-constructible-equivalence-relation, DiamondsAndVStacks:D0/spectral-quotient-criterion, DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites, DiamondsAndVStacks:D0/cech-to-derived-comparison, DiamondsAndVStacks:D0/constant-sheaf-on-irreducible-space, DiamondsAndVStacks:D0/coherent-topos-limit-cohomology, DiamondsAndVStacks:D0/ordinary-sheaves-on-profinite-sets. Their exact mathematical statements and proposed names are in signatureCoverage.namedTargets and the suggested comment ledger.

## D1 — Totally disconnected perfectoid spaces

The covering spaces are built from PerfectoidSpaces’ perfectoid affinoids, rational localization and pro-étale limit calculus. The hierarchy of totally disconnected, w-local, w-strictly local and strictly totally disconnected spaces controls different splitting statements; these predicates are kept separate. W-localization supplies pro-étale covers for descent, while the universally open strictly totally disconnected cover supplies the stronger topology needed for spatiality.

**Target coverage.** The eleven nodes cover ECD 7.1 to 7.7 and 7.12 to 7.23 completely: totally disconnected spaces, Fargues' splitting criterion, the structure of the connected components and affinoidness, w-local and w-strictly local spaces, pro-constructible generalizing subsets, the w-localization with its two auxiliary lemmas, strictly totally disconnected spaces, the universally open cover of 7.18, the fibrewise criterion of 7.19, the purely topological classification of 7.20 to 7.22, and automatic flatness.

### totally-disconnected-perfectoid-space — Totally disconnected perfectoid spaces

**Definition.** A perfectoid space X is totally disconnected if X is qcqs and every open cover of X splits, that is, for every open cover {U_i} of X the map from the disjoint union of the U_i to X admits a section. These are the analogues of profinite sets in the perfectoid setting. The name refers to the connected components of |X|, which are the fibres of the projection to the profinite set pi_0(X) and are of the form Spa(K, K^+); it does not say that |X| is a totally disconnected topological space.

Identifier: `DiamondsAndVStacks:D1/totally-disconnected-perfectoid-space`.

Atlas planet: **Totally disconnected perfectoid space**.

**Hypotheses and conventions.**

- X is required to be qcqs; without quasicompactness the splitting condition is vacuous on the pieces of an infinite disjoint union and the structure theory fails.
- The condition is on open covers, not on etale covers: the etale version is the strictly totally disconnected condition of ECD 7.15, which is strictly stronger.

**Construction or proof.**

1. Define the predicate on a perfectoid space by qcqs plus the splitting condition on open covers.
2. Record that the condition passes to closed subsets, by adding the open complement to the given cover, and to open and closed subsets.
3. Record the equivalent purely topological condition on the underlying spectral space through the characterisation node.

**Uses that determine the API.**

- ECD Proposition 7.23 and Proposition 9.3: Automatic flatness and effective descent of affinoid perfectoid spaces are stated over a totally disconnected base; every v-descent argument first replaces the base by such a space.
- ECD Proposition 10.5 and Corollary 10.6: Sub-v-sheaves of a totally disconnected perfectoid space are ind-representable, which is how closed immersions and quasicompact injections of v-sheaves are recognised.
- ECD Theorem 8.7 and Proposition 8.8: The v-sheaf property of O and the higher v-acyclicity are reduced to the totally disconnected case by the w-localization.

**Named API.**

- `IsTotallyDisconnectedPerfectoid` (data): The predicate on a perfectoid space: qcqs, and every open cover splits.
- `IsTotallyDisconnectedPerfectoid.qcqs` (projection): A totally disconnected perfectoid space is quasicompact and quasiseparated.
- `IsTotallyDisconnectedPerfectoid.splitting` (characterisation): A chosen splitting of any given open cover.
- `IsTotallyDisconnectedPerfectoid.isClosed` (structure): The condition passes to closed subspaces.
- `IsTotallyDisconnectedPerfectoid.isAffinoid` (structure): A totally disconnected perfectoid space is affinoid (ECD 7.5).
- `IsTotallyDisconnectedPerfectoid.pi0` (data): The projection to the profinite set of connected components.
- `IsTotallyDisconnectedPerfectoid.fibre_eq_spa` (characterisation): Each fibre of that projection is Spa(K, K^+) for a perfectoid field K and an open bounded valuation subring.
- `IsTotallyDisconnectedPerfectoid.of_components` (constructor): Conversely a qcqs perfectoid space all of whose connected components have that form is totally disconnected.

**Unit tests.**

- `point` (characterisation): Spa(K, K^+) with K perfectoid and K^+ an open bounded valuation subring is totally disconnected.
- `finite_disjoint_union` (non-example): A finite disjoint union of totally disconnected perfectoid spaces is totally disconnected; an infinite one is not (the degenerate case and a non-example).
- `perfectoid_ball_is_not` (non-example): The perfectoid closed unit disc over an algebraically closed C is qcqs but not totally disconnected, since it is connected with more than one closed point.
- `agrees_with_profinite` (non-example): For X = S x Spa(C, O_C) with S profinite, X is totally disconnected and pi_0(X) = S; a definition that does not recover S is wrong.

**Acceptance.**

- Spa(K, K^+) for a perfectoid field K and an open bounded valuation subring K^+ is totally disconnected and connected.
- A disjoint union of finitely many such is totally disconnected; an infinite disjoint union is not, since it is not quasicompact.

**Direct prerequisites.** `mathlib:SpectralSpace`, `mathlib:ConnectedComponents`, `mathlib:Profinite`, `DiamondsAndVStacks:D0/locally-spectral-space`, `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, Definition 7.1, p. 29 — The definition, verbatim..

**Signature refinement.** Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.

The precise entries left out of the suggested declarations are `IsTotallyDisconnectedPerfectoid.isClosed`, `IsTotallyDisconnectedPerfectoid.isAffinoid`, `IsTotallyDisconnectedPerfectoid.pi0`, `IsTotallyDisconnectedPerfectoid.fibre_eq_spa`, `IsTotallyDisconnectedPerfectoid.of_components`, `point`, `finite_disjoint_union`, `perfectoid_ball_is_not`, `agrees_with_profinite`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### split-cover-characterisation — Fargues' characterisation of spectral spaces all of whose open covers split

**Theorem.** Let X be a spectral space. The following are equivalent: every open cover of X splits; every connected component of X has a unique closed point; the global sections functor on sheaves on X is exact, that is, commutes with all finite colimits; the global sections functor on sheaves of abelian groups is exact; H^i(X, F) = 0 for all abelian sheaves F and all i > 0; H^1(X, F) = 0 for all abelian sheaves F. The result is due to L. Fargues.

Identifier: `DiamondsAndVStacks:D1/split-cover-characterisation`.

Atlas planet: **Fargues' splitting criterion**.

**Hypotheses and conventions.**

- X spectral. The equivalence of the last four conditions is formal; the substance is (i) equivalent to (ii) and (iv) implies (i).
- Recall that every nonempty spectral space has at least one closed point, by Zorn and the nonemptiness of cofiltered limits of nonempty spectral spaces.

**Construction or proof.**

1. (i) implies (ii): the splitting condition passes to closed subsets, so assume X connected; two distinct closed points x, y give the cover (X minus x) and (X minus y) with no splitting.
2. (ii) implies (i): for a cover {U_i}, each component X_c lies in some U_i since it contains its unique closed point, so there is a clopen U_c inside U_i; pi_0 X is profinite, so refine to a finite disjoint clopen cover and assemble the local splittings.
3. (i) implies (iii): global sections commutes with coequalizers, because sections of the sheaves can be found after a cover which then splits.
4. (iv) implies (i): for a finite quasicompact open cover the map from the direct sum of the extensions by zero of Z on U_i onto Z is surjective, hence surjective on global sections by (iv); the resulting locally constant functions f_i with supports inside U_i summing to 1 produce the splitting.

**Acceptance.**

- For X = Spa(K, K^+) the unique closed point is the one given by K^+ itself, and the conclusion is the vanishing of sheaf cohomology used throughout ECD sections 8 and 9.
- The equivalence with (vi) alone is the form used to check the condition in practice.

**Direct prerequisites.** `mathlib:SpectralSpace`, `mathlib:CategoryTheory.Sheaf.cohomologyPresheaf`, `mathlib:ConnectedComponents`, `mathlib:Profinite`, `DiamondsAndVStacks:D0/constructible-topology-profinite`, `DiamondsAndVStacks:D1/totally-disconnected-perfectoid-space`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, Lemma 7.2 with proof, pp. 29-30 — The statement, with the attribution to Fargues recorded by ECD.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, remark before the proof of Lemma 7.2, p. 30 — The auxiliary fact needed for the proof..

**Theorem signature.** Proposed name `TauCeti.Diamonds.SplitCoverCharacterisation`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.
### components-of-totally-disconnected — Connected components of a totally disconnected perfectoid space, and affinoidness

**Theorem.** Let X be a totally disconnected perfectoid space. There is a continuous projection to the profinite set pi_0(X) of connected components, and every fibre is of the form Spa(K, K^+) for a perfectoid field K with an open and bounded valuation subring K^+. Conversely a qcqs perfectoid space all of whose connected components have this form is totally disconnected. Moreover X is affinoid.

Identifier: `DiamondsAndVStacks:D1/components-of-totally-disconnected`.

**Hypotheses and conventions.**

- X totally disconnected. For the converse the hypothesis is on all connected components; a qcqs perfectoid space with some component of this form need not be totally disconnected.

**Construction or proof.**

1. The projection to pi_0 exists because |X| is spectral. A connected component of a spectral space is an intersection of clopen subsets, so connected components of qcqs perfectoid spaces are again perfectoid spaces.
2. By the splitting criterion X has a unique closed point on each component; a qcqs perfectoid space with a unique closed point x equals Spa(K(x), K(x)^+) by the description of injections and completed residue fields.
3. Affinoidness: for c in pi_0 X the unique closed point x_c has an affinoid neighbourhood U containing the whole component; a quasicompactness argument in the constructible topology gives a clopen V in pi_0 X with the preimage of V inside U, so that preimage is affinoid; finitely many disjoint such V cover pi_0 X.

**Acceptance.**

- Spa(K, K^+) is its own unique component. For X = S x Spa(C, O_C) the projection is the first projection.
- The affinoidness statement is what makes every later argument able to write X = Spa(R, R^+).

**Direct prerequisites.** `mathlib:ConnectedComponents`, `mathlib:Profinite`, `mathlib:SpectralSpace`, `DiamondsAndVStacks:D1/split-cover-characterisation`, `DiamondsAndVStacks:D0/constructible-topology-profinite`, `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`, `DiamondsAndVStacks:D0/spectral-components-profinite`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, Lemma 7.3 with proof, pp. 30-31 — Statement and converse.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, Lemma 7.5 with proof, p. 31 — The affinoidness, whose proof is the quasicompactness argument recorded in the steps..

**Theorem signature.** Proposed name `TauCeti.Diamonds.ComponentsOfTotallyDisconnected`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.
### w-local-and-w-strictly-local — w-local and w-strictly local perfectoid spaces

**Definition.** A perfectoid space X is w-local if its underlying topological space is a w-local spectral space, equivalently if X is qcqs, every open cover splits, and the subset X^c of closed points is closed. A w-local perfectoid space is in particular totally disconnected. A perfectoid space is w-strictly local if it is w-local and for every x the completed residue field K(x) is algebraically closed; a w-strictly local space is in particular strictly totally disconnected. These strengthenings have little further relevance in ECD, which works with the totally disconnected and strictly totally disconnected notions.

Identifier: `DiamondsAndVStacks:D1/w-local-and-w-strictly-local`.

**Hypotheses and conventions.**

- The extra condition over total disconnectedness is exactly the closedness of the set of closed points.
- ECD states plainly that the stronger notions will have little relevance, so a continuation should not invest in them beyond what the w-localization functor needs.

**Construction or proof.**

1. Define w-locality of a spectral space by the splitting condition plus closedness of the set of closed points.
2. Define a w-local perfectoid space by this condition on its underlying space, and record that it implies total disconnectedness.
3. Define w-strictly local by adding that every completed residue field is algebraically closed, and record that it implies strict total disconnectedness.

**Uses that determine the API.**

- ECD Proposition 7.12: The w-localization X^wl is the universal w-local space over X, so the class must exist before the adjunction can be stated.
- ECD Theorem 8.7 and Proposition 8.8: The w-localization is the affinoid pro-etale cover along which v-descent of functions and the almost vanishing of higher cohomology are proved.
- ECD Lemma 7.18: The universally open strictly totally disconnected cover is built differently precisely because the w-localization is not universally open; the two constructions must be distinguishable.

**Named API.**

- `IsWLocalSpectralSpace` (data): A spectral space in which every open cover splits and the set of closed points is closed.
- `IsWLocalPerfectoid` (data): A perfectoid space whose underlying space is w-local.
- `IsWLocalPerfectoid.isTotallyDisconnected` (relation): A w-local perfectoid space is totally disconnected.
- `IsWLocalPerfectoid.isClosed_closedPoints` (projection): The set of closed points is closed.
- `IsWStrictlyLocalPerfectoid` (data): A w-local perfectoid space all of whose completed residue fields are algebraically closed.
- `IsWStrictlyLocalPerfectoid.isStrictlyTotallyDisconnected` (relation): A w-strictly local space is strictly totally disconnected.

**Unit tests.**

- `w_local_implies_totally_disconnected` (characterisation): Every w-local perfectoid space is totally disconnected.
- `totally_disconnected_not_w_local` (non-example): A totally disconnected perfectoid space whose set of closed points is not closed is a non-example, so the two predicates must not be defeq.
- `w_localization_is_w_local` (characterisation): X^wl is w-local for every qcqs perfectoid X (the construction test).
- `w_strictly_local_of_algebraically_closed` (degenerate): For C algebraically closed, Spa(C, C^+) is w-strictly local (the degenerate one-component case).

**Acceptance.**

- X^wl for X affinoid perfectoid is w-local by construction, which is the only source of examples used later.

**Direct prerequisites.** `mathlib:SpectralSpace`, `mathlib:IsClosed`, `DiamondsAndVStacks:D1/totally-disconnected-perfectoid-space`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, Definition 7.4, p. 30 — The definition.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, Definition 7.17 and the remark before it, p. 36 — The strict variant and ECD's own assessment of its relevance..

**Signature refinement.** Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.

The precise entries left out of the suggested declarations are `IsWLocalPerfectoid.isTotallyDisconnected`, `IsWLocalPerfectoid.isClosed_closedPoints`, `IsWStrictlyLocalPerfectoid.isStrictlyTotallyDisconnected`, `w_local_implies_totally_disconnected`, `totally_disconnected_not_w_local`, `w_localization_is_w_local`, `w_strictly_local_of_algebraically_closed`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### pro-constructible-generalizing-subsets-are-affinoid — Pro-constructible generalizing subsets of a totally disconnected space are affinoid perfectoid

**Lemma.** Let X be a totally disconnected perfectoid space and U a pro-constructible generalizing subset of |X|. Then U is an intersection of subsets of the form {|f| at most 1} for f in H^0(X, O_X). In particular U carries a natural structure of affinoid perfectoid space, which is again totally disconnected. In particular every quasicompact open subset of X is affinoid.

Identifier: `DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`.

**Hypotheses and conventions.**

- X totally disconnected; U pro-constructible and generalizing. A finite intersection of sets {|f| at most 1} inside an affinoid perfectoid space is a rational subset; an infinite intersection is a cofiltered limit of affinoid perfectoids, hence affinoid perfectoid.
- The generalizing hypothesis is essential: a pro-constructible subset that is not generalizing is not of this form.

**Construction or proof.**

1. For x outside U lying in the component c, the fibres X_c and U_c are Spa(K_c, K_c^+) and Spa(K_c, (K_c^+)') for open bounded valuation subrings K_c^+ inside (K_c^+)'.
2. Choose f_c in (K_c^+)' minus K_c^+, lift it modulo K_c^+ to a function f_V on the preimage of a clopen neighbourhood V of c, and use quasicompactness of the constructible topology to shrink V so that U meets the preimage of V inside {|f_V| at most 1}.
3. Extend f_V by zero to get f on X with |f| at most 1 on U and |f(x)| > 1; intersect over x outside U.
4. Total disconnectedness of U: every component of U is the intersection of a component Spa(K_c, K_c^+) of X with U, hence of the form Spa(K_c, (K_c^+)').

**Acceptance.**

- Remark 7.7: in particular any quasicompact open subset of X is affinoid, which is used in almost every later argument.
- Applied in Lemma 7.19, Proposition 10.5, Proposition 11.30 and Proposition 13.12.

**Direct prerequisites.** `mathlib:Topology.IsConstructible`, `mathlib:StableUnderGeneralization`, `DiamondsAndVStacks:D0/pro-constructible-subsets`, `DiamondsAndVStacks:D1/components-of-totally-disconnected`, `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`, `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, Lemma 7.6 and Remark 7.7 with proof, pp. 31-32 — The statement and Remark 7.7 on quasicompact opens..

**Theorem signature.** Proposed name `TauCeti.Diamonds.ProConstructibleGeneralizingSubsetsAreAffinoid`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.
### w-localization — The w-localization functor and its pro-etale presentation

**Construction.** The inclusion of the category of w-local perfectoid spaces with w-local maps into the category of qcqs perfectoid spaces admits a right adjoint X maps to X^wl, and the adjunction map X^wl -> X is pro-etale. If X is affinoid then X^wl -> X is an inverse limit of surjective maps of the form a finite disjoint union of rational subsets U_i -> X, and in particular affinoid pro-etale. The underlying space is the w-localization of the spectral space |X|, with pi_0(X^wl) = |X|_cons and the component over x the localization X_x, and O^+ on X^wl is the varpi-adic completion of the pullback of O^+_X. The component X_x consists of generalizations of x. The source says “left adjoint” but its final-object universal property and counit X^wl → X have the right-adjoint direction. The inclusion of w-local spaces with w-local maps is not full; no counit isomorphism for every already-w-local X is asserted.

Identifier: `DiamondsAndVStacks:D1/w-localization`.

Atlas planet: **w-localization**.

**Hypotheses and conventions.**

- X qcqs; the affinoid case is proved first and glued by the open-subspace lemma below.
- The construction is not universally open: ECD says so explicitly, which is why the separate cover of 7.18 is needed.

**Construction or proof.**

1. Take the w-localization |X|^wl of the spectral space |X| and equip it with O^+ the varpi-adic completion of the pullback of O^+_X, and O obtained by inverting varpi.
2. Affinoid case: with B the basis of rational subsets, let C be the category of factorizations X^wl -> T -> X with T a finite disjoint union of members of B; C is cofiltered and the natural map X^wl -> lim_C T is a homeomorphism (ECD Lemma 7.13), proved by showing it is bijective and generalizing and applying the quotient-map lemma.
3. Each such T is naturally an affinoid perfectoid space etale over X, so lim_C T is affinoid pro-etale over X and equals X^wl on O and O^+ by direct verification.
4. General case: for U a quasicompact open subset of a spectral space X, U^wl -> X^wl is a quasicompact open embedding, and an open cover of X by quasicompact opens induces an open cover of X^wl (ECD Lemma 7.14); glue.

**Uses that determine the API.**

- ECD Theorem 8.7: The proof of the v-sheaf property of O reduces to a totally disconnected base by base changing along X^wl -> X, using that pro-etale descent is already known.
- ECD Proposition 8.8: The Cech complex of the affinoid pro-etale cover X^wl -> X is almost exact, which starts the induction proving higher v-acyclicity.
- ECD Lemma 7.18: The construction is contrasted with the universally open cover: X^wl -> X is pro-etale and surjective but not universally open, so it cannot be used where universal openness is needed.

**Named API.**

- `Perfectoid.wLocalization` (data): The w-localization X^wl of a qcqs perfectoid space.
- `Perfectoid.wLocalization.toBase` (data): The adjunction map X^wl -> X.
- `Perfectoid.wLocalization.isWLocal` (instance): X^wl is w-local.
- `Perfectoid.wLocalization.adjunction` (universal-property): Hom_wlocal(W, X^wl) ≅ Hom_qcqs(W, X), naturally, with counit X^wl → X; the left functor forgets the restriction to w-local maps.
- `Perfectoid.wLocalization.isProEtale` (characterisation): The adjunction map is pro-etale, and affinoid pro-etale when X is affinoid.
- `Perfectoid.wLocalization.pi0` (compatibility): pi_0(X^wl) is |X| with the constructible topology, and the component over x is the localization of |X| at x.
- `Perfectoid.wLocalization.isOpenEmbedding` (functoriality): For U a quasicompact open subset of X, U^wl -> X^wl is a quasicompact open embedding, and quasicompact open covers induce open covers.
- `Perfectoid.wLocalization.surjective` (characterisation): The adjunction map is surjective, hence a v-cover.

**Unit tests.**

- `already_w_local` (non-example): For a one-point Spa(C,O_C), the counit is an isomorphism. Already-w-local spaces with more than one specialization point need not have this property.
- `point_with_valuation_ring` (non-example): For the one-point space Spa(C,O_C), w-localization is the same point. For w-local spaces with several specialization points, π₀(X^wl) = |X|_cons and the counit need not be an isomorphism.
- `pi0_is_constructible_topology` (non-example): pi_0(X^wl) is |X| with its constructible topology; a construction that returns |X| with its own topology is wrong.
- `not_universally_open` (non-example): X^wl -> X is not universally open in general, so it must not be confused with the cover of ECD 7.18 (a non-example).

**Acceptance.**

- pi_0(X^wl) = |X|_cons, and the connected component of X^wl at x is the localization X_x; points of X^wl are pairs (x, y) with y a generalization of x.
- For the one-point rank-one geometric space Spa(C,O_C), the counit is an isomorphism. For valuation subrings C⁺ with several specialization points, the counit need not be an isomorphism.

**Direct prerequisites.** `mathlib:SpectralSpace`, `mathlib:WithConstructibleTopology`, `mathlib:UniformSpace.Completion`, `DiamondsAndVStacks:D0/generalizing-surjection-is-quotient`, `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`, `DiamondsAndVStacks:D1/w-local-and-w-strictly-local`, `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`, `DiamondsAndVStacks:D0/spectral-components-profinite`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, Proposition 7.12 with proof, pp. 33-35 — The statement of the construction.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, proof of Lemma 7.13, p. 34 — The explicit description of the underlying space, which the construction must reproduce.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, Lemma 7.14 with proof, pp. 35-36 — The gluing lemma that reduces the general case to the affinoid one..

**Signature refinement.** Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.

The precise entries left out of the suggested declarations are `Perfectoid.wLocalization`, `Perfectoid.wLocalization.toBase`, `Perfectoid.wLocalization.isWLocal`, `Perfectoid.wLocalization.adjunction`, `Perfectoid.wLocalization.isProEtale`, `Perfectoid.wLocalization.pi0`, `Perfectoid.wLocalization.isOpenEmbedding`, `Perfectoid.wLocalization.surjective`, `already_w_local`, `point_with_valuation_ring`, `pi0_is_constructible_topology`, `not_universally_open`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### strictly-totally-disconnected — Strictly totally disconnected perfectoid spaces

**Definition.** A perfectoid space X is strictly totally disconnected if it is qcqs and every etale cover of X splits. A qcqs perfectoid space is strictly totally disconnected if and only if every connected component is of the form Spa(C, C^+) with C algebraically closed and C^+ an open and bounded valuation subring.

Identifier: `DiamondsAndVStacks:D1/strictly-totally-disconnected`.

**Hypotheses and conventions.**

- The condition is on etale covers rather than open covers; it implies total disconnectedness but is strictly stronger.
- The characterisation uses that finite etale covers of Spa(K, K^+) come from finite extensions of K, so K must be algebraically closed.

**Construction or proof.**

1. Define the predicate by qcqs plus splitting of etale covers, and record that the condition passes to closed subsets.
2. Necessity: reduce to X connected, so X = Spa(K, K^+); if K is not algebraically closed, a finite extension L gives a nonsplit finite etale cover Spa(L, L^+) -> Spa(K, K^+).
3. Sufficiency: by the structure theorem X is totally disconnected; an etale cover of a component Spa(C, C^+) splits, and the splitting extends to a neighbourhood by the finite-stage descent of qcqs etale objects, so the etale cover is locally split and can be refined by an open cover, which splits.

**Uses that determine the API.**

- ECD Definition 10.1(i): Quasi-pro-etale morphisms are defined by testing against strictly totally disconnected perfectoid spaces, so the class is the test class of the whole theory.
- ECD Proposition 9.6 and Proposition 9.7: Effective descent of separated pro-etale objects is proved over a strictly totally disconnected base and then propagated.
- ECD Proposition 11.5, 11.24 and Theorem 12.18: Atlases of diamonds and spatial v-sheaves are taken to be disjoint unions of strictly totally disconnected spaces.

**Named API.**

- `IsStrictlyTotallyDisconnected` (data): The predicate on a perfectoid space: qcqs, and every etale cover splits.
- `IsStrictlyTotallyDisconnected.isTotallyDisconnected` (relation): A strictly totally disconnected space is totally disconnected.
- `IsStrictlyTotallyDisconnected.component_eq` (characterisation): Every connected component is Spa(C, C^+) with C algebraically closed.
- `IsStrictlyTotallyDisconnected.of_components` (constructor): Conversely this condition on components implies strict total disconnectedness.
- `IsStrictlyTotallyDisconnected.isClosed` (structure): The condition passes to closed subspaces, and to pro-constructible generalizing subsets.
- `IsStrictlyTotallyDisconnected.splitting_etale` (characterisation): A chosen splitting of any given etale cover.

**Unit tests.**

- `algebraically_closed_point` (characterisation): Spa(C, C^+) with C algebraically closed is strictly totally disconnected.
- `cyclotomic_field_is_not` (non-example): Spa(K, K^+) with K perfectoid but not algebraically closed is totally disconnected and not strictly totally disconnected (a non-example separating the two classes).
- `finite_disjoint_union` (degenerate): A finite disjoint union of strictly totally disconnected spaces is strictly totally disconnected (the degenerate case).
- `profinite_times_point` (characterisation): S x Spa(C, O_C) for S profinite is strictly totally disconnected, which is the shape produced by Lemma 7.19.

**Acceptance.**

- Spa(C, C^+) with C algebraically closed is strictly totally disconnected; Spa(Q_p^cycl hat, O) is totally disconnected and not strictly so.

**Direct prerequisites.** `mathlib:ConnectedComponents`, `DiamondsAndVStacks:D1/components-of-totally-disconnected`, `DiamondsAndVStacks:D1/totally-disconnected-perfectoid-space`, `PerfectoidSpaces:P5/finite-stage-descent-of-qcqs-etale-objects`, `PerfectoidSpaces:P3/etale-site-tilting-and-etale-almost-acyclicity`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, Definition 7.15 and Proposition 7.16 with proof, p. 36 — The definition and its characterisation, with the proof recorded in the steps..

**Signature refinement.** Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.

The precise entries left out of the suggested declarations are `IsStrictlyTotallyDisconnected.isTotallyDisconnected`, `IsStrictlyTotallyDisconnected.component_eq`, `IsStrictlyTotallyDisconnected.of_components`, `IsStrictlyTotallyDisconnected.isClosed`, `algebraically_closed_point`, `cyclotomic_field_is_not`, `finite_disjoint_union`, `profinite_times_point`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### universally-open-std-cover — Every affinoid perfectoid space has a universally open affinoid pro-etale strictly totally disconnected cover

**Construction.** Let X be an affinoid perfectoid space. Then there is an affinoid perfectoid space X tilde with an affinoid pro-etale, surjective and universally open map X tilde -> X such that X tilde is strictly totally disconnected. If kappa is a cutoff cardinal and X is kappa-small then X tilde may be taken kappa-small. The construction differs from the w-localization precisely in that it is universally open, which the w-localization is not.

Identifier: `DiamondsAndVStacks:D1/universally-open-std-cover`.

Atlas planet: **Universally open strictly totally disconnected cover**.

**Hypotheses and conventions.**

- X affinoid; kappa a cutoff cardinal in the sense of ECD 4.1. The cardinality count uses that the set of isomorphism classes of affinoid etale surjections onto X has cardinality less than kappa.
- The countable iteration uses that countable unions of cardinals less than kappa are less than kappa, which is clause (ii) of the cutoff lemma, and P6's affinoid approximation for the finite-stage descent.

**Construction or proof.**

1. Fix a set of representatives {X_i -> X} of all affinoid etale surjective maps; there are fewer than kappa of them, because the cardinality of O(X_i) is bounded independently of i and the set of affinoid perfectoid spaces with bounded ring of functions has cardinality less than kappa.
2. For a finite subset J, let X_J be the fibre product over X of the X_i for i in J; set X_infinity = lim_J X_J. Then X_infinity -> X is affinoid pro-etale and universally open: a quasicompact open of X_infinity comes from some X_J, its image in X_J is the same open since X_infinity -> X_J is surjective, and etale maps are open; the argument survives base change.
3. Iterate the construction X to X_infinity countably often to get X tilde with all etale covers split: any etale cover is refined by an affinoid etale cover, which comes from a finite level by finite-stage descent and becomes split at the next.

**Uses that determine the API.**

- ECD Proposition 9.7: The proof replaces an arbitrary v-cover by one that is affinoid pro-etale and universally open, which is exactly what this cover provides.
- ECD Proposition 11.24 and Theorem 12.18: The atlas of a spatial diamond is obtained by the same iterated construction applied to etale maps that are composites of quasicompact open immersions and finite etale maps.
- ECD Theorem 8.7 and Proposition 8.8: A totally disconnected, respectively strictly totally disconnected, cover is the first step of every v-descent argument.

**Named API.**

- `Perfectoid.stdCover` (data): For an affinoid perfectoid X, a strictly totally disconnected affinoid perfectoid X tilde over X.
- `Perfectoid.stdCover.isProEtale` (characterisation): The structure map is affinoid pro-etale.
- `Perfectoid.stdCover.surjective` (characterisation): The structure map is surjective, hence a v-cover.
- `Perfectoid.stdCover.universallyOpen` (characterisation): The structure map is universally open.
- `Perfectoid.stdCover.isStrictlyTotallyDisconnected` (instance): X tilde is strictly totally disconnected.
- `Perfectoid.stdCover.small` (compatibility): If X is kappa-small then X tilde may be chosen kappa-small, for kappa a cutoff cardinal.
- `Perfectoid.stdCover.oneStep` (constructor): The single step X_infinity, the limit over finite products of all affinoid etale surjections, which is already universally open.

**Unit tests.**

- `already_std` (degenerate): If X is already strictly totally disconnected the identity is such a cover (the degenerate case).
- `universally_open` (non-example): The cover is universally open, unlike the w-localization; a construction that produces X^wl is wrong.
- `point` (characterisation): For X=Spa(C,C⁺) with C algebraically closed, the identity is an admissible universally open strictly totally disconnected cover.
- `smallness` (characterisation): For X kappa-small the cover is kappa-small, so the construction stays inside the kappa-small site.

**Acceptance.**

- The map is surjective and universally open, and therefore a v-cover that stays a v-cover after base change; this is what Proposition 9.7 and Proposition 11.24 need and the w-localization does not supply.
- In the strictly totally disconnected case Lemma 7.19 then gives that everything separated and quasicompact over X tilde is affinoid pro-etale.

**Direct prerequisites.** `mathlib:Cardinal`, `DiamondsAndVStacks:D0/cutoff-cardinal`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondsAndVStacks:D0/completion-cardinality-bound`, `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `PerfectoidSpaces:P5/finite-stage-descent-of-qcqs-etale-objects`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, Lemma 7.18 with proof, pp. 36-37 — The statement, including the smallness clause.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, remark before Lemma 7.18, p. 36 — ECD's own statement that the two constructions differ, which the roadmap text repeats..

**Signature refinement.** Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.

The precise entries left out of the suggested declarations are `Perfectoid.stdCover`, `Perfectoid.stdCover.isProEtale`, `Perfectoid.stdCover.surjective`, `Perfectoid.stdCover.universallyOpen`, `Perfectoid.stdCover.isStrictlyTotallyDisconnected`, `Perfectoid.stdCover.small`, `Perfectoid.stdCover.oneStep`, `already_std`, `universally_open`, `point`, `smallness`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### pro-etale-maps-over-std-base — Quasicompact separated maps to a strictly totally disconnected base are pro-etale iff their rank-one fibres are profinite

**Theorem.** Let X be a strictly totally disconnected perfectoid space and f : Y -> X a quasicompact separated map of perfectoid spaces. Then f is pro-etale if and only if for every rank-one point x = Spa(C, O_C) of X the fibre Y_x is isomorphic to x x S_x for a profinite set S_x. In that case Y is strictly totally disconnected and Y -> X is affinoid pro-etale. The hypothesis holds in particular when Y is affinoid, since any map of affinoid perfectoid spaces is separated.

Identifier: `DiamondsAndVStacks:D1/pro-etale-maps-over-std-base`.

**Hypotheses and conventions.**

- X strictly totally disconnected; f quasicompact and separated. Without separatedness the conclusion fails, as Remark 7.21 records on the topological side.
- Here x x S denotes the limit of x x S_i over a presentation of S as a limit of finite sets.

**Construction or proof.**

1. Factor f through X x_{pi_0 X} pi_0(Y) -> X, which is affinoid pro-etale with strictly totally disconnected source, and replace X by it, so that pi_0(f) is a homeomorphism.
2. Show f is an injection: check on connected components, where X = Spa(C, C^+) and Y is connected; if two rank-one points of Y lay over the same point, the profinite fibre would split Y into two nonempty closed pieces, contradicting connectedness.
3. The image of |f| is pro-constructible and generalizing, hence affinoid pro-etale in X and itself strictly totally disconnected; replace X by the image so that |f| is a bijection.
4. Conclude f is an isomorphism by the isomorphism criterion of ECD 5.4, supplied by P4.

**Acceptance.**

- For X = Spa(C, O_C) the affinoid pro-etale maps to X are exactly X x S for S profinite, which is the base case recorded in ECD after Definition 7.8.
- The lemma is the engine of the topological classification and of Proposition 11.30.

**Direct prerequisites.** `mathlib:Profinite`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`, `DiamondsAndVStacks:D0/pro-constructible-subsets`, `PerfectoidSpaces:P4/valuative-criterion-separatedness`, `PerfectoidSpaces:P4/maps-of-affinoid-perfectoid-spaces-are-separated`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, Lemma 7.19 with proof, p. 37 — The statement; the proof is reproduced in the steps..

**Theorem signature.** Proposed name `TauCeti.Diamonds.ProEtaleMapsOverStdBase`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.
### topological-classification-of-pro-etale-maps — Perfectoid spaces pro-etale over a strictly totally disconnected space are classified by spectral data

**Theorem.** Let T be a spectral space each of whose connected components is a totally ordered chain of specializations. Call a spectral map S -> T affinoid pro-etale if the induced map S -> T x_{pi_0 T} pi_0(S) is a pro-constructible generalizing embedding, and pro-etale if S is covered by spectral subsets whose restrictions are affinoid pro-etale. For X a strictly totally disconnected perfectoid space, sending f : Y -> X to |f| : |Y| -> |X| gives equivalences between the category of (kappa-small) affinoid pro-etale perfectoid spaces over X and the category of affinoid pro-etale spectral maps to |X| (of cardinality less than kappa), and likewise in the pro-etale case. The inverse sends S -> |X| to the space with O^+_S the varpi-adic completion of the pullback of O^+_X.

Identifier: `DiamondsAndVStacks:D1/topological-classification-of-pro-etale-maps`.

Atlas planet: **Topological classification of pro-etale maps**.

**Hypotheses and conventions.**

- X strictly totally disconnected. If S is spectral and S -> T is pro-etale it need not be affinoid pro-etale: the analogue of the separatedness condition can fail, which ECD records as Remark 7.21.
- The valuations on the inverse are obtained by pullback from X, which is what makes the inverse land in perfectoid spaces.

**Construction or proof.**

1. Necessity of the topological condition is Lemma 7.19.
2. For the inverse, given g : S -> |X| pro-etale set O^+_S the varpi-adic completion of the pullback of O^+_X and invert varpi; each point of S inherits a valuation by pullback.
3. If g is affinoid pro-etale, the pro-constructible generalizing description shows that this defines an affinoid perfectoid space, and Lemma 7.19 shows the map to X is affinoid pro-etale.
4. In general g is locally affinoid pro-etale, so one glues.

**Acceptance.**

- For X = Spa(C, O_C), |X| is a point and the classification says that pro-etale perfectoid spaces over X are profinite sets.
- The classification is what makes Proposition 9.7 reduce descent of etale maps to a purely topological statement about local isomorphisms.

**Direct prerequisites.** `mathlib:SpectralSpace`, `mathlib:IsSpectralMap`, `mathlib:Profinite`, `mathlib:UniformSpace.Completion`, `DiamondsAndVStacks:D1/pro-etale-maps-over-std-base`, `DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`, `DiamondsAndVStacks:D0/locally-spectral-space`, `DiamondsAndVStacks:D0/spectral-components-profinite`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, Definition 7.20 and Remark 7.21, p. 38 — The topological definition, and Remark 7.21's warning that a pro-etale spectral map with S spectral need not be affinoid pro-etale.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, Corollary 7.22 with proof, p. 38 — The equivalence, with the construction of the inverse functor..

**Theorem signature.** Proposed name `TauCeti.Diamonds.TopologicalClassificationOfProEtaleMaps`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.
### automatic-flatness — Automatic flatness over a totally disconnected base

**Theorem.** Let X = Spa(R, R^+) be a totally disconnected perfectoid space and f : Y = Spa(S, S^+) -> X any map from an affinoid perfectoid space. Then S^+/varpi is flat over R^+/varpi for every pseudouniformizer varpi of R. If moreover |f| is surjective then S^+/varpi is faithfully flat over R^+/varpi. This is the algebraic descent input of the theory; it is not the assertion that arbitrary maps of perfectoid rings are flat.

Identifier: `DiamondsAndVStacks:D1/automatic-flatness`.

Atlas planet: **Automatic flatness**.

**Hypotheses and conventions.**

- X totally disconnected and Y affinoid perfectoid; no hypothesis at all on f beyond that. Faithful flatness needs surjectivity of |f|, not surjectivity of Spec.
- The statement is about the integral rings modulo a pseudouniformizer; it says nothing about R -> S.

**Construction or proof.**

1. Let g : |X| -> pi_0(X) be the projection. Check flatness of the pushforward sheaves on pi_0(X) stalkwise: the stalk of g_* O^+_X modulo varpi at c is K_c^+/varpi, and the stalk of the pushforward from Y is S_c^+/varpi where Spa(S_c, S_c^+) = Y x_X Spa(K_c, K_c^+).
2. S_c^+ is varpi-torsion free, hence flat over the valuation ring K_c^+; base change gives that S_c^+/varpi is flat over K_c^+/varpi.
3. Flatness is local, and pi_0(Spec(R^+/varpi)) = pi_0(X), so the flatness assembles.
4. Faithful flatness: reduce to X = Spa(K, K^+); surjectivity of |f| gives a map Spa(L, L^+) -> Y with Spa(L, L^+) -> Spa(K, K^+) surjective, and Spa(L, L^+) = Spec(L^+/varpi), Spa(K, K^+) = Spec(K^+/varpi), so Spec(S^+/varpi) -> Spec(K^+/varpi) is surjective.

**Acceptance.**

- The identification Spa(K, K^+) = Spec(K^+/varpi) for a perfectoid field K with an open bounded valuation subring K^+ is used in the last step and is a required test.
- Used in Theorem 8.7, Proposition 8.8 and Proposition 9.3: every v-descent statement of this roadmap rests on it.

**Direct prerequisites.** `mathlib:Module.Flat`, `mathlib:Module.FaithfullyFlat`, `mathlib:ValuationSubring`, `mathlib:PrimeSpectrum.comap_surjective_of_faithfullyFlat`, `DiamondsAndVStacks:D1/components-of-totally-disconnected`, `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, Proposition 7.23 with proof, pp. 38-39 — The statement, whose two halves are the two steps of the proof.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 7, proof of Proposition 7.23, p. 38 — The one-line reason the theorem is true, which is why the structure theorem for components is a prerequisite..

**Theorem signature.** Proposed name `TauCeti.Diamonds.AutomaticFlatness`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.

**Stage acceptance.** The definitions, API and discriminating tests above cover every target of D1. Every prerequisite chain ends at the pinned baseline, an exact foreign node, a supplier request or an explicit gap. The following work is required before closing the stage:

- Signature refinement: instantiate and state the explicitly omitted API/tests of DiamondsAndVStacks:D1/totally-disconnected-perfectoid-space, DiamondsAndVStacks:D1/w-local-and-w-strictly-local, DiamondsAndVStacks:D1/w-localization, DiamondsAndVStacks:D1/strictly-totally-disconnected, DiamondsAndVStacks:D1/universally-open-std-cover. See signatureCoverage for each name, statement and required interface; prove no implementations here.
- Named theorem signatures: supply the carrier/interface and state DiamondsAndVStacks:D1/split-cover-characterisation, DiamondsAndVStacks:D1/components-of-totally-disconnected, DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid, DiamondsAndVStacks:D1/pro-etale-maps-over-std-base, DiamondsAndVStacks:D1/topological-classification-of-pro-etale-maps, DiamondsAndVStacks:D1/automatic-flatness. Their exact mathematical statements and proposed names are in signatureCoverage.namedTargets and the suggested comment ledger.

## D2 — Pro-étale and v-topologies

A covering family has the finite quasicompact-open image condition of ECD 8.1, in addition to pro-étaleness for the pro-étale topology. Point surjectivity alone is insufficient for an arbitrary family. The layer compares bounded sites, establishes subcanonicity, descends functions and integral functions, and proves almost and rational acyclicity. Vector bundles use the completed structural sheaf. On a rigid variety the v-site is built directly on perfectoid spaces over that variety, so this construction does not depend on D6’s diamond functor.

**Target coverage.** The eight nodes cover ECD 8.1 to 8.8: the big pro-etale site, the small pro-etale site and the v-site with the exact covering condition the roadmap text insists on, cutoff independence and small sheaves, the algebraic topos statement with ECD Convention 8.4, the comparison with the etale site together with the structure sheaves on the pro-etale site, subcanonicity, v-descent of functions, and higher v-acyclicity. The vector-bundle comparison also covers the routed Heuer/KL16 input, with the analytic equivalence restricted to perfectoid spaces.

### big-pro-etale-site — The big pro-etale site of perfectoid spaces

**Construction.** Let Perfd be the category of perfectoid spaces and Perfd_kappa the full subcategory of kappa-small ones. The big pro-etale site is the Grothendieck topology on Perfd, respectively Perfd_kappa, in which a family {f_i : Y_i -> X} is a covering if all f_i are pro-etale and for every quasicompact open U of X there is a finite subset J of the index set and quasicompact opens V_i of Y_i for i in J with U the union of the images f_i(V_i). The quasicompactness condition is the same one that appears in the definition of the fpqc topology for schemes; point-surjectivity of an unrestricted family is not the definition.

Identifier: `DiamondsAndVStacks:D2/big-pro-etale-site`.

**Hypotheses and conventions.**

- The covering condition has two parts and both are needed: pro-etaleness of each member, and the finite-quasicompact-image condition. Dropping the second gives a class that is not stable under the operations a pretopology needs.
- Pro-etale morphisms of perfectoid spaces, their stability under composition and base change and the pro-category equivalence are supplied by PerfectoidSpaces:P6; this node only builds the site.

**Construction or proof.**

1. Define the covering families and verify the pretopology axioms: isomorphisms cover, coverings are stable under base change using stability of pro-etale maps and of the image condition, and coverings compose.
2. Verify that an analytic cover, that is, a jointly surjective family of open immersions, and an etale cover in the usual sense are coverings, so the analytic and etale topologies are coarser.
3. Verify that every covering can be refined by one whose members are affinoid, using that quasicompact opens of a perfectoid space are covered by affinoids.
4. Instantiate the same definition on Perfd_kappa and check that the inclusion is continuous.

**Uses that determine the API.**

- ECD Corollary 8.6 and Theorem 8.7: Subcanonicity and the sheaf property of O and O^+ are statements about this topology and its v-refinement.
- ECD Definition 11.1: A diamond is a quotient sheaf for the pro-etale topology on Perf, so the topology must exist before diamonds can be defined.
- ECD Definition 10.1 and Proposition 10.11: Etale and quasi-pro-etale morphisms are defined for pro-etale stacks on Perfd and checked v-locally.

**Named API.**

- `Perfd.proEtalePrecoverage` (data): The precoverage on Perfd whose members are pro-etale families satisfying the finite quasicompact image condition.
- `Perfd.proEtaleTopology` (data): The Grothendieck topology it generates.
- `Perfd.proEtalePrecoverage.isStableUnderBaseChange` (structure): Coverings are stable under base change.
- `Perfd.proEtalePrecoverage.isStableUnderComposition` (structure): Coverings are stable under composition.
- `Perfd.proEtaleTopology_le_of_analytic` (relation): Analytic and etale covers are pro-etale covers, so the analytic and etale topologies are coarser.
- `Perfd.proEtaleCover.refineAffinoid` (characterisation): Every pro-etale covering is refined by one all of whose members are affinoid perfectoid.
- `Perfd.proEtaleTopology.small` (compatibility): The topology restricts to Perfd_kappa and the inclusion is a continuous functor of sites.
- `Perfd.mem_proEtaleCover_iff` (characterisation): Membership is the conjunction of pro-etaleness and the quasicompact image condition.

**Unit tests.**

- `single_surjective_pro_etale` (characterisation): A surjective pro-etale map of qcqs perfectoid spaces is a covering.
- `analytic_cover` (degenerate): A jointly surjective family of open immersions is a covering (the degenerate case).
- `point_surjective_is_not_enough` (non-example): A pro-etale family that is surjective on points but where no finite subfamily covers a given quasicompact open by images of quasicompact opens is not a covering (the required non-example).
- `matches_scheme_condition` (non-example): The image condition is literally Mathlib's quasi-compact cover condition for schemes, transported along the analogy; a definition that is not equivalent to it is wrong.

**Acceptance.**

- A single surjective pro-etale map of qcqs perfectoid spaces is a covering.
- A family of open immersions whose images cover is a covering; a family of pro-etale maps that is surjective on points but fails the quasicompact-image condition is not.

**Direct prerequisites.** `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:CategoryTheory.Pretopology`, `mathlib:CategoryTheory.Precoverage`, `mathlib:AlgebraicGeometry.Scheme.qcPrecoverage`, `mathlib:AlgebraicGeometry.Scheme.ProEt.precoverage`, `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`, `PerfectoidSpaces:P6/pro-etale-map`, `PerfectoidSpaces:P6/pro-etale-stability-and-limits`, `PerfectoidSpaces:P6/kappa-small-perfectoid-space`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, Definition 8.1(i), p. 39 — The definition, verbatim, including the covering condition the roadmap text insists on.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, remark after Definition 8.1, p. 39 — The comparison ECD itself draws, and the reason Mathlib's quasi-compact precoverage for schemes is the right model..

**Signature refinement.** Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.

The precise entries left out of the suggested declarations are `Perfd.proEtalePrecoverage.isStableUnderBaseChange`, `Perfd.proEtalePrecoverage.isStableUnderComposition`, `Perfd.proEtaleTopology_le_of_analytic`, `Perfd.proEtaleCover.refineAffinoid`, `Perfd.proEtaleTopology.small`, `Perfd.mem_proEtaleCover_iff`, `single_surjective_pro_etale`, `analytic_cover`, `point_surjective_is_not_enough`, `matches_scheme_condition`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### small-pro-etale-site-and-v-site — The small pro-etale site of a perfectoid space, and the v-site

**Construction.** For a perfectoid space X, the pro-etale site X_proet is the Grothendieck topology on the category of perfectoid spaces pro-etale over X, with the same coverings as in the big site; there is a kappa-small variant. The v-site is the Grothendieck topology on Perfd, respectively Perfd_kappa, in which a family {f_i : Y_i -> X} is a covering if for every quasicompact open U of X there is a finite subset J and quasicompact opens V_i of Y_i for i in J with U the union of the images; no condition at all is placed on the maps themselves. There is no small v-site of a perfectoid space, since by design it would contain all perfectoid spaces over X.

Identifier: `DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site`.

Atlas planet: **The v-topology**.

**Hypotheses and conventions.**

- The v-covering condition is the pro-etale one with the pro-etaleness dropped; this is the only difference.
- ECD records that no small v-site exists, so a formalisation must not try to define one.

**Construction or proof.**

1. Define X_proet as the slice category of pro-etale maps to X with the induced coverings, and check that it is a site with fibre products, using the stability assertions of P6.
2. Define the v-precoverage on Perfd by the image condition alone and check the pretopology axioms; stability under base change uses that images of quasicompact opens behave well under pullback.
3. Record that the pro-etale topology is coarser than the v-topology and that both restrict to the kappa-small subcategories.
4. Record that a map of qcqs perfectoid spaces is a v-cover exactly when it is surjective on points.

**Uses that determine the API.**

- ECD Theorem 8.7, Proposition 8.8, Proposition 9.2, 9.3, 9.6, 9.7: Every descent statement of D3 is a statement about v-covers, and the reductions in their proofs use that a surjection of qcqs perfectoid spaces is a v-cover.
- ECD Definition 12.1 and 12.4: Small v-sheaves and small v-stacks are sheaves and stacks for this topology.
- ECD Proposition 8.5 and section 14: The comparison of the etale, pro-etale and v-topologies is the whole content of the coefficient theory that DiamondEtaleCohomology builds on.

**Named API.**

- `Perfd.vPrecoverage` (data): The precoverage on Perfd defined by the finite quasicompact image condition alone.
- `Perfd.vTopology` (data): The v-topology it generates.
- `Perfectoid.proEtaleSite` (data): The small pro-etale site of a perfectoid space X.
- `Perfd.proEtaleTopology_le_vTopology` (relation): Every pro-etale cover is a v-cover.
- `Perfd.isVCover_iff_surjective` (characterisation): A map of qcqs perfectoid spaces is a v-cover exactly when it is surjective on points.
- `Perfd.vPrecoverage.isStableUnderBaseChange` (structure): v-coverings are stable under base change and composition.
- `Perfectoid.proEtaleSite.hasFiniteLimits` (structure): The small pro-etale site has fibre products, supplied by the stability of pro-etale maps.
- `Perfd.vTopology.small` (compatibility): The v-topology restricts to Perfd_kappa compatibly with the inclusion.

**Unit tests.**

- `surjection_is_v_cover` (characterisation): A surjective map of affinoid perfectoid spaces is a v-cover.
- `pro_etale_is_v` (non-example): Every pro-etale cover is a v-cover; the converse fails, for instance for the disjoint union of all Spa(K(x), K(x)^+) over the points of X (a non-example).
- `no_small_v_site` (non-example): The category of perfectoid spaces over X with v-covers is not essentially small, so no small v-site is constructed (the degenerate case that must be refused).
- `empty_cover` (characterisation): The empty family covers the empty perfectoid space and nothing else.

**Acceptance.**

- A map of affinoid perfectoid spaces is a v-cover if and only if it is surjective, which is the criterion used in ECD Lemma 11.11, Lemma 12.5 and Lemma 12.11.
- Every pro-etale cover is a v-cover; the converse fails for the map from a disjoint union of the points of X.

**Direct prerequisites.** `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:CategoryTheory.Pretopology`, `mathlib:CategoryTheory.Over`, `mathlib:AlgebraicGeometry.Scheme.qcPrecoverage`, `DiamondsAndVStacks:D2/big-pro-etale-site`, `PerfectoidSpaces:P6/pro-etale-map`, `PerfectoidSpaces:P6/pro-etale-stability-and-limits`, `PerfectoidSpaces:P6/kappa-small-perfectoid-space`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, Definition 8.1(ii) and (iii), p. 39 — Both definitions, verbatim.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, remark after Definition 8.1, p. 39 — The statement that no small v-site is to be constructed..

**Signature refinement.** Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.

The precise entries left out of the suggested declarations are `Perfd.isVCover_iff_surjective`, `Perfd.vPrecoverage.isStableUnderBaseChange`, `Perfectoid.proEtaleSite.hasFiniteLimits`, `Perfd.vTopology.small`, `surjection_is_v_cover`, `pro_etale_is_v`, `no_small_v_site`, `empty_cover`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### cutoff-independence — Cohomology does not depend on the cutoff cardinal, and small sheaves

**Theorem.** For cutoff cardinals kappa and kappa' as in ECD 4.1 and a kappa-small perfectoid space X, the pullback functor from sheaves on X_proet,kappa to sheaves on X_proet,kappa' is fully faithful and preserves cohomology: for every sheaf of sets, respectively of groups, respectively of abelian groups F, the unit is an isomorphism and the higher direct images vanish in the relevant degrees. The same holds for pro-etale or v-cohomology on Perfd_kappa and their slices. Consequently one defines the category of small sheaves as the filtered colimit over all kappa, and a sheaf commuting with omega_1-filtered colimits of affinoid perfectoid rings is small.

Identifier: `DiamondsAndVStacks:D2/cutoff-independence`.

Atlas planet: **Cutoff independence**.

**Hypotheses and conventions.**

- kappa, kappa' cutoff cardinals in the sense of ECD 4.1; X kappa-small. The relevant degrees are zero for sheaves of sets, zero and one for sheaves of groups, and all degrees for abelian groups.
- Smallness matters because the large sites are not small categories, so 'all sheaves' would not be generated under colimits by the representables.

**Construction or proof.**

1. Restrict to X affinoid. A kappa'-small affinoid Y over X is a kappa-cofiltered limit of kappa-small affinoids Y_j over X, obtained by writing its ring of functions as a kappa-filtered colimit of kappa-small perfectoid rings; if Y is affinoid pro-etale over X the Y_j can be taken so too.
2. The pullback is the sheafification of Y mapsto colim_j F(Y_j); show this presheaf is already a sheaf and that H^i(Y, F) = colim_j H^i(Y_j, F) in the relevant degrees, by writing a cover of Y as a kappa-cofiltered limit of covers and passing to the colimit of Cech spectral sequences.
3. Define the category of small sheaves as the filtered colimit of the categories of sheaves on the kappa-small sites, and show it is generated under small colimits by the representables.
4. Show that a sheaf commuting with omega_1-filtered colimits of affinoid perfectoid pairs arises by pullback from the kappa-small site for every uncountable kappa, hence is small.

**Acceptance.**

- O and O^+ commute with omega_1-filtered colimits by the limit description of affinoid perfectoid spaces, hence are small; this is the criterion used in practice.
- Without the cutoff-independence the whole theory would depend on a choice of universe, which is exactly what ECD sets out to avoid.

**Direct prerequisites.** `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.presheafToSheaf`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.IsFiltered`, `DiamondsAndVStacks:D0/cutoff-cardinal`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `DiamondsAndVStacks:D2/big-pro-etale-site`, `DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site`, `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `PerfectoidSpaces:P6/pro-etale-map`, `PerfectoidSpaces:P6/pro-etale-stability-and-limits`, `PerfectoidSpaces:P6/kappa-small-perfectoid-space`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, Proposition 8.2 with proof, pp. 39-40 — The statement; the proof is reproduced in the steps.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, after Proposition 8.2, p. 40 — The practical smallness criterion, which the API must expose..

**Theorem signature.** Proposed name `TauCeti.Diamonds.CutoffIndependence`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.
### perfectoid-sheaf-topoi-are-algebraic — The categories of small sheaves on Perfd and on a pro-etale site are algebraic

**Theorem.** The categories of small sheaves on Perfd for either the big pro-etale or the v-topology, and the category of small sheaves on X_proet for a perfectoid space X, are algebraic in the sense of SGA 4 VI: a basis of qcqs objects stable under fibre products is given in all cases by the affinoid perfectoid spaces. Moreover a perfectoid space X is quasicompact, respectively quasiseparated, in any of these settings if and only if |X| is quasicompact, respectively quasiseparated. For a map of stacks on such a site, quasiseparatedness is required to mean that the diagonal is quasicompact and quasiseparated, which for stacks is not automatic since the diagonal need not be injective.

Identifier: `DiamondsAndVStacks:D2/perfectoid-sheaf-topoi-are-algebraic`.

**Hypotheses and conventions.**

- The final object of these categories is not quasiseparated, so object-level and map-level quasicompactness must be kept apart, as recorded in the topos node of D0.
- ECD leaves the proof to the reader; the content is the verification of the axioms of an algebraic topos for the affinoid basis.

**Construction or proof.**

1. Affinoid perfectoid spaces are qcqs as sheaves: quasicompactness because a jointly surjective family of maps to an affinoid admits a finite subfamily that already covers, by the quasicompactness condition in the definition of the coverings; quasiseparatedness because fibre products of affinoids are affinoid.
2. They are stable under fibre products, by the existence of fibre products of perfectoid spaces.
3. They generate, because every perfectoid space is covered by affinoids.
4. The comparison with |X| follows by transporting the finite subcover condition along the definition of the coverings.
5. Record ECD Convention 8.4 on quasiseparated maps of stacks.

**Acceptance.**

- The v-topos of Perfd has a non-quasiseparated final object, which is the standing counterexample.
- For X affinoid perfectoid, X is quasicompact and quasiseparated as a v-sheaf, which is what makes Cech arguments finite.

**Direct prerequisites.** `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.Precoherent`, `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`, `DiamondsAndVStacks:D2/big-pro-etale-site`, `DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site`, `DiamondsAndVStacks:D2/cutoff-independence`, `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, Proposition 8.3, p. 41 — The statement; ECD's proof is 'left to the reader', which is recorded as a gap.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, Convention 8.4, p. 41 — The convention that must be built into every quasiseparatedness statement about stacks in D3 to D6..

**Theorem signature.** Proposed name `TauCeti.Diamonds.PerfectoidSheafTopoiAreAlgebraic`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.
### pro-etale-etale-comparison-and-structure-sheaves — Comparison of the pro-etale and etale sites, and the structure sheaves on the pro-etale site

**Theorem.** Let X be a perfectoid space and nu : X_proet -> X_et the natural map of sites. For every sheaf F on X_et the adjunction F -> nu_* nu^* F is an equivalence, and for F abelian R^i nu_* nu^* F = 0 for i at least 1. For an affinoid pro-etale Y = lim Y_i over an affinoid open X_0 of X the natural map colim_i F(Y_i) -> (nu^* F)(Y) is an isomorphism. The presheaves O and O^+ on X_proet are small sheaves, and for X affinoid perfectoid H^i(X_proet, O) = 0 for i > 0 and H^i(X_proet, O^+) is almost zero for i > 0.

Identifier: `DiamondsAndVStacks:D2/pro-etale-etale-comparison-and-structure-sheaves`.

Atlas planet: **Structure sheaves on the pro-etale site**.

**Hypotheses and conventions.**

- X a perfectoid space; the affinoid case is the substance and the general case is local.
- The almost vanishing for O^+ is genuinely almost and not exact; this is inherited from the almost acyclicity on affinoid perfectoids supplied by P2.

**Construction or proof.**

1. Reduce to X affinoid, where X_proet^aff and X_proet define equivalent topoi.
2. By the pro-category equivalence of P6, nu_* F is the sheafification of the presheaf sending a pro-etale presentation Y = lim Y_i to colim_i F(Y_i); show this presheaf is already a sheaf by reducing a surjection in X_proet^aff to an etale surjection at a finite level using finite-stage descent, then computing the equalizer.
3. For the structure sheaves, fix a pseudouniformizer varpi and consider the sheaf of almost O^+(X)/varpi-modules on X_et^aff sending Y to O^+(Y)/varpi; its pullback to the pro-etale site is again given by that formula, so it is a sheaf. Induct on n for varpi^n, pass to the inverse limit and invert varpi.
4. All these sheaves have vanishing higher cohomology, respectively almost vanishing for O^+; and O^+ inside O is the subpresheaf of functions of absolute value at most 1, hence a sheaf.
5. Smallness: O and O^+ commute with omega_1-filtered colimits of affinoid perfectoid pairs.

**Acceptance.**

- For X affinoid perfectoid the almost vanishing of H^i(X, O^+) for i > 0 on the etale site is the input from P2 and P3; this node transports it to the pro-etale site.
- The statement fails if 'almost' is dropped, which is a required non-example.

**Direct prerequisites.** `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.Sheaf.cohomologyPresheaf`, `DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site`, `DiamondsAndVStacks:D2/cutoff-independence`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `PerfectoidSpaces:P3/etale-site-tilting-and-etale-almost-acyclicity`, `PerfectoidSpaces:P2/sheaf-theorem-and-almost-acyclicity`, `PerfectoidSpaces:P5/finite-stage-descent-of-qcqs-etale-objects`, `PerfectoidSpaces:P0/almost-modules-over-perfectoid-base`, `PerfectoidSpaces:P6/pro-etale-map`, `PerfectoidSpaces:P6/pro-etale-stability-and-limits`, `PerfectoidSpaces:P6/kappa-small-perfectoid-space`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, Proposition 8.5 with proof, pp. 41-42 — The statement of the node.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, proof of Proposition 8.5, p. 42 — The smallness argument..

**Theorem signature.** Proposed name `TauCeti.Diamonds.ProEtaleEtaleComparisonAndStructureSheaves`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.
### subcanonicity-of-the-pro-etale-topology — The big pro-etale site is subcanonical

**Theorem.** The presheaves O sending X to O_X(X) and O^+ sending X to O^+_X(X) on the big pro-etale site are small sheaves. Moreover the big pro-etale site is subcanonical: for every perfectoid space X the functor Y mapsto Hom(Y, X) is a small sheaf for the big pro-etale topology.

Identifier: `DiamondsAndVStacks:D2/subcanonicity-of-the-pro-etale-topology`.

**Hypotheses and conventions.**

- The reduction to the small site uses that a cover in the big site is also a cover in the small pro-etale site of the target.

**Construction or proof.**

1. Any cover {f_i : Y_i -> X} in the big site is a cover in the small pro-etale site of X, so the first claim follows from the pro-etale structure-sheaf theorem.
2. For subcanonicity, given a pro-etale cover {Y_i -> Y} and maps g_i : Y_i -> X agreeing on overlaps, the maps |Y_i| -> |X| glue to a continuous map |Y| -> |X| by the quotient-map lemma; so the problem is local on X and we may take X affinoid.
3. Then the g_i give compatible maps of pairs (R, R^+) -> (O(Y_i), O^+(Y_i)); as O and O^+ are pro-etale sheaves these glue to (R, R^+) -> (O(Y), O^+(Y)), that is, to a map Y -> X.
4. Smallness holds because representable sheaves are preserved by pullback, so a kappa-small X comes by pullback from the kappa-small site.

**Acceptance.**

- Subcanonicity is what makes 'a perfectoid space and the sheaf it represents' interchangeable, which ECD does from section 10 onwards without further comment.

**Direct prerequisites.** `mathlib:CategoryTheory.GrothendieckTopology.Subcanonical`, `DiamondsAndVStacks:D2/pro-etale-etale-comparison-and-structure-sheaves`, `DiamondsAndVStacks:D0/generalizing-surjection-is-quotient`, `DiamondsAndVStacks:D2/big-pro-etale-site`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, Corollary 8.6 with proof, p. 42 — The statement and its proof..

**Theorem signature.** Proposed name `TauCeti.Diamonds.SubcanonicityOfTheProEtaleTopology`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.
### v-descent-of-functions — O and O^+ are v-sheaves and the v-site is subcanonical

**Theorem.** The presheaves O and O^+ on the v-site are small sheaves, and the v-site is subcanonical: for every perfectoid space X the functor Y mapsto Hom(Y, X) is a small v-sheaf.

Identifier: `DiamondsAndVStacks:D2/v-descent-of-functions`.

Atlas planet: **v-descent of functions**.

**Hypotheses and conventions.**

- Since O^+ inside O is the subpresheaf of functions of absolute value at most 1, and that condition may be checked after a v-cover, it is enough to prove that O is a v-sheaf.
- Separatedness of O is immediate because O(X) injects into the product of the completed residue fields.

**Construction or proof.**

1. Reduce to X affinoid; the quasicompactness condition on a v-cover lets one refine to a single map f : Y -> X with Y affinoid.
2. Let X tilde -> X be a totally disconnected cover along an affinoid pro-etale map, for instance the w-localization; pro-etale descent is known, so replace f by its base change and assume X is totally disconnected.
3. By automatic flatness S^+/varpi is faithfully flat over R^+/varpi, so R^+/varpi is the equalizer of the two maps from S^+/varpi to S^+/varpi tensor S^+/varpi.
4. The map from S^+/varpi tensor S^+/varpi to T^+/varpi, where Y x_X Y = Spa(T, T^+), is an almost isomorphism by the completed-integral comparison, so R^+/varpi is almost the equalizer of the two maps to T^+/varpi; pass to the limit over varpi^n and invert varpi.
5. Subcanonicity then follows as in the pro-etale case.
6. The integral completed tensor reduction is exactly PerfectoidSpaces:P2/completed-tensor-plus-ring-almost-formula, sourced by Sch12 proof of Proposition 6.18; keep the identification almost, not an equality of naive plus rings.

**Acceptance.**

- Theorem 1.2 of the introduction: for any affinoid perfectoid X = Spa(R, R^+), H^0_v(X, O_X) = R and H^0_v(X, O^+_X) = R^+.
- The almost identification of S^+/varpi tensor S^+/varpi with T^+/varpi is a step ECD compresses; it is recorded as a gap.

**Direct prerequisites.** `mathlib:CategoryTheory.GrothendieckTopology.Subcanonical`, `mathlib:Module.FaithfullyFlat`, `DiamondsAndVStacks:D1/automatic-flatness`, `DiamondsAndVStacks:D1/w-localization`, `DiamondsAndVStacks:D2/subcanonicity-of-the-pro-etale-topology`, `DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site`, `PerfectoidSpaces:P0/almost-modules-over-perfectoid-base`, `PerfectoidSpaces:P2/completed-tensor-plus-ring-almost-formula`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, Theorem 8.7 with proof, p. 43 — The statement of the node.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, proof of Theorem 8.7, p. 43 — The one step where automatic flatness enters.; [sch12](https://arxiv.org/pdf/1111.4914), Proof of Proposition 6.18 — The integral tensor comparison cited by ECD 8.7, imported from P2..

**Theorem signature.** Proposed name `TauCeti.Diamonds.VDescentOfFunctions`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.
### higher-v-acyclicity — Higher v-acyclicity and almost acyclicity on affinoid perfectoid spaces

**Theorem.** Let X be an affinoid perfectoid space. Then H^i_v(X, O) = 0 for i > 0, and H^i_v(X, O^+) is almost zero for i > 0. Together with the v-sheaf property this is Theorem 1.2 of the introduction: v-cohomology of O on an affinoid perfectoid space is concentrated in degree zero, where it is R, and v-cohomology of O^+ is almost concentrated in degree zero, where it is R^+.

Identifier: `DiamondsAndVStacks:D2/higher-v-acyclicity`.

Atlas planet: **Higher v-acyclicity**.

**Hypotheses and conventions.**

- X affinoid perfectoid; no totally disconnectedness is assumed in the statement, only in the first step of the proof.
- The vanishing for O^+ is only almost; this is not a defect of the proof.

**Construction or proof.**

1. Assume first X totally disconnected. For a v-cover f : Y -> X of affinoids, the complex from R^+ to S^+ to O^+(Y x_X Y) and onwards is almost exact: everything is varpi-adically complete and varpi-torsion free, so it may be checked modulo varpi, where it becomes the faithfully flat descent complex of automatic flatness.
2. For a general affinoid X the Cech complex of the affinoid pro-etale cover X^wl -> X is almost exact by the pro-etale structure-sheaf theorem.
3. Induct on i: choose i minimal with H^i_v(X, O^+) not almost zero for some affinoid X and a class alpha; pulling back to a totally disconnected cover and using the Cech-to-sheaf spectral sequence contradicts the first paragraph, so X may be assumed totally disconnected; then choose a v-cover killing alpha and contradict the first paragraph again.
4. Invert varpi to obtain the statement for O.

**Acceptance.**

- Theorem 1.2 of ECD's introduction is exactly the combination of this node and the v-descent node.
- The proof uses the Cech-to-sheaf cohomology spectral sequence twice, which is why D0 owns that comparison.

**Direct prerequisites.** `mathlib:CategoryTheory.Sheaf.cohomologyPresheaf`, `DiamondsAndVStacks:D1/automatic-flatness`, `DiamondsAndVStacks:D1/w-localization`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `DiamondsAndVStacks:D2/v-descent-of-functions`, `DiamondsAndVStacks:D2/pro-etale-etale-comparison-and-structure-sheaves`, `PerfectoidSpaces:P0/almost-modules-over-perfectoid-base`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 8, Proposition 8.8 with proof, p. 43 — The statement.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 1, Theorem 1.2, p. 3 — The packaged form stated in the introduction, which this node and the previous one together prove..

**Theorem signature.** Proposed name `TauCeti.Diamonds.HigherVAcyclicity`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.
### vector-bundles-across-pro-etale-and-v-sites — Pro-étale and v vector bundles

**Comparison.** For a perfectoid space X, pullback gives equivalences between finite locally free O_X-modules on its analytic site, its étale site, its small pro-étale site (completed structural sheaf), the corresponding big pro-étale site and Perf/X with the v-topology. On an affinoid perfectoid Spa(R,R⁺), these are finite projective R-modules. For a rigid variety X/K, the comparison among the pro-étale versions and the v-site Perf_K/X with completed O also holds, by descent on perfectoid covers. It does not assert that every v-vector bundle on a general rigid X comes from an analytic O_X-vector bundle.

Identifier: `DiamondsAndVStacks:D2/vector-bundles-across-pro-etale-and-v-sites`.

**Hypotheses and conventions.**

- Completed structural sheaves on the pro-étale sites
- Rigid-site v-objects are perfectoid spaces mapping directly to X; no diamond functor in the construction

**Construction or proof.**

1. Apply KL16 Theorem 3.5.8 to each affinoid perfectoid object. Its matrix argument uses v-descent and higher acyclicity, improving cocycles to small matrices and solving by successive approximation.
2. Finite projective modules form a stack; compare restrictions on perfectoid pro-étale covers and their overlaps to obtain the rigid pro-étale/v equivalence.
3. Use the analytic adic slice site supplied by A1 on rigid X, not X^diamond, so D2 has no D6 dependency.

**Acceptance.**

- For a perfectoid space X, pullback gives equivalences between finite locally free O_X-modules on its analytic site, its étale site, its small pro-étale site (completed structural sheaf), the corresponding big pro-étale site and Perf/X with the v-topology. On an affinoid perfectoid Spa(R,R⁺), these are finite projective R-modules. For a rigid variety X/K, the comparison among the pro-étale versions and the v-site Perf_K/X with completed O also holds, by descent on perfectoid covers. It does not assert that every v-vector bundle on a general rigid X comes from an analytic O_X-vector bundle.

**Direct prerequisites.** `DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site`, `DiamondsAndVStacks:D2/v-descent-of-functions`, `DiamondsAndVStacks:D2/higher-v-acyclicity`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `AdicEtaleGeometry:A1/etale-site`.

**Sources.** [kl16](https://arxiv.org/pdf/1602.06899), Theorem 3.5.8 and proof — The perfectoid comparison proved by KL16, the source numbered [27] in Heuer.; [heuer](https://arxiv.org/pdf/2307.01303), Opening site conventions and [27, Theorem 3.5.8] — Rigid pro-étale/v use; distinguishes its scope from the perfectoid analytic-site comparison..

**Theorem signature.** Proposed name `TauCeti.Diamonds.VectorBundlesAcrossProEtaleAndVSites`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.

**Stage acceptance.** The definitions, API and discriminating tests above cover every target of D2. Every prerequisite chain ends at the pinned baseline, an exact foreign node, a supplier request or an explicit gap. The following work is required before closing the stage:

- Signature refinement: instantiate and state the explicitly omitted API/tests of DiamondsAndVStacks:D2/big-pro-etale-site, DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site. See signatureCoverage for each name, statement and required interface; prove no implementations here.
- Named theorem signatures: supply the carrier/interface and state DiamondsAndVStacks:D2/cutoff-independence, DiamondsAndVStacks:D2/perfectoid-sheaf-topoi-are-algebraic, DiamondsAndVStacks:D2/pro-etale-etale-comparison-and-structure-sheaves, DiamondsAndVStacks:D2/subcanonicity-of-the-pro-etale-topology, DiamondsAndVStacks:D2/v-descent-of-functions, DiamondsAndVStacks:D2/higher-v-acyclicity, DiamondsAndVStacks:D2/vector-bundles-across-pro-etale-and-v-sites. Their exact mathematical statements and proposed names are in signatureCoverage.namedTargets and the suggested comment ledger.

## D3 — Effective descent and morphisms of stacks

Full faithfulness of descent for morphisms precedes the effectivity statements, whose classes and bases are stated separately. Affinoid descent over totally disconnected bases must descend the integral subring along with the Tate ring. Closed immersions are tested on totally disconnected perfectoids, quasi-pro-étaleness on strictly totally disconnected perfectoids, and local separatedness is retained. Groupoid-valued morphism classes and torsors use genuine two-fibre products, rather than discarding automorphisms.

**Target coverage.** The ten nodes cover ECD 9.2 to 9.11 and all of section 10: full faithfulness of v-descent for morphisms, effective descent for affinoid perfectoids over a totally disconnected base with the separate descent of the integral subring, the two auxiliary lemmas 9.4 and 9.5, effective descent for separated pro-etale objects over a strictly totally disconnected base, the v-stack property of separated etale and of finite etale objects with Corollary 9.11, the three classes of morphisms of stacks with Convention 10.2 and the permanence properties, ind-representability of sub-v-sheaves and quasicompact injections, open and closed immersions with separatedness, 0-truncatedness and the two valuative criteria, the v-local criteria of 10.11, and locally profinite torsors.

### descent-prestacks-of-perfectoid-spaces — The prestacks of perfectoid spaces over a base, and full faithfulness of v-descent for morphisms

**Lemma.** Let F be the prestack on the category of perfectoid spaces sending X to the groupoid of perfectoid spaces over X, and let Y -> X be a v-cover. Then F(X) -> F(Y/X) is fully faithful, where F(Y/X) is the category of descent data of ECD 9.1. Equivalently, morphisms of perfectoid spaces glue along v-covers. The same holds for the prestacks of affinoid perfectoid spaces, of separated pro-etale perfectoid spaces, of separated etale perfectoid spaces and of finite etale perfectoid spaces, which are the four prestacks whose effectivity is studied in this layer.

Identifier: `DiamondsAndVStacks:D3/descent-prestacks-of-perfectoid-spaces`.

**Hypotheses and conventions.**

- The only input is subcanonicity of the v-site; no restriction on the v-cover or on the spaces is needed.
- The abstract notion of descent data and the assertion that a stack has an equivalence onto it are supplied by the pinned Mathlib descent API; this node instantiates it.

**Construction or proof.**

1. Given perfectoid spaces X_1, X_2 over X, the functor Hom(X_1, X_2) is a v-sheaf by subcanonicity of the v-site.
2. Therefore morphisms over X may be glued along the v-cover, which is exactly full faithfulness of F(X) -> F(Y/X).
3. Record ECD Definition 9.1 as the definition of F(Y/X) and identify it with the pinned DescentData for the covering sieve generated by Y -> X.

**Acceptance.**

- For Y -> X a v-cover and X_1, X_2 perfectoid over X, a morphism X_1 -> X_2 over X is the same as a morphism after base change to Y compatible on Y x_X Y.
- Effectivity, that is essential surjectivity, is false in this generality: the restrictions in the following nodes are exactly the cases where it holds.

**Direct prerequisites.** `mathlib:CategoryTheory.Pseudofunctor.DescentData`, `mathlib:CategoryTheory.Pseudofunctor.IsPrestack`, `mathlib:CategoryTheory.Pseudofunctor.toDescentData`, `mathlib:CategoryTheory.Pseudofunctor.sheafHom`, `DiamondsAndVStacks:D2/v-descent-of-functions`, `DiamondsAndVStacks:D0/stackification`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 9, Definition 9.1, p. 44 — The definition of descent data used throughout the section.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 9, Lemma 9.2 with proof, p. 44 — The statement and its complete proof..

**Theorem signature.** Proposed name `TauCeti.Diamonds.DescentPrestacksOfPerfectoidSpaces`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.
### effective-descent-affinoid-over-totally-disconnected — Effective v-descent for affinoid perfectoid spaces over a totally disconnected base

**Theorem.** Let F be the prestack on affinoid perfectoid spaces sending X to the groupoid of affinoid perfectoid spaces over X. Let X be a totally disconnected perfectoid space and Y -> X a v-cover with Y affinoid perfectoid. Then F(X) -> F(Y/X) is an equivalence of categories. Both the ring and the ring of integral elements must be descended: descent of functions alone does not give effective descent.

Identifier: `DiamondsAndVStacks:D3/effective-descent-affinoid-over-totally-disconnected`.

Atlas planet: **Effective descent of affinoid perfectoids**.

**Hypotheses and conventions.**

- X totally disconnected and Y affinoid: both hypotheses are used, the first for automatic flatness, the second for the almost faithfully flat descent of algebras.
- The descent of the subring of integral elements is a separate step, carried out by the following lemma on subsets cut out by |f| at most 1.

**Construction or proof.**

1. Write X = Spa(R, R^+), Y = Spa(S, S^+) and let Y tilde = Spa(S tilde, S tilde^+) carry a descent datum. By automatic flatness (S^+/varpi)^a is faithfully flat over (R^+/varpi)^a.
2. Almost faithfully flat descent produces an (R^+/varpi)^a-algebra descending (S tilde^+/varpi)^a, which is perfectoid, hence of the form (R tilde^circ/varpi)^a for a perfectoid R-algebra R tilde with R tilde completed tensor R S = S tilde.
3. Let R tilde^+_min be the integral closure of R^+ + R tilde^{circ circ} in R tilde^circ and X tilde' = Spa(R tilde, R tilde^+_min). The map Y tilde -> X tilde' x_X Y is a pro-(open immersion), cut out by |f| at most 1 for f in S tilde^+.
4. The image |X tilde| inside X tilde' is then cut out by conditions |f| at most 1 for f in R tilde, by the next lemma; this produces the required affinoid perfectoid X tilde over X.

**Acceptance.**

- Effectivity fails without the totally disconnected hypothesis on the base, and for non-affinoid Y the correct statement is the separated pro-etale one of the following node.
- The descended object must reproduce both R tilde and R tilde^+, which is the required test.

**Direct prerequisites.** `mathlib:Module.FaithfullyFlat`, `DiamondsAndVStacks:D1/automatic-flatness`, `DiamondsAndVStacks:D1/totally-disconnected-perfectoid-space`, `DiamondsAndVStacks:D3/descent-prestacks-of-perfectoid-spaces`, `DiamondsAndVStacks:D3/descended-subsets-are-cut-out-by-functions`, `PerfectoidSpaces:P0/almost-modules-over-perfectoid-base`, `PerfectoidSpaces:P1/tilting-equivalence-and-explicit-tilt`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 9, Proposition 9.3 with proof, p. 44 — The statement of the node.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 9, proof of Proposition 9.3, p. 44 — The step where the integral subring is descended, which the roadmap text singles out..

**Theorem signature.** Proposed name `TauCeti.Diamonds.EffectiveDescentAffinoidOverTotallyDisconnected`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.
### descended-subsets-are-cut-out-by-functions — A subset whose preimage is cut out by functions is itself cut out by functions

**Lemma.** Let X = Spa(R, R^+) be a totally disconnected affinoid perfectoid space, X tilde = Spa(R tilde, R tilde^+) an affinoid perfectoid space over X, and A a subset of |X tilde|. Assume there is a surjective map Y = Spa(S, S^+) -> X such that the preimage B of A in |Y tilde|, where Y tilde = X tilde x_X Y, is an intersection of subsets of the form |g| at most 1 for g in S tilde. Then A is an intersection of subsets of the form |f| at most 1 for f in R tilde. A separate input is that a rational subset of a perfectoid ball over (C, C^+) which surjects onto Spa(C, C^+) admits a (C, C^+)-point.

Identifier: `DiamondsAndVStacks:D3/descended-subsets-are-cut-out-by-functions`.

**Hypotheses and conventions.**

- X totally disconnected; the conclusion is about the ring R tilde, not R tilde^+.
- The proof has three reduction steps, each of which is a separate argument: to X connected, to the residue field algebraically closed, and then the ball argument.

**Construction or proof.**

1. Reduce to X connected by a quasicompactness argument on pi_0(X): the statement over a component is lifted to a clopen neighbourhood and extended by zero.
2. Reduce to R = C algebraically closed: if the result holds for a completed algebraic closure, take Y = Spa(C, C^+); approximate g modulo S tilde^+ by a function defined over a finite extension L of K, and replace it by the coefficients of its characteristic polynomial on the finite free R tilde-algebra R tilde tensor_K L.
3. For R = C algebraically closed: approximate the finitely many g_i by functions on a perfectoid polydisc Y' over X, obtaining g'_i; a quasicompactness argument produces a rational V inside Y' containing the image of Y with the two inclusions (9.1) and (9.2).
4. By the section lemma there is a (C, C^+)-point z of V; evaluating the g'_i at z gives the required f_i in R tilde.

**Acceptance.**

- Section lemma (ECD Lemma 9.5): for C algebraically closed with an open bounded valuation subring C^+ and V an open subset of Spa(C<T_1, ..., T_d>, C^+<T_1, ..., T_d>) surjecting onto Spa(C, C^+), there is a section Spa(C, C^+) -> V. Its proof passes to the formal scheme Spf O^+(V), which is flat and of finite presentation over Spf C^+.
- The reduction to the algebraically closed case is where the characteristic polynomial appears, which is why a finite free algebra is used and not a general finite one.

**Direct prerequisites.** `mathlib:ValuationSubring`, `mathlib:LinearMap.charpoly`, `mathlib:Module.Free`, `mathlib:IsAlgClosed`, `DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`, `DiamondsAndVStacks:D0/pro-constructible-subsets`, `DiamondsAndVStacks:D1/components-of-totally-disconnected`, `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`, `SchemeAndStackFoundations:SF.2`, `AdicSpacesPartII:R2`, `AdicSpacesPartII:R2/specialisation-map`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 9, Lemma 9.4 with proof, pp. 45-46 — The statement; ECD's three-step proof is recorded in the steps.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 9, Lemma 9.5 with proof, pp. 46-47 — The section lemma for rational opens of balls, which the roadmap text lists as a task..

**Theorem signature.** Proposed name `TauCeti.Diamonds.DescendedSubsetsAreCutOutByFunctions`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.
### effective-descent-separated-pro-etale — Effective v-descent for separated pro-etale perfectoid spaces over a strictly totally disconnected base

**Theorem.** Let F be the prestack sending a perfectoid space X to the groupoid of separated pro-etale perfectoid spaces over X. Let X be a strictly totally disconnected perfectoid space and Y -> X a v-cover. Then F(X) -> F(Y/X) is an equivalence of categories.

Identifier: `DiamondsAndVStacks:D3/effective-descent-separated-pro-etale`.

Atlas planet: **v-descent of separated pro-etale spaces**.

**Hypotheses and conventions.**

- X strictly totally disconnected; the separatedness assumption on the pro-etale objects cannot be dropped, and ECD says so explicitly.
- One may assume Y strictly totally disconnected as well, by refining along the universally open cover.

**Construction or proof.**

1. Let Y tilde -> Y carry a descent datum, with induced equivalence relation R = Y tilde x_X Y inside Y tilde x Y tilde. Its image R' inside |Y tilde| x |Y tilde| satisfies the hypotheses of the pro-constructible equivalence relation lemma: it is generalizing since all maps of perfectoid spaces are, quasicompact since Y -> X is, and pro-constructible by the spectral image argument.
2. So for every quasicompact open W inside Y tilde there are R-invariant subsets U inside E inside Y tilde with U open containing W and E an intersection of quasicompact opens.
3. E corresponds to an affinoid pro-etale perfectoid space by the classification over a strictly totally disconnected base, inherits the descent datum, and descends by the affinoid case.
4. The open R-invariant U inside E descends to an open subset of the descended affinoid, hence pro-etale over X; varying W these glue to the required separated pro-etale X tilde -> X.

**Acceptance.**

- The corresponding statement without separatedness is false, which is a required non-example.
- This is the node that makes Proposition 11.3(iv), the quasi-pro-etaleness of an atlas, work.

**Direct prerequisites.** `DiamondsAndVStacks:D0/pro-constructible-equivalence-relation`, `DiamondsAndVStacks:D0/spectral-quotient-criterion`, `DiamondsAndVStacks:D1/topological-classification-of-pro-etale-maps`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`, `DiamondsAndVStacks:D3/effective-descent-affinoid-over-totally-disconnected`, `DiamondsAndVStacks:D3/descent-prestacks-of-perfectoid-spaces`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 9, Proposition 9.6 with proof, p. 47 — The statement; the proof is reproduced in the steps..

**Theorem signature.** Proposed name `TauCeti.Diamonds.EffectiveDescentSeparatedProEtale`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.
### etale-and-finite-etale-are-v-stacks — Separated etale and finite etale perfectoid spaces form v-stacks

**Theorem.** The prestack sending a perfectoid space X to the groupoid of separated etale perfectoid spaces over X is a stack for the v-topology, and so is the prestack of finite etale perfectoid spaces over X. Consequently, for f : Y -> X a map of perfectoid spaces and X tilde -> X a v-cover with pullback f tilde: if f tilde is pro-etale and X is strictly totally disconnected then f is pro-etale; if f tilde is etale then f is etale; if f tilde is finite etale then f is finite etale.

Identifier: `DiamondsAndVStacks:D3/etale-and-finite-etale-are-v-stacks`.

Atlas planet: **Etale and finite etale descend in the v-topology**.

**Hypotheses and conventions.**

- The etale case needs separatedness, as in the pro-etale case. The finite etale case does not, because finite etale maps are automatically separated.
- The last three implications are the v-local nature of the three classes of morphisms, which is what makes the definitions of section 10 work.

**Construction or proof.**

1. Assume X, and then Y, strictly totally disconnected. By the separated pro-etale descent, a separated etale Y tilde over Y with descent data descends to a separated pro-etale X tilde over X; it remains to see that X tilde -> X is etale, which by the topological classification means that |X tilde| -> |X| is a local isomorphism.
2. That holds after pullback along the surjection |Y| -> |X|, and a spectral map that becomes a local isomorphism after a surjective generalizing spectral base change is a local isomorphism (ECD Lemma 9.8), proved using that the diagonal becomes an open immersion and the quotient-map lemma.
3. In general, refine the v-cover by the universally open strictly totally disconnected cover of ECD 7.18, so that Y -> X may be assumed affinoid pro-etale and universally open; then use that the quotient is a quasiseparated locally spectral space by the open case of the spectral quotient criterion to reduce to Y tilde quasicompact, spread out to a finite level by finite-stage descent, and assume Y -> X finite etale Galois with group G.
4. Finally base change to the localization X_x, reduce by the compactification lemma (ECD 9.9) to the case of a finite etale Y tilde, and conclude by descent of finite etale algebras.

**Acceptance.**

- ECD Lemma 9.9: for X = Spa(K, K^+) with K perfectoid and K^+ open, bounded and integrally closed, every quasicompact separated etale Y -> X factors functorially as a quasicompact open immersion into a finite etale Y bar -> X. This is a special case of the canonical compactification of ECD 18.6.
- Corollary 9.11 is the packaged v-local statement used from section 10 onwards.

**Direct prerequisites.** `mathlib:CategoryTheory.Pseudofunctor.IsStack`, `DiamondsAndVStacks:D3/effective-descent-separated-pro-etale`, `DiamondsAndVStacks:D1/universally-open-std-cover`, `DiamondsAndVStacks:D1/topological-classification-of-pro-etale-maps`, `DiamondsAndVStacks:D0/spectral-quotient-criterion`, `DiamondsAndVStacks:D0/generalizing-surjection-is-quotient`, `PerfectoidSpaces:P5/finite-stage-descent-of-qcqs-etale-objects`, `PerfectoidSpaces:P3/almost-purity-theorem`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 9, Proposition 9.7 with proof, pp. 47-48 — The statement of the node.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 9, Lemma 9.9 and Corollary 9.11, p. 49 — The compactification lemma used in the last step, and the packaged v-local corollary..

**Theorem signature.** Proposed name `TauCeti.Diamonds.EtaleAndFiniteEtaleAreVStacks`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.
### etale-and-quasi-pro-etale-morphisms-of-stacks — Etale, finite etale and quasi-pro-etale morphisms of pro-etale stacks

**Definition.** Let f : Y' -> Y be a map of pro-etale stacks on Perfd. Assume f is locally separated, that is, there is an open cover of Y' on which f becomes separated. Then f is quasi-pro-etale if for every strictly totally disconnected perfectoid space X with a map X -> Y the pullback Y' x_Y X is representable and Y' x_Y X -> X is pro-etale; f is etale if for every perfectoid space X with a map X -> Y the pullback is representable and etale over X; f is finite etale if for every perfectoid space X with a map X -> Y the pullback is representable and finite etale over X. Local separatedness is part of the definition of etale and quasi-pro-etale, by ECD Convention 10.2; it is not imposed on finite etale maps, which are automatically separated.

Identifier: `DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`.

Atlas planet: **Quasi-pro-etale morphism**.

**Hypotheses and conventions.**

- Local separatedness is part of the definition, not a consequence: ECD makes it a standing convention because otherwise a slightly different definition would be wanted.
- Representability in perfectoid spaces is imposed on these three classes of morphisms only; it is not imposed on every morphism of diamonds, and the roadmap text says so.
- A map is automatically locally separated if Y' is a perfectoid space and Y is a v-sheaf.

**Construction or proof.**

1. Define the three predicates by the stated pullback conditions.
2. Record ECD Proposition 10.3: for a map of perfectoid spaces the etale and finite etale conditions agree with the usual ones, and over a strictly totally disconnected base pro-etale agrees with quasi-pro-etale.
3. Record that any pro-etale morphism of perfectoid spaces is quasi-pro-etale, and that the converse fails.
4. Prove the permanence properties: composition, two-out-of-three in the form that if g and the composite are in the class then so is f, and stability under base change.

**Uses that determine the API.**

- ECD Definition 11.1 and Proposition 11.5: A diamond is characterised by the existence of a surjective quasi-pro-etale map from a perfectoid space, so this is the defining notion of D4.
- ECD Corollary 11.28 and Proposition 13.6: Quasi-pro-etale maps to a locally spatial diamond have locally spatial source, and separated quasi-pro-etale maps are characterised by their geometric fibres.
- ECD Definition 14.1 and DiamondEtaleCohomology:C0: The etale and quasi-pro-etale sites of a diamond are built from these classes of morphisms.

**Named API.**

- `Perfd.Stack.IsQuasiProEtale` (data): The predicate on a locally separated map of pro-etale stacks defined by pullback to strictly totally disconnected perfectoid spaces.
- `Perfd.Stack.IsEtale` (data): The corresponding predicate defined by pullback to arbitrary perfectoid spaces.
- `Perfd.Stack.IsFiniteEtale` (data): The predicate defined by representable finite etale pullbacks; local separatedness is automatic.
- `Perfd.Stack.IsLocallySeparated` (data): The standing hypothesis of Convention 10.2, that f becomes separated on an open cover of the source.
- `Perfd.Stack.isQuasiProEtale_comp` (functoriality): Composites of quasi-pro-etale maps are quasi-pro-etale, and likewise in the etale and finite etale cases.
- `Perfd.Stack.isQuasiProEtale_of_comp` (characterisation): If g and g composed with f are in the class then so is f.
- `Perfd.Stack.isQuasiProEtale_pullback` (compatibility): The classes are stable under base change.
- `Perfd.Stack.isQuasiProEtale_iff_isProEtale` (equivalence): For a map of perfectoid spaces over a strictly totally disconnected base, quasi-pro-etale is equivalent to pro-etale.
- `Perfd.Stack.isEtale_iff_of_perfectoid` (compatibility): For a map of perfectoid spaces the etale and finite etale predicates agree with the absolute ones.

**Unit tests.**

- `pro_etale_of_perfectoid_spaces` (non-example): A pro-etale map of perfectoid spaces is quasi-pro-etale; the converse fails for a general base (a non-example).
- `open_immersion` (compatibility): An open immersion is etale, and a finite disjoint union of isomorphisms is finite etale (the degenerate cases).
- `locally_separated_is_needed` (characterisation): Without local separatedness the quotient of a perfectoid space by a free discrete group action would be counted as etale over a point in a way ECD's convention excludes.
- `agrees_with_absolute_notion` (characterisation): For a map of perfectoid spaces the predicates agree with the usual etale and finite etale notions of ECD section 6.

**Acceptance.**

- Proposition 10.4 gives composition, the cancellation property and stability under base change for all three classes; the remaining two-out-of-three statement, deducing the property of g from that of f and the composite, needs extra hypotheses and is ECD Proposition 11.30.
- For X strictly totally disconnected, a map of perfectoid spaces is pro-etale exactly when the corresponding map of pro-etale sheaves is quasi-pro-etale.

**Direct prerequisites.** `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.MorphismProperty`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondsAndVStacks:D2/big-pro-etale-site`, `DiamondsAndVStacks:D3/etale-and-finite-etale-are-v-stacks`, `PerfectoidSpaces:P6/pro-etale-map`, `PerfectoidSpaces:P6/pro-etale-stability-and-limits`, `PerfectoidSpaces:P6/kappa-small-perfectoid-space`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 10, Definition 10.1 and Convention 10.2, pp. 49-50 — The definition and the convention, verbatim.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 10, Proposition 10.3 and Proposition 10.4, p. 50 — The comparison with the absolute notions and the permanence properties..

**Signature refinement.** Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.

The precise entries left out of the suggested declarations are `Perfd.Stack.isQuasiProEtale_comp`, `Perfd.Stack.isQuasiProEtale_of_comp`, `Perfd.Stack.isQuasiProEtale_pullback`, `Perfd.Stack.isQuasiProEtale_iff_isProEtale`, `Perfd.Stack.isEtale_iff_of_perfectoid`, `pro_etale_of_perfectoid_spaces`, `open_immersion`, `locally_separated_is_needed`, `agrees_with_absolute_notion`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### sub-v-sheaves-of-totally-disconnected-spaces — Sub-v-sheaves of a totally disconnected space are ind-representable, and quasicompact injections

**Theorem.** Let X be a totally disconnected perfectoid space and Y a sub-v-sheaf of X. Then Y is ind-representable: it is the filtered colimit of the Y_i inside Y inside X that are pro-constructible generalizing subsets of X, each of which is affinoid pro-etale over X. Consequently a quasicompact injection f : Y' -> Y of v-stacks is quasi-pro-etale, and for every totally disconnected perfectoid space X over Y the fibre product Y' x_Y X is represented by a pro-constructible generalizing subset of X.

Identifier: `DiamondsAndVStacks:D3/sub-v-sheaves-of-totally-disconnected-spaces`.

**Hypotheses and conventions.**

- X totally disconnected; Y only a sub-v-sheaf, with no representability assumed.
- The corollary needs quasicompactness of the injection to pass from ind-representable to representable.

**Construction or proof.**

1. For Z affinoid perfectoid with a map Z -> Y, the image of Z in |X| is pro-constructible, since maps of spectral spaces have pro-constructible image, and generalizing, since maps of analytic adic spaces are; so it is an affinoid perfectoid space by the pro-constructible generalizing lemma, and Z -> its image is a v-cover.
2. As Y is a sub-v-sheaf of X, the map extends to the image, and the category of such subsets contained in Y is filtered by the sheaf property; so Y is their filtered colimit.
3. For the corollary reduce to Y = X totally disconnected; quasicompactness of Y' makes the ind-object representable, and a second application of the proposition shows the subset is affinoid pro-etale.

**Acceptance.**

- Applied to closed immersions, to separatedness, and in Proposition 11.10 and Proposition 11.20.
- The conclusion is false for a general sub-v-sheaf of a perfectoid space that is not totally disconnected, so the hypothesis is not decorative.

**Direct prerequisites.** `mathlib:Topology.IsConstructible`, `mathlib:StableUnderGeneralization`, `DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`, `DiamondsAndVStacks:D0/pro-constructible-subsets`, `DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`, `DiamondsAndVStacks:D2/v-descent-of-functions`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 10, Proposition 10.5 with proof, pp. 50-51 — The statement and its proof.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 10, Corollary 10.6 with proof, p. 51 — The corollary, which is how closed immersions and separatedness become quasi-pro-etale notions..

**Theorem signature.** Proposed name `TauCeti.Diamonds.SubVSheavesOfTotallyDisconnectedSpaces`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.
### immersions-separatedness-and-truncatedness — Open and closed immersions, separated maps and 0-truncated maps of pro-etale stacks

**Definition.** Let f : Y' -> Y be a map of pro-etale stacks. It is an open immersion if for every perfectoid space X over Y the pullback Y' x_Y X -> X is representable by an open immersion; a closed immersion if for every totally disconnected perfectoid space X over Y the pullback is representable by a closed immersion; separated if the diagonal is a closed immersion; 0-truncated if for all perfectoid X the functor of groupoids Y'(X) -> Y(X) is faithful. A pro-etale stack Y is separated if Y -> the final object is separated; this last notion needs care, since Y separated does not imply Y quasiseparated.

Identifier: `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`.

Atlas planet: **Valuative criterion for separatedness**.

**Hypotheses and conventions.**

- Closed immersions are tested only on totally disconnected bases, because it is there that sub-v-sheaves are ind-representable.
- 0-truncatedness is equivalent to asking that Y' x_Y X is a sheaf for all X, and to asking that the diagonal of f is an injection; separated maps are 0-truncated.
- The absolute notion of separatedness for a stack is used only occasionally and is not the same as quasiseparatedness: Y = X/phi^Z for X a characteristic p perfectoid space and phi its absolute Frobenius is a separated, non-quasiseparated diamond.

**Construction or proof.**

1. Define the four predicates by the stated pullback conditions.
2. Prove that for a map of perfectoid spaces they agree with the previously defined notions of P4.
3. Prove the valuative criterion: f is separated if and only if it is 0-truncated, quasiseparated, and for every perfectoid field K with ring of integers O_K and open bounded valuation subring K^+, every lifting problem from Spa(K, O_K) to Spa(K, K^+) has at most one solution.
4. Prove the version for general pairs: if f is separated and R is a perfectoid Tate ring with an open integrally closed R^+ inside R^circ, then the lifting problem from Spa(R, R^circ) to Spa(R, R^+) has at most one solution.

**Uses that determine the API.**

- ECD Proposition 11.30 and Lemma 11.31: Separatedness is the hypothesis under which the two-out-of-three property for quasi-pro-etale maps and the local structure of etale maps hold.
- ECD Proposition 13.6 and Proposition 13.12: Separated quasi-pro-etale maps are characterised by their geometric fibres, and a quasicompact separated diamond maps to its maximal Hausdorff quotient representably.
- ECD Definition 15.5 and Lemma 15.6: Open immersions of v-sheaves are what make the gluing of Spd(A, A^+) along rational subsets work.

**Named API.**

- `Perfd.Stack.IsOpenImmersion` (data): The predicate defined by representable open-immersion pullbacks.
- `Perfd.Stack.IsClosedImmersion` (data): The predicate defined by representable closed-immersion pullbacks over totally disconnected bases.
- `Perfd.Stack.IsSeparated` (data): The predicate that the diagonal is a closed immersion.
- `Perfd.Stack.IsZeroTruncated` (data): The predicate that the map is faithful on groupoids of points.
- `Perfd.Stack.isZeroTruncated_iff_diagonal_injection` (characterisation): 0-truncatedness is equivalent to the diagonal being an injection, and to the fibres being sheaves.
- `Perfd.Stack.isSeparated_iff_valuative` (characterisation): The valuative criterion for separatedness of ECD 10.9.
- `Perfd.Stack.isSeparated_uniqueness_general_pair` (characterisation): The variant for a general perfectoid Tate pair, ECD 10.10.
- `Perfd.Stack.isSeparated_comp` (functoriality): The four classes are stable under composition and base change.
- `Perfd.Stack.isSeparated_of_perfectoid` (compatibility): For a map of perfectoid spaces the notions agree with those of PerfectoidSpaces:P4.

**Unit tests.**

- `open_immersion_of_perfectoid_spaces` (characterisation): An open immersion of perfectoid spaces is an open immersion of v-sheaves and conversely.
- `separated_not_quasiseparated` (non-example): X/phi^Z for X a characteristic p perfectoid space and phi its absolute Frobenius is separated and not quasiseparated (the required non-example).
- `classifying_stack_not_zero_truncated` (non-example): The classifying stack of a nontrivial locally profinite group is not 0-truncated (the degenerate stack case).
- `valuative_criterion` (characterisation): A map of perfectoid spaces is separated exactly when the valuative criterion holds, matching PerfectoidSpaces:P4.

**Acceptance.**

- The example Y = X/phi^Z is separated but not quasiseparated, which ECD gives as Remark 10.8 and which is a required non-example.
- The valuative criterion is the tool by which separatedness is checked in sections 11 to 15.

**Direct prerequisites.** `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.Functor.Faithful`, `DiamondsAndVStacks:D3/sub-v-sheaves-of-totally-disconnected-spaces`, `DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`, `DiamondsAndVStacks:D1/totally-disconnected-perfectoid-space`, `PerfectoidSpaces:P4/valuative-criterion-separatedness`, `PerfectoidSpaces:P4/maps-of-affinoid-perfectoid-spaces-are-separated`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 10, Definition 10.7 and Remark 10.8, p. 51 — The definitions, verbatim, with Remark 10.8's warning about the absolute notion.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 10, Proposition 10.9 and Proposition 10.10, pp. 51-52 — The valuative criterion for separatedness and its general-pair variant..

**Signature refinement.** Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.

The precise entries left out of the suggested declarations are `Perfd.Stack.IsZeroTruncated`, `Perfd.Stack.isZeroTruncated_iff_diagonal_injection`, `Perfd.Stack.isSeparated_iff_valuative`, `Perfd.Stack.isSeparated_uniqueness_general_pair`, `Perfd.Stack.isSeparated_comp`, `Perfd.Stack.isSeparated_of_perfectoid`, `open_immersion_of_perfectoid_spaces`, `separated_not_quasiseparated`, `classifying_stack_not_zero_truncated`, `valuative_criterion`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### v-local-nature-of-morphism-classes — The classes of morphisms may be checked v-locally on the target

**Theorem.** Let f : Y' -> Y be a map of v-stacks, g : Y tilde -> Y a surjective map of v-stacks and f tilde the pullback of f. If f tilde is quasicompact, respectively quasiseparated, then so is f; if f tilde is an open, respectively closed, immersion then so is f; if f tilde is separated then so is f; if f tilde is finite etale then so is f; if f tilde is separated and etale then f is separated and etale; if f tilde is separated and quasi-pro-etale then f is separated and quasi-pro-etale.

Identifier: `DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes`.

**Hypotheses and conventions.**

- The last two statements require separatedness, which is where the descent theorems of section 9 are applied; without it they are false.
- For the quasi-pro-etale statement one reduces to X strictly totally disconnected, and for the etale statement to X arbitrary.

**Construction or proof.**

1. For quasicompactness reduce to Y an affinoid perfectoid X and Y tilde a v-cover X tilde by an affinoid; a jointly surjective family over Y' pulls back to one over Y tilde', which has a finite subcover, and its image is again surjective. Quasiseparatedness follows by passing to the diagonal.
2. For the immersions reduce to Y = X and Y tilde = X tilde; the open case follows because |X tilde| -> |X| is a quotient map, and the closed case adds that over a totally disconnected X the map is representable by the corollary on quasicompact injections.
3. Separatedness reduces to the closed-immersion case via the diagonal.
4. Finite etale and separated etale follow from the v-stack property of those prestacks, and separated quasi-pro-etale from effective descent of separated pro-etale spaces over a strictly totally disconnected base.

**Acceptance.**

- This is the statement that makes all of the definitions of section 10 checkable in practice, and is used in Lemma 10.13, Proposition 11.3, Proposition 11.8 and Proposition 11.15.
- The failure without separatedness is the same failure as in Proposition 9.6.

**Direct prerequisites.** `DiamondsAndVStacks:D3/etale-and-finite-etale-are-v-stacks`, `DiamondsAndVStacks:D3/effective-descent-separated-pro-etale`, `DiamondsAndVStacks:D3/sub-v-sheaves-of-totally-disconnected-spaces`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`, `DiamondsAndVStacks:D0/generalizing-surjection-is-quotient`, `DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 10, Proposition 10.11 with proof, pp. 52-53 — The statement of the node, with its proof..

**Theorem signature.** Proposed name `TauCeti.Diamonds.VLocalNatureOfMorphismClasses`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.
### locally-profinite-torsors — Torsors under a locally profinite group and their pro-etale presentation

**Construction.** For a topological space T let T underline be the v-sheaf sending X to the continuous maps from |X| to T. Let G be a locally profinite group. A G underline-torsor is a map f : X tilde -> X of v-stacks with an action of G underline over X such that v-locally on X there is a G underline-equivariant isomorphism between X tilde and G underline times X. If X is a perfectoid space, then X tilde is representable by a perfectoid space, X tilde -> X is pro-etale, universally open and a v-cover; for every open subgroup K of G the pushout X tilde_K along the discrete G-set G/K is separated etale over X, the transition map X tilde_{K'} -> X tilde_K is finite etale when K' inside K has finite index, and X tilde is the inverse limit of the X tilde_K.

Identifier: `DiamondsAndVStacks:D3/locally-profinite-torsors`.

Atlas planet: **Locally profinite torsors**.

**Hypotheses and conventions.**

- G locally profinite; X a perfectoid space. The conclusion that X tilde is representable is a theorem, not part of the definition.
- The functor T mapsto T underline is the bridge between topology and v-sheaves and is used again for the Berkovich quotient in D5 and for the compact Hausdorff diamonds in D4.

**Construction or proof.**

1. Define T underline and check that it is a v-sheaf, using that a v-cover of qcqs perfectoid spaces induces a quotient map on topological spaces.
2. Define G underline-torsors by v-local triviality.
3. In the split case X tilde = G underline times X one has X tilde_K = (G/K) underline times X, a disjoint union of copies of X; so X tilde_K -> X is separated etale and X tilde_{K'} -> X tilde_K is finite etale for K' of finite index in K.
4. In general these properties are v-local on X, so they follow from the v-local nature of the morphism classes; X tilde = lim_K X tilde_K may also be checked v-locally, which shows X tilde -> X is pro-etale.
5. X tilde -> X is a v-cover since v-locally it has a section, and universally open since every open subspace comes from some X tilde_K, X tilde -> X tilde_K is surjective, and X tilde_K -> X is etale, hence open.

**Uses that determine the API.**

- ECD Proposition 11.24 and Proposition 11.26: The structure of a spatial diamond with all etale covers split is analysed through the profinite group torsor R_0^circ = G underline times Spa(C, O_C).
- ECD Proposition 13.12: The reduction of a quasicompact separated diamond to a spatial one constructs the quotient Spa(C, C^+)/G underline, which is a spatial diamond by universal openness of the torsor.
- BunGAndNewtonStrata and VStackSheavesAndLisseCategories: The classifying stack of a locally profinite group is a small v-stack and the basic non-representable example of the whole theory.

**Named API.**

- `Perfd.underlineSheaf` (data): The v-sheaf T underline attached to a topological space T, sending X to the continuous maps from |X| to T.
- `Perfd.underlineSheaf.isVSheaf` (instance): T underline is a v-sheaf.
- `Perfd.underlineSheaf.functorial` (functoriality): T mapsto T underline is functorial and sends profinite sets to affinoid perfectoid spaces after multiplying by a base point.
- `Perfd.IsTorsor` (data): The predicate that f is a G underline-torsor, defined by v-local triviality.
- `Perfd.Torsor.representable` (characterisation): A G underline-torsor over a perfectoid space is representable by a perfectoid space.
- `Perfd.Torsor.isProEtale` (characterisation): It is pro-etale, universally open and a v-cover.
- `Perfd.Torsor.levelSpace` (constructor): For K an open subgroup, the pushout X tilde_K along G/K, which is separated etale over X.
- `Perfd.Torsor.levelSpace_finiteEtale` (structure): For K' of finite index in K the transition map is finite etale.
- `Perfd.Torsor.asLimit` (universal-property): X tilde is the inverse limit of the X tilde_K over open subgroups K.

**Unit tests.**

- `split_torsor` (degenerate): G underline times X is a G underline-torsor over X and its level spaces are disjoint unions of copies of X (the degenerate case).
- `finite_group` (non-example): For G finite, a G underline-torsor is a finite etale Galois cover with group G; a definition that does not recover this is wrong.
- `profinite_over_geometric_point` (characterisation): For X = Spa(C, O_C) and G profinite, a torsor is X times S for S a profinite set with a free transitive G-action.
- `not_etale` (non-example): For G infinite profinite the torsor X tilde -> X is pro-etale and not etale (a non-example separating the two classes).

**Acceptance.**

- For G profinite and X = Spa(C, O_C), a G underline-torsor is X times S for a profinite set S with a free transitive G-action, which is the shape appearing in the proofs of Proposition 11.26 and Proposition 13.12.
- The classifying stack of GL_n(Q_p) is the motivating example of the introduction and is [*/G], whose atlas * → BG is a G-torsor.

**Direct prerequisites.** `mathlib:ContinuousMap`, `mathlib:ProfiniteGrp`, `mathlib:TotallyDisconnectedSpace`, `DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes`, `DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`, `DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site`, `DiamondsAndVStacks:D0/generalizing-surjection-is-quotient`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 10, Definition 10.12, p. 53 — The definitions, verbatim.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 10, Lemma 10.13 with proof, pp. 53-54 — The theorem, with the full list of properties the API must expose..

**Signature refinement.** Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.

The precise entries left out of the suggested declarations are `Perfd.IsTorsor`, `Perfd.Torsor.representable`, `Perfd.Torsor.isProEtale`, `Perfd.Torsor.levelSpace`, `Perfd.Torsor.levelSpace_finiteEtale`, `Perfd.Torsor.asLimit`, `split_torsor`, `finite_group`, `profinite_over_geometric_point`, `not_etale`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.

**Stage acceptance.** The definitions, API and discriminating tests above cover every target of D3. Every prerequisite chain ends at the pinned baseline, an exact foreign node, a supplier request or an explicit gap. The following work is required before closing the stage:

- Supplier contract: SchemeAndStackFoundations:SF.2 — ECD 9.5: a finitely presented faithfully flat cover of a strictly henselian local scheme admits a finite flat locally free refinement. One route is Stacks 0571–0572 (quasi-finite flat refinement) followed by the finite local-factor theorem over a henselian ring. For R=C⁺/C⁰⁰, a valuation ring with algebraically closed fraction field, every finite flat cover has an R-valued section: choose a generic point and extend it by properness and the valuation criterion. Strict henselianity alone does not split arbitrary finite flat covers.
- Supplier contract: AdicSpacesPartII:R2 — Raynaud–Gruson for valuation rings of arbitrary height: a flat finite-type algebra over a valuation ring is finitely presented. Existing R2/flat-tft-is-tfp covers complete rank-one O_K; extend it to the arbitrary-height C⁺ used in ECD 9.5. Also extend R2/specialisation-map from classical closed points to lifting K-valued special-fibre points to O_C-valued points for the flat finitely presented formal model in that lemma.
- Signature refinement: instantiate and state the explicitly omitted API/tests of DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks, DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness, DiamondsAndVStacks:D3/locally-profinite-torsors. See signatureCoverage for each name, statement and required interface; prove no implementations here.
- Named theorem signatures: supply the carrier/interface and state DiamondsAndVStacks:D3/descent-prestacks-of-perfectoid-spaces, DiamondsAndVStacks:D3/effective-descent-affinoid-over-totally-disconnected, DiamondsAndVStacks:D3/descended-subsets-are-cut-out-by-functions, DiamondsAndVStacks:D3/effective-descent-separated-pro-etale, DiamondsAndVStacks:D3/etale-and-finite-etale-are-v-stacks, DiamondsAndVStacks:D3/sub-v-sheaves-of-totally-disconnected-spaces, DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes. Their exact mathematical statements and proposed names are in signatureCoverage.namedTargets and the suggested comment ledger.

## D4 — Diamonds and small v-stacks

Diamonds are quotients of characteristic-p perfectoid spaces by pro-étale equivalence relations. The atlas and its relation determine a quotient topology, but this topology must be shown independent of the atlas before it is used as a functor. Small v-stacks permit stabilizers, and require smallness of the diagonal relation. The relation, sheaf quotient and quotient stack have distinct roles. Locally profinite quotients inherit smallness and the quotient topology without an unrestricted component-orbit formula.

**Target coverage.** The ten nodes cover ECD 11.1 to 11.16 and the core of section 12: diamonds and pro-etale equivalence relations, the quotient presentation with independence of the atlas and quasi-pro-etaleness of the atlas, the characterisation by a surjective quasi-pro-etale map with the three stability corollaries, the v-sheaf property with the injection and isomorphism criteria, the compact Hausdorff examples, the underlying topological space with the open-subfunctor correspondence, small v-sheaves and small v-stacks, the space and open substacks of a small v-stack with the precise relation between surjectivity and topological surjectivity, and the isomorphism and injectivity criteria on geometric points. Locally profinite small quotients and their quotient topologies are explicit targets.

### diamond — Diamonds and pro-etale equivalence relations

**Definition.** From here on one works with the full subcategory Perf of perfectoid spaces of characteristic p. A diamond is a sheaf Y for the pro-etale topology on Perf that can be written as a quotient X/R, where X is representable by a perfectoid space and R inside X x X is a representable equivalence relation whose two projections s, t : R -> X are pro-etale. Such an R is called a pro-etale equivalence relation on X. No assumption such as representability of the diagonal is made, because there is no good notion of relatively representable morphisms of perfectoid spaces.

Identifier: `DiamondsAndVStacks:D4/diamond`.

Atlas planet: **Diamond**.

**Hypotheses and conventions.**

- Characteristic p is part of the setting from section 11 onwards; general analytic adic spaces over Z_p enter only through D6.
- R is required to be representable and the projections pro-etale; the diagonal of Y is not assumed representable, and ECD says explicitly why.

**Construction or proof.**

1. Define Perf as the full subcategory of Perfd of characteristic p perfectoid spaces, and record that it inherits the pro-etale and v-topologies.
2. Define a pro-etale equivalence relation on X in Perf as a representable subobject R of X x X that is an equivalence relation with s, t pro-etale.
3. Define a diamond as a pro-etale sheaf on Perf isomorphic to X/R for some such pair.
4. Record that every diamond is a small sheaf, since it is a quotient of a representable one.

**Uses that determine the API.**

- ECD Theorem 1.5 and Lemma 15.6: The functor from analytic adic spaces over Z_p to locally spatial diamonds is the endpoint of this roadmap; the target category must exist first.
- ECD Definition 13.1 and Definition 14.1: Representability in diamonds and the etale and quasi-pro-etale sites of a diamond are the input of DiamondEtaleCohomology and DiamondSixOperations.
- FarguesFontaineDiamonds and BunGAndNewtonStrata: The Fargues-Fontaine curve as a diamond and Bun_G are built as quotients of this shape.

**Named API.**

- `Perf` (data): The full subcategory of perfectoid spaces of characteristic p, with its pro-etale and v-topologies.
- `Perf.IsProEtaleEquivRel` (data): The predicate that a representable equivalence relation on a perfectoid space has pro-etale projections.
- `Perf.Diamond` (structure): The predicate on a pro-etale sheaf on Perf that it admits a presentation as such a quotient.
- `Perf.Diamond.ofPerfectoid` (constructor): Every characteristic p perfectoid space is a diamond.
- `Perf.Diamond.presentation` (characterisation): A chosen presentation Y = X/R, together with the maps X -> Y and R -> X x X.
- `Perf.Diamond.isSmall` (structure): Every diamond is a small sheaf.
- `Perf.Diamond.relation_eq` (characterisation): For a presentation, the natural map R -> X x_Y X is an isomorphism.
- `Perf.Diamond.quasiProEtale_atlas` (structure): The map X -> Y from a presentation is surjective and quasi-pro-etale.

**Unit tests.**

- `representable` (degenerate): A characteristic p perfectoid space is a diamond, with R the diagonal (the degenerate case).
- `profinite_quotient` (characterisation): For S profinite with a free action of a finite group G, S underline times Spa(C, O_C) modulo G is a diamond which is a perfectoid space.
- `compact_hausdorff` (non-example): For T compact Hausdorff, T underline times Spa(K, O_K) is a diamond whose underlying space is T, which is not spectral in general (a required test of this layer).
- `not_every_v_sheaf` (non-example): Not every v-sheaf is a diamond; the definition must not be weakened to 'v-sheaf with a surjection from a perfectoid space' (a non-example, since that is the definition of a small v-sheaf).

**Acceptance.**

- Every perfectoid space in Perf is a diamond, with R the diagonal.
- Spd Q_p is a diamond that is not representable; the compact Hausdorff examples of ECD 11.12 are diamonds whose underlying space is not spectral.

**Direct prerequisites.** `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.GrothendieckTopology`, `DiamondsAndVStacks:D2/big-pro-etale-site`, `DiamondsAndVStacks:D2/cutoff-independence`, `DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`, `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`, `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Definition 11.1 and Definition 11.2, p. 54 — The two definitions, verbatim.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, remark after Definition 11.2, p. 54 — The warning the roadmap text repeats..

**Signature refinement.** Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.

The precise entries left out of the suggested declarations are `Perf`, `Perf.Diamond.isSmall`, `Perf.Diamond.quasiProEtale_atlas`, `representable`, `profinite_quotient`, `compact_hausdorff`, `not_every_v_sheaf`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### quotient-presentations-of-diamonds — Quotients by pro-etale equivalence relations, independence of the atlas, and quasi-pro-etaleness of the atlas

**Theorem.** Let X be in Perf and R inside X x X a pro-etale equivalence relation. Then the quotient sheaf Y = X/R is a diamond; the natural map R -> X x_Y X of sheaves on Perf is an isomorphism; for any pro-etale cover X tilde -> X by a perfectoid space the induced R tilde on X tilde is again a pro-etale equivalence relation and X tilde/R tilde -> Y is an isomorphism; and the map X -> Y is quasi-pro-etale.

Identifier: `DiamondsAndVStacks:D4/quotient-presentations-of-diamonds`.

**Hypotheses and conventions.**

- The last statement is the substantial one and needs the descent of separated pro-etale spaces over a strictly totally disconnected base.
- For the last statement one first replaces X by a disjoint union of affinoid opens, which makes s and t separated.

**Construction or proof.**

1. R -> X x_Y X is injective as both are subsheaves of X x X. For surjectivity, a map Z -> X x_Y X gives two maps a, b : Z -> X agreeing in Y, so after a pro-etale cover Z tilde -> Z the composite factors over R; the two maps from Z tilde x_Z Z tilde to R agree, so the map descends.
2. For the atlas independence, R tilde is representable as a fibre product and its projections are pro-etale by base change; surjectivity and injectivity of X tilde/R tilde -> Y are then checked directly.
3. For quasi-pro-etaleness, replace X by the disjoint union of an affinoid cover, so that s and t are separated. Given X' strictly totally disconnected over Y, choose a pro-etale cover X' tilde -> X' with a lift to X; then X' tilde x_{X'} W is X' tilde x_X R, representable, pro-etale and separated over X' tilde, so W -> X' is representable, separated and pro-etale by the v-local criterion.

**Acceptance.**

- The independence statement is what makes |Y| and all later invariants well defined.
- Proposition 11.4: products and fibre products exist in the category of diamonds, by choosing compatible presentations and using that the diagonal of a representable map is pro-etale.

**Direct prerequisites.** `DiamondsAndVStacks:D4/diamond`, `DiamondsAndVStacks:D3/effective-descent-separated-pro-etale`, `DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes`, `DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`, `PerfectoidSpaces:P6/pro-etale-map`, `PerfectoidSpaces:P6/pro-etale-stability-and-limits`, `PerfectoidSpaces:P6/kappa-small-perfectoid-space`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Proposition 11.3 with proof, pp. 54-55 — The statement of the node.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Proposition 11.4 with proof, p. 55 — The permanence statement proved immediately after, which the acceptance records..

**Theorem signature.** Proposed name `TauCeti.Diamonds.QuotientPresentationsOfDiamonds`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.
### atlas-characterisation-of-diamonds — A pro-etale sheaf is a diamond exactly when it admits a surjective quasi-pro-etale map from a perfectoid space

**Theorem.** Let Y be a pro-etale sheaf on Perf. Then Y is a diamond if and only if there is a surjective quasi-pro-etale morphism X -> Y from a perfectoid space X. If X is a disjoint union of strictly totally disconnected spaces then R = X x_Y X inside X x X is a pro-etale equivalence relation with Y = X/R. Consequently: if there is a surjective quasi-pro-etale map Y' -> Y with Y' a diamond then Y is a diamond; if f : Y' -> Y is quasi-pro-etale and Y is a diamond then Y' is a diamond; and if X is a diamond with an equivalence relation R whose projections are quasi-pro-etale then X/R is a diamond.

Identifier: `DiamondsAndVStacks:D4/atlas-characterisation-of-diamonds`.

Atlas planet: **Quasi-pro-etale atlas**.

**Hypotheses and conventions.**

- The atlas may always be taken to be a disjoint union of strictly totally disconnected perfectoid spaces, which is how every later argument uses it.
- In the last statement R is only assumed to be a pro-etale sheaf; it is automatically a diamond because s is quasi-pro-etale.

**Construction or proof.**

1. Given such an X, take it to be a disjoint union of strictly totally disconnected spaces; then R = X x_Y X -> X is pro-etale by the definition of quasi-pro-etale, and the argument of the atlas independence gives Y = X/R.
2. For the first corollary compose the two surjective quasi-pro-etale maps.
3. For the second pull back the atlas of Y along f.
4. For the third reduce to X a separated perfectoid space; then X -> X/R is a surjective separated quasi-pro-etale map and a v-cover, so the v-local criterion applies.

**Acceptance.**

- The three corollaries are ECD 11.6, 11.7 and 11.8 and are the stability properties the roadmap text asks for.
- The statement must not be strengthened to 'a v-sheaf with a surjective quasi-pro-etale map is a diamond' without the sheaf being a pro-etale sheaf; the correct general criterion is Theorem 12.18.

**Direct prerequisites.** `DiamondsAndVStacks:D4/quotient-presentations-of-diamonds`, `DiamondsAndVStacks:D4/diamond`, `DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`, `DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Proposition 11.5 with proof, p. 56 — The characterisation.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Propositions 11.6, 11.7 and 11.8, p. 56 — The three stability corollaries..

**Theorem signature.** Proposed name `TauCeti.Diamonds.AtlasCharacterisationOfDiamonds`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.
### diamonds-are-v-sheaves — Diamonds are sheaves for the v-topology

**Theorem.** Let Y be a diamond. Then Y is a sheaf for the v-topology. Moreover, if f : Y' -> Y is an injection of v-sheaves and Y is a diamond, then Y' is a diamond; and a qcqs map f : Y -> X of diamonds is an isomorphism if and only if f(K, K^+) is a bijection for every algebraically closed perfectoid field K with an open and bounded valuation subring K^+.

Identifier: `DiamondsAndVStacks:D4/diamonds-are-v-sheaves`.

Atlas planet: **Diamonds are v-sheaves**.

**Hypotheses and conventions.**

- The proof follows an argument of Fargues. The presentation may be taken with X a disjoint union of totally disconnected perfectoid spaces.
- In the isomorphism criterion the qcqs hypothesis cannot be dropped, and the test fields must be algebraically closed.

**Construction or proof.**

1. Injectivity of Y(Z) -> Y(Z tilde): lift to a pro-etale cover so that the two maps come from maps to X; the pair maps into R after pulling back along the v-cover, and R is a v-sheaf, so the pair maps into R.
2. Surjectivity: reduce to Z and Z tilde strictly totally disconnected. For a map from Z tilde to Y, the fibre product W tilde = Z tilde x_Y X is representable, pro-etale and separated over Z tilde by the atlas theorem, and carries a descent datum relative to Z tilde over Z; by effective descent of separated pro-etale spaces it descends to W -> Z, and the map W tilde -> X descends to W -> X because X is a v-sheaf.
3. The induced map W x_Z W -> X x X factors over R because it does after the v-cover, so the map W -> X -> Y factors over the required Z -> Y.
4. The injection statement reduces, after pulling back an atlas, to a sub-v-sheaf of a totally disconnected space, which is a filtered colimit of pro-constructible generalizing subsets; their disjoint union is a quasi-pro-etale surjection onto Y'.
5. The isomorphism criterion reduces to the corresponding statement for qcqs perfectoid spaces, supplied by PerfectoidSpaces:P4.

**Acceptance.**

- Theorem 1.2's consequence that all diamonds are v-sheaves is what allows every later construction to be checked v-locally.
- The isomorphism criterion is used in Lemma 11.27, Proposition 11.30, Lemma 12.5 and Proposition 13.12.

**Direct prerequisites.** `DiamondsAndVStacks:D4/atlas-characterisation-of-diamonds`, `DiamondsAndVStacks:D3/effective-descent-separated-pro-etale`, `DiamondsAndVStacks:D3/sub-v-sheaves-of-totally-disconnected-spaces`, `DiamondsAndVStacks:D2/v-descent-of-functions`, `DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`, `PerfectoidSpaces:P4/valuative-criterion-separatedness`, `PerfectoidSpaces:P4/maps-of-affinoid-perfectoid-spaces-are-separated`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Proposition 11.9 with proof, pp. 56-57 — The statement; ECD notes that the proof follows arguments of Fargues.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Proposition 11.10 and Lemma 11.11, p. 57 — The injection statement and the isomorphism criterion proved alongside..

**Theorem signature.** Proposed name `TauCeti.Diamonds.DiamondsAreVSheaves`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.
### compact-hausdorff-diamonds — Compact Hausdorff spaces embed fully faithfully into diamonds

**Application.** Fix a perfectoid field K of characteristic p. The functor sending a compact Hausdorff space T to T underline times Spa(K, O_K) is a fully faithful functor from compact Hausdorff spaces to diamonds over Spa(K, O_K). For S profinite, S underline times Spa(K, O_K) is the affinoid perfectoid space Spa(C^0(S, K), C^0(S, O_K)). The underlying topological space of T underline times Spa(K, O_K) is T, so it can be far from spectral.

Identifier: `DiamondsAndVStacks:D4/compact-hausdorff-diamonds`.

**Hypotheses and conventions.**

- T compact Hausdorff; K perfectoid of characteristic p. Full faithfulness uses that every surjection of compact Hausdorff spaces is a quotient map.
- This is one of the required tests of the layer, and it is what shows that the underlying space of a diamond need not be spectral.

**Construction or proof.**

1. For S profinite, write S as a limit of finite sets S_i; then S underline = lim S_i and S underline times Spa(K, O_K) is the limit of the S_i times Spa(K, O_K), which is Spa(C^0(S, K), C^0(S, O_K)).
2. For T compact Hausdorff take a profinite presentation S -> T; the induced R = S x_T S is profinite, so R underline times Spa(K, O_K) is a pro-etale equivalence relation on S underline times Spa(K, O_K), and the quotient is T underline times Spa(K, O_K).
3. Injectivity of the map from the quotient is the observation that two maps to S underline agreeing in T underline give a map to R underline; surjectivity uses that a continuous map from an affinoid |Z| to T factors through pi_0(Z).
4. Full faithfulness reduces to the profinite case, where it is the definition, and then to a general T by the quotient-map property of S -> T.

**Acceptance.**

- |T underline times Spa(K, O_K)| = T, which is ECD Example 11.16; for T the unit interval this is a diamond whose underlying space is not spectral.
- This example is why spatiality is a real restriction and why ECD introduces it at all.

**Direct prerequisites.** `DiamondsAndVStacks:D0/profinite-presentation-of-compact-hausdorff`, `DiamondsAndVStacks:D4/diamond`, `DiamondsAndVStacks:D4/quotient-presentations-of-diamonds`, `DiamondsAndVStacks:D3/locally-profinite-torsors`, `DiamondsAndVStacks:D4/underlying-topological-space`, `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Example 11.12 with proof, pp. 58-59 — The statement and its proof.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Example 11.12, p. 58 — The identification in the profinite case, which is the computational content..

**Theorem signature.** Proposed name `TauCeti.Diamonds.CompactHausdorffDiamonds`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.
### underlying-topological-space — The underlying topological space of a diamond and the open-subfunctor correspondence

**Construction.** Let Y be a diamond with a presentation Y = X/R. There is a canonical bijection between |X|/|R| and the set of equivalence classes of maps Spa(K, K^+) -> Y, where K runs over perfectoid fields with an open and bounded valuation subring K^+, two maps being equivalent if they are dominated by a third through surjective maps. The quotient topology induced on this set by the surjection |X| -> |Y| is independent of the presentation, and |Y| with that topology is the underlying topological space of Y. Any open subfunctor of Y is a diamond, and U mapsto |U| is a bijection between open immersions into Y and open subsets of |Y|; a surjection of diamonds induces a quotient map on underlying spaces.

Identifier: `DiamondsAndVStacks:D4/underlying-topological-space`.

Atlas planet: **Underlying topological space**.

**Hypotheses and conventions.**

- The equivalence relation on the set of maps from Spa(K, K^+) is an equivalence relation, which itself needs the surjectivity of a fibre product of surjections of such spectra.
- Independence of the presentation is proved by comparing two presentations through a third.

**Construction or proof.**

1. Show that the given relation on maps Spa(K, K^+) -> Y is an equivalence relation, using surjectivity of |Spa(K_1, K_1^+) x_{Spa(K_0, K_0^+)} Spa(K_2, K_2^+)| onto the fibre product of the spaces.
2. Construct |X| -> |Y| and show it is surjective, by lifting a map from Spa(K, K^+) along a pro-etale cover after enlarging K, and that it factors bijectively through |X|/|R|.
3. For independence take another presentation Y = X'/R'; X x_Y X' is a diamond, so choose a pro-etale surjection X'' onto it; |X''| -> |X| and |X''| -> |X'| are quotient maps, so the three quotient topologies agree.
4. For the open-subfunctor correspondence: an open immersion U inside Y gives an R-invariant open U_X inside X and U = U_X/(R restricted), and conversely; the two processes are inverse. The final statement follows from the fact that the prestack of open subsheaves is a v-stack.

**Uses that determine the API.**

- ECD Definition 11.17 and Proposition 11.18: Spatiality is the condition that |Y| has a basis given by quasicompact open subfunctors, so the construction must come first.
- ECD Lemma 12.11 and Theorem 12.18: The difference between a surjection of v-stacks and a surjection on underlying spaces is a statement about this construction.
- ECD Lemma 15.6 and DiamondEtaleCohomology:C1: The identification |Y^diamond| = |Y| for an analytic adic space is the main topological content of D6.

**Named API.**

- `Perf.Diamond.space` (data): The underlying topological space |Y| of a diamond Y.
- `Perf.Diamond.space_eq_quotient` (characterisation): For any presentation Y = X/R, |Y| is the quotient |X|/|R| with the quotient topology.
- `Perf.Diamond.space_eq_points` (characterisation): |Y| is in canonical bijection with the equivalence classes of maps Spa(K, K^+) -> Y.
- `Perf.Diamond.space_functorial` (functoriality): Y mapsto |Y| is a functor to topological spaces.
- `Perf.Diamond.openSubfunctorEquiv` (equivalence): Open immersions into Y correspond bijectively to open subsets of |Y|.
- `Perf.Diamond.isQuotientMap_of_surjective` (structure): A surjection of diamonds induces a quotient map of underlying spaces.
- `Perf.Diamond.space_of_perfectoid` (compatibility): For a perfectoid space the construction returns the usual underlying topological space.
- `Perf.Diamond.isOpenImmersion_iff` (characterisation): A map of diamonds is an open immersion exactly when it is an isomorphism onto the open subfunctor attached to an open subset of |Y|.

**Unit tests.**

- `perfectoid_space` (characterisation): For Y a perfectoid space, |Y| is the underlying space of Y.
- `compact_hausdorff` (non-example): For Y = T underline times Spa(K, O_K), |Y| = T; in particular |Y| need not be spectral (the required non-example).
- `independent_of_presentation` (non-example): Two presentations of the same diamond give the same topology; a construction depending on the atlas is wrong.
- `open_subfunctors` (degenerate): Open subfunctors of a perfectoid space correspond to open subsets, matching the classical statement (the degenerate case).

**Acceptance.**

- For Y a perfectoid space, |Y| is the usual underlying space; for Y = T underline times Spa(K, O_K), |Y| = T.
- The functoriality of Y mapsto |Y| is immediate from the construction.

**Direct prerequisites.** `DiamondsAndVStacks:D4/diamond`, `DiamondsAndVStacks:D4/quotient-presentations-of-diamonds`, `DiamondsAndVStacks:D0/generalizing-surjection-is-quotient`, `DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes`, `DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Proposition 11.13 and Definition 11.14, pp. 59-60 — The construction and the independence statement.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Proposition 11.15 with proof, p. 60 — The open-subfunctor correspondence and the quotient-map statement..

**Signature refinement.** Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.

The precise entries left out of the suggested declarations are `Perf.Diamond.space_eq_quotient`, `Perf.Diamond.space_eq_points`, `Perf.Diamond.space_functorial`, `Perf.Diamond.openSubfunctorEquiv`, `Perf.Diamond.isQuotientMap_of_surjective`, `Perf.Diamond.space_of_perfectoid`, `Perf.Diamond.isOpenImmersion_iff`, `perfectoid_space`, `compact_hausdorff`, `independent_of_presentation`, `open_subfunctors`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### small-v-sheaves-and-small-v-stacks — Small v-sheaves and small v-stacks

**Definition.** A small v-sheaf is a v-sheaf Y on Perf such that there is a surjective map of v-sheaves X -> Y from a perfectoid space X. A small v-stack is a v-stack Y on Perf such that there is a surjective map of v-stacks X -> Y from a perfectoid space X for which R = X x_Y X is a small v-sheaf. Every diamond is a small v-sheaf; a v-sheaf admitting a surjection from a diamond is a small v-sheaf; and every quasicompact v-sheaf, and more generally every qcqs v-stack, is small.

Identifier: `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`.

Atlas planet: **Small v-stack**.

**Hypotheses and conventions.**

- The smallness condition on R in the stack case is what makes the notion manageable; without it the 2-fibre product could fail to be small.
- Quasicompact objects are automatically small, because one may cover by the disjoint union of all maps from perfectoid spaces and then extract a finite subcover.

**Construction or proof.**

1. Define small v-sheaves and small v-stacks by the stated conditions.
2. Record the three consequences: diamonds are small v-sheaves; a v-sheaf with a surjection from a diamond is small; quasicompact v-sheaves and qcqs v-stacks are small.
3. Record ECD Proposition 12.3: for a small v-sheaf Y and a surjection X -> Y from a diamond, R = X x_Y X is a diamond and Y = X/R as v-sheaves; if Y is quasiseparated and X is locally spatial then R is locally spatial, and if Y is qcqs and X is spatial then R is spatial.

**Uses that determine the API.**

- ECD Definition 12.8 and Proposition 12.9: The underlying topological space and the open sub-v-stacks of a small v-stack are defined from such a presentation.
- ECD Theorem 12.18: The criterion for a spatial v-sheaf to be a diamond is stated for small v-sheaves, so the class must be defined first.
- VStackSheavesAndLisseCategories and DiamondSixOperations: The six-functor formalism is developed for small v-stacks, so this is the ambient category of all later coefficient theory.

**Named API.**

- `Perf.IsSmallVSheaf` (data): The predicate that a v-sheaf admits a surjection from a perfectoid space.
- `Perf.IsSmallVStack` (data): The predicate that a v-stack admits a surjection from a perfectoid space with small diagonal fibre product.
- `Perf.IsSmallVSheaf.ofDiamond` (constructor): Every diamond is a small v-sheaf.
- `Perf.IsSmallVSheaf.ofSurjectionFromDiamond` (constructor): A v-sheaf with a surjection from a diamond is small.
- `Perf.IsSmallVStack.ofQuasicompact` (instance): Every quasicompact v-sheaf, and every qcqs v-stack, is small.
- `Perf.IsSmallVSheaf.relation_isDiamond` (characterisation): For a surjection from a diamond, the relation is a diamond and the quotient is the given sheaf.
- `Perf.IsSmallVSheaf.relation_locallySpatial` (structure): If the sheaf is quasiseparated and the atlas locally spatial then the relation is locally spatial; if the sheaf is qcqs and the atlas spatial then the relation is spatial.
- `Perf.IsSmallVStack.fibreProduct` (structure): Small v-stacks are stable under 2-fibre products.

**Unit tests.**

- `diamond` (degenerate): Every diamond is a small v-sheaf (the degenerate case).
- `classifying_stack` (non-example): The classifying stack of a locally profinite nontrivial group G over a geometric point is a small v-stack that is not a v-sheaf.
- `quasicompact_is_small` (characterisation): A quasicompact v-sheaf is small without any further hypothesis.

**Acceptance.**

- Every diamond is a small v-sheaf; not every small v-sheaf is a diamond, and Theorem 12.18 gives the criterion.
- For nontrivial locally profinite G, BG over a geometric base is a small v-stack that is not a v-sheaf; for trivial G it is the base sheaf.

**Direct prerequisites.** `DiamondsAndVStacks:D4/diamonds-are-v-sheaves`, `DiamondsAndVStacks:D4/diamond`, `DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`, `DiamondsAndVStacks:D3/locally-profinite-torsors`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 12, Definition 12.1, Remark 12.2 and Definition 12.4, pp. 69-70 — The two definitions, with Remark 12.2's consequences.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 12, Proposition 12.3 with proof, p. 70 — The presentation statement that makes the definition usable..

**Signature refinement.** Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.

The precise entries left out of the suggested declarations are `Perf.IsSmallVStack`, `Perf.IsSmallVSheaf.ofDiamond`, `Perf.IsSmallVSheaf.ofSurjectionFromDiamond`, `Perf.IsSmallVStack.ofQuasicompact`, `Perf.IsSmallVSheaf.relation_isDiamond`, `Perf.IsSmallVSheaf.relation_locallySpatial`, `Perf.IsSmallVStack.fibreProduct`, `diamond`, `classifying_stack`, `quasicompact_is_small`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### spaces-and-surjectivity-for-small-v-stacks — Underlying spaces, open sub-v-stacks, fibre products, and surjectivity versus topological surjectivity

**Theorem.** Let Y be a small v-stack with a presentation Y = X/R, X a diamond, R a small v-sheaf and R tilde -> R a surjection from a diamond. There is a canonical bijection between |X|/|R tilde| and the set of maps Spa(K, K^+) -> Y modulo the domination relation, and the quotient topology is independent of the presentation; this defines |Y|. Open sub-v-stacks of Y correspond bijectively to open subsets of |Y|, and a surjection of small v-stacks induces a quotient map of spaces. Fibre products of small v-stacks are small v-stacks and the map from the space of the fibre product to the fibre product of the spaces is surjective. Finally, if f is a surjection of v-stacks then |f| is surjective; conversely if f is quasicompact and |f| is surjective then f is a surjection of v-stacks. Without the quasicompactness hypothesis the converse fails.

Identifier: `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`.

Atlas planet: **v-surjection versus topological surjection**.

**Hypotheses and conventions.**

- The two-step presentation is genuine: one could also define |Y| first for small v-sheaves and then for stacks, and the two agree because |R tilde| -> |R| is surjective.
- The qc hypothesis in the converse is exactly what the roadmap text says must be preserved.

**Construction or proof.**

1. Transport the proof of the diamond case to small v-stacks, using the surjection from a diamond onto R.
2. The open-subfunctor correspondence and the quotient-map statement are proved as in the diamond case.
3. For fibre products use that the corresponding statement holds for perfectoid spaces and pass to presentations.
4. For surjectivity: one direction is clear. For the converse, given X affinoid over Y, the pullback Y' x_Y X is a quasicompact v-stack, so it admits a surjection X' from an affinoid; then |X'| -> |X| is surjective, hence X' -> X is a v-cover, and the map X -> Y lifts after that v-cover.

**Acceptance.**

- Remark 12.19 and the discussion after Theorem 12.18 show that a quasi-pro-etale map from a perfectoid space that is surjective on spaces need not be a surjection of v-sheaves, because it need not be quasicompact; this is the required non-example.
- ECD credits David Hansen for related discussions on this point.

**Direct prerequisites.** `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `DiamondsAndVStacks:D4/underlying-topological-space`, `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`, `DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes`, `DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `DiamondsAndVStacks:D0/ordinal-assembly-of-cofiltered-diagrams`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 12, Proposition 12.7, Definition 12.8, Proposition 12.9 and Proposition 12.10, pp. 70-71 — The construction of the space and the open-substack correspondence.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 12, Lemma 12.11 with proof, p. 72 — The precise relation between the two notions of surjectivity, with the quasicompactness hypothesis the roadmap text insists on..

**Theorem signature.** Proposed name `TauCeti.Diamonds.SpacesAndSurjectivityForSmallVStacks`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.
### isomorphism-criteria-for-v-sheaves-and-stacks — Isomorphism and injectivity criteria on geometric points

**Theorem.** Let f : Y' -> Y be a qcqs map of v-stacks. Then f is an isomorphism if and only if for every algebraically closed perfectoid field K with an open and bounded valuation subring K^+ the map f(K, K^+) : Y'(K, K^+) -> Y(K, K^+) is an equivalence of groupoids. Separately, for f a map of small v-sheaves that is either qcqs or between locally spatial objects, the following are equivalent: f is an injective map of v-sheaves; f(K, K^+) is injective for all perfectoid fields K with an open and bounded valuation subring; |f| is injective and f is final among maps from small v-sheaves whose spaces factor continuously through |Y'|, equivalently Y' is the fibre product of Y with |Y'| underline over |Y| underline.

Identifier: `DiamondsAndVStacks:D4/isomorphism-criteria-for-v-sheaves-and-stacks`.

**Hypotheses and conventions.**

- Here quasiseparatedness of a map of stacks is meant in the sense of ECD Convention 8.4.
- The isomorphism criterion is the tool by which almost every identification in sections 11 to 15 is proved.

**Construction or proof.**

1. Reduce to Y an affinoid perfectoid space X, so Y' is a qcqs v-stack; write Y' = X'/R' with X' affinoid; X' -> X is a v-cover since it is surjective on points, so it suffices to compare R' with X' x_X X'.
2. This reduces to a qcqs map of v-sheaves, then by the same argument to a map of spatial diamonds, where the criterion is the diamond one.
3. For the injectivity criterion, injectivity of |f| follows from the description of the set |Y|; conversely a map Z -> Y whose space lifts continuously factors uniquely through Y', which is checked v-locally and then on Spa(K, K^+) using that quasicompact injections into Spa(K, K^+) are of the form Spa(K, (K^+)').

**Acceptance.**

- This is the analogue for v-sheaves of ECD Proposition 5.3 for perfectoid spaces, which PerfectoidSpaces:P4 supplies.
- The identification Y' = Y x_{|Y| underline} |Y'| underline is the form used in Proposition 11.20 and Proposition 13.12.

**Direct prerequisites.** `DiamondsAndVStacks:D4/diamonds-are-v-sheaves`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`, `DiamondsAndVStacks:D3/sub-v-sheaves-of-totally-disconnected-spaces`, `DiamondsAndVStacks:D3/locally-profinite-torsors`, `PerfectoidSpaces:P4/valuative-criterion-separatedness`, `PerfectoidSpaces:P4/maps-of-affinoid-perfectoid-spaces-are-separated`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 12, Lemma 12.5 with proof, p. 70 — The isomorphism criterion for v-stacks.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 12, Proposition 12.15 with proof, pp. 72-73 — The injectivity criterion, whose reformulation Y' = Y x_{|Y|} |Y'| is recorded in the statement..

**Theorem signature.** Proposed name `TauCeti.Diamonds.IsomorphismCriteriaForVSheavesAndStacks`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.
### small-quotients-and-underlying-spaces — Small quotients of v-sheaves

**Theorem.** For a small v-sheaf F with an action of a locally profinite group G, the v-sheaf quotient Q=F/underline(G) is small and |Q| is homeomorphic to |F|/G with the quotient topology. A quotient diamond is obtained when the relation is pro-étale and representable by a perfectoid presentation. No formula for set-valued π₀ is asserted without additional hypotheses.

Identifier: `DiamondsAndVStacks:D4/small-quotients-and-underlying-spaces`.

**Hypotheses and conventions.**

- Small F; a continuous sheaf action of underline(G) for locally profinite G

**Construction or proof.**

1. Choose a perfectoid atlas of F. Its composite to Q is a v-cover, so Q is small by the atlas criterion.
2. Use ECD 12.7–12.9 and the quotient topology of a small-v-sheaf atlas to compare equivalence classes and open subsets.
3. For a pro-étale relation, apply D4’s existing diamond quotient theorem. Retain E01 as the failure of the unrestricted component add-on, not a failure of this quotient theorem.

**Acceptance.**

- For a small v-sheaf F with an action of a locally profinite group G, the v-sheaf quotient Q=F/underline(G) is small and |Q| is homeomorphic to |F|/G with the quotient topology. A quotient diamond is obtained when the relation is pro-étale and representable by a perfectoid presentation. No formula for set-valued π₀ is asserted without additional hypotheses.

**Direct prerequisites.** `DiamondsAndVStacks:D3/locally-profinite-torsors`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`, `DiamondsAndVStacks:D4/quotient-presentations-of-diamonds`.

**Sources.** [glx](https://arxiv.org/pdf/2208.07195v3), Lemma 3.2, first assertion — Retains topology of the quotient and smallness; explicitly excludes its false π₀ assertion..

**Theorem signature.** Proposed name `TauCeti.Diamonds.SmallQuotientsAndUnderlyingSpaces`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.

**Stage acceptance.** The definitions, API and discriminating tests above cover every target of D4. Every prerequisite chain ends at the pinned baseline, an exact foreign node, a supplier request or an explicit gap. The following work is required before closing the stage:

- Signature refinement: instantiate and state the explicitly omitted API/tests of DiamondsAndVStacks:D4/diamond, DiamondsAndVStacks:D4/underlying-topological-space, DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks. See signatureCoverage for each name, statement and required interface; prove no implementations here.
- Named theorem signatures: supply the carrier/interface and state DiamondsAndVStacks:D4/quotient-presentations-of-diamonds, DiamondsAndVStacks:D4/atlas-characterisation-of-diamonds, DiamondsAndVStacks:D4/diamonds-are-v-sheaves, DiamondsAndVStacks:D4/compact-hausdorff-diamonds, DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks, DiamondsAndVStacks:D4/isomorphism-criteria-for-v-sheaves-and-stacks, DiamondsAndVStacks:D4/small-quotients-and-underlying-spaces. Their exact mathematical statements and proposed names are in signatureCoverage.namedTargets and the suggested comment ledger.

## D5 — Spatial geometry and relative representability

Spatiality is a condition on the sheaf and its quasicompact open subobjects, not just on a chosen topology. The universally open presentation, permanence, limit and local étale theorems produce the relative representability interface needed by coefficient theory. Point localization takes generalizations of the point. Generalizing subdiamonds and profinite products supply the routed Howe–Klevdal applications. The affinoid maximal Hausdorff quotient is supplied once by TB.0; D5 extends it to small v-sheaves. Quotient components require the explicit separation condition that excludes the GLX dense-orbit counterexample.

**Target coverage.** The fourteen nodes cover spatial and locally spatial diamonds and spatial v-sheaves, the permanence properties of 11.20, 11.21, 11.28 and 11.29 together with their v-sheaf analogues 12.16, the limit and finite-stage comparison theorems 11.22, 11.23 and 12.17, the universally open strictly totally disconnected presentation 11.24 with its converse and the two results 11.26 and 11.27 it terminates in, the two-out-of-three property 11.30, the local structure of etale maps 11.31, the spatial v-sheaf criterion 12.18 with 12.20 and 12.21, relative representability 13.1 to 13.6, the extension of the imported Berkovich quotient 13.10–13.11, and the reduction 13.12 together with the ordinary cohomology comparison 13.13. Localization, locally closed generalizing subdiamonds, profinite products and the corrected component criterion are explicit.

### spatial-diamond — Spatial and locally spatial diamonds, and spatial v-sheaves

**Definition.** A diamond Y is spatial if Y is quasicompact and quasiseparated and |Y| admits a basis of open subsets given by |U| for quasicompact open immersions U inside Y; Y is locally spatial if it admits an open cover by spatial diamonds. The same definition with 'diamond' replaced by 'v-sheaf' gives spatial and locally spatial v-sheaves, where in the locally spatial case smallness is also required. The condition is sheaf-theoretic: it is not the requirement that |Y| be a spectral space. Any perfectoid space is locally spatial, and it is spatial exactly when it is qcqs.

Identifier: `DiamondsAndVStacks:D5/spatial-diamond`.

Atlas planet: **Spatial diamond**.

**Hypotheses and conventions.**

- The condition is on the quasicompact open subfunctors and not only on the topology of |Y|; the roadmap text insists on this.
- Quasicompactness and quasiseparatedness are meant in the topos sense of D0, applied to the v-topos of Perf.

**Construction or proof.**

1. Define spatiality by the stated condition and locally spatial by an open cover.
2. Record the basic permanence: |Y| is spectral, every quasicompact open subfunctor is spatial, and for every perfectoid space X' over Y the map |X'| -> |Y| is spectral and generalizing.
3. Record the locally spatial versions: |Y| is locally spectral; every open subfunctor is locally spatial; Y is quasicompact, respectively quasiseparated, exactly when |Y| is; for any locally spatial Y' over Y the map |Y'| -> |Y| is spectral and generalizing, so the generalizations of a point are totally ordered.
4. Record that the same statements hold verbatim for spatial v-sheaves, since any qcqs v-sheaf can be written as X/R with X and R spatial diamonds.

**Uses that determine the API.**

- ECD Definition 13.3 and DiamondSixOperations: The six operations are defined for maps representable in locally spatial diamonds, so this is the class the whole coefficient theory is indexed by.
- ECD Definition 14.1: The etale site of a diamond is defined only for locally spatial diamonds, because otherwise there are not enough etale maps.
- ECD Lemma 15.6: The diamond of an analytic adic space over Z_p is locally spatial, which is the main structural statement of D6.

**Named API.**

- `Perf.Diamond.IsSpatial` (data): The predicate on a diamond: qcqs, with a basis of quasicompact open subfunctors.
- `Perf.Diamond.IsLocallySpatial` (data): The predicate that Y has an open cover by spatial diamonds.
- `Perf.VSheaf.IsSpatial` (data): The same condition for a v-sheaf.
- `Perf.Diamond.IsSpatial.spectralSpace` (characterisation): |Y| is a spectral space, and locally spectral in the locally spatial case.
- `Perf.Diamond.IsSpatial.quasicompactOpen` (structure): A quasicompact open subfunctor of a spatial diamond is spatial.
- `Perf.Diamond.IsLocallySpatial.isSpectralMap` (compatibility): For Y' locally spatial over Y, the induced map |Y'| -> |Y| is spectral and generalizing.
- `Perf.Diamond.IsLocallySpatial.qcqs_iff` (characterisation): Y is quasicompact, respectively quasiseparated, exactly when |Y| is.
- `Perf.Diamond.isSpatial_of_perfectoid` (compatibility): A perfectoid space is locally spatial, and spatial exactly when qcqs.
- `Perf.Diamond.IsLocallySpatial.generalizations_totallyOrdered` (relation): The set of generalizations of a point of |Y| is totally ordered.

**Unit tests.**

- `qcqs_perfectoid` (non-example): A qcqs perfectoid space is a spatial diamond; a non-quasicompact one is locally spatial and not spatial (the degenerate cases).
- `compact_hausdorff_not_spatial` (non-example): T underline times Spa(K, O_K) for T compact Hausdorff and not profinite is qcqs and not spatial (the required non-example).
- `space_is_spectral` (non-example): Spatiality implies spectrality of |Y|; the required basis consists of qc open subfunctors, not merely arbitrary topological opens.
- `open_subfunctor` (characterisation): Quasicompact open subfunctors of a spatial diamond are spatial, and the |U| form a basis.

**Acceptance.**

- A perfectoid space is locally spatial, and spatial exactly when qcqs.
- T underline times Spa(K, O_K) for T compact Hausdorff and not profinite is a qcqs diamond that is not spatial; this is the non-example separating the notions.

**Direct prerequisites.** `DiamondsAndVStacks:D4/underlying-topological-space`, `DiamondsAndVStacks:D4/diamond`, `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`, `DiamondsAndVStacks:D0/locally-spectral-space`, `DiamondsAndVStacks:D0/spectral-quotient-criterion`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `DiamondsAndVStacks:D4/compact-hausdorff-diamonds`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Definition 11.17, p. 61 — The definition, verbatim.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 12, Definition 12.12, p. 72 — The v-sheaf version, which D5 must keep separate from the diamond version until Theorem 12.18 identifies them..

**Signature refinement.** Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.

The precise entries left out of the suggested declarations are `Perf.Diamond.IsSpatial.spectralSpace`, `Perf.Diamond.IsSpatial.quasicompactOpen`, `Perf.Diamond.IsLocallySpatial.isSpectralMap`, `Perf.Diamond.IsLocallySpatial.qcqs_iff`, `Perf.Diamond.isSpatial_of_perfectoid`, `Perf.Diamond.IsLocallySpatial.generalizations_totallyOrdered`, `qcqs_perfectoid`, `compact_hausdorff_not_spatial`, `space_is_spectral`, `open_subfunctor`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### injection-and-finite-etale-permanence — Quasicompact injections and finite etale maps into a (locally) spatial object

**Theorem.** Let Y be a locally spatial diamond and f : Y' -> Y a quasicompact injection of v-sheaves. Then Y' is a locally spatial diamond, |Y'| inside |Y| is pro-constructible and generalizing with the subspace topology, and Y' is the fibre product of Y with |Y'| underline over |Y| underline. If instead Y is a (locally) spatial diamond and Y' -> Y is a finite etale map of pro-etale sheaves then Y' is a (locally) spatial diamond; the same holds with 'diamond' replaced by 'v-sheaf' and Y spatial.

Identifier: `DiamondsAndVStacks:D5/injection-and-finite-etale-permanence`.

**Hypotheses and conventions.**

- Y locally spatial; in the injection case quasicompactness of f is needed. The finite etale statement is proved by a local analysis of |Y'| as a tree over |Y| and does not use the universally open presentation, which is why it comes before it.
- The v-sheaf version of the finite etale statement, ECD Lemma 12.16, has the identical proof and is needed before Theorem 12.18 identifies the two notions.

**Construction or proof.**

1. For the injection: choose a surjective quasi-pro-etale X -> Y with X strictly totally disconnected; X' = X x_Y Y' is a pro-constructible generalizing subspace of X, and likewise for the relation; the quotient gives |Y'| = V inside |Y|, pro-constructible and generalizing, and spatiality is inherited because quasicompact opens of V come from quasicompact opens of |Y|.
2. For the finite etale case: localise at a point y, so that X may be taken to be Spa(C, C^+) and X' is a finite disjoint union of copies of X.
3. Then |Y'| is a finite disjoint union of trees over the totally ordered chain |X|: over the generic point there is a finite set of points, and branching occurs exactly along the pro-constructible generalizing subsets where two sections induce the same map.
4. Any such tree is spectral with spectral projection, for instance by writing it as an inverse limit of trees branching at quasicompact opens; spread the conclusion out from the localization to a quasicompact open of Y.

**Acceptance.**

- Spatiality is not automatic for a quasicompact injection into a non-spatial diamond, so the hypothesis on Y is used.
- The finite etale case is what makes the etale covers used in the universally open presentation spatial.

**Direct prerequisites.** `DiamondsAndVStacks:D5/spatial-diamond`, `DiamondsAndVStacks:D3/sub-v-sheaves-of-totally-disconnected-spaces`, `DiamondsAndVStacks:D4/isomorphism-criteria-for-v-sheaves-and-stacks`, `DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`, `DiamondsAndVStacks:D4/atlas-characterisation-of-diamonds`, `DiamondsAndVStacks:D0/spectral-quotient-criterion`, `DiamondsAndVStacks:D0/pro-constructible-subsets`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Proposition 11.20 with proof, p. 62 — The injection case.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Lemma 11.21 and Section 12, Lemma 12.16, pp. 62, 73 — The finite etale case and its v-sheaf analogue, whose proof ECD repeats verbatim..

**Theorem signature.** Proposed name `TauCeti.Diamonds.InjectionAndFiniteEtalePermanence`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.
### quasi-pro-etale-and-fibre-product-permanence — Quasi-pro-etale maps into a locally spatial diamond, and fibre products

**Theorem.** Let Y be a locally spatial diamond and Y' -> Y a quasi-pro-etale map of pro-etale sheaves, which by Convention 10.2 is locally separated. Then Y' is a locally spatial diamond. A fibre product of (locally) spatial diamonds is (locally) spatial. More generally, if Y is a qcqs diamond admitting a surjective universally open quasi-pro-etale map from a (locally) spatial diamond, then Y is spatial.

Identifier: `DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`.

**Hypotheses and conventions.**

- The proofs use the universally open strictly totally disconnected presentation, which is why these statements come after it and not with the injection and finite etale cases.
- The last statement is ECD Remark 11.25 and is the form in which the converse of the presentation theorem is applied.

**Construction or proof.**

1. For the quasi-pro-etale case: assume Y spatial and Y' -> Y separated; take the universally open presentation X -> Y with X strictly totally disconnected. Then X' = X x_Y Y' is representable and pro-etale over X, and R' = X' x_{Y'} X' is representable and qcqs over X'.
2. X' is quasiseparated, so |Y'| = |X'|/|R'| is a locally spectral space and |X'| -> |Y'| is spectral, by the open case of the spectral quotient criterion.
3. For fibre products: if one of the maps is quasiseparated quasi-pro-etale the result follows from the previous paragraph; in general use the universally open presentation of the base to reduce to a qcqs perfectoid base, then take universally open presentations of the two factors and apply the converse half of the presentation theorem.

**Acceptance.**

- Remark 11.25 is recorded as part of the statement because every later application uses it in that generality.
- Corollary 11.28 applied to an atlas is what shows that a diamond quasi-pro-etale over a locally spatial diamond has the expected geometry.

**Direct prerequisites.** `DiamondsAndVStacks:D5/universally-open-presentation`, `DiamondsAndVStacks:D5/injection-and-finite-etale-permanence`, `DiamondsAndVStacks:D0/spectral-quotient-criterion`, `DiamondsAndVStacks:D4/atlas-characterisation-of-diamonds`, `DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`, `DiamondsAndVStacks:D5/spatial-diamond`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Corollary 11.28 and Corollary 11.29 with proofs, pp. 67-68 — The two statements.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Remark 11.25, p. 65 — The general form of the converse used throughout section 12 and section 13..

**Theorem signature.** Proposed name `TauCeti.Diamonds.QuasiProEtaleAndFibreProductPermanence`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.
### limits-and-finite-stage-comparisons — Cofiltered limits of diamonds and of small v-sheaves, and finite-stage etale comparisons

**Theorem.** Let Y_i be a cofiltered inverse system of diamonds with qcqs transition maps and Y its limit. Then Y is a diamond, |Y| -> lim |Y_i| is a continuous bijection, and the maps Y -> Y_i are qcqs; if all Y_i are (locally) spatial then so is Y and |Y| -> lim |Y_i| is a homeomorphism. If kappa is a cutoff cardinal, the index category is kappa-small and all Y_i are kappa'-small for some kappa' < kappa, then Y is kappa-small. For a cofiltered system of qcqs diamonds, base change gives equivalences from the 2-colimit of the categories of finite etale, of qcqs etale, and of quasicompact separated etale objects over the Y_i to the corresponding categories over Y. The same statements hold for small v-sheaves.

Identifier: `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`.

**Hypotheses and conventions.**

- Transition maps qcqs. The smallness clause uses clause (iii) of the cutoff cardinal lemma.
- In the etale statements all maps are locally separated by Convention 10.2, which is what makes the reduction to the quasicompact separated case possible.

**Construction or proof.**

1. Reduce to I the ordinals below a fixed ordinal and build by transfinite induction a compatible system of strictly totally disconnected X_mu with quasi-pro-etale surjections onto Y_mu times the limit of the previous X, so that the limit map is a transfinite composition of surjective affinoid pro-etale maps, hence a quasi-pro-etale surjection.
2. Then |Y| = |lim X_mu|/|lim R_mu| = lim |X_mu|/|R_mu| = lim |Y_mu| as sets; in the spatial case the limit comparison for spectral spaces shows the map is a quotient map, hence a homeomorphism, and quasicompact opens come from a finite stage.
3. For the etale comparisons, let F be the prestack of finite etale, respectively quasicompact separated etale, maps; F is a v-stack, and F(X/Y) involves only the affinoid perfectoid spaces X, R and R x_X R, so the finite-stage descent of P5 applies and gives the 2-colimit statement.
4. For qcqs etale objects one covers by quasicompact separated opens, descends those and then the gluing data.

**Acceptance.**

- The corresponding statements for small v-sheaves are ECD Lemma 12.17 and are proved the same way with spatial diamonds in place of strictly totally disconnected spaces.
- These comparisons are what make the iterated constructions of Proposition 11.24 and Theorem 12.18 terminate.

**Direct prerequisites.** `DiamondsAndVStacks:D5/spatial-diamond`, `DiamondsAndVStacks:D5/injection-and-finite-etale-permanence`, `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`, `DiamondsAndVStacks:D0/cutoff-cardinal`, `DiamondsAndVStacks:D3/etale-and-finite-etale-are-v-stacks`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `PerfectoidSpaces:P5/finite-stage-descent-of-qcqs-etale-objects`, `DiamondsAndVStacks:D0/ordinal-assembly-of-cofiltered-diagrams`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Lemma 11.22 with proof, pp. 63-64 — The limit statement with its smallness clause.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Proposition 11.23 and Lemma 12.17, pp. 64, 73-74 — The finite-stage comparisons, in the diamond and the small v-sheaf case..

**Theorem signature.** Proposed name `TauCeti.Diamonds.LimitsAndFiniteStageComparisons`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.
### universally-open-presentation — The universally open strictly totally disconnected presentation of a spatial diamond, and its converse

**Theorem.** Let Y be a spatial diamond. Then there is a strictly totally disconnected perfectoid space X with a surjective and universally open quasi-pro-etale map X -> Y that can be written as a cofiltered inverse limit of etale maps which are composites of quasicompact open immersions and finite etale maps; if kappa is a cutoff cardinal and Y is kappa-small, X may be taken kappa-small. Conversely, if Y is a qcqs diamond admitting a surjective and universally open quasi-pro-etale map from a perfectoid space, then Y is spatial. More generally the converse holds with the source a (locally) spatial diamond. The construction rests on the fact that a spatial diamond, all of whose surjective etale covers that are composites of quasicompact open immersions and finite etale maps split, is a strictly totally disconnected perfectoid space.

Identifier: `DiamondsAndVStacks:D5/universally-open-presentation`.

Atlas planet: **Universally open presentation**.

**Hypotheses and conventions.**

- The class of etale maps used is not all etale maps but those that are composites of quasicompact open immersions and finite etale maps; this is exactly the class produced by the local structure theorem and is what makes the cardinality count work.
- The converse uses the open case of the spectral quotient criterion.

**Construction or proof.**

1. Converse first: for X -> Y surjective universally open quasi-pro-etale with X strictly totally disconnected, R inside X x X is a qcqs perfectoid space with s, t open, so |Y| = |X|/|R| is spectral and |X| -> |Y| is spectral.
2. Direct statement: let I be the set of isomorphism classes of surjective etale maps Y' -> Y that are composites of quasicompact open immersions and finite etale maps; I has cardinality less than kappa by realising them through descent data along a fixed kappa-small affinoid cover. Each Y' is spatial.
3. For a finite subset J take the fibre product Y_J of the Y_i over Y, and let Y_infinity be the cofiltered limit; by the limit theorem Y_infinity is spatial and Y_infinity -> Y is surjective, universally open and quasi-pro-etale.
4. Iterate countably often to get X -> Y with all such etale covers split; then X is a strictly totally disconnected perfectoid space by the splitting proposition and the affinoidness lemma.

**Acceptance.**

- ECD Proposition 11.26 and Lemma 11.27: a spatial diamond all of whose surjective etale covers of the stated shape split is a strictly totally disconnected perfectoid space; a spatial diamond all of whose connected components are affinoid perfectoid spaces is an affinoid perfectoid space.
- The construction is the diamond analogue of the cover of ECD 7.18 and has the same universal openness, which is what distinguishes it from a w-localization.

**Direct prerequisites.** `DiamondsAndVStacks:D5/spatial-diamond`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondsAndVStacks:D0/spectral-quotient-criterion`, `DiamondsAndVStacks:D1/universally-open-std-cover`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondsAndVStacks:D0/cutoff-cardinal`, `DiamondsAndVStacks:D4/diamonds-are-v-sheaves`, `DiamondsAndVStacks:D3/locally-profinite-torsors`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Proposition 11.24 with proof, p. 65 — The statement and its converse.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Proposition 11.26 and Lemma 11.27, pp. 65-67 — The two results the construction terminates in..

**Theorem signature.** Proposed name `TauCeti.Diamonds.UniversallyOpenPresentation`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.
### two-out-of-three-for-quasi-pro-etale — The two-out-of-three property for quasi-pro-etale, etale and finite etale maps

**Theorem.** Let f : Y_1 -> Y_2 and g : Y_2 -> Y_3 be maps of locally spatial diamonds with composite h. Assume f is quasi-pro-etale and surjective, h is quasi-pro-etale, and g is separated. Then g is quasi-pro-etale. If moreover f and h are etale, respectively finite etale, then so is g.

Identifier: `DiamondsAndVStacks:D5/two-out-of-three-for-quasi-pro-etale`.

**Hypotheses and conventions.**

- All three of the hypotheses on f, g and h are needed; ECD gives no version without the separatedness of g.
- The proof is a careful reduction to the case of a connected strictly totally disconnected base.

**Construction or proof.**

1. Reduce to Y_3 = X_3 strictly totally disconnected and Y_2 spatial, so that Y_1 = X_1 is representable and pro-etale over X_3; replacing X_1 by an open cover, assume X_1 strictly totally disconnected and affinoid pro-etale over X_3, and replace X_3 by X_3 x_{pi_0 X_3} pi_0(Y_2).
2. Show |f| : |Y_2| -> |X_3| is injective, by the same argument as in Lemma 7.19: on a connected component two distinct preimages of the unique rank one point would split Y_2 into two nonempty closed pieces.
3. The image of |f| is pro-constructible and generalizing, so it is an affinoid pro-etale X_2 inside X_3; replace X_3 by X_2.
4. Then show Y_2 -> X_2 is an isomorphism, by the isomorphism criterion on (K, K^+)-points and a localization argument.
5. In the etale case, after the reductions f admits a section, which is automatically etale, and g is the composite of h with that section.

**Acceptance.**

- The statement is used in Proposition 13.6 to characterise quasi-pro-etale maps by their geometric fibres.
- Without separatedness of g there is no such conclusion, which is the required non-example.

**Direct prerequisites.** `DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`, `DiamondsAndVStacks:D5/universally-open-presentation`, `DiamondsAndVStacks:D4/diamonds-are-v-sheaves`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`, `DiamondsAndVStacks:D1/pro-etale-maps-over-std-base`, `DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Proposition 11.30 with proof, pp. 68-69 — The statement, whose proof is reproduced in the steps..

**Theorem signature.** Proposed name `TauCeti.Diamonds.TwoOutOfThreeForQuasiProEtale`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.
### local-structure-of-etale-maps — Local structure of etale maps of locally spatial diamonds

**Theorem.** Let f : Y' -> Y be an etale map of locally spatial diamonds. Then for every point y' of |Y'| with image y, there are open neighbourhoods V' of y' in Y' and V of y in Y containing f(V') such that the restriction of f to V' factors as a quasicompact open immersion of V' into some W followed by a finite etale map W -> V. This generalizes the corresponding local structure theorem for etale maps of perfectoid spaces, and by Convention 10.2 f is required to be locally separated, which is necessary since the restriction is separated.

Identifier: `DiamondsAndVStacks:D5/local-structure-of-etale-maps`.

Atlas planet: **Local structure of etale maps**.

**Hypotheses and conventions.**

- Locally separatedness is required and ECD says why: the factorization forces the restriction to be separated.
- The conclusion is local on both source and target; no global factorization is claimed.

**Construction or proof.**

1. Reduce to Y and Y' spatial and f qcqs separated etale.
2. It suffices to produce the factorization after base change to the localization Y_y, since both the finite etale part and the quasicompact open immersion spread out to a quasicompact open V of Y by the finite-stage comparisons and the limit theorem, and the isomorphism between the two pullbacks is defined over some V.
3. So assume y is the unique closed point of Y, so |Y| is a totally ordered chain of specializations. Let Y^circ be the open point; Y'^circ -> Y^circ is etale, hence finite etale, since Y^circ is covered by Spa(K, O_K) and there the etale and finite etale sites agree; and finite etale covers of Y^circ and of Y agree.
4. So there is a finite etale W -> Y with W x_Y Y^circ isomorphic to Y'^circ; the map extends uniquely to Y' -> W, is an injection by the compactification lemma, and is etale, hence an open immersion.

**Acceptance.**

- This is the statement that makes the class of etale maps used in the universally open presentation the right one.
- It is the diamond analogue of ECD Definition 6.2(ii) for perfectoid spaces.

**Direct prerequisites.** `DiamondsAndVStacks:D5/spatial-diamond`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondsAndVStacks:D3/etale-and-finite-etale-are-v-stacks`, `DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`, `DiamondsAndVStacks:D4/underlying-topological-space`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 11, Lemma 11.31 with proof, p. 69 — The statement and its proof..

**Theorem signature.** Proposed name `TauCeti.Diamonds.LocalStructureOfEtaleMaps`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.
### spatial-v-sheaf-criterion — A spatial v-sheaf with enough quasi-pro-etale points is a spatial diamond

**Theorem.** Let Y be a spatial v-sheaf such that there exists a perfectoid space X with a quasi-pro-etale map f : X -> Y for which |f| : |X| -> |Y| is surjective. Then Y is a spatial diamond. The hypothesis is much weaker than asking f to be surjective as a map of v-sheaves: an equivalent formulation is that for every point y of |Y| there is a quasi-pro-etale map Spa(C, C^+) -> Y having y in its image, with C algebraically closed. In particular the condition is only a condition on the points of Y.

Identifier: `DiamondsAndVStacks:D5/spatial-v-sheaf-criterion`.

Atlas planet: **Spatial v-sheaf criterion**.

**Hypotheses and conventions.**

- The map f is not assumed quasicompact, so Lemma 12.11 does not apply and f need not be a surjection of v-sheaves.
- The proof needs the analogues for spatial v-sheaves of the finite etale permanence and the limit theorem, which is why those are stated separately.

**Construction or proof.**

1. Consider the set I of isomorphism classes of surjective etale maps Y' -> Y that are composites of quasicompact open immersions and finite etale maps; I has cardinality less than kappa and each Y' is a spatial v-sheaf.
2. Take products over finite subsets and pass to the cofiltered limit to get Y_infinity, a spatial v-sheaf with a surjective separated quasi-pro-etale map to Y; iterate countably often to get X' -> Y with all such etale covers split.
3. By the generalization of the splitting proposition to spatial v-sheaves with the pointwise quasi-pro-etale hypothesis, X' is a strictly totally disconnected perfectoid space; the hypothesis on points lifts to X' because X' -> Y is quasi-pro-etale.
4. Hence Y admits a surjective quasi-pro-etale map from a perfectoid space, so it is a diamond, and spatiality is the same condition for both notions.

**Acceptance.**

- ECD Proposition 12.20 and Lemma 12.21 are the two generalizations used: a spatial v-sheaf with the pointwise hypothesis all of whose relevant etale covers split is a strictly totally disconnected perfectoid space, and a spatial v-sheaf all of whose connected components are affinoid perfectoid is affinoid perfectoid.
- This theorem is used throughout later work to show that concrete functors are diamonds without exhibiting an atlas.

**Direct prerequisites.** `DiamondsAndVStacks:D5/spatial-diamond`, `DiamondsAndVStacks:D5/universally-open-presentation`, `DiamondsAndVStacks:D5/injection-and-finite-etale-permanence`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondsAndVStacks:D4/atlas-characterisation-of-diamonds`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `DiamondsAndVStacks:D3/locally-profinite-torsors`, `DiamondsAndVStacks:D0/cutoff-cardinal`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 12, Theorem 12.18 and Remark 12.19 with proof, p. 75 — The statement and ECD's own emphasis that the hypothesis is only about points.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 12, Proposition 12.20 and Lemma 12.21, pp. 75-76 — The two auxiliary results the proof terminates in..

**Theorem signature.** Proposed name `TauCeti.Diamonds.SpatialVSheafCriterion`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.
### relative-representability — Maps representable in diamonds and in (locally) spatial diamonds

**Definition.** A map f : Y' -> Y of v-stacks is representable in diamonds if for every diamond X with a map X -> Y the fibre product Y' x_Y X is a diamond; it is representable in (locally) spatial diamonds if for every (locally) spatial diamond X over Y the fibre product is a (locally) spatial diamond. For a map of diamonds that is representable in (locally) spatial diamonds one says simply that it is a (locally) spatial map. A map is representable in spatial diamonds exactly when it is representable in locally spatial diamonds and qcqs. All these notions are examples of 0-truncated maps.

Identifier: `DiamondsAndVStacks:D5/relative-representability`.

Atlas planet: **Representable in locally spatial diamonds**.

**Hypotheses and conventions.**

- The pro-etale locality and the v-locality conditions in the two descent statements are different: for representability in diamonds a surjection of pro-etale stacks suffices, while for representability in locally spatial diamonds one needs quasiseparatedness of f as well.
- These are the notions in which the six operations of DiamondSixOperations are indexed, so their exact form matters.

**Construction or proof.**

1. Define the three predicates and record that representability in locally spatial diamonds implies representability in diamonds.
2. Record the descent statements: if Y tilde -> Y is surjective as a map of pro-etale stacks and the pullback is representable in diamonds then so is f; if in addition f is quasiseparated and the pullback is representable in locally spatial diamonds then so is f; and the same with 'surjective map of v-stacks' when f is already known to be representable in diamonds.
3. Record the auxiliary Lemma 13.5: a quasiseparated small v-sheaf Y with a map to S underline for a profinite set S, all of whose fibres are locally spatial, and admitting a surjective qcqs map from a locally spatial diamond, is locally spatial.
4. Record Proposition 13.6: a separated map of v-stacks is quasi-pro-etale if and only if it is representable in locally spatial diamonds and its pullback to every geometric point Spa(C, O_C) is pro-etale; the characterisation is due to Fargues.

**Uses that determine the API.**

- ECD Definition 22.2 and Definition 23.8, in DiamondSixOperations: Rf_! and cohomological smoothness are defined for compactifiable maps representable in locally spatial diamonds with locally dim.trg finite.
- ECD Proposition 13.12: The map from a quasicompact separated diamond to the underline of its maximal Hausdorff quotient is representable in locally spatial diamonds.
- ECD Theorem 16.1 and section 17: Base change and the four functors are stated for maps of locally spatial diamonds, and extended along representable maps.

**Named API.**

- `Perf.Stack.RepresentableInDiamonds` (data): The predicate that all fibre products over diamonds are diamonds.
- `Perf.Stack.RepresentableInLocallySpatialDiamonds` (data): The corresponding predicate for locally spatial diamonds.
- `Perf.Stack.RepresentableInSpatialDiamonds` (data): The corresponding predicate for spatial diamonds.
- `Perf.Stack.representableInSpatial_iff` (characterisation): Representability in spatial diamonds is representability in locally spatial diamonds together with qcqs.
- `Perf.Stack.representable_pullback` (compatibility): The three classes are stable under base change.
- `Perf.Stack.representable_of_pullback` (characterisation): The three descent statements, with their different surjectivity and quasiseparatedness hypotheses.
- `Perf.Stack.isQuasiProEtale_iff_fibres` (equivalence): A separated map is quasi-pro-etale exactly when it is representable in locally spatial diamonds with pro-etale geometric fibres.
- `Perf.Stack.representable_isZeroTruncated` (relation): All three classes consist of 0-truncated maps.

**Unit tests.**

- `diamond_base` (degenerate): For Y a diamond, f is representable in diamonds exactly when Y' is a diamond (the degenerate case).
- `quasi_pro_etale` (characterisation): A quasi-pro-etale map of locally spatial diamonds is representable in locally spatial diamonds.
- `not_representable_in_perfectoid_spaces` (non-example): A morphism of diamonds need not be representable in perfectoid spaces; the definition must not impose that (the required non-example).
- `classifying_stack` (characterisation): The map from a geometric point to the classifying stack of a locally profinite group is representable in locally spatial diamonds and quasi-pro-etale.

**Acceptance.**

- For Y a diamond, f is representable in diamonds exactly when Y' is a diamond; similarly for the locally spatial version.
- The geometric fibre criterion of Proposition 13.6 is the practical test for quasi-pro-etaleness.

**Direct prerequisites.** `DiamondsAndVStacks:D5/spatial-diamond`, `DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`, `DiamondsAndVStacks:D4/atlas-characterisation-of-diamonds`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`, `DiamondsAndVStacks:D5/two-out-of-three-for-quasi-pro-etale`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 13, Definition 13.1, Definition 13.3 and Proposition 13.4, pp. 76-77 — The definitions and the descent statements of Propositions 13.2 and 13.4.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 13, Proposition 13.6 with proof, pp. 78-79 — The fibre criterion, which ECD attributes to Fargues..

**Signature refinement.** Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.

The precise entries left out of the suggested declarations are `Perf.Stack.representableInSpatial_iff`, `Perf.Stack.representable_pullback`, `Perf.Stack.representable_of_pullback`, `Perf.Stack.isQuasiProEtale_iff_fibres`, `Perf.Stack.representable_isZeroTruncated`, `diamond_base`, `quasi_pro_etale`, `not_representable_in_perfectoid_spaces`, `classifying_stack`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### berkovich-quotient — The Berkovich space and the maximal Hausdorff quotient of a small v-sheaf

**Construction.** Import M(R), the normalized bounded multiplicative-seminorm space for complete Tate rings (choose a topologically nilpotent unit ϖ and |ϖ|=1/2, with the canonical change-of-normalization homeomorphisms), and Spa(R,R⁺)→M(R) as its maximal Hausdorff quotient from an early TropicalAndBerkovichArithmetic:TB.0 spectrum substage. Extend this affinoid-perfectoid functor to small v-sheaves by left Kan extension through perfectoid atlases: B(Y)=colim_{X→Y} M(O(X)) over affinoid perfectoid X. It preserves colimits and has |Y|→B(Y). For qcqs v-sheaves this is the maximal Hausdorff quotient and B(Y) is compact Hausdorff. The section selecting maximal generalizations is set-theoretic and need not be continuous. D5 proves ECD 13.10–13.13, not the seminorm spectrum or the Tate-pair maximal-Hausdorff theorem.

Identifier: `DiamondsAndVStacks:D5/berkovich-quotient`.

Atlas planet: **Maximal Hausdorff quotient**.

**Hypotheses and conventions.**

- |X|_B is canonically independent of the choice of varpi.
- The map |Y|_B -> |Y| is a section of sets, not a continuous map; this is stated explicitly by ECD and must not be strengthened.

**Construction or proof.**

1. Use the supplied affinoid spectrum functor, whose complete-Tate hypotheses include perfectoid Tate rings; identify its value independently of a pseudouniformizer.
2. Form its left Kan extension on small v-sheaves using small perfectoid presentations; ECD 13.10–13.11 prove independence of presentation and colimit preservation.
3. For qcqs v-sheaves, use the supplied affinoid maximal-Hausdorff quotient, compact atlas descent and closed relation to obtain compact Hausdorffness and the universal property.
4. The maximal-generalization section is only a function. Do not claim continuity or identify the perfectoid disc with the ordinary rigid closed disc.

**Uses that determine the API.**

- ECD Proposition 13.12: For Y a quasicompact separated diamond, the map Y -> |Y|_B underline is representable in locally spatial diamonds, which is how a general quasicompact separated diamond is reduced to spatial ones.
- ECD Proposition 13.13: The pullback along |Y| -> |Y|_B is fully faithful on bounded-below derived categories of abelian sheaves, which is the ordinary sheaf-cohomology assertion this layer owns.
- DiamondEtaleCohomology:C4 and DiamondSixOperations:S1: Canonical compactifications and the proper-zero-dimensional compact Hausdorff examples are built from this functor.

**Named API.**

- `Perf.berkovich` (data): The functor Y mapsto |Y|_B from small v-sheaves to topological spaces.
- `Perf.berkovich_affinoid` (constructor): For a complete perfectoid Tate pair (R,R⁺), B(Spd(R,R⁺)) is the supplied TB.0 spectrum M(R).
- `Perf.berkovich_indep_varpi` (compatibility): The extension uses the intrinsic TB.0 spectrum, hence does not depend on a chosen pseudouniformizer.
- `Perf.berkovich_compactHausdorff` (structure): For Y qcqs, |Y|_B is compact Hausdorff.
- `Perf.berkovich_isQuotientMap` (characterisation): |Y| -> |Y|_B is a continuous quotient map.
- `Perf.berkovich_section` (data): The set-theoretic section |Y|_B → |Y| satisfies q∘s=id; it need not be continuous (it is continuous in the profinite and single-point cases).
- `Perf.berkovich_universal` (universal-property): Any continuous map from |Y| to a Hausdorff space factors uniquely through |Y|_B.
- `Perf.berkovich_preservesColimits` (functoriality): The functor preserves colimits, which is how it is extended from affinoids.

**Unit tests.**

- `point` (degenerate): For X = Spa(C, C^+), |X|_B is a point (the degenerate case).
- `disc` (characterisation): For an affinoid perfectoid disc with ring R, B(X)=M(R) from TB.0; no identification with the spectrum of the ordinary rigid disc is asserted.
- `section_not_continuous` (non-example): The maximal-generalization section is a set section q∘s=id; continuity is not part of its specification.
- `compact_hausdorff_diamond` (characterisation): For Y = T underline times Spa(K, O_K) with T compact Hausdorff, |Y|_B = T.

**Acceptance.**

- For X = Spa(C, C^+) the Berkovich space is a point; for the perfectoid closed unit disc it is the usual Berkovich disc.
- The maximal-point inclusion |Y|_B -> |Y| is not continuous, which is a required non-example.

**Direct prerequisites.** `DiamondsAndVStacks:D0/generalizing-surjection-is-quotient`, `DiamondsAndVStacks:D0/profinite-presentation-of-compact-hausdorff`, `DiamondsAndVStacks:D4/underlying-topological-space`, `DiamondsAndVStacks:D5/spatial-diamond`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `DiamondsAndVStacks:D3/locally-profinite-torsors`, `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`, `TropicalAndBerkovichArithmetic:TB.0/spectrum`, `TropicalAndBerkovichArithmetic:TB.0`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 13, Definition 13.7, Remark 13.8 and Proposition 13.9, p. 79 — The definition and its basic properties, including the warning.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 13, Proposition 13.10 and Proposition 13.11, pp. 79-80 — The extension to small v-sheaves and the qcqs statement..

**Signature refinement.** Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.

The precise entries left out of the suggested declarations are `Perf.berkovich`, `Perf.berkovich_affinoid`, `Perf.berkovich_indep_varpi`, `Perf.berkovich_compactHausdorff`, `Perf.berkovich_isQuotientMap`, `Perf.berkovich_section`, `Perf.berkovich_universal`, `Perf.berkovich_preservesColimits`, `point`, `disc`, `section_not_continuous`, `compact_hausdorff_diamond`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### reduction-to-spatial-and-hausdorff-cohomology — A quasicompact separated diamond maps representably to its maximal Hausdorff quotient, and the cohomology comparison

**Theorem.** Let Y be a quasicompact separated diamond. Then the map Y -> |Y|_B underline is representable in locally spatial diamonds; equivalently a general quasicompact separated diamond differs from a locally spatial one only through a map to a compact Hausdorff space. Moreover, for f : |Y| -> |Y|_B the pullback f^* induces a fully faithful functor from D^+(|Y|_B, Z) to D^+(|Y|, Z), so that H^i(|Y|_B, F) is isomorphic to H^i(|Y|, f^* F) for every abelian sheaf F on |Y|_B. This cohomological assertion is proved with ordinary sheaf cohomology, not with the later diamond coefficient category.

Identifier: `DiamondsAndVStacks:D5/reduction-to-spatial-and-hausdorff-cohomology`.

**Hypotheses and conventions.**

- Y quasicompact and separated. The second statement is ECD 13.13, which the roadmap text assigns to this layer and says must be proved using D0's ordinary sheaf foundations.
- Canonical compactifications are not assumed to remain spatial, which is why this nonspatial geometry is needed.

**Construction or proof.**

1. For the first statement, choose a profinite S surjecting onto |Y|_B; by the descent criterion for representability it is enough that Y x_{|Y|_B underline} S underline is spatial, and by the auxiliary lemma on fibres over a profinite set it is enough to treat a single point s.
2. So assume |Y|_B is a point; let y be the image of |Y|_B in |Y|. Choose a quasi-pro-etale Spa(C, O_C) -> Y with image y; then Spa(C, O_C) x_{Y_y} Spa(C, O_C) is Spa(C, O_C) times G underline for a profinite group G acting continuously and faithfully on C.
3. Form Y bar = Spa(C, C^+)/G underline with C^+ the integral closure of F_p + C^{circ circ} in C; the torsor is universally open so Y bar is spatial, and one constructs a quasicompact injection Y -> Y bar using the valuative criterion, whence Y is spatial by the permanence result.
4. Check F → Rf_*f^*F on stalks using refinements by closed neighbourhoods in the compact Hausdorff base, properness and continuity of ordinary cohomology. Do not assume that the base has a clopen basis. The fibre over a point is the closure of a rank-one point and has a generic point; the constant-sheaf acyclicity node computes its cohomology.

**Acceptance.**

- Proposition 13.12 is what lets every later argument assume spatiality after a map to a compact Hausdorff space.
- The cohomological statement is the ordinary sheaf-theoretic input to the study of canonical compactifications in DiamondEtaleCohomology:C4.

**Direct prerequisites.** `DiamondsAndVStacks:D5/berkovich-quotient`, `DiamondsAndVStacks:D5/relative-representability`, `DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`, `DiamondsAndVStacks:D5/universally-open-presentation`, `DiamondsAndVStacks:D3/locally-profinite-torsors`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `DiamondsAndVStacks:D0/closure-of-pro-constructible`, `DiamondsAndVStacks:D0/constant-sheaf-on-irreducible-space`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 13, Proposition 13.12 with proof, pp. 80-81 — The first half, with the construction of Y bar recorded in the steps.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 13, Proposition 13.13 with proof, p. 81 — The cohomological comparison the roadmap text assigns to this layer..

**Theorem signature.** Proposed name `TauCeti.Diamonds.ReductionToSpatialAndHausdorffCohomology`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.
### components-of-restricted-quotients — Components of restricted group quotients

**Theorem.** Let a topological group G act continuously on X and give both orbit spaces their quotient topologies. If B=(ConnectedComponents X)/G is totally disconnected, then the canonical map B→ConnectedComponents(X/G) is a bijection of sets. A sufficient condition is that G-invariant clopens of X separate distinct G-orbits of components. In particular, for spectral X and profinite G with continuous action, B is profinite and the formula holds. For a locally spatial diamond torsor F→Y under noncompact G(Q_p) or Γ_K and connected base Y, the desired conclusion is transitivity on π₀(F); this requires verifying the separation hypothesis or an independent geometric transitivity proof. The printed universal GLX 3.2 is false.

Identifier: `DiamondsAndVStacks:D5/components-of-restricted-quotients`.

**Hypotheses and conventions.**

- Continuous action
- The component-orbit space B is totally disconnected, or its stated sufficient separation hypothesis
- Compact specialization: spectral X and profinite G

**Construction or proof.**

1. The map X→B is continuous and constant on G-orbits, hence descends continuously to X/G. Its fibre over a component orbit is the image of a single connected component of X: translating that component does not change its image. Thus fibres are connected.
2. A connected subset maps to a point in totally disconnected B; therefore those fibres are exactly components, yielding the set bijection.
3. For compact G acting on profinite π₀(X), invariant finite clopen partitions separate orbits (compactness gives finite refinements); the compact orbit relation is closed. The quotient is profinite.
4. For noncompact period torsors, do not infer the separation condition from smallness or a bare locally spatial total space. Record the exact geometric verification as an open input.

**Acceptance.**

- Let a topological group G act continuously on X and give both orbit spaces their quotient topologies. If B=(ConnectedComponents X)/G is totally disconnected, then the canonical map B→ConnectedComponents(X/G) is a bijection of sets. A sufficient condition is that G-invariant clopens of X separate distinct G-orbits of components. In particular, for spectral X and profinite G with continuous action, B is profinite and the formula holds. For a locally spatial diamond torsor F→Y under noncompact G(Q_p) or Γ_K and connected base Y, the desired conclusion is transitivity on π₀(F); this requires verifying the separation hypothesis or an independent geometric transitivity proof. The printed universal GLX 3.2 is false.

**Direct prerequisites.** `DiamondsAndVStacks:D0/spectral-components-profinite`, `DiamondsAndVStacks:D4/small-quotients-and-underlying-spaces`.

**Sources.** [glx](https://arxiv.org/pdf/2208.07195v3), Lemma 3.2 and uses at Proposition 3.12, Proposition 6.6(2), Lemma 6.12 — Corrected theorem with discriminating E01 counterexample and explicit noncompact application gap..

**Theorem signature.** Proposed name `TauCeti.Diamonds.ComponentsOfRestrictedQuotients`; a baseline-relative prototype is typed. The typed form is a baseline-relative specialization; the definitive target includes all hypotheses and auxiliary conclusions in the reader.
### localization-at-a-point — Localization of a spatial diamond

**Construction.** For a spatial diamond Y and y∈|Y|, let Y_y be the inverse limit of all qc open subdiamonds U⊆Y containing y, along inclusions. It is spatial; |Y_y| is the generalization set of y with the induced topology, and its map to Y is a qc injection. Morphisms whose underlying image is contained in that generalization set factor uniquely through Y_y. This is a diamond localization, not a new definition of a local ring.

Identifier: `DiamondsAndVStacks:D5/localization-at-a-point`.

**Hypotheses and conventions.**

- Spatial Y; y∈|Y|

**Construction or proof.**

1. The neighbourhood category is cofiltered under intersections. Apply the spatial-limit theorem and topology comparison.
2. The intersection of neighbourhoods is exactly the generalizations of y; uniqueness follows from the monomorphism, existence from the compatible restrictions to every open.

**Uses that determine the API.**

- ECD relative representability and étale-local arguments; item 618: Replaces unstated localization constructions in spatial proofs.

**Named API.**

- `Perf.Diamond.localization` (constructor): The inverse limit of qc open neighbourhoods of y.
- `Perf.Diamond.localization_toBase` (projection): Canonical qc injection into Y.
- `Perf.Diamond.localization_space` (characterisation): Underlying space is the generalizations of y.
- `Perf.Diamond.localization_lift` (universal-property): Unique factorization for morphisms with image in that generalization set.

**Unit tests.**

- `localization_closed_point_chain` (computation): In a valuation-field diamond with one closed point, localization at that closed point is the whole diamond.
- `localization_generic_point_chain` (computation): Localization at a maximal generalization has only its generalizations, not all its specializations.
- `localization_open_compatibility` (compatibility): Localizing an open neighbourhood U of y gives the same Y_y.

**Acceptance.**

- In a valuation-field diamond with one closed point, localization at that closed point is the whole diamond.
- Localization at a maximal generalization has only its generalizations, not all its specializations.
- Localizing an open neighbourhood U of y gives the same Y_y.

**Direct prerequisites.** `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondsAndVStacks:D5/spatial-diamond`, `DiamondsAndVStacks:D3/sub-v-sheaves-of-totally-disconnected-spaces`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Localizations used in §13 and §23, including routed item 618 — Makes explicit the point-localization used in proof steps..

**Signature refinement.** Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.

The precise entries left out of the suggested declarations are `Perf.Diamond.localization_toBase`, `Perf.Diamond.localization_space`, `Perf.Diamond.localization_lift`, `localization_closed_point_chain`, `localization_generic_point_chain`, `localization_open_compatibility`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### locally-closed-generalizing-subdiamond — Locally closed generalizing subdiamonds

**Construction.** For a locally spatial diamond Y and a locally closed subset D⊆|Y| stable under generalization, the sub-v-sheaf Y_D consists of maps T→Y whose underlying image is contained in D. It is a locally spatial diamond, its underlying space is D with the subspace topology, and it represents this factorization condition. Generalizing means closed under generalizations in |Y|, not under specializations.

Identifier: `DiamondsAndVStacks:D5/locally-closed-generalizing-subdiamond`.

**Hypotheses and conventions.**

- Locally spatial Y
- D locally closed and generalizing

**Construction or proof.**

1. Work locally where D is closed in an open subdiamond. It is pro-constructible locally; pull back to a strictly totally disconnected atlas, where its generalizing inverse image is affinoid perfectoid.
2. Descend the pro-étale equivalence relation to this subspace and apply the spatial injection permanence theorem. Glue across opens.

**Uses that determine the API.**

- HK item 024; period-domain restrictions: Restrict locally spatial geometry without replacing a diamond by its topology.

**Named API.**

- `Perf.Diamond.generalizingSubdiamond` (constructor): Maps whose images lie in D.
- `Perf.Diamond.generalizingSubdiamond_space` (characterisation): Its underlying space is D with its induced topology.
- `Perf.Diamond.generalizingSubdiamond_lift` (universal-property): A map factors uniquely precisely when its underlying image lies in D.

**Unit tests.**

- `generalizing_subdiamond_whole` (degenerate): D=|Y| gives Y.
- `generalizing_subdiamond_open` (compatibility): For open D it is the existing open subdiamond.
- `generalizing_subdiamond_empty` (degenerate): D=∅ gives the empty diamond.
- `generalizing_subdiamond_direction` (non-example): In a nontrivial specialization chain, the singleton closed point is not generalizing and the theorem does not apply.

**Acceptance.**

- D=|Y| gives Y.
- For open D it is the existing open subdiamond.
- D=∅ gives the empty diamond.
- In a nontrivial specialization chain, the singleton closed point is not generalizing and the theorem does not apply.

**Direct prerequisites.** `DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`, `DiamondsAndVStacks:D5/injection-and-finite-etale-permanence`, `DiamondsAndVStacks:D5/spatial-diamond`, `DiamondsAndVStacks:D4/underlying-topological-space`.

**Sources.** [hk](https://arxiv.org/pdf/2308.11064v2), §2, locally closed generalizing subdiamond conventions — The sub-v-sheaf and its factorization condition used by HK; not an arbitrary closed-subset representability assertion..

**Signature refinement.** Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.

The precise entries left out of the suggested declarations are `Perf.Diamond.generalizingSubdiamond_space`, `Perf.Diamond.generalizingSubdiamond_lift`, `generalizing_subdiamond_open`, `generalizing_subdiamond_empty`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### profinite-products-of-locally-spatial-diamonds — Profinite products and closed projection

**Theorem.** For a profinite set P and a locally spatial diamond S, underline(P)×S is locally spatial and |underline(P)×S|≅P×|S|. The projection to S is qc, separated and universally closed; hence it sends closed subsets to closed subsets after any locally spatial base change. Compactness of P is essential for closedness of the projection.

Identifier: `DiamondsAndVStacks:D5/profinite-products-of-locally-spatial-diamonds`.

**Hypotheses and conventions.**

- P profinite; S locally spatial

**Construction or proof.**

1. Write P as a cofiltered limit of finite sets and apply the spatial inverse-limit theorem on qc opens of S. The finite-level topology is a finite disjoint union of |S|.
2. The topology comparison identifies the limit with the ordinary product. Compactness proves the product projection is closed, after arbitrary locally spatial base change.
3. Separatedness follows from the closed diagonal of P; qc follows from compactness on qc opens. This supplies the geometric properness used in HK without importing C4 backwards.

**Acceptance.**

- For a profinite set P and a locally spatial diamond S, underline(P)×S is locally spatial and |underline(P)×S|≅P×|S|. The projection to S is qc, separated and universally closed; hence it sends closed subsets to closed subsets after any locally spatial base change. Compactness of P is essential for closedness of the projection.

**Direct prerequisites.** `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondsAndVStacks:D4/compact-hausdorff-diamonds`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`.

**Sources.** [hk](https://arxiv.org/pdf/2308.11064v2), Proof of Proposition 9.3.4, profinite compact-open level products — Topological product and closed-image argument used in the proof..

**Theorem signature.** Proposed name `TauCeti.Diamonds.ProfiniteProductsOfLocallySpatialDiamonds`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.

**Stage acceptance.** The definitions, API and discriminating tests above cover every target of D5. Every prerequisite chain ends at the pinned baseline, an exact foreign node, a supplier request or an explicit gap. The following work is required before closing the stage:

- Noncompact period-torsor component transitivity
- Supplier contract: TropicalAndBerkovichArithmetic:TB.0 — Extend the existing node TB.0/spectrum from normed rings to Banach and complete Tate rings and supply the normalized seminorm space (|ϖ|=1/2, canonically independent of normalization), its evaluation topology and the theorem that Spa(R,R⁺)→M(R) is the maximal Hausdorff quotient for complete Tate Huber pairs. Make an early TB.0:spectrum substage depending only on LI.0 and Tau Ceti AdicSpaces Layer 2; no dependency on D5. D5 only extends this functor to small v-sheaves (ECD 13.10–13.13).
- Signature refinement: instantiate and state the explicitly omitted API/tests of DiamondsAndVStacks:D5/spatial-diamond, DiamondsAndVStacks:D5/relative-representability, DiamondsAndVStacks:D5/berkovich-quotient, DiamondsAndVStacks:D5/localization-at-a-point, DiamondsAndVStacks:D5/locally-closed-generalizing-subdiamond. See signatureCoverage for each name, statement and required interface; prove no implementations here.
- Named theorem signatures: supply the carrier/interface and state DiamondsAndVStacks:D5/injection-and-finite-etale-permanence, DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence, DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons, DiamondsAndVStacks:D5/universally-open-presentation, DiamondsAndVStacks:D5/two-out-of-three-for-quasi-pro-etale, DiamondsAndVStacks:D5/local-structure-of-etale-maps, DiamondsAndVStacks:D5/spatial-v-sheaf-criterion, DiamondsAndVStacks:D5/reduction-to-spatial-and-hausdorff-cohomology, DiamondsAndVStacks:D5/profinite-products-of-locally-spatial-diamonds. Their exact mathematical statements and proposed names are in signatureCoverage.namedTargets and the suggested comment ledger.

## D6 — Analytic and integral pre-adic diamondification

Marked untilts with maps to an adic or pre-adic target define the mapping v-sheaf. Analytic adic targets give locally spatial diamonds with the stated étale comparisons. Arbitrary integral pre-adic targets give v-sheaves and need not give diamonds; the comparison of underlying spaces is a homeomorphism only in the analytic case. Integral Galois descent is a quotient statement and retains special-fibre stabilizers. Full faithfulness is proved for seminormal rigid varieties over a fixed field, using recovery of analytic functions, with no claim of full faithfulness for every analytic adic space.

**Target coverage.** The nine nodes cover ECD 15.1 to 15.6: Spd Z_p and Spd(A, A^+) with the absence of automorphisms of a marked untilt, the descent of marked untilts along a v-cover which is the computational core of 15.1, the identification of Spd(A, A^+) as a spatial diamond with the underlying space of Spa(A, A^+), the gluing along rational subsets and the diamond of an analytic adic space over Z_p, and the local spatiality with the equivalences of etale and finite etale sites. The producer-consumer contract of the roadmap document is respected: what is claimed is an equivalence of etale categories on the constructed diamond, not full faithfulness of the diamond functor on analytic adic spaces. It also includes arbitrary integral pre-adic diamondification, integral Galois quotients, the analytic-only homeomorphism criterion and seminormal rigid full faithfulness over a fixed base.

### spd-of-a-tate-pair — Spd Z_p and Spd(A, A^+) by marked untilts

**Construction.** Let Spd Z_p be the functor on Perf sending X to the set of isomorphism classes of pairs (X sharp, iota) where X sharp is a perfectoid space and iota is an identification of the tilt of X sharp with X. For a Tate Z_p-algebra A with an open and integrally closed subring A^+ inside A, let Spd(A, A^+) send X to the set of isomorphism classes of pairs consisting of such an (X sharp, iota) together with a continuous map of pairs (A, A^+) -> (O(X sharp), O^+(X sharp)). Both are v-sheaves. Marked untilts have no automorphisms, which is what makes these functors and not stacks. A Tate pair must be distinguished from an arbitrary formal base such as (Z_p, Z_p), which is treated by D6/pre-adic-diamondification rather than the Tate-only construction.

Identifier: `DiamondsAndVStacks:D6/spd-of-a-tate-pair`.

Atlas planet: **Spd of a Tate pair**.

**Hypotheses and conventions.**

- Functoriality is not formal: for f : X' -> X and an untilt X sharp of X, one defines (X')sharp using that perfectoid spaces over X sharp are equivalent to perfectoid spaces over its tilt, which is the slice equivalence of P2.
- Absence of automorphisms of the pair (X sharp, iota) follows from the same equivalence.
- The v-sheaf property of Spd(A, A^+) follows from that of Spd Z_p together with the v-sheaf property of O and O^+.

**Construction or proof.**

1. Define the presheaf Spd Z_p, with functoriality supplied by the slice equivalence of perfectoid spaces over X sharp and over its tilt.
2. Prove that the pairs (X sharp, iota) have no automorphisms, so that the groupoid-valued functor is discrete.
3. Prove the v-sheaf property: for a v-cover Y -> X of affinoid perfectoids in characteristic p and an untilt Y sharp whose two pullbacks to Z = Y x_X Y agree, construct the untilt of X. Set f the composite of W(R^+) -> W(S^+) with Fontaine's theta; after replacing varpi by a p-power root, S sharp+ modulo varpi sharp agrees with S^+ modulo varpi, so almost descent and the vanishing of higher v-cohomology give surjections from W(R^+)/varpi^n onto the equalizers, with kernel generated by a primitive element xi; pass to the limit and invert to get R sharp = W(R^+)/xi inverted at varpi sharp.
4. Define Spd(A, A^+) and deduce its v-sheaf property.

**Uses that determine the API.**

- ECD Definition 15.5: The diamond X diamond of an analytic adic space over Z_p is glued from the Spd(A, A^+) along rational subsets.
- FarguesFontaineDiamonds:F0 and RelativeFarguesFontaine:RF1: The Fargues-Fontaine curve and its relative versions are built from Spd of Tate pairs and their untilts.
- HeckeStacksAndLocalShtukas and BunGAndNewtonStrata: Spd Z_p and Spd Q_p are the base objects over which local shtukas and Bun_G are defined.

**Named API.**

- `Perf.SpdZp` (data): The functor on Perf of marked untilts.
- `Perf.SpdZp.isVSheaf` (instance): Spd Z_p is a v-sheaf.
- `Perf.SpdZp.noAutomorphisms` (characterisation): A marked untilt has no nontrivial automorphisms, so the functor is set-valued.
- `Perf.Spd` (constructor): Spd(A, A^+) for a Tate Z_p-pair, as marked untilts together with a continuous map of pairs.
- `Perf.Spd.isVSheaf` (instance): Spd(A, A^+) is a v-sheaf.
- `Perf.Spd.functorial` (functoriality): (A, A^+) mapsto Spd(A, A^+) is a contravariant functor on Tate Z_p-pairs.
- `Perf.Spd.ofPerfectoid` (compatibility): For a perfectoid pair, Spd(A, A^+) is represented by Spa of the tilt.
- `Perf.Spd.rationalSubset` (structure): For U a rational subset of Spa(A, A^+), Spd(O(U), O^+(U)) -> Spd(A, A^+) is the open subfunctor attached to U.

**Unit tests.**

- `perfectoid_pair` (degenerate): For (A, A^+) perfectoid, Spd(A, A^+) is Spa of the tilt (the degenerate case).
- `spd_qp` (non-example): Spd Q_p is a v-sheaf that is not representable by a perfectoid space, which is the required test of this layer.
- `no_automorphisms` (non-example): The groupoid of marked untilts of a fixed X is discrete; a construction producing a nontrivial automorphism group is wrong.
- `formal_base_excluded` (non-example): (Z_p, Z_p) is not a Tate pair, so Spd(Z_p, Z_p) is not defined by this construction (a required non-example).

**Acceptance.**

- For (A, A^+) perfectoid, Spd(A, A^+) is represented by the affinoid perfectoid space Spa of its tilt, which is ECD Lemma 15.2 and follows from the slice equivalence.
- Spd Z_p is not representable; it is the basic example of a diamond that is not a perfectoid space.

**Direct prerequisites.** `mathlib:WittVector`, `DiamondsAndVStacks:D2/v-descent-of-functions`, `DiamondsAndVStacks:D2/higher-v-acyclicity`, `DiamondsAndVStacks:D4/diamond`, `DiamondsAndVStacks:D4/diamonds-are-v-sheaves`, `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`, `PerfectoidSpaces:P1/untilts-classified-by-primitive-ideals`, `PerfectoidSpaces:P1/tilt-of-perfectoid-tate-ring`, `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`, `PerfectoidSpaces:P0/almost-modules-over-perfectoid-base`, `AdicEtaleGeometry:A4/perfectoid-cover-presentation`, `AdicEtaleGeometry:A4/finite-etale-effective-descent-along-tower`, `AdicEtaleGeometry:A1/etale-site-generalized`, `AdicEtaleGeometry:A1/finite-etale-site`, `AdicEtaleGeometry:A1/yoneda-adic-fibre-products`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 15, Lemma 15.1 with proof, pp. 89-90 — The construction, verbatim.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 15, proof of Lemma 15.1, p. 89 — The absence of automorphisms, which the roadmap text lists as a task.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 15, Lemma 15.2 with proof, p. 90 — The perfectoid case..

**Signature refinement.** Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.

The precise entries left out of the suggested declarations are `Perf.SpdZp`, `Perf.SpdZp.isVSheaf`, `Perf.SpdZp.noAutomorphisms`, `Perf.Spd`, `Perf.Spd.isVSheaf`, `Perf.Spd.functorial`, `Perf.Spd.ofPerfectoid`, `Perf.Spd.rationalSubset`, `perfectoid_pair`, `spd_qp`, `no_automorphisms`, `formal_base_excluded`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### spd-is-a-spatial-diamond — Spd(A, A^+) is a spatial diamond with |Spd(A, A^+)| = |Spa(A, A^+)|

**Theorem.** Let A be a Tate Z_p-algebra with an open and integrally closed subring A^+ inside A. Choose a cofiltered inverse system of finite groups G_i with surjective transition maps and a compatible filtered direct system of finite etale G_i-torsors A -> A_i such that A_infinity has no nonsplit finite etale covers, with A_i^+ the integral closure of A^+ and A_infinity^+ the closure of the colimit inside the uniform completion. Then Spd(A_i, A_i^+) -> Spd(A, A^+) is a G_i-torsor of v-sheaves, Spd of the completion of A_infinity is the inverse limit and is a G underline-torsor over Spd(A, A^+) for G the limit of the G_i, and it is an affinoid perfectoid space. Hence Spd(A, A^+) is a spatial diamond with |Spd(A, A^+)| = |Spa(A, A^+)|.

Identifier: `DiamondsAndVStacks:D6/spd-is-a-spatial-diamond`.

Atlas planet: **Spd(A, A^+) is a spatial diamond**.

**Hypotheses and conventions.**

- The existence of the tower with perfectoid completion is ECD Lemma 15.3 and is supplied by AdicEtaleGeometry:A4, which the stage text designates as the owner.
- The G_i-torsor statement uses the finite etale descent theorem for Tate rings, ECD Theorem 6.1.

**Construction or proof.**

1. The tower: a standard construction gives the G_i and the A_i, and the uniform completion of A_infinity is perfectoid, by solving x^{p^n} - varpi_0 x = varpi_0 to find a pseudouniformizer with varpi^p dividing p and x^p - varpi^p x = f to make Frobenius surjective on the integral quotient.
2. Spd(A_i, A_i^+) -> Spd(A, A^+) is a G_i-torsor by finite etale descent for Tate rings.
3. Passing to the limit, Spd of the completion of A_infinity is the inverse limit and is a G underline-torsor; by the torsor lemma it is a universally open qcqs quasi-pro-etale map from an affinoid perfectoid space.
4. By the converse half of the universally open presentation theorem, Spd(A, A^+) is a spatial diamond.
5. For the space, |Spa of the completion of A_infinity| is the limit of the |Spa(A_i, A_i^+)|, and each |Spa(A_i, A_i^+)|/G_i is |Spa(A, A^+)|; pass to the limit.

**Acceptance.**

- For (A, A^+) perfectoid the statement reduces to Lemma 15.2.
- The identification of the underlying space is the reason the functor preserves all topological information, and is used in Lemma 15.6.

**Direct prerequisites.** `mathlib:ProfiniteGrp`, `DiamondsAndVStacks:D6/spd-of-a-tate-pair`, `DiamondsAndVStacks:D5/universally-open-presentation`, `DiamondsAndVStacks:D3/locally-profinite-torsors`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondsAndVStacks:D5/spatial-diamond`, `DiamondsAndVStacks:D4/underlying-topological-space`, `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`, `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `AdicEtaleGeometry:A4/perfectoid-cover-presentation`, `AdicEtaleGeometry:A4/finite-etale-effective-descent-along-tower`, `AdicEtaleGeometry:A1/etale-site-generalized`, `AdicEtaleGeometry:A1/finite-etale-site`, `AdicEtaleGeometry:A1/yoneda-adic-fibre-products`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 15, Lemma 15.3 with proof, p. 90 — The tower; A4 owns its construction and this node imports it.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 15, Proposition 15.4 with proof, pp. 90-91 — The statement of the node..

**Theorem signature.** Proposed name `TauCeti.Diamonds.SpdIsASpatialDiamond`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.
### gluing-and-the-diamond-functor — Gluing Spd along rational subsets and the diamond of an analytic adic space

**Construction.** If U is a rational open subset of Spa(A, A^+) then Spd(O(U), O^+(U)) -> Spd(A, A^+) is the open subfunctor corresponding to U under the identification of the underlying spaces. Consequently the functor (A, A^+) mapsto Spd(A, A^+) glues: for Y an analytic adic space over Z_p the diamond associated with Y is the v-sheaf Y diamond sending X in Perf to the set of isomorphism classes of triples ((X sharp, iota), f : X sharp -> Y) where X sharp is a perfectoid space with an identification iota of its tilt with X. The construction is functorial in Y, compatible with restriction to open subspaces, with the relevant fibre products, and with the tilt on perfectoid spaces.

Identifier: `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`.

Atlas planet: **The diamond of an analytic adic space**.

**Hypotheses and conventions.**

- Y is required to be an analytic adic space over Z_p; the construction works in the generality of adic spaces as defined with a structure presheaf that need not be a sheaf, provided the space is analytic.
- The gluing step is the identification of Spd of a rational localization with an open subfunctor, which rests on the identification of underlying spaces.

**Construction or proof.**

1. For U rational in Spa(A, A^+), show Spd(O(U), O^+(U)) -> Spd(A, A^+) is an open immersion with image the open subfunctor attached to U, using the identification |Spd(A, A^+)| = |Spa(A, A^+)| and the open-subfunctor correspondence for diamonds.
2. Define Y diamond directly by the stated formula and check that it is a v-sheaf, being a colimit of the affinoid pieces glued along the open subfunctors.
3. Check functoriality in Y and compatibility with open immersions and with fibre products of analytic adic spaces over Z_p where those exist.
4. Check that for Y perfectoid, Y diamond is the tilt of Y, so that the construction extends the tilting equivalence.

**Uses that determine the API.**

- ECD Theorem 1.5 and Lemma 15.6: The functor identifies etale sites, which is the endpoint of this roadmap and the input of DiamondEtaleCohomology:C1.
- FarguesFontaineDiamonds:F0 and F3: The adic Fargues-Fontaine curve is sent to a diamond by this functor, which is what makes the curve an object of the v-stack theory.
- BunGAndNewtonStrata:BG2 and PerfectoidShimuraVarieties:S0: Uniformization statements compare diamonds of analytic adic spaces with quotients of perfectoid spaces.

**Named API.**

- `Adic.diamond` (data): The v-sheaf Y diamond attached to an analytic adic space Y over Z_p.
- `Adic.diamond_affinoid` (constructor): For Y = Spa(A, A^+) affinoid, Y diamond is Spd(A, A^+).
- `Adic.diamond_openImmersion` (structure): An open immersion of analytic adic spaces induces an open immersion of diamonds, and rational subsets give the corresponding open subfunctors.
- `Adic.diamond_functorial` (functoriality): Y mapsto Y diamond is a functor from analytic adic spaces over Z_p to locally spatial diamonds.
- `Adic.diamond_perfectoid` (compatibility): For Y perfectoid, Y diamond is the tilt of Y; the construction extends the tilting equivalence.
- `Adic.diamond_fibreProduct` (compatibility): The construction is compatible with the fibre products of analytic adic spaces over Z_p that exist.
- `Adic.diamond_space` (characterisation): |Y diamond| = |Y| as topological spaces.
- `Adic.diamond_isLocallySpatial` (instance): Y diamond is a locally spatial diamond.

**Unit tests.**

- `spd_qp` (characterisation): Spd Q_p is the diamond of Spa(Q_p, Z_p).
- `rigid_disc` (characterisation): The diamond of the rigid analytic closed unit disc over Q_p is a locally spatial diamond with the same underlying space.
- `perfectoid_disc` (degenerate): For the perfectoid closed unit disc the construction returns its tilt (the degenerate case).
- `finite_etale_cover_and_rational_open` (non-example): A finite etale cover and a rational open of an affinoid go to a finite etale map and an open immersion of diamonds; a construction that does not is wrong.

**Acceptance.**

- Spd Q_p, the diamond of a rigid analytic disc, of a perfectoid disc, of a finite etale cover and of a rational open are the tests ECD lists for this endpoint.
- Applying the construction to the Fargues-Fontaine adic curve is the subject of FarguesFontaineDiamonds and is possible before the coefficient theory.

**Direct prerequisites.** `DiamondsAndVStacks:D6/spd-is-a-spatial-diamond`, `DiamondsAndVStacks:D6/spd-of-a-tate-pair`, `DiamondsAndVStacks:D4/underlying-topological-space`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`, `DiamondsAndVStacks:D5/spatial-diamond`, `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`, `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`, `AdicEtaleGeometry:A4/perfectoid-cover-presentation`, `AdicEtaleGeometry:A4/finite-etale-effective-descent-along-tower`, `AdicEtaleGeometry:A1/etale-site-generalized`, `AdicEtaleGeometry:A1/finite-etale-site`, `AdicEtaleGeometry:A1/yoneda-adic-fibre-products`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 15, discussion before Definition 15.5, p. 91 — The gluing step.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 15, Definition 15.5, p. 91 — The definition of the diamond functor, verbatim..

**Signature refinement.** Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.

The precise entries left out of the suggested declarations are `Adic.diamond`, `Adic.diamond_affinoid`, `Adic.diamond_openImmersion`, `Adic.diamond_functorial`, `Adic.diamond_perfectoid`, `Adic.diamond_fibreProduct`, `Adic.diamond_space`, `Adic.diamond_isLocallySpatial`, `spd_qp`, `rigid_disc`, `perfectoid_disc`, `finite_etale_cover_and_rational_open`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### etale-site-comparison — The diamond of an analytic adic space is locally spatial and its etale and finite etale sites agree

**Theorem.** Let Y be an analytic adic space over Z_p. Then Y diamond is a locally spatial diamond with |Y diamond| = |Y|. Moreover there are equivalences of sites between the etale site of Y diamond and the etale site of Y, and between their finite etale sites. Both full faithfulness on the etale categories and essential surjectivity are separate tasks. This is an equivalence of etale categories on the already constructed diamond; it is not full faithfulness of the diamond functor on all analytic adic spaces, and it is not the later derived left-completion comparison.

Identifier: `DiamondsAndVStacks:D6/etale-site-comparison`.

Atlas planet: **Equivalence of etale sites**.

**Hypotheses and conventions.**

- Y analytic adic over Z_p. The statement about sites is about the categories of etale objects, not about the functor Y mapsto Y diamond being fully faithful.
- The producer-consumer contract of the roadmap document makes exactly this restriction, and the roadmap text repeats it.

**Construction or proof.**

1. Reduce to the affinoid case Y = Spa(A, A^+), where local spatiality and the identification of spaces are the previous theorem.
2. For the finite etale site, use the G underline-torsor presentation: finite etale algebras over the completion of A_infinity are the 2-colimit of the finite etale algebras over the A_i, and likewise for the algebras corresponding to the fibre products; ordinary descent along the finite etale G_i-torsors then gives the equivalence with the finite etale site of Y diamond.
3. For the etale site combine the identification of topological spaces with the local structure theorem for etale maps of locally spatial diamonds, which says that such a map is locally a composite of a quasicompact open immersion and a finite etale map; each of the two pieces is matched by the previous step and by the open-subfunctor correspondence.
4. Record separately that full faithfulness and essential surjectivity are both proved this way and that neither is formal.

**Acceptance.**

- Theorem 1.5 of the introduction: there is a natural functor from analytic adic spaces over Z_p to locally spatial diamonds, Y mapsto Y diamond, satisfying the etale site equivalence.
- The tests of this layer are Spd Q_p, a rigid analytic disc, a perfectoid disc, a finite etale cover and a rational open.

**Direct prerequisites.** `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`, `DiamondsAndVStacks:D6/spd-is-a-spatial-diamond`, `DiamondsAndVStacks:D5/local-structure-of-etale-maps`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondsAndVStacks:D3/locally-profinite-torsors`, `DiamondsAndVStacks:D4/underlying-topological-space`, `PerfectoidSpaces:P3/etale-site-tilting-and-etale-almost-acyclicity`, `AdicEtaleGeometry:A4/perfectoid-cover-presentation`, `AdicEtaleGeometry:A4/finite-etale-effective-descent-along-tower`, `AdicEtaleGeometry:A1/etale-site-generalized`, `AdicEtaleGeometry:A1/finite-etale-site`, `AdicEtaleGeometry:A1/yoneda-adic-fibre-products`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 15, Lemma 15.6 with proof, p. 91 — The statement of the node.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 1, Theorem 1.5, p. 4 — The packaged form stated in the introduction..

**Theorem signature.** Proposed name `TauCeti.Diamonds.EtaleSiteComparison`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.
### untilt-descent-along-v-covers — Descent of marked untilts along a v-cover

**Lemma.** Let X = Spa(R, R^+) be an affinoid perfectoid space of characteristic p, Y = Spa(S, S^+) -> X a v-cover, and Y sharp = Spa(S sharp, S sharp+) an untilt of Y such that the two induced untilts of Z = Y x_X Y = Spa(T, T^+) agree. Then there is a unique untilt X sharp = Spa(R sharp, R sharp+) of X whose pullback to Y is Y sharp. Concretely R sharp = W(R^+)/xi with varpi sharp inverted, for a primitive element xi of W(R^+), and R sharp+ is determined by R^+.

Identifier: `DiamondsAndVStacks:D6/untilt-descent-along-v-covers`.

**Hypotheses and conventions.**

- X affinoid perfectoid of characteristic p; the v-cover may be taken affinoid by the quasicompactness condition.
- The element xi is primitive of degree one, congruent to p times varpi to the power minus one up to a unit; the identification of the kernel as generated by such an xi is the untilt classification supplied by P1.

**Construction or proof.**

1. Set f the composite of W(R^+) -> W(S^+) with Fontaine's map theta : W(S sharp flat+) -> S sharp+; then f(varpi) is a pseudouniformizer of S sharp+, and after replacing varpi by a p-power root one may assume S sharp+ modulo varpi sharp agrees with S^+ modulo varpi, and likewise for T.
2. By the v-sheaf property and the almost vanishing of higher v-cohomology, the almost equalizer of the two maps from S^+/varpi to T^+/varpi is R^+/varpi, and the corresponding higher terms vanish.
3. Hence W(R^+)/varpi maps onto the equalizer of the two maps from S sharp+ modulo f(varpi) to T sharp+ modulo f(varpi), with kernel generated by p; by induction and the five lemma one gets surjections from W(R^+)/varpi^n onto the corresponding equalizers with kernel generated by a single xi in W(R^+).
4. Passing to the limit gives the almost identification of W(R^+)/xi with the equalizer of S sharp+ and T sharp+, and inverting varpi sharp gives R sharp as the equalizer of S sharp and T sharp; the integral structure R sharp+ is then determined by R^+.

**Acceptance.**

- The uniqueness of the untilt is what makes Spd Z_p a sheaf and not a stack, and is used to glue Spd(A, A^+).
- The almost identifications cannot be replaced by exact ones; the argument passes through the almost category throughout.

**Direct prerequisites.** `mathlib:WittVector`, `DiamondsAndVStacks:D2/v-descent-of-functions`, `DiamondsAndVStacks:D2/higher-v-acyclicity`, `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`, `PerfectoidSpaces:P1/untilts-classified-by-primitive-ideals`, `PerfectoidSpaces:P0/almost-modules-over-perfectoid-base`, `AdicEtaleGeometry:A4/perfectoid-cover-presentation`, `AdicEtaleGeometry:A4/finite-etale-effective-descent-along-tower`, `AdicEtaleGeometry:A1/etale-site-generalized`, `AdicEtaleGeometry:A1/finite-etale-site`, `AdicEtaleGeometry:A1/yoneda-adic-fibre-products`.

**Sources.** [ecd](https://arxiv.org/pdf/1709.07343v4), Section 15, proof of Lemma 15.1, pp. 89-90 — The start of the computation this node isolates.; [ecd](https://arxiv.org/pdf/1709.07343v4), Section 15, proof of Lemma 15.1, p. 90 — The conclusion of the computation..

**Theorem signature.** Proposed name `TauCeti.Diamonds.UntiltDescentAlongVCovers`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.
### pre-adic-diamondification — Pre-adic diamondification

**Construction.** Fix a prime p. For any pre-adic space X over Spa(ℤ_p,ℤ_p), define X^diamond on characteristic-p perfectoid S by isomorphism classes of marked untilts (S^sharp,ι:(S^sharp)^flat≅S) over ℤ_p together with a morphism S^sharp→X. Morphisms pull back marked untilts. It is a v-sheaf; X need not be analytic or Tate and X^diamond need not be a diamond. For every complete Huber pair (A,A⁺) over ℤ_p this gives Spd(A,A⁺); on formal schemes use their associated pre-adic space with its full integral locus, not only the analytic generic fibre.

Identifier: `DiamondsAndVStacks:D6/pre-adic-diamondification`.

Atlas planet: **Pre-adic diamondification**.

**Hypotheses and conventions.**

- Pre-adic spaces over Spa(ℤ_p,ℤ_p), including nonanalytic loci
- Marked untilts from P1/P2
- Pair morphisms preserve A⁺ and are continuous

**Construction or proof.**

1. Construct the marked-untilt groupoid using the tilting slice equivalence; automorphisms preserving the marking are trivial.
2. ECD 15.1 descends untilts along v-covers. D2 descends O and O⁺; on an affine pair a continuous map A→O(S^sharp) preserving A⁺→O⁺(S^sharp) glues. Continuity is local on the finite qc-cover refinements.
3. Glue over open affine pre-adic charts. Berkeley 18.1.1 proves the v-sheaf statement without analyticity.
4. Compare to the analytic D6 construction on the analytic locus and to L1 integral scheme conventions by their mapping properties.

**Uses that determine the API.**

- RF0 integral Y; RF2 Div^d; GS0 loop geometry; GS1 integral base: Supplies integral base v-sheaves; their geometry remains with the consumers.
- DiamondsAndVStacksIntegralPartII briefs and L1: Provides one shared convention for integral diamondification.

**Named API.**

- `PreAdic.diamond` (constructor): Isomorphism classes of marked untilts with a map to X.
- `PreAdic.Spd` (constructor): The v-sheaf for an arbitrary complete Huber pair over ℤ_p.
- `PreAdic.diamond_map` (functoriality): A pre-adic morphism induces a v-sheaf morphism, respecting identities and composition.
- `PreAdic.diamond_isVSheaf` (instance): The mapping presheaf satisfies v-descent.
- `PreAdic.diamond_analytic` (compatibility): On analytic X it equals the existing analytic diamondification.
- `PreAdic.diamond_formal` (compatibility): For Spf A, the integral v-sheaf is Spd(A,A); its analytic generic-fibre locus agrees with analytic diamondification.
- `PreAdic.diamond_integralScheme` (compatibility): For an integral scheme and its associated pre-adic mapping functor, agree with AdicCoefficientsAndComparisons:L1 on continuous integral maps, with the same valuation subrings.

**Unit tests.**

- `integral_spd_oe` (compatibility): For a finite extension E/ℚ_p, Spd O_E is Spd(O_E,O_E), retaining the special-fibre locus.
- `integral_spd_oc` (compatibility): For a complete algebraically closed extension C/ℚ_p, Spd O_C is Spd(O_C,O_C), not Spd(C,O_C).
- `integral_pair_variants` (characterisation): Spd(R,R) and Spd(R⁺,R⁺) use the two different complete integral rings and their own continuous maps; neither is silently replaced by Spd(R[1/ϖ],R⁺).
- `integral_formal_affine` (computation): The integral v-sheaf of Spf A is Spd(A,A).
- `integral_symmetric_power` (characterisation): Products (Spd O_E)^d exist as small v-sheaves and their Σ_d quotient uses D4’s small quotient construction; divisor geometry belongs to RF2.

**Acceptance.**

- For a finite extension E/ℚ_p, Spd O_E is Spd(O_E,O_E), retaining the special-fibre locus.
- For a complete algebraically closed extension C/ℚ_p, Spd O_C is Spd(O_C,O_C), not Spd(C,O_C).
- Spd(R,R) and Spd(R⁺,R⁺) use the two different complete integral rings and their own continuous maps; neither is silently replaced by Spd(R[1/ϖ],R⁺).
- The integral v-sheaf of Spf A is Spd(A,A).
- Products (Spd O_E)^d exist as small v-sheaves and their Σ_d quotient uses D4’s small quotient construction; divisor geometry belongs to RF2.

**Direct prerequisites.** `DiamondsAndVStacks:D6/untilt-descent-along-v-covers`, `DiamondsAndVStacks:D2/v-descent-of-functions`, `PerfectoidSpaces:P1/marked-untilt`, `PerfectoidSpaces:P2/tilting-slice-equivalence`, `AdicSpacesPartII:F0/formal-spectrum`, `AdicSpacesPartII:R2`, `mathlib:CategoryTheory.Functor.IsFibered`.

**Sources.** [berkeley](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), §18.1 and Lemma 18.1.1 — The general pre-adic construction; distinction from the analytic diamond theorem..

**Signature refinement.** Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.

The precise entries left out of the suggested declarations are `PreAdic.Spd`, `PreAdic.diamond_isVSheaf`, `PreAdic.diamond_analytic`, `PreAdic.diamond_formal`, `PreAdic.diamond_integralScheme`, `integral_spd_oe`, `integral_spd_oc`, `integral_pair_variants`, `integral_formal_affine`, `integral_symmetric_power`. Their full mathematical statements above and the suggested file’s comment ledger are the contract; an unrelated proposition is not a substitute.
### integral-galois-quotient — Integral Galois quotient

**Theorem.** Let K be a complete nonarchimedean field in which p is topologically nilpotent, C a completed algebraic closure and G_K=Gal(K^sep/K). Then Spd O_C→Spd O_K is a proper v-cover and (Spd O_C)/underline(G_K)≅Spd O_K. This is a sheaf quotient, not a G_K-torsor assertion on the integral special fibre.

Identifier: `DiamondsAndVStacks:D6/integral-galois-quotient`.

**Hypotheses and conventions.**

- Complete nonarchimedean K with topologically nilpotent p
- C completed algebraic closure; profinite G_K

**Construction or proof.**

1. Reduce v-locally to products of algebraically closed valued fields and lift the integral map to O_C; the resulting cover is surjective.
2. Two lifts are v-locally related by a G_K-element, proving the quotient statement. For properness, pull back along a perfectoid atlas and use the compact/profinite product projection there, as in Berkeley 18.1.2. No locally spatial diamond structure on the integral base is assumed.
3. Keep stabilizers on special-fibre points; do not infer freeness from the generic Galois action.

**Acceptance.**

- Let K be a complete nonarchimedean field in which p is topologically nilpotent, C a completed algebraic closure and G_K=Gal(K^sep/K). Then Spd O_C→Spd O_K is a proper v-cover and (Spd O_C)/underline(G_K)≅Spd O_K. This is a sheaf quotient, not a G_K-torsor assertion on the integral special fibre.

**Direct prerequisites.** `DiamondsAndVStacks:D6/pre-adic-diamondification`, `DiamondsAndVStacks:D4/small-quotients-and-underlying-spaces`, `DiamondsAndVStacks:D5/profinite-products-of-locally-spatial-diamonds`.

**Sources.** [berkeley](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Lemma 18.1.2 and proof — Integral quotient and v-cover statement, with the distinction from torsors..

**Theorem signature.** Proposed name `TauCeti.Diamonds.IntegralGaloisQuotient`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.
### pre-adic-topological-comparison — Topology of pre-adic diamondification

**Theorem.** For a pre-adic space X over Spa ℤ_p, the point map |X^diamond|→|X| is a continuous surjection. If X is analytic it is a homeomorphism. For general nonanalytic X it need not be a homeomorphism: Berkeley Example 18.2.1 gives extra opens detected by topological nilpotence on the diamondification.

Identifier: `DiamondsAndVStacks:D6/pre-adic-topological-comparison`.

**Hypotheses and conventions.**

- Pre-adic X over Spa ℤ_p

**Construction or proof.**

1. Define the point map from a valued-field untilt and its map to X; independence follows from common refinements.
2. Realize nonanalytic points using Laurent-series valued fields; analytic points use completed algebraic closures of residue fields.
3. Continuity follows from rational-open pullbacks. Analytic homeomorphism is D6’s existing comparison; retain the nonanalytic counterexample.

**Acceptance.**

- For a pre-adic space X over Spa ℤ_p, the point map |X^diamond|→|X| is a continuous surjection. If X is analytic it is a homeomorphism. For general nonanalytic X it need not be a homeomorphism: Berkeley Example 18.2.1 gives extra opens detected by topological nilpotence on the diamondification.

**Direct prerequisites.** `DiamondsAndVStacks:D6/pre-adic-diamondification`, `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`, `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`.

**Sources.** [berkeley](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Example 18.2.1 and Proposition 18.2.2 — The topology theorem has exactly the analytic qualification on homeomorphism..

**Theorem signature.** Proposed name `TauCeti.Diamonds.PreAdicTopologicalComparison`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.
### seminormal-rigid-full-faithfulness — Seminormal rigid full faithfulness

**Theorem.** Fix a complete nonarchimedean field K over ℚ_p. If X is a seminormal rigid K-variety and Y any rigid K-variety, then Hom_K(X,Y)→Hom_{Spd K}(X^diamond,Y^diamond) is bijective. Diamondification factors through seminormalization, so its restriction to seminormal rigid K-varieties is fully faithful. All maps are over the fixed base Spd K. No full faithfulness on all analytic adic spaces is asserted.

Identifier: `DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness`.

Atlas planet: **Seminormal rigid full faithfulness**.

**Hypotheses and conventions.**

- Rigid varieties over a fixed K/ℚ_p
- Seminormal source X

**Construction or proof.**

1. Use the recovery O_X≅ν_*Ô_X on seminormal rigid spaces from KL16 8.2.3. Maps of diamonds pull back completed analytic functions; recovery constructs the unique map on affinoid charts.
2. Glue these maps and use underlying-space identification for compatibility; Berkeley Proposition 10.2.3 proves the bijection.
3. Finite universal homeomorphisms giving seminormalization are invisible after perfectoid test maps, so X and its seminormalization have the same diamond.

**Acceptance.**

- Fix a complete nonarchimedean field K over ℚ_p. If X is a seminormal rigid K-variety and Y any rigid K-variety, then Hom_K(X,Y)→Hom_{Spd K}(X^diamond,Y^diamond) is bijective. Diamondification factors through seminormalization, so its restriction to seminormal rigid K-varieties is fully faithful. All maps are over the fixed base Spd K. No full faithfulness on all analytic adic spaces is asserted.

**Direct prerequisites.** `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`, `DiamondsAndVStacks:D6/etale-site-comparison`, `DiamondsAndVStacks:D2/vector-bundles-across-pro-etale-and-v-sites`, `AdicSpacesPartII:R0`.

**Sources.** [berkeley](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Proposition 10.2.3 and proof — The theorem requires a fixed rigid base and seminormality.; [kl16](https://arxiv.org/pdf/1602.06899), Theorem 8.2.3 — Recovery of analytic functions is an external analytic input.; [hk](https://arxiv.org/pdf/2308.11064v2), Rigid-analytic diamond conventions, item 026 — The natural full-faithfulness addition requested by the routed paper..

**Theorem signature.** Proposed name `TauCeti.Diamonds.SeminormalRigidFullFaithfulness`; the full signature is explicitly omitted from declarations until its required interface can be stated. Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.

**Stage acceptance.** The definitions, API and discriminating tests above cover every target of D6. Every prerequisite chain ends at the pinned baseline, an exact foreign node, a supplier request or an explicit gap. The following work is required before closing the stage:

- Supplier contract: AdicSpacesPartII:R2 — A category of pre-adic spaces over Spa(ℤ_p,ℤ_p) allowing nonanalytic points, associated pre-adic spaces for complete integral Huber pairs and formal schemes, open gluing and maps from perfectoid untilts. Existing noetherian-formal-scheme-as-adic-space is not general enough for O_C; extend the mapping-functor construction to the complete nonnoetherian pairs used in Berkeley §18.1.
- Supplier contract: AdicSpacesPartII:R0 — Rigid K-varieties, seminormalization as a finite universal homeomorphism and seminormality criterion O_X≅ν_*Ô_X for the completed pro-étale structural sheaf (KL16 Theorem 8.2.3), including perfectoid seminormality and affinoid function recovery. D6 uses this analytic input to prove Berkeley Proposition 10.2.3; it does not redevelop seminormalization.
- Signature refinement: instantiate and state the explicitly omitted API/tests of DiamondsAndVStacks:D6/spd-of-a-tate-pair, DiamondsAndVStacks:D6/gluing-and-the-diamond-functor, DiamondsAndVStacks:D6/pre-adic-diamondification. See signatureCoverage for each name, statement and required interface; prove no implementations here.
- Named theorem signatures: supply the carrier/interface and state DiamondsAndVStacks:D6/spd-is-a-spatial-diamond, DiamondsAndVStacks:D6/etale-site-comparison, DiamondsAndVStacks:D6/untilt-descent-along-v-covers, DiamondsAndVStacks:D6/integral-galois-quotient, DiamondsAndVStacks:D6/pre-adic-topological-comparison, DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness. Their exact mathematical statements and proposed names are in signatureCoverage.namedTargets and the suggested comment ledger.

## Supplier contracts

### SchemeAndStackFoundations:SF.2

ECD 9.5: a finitely presented faithfully flat cover of a strictly henselian local scheme admits a finite flat locally free refinement. One route is Stacks 0571–0572 (quasi-finite flat refinement) followed by the finite local-factor theorem over a henselian ring. For R=C⁺/C⁰⁰, a valuation ring with algebraically closed fraction field, every finite flat cover has an R-valued section: choose a generic point and extend it by properness and the valuation criterion. Strict henselianity alone does not split arbitrary finite flat covers.

Consumers: `DiamondsAndVStacks:D3/descended-subsets-are-cut-out-by-functions`.

### AdicSpacesPartII:R2

Raynaud–Gruson for valuation rings of arbitrary height: a flat finite-type algebra over a valuation ring is finitely presented. Existing R2/flat-tft-is-tfp covers complete rank-one O_K; extend it to the arbitrary-height C⁺ used in ECD 9.5. Also extend R2/specialisation-map from classical closed points to lifting K-valued special-fibre points to O_C-valued points for the flat finitely presented formal model in that lemma.

Consumers: `DiamondsAndVStacks:D3/descended-subsets-are-cut-out-by-functions`.

### TropicalAndBerkovichArithmetic:TB.0

Extend the existing node TB.0/spectrum from normed rings to Banach and complete Tate rings and supply the normalized seminorm space (|ϖ|=1/2, canonically independent of normalization), its evaluation topology and the theorem that Spa(R,R⁺)→M(R) is the maximal Hausdorff quotient for complete Tate Huber pairs. Make an early TB.0:spectrum substage depending only on LI.0 and Tau Ceti AdicSpaces Layer 2; no dependency on D5. D5 only extends this functor to small v-sheaves (ECD 13.10–13.13).

Consumers: `DiamondsAndVStacks:D5/berkovich-quotient`.

### AdicSpacesPartII:R2

A category of pre-adic spaces over Spa(ℤ_p,ℤ_p) allowing nonanalytic points, associated pre-adic spaces for complete integral Huber pairs and formal schemes, open gluing and maps from perfectoid untilts. Existing noetherian-formal-scheme-as-adic-space is not general enough for O_C; extend the mapping-functor construction to the complete nonnoetherian pairs used in Berkeley §18.1.

Consumers: `DiamondsAndVStacks:D6/pre-adic-diamondification`.

### AdicSpacesPartII:R0

Rigid K-varieties, seminormalization as a finite universal homeomorphism and seminormality criterion O_X≅ν_*Ô_X for the completed pro-étale structural sheaf (KL16 Theorem 8.2.3), including perfectoid seminormality and affinoid function recovery. D6 uses this analytic input to prove Berkeley Proposition 10.2.3; it does not redevelop seminormalization.

Consumers: `DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness`.

## Source gaps

### Hochster realization has no proof in the source

The finite-T0 inverse-system construction is planned explicitly via finite distributive sublattices of qc opens. The additional construction of a commutative ring realizing an arbitrary spectral space is still an input gap: ECD 2.2 cites Hochster without proof, and the attempted freely hosted original proof could not be retrieved. Retain this separate target, locate Hochster Theorem 6 and transcribe its ring construction before calling D0 closed.

Needed by `DiamondsAndVStacks:D0/hochster-realization`.

### Noncompact period-torsor component transitivity

For the specific G(Q_p)-torsors of GLX Proposition 3.12, Proposition 6.6(2) and Lemma 6.12, prove that invariant clopens separate component orbits, or give an independent proof that the action on components is transitive over the connected period base. The compact/profinite corollary does not establish these noncompact applications. E01 refutes the universal lemma but not their conclusions; this plan exposes the remaining geometric input.

Needed by `DiamondsAndVStacks:D5/components-of-restricted-quotients`.

## Source corrections

### DiamondsAndVStacks/E01

Error at Lemma 3.2; arXiv v3 PDF pp. 16–17, and published p. 820 as checked by the earlier extraction worker. This run read the arXiv version; the independent extraction review read the LaTeX and did not reproduce the published PDF.. Printed fragment: π₀(F)/K = π₀(G).

**Corrected statement.** Retain the underlying-space quotient theorem. Replace the component formula with separate valid restricted theorems for the locally spatial period torsors, compact level quotients and compact Galois descent actually used. A compact-only replacement is insufficient for Proposition3.12.

**Check.** Let C be an algebraically closed characteristic-p perfectoid field, F=underline Zp times Spa(C,OC), and let the DISCRETE locally profinite group Z act by translations. Scholze11.12 realizes F as a perfectoid space; the free pro-etale relation coproduct_Z F defines a quotient diamond G and a Z-torsor. Scholze12.7–12.9 give |G|=Zp/Z with quotient topology. Every integer orbit is dense. Any nonempty saturated open has closed invariant complement, which would contain a dense orbit if nonempty; hence the quotient is indiscrete. It has more than one point (Zp is uncountable, Z countable), so it is connected, whereas pi0(F)/Z=Zp/Z has many elements. Proposition3.12 and6.6(2) use this false generality. This disproves the lemma, not by itself the geometric main theorems. (cc-442dc5) Rechecked on p.820: the proof asserts that π_0 is left adjoint to the inclusion of totally disconnected spaces and commutes with colimits, which the dense-orbit example refutes. Proposition 3.12 (p.828) is deduced from the lemma, and §6 uses both on pp.855–856, so those proofs inherit the gap recorded in G02.

**Provenance.** The existing extraction finding and its review are carried by origin; that review does not accept this blueprint. The packet records the correction search and versions read.

### DiamondsAndVStacks/ECD-7.12-adjoint-direction

Misprint at arXiv:1709.07343v4, Proposition 7.12. Printed fragment: left adjoint

**Corrected statement.** Right adjoint to the forgetful inclusion of w-local spaces with w-local maps, with counit X^wl→X.

**Check.** The proof constructs a final w-local object over X and says maps from w-local W to X factor uniquely by a w-local W→X^wl. This is precisely the right-adjoint Hom formula.

**Provenance.** This manuscript-local finding awaits the blueprint’s independent review. The packet records the correction search and versions read.

## Ownership and proposed structure

These proposals are for the maintainer; this job changes no atlas edges or upstream roadmap files.

- **D0's only declared prerequisite in the atlas is the external marker UPSTREAM:ECD:BASE.** In data/atlas.json the stage DiamondsAndVStacks:D0 has requires equal to the single entry UPSTREAM:ECD:BASE. That is not a stage identifier, so it cannot appear as a node prerequisite and cannot be named as the supplier of a request: the checker would reject it in either place. As a result D0 has no supplier edge inside the atlas at all. The accepted restructuring RS-05 already records the intended supplier, tauceti:TauCetiRoadmap/AdicSpaces layer 1, valuation spectra and continuous valuations, in D0's suppliedBy field. Proposal: replace the UPSTREAM:ECD:BASE marker in D0's requires by that Tau Ceti link, or drop the marker and record the dependence only through RS-05's suppliedBy, so that a reader of the atlas can see where D0's spectral foundations come from. This packet resolves the dependence by citing the pinned Tau Ceti declarations directly in baseline.declarations.
- **ECD 7.8 to 7.11 and 4.2 to 4.4 are P6's, which D1's stage text does not say.** D1's stage text says 'Implement ECD 7.1-7.7 and 7.12-7.23'. The four intervening results, the definition of affinoid pro-etale and pro-etale morphisms of perfectoid spaces (7.8), the observation that Zariski closed immersions and diagonals are affinoid pro-etale (7.9), the equivalence of the affinoid pro-etale category with Pro of the affinoid etale site (7.10) and the stability and limit assertions (7.11), are claimed by PerfectoidSpaces:P6's own stage text, which also claims the kappa-small perfectoid spaces of 4.2 to 4.4. The two texts therefore agree and there is no duplication, but a reader of D1 alone cannot see where the notion of a pro-etale morphism comes from, and the natural first guess, that D2 owns it because D2 owns the pro-etale topology, would create a cycle since D2 requires D1. Proposal: add one sentence to D1's text saying that the pro-etale morphism calculus is imported from P6, and one to D2's text saying the same.
- **D0 carries four independent developments and should be divided into sub-layers.** D0's text asks for four things with four different consumers: the spectral topology of ECD section 2 together with pro-categories and Hochster realization; the coherent and algebraic topos interface with sheaves of modules, sheafification, enough injectives, derived global sections and the Leray, Cech-to-derived and acyclic-basis comparisons; the cardinal arithmetic of ECD 4.1 with the completion bounds; and ordinary groupoid-valued prestacks with descent data, stackification, 2-fibre products and quotients of groupoids. The first is consumed by D1 to D5 and by ClassicalAdicEtaleCohomology:H0; the second by PerfectoidSpaces:P0 and P2 and by EnhancedDerivedSheaves:E1 and E2; the third by D2 and P6; the fourth by D3 and D4 only. These interfaces have separate acceptance criteria, and subdivision makes each consumer’s exact input visible. Proposal: divide D0 into D0:spectral (ECD section 2, pro-categories, Hochster), D0:sites (coherent topoi, the three cohomological comparisons, sheaves of modules), D0:size (ECD 4.1 and the conditional completion bounds) and D0:stacks (ordinary stackification and groupoid quotients), keeping the existing identifier D0 for the first and recording the others as sub-layers, exactly as the atlas already does for layers with a colon in their key.
- **D0's stack component is much smaller than its text suggests, because Mathlib now has descent data, prestacks and stacks.** At the pinned Mathlib commit 082e2d3 the directory Mathlib/CategoryTheory/Sites/Descent contains DescentData.lean, DescentDataPrime.lean, DescentDataAsCoalgebra.lean, IsPrestack.lean and IsStack.lean, giving CategoryTheory.Pseudofunctor.DescentData with its category structure and pull functors, CategoryTheory.Pseudofunctor.IsPrestack with the sheafHom construction, CategoryTheory.Pseudofunctor.IsStack, the comparison functor toDescentData and the lemma isEquivalence_toDescentData. That is exactly ECD Definition 9.1 and the assertion that a stack has an equivalence onto its descent data. D0's text still asks to 'construct descent data, stackification, 2-fibre products, quotients of groupoids, and descent of morphisms and objects'. Proposal: narrow that paragraph to stackification, 2-fibre products of stacks and quotients of groupoid objects, and say that descent data, prestacks and stacks are to be reused from the pinned library in its namespace. This packet already plans only the narrowed part.
- **D5 carries the largest single load in the roadmap and should be divided.** D5's text assigns it ECD 11.17 to 11.31, 12.18 to 12.21 and all of section 13, that is spatiality and its permanence, the universally open presentation and its converse, the two-out-of-three property, the local structure of etale maps, the spatial v-sheaf criterion, relative representability in diamonds and in locally spatial diamonds, the extension of the TB.0 affinoid Berkovich functor to small v-sheaves and its maximal Hausdorff property, the reduction of a quasicompact separated diamond to a spatial one, and the ordinary sheaf-cohomology comparison 13.13. Its consumers are also distinct: DiamondEtaleCohomology:C0 and C7 need spatiality and the spatial criterion, DiamondSixOperations:S0 and S1 need relative representability, and C4 needs the Berkovich geometry. Proposal: divide D5 into D5:spatial (11.17 to 11.31 and 12.12 to 12.17), D5:criterion (12.18 to 12.21) and D5:representability (section 13, including 13.13), which also makes the third sub-layer's dependence on D0's ordinary sheaf cohomology visible in the link graph.
- **D6:pre-adic — integral pre-adic v-sheaves.** Propose a substage of D6 containing pre-adic-diamondification, integral-galois-quotient and pre-adic-topological-comparison. RT-AREA-padic-1/3 is resolved at the supplier: no new consumer atlas edge is needed because D6 already precedes RF0/RF2/GS0/GS1. The integral Part II imports this base construction.
- **TB.0:spectrum owns affinoid maximal Hausdorff quotients.** RT-AREA-padic-1/10: existing TB.0/spectrum owns the seminorm carrier; request its complete-Tate and maximal-Hausdorff extensions in an early substage with only LI.0 and Tau Ceti AdicSpaces Layer 2 inputs. Propose TB.0:spectrum → D5. D5 keeps only the extension to small v-sheaves and ECD 13.10–13.13.
- **Canonical compactification remains DiamondEtaleCohomology:C4.** RT-AREA-padic-1/11: use C4 as the unique owner of ECD §18 canonical compactification; correct RS-05’s owners entry and its D5 reason. D2 owns sites/functions, D3 effective descent, D4 diamond quotients. The elementary special construction in ECD 9.9 is proved in D3 to establish descent; it does not import C4 backwards, avoiding a cycle.
- **Infinity-categorical profinite sheaves route to EnhancedDerivedSheaves.** RT-AREA-padic-1/12: D0 owns only ordinary Set/Ab sheaves and ordinary ultrafilter stalks from Arc §3. The infinity-categorical categorical-valued extensions, finite-product preservation with higher coherence and hypercompletion belong to EnhancedDerivedSheaves. Propose an outward D0 → EnhancedDerivedSheaves link, never a reverse prerequisite. The prose of D0’s scope must say ordinary coherent sites and groupoid-valued stacks, not infinity-categorical derived foundations.

## Baseline declarations

These are suppliers, not new nodes. Each link opens the source module at the pinned commit; the packet records the exact declaration and the interface it provides.

- [`AlgebraicGeometry.Scheme.ProEt.precoverage`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Proetale.lean) (mathlib): The pro-etale precoverage of schemes, the scheme-side analogue of the site D2 builds.
- [`AlgebraicGeometry.Scheme.qcPrecoverage`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/QuasiCompact.lean) (mathlib): The quasi-compact precoverage of schemes, whose covering condition is literally the one in ECD Definition 8.1; the model for the perfectoid pro-etale and v-coverings.
- [`Cardinal`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/SetTheory/Cardinal/Defs.lean) (mathlib): Cardinals, in which the cutoff conditions of ECD Lemma 4.1 are stated.
- [`Cardinal.IsStrongLimit`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/SetTheory/Cardinal/Order.lean) (mathlib): Strong limit cardinals, condition (i) of ECD Lemma 4.1.
- [`Cardinal.beth`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/SetTheory/Cardinal/Aleph.lean) (mathlib): The beth hierarchy, the transfinite construction in the proof of ECD Lemma 4.1.
- [`Cardinal.mk`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/SetTheory/Cardinal/Defs.lean) (mathlib): The cardinality of a type, used in the smallness conditions.
- [`Cardinal.power_le_power_left`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/SetTheory/Cardinal/Order.lean) (mathlib): Monotonicity of cardinal exponentiation, used in the completion bound of ECD Remark 4.3.
- [`CategoryTheory.Abelian.SpectralObject`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/SpectralObject/Basic.lean) (mathlib): Spectral objects, the pinned library's way of producing spectral sequences from filtrations.
- [`CategoryTheory.Bicategory`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Bicategory/Basic.lean) (mathlib): Bicategories, in which 2-fibre products of stacks are formed.
- [`CategoryTheory.Cat.HasLimits.limitCone`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Category/Cat/Limit.lean) (mathlib): Strict limits in the category of categories. These are not 2-fibre products, which is the distinction the 2-fibre product node must record.
- [`CategoryTheory.EffectiveEpiFamily`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/EffectiveEpi/Basic.lean) (mathlib): Effective epimorphic families, the pinned form of a jointly surjective family.
- [`CategoryTheory.EnoughInjectives`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Preadditive/Injective/Basic.lean) (mathlib): Enough injectives, available for Grothendieck abelian categories and hence for categories of abelian sheaves.
- [`CategoryTheory.Functor.Faithful`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Functor/FullyFaithful.lean) (mathlib): Faithfulness of a functor, which is the definition of a 0-truncated map in ECD 10.7(iv).
- [`CategoryTheory.Functor.sheafPushforwardContinuous`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Continuous.lean) (mathlib): Pushforward along a continuous functor of sites, the nu_* of ECD Proposition 8.5 and the f_* of the Leray spectral sequence.
- [`CategoryTheory.GrothendieckTopology`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Grothendieck.lean) (mathlib): Grothendieck topologies, the carrier of the pro-etale and v-topologies.
- [`CategoryTheory.GrothendieckTopology.Subcanonical`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Canonical.lean) (mathlib): Subcanonical topologies, exactly the conclusion of ECD Corollary 8.6 and Theorem 8.7.
- [`CategoryTheory.Groupoid`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Groupoid.lean) (mathlib): Groupoids, the values of a prestack.
- [`CategoryTheory.Ind`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/Indization/Category.lean) (mathlib): The ind-category of a category. Mathlib has Ind but no Pro at the pinned commit, so the pro-category is planned and this is what it must be compatible with.
- [`CategoryTheory.IsCofiltered`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Filtered/Basic.lean) (mathlib): Cofiltered categories, the index categories of pro-systems and of the limits in ECD Lemma 2.11 and Proposition 6.5.
- [`CategoryTheory.IsFiltered`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Filtered/Basic.lean) (mathlib): Filtered categories, the index of the colimits in ECD Proposition 8.2 and Proposition 10.5.
- [`CategoryTheory.IsGrothendieckAbelian`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/GrothendieckCategory/Basic.lean) (mathlib): Grothendieck abelian categories, which is how enough injectives and Ext are obtained for sheaves.
- [`CategoryTheory.Limits.HasFilteredColimits`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/Filtered.lean) (mathlib): Existence of filtered colimits, used in the smallness criterion for sheaves.
- [`CategoryTheory.Limits.HasLimits`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/HasLimits.lean) (mathlib): Existence of limits in a category, needed for the pro-category and for limits of diamonds.
- [`CategoryTheory.MorphismProperty`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/MorphismProperty/Basic.lean) (mathlib): Classes of morphisms with stability properties, the shape of the etale, finite etale and quasi-pro-etale classes.
- [`CategoryTheory.Over`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Comma/Over/Basic.lean) (mathlib): Slice categories, in which the small pro-etale site of a perfectoid space is defined.
- [`CategoryTheory.Precoherent`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Coherent/Basic.lean) (mathlib): Precoherence, the condition under which the coherent topology is well behaved.
- [`CategoryTheory.Precoverage`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Precoverage.lean) (mathlib): Precoverages, the pinned library's lighter-weight predecessor of a pretopology, which the perfectoid sites should be built as.
- [`CategoryTheory.Pretopology`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Pretopology.lean) (mathlib): Pretopologies, the form in which ECD Definition 8.1 states the coverings.
- [`CategoryTheory.Pseudofunctor`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Bicategory/Functor/Pseudofunctor.lean) (mathlib): Pseudofunctors, the pinned library's carrier for prestacks and stacks.
- [`CategoryTheory.Pseudofunctor.DescentData`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Descent/DescentData.lean) (mathlib): The category of descent data for a family of maps. This is ECD Definition 9.1 and is already in the pinned library, so it is not planned again.
- [`CategoryTheory.Pseudofunctor.IsPrestack`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Descent/IsPrestack.lean) (mathlib): The prestack condition, descent of morphisms, already in the pinned library.
- [`CategoryTheory.Pseudofunctor.IsStack`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Descent/IsStack.lean) (mathlib): The stack condition, effectivity of descent, already in the pinned library; every descent theorem of D3 is an instance of it.
- [`CategoryTheory.Pseudofunctor.sheafHom`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Descent/IsPrestack.lean) (mathlib): The Hom sheaf of an existing Mathlib prestack. Constructing this from arbitrary non-sheaf Hom presheaves is the additional sheafification step of D0, not provided by this declaration alone.
- [`CategoryTheory.Pseudofunctor.toDescentData`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Descent/DescentData.lean) (mathlib): The comparison functor from sections over the base to descent data, the map ECD calls F(X) -> F(Y/X).
- [`CategoryTheory.Sheaf`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Sheaf.lean) (mathlib): Sheaves on a site, the ambient category of all of sections 8 to 15.
- [`CategoryTheory.Sheaf.cohomologyPresheaf`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean) (mathlib): Sheaf cohomology defined through Ext from the constant sheaf; ECD's H^i(X, F) on any of its sites. Derived global sections are therefore not planned again.
- [`CategoryTheory.SpectralSequence`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/SpectralSequence/Basic.lean) (mathlib): Spectral sequences, the shape of the Cech-to-derived and Leray comparisons.
- [`CategoryTheory.cechComplexFunctor`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean) (mathlib): The Cech complex of a family of objects. The Cech-to-derived comparison is not in the pinned library and is planned.
- [`CategoryTheory.coherentTopology`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Coherent/Basic.lean) (mathlib): The coherent topology on a precoherent category, the closest pinned analogue of the finiteness condition in ECD's coverings.
- [`CategoryTheory.presheafToSheaf`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Sheafification.lean) (mathlib): Sheafification, with its adjunction; the left-exactness instance in the pinned library makes the plus construction preserve finite limits.
- [`CategoryTheory.sheafIsAbelian`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Abelian.lean) (mathlib): Abelianness of the category of sheaves in an abelian target, the input to sheaf cohomology.
- [`CompHaus.epi_iff_surjective`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Category/CompHaus/Basic.lean) (mathlib): Epimorphisms of compact Hausdorff spaces are the surjections, which is what makes the presentation a cover.
- [`CompHaus.projectivePresentation`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Category/CompHaus/Projective.lean) (mathlib): A projective presentation of a compact Hausdorff object by an extremally disconnected one; the existing half of the presentation ECD builds.
- [`CompHaus.toProfinite`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Category/Profinite/Basic.lean) (mathlib): The reflection of compact Hausdorff spaces onto profinite sets.
- [`ConnectedComponents`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Connected/Clopen.lean) (mathlib): The space of connected components, which is pi_0(X) for a qcqs perfectoid space.
- [`ContinuousMap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/ContinuousMap/Defs.lean) (mathlib): Continuous maps, out of which the v-sheaf T underline attached to a topological space T is built.
- [`FirstCountableTopology`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Bases.lean) (mathlib): First countability, the hypothesis under which the completion cardinality bound of ECD Remark 4.3 is stated in conditional form.
- [`GeneralizingMap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Inseparable.lean) (mathlib): Generalizing maps of topological spaces. All maps of analytic adic spaces are generalizing, which is the hypothesis of ECD Lemmas 2.5, 2.7 and 2.9.
- [`IsAlgClosed`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IsAlgClosed/Basic.lean) (mathlib): Algebraic closedness, the condition on the completed residue fields of a strictly totally disconnected space.
- [`IsClosed`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Defs/Basic.lean) (mathlib): Closedness of a subset, used in the w-local condition on the set of closed points.
- [`IsCompact.image`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Compactness/Compact.lean) (mathlib): Continuous images of compact sets are compact, used in the quotient-map arguments.
- [`IsRetrocompact`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructible.lean) (mathlib): Retrocompact subsets, the condition entering the definition of constructibility.
- [`IsSpectralMap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Spectral/Hom.lean) (mathlib): Spectral maps of topological spaces, with composition and the proper-map criterion. The absolute half of ECD's morphism condition.
- [`LinearMap.charpoly`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Charpoly/Basic.lean) (mathlib): The characteristic polynomial of an endomorphism of a finite free module, the tool in the reduction to an algebraically closed field in ECD Lemma 9.4.
- [`Module.FaithfullyFlat`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean) (mathlib): Faithful flatness, the conclusion in the surjective case and the input to v-descent of functions.
- [`Module.Flat`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Basic.lean) (mathlib): Flatness of modules, the conclusion of ECD Proposition 7.23.
- [`Module.Free`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FreeModule/Basic.lean) (mathlib): Free modules, used for the finite free algebra carrying the characteristic polynomial in ECD Lemma 9.4.
- [`Ordinal`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/SetTheory/Ordinal/Basic.lean) (mathlib): Ordinals, the index of the transfinite constructions in ECD Lemma 4.1, Lemma 11.22 and Lemma 12.17.
- [`PrimeSpectrum`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Defs.lean) (mathlib): The prime spectrum of a commutative ring, with the instance making it a spectral space; the implication (ii) implies (i) of ECD Theorem 2.2 is therefore already proved.
- [`PrimeSpectrum.comap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/RingHom.lean) (mathlib): Functoriality of the prime spectrum, needed for the inverse-system construction realising a spectral space as a Spec.
- [`PrimeSpectrum.comap_surjective_of_faithfullyFlat`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/FaithfullyFlat/Algebra.lean) (mathlib): Surjectivity of Spec of a faithfully flat map, the form of faithful flatness used at the end of ECD Proposition 7.23.
- [`PrimeSpectrum.localization_comap_range`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Topology.lean) (mathlib): The image of Spec of a localization, used in the Hochster realization argument.
- [`Profinite`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Category/Profinite/Basic.lean) (mathlib): Profinite sets as a category, the target of pi_0 of a totally disconnected perfectoid space.
- [`Profinite.asLimit`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Category/Profinite/AsLimit.lean) (mathlib): The presentation of a profinite set as the limit of its finite quotients, the model for the pro-category equivalence.
- [`ProfiniteGrp`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Category/ProfiniteGrp/Basic.lean) (mathlib): Profinite groups, the groups appearing in ECD Proposition 11.26 and in the Galois towers of ECD 15.3.
- [`QuasiSeparatedSpace`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/QuasiSeparated.lean) (mathlib): Quasiseparatedness of a topological space, one of the four conditions in SpectralSpace and the hypothesis of ECD Lemma 2.7.
- [`SpectralSpace`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Spectral/Basic.lean) (mathlib): Spectral spaces as T0, compact, sober, quasiseparated spaces with a basis of compact opens. The absolute half of ECD Definition 2.1 is already here; only the locally spectral notion is planned.
- [`StableUnderGeneralization`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Inseparable.lean) (mathlib): Stability under generalization, ECD's generalizing subsets.
- [`StableUnderSpecialization`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Inseparable.lean) (mathlib): Stability of a subset under specialization, the condition in ECD Lemma 2.4 and in the closedness criteria.
- [`StoneCech`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Compactification/StoneCech.lean) (mathlib): The Stone-Cech compactification, used in ECD Remark 2.8 and Example 11.12 to present a compact Hausdorff space as a quotient of a profinite set.
- [`Stonean`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Category/Stonean/Basic.lean) (mathlib): Extremally disconnected compact Hausdorff spaces, the projective objects used for those presentations.
- [`Stonean.stoneCechAdjunction`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Category/Stonean/Adjunctions.lean) (mathlib): The adjunction between Stonean spaces and sets realising the Stone-Cech compactification of a discrete set.
- [`T0Space`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Separation/Basic.lean) (mathlib): The T0 separation axiom, which is the conclusion of ECD Lemma 2.7.
- [`Topology.IsConstructible`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructible.lean) (mathlib): Constructible subsets, the boolean algebra generated by the retrocompact opens; ECD's constructible subsets of a spectral space.
- [`Topology.IsLocallyConstructible`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructible.lean) (mathlib): Locally constructible subsets, the version ECD uses on a locally spectral space.
- [`Topology.IsOpenEmbedding.spectralSpace`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Spectral/Basic.lean) (mathlib): A compact open subspace of a spectral space is spectral, used whenever a quasicompact open of a spectral space is treated as a spectral space.
- [`Topology.IsQuotientMap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Defs/Induced.lean) (mathlib): Quotient maps, the conclusion of ECD Lemmas 2.5 and 2.6 and of Proposition 11.15.
- [`TotallyDisconnectedSpace`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Connected/TotallyDisconnected.lean) (mathlib): Total disconnectedness of a topological space; part of the profiniteness of the constructible topology.
- [`UniformSpace.Completion`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/UniformSpace/Completion.lean) (mathlib): Completions of uniform spaces, used for the varpi-adic completions in the w-localization and in the topological classification of pro-etale maps.
- [`ValuationSubring`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/ValuationSubring.lean) (mathlib): Valuation subrings, the K^+ of Spa(K, K^+).
- [`WithConstructibleTopology`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Spectral/ConstructibleTopology.lean) (mathlib): The type synonym carrying the constructible topology of a topological space, ECD's X with its constructible topology.
- [`WittVector`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Defs.lean) (mathlib): Witt vectors, in which Fontaine's map and the primitive element xi of the untilt descent live.
- [`compactSpace_withConstructibleTopology`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Spectral/ConstructibleTopology.lean) (mathlib): Quasicompactness of the constructible topology for a space that is compact, quasisober, prespectral and quasiseparated; the half of ECD's profiniteness statement that is already proved.
- [`constructibleTopology_eq_generateFrom_isConstructible`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Spectral/ConstructibleTopology.lean) (mathlib): The constructible topology is generated by the constructible subsets, matching ECD's description.
- [`specializes_iff_mem_closure`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Inseparable.lean) (mathlib): The description of the closure of a point by specializations, the degenerate case of ECD Lemma 2.4.
- [`TauCeti.Huber.Pair`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Huber/Pair.lean) (tauceti): Huber pairs, the (A, A^+) of Spa(A, A^+) and of Spd(A, A^+).
- [`TauCeti.Huber.Pair.Hom.spaComap`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/Spa/HuberPair.lean) (tauceti): Functoriality of Spa in the Huber pair, used for the gluing of Spd along rational subsets.
- [`TauCeti.ValuationSpectrum.IsAnalyticPoint`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Analytic.lean) (tauceti): Analytic points of the adic spectrum, the condition defining analytic adic spaces, which is the source category of the diamond functor of D6.
- [`TauCeti.ValuationSpectrum.compactSpace_patchTopology`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.lean) (tauceti): Quasicompactness of the patch topology, the anchor's version of the compactness used in every quasicompactness argument of ECD section 2.
- [`TauCeti.ValuationSpectrum.isClosedEmbedding_toPatch`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.lean) (tauceti): The closed embedding of the valuation spectrum into a product of copies of Bool for the patch topology, the anchor's proof that the patch topology is profinite.
- [`TauCeti.ValuationSpectrum.isCompact_basicOpen`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.lean) (tauceti): Quasicompactness of the basic opens of the valuation spectrum.
- [`TauCeti.ValuationSpectrum.isProConstructible_setOfPred_forall_vle_one`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.lean) (tauceti): Pro-constructibility of the locus where a family of functions has absolute value at most one, which is the shape of the subsets appearing in ECD Lemma 7.6 and Lemma 9.4.
- [`TauCeti.ValuationSpectrum.isProConstructible_val_preimage_spa`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.lean) (tauceti): Pro-constructibility of the adic spectrum inside the valuation spectrum, the anchor's pro-constructibility calculus.
- [`TauCeti.ValuationSpectrum.patchTopology`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.lean) (tauceti): The patch topology on the valuation spectrum, the anchor's form of the constructible topology.
- [`TauCeti.ValuationSpectrum.residueFieldValuation`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/ResidueField.lean) (tauceti): The completed residue field with its valuation at a point of the adic spectrum, the K(x) of ECD Example 5.2 and Lemma 7.3.
- [`TauCeti.ValuationSpectrum.spa`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean) (tauceti): The adic spectrum as a subset of the valuation spectrum, the carrier of Spa(A, A^+).
- [`TauCeti.ValuationSpectrum.spectralSpace_cont_of_pairOfDefinition`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/Cont/Spectral.lean) (tauceti): Spectrality of the locus of continuous valuations, the other half of the anchor's spectral foundations.
- [`TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.lean) (tauceti): Spa(A, A^+) of a Huber pair with a pair of definition is a spectral space; the anchor result RS-05 names as the supplier of D0's spectral foundations.
- [`TauCeti.IsProConstructible`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Spectral/ProConstructible.lean) (tauceti): The existing predicate of closedness for the constructible topology; not redefined in D0.
- [`TauCeti.IsProConstructible.isCompact`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Spectral/ProConstructible.lean) (tauceti): Pro-constructible subsets of a spectral space are quasicompact.
- [`TauCeti.IsProConstructible.spectralSpace`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Spectral/ProConstructible.lean) (tauceti): The induced spectral-space structure on a pro-constructible subspace.
- [`TauCeti.IsSpectralMap.continuous_constructibleTopology`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Spectral/ProConstructible.lean) (tauceti): A spectral map is continuous after passing to constructible topologies.
- [`CategoryTheory.Functor.IsFibered`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/FiberedCategory/Fibered.lean) (mathlib): Cartesian lifts exist and compose; the generic marked-untilt presheaf prototype requires this actual hypothesis on the tilting functor.
- [`Ordinal.cof`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/SetTheory/Cardinal/Cofinality/Ordinal.lean) (mathlib): Cofinality of the ordinal associated to a cardinal, used in the actual three-clause cutoff condition.
- [`CategoryTheory.Pseudofunctor.StrongTrans`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Bicategory/NaturalTransformation/Pseudo.lean) (mathlib): Strong transformations between pseudofunctors, used for the stackification unit and universal property.
- [`CategoryTheory.Pseudofunctor.StrongTrans.Modification`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Bicategory/Modification/Pseudo.lean) (mathlib): The actual category of transformations and modifications for the stackification universal equivalence.
