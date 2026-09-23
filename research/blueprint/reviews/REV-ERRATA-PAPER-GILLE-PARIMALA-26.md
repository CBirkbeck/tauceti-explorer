# REV-ERRATA-PAPER-GILLE-PARIMALA-26

**Verdict: confirmed with corrections, at the source versions specified below.**

Reviewer: Codex, session `codex-7e92bd`, 23 September 2026. Original errata author: Claude Code, session `cc-fb70e5`. I did not write the original errata or the paper extraction. This review concerns the files written by ERRATA-PAPER-GILLE-PARIMALA-26; it leaves the extraction unchanged.

## What was checked

I read the eight original findings and their explanation, checked each cited passage in [arXiv v3](https://arxiv.org/pdf/2301.07572v3), then downloaded [HAL v5](https://hal.science/hal-03938963v5/document) and compared its corresponding passages. I checked the additional extraction findings against the HAL pages and relevant public sources, rather than treating the extraction as source evidence. I read [Gille's current erratum](https://math.univ-lyon1.fr/~gille/prenotes/errata.pdf), dated 26 May 2026, p. 1, and checked the two repairs and the proposed example. For E7/E8 I read the relevant normalizer construction and loop-torsor hypotheses in the linked primary sources. For E19 I read the complete HHKP Lemma 2.4 and its proof, pp. 6–7 of v3.

The [publisher's public Appendix B.1](https://link.springer.com/article/10.1007/s00222-026-01403-x) and its restriction-map image confirm E17 in the version of record. The publisher's main body was not available: the PDF endpoint returned HTML. Confirmation of the other GP passages is therefore limited to arXiv/HAL, with published Example 5.1(b) and Proposition 6.2 identified by the author erratum. HHKP's arXiv record calls v3 its published version; no separate typeset collation is claimed. Exact downloaded-source hashes and version limits are recorded in the errata JSON. This is a completed review of those explicitly scoped findings, not a certification that inaccessible typography is unchanged.

I also rechecked public revision/correction information: arXiv histories, Gille's publication/errata page, the publisher page, Crossref update/relation metadata, and for HHKP Karemaker's publication page and a title/erratum search. “New” is bounded by those searches. I found no additional published correction of the findings labelled new.

## Per-finding verdicts

All identifiers in this table refer to the errata file, not the independently numbered extraction.

| ID | Verdict and independent check |
| --- | --- |
| E1 | **Confirmed.** Confirmed the surviving unit-ball misprint in both PDFs. Revised the version claim: HAL removes Inf and corrects the proof of (2), but retains ≥ 0. Split that already-corrected proof into E21 rather than classifying it as new. |
| E2 | **Confirmed.** Confirmed both incorrect domains in both manuscripts. Checked the counterexample with a = b = c = 1, F₁ = F₂ = F₀, V = R̂₀, W = 0, f(v,w) = w: completeness, saturation and V + W = R̂₀ all hold. The intended statement and its proof use W in the second summand; retain misprint/nothing for intended mathematics. |
| E3 | **Confirmed.** Confirmed in both manuscripts by left-multiplying x₁ = h₁h₂.x₂ by h₁⁻¹. The repaired equality identifies the F₁- and F₂-points over F₀; no inverse on h₂ is possible in that calculation. |
| E4 | **Confirmed.** Confirmed the false equality in both manuscripts and the author’s correction. Reproved strict inclusion by the coefficient-valuation bound. Separated the new error in the erratum’s witness from this already-known error, so the two have independent known statuses. |
| E5 | **Confirmed.** Confirmed by checking the exponent ranges in each displayed sum in both versions. Expanded the correction to address HAL’s two reversed ring labels; the old one-word replacement describes only arXiv v3. |
| E6 | **Confirmed.** Confirmed by reading the type convention and following both inclusions in the parabolic-variety proof. Extended the locator/correction to HAL Corollaries 4.7(2) and 4.8(2). This affects a stated Tits-index characterization; the corrected characterization follows from the point-existence part. |
| E7 | **Confirmed.** Confirmed in both GP PDFs and independently checked the cited construction. Corrected both HAL occurrences and sharpened the reason: lack of normality precedes the finiteness problem. The Weyl/diagram order hypothesis concerns the normalizer quotient. |
| E8 | **Confirmed.** Confirmed the missing henselian hypothesis against the loop-torsor source and the author erratum. Repaired the original errata entry’s notation: in GP, F_P already means Frac(R̂_P). Henselianity is the cited requirement; completeness is a sufficient replacement. Verified equality of valuation completions by density, not merely by naming their residue fields. |
| E9 | **Confirmed.** Confirmed the square-zero misidentification in HAL p. 7 and arXiv p. 4. Checked the different nilpotence-index conventions; the correction to the quotient range applies only to HAL. The proof needs the actual square-zero kernels. |
| E10 | **Confirmed.** Confirmed the quantifier slip on HAL p. 9 and arXiv p. 6. The continuous linear inclusion supplies the missing reason in the next sentence. The intended analytic argument survives; removed the extraction’s unneeded unverified Mathlib citation. |
| E11 | **Confirmed.** Confirmed the tautological ambient group in the HAL statement and the repeated v/w slips in its proof and Proposition 3.9. The displayed neighbourhood is open in G(F₀), so replacing the ambient group and the second variable repairs exactly what the proof establishes. |
| E12 | **Confirmed.** Confirmed the two logical shortcuts on HAL p. 13. Checked the replacement directly: a = gn⁻¹ implies g = an ∈ AB. It uses only the proved identity neighbourhood and density. Also corrected the omitted identity value and the coordinate/group notation in the same passage. |
| E13 | **Confirmed.** Confirmed the power, base-field and ambient-group slips by reading the HAL page image (including the bars). Corrected the extraction’s inaccurate claim that the first T♯(F₁) was under a bar. Checked the lift/approximation argument; the closure must be of RT♯(F₁), and the chosen embedded torus must be conjugate to the product torus. |
| E14 | **Confirmed.** Confirmed the unproved normality step on HAL p. 15: even the diagonal in S₃ × S₃ has surjective projections without normality. With H open, each H ∩ G_i(F₀)^+ is open and is normalized by the surjective projection p_i(H); it contains noncentral root-group elements. The Tits normal-subgroup result already invoked in the source then yields every factor. Checked that the final citation must be Proposition 3.9(2), since (3) has a stronger F₁-isotropy hypothesis. |
| E15 | **Confirmed.** Confirmed both slips in HAL Lemma 4.3, p. 17. The density claim as printed is impossible in the t-adic topology; its corrected form is precisely what the successive approximation proof establishes. This is distinct from the incomplete-module choice in E20. |
| E16 | **Confirmed.** Confirmed the use of properness across a possibly singular component on HAL p. 19. Checked the explicit real-curve/conic diagnostic and the proposed resolution repair: pull back the reductive group and flag scheme, then use Corollary 4.6 on the new model. This is a proof gap, not a counterexample to the local-global theorem. |
| E17 | **Confirmed.** Confirmed in the HAL PDF and the published HTML, including its equation image. Verified all hypotheses of the disconnected regular-scheme counterexample. Replaced the extraction’s “equivalently” by “alternatively”: requiring integrality is stronger than merely requiring U to contain the generic points. |
| E18 | **Confirmed.** Confirmed directly in the freshly downloaded May 26 erratum. Multiplying the printed series by x−t gives t. Split this out of the original E4 because it is a new mistake in the correction, whereas the underlying field equality is already acknowledged. |
| E19 | **Confirmed.** Confirmed the residue-field shortcut in the public version designated published by arXiv. Repaired both the residue-field equality and the use of the final maximal ideal at finite stages. Checked the local-colimit argument; no claim is made about unobserved typography in the separate AMS copy. |
| E20 | **Confirmed.** New finding from this review, confirmed by comparing the two module definitions and the required completeness hypothesis. Reused the independently proved factorial-pole obstruction to give an explicit Cauchy sequence without a limit in the intersection. The correction is supplied by the preceding lemma itself. |
| E21 | **Confirmed.** Confirmed the historical arXiv slips and the complete repair in HAL. This separates the already-corrected portion of the original E1 from its still-new unit-ball mistake; it must not be counted as a new published error. |

## Material changes to the original errata

- Preserved E1–E8. E1 now isolates the persistent unit-ball inequality; E21 retains the old norm-proof slips with HAL as the known correction. The old claim that HAL repeated the entire passage was inaccurate.
- E5 now gives the different repairs needed in arXiv and HAL. E6 covers every affected HAL Tits-index corollary.
- E7 names the normalizer quotient in both occurrences. E8 distinguishes the paper's completed patch field from the uncompleted function field and proves the valuation-completion comparison by density.
- E9–E19 bring across eleven missing extraction entries after direct source checks. Their corrections were adjusted where needed: in particular the nilpotence index, the torus overbars/powers, the purity alternatives, and the HHKP maximal ideals.
- E18 gives the incorrect witness in the author erratum its own newness status. E20 adds a further proof gap: the intersection modules selected in Theorem 4.5 need not be complete; use the complete modules in Lemma 4.3.

For E4/E20, the coefficient recurrence gives an explicit universal linear pole-growth bound for a quotient of power-series rings. Factorial poles contradict that bound. For E17, the disconnected regular scheme and quaternion torsor satisfy the printed hypotheses but destroy injectivity. For E16, the real singular curve and constant conic show why properness alone cannot justify specialization to the singular point. These are mathematical checks, not numerical guesses. Small symbolic diagnostics also checked the geometric-series identity, square-zero example, gluing sign, and nonnormal diagonal subgroup. No Lean compilation was required or attempted.

## Validation

- `python3 scripts/check_errata.py research/blueprint/errata/PAPER-GILLE-PARIMALA-26.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/reviews/REV-ERRATA-PAPER-GILLE-PARIMALA-26.md research/blueprint/errata/PAPER-GILLE-PARIMALA-26.json research/blueprint/errata/PAPER-GILLE-PARIMALA-26.md`
- `git diff --check`

Only the three issue deliverables are changed. Downloaded source material and diagnostic scripts remain outside the repository. The automated intake, not this worker, updates the central errata register.
