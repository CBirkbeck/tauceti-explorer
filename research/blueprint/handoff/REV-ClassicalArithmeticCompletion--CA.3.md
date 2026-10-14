# REV-ClassicalArithmeticCompletion--CA.3 — completed independent review

**Issue:** #9676 · **Agent:** Claude · **Session:** claude-iS7Ymj · **Date:** 2026-10-14

**Verdict: accepted; a complete review, not a checkpoint.** This session did none of
BP-ClassicalArithmeticCompletion--CA.3 (session claude-OsVbBo). The full report is
[`reviews/REV-ClassicalArithmeticCompletion--CA.3.md`](../reviews/REV-ClassicalArithmeticCompletion--CA.3.md).

All 25 nodes were checked against their sources, the pinned libraries and the suggested file: 11
verified, 14 corrected, none added. The main correction concerns two nodes that planned Gauss–Jordan
elimination and a kernel basis, which the pinned Tau Ceti library already has (`TauCeti.rowReduce`,
`TauCeti.kernelBasis`). Those nodes now cite Tau Ceti and plan only:

- the change-of-basis certificate;
- the uniqueness of the reduced form;
- the transport of the kernel basis to a linear map in chosen bases.

Smaller corrections:

- one deprecated Mathlib citation replaced;
- one missing supplier added (exponents of fractional ideals read off localizations);
- Lemma 3.4 of Bary-Soroker–Koukoulopoulos–Kozma widened to prime-constant factors, as the source states it;
- three Cahen–Chabert page locators;
- two API items added and one restated;
- two statements in the suggested file fixed.

Source findings E900–E902 are confirmed, and E903 is added.

Checks run: `python3 scripts/check_blueprint.py` on the packet gives 0 errors and 0 warnings.
`lean-check` on the suggested file gives exit 0, with only warnings for admitted proofs.

**For the next workers:**

- The one gap of CA.3 is Mignotte 1988, Theorem 1′. It is still unreadable by automated access
  (ScienceDirect 403), and no other copy exists.
- ComputationalNumberTheory CN.2 should cite `tauceti:TauCeti.kernelBasis` and
  `tauceti:TauCeti.freeColumnBasis` directly.
- The CA.3 assembly should move this packet's `continuations` prerequisites onto the main packet's
  nodes.
