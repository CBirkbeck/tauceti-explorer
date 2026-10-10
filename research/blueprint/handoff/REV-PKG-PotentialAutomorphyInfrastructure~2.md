# Completed second package review: PotentialAutomorphyInfrastructure

**Codex — codex-QiWdWR**, 2026-10-10, issue #7940,
`REV-PKG-PotentialAutomorphyInfrastructure~2`. Verdict: **needs_changes**.
This is the completed independent review, not a checkpoint. This session wrote
neither author round and claims no further job.

## Delivered

- Full report:
  `research/blueprint/reviews/REV-PKG-PotentialAutomorphyInfrastructure~2.md`.
- Replaced the package's review object with this round's verdict and receipts.
- Replaced `import Mathlib` with individual Mathlib module imports; all existing
  local declarations still elaborate.
- Corrected the auxiliary-field citation to the published BLGGT anchor matching
  pp. 600–601.

All 123 accepted targets, 122 API names and 90 checks remain in the README.
The additional auxiliary-field theorem is supported by CHT Lemmas 4.1.1–4.1.2,
pp. 116–117, and BLGGT Appendix A.2, pp. 600–601. The six-layer order, rational
versus integral duality and supplier ownership are preserved.

## What the revision still requires

Start with the report's stage table and sixteen missing definition names.
Only thirteen definition cores and `shifted_partition_recovery` have target
declarations; every other accepted theorem target lacks a signature. Of the
packet's API names, 45 are explicit declarations and one is a generated
projection. Only 42 of its 90 named checks have labelled examples. These are
presence counts: several present declarations are local cores and still need
the actual arithmetic adapters.

In particular, unit/valuation character uniqueness is not continuous Galois
character uniqueness; an integer Hida row is not a derived twisted complex;
finite flag-index arithmetic is not a cohomological trace comparison. The new
auxiliary-field theorem also needs a signature. Obtain the actual owner-typed
spaces, coefficient lattices, smooth categories, Galois and automorphic objects,
and patched complexes, then state the arithmetic constructions and comparisons.
Keep all actions, hypotheses, rings, twists and shifts. Do not use arbitrary
propositions or duplicate the existing general supplier theories.

The revision author's handoff says representative-only coverage was permitted.
That exception is absent from the current author/review issues and checked-out
PROTOCOL sections 13 and 20. The report explains the governing distinction
between the non-exhaustive prototype header and the specified targets/API/tests.

## Current upstream notes for the maintainer

Checked TauCetiRoadmap main at
`dea8191cc6047d6142a65872ebce6eeeb841a29b`.
SR.6.5 owns stable-operator localization; its README names
`StableOperator.invertiblePart` and `dual`, while its Suggested.lean states only
the definition, `split`, and elementary stability cases. Treat those two
interfaces as planned supplier work, never implemented declarations. No change
was made to that upstream roadmap.

IHG §2.3 supplies finite factorial projectors and derived operator localization;
RG2.3 supplies integral GL/Iwahori/pro-p Iwahori subgroups; RG2.4 owns general
Bruhat theory. The arithmetic tower and compact-cell adapters remain here.
The characteristic-zero representation roadmaps supply no integral dual-Weyl
lattice. The auxiliary-field target replaces the former upward PL.0 dependency;
higher consumers should import this lower owner, as the author's handoff records.

## Verification receipts

- Final `lean-check research/blueprint/packages/PotentialAutomorphyInfrastructure/Suggested.lean`:
  exit 0, 97 `sorry` warnings, zero errors and zero other warnings. More than
  20 GB memory was available; checks ran sequentially through the shared
  wrapper. Exact Mathlib commit
  `082e2d37e8b0463410cdb532e111cd43d5a66174` was read and confirmed.
  No Tau Ceti import is exercised by this Mathlib-only file. The wrapper is
  configured for the pinned shared build; no project or library was built.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PotentialAutomorphyInfrastructure.json`:
  zero errors and zero warnings; 123 nodes, 29 definitions, 94 theorems,
  122 API items, 90 checks, seven gaps and 36 requests.
- README: 199,597 UTF-8 bytes. Metadata is exactly `topic = "math.NT"` plus
  newline. No process references found in README.
- Intake `check-files`: five files, zero problems. All five changed paths belong
  to this job; its complete-review deliverable check passes.
- Accepted packet SHA-256:
  `eb472418e07c0614e6ee0a0b34e57306c769ff2444e5891ab1858cd924303650`.
- Final README SHA-256:
  `9618d2b39c000e2dfa9f8de13262cbffa4a6ffd7ae768a74a7fc56621504ff5b`.
- Final Suggested.lean SHA-256:
  `a2913c6d09c465a279f23b86849ee954d6857638e7fd5b83c7057ba83867d398`.

Accepted inputs, original reader/suggested file, other handoffs, atlas and
upstream checkouts were not edited. No restricted-library work was used or
copied. Scratch comparison scripts and logs are disposable; this report and
handoff retain the findings and receipts needed by the next author.
