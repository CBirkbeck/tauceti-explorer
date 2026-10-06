# REV-HabiroRings--HR.4 handoff

Issue #6452. Codex, session `codex-QQJCV7`, 6 October 2026. The bot confirmed
the claim before work started. This is a finished independent review,
accepted after corrections, not a checkpoint. The planning input was
written by session `codex-IS3oVl` for issue #6500.

The packet remains `complete`, with HR.4 coverage `planned`. It has seven
nodes, 24 API items, seven tests, two new planets, 20 pinned baseline
citations, four supplier requests and two gaps. No node was added; four
were corrected and three verified. All implementation statuses remain
`unchecked`. Source issues E15–E17 are independently confirmed. E15's
author-copy locator is corrected to p.33, while its v5 locator is p.34.

The full evidence, per-node reasoning, baseline statements, ownership check
and correction list are in
[the review report](../reviews/REV-HabiroRings--HR.4.md).
Public source URLs, hashes and dates remain in the packet. The reader,
parent packet, supplier files and atlas data were not edited.

Corrections expose the split Jacobian constructor proof, add the existing
all-power completion kernel theorem and direct map/overlap prerequisites,
fix suggested reduction maps to their actual formulas, and strengthen the
nilpotent and series tests to check canonical maps and the polynomial base.
The declaration and API counts are unchanged except for the added baseline.

Checks:

- Packet checker: zero errors and zero warnings.
- Revised suggested file: `lean-check` exit 0, 32 expected `sorry` warnings,
  no errors or other warnings, using only Mathlib at the exact pin.
- Mathlib statements were read at `082e2d37e8b0463410cdb532e111cd43d5a66174`;
  Tau Ceti source was read at `f790474821cf4256814db967cb154e7af3d0c369`.
  No project build, language server or cache download was started.

Follow-up and assembly:

1. Keep QW.0's general ordinary big-Witt étale/Frobenius-pushout obligation
   and the exact DD.1/E1/E5:abstract refinements open. Supply actual enhanced
   carriers before typing the two named enhanced mathematical omissions.
   HR.3's generic supplier gaps remain inherited. This review does not
   discharge them.
2. Use the reader's refined finite-stage deformation proof and global
   staticity proof when assembling. Underlying-module cyclotomic cofibre
   reduction commutes with limits; a general completion reflector need
   not. Do not assume surjectivity of divisor transitions or replace the
   derived quotient by an ordinary quotient in the universality theorem.
   Reconcile the read-only reader's original nineteen-citation count and
   findings awaiting review with the twenty citations and confirmed verdicts
   in the reviewed packet.
3. Follow accepted RS-10, reviewed by `independent-review-REV-RS-10~2`, for
   RT-AREA-etale/27. Move the interim big-Witt/Λ and degree-zero q-Witt
   interfaces atomically to QW.0–QW.4 upon installation. HR.4 retains the
   relative Habiro construction and its comparisons; HQ.4 retains positive
   degree. Preserve current HR.4→HQ.4, HQ.4→HQ.3 and CR.4→HQ.4 arrows.

No blocking question remains. Scratch source copies and compile logs can be
deleted after submission; the repository files contain the handoff evidence.
