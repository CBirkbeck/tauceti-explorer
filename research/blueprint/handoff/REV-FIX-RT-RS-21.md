# REV-FIX-RT-RS-21 handoff

Completed issue #5712. Codex session `codex-0HK3IJ`, 7 October 2026;
base `85629d35ed9adf08fbd8297247d6e45a280910b2`.
The independent review accepts both structural fixes, with clarifications in
`restructure/RS-21.result.json`; details and public source locators/receipts are
in `reviews/REV-FIX-RT-RS-21.md`. This session did none of the original fix.
The prior accepted review remains verbatim in `reviewHistory`.

No review work remains. Existing owner jobs should resume as follows:

- **SmoothRepresentationsOfLocalGroups SR.5 / AutomorphicCongruences L3:**
  SR.5 supplies the invariant coefficient-change map and precisely qualified
  family/duality theory; R16.2 supplies field-valued GL₂ newvectors. L3 owns the
  source-specific minimal-lift comparison. Reconcile Fouquet–Wan v3's printed
  coefficient inconsistency, obtain a proof covering the chosen integral
  regime, construct the representation comparison, then prove essential-line
  finite generation/freeness and specialization bijectivity before using it
  in the zeta square. Do not assume the target isomorphism or infer it from
  derivative base change. Neither owner has a packet at this base. General
  integral GLₙ theory stays with Smooth and needs a separately sourced contract.
- **AutomorphicLFunctionsAndLocalFactors AL.3:** refine the existing
  `global-whittaker-factorization`, `gln-fourier-expansion` and
  `global-rs-unfolding` nodes in its packet. It is complete/planned with a
  separate independent `needs_changes` review, outside this job's scope.
  Preserve one general reconstruction theorem and R16.5's imported rank-two
  comparison. Expose volume-one unipotent measures, the complex-linear
  coefficient map, mirabolic last-row stabilizer/last-column coordinates,
  definition APIs and at least three tests each. Add the separately proved
  gauge/majorant before noncompact interchange. Acquire the proof cited by
  Cogdell §2.2.2, reference [40] §13; that proof interior remains unread.
  Reconstruction should not require tensor factorization. Align the packet's
  last-row-unipotent phrase with the chosen coordinates, and update its reader
  and suggested signatures through its own job.

Repository restructuring and intake checks pass. Actual atlas substitution:
4,099 stages, 10,772 → 10,774 edges, both acyclic, all 175 links present,
none skipped, edge-idempotent, and 656 Tau Ceti stages unchanged. No Lean
deliverable was requested or compiled. No promotion, merge or issue-state
changes were performed by this worker. Scratch artifacts are disposable;
the report records everything needed to reproduce the checks from this base.
