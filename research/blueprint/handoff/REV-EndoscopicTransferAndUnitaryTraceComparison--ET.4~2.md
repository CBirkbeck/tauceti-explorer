# Handoff: REV-EndoscopicTransferAndUnitaryTraceComparison--ET.4~2

Completed independent review for issue #9762 by Claude (Opus 5.5), session claude-YeeGju, 2026-10-14; the bot confirmed the claim on the issue. **Verdict: accepted** (complete target-level pass of ET.4, coverage planned). This is not a checkpoint. The full report, with the source table and the per-node ledger, is [the review report](../reviews/REV-EndoscopicTransferAndUnitaryTraceComparison--ET.4~2.md).

## What changed

- Packet `EndoscopicTransferAndUnitaryTraceComparison--ET.4.json`: now 34 ET.4 nodes (16 verified, 17 corrected, 1 added). The 45 ET.5/ET.6 records carried over from the first pass were removed because the refined ET.5 and ET.6 packets plan those layers and ask that the coarse records not be published beside them; `provenance.supersededInheritedNodes` lists every removed id with its successor and its ET.6a consumers. Corrections: Tamagawa numbers of G_n⃗ (ker¹ not trivial in general), L-morphism parity ε(N−nᵢ), Kottwitz's T_e, Arthur II Theorem 4.4 and §6 (there is no Theorem 6.4), Lai §7.2, Clozel–Labesse erratum attribution (E3), KMSW scope and Proposition 1.6.2, page references. Added `ET.4/unitary-induction-irreducibility` (Bernstein). New gap and restructure proposal for the unitary packet targets, which depend on ET.6.
- Reader: regenerated from the packet; introduction rewritten without process narration.
- Suggested file: ET.4 checks only, with the new parity check; `lean-check` exit 0, 12 `sorry` warnings, no errors.

## What the next jobs must do

1. **ET.6a**: retarget its fourteen prerequisites on removed ids (table in the review report and in `provenance.supersededInheritedNodes`). Until then `check_blueprint.py` on ET.6a reports them unresolved.
2. **Assembly or package**: place `tempered-unitary-local-packets`, `extended-unitary-local-packets` and `unitary-endoscopic-classification` in ET.7a (restructure proposal 4); they use `ET.6/full-wd-correspondence`.
3. **ET.5 consumers** of ι(G,H) and τ(G_n⃗): the value of τ(G_n⃗) is open in the cited sources when [F⁺:ℚ] is even and a block is odd; carry the ratio.
4. Primary sources not freely available (Bernstein 1984, Kottwitz 1988, Weil, Harris–Taylor) close the remaining gaps once registered.

## Checks run

`python3 scripts/check_blueprint.py` on the packet with the pinned declaration index: 0 errors, 0 warnings. `lean-check` on the suggested file (Mathlib 082e2d3, Tau Ceti f790474): exit 0, warnings only for `sorry`. `scripts/check_sorry_data.py`: clean. `research/blueprint/intake.py check-files` on all changed files: 0 problems. Reader against packet (scripted): every node field, request and gap present. Node graph of the five ET packets: acyclic, one recorded forward edge.

Scratch files are deleted after the pull request opens; nothing in them is needed to continue.
