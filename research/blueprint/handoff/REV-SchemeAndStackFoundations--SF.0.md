# Handoff: REV-SchemeAndStackFoundations--SF.0

Issue #6282, Codex session `codex-FHUEmt`, 9 October 2026. **Independent review complete; verdict needs_changes.** This is a completed review job, not a time-limit checkpoint. All 139 nodes, 492 exact-pinned baseline declarations, 281 public sources, API/test outlines, supplier contracts, six planets and the inherited red-team finding were checked. The packet contains an individual verdict for every node and a reviewed verdict for all 24 source findings (22 confirmed, 2 rejected).

The deliverables are:

* `research/blueprint/reviews/REV-SchemeAndStackFoundations--SF.0.md`: counts, applied corrections, source verdicts, precise remaining interfaces/tests and validation.
* `research/blueprint/packets/SchemeAndStackFoundations--SF.0.json`: repaired proof sketches, 19 direct dependency edges, corrected source versions, six explicit gaps, and `review.status=needs_changes`; packet/coverage now `partial`.
* `research/blueprint/suggested/SchemeAndStackFoundations--SF.0.lean`: five corrected signatures and the added arbitrary-ideal étale quotient-lift signature.

No new target nodes were added. The node budget is 300; this 139-node follow-up is not marked a complete pass or a closed/planned SF.0 stage. No target is claimed implemented. The suggested file’s admission warnings do not close the missing interface/test contracts.

## Resume with the six recorded gaps

1. **Existing ownership.** Current AlgebraicVectorBundles L0–L2 already own QCoh algebras/monoidal structure, internal Hom/duals, symmetric algebras, relative Spec and its universal property/recovery/base change, graded QCoh, linear Spec and total space. Current Tau Ceti implements the CommMon relative-Spec carrier/maps/chart pullbacks/affine comparison. Reconcile nodes `qcoh-algebra`, `qcoh-algebra-sheaf-comparison`, `pushforward-algebra`, `relative-spec`, `relative-spec-universal-property`, `relative-spec-affine-antiequivalence`, `qcoh-algebra-pullback`, `relative-spec-base-change`, `symmetric-algebra-sheaf`, `graded-qcoh-algebra`, `sheaf-hom-dual`, `vector-schemes`. Convert the overlapping carrier/contracts to imports; keep small-affine-site comparison, general qcqs pushforward and morphism-property dictionary as extensions. Reconcile the reader and base assembly at the same time. Those files were outside this review’s permitted deliverables, so the rescope record is a revision instruction, not an applied ownership fix.
2. **Eakin–Nagata.** The explicit noncatenary-domain construction needs Noetherian descent for a finite module extension. Supply its target-level argument or an exact earlier supplier.
3. **Popescu.** Close the Stacks 07FE/07FJ smoothing and approximation inputs with their exact Artinian/characteristic-p hypotheses and the strict increase of the bad-locus ideal. The induction now correctly uses a maximal bad quotient ideal.
4. **Generic flatness.** Supply Stacks 29.27.5 (052A) for the finite-type map over an arbitrary integral base before using finite-presentation descent. The proof now makes that preliminary shrink explicit.
5. **Layer order.** SF.0 cannot import its full later SF.3/SF.4 layers. Find earlier exact suppliers, or move down elementary Pic(P1), the separated Chow statement and the required DVR existence statement. StableReduction L2’s projective-space/twist carrier does not supply Pic(P1) classification. Later cohomology/model/intersection requests marked `consumer-follow-up` are consumer work, not SF.0 proof inputs.
6. **Suggested contracts/tests.** The report inventories the omission comments and weaker examples; the packet gap’s `neededBy` enumerates affected nodes. In particular supply pointwise-henselization colimit, affine-limit pullback, unibranch/normalization, AIC-limit, rational structure-monoid, arithmetic-pushout, trace and binary-form point APIs, plus the five omitted geometric theorem signatures. Implement actual concrete counterexample/test types and maps. The existing existential examples do not replace the promised explicit Nagata constructions. Keep target-level granularity and genuine carriers.

## Owners and moved-down notions

Read current upstream at TauCetiRoadmap `de435a569d325b365a30fe83269ce34674eaea80` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These postdate the unchanged packet pins Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

StableReduction L0 dimension conventions, L2 finitely generated relative Proj, and L3 smooth-section pushouts/clutching are existing owners. The packet’s general relative Proj and Ferrand pushout require canonical comparisons with them. Do not rewrite those roadmaps here. ModularCurves 4D regular-local normality/parameter and strict-henselization contracts are requests, not asserted implementations.

The inherited move-down proposals remain: general henselization of pairs moves from proposed PerfectoidSpaces P3 to SF.0; catenarity, depth, CM and Serre definitions move from proposed DeformationAndDerivedPatchingAlgebra R03.3 to SF.0. Higher consumers should import those owners. No new move was applied to an existing Tau Ceti roadmap. Weil restriction remains outside SF.0 as required by RT-AREA-algebraicgeometry/11; packet and reader agree on ModularCurves 0F → RG2.0a → R09.3 ownership.

## Source and verification notes

All paper/page locators refer to public texts actually read, with versions/hashes in the packet. The replaced sources are the Boxer–Pilloni author PDF, Gille–Parimala arXiv v3 (Theorem 7.1 p.18), and Hacon–Witaszek arXiv v2. Van Hoften Lemma 4.1.5 is p.46 in v4. Added Stacks 04D1, 052A and 0200 support the repaired routes. Sources are paraphrased throughout; no source files or passages are needed from scratch.

E107 (catenary recall) and E109 (Bhatt–Scholze finite-presentation guard) were rejected with mathematical reasons. E108/E114/E115 are proof omissions/supplements, not false theorems. New E119–E125 record the support-cohomology label, limit/descent map labels, Ferrand pushout labels, elementary curve factorization, smaller-algebra membership, and missing separatedness step before Chow. Their exact locations and correction searches are in `sourceIssues`.

Final checks: blueprint validator 0 errors/0 warnings; packet source-issue/source-version validators 0 errors; combined base/SF.0 declared graph 442 nodes/0 cycles. The full stage-order issue is separately recorded. The 4,058-line suggested file elaborated via `lean-check` with exit 0: 854 warnings, all admitted-proof warnings, no errors or other warnings. No build or language server was started.

All information required for a revision is in the committed report, packet and this note. Scratch is disposable and is removed after the single review pull request is opened.
