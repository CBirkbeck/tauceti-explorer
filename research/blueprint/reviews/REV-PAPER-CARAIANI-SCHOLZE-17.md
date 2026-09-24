# Review: PAPER-CARAIANI-SCHOLZE-17 (Caraiani–Scholze, On the generic part of the cohomology of compact unitary Shimura varieties)

Job `REV-PAPER-CARAIANI-SCHOLZE-17` (issue #1162), by Claude Code, session `cc-72825f`, 24 September 2026. The extraction (issue #1161) was written by Claude Code, session `cc-39fac3`.

**Verdict: accept**, after the corrections below, which were made in place in `PAPER-CARAIANI-SCHOLZE-17.result.json` and its report. All six submitted routes are accepted with corrections; the corrected file has 164 items (1 library, 56 planned, 107 missing), 17 routes, 19 prerequisites and 100 recorded mistakes. `PAPER-CARAIANI-SCHOLZE-17.review.json` gives a verdict on every final route.

## What was read

- **The published version**, Ann. of Math. 186 (2017), 649–766 (the Annals PDF, 118 pages, SHA-256 4f9449e5…, the file the extraction read). Published page = PDF page + 648.
- **arXiv:1511.02418v1**, the only arXiv version (pre-referee), compared wherever a statement or a mistake was checked.
- **Page images.** Every statement, locator and mistake was checked on rendered page images.
- **The atlas** (`data/atlas.json` with its stage dependencies), the draft roadmaps, the decompositions, the extraction of the non-compact sequel (PAPER-CARAIANI-SCHOLZE-24), and the pinned Mathlib 082e2d3 and Tau Ceti f790474 with their declaration index. Cited sources (Shin, Scholze–Weinstein, Rapoport–Richartz, Kedlaya–Liu and others) were read where a check needed them.

## Method

- **Items.** For each of seven parts of the paper (§1, §2, §3, §4.1–4.2, §4.3–4.4, §5, §6), one reader checked every item's statement, locator, name, kind, status and citation, and listed the definitions and results on the way to the main theorems that had no item. An independent checker re-read the paper and judged each proposed change; a final pass turned the checker's further findings, and the routing decisions, into exact field values.
- **Routes.** The six submitted routes were reviewed in three groups against the stage descriptions and the stage dependency graph, with the rule that an item is planned only when a stage covers it in this paper's generality.
- **Mistakes.** E1–E13 were checked on the page images. Six readers then read the paper section by section; every finding was checked on the page image (errors and gaps twice, once redoing the mathematics and once trying to defend the paper), merged with the item readers' suggestions, and reconciled where the checks differed. Every error in a stated result was read once more by a referee instructed to defend the paper.

## Changes made to the extraction

### Items

- **All 124 submitted items were corrected**: 116 statements (hypotheses, quantifiers and conventions restored; for example Theorem 1.1 now carries footnote 2's assumptions and separates its two parts, Definition 1.9 requires continuity and records the consequences on p. 755, and Proposition 3.5.7(1) reads "upper semicontinuous", E35), 21 locators, 11 names, the planning stages of 34 items and the library citations of 2 (35 items in all, since item 5 changed in both), each quoted in its note.
- **14 statuses changed.** Missing to planned: 43 (Lemma 3.5.5, BunGAndNewtonStrata BG2:uniformization), 62 (Remark 4.2.8, HodgeTateAndCanonicalSubgroups T1), 84 (Lemma 4.4.1, DiamondEtaleCohomology C0 and ClassicalAdicEtaleCohomology H0), 105 (Theorem 5.5.4, AutomorphicGaloisRepresentationsPartII AG2.0, AG2.2, AG2.3, AG2.5, AG2.6 and EndoscopicTransferAndUnitaryTraceComparison ET.7a). Planned to missing: 32 (the Robba rings, no stage plans them), 73 (the Newton stratification for general unramified PEL data, which IG.0 plans only for the sequel's datum), 123 (the Hochschild–Serre step of Theorem 6.3.1), and 90, 91, 93, 94, 96, 98, 99 (Shin's test functions, trace formula, base change and transfer at p, which EndoscopicTransferAndUnitaryTraceComparison plans only for the sequel's even-rank group). Item 123 joins the Part II; the others are routed by source to the stages that must widen.
- **40 new items (125–164):**
  - 125 The pro-étale fundamental group and J_b(Q_p)-torsors on S_proét (Bhatt–Scholze) (route 13, InverseGaloisAndArithmeticFundamentalGroups)
  - 126 The Newton stratifications correspond under π_HT on rank-one points (route 2, IgusaVarietiesAndTorsionConcentration)
  - 127 Shimura varieties S_K, their canonical models and the p-adic setup (planned: D5, V0, V1, V2, V6, V7, V8, R1)
  - 128 A reductive group is the stabilizer of finitely many tensors ([DMOS82, Prop. 3.1]) (route 14, AutomorphicBundles)
  - 129 Deligne: Hodge cycles on abelian varieties are absolute Hodge (planned: B1)
  - 130 Scholze: the relative Poincaré lemma for OB_dR (planned: P8:local-rational)
  - 131 Deligne: flat connections with regular singular points and analytic flat connections ([Del70]) (route 15, ComplexComparisonPartII)
  - 132 Minuscule cocharacters (route 4, GeometricSatakeAndFusion)
  - 133 Kedlaya–Liu: projectivity from locally constant fibre rank over uniform Banach rings (route 4, GeometricSatakeAndFusion)
  - 134 The B^+_dR-affine Grassmannian is a pro-étale sheaf (planned: GS0:loop-geometry, RF2:integral-divisors)
  - 135 Griffiths transversality of the universal filtration on Fℓ_{G,µ} for minuscule µ (route 4, GeometricSatakeAndFusion)
  - 136 Scholze: the B^+_dR-local system of a filtered module with integrable connection (route 5, PadicHodgeTheory)
  - 137 Rapoport–Richartz: the order on Newton points is detected on representations (route 3, BunGAndNewtonStrata)
  - 138 Scholze–Weinstein: Dieudonné theory up to isogeny over f-semiperfect rings (route 7, FiniteFlatGroupsAndIntegralPadicHodgeTheory)
  - 139 Scholze–Weinstein: rigidity of universal covers (route 7, FiniteFlatGroupsAndIntegralPadicHodgeTheory)
  - 140 Scholze–Weinstein: the Rapoport–Zink space at infinite level M_∞ and its description M'_∞ (route 2, IgusaVarietiesAndTorsionConcentration)
  - 141 Oort–Zink: completely slope divisible p-divisible groups (route 2, IgusaVarietiesAndTorsionConcentration)
  - 142 Berthelot: Dieudonné theory over perfect valuation rings (route 7, FiniteFlatGroupsAndIntegralPadicHodgeTheory)
  - 143 Scholze–Weinstein: the bundle of G ×_{O_C} O_C/p as a modification at ∞ (route 6, HodgeTateAndCanonicalSubgroups)
  - 144 Grothendieck–Messing deformation theory (planned: R07.2)
  - 145 Rank-one points of the fibres of π_HT over Fℓ^b_{G,µ} lie in the good-reduction Newton locus 𝒮^b_{K^p} (route 2, IgusaVarietiesAndTorsionConcentration)
  - 146 Preperfectoid adic spaces and their strong completions (Scholze–Weinstein) (route 10, PerfectoidSpaces)
  - 147 Hecke equivariance of Poincaré duality and the dual ideal 𝔪^∨ (route 1, IgusaVarietiesAndTorsionConcentrationPartIICompactUnitary)
  - 148 The alternating Igusa cohomology [H_c(I^b_Mant, Q̄_ℓ)] and its S-unramified part (route 2, IgusaVarietiesAndTorsionConcentration)
  - 149 The archimedean test functions φ^n⃗_∞ and f^n⃗_∞ for an inner form of arbitrary signature (route 8, EndoscopicTransferAndUnitaryTraceComparison)
  - 150 Shin: acceptable test functions determine virtual representations (route 8, EndoscopicTransferAndUnitaryTraceComparison)
  - 151 Badulescu: the Langlands–Jacquet map and generic principal series (planned: ET.6)
  - 152 The local Langlands correspondence for GL_n and generic principal series (planned: ET.6)
  - 153 Moeglin–Waldspurger: the discrete spectrum of GL_m (planned: ET.7a)
  - 154 Jacquet–Shalika: strong multiplicity one for isobaric representations (route 16, AutomorphicLFunctionsAndLocalFactors)
  - 155 The µ-ordinary element of B(G, µ^{-1}) (route 3, BunGAndNewtonStrata)
  - 156 Shin: stable base change for Kottwitz's simple Shimura varieties (route 9, AutomorphicGaloisRepresentationsPartII)
  - 157 The stable trace formula for S_K in the simple case and Red^b_n([H(S_K)]) (route 1, IgusaVarietiesAndTorsionConcentrationPartIICompactUnitary)
  - 158 Matsushima's formula for the proper Shimura varieties S_K (planned: AS.4, AS.5, ALS.5, M3)
  - 159 B(G) of a product and of a restriction of scalars (route 3, BunGAndNewtonStrata)
  - 160 Leray spectral sequence for π_HT and localisation away from p (planned: D0)
  - 161 Deligne–Serre lifting of Hecke eigensystems (planned: R15.5)
  - 162 Reduction and uniqueness of ρ_m (Brauer–Nesbitt and Chebotarev) (planned: R01.1, Tau Ceti Chebotarev, Layer 10)
  - 163 Finiteness from the rank-one valuative criterion (route 2, IgusaVarietiesAndTorsionConcentration)
  - 164 Perverse sheaves are concentrated in one degree at generic points of their support (route 17, EtaleDualityAndPerverseSheaves)

### Routes

Verdicts on the six submitted routes:

1. **The Part II (compact unitary Shimura varieties): accepted as narrowed.** It is justified only for the compact endgame: IG.5 and IG.7 are fixed to the sequel's datum, and no stage owns Theorem 6.3.1, the simple-Shimura branch of §5.6 or the obstruction of Theorem 5.5.7 at a prime only split in 𝒦. Twelve of its 22 items stay. Ten leave: 92, 95, 100, 101 and 102 to EndoscopicTransferAndUnitaryTraceComparison, 3, 106 and 107 to AutomorphicGaloisRepresentationsPartII, 109 (Lemma 5.5.8) to BunGAndNewtonStrata BG1, and 105 becomes planned. Item 123 and two new items (the dual Hecke ideal, the stable trace formula of §5.6) join, giving 15. The brief is rewritten to state Theorems 5.5.7 and 6.3.1, the §5.6 results and Lemma 6.2.2 exactly, with their corrections, and to name every import; the claim that Shin's trace formula for inner forms of arbitrary signature is new material of this Part II is dropped.
2. **IgusaVarietiesAndTorsionConcentration IG.0, IG.1, IG.3, IG.4: accepted with corrections.** The route now states how far it widens the layers (unramified PEL data of type (A) or (C) with hyperspecial level at p; Theorem 4.4.4 needs a proper model; Proposition 6.1.3 is for compact Shimura varieties of Hodge type), assigns each item to one layer (IG.0 and IG.1 for finite-level characteristic-p geometry, IG.3 for everything needing generic fibres or the period map, IG.4 for §6.1), and presents Proposition 6.1.3 and Corollary 6.1.4 as the compact-case strengthenings rather than "the same statements". Remark 4.2.8 (62) and Lemma 4.4.1 (84) are planned elsewhere and leave; Propositions 4.2.19–4.2.21 (69) go to DiamondEtaleCohomology C8; seven missing items join (73 and six new ones). IG.0 must import SchemeAndStackFoundations SF.4 and take a direct edge from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 (already upstream of it through AbelianSchemesAndArithmeticModuli A3–A4), and IG.3–IG.4 must import BunGAndNewtonStrata BG3; none of these closes a cycle.
3. **BunGAndNewtonStrata: accepted with corrections.** The stage "BG2" is only a heading; the owner is BG2:uniformization. Lemma 3.5.5 (43) is already planned there. BG1 is added for the µ-ordinary element, Rapoport–Richartz, B(G) of products and Lemma 5.5.8. BG3 must import GeometricSatakeAndFusion GS0:Schubert-smoothness for Theorem 3.4.5.
4. **GeometricSatakeAndFusion GS0:Schubert-smoothness: accepted.** The reason is corrected: the layer proves Theorem 3.4.5 as the minuscule case of its stabilizer computation, not through Scholze's B^+_dR-local systems, which it does not import. Minuscule cocharacters, Kedlaya–Liu's projectivity criterion and Griffiths transversality join.
5. **PadicHodgeTheory P8: accepted.** The reason is corrected: HodgeTateAndCanonicalSubgroups T1–T2 use Corollary 2.2.4 on tensor constructions, not only in degree one. Scholze's B^+_dR-local system joins, and the blueprint must use the corrected sheaf OB^+_dR of Scholze's corrigendum (E18).
6. **HodgeTateAndCanonicalSubgroups T0, T2: accepted with corrections.** Definition 4.1.1 and Proposition 4.1.2 (49, 50) belong beside the Tate module of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, which is upstream of T0 and IG.0; T2 alone keeps Theorem 4.1.4 and the classification by pairs (T, W), and must import VectorBundlesAndIsocrystals VB1 and VB2.

Eleven source routes were added, for items that the review made missing or added and for items moved out of the submitted Part II, Igusa and Hodge–Tate routes: FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.2, EndoscopicTransferAndUnitaryTraceComparison, AutomorphicGaloisRepresentationsPartII, PerfectoidSpaces P7, VectorBundlesAndIsocrystals VB1, DiamondEtaleCohomology C8, InverseGaloisAndArithmeticFundamentalGroups IG.0, AutomorphicBundles B1, ComplexComparisonPartII C5, AutomorphicLFunctionsAndLocalFactors AL.3 and EtaleDualityAndPerverseSheaves EDC.5. Every missing item is taken by exactly one route.

### Prerequisites

Six were added, each checked against its Crossref record: Kottwitz (Invent. Math. 108, 1992), Shin (Amer. J. Math. 134, 2012), Arthur (Invent. Math. 97, 1989), Goldring with Shin's appendix (Compos. Math. 150, 2014), Berthelot (Ann. Sci. ÉNS 13, 1980) and Rapoport–Zink (Ann. of Math. Stud. 141, 1996).

### Report

The extraction report keeps its account of the sources and of what the paper proves, and its other sections are rewritten for the corrected file.

## Mistakes in the paper (`sourceIssues`)

- **E1–E13**, recorded by the extraction, are confirmed misprints.
- **E14–E100, new (87):** 64 misprints, 11 errors and 12 gaps; 5 affect a stated result, 8 a proof and 74 nothing downstream. The Annals page lists no erratum and Crossref records no update.
  - **Stated results:** Proposition 4.2.14 (the fibre products must be over Ĕ(ζ_{p^∞})^∧, E44); Remark 4.2.17 (R must be integrally closed, with a counterexample, E45); the definition of Red^b and Lemma 5.4.2 (Shin's twist δ̄^{1/2} is missing, E74); Lemma 5.5.1 (cohomological for the endoscopic weights, not the trivial representation, E77); Corollary 5.5.2 (its first assertion needs the total contribution of an eigensystem, since terms can cancel, E79). Each record shows that the results that use the statement, and hence the main theorems, are unaffected.
  - **Proofs:** Lemma 2.3.6 (E25), Proposition 4.2.11 (E43), Lemma 4.3.15 (E56), Theorem 5.5.4 (E83), Theorem 5.5.7 (E87), Proposition 6.1.3 (E91) and Theorem 6.3.1 (E97, E98), each with its repair.
  - **Misprint of note:** Proposition 3.5.7(1) prints "lower semicontinuous" for "upper" (E35).
  - Two further suggestions were rejected after checking: the use of π_1^proét of a possibly disconnected Newton stratum in Proposition 1.13 follows the standard convention for a pointed scheme, and the unitary case of Proposition 4.2.11 "left as an exercise" is a routine omission, not a gap.

## Notes for the maintainer

- **New stage dependencies**, none of which closes a cycle: SchemeAndStackFoundations SF.4 into IgusaVarietiesAndTorsionConcentration IG.0, with a direct edge from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, which is already upstream of IG.0 through A3–A4; BunGAndNewtonStrata BG3 into IG.3 and IG.4; GeometricSatakeAndFusion GS0:Schubert-smoothness into BG3; VectorBundlesAndIsocrystals VB1, VB2:ampleness and VB2:classification into HodgeTateAndCanonicalSubgroups T2.
- **Widened layers.** IG.0, IG.1, IG.3 and IG.4 must be blueprinted for unramified PEL data of type (A) or (C); EndoscopicTransferAndUnitaryTraceComparison ET.0–ET.7b for the groups G_n⃗ of every rank and inner forms of arbitrary signature; AutomorphicGaloisRepresentationsPartII AG2.7 for decomposed genericity over arbitrary p-adic fields.
- **One owner for a formula.** Proposition 4.2.23, dim Fℓ^b_{G,µ} = ⟨2ρ, µ⟩ − ⟨2ρ, ν_b⟩, is owned by IG.3; the sequel's Theorem 2.7.3, sent to BunGAndNewtonStrata BG2–BG3, should import it.
- **Reconcile.** VectorBundlesAndIsocrystals VB3:positive-basic-examples plans the Lubin–Tate universal cover, the one-dimensional case of Proposition 4.1.2(3), now at R07.1.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CARAIANI-SCHOLZE-17.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` passes on the result file, the review file, the extraction report and this report.
- Every planned and route stage id exists in the atlas; every missing item is routed exactly once and no other item is routed.
- No Lean deliverable is part of a paper review.
