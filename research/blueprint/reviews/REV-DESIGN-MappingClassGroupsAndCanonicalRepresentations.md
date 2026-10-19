# Independent review: MappingClassGroupsAndCanonicalRepresentations

Job: REV-DESIGN-MappingClassGroupsAndCanonicalRepresentations · issue #3568. Reviewer: Claude (Opus 5.5), session claude-TIybcS. Date: 2026-10-19. Input: DESIGN-MappingClassGroupsAndCanonicalRepresentations by Codex, session codex-ERjKj9 (issue #3370, PR #10430); this reviewer did none of that work.

**Verdict: accepted after corrections.** The design is a sound reading of Landesman–Litt, with careful corrected statements (actual conjugacy rather than character-variety points, the repaired stabilizer in Lemma 8.6.1, the conditional non-flatness, the (1,1) counterexample to the augmentation example). Its main defect was ownership. It cited suppliers at stage level throughout, although accepted packets of those suppliers already contain the exact nodes, and three of its own nodes duplicated accepted nodes of other roadmaps. Several routed items were also "imported" from owners that do not plan them. All of this was clearly fixable and has been fixed in place. Every stage remains **planned**, none closed; implementation is unchecked throughout.

## Counts

| | Design | After review |
| --- | ---: | ---: |
| Nodes (definition / construction / theorem) | 62 (5 / 5 / 52) | 62 (4 / 4 / 54) |
| API items / unit tests | 34 / 30 | 36 / 24 |
| Planets | 40 | 39 (at most 5 in any layer) |
| Prerequisites: other blueprints' nodes / stage ids | 1 / 99 | 84 / 43 |
| Requests / gaps / source issues | 21 / 21 / 11 | 13 / 19 / 14 |
| Baseline declarations | 15 | 14 |

`scripts/check_blueprint.py` (with the pinned declaration index) reports 0 errors and 0 warnings before and after. `intake.py check-files` reports no problems for the four deliverables.

## Corrections made in this review

1. **Duplicates removed (PROTOCOL §15).** Three nodes restated accepted nodes of other roadmaps, all promoted or accepted before this design was written:
   - `C.4/strong-rigidity` (LL24 Proposition 8.2.1 with Lemma 8.1.3) is `HodgeStructuresPartII:H.5/versal-unitary-rigidity` with `H.5/strong-implies-cohomological`;
   - `C.7/arithmetic` (LL24 Definition 9.1.1) is `InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-representation`, which the extraction routed there;
   - `C.3/versal-cover` (LL24 Definition 7.3.1) is `InverseGaloisAndArithmeticFundamentalGroups:IG.5/versal-phi-cover-families`.
   Their consumers now cite the owners; the stage descriptions of C.3, C.4 and C.7 say so.
2. **Stage citations replaced by exact supplier nodes (PROTOCOL §3).** The design's gap G7 claimed that HodgeStructuresPartII plans H.1–H.5 only at stage level. In fact accepted packets `HodgeStructuresPartII--H.1` … `--H.5` (promoted 8 October) contain every Hodge input LL24 uses. The rank bound and Artinian vanishing are H.4/sublocal-system-rank and H.4/artinian-vanishing. Theorem 4.3.1 and Lemma 4.3.2 are H.5/deformation-to-cvhs and H.5/coh-rigid-semisimple-cvhs. KP20 is H.5/integrality-KP, and conjugate rigidity is H.5/rigidity-conjugate. LL22 Theorem 1.2.12, Lemma 7.2.1 and Theorem 1.2.5 are H.5/low-rank-pvhs-unitary, H.5/unitary-embeddings-finite and H.5/very-general-rank-bound. Geometric origin and integral PVHS are H.5/geometric-origin, H.5/integral-pvhs and H.5/geometric-origin-integral-pvhs, and boundary data is H.5/boundary-monodromy-data. Representation schemes and the GIT quotient are H.1/betti-framed and H.1/betti-coarse, and the canonical extension is H.2/canonical-extension. Elsewhere: Artin neighbourhoods are IG.3/artin-good-neighborhoods and IG.3/finite-coefficient-comparison, and family exactness is IG.1/stack-and-family-exactness. The compactification and meridian calculation for Lemma 8.3.3 is `AlgebraicModuliForArithmeticGeometry:R09.7a/stable-curve-boundary-interface`, replacing the R09.7d request. Leray is DiamondsAndVStacks:D0/cech-to-derived-comparison. Surface topology now cites eleven LV.5 nodes. Stage citations fell from 99 to 43. The remaining ones are stages for which a request now names exactly what is missing.
3. **Routed items that no roadmap plans, added as nodes.** The accepted extraction routes these items here, and the design marked them "import" from LV.5, which plans none of them:
   - `C.0/teichmuller-uniformization` (item 114): Teichmüller space is contractible and M(g,n)^an is the orbifold quotient by PMod(g,n). C.0/moduli-monodromy and C.0/family-exact use it.
   - `C.4/multitwist-quasi-unipotence` (item 62): Aramayona–Souto Proposition 2.4 and Lemma 2.5, read here.
   - `C.6/nielsen-generation` (item 96): Nielsen's generators of Aut(F_N) and the tuple dictionary used by C.6/nielsen-tuples.
   Each carries `addedBy`, sources, concrete checks and an honest gap for its unplanned proof input.
4. **Statements corrected.**
   - `C.2/kill-finite-class` is now the pointed statement of the P04 author erratum (new source issue E12), and `C.2/prescribed-lift` uses it.
   - `C.7/hodge-characterisation` and `C.7/wider-hodge-range` read integral PVHS in the O_K sense of LL22 Theorem 1.2.5 (H.5/integral-pvhs). This settles the design's open "integral-realization semantics" gap. The four-way equivalence then holds as stated, and each implication cites a supplier node.
   - `C.4/projective-integrality` deduces cohomological rigidity only after quasi-unipotence (E13).
   - `C.4/unitary-finite` cites LL22 Lemma 7.2.1 through H.5 instead of re-proving it.
   - `C.8/jordan-word` no longer cites CharacterTheory and InductionRestriction layers, which do not contain Jordan's theorem; it rests on the recorded Jordan gap.
5. **Acceptance checks and source descriptions.** 46 nodes had the identical placeholder check ("establish the stated result…"); each now has concrete checks: small cases, degenerate cases or counterexamples to a weakened hypothesis. Examples are M(0,4) with PMod(0,4) free and the elliptic involution in genus one; G_m and squaring for the killing lemma; G=N×Z for the determinant hypothesis; S₃ for the Mackey slip; and the Tate-module obstruction to genericity. Every `match` field had merely repeated the node statement. Each now describes what the cited locator states and where the node departs from it.
6. **API.** Added: `mcgFinite_iff_hasFiniteConjugacyOrbitUnder`, which ties the reader's definition to the suggested file's predicate, plus `mcgFinite_comp_aut` and `mcgFinite_det`; `versalFamily_ofLevelChart`; `projectiveExtension_conj` and `projectiveExtension_geometric` (LL24 Lemma 2.2.3); and `relativeUnitary_unitary` and `relativeUnitary_fibreIrreducible`. Every definition and construction keeps at least three API items and three tests.
7. **Ledgers.**
   - Requests: the LV.5, MC.2, D0, CharacterTheory and H.5 requests are narrowed to what is missing (PMod and a free basis of π₁Σ(g,2); M(g,n) for all hyperbolic (g,n); the local-system/sheaf comparison; geometric origin ⇒ arithmetic, and physical rigidity).
   - The R09.6 request is redirected to H.1, the owner of representation schemes, for the component-lifting statement.
   - Requests now met by nodes are removed (MC.3, IG.0, IG.1, IG.5, R09.6, R09.7d, H.2, H.4, the old H.1).
   - Stale gaps are removed (Hodge coverage, Artin neighbourhoods, Hurwitz certificate, family exactness, integral-PVHS semantics, representation moduli, boundary resolution).
   - New gaps: Teichmüller theory; the relative Ehresmann theorem with the finite-index image of Debarre's lemma; the Dehn-twist identification of node-smoothing meridians, which R09.7a leaves to this roadmap; finite abelianization of mapping class groups; Nielsen's theorem; CH19 Theorem A as an external theorem.
   - The routing audit now names the exact owner node wherever one exists, and the remaining stage owners are marked as such.
8. **Roadmap definition and reader.** Stage descriptions for C.0, C.3, C.4, C.6 and C.7 and all `requires` lists were updated from the corrected prerequisites. The reader was regenerated from the corrected packet in the design's format, with its hand-written sections updated, and says nothing the packet contradicts.

## Sources and versions

All five sources were re-fetched; their SHA-256 values match the packet. Each was read at every locator the packet cites:

- **LL24** (arXiv:2205.15352v4): read in full, pp.1–54, including §§4–6 for the supplier interfaces.
- **LL22** (arXiv:2202.00039v2): Theorems 1.2.5 and 1.2.12, Corollary 1.2.7, Lemmas 7.2.1 and 7.5.1.
- **KP20** (arXiv:2009.07350v2): Definition 1.1 and Theorem 1.2.
- **CH19** (arXiv:1612.05779v4): Theorems A and B, and the examples of mild models in §3.2.
- **AS16** (author survey PDF): Proposition 2.4, Lemma 2.5 and Corollary 2.6, pp.10–11.

The design did not use the authors' adopted erratum for the Annals version (P04 on Daniel Litt's page, SHA-256 c382f558…). It was read in full, and its thirteen corrections were matched against the packet. The AI-generated reviews reproduced on the same page are not treated as corrections.

Farb–Margalit's *Primer* is needed for Teichmüller's theorem. The authors' host was unreachable from the review machine, so the new Teichmüller node cites LL24's use and records the Primer locators as unverified. No restricted book was used. The repository contains no source passage.

## Source issues

| Id | Verdict | Known correction |
| --- | --- | --- |
| E1 Lemma 2.0.1 group label | confirmed | new; = extraction E5 |
| E2 Lemma 2.2.2 uniqueness | confirmed (Q₈×C₂ checked: the Klein four-group is its own centralizer in PGL₂(C)) | P04, printed pp.838–839; = extraction E7 |
| E3 Prop. 2.3.4 order of killing | confirmed | partly P04, pp.840–843 |
| E4 Lemma 2.4.2 needs g≥1 | confirmed; reach changed to "a stated result" | P04, pp.844–845; = extraction E10, HodgeStructuresPartII/E-H4-4 |
| E5 Lemma 7.2.5 covering genus | confirmed | new; = extraction E14 |
| E6 Theorem 8.5.3 family bridge | confirmed (exposition gap) | not in P04 |
| E7 Lemma 8.6.1 stabilizer | confirmed; kind changed to gap | not in P04; = extraction E17 |
| E8 Cor. 9.1.4 integral PVHS | confirmed; correction restated in the O_K sense, reach "nothing" | new; see extraction E19 for the misattribution |
| E9 Example 9.2.3 primes | confirmed | P04, p.878; = extraction E20 |
| E10 Remarks 9.2.5–9.2.6 | confirmed | P04, pp.878–879 |
| E11 Example 10.1.6(2) at (1,1) | confirmed (truncated logarithm splitting for Z²) | new |
| E12 Lemma 2.3.3 not pointed (added) | confirmed | P04, pp.840–843 |
| E13 Prop. 8.2.1 says "cohomologically rigid" too early (added) | confirmed | P04, pp.867–868 |
| E14 AS16 Lemma 2.5: restricted induced rep is not d copies of ρ (added) | confirmed (A₃⊂S₃ counterexample; harmless) | new |

`sourceVersions` was added: LL24 v4 preprint, the P04 erratum page, AS16, LL22 v2, CH19 v4 and KP20 v2.

## Baseline audit

All declarations were read in the pinned trees (Mathlib 082e2d3, Tau Ceti f790474):

- LocalCoefficientSystem, its monodromyRepresentation and pullback: a functor on the fundamental groupoid.
- socle and isSemisimpleModule_socle.
- ContRepresentation.IsUnitary.isSemisimpleRepresentation: finite-dimensional, for an arbitrary group.
- sum_characterDegree_sq_eq_card: finite group, algebraically closed field, invertible order.
- groupCohomology.H1InfRes_exact: middle exactness only, as the packet says.
- Representation.IsIrreducible, FreeGroup, FreeGroup.lift, Matrix.GeneralLinearGroup and isotypicComponent.

All of these provide what the citing nodes need. `NumberField.Embeddings.finite_of_norm_le` and `ContRepresentation.exists_isUnitary_congr` became unused once LL22 Lemma 7.2.1 is cited through H.5, and were removed. `Representation.ind` (Mathlib/RepresentationTheory/Induced.lean) was added for the AS16 induction step.

Upstream: the current TauCetiRoadmap main was searched. GeometricTopology, Orbifolds and FuchsianOrbifolds plan neither surface mapping class groups nor Teichmüller theory; FuchsianOrbifolds excludes the latter explicitly. So nothing here duplicates upstream.

## Suggested Lean file

The suggested Lean file was not changed. `lean-check` at the pins exits 0, with ten declaration-uses-sorry warnings and no other messages. The predicate `HasFiniteConjugacyOrbitUnder` correctly encodes a finite orbit of actual conjugacy classes, and `freeGroup_finite_image` is LL24 Corollary 1.6.1 with Aut in place of Out (equivalent, as inner automorphisms act by conjugation). `check_sorry_data.py` passes.

## Questions for the orchestrator

1. LL24 §3 (Lemmas 3.1.1–3.1.2 and Proposition 3.2.1, extraction items 26–28) is routed to GlobalGaloisDeformations R04.1–R04.2. The design requests it from DeformationAndDerivedPatchingAlgebra R03.2 instead, arguing it is abstract Art_C algebra for discrete groups. One owner should be confirmed.
2. The review planted Teichmüller uniformization, Nielsen generation and the multitwist theorem here, as the route requires. If a topology roadmap is later created for LV.5's "pending transfer", these three nodes should move with it.
3. `HodgeStructuresPartII:H.5/versal-unitary-rigidity` states "hence cohomologically rigid for every good compactification" without quasi-unipotence. The P04 erratum (E13 here) shows this needs quasi-unipotent boundary monodromy first; its owner may want to adjust the statement.
4. The extraction's errata E7, E9, E10, E15, E18 and E20 record "new" or no published correction. The P04 author erratum corrects each of them: printed pp.838–839, 843–844, 844–845, 865, 868 and 878 respectively. Their `known` fields could be updated by an errata job.
5. ComplexComparisonPartII requests Ehresmann's theorem from a DifferentialGeometry Part II. The relative version for a proper submersion with disjoint sections, needed by C.0/family-exact, should be added to that request.
6. IG.5/versal-phi-cover-families and IG.1/arithmetic-representation now carry the uses of the removed nodes. The refinement of a cover family to a given finite-index stabilizer (the old `versalCover_refine_stabilizer`) is not among IG.5's API items, and its owner may want to add it.
