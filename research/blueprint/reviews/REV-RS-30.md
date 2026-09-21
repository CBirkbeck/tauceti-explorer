# REV-RS-30 — independent restructuring review

## Verdict and independence

**Accepted after corrections.** Codex, session `codex-a71f92`, 2026-09-21,
issue #859. RS-30 was written by ChatGPT Pro, session
`gpt-20260921-c74f2a` (#860, PR #901), not this reviewer.

Reviewed input proposal blob:
`51d3fd6a0e3d3dd23a27ccbb72bb7cc2cff047c8`.
The decision preserves all twelve BSD stages and the immutable EllipticCurves
anchor. Acceptance concerns ownership and dependency structure, not completed
BSD proofs or a universal all-prime leading-term theorem.

## Evidence read

Read the complete RankZeroOneBSD member and EllipticCurves anchor, the family
leads, original proposal/report, and every member/anchor stage description.
The complete LocalFieldsRamification upstream roadmap was also read during
this worker session. Mathematical documents use programme snapshot
`35e01e963a35d4ae713b71b9495df621cbb5fcf0`; intervening main changes through
`5d7402a7a8967258682d6f55d8bb3c448066842e` were checked for relevant changes.

Read the integrated AUDIT-27 coverage records for all twelve BSD stages,
including their target, overlap and qualification notes. Directly checked the
pinned declarations below; other audit implementation/absence claims remain
attributed to the reviewed audit. The 2-descent special case is not a
general cohomological Sha construction.

Read R29.3/R29.6 and GZ.0 supplier contracts, and the full HE.8b, MIMC:L6 and
PS.6 consumer descriptions. These distinguish arithmetic proof owners from
formulation interfaces and final reexports. This is not a fresh full-paper
audit of BFH, Gross–Zagier, Kolyvagin, JSW, CGS, Keller–Yin, BSTW or the
Castella erratum. Their statement-to-proof closure remains an implementation
obligation, as the member already records.

## Corrections

1. **Complete the consumer handoffs required by §15.** The original 24 links
   name foundation suppliers for narrowed stages but omit numerous links
   from those suppliers to the stages that use the narrowed outputs.
   Checking the existing graph alone finds 23 missing handoffs. The README
   also explicitly requires BSD.1 in BSD.6a, BSD.5 in BSD.6a/7a, and BSD.0–8
   in BSD.9; relying only on extracted edges misses these uses.

   Added twelve explicit BSD dependency rows (six already present in the
   graph and six newly represented), and fifty supplier handoff rows.
   The twelve rows are BSD.0 → 2/9, BSD.1 → 3/4/6a/9, and
   BSD.5 → 6/6a/7/7a/8/9. The original BSD.0 → 3/4/5 and BSD.1 → 5
   rows remain. Handoffs were checked over the union of existing and
   proposed edges, including BSD.1 when used as a supplier for BSD.5.
   Foundation links supplement rather than replace the specialized BSD
   comparisons, proofs and certificates.

2. **Make the period scope machine-visible.** The original report correctly
   restricts the anchor's elementary real-period/arithmetic quotient to
   E/Q. The ownership label and BSD.1 retained scope now say so explicitly.
   Required quadratic-field/ramified-place period comparisons remain BSD.1
   work with its existing geometric and GZ prerequisites; no general-K
   period theorem is assigned to the rational anchor.

3. **Retain the actual pairing comparison explicitly.** BSD.5 now requires
   comparing the pinned halved-polar pairing with the source pairing before
   identifying regulators or valuations. This makes the original report's
   important warning load-bearing in the decision JSON. It does not change
   the anchor, introduce a new normalization owner, or suppress a power of
   two.

Added the required top-level review object. All original 24 links, eleven
owner assignments and twelve stage actions remain; the period label and
BSD.1/5 wording are the only changes to those original decisions.

## Nothing lost: stage-by-stage check

| Stage | Retained mathematics and ownership boundary |
| --- | --- |
| BSD.0 | Actual finite analytic order, nonvanishing/derivative criteria, parity, bad local-factor and quadratic base-change product/derivative identities remain. Twist objects, full newform coefficient rationality and actual continuation come from Layer 5 and R29.3/6. |
| BSD.1 | Restriction/trace, rational eigenspaces/rank sum, integral index, odd-primary comparisons, explicit 2-primary kernels/cokernels, ramified differential/component/period factors and noncircular whole-Sha descent remain. General MW/Selmer/Sha/Cassels objects are imports. |
| BSD.2 | Both value and derivative nonvanishing, simultaneous local conditions, infinitely many allowed discriminants, clean-branch exclusions and the BFH/Friedberg–Hoffstein argument remain. Root numbers do not replace nonvanishing. |
| BSD.3 | All-E/Q analytic-rank-one rank and whole-Sha finiteness, including CM/nonsemistable curves and the conjugation/eigenspace argument, remain. Full HE.7 is required, not only a clean large-p specialization. |
| BSD.4 | Independent rank-zero twist argument, whole-Sha descent, separately scoped Kato comparison and combined rank-at-most-one interface remain; no circular appeal to BSD.3 for the twist is introduced. |
| BSD.5 | Positive rational normalized leading term/defect, finite-index and torsion/Q-K comparisons, Ribet–Takahashi degree calculation, valuation formula and the composition proving defect isogeny invariance remain. Cassels and general analytic isogeny invariance remain Layer 7-owned. |
| BSD.6 | Exact irreducible prime-part branches, semistability versus good reduction, special p=3 conditions, corrected multiplicative hypotheses, both divisibilities and integral error factors remain. |
| BSD.6a | Actual source-qualified signed/supersingular and corrected multiplicative proof inputs, BSTW zeta construction, both reciprocity laws and integral comparisons remain; MIMC:L6 is an output, not their proof supplier. |
| BSD.7 | Distinct CGS and Keller–Yin Eisenstein branches and rational p-torsion corrections remain. A p-converse is not substituted for a leading-term theorem. |
| BSD.7a | Separate Eisenstein arithmetic proofs, both divisibilities, local invariants, lattices and finite-submodule corrections remain. Early HE.8 supplies classes; HE.8b does not supply its own missing proof. |
| BSD.8 | Positive rational defect, finite exceptional support, every exceptional-prime equality and the outside-support proof remain. Rank/whole-Sha finiteness is not an all-prime certificate. |
| BSD.9 | Separate rank, whole-Sha, fixed-prime and full-certificate signatures; rigorous analytic enclosures; rank-zero regulator, torsion, scaling, CM/nonsemistable/p-isogeny tests; and the negative unresolved-2-part test all remain. |

The exact title is **Elliptic curves, Part II: rank-zero and rank-one
Birch–Swinnerton-Dyer theory**, and the extension decision explicitly makes
Elliptic curves its first prerequisite. No anchor stage, title or scope is
edited. Planned upstream targets remain upstream-owned regardless of their
implementation status.

## Pinned declaration checks

Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib pin
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Read declarations with surrounding
hypotheses and verified the inspected files byte-for-byte against the remote
Tau Ceti pin on 2026-09-21.

- [FinitelyGenerated.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean):
  `finite_torsion` uses Northcott/admissible heights and ellipticity;
  `fg_point` has the normal-form and per-factor class/unit hypotheses;
  `fg_point_of_variableChange` transports it;
  `fg_point_of_numberField` supplies finite generation for an arbitrary
  elliptic Weierstrass model over a number field. No artificial short-model
  restriction is needed in BSD.
- [Regulator.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/Regulator.lean):
  regulator is the absolute Gram determinant on `PointModTorsion`;
  basis-change congruence, absolute determinant independence, arbitrary-basis
  computation and rank-zero regulator one have their stated ellipticity and
  module-finiteness assumptions. These do not supply the proper finite-index
  sublattice calculation retained in BSD.1/5.
- [CanonicalHeight.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean):
  `Point.canonicalHeight` is the limit of
  `h(2^n P)/(2 * 4^n)`; its convergence theorem assumes ellipticity.
  `neronTatePairing_apply` is the halved polar form and
  `neronTatePairing_self` returns that height. The anchor prose uses a full
  logarithmic x-height limit. Comparing actual pairings, not just names, is
  essential; GZ.0 owns the convention bridge and rank-dependent determinant
  scaling. This review does not guess a regulator factor from the height
  discrepancy alone.
- [QuadraticTwist.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean):
  `quadraticTwistPointEquiv`, its naturality, anti-equivariance and
  quadratic-character equivariance are for a separable quadratic extension
  and compatible field tower, with ellipticity. They are not themselves
  integral rank splitting, a Selmer local-condition comparison or a
  ramified L-factor theorem.

The four SHA-256 checks were respectively
`f1ccd4a7f990c9a388662862795d067a783cbf4abe81631feffa33b0ca33373d`,
`6eafbd53c6261de6d4d3c23400c5b7c474bde776e46c53721eade5e71ea7ac97`,
`07aa6c27435d5c6d3421d8e8dea17b816c1bec8e5fa8cfc77da0d1327d9f9a6d`,
and `4c80d742a2113d7e3880ae48abfb22e5c311ab96bf4a0b43f2c2adb6c673ff9b`.
No kernel build or transitive axiom audit is claimed.

## Consumers and validation

Preserved all four existing external exports to three stages:
BSD.7a → HE.8b, BSD.6a/7a → MIMC:L6, and BSD.8 → PS.6.
Their distinct proof and certificate meanings remain. No reverse reexport
edge was added. PS.6 still requires every integral prime to be covered or an
explicit unresolved gate; no higher-rank BSD/Bloch–Kato claim follows.

The corrected packet has 11 owners and 86 unique links: 19 already present,
67 new. Checked a conservative union of 4,196 existing endpoint pairs from
the raw atlas, every roadmap's stage edges/requirements/consumers and all
link packets. No new edge has a return path, so none introduces a proof
cycle. This does not assert that the pre-existing catalogue has no cycles.
All narrowed suppliers reach their layer and every direct consumer in the
combined graph; all ownership handoffs and stage IDs resolve.

`python3 scripts/check_restructure.py research/blueprint/restructure/RS-30.result.json`
passes. Independent scratch checks pass for complete twelve-stage inventory,
literal member/anchor descriptions, anchor immutability, exact title,
first-prerequisite instruction, unique owners/links, all supplier and consumer
handoffs, external exports and new-edge cycles. No Lean file is required or
changed; compilation is not applicable. No blueprint packet was submitted.

## Orchestrator handoff

Apply the corrected decision as an additive dependency/ownership patch,
preserving old edges, with the exact title and first prerequisite. Reconcile
the height prose with the pinned implementation through the named GZ.0
bridge; do not silently alter the immutable anchor or the 2-primary formula.
General-K period construction and finite-index comparisons were not erased.

The source-readiness gates for full HE.7 CM/dyadic descent and the enumerated
prime branches remain open implementation tasks, not restructuring defects
that can be solved by asserting a theorem. Acceptance does not certify their
proof closure.

The issue's short deliverable list names only this report, while its full
instructions explicitly require correcting the proposal and adding review
metadata. Both required files are submitted, plus the WORKERS-authorized
handoff. If intake flags the proposal path, maintainer reconciliation of
that allowlist is required; this review does not edit queue automation.
