# Handoff: REV-PKG-VectorBundlesAndIsocrystals

Completed independent package review for [issue #7542](https://github.com/CBirkbeck/tauceti-explorer/issues/7542).
Agent: Codex; session: `codex-invgaU`; date: 2026-10-09. The claim was confirmed
by the bot before work began. This session did none of the package authorship.
The job is finished with verdict **needs_changes**, not a checkpoint.

## Done

- Compared all 127 accepted targets, 168 API entries and 124 tests/examples
  with the package reader, including source locators, hypotheses, ownership and
  prerequisites. Reader target transfer passes.
- Inspected actual executable Lean content separately from contract comments.
  The signature check fails on concrete false universal statements. The
  [review report](../reviews/REV-PKG-VectorBundlesAndIsocrystals.md) contains
  the named blockers, counterexamples, required repairs, distinction between
  legitimate omissions and false prototypes, source hashes and pin evidence.
- Corrected README Lubin–Tate ownership, added the GLX §5.1, pp.31–32 consumer
  locator and corrected its v3 length to 56 pages.
- Corrected `PureModel.bounded` and its unit example to finite-submodule
  p-power commensurability, following KL Definition 7.3.1, p.147.
- Wrote [review.json](../packages/VectorBundlesAndIsocrystals/review.json)
  with the completed `needs_changes` verdict and the exact independent-review
  identifier.

## Validation

Both accepted packet checks return exit 0, no errors or warnings. Final
`lean-check research/blueprint/packages/VectorBundlesAndIsocrystals/Suggested.lean`
returns exit 0, no errors, 231 warnings, all uses of `sorry`. Four isolated
ordinary counterexample checks return exit 0 without `sorry`, errors or
warnings; their complete Lean text is preserved in the review report.
Reader size is 193,499 bytes; all 127 anchors are unique, local links resolve,
metadata is the exact single `math.NT` line, JSON/TOML parse, submission-path
checks pass and whitespace checks pass.

Mathlib is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`. Shared Tau Ceti
HEAD differs from `f790474821cf4256814db967cb154e7af3d0c369`, but all seven files
in this suggested file's actual Tau Ceti import closure are byte-identical to
that pin. All 29 baseline statements were read independently at the specified
Git pins. Memory checks passed; no Lean process was left running.

## Where the package revision should resume

Use the required-signature-revision section of the report. Start with
`FundamentalExactSequence`, `SlopeZeroLocalSystems`,
`AnnularBasisApproximation` and `TorsionVsHomVanishing`: the separate checked
counterexamples already refute their unrestricted types. Then inspect the
other arbitrary-category equivalences, invariant identities, openness
statements, base-change definitions and their tests. Preserve expressible
rank, compatibility and exactness hypotheses in any retained ordinary
component. Where the geometric carrier is unavailable, keep the complete
named contract explicitly omitted instead of asserting a false universal
type or introducing theorem-valued placeholder data.

No further work remains for this review job. The package needs a substantive
signature revision and another independent check. The accepted packets,
component suggested files, atlas data, links and upstream documents were not
edited. Scratch source downloads and logs are disposable; all information a
later worker needs is in this note and the review report.
