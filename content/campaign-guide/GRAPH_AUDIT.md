# Dependency coverage and architectural components

**Successor edition:** use revision/GRAPH_VALIDATION.json and [AI_EXECUTION.md](AI_EXECUTION.md) for the enlarged campaign. The Round02 audit explanation below is historical context.

<!-- campaign-edition: 2026-09-14-round02-repair -->

Machine audit of declared stages and encoded prerequisites; not proof completeness.

1079 declared stages; 1079 normalized rows; 0 stage-level cyclic components.

## Area-level strongly connected components

These identify mutually staged development, not mathematical circularity. Early/late cuts in the stage graph must remain intact.

- AInfCohomology, AbelianSchemesAndArithmeticModuli, AdelicAlgebraicGroups, AdicCoefficientsAndComparisons, AdicEtaleGeometry, AdicSpacesPartII, AlgebraicModularFormsAndSerreWeights, AlgebraicModuliForArithmeticGeometry, ArakelovGeometryAndAbelianHeights, ArithmeticGaloisDuality, ArithmeticGaloisRepresentations, ArithmeticKTheory, ArithmeticLocallySymmetricSpaces, AutomorphicBundles, AutomorphicCongruences, AutomorphicFormsOnReductiveGroups, AutomorphicGaloisRepresentations, AutomorphicGaloisRepresentationsPartII, AutomorphicLFunctionsAndLocalFactors, AutomorphicPadicLFunctions, AutomorphicSpectralTheory, BorelRegulators, BunGAndNewtonStrata, ClassicalAdicEtaleCohomology, ClassicalSerreModularity, CohomologyComparisons, ColemanIntegration, ColemanPowerSeries, CompletedCohomologyAndLocalGlobalCompatibility, CompletedCohomologyPartII, ComplexComparisonPartII, CrystallineCohomology, DeligneWeightsAndPurity, DerivedDeRhamCohomology, DiamondEtaleCohomology, DiamondSixOperations, DiamondsAndVStacks, DirichletPadicLFunctions, EllipticCurveModularity, EllipticKTheory, EllipticRegulators, EndoscopicTransferAndUnitaryTraceComparison, EnhancedDerivedSheaves, EtaleDualityAndPerverseSheaves, EulerSystemsAndKolyvaginSystems, EulerSystemsCyclotomicMainConjecture, ExcursionOperatorsAndSpectralAction, FaltingsFinitenessAndIsogenyTheorems, FarguesFontaineDiamonds, FiniteFlatGroupsAndIntegralPadicHodgeTheory, GL2AutomorphicRepresentationsAndTransfer, GL2ModularityLifting, GeneralAlgebraicKTheory, GeneralizedHeegnerCycles, GeometricSatakeAndFusion, GlobalGaloisDeformations, GrossZagierAndArithmeticHeights, HabiroCohomologyFoundations, HabiroNumberFields, HabiroRings, HeckeStacksAndLocalShtukas, HeegnerPointEulerSystems, HilbertModularVarietiesAndShimuraCurves, HodgeTateAndCanonicalSubgroups, IgusaVarietiesAndTorsionConcentration, IntegralHeckeAndGaloisDeterminants, IntegralIwasawaTheory, K2SymbolsBrauer, K3BlochGroups, KTheoryFiniteLocalFields, KTheoryLowDegrees, KatoEulerSystems, LanglandsParameterStacks, LefschetzPencilsAndVanishingCycles, LocalGaloisDeformationRings, MetaplecticAutomorphicForms, ModularCurvesPartII, ModularIwasawaMainConjectures, ModularSymbolsPadicLFunctions, MotivicEtaleKTheory, NeronModelsAndSemistableAbelianVarieties, OrdinaryAutomorphicFormsAndModularityLifting, PELModuli, PadicFamilies, PadicHodgeRegulators, PadicHodgeTheory, PadicLocalLanglandsForGL2Qp, PerfectoidQuotients, PerfectoidShimuraVarieties, PerfectoidSpaces, PhiGammaModulesAndIwasawaCohomology, Polylogarithms, PotentialModularityAndCompatibleSystems, PrismaticCohomology, RankZeroOneBSD, ReductiveGroupsPartII, RefinedTraceMethods, RelativeFarguesFontaine, SchemeKTheoryOperations, SelmerIwasawaCohomology, SerreWeightAndLevelOptimisation, ShimuraCompactifications, ShimuraData, ShimuraVarieties, SmallRamificationAndAbelianVarietyBaseCases, SmoothRepresentationsOfLocalGroups, SpecialValuesBirchTate, StableHomotopyKTheory, TorsionCohomologyInfrastructure, VStackSheavesAndLisseCategories, VectorBundlesAndIsocrystals, WeightsInEtaleCohomology, WeilConjectures

## Per-area encoded coverage

| Area | Declared stages | Producer rows | Incoming edges | Internal edges |
| --- | ---: | ---: | ---: | ---: |
| AInfCohomology | 10 | 10 | 25 | 10 |
| AbelianSchemesAndArithmeticModuli | 7 | 7 | 34 | 6 |
| AdelicAlgebraicGroups | 6 | 6 | 17 | 9 |
| AdicCoefficientsAndComparisons | 7 | 7 | 20 | 7 |
| AdicEtaleGeometry | 5 | 5 | 27 | 4 |
| AdicSpacesPartII | 8 | 8 | 37 | 10 |
| AlgebraicModularFormsAndSerreWeights | 6 | 6 | 10 | 5 |
| AlgebraicModuliForArithmeticGeometry | 12 | 12 | 33 | 14 |
| ArakelovGeometryAndAbelianHeights | 6 | 6 | 8 | 5 |
| ArithmeticGaloisDuality | 8 | 8 | 55 | 9 |
| ArithmeticGaloisRepresentations | 7 | 7 | 31 | 9 |
| ArithmeticKTheory | 12 | 12 | 41 | 21 |
| ArithmeticLocallySymmetricSpaces | 8 | 8 | 22 | 11 |
| AutomorphicBundles | 9 | 9 | 21 | 10 |
| AutomorphicCongruences | 10 | 10 | 18 | 10 |
| AutomorphicFormsOnReductiveGroups | 7 | 7 | 19 | 7 |
| AutomorphicGaloisRepresentations | 6 | 6 | 18 | 5 |
| AutomorphicGaloisRepresentationsPartII | 10 | 10 | 19 | 14 |
| AutomorphicLFunctionsAndLocalFactors | 6 | 6 | 25 | 7 |
| AutomorphicPadicLFunctions | 9 | 9 | 23 | 8 |
| AutomorphicSpectralTheory | 7 | 7 | 17 | 7 |
| BorelRegulators | 10 | 10 | 22 | 14 |
| BunGAndNewtonStrata | 7 | 7 | 18 | 9 |
| ClassicalAdicEtaleCohomology | 10 | 10 | 37 | 18 |
| ClassicalSerreModularity | 18 | 18 | 18 | 17 |
| CohomologyComparisons | 7 | 7 | 17 | 9 |
| ColemanIntegration | 4 | 4 | 4 | 3 |
| ColemanPowerSeries | 5 | 5 | 7 | 4 |
| CompletedCohomologyAndLocalGlobalCompatibility | 6 | 6 | 6 | 5 |
| CompletedCohomologyPartII | 9 | 9 | 23 | 11 |
| ComplexComparisonPartII | 7 | 7 | 14 | 7 |
| CrystallineCohomology | 11 | 11 | 40 | 16 |
| DeformationAndDerivedPatchingAlgebra | 9 | 9 | 22 | 11 |
| DeligneWeightsAndPurity | 11 | 11 | 35 | 18 |
| DerivedDeRhamCohomology | 7 | 7 | 33 | 8 |
| DiamondEtaleCohomology | 10 | 10 | 25 | 14 |
| DiamondSixOperations | 7 | 7 | 32 | 6 |
| DiamondsAndVStacks | 7 | 7 | 51 | 11 |
| DirichletPadicLFunctions | 6 | 6 | 23 | 5 |
| EllipticCurveModularity | 6 | 6 | 10 | 5 |
| EllipticKTheory | 11 | 11 | 31 | 17 |
| EllipticRegulators | 14 | 14 | 20 | 18 |
| EndoscopicTransferAndUnitaryTraceComparison | 15 | 15 | 38 | 21 |
| EnhancedDerivedSheaves | 11 | 11 | 86 | 20 |
| EtaleDualityAndPerverseSheaves | 13 | 13 | 78 | 23 |
| EulerSystemsAndKolyvaginSystems | 9 | 9 | 21 | 8 |
| EulerSystemsCyclotomicMainConjecture | 5 | 5 | 6 | 4 |
| ExcursionOperatorsAndSpectralAction | 17 | 17 | 35 | 32 |
| FaltingsFinitenessAndIsogenyTheorems | 6 | 6 | 7 | 5 |
| FarguesFontaineDiamonds | 6 | 6 | 10 | 5 |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | 6 | 6 | 24 | 5 |
| GL2AutomorphicRepresentationsAndTransfer | 12 | 12 | 26 | 13 |
| GL2ModularityLifting | 12 | 12 | 16 | 11 |
| GeneralAlgebraicKTheory | 15 | 15 | 49 | 23 |
| GeneralizedHeegnerCycles | 9 | 9 | 10 | 8 |
| GeometricSatakeAndFusion | 14 | 14 | 35 | 24 |
| GlobalGaloisDeformations | 8 | 8 | 13 | 7 |
| GrossZagierAndArithmeticHeights | 10 | 10 | 24 | 12 |
| HabiroCohomologyFoundations | 9 | 9 | 18 | 14 |
| HabiroCyclotomicCompletions | 6 | 6 | 10 | 5 |
| HabiroNahmSeries | 11 | 11 | 15 | 15 |
| HabiroNumberFields | 7 | 7 | 15 | 9 |
| HabiroRings | 8 | 8 | 11 | 8 |
| HeckeStacksAndLocalShtukas | 5 | 5 | 16 | 5 |
| HeegnerPointEulerSystems | 12 | 12 | 29 | 14 |
| HilbertModularVarietiesAndShimuraCurves | 13 | 13 | 30 | 13 |
| HodgeTateAndCanonicalSubgroups | 9 | 9 | 20 | 8 |
| IgusaVarietiesAndTorsionConcentration | 8 | 8 | 13 | 8 |
| IntegralHeckeAndGaloisDeterminants | 7 | 7 | 18 | 9 |
| IntegralIwasawaTheory | 20 | 20 | 45 | 31 |
| K2SymbolsBrauer | 14 | 14 | 35 | 21 |
| K3BlochGroups | 7 | 7 | 21 | 9 |
| KTheoryFiniteLocalFields | 10 | 10 | 23 | 15 |
| KTheoryLowDegrees | 15 | 15 | 36 | 20 |
| KatoEulerSystems | 5 | 5 | 11 | 4 |
| LanglandsParameterStacks | 8 | 8 | 24 | 14 |
| LefschetzPencilsAndVanishingCycles | 10 | 10 | 49 | 17 |
| LocalGaloisDeformationRings | 8 | 8 | 14 | 7 |
| LocallyAnalyticDistributions | 5 | 5 | 19 | 4 |
| MetaplecticAutomorphicForms | 9 | 9 | 11 | 8 |
| ModularCurvesPartII | 20 | 20 | 48 | 25 |
| ModularIwasawaMainConjectures | 7 | 7 | 14 | 9 |
| ModularSymbolsPadicLFunctions | 5 | 5 | 11 | 4 |
| MotivicEtaleKTheory | 21 | 21 | 70 | 35 |
| NeronModelsAndSemistableAbelianVarieties | 6 | 6 | 17 | 5 |
| OrdinaryAutomorphicFormsAndModularityLifting | 6 | 6 | 11 | 5 |
| OverconvergentAutomorphicForms | 9 | 9 | 8 | 8 |
| PELModuli | 7 | 7 | 24 | 7 |
| PadicFamilies | 8 | 8 | 24 | 8 |
| PadicHodgeRegulators | 11 | 11 | 32 | 13 |
| PadicHodgeTheory | 10 | 10 | 34 | 11 |
| PadicLocalLanglandsForGL2Qp | 6 | 6 | 7 | 5 |
| PadicMeasuresIwasawaAlgebras | 8 | 8 | 44 | 9 |
| PerfectoidQuotients | 7 | 7 | 16 | 8 |
| PerfectoidShimuraVarieties | 8 | 8 | 15 | 9 |
| PerfectoidSpaces | 10 | 10 | 65 | 17 |
| PhiGammaModulesAndIwasawaCohomology | 8 | 8 | 16 | 7 |
| Polylogarithms | 8 | 8 | 22 | 11 |
| PotentialAutomorphyInfrastructure | 6 | 6 | 4 | 4 |
| PotentialModularityAndCompatibleSystems | 13 | 13 | 16 | 11 |
| PrismaticCohomology | 9 | 9 | 23 | 10 |
| RankZeroOneBSD | 12 | 12 | 18 | 15 |
| ReductiveGroupsPartII | 7 | 7 | 25 | 5 |
| RefinedTraceMethods | 11 | 11 | 26 | 17 |
| RelativeFarguesFontaine | 11 | 11 | 37 | 16 |
| SchemeKTheoryOperations | 10 | 10 | 30 | 16 |
| SelmerIwasawaCohomology | 5 | 5 | 31 | 4 |
| SerreWeightAndLevelOptimisation | 6 | 6 | 10 | 5 |
| ShimuraCompactifications | 9 | 9 | 28 | 11 |
| ShimuraData | 6 | 6 | 13 | 6 |
| ShimuraVarieties | 10 | 10 | 26 | 11 |
| SmallRamificationAndAbelianVarietyBaseCases | 6 | 6 | 8 | 5 |
| SmoothRepresentationsOfLocalGroups | 11 | 11 | 42 | 10 |
| SpecialValuesBirchTate | 13 | 13 | 17 | 16 |
| StableHomotopyKTheory | 12 | 12 | 65 | 18 |
| TorsionCohomologyInfrastructure | 5 | 5 | 5 | 4 |
| VStackSheavesAndLisseCategories | 6 | 6 | 32 | 8 |
| VectorBundlesAndIsocrystals | 10 | 10 | 29 | 20 |
| WeightsInEtaleCohomology | 6 | 6 | 8 | 1 |
| WeilConjectures | 8 | 8 | 11 | 10 |

All individual stage endpoints, residual stages without producer rows, external contracts, aliases and errors are in the JSON audit. A stage without a producer row may be an independent definition or an unencoded substage; it is not silently certified dependency-free.
