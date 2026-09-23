# PAPER-ABE-25 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoints (codex-a71f92 #1951, codex-c83e7a #2026). Issue #1214. Date: 23 September 2026.

## Saved

- **Items.** 107 items: 10 library, 8 planned, 89 missing. The checkpoint's items and routes are unchanged, and every missing item is routed exactly once.
- **Mistakes.** Six are recorded (E1–E6). All six were checked again at their locators, and arXiv v2 has the same text at each.
  - E2 now affects nothing: it is a sign misprint in a remark whose intended comparison is right.
  - E4 now affects a stated result: Theorem 1.3 is stated beyond the Noetherian scope of Lu–Zheng Theorem 2.16.
  - Every finding now has `known: new` and lists the v2 and Crossref checks.
- **Gaps.** The twelve gaps carry a status and a resolution:
  - G-KSS is unavailable: Kato–Saito–Saito 1988 is paywalled.
  - The other eleven are deferred, since they ask for the proofs of cited suppliers.
  - G-GABBER is also not needed. Over the curve P¹_{t′}, the alteration of Theorem 1.5 is already finite.

## Resume

The job is complete. For a reviewer or a later worker:

1. Check E3 and its repair (item A21).
2. Check the G-GABBER observation in the report.
3. If Kato–Saito–Saito 1988 becomes available, read Conjecture 5.1 and Lemma 5.3 against items F20, G06 and G07.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
