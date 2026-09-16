# Partial handoff: quiver-representation stage links

Worker: **ChatGPT Pro — cgp-e0de6ed408a1**  
Job: `LINK-tauceti_TauCetiRoadmap_RepresentationTheory_QuiverRepresentations`  
Issue: [#63](https://github.com/CBirkbeck/tauceti-explorer/issues/63)  
Status: **partial catalogue-wide checkpoint; not a completed job**. Implementation status: **unchecked**.

## Ownership and revisions

Claim comment: [5696769436](https://github.com/CBirkbeck/tauceti-explorer/issues/63#issuecomment-5696769436). The workflow accepted this exact session in [5696771324](https://github.com/CBirkbeck/tauceti-explorer/issues/63#issuecomment-5696771324). Both were reread before submission; no competing confirmation appeared. Claims under the same GitHub account were not treated as ours.

The only repository deliverables are the matching JSON under `research/blueprint/links/` and this handoff. Branch: `cgp-e0de6ed408a1/link-quiver-representations`, created through the authorised connector at `28a4580b9ac7d536b360fc7742e838415f4e347e`. No git commands, default-branch writes, merges, approvals, issue closures, queue edits or state:done changes were made by this worker. Submission does not imply independent approval. Do not unclaim the submitted result merely to start another job.

Research/input commit: `49f74b4d2bace99a76ceff4ac2199a3384c83c57`. Refreshes: `b82b494ac1b384423eacc1276c6716f15e186b6d`, then the submission base above. Commit comparisons showed no changes to the mathematical README inputs, atlas or baseline. Changes included browser-readable atlas extracts, new research packets, and browser/protocol/checker infrastructure; the revised browser rules and links protocol were read.

| Input | Blob or revision |
| --- | --- |
| Atlas | `37f2add06983c206067d1104e0f40a839cc3961a` |
| Atlas upstream snapshot | `faa5423b925964415cc926802ab206567719d3f4` |
| Baseline file | `fdb00afdfae8e5728e070f310f5a880707764bc2` |
| Mathlib baseline | `082e2d37e8b0463410cdb532e111cd43d5a66174` |
| Tau Ceti baseline | `f790474821cf4256814db967cb154e7af3d0c369` |
| Refreshed browser rules | `e4854be9cb94f4e9fe6f4ac76a5468f56c53d3a0` |
| Refreshed blueprint protocol | `41099c03ea64d701d05b1277a83141ef9d4868db` |
| Upstream guide | `a767747585bba9a7c57ff365e02a574f04cfec71` |
| Expansion protocol | `c763c69dd1a81f4ded9843c714f8b32c9c4cf854` |
| Refreshed link validator | `88135efe5a74ef82e088f3fa3189893e27a7867a` |

## Sources actually inspected

All mathematical locators refer to `content/tau-ceti/` at the input commit, not moving documentation. Line numbers are README source lines, not connector display lines. Full upstream root paths are in the JSON `coverage.fullNearbyReadmes` and each endpoint's roadmap ID.

| README | Blob | Reading and locators |
| --- | --- | --- |
| `RepresentationTheory/QuiverRepresentations` | `35743b00b30bfc550d6820cfd1da8533b191bfc8` | Full README and all seven stage descriptions. Layers 0--6 begin at 206, 229, 249, 270, 311, 348, 385; examples 420 onward; ordering 455 onward. |
| `RepresentationTheory/RootSystems` | `fc1bff4cd954b0617de509b7ceac8d7a96fa5d08` | Full README; Layer 1 positive roots/height lowering; Layer 5 finite-type Cartan classification; finite-root and coefficient hypotheses. |
| `RepresentationTheory/SemisimpleAlgebras` | `b3c2cd79ce71390845b96e353ae3871ef1768aea` | Full README; Layer 0 radical support (169--185), Layer 2 Wedderburn (212--232), general-field versus split cases. |
| `GrothendieckEulerForms` | `f508d231b5c9b0674a739b942906110e12d6b57e` | Full README; Layer 4 (331--382), Layer 5 (383--436), conventions and A2 example (516--548). |
| `ZigzagPreprojective` | `84f82584d432e1e54d3e1b40a0b8c387c474e092` | Full README; Layer 0 doubled-graph quotients; Layer 3 graded projectives/Cartan; small-graph and finite-support boundaries. |
| `StablePeriodicCurved` | `4c8fea716a9152bbc236d375b750db09a5f1c9aa` | Boundary/conventions 25--107; full Layers 0--2, 154--273. Not the entire README. |
| `DGAInfinity` | `688b7ef618651aabfd2cd7627199129e03b763c1` | Intro/conventions 1--105; full Layers 3, 7, 8--11; relevant acceptance paragraphs. Layer 3: 353--393; Layer 7: 490--519; Layer 10: 597--628; Layer 11: 629--674; transfer example under 717--749; quotient example 782--791; quadratic checks 792--802. Not the entire README. |
| `HodgeStructures` | `2e06a385b7a0a2a02c15cddc729b7702783b6011` | Intro/scope 1--44 for a negative scope decision, not historical library-absence assertions. |

The atlas was read through its Git blob endpoint after the large-file reader failed. For continuation prefer `research/blueprint/atlas/`; its new extracts contain the same atlas records. The older `data/roadmap-summaries.json` is not the full 212-roadmap catalogue.

Evidence checks roadmap promises and uses. No private books were accessed. External literature cited by these READMEs was not independently verified just by reading its citations. No historical claim that a library declaration is landed or absent is adopted as a pinned-baseline verification. Pins were read, but declaration availability was not certified.

## Seven-stage input/output checkpoint

Q0 takes paths/concatenation and a finite vertex set for its unit; it supplies a path basis and orthogonal idempotents. Finite-arrow acyclicity supplies finite-dimensionality, not the existence of a path algebra. Q1 uses the idempotent decomposition to identify representations with left modules; vertex projectives start at their indexed vertex. Quotient and graded transports need bridges.

Q2 supplies finite-length Krull--Schmidt via Fitting decomposition and local endomorphism rings, with finite nonzero indecomposable summands. Q3 uses the radical quotient, Wedderburn and semiperfectness to supply covers/envelopes, multiplicity Cartan matrices, basic Morita reduction and admissible presentations. Each split/algebraically-closed hypothesis stays on the result needing it.

Q4 supplies dimension vectors and integral Ringel/Tits forms; finite acyclic quivers give the length-one resolution and Hom-minus-Ext1 identity. BGP formulas retain sink/source and no-killed-simple restrictions. Q5 adds a finite connected quiver, algebraically closed representation field, Q2/Q4 and finite ADE root data; quiver theory must prove admissible descent, bricks and uniqueness. Q6 uses finite-dimensional modules, minimal presentations, duality and additive stable/costable quotients for transpose/translate, almost-split theory and the AR quiver; it does not automatically produce a Frobenius triangulation.

## Links and duplicate suppression

The JSON has **12 new proposed links: four incoming and eight outgoing**, all conservatively `inferred`; one-sided citations are not treated as two-sided explicit endorsements. Each pair has output/use quotes. These are interfaces, not implementation certificates.

Incoming: SemisimpleAlgebras Layer 2 to Q3; RootSystems Layers 1 and 5 to Q5; the generic additive-ideal part of StablePeriodicCurved Layer 0 to Q6.

Outgoing: Q2/Q3 to GrothendieckEulerForms Layer 4 and Q4 to its Layer 5; Q3 to Zigzag Layer 3; Q0 to DGAInfinity Layer 11, Q1 to its Layer 7, Q3 to its Layer 3, and Q4 to its Layer 10. Q3-to-DG3 and Q1-to-DG7 apply to the named acceptance examples, not every generic transfer/localization theorem.

The Zigzag packet landed during this run, from PR #463: blob `5e65d8ae7fb32b7898891cd85ba8b08dd8c02b22` at the submission base. It already records Q0 to Zigzag0 and Q1 to Zigzag3. Both were removed from our links and retained in `alreadyRecorded`. Its Q3 references are overlaps, not a directed Q3-to-Zigzag3 link. Do not overwrite that packet.

The **one new overlap** is SemisimpleAlgebras Layer 0 versus Q3 for finite-dimensional radical cleanup. **Rescope**, rather than merge entire roadmaps: assign common nilpotence/semisimple-quotient support to SemisimpleAlgebras and primitive idempotents, semiperfectness, covers and admissible presentations to Q3. Ownership is unsettled, so the duplicated block is not also asserted as a directed edge. Optional generality must not block the finite-dimensional support package.

## Repair requests and mathematical boundaries

The six stable JSON request IDs are Q-LINK-REQ-01 through Q-LINK-REQ-06.

**Path generation.** Vertex idempotents together with arrows generate the unital path algebra. Arrows alone do not: two isolated vertices give k x k, whereas the scalar-generated subalgebra is diagonal. Include the vertex algebra in the tensor/path comparison.

**Cartan conventions.** For left modules on 1 -> 2, P1 has vector (1,1), P2 has (0,1). Thus rows-projectives C_Q=[[1,1],[0,1]] and columns-projectives C_G=C_Q^T=[[1,0],[1,1]]. The Ringel matrix E=[[1,-1],[0,1]] satisfies C_G^T E=I and E+E^T=[[2,-1],[-1,2]]. The last is the root Cartan matrix, not either composition matrix. Repair the quiver worked-example identification and prove the GEF transpose bridge. Over nonsplitting fields keep dim_k End(S_i) in the multiplicity/Hom comparison.

**Root scope/descent.** Finite ADE RootPairings do not realize all indefinite/affine Tits forms. Separate integral vertex reflections from finite-root realizations. Generic height lowering is not an orientation-compatible sink-admissible BGP sequence. Q5 must prove that bridge, and Coxeter iteration must exclude each killed simple summand. Indecomposable does not mean brick in general.

**Stable quotient.** The additive factoring-ideal quotient is usable without self-injectivity; finite-biproduct closure combines sums of projective factorizations into one. Triangulation requires the separate Frobenius exact-category theorem. Export the generic quotient separately, and translate right-module instances through the opposite algebra for left modules.

**Doubled/graded scope.** Doubled quivers have oriented cycles. The finite-dimensional zigzag quotient is proved finite-dimensional by its own relations/basis, not acyclicity. Arbitrary preprojective quotients need not be finite-dimensional or fit the admissible-presentation theorem. Graded covers, shift conventions and the quotient-representation restriction square remain explicit bridges; no hereditary Ext vanishing is imported for self-injective zigzag algebras.

**DG examples.** For the four-vertex oriented line, J^4=0 and the length-three relation ideal lies in J^2. Forming that admissible quotient needs no algebraic-closedness assumption; DGAInfinity still constructs its resolution and transferred higher operation. The three-vertex quotient example consumes the vertex projective, not a DG quotient from quiver theory. Relative quadratic duality retains finite projectivity, semisimple-base separability, sidedness and degree conventions.

## Coverage and remaining work

There are **67 deliberately recorded roadmap decisions: all 60 upstream entries (including this roadmap and four completed entries), plus seven campaign candidates**. Notes distinguish full reads, full candidate-stage reads, selected passages and summary/stage-list screens. Four nearby upstream READMEs were read fully in addition to the target. A summary screen is not a proof audit; `none` is a search result, not proved nondependence.

The JSON records actual object-search windows. Searches distinguish quivers, covers and Krull--Schmidt from Krull topology/dimension, Auslander--Buchsbaum, projective representations, projective geometry and generic enhanced Morita invariance. The upstream screen is finished; the campaign-wide sweep is not.

Continuation must finish campaign-wide Cartan/Euler/Ext, Morita and stable-quotient matches outside the inspected portions, reading both complete stage descriptions for every new candidate. Finish neighboring campaign summaries; the foundations extract was read only through early EnhancedDerivedSheaves.

Read `research/blueprint/roadmaps/MordellLawrenceVenkatesh.json` and later new roadmaps. Inspect all current link packets for duplicate pairs/cycles, including new StandardDistributions, UniversalCovers, AdicSpaces and OrthogonalL2Bases files. Zigzag quiver endpoints were already reconciled. Check issue #64 and the separate RootSystems worker cgp-3dc7b31740c5 before integration; retain one copy of shared root edges and do not release that claim.

Run the full validator, resolve every error and obtain independent mathematical review. Continue the same authorised file, not a competing packet. The orchestrator can assign continuation after this checkpoint; this worker has not reserved another job.

## Validation record

Uploaded JSON commit: `5a27129073d453dda713886ab632d73613de12d7`; blob: `06902c9a285bfd281b9adf0b03443261c97244ac`. The uploaded blob was compared with the locally checked final bytes and matches exactly. SHA-256: `91978785257c6264af75b237ec5da4942aaa7d237ff9992b6dc3df06924a2568`.

Actually run on the final 12-link packet:

```sh
python3 -c 'import json; json.load(open("research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_QuiverRepresentations.json"))'
python3 scratch/check_packet.py
```

Both passed. The custom check covered fields/enums, unique pairs, both evidence sides/minimum quote length, a cycle check **within this packet only**, 67 unique examined IDs including 60 upstream, six request IDs, two omitted existing links, private-path scanning, and the A2 identities. It did not compare quotes to the full atlas or check cycles involving all other packets. Scratch scripts are not additional repository deliverables.

Required but **not run locally**:

```sh
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_QuiverRepresentations.json
```

The execution environment could not resolve the repository download host. The connector could read the atlas but did not mount it locally. The PR workflow is the available full-check route: inspect actual checker output, not merely its badge. This is the pre-CI record; any validation addendum must identify the actual run, commit and result.

No Lean build, axiom audit, independent review or implementation completion is claimed. Keep `status: partial` until the catalogue-wide remainder is genuinely finished.
