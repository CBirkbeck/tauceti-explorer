# REV-ShimuraCompactifications — handoff

Issue #9402. Reviewer: Claude (Opus), session claude-uHy4x9, 2026-10-13. Verdict: **accepted after corrections**; the report is [REV-ShimuraCompactifications](../reviews/REV-ShimuraCompactifications.md).

## Done

- Packet: two structural fixes, the C0↔C1 layer cycle and the cycle through AutomorphicBundles B3–B5. One node added (`C5/roadmap/hodge-line-fourier-jacobi-expansion`). 32 nodes corrected. Requests rebuilt, B3/B4/B5 requests removed. Three `owners` entries and one `restructure` entry added (undeclared stage edges C1→C4 and C4→C3). Six source-issue verdicts, and the review object with all 148 per-node verdicts.
- Reader: every node section, dependency line, supplier contract and gap regenerated from the packet; the prose describing the old dependency order rewritten.
- Suggested file: unchanged. It elaborates at the pins and its only warnings are the eleven open proofs.

## For the orchestrator

1. At promotion, retire the part packets `ShimuraCompactifications--C0` and `--C6`, including the live `data/blueprints/ShimuraCompactifications--C6.*`. A build dry run shows layer C6's six planets twice otherwise.
2. Retarget 136 stale consumer citations of part ids through `continuation.nodeIdMap`. They are in AnalyticToricGeometryPartII, AutomorphicBundles--B5, HilbertModularVarietiesAndShimuraCurves--H0, HodgeTateAndCanonicalSubgroups--T0 and --T6, IgusaVarietiesAndTorsionConcentration and PerfectoidShimuraVarieties.
3. AutomorphicBundles should import what moved down:
   - the C4 Hodge-bundle API;
   - `C3/roadmap/coherent-cohomology-invariance`, for B3/refinement-canonical-extension;
   - `C5/roadmap/integral-coefficient-extension`, for Lan 2017 Definition 8.5;
   - `C5/roadmap/hodge-line-fourier-jacobi-expansion`, for B5/constant-term-restriction.
4. Declare the stage edges C1→C4 and C4→C3.
