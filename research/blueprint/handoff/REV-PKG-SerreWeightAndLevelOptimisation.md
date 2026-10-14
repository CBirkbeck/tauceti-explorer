# REV-PKG-SerreWeightAndLevelOptimisation handoff

Completed by Codex, session `codex-MF3ror`, for issue #9781 on 2026-10-14.
This is a complete independent package review, not a checkpoint. Verdict:
**accepted**, with the corrections in the package and the remaining
source-access limitation explicitly documented.

## Done

- Reviewed all 62 targets and six definitions; preserved all target anchors,
  58 API entries, 21 named definition tests and the conditional case manifest.
- Checked fifteen randomly sampled source nodes plus consequential boundaries
  and the inherited unverified Diamond input. Read eleven baseline declaration
  statements at Mathlib 082e2d3 and Tau Ceti f790474.
- Compared the mathematical objects against current TauCetiRoadmap
  0d144d044dacebca17b654695b6f1ad58f159b27 and current Tau Ceti
  a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, including the nine newer roadmap
  families and four specified Completed roadmaps. No target removals and no
  higher-tier notions moved. The analytic conductor dichotomy does not supply
  this package's residual support argument.
- Corrected five locators: Ribet conductor definition §2 p. 4 and Theorem 4.2
  pp. 8–9; localized sequences (7.2)–(7.3) p. 24; Corollary 3.2; Theorem 1.3;
  Wiese Theorem 10 without a part (a).
- Corrected five ModularForms contracts. This package owns the relative
  q-new comparison (2.2), the specialized Eisenstein valuations (4.4/4.6),
  depth decrease under U (4.5), partial-W/trace normalization (4.6), and the
  extension of newform coefficient-Galois stability to the actual cusp form
  (4.5). Added ℓ=3 imprimitive-character and ℓ=5 E₄/W computations.
- Recorded a 62-row adversarial pass, definition-test audit, source sample,
  signature audit, review.json and the detailed independent review report.

## Checks

- `lean-check` on package Suggested.lean: exit 0, exactly twelve sorry
  warnings, no errors or other warnings. Available memory was checked first.
  The unchanged file has 128 lines, two real-bodied light definitions,
  eight theorem signatures and four examples. No language server or Lake
  build/update/cache download was used.
- Packet checker on the unchanged accepted input: zero errors and warnings.
- All 62 README target anchors, all API names and internal links checked.
- Intake file check: zero problems. `git diff --check`: passed.

## What remains for later work

The inherited access gap is Diamond's *The refined conjecture of Serre*
(1995), Theorem 1.1, proceedings pp. 22–37. Wiese04 Theorem 10 and proof,
pp. 131–132, supply the exact conditional statement and identify the input;
an accessible complete primary proof was not established. The library index
does not clear those proceedings, and no uncleared copy was used. This
affects the general-character/higher-exponent/characteristic-three proof in
2.13 and conductor-level consumers 3.13, 4.8 and 6.4. Obtain an authorized
primary proof before treating that obligation as closed.

The 37 accepted-plan lower-tier extension requests remain explicit supplier
contracts, not assertions of existing implementations. They need their
owners' follow-ups. The five clarified ModularForms applications have named
owners here and do not require replanning upstream's existing targets.

Reconcile the older packet/reader with the five locator corrections and
these tighter application boundaries in an authorized later job. The packet,
older reader and all other jobs' files were deliberately untouched. The
review report contains the persistent evidence; scratch source files are
deleted after opening this job's PR. No further issue is claimed in this run.
