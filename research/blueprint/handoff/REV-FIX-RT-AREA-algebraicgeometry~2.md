# Handoff: REV-FIX-RT-AREA-algebraicgeometry~2

**Blocked checkpoint, 10 October 2026, Codex session `codex-Mmu7hk`.** Refs [#5702](https://github.com/CBirkbeck/tauceti-explorer/issues/5702), reviewing author fix [#7968](https://github.com/CBirkbeck/tauceti-explorer/pull/7968). [Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/5702#issuecomment-6093731858). No second job was claimed. The [review report](../reviews/REV-FIX-RT-AREA-algebraicgeometry~2.md) carries the source locators, hashes, all 32 finding dispositions, exact graph counterexample, six pending verdicts and suggested-file receipts.

## Why the job still cannot complete

The live issue names five packet/suggested pairs in both its outer deliverables and full instructions. Its queue job requires eleven pairs. All outputs exist, but six packets have another review's marker, so `issues.deliverables_complete` is false. A negative `needs_changes` verdict would complete those reviews; implementing the unresolved mathematics is unnecessary.

[WORKERS.md](../WORKERS.md), Doing the work, requires “Edit only the files the issue names, plus your own scratch space.” This session asked the manager for explicit authorization for the six additional pairs while performing independent read-only checks. No reply authorizing them arrived before this checkpoint. No additional packet, suggested file, reader, queue, prompt, issue body, label or upstream checkout was edited. The five permitted markers already exist and were preserved; repeating their refresh would not advance completion.

Authorize the six pairs and reconcile both issue lists before redispatching this job. The missing review prompt also needs administrative repair that preserves the original independent-review instructions. The mismatch and preceding checkpoints are documented in [#8213](https://github.com/CBirkbeck/tauceti-explorer/pull/8213) and [#8221](https://github.com/CBirkbeck/tauceti-explorer/pull/8221).

## Apply after authorization

The extra basenames, each in `research/blueprint/packets/<name>.json` and `research/blueprint/suggested/<name>.lean`, are:

| Basename | Completed review verdict to record |
| --- | --- |
| AdicCoefficientsAndComparisons | accepted for the bounded area-fix disposition after the two-field repair below |
| PELModuli | needs_changes: domain-set Shimura datum, uncharacterized Hodge multiplicities, and a non-divisibility statement in place of reflex-field unramifiedness |
| ShimuraCompactifications--C0 | needs_changes: 83 geometric declarations, 109 API items and 84 tests remain comments |
| ShimuraVarieties--V0 | needs_changes: all-type automorphic boundary predicate and reader/signature defects remain |
| GrossZagierAndArithmeticHeights--GZ.0 | needs_changes: broader source-version, supplier and native carrier/API/test defects remain |
| ShimuraData | needs_changes: five D0 bridge defects and full-file elaboration errors remain |

Preserve each full preceding `review` object unchanged in `reviewHistory`, including checked-node ledgers. Write `reviewer: independent-review-REV-FIX-RT-AREA-algebraicgeometry~2`, the current date, and notes naming the session, preceding review, scoped finding verdict and unresolved broader defect. The five issue-listed packets already have this marker; no further refresh is needed. Suggested files need not be changed to record a negative verdict.

In Adic, repair `gaps[id=AdicCoefficientsAndComparisons/G-owners].detail` and the first rescope's `proposal`. SF.4 remains the unique schematic-alteration owner; L5 retains comparison descent/local calculations. Deleting SF.4-to-SF.5 breaks only the short cycle. The longer SF.4 → DD.5 → Q3 → Q4 → A3 → RF0:integral-Y → VB0 → A4 → PEL M2 → PEL M6 → MC.4 path persists. Keep the pointed MC.4 cover request at alteration nodes; require splitting or rerouting formal/cohomological consumers before adding a whole-stage MC.4-to-SF.4 edge. Preserve de Jong 2.24's every-genus/at-least-three-marks range and smooth-open finite-etale versus normalized-boundary finite/dominant/projective distinction. Keep MC.6 separate, RD.5 retargeting in its own job, all eight existing gaps, and all supplier requests. The report supplies the exact field-level specification.

Readers are outside this review's deliverables. Their owners must synchronize the documented corrections. Current AlgebraicVectorBundles already owns relative Spec and its universal/base-change interfaces; current Tau Ceti has RelativeSpec modules. Import them rather than re-plan them. Install no proposed edge and write no upstream file here.

## Fresh checks and inherited receipts

- All eleven packet checks pass with zero errors and warnings, with the pinned declaration index. The pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
- The newly reconstructed graph has 15,601 edges and is acyclic. Removing the six SF.5 inputs remains acyclic. The nine other ownership/criterion proposals jointly remain acyclic. MC.4-to-SF.4 creates a cycle either way.
- Public de Jong, Artin, SGA 1, period-comparison and Tate source loci were read anew; the fetched PDF hash matches the report. Current upstream/library commits are `4dd92d30699e43999f5102255f44bca1af475471` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- All eleven suggested-file hashes match the report. Ten positive exact-pin compilations belong to `codex-C7DgOu`; the unchanged ShimuraData failure belongs to `codex-wPmvcW`. No Lean check was rerun here, since no Lean file or baseline changed and the negative signature conclusions are independent of compilation. The previous ShimuraData log has 66 printed error headers before the 100-error limit and 113 warning headers, three of them other than admitted-proof warnings.
- All eleven packets currently contain zero legacy source-excerpt fields. Only the report and this handoff changed. The inherited report's inaccurate PEL claim was corrected: `IsGoodPrime.unramified_reflex` concludes non-divisibility of an integer and does not formulate unramifiedness of the actual reflex field. Packet/path/whitespace checks pass; queue completion remains false. No process remains running and no scratch file is needed by the next worker.

After authorization, apply the bounded Adic repair and six verdicts, rerun the packet/path/whitespace checks and actual queue completion predicate, and submit a complete review PR with `Refs #5702`. Preserve the distinction between fresh checks and inherited compilation evidence. Do not claim a second job in that run.
