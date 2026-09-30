# REV-RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_ClassicalGroups

Independent verification of the red-team result on the ClassicalGroups link map. Reviewer:
Claude Code, session `cc-c2c06b`, 30 September 2026. Issue #4369. I did none of the
link map (`cgp-87a9defc4f57`), its review (`codex-a71f92`) or the red team (`codex-J6LwjP`).

**Verdict: the one finding is confirmed** (medium). The review asked to "choose one early
owner" of the diagonal tensor-power action. The pinned library has already chosen, and it
chose ClassicalGroups. So the missing link ClassicalGroups Layer 1 → SchurWeyl Layer 8
should be added.

## What I checked

**The map's own text.** `overlaps[4]` was added by the review, which declined to make it a
dependency because "the present contracts do not decide ownership". Its two quotes are
literal:

- ClassicalGroups README lines 202–203: `tensorPowerRep n d`, "the `d`-fold tensor power of
  `stdRep` (diagonal action)";
- SchurWeyl README line 348: `glAction d n g = PiTensorProduct.map (fun _ => g)`.

SchurWeyl's `tensorSpace d n` has dimension `d` and degree `n`. The two constructions are
therefore the same, with the parameter names swapped.

**The pin decides it.** At Tau Ceti `f790474`:

| Declaration | Location | Role |
| --- | --- | --- |
| `Representation.tensorPower`, `tensorPower_apply` | `RepresentationTheory/Tensor/Power.lean:100, 106` | generic diagonal action, `= PiTensorProduct.map` factorwise |
| `TauCeti.tensorPowerRep` | `ClassicalGroups/TensorPower.lean:55` | `(stdRep k n).tensorPower d` |
| `commute_permTensorAction_tensorPowerRep` and the group-algebra version | `ClassicalGroups/TensorPower.lean:67, 74` | commuting actions, docstring: "the first Layer 2 target of the classical-groups roadmap" |
| `reindexRepresentation`, `permTensorAction` | `Symmetric/TensorAction/Basic.lean:48, 107` | the permutation side |
| GL/S_d centralizer theorems | `Symmetric/TensorAction/GeneralLinear.lean:67, 77, …` | **import `ClassicalGroups.TensorPower` (line 8)** and are stated with `tensorPowerRep`, under `[Field k] [Infinite k] [NeZero (d ! : k)]` |

The Schur–Weyl implementation consumes the ClassicalGroups constructor, so this is a
producer and a consumer, not two independent definitions.

**The graph.** The production assembler gives 2840 stages and 8007 edges. The edge is absent,
and neither stage reaches the other, so adding it is acyclic. I added the proposed link to a
scratch copy of the packet, and `check_links.py` reports 0 errors and 0 warnings.

## A refinement for the fixer

`overlaps[4]` says to keep the permutation commutation "in SchurWeyl". The pin puts the
commuting-actions theorem in ClassicalGroups' file and credits it to ClassicalGroups
Layer 2. The red team's fix already says to consume the existing permutation-commutation
results. The fixer should follow that wording, and should not commission the commutation
again on either side.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_ClassicalGroups.review.json`:
  ok.
- No Lean was compiled. None belongs to this job.
