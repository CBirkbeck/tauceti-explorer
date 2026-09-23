# Review: PAPER-BOXER-CALEGARI-GEE-PILLONI-21 (Boxer–Calegari–Gee–Pilloni, Abelian surfaces over totally real fields are potentially modular)

Job `REV-PAPER-BOXER-CALEGARI-GEE-PILLONI-21` (issue #2165), by Claude Code, session `cc-72825f`, 23 September 2026. The extraction (issue #2164) was written by session `cc-7b31c4`.

**Verdict: accept**, after the corrections below, which were made in place in `PAPER-BOXER-CALEGARI-GEE-PILLONI-21.result.json` and its report.

The submitted file had four routes that propose or extend a roadmap, and four source routes. The review's verdicts on the first five routes:
* route 1 was rejected as submitted and is replaced by a narrowed route;
* routes 2, 3 and 4 are accepted with required corrections;
* route 5, the source route to SchemeAndStackFoundations, was rejected and replaced.

The other three source routes were rebuilt with the rest of the routing. The corrected file has 332 items (3 library, 33 planned, 296 missing), 33 routes, 19 prerequisites and 159 source issues. `PAPER-BOXER-CALEGARI-GEE-PILLONI-21.review.json` gives a verdict on every final route.

## What was read

- **arXiv v3** (28 November 2021, 292 pp.), the version the extraction read. Its comment says it is the final version after copyediting.
- **The published version**, Publ. Math. IHÉS 134 (2021), 153–501, open access at Centre Mersenne. Its numbering matches v3 throughout.
- **Page images.** Item statements were checked on page images of arXiv v3, and their locators on the published pages. Every recorded mistake was checked at its locator on page images of both versions.
- **Other files:**
  - the extraction's result file and report;
  - `data/atlas.json` and the draft roadmaps in `research/blueprint/roadmaps/`;
  - the merged extractions whose proposals this paper touches: PAPER-PILLONI-20, PAPER-CALEGARI-GERAGHTY-18, PAPER-CALEGARI-GERAGHTY-20, PAPER-BOXER-CALEGARI-GEE-PILLONI-25 and PAPER-BOXER-PILLONI-26;
  - the pinned Mathlib and Tau Ceti, for the library items.

## Method

- **Items.**
  - The paper was divided into ten sections of items. For each section, one reader checked every item against both versions: its statement, locator, name, kind, status and citation. The reader also listed the definitions and results the paper uses that the extraction left out.
  - An independent checker then re-read the paper and judged each proposed change. Only changes the checker confirmed were applied. The checker rejected 98 proposals and adjusted some of the others before they were applied.
- **Routes.**
  - Each of the four submitted routes that propose or extend a roadmap had its own reviewer, and so did the submitted source route to SchemeAndStackFoundations. The reviewer compared the route with the atlas, the draft roadmaps and the proposals of the other extractions.
  - Every missing item, old and new, was then given exactly one owner, and a critic checked the assignment.
  - Each brief and each source-route reason was then written from the corrected items. Each source-route reason quotes the stage that covers its items.
- **Mistakes.**
  - The review hunted section by section through the whole paper. A verifier checked every finding on the page images of both versions.
  - Each error and gap then had two further independent verifications: one redid the mathematics, and the other tried to defend the paper under its own conventions and with its cited sources.
  - Where those two disagreed on kind, reach or correction, a third reading settled the record.
- **Prerequisites.** Every citation and link was checked against the publisher's record.

## Changes made to the extraction

### Items

- **Corrections to 141 of the 158 submitted items**, and a new note on item 35 saying why it stays missing. The corrected text is in each item's fields; most notes explain the change or the status.
  - Statements: 139 items (8, 10–12, 14–32, 34, 36–85, 87–115, 117–124, 126–127, 129–135, 137–139, 141–145, 147–156, 158).
  - Locators: 101 items.
  - Names: 75 items.
  - Kinds: 5 items (15, 30, 144, 145, 156).
  - Most statement corrections restore hypotheses, quantifiers, normalisations or cases the extraction dropped. Some statements were materially wrong: Theorem 2.7.1's local–global compatibility and purity, and Proposition 2.4.24's type IIa, for example.
- **Statuses.**
  - PAPER-BOXER-CALEGARI-GEE-PILLONI-21/11 (the group `GSp_4` over `Z`): missing → planned (PELModuli M0, ShimuraData D5).
  - PAPER-BOXER-CALEGARI-GEE-PILLONI-21/36 (neat level): missing → planned (ShimuraData D5).
  - PAPER-BOXER-CALEGARI-GEE-PILLONI-21/38 (parahoric level at `v | p`): missing → planned (ReductiveGroupsPartII RG2.3).
  - PAPER-BOXER-CALEGARI-GEE-PILLONI-21/144 (Fargues's degree and the section `δ_H`): planned → missing. No stage plans the degree function of finite flat group schemes over the bases this paper uses, so the item is routed to HodgeTateAndCanonicalSubgroups.
- **Planned stages corrected.** Items 141, 145, 147, 149, 150, 151, 152, 153, 155 and 156 now cite the stages that actually cover them. For example:
  - item 145 (the Hodge–Tate map) goes to T0, not T2/T5;
  - item 147 now cites PadicFamilies L2a, not L2;
  - item 153 now cites LocalGaloisDeformationRings L7, not R08.3;
  - item 155 adds EndoscopicTransferAndUnitaryTraceComparison ET.6 for `GL_n`.
- **Library citation corrected.** Item 158 (`Sp_4`) cited only `TauCeti.Symplectic.*`, which uses Mathlib's form. It now cites `TauCeti.ConstantForm.groupScheme`, which is the paper's `Sp_4` for its antidiagonal `J` without transport, and records the basis permutation that carries `J` to Mathlib's form.
- **Splits.** Submitted items that bundled several independent results were split. At least 68 of the new items were split out of 43 submitted items, and their notes name the item they came from; item 99, for example, became 99 and 308–315. Item 30 was split into 30 and 331 (AbelianSurfacesPotentialModularity), and the new item 247 into 247 and 332 (HigherHidaAndColemanTheory).
- **172 new items (159–330)** for definitions and results that the paper states or uses and the extraction did not list separately. They go to:
  - HigherHidaAndColemanTheory: 52 (222, 229–234, 237–244, 246, 249, 252, 255–256, 259–263, 265–291);
  - AbelianSurfacesPotentialModularity: 15 (173, 175–178, 190, 315, 317–318, 320, 322, 324, 327, 329–330);
  - GSp4LocalLanglandsAndGaloisRepresentations: 13 (163–169, 171, 184, 187, 193, 202–203);
  - HilbertSiegelModularVarieties: 9 (182–183, 209, 211–214, 221, 321);
  - IntegralCoherentHeckeComplexes: 6 (219, 223–226, 235);
  - source routes: 61, among them LocalGaloisDeformationRings 13 (295–307), ArithmeticGaloisRepresentations 8 (192, 308–314) and ModularityAndLanglandsExtensions 5;
  - planned: 15 (159, 162, 172, 185, 191, 194–195, 197, 201, 208, 210, 218, 245, 323, 328);
  - library: 1 (236, the Artin–Rees lemma, `Ideal.exists_pow_inf_eq_pow_smul` in Mathlib).

### Routes

The submitted file had four routes that propose or extend a roadmap, and four source routes. The corrected file has five routes that propose or extend a roadmap (the fifth is the join IntegralCoherentHeckeComplexes) and 28 source routes.

1. **HilbertSiegelModularVarieties (Part II of HilbertModularVarietiesAndShimuraCurves): rejected as submitted, replaced by a narrowed route.**
   - What stays: §3 does for `G_1 = Res_{F/Q} GSp_4` what the parent's H0 and H3 do for `Res_{F/Q} GL_2`, and nothing in the atlas or in any proposal owns that. The route keeps the subgroup with rational similitude, the PEL moduli problem, the action of the totally positive units on polarizations, the arithmetic quotient and the descent of automorphic bundles.
   - What leaves the brief: the submitted brief also took in the genus-two integral models, local models and compactifications at parahoric level, and the Hecke action on integral coherent cohomology. The proposals ShimuraVarietiesHondaTatePartII, ShimuraCompactificationsPartIIHodgeTypeIntegralBoundary and IntegralCoherentHeckeComplexes already own these.
   - Items: 10 of the 15 submitted items stay, joined by 9 new ones. Of the other five, two are planned by existing layers, two go to IntegralCoherentHeckeComplexes and one goes to HigherHidaAndColemanTheory. The title, brief and reason are rewritten.
2. **HigherHidaAndColemanTheory: accepted, as a join.**
   - The extraction proposed a *new* roadmap under this id. The id already belongs to the Part II of PadicFamilies proposed by PAPER-PILLONI-20 and joined by PAPER-BOXER-CALEGARI-GEE-PILLONI-25 and PAPER-BOXER-PILLONI-26. The same id with another kind, parent and title would give the mathematics two owners.
   - The route now uses that proposal's id, parent, title ("Hida and Coleman families, period modules, and family L-functions, Part II: higher Hida and higher Coleman theory for coherent cohomology") and area (`padic`).
   - Its brief lists this paper's additions: the Hilbert–Siegel generalisation place by place, the Klingen and Iwahori operators at `p`, the doubling layer and the classicality theorems.
   - 86 items.
3. **AbelianSurfacesPotentialModularity: accepted, renamed.**
   - The extraction proposed `PotentialModularityOfAbelianSurfaces`. The maintainer's guide sends this paper to the new roadmap `AbelianSurfacesPotentialModularity`, which the queued design job DESIGN-BCGP18 builds. Four merged extractions already name that id, and PAPER-BOXER-CALEGARI-GEE-PILLONI-25 records the other name as an alias of it ("do not create both").
   - The route uses the maintainer's id, title and area (`langlands`, as make_queue gives DESIGN-BCGP18). Its brief, checked against the page images, states the final theorems exactly (Theorems 1.1.2–1.1.5, 1.1.7, 8.4.1, 9.3.1, 9.3.4 and 10.2.6).
   - 17 submitted items that existing layers own moved to them by source. They cover Galois representations, global and local deformation problems, patching algebra, Néron models and L-function inputs. One more item moved to HigherHidaAndColemanTheory.
   - 60 items: 43 submitted, 15 new, the split-off item 331 and one item from route 4.
4. **GSp4LocalLanglandsAndGaloisRepresentations (Part II of ModularityAndLanglandsExtensions): accepted with required corrections.**
   - No layer owns the `GSp_4`-specific local theory or the `GSp_4` Galois representations of §2.7. A search of every layer description for "GSp" finds only a metaplectic double cover.
   - Several item statements were corrected.
   - Its area is now `langlands`, as in PAPER-BOXER-CALEGARI-GEE-PILLONI-25, which joins it with the same id, parent and title.
   - Gan–Takeda's correspondence itself goes to ModularityAndLanglandsExtensions ML.4, as the Gan–Savin extraction routes it.
   - Seven submitted items moved by source to SmoothRepresentationsOfLocalGroups, ArithmeticGaloisRepresentations, GL2AutomorphicRepresentationsAndTransfer, AutomorphicGaloisRepresentationsPartII and ModularityAndLanglandsExtensions. One item became planned, and one moved to AbelianSurfacesPotentialModularity.
   - 23 items: 10 submitted and 13 new.
5. **SchemeAndStackFoundations SF.2/SF.5 (source): rejected and replaced.**
   - §3.8 restates Pilloni (Duke 2020) §§4.1–4.2 and cites it. PAPER-PILLONI-20 already routes that material to AlgebraicModuliForArithmeticGeometry A0-extension: `f^!` for embeddable and lci morphisms, fundamental classes and traces. SF.5 covers none of it.
   - The replacement is a source route to A0-extension, a source route to SF.2 (Kempf's Cousin complexes and the Cousin complex of a filtration), and a new join, **IntegralCoherentHeckeComplexes**.
   - That join is the Part II of AutomorphicBundles proposed by PAPER-CALEGARI-GERAGHTY-18 and joined by PAPER-CALEGARI-GERAGHTY-20, PAPER-PILLONI-20 and PAPER-BOXER-PILLONI-26. It takes the cohomological correspondences of §3.9, the prime-to-`p` Hecke action and Hecke relations on integral coherent cohomology, and the automorphic description of §3.10. 9 items.

**Source routes.**
- Of the other three submitted source routes, ML.4 and LocalGaloisDeformationRings stand, with more items.
- Of the two items of the submitted PotentialModularityAndCompatibleSystems route, one moved to PotentialAutomorphyInfrastructure PA.5 and one stays.
- With the new items and the items moved out of the proposal routes, there are now 28 source routes. Each names the stages that cover its items and quotes the covering phrase.
- Every missing item is taken by exactly one route, and no other item is routed.

### Prerequisites

- **Removed (3):** Pilloni (Duke 2020), Calegari–Geraghty (2018) and Calegari–Geraghty (2020). All three are already extracted, as PAPER-PILLONI-20, PAPER-CALEGARI-GERAGHTY-18 and PAPER-CALEGARI-GERAGHTY-20.
- **Links corrected (6).** Five of these DOIs pointed to another paper. Lan's pointed to the 2016 sequel, which the entry also cites, instead of the monograph:

  | Prerequisite | Corrected link |
  |---|---|
  | Lan's compactification monograph | doi:10.1515/9781400846016, with the sequels doi:10.1017/fms.2015.31 and doi:10.1093/imrn/rnw123 |
  | Arthur's book | doi:10.1090/coll/061, with Gee–Taïbi doi:10.5802/jep.99 |
  | Bijakowski–Pilloni–Stroh | doi:10.4007/annals.2016.183.3.5 |
  | Mok | doi:10.1112/S0010437X13007665 |
  | Shepherd-Barron–Taylor | doi:10.1090/S0894-0347-97-00226-9 |
  | Khare–Thorne | doi:10.1353/ajm.2017.0030 |

### Report

The extraction report now describes the corrected file:
- the header gives the new counts and points here;
- the Routing section is regenerated;
- the library and planned items are rewritten;
- the Source issues section is rewritten for E1–E159;
- the notes on the order of the roadmaps, Grothendieck duality, the prerequisite papers and the companion paper are updated.

## Mistakes in the paper (`sourceIssues`, E1–E159)

- **E1–E3**, recorded by the extraction, are confirmed:
  - a Lemma cited as a Theorem in the proof of Corollary 7.6.3;
  - a missing superscript `w⁻` in Corollary 6.4.3;
  - a missing hypothesis `[F:Q] > 1` in Remark 5.8.5.
- **E4–E159** are new.
  - The hunts produced 162 findings. The verifiers refuted three, and three pairs described the same slip and were merged, leaving 156 records.
  - They are 116 misprints, 25 errors and 15 gaps. No erratum exists. Only one of them is reported in later work: the gap E149 in Theorem 10.2.1 is addressed by Remark 9.4.4 and Lemma 9.3.7 of the same authors' *Modularity theorems for abelian surfaces* (arXiv:2502.20645), and the record says so in `known`.
- **Totals (E1–E159).** 119 misprints, 25 errors and 15 gaps. 11 affect a stated result, 17 a proof and 131 nothing downstream.
- **Stated results affected:**
  - Lemma 2.1.3 needs char `L ≠ 2` (E6).
  - Lemma 2.5.1: the maximiser is unique only in the four-dimensional symplectic case (E16).
  - Lemma 3.8.5 and Proposition 3.8.3 need `#G` invertible and `p ∤ #Δ(K^p)` (E36).
  - Lemma 4.2.20 is unproved at `l_w = p + 1` (E46).
  - Corollary 6.4.3's isomorphism for `i = 1` is proved only when `k_v − l_v ≥ 3N`, which its one use can take (E83).
  - Lemma 9.1.10(3) (E136) and Proposition 9.1.12 (E137) claim too much.
  - Lemma 9.2.7 is false as printed. With the corrected local data, Theorem 9.2.8 survives (E139).
  - Theorem 9.3.4's "more precisely" clause must exclude elliptic curves with `End_K(E) ≠ Z` (E144).
  - Proposition 10.1.3: "unramified and ordinary" should read "ordinary", and Theorems 1.1.7 and 10.1.4 still follow (E147).
  - Lemma 10.4.6 should read `D × D` (E156).
- **Proofs affected, results expected to hold:** E30, E35, E59, E63, E91, E98, E102, E104, E107, E109, E110, E121, E125, E126, E130, E140 and E149. Each record gives the repair.
- **Reconciled records.** On ten records the two verifications of an error or gap disagreed. The third reading settled each one:
  - E46 and E83 now affect a stated result;
  - E102, E140 and E147 are errors, not gaps.

## Notes for the maintainer

- **DESIGN-BCGP18** should take this file's brief for `AbelianSurfacesPotentialModularity` as its instructions.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BOXER-CALEGARI-GEE-PILLONI-21.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` passes on the result file, the review file, the extraction report and this report.
- Every planned and route stage id exists in `data/atlas.json` or in a draft roadmap. Every missing item is routed exactly once, and no other item is routed.
- The ids, parents and titles of the joined proposals match the extractions that proposed them.
- No Lean deliverable is part of a paper review.
