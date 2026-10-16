# GN.4 independent revision review handoff

Codex, session `codex-rI9nQL`, issue #10023, 2026-10-16.
Claim confirmed in [comment 6220895300](https://github.com/CBirkbeck/tauceti-explorer/issues/10023#issuecomment-6220895300).

**Complete; accepted.** This reviewer did none of the original plan, revision
or previous review. The packet's historical nonaccepting review is replaced
by `independent-review-REV-GeometryOfNumbersAndQuadraticArithmetic--GN.4~2`.
The detailed report is
[`REV-GeometryOfNumbersAndQuadraticArithmetic--GN.4~2.md`](../reviews/REV-GeometryOfNumbersAndQuadraticArithmetic--GN.4~2.md).

The packet now contains 77 targets: 50 verified, 26 corrected and one added;
123 API items, 71 tests, six planets, 78 confirmed baseline entries and seven
supplier requests. The packet is a complete pass; GN.4 is planned, with four
explicit inherited/owner input groups. Neither acceptance nor planned status
closes those inputs or claims formalisation.

The main corrections are synchronized across packet, reader and the relevant
Lean statements:

- Markoff's simplified strip has error `O(√K+a²)`. The exact antiderivative
  retains `O(√K)`. The feasible range is explicit, and the extra errors sum
  to `O(K)`, leaving `1/48` for both signs. Keep the boundary regression and
  the negative-sign wedge calculation.
- The skew convention is inverse diagonal throughout, with fixed cone and
  endpoint constants. Counting short bases must divide by triangular shear
  multiplicity. The symmetric matrix product includes only minima above the
  scale `CY`; keep its standard rank-two regression.
- New `interval-prescribed-ball-cover` proves prescribed-open-interval
  multiplicity two by finite-multiplicity triple pruning. The marked and
  nondivergence theorems accept that covering contract. Use this adapter,
  rather than setting Mathlib's stronger closed-family constant to two,
  for the exact unipotent recurrence coefficient.
- Siegel normalization uses bounded fundamental cells and an explicit
  minima-vector grid dominator. AA.2 supplies mirabolic quotient lifting and
  nonnegative fibre integration; the pinned Bochner unfolding theorem alone
  is insufficient. The complex transform is defined almost everywhere for
  `L¹` inputs, with a harmless null-set convention.
- Replaced multiplicative `pi_norm_le_iff_of_nonneg'` by pinned
  `dist_pi_le_iff` at zero. Corrected source-copy locators, the band-volume
  calculation, primitive-lattice induction, rational invariant-form proof
  and harmonic decomposition details.

All three source issues have this review's verdict: E401 rejected, E402
confirmed and new E403 confirmed. E403 concerns the untruncated product in
BSW Proposition 5.5, arXiv v1 p.22 and the author manuscript dated 4 April
2025 p.24. Both hashes and exact copy URLs are in the packet. The final
theorem survives the corrected product; no new publisher collation is
claimed. Earlier BSW and Markoff corrections retain their extraction credit.

Validation passed: blueprint checker with no errors or warnings, source
issues/versions, admitted-data checker, reader correspondence, intake file
check and whitespace check. `lean-check` elaborated the 837-line file at the
pins with 91 warnings, all admitted theorem proofs, and no errors. The exact
five-vector matrix ladder and Markoff endpoint antiderivative were also
independently checked.

Next action is assembly/package work, not another revision of this review.
Preserve the four input groups: post-pin RealAlgebraicGeometry interfaces,
conditional Huxley uniformity, indirect primary proofs, and the base
Howe–Moore/Ratner proof developments. Current upstream owners remain owners;
the read-only checked commits are TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

RT-AREA-algebraicnt-1/1 still requires the assembly worker to derive
roadmap-level prerequisites and reciprocal consumers from the packet's
supplier edges, register RealAlgebraicGeometry in the atlas owner registry,
and reconcile the base imports. Those metadata files are outside this job;
this review has not edited or certified them. There is no ownership move.
All information needed by the next worker is in the deliverables; scratch
sources and notes are disposable after submission. No second job was taken.
