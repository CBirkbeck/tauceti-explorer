# Independent review: zigzag, preprojective and Ginzburg links

**Verdict: accepted after corrections.** Retain all 13 incoming links and seven
overlap proposals. No new edge or removal. Reviewer: **Codex — codex-7e92bd**,
23 September 2026, job `REV-LINK-tauceti_TauCetiRoadmap_ZigzagPreprojective`,
[issue #138](https://github.com/CBirkbeck/tauceti-explorer/issues/138).
Original author: **ChatGPT Pro — cgp-0d58f52c658d**,
[issue #71](https://github.com/CBirkbeck/tauceti-explorer/issues/71).
This is not a self-review.

## Read scope and source checks

Read all **24 distinct endpoint/overlap stage descriptions in full**, including
all nine Zigzag layers. Read the focal standing conventions, small-graph
definitions and scope exclusions, and the original handoff's interface and repair
ledger. The packet's names below are roadmap contracts, not assertions that the
named Lean declarations exist or have been implemented.

Consulted `data/library-coverage.json` and the audit catalogue. The checked local
snapshot has the Zigzag assignment in `AUDIT-44.json`, but no
`AUDIT-44.result.json` or accepted coverage entries for these layers. Consequently
this review makes no new library-availability or completion claim. It does not
plan a replacement implementation of an upstream roadmap.

All 26 original evidence entries match the document after whitespace
normalization, but **11 were not verbatim raw substrings**. Restored those line
breaks/indentation and added source paths and exact line locators. Added 16
verbatim evidence entries across the seven overlaps. All **42 final evidence
entries** match the named raw README files. Nine input files, including the atlas,
all six endpoint READMEs, the original packet and the relevant sibling packet,
were checked byte-for-byte against GitHub main before submission.

## Every retained link

Here `Z` means ZigzagPreprojective, `Q` QuiverRepresentations, `R` RootSystems,
`S` StablePeriodicCurved, `G` GrothendieckEulerForms, and `D` DGAInfinity. Numbers
are layer numbers; full stable stage IDs and evidence are in the packet.

| Supplier → consumer | Independent decision and required boundary |
| --- | --- |
| Q0 → Z0 | Keep. The finite-vertex path algebra, vertex idempotents and later-factor-first multiplication supply the doubled-graph quotient's ambient algebra. No acyclicity is needed for this carrier. Arrows alone do not generate the multi-vertex algebra. |
| R6 → Z0 | Keep. The deletion comparison needs numbered finite ADE Cartan data. Z0 owns its affine extensions and relabellings; finite positive-definite classification does not prove affine classification. The double edge of affine A1 is not a simple graph. |
| S0 → Z2 | Keep. A finite-dimensional nondegenerate trace yields a Frobenius functional and hence left/right self-injectivity through the generic theorem. Z2 still proves its basis, multiplication and trace. The algebraic Frobenius predicate is distinct from a Frobenius exact category. |
| Q1 → Z3 | Keep. The unbound-quiver equivalence supplies left-module conventions and idempotent decomposition. Restricting to representations annihilating the relation ideal and proving the quotient-module equivalence remains necessary; the unbound statement alone is insufficient. |
| G4 → Z3 | Keep. Reuse projective/simple bases and the graded Cartan map after proving finite-dimensional split/basic and graded-cover hypotheses for Z. Neither self-injectivity nor finite dimension gives finite global dimension or unimodularity. |
| G6 → Z3 | Keep. Reuse the Laurent shift module and sesquilinear q-Euler form with both cohomological and internal finite support. A formal power-series inverse is a different object. Comparison at q=1 requires the separate graded/ungraded Ext comparison. |
| G3 → Z5 | Keep. Its definition of linear graded resolutions is explicitly shared with Zigzag. Such resolutions may be infinite; the finite-resolution part of G3 must not silently restrict Koszulity. Actual exactness is required, not merely a numerical inverse identity. |
| D11 → Z5 | Keep. Relative quadratic duality over S=k^I supplies the construction and opposite conventions. Z5 must compute the annihilator, distinguish signless from signed relations, and prove its exactness and small-graph exceptions. |
| D9 → Z6 | Keep. The smooth inverse-dualizing-bimodule tensor completion is the comparison object for the explicit Pi2/Gamma3 presentations. The potential supplies its Hochschild class. A canonical CY refinement may require a negative-cyclic lift; proper/right CY and Serre conclusions have additional hypotheses. |
| D3 → Z7 | Keep. Transfer uses actual contraction maps and compatible splittings, with normalized side conditions or the normalization theorem. A chosen nonzero higher operation does not itself prove nontriviality modulo A-infinity isomorphism. |
| D8 → Z7 | Keep. Normalized arity-complete Hochschild cochains and the obstruction method supply the general machinery. Retain coderivation/brace formulations in bad characteristic; exponential gauge requires the rational-base assumption. The two displayed Hochschild index conventions need a proved adapter. |
| D11 → Z7 | Keep. Derived Koszul duality retains augmentation, dualizability, Adams local finiteness, conilpotence and completeness conditions. Regrading arrows to (1,-1) and distinguishing ordinary from completed objects are target work. |
| D6 → Z8 | Keep. Derived tensor composition and inverse Morita bimodules transport a supplied action through an actual equivalence with its coherence. This does not construct a McKay equivalence or prove braid faithfulness or sphericality. |

All directions are prerequisite to consumer. Retained the four original explicit
classifications: G3→Z5, D11→Z5, D9→Z6 and D11→Z7. Their supplier descriptions name
the Zigzag application, with reciprocal sibling references where present. The
remaining nine are conservatively inferred exact output/use matches. Quoted
source defects are not imported as theorems.

## Every overlap recommendation

| Stages | Recommendation and review |
| --- | --- |
| Q3 / Z0 | **Rescope, revised ownership wording.** Keep finite-dimensional admissible presentations and covers with Q. Z0 owns graph-specific homogeneous ideals and grading descent. Coordinate a missing generic arbitrary-relation module-restriction equivalence with the existing quiver owner, extending its API there if needed; do not duplicate a general equivalence inside Z. Prove compatibility with vertex decomposition, grading and projectives. |
| Q3 / G4 / Z3 | **Keep.** Q's rows are [P_i:S_j], while G's j-th column is [P_j]. Require an entrywise transpose comparison. Z's symmetric matrix can hide a mistaken convention, so a nonsymmetric quiver is a necessary mathematical check. |
| R5 / R6 / Z0 | **Keep.** Finite type, numbering and integral finite data remain with R; affine marks/deletion and simply-laced extension calculations remain with Z. No general Kac–Moody construction is implied. |
| D11 / Z5 | **Keep.** Relative duality and handedness are generic; the signless graph relation, bipartite sign conversion and exact Koszul complexes are specific to Z. Neither the inverse matrix nor a formal Hilbert-series identity replaces exactness. |
| S2 / Z2 | **Keep.** The generic stable-module construction applies to proved finite self-injective examples. A separate application step can instantiate it; it is not a reverse prerequisite on the generic S0 theorem. Stable-category CY conclusions require their own Frobenius/triangulated and duality data. |
| D8 / Z7 | **Rescope.** Keep the generic obstruction theory with D. Require a named regrading/totalization and Hochschild comparison before identifying HH^(n,2-n) with the positive-Adams-degree criterion. No unproved index formula is inserted in this review. |
| D9 / Z6 | **Keep.** Abstract completion, explicit presentation comparison and proper Serre duality are distinct. Keep Pi2's degree -1 loops and Gamma3's degree -2 loops distinct, and retain cyclic-lift, properness and ordinary/completed hypotheses where used. |

Two independent checks make the retained cautions concrete. For two isolated
vertices the path algebra is k×k, whereas the unital k-subalgebra generated by
the empty arrow set is only the diagonal k; vertex idempotents must be included.
For the quiver 1→2 with later-factor-first multiplication, P1 has factors S1,S2
and P2 has factor S2. Thus Q's matrix is [[1,1],[0,1]], while G's column convention
gives [[1,0],[1,1]]. Symmetric zigzag examples alone cannot test this transpose.
For k[e]/(e²), the ordinary Cartan matrix [2] is not unimodular; its simple has
an infinite periodic resolution. This also checks the finite-support Euler and
potentially infinite linear-resolution boundaries.

## Completeness and duplicate check

Searched all nine focal stages against the current **2,007 stage descriptions and
218 roadmap documents**, using path/quotient, zigzag, preprojective, affine ADE,
McKay, Frobenius, projective-cover, graded Cartan, q-Euler, Koszul, Hochschild,
Ginzburg, CY-completion, formality, braid and Morita terms. The original examined
ledger listed 75 records. Extended it to every current roadmap with explicit
keyword-screen depth for the additional records; this does not claim full reads
of unrelated sources or proofs.

| Focal stages | Additional candidate and outcome |
| --- | --- |
| Z0–Z1 | No actual McKay roadmap stage exists in the checked world. Export language in the README does not license inventing a target ID. A commutative homogeneous Steinberg ideal is not the doubled-path relation interface. |
| Z2–Z3 | Q3→Z3 is an exact projective-cover/primitive-idempotent dependency, but it already exists in `tauceti_TauCetiRoadmap_RepresentationTheory_QuiverRepresentations.json`. Read that entry and both endpoints; record it in `alreadyRecorded` rather than duplicate it. Z must establish split/basic structure and supply grading. |
| Z3 | Read G5 in full. Its finite-support Ext descent feeds the G6 q-Euler API already linked here; no separate same-contract edge is needed. Read PadicMeasuresIwasawaAlgebras L6: Gorenstein coefficient orders over a DVR and their quotients are not supplied by a finite-dimensional graph-algebra trace theorem. |
| Z4–Z5 | No additional exact classical-Koszul consumer or supplier emerged. Commutative Koszul complexes for regular sequences and arithmetic derived completion are different contracts. R3's Matsumoto theorem, read in full, assumes braid relations; it does not prove the Z8 bimodule braid homotopies. |
| Z6–Z7 | Read RefinedTraceMethods RT.1 and RT.3b in full. Algebraic cyclic chains and the Beilinson square do not supply the graph-specific Hochschild cochain computation or automatically provide the required negative-cyclic lift. D9 already exposes that lift as a hypothesis. |
| Z8 | Read D5 in full: its cone/derived-module infrastructure lies beneath the D6 transport API. Read ArithmeticQuantumTopology QT.1: ribbon braiding and surgery invariants are not the graph-indexed derived autoequivalence action. D9's proper DG/Perf Serre construction does not by itself supply every Hom-finite triangulated category allowed by Z8's conditional spherical-twist statement; no blanket extra edge is asserted. |

No additional new edge was established. The sibling projective-cover link was
rechecked against current main and is the only other incident link found in
the sibling-packet scan. A later McKay design or a concrete DG-enhanced spherical
application can justify new links once its stage contract exists.

## Validation and limits

Changed only the link packet and this independent report. Preserved all 13 link
endpoints, all confidence labels and all seven overlap endpoint lists. The
review object records `accepted`, with empty `removed` and `added` arrays.
There is no new edge requiring `addedBy`; added screening-ledger rows are marked
with this review job for provenance.

Checks passed:

* `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_ZigzagPreprojective.json` — 0 errors, 0 warnings.
* `python3 research/blueprint/intake.py check-files research/blueprint/links/tauceti_TauCetiRoadmap_ZigzagPreprojective.json research/blueprint/reviews/REV-LINK-tauceti_TauCetiRoadmap_ZigzagPreprojective.md` — 2 files, 0 problems.
* All 42 raw quotations, source hashes and endpoint-preservation checks.

No Lean file is required or changed; no compilation or proof-axiom audit is
claimed. No git commands were run for this job. Submission uses the GitHub API.
The existing unresolved source repairs remain real obligations: quotient-module
compatibility, the numerical Koszul converse, the Hochschild grading adapter,
and every cyclic-lift/duality/completion condition. Acceptance of these delimited
links does not assert that those mathematical proofs are complete.

## Input fingerprints

| Input | SHA-256 |
| --- | --- |
| `data/atlas.json` | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |
| `research/blueprint/links/tauceti_TauCetiRoadmap_ZigzagPreprojective.json` | `4aee454f42a7abdccf3e9c358ec5185dda30b5d15f8f1d23982faa5da741161d` |
| `content/tau-ceti/DGAInfinity/README.md` | `5084846eb030e70e08d60ce4421e4dc2db67285aee06d338c28807a3f66941ad` |
| `content/tau-ceti/GrothendieckEulerForms/README.md` | `165e126ebef2cfdc228310b7fc427f9945367168329637d60b57413a99adebef` |
| `content/tau-ceti/RepresentationTheory/QuiverRepresentations/README.md` | `0a60cdf62901f5afb69d05d6dd6041ef99e004ba099e878b16605b310d79180d` |
| `content/tau-ceti/RepresentationTheory/RootSystems/README.md` | `b36938dae9a4d3f9e761991ff0bb8092c2c004533b87ad7906ab3b140eef7335` |
| `content/tau-ceti/StablePeriodicCurved/README.md` | `fbf9c1a74e89d85925d6eed5aacd72cf511425e456803d1eff79cd22aa542ebd` |
| `content/tau-ceti/ZigzagPreprojective/README.md` | `269fb6a54b432760210bada03ec6b793f6419a6fe79a38740f1cd0e86a6ce60b` |
| `research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_QuiverRepresentations.json` | `91978785257c6264af75b237ec5da4942aaa7d237ff9992b6dc3df06924a2568` |
