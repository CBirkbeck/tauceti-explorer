# Handoff: REV-FunctionFieldArithmeticPartII--RS.2

This is the complete independent review for #8953, by Claude Code (Claude Opus 5.5), session `claude-8wSJsP`, on 14 October 2026. It reviews the Codex plan `BP-FunctionFieldArithmeticPartII--RS.2` (session `codex-p4L8sW`, PR #9648).

**Verdict.** Accepted, with corrections made in place. RS.2 coverage stays **planned**, not closed, and no implementation is claimed. The review report `research/blueprint/reviews/REV-FunctionFieldArithmeticPartII--RS.2.md` and the packet's `review.checked` list record every check and change.

**What changed.** The packet, reader and suggested file are synchronized.
- There are now 21 targets. The review added `RS.2/flat-torsor-tower-limit`.
- The packet has 40 API items, 25 unit tests, 18 baseline declarations (all read at the pins), 7 requests, 1 gap and 1 restructure proposal.
- The parent packet and the suppliers were read but not edited.

## What the next worker needs to know

- **Supplier map.** SchemeAndStackFoundations was merged into TauCetiRoadmap on 2026-10-14; main at 42d0023 was read. Every request to SF.0–SF.3 now names the merged README sections that supply it.
  - §0.1 relative Spec and §0.9 affine limits.
  - §1.1 fpqc descent and §1.15–§1.16 torsors.
  - §1.18 and §1.21: generic 2-fibre products and quotient stacks.
  - §1.21 also owns finite root stacks.
  - §2.3 torsor classes and §2.11 fppf Kummer.
  - §3.4 the Picard groupoid.
  - The quotient supplier moved from `DiamondsAndVStacks:D0` to `SchemeAndStackFoundations:SF.1`. That README calls D0.26 the (Perf, v) instance of its generic construction.
- **New node.** The only generic input no supplier states is the limit of a tower of finite flat torsors. The review added it as a node; its proof uses Stacks 01YX, 090N, 0245, 02KY, 02L2 and 02LA and the merged §§0.9, 1.1 and 1.15. The coframe and Kummer nodes now cite it.
- **Remaining gap.** Only RS2-NATIVE-CARRIERS remains: none of the carriers are at the pins. To close the stage, a worker must:
  1. implement or import those carriers;
  2. prove the tower theorem;
  3. type the geometric targets against the merged SchemeAndStackFoundations names.
- **Restructure.** The packet's `restructure` entry asks that FunctionFieldArithmeticPartII RS.1 import SchemeAndStackFoundations §1.21 for finite root stacks. RS.1 would keep a single comparison with the native root triples, plus what §1.21 does not state. The reviewer of RS.0 (#8951) should check the same overlap. The reserved key `FunctionFieldArithmeticPartII:key/root-stacks` would keep only the infinite case.
- **B24.** Springer refused automated access to the version of record. The reader now records the matching locators in arXiv:2108.13397v3: §2 p.4 and §3 p.6. TV17 and AGV08 hashes match the packet.
- **E12.** Confirmed in AGV08 v2, Appendix B.2, condition (3), p.53.

## Validation

- `scripts/check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings.
- `intake.py check-files` on the three deliverables: 0 problems.
- `lean-check` on the suggested file: 0 errors. The only warnings are 15 admitted-proof warnings.
  - The data definitions `RootKummer.coordinate`, `ofUnit`, `transition` and `compatibleFamilies` have real bodies.
  - `transition_ofUnit` is proved by `rfl`.
- A Sonnet agent ran an independent mechanical cross-check: reader sections against packet nodes, packet names against Lean declarations, prerequisites against baseline entries. It found no inconsistency.
- No scratch file is needed by the next worker. No tier move or second job was taken.
