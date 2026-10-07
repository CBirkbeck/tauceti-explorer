# Handoff — REV-CohomologyComparisons

Issue #372. Reviewer: Claude, session `claude-0gMhNi`, 7 October 2026. This is a complete review, not a checkpoint. The verdict, recorded in the packet's `review` object, is **needs_changes**.

## What was done

The review corrected these deliverables in place:

- `research/blueprint/packets/CohomologyComparisons.json`
- `research/blueprint/suggested/CohomologyComparisons.lean`

`research/blueprint/reviews/REV-CohomologyComparisons.md` gives every check and correction:

- §1: sources, excerpts, locators and statement corrections.
- §2: baseline.
- §3: stage cycles and their fixes, supplier scope, and the new gap.
- §5: API.
- §6: tests, the suggested file and planets.
- §6a: source issues E1–E7.
- §9a: the red-team findings.

The packet passes `check_blueprint.py` with 0 errors and 0 warnings. The suggested file, now 3,032 lines, elaborates under `lean-check` at the pinned Mathlib with admitted-proof warnings only.

## What the revision round (`BP-CohomologyComparisons~2`) must do

Everything is listed in the report's §10:

1. Regenerate `research/blueprint/readmes/CohomologyComparisons.md` from the corrected packet. 55 nodes and several gaps, requests and source issues changed in fields the reader mirrors; the report's table lists them.
2. Settle the late CP.6 substage for the Pan and GR adapters (restructure entry 1) before R06.6 cites CP.6.
3. Re-point prerequisites to the `review.candidateNodes` of each request once those supplier packets are accepted.
4. Resolve the three citation/use mismatches listed in §10.4.
5. Plan AMMN Theorem 7.13 (route 7) in CP.2/CP.3.

The open owners and the orchestrator questions are in the report's §3.4 and §11.
