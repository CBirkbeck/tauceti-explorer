# PAPER-GHOSH-SARNAK-22: Integral points on Markoff type cubic surfaces

Amit Ghosh and Peter Sarnak, *Integral points on Markoff type cubic surfaces*, [Inventiones mathematicae 229 (2022), 689–749](https://doi.org/10.1007/s00222-022-01114-z); [arXiv:1706.06712v3](https://arxiv.org/abs/1706.06712v3).

The [extraction](PAPER-GHOSH-SARNAK-22.result.json) is complete at paper-routing scope: **64 items (4 library, 2 planned, 58 missing), 6 routes, 16 prerequisite entries and 24 source issues**. Original extraction: Claude Code `cc-fb70e5`, 22 September 2026, issue #1272. Independent review: `REV-PAPER-GHOSH-SARNAK-22`, Claude Code `cc-442dc5`, 23 September. This fix: Codex `codex-J6LwjP`, 30 September, issue #4999. The earlier review accepted a real-only Fricke statement as sufficient; the verified fix corrects that scope mismatch. E1–E20 retain their original independent verdicts; E21–E24 await independent review.

## Texts actually read

The original extraction records a full read of the 55-page arXiv v3 on 22 September, SHA-256 `e4ddc7a115ad4afd61f0063d0b931baf85792eee2267d1d5c232bece11d3163d`. The fix freshly read pp.3–5, 7, 9–10, 12–14, 18–20, 22–24 and 34, including page images 5 and 13. This is a focused correction, not a fresh full-paper audit.

Fresh historical comparison read v1 p.5 and v2 pp.3,6. Theorem 1.2(i) has exponent −1/4 in v1 p.5 and v2 p.6; v3 p.5 uses −1/2. Loughran–Mitankin [arXiv:1807.10223v3](https://arxiv.org/pdf/1807.10223v3), pp.2–3, already identifies that exponent issue and states its corrected count in Theorem 1.4. E11 concerns the separate constant-1 claim in v3. No blanket persistence of all errata across v1–v3 is claimed. The JSON records each PDF hash and reading scope.

The published main text/PDF was not obtained on 30 September. Springer presents a subscription preview and exposes appendices in HTML; those appendices were not freshly audited here. The paper itself says publication abridges §10 and has additional differences. The findings are therefore scoped to the specified arXiv texts, without claiming a full published reading. A bounded title/DOI erratum search and Springer/Crossmark metadata check found no explicit correction notice.

## Mathematics and baseline

For M(x)=x₁²+x₂²+x₃²−x₁x₂x₃, Γ acts on V_k(ℤ) by Vieta involutions, coordinate permutations and double sign changes. Theorem 1.1 gives unique fundamental roots for generic k≥5 and admissible k<0. The Δ function proves uniqueness. Proposition 6.1 characterizes local solubility by k≢3 mod 4 and k≢±3 mod 9. Theorem 1.2(i) constructs ≫√K/√log K Hasse failures; Theorem 1.2(ii) proves that almost all admissible levels have Zariski-dense integer points, using the moving-plane variance argument, quadratic-form estimates and Appendix B local densities.

The exceptional comparison in §1(d) needs correction: for exceptional k≥5, **h_M(k)≥|F⁺_k(ℤ)|+1**. Each positive fundamental root represents a distinct orbit whose coordinates all have absolute value at least 3; an exceptional small-coordinate orbit is additional. At k=5, (0,1,2) is a solution but F⁺ is empty. The §7 means count F± directly, so this correction does not alter their definition or Theorem 1.2(ii).

Mathlib supplies quadratic reciprocity, sums of two squares, Hensel's lemma and `gaussSum_sq`. The last theorem requires a **finite field** and characters valued in an integral domain, not an arbitrary finite commutative ring. Its hypotheses were freshly read at pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, `Mathlib/NumberTheory/GaussSum.lean:162–225`. The CA.4 and FF.1 reviewed audits agree with this boundary. RS-03 makes FF.1 the owner of finite-field character and Gauss-sum comparisons.

The existing CA.4 coefficient-three carrier and root-generation theorem supply the k=0 orbit result through a new integer comparison: reducing the coefficient-one equation modulo 3 forces all coordinates divisible by 3; x=3y intertwines its Vieta moves with the coefficient-three moves. A nonzero solution can be made positive by double sign changes, and the existing root-generation theorem applies. This is item 64 (planned). The new Δ minimum remains item 10 (missing). No invertibility of 3 modulo 3 is asserted.

## Routes and remaining blueprint work

1. **ClassicalArithmeticCompletion CA.4: 25 missing items**, numbered 3–17, 24–26, 35–39, 61–62. They cover general level-k carriers, descent, Δ and fundamental sets, class numbers, parametric solutions, local solubility, Hasse failures and enumeration. The packet has a source entry, three new comparison/result nodes and exact requests for all 25 missing items. CA.4 coverage is partial; existing coefficient-three nodes do not supply general V_k theory. Items 3,4,7,8 share the n=3,a=1 specialization of PAPER-GAMBURD-MAGEE-RONAN-19/1,5. Lemma 6.4 imports FF.1 and the pinned Gauss-sum identity; CA.1 is removed from this route.
2. **ExponentialSumsAndCircleMethod ES.3/ES.4: 21 missing items.** Affine/full forms, Appendix A, sectors and representation counts, variance, the δ-method, singular integral/series, almost-all results and Appendix B densities. Finite-field normalization imports FF.1; prime-power and 2-adic specializations remain analytic work.
3. **GeometryOfNumbersAndQuadraticArithmetic GN.4: 5 missing items.** Lemmas 7.1–7.3, the class-number average and the Blomer–Granville estimate.
4. **AnalyticNumberTheory AN.5: 1 missing item.** Landau-type counts for exceptional levels and the Hasse-failure lower bound.
5. **ArithmeticDynamics Part II: 5 missing items.** Markoff-type forms, U₁/U₂ families and density, Zariski-density results and the character-variety interpretation. The old `DESIGN-ArithmeticDynamicsPartIIMarkoff` key is superseded, folded into pending [DESIGN-ArithmeticDynamicsPartII #3367](https://github.com/CBirkbeck/tauceti-explorer/issues/3367). The proposal id remains a coalescing key. General level-k imports are conditional on the outstanding CA.4 requests; the brief no longer presents them as existing.
6. **NonabelianLevelStructures: 1 missing item (23).** Coalesce the arbitrary-commutative-ring Fricke identity with PAPER-CHEN-24/78 and its accepted route 6. This is a pending shared owner, not an existing layer. BelyiMaps only plans the real identity. Put generic trace algebra before CA.4; the later character-variety layer may import CA.4 without introducing a cycle. The Corollary 6.3 point can also be verified directly by substitution.

The live blueprint issues #1025, #1040, #1030, #1021 and #1022 still omit this paper from their bodies; #3367 includes it. The fix report records the required maintainer queue refresh, coalesced with the Chen and Gamburd–Magee–Ronan refresh findings. Workers do not edit generated queue data or issue bodies. Reader/suggested-file synchronization for the new CA.4 nodes is also a scoped blueprint follow-up; those files are not #4999 deliverables.

## Source issues E1–E24

The following E1–E20 evidence and verdicts come from the original extraction/review; this fix does not claim to have rerun their entire numerical audit. The fresh scope is stated above.

- **E1** (error, affects a stated result: Lemmas 7.1–7.2).
  - **The problem.** Lemma 7.1 replaces the lower limit α ≍ a²K^{−1/2} by 0, which silently adds the strip 0 ≤ m < a. The paper writes α = O(aK^{−1/2}).
  - **Consequence.** The true constant in Lemma 7.2 is 1/48, not 1/36. The strip removes K(log K)²/144.
  - **Evidence.** Exact counts of R⁺(K) for K ≤ 10^11 fit c₂ = 0.0211.
  - **Why little else breaks.** Lemma 7.3's 1/48 is consistent with this. (1.6) leaves the constant unspecified.
- **E2** (error, affects the proof of Proposition 6.1).
  - **The problem.** The claimed lifts of (1,0,0) mod 4 and (3,0,0) mod 9 exist only for k ≡ 1 mod 8 and k ≡ 9 mod 27.
  - **Repair.** Use (x₁, 0, 2) for k ≡ 5 mod 8, and (3y, 3, 0) or (3, 3, x₃) for the other classes with 9 | k. The proposition itself holds.
- **E3** (error, nothing). In §6.1, "p² | k" should be "p | k, contrary to p ∤ k".
- **E4** (misprint). The formula for V₂ has x₁x₃ − x₁ for x₁x₃ − x₂.
- **E5** (error, affects the proof of the U₁ density).
  - **The problem.** The matrix of V₃ has the wrong sign, so A should have trace x₂² − 2.
  - **Consequence.** The base point (k − 4, k − 4, 2) has a finite V₁V₃-orbit of size 3 for k = 3, 5.
  - **Repair.** Use planes with |x₂| ≥ 3 through the points of the parametric family.
- **E6** (error, nothing). k = 49 is listed with finite orbits, but (1, 4, 8) ∈ V₄₉(ℤ) has an infinite orbit.
- **E7** (misprint). In Proposition 8.1(iii), (2x₁ − x₃)² should be (2x₂ − x₃)².
- **E8** (misprint). In Proposition 8.2 the smallest ν is 11 (k = 1456, a verified Hasse failure), not 37.
- **E9** (gap, nothing).
  - **The problem.** In Proposition 8.3, "5 | x₁ ⇒ a prime p ≡ ±2 (mod 5) divides x₁² − 4" fails for even x₁ (x₁ = 60).
  - **Why nothing breaks.** It holds for odd x₁, the only case used.
- **E10** (misprint). In Proposition 8.3, "≡ 3" should be "≡ −3 (mod 20)".
- **E11** (gap, affects a stated result). Theorem 1.2(i) says "at least √K(log K)^{−1/2}", but the proof gives only ≫. The families have constants about 0.41 (k < 0) and 0.10 (k > 0).
- **E12–E14** (misprints).
  - The error term in (9.5) should be O(KA^{−1/2}).
  - Before (9.25), "(mod k)" should be "(mod s)".
  - The parity condition in (9.3) is wrong for even a.
- **E15** (error, affects a stated result). For every p ≡ 3 (mod 4), Proposition B.1(b) and B.2(d) have the wrong sign in the k-term: the factor χ(−1) is missing. For example δ₃(9) = 2/9, δ₃(18) = 4/9 and δ₇(49) = 34/49, where the paper gives 4/9, 2/9 and 36/49. The formulas are correct for p ≡ 1 (mod 4). (Extended from p = 3 at review.)
- **E16** (misprint). In Proposition B.2(e), χ(k/p^μ) should be χ((k − 4)/p^μ).
- **E17** (error, nothing).
  - **The problem.** Proposition B.4(d) is wrong whenever η₁ = η₂ (260 cases tested).
  - **Why nothing breaks.** Proposition B.5, which §9 uses, is correct (3,932 cases).
- **E18** (error, affects a stated result).
  - **The problem.** The explicit 2-adic formulas of Proposition B.12 are wrong in (1), (3)(b), (3)(d) and most of (4). For example δ₂(1) = 3/4 (printed 3/2) and δ₂(24) = 1 (printed 5/2).
  - **Why nothing breaks.** The bound δ₂ ≥ 3/4 used in §9.1 holds.
- **E19** (error, nothing). In §B.4.2, δ₂(a₁, a₂) = 5/4 when θ = 0 (the paper says 1). Corollary B.15 is unaffected.
- **E20** (error, nothing; added at review). In §5.2.1, for |x̂₁| = 2 the slice {x₁ = x̂₁} ∩ V_k is a pair of lines. The orbit's closure is one line, not "the conic section". The argument needs only a curve, so nothing breaks.


- **E21** (error, nothing downstream): the exceptional class-number inequality is reversed. The corrected strict lower bound is planned in CA.4; the counterexample k=5 and the large-coordinate orbit argument establish it.
- **E22** (misprint): §10 p.34 refers to §7 for Hasse failures; the intended reference is §8.
- **E23** (misprint): §10 p.34 refers to §3 for admissibility; use §1, §4.1 and Proposition 6.1.
- **E24** (misprint, contextual remark): Remark 1.3(a) gives order √K for the cited algebraic obstruction count; Loughran–Mitankin Theorem 1.4 has order √K/√log K.

In Proposition 8.1(ii), the displayed residues ν≡0,±3 mod 9 are redundant: the prime-factor condition excludes 3, leaving ν≡±4 mod 9. This is an explanatory note, not a false-hypothesis erratum. The eligible positive ν<50 are 23,31,41,49; the first k=1062 is a generic Hasse failure.

## Verification

The fix independently enumerated F⁺ and exceptional levels through K=100800: 7105 exceptional k≥5 have empty F⁺ (largest 100792), while 7630 generic Hasse failures remain among 58800 admissible positive levels, agreeing with Table 3. It checked the direct Corollary 6.3 formula in 720 cases (p=5,7,11,13; n=1,2,3; k=0,…,59), all 27 mod-3 triples, and 41 integer solutions in [−30,30]³ with their rescaling and three Vieta identities. Reproducible Python is in the [fix report](../redteam/RT-PAPER-GHOSH-SARNAK-22.fixes.md).

The paper checker, indexed blueprint checker, §18 source-issue/version checks and intake file checks pass. Every missing item is routed exactly once. All original item ids and E1–E20 independent verdicts are preserved. The packet remains partial, and no formalization or Lean compilation is claimed; this issue supplies no suggested Lean file.
