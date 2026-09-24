# PAPER-CARAIANI-SCHOLZE-17: On the generic part of the cohomology of compact unitary Shimura varieties

Ana Caraiani and Peter Scholze, *On the generic part of the cohomology of compact unitary Shimura varieties*, [Annals of Mathematics (2) 186 (2017), no. 3, 649–766](https://doi.org/10.4007/annals.2017.186.3.1); arXiv [1511.02418](https://arxiv.org/abs/1511.02418).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1161). **Corrected in place by the independent review REV-PAPER-CARAIANI-SCHOLZE-17** (issue #1162, Claude Code, session `cc-72825f`); every change is listed in `research/blueprint/reviews/REV-PAPER-CARAIANI-SCHOLZE-17.md`. This report describes the corrected file.

The machine-readable extraction is [PAPER-CARAIANI-SCHOLZE-17.result.json](PAPER-CARAIANI-SCHOLZE-17.result.json). It has:
- 164 items: 1 library, 56 planned, 107 missing (items 125–164 were added by the review);
- 17 routes: one Part II of IgusaVarietiesAndTorsionConcentration and 16 source routes, taking every missing item exactly once;
- 19 prerequisite entries;
- 100 recorded mistakes: 77 misprints, 11 errors and 12 gaps.

## Sources read

- **The published version**, read in full. It is the Annals PDF (118 pages, pp. 649–766), which is free on the journal site. Item locators are journal pages.
- **arXiv:** 1511.02418 has only v1 (November 2015), from before refereeing. It was used to check the bibliography and to see which recorded misprints it already contains.
- **Errata:** the Annals page lists no erratum, and Crossref records no update.
- **Page images:** all 77 misprints (E1–E13 from the extraction, the rest from the review) were checked on the page images.

## What the paper proves

**Main theorem (Theorem 1.1, precisely Theorem 6.3.1).**
- The setting is a compact unitary Shimura variety: Kottwitz's simple ones, or unitary groups quasi-split at every finite place.
- Take m a system of Hecke eigenvalues in H^i(S_K, F_ℓ). Then:
  - there is a Galois representation ρ_m with the expected Frobenius characteristic polynomials;
  - if ρ_m is unramified and *decomposed generic* above some prime p that splits completely in F, then H^i(S_K, F_ℓ)_m vanishes outside the middle degree.
- Decomposed generic means Frobenius eigenvalue ratios avoid 1 and q.
- So the Z_ℓ-cohomology localized at m is torsion-free and concentrated in the middle degree.

**The strategy: work at an auxiliary prime p ≠ ℓ through the Hodge–Tate period map π_HT : S_{K^p} → Fℓ_{G,µ}.**
- **§2** refines π_HT for Hodge-type data:
  - it lands in the flag variety of G;
  - automorphic vector bundles are pullbacks along it.
- **§3** stratifies Fℓ_{G,µ} by B(G, µ^{-1}):
  - a point modifies the trivial G-bundle on the Fargues–Fontaine curve at ∞, using the isomorphism of Fℓ_{G,µ} with a minuscule Schubert cell of the B_dR^+-Grassmannian;
  - the strata are locally closed, with the basic one open and the µ-ordinary one closed.
- **§4** identifies the fibres of π_HT over the b-stratum with perfect Igusa varieties (Theorem 4.4.4). It uses:
  - Rapoport–Zink spaces of PEL type at infinite level;
  - Chai–Oort's internal Hom p-divisible groups;
  - a product formula.
- **§5** computes the alternating Igusa cohomology with Shin's stable trace formula and base change. For b not µ-ordinary, generic principal series are killed by the Langlands–Jacquet map (Theorem 5.5.7).
- **§6** shows that the nearby cycles of Rπ_HT*F_ℓ are perverse (Proposition 6.1.3). So on a minimal nonzero stratum Igusa cohomology is concentrated in one degree (Corollary 6.1.4), and genericity forces that stratum to be µ-ordinary.


## What the atlas already has

The atlas's **IgusaVarietiesAndTorsionConcentration** roadmap implements this method for the *non-compact* sequel (Caraiani–Scholze 2024). Its layers are written for that paper's quasi-split U(n, n) datum, and **EndoscopicTransferAndUnitaryTraceComparison** builds Shin's trace formula and base change for the sequel's even-rank group. An item is marked planned here only when a stage covers it in this paper's generality (unramified PEL data of type (A) or (C), arbitrary n and signature); an item that a stage covers only in the sequel's special case is missing and is routed to that stage by a source route that widens it.

**Planned (56 items).** Each item's `planned` field names the stages, and its note quotes them. The main owners are:
- the Shimura data, PEL moduli and automorphic bundles (ShimuraData D3–D5, ShimuraVarieties V0–V8, PELModuli M0–M5, AutomorphicBundles B0–B2);
- the perfectoid Shimura varieties and the Hodge–Tate period map (PerfectoidShimuraVarieties S1–S3, HodgeTateAndCanonicalSubgroups T1–T2);
- relative p-adic Hodge theory (PadicHodgeTheory P8, P8:local-rational);
- B(G), κ and ν, and Lemma 3.5.5 (BunGAndNewtonStrata BG0–BG2:uniformization);
- the Fargues–Fontaine curve and its bundles (Tau Ceti adic spaces, RelativeFarguesFontaine RF0–RF4, VectorBundlesAndIsocrystals VB0–VB4);
- the B^+_dR-Grassmannian (GeometricSatakeAndFusion GS0:loop-geometry);
- continuity of étale cohomology (DiamondEtaleCohomology C0, ClassicalAdicEtaleCohomology H0), Leray spectral sequences (DiamondsAndVStacks D0);
- Grothendieck–Messing theory (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2);
- Theorem 5.5.4, Badulescu's map, local Langlands and Moeglin–Waldspurger (AutomorphicGaloisRepresentationsPartII AG2, EndoscopicTransferAndUnitaryTraceComparison ET.6, ET.7a);
- Matsushima's formula (AutomorphicSpectralTheory AS.4–AS.5, ArithmeticLocallySymmetricSpaces ALS.5), Deligne–Serre lifting (AlgebraicModularFormsAndSerreWeights R15.5), Brauer–Nesbitt and Chebotarev.

**Library (1 item).** Mathlib's `WittVector.Isocrystal` is Definition 3.1.1, and `WittVector.isocrystal_classification` covers the rank-one case of Dieudonné–Manin.

## Routes

| Route | Owner | Items |
|---|---|---:|
| 1. part-ii | `IgusaVarietiesAndTorsionConcentrationPartIICompactUnitary` — *Igusa varieties, compactified period fibers and torsion concentration, Part II: compact unitary Shimura varieties* (`langlands`) | 15 |
| 2. source | `IgusaVarietiesAndTorsionConcentration` — IG.0, IG.1, IG.3, IG.4 | 39 |
| 3. source | `BunGAndNewtonStrata` — BG1, BG2:uniformization, BG3 | 10 |
| 4. source | `GeometricSatakeAndFusion` — GS0:Schubert-smoothness | 6 |
| 5. source | `PadicHodgeTheory` — P8 | 3 |
| 6. source | `HodgeTateAndCanonicalSubgroups` — T2 | 3 |
| 7. source | `FiniteFlatGroupsAndIntegralPadicHodgeTheory` — R07.1, R07.2 | 5 |
| 8. source | `EndoscopicTransferAndUnitaryTraceComparison` — ET.0, ET.1, ET.4, ET.5, ET.6, ET.7b | 14 |
| 9. source | `AutomorphicGaloisRepresentationsPartII` — AG2.0, AG2.2, AG2.5, AG2.7 | 4 |
| 10. source | `PerfectoidSpaces` — P7 | 1 |
| 11. source | `VectorBundlesAndIsocrystals` — VB1 | 1 |
| 12. source | `DiamondEtaleCohomology` — C8 | 1 |
| 13. source | `InverseGaloisAndArithmeticFundamentalGroups` — IG.0 | 1 |
| 14. source | `AutomorphicBundles` — B1 | 1 |
| 15. source | `ComplexComparisonPartII` — C5 | 1 |
| 16. source | `AutomorphicLFunctionsAndLocalFactors` — AL.3 | 1 |
| 17. source | `EtaleDualityAndPerverseSheaves` — EDC.5 | 1 |

**The Part II (route 1)** is the compact endgame that nothing owns: Theorem 1.1 = Theorem 6.3.1 with its Galois representations and its proof inputs (the Hochschild–Serre sequence at p, the dual Hecke ideal), the obstruction at a prime that is only split in 𝒦 (Theorem 5.5.7), the simple-Shimura branch of §5.6, and Lemma 6.2.2. Its brief states the final theorems with their corrections and names every import.

**The Igusa geometry (route 2)** widens IgusaVarietiesAndTorsionConcentration IG.0, IG.1, IG.3 and IG.4 to unramified PEL data of type (A) or (C) and to compact Shimura varieties of Hodge type. Each item has one layer: finite-level characteristic-p geometry in IG.0 and IG.1, everything that needs generic fibres, infinite level or the period map in IG.3, and the compact-case perversity and concentration (Proposition 6.1.3, Corollary 6.1.4) in IG.4 as statements separate from the non-compact bounds. The route lists the new stage dependencies it needs (SF.4 into IG.0, a direct edge from R07.1, which is already upstream of IG.0, and BG3 into IG.3 and IG.4); none closes a cycle.

**Shin's trace formula and the Galois representations (routes 8–9)** widen EndoscopicTransferAndUnitaryTraceComparison and AutomorphicGaloisRepresentationsPartII to the groups G_n⃗ of every rank and inner forms of arbitrary signature, instead of planning them a second time in the Part II.

**The local inputs (routes 3–7 and 10–17)** send the Newton strata of the flag variety to BunGAndNewtonStrata (BG1, BG2:uniformization, BG3), the Bialynicki-Birula isomorphism to GeometricSatakeAndFusion, the relative Hodge–Tate filtration to PadicHodgeTheory P8, p-divisible groups over O_C to HodgeTateAndCanonicalSubgroups T2 and FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.2, and the remaining general statements to their owners.

## Source issues (`sourceIssues` E1–E100)

- **E1–E13**, recorded by the extraction, are confirmed misprints.
- **E14–E100** were found by the review. Every misprint was checked on the page image; every error and gap was confirmed by two independent checks, with a reconciling reading where they differed; and every error in a stated result was read once more by a referee trying to defend the paper.
- In total: 77 misprints, 11 errors and 12 gaps; 5 affect a stated result, 8 a proof and 87 nothing downstream. The Annals page lists no erratum and Crossref records no update.

**Stated results affected; none of them changes the main theorems.**
- **Proposition 4.2.14** (p. 709): the fibre products must be taken over Spa(Ĕ(ζ_{p^∞})^∧), the base of M_{D,∞}; over Ĕ, as printed, the action map is an isomorphism only onto an open and closed part. Its one use, Proposition 4.2.23, is unaffected (E44).
- **Remark 4.2.17** (p. 710) needs R integrally closed: over the affine line with two points glued, an étale p-divisible group gives a counterexample. The proof of Lemma 4.3.15 that uses it has a gap, which passage to the normalisation closes (E45, E56).
- **Red^b and Lemma 5.4.2** (pp. 739–740): the definition omits Shin's twist by δ̄^{1/2}_{P(ν_b)}; with it, Lemma 5.4.2 holds, and twisting preserves the vanishing used later (E74).
- **Lemma 5.5.1** (p. 742): Π^n⃗_∞ is cohomological with respect to the endoscopic weights Ξ(φ_n⃗), not the trivial representation, when n⃗ ≠ (n); regularity, which is all that is used, still holds (E77).
- **Corollary 5.5.2** (p. 743): its first assertion must be stated for the total contribution of a Hecke eigensystem, since terms from different n⃗ can cancel; the later arguments use only the converse or the total form (E79).

**Proofs affected; the results hold with the recorded repairs** (E25, E43, E56, E83, E87, E91, E97, E98). Among them: Lemma 2.3.6 applies Blasius's theorem at points not defined over number fields (E25); Proposition 4.2.11's symplectic case mishandles the middle slope (E43); Theorem 5.5.4 is claimed at places above ℓ (E83); the proof of Theorem 5.5.7 needs a central shift in Shapiro's reduction (E87); the proof of Proposition 6.1.3 does not algebraize its formal model (E91); and the proof of Theorem 6.3.1 localizes at 𝔪 where only its contraction away from p acts and does not prove that ρ_𝔪 is unramified with the right Frobenius polynomials above p, which needs a second auxiliary prime (E97), and leaves the dual ideal implicit (E98).

**Misprint of note.** Proposition 3.5.7(1) says "lower semicontinuous" where the paper's order on B(G) requires "upper": as printed, the basic stratum would be closed, contradicting Corollary 3.5.9 and the modular-curve example (E35).

The full list, with every printed text, correction and reason, is in the result file.

## Prerequisites not yet covered

The extraction's thirteen entries (Scholze's torsion and Lubin–Tate papers, Scholze–Weinstein, Shin's three papers, Mantovan, Kedlaya–Liu, Fargues, Hamacher, Oort–Zink, Caraiani, Chenevier–Harris) and six added by the review: Kottwitz (Invent. Math. 1992), Shin (Amer. J. Math. 2012), Arthur (Invent. Math. 1989), Goldring with Shin's appendix (Compos. Math. 2014), Berthelot (Ann. Sci. ÉNS 1980) and Rapoport–Zink (1996). Each link was checked against its Crossref record.

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-CARAIANI-SCHOLZE-17.result.json` and `python3 research/blueprint/intake.py check-files` pass on the corrected file. Every planned and route stage id is an atlas stage; every missing item is taken by exactly one route and no other item by any. No Lean deliverable is part of a paper job.
