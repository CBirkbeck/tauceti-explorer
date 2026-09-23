# Review: PAPER-QIAN-23 (Qian, Potential automorphy for GL_n)

Job `REV-PAPER-QIAN-23` (issue #1253), by Claude Code, session `cc-72825f`, 23 September 2026. The extraction (issue #1252) was written by Codex (session `codex-a71f92`) and completed by Claude Code (session `cc-442dc5`).

**Verdict: accept**, after the corrections below, which were made in place in `PAPER-QIAN-23.result.json` and its report. The corrected file has 145 items (12 library, 30 planned, 103 missing), 16 routes, 11 prerequisites and 49 source-issue records. `PAPER-QIAN-23.review.json` gives a verdict on every final route.

## What was read

- **The published paper**, Invent. Math. 231 (2023), 1239–1275: the online-first Springer PDF from the NSF public-access repository (37 pages, SHA-256 77969caa…, the file the extraction read). Published page = PDF page + 1238.
- **arXiv:2104.09761v1**, the only arXiv version, compared with the published text wherever a statement or a mistake was checked.
- **The companion preprint** arXiv:2103.00106v1 (unpublished, only version), read in full.
- **Cited sources** at the places used: ACC+ (Ann. of Math. 197 (2023); the author PDF has the Annals pagination), BLGHT (author PDF), Varma (arXiv:1411.2520).
- **Page images.** Every statement, locator and mistake was checked on rendered page images, not on the text layer, which loses bars, primes and superscripts.
- **The atlas** (`data/atlas.json`), the draft roadmaps, the decompositions, the extractions whose proposals the routes touch (PAPER-ALLEN-ETAL-23, PAPER-CALEGARI-GERAGHTY-18, PAPER-CALEGARI-GERAGHTY-20, PAPER-BOXER-CALEGARI-GEE-ETAL-25, PAPER-LANDESMAN-LITT-24 and the PolarizedAutomorphyLifting extractions), and the pinned Mathlib 082e2d3 and Tau Ceti f790474 with their declaration index.

## Method

- **Items.** For each of six parts of the paper (§1, §2, two halves of §3, §4 and the companion preprint), one reader checked every item's statement, locator, name, kind, status and citation, and listed the definitions and results on the way to the main theorems that had no item. An independent checker re-read the paper and judged each proposed change; a final pass turned the checker's further findings into exact field values.
- **Routes.** The sixteen submitted routes were reviewed in three groups against the stage descriptions, the draft roadmaps and the proposals of other extractions, with attention to import cycles.
- **Mistakes.** E1–E13 were checked at their locators: misprints once, errors and gaps twice, once redoing the mathematics and once trying to defend the paper. Four readers then hunted through the published paper section by section; each finding was verified on the page image, merged with the item readers' suggestions, and every error and gap was checked twice more in the same two ways, with a third reading where the checks differed.

## Changes made to the extraction

### Items

- **All 112 submitted items were corrected.** Every locator in the paper now gives the statement number and published page; items taken from the companion preprint or other sources cite those. 108 statements were rewritten: most restore hypotheses, quantifiers and conventions the extraction dropped, and all replace the extraction's ASCII notation. Among the substantive corrections:
  - item 002 (Definition 1.2) fixes the order of the graded characters, on which the weight formula depends;
  - item 005 records that Definition 1.3 defines ι-ordinary automorphy on the automorphic side (Geraghty's Definition 5.3), not through Definition 1.2 as in arXiv v1;
  - item 006 builds unramifiedness into genericity, as ACC+ Definition 4.3.1 does;
  - item 009 now names the isomorphism ι in Theorem 1.1, and item 010 keeps the bound l > n that the submission had already imposed (E2);
  - items 077, 078 and 081 state the switching theorem with the auxiliary prime and the seed as hypotheses, and item 076 with the condition on k(λ), so that the Dwork Part II no longer imports ML.2 or ML.3;
  - item 102 is restated as the general equivariant semistable comparison, planned at CohomologyComparisons CP.4, with the Dwork instance split off as item 143;
  - item 050 states the comparison with the companion-matrix model through characteristic polynomials, and its note explains why the paper's trace argument is also valid here.
  The submission already carried the corrections of E1 (item 071), E5 (item 014), E11 and E12 (items 098, 099, 103, 105); the review kept them and restated the items in exact notation.
- **Statuses.** Items 018 (locally trivial cohomology) and 019 (killing a root obstruction locally) change from missing to planned: ArithmeticGaloisDuality R02.3 plans the localization map, and the Tau Ceti ProfiniteCohomology, LocalFieldsRamification and ClassFieldTheory layers plan what item 019 uses.
- **Planning stages and citations.** The planned lists of items 001, 003, 004, 006, 007, 008, 024, 084, 085, 093, 096, 109 and 111 now cite only the stages that plan them (for example, 004 and 111 at AutomorphicGaloisRepresentationsPartII AG2.7, 084, 085 and 109 at AG2.5); item 012 adds IntermediateField.LinearDisjoint.symm and restricts the converse of the intersection criterion to finite extensions, as the pinned `iff_inf_eq_bot` requires. Dependencies were corrected for 52 items (for example, Lemma 2.1 uses the Clozel–Harris–Taylor field-selection lemma, not Moret–Bailly).
- **33 new items (113–145):**
  - 113 Regular algebraic cuspidal automorphic representation (planned: AG2.0, AF.3)
  - 114 Local Langlands correspondence for GL_n (planned: ET.6)
  - 115 Linearly disjoint restriction preserves the residual image and the lifting hypotheses (planned: PA.5)
  - 116 Soluble Galois extensions with prescribed local completions and avoidance (Clozel–Harris–Taylor, Lemma 4.1.2) (route 7, PotentialModularityAndCompatibleSystems)
  - 117 First cohomology of the cyclotomic Galois group with coefficients μ_{p^r} (route 8, ArithmeticGaloisDuality)
  - 118 Connecting homomorphisms and the low-degree long exact sequence for discrete modules (library: TauCeti.ContCohomology.DiscreteShortExact and related declarations)
  - 119 Restriction, inflation and corestriction in low degrees (library: TauCeti.ContCohomology.explicitRes1 and related declarations)
  - 120 Finite subgroups of PGL_2(F̄_l) containing PSL_2(F_l) (Dickson) (planned: R01.4)
  - 121 Decomposed genericity of Sym^m r̄ when the adjoint image over the Galois closure is large (ACC+ Lemma 7.1.6(3)) (route 6, PotentialAutomorphyInfrastructure)
  - 122 Composita of Galois extensions with a common simple group (route 6, PotentialAutomorphyInfrastructure)
  - 123 Levelt's rigidity theorem for hypergeometric monodromy (route 13, PotentialAutomorphyDworkMotivesPartII)
  - 124 Picard–Lefschetz description of the Dwork monodromy at t = 1 (route 13, PotentialAutomorphyDworkMotivesPartII)
  - 125 Normal subgroups of SL_n over a finite field; simplicity of PSL_n (route 13, PotentialAutomorphyDworkMotivesPartII)
  - 126 Non-isomorphism of PSL_n in different characteristics (Artin) (route 13, PotentialAutomorphyDworkMotivesPartII)
  - 127 Finite special unitary group SU(n,k) (library: Matrix.specialUnitaryGroup)
  - 128 p-adic de Rham comparison for smooth proper varieties (planned: CP.3)
  - 129 Crystalline comparison for smooth proper schemes over a p-adic ring of integers (planned: CP.2)
  - 130 Local freeness of the relative Hodge filtration in characteristic zero (route 11, ComplexComparisonPartII)
  - 131 Chebotarev density theorem (planned: Tau Ceti Chebotarev, Layer 10)
  - 132 Weil–Deligne representation attached to an l′-adic representation (l′ ≠ p) (planned: R01.2)
  - 133 Ordinarity of a polarizable automorphic representation with ordinary Galois representation (Geraghty, Lemma 5.9) (route 15, PolarizedAutomorphyLifting)
  - 134 ι-ordinary automorphic representation (Geraghty, Definition 5.3) (route 4, PotentialAutomorphyInfrastructure)
  - 135 Ordinarity criterion for a twisted Steinberg component (Geraghty, Lemmas 5.2 and 5.6, as used in Lemma 4.3) (route 4, PotentialAutomorphyInfrastructure)
  - 136 Base change of automorphy to the CM quadratic extension (planned: ET.7a)
  - 137 Serre's open image theorem for non-CM elliptic curves (route 16, OpenImageTheoremsForAbelianVarieties)
  - 138 Supersingular primes of a non-CM elliptic curve over Q have density zero (Serre) (route 16, OpenImageTheoremsForAbelianVarieties)
  - 139 Regular ordinarity of Dwork motives near infinity (companion main theorem) (route 13, PotentialAutomorphyDworkMotivesPartII)
  - 140 Toroidal embeddings over a discrete valuation ring and subdivision blowups (route 9, SchemeAndStackFoundations)
  - 141 Unimodular subdivision after scaling (Knudsen–Mumford) (route 9, SchemeAndStackFoundations)
  - 142 Equivariant toroidal semistable reduction over a discrete valuation ring (route 9, SchemeAndStackFoundations)
  - 143 Hyodo–Kato description of D_st for the Dwork eigenpart near infinity (route 13, PotentialAutomorphyDworkMotivesPartII)
  - 144 Log-crystalline cohomology computed by a log-smooth embedding (Hyodo–Kato) (planned: CR.5)
  - 145 Hyodo–Kato monodromy as a connecting homomorphism (planned: CR.6)

### Routes

Verdicts on the sixteen submitted routes:

1. **ML.0/ML.2: accepted with corrections.** ML.2 alone; items 004 and 111 move to AG2.7 as planned items; the Dwork-specific steps of the proof of Theorem 1.1 (items 073–075, 083, 086–088, 090) join it.
2. **ML.3 (item 075): rejected.** The seed is used by ML.2, and ML.3 requires ML.2; it moves to ML.2.
3. **ArithmeticGaloisRepresentations: accepted with corrections.** It keeps item 026 at G7; items 001 and 008 are planned and leave the route; the decomposed-genericity lemmas 027 and 089 go to PA.5, which must add AG2.7, where decomposed genericity is defined, as a prerequisite; item 074 goes to ML.2 and item 051 to the Dwork Part II.
4. **AutomorphicGaloisRepresentationsPartII: accepted as planning.** All six items are planned; the planned lists are made per item, and the route is removed because it routes nothing missing.
5. **PadicHodgeTheory: accepted with corrections.** R06.2 alone; item 024 is planned there and leaves the route.
6. **PA.2: accepted for item 005 only.** Items 086–088 and 090 use the Dwork Part II and item 082 and move to ML.2; the general Steinberg ordinarity criterion is split out as item 135 and stays, with Geraghty's Definition 5.3 (item 134).
7. **PA.3 (item 072): accepted at PA.4.** ACC+ Theorem 6.1.2 is the output of the patching chain; at PA.3, which PA.4 requires, it would close a cycle. PA.4 must add PA.2 and PA.5 as prerequisites.
8. **PA.5 (item 083): rejected.** The item depends on ML.2 and on the Dwork Part II; it moves to ML.2. PA.5 is rebuilt with the decomposed-genericity lemmas 027, 089, 121 and 122.
9. **R23.1: accepted with corrections.** Lemma 2.1 (item 014) is not a Moret–Bailly statement and moves to the Dwork Part II; the Clozel–Harris–Taylor field-selection lemma (item 116) is added; item 079 is planned and leaves the route.
10. **ArithmeticGaloisDuality: accepted with corrections.** The proof steps of Lemma 2.1 (items 017, 022) move with it; item 018 is planned at R02.3 and item 020 at R02.2/R02.4; item 117 (Neukirch–Schmidt–Wingberg 9.1.6) is added.
11. **SF.4 (the Dwork models): rejected.** Items 091, 092 and 094 are Dwork-specific and join the Dwork Part II; SF.4 now takes the general toroidal semistable reduction theorem and its two inputs (items 140–142).
12. **CrystallineCohomology: accepted with corrections.** The stage CR.5:log-algebra is added; the planned items 093, 095 and 096 leave the route; items 098 and 099 no longer depend on the Dwork model.
13. **CP.4 (item 102): accepted as planning.** The item is restated as the general planned statement; the Dwork instance is item 143 in the Dwork Part II.
14. **ComplexComparisonPartII: accepted.** It also takes item 130, the local freeness of the Hodge filtration, which no stage plans.
15. **LPV.1: accepted for item 048.** Item 101, the complex-analytic residue–monodromy theorem, joins the proposed Hodge-structures Part II.
16. **The Dwork Part II: accepted with corrections.** A Part II of PotentialAutomorphyInfrastructure is justified, since nothing in the atlas plans the Dwork family. The area changes from `modular`, which is not a galaxy, to `langlands`. The claim that PA.2, PA.3 and PA.5 consume the package, which would be a cycle with its parent, is removed. The brief was not usable as design instructions: it is rewritten to state the final theorems exactly, with their corrections, and to name every import.

The corrected file has twelve source routes, the Dwork Part II (61 items) and three joined proposals: HodgeStructuresPartII (item 101), PolarizedAutomorphyLifting (item 133, Geraghty's Lemma 5.9) and OpenImageTheoremsForAbelianVarieties (items 137, 138, Serre's theorems). Every missing item is taken by exactly one route, and planned items are no longer placed in routes.

### Prerequisites and gaps

- **Added:** Geraghty (Math. Ann. 373 (2019)), BLGHT (Publ. RIMS 47 (2011)), Varma (Forum Math. Sigma 12 (2024)), Serre (Invent. Math. 15 (1972)), Serre (Publ. IHÉS 54 (1981)), Kempf–Knudsen–Mumford–Saint-Donat (LNM 339) and Illusie (Astérisque 223 (1994)). Each DOI or link was checked against its publisher or Crossref record.
- **Gaps:** S8 and S9 are resolved by this review; S3, S4 and S7 record the new items that address them.

### Report

The extraction report was rewritten to describe the corrected file: the sources, what the paper proves, the items, the routing, the mistakes, the open gaps, the prerequisites and notes for the maintainer. The earlier checkpoint reports are in the repository history.

## Mistakes in the paper (`sourceIssues`)

- **E1–E13, recorded by the extraction.**
  - Confirmed: E1, E2, E3, E4, E6, E7, E8, E9, E11, E13.
  - **E2** stays a gap in a stated result: Theorem 1.4 is not proved for odd l < n with l ∤ n; the first case is n = 4, l = 3. The enormity hypothesis excludes only l | n.
  - **E5** is reclassified as a misprint: the sentence on p. 1270 misquotes an assumption that §4 states correctly on p. 1268.
  - **E8** is extended: the proof of Lemma 3.11(2)–(3) also writes F for F_v.
  - **E12** is reclassified as an error in a stated result of the companion preprint: without properness its Theorems 1.6 and 3.2 are false (the affine line over W[T] is a counterexample in degree 1).
  - **E10 is withdrawn.** The page image of p. 1257 (and of arXiv v1, p. 13) prints an overline over W(k)[1/p]: the isomorphism is between its algebraic closure and C, which exists.
- **E14–E49, new (36):** 21 misprints, 5 errors and 10 gaps; 1 affects a stated result, 10 affect a proof and 25 affect nothing. No erratum to the paper exists.
  - **Stated result:** Lemma 3.7's first assertion is false for n = 2, for the sheaf the paper defines (E31); only the second assertion, BLGHT Corollary 4.7, is true and used.
  - **Proofs:** the reduction in the proof of Lemma 3.3(2) (E27) and the symplectic step of Lemma 3.3(3) (E28); Lemma 2.6(2) (E22); the n = 2 case of Lemma 3.9 (E33); Proposition 4.1 (E36, l′ must be unramified in F^avoid); the single application of Lemma 2.1 in §4 to a character with values in a product of two finite fields (E37); the transfer of automorphy from l′ to l (E40); Lemma 4.3 (E41, E43); and the analytic disc of the companion preprint (E49).
  - **Main theorems.** Every error and gap in a proof comes with a repair that both checks accepted, so with the recorded corrections Theorem 1.1 holds as stated and Theorem 1.4 holds for l > n.

## Notes for the maintainer

- **Calegari–Geraghty (2018).** Its Dwork family and the geometric half of its Dwork point, routed to ModularityAndLanglandsExtensions ML.0–ML.3, should join the Dwork Part II when that extraction is reviewed.
- **Boxer–Calegari–Gee–Newton–Thorne (2025)** joins the Dwork Part II with the area `modular`, which is not a galaxy id; this file uses `langlands`.
- **ACC+ (PAPER-ALLEN-ETAL-23).** Its Theorems 6.1.1, 6.1.2 and 6.6.2 sit at PA.3 and should move to PA.4; its Lemmas 7.1.5–7.1.7 sit at ArithmeticGaloisRepresentations G7, which AG2.7 requires, and should move to PA.5. Its Corollary 7.2.4 should sit at ML.2, where this paper's seed uses it.
- **New stage dependencies**, none of which closes a cycle: AG2.7 → PA.5, PA.2 and PA.5 → PA.4, and PA.2, PA.4 and the Dwork Part II → ML.2.
- **Stage texts to extend:** R01.1 (rank-n descent to a finite coefficient field), R23.1 (Moret–Bailly with all three kinds of local condition), R02.4 (Poitou–Tate duality for the full absolute Galois group), CR.6 (the N-equivariant comparison with a Witt lift), LocalGaloisDeformationRings L7 (specialize to item 002).

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-QIAN-23.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` passes on the result file, the review file, the extraction report and this report.
- Every planned and route stage id exists in the atlas; every missing item is routed exactly once and no other item is routed; the joined proposals' ids, parents, titles and areas match the extractions that proposed them.
- No Lean deliverable is part of a paper review.
