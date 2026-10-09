# Handoff: BP-SchemeAndStackFoundations--SF.3

Worker: Claude Code session cc-7c6bac, 2026-10-09. Pins: Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

## What is closed

Layer SF.3 (curves, divisors and Picard objects) is **planned** at target level: 26 nodes (1 definition, 5 constructions, 17 theorems, 2 comparisons, 1 lemma), 53 API items, 25 unit tests, 6 planets, 56 baseline declarations read at the pins. Every target the layer states is realised by a node whose prerequisites end in the libraries, in Tau Ceti roadmap layers (JacobianChallenge A–F, AlgebraicCurves 7, 8, 10, 12, StableReduction 1–2, ClassFieldTheory 5 and 10), in earlier layers of this roadmap (SF.0, SF.1, SF.2 and the accepted SF.2 nodes `serre-proper`, `smooth-proper`, `canonical-module`, `cohomological-brauer`, `field-comparison`), in the PR 196 CohomologicalPointCounting layers integrated through SF.2, or in the one recorded gap. The packet status is `complete`; `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.3.json` reports 0 errors and 0 warnings against the swarm declaration index at the pins.

The integration principle: JacobianChallenge, AlgebraicCurves and StableReduction already plan most curve theory (line bundles, Pic X, coherent cohomology of curves, genus, line-bundle Riemann–Roch and Serre duality, the Picard functor with a rational point, the Jacobian, Abel–Jacobi, the function-field theory and the curve–function-field dictionary, the dualizing sheaf of curves). None of it is planned again. SF.3 adds:

- curves and checks: nonsingular projective model and boundary of a normal curve; affine-or-projective; scheme genus invariant under every field extension, with the inseparable function-field contrast; scheme Riemann–Hurwitz; the genus-zero characterization of P¹; genus-one curves (degree-one bundles give points, X ≅ Pic¹, the pointed X ≅ Pic⁰); degree bounds for vanishing, generation and very ampleness;
- vector bundles: degree, Riemann–Roch for vector bundles on Gorenstein curves, Serre duality for coherent sheaves on Cohen–Macaulay curves (the curve case of SF.2's duality, identified with JacobianChallenge's and StableReduction's ω);
- Picard objects: Pic = H¹(G_m) in every topology; Weil classes versus Pic on normal and locally factorial schemes; the excision sequence; Picard groupoids (abstract and of a scheme, with the graded variant); norms of invertible sheaves; Picard schemes and torsors Pic^d of a curve without a rational point; the Picard–Brauer obstruction sequence over a field and its hyperelliptic consequence (BGW Proposition 21); the degree-zero comparison between Tau Ceti's Cl⁰, the scheme Pic⁰ and Jac(X)(k); the Picard stack; the stack of sections X̂_d; Abel maps in high degree; the double-cover norm sequence;
- Jacobian comparisons: invariant differentials, pullback of 1-forms along Abel–Jacobi, and the Tate module of the Jacobian against étale H¹ with pinned dual conventions.

A read-only fresh-eyes mathematical check (a separate agent of this session, not the independent review) found five errors before commit, all corrected: the genus-zero torsor example (Pic^d of a pointless conic is Spec k for every d), the fibres of Abel maps over points not represented by a sheaf (Brauer–Severi varieties), the 'only if' of the Pic/Cl bijectivity criterion (needs normality), and in the Lean file the missing normality and dimension hypotheses of `nonsingularModel` and the finiteness of local generator families in `IsLocallyFreeOfRank`.

## What remains (coverage `remaining`)

1. Lemma-level decomposition, when SF.3 reaches the lemma-level threshold: the Galois descent step of `picard-scheme-without-point`, the Leray five-term sequence in `picard-brauer-sequence`, the projectivization in `abel-maps-high-degree`(iii), and the commutative square in `abel-jacobi-differentials`.
2. The recorded gap: no accepted node states the five-term exact sequence of the Leray spectral sequence on étale sites and the identification of étale cohomology of Spec k with continuous Galois cohomology. SF.2's scope covers both; the SF.2 follow-up should add the node, and `picard-brauer-sequence` then cites it instead of the SF.2 stage.
3. Source issue SchemeAndStackFoundations/E-SF3-1: Milne's Abelian Varieties v2.0, Part III, Proposition 2.2 leaves the key commutative square as an exercise; the node records the missing argument.

## Red-team findings handed to this job

- RT-AREA-algebraicgeometry/8 (Néron–Severi group): not planned in SF.3. NS(A), [L] ↦ φ_L, finite generation and the Picard number belong to AbelianSchemesAndArithmeticModuli A2 as the fix prescribes; SF.3 supplies the Picard groups, groupoids and torsors A2 starts from, and the reader states the boundary. The retargeting of PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/9 to the A2 node is an edit to that extraction, for the A2 fix job.
- RT-AREA-algebraicgeometry/18 (coherent duality beyond curves): left to SF.2. `curve-serre-duality` is deduced from SF.2's `serre-proper`, `smooth-proper` and `canonical-module` and is only the curve case; GUO-REINECKE-24/205 (formal smooth proper duality) is redirected to SF.2.
- RT-AREA-geomlanglands/15 (positivity and Keel): not planned in SF.3; owner SF.5 (or a stage after it). BHATT-SCHOLZE-17 route 3 items G811, G814, G815, G817 are not realised here. SF.3 has only curve-level degree bounds, and cites StableReduction Layer 2 for ampleness by degree.

## Notions moved down (record for the higher roadmaps)

- JacobianChallengePartII JC0 (Picard representability and Picard degree torsors) and JC4 (`actual-to-relative-obstruction`): the field case S = Spec k is planned here as `SF.3/picard-scheme-without-point` and `SF.3/picard-brauer-sequence`. JacobianChallengePartII (outside the Caraiani–Newton tiers) should cite these nodes and prove its relative statements compatible.
- NeronModelsAndSemistableAbelianVarieties R11.4 `bgw-brauer-descent`: the rational-classes-versus-rational-divisors statement is planned here from the general sequence as `SF.3/rational-divisor-classes`; R11.4 should import it and keep only the generalized-Jacobian torus route.
- No SF.3 node cites a roadmap above SchemeAndStackFoundations in the upstream order. Relative Picard schemes and Jacobians over a base, and higher-dimensional Picard representability (AlgebraicModuliForArithmeticGeometry, JacobianChallengePartII), are not cited; their field cases are planned here.

## Requests and redirections

Requests (packet `requests`) go to the Tau Ceti layers listed above, each with the exact statement used and the consuming nodes. The PR 196 imports (TraceFormula Layer 8, ConstructibleEtale Layers 6 and 7–9, EllAdicRealization) are in `upstreamImports`, with SF.2 as their atlas integration owner, and the Tate-module node carries them in `upstreamPrerequisites`. The packet field `consumerRequests` gives the disposition of every request other packets made to SF.3: planned here, or the owner that must plan it (models over DVRs → SF.4 and StableReduction 2/5; étale π₁ → PR 196 ConstructibleEtale 3; tensor powers of line bundles → JacobianChallenge A and StableReduction 2; relative Jacobians → JacobianChallengePartII and AlgebraicModuli; general abelian-variety Tate modules → AbelianSchemesAndArithmeticModuli A4; Bertini and normal crossings → SF.0/SF.4/SF.5; de Rham cohomology of curves → the de Rham roadmap; the plane-curve genus bound → FF.2 composing AlgebraicCurves Layer 8).

Restructure proposals in the packet: (1) route FARB-KISIN-WOLFSON-24 /007, /008, /069, /070 (Albanese and Picard varieties of higher-dimensional varieties) to the owner of higher-dimensional Picard representability; SF.3 keeps the curve case; (2) JacobianChallengePartII cites the field-level SF.3 nodes; (3) atlas sub-layers SF.3a–SF.3d.

## Suggested Lean file

`research/blueprint/suggested/SchemeAndStackFoundations--SF.3.lean` **compiles** with the swarm's `lean-check research/blueprint/suggested/SchemeAndStackFoundations--SF.3.lean` (`lake env lean` in the shared build at the pins): exit code 0, 57 warnings, all "declaration uses `sorry`", no errors and no other warnings.

It imports only modules compiled in that build. Tau Ceti's coherent cohomology of sheaves of modules (`Scheme.Modules.Cohomology`, its base-field module structure and `eulerCharBelow`) exists at the pin but is not compiled there, so `dim_k Hⁱ` enters as the admitted datum `cohomologyDim` (intended body `Module.finrank k (Cohomology M i)`); the degree, genus, Riemann–Roch, degree-bound, genus-base-change and Riemann–Hurwitz statements are typed against it. The Picard groupoid, line-bundle norm, Picard components, Jacobian and Picard–Brauer obstruction are typed (data admitted, interfaces as lemmas). Interfaces whose carriers the libraries lack (duals and determinants of sheaves of modules, Ext groups, the sheaf of differentials, algebraic stacks, symmetric powers, Tate modules of abelian varieties, μ_n-coefficients) are comments that name every API item and test of the packet; every packet node id, API name and test name appears in the file.

## Sources read (2026-10-09)

- The Stacks Project, git master a04446e (2026-07-28): Algebraic Curves §§2, 4–8, 10, 12, 17, 18, 22; Picard Schemes of Curves (all); Varieties §§25, 43, 44; Divisors §§18, 27, 28; Étale Cohomology §§24, 28, 69; Groupoid Schemes §6; Chow Homology §19; Brauer Groups §§5, 8.
- Kleiman, The Picard scheme, arXiv:math/0504020v1, §2 (SHA-256 cc14e62f…).
- Milne, Abelian Varieties v2.0 (2008), Part III §§1, 2, 5, 9 (SHA-256 f5ca4e63…).
- Bhargava–Gross–Wang, arXiv:1310.7692v2, §3 (SHA-256 8833a226…).
- Yun–Zhang, arXiv:1512.02683v3, §3.2 and §6.1 (SHA-256 76bb3576…).
- Harpaz–Wittenberg, author manuscript, §3 (SHA-256 2e425ee6…).
- Bhatt–Scholze, arXiv:1507.06490v3, §§4–5, 12 (SHA-256 b4d5a4e0…).
- Tau Ceti roadmap documents JacobianChallenge, AlgebraicCurves, StableReduction (as mirrored in content/tau-ceti/), and PR 196 CohomologicalPointCounting/TraceFormula and ConstructibleEtale at head 4bd72379.

Not available or not used: Hartshorne, Liu, Bosch–Lütkebohmert–Raynaud, Mumford's Abelian Varieties and Prym Varieties, and Milne's Jacobian Varieties chapter (the public scan has no text layer); every statement is sourced from the public texts above.
