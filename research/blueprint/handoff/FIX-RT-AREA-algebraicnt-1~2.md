# FIX-RT-AREA-algebraicnt-1~2 — completed submission

Issue #6212. Codex (GPT-6), session `codex-IMcnvz`, 2026-10-17. Branch `codex-IMcnvz-fix-6212`.

Claim comment 6241149676 was confirmed by the bot in comment 6241152085. This run took one job. The work is complete and ready for the independent `REV-FIX-RT-AREA-algebraicnt-1~2` review; there is no unfinished mathematical work in this fix and no checkpoint to resume.

## What changed

The verifier confirmed only finding /1, narrowly: direct supplier contracts and derived reciprocal dependency records. Finding /2 was rejected and stays rejected.

At the starting checkout `fbed6652321ba8f2f7be5265fd76d85b336a757b`, the accepted 300-node parent packet and its promoted descendants already supply the twelve required edges. The stale packet restructuring proposal and reader still asked the maintainer to add them manually. The submission removes that obsolete instruction, adds six missing direct-consumer references to four existing requests, synchronizes the reader's imported-contract list to all 18 current packet requests, and documents the mathematical import boundary in the Lean comment. It does not change any mathematical node, hard prerequisite, baseline declaration, source, gap, coverage or historical review.

The detailed finding-by-finding report and twelve exact supplier/consumer contracts are in `research/blueprint/redteam/RT-AREA-algebraicnt-1.fixes-2.md`. No generated atlas record, campaign document or upstream source was edited. No ownership moved.

## Validation receipts

- Packet checker: 0 errors and 0 warnings; 300 nodes, 193 baseline declarations, 68 gaps, 18 requests, all seven stages partial.
- Scratch dependency check: all 15 requests belonging to the four named suppliers exactly match their direct node-prerequisite consumers; all 18 reader request entries match the packet.
- Isolated candidate `merge_blueprints`, current promoted `assemble(require_distances=False)`, and full assembly substituting this candidate parent packet each contain all twelve expected stage edges and all four reciprocal roadmap relations. Stage `requires` and `consumers` agree; no expected edge is skipped; no target stage reaches its supplier stage.
- Candidate substitution leaves the full assembly's stage-edge and roadmap-edge sets unchanged. The isolated merge has no reverse roadmap paths. The full assembly already has a reverse roadmap projection path to AdelicAlgebraicGroups through AbelianSchemesAndArithmeticModuliPartII, HilbertModularVarietiesAndShimuraCurves, WeightsInEtaleCohomology and ModularCurvesPartII. This unchanged external path is recorded for the maintainer in the report, not repaired in this job.
- `lean-check` completed in the provided pinned build with 701 admitted-proof warnings and no errors or other warnings. The suggested file has 3,268 lines; SHA-256 `ebdb5a70bf84b3b5bb030808dbf6677beed7eed51883fcb40b263f7640032e99`. No proof-completion claim is made.

The scratch probes and logs are disposable; the report contains their durable results. To reproduce the graph check, use `scripts.blueprints.merge_blueprints` on `data/atlas.json` and the candidate packet, then `scripts.build.assemble(require_distances=False)` with its promoted parent packet replaced in memory by the candidate. Compare the report's twelve edge pairs, stage reciprocity and four roadmap relations; compare edge sets against the unmodified promoted assembly. No source copying, source download or upstream build is necessary.

## Next step

Independent review of the submitted fix. Preserve the existing GN.3 Siegel-series owner, current-upstream registration gaps, supplier boundaries and historical review. Do not add a second owner or hand-edit generated `prerequisites`/`consumers`. Normal review/promotion/assembly derives the required export records.
