# PAPER-LEMKEOLIVER-WANG-WOOD-25: The average size of 3-torsion in class groups of 2-extensions

Robert Lemke Oliver, Jiuya Wang and Melanie Matchett Wood, *The average size of 3-torsion in class groups of 2-extensions*, [Forum of Mathematics, Pi 13 (2025), e19](https://doi.org/10.1017/S2050508625000009); arXiv [2110.07712](https://arxiv.org/abs/2110.07712).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1352). Status: **complete**. The whole published article was read and every missing item is routed once. The machine-readable extraction is [PAPER-LEMKEOLIVER-WANG-WOOD-25.result.json](PAPER-LEMKEOLIVER-WANG-WOOD-25.result.json): 35 items (3 library, 3 planned, 29 missing), 2 routes, 15 prerequisite entries and 16 recorded source issues. The independent review (REV-PAPER-LEMKEOLIVER-WANG-WOOD-25) corrected it in place; its changes are listed at the end.

**Source.** The published open-access article (CC BY 4.0), 43 pages, SHA-256 `7fe1974e52052c23fe63697e7255de8e59f9dffcfee6d58ef71858289ebcf0e8`, read in full on 2026-09-22.

## What the paper proves

Let G ⊂ S_{2^m} be a transitive permutation 2-group containing a transposition, so G = C₂ ≀ H; D₄ is an example. Let k be any number field.

- **Theorems 1.1 and 6.1.** The average of |Cl_K[3]| over G-extensions K/k tends to an explicit constant, also within each group signature. This proves the Cohen–Lenstra–Martinet conjecture (1.1) for new pairs (G, 3); before, only (S₂, 3) and (S₃, 2) were known. For D₄-quartics over ℚ the constant is about 1.42.
- **Theorems 1.2 and 6.11.** The average of |Cl_{K/F}[3]| for the index-2 subfield F, with relative unit rank u, is 1 + 3^{−u}. Proposition 7.1 shows this is the Cohen–Lenstra–Martinet prediction. This is the first proven case of the conjecture for a function not of the form |Cl_K[p]|.
- **Theorem 8.1.** The same holds for C₂ ≀ H with H arbitrary, under counting hypotheses on H.

**Strategy.** Sum Datskovsky–Wright's average of h₃(K/F) over quadratic K/F (Theorem 6.10) over all index-2 subfields F. This needs a tail bound uniform in F (Theorem 5.1), proved by induction on the tower from four ingredients:

1. **§3, Theorem 3.1.** Uniform bounds for N_F(S₃, X) and Σh₃(K/F), with explicit dependence on Disc(F) and h₂(F), in three regimes:
   - small X: class field theory;
   - large X: the Shintani zeta function over F, with a uniform convexity bound (Lemmas 3.10–3.11);
   - intermediate X: "propagation of orders". The Shintani count also counts nonmaximal orders, and each field contributes many of them (Lemmas 3.13–3.14), so too many fields would overrun Proposition 3.6.
2. **§2, Lemma 2.1.** A relative Ellenberg–Venkatesh lemma bounding |Cl_{L/K}[ℓ]| when there are many small split primes.
3. **§4.** A zero-density estimate for ray class L-functions (Theorem 4.2) and Zaman's lower bound (Lemma 4.4). Together they show that most quadratic extensions have many small split primes (Lemma 4.3). This handles the critical range Disc(F₁) ≈ X^{1/3} (Lemma 5.9).
4. **§6.** Wreath-product bookkeeping (Lemmas 6.6–6.9) and thin families without a transposition (Theorems 6.4–6.5), whose 3-torsion contributes o(X).

**§7** compares the proven averages with Cohen–Lenstra–Martinet, via Wang–Wood. The average of h₃(K) is a weighted average of h₃(F) against Res ζ_F/(ζ_F(2)Disc(F)²). It is biased by small-discriminant F, as in Bartel–Lenstra.

## What the atlas already has

- **Library (Mathlib at 082e2d3).** Class numbers, regulators, and Dirichlet's unit theorem.
- **Planned.**
  - AnalyticNumberTheory AN.8: Sato–Shintani prehomogeneous zeta functions (Proposition 3.7).
  - AN.4: Hecke L-function basics (Lemma 4.1).
  - InverseGaloisAndArithmeticFundamentalGroups IG.4: Shafarevich's solvable realization theorem.
- **Not in the atlas.** The ℓ-torsion bounds, uniform cubic counts, zero-density families, tail estimates, field counts and class-group averages.

## Routes

1. **Source of ArithmeticStatistics ST.3 and ST.5** (24 items):
   - the definitions and the Cohen–Lenstra–Martinet conjecture;
   - the Ellenberg–Venkatesh inputs, Lemma 2.1 and Lemmas 2.3–2.4;
   - Theorem 3.1 with Propositions 3.4, 3.6, 3.12 and 3.15;
   - Klüners–Wang inputs, Lemma 5.8, Theorem 5.1;
   - Theorem 6.2 (Malle/Klüners counts), the thin-family results, the wreath lemmas, Datskovsky–Wright;
   - Theorems 6.1, 1.1, 1.2 and 8.1;
   - Wang–Wood, Proposition 7.1, and the §7.2 comparison.

   ST.3 owns class-group moment theorems by discriminant and signature. ST.5 owns the heuristic models against which proven averages are recorded.
2. **Source of AnalyticNumberTheory AN.3, AN.4 and AN.8** (5 items):
   - Lemmas 3.8–3.11 on Shintani zeta functions (AN.8);
   - Theorem 4.2 and Lemma 4.3 (AN.3, zero density);
   - Lemma 4.4 and the Landau, Brauer–Siegel and Friedman–Skoruppa bounds (AN.4).

## Source issues (`sourceIssues` E1–E16)

None affects the main theorems. E7–E16 were added by the review and are described at the end.

- **E1** (gap, affects the proof of Lemma 2.1).
  - **The problem.** The height bound uses "u, α_r, α_s all have norm 1" to get Σ max(x_v, 0) = O(1). The boxes control only differences within each block of places above w_i, not the block sums t_i. The t_i of α_r/α_s are logarithms of the unit Nm_{L/K}(α_r/α_s) of K, which is not controlled. Absolute norm ±1 gives only Σ t_i = 0.
  - **Repair.** Pigeonhole the α_i by the class of Nm_{L/K}(α_i) in O_K^*/(O_K^*)^d (bounded in terms of [L : ℚ]), and rescale by units of K. Then α_r/α_s has relative norm 1. The loss is a constant.
- **E2** (misprint). Lemma 2.1 states d := [L : ℚ], but the proof and all applications use d = [L : K]. The application with θ = 1/20 and ℓ = 3 needs d = 2.
- **E3** (misprint). The valuation formula for uα_r/α_s in the proof of Lemma 2.1 has its exponents mispaired.
- **E4** (error, nothing). In the proof of Lemma 3.5, "the number of quadratic L/F with Disc(L/F) = m is bounded by h₂(F)" is false: ℚ(√±2) both have |Disc| = 8. The correct bound O(m^ε h₂(F)) is absorbed.
- **E5** (misprints). In Lemma 3.14, O_L should be O_F. In Corollary 5.5, "Lemma 5.1" should be Theorem 5.1.
- **E6** (misprint).
  - **The problem.** The displayed constant C_G in Theorem 6.1 omits the weights 2^{−r₂(F)} that the proof, D_G and C_m all have.
  - **Evidence.** Computed with PARI over quadratic fields with |D| ≤ 30000: for D₄ over ℚ the displayed formula gives 1.4167, the proof's formula 1.4230. Both round to "about 1.42".

**Also checked and correct:**
- the continuity of the five ranges of Theorem 3.1, and Corollary 3.2;
- the Phragmén–Lindelöf step of Lemma 3.11, away from the poles (see E9);
- the Dirichlet-series identity of Lemma 3.13, once its weight is corrected (see E10);
- the exponent bookkeeping of Lemmas 5.7 and 5.9 and of the induction;
- (6.7);
- the D₄ table of Example 7.2. The proven averages 1.1155, 1.3386, 2.0078 and 1.4066 reproduce the printed ≈ 1.12, 1.34, 2.01 and 1.41.

No correction notice or Crossref update relation exists.

## Prerequisites not yet covered

- Datskovsky–Wright 1986 and 1988, and Shintani 1972.
- Ellenberg–Venkatesh 2007, and Ellenberg–Pierce–Wood 2017.
- Pierce–Turnage-Butterbaugh–Wood 2020.
- Thorner–Zaman and Lemke Oliver–Thorner (zero density).
- Zaman's thesis.
- Friedman–Skoruppa 1999.
- Klüners–Wang, Klüners 2012, and Klüners–Malle 2004.
- Wang–Wood 2021.
- Cohen–Lenstra and Cohen–Martinet.
- Bartel–Lenstra 2020.
- Bhargava–Shankar–Taniguchi–Thorne–Tsimerman–Zhao 2020.

Links and reasons are in the JSON.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LEMKEOLIVER-WANG-WOOD-25.result.json`: ok.
- Every missing item appears in exactly one route, and no route takes a planned or library item.
- Mathlib citations were read at 082e2d3:
  - `NumberTheory/NumberField/ClassNumber.lean:64`;
  - `NumberTheory/NumberField/Units/Regulator.lean:266`;
  - `NumberTheory/NumberField/Units/DirichletTheorem.lean:506`.
- Layer ids were checked against `data/atlas.json`, and prerequisite DOIs against Crossref.
- No Lean was written or compiled; none is a deliverable of this job.

## Independent review corrections (REV-PAPER-LEMKEOLIVER-WANG-WOOD-25, 23 September 2026)

The review read the published article in full, together with the Ellenberg–Venkatesh preprint for its Lemmas 2.2–2.3. The review's download has a different SHA-256 (`1e4d93b2…780b`), because Cambridge Core stamps each download with a watermark line. The text is the same.

The review confirmed every status, every Mathlib citation and both routes. It confirmed E1–E6:
- E3 with a qualification of its reason;
- E4 with a further slip (L/F written for K/F);
- E6 with an independent PARI reproduction of 1.4230 against 1.4167.

The extraction was corrected in place:
- **Item 7 (Ellenberg–Venkatesh).** Restated as [EV07] has it. The statement is relative to K/K₀, the height bound is Norm(D_{K/K₀})^{1/(2(d−1))}, the torsion lemma needs δ < 1/(2ℓ(d − 1)), and the small primes must be unramified.
- **Item 8 (Lemma 2.1).** The a_i, b_i are positive (E7). Condition (3) is reworded as printed: each of ℘_i and ℘̄_i has a power extended from a prime of H.
- **Items 14–17.**
  - Lemma 3.11 is stated away from its poles (E9).
  - Lemma 3.13 carries the weight |Aut_{O_F}(R)|⁻¹ (E10), and the conductor sum in Proposition 3.12 runs over all 𝔮 (E11).
  - Lemma 4.1 counts nontrivial zeros, for t ≥ 0.
  - "Log-free" is dropped from Theorem 4.2, whose exponent carries +ε. The summary is corrected to match.
- **Item 35 (Theorem 8.1).** The examples are attached to the case whose hypotheses they satisfy. Some locators and item 13's note were tidied.

**Ten new source issues, all confirmed:**
- **E7** (misprint, Lemma 2.1, p.7). "Integers a_i, b_i" should be positive integers. Otherwise a_i = b_i = 0 makes M unbounded and forces Cl_{L/K}[ℓ] = 0, which is false for ℚ(√−23), ℓ = 3.
- **E8** (error, proof of Lemma 2.1, p.9). [O_L^* : O^*O_K^*] ≤ d^d is false: PARI gives index 8 > 4 for K = ℚ(ζ₇)⁺ and L = K(√2). The right bound is d^{r₁(K)+r₂(K)}, which is still O_{[L:ℚ]}(1).
- **E9** (error, Lemma 3.11, p.14). The convexity bound is claimed for all t in −1/2 ≤ σ ≤ 3/2. But ξ_{F,α} has poles at 1 and 5/6. Its only use avoids them.
- **E10** (error, Lemma 3.13, p.16).
  - The identity needs the weight |Aut_{O_F}(R)|⁻¹, not |Aut_F(A)|⁻¹.
  - Example: F = ℚ and K = ℚ(i). There are three orders of index 5 in ℚ × K, forming two isomorphism classes. The printed left side gives 1 and the right side 3/2.
  - "R ⊗_ℚ F" should read R ⊗_{O_F} F.
  - Proposition 3.15 is unaffected: its inequality becomes an equality.
- **E11** (gap, proof of Proposition 3.12, p.18). The sum runs over square-free 𝔮 only, but conductors above 3 need not be square-free: ℚ(∛3) has discriminant −3·9². The bound survives.
- **E12** (error, §3.4, p.19). The Datskovsky–Wright correspondence is with cubics having disc(L/F) = disc(K/F), which need not be square-free. For example, ℚ(√−26) gives a cubic field of discriminant −104. Inequality (3.8) stands.
- **E13** (misprint, proof of Lemma 4.3, p.21). σ₁ = 1 − ε₁/4c should be max(1 − ε₁/4c, 1/2), as in the statement.
- **E14** (error, proof of Lemma 5.8, p.25).
  - The claim is that N_k(C₂, X) is at most h₂(k) times the number of ideals.
  - This is false: ℚ(ζ₂₉)⁺ has class number 1 but narrow class group (ℤ/2)³, so it has 7 unramified quadratic extensions.
  - The factor should be O(h₂(k)). The lemma stands.
- **E15** (error, §7.2, p.39). The general Cohen–Lenstra–Martinet prediction for h₃(K/k) omits the Gaussian binomials [a_i choose j]_q. The printed formula is right only when every a_i ≤ 1, which covers Example 7.2.
- **E16** (error, §1, p.2). "O_ε(X^{1/2+ε}) quartic fields with any other Galois closure group" is not known for A₄, where the best bound is about X^{0.778} (Bhargava–Shankar–Taniguchi–Thorne–Tsimerman–Zhao). What the sentence needs, o(X), holds.

**Noted but not registered.** These are slips too small to record as source issues:
- "Theorem 7.1" is printed for Proposition 7.1 (p.5);
- a dangling "then for all" in Theorem 6.11;
- F^u(G) is used but never defined;
- the absolute-value bars are missing in Theorem 8.1.
