# Independent Yuan checks preserved after a claim collision

Original job: ERRATA-PAPER-YUAN-26, Claude Code `cc-fb70e5`, 22 September 2026.
Independent continuation: REV-ERRATA-PAPER-YUAN-26, issue #1763, Codex `codex-a71f92`, 23 September 2026.

## Collision and submission scope

This session won the claim on issue #1763: [comment 5795853152](https://github.com/CBirkbeck/tauceti-explorer/issues/1763#issuecomment-5795853152), confirmed by [bot comment 5795864575](https://github.com/CBirkbeck/tauceti-explorer/issues/1763#issuecomment-5795864575). A later claim by session `cc-7b31c4` was rejected in [bot comment 5795932210](https://github.com/CBirkbeck/tauceti-explorer/issues/1763#issuecomment-5795932210), but that worker's [PR #2296](https://github.com/CBirkbeck/tauceti-explorer/pull/2296) merged at 13:46:53 UTC and completed the job while this review was in progress.

The collision was detected while checking a fresh publication snapshot, before writing to GitHub. **This PR changes only this handoff. It does not overwrite the merged JSON, report, or verdicts, reopen the issue, or edit generated registers.** The changes discussed below are proposals for a maintainer, not changes applied to the errata files.

The present session's check remains **partial pending published-version verification**. All four inherited findings were checked against both public manuscripts, but the proposed repairs to E1, E2 and E4 need the amendments below. The merged review confirms all four without amending those repairs and likewise reports that it did not access the final typeset text. The maintainer should decide how to reconcile these records and whether to commission a correction/review follow-up; this handoff does not revoke another worker's verdicts.

This reviewer did not write the extraction (sessions `codex-c83e7a` and `astra-ao-9c47e2`) or original errata. The review is targeted, not a line-by-line audit of the whole paper or a proof of its principal theorems.

## Versions and access

- [Author manuscript](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), dated 21 August 2024, 126 pages; SHA-256 `b36f4860cc0f098ef062523e8a5147e8172d1e4e357fc76a63cd7c0d782a813e`.
- [arXiv v4](https://arxiv.org/pdf/2108.05625v4), 30 April 2024, 125 pages; SHA-256 `a4e4c3d79e0912b62961a4b45b08e1e5c6957b0b64af7da74647c8ff9361e11e`.
- [Dimitrov–Gao–Habegger, A consequence of the relative Bogomolov conjecture](https://ziyangjeremygao.github.io/articles/ConseqRelBog.pdf), author PDF; SHA-256 `bfbd74ec90ab2d7e7bb87f350450777b2009e764b3fe6a09cce5c2dd6b18e2a8`. Read the introduction and Conjecture 1.2, including the page image.
- [Annals article record](https://annals.math.princeton.edu/2026/203-1/p02): volume 203 (2026), pp.15–119, DOI 10.4007/annals.2026.203.1.2. It gives the same revision date, but does **not** establish that the author manuscript is textually identical to the journal article.

The [author's publications page](http://faculty.bicmr.pku.edu.cn/~yxy/publications.html), updated June 2026, explicitly warns that linked files can differ from published versions. Both guessed Annals PDF endpoints (`annals-v203-n1-p02-s.pdf`, `-p.pdf`) returned 404. Project Euclid did not expose the article in this environment; its PDF request returned an HTML access challenge, not a PDF. No access controls were bypassed.

Read and visually checked author pp.16,100–102 and v4 pp.16,99–101. Additional targeted reading covered the three morphisms, Theorem 4.5 and its proof (author pp.68–70), the statement of Theorem 4.7, and the v4 argument around Theorem 4.17 and Proposition 4.18. The four reported defects persist in these two manuscripts. Earlier arXiv versions and the journal typesetting were not collated.

## E1 — base-field variation and function-field heights

**Manuscript finding supported; final verdict pending journal collation.** Retain `error / a stated result` for the literal K-relative reading of maximal variation.

Let k be algebraically closed of characteristic zero, K=k(t), and C₀/k a smooth projective curve of genus g>1. Choose p₀∈C₀(k), let S=Spec K, C=C₀×K, and α=O(p₀). The moduli map to M_{g,K} is a point and therefore quasi-finite. Every constant point x has height zero under x↦x−p₀ in the constant Jacobian. Infinitely many such points are dense in the curve, so the small-point conclusion fails even at m=1. Products of constant points, including constant Jacobian parameters, give the same obstruction for the other displayed maps.

This is about variation relative to K versus variation of a model relative to k. If the latter was intended, it must be stated. It is not enough to change the heading to “needs non-isotriviality”: for a higher-dimensional base that phrase does not specify the needed hypotheses.

The earlier correction incorrectly called model maximal variation *equivalent* to the needed adelic bigness. The proposed amended entry treats it as a sufficient route via Theorem 4.5, or directly assumes the three Deligne-pairing bigness hypotheses over k needed in Proposition 4.18. The proposition already incorporates the model dimension dim_K S+1; this review finds no reason to add another one to the printed bounds.

The constant pair used here is excluded by the separate non-isotrivial-pair hypothesis in the main uniform theorem. That observation is not a new verification of the main theorem or all its dependencies.

## E2 — scope of the conjecture being recalled

**Manuscript finding supported; final verdict pending journal collation.** Retain `error / nothing` in the sense that this is a misstatement of a recalled conjecture, with the theorem-level instances separately recorded as E1.

The same constant Jacobian example, with Y the pointed Abel–Jacobi curve and S=Spec K, satisfies geometric irreducibility, generation of the Jacobian, and dim Y=1<g. Constant zero-height points are dense.

DGH Conjecture 1.2 is explicitly over Qbar; finite-type data descend to a number field. Its codimension bound is equivalent to dim Y<g. The earlier report's number-field shorthand is made precise here. Neither DGH's formulation nor this counterexample proves a full relative function-field replacement. The unsupported alternatives “Y is not constant” and an unqualified trace condition should therefore be removed as claimed sufficient fixes. Restrict the recalled attribution to its arithmetic setting, or formulate and justify the required geometric hypotheses separately.

## E3 — the degree factor in the Green equation

**Manuscript finding supported; final verdict pending journal collation.** Retain `misprint / nothing`.

The local definition of admissibility fixes the Chern form to deg(D)μ_Ar. Consequently the corrected equation is
`(i/π)∂∂bar g_D = deg(D)μ_Ar − δ_D`.
Testing the printed equation against the constant function 1 gives 0=1−deg(D). For D=0 and the constant metric, g_D=0 gives an immediate contradiction. The restored factor passes both checks, and does not change the degree-one point case. This checks the local formula, not every application later in the paper.

## E4 — self-nodes in stability, including a correction to the errata

**Manuscript finding supported; final verdict pending journal collation.** Retain `error / nothing` for the recoverable intended standard definition.

Count branches over nodes on the normalization. A component of normalization genus h with n such branches has dualizing degree 2h−2+n. For a rational component with s self-nodes and r nodes joining other components, n=2s+r and stability requires 2s+r≥3.

The inherited example is valid: a once-self-nodal rational component attached once to an elliptic component has genus two, with positive dualizing degrees 1 and 1. The printed other-component intersection count rejects it. But the proposed repair was itself too restrictive: identifying two disjoint pairs on P¹ gives an irreducible rational curve with two self-nodes, genus two and dualizing degree 2, with no other component at all. Thus “a component with a self-node must meet another component” is false unless exactly one self-node is specified.

The proposed amended entry uses the branch-count formula, consistent with the [Stacks normalization argument](https://stacks.math.columbia.edu/tag/0E69) and [ample-dualizing characterization](https://stacks.math.columbia.edu/tag/0E73). This local repair does not establish that no later argument uses the narrower printed definition.

## Correction search and remaining work

On 23 September 2026, the Annals article record and author's publications list showed no applicable correction; arXiv listed v4 as latest. The Crossref DOI record had no linked update in the inspected fields. Exact-title erratum/corrigendum searches, a DOI/PDF search and a Theorem 4.19 correction search found no applicable author or journal notice. These are bounded searches, not proof that no correction exists. A proposed update should qualify `known: new` by those search limits and make the unverified published-version boundary explicit. The merged JSON is left untouched by this PR.

To finish: obtain a legitimate public copy of the journal text, map these four locators to its pagination, collate the statements and context, update `known` if anything was corrected, then reconcile the final verdicts and report through an authorized follow-up. Do not mark the review complete merely because the two manuscripts agree.

The inherited open normalization questions (finite-extension factors on author p.49 and §A.5 p.116), the genus-one issue around Theorem A.1(2), and the separate Wilms-source issue were not settled here. No additional source finding is asserted. Only this handoff is submitted. The proposed JSON and explanatory rewrite were saved in this worker's scratch work but are not applied over the other worker's merged deliverables. Extraction, errata, review, and generated register files on the publication branch are untouched.

## Validation and handoff

The proposed pre-collision JSON passed `scripts/check_errata.py`, and its three-file checkpoint passed `intake.py check-files`. The actual submission is handoff-only, tested separately below. No Lean file was changed or compiled.

The current publication base is `3a28c75329f4c4708d3fb568a6d98f9a843bd332`; the research binding files are unchanged from the versions read. No source PDFs, local paths, or temporary diagnostic files are committed.

Actual handoff-only submission: `intake.py check-files` reports 1 file, 0 problems. The five regression suites `test_check_errata.py`, `test_errata.py`, `test_source_issues.py`, `test_intake.py`, and `test_issues.py` pass (65 tests total). These validate repository mechanics, not the mathematics or access to the published paper.
