# Handoff: REV-ModularCurvesPartII--R13.4a

Reviewer: Claude (Opus 5.5), session claude-Fph0CO, 2026-10-13. Issue #9396. Status: complete.

The review is finished. The verdict is **accepted**, with all corrections applied in place. The
packet's `review` object and `research/blueprint/reviews/REV-ModularCurvesPartII--R13.4a.md`
record every change. The reader was regenerated from the corrected packet.

What follow-up jobs need to know:

- **New requests to SchemeAndStackFoundations:SF.1.** There are two:
  - the étale-local structure of separated DM stacks over their coarse spaces (Abramovich–Vistoli
    2.2.3), with invariant strictly henselian and complete local rings;
  - quasi-coherent cohomology of stacks computed by the descent spectral sequence of a flat
    cover.

  The SF.1 blueprint should plan them.
- **`level-stack-geometry` (c) no longer says [X(n)/H̄]=𝒳_H[1/n].** That statement is false at
  the cusps. The consumers have been corrected: `proper-rigidifying-covers` and
  `coarse-level-quotients` in this packet. AlgebraicModularFormsAndSerreWeights R15.1–R15.2
  consume `proper-rigidifying-covers`. Its invariant description now holds for locally free
  sheaves and does not rely on p being a torsor.
- **Proposals for the next revision of the R13.3 packet** (recorded in `restructure`):
  - `R13.4a/coarse-normalization-comparisons` should cite or give way to `affine-open-identification`
    and `prime-diamond-agreement`;
  - `R13.4a/integral-coarse-curves` should take its stack from `deligne-rapoport-level-stack` for
    general H.
- **Open questions for the maintainer.** The report lists four. They concern the ownership
  overlaps with the R13.2 nodes, the R13.4a ↔ R14.1 stage loop, and the two requests to the
  partial SF.1 packet.

The suggested Lean file changed only in one docstring. `lean-check` at the pins elaborates it,
with warnings only for the proofs it leaves open.
