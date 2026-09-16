# Handoff: LINK-tauceti_TauCetiRoadmap_ZigzagPreprojective

## Identity, scope and state

- Issue: [#71](https://github.com/CBirkbeck/tauceti-explorer/issues/71).
- Worker: **ChatGPT Pro — cgp-0d58f52c658d**.
- Claim: comment `5696569285`; workflow acceptance `5696570950` explicitly names this session. Ownership was rechecked before submission. The account name alone was not used to establish ownership.
- Branch: `swarm/cgp-0d58f52c658d/link-zigzag-71`.
- Deliverables: `research/blueprint/links/tauceti_TauCetiRoadmap_ZigzagPreprojective.json` and this handoff. No other repository files are changed.
- State: proposed link packet, awaiting atlas-backed validation and independent mathematical review. This is not integration, approval, or formalisation. No issue was closed, released, or marked done.

The packet records **13 incoming prerequisite links, no outgoing links with an existing justified endpoint, and seven overlaps**. The main partners are QuiverRepresentations, RootSystems, GrothendieckEulerForms, DGAInfinity, and StablePeriodicCurved. Four links have explicit textual ownership evidence; nine are inferred matches with the missing adapters stated. No roadmap-wide merger is recommended. Rescope generic bound-quotient/grading interfaces and the Hochschild grading comparison; otherwise keep generic constructions separate from graph-specific calculations.

## Revisions and provenance

The mathematical input revision is `85fa2e92d171967337d6b9538b533c8861e2b6d9` of `CBirkbeck/tauceti-explorer`. The submission branch starts at the refreshed main revision `7821d19ab4fd547181beb46287f8968ec64847d1`. GitHub's commit comparison showed no change to `data/atlas.json`, the mathematical README inputs below, `baseline.json`, the blueprint/expansion protocols, or `scripts/check_links.py` between those revisions. The updated `BROWSER_AGENTS.md` and newly supplied browser atlas README were read at the refreshed revision.

The new files under `research/blueprint/atlas/` are generated extracts, not new roadmap proposals. The target's extract at the refreshed revision has all nine stage descriptions and `stageEdges: []`. The link-packet directory was still absent at that revision; no existing packet was replaced. The original new-roadmap directory lookup was also absent. See the McKay request below rather than inventing an endpoint for a future roadmap.

Input blob identifiers:

| Input | Blob SHA |
| --- | --- |
| `data/atlas.json` | `37f2add06983c206067d1104e0f40a839cc3961a` |
| `content/tau-ceti/ZigzagPreprojective/README.md` | `84f82584d432e1e54d3e1b40a0b8c387c474e092` |
| `content/tau-ceti/DGAInfinity/README.md` | `688b7ef618651aabfd2cd7627199129e03b763c1` |
| `content/tau-ceti/GrothendieckEulerForms/README.md` | `f508d231b5c9b0674a739b942906110e12d6b57e` |
| `content/tau-ceti/RepresentationTheory/QuiverRepresentations/README.md` | `35743b00b30bfc550d6820cfd1da8533b191bfc8` |
| `content/tau-ceti/RepresentationTheory/RootSystems/README.md` | `fc1bff4cd954b0617de509b7ceac8d7a96fa5d08` |
| `content/tau-ceti/StablePeriodicCurved/README.md` | `4c8fea716a9152bbc236d375b750db09a5f1c9aa` |

The atlas records upstream roadmap snapshot `faa5423b925964415cc926802ab206567719d3f4`. The evidence here was read in the Explorer's mirrored README files, not certified by fetching every file from the upstream repository. The direct upstream read attempted at that snapshot was unavailable. Generated implementation/status prose was not treated as proof evidence.

The pinned baseline was read:

- Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.

**Implementation status is unchecked.** No declaration-availability claim is made. No Mathlib or Tau Ceti declaration is certified by a README mention or by a current search result. External references appearing in the roadmaps were not independently proof-audited in this link job; the quotations establish roadmap contracts, not the correctness of every cited theorem.

## Reading and search ledger

Read the target document, conventions, all nine stage descriptions and acceptance boundaries. An input/output worksheet was saved in scratch before constructing links. Read the relevant full supplier layers in DGAInfinity, GrothendieckEulerForms, QuiverRepresentations, RootSystems, and StablePeriodicCurved, and the representation-theory index. Followed the suppliers beyond the first named dependency as described below.

The `examined` array contains 75 records: 60 upstream roadmap records, including the target, and 15 campaign candidates. The notes distinguish full mathematical-stage reads from summary/stage-list screening and the compact-groups index paragraph. Repository-wide searches used the target terms and synonyms, including `zigzag`, `preprojective`, `Ginzburg`, `Koszul`, `Hochschild`, Frobenius, Cartan, and the corresponding supplier names. The new foundations extract was used to distinguish commutative deformation/derived-completion and sheaf-enhancement stages from the target's noncommutative relative-Koszul requirements. RefinedTraceMethods RT.1--RT.3b was checked for the chain/cochain and cyclic-theory boundary.

A `none` entry means that no defensible direct stage pair was found in the specified read/search, not a theorem that the two subjects have no mathematical relationship. The entire campaign was not read line by line. Matching snippets alone were not used to assert a new prerequisite. New designs and packets appearing after the recorded revision require another integration-time deduplication pass.

## Stage input/output worksheet

| Target | Inputs that must be supplied | Outputs owned here |
| --- | --- | --- |
| Layer 0 | Finite-vertex path algebra and product order; numbered finite ADE diagrams; homogeneous two-sided ideal vocabulary | Affine simply-laced diagrams and marks, doubled graphs, homogeneous relation quotients, descended grading, component decomposition |
| Layer 1 | Layer 0 quotient and grading; component decomposition; explicit field/parameter hypotheses | Ordinary/skew zigzag presentations; singleton dual numbers and one-edge exceptions; gauge/isomorphism comparisons |
| Layer 2 | Actual normal-form basis and multiplication; generic Frobenius functional/self-injectivity theorem | Homogeneous basis, radical/socle, dimensions, centers, symmetric trace and its packaging |
| Layer 3 | Quotient-module restriction, projective covers, graded Cartan/K0 and finite-support q-Euler APIs | Vertex projectives and the explicit graded matrix; conditional Euler and completed-series comparisons |
| Layer 4 | Doubled path algebra and two-sided quotient; signs, orientation and opposite conventions | Signed preprojective relation, orientation independence and graph-specific dimension/Koszul results |
| Layer 5 | A single linear-resolution definition, relative dualizable quadratic duality, actual complexes and exactness | Signless quadratic dual, bipartite signed comparison and graph-specific classical Koszulity |
| Layer 6 | Derived tensor and inverse-dualizing bimodule, smooth CY completion, signed Layer 4 relation | Explicit Pi2/Gamma3 presentations, differentials and degree checks; ordinary/completed comparison |
| Layer 7 | Bar/derived-Koszul machinery, actual contraction, normalized Hochschild obstruction theory and grading adapters | Graph-specific derived duality, finite-tree formality/nonformality and higher-operation constructions |
| Layer 8 | Derived tensor/Morita composition, the specified graph algebra and actual duality data | Braid complexes and relations, source-qualified faithfulness, supplied-equivalence transport and spherical comparisons |

## Exact interface locators and recursive closure

All locators refer to the README paths in the input table; layer headings are stable human-readable locators. Every recorded edge additionally has two verbatim quotations with its actual stage IDs in the JSON.

1. **QuiverRepresentations Layers 0--1 to Zigzag Layers 0 and 3.** The carrier is the finitely supported module on paths, with later-factor-first multiplication, a finite sum of vertex idempotents, and left modules. Finiteness of the vertex set supplies the unit and module decomposition. Acyclicity is not required for these constructions and cannot be assumed for a doubled graph. Layer 3's finite-dimensional/admissible-ideal structure theorem is narrower than arbitrary homogeneous relation quotients. R-PATH and R-BOUND are below.
2. **RootSystems Layers 5--6 to Zigzag Layer 0.** Consume valid finite Dynkin types, their finite Cartan matrices and Bourbaki labels. The affine-node deletion theorem must give an actual relabelling. The affine semidefinite form and marks remain target outputs; positive-definite finite classification is not a proof of them. Affine A1's multiplicity-two matrix is not a simple-graph input.
3. **StablePeriodicCurved Layer 0 to Zigzag Layer 2.** Consume the nondegenerate Frobenius-functional definition and self-injectivity theorem. Its general exact-category machinery uses the exact-structure supplier in GrothendieckEulerForms; the algebraic functional theorem must not depend on this particular graph example. Package the already proved trace and transport right/left dual conventions explicitly. StablePeriodicCurved Layer 2 is a later generic stable-module application, not an input to the trace calculation.
4. **GrothendieckEulerForms Layers 3--6 to Zigzag Layers 3 and 5.** Layer 6 depends on graded exact K0 (Layer 2), resolutions (Layer 3), projective/simple and Cartan data (Layer 4), and long-exact-sequence finite-support Euler descent (Layer 5). The target verifies split/projective-cover and support assumptions on its actual modules. Both cohomological and internal support are required. Neither self-injectivity nor finite-dimensionality supplies finite global dimension. The linear-resolution definition is shared with DGAInfinity Layer 11; see R-KOSZUL.
5. **DGAInfinity Layer 11 to Zigzag Layers 5 and 7.** The quadratic input is a dualizable arrow bimodule over the finite separable semisimple base S=k^I, with order-reversing evaluation/opposite conventions. The derived branch recursively uses the split augmentation, conilpotence, K-flat/cofibrant replacements and local finiteness from Layer 4, rather than erasing those assumptions inside RHom notation. Generic linear resolutions come from GrothendieckEulerForms Layer 3. The target proves its signless annihilator relation, bipartite rescaling, small-graph exceptions and actual Koszul exactness.
6. **DGAInfinity Layers 3 and 8 to Zigzag Layer 7.** Transfer requires actual maps i,p,h with pi=1 and 1-ip=dh+hd; normalized side conditions are supplied or proved. Fixed-arity tree sums exclude unary differential vertices. Units and the semisimple base need compatible splitting. Normalized arity-complete Hochschild cochains and braces work with the relevant arbitrary-characteristic hypotheses; exponential gauge requires the supplier's rational-base hypothesis. The target still needs the named grading/HH adapter R-HH.
7. **DGAInfinity Layer 9 to Zigzag Layer 6.** The generic completion is the derived tensor algebra on a shifted inverse-dualizing bimodule under homological smoothness. Twisting by a Hochschild class and obtaining a canonical CY structure from a negative-cyclic lift are distinct inputs. Neither properness nor a Serre identification follows just from smooth/left CY. The target supplies the comparison with the explicit presentation, potential class and signs. Ordinary tensor algebras and length completions remain separate.
8. **DGAInfinity Layer 6 to Zigzag Layer 8.** Transport uses the Morita bicategory's derived tensor, actual inverse bimodules and coherence, ultimately the supplier's module/replacement and derived-category constructions. Compact generation is a shifted-Hom condition, not density on K0. A supplied equivalence does not construct a McKay equivalence or establish braid faithfulness.

At the refreshed input the target extract has no existing incident stage edge. Every proposed edge enters a target stage and none leaves one. Therefore these additions cannot create a directed cycle with the recorded old graph: a new cycle would have to leave one of these previously isolated sink stages. This is a manual graph argument, not a substitute for running the stitched-graph validator after other submissions land.

## Precise unresolved repairs and ownership requests

### R-PATH: include vertex idempotents among generators

QuiverRepresentations Layer 0 says arrows alone generate the path algebra as a k-algebra. This is false for two isolated vertices: the path algebra is k x k; the unital k-subalgebra generated by the empty arrow set is the diagonal copy of k, which does not contain (1,0). Replace that assertion by generation by vertex idempotents together with arrows. The recorded link uses the valid path carrier/product and idempotent interface, not this false assertion. No supplier file was edited.

### R-BOUND: prove the quotient-restriction square

The unbound equivalence does not by itself identify modules over kQ/I. Construct the full subcategory of representations on which I acts by zero; show equivalence with modules over the quotient, and prove compatibility with restriction to kQ, the vertex decomposition, grading shifts and the target projectives. Keep the finite-dimensional admissible-ideal theorem in QuiverRepresentations; coordinate the all-homogeneous-relation interface with Zigzag Layer 0. Check I=0, an actual doubled-graph relation ideal, the A2 cubic presentation and the singleton exception separately.

### R-CARTAN: resolve the transpose explicitly

QuiverRepresentations Layer 3 indexes its Cartan matrix by C_ij=[P_i:S_j]; GrothendieckEulerForms Layer 4 uses C_ij=[P_j:S_i], with the j-th projective as a column. Give an entrywise transpose theorem, then the graded version with the adopted shifts and duality convention. The symmetric zigzag matrix does not test the distinction: also use a nonsymmetric finite acyclic quiver. Do not infer unimodularity for all finite-dimensional self-injective algebras.

### R-KOSZUL: do not import a numerical converse

GrothendieckEulerForms Layer 3 groups linear resolutions/diagonal Ext with a Cartan--Poincare inverse identity as elementary equivalences. The numerical converse has not been justified by this work. Only the linear-resolution vocabulary and the appropriately stated diagonal-Ext comparison are requested. Zigzag must construct the relevant complex and prove exactness; an inverse Hilbert-series identity is not being accepted here as a certificate of Koszulity. Ask the supplier to separate the proved implication from any stronger converse and state its hypotheses.

### R-HH: state the grading and cohomology comparison

DGAInfinity Layer 8 uses the sufficient criterion HH^{n,2-n}=0 for n>=3. Zigzag Layer 7 uses HH^{2,q} in positive Adams degree after a derived-Koszul comparison. Supply a named regrading/totalization dictionary, the actual Hochschild comparison and its characteristic/completeness conditions before using one criterion as the other. The packet does not invent a formula for this change of indices. Retain minimality, formality, intrinsic formality and nontriviality up to the specified equivalence as distinct statements.

### R-CY and R-STABLE: keep three comparisons distinct

DGAInfinity owns abstract completions and left/right CY predicates; Zigzag owns Pi2/Gamma3 and their presentation comparisons; StablePeriodicCurved owns generic Frobenius/stable triangulation and any source-qualified finite-Dynkin application. A smooth bimodule CY statement is not by itself a stable-category or proper Serre theorem. Pi2 has degree -1 loops, Gamma3 degree -2 loops, and length completion changes the object. Supply every negative-cyclic lift, preservation-of-perfectness, Frobenius/triangulated and spherical-duality hypothesis used by the chosen consequence. No generic supplier should depend on the graph example it later instantiates.

### R-MCKAY: await a real consumer endpoint

The target explicitly exports affine diagrams, zigzag/skew comparisons and braid-action transport to a downstream McKay roadmap. No justified existing McKay stage ID was available in the recorded input. Do not add a fabricated target or mark the representation-theoretic equivalence supplied by Zigzag. Once the design is integrated, check its actual statements and add the most specific outgoing links; the present zero-outgoing count is not a claim that the target has no future consumers.

## Validation and remaining handoff

Locally executed in worker scratch:

```text
python3 -m json.tool research/blueprint/links/tauceti_TauCetiRoadmap_ZigzagPreprojective.json
python3 scratch/preflight.py
```

The JSON syntax and custom preflight passed. That preflight checked required local fields, unique directed pairs, ownership, evidence endpoints/lengths, overlap recommendations, unique examined records, private-path screening and acyclicity of the proposed-edge subgraph. It did not substitute for atlas endpoint lookup, verbatim quote matching, all-other-packet duplication or the full stitched graph.

The official command is:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_ZigzagPreprojective.json
```

It was not run locally: the local environment could not retrieve the repository/atlas inputs over the network. The official checker source and PR workflow were read through the GitHub connector. At the time this handoff was first written, PR CI had not yet run. The submission comment and subsequent validation comment must give the observed CI result, not a prediction; inspect the actual checker output rather than only a green workflow badge. No Lean build or mathematical-correctness validator is claimed.

Integration requires independent review of edge direction, supplier sufficiency and the requests above; a final check against newly landed packets/designs; and the actual atlas-backed validator output. Preserve every stage identifier. Only the maintainer/orchestrator should integrate or mark the job done.
