# PAPER-CHARLES-16 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoints (codex-c83e7a and earlier) and cc-fb70e5's repair of item 50. Issue #1188. Date: 23 September 2026.

## Saved

- **Items.** 173 items: 16 library, 17 planned, 140 missing. Every missing item is routed exactly once, and every numbered statement is an item.
  - /113 now states Lemma 4.5 in corrected form: after a finite extension removing the Frobenius eigenvalue −1, and with −1 among the p_i. It is proved from the rational discriminant −g(1)g(−1)·disc NS, and routed.
  - /127 states the hypotheses of Proposition 3.17 for the partners X_n and is routed.
  - /cayley-discriminant (det V ≡ g(1)g(−1) for an isometry without eigenvalues ±1) and /143 (Remark 3.9) are new.
- **Mistakes.** Twenty-one are recorded (E1–E21), all confirmed at their locators.
  - **E8**'s correction now gives the repair; it still affects only the proof.
  - **E18–E20** are new misprints.
  - **E21** is new: the proof of Theorem 1.3 applies Proposition 3.17 to the X_n without showing they are nonsuperspecial.
- **Gaps.**
  - G1 and G2 are resolved.
  - G4 is recorded as E21; building the family behind the ampleness of H_n is a supplier step.
  - G3, G5 and G6 are deferred as supplier proofs.
- **Reading.** The whole published paper was read, together with Lieblich–Maulik–Snowden at the findings' locators.

## Resume

The job is complete. For a reviewer or a later worker:

1. Check item 113's corrected Lemma 4.5 and its proof steps.
2. Check E21. A proof that infinitely many admissible X_n are nonsuperspecial, or a finiteness statement for superspecial partners, would close it.
3. The characteristic 2 and 3 audit of Frobenius semisimplicity and the comparison inputs (G3) is what Theorem 1.4 needs in those characteristics.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. The Cayley discriminant formula was checked on 272 random rational isometries in exact arithmetic. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
