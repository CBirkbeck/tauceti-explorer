# RD.1 continuation handoff — BP-PadicDifferentialEquationsAndRigidCohomology--RD.1

Worker: Codex, session `codex-jWCKIr`. Job: #9743. Claim was confirmed by the swarm bot on 14 October 2026. This is a complete target-level planning pass, submitted for independent review; it is not a checkpoint or closed mathematical coverage.

## Delivered and checked

The part packet has 29 new nodes: 2 definitions, 1 construction, 5 lemmas, 15 theorems, 5 comparisons and 1 application. There are 19 API items and 13 unit tests. All implementation statuses remain `unchecked`. Four pinned Mathlib declarations were read and cited. Every direct prerequisite resolves to a part node, an existing main-packet node or the pinned baseline; source/comparison boundaries are recorded as five gaps and one precise request to RD.0.

The accepted main packet is imported without edits or repeated IDs. The reader gives every target, hypotheses, direct prerequisites, locator, proof route, Check, definition/construction API and tests, plus worked calculations for cyclic vectors, radius normalisation, the monodromy estimate, Dwork, the completed-lattice counterexample and residue conventions.

The six existing RD.1 planets are retained, with no new planet flags: differential module over the Robba ring, generic radius, differential Swan conductor, extended-ring Dieudonné–Manin, Frobenius slopes and Frobenius differential module. Assembly must retain that six-item selection; concatenating additional planet candidates would exceed the layer limit.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicDifferentialEquationsAndRigidCohomology--RD.1.json --index <pinned declaration index>`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/PadicDifferentialEquationsAndRigidCohomology--RD.1.lean`: elaborates at the pinned Mathlib with only six expected proof-placeholder warnings. Available memory exceeded 20 GB before both checks. The first attempt exposed unresolved scalar-field inference; explicit scalar arguments fixed it, and the second check succeeded.
- The suggested file is 87 lines. Its two real-bodied light definitions are the finite candidate and an adapter for main-packet cyclicity. It states the field algorithm, rescaling comparison, naturality and three small examples. No data definition has a proof-placeholder body.

The fixed WORKERS.md shape governs omissions from Lean: local-ring covers, annular sheaves, analytic Frobenius/Teichmüller rings, isocrystal categories, Laurent-residue quotients and the global/equal-characteristic targets do not have the required carriers at the pins. Their complete mathematical signatures, API and unit tests are README targets. No synthetic analytic carrier, construction or auxiliary theory chain was inserted merely to make a signature elaborate.

## What this pass settles

Katz’s public finite algorithm replaces the existence-only gap: the determinant has constant term one and degree at most n(n−1), and a finite Vandermonde family gives the cyclic loci. Rescaling is explicit and retains the nonzero-derivation assumption.

The KX interior route is now specified from extrinsic and coefficient profiles through projectors, generic rotation, intrinsic convexity/integrality, annular splitting and disc-centre extension. Intrinsic and extrinsic profiles, the order of negative logarithms, the visibility threshold and the locally free/open-annulus hypotheses are pinned. The boundary application is proof support for the existing break/Swan nodes, not another definition.

The monodromy Lemma 4.12 plan reaches its end: corner, finite fractional polynomial, successive π-adic lifts, bilateral series, nonvanishing via a unique Gauss minimum, positive-part geometric series and oriented finite telescoping corrections. The uniform bounds for the correction series are explicit. The general Newton-polygon supplier remains G2.

Dwork overconvergence has a public proof route using Artin–Hasse integrality and the positive linear coefficient bound α=(p−1)/p² for both the splitting function and its inverse. The estimate includes p=2; the imported main Dwork break/Artin–Schreier example keeps its odd-p hypotheses. No evaluation of a divergent scalar exponential is used.

The bounded-to-completed comparison uses decreasing generic slopes and fixed-slope full faithfulness. Essential surjectivity adds algebraic closedness. Integral invariants require bijective lattice Frobenius and the estimate on the inverse matrix. The negative-slope cokernel includes arbitrary positive iterate h with the explicit backward-Frobenius solution. A completed fixed-vector counterexample detects the false stronger claims.

The equal-characteristic public route reads Hartl–Pink’s fundamental estimate and classification: compatible Newton roots replace an unjustified limiting polynomial. It uses Theorem 4.1, never the circular Theorem 4.3. The sign dictionary φ^r=π^c with c=−d is explicit. Transport to FF R_F remains G3.

The convergent global ascending slope filtration and de Jong reverse bounded filtration are now RD.1 targets. The reverse graded quotient is S_(m+1−i)/S_(m−i). The residue pairing specifies its differential form and its Cartier-dual convention. The public local-monodromy route to general perfectness is outlined with its unproved comparison work in G5.

## Exact remaining work

Coverage of `PadicDifferentialEquationsAndRigidCohomology:RD.1` is **planned**, not closed. A follow-up must address:

1. **G1 — analytic radius/projector suppliers.** Obtain public proofs or a cleared source for the exact inputs underlying KX Theorems 2.2.5–2.5.2: book Theorems 11.3.2 and 12.4.2, almost-isometric basis results 1.3.7/8.6.1, visible spectrum 6.7.4, contracting factor lift 6.7.1/2.2.2 and the half-open/disk extension steps in KX 2.3.8–2.3.10. The public rotation/gluing argument was read, but those sources were not supplied. Refine existing target nodes; do not create a duplicate radius theory.
2. **G2 — ordinary Newton-polygon root theorem.** Supply and trace the finite ordinary-polynomial root/closed-ball-image criterion over the complete algebraically closed valued residue field, then clear fractional exponents to certify the two analytic key calculations. The nonzero-root and monomial exclusions must be retained. The monodromy convergence and nonvanishing checks are already written.
3. **G3 — coefficient-category transport.** Fulfil the RD.0 request below, then prove chartwise FF/HP compatibility and transport of rank-one, global-generation and slope-splitting inputs in both coefficient characteristics. Do not identify ordinary Amice/Robba and Teichmüller rings by notation or infer an unrestricted bounded completion equivalence.
4. **G4 — geometric purity/common-vertex extension.** Trace the Katz/de Jong–Oort/Notes §5 proof suppliers for Notes Theorems 3.12 and 4.1, with smoothness, perfect base and convergent category. The read statements and consumers alone do not close the global proof.
5. **G5 — general Robba residue duality.** Complete finite-cover normal-form, Laurent integration, trace/pullback and duality descent from the imported RD.2 local-monodromy targets. Check degree factors and the differential form. The constant-nilpotent calculation alone is not a general proof.

The one request is to `PadicDifferentialEquationsAndRigidCohomology:RD.0`: define/compare FF E†, E and R_F in mixed and equal coefficient characteristic, with norms, overlap intersections, Frobenius, scalar extensions and the HP Laurent-chart match when E=F_q((π)). It is an extension in RD.0’s coefficient-ring direction. It is not a new request to a vector-bundle roadmap.

The global and reverse-filtration notions move down from the stray VB0 plan. Its eventual package must import the three new RD.1 IDs `common-vertex-global-subobject`, `dense-open-global-slopes` and `reverse-algebraic-filtration-comparison`. There is no VB0 dependency here. Convergent category data is imported through RD.3/restriction-to-convergent. DLB’s representation and N_rig constructions remain consumer context, not higher-tier prerequisites or targets of RD.1. RD.2 still owns quasi-unipotence, Matsuda, the local slope filtration and local monodromy.

## Sources and findings

Read public sources: Katz (entire paper); KX §§2.1–2.6 and its entire 2010 erratum; the published monodromy calculation and descending filtration, compared with arXiv; SFR negative-slope cohomology and §6.3 comparisons plus the author’s additional errata; FF §§11.2–11.3 specified locators; HP §§9–11 key estimate/classification and its preceding input statements; Dwork §4(a), Sperber–Voight’s splitting bound and Li Proposition 2.1; D’Addezio §2.2 and Theorem 4.2.6; Xu–Zhu Appendix A.2; Notes on isocrystals §§3–4 specified results; Dospinescu–Le Bras §§6.1–6.4. URLs, versions, read locators and available PDF hashes are in the packet. No private source passage or section-by-section source summary is included.

The Kedlaya differential-equations book is uncleared and was not read. A fetched de Jong DVI and correction could not be rendered; neither is cited as a read proof. The published monodromy Proposition 5.11 is the read alternative. The ordinary Newton-polygon and geometric extension suppliers are the precise source-reading limits above.

Source findings E301–E309 record, in own words, two KX citation slips, D’Addezio’s reversed-grade indices, two HP logarithm/sign slips and four monodromy notation/base-case/slope slips. Independent review must adjudicate them. They import rather than duplicate main findings E10, E218 and E219. No exhaustive novelty claim is made. The full KX erratum changes residue-characteristic-zero §2.7; its correction is not omitted or applied outside its scope.

## Resume and assembly

Review this part together with the accepted main nodes it imports. Preserve the 29 new IDs and the corrected conventions; select no extra planets without replacing existing selections. The reader and part packet agree target by target. The pass’s source gaps must survive assembly until the listed proofs/comparisons are supplied. The scratch directory is transient and removed after submission; no successor needs it. Source URLs, hashes, calculations and all unresolved tasks needed to resume are preserved in these deliverables.
