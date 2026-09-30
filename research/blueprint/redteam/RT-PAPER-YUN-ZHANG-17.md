# Red team: PAPER-YUN-ZHANG-17 (Yun–Zhang, *Shtukas and the Taylor expansion of L-functions*)

Job `RT-PAPER-YUN-ZHANG-17` (issue #4116), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-YUN-ZHANG-17.result.json`, in the format of PROTOCOL section 17.

**Result:** 15 findings: 8 medium and 7 low. None is high.

- **The extraction.** Its statements are faithful to the paper, and the review improved it.
  - It has 43 items (7 planned, 36 missing), 5 routes and 37 source issues.
  - The review's two big corrections are right. I re-derived both:
    - the |ω_X| factor multiplies ℒ^{(r)};
    - E9: J(∞, 1_K, s) = 2L(η, 0), so Theorem 1.8 has 2^{r+1}, not 2^{r+2}.
  - E1–E37 hold, except the third part of E28 (finding 11). The rejection of E8 is right.
- **What breaks.** The problems are mostly about where things go, not what they say:
  - the analytic side is sent to a number-field stage (1);
  - the Part II can be deferred by the queue (2);
  - the Octahedron Lemma has two owners (3);
  - two "planned" statuses claim more than their stages plan (4, 5);
  - the route texts handed to blueprint jobs still carry false statements (6);
  - several load-bearing inputs have no item (7, 8, 9).

## Independence

- **Who did the work.**
  - The extraction is by Claude Code `cc-fb70e5` (issue #1163, PR #1978, 22 September).
  - The review, REV-PAPER-YUN-ZHANG-17, is by Claude Code `cc-442dc5` (PR #2523, 23 September).
  - There is no errata file for this paper.
  - `cc-f805bf` appears in none of these files.
- **Disclosure.**
  - This session red-teamed Böckle–Harris–Khare–Thorne 19 (PR #4725). Its route 1 is in the same GlobalShtukas Part II group as this paper's route 1 (finding 2). That red team made no finding about the grouping.
  - This session wrote FIX-RT-AREA-iwasawa-1 (PR #4654). It edits GZ stages: GZ.0, GZ.1, GZ.9, and a central-value positivity node at GZ.5.
    - Finding 1 concerns GZ.5's field of definition, which that fix does not touch.
    - Finding 14 relies on that fix.
  - Finding 2 uses the queue mechanism of RT-PAPER-BENOIST-19/1 (confirmed, not my work).
  - Findings 8(a) and 8(f) point to the stacks Part II of RT-AREA-etale/3 (confirmed, not my work), which already owns ℓ-adic sheaf theory on stacks. I do not repeat that finding.

## What was read

- **The paper.** Both recorded hashes reproduce:
  - arXiv v3: `76bb3576…`.
  - The author's copy of the published version: `b02ed5cb…`. The Annals PDF `annals-v186-n3-p02-p.pdf` is byte-identical to it.
  - arXiv has v1–v3 only.
  - The Annals page (revised 23 January 2017) and Crossref show no correction.
- **Method.** Three read-only helper agents read §§1–4, §§5–7 and §§8–9 with the appendices, line by line. I checked every finding myself at the page. In particular I re-derived:
  - the u = ∞ orbital integrals of Proposition 2.4;
  - the Appendix B counterexamples (q = 3: −0.12998 and −0.16012);
  - E28's third claim.
- **The repository.**
  - The extraction, its report, the review and the register section.
  - Every cited stage text: GS.0–GS.7, SF.3, SF.5, EDC.5/7/8, FA.1/2/5/6, AL.1/2/3, DWP.7/8, GZ.5 and the AS roadmap.
  - The GS, AL and GZ packets.
  - `make_queue.py`, `queue.json` and `collation.py`.
  - The RT-AREA-etale and RT-AREA-iwasawa-1 fixes.
  - The extractions of YZ19, FYZ24, Lafforgue 18, CLP24 and the other GlobalShtukas Part II proposers.
- **The libraries.** Mathlib `082e2d3` and Tau Ceti `f790474`, searched in the declaration index. I read every declaration I cite.

## Findings

1. **(medium) The analytic side is routed to a number-field stage.**
   - Route 2 sends Jacquet's relative trace formula over k(X) (items 7–9, 12–14) to GZ.5.
   - GZ.5's roadmap fixes a totally real F and a CM K, and proves Waldspurger by theta kernels over number fields.
   - YZ19 routes the same orbital sums (YZ19/218, /226, /133) to the Part II. It sends this paper's Lemma 9.1 to GZ.5, while YZ17 sends it to the Part II.
   - The Part II brief imports "Theorem 4.7" from GZ.5, which will not provide it.
   - Fix: move these items into the Part II, with FA.2 and FA.6 as imports.
2. **(medium) The Part II id is not the queue's.** make_queue groups Part IIs by parent alone.
   - All nine accepted GlobalShtukas proposals become one job, and its first member is Ciubotaru–Harris (Ramanujan–Arthur).
   - Under the "plan the first" rule, the 159-item special-cycles tranche can be deferred.
3. **(medium) The Octahedron Lemma has two owners.** It goes to SF.5 here and to the Part II as YZ19/116. The YZ17 review came after YZ19's and did not reconcile them.
4. **(medium) Item 41 is not planned at SF.5.** SF.5 is Fulton on schemes.
   - Kresch's stack theory (vector-bundle normal cone stacks, deformation to the normal cone for DM stacks) is missing. CLP24/12 already records it as missing.
5. **(medium) Item 42 overclaims FA.6.** Theorem 4.3 needs function-field Eisenstein series and the kernel decomposition (4.8), from [12, §7.1(4)].
   - FA.6 does not plan these.
   - AutomorphicSpectralTheory, which does, is number-field only.
6. **(medium) Route reasons were not updated after the review.**
   - For source routes, the reason is the text the blueprint job receives.
   - Route 5's reason still states Theorem B.2 without "L entire" (E15), and the s(s−1)Λ trick without "number fields only" (E17).
   - Route 2's reason states Proposition 2.4's printed u ∈ {0, ∞} value (E9).
7. **(medium) Hadamard factorization has no item and no owner.**
   - Proposition B.1 rests on it, through the canonical product and g ≤ ρ ≤ g+1.
   - Route 5 wrongly says AL.2 already needs it. Mathlib has only Jensen's formula.
8. **(medium) Geometric inputs have no item.** Each is load-bearing, and YZ19 itemises its analogues:
   - the Grothendieck–Lefschetz trace formula with η as the trace function of L_n (Proposition 3.2);
   - H¹(X, Z/2) ≅ H¹(Pic^n, Z/2);
   - Abel–Jacobi smoothness in degree ≥ 2g−1, and Nm/Prym;
   - Lang's theorem (Lemma 5.13, Corollary 7.6);
   - H^*(X_n, L_n) = ∧^n H¹, and Künneth;
   - H_c, the trace map and Poincaré duality on DM stacks;
   - Weil II weights in Lemma 7.13;
   - Laumon (3.1).
9. **(low) Analytic inputs planned elsewhere have no item.**
   - W. Zhang's Whittaker period formulas (AL.3, FA.2).
   - Poisson summation.
   - The h_D basis and the ι_Pic-normalised Satake transform.
   - Chebotarev (FA.5).
   - V. Lafforgue's Lemme 8.13.
10. **(low) New source issues.**
    - The misprint "Lemma 7.15(3)" (p. 878; the lemma has two parts).
    - A gap in the proof of Lemma 7.15: "which is impossible" needs strong multiplicity one, or Drinfeld plus Chebotarev.
    - Three typographical slips.
11. **(low) E28's third part is true as printed.** X̂′_d → Pic^d_X is smooth, so it is not a misprint.
12. **(low) sourceVersions is missing.** collation.py therefore treats the paper as read from the preprint, and REQUESTS.md asks for a published collation that was already done.
13. **(low) The report says the libraries have "Nothing".**
    - Tau Ceti has function-field divisors, Riemann–Roch spaces, deg ω = 2g−2, finiteness of effective divisors, and class numbers.
14. **(low) Route 5's "nothing plans positivity of central values" is stale.** GZ.5 now owns L(1/2, π⊗χ) ≥ 0 (RT-AREA-iwasawa-1/16, my fix). It should be linked.
15. **(low) Item slips.**
    - Item 15 puts the balance condition on Hk.
    - Item 19 drops Lemma 6.7's fundamental-cycle hypothesis.
    - Item 27 says f_{N_d} "is not small".
    - Item 35 omits the DM hypothesis.
    - Item 39's locator §6.2 and item 8's page range are wrong.
    - E9's reason has |h₁| for |h₁|^s.

## What holds up

- **Statements.** Every numbered statement of the paper is covered by an item. The main theorems (1.1–1.8) are stated with their hypotheses: p > 2, X′ geometrically connected, r even, π unramified everywhere, and the degree bounds.
- **Statuses.** Items 15, 38, 39, 40 and 43 are correctly planned.
- **Routes.** No route lands in a finished blueprint. The EDC.8 route (4) is consistent with YZ19/120. check_paper.py reports ok.
