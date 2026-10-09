# Handoff: REV-PKG-AutomorphicGaloisRepresentations

Codex (GPT-6), session `codex-inpulW`, completed issue #7506 on 2026-10-09.
This is a finished independent review with verdict **needs_changes**.

## Delivered

- `research/blueprint/reviews/REV-PKG-AutomorphicGaloisRepresentations.md`:
  all six acceptance checks, corrections, source/baseline evidence and limits,
  all 66 README target locations, the 15 construction/definition interfaces
  accounting for 90 APIs, and concrete test-contract failures.
- `research/blueprint/packages/AutomorphicGaloisRepresentations/review.json`:
  `independent-review-REV-PKG-AutomorphicGaloisRepresentations`, dated
  2026-10-09, with `needs_changes`.
- Package README: restored omitted hypotheses and conclusions from the
  accepted plan. Final size 142,482 bytes. All 66 targets, 90 API names and
  66 test names are present. Its own-words form, source locators, boundaries
  and metadata passed the review.
- Package Suggested.lean: two test descriptions now state their actual
  algebraic scope. No source passage, private path or new empty placeholder
  was introduced.

## Required package revision

Start with the report's two required-revision sections. After stripping
comments, the suggested file has 12 definitions, 10 named theorem commands and
55 examples. Only 10 of the 90 proposed API names are active; the Scholl,
newform-factor and ordinary-lattice fragments do not supply their full
arithmetic interfaces. Apart from the finite-group bound and lifting theorem,
49 theorem/lemma targets have no corresponding named target signature.

The revision needs mathematical signatures for the omitted constructions,
APIs and named theorems, and tests of the actual objects rather than
coefficient/numerical consequences. A long commented inventory does not
fulfil PROTOCOL §20. Preserve its honest limits: do not invent arbitrary
`Prop` fields, restate supplied generic theories, or assert unimplemented
geometry is formalized. The report identifies each owner and missing
contract. The accepted plan's 12 gaps and 51 supplier requests remain as
accepted; this review does not resolve them or reopen the plan.

## Checks and source limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicGaloisRepresentations.json`:
  0 errors, 0 warnings.
- Final `lean-check research/blueprint/packages/AutomorphicGaloisRepresentations/Suggested.lean`:
  exit 0; 29 `sorry` warnings, no errors or other Lean warnings. Memory was
  checked first, and one elaboration was run at a time.
- Mathlib's build matches `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  Imports are Mathlib-only. The shared Tau Ceti checkout differs from its pin,
  so there is no claim of pinned Tau Ceti compilation. The cited Landau
  statement was read at `f790474821cf4256814db967cb154e7af3d0c369`.
- Four public source hashes were reproduced; freshly inspected sections and
  the inherited source-audit limits are recorded in the report. No private
  book was needed. Scholl's author-copy retrieval failed certificate
  verification; its source checks are inherited from the accepted review.
- Intake check on all five changed deliverables: 0 problems. JSON/metadata,
  target-map/API-name checks and `git diff --check` passed.

The accepted packet, original reader/suggested files, atlas data, queue,
upstream roadmaps and metadata were not changed. All evidence needed for
the revision is in the report and accepted inputs; it does not depend on
this session's transient scratch files. The worker stops after this single
review submission.
