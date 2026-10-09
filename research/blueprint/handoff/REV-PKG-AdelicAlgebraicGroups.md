# REV-PKG-AdelicAlgebraicGroups — handoff

Issue #7501. Reviewer: Codex, session `codex-bqsds2`, 2026-10-09. Claim confirmed by the bot on comment 6080497631. Branch: `codex-bqsds2-review-7501`.

The independent package review is complete, with verdict **needs_changes**. This submission completes the review job. The reviewer did not author the package. The accepted packet and the previous package handoff are unchanged.

## Delivered

- `packages/AdelicAlgebraicGroups/review.json`: the required independent verdict and verification notes.
- `reviews/REV-PKG-AdelicAlgebraicGroups.md`: all six criteria, corrected defects, source records, ownership move and complete omission index.
- `packages/AdelicAlgebraicGroups/Suggested.lean`: five clear correction groups: quotient integration in stages; canonical Borel quotients and regular projection measures; invariant regular arithmetic quotient volume; Hecke index inside the compact open subgroup; nonzero Hilbert parameters for quaternion norm images.

README.md remains 198,539 bytes and has all 264 accepted targets and 231 API outlines, plus the two analytic targets required by the upstream tier rule. Metadata is the exact single line `topic = "math.NT"`.

## Remaining package revision

Start with the report's R1 and complete omission index: 14 definition/construction targets, 87 lemma/theorem targets, 66 API items and 49 tests are specified only inside the final comment. Their genuine structural suppliers must be represented or consumed before stating the dependent signatures. Do not substitute arbitrary propositions, topologies, representations or equivalences for their missing mathematical conditions.

R2 records additional incomplete native targets: normalized measure transport under left/right quotient inversion; the GL₂ coarse Riemann-surface structure and holomorphic level/translation maps; the algebraic identification of the split-centre carrier with the largest ℚ-split central torus of the Weil restriction. Counts of native names are not a certificate that the whole target is stated.

## Ownership move

The README AA.5.2 targets fully replace the old R12.2 analytic Γ(N)/Γ₀/Γ₁ request, including complex structures and functorial action. A packet revision can drop that request; the native complex-analytic signatures still need R2.

Retain AA.5 ownership of the analytic congruence-component comparison and its complex maps under level change. `AA.5/gl2-upper-half-plane-component` still has the old `ModularCurvesPartII:R12.2` prerequisite in the accepted packet (tier 11 versus AA's tier 2). The package moves its analytic input into `AA.5/gl2-congruence-component-groups` and `AA.5/gl2-level-riemann-surfaces`, with FuchsianOrbifolds layers 0–1, 4 and 5 supplying the general complex quotient theory. The higher-tier ModularCurvesPartII plan should import this analytic comparison from AA.5. Algebraic modular-curve uniformization remains there. Neither plan is an allowed deliverable of this review.

## Verification and evidence

`lean-check research/blueprint/packages/AdelicAlgebraicGroups/Suggested.lean` completed with exit 0, no errors and 542 warnings, all uses of `sorry`, in the supplied shared build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The checked file's SHA-256 is `f212d7ad0867b57bd65457d6df9c1d02c33c0da1addee55b82561309ff20754c`.

`python3 scripts/check_blueprint.py research/blueprint/packets/AdelicAlgebraicGroups.json` reports zero errors and warnings. Submission files also pass `intake.py check-files`, exact review-schema and metadata checks, size checks, and `git diff --check`.

The public report preserves the source URLs, PDF hashes, access date, mathematical counterexamples and full omission list. No private book was used. No scratch file is needed for the next worker; scratch is removed after opening the PR. No Lean process remains running.
