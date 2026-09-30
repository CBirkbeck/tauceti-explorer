# Red team: PAPER-SCHOLZE-26 (Scholze, *Berkovich motives*)

Job `RT-PAPER-SCHOLZE-26` (issue #4256), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-SCHOLZE-26.result.json`, in the format of PROTOCOL section 17.

**Result:** 10 findings: 1 high, 6 medium and 3 low.

- **The extraction.** It is careful and close to the text.
  - It has 55 items (5 planned, 50 missing), 6 routes and 3 misprints.
  - The item statements match arXiv v3. The exception is one clause of item 22 (finding 7).
  - Its one library claim, Gelfand–Mazur in Mathlib, holds at the pin.
  - E1–E3 are correct.
- **What breaks.**
  - The main route rests on a coalescence with Binda–Kato–Vezzani's rigid-motive Part II that was rejected the same evening. The pending design job is therefore told to keep a brief it never receives.
  - Several owners are wrong or were overlooked: the six-functor machinery (AnalyticStacks), étale motives, cdh descent and dualizable categories.
  - de Jong's alterations has no item.
  - One item misstates Proposition 5.17.
  - Two misprints were missed.

## Independence

- **Who did the work.**
  - The extraction is by Claude Code `cc-39fac3` (issue #1410, PR #2084, 23 September).
  - The review, REV-PAPER-SCHOLZE-26, is by Claude Code `cc-7b31c4` (issue #1411, PR #2416, 23 September).
  - There is no separate errata file for this paper.
  - `cc-f805bf` appears in none of these files.
- **Disclosure.**
  - This session reviewed PAPER-SCHOLZE-17 (PR #4688). It also red-teamed Česnavičius 21, Nikolaus–Scholze 18 and Land–Mathew–Meier–Tamme 24 (PRs #4713, #4708, #4730).
  - Finding 4 cites LMMT's accepted extraction and review files (item /93's note and its route 1). It does not cite my red team of LMMT, which raised nothing about cdh descent.
  - No finding relies on the Scholze 17 review.

## What was read

- **The paper.** arXiv 2412.03382v3, downloaded on 30 September.
  - Its SHA-256 `440b4a82…d484` reproduces the extraction's.
  - I read all 65 pages through pdftotext.
  - Pages 34, 35 and 38 were rendered as images.
  - v3 is the latest arXiv version. Crossref records no update.
  - The JAMS page returned HTTP 403, so the version of record was not compared. The misprint findings are scoped to v3.
- **The repository.**
  - The extraction, its report, the review JSON and report, and the register entries.
  - The stage texts of TB.0, TB.1, K.5, S.3, S.5, S.6, RT.5, E5, MC.4, M.5/M.5a, L.1 and L5.
  - The new roadmaps AnalyticStacks and SolidAnalyticRings.
  - The packets for TB, K.1, K.6, S, E5 and MC.
  - BKV's extraction and review; make_queue.py; queue.json; issue #3463.
  - PAPER-SCHOLZE-12 with RT-PAPER-SCHOLZE-12/2.
  - LMMT 24 and Bhatt–Mathew 21.
- **The libraries.** Mathlib `082e2d3` and Tau Ceti `f790474`.
  - `declarations.tsv` was searched for Berkovich spectra, Banach rings, arc-topologies, condensed sets, K-theory, motives, six functors and dualizable categories.
  - Every declaration cited below was opened at the pin.

## What holds up

- **Coverage.** Every numbered environment except Remark 1.4 is cited by an item, as the review says.
- **Statements.** The statements and hypotheses match v3. Checked in particular:
  - item 1's conventions (|−1| ≤ 1, R = 0 allowed);
  - Theorems 4.1, 4.20, 6.3 and 7.1;
  - the K-theory statements of §8;
  - Proposition 10.3;
  - the MG_k/MG_C description of §11;
  - §12.
- **Re-derived.**
  - Proposition 2.6.
  - Proposition 3.2's discrete case.
  - The divisor bookkeeping of Lemma 6.4.
  - The count N − (N − 1) = 1 in Theorem 7.1.
  - The Hom description in Lemma 6.5.
- **Source issues.**
  - E1–E3 are right. For E3, ℤ with the trivial norm has discrete residue fields, and Definition 3.10(i) requires analytic.
  - Each appears once in the register and once in `data/source-issues.json`.
- **Library.** `NormedAlgebra.Real.nonempty_algEquiv_or` (GelfandMazur.lean:406) is as the note says, and Mathlib has no Ostrowski step from |2| > 1.
- **Routes 2 and 3.**
  - TB.0's packet builds M(A) for any normed commutative ring.
  - K.5's packet (done 28 September) plans homologically unital excision.
  - No source route lands in a blueprint that was finished before the route was accepted.

## Findings

### High

1. **Route 1's coalescence does not happen.**
   - The brief says: "coalesces with MotivesRigidAnalyticPartII, proposed by PAPER-BINDA-KATO-VEZZANI-25; keep its id, title, parent, area and brief". It reuses "the Part II's formal layers". Five item notes say the Part II "already carries" RigDA tilting, good-reduction generation and nearby cycles.
   - BKV's review, committed at 23:58 on 23 September (this review was at 18:35), rejected that route (its 13) and gave the verdict *revise*.
   - `accepted_routes` drops every route of a paper whose verdict is not *accept*. So DESIGN-MotivesAndAlgebraicCyclesPartII (#3463) carries this route alone ("1 continuation"). Its prompt points only to this file.
   - The designer is told to keep a brief it never receives, and to reuse RigDA layers that nothing plans. The title advertises "logarithmic motives", which this paper never uses.
   - **Fix:** make the brief self-contained, as a Berkovich-motives Part II with the final theorems stated in full. State that BKV's proposal should coalesce into this roadmap when it is resubmitted. Make the RigDA comparison conditional on an owner, drop "logarithmic", and rewrite the item notes. The same defect in PAPER-SCHOLZE-12 was confirmed as RT-PAPER-SCHOLZE-12/2.

### Medium

2. **The six-functor machinery has an owner.**
   - Item 42 relies on [Sch25b, Thm 5.19] and [HM24, Thm 3.4.11]. Its note says the atlas has six operations "only for diamonds … and étale sheaves", and prerequisite 1 lists both works as uncovered.
   - AnalyticStacks, in the repository since 16 September, plans them in AS.0: the construction principle, extension to stacks (Theorem 5.19 = HM Theorem 3.4.11), and cohomologically smooth and étale maps.
   - AS.1 plans Shv(X, D(ℤ)) on locally compact Hausdorff spaces, which Theorem 4.14 and the ℂ-case of Theorem 9.2 use.
   - AnalyticStacks excludes the motivic lectures, so the Berkovich formalism stays in route 1.
   - Prerequisite 12, Bhatt–Mathew, was already extracted.
   - **Fix:** have the Part II import AnalyticStacks AS.0 and AS.1, correct the notes of items 42 and 14, and delete prerequisites 1 and 12.
3. **Étale motives are not planned.**
   - Item 49 is marked planned at MC.4 and M.5a.
   - MC.4's accepted packet builds Mazza–Voevodsky–Weibel's Nisnevich DM^eff,-_Nis with transfers, and M.5a plans Nisnevich sheaves with transfers.
   - Nothing in the atlas plans the category of Remark 11.2: étale descent, 𝔸¹-invariance and G_m-stability with ℤ-coefficients.
   - **Fix:** mark item 49 missing and give route 1 a DM_ét(k, ℤ) layer that imports MC.4 and M.5a. Proposition 1.13 then compares D_mot(k) with that layer.
4. **Route 4 sends K-theory inputs to layers that do not plan them.**
   - Item 37 bundles five theorems: Thomason–Trobaugh 3.19, Cisinski's cdh descent, pro-cdh descent, 𝔸¹-invariance over (non-noetherian) valuation rings, and Gabber–Suslin rigidity.
   - S.5 plans homotopy invariance only "for regular noetherian schemes in scope", and neither S.3 nor S.5 mentions cdh, valuation rings or rigidity.
   - LMMT's accepted extraction states that cdh descent for KH is not planned at S.5 and routes it to a GeneralAlgebraicKTheory Part II, so it now has two owners.
   - **Fix:** split item 37. Keep Thomason–Trobaugh at S.3. Send cdh descent to LMMT's owner. Route the other three to the SchemeKTheoryOperations Part II.
5. **Dualizable categories go to a layer scoped to compact generation.**
   - Item 47 bundles eight results, including Ramzi's compactly assembled = dualizable, trace-class generation and Gaitsgory–Rozenblyum rigidity. It is routed to E5:presentability.
   - That layer's text works "under the appropriate compact-generation hypotheses", which is exactly the setting the paper avoids.
   - Item 38 sends Efimov's theory of dualizable categories to RT.5.
   - **Fix:** split item 47 and give dualizable and rigid categories one owner (RT.5, or E5 with a request to widen its scope).
6. **Cited key theorems have no items.**
   - de Jong's alterations are used in Proposition 10.1, and through it in Theorem 1.12 and Theorem 11.1. AdicCoefficientsAndComparisons L5 plans them.
   - van der Put's compactification and the divisibility of the generalised Jacobian are used in Lemma 6.4.
   - Postnikov completeness of the replete arc-topos (Mondal–Reinecke) is used in Theorem 4.20.
   - **Fix:** add the items (de Jong as planned at L5) and the prerequisites.
7. **Item 22 misstates Proposition 5.17.**
   - The item says "Symⁿ(Ḡ_m) ≅ 𝔸^{n−1} × Ḡ_m". The paper's characteristic-polynomial isomorphism is Symⁿ(G_m) ≅ 𝔸^{n−1} × G_m (checked on the page image).
   - The reduced map Symⁿ(Ḡ_m) → Ḡ_m becomes an isomorphism only after L_B.
   - With bars there is no such map: the coefficients of ∏(X − x_i) are not defined when the x_i are known only modulo 1-units.
   - **Fix:** restate the clause as in the paper.

### Low

8. **A missed misprint in Proposition 5.19 (p. 35).**
   - The paper prints |a_i| < **max**(r_2^{n−i}, |a_0| r_1^{−i}). It should be **min**.
   - Take r_1 = 1/2, r_2 = 4, a_0 = 1 and |a_1| = 2^{3/2}. The max condition holds, but X² + a_1X + 1 has a root of absolute value 2^{−3/2} < 1/2.
   - The largest root is max |a_i|^{1/(n−i)} and the smallest is min (|a_0|/|a_i|)^{1/i}, which gives the min criterion. The fibre is still an open polydisc.
   - **Fix:** record it as E4.
9. **Missed misprints in the proof of Lemma 6.5 (p. 38).**
   - "|T| ≥ r_1 > 1" should be r_2.
   - "absolute value r_2^n" should be |T|^n ≥ r_2^n.
   - "|T − a_i| = |a_i|" should be |T − a_j| = |a_i − a_j| = 1.
   - "at most r_1^n … once n is sufficiently large" should be r_1^{k_i} … once k_i is large.
   - The argument works as intended.
   - **Fix:** record them as E5.
10. **Mathlib pointers are missing.** These are partial library support, not a change of status.
    - Item 1: `SeminormedCommRing` and `NormedCommRing`. Scholze's |−1| ≤ 1 is ‖1‖ ≤ 1.
    - Item 4: `MulRingSeminorm`.
    - Item 5: `smoothingFun`, with `isPowMul_smoothingFun`, which needs only μ 1 ≤ 1.
    - Item 9: `CondensedSet` and `CompHaus.effectiveEpiFamily_tfae`.
    - Item 14: `continuousCohomology`.

## Considered and not raised

- **Theorem 6.3's "modulo n for some n ≥ 1" without |n| ≥ 1.** This is consistent: Lemma 6.4 holds for every prime p, and Theorem 6.7 makes p invertible where |p| < 1.
- **"|n|_ℤ = ±n" (p. 8), "Up the action of SL_2" (p. 43) and "it easy to check" (p. 18).** These are notation and grammar only.
- **Item 36 (Suslin excision) marked missing.** K.5's packet, finished later, now plans homologically unital excision, so route 3 lands correctly.
- **sourceVersions absent in the extraction.** None of E1–E3 affects a stated result, and readSections records v3 with its hash.
