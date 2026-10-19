# Handoff: DESIGN-CountingBundlesAndHallAlgebrasOfCurves

Issue: #3417. Worker: Codex, session codex-jgfPvj. Branch: codex-jgfPvj-counting-bundles. The claim was confirmed by the swarm bot in issue comment 6256663078. This is the complete target-level planning pass, submitted for independent review; it is not an implementation or a claim of proof closure.

## Delivered

The new roadmap definition, packet, reader and compact suggested Lean file cover all 58 items assigned by the Schiffmann extraction. The packet has 82 nodes: 18 definitions, 11 constructions, 49 theorems, two comparisons, one lemma and one application. It contains 95 API items, 87 unit tests, 49 planets and ten pinned baseline citations. Every definition/construction has at least three tests and recorded consumers. The reader states every target, API item and test, together with hypotheses, exact dependencies, source locators, proof routes and worked normalization checks.

The arithmetic route runs from coherent decomposition and finite-field descent through nilpotent-pair groupoids, Jordan flags and spherical Hall pairings to the partition-residue formula. The geometric route includes the canonical Higgs framing, central deformation, characteristic-bounded comparison, the Mozgovoy–Schiffmann all-characteristic comparison, purity and nilpotent-cone consequences. Mellit's integrality and degree-independence theorem is established mathematics in the plan, and transfers the coprime positivity conclusion to every degree. The fixed-HN and Euler-Hall assertions identified as conjectures remain conjectures.

All twelve stages CB.0, CB.1, CB.2, CB.3, CB.4, CB.5, CB.6, CB.7, CB.8, CB.9, CB.10 and CB.11 have status **planned**. None is marked closed. The packet has status **complete**, with twelve proof-closure gaps and fourteen exact supplier requests. Per-stage remaining lists identify these obligations. This follows the protocol's stop condition once every stage is planned; a follow-up should discharge those recorded obligations rather than expand an already complete target inventory.

## Baseline and ownership

The suggested file was elaborated against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The statements of all ten baseline citations were read. In particular, the module Krull–Schmidt theorems require an explicit coherent add(M) transfer; coherent sheaves are not assumed finite length. Existing YoungDiagram and hook-length interfaces are reused. Matrix.card_GL_field supplies the unit denominator, not the nilpotent numerator.

Current upstream TauCetiRoadmap at 0d144d044dacebca17b654695b6f1ad58f159b27 was checked in addition to the atlas snapshot. The AlgebraicVectorBundles and QuiverRepresentations reader documents and relevant suggested declarations were read. General bundles, tensor operations, quivers and module decomposition are imported, not re-planned. Searches of the current Tau Ceti tree and pinned sources informed the baseline and missing-interface decisions. No command built or changed either read-only upstream tree.

The fourteen requests are to GS.0; SF.1, SF.2, SF.3 and SF.4; R09.2 and R09.5; ET.2b; QM.0; RG2.3; DWP.0 and DWP.8; EDC.2:pairings; and LPV.5. Each packet request names the exact export and consuming nodes. In particular:

- GS.0 needs coherent/HN and quantitative fixed-central-degree mass exports, integrating the current bundle owner. This roadmap only applies those exports.
- ET.2b needs the canonical good-line extension. R09.5's present finite-inertia/coarse-space scope does not supply reductive character GIT; a Part II is proposed. Stable canonical Higgs moduli and their central deformation stay in CB.7–CB.8.
- RG2.3 needs the already routed general finite-field Lang extension. H¹ uniqueness and connected-band H² existence remain separate inputs.
- QM.0 has no current plethystic Exp/Log or modified-Macdonald nodes. A formal-series continuation and Macdonald/HLV Part II are proposed; only the curve-specific deformation is planned here.
- LPV.5's pencil radical-quotient monodromy does not supply universal-curve-family monodromy. The extraction's UniversalHypersurfaceMonodromy and DWP.8:equidistribution names are not existing/reserved atlas nodes. The packet requests the routed continuation through the real LPV.5 stage, proposes a Part II and retains G4. It does not invent a supplied identifier.

No higher-tier object was silently moved or duplicated. The packet's three restructuring proposals concern missing continuations of established owners, and four upstream notes record snapshot/ownership concerns without editing those roadmaps.

## Precise proof-closure work remaining

The gaps are described fully, with consumers, in the packet and reader:

1. **G1:** Verify Springer’s primary connected-band nonabelian H² neutrality proof for coherent-object descent; Lang H¹ alone proves only uniqueness.
2. **G2:** Close the primary Fine–Herstein nilpotent-matrix enumeration through Jordan centralizers and Heine, including size zero.
3. **G3:** Compare the SV generic vector-bundle form with the invariant coefficient ring, pairing, completion, square-root cancellation and denominator bounds needed here.
4. **G4:** Supply universal-family full symplectic monodromy, Weil II 3.5.3 equidistribution and the Appendix B density argument. One odd characteristic and all its finite extensions suffice for uniqueness.
5. **G5:** Verify Hesselink’s quasiprojective BB theorem, its hypotheses, affine-bundle ranks and descent for the deformation and Higgs applications.
6. **G6:** Close primary canonical Higgs properness, connectedness, Lagrangian dimension and characteristic-uniform moduli inputs, and the exact Álvarez-Cónsul–King tight-subrepresentation comparison.
7. **G7:** Verify or correct the explicit uniform good-line recipe and cutoff. The source proves existence, while the numerical recipe is a strengthened target derived here. Check torsion destabilizers and zero-kernel cases in particular.
8. **G8:** Read and close the generic Macdonald/HLV admissibility and integral-coefficient proof requested from the formal-series owner.
9. **G9:** Verify universal positive monomial representatives and origin regularity on the paired affine cone. Numeric trace identities and Laurent integrality alone do not give those conclusions.
10. **G10:** Close parabolic Hall/shuffle, marked boundedness/density and the denominator removal required for the literal R_g theorem. Ordinary Mellit integrality does not settle it.
11. **G11:** Verify the primary constructible Euler-Hall Hopf construction and its finiteness requirements. Curve independence and primitive root multiplicities remain conjectural targets.
12. **G12:** Supply the precise spread-out, compact comparison and genus-wise topological local constancy arguments for complex coprime Higgs cohomology.

## Source verification and corrections

Read in full: Schiffmann, Annals 183 (2016), pp.297–362 including Appendices A–C; Mellit, Inventiones 221 (2020), pp.301–327; Mozgovoy–Schiffmann, arXiv:1411.2101v1, all thirteen pages. Also read the complete arithmetic argument through Theorem 3.1/Corollary 3.5 on pp.1–8 of Schiffmann arXiv:1002.0987v1; SV arXiv:1009.0678v1 §1.11, pp.13–14; and the selected admissibility/HLV interfaces in Mellit arXiv:1605.01299v2 §5 pp.19–21, §6 pp.23–26 and §7 pp.29–31. Other portions of the latter three sources are not claimed as read proof closure. The packet records URLs, hashes and exact read scopes. Missing primary supporting arguments are the gaps above.

Fourteen source issues are recorded in the worker's own words. Important corrections used by the targets include full repeated-summand matrix radical blocks; the rank-dependent inverse torsion Hall twist; weighted Jordan degree; scalar-gerbe versus coarse dimensions; the effective moment-map target and restriction to a central line before quotienting; doubled BB cohomological shifts; weighted Hitchin coefficients; and the nilpotent prefactor q^D with top degree 2D.

The last audit also corrected the doubly framed Quot open: require surjectivity of the restricted evaluations, in addition to isomorphisms on Hom spaces. E14 gives a genus-two nonspecial-line counterexample to the source's implication without that condition. The primary comparison in G6 must use this corrected strongly generated open. Source issues are proposals for independent verification, not an assertion that a new published erratum has been accepted. The existing extraction's findings were rechecked; no separate journal correction was located by the recorded public search.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/CountingBundlesAndHallAlgebrasOfCurves.json`: zero errors, zero warnings; all twelve stages planned.
- `lean-check research/blueprint/suggested/CountingBundlesAndHallAlgebrasOfCurves.lean`: successful at the pins, only declaration-use warnings for the theorem/example placeholders. The compact file has seven real-bodied definitions and no placeholder data or substitute geometric carriers. The authoritative geometric APIs and tests are in the reader under the current compact-file rule.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/CountingBundlesAndHallAlgebrasOfCurves.lean`: passed.
- Intake deliverable/path/content checks: passed locally for the five authorized files.
- Independent structural script: both node and stage graphs acyclic; cross-stage imports present; exact coverage of all 58 assigned catalogue items; reader statement/API/test agreement; at most six planets per stage and names within sixty characters; no private paths, copied excerpts, Lean code in the reader/packet or prohibited scope language.
- Exact rational arithmetic: rank-two formula agreed with the genus-one paired expression for 96 parameter pairs, and vanished for seven genus-zero q values. These checks test specializations, not a proof of the universal theorem.

The claim covers only this job. After its pull request is opened, stop; do not take another issue. Scratch sources and generation scripts are disposable and must be removed after submission. All material a reviewer or follow-up worker needs is in these deliverables.
