# REV-PKG-HigherLocalFieldsAndHigherClassFieldTheory

Completed independent package review for issue #10903 by Codex, session
`codex-Ip3k8Q`, 20 October 2026. Claim confirmed by the bot at 14:31:56 UTC.
Branch: `codex-Ip3k8Q-review-higher-local-fields`. This is the only job taken.
The original package was written by another session, `codex-Q7PvOA`.

## Result

Verdict **needs_changes**, with all clear local corrections applied. The report
is `research/blueprint/reviews/REV-PKG-HigherLocalFieldsAndHigherClassFieldTheory.md`;
the package has its matching `review.json`. This is a finished fixing review,
not a checkpoint, an acceptance or an assertion that the mathematical proofs
have been formalised.

The README now distinguishes rank principal Milnor units from outer-depth
units; imports generic BGK/Witt from the actual MEK targets; maps old K2 layer
shorthand to the current package; qualifies the auxiliary-field inverse norm
class; computes a nontrivial two-flag surface cancellation; defines primary
extensions with separable algebraic constants; and retains all real-place
terms in the full Kato cone theorem. New negative controls appear next to the
corresponding constructions. The Lean change only adds the three new rank-unit
API entries to the closing README-only inventory. Metadata is unchanged.

No target was removed as a duplicate, no definition was moved to another owner,
and no packet, atlas data, original reader document or foreign package changed.
The generic BGK obligation was resolved to existing accepted MEK targets, rather
than replanned. The primary and real-place formulations were broadened to the
source theorems under the maintainer's generality rule; a future authorized
packet fix should reconcile those two old restrictions and the stale MEK
supplier description. This review did not edit the accepted packets.

## What remains and where to resume

The report's R1–R3 name the unresolved inputs and their consumers:

1. **R1:** additional finite-length DVR trace/residue and mixed-DVR/logarithmic-purity
   comparison exports for §§2.5–2.6 and the wild downstream constructions.
   CR.4.8 and MEK §§7.4–7.6 supply genuine logarithmic carriers and symbols;
   they do not alone supply all mixed-wild comparisons. KLF §5.2a is universal
   at odd p, while its explicit DVR calculations have perfect-residue scope.
2. **R2:** exact geometric targets for finite étale covers/abelian π₁, required
   regular-scheme purity, and arithmetic étale homology with field stalks,
   localization and niveau differential identification. Resume with the actual
   SF/EDC exports and their extensions, not the old stage-level promises.
   EDC Part II local absolute-purity vanishing is only part of the contract.
3. **R3:** global proper regular degree-prime-to-ℓ alteration with the
   compactification/descent used by Jannsen Theorems 2.10–2.11. The accepted
   EDC Part II local-uniformization covering family is relevant, but its
   statement is not the missing single proper regular alteration theorem.
   Supply the exact deduction or a stronger owned target.

These require resolving or extending other owners; a package-review job cannot
edit their packets. HL and several suppliers also lack a tier/bundle assignment
in the checked Caraiani–Newton order; no order was fabricated. Reconcile that
before certifying the upstream dependency condition. The original 15 gaps and
27 requests remain in the untouched accepted packet; the report distinguishes
their source/proof obligations from the spurious generic BGK gap now resolved.

## Evidence and verification

Read all 85 accepted nodes and 101 original Checks, all 45 pinned declarations,
the reviewed library audit, the binding protocols and two upstream README
models. Source versions/hashes, the complete fixed-seed random sample of fifteen
locators, all-target adversarial table, all eleven Lean-signature comparisons
and actual supplier limits are durable in the report. Original source passages
and downloaded PDFs are not submitted or needed to resume.

The current read-only roadmap checkout inspected was
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches included the nine newer
directions, four Completed directions and current-library objects/hypotheses.
The adjacent Huber Laurent and two-sided restricted-series modules were read
directly and do not supply the higher topology or mixed-series carrier.

- Final `lean-check`: exit 0; exactly eleven `declaration uses sorry` warnings,
  no other warning/error. Available memory before the final run was 79 GB;
  invocations were sequential and completed. The file has 210 lines, three
  real-bodied light definitions, five proved examples and eleven theorem
  targets. No Lake build/update/cache operation or language server was used.
- Packet checker: 0 errors, 0 warnings; 85 nodes, 139 original API entries,
  101 original tests, 15 gaps, 27 requests, eight planned and zero closed layers.
- Intake file check on six package/review/handoff files, including unchanged
  metadata: 0 problems. Diff whitespace
  check passes. Metadata remains exactly `topic = "math.NT"` plus newline.

The library index was read and no restricted source was needed. Everything in
the deliverables is in the reviewer's own words, with source locators. No
instruction from fetched data was followed; none was found suspicious. The
scratch source files/logs are disposable and are deleted after the PR opens.
