# Handoff: DESIGN-HeightsRationalPointsAndObstructionsPartII

Worker: Claude (session claude-v7uwjP), 2026-10-19. Issue #3343.

## What was done

- New roadmap `HeightsRationalPointsAndObstructionsPartII` (“Heights, rational points and obstructions, Part II: uniform Bogomolov and uniform Mordell–Lang”), area arithmeticgeometry, parent HeightsRationalPointsAndObstructions, 13 layers UB.0–UB.12.
- Packet: 112 nodes (1 comparison, 13 construction, 11 definition, 87 theorem), 121 API items, 78 unit tests, 16 planets, 10 baseline declarations, 28 requests, 7 gaps. Status `complete`; every layer `planned` with lemma-level refinements listed in `remaining`.
- `python3 scripts/check_blueprint.py --index <declarations.tsv>`: 0 errors, 0 warnings.
- Suggested.lean (125 lines, compact shape): elaborated with `lean-check` against Mathlib 082e2d3 / Tau Ceti f790474; the only warnings are declaration-uses-placeholder-proof warnings. It states ball packing, the packing-to-count step, the cone covering and the linear core of Xie–Yuan Lemma 3.4; everything else has no carriers at the pins and is a README target.
- Reader: research/blueprint/readmes/HeightsRationalPointsAndObstructionsPartII.md, generated from the packet (escaped for src/markdown.js; no unescaped emphasis openers).

## Scope decision

The issue lists twelve routes in five independent directions. Following the brief (“if they split into independent directions, plan the first here and record a restructure proposal for the rest”), this roadmap plans the uniformity programme (Yuan 2026, Dimitrov–Gao–Habegger 2021, DeMarco–Krieger–Ye 2020, Gao–Habegger 2019, Xie–Yuan 2022, DeMarco–Mavraki–Ye 2026, Gao–Ge–Kühne 2026: 168 routed items). The other four route ids — HeightsRationalPointsPartIIRandomFano (Browning–Le Boudec–Sawin 2023), HeightsRationalPointsPartIIRandomFibrations (Skorobogatov–Sofos 2023), HeightsRationalPointsPartIIHomogeneousMassey (Harpaz–Wittenberg 2023 and 2020) and HeightsRationalPointsPartIIZeroCycles (Harpaz–Wittenberg 2020) — are proposed as their own design jobs in the packet’s first `restructure` entry. None of their items is planned here.

## Where the parent stops

The parent is TauCetiRoadmap PR #1017 (head cc46c40). Its README already owns DGH Theorem A.1 (Silverman–Tate in families, §0.26), the family duplication bound, Silverman’s specialization limit (GH Theorem 11.1, §0.29), Silverman’s dominant-map bound (GH Proposition 9.1’s input, §0.30), function-field cycle heights from Xie–Yuan (1.1)–(1.3) and Gubler (§§0.31–0.35), Scanlon’s automatic uniformity and uniform Manin–Mumford in families (§§5.8–5.8a), Rémond’s degree bounds for maximal cosets and orthogonal complements (§§5.4a–c), the Vojta–Faltings method and projective cycle heights with arithmetic Bézout (§§5.9–5.10), the essential minimum, Bogomolov over number fields and equidistribution (§§5.17–5.19) and GH Appendix C (§5.20). These are cited (stage ids RP.0, RP.1, RP.5 with request entries quoting the PR sections, or the accepted packet’s node ids), never planned again.

## Imports from other roadmaps (node ids)

- `AbelianSchemesAndArithmeticModuli:A1` (1)
- `AbelianSchemesAndArithmeticModuli:A1/relative-cube-and-power` (1)
- `AbelianSchemesAndArithmeticModuli:A1/torsion-restriction-of-rigidified-lines` (1)
- `AbelianSchemesAndArithmeticModuli:A2` (5)
- `AbelianSchemesAndArithmeticModuli:A2/nef-normalized-lines-over-curves` (1)
- `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density` (4)
- `AbelianSchemesAndArithmeticModuli:A6` (2)
- `AbelianSchemesAndArithmeticModuli:A6/relative-hom-and-normal-extension` (2)
- `AbelianSchemesAndArithmeticModuliPartII:B0/birational-betti-rank` (1)
- `AbelianSchemesAndArithmeticModuliPartII:B1/betti-form` (2)
- `AbelianSchemesAndArithmeticModuliPartII:B1/betti-form-kernel` (1)
- `AbelianSchemesAndArithmeticModuliPartII:B1/dgh-22` (1)
- `AbelianSchemesAndArithmeticModuliPartII:B1/non-degenerate` (5)
- `AbelianSchemesAndArithmeticModuliPartII:B1/nonzero-smooth-point` (1)
- `AbelianSchemesAndArithmeticModuliPartII:B2/degenerate-generically-special` (1)
- `AbelianSchemesAndArithmeticModuliPartII:B2/generically-special` (2)
- `AbelianSchemesAndArithmeticModuliPartII:B4/dgh-25` (1)
- `AbelianSchemesAndArithmeticModuliPartII:B4/difference-product` (1)
- `AbelianSchemesAndArithmeticModuliPartII:B4/gao-fibre-power` (1)
- `AlgebraicModuliForArithmeticGeometry:R09.1/bounded-degree-hilbert-polynomials` (1)
- `AlgebraicModuliForArithmeticGeometry:R09.1/chow-open-and-embedding` (1)
- `AlgebraicModuliForArithmeticGeometry:R09.2/hilbert-scheme` (2)
- `ArakelovGeometryAndAbelianHeights:R35.3/stable-faltings-height` (4)
- `ArakelovGeometryAndAbelianHeights:R35.4/isogeny-height-bounds` (1)
- `ArakelovGeometryAndAbelianHeights:R35.5/modular-height-equals-faltings-height` (2)
- `ArakelovGeometryAndAbelianHeights:R35.5/moduli-height-northcott` (1)
- `ArakelovGeometryAndAbelianHeights:R35.5/theta-faltings-comparison` (3)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.12/cross-characteristic-restriction` (2)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.12/potential-bigness` (2)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.12/potential-bigness-criterion` (3)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.12/product-grid-bound` (1)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.12/theta-potential-bigness` (3)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.13/bost-lower-bound` (1)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.13/function-field-faltings-height` (2)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.3/deligne-pairing` (2)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.4/adelic-heights` (4)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.4/fundamental-inequality` (1)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.4/height-inequality` (2)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.5/adelic-hodge-bundle` (2)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.5/invariant-extension` (4)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.5/non-degenerate` (2)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.5/non-degenerate-height-inequality` (1)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.6/moriwaki-height-machine` (1)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.6/moriwaki-heights` (1)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.6/moriwaki-neron-tate` (1)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.6/moriwaki-silverman-tate` (2)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.8/canonical-theta-bundle` (2)
- `ArakelovGeometryAndAbelianHeightsPartII:AH.9/canonical-theta-identities` (2)
- `ArithmeticDynamics:DY.6` (1)
- `ArithmeticDynamics:DY.6/common-torsion-image-orders-unbounded` (1)
- `ArithmeticDynamics:DY.6/common-torsion-images-three-common-branch-values` (1)
- `ArithmeticDynamics:DY.6/lattes-map-canonical-height` (1)
- `ArithmeticDynamics:DY.6/legendre-uniform-joint-small-points` (1)
- `ArithmeticDynamics:DY.6/two-torsion-translation` (2)
- `ComplexComparisonPartII:C5/analytic-cycle-integration` (1)
- `ComplexComparisonPartII:C5/dgh-integration-application` (1)
- `ComplexComparisonPartII:C5/semipositive-wedge` (1)
- `HeightsRationalPointsAndObstructions:RP.0` (1)
- `HeightsRationalPointsAndObstructions:RP.0/duplication-by-quartics` (2)
- `HeightsRationalPointsAndObstructions:RP.0/fibrewise-height-model-independence` (1)
- `HeightsRationalPointsAndObstructions:RP.0/geometric-height-base-change` (3)
- `HeightsRationalPointsAndObstructions:RP.0/geometric-height-field` (2)
- `HeightsRationalPointsAndObstructions:RP.0/geometric-height-laws` (1)
- `HeightsRationalPointsAndObstructions:RP.0/geometric-subvariety-height` (3)
- `HeightsRationalPointsAndObstructions:RP.0/good-reduction-height-formula` (2)
- `HeightsRationalPointsAndObstructions:RP.0/height-positivity-base-locus` (1)
- `HeightsRationalPointsAndObstructions:RP.0/model-mk-height-comparison` (1)
- `HeightsRationalPointsAndObstructions:RP.0/neron-tate-bilinear-form` (1)
- `HeightsRationalPointsAndObstructions:RP.0/neron-tate-height` (4)
- `HeightsRationalPointsAndObstructions:RP.0/neron-tate-kernel-number-field` (1)
- `HeightsRationalPointsAndObstructions:RP.0/normalized-height` (1)
- `HeightsRationalPointsAndObstructions:RP.0/silverman-specialization-limit` (1)
- `HeightsRationalPointsAndObstructions:RP.0/silverman-tate` (3)
- `HeightsRationalPointsAndObstructions:RP.0/weil-height-machine` (1)
- `HeightsRationalPointsAndObstructions:RP.1` (1)
- `HeightsRationalPointsAndObstructions:RP.1/function-field-neron-tate-kernel` (3)
- `HeightsRationalPointsAndObstructions:RP.1/kk-trace` (5)
- `HeightsRationalPointsAndObstructions:RP.1/lang-neron` (1)
- `HeightsRationalPointsAndObstructions:RP.5` (5)
- `HeightsRationalPointsAndObstructions:RP.5/abelian-subvariety` (2)
- `HeightsRationalPointsAndObstructions:RP.5/essential-minimum` (1)
- `HeightsRationalPointsAndObstructions:RP.5/faltings-subvarieties` (1)
- `HeightsRationalPointsAndObstructions:RP.5/faltings-zhang-map` (3)
- `HeightsRationalPointsAndObstructions:RP.5/finite-rank-subgroup` (2)
- `HeightsRationalPointsAndObstructions:RP.5/generated-abelian-subvariety` (9)
- `HeightsRationalPointsAndObstructions:RP.5/manin-mumford` (3)
- `HeightsRationalPointsAndObstructions:RP.5/manin-mumford-positive-characteristic` (1)
- `HeightsRationalPointsAndObstructions:RP.5/minimal-torsion-subvariety` (1)
- `HeightsRationalPointsAndObstructions:RP.5/mordell-lang` (2)
- `HeightsRationalPointsAndObstructions:RP.5/mumford-gap` (1)
- `HeightsRationalPointsAndObstructions:RP.5/stabilizer` (4)
- `HeightsRationalPointsAndObstructions:RP.5/ueno-locus` (9)
- `HeightsRationalPointsAndObstructions:RP.5/uniform-manin-mumford` (1)
- `HeightsRationalPointsAndObstructions:RP.5/vojta-inequality` (1)
- `HeightsRationalPointsAndObstructions:RP.5/zhang-difference-lemma` (1)
- `InverseGaloisAndArithmeticFundamentalGroups:IG.2` (1)
- `JacobianChallengePartII:JC0/picard-representability` (1)
- `JacobianChallengePartII:JC2/curve-difference` (1)
- `JacobianChallengePartII:JC2/degree-one-closed-immersion` (3)
- `JacobianChallengePartII:JC3/degree-one-theta` (1)
- `JacobianChallengePartII:JC3/twice-theta` (4)
- `JacobianChallengePartII:JC5/faltings-zhang` (1)
- `JacobianChallengePartII:JC7/universal-faltings-zhang` (1)
- `JacobianChallengePartII:JC7/universal-level-jacobian` (2)
- `NeronModelsAndSemistableAbelianVarieties:R11.1` (2)
- `NeronModelsAndSemistableAbelianVarieties:R11.3` (1)
- `NeronModelsAndSemistableAbelianVarieties:R11.3/finite-separable-semistable-extension` (1)
- `NeronModelsAndSemistableAbelianVarieties:R11.5/good-isogeny` (2)
- `PELModuli:M5/siegel-moduli` (2)
- `PELModuli:M6/universal-family-export` (3)
- `SchemeAndStackFoundations:SF.0` (1)
- `SchemeAndStackFoundations:SF.0/quasi-sections` (2)
- `SchemeAndStackFoundations:SF.4` (1)
- `SchemeAndStackFoundations:SF.5` (6)
- `SchemeAndStackFoundations:SF.5/chow-group` (1)
- `SchemeAndStackFoundations:SF.5/degree` (1)
- `StableReductionPartII:MC.4/fine-level-scheme` (2)
- `StableReductionPartII:MC.4/full-level` (1)
- `StableReductionPartII:MC.4/level-rigidity` (1)
- `StableReductionPartII:MC.6/maximal-variation-hodge` (2)
- `StableReductionPartII:MC.6/smooth-torelli` (1)
- `StableReductionPartII:MC.6/torelli-finite-fibres` (1)
- `StableReductionPartII:MC.7/consumer-dgh` (3)
- `StableReductionPartII:MC.7/level-picard-parameter` (1)
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves` (1)
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-11-automorphisms-and-the-hurwitz-bound` (1)
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property` (1)

ArakelovGeometryAndAbelianHeightsPartII (PR #10556, merged 2026-10-19 04:47Z) anticipated this roadmap in its restructure entry; its AH.4, AH.5, AH.6, AH.8, AH.9, AH.12 and AH.13 nodes are imported as it proposed and nothing of AH.0–AH.13 is planned again.

## Requests

- `SchemeAndStackFoundations:SF.5` — needed by 3 node(s).
- `HeightsRationalPointsAndObstructions:RP.5` — needed by 6 node(s).
- `AlgebraicModuliForArithmeticGeometry:R09.1` — needed by 1 node(s).
- `AlgebraicModuliForArithmeticGeometry:R09.2` — needed by 1 node(s).
- `PELModuli:M5` — needed by 2 node(s).
- `PELModuli:M6` — needed by 1 node(s).
- `HeightsRationalPointsAndObstructions:RP.0` — needed by 3 node(s).
- `AbelianSchemesAndArithmeticModuli:A2` — needed by 2 node(s).
- `ArakelovGeometryAndAbelianHeightsPartII:AH.5` — needed by 2 node(s).
- `StableReductionPartII:MC.7/consumer-dgh` — needed by 1 node(s).
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-11-automorphisms-and-the-hurwitz-bound` — needed by 1 node(s).
- `ArakelovGeometryAndAbelianHeights:R35.5` — needed by 1 node(s).
- `InverseGaloisAndArithmeticFundamentalGroups:IG.2` — needed by 1 node(s).
- `AbelianSchemesAndArithmeticModuli:A6` — needed by 1 node(s).
- `HeightsRationalPointsAndObstructions:RP.1` — needed by 2 node(s).
- `ArakelovGeometryAndAbelianHeightsPartII:AH.4` — needed by 1 node(s).
- `ArakelovGeometryAndAbelianHeightsPartII:AH.6` — needed by 1 node(s).
- `SchemeAndStackFoundations:SF.4` — needed by 1 node(s).
- `SchemeAndStackFoundations:SF.0` — needed by 1 node(s).
- `AbelianSchemesAndArithmeticModuli:A1` — needed by 1 node(s).
- `NeronModelsAndSemistableAbelianVarieties:R11.1` — needed by 1 node(s).
- `NeronModelsAndSemistableAbelianVarieties:R11.3` — needed by 1 node(s).
- `ArakelovGeometryAndAbelianHeightsPartII:AH.12` — needed by 2 node(s).
- `JacobianChallengePartII:JC3` — needed by 1 node(s).
- `ArakelovGeometryAndAbelianHeightsPartII:AH.13` — needed by 1 node(s).
- `ArithmeticDynamics:DY.6` — needed by 1 node(s).
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves` — needed by 1 node(s).
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property` — needed by 1 node(s).

## Gaps (recorded in the packet)

- Rémond’s Décompte read only through Gao–Ge–Kühne Appendix A.
- David–Philippon’s form of Rémond’s bound not read.
- Chow-form heights compared with arithmetic-intersection heights.
- Masser’s 1989 specialization theorem not read.
- Yamaki’s reduction theorem cited, not planned.
- Positive-characteristic step of Yuan §4.4.3 omitted in the source.
- Jacobi model of bielliptic genus-two curves cited.

## Item map (all 168 routed items)

- PAPER-YUAN-26/119 → UB.10/small-points-bound-families
- PAPER-YUAN-26/120 → UB.10/small-points-bound-families
- PAPER-YUAN-26/128 → UB.11/uniform-bogomolov-curves
- PAPER-YUAN-26/130 → UB.11/twice-theta-height
- PAPER-YUAN-26/133 → UB.11/isotrivial-pair
- PAPER-YUAN-26/135 → UB.11/isotriviality-criteria
- PAPER-YUAN-26/136 → UB.11/isotriviality-criteria
- PAPER-YUAN-26/138 → UB.11/isotriviality-criteria
- PAPER-YUAN-26/139 → imported: ArakelovGeometryAndAbelianHeightsPartII:AH.13/function-field-faltings-height
- PAPER-YUAN-26/140 → imported: ArakelovGeometryAndAbelianHeightsPartII:AH.13/function-field-faltings-height
- PAPER-YUAN-26/142 → UB.11/noetherian-induction-bound
- PAPER-YUAN-26/143 → UB.11/shifted-height-identity
- PAPER-YUAN-26/145 → UB.11/geometric-moduli-domination
- PAPER-YUAN-26/146 → UB.10/non-isotrivial-point
- PAPER-YUAN-26/147 → UB.10/integral-small-points-bound
- PAPER-YUAN-26/149 → UB.11/characteristic-uniformity
- PAPER-YUAN-26/171 → imported: ArakelovGeometryAndAbelianHeightsPartII:AH.5/non-degenerate
- PAPER-YUAN-26/172 → imported: ArakelovGeometryAndAbelianHeightsPartII:AH.5/non-degenerate
- PAPER-YUAN-26/173 → imported: ArakelovGeometryAndAbelianHeightsPartII:AH.5/non-degenerate (Betti-rank interpretation)
- PAPER-YUAN-26/174 → UB.10/fibre-power-nondegeneracy
- PAPER-YUAN-26/177 → UB.10/abel-power-nondegeneracy
- PAPER-YUAN-26/178 → UB.10/abel-power-nondegeneracy
- PAPER-YUAN-26/179 → UB.10/abel-power-nondegeneracy
- PAPER-YUAN-26/180 → UB.10/abel-power-nondegeneracy
- PAPER-YUAN-26/181 → UB.10/abel-power-nondegeneracy
- PAPER-YUAN-26/182 → UB.10/relative-small-points
- PAPER-YUAN-26/183 → UB.10/relative-small-points (API indep)
- PAPER-YUAN-26/184 → UB.10/relative-bogomolov-bigness
- PAPER-YUAN-26/185 → UB.10/relative-bogomolov-curves
- PAPER-YUAN-26/186 → UB.10/relative-bogomolov-curves
- PAPER-YUAN-26/187 → UB.10/relative-bogomolov-curves
- PAPER-YUAN-26/188 → UB.10/relative-bogomolov-curves
- PAPER-YUAN-26/189 → UB.10/relative-bogomolov-curves
- PAPER-YUAN-26/262 → UB.10/relative-bogomolov-curves
- PAPER-YUAN-26/263 → UB.10/relative-bogomolov-curves
- PAPER-YUAN-26/264 → UB.10/relative-bogomolov-curves
- PAPER-YUAN-26/265 → UB.10/relative-bogomolov-curves
- PAPER-YUAN-26/266 → UB.10/relative-bogomolov-curves
- PAPER-YUAN-26/259 → UB.11/function-field-height-normalization
- PAPER-YUAN-26/274 → UB.4/curve-gap-principle
- PAPER-YUAN-26/275 → UB.3/uniform-manin-mumford
- PAPER-YUAN-26/276 → UB.5/large-points-bound
- PAPER-YUAN-26/277 → UB.6/curve-uniform-mordell-lang
- PAPER-DIMITROV-GAO-HABEGGER-21/1 → UB.6/dgh-rational-points
- PAPER-DIMITROV-GAO-HABEGGER-21/2 → UB.6/dgh-large-height
- PAPER-DIMITROV-GAO-HABEGGER-21/3 → UB.6/dgh-large-height
- PAPER-DIMITROV-GAO-HABEGGER-21/4 → UB.3/uniform-manin-mumford
- PAPER-DIMITROV-GAO-HABEGGER-21/9 → UB.2/level-hypothesis
- PAPER-DIMITROV-GAO-HABEGGER-21/30 → UB.2/betti-cutoff
- PAPER-DIMITROV-GAO-HABEGGER-21/31 → UB.2/graph-construction
- PAPER-DIMITROV-GAO-HABEGGER-21/36 → UB.2/top-self-intersection-lower
- PAPER-DIMITROV-GAO-HABEGGER-21/37 → UB.2/mixed-intersection-upper
- PAPER-DIMITROV-GAO-HABEGGER-21/38 → UB.2/height-inequality-total-space
- PAPER-DIMITROV-GAO-HABEGGER-21/43 → UB.2/height-inequality-level
- PAPER-DIMITROV-GAO-HABEGGER-21/44 → UB.2/height-inequality
- PAPER-DIMITROV-GAO-HABEGGER-21/47 → UB.4/abel-jacobi-bounds
- PAPER-DIMITROV-GAO-HABEGGER-21/48 → UB.0/chow-height (heights; arithmetic Bézout is the parent RP.5 §5.9b)
- PAPER-DIMITROV-GAO-HABEGGER-21/51 → UB.0/curve-power-escape
- PAPER-DIMITROV-GAO-HABEGGER-21/53 → UB.4/base-point-bound
- PAPER-DIMITROV-GAO-HABEGGER-21/54 → UB.4/neron-tate-distance
- PAPER-DIMITROV-GAO-HABEGGER-21/57 → UB.5/large-points-bound
- PAPER-DIMITROV-GAO-HABEGGER-21/58 → UB.5/embedding-constants
- PAPER-DIMITROV-GAO-HABEGGER-21/59 → UB.5/embedding-constants-bound
- PAPER-DIMITROV-GAO-HABEGGER-21/60 → UB.0/ball-packing
- PAPER-DIMITROV-GAO-HABEGGER-21/61 → UB.6/large-moduli-height-count
- PAPER-DIMITROV-GAO-HABEGGER-21/62 → UB.6/small-moduli-height-finite
- PAPER-DIMITROV-GAO-HABEGGER-21/63 → UB.6/dgh-rational-points (polynomial growth)
- PAPER-DIMITROV-GAO-HABEGGER-21/67 → UB.5/remond-single-bound
- PAPER-DEMARCO-KRIEGER-YE-20/1 → UB.12/bielliptic-uniform-manin-mumford
- PAPER-DEMARCO-KRIEGER-YE-20/9 → UB.12/bielliptic-uniform-bogomolov
- PAPER-DEMARCO-KRIEGER-YE-20/46 → UB.12/bielliptic-diagonal-lift
- PAPER-DEMARCO-KRIEGER-YE-20/53 → UB.12/unbounded-torsion-order
- PAPER-GAO-HABEGGER-19/1 → UB.8/geometric-bogomolov-curve
- PAPER-GAO-HABEGGER-19/2 → UB.8/geometric-bogomolov-char-zero
- PAPER-GAO-HABEGGER-19/7 → imported: AbelianSchemesAndArithmeticModuliPartII:B2/generically-special; X* in UB.8/generically-special-locus
- PAPER-GAO-HABEGGER-19/8 → UB.8/generically-special-locus
- PAPER-GAO-HABEGGER-19/12 → UB.8/curve-base-height-inequality
- PAPER-GAO-HABEGGER-19/13 → UB.8/curve-base-height-inequality (Theorem 1.4′)
- PAPER-GAO-HABEGGER-19/18 → UB.8/special-points-product
- PAPER-GAO-HABEGGER-19/23 → UB.8/torsion-bounded-order
- PAPER-GAO-HABEGGER-19/24 → UB.8/special-points-product (Proposition B.3)
- PAPER-GAO-HABEGGER-19/17 → not planned separately: alternative proof of the height inequality on a dense open, superseded by UB.2/height-inequality (restructure entry 3); its consumer is UB.8/curve-base-height-inequality
- PAPER-GAO-HABEGGER-19/45 → not planned separately: alternative proof of the height inequality on a dense open, superseded by UB.2/height-inequality (restructure entry 3); its consumer is UB.8/curve-base-height-inequality
- PAPER-GAO-HABEGGER-19/48 → not planned separately: alternative proof of the height inequality on a dense open, superseded by UB.2/height-inequality (restructure entry 3); its consumer is UB.8/curve-base-height-inequality
- PAPER-GAO-HABEGGER-19/53 → not planned separately: alternative proof of the height inequality on a dense open, superseded by UB.2/height-inequality (restructure entry 3); its consumer is UB.8/curve-base-height-inequality
- PAPER-GAO-HABEGGER-19/55 → not planned separately: alternative proof of the height inequality on a dense open, superseded by UB.2/height-inequality (restructure entry 3); its consumer is UB.8/curve-base-height-inequality
- PAPER-GAO-HABEGGER-19/56 → not planned separately: alternative proof of the height inequality on a dense open, superseded by UB.2/height-inequality (restructure entry 3); its consumer is UB.8/curve-base-height-inequality
- PAPER-GAO-HABEGGER-19/57 → not planned separately: alternative proof of the height inequality on a dense open, superseded by UB.2/height-inequality (restructure entry 3); its consumer is UB.8/curve-base-height-inequality
- PAPER-GAO-HABEGGER-19/58 → not planned separately: alternative proof of the height inequality on a dense open, superseded by UB.2/height-inequality (restructure entry 3); its consumer is UB.8/curve-base-height-inequality
- PAPER-GAO-HABEGGER-19/59 → not planned separately: alternative proof of the height inequality on a dense open, superseded by UB.2/height-inequality (restructure entry 3); its consumer is UB.8/curve-base-height-inequality
- PAPER-GAO-HABEGGER-19/60 → not planned separately: alternative proof of the height inequality on a dense open, superseded by UB.2/height-inequality (restructure entry 3); its consumer is UB.8/curve-base-height-inequality
- PAPER-GAO-HABEGGER-19/61 → not planned separately: alternative proof of the height inequality on a dense open, superseded by UB.2/height-inequality (restructure entry 3); its consumer is UB.8/curve-base-height-inequality
- PAPER-GAO-HABEGGER-19/62 → not planned separately: alternative proof of the height inequality on a dense open, superseded by UB.2/height-inequality (restructure entry 3); its consumer is UB.8/curve-base-height-inequality
- PAPER-GAO-HABEGGER-19/64 → not planned separately: alternative proof of the height inequality on a dense open, superseded by UB.2/height-inequality (restructure entry 3); its consumer is UB.8/curve-base-height-inequality
- PAPER-GAO-HABEGGER-19/66 → not planned separately: alternative proof of the height inequality on a dense open, superseded by UB.2/height-inequality (restructure entry 3); its consumer is UB.8/curve-base-height-inequality
- PAPER-GAO-HABEGGER-19/71 → UB.8/moriwaki-height-inequality
- PAPER-GAO-HABEGGER-19/72 → UB.7/zhang-gubler-minimum with parent RP.0 constant-field invariance (used in UB.8/geometric-bogomolov-char-zero)
- PAPER-XIE-YUAN-22/small-points → UB.7/small-points
- PAPER-XIE-YUAN-22/special-subvariety → UB.7/special-subvariety
- PAPER-XIE-YUAN-22/special-has-small-points → UB.7/special-has-small-points
- PAPER-XIE-YUAN-22/theorem-1-1 → UB.9/geometric-bogomolov
- PAPER-XIE-YUAN-22/defined-up-to-isogeny → UB.9/defined-up-to-isogeny
- PAPER-XIE-YUAN-22/prop-3-2 → UB.9/isogeny-two-subfields
- PAPER-XIE-YUAN-22/lemma-3-3 → UB.9/isogeny-descent-closed
- PAPER-XIE-YUAN-22/lemma-3-4 → UB.9/subvariety-field-descent
- PAPER-XIE-YUAN-22/cor-3-5-i → UB.9/minimal-fields
- PAPER-XIE-YUAN-22/cor-3-5-ii → UB.9/minimal-fields
- PAPER-XIE-YUAN-22/prop-3-6 → UB.9/special-field
- PAPER-XIE-YUAN-22/lemma-3-7-pencil → UB.9/pencil-polarizations
- PAPER-XIE-YUAN-22/lemma-3-7-height → UB.9/pencil-height-inequality
- PAPER-XIE-YUAN-22/prop-3-1 → UB.9/transcendence-reduction
- PAPER-XIE-YUAN-22/multi-section → UB.9/multi-section
- PAPER-XIE-YUAN-22/prop-4-2 → UB.9/torsion-multisection-class
- PAPER-XIE-YUAN-22/fundamental-inequality → UB.7/zhang-gubler-minimum (via AH.4/fundamental-inequality)
- PAPER-XIE-YUAN-22/lemma-5-2 → UB.7/zhang-gubler-minimum
- PAPER-XIE-YUAN-22/height-zero-small-points → UB.7/zhang-gubler-minimum
- PAPER-XIE-YUAN-22/yamaki-reduction → UB.9/yamaki-reduction
- PAPER-XIE-YUAN-22/reduction-a-d → UB.9/reduction-to-good-reduction
- PAPER-XIE-YUAN-22/sum-varieties → UB.9/sum-varieties
- PAPER-XIE-YUAN-22/lemma-5-3 → UB.9/sums-torsion
- PAPER-XIE-YUAN-22/fibre-jump-locus → UB.9/summation-jump-locus
- PAPER-XIE-YUAN-22/prop-5-4 → UB.9/torsion-fibres-height-zero
- PAPER-XIE-YUAN-22/section-5-3 → UB.9/good-reduction-case
- PAPER-DEMARCO-MAVRAKI-YE-26/12 → UB.0/chow-height
- PAPER-DEMARCO-MAVRAKI-YE-26/13 → UB.0/product-set-lemma
- PAPER-GAO-GE-KUHNE-26/11 → UB.6/uniform-mordell-lang
- PAPER-GAO-GE-KUHNE-26/12 → UB.6/uniform-count
- PAPER-GAO-GE-KUHNE-26/13 → UB.4/new-gap-principle
- PAPER-GAO-GE-KUHNE-26/14 → UB.3/uniform-bogomolov
- PAPER-GAO-GE-KUHNE-26/37 → UB.1/restricted-hilbert-scheme
- PAPER-GAO-GE-KUHNE-26/38 → UB.1/points-cut-family
- PAPER-GAO-GE-KUHNE-26/39 → UB.1/fibred-power
- PAPER-GAO-GE-KUHNE-26/40 → UB.1/points-cut-family
- PAPER-GAO-GE-KUHNE-26/44 → UB.1/restricted-hilbert-family
- PAPER-GAO-GE-KUHNE-26/45 → UB.1/moduli-map-generically-finite
- PAPER-GAO-GE-KUHNE-26/51 → UB.1/nondegenerate-fibred-powers
- PAPER-GAO-GE-KUHNE-26/52 → UB.1/generic-locus
- PAPER-GAO-GE-KUHNE-26/53 → UB.1/generic-locus-closure
- PAPER-GAO-GE-KUHNE-26/56 → UB.2/height-inequality
- PAPER-GAO-GE-KUHNE-26/57 → UB.4/family-height-gap
- PAPER-GAO-GE-KUHNE-26/58 → UB.0/product-set-lemma
- PAPER-GAO-GE-KUHNE-26/61 → UB.4/principal-height-gap
- PAPER-GAO-GE-KUHNE-26/63 → UB.4/polarized-height-gap
- PAPER-GAO-GE-KUHNE-26/64 → UB.3/family-equidistribution
- PAPER-GAO-GE-KUHNE-26/68 → UB.3/family-uniform-bogomolov
- PAPER-GAO-GE-KUHNE-26/69 → UB.3/uniform-bogomolov-exceptional
- PAPER-GAO-GE-KUHNE-26/70 → UB.4/gap-principle-fixed
- PAPER-GAO-GE-KUHNE-26/71 → UB.5/packing-hypothesis
- PAPER-GAO-GE-KUHNE-26/72 → UB.5/remond-vojta
- PAPER-GAO-GE-KUHNE-26/73 → UB.5/remond-mumford
- PAPER-GAO-GE-KUHNE-26/74 → UB.5/isolated-fibre-alternative
- PAPER-GAO-GE-KUHNE-26/75 → UB.0/chow-height (BGS height = parent RP.5 §5.9b projective cycle height)
- PAPER-GAO-GE-KUHNE-26/76 → UB.5/subvariety-height-removal
- PAPER-GAO-GE-KUHNE-26/77 → UB.5/embedding-constants-bound and UB.5/remond-single-bound
- PAPER-GAO-GE-KUHNE-26/78 → UB.0/ball-packing
- PAPER-GAO-GE-KUHNE-26/79 → UB.5/remond-counting
- PAPER-GAO-GE-KUHNE-26/80 → UB.5/packing-hypothesis-holds
- PAPER-GAO-GE-KUHNE-26/81 → UB.6/uniform-count-qbar
- PAPER-GAO-GE-KUHNE-26/82 → UB.6/masser-specialization
- PAPER-GAO-GE-KUHNE-26/83 → UB.6/good-model-ueno
- PAPER-GAO-GE-KUHNE-26/84 → UB.6/specialization-lemma
- PAPER-GAO-GE-KUHNE-26/85 → UB.6/uniform-count
- PAPER-GAO-GE-KUHNE-26/87 → parent RP.5 §5.4c (orthogonal complements of bounded degree), used in UB.6/ueno-reduction
- PAPER-GAO-GE-KUHNE-26/89 → UB.6/ueno-reduction
- PAPER-GAO-GE-KUHNE-26/90 → UB.5/large-points-bound
- PAPER-GAO-GE-KUHNE-26/91 → UB.5/remond-counting (Step 2)
- PAPER-GAO-GE-KUHNE-26/92 → UB.5/remond-counting (Step 3)
- PAPER-GAO-GE-KUHNE-26/93 → UB.3/uniform-bogomolov

## Sources read

- http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf (author copy, read 2026-10-19, sha256 b36f4860cc0f098e…)
- https://arxiv.org/abs/2001.10276v3 (preprint, read 2026-10-19, sha256 5fc8e86f53ee43e9…)
- https://arxiv.org/abs/1801.05762v3 (preprint, read 2026-10-19, sha256 ffe408dc6ba034b2…)
- https://arxiv.org/abs/2108.09722v1 (preprint, read 2026-10-19, sha256 2587e70314bddb8f…)
- https://pmihes.centre-mersenne.org/item/10.5802/pmihes.26.pdf (published, read 2026-10-19, sha256 4ee5a38b32780728…)
- https://arxiv.org/abs/2101.10272v4 (preprint, read 2026-10-19, sha256 06781b5207e71433…)
- https://arxiv.org/abs/1901.09945v2 (preprint, read 2026-10-19, sha256 8fc51ac36f9fc4b4…)
- http://www.numdam.org/item/ASNSP_2000_4_29_1_101_0/ (preprint, read 2026-10-19, sha256 555cd2ad1febe811…)
- https://arxiv.org/abs/1405.0896v5 (preprint, read 2026-10-19, sha256 0bb02ad9cff328c2…)
- http://www.numdam.org/item/BSMF_1996__124_3_457_0/ (preprint, read 2026-10-19, sha256 3772b27fe99b31b4…)
- https://arxiv.org/abs/2405.17343v3 (preprint, read 2026-10-19, sha256 bb103ede86e058ca…)
- TauCetiRoadmap PR #1017 README and Suggested.lean at head cc46c40 (via the GitHub API).

Not read (taken as the main papers state them; recorded as gaps): Rémond 2000 (both papers), David–Philippon 2002, Masser 1989/1996, Yamaki 2018, Hindry 1988 Appendix 1, Shaska–Völklein. Published versions of Yuan (Annals, subscription), DGH (Annals) and Xie–Yuan (Inventiones) were not available; the author manuscript and arXiv versions were read, as the extractions did.

## Source issues

No new mistakes were found; `sourceIssues` is empty. The corrections recorded by the seven paper extractions are applied in the node statements and listed in the reader’s “Corrections applied” table. Locator note: the GGK extraction states that published page = PDF page + 188; in the Centre Mersenne file the offset is +187 (PDF page 3 carries printed page 190). The extraction’s page numbers themselves are right.

## Independent cross-check

A Sonnet subagent compared all 112 statements with the source texts (read-only). Its findings and what was done:

- UB.0/chow-height: the cited papers only fix some height of cycles; the Chow-form definition stays, the comparison with the arithmetic-intersection height is now attributed to Philippon and Bost–Gillet–Soulé (not read) and recorded as a gap.
- UB.0/ball-packing: locator corrected to GGK §7.1, p. 221; GGK (4.6) is on p. 206.
- UB.3/uniform-manin-mumford: Kühne’s Theorem 2 is over ℂ; DGH Theorem 1.4 has a constant c(g, d). The statement now says that the uniform theorem implies DGH 1.4 with a constant independent of d.
- UB.3/betti-equilibrium-measure: the probability normalization was dropped; the measure is Kühne’s κ_X^{-1}β^d (Lemma 25), with β a positive multiple of the Betti form.
- UB.5/remond-single-bound: the explicit exponent is taken from the reviewed DGH extraction (item 67), whose reviewer read David–Philippon p. 643; recorded as such.
- UB.7/adelic-canonical-comparison and UB.7/zhang-gubler-minimum: locators now say what the pages define; the identification and the lower inequality are derived from AH.4–AH.5 (Yuan–Zhang Theorems 5.3.3, 6.1.1–6.1.3).
- UB.11/noetherian-induction-bound: restricted to S = M_{g,N} with its universal curve (or S quasi-finite over M_g), as in Yuan §4.4.1, since Theorem 4.5(4) needs a generically finite moduli map on every subvariety.
- UB.9/torsion-fibres-height-zero: the prime-to-p restriction is flagged in the statement as the XY extraction’s E2.
- UB.9/yamaki-reduction: the three-way equivalence was checked against Yamaki’s Theorem 1.5 (arXiv v5).
- UB.1/restricted-hilbert-scheme (L very ample), UB.2/level-hypothesis (regular base for the embedding) and UB.9/multi-section (curve base) now carry the sources’ hypotheses.

## What a follow-up should do

- Review: check the imports of AH.5 (equidistribution on non-degenerate subvarieties as the source of Kühne’s theorem) and the decision not to plan Gao–Habegger §§6–10 separately (restructure entries 2–3).
- Lemma-level refinements listed per layer in `coverage[].remaining`; the gaps above (Rémond, David–Philippon, Masser, Yamaki read at the source; the characteristic-p step of Yuan §4.4.3).
- Design jobs for the four other directions (restructure entry 1).
