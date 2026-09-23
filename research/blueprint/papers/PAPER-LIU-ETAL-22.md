# PAPER-LIU-ETAL-22: the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives

Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu, *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*, [Inventiones Mathematicae 228 (2022), 107–375](https://doi.org/10.1007/s00222-021-01088-4); arXiv [1912.11942](https://arxiv.org/abs/1912.11942) (v3).

Extraction by Claude Code, session `cc-d67081`, 23 September 2026 (issue #1280). Status: **partial** — the main results, the definitions they depend on and the pillars of the proof are items; the remaining numbered statements are listed in the handoff. Every missing item is routed exactly once.

**Source.** arXiv v3 (17 August 2021, 179 pages, SHA-256 `84dc7c83…46fe86`), read on 2026-09-23. The published version is behind the Springer paywall and was not read; all locators are to v3. In v3 the original Appendix E was separated into an independent article, arXiv:2108.06998 — *Deformation of rigid conjugate self-dual Galois representations*, since published in Acta Math. Sinica 40 (2024) — which is the companion [LTXZZ] supplying the R=T theorem, so it is **not** part of the article extracted here.

## What the paper proves

Let F/F^+ be a CM extension, n ≥ 2, and n_0, n_1 the even and odd members of {n, n+1}. A representation Π of GL_N(A_F) is **relevant** (Definition 1.1.3) if it is cuspidal, satisfies Π ∘ c ≅ Π^∨, and has the prescribed principal-series components at the archimedean places.

- **Theorem 1.1.5 (= Theorem 8.2.2).** For Π_0, Π_1 relevant of GL_{n_0} and GL_{n_1} with strong coefficient field E, F^+ ≠ Q, if L(1/2, Π_0 × Π_1) ≠ 0 then H^1_f(F, ρ_{Π_0,λ} ⊗ ρ_{Π_1,λ}(n)) = 0 for every admissible prime λ.
- **Theorem 1.1.1 (= Corollary 8.2.3).** The case of symmetric powers of two non-isogenous modular elliptic curves over F^+.
- **Theorem 1.1.7 (= Corollary 8.2.5).** A family in which all but finitely many λ are admissible.
- **Theorem 1.1.9 (= Theorem 8.3.2).** If the Abel–Jacobi image Δ_λ of the diagonal cycle is nonzero, the Selmer group has dimension 1 — half of the rank one prediction, the other half being Conjecture 8.3.1 and Beilinson's injectivity conjecture.

**The method.** Kolyvagin's strategy — torsion classes annihilating the Selmer group — but with a **level-raising system** rather than an Euler system, after Bertolini–Darmon and Liu. At a level-raising prime p, the singular part of the local Galois cohomology of the cohomology of the special fibre of a unitary moduli scheme with Iwahori level is canonically isomorphic to functions on a Shimura set. One inclusion is the geometry of the special fibre — its Deligne–Lusztig strata and Tate cycles, the technical heart of the article, using all the appendices (§5, 90 numbered statements). The equality of cardinalities is deformation theory: a mixed deformation ring with unramified and ramified quotients whose modules are finite free of equal rank, by the R=T theorem of the companion paper (§6.3) together with an automorphic comparison of ranks (§6.4, Proposition 6.4.1). Merging n_0 and n_1 gives the **first explicit reciprocity law** (Theorem 7.2.8), computing the singular localization of the classes as a period over a Shimura set; Lemma 8.2.1 supplies the nonvanishing of that period from L(1/2, Π_0 × Π_1) ≠ 0. A **second explicit reciprocity law** (Theorem 7.3.4) does the corresponding work for the diagonal cycle.

**What is assumed.** Hypothesis 3.2.10, on the cohomology of unitary Shimura varieties, for both n and n+1; the seven conditions (L1)–(L7) defining an admissible prime; and, for (L6), the R=T theorem of the companion paper. F^+ ≠ Q is needed only because Hypothesis 3.2.10 is open for N ≥ 4 over Q and because the Caraiani–Scholze generalization of Proposition D.1.3 is unavailable there; for n = 2 a different argument removes it (Remarks 1.1.6 and 1.1.10).

## What the libraries already have

**Nothing of this paper.** There are no library items. The nearest declarations, recorded as notes:

- Tau Ceti at f790474 has a substantial **continuous group cohomology** development (`TauCeti.ContinuousCohomology`: cochains, cocycles, `H1`, degree zero, low degrees, inflation, restriction, corestriction, cup products, Shapiro, long exact sequences, conjugation), which is the substrate §2 would be built on;
- Mathlib at 082e2d3 has abstract group cohomology (`groupCohomology.inhomogeneousCochains`);
- Tau Ceti has abelian varieties with endomorphisms and isogenies, and an Abel–Jacobi map for curves (`WeilDivisor.OrderSystem.weightedAbelJacobiDivisorClass`), which is not the ℓ-adic Abel–Jacobi map used here.

There is no Galois cohomology of a number field, no local condition or singular quotient, no Bloch–Kato Selmer group, no étale cohomology, no nearby cycles, no Deligne–Lusztig variety, no Shimura variety and no Galois deformation ring at the pinned commits.

## What the atlas already has

A survey of every roadmap, stage and decomposition file found that **nothing plans this paper**, but that most of its inputs are planned and — more unusually — that **its geometry is already owed to the atlas by its neighbours**. Ten items are planned:

- the Bloch–Kato Selmer group and the local conditions — `SelmerIwasawaCohomology:L2` and `L4`, with `ArithmeticGaloisDuality:R02.5`;
- the Galois representations of relevant Π, local–global compatibility, strong coefficient fields and polarizable lattices — `AutomorphicGaloisRepresentationsPartII:AG2.0`, `AG2.2`, `AG2.5`, `AG2.7`, whose decomposition already names Chenevier–Harris and Caraiani;
- the realization of those representations in the cohomology of unitary Shimura varieties (Hypothesis 3.2.10) — `AG2.1a` with `AG2.2`;
- nearby cycles — `IgusaVarietiesAndTorsionConcentration:IG.4`, whose `IG.7` is the Caraiani–Scholze middle-degree concentration that Appendix D generalizes;
- the polarized deformation functor over a CM field — `GlobalGaloisDeformations:G7` and `G8`;
- the Rankin–Selberg local factors and the unitary Satake parameters — `AutomorphicLFunctionsAndLocalFactors:AL.3` and `AL.4`;
- the statement of the Bloch–Kato conjecture — `PeriodsAndSpecialValues:PS.6`.

What has no stage anywhere: **arithmetic level raising**, the **first and second explicit reciprocity laws** of Bertolini–Darmon type, **bipartite Euler systems**, **Beilinson–Bloch**, **Gan–Gross–Prasad**, **diagonal cycles**, **Deligne–Lusztig varieties**, **Tate cycles on special fibres**, and an **R=T theorem for unitary groups**. The atlas's explicit reciprocity laws (`KatoEulerSystems:L3`, `RankZeroOneBSD:BSD.6`, `GeneralizedHeegnerCycles:GH.4`) are the Kato/Coleman-map kind, and its Euler-system roadmaps are built on ray-class extensions and norm relations — a different mechanism.

## Routes

Four, three of which join roadmap ids that other extractions already propose.

**1. Part II of `PELModuli`: `UnitaryRapoportZinkSpacesAndRSZModels` (7 items).** The unitary O_F-abelian schemes and CM moduli scheme of §§3.3–3.5, special and very special inert primes, the smooth moduli schemes of §4 with the localization map of Construction 4.6.1, the Iwahori-level schemes of §5 with their strictly semistable special fibres, Deligne–Lusztig strata and Tate cycles, and the appendices that support them. **This material is already owed:** PAPER-LI-LIU-21, PAPER-LI-LIU-22 and PAPER-DISEGNI-LIU-24 cite exactly these sections as `[LTXZZ, §§3.4, 4.1, 5.1–5.5, Prop. 5.5.4, Lemma C.2.3, Thm. D.1.3]`, mark the items missing, and route them to this same proposed Part II.

**2. New roadmap `GanGrossPrasadConjecturesForClassicalGroups` (3 items).** Lemma 8.2.1 — the step that turns L(1/2, Π_0 × Π_1) ≠ 0 into a nonvanishing period over a Shimura set — the diagonal cycle with its Abel–Jacobi class, and Conjecture 8.3.1. The id is that proposed by PAPER-JIANG-ZHANG-20 and extended by four further extractions; `GrossZagierAndArithmeticHeights` explicitly excludes a general higher-dimensional arithmetic GGP theorem from its scope.

**3. New roadmap `ArithmeticLevelRaisingAndBipartiteEulerSystems` (21 items).** The method and the main theorems: admissible primes, the Selmer reduction and localization propositions of §2, level-raising primes and the level-raising isomorphism (Theorems 6.2.3, 6.3.5, Proposition 6.4.1), the two explicit reciprocity laws, the system of torsion classes, and the final bound. Area `iwasawa`. This is the genuinely unhoused, new-roadmap-sized piece; the brief asks that the earlier papers in the same programme — Liu's twisted triple products, Liu–Tian's Hilbert modular case — be designed in as instances of the same mechanism.

**4. Part II of `PotentialAutomorphyInfrastructure`: `PolarizedAutomorphyLifting` (1 item).** The R=T theorem of the companion article, which is the only step of the argument not proved in this paper. The id is that proposed by PAPER-BOXER-CALEGARI-GEE-25 and extended by the Newton–Thorne extractions; no stage in the atlas states an R=T theorem for unitary groups.

## Prerequisites not yet covered

The companion article (arXiv:2108.06998, Acta Math. Sinica 40 (2024)); Bloch–Kato and Kolyvagin for the framework; Bertolini–Darmon, and Liu and Liu–Tian, for the level-raising systems this generalizes; Caraiani and Chenevier–Harris for the Galois representations; Caraiani–Scholze for the cohomological vanishing; Gan–Gross–Prasad for the conjecture. Every DOI was resolved on Crossref except the Astérisque volume of Gan–Gross–Prasad, which links to MathSciNet.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LIU-ETAL-22.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the three files: 3 files, 0 problems.
- Lean: none.
- The library survey ran against the declaration index of the pinned commits, Mathlib 082e2d3 and Tau Ceti f790474; the declarations cited in notes were read there.
- The atlas was surveyed across all roadmaps, stages and decomposition files, and the existing extractions were grepped for `LTXZZ`, Gan–Gross–Prasad and Beilinson–Bloch before the routes were chosen.
- No `sourceIssues` field: the proofs were not read, so the file asserts nothing about mistakes. The consistency of the introduction's Theorems 1.1.1, 1.1.5 and 1.1.9 with their body forms (Corollary 8.2.3, Theorems 8.2.2 and 8.3.2) was checked, including the parity bookkeeping of n_0 and n_1 and the substitution of "F^+ ≠ Q" for Hypothesis 3.2.10; they agree.
