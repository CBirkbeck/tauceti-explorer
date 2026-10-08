# Handoff: REV-HodgeStructuresPartII--H.6

Completed independent review of [issue #7063](https://github.com/CBirkbeck/tauceti-explorer/issues/7063), by Claude, session `claude-fH34gP`, on 8 October 2026. Input: `BP-HodgeStructuresPartII--H.6`, issue #6945, pull request #7362, written by another worker (Codex, session `codex-7aczLQ`). This is a finished review, not a checkpoint.

## What is done

The [review report](../reviews/REV-HodgeStructuresPartII--H.6.md) accepts the plan after corrections and gives the reasons. The [packet](../packets/HodgeStructuresPartII--H.6.json) carries the `review` object with a verdict for each of its 32 nodes (10 verified, 20 corrected, 2 added) and for the five source issues; the [reader](../readmes/HodgeStructuresPartII--H.6.md) is regenerated from the corrected packet and the [suggested file](../suggested/HodgeStructuresPartII--H.6.lean) is rewritten. The packet passes `scripts/check_blueprint.py` with the pinned declaration index (0 errors, 0 warnings), and the suggested file elaborates with `lean-check` at the pinned Mathlib with proof-placeholder warnings only. It imports Mathlib only and was not checked against Tau Ceti.

Coverage of `HodgeStructuresPartII:H.6` stays **planned**. Nothing is formalised.

## What remains, for the follow-up of H.6

1. Gaps G1–G6 and the seven requests of the packet. G5 and G6 are mathematics, not interfaces:
   - G5: containment of a one-variable period lift in finitely many Siegel sets for the canonical maximal compact. Schmid's Corollary (5.29) gives one Siegel set in his sense, built on a rational torus that need not be stable under the Cartan involution. Bakker–Grimm–Schnell–Tsimerman, arXiv:2112.06995, cited by the erratum of Bakker–Klingler–Tsimerman, is the first place to look; it was not read.
   - G6: the polarization pairs the Deligne pieces of the limiting structure compatibly, so that the isometry Lie algebra is bigraded. No layer owns it.
2. Parts of the sources not read by the review, listed in the report (the proofs in Schmid §8 and §9, Kashiwara §2.5–2.6 and §4.3–4.4).
3. The relative-filtration part of `nilpotentConeWeights` and the membership conditions of `oneVariableSL2` are left out of the suggested file; its docstrings say so.

## For the orchestrator

Six questions are at the end of the report: the monodromy filtration is planned in two roadmaps; distributive families of filtrations and complex-analytic nearby cycles have no clear owner; G6 has no stage; the source for G5; and four suppliers cited by node are under revision.

One new source issue, E-H6-5, concerns the printed statement of Cattani–Kaplan's Theorem (3.3)(ii). It is marked new after a web search only; the journal's errata listing and MathSciNet were not consulted.
