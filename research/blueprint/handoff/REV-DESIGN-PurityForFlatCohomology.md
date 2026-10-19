# Handoff: REV-DESIGN-PurityForFlatCohomology

Completed independent review of issue #3597 by Codex, session `codex-T956PW`, on 2026-10-19. The original design was by Claude Opus 5.5 (`claude-Q5c44Q`). This submission is a finished review, not a checkpoint. No second job was claimed.

The corrected packet is accepted as a completed target-level pass under PROTOCOL §0. It retains 57 nodes: 25 corrected and 32 verified, with no nodes added or removed. It has 52 API entries, 34 definition/construction tests, 24 planets, 22 confirmed baseline declarations, nine requests and 14 explicit gaps. Seven stages remain planned; none is closed. All implementation statuses remain unchecked.

The [review report](../reviews/REV-DESIGN-PurityForFlatCohomology.md) records every changed node field, the baseline ledger, source findings, supplier checks and validation. The [reader](../readmes/PurityForFlatCohomology.md) now contains the corrected hypotheses, statements, proof outlines, APIs, tests, checks, reading scopes, routes and gaps.

## What changed

The corrections repair supported continuity and nested supports, complete-intersection self-products in finite-flat descent, support functoriality, the regular-purity boundary degree, higher multiplicative-group torsion, torsion reduction to finite coefficients, counterexample degrees/dimensions, coniveau supports and the residue construction. The Lean product map now lands in the idempotent components; the presentation virtual-dimension inequality requires a Noetherian presenting ring. The regular theorem’s summary excludes fields.

LocalPurity §1.1 already owns the local punctured spectrum, and SchemeAndStackFoundations §2.7 owns general derived cohomology with supports. This roadmap imports them and keeps its semilocal and fppf adapters. Absolute purity remains with LefschetzPencilsAndVanishingCycles, and local Grothendieck–Lefschetz with DeformationAndDerivedPatchingAlgebra.

PerfectoidSpaces P7.16a–P7.17 already owns both regular finite-flat tower targets. They are imported from upstream PR #818, commit `506f5211b5d2e497588b614fcb008f54adfb0688`. The PerfectoidQuotientsPartII contract now asks only for the extra integral-valuation, radical/torsion and explicit-tilt refinements. Q0’s existing completed localization is also reused. Carry this rescoping to the Part II design; no other worker’s files were edited here.

The three PD.6 suppliers were individually checked: `perfect-base-classification`, `covariant-normalisation` and `torsion-base-change`. PrismaticCohomologyPartII as a whole remains needs_changes because of its PD.7 issue. This review does not promote it or assert its closure. DerivedDeRhamCohomology DD.1 defines complete flatness, but the Yekutieli theorem needed here remains an exact request.

## What remains for refinement

All existing named gaps remain explicit. Two were added:

- AUSLANDER-FREENESS: the exact criterion is verified in CS24 p. 88, citing Auslander Theorem 1.3, but the public publisher endpoint did not serve the original proof. Supply its homological argument inside the existing PF.5 owner; do not duplicate the criterion elsewhere.
- BR-RESIDUE-DESCENT: give the unramified descent/localization argument that identifies extendable classes over an arbitrary DVR from their completion. The residue construction uses pullback to completion, not an isomorphism of Brauer groups. The complete-DVR computation alone does not prove the general case.

The SF-PII contracts belong to the SchemeAndStackFoundationsPartII design (#3361); PQ-PII refinements to PerfectoidQuotientsPartII (#3362); local Lefschetz to EtaleDualityAndPerverseSheavesPartII (#3363). Preserve the exact statements in the packet, including all the Stacks 0EHC/0EJP hypotheses. The original Auslander argument, the general-DVR localization proof and the other secondary credits remain honestly distinguished from directly read sources.

All six source findings were independently confirmed against CS24 arXiv v3 or C19 arXiv v4. E6 is a proof gap in the noncommutative argument, not an established counterexample. No finding asserts that the journal printing retains the preprint issue. The packet and reader contain public source URLs, precise locators, hashes and reading limits; no source files or passages were copied into the repository.

## Validation

- Blueprint checker with the pinned declaration index: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/PurityForFlatCohomology.lean`: passed at the prescribed pins, with 29 sorry warnings and no other warnings/errors. The file has 331 lines and no sorry-bodied data.
- Source-finding and source-version checks: passed.
- Packet/roadmap/reader/Lean consistency: all 57 targets and all 86 API/test names accounted for; every definition/construction has at least three tests; source records agree.
- `git diff --check`: passed.

No review work remains. Future refinement should start from the gap and coverage records, not repeat this review. The transient source-reading scratch files are deleted after the pull request is opened; all information needed by a later worker is in the packet, reader and this handoff.
