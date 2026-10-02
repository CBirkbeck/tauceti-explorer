# Independent verification of the Cai–Friedberg–Kaplan red team

Job: `REV-RT-PAPER-CAI-FRIEDBERG-KAPLAN-24` · Refs #4055
Verifier: Codex, session `codex-5ebb6f` · 2 October 2026
Target: `RT-PAPER-CAI-FRIEDBERG-KAPLAN-24` against `PAPER-CAI-FRIEDBERG-KAPLAN-24`

All **42 findings are confirmed**: 3 high, 19 medium and 20 low. Each verdict in the companion JSON states the evidence checked and, where necessary, limits or corrects the proposed fix. Confirmation concerns the extraction's statements, omissions and ownership; it does not certify every alternative repair in the red-team report.

This session did not write the extraction, its original review or the red team. I read the full 42-finding result, the red-team report, all 76 extracted items, the extraction report and its original review. The extraction currently records 4 planned and 72 missing items and 18 source issues. Neither the top-level source prerequisites nor dependencies connecting its 30 review-added items are supplied.

## Sources and scope

The primary source is the public [arXiv v5 PDF](https://arxiv.org/pdf/1802.02637v5), *Doubling constructions: Global functoriality for non-generic cuspidal representations*, including Kaplan's Appendix A. It has 60 PDF pages, with printed and PDF page numbers agreeing. Its SHA-256 is `dd49d944ca050d518fcb28dae9392b2b02d67710a4dff961800b47815f0c16ef`, matching the extraction's copy.

I checked the cited arguments on pp. 1–2, 6–14, 17–20, 24–47, and 50–57, reading those pages in targeted passes. This is not a claim to have independently reread every page of the paper. The image of p. 52 was inspected to distinguish the printed modulus in (A.22) from text-extraction artifacts. The new source discrepancies in findings 27, 34, 36, 38 and 41 are verified against **v5**. The journal text was not available for comparison; this review does not claim an erratum search, a correction in print, or that a proposed correction has already been approved as published-source errata.

For finding 22 I independently read the Bernstein theorem reproduced in [Banks, *A corollary of Bernstein's theorem and Whittaker functionals*, pp. 782–783](https://intlpress.com/site/pub/files/_fulltext/journals/mrl/1998/0005/0006/MRL-1998-0005-0006-a007.pdf). The source has hypotheses on the countable-dimensional vector space, irreducible parameter variety, regular equations and uniqueness on an ordinary open set. The missing extraction must retain these, the normalized functional and the specialization to the rational parameter q^{-s}. It must distinguish this continuation principle from the paper's additional corollary.

Atlas comparisons use the assembled stages at this branch's base, `9d742ee`. I read the AF, SR, AL, AS and relevant ET contracts, the reviewed AF.1/AL.3/AS.1 library coverage, the upstream ReductiveGroups layers 7–8, and ReductiveGroupsPartII RG.2.5. Accepted paper routes were compared with both their result statements and review decisions, notably Gan–Savin, Gan–Ichino, Chenevier–Taïbi, Jiang–Zhang, Nelson–Venkatesh, Atobe–Kondo–Yasuda, Yu, and Beuzart-Plessis–Chaudouard–Zydor. An accepted source route is planning evidence, not a declaration in a library.

Pinned statements for finding 8 were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

- Tau Ceti `TauCeti/Algebra/AlgebraicGroup/ConstantForm/Basic.lean`, `groupScheme` and `mem_definingPointsSubgroup_iff`: a Hopf quotient enforcing M C Mᵀ=C.
- Tau Ceti `TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean`, `groupScheme`: specialization to the standard alternating form.
- Mathlib `Mathlib/LinearAlgebra/SymplecticGroup.lean`, `Matrix.symplecticGroup`: the matrix-preservation submonoid.
- Tau Ceti `TauCeti/Algebra/AlgebraicGroup/SpecialLinear/Basic.lean`, determinant Hopf ideal and `mem_definingPointsSubgroup_iff_det_eq_one`.
- Tau Ceti `TauCeti/Algebra/AlgebraicGroup/SpecialOrthogonal/Basic.lean`, the orthogonal/determinant ideal join for the identity form.

These supply reusable partial constructions. They do not supply every split classical group, the GSpin construction, its character or CFK's embeddings. The identity-form SO construction needs a justified comparison with the split form, and M C Mᵀ=C needs an explicit comparison with CFK's MᵀJM=J. The extraction should remain missing for the complete group package while identifying those reusable inputs.

## Qualifications governing the fix

**General theory and special extensions (1–7, 13, 15–16, 21, 39–40).** Import general cuspidal Eisenstein theory, continuation, intertwining operators, residual-spectrum foundations and cuspidal decay from their owners. Do not mark the full residual-data series, specialized MW normalization, pole-detection or Hermitian-symmetry bundle planned merely because its cuspidal foundation is planned. The exact additional theorem needs an owner request or a separate missing item. Likewise, AL.3's generic Whittaker contract does not automatically cover non-generic Langlands-data factors; standard GL_n factors belong to AL.2, and boundary nonvanishing is a further input. Global cuspidal genericity needs the Fourier/Whittaker construction and its local consequences, not just AF.3's definition of cuspidality.

General p-adic classification and archimedean classification/GL_n correspondence have existing source owners. AF.1b is proposed in `RT-AREA-automorphic-1.fixes.md`, but is absent from this assembled atlas. Reference it as a pending successor, not an existing stage. The classical-group archimedean parameter and central/infinitesimal-character compatibilities are distinct obligations. Ordinary Dixmier–Malliavin factorization does not imply factorization by **entire families**. A tempered p-adic Speh constructor does not establish every non-tempered or archimedean constructor and model theorem. Keep these distinctions when splitting and rerouting items.

**Current dependency evidence (6, 23, 26).** ET.7a now directly requires ET.4, ET.6, R17.4 and R17.5. I recomputed **437 distinct ancestors**, including AS.6 and ET.4. The red team's 239 is historical. Its objection to a trace-heavy dependency on the early doubling path remains valid: request the particular early residual/classification exports without editing upstream plans here. `make_queue.paper_designs` groups Part II proposals by parent, so the four accepted AL continuations feed one design job, `DESIGN-AutomorphicLFunctionsAndLocalFactorsPartII`. The 2025 Beuzart-Plessis–Chaudouard proposal remains unaccepted.

Adding every suggested item edge mechanically would introduce apparent self-dependence through bundled assertions. In particular, the current `gl-integral` includes continuation that `gl-multiplicativity` helps establish; the proposed graph must separate the initially convergent integral from its continuation and continued identity. Similarly, a matrix-coefficient item containing absolute convergence cannot be used as the full prerequisite of the convergence theorem that proves it. Split definitions, initial convergence and continued theorems, then check the resulting graph for cycles. The present review does not certify any unconstructed dependency graph.

**Independent mathematical checks (19–20, 27, 34, 41).** The type D cone requires both terminal inequalities. For c=2, exponents (−0.1,−5) have negative partial sums but violate e₁−e₂<0. Thus finding 20 identifies a false extracted criterion; the residue's required type D check must still be supplied. For GSpin, Υ_c=2e₀+Σe_i pairs to 1 with every standard dual weight, explaining the determinant twist in finding 19 and the factor 2 in the central-character twist. The dual similitude belongs to X∨ and is e₀∨, not e₀.

The low-rank torus example in finding 34 is outside the positive-exponent decomposition actually printed; E6's essentially-tempered l=0 extension does not repair that case. Define the torus factors and prove the corresponding local nonvanishing separately. In (A.21) normalized induction contributes δ_R^{1/2}; multiplication by δ_R^{-1} leaves δ_R^{-1/2}, agreeing with (A.23) and contradicting the printed (A.22). Recording these source discrepancies is necessary; their correction must preserve the unaffected unitary global application and follow the separate source-errata workflow.

**Scope and presentation (9–12, 14, 17–18, 24–25, 28–33, 35–38, 42).** Restore precise field, rank, representation and quantifier hypotheses, spell out the integrals and estimates, and connect the missing support, geometric and growth inputs. Keep k=1's Yamana adaptation separate from the k>1 Appendix argument, and separate low-rank residual transfers from Theorem 0.1's c>1 scope. Record Arthur's overlapping Sp/SO transfer interface while preserving the independent doubling proof and GSpin result. Correct the converse-theorem attribution, stale counts, locators and contradictory Appendix notes. The JSON reasons give the finding-specific dispositions, including the smooth-to-K-finite interface needed by the global application.

## Validation

The review has one ordered, unique verdict for every input finding. The following validation commands passed:

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-CAI-FRIEDBERG-KAPLAN-24.review.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-PAPER-CAI-FRIEDBERG-KAPLAN-24.review.json research/blueprint/reviews/REV-RT-PAPER-CAI-FRIEDBERG-KAPLAN-24.md`
- `git diff --cached --check`, with the staged paths checked against the issue's two deliverables.

No Lean file is delivered and no compilation was attempted. This review makes no formalization claim and changes only its two authorized deliverables.
