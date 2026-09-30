# Red team: PAPER-GHOSH-SARNAK-22 (Ghosh–Sarnak, *Integral points on Markoff type cubic surfaces*)

Job `RT-PAPER-GHOSH-SARNAK-22` (issue #4160), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-GHOSH-SARNAK-22.result.json`, in the format of PROTOCOL section 17.

**Result:** 9 findings: 3 medium and 6 low.

- **The extraction.** It is careful: 63 items, 5 routes and 20 source issues.
  - The six library citations hold at the pins.
  - The Hasse-failure counts and the first failures reproduce.
  - E15 and the review's corrected item 57 reproduce from exact counts.
  - The other source issues stand.
- **What breaks.**
  - Item 5 copies a false inequality from the paper, and no source issue records it.
  - The four source routes have not reached any blueprint job, and CA.4 was closed without them.
  - A restructuring accepted after the review has made route 1's CA.1 stage stale.

## Independence

- **Who did the work.**
  - The extraction is by Claude Code `cc-fb70e5` (issue #1272, PR #1897, 22 September).
  - The review, REV-PAPER-GHOSH-SARNAK-22, is by Claude Code `cc-442dc5` (PR #2245, 23 September).
  - These are the only session ids in the result, the report, the review JSON and the review report. `cc-f805bf` appears in none of them.
  - There is no errata file for this paper.
- **Disclosure.**
  - This session red-teamed Gamburd–Magee–Ronan 19 (PR #4787), Chen 24 (PR #4821) and Koymans–Pagano (PR #4705). Those red teams included findings on the CA.4 Markoff nodes, and on routes that had not reached live blueprint issues.
  - Finding 2 has the same queue-level cause as RT-PAPER-CHEN-24/5 and RT-PAPER-GAMBURD-MAGEE-RONAN-19/7. It adds only this paper's evidence and should be fixed with them, not a second time.
  - Finding 7 is the counterpart, from this paper's side, of GMR-19/7.
  - Finding 4 concerns Chen-24/78, which the Chen red team did not raise.

## What was read

- **arXiv 1706.06712v3** (30 May 2022), read in full.
  - Its hash `e4ddc7a1…` reproduces the extraction's.
  - Pages were rendered where the text layer was garbled, for example the parameters of §9.
- **arXiv v1** (21 June 2017) **and v2** (27 September 2017), compared at the statements the findings use.
- **The version of record**, Invent. Math. 229 (2022) 689–749.
  - Only the abstract and dates were readable. Springer serves a client challenge instead of the PDF, and Crossref and Unpaywall list no open copy and no correction.
  - Every finding is therefore scoped to v3.
- **Loughran–Mitankin**, arXiv 1807.10223v3, pp. 1–4: Theorems 1.1–1.5 and their remark on Ghosh–Sarnak's Theorem 1.2(i).
- **The repository.**
  - Every item, route and source issue, and both reports.
  - The owner stages CA.1, CA.4, ES.3, ES.4, GN.4, AN.5 and FF.1–FF.5, and BelyiMaps Layer 4.
  - The CA, ES, GN and AN.0 packets, and RS-03 and RS-07.
  - The queue, `make_queue.py`, and the live issues #1025, #1040, #1030, #1021, #1022, #3367 and #1700.
  - The overlapping extractions: Gamburd–Magee–Ronan 19, Chen 24, Martin 25 and Koymans–Pagano.
- **The libraries.** Mathlib `082e2d3` and Tau Ceti `f790474`.
  - Every cited declaration was opened.
  - The index was searched for every missing topic: Markoff, Vieta, Landau–Ramanujan, Selberg–Delange, Wirsing, the δ-method, local densities, Brauer–Manin, Fricke and lattice points. Nothing relevant exists.

## What holds up

- **The library items.**
  - `hensels_lemma` (Hensel.lean:461) has the strong hypothesis ‖F(a)‖ < ‖F′(a)‖² that E2's repair needs.
  - `gaussSum_sq`, quadratic reciprocity with the laws for 2 and −2, and `Nat.eq_sq_add_sq_iff` state what the items say.
- **Counts.** An exact enumeration up to 100,800 gives:
  - A_HF(100,800) = 7,630, as in Table 4;
  - the first positive failures 46, 56, 86 and 124;
  - Hasse failures at 342, 1,456, 16,432 and 33,624, which confirms E8.
  - The negative side was checked by hand: −2 = M(3,3,4), and −4 is a failure.
- **Local densities.** Exact counts modulo 3⁶, 7⁴ and 5⁴ give δ₃(9) = 2/9, δ₃(18) = 4/9, δ₃(81) = 10/27, δ₇(49) = δ₇(98) = 34/49, δ₇(147) = 36/49 and δ₅(25) = 46/25. So E15, as extended by the review, and item 57's corrected χ(−k/p^μ) term are right.
- **Re-derivations by hand.**
  - Δ's congruence and sign rules in (3.1).
  - The Δ values in Proposition 4.1 and its small components.
  - Lemma 2.2's box U(k).
  - The sector area C = ¼ log(3/2).
  - The admissible density 7/12.
  - The local conditions of Proposition 8.1.
  - The completed sums of §9.1.
  - E2, E3, E9 and E20.
- **Routing.**
  - Each of the 57 missing items is routed exactly once, and `check_paper.py` reports ok.
  - The owners are right in substance. CA.4 takes the elementary level-k theory, ES.3/ES.4 the variance argument and densities, GN.4 the lattice-point counts, and AN.5 the Landau-type counts.
  - No other layer plans Landau–Ramanujan, Selberg–Delange, the δ-method or Blomer–Granville.
  - Route 5 reached the merged design issue #3367.

## Findings

### Medium

1. **Item 5 reproduces a false inequality** (§1(d), p. 5, in all three versions).
   - **What the paper says.** "for generic k, h±_M(k) = h_M(k) while otherwise h_M(k) ≤ h±_M(k)."
   - **Small counterexamples.** F⁺_k(ℤ) is empty for k < 54, since 54 is the least value of the form. So h⁺(5) = 0, while (0, 1, 2) ∈ V₅(ℤ).
   - **Scale.** Up to 100,800 there are 7,105 exceptional k ≥ 5 with F⁺_k(ℤ) = ∅.
   - **The general argument.**
     - For k ≥ 5, the upward Vieta tree from an F⁺-root keeps every |x_j| ≥ 3.
     - So the brackets in (4.1) stay positive, and the tree is the whole orbit.
     - An exceptional point's orbit therefore contains no F⁺-root, and h_M(k) ≥ h^±_M(k) + 1.
   - **Fix.** Correct item 5 and add a source issue that affects nothing, since only h^± is summed in (1.6).
2. **The four source routes have reached no blueprint job** (routes 1–4, 52 items).
   - **The issues.** #1025, #1040, #1030 and #1021 do not name the paper. #1025 still lists only the two papers accepted on 22 September.
   - **CA.4 was closed without it.** The ClassicalArithmeticCompletion second pass (24 September) marked CA.4 `source_decomposed` without this paper. None of the level-k theory is planned: V_k, Γ, the descent, Δ, Theorem 1.1, Proposition 6.1 or §8.
   - **Route 5 imports what nobody builds.** Its brief, which did reach #3367, imports "the fundamental sets of Ghosh–Sarnak Theorem 1.1" from CA.4.
   - **Fix.** Refresh the issues, reopen CA.4 coverage, and record route 5's new job id, together with the fixes of Chen-24/5 and GMR-19/7.
3. **Route 1's CA.1 stage is stale.**
   - **What changed.** RS-03 narrows CA.1 to higher reciprocity and gives Gauss and Jacobi sums to FiniteFieldsAndCharacterSums FF.1.
   - **When.** RS-03 was accepted at 14:30 on 23 September, about 80 minutes after this review, whose report says "no restructuring touches the other stages".
   - **Effect.** Lemma 6.4's Gauss-sum count (item 25) and the Gauss-sum evaluations of Appendix B are routed on the premise that "CA.1 supplies the Gauss sums".
   - **Fix.** Route item 25 to CA.4 with FF.1 and `gaussSum_sq` as imports.

### Low

4. **Item 23 overclaims "planned"** (a change made at review).
   - **The gap.** BelyiMaps Layer 4 plans the Fricke identity only for SL(2,ℝ). A Tau Ceti roadmap cannot be asked to restate it over rings (section 15).
   - **Planned twice.** Chen-24/78, accepted after this review, plans the version over any ring in NonabelianLevelStructures. Neither record cites the other.
   - **Not essential here.** Corollary 6.3 checks directly (720 cases), and §6.1 gives a Hensel proof.
5. **E11's version history is wrong.**
   - **The exponent changed.** v1 and v2 state √K(log K)^{−1/4}. Loughran–Mitankin (IMRN 2021, pp. 2–3) showed that the method gives only the exponent −1/2, and v3 has it.
   - **What is wrong in the record.** E11's "persist in all of them" is false for E11.
   - **A related slip in the paper.** Remark 1.3(a)'s "order of magnitude √K" for the Brauer–Manin-explained failures is off by a factor (log K)^{1/2}; LM20's Theorem 1.4 gives √K(log K)^{−1/2}.
6. **No `sourceVersions`.** Four findings quote stated results (E1, E11, E15, E18), so the field is required.
7. **Items 3, 4 and 10 do not cite their near neighbours in CA.4.**
   - **Item 10.** Its k = 0 orbit statement is CA.4/markoff-root-generation after the rescaling x = 3y. Only (3.2) is new.
   - **Items 3–4.** They are the case n = 3, a = 1 of GMR-19/1, which is routed to the same layer.
8. **Unrecorded slips.**
   - §10 says "arguments in Sec. 7"; it should be Sec. 8 (v1 had "Sec. 6").
   - §10 says admissibility is "see Sec. 3"; it is defined in §4.1 and proved in Proposition 6.1.
   - Proposition 8.1(ii) lists ν ≡ 0, ±3 (mod 9), but these classes are vacuous because 3 ∤ ν. The first case is ν = 23, giving k = 1062, a verified Hasse failure.
9. **Stale counts in the report.** They read 1 planned, 58 missing and E1–E19, and say the Markoff design is "pending". The file has 2 planned, 57 missing and E1–E20, and the design was superseded on 28 September.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-GHOSH-SARNAK-22.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on both files: 2 file(s), 0 problem(s).
