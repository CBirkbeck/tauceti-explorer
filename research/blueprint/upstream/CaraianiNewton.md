# Caraiani–Newton: the roadmaps it needs, in upstream order

Generated 2026-10-09 from tauceti-explorer main: `data/atlas.json` stage links, `research/blueprint/roadmaps/*.json` and every packet's node prerequisites. Statuses refreshed 2026-10-12; the Tau Ceti stage of each roadmap comes from `tauceti_status.json` next to this file.

**Where it stands.** The `top` label covers tiers 1–4. All thirteen tier 1–4 roadmaps are open pull requests on TauCetiRoadmap: #779 SchemeAndStackFoundations, #780 PadicMeasuresIwasawaAlgebras, #785 ReductiveGroupsPartII with #792 AdelicAlgebraicGroups and #793 SmoothRepresentationsOfLocalGroups stacked on it and #789 IntegralHeckeAndGaloisDeterminants on #793, and the adic stack #817 AdicSpacesPartII ← #813 AdicSpacesPartIII ← #814 AdicEtaleGeometry ← #815 AdicSpacesPartIV, #818 PerfectoidSpaces ← #816 PerfectoidTowers and #820 DiamondsAndVStacks. The independent reviewer recommends approval of every one; after the 2026-10-12 citation sweep and its repairs, every pull request was re-reviewed on its current head; the approval recommendations stand, with #779 awaiting the pass after its latest small corrections. The remaining tier 3–4 roadmaps (GeometryOfNumbersAndQuadraticArithmetic, EnhancedDerivedSheaves, AlgebraicModuliForArithmeticGeometry, LocallyAnalyticDistributions, DiophantineApproximationAndTranscendence) have finished packages on the explorer board awaiting their Tau Ceti lane. Tier 5–9 package jobs (ComplexComparisonPartII, ClassicalArithmeticCompletion, InverseGaloisAndArithmeticFundamentalGroups, AbelianSchemesAndArithmeticModuli, ArithmeticGaloisDuality, SelmerIwasawaCohomology, CrystallineCohomology, HeightsRationalPointsAndObstructions) were queued on 2026-10-12 and the swarm is working on them.

**Needed.** The main roadmap, EllipticCurveModularityImaginaryQuadratic, reaches 94 roadmaps (601 layers) through the atlas's stage links. Five of them (AutomorphicPadicLFunctions, FiniteFieldsAndCharacterSums, PadicHodgeRegulators, RelativeFarguesFontaine, SieveMethodsAndPrimePatterns) are reached only through an upward citation of a single layer; that notion moves down into the citing roadmap, and the roadmap itself is not needed (see `drops.json`), leaving 89 roadmaps (584 layers). Node-by-node packet citations reach 55 more (Habiro, K-theory, Euler systems and others); those are stray citations to be removed, not needs.

**Moves down and drops out.** AutomorphicPadicLFunctions: layer L3 (totally real abelian and CM p-adic L-function constructions, for the ordinary theory over totally real fields) is required by PadicFamilies:L5. FiniteFieldsAndCharacterSums: layer FF.1 (characters and elementary character sums, for Dirichlet L-functions) is required by AnalyticNumberTheory:AN.1. PadicHodgeRegulators: layer L1 (Bloch–Kato maps, for the finite local conditions of Selmer structures) is required by SelmerIwasawaCohomology:L2, SelmerIwasawaCohomology:L4. RelativeFarguesFontaine: layer RF4:vector-bundles (linear patching of vector bundles, for Breuil–Kisin–Fargues modules) is required by AInfCohomology:AI.2. SieveMethodsAndPrimePatterns: layer SV.2 (large sieve and bilinear sums, for the uniformity estimates that impose infinitely many local conditions) is required by ArithmeticStatistics:ST.2.

**Order.** A roadmap goes to Tau Ceti only once every roadmap it depends on is there. At roadmap level the 94 depend on each other in cycles, so:
- Groups of tightly coupled roadmaps are merged, each into one package (at most four roadmaps per group).
- The remaining units are ordered by where their layers sit in the atlas's layer graph, then by a local search that minimises citations pointing upward.
- In this order, 61 reviewed stage links and 503 packet citations point upward, between 98 pairs of units. Each is a notion that moves down into the citing roadmap.
- The order has 28 tiers. A unit in tier t depends only on Mathlib, Tau Ceti and units in tiers below t, once its upward citations have moved down.

Each roadmap line shows: packets accepted/total, package status, Tau Ceti stage when it has one, the layers Caraiani–Newton needs out of the roadmap's total, and the upward citations to move down.

## Tier 1

- **FoundationsAndLibraryIntegration** — Foundations, existing libraries, and proof integrity. No plan yet · package not yet · CN needs 5/6 layers
- **ReductiveGroupsPartII** — Reductive groups, Part II: local structure and arithmetic models. Plan 0/1 accepted · package not yet · CN needs 7/7 layers · **Tau Ceti: pull request #785 open** · move down: AlgebraicModuliForArithmeticGeometry (1)
- **PadicMeasuresIwasawaAlgebras** — P-adic measures, completed group algebras, and characteristic ideals. Plan 0/1 accepted · package not yet · CN needs 7/8 layers · **Tau Ceti: pull request #780 open**

## Tier 2

- **AdelicAlgebraicGroups** — Adelic algebraic groups and arithmetic quotients. Plan 1/1 accepted · package not yet · CN needs 4/6 layers · **Tau Ceti: pull request #792 open** · reviewer recommends approval · move down: ModularCurvesPartII (2)
- **SchemeAndStackFoundations** — Scheme, stack, cohomology and intersection foundations. Plan 3/8 accepted · package not yet · CN needs 6/7 layers · **Tau Ceti: pull request #779 open** · move down: PerfectoidSpaces (1), DeformationAndDerivedPatchingAlgebra (1)
- **SmoothRepresentationsOfLocalGroups** — Smooth representations of local groups. Plan 1/2 accepted · package not yet · CN needs 10/11 layers · **Tau Ceti: pull request #793 open** · reviewer recommends approval · move down: EnhancedDerivedSheaves (1) · cites outside the 94: ExcursionOperatorsAndSpectralAction (3), LanglandsParameterStacks (2)

## Tier 3

- **IntegralHeckeAndGaloisDeterminants** — Integral Hecke actions, determinants and interpolation. Plan 1/1 accepted · package accepted · CN needs 6/7 layers · **Tau Ceti: pull request #789 open** · reviewer recommends approval · move down: ArithmeticGaloisDuality (6), DerivedDeRhamCohomology (6) · cites outside the 94: LanglandsParameterStacks (23)
- **GeometryOfNumbersAndQuadraticArithmetic** — Geometry of numbers, quadratic forms and homogeneous arithmetic. Plan 3/4 accepted · package not yet · CN needs 3/7 layers · move down: ClassicalArithmeticCompletion (1) · cites outside the 94: GeneralAlgebraicKTheory (2)
- **Merged package:** AdicEtaleGeometry + AdicSpacesPartII + DiamondsAndVStacks + PerfectoidSpaces
  - **AdicEtaleGeometry** — Analytic adic geometry required for diamonds. Plan 1/1 accepted · package accepted · CN needs 5/5 layers · **Tau Ceti: pull request #814 open** · reviewer recommends approval · move down: ClassicalAdicEtaleCohomology (2), PerfectoidQuotients (1)
  - **AdicSpacesPartII** — Adic Spaces PartII. Plan 1/1 accepted · package accepted · CN needs 7/8 layers · **Tau Ceti: pull request #817 open** · move down: AlgebraicModuliForArithmeticGeometry (11), ClassicalAdicEtaleCohomology (3), AdicCoefficientsAndComparisons (2), DeformationAndDerivedPatchingAlgebra (1), ModularCurvesPartII (1) · cites outside the 94: TropicalAndBerkovichArithmetic (1)
  - **DiamondsAndVStacks** — Pro-étale descent, diamonds and small v-stacks. Plan 1/1 accepted · package not yet · CN needs 7/7 layers · **Tau Ceti: pull request #820 open** · reviewer recommends approval · cites outside the 94: TropicalAndBerkovichArithmetic (2)
  - **PerfectoidSpaces** — Perfectoid rings and spaces. Plan 1/2 accepted · package not yet · CN needs 9/10 layers · **Tau Ceti: pull request #818 open** · reviewer recommends approval · move down: PerfectoidQuotients (9), PadicHodgeTheory (9), DerivedDeRhamCohomology (7), ClassicalAdicEtaleCohomology (4) · cites outside the 94: TropicalAndBerkovichArithmetic (2)

## Tier 4

- **EnhancedDerivedSheaves** — Enhanced derived categories of sheaves. Plan 2/2 accepted · package not yet · CN needs 7/11 layers · move down: DerivedDeRhamCohomology (11) · cites outside the 94: StableHomotopyKTheory (7)
- **AlgebraicModuliForArithmeticGeometry** — Algebraic moduli and representability for arithmetic geometry. Plan 8/10 accepted · package not yet · CN needs 10/12 layers
- **LocallyAnalyticDistributions** — Locally analytic distributions, growth, and character spaces. Plan 1/2 accepted · package not yet · CN needs 5/5 layers · move down: PadicDifferentialEquationsAndRigidCohomology (1)
- **DiophantineApproximationAndTranscendence** — Diophantine approximation and transcendence. Plan 1/1 accepted · package not yet · CN needs 2/6 layers · move down: ClassicalArithmeticCompletion (1)

## Tier 5

- **ComplexComparisonPartII** — Complex Comparison PartII. Plan 1/1 accepted · package not yet · CN needs 6/7 layers
- **ClassicalArithmeticCompletion** — Classical arithmetic, sequences, polynomials and reciprocity. Plan 1/1 accepted · package not yet · CN needs 3/8 layers · cites outside the 94: ArithmeticDynamics (1), KTheoryLowDegrees (1)

## Tier 6

- **InverseGaloisAndArithmeticFundamentalGroups** — Inverse Galois theory and arithmetic fundamental groups. Plan 1/1 accepted · package not yet · CN needs 3/7 layers · cites outside the 94: InductionRestrictionPartII (14)
- **AbelianSchemesAndArithmeticModuli** — Abelian Schemes And Arithmetic Moduli. Plan 1/1 accepted · package not yet · CN needs 6/7 layers · move down: FiniteFlatGroupsAndIntegralPadicHodgeTheory (3), ArithmeticGaloisRepresentations (1)

## Tier 7

- **ArithmeticGaloisRepresentations** — Arithmetic Galois representations and conductors. Plan 8/8 accepted · package not yet · CN needs 6/7 layers · move down: NeronModelsAndSemistableAbelianVarieties (8), PadicHodgeTheory (7), AutomorphicLFunctionsAndLocalFactors (4), ArithmeticGaloisDuality (1) · cites outside the 94: FunctionFieldArithmetic (1)

## Tier 8

- **Merged package:** ArithmeticGaloisDuality + SelmerIwasawaCohomology
  - **ArithmeticGaloisDuality** — Global Galois duality and compact coefficients. Plan 1/1 accepted · package not yet · CN needs 7/8 layers · cites outside the 94: FunctionFieldArithmetic (11)
  - **SelmerIwasawaCohomology** — Selmer groups, continuous integral cohomology, and Iwasawa cohomology. Plan 1/1 accepted · package not yet · CN needs 3/5 layers · cites outside the 94: IntegralIwasawaTheory (1)
- **NeronModelsAndSemistableAbelianVarieties** — Néron models and semistable abelian varieties. Plan 1/1 accepted · package not yet · CN needs 6/6 layers · move down: PadicHodgeTheory (2) · cites outside the 94: NeronModelsAndSemistableAbelianVarietiesPartII (1)

## Tier 9

- **Merged package:** CrystallineCohomology + DerivedDeRhamCohomology
  - **CrystallineCohomology** — Crystalline cohomology, de Rham–Witt and logarithmic foundations. Plan 2/2 accepted · package not yet · CN needs 8/11 layers · move down: PadicDifferentialEquationsAndRigidCohomology (9), FiniteFlatGroupsAndIntegralPadicHodgeTheory (6), PadicHodgeTheory (4), AInfCohomology (3), LefschetzPencilsAndVanishingCycles (1)
  - **DerivedDeRhamCohomology** — Derived de Rham cohomology and its algebraic foundations. Plan 1/1 accepted · package accepted · CN needs 4/7 layers · move down: PerfectoidQuotients (16), AInfCohomology (3), PadicHodgeTheory (2)
- **HeightsRationalPointsAndObstructions** — Heights, rational points and obstructions. Plan 0/1 accepted · package not yet · CN needs 2/7 layers · move down: NeronModelsAndSemistableAbelianVarieties (5), FaltingsFinitenessAndIsogenyTheorems (2) · cites outside the 94: MordellLawrenceVenkatesh (1)

## Tier 10

- **DeformationAndDerivedPatchingAlgebra** — Commutative algebra for deformation theory and patching. Plan 10/10 accepted · package not yet · CN needs 9/9 layers
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory** — Finite flat group schemes and integral p-adic Hodge theory. Plan 0/1 accepted · package not yet · CN needs 6/6 layers · move down: PadicHodgeTheory (22), PadicDifferentialEquationsAndRigidCohomology (1) · cites outside the 94: VectorBundlesAndIsocrystals (2), PhiGammaModulesAndIwasawaCohomology (2)
- **Merged package:** AdicCoefficientsAndComparisons + ClassicalAdicEtaleCohomology + EtaleDualityAndPerverseSheaves + LefschetzPencilsAndVanishingCycles
  - **AdicCoefficientsAndComparisons** — Adic coefficients and comparison with schemes. Plan 1/1 accepted · package accepted · CN needs 6/7 layers · move down: DiamondSixOperations (13), DiamondEtaleCohomology (12)
  - **ClassicalAdicEtaleCohomology** — The classical analytic cohomology inputs to diamonds. Plan 5/5 accepted · package not yet · CN needs 10/10 layers · cites outside the 94: TropicalAndBerkovichArithmetic (20)
  - **EtaleDualityAndPerverseSheaves** — Étale duality, cycle classes and perverse sheaves. Plan 1/2 accepted · package not yet · CN needs 13/13 layers · move down: DeligneWeightsAndPurity (15)
  - **LefschetzPencilsAndVanishingCycles** — Lefschetz pencils, nearby cycles and vanishing cycles. Plan 2/2 accepted · package not yet · CN needs 9/10 layers · move down: DeligneWeightsAndPurity (13), IgusaVarietiesAndTorsionConcentration (2) · cites outside the 94: FunctionFieldArithmetic (2)

## Tier 11

- **Merged package:** ArithmeticLocallySymmetricSpaces + AutomorphicFormsOnReductiveGroups
  - **ArithmeticLocallySymmetricSpaces** — Arithmetic locally symmetric spaces and their cohomology. Plan 1/1 accepted · package not yet · CN needs 8/8 layers · move down: AutomorphicSpectralTheory (5), CompletedCohomologyPartII (3), AutomorphicGaloisRepresentationsPartII (3) · cites outside the 94: AdditiveCombinatorics (2)
  - **AutomorphicFormsOnReductiveGroups** — Automorphic forms on reductive groups. Plan 0/1 accepted · package not yet · CN needs 6/7 layers · move down: ShimuraData (5), AutomorphicLFunctionsAndLocalFactors (2), AutomorphicSpectralTheory (2), ModularCurvesPartII (1)
- **ModularCurvesPartII** — Modular Curves PartII. Plan 1/3 accepted · package not yet · CN needs 20/20 layers · move down: EtaleDualityAndPerverseSheaves (9), WeightsInEtaleCohomology (1)
- **DiamondEtaleCohomology** — Étale cohomology of diamonds and its four operations. Plan 2/2 accepted · package accepted · CN needs 10/10 layers · cites outside the 94: SchemeKTheoryOperations (1)
- **DeligneWeightsAndPurity** — Deligne weights, purity and the Weil bounds. Plan 2/2 accepted · package not yet · CN needs 10/11 layers · cites outside the 94: WeilConjectures (10), FunctionFieldArithmetic (3)

## Tier 12

- **AutomorphicLFunctionsAndLocalFactors** — Automorphic L-functions and local factors. Plan 1/1 accepted · package not yet · CN needs 4/6 layers · move down: ModularSymbolsPadicLFunctions (4), AutomorphicGaloisRepresentations (2), AnalyticNumberTheory (1) · cites outside the 94: GlobalShtukasAndFunctionFieldLanglands (6), FunctionFieldArithmetic (4)
- **ShimuraData** — Shimura data, Hermitian domains, and adelic level structures. Plan 0/1 accepted · package not yet · CN needs 6/6 layers · cites outside the 94: ComplexMultiplicationAndExplicitReciprocity (1)
- **AlgebraicModularFormsAndSerreWeights** — Algebraic modular forms, reduction and Serre weights. Plan 1/1 accepted · package accepted · CN needs 6/6 layers · move down: AutomorphicGaloisRepresentations (8), AutomorphicBundles (1)
- **CompletedCohomologyPartII** — Completed cohomology, homology and arithmetic towers — Part II. Plan 1/1 accepted · package not yet · CN needs 9/9 layers · move down: EtaleDualityAndPerverseSheaves (2), ShimuraVarieties (1), HilbertModularVarietiesAndShimuraCurves (1)
- **WeightsInEtaleCohomology** — Weights and purity in étale cohomology. Plan 1/1 accepted · package accepted · CN needs 3/6 layers · move down: AutomorphicGaloisRepresentations (8), PotentialModularityAndCompatibleSystems (4), HilbertModularVarietiesAndShimuraCurves (3), CohomologyComparisons (2), PadicHodgeTheory (1) · cites outside the 94: GeneralizedHeegnerCycles (1)
- **PadicDifferentialEquationsAndRigidCohomology** — P-adic differential equations, rigid cohomology and p-adic weights. Plan 0/1 accepted · package not yet · CN needs 3/8 layers · move down: PadicHodgeTheory (1) · cites outside the 94: WeilConjectures (1)
- **DiamondSixOperations** — Six operations, cohomological smoothness and biduality. Plan 1/1 accepted · package not yet · CN needs 6/7 layers

## Tier 13

- **AutomorphicSpectralTheory** — Automorphic spectral theory and trace distributions. Plan 1/1 accepted · package not yet · CN needs 7/7 layers · move down: EndoscopicTransferAndUnitaryTraceComparison (3) · cites outside the 94: QSeriesPartitionsAndMockModularForms (13), EllipticRegulators (3)
- **Merged package:** AInfCohomology + PadicHodgeTheory + PerfectoidQuotients + PrismaticCohomology
  - **AInfCohomology** — Integral A_inf cohomology and Breuil–Kisin–Fargues structures. Plan 2/2 accepted · package not yet · CN needs 9/10 layers · move down: CohomologyComparisons (7) · cites outside the 94: RefinedTraceMethods (7)
  - **PadicHodgeTheory** — P-adic Hodge theory and geometric comparison. Plan 0/2 accepted · package not yet · CN needs 9/10 layers · move down: CohomologyComparisons (10), AutomorphicGaloisRepresentations (6), GL2AutomorphicRepresentationsAndTransfer (2), HilbertModularVarietiesAndShimuraCurves (1) · cites outside the 94: PhiGammaModulesAndIwasawaCohomology (33)
  - **PerfectoidQuotients** — Perfectoid quotients and their prismatic prerequisites. Plan 1/1 accepted · package accepted · CN needs 7/7 layers
  - **PrismaticCohomology** — Prismatic cohomology: relative, absolute, Nygaard and log variants. Plan 2/2 accepted · package not yet · CN needs 3/9 layers · move down: HodgeTateAndCanonicalSubgroups (1) · cites outside the 94: LanglandsParameterStacks (10), RefinedTraceMethods (4), QWittVectors (4), VectorBundlesAndIsocrystals (2)
- **Merged package:** PELModuli + ShimuraVarieties
  - **PELModuli** — Siegel and PEL moduli problems. Plan 1/1 accepted · package not yet · CN needs 6/7 layers · move down: HilbertModularVarietiesAndShimuraCurves (2), ShimuraCompactifications (1)
  - **ShimuraVarieties** — Complex Shimura varieties and canonical models. Plan 2/2 accepted · package not yet · CN needs 8/10 layers · move down: ShimuraCompactifications (1) · cites outside the 94: ComplexMultiplicationAndExplicitReciprocity (5)

## Tier 14

- **CohomologyComparisons** — Cohomology comparisons: integral diagrams and rational period realizations. Plan 1/1 accepted · package not yet · CN needs 4/7 layers · move down: HodgeTateAndCanonicalSubgroups (3), PerfectoidShimuraVarieties (2) · cites outside the 94: RefinedTraceMethods (1)
- **Merged package:** AnalyticNumberTheory + ArithmeticStatistics
  - **AnalyticNumberTheory** — Analytic number theory, zeta functions and prime distribution. Plan 2/2 accepted · package not yet · CN needs 5/10 layers · cites outside the 94: LogicAndDefinabilityInNumberTheory (1), ProbabilisticAndMetricNumberTheory (1)
  - **ArithmeticStatistics** — Arithmetic statistics, counting fields and Selmer distributions. Plan 7/7 accepted · package not yet · CN needs 3/6 layers · move down: PELModuli (1) · cites outside the 94: AbelianSchemesAndArithmeticModuliPartII (15), InductionRestrictionPartII (12), JacobianChallengePartII (7), ComplexMultiplicationAndExplicitReciprocity (4) …
- **HilbertModularVarietiesAndShimuraCurves** — Hilbert Modular Varieties And Shimura Curves. Plan 2/2 accepted · package not yet · CN needs 12/13 layers · move down: GL2AutomorphicRepresentationsAndTransfer (12), AutomorphicBundles (5), ShimuraCompactifications (5), AutomorphicGaloisRepresentations (2), ArakelovGeometryAndAbelianHeights (1) · cites outside the 94: AbelianSchemesAndArithmeticModuliPartII (2)
- **FarguesFontaineDiamonds** — The existing Fargues–Fontaine curve as a diamond. Plan 1/1 accepted · package accepted · CN needs 4/6 layers
- **EndoscopicTransferAndUnitaryTraceComparison** — Endoscopic transfer and unitary trace comparison. No plan yet · package not yet · CN needs 11/15 layers · move down: IgusaVarietiesAndTorsionConcentration (2), AutomorphicGaloisRepresentationsPartII (2) · cites outside the 94: HeckeStacksAndLocalShtukas (1)

## Tier 15

- **Merged package:** ColemanIntegration + ComputationalNumberTheory + DirichletPadicLFunctions
  - **ColemanIntegration** — Coleman integration and noncritical Dirichlet L-values. Plan 1/1 accepted · package not yet · CN needs 2/4 layers · cites outside the 94: Polylogarithms (11), BorelRegulators (2)
  - **ComputationalNumberTheory** — Certified computational number theory and arithmetic data. Plan 1/1 accepted · package not yet · CN needs 3/6 layers
  - **DirichletPadicLFunctions** — Dirichlet p-adic L-functions, special values, and Eisenstein measures. Plan 6/6 accepted · package not yet · CN needs 5/6 layers · cites outside the 94: QSeriesPartitionsAndMockModularForms (4), IntegralIwasawaTheory (2), StableHomotopyKTheory (1)
- **Merged package:** GlobalGaloisDeformations + LocalGaloisDeformationRings
  - **GlobalGaloisDeformations** — Global Galois deformation rings. Plan 1/1 accepted · package not yet · CN needs 6/8 layers
  - **LocalGaloisDeformationRings** — Local Galois deformation rings and their components. Plan 1/1 accepted · package not yet · CN needs 7/8 layers · cites outside the 94: PadicLocalLanglandsForGL2Qp (1)
- **Merged package:** AutomorphicBundles + ShimuraCompactifications
  - **AutomorphicBundles** — Automorphic bundles and classical automorphic forms. Plan 2/2 accepted · package not yet · CN needs 4/9 layers · move down: HodgeTateAndCanonicalSubgroups (3)
  - **ShimuraCompactifications** — Toroidal compactifications and boundary geometry. Plan 1/2 accepted · package not yet · CN needs 7/9 layers · move down: HodgeTateAndCanonicalSubgroups (2), AutomorphicGaloisRepresentationsPartII (1)
- **GL2AutomorphicRepresentationsAndTransfer** — GL₂ Automorphic Representations And Transfer. Plan 2/2 accepted · package not yet · CN needs 12/12 layers · move down: AutomorphicGaloisRepresentations (4) · cites outside the 94: MetaplecticAutomorphicForms (1)

## Tier 16

- **Merged package:** ModularSymbolsPadicLFunctions + PadicFamilies
  - **ModularSymbolsPadicLFunctions** — Modular symbols and analytic p-adic L-functions of modular forms. Plan 1/1 accepted · package not yet · CN needs 2/5 layers
  - **PadicFamilies** — Hida and Coleman families, period modules, and family L-functions. Plan 0/1 accepted · package not yet · CN needs 4/8 layers · move down: OrdinaryAutomorphicFormsAndModularityLifting (6), AutomorphicGaloisRepresentations (1), GL2AutomorphicRepresentationsAndTransfer (1) · cites outside the 94: KatoEulerSystems (1), NoncommutativeAndEquivariantIwasawa (1)
- **ArakelovGeometryAndAbelianHeights** — Arakelov geometry and heights of abelian varieties. No plan yet · package not yet · CN needs 6/6 layers
- **AnabelianGeometryAndNonabelianChabauty** — Anabelian geometry and nonabelian Chabauty. Plan 6/8 accepted · package not yet · CN needs 5/7 layers · move down: EffectiveDiophantineMethods (6) · cites outside the 94: MotivesAndAlgebraicCycles (11), StableReductionPartII (3), JacobianChallengePartII (3), FunctionFieldArithmetic (2)
- **HodgeTateAndCanonicalSubgroups** — Hodge–Tate theory, canonical subgroups, and automorphic period maps. Plan 2/2 accepted · package not yet · CN needs 5/9 layers · move down: PerfectoidShimuraVarieties (5) · cites outside the 94: OverconvergentAutomorphicForms (1)

## Tier 17

- **EffectiveDiophantineMethods** — Effective Diophantine methods and certified rational points. Plan 0/1 accepted · package not yet · CN needs 7/7 layers · cites outside the 94: ComplexMultiplicationAndExplicitReciprocity (4), GrossZagierAndArithmeticHeights (3), JacobianChallengePartII (2), HeegnerPointEulerSystems (2)
- **PerfectoidShimuraVarieties** — Shimura towers and perfectoid representability. Plan 0/1 accepted · package not yet · CN needs 5/8 layers · move down: TorsionCohomologyInfrastructure (7)
- **FaltingsFinitenessAndIsogenyTheorems** — Faltings finiteness, semisimplicity and isogeny theorems. Plan 1/1 accepted · package not yet · CN needs 6/6 layers · cites outside the 94: MordellLawrenceVenkatesh (4)
- **AutomorphicGaloisRepresentationsPartII** — Automorphic Galois Representations PartII. Plan 2/2 accepted · package accepted · CN needs 9/10 layers · move down: PotentialModularityAndCompatibleSystems (9), IgusaVarietiesAndTorsionConcentration (7), AutomorphicGaloisRepresentations (5), ModularityAndLanglandsExtensions (3) · cites outside the 94: AbelianSchemesAndArithmeticModuliPartII (1), HeckeStacksAndLocalShtukas (1)

## Tier 18

- **TorsionCohomologyInfrastructure** — Reusable infrastructure for torsion in arithmetic cohomology. No plan yet · package not yet · CN needs 5/5 layers
- **AutomorphicGaloisRepresentations** — Galois representations attached to modular and Hilbert modular forms. Plan 1/1 accepted · package not yet · CN needs 6/6 layers · move down: OrdinaryAutomorphicFormsAndModularityLifting (7), PotentialModularityAndCompatibleSystems (4), SerreWeightAndLevelOptimisation (3) · cites outside the 94: GeneralizedHeegnerCycles (2)

## Tier 19

- **IgusaVarietiesAndTorsionConcentration** — Igusa varieties, compactified period fibers and torsion concentration. Plan 1/1 accepted · package not yet · CN needs 8/8 layers · cites outside the 94: BunGAndNewtonStrata (29), VectorBundlesAndIsocrystals (16), ExcursionOperatorsAndSpectralAction (9), HeckeStacksAndLocalShtukas (5) …
- **SerreWeightAndLevelOptimisation** — Weight and level optimisation of residual modular representations. Plan 0/1 accepted · package not yet · CN needs 6/6 layers · move down: EllipticCurveModularity (1)

## Tier 20

- **OrdinaryAutomorphicFormsAndModularityLifting** — Ordinary automorphic forms and ordinary modularity lifting. Plan 0/1 accepted · package not yet · CN needs 6/6 layers · cites outside the 94: PhiGammaModulesAndIwasawaCohomology (3)

## Tier 21

- **GL2ModularityLifting** — GL₂ Modularity Lifting. Plan 1/2 accepted · package not yet · CN needs 6/12 layers · move down: PotentialModularityAndCompatibleSystems (8) · cites outside the 94: CompletedCohomologyAndLocalGlobalCompatibility (14), PadicLocalLanglandsForGL2Qp (6)

## Tier 22

- **PotentialModularityAndCompatibleSystems** — Potential Modularity And Compatible Systems. Plan 2/2 accepted · package not yet · CN needs 13/13 layers

## Tier 23

- **PotentialAutomorphyInfrastructure** — Reusable infrastructure for potential automorphy over CM fields. Plan 1/1 accepted · package not yet · CN needs 5/6 layers · cites outside the 94: PotentialAutomorphyInfrastructurePartII (2)
- **SmallRamificationAndAbelianVarietyBaseCases** — Small ramification and the base cases for Serre modularity. Plan 1/1 accepted · package not yet · CN needs 6/6 layers

## Tier 24

- **ClassicalSerreModularity** — Classical Serre Modularity. Plan 3/3 accepted · package not yet · CN needs 12/18 layers

## Tier 25

- **EllipticCurveModularity** — Modularity and modular parametrisations of elliptic curves over Q. Plan 1/1 accepted · package not yet · CN needs 6/6 layers

## Tier 26

- **ModularityAndLanglandsExtensions** — Modularity, automorphy and Langlands endpoint extensions. Plan 1/1 accepted · package not yet · CN needs 6/6 layers · cites outside the 94: PotentialAutomorphyInfrastructurePartII (31), MetaplecticAutomorphicForms (2), ExcursionOperatorsAndSpectralAction (1)

## Tier 27

- **CrystallineLocalGlobalCompatibilityCM** — Reusable infrastructure for potential automorphy over CM fields, Part II: P-ordinary degree shifting, crystalline local–global compatibility and Barsotti–Tate lifting. Plan 1/1 accepted · package not yet · CN needs 10/10 layers

## Tier 28

- **EllipticCurveModularityImaginaryQuadratic** — Modularity of elliptic curves, Part II: imaginary quadratic fields. Plan 1/1 accepted · package not yet · CN needs 8/8 layers

