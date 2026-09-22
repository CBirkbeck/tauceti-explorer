# PAPER-CASTELLA-ETAL-22: On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes

Francesc Castella, Giada Grossi, Jaehoon Lee and Christopher Skinner, *On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes*, [Inventiones mathematicae 227 (2022), 517–580](https://doi.org/10.1007/s00222-021-01072-y); arXiv [2008.02571](https://arxiv.org/abs/2008.02571).

Extraction by Claude Code, session `cc-39fac3`, 22 September 2026 (issue #1286). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-CASTELLA-ETAL-22.result.json](PAPER-CASTELLA-ETAL-22.result.json). It has:
- 39 items: 1 library, 9 planned, 29 missing;
- 9 routes: 7 source routes and 2 coalesced Part IIs;
- 10 prerequisite entries;
- 13 recorded source issues.

## Sources read

- **arXiv v2**, the authors' final version ("Final version, to appear in Invent. Math.", 14 September 2021), was read in full through its TeX source and PDF.
  - The journal PDF is not open access.
  - Numbers and pages are those of the arXiv PDF.
- **A background agent** read §3 (the Kolyvagin-system argument) line by line, with computer checks of its algebra.
  - I verified every §3 finding recorded here against the TeX: the E_α constant, the (ψ⁺, ψ⁻) counterexample, the arithmetic of (3.15) and the index range of (b).
- **Errata:** Crossref records no correction.

## What the paper proves

**Setting.** E/Q has conductor N, and p > 2 is an **Eisenstein prime**: a prime of good reduction at which E has a rational p-isogeny, so E[p]^ss = F_p(φ) ⊕ F_p(ψ) with φψ = ω. K is imaginary quadratic with:
- (Heeg): every ℓ | N splits in K;
- (spl): p = v v̄ splits in K;
- (disc): D_K is odd and D_K ≠ −3.

**Main results.**
- **Theorem C (= 4.2.2), the BDP-form main conjecture.** If also (Sel) holds (Sel_{p^∞}(E/K) has Z_p-corank one) and φ|_{G_p} ≠ 1, ω, then char_Λ(𝔛_E)Λ^ur = (L_E), where L_E is the Bertolini–Darmon–Prasanna p-adic L-function.
- **Corollary D (= 4.2.3).** Perrin-Riou's Heegner-point main conjecture, char(𝒳_tors) = char(𝒮/ℋ)².
- **Theorem E (= 5.2.1).** A p-converse to Gross–Zagier–Kolyvagin in ranks 0 and 1: corank Sel_{p^∞}(E/Q) = r implies ord_{s=1}L(E, s) = r.
- **Corollary 5.2.3.** Positive proportions of rank-0 and rank-1 quadratic twists for curves with a rational 3-isogeny.
- **Theorem F (= 5.3.1).** The p-part of the BSD formula in analytic rank one, under a parity/ramification condition on φ.

**The proof.**
- **§1, algebraic side.** Using Rubin's main conjecture for K and Hida's μ = 0, 𝔛_E is torsion with μ = 0, and λ(𝔛_E) = λ(𝔛_φ) + λ(𝔛_ψ) plus local Euler-factor corrections (Theorem 1.5.1). This is an anticyclotomic Greenberg–Vatsal comparison.
- **§2, analytic side.** Kriz's congruence L_E ≡ (𝓔^ι)²L_φ² mod p gives the same invariants for L_E (Theorems 2.2.1–2.2.3).
- **§3.** A Kolyvagin-system argument for the twists T_pE ⊗ R(α) by anticyclotomic characters. It follows Howard and Nekovář and uses error constants C_1, C_2, C_α in place of big-image hypotheses. It bounds Selmer lengths (Theorem 3.2.1) and yields a Λ-adic divisibility away from γ − 1 (Theorem 3.4.1), and everywhere under (Sel) (Corollary 3.4.2).
- **§4.** Applied to Howard's Heegner Kolyvagin system (Theorems 4.1.1–4.1.2), this gives one divisibility. The Burungale–Castella–Kim equivalence transfers it to the BDP form (Proposition 4.2.1). Equal μ and λ then force equality.
- **§5.** Theorems E and F follow by choosing an auxiliary K, using:
  - the anticyclotomic control theorem;
  - the complex and p-adic Gross–Zagier formulas;
  - Greenberg–Vatsal's rank-zero result for E^K.

## What the atlas already has

**Library (1 item).** Weierstrass factorization in Mathlib (PowerSeries.exists_isWeierstrassFactorization, Polynomial.IsDistinguishedAt).

**Planned (9 items).**
- Characteristic ideals and λ, μ: PadicMeasuresIwasawaAlgebras L4.
- Selmer groups and Sha: the Tau Ceti roadmap Elliptic curves, Layer 7.
- The two anticyclotomic main conjectures as statements: HeegnerPointEulerSystems HE.8b; ModularIwasawaMainConjectures L6.
- The BDP p-adic L-function and the p-adic Gross–Zagier formula: GrossZagierAndArithmeticHeights GZ.9.
- Gross–Zagier: GZ.8.
- Katz's p-adic L-function: AutomorphicPadicLFunctions L3.
- Selmer structures and Kolyvagin systems: SelmerIwasawaCohomology L2, EulerSystemsAndKolyvaginSystems ES.1, HE.5.
- Heegner points and stabilised Λ-adic classes: HE.1, HE.8.
- Twist non-vanishing, Gross–Zagier–Kolyvagin and Cornut–Vatsal: RankZeroOneBSD BSD.2–BSD.4, HE.7, HE.8c.

**Already aimed at this paper's results.** RankZeroOneBSD BSD.7a owns "the additional CGS/Keller–Yin Eisenstein main-conjecture proofs": the residual-character comparison, μ = 0 and local corrections, and both divisibilities. BSD.7 owns the Eisenstein-prime BSD branches, beginning with the later Castella–Grossi–Skinner Theorem D, which builds on this paper.

## Routes

1. **Source → RankZeroOneBSD: BSD.7a, BSD.7** (11 items).
   - **BSD.7a:** the character Iwasawa modules and Euler factors, the Greenberg Selmer groups, Theorems 1.2.2–1.5.1, Kriz's congruence, Theorems 2.2.2–2.2.3, Theorem C and Corollary D.
   - **BSD.7:** the control theorem with E(K)[p] = 0, Greenberg–Vatsal's rank-zero p-part, and Theorem F.
   - **Why:** this paper is the anticyclotomic prototype of the method BSD.7a plans, and Theorem F is an Eisenstein BSD branch.
2. **Source → HeegnerPointEulerSystems: HE.8, HE.8b** (3 items).
   - The Heegner Kolyvagin system and divisibility with Howard's p ∤ h_K and surjectivity hypotheses replaced by E(K)[p] = 0 (Theorems 4.1.1–4.1.2).
   - The Burungale–Castella–Kim equivalence used rationally without residual irreducibility (Proposition 4.2.1).
3. **Source → EulerSystemsAndKolyvaginSystems: ES.4, ES.8** (7 items).
   - **ES.4 (error-tolerant bounds):** all of §3's machinery, namely the twists and error constants, the structure of Selmer groups, the Čebotarev argument with errors, rank one, the module algebra, and Theorem 3.2.1.
   - **ES.8 (Iwasawa variation):** Theorem 3.4.1 and Corollary 3.4.2.
4. **Source → SelmerIwasawaCohomology: L3** (1 item). Local Iwasawa cohomology of M_θ and M_E.
5. **Source → PadicMeasuresIwasawaAlgebras: L4** (1 item). The freeness criterion over Λ.
6. **Source → AutomorphicPadicLFunctions: L3h** (1 item). Hida's μ = 0 for anticyclotomic Katz L-functions, beside Hsieh's μ theorem, which follows Hida's method.
7. **Source → ArithmeticStatistics: ST.5** (1 item). BKLOS's 3-isogeny Selmer distribution. The review of PAPER-BURUNGALE-TIAN-26 placed it here.
8. **Part II (coalesced) → CMAllPrimeMainConjectures**, "Main conjectures for modular forms and their families, Part II: all-prime CM zeta-element main conjectures" (1 item; area `iwasawa`).
   - **Contents:** Rubin's main conjecture for K in its Katz-L-function, anticyclotomic character form, and the functional equation λ(L_ψ) = λ(L_φ).
   - **Why here:** the atlas records the elliptic-unit route as unresolved (HE.7s), and the review of PAPER-BURUNGALE-TIAN-26 made this candidate the single owner of the imaginary-quadratic main conjecture.
9. **Part II (coalesced) → RankOneConverse**, "Rank-zero and rank-one Birch–Swinnerton-Dyer theory, Part II: the p-converse to Gross–Zagier–Kolyvagin" (3 items; area `iwasawa`).
   - **Contents:** Monsky's p-parity, Theorem E with its mod-p form, and Corollary 5.2.3.
   - **Why here:** the maintainer routed Skinner's p-converse to this Part II (DESIGN-SKINNER, #951). BSD.7 explicitly leaves converses aside. The review of PAPER-BURUNGALE-TIAN-26 asked for one owner of the p-converse property.

## Source issues (`sourceIssues` E1–E13)

**Stated results.**
- **E2 (gap, Corollary 5.2.3).** The corollary is stated for every E/Q with a rational 3-isogeny.
  - **Problem:** its proof uses Theorem E at p = 3, which needs good reduction at 3. For y² + xy + 3y = x³ (conductor 30, rational 3-torsion, type I_3 at 3), v_3(j) < 0, so no quadratic twist is good at 3.
  - **Status:** the argument proves the corollary only for curves that have a twist with good reduction at 3.
- **E1 (error, Examples §0.3).** The p = 7 example y² + xy + y = x³ − x² − 19353x + 958713 has conductor 574 = 2·7·41 and multiplicative reduction I_7 at 7 (PARI), so neither it nor any twist is admissible. The curve 26b1 would serve. The other four examples check out.

**Proofs.**
- **E3 (gap).** L_ψ is used in (0.3) and Theorems 2.2.2–2.2.3, but Theorem 2.1.2 defines L_θ only for p ∤ cond(θ), while ψ = ωφ^{−1} is ramified at p.
- **E7 (gap, Proposition 3.3.6).** The paper's choice of (ψ⁺, ψ⁻) fails for both j. Over Z_3, with W = R/27 ⊕ R/9, f_1 = (1, 0), f_2 = (1, 1), every ψ killing one f_j sends the other into 9R. The required determinant valuation is still attained, by a Smith-normal-form argument.
- **E9 (error, §3.3.3).** Two inequality chains do not follow from (3.15): −3ie should be −6ie, and 4·length should be 2·length. There are explicit counterexamples to the printed implications. The inequalities actually needed still hold.
- **E12 (gap, step (e)).** Two equalities in the verification of (e) are asserted "as in (d)", but they need the Kolyvagin relation first.

**Harmless.**
- **E6 (error).** (3.14) gives E_α = (3/2)r(M)e, not the printed r(M)e. The α-independence should use dim H¹(K^Σ/K, E[p]).
- **E8 (error).** Slips in the proof of Proposition 3.3.6: Gal(L/K) ↪ Aut(T^{(k)}) is false, the valuation of q(x_ψ) is misstated for non-totally-ramified Φ, and the case D ≥ k is missing.
- **E11 (gap).** "ε ≥ 1" in Theorem 3.3.8 is a non sequitur; the proof excludes ε = 0 anyway.

**Misprints.**
- **E4:** "Proposition 1.1.3(iii)" should be (ii).
- **E5:** Theorem 2.2.1 for 2.1.2.
- **E10:** the index range in condition (b).
- **E13:** w | p for w ∤ p, I_n for I_ℓ, and p^kZ_p for p^kR in §3.1 and §3.3.

**Checked and correct.**
- The Euler-factor bookkeeping (2.10).
- The Heegner comparison factors u_Kα²(β − 1)² and u_Kα²(β² − 1).
- That (spl) with φ|_{G_p} ≠ 1, ω forces E(K)[p] = 0.
- The symmetry of Theorem F's hypothesis under φ ↔ ψ.
- The Tamagawa, torsion and parity bookkeeping in the proof of Theorem F.

## Prerequisites not yet covered

1. Kriz, *Generalized Heegner cycles at Eisenstein primes and the Katz p-adic L-function* (ANT 10, 2016).
2. Rubin, *The "main conjectures" of Iwasawa theory for imaginary quadratic fields* (Invent. Math. 103, 1991).
3. Hida, *The Iwasawa μ-invariant of p-adic Hecke L-functions* (Ann. of Math. 172, 2010).
4. Greenberg–Vatsal, *On the Iwasawa invariants of elliptic curves* (Invent. Math. 142, 2000).
5. Pollack–Weston, *On anticyclotomic μ-invariants of modular forms* (Compos. Math. 147, 2011).
6. Castella–Hsieh, *Heegner cycles and p-adic L-functions* (Math. Ann. 370, 2018).
7. Burungale–Castella–Kim, *A proof of Perrin-Riou's Heegner point main conjecture* (ANT 15, 2021).
8. Monsky, *Generalizing the Birch–Stephens theorem I* (Math. Z. 221, 1996).
9. Nekovář, *The Euler system method for CM points on Shimura curves* (LMS LNS 320, 2007).
10. Perrin-Riou, *Fonctions L p-adiques, théorie d'Iwasawa et points de Heegner* (Bull. SMF 115, 1987).

DOIs were checked against Crossref.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CASTELLA-ETAL-22.result.json` passes.
- The generator asserts that every missing item is routed exactly once.
- No restructure result touches the cited stages.
- The two coalesced Part IIs keep the ids and titles already in use: PAPER-BURUNGALE-TIAN-26's CMAllPrimeMainConjectures, and the maintainer's RankOneConverse (#951).
- **Checked by computer (PARI via cypari2):** the five example curves (conductors, torsion, isogenies, analytic ranks, reduction at p), 26b1, and the conductor-30 curve of E2.
- No Lean was written or compiled; this is an extraction.
