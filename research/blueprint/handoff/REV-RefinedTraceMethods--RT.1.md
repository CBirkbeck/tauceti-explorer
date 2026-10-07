# REV-RefinedTraceMethods--RT.1 — completed independent review

Issue #480. Reviewer: Codex, session **codex-79dlkk**, branch **codex-79dlkk-review-refined-trace**, 2026-10-07. The swarm bot confirmed this session's claim before work began. The reviewed blueprint (#983) was written by Claude, session claude-w5NJ1D; this session did none of that work.

**This review job is complete, with verdict `needs_changes`.** It is not a checkpoint. The input plan's status is now `partial`: five stages lack key definitions below the 300-node budget. All 134 nodes have individual review verdicts, and the completed review object identifies `independent-review-REV-RefinedTraceMethods--RT.1`. No second job was claimed.

## Completed work and durable evidence

- [Review report](../reviews/REV-RefinedTraceMethods--RT.1.md): counts, mathematical corrections, every edited node and field, all 20 baseline scopes, 31 public sources, all 15 source-issue dispositions, all 10 red-team dispositions, R1–R16 closure gaps, seven precise supplier requests, and the complete 134-node review index.
- [Corrected packet](../packets/RefinedTraceMethods--RT.1.json): 134 nodes (59 verified, 26 corrected, 49 unverifiable), 54 edited nodes/91 changed fields, 300 API items, 186 tests, 24 unchanged planets, 22 gaps and 17 requests. No new node, baseline declaration, duplicate owner definition or atlas data was introduced. Source issues: 14 confirmed, E5 rejected; E14 is confirmed only as an undefined-hypothesis gap.
- [Suggested Lean file](../suggested/RefinedTraceMethods--RT.1.lean): clear signature errors corrected; omitted source hypotheses explicitly documented. Ordinary-category and even-flatness prototypes remain inadequate mathematical interfaces and are recorded as review gaps, not treated as implementations.
- The report identifies precise synchronization requests for the [reader](../readmes/RefinedTraceMethods--RT.1.md). That file is excluded from this review issue's authorized deliverables, so it was not edited. Its old statements must not override the corrected packet.

Every exact pinned baseline statement was read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Public-source URLs, versions, read sections and full hashes are preserved in the packet. Twenty-nine original PDF hashes matched; HKR uses the Rochester mirror and its new hash. Antieau–Riggenbach v1 was added for the missing synthetic finite-cyclic construction. The report records what was read and does not claim complete cover-to-cover reading of long books.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/RefinedTraceMethods--RT.1.json`: **0 errors, 0 warnings**.

`lean-check research/blueprint/suggested/RefinedTraceMethods--RT.1.lean`: **exit 0** on the final edited file; 1,415 warnings, all expected declarations using `sorry`, and no other diagnostics. Memory was checked first (108 GB available), only one compiler ran at a time, and none remains running. The shared build pins the requested Mathlib commit. Its Tau Ceti checkout is newer (`cf3866…`), so no full exact-pin Tau Ceti build is claimed; this file imports no TauCeti module. Tau Ceti citation statements were verified separately at the requested pin.

`git diff --check` passed. Submission contains only the packet, suggested file, review report and this handoff. Nothing is formalised or promoted.

## Next revision, not unfinished review work

Resume from the report's **Closure gaps and supplier boundaries**, **Node change register and reader synchronization**, and **Orchestrator actions**. The substantive work is:

1. R1–R3: unbounded mixed complexes/Laurent totalization, cyclic Morita and shuffle interfaces, actual base-change scopes and smooth HKR chart reduction.
2. R4–R9: coherent Kan/parametrized/tower interfaces; exact K/IK E₁ and stable-category models; coefficient THH and split square-zero data; Raskin pseudo-extensibility, Postnikov convergence and infinitesimal sifted-colimit definitions; general qSyn/motivic comparison.
3. R10–R12: the recorded stable E∞ Adams source gap, graded/derived HKR, and solid spectral/noncommutative duality scope.
4. R13–R16: perfect-even sites, retracts, actual even/faithfully-even flatness, homological evenness, Assumption 2.13; synthetic finite-C_n norms/Tate and underlying-comparison hypotheses; compatible spherical/cyclonic lift data and the based BU comparison condition.
5. Route the seven named supplier requests and synchronize the reader's listed sections, introduction, source list and errata dispositions. Retain precise ownership: H.5 spectra foundations, DD.1 Koszul, DGA Hochschild foundations, L.4 Witt specialization and HR.6 degree-zero Habiro are imports; the henselian square stays Part II-owned.

Keep target-level granularity. Missing key definitions need nodes or exact supplier interfaces; recorded sketched proofs do not require lemma decomposition solely to satisfy this review. Send the revised plan to a fresh independent review and do not promote the current `needs_changes` packet.

All evidence needed by a subsequent worker is in the committed files and their PR diff. Scratch downloads, compiler logs and interim notes are disposable and are deleted after submission.
