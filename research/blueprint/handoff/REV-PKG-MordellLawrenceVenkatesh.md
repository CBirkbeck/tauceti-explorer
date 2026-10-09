# REV-PKG-MordellLawrenceVenkatesh — completed review

Issue #7525; Codex (GPT-6); session `codex-oL0Zr0`; 2026-10-09.
Claim confirmed by the bot in issue comment 6073142353. Branch:
`codex-oL0Zr0-review-mordell-package`. This worker did none of package job
#7493 and claimed no second job.

The independent review is finished. Its verdict is **needs_changes**, recorded
in `packages/MordellLawrenceVenkatesh/review.json`. This is a completed review
submission, not a checkpoint. The full evidence and revision requirements are
in `reviews/REV-PKG-MordellLawrenceVenkatesh.md`.

Read the full accepted plan and package, compared all 146 targets, 261 API
contracts, 100 mathematical tests, 715 prerequisite occurrences, 76 supplier
contracts and 39 milestones, and inspected the cited baseline declaration
headers. Checked the upstream models and selected public source statements;
the report distinguishes this correspondence audit from a fresh full audit of
all source proofs. No restricted source was used or copied.

Corrected the README's CM relative-degree bound, period-variety quotient
condition, fibre-transport notation and hypotheses, Kummer roots-of-unity
hypotheses, malformed headings and punctuation. The final reader has 197848
UTF-8 bytes. All API/test wording and source locators remain unchanged.
Suggested.lean, metadata and the accepted packet were left unchanged.

Validation:

- Packet checker: zero errors and warnings.
- Independent `lean-check` on Suggested.lean: exit 0, 136 warnings, all
  declaration-uses-`sorry`; no errors or other warnings. Used the existing
  shared build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  The file has no Tau Ceti imports, so their elaboration was not exercised.
- Independent active-name audit: 120 named declarations and 32 examples;
  68/261 required API names active and 27/100 required tests labelled.
  Comment catalogues were excluded from those counts.
- Structural correspondence, submission file checks and whitespace checks
  pass; metadata is exactly the single `math.NT` line.

The next owner should resume at the report's required Lean revision, using
the complete README and accepted supplier contracts. Supply the missing
carrier interfaces, geometric/arithmetic comparisons, 193 API signatures,
73 named examples and omitted named theorems, then strengthen the partial
adapters and rerun `lean-check`. The 79 mathematical gaps were already
recorded by the accepted plan; do not conceal them with proposition
placeholders, arbitrary carriers, axioms or conclusions stored as fields.
There is no unfinished review step for this session.
