# Review handoff: probabilistic, metric and ergodic number theory

Job `REV-PKG-ProbabilisticAndMetricNumberTheory`, issue #10909. Codex (GPT-6), session `codex-h5Vkdx`, 20 October 2026. Branch `codex-h5Vkdx-review-probabilistic-metric`. Claim confirmed by the bot at issue comment 6298956805, responding to claim comment 6298953208. Independent of package author `codex-O6ujTl`.

**Complete; accepted.** This run reviews exactly this package and takes no second issue. The full evidence and limits are in [the review report](../reviews/REV-PKG-ProbabilisticAndMetricNumberTheory.md); `packages/ProbabilisticAndMetricNumberTheory/review.json` records the accepted verdict.

## Changes

- Corrected additive source locators to Elsholtz–Tao Appendix A, physical pp.37–38; strong additivity is defined in Lemma A.3 on p.38, not before it on p.39.
- Kept the N≥2 Turán–Kubilius signature and explained its direct N=2 calculation, since the cited lemma states N>2. Sharpened the normal-order discussion locator.
- Fixed the equal-child-mass Check to say exactly two children. Added three-equal and unequal-weight controls.
- Added the review report and verdict. Lean, metadata and accepted packets are unchanged. No ownership moves or new duplicate removals.

## Checks and review scope

Read the full package and both accepted packets, the reviewed library audit and two upstream roadmap models (ArithmeticDirichletSeries and Exchangeability). Independently counted 415 targets, 177 API entries, 164 packet tests and 39 definition/construction entries, each with at least three tests. Six native Haar/Fourier targets are already confined to the boundary; 409 remain in the layers. Checked all target statements and conventions adversarially; the report records the cases across all 51 topic groups and the sensitive Lean/README comparisons.

Random locator sample: 15 distinct nodes, selected with `random.Random(10909).sample` from parent then continuation order. Read each cited location, including secondary sources. There were no individually flagged unverified locators. Corrected the one wrong source page family found. Public sources only; checked the cleared-library index and did not acquire an uncleared Harman or Falconer copy. No source passages were placed in the repository. No suspicious instruction was encountered.

Current upstream checked read-only: TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including post-snapshot and Completed roadmaps. No additional retained duplicate found. In particular, current L1 mean ergodic convergence still assumes an L2 observable; moment determinacy is not a moment-convergence theorem; the native power-gauge bound is not the arbitrary-gauge mass-transference interface. Seven supplier contracts remain exact and unchanged. The Layer 2 normality dependency on Layer 4 is acyclic.

- Package `lean-check`: exit 0, 56 expected sorry warnings, no other warnings/errors; 821 lines, 31 real-bodied light definitions, 55 theorems, one admitted Prop-valued probability instance, 34 proved examples.
- Independent native-API audit: 232 unique declarations at the implementation pins resolve; `lean-check` exits 0 without warnings. Printed types were read.
- Both `scripts/check_blueprint.py` packet runs: exit 0, zero errors/warnings.
- `scripts/check_sorry_data.py`: exit 0.
- `research/blueprint/intake.py check-files` on the four changed deliverables: 0 problems.
- `git diff --check`: passed.

## What remains

No package-review task remains. Proceed to the maintainer's draft TauCetiRoadmap PR workflow after intake. Acceptance is of the roadmap, not its formal implementation or all original analytic proofs. The nineteen inherited target-level proof/source obligations are preserved and enumerated in the review report and original package handoff; none was silently discharged. Their proposed constructions and comparisons still need formal proofs in Tau Ceti. No packet or source-observation verdict was changed.

The issue's atlas pull request is submitted from the session branch with `Refs #10909`. Check Swarm submission on that PR and fix any mechanical failure on the same branch. Job scratch is removed after the PR opens; this note and the report contain all evidence needed by the next worker.
