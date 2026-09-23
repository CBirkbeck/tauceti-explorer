# PAPER-DIMITROV-GAO-HABEGGER-21: Uniformity in Mordell–Lang for curves

Vesselin Dimitrov, Ziyang Gao and Philipp Habegger, *Uniformity in Mordell–Lang for curves*, [Annals of Mathematics 194 (2021), 237–298](https://doi.org/10.4007/annals.2021.194.1.4); arXiv [2001.10276](https://arxiv.org/abs/2001.10276).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1109). Status: **complete**. The whole of arXiv v3 was read and every missing item is routed once. The machine-readable extraction is [PAPER-DIMITROV-GAO-HABEGGER-21.result.json](PAPER-DIMITROV-GAO-HABEGGER-21.result.json): 68 items (14 planned, 54 missing), 8 routes, 11 prerequisite entries and 16 recorded source issues. The independent review (REV-PAPER-DIMITROV-GAO-HABEGGER-21) corrected it in place; its changes are listed at the end.

**Source.** arXiv v3 (31 March 2021, the latest version; 49 pages), [PDF](https://arxiv.org/pdf/2001.10276v3), SHA-256 `5fc8e86f53ee43e9d18e8239a8db986bff74115ddb947abef4902a72dde338a4`, read in full on 2026-09-22. The typeset Annals PDF was not accessible, so locators refer to v3 and the published text was not collated.

## What the paper proves

- **Theorem 1.1.** A smooth curve of genus g ≥ 2 over a number field of degree ≤ d has at most c(g,d)^{1+ρ} rational points, where ρ is the Mordell–Weil rank. This answers Mazur's question, and c grows at most polynomially in d.
- **Theorem 1.2.** If h(ι([Jac C])) ≥ c₁(g), then #((C(ℚ̄) − P₀) ∩ Γ) ≤ c₂(g)^{1+ρ} for every finite-rank Γ. Corollary 1.3 is the torsion case.
- **Theorem 1.4.** #((C − P₀) ∩ Jac(C)_tors) ≤ c(g,d) for C defined over a field of degree ≤ d.
- **Theorem 1.6 / B.1 (height inequality).** On a non-degenerate subvariety X of an abelian scheme A → S, ĥ_A(P) ≥ c₁ h(π(P)) − c₂ on a Zariski open dense subset.

The strategy, in five steps:

1. **Betti map and Betti form (§2).** These are built from the real-coordinate uniformization ℝ^{2g} × ℍ_g of the universal abelian variety. The key identity is ω̂ = 2(da)ᵀ∧db, which shows the top power of ω on X is nonzero exactly when the Betti rank is 2 dim X.
2. **Height inequality (§§3–5).** Using the graph of [N], Proposition 4.2 bounds (F^d) from below by κN^{2d} by integrating [N]*ω = N²ω. Proposition 4.3 bounds (M·F^{d−1}) from above by cN^{2(d−1)}, via iterated quartic duplication formulas and Fulton positivity. Siu's criterion then gives h([N]P) ≥ c₁N²h(π(P)) − c₂(N), and the Silverman–Tate comparison kills the error term.
3. **Non-degeneracy (§6).** Gao's theorem makes the Faltings–Zhang image D_M(C^{[M+1]}_S) non-degenerate for M ≥ 3g − 2.
4. **Sparsity and small points (§7).** The height inequality on that image yields the Néron–Tate distance alternative, Proposition 7.1. Its ingredients are Lemma 6.4 (the Hurwitz bound 84(g − 1)) and Lemma 6.3.
5. **Counting (§8).** Rémond's Vojta method handles large points. Ball packing with Proposition 7.1 handles small points, giving Proposition 8.1 and the theorems. The case of small moduli height is finished by Northcott.

## What the atlas already has

- **Library.** Mathlib has the Weil height on projective space relative to a number field (`Projectivization.logHeight`), not the absolute height on ℙⁿ(ℚ̄); the review therefore marks the absolute height as planned by RP.0.
- **Planned.**
  - HeightsRationalPointsAndObstructions: RP.0 (heights, Néron–Tate heights, height comparison under morphisms, Northcott), RP.1 (Mordell–Weil), RP.4 (Faltings) and RP.5 (Manin–Mumford).
  - PELModuli M5–M6: fine moduli A_{g,ℓ} and A_{g,D,ℓ}, and coarse spaces.
  - AlgebraicModuliForArithmeticGeometry R09.7: characteristic-zero resolution.
  - Tau Ceti AlgebraicCurves layer 11: the Hurwitz bound.

## Routes

1. **Source of RP.0 and RP.5.** The paper is a source for:
   - Silverman–Tate in families (Theorem A.1 and Proposition A.2);
   - independence of the Néron–Tate normalization (Remark 3.2);
   - Serre's quartic formula for [2];
   - finite-rank groups and the Faltings–Zhang morphism.
2. **Source of AbelianSchemesAndArithmeticModuli A2.** It covers Raynaud's symmetric relatively ample bundles and projective presentations (Faisceaux amples XI), and Mumford's isogeny to a principal polarization with its extension over étale covers.
3. **Source of SchemeAndStackFoundations SF.0 and SF.5.** It covers:
   - EGA IV 21.4.13 and 17.16.3;
   - Cartier/Weil divisors on regular schemes;
   - Siu's bigness criterion, Fulton positivity on multiprojective space, and Bézout.
4. **Source of ComplexComparisonPartII C5.** It covers integration of positive forms over analytic sets, and the fact that integrals of Fubini–Study powers compute intersection numbers.
5. **Part II `AbelianSchemesBettiMapsPartII`**, reusing the id proposed by PAPER-GAO-GE-KUHNE-26. It holds the Betti map (Propositions 2.1 and B.2) and the mixed uniformization, the Betti form (Lemmas 2.3–2.6, Proposition 2.2) with its rank characterization (Proposition 2.7), non-degeneracy (Definitions 1.5 and B.4, Lemma B.3) and Gao's Theorem 6.2. This paper is the natural foundational source for that Part II.
6. **Part II `HeightsRationalPointsAndObstructionsPartII`**, reusing the id from YUAN-26 and GAO-GE-KUHNE-26. It holds:
   - the height inequality (Theorems 1.6 and B.1, Propositions 4.1–4.3, the graph construction);
   - Lemmas 6.1, 6.3 and 6.4, and Proposition 7.1;
   - Rémond's Lemma 8.2, the c_NT and h₁ bounds, and Proposition 8.1;
   - the four main results.
7. **Part II `StableReductionPartII`**, reusing the id from YUAN-26. It adds the fine moduli space M_{g,ℓ} with its universal curve, and the Torelli morphism and its finiteness. Tau Ceti StableReduction explicitly stops before moduli.
8. **Part II `JacobianChallengePartII`**, reusing the id from YUAN-26. It adds the relative Picard and Jacobian schemes of the universal curve, and C_g → Pic¹ without a section.

No new roadmap id is minted. Every Part II here coalesces with a route already proposed by another paper.

## Source slips (`sourceIssues` E1–E16)

E7–E16 were added by the review, and E6's repair was revised; see the end.

- **E1** In §1.3, "regular locus of X" should read "of S".
- **E2** In §4, Proposition 4.3 is announced as a lower bound; it is an upper bound.
- **E3** In the proof of Theorem 6.2, "M ≥ j_ε(C_S)" should be "M ≥ dim j_ε(C_S)".
- **E4** In the proof of Theorem 1.2, a self-reference ("as in the proof of Theorem 1.2") should point to the remark after Theorem 1.1.
- **E5** In Appendix B, "six dévissage steps" should be seven; "(i)–(v)" should be "(i)–(vi)"; and "(Hyp) is (iv) and (v)" should be "(v) and (vi)".
- **E6** (gap, affects the proof) Theorem 1.4 quantifies over all base points P₀. Raynaud's theorem, applied curve by curve, bounds the torsion on each C − P₀ but not uniformly in P₀.
  - For g ≥ 3 the uniform bound follows from Raynaud's theorem for the surface C − C.
  - For g = 2 a uniform Manin–Mumford for translates is needed.
  - Kühne's later uniform Manin–Mumford theorem proves Theorem 1.4 outright.
  - (Superseded by the review: Rémond's bound, which the paper already uses, gives the uniform bound for every g ≥ 2; see the end.)

No erratum is listed for the paper. The findings are recorded against arXiv v3, since the published text was not accessible.

## Prerequisites not yet covered

- Gao's Betti-rank paper and mixed Ax–Schanuel (Compositio 2020).
- Gao–Habegger 2019: queued but not yet extracted.
- DGH19 (IMRN).
- Rémond's two 2000 papers, and David–Philippon 2002.
- Silverman 1983 (Crelle).
- Philippon's arithmetic Bézout, and Bost–Gillet–Soulé.
- Raynaud, *Faisceaux amples*.
- Genestier–Ngô, and Oort–Steenbrink.
- Demailly, Voisin, and Lazarsfeld.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-DIMITROV-GAO-HABEGGER-21.result.json`: ok.
- Every missing item appears in exactly one route, and no source route takes a planned or library item.
- Planned layer ids were checked against `data/atlas.json`. The Mathlib citation was read at 082e2d3 (`NumberTheory/Height/Projectivization.lean:51`). Prerequisite DOIs were checked against Crossref.
- No Lean was written or compiled; none is a deliverable of this job.

## Independent review corrections (REV-PAPER-DIMITROV-GAO-HABEGGER-21, 23 September 2026)

The review read the whole of arXiv v3 (the same SHA-256). The Annals PDF needs a subscription. The review also read two supporting sources:
- David–Philippon [DP02], p.643 (Rémond's bound);
- Gao's Theorem 1.3 (arXiv 1810.12929), for E3 and item 25.

All routes are accepted. E1–E6 are confirmed, and E6's repair is revised.

**Status change.** Item 6, the absolute Weil height on ℙⁿ(ℚ̄), moves from library to planned by RP.0.
- Mathlib's `Projectivization.logHeight` is the height relative to a field with admissible absolute values.
- For a number field it is not normalized by the degree, and there is no ℚ̄ version.

**Items corrected in place:**
- **12.** It now states exactly when τ is injective: τ(C,α) = τ(C′,α′) iff (C′,α′) ≅ (C,±α), so τ is injective for g = 2. The StableReduction Part II acceptance test is corrected to match.
- **13.** M ≥ 1, with the p.28 locator.
- **18, 20.** N ∈ ℤ, and item 18's locator is pp.9–10.
- **22.** Adds (Hyp) and that Δ is the domain of a Betti map.
- **25.** Over ℚ̄, with Gao's hypotheses listed.
- **26.** S is regular; the sections give a spanning set of H⁰, not necessarily a basis.
- **29.** Restricted to abelian schemes over a regular base, as the paper uses it.
- **33, 34, 41, 43.** Locators corrected, and item 34 is stated for any line bundle.
- **36–38.** The standing hypotheses are added. Proposition 4.3 uses dominance and projective normality but not (Hyp).
- **39–40.** h_{S̄} replaces h_S.
- **50.** The quasi-section factorization is restated the right way round.
- **62.** Only a ℚ̄-isomorphism class is finite, not F′.

**New items:**
- **64. The Height Machine**, planned by RP.0.
- **65. [N]*L ≅ L^{N²}**, planned by Tau Ceti JacobianChallenge layer E.
- **66. Projective normality** (Mumford); missing, routed to A2.
- **67. Rémond's bound**; missing, routed to the uniformity Part II.
- **68. Faltings, modular and theta height comparisons**, planned by R35.3 and R35.5.

**Revised E6.** The uniform-in-P₀ bound for the finitely many small-height curves in Theorem 1.4 follows from Rémond's bound with Γ the torsion subgroup, for every g ≥ 2. The paper already uses that bound after Theorem 1.1. The extraction's claim that g = 2 needs Kühne's uniform Manin–Mumford was wrong.

**Ten new issues, all confirmed:**
- **E7** (misprint, pp.17–18). ϑ and θ are swapped.
- **E8** (error, p.17). Extending ϑ by zero outside K is not smooth.
- **E9** (error, (4.13), p.21). The bound fails when D′ = 0; use max{1, D′}.
- **E10** (gap, pp.39–40). The last Height Machine step needs a comparison on the resolution. It holds over S.
- **E11** (error, p.6). "not injective as we have level structure" is false for g = 2.
- **E12** (misprint, p.6). The target of D_M is 𝔄_g^{[M]} ×_{A_g} M_g.
- **E13** (misprint, p.4). The ball count is (1 + 2√(c₀c₃))^ρ.
- **E14** (gap, pp.11–12). The proof of Proposition 2.7 is incomplete. It is repaired pointwise: ker ω|_{T_xX} = ker db_Δ|_{T_xX}.
- **E15** (gap, p.43). In the second dévissage x must be chosen over the regular locus, which Lemma B.3 allows.
- **E16** (misprint, p.27). The Betti map's target is T^{2Mg}.

None affects a stated theorem.
