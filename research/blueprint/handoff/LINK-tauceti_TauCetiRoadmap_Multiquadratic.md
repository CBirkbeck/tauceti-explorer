# LINK-tauceti_TauCetiRoadmap_Multiquadratic — working checkpoint

Worker: **ChatGPT Pro — cgp-9dbda3a312c1**. Issue #51.

The existing claim was accepted by comment 5697601574 for claim comment 5697599936 and rechecked in this run. Continuation input: `dbafc759460581dbd23999a3c112149fedefe2b5`. The original claim used `088ac3dcfb573a1e875fcea971ce54526bbe74d3`. This continuation uses only the two authorized output paths. It is not yet a submitted or completed job.

## Preserved findings

One explicit link: the early square-class prefix of Multiquadratic Layer 0 supplies QuadraticFormInvariants Layer 0. Two ownership overlaps: EffectiveBounds Layer 1 shares the unit-square-index migration with Multiquadratic Layer 2; GlobalNumberFields Layer 2 and Multiquadratic Layer 3 both claim the narrow-class definition.

Do not duplicate the NumberFieldArithmetic packet's existing quadratic-Frobenius overlap or the ClassFieldTheory packet's existing Layer 13 -> Multiquadratic Layer 3 link.

## Source correction requiring owner attention

The full prime-discriminant compositum is not the ordinary genus field for every real quadratic field. For discriminant 12=(-4)(-3), the compositum contains i, hence complexifies the real places of Q(sqrt(3)). The source defines the ordinary genus field as unramified also at infinity. Its full-compositum sentence must instead be scoped to the narrow convention (or to the imaginary case); the ordinary real case needs the real-place restriction. Do not silently identify the narrow and ordinary class groups or Cl/Cl^2 with Cl[2].

## Pinned source checks

Pins: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.

Opened the actual Tau Ceti `TauCeti/FieldTheory/SquareClassGroup/Basic.lean` (blob `5036e226b877eaa720c5431af9101ed7513a8d70`): `SquareClassGroup`, `squareClass_eq_zero_iff`, and `linearIndependent_squareClass_iff`. These use a field, and the independence statement uses a finite family of units; the prefix has no characteristic restriction. The README's old flat `SquareClassGroup.lean` path returns 404 at this pin. Opened the actual Mathlib `Mathlib/Algebra/Group/Subgroup/Even.lean` (blob `f23e823e8cd328bd93cd60fb49306641ecd31ee1`): `Subgroup.square` and `Subgroup.mem_square` assume a commutative group. Both repositories were searched; current search hits were discovery only, and no absence is claimed. No Lean execution occurred.

## Remaining work and checks

Finish the catalogue screen, remaining primary-stage checks and duplicate/cycle checks, then expand `examined` with the actual read levels. The complete `data/roadmap-summaries.json` was read; summaries alone are not full-stage verification. Record the rest of the upstream screen explicitly.

Local checkpoint JSON parsing passed. The full repository checker has not run locally because the full atlas is not available to this execution environment. `.github/workflows/swarm-check.yml` includes changed link files and runs `python3 scripts/check_links.py` in the full repository on pull requests; obtain its actual result, not an assumed pass. A structural pass is not mathematical approval.

Re-fetch issue ownership and relevant input revisions, upload the final two files and open a PR before considering another claim. Do not /unclaim a submitted job. No queue/default-branch/source-roadmap changes, git commands, Lean implementation, approval or merge have been performed by this continuation.
