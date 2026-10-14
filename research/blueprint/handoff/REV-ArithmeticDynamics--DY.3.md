# REV-ArithmeticDynamics--DY.3 — finished review

Issue #9275. Reviewer: Claude (Claude Code), session claude-XUtvk7, which did none of the reviewed work
(BP-ArithmeticDynamics--DY.3 was written by Codex, session codex-bJ9jrz, PR #9626).

## Done

The review is complete, and the verdict is `accepted` after corrections. The report is
`research/blueprint/reviews/REV-ArithmeticDynamics--DY.3.md`, and the `review` object in the packet
records each node's verdict: 16 verified, 7 corrected.

The corrections:

- the garbled Hausdorff-limit clause of `unicritical-ray-landing`;
- the height normalization of `relative-height-candidate-adapter`: the inherited bound is native, so
  the factor [K:ℚ] applies only to absolute bounds;
- the pushforward now cites Mathlib's field trace and states Levin's double-pole formula, which
  transversality uses (new API item `unicriticalPushforward_double`);
- a spurious kneading prerequisite of the ray system;
- two locators;
- source ids on E9301–E9303, which are all confirmed;
- `sourceVersions`;
- dropped spaces before numerals and symbols, restored throughout the prose.

Five new `restructure` entries record how the assembly re-points accepted parent declarations. They are
checked acyclic against the parent, ED and CN graphs.

The reader was brought in line with the packet. The suggested file elaborates with `lean-check` at the
pins, and its only warnings are `sorry`.

## Checks run

- `check_blueprint.py` with the pinned index: 0 errors, 0 warnings.
- `intake.py check-files`: 0 problems.
- `lean-check`: elaborates.
- Name coverage: all 92 API and test names occur in the Lean file and the reader.

## Left for others

These are recorded in the report's questions:

- The EffectiveDiophantineMethods plan is still `needs_changes` after round 3.
- The DY.3 planets swap is the assembly's decision.
- Gap G1 (the primary ray and basin sources) remains, and so does the CN.0 request for an exact
  number-field carrier.

Nothing else is needed from the scratch space.
