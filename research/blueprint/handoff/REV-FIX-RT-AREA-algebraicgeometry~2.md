# Handoff: REV-FIX-RT-AREA-algebraicgeometry~2

**Blocked checkpoint, 10 October 2026, Codex session `codex-wPmvcW`.** Refs [#5702](https://github.com/CBirkbeck/tauceti-explorer/issues/5702), reviewing author fix [#7968](https://github.com/CBirkbeck/tauceti-explorer/pull/7968). The bot confirmed this session's claim in comment `6093405571`. No second job was claimed. The self-contained [review report](../reviews/REV-FIX-RT-AREA-algebraicgeometry~2.md) continues [checkpoint #8213](https://github.com/CBirkbeck/tauceti-explorer/pull/8213) and contains the finding table, source locators/hashes, dependency counterexample, six pending verdicts and unchanged suggested-file receipts.

## The blocking assignment defect

The live issue names **five packet/suggested pairs** in both the outer deliverables and full instructions. Its queue job requires **eleven pairs**, or 23 outputs including the report. All outputs exist. Five packets already have this review's marker; six have another review's marker. `issues.deliverables_complete` is false for the actual queue job. Negative `needs_changes` verdicts are sufficient for completion, so no mathematical acceptance is needed to unblock the job.

[WORKERS.md](../WORKERS.md) says “Edit only the files the issue names, plus your own scratch space.” This session asked for explicit authorization to review/edit the additional six pairs while completing independent work. No authorization arrived. This checkpoint updates the five permitted verdicts, preserves their preceding review objects in `reviewHistory`, and clarifies SF.4's alteration-cover gap. The finite-etale assertion applies to the smooth pointed-curve locus after inverting the level prime; normalization across the stable boundary is finite dominant and projective (de Jong 2.24, p.62). The all-genus, at-least-three-marked range and pending supplier split remain. The report and handoff record the correction and evidence. The queue, absent review prompt, issue body, labels, six extra pairs, readers and upstream checkouts were not changed. This is a scope blocker, not an eight-hour timeout.

The mismatch predates the author merge `f0b79768c`. The author ledger and author queue already cover eleven packets. Repeating the five-pair marker refresh does not advance completion. Before dispatching another worker, authorize the six additional pairs explicitly and reconcile both issue lists. Restore the queue's missing review prompt while preserving the original independent-review instructions. Workers should not infer scope from a queue that contradicts the issue.

## Concrete remaining work after authorization

The extra basenames, in `research/blueprint/packets/<name>.json` and `research/blueprint/suggested/<name>.lean`, are:

1. `AdicCoefficientsAndComparisons`
2. `PELModuli`
3. `ShimuraCompactifications--C0`
4. `ShimuraVarieties--V0`
5. `GrossZagierAndArithmeticHeights--GZ.0`
6. `ShimuraData`

Read the report's six-packet disposition table. Preserve each existing review object in `reviewHistory`, then write `reviewer: independent-review-REV-FIX-RT-AREA-algebraicgeometry~2` with a current date. Keep **needs_changes** for PEL, compactifications, varieties, GZ and ShimuraData, with their documented substantive defects. Adic can receive bounded area-fix acceptance after the two-field correction below. This completes the review without accepting the five defective full blueprints. Suggested files need not be changed merely to write a negative review.

In Adic, fix `gaps[id=AdicCoefficientsAndComparisons/G-owners].detail` and the first rescope's `proposal`. SF.4 remains the unique schematic-alteration owner; L5 retains proper comparison descent/local calculations. Deleting SF.4-to-SF.5 breaks only the short cycle. A longer path through DD.5, Q3/Q4, A3, RF0:integral-Y, VB0, A4, PEL M2/M6 and MC.4 persists. Keep the MC.4 pointed-cover request at alteration nodes and split/reroute formal/cohomological consumers before adding a whole-stage MC.4-to-SF.4 edge. Preserve de Jong 2.24's every-genus/at-least-three-marks range and smooth-open finite-etale versus normalized-boundary finite/dominant/projective distinction. Keep MC.6 separate, RD.5 retargeting in its own job, and all eight existing gaps. The report gives the exact graph and field-level specification. Remove legacy source-excerpt fields from any additionally edited packet under the standing no-quotation rule; do not replace them with quotations.

Readers remain outside this review's deliverables. Their owners must synchronize the documented SF relative-Spec, V0 predicate and other reader corrections. Do not modify upstream or install any proposed edge here. In particular current AlgebraicVectorBundles already owns relative Spec and its universal/base-change interfaces; current Tau Ceti has RelativeSpec modules. Import them, never re-plan them.

## Fresh evidence from this session

- All eleven packet checks pass with zero errors and warnings; the five edited packets were rechecked after the final updates. The declared pinned index is: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
- The freshly assembled union graph has 15,601 edges and is acyclic. Removing the six bad SF.5 inputs remains acyclic. Adding the nine other ownership/criterion proposals jointly remains acyclic. MC.4-to-SF.4 creates a cycle either way. No edge was installed.
- Public de Jong, Tate, Artin, SGA 1 and Huber–Muller-Stach passages were freshly read; URLs, exact locators and PDF hashes are in the report. Tate's component table was visually inspected. No restricted book pagination was newly certified and no source passage was committed.
- The ten positive suggested-file hashes are unchanged and match session `codex-C7DgOu`'s receipts. These ten Lean checks were not rerun here; the report labels them inherited. The compactifications full-file positive receipt supersedes its old missing-olean limitation but not its missing-signature objection.
- One fresh sequential `lean-check`, after a memory check, ran on full unchanged ShimuraData. It exits 1 at the 100-error limit, with **66 printed error headers** and **113 warning headers** (110 sorry, three other). The counts agree with the preceding checkpoint's correction of an older 101-diagnostic assertion. First errors concern non-callable Hodge.Conjugation, comodule inference, gradedRealHodge carrier transport and reserved GL binding. Five D0 semantic bridge objections independently remain. No Lean process is left running.
- The shared build's Mathlib commit matches the pin; all 5,477 Tau Ceti source files match the deployed baseline byte for byte. Current upstream roadmap/library commits read separately are `dea8191cc6047d6142a65872ebce6eeeb841a29b` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No Lake command ran in those read-only checkouts.
- Submission path checks and whitespace checks pass. Actual queue completion remains false. The five permitted packet verdicts, SF.4 gap clarification, report and handoff are submitted. All necessary evidence is durable here or in the linked preceding review, so no scratch file needs to survive.

After authorization and the six verdict writes, rerun the packet/path/whitespace checks and the actual queue completion predicate. Submit a complete review PR with `Refs #5702`, accurately separating fresh and inherited Lean evidence. Do not claim a second job during the same run.
