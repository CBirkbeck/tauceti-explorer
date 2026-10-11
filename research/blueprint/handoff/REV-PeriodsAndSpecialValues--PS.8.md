# Handoff — REV-PeriodsAndSpecialValues--PS.8

**Complete independent review; accepted.** Issue #543. Codex GPT-6, session
`codex-g6jj0S`, 11 October 2026. The author session was `codex-ILKXck`.
This is a finished review, not a checkpoint. No second job was claimed.

The packet now has a finished independent `review` object with one justified
verdict for every node: 17 verified and 23 corrected. No nodes were added.
All 40 nodes, 63 API items, 63 unit tests, 12 planets, 20 actual pinned baseline
statements and nine supplier requests were checked. Both stages are planned;
neither is closed. The full evidence and node table are in
[the review](../reviews/REV-PeriodsAndSpecialValues--PS.8.md).

## Changes

- Corrected source titles, editions and theorem/section/page locators, including
  Shapiro's Definition 6.1 rather than a nonexistent theorem, Soudères's stuffle
  §4.4, Zagier Theorem 1 p.981, and the quartic residue section.
- Independently confirmed Hartmann E1/E2. Added E3 (ambient unimodularity in
  primitive-embedding uniqueness, with an explicit divisibility counterexample)
  and E4 (distinct based γ₁/γ₄ continuations in the period normalization proof).
  Every finding has a finished independent verdict. `sourceVersions` scopes
  these to the checked preprint; the published full text was not available at
  the inspected publisher page.
- Pulled the local real-parameter formula by t=i·s to the marked γ₁ chart at t=i.
  The γ₄ chart uses the centred coordinate p−1. The normalized series conclusion
  is retained without identifying the two based loops.
- Imported the already existing current IntegralLattices 5H/6A contracts for the
  quartic marking. G5 records the missing atlas catalogue link; no generic
  Nikulin or K3-classification target is newly planned.
- Narrowed G3 to the frame-preserving relative-motive/path-period comparison.
  Brown Lemma 3.8 uses convergent stuffle and a shuffle-regularized leading-zero
  integral, not an additional divergent-stuffle extension. Both exact shifted
  all-two formulas are now recorded and typed in the suggested file.
- Made parity level lowering and its coaction prerequisite explicit. Pinned the
  Hoffman matrix's source rows, target columns and descending prefix-deletion
  bijection. The weight-five test now checks [[3,−11/2],[−2,9/2]], determinant
  5/2 and its column-rescaled upper-triangular reduction modulo 2.
- Expanded Zagier's interpolation/growth uniqueness proof and confirmed the
  existing pinned `PhragmenLindelof.horizontal_strip` declaration as baseline
  entry 20. All 19 original baseline entries remain valid.
- Kept ζ(2,1)=ζ(3) solely in its later regularization target, and marked the
  requested NC.2 Betti/bar/tangential comparison as an explicit supplier
  extension rather than an existing export.

## Validation

- Packet checker: 0 errors, 0 warnings after the final review object was added.
- Source-issue structure and version-scoping validators: passed.
- Complete suggested file: `lean-check` exited 0 at the existing pinned build,
  with only declaration-uses-`sorry` warnings. Memory availability exceeded
  20 GiB before compiling. No library build, update, cache fetch or language
  server was started; no compilation remains running.
- Exact rational checks passed for the quartic series/inverse and Clausen square,
  pullback, every monodromy Gram identity and ordered product, E2–E4 witnesses,
  Hoffman coefficients/determinant/rescaling and quintic residue/pairing.
  The Lean determinant and translation-conjugacy examples have actual tactic
  proofs; the roadmap's mathematical targets still have placeholder proofs.
- `git diff --check` passes. Only this review, the packet, suggested file and
  this handoff changed. The scratch sources/scripts/logs are removed after the
  PR opens; the report retains their mathematical results and source hashes.

## What remains, and where to resume

There is no unfinished reviewer work. Implementation and supplier routing must
address the packet's explicit obligations: G1 is the completed/projective Dwork
and integral/log-crystalline bridge; G2 is weighted p-adic convergence; G3 is
frame-preserving motivic stuffle transport; G4 is the generic relative quotient/
resolution interface. All nine supplier requests remain open, and the MC
supplier packet still has `needs_changes`. Acceptance does not discharge them.

For G5, use the current upstream IntegralLattices README at commit
`070dc2becd74419e76303ede84b465ed4a69461f`, Layer 5H and Layer 6A, linked in
`quartic-lattice.externalPrerequisites`. Refresh/link its catalogue identifiers;
do not substitute the retired Completed/IntegralLattices snapshot or replan the
already owned generic theorems. No upstream file was changed.

The reader `readmes/PeriodsAndSpecialValues--PS.8.md` was read but is not an
editable deliverable of #543. Assembly must synchronize it with the accepted
packet: corrected locators/titles, version-scoped E1–E4, distinct local based
charts, narrowed G3 and shifted integral identities, parity level lowering,
source-row/target-column and prefix-deletion conventions, the weight-five test,
and the current IntegralLattices import/G5. Its core target coverage is otherwise
retained. The confirmed Tate-period localization correction belongs to the
other part; PS.9 already imports its correct localized interface.
