# REV-PKG-DiamondsAndVStacks

Completed independent review of issue #7513 by Codex (GPT-6), session
`codex-kOJMv9`, on 9 October 2026. The bot confirmed this session's claim in
issue comment 6073135166. This is a completed review with verdict
**needs_changes**, not a checkpoint.

## Delivered and corrected

- `reviews/REV-PKG-DiamondsAndVStacks.md`: all six criteria, the mathematical
  and source checks, source receipts, a complete 90-target crosswalk, and the
  precise required revision.
- `packages/DiamondsAndVStacks/review.json`: `needs_changes`, reviewer
  `independent-review-REV-PKG-DiamondsAndVStacks`, date 2026-10-09.
- Package README: corrected D0.17's qc-terminal implication to require a qc
  terminal object; rewrote 22 close-to-source target paragraphs, separated
  concatenated hypotheses, restored `StoneCech` and made tag 02UW explicit.
- Suggested.lean: synchronized the 49 comment-only target statements with the
  README in own words. Every active declaration, import and example is unchanged.
- Metadata was checked and left as the single line `topic = "math.AG"`.

## Checks

The README is 186,602 bytes, and retains all 90 targets, 213 APIs, 116 tests
and 606 prerequisites. All 112 anchors are unique and internal links resolve.
The accepted packet checker reports zero errors and warnings. The final
`lean-check` exits 0 with no errors and 95 warnings, all declaration uses
`sorry`, at Mathlib `082e2d3`. Active Lean code agrees with the input after
removing comments. All eleven public PDF hashes match the accepted receipts;
source receipts and lasting findings are in the report. No source text is
submitted. No Lean process remains running.

## Next work

No work on this independent review remains. Route a package revision using
this report: 126 enumerated API signatures, 96 complete tests and 49 named
targets remain comment-only. The file's successful compilation and honest
ledger do not discharge PROTOCOL sections 13 and 20's specified signature
requirement. Keep the full mathematical scope and owner boundaries; supply
actual carriers/interfaces and types rather than opaque propositions or
removing targets. The seven accepted proof gaps and six supplier requests are
not themselves the reason for the negative package verdict.

The read-only accepted packet was not changed. RS-05's stale canonical
compactification owner row is an already recorded maintainer synchronization
issue; the package correctly keeps general compactification at C4. Scratch
contains no lasting dependency and can be deleted after submission. Only this
one issue was claimed; this worker stops after opening its pull request.
