# DESIGN-EisensteinIdealAndRationalTorsion

Issue: [#11045](https://github.com/CBirkbeck/tauceti-explorer/issues/11045). Agent: Codex, session `codex-89DbbY`. Date: 2026-10-19.

The target-level planning pass is complete under PROTOCOL §0. This is a complete planning submission for independent review, with every stage planned and explicit gaps; no stage is claimed closed and no mathematics is claimed formalised. The continuation used the bot-confirmed claim in [comment 6274606197](https://github.com/CBirkbeck/tauceti-explorer/issues/11045#issuecomment-6274606197), responding to claim comment 6274603586.

## Deliverables and counts

- [Roadmap definition](../roadmaps/EisensteinIdealAndRationalTorsion.json): nine layers, placed after HeightsRationalPointsAndObstructions, with supplier stage dependencies derived from the nodes.
- [Blueprint packet](../packets/EisensteinIdealAndRationalTorsion.json): 56 nodes, comprising 6 definitions, 7 constructions, 40 theorems, 1 comparison and 2 applications. All implementation statuses are unchecked.
- [Reader](../readmes/EisensteinIdealAndRationalTorsion.md): all targets, conventions, sources, proof sketches, supplier contracts, APIs, Checks and layer examples. It distinguishes a rational torsion point from a rational cyclic isogeny.
- [Suggested Lean](../suggested/EisensteinIdealAndRationalTorsion.lean): 92 lines, a real-bodied cuspidal-index definition, eight admitted API/end-theorem signatures and two proved numerical examples. Heavy objects whose carriers are unavailable at the pins remain reader targets.

The 13 definition/construction nodes have 51 API items and 39 discriminating unit tests, three per node. There are 32 planets, at most six in a layer, and six cited baseline declarations. The packet records 23 supplier requests, nine gaps, six Part II rescope proposals and four source issues.

| Stage | Subject | Coverage | Work needed for closure |
| --- | --- | --- | --- |
| EI.0 | Integral Eisenstein arithmetic | planned | Full integral Hecke-character contract; integral congruence and local duality refinements |
| EI.1 | Cusps, components and Shimura subgroup | planned | Global finite-flat models and Frobenius-equivariant intersection calculation |
| EI.2 | Kernels and abelian quotients | planned | Connected quotient/support and global prolongation contracts |
| EI.3 | Odd torsion and multiplicity one | planned | Admissibility, purity, saturation; separate coefficient-prime-equals-level constituent argument |
| EI.4 | Dyadic torsion and winding | planned | Exceptional D and star-type contract; corrected dyadic construction and normalized winding congruence |
| EI.5 | Ogg's rational torsion theorem | planned | Quotient torsion and maximal mu-type refinements using the global finite-flat contract |
| EI.6 | Global descent and Eisenstein quotient | planned | Integral cohomology, Néron/Sha and rational quotient-support contracts |
| EI.7 | Cusp moduli and elliptic descent | planned | Inverse-character class-field and optimal-quotient cotangent contracts |
| EI.8 | Level thirteen and all prime orders | planned | Two explicit arithmetic certificates and the integral Kummer/local formal-group contracts |

There are nine planned stages and zero closed stages. No target was omitted to obtain this status. Follow-up work should start from the precise `coverage.remaining`, `gaps`, `requests` and `neededBy` fields, rather than treating a stage title as a theorem.

## Ownership and supplier requests

The current roadmap owns prime-level Eisenstein arithmetic, its integral subgroup calculations, winding, rational torsion and the two elliptic descents. Generic curves, forms, Hecke algebras, Jacobians, finite-flat groups, Néron models, Mordell–Weil, quotients and class-field theory are imported. Exact existing nodes are used where their statements suffice. The 23 requests give exact contracts for the remaining stage citations.

Six contracts exceed existing supplier scope and therefore remain gaps with Part II proposals:

1. **AutomorphicFormsOnReductiveGroups, Part II**, anchored at AF.0: the full integral weight-two Hecke algebra, its primitive Eisenstein character, Fricke/bad-prime normalization and kernel generators. The abstract double-coset degree cannot supply the Fricke eigenvalue.
2. **FiniteFlatGroupsAndIntegralPadicHodgeTheory, Part II**, anchored at R07.1: global admissible groups, prolongation and quotients, the global cohomology inequality with its congruence hypotheses, rank-one classification, purity, saturation, extensions, exceptional dyadic D and star-type amalgams. The contract is for coefficient prime different from the level; it does not settle the separate boundary gap below.
3. **NeronModelsAndSemistableAbelianVarieties, Part II**, anchored at R11.1: an open local formal pro-residue-characteristic subgroup, finite quotient and prime-to-residue isogeny inverse.
4. **The same Néron Part II**, anchored at R11.6: fppf isogeny sequences retaining component defects, the integral H¹/Sha comparison and optimal-quotient cotangent injectivity away from 2, including at the level prime.
5. **ClassFieldTheory, Part II**, anchored at Layer 13: equivariant reciprocity and the Stickelberger/Herbrand vanishing of the inverse cyclotomic class-group eigenspace. The idele Herbrand quotient is a different statement. Also needed is the unramified-torsor interface for the level-13 cyclotomic cover.
6. **JacobianChallenge, Part II**, anchored at Layer E: connected abelian quotients and ideal support, universal properties and rational Mordell–Weil exactness after tensoring with Q.

The other three gaps are specific mathematical inputs:

- **Level-13 cusp and intersection certificate.** Mazur–Tate §2, pp. 43–44, invokes Ogg's unpublished computation. Supply an explicit X1(13) model, cusps, order-19 divisor relations, full rational torsion bound and the intersection of the embedded curve with all nineteen subgroup elements. Rank zero does not by itself give that intersection.
- **Fixed-field class-number certificate.** Mazur–Tate §4, p. 48, cites Masley's thesis. Only 19 not dividing the full class number of Q(zeta13) is needed; a checked class-number-one computation is stronger. No such certificate or the thesis was read. Keep this distinct from the inverse-character result at a variable prime.
- **Coefficient prime equal to the level.** Mazur 1977, II Proposition 14.1, pp. 113–114, states the general one-dimensional constituent criterion. The prime-to-level unipotent-inertia/prolongation argument does not cover this boundary. Reconstruct the local semistable P-torsion argument or provide an exact primary reference. A rational invariant constituent forces the good-prime Eisenstein eigenvalues directly, even at coefficient prime P, but this does not prove the general character statement. This is a reconstruction gap, not an asserted new source error.

No higher-roadmap notion was moved down into this roadmap. EllipticCurveModularity and SerreWeightAndLevelOptimisation consume the fixed-vector and Eisenstein interfaces; neither receives a blanket residual-irreducibility theorem.

## Baseline and duplication audit

The packet and Lean check use Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Actual declaration statements were read for:

- `WeierstrassCurve.Affine.Point` and its additive group, and `WeierstrassCurve.IsElliptic`;
- `orderOf_ofAdd_eq_addOrderOf`, the explicitly indexed bridge to native additive order;
- `Nat.forall_exists_prime_gt_and_modEq`;
- `LeftCosetModule.deg`, which weights a double coset by its number of left cosets;
- `TauCeti.AlgebraicGeometry.AbelianVariety`, the bundled carrier rather than modular quotient theory.

The reviewed library audit has no entry for this new roadmap. Related audit entries were checked as leads, and neither the generic Hecke ring nor existing abelian-variety carriers supply the new targets.

The additional read-only current-source audit used TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and its Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Current ModularCurves, ModularForms, EllipticCurves, JacobianChallenge, ClassFieldTheory and IntegralHeckeAndGaloisDeterminants were checked, together with the roadmaps added since the atlas snapshot. In particular ModularCurves Layer 10 stops at the Shimura cover and assigns the subgroup/Eisenstein arithmetic downstream; the generic non-Eisenstein predicate in IntegralHeckeAndGaloisDeterminants is not replanned here.

Searches for `EisensteinIdeal`, `EisensteinQuotient`, `ShimuraSubgroup`, `CuspidalSubgroup`, `windingHom` and modular-Jacobian/Ogg torsion names in the pinned library and the current read-only sources found no declarations supplying these targets. Broader searches for Eisenstein, Shimura, cuspidal subgroup and winding were checked against the neighbouring roadmap statements rather than used as a substitute for reading them. No build was run in those read-only trees.

## Mathematical conventions to preserve

- Keep the full kernel of the Z-valued Eisenstein character separate from its image in the cuspidal algebra: the latter quotient is Z/n, where n is the numerator of (P−1)/12. At level 11, n=5; at 17, n=4; at 13, n=1. Include all genus-zero levels 2,3,5,7,13.
- The duality target is local rank-one freeness of integral H¹(O) over the Hecke algebra. It asserts no global generator.
- The ideal kernel is the closure of generic ideal torsion; the Eisenstein abelian quotient is J/(gamma_I J), using the kernel of completion and a connected image. Replacing it with J/IJ gives the wrong object.
- Use H-plus = ker(sigma−1) and the invariant quotient H/(sigma−1)H. Their natural comparison has a factor of 2. The normalized winding map uses the integral group-ring result. In the congruence, eta_l = 1+l−T_l maps to ((l−1)/2)phi(l); the dyadic l=2 square-root branch maps to **+phi(a)** when 2=a². The sign was checked on the primary page image, p. 139.
- The forgetful map is (E,H) to E. Identity-direction mu_P specializes to the width-one cusp infinity; component-direction level structure specializes to the width-P cusp 0. Apply contraction and the ample generalized-elliptic moduli comparison before reading the cusp. Negative j-valuations alone distinguish neither branch.
- Use full-torsion good-reduction specialization only with the strict ramification inequality. In the elliptic descent the good specialization primes are odd and different from the level; no good reduction of J0(P) at P is assumed.
- Retain component defects in Néron cohomology. Do not assume arbitrary sequences of Néron models are fppf exact or that rational quotient torsion lifts to rational points of the source.
- The general cyclotomic obstruction concerns one class-group eigenspace; it is not a class-number-one assertion. The level-13 norm-19 descent instead has a separate fixed-field numerical input.
- In the order-13 descent, label pi and pibar by pibar annihilating rational cuspidal torsion. The twisted line in ker pi is nonconstant at 13. Local injectivity is promoted to surjectivity using the invertible formal part and a finite quotient, not injectivity alone.
- The final theorem classifies prime orders only. Rational cyclic 11-isogenies are compatible with the absence of rational points of order 11, and stable lines with nontrivial character are not ruled out by the fixed-vector conclusion.

## Sources and corrections

All source statements in the deliverables are in the worker's own words. No source passages, private reference files or extracted book text are included. Source URLs, access dates, read sections and the four public-file SHA-256 values are recorded in the packet and can be used to reproduce the reading.

- **Mazur 1977:** Introduction pp. 33–39; I §§1–5 pp. 43–61; II §1 pp. 62–64 and §§5–18 pp. 80–139; III §§1,3–5 pp. 141–143 and 148–160; Appendix A pp. 173–180.
- **Mazur 1978:** Introduction and §1 pp. 129–138, §§2–3 and §4(a)–(c) pp. 138–146, including formal immersion and the prime-torsion corollaries.
- **Mazur–Tate 1973:** §§1–5 pp. 41–49, read from primary page images, including the norm-19 descent diagram.
- **Deligne–Rapoport:** the maintainer-cleared corrected 1986 printing, VI §§5.1–5.3 and 6.1–6.14 pp. 282–289; VII §§1.2–1.16 and 2.1–2.7 pp. 292–302; VII §§3.17–3.20 pp. 307–310. These are volume page numbers. No copy or passage was saved. Mazur's older reference to IV 6.9 corresponds to VI 6.9 in this printing.
- **Mazur–Wiles 1984:** only §8.I, pp. 187–188, read from primary page images for the three published corrections. The remainder of the class-fields paper is outside this source reading and roadmap scope.

Four `sourceIssues` describe the corrections: the cusp-label reversal between Mazur 1977 II §1 and III §5 Step 3; the missing ordinary Weil-duality deduction in Corollary 16.3; the invalid intermediate divisor calculation on p. 105, replaced by the Siegel-function square argument; and the omitted diamond factor in the lifted marked Hecke correspondence on p. 100. The last three have the published Mazur–Wiles correction. No published correction for the first was found in the primary texts examined. None has an independent-review verdict yet.

The missing Ogg and Masley computations are explicitly gaps, not sources silently claimed read. General supplier results are assigned to their owners; no section-by-section source summary is used as a substitute for a target plan.

## Verification and next step

`scripts/check_blueprint.py` passes with zero errors and zero warnings using the pinned declaration index. `scripts/check_sorry_data.py` passes. The suggested file elaborated successfully through `lean-check` at the pins, exit 0, with exactly eight declaration-uses-sorry warnings and no other warnings or errors. The two numerical examples are proved. Available memory was checked before the single compile, which finished within the time limit; no Lean process was left running.

The intake `check-files` command accepts all five deliverables with zero problems. Structural cross-checks confirm an acyclic internal dependency graph, a node for each stage target, every node declaration/API/test name in the reader, every suggested declaration name in the reader, exact agreement between stage dependencies and node prerequisites, and the planet count/name limits.

Exact rational generalized-Weierstrass calculations separately verified the four examples. For coefficient tuples (0,0,0,−1,0), (0,0,1,0,0), (0,−1,−1,0,0), (−1,−4,−4,0,0), discriminants are respectively 64, −27, −11, −1664. Starting from (0,0), the successive nonzero multiples for order 3 are (0,−1); for order 5 they are (1,1),(1,0),(0,1); for order 7 they are (4,8),(2,2),(2,4),(4,0),(0,4). The next multiple is infinity; the order-2 tangent is vertical. These arithmetic checks are evidence for the reader examples, not a Lean formalisation claim.

The next programme action is independent review of this complete target-level plan. Review should check all target hypotheses, source corrections and ownership boundaries, with particular attention to the coefficient-prime-equals-level gap, dyadic normalization and level-13 kernel labeling. Subsequent closure work must supply the six Part II contracts and the three specific missing inputs, refine the proof sketches and update each stage's coverage. The source metadata and these notes retain what is needed after deletion of the worker's scratch directory.
