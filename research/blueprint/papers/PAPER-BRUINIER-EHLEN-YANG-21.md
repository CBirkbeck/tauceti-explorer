# PAPER-BRUINIER-EHLEN-YANG-21: CM values of higher automorphic Green functions for orthogonal groups

Jan Hendrik Bruinier, Stephan Ehlen and Tonghai Yang, *CM values of higher automorphic Green functions for orthogonal groups*, [Inventiones mathematicae 225 (2021), 693–785](https://doi.org/10.1007/s00222-021-01038-0) (open access, CC BY 4.0); arXiv [1912.12084](https://arxiv.org/abs/1912.12084).

Extraction by Claude Code, session `cc-39fac3`, 22 September 2026 (issue #1288). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-BRUINIER-EHLEN-YANG-21.result.json](PAPER-BRUINIER-EHLEN-YANG-21.result.json). It has:
- 46 items: 1 library, 7 planned, 38 missing;
- 6 routes: 5 source routes and 1 Part II, which coalesces with PAPER-LI-23's candidate;
- 12 prerequisite entries;
- 6 recorded source issues.

## Sources read

- **The published article** (open access) was read in full. Statement numbers and pages below are the published ones; the appendix is §9 there.
- **arXiv v2** ("revised and final version") was used through its TeX source as a reading aid. A word-level diff against the published text shows layout changes and one sentence added after Lemma 7.2.
- **Errata:** Crossref records no correction.

## What the paper proves

Gross and Zagier conjectured that CM values of the higher Green functions G_{j+1,f}(z_1, z_2) on X(1)², suitably normalized, are logarithms of algebraic numbers in class fields (Conjecture 1.1).

**The method.**
- **Higher theta lifts (§4).** The paper realizes higher Green functions on GSpin(n, 2) Shimura varieties as higher regularized theta lifts Φ^j(z, h, f) = (4π)^{−j}Φ(z, h, R^jf) of harmonic Maass forms (Proposition 4.7). The Green functions themselves are characterized by Oda–Tsuzuki's current equation and L² (§4).
- **CM value formulas (§5).**
  - At a small CM point: Φ^j(z^±_U, h, f) = CT⟨f, [θ_P, 𝒢^+_N(τ, h)]_j⟩ for any preimage 𝒢_N of the binary theta function (Theorem 5.5).
  - On the whole CM cycle: CT⟨f^+, [θ_P, 𝓔^+_N]_j⟩ − L′(ξf, U, 0), with the incoherent Eisenstein series (Theorem 5.4).
  - There is a big-CM analogue for real quadratic F (Theorem 5.10).
- **Arithmetic preimages (appendix).** It constructs preimages 𝒢_N whose coefficients are logarithms of algebraic numbers in the ring class field, with Shimura reciprocity (Theorem 3.9/9.4), via a see-saw to signature (1, 2) and Borcherds products.

**Consequences.**
- **Theorem 6.1:** the conjecture for CM points in one imaginary quadratic field, strengthening Viazovska.
- **Theorem 1.2, Corollary 7.15:** partial averages over all CM points of a fundamental discriminant d_1, twisted by genus characters. The proof uses Zagier lifts and, for odd j, Millson theta lifts (§7).
- **Corollary 1.4/7.18:** the full conjecture when the class group of d_1 has exponent ≤ 2.
- **Theorems 1.9, 6.5, 6.12:** a higher-weight Gross–Kohnen–Zagier theorem for Zhang's higher Heegner cycles on Kuga–Sato varieties. It combines the archimedean formula with Xue's and Howard's finite intersections.
- **§8:** numerical examples.

## What the atlas already has

**Library (1 item).** Mathlib's SL_2(Z) modular forms, Eisenstein series, the Gamma function and the hypergeometric series.

**Planned (7 items).**
- The Weil representation and theta kernels (MP.4, MP.5).
- Harmonic Maass forms and Poincaré series (QM.3).
- Weak Jacobi forms (QM.1).
- CM points and ring class fields (HE.1).
- Canonical models and Shimura reciprocity (ShimuraVarieties V4, V6).
- Kuga–Sato varieties (GeneralizedHeegnerCycles GH.0).

**Not in the atlas.** Nothing plans:
- higher Green functions or their CM values;
- the arithmetic weight-1 preimages;
- Zagier and Millson lifts;
- Zhang's higher Heegner cycles or their heights.

## Routes

1. **Source → GeometryOfNumbersAndQuadraticArithmetic:GN.2** (2 items):
   - local genus characters χ_Δ (Definition 7.1, Lemmas 7.2–7.3);
   - genus theory for exponent-2 class groups.
2. **Source → MetaplecticAutomorphicForms:MP.6** (1 item). Siegel–Weil for binary lattices (Proposition 3.8) and the weight-ℓ Eisenstein series identities. PAPER-LI-23 sends the signature-(n, 2) formula here too.
3. **Source → MP.7** (1 item). The Shimura lift Shim_{m_0,μ_0} and the Skoruppa–Zagier newform isomorphism (half-integral weight).
4. **Source → GrossZagierAndArithmeticHeights:GZ.6** (1 item). E′_L(τ, 0; 1), the weight-1 incoherent Eisenstein derivative, whose coefficients are logs of rationals (Kudla–Yang), with its Hilbert analogue. GZ.6 plans exactly such incoherent kernels.
5. **Source → GZ.7** (3 items). The Heegner-divisor stacks, Howard's Lemma 6.10, Lemma 6.11 and the finite intersection formula of Proposition 6.9. GZ.7 plans CM intersection multiplicities via Serre–Tate.
6. **Part II → HigherGreenFunctionCMValues**, "Gross–Zagier formulas and arithmetic heights, Part II: CM values of higher Green functions on orthogonal Shimura varieties" (30 items; parent GrossZagierAndArithmeticHeights, area `automorphic`). This is the candidate PAPER-LI-23 proposed, with the same id, parent, title and area. Li's brief names this paper as the source to coalesce, and this paper supplies the Part II's foundational layers.
   - **§3:** the operator lemmas.
   - **§4:** the Green functions.
   - **§5:** all CM value formulas.
   - **§9:** the appendix.
   - **§6:** Theorem 6.1, the signature (1, 2) results and the higher-weight Gross–Kohnen–Zagier theorem.
   - **§7:** the twisted partial averages.
   - **§8:** the examples, as tests.

## Source issues (`sourceIssues` E1–E6)

All six are in the published text.

- **E1 (misprint, Lemma 6.3, p. 736).**
  - **Problem:** the "in particular" formula for L′(g, U, 0) drops a factor √M.
  - **Why:** √|D_0| = 2√(Mm_0) in deg Z(U) = 2√|D_0|L(χ_{D_0}, 1)/π. Theorem 6.5, which uses the first formula, has √M.
- **E2 (misprint, proof of Lemma 6.8, pp. 743–744).**
  - **Printed:** the Legendre equation as "(1 − x)² P″ …", and the recursion denominator (2m + 2)(m + 1), twice.
  - **Correction:** (1 − x²)P″ and (2m + 2)(2m + 1).
  - The lemma β_j = P_{2j} is true (checked symbolically for j ≤ 5).
- **E3 (error, Theorems 7.9, 7.11, 7.13(2) and (7.10), pp. 758–763).** The odd-j constants are mutually inconsistent.
  - Theorem 7.9's 8√m does not give (7.10)'s 4m^{j/2}.
  - (7.10) gives +2^{2−j} in the proof of Theorem 7.11, not the −2^{1−j} claimed there for both parities.
  - Example 3 (j = 1), confirmed numerically by the authors, uses the constant +½ = 2^{j−2}, while Theorem 7.13(2) gives −1.
  - The proof of Theorem 7.9 also uses 2√Q(λ_{z⊥}) = |p_z(λ)|, but by (7.7) and (6.9), |p_z(λ)| = √Q(λ_{z⊥}).
  - **Correction:** for odd j, Theorem 7.9 has 4√m, and Theorems 7.11 and 7.13(2) have +2^{j−2}.
  - **Effect:** only a rational factor changes; the algebraicity results are unaffected.
- **E4 (misprint, proof of Corollary 7.18, p. 768).**
  - **Printed:** "exactly s splittings".
  - **Correction:** 2^{s−1} splittings, one per genus character, and the sums run to h_{D′} = 2^{s−1}.
- **E5 (error, Corollary 1.4 / 7.18, and Theorem 6.1).**
  - **Problem:** these omit the hypothesis (z_1, z_2) ∉ Z^j(f) of Conjecture 1.1. For z_1 = i, z_2 = 2i ∈ T_2(i) and f = q^{−2} + O(q), G_{j+1,f}(z_1, z_2) is infinite. The proof goes through Corollary 7.15, whose square case requires avoiding the Hecke translates.
  - **Correction:** add the hypothesis.
- **E6 (misprint, (7.6) and the definitions of f_m, pp. 756–760).**
  - (7.6) omits the weight χ_Δ(λ).
  - f_m is written "q^mφ_μ + O(1)" for q^{−m}φ_μ + O(1).

The items use the corrected statements.

## Prerequisites not yet covered

1. Bruinier, *Borcherds products on O(2, l) and Chern classes of Heegner divisors* (LNM 1780).
2. Borcherds, *Automorphic forms with singularities on Grassmannians* (Invent. Math. 132, 1998).
3. Borcherds, *The Gross–Kohnen–Zagier theorem in higher dimensions* (Duke 97, 1999).
4. Bruinier–Funke, *On two geometric theta lifts* (Duke 125, 2004).
5. Bruinier–Yang, *Faltings heights of CM cycles and derivatives of L-functions* (Invent. Math. 177, 2009).
6. Ehlen, *CM values of regularized theta lifts and harmonic weak Maaß forms of weight 1* (Duke 166, 2017).
7. Duke–Li, *Harmonic Maass forms of weight 1* (Duke 164, 2015).
8. Zhang, *Heights of Heegner cycles and derivatives of L-series* (Invent. Math. 130, 1997).
9. Gross–Kohnen–Zagier, *Heegner points and derivatives of L-series II* (Math. Ann. 278, 1987).
10. Oda–Tsuzuki, *Automorphic Green functions associated with the secondary spherical functions* (Publ. RIMS 39, 2003).
11. Duke–Jenkins, *Integral traces of singular values of weak Maass forms* (ANT 2, 2008).
12. Howard–Madapusi Pera, *Arithmetic of Borcherds products* (Astérisque 421, 2020).

DOIs were checked against Crossref.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BRUINIER-EHLEN-YANG-21.result.json` passes.
- The generator asserts that every missing item is routed exactly once.
- No accepted restructure touches the cited stages.
- The Part II id, parent, title and area match PAPER-LI-23 (merged in #1979).
- **Checked by hand:**
  - §3: Lemma 3.1, Proposition 3.6.
  - §5: Lemma 5.3, Theorem 5.4, Corollary 5.9.
  - §6: Proposition 6.2; the Gamma factors in Lemma 6.3 and Theorem 6.5; Proposition 6.7 and Lemma 6.8 (symbolic); Proposition 6.16.
  - §7: the constants of Theorem 7.9, (7.10), Theorems 7.11 and 7.13, and Example 3; the counting in Corollary 7.18.
  - §9: Proposition 9.6.
- No Lean was written or compiled; this is an extraction.
