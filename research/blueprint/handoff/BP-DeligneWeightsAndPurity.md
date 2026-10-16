# Handoff: BP-DeligneWeightsAndPurity

Whole-roadmap blueprint job for issue #9918, done by Claude (Opus 5.5), session `claude-qmSWO4`, on 16 October 2026, from main at `dbc377679`, fast-forwarded to `008f04075` before submission (main did not touch these files or the packets they rest on). Branch: `claude-qmSWO4-BP-DeligneWeightsAndPurity`.

## Situation found

The roadmap already had two accepted part packets that together cover all eleven stages: `DeligneWeightsAndPurity--DWP.0` (83 targets, DWP.0–DWP.6 and DWP.10, accepted by REV-…--DWP.0~2) and `DeligneWeightsAndPurity--DWP.7` (52 targets, DWP.7–DWP.9). Its assembly (7 October), an accepted package (9 October) and the upstream draft TauCetiRoadmap #929 were built from them. Two later facts changed the plan:

1. **EtaleDualityAndPerverseSheaves EDC.7, revision 2, accepted on 14 October**, moved 65 of the 135 part targets down from tier 11 to tier 10 and lists them under its `ownershipTransfers` (handoff `BP-EtaleDualityAndPerverseSheaves--EDC.7~2.md`), asking DWP to retire them and repoint its surviving targets.
2. The parts cite **WeilConjectures (10 times) and FunctionFieldArithmetic (3 times)**, both outside the Caraiani–Newton order (`upstream/CaraianiNewton.md`, tier 11 entry), so those notions have to move down here.

A checker rule forces the form: a node id may appear in only one packet of a roadmap, so the surviving part targets cannot be restated. The packet therefore follows the accepted precedents HodgeTateAndCanonicalSubgroups, AInfCohomology and GrossZagierAndArithmeticHeights. It contains only its own new nodes plus an `assembly` record that defines the effective plan.

## What the deliverables contain

- `research/blueprint/packets/DeligneWeightsAndPurity.json`, status `complete`. All eleven stages are `planned`, with 6 own nodes (1 lemma, 5 theorems, 4 planets), 27 requests and 2 gaps; the checker reports 0 errors and 0 warnings with the pinned index.
  - `assembly.retiredByTransfer`: the 65 retired ids with their receiving EDC.7 targets. `DWP.1/frobenius-endomorphism-over-a-finite-field` goes to SchemeAndStackFoundations SF.0, as EDC.7's handoff directs for generic scheme Frobenius.
  - `assembly.importedNodes`: the 70 surviving targets. `importedPrerequisites` gives replacement prerequisite lists for 47 of them, and `importedNodeCorrections` gives replacement text fields for 33 (retired ids rewritten to EDC.7 ids, and the WC/FA wording replaced).
  - New nodes, all moved down from roadmaps outside the order:
    - `DWP.0/rational-zeta-descent-and-fatou`, transferred from RD.7 as the PadicDifferentialEquations assembly proposed (formerly WC.1);
    - `DWP.0/weight-separated-factor-extraction`, transferred from RD.7 (formerly WC.3);
    - `DWP.4/integral-cohomological-factors`, Weil I Theorem 1.6 (formerly WC.3);
    - `DWP.10/point-count-bounds` (formerly WC.5, two nodes);
    - `DWP.7/purity-of-smooth-proper-dm-stacks` (formerly WC.6);
    - `DWP.3/function-field-chebotarev`, from Kosters arXiv:1404.6345 Corollary 1.2 by base change to 𝔽_{q^r} (formerly FA.5). I re-derived its explicit degree-r bound; it agrees with the FA.5 node's.
  - `maintainerSources` accounts for all 95 routed items: 21 covered, 13 covered as proof steps, 47 now owned by EDC.7, and 14 not targets (the conjectures (1.2.9)–(1.2.10), introduction pointers, the (1.8.14) Hodge analogy, the unused (3.1.3.3) remark, the Γ ≅ ℝ example and the §1.3 set-up).
  - `redTeamFindings` gives the handling of RT-AREA-etale/1 and RT-AREA-etale/9; `incomingRequests` covers 24 requests from other packets; `restructure` has 6 entries.
- `research/blueprint/readmes/DeligneWeightsAndPurity.md` replaces the stale assembled reader of 7 October. It is rendered from the part nodes with the corrections applied, plus the new nodes and the ledgers. It opens with an introduction (ownership after the transfer, conventions, a layer table). Each layer section lists its EDC.7 imports before its own targets.
- `research/blueprint/suggested/DeligneWeightsAndPurity.lean` (1,978 lines): the two part files in their current versions, then a new section and a name ledger. Definitions now owned by EDC.7 are kept verbatim under EDC.7's names so that the file elaborates on its own.

## Notions moved down (for the owners of the higher roadmaps)

| Moved to | Formerly | Consumer action |
| --- | --- | --- |
| `DWP.0/rational-zeta-descent-and-fatou` | WC.1/rationality-over-q-via-hankel-determinants, WC.1/local-fatou-normalization, RD.7/rational-zeta-descent-and-fatou | WC.1 and RD.7 cite it; RD.7 retires its copy |
| `DWP.0/weight-separated-factor-extraction` | WC.3/degreewise-pure-factor-extraction, RD.7/weight-separated-factor-extraction | WC.3 and RD.7 cite it; RD.7's planet moves here |
| `DWP.4/integral-cohomological-factors` | WC.3/integral-factors-and-ell-independence-from-purity | WC.3 cites it |
| `DWP.10/point-count-bounds` | WC.5/all-extension-point-count-bound, WC.5/components-and-dimension-zero | WC.5 cites it; the RS-17 owner record changes from WC.5 to DWP.10 |
| `DWP.7/purity-of-smooth-proper-dm-stacks` | WC.6/purity-for-smooth-proper-dm-stacks | WC.6 cites it |
| `DWP.3/function-field-chebotarev` | FA.5/degree-sensitive-chebotarev | FA.5 cites it; the RS-17 owner record changes from FA.5 to DWP.3, as DWP.3's stage text already says |

## What remains

1. **Applying the plan to the part files.** The part packets, readers and suggested files still contain the 65 retired targets and the old prerequisites; the atlas shows them until those files change. The next revision of the parts, or the package, should apply `assembly.retiredByTransfer`, `importedPrerequisites` and `importedNodeCorrections` (restructure entry 1). The stage edges DWP.7/DWP.8/DWP.9 → EDC.7 in `data/atlas.json` no longer have node support and must be dropped when EDC.7 → DWP.x edges are added, or a cycle closes.
2. **The package is out of date.** The accepted package of 9 October and the upstream draft #929 ported from it still plan the 65 targets that EDC.7 now owns and still cite WeilConjectures and FunctionFieldArithmetic. A package revision should follow this plan once it is accepted.
3. **Sublayer DWP.8:equidistribution** (RT-AREA-etale/1) is proposed but not created; Weil II §3.5 stays on DWP.10 until then.
4. **Gaps.** One gap is new: Weil II (3.3.11) for proper algebraic spaces, needed by the stack purity node; its earlier owner, an EDC stacks Part II, is outside the order. The inherited gap on geometric carriers in suggested signatures stays, narrowed to the surviving targets. The prescribed-base complex embedding gap of the DWP.0 part is dropped, because its target moved to EDC.7, which closed it.
5. **Requests.** The 27 supplier contracts stay open, notably SF.1 (stack cohomology and the coarse-space comparison, extended here) and Tau Ceti ModularCurves Part II for the SL₂ monodromy of Weil II (3.5.5).
6. Other notes: FunctionFieldArithmetic's open request to DWP.0 for Brauer–Nesbitt is representation theory and is answered by no DWP stage. DWP.9's graded-operator lemma is narrowed to its pairing statement, because EDC.7/abstract-primitive-decomposition owns parts (i)–(ii).

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/DeligneWeightsAndPurity.json --index <pinned declarations.tsv>`: 0 errors, 0 warnings.
- I checked the effective graph by script, since the checker does not look inside `importedPrerequisites`. No retired, upward or unresolved prerequisite remains. There is no cycle through this roadmap, even counting all EDC.7 nodes. Apart from Tau Ceti roadmaps, every prerequisite is in a tier below 11, and no EDC.7 node cites this roadmap.
- In-memory `merge_blueprints` over the three DWP packets: 141 declarations, 45 planets, 11 layers, no skipped links.
- Reader: a Python port of the inline parser of `src/markdown.js` finds no unintended emphasis, mathematics or link on any line. Underscores after non-ASCII letters, `*`, `$`, backticks and `[` are escaped; `]` is not, since `\[ … \]` would become display mathematics.
- Lean: `lean-check` at Mathlib 082e2d3 exits 0, with 131 warnings for proofs left open and no other diagnostics. A `run_cmd` audit of a copy, with examples renamed to theorems, finds no statement whose type contains a placeholder (187 constants).
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems.
- Mechanical cross-check, item by item, of the 83 locator-matched maintainer items against candidate statements, by a Sonnet subagent: 43 covered, 20 partial, 20 not covered. I judged every partial and not-covered item by reading the cited node's proof steps; the dispositions are in `maintainerSources`.

## Sources read

- Deligne, La conjecture de Weil. I, Numdam PDF, SHA-256 8392b345…f42e5 (same as the parts): §1 (1.4)–(1.7), pp. 274–277; §6 (6.6)–(6.13), pp. 296–298; Théorème (8.1), pp. 301–302.
- Deligne, La conjecture de Weil. II, Numdam PDF, SHA-256 b06eea61…cc71: (3.3.9)–(3.3.11), pp. 206–207.
- Kosters, arXiv:1404.6345v1, SHA-256 6e98f819…35ea: §1, pp. 1–5.
- Milne, Lectures on Étale Cohomology v2.21, SHA-256 ac4f122f…1077: Lemmas 27.9 and 27.10, Summary 27.14, pp. 156–159.

No source needed for this pass was missing. Stichtenoth's Theorem 9.13, which Kosters cites, was not used.
