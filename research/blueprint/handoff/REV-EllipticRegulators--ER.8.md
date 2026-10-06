# REV-EllipticRegulators--ER.8 handoff

Issue [#6441](https://github.com/CBirkbeck/tauceti-explorer/issues/6441).
Agent Codex, session `codex-DJhf3X`. This is a completed independent review,
not a checkpoint. The reviewed plan was authored by session `codex-FK9WoX`.

## Verdict and delivered work

The [packet](../packets/EllipticRegulators--ER.8.json) is **accepted** as a
complete target-level planning pass. ER.8 is **planned**, not closed; all
implementation statuses remain `unchecked`. All twelve nodes have individual
verdicts: ten verified and two corrected. The [review report](../reviews/REV-EllipticRegulators--ER.8.md)
contains the source, baseline, supplier, mathematical and prototype checks.

The inventory is twelve nodes, seventeen API items, thirteen tests, four
planets, eighteen baseline declarations, five supplier requests and three
gaps. No nodes were added or removed. The changes are:

- Add pinned `Affine.CoordinateRing.mk_ψ` and
  `WeierstrassCurve.zsmul_fromAffine_eq_zero_iff` as direct CM prerequisites,
  connecting the computed Ψ6 to ψ6 and Jacobian annihilation to affine torsion.
- Correct the three baseline line locators for `FreeAbelianGroup.of`, `.lift`
  and `exists_principal_zsmul_pointPlace_sub_infinity`; retain their exact
  hypotheses.
- Correct the Miller proof attribution: E.7 supplies principal-divisor
  existence; this instance verifies its displayed fixed-chain functions by
  the line-divisor calculation, including exceptional cases.
- Specify the period-one differential in the 11a3 regulator scalar and its
  Néron-differential rescaling. Add matching suggested-file commentary.
- Record the actually inspected accepted-manuscript checksum, preserving
  the planner's earlier checksum without guessing why the bytes differ.
  Correct Brunault's Théorème 9.4 locator and clarify the preprint's §4.7
  algorithm versus §5.2 Legendre interface.
- Confirm source issues E28 and E29 with independent review objects, scoped
  to the inspected versions. The published theorem body was not available.
- Index the omitted geometric étale-factor prototype in the existing
  signature gap and document the new library bridges in the suggested file.

The two handed red-team findings, RT-AREA-ktheory-2/10 and /11, are addressed:
ER.5/E.6 and Coleman/modular-symbol prerequisites are direct, and the D.5
request explicitly requires the Coleman supplier edge. No general K-theory,
CM, integration or p-adic L-function theory is replanned here.

## Validation

The packet checker passes with **0 errors and 0 warnings**. Exact independent
characteristic-zero arithmetic checked the division polynomial and squarefree
support, torsion group law, tangent/secant and norm functions, local leading
units, all four quadratic tame rows, degree-two residue cancellation, regulator
diamond, CM scalar and odd quadratic Gauss-sign test. The report records the
calculations and public sources so they can be reproduced without scratch.

The **full suggested file was not compiled**. `lean-check` stopped on the
missing imported Tau Ceti `GenericPoint.olean` in the existing shared build.
Memory was checked first and was sufficient. No library build, Lake project,
cache download, Lean server or extracted Lean source was created. The original
import names and interfaces were read at the exact pins. The planner's earlier
fragment-only elaboration is not a full-file verification by this reviewer.

Only the review report, reviewed packet, suggested file and this handoff were
edited. The reader was read for both red-team findings but is not an editable
deliverable of this issue.

## Where the next authorized work resumes

The five supplier requests and three precise `coverage.remaining` entries are
the worklist for a future follow-up; this run takes no second job:

1. D.5/D.2: actual weight-two regulator/logarithm types and maps, cup/trace
   normalization, full two-coordinate vector or reconstruction, and the
   syntomic–étale comparison.
2. Coleman L1: elliptic constant-term evaluation and finite-extension trace,
   with the general coordinate/Taylor hypotheses discharged or retained.
3. CM.1/CM.2: oriented algebraic coordinates of the three index points and
   full six-torsion, plus twist-sensitive Galois matching to ER.5's character.
4. Prove the exact three-point-to-one-point D identity; parent decimal
   agreement remains a diagnostic.
5. Replace the named omitted geometric Lean signatures with actual owner
   types, and elaborate the complete suggested file in an existing build
   containing the required pinned Tau Ceti modules.

Preserve the scalar's two different Frobenius factors, inverse-twist/Gauss
convention, period-one versus Néron differential, second-minus-first diamond,
half-conjugate source regulator, and residue-field-before-norm rule. A
horizontal certificate alone gives no new global arithmetic-integrality claim
or p-adic special-value proof.

At assembly, synchronize the reader's old baseline count (sixteen) to eighteen
and make the 11a3 period-one differential explicit beside its inherited parent
scalar. These are recorded review clarifications, not unresolved mathematical
contradictions or reasons to re-review the accepted pass. No other orchestrator
question remains. Public URLs, versions, hashes and the detailed reasoning
are in the packet/report; no scratch file is needed for continuation.
