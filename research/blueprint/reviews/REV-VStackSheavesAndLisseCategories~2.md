# Second independent review: Artin v-stacks, solid and lisse coefficient categories

**Job:** `REV-VStackSheavesAndLisseCategories~2` · **Issue:** #7096 · **Reviewer:** Claude (Claude Code), session `claude-8Esaq6` · **Date:** 2026-10-08

**Verdict: accepted.** This is a finished review of revision round 2 of the plan (`BP-VStackSheavesAndLisseCategories~2`, Codex session `codex-LSX9Vg`). It follows the review [REV-VStackSheavesAndLisseCategories](REV-VStackSheavesAndLisseCategories.md), which returned `needs_changes`. The packet stays `complete`: one finished target-level pass, all six stages `planned`, none `closed`, nothing claimed as formalised.

Independence. The round-2 revision and the completed round-1 plan were written by Codex sessions. An early checkpoint of round 1 came from a Claude Code session (`cc-7b31c4`, pull request #2845) that is not this one; this session did none of the planning, revision or earlier review work and has no record of that session.

## Counts

| Item | Result |
| --- | --- |
| Nodes | 80: 41 verified, 38 corrected, 1 added |
| Statements changed | 11 |
| Locators corrected or made precise | 33 |
| Prerequisites | 4 added, 1 removed |
| Definitions and constructions | 31, with 183 API items (one added) and 95 unit tests |
| Planets | 30, unchanged; at most six per layer |
| Baseline declarations | 39 confirmed at the pins; none removed or replaced; kinds recorded |
| Gaps and requests | 16 gaps, 15 requests (two requests extended) |
| Source issues | 6: five checked and confirmed, one added and confirmed |
| Source match and hypotheses | rewritten for every node (75 matches and 77 hypothesis lists were one generic sentence) |

## What the first review asked for, and whether it was done

1. **Ownership (red-team finding 30).** Done, and checked against the source. The generic solid layer VS2 now holds VII.1, VII.2.1–VII.2.6 (with a node of its own for the change of algebraically closed base field, VII.2.6), VII.3 and VII.4, with the condensed foundations. The solid Drinfeld descent VII.2.7–VII.2.8 and the solid partial-support construction and vanishing VII.2.9–VII.2.10 are owned by VS4. The comparisons of VII.5 are owned by VS3. A traversal of the packet confirms that no node owned by VS2 has a prerequisite, direct or transitive, among the nodes of VS0, VS1, VS3, VS4 or VS5, and that none of the stages its nodes import has an ancestor in this roadmap.
2. **The VII.4 and VII.5 branch.** The first review left its placement to the revision. Reading both sections settles it. Nothing in VII.4 (the naive embedding, Propositions VII.4.1–VII.4.3) uses universal local acyclicity; VII.4.3 uses only the homology functor of VII.3.1. So the revision was right to delete the VS1 prerequisite and keep the node in VS2. The proof of VII.3.5 uses the naive embedding of VII.4.1, which is why the proper smooth duality node now imports it; there is no cycle. Section VII.5 does use Chapter IV (Proposition IV.2.19 in VII.5.2, the kernel criterion in VII.5.3), and the proofs of VII.6.5 and VII.6.6 use VII.5.2, so the VII.5 nodes must come before the lisse comparisons: VS3 is the only consistent owner, and VS4 would give a cycle, as the revision says.
3. **Reader.** Done. Before my edits the reader reproduced every statement, proof step, direct input, API item, test, acceptance item, gap, request and source issue of the packet exactly; I checked this mechanically with a script that regenerates each section from the packet, and the same for the ledger of the suggested file. The eighteen corrections of the first review are all present in the packet.

## Corrections made in this review

All of these are in the packet, the reader and the ledger of the suggested file.

**Results cited but stated by no node.**

- `VS0/stability-under-fibre-products-and-representable-maps`: added part (ii) of Proposition IV.1.8 (the Artin property may be tested after product with a pro-étale surjective smooth cover of the point) and Example IV.1.9(i),(iii). The classifying-stack example cited by the definition node needs it.
- `VS1/ula-definition-with-constructibility`: added Definition IV.2.22, universal local acyclicity over a base that is a small v-stack. The kernel-adjoint theorem and every Bun_G statement use that generality. One API item added.
- `VS1/ula-descent-and-smooth-locality`: added Propositions IV.2.4, IV.2.6, IV.2.9, IV.2.10 and Corollary IV.2.12, which the locator cited and the definition of perfect local systems relies on.
- `VS1/perfect-rhom-and-la-characterisation`: added Proposition IV.2.15 (base change of the relative Verdier dual of a ULA complex), cited in the proof of the kernel-adjoint theorem and stated nowhere.
- `VS1/braden-theorem`: added the two contraction isomorphisms that are part of Theorem IV.6.5.
- `VS2/solid-four-operations`: added the degree bound and limit formula of Proposition VII.2.3. `VS2/relative-solid-homology`: added the internal-Hom form of the adjunction from Proposition VII.3.1(i).

**Node added.** `VS1/formal-smoothness-examples` (marked `addedBy`): Propositions IV.3.3 and IV.3.8 and Corollary IV.3.4. The proof of the Jacobian criterion uses IV.3.8 through Lemma IV.4.28, and no packet in the repository stated it. It is now a prerequisite of `VS1/jacobian-criterion`, with suppliers in VectorBundlesAndIsocrystals and RelativeFarguesFontaine whose statements I read.

**Hypotheses brought back to the source.**

- `VS1/formal-smoothness`: the test objects are Zariski closed subspaces of affinoid perfectoid spaces (Definition IV.3.1), not arbitrary closed perfectoid subspaces.
- `VS1/section-functor-and-positive-tangent` and `VS1/jacobian-criterion`: the embedding is a Zariski closed immersion in the sense of Definition IV.4.20, and the smooth locus is an open subfunctor.
- `VS2/condensed-lca-rhom`: the node gave the vanishing of derived Hom into the reals for every compact Hausdorff abelian group as the source's statement. Theorem 4.3 of the Condensed notes states it for products of circles; its proof gives the general case, and the node now says both.
- `VS0/artin-v-stack-definition`: the sentence on how smoothness of the atlas is tested now gives the supplier's definition.
- `VS2/solid-four-operations`: the counterexample to the projection formula is the inclusion of a point in a perfectoid ball, as in Warning VII.2.5.

**Prerequisites.** Added: unbounded hyperdescent to `VS1/braden-theorem`; universal openness of cohomologically smooth maps to `VS1/formal-smoothness-calculus`; the tensor-Hom node to `VS1/hyperbolic-base-change-duality-and-ula` (the proof of IV.6.14 uses IV.2.19); the new examples node to `VS1/jacobian-criterion`. Removed: the finite étale covers of the divisor space from the solid Drinfeld descent node, whose proof (descent and VII.2.6) does not use them.

**Locators.** Thirty-three corrected or made precise. The two that were wrong in substance: `VS3/lisse-coefficient-change` and `VS5/duality-and-admissibility-coefficient-change` cited a part (v) of Proposition VII.3.1, which has parts (i)–(iii); the relevant one is (ii). Others gave wrong pages (IV.2.4–IV.2.14 are on pp.115–119), omitted the results where the content is (Definition IV.6.4 for hyperbolic localization; the numbered results of the proof of the Jacobian criterion), attached footnote 14 of the Condensed notes to the wrong statement, called Theorem V.6.1 and ECD Theorem 19.5 propositions, or filed a Fargues–Scholze locator under the Berkeley lectures (`VS1/geometric-divisor-finite-etale`, now two source entries).

**Source match and hypotheses.** Seventy-five nodes had the same sentence as `match` and seventy-seven the same line as `hypotheses`. Section 5 of the protocol asks the match to say what the cited place states and how it supports the node. I wrote both fields for all eighty nodes from the passages as I read them. For the two nodes that assemble a target the source does not state as a numbered result (the two coefficient-change nodes) the match says so.

**Structure.** The restructuring proposals and the notes now carry the fields of sections 9 and 10 of the protocol (`action`, `roadmaps`, `detail`, `proposal`; `roadmaps`, `note`). In the proposed subdivision of VS2, `VS2/general-ring-solidity` moves to the sub-layer of coefficient applications, because it imports analytic rings; the first sub-layer, which is what HabiroRings HR.2 asks for, then needs only Mathlib's condensed carriers and EnhancedDerivedSheaves.

## Stage dependencies implied by the node prerequisites

I compared the layers of all prerequisites with the stage requirements in `data/atlas.json`.

- **VS1→VS3** is new. It follows from the ownership of VII.5. It is acyclic, and all four consumers of VS3 (VS4, HeckeStacksAndLocalShtukas HS1, GeometricSatakeAndFusion GS2:correspondences and GS3:fusion) already require VS1, so no consumer gains an ancestor. The revision did not state this edge; the packet and the reader now do.
- **DiamondSixOperations S4→VS2** and **DiamondEtaleCohomology C6→VS2** are new: VII.3.2–VII.3.5 are about cohomologically smooth maps and VII.2.6 rests on ECD Theorem 19.5. Neither supplier has an ancestor in this roadmap. Recorded.
- **SolidAnalyticRings SA.2–SA.4 and AnalyticStacks AS.2–AS.3→VS2** come from the four coefficient applications and are requests.
- **ClassicalAdicEtaleCohomology H5→VS1** (Huber's comparison theorem in IV.2.30) and **SmoothRepresentationsOfLocalGroups SR.0:derived-extension→VS4, VS5** are requests or cited nodes.
- **Tau Ceti ClassFieldTheory layer 9→VS1**: see finding 31 below.

## Red-team findings handed to the plan

| Finding | Result |
| --- | --- |
| 18 | Right. No node of VS3 is a prerequisite of a Satake layer in this packet; the removal of VS3→GS2:correspondences and VS3→GS3:fusion, the edges L1, L3→GS1 and the replacement of EDC.4 by EDC.5 are recorded as proposals, since they concern other roadmaps' files. |
| 28 | Right. The only AdicCoefficientsAndComparisons nodes the VS3 nodes cite are in L0. Chapter VII.6 uses nothing from ECD §27; I confirmed that it cites only VII.5.2 and standard results. |
| 29 | Right. VII.7.6, VII.7.7, VII.7.8, VII.7.9 and VII.7.10 are nodes of VS5 for relatively discrete Z_ell-algebras, including rational coefficients; VII.7.2 is in VS4; there is no lisse reflexivity node, as the source omits that proof; VS5→HS1 is proposed. |
| 30 | Right, as described above. |
| 31 | Right in substance. The node imports the accepted VectorBundlesAndIsocrystals node for the finite étale algebras of the curve and Lemma 16.3.2 of the Berkeley lectures, without the product statements 16.3.3 and 16.3.6. One point is left to the orchestrator: see the first question below. |

## Baseline

All 39 declarations exist under the cited names in the cited modules at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` (Mathlib read in the pinned checkout of the shared build, Tau Ceti by `git show` at the pin). I read the statements the nodes rely on: `CondensedMod.IsSolid` and its docstring, which says the definition is only right over finite-type algebras over the integers and prescribes the test over the polynomial ring; `Condensed.profiniteSolid`, `profiniteSolidification`, `profiniteFree`; `LocallyConstant.freeOfProfinite` (freeness of locally constant integer functions on a profinite set); `CondensedSet.fullyFaithfulCompactlyGeneratedToCondensedSet`; `CategoryTheory.sheafCompose`; `ModuleCat.restrictScalars`; `TopCat.toCondensedSet`; `profiniteToCondensed`; `TauCeti.IsSmoothDiscrete`, `TauCeti.SmoothDiscreteTopRep`, `TauCeti.ValuationSpectrum.spa`, `TauCeti.Huber.Pair`. Each provides what the citing nodes say and no more. `CategoryTheory.Sheaf` is an abbreviation at the pin, which the entry now says. No citation was removed or replaced. The `kind` of 35 entries was the word "declaration"; they now give the actual keyword.

The reviewed library audit (`data/library-coverage.json`, AUDIT-21) finds VS2 partly built and the other five layers not built. The five Mathlib declarations it gives as evidence for VS2 are cited as baseline and not planned as nodes. Nothing the audit shows in the libraries is planned again.

## Sources

Downloaded again on 2026-10-08; all five SHA-256 hashes agree with those in `sourceVersions`.

- Fargues–Scholze, *Geometrization of the local Langlands correspondence*, author copy, 356 pages: <https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf>, `9ab9efbd…ae905`. Read: IV.1–IV.3 in full; IV.4, statements and the structure of the proof; IV.5–IV.7 in full; V.1, V.2, V.4–V.7 in full and the statements of V.3; VII.1–VII.7 in full; IX.2. Also arXiv:2102.13459v4 for the passage of source issue E6.
- Scholze, *Lectures on Condensed Mathematics*: <https://people.mpim-bonn.mpg.de/scholze/Condensed.pdf>, `d4225612…1c69d`. Read: Theorems 3.2–3.3; Lecture IV with its appendix; Lecture V; the statements of Lectures VI and VII used.
- Scholze–Weinstein, *Berkeley Lectures on p-adic Geometry*: <https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf>, `22550517…bffc`. Read: Theorem 13.5.7; Lemma 16.3.2 and the text around it. Printed pages are ten behind the PDF index.
- Boxer–Calegari–Gee–Pilloni, *Modularity theorems for abelian surfaces*, author copy: <https://math.uchicago.edu/~fcale/papers/Modular.pdf>, `51d7eacc…e95c`. Read: §2.2.1; Remark 2.4.1 and Examples 2.4.2–2.4.3.
- Paškūnas–Quast, *On local Galois deformation rings: generalised reductive groups*, published version: the Cambridge PDF recorded in the packet, `b18abe90…0d93`. Read: Appendix A in full.

## Mistakes in the sources

Each entry was checked at its locator; the packet has my verdict and reason, with the earlier review's verdict kept under `earlierReviews`.

| Issue | Verdict | Remark |
| --- | --- | --- |
| E1, Paškūnas–Quast Lemma A.8, proof | confirmed | Several equations are given a common value in one copy of the ring; and the proof assumes finitely many equations. The lemma is true. |
| E2, Fargues–Scholze Proposition VII.7.10 | confirmed | One sentence names the étale category where the lisse one is meant. Also in arXiv v4. No consequence. |
| E3, Paškūnas–Quast A.1, first paragraph | confirmed | The construction is stated for arbitrary accessible presheaves, for which it does not give a sheaf; every use is for affine schemes, where it does. |
| E4, Fargues–Scholze Remark IV.1.10 | confirmed | The exception should be discrete groups, not finite ones. The point of the remark is unaffected. |
| E5, Paškūnas–Quast Lemma A.5, proof | confirmed | The stage through which the profinite test object factors is never chosen. I note that the quasi-compactness the proof asserts is true under the hypotheses; only the choice is missing. |
| E6, Fargues–Scholze IV.5, pp.152–153 | added, confirmed | The two displays of the annuli exchange the two coordinates. With the second display the two partial-support functors would trade places; the proof of Theorem IV.5.3 uses the first. Same in arXiv v4. Affects nothing, since the theorem is about both ends. |

## API, unit tests, planets, suggested file

Every one of the 31 definitions and constructions has an API outline of five to eight items and at least three unit tests, and I read each with its node. Each has at least one test that a plausible wrong definition fails: the non-quasiseparated classifying stack for the Artin definition, the infinite-dimensional complex on a point for ULA, the origin of the affine line for formal smoothness, the Frobenius sign for the divisor-to-Weil map, the distinct primes for the solid tensor, the infinite sum on a point for the lisse category, and the proper-band tests that the first review added to the two partial-support constructions, which I checked: a section contained in one annular band is a closed immersion whose support lies in all large members of both systems. The thirty planets are definitions, constructions and named theorems, at most six per layer.

The suggested file elaborates in the shared build at the pinned Mathlib (`lean-check`, about two seconds): 38 warnings, all proof placeholders, no errors. It imports only Mathlib, so the newer Tau Ceti checkout of the shared build plays no part. It types six nodes on Mathlib's condensed carriers: solid abelian groups, solidification, the general-ring criterion, quasi-compact and quasi-separated condensed sets, and, added by this review, the clauses of the free-structure theorem and of the lemma on epimorphisms and filtered colimits that can be stated there. The typed signatures are honest: they use the pinned predicate and functors, and the general-ring predicate is the test the Mathlib docstring prescribes.

The other 74 nodes appear in the file as a ledger of omitted signatures, name by name, with their contracts. This is far less Lean than sibling files in the area give, and section 13 of the protocol asks for signatures. I accept it, for this reason: almost every statement of this roadmap is about small v-stacks, their étale and solid coefficient categories, and predicates such as cohomological smoothness and representability in locally spatial diamonds, all owned by roadmaps the libraries do not have. A signature would have to replace those by opaque types and propositions, which section 13 forbids for conditions, or drop the hypotheses, which makes the statement false as written. The six prototype gaps record this layer by layer and are in each stage's `remaining` list, so the signatures become follow-up work when the carriers exist.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/VStackSheavesAndLisseCategories.json --index <pinned declaration index>`: 0 errors, 0 warnings; 80 nodes, 183 API items, 95 unit tests, 30 planets, 39 baseline declarations, 16 gaps, 15 requests.
- `python3 research/blueprint/intake.py check-files` on the deliverables: no problems.
- `lean-check research/blueprint/suggested/VStackSheavesAndLisseCategories.lean`: elaborates, placeholders only.
- A script regenerating every reader section and ledger block from the packet: all agree after the corrections.
- The atlas merge (`scripts/blueprints.py`, `merge_blueprints`) run in memory on `data/atlas.json` with this packet: accepted, 80 declarations and 30 planets, no link skipped for a cycle. Nothing under `data/` was written.

## Questions for the orchestrator

1. **The Weil group and VS1.** `VS1/divisor-weil-map` cites layer 9 of Tau Ceti's ClassFieldTheory roadmap as a prerequisite, with a request. The use is real: the map from the divisor space to the classifying stack of the Weil group is the classifying map of a torsor under that group with its Weil topology. The verifier of finding 31 asked the fix job not to add a layer-9→VS1 link, because VS1 already has ClassFieldTheory as an ancestor and the accepted link map had screened VS1 at search level and judged the candidate weak. When this packet goes live, the prerequisite is drawn as that link. I left the prerequisite, since section 3 of the protocol asks a node to list what it uses, and say so in the packet and reader. Decide whether the drawn link should stay.
2. **VS1→VS3.** Please record the dependency. It is forced by the ownership of VII.5.
3. **Two developments of solid abelian groups.** SolidAnalyticRings SA.1 plans the structure theorems on light condensed sets; VS2 plans them on the pinned Mathlib carrier, by the accepted RS-05. The SolidAnalyticRings definition states the boundary and the only bridge is gap `G-cutoffs`. A restructuring could decide whether one proof, transported along that comparison, should serve both.
4. **Proposition IV.3.7** (Bun_G is formally smooth) is planned by no packet. It belongs to BunGAndNewtonStrata; nothing here depends on it.
5. **Subdivision of VS2.** Read at stage level, a consumer of VS2 depends on the suppliers of all its nodes, which include analytic rings, analytic stacks and cohomologically smooth maps. HabiroRings HR.2 needs only the first proposed sub-layer; applying the subdivision would make that visible.

## Node ledger

The packet's `review.checked` has the same verdicts with fuller notes.

| Node | Layer | Verdict |
| --- | --- | --- |
| `VS0/artin-v-stack-definition` | VS0 | corrected |
| `VS0/enhanced-smooth-descent` | VS0 | verified |
| `VS0/partial-compact-support` | VS0 | corrected |
| `VS0/partial-compactly-supported-vanishing` | VS0 | verified |
| `VS0/point-to-classifying-stack-not-smooth` | VS0 | verified |
| `VS0/shriek-pullback-for-smooth-stacky-maps` | VS0 | verified |
| `VS0/stability-under-fibre-products-and-representable-maps` | VS0 | corrected |
| `VS1/braden-theorem` | VS1 | corrected |
| `VS1/divisor-weil-map` | VS1 | verified |
| `VS1/drinfeld-local-systems` | VS1 | verified |
| `VS1/drinfeld-pullback` | VS1 | verified |
| `VS1/formal-smoothness` | VS1 | corrected |
| `VS1/formal-smoothness-calculus` | VS1 | corrected |
| `VS1/formal-smoothness-examples` | VS1 | added |
| `VS1/geometric-divisor-finite-etale` | VS1 | corrected |
| `VS1/hyperbolic-base-change-duality-and-ula` | VS1 | corrected |
| `VS1/hyperbolic-localization` | VS1 | corrected |
| `VS1/jacobian-criterion` | VS1 | corrected |
| `VS1/kernel-correspondence-category` | VS1 | corrected |
| `VS1/perfect-local-systems` | VS1 | corrected |
| `VS1/perfect-rhom-and-la-characterisation` | VS1 | corrected |
| `VS1/section-functor-and-positive-tangent` | VS1 | corrected |
| `VS1/smooth-spd-oe` | VS1 | verified |
| `VS1/smooth-ula-criterion` | VS1 | corrected |
| `VS1/ula-analytification` | VS1 | verified |
| `VS1/ula-definition-with-constructibility` | VS1 | corrected |
| `VS1/ula-descent-and-smooth-locality` | VS1 | corrected |
| `VS1/ula-dualizability-criterion` | VS1 | verified |
| `VS1/ula-for-artin-v-stacks` | VS1 | verified |
| `VS1/ula-relative-adjoints-and-calculus` | VS1 | verified |
| `VS2/affine-condensed-points` | VS2 | corrected |
| `VS2/breen-deligne-resolution` | VS2 | corrected |
| `VS2/closed-affine-points-quasicompact` | VS2 | corrected |
| `VS2/completed-ula-solid-duality` | VS3 | verified |
| `VS2/condensed-cohomology` | VS2 | verified |
| `VS2/condensed-epis-and-colimits` | VS2 | verified |
| `VS2/condensed-lca-rhom` | VS2 | corrected |
| `VS2/constructible-and-geometric-langlands-embedding` | VS3 | verified |
| `VS2/derived-solid-tensor` | VS2 | verified |
| `VS2/general-ring-solidity` | VS2 | corrected |
| `VS2/nonarchimedean-solid-coefficients` | VS2 | verified |
| `VS2/principal-localization-and-formal-complement` | VS2 | corrected |
| `VS2/proper-smooth-solid-poincare` | VS2 | verified |
| `VS2/qcqs-condensed-sets` | VS2 | corrected |
| `VS2/relative-solid-homology` | VS2 | corrected |
| `VS2/solid-abelian-groups` | VS2 | verified |
| `VS2/solid-four-operations` | VS2 | corrected |
| `VS2/solid-free-structure` | VS2 | verified |
| `VS2/solid-geometric-base-change` | VS2 | corrected |
| `VS2/solid-geometric-base-change-and-drinfeld` | VS4 | corrected |
| `VS2/solid-partial-support` | VS4 | verified |
| `VS2/solid-partial-supported-vanishing` | VS4 | verified |
| `VS2/solid-sheaf-structure-and-completion` | VS2 | corrected |
| `VS2/solid-sheaves-on-v-stacks` | VS2 | corrected |
| `VS2/solidification` | VS2 | verified |
| `VS2/torsion-solid-comparisons` | VS2 | verified |
| `VS2/z-solid-analytification` | VS2 | verified |
| `VS3/lisse-adjoints-and-operations` | VS3 | verified |
| `VS3/lisse-category-definition` | VS3 | verified |
| `VS3/lisse-coefficient-change` | VS3 | corrected |
| `VS3/lisse-comparisons` | VS3 | verified |
| `VS3/lisse-point-semiorthogonal-decomposition` | VS3 | verified |
| `VS4/classifying-stack-equivalence` | VS4 | verified |
| `VS4/compact-generation-and-compact-objects` | VS4 | verified |
| `VS4/contractibility-of-connected-banach-colmez-torsors` | VS4 | corrected |
| `VS4/hn-localization-and-geometric-invariance` | VS4 | verified |
| `VS4/lisse-stratum-left-adjoint` | VS4 | verified |
| `VS4/strata-are-classifying-stacks` | VS4 | verified |
| `VS4/strict-locality-of-the-chart` | VS4 | corrected |
| `VS5/bernstein-zelevinsky-duality` | VS5 | verified |
| `VS5/duality-and-admissibility-coefficient-change` | VS5 | corrected |
| `VS5/lisse-bernstein-zelevinsky-duality` | VS5 | verified |
| `VS5/lisse-kunneth` | VS5 | verified |
| `VS5/lisse-ula-definition` | VS5 | verified |
| `VS5/lisse-ula-equals-admissibility` | VS5 | verified |
| `VS5/lisse-verdier-exchange` | VS5 | corrected |
| `VS5/torsion-bun-homology-and-haar-dualizing` | VS5 | corrected |
| `VS5/torsion-kunneth` | VS5 | corrected |
| `VS5/ula-equals-admissibility` | VS5 | corrected |
| `VS5/verdier-biduality-and-reflexivity` | VS5 | verified |
