# Review: PAPER-YUAN-ZHANG-18 (Yuan–Zhang, On the averaged Colmez conjecture, with the authors' erratum)

Job `REV-PAPER-YUAN-ZHANG-18` (issue #1146), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-442dc5` and Codex session `a71f92`. **Verdict: accept**, after the corrections below, which were made in place. All nine routes are accepted.

## What was read

- **The published paper**, Ann. of Math. 187 (2018), 533–638 (106 pp.), read in full again. It is free on the Annals site, with the same SHA-256 (29dfd5f1…) as the extraction's.
- **The authors' erratum**, revision of 18 December 2022 (Erratum5.pdf, 11 pp., the same SHA-256 18b46acd…), read in full. The journal version, Ann. of Math. 198 (2023), 867–878 (doi:10.4007/annals.2023.198.2.8), is behind the paywall.
- **arXiv 1507.06903v3** was compared wherever a passage was in doubt.
- **Method:**
  - Four checkers split the work: §§1–3 with erratum §1; §§4–5 with erratum §§2–3; §§6–7; §§8–9. Each compared every item with the text and recorded mistakes checked on page images.
  - I checked the main new findings myself. For the S2 computation of Lemma 7.6(2), I redid the Whittaker series by hand (below).

## Changes made to the extraction

- **Statements:** 49 corrected. Among them:
  - Theorems 1.6 and 1.7 (height-bridge, quaternion-height) and the quaternion datum now state U = Ô_𝔹^× with Ô_𝔹 ⊇ Ô_E, and that X_U is compact (E28, E29).
  - cotangent-tensor and determinant-cancellation are restricted to F_℘/Q_p unramified, or given a direct proof (E31, E32).
  - pseudo-comparison has the global δ, not δ∞.
  - pseudo-automorphic no longer assumes a common ambient space.
- **Locators:** 67 corrected.
- **Statuses:** 7 changed from missing to planned.
  - mixed-kernel, whittaker, holomorphic-projection, hecke-height-series and series-automorphy are planned at GZ.6, which names each of them.
  - kisin-free and kisin-classification are planned at R07.4.
  - All seven stay in their source routes, as the extraction's planned items do.
- **Library citations:** all six exist at the pinned commits and say what the items say: `NumberField.IsCMField` and `complexConj`, `NumberField.prod_abs_eq_one`, `Matrix.det_vandermonde`, `Complex.Gammaℝ`, Tau Ceti's `AbelianVariety` and `cartierDuality`.
- **The extraction's own repairs:** all five are **sound**: hodge-polynomial-sequence (E5), corrected-nearby (erratum Theorem 1), height-bridge (with the corrected U), integral-ks (E8) and modified-projection (E18).
- **New items (24):**
  - **3 planned:**
    - Kisin's classification of connected finite flat group schemes (R07.4);
    - ξ̂-admissible arithmetic extensions (GZ.2);
    - Čerednik–Drinfeld uniformization (R18.5).
  - **21 missing:**
    - 4 to the CM Part II, among them the Faltings height h(Φ), the CM point P_U with its Hodge height, and the existence of the auxiliary quaternion datum, which the paper leaves implicit;
    - 5 to HilbertModularVarietiesAndShimuraCurves;
    - 3 to FiniteFlatGroups;
    - 7 to GrossZagierAndArithmeticHeights, among them the corrected CM multiplicity of [YZZ13, Lemma 8.6];
    - 1 to MetaplecticAutomorphicForms;
    - 1 to ArakelovGeometryAndAbelianHeights (the kernel of the dual isogeny, from the erratum's Proposition 6).
- **Part II brief:** a corrections paragraph lists the constraints below.
- **Summary:** a closing paragraph gives the counts after the review and the conclusions below.

## Mistakes in the paper (`sourceIssues`, E1–E55)

- **E1–E23**, the extraction's, are all confirmed on page images.
  - **E1:** Theorem 2.7 is on p. 549. The erratum's Theorem 1 suffices, since Corollary 2.6 never uses Theorem 2.7 and Theorem 1.6 uses it once (p. 577), in the case the erratum verifies.
  - **E3** is reclassified from a misprint to a **gap in the proof**. The erratum's Proposition 6 assumes the τ-parts are locally free of rank 2, which fails where F or E/F is ramified.
  - **E13 and E15** now affect "a stated result", of [YZZ13] and [Zha01]. This paper already prints the corrections, so nothing here is affected. E15's `printed` field now quotes Zha01, Lemma 5.5.2, and its correction was checked against Gross's canonical lifting.
  - **E14:** the recorded correction is incomplete. Even after ψ1 → ψ2, the third conclusion is false; see E43.
  - **E17** is reclassified from a gap to an **error in the proof**. F_v^×GL2(O_{F_v}) fixes only the standard vertex. Lemma 8.9 still holds from the second display on p. 623.
  - **E9:** the correction's π^{-1} should be π.
  - **E23:** the slip is on p. 564 and again on p. 565.
- **E24–E55** are new.
  - **Gaps in stated results:**
    - **E28:** Theorems 1.6 and 1.7 assume only "U maximal containing Ô_E^×", but their proofs (p. 576; the step on p. 591) use Ô_𝔹 ⊇ Ô_E.
      - The two differ when a place of F above 2 with residue field F_2 splits in E.
      - Example: F = Q, E = Q(√−7). The stabilizer in GL2(Q_2) of L = {(x, y) ∈ Z_2² : x ≡ y mod 2} is maximal compact and contains O_{E,2}^×, but End(L) does not contain diag(1, 0).
      - For such U the CM point has conductor 2 at v, so the statements are probably false there, but that is not proved. Theorem 1.1 is unaffected, since U can be chosen.
    - **E29:** Theorem 1.6 is proved only for compact X_U. §4.1 assumes compactness, and its "the results hold in general with taking care of cusps" is not proved.
  - **Errors in stated results, which cancel:**
    - **E43:** Lemma 7.6(2) is false at v ∈ S2. c_{φ_v}(1, y, u) = −2 log N_v/(1 + N_v + N_v²) on ϖ^{-1}(O_𝔹)_2 × O^×, not 0.
      - For ψ2, the substitution z_i = ϖ^{-1}z_i′ turns the n-th volume into N^{-n}(1 + (1 − N^{-1})(n + 2)).
      - Against the prefactor (1 − X)²/(1 − X/N) with X = N^{-s}, the extra 2(1 − N^{-1})X/(1 − X) contributes 2 log N_v at s = 0. The paper claims "still gives 0".
    - **E51:** Lemma 8.7(2) is false at v ∈ S2. n_{φ_v}(1, 1) = −1/(1 + N_v + N_v²), not 0. A brute-force count at p = 2 and p = 3 confirms it.
    - **Effect:** the two errors cancel in d_{φ_v}, so Proposition 9.2(2), Theorem 9.1 and Theorem 1.7 stand. Two checkers found them independently.
  - **Errors and gaps in proofs:**
    - **E31:** "W(I_y) = 0" (p. 575) is false when F_℘/Q_p is ramified. The τ-quotients then have torsion, the displayed sequences need not be left exact, and Proposition 5.4 and Corollary 5.5 need an integral argument the paper does not give.
    - **E32:** identity (3) in the deformation display compares modules of O_K-rank 2 and 1. The universal-deformation claim is false for bare O_{E,p}-modules. Corollary 5.5 still follows directly from Proposition 5.4.
    - **E30:** the crystal ranks on p. 569 are wrong when [F_℘ : Q_p] > 1. The proof of Theorem 4.10 uses only the O_℘-relative rank-2 pieces.
    - **E35:** [Kis06] does not cover p = 2; the paper cites Kim, Lau and Liu later.
    - **E40:** the erratum's proof of Theorem 2 leaves out the automorphism-extension step. It is easily filled.
    - **E44:** (6.2.1) leaves out the discriminant characters of the complements. The general proof of Lemma 6.1(2) fails, but the uses in §9 are fine.
  - **Errors that affect nothing:**
    - **E24:** "E is totally real or CM" (p. 544) is false in general.
    - **E52:** the constant term in the proof of Theorem 9.1 is nonzero but not always positive; its sign is ∏(−1)^{v(d_v)}.
  - **The rest (20) are misprints.**
- **Effect:**
  - Theorem 1.1 still holds, since AGHMP18 prove it independently.
  - On this paper's own route, E28 and E29 are avoided by choosing the auxiliary datum. The ramified-prime gaps (E3, E30, E31) remain for the FiniteFlat and Part II layers to close.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-YUAN-ZHANG-18.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once. Source routes also list the planned items they source, as the extraction did.
- Every stage id exists in the atlas.
