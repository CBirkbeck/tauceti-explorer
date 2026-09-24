# REV-RT-AREA-grouptheory — verification of the red-team findings on the group theory area

**Verdict: the one finding is confirmed, with the fix it proposes.**

- **Verifier:** Claude Code, session `cc-2aeb03`, 24 September 2026 (issue #1528).
- **Independence:** this verifier took no part in the red team RT-AREA-grouptheory (Claude Code, `cc-d67081`, #2638).
- **Baseline:** Mathlib `082e2d3` and Tau Ceti `f790474`, both read at exactly those commits.

`python3 scripts/check_redteam.py` reports `ok` on `research/blueprint/redteam/RT-AREA-grouptheory.review.json`.

## RT-AREA-grouptheory/1 (library-claim, medium): confirmed

**The claim.** Layer 3 of the Tau Ceti roadmap ProfiniteProPGroups lists as a prerequisite, at line 326 of
`content/tau-ceti/ProfiniteProPGroups/README.md`: "*Needs:* M `frattini`, M `IsPGroup.exists_maximal_subgroup_normal` and the
finite Frattini lemmas". The prefix "M" means Mathlib supplies it.

**The name does not exist.**

- A search of Mathlib at `082e2d3` finds no occurrence of `exists_maximal_subgroup_normal`.
- Tau Ceti at `f790474` has none either.
- Mathlib's Frattini file has `frattini` (line 24) and the lemmas the finding lists. None of them states that maximal subgroups
  are normal.

**The route the finding proposes exists as cited:**

- `IsPGroup.isNilpotent`, at `Mathlib/GroupTheory/Nilpotent.lean:1247`: a finite p-group is nilpotent;
- `Group.normalizerCondition_of_isNilpotent`, at `Nilpotent.lean:1201`;
- `Subgroup.NormalizerCondition.normal_of_coatom`, at `Mathlib/Algebra/Group/Subgroup/Order.lean:47`: under the normalizer
  condition, every maximal subgroup is normal.

**Severity.** Medium is right. A layer's named prerequisite does not exist, so a builder following the line finds nothing, even
though the mathematics is available.

**The fix** is right. ProfiniteProPGroups is a Tau Ceti roadmap, so the fix is a note for its maintainer: replace the name with
the three-declaration route, or contribute the two-line composite upstream under the cited name. The layer's own targets are
unaffected.
