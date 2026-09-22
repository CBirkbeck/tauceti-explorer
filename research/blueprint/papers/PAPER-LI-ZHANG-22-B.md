# PAPER-LI-ZHANG-22-B: Kudla–Rapoport cycles and derivatives of local densities

Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, [J. Amer. Math. Soc. 35 (2022), 705–797](https://doi.org/10.1090/jams/988); arXiv [1908.01701](https://arxiv.org/abs/1908.01701).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1416). Status: **complete**. The whole paper was read and every missing item is routed once. The machine-readable extraction is [PAPER-LI-ZHANG-22-B.result.json](PAPER-LI-ZHANG-22-B.result.json): 116 items (7 planned, 109 missing), 5 routes, 22 prerequisite entries and 5 recorded source issues.

**Source.** arXiv v3 (1 December 2020, 92 pages), SHA-256 `7db1843f90c3e79741f8d58d92b6bb42b0a3b7ae001c8f9419f43b08c2119d49`, read in full on 2026-09-22.

- The JAMS PDF returned 403 to scripted access and was not read.
- v3 is the latest arXiv version. Its comment lists a new §2.8, a new §6.4 and expanded proofs.
- Locators are v3 pages.

## What the paper proves

**Setting.** F/F₀ is an unramified quadratic extension of p-adic fields, p > 2. N_n is the unitary Rapoport–Zink space of signature (1, n − 1), and 𝕍_n is its nonsplit hermitian space of special quasi-homomorphisms.

**The local Kudla–Rapoport conjecture (Theorem 3.4.1).** For every full-rank O_F-lattice L ⊆ 𝕍_n, Int(L) = ∂Den(L). Here Int(L) is the Euler characteristic of the derived intersection of the Kudla–Rapoport divisors Z(x₁), …, Z(x_n). ∂Den(L) is minus the derivative at X = 1 of the normalized local Siegel series of L.

**The proof** is an induction on n.
1. Fix L♭ of rank n − 1 and compare the functions x ↦ Int(L♭ + ⟨x⟩) and ∂Den(L♭ + ⟨x⟩) on 𝕍 \ L♭_F.
2. **Horizontal parts.** The horizontal part of Z(L♭) is a sum of quasi-canonical lifting cycles (Theorem 4.2.1, by Tate modules and Breuil modules). Its contribution matches an explicit lattice sum (Theorem 6.1.3).
3. **Geometric vertical part.** It reduces to intersections with Deligne–Lusztig curves in the Vollaard–Wedhorn stratification. That reduction uses the Tate conjecture for these Deligne–Lusztig varieties, Theorem 5.3.2, proved from Lusztig's Frobenius eigenvalues. The resulting function is Fourier-invariant up to γ_𝕍 = −1 (local modularity: Corollary 6.3.3, and Corollary 6.4.10 in all types).
4. **Analytic vertical part.** It is smooth (Proposition 7.3.4). By the Cho–Yamauchi lattice-count formula, its Fourier transform vanishes off the cone in the normal direction (Theorem 7.4.1).
5. **Closing the induction.** An induction on val(L♭), with a support argument, finishes the proof (Theorem 8.2.1). An uncertainty principle from the Weil representation of SL₂ (§8.1) motivates the argument.

**Part 2: almost self-dual level.**
- **Theorem 10.3.1:** Int(L) = ∂Den_Λ(L)/(q + 1), for the variant defined through the auxiliary space Ñ¹_n → Z(x₀).
- **Theorem 10.5.1:** Int′(L) = (∂Den_Λ(L) − Den(L))/(q + 1), for the naive intersection number on N¹_n. It is conditional on Conjecture 10.4.1 (Kudla–Rapoport), which the paper assumes and attributes to a paper in preparation.

**Part 3: global consequences.**
- Rapoport–Smithling–Zhang semi-global and global models, with p-adic uniformization, give the semi-global identity (Theorem 13.6.1).
- The global Kudla–Rapoport conjecture follows (Theorem 14.5.1, Corollary 14.5.2).
- With Liu's archimedean identity (Theorem 15.3.1), the arithmetic Siegel–Weil formula follows (Theorem 15.5.1), when F/F₀ is unramified at all finite places and split above 2.

## What the atlas already has

- **Library.** Nothing.
  - Mathlib and Tau Ceti have no hermitian lattices over local fields.
  - They have no Rapoport–Zink spaces or Deligne–Lusztig varieties.
  - They have no p-adic Weil representation.
- **Planned.**
  - GeometryOfNumbersAndQuadraticArithmetic GN.2: classification of hermitian spaces and lattices.
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 and R07.2: Breuil–Kisin classification, and Dieudonné–Manin.
  - SchemeAndStackFoundations SF.5: Grothendieck–Riemann–Roch and the Chern character.
  - MotivesAndAlgebraicCycles MC.2 and MC.7: cycle classes, and the Tate-conjecture statement.
  - ShimuraVarieties V1: complex uniformization.
- **Not in the atlas.**
  - Unitary Rapoport–Zink spaces and parahoric or Drinfeld-level unitary models.
  - p-adic uniformization.
  - Special cycles on higher-dimensional unitary spaces.
  - The local and global Kudla–Rapoport identities and the arithmetic Siegel–Weil formula.
  - The degenerate Siegel Eisenstein series on U(n, n). AutomorphicSpectralTheory AS.1–AS.2 treat Eisenstein series from cuspidal data only.

## Routes

1. **Part II of PELModuli: `UnitaryRapoportZinkSpacesAndRSZModels`** (14 items).
   - The Rapoport–Zink spaces N_n, N¹_n and Ñ¹_n with their framing objects and 𝕍_n.
   - Relative Dieudonné and Breuil theory for strict formal O_{F₀}-modules.
   - The Shimura datum G̃.
   - The RSZ semi-global models (hyperspecial, almost self-dual, split, Drinfeld, ramified), M_{K∩K♯} and the global models.
   - p-adic uniformization.

   PELModuli plans PEL moduli functors and good-level representability only. This Part II contains only moduli-theoretic objects, so it does not depend on the cycle roadmap below.
2. **Part II of GrossZagierAndArithmeticHeights: `UnitaryKudlaRapoportCycles`** (70 items). GZ.6–GZ.7 plan the same programme for CM cycles on Shimura curves: generating series, incoherent kernels, and intersection multiplicities against derivatives of local densities. This Part II takes:
   - Kudla–Rapoport cycles and K-theory with supports on formal schemes;
   - the Bruhat–Tits and Deligne–Lusztig geometry, and Lusztig's eigenvalues with the Deligne–Lusztig Tate theorem;
   - all of §§4–8 and Part 2;
   - the global cycles, Eisenstein series, Green currents and arithmetic degrees;
   - Theorems 3.4.1, 10.3.1, 10.4.3, 10.5.1, 13.6.1, 14.5.1 and 15.5.1.

   Conjecture 10.4.1 stays an explicit hypothesis of the two conditional theorems. The Gillet–Soulé arithmetic Chow group also appears in the proposed `GSpinSpecialDivisorHeights` (PAPER-SHANKAR-SHANKAR-TANG-ETAL-22); the brief asks the two design jobs to share one construction.
3. **Source of GeometryOfNumbersAndQuadraticArithmetic GN.3** (19 items). The hermitian local-density package:
   - Den(M, L), the normalized Siegel series, its functional equation and cancellation laws;
   - the Cho–Yamauchi formula with its finite-field counts, and the special-value corollaries;
   - the induction formula and the almost self-dual variants;
   - the lattice lemmas of §§7–8.
4. **Source of MetaplecticAutomorphicForms MP.2 and MP.3** (5 items):
   - the Fourier normalization;
   - the SL₂ Weil representation and the Weil constant;
   - the quadratic and hermitian uncertainty principles;
   - the U(n, n) × U(𝕍) Weil representation with Siegel–Weil sections.
5. **Source of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1** (1 item): Tate's full-faithfulness theorem for p-divisible groups over O_K.

## Source issues (`sourceIssues` E1–E5)

- **E1** (gap, affects the proof).
  - **The problem.** The induction step of Theorem 8.2.1 claims Int_{L♭,V}(x) = Int_{L′♭,V}(x′) and the matching equality for ∂Den. These do not follow: the horizontal/vertical splitting depends on the hyperplane L♭_F, not only on the lattice L♭ + ⟨x⟩.
  - **Repair.** The argument only needs the equality of the differences φ = Int_{L♭,V} − ∂Den_{L♭,V}, which Theorem 6.1.3 gives. The theorem stands.
- **E2** (error, affects a stated result).
  - **The problem.** In §6.4 the class of the complex [O(−Z(x))|_V → O_V] is written ch(O(−Z)) − ch(O). It should be ch(O_V) − ch(O(−Z)|_V). So c₁·[V(Λ′)] = −Int_{V(Λ′)}, and Lemmas 6.4.6–6.4.7 need a factor (−1)^d.
  - **Check.** For d = 1, a transverse point of intersection gives degree −1, where Lemma 6.4.6 prints +1.
  - **Consequence.** The local-modularity results (Corollary 6.4.8, Theorem 6.4.9, Corollary 6.4.10) are sign-invariant and unaffected.
- **E3** (misprints). Corollary 6.4.8's proof cites itself, "Lemma 6.4.8", for Lemma 6.4.7. Lemma 6.4.7's proof cites Lemma 6.3.1 where it needs Lemma 6.2.1.
- **E4** (misprints).
  - Example 3.5.2 has val(L♭) for val(L).
  - Theorems 10.3.1 and 10.5.1 have L ⊆ V for L ⊆ 𝕎_n.
  - The n = 1 case of Theorem 10.4.3 has "non-empty unless" for "empty unless".
- **E5** (citation). §1.2 attributes basis independence to Terstiege's Prop. 3.2, which is the case n = 3. Howard's Corollary D or the paper's own §2.8 covers general n.

**Also checked and correct:**
- Lemma 1.9.1, against known counts of isotropic subspaces.
- The finite-field isometry count behind Theorem 3.5.1.
- Example 3.5.2 and Corollaries 3.6.1–3.6.2.
- The induction formula, in rank one.
- The degrees (4.2.0.2) and Corollary 4.6.1.
- Lemma 5.3.1's eigenvalues.
- The n = 3 multiplicity bookkeeping.
- Lemma 6.2.1 (q³ + 1 type-1 lattices over a type-3 lattice) and the Fourier evaluation of Lemma 6.3.1.
- The counts in Lemmas 6.4.5–6.4.7, symbolically for d = 2, …, 6.
- The sums (7.3.5.4)–(7.3.5.5).
- The generation claim in Proposition 8.1.2, via the Bruhat–Tits tree.
- Lemma 9.1.1's dimension count and Theorem 9.1.2.
- Sankaran's rank-two formula (9.1.3.1) against Terstiege's (9.1.3.2): equal for 0 ≤ a ≤ b ≤ 7, with the functional equation.
- Example 10.5.3 and Remark 10.3.2.

The paper itself corrects a factor in [KR14, Prop. 9.3]: log p should be log p² (footnote 2). Crossref records no correction notice or update relation for the JAMS article.

## Prerequisites not yet covered

- Kudla–Rapoport 2011 and 2014.
- Terstiege 2013 (both papers).
- Vollaard–Wedhorn and Vollaard.
- Lusztig 1976.
- Cho–Yamauchi and Hironaka.
- Zhang 2021 (Appendix B) and Howard 2019.
- Rapoport–Smithling–Zhang (three papers) and Cho.
- Sankaran 2017 and Gross 1986.
- Liu 2011, Garcia–Sankaran and Ichino.
- Li–Zhu 2017, Katsurada 1999, Jacobowitz 1962 and Mihatsch.
- Tate 1967 and Breuil 2000.
- Bruinier–Howard–Kudla–Rapoport–Yang.

Links and reasons are in the JSON.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LI-ZHANG-22-B.result.json`: ok.
- Every missing item appears in exactly one route, and no route takes a planned item.
- Stage ids were checked against `data/atlas.json`, the accepted restructures and `data/roadmap-retirements.json`: none of the cited stages is restructured or retired.
- The reviewed library audit (`data/library-coverage.json`) marks GN.3 local densities absent.
- No Lean was written or compiled; none is a deliverable of this job.
