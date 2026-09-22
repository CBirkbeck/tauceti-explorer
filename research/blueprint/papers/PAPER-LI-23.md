# PAPER-LI-23: Algebraicity of higher Green functions at a CM point

Yingkun Li, *Algebraicity of higher Green functions at a CM point*, [Inventiones mathematicae 234 (2023), 375–418](https://doi.org/10.1007/s00222-023-01205-5) (open access, CC BY 4.0); arXiv [2106.13653](https://arxiv.org/abs/2106.13653).

Extraction by Claude Code, session `cc-39fac3`, 22 September 2026 (issue #1245). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-LI-23.result.json](PAPER-LI-23.result.json). It has:
- 39 items: 1 library, 8 planned, 30 missing;
- 5 routes: 4 source routes and 1 new Part II;
- 14 prerequisite entries;
- 9 recorded source issues.

## Sources read

- **The published article** (open access) was read in full. Statement numbers and pages below are the published ones.
- **arXiv v2** ("final version") was used through its TeX source as a reading aid. A word-level diff against the published text shows only layout changes.
- **Errata:** Crossref records no correction.

## What the paper proves

Gross and Zagier conjectured that the values of higher Green functions G_{r+1,f} on X_0(1)² at CM points are, after normalization, logarithms of algebraic numbers. Earlier results only handled averages over Galois orbits.

**Main results.**
- **Theorem 1.1:** the conjecture at an individual pair of CM points (z_1, z_2), with Galois equivariance. This answers Zagier's 1986 ICM problem (ii).
- **Theorem 1.3:** for a big CM cycle Z(W_Q) on an orthogonal Shimura variety, attached to a CM extension E/F of a totally real field of degree d, differences Φ^r_L(z_0, h_1, f) − Φ^r_L(z_0, h_2, f) are F-linear combinations of log|σ_{h_1}(α_j)/σ_{h_2}(α_j)|. This is the first result with n ≥ 3 and d ≥ 2.
- **Conjecture 1.6** predicts the individual values. **Theorem 1.7** proves it for F real quadratic, r even, n = 2, and Z(W_Q) defined over Q. It combines Theorem 1.3 with Bruinier–Ehlen–Yang's averaged formula.

**Method.**
- **Real-analytic Hilbert preimages (§4.1).** For a Hilbert cusp form g = θ_{P_1} − θ_{P_2} and ℓ ≫ 0, the paper constructs real-analytic Hilbert modular forms δ̂ with L_{τ_1}δ̂ = g^ℓ(θ_N − θ_N(·, h)) (Theorems 4.1, 4.3). The existence proof uses ampleness of a twisted Hodge bundle on a toroidal compactification and a ∂̄-argument.
- **Pairing with Borcherds lifts (§§4.2–4.4).** Pairing the holomorphic part of E_P̃ δ̂ with weakly holomorphic Whittaker forms is expressed through Bruinier's regularized theta lifts and Borcherds products over totally real fields. Differences cancel the unknown locally constant factors, which gives algebraicity (Theorem 4.10).
- **Partition of unity (§§2–3).** The embedding trick is replaced by a partition of unity by diagonal restrictions of Eisenstein and theta series (Proposition 3.4). It rests on non-vanishing results (Lemmas 3.2–3.3), which come from a lemma on vanishing exponential sums (Lemma 2.9).
- **Reduction to the diagonal (§2.2).** A generalized Rankin–Cohen operator 𝒟 brings the Hilbert data to the diagonal (Lemmas 2.2–2.3).

## What the atlas already has

**Library (1 item).** Mathlib's SL_2(Z) modular forms, Eisenstein series, the Gamma function and the hypergeometric series.

**Planned (8 items).**
- Harmonic Maass forms and ξ (QM.3).
- The Weil representation and theta kernels (MP.4, MP.5).
- Baily–Borel (ShimuraVarieties V2), toroidal compactifications and Koecher (ShimuraCompactifications C2, C6).
- Dolbeault resolution and analytic vanishing (ComplexComparisonPartII C1–C2).
- Canonical models and CM reciprocity (ShimuraVarieties V4, V6).
- CM points on X_0(N) (HE.1).

**Not in the atlas.** Nothing plans:
- higher Green functions or their CM values;
- Hilbert modular forms as a carrier with rational structures;
- harmonic Whittaker forms or regularized theta lifts over totally real fields;
- the Siegel–Weil formula.

**Related candidates.** GSpinSpecialDivisorHeights (from PAPER-SHANKAR-SHANKAR-TANG-ETAL-22) builds the s = σ_0 + 1 Borcherds–Bruinier Green functions, and the new Part II imports them. Bruinier–Ehlen–Yang 2021 is issue #1288, not yet extracted.

## Routes

1. **Source → GeometryOfNumbersAndQuadraticArithmetic:GN.2** (2 items):
   - Proposition 2.6 (totally positive Z-unimodular O-lattices exist);
   - Chang's criterion and Hecke's theorem that the different is a square.
2. **Source → GN.3** (1 item). Siegel's formula for definite lattices and the Hecke Eisenstein expansion (3.10)–(3.11).
3. **Source → MetaplecticAutomorphicForms:MP.6** (1 item). The Siegel–Weil formula in signature (n, 2) and the sections λ(φ) ∈ I(s_0, χ_V).
4. **Source → SchemeAndStackFoundations:SF.0** (1 item). Relative ampleness of O(1) on blow-ups, used in Theorem 4.1.
5. **Part II → HigherGreenFunctionCMValues**, "Gross–Zagier formulas and arithmetic heights, Part II: CM values of higher Green functions on orthogonal Shimura varieties" (25 items; new; parent GrossZagierAndArithmeticHeights, area `automorphic`).
   - **Contents:** everything specific to the paper.
     - GSpin Shimura varieties over F, and special and CM cycles.
     - Higher Green functions.
     - Hilbert modular form carriers.
     - Rankin–Cohen and 𝒟.
     - Lemmas 2.8–2.9 and 3.2–3.3, Proposition 3.4.
     - Theorems 4.1 and 4.3, Proposition 4.2.
     - Whittaker forms, regularized theta lifts and Borcherds products over F.
     - Lemmas 4.5–4.6, Proposition 4.8, Theorem 4.10.
     - The main theorems.
     - The quoted results of Bruinier–Ehlen–Yang and Bruinier–Kudla–Yang.
   - **Why a Part II:** GZ.0–GZ.9 and the existing GZ Part II candidates plan heights of special cycles and Gross–Zagier formulas. None of them plans CM values of Green functions, the direction of Gross–Zagier's singular-moduli work that this paper and Bruinier–Ehlen–Yang continue.

## Source issues (`sourceIssues` E1–E9)

All nine are in the published text.

- **E1 (error, Lemma 2.8, p. 394).**
  - **Problem:** the hypothesis is only that "θ_1, …, θ_N are Q-linearly independent irrational numbers". As stated the lemma is false: θ_1 = √2 and θ_2 = 1 − √2 satisfy e(nθ_1)e(nθ_2) = 1 for all n.
  - **Fix:** it needs 1, θ_1, …, θ_N linearly independent, as Kronecker's theorem does. The application in Lemma 2.9 has this.
- **E2 (error, Lemma 2.9, p. 394).**
  - **Problem:** with no condition on the moduli |c_i| the lemma is false. Take F(x) = ∏_{k≥1}(1 − x/2^k) with Taylor coefficients α_i and c_i = 2^i. Then Σ|α_i| < ∞ and φ(s) = F(2^s) = 0 for all s ≥ 1, but α_0 = 1 (checked numerically).
  - **Fix:** add the hypothesis that only finitely many |c_i| exceed any ε > 0. This holds in Corollary 2.11 (s_0 > 0) and in Lemmas 3.2–3.3, so the main results are unaffected.
- **E3 (misprint, proof of Lemma 3.2, p. 400).**
  - **Printed:** "∏ c(β_i, g_iτ_0) = 0 for all β_1, …, β_N".
  - **Correction:** (∏_{i=0}^N c(β_i, g_iτ_0))^{−𝔯} = 0 for all β_0, …, β_N.
- **E4 (misprint, proof of Lemma 3.3, p. 400).**
  - **Printed:** "E_P(τ_0) = c_K Σ …".
  - **Correction:** c_K^{−1}, as in (3.10).
- **E5 (misprint, Theorem 4.3(2), p. 405).**
  - **Printed:** "(θ_{P_2} − θ_{P_2})^ℓ", which is identically 0.
  - **Correction:** (θ_{P_1} − θ_{P_2})^ℓ.
- **E6 (gap, proof of Theorem 4.1, p. 404).**
  - **Problem:** the proof identifies O_X̃(−E) for the reduced boundary E with O(1) of the blow-up. Stacks gives O(1) = O(−D) for the exceptional divisor D, which has multiplicities from the polarization function. On a Hirzebruch cusp resolution with a (−2)-curve, −E is not π-ample.
  - **Fix:** twist by D and enlarge ℓ_0 in Proposition 4.2.
- **E7 (misprint, Theorem 1.7, p. 379, and §5.1, p. 415).**
  - **Printed:** "n = 4" and "d = 2 = n/2".
  - **Correction:** n = 2, i.e. n + 2 = 2d = 4.
  - **Why:** otherwise the proof (L = N_0, weight-(1, 1) Eisenstein series, λ_2 = 0) does not apply, and Remark 1.8's deduction for X_0(1)², which has signature (2, 2), fails.
- **E8 (gap, proof of Theorem 1.1, p. 416).**
  - **Problem:** Example 2.7 and Theorems 1.3 and 1.7 need F = Q(√(d_1d_2)) to be a field. The case where d_1d_2 is a square (E_1 = E_2) is not treated. The arXiv TeX has a comment saying this case is covered.
  - **Fix:** use Bruinier–Ehlen–Yang Theorem 6.1, the same-field case deduced from their Theorem 5.5 and Corollary 5.6. It strengthens Viazovska, who only obtains α ∈ Q̄.
- **E9 (misprint, proof of Theorem 4.10, p. 413).**
  - **Problem:** Q(z, h) has exponent (−1)^i C(ℓ, i), while the alternating sum above it uses (−1)^{ℓ−i} C(ℓ, i). The result is off by the sign (−1)^ℓ.
  - **Effect:** none on the theorem, since the sign is absorbed into λ.

The items use the corrected statements.

## Prerequisites not yet covered

1. Bruinier–Ehlen–Yang, *CM values of higher automorphic Green functions for orthogonal groups* (Invent. Math. 225, 2021). This is issue #1288.
2. Bruinier, *Regularized theta lifts for orthogonal groups over totally real fields* (Crelle 672, 2012).
3. Bruinier–Yang, *CM values of automorphic Green functions on orthogonal groups over totally real fields* (ALM 19, 2011).
4. Bruinier–Kudla–Yang, *Special values of Green functions at big CM points* (IMRN 2012).
5. Bruinier–Funke, *On two geometric theta lifts* (Duke 125, 2004).
6. Borcherds, *Automorphic forms with singularities on Grassmannians* (Invent. Math. 132, 1998).
7. Bruinier, *Borcherds products on O(2, l) and Chern classes of Heegner divisors* (LNM 1780).
8. Gross–Zagier, *Heegner points and derivatives of L-series* (Invent. Math. 84, 1986).
9. Ash–Mumford–Rapoport–Tai, *Smooth Compactifications of Locally Symmetric Varieties* (2nd ed.).
10. Chang, *Diskriminanten und Signaturen gerader quadratischer Formen* (Arch. Math. 21, 1970).
11. Kudla, *Algebraic cycles on Shimura varieties of orthogonal type* (Duke 86, 1997).
12. Andreatta–Goren–Howard–Madapusi Pera, *Faltings heights of abelian varieties with complex multiplication* (Ann. of Math. 187, 2018).
13. McGraw, *The rationality of vector valued modular forms associated with the Weil representation* (Math. Ann. 326, 2003).
14. Bruinier–Yang, *CM-values of Hilbert modular functions* (Invent. Math. 163, 2006).

DOIs were checked against Crossref. The ALM volume has no DOI.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LI-23.result.json` passes.
- The generator asserts that every missing item is routed exactly once.
- No accepted restructure touches the cited stages.
- **Checked by hand:**
  - §2: Example 2.1, Lemma 2.2, Proposition 2.6.
  - Lemmas 2.8–2.9 (the counterexample was evaluated numerically).
  - §3: Lemmas 3.2–3.3, Proposition 3.4.
  - §4: Theorem 4.1 and Proposition 4.2 (whence E6), Lemma 4.6, Proposition 4.8, Theorem 4.10.
  - §5: the weight bookkeeping in §5.1 and the linear algebra in §5.2.
- No Lean was written or compiled; this is an extraction.
