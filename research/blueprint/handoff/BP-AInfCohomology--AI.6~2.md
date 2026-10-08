# BP-AInfCohomology--AI.6~2: completed reader revision

Codex, session `codex-jMTKnx`, 8 October 2026. Refs #6916.
Claim confirmed for [the session's claim comment](https://github.com/CBirkbeck/tauceti-explorer/issues/6916#issuecomment-6059212284).
Branch: `codex-jMTKnx-ai6-reader`.

## What this round changed

The [independent review](../reviews/REV-AInfCohomology--AI.6.md) asks this revision to regenerate the reader from the corrected packet. That task is complete. The [reader](../readmes/AInfCohomology--AI.6.md) now includes every corrected node, statement, hypothesis, proof outline, direct prerequisite, API item, test, source locator and suggested-file boundary. It also synchronizes the overview, supplier contracts, gaps, baseline, stage links, restructuring proposals and source issues.

The packet remains byte-for-byte unchanged, including its node ids, independent `review` object and `status: complete`. The suggested Lean file is also unchanged. The checkout already had no source-excerpt fields to remove. Source prose quotations inherited by the regenerated reader were replaced with paraphrases; mathematical formulas, theorem/section/equation/page locators and the review's confirmed findings are retained. No source files or passages are committed.

The register has 60 nodes (43 AI.6, 17 AI.7): four definitions, 16 constructions, 38 theorems and two applications, with 103 API items, 76 tests and 12 planets (six per stage). There are 34 baseline declarations, 18 supplier requests and six gaps. Both stages remain **planned**, and all implementation statuses remain **unchecked**.

The reader incorporates the five added nodes: `structure-sheaf-edge`, `aomega-sheaf-completeness`, `finite-level-acris`, `bdr-cohomology-etale-embeddings` and `de-rham-lattice-functor`. It keeps properness in the generic-fibre étale comparison; places sheaf completeness after the Hodge–Tate calculation; distinguishes classical termwise PD completion from derived completion; and retains precisely the semistable functoriality and local multiplicativity supported by the review. It obtains rational finite freeness from CK/Beilinson, preserves adjacent-degree terms and the two-degree lattice hypothesis, and leaves the AI.7 comparison-map agreements open. The coefficient dictionary distinguishes g, f, θ and θ̃, including Witt Frobenius. The Nygaard non-descent argument keeps both the unramified obstruction and the ramified elliptic example.

The red-team finding RT-AREA-padic-2/13 is handled: the CP.3 → AI.6 stage link, its supplier contract, and the three consuming nodes' prerequisites are retained. The reader describes the topology/embedding extension and properness without putting the finding's identifier inside declaration text. No duplicate B_dR construction is proposed.

## Verification and its limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/AInfCohomology--AI.6.json --index "$TAUCETI_BASELINE/declarations.tsv"`: zero errors and zero warnings, using the real pinned declaration index.
- A separate reader/packet comparison checked every register statement, hypothesis, proof step (allowing the recorded paraphrases), prerequisite, acceptance item, API/test name and statement, use, source locator, Lean boundary and planet. It also checked all requests and consumers, all gap details, remaining coverage work, baseline descriptions and all 14 source findings. Packet/review and suggested-file equality with the starting commit were checked. The packet's node graph is acyclic; `check_issues` and `versions_checked` pass.
- Atlas assembly with `assemble(require_distances=False, blueprints=...)` passed with the existing promoted inputs symlinked in scratch and this packet/reader substituted. No atlas or promoted-data files were edited or copied into a second checkout.
- `lean-check research/blueprint/suggested/AInfCohomology--AI.6.lean`: exit 0 at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, with Lean 4.34.0-rc2. The only warnings were 23 declarations using `sorry`. The file imports Mathlib only; no Tau Ceti build is claimed. The Tau Ceti baseline named by the packet is `f790474821cf4256814db967cb154e7af3d0c369`.
- `git diff --check` passed. Only the reader and this handoff are changed.

The Lean file contains 205 declarations and examples: 182 proved and 23 unfinished. Only 17 API items and 18 tests are active declarations or labelled examples; the others are a named inventory. The chart, monomial-index, log-derivation and coefficient algebra is represented; three further nodes have partial algebraic cores. Geometric signatures await actual supplier types. No geometric comparison is certified by elaboration.

The four public PDFs were downloaded to scratch and their SHA-256 values matched the packet: CK arXiv v3, published BMS1 and BMS2, and BS22 arXiv v4. The central corrected passages were checked at the packet's locators, including CK §§4–8, BMS1 §4.4 pp.280–282, BMS2 §11 pp.298–307 and BS22 §15.2 p.105 and §18 pp.122–123. The cited baseline statements were read at Mathlib `082e2d3`. This round is a reader synchronization, not a new independent review of every proof or supplier. The original review's reading limits remain: notably CK's published version and the external input papers were not newly audited. No restricted library book was used.

## What remains and where to resume

No work remains for this revision's requested reader regeneration. The next review should compare the reader with the corrected packet, leaving the previous `review` object for that reviewer to replace. The packet's 14 confirmed source findings (11 misprints, three proof gaps) and their verdicts are unchanged; author contact and duplicate-register reconciliation remain maintainer decisions.

Stage closure still requires the stated supplier interfaces and six gaps:

- `G-GAGA`: rank-one formal GAGA, proper coherent finiteness and the generic-fibre comparison, extending the existing AdicSpacesPartII:F0 direction.
- `G-INPUTS`: the precisely listed external inputs, including log crystalline base change W(k₀)→W(k̄) and the Galois-invariant results for general complete discretely valued K.
- `G-CURVE`: coherent base change, log duality and the nodal-conic computation's supplier interface.
- `G-MAPS`: agreement of the trace/prismatic specialization maps and the integral/crystalline/étale/B_dR maps, together with PR.6 comparison naturality and multiplicativity.
- `G-LEAN-GEOMETRY`: replace the inventory by signatures using real supplier types.
- `G-LEAN-CONTINUATIONS`: finish the algebraic cores, including completed towers, PD derivations, coefficient series evaluation and the kernel-generator statements.

The 18 request owners are AI.0:integral, AI.0:period-comparison, AI.1–AI.5, AdicEtaleGeometry:A1, AdicSpacesPartII:R3, CohomologyComparisons:CP.3, CR.0, CR.5, CR.5:log-algebra, CR.6, EnhancedDerivedSheaves:E4, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, PerfectoidSpaces:P3 and RefinedTraceMethods:RT.6. The exact contracts and consumers are in the packet and reader. Existing PR.3/E1 nodes are imported directly. Neither the GAGA extension proposal nor the proposal to display AI.6 in three sub-layers is applied here; no stage or node id changes.

Scratch reading texts and scripts are disposable and will be removed when the PR opens. This note and the reader retain everything needed to assess and continue the work.
