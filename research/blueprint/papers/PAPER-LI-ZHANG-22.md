# PAPER-LI-ZHANG-22: On the arithmetic Siegel–Weil formula for GSpin Shimura varieties

Chao Li and Wei Zhang, *On the arithmetic Siegel–Weil formula for GSpin Shimura varieties*, [Invent. Math. 228 (2022), no. 3, 1353–1460](https://doi.org/10.1007/s00222-022-01106-z); arXiv [2106.15038](https://arxiv.org/abs/2106.15038).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1278). Status: **complete**. The whole paper was read and every missing item is routed once. The machine-readable extraction is [PAPER-LI-ZHANG-22.result.json](PAPER-LI-ZHANG-22.result.json): 45 items (3 planned, 42 missing), 5 routes, 15 prerequisite entries and 7 recorded source issues.

**Source.** The Springer PDF blocks scripted downloads, so two versions were read on 2026-09-22.
- **The authors' final version**, [KRO.pdf](https://www.math.columbia.edu/~chaoli/KRO.pdf) on Chao Li's homepage: dated 2 March 2022, 80 pages, SHA-256 `c02a94d47eee2634fda148a162b54bb9aa90855eb140fb809959ab195cabfbdd`. It was read in full, and locators are its pages.
- **arXiv v1** (29 June 2021, the only arXiv version), compared word by word with it. Apart from renumbered equations and wording, the differences are the corrections listed in E7.

## What the paper proves

**Setting.** F = Q_p with p odd, m = n + 1 ≥ 3 and ε = ±1. N = N^ε_n is a connected GSpin Rapoport–Zink space (Howard–Pappas, Kim), V = V^ε_m is its space of special quasi-endomorphisms (Hasse invariant −1), and Z(L) ⊆ N are the special cycles.

**Theorem 1.2.1 = 4.15.1 (local arithmetic Siegel–Weil formula).** For every O_F-lattice L ⊆ V of rank n, Int^ε(L) = ∂Den^ε(L).
- Int^ε(L) is the Euler characteristic of O_{Z(x_1)} ⊗^L ⋯ ⊗^L O_{Z(x_n)}.
- ∂Den^ε(L) is the derivative at X = 1 of the normalized local Siegel series Den^ε(X, L), normalized against H^ε_{m+2k}; the functional equation Den^ε(X, L) = −X^{val(L)}Den^ε(1/X, L) makes the derivative the right invariant.
- This is the orthogonal analogue of the Kudla–Rapoport conjecture proved by the same authors in the unitary case (PAPER-LI-ZHANG-22-B). For m = 4 it was known: Gross–Keating/Wedhorn for ε = +1, Terstiege for ε = −1.

**Theorem 1.3.1 = 12.9.1 (semi-global identity).** For F = Q, p > 2 with hyperspecial K_p, and p-admissible ϕ_K, Int_{T,p}(ϕ_K)q^T = c_K ∂Eis_{T,p}(z, ϕ_K) for all T ∈ Sym_n(Q)_{>0}. The proof is p-adic uniformization of Kisin's model plus Theorem 4.15.1, with the prime-to-p places supplying Whittaker factors.

**Proof of the local theorem.** As in the unitary case, fix L^♭ of rank n − 1 and compare x ↦ Int_{L^♭}(x) with x ↦ ∂Den_{L^♭}(x) on Ω(L^♭) = L^♭_F × W^an, where W = (L^♭_F)^⊥ is now **2-dimensional** — the source of the new difficulties, since W can be isotropic.
- **Horizontal part (§5).** Z(L^♭)_H is the union of the primitive quasi-canonical/Gross–Keating cycles Z(M^♭)° over the horizontal lattices M^♭ ⊇ L^♭ (Theorem 5.3.1), proved with Kim's étale Tate tensors, Tate's theorem and Breuil's theorem. Their degrees (Lemma 5.7.1) give deg Z(L^♭)_H = Den^♭(1, L^♭) (Corollary 5.8.1), and the horizontal identity Int_{L^♭,H} = ∂Den_{L^♭,H} reduces to Gross–Keating (Theorem 7.2.2).
- **Vertical part, geometry (§§6–7).** Z(L^♭)_V is supported on N^red, because the isometry group of the 2-plane W is a **torus**, on which Rapoport–Richartz specialization is trivial (Proposition 6.1.1) — a cleaner argument than the unitary one. The Tate conjecture for the Deligne–Lusztig varieties Y_d (Theorem 6.3.2, via Lusztig's Coxeter eigenvalues) reduces the vertical part to Deligne–Lusztig curves V(Λ) ≅ P¹, and Int_{V(Λ)} = (1 − q, 1, 0) is computed through Drinfeld's space and the self-intersection −2q (Theorem 7.4.1, Lemma 7.4.2). Its Fourier transform is γ_V = −1 times itself (Lemma 7.5.1), and §7.6 upgrades this to all vertex types ("higher local modularity").
- **Vertical part, analysis (§8).** New explicit formulas for orthogonal local densities in both parities of corank (§§3.4–3.6) plus weighted counting identities for full-type lattices (Propositions 8.2.5, 8.2.7) give recurrences for the partial Fourier transform ∂Den^⊥_{L^♭,V} (Proposition 8.1.2).
- **Conclusion (§9).** O(W)(F)-invariant distributions on an isotropic plane with support conditions form a space of dimension 2k (Proposition 9.1.3, via the Weil representation of SL₂, Kudla's S(W)_{O(W)} ≅ I(1) and SL₂ newforms). This forces the matching geometric recurrences (Proposition 9.2.3), and an induction on val(L^♭) finishes (Theorem 9.3.2).

## What the atlas already has

- **Library.** Nothing: no quadratic lattices over local fields with Jordan/fundamental invariants, no local densities or Siegel series, no Rapoport–Zink spaces, Deligne–Lusztig varieties, K-groups with supports or metaplectic Eisenstein series.
- **Planned** (3 items):
  - GeometryOfNumbersAndQuadraticArithmetic GN.2: local quadratic invariants and the classification of quadratic spaces (§2.1).
  - AutomorphicLFunctionsAndLocalFactors AL.0: Fourier transforms and self-dual measures (§2.2).
  - MetaplecticAutomorphicForms MP.4: the adelic metaplectic group and the global Weil representation (§11.3).
- **Not in the atlas.** Everything else, including the two Part II candidates reused below.

## Routes

1. **Part II of GrossZagierAndArithmeticHeights: `GSpinSpecialDivisorHeights`** (22 items), the candidate proposed by PAPER-SHANKAR-SHANKAR-TANG-ETAL-22 (with its title). It takes:
   - special cycles Z(L), flatness of Z(x), minuscule cycles and the Bruhat–Tits stratification;
   - derived cycles, Int(L), properness, horizontal/vertical parts and the cancellation law;
   - quasi-canonical and Gross–Keating cycles, Theorem 5.3.1 and the degrees;
   - Proposition 6.1.1, Theorem 6.3.2 and the whole Fourier analysis of §7 (including the −2q self-intersection and local modularity);
   - Propositions 8.1.2 and 9.2.3, Theorem 9.3.2 and Theorem 4.15.1;
   - the global side: incoherent Eisenstein series, Int_{T,p} and Theorem 12.9.1.

   This is the orthogonal counterpart of `UnitaryKudlaRapoportCycles`; the brief says to build the two in parallel rather than duplicate them.
2. **Part II of ShimuraVarieties: `OrthogonalIntegralModelsAndKugaSatake`** (8 items), the candidate proposed by PAPER-CHARLES-16 and extended by PAPER-SHANKAR-SHANKAR-TANG-ETAL-22 (whose title is reused):
   - GSpin Rapoport–Zink spaces, the crystal V_crys with its projector, Grothendieck–Messing, the exceptional isomorphisms for m ≤ 5;
   - étale Tate tensors and special endomorphisms over O_K;
   - the GSpin Shimura datum, Kisin's models with the Kuga–Satake abelian scheme, the special cycles on them, and p-adic uniformization.
3. **Source of GeometryOfNumbersAndQuadraticArithmetic GN.3** (10 items): the entire local-density package — Definition 3.1.1, the finite-field counts of §3.2, Cho–Yamauchi and the induction formula, the odd and even corank Siegel series with Ikeda's functional equations, horizontal lattices, the §8.2 counting identities and Lemma 9.3.1.
4. **Source of MetaplecticAutomorphicForms MP.3** (1 item): Proposition 9.1.3, the classification of O(W)-invariant distributions on an isotropic plane, which is local theta material for the pair (SL₂, O(W)).
5. **Source of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1** (1 item): Tate's full-faithfulness theorem for p-divisible groups over O_K, routed there exactly as PAPER-LI-ZHANG-22-B routes it.

## Source issues (`sourceIssues` E1–E7)

- **E1** (error, affects nothing). The simplified form of Lemma 3.2.1 and the closed formula of Lemma 3.2.2 are stated for all U, resp. all b, but hold only for n + t > 0, resp. b ≥ 1: at U = 0 with m even they give 1 − q^{−m} and q^m − 1 instead of 1. The simplification cancels a factor (1 − x²) that is absent in that case. Brute force over F₃ (m ≤ 4) and F₅ (m ≤ 3) confirms the formula in 160 of 166 configurations, the six exceptions being exactly U = 0 with m even. The edge case is used in the proof of Lemma 7.6.7(ii) at d = 2, where the printed evaluation substitutes q⁴ − 1 for S₀ = 1; with the correct value the identity holds (checked symbolically for 2 ≤ d ≤ 7), so the lemma is unaffected.
- **E2** (misprint). The proof of Theorem 3.5.4 writes Den(H^ε_{n+1+2k}, L) for Den(H^ε_{n+2k}, L).
- **E3** (gap, affects the proof; new).
  - **The problem.** Remark 4.11.5 lifts an isometry g ∈ SO(V)(F) to g̃ ∈ J(F) "such that η(g) = 1". A lift has η(g̃) = spinor norm of g in F^×/(F^×)², so η(g̃) = 1 forces the spinor norm to be trivial. What is needed is only val η(g̃) = 0, since g̃ carries RZ^{(ℓ)} to RZ^{(ℓ + val η(g̃))} and N = RZ^{(0)}; that requires an isometry whose spinor norm has even valuation.
  - **Why it is not automatic.** For m even, ε = −1 one has V^−_m ≅ ϖ·H^−_{m,F}; write H^−_m = M ⊥ ⟨w⟩ with M self-dual of rank n and let L be M with the scaled form (all fundamental invariants 1). Every element of SO(V)(F) stabilizing L is a product of an even number of reflections in vectors of L or L^⊥_F, each of spinor norm of valuation 1, so the stabilizer has even-valuation spinor norms; since V is isotropic the spinor norm is surjective, so taking L′ = hL with val sn(h) odd gives isometric lattices no isometry of which lifts to an automorphism of N.
  - **Reach.** Remark 4.11.5 supplies the O(W)(F)-invariance in Lemma 9.2.2(i), hence Proposition 9.2.3 and Theorem 9.3.2.
  - **Repair.** The conclusion is presumably true (Theorem 4.15.1 asserts it, and for m = 4, ε = −1 Terstiege's explicit formulas give it), and an automorphism of RZ_G outside J(F) that shifts the components would supply it; no such argument is given, and this extraction did not settle it.
- **E4** (misprints, cross-references). "Lemma 6.1.1" for Proposition 6.1.1 (proof of Lemma 4.13.1); "[LZ, Theorem 5.2.2]" and "[LZ, Lemma 5.2.1]" for [LZ, Theorem 5.3.2] and [LZ, Lemma 5.3.1] (proof of Theorem 6.3.2 — Corollary 7.3.2 of the same paper uses the correct numbering); "Lemmas 7.4.5" for Corollary 7.4.5 (§7.6); and Corollary 7.6.8 citing itself, "Lemmas 7.6.8 and 7.5.1", for Lemma 7.6.7.
- **E5** (misprints). "T ∈ Herm_n(F)" for Sym_n(F) in the introduction (this is the orthogonal case; (11.4.0.2) has Sym_n); "Z(M^♭) ⊆ Z(M_{n−2})" for Z(M_{n−3}) in the type-2 case of §5.3; and "val(x) ≤ 0" for val(x) < 0 in case (iii) of the proof of Corollary 7.4.5 (val(x) = 0 is case (ii)).
- **E6** (misprint). In the base case (2) of the proof of Proposition 8.2.7, µ_−(L) = q^t − q should be q^{t−1} − q — the two preceding counts are q^{t−1} and q, and the displayed identity only holds with q^{t−1} − q. The inductive display also flips the sign of s relative to the statement, which is harmless since the identity is claimed for both signs.
- **E7** (misprints in arXiv v1, corrected in the final version). q^T = ψ_∞(tr Tz) for ψ_∞(½ tr Tz); [L : M] for [M : L] in Definition 8.2.2; ⟨…, e_t⟩ for ⟨…, ϖ^{−2}e_t⟩ in the base cases of Propositions 8.2.5 and 8.2.7; |det(m(a))| for |det(a)| in §11.4; and the sentence "E(z, s, Φ) does not depend on the choice of χ", which the final version replaces by the opposite statement in §11.1.

**Also checked and correct:**
- **Example 4.15.3** recomputed from Theorem 3.4.5 and Corollary 3.4.7: Den^ε(X, L) = 1 + εqX + qX² + εX³, so ∂Den^−(L) = 3 − q, matching Terstiege.
- **Lemma 3.2.1** by brute-force enumeration of isometric embeddings over F₃ and F₅ (166 configurations; see E1 for the six edge cases).
- **Lemmas 7.6.5, 7.6.6 and 7.6.7** symbolically for d ≤ 7, and the counts of isotropic vectors they use.
- **Corollary 7.4.5** (q² + 1 vertex lattices of type 2 over Λ, giving −q(1 + q) + q² + 1 = 1 − q) and the Fourier values (q − 1, −1, 0, 0) of Lemma 7.5.1.
- **The base cases of Propositions 8.2.5 and 8.2.7**, including the corrected µ_− of E6, and the weight factors in the proof of Proposition 8.1.2 against Definition 3.4.4.
- **Lemma 6.3.1**'s Poincaré-duality step (eigenvalue q^{2j} on H^{2j}(Y°_d)(j)) and the dimension count 2k of Proposition 9.1.3 against the double cosets B(F)\SL₂(F)/K₀(ϖ^k).

Crossref (checked 2026-09-22) records no correction notice or update relation for the Inventiones article.

## Prerequisites not yet covered

- Howard–Pappas 2017 and Kim 2018a/2018b (GSpin Rapoport–Zink spaces, Tate tensors, uniformization).
- Kisin 2010, Madapusi Pera 2016, Kim–Madapusi Pera 2016, Lovering 2017, Xu 2020 (integral canonical models).
- Li–Zhu 2018 and Li–Zhang (JAMS 2022), the unitary companion whose proofs are reused throughout.
- Cho–Yamauchi 2020, Ikeda 2017, Katsurada 1999 (Siegel series); Gross 1986 and Gross–Keating 1993; Terstiege 2008, 2011, 2013a/b.
- Howard–Pappas 2014 and He–Li–Zhu 2019 (the varieties Y_W); Lusztig 1976; Rapoport–Richartz 1996; Rapoport–Zink 1996; Soylu 2017.
- Kudla 1997a/1997b, Lansky–Raghuram 2007, Bruinier–Yang 2021, Zhang 2021.

Links and reasons are in the JSON; the DOIs were confirmed on Crossref (five of them had to be corrected during the check).

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LI-ZHANG-22.result.json`: ok.
- `python3 research/blueprint/intake.py check-files …`: ok.
- Every missing item appears in exactly one route, and no route takes a planned item.
- The cited stages GN.2, GN.3, AL.0, MP.3, MP.4 and R07.1 and the two parents were checked against `data/atlas.json`, every accepted restructure in `data/restructure/` and `data/roadmap-retirements.json`: none is restructured or retired. Library verdicts come from `data/library-coverage.json`.
- Both Part II ids are those proposed by the merged PAPER-SHANKAR-SHANKAR-TANG-ETAL-22 (and, for the orthogonal models, PAPER-CHARLES-16), with their titles.
- The numerical checks used scripts in the worker's scratch directory; no Lean was written, as none is a deliverable of this job.
