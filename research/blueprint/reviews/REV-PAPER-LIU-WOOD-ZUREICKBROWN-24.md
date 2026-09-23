# REV-PAPER-LIU-WOOD-ZUREICKBROWN-24: review of the Liu–Wood–Zureick-Brown extraction

**Verdict: accept, after corrections made in place.** All seven routes are accepted. The random-Γ-groups Part II brief is amended.
- **Items.** Thirty-eight items are corrected; none changes status.
- **Source issues.** E1–E4 are confirmed, E4 with refinements. Twenty-five new issues are added. The most important is E5: the explicit limit formula of Theorems 1.2, 4.12 and 5.15 is false for groups without Property E.
- **Paper.** Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions*, Invent. Math. 237 (2024) 49–116.
- **Extraction.** cc-39fac3, issue #1224.
- **Reviewer.** Claude Code, session cc-442dc5, which took no part in the extraction.

## Sources read

- **The paper.** arXiv 1907.05002v2, whole, from the TeX source and the PDF. Both have the SHA-256 recorded by the extraction. Printed page numbers equal PDF page numbers.
- **The published article.** It is paywalled and Unpaywall lists no open copy, so it was not collated. Crossref records only the Publisher Correction, which restyles references.
- **Method.** Three read-only helper agents of this session split the paper:
  - §§1–4;
  - §§5–7;
  - §§8–12.

  Each recomputed formulas on small cases and wrote a report. The reviewer checked every new finding and every correction at the page image or in the text, and re-ran the PARI check of E7.

## 1. Items

The extraction is careful and complete: no key result on the path to Theorems 1.2 and 1.4 is missing. The corrections fall into four groups.

**Statements that copied an error of the paper:**
- **2, 20, 25.** The explicit formulas now assume that H has Property E at level 𝒞, and give the value 0 otherwise (E5). λ(𝒞, H, G) from (4.10)–(4.11) was only referenced; it is now stated.
- **4, 5.** Theorem 1.4 and Corollary 1.5 are stated with lim sup and lim inf in q, which is what the proof gives (E6).
- **29.** Lemma 9.3 is stated with the normalization of E_Γ made explicit (E7) and with the maximal pro-|Γ|′ quotient (E28).
- **42.** Lemma 12.8 has positive weights (E8). The constant r = k/((d−1)! ∏ a_i [Z^d : Λ]) is added.
- **11, 12, 13.** Corollary 3.8, the Y ↔ sections bijection and Remark 3.2(3) are stated for pro-|Γ|′ groups (E12).
- **19.** The Möbius recursion is corrected (E9).
- **23.** Lemma 5.10 gets the positivity hypothesis its proof needs (E10).
- **32, 41.** c excludes the identity (E17).
- **40.** Proposition 12.7 needs n ≥ 1 (E25).

**Hypotheses and definitions:**
- **Item 17.** 𝒜_H contains the trivial modules Z/p.
- **Item 14.** Every random group has Property E at level 𝒞.
- **Item 19.** H-extensions and 𝓔_𝒞(G, H) are defined.
- **Item 22.**
  - P_{u,n} is defined as the product part of (4.13), without which Corollary 5.9's dichotomy is false.
  - 𝒞_ℓ consists of |Γ|′-groups.
  - Corollary 5.9's hypotheses are stated: ℓ > 1, n ≥ 1, u > −n, and a constant uniform in n and H.
- **Item 23.** g_n ≤ g, not monotone convergence.
- **Item 27.** λ = 1 needs G^Γ = 1.
- **Item 28.** The p-covering group, nucleus and nuclear rank.
- **Item 35.** The Z^{c/G}_{≡q} notation.
- **Items 40–41.** π_{G,c}, d_{G,c} and π_Γ are defined, with O-constants uniform in q and n.
- **Items 3, 6, 9, 16.** The bad integer is Δ, as in the paper; the extraction's "b" clashed with the summation bound of Theorem 1.4.

**Locators.** Items 1, 4 (Theorem 1.4 is on p. 3), 9, 12, 16, 22, 26, 27, 29, 32, 35, 36, 38, 39, 40, 41, 42 and 43.

**Notes:**
- **Item 4.** The hypotheses force |H| odd. The proof replaces K^{un,∞} by K^#.
- **Item 10.** Schur–Zassenhaus conjugacy is used from Lemma 3.4 onward, so all of Part I depends on it, not just Lemma 9.3. Mathlib has conjugacy only in the abelian case (`Subgroup.exists_smul_eq`).
- **Item 33.** Cross-reference to PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/66 and /68.
- **Item 36.** Lemma 12.10 needs only coprimality.
- **Item 38.** The F̄_q half of Corollary 12.6 uses Wood 2021, Remark 5.4.
- **Item 41.** An example shows that gcd(q − 1, |H|) = 1 is needed. For Γ = Z/2 and H = F_3² with inversion, generating 6-tuples of involutions with product 1 form 3 braid orbits, so the count triples when q ≡ 1 mod 3.

## 2. Statuses

- **Item 45** (library) stays library. `Measure.haar` has an arbitrary normalization. The Haar probability measure on the compact group 𝓕_n is `haarMeasure ⊤`, normalized by `haarMeasure_self`. The review adds:
  - `tendsto_tsum_of_dominated_convergence` (Tannery), the exact tool for Lemma 5.10;
  - `MeasureTheory.tendsto_of_forall_isOpen_le_liminf` (Portmanteau), the criterion of §5.3.

  All names were checked in the pinned Mathlib. Item 15's note is corrected the same way.
- **Items 43–44** (planned). The stage ids exist. Item 43 now attributes NSW Corollary 3.9.3 to the generation of R/R*, not to the rank formulas, and its locator is corrected.

## 3. Routes

Every missing item is routed exactly once (3 + 9 + 1 + 3 + 1 + 2 + 23 = 42). All seven routes are accepted.

The ArithmeticStatisticsPartIIRandomGammaGroups brief is amended in five places:
- (5.13) and Theorem 5.15 need Property E, with value 0 otherwise;
- Lemma 5.10 needs the positivity hypothesis;
- Corollary 3.8 is for pro-|Γ|′ groups;
- the Schur–Zassenhaus consumers go back to Lemma 3.4;
- a new acceptance test: Γ = Z/2, p = 3, H = F_3² at level 3-class ≤ 2 must get measure 0. The printed formula gives 2.70·10^{−3}.

## 4. Mistakes in the paper

**E1–E4 confirmed.**
- **E1–E3** at the page images of pp. 25, 41 and 34.
- **E4**, refined in place:
  - for u < 0, Lemma 5.10 and the proof are read for n > −u;
  - Lemma 6.1 is dropped from the locator, since it does not use Theorem 5.12;
  - "free rank-one abelianization" becomes "Z′-rank ≥ 1".

  A numerical check (Γ = Z/2, level F_3^−, u = −2, …, 2) gives total mass 1 and moments [A : A^Γ]^{−u}.

**E5 (error, affects a stated result): the limit formula needs Property E.**
- **The mistake.** The proof of Theorem 4.12 claims (4.17), λ(𝒞, H, G) = lim_n h^m |Y(G)|^{−n} for G ∈ 𝒜_H. For G = Z/p with trivial action, |Y(G)| = 1. Admissibility forces every sub-H-extension to be everything, so Corollary 4.8 gives h^m = 1 + λ with m constant in n.
- **Consequences.** The finite-n formula (4.13) contains the factor 1 − 1/1 = 0 and correctly gives probability 0. It must: by Proposition 3.13 every random group has Property E, and λ ≠ 0 at such a G exactly when H lacks it. The limit (4.14) instead contributes ∏(1 − λh^{−i}), which is never 0.
- **Example.** Γ = Z/2, p = 3, H = F_3² with σ = −1, at level 3-class ≤ 2. Here λ(trivial) = 2 (the Heisenberg group) and λ(sign) = 1, and the formula gives 2.70·10^{−3} at u = 0.
  - Two helpers independently enumerated the random quotients, exhaustively at n = 2 and by Monte Carlo at n = 3, 4. F_3² never occurs, while the other frequencies match (4.13).
  - For F_3⁴ the formula is negative.
  - At level "all 3-groups", Theorem 7.4 of the paper gives 0 for the same H, contradicting Theorem 5.15, which it cites.
- **The fix.** Assume Property E at level 𝒞, with measure 0 otherwise. The moments, Theorems 5.12, 6.2 and 7.4–7.5, and §7.1 are unaffected.

**E6 (gap, affects a stated result).** Theorem 1.4 writes lim_{b} lim_{q}.
- The proof shows only that every limit point in q lies within O_G(1/b) of the answer.
- The numbers of Frobenius-fixed components depend on q. Nothing shows they stabilize on residue classes: components with small inertia multiplicities are only counted, not classified.
- Read with lim sup and lim inf. The numerator of the second display on p. 41 should have E_1 − E_2.

**E7 (error, affects a stated result).** E_Γ(D, Q) is defined as isomorphism classes of Γ-extensions, but N(H, Γ, D, Q) and #Hur(F_q) count surjections.
- So Lemma 9.3 and the p. 40 display are off by [Γ : Z(Γ)].
- Check: x³ − 4x + 1 (discriminant 229) gives the only totally real S_3-field with radical discriminant 229, so |E_{S_3}(229, Q)| = 1 but N(1, S_3, 229, Q) = 6.
- The factor cancels in every moment ratio.

**E8 (error, affects a stated result).** Lemma 12.8 allows weights a_i = 0, and then the count is infinite. The application uses positive weights.

**Proof gaps, all repaired:**
- **E10.** Lemma 5.10's dominated-convergence chain needs f_n > 0 at each large n, not just for some n. Positivity is monotone in both applications.
- **E11.** The function-field case of Lemma 3.17 asserts O_K^× = F_{q^r}^×. This is false for totally real K: K = F_5(t)(√(t²+2)) has the unit t + √(t²+2). The complete curve repairs the proof.
- **E12.** Corollary 3.8 ("for any Γ-group G"), the Y ↔ sections paragraph and Remark 3.2(3) need pro-|Γ|′. Counterexample: Z/4 with inversion.
- **E13.** Proposition 3.13's proof applies a finite-group lemma to an infinite kernel. Lemma 3.4 fixes it in one line.
- **E25.** Proposition 12.7 fails at n = 0 (V_4).

**Misprints (E9, E14–E24, E26–E29).** The Möbius recursion lacks D ⊊ D′ (E9); the others:
- E14: lim for liminf on p. 30;
- E15: S̄^i := H_2(G_i, Z)/Q_{c_i} on p. 54;
- E16: N(H, Γ, n, ·) on p. 46;
- E17: c contains 1 on p. 39;
- E18: 𝒞_ℓ without |Γ|′;
- E19: "irred. E-group";
- E20: γ_d^{−1}(g);
- E21: α ∘ ϖ;
- E22: 𝓕_n for 𝓕_{n+u};
- E23: Pic without profinite completion;
- E24: "p-multiplicator rank";
- E26: d_G and π_G for d_{G,c} and π_{G,c};
- E27: the open subgroups in Lemma 2.7;
- E28: the Γ-action in Lemma 9.3;
- E29: the Frobenius identity in Lemma 11.8.

**Where corrections were sought.** For every issue:
- the arXiv versions;
- the Publisher Correction;
- Crossref;
- Unpaywall.

None was found, so all are recorded as new.

## 5. Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LIU-WOOD-ZUREICKBROWN-24.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four changed files: ok.
- Every missing item is routed exactly once (42).
- No file of this paper contained the reviewer's session id before the review.
