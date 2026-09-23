# Review: PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22 (Fakhruddin–Khare–Patrikis, Lifting and automorphy of reducible mod p Galois representations over global fields)

Job `REV-PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22` (issue #1283), by Claude Code, session `cc-38267a`, 23 September 2026. The extraction was written by Claude Code, session cc-39fac3. **Verdict: accept**, after the corrections below, which were made in place. The five routes are all accepted, unchanged in kind.

## What was read

- **arXiv v5** (15 October 2021, 58 pages), read in full: the extraction's file, SHA-256 6c260021acef4649492892fc266f703aa69401879bf87e1c2492bf2ef24ff1e2. Its TeX source (https://arxiv.org/e-print/2008.12593v5, SHA-256 e28679d986980445b06627acffdedbb0862ef568bdbd52b23f904d661da1de43) was used to quote and to check formulas. The published Inventiones text is paywalled and was not read, as for the extraction.
- **Method.** Four checkers split the paper: §§1–3, pp. 1–19; §§4–6, pp. 19–31; §§7–9, pp. 31–43; Appendices A–B, pp. 43–58. Each:
  - compared every item with the page images and the TeX;
  - listed what no item covers;
  - checked the recorded mistakes and looked for new ones.

  I re-derived the substantive findings myself in the TeX (see "Mistakes"). For the appendix errors I rebuilt each counterexample by hand: the GL_2 invariant for Lemma A.9, the three characters for its condition (3), the conjugation for Lemma A.10, the Siegel action X ↦ ν^{−1}AXᵗA and the centre of GSp_4, and the SL_2 case of Example A.17.
- **Imported sources**, read to check what the paper uses:
  - FKP19 (arXiv 1904.02374v5): Notation 5.1, §6 (Lemma 6.4, Proposition 6.8 and the proof of Theorem 6.11) and Appendices A–B, including the hypothesis of Corollary B.2;
  - Allen–Newton–Thorne, Theorem 1.1 (arXiv 1912.11269v2, p. 2);
  - Pan, Theorem 1.0.2 and §6.1 (arXiv 1901.07166v2).

  Skinner–Wiles was not read. Item 50 now states its hypotheses in the form the proof of Theorem 7.4 arranges them.
- **The atlas.** I read, in `data/atlas.json`, the descriptions of the layers the new planned items use:
  - AutomorphicGaloisRepresentations R19.5;
  - AutomorphicGaloisRepresentationsPartII AG2.2 and AG2.6;
  - PotentialModularityAndCompatibleSystems R24.5:operations;
  - ModularityAndLanglandsExtensions ML.2 and ML.5;
  - EndoscopicTransferAndUnitaryTraceComparison ET.7a;
  - AlgebraicModularFormsAndSerreWeights R15.5.

  A search of the whole atlas for complete reducibility and centralisers found only LanglandsParameterStacks LP2, which is about parameters, not finite groups.

## Items

**Corrected: 58 items.** Each item's note says what changed. The material ones:

- **§3.**
  - 17: Proposition 3.6 now has the inductive quantifier order of its proof (E10).
  - 21: the local lifts at S that the initial lift ρ_2 needs (E12).
  - 22: Proposition 3.8's two root vectors differ, X′_n = −2X_n (E13).
- **§§5–6.**
  - 29: the FKP19 attributions (Definitions 3.1, 3.4; Lemma 3.5 is the Selmer conditions).
  - 33: Proposition 5.4 is about the relative classes φ̄, ψ̄.
  - 41: Corollary 6.6 gains oddness and absolute M-irreducibility (E21, E22).
  - 42: Remark 6.7 corrected (E23).
  - 43: Example 6.8 records its conditions and the corrections they need (E24–E26).
- **§9.**
  - 66: the Hodge–Tate sign (E33).
  - 67: restated from Allen–Newton–Thorne's Theorem 1.1: an imaginary CM base, 'ordinary of weight λ', the Steinberg place, (7) and p > 3, p ∤ 2n.
  - 71: Dynkin needs "reductive"; the ℓ-independence of the rank became an explicit clause.
  - 72: the weight lattice, and the gap E32.
- **Appendix A.**
  - 78: Guralnick only; the FKP19 inputs moved to new item 117.
  - 80: Lemma A.9's H⁰ clause and its condition (3) (E36, E37).
  - 81: Lemma A.10 gains a polarization hypothesis (E38).
  - 82: Lemma A.11: n′ ≠ n″, the similitude, and the definition of ρ̄′_M in case (3) (E39, E40).
  - 85: Example A.16's χ and Example A.17's missing cases (E40, E41).
- **Minor:** 2–4, 13–16, 19, 23–25, 27, 28, 30, 31, 35–40, 44, 46, 47, 50, 53, 54, 59, 61, 63–65, 68, 73, 76, 79, 84, 91.
- **Locators:** 24, 39, 41–43, 51, 59, 69, 78, 88.

**New: 25 items.** The totals are now 119 items: 13 planned and 106 missing.

- **Planned (5)**, each against a layer description that was read:
  - local–global compatibility at p for newforms (R19.5);
  - the Galois representations of RACSDC representations (AG2.2, AG2.6);
  - compatible systems (R24.5:operations, AG2.6);
  - CM base change and descent (ML.5, ET.7a, as in the review of PAPER-CLOZEL-THORNE-17);
  - Deligne–Serre (R15.5).
- **Missing, route 1 (19):**
  - oddness (95);
  - FKP19's conventions and inputs: Notation 5.1 (96), Q_N and L^α_{r,v} (102), the annihilation and finishing argument (103), Lemma 6.15 (104), Lemma 5.13 (105), Claim 6.13 (106), the Lie-theoretic lemma (107), Appendix A (117);
  - the paper's implicit lemmas: ramification forces disjointness (97), root vectors avoid subspaces (98), the cyclotomic tower (99), the mod ϖ² lift (100), duality at trivial primes (101), the exponential (115), the semisimplified adjoint representation (116);
  - the determinant construction of Theorem 7.4 (109);
  - Serre's semisimplification (108) and Steinberg's centraliser theorem (118).
- **Missing, route 2 (1):** the Nekovář–Patrikis semistability criterion (119).

**Prerequisites.** Eight were added, with DOIs checked on Crossref where they exist: Serre 2005, Steinberg 1975, Nekovář 1993, Patrikis 2016, Pan 2022, Skinner–Wiles 1999, Deligne–Serre 1974, and Larsen–Pink 1992. Larsen–Pink is not cited by the paper; it is marked as the standard source for the ℓ-independence used on p. 43.

## Routes

1. **Part II `GlobalGaloisDeformationsPartIIGValuedLifting`: accept.**
   - No layer or candidate plans Ramakrishna-style lifting. GlobalGaloisDeformations builds rings for patching over number fields.
   - The proposed GValuedDeformationsAndPotentialAutomorphy uses the Khare–Wintenberger method, which Remark 7.8 shows fails here.
   - Nineteen items were added.
   - An addendum to the brief lists the corrected statements the design job must use.
2. **Source of LocalGaloisDeformationRings R08.2/R08.6/L7: accept.** One item was added, and E43 was recorded.
3. **Source of ArithmeticGaloisDuality R02.3/R02.4/R02.6: accept.**
4. **Source of ModularityAndLanglandsExtensions ML.2: accept.** The §9 inputs planned in AG2.2, AG2.6, R24.5:operations, ML.5 and ET.7a were added as planned items.
5. **Coalesced PolarizedAutomorphyLifting: accept.** These are the owners the Newton–Thorne and Clozel–Thorne reviews chose. Item 67 was restated from the source.

## Mistakes in the paper (`sourceIssues`)

**Recorded by the extraction: E1–E7, all confirmed** on the page images and in the TeX.

**New: E8–E44.** Each was checked on the page image and in the TeX; I re-derived the substantive ones myself.

**Errors in stated results.**
- **E21 (Corollary 6.6, p. 30).** Oddness is omitted, although the proof applies Theorem 5.2, which requires it.
  - As printed, the corollary would lift an even χ_1 ⊕ χ_2 : Γ_ℚ → GL_2(k) to a geometric irreducible representation.
  - Once oddness is added, ρ̄′ is odd, because H¹(Γ_{F_v}, A(k)) = 0 for v | ∞.
- **E22 (Corollary 6.6).** The Lemma A.14 alternative needs ρ̄ absolutely M-irreducible, a standing hypothesis of Lemma A.14. A GL_3 example satisfies the H⁰ condition without it.
- **E23 (Remark 6.7).** "No proper subtorus" does not give the H⁰ condition. For SL_2 and ρ̄ = diag(χ, χ^{−1}) with χ quadratic, H⁰ = 𝔰𝔩_2.
- **E24 (Example 6.8).** In the dihedral case, H⁰(ρ̄(𝔤^der)^*) ≠ 0 for δ = ε_Kκ̄^r. This δ is odd for K imaginary and r even.
- **E25 (Example 6.8).** The character of Lemma A.14 is κ̄^{r−1}δ^{−1}, not κ̄^{r−1}, so the criterion depends on δ.
- **E30 (Remark 8.2).** "p ≫_n 0" is false. Take F = 𝔽_q(t) with q ≡ −1 (mod p) and ρ̄ induced from 𝔽_{q²}F.
- **E32 (Proposition 9.1).** GSp_{2n}-irreducibility over F(ζ_p) does not make each constituent absolutely irreducible there, as [ANT20, Theorem 1.1(7)] requires.
  - Counterexample: Ind σ ⊕ ρ̄_2, with σ defined over a quadratic subfield of F(ζ_p).
  - The fix is an added hypothesis.
- **E36 (Lemma A.9).** H⁰ ⊂ 𝔷(M) fails for non-split ρ̄. What holds is that the image of H⁰ in 𝔪 lies in 𝔷(M), injectively.
- **E37 (Lemma A.9(3)).** The pairwise condition fails for three summands: ψ_0 ⊕ ψ_0^{−1}κ̄ ⊕ 1 satisfies it, yet (C3) fails.
  - The condition must be imposed jointly.
  - As printed, the proof of Corollary 8.4 covers only r = 2.
- **E38 (Lemma A.10).** Complex conjugation acts by x ↦ −Aᵗx A^{−1}, not x ↦ −ᵗx, so (C1) fails without a polarization hypothesis.
- **E40 (Lemma A.11(2), Example A.16).** The Siegel Levi acts on 𝔲 by Sym² ⊗ ν^{−1}. The conditions must involve the similitude δ, and χ = det(ρ̄_1)·δ^{−1}.
- **E41 (Example A.17).** The m = 0 cases of D(n, 1, N) are dropped; ρ̄ = (1 ∗; 0 κ̄) is a counterexample.
- **E13 (Proposition 3.8).** The two root vectors differ. This is harmless downstream.

**Gaps in proofs** (all with routine repairs, recorded in the issues):
- E12: the initial lift needs local lifts at S.
- E16: FKP19 Corollary B.2 is applied to Γ_F̃, whose invariants need not vanish when G ≠ G^0.
- E17: γ_2 in Proposition 5.4 fails when 𝔤^der has several simple factors, because FKP19 reduces to one factor using images, not values.
- E18: η(ϖ′) ∉ G(K′) in Lemma 6.1.
- E19, E20: §6 multipliers and H⁰ transfer.
- E28: the character ω in Theorem 7.4 must be trivial on Art(p) to inflate.
- E31: non-split ⇒ non-injective in Corollary 8.3.
- E35: Lemma A.4.
- E42: Lemmas A.5, A.14, A.18.
- E43: Lemma B.3's ideal misses the central condition.

**Errors affecting nothing, and misprints:**
- errors: E8 and E9 (two expository claims on p. 3), E26;
- gaps: E10 and E11;
- misprints: E14, E15, E27, E29, E33, E34, E39 and E44.
  - E39 ("n is odd" in Lemma A.11(1)) affects the proof of Corollary 8.3.
  - E33 (the ordinary Hodge–Tate sign) contradicts the paper's own "increasing".

**Not recorded:** low-confidence doubts the checkers could not settle.
- At p = 2, "at least two non-isomorphic ρ̄" in §1 is not justified.
- NSW's global theorems for S = ∅ over function fields.
- Transitivity of Γ_F on the simple factors in Proposition 5.4 (an FKP19 point).
- Whether [Ser05, Proposition 3.3] gives G(k)-conjugacy over a finite k.
- The stabiliser remark in Lemma 6.1.
- For Example 6.8 with non-dihedral ρ̄_f, whether (C3) holds for every odd δ.
- The regular unipotent at the residue characteristic of v_0 in Proposition 9.1.
- The finite-order choice of μ in Theorem 8.1.
- The crystalline case r = 2 of Theorem 7.4.
- The h′ count in Lemma B.4.
- The constant n_G of Remark A.15.
- The numbering of [Con14] and [BLGGT14, 3.1.2].

**Published corrections:** none found. Crossref records no update for doi:10.1007/s00222-21-01085-7 (re-checked on 23 September 2026). The last arXiv version is v5.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: no problems.
- Every missing item is routed exactly once. Item ids run 1–119 without gaps. Every changed item carries a review note.
- Lean: none (a review of an extraction).
