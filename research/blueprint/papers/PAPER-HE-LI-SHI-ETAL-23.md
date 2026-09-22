# PAPER-HE-LI-SHI-ETAL-23: A proof of the Kudla–Rapoport conjecture for Krämer models

Qiao He, Chao Li, Yousheng Shi and Tonghai Yang, *A proof of the Kudla–Rapoport conjecture for Krämer models*, [Invent. Math. 234 (2023), 721–817](https://doi.org/10.1007/s00222-023-01209-1); arXiv [2208.07988](https://arxiv.org/abs/2208.07988).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1237). Status: **complete**. The whole paper was read and every missing item is routed once. The machine-readable extraction is [PAPER-HE-LI-SHI-ETAL-23.result.json](PAPER-HE-LI-SHI-ETAL-23.result.json): 46 items (3 planned, 43 missing), 3 routes, 13 prerequisite entries and 6 recorded source issues.

**Source.** The Springer PDF blocks scripted downloads, so two versions were read on 2026-09-22.
- **The authors' final version**, [Kramer.pdf](https://www.math.columbia.edu/~chaoli/Kramer.pdf) on Chao Li's homepage: dated 21 July 2023 (the publication date), 82 pages, SHA-256 `a29d282011c4972663376d1dd86c40d8dc494d259c82d6d652e23bd1fffc8623`. It was read in full, and locators are its pages.
- **arXiv v2** (25 June 2023, "final version, to appear in Invent. Math"), compared character by character with it. The only difference is one exponent in the introduction (E6).

## What the paper proves

**Setting.** F/F₀ is a ramified quadratic extension of p-adic fields, p odd, and N_n is the Krämer model of the unitary Rapoport–Zink space of signature (1, n − 1). The Krämer model is regular with semistable reduction (the other ramified level, the exotic smooth model, is the subject of PAPER-LI-LIU-22). V is the n-dimensional hermitian space of special quasi-homomorphisms, and Z(x) are the Kudla–Rapoport divisors.

**Theorem 1.3.** For every full-rank lattice L ⊆ V, Int(L) = ∂Den(L).
- Int(L) is the Euler characteristic of O_{Z(x₁)} ⊗^L ⋯ ⊗^L O_{Z(x_n)}.
- ∂Den(L) is the derivative Den′(L) against a unimodular lattice of opposite sign, corrected by Σ c_{2j} Den_{2j}(L). Here Den_t is the normalized density against the dual of a type-t vertex lattice, and the c_{2j} are fixed by requiring ∂Den(Λ^♯_{2i}) = 0.
- He–Shi–Yang formulated this conjecture and proved it for n ≤ 3; the proof here is new even then.

**Proof.** It follows Li–Zhang's GSpin strategy: fix L^♭ of rank n − 1 and compare x ↦ Int(L^♭ + ⟨x⟩) with x ↦ ∂Den(L^♭ + ⟨x⟩).
- **Geometric side (§§2–4).**
  - A Bruhat–Tits stratification of N_red by closed strata N_Λ (Theorem 3.19). N_Λ is isomorphic to a smooth projective Deligne–Lusztig variety Y_V of dimension t(Λ)/2 (Theorem 3.16), or to an exceptional P^{n−1} for type 0.
  - Intersections of vertical classes with Z(x) are invariant under translation by vertex lattices (Theorem 4.14, via Howard's linear invariance). This alone forces the partial Fourier transform of the vertical part to be constant on W_{≥0} (Theorem 4.16). No Tate conjecture for the strata is needed.
- **Analytic side (§§5–8).**
  - ∂Den(L) decomposes into primitive pieces ∂Pden(L′).
  - A striking closed formula for these (Theorem 7.1): 0 for non-integral L; 1 or 0 for unimodular L according to the parity of n; and Π(1 − q^{2ℓ}), possibly with a factor (1 − χ(L₂)q^{t/2}), for integral L of type t > 0.
  - It is proved through a decomposition over subspaces of L/πL (Theorem 6.1), finite-field counts, and long q-polynomial identities (§7).
  - Lattice-count identities for full-type lattices (Propositions 8.7, 8.9) then give the analytic constancy (Theorem 8.2).
- **Conclusion (§9).** The horizontal parts match through the n = 2 cases (Theorem 9.5), and an induction on val(L^♭) finishes (Theorem 9.7).

**Global application (§10).** A modified central derivative ∂Eis adds coherent Eisenstein series at ramified and almost self-dual places. The arithmetic Siegel–Weil formula for nonsingular coefficients (Theorem 10.1) and for the generating series (Theorem 10.2) then holds with Krämer level at ramified places. This removes Li–Zhang's assumption that F/F₀ is unramified.

## What the atlas already has

- **Library.** Nothing: no hermitian lattices over local fields, Rapoport–Zink spaces, Deligne–Lusztig varieties, local densities or q-binomial coefficients. The reviewed audit records the last as absent (a TODO in Mathlib's `Pochhammer.lean`).
- **Planned** (3 items):
  - AutomorphicLFunctionsAndLocalFactors AL.0: the Fourier transform and Lemmas 4.10–4.11.
  - SchemeKTheoryOperations S.6–S.7: K-groups with supports and the product property (2.9).
  - QSeriesPartitionsAndMockModularForms QM.0: the q-binomial theorem.
- **Not in the atlas.** Everything else. The Kudla–Rapoport and RSZ material is proposed as the two Part II candidates of PAPER-LI-ZHANG-22-B, which are reused below.

## Routes

1. **Part II of GrossZagierAndArithmeticHeights: `UnitaryKudlaRapoportCycles`** (22 items), the PAPER-LI-ZHANG-22-B candidate. It takes:
   - special cycles and exceptional divisors;
   - derived cycles and Int(L), and the geometric cancellation law (Proposition 2.12);
   - the Deligne–Lusztig varieties, N_Λ ≅ Y_V and the Bruhat–Tits stratification;
   - horizontal lattices and the primitive horizontal cycles, and the modified horizontal and vertical classes;
   - the Fourier analysis of both vertical parts (Theorems 4.14–4.16, 8.2);
   - the proof (Theorems 9.5, 9.7), with Theorem 1.3;
   - the global cycles, ∂Eis and Theorems 10.1–10.2.

   This is the third local case in that Part II, after the unramified case (Li–Zhang) and the exotic smooth ramified case (PAPER-LI-LIU-22).
2. **Part II of PELModuli: `UnitaryRapoportZinkSpacesAndRSZModels`** (4 items), the PAPER-LI-ZHANG-22-B candidate:
   - the Krämer model and its framing objects;
   - the hermitian spaces C and V;
   - the RSZ Shimura datum;
   - the regular semistable models with Krämer condition (RSZ20 Theorems 5.2, 5.4).
3. **Source of GeometryOfNumbersAndQuadraticArithmetic GN.3** (17 items). The whole local-density analysis:
   - densities and primitive densities, and the primitive decomposition;
   - finite-field isometry and subspace counts;
   - Theorem 6.1 and Theorem 7.1 with Corollaries 7.2–7.3, and the q-identities of §7;
   - the μ-invariants of §8, and Lemma 9.6.

   As in PAPER-LI-ZHANG-22-B and PAPER-LI-LIU-22, GN.3 is where hermitian local densities are planned.

## Source issues (`sourceIssues` E1–E6)

- **E1** (gap, affects a stated result; new).
  - **The problem.** At almost self-dual inert places, the proof of Theorem 10.1 uses Li–Zhang Theorem 10.5.1 "instead of [LZ22a, Theorem 10.3.1]". Li–Zhang state that theorem is conditional on their Conjecture 10.4.1, in both their arXiv v3 and their final version.
  - **Reach.** Theorems 10.1 and 10.2 (= 1.4, 1.5) carry that unstated hypothesis whenever V_asd ≠ ∅.
  - **Repair.** Li–Rapoport–Zhang (arXiv:2404.02214, 2024), Theorem 14.6.2, prove the Kudla–Rapoport structure conjecture behind it; that it covers every part used was not checked line by line. The same dependence is recorded in PAPER-LI-LIU-21/E3 and PAPER-LI-LIU-22/E4. The ramified places, the paper's contribution, are unaffected.
- **E2** (error, affects nothing).
  - **The problem.** Proposition 3.20 says Z(L) ∩ N_Λ ≠ ∅ iff L ⊆ Λ^♯, for every L. This fails for non-integral L: take L = Λ^♯ with t(Λ) > 0. No vertex lattice contains Λ^♯, so Z(Λ^♯) = ∅.
  - **Reach.** The proof assumes L integral, and every use in the paper is in the valid direction or has L integral.
- **E3** (misprints).
  - Theorem 7.1(3) omits "t > 0", which Theorem 1.6(3) states.
  - §7.6 writes L for L₁ in (7.39) and the final display, and g(n₁, n − t, r, X) for g(n₁, n₁ − t, r, X).
- **E4** (misprint). Lemma 6.4 cites [LL22, Lemma 2.16], the arXiv numbering of the Cho–Yamauchi count. In the published Li–Liu that is Lemma 2.15, and the paper uses published numbering elsewhere.
- **E5** (misprint). (9.5) sums over L′ ⊆ L′^∨ for L′ ⊆ L′^♯; here ∨ is the trace dual, π^{−1}(·)^♯.
- **E6** (misprint, already corrected in the final version). In arXiv v2 the introduction's Den(M, L) has q^{N·d_{L,M}} for q^{d·d_{L,M}}.

**Also checked and correct:**
- **Theorem 7.1 for integral lattices.** Corollary 6.2 was evaluated with brute-force enumeration of subspaces V₁ ⊆ L/πL and isometric embeddings V₁ → Ī_n over F₃ (n ≤ 4, 40 sign and type cases) and F₅ (n ≤ 3). Every value of Theorem 7.1(2)–(3) was reproduced.
- **The non-integral case H^j ⊥ L₁.** Pden(I_n, L₁, q^{2j}) = 0 when t(L₁) > 0, as §7.6 requires.
- **The c_t.** Example 5.11 and the table match the closed formula (5.8) in every entry. c₂ for n = 2, 3, 4 at q = 3 was recomputed from Corollary 6.2 with the brute-force counts.
- **Lemma 7.14.** Both identities were verified symbolically for n ≤ 7.
- **Corollary 5.17** against the orders of finite orthogonal groups, and against (7.8).
- **Further hand checks:** the maximal-lattice evaluations in Propositions 8.7 and 8.9, the telescoping (2.14) → (2.12) in Proposition 2.12, the identity (4.9) in Lemma 4.9, and Lemma 4.13 (Λ^∨ = π^{−1}Λ^♯ ⊆ V_{≥−1}).

Crossref records no correction notice or update relation for the Inventiones article.

## Prerequisites not yet covered

- He–Shi–Yang (Compositio 2023, the conjecture and n ≤ 3), He–Shi–Yang (Trans. AMS 2023) and Shi (Manuscripta Math. 2023; Algebra Number Theory 2023).
- Rapoport–Terstiege–Wilson 2014, Krämer 2003 and Howard 2019.
- Li–Zhang (JAMS 2022; Invent. 2022) and Li–Rapoport–Zhang 2024.
- Rapoport–Smithling–Zhang 2020 and 2021.
- Ahsendorf–Cheng–Zink, Vollaard–Wedhorn and Rapoport–Terstiege–Zhang.
- Soulé et al. 1994, Liu 2011 and Garcia–Sankaran 2019.

Links and reasons are in the JSON; the DOIs were confirmed on Crossref.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-HE-LI-SHI-ETAL-23.result.json`: ok.
- Every missing item appears in exactly one route, and no route takes a planned item.
- The cited stages AL.0, GN.3, S.6, S.7 and QM.0 and the two parents were checked against `data/atlas.json`, all accepted restructures and `data/roadmap-retirements.json`: none is restructured or retired. Library verdicts come from `data/library-coverage.json`.
- Both Part II ids and titles are those of the merged PAPER-LI-ZHANG-22-B routes.
- The numerical checks used scripts in the worker's scratch directory; no Lean was written, as none is a deliverable of this job.
