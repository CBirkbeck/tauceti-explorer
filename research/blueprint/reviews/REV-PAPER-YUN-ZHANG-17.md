# REV-PAPER-YUN-ZHANG-17: review of the Yun–Zhang extraction

**Verdict: accept, after corrections made in place.**
- **Routes.** All five are accepted. The Part II brief is amended.
- **Items.** Thirty-two items are corrected. No status changes, but item 43 gains two planned stages.
- **An extraction error.** The |ω_X| factor of the main theorems was inverted.
- **Source issues.** E1–E7 are confirmed; E8 is rejected. Twenty-nine new issues are added. The main one is E9: Theorem 1.8's constant should be 2^{r+1}, not 2^{r+2}. Appendix B also has three false statements (E15–E17).
- **Paper.** Yun–Zhang, *Shtukas and the Taylor expansion of L-functions*, Ann. of Math. 186 (2017) 767–911.
- **Extraction.** cc-fb70e5, issue #1163.
- **Reviewer.** Claude Code, session cc-442dc5, which took no part in the extraction.

## Sources read

- **The published version.** The whole author's copy, 145 pp., with the same SHA-256 as the extraction. Journal page = PDF page + 766.
- **arXiv v3.** Same SHA-256 as the extraction. It is dated 11 April 2017, not 24 January 2017 as the extraction said; 23 January 2017 is the journal's revision date.
- **Errata.** None found. Crossref has no correction relation, the Annals page lists no erratum, and Yun–Zhang II (Ann. of Math. 189, 2019) contains no errata for this paper.
- **Method.** Three read-only helper agents of this session split the paper:
  - §§1–4;
  - §§5–7;
  - §§8–9 and Appendices A–B.

  They re-derived the explicit orbital integrals and the §§5–6 dimension counts, checked Lemma 6.15 by exact point counts over F_2, F_3 and F_5, and tested Appendix B numerically. The reviewer checked every finding at the page image or in the text, and re-derived the u = ∞ orbital integrals and the Appendix B counterexamples.

## 1. Items

**The |ω_X| factor.** Theorems 1.2 and 1.6 (pp. 772, 774) read (1/(2(log q)^r))·|ω_X|·ℒ^{(r)}(π_{F′}, 1/2), and (9.3) reads |ω_X|/(2(log q)^r). Proposition 4.5 and Theorem 4.7 read ½|ω_X|ℒ(π_{F′}, s + ½)λ_π(f).
- The extraction divided by |ω_X| in items 1, 2 and 14, in the summary, in the route texts and in the .md. Since |ω_X| = q^{2−2g}, that is off by a factor q^{4g−4}.
- All of these are corrected. The Proposition 4.5 constant was re-derived: the powers of |ω_X| sum to −1 + ½ + 3/2 = +1.

**The other corrections:**
- **Items 5, 9.** The Kronecker limit formula and Proposition 2.4 at u = ∞, as corrected by E9.
- **Items 1, 2.** Hypotheses, the measure normalizations vol(K) = vol(T(O)) = 1, and item 2's locator.
- **Item 3.** E_m are finite extensions of Q_ℓ, not finite fields.
- **Item 8.** Lemma 2.2 concerns the sum (2.7).
- **Item 10.** N_d classifies (K_1, K_2, K′_1, K′_2, φ), modulo Pic_X; A_d excludes Z_d; the open embedding is ȷ_d.
- **Item 11.** Proposition 3.2(3), with d ≥ 4g − 3.
- **Item 16.** The homomorphism H′ for Sht′.
- **Item 17.** θ^μ is proper. §1.3 calls it finite, but only properness is proved or used.
- **Item 18.** M_d classifies (L, L′, α, β), not "a rank two bundle with a line subbundle". Lemma 6.3 is a Cartesian square. Lemma 6.4 needs d ≥ 2g′ − 1.
- **Item 19.** Lemma 6.7 is the identity f_{M,!}cl(ζ♥) = (f_{M,!}[H♦])^r, not merely independence. I_r(u, h_D) is defined.
- **Item 20.** Lemma 6.14 uses Lemma 5.9, which is proved in §6.4.4. It does not prove it.
- **Item 23.** H_ℓ is the image in End(V) × Q_ℓ[Pic_X(k)]^{ι_Pic} (Definition 7.12).
- **Item 24.** V₀ and V′₀ are finite-dimensional.
- **Items 25, 26, 28.** r even, and the degree hypotheses.
- **Item 27.** Proposition 8.5 is proved by stalk bounds and Verdier duality, not smallness; the paper says f_{N_d} is not small.
- **Item 29.** Z′^r_{0,ℓ}.
- **Items 32, 33.** Deligne–Mumford hypotheses.
- **Item 35.** Varshavsky's Prop. 1.2.5.
- **Items 36, 37.** Now in their corrected scope (E15–E18).
- **Item 43.** Adds L(η, s).
- **Locators.** Items 2, 16, 17, 19, 20, 22, 23, 24, 25, 27, 38 and 42.

## 2. Statuses

Unchanged. Every planned stage id exists in data/atlas.json.

**Item 43** covers, among other things, the Riemann hypothesis for cuspidal L-functions over function fields, which Theorem B.2 uses. That rests on L. Lafforgue's correspondence and Deligne's weights, which AL.2 and FA.5 do not plan. So GlobalShtukasAndFunctionFieldLanglands GS.6 and DeligneWeightsAndPurity DWP.7 are added to its planned list.

## 3. Routes

Every missing item is routed exactly once (22 + 6 + 5 + 1 + 2 = 36). All five routes are accepted.

The Part II keeps the id, parent, title and area of PAPER-FENG-YUN-ZHANG-24 and PAPER-YUN-ZHANG-19. Its brief now:
- expects 2^{r+1} in the Kronecker test;
- imports the Riemann hypothesis from GS.6 and DWP.7;
- applies Theorem B.2 to L(π, s) and L(π⊗η, s) separately in the Theorem 1.7 test;
- states Theorem B.2 for entire L(π, s), Proposition B.1's second part for non-polynomial φ, and Remark B.5 over number fields only.

## 4. Mistakes in the paper

**E1–E7 are confirmed at the page images.**
- **E2.** "Affects" changes from "the proof" to "nothing": the proof uses only that the even coefficients are positive. The printed coefficient is off by (2j)!/j!, not a constant factor.
- **E4.** The earlier sentence is four lines up, and it contains its own misprint (E23).
- **E8 is rejected.** "by Pólya [4]" is an ordinary citation form, and the claim is true unconditionally.

**E9 (error, affects a stated result): the Kronecker limit formula.**
- **What is printed.** Proposition 2.4 gives J(u, 1_K, s) = L(η, 2s) + L(η, −2s) for u ∈ {0, ∞}, with u = ∞ "analogous".
- **Why u = ∞ is not analogous.** On the u = ∞ orbits, integrality forces xy ∈ O^×, so |xy|^s = 1 on the support.
  - The orbits of [[0,1],[1,1]] and [[1,1],[1,0]] each give Σ_{E≥0}η(E) = L(η, 0).
  - The orbit of w gives 0.
  - Equivalently, γ ↦ γw swaps u = 0 and u = ∞ but turns the weight |h₁h₂|^s into |h₁||h₂|^{−s}.
- **Consequences.**
  - J(∞, 1_K, s) = 2L(η, 0), a constant.
  - Corollary 2.5 should give 2^{r+1}L^{(r)}(η, 0) for r > 0 even.
  - Theorem 1.8, which is (log q)^{−r}J_r(1_K) by Theorem 9.2 (§9.1.1), should read (2^{r+1}/(log q)^r)L^{(r)}(η, 0).
- **Check.** y² = (x² − 2)(x⁴ + x + 1) over F_5 gives J_2(1_K)/(log q)² = 184, against 368 from the printed formula.
- **Unaffected.** The r = 0 value 4L(η, 0) + q − 2 and Theorems 1.1–1.7. Proposition 3.2(3) at u = ∞, used by Theorem 8.1, is also correct.

**E15–E17 (errors in Appendix B, affecting stated results).**
- **E15.** Theorem B.2 fails for n = 1 over a function field. π = (−1)^{deg} is nontrivial, cuspidal and self-dual, but L(π, s) = Z_X(−q^{−s}) has poles. Over P¹, Λ″(π, 1/2) = −2(log q)²/(2 + q^{1/2} + q^{−1/2})² < 0.
- **E16.** The second part of Proposition B.1 fails for φ = 1 + s². The hypothesis should be "not a polynomial".
- **E17.** Remark B.5's s(s−1)Λ is not super-positive over F_q(t): the second derivative is −0.160 for q = 3.

Theorem 1.7 uses only GL₂ cuspidal L-functions, so it is unaffected. Its proof does need two one-line repairs (E12).

**Degree hypotheses (E11, E29).**
- E11: Corollary 3.3 fails at D = 0, u = 0: the right side is 1, the left side 2L(η, 0).
- E29: Lemma 6.4 fails at d = 0.

Both are used only in large degree.

**Other findings:**
- **Proof gaps and failed steps.**
  - E19: the last step of Theorem 9.2 treats a span as an algebra.
  - E31: "vector bundle" should be an open part of one.
  - E32: a rank-two K is called a line bundle.
  - E34: H^{4r}_c(Sht_G) ≅ Q_ℓ(−2r) is false; the pairing needs the trace map.
- **Misprints.**
  - E10: the derivative in the definition of ℒ^{(r)} is at s = 0 instead of 1/2.
  - E13, E14: slips in §2 and typos.
  - E18: the order formula.
  - E20–E22: §§8–9.
  - E23: published version only.
  - E24, E25: Appendix A.
  - E26: [24] for [23].
  - E27: the sign of the Lang map.
  - E28, E30: §§5–6 slips.
  - E33: codimension i for 2i.
  - E35–E37: §7.

Every new issue except E23 is also in arXiv v3.

**Where corrections were sought.** For every new issue, Crossref, the Annals article page, the arXiv versions and Yun–Zhang II. None was found, so all are recorded as new.

## 5. Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-YUN-ZHANG-17.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four changed files: ok.
- Every missing item is routed exactly once (36).
- The paper's files did not contain the reviewer's session id before the review.
