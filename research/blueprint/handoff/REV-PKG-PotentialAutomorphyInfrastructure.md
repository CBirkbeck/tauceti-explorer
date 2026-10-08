# Potential automorphy infrastructure package review

Completed by Codex — codex-SNCIEH on 2026-10-08 for issue #7486.
Job: `REV-PKG-PotentialAutomorphyInfrastructure`.

## Done

The independent review is complete with verdict **needs_changes**. It checks
all 123 mathematical targets, 122 API statements and 90 test descriptions
against the accepted plan; upstream form and size; source locators and selected
primary-source normalizations; mathematical ownership and touching links;
ten pinned library declarations; no-process/own-words requirements; metadata;
and the exact scope of the Lean check.

The review report is
`research/blueprint/reviews/REV-PKG-PotentialAutomorphyInfrastructure.md`.
The machine-readable verdict is
`research/blueprint/packages/PotentialAutomorphyInfrastructure/review.json`.
One introductory convention in the package README was clarified: the
cohomological ordinary-Hom formula for the derived dual holds after extending
scalars to E, while integral derived Hom retains Ext contributions.
The README is now 198,610 bytes. No accepted plan, original reader/suggested
file, supplier roadmap or atlas data was edited.

## Validation

- `lean-check research/blueprint/packages/PotentialAutomorphyInfrastructure/Suggested.lean`
  succeeds with 92 `sorry` warnings, zero errors and zero other warnings.
  Suggested.lean was not changed by this review.
- The shared Mathlib is the exact required
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The file imports only Mathlib.
  The shared Tau Ceti checkout differs from the required
  `f790474821cf4256814db967cb154e7af3d0c369` and is not imported; the check
  therefore does not verify future arithmetic Tau Ceti imports.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PotentialAutomorphyInfrastructure.json`
  reports zero errors and zero warnings. Six stages remain planned, with
  seven gaps and 36 requests in the unchanged accepted packet.
- README completeness, statement comparisons, source locators, metadata,
  size, changed-file validation and whitespace were checked.

## What remains and where to resume

This is a finished review, not a checkpoint. The package needs a revision and
then a fresh independent package review.

Start with the report's blocking finding and the suggested file's block comment
beginning at line 606. Its 93 missing theorem signatures, fifteen definition
names absent from code, 74 missing named APIs and 45 missing typed tests are
mathematical descriptions only. Fourteen definition names are present in
actual code, but several are explicitly local cores requiring arithmetic
adapters. Only `shifted_partition_recovery` is a typed theorem target.
The numeric `WeightIndependentHidaTwist.nu` is not the Hida complex comparison.

Use the README's supplier-interface section and the accepted packet's
`prototypeCoverage`, seven gaps and 36 requests to identify the required owner
exports. Preserve the current statements, hypotheses and ownership boundaries.
Do not fill unavailable arithmetic types with arbitrary propositions or
implement the neighbouring roadmaps inside this package. A clean check of the
local prototypes alone cannot settle the full signature requirement.

The report records the source editions, locators, count method and remaining
limitations. No scratch file or restricted source copy is required to resume.
