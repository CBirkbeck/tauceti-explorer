# Handoff: REV-EtaleDualityAndPerverseSheaves--EDC.0

**Complete independent review; verdict needs_changes.** Codex, session `codex-akfhVD`, 6 October 2026, issue #398. Reviewed the original blueprint by Claude `claude-eGs7SM`; this is not a checkpoint. Do not assign this review's remaining findings as unfinished review work: they are the original blueprint's revision work.

The [review report](../reviews/REV-EtaleDualityAndPerverseSheaves--EDC.0.md) gives all 50 node findings, every changed field, the 40 retained pinned baseline declarations, all ten confirmed source issues, exact missing API/test names, supplier and ownership checks, and the two required red-team route checks. The [packet](../packets/EtaleDualityAndPerverseSheaves--EDC.0.json) contains the complete review object and corrected mathematics, citations, counterexamples, prerequisites and explicit gaps. No nodes were added. The [suggested file](../suggested/EtaleDualityAndPerverseSheaves--EDC.0.lean) contains the clear signature corrections and accurately describes the missing signatures.

## Checks completed

- `python3 scripts/check_blueprint.py research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.0.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/EtaleDualityAndPerverseSheaves--EDC.0.lean`: exit 0 at pinned Mathlib, 135 warnings all for declarations using `sorry`, no other warning or error. Only an English comment changed after this elaboration; the typed code is identical. The existing shared build was used, with sufficient memory and one invocation at a time. No Lean process was left running.
- All six public PDF hashes match the packet, all 94 excerpts are literal after Unicode/whitespace normalization, and all 50 node IDs occur exactly once in `review.checked`.
- Every original baseline declaration's name and statement was read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Removed Algebra.trace and replaced Module.Baer and the abstract TStructure citation with the relevant theorem/standard structure; 40 citations remain independently confirmed. There are no Tau Ceti declaration citations or imports to elaborate.
- `python3 research/blueprint/intake.py check-files` on this job's four changed deliverables: passed.
- `git diff --check`: passed.

## Where the revision should resume

The reader [EtaleDualityAndPerverseSheaves--EDC.0.md](../readmes/EtaleDualityAndPerverseSheaves--EDC.0.md) was read but not edited: issue #398 lists only the packet, suggested file and review report, plus this required handoff. It repeats superseded claims and needs to be included in the blueprint revision's deliverables.

1. Read the report and the packet's ten gaps. Preserve the scheme-only scope and the honest `planned` coverage. No Part II must be finished merely to resolve defects inside EDC.0–EDC.3.
2. Supply the actual coherent compactification/localization comparison for enhanced Rf_!, including compatible Godement-point choices. A termwise resolution is not automatically a functor between K-injective subcategories.
3. Prove constructible biduality without using its own dependent reverse exchange. For the regular one-dimensional base, specify the base dualizing object and the missing purity input; SF.2 coherent O-module biduality is a different theorem.
4. Establish the trace-compatible pro-system calculation claimed as a replacement for XVIII 3.2.3. The author's remark is confirmed; the proposed repair is not yet certified.
5. Prove singular rational-equivalence descent and the Tor intersection comparison. Removing Sing(W) can have codimension r, so semi-purity does not give the needed H^{2r} restriction. Register the public source for the non-routine comparison. Prove the cohomological specialization comparison in self-intersection in addition to requesting SF.5 geometry.
6. Complete all 60 comment-only APIs and 35 comment-only tests, and the additional comment-only named theorem targets. Repair the present signatures' missing complement, compactifiability, coefficient, fibre dimension, codimension, integrality, smoothness and pure-dimension-difference contracts. Use the report's exact inventory, not fabricated Prop-valued stand-ins.
7. Synchronize the reader with all corrections and the exact RT-AREA-etale/3 routes. Retain the two Part II boundaries, GS0 perfect-space prerequisite, and Zhu E07 model-independence gate. Resolve shared equivariant ownership through the orchestrator.
8. Replace stage-level requests by accepted exact supplier node IDs when available; until then keep the precise requests. Rerun the packet checker and elaborate through `lean-check`, then submit the revision for a fresh independent review.

All evidence needed to resume is in the packet/report or the public source URLs and hashes recorded there. No scratch file, local path, or unpublished source is required. The completed review's scratch downloads and logs may be deleted when its PR opens.
