# Handoff: REV-RT-PAPER-DUKE-IMAMOGLU-TOTH-16

- Agent: ChatGPT
- Session: `gpt6-c84e12`
- Issue: #4117
- Date: 2026-09-30
- Status: sixteen finding-level verdicts completed; submitted for independent intake, not an acceptance of the original extraction.
- Claim: comment 5909475680; bot acknowledgement 5909477857. No overlap with the recorded extraction/review/red-team authorship.

## Deliverables

`research/blueprint/redteam/RT-PAPER-DUKE-IMAMOGLU-TOTH-16.review.json`

`research/blueprint/reviews/REV-RT-PAPER-DUKE-IMAMOGLU-TOTH-16.md`

`research/blueprint/handoff/REV-RT-PAPER-DUKE-IMAMOGLU-TOTH-16.md`

## Result

15 confirmed, 1 rejected (finding 8). The rejected finding requests blanket planned-status changes without resolving the genus and normalization scope of the existing aggregate rows. Confirmed findings carry explicit limitations on the remedies: add the missing 3/16 in the half-weight Laplacian adapter; implement real errata canonicalization rather than expecting ID renaming to deduplicate; preserve old review judgments; do not recreate library declarations that remain in the baseline; keep approximate numerical fixtures separate from exact theorems. Correct item 150 to 155 in the primitive-character consumer locator.

## Checks actually run

The repository checker was transcribed without modification and its Git blob hash verified as `c736ae33fd46ec11c6e718be27479d9d5a520211`. Ran:

```text
python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-DUKE-IMAMOGLU-TOTH-16.review.json
```

Result: `ok`, using an explicitly ID-only input projection for the review branch. This was not a checkout-wide run. Supplemental assertions checked exactly 16 unique IDs and the 15/1 verdict totals. Independent Python/SymPy checks passed for the discriminant counterexamples, Laplacian conjugation, norm scalar arithmetic, four Table 2 products and the quarter/half eigenvalue shifts. Full-input intake/CI results should be read on the PR; they are not assumed here.

No Lean compilation. The sandbox had no existing pinned Lean build and insufficient memory for the repository's compilation preflight. The single attempted shallow clone failed DNS; source inspection proceeded through the connector. No second clone, repository snapshot, dependency installation or full atlas rebuild was attempted.

## Provenance and access limits

Review snapshot: `cc9d0f2a873a9ab218ad1b9474623364271aedb8`. Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. The report lists the directly opened files and source pages.

The published PDF was read through page/text tools but its byte download failed: no fresh PDF hash or preprint collation is claimed. The QM packet exceeded the connector content limit. The report uses directly inspected stage descriptions for that ownership overlap and does not certify full QM/CA leaf contracts. No original-paper extraction completeness claim, exhaustive library-absence claim or re-adjudication of all source errata is made.

## Next action

Intake should consume these verdicts, then assign repairs only for confirmed core defects using the report's corrected scope. Leave finding 8's blanket status edit unapplied; add explicit supplier imports and split residual adapters before reconsidering statuses. Keep source-issue identity/provenance repair distinct from adjudicating the historical E5/E6/E11 disagreements. This submission changes no source extraction or generated register.
