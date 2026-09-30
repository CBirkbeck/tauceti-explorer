# Red team: PAPER-CHANG-CHEN-MISHIBA-23 (Chang–Chen–Mishiba, *On Thakur's basis conjecture for multiple zeta values in positive characteristic*)

Job `RT-PAPER-CHANG-CHEN-MISHIBA-23` (issue #4234), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-CHANG-CHEN-MISHIBA-23.result.json`, in the format of PROTOCOL section 17.

**Result:** 10 findings: 5 medium and 5 low.

- **The extraction.** It is careful: 51 items, 2 routes and 4 source issues.
  - The statements of the main results hold in both the preprint and the version of record.
  - All four source issues stand.
  - The dual numbering (preprint by subsection, published by section) is right throughout.
- **What breaks.**
  - The analytic apparatus of Section 5 is missing.
  - Carlitz's evaluation of ζ_A(n), which the independence proof needs, is unplanned.
  - The DM.8 source route never reached the DM.8 blueprint.
  - Seven of the twelve prerequisite links point to unrelated papers.
  - A missed misprint in Corollary 1.2.7 makes item 12 false as written.

## Independence

- **Who did the work.**
  - The extraction is by Claude Code `cc-7b31c4` (#1380, PR #1936, 22 September).
  - The review, REV-PAPER-CHANG-CHEN-MISHIBA-23, is by `cc-fb70e5` (#1381, PR #2466, 23 September).
  - These are the only session ids in the result, report, review JSON and review report. `cc-f805bf` appears in none of them.
  - There is no errata file or handoff note for this paper.
- **Disclosure.**
  - This session red-teamed PAPER-CHEN-24 earlier today.
  - Finding 3 has the same mechanism as that red team's finding 5: accepted source routes that never reached their blueprint issue. Its evidence here is specific to this paper.

## What was read

- **arXiv 2205.09929v2.**
  - The e-print hash is the extraction's (`6336dfc5…`).
  - I read the PDF in full through pdftotext and checked the TeX source at every quoted locator.
  - There are only two arXiv versions.
- **The version of record,** Forum Math. Pi 11 (2023) e26, as the open-access PDF from Cambridge Core.
  - It was revised in January 2023, after v2.
  - I read it in full, with page images where pdftotext drops overlines.
  - A word-level collation against v2 shows only presentational changes and one added remark (Remark 5.4).
  - Cambridge Core and Crossref record no correction.
- **The repository.**
  - Every item, route, prerequisite and source issue, and the review report.
  - The DM and PS.9/FA stages, the library audit for DM.0–DM.8, and the DM.0 and DM.8 packets.
  - The two sibling extractions: Ngo Dac 21 and Im–Kim–Le–Ngo Dac–Pham 24.
  - The queue, make_queue.py and issues.py, and the live issues #1008 and #1009.
- **The pinned libraries,** Mathlib `082e2d3` and Tau Ceti `f790474`.

## What holds up

- **Counts.**
  - |I^T_w| = |IND_w| = d'_w for q ∈ {2, 3, 4, 5, 7, 8, 9} and w ≤ 16.
  - The IND°_w of Example 4.3.2 are right.
- **Exact computations in F_p(θ):**
  - H.-J. Chen's product formula with the corrected condition (q − 1) | j holds in 96 cases (q ∈ {2, 3}, d ≤ 2, s, n ≤ 4). This confirms E2's correction.
  - Carlitz's identity 1/L_d^s = Σ_{a∈A_{+,d}} a^{−s} holds exactly for s ≤ q.
  - Thakur's relation ℒ_d(q) = L_1 ℒ_{d+1}(1, q − 1), the binary relation R_1, holds.
- **E1–E4.** Each was confirmed in the TeX source and on the published pages. E2 is corrected in print, as recorded.
- **Routes.**
  - There is no cycle.
  - Every missing item is routed once.
  - The Part II is a joined proposal with the two sibling extractions, and its design job is still pending.
  - There is no duplication with PS.9, which covers classical MZVs only.

## Findings

### Medium

1. **The Section 5 apparatus has no items (items 51, 17, 39, 40; route 1 brief).**
   - **What the paper builds.**
     - Ω(t) with Ω^{(−1)} = (t − θ)Ω, and π̃ := 1/Ω(θ).
     - The deformation series 𝓛(s) = Ω^{wt(s)} Σ 1/(𝕃_{d_1}^{s_1}⋯) ∈ 𝕋 ∩ E, with 𝓛(s)(θ^{q^j}) = (Li_s(1)/π̃^{wt})^{q^j}.
     - The matrices Φ′, Ψ′, Φ, Ψ, Φ̃ and ψ of the key lemma.
     - It invokes Papanikolas §4.1.6, CPY Prop. 2.2.1, and π̃ ∈ (−θ)^{1/(q−1)} k_∞^×.
   - **What the extraction says instead.** Item 51 places all of this in the §1.3 sketch, as input "the paper deliberately does not reprove".
   - **Comparison.** Both sibling extractions have items for these objects.
   - **A normalisation conflict.** The DM.8 packet requests π̃ = −1/Ω(θ); this paper uses +1/Ω(θ).
2. **Carlitz's evaluation is unplanned, and item 4 overclaims.**
   - The proof of Theorem 5.2.1 uses "π̃^w ∈ Z_w" for (q − 1) | w. This is Carlitz's ζ_A(n) ∈ k^× π̃^n.
   - Item 4 states no theorem, yet it is marked planned at DM.6.
   - DM.6 plans Taelman's class-number formula. Its only zeta value is ζ_A(1).
3. **The DM.8 source route never arrived.**
   - Issue #1009 (BP-DM.8) has no "maintainer added these sources" paragraph, although the review accepted the route on 23 September.
   - The DM.8 packet of 27 September cites only Papanikolas and lists ABP Theorem 3.1.1 as an unread gap.
   - Yet the Part II brief imports the ABP criterion, E and the twisting setting from DM.8.
   - The sibling papers' DM routes are equally absent from #1009 and #1008.
4. **Wrong prerequisite links and names.** The ids given:
   - 1207.4736 is a paper on Lévy processes; the correct id is 1207.2326.
   - 2007.11060 is a log-algebraic identities paper, not Ngo Dac's Annals paper.
   - 1601.01927 is a paper on tumour-cell filters; the correct id is 1411.0124.
   - The H.-J. Chen DOI is Berndt–Kang–Sohn; the author is Huei-Jeng Chen.
   - The Chang–Mishiba title is wrong, and 1908.06398 is on stochastic orders.
   - 1401.2708 is on Casimir energy; the correct id is 1312.4928.
   - Todd is George Todd, and the DOI given is Oppenheim–Shusterman.
   - The Thakur entry invents a title, and misses IMRN 2009, the source of R_1.
5. **Corollary 1.2.7 (published 1.8) is a missed misprint, copied into item 12.**
   - It prints "the k̄-vector space space by v-adic MZV's … dim_k Z_{v,w} ≤ …".
   - A nonzero k̄-space has infinite k-dimension, so the inequality fails whenever Z_{v,w} ≠ 0.
   - The paper's own argument (a k-linear algebra map killing ζ_A(q − 1)) proves the k-reading.
   - Fix: record E5 and correct item 12.

### Low

6. **Two surviving cross-reference misprints.**
   - §1.3 "See Theorem 2.7" refers to Proposition 2.7. The review dismissed this one as preprint-only, but it is not: the published §1.3 still says "Theorem 2.7".
   - §1.4 says "Section 2.1" for the product formulae, which are in §2.3.
7. **Library claims.**
   - Mathlib has the valuation at infinity and k_∞: `RatFunc.inftyValuation`, `RatFunc.inftyValued` and `RatFunc.CompletionAtInfty` (= `FunctionField.FqtInfty`). Item 1's note says the valuation at infinity "is not assembled anywhere", and item 1 cites `LaurentSeries` for k_∞, which is the completion at X, not at infinity.
   - Mathlib has the carrier of the Tate algebra: `PowerSeries.IsRestricted` and `MvPowerSeries.IsRestricted.subring`. Item 30 says the Tate algebra is not constructed.
8. **Item 2's layer citation.** It is planned at FA.0, which plans no completion or C_∞. DM.2 is the owner, as the audit and the DM.8 request show.
9. **Appendix objects without items.**
   - The maps ℬ, 𝒞 and ℬ𝒞.
   - Init(s) and the splitting U_1 + U_2 + U_3.
   - P^• over all weights.
   - The published Remark 5.4, the k̄-form of Theorem 5.4.2.
10. **No `sourceVersions`.**
    - Without it, `collation.py` reads the free text and files the paper as "preprint" in `data/collation.json`, although the published text was read.
    - E5 would make `sourceVersions` mandatory.

## Notes for the fixer and the design job

- **Before DESIGN-DrinfeldModulesAndTModulesPartII starts:**
  - Findings 1–3 change what that design imports and must plan.
  - The DM.8 blueprint should receive the three papers' source routes first (finding 3), so that "import from DM.8" means something.
- **Findings that change item statements:** 2 (item 4 split), 5 (item 12), 7 (items 1, 30) and 8 (item 2).
- **New source issues:** E5–E7, with `sourceVersions` added (finding 10).
- **Checks:**
  - `scripts/check_redteam.py` on the result reports ok.
  - `research/blueprint/intake.py check-files` on both files reports 0 problems.
