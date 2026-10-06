# Handoff: BP-ShimuraCompactifications--C0

Issue [#990](https://github.com/CBirkbeck/tauceti-explorer/issues/990). Agent: Codex. Session: `codex-ewf5qv`. Branch: `codex-ewf5qv-shimura-compactifications`. Claim [6026533375](https://github.com/CBirkbeck/tauceti-explorer/issues/990#issuecomment-6026533375) was confirmed by bot comment [6026535422](https://github.com/CBirkbeck/tauceti-explorer/issues/990#issuecomment-6026535422); the issue was re-read after confirmation. This run handles this job alone.

The four authorized deliverables are the [packet](../packets/ShimuraCompactifications--C0.json), [reader](../readmes/ShimuraCompactifications--C0.md), [suggested file](../suggested/ShimuraCompactifications--C0.lean) and this handoff. This submission continues merged checkpoint #3092, preserves its seventeen node IDs and correct algebra/boundary arguments, and completes the target-level pass for the exact eight-stage scope. It uses `Refs #990`.

## Planning completion and counts

The packet is **complete**, under PROTOCOL §0's stopping rule: every stage in scope has its targets planned, with prerequisite chains ending in pinned libraries, external nodes, requested supplier stages or explicitly recorded gaps. Completion does not mean the roadmap is closed or implemented.

- **89 nodes:** 21 constructions, 8 lemmas, 51 theorems, 2 comparisons, 5 definitions and 2 applications.
- **95 API items; 89 definition/construction unit tests; 34 planets.**
- **14 freshly checked baseline declarations; 35 supplier requests; 18 gaps.**
- **18 routed-paper contracts** map to exact realizing nodes.
- Every node has `implementationStatus: unchecked`.
- C0, C1, C2, C2.general, C3, C3.general, C4 and C5 are each **planned** and **open**. Zero stages are closed. C6 is outside this submission.

The reader specifies all 89 declarations and their hypotheses, proof routes, APIs, tests, consumers, direct prerequisites, source matches and acceptance properties. Its stage narratives fix the mathematical conventions and dependency order. The packet remains the machine-readable contract; the reader and suggested-file ledger use exactly its declaration/API/test names.

## Mathematical advance

The accepted RS-32 retitling and ownership boundary are applied: **Analytic toric geometry, Part II: arithmetic toroidal compactifications** extends the unchanged AnalyticToricGeometry anchor. Common lattice/cone/dual-monoid and finite complex constructions are imported. C0 owns the single uniform finite-fan toric scheme over every commutative coefficient ring, including non-Noetherian valuation rings. The Binda–Kato–Vezzani nonarchimedean Part II imports this scheme and owns formal completion, adic generic fibre and perfectoid additions. This resolves the proposed ownership in RT-AREA-algebraicgeometry/34 without editing that other packet.

C0 now covers arithmetic-admissible systems, compatible common refinements, smooth projective refinements, arbitrary-ring charts and relative support properness. Infinite cone sets with finite arithmetic orbits remain distinct from the finite Fan carrier. Local finiteness is on the open positivity domain. Necessity of the support properness criterion requires a nonempty base; its sufficient direction allows the empty base.

C1 constructs the extra mixed boundary datum, its native mixed Hodge instance, torus/abelian-torsor tower, cusp labels, effective arithmetic stabilizers and incidence. HodgeStructures L2 and the existing MixedHodgeStructure/graded carrier are imported. Early mixed group/stabilizer inputs precede C0 arithmetic fans; cusp/cone labels consume the fans afterwards.

C2 and C2.general plan the actual partial analytic charts, separation/gluing, normality/density, compactness/properness, normal crossings, algebraization, minimal boundary map and canonical descent. The actual nilpotent-preserving analytification repair node is imported, with its unfinished carrier integration recorded. Special mixed canonical models remain a precise supplier requirement. A pure Shimura datum is not assumed to have a universal abelian scheme; algebraic-space and scheme conclusions are distinguished.

C3 and C3.general plan refinement/level/datum maps, ordered Hecke spans, choice comparison, degree-zero and higher structure-sheaf comparisons, the derived boundary-ideal statement and coherent/ordinary comparisons. The toric blowup regression retains the distinction between pulled-back equation u²v and reduced-boundary equation uv. The Klingen correspondence uses the corrected first projection and level-p^(n+1) subgroup formula; acyclicity retains its boundary-factorization proof gap.

C4 plans fibrewise semi-abelian schemes, constructible characters, Poincaré extension classification, relative polarized degeneration data, Mumford quotient/effectivity, universal formal degeneration, Hom/endomorphism extension, level comparison, quasi-finite flat extended kernels, Tate/logarithmic Kodaira–Spencer comparisons and the full semi-abelian Tate sequence. The full Tate limit uses multiplication transition maps and Chinese remainders for its primewise product; prime powers are not claimed cofinal in the full divisibility index.

C5 plans good algebraic models, the actual étale relation/quotient/family, formal completion and valuative properness before the retained five neat-boundary results and their B5 export. It also covers non-neat descent, logarithmic Kodaira–Spencer, Hodge semiampleness, graded finite generation, minimal compactification/ampleness, quasi-projectivity, higher-level normalization, normalized coefficient/Koecher statements, ordinary/formal extension, Hilbert–Siegel codimension, prime-Q level groups/generator covers, the genus-two canonical bundle and good-boundary cohomological exports.

The prime-Q cover requires the source's **finite flat group extension** of the open subgroup. The text does not assert a closed inclusion of that extension into the boundary semi-abelian identity component. That stronger assertion would conflict with boundary torsion rank loss. Its generic subgroup identification is retained, and the Isom cover uses the extended group alone.

## Lean outcome and signature boundary

**The full suggested file did not elaborate.** A fresh `lean-check` invocation stopped at the missing object file for `TauCeti.Geometry.Toric.Algebraic.Fan.Basic`. The shared build's Mathlib checkout is the required pin, but its Tau Ceti checkout is `cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than `f790474821cf4256814db967cb154e7af3d0c369`, and the necessary Tau Ceti object files are absent. No library build, cache fetch, update or language server ran.

A Mathlib-only subset **elaborated successfully, exit 0, with 28 warnings, all declaration-uses-placeholder warnings and no errors**. It consists of the seven coefficient-algebra signatures, their ten API signatures/eight examples, two explicit face-condition helpers, native Spec/contravariant coefficient-map helpers and the two-coordinate blowup examples. The Tau Ceti imports, three Tau Ceti specialization examples and their unused monoid-object scope were excluded. An initial subset check caught differing universe levels in the new scheme-map helper; its ring and degree types now explicitly share a universe. The successful check is for those exact corrected signatures, not for the full file or any completed proof.

The full file preserves the three pinned-source baseline specialization examples. Its omission ledger records **every other declaration and every remaining API/test name with its mathematical statement**. These are comments, not elaborated signatures. Actual scheme/space/torsor/analytic/formal and coefficient carriers are still required. This is gap 1 and an open refinement of every stage. No missing geometric condition is replaced by an opaque proposition or an object containing the desired conclusion.

## Checks performed

- `python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraCompactifications--C0.json --json`: **zero errors and zero warnings**, with all fourteen baseline references resolved at the recorded pins.
- `git diff --check`: passed.
- The local submission file check, exact scope/coverage check, declaration/API/test name reconciliation, preservation of all seventeen checkpoint IDs, routed-contract references, local prerequisite DAG, source-version/hash consistency and restriction to the four authorized paths are checked before submission.
- `lean-check` outcomes are exactly those above. The preceding worker's finite polynomial regressions are provenance, not newly run tests. No application code changed, so no application test suite was run.

The old checkpoint's workaround for upstream stage IDs is removed: the current checker distinguishes those atlas stages from baseline declarations. The four ordinary toric supplier edges have been restored, with their requests retained. This packet's local declaration graph is checked; no global atlas acyclicity is asserted. Coarse-stage C0/C1 and C5/B5 arrows, and the local R11.3 verbal reverse dependency, are explicitly recorded as structure/ownership repairs.

The Swarm submission check must be observed on this PR's current head, with any failures repaired on the same branch. Earlier PR checks are not evidence for this submission.

## Source evidence

The packet records URLs, exact inspected passages, edition boundaries and SHA-256 values for fourteen PDFs read on 6 October 2026:

1. Lan's author-hosted thesis revision dated 14 March 2021: relative character charts; selected degeneration/effectivity passages; good-model/quotient and completion proofs; properness/boundary; coherent comparison; minimal compactification and Hodge positivity.
2. Lan's author errata for the approximation, étaleness and label conditions.
3. Lan 2017: fan polarizations; normalization Theorem 6.1 and its beginning; formally canonical coefficient Definition 8.5; Koecher Theorem 8.7 and its stated exceptions.
4. Pink's author-hosted dissertation: mixed datum/boundary tower, arithmetic cone systems and reduction/quotient arguments, compatible projective refinements and algebraization/canonical descent through the explicitly listed portions of §12.
5. Bijakowski–Pilloni–Stroh: publisher PDF §§5.1–5.2, normalized coefficient and Koecher targets.
6. Boxer–Pilloni: the inspected author PDF's coherent/refinement setting and Lemma 4.2.2 Hom extension; publisher edition not collated.
7. Pilloni's 17 June 2019 author copy: subdivision, ordinary extension and corrected Klingen correspondence; Duke version not collated.
8. Pilloni 2012: publisher PDF §4.1.2 cyclic level-group extension and generator cover.
9. Calegari–Geraghty: author-hosted typeset §§5.2–5.3 and appendix comparison passages, with publisher-page offset retained.
10. BCGP 2021: arXiv v3 §8.2, genus-two Hilbert–Siegel codimension and formal extension.
11. BCGP 2025: arXiv v1 Theorem 1.8.29 and beginning of proof, including its Lan–Stroh comparison dependency.
12. Yuan: arXiv v4, 30 April 2024, text dated 1 May; §3.4 minimal Siegel Hodge ampleness. The requested author-hosted copy refused connection, and the 2026 publisher version was not collated.
13. Farb–Kisin–Wolfson: arXiv v2 §3.2 character-line compactification of torus torsors; its cohomological/essential-dimension consumer stays with its owner.
14. Bresciani: open-access Inventiones PDF, Lemma 8 proof, full semi-abelian Tate extension used by the generalized Jacobian consumer.

The two Stacks source records retain preceding-checkpoint normal-crossings and algebraic-space Stein provenance. The reader's source appendix and packet `readSections` are the precise inspection boundary. No complete-book, whole-paper or publisher-wide verification is claimed.

Five reviewed source corrections are applied by finding ID: Pilloni E40/E109, Boxer–Pilloni E67, BPS E14 and Calegari–Geraghty E165. One new unreviewed source finding records Pink's author-copy Definition 2.1(v) filtration misprint, with a rendered-page inspection, pure-datum countercheck and correction search. It is scoped to the hashed author copy, not an uninspected publisher edition. An independent reviewer must check it.

## Exact follow-up contracts

The independent review comes first. Each stage is planned, so PROTOCOL §0 permits this complete packet to stop without adding lemma-level nodes. Follow-ups refine the eighteen named gaps and supplier APIs, rather than claiming that the geometric signatures or proofs already exist:

1. Type the omitted geometric declarations/APIs/examples on actual supplier carriers, then elaborate the full file at both required pins.
2. Integrate the nilpotent-preserving analytic carrier and actual chart extension.
3. Supply the AMRT arithmetic-reduction/controlled-neighbourhood proof leaves.
4. Supply the special mixed canonical boundary models and dense-special-point descent of Pink 12.13–12.17.
5. Prove the integral toric subdivision Čech vanishing and coefficient/cohomology comparisons.
6. Supply the relatively complete model, cubical/theta and relative effectivity construction leaves.
7. Repair the R11.3 local supplier's verbal dependence on early C4 before importing it as an independent local carrier.
8. Supply the original Faltings–Chai character/Hom, quasi-finite flat kernel and finite-flat cyclic level-group extension proofs, respecting their different boundary conclusions.
9. Finish the corrected good algebraic-model approximation/versality proof.
10. Prove non-neat branch and geometric-component descent in the actual model.
11. Supply theta generation, finite section algebra, B5 constant terms and coarse Hodge Q-line descent.
12. Prove the normalized chart/completion comparison; keep parahoric moduli-model identification in its separate owner.
13. Supply the exact integral coefficient and Koecher positivity proof, including Definition 8.5 and Theorem 8.7 restrictions.
14. Verify special-fibre/formal Hartogs hypotheses and the finite-thickening ordinary comparison.
15. Factor the corrected Klingen first projection on actual boundary charts and prove its acyclicity.
16. Supply the Lan–Stroh nearby-cycle/open comparison and duality through the étale cohomology owner.
17. Collate uninspected publisher versions and inspect the supporting original proof leaves named by each gap.
18. Supply exactness/topology and full-versus-primewise interfaces for the semi-abelian Tate sequence from A4/R02.1.

All thirty-five supplier contracts and their exact consuming nodes are in the packet and reader. Main owners are SF.0–SF.3, Abelian A2–A5, AutomorphicBundles B3–B5, the toric/Hodge/reductive anchors, V8, the analytic/formal/adic owners, PEL M1/M2, ModularCurves R13.1–R13.3, R11.3 and the Galois/cohomology owners. Requests remain open; none was sent as a separate issue or message. RT-AREA-algebraicgeometry/3 and /27 outgoing owner links outside these four deliverables are recorded for the link-map maintainer.

No continuation depends on disposable scratch files. Source URLs/hashes, mathematical statements, proof boundaries, supplier contracts and compilation outcomes are all preserved in these deliverables.
