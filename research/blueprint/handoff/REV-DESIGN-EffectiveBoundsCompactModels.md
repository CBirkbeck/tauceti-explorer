# REV-DESIGN-EffectiveBoundsCompactModels — completed review

Issue #1720; Codex (GPT-6), session `codex-xn7VMm`, 2026-10-11.
The claim was confirmed by the swarm bot. This session did not write the
designer's input and has claimed no other job.

The packet is accepted as a complete planning pass. The independent ledger
covers all 27 nodes: 21 verified, 6 corrected, none added or unverifiable.
All 16 final baseline citations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The entire published Couveignes
paper was checked, along with exact GN, GI, SF and ST supplier statements and
the current upstream EffectiveBounds/IntegralLattices boundaries.

Corrections: made the canonical-volume coordinate transport explicit;
specialized the finite-index citation to its general intrinsic-space variant;
added the native discriminant determinant input and integral-basis change;
added the named `coefficientBox_floor` API and suggested signature; corrected
Theorem 2 to printed p. 488 in two packet locators. The roadmap CM.2 inputs
match the corrected packet. Constants `40` and `65536` were independently
checked. Full details and counts are in
`research/blueprint/reviews/REV-DESIGN-EffectiveBoundsCompactModels.md`.

Validation: the blueprint checker has zero errors and warnings. The final
suggested file elaborates through `lean-check` at the pinned shared build,
exit 0, with 83 permitted `sorry` warnings and no other Lean diagnostics.
The file remains a collection of unimplemented suggested interfaces; these
are not completed proofs or executed unit tests. Submission path, ledger and
job-completion checks pass. No checkpoint or continuation of this review is
needed.

The next work belongs to packaging and the existing suppliers:

- Preserve the precise SF.5 arbitrary-dimensional isolated-intersection
  request. The current plane-curve result does not close it. The packet is
  `complete`, not `closed`; six stages are `planned`, and CM.5 records the
  request as remaining work.
- SF.0's exact `jacobian-etale-algebra` mathematical contract supplies the
  consumer, but its supplier review remains `needs_changes` and marks its
  missing suggested interface `unverifiable`. This review does not change
  that verdict. Finish that interface in the supplier's own revision before
  upstream implementation/packaging needs it.
- The reader was outside this review issue's deliverables. During packaging,
  correct its two Theorem 2 page references to p. 488, synchronize the CM.2
  native prerequisite list, and name `coefficientBox_floor` in the API for
  the floor equivalence already stated there. Its mathematical bounds and
  definitions are unchanged by this review.

No ownership move, roadmap restructure, additional node, new source erratum
or library implementation claim is required. Stop after submitting this job's
pull request; a fresh worker takes the next issue.
