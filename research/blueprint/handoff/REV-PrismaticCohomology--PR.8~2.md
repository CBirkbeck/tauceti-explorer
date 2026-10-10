# Completed independent review: PrismaticCohomology PR.8, revision 2

Job `REV-PrismaticCohomology--PR.8~2`, [issue #7084](https://github.com/CBirkbeck/tauceti-explorer/issues/7084). Codex session `codex-C0Buss`, 10 October 2026; branch `codex-C0Buss-prismatic-pr8-review`. This session did neither blueprint writing job. The bot confirmed the claim before work began.

The review is complete and **accepted**. It is a complete target-level pass: 79 nodes, 56 verified and 23 corrected, with no new or unverifiable nodes. PR.8 stays **planned**, with three explicit gaps, fourteen requests and every implementation unchecked. The acceptance rule in the review issue permits these honest gaps; acceptance does not certify closure or implementation. Nothing remains to resume in this review.

The deliverables are the [review report](../reviews/REV-PrismaticCohomology--PR.8~2.md), [packet](../packets/PrismaticCohomology--PR.8.json), [reader](../readmes/PrismaticCohomology--PR.8.md) and [suggested file](../suggested/PrismaticCohomology--PR.8.lean). The report contains all 79 individual findings, pinned baseline links and source evidence. These documents retain the evidence needed after scratch cleanup; no source files or passages are included.

## Corrections and verification

Twenty-one packet nodes were corrected, and two further Lean signatures received their missing integrality conditions. The main changes concern completion before exactification, monoid pushouts, the typed cosimplicial projection, crystalline auxiliary PD ideals, q-Frobenius hypotheses, the nonzero semistable parameter, the regular-presentation Nygaard formula, global Nygaard locators, positive adic charts, torsion modulus, and quasi-pro-etale diamond maps. The reader agrees with all definitive node contracts. No baseline citation was removed or replaced; no supplier file was edited.

All nine existing source findings were independently confirmed. New finding `PrismaticCohomology/E8.10` records the missing quasi prefix in KY Proposition 7.16(1), p. 74: arbitrary strict underlying maps use quasi-pro-etaleness, while the perfectoid test pullbacks are pro-etale. KY Definitions 7.1/7.14 and Scholze Definition 10.1/Proposition 10.3, p. 50, provide the correcting evidence. The packet records the search for an existing correction and this review's verdict. The full five-page public Inoue–Koshikawa–Yao corrigendum was read independently; its p-Kummer essential image and preservation of smooth proper pushforward resolve the first review's source gate.

All twenty library statements were checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 35 distinct exact external node references and relevant broad supplier contracts were checked. The current upstream roadmap and library screen found no duplicate log-prismatic development; existing `TauCeti.IsProP` is reused. The report records the current checkout commits and post-snapshot roadmap screen.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/PrismaticCohomology--PR.8.json`: zero errors and warnings.
- `lean-check research/blueprint/suggested/PrismaticCohomology--PR.8.lean`: exit 0 at the pinned shared build, 942 warnings, all declaration uses `sorry`; no other warnings or errors.
- Independent consistency check: all 79 reader contracts and verdicts agree with the packet; 219 APIs have typed forms (215 tagged, four named directly); all 137 tagged tests are anonymous examples; every definition/construction has at least three tests. Six planets are retained.
- JSON parsing, deliverable-path screen and `git diff --check` pass. No compiler remains running.

## Work for the orchestrator and supplier owners

The next work belongs to the recorded gap and request owners, not to another source-level revision of this accepted pass:

1. Assign the bounded algebraic Witt-Frobenius Riemann–Hilbert correspondence with extension by zero used in KY Lemma 8.5, pp. 86–87. PR.7's perfect/lisse F_p statement is too narrow; perfection of Frobenius is distinct from being perfect as a ring-module.
2. Assign the exact arc-descent input used by KY Theorem 7.25: Bhatt–Mathew Corollary 6.17 for p-complete bounded-p-torsion rings after inverting p. The packet does not invent an owner.
3. Arrange the precise C0 completed-untilt/condensed-coefficient, CR.5/DD.6 non-fine formal log and arbitrary-PD, CR.6 proper Cartier-type O_C rational Hyodo–Kato, and AI.1/DD.1 commuting-endomorphism cochain Koszul extensions. The requests retain the needed base, section, signs, degrees and completion bounds.

Revision 2 moves general fs log-adic Kummer foundations down from tier-16 T6 to tier-13 PR.8. Redirect `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-adic-space`, `/kummer-etale-site` and `/kummer-etale-higher-direct-images` to `PrismaticCohomology:PR.8/fs-log-adic-kummer-foundations`. The existing T6 source correction supplies DLLZ's negative Tate twist. Perfectoid saturation remains a distinct PR.8 log-diamond target. This review adds the exact D5 locally spatial pullback/fibre-product prerequisite and narrows the D4 request to quotient presentations. No higher-tier files were changed.

The public author PDFs remain accessible through the URLs and hashes in the packet and report. Full publisher-text access is not claimed. Package the accepted source-level plan with its honest dependency boundary; do not mark PR.8 closed until the gaps and supplier interfaces are discharged.
