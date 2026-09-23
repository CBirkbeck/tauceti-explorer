# Handoff: REV-ERRATA-PAPER-KISIN-MADAPUSIPERA-SHIN-22

Issue #1798. Codex — `codex-a71f92`, 23 September 2026. **Partial checkpoint; not a completed review.**

Claim comment 5796593778 was explicitly confirmed by bot comment 5796596252. The original errata is by cc-fb70e5; the extraction is by codex-c83e7a/cc-fb70e5/cc-442dc5. This worker did not author those findings.

## Saved

- Errata JSON and report: all seven original findings independently checked in the exact named 41-page author PDF, with page-image checks and detailed local arguments.
- Refined E1's valuation counterexample for every c; geometric-torus wording and scope for E2; external-source limitation for E4; E5's classification, direct-product obstruction and kernel/descent argument; E6's stated-result reach and infinite-field counterexample; E7's actual monoid-map obstruction.
- Added E13, the failed block-similitude construction in §2.2.7, with the explicit GSp₂ example. E8–E12 are reserved for the extraction's existing findings.
- No `review` objects and **no final report under `reviews/`**. File existence there would incorrectly complete this partial job.

## Resume

1. Obtain the published Duke text, DOI 10.1215/00127094-2021-0063, through a public or authorized source and collate the passages. Publisher article/PDF and Crossref download links returned challenge HTML, not the article. No restriction was bypassed.
2. Independently verify and reconcile the newer extraction's E8–E12. They were read as recorded findings, not accepted on another worker's authority. The original errata's assertion that the ordinary-class and Tannakian concerns were only open questions is stale.
3. Obtain Noot, JLMS 79 (2009), 53–71, DOI 10.1112/jlms/jdn049, §2.3. The local circular-definition check is done, but the older report's external comparison is not independently verified. The author's page links to the publisher; the discovered PDF returned 403.
4. Complete E13's repair audit through the following lift, centralizers and quotients. Its explicit failure as printed in the author PDF is established; the whole repaired proposition is not.
5. Refresh the correction search; then add supported per-finding verdicts and the final review report.

The errata report gives source URLs, complete SHA-256 hashes, read coverage, counterexamples and proof details. No PDFs or machine-local scratch paths are committed. No queue, extraction, generated register or atlas edits. Lean: not applicable.

## Validation

- Errata checker: eight findings, no errors.
- Intake file check: all three deliverables pass.
- Relevant unit suites: 65 tests pass (3 errata-schema, 4 register, 7 source-issue, 29 intake, 22 issue tests).
- In-memory collector check: eight findings remain awaiting review; no final review file exists and no verdict is emitted.
- Independent arithmetic checks pass for the decency valuation, GL₃ Weyl counterexample, unequal block multipliers and dual-number automorphism. These are sanity checks, not Lean proofs.
