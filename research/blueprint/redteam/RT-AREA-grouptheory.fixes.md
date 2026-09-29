# RT-AREA-grouptheory: fixes

Fixer: Claude Code, session `cc-fb70e5`, 29 September 2026 (issue #3982, job FIX-RT-AREA-grouptheory).
- Findings: `RT-AREA-grouptheory.result.json`.
- Verdicts: `RT-AREA-grouptheory.review.json`. The one finding was confirmed.

## /1 (medium, library-claim): wrong Mathlib name in ProfiniteProPGroups Layer 3: maintainer note

**Why no file changes.** The target is the Tau Ceti roadmap `tauceti:TauCetiRoadmap/ProfiniteProPGroups`, whose text lives upstream. This atlas mirrors it in `data/atlas.json` (stage `…#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`) and never re-plans a Tau Ceti roadmap (PROTOCOL.md §15). The fix is therefore a note for the Tau Ceti maintainer, as the finding and its review both say.

**Check at the pins.** The mirrored stage text still reads "*Needs:* M `frattini`, M `IsPGroup.exists_maximal_subgroup_normal` and the finite Frattini lemmas".

The pinned declaration index for Mathlib 082e2d3 and Tau Ceti f790474 has no declaration whose name contains `exists_maximal_subgroup_normal`. The three declarations of the proposed route exist and state what the route needs; I read each at the pinned Mathlib source:

| Declaration | Location | What it gives |
| --- | --- | --- |
| `IsPGroup.isNilpotent` | `Mathlib/GroupTheory/Nilpotent.lean:1247` | A finite p-group is nilpotent (`[Finite G]`, `Fact (Nat.Prime p)`). |
| `Group.normalizerCondition_of_isNilpotent` | `Mathlib/GroupTheory/Nilpotent.lean:1201` | `IsNilpotent G → NormalizerCondition G`. |
| `Subgroup.NormalizerCondition.normal_of_coatom` | `Mathlib/Algebra/Group/Subgroup/Order.lean:47` | Under the normalizer condition, an `IsCoatom` subgroup is `Normal`. |

`frattini` (`Mathlib/GroupTheory/Frattini.lean:24`) resolves as cited.

**Note for the Tau Ceti maintainer.**

1. Replace Layer 3's *Needs:* line with: "*Needs:* M `frattini`, M `IsPGroup.isNilpotent`, M `Group.normalizerCondition_of_isNilpotent`, M `Subgroup.NormalizerCondition.normal_of_coatom` and the finite Frattini lemmas".
2. Alternatively, contribute the composite lemma "a maximal subgroup of a finite p-group is normal" under the cited name. `IsPGroup.isNilpotent` supplies the `IsNilpotent G` instance for `Group.normalizerCondition_of_isNilpotent`, and its result is the hypothesis of `Subgroup.NormalizerCondition.normal_of_coatom`. No Lean term was compiled here, since the shared machine does not build Lean.

The layer's own targets are unchanged: the index-p Frattini characterisation, `proPFrattini` and the elementary-abelian quotient.
