# PAPER-BOXER-CALEGARI-GEE-25: Cuspidal cohomology classes for GL_n(Z)

George Boxer, Frank Calegari and Toby Gee, *Cuspidal cohomology classes for GL_n(Z)*, [Journal of the American Mathematical Society 38 (2025), no. 2, 509–520](https://doi.org/10.1090/jams/1050); arXiv [2309.15944](https://arxiv.org/abs/2309.15944) (v3).

Extraction by Claude Code, session `cc-d67081`, 22 September 2026 (issue #1412). Status: **complete**. The whole published article was read, and every missing item is routed exactly once. The machine-readable extraction is [PAPER-BOXER-CALEGARI-GEE-25.result.json](PAPER-BOXER-CALEGARI-GEE-25.result.json):

- 96 items: 3 library, 13 planned, 80 missing;
- 10 routes: two Part IIs and eight source routes;
- 19 prerequisite entries;
- 8 source issues.

**Source.** The publisher's free offprint on Calegari's research page (12 pages, SHA-256 `4d27afab…7f58f7150290`), read page by page from page images on 2026-09-22.

- **arXiv v3** (SHA-256 `abfa9eac…a84769684`) was compared word by word with the offprint. The mathematics is identical; v3 puts the acknowledgements in §1.3, and the other differences are typographical.
- **arXiv v1 and v2**, and Boxer's homepage copy (17 October 2024), were read for the history of the source issues.

The cited inputs were read at the statements the proofs use:
- BLGGT14, §§1.1, 1.4, 2.1–2.4, 4.1 and A.2;
- Thorne 2012, §§2 and 7–10;
- Thorne 2017, Definition 2.20, Proposition 2.21, Theorem 5.1 and §7;
- Bellovin–Gee, §4;
- GHT17, §1, Remark 6.1 and Corollary 9.4;
- BLGG13, Appendix A;
- FKP22, Lemma B.4;
- NT21, Theorem A;
- Miller, Theorem 1.6;
- CKPSS04, §7;
- Caraiani 2014, Theorem 1.1;
- the tables of Citro–Ghitza and Gouvêa.

## What the paper proves

**Theorem B.** There are cuspidal automorphic representations of GL_n/ℚ of level one and weight zero for n = 79, 105 and 106. Here level one means π_p unramified for every p, and weight zero means π_∞ has the infinitesimal character of the trivial representation. Hence H^*_cusp(GL_n(ℤ), ℂ) ≠ 0 for these n. These are the first such classes for any n > 1.

Fermigier and Miller showed there are none for 1 < n < 27. So the smallest such n lies between 27 and 79.

**The translation (Remark 1.2).** The level-one quotients are GL_n(ℚ)\GL_n(𝔸)/K_∞GL_n(Ẑ) with K_∞ = O(n) or SO(n), that is, GL_n(ℤ)\P_n and SL_n(ℤ)\P_n for P_n = GL_n(ℝ)/O(n). Their cuspidal cohomology is ⊕_π H^*(𝔰𝔩_n, K_∞; π_∞), the sum over level-one weight-zero π.

Clozel's description of the tempered cohomological representations of GL_n(ℝ), and the triviality of the central character at level one, then give three statements:
- H^*_cusp(GL_n(ℤ)) = H^*_cusp(SL_n(ℤ)) for n odd;
- the dimension doubles from GL_n(ℤ) to SL_n(ℤ) for n even;
- nonvanishing holds exactly when some level-one weight-zero π exists.

**The method: change of weight.** Take f of level one and weight k, and ρ̄ a twist of Sym^{n−1}ρ̄_f. Newton–Thorne make Sym^{n−1}f automorphic, but of the wrong weight. The paper builds a deformation ring of G_n-valued lifts of ρ̄ (G_n = GSp_n or GO_n) that are unramified outside p and crystalline with Hodge–Tate weights 0, …, n−1:
- Bellovin–Gee's lower bound gives it Krull dimension at least 1;
- comparison with a 𝒢_n-valued ring over an imaginary quadratic field, and Thorne's finiteness theorem, make it finite over 𝒪;
- so it has a characteristic-zero point ρ (the Khare–Wintenberger method);
- ρ is then shown automorphic by automorphy lifting.

Everything depends on ρ̄|G_{ℚ_p} having a crystalline lift of weight zero. There are two cases.

- **Theorem 2.1 (ordinary).** Let p > 5, and let f be ordinary at p with ρ̄_f(G_ℚ) ⊇ SL₂(𝔽_p), (p−1, k−1) = 1 and ρ̄_f|G_{ℚ_p} semisimple.
  - Then ρ̄|G_{ℚ_p} ≅ ⊕ψ̄_i ε̄^{−i} (display (2.1.1)).
  - Level-one weight-zero π with ρ̄_π ≅ ε̄^{(n−1)(k−2)/2} ⊗ Sym^{n−1}ρ̄_f exist for n = p−1 and n = p−2.
  - The weight-26 form ΔE₄²E₆ at p = 107 gives n = 106 and 105 (Theorem 2.4). Its hypotheses are Swinnerton-Dyer's image, a₁₀₇ ≡ −1, (106, 25) = 1, and Elkies's companion form of weight 82.
- **Theorem 3.1 (non-ordinary).** Let p > 5, and let f be non-ordinary at p with 2 ≤ k < p and (k−1, p+1) = 1.
  - Then Sym^{p−1}ρ̄_f|G_{ℚ_p} is the reduction of ρ_{p,1} = Sym^{p−1} Ind ε₂^{−1}, which has weight zero.
  - The change of weight uses Harris's tensor product trick. Tensor with induced characters θ, θ′ from a cyclic CM extension of degree k−1 to reach dimension (k−1)p, and apply Thorne's lifting and finiteness theorems for adequacy with p | n.
  - A non-ordinary form of weight 38 at p = 79 gives n = 79 (Corollary 3.2).

**Remarks.**
- **Remark 1.1:** assuming tensor-product functoriality, one example gives infinitely many n.
- **Remark 2.5:** by the descent of Cogdell–Kim–Piatetski-Shapiro–Shahidi, n = 105 gives a level-one weight-zero globally generic representation of Sp₁₀₄, and H^*_cusp(𝒜₅₂, ℂ) ≠ 0.
- **Remark 3.3:** the primes at which the two theorems apply.

## What the libraries and the atlas already have

**Libraries (3 items).**
- Mathlib has the level-one dimension formula: `ModularForm.dimension_level_one`, `ModularForm.rank_eq_one_add_rank_cuspForm` and `ModularForm.levelOne_weight_two_rank_zero`.
- Mathlib also has E₄, E₆ and Δ (`ModularForm.E₄`, `ModularForm.E₆`, `ModularForm.discriminant`, `CuspForm.discriminant`) and the cyclotomic characters (`cyclotomicCharacter`, `modularCyclotomicCharacter`).
- Tau Ceti has Hecke eigenforms (`HeckeRing.GL2.IsEigenformAwayFromLevel`, which at N = 1 is the level-one notion) and symmetric powers of representations (`Representation.symmetricPower`).

So the absence of weight-two forms at level one, the uniqueness of the weight-26 eigenform and the cyclotomic character are library. Mathlib's `Matrix.symplecticGroup` and `Matrix.orthogonalGroup` are cited as near misses, since the proofs need the similitude groups.

**Planned (13 items).**

| Item | Planned in |
| --- | --- |
| Newton–Thorne's Theorem A | ModularityAndLanglandsExtensions ML.3 |
| Cyclic base change | ML.5 |
| Galois representations of regular algebraic polarized π, with local–global compatibility | AutomorphicGaloisRepresentationsPartII AG2.0, AG2.5, AG2.6 |
| Caraiani's full compatibility at l = p (needed, but not cited by the paper) | AG2.6, the "generalised log-crystalline weight spectral sequence for the full monodromy comparison" |
| ρ_f, and its ordinary local shape | AutomorphicGaloisRepresentations R19.1, R19.5 |
| The Fontaine–Edixhoven local shape for non-ordinary f | SerreWeightAndLevelOptimisation R20.3 |
| Fundamental characters | ArithmeticGaloisRepresentations R01.2 |
| Dickson's classification | ArithmeticGaloisRepresentations R01.4 |
| The characteristic-zero point of a finite 𝒪-algebra of positive dimension | DeformationAndDerivedPatchingAlgebra R03.4 |
| Relative Lie algebra cohomology, with disconnected K | AutomorphicFormsOnReductiveGroups AF.1 |
| The level-one symmetric spaces | ArithmeticLocallySymmetricSpaces ALS.0 with AdelicAlgebraicGroups AA.4 |
| Level-one eigenforms of weight n + 1 | Tau Ceti ModularForms Layer 4 |

For Dickson and the R03.4 lemma, the decompositions of those roadmaps contain nodes stating exactly these results.

**Missing (80 items).** The atlas has none of the following:
- **Cuspidal cohomology.** No layer mentions it.
- **The archimedean analysis of GL_n(ℝ).** Clozel's Lemma 3.14 is not planned.
- **The polarized automorphy lifting and finiteness theorems of Thorne and BLGGT.** The words "definite unitary" occur nowhere in the atlas.
- **Bellovin–Gee's G-valued deformation theory.**
- **Adequacy for p | n,** and the similitude groups.
- **The level-one change of weight and its instances.**

## Routes

1. **Part II of ModularityAndLanglandsExtensions: `LevelOneCuspidalCohomologyGLn`** (39 items), titled "Modularity, automorphy and Langlands endpoint extensions, Part II: level-one change of weight and cuspidal cohomology of GL_n(Z)".

   The theorems are automorphy endpoints built directly on ML.3. From Sym^{n−1}f they produce automorphic representations with prescribed residual representation, level one and weight zero. So the Part II extends ModularityAndLanglandsExtensions in its own direction. The maintainer's guides do the same for Skinner (converse Gross–Zagier–Kolyvagin) and for Pan.

   Its six layers:
   1. level-one cuspidal cohomology of GL_n(ℤ) and SL_n(ℤ), with Remark 1.2 and the Fermigier–Miller range;
   2. residual symmetric powers and their local shapes: (2.1.1), ρ_{n,m}, ρ̄_{p,m}, and the tensor identities;
   3. the deformation rings R and R_F;
   4. the ordinary change of weight and p = 107;
   5. the non-ordinary change of weight and p = 79;
   6. the consequences: Theorem B, Problem C, Remark 1.1 as a conditional statement, and Remark 2.5.

2. **Part II of PotentialAutomorphyInfrastructure: `PolarizedAutomorphyLifting`** (10 items), titled "Reusable infrastructure for potential automorphy over CM fields, Part II: polarized automorphy lifting and finiteness of deformation rings".

   The proofs rest on Thorne's and BLGGT's theorems for conjugate self-dual representations: automorphy lifting with adequate image, finiteness of ordinary and minimal deformation rings, and soluble descent. Thorne's 2017 extension covers p | n and his erratum to the 2012 paper. These are reusable infrastructure for potential automorphy over CM fields, the direction of PotentialAutomorphyInfrastructure. Its own layers follow ACC+ and treat the unpolarized case through locally symmetric spaces. ML.2 and ML.3 need the same theorems, so they are planned once, here.

3. **Source of ArithmeticGaloisRepresentations G7 and R01.4** (15 items).
   - G7 takes the similitude groups GSp_n, GO_n and 𝒢_n with their multipliers, polarizations of symmetric powers, and the injection (2.1.2).
   - G7 also takes the representation theory behind H⁰(ℚ, (𝔤_n⁰)^*(1)) = 0 (one-dimensional constituents of Sym^{2i} for SL₂(F), and Clebsch–Gordan after semisimplification).
   - G7 also takes adequacy (Thorne 2017, Definition 2.20), Lemma 2.2, GHT17's Remark 6.1 and Corollary 9.4, and BLGG13's Lemma A.3.1.
   - R01.4 takes Swinnerton-Dyer's image computation and the large-image lemma of Theorem 3.1.

   This matches PAPER-NEWTON-THORNE-26, which routed its symmetric-power adequacy to G7.
4. **Source of GlobalGaloisDeformations G7** (2 items). Bellovin–Gee's Proposition 4.2.6, and the surjection R_F → R induced by ψ ↦ r_ψ.
5. **Source of LocalGaloisDeformationRings L7** (2 items). FKP22's ordinary components in the G-valued case, and "connects" (BLGGT14, §1.4).
6. **Source of SerreWeightAndLevelOptimisation R20.3** (1 item). Gross's criterion that a companion form forces ρ̄_f|G_{ℚ_p} to be semisimple.
7. **Source of ComputationalNumberTheory CN.3** (5 items). The paper's explicit Hecke data: the coefficients and a₁₀₇ of ΔE₄²E₆, the weight-82 companion, the non-ordinary weight-38 form at 79, and Remark 3.3.
8. **Source of AutomorphicSpectralTheory AS.5** (2 items). Cuspidal cohomology and its decomposition over cuspidal representations, in the general form. AS.5 already owns the automorphic comparison of relative Lie algebra cohomology. PAPER-FU-24 (partial) proposes the same notion in its proposed Part II `WeightAspectAutomorphicMultiplicity`; the notion should have one owner, which the other imports.
9. **Source of AutomorphicFormsOnReductiveGroups AF.4** (3 items). The tempered cohomological representations of GL_n(ℝ) and the action of O(n)/SO(n).
10. **Source of ModularityAndLanglandsExtensions ML.5** (1 item). The image of generic functoriality from Sp_{2n} (CKPSS04, Theorem 7.2).

**Dependencies.**
- Route 1 imports route 2 and the layers of routes 3–10.
- Route 2 imports ET.4 and ET.7 (unitary base change), AG2, the deformation layers of routes 3–5, DeformationAndDerivedPatchingAlgebra (patching), ArithmeticGaloisDuality, and ML.5. It does not import route 1.

So the proposals are acyclic.

## Source issues (`sourceIssues` E1–E8)

All eight are new: no erratum was found, and the published text, arXiv v3 and Boxer's copy agree at every locator.

- **E1 (misprint).** In the proof of Theorem 2.1, both parameter lists for BLGGT14 Theorems 2.4.2 and 2.4.1 print "n = p − 1". The proof covers n = p − 1 and n = p − 2, and the latter gives n = 105. This has been present since v1.
- **E2 (misprint).** "[Tho12, Thm. 10.1]" in the proof of Theorem 2.1 should be Theorem 10.2. Thorne's Theorem 10.1 is the minimal finiteness theorem and Theorem 10.2 the ordinary one, which BLGGT14 restates as Theorem 2.4.2. The citation of Theorem 10.1 in §3 is correct.
- **E3 (misprint).** "[Tho17, Thm. 7.1]" appears twice in the proof of Theorem 3.1. Thorne 2017's §7 has Propositions 7.1 and 7.2 and Corollary 7.3; Proposition 7.1 is about Taylor–Wiles primes. The automorphy theorem with p | n is Theorem 5.1, or Thorne 2012 Theorem 7.1 through Corollary 7.3, and GHT17 cites Thorne 2017 with exactly this numbering. The published Math. Z. version was not accessible; the author's copy was read.
- **E4 (misprint).** In the proof of Theorem 3.1, "Ind(θ ⊗ ρ|_{G_F})" should be "Ind(θ′ ⊗ ρ|_{G_M})", both in the map R_F → R and in the automorphy step.
  - With θ′ the multiplier is ε^{1−(k−1)p} and the Hodge–Tate weights are 0, …, (k−1)p−1.
  - With θ the multiplier is ε^{3−k−p} and the weights repeat (for p = 79 and k = 38: exponent −114 against −2922).
  - The paper's θ and θ′ are named the other way round from BLGGT14's Proposition 4.1.1, whose pattern the two printed occurrences follow.
- **E5 (gap).** The paper deduces Bellovin–Gee's "discrete series and odd" hypothesis from the parity of the multiplier. That settles GSp_n but not GO_n: for n = p − 2 in Theorem 2.1 and n = p in Theorem 3.1, one needs the eigenvalue count ((n+1)/2, (n−1)/2) of complex conjugation. This holds for a symmetric power of an odd representation: (53, 52) for n = 105 and (40, 39) for n = 79.
- **E6 (gap).** The proof of Theorem 3.1 stops at "ρ is automorphic" and never shows π_p unramified. Theorem 2.1 cites BLGGT14 Theorem 2.1.1, whose part (4) needs an Iwahori-fixed vector; there it is harmless, because BLGGT14 Theorem 2.4.1 gives level prime to l. In Theorem 3.1 the descent lemmas lose the level, so full local–global compatibility at l = p is needed (Caraiani, Algebra Number Theory 8 (2014), Theorem 1.1).
- **E7 (error).** Remark 3.3 lists p = 151 among the primes where Theorem 2.1 applies. At 151 the only ordinary split eigensystems are the companion pair in weights 52 and 100 (Citro–Ghitza's table, confirmed with T₂ and T₃ mod 151), and (150, 51) = (150, 99) = 3. The correct list begins 107, 139, 173, 179, 191, 193; at 151 Theorem 3.1 applies instead. The same claim is in v1, §3.1.
- **E8 (gap).** Remark 2.5 obtains a level-one representation of Sp₁₀₄ from CKPSS04 Theorem 7.2 alone. That theorem is global. The local step, that the descended σ_ℓ is unramified when π_ℓ is, is not given; CKPSS04 §7.2 says local descent for Sp_{2n} was not yet available. The conclusion is expected to hold.

## Prerequisites not yet covered

The 19 entries of `prerequisites`:
- **Automorphy lifting and deformation theory:**
  - Barnet-Lamb–Gee–Geraghty–Taylor, Potential automorphy and change of weight;
  - Thorne 2012 and 2017;
  - Bellovin–Gee;
  - Guralnick–Herzig–Tiep;
  - Clozel–Harris–Taylor;
  - Geraghty;
  - Barnet-Lamb–Gee–Geraghty 2013;
  - Gee–Geraghty (companion forms for unitary and symplectic groups).
- **Modular forms:** Gross (companion forms); Swinnerton-Dyer (images mod l).
- **Automorphic forms:** Cogdell–Kim–Piatetski-Shapiro–Shahidi; Clozel 1990; Harder–Raghuram.
- **Vanishing results:** Miller; Fermigier.
- **Local–global compatibility:** Caraiani 2014 (at l = p).
- **Computations:** Citro–Ghitza; Gouvêa.

Three papers the proofs use are already queued: Newton–Thorne 2021 (PAPER-NEWTON-THORNE-21), Chenevier–Taïbi (PAPER-CHENEVIER-TAIBI-20) and Fakhruddin–Khare–Patrikis (PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22).

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BOXER-CALEGARI-GEE-25.result.json` reports ok. `research/blueprint/intake.py check-files` was run on the deliverables.
- The following were checked by computation in the worker's scratch space. The scripts are not part of the repository.
  - **Weight-26 form.** Exact q-expansions give ΔE₄²E₆ = q − 48q² − 195804q³ + ⋯ and a₁₀₇ = 35830422465487817813321292 ≡ −1 mod 107.
  - **Non-ordinary pairs, p < 200.** det(T_p | S_k) mod p, in the Miller basis, finds all pairs (p, k) with k < p. The smallest primes are 59 (weight 16) and 79 (weights 38, 44). The primes with (k−1, p+1) = 1 are 79, 151, 173 and 193, as the paper says.
  - **Companion pairs, 101 ≤ p ≤ 193.** Twisted T₂ and T₃ characteristic polynomials were matched, giving 107 (26, 82), 139, 151 (52, 100), 173, 179, 191 and 193. This agrees with Citro–Ghitza.
  - **(2.1.1)** holds for all p < 200.
  - **(2.1.2)** is a homomorphism with multiplier ν·δⁿ, for n = 2, …, 5.
  - **ρ̄_{p,m}** is independent of m.
  - **The tensor identities** of §3 hold on G_{ℚ_{p²}}.
  - **E4:** θ gives the wrong multiplier and repeated weights, and θ′ does not.
  - **SL₂(𝔽_q) constituents**, computed with Brauer characters for p = 7, 11, 13 and for SL₂(𝔽_{p²}), p = 5, 7, match the paper's claim.
  - **Oddness counts** for n = 79, 105 and 106.
- **Not read** (not openly available): Clozel 1990, Harder–Raghuram, Gross 1990, Swinnerton-Dyer 1973, Fermigier 1996, and the published version of Thorne 2017. Their statements are taken from the paper and marked so in the items. CHT08's 𝒢_n was read as restated in BLGGT14 §1.1 and Bellovin–Gee §5.1.
- **Not extracted as items**, because the paper does not use them on the way to its results:
  - Problems A and C as questions;
  - the heuristic of the introduction that a non-split ordinary ρ̄_f admits no weight-zero crystalline lift of Sym^{n−1};
  - the generalised Serre conjecture that motivates the method;
  - the comparisons with Odlyzko bounds and class field towers;
  - Taïbi's remark on endoscopic classes of 𝒜_g, which has no precise statement.

## Independent review (`REV-PAPER-BOXER-CALEGARI-GEE-25`, issue #1413)

Claude Code, session `cc-fb70e5`, 23 September 2026. **Verdict: accept**, all ten routes accepted, all
eight findings confirmed, nothing corrected in place. The full review is in
[`reviews/REV-PAPER-BOXER-CALEGARI-GEE-25.md`](../reviews/REV-PAPER-BOXER-CALEGARI-GEE-25.md).

Both recorded hashes match byte for byte. Simulating the shared subsection counter independently gives the
same numbering the locators use — Problems A and C and Theorem B on the lettered counter, 1.1–3.3 for the
statements, with 1.3 and 2.3 being headings — and **coverage is complete**; Problem A is rightly not an
item, since it asserts nothing and is the question Theorem B answers. All three `library` items were read
in the Mathlib source at pinned `082e2d3` and all 20 cited layers exist in `data/atlas.json`. Both Part II
routes reproduce their parent's title verbatim and join existing proposals rather than opening rivals
(`PolarizedAutomorphyLifting` with Newton–Thorne and LLHLM; `LevelOneCuspidalCohomologyGLn` is already
named by Chenevier–Taïbi).

The findings were checked against the cited sources themselves, which is where this paper's mistakes live.
Thorne's §10 shows 10.1 is the fixed-component theorem and 10.2 the ordinary one, and BLGGT introduce
their Theorem 2.4.2 as "Theorem 10.2 of [Tho12]" (E2); BLGGT's Theorem 2.1.1(4) carries the Iwahori
hypothesis, and their own next paragraph says they quote Caraiani only in that case (E6); Bellovin–Gee's
Definition 4.2.1 demands `dim H⁰ = dim G − dim B` at every infinite place, which an even multiplier alone
does not give (E5); Guralnick–Herzig–Tiep cite Thorne's 2-adic paper as "Corollary 7.3" for exactly the
statement needed (E3). Two were settled by computation: with `θ` rather than `θ′` the induced
representation has multiplier `ε^{3−k−p}` and repeated weights, against the required `ε^{1−(k−1)p}` —
`ε^{−114}` against `ε^{−2922}` at `p = 79, k = 38` (E4); and the Citro–Ghitza table plus `(p−1, k−1) = 1`
gives `107, 139, 173, 179, 191, 193`, so 151 must go and the two added primes belong (E7).

One limit is recorded in the review: Thorne's Math. Z. 2017 paper is not on arXiv and no author copy was
reachable, so E3 rests on Guralnick–Herzig–Tiep's citation rather than on a direct reading of its §7.
