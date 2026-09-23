# Independent review of the Bhatt et al. errata

Job: REV-ERRATA-PAPER-BHATT-ETAL-23. Reviewer: Codex, session `codex-c83e7a`, 23 September 2026.

**Verdict: accept with the corrections made here.** All eight inherited findings are confirmed. E1's explanation needs the additional proof repair E9; E7's false existence assertion reaches a stated definition; E8 is a proof gap whose repair must retain a floor. Added E9–E10 as published mistakes and E11 as an already acknowledged preprint proof gap. There are eleven individual `confirmed` verdicts, ten with no existing correction located and one already corrected. This review is complete within its finding-by-finding scope.

## Independence and sources

The errata input names Claude Code `cc-442dc5` as its worker. The extraction records that session and earlier authors, including `cc-fb70e5`; this reviewer contributed to neither the extraction nor these errata. I checked the full input for this session identifier, as well as my worker log, before working on the review. Inputs were acquired at repository commit `de9b9a80ede6be1ee5ef81dcb475040d04ae1a6c`. The original deliverable blobs were preserved separately for the publication guard.

I read the complete errata files and the extraction's relevant findings, then checked the cited source passages independently. Fresh downloads on 23 September 2026:

| Version | Public source | Pages | SHA-256 |
|---|---|---:|---|
| Published, Publ. Math. IHÉS 138 (2023), 69–227 | [Numdam PDF](https://www.numdam.org/item/10.1007/s10240-023-00140-8.pdf) | 159 | `a07fcb798fee01a791980ef8fb72e345da22e7f406af2e245adc47da53cf73d6` |
| arXiv v1, 31 December 2020 | [v1 PDF](https://arxiv.org/pdf/2012.15801v1) | 92 | `984fd3f1636ceda5ad014eaab75eb11d44063aeab994bafc64efe4898da5cd92` |
| arXiv v2, 8 June 2021 | [v2 PDF](https://arxiv.org/pdf/2012.15801v2) | 118 | `8393a40ab0ced4f6d74d4dc7a7fab13586a5c35796daec08b5cd09d77bfdb878` |
| arXiv v3, 5 December 2022 | [v3 PDF](https://arxiv.org/pdf/2012.15801v3) | 132 | `533218825ca5045a9e8e04da1f78ef51e05c90dd83ca4ecb7cd6e8c68dff3d80` |

The published hash matches the earlier worker's Springer copy. Published page numbers below are journal page numbers; preprint page numbers are PDF page numbers. I read published pp.74, 76, 84–88, 93–94, 98–102, 107, 121–122, 127–129, 141–144, 152–156, 165, 173, 178, 206–207, 210, and 216–219, with the version-specific passages below. I visually checked published pp.85, 88, 94, 99, 101–102, 122, 128, 154, 206, 216 and v3 p.71 to exclude PDF text-extraction artifacts. This was not a new line-by-line reading of all 159 pages or a reproof of all cited external theorems.

## Individual verdicts

| Finding | Verdict and correction | Independently checked source |
|---|---|---|
| E1 | Confirmed error in the claimed limit. Keep only a uniform lower bound, after repairing the proof's estimate in E9. | Published Lemma 2.56 pp.101–102; v1 Lemma 2.37 pp.20–21; v2 Lemma 2.50 p.26; v3 Lemma 2.56 p.29; consumers pp.173, 178. |
| E2 | Confirmed qualifier misprint. The conclusion in the pure case must remain completely purely globally +-regular over the base. | Published Proposition 6.28 p.154 and definitions/proof pp.152–154; v1 Proposition 6.22 p.48; v2 Proposition 6.28 p.64; v3 p.71; Lemma 4.27 p.127 and Theorem 7.14 p.165. |
| E3 | Confirmed sign misprint. Use the inverse of the big semiample bundle in the local-cohomology argument. | Published Lemma 4.28 p.128, Corollary 3.7 p.107, Theorem 7.2 p.156; v2 p.45; v3 p.50. |
| E4 | Confirmed mismatch between the statement and its proof; use the non-strict lower bound. No counterexample to a stronger theorem is asserted. | Published Theorem I p.74, Theorem 9.28 and Lemma 9.29 p.206, proof p.210; v2 Theorem 9.27 p.102; v3 pp.113, 117. |
| E5 | Confirmed numerical misprint: 373 is sufficient at volume one; 393 is a weaker sufficient bound. | Published Theorem K p.76, Theorem 10.6 p.216 and proof pp.218–219; v3 p.122. |
| E6 | Confirmed missing hypothesis: the subscheme must be closed and nowhere dense. The printed statement is false for T=X. | Published Theorem 2.13 and Proposition 2.14 p.85, proof continued p.86. |
| E7 | Confirmed missing nonempty-system hypothesis. Changed `affects` to `a stated result` because the definition asserts existence outside its valid domain. | Published Definition 2.19 p.88, and the birational affine setting of §8. |
| E8 | Confirmed, reclassified as a gap. Supply the stronger Weil-divisor lemma with the floor condition, correcting the earlier proposed justification. | Published Lemma 2.36 p.94 and Lemma 4.20 pp.121–122. |
| E9 | Added and confirmed: coefficient bounds do not imply the printed intersection bound when positive and negative contributions cancel. | Published proof of Lemma 2.56 p.102; v1 p.21, v2 p.26, v3 p.29. |
| E10 | Added and confirmed: the adjunction display needs K_Z, not K_T. | Published Proposition 2.52 p.99 and its proof; v3 p.27. |
| E11 | Added and confirmed as an already corrected preprint proof gap, not a new defect of the published construction. | v1 Lemma 4.25 p.36; authors' acknowledgment and replacement in v2 §4.3.1 pp.44–45 and published p.127. |

The JSON and companion explanation retain the full arguments. The following details explain the substantive repairs.

## Checks of the corrections

**E1 and E9.** Work over a field of characteristic p>0. Blow up the origin in the affine plane, with exceptional curve E, and let M be the sum of the strict transforms of its axes. Then M is effective, semiample, linearly equivalent to −2E, and has multiplicity one at either axis's intersection with E. Blow up one such point, writing G for the new exceptional curve and E′ for the strict transform. Their intersection matrix has entries −2, −1 and 1. The divisor π*M−tG has degrees 2−t and t on the two contracted curves. At t=2 it is globally generated: the ideal (x,y²) pulls back to O(−E′−2G), so its square gives the required bundle. In the chart x=ab,y=b, the two further blow-up charts make that ideal (c²d) and (f²), respectively. These charts cover the base point, and the other first-blow-up chart already makes the ideal principal. Thus ε_sa(M;x)=2 although the multiplicity is one. Constant Λ=0 disproves the claimed convergence.

There is also a separate error in the proposed lower-bound proof. With D_x the strict transform of the axis x=0, set D=E+D_x and Λ=δE. The coefficient condition holds, but D·E=0 while Λ·E=−δ. Taking A=M+δE gives A∼_Q−(2−δ)E, relatively ample for rational 0<δ<2. Hence the error occurs within the lemma's hypotheses, not just for unrelated divisors. Replace the absolute value of the total intersection by the sum of the absolute component intersections: if D=Σd_jD_j, put B_i=Σd_j|D_j·C_i| for each exceptional curve on Y. Then Λ·C_i≥−δB_i. Choosing δ<γ/(1+max B_i) proves the desired nefness in the case meeting G; the other cases are unchanged. This bound depends only on f,D,γ, so it is uniform in the data claimed. Proposition 8.15 needs the first assertion, and Claim 8.21 needs a value above two when k=3; neither needs a matching upper bound.

**E2.** For R=k[[t]] and the pair (Spec R,V(t)), a finite normal integral extension is a DVR R′ with t=u s^e. The pure target is s^(1−e)R′, a finite free R-module in which 1 is primitive, since t times that module is sR′. Hence the inclusion of R splits. Ordinary global +-regularity already fails for the identity cover: R→t^−1R cannot split because the image of 1 under an R-linear retraction would lie in tR. This verifies the literal distinction. The v2 statement and the published proof's pure-section criterion identify the intended correction.

**E3–E5.** For E3, the vanishing theorem requires negative powers. Dualizing after twisting by K_X+S+B−M produces precisely the adjoint bundle in the lemma's conclusion. For E4, the proof and introductory theorem support ≤; I do not infer that the stronger strict inequality is mathematically impossible. For E5, substituting L=10K and c₂=12χ−v gives 319v+12χ≤325v+48, hence 373 for v=1, while the fibre's canonical degree is 110. Substituting L=8K gives 213v+48. These bounds satisfy the two conditions used in the proof.

**E6–E8.** T=X makes the resolution conclusion impossible. The negative degree line bundle on the projective line gives E7's empty system. In the actual birational affine setting, the pushforward of O(D) has rank one and nonzero global sections, explaining why this definition repair does not obstruct those uses. For E8, keep both f_*D_Y=D_X and D_Y≥floor(f*D_X), with D_X Q-Cartier and D_Y merely an integral Weil divisor. A rational section g downstairs satisfies div(g)+f*D_X≥0 upstairs. Since div(g) is integral, flooring gives div(g)+floor(f*D_X)≥0, and therefore div(g)+D_Y≥0. The reverse inclusion follows by pushforward and normality. This proves the needed adapter without assuming D_Y Q-Cartier or replacing the floor by a stronger unjustified bound.

**E10–E11.** Substituting the two equalities in Proposition 2.52's proof gives K_Z in the displayed formula on Z. For the old preprint complex, put I=H⁰(K) and Q=H¹(K). The truncation triangle gives

`H^(d−2)(RΓ_mRΓ Q) → H^d(RΓ_mRΓ I) → H^d(RΓ_mRΓ K) → H^(d−1)(RΓ_mRΓ Q)`.

The support estimate kills the last group but does not remove the preceding boundary map, so it proves surjectivity only. This is the precise independently checked proof gap in v1. The authors acknowledge that old lemma as incorrect and replace the construction in v2 and the published paper. I do not claim an additional counterexample to its image statement or reuse the old lemma in the corrected theory.

## Correction searches and validation

On 23 September 2026, the [Springer article page](https://link.springer.com/article/10.1007/s10240-023-00140-8) and [Schwede's current papers page](https://kschwede.github.io/papers.html) linked no correction for this article. [arXiv history](https://arxiv.org/abs/2012.15801) still ended at v3. The [Crossref DOI record](https://api.crossref.org/works/10.1007/s10240-023-00140-8) had an empty relation object and no update-to entry; this was not an exhaustive reverse-update search. Searches by title and DOI with “erratum”, “correction” and “corrigendum” found no separate notice. E11 is the explicit exception already corrected within the versions themselves. These are bounded negative searches, not claims of discovery priority. Earlier workers' search notes remain attributed in the JSON.

Checks run:

- `python3 scripts/check_errata.py research/blueprint/errata/PAPER-BHATT-ETAL-23.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/reviews/REV-ERRATA-PAPER-BHATT-ETAL-23.md research/blueprint/errata/PAPER-BHATT-ETAL-23.json research/blueprint/errata/PAPER-BHATT-ETAL-23.md`
- Exact rational diagnostics for the two blow-up intersections, the cancellation counterexample, the floor identity and the moduli-bound arithmetic; stable inherited IDs and one verdict per finding were checked separately.

Only the three assigned deliverables are changed. There is no Lean deliverable and no compilation or formalization claim. The identified local corrections suffice for the checked uses; this does not certify the entire MMP, vanishing theory or all applications in the article.
