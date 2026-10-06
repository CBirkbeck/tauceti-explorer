# Completed independent review: PR.8

Job `REV-PrismaticCohomology--PR.8`, issue #476; Codex session `codex-h3vyiy`, 6 October 2026. This review is complete with verdict **needs_changes**. It is not an unfinished-review checkpoint. The original writer was Claude, session `claude-DAYn2t` (PR #6677).

Read the [review report](../reviews/REV-PrismaticCohomology--PR.8.md) first. It contains the per-node audit, exact public sources, baseline checks, corrections and questions for the orchestrator. The [packet](../packets/PrismaticCohomology--PR.8.json) contains the independent verdict and all 76 node findings: 41 verified, 22 corrected, 13 unverifiable. Its status and PR.8 coverage are partial with precise remaining work. No nodes were added or removed. Clear errors were corrected in place, two typed extensionality APIs were added, and the exactification test now checks equality with the full preimage. All nine source findings have independent decisions.

## Revision work, not continuation of this review

1. Obtain the full Inoue–Koshikawa–Yao corrigendum, DOI [10.1016/j.aim.2026.111223](https://doi.org/10.1016/j.aim.2026.111223). Only publisher/institutional metadata and the abstract were accessible. They identify published Theorems 7.35 and 7.36; the correspondence with preprint Theorems 7.36–7.37 and the corrected hypotheses are not established. Recheck nodes 71–72 and dependent Laurent-realisation claims. Do not infer the corrected theorem from this report.
2. Reconcile exact supplier scopes with their existing owners: general fs log-adic spaces beyond T6's smooth-boundary range; PR.4's arbitrary bounded derived-ring comparison; PR.7's Laurent/perfect-complex descent; CR.6's proper Cartier-type fs crystalline comparison over O_C; completed structure sheaves and condensed/profinite coefficient modules. Extend existing owners, using Part II where needed, rather than duplicate them. The packet's added requests and gap list specify the uses.
3. Assign the two previously recorded ownerless proof inputs: characteristic-p Riemann–Hilbert and arc descent. The review has not discharged these gaps.
4. Supply actual suggested Lean signatures/examples for the 292 API/test names currently only in comments, matching the packet and genuine imported carriers. Correct the weaker typed examples identified in the report. Compilation certifies only the elementary typed subset.
5. Synchronise the reader document with the corrected packet and prototype. The reader was outside this review's deliverables, so it still contains the original errors. Reassess coverage after source and dependency reconciliation.

## Evidence to preserve

The three original source PDF hashes match the independently fetched versions. New source-version records cover Ogus's public 2006 draft and Česnavičius–Koshikawa v3. Ogus I.4.3.17(1) supplies the exactness/integrality argument; its numbering differs from the 2018 book. ČK §6.7/Proposition 6.8 supplies the intended period diagram: the period comparison becomes an isomorphism after inverting t, not over B_dR⁺. KY's general-fs power-tower assertion fails for the fs group monoid Z/2Z with n=2; the map on Q_p[t]/(t²−1) sends t to 1 and misses one component. The corrected packet restricts power towers to torsion-free group completion while retaining the general chart-local site comparisons. Known-correction search metadata and all independent reasons are in the packet.

Mathlib was read at `082e2d37e8b0463410cdb532e111cd43d5a66174`; all 14 baseline declarations exist with their stated limited provisions. `PreTilt` now explicitly supplies only the inverse-Frobenius perfection of O/p. There are no Tau Ceti baseline names or imports in the prototype; no newer Tau Ceti API is relied on.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PrismaticCohomology--PR.8.json`: 0 errors and 0 warnings.
- `lean-check research/blueprint/suggested/PrismaticCohomology--PR.8.lean`: compiled successfully at the pinned Mathlib, with only admitted-proof warnings.
- All 76 node IDs have one review entry; all 332 API/test names occur in the suggested file; all 32 definitions/constructions have at least three tests; six planets remain unchanged.
- Deliverable/private-path checks and `git diff --check` passed before submission. Only the three issue deliverables and this handoff were changed.

The scratch PDFs, extracted texts, scripts and logs are disposable and are removed after submission. All evidence needed for revision is recorded in the committed files. The orchestrator should finish this review issue and arrange a revision of PR.8; it should not promote the packet or release this as an unfinished review.
