# REV-ERRATA-PAPER-BURUNGALE-TIAN-26 — review of the mistakes recorded in Burungale–Tian (2026)

Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The errata job ERRATA-PAPER-BURUNGALE-TIAN-26 and the paper review REV-PAPER-BURUNGALE-TIAN-26 were done by Claude Code, session `cc-fb70e5`. The extraction was done by Codex, session `codex-a71f92`. This reviewer took no part in any of them.

**Source read.**
- **Paper.** A. A. Burungale and Y. Tian, *A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin*, Annals of Mathematics 203 (2026), 1–13, DOI 10.4007/annals.2026.203.1.1.
- **Versions.** arXiv 2506.03465v2, downloaded fresh. Its SHA-256 matches the recorded `cbb8284a…4664`. All seven pages were read as page images. v1 was compared with v2 word by word; the differences are the ones the errata list, and [5] (see E12).
- **Published text.** Not collated. The Annals text is behind a paywall.

**Sources checked against.**
- **Kato.** *p-adic Hodge theory and values of zeta functions of modular forms*, Astérisque 295 (2004), from the open Numdam copy. §8.1–8.4, 12.3–12.5, 14.9–14.16 and all of §15 were read as page images.
- **Johnson-Leung–Kings.** arXiv 0804.2828v2: Theorem 5.2, Corollary 5.3, Theorem 5.7 and §7.
- **Bhargava–Klagsbrun–Lemke Oliver–Shnidman.** arXiv 1709.09790v2: Theorem 2.7, §9.2 and §11.
- **Smith.** arXiv 2207.05674: Assumption 1.1 and Theorem 1.2.

**Existing corrections looked for.**
- The Annals article page links no erratum.
- Crossref registers no update for the DOI.
- v2 is the latest arXiv version.

## Verdicts on the recorded findings

All twelve are confirmed. E12 is corrected in place.

- **E1 (error, a stated result): confirmed.** Kato's z comes from the single modulus p^n f (15.5). Johnson-Leung–Kings pair it with H² over O_K[1/pf], and their Corollary 5.3 and Lemma 7.7 show the Euler factors 1 − χ(l)Frob_l^{−1} for l | f, l ∤ p. Kato (15.6.2) identifies the paper's h² with H² over O_K[1/p]. I checked the failure independently:
  - On the characters trivial on Gal(K(p^∞𝔩)/K(p^∞)), the distribution relation contributes the factor 1 − Frob_𝔩^{−1}.
  - This factor is not a unit even after inverting p.

  The later use is safe, because Kato's Lemma 15.13 works on the ψ-component with f the conductor of ψ.
- **E2 (gap, the proof): confirmed.** Kato §15 claims only Theorems 12.4–12.6, 14.2 and 14.5 (p.250). Proposition 15.17 is an inequality, and Rubin's equality is expressly not used (p.251). I redid the proposed repair.
  - Lemma 14.15, applied to both H²_q and H¹_q/A·z, gives length(H¹/Z) − length(H²) as a sum that an equality of characteristic ideals kills, plus length Ker(a | H¹_q/A·z).
  - That kernel vanishes, because A is a UFD, a is prime and a does not divide z in the rank-one reflexive hull.

  Kato's own proof of 15.17 cites "Lemma 14.12" where Lemma 14.15 is meant. That slip is Kato's, not the paper's.
- **E3 (misprint): confirmed.**
  - Kato's V(f) is the cohomological realization: T_pE ≅ H¹_p(1) (8.4.1), and T = T_pE(−1) (p.274). So the Selmer group of E corresponds to V(f)(1).
  - "⊗K" should be ⊗_{Z_p}K_λ.
- **E4 (misprint): confirmed.** Kato fixes k ≥ 2 (8.1, p.180), and 12.3 inherits it.
- **E5 (gap, nothing): confirmed.** In (14.9.3) the Selmer term is that of T(k/2)*(1), a lattice in V(f*)(k/2) by (14.10.1). The two-step argument closes the gap:
  1. Apply (14.9.3) to the dual lattice, then use Proposition 14.12(3) and (14.9.5). This gives H¹_f(V(f*)(k/2)) = 0.
  2. Apply (14.9.3) to T(k/2).
- **E6 (gap, nothing): confirmed.**
  - At q, Kato's relation z_{ι(γ)} = −σ_{−1}z_γ (Theorem 12.5(1)) kills the component of γ of the wrong sign.
  - V(f)^± is one-dimensional, so the single class z_γ spans.
- **E7 (gap, nothing): confirmed.** BKLOS Theorem 2.7 is about Mordell–Weil rank. The Selmer statement is in §9.2 (even 3-Selmer rank with average at most 1 on T_0(φ)) and §11 (T_0(φ) is everything for the maximal order, then pass along an isogeny).
- **E8 (gap, nothing): confirmed.** Smith's Theorem 1.2 counts all d with |d| ≤ H, of both signs. Deducing Theorem 3.3 needs the three steps listed. I checked that y² = x³ − x has no rational cyclic 4-subgroup: halving its 2-torsion gives x = ±i, 1 ± √2 and −1 ± √2.
- **E9 (misprint): confirmed.** E^{(−1)} ≅ E by x ↦ −x, so the root number is +1 although −1 ≡ 7 mod 8. Non-squarefree n such as n = 4 fail too, and the correction's "positive squarefree" covers both. The PARI run was not repeated. The positive squarefree case is the classical result the footnote cites.
- **E10, E11 (misprints): confirmed** on the page image of p.4.
- **E12 (misprints): confirmed, and corrected in place.**
  - The BKLOS title was checked on Crossref (DOI 10.1215/00127094-2019-0031).
  - The v2 slips "Munster", "Birkheser" and "10049" are as recorded.
  - The entry said v1 prints "Münster" correctly. The v1 page image shows "M´unster", with a stray acute accent. The locator and reason now say this, and the sentence in the errata file that said v1 was right is corrected.

## Findings added by this review (all confirmed, all reaching nothing)

- **E13 (gap).** Footnote 4 says the hypotheses of Kato's Lemma 15.13 hold for (Λ⊗Q)-modules. That covers the invertibility of 2 and #Δ but not the lemma's hypothesis that K ⊄ Q(ζ_{p^∞}).
  - The excluded case is the one the paper applies: p = 2 with K = Q(i) for Theorem 1.2, and p = 3 with K = Q(ζ_3) in Remark 3.6(i).
  - Kato's 15.14 covers it. The proof body cites all of §15, so only the footnote is wrong.
- **E14 (misprint).** Theorem 1.1 ends "(1.1) holds". (1.1) is displayed for every r, and only r = 0 is proved.
- **E15 (misprint).** "ψ : A_K^×/K^× → K^×" should have target C^×. A character of infinity type (−1, 0) is not K^×-valued on C^×.

`python3 scripts/check_errata.py research/blueprint/errata/PAPER-BURUNGALE-TIAN-26.json` reports `ok`.

**Checked and not recorded.**
- **Other checks that passed.**
  - The deduction of Theorem 1.1 from Theorem 3.1, including the Euler factor at p and the passage from f* to f.
  - The sign convention q: σ_c ↦ c^{−k/2}.
  - The Crossref page ranges of the other references.
  - The claim that 50% of positive squarefree n are ≡ 1, 2, 3 mod 8.
- **[23], Tian–Yuan–Zhang.** Crossref gives 721–774, and the paper prints 721–773. The next article starts at 775, so 774 may be blank. Not recorded without the printed page.
- **Remark 2.2.** The claim that the conjecture is open for non-split p was left as the errata job left it.

## Question for the orchestrator

**Collating the published text.** All fifteen findings are located in arXiv v2. If a subscriber copy of the Annals text becomes available, the misprints E3, E9–E12, E14 and E15 should be checked against it, since some may have been corrected in proof.
