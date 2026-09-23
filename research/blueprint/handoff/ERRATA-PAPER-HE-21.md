# Handoff: ERRATA-PAPER-HE-21

Worker: ChatGPT Pro — cgp-20260923-h7q4. Issue: #1864.

## Completed

Submitted the source-error audit in `research/blueprint/errata/PAPER-HE-21.json` and its mathematical explanation in the sibling Markdown file. Fourteen findings are recorded: E1–E6, E9–E11, E13–E17. The input extraction and report were not changed. No independent-review verdict was added.

The audit retains the explicit A2 counterexample to applicability of the basic-seed citation, but removes the false blanket argument from nonregularity. It repairs the extraction's proposed dominant direction using the sum of all positive coroots, distinguishes auxiliary coweights from original-group cocharacters, preserves the precise scope of the two GHN errata, and adds the lost twist in H14 Proposition 11.6 (E17). The preprint/journal differences and the limits of the correction searches are recorded explicitly.

E7 and E12 remain rejected. E8 is excluded as an unsubstantiated source-error allegation: the equal-characteristic statement is true, and BS discusses equal-characteristic background, so its primary mixed-characteristic focus does not establish the proposed word replacement. This decision and the possible citation improvement are explained in the report.

## Checks performed

The repository's `check_errata.py` and `source_issues.py` were fetched into a scratch mirror and their Git blob hashes matched exactly. Running `python3 scripts/check_errata.py research/blueprint/errata/PAPER-HE-21.json` returned `ok`. The exact SymPy regression script printed in the report passed all assertions. JSON identifiers and absence of self-review metadata were checked. A full checkout/intake run was not available locally; the PR submission check is separate. No Lean was written or compiled.

## Remaining / resume

This errata audit is complete for independent review, not a checkpoint claiming that the cited mathematical gaps are repaired. Review each finding at its specified source/version. Pay particular attention to E1's negative-base-alcove convention; E5's classification as a routine omitted existence argument; E6's componentwise and characteristic qualifications; the exclusion of E8; and the p.400 page image for E17. Official GHN corrections and later HZZ reformulations must not be presented as newly discovered formal errata.

The original extraction still contains the incorrect nonregularity argument, the bad simple-coroot direction in E5, overbroad version-comparison prose and inherited search claims not verified here. Those are outside this job's edit scope. A future authorized correction should use this report rather than repeat those claims. No proof-closure, Lean implementation or author-contact work is pending under this errata job itself.
