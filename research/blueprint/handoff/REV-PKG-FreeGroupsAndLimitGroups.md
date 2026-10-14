# REV-PKG-FreeGroupsAndLimitGroups — handoff

Refs #9736. Claude, session `claude-aroFvz`, 2026-10-14. This review is independent of the package author (Codex, session `codex-3H3T14`, #9735, PR #9787). It is one completed fixing review; I claimed no second job.

**Complete: accepted with fixes.** The full report is `research/blueprint/reviews/REV-PKG-FreeGroupsAndLimitGroups.md`, and the verdict is in the package's `review.json`. I edited no packet and no other roadmap's files.

## Done

- **Duplication with Tau Ceti at the pin.** Malnormal subgroups are `TauCeti.IsTISubgroup` (TauCeti/GroupTheory/TrivialIntersection.lean, f790474). The package's `Subgroup.IsMalnormal` target is removed. CSA groups are stated through `TauCeti.IsTISubgroup`, and the conventions, scope and "From Tau Ceti" contracts cite it. In Suggested.lean, `IsMalnormal` and `IsCommSubgroup` are replaced by `TauCeti.IsTISubgroup` and Mathlib's `IsMulCommutative`; the file now imports `TauCeti.GroupTheory.TrivialIntersection`.
- **Suppliers.** Added Mathlib's `FreeGroup.injective_lift_of_ping_pong` (§5.8). Corrected two lemma names to their forms at the pin.
- **Locators.** Fixed LIMITS labels (§8.4), GL-JSJ Remark 2.13 (p. 26), the page basis of the JSJ and LIFT references (journal pages in the running heads), and LIFT "Introduction" in place of §1.
- **Mathematics and wording.** Fixes in §§2.7(4), 5.2, 6.10, 8.4, 8.5, 10.3 and 11.7, and the order of `primrec_mk`; the details are in the report.
- **Lean.** `lean-check` exits 0 with 114 warnings, all `declaration uses sorry`. The input file also passed: exit 0, 116 warnings.
- **Coverage.** All 126 plan targets and 223 Checks are kept, and 290 of the 291 API names; the one removed is the duplicate.

## Remains (for the maintainer or follow-up jobs)

- **§10.10.** The represented-limit-group solver stays an explicitly marked gap (KM06 Theorem 32).
- **MAK and MAK82.** The Math-Net.ru full texts would not download in this run. The printed-page locators are as inherited; the plan review read the statements.
- **Serre's Trees.** The book is not freely available, so its chapter locators stay marked supplementary and unverified.
- **Errata candidate.** IFT Theorem 2(4)–(5), p. 9 (arXiv v2), prints radicals that do not contain the equation. It is not among the packet's source issues E1–E3, and could go into the register of mistakes in published sources.
- **Package follow-ups.** Those listed in the package handoff are unchanged: §6.4, §7.6, Layer 10 units, §11.4 and LIFT's liftability decision.
