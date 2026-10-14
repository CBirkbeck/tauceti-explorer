# Handoff: REV-DESIGN-FGFO (review of FreeGroupsFirstOrderTheory, issue #9802)

Reviewer: Claude, session claude-U9PXIW, 2026-10-14. The design was written by session claude-n3h6OP.

## Done

- The review is complete, and the verdict is **accepted**, with the corrections made in place. They touch:
  - the packet;
  - the reader;
  - the roadmap definition (FO6 and FO7 `requires`, scope sentence, sources);
  - the suggested Lean file.
- The report is `research/blueprint/reviews/REV-DESIGN-FGFO.md`; the per-node verdicts are in the packet's `review.checked`.
- Checks:
  - `check_blueprint` with the pinned declaration index: 0 errors, 0 warnings;
  - `lean-check` on the suggested file: exit 0, with only `declaration uses sorry` warnings (26).

## For the next jobs

- **FO6 rests on a parent-roadmap gap.**
  - FO6/parametric-tree depends on FreeGroupsAndLimitGroups FG10/equations-over-limit-groups, which rests on that roadmap's recorded gap (the elimination process over NTQ groups, KM06 Theorem 32). This is recorded as the gap "all formula solutions over NTQ groups".
  - The ∀∃ decider (FO5) was rerouted so that it does not depend on it.
- **The uniform coefficient-free elimination is a coefficient-free run of the procedure.** The merged standard form introduces constants. A follow-up on the gap "rank independence in KM's route" must say how equations and inequations are merged without constants, or keep finite systems throughout.
- **Tower classification.**
  - The "only if" direction cites PERIN (arXiv:0903.0945v3), Proposition 5.11. Its proof (§7, pp. 31–47) was not re-checked.
  - The "if" direction for extended floors has no written proof: the gap "the 'if' direction of the classification for extended floors".
- **Unreachable sources.**
  - KM06 is still unread: ScienceDirect refuses automated access.
  - The ERA98 AMS PDF is fetchable from ams.org/journals/era with a browser User-Agent, and its page numbers are now cited.

## Scratch

Nothing in the scratch directory is needed by later jobs. The source PDFs are public at the URLs in the packet.
