# Handoff: REV-AutomorphicLFunctionsAndLocalFactors

Completed independent review for issue #363 by Codex, session `codex-Kwe2i6`, on 2026-10-07. This is a finished review with verdict `needs_changes`, not an unfinished planning checkpoint. This reviewer did none of the earlier blueprint work.

Read `reviews/REV-AutomorphicLFunctionsAndLocalFactors.md` first. It contains the mathematical corrections, all120 per-node verdicts, all68 baseline citations, public source URLs, six independently confirmed source issues, assigned red-team checks and exact remaining reader work. The packet records72 verified and48 corrected nodes, with no added/unverifiable nodes. All implementation statuses remain unchecked. No source PDF or transient local log is needed to resume; public versions and hashes are recorded in the packet.

The permitted packet and suggested file are corrected. The reader was absent from issue #363's deliverables, so it remains unchanged. A revision must include `readmes/AutomorphicLFunctionsAndLocalFactors.md` and synchronize it with the corrected packet. Acceptance is blocked by these actual contradictions, not by the honestly recorded proof/supplier refinements:

- The reader says arbitrary entire multiples are realized by Jacquet's Theorem2.6. Restore its polynomial-cleared vertical-strip growth space, ordered inducing exponents, equal-rank finite sums, and Theorem2.7 irreducibility/rank restrictions.
- Its measure convention incorrectly says z/L is unchanged under multiplicative Haar scaling. The distribution scales by c; standard vectors need inverse scaling. Only epsilon/gamma ratios cancel the common multiplicative scalar with additive Fourier measure fixed.
- Its global Tate proof incorrectly says pure tensors algebraically span the completed archimedean space. Use density, continuity and Schwartz domination.
- Synchronize the noncircular archimedean continuation proof, general-test convergence thresholds, Fourier dependency direction, number-field self-duality scope, trace/inverse-different inputs and source locators.
- Synchronize actual Maass AF.3 and Flath AF.2 suppliers, multiplicative GL_n Haar requirements, separate local period multiplicity one and arbitrary-r Satake bounds. Include G15 in the corresponding remaining lists.
- Keep AN's Hadamard theorem and FA.5 tensor-cohomological comparison explicitly requested extensions. Current AN.2 is PNT and current FA.5 is finite-Galois Artin theory. The orchestrator should place these owner extensions precisely; neither is an implemented theorem. GS.6's finite-order central-character scope needs the recorded degree-twist reduction.

The report's exhaustive correction table identifies every changed node/section. Preserve existing source-correction provenance and the GL2/Q versus general-number-field period boundary. General consumer algebraicity is not established by this review.

Validation completed:

- Packet checker:0 errors,0 warnings;120 nodes,137 API entries,118 tests,29 planets,68 baseline citations,31 requests,15 gaps, all six stages planned.
- `lean-check research/blueprint/suggested/AutomorphicLFunctionsAndLocalFactors.lean`: exit0 at pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,183 warnings all using `sorry`, no other warnings/errors. The file imports Mathlib only. Tau Ceti baseline statements were separately read at `f790474821cf4256814db967cb154e7af3d0c369`.
- Internal prerequisite graph acyclic; `git diff --check` clean. No language server or build/update/cache commands used.

The next job should be a scoped revision, followed by independent re-review. Do not interpret this negative completed review as a request to implement all remaining supplier/proof gaps first.
