# REV-RT-PAPER-BHATT-MORROW-SCHOLZE-19

**Complete: all twelve findings confirmed.** Most of the fixes are corrected below. One of finding 7's seventeen paper mistakes is not a mistake, and one part of finding 6 is wrong.

- **Job:** Refs #4305.
- **Verifier:** Claude Code, session `cc-48533a`, 30 September 2026.
- **Independence:** the extraction, its review and the red team (RT-PAPER-BHATT-MORROW-SCHOLZE-19, session `cc-f805bf`) were done by other sessions.
- **Verdicts:** `research/blueprint/redteam/RT-PAPER-BHATT-MORROW-SCHOLZE-19.review.json`. `python3 scripts/check_redteam.py` reports it `ok`.

## Evidence and scope

**Sources.** Both match the extraction's recorded hashes.
- The published Publ. Math. IHÉS 129 (2019), 199–310, which is open access.
- arXiv v2, with its LaTeX source.

**Division of the work.** Three verifiers worked in parallel:
- the six ordering findings (1–6);
- the paper's mistakes and the item statements (7, 8, 12);
- locators, library citations and external inputs (9–11).

**How ordering was checked.** The stage graph was built with the repository's own build functions, run read-only. It contains the atlas stage edges plus the links from the 25 accepted restructurings, the accepted link maps, the accepted decompositions and the promoted blueprints. Every proposed link was checked on its own and together with the others, including the pending links that touch these roadmaps. All of them stay acyclic.

## Ordering

**/1 — confirmed; fix as proposed.**
- Propositions 7.16 and 7.17 and Corollary 8.23 are proved through Theorem 7.15, which goes to the henselian-pairs Part II. That Part II comes after its parent.
- The same back edge is in accepted plans: Bhatt–Scholze route 4, and Bhatt–Mathew-23 route 7 (item /008).
- RT.6 has no K-theory stage upstream at all.
- Update route 2's reason.

**/2 — confirmed; one change.**
- Record CR.4 → DD.4, DD.5 → DD.4 and DD.4 → RT.6. Item 080 also needs CR.4.
- Instead of adding DD.4 → PR.3, drop PR.3 as a planner of item 084. Theorem 8.17 is a TC statement, and PR.3's own text assigns that comparison to RefinedTraceMethods.

**/3 — confirmed; three additions.**
- When item 088 is split, the PR.4 half must identify the completed prismatic ring with the Nygaard-completed A_crys through PR.1–PR.3, not through Theorem 8.17. Otherwise it still depends on RT.6.
- The Nygaard–Lη comparison for §10 should come from PR.3.
- The reason should read "§§7.4, 8.1, 8.4 and 10".
- The paper cites Theorem 9.6, not Theorem 1.8, at the start of §10.

**/4 — confirmed; keep the link fix and reject the alternative.**
- AI.0 → RT.6 and AI.4 → RT.6 are right.
- Routing §9 to AI.7 fails, because items 100 (Proposition 9.14) and 006 (Theorem 1.8) stay at RT.6 and are proved through Theorem 9.6.
- Drop PR.3 as a planner of item 097.

**/5 — confirmed.**
- DD.0 → RT.1 is already a confirmed pending fix (RT-AREA-ktheory-2/37).
- E5:animation → RT.1 is redundant, since DD.0 requires E5:animation.
- Dropping RT.1 from items 015 and 045 is still needed, because they use the DD.5 site.
- DD.3 → DD.5 is needed for Example 5.12.
- The same fix applies to Nikolaus–Scholze /127 and /129.

**/6 — confirmed, except for item 024.**
- L.5 → RT.6 is right, and item 023 should be planned at L.5 only.
- The item 024 part is wrong. The paper states that it does not need Bökstedt's computation of π_*THH(ℤ) (§2.3, p. 216). Lemma 2.5 uses only that π_iTHH(ℤ) is finite for i > 0, which follows from Serre's finiteness of the stable homotopy groups of spheres. That is the input to name, and no stage plans it.
- "The only non-formal input on THH" paraphrases Remark 1.5; it is not the paper's wording.

## The paper and the items

**/7 — confirmed for sixteen of the seventeen mistakes.**
- Each of the sixteen is printed the same way in both texts, and none duplicates E1–E12.
- The verifier re-derived the mathematics:
  - **Remark 1.16:** the triangle needs the Gysin shift [−2]. The n = 1 fibre is ℤ_p[−2]. The Hesselholt–Madsen graded pieces also lack [2n].
  - **Proposition 5.6:** it should be Ext^{i+c}, not Ext^{i−c}. The proof of Theorem 5.4 has the opposite slip, so the two cancel and the theorem stands.
  - **Proposition 11.3:** the equivariant map is (s, n) ↦ (s, pn).
  - **Others checked:** min for max in Corollary 7.10, the index slips in Propositions 8.5 and 8.7, 𝒩^i for 𝒩^{≥i} in Proposition 8.13, and q = [ε] in Remark 9.11.
- **Item (7) is not a mistake.** The sentence "bounded below … so after shifting coconnective … bounded above" on p. 247 is consistent with the paper's cohomological indexing for bare "bounded above/below". §5 writes "bounded above complexes (K^i = 0 for i ≫ 0)", and §2 says "homologically bounded below" when it means homological indexing.
- **Right fix:** record E13–E28 (sixteen entries), all misprints with `known` "new". For (8), affects is "nothing": the printed max bound is true.

**/8 — confirmed; two drifts are worse than stated.**
- Items 040, 059 and 106 copy the paper's slips.
- Two items are false, not merely loose:
  - **041's "exactly when":** over ℤ_p with I = (p), the triangle ℤ/p[−1] → 0 → ℤ/p goes to 0 → 0 → 0, which is exact, but its boundary map is an isomorphism.
  - **035's bare "equivalently S = R/I":** ∏O_C/pⁿ is a quotient of the perfectoid ∏O_C by a nonzerodivisor, but it has unbounded p^∞-torsion.
- Item 070 is faithful, so adding the extension improves completeness only.
- For item 001, the missing torsion Breuil–Kisin definition can be requested from R07.4 ("Breuil–Kisin modules"), which AI.7 already requires.

**/12 — confirmed.**
- Published p. 285 prints the same "(a_i) ∈ ∏O_C^♭" slip as arXiv v2 p. 69, so E8 is not corrected in print.
- The false claim appears in three places: E8's `known` field, item 093's note and the report.
- It has reached the errata register, which lists E8 under "Already corrected in print".
- The fix is right.

## Locators, library, external inputs

**/9 — confirmed; list incomplete.** All 114 locators were checked, and every correction the red team gives is right. Nine more are wrong in the same way:

| Item | Correct locator |
|---|---|
| 047 | pp. 244–247 |
| 015 | pp. 209–210 |
| 016 | pp. 212–213 |
| 019 | pp. 214–215 |
| 031 | pp. 224–225 |
| 038 | pp. 233–234 |
| 062 | pp. 260–261 |
| 073 | "proof of Proposition 8.4, pp. 267–268" |
| 023 | "§6.1 and proof of Theorem 6.1, pp. 243–244" |

Items 048, 002, 012 and 001 are slightly imprecise. Item 063 cites [CMM21] where the text has [CMM18].

**/10 — confirmed.**
- `fontaineTheta_surjective` does not exist; the name appears only in a Mathlib file header.
- The real theorem is `surjective_fontaineTheta`, which needs Frobenius surjective on R/p.
- The counterexample holds: for R = ℤ_p⟨T⟩ the tilt is F_p, so θ is not onto.
- `H1Cotangent R S` is π₁L_{S/R} for every R-algebra S; for S = R/I it is I/I².

**/11 — confirmed in substance, with corrections.**
- **Nikolaus–Scholze inputs.** They are owned by that paper's accepted routes:
  - Proposition IV.4.2 is /128 at L.5.
  - Theorem II.4.10, Corollary IV.2.4 and Lemma IV.4.12 are /65, /121 and /134 at RT.2.
  - The L.5 input needs the /6 link. Two further uncited inputs are Corollary I.4.3 (/32, RT.2) and Theorem I.3.6 (/26, E5:abstract).
- **w-localization** is genuinely missing. Add Bhatt–Scholze 2015 to the prerequisites.
- **Illusie 1979.** CR.4 owns it. It is also used in items 072 and 083. Add it to the prerequisites.
- **BMS 2018 and Scholze–Weinstein** are already prerequisites; only their owners are missing.
  - BMS 2018 Theorem 1.8 is at AI.5, and its Lemma 3.14 at Q0:integral-algebra, used by items 035 and 046.
  - Quillen's Theorem 6.13 appears only in commentary.

## For the maintainer

- **Pending fixes already confirmed.** Three of these links are confirmed in other red-team reviews: DD.0 → RT.1 (RT-AREA-ktheory-2/37), CR.4 → PR.4 (RT-AREA-padic-2/16) and PR.4 → RT.6 (RT-AREA-ktheory-2/36).
- **An existing cycle.** The accepted Clausen–Mathew–Morrow brief asks RT.3 to import Theorem 4.36 from the henselian Part II, which itself imports RT.3. The L.5 → RT.6 link would also route that cycle through RT.6.
- **A further ordering gap.** Q0:integral-algebra, which plans perfectoid rings, is not upstream of DD.5, where the quasisyntomic site and quasiregular semiperfectoid rings sit. None of findings 1–6 raises this.

## For the fix job

The medium findings /1–/6 become FIX-RT-PAPER-BHATT-MORROW-SCHOLZE-19. Apply them with the corrections above:
- /2: drop PR.3 for item 084;
- /3: the PR.4 half of item 088 goes through PR.1–PR.3;
- /4: links only;
- /5: reuse the pending DD.0 → RT.1;
- /6: Serre finiteness for item 024.
