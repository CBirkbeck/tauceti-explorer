# BP-HodgeStructuresPartII--H.6

Worker: Codex — codex-7aczLQ. Issue: #6945. Branch: codex-7aczLQ-hodge-h6.

This is a completed target-level planning pass, not a checkpoint. Packet status is **complete**; coverage of **HodgeStructuresPartII:H.6 is planned**, not closed. Every target in the stage description and the H.6 slice of the reviewed Qian/BKT routes is represented. All implementation statuses remain unchecked. Independent review is required.

The four deliverables are the H.6 packet, reader, suggested file and this handoff. No other roadmap, application, atlas data or queue file is changed. The parent packet had no H.6 nodes, so this part adds 30 nodes rather than modifying inherited declarations.

| Measure | Count |
|---|---:|
| Definitions | 2 |
| Constructions | 3 |
| Comparisons | 5 |
| Theorems | 19 |
| Applications | 1 |
| API items | 30 |
| Definition/construction tests | 15 |
| Planets | 6 |
| Checked baseline declarations | 18 |
| Recorded gaps | 5 |
| Supplier requests | 7 |

## What the pass establishes as a plan

The geometric interface is limited to proper reduced semistable analytic families with smooth total space and a disc excluding other singular fibres. It records the relative log chart, wedge-dlog triangle, local-freeness/base-change theorem, geometric Gauss–Manin connection, special residue, nearby-cycle comparison, finite actions and ramified normalization. The residue A and unipotent logarithm L are distinct: L=−2πiA. Raw ramified pullbacks are not assumed smooth.

The period interface covers integral polarized quasi-unipotence, coordinate covers, nilpotent orbits, untwisted extension, multivariable domain entry, finite-monodromy extension, centered cone weights, the actual-weight shift in limiting MHS, all logarithms of degree (−1,−1), distributivity and distinct rational/complex splittings. It imports native pure/mixed Hodge structures, polarizations, Deligne splitting and period points. Generic monodromy linear algebra remains in LPV.1, and the finite nilpotent exponential is already Mathlib. Native pure tensor products and the fibrewise Hodge inner-product core are also reused; H.2 receives the polarized exterior-variation/Gram compatibility request.

Both flat and transported norm statements are all-vector **squared**-sum comparisons, independent of the compatible splitting and valid on induced exterior powers. Bounded real widths, ordered heights, compact nondegenerating parameters, rank conditions and inner buffers are explicit. The horizontal derivative includes 2πi. The perturbation lower bound is a deep-height assertion; mixed shallow/unbounded regions are not treated as compact.

The joint fixed negative-Lie chart retains its possibly nonzero parameter-boundary coefficient. Its boundary exponential commutes with all logarithms. This proves local constancy of all limiting Hodge/face-weight intersection ranks: the factor preserves each face weight and transports the Hodge flag. It also transports compatible complex splittings, while a rational weight splitting stays fixed. Compact buffers bound the transitions. The varying native Deligne complement is not asserted holomorphic. This mathematical parameter adapter is in H.6; only its native analytic bundle/metric interface remains open.

The one-variable SL2 proof was read through Schmid §9. Its fixed canonical compact version needs the precise H.3/AA.3 metric transport adapter. H.6 does not import H.7's desired multivariable containment as a prerequisite. A rational-slope curve adapter clears denominators and treats zero slopes as nondegenerating parameters.

## Precisely what remains

- **G1 — analytic semistable log/derived comparison:** C0/C3/C5 must supply analytic sheafification, proper log de Rham base change, nearby cycles, the residue-compatible triangle, reduced semistable unipotence and comparison under a semistable modification. Algebraic CR.5 charts alone are insufficient.
- **G2 — native variation/period geometry:** H.2/H.3 must supply global analytic PVHS and flag/manifold, tangent/stabilizer and curvature interfaces. Suggested matrices and submodule flags are scoped receiving representations, not replacement Hodge carriers.
- **G3 — generic operator/filtration APIs:** LPV.1 must provide finite log, relative faces, centralizer preservation, distributive splitting and tensor/exterior functoriality in the required characteristic-zero generality. The packet proposes a rescope of this generic owner; it does not replan its objects locally.
- **G4 — native compact-family interface:** express the proved commuting-boundary-factor transport, analytic splitting subbundles, common depth and bounded transitions in the native bundle and Hodge-metric interfaces. The mathematical local constant-rank theorem is already included; do not create another H.2 degeneration theorem for it.
- **G5 — fixed canonical compact:** H.3 and AA.3 must verify the rational Hodge-metric representation, Cartan compatibility, transport of Schmid's reference-compact estimate and compact-set coverage for the chosen canonical K. Arbitrary changes of K are insufficient.

The seven requests name C0, C5, C3, LPV.1, H.3, AA.3 and H.2. Each gives an exact statement and consuming node ids. Existing finer H.2/H.3/CR.5/AA.3 nodes are linked where their statements suffice. No H.7 node is a prerequisite. Review/follow-up should first audit the marked signs and weight shifts, the joint/centered chart distinction, the parameter transport proof and canonical-compact gap, then resolve these supplier interfaces without duplicating their generic theories.

## Sources and source issues

Read copies, exact locators, access date 8 October 2026 and SHA-256 hashes are recorded in the packet and reader. Public source files were kept only in scratch. No source file or extracted passage is in the repository. No private book was needed, and no source essential to this target-level pass is missing.

- Qian's separate companion arXiv:2103.00106v1, §4 pp.21–23, including Lemma4.3, its proof and comparison diagram; Remark2.4 p.13 checked for the disc restriction.
- Illusie, Astérisque 223, Exposé I, §§2.2.1–2.2.4 pp.18–21 and §2.1.3 pp.14–15, including the local torus/nearby-cycle and proper spectral-sequence proof.
- Schmid, Inventiones 22 (1973), Lemma4.5 and orbit statements pp.230–233, §§5.19–5.29 pp.242–245, Theorem6.16 and proof pp.255–263, full §8 pp.277–293 and full §9 pp.293–319.
- Cattani–Kaplan, Inventiones 67 (1982), full §§1–3 pp.101–115 read on institutional journal page images, especially Theorem3.3 and proof pp.113–114.
- Kashiwara, Publications of RIMS 21 (1985), full §§1–4 pp.853–875; the norm/splitting formulas were checked on page images as well as extracted text.
- BKT, publisher-formatted JAMS 33 (2020) version of record, §§4.2 and4.4 pp.928–932; the entire four-page official author-hosted erratum.

Four source findings restate existing extraction issues: BKT E52 (2πi), E49/E54 (splitting scope), E53 (deep lower bound), and reviewed Qian E49 (disc radius). They are stated in the worker's own words and corrected in all nodes. No claim of a newly discovered error is made. Fixed-K and Cartan compatibility from the official erratum are incorporated without asserting that it corrects BKT's analytic norm discussion.

## Verification and prototype limits

`python3 scripts/check_blueprint.py research/blueprint/packets/HodgeStructuresPartII--H.6.json` reports **0 errors, 0 warnings**, with the available pinned declaration index. All 30 node names, 30 API names and 15 named examples occur in the suggested file and reader. The graph is acyclic; every node has source support; no source excerpt or dummy proposition placeholder is present.

The suggested file **elaborated successfully** with the prescribed `lean-check` wrapper at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Memory was checked before each sequential invocation and exceeded the required threshold. Only the expected proof-placeholder warnings remain. No language server, project setup, dependency update or library build was run.

Tau Ceti source statements were independently read at f790474821cf4256814db967cb154e7af3d0c369; no claim is made that a newer shared checkout's compiled imports constitute that baseline. The suggested file deliberately imports individual Mathlib modules and records its G1–G5 omissions at the affected declarations. In particular, its locally represented cohomology comparisons and norm theorems omit their unavailable global geometric hypotheses. Their elaboration checks types and naming, not mathematical closure. Native interfaces must replace these scoped prototypes before formalization.
