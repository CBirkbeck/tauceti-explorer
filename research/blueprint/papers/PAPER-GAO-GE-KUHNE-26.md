# PAPER-GAO-GE-KUHNE-26: The Uniform Mordell–Lang Conjecture

Ziyang Gao, Tangli Ge and Lars Kühne, *The Uniform Mordell–Lang Conjecture*, [Publications Mathématiques de l'IHÉS 143 (2026), 189–235](https://doi.org/10.5802/pmihes.26); arXiv [2105.15085](https://arxiv.org/abs/2105.15085).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1438). Status: **complete**. The whole published article (§§1–8, Appendix A, references) was read, and every missing item is routed once. The machine-readable extraction is [PAPER-GAO-GE-KUHNE-26.result.json](PAPER-GAO-GE-KUHNE-26.result.json): 93 items (3 library, 16 planned, 74 missing), 6 routes, 17 prerequisite entries and 13 recorded source slips.

**Source.** The published article is open access under CC BY 4.0: [PDF](https://pmihes.centre-mersenne.org/item/10.5802/pmihes.26.pdf), SHA-256 `4ee5a38b327807289885a1d7292bddc3341b7fc3e0aa8a3682d995d13237834f`, read 2026-09-22. The revised version is dated March 2026, and it controls over the arXiv v4.

## What the paper proves

Work over an algebraically closed field F of characteristic 0, with A an abelian variety, L ample, X ⊆ A irreducible and Γ ⊆ A(F) of finite rank.

- **Theorem 1.1 (uniform Mordell–Lang).** X(F) ∩ Γ is covered by at most c(dim A, deg_L X)^{1+rk Γ} cosets contained in X. Rémond's earlier bound also depended on h_Fal(A); this one does not depend on A at all.
- **Theorem 1.1′.** #(X° ∩ Γ) ≤ c(dim A, deg_L X)^{1+rk Γ}, where X° is the complement of the Ueno locus (the union of positive-dimensional cosets in X). Lemma 7.4 deduces Theorem 1.1 from it.
- **Theorem 1.2 (new gap principle).** Over ℚ̄, suppose X generates A. Then the points of X° with ĥ_{L⊗[−1]*L} ≤ c₁(g,d)·max{1, h_Fal(A)} lie in a proper closed X′ of degree < c₂(g,d). Neither the generation hypothesis nor the positive-dimensional exceptional set can be removed.
- **Theorem 1.3 (uniform Bogomolov).** For X generating A, fewer than c₄(g,d) points of X° have height ≤ c₃(g,d).

The proof has four stages:

1. **Parameter space (§3).** Put all pairs of a principally polarized A (with level-4 structure) and an X of given dimension and degree into finitely many families over the *restricted Hilbert scheme* H°. Lemma 3.3 shows the moduli map becomes generically finite on high fibred powers X^{[m]}. Gao's criterion then makes X^{[m]} *non-degenerate* in the Betti-map sense (Proposition 3.4).
2. **Large points (§4).** Apply the Dimitrov–Gao–Habegger height inequality on these non-degenerate families to get a gap relative to max{1, h_Fal(A)} (Propositions 4.2, 4.4, 4.1). The Faltings–Moret-Bailly comparison and Raynaud's isogeny bound move between the moduli height and the Faltings height. Lemma 4.3 turns "Σ^M lies in a proper closed set" into an exceptional set of bounded degree.
3. **Small points (§5).** Run the Ullmo–Zhang argument in families, using Kühne's equidistribution for non-degenerate subvarieties, to get a uniform Bogomolov bound (Propositions 5.2, 5.1). Section 6 combines the two into the gap principle (Proposition 6.1, Theorem 1.2).
4. **Counting (§7, Appendix A).** Rémond's quantitative Vojta–Mumford method (Theorem 7.1) reduces counting to (Hyp pack), which the gap principle supplies (Proposition 7.2). Masser's specialization theorems and good models pass from ℚ̄ to arbitrary F (Lemma 7.3). The Ueno-locus decomposition, with Bogomolov's degree bound and Masser–Wüstholz complements, gives Theorem 1.1 (Lemma 7.4).

## What the atlas already has

- **Library.** Tau Ceti defines abelian varieties over a field (`TauCeti.AlgebraicGeometry.AbelianVariety`), isogenies (`IsIsogeny`) and invertible sheaves. Mathlib has the Weil height on projective space (`Projectivization.logHeight`, over fields with `Height.AdmissibleAbsValues`). The Néron–Tate height exists only for elliptic curves (`neronTatePairing`).
- **Planned.**
  - HeightsRationalPointsAndObstructions: RP.0 (height machine, Néron–Tate heights) and RP.5 (translates, stabilizers, qualitative Mordell–Lang, Manin–Mumford, and a Bogomolov theorem via Ullmo/Zhang).
  - ArakelovGeometryAndAbelianHeights: the stable Faltings height (R35.3), its isogeny variation (R35.4) and the moduli-height comparison (R35.5).
  - AlgebraicModuliForArithmeticGeometry: Hilbert polynomials and Hilbert schemes (R09.1–R09.2).
  - PELModuli: Siegel moduli with the universal abelian scheme (M5–M6).
  - ShimuraCompactifications: the minimal compactification (C5).
  - AbelianSchemesAndArithmeticModuli: polarizations and polarization types (A2), isogenies and [n] (A3), complex uniformization (A5).
  - SchemeAndStackFoundations: intersection theory and Chern classes (SF.5).

The reviewed library audit marks all of these planned layers "not built" or "partly built", so none is cited as library.

## Routes

1. **Source of HeightsRationalPointsAndObstructions RP.0 and RP.5.** These layers own subvarieties of abelian varieties and their special sets. The paper is a source for the classical structure results it needs:
   - the Ueno locus and Kawamata's closedness theorem;
   - generation by X − X, and finite-rank groups;
   - Hindry's degree bounds (Lemmas 2.4 and 2.5);
   - Bogomolov's bound on maximal cosets, with Rémond's decomposition of the Ueno locus;
   - Zhang's difference-map lemma;
   - the fact that the Néron–Tate height depends only on c₁ (Lemma 2.3).

   None of these is a uniformity statement.
2. **Source of AbelianSchemesAndArithmeticModuli A2 and A5.** These layers own the polarization inputs:
   - the elementary-divisor normal form and the Pfaffian;
   - Riemann–Roch for abelian varieties (h⁰ = Pf, deg_L A = g!·Pf), and sections under isogeny pullback;
   - the isogeny to a principally polarized variety of degree deg_L A/g!;
   - the identity c₁(α*L⊠²) = 2c₁(L⊠²);
   - the symmetric relatively ample 𝔏_g on the universal family (Mumford–Fogarty–Kirwan 6.10).
3. **Source of AlgebraicModuliForArithmeticGeometry R09.1 and R09.2.** This covers the FGA 221 boundedness of Hilbert polynomials in fixed dimension and degree, and the finite-type parameter scheme H_{r,d}.
4. **Source of SchemeAndStackFoundations SF.0 and SF.5.** This covers the EGA IV facts (openness of the geometrically integral locus, openness of flat morphisms, fibre powers with geometrically irreducible fibres, Chevalley semicontinuity) and the degree facts (products, images, Bézout).
5. **New Part II: `AbelianSchemesBettiMapsPartII`**, titled *Abelian Schemes And Arithmetic Moduli, Part II: Betti maps and non-degenerate subvarieties*. Nothing in the atlas constructs the Betti map. This Part II covers:
   - the Betti map and Betti form, and non-degenerate subvarieties (DGH Def. 1.5, B.4);
   - Gao's degeneracy loci and their Zariski closedness;
   - Gao's criterion for non-degeneracy of fibred powers;
   - non-vanishing of the top power of the Betti form;
   - non-degeneracy of the difference construction.

   It builds on A5, ComplexComparisonPartII and Tau Ceti HodgeStructures, and takes mixed Ax–Schanuel from the LogicAndDefinability roadmaps. The theory is general, and the pending extractions of Dimitrov–Gao–Habegger 2021 and Gao–Habegger 2019 should reuse this id.
6. **Part II: `HeightsRationalPointsAndObstructionsPartII`**, titled *Heights, rational points and obstructions, Part II: uniform Bogomolov and uniform Mordell–Lang*. RP.5 plans only the qualitative theorems, and uniformity in the ambient abelian variety is a new direction. This Part II holds:
   - the restricted Hilbert scheme and its lemmas;
   - the height inequality, equidistribution in families, Lemma 4.3, and Propositions 4.1–6.1;
   - Rémond's machinery, Theorem 7.1 and Proposition 7.2;
   - Masser specialization and good models;
   - the four main theorems.

   PAPER-YUAN-26 already proposed this id for uniform Bogomolov for curves. This paper's Theorem 1.3 contains the number-field curve case, so the two routes coalesce instead of duplicating the programme; Yuan's function-field statements stay in their own brief.

## Source slips (`sourceIssues` E1–E13)

None of these affects a stated theorem. They are recorded so that a formalization uses the corrected constants.

- **E1** Theorem 1.3 names the second constant c₃ instead of c₄.
- **E2** The proof of Lemma 2.5 uses 8^r where (2.4) gives 16^r, and the step factor is similarly off. The lemma only claims ≪_g.
- **E3** Twice, deg_L X′ < deg_{𝓛|A} X′ should be ≤, since equality holds on points.
- **E4** In §4.3, deg_{u*L} X′₀ ≤ c′₂ is unjustified. The correct bound is (l/g!)^{2(r−1)}c′₂, and c′₂ must also be rescaled.
- **E5** Proposition 5.2 labels a constant c′₃ instead of c″₃.
- **E6** Step 5 of Proposition 5.2 sums over i = 2,…,M instead of M+1.
- **E7** Step 5(a) uses the degree exponent L^{⊠m} instead of L^{⊠m(M+2)}.
- **E8** Proposition 6.1 takes c₂ = max{c′₂, c″₂}, but the exceptional set is a union of two sets, so c₂ = c′₂ + c″₂ is needed.
- **E9** In (7.4)–(7.6) and (A.12), a ball holds at most c₀^{rk Γ+1} points, not c₀.
- **E10** Proposition 7.2 needs c₀ = max{c₁⁻¹, c₃}, not max{c₁, c₃}.
- **E11** Appendix Step 3 has (4c₈+1) where (8c₈+1) is needed.
- **E12** (gap, affects the proof) §8 applies Proposition 5.1 and the induction hypothesis to non-generating components without translating. The repair translates by a small point P₁, using ĥ(P−P₁) ≤ 2ĥ(P)+2ĥ(P₁) and Lemma 2.5, and proves the statement for all X. Item 93 records that form.
- **E13** Proposition A.3(ii) has "<" where the proof gives "≤".

I checked each slip against the text; E2, E4, E8, E9, E10 and E12 were re-derived. No published correction was found (journal page, Crossref).

## Prerequisites not yet covered

- Dimitrov–Gao–Habegger 2021 and Gao–Habegger 2019: queued in `papers.json` but not yet extracted.
- Kühne's equidistribution in families (arXiv:2101.10272).
- Gao's Betti-rank paper and mixed Ax–Schanuel (Compositio 2020), and Gao's survey.
- Rémond's two 2000 papers, and David–Philippon 2007.
- Masser's specialization papers, and Masser–Wüstholz 1993.
- Bogomolov 1981 and Kawamata 1980.
- Zhang 1998 and Ullmo 1998.
- Moret-Bailly and Raynaud (Astérisque 127).
- Bost–Gillet–Soulé 1994.
- FGA 221, Hindry 1988 App. 1, and Mazur 2000.
- Ge 2024 and Dill 2022.

Links and reasons are in the JSON.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-GAO-GE-KUHNE-26.result.json`: ok.
- Every missing item appears in exactly one route, and no source route takes a planned or library item. The two briefs are 327 and 423 words.
- Library citations were read at the pinned commits: Tau Ceti f790474 (`AbelianVariety/Basic.lean:94`, `AbelianVariety/Isogeny.lean:61`, `LineBundle/Basic.lean:78`) and Mathlib 082e2d3 (`NumberTheory/Height/Projectivization.lean:51`). Every planned layer id was checked against `data/atlas.json`.
- No Lean was written or compiled; none is a deliverable of this job.
