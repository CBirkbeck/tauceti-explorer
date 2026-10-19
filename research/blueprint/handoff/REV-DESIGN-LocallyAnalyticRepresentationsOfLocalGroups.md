# Handoff: REV-DESIGN-LocallyAnalyticRepresentationsOfLocalGroups

Date: 2026-10-19. Issue [#3565](https://github.com/CBirkbeck/tauceti-explorer/issues/3565). Agent: Codex, session `codex-KEodk8`. Independent of Claude `claude-TZhCcp`, who wrote the input design for #3411.

**This review is complete; the corrected roadmap is accepted as partial.** It is not a checkpoint of an unfinished review. The complete [review report](../reviews/REV-DESIGN-LocallyAnalyticRepresentationsOfLocalGroups.md) records the counts, every corrected node, all baseline checks, sources and remaining contracts. The [packet](../packets/LocallyAnalyticRepresentationsOfLocalGroups.json) contains the exhaustive 83-node review ledger.

Changed deliverables: packet, roadmap definition, reader, suggested Lean file and review report. Added one theorem, `LR.1/admissible-external-tensor`, marked with this review job in `addedBy`. It supplies product-group admissibility after admissibility is defined. There are 83 nodes, 255 API items, 176 tests, 40 planets, nine confirmed baseline declarations, ten explicit gaps and sixteen supplier requests. No baseline declaration was removed. Seven stages are partial and three are planned relative to recorded prerequisite contracts; none is closed.

The corrections cover analytic-chart uniqueness and inverse-function locators, direct differentiation before distribution integration, compact-coset continuity, compact-type tensor exactness, contragredient central characters, compact-open closure, Banach-step Ext closure, solid scalar/action conventions, completed induction and unipotent homology, Orlik–Strauch scope, averaged Hecke action and Breuil's modulus conversion, finite-slope BH hypotheses, inverse-image Weyl labels, positive inducing weights, Weyl transition direction, ordered singleton characters, finite-amalgam multiplicity one and the first tensor-filtration kernel.

All eleven old source findings were reviewed: E5 was rejected, the other ten confirmed. New confirmed findings E12–E14 record inverse-image labels, positive inducing weights and the tensor-extension kernel. E5 must remain rejected: do not revert the positive sign printed on Ding p. 44. The published version and final arXiv v2 were compared at the affected locators. Source-version URLs and hashes are in the packet. The cleared Schneider book was read in place; nothing from that file was copied.

## Where follow-up work resumes

The packet's `gaps` and `coverage.remaining` are the starting points:

1. Category O, Verma layers and dualised Kostant formulas (owner LieHighestWeightPartIICompletedCategoryO, not designed).
2. Solid functional analysis (owner LocallyAnalyticDistributionsPartIIQuasiAbelianFunctionalAnalysis, not designed).
3. Proof of Dospinescu–Le Bras, Lemme 5.10.
4. Breuil–Qian: Ext^1(C(I, s_{i,σ}), π_alg) is one-dimensional.
5. Derived analytic vectors: analytic-radius comparison and compact-group cohomology.
6. Rigid character-space carrier comparison.
7. First two socle layers for the ℚ_p-analytic Orlik–Strauch functor.
8. Finite-E smooth principal-series supplier refinements.
9. Split finite-E highest-weight and Harish–Chandra interfaces.
10. Solid analytic foundational supplier contracts.

The requests name the exact supplier statements and consumers. Route these to their existing owners; no owner was moved. In particular, compact character geometry belongs to PMIA L0a, Mellin/rigid–adic comparison to LocallyAnalyticDistributions L3, finite-E smooth refinements to SmoothRepresentationsOfLocalGroups, and finite-E highest weights to LieHighestWeight. The category-O and solid functional-analysis owners are proposed split-off Part II roadmaps awaiting design. Current upstream suppliers were read, including their coefficient-field restrictions. Do not infer the ℚ_p-analytic second-socle-layer statement from the L-analytic full-faithfulness theorem with trivial smooth input.

For the Schur-property target, the earlier weak-compactness-to-compactoid proof is withdrawn. For derived analytic vectors, the missing quantitative filtration comparison and strict cochain/tensor argument are explicit. The Breuil–Qian reverse Ext direction is imported and unread, and unused by downstream contracts; a follow-up may remove it rather than pretend it was checked.

## Checks

The blueprint checker reports 0 errors and 0 warnings. The source-issue and version validators pass. The 83-node local graph has no cycle or later-stage edge, and the reader contains every packet statement, hypothesis, acceptance example, proof step, prerequisite, API item and test. Each definition/construction has at least three discriminating tests. Both JSON files parse and the diff has no whitespace errors.

The suggested Lean file elaborates through `lean-check` against Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, with sorry as its only warning. The inverse-image finite-set definition and its three cycle/identity examples have real bodies/proofs. The baseline Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`; the current duplication screen separately read TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No Lake build or language server was started.

All findings needed by a subsequent worker are in the packet, reader and report. Scratch is disposable and is removed after the pull request opens. This session claims no second job.
