# Independent review of the coding-to-moonshine handoff fix

Refs #5176. **Codex — codex-5ebb6f**, 30 September 2026. Reviewed explorer revision `f9dc0e48b4d5f139d0fb17ea2ac653d8994f7057`; the claim bot confirmed this session before work began.

**Verdict: accepted.** The single confirmed finding is correctly repaired within the verifier’s narrower scope. No mathematical correction was required. The fixer was Codex session `codex-J6LwjP`, issue #5035; this reviewer did none of that fix work. This review follows `independent-review-REV-LINK-tauceti_TauCetiRoadmap_AlgebraicCodingTheory`, dated 23 September 2026, whose entire object is preserved in `reviewHistory`. The shared repository account is not evidence of independence; the separate worker sessions identify the author and reviewer.

## Finding /1

Read the full red-team claim, complete verifier verdict and fix report. The verifier explicitly permits a rewritten screening note and one request, and excludes a new overlap or directed edge. The current fix satisfies that instruction:

- `examined[QSeriesPartitionsAndMockModularForms]` retains `result: none`. It distinguishes the canonical QM.6 stage, which names no coding prerequisite, from the later explicit planned use in a **partial, unreviewed** packet gap. It points to ACT-R06 without attributing the later evidence to an error by the original reviewer.
- **ACT-R06** names coding Layers 5–6 and QM.6, retains `unresolved_consumer_contract`, and assigns the ownership question to the maintainer under PROTOCOL section 15. The missing output is a positive-definite, even, unimodular, rootless rank-24 lattice, with an actual construction and form-preserving rational-to-real comparison.
- The request separates the reusable Golay/Construction-A inputs from the additional Leech construction and its rootlessness proof. It preserves ACT-R05’s normalization guard. Lattice-VOA, twisted-module and Monster constructions remain QM.6 work. No implicit supplier is invented by expanding a completed roadmap.
- No link or overlap is added. A future directed prerequisite needs an owner, an explicit construction/comparison contract and independent review of the QSeries packet. The new summary clause reports the handoff without claiming it resolves the FLM construction gap.

Read [coding Layers 5–6 and the standing conventions](https://github.com/CBirkbeck/tauceti-explorer/blob/f9dc0e48b4d5f139d0fb17ea2ac653d8994f7057/content/tau-ceti/AlgebraicCodingTheory/README.md), the [completed IntegralLattices scope exclusion](https://github.com/CBirkbeck/tauceti-explorer/blob/f9dc0e48b4d5f139d0fb17ea2ac653d8994f7057/content/tau-ceti/Completed/IntegralLattices/README.md), and the canonical QM.6 contract. Coding’s explicit Golay matrix and rational Construction A supply reusable inputs; neither roadmap constructs the Leech lattice or supplies rank-24 classification.

The entire [QSeries FLM gap](https://github.com/CBirkbeck/tauceti-explorer/blob/f9dc0e48b4d5f139d0fb17ea2ac653d8994f7057/research/blueprint/packets/QSeriesPartitionsAndMockModularForms.json) and its rendered reader counterpart were checked, together with the two consumer statements. The gap still names `QM.6/monster-head-characters` and `QM.6/monstrous-moonshine-theorem`; ACT-R06’s `neededBy` list matches exactly. The packet still has status `partial` and no independent review. Its SHA-256 is **`177eaefe4959449edd431e5809be13685e231ddfcb082ca631704ca61e7050bc`**, reproducing the request’s provenance. All three request-evidence fragments match their named gap or source files literally. Neither consumer statement is newly accepted by this link review.

The normalization guard is decisive without a classification theorem. For every binary additive code C, zero belongs to C. Each nonzero vector ±2eᵢ reduces to zero, hence belongs to P₂(C), and its squared norm for B₂ = dot/2 is 4/2 = 2. Thus plain P₂(G₂₄) has roots. An exact-rational diagnostic checked the reductions and norms of all 48 signed coordinate witnesses in 24 coordinates; it does not claim these exhaust the roots or constitute a Lean proof. [Shimada, arXiv:2311.18309v1](https://arxiv.org/pdf/2311.18309v1), section 2.1, printed p. 2, and the opening of section 3, printed p. 4, were independently read only to confirm the norm-2 root convention and rootless Leech terminology. No Leech construction proof or classification was newly read or certified.

A focused Leech-term search in current roadmap definitions, packets, key-definition surveys and promoted blueprint/decomposition files found no newly assigned construction supplier. The hits retain the QSeries gap or discuss it as a handoff. This bounded owner check is not a new catalogue-wide link screen.

## Preservation and validation

Relevant reviewed library-coverage records were read: AUDIT-16 for coding Layers 5–6 and AUDIT-15 for QM.6. They do not turn the planned Golay/Construction-A/VOA outputs into existing implementations. This fix introduces no declaration-level library claim. The required baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

- All ten links, three overlaps and five prior requests equal the promoted predecessor. All unrelated screening entries and original worker/screen/validation metadata remain unchanged. Historical Tau Ceti-to-Tau Ceti links remain outside this review under PROTOCOL sections 10 and 17.
- Read-only accepted-atlas assembly: **2919 vertices, 8298 distinct edges, acyclic**. Applying production `merge_links` to either the predecessor or revised map preserves exactly the same edge set. No hypothetical coding → QM.6 edge is installed.
- `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_AlgebraicCodingTheory.json`: **10 links, 3 overlaps, 217 historical examined entries, 0 errors and 0 warnings**.
- Intake `check-files` for this report and the map, plus `git diff --check`: **0 problems**.

Only the review object, its verbatim history and this report change. No new mathematical node, definition API or Lean file is introduced; no Lean compilation or library build was performed. Recording the unresolved owner contract completes this scoped fix. The Leech/FLM construction and consumer proof obligations remain open and are not represented as proof closure.
