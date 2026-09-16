# LINK-tauceti_TauCetiRoadmap_UniversalCovers — partial handoff

**Worker:** ChatGPT Pro — cgp-f522e092da3e  
**Issue:** #70  
**Status:** partial submission; catalogue-wide screening is unfinished. Do not mark this job done or treat this packet as an exhaustive inventory. No Lean implementation is claimed.

## Claim and files

The session's `/claim` is issue comment 5696547150. GitHub Actions confirmed this exact session in comment 5696548562. Both comments and the `state:claimed` label were re-read before submission. No competing claim was present. No other job was claimed.

Authorized files produced:

- `research/blueprint/links/tauceti_TauCetiRoadmap_UniversalCovers.json`
- `research/blueprint/handoff/LINK-tauceti_TauCetiRoadmap_UniversalCovers.md`

Submission uses an isolated branch containing the session identifier and a draft PR. The default branch, queue, ledger, reserved IDs, other packets, roadmap documents and application code were not edited. No git commands were run. Integration and any reassignment remain with the maintainer; do not release a submitted claim merely to take another job.

## Revisions and provenance

Input repository revision: `85fa2e92d171967337d6b9538b533c8861e2b6d9`.
Submission branch base: `7821d19ab4fd547181beb46287f8968ec64847d1`.
GitHub's commit comparison between them showed no changes to `data/atlas.json`, the cited `content/` documents, `baseline.json`, or `scripts/check_links.py`. It did show new browser-sized atlas extracts and revised browser instructions; both were read before submission. No existing link directory/output or competing UniversalCovers PR was found at the submission check.

Baseline read from `research/blueprint/baseline.json`:

- Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
- Baseline file blob: `fdb00afdfae8e5728e070f310f5a880707764bc2`.

The atlas blob is `37f2add06983c206067d1104e0f40a839cc3961a`. The smaller focal extract, read at the submission base, is `research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_UniversalCovers.json`, blob `5afb37ba4e56b5835f7ac5573b55fbbb99eaa6f1`. It confirms all five stage IDs and `stageEdges: []` for the focal roadmap. The atlas's imported upstream-document snapshot is distinct from the library baseline; do not conflate them.

All four required protocols were read. The updated browser-instructions blob is `75ae064dee2fdbf87c7331475520ce445604788d`. The blueprint protocol blob is `7bfc37011027b62f1976c3ff1fd88fc8c9b83cb3`; upstream guide `a767747585bba9a7c57ff365e02a574f04cfec71`; expansion protocol `c763c69dd1a81f4ded9843c714f8b32c9c4cf854`.

**Library verification boundary:** no declaration source was independently checked at either library pin. Quotations of roadmap inventories establish intended scope, not actual availability in those libraries. No absence claim or implementation-completion claim is made.

## Result and direction

The packet contains **11 outgoing links**, **8 explicit and 3 inferred**: two to AlgebraicTopology, seven to BelyiMaps, and two to LieGroups. No incoming link has been established. There are three `rescope` overlap proposals. All endpoints use actual atlas stage IDs, not invented finer-grained IDs; milestone locators in the reasons identify the narrower mathematical contracts.

The most consequential findings are:

1. **Belyi 5.5 names the wrong van Kampen supplier.** Its required canonical fundamental-group pushout belongs to AlgebraicTopology Stage 1; UniversalCovers has no van Kampen stage. The correction is a request below, not an illicit non-focal edge in this packet.
2. **Belyi assumes a deck/opposite-group convention that UniversalCovers has not fixed.** Reconcile the actual maps and action laws before implementing associated covers or centralizer comparisons.
3. **Belyi 7.1 needs generic cover classification over the punctured disc.** Its earlier triple classification is specific to the thrice-punctured sphere and cannot just be transported to a different base.

## Focal stage input/output checklist

- **Stage 0:** under path-connectedness, local path-connectedness and semilocal simple connectivity, construct the based-path quotient universal cover, its projection and local sheets, the fundamental-group action and deck-group carrier. Discrete fibres do not imply a discrete total space. Generic path/homotopy lifting is a library prerequisite named by the roadmap, not newly verified here.
- **Stage 1:** identify deck transformations with the fundamental group or its opposite, with explicit left/right action and composition conventions. Preserve map-level compatibility, not just an abstract group isomorphism.
- **Stage 2:** use the lifting criterion; construct the pointed cover of a subgroup, prove recovery of that subgroup and its conjugation law under basepoint change; classify pointed versus unpointed covers; prove normalizer/deck and regularity results. The optional monodromy route requires its own generic associated-cover API.
- **Stage 3:** supply absolute cubical homotopy functoriality, pointed maps and basepoint change, then invariance of higher homotopy groups under coverings for degrees at least two. Boundary-relative homotopies of cube representatives are not the relative homotopy groups of arbitrary based pairs.
- **Stage 4:** derive circle/torus/projective-space examples and recognize aspherical `K(G,1)` spaces when a suitable weakly contractible universal cover is already available. It does not construct `BG` for arbitrary groups.

## Cross-roadmap requests and precise remaining contracts

### R1. BelyiMaps Layer 5.5 / AlgebraicTopology Stage 1

Replace the UniversalCovers attribution of van Kampen by the groupoid/canonical-pushout supplier in AlgebraicTopology. The consumer needs the **canonical induced map**, its bijectivity and compatibility with the named generators, not a noncanonical abstract equivalence with a free group. Confirm that the connected intersection/basepoint hypotheses and the concrete punctured-plane open cover instantiate that theorem. This requested edge has neither endpoint in UniversalCovers, so it is intentionally not included in this job's links.

### R2. UniversalCovers Stage 1 / BelyiMaps Layers 6.2 and 6.4

Pin the deck multiplication and the fundamental-group multiplication, then state the actual comparison homomorphism. Belyi 6.2 writes a right action and the diagonal action `(u,s) -> (u gamma^-1, gamma s)`, and 6.4 absorbs an opposite group when comparing deck transformations with a centralizer. Do not remove inverses by appealing to the abelian circle example: the thrice-punctured-sphere group is noncommutative. Belyi's assertions about the library's multiplication convention were not independently checked at the pin in this link job.

### R3. UniversalCovers Stage 2 / BelyiMaps Layer 7.1

Use the **generic** connected-cover/subgroup classification over the punctured disc, together with its fundamental group `Z`, the index-`e` subgroup calculation, and the positive local power-map model `z -> z^e`, with `e >= 1` and finite fibres. Belyi Layer 6.3 classifies covers of `C minus {0,1}` by triples; its target base cannot simply be changed to the punctured disc. The explicit new edge is marked inferred for this reason. Retain the current Layer 7 atlas ID even though its prose assigns work to an intended successor roadmap.

### R4. Generic associated covers

Belyi 6.2 already calls this an unresolved UniversalCovers supplier contract. Make the intended allocation explicit in UniversalCovers Stage 2: arbitrary discrete fundamental-group sets, quotient topology, the projection-to-base covering theorem, fibre identification, monodromy with conventions, functoriality, coproducts and orbit/component comparison. Keep the finite numbered/pointed/unnumbered triple specializations in Belyi or its declared successor. The quotient map from the product to the associated cover and the associated-cover projection to the base are different maps; proving the former is a covering does not prove the latter.

### R5. LieGroups Layer 5 ordering

Reuse the generic topological cover and unique lifting from UniversalCovers, but let LieGroups own the lifted group operations, their laws, transported smooth structure, Lie-algebra comparison and discrete central kernel. For a connected finite-dimensional real Lie group, discharge all base-space hypotheses rather than dropping connectedness. Split the early covering-group construction, which Layer 4's Lie III proof uses, from the later integration/descent refinement, which itself uses Layer 4. A whole-layer ordering would conceal a dependency cycle. A merely topological covering is not a smooth local diffeomorphism for arbitrary independently chosen smooth structures.

### R6. Absolute versus relative homotopy

AlgebraicTopology Stage 8 explicitly consumes UniversalCovers' absolute induced-map/basepoint API but repeats parts of that API in its extension to pairs. Keep absolute cubical operations in UniversalCovers Stage 3; keep relative groups of based pairs, their low-degree pointed-set distinctions, connecting maps, Kan comparison and Hurewicz--Whitehead in AlgebraicTopology. This is a local scope split, not a proposed merge of the entire roadmaps.

### R7. FuchsianOrbifolds and other undecided candidates

The Fuchsian ownership paragraph names UniversalCovers, but a precise extra stage-level dependency has not yet been established. Coarse quotients with elliptic stabilizers are branched, and removing fixed points can destroy simple connectivity. Find the exact torsion-free or deck-group contract before adding an ordinary universal-cover edge. Similarly, an algebraic Spin double cover or an étale fundamental group is not automatically a dependency on ordinary covering spaces.

## Source reading audit

Repository documents were the primary evidence for this **link** job. All quotes in the packet are from documents at the input revision; their exact source/target locators appear in the reasons. Public textbooks cited inside those roadmaps were not independently read here, and this handoff does not certify their theorem locators.

| Document | Material actually read | Source blob or locator |
| --- | --- | --- |
| `content/tau-ceti/UniversalCovers/README.md` | Full README and every stage; re-read Stage 1--4 conventions and exact quotes | `71820e8ece13eff8ccac06fc1a340ced18f6f55e` |
| `content/tau-ceti/AlgebraicTopology/README.md` | Full README, ownership, Stages 1--8 and reference tail | `f569dfdd78e0f2137f663cd63cd032608090864` |
| `content/tau-ceti/BelyiMaps/README.md` | Opening ownership/merge boundaries; all Layers 5--7, including prerequisites and API outlines; not the entire long programme | `5c818fb6124600633f4d2e9ccec4ea29ce08fded`; Layers 5.1--5.7, 6.1--6.5, 7.1--7.5 |
| `content/tau-ceti/FuchsianOrbifolds/README.md` | Full README, standing conventions, Layers 0--6 and reference tail | `94bf71cf339fb3b71fd0bd72b00475ba542675c3` |
| `content/tau-ceti/RepresentationTheory/LieGroups/README.md` | Standing hypotheses and relevant Lie III/covering portions; complete Layer 5 stage description | Layer 4 / Layer 5 |
| `content/tau-ceti/RepresentationTheory/SpinRepresentations/README.md` | Introduction and standing conventions; discovered but did not fully inspect later real-form/simple-connectivity stages | Opening section; real-form candidate unfinished |
| `content/campaign/StableHomotopyKTheory/README.md` | Full campaign README, especially H.1 and H.2; integrated decomposition not yet inspected | `7cdccbd3ab31ffc3d417b6221140662eeeee660d` |

Indexed repository searches used `UniversalCovers`, `"universal cover"`, `"deck"` and `"fundamental group"`, with result-path inspection and full document fetches for accepted links. Search results were discovery aids and could reflect another revision. The atlas was read/searchable through the Git blob endpoint, but not downloaded as a complete local file. Selected neighbouring/upstream summaries were screened; this is **not** an exhaustive negative search and does not satisfy the issue's full catalogue requirement yet.

## Resume checklist — unfinished acceptance work

1. Use the newly available `research/blueprint/atlas/index.json`, `areas/*.json`, `roadmaps/*.json` and `stage-edges.json` instead of fighting the 14 MB contents-API limit. Verify their source against the unchanged atlas and use a complete local checkout or reconstructed complete dataset for global checks.
2. Complete a documented screen of **every upstream Tau Ceti roadmap**, all same-area roadmaps and neighbouring-area summaries. The seven focused `examined` entries are not the full required catalogue. Same-area work still needs detailed checks of GeometricTopology, HopfRinow, HeegaardFloer and CombinatorialHeegaardFloer, rather than their summary-level screening alone.
3. Inspect ConformalMapping, the real Spin stages, and the integrated StableHomotopyKTheory decomposition. For `BG`, distinguish construction from UniversalCovers Stage 4's recognition theorem and identify the actual `EG -> BG` proof route before creating an edge.
4. Resolve discovered campaign candidates at their actual stage contracts: InverseGaloisAndArithmeticFundamentalGroups, ShimuraVarieties, topological/étale comparison in the relevant cohomology roadmaps, and any other hits from a complete alias search. Treat diamond/étale/algebraic covers separately from classical topological covers. Check both inputs and outputs, not just outward uses.
5. Add only accepted exact pairs with both endpoint quotations, record every additionally read roadmap in `examined`, and check other packets that may have appeared since this checkpoint. Do not turn a search miss into an absence proof.
6. Re-run the official validator against the complete world and inspect its output. Resolve R1--R7 or preserve them explicitly in the appropriate future blueprints. Request independent mathematical review before integration.

## Validation

The official validator source was read: `scripts/check_links.py`, blob `2495f36d368045ae9d52236644d45acc5f8b89b6`. Its checks include known IDs, both endpoint quotes, exact whitespace-normalized quote matching, duplicates, cycles and overlap schema. It does **not** prove mathematical correctness or exhaustive catalogue coverage.

Local commands run on the actual output:

```text
python3 scratch/finalise.py
python3 -m json.tool research/blueprint/links/tauceti_TauCetiRoadmap_UniversalCovers.json
python3 scratch/check_packet.py
```

The JSON parse and local packet-consistency checks pass: 11 unique focal-outward edges, 8 explicit / 3 inferred, evidence on both sides, three scope proposals, and no cycle within the proposed packet. These are limited checks, not the repository validator.

The official command was **not run locally**, because no complete local atlas/world was obtained. Do not substitute a hand-built subset and call it a full validation:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_UniversalCovers.json
```

The unchanged `swarm-check.yml` PR workflow invokes that command on changed link files with the full checkout. At the moment this handoff was written, CI had not yet run; inspect the PR's actual check result/log and the submission comment for the later result. A successful structural check still leaves the catalogue-completeness and mathematical-review work above unfinished.
