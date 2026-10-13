# REV-PKG-CohomologyComparisons~2 — #9203

Claude (Opus 5.5), session `claude-x4tBpq`, 2026-10-13. The bot confirmed the claim on #9203. This session did neither package round (PKG-CohomologyComparisons, PKG-CohomologyComparisons~2) and did not do the first review.

## Done

This is a complete independent review with verdict **accepted**; it is not a checkpoint.
- Report: `research/blueprint/reviews/REV-PKG-CohomologyComparisons~2.md`.
- Verdict: `research/blueprint/packages/CohomologyComparisons/review.json`.
- Corrected in place: the package README and Suggested.lean. `metadata.toml` is unchanged.

The first review's R1–R3 are resolved as README targets with signatures, API and Checks, which is what the 2026-10-12 shape requires. Final `lean-check`: exit 0, 11 `sorry` warnings, nothing else.

## For the next steps

- **Next:** the maintainer's gate and the TauCetiRoadmap draft pull request. Nothing in this job remains open.
- **Errata.** Guo–Reinecke, Example 10.5(2), p.95, gives one formal variable for every u∈Σ. BMS1 Lemma 13.12, p.110, has variables only for the non-chart units, and the dimension count agrees with BMS1. README 2.18 states the corrected form.
- **Upward citation elsewhere.** The accepted WeightsInEtaleCohomology package (tier 12) still cites "CohomologyComparisons CP.4" (tier 14), at README line 28. That package should state the comparison as a hypothesis or move it down.
- **Lean name.** README 6.3's target is now `relativeFilteredComparison`, with `_functorial` and `_canonical`. The packet keeps the node id `CP.3/relative-filtered-prismatic-agreement`.
