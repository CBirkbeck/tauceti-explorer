# REV-EnhancedDerivedSheaves

Accepted after corrections on 16 October 2026. Reviewer: Claude (Claude Code, Opus 5.5), session
claude-6SMRPk, issue #9917. The whole-roadmap plan under review (packet, reader document and suggested
file) was written by Claude, session claude-r1SP4N, for `BP-EnhancedDerivedSheaves` (issue #9913,
PR #9953). This reviewer wrote none of it, and none of the two parts, their reviews, the assembly or the
package.

The plan is a complete target-level pass in the accepted import form: the 169 declarations of the two
accepted parts are imported unchanged and pinned by SHA-256 (both hashes recomputed and matching), 13 of
them are corrected through `assembly.importedNodeCorrections`, and the new declarations are the packet's
`nodes`. All eleven stages stay **planned**; none is closed; every implementation status stays
`unchecked`. The per-declaration verdicts are in the packet's `review.checked`: of the 32 new declarations
17 verified and 15 corrected; of the 13 corrected part declarations 9 verified and 4 corrected; 3 new
declarations withdrawn; none added and none unverifiable.

| Measure | Input | Reviewed |
| --- | ---: | ---: |
| New declarations | 35 | 32 |
| Corrected part declarations | 13 | 13 |
| Declarations in the plan (imported + new) | 204 | 201 |
| Theorems / constructions / definitions / lemmas / comparisons | 86 / 51 / 31 / 25 / 11 | 84 / 51 / 31 / 25 / 10 |
| API items / unit tests / planets | 357 / 271 / 51 | 361 / 273 / 51 |
| Baseline declarations cited by the new and corrected declarations | 34 | 34 |
| Gaps | 15 | 16 |
| Source issues in the packet | 0 | 1 |
| Incoming requests triaged | 130 | 134 |
| Structural proposals of the whole-roadmap plan | 4 | 5 |
| Open requests | 1 | 1 |

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/EnhancedDerivedSheaves.json --index <pinned declaration index>`:
  0 errors, 0 warnings, before and after the corrections.
- The checker does not look inside `assembly.importedPrerequisites`, so the effective graph was rebuilt by
  script (part nodes, then the corrected fields, then the new nodes): every prerequisite resolves; the node
  graph of the 201 declarations is acyclic; other roadmaps cited are SchemeAndStackFoundations (tier 2,
  now on TauCetiRoadmap main), AdicSpacesPartII (tier 3, on main) and DiamondsAndVStacks (tier 3, the one
  open request), so no citation points upward. With the proposed sub-layers E2:towers and E5:descent the
  layer graph is acyclic, build order unchanged.
- Sources: all fifteen packet sources downloaded and hashed (every SHA-256 matches); a scripted sweep
  checked that each of the 108 cited theorem labels occurs on its cited page (Stacks chapter numbering
  normalised, HTT printed = PDF − 18). One slip: BS17 Example 11.19 is on p. 43, not pp. 44–45 (corrected).
- Every acceptance item and test with a computation was redone by hand (dual numbers in characteristic
  2 and not 2, the ℤ_p/ℤ lim¹, the ℚ_p/ℤ_p telescope, Tor of K/m over a perfect valuation ring, the
  valuation-triangle extremes, the projection-formula counterexample, the 𝔽_p ⊗ᴸ_ℤ 𝔽_p base change, the
  Amitsur p-adic tower, the I-adic filtration completion, the Day-convolution unit, H^*(ℤ/2; ℤ)).
- Baseline: all 34 Mathlib and Tau Ceti declarations exist at the cited lines in the pinned trees
  (Mathlib 082e2d37e8, Tau Ceti f790474821), and the statements of the less obvious ones
  (`Triangle.mor₂_eq_zero_iff_epi₁`, `exists_iso_binaryBiproduct_of_distTriang`, `PresheafOfModules.freeYoneda*`,
  `Algebra.H1Cotangent`, `derivationToSquareZeroEquivLift`, `HasInjectiveDimensionLE`,
  `TauCeti.SheafOfModules.tensorProduct`) provide what the citing declarations use. None removed.
- `lean-check research/blueprint/suggested/EnhancedDerivedSheaves.lean`: exit 0, 646 warnings, all
  placeholder-proof warnings, nothing else. A scratch copy with every `example` renamed and a `run_cmd`
  audit appended found no declaration of the namespace whose type contains a proof placeholder. Every API
  and test name of the new declarations is either declared or named in a "Not stated here" comment, and
  `leanPrototype.coverage` agrees with the file.
- Reader: all 201 declarations appear exactly once as anchored blocks; the 32 new blocks are re-rendered
  from the packet by a renderer that first reproduced all 35 original blocks byte for byte; all 1,993
  internal links resolve; the added prose has no unescaped emphasis characters.
- `python3 research/blueprint/intake.py check-files` on the deliverables: no problems.

## What was read

| Source | Version | Passages checked |
| --- | --- | --- |
| Bhatt–Scholze, *Projectivity of the Witt vector affine Grassmannian* | author copy and arXiv v3 (hashes match) | §2 Definition 2.5–Theorem 2.9; §6 Lemmas 6.3, 6.6, Remark 6.7; §11 Definition 11.14–Lemma 11.38, all proofs used |
| Mathew, *The Galois group of a stable homotopy theory* | arXiv v2 | §3.3–3.6 (v2 numbering against BS17's v1 citations) |
| Carlsson, *Derived completions in stable homotopy theory* | arXiv v1 | Theorem 4.4 and proof; Corollary 6.7; Example 8.1 |
| Bhatt–Halpern-Leistner, *Tannaka duality revisited* | arXiv v1 | Theorem 1.10 |
| Bhatt et al., *Globally +-regular varieties* | arXiv v3 | Remark 4.11 and footnote 9 |
| Stacks Project | chapter PDFs of 16 October 2026 (hashes match) | Cotangent Complex §§3–14; Modules on Sites §§19, 28; Cohomology on Sites §§17, 23, 50; More on Algebra §§76, 80, 93 |
| Lurie, *Higher Algebra* / *Higher Topos Theory* | author PDFs of 2017 | HA §§1.2.2, 1.4.2–1.4.3, 2.2.6, 4.8.2, 7.1.1–7.1.4, 7.2.4, 7.3.2, 7.3.5; HTT §§3.2–3.3, 4.3.3, 5.5.2–5.5.3, 6.5.1–6.5.2 |
| Nikolaus–Scholze; Bhatt, *p-adic derived de Rham*; Bhatt–Lurie, *Absolute prismatic cohomology*; BMS2 | as in the packet | Appendix A.4–A.5; Remark 6.6; Appendix B.1–B.5; §5.1 |
| Lurie, *Spectral Algebraic Geometry* (added) | author PDF of 3 February 2018 | §25.2.1–25.2.4 |
| Upstream | TauCetiRoadmap main 4c4f8f52 and the open pull requests #908 (this roadmap), #944 (DerivedModuleAlgebra), #818 (PerfectoidSpaces) | ownership and supplier sections |

## The main correction: the cotangent complex belongs upstream to DerivedModuleAlgebra

The plan moved DerivedDeRhamCohomology DD.0's cotangent complex down into E5:cotangent-export (tier 4 below
tier 9, as the upstream order requires) and planned it in full: the ordinary cotangent complex of a ring
map with its resolution model, and as separate declarations its naive truncation, smooth and étale
computation and regular-quotient formula. Two lower owners already had that ordinary material:

- PerfectoidSpaces (tier 3) moved DD.0's classical cotangent complex into its own Layer 0 on 9 October
  (package README §0.19, TauCetiRoadmap pull request #818).
- The maintainer's de-cycling of 14 October created DerivedModuleAlgebra (TauCetiRoadmap pull request
  #944, first in the merge order of the open roadmap pull requests), which takes DerivedDeRhamCohomology's
  module-level prefix: the full cotangent complex `Algebra.CotangentComplex` (§0.4), square-zero extensions
  (§0.5), Ext⁰/Ext¹ (§0.6), naive truncation (§0.7), transitivity (§0.8), simplicial rings (§0.9), base
  change (§0.10), localization and filtered colimits (§0.11), smooth (§0.12) and regular-quotient (§0.13)
  computations, derived powers and décalage (§§0.14–0.17) and the obstruction theory (§0.25). Its README
  names EnhancedDerivedSheaves and PerfectoidSpaces as consumers, and the authoritative upstream
  EnhancedDerivedSheaves README (pull request #908, revised on 16 October) already consumes it: its
  E5:cotangent-export keeps only animated refinements and `cotangentComplex_ordinary`.

The review brings the atlas plan into line with that design:

- `E5:cotangent-export/cotangent-complex` is now the cotangent complex of animated rings, with the
  comparison `cotangentComplex_ordinary` to DerivedModuleAlgebra §0.4; the naive truncation, smooth and
  regular-quotient statements are API items transported along it (`cotangentComplex_naive`,
  `cotangentComplex_smooth`, `cotangentComplex_regularQuotient`, which the suggested file already stated).
- The three ordinary-only declarations `cotangent-naive-comparison`, `cotangent-smooth-and-etale` and
  `cotangent-regular-quotients` are withdrawn. No other packet cited them (the only same-named ids belong to
  DD.0). `cotangent-lci-amplitude` and the corrected `the-imported-interface` are rebased.
- The universal property, transitivity, base change, localization and filtered colimits, derivations and
  derived exterior powers keep their animated statements and now say which DerivedModuleAlgebra section
  their ordinary case is.
- DerivedModuleAlgebra is not an atlas roadmap, so it can be cited only by section. New gap
  **G-EDS-W4** records this and what to cite once it is registered.
- `assembly.moves` maps each DD.0 cotangent declaration to its new owner, DerivedModuleAlgebra or this
  layer. Restructure proposal 1 is reworded to match, and now also removes the stage edge
  E5:cotangent-export → DerivedDeRhamCohomology:DD.0.
- `cotangentComplex_ordinary` is added to the suggested file (stated through the existing
  `animatedModules_discrete` and the `importedCotangent` stand-in).
- The reader's layer introduction and ownership tables are rewritten. They still said DD.0 constructs the
  cotangent complex.

## Other corrections

- `E3/kan-extensions-along-functors`: HTT 4.3.3.8 is the unit statement for fully faithful δ, not the
  pointwise formula (proof step fixed). Part (iv) misdescribed HTT 4.3.3.10 as a Beck–Chevalley square;
  it now says what that proposition proves, that Kan extensions along a map of coCartesian fibrations
  are detected fibrewise. Part (iii) no longer names Sp, which lives in a later layer.
- `E4/amitsur-completion-of-finite-modules`: the proof claimed a pro-isomorphism
  {I^{⊗ᴸ(k+1)} ⊗ᴸ M} → {I^{k+1}M} that the cited source does not prove. It is replaced by Carlsson's
  argument: multi-Tor pro-systems over M/I^kM, plus Tot(N ⊗ B^•) ≃ N for B-modules.
- `E5:cotangent-export/derived-exterior-powers`:
  - BL22 B.1 covers only exterior powers of the cotangent complex, so SAG Construction 25.2.2.2 and
    Propositions 25.2.3.1 and 25.2.3.4 are added for general connective modules.
  - The flat comparison now reads "discrete B and a flat discrete B-module M".
  - A décalage test is added.
  - SAG prints the exterior power as signed coinvariants, which gives ℤ/2 for ∧²ℤ against its own rank
    statement. This is recorded as the new source issue **EnhancedDerivedSheaves/E6** (misprint, confirmed,
    known: new).
- `E4/completed-base-change`: added `completedBaseChange_perfect` (K ⊗̂ S = K ⊗ᴸ S for perfect K and
  complete S), which AInfCohomology asks for. Its point-topos completion is named as DerivedModuleAlgebra
  §§1.2–1.5 upstream.
- `E5:abstract/symmetric-monoidal-derived-sheaves`: added the cup product in D(A) for A → Γ(C, O) and its
  sign (−1)^{ij}, which CrystallineCohomology asks for.
- Tests and acceptance items:
  - `inductiveLevel_noetherian_bound` is limited to bases of finite type over ℤ, the scope of the proof
    in BS17 Lemma 2.6.
  - The non-example of `E2/perfect-abstract-blowup-patching` now fixes U = ∅ and Z = E = Spec k; without
    the reduced structure it does not fail.
- Corrected part declarations: `late-realisation` and `single-enhancement-supplier` still credited H.5
  and DD.0 in a source match and a proof step (now fixed). The `uniform-index-colimits` locator is fixed.
- Reader: stale DD.0/H.5 ownership sentences fixed in the E5 introduction, the scope overview, the
  boundaries, the dependencies and the notes.

## Request triage

Four DiamondEtaleCohomology requests merged after the plan was written and were missing; they are added
as entries 131–134 (one answered by `E3/presentable-category-limits` and `E3/representability`, two partly,
one follow-up). A Sonnet cross-check of the 56 answered, library and elsewhere entries flagged 19. After
reading each flagged need against the cited statements:

- Ten dispositions narrowed to *partly*, each with what remains, added to the stage's coverage `remaining`:
  3, 6, 20, 34, 62, 64, 75, 90, 102 and 118.
- Three node lists completed or corrected: 51 (mates), 57 (module objects) and 59 (it cited the
  Kan-extension node for reflective subcategories).
- The rest are answered on reading.

Final count: 33 answered, 80 partly, 7 follow-up, 13 elsewhere, 1 library.

## Restructure

Proposals 1–3 now explicitly remove the three upward stage edges still recorded in the atlas:
- E5:cotangent-export → DD.0;
- E5:spectra-comparison → StableHomotopyKTheory:H.5;
- E4 → DD.1.

New proposal 5 ("Align the atlas plan with the 2026-10-14 upstream de-cycling") records for the maintainer
the wider overlap the review did not act on. The upstream README now consumes:
- BordismFormalGroups F6.5 (#947) for the generic quasicategorical model, straightening, Kan extensions,
  adjunctions, localization, operads and Ind;
- GeneralizedCohomology G2 (#939) for concrete spectra;
- DerivedModuleAlgebra for module K-injective and K-flat models, Koszul complexes, towers and Milnor
  sequences, and module derived limits and completion.

The accepted parts plan these as atlas nodes of E0, E1, E2:towers, E3, E4 and E5:abstract.

## Source issues

- The packet had none of its own. The eight BS17 findings it references (`PAPER-BHATT-SCHOLZE-17/E3`, E14,
  E22, E34, E47, E48, E49, E51) exist in the reviewed extraction with verdict confirmed, and the new
  declarations use their corrected statements.
- Added: EnhancedDerivedSheaves/E6 (SAG Construction 25.2.2.2 and Proposition 25.2.3.4(2)). Its id follows
  the parts' E1–E5.

## Questions for the orchestrator and the maintainer

1. When DerivedModuleAlgebra (and BordismFormalGroups, GeneralizedCohomology) are registered in the
   atlas, G-EDS-W4 should become stage citations. Should the accepted parts' duplicated module-level
   nodes then become comparison nodes (proposal 5)?
2. The PerfectoidSpaces package (#818) states the classical cotangent complex as its own Layer 0 target
   §0.19, while DerivedModuleAlgebra's README says PerfectoidSpaces consumes its §0.4. The two upstream
   READMEs should agree.
3. Upstream #908 now owns the comparison of concrete symmetric spectra with Sp, using GeneralizedCohomology
   G2. The atlas still leaves it to StableHomotopyKTheory H.5, a roadmap outside the 94.
4. DerivedDeRhamCohomology's plan and package (#868) still construct the full cotangent complex in their
   Layer 0. Per `assembly.moves` they should import DerivedModuleAlgebra and this layer.
