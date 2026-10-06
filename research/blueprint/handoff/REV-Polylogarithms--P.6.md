# REV-Polylogarithms--P.6 handoff

Issue #6406; Codex, session `codex-PaORFX`; 6 October 2026.
The sole job in this run is complete. Independent verdict: **accepted**.
The original author was session `codex-Omyv0N`.

The packet and suggested file were reviewed in full. The review report is
`research/blueprint/reviews/REV-Polylogarithms--P.6.md`; the packet's review
object names `independent-review-REV-Polylogarithms--P.6` and checks both nodes.
No new node was added. The differential, its domain, normalisations and five
exact examples are sound. All four baseline citations were confirmed at the
pinned Mathlib commit. The suggested file elaborates with only seven intended
`sorry` warnings.

Corrections: add the separate Bloch–Wigner positivity node as the strict sign
test's prerequisite and expose its inherited minimum-principle gap; name the
existing ColemanIntegration L0 logarithm and finite-extension compatibility
nodes and narrow D.1 to the regulator comparison; confirm E22 against the
inspected preprint images; add the independent review and attribution.
The reader was read but is outside this review's editable deliverables.

The packet remains a complete planning pass with planned coverage, three
supplier requests and one inherited proof gap. No implementation or closure
of imported proof obligations is asserted. The strict sign at i needs the
existing P.1 positivity proof; the differential identities do not.

Resume at assembly, not at another review of this pass:

1. Bind I.2's completed-unit map, strong statement and defect and D.1's
   regulator-specific principal-unit, torsion-kernel and rationalised-rank
   comparison. Reuse the already accepted Coleman logarithm nodes named in
   `targetCoverage` and the D.1 request.
2. Recast the old P.6 conjecture node as an I.2 adapter, transferring its
   ownership wording and planet. Preserve the regulator equivalence and add
   the three early I.2 consumer edges; no polylogarithm prerequisite enters
   I.2. This is the verified RT-AREA-ktheory-2/26 boundary.
3. Attach the differential theorem to the old P.6 test suite. Remove only its
   weight-three differential source-gap clause. Retain general-weight,
   higher-Bloch, P.5 current and P.1 positivity obligations. The combined
   reader should explicitly mention the inherited positivity input.

Fresh source: Goncharov, arXiv math/0003086v1, §2 items 1,4,6 and the complete
Proposition 4.1 proof, printed pp.17–20. The PDF hash matches the packet; E22
is confirmed for that preprint alone. The published version was not inspected.
All source and mathematical verification details, public URLs and counts are
in the review report. No scratch files are needed to resume.

Checks: packet checker zero errors and warnings; suggested Lean exit 0,
only `sorry` warnings; embedded source-issue and whitespace checks passed. No
language server, library build or repository copy was created.
