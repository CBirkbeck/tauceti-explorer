# Implementation order and parallel work

Use the queue for exact stage dependencies and [the protocol](AI_EXECUTION.md) for readiness. Its 1,312 rows are preparation targets. Navigation depth orders the **encoded** graph; it does not make external imports available or certify that all mathematical prerequisites have been discovered.

## Initial integration work

1. Start [FoundationsAndLibraryIntegration LI.0](../campaign/FoundationsAndLibraryIntegration/README.md): pin the actual library, search reusable declarations and record what exists versus what is only planned.
2. Resolve external contracts. Each has an integration owner. Read the pinned supplier statement, verify its proof, or make the missing construction a task there.
3. Reconcile the preserved area dependencies with exact theorem contracts. An area-level link without a stage link is a remaining preparation obligation.
4. Prepare several concrete early examples in parallel. Agree their shared carriers and normalization maps before implementation.

## Parallel mathematical tracks

| Track | Early preparation | Later consumers |
| --- | --- | --- |
| Classical and computational | [Classical arithmetic](../campaign/ClassicalArithmeticCompletion/README.md), [geometry of numbers](../campaign/GeometryOfNumbersAndQuadraticArithmetic/README.md), [finite fields](../campaign/FiniteFieldsAndCharacterSums/README.md) | [Certified computation](../campaign/ComputationalNumberTheory/README.md), integral modules, local fields |
| Analytic and combinatorial | [Analytic number theory](../campaign/AnalyticNumberTheory/README.md), [sieves](../campaign/SieveMethodsAndPrimePatterns/README.md) | [Circle method](../campaign/ExponentialSumsAndCircleMethod/README.md), [additive combinatorics](../campaign/AdditiveCombinatorics/README.md), [metric/probabilistic theory](../campaign/ProbabilisticAndMetricNumberTheory/README.md) |
| Geometry and cohomology | [Schemes and stacks](../campaign/SchemeAndStackFoundations/README.md), existing descent and sheaf owners | Abelian/Shimura geometry, integral and étale comparisons, [weights](../campaign/DeligneWeightsAndPurity/README.md), [Weil conjectures](../campaign/WeilConjectures/README.md) |
| Diophantine | [Heights and rational points](../campaign/HeightsRationalPointsAndObstructions/README.md), [approximation/transcendence](../campaign/DiophantineApproximationAndTranscendence/README.md) | [Effective methods](../campaign/EffectiveDiophantineMethods/README.md), [statistics](../campaign/ArithmeticStatistics/README.md), [dynamics](../campaign/ArithmeticDynamics/README.md), [nonabelian Chabauty](../campaign/AnabelianGeometryAndNonabelianChabauty/README.md) |
| Motives and special values | Existing stable/exact K-theory and cycle constructions, [motives](../campaign/MotivesAndAlgebraicCycles/README.md) | Regulators, [periods/MZVs](../campaign/PeriodsAndSpecialValues/README.md), Euler systems, Iwasawa and BSD in proved ranges |
| Global function fields | [Function-field arithmetic](../campaign/FunctionFieldArithmetic/README.md), [Drinfeld modules](../campaign/DrinfeldModulesAndTModules/README.md) | [Shtukas and Langlands](../campaign/GlobalShtukasAndFunctionFieldLanglands/README.md), [higher local fields](../campaign/HigherLocalFieldsAndHigherClassFieldTheory/README.md) |
| Automorphic and Langlands | Existing reductive groups, local representations, local factors and spectral theory | Torsion, potential automorphy, [Langlands endpoints](../campaign/ModularityAndLanglandsExtensions/README.md), diamonds and spectral action |
| Arithmetic interfaces | [Logic](../campaign/LogicAndDefinabilityInNumberTheory/README.md), [q-series/mock forms](../campaign/QSeriesPartitionsAndMockModularForms/README.md), [quantum topology](../campaign/ArithmeticQuantumTopology/README.md) | Motivic integration, o-minimal applications, moonshine, Habiro comparisons |

These tracks overlap by exact stage contracts. Do not wait for an entire large area to finish if a consumer needs only its early proved output. Do not dispatch every later stage in a row merely because its subject is familiar.

## Dispatch and checkpoints

A source worker may prepare any stage while proofs are pending. A proof worker may take a leaf only after all its prerequisite declarations are built on the current target pin. [The worker brief](WORKER_BRIEF.md) is a reusable assignment template.

For each handoff, record an actual producer declaration and an actual consumer signature in the contract register. Their bases, coefficients, hypotheses, variance, shifts and normalizations must match or have a proved conversion. Check an example in the final consumer before closing the handoff.

Close a subject only after every promised construction and theorem in its roadmap has closed leaves, with conjectural statements retained separately. A miscellaneous classification code admits new topics; it does not certify an unlimited future subject as complete.
