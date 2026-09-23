# Review: PAPER-NEWTON-THORNE-21 (Newton–Thorne, Symmetric power functoriality for holomorphic modular forms)

Job `REV-PAPER-NEWTON-THORNE-21` (issue #1449), by Claude Code, session `cc-38267a`, 23 September 2026. The extraction was written by session `cc-39fac3`. **Verdict: accept**, after the corrections below, which were made in place. All seven routes are accepted, and route 8 was added by the review.

## What was read

- **The published version**, read in full: Publ. Math. IHÉS 134 (2021), 1–116, the open-access PDF the extraction used (SHA-256 ef76912a…).
- **The arXiv v3 TeX and PDF:** https://arxiv.org/e-print/1912.11261v3 and https://arxiv.org/pdf/1912.11261v3.
  - A word-level comparison of the two PDFs found no differences beyond typesetting and bibliography formatting.
  - The journal prints a stray label "(nb)" on p. 86, where the TeX has an unlabelled item (E4).
- **Method:** four checkers split the paper (Introduction and §1, pp. 1–26; §2, pp. 27–60; §§3–5, pp. 60–86; §§6–8, pp. 86–110). Each:
  - compared every item's statement and locator with the text;
  - listed definitions and key theorems that no item covers;
  - checked the recorded mistakes and searched for new ones on page images.

  I re-derived every substantive finding myself (see "Mistakes"), and checked every cited layer description and every layer proposed for a new item in `data/atlas.json`.
- **Libraries:** there are no library items. The new items were searched in Mathlib 082e2d3 and Tau Ceti f790474. Tau Ceti has the Chebotarev Frobenius prime sets but not the density theorem; the libraries contain none of the other items.

## Items

- **Statements corrected (about 40 items).** Each item's note says what changed. The material ones:
  - **10:** the multiplicity-free hypothesis is on the residual r̄_{σ,ι}.
  - **12:** η uses μ_{(−1)^q}, μ_{(−1)^p}, with μ_+ = 1, μ_− = μ, not powers of μ.
  - **34–36:** the standing hypotheses of §1.17, without which Lemma 1.21 fails.
  - **48:** Remark 2.16 shows the density of U′, which is adjoined to X_alg.
  - **52 and 47:** ρ_v must be defined over E.
  - **95:** the conditions on Σ that define R^{St}_v.
  - **98:** Corollary 5.4 gives a lift of G_{F⁺,S∪Σ} (E15).
  - **101:** Theorem 5.7's order condition is on G_{F(ζ_p)}; the item claimed a stronger theorem than the paper proves.
  - **104:** how BLGGT14 Theorem 3.1.2 is applied, to a residually reducible r̄_1 and with a modification of its proof.
  - **119:** Edixhoven's criterion needs level prime to p.
  - **121:** π_0 = π_1 ⊞ π_2 is an isobaric sum, not cuspidal.
  - **125:** the localised module, the Hodge–Tate condition and the patching conclusion.
  - **126:** soluble descent; the Arthur–Clozel dichotomy became item 163.
  - **Minor:** items 9, 15, 28, 37, 45, 53, 62, 69–71, 74, 80, 86–89, 92, 100, 102, 103, 106, 107, 111 and 116.
- **Locators:** 85 (pp. 62–63) and 112 (pp. 89–90).
- **New items (38).** The totals are now 164 items: 38 planned and 126 missing.
  - **Planned (17)**, each against a layer description that was read:
    - definitions: regular algebraic/polarizable/RACSDC (127); Weil–Deligne representations and Art (129); normalised induction (130); Sym^{n−1}π (134); Λ(Sym^n E, s) (137); Bloch–Kato H¹_f and H¹_g (140);
    - theorems: algebraic Hecke characters (128); Mœglin–Waldspurger (131); temperedness (132); modularity of semistable elliptic curves (135); Godement–Jacquet (136); the two Zelevinsky results (146, 147); the Bellaïche–Chenevier sign (155); characteristic-zero points (161); Arthur–Clozel cyclic base change (163); Chebotarev (164).
  - **Missing (21):**
    - route 2: Conrad (145), the base-change morphism of Theorem 2.33 (149), Chevalley (150), Sen (157), the mod-5/7 input (158), boundary-annulus weights (159), Weston/Diamond–Taylor (160);
    - route 3: Kazhdan–Varshavsky (133), the §4 level and types (153), the auxiliary field of Lemma 6.7 (162);
    - route 4: BHS17 Lemme 2.11 (143);
    - route 5: KPX 6.2.8 (138), the Weil–Deligne-to-triangulation dictionary (139);
    - route 7: Allen's genericity (141, 142), Geraghty Lemma 3.9 (144), primitivity (151), generic primes (152), the BLGGT14 operations (154), Bellovin–Gee (156);
    - route 8 (new): the Ribet–Momose large image (148).

## Routes

1. **Source of ML.3: accept.** Items 1, 2 and 5 now note the gap E21 in the printed route.
2. **Part II `SymmetricPowersByAnalyticContinuation`: accept.** No layer plans analytic continuation of functoriality along eigenvarieties, the ping pong, or §8's killing of ramification. Item 73 moved to route 7, seven missing items were added, and the brief records E9–E13, E24 and E25.
3. **Coalesced `SymmetricPowersByUnitaryLevelRaising`: accept.** Three items were added. The brief now records E14, E17, E19, E22 and E23, and above all E21. The design job must supply a conjugate self-dual GL_2 block, or record the odd case of Theorem 7.1 as a gap.
4. **Coalesced `LocalGlobalCompatibilityPartIIEigenvarietyCompanions`: accept.** Item 143 was added.
5. **Coalesced `TriangulineVarietyAndItsLocalModel`: accept.** Items 138–139 were added.
6. **Coalesced `SmoothRepresentationsPartII`: accept.**
7. **Coalesced `PolarizedAutomorphyLifting`: accept.** It gains:
   - item 73, the vanishing of adjoint Bloch–Kato Selmer groups of Newton–Thorne 2020;
   - seven further inputs.

   The review of PAPER-NEWTON-THORNE-21-B chose this candidate as the single owner of the Newton–Thorne 2020 results. With this review, the NT21 and NT21-B extractions agree. PAPER-NEWTON-THORNE-26 routes the same theorem as an ML.3 source; its own review should align it.
8. **Source of AutomorphicGaloisRepresentations R19.3 (the Ribet–Momose large image, item 148): added and accepted,** as for NT21-B.

**Prerequisites.** Clozel–Thorne III was removed, since it is already an atlas paper (PAPER-CLOZEL-THORNE-17). Eight were added: Ribet/Momose, KPX, Allen, Conrad, Sen, Mœglin–Waldspurger, Arthur–Clozel, and Diamond–Taylor.

## Mistakes in the paper (`sourceIssues`)

**Recorded by the extraction: E1–E4, all confirmed on page images.**
- **E1:** z′ ∈ X_{i′} in Lemma 3.3.
- **E2:** G_{F_{−1}} for G_E.
- **E3:** g = q_0 + |T| − 1.
- **E4:** ρ̄_ṽ for ρ̄_v, plus the same slip in Proposition 1.22(4), and the journal's "(nb)".

**New: E5–E26.** Each was checked on the page images and in the TeX. The substantive ones were re-derived by me.

- **E21 (error, p. 100): the most important finding.**
  - In the proof of Proposition 7.4, π_2 = τ_0 ⊗ |·|^{(n−2)/2}ιω_1ω_0^{n−1} is not conjugate self-dual, although Theorem 4.1 requires it (p. 68).
  - The computation. τ_0 comes from GL_2(𝔸_ℚ), so π_2^c ≅ π_2^∨ is equivalent to τ_0 ≅ τ_0 ⊗ (ω_{τ_0}χχ^c)^{−1}. The inputs:
    - ω_{τ_0} = |·|^{1−8k}δ_{K/ℚ}, from det r_τ = ϵ^{−8k}δ;
    - χχ^c = |·|^{n−2}(ω_0ω_0^c)^{n−1} = |·|^{8k−1}, because δ^{n−1} = 1 for n − 1 even.

    So the twist is δ_{K/ℚ}|_{F_0}. It is non-trivial, because F_0 is Y-split and hence disjoint from K.
  - The same computation on the Galois side gives r_τ ≅ r_τ ⊗ δ. That is impossible, because τ is Steinberg at q_1 while a δ-self-twisted representation is induced, with N = 0.
  - By contrast π_{n−2}, twisted by the even power ω_0², is correctly conjugate self-dual. Every twist that keeps the residual representation fails by the same δ.
  - Consequence: the printed proof of Theorem 7.1 for n not a power of 2 has a gap, and so does the printed route to Theorems A, B, E and Corollary C. Remark 7.5 (Anastassiades–Thorne) covers n a power of 2. No result is shown false.
- **E5 (misprint, p. 13):** the printed Galois action on ^L Res_{F/F⁺}GL_n is inconsistent with the printed η. At n = 1 the two sides are (g, g^{−1}) and (g^{−1}, g); with the swap action η is an L-homomorphism.
- **E7 (gap, p. 24):** the Hensel step of Proposition 1.22(3) needs an n_1-th root that need not exist. The statement holds with α = (−1)^{n_1+1} det σ_{ṽ,1}(φ_ṽ).
- **E9 (misprint, p. 56):** the twin map needs ψ|_{ℚ_p^×}, not ψ|_{ℤ_p^×}.
- **E10 (error in a proof step, p. 35):** Schur's lemma makes the two lifts in Lemma 2.12 conjugate, by a scalar square root, not equal. Conjugacy is all the lemma needs.
- **E15 (gap, p. 80):** Corollary 5.4 is stated for G_{F⁺,S}, but the proof gives G_{F⁺,S∪Σ}. It is never used.
- **E16 (gap, p. 79):** Lemma 5.3 should assume Mazur's Φ_p, not topological finite generation.
- **E17 (misprint, p. 65):** ωω^c = (det r·ϵ)^{1−n}. §7's normalisation confirms it.
- **E18 (error in a heuristic remark, p. 66):** the definite unitary group over ℚ exists for n ≡ 0 mod 4. The Hilbert-symbol argument rules out only n ≡ 2 mod 4.
- **E22 (gap, p. 92):** Lemma 6.7's "multiplicity 1" contradicts the rank d|R_i| when |R_i| ≥ 2. One place suffices.
- **E19, E23, E24, E25 (gaps with direct repairs):**
  - E19: the case n_1 = 1 and the base cases of the inductions;
  - E23: the Hodge–Tate weights in Theorem 4.1 and Proposition 5.8;
  - E24: the induction step of Proposition 8.2;
  - E25: the end of Proposition 8.3.
- **E12 (gap):** the neighbourhood U must be shrunk into 𝒯^{HT-reg}_n in Theorem 2.27.
- **Misprints:** E6, E8, E11, E13, E14, E20, E26.

**Not recorded:** two further gaps the checkers raised (pp. 78 and 85) that they could neither confirm nor refute.

**Published corrections:** none was found (Crossref, arXiv, the publisher's pages).

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-NEWTON-THORNE-21.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: no problems.
- Every missing item is routed exactly once, and every planned and route stage id exists in the atlas.
- Lean: none (a review of an extraction).
