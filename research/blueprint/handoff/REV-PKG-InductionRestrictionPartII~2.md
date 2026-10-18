# REV-PKG-InductionRestrictionPartII~2 — complete

Refs [#10391](https://github.com/CBirkbeck/tauceti-explorer/issues/10391).
Codex, session `codex-Gl4gSC`, 18 October 2026.

**Accepted with fixes.** Read the complete revised package against the previous review,
retained accepted plan, source texts, pinned APIs and current upstream/library. The detailed
evidence, fifteen-locator sample, per-statement adversarial pass and reproduction bounds are
in [the review report](../reviews/REV-PKG-InductionRestrictionPartII~2.md).

The revision correctly imports the 43 overlapping IG targets and the additional RS.0
supplier material. The authoritative supplier is TauCetiRoadmap PR #850 at
`164e3b19e90ef83d80c3c51722ad429cedfc7f02`. Current main and library were checked at
`0d144d044dacebca17b654695b6f1ad58f159b27` and
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` respectively.

This review removed one further overlap: `parityWeightEnumerator` and its coefficient and
evaluation-at-one API are supplied by current Tau Ceti's
`InformationTheory/Coding/Weight/Enumerator.lean`, specifically `Set.weightPolynomial`,
`Set.coeff_weightPolynomial` and `Set.eval_one_weightPolynomial`. Removed the local Lean
definition and two examples. RS.4.18 now retains the lower-bound translation and its exact
integer-degree counting series, with the supplied integer-coefficient polynomial. Its current
library carrier is absent at the pins, so the consumer remains in README and the closing
Lean list. No target was moved to a higher roadmap.

Other corrections: concrete multiclass normalization and negative-degree Checks; explicit
factor-set action compatibility; lift-square lemma scoped to match its empty-class examples;
a C14-to-C2 sign witness in prose and Lean; nonzero square-column and both-coordinate parity
Checks; three checks for each semidirect-product adapter; multiplicative ZMod convention;
and the natural exterior-square/Künneth proof route. Wood's author link was updated.
All thirty-one Table 2 values are unchanged. No ordinary Schur-cover certificate is claimed
to have been computed; the order-96 model enumeration checks its order, marking and generation.

Validation: final `lean-check` exit 0, 37 `sorry` warnings only, 375 lines;
`check_sorry_data` clean; unchanged packet checker zero errors/warnings;
78,050 independent finite assertions passed; intake `check-files` zero problems;
`git diff --check` clean. The report records the downloaded source identities and explicitly
distinguishes browser-only access and unavailable journal PDFs. All repository prose is in
the reviewer's own words; source files and scripts remained disposable scratch.

No work remains on this review. The maintainer can use the accepted package for the upstream
draft PR. The earlier revision handoff's downstream retargeting list remains applicable and
belongs to those packages' owners. Historical packet/readers were not edited, nor was another
job's disposition. This run claimed only #10391 and opens one pull request, then stops.
