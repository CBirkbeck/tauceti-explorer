# Enhanced derived categories of sheaves

An ordinary derived category remembers cohomology, shifts and distinguished
triangles, but not the homotopies between maps or the coherences among those
homotopies. Descent along hypercovers, inverse limits of complexes, Kan
extensions along diagrams of topoi, adjoints of colimit-preserving functors and
the reconstruction of adic coefficient systems all need that higher structure.
This roadmap gives unbounded derived categories of sheaves a concrete
enhancement, compares it with the derived categories Mathlib already has, and
builds in that enhancement the operations later roadmaps use: derived tensor
and internal Hom on ringed sites, coherent inverse limits and Postnikov
completion, hypercover descent, coherent Kan extensions and adjoints,
accessible localizations, derived completion and the reconstruction of
complete complexes from their reductions modulo powers of an ideal. Its last
layer adds the shared monoidal, presentable and animated structures that the
K-theory, trace and geometric Langlands roadmaps consume: symmetric monoidal
∞-categories and ∞-operads, algebra and module objects, descendable algebras,
Ind-completion, presentable, dualizable and rigid categories, coherent group
actions, and animated commutative rings.

The enhancement is the dg nerve of a K-injective model, inside quasicategories.
Every comparison with an ordinary category is a theorem about mapping spaces,
never a definition by passage to the homotopy category.

The plan is at target level. It has 169 declarations (65 theorems, 43 constructions, 24 lemmas, 28 definitions, 9 comparisons) in eleven
layers, with 290 API items, 227 unit tests and 49 planets.
Every layer is planned: each target is a declaration whose prerequisite chains
end in the pinned libraries, in a Tau Ceti roadmap layer, in a declaration or
layer of another atlas roadmap, in one of the 11 requests or in one of the
16 named gaps of this document. No layer is closed, and nothing is
implemented. The companion packets `EnhancedDerivedSheaves--E0.json` (layers
E0–E4, 125 declarations) and `EnhancedDerivedSheaves--E5.json` (layer E5 and
its five sub-layers, 44 declarations) record the same declarations, and the
suggested file `EnhancedDerivedSheaves.lean` prototypes their signatures.

Throughout, an identifier such as `E2/tower-milnor` abbreviates
`EnhancedDerivedSheaves:E2/tower-milnor`; identifiers of other roadmaps are
written in full.

## Purpose and scope

The roadmap owns the generic enhanced sheaf theory of the atlas and the
abstract higher-categorical algebra built on it. Geometric applications (the
v- and pro-étale sites of diamonds, étale coefficient categories, six
operations, prismatic and crystalline sites) belong to their own roadmaps and
must verify the hypotheses of the abstract theorems stated here. Its targets
are:

- **E0, a concrete enhancement and higher-category operations.** The dg nerve
  of a dg category, its inner horn filling, its homotopy category (degree-zero
  cohomology with composition) and its mapping spaces through Dold–Kan; the
  right mapping space of a quasicategory, its Kan property and the detection of
  categorical equivalences by mapping spaces; joins, slices, cones, enhanced
  limits and colimits with their mapping-space universal properties; functor
  quasicategories and coherent transformations; full enhanced subcategories;
  stable quasicategories with the comparison of suspension, cofibres and
  triangle rotation against Mathlib's cochain shift and mapping cone;
  coCartesian edges and fibrations and restricted straightening over the
  interval, simplicial, tower and refinement shapes; the maximal Kan core, the
  coherent nerve of a locally Kan category, Cat∞ and Spaces; the simplicial
  enrichment of a dg category and its comparison with the dg nerve; universe
  control for mapping spaces, κ-filtered diagrams, accessibility and
  presentability.
- **E1, unbounded derived sheaves and presentability.** The dg category of
  complexes of module sheaves on a small ringed site; unbounded K-injective and
  K-flat replacements; the enhanced derived category D∞(O) and its comparison
  with Mathlib's derived category; presentability; derived tensor and internal
  Hom; enhanced ringed pullback and pushforward; coefficient change; the
  Koszul complex; the perfect-ring algebra needed for descent on perfect
  schemes (Frobenius-root ideals, Tor independence, finite Tor and global
  dimension, the converse Kunz criterion, saturated valuation modules);
  quasicoherent derived sheaves, derived base change on perfect schemes, the
  cohomology base-change map and a splitting criterion.
- **E2, repleteness, inverse limits, Postnikov convergence and descent.**
  Replete topoi and their countable products; coherent inverse towers, the
  product–difference formula, the Milnor sequence, pro-zero towers and
  derived-limit invariance; Postnikov completion, left completeness and its
  criteria (repleteness, local and global cohomological dimension bounds,
  exact sections); weakly contractible objects and locally weakly contractible
  topoi; hypercovers, Cartesian derived systems, bounded-below and unbounded
  hypercover descent and refinement independence; sheaves of spaces and their
  Postnikov towers; the h-topology on perfect schemes with quantitative
  descendability, h-Čech descent, boundedness detection and unbounded
  h-hyperdescent over a finite-dimensional regular perfect base.
- **E3, coherent diagrams, Kan extensions and adjoints.** Left Kan extension
  along a full inclusion; coherent diagrams of ringed topoi and the point-free
  comparison of their coefficient systems; space-valued representability; the
  enhanced adjoint functor theorem; coherent mates and Beck–Chevalley
  transformations; cofinality of a terminal fibre and preservation of
  coCartesian edges; accessible localizations and coreflections; limits of
  presentable categories; exactness and coproduct preservation; the
  compact-generation adjoint criterion; adjoints at cardinal cutoffs.
- **E4, derived completion of sheaves and coefficient reconstruction.**
  Derived complete sheaves and their local generator criterion; the
  completion reflector, generic on the point topos and for sheaves; the Koszul
  power model of completion and the regular-ideal quotient algebra;
  completeness of cohomology sheaves and the comparison with classical
  completion; complete internal Hom, completed tensor and their adjunction;
  compatible coefficient systems over R/I^n, the reduction functor, inverse-limit
  reconstruction and the reconstruction equivalence on a replete topos, with
  the completed coefficient ring, perfect coefficient change and detection of
  equivalences modulo the ideal.
- **E5, shared monoidal enhancement, Ind-completion and animated algebra**,
  in five sub-layers and a joint acceptance diagram:
  - *E5:abstract*: symmetric monoidal ∞-categories, ∞-operads and O-monoidal
    categories, algebra and module objects with extension of scalars, the
    monoidal comparison for stable categories and exact functors, idempotent
    completion, the monoidal envelope, monoidal Dwyer–Kan and model-category
    localizations, derivable cocartesian families, stable tensor ideals,
    Verdier quotients, Barr–Beck–Lurie monadicity, descendable algebras and
    module descent, uniform-index descendability, formal inversion of a tensor
    object.
  - *E5:presentability*: compact objects, Ind-completion and its universal
    property, stable and monoidal Ind, presentable categories and limits in
    PrL, tensor products of presentable categories and module base change, Ind
    of a Verdier quotient, Neeman's compactness criterion, coherent finite and
    profinite group actions, compact morphisms, dualizable and compactly
    assembled categories, strongly continuous filtered colimits, trace-class
    maps and locally rigid categories.
  - *E5:animation*: sifted colimits, the nonabelian derived category PΣ(C) and
    its universal property, animated commutative rings, Frobenius and
    perfection in characteristic p, the degreewise Witt vector adapter, and
    bounded totalizations commuting with filtered colimits.
  - *E5:cotangent-export*: the comparison of the cotangent complex of
    `DerivedDeRhamCohomology:DD.0` with the animated and monoidal module
    structures, and the comparison of animated and E∞ algebras in the ranges
    where it holds.
  - *E5:spectra-comparison*: the comparison of the concrete spectra of
    `StableHomotopyKTheory:H.5` with the abstract stable monoidal category Sp.
  - *E5* itself holds only the joint acceptance diagram, in which the unit
    module, polynomial and regular-quotient cotangent computations and exact
    triangles agree across E1, E5:abstract and both comparison returns.

## Boundaries

### What this roadmap imports

The pinned Mathlib supplies simplicial sets, the quasicategory and Kan complex
predicates, the strict bicategory of quasicategories with its finite mates,
ordinary nerves, the simplicial internal Hom with its quasicategory instance,
sheaves of modules and the Grothendieck property, unbounded derived categories,
K-injective complexes, shifts and truncations, monoidal and symmetric
categories, Karoubi envelopes, set-valued Ind objects, sifted categories,
polynomial rings, Witt vectors, regular sequences, exterior powers and Tor. The
pinned Tau Ceti supplies the signed linear Hom complex and its enrichment. The
table under [What the pinned libraries have](#what-the-pinned-libraries-have)
lists all 78 cited declarations. Outside the libraries the roadmap
imports:

| Supplier | Cited as | Used by |
| --- | --- | --- |
| DerivedDeRhamCohomology | `DerivedDeRhamCohomology:DD.0/cotangent-base-change` | [`E5:cotangent-export/the-imported-interface`](#n-e5-cotangent-export-the-imported-interface) |
| DerivedDeRhamCohomology | `DerivedDeRhamCohomology:DD.0/cotangent-complex` | [`E5:cotangent-export/the-imported-interface`](#n-e5-cotangent-export-the-imported-interface) |
| DerivedDeRhamCohomology | `DerivedDeRhamCohomology:DD.0/cotangent-naive-comparison` | [`E5:cotangent-export/the-imported-interface`](#n-e5-cotangent-export-the-imported-interface) |
| DerivedDeRhamCohomology | `DerivedDeRhamCohomology:DD.0/cotangent-transitivity` | [`E5:cotangent-export/the-imported-interface`](#n-e5-cotangent-export-the-imported-interface) |
| DerivedDeRhamCohomology | `DerivedDeRhamCohomology:DD.0/derivations-cotangent-comparison` | [`E5:cotangent-export/the-imported-interface`](#n-e5-cotangent-export-the-imported-interface) |
| DerivedDeRhamCohomology | `DerivedDeRhamCohomology:DD.0/derived-exterior-powers` | [`E5:cotangent-export/the-imported-interface`](#n-e5-cotangent-export-the-imported-interface) |
| DerivedDeRhamCohomology | `DerivedDeRhamCohomology:DD.0/lci-amplitude` | [`E5:cotangent-export/the-imported-interface`](#n-e5-cotangent-export-the-imported-interface) |
| DerivedDeRhamCohomology | `DerivedDeRhamCohomology:DD.0/regular-quotient-cotangent` | [`E5:cotangent-export/the-imported-interface`](#n-e5-cotangent-export-the-imported-interface) |
| DerivedDeRhamCohomology | `DerivedDeRhamCohomology:DD.0/smooth-cotangent` | [`E5:cotangent-export/the-imported-interface`](#n-e5-cotangent-export-the-imported-interface) |
| DiamondsAndVStacks | `DiamondsAndVStacks:D0` | [`E2/postnikov-local-injectivity`](#n-e2-postnikov-local-injectivity), [`E2/postnikov-uniform-window`](#n-e2-postnikov-uniform-window), [`E2/postnikov-diagonal-bound`](#n-e2-postnikov-diagonal-bound), [`E1/k-flat-replacement`](#n-e1-k-flat-replacement), [`E1/derived-presentability`](#n-e1-derived-presentability), [`E1/ringed-pullback-pushforward`](#n-e1-ringed-pullback-pushforward), [`E2/perfect-h-topology`](#n-e2-perfect-h-topology), [`E2/perfect-h-cover-descendability`](#n-e2-perfect-h-cover-descendability) |
| DiamondsAndVStacks | `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites` | [`E2/weakly-contractible-compact-generators`](#n-e2-weakly-contractible-compact-generators) |
| StableHomotopyKTheory | `StableHomotopyKTheory:H.5:spectra/derived-smash-product` | [`E5:spectra-comparison/late-realisation`](#n-e5-spectra-comparison-late-realisation) |
| StableHomotopyKTheory | `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-spectrum` | [`E5:cotangent-export/e-infinity-comparison-in-proved-ranges`](#n-e5-cotangent-export-e-infinity-comparison-in-proved-ranges), [`E5:spectra-comparison/late-realisation`](#n-e5-spectra-comparison-late-realisation) |
| StableHomotopyKTheory | `StableHomotopyKTheory:H.5:spectra/module-spectra-model-structure` | [`E5:cotangent-export/e-infinity-comparison-in-proved-ranges`](#n-e5-cotangent-export-e-infinity-comparison-in-proved-ranges), [`E5:spectra-comparison/late-realisation`](#n-e5-spectra-comparison-late-realisation) |
| StableHomotopyKTheory | `StableHomotopyKTheory:H.5:spectra/stable-model-structure` | [`E5:spectra-comparison/late-realisation`](#n-e5-spectra-comparison-late-realisation) |
| tauceti:TauCetiRoadmap/DGAInfinity | `tauceti:TauCetiRoadmap/DGAInfinity#layer-0-signed-graded-multilinear-and-tensor-coalgebra-infrastructure` | [`E0/dg-nerve`](#n-e0-dg-nerve), [`E1/sheaves-of-modules-and-the-grothendieck-property`](#n-e1-sheaves-of-modules-and-the-grothendieck-property) |
| tauceti:TauCetiRoadmap/DGAInfinity | `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules` | [`E0/dg-nerve`](#n-e0-dg-nerve), [`E0/dg-nerve-homotopy-category-and-mapping-spaces`](#n-e0-dg-nerve-homotopy-category-and-mapping-spaces), [`E0/dold-kan-simplicial-enrichment`](#n-e0-dold-kan-simplicial-enrichment) |
| tauceti:TauCetiRoadmap/ProfiniteCohomology | `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-0-discrete-modules-and-continuous-sections` | [`E5:presentability/coherent-group-actions`](#n-e5-presentability-coherent-group-actions) |
| tauceti:TauCetiRoadmap/ProfiniteCohomology | `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees` | [`E5:presentability/coherent-group-actions`](#n-e5-presentability-coherent-group-actions) |

- **Tau Ceti roadmaps.** DGAInfinity layers 0 and 1 own the signed graded
  infrastructure, dg categories and their degree-zero homology categories; E0
  adds only the dg nerve and its comparisons. ProfiniteCohomology layers 0 and
  10 own discrete continuous modules and the all-degree finite-quotient
  cocone; E5's coherent group actions use them unchanged. AlgebraicTopology
  owns homotopy groups of Kan complexes. StablePeriodicCurved owns ordinary
  triangulated envelopes and localizations; E5 builds only their higher
  analogues.
- **`DiamondsAndVStacks:D0`** supplies ordinary sites, topoi, slices, free
  module-sheaf generators, filtered-colimit section computations and the
  ordinary scheme geometry used on perfect schemes. Request
  [R0.1](#req-r0-1) states what is needed beyond its current packet.
- **`DerivedDeRhamCohomology:DD.0`** owns the cotangent complex and derived
  exterior powers; only E5:cotangent-export imports them.
  **`StableHomotopyKTheory:H.5`** owns concrete spectra and module spectra;
  only E5:spectra-comparison and the rational algebra comparison import them.
  Neither is an input to the abstract E5 constructions or to E0–E4.

Both of these are higher in the upstream order (DerivedDeRhamCohomology is in
tier 9, and StableHomotopyKTheory is not among the 94 roadmaps of the current
upstream order), while this roadmap is in tier 4. They are cited only by the two return
layers and by the joint acceptance diagram, never by E0–E4, E5:abstract,
E5:presentability or E5:animation. The packaging step must either move the
cited notions down or state the return layers as later extensions; the
Dependencies section lists the citations.

### Ownership taken over from DerivedDeRhamCohomology

Because this roadmap precedes DerivedDeRhamCohomology in the upstream order,
the generic completion algebra its E4 needs is planned here, and
`DerivedDeRhamCohomology:DD.1` imports it. The redirects are:

| Former owner | Owner in this roadmap | Reason |
| --- | --- | --- |
| `DerivedDeRhamCohomology:DD.1/koszul-complex` | [`E1/koszul-complex`](#n-e1-koszul-complex) | Required lower-tier input moves into tier-4 EnhancedDerivedSheaves under WORKERS upstream order. |
| `DerivedDeRhamCohomology:DD.1/derived-completeness` | [`E4/derived-complete-sheaves`](#n-e4-derived-complete-sheaves) | Required lower-tier input moves into tier-4 EnhancedDerivedSheaves under WORKERS upstream order. |
| `DerivedDeRhamCohomology:DD.1/derived-completion` | [`E4/the-imported-completion-interface`](#n-e4-the-imported-completion-interface) | Required lower-tier input moves into tier-4 EnhancedDerivedSheaves under WORKERS upstream order. |
| `DerivedDeRhamCohomology:DD.1/koszul-completion-tower` | [`E4/koszul-completion-tower`](#n-e4-koszul-completion-tower) | Required lower-tier input moves into tier-4 EnhancedDerivedSheaves under WORKERS upstream order. |
| `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion` | [`E4/regular-ideal-quotients`](#n-e4-regular-ideal-quotients) | Required lower-tier input moves into tier-4 EnhancedDerivedSheaves under WORKERS upstream order. |
| `DerivedDeRhamCohomology:DD.1/completed-tensor` | [`E4/completed-sheaf-tensor`](#n-e4-completed-sheaf-tensor) | Required lower-tier input moves into tier-4 EnhancedDerivedSheaves under WORKERS upstream order. |
| `DerivedDeRhamCohomology:DD.1/derived-nakayama` | [`E4/mod-ideal-detection`](#n-e4-mod-ideal-detection) | Required lower-tier input moves into tier-4 EnhancedDerivedSheaves under WORKERS upstream order. |

The point-topos cases of the E4 declarations are the generic statements:
completeness, the reflector, completed tensor and Nakayama-type detection.
DD.1 keeps only its further filtered and de Rham constructions. The
identifier `E4/the-imported-completion-interface` is kept for link stability,
although E4 now constructs the reflector rather than importing it.

### Who uses this roadmap

The atlas records 66 stage edges from layers of this roadmap to layers of 24 others. The table
lists, for each layer, the consuming layers and the roadmaps whose packets cite
the layer or one of its declarations.

| Layer | Consuming layers in the atlas | Roadmaps whose declarations cite this layer or its declarations |
| --- | --- | --- |
| [E0](#layer-e0) | `EtaleDualityAndPerverseSheaves:EDC.0`, `PerfectoidQuotients:Q0` | CrystallineCohomology, DiamondSixOperations, HabiroCohomologyFoundations, HabiroRings, LefschetzPencilsAndVanishingCycles, PrismaticCohomology, RefinedTraceMethods, SchemeKTheoryOperations, StableHomotopyKTheory, VStackSheavesAndLisseCategories |
| [E1](#layer-e1) | `AInfCohomology:AI.1`, `AInfCohomology:AI.3`, `AdicCoefficientsAndComparisons:L2`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`, `ClassicalAdicEtaleCohomology:H0`, `ClassicalAdicEtaleCohomology:H3`, `CohomologyComparisons:CP.3`, `CrystallineCohomology:CR.1`, `CrystallineCohomology:CR.5:log-algebra`, `DerivedDeRhamCohomology:DD.0`, `DerivedDeRhamCohomology:DD.1`, `DiamondEtaleCohomology:C3`, `DiamondEtaleCohomology:C7`, `EtaleDualityAndPerverseSheaves:EDC.0`, `PerfectoidQuotients:Q1`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension` | AInfCohomology, AdicCoefficientsAndComparisons, ArithmeticLocallySymmetricSpaces, ClassicalAdicEtaleCohomology, CrystallineCohomology, DeformationAndDerivedPatchingAlgebra, DerivedDeRhamCohomology, DiamondEtaleCohomology, EtaleDualityAndPerverseSheaves, HabiroCohomologyFoundations, HabiroRings, HodgeStructuresPartII, HodgeTateAndCanonicalSubgroups, InverseGaloisAndArithmeticFundamentalGroups, LefschetzPencilsAndVanishingCycles, PrismaticCohomology, RefinedTraceMethods, SchemeKTheoryOperations, VStackSheavesAndLisseCategories |
| [E2](#layer-e2) | `AdicCoefficientsAndComparisons:L2`, `AdicCoefficientsAndComparisons:L5`, `CrystallineCohomology:CR.2`, `DiamondEtaleCohomology:C0`, `DiamondEtaleCohomology:C5`, `LefschetzPencilsAndVanishingCycles:LPV.0`, `PerfectoidQuotients:Q1`, `PrismaticCohomology:PR.1` | AInfCohomology, AdicCoefficientsAndComparisons, ClassicalAdicEtaleCohomology, CohomologyComparisons, CrystallineCohomology, DeformationAndDerivedPatchingAlgebra, DerivedDeRhamCohomology, DiamondEtaleCohomology, DiamondSixOperations, HabiroCohomologyFoundations, HodgeTateAndCanonicalSubgroups, InverseGaloisAndArithmeticFundamentalGroups, MotivicEtaleKTheory, PrismaticCohomology, SchemeKTheoryOperations, VStackSheavesAndLisseCategories |
| [E3](#layer-e3) | `AdicCoefficientsAndComparisons:L2`, `AdicCoefficientsAndComparisons:L5`, `DerivedDeRhamCohomology:DD.1`, `DiamondEtaleCohomology:C2`, `DiamondEtaleCohomology:C9`, `DiamondSixOperations:S2`, `DiamondSixOperations:S3`, `EtaleDualityAndPerverseSheaves:EDC.0`, `PerfectoidQuotients:Q2` | AdicCoefficientsAndComparisons, CrystallineCohomology, DerivedDeRhamCohomology, DiamondEtaleCohomology, DiamondSixOperations, EtaleDualityAndPerverseSheaves, GeometricSatakeAndFusion, HabiroRings, MotivicEtaleKTheory, PrismaticCohomology, RefinedTraceMethods, VStackSheavesAndLisseCategories |
| [E4](#layer-e4) | `AdicCoefficientsAndComparisons:L0`, `PerfectoidQuotients:Q0`, `VStackSheavesAndLisseCategories:VS2` | AInfCohomology, AdicCoefficientsAndComparisons, CohomologyComparisons, EtaleDualityAndPerverseSheaves, LefschetzPencilsAndVanishingCycles, SchemeKTheoryOperations, VStackSheavesAndLisseCategories |
| [E5](#layer-e5) | — | AInfCohomology, HabiroCohomologyFoundations |
| [E5:abstract](#layer-e5-abstract) | `ExcursionOperatorsAndSpectralAction:ES0`, `ExcursionOperatorsAndSpectralAction:ES2`, `ExcursionOperatorsAndSpectralAction:ES3`, `GeneralAlgebraicKTheory:K.4:construction`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `GeometricSatakeAndFusion:GS4:rational-reductivity`, `HabiroRings:HR.2`, `HeckeStacksAndLocalShtukas:HS1`, `LanglandsParameterStacks:LP0`, `LanglandsParameterStacks:LP2:excursion-presentation`, `LanglandsParameterStacks:LP3`, `LanglandsParameterStacks:LP4`, `MotivicEtaleKTheory:M.5a`, `RefinedTraceMethods:RT.5`, `StableHomotopyKTheory:H.5:spectra`, `VStackSheavesAndLisseCategories:VS0`, `VStackSheavesAndLisseCategories:VS2` | AInfCohomology, ExcursionOperatorsAndSpectralAction, GeometricSatakeAndFusion, HabiroCohomologyFoundations, HabiroRings, HeckeStacksAndLocalShtukas, LanglandsParameterStacks, PrismaticCohomology, RefinedTraceMethods, StableHomotopyKTheory, VStackSheavesAndLisseCategories |
| [E5:presentability](#layer-e5-presentability) | `ExcursionOperatorsAndSpectralAction:ES2`, `ExcursionOperatorsAndSpectralAction:ES3`, `LanglandsParameterStacks:LP1`, `LanglandsParameterStacks:LP3`, `LanglandsParameterStacks:LP4`, `VStackSheavesAndLisseCategories:VS2` | ExcursionOperatorsAndSpectralAction, GeometricSatakeAndFusion, HabiroCohomologyFoundations, HabiroRings, HeckeStacksAndLocalShtukas, LanglandsParameterStacks, RefinedTraceMethods, VStackSheavesAndLisseCategories |
| [E5:animation](#layer-e5-animation) | `DerivedDeRhamCohomology:DD.0`, `DerivedDeRhamCohomology:DD.1`, `LanglandsParameterStacks:LP1`, `PerfectoidQuotients:Q0:animated-application`, `PrismaticCohomology:PR.5` | DerivedDeRhamCohomology, ExcursionOperatorsAndSpectralAction, HabiroCohomologyFoundations, LanglandsParameterStacks, PerfectoidQuotients, PrismaticCohomology, RefinedTraceMethods |
| [E5:cotangent-export](#layer-e5-cotangent-export) | — | — |
| [E5:spectra-comparison](#layer-e5-spectra-comparison) | — | HabiroRings, MotivicEtaleKTheory, RefinedTraceMethods |

Declarations of this roadmap cited by name in other packets:

| Declaration | Cited by |
| --- | --- |
| [`E0/dg-nerve`](#n-e0-dg-nerve) | SchemeKTheoryOperations |
| [`E0/limits-colimits-and-slices`](#n-e0-limits-colimits-and-slices) | DiamondSixOperations, HabiroCohomologyFoundations, HabiroRings, PrismaticCohomology, RefinedTraceMethods |
| [`E0/stable-api-and-the-sign-comparison`](#n-e0-stable-api-and-the-sign-comparison) | SchemeKTheoryOperations, StableHomotopyKTheory |
| [`E0/cocartesian-fibrations-and-restricted-straightening`](#n-e0-cocartesian-fibrations-and-restricted-straightening) | DiamondSixOperations, HabiroCohomologyFoundations, HabiroRings, RefinedTraceMethods |
| [`E1/sheaves-of-modules-and-the-grothendieck-property`](#n-e1-sheaves-of-modules-and-the-grothendieck-property) | ClassicalAdicEtaleCohomology, CrystallineCohomology, SchemeKTheoryOperations |
| [`E1/k-injective-and-k-flat-replacements`](#n-e1-k-injective-and-k-flat-replacements) | AInfCohomology, ClassicalAdicEtaleCohomology, DeformationAndDerivedPatchingAlgebra, DiamondEtaleCohomology, EtaleDualityAndPerverseSheaves, SchemeKTheoryOperations, VStackSheavesAndLisseCategories |
| [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) | AdicCoefficientsAndComparisons, ClassicalAdicEtaleCohomology, CrystallineCohomology, DerivedDeRhamCohomology, DiamondEtaleCohomology, EtaleDualityAndPerverseSheaves, RefinedTraceMethods, SchemeKTheoryOperations, VStackSheavesAndLisseCategories |
| [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) | AInfCohomology, AdicCoefficientsAndComparisons, ClassicalAdicEtaleCohomology, CrystallineCohomology, DerivedDeRhamCohomology, DiamondEtaleCohomology, EtaleDualityAndPerverseSheaves, RefinedTraceMethods, SchemeKTheoryOperations, VStackSheavesAndLisseCategories |
| [`E2/replete-topoi`](#n-e2-replete-topoi) | AInfCohomology, DiamondEtaleCohomology, PrismaticCohomology |
| [`E2/countable-products-and-inverse-limits`](#n-e2-countable-products-and-inverse-limits) | AInfCohomology |
| [`E2/left-completion`](#n-e2-left-completion) | AdicCoefficientsAndComparisons, DiamondEtaleCohomology |
| [`E2/hypercovers-and-cohomological-descent`](#n-e2-hypercovers-and-cohomological-descent) | AdicCoefficientsAndComparisons, DiamondEtaleCohomology, DiamondSixOperations, PrismaticCohomology, VStackSheavesAndLisseCategories |
| [`E3/left-kan-extension-along-a-full-inclusion`](#n-e3-left-kan-extension-along-a-full-inclusion) | DerivedDeRhamCohomology, DiamondSixOperations, HabiroRings, PrismaticCohomology |
| [`E3/coherent-diagrams-of-ringed-topoi`](#n-e3-coherent-diagrams-of-ringed-topoi) | AdicCoefficientsAndComparisons, DiamondEtaleCohomology, DiamondSixOperations, EtaleDualityAndPerverseSheaves, VStackSheavesAndLisseCategories |
| [`E3/adjoint-functor-theorem-and-localisations`](#n-e3-adjoint-functor-theorem-and-localisations) | AdicCoefficientsAndComparisons, DerivedDeRhamCohomology, DiamondEtaleCohomology, DiamondSixOperations, EtaleDualityAndPerverseSheaves, HabiroRings, RefinedTraceMethods, VStackSheavesAndLisseCategories |
| [`E3/mates-and-beck-chevalley`](#n-e3-mates-and-beck-chevalley) | CrystallineCohomology, DiamondEtaleCohomology, DiamondSixOperations, EtaleDualityAndPerverseSheaves, VStackSheavesAndLisseCategories |
| [`E0/dg-nerve-mapping-space`](#n-e0-dg-nerve-mapping-space) | CrystallineCohomology |
| [`E0/dold-kan-simplicial-enrichment`](#n-e0-dold-kan-simplicial-enrichment) | VStackSheavesAndLisseCategories |
| [`E2/surjective-system-derived-limit`](#n-e2-surjective-system-derived-limit) | AInfCohomology, CrystallineCohomology, DerivedDeRhamCohomology |
| [`E2/inverse-limit-amplitude`](#n-e2-inverse-limit-amplitude) | DerivedDeRhamCohomology, DiamondEtaleCohomology |
| [`E2/postnikov-left-completion`](#n-e2-postnikov-left-completion) | AdicCoefficientsAndComparisons, DiamondEtaleCohomology |
| [`E2/hypercover`](#n-e2-hypercover) | CrystallineCohomology, DiamondEtaleCohomology, DiamondSixOperations |
| [`E2/bounded-below-hypercover-descent`](#n-e2-bounded-below-hypercover-descent) | CohomologyComparisons, CrystallineCohomology |
| [`E2/unbounded-hypercover-descent`](#n-e2-unbounded-hypercover-descent) | AInfCohomology, AdicCoefficientsAndComparisons, DiamondEtaleCohomology, DiamondSixOperations, VStackSheavesAndLisseCategories |
| [`E2/postnikov-uniform-window`](#n-e2-postnikov-uniform-window) | DiamondEtaleCohomology |
| [`E2/postnikov-finite-cohomological-dimension`](#n-e2-postnikov-finite-cohomological-dimension) | DiamondEtaleCohomology |
| [`E4/derived-complete-sheaves`](#n-e4-derived-complete-sheaves) | AInfCohomology, AdicCoefficientsAndComparisons, VStackSheavesAndLisseCategories |
| [`E4/the-imported-completion-interface`](#n-e4-the-imported-completion-interface) | CohomologyComparisons |
| [`E4/complete-module-weak-serre`](#n-e4-complete-module-weak-serre) | AInfCohomology |
| [`E4/complete-cohomology-criterion`](#n-e4-complete-cohomology-criterion) | AInfCohomology |
| [`E4/complete-internal-hom`](#n-e4-complete-internal-hom) | AdicCoefficientsAndComparisons |
| [`E4/completed-sheaf-tensor`](#n-e4-completed-sheaf-tensor) | AInfCohomology, AdicCoefficientsAndComparisons |
| [`E4/completed-tensor-hom-adjunction`](#n-e4-completed-tensor-hom-adjunction) | AdicCoefficientsAndComparisons |
| [`E4/compatible-coefficient-systems`](#n-e4-compatible-coefficient-systems) | AdicCoefficientsAndComparisons |
| [`E4/inverse-limit-reconstruction`](#n-e4-inverse-limit-reconstruction) | AInfCohomology, EtaleDualityAndPerverseSheaves |
| [`E4/completed-coefficient-ring`](#n-e4-completed-coefficient-ring) | AdicCoefficientsAndComparisons |
| [`E4/coefficient-system-reconstruction`](#n-e4-coefficient-system-reconstruction) | AdicCoefficientsAndComparisons, EtaleDualityAndPerverseSheaves |
| [`E4/completed-colimits`](#n-e4-completed-colimits) | AInfCohomology, AdicCoefficientsAndComparisons |
| [`E4/perfect-coefficient-change`](#n-e4-perfect-coefficient-change) | AdicCoefficientsAndComparisons, VStackSheavesAndLisseCategories |
| [`E4/mod-ideal-detection`](#n-e4-mod-ideal-detection) | AInfCohomology, AdicCoefficientsAndComparisons, CohomologyComparisons |
| [`E5:abstract/symmetric-monoidal-infinity-category`](#n-e5-abstract-symmetric-monoidal-infinity-category) | GeometricSatakeAndFusion, HabiroRings, HeckeStacksAndLocalShtukas, PrismaticCohomology, RefinedTraceMethods, VStackSheavesAndLisseCategories |
| [`E5:abstract/infinity-operad`](#n-e5-abstract-infinity-operad) | RefinedTraceMethods |
| [`E5:abstract/monoidal-categories-over-an-operad`](#n-e5-abstract-monoidal-categories-over-an-operad) | HeckeStacksAndLocalShtukas |
| [`E5:abstract/algebra-objects`](#n-e5-abstract-algebra-objects) | AInfCohomology, HabiroRings, PrismaticCohomology, RefinedTraceMethods |
| [`E5:abstract/module-objects`](#n-e5-abstract-module-objects) | HabiroRings, RefinedTraceMethods, VStackSheavesAndLisseCategories |
| [`E5:abstract/stable-infinity-category`](#n-e5-abstract-stable-infinity-category) | GeometricSatakeAndFusion, HeckeStacksAndLocalShtukas, PrismaticCohomology, RefinedTraceMethods, VStackSheavesAndLisseCategories |
| [`E5:abstract/exact-functors`](#n-e5-abstract-exact-functors) | GeometricSatakeAndFusion, HeckeStacksAndLocalShtukas |
| [`E5:abstract/idempotent-completion`](#n-e5-abstract-idempotent-completion) | GeometricSatakeAndFusion, RefinedTraceMethods, VStackSheavesAndLisseCategories |
| [`E5:presentability/compact-objects`](#n-e5-presentability-compact-objects) | HeckeStacksAndLocalShtukas, RefinedTraceMethods, VStackSheavesAndLisseCategories |
| [`E5:presentability/ind-completion`](#n-e5-presentability-ind-completion) | GeometricSatakeAndFusion, RefinedTraceMethods, VStackSheavesAndLisseCategories |
| [`E5:presentability/universal-property-of-ind`](#n-e5-presentability-universal-property-of-ind) | GeometricSatakeAndFusion |
| [`E5:presentability/presentable-categories`](#n-e5-presentability-presentable-categories) | GeometricSatakeAndFusion, HabiroRings, RefinedTraceMethods |
| [`E5:presentability/coherent-group-actions`](#n-e5-presentability-coherent-group-actions) | HabiroCohomologyFoundations, HeckeStacksAndLocalShtukas, RefinedTraceMethods |
| [`E5:animation/sifted-colimits`](#n-e5-animation-sifted-colimits) | HabiroCohomologyFoundations, PerfectoidQuotients |
| [`E5:animation/nonabelian-derived-category`](#n-e5-animation-nonabelian-derived-category) | DerivedDeRhamCohomology, PrismaticCohomology |
| [`E5:animation/universal-property-of-animation`](#n-e5-animation-universal-property-of-animation) | DerivedDeRhamCohomology, HabiroCohomologyFoundations, PerfectoidQuotients, PrismaticCohomology, RefinedTraceMethods |
| [`E5:animation/animated-commutative-rings`](#n-e5-animation-animated-commutative-rings) | DerivedDeRhamCohomology, HabiroCohomologyFoundations, PerfectoidQuotients, PrismaticCohomology, RefinedTraceMethods |
| [`E5:spectra-comparison/late-realisation`](#n-e5-spectra-comparison-late-realisation) | HabiroRings |

Some consuming roadmaps carry obligations that the stage texts of this roadmap
assign to them; this roadmap supplies only the abstract theory:

- `DiamondEtaleCohomology:C0`: The verification that the actual v- and quasi-pro-etale sites of diamonds are locally weakly contractible, hence replete. The E2 stage text says C0 proves it; this layer supplies only the abstract theory.
- `DiamondEtaleCohomology:C2`: The accessibility and colimit-closure hypotheses for the full subcategory defining D_et. The E3 stage text says C2 must exhibit them and must not merely invoke this layer's abstract adjoint theorem.
- `DiamondSixOperations:S2`: The six-operation construction that consumes E3's diagram categories, mates and Beck-Chevalley transformations.
- `AdicCoefficientsAndComparisons:L0`: The application of E4's coefficient-system reconstruction to etale objects, and the six-operation construction for the entire compatible coefficient system.
- `AdicCoefficientsAndComparisons:L2`: The adic-coefficient consumer of E1's enhanced derived category and E2's descent.
- `VStackSheavesAndLisseCategories:VS2`: The lisse-category consumer of E4's completion extension to sheaves.
- `PerfectoidQuotients:Q0`: The perfectoid-quotient consumer of E0 and E4.
- `EtaleDualityAndPerverseSheaves:EDC.0`: The etale-duality consumer of E0's enhancement.
- `SchemeKTheoryOperations:S.1`: SchemeKTheoryOperations:S.1, which AUDIT-22 records as also constructing complexes of module sheaves with quasi-isomorphisms and choosing an enhanced model, overlapping E1.
- `DeformationAndDerivedPatchingAlgebra:P7`: DeformationAndDerivedPatchingAlgebra:P7, which AUDIT-22 records as also constructing derived completion and derived tensor products, for perfect complexes over complete Noetherian local rings, overlapping E4.

### Statements other roadmaps request here

110 requests in other packets name a layer of this roadmap as supplier. Their first sentences are listed by layer; the packets hold the full statements and consuming declarations.

| Layer asked | Requesting packet | Consumers | Need (first sentence) |
| --- | --- | ---: | --- |
| E0 | `HabiroCohomologyFoundations--HQ.1` | 1 | Pushouts in the ∞-category of ∞-categories, with the fact that fully faithful functors are stable under pushout (the observation of Ramzi used in Lemma 4.9 of the q-Hodge paper) and that a pushout of adjunctions along fully faithful functors is again an … |
| E0 | `HabiroRings` | 4 | The ∞-categorical setting: limits and colimits with mapping-space universal properties and the stable-category API (stage text: 'Construct equivalences, slices, limits and colimits with their mapping-space universal properties for the categories used below. |
| E0 | `HabiroRings--HR.3` | 4 | For the nerves of the finite posets Q(m), its surviving subposet, P(m), their slice categories and products with Δ¹, supply coCartesian straightening/unstraightening with fibrewise evaluation and naturality, and the coherent-section model for limits in Cat_∞ … |
| E0 | `LefschetzPencilsAndVanishingCycles--LPV.0` | 3 | A coherent filtered derived category of actual étale module sheaves, functorial cones, total complexes and filtered quasi-isomorphisms; |
| E0 | `RefinedTraceMethods--RT.1` | 2 | Straightening and coherent sections for arbitrary small space-indexed diagrams and their slices used by parametrized Tate, and coherent inverse towers of spectra; |
| E0 | `RefinedTraceMethods--RT.1` | 7 | Quasicategory-valued coherent diagrams on arbitrary small anima, action groupoids BG (including topological S¹), slices and N^op; |
| E0 | `RefinedTraceMethods--RT.1` | 2 | Coherent Postnikov inverse towers, coherent sifted diagrams in connective E₁ algebras and their square-zero derivation category, comparison cones and mapping-space limit properties. |
| E0 | `RefinedTraceMethods--RT.1` | 3 | Coherent perfect-even infinity sites and spectral/condensed sheafification, sheaf-category t-structures, evaluation at R, and coherent filtered module presentations; |
| E0 | `RefinedTraceMethods--RT.1` | 3 | Coherent cyclonic E∞ algebra mapping spaces, paths in prime/divisor Tate squares and all higher compatibility, coherent lifted Čech diagrams, and gluing cones; |
| E0 | `RefinedTraceMethods--RT.1` | 1 | Coherent natural mapping Kan complexes, sequential functor diagrams and their mapping-space limit/colimit properties, plus all-filtered-diagram preservation witnesses for the derivative universal property. |
| E0 | `SchemeKTheoryOperations` | 2 | Enhanced stable categories, cores and mapping spectra; |
| E0 | `StableHomotopyKTheory` | 1 | The abstract stable-category interface (zero object, fibres and cofibres, suspension equivalence, triangulated homotopy category) in particular EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison, the cone and shift signs of cochain complexes under … |
| E1 | `AInfCohomology--AI.0` | 9 | Refine the existing K-flat replacement node to a termwise-flat K-flat replacement on ringed sites (strongly K-flat, BMS1 Lemma6.1); |
| E1 | `ArithmeticLocallySymmetricSpaces` | 8 | Unbounded enhanced derived categories of sheaves of R-modules on locally compact spaces, K-injective replacements, equivariant finite-group derived invariant sections, and natural open/closed j_!→id→i_* triangles. |
| E1 | `ClassicalAdicEtaleCohomology--H0` | 3 | For the proper finite-local-coefficient duality exports: derived tensor/internal-Hom compatibility with exact θ^*, and the finite-coefficient Ext calculation used by Berkovich 7.4.10. |
| E1 | `ClassicalAdicEtaleCohomology--H3` | 7 | Supply the coherent proper/étale gluing fragment used in Zavyalov Theorem 9.4: from proper pushforwards and exact étale ! with exchange, base change, projection formula and descent, construct the corresponding support functors on locally +weakly finite type … |
| E1 | `ClassicalAdicEtaleCohomology--H4` | 6 | (1) Derived global sections over a countable increasing open cover as a derived inverse limit, RΓ(⋃ U_j, K) ≅ Rlim_j RΓ(U_j, K), with the Milnor sequence and its degeneration when the transition maps are isomorphisms. |
| E1 | `CrystallineCohomology--CR.0` | 1 | For a ringed topos (Sh(C),O), a ring map A→Γ(C,O) and K, M in D(O): the cup product RΓ(C,K)⊗^L_A RΓ(C,M)→RΓ(C,K⊗^L_O M), a morphism of D(A) natural in K and M; |
| E1 | `CrystallineCohomology--CR.0` | 1 | Localize the category of cochain complexes of abelian groups at quasi-isomorphisms, with functorial termwise p-torsion-free replacements and enhancement. |
| E1 | `CrystallineCohomology--CR.0` | 1 | For a morphism f:Y→X of ringed topoi and K∈D⁺(Y), construct the convergent Grothendieck spectral sequence E₂^(a,b)=H^a(X,H^b(Rf_*K)) ⇒ H^(a+b)(Y,K), from the Postnikov filtration of Rf_*K and the composition RΓ(X,Rf_*K)≃RΓ(Y,K). |
| E1 | `DeformationAndDerivedPatchingAlgebra--P7-2` | 2 | Realize EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements on the terminal ringed site with ring R and identify its localization with native D(ModuleCat R). |
| E1 | `HabiroCohomologyFoundations--HQ.1` | 2 | The enhanced derived category of a ring with its derived tensor product and its presentability, which is the ambient category of every filtered object in this packet, together with the adjoint functor theorem for presentable ∞-categories (used to construct … |
| E1 | `HabiroRings` | 4 | The enhanced derived ∞-category of modules over A[q^{±1}] with derived tensor product and derived internal Hom, and identification of equivalences by cohomology (stage text: 'Construct the derived tensor product from the K-flat model ... |
| E1 | `HabiroRings--HR.4` | 2 | Supply the fully faithful embedding of ordinary static commutative B-algebras into actual enhanced commutative B-algebras (compatible with the completed monoidal setting), identifying mapping spaces between static algebras with the discrete algebra-hom sets. |
| E1 | `HodgeStructuresPartII` | 34 | Use the pinned SheafOfModules and locally free carriers; |
| E1 | `HodgeStructuresPartII--H.0` | 4 | Supply underived tensor sheaves on the actual SheafOfModules carrier over a commutative ring sheaf, as sheafification of the presheaf tensor with its bilinear universal property; |
| E1 | `HodgeStructuresPartII--H.1` | 4 | Export the underived sheaf tensor, Hom, dual and exterior/determinant carriers and their coherent locally free pullback comparison. |
| E1 | `HodgeStructuresPartII--H.2` | 4 | Supply ordinary sheaf-module kernels/cokernels and exact coefficient change, quotient local systems, derived global sections/pushforwards and coherent bounded logarithmic hypercohomology, compared with the already native local coefficient functor. |
| E1 | `HodgeTateAndCanonicalSubgroups--T6` | 3 | Projection formula Rµ′_*(L̂⊗OB_dR,log)≅… for the morphism of ringed sites µ′:X_prokét/X_K→X_an with locally free coefficients, and hypercohomology of the log de Rham and B_dR-coefficient complexes. |
| E1 | `InverseGaloisAndArithmeticFundamentalGroups` | 1 | Derived inverse limits and the exact finite-module Mittag–Leffler criterion for the specified coefficient tower. |
| E1 | `LefschetzPencilsAndVanishingCycles--LPV.0` | 2 | The enlarged derived étale category and filtered colimits with uniform finite cohomological amplitude; |
| E1 | `PrismaticCohomology--PR.0` | 1 | Tor-independence of perfect F_p-algebras: for maps B ← A → C of perfect F_p-algebras, B ⊗^L_A C is concentrated in degree 0 and perfect (Bhatt–Scholze, Projectivity of the Witt vector affine Grassmannian, Lemma 3.16; |
| E1 | `SchemeKTheoryOperations` | 1 | Enhanced finite-diagram continuity for Perf on filtered affine limits and qcqs affine-transition systems, refining the already planned derived enhancement. |
| E1 | `SchemeKTheoryOperations` | 1 | Dold–Puppe polynomial derived functors on bounded locally free models and enhanced local gluing of degree-zero supported λ/Adams operations; |
| E1 | `SchemeKTheoryOperations` | 2 | The Noetherian h-local pseudo-coherence/perfectness detection and symmetric monoidal enhanced category inputs requested together with E2; |
| E1 | `SchemeKTheoryOperations` | 1 | Derived pushforward of sheaf complexes along a locally finite-type map to a Noetherian scheme, on the bounded coherent objects whose cohomology sheaves have proper support. |
| E1 | `SchemeKTheoryOperations` | 1 | Part II compact cellular factorisation in a triangulated category with coproducts: a compactly generated object admits the sequential approximation of Stacks 09SN; |
| E2 | `ClassicalAdicEtaleCohomology--H0` | 1 | For f smooth proper with Y a rigid K-space (K of characteristic 0): inverse limits of epimorphic systems on Y_proét (E2/surjective-system-derived-limit, E2/inverse-limit-relative-epis) applied to (ν^*R^{2d}f_*ℤ/p^r(d))_r, whose transition maps are … |
| E2 | `ClassicalAdicEtaleCohomology--H3` | 2 | Retain the accepted integral request: for smooth proper rigid f and the epimorphic top finite-level systems, identify R²ᵈf_proét,*Ẑ_p(d) with lim_r ν*R²ᵈf_*Z/pʳ(d), give the next-degree vanishing and inverse-limit lifting that proves integral trace … |
| E2 | `CohomologyComparisons` | 1 | For bounded-below algebraic h-derived HK/de Rham realizations, import bounded-below hypercover descent with a uniform lower bound. |
| E2 | `CrystallineCohomology--CR.0` | 1 | Let (X,O) be a ringed topos, Λ a finite totally ordered set, (U_λ)_{λ∈Λ} subobjects of the final object of X whose union is the final object, and K a bounded-below complex of O-modules. |
| E2 | `CrystallineCohomology--CR.0` | 1 | Let (X,O) be a ringed site and (K_r)_{r≥1} a tower in the enhanced derived category D(X,O). |
| E2 | `DeformationAndDerivedPatchingAlgebra--R03.1` | 7 | Countable inverse systems of module short exact sequences with surjective transition maps on the left system preserve short exactness under inverse limit; |
| E2 | `DiamondEtaleCohomology--C0` | 4 | Module-coefficient versions of E2/left-completion, E2/replete-postnikov-unit and -counit, E2/inverse-limit-amplitude and E2/unbounded-hypercover-descent: for sheaves of O-modules on a replete ringed topos (in particular the constant ring Λ), D(X, O) is … |
| E2 | `DiamondEtaleCohomology--C8` | 4 | Object-wise Postnikov convergence under one finite bound on a covering basis is planned as E2/postnikov-finite-cohomological-dimension (site-level Stacks 0D6P) and the uniform truncation window as E2/postnikov-uniform-window; |
| E2 | `DiamondSixOperations` | 4 | Refine the actual hypercover and descent exports to the geometric presentation used by ECD 22.16–22.18: every small v-stack admits an augmented simplicial v-hypercover by quasiseparated locally spatial diamonds, with matching v-cover maps; |
| E2 | `HabiroCohomologyFoundations--HQ.1-2` | 1 | Sheaves valued in a complete enhanced stable module category and its E∞-algebra category extend uniquely from the affine étale basis by covering Čech descent, with section objects given by limits; |
| E2 | `HodgeTateAndCanonicalSubgroups--T6` | 5 | R lim_n vanishing for inverse systems on X_prokét whose terms are (almost) acyclic on a basis, as in Scholze 2013 Lemma 3.18. |
| E2 | `InverseGaloisAndArithmeticFundamentalGroups` | 4 | The replete pro-étale topos and its inverse-limit/descent input used for local systems; |
| E2 | `InverseGaloisAndArithmeticFundamentalGroups` | 3 | Finite-coefficient constructible sheaves, compact support, proper base change and the relative normal-crossings local-acyclicity maps in the finite Hurwitz range. |
| E2 | `MotivicEtaleKTheory--M.5d` | 1 | Hypercover and Postnikov/hypercompletion descent for the actual finite-coefficient étale K spectrum sheaf, with bounded/finite-cd hypotheses where required; |
| E2 | `PrismaticCohomology--PR.0` | 5 | Čech descent in a topos: for a sheaf of abelian groups (or a bounded-below complex) F and an object X_0 covering the final object, RΓ(𝒳,F) ≃ R lim RΓ(X_0^•,F) over the Čech nerve (Stacks 07JM in the generality of a topos); |
| E2 | `PrismaticCohomology--PR.0` | 6 | Sheafification and hyperdescent for presheaves of complexes, the pro-étale topos and its repleteness (derived limits of surjective towers), pushforward along maps of sites and its commutation with R lim. |
| E2 | `PrismaticCohomology--PR.0` | 1 | Čech descent for a weakly final object: for a topos with a weakly final object X_0 with Čech nerve X_0^•, RΓ(X, F) ≃ Rlim RΓ(X_0^•, F) (the argument of Stacks project, Tag 07JM, as used in BS22 Construction 4.18). |
| E2 | `PrismaticCohomology--PR.0` | 1 | Derived sections of a sheaf of modules on an essentially small site satisfy hyperdescent. |
| E2 | `SchemeKTheoryOperations` | 4 | Part II: enhanced descendable-algebra descent and Noetherian h-cover descendability (BS17 Th11.12/Prop11.25), then the perfect-scheme h-to-v argument with truncated strata and hypercover uniform bounds. |
| E2 | `SchemeKTheoryOperations` | 1 | General regular cd-structure excision-versus-Čech-descent criterion with AHW Th3.2.5’s four axioms; |
| E3 | `DiamondEtaleCohomology--C0` | 2 | HTT 5.5.3.12–5.5.3.13: a small limit of presentable ∞-categories along colimit-preserving functors, computed in Cat_∞, is presentable and the projections preserve colimits; |
| E3 | `DiamondEtaleCohomology--C8` | 2 | Identify preservation of coproducts by exact derived Hom with the enhanced compactness criterion (an exact functor between the relevant stable cocomplete categories that preserves coproducts preserves all small colimits), and supply the cutoff comparisons for … |
| E3 | `DiamondSixOperations` | 1 | Neeman coproduct criterion with its compact-generation hypotheses: for an exact left adjoint L between compactly generated triangulated homotopy categories of the relevant presentable stable categories, its right adjoint preserves coproducts iff L carries … |
| E3 | `GeometricSatakeAndFusion--GS0` | 2 | Enhanced coherent composition of pull–push correspondences with external tensor, higher associativity/unit maps and Ind extension, compatible with DSO exchange/pasting and VS0 Artin descent. |
| E3 | `HabiroRings` | 3 | Reflective full subcategories of presentable ∞-categories with their adjunction data (stage text: 'Construct accessible localizations and reflective/coreflective full subcategories in the applicable presentable categories'), for the reflective subcategory … |
| E3 | `HabiroRings--HR.2` | 1 | Accessible reflective full subcategories of presentable stable categories, with enhanced adjunction and uniqueness. |
| E3 | `HabiroRings--HR.3` | 3 | For the accessible reflective completion subcategories, supply coherent adjunction units, counits, mates and their identity/composition/pasting laws. |
| E3 | `MotivicEtaleKTheory--M.5d` | 2 | Coherent diagrams, geometric realization and pointwise Kan/colimit constructions on the concrete spectrum category supplied by H.5, preserving the whole filtered K-support diagram. |
| E3 | `PrismaticCohomology--PR.0` | 3 | Left Kan extension of functors from finitely generated polynomial algebras (p-completed) to derived p-complete simplicial (animated) algebras with values in a complete filtered derived category, commuting with cofibres and with sifted colimits; |
| E3 | `PrismaticCohomology--PR.0` | 3 | Left Kan extension of functors on animated rings from polynomial or smooth algebras, and the criterion that a functor commuting with sifted colimits is left Kan extended from finitely generated polynomial algebras. |
| E3 | `PrismaticCohomology--PR.0` | 1 | Left Kan extension of functors on p-completely smooth O_C-algebras, with values in derived (p,[p]_q)-complete E_1- and E_∞-A_inf-algebras, to derived p-complete simplicial O_C-algebras, and its naturality for natural transformations. |
| E3 | `PrismaticCohomology--PR.0` | 1 | Limits of diagrams of ∞-categories indexed by a category (for D_perf(X_Δ, O_Δ) = lim D_perf(A)), their computation by a cosimplicial limit over the Čech nerve of a cover, and sheaves of ∞-categories on a site. |
| E3 | `RefinedTraceMethods--RT.1` | 3 | Left AND right coherent Kan extensions along BG→* for a small group anima G, in Sp and D(R), with orbits⊣trivial⊣fixed and pointwise slice formulas; |
| E3 | `RefinedTraceMethods--RT.1` | 4 | Coherent left/right Kan extensions along arbitrary small maps needed here, specifically BG→* for a group anima and projections/slices of arbitrary space-indexed diagrams; |
| E4 | `AInfCohomology--AI.6` | 6 | Completed extension of scalars along a map of rings with ideals (R,I)→(S,J): K↦K⊗̂^L_RS, the derived J-completion of K⊗^L_RS, with values in derived J-complete S-modules (commutative algebra objects when K is one), its transitivity, and its agreement with the … |
| E4 | `CohomologyComparisons` | 9 | Derived completed tensor products, derived inverse limits, filtered stable/enhanced symmetric monoidal cohomology and sheaf hyperdescent, with Tor/ML and perfectness criteria. |
| E4 | `HabiroCohomologyFoundations--HQ.1` | 1 | Derived completion at a finitely generated ideal in the enhanced setting, with the fracture square for a principal ideal and the detection principle for complete objects; |
| E4 | `LefschetzPencilsAndVanishingCycles--LPV.0` | 2 | Derived adic completion/realization of compatible Z/ℓ^r complexes with uniform amplitude, derived inverse-limit control and rationalization; |
| E4 | `SchemeKTheoryOperations` | 3 | Witt coefficient completion/effectivity and finite-level comparison needed to deduce separate v-hyperdescent for Perf(W_n(X)), Perf(W(X)) and Perf(W(X) on X); |
| E4 | `SchemeKTheoryOperations` | 1 | Formal Witt perfect complexes: derived p-completed enhancement on W(X), Zariski gluing of affine perfect W(R)-complexes, and the p-supported subcategory comparison with the ordinary affine Spec W(R) model. |
| E5 | `AInfCohomology--AI.0` | 1 | Supply coherent E_infinity algebra objects, lax symmetric monoidal localization and the characteristic-two Sq^0 test for the noncommutative q-model; |
| E5 | `HabiroCohomologyFoundations--HQ.1` | 7 | Derived commutative algebras in the sense of Raksit, their filtered, graded and differential graded variants, and the fact that limits and colimits in them are computed on underlying objects. |
| E5:abstract | `ExcursionOperatorsAndSpectralAction--ES0` | 12 | Enhanced exact endofunctor/mapping categories, Lambda-linear E_2 endomorphisms of the identity and their commutative pi_0, coherent finite-set action anima; |
| E5:abstract | `HabiroCohomologyFoundations--HQ.1` | 6 | (1) Symmetric monoidal localisations (Lurie, Higher Algebra, 2.2.1.9) and the oplax symmetric monoidal structure on a left adjoint of a symmetric monoidal functor; |
| E5:abstract | `HabiroRings` | 5 | Symmetric monoidal ∞-categories and monoidal localisations (stage text: 'Construct symmetric monoidal infinity categories via coCartesian fibrations over finite pointed sets, Segal conditions, operadic algebras, modules and monoidal functors with their … |
| E5:abstract | `HabiroRings--HR.2` | 5 | Import module-objects and algebra-objects; |
| E5:abstract | `HabiroRings--HR.3` | 3 | For an accessible localization L of a presentable stable symmetric monoidal category whose tensor preserves colimits separately, if L(x⊗y)→L(L(x)⊗y) is an equivalence, construct the monoidal localization on the full sub-operad, with unit L(1) and tensor … |
| E5:abstract | `HabiroRings--HR.4` | 2 | Supply actual E∞-B-algebra objects, their equivalences and mapping spaces, the complete-base action, and compatibility of forgetful functors with the finite completion/section limits already requested by HR.3. |
| E5:abstract | `LanglandsParameterStacks` | 7 | Small stable infinity-categories with exact monoidal functors, endofunctors, equivariant objects, idempotent completion and coherent finite-set data. |
| E5:abstract | `PrismaticCohomology--PR.0` | 1 | The stable presentably symmetric monoidal category of complete complexes and its commutative algebras and modules. |
| E5:abstract | `RefinedTraceMethods--RT.1` | 1 | Coherent localization of unbounded dg Λ-modules at underlying b-quasi-isomorphisms and the resulting Mod_Λ(D(k)), including tensor/derived Hom; |
| E5:abstract | `RefinedTraceMethods--RT.1` | 5 | Accessible presentable stable infinity categories with their coherent functor categories, mapping-space homotopy pullbacks, adjunctions and inverse towers; |
| E5:abstract | `RefinedTraceMethods--RT.1` | 1 | Coherent stable Verdier localization, filtered-cofiber mapping-spectrum formula (NS I.3.3(ii)), Ind realization, and the symmetric monoidal quotient of a thick tensor ideal (NS I.3.6). |
| E5:abstract | `RefinedTraceMethods--RT.1` | 1 | Generic spectral Day convolution on a small symmetric monoidal ∞-category, and the monoidal accessible localization criterion: the localization relations are stable under tensoring with representables, so the product descends and the right-adjoint inclusion … |
| E5:abstract | `StableHomotopyKTheory` | 2 | The little-cubes ∞-operads E_n (Lurie, Higher Algebra §5.1) with E_n-algebras in an E_m-monoidal ∞-category for n ≤ m, and stably E_m-monoidal stable ∞-categories (tensor product exact in each variable), as used to state Burklund's Theorems 1.1–1.5; |
| E5:presentability | `ExcursionOperatorsAndSpectralAction--ES0` | 16 | Ind mapping-object equivalence for exact functors, relative tensor/base-change module categories, Barr–Beck comparisons, compact objects under coordinate-algebra colimits, and the f-localization telescope Hom formula. |
| E5:presentability | `GeometricSatakeAndFusion--GS0` | 1 | Lurie HA 1.4.4.11 extension of a generated t-structure to the Ind category, with the small stable generators, closure and accessibility hypotheses checked for the relative perverse category. |
| E5:presentability | `HabiroCohomologyFoundations--HQ.1` | 1 | Actions of a finite group on an object of a stable ∞-category and their homotopy fixed points, functorially, for the μ_{p−1}-fixed points defining the p-tilde-de Rham complex. |
| E5:presentability | `HabiroRings` | 1 | Presentable ∞-categories (E5:presentability/presentable-categories), the setting Pr^L_st of HR.3's descent principle. |
| E5:presentability | `HabiroRings--HR.3` | 1 | For the size range of D(A[q]) and its accessible complete subcategories, construct Pr^L_st and Pr^R_st and their adjoint-reversal equivalence, natural on diagrams (HTT 5.5.3.4). |
| E5:presentability | `LanglandsParameterStacks` | 19 | Ind-completion/compact objects; |
| E5:presentability | `RefinedTraceMethods--RT.1` | 2 | Cocomplete presentable stable categories and filtered-colimit-compatible t-structures with actual truncation fiber sequences; |
| E5:presentability | `RefinedTraceMethods--RT.5` | 18 | Construct PrL_st and E-linear presentable stable modules with coherent tensor, internal Hom, left/right duals, strongly continuous adjoints, and the left-adjoint Yoneda embedding for dualizable categories. |
| E5:presentability | `VStackSheavesAndLisseCategories` | 1 | Λ-linear categorical tensor of compactly generated presentable stable infinity categories and the criterion identifying it from exterior compact generators and Hom tensor comparison; |
| E5:animation | `ExcursionOperatorsAndSpectralAction--ES0` | 2 | Animation of finite Q-torsor sets over BQ and the sifted free-group resolution BGamma = colim_(F_n->Gamma) BF_n with its animated algebra compatibility. |
| E5:animation | `LanglandsParameterStacks` | 8 | Animated rings, derived affine mapping/zero loci, derived fpqc quotient stacks, QCoh and Perf with pullback/descent on [X/G], reusing SF.1 and S.1/E1; |
| E5:animation | `PerfectoidQuotients` | 2 | Supply corrected simplicial commutative/animated-ring and sifted left-Kan-extension carriers at the imported nodes. |
| E5:animation | `PrismaticCohomology--PR.0` | 1 | The ∞-category of animated commutative Ā-algebras and its universal property: a functor on finitely generated polynomial algebras extends uniquely to a sifted-colimit-preserving functor on animated algebras. |
| E5:animation | `PrismaticCohomology--PR.8` | 1 | Animated (simplicial) commutative rings and sifted left Kan extension from polynomial algebras; |
| E5:spectra-comparison | `HabiroRings--HR.2` | 1 | HA 7.1.2.13: Mod_{H(A)}≃D(A) with A-relative symmetric monoidal comparison and change-of-scalars. |
| E5:spectra-comparison | `MotivicEtaleKTheory--M.5d` | 2 | Comparison of the concrete H.5 spectrum objects with the EDS stable enhancement, including the Eilenberg–Mac Lane and spectral-sheaf realization interfaces. |
| E5:spectra-comparison | `RefinedTraceMethods--RT.1` | 3 | The comparison of concrete spectra (StableHomotopyKTheory H.5) with the abstract stable symmetric monoidal ∞-categories of E5:abstract: Sp as a presentably symmetric monoidal stable ∞-category, and Mod_{HR}(Sp) ≃ D(R) symmetric monoidally for a commutative … |
| E5:spectra-comparison | `RefinedTraceMethods--RT.1` | 2 | Rational E∞ ring spectra versus characteristic-zero commutative dg algebras, compatible with derived Hochschild/cyclic bar and Bott localization, identifying ku_Q with Q[β] and KU_Q with the localization Q[β^{±1}], \|β\|=2. |

The assembly lists these requests without assessing each one against the
declarations; that check belongs to the requesting roadmaps' next plan or
package, which should cite the exact declaration where one now supplies the
statement. Some requests ask for more than this plan states, for example a
termwise-flat K-flat replacement (AInfCohomology) or completed extension of
scalars along a map of rings with ideals (AInfCohomology AI.6); they remain
open. Requests that name DerivedDeRhamCohomology DD.1 for generic completion
are answered by the point-topos cases of the E4 declarations (see the
ownership table above).

## Conventions

**Grading and signs.** Cochain differentials raise degree. A heart object A has
A[1] concentrated in cohomological degree −1. Lurie's dg nerve uses homological
grading; the cohomological input is reindexed by m ↦ −m and composed with the
Koszul braiding, and the dg nerve uses degree 2−|I| for an index set I after
this reindexing. Good truncation puts cycles in degree zero, so the mapping
space of the dg nerve has π_i equal to H^(−i) of derived Hom for i ≥ 0:
negative cohomology appears in positive homotopy. Suspension, cofibres and the
rotation of distinguished triangles agree with Mathlib's cochain shift and
mapping cone; this agreement is a theorem
([`E0/stable-api-and-the-sign-comparison`](#n-e0-stable-api-and-the-sign-comparison)),
not a redefinition of the triangulated structure.

**Composition order.** Mathlib and Tau Ceti's dg API compose enriched Hom
objects in the forward order Hom(x,y)⊗Hom(y,z)→Hom(x,z). Lurie writes the later
arrow first. The comparison uses the grading reindexing and the Koszul sign on
homogeneous factors.

**Universes and cardinals.** Each small site or diagram lives in a fixed
universe, its presheaves of spaces in the next, and a large-universe Ind of a
presentable category in a further enlargement. Raising a cardinal cutoff comes
with explicit comparison functors. Local smallness means a small Kan model of
each mapping homotopy type, not small simplex sets. Presentable means
accessible at some regular cardinal with all small colimits; it never means
ω-compactly generated. Compact means ω-compact unless a cardinal is named.

**Functoriality of replacements.** Objectwise existence of K-injective or K-flat
replacements is weaker than a functorial replacement bounded by one regular
cardinal; the latter is what the enhancement needs (gap
[G0.3](#gap-g0-3)). K-injective complexes need not be closed under tensor
products, so derived tensor uses K-flat replacements.

**Inverse limits.** Repleteness is sequential: epimorphic inverse sequences
have epimorphic limit projections. It does not make all cofiltered limits
exact. Pro-zero (every stage killed by a later transition) is stronger than
vanishing limit: multiplication by p on ℤ has lim = 0 and lim¹ = ℤ_p/ℤ. For
coherent towers of complexes, a pro-isomorphism asks every cohomology tower of
the cone to be pro-zero, without a uniform stage across degrees.

**Completeness.** Hypercompleteness (descent along all hypercovers) and
Postnikov completeness (convergence and effectivity of Postnikov towers) are
different. Derived completeness of a complex is tested on every slice and every
local section of the ideal, and on every integer shift of a localization
generator. Recovery of the completed unit by an infinite totalization is weaker
than descendability, which asks for a finite index.

**Stable subcategories.** Stable, thick and localizing closures are kept
apart: a stable subcategory need not be closed under retracts, and the kernel
of a Verdier quotient is the retract closure of the subcategory.

**Animated rings.** Homotopy of an animated ring is indexed homologically, so
π_n sits in cohomological degree −n. Ordinary polynomial algebras are Mathlib's
`MvPolynomial`, ordinary rings `CommRingCat`, and Witt vectors `WittVector`.

**Terminology across the parts.** Layers E0–E4 say quasicategory and E5 says
∞-category for the same objects; both mean quasicategories in the pinned
library's sense. E0's stable quasicategories and exact functors are the stable
∞-categories and exact functors of E5:abstract, whose two stable declarations
are the monoidal comparisons. E0's accessible and presentable quasicategories
(`E0/accessible-and-presentable`) are the presentable categories of
E5:presentability (`E5:presentability/presentable-categories`), which adds PrL,
PrR and their tensor product. E3's limits of presentable categories
(`E3/presentable-category-limits`) and E5's limits in PrL
(`E5:presentability/limits-of-presentable-categories`) state the same limit;
the E5 declaration adds stability and detection of colimits by the projections.
Packaging should merge each such pair into one target with the union of its
API.

**Notation.**

| Symbol | Meaning |
| --- | --- |
| N_dg(C) | the dg nerve of a dg category C |
| Hom^R_C(x,y), Map_C(x,y) | the right mapping space of a quasicategory, and the mapping space up to equivalence |
| Fun(K,C) | the functor quasicategory (simplicial internal Hom) |
| C_/p, C_p/ | cone and cocone categories of a diagram p, via the join K⋆L |
| Cat∞, Spaces | the quasicategories of small quasicategories and of Kan complexes |
| D∞(O), D(X,R) | the enhanced unbounded derived category of a ringed site or topos |
| ⊗ᴸ, RHom, RℋOM | derived tensor, derived Hom complex, derived internal Hom |
| τ≤n, τ≥n | truncations (cohomological indexing) |
| Rlim | the coherent derived inverse limit, fib(1−s) on the product |
| T(K,x) | the tower K ← K ← ⋯ with every transition multiplication by x |
| Dcomp(X,R,I), L_I, ⊗̂ | derived I-complete sheaves, the completion reflector, completed tensor |
| Red, Rec | reduction to the system (K⊗ᴸR/I^n)_n and inverse-limit reconstruction |
| Dqc(X), Perf(X) | quasicoherent derived sheaves and perfect complexes on a scheme |
| N(Fin_*) | the nerve of finite pointed sets ⟨n⟩ |
| Alg_O(C), CAlg(C), LMod_A(M) | operadic algebras, commutative algebras, left modules |
| Ind_κ(C), C^κ | κ-filtered colimits of representables, and κ-compact objects |
| PrL, PrR | presentable categories with colimit-preserving functors, and with accessible right adjoints |
| PΣ(C), AnimAlg_R | the nonabelian derived category and animated commutative R-algebras |

**The suggested file.** `HEquiv` in the E5 section is only the
homotopy-category consequence of an ∞-equivalence. Data structures there
record carriers and maps without the cocartesian, operadic, accessibility or
coherence axioms, which are omitted rather than replaced by
proposition-valued fields. The E0–E4 section uses Mathlib's `SSet.QCat`; the
E5 section uses a fixed-universe subtype `QCat` of `SSet`. Unifying the two
carriers is a packaging task.

## Sources

Page numbers in the declarations refer to the copy named here. Some works are
listed by both parts. HA and HTT are the same author PDFs in both; HTT's PDF
pages run 18 ahead of its printed pages, and nearly every HTT locator says
which it gives. Bhatt–Scholze's Witt vector paper is
`BhattScholze-WittGrassmannian` in E0–E4 and `BS17` in E5, the same author
PDF. The pro-étale paper is cited from arXiv v2 and from a public author copy
with a different file hash (both 100 pages, PDF page equal to printed page).
*Étale cohomology of diamonds* is cited from arXiv v4 in E0–E4 and from the
author PDF in E5, so its page numbers refer to the copy of the citing part.
Bhatt's direct summand paper is cited from arXiv in both (v2 in E5).

Sources cited by layers E0–E4:

- <a id="src-e0-lurie-ha"></a>**Higher Algebra**, Jacob Lurie. Author-hosted PDF dated September 18, 2017; 1553 pages. PDF page = printed page. <https://www.math.ias.edu/~lurie/papers/HA.pdf> (SHA-256 `112b145a95a6…`)
- <a id="src-e0-lurie-htt"></a>**Higher Topos Theory**, Jacob Lurie. Author PDF dated 9 April 2017; locators explicitly use PDF page numbers, which are 18 ahead of the main printed pagination. <https://www.math.ias.edu/~lurie/papers/HTT.pdf> (SHA-256 `58855f3a0ad6…`)
- <a id="src-e0-bhattscholze-proetale"></a>**The pro-etale topology for schemes**, Bhargav Bhatt, Peter Scholze. arXiv:1309.1198v2 [math.AG], 17 December 2014; 100 pages. PDF page = printed page. <https://arxiv.org/abs/1309.1198> (SHA-256 `ae0960a28f0f…`)
- <a id="src-e0-liuzheng-sixoperations"></a>**Enhanced six operations and base change theorem for higher Artin stacks**, Yifeng Liu, Weizhe Zheng. arXiv:1211.5948; the version downloaded in this session. Section numbering differs from the published version: the material the roadmap cites as section 2 appears here around Definition 3.2.1. <https://arxiv.org/abs/1211.5948> (SHA-256 `ceac019a2be7…`)
- <a id="src-e0-bhattscholze-author-20260926"></a>**The pro-étale topology for schemes**, Bhargav Bhatt and Peter Scholze. Public author copy, 100 pages; printed page equals PDF page. Distinct hash from the inherited arXiv v2. Not identified as the version of record. <https://people.mpim-bonn.mpg.de/scholze/proetale.pdf> (SHA-256 `99b418b32846…`)
- <a id="src-e0-stacks-0d6l"></a>**The Stacks Project, Tag 0D6L**, The Stacks Project Authors. Live HTML tag, read 2026-09-26; no fixed source commit asserted. <https://stacks.math.columbia.edu/tag/0D6L>
- <a id="src-e0-stacks-0d6m"></a>**The Stacks Project, Tag 0D6M**, The Stacks Project Authors. Live HTML tag, read 2026-09-26; no fixed source commit asserted. <https://stacks.math.columbia.edu/tag/0D6M>
- <a id="src-e0-stacks-0d6n"></a>**The Stacks Project, Tag 0D6N**, The Stacks Project Authors. Live HTML tag, read 2026-09-26; no fixed source commit asserted. <https://stacks.math.columbia.edu/tag/0D6N>
- <a id="src-e0-stacks-0d6p"></a>**The Stacks Project, Tag 0D6P**, The Stacks Project Authors. Live HTML tag, read 2026-09-26; no fixed source commit asserted. <https://stacks.math.columbia.edu/tag/0D6P>
- <a id="src-e0-stacks-0bkv"></a>**The Stacks Project, Tag 0BKV**, The Stacks Project Authors. Live HTML tag, read 2026-09-26; no fixed source commit asserted. <https://stacks.math.columbia.edu/tag/0BKV>
- <a id="src-e0-stacks-0d6k"></a>**The Stacks Project, Tag 0D6K**, The Stacks Project Authors. Live HTML tag, read 2026-09-26; no fixed source commit asserted. <https://stacks.math.columbia.edu/tag/0D6K>
- <a id="src-e0-stacks-08u1"></a>**The Stacks Project, Tag 08U1**, The Stacks Project Authors. Live HTML tag, read 2026-09-26; no fixed source commit asserted. <https://stacks.math.columbia.edu/tag/08U1>
- <a id="src-e0-stacks-08u5"></a>**The Stacks Project, Tag 08U5**, The Stacks Project Authors. Live HTML tag, read 2026-09-26; no fixed source commit asserted. <https://stacks.math.columbia.edu/tag/08U5>
- <a id="src-e0-scholze-diamonds-v4-e4"></a>**Étale cohomology of diamonds**, Peter Scholze. arXiv:1709.07343v4; printed pp. 161–163, §26. Version of record not collated. <https://arxiv.org/pdf/1709.07343v4> (SHA-256 `78ca42bba46f…`)
- <a id="src-e0-stacks-project"></a>**The Stacks Project, Cohomology on Sites**, The Stacks Project authors. Public author/preprint copy inspected 2026-10-09; locators specify printed or PDF page where they differ. <https://stacks.math.columbia.edu/download/sites-cohomology.pdf> (SHA-256 `f1af633f357c…`)
- <a id="src-e0-stacks-simplicialspaces"></a>**The Stacks Project, Simplicial Spaces**, The Stacks Project authors. Public author/preprint copy inspected 2026-10-09; locators specify printed or PDF page where they differ. <https://stacks.math.columbia.edu/download/spaces-simplicial.pdf> (SHA-256 `9fdc09a5e648…`)
- <a id="src-e0-bhattscholze-wittgrassmannian"></a>**Projectivity of the Witt vector affine Grassmannian**, Bhargav Bhatt and Peter Scholze. Public author/preprint copy inspected 2026-10-09; locators specify printed or PDF page where they differ. <https://people.mpim-bonn.mpg.de/scholze/Witt.pdf> (SHA-256 `774032c0daee…`)
- <a id="src-e0-bhatt-directsummand"></a>**On the direct summand conjecture and its derived variant**, Bhargav Bhatt. Public author/preprint copy inspected 2026-10-09; locators specify printed or PDF page where they differ. <https://arxiv.org/pdf/1608.08882> (SHA-256 `08578ca15b17…`)
- <a id="src-e0-scholze-etalediamonds"></a>**Étale cohomology of diamonds**, Peter Scholze. Public author/preprint copy inspected 2026-10-09; locators specify printed or PDF page where they differ. <https://arxiv.org/pdf/1709.07343v4> (SHA-256 `78ca42bba46f…`)
- <a id="src-e0-bhattetal-mmp"></a>**Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic**, Bhatt et al.. Public author/preprint copy inspected 2026-10-09; locators specify printed or PDF page where they differ. <https://arxiv.org/pdf/2012.15801> (SHA-256 `533218825ca5…`)
- <a id="src-e0-stacks-derived-categories"></a>**The Stacks Project, Derived Categories**, The Stacks Project authors. Public chapter downloaded 2026-10-09; PDF pagination. <https://stacks.math.columbia.edu/download/derived.pdf> (SHA-256 `3d6c5169149c…`)
- <a id="src-e0-stacks-morealgebra"></a>**The Stacks Project, More on Algebra**, The Stacks Project Authors. Public PDF downloaded 2026-10-11 <https://stacks.math.columbia.edu/download/more-algebra.pdf> (SHA-256 `ab69179738e6…`)

Sources cited by layers E5:

- <a id="src-e5-lurie-ha"></a>**Higher Algebra**, Jacob Lurie. 18 September 2017; printed and PDF pages agree. <https://www.math.ias.edu/~lurie/papers/HA.pdf> (SHA-256 `112b145a95a6…`)
- <a id="src-e5-lurie-htt"></a>**Higher Topos Theory**, Jacob Lurie. 9 April 2017 author PDF; PDF page is printed page plus 18. <https://www.math.ias.edu/~lurie/papers/HTT.pdf> (SHA-256 `58855f3a0ad6…`)
- <a id="src-e5-bs17"></a>**Projectivity of the Witt vector affine Grassmannian**, Bhargav Bhatt and Peter Scholze. Author PDF; printed and PDF pages agree. <https://people.mpim-bonn.mpg.de/scholze/Witt.pdf> (SHA-256 `774032c0daee…`)
- <a id="src-e5-ns18"></a>**On topological cyclic homology**, Thomas Nikolaus and Peter Scholze. Author PDF; appendix numbering A and B; printed and PDF pages agree. <https://people.mpim-bonn.mpg.de/scholze/CyclotomicSpectra.pdf> (SHA-256 `fa6711a21c99…`)
- <a id="src-e5-bm26"></a>**Berkovich Motives**, Peter Scholze. Author PDF; printed and PDF pages agree. <https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf> (SHA-256 `23a34fdedb92…`)
- <a id="src-e5-mathew"></a>**The Galois group of a stable homotopy theory**, Akhil Mathew. Downloaded arXiv PDF; printed and PDF pages agree. <https://arxiv.org/pdf/1404.2156> (SHA-256 `c5304ca64c64…`)
- <a id="src-e5-ramzidual"></a>**Dualizable presentable infinity-categories**, Maxime Ramzi. v1, 28 October 2024; printed and PDF pages agree. <https://arxiv.org/pdf/2410.21537v1> (SHA-256 `b1af2c1335d5…`)
- <a id="src-e5-ramzirigid"></a>**Locally rigid infinity-categories**, Maxime Ramzi. v2, 9 February 2026; numbering differs from v1. <https://arxiv.org/pdf/2410.21524v2> (SHA-256 `6c881bfa001b…`)
- <a id="src-e5-robalo"></a>**K-theory and the bridge from motives to noncommutative motives**, Marco Robalo. Downloaded arXiv PDF; printed and PDF pages agree. <https://arxiv.org/pdf/1206.3645> (SHA-256 `604edce59fa9…`)
- <a id="src-e5-fs21"></a>**Geometrization of the local Langlands correspondence**, Laurent Fargues and Peter Scholze. Author PDF. Cite printed page numbers: IV.2.20 is printed/PDF p. 123, while X.1.1–2 are printed pp. 341–342 (PDF pp. 368–369). Inserted pages prevent a single global offset. <https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf> (SHA-256 `9ab9efbd0df2…`)
- <a id="src-e5-diamonds"></a>**Étale cohomology of diamonds**, Peter Scholze. Author PDF; printed and PDF pages agree. <https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf> (SHA-256 `4ce3d1232a6e…`)
- <a id="src-e5-bhatt18"></a>**On the direct summand conjecture and its derived variant**, Bhargav Bhatt. arXiv v2; printed and PDF pages agree. <https://arxiv.org/pdf/1608.08882v2> (SHA-256 `08578ca15b17…`)
- <a id="src-e5-efimov"></a>**K-theory and localizing invariants of large categories**, Alexander I. Efimov. arXiv v4, 5 October 2026; printed and PDF pages agree. BM26 cites earlier Proposition 1.72; the relevant v4 result is Proposition 2.70. <https://arxiv.org/pdf/2405.12169v4> (SHA-256 `9ba8f87032b5…`)


## What the pinned libraries have

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau
Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every declaration below was read
in its source file at those commits; a near miss (a special case, another
generality or another convention) is cited as an input with the reduction in
the citing declaration's proof, never as the target itself.

| Declaration | Module | What it provides here | Cited in |
| --- | --- | --- | --- |
| `mathlib:CategoryTheory.Abelian` | `Mathlib/CategoryTheory/Abelian/Basic.lean` | Abelian categories. The module sheaves form one, and the derived category is built from it. | E0–E4 |
| `mathlib:CategoryTheory.CountableAB4Star` | `Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean` | Countable AB4*, at the pins, which is what makes the light-condensed instance work. It is the ordinary form of the exactness of countable products that Bhatt-Scholze 3.1.9 proves for replete topoi. | E0–E4 |
| `mathlib:CategoryTheory.Functor` | `Mathlib/CategoryTheory/Functor/Basic.lean` | Functors. The ordinary notion the comparison discipline refers back to. | E0–E4, E5 |
| `mathlib:CategoryTheory.Functor.IsLeftKanExtension` | `Mathlib/CategoryTheory/Functor/KanExtension/Basic.lean` | Left Kan extensions with their universal property, at the pins, for ordinary categories, together with the pointwise versions and the fully faithful case. The ordinary shadow of HTT 4.3.2. | E0–E4 |
| `mathlib:CategoryTheory.Grothendieck` | `Mathlib/CategoryTheory/Grothendieck.lean` | The Grothendieck construction, at the pins. This is the ordinary shadow of the restricted straightening comparison. | E0–E4, E5 |
| `mathlib:CategoryTheory.GrothendieckTopology` | `Mathlib/CategoryTheory/Sites/Grothendieck.lean` | Grothendieck topologies, at the pins; the sites of this family are instances. | E0–E4 |
| `mathlib:CategoryTheory.GrothendieckTopology.OneHypercover` | `Mathlib/CategoryTheory/Sites/Hypercover/One.lean` | Degree-one hypercovers used for the sheaf condition; E2 extends their matching-object interface to all simplicial degrees. | E0–E4 |
| `mathlib:CategoryTheory.HasShift` | `Mathlib/CategoryTheory/Shift/Basic.lean` | Shift functors, at the pins. The suspension of the enhancement must be identified with the cochain shift, with this convention. | E0–E4 |
| `mathlib:CategoryTheory.IsGrothendieckAbelian` | `Mathlib/CategoryTheory/Abelian/GrothendieckCategory/Basic.lean` | The Grothendieck axioms, at the pins, with an instance for sheaves of modules on small sites. That instance supplies the generator, the exactness of filtered colimits and enough injectives that the transfinite K-injective construction needs. | E0–E4 |
| `mathlib:CategoryTheory.Limits.Cocone` | `Mathlib/CategoryTheory/Limits/Cones.lean` | Cocones. The mapping-space universal property of a colimit is a statement about the space of cocones. | E0–E4 |
| `mathlib:CategoryTheory.Limits.HasFilteredColimits` | `Mathlib/CategoryTheory/Limits/Filtered.lean` | Filtered colimits, at the pins. Compact generation, accessibility and the transfinite constructions all rest on them. | E0–E4 |
| `mathlib:CategoryTheory.Limits.HasLimits` | `Mathlib/CategoryTheory/Limits/HasLimits.lean` | Existence of limits. Totalisations, inverse limits of Postnikov towers and homotopy fixed points are limits. | E0–E4 |
| `mathlib:CategoryTheory.Limits.HasZeroObject` | `Mathlib/CategoryTheory/Limits/Shapes/ZeroObjects.lean` | Zero objects, the first condition of stability. | E0–E4 |
| `mathlib:CategoryTheory.Limits.PreservesLimits` | `Mathlib/CategoryTheory/Limits/Preserves/Basic.lean` | Preservation of limits. Exactness of a functor between stable categories is preservation of finite limits. | E0–E4 |
| `mathlib:CategoryTheory.MonoidalCategory` | `Mathlib/CategoryTheory/Monoidal/Category.lean` | The 1-categorical monoidal structure; the derived tensor product's symmetric monoidal coherence is compared against it. | E0–E4, E5 |
| `mathlib:CategoryTheory.Nerve.quasicategory` | `Mathlib/AlgebraicTopology/Quasicategory/Nerve.lean` | That the nerve of an ordinary category is a quasicategory, at the pins. This is the comparison every ordinary construction is compared against. | E0–E4 |
| `mathlib:CategoryTheory.Preadditive` | `Mathlib/CategoryTheory/Preadditive/Basic.lean` | Preadditive categories. The DG categories whose nerves are taken are preadditive, and Tau Ceti's enrichment of cochain complexes is over them. | E0–E4 |
| `mathlib:CategoryTheory.Pretriangulated` | `Mathlib/CategoryTheory/Triangulated/Pretriangulated.lean` | Pretriangulated categories, at the pins, with the structure on the homotopy category of complexes. The sign comparison of E0 is made against this structure. | E0–E4 |
| `mathlib:CategoryTheory.Sheaf` | `Mathlib/CategoryTheory/Sites/Sheaf.lean` | Sheaves on a site, at the pins. | E0–E4 |
| `mathlib:CategoryTheory.Triangulated.TStructure` | `Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean` | t-structures, at the pins, including the canonical one on D(A). The truncations of the Postnikov tower are taken with it. | E0–E4 |
| `mathlib:CategoryTheory.Triangulated.TStructure.eTruncGE` | `Mathlib/CategoryTheory/Triangulated/TStructure/ETrunc.lean` | The ordinary truncation tower, together with eTruncLT; E2 compares it with coherent Postnikov towers and their derived limits. | E0–E4 |
| `mathlib:CategoryTheory.coherentTopology.epi_π_app_zero_of_epi` | `Mathlib/CategoryTheory/Sites/Coherent/SequentialLimit.lean` | Sequential limit epimorphisms for a particular topos: a sequential limit of epimorphisms of sheaves is epimorphic, for the coherent topology on a preregular finitary extensive category whose sequential limits preserve effective epimorphisms. An instance of Bhatt-Scholze's Definition 3.1.1, not the general notion. | E0–E4 |
| `mathlib:CategoryTheory.mateEquiv` | `Mathlib/CategoryTheory/Adjunction/Mates.lean` | The ordinary functor-adjunction mate correspondence. The separate Bicategory.mateEquiv supplies the general bicategorical version, which already applies to QCat. | E0–E4 |
| `mathlib:CochainComplex.IsKInjective` | `Mathlib/Algebra/Homology/HomotopyCategory/KInjective.lean` | K-injective complexes with right-orthogonality and derived-Hom detection. E1 supplies the unbounded functorial replacement and its model comparison. | E0–E4 |
| `mathlib:CommRing` | `Mathlib/Algebra/Ring/Defs.lean` | Commutative rings. The coefficient rings Lambda and their quotients Lambda/I^n. | E0–E4 |
| `mathlib:DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | The ordinary unbounded derived category, at the pins, as a 1-categorical localisation, triangulated. It is the category the enhancement's homotopy category must be identified with - the comparison the stage text demands instead of a second private carrier. | E0–E4, E5 |
| `mathlib:DerivedCategory.isIso_Q_map_iff_quasiIso` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | That a morphism of complexes becomes an isomorphism in D(A) iff it is a quasi-isomorphism. The other half. | E0–E4 |
| `mathlib:DerivedCategory.isIso_iff` | `Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean` | That a morphism of D(A) is an isomorphism iff it induces isomorphisms on all cohomology objects - cohomology sheaves when A is a sheaf category. One half of the detection package the comparison is made against. | E0–E4 |
| `mathlib:LightCondensed.epi_π_app_zero_of_epi` | `Mathlib/Condensed/Light/Epi.lean` | The corresponding sequential epimorphism theorem for light condensed modules. | E0–E4 |
| `mathlib:Module.Flat` | `Mathlib/RingTheory/Flat/Basic.lean` | Flatness. The K-flat model is the flat resolution the derived tensor product is computed on. | E0–E4 |
| `mathlib:RingTheory.Sequence.IsRegular` | `Mathlib/RingTheory/Regular/RegularSequence.lean` | REGULAR SEQUENCES, at the pins. The reconstruction theorem of E4 carries a regular-sequence hypothesis, and AUDIT-22 records that only classical adic completion and regular sequences exist, the Koszul complex being a Mathlib TODO. | E0–E4, E5 |
| `mathlib:SSet` | `Mathlib/AlgebraicTopology/SimplicialSet/Basic.lean` | Simplicial sets, the carrier of every infinity-category here and of the dg nerve. | E0–E4, E5 |
| `mathlib:SSet.InnerFibration` | `Mathlib/AlgebraicTopology/Quasicategory/InnerFibration.lean` | Inner fibrations, at the pins. The relative form of the quasicategory condition, and the setting of HTT's relative left Kan extensions. | E0–E4 |
| `mathlib:SSet.QCat.bicategory` | `Mathlib/AlgebraicTopology/Quasicategory/StrictBicategory.lean` | The HOMOTOPY 2-CATEGORY of quasicategories, at the pins. AUDIT-22 records that equivalences can be expressed in it through Bicategory.Equivalence, which is the shape the missing equivalence API should take. | E0–E4 |
| `mathlib:SSet.QCat.strictBicategory` | `Mathlib/AlgebraicTopology/Quasicategory/StrictBicategory.lean` | The strict form of the same, at the pins. | E0–E4 |
| `mathlib:SSet.Quasicategory` | `Mathlib/AlgebraicTopology/Quasicategory/Basic.lean` | QUASICATEGORIES, at the pins. The model this whole family fixes. The file itself records the universe restriction as a TODO, which is why extended universe support is E0's own obligation. | E0–E4, E5 |
| `mathlib:SSet.quasicategory_iff_innerFibration` | `Mathlib/AlgebraicTopology/Quasicategory/InnerFibration.lean` | The comparison between the absolute and relative conditions, at the pins. | E0–E4 |
| `mathlib:SheafOfModules` | `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean` | SHEAVES OF MODULES over a sheaf of rings, at the pins. AUDIT-22 marks E1's first target 'mathlib' outright on the strength of this and the next declaration, and notes that it is MORE GENERAL than the constant coefficient ring the stage asks for. | E0–E4 |
| `mathlib:SheafOfModules.restrictScalars` | `Mathlib/Algebra/Category/ModuleCat/Sheaf/ChangeOfRings.lean` | UNDERIVED change of coefficients, at the pins. AUDIT-22 names it as what exists; the derived version and the monoidal structure are E1's obligation. | E0–E4 |
| `mathlib:CategoryTheory.SimplicialNerve` | `Mathlib/AlgebraicTopology/SimplicialNerve.lean` | Existing homotopy-coherent simplicial nerve of a simplicially enriched category, using enriched functors from simplicial thickenings. This is not the ordinary categorical nerve. | E0–E4 |
| `mathlib:CategoryTheory.Abelian.DoldKan.equivalence` | `Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean` | Equivalence between simplicial objects of an abelian category and nonnegative chain complexes. This alone does not supply the lax monoidal comparison needed to transport enriched composition. | E0–E4 |
| `tauceti:TauCeti.linearHomComplexEnrichedCategory` | `TauCeti/Algebra/Homology/LinearHomComplex/Enrichment.lean` | Cochain complexes in an R-linear preadditive category enriched in cochain complexes of R-modules; enriched composition has Mathlib factor order and the Koszul braiding. | E0–E4 |
| `mathlib:CategoryTheory.ObjectProperty.IsSerreClass` | `Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean` | Strong Serre closure requires closure under every subobject and quotient. It is a compatibility countercheck, not an instance supplied for derived-complete modules. | E0–E4 |
| `mathlib:SSet.KanComplex` | `Mathlib/AlgebraicTopology/SimplicialSet/KanComplex.lean` | The genuine all-horn fibrancy predicate on simplicial sets; Kan spaces are quasicategories by the pinned instance. | E0–E4 |
| `mathlib:CochainComplex` | `Mathlib/Algebra/Homology/HomologicalComplex.lean` | The abbreviation HomologicalComplex C (ComplexShape.up α); for α=ℤ the differential raises cohomological degree. | E0–E4 |
| `mathlib:CategoryTheory.Bicategory.mateEquiv` | `Mathlib/CategoryTheory/Bicategory/Adjunction/Mate.lean` | For two bicategorical adjunctions, maps g≫l₂→l₁≫h are equivalent to maps r₁≫g→h≫r₂, with the unit/counit pasting formula. It specializes to the existing QCat bicategory. | E0–E4 |
| `mathlib:CategoryTheory.Bicategory.mateEquiv_vcomp` | `Mathlib/CategoryTheory/Bicategory/Adjunction/Mate.lean` | Vertical pasting of left-adjoint squares maps to vertical pasting of their mates; supplies the finite QCat law directly. | E0–E4 |
| `mathlib:PerfectRing` | `Mathlib/FieldTheory/Perfect.lean` | Bijectivity of x↦x^p, with separate characteristic/prime hypotheses; this is the perfect F_p-ring predicate, not Bass perfectness. | E0–E4 |
| `mathlib:frobeniusEquiv` | `Mathlib/FieldTheory/Perfect.lean` | For a commutative semiring of exponential characteristic p with PerfectRing R p, the Frobenius ring automorphism and inverse roots. | E0–E4 |
| `mathlib:HomologicalComplex.monoidalCategory` | `Mathlib/Algebra/Homology/Monoidal.lean` | The existing signed total tensor on cochain complexes, with its zero/coproduct/additive tensor hypotheses. Module complexes reuse it; no second totalization definition is needed. | E0–E4 |
| `mathlib:CategoryTheory.Tor` | `Mathlib/CategoryTheory/Monoidal/Tor.lean` | Left derived functors of tensor in its second variable for an abelian monoidal category with projective resolutions. Tor versus Tor' and K-flat comparisons are additional interfaces, not asserted by this declaration. | E0–E4 |
| `mathlib:CategoryTheory.HasProjectiveDimensionLE` | `Mathlib/CategoryTheory/Abelian/Projective/Dimension.lean` | The existing Ext-vanishing projective-dimension predicate; compare with the explicit finite free/projective resolutions before using the perfection bound. | E0–E4 |
| `mathlib:ModuleCat.projectiveDimension_eq_of_linearEquiv` | `Mathlib/Algebra/Category/ModuleCat/ProjectiveDimension.lean` | Projective dimension is invariant under a linear equivalence, including different module universes over a small ring. | E0–E4 |
| `mathlib:Bornology.IsBounded` | `Mathlib/Topology/Bornology/Basic.lean` | The bounded-set predicate, used directly for submodules of a finite normed power; no private one-line bound predicate. | E0–E4 |
| `mathlib:isBounded_iff_forall_norm_le'` | `Mathlib/Analysis/Normed/Group/Bounded.lean` | The norm upper-bound criterion in the explicit multiplicative declaration, together with its generated additive counterpart; boundedness of a finite normed power is compared with one common coordinate bound. | E0–E4 |
| `mathlib:ValuationSubring` | `Mathlib/RingTheory/Valuation/ValuationSubring.lean` | A subring of a field containing x or its inverse for every field element, with its commutative-ring and valuation-ring instances. | E0–E4 |
| `mathlib:Small` | `Mathlib/Logic/Small/Defs.lean` | Universe-relative smallness and transport to Shrink; used for mapping models and generator families. | E0–E4 |
| `mathlib:Cardinal.IsRegular` | `Mathlib/SetTheory/Cardinal/Regular.lean` | Infinite regular cardinal, including its infinitude; used for higher filteredness. | E0–E4 |
| `mathlib:CategoryTheory.Triangulated.TStructure.truncLE` | `Mathlib/CategoryTheory/Triangulated/TStructure/TruncLEGT.lean` | The ordinary ≤n truncation, with the existing t-structure and shift/additivity hypotheses. | E0–E4 |
| `mathlib:CategoryTheory.Triangulated.TStructure.truncLEι` | `Mathlib/CategoryTheory/Triangulated/TStructure/TruncLEGT.lean` | The canonical natural transformation τ≤n→identity, in the direction needed for the degree-zero base-change map. | E0–E4 |
| `mathlib:ExteriorAlgebra.exteriorPower` | `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean` | Existing exterior powers as submodules of the exterior algebra, for arbitrary modules over a commutative ring. | E0–E4 |
| `mathlib:exteriorPower.ιMulti` | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean` | The universal alternating wedge map into the existing exterior power. | E0–E4 |
| `mathlib:exteriorPower.alternatingMapLinearEquiv` | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean` | Universal linear equivalence from alternating maps to linear maps on exterior powers; used for contraction. No Koszul differential is supplied by this declaration. | E0–E4 |
| `mathlib:CategoryTheory.IsSifted` | `Mathlib/CategoryTheory/Limits/Sifted.lean` | Ordinary nonempty sifted categories; higher cofinality is separately checked. | E5 |
| `mathlib:CategoryTheory.Ind` | `Mathlib/CategoryTheory/Limits/Indization/Category.lean` | Ordinary Ind-objects as filtered colimits of set-valued representables. This is not the space-valued infinity-categorical completion. | E5 |
| `mathlib:CategoryTheory.Idempotents.Karoubi` | `Mathlib/CategoryTheory/Idempotents/Karoubi.lean` | The ordinary category of objects equipped with idempotent endomorphisms. | E5 |
| `mathlib:Algebra.Extension.H1Cotangent` | `Mathlib/RingTheory/Extension/Cotangent/Basic.lean` | The kernel of the presentation cotangent differential; only the low-degree naive comparison, not the full cotangent complex. | E5 |
| `mathlib:MvPolynomial` | `Mathlib/Algebra/MvPolynomial/Basic.lean` | The existing polynomial ring in a specified variable type. | E5 |
| `mathlib:CategoryTheory.SymmetricCategory` | `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean` | The symmetry law for the ordinary monoidal comparison. | E5 |
| `mathlib:WittVector` | `Mathlib/RingTheory/WittVector/Defs.lean` | The existing p-typical Witt vector carrier and coordinates; derived adapters use this carrier degreewise. | E5 |
| `mathlib:CommRingCat` | `Mathlib/Algebra/Category/Ring/Basic.lean` | Bundled ordinary commutative rings and ring homomorphisms. | E5 |
| `mathlib:CategoryTheory.SimplicialObject` | `Mathlib/AlgebraicTopology/SimplicialObject/Basic.lean` | Functors from the opposite simplex category; used for simplicial commutative rings. | E5 |
| `mathlib:CategoryTheory.IsFiltered` | `Mathlib/CategoryTheory/Filtered/Basic.lean` | Ordinary filtered categories: nonempty, common targets for pairs of objects and eventual equalization of parallel maps. The prototype uses their nerves as indexing shapes; higher filteredness still belongs to E0. | E5 |
| `mathlib:CategoryTheory.Functor.ReflectsIsomorphisms` | `Mathlib/CategoryTheory/Functor/ReflectsIso/Basic.lean` | The ordinary conservativity condition for the homotopy-category shadow of the Barr–Beck right adjoint. | E5 |
| `mathlib:TrivSqZeroExt` | `Mathlib/Algebra/TrivSqZeroExt/Basic.lean` | The existing trivial square-zero extension carrier; its fstHom gives the dual-number augmentation in the nonregular cotangent test. | E5 |
| `mathlib:SSet.HomotopyCategory` | `Mathlib/AlgebraicTopology/SimplicialSet/HomotopyCat.lean` | The existing homotopy category of a simplicial set, formed from its two-truncation; used directly as the prototype carrier. | E5 |
| `mathlib:SSet.mapHomotopyCategory` | `Mathlib/AlgebraicTopology/SimplicialSet/HomotopyCat.lean` | The existing ordinary functor induced on homotopy categories by a map of simplicial sets. | E5 |
| `mathlib:CategoryTheory.isIsomorphicSetoid` | `Mathlib/CategoryTheory/IsomorphismClasses.lean` | The setoid of nonempty object isomorphisms, used for the envelope arity test on isomorphism classes. | E5 |

Newer Tau Ceti already contains some of what the pins lack. When the roadmap
moves past the pins it reuses these rather than planning them again:

- `TauCeti/CategoryTheory/DG/Basic.lean`: `TauCeti.DGCategory`, `TauCeti.dgHomComplex`, `TauCeti.dgComp`. Reuse the general enriched carrier. Composition is Hom(X,Y)⊗Hom(Y,Z), with the first-degree Leibniz sign.
- `TauCeti/CategoryTheory/DG/HomotopyCategory.lean`: `TauCeti.DGHomotopyClass`, `TauCeti.DGHomotopyCategory`. Reuse the cycles/boundaries quotient and its category, additive and linear instances; E0 adds only the dg-nerve comparison.
- `TauCeti/CategoryTheory/DG/Functor.lean`: `CategoryTheory.EnrichedFunctor.mapDGHomotopyCategory`, `CategoryTheory.EnrichedFunctor.forgetCompDgClosedToHomotopyIso`. Reuse functoriality of H0 rather than planning a second theory.
- `TauCeti/CategoryTheory/Sites/ExtensionByZero.lean`: `TauCeti.CategoryTheory.PresheafExtensionByZero.functor`, `TauCeti.CategoryTheory.PresheafExtensionByZero.adjunction`, `TauCeti.CategoryTheory.SheafExtensionByZero.preservesFiniteLimits_sheafPullback`. The preorder/lower-interval and open abelian-sheaf construction is existing. It does not yet discharge arbitrary site-module localization-generator extensions by zero.

The newer extension by zero covers lower intervals of preorders and open
abelian sheaves only; the general module-sheaf generator on an arbitrary site
is still requested from D0.

## Layer overview

| Layer | Title | Declarations | Planets | Coverage |
| --- | --- | ---: | ---: | --- |
| [E0](#layer-e0) | A concrete enhancement and higher-category operations | 25 | 6 | planned |
| [E1](#layer-e1) | Unbounded derived sheaves and presentability | 23 | 6 | planned |
| [E2](#layer-e2) | Repleteness, inverse limits, Postnikov convergence and descent | 41 | 6 | planned |
| [E3](#layer-e3) | Coherent diagrams, Kan extensions and adjoints | 13 | 6 | planned |
| [E4](#layer-e4) | Derived completion of sheaves and coefficient reconstruction | 23 | 6 | planned |
| [E5](#layer-e5) | Shared monoidal enhancement, Ind-completion and animated algebra | 1 | 0 | planned |
| [E5:abstract](#layer-e5-abstract) | Monoidal stable categorical baseline | 19 | 6 | planned |
| [E5:presentability](#layer-e5-presentability) | Presentable categories, Ind-completion and extensions | 14 | 6 | planned |
| [E5:animation](#layer-e5-animation) | Animated commutative algebra | 7 | 4 | planned |
| [E5:cotangent-export](#layer-e5-cotangent-export) | The return from derived de Rham | 2 | 2 | planned |
| [E5:spectra-comparison](#layer-e5-spectra-comparison) | Late concrete spectral realization | 1 | 1 | planned |

**Order of construction.** The declarations fix this order: E0, then E1, then
E3 (which uses only E0 and E1), then E2 (whose sheaves of spaces use E3's
accessible localizations), then E4. E5:abstract uses E0, E1, E3 and the tower
declarations of E2; E5:presentability follows E5:abstract; the descent
declarations of E5:abstract use E5:presentability and are used by E2's
perfect h-descent; E5:animation follows E5:presentability; the two return
layers come last, and E5 itself, the joint acceptance diagram, after them.
The atlas records E2 → E3, which no declaration uses, and the declarations
induce two layer-level cycles; the [Dependencies](#dependencies) section
gives three structural proposals that make the layer order acyclic.

**Main paths.** The derived-sheaf path is dg nerve → stable API and sign
comparison → K-injective and K-flat replacement → D∞(O) → presentability and
derived tensor → coherent towers → Postnikov completion → hypercover descent
and left completeness on replete topoi. The adjoint path runs from
representability through the adjoint functor theorem and accessible
localizations to the mates used by six-operation consumers. The adic path runs
from derived complete sheaves through the reflector, the Koszul power model
and the regular-ideal quotients to coefficient reconstruction. The algebraic
path runs from restricted straightening through symmetric monoidal categories,
operads, algebras and modules to descendable algebras, presentable
categories and animated rings.

## The layers

Each layer begins with its plan in prose, followed by its declarations in
dependency order. A declaration gives its statement, hypotheses, construction
or proof outline, direct prerequisites (inside this roadmap as links),
sources, the uses that shape its API, its API and unit tests with the status
of each in the suggested file, its acceptance checks, the scope of its Lean
signature where the packet records one, and the gaps and requests that name
it. In the Lean column, *included* means a matching signature or example is in
the suggested file, *partial* that a weaker signature is there and the packet
names what is missing, *omitted* that the item is not yet expressible at the
pinned interfaces; for E5 the column reports whether the name is declared in
the file.

<a id="layer-e0"></a>

## E0 — A concrete enhancement and higher-category operations

The basic space is a Kan complex and the basic higher category a
quasicategory. A categorical equivalence has a quasi-inverse and two invertible
transformations in Mathlib's bicategory of quasicategories; equivalently it is
fully faithful on mapping spaces and essentially surjective. The homotopy
category alone does not detect equivalences: projecting the dg algebra ℤ⊕ℤε,
with ε in cohomological degree −1 and ε² = 0, to ℤ preserves degree-zero
cohomology but kills a π₁ of the mapping space.

The join K⋆L, with every K vertex before every L vertex, gives cones, slices
and cocones; limits are terminal cones and colimits initial cocones, with
universal properties stated by equivalences of mapping spaces. The functor
quasicategory is Mathlib's simplicial internal Hom; its edges are coherent
transformations, and invertibility is detected vertexwise. Stability asks for
a zero object, fibres and cofibres, and that pushout and pullback squares
coincide. The dg nerve is the model for derived sheaves: its simplices are
objects, closed degree-zero edges and higher Hom elements satisfying the signed
differential equation; it is compared both with the degree-zero cohomology
category (Tau Ceti's existing `DGHomotopyCategory` beyond the pins) and with
the coherent nerve of its Dold–Kan enrichment, which are different theorems.

Restricted straightening classifies coCartesian fibrations over interval,
simplicial, tower and refinement shapes by coherent diagrams in Cat∞, with
coCartesian sections taken in the relative functor object over the identity of
the base. Cat∞ and Spaces are coherent nerves of locally Kan categories, so the
general coherent-nerve theorem precedes them. Universe control, κ-filtered
diagrams, compactness and presentability close the layer; they are the
elementary accessibility notions that E1, E3 and E5 build on. The signed
comparison, the Dold–Kan enrichment's right-lax monoidal constraints and the
coherent classification remain formal gaps ([G0.1](#gap-g0-1),
[G0.2](#gap-g0-2)).

<a id="n-e0-dg-nerve"></a>
#### Differential graded nerve

`E0/dg-nerve` · construction · planet: **Differential graded nerve**

For a small DG category C over a commutative ring, use homological degrees and choose objects X₀,…,Xₙ. For each increasing subset I of [n] with at least two vertices, assign f_I in Hom_C(X_min I,X_max I) of degree |I|−2. Label its interior vertices i_m<…<i₁. Require d f_I=∑_{j=1}^m(−1)^j(f_{I\{i_j}}−f_{i_j<…<i₁<max I}∘f_{min I<i_m<…<i_j}). A monotone map α pulls these data back: use f_{α(J)} on injectively indexed subsets, use the identity on a collapsed two-vertex edge, and use zero on larger collapsed subsets. These operations define N_dg(C). The cohomological input uses degree 2−|I| after the specified reindexing and Koszul comparison.

**Hypotheses.**

- Homological grading in HA: differential lowers degree. Imported DG categories use cohomological grading; the reindexing and composition-order comparison is an explicit unresolved input.
- A DG category over any commutative ring is viewed over ℤ by restriction of scalars.
- Higher chain data alone do not imply inequivalence with an ordinary nerve; a nonzero positive homology group of a mapping complex supplies the obstruction.

**Construction.**

1. Use the simplex data and differential equation displayed in the statement.
2. Check preservation of the equation by the three-case simplicial-operator formula, including collapsed edges; verify identity and composition. The inner-horn result is the separate dg-nerve-inner-horns node.

**Direct prerequisites.**

- `mathlib:SSet`
- `mathlib:CategoryTheory.Preadditive`
- `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules`
- `tauceti:TauCetiRoadmap/DGAInfinity#layer-0-signed-graded-multilinear-and-tensor-coalgebra-infrastructure`

**Sources.**

- [Higher Algebra](#src-e0-lurie-ha), Construction 1.3.1.6, p. 81; Example 1.3.1.8, p. 82. Explicit formula, all three simplicial-operator cases and low simplices read directly.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E0/dg-nerve-homotopy-category-and-mapping-spaces: the mapping spaces and homotopy category are computed from it
- EnhancedDerivedSheaves:E1: the enhanced derived category is the dg nerve of a K-injective model
- EtaleDualityAndPerverseSheaves:EDC.0: the etale-duality roadmap consumes the same enhancement

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `dgNerve` | constructor | Simplicial set of the stated DG coherence data. | partial |
| `dgNerve_vertices` | structure | Vertices identify with objects of C. | included |
| `dgNerve_edges` | structure | Edges x→y identify with closed degree-zero elements of Map_C(x,y). | partial |
| `dgNerve_degeneracy` | structure | A collapsed edge is an identity; a larger noninjectively indexed coherence is zero. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `dgNerve_triangle` | computation | For edges f:x→y, g:y→z, h:x→z, a triangle carries z in Map_C(x,z)_1 with dz=g∘f−h. | omitted |
| `dgNerve_constant_edge` | degenerate | The degeneracy of x is id_x, not zero. | omitted |
| `dgNerve_degree_zero` | compatibility | For a preadditive category with Hom complexes concentrated in degree zero, the dg nerve is isomorphic to its ordinary nerve. | omitted |
| `dgNerve_higher_homology` | non-example | For the one-object DG ℤ-algebra ℤ⊕ℤε with \|ε\|=1, ε²=0 and d=0 in homological grading, π₁ of its self-mapping space is ℤ; it cannot be equivalent to an ordinary-category nerve. | omitted |

**Acceptance.**

- Check that the 2-simplices encode a homotopy between a composite and a third map, not an equality
- Check the sign convention in the defining equation
- Check the three cases of the degeneracy formula
- Check that the dg nerve of a DG category with no higher morphisms is the ordinary nerve

**Lean prototype:** partial (`dgNerve`). Cohomological enriched input and vertices/edges are present; signed homological reindexing and the simplex differential/degeneracy formulas are not stated in Lean.

**Open obligations:** gap [G0.1](#gap-g0-1) (Signed enrichment and nerve comparison); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions); request [R0.3](#req-r0-3) to `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules`; request [R0.4](#req-r0-4) to `tauceti:TauCetiRoadmap/DGAInfinity#layer-0-signed-graded-multilinear-and-tensor-coalgebra-infrastructure`.

<a id="n-e0-dg-nerve-inner-horns"></a>
#### Inner horn filling for the dg nerve

`E0/dg-nerve-inner-horns` · lemma

For every DG category C, N_dg(C) satisfies the inner horn-filling condition. For Λⁿⱼ with 0<j<n, choose f_[n]=0 and f_[n]−{j}=Σ_(0<p<n)(−1)^(p−j)f_{p,…,n}∘f_{0,…,p}−Σ_(0<p<n,p≠j)(−1)^(p−j)f_[n]−{p}.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. The horn specifies all coherence entries except the full set and its j-th face.
2. The displayed formula solves the equation on the full set. Apply d, the Leibniz rule and the already known proper-face equations to verify the remaining equation.

**Direct prerequisites.**

- [`E0/dg-nerve`](#n-e0-dg-nerve) — Differential graded nerve
- `mathlib:SSet.Quasicategory`

**Sources.**

- [Higher Algebra](#src-e0-lurie-ha), Proposition 1.3.1.10, p. 82. Explicit inner-horn extension read in full.

**Acceptance.**

- For n=2,j=1 choose h=g∘f and homotopy zero.
- Do not assert outer horn filling.

**Lean prototype:** included (`dgNerve_quasicategory`). For the cohomological enriched carrier, with the signed input bridge recorded separately.

<a id="n-e0-dg-nerve-homotopy-category-and-mapping-spaces"></a>
#### Homotopy category of the dg nerve

`E0/dg-nerve-homotopy-category-and-mapping-spaces` · theorem

The canonical functor hC→hN_dg(C) is an isomorphism, identity on objects and identifying morphisms with H₀(Map_C(x,y)). Here hC is the degree-zero homology category of the DG category, not its category of closed degree-zero maps.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Edges are degree-zero cycles.
2. The relation supplied by triangles with a degenerate edge is exactly difference by a degree-one boundary.
3. The DG Leibniz rule makes composition descend; vertices and resulting morphism sets agree.

**Direct prerequisites.**

- [`E0/dg-nerve`](#n-e0-dg-nerve) — Differential graded nerve
- [`E0/dg-nerve-inner-horns`](#n-e0-dg-nerve-inner-horns) — Inner horn filling for the dg nerve
- `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules`

**Sources.**

- [Higher Algebra](#src-e0-lurie-ha), Remarks 1.3.1.5 and 1.3.1.11, pp. 81, 83. The inherited ID is retained for this single theorem; its former mapping-space and nerve-comparison clauses are separate nodes.

**Acceptance.**

- For Hom concentrated in degree zero this is the original preadditive category.

**Lean prototype:** omitted. The signed DG/Dold–Kan comparison or the higher cone, coCartesian, compactness and coherent universal-property condition is not yet expressed at the pinned interfaces; the mathematical statement remains in the node.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions); request [R0.3](#req-r0-3) to `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules`.

<a id="n-e0-limits-colimits-and-slices"></a>
#### The simplicial join

`E0/limits-colimits-and-slices` · construction

For simplicial sets K,L, construct K⋆L with n-simplices the disjoint union K_n ⊔ L_n ⊔ ⨿_{a+b+1=n} K_a×L_b. Equivalently use augmented simplicial degrees with K_{−1}=L_{−1}=*. Faces and degeneracies act in the indicated factor and, at a boundary, pass into the other factor. This convention places every K vertex before every L vertex.

**Construction.**

1. Define operators by splitting an ordered simplex at its last K vertex. Verify the simplicial identities by restriction of the same ordered map. Identify Δ[a]⋆Δ[b] with Δ[a+b+1].

**Direct prerequisites.**

- `mathlib:SSet`

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), §1.2.8, PDF pp. 58–59 (9 April 2017 copy). The join and its orientation construct cone shapes.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E0/slices-and-cones: joins represent the two slice constructions

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `join` | constructor | The functorial join K⋆L. | included |
| `join_inclusions` | data | Canonical inclusions of K and L. | omitted |
| `join_map` | functoriality | Maps on each factor give a map of joins; identity and composition hold. | partial |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `join_empty` | degenerate | ∅⋆K≅K≅K⋆∅. | included |
| `join_points` | computation | Δ[0]⋆Δ[0]≅Δ[1], with the first factor its source vertex. | included |
| `join_simplices` | compatibility | Δ[a]⋆Δ[b]≅Δ[a+b+1]. | included |

**Acceptance.**

- ∅⋆K≅K≅K⋆∅.
- Δ[0]⋆Δ[0]≅Δ[1], with the first factor its source vertex.
- Δ[a]⋆Δ[b]≅Δ[a+b+1].

**Lean prototype:** partial (`join`, `joinLeft`, `joinRight`, `join_map`). Join carrier, maps and three tests; graded decomposition and functor laws are not stated.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e0-right-mapping-space"></a>
#### Right mapping space

`E0/right-mapping-space` · definition

For a quasicategory C and vertices x,y, define Hom^R_C(x,y) as the simplicial set of maps Δ[n+1]→C whose restriction to the first n+1 vertices is constant at x and whose final vertex is y. Its simplicial operators extend α:[m]→[n] by sending the final vertex to the final vertex. The Kan property and comparison with other mapping-space models are separate obligations.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Construction.**

1. Take the specified subset of maps of standard simplices in each degree.
2. Restriction along the extended monotone maps preserves both endpoint conditions and satisfies the simplicial identities.

**Direct prerequisites.**

- `mathlib:SSet`
- `mathlib:SSet.Quasicategory`

**Sources.**

- [Higher Algebra](#src-e0-lurie-ha), Remark 1.3.1.12, p. 83. Definition used in the explicit dg mapping-space calculation; the general Kan theorem is not proved by this remark.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E0/dg-nerve-mapping-space: Dold–Kan identifies this specified mapping model.
- EnhancedDerivedSheaves:E0/limits-colimits-and-slices: Mapping-space universal properties.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `rightMappingSpace` | constructor | The endpoint-constrained simplicial set Hom^R_C(x,y). | partial |
| `rightMappingSpace_vertices` | characterisation | Vertices are precisely edges x→y. | included |
| `rightMappingSpace_map` | functoriality | A simplicial map C→D sends endpoint-constrained simplices to the corresponding endpoint-constrained simplices, compatibly with composition. | partial |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `rightMappingSpace_point` | degenerate | For the terminal simplicial set and its unique vertex, the right mapping space is terminal. | included |
| `rightMappingSpace_ordinary` | compatibility | For the nerve of an ordinary category A, Hom^R(x,y) is the constant simplicial set on Hom_A(x,y). | included |
| `rightMappingSpace_two_simplex` | computation | A 1-simplex is a triangle with first edge id_x and final vertex y, not an arbitrary triangle in C. | omitted |

**Acceptance.**

- Check every displayed hypothesis and the indicated small-case specialization.

**Lean prototype:** partial (`rightMappingSpace`). The endpoint-labelled simplicial carrier, vertex and induced-map signatures are present; the endpoint equations in every simplicial degree are not expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e0-dg-nerve-mapping-space"></a>
#### Dold–Kan mapping-space comparison

`E0/dg-nerve-mapping-space` · comparison

For x,y in a DG category in homological grading there is an isomorphism of simplicial sets Hom^R_{N_dg(C)}(x,y)≅DK(τ≥0 Map_C(x,y)), using good connective truncation (cycles at degree zero).

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Restrict the dg simplex equation to a simplex constant on its first face; only coherences containing the final vertex can remain nonzero.
2. The sign change identifies these families with chain maps N_*(ℤΔ[n])→Map_C(x,y).
3. Apply the normalized-chain/Dold–Kan evaluation comparison from HA 1.2.3.12; the pinned normalization and composition-order comparison remains a required bridge.

**Direct prerequisites.**

- [`E0/right-mapping-space`](#n-e0-right-mapping-space) — Right mapping space
- [`E0/dg-nerve`](#n-e0-dg-nerve) — Differential graded nerve
- `mathlib:CategoryTheory.Abelian.DoldKan.equivalence`

**Sources.**

- [Higher Algebra](#src-e0-lurie-ha), Remark 1.3.1.12, p. 83. Source computes the specified right mapping space by normalized chains.

**Acceptance.**

- Degree-zero-only Hom gives a discrete mapping space.
- A homological degree-one copy of ℤ contributes π₁=ℤ.

**Lean prototype:** omitted. The signed DG/Dold–Kan comparison or the higher cone, coCartesian, compactness and coherent universal-property condition is not yet expressed at the pinned interfaces; the mathematical statement remains in the node.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e0-slices-and-cones"></a>
#### Slices and cone categories

`E0/slices-and-cones` · construction

For p:K→C, define C_{/p} by Hom(Y,C_{/p})≅{q:Y⋆K→C | q|K=p}; define C_{p/} using K⋆Y. For a quasicategory C these are quasicategories. Their vertices are coherent cones with a vertex before, respectively after, p; their projection to C remembers the cone vertex.

**Construction.**

1. Construct degree n by the displayed relative join maps. Extend an inner horn using the join inner-anodyne inclusion. Transport slice objects and maps under composition with a functor.

**Direct prerequisites.**

- [`E0/limits-colimits-and-slices`](#n-e0-limits-colimits-and-slices) — The simplicial join
- `mathlib:SSet.Quasicategory`

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), §1.2.9, Proposition 1.2.9.3, PDF pp. 60–61. Join representability gives the slices; inner horn extension gives their quasicategory property.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E0/limits-colimits-universal-properties: initial and terminal cones define enhanced colimits and limits

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `overDiagram` | constructor | The cone category C_{/p}. | partial |
| `underDiagram` | constructor | The cocone category C_{p/}. | partial |
| `slice_vertex` | projection | The forgetful simplicial map to C. | partial |
| `slice_joinEquiv` | universal-property | The natural representing bijections above. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `slice_empty` | degenerate | For K=∅ both slice categories are C. | included |
| `slice_point` | compatibility | For C=N(A) and p a single object a, these are N(A/a) and N(a/A). | omitted |
| `slice_discrete_two` | computation | For K two discrete vertices, a cone has two edges from its vertex; it does not impose an arrow between the two prescribed vertices. | omitted |

**Acceptance.**

- For K=∅ both slice categories are C.
- For C=N(A) and p a single object a, these are N(A/a) and N(a/A).
- For K two discrete vertices, a cone has two edges from its vertex; it does not impose an arrow between the two prescribed vertices.

**Lean prototype:** partial (`overDiagram`, `underDiagram`, `slice_vertex`, `coslice_vertex`, `slice_joinEquiv`). Representing bijection for cones is present; dual coslice representing bijection and compatibility are omitted.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e0-categorical-equivalences"></a>
#### Categorical equivalences

`E0/categorical-equivalences` · definition · planet: **Categorical equivalences**

A simplicial map F:C→D between quasicategories is a categorical equivalence when it has a quasi-inverse G together with natural equivalences GF≃id_C and FG≃id_D, in the pinned homotopy bicategory of quasicategories. This is equivalent to essential surjectivity on hD and equivalences on all mapping spaces. Equivalence of homotopy categories alone is insufficient.

**Construction.**

1. Express the inverse and two natural isomorphisms in the existing homotopy bicategory. The comparison with the mapping-space criterion uses right mapping spaces and the coherent nerve/Joyal comparison.

**Direct prerequisites.**

- `mathlib:SSet.QCat.bicategory`
- `mathlib:SSet.QCat.strictBicategory`

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Definition 1.2.10.1 and Remark 1.2.10.2, PDF p. 61; Theorem 2.2.5.1, PDF p. 107. Mapping-space full faithfulness and essential surjectivity characterize the same categorical equivalences.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E1/enhanced-derived-category: quasi-isomorphisms must become equivalences in the enhancement

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `IsCategoricalEquivalence` | characterisation | Existence of a quasi-inverse and the two natural equivalences. | included |
| `categoricalEquivalence_comp` | structure | Categorical equivalences are closed under composition and satisfy two-out-of-three. | partial |
| `categoricalEquivalence_nerve` | compatibility | N(F) is a categorical equivalence exactly when the ordinary functor F is an equivalence. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `categoricalEquivalence_identity` | degenerate | id_C is a categorical equivalence. | included |
| `categoricalEquivalence_skeleton` | compatibility | The nerve of a skeleton inclusion into an ordinary category is a categorical equivalence. | omitted |
| `categoricalEquivalence_not_homotopyCategory` | non-example | The one-object dg algebra ℤ⊕ℤε, \|ε\|=−1 cohomologically, ε²=dε=0, has the same h-category as its projection to ℤ but its mapping π₁ changes from ℤ to zero; that projection is not a categorical equivalence. | omitted |

**Acceptance.**

- id_C is a categorical equivalence.
- The nerve of a skeleton inclusion into an ordinary category is a categorical equivalence.
- The one-object dg algebra ℤ⊕ℤε, |ε|=−1 cohomologically, ε²=dε=0, has the same h-category as its projection to ℤ but its mapping π₁ changes from ℤ to zero; that projection is not a categorical equivalence.

**Lean prototype:** included (`IsCategoricalEquivalence`). Actual quasi-inverse with invertible two-cells in QCat; remaining API and fixtures are audited separately.

<a id="n-e0-mapping-space-kan-and-equivalences"></a>
#### Right mapping spaces are spaces

`E0/mapping-space-kan-and-equivalences` · theorem

For a quasicategory C and vertices x,y, Hom^R_C(x,y) is Kan. A categorical equivalence C→D induces a weak homotopy equivalence on these mapping spaces; conversely these equivalences together with essential surjectivity imply categorical equivalence. For Kan complexes weak homotopy equivalence agrees with categorical equivalence.

**Proof.**

1. Convert each outer mapping-space horn to an inner horn with fixed initial face in C. Use the Q-cosimplicial comparison to the simplicial localization and its equivalence criterion.

**Direct prerequisites.**

- [`E0/right-mapping-space`](#n-e0-right-mapping-space) — Right mapping space
- [`E0/categorical-equivalences`](#n-e0-categorical-equivalences) — Categorical equivalences
- `mathlib:SSet.KanComplex`

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Proposition 1.2.2.3, PDF p. 45; Propositions 2.2.2.7, 2.2.2.9 and 2.2.2.13, PDF pp. 94–96; Theorem 2.2.5.1, PDF p. 107. The right mapping-space construction is Kan and detects full faithfulness.

**Acceptance.**

- For N(A), the mapping space is the discrete set Hom_A(x,y).
- For the square-zero dg algebra with cohomology in degree −1 the self-mapping π₁ is nonzero.

**Lean prototype:** partial (`rightMappingSpace_kan`). Kan property only; categorical-equivalence detection is omitted.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e0-limits-colimits-universal-properties"></a>
#### Enhanced limits and colimits

`E0/limits-colimits-universal-properties` · definition · planet: **Limits and colimits**

A cone c∈C_{/p} is limiting when c is terminal in that quasicategory; a cocone c∈C_{p/} is colimiting when c is initial. Initial means that every outgoing mapping space is contractible, terminal means the corresponding incoming condition. Thus for every z the maps Map_C(z,lim p)→lim_k Map_C(z,p(k)) and Map_C(colim p,z)→lim_k Map_C(p(k),z) are equivalences of spaces, naturally in z.

**Construction.**

1. Use contractibility of cone mapping spaces to characterize initial/terminal cones. Identify the space of maps into or out of a cone with the coherent space of compatible maps. Deduce uniqueness as a contractible space of choices.

**Direct prerequisites.**

- [`E0/slices-and-cones`](#n-e0-slices-and-cones) — Slices and cone categories
- [`E0/right-mapping-space`](#n-e0-right-mapping-space) — Right mapping space
- [`E0/mapping-space-kan-and-equivalences`](#n-e0-mapping-space-kan-and-equivalences) — Right mapping spaces are spaces

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Definition 1.2.12.1, PDF pp. 62–63; Definition 1.2.13.4 and Remark 1.2.13.3, PDF p. 65; Lemma 4.2.4.3, PDF p. 275. Cone initiality or terminality gives the space-valued universal property; comparison with model homotopy limits supplies the displayed formulas.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E2/coherent-towers-and-roos: inverse limits use this universal property
- EnhancedDerivedSheaves:E4/compatible-coefficient-systems: coherent categorical limits retain coefficient-change data

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `IsEnhancedLimit` | characterisation | Terminality of a cone in C_{/p}. | included |
| `IsEnhancedColimit` | characterisation | Initiality of a cocone in C_{p/}. | included |
| `enhancedLimit_mapEquiv` | universal-property | The natural mapping-space equivalence for a limiting cone. | omitted |
| `enhancedColimit_mapEquiv` | universal-property | The dual equivalence for a colimiting cocone. | omitted |
| `enhancedLimit_nerve` | compatibility | Ordinary limiting cones in N(A) agree with Mathlib IsLimit; dually for colimits. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `enhancedLimit_empty` | degenerate | An empty-diagram limit is terminal and its colimit is initial. | omitted |
| `enhancedLimit_ordinary_product` | compatibility | The product cone for two sets in N(Type) is their ordinary cartesian product. | omitted |
| `enhancedLimit_loop` | non-example | The homotopy pullback *×_{K(ℤ,1)}* is K(ℤ,0), not a point; computing only the pullback of π₀ misses it. | omitted |

**Acceptance.**

- An empty-diagram limit is terminal and its colimit is initial.
- The product cone for two sets in N(Type) is their ordinary cartesian product.
- The homotopy pullback *×_{K(ℤ,1)}* is K(ℤ,0), not a point; computing only the pullback of π₀ misses it.

**Lean prototype:** partial (`IsEnhancedLimit`, `IsEnhancedColimit`, `HasEnhancedLimits`, `HasFiniteEnhancedLimits`, `HasFiniteEnhancedColimits`). Terminal/initial slice predicates are present; mapping-space and ordinary-limit comparisons are omitted.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e0-stable-categories"></a>
#### Stable quasicategories

`E0/stable-categories` · definition · planet: **Stable infinity categories**

A stable quasicategory is pointed, has all finite limits and finite colimits, and a commutative square is a pullback exactly when it is a pushout. Define fibre and cofibre by the squares over/from zero, suspension as cofib(x→0), and loop as fib(0→x). An exact functor is one preserving finite limits, equivalently finite colimits, between stable categories.

**Construction.**

1. Build the pointed finite-limit/finite-colimit operations. Prove the fibre/cofibre criterion and that loop and suspension are inverse equivalences. Identify exactness in its two forms using bicartesian squares.

**Direct prerequisites.**

- [`E0/limits-colimits-universal-properties`](#n-e0-limits-colimits-universal-properties) — Enhanced limits and colimits
- [`E0/categorical-equivalences`](#n-e0-categorical-equivalences) — Categorical equivalences

**Sources.**

- [Higher Algebra](#src-e0-lurie-ha), Definition 1.1.1.9 and Proposition 1.1.3.4, pp. 19–20 and 31–32; Proposition 1.1.4.1, p. 33. Stability is the bicartesian-square condition and gives the finite exactness API.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E1/enhanced-derived-category: stability follows from the dg cone and shift
- EnhancedDerivedSheaves:E3/exact-coproducts-colimits: finite exactness and coproducts control all colimits

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `IsStable` | characterisation | Pointedness, finite limits/colimits and equality of pullback and pushout squares. | included |
| `stable_fibre_cofibre` | data | Fibre and cofibre functors with their canonical maps. | omitted |
| `stable_suspension_loop` | equivalence | Suspension and loop are inverse categorical equivalences. | included |
| `stable_exact_iff` | characterisation | Preserving finite limits is equivalent to preserving finite colimits. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `stable_zero` | degenerate | The one-object, one-morphism category is stable. | included |
| `stable_not_modules` | non-example | N(Mod_ℤ) is not stable: the pullback square of 0→ℤ←0 is not a pushout square. | included |
| `stable_complex_shift` | compatibility | In the enhancement of complexes, ΣK agrees with K[1], including the sign on its differential. | omitted |

**Acceptance.**

- The one-object, one-morphism category is stable.
- N(Mod_ℤ) is not stable: the pullback square of 0→ℤ←0 is not a pushout square.
- In the enhancement of complexes, ΣK agrees with K[1], including the sign on its differential.

**Lean prototype:** partial (`IsStable`, `IsExactEnhancedFunctor`, `stable_suspension`, `stable_loop`, `stable_suspension_loop`, `stable_exact_iff`). Pointedness, finite limits/colimits and square bicartesianity are formulas. Suspension/loop inverse equivalences and exactness are typed; fibre/cofibre and cochain-shift comparison are not stated.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e0-stable-api-and-the-sign-comparison"></a>
#### The stable API, and the comparison of shifts and cone signs with the cochain convention

`E0/stable-api-and-the-sign-comparison` · comparison

In the concrete dg-nerve model, identify suspension with the pinned cochain shift and cofibre with the pinned mapping cone, including their signs; identify the resulting triangulated homotopy-category structure with the existing pretriangulated structure. The elementary stable-category foundation is required in E0 before E5’s monoidal theory can use it.

**Hypotheses.**

- The dg category is closed under zero, shifts and mapping cones, or is the full K-injective replacement model with those operations transported through replacement.
- Cochain grading, suspension A[1] in degree −1, the pinned cone differential and enriched composition order are fixed.

**Proof.**

1. Construct zero objects, fibres, cofibres and suspension in the dg nerve of complexes.
2. Identify the suspension with the shift of cochain complexes and the cofibre with the mapping cone.
3. Compare the resulting triangulated structure on the homotopy category with the pinned pretriangulated structure, including the signs.

**Direct prerequisites.**

- [`E0/dg-nerve-homotopy-category-and-mapping-spaces`](#n-e0-dg-nerve-homotopy-category-and-mapping-spaces) — Homotopy category of the dg nerve
- [`E0/limits-colimits-and-slices`](#n-e0-limits-colimits-and-slices) — The simplicial join
- `mathlib:CategoryTheory.Pretriangulated`
- `mathlib:CategoryTheory.HasShift`
- `mathlib:DerivedCategory`
- `mathlib:CategoryTheory.Limits.HasZeroObject`
- [`E0/dg-nerve-mapping-space`](#n-e0-dg-nerve-mapping-space) — Dold–Kan mapping-space comparison
- [`E0/limits-colimits-universal-properties`](#n-e0-limits-colimits-universal-properties) — Enhanced limits and colimits
- [`E0/stable-categories`](#n-e0-stable-categories) — Stable quasicategories

**Sources.**

- [Higher Algebra](#src-e0-lurie-ha), Definition 1.1.1.9 and Theorem 1.1.2.14, printed pp. 19 and 27. The stable homotopy category has a canonical triangulation; compare its suspension and rotation with the existing cochain signs.

**Acceptance.**

- Check that the suspension is the cochain shift, with the pinned convention
- Check that the cofibre is the mapping cone, with its signs
- Check that the triangulated structure agrees with the pinned pretriangulated one
- Check that no alternative convention is adopted to make the comparison trivial

**Lean prototype:** omitted. The signed DG/Dold–Kan comparison or the higher cone, coCartesian, compactness and coherent universal-property condition is not yet expressed at the pinned interfaces; the mathematical statement remains in the node.

**Open obligations:** gap [G0.1](#gap-g0-1) (Signed enrichment and nerve comparison); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e0-coherent-functors"></a>
#### Functor quasicategories and transformations

`E0/coherent-functors` · construction

For a simplicial set K and quasicategory C, Fun(K,C) is the simplicial internal Hom: its n-simplices are maps K×Δ[n]→C. It is a quasicategory. Its edges are coherent natural transformations, and an edge is invertible if and only if its evaluation at every vertex of K is invertible.

**Construction.**

1. Reuse the pinned simplicial internal Hom and its existing quasicategory instance from SimplicialSet/AnodyneExtensions/Inner/PushoutProduct.lean, lines 156–157. These are existing carrier infrastructure. The new API is evaluation and vertexwise detection of equivalence edges, proved by the equivalence extension theorem.

**Direct prerequisites.**

- `mathlib:SSet`
- `mathlib:SSet.QCat.bicategory`
- [`E0/categorical-equivalences`](#n-e0-categorical-equivalences) — Categorical equivalences

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Proposition 1.2.7.3, printed p. 39 (PDF p. 57); pointwise equivalences in the introduction to §2.3.4, printed p. 106 (PDF p. 124). Internal Hom is a quasicategory and evaluation detects equivalences.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion: restriction and extension are functors between coherent functor categories
- PAPER-BHATT-ETAL-23/triangulated-limit-warning: retains the diagram coherences lost by an ordinary triangulated diagram

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `coherentFun` | constructor | The internal-Hom simplicial set, with its quasicategory instance. | included |
| `coherentFun_eval` | data | Evaluation at a vertex, as a functor. | included |
| `coherentNatTrans` | characterisation | Edges are maps K×Δ[1]→C with the specified two endpoint restrictions. | included |
| `coherentFun_pointwiseEquiv` | characterisation | A transformation is invertible precisely when every vertex component is invertible. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `coherentFun_point` | degenerate | Fun(Δ[0],C)≅C. | included |
| `coherentFun_ordinary` | compatibility | Fun(N(A),N(B))≅N(A⥤B) for ordinary small categories. | included |
| `coherentFun_interval` | computation | Vertices of Fun(Δ[1],C) are edges of C; its edges include a square and its filling coherence, not four unrelated arrows. | partial |

**Acceptance.**

- Fun(Δ[0],C)≅C.
- Fun(N(A),N(B))≅N(A⥤B) for ordinary small categories.
- Vertices of Fun(Δ[1],C) are edges of C; its edges include a square and its filling coherence, not four unrelated arrows.

**Lean prototype:** included (`coherentFun`, `coherentNatTrans`, `coherentFun_quasicategory`, `coherentFun_pointwiseEquiv`). Actual internal Hom and coherent-edge types with quasicategory and pointwise-invertibility signatures.

<a id="n-e0-full-enhanced-subcategories"></a>
#### Full enhanced subcategories

`E0/full-enhanced-subcategories` · construction

Given a vertex predicate P on C, take exactly those simplices all of whose vertices satisfy P. The inclusion is full; when C is a quasicategory so is this simplicial subset. Its vertices identify with the subtype of vertices satisfying P.

**Hypotheses.**

- Fix a small universe u and the next universe u+1; categorical assertions assume quasicategories.

**Construction.**

1. Select simplices by their vertex restrictions; faces and degeneracies preserve this condition.
2. Inner horns whose vertices satisfy P can be filled in C, and every vertex of the filler already occurs in the horn. Use the ordinary nerve comparison to check fullness.

**Direct prerequisites.**

- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), §1.2.11, printed p. 44 (PDF p. 62). Higher-category carrier or size condition required by the enhanced diagrams; ordinary categories are comparison fixtures.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E2/postnikov-left-completion: compatible towers form a full subcategory
- EnhancedDerivedSheaves:E4/derived-complete-sheaves: completion is a full subcategory

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `fullEnhancedSubcategory` | constructor | The simplicial subset determined by all vertex restrictions. | included |
| `fullEnhancedSubcategory_inclusion` | data | Full inclusion into C. | included |
| `fullEnhancedSubcategory_vertices` | equivalence | Vertex equivalence with {x \| P(x)}. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `fullSubcategory_all` | degenerate | Taking P true gives C. | included |
| `fullSubcategory_none` | degenerate | Taking P false gives the empty simplicial set. | included |
| `fullSubcategory_ordinary` | compatibility | For N(A), restricting the vertices to P gives the nerve of the pinned ordinary full subcategory. | included |

**Acceptance.**

- Taking P true gives C.
- Taking P false gives the empty simplicial set.
- For N(A), restricting the vertices to P gives the nerve of the pinned ordinary full subcategory.

**Lean prototype:** partial (`fullEnhancedSubcategory`, `fullEnhancedSubcategory_vertices`, `fullEnhancedSubcategory_quasicategory`). The vertex-selected carrier, inclusion and quasicategory signatures are present; mapping-space fullness and the inclusion/vertex comparison laws are not stated.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e0-cocartesian-edges-and-fibrations"></a>
#### CoCartesian fibrations

`E0/cocartesian-edges-and-fibrations` · definition

For an inner fibration p:E→B, an edge e:x→y over a:u→v is p-coCartesian when for every z the square Map_E(y,z)→Map_E(x,z) over Map_B(v,pz)→Map_B(u,pz) is a homotopy pullback. The fibration is coCartesian when each pair (x,a:px→v) has such a lift. A coCartesian section is a section B→E sending every edge of B to a p-coCartesian edge. The category of these sections is a full subcategory of the relative functor category Fun_B(B,E), whose n-simplices are maps Δ[n]×B→E over the fixed projection to B. Transformations and higher simplices therefore lie over the identity of the base, not merely their endpoint section objects.

**Hypotheses.**

- The horn predicates are defined for simplicial sets; the mapping-space characterization and transport interpretation require E and B to be quasicategories.

**Construction.**

1. Use outer-horn lifts in every dimension ≥2 with the first edge fixed. This dual of the Cartesian slice condition is the actual Lean predicate. Prove equivalence with the mapping-space pullback criterion in HTT 2.4.4.3.
2. Form the relative simplicial internal Hom over B degreewise; only then select the coCartesian section vertices by a full subcategory. This retains the correct transformations over the identity base.

**Direct prerequisites.**

- `mathlib:SSet.InnerFibration`
- [`E0/mapping-space-kan-and-equivalences`](#n-e0-mapping-space-kan-and-equivalences) — Right mapping spaces are spaces
- [`E0/limits-colimits-universal-properties`](#n-e0-limits-colimits-universal-properties) — Enhanced limits and colimits
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations
- [`E0/full-enhanced-subcategories`](#n-e0-full-enhanced-subcategories) — Full enhanced subcategories

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Definitions 2.4.1.1 and 2.4.2.1, PDF pp. 133 and 139; Proposition 2.4.4.3, PDF p. 149 (apply the opposite-category dual). The dual Cartesian-edge criterion and lift condition give coCartesian fibrations.
- [Higher Topos Theory](#src-e0-lurie-htt), Corollary 3.3.3.2 and preceding relative mapping-object construction, printed pp. 215–216 (PDF pp. 233–234), with coCartesian dual. Sections are relative maps over the fixed base; the classifier limit is the category of coCartesian sections.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening: classification uses the edge condition
- EnhancedDerivedSheaves:E4/compatible-coefficient-systems: systems are coCartesian sections of the reduction diagram

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `IsCoCartesianEdge` | characterisation | The stated homotopy-pullback condition. | partial |
| `IsCoCartesianFibration` | characterisation | An inner fibration with a lift for every outgoing base edge. | included |
| `coCartesianSections` | constructor | The full subcategory of Fun_B(B,E) on coCartesian sections; every transformation lies over the identity of B. | partial |
| `coCartesianEdge_comp` | structure | Composites of coCartesian edges are coCartesian. | included |
| `coherentSections` | constructor | Relative coherent sections: maps Δ[n]×B→E over projection to B in degree n. | included |
| `coherentSections_simplices` | characterisation | The displayed degreewise equivalence commutes with every face and degeneracy operator. | partial |
| `coherentSections_inclusion` | compatibility | The simplicial inclusion into Fun(B,E) forgets the fixed base projection. | partial |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `cocartesian_product` | degenerate | B×C→B is coCartesian; a lifted edge is coCartesian exactly when its C component is invertible. | included |
| `cocartesian_ordinary` | compatibility | For the nerve of the Grothendieck construction of F:A→Cat, the canonical transport edges are coCartesian. | omitted |
| `cocartesian_sections_interval` | computation | For an interval-classified functor T:C→D, a coCartesian section is an object x∈C together with an equivalence T(x)≃y∈D, not an arbitrary map T(x)→y. | omitted |
| `cocartesian_identity` | degenerate | Over the identity of B every edge is coCartesian. | included |
| `cocartesian_constant` | characterisation | Over a point, coCartesian edges are exactly equivalence edges. | included |
| `cocartesian_noninvertible` | non-example | The noninvertible edge of Δ[1] is not coCartesian over a point. | included |
| `cocartesian_sections_identity` | non-example | For p=id_B, coCartesianSections(p) is the terminal simplicial set. In particular B=BG with nontrivial abelian G has no extra section automorphisms from the centre of G, which the full subcategory of ordinary Fun(B,B) would incorrectly retain. | included |

**Acceptance.**

- B×C→B is coCartesian; a lifted edge is coCartesian exactly when its C component is invertible.
- For the nerve of the Grothendieck construction of F:A→Cat, the canonical transport edges are coCartesian.
- For an interval-classified functor T:C→D, a coCartesian section is an object x∈C together with an equivalence T(x)≃y∈D, not an arbitrary map T(x)→y.

**Lean prototype:** partial (`IsCoCartesianEdge`, `IsCoCartesianFibration`, `IsCoCartesianSection`, `coCartesianSections`, `coCartesianEdge_comp`, `coherentSections`, `coherentSections_simplices`, `coherentSections_inclusion`). Actual horn/lift conditions and relative section carrier; the degreewise projection equation is typed. Simplicial-operator compatibility, mapping-space pullback and ordinary/interval transport fixtures remain untyped.

**Open obligations:** gap [G0.2](#gap-g0-2) (CoCartesian and accessible higher-category interfaces); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e0-enhanced-core"></a>
#### Maximal Kan core

`E0/enhanced-core` · construction

For a quasicategory C, its core is the simplicial subset containing precisely the simplices whose edges are equivalences. It has every vertex of C and is Kan. Every map from a Kan complex into C factors uniquely through it.

**Hypotheses.**

- Fix a small universe u and the next universe u+1; categorical assertions assume quasicategories.

**Construction.**

1. The subset is a quasicategory by inner horn filling. An inverse of a retained edge is itself an equivalence, so remains in the subset.
2. The equivalence-edge outer horn criterion makes the subset Kan; maps from Kan complexes preserve equivalences and therefore factor.

**Direct prerequisites.**

- [`E0/full-enhanced-subcategories`](#n-e0-full-enhanced-subcategories) — Full enhanced subcategories
- [`E0/categorical-equivalences`](#n-e0-categorical-equivalences) — Categorical equivalences

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Proposition 1.2.5.3 and proof, printed pp. 35–36 (PDF pp. 53–54). Higher-category carrier or size condition required by the enhanced diagrams; ordinary categories are comparison fixtures.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E0/higher-category-carrier: mapping spaces of Cat∞ are cores of functor quasicategories

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `enhancedCore` | constructor | The maximal Kan simplicial subset. | included |
| `enhancedCore_inclusion` | data | Inclusion of the core. | included |
| `enhancedCore_vertices` | equivalence | All vertices survive. | included |
| `enhancedCore_edges` | equivalence | Edges identify with the equivalence edges of C. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `core_point` | degenerate | The core of Δ[0] is Δ[0]. | included |
| `core_interval` | computation | The core of Δ[1] is the discrete two-point space. | included |
| `core_groupoid` | compatibility | A Kan complex is equal to its own core up to simplicial isomorphism. | included |

**Acceptance.**

- The core of Δ[0] is Δ[0].
- The core of Δ[1] is the discrete two-point space.
- A Kan complex is equal to its own core up to simplicial isomorphism.

**Lean prototype:** partial (`enhancedCore`, `enhancedCore_kan`, `enhancedCore_edges`). Carrier, Kan property and equivalence-edge identification are present; universal factorization from Kan complexes is not stated.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e0-locally-kan-coherent-nerve"></a>
#### Coherent nerve of a locally Kan category

`E0/locally-kan-coherent-nerve` · theorem

For a simplicial category C whose enriched mapping objects are Kan complexes, its homotopy-coherent nerve N(C) is a quasicategory. For objects x,y, its right mapping space is naturally equivalent to the enriched mapping Kan complex C(x,y). The comparison retains composition in the homotopy category and is natural in simplicial functors.

**Hypotheses.**

- Fix object and mapping universes and raise mapping objects to the universe of the coherent nerve when necessary.
- All enriched mapping objects are Kan; ordinary simplicial categories without this hypothesis are not covered.

**Proof.**

1. Translate an inner-horn extension into extension along the corresponding simplicial thickening. Only the endpoint mapping cube differs; its punctured-cube inclusion is anodyne, so the Kan hypothesis gives a filler (HTT 1.1.5.10).
2. Identify the right mapping space with Sing_Q C(x,y) using HTT 2.2.2.13. The Q realization/singular Quillen equivalence and its natural comparison for Kan objects identify this with C(x,y) (2.2.2.7–11).
3. Check enriched composition on the resulting homotopy mapping spaces and track universe lifts. This is a general theorem, independently of the DG nerve comparison.

**Direct prerequisites.**

- `mathlib:CategoryTheory.SimplicialNerve`
- [`E0/mapping-space-kan-and-equivalences`](#n-e0-mapping-space-kan-and-equivalences) — Right mapping spaces are spaces

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Proposition 1.1.5.10 and proof, printed pp. 23–24 (PDF pp. 41–42); Propositions 2.2.2.7, 2.2.2.9, 2.2.2.13 and Remark 2.2.2.11, printed pp. 76–78 (PDF pp. 94–96). The locally Kan hypothesis supplies horn fillers, and the Q-singular description compares right mapping spaces with enriched Hom.

**Acceptance.**

- The nerve is a quasicategory and its mapping comparison is a space equivalence, without assuming either conclusion as an input field.
- For a discrete ordinary category the comparison recovers its Hom sets; for a one-object simplicial group it retains the full mapping group.

**Lean prototype:** partial (`coherentNerveVertex`, `locallyKan_coherentNerve_quasicategory`, `locallyKan_coherentNerve_mappingComparison`, `locallyKan_coherentNerve_mappingEquiv`). Locally Kan nerve and mapping equivalence are typed for equal object/mapping universes. General universe lifts and naturality in enriched functors/composition remain mathematical obligations; no proof is claimed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e0-higher-category-carrier"></a>
#### The infinity category of small categories

`E0/higher-category-carrier` · construction

Build Cat∞ from the simplicial category whose objects are u-small quasicategories and whose enriched maps from C to D are the core of Fun(C,D). Its homotopy-coherent nerve is a quasicategory in u+1. Thus Map_Cat∞(C,D) is equivalent to core Fun(C,D), retaining functors and invertible transformations of every order.

**Hypotheses.**

- Fix a small universe u and the next universe u+1; categorical assertions assume quasicategories.

**Construction.**

1. Use strictly associative internal-Hom composition restricted to cores. Its mapping objects are Kan by the core theorem.
2. The homotopy-coherent nerve of this locally Kan simplicial category is a quasicategory; compare its right mapping spaces with the enriched mapping objects. Track the u to u+1 lift explicitly.

**Direct prerequisites.**

- [`E0/enhanced-core`](#n-e0-enhanced-core) — Maximal Kan core
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations
- [`E0/mapping-space-kan-and-equivalences`](#n-e0-mapping-space-kan-and-equivalences) — Right mapping spaces are spaces
- [`E0/locally-kan-coherent-nerve`](#n-e0-locally-kan-coherent-nerve) — Coherent nerve of a locally Kan category

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Definition 3.0.0.1 and Remarks 3.0.0.2–5, printed pp. 144–145 (PDF pp. 162–163); Proposition 1.1.5.10. Higher-category carrier or size condition required by the enhanced diagrams; ordinary categories are comparison fixtures.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening: provides the classifier codomain

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `catInfinity` | constructor | The next-universe coherent nerve of the simplicial category. | included |
| `catInfinity_vertices` | equivalence | Vertices identify with small quasicategories. | included |
| `catInfinity_mappingComparison` | data | Comparison to the universe lift of core Fun(C,D). | included |
| `catInfinity_mappingEquiv` | equivalence | The mapping comparison is an equivalence of Kan spaces. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `higherCategory_point` | degenerate | Mapping any C to the terminal category gives a contractible space. | included |
| `higherCategory_interval` | compatibility | Maps out of Δ[1] retain the core of the coherent arrow category. | included |
| `higherCategory_not_homotopy_category` | non-example | Map_Cat∞(Δ[0],Δ[1]) has two components, so is not contractible. Replacing the core by the whole interval would give the wrong space. | included |

**Acceptance.**

- Mapping any C to the terminal category gives a contractible space.
- Maps out of Δ[1] retain the core of the coherent arrow category.
- Map_Cat∞(Δ[0],Δ[1]) has two components, so is not contractible. Replacing the core by the whole interval would give the wrong space.

**Lean prototype:** included (`catInfinity`, `catInfinity_quasicategory`, `catInfinity_vertices`, `catInfinity_mappingEquiv`). The next-universe category and its core-of-functors mapping comparison are typed; every proof and carrier construction remains a placeholder.

<a id="n-e0-cocartesian-fibrations-and-restricted-straightening"></a>
#### Restricted straightening and sections

`E0/cocartesian-fibrations-and-restricted-straightening` · theorem · planet: **Straightening**

For each small base B used here (NΔ, N(ℕᵒᵖ), their interval products, and small hypercover-refinement categories), straightening and unstraightening identify functors B→Cat∞ with coCartesian fibrations over B. The fibre at b identifies with the value at b, transport with the assigned functor, and base change with restriction. The category of coCartesian sections is the limit of the classified diagram.

**Proof.**

1. Use marked simplicial sets whose marked edges are the coCartesian edges. Construct relative coherent realization and its nerve; prove the marked-model Quillen equivalence and restrict its derived equivalence to the listed small bases. Identify sections by their fibrewise universal property.

**Direct prerequisites.**

- [`E0/cocartesian-edges-and-fibrations`](#n-e0-cocartesian-edges-and-fibrations) — CoCartesian fibrations
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations
- [`E0/limits-colimits-universal-properties`](#n-e0-limits-colimits-universal-properties) — Enhanced limits and colimits
- `mathlib:CategoryTheory.Grothendieck`
- [`E0/higher-category-carrier`](#n-e0-higher-category-carrier) — The infinity category of small categories

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Theorem 3.2.0.1, PDF p. 187; Corollary 3.3.3.2, PDF p. 234, with the coCartesian dual. Dualizing marked Cartesian straightening gives the coCartesian classification and the sections/limit formula.

**Acceptance.**

- For an ordinary Cat-valued diagram recover its Grothendieck construction.
- For a constant diagram the coCartesian section category is Fun(B^gpd,C), equivalently the full subcategory of Fun(B,C) sending every base edge to an equivalence; for B an interval it is equivalent to C.
- For an inverse sequence the result retains coherent transition equivalences; h(lim C_n) need not equal lim h(C_n).

**Lean prototype:** omitted. The signed DG/Dold–Kan comparison or the higher cone, coCartesian, compactness and coherent universal-property condition is not yet expressed at the pinned interfaces; the mathematical statement remains in the node.

**Open obligations:** gap [G0.2](#gap-g0-2) (CoCartesian and accessible higher-category interfaces); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e0-dold-kan-simplicial-enrichment"></a>
#### Simplicial enrichment of a DG category

`E0/dold-kan-simplicial-enrichment` · construction

Given a DG category C in homological grading, construct C_Δ with the same objects and simplicial Hom sets underlying DK(τ≥0 Map_C(x,y)). Composition is induced by the right-lax monoidal truncation and Dold–Kan functors, using Alexander–Whitney, followed by forgetting abelian groups.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Construction.**

1. Transport enriched composition through the right-lax monoidal functors.
2. Use their unit/associativity constraints to verify the enriched-category axioms.
3. Simplicial abelian groups are Kan, so all mapping spaces are fibrant; the proof of this general fact remains to be decomposed.

**Direct prerequisites.**

- `mathlib:CategoryTheory.Abelian.DoldKan.equivalence`
- [`E0/dg-nerve`](#n-e0-dg-nerve) — Differential graded nerve
- `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules`

**Sources.**

- [Higher Algebra](#src-e0-lurie-ha), Construction 1.3.1.13 and Remark 1.3.1.14, pp. 83–84. Underlying simplicial enrichment; the lax-monoidal coherence proofs are dependencies, not supplied by the plain Dold–Kan equivalence.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E0/dg-nerve-coherent-comparison: Input to the existing SimplicialNerve.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `dgSimplicialCategory` | constructor | C_Δ with the stated objects and mapping objects. | omitted |
| `dgSimplicialCategory_hom` | structure | Its Hom(x,y) is the underlying DK of good connective truncation. | omitted |
| `dgSimplicialCategory_unit` | compatibility | The enriched unit is the constant simplex associated to id_x. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `dgSimplicialCategory_degree_zero` | compatibility | For Hom concentrated in degree zero, every mapping simplicial set is constant. | omitted |
| `dgSimplicialCategory_zero_hom` | degenerate | A zero Hom complex gives the one-point simplicial abelian group. | omitted |
| `dgSimplicialCategory_composition_zero` | computation | On 0-simplices the composition is the original composition of closed degree-zero maps. | omitted |

**Acceptance.**

- Check every displayed hypothesis and the indicated small-case specialization.

**Lean prototype:** omitted. The signed DG/Dold–Kan comparison or the higher cone, coCartesian, compactness and coherent universal-property condition is not yet expressed at the pinned interfaces; the mathematical statement remains in the node.

**Open obligations:** gap [G0.1](#gap-g0-1) (Signed enrichment and nerve comparison); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions); request [R0.3](#req-r0-3) to `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules`.

<a id="n-e0-dg-nerve-coherent-comparison"></a>
#### Homotopy-coherent nerve comparison

`E0/dg-nerve-coherent-comparison` · comparison

For every DG category C, the canonical map θ:N(C_Δ)→N_dg(C) is an equivalence of quasicategories. Here N is the homotopy-coherent simplicial nerve and C_Δ is the simplicial enrichment. This is not a statement about the ordinary nerve of the underlying category.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Define θ on each coherence f_I by the alternating sum over permutations of the interior vertices of I, evaluated on the chains of subsets in C[Δⁿ]. Verify faces and degeneracies.
2. θ is identity on vertices. Identify source right mapping spaces as Sing_Q DK(τ≥0 Map), and target ones by the dg mapping-space comparison.
3. HTT 2.2.2.7, 2.2.2.9 and 2.2.2.13 identify the Q-cosimplicial mapping model and prove the comparison fully faithful. The signed normalized-chain bridge with the pinned enrichment is a separate required comparison.

**Direct prerequisites.**

- [`E0/dold-kan-simplicial-enrichment`](#n-e0-dold-kan-simplicial-enrichment) — Simplicial enrichment of a DG category
- [`E0/dg-nerve-mapping-space`](#n-e0-dg-nerve-mapping-space) — Dold–Kan mapping-space comparison
- [`E0/dg-nerve-inner-horns`](#n-e0-dg-nerve-inner-horns) — Inner horn filling for the dg nerve
- `mathlib:CategoryTheory.SimplicialNerve`

**Sources.**

- [Higher Algebra](#src-e0-lurie-ha), Construction 1.3.1.16 and Proposition 1.3.1.17, pp. 84–85. Corrects the inherited identification of N(C_Δ) as an ordinary nerve; the source itself is correct.

**Acceptance.**

- θ is bijective in dimensions ≤2; do not upgrade it to an isomorphism in all dimensions.
- Recover the degree-zero preadditive case.

**Lean prototype:** omitted. The signed DG/Dold–Kan comparison or the higher cone, coCartesian, compactness and coherent universal-property condition is not yet expressed at the pinned interfaces; the mathematical statement remains in the node.

**Open obligations:** gap [G0.1](#gap-g0-1) (Signed enrichment and nerve comparison); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e0-space-category-carrier"></a>
#### The infinity category of spaces

`E0/space-category-carrier` · construction

Build Spaces_u as the coherent nerve of u-small Kan complexes with simplicial internal-Hom mapping objects. For Kan K and L, Map_Spaces(K,L) is equivalent to Fun(K,L), in the next universe. The representable functors used in compactness take values in this carrier.

**Hypotheses.**

- Fix a small universe u and the next universe u+1; categorical assertions assume quasicategories.

**Construction.**

1. Internal Hom into a Kan complex is Kan. Strict composition provides the enrichment.
2. Apply the locally Kan coherent-nerve theorem and its mapping-space comparison; the terminal, empty and finite discrete calculations test the carrier.

**Direct prerequisites.**

- [`E0/enhanced-core`](#n-e0-enhanced-core) — Maximal Kan core
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations
- [`E0/higher-category-carrier`](#n-e0-higher-category-carrier) — The infinity category of small categories
- [`E0/locally-kan-coherent-nerve`](#n-e0-locally-kan-coherent-nerve) — Coherent nerve of a locally Kan category

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), §1.2.5, printed pp. 34–36 (PDF pp. 52–54); Definition 3.0.0.1, printed p. 144 (PDF p. 162). Higher-category carrier or size condition required by the enhanced diagrams; ordinary categories are comparison fixtures.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E0/locally-small-mapping-models: representables must have a precise space-valued codomain
- EnhancedDerivedSheaves:E3/representability: target of the representability theorem

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `spaceInfinity` | constructor | Coherent nerve of the Kan-complex enrichment. | included |
| `spaceInfinity_vertices` | equivalence | Vertices are u-small Kan complexes. | included |
| `spaceInfinity_mappingComparison` | data | Mapping-space comparison with the universe lift of Fun(K,L). | included |
| `spaceInfinity_mappingEquiv` | equivalence | The comparison is an equivalence. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `spaceCategory_point` | compatibility | Map(*,K) recovers K. | included |
| `spaceCategory_empty` | non-example | For nonempty K, Map(K,∅) has no vertices. | included |
| `spaceCategory_discrete_two` | computation | The self-mapping space of the discrete two-point space is the discrete four-point space. | included |

**Acceptance.**

- Map(*,K) recovers K.
- For nonempty K, Map(K,∅) has no vertices.
- The self-mapping space of the discrete two-point space is the discrete four-point space.

**Lean prototype:** included (`spaceInfinity`, `spaceInfinity_quasicategory`, `spaceInfinity_vertices`, `spaceInfinity_mappingEquiv`). The Kan-complex category and its internal-Hom mapping comparison are typed; no implementation is claimed.

<a id="n-e0-locally-small-mapping-models"></a>
#### Universe control for mapping spaces

`E0/locally-small-mapping-models` · construction

For a quasicategory C in u+1, local u-smallness means that every right mapping Kan complex is homotopy equivalent to a u-small Kan complex after universe lift. Choose such small models and comparison equivalences. The coherent representable Map_C(x,−) lands in Spaces_u, with evaluation naturally equivalent to the chosen model at y. The underlying simplex type of the original mapping space need not itself be u-small.

**Hypotheses.**

- Fix a small universe u and the next universe u+1; categorical assertions assume quasicategories.

**Construction.**

1. Use essential smallness of mapping spaces, equivalently a small Kan model with homotopy-inverse comparison maps. HTT 5.4.1.5 explains the homotopy-group/minimal-model criterion; 5.4.1.7 is the local-smallness definition.
2. Transport the coherent mapping functor through the full inclusion Spaces_u into larger spaces. Existence of small models at every vertex puts its essential image there; transfer the diagram with all coherence, rather than choosing unrelated vertexwise assignments.
3. Compare evaluation by natural equivalences. A contractible large Kan model is the regression case distinguishing homotopy size from raw simplex size.

**Direct prerequisites.**

- [`E0/right-mapping-space`](#n-e0-right-mapping-space) — Right mapping space
- [`E0/space-category-carrier`](#n-e0-space-category-carrier) — The infinity category of spaces
- `mathlib:Small`

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Corollary 5.4.1.5 and Proposition 5.4.1.7, printed pp. 421–423 (PDF pp. 439–441). Local smallness concerns the homotopy type of each mapping space; a small Kan model, not raw simplex smallness, is required.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E0/accessible-and-presentable: small mapping models make the universe of compactness explicit

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `HasSmallSpaceModel` | characterisation | A Kan complex has a lifted u-small Kan model and comparison maps inverse up to simplicial homotopy. | included |
| `IsLocallySmall` | characterisation | C is a quasicategory whose right mapping spaces have u-small Kan models up to homotopy equivalence. | included |
| `smallMappingSpace` | constructor | Choose a small Kan mapping model. | included |
| `smallMappingSpace_compare` | equivalence | Comparison after universe lift is a space equivalence. | included |
| `representableSpaceFunctor` | constructor | The coherent Map(x,−) functor into Spaces_u. | included |
| `representableSpaceFunctor_vertex` | compatibility | The evaluation comparison is an equivalence edge, naturally in y. | partial |
| `representableSpaceFunctor_vertexComparison` | compatibility | A coherent evaluation comparison edge to the chosen small model, invertible and natural in y. | partial |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `localSmall_raise` | degenerate | The lift of a u-small quasicategory is locally u-small. | included |
| `localSmall_sets` | compatibility | The category of u-small sets is locally u-small. | included |
| `localSmall_large_hom` | non-example | The nerve of an ordinary category with a Hom type that is not u-small fails local u-smallness. | included |
| `localSmall_contractible_large_model` | non-example | A contractible Kan complex has a u-small point model even when its raw nondegenerate-simplex type is not u-small, for example the nerve of an indiscrete groupoid on a larger nonempty type. Such a mapping-space presentation must not fail the homotopy-smallness predicate. | included |

**Acceptance.**

- The lift of a u-small simplicial set is locally u-small.
- The category of u-small sets is locally u-small.
- The nerve of an ordinary category with a Hom type that is not u-small fails local u-smallness.

**Lean prototype:** partial (`IsLocallySmall`, `smallMappingSpace`, `smallMappingSpace_compare_equiv`, `representableSpaceFunctor`, `representableSpaceFunctor_vertex`, `HasSmallSpaceModel`, `representableSpaceFunctor_vertexComparison`). Homotopy-small Kan models and invertible representable evaluation are typed. Coherent naturality of chosen models/evaluation remains untyped.

<a id="n-e0-kappa-filtered-diagrams"></a>
#### Cardinal filteredness of coherent diagrams

`E0/kappa-filtered-diagrams` · construction

For an infinite regular cardinal κ and a quasicategory K, require every map Y→K with fewer than κ nondegenerate simplices to extend to Y⋆Δ[0]→K. This is κ-filteredness. The empty Y requires a vertex in K; the finite discrete two-point diagram requires a common cocone.

**Hypotheses.**

- Fix a small universe u and the next universe u+1; categorical assertions assume quasicategories.

**Construction.**

1. Use the join from E0 and count nondegenerate simplices, not all degenerate simplices.
2. For ordinary posets recover upper bounds of fewer than κ vertices; compare the finite-cone definition and the higher horn coherences.

**Direct prerequisites.**

- [`E0/limits-colimits-and-slices`](#n-e0-limits-colimits-and-slices) — The simplicial join
- `mathlib:Cardinal.IsRegular`

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Definition 5.3.1.7 and Example 5.3.1.8, printed pp. 382–383 (PDF pp. 400–401). Higher-category carrier or size condition required by the enhanced diagrams; ordinary categories are comparison fixtures.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E0/accessible-and-presentable: filtered colimits define compactness and accessibility

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `IsKappaFiltered` | characterisation | The stated cone-extension formula. | included |
| `HasKappaFilteredColimits` | characterisation | Existence of colimits for all small κ-filtered diagrams in C. | included |
| `PreservesKappaFilteredColimits` | characterisation | Every such colimit cone is sent to a colimit cone. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `filtered_point` | degenerate | Δ[0] is κ-filtered for every infinite regular κ. | included |
| `filtered_empty` | non-example | The empty simplicial set is not κ-filtered. | included |
| `filtered_discrete_two` | non-example | The nerve of the discrete two-point category is not ω-filtered. | included |

**Acceptance.**

- Δ[0] is κ-filtered for every infinite regular κ.
- The empty simplicial set is not κ-filtered.
- The nerve of the discrete two-point category is not ω-filtered.

**Lean prototype:** included (`IsKappaFiltered`, `HasKappaFilteredColimits`, `PreservesKappaFilteredColimits`). The cone-extension, existence and preservation conditions quantify actual small coherent diagrams.

<a id="n-e0-accessible-and-presentable"></a>
#### Accessible and presentable quasicategories

`E0/accessible-and-presentable` · definition · planet: **Presentable infinity categories**

For a regular cardinal κ, an object c is κ-compact when Map(c,−) preserves κ-filtered colimits. C is κ-accessible when it admits these colimits and is generated under them by a small full subcategory of κ-compact objects. A functor is accessible when it preserves κ-filtered colimits for some common regular κ. A presentable category is accessible and admits all small colimits in the chosen universe.

**Hypotheses.**

- C lies in u+1 and is locally u-small. Diagrams and generating families are u-small; κ is infinite regular. Compactness includes existence of κ-filtered colimits, rather than vacuous preservation.

**Construction.**

1. State compactness using mapping spaces, not sets of homotopy classes. Specify the universe and regular cardinal consistently for diagrams, generators and accessibility.

**Direct prerequisites.**

- [`E0/limits-colimits-universal-properties`](#n-e0-limits-colimits-universal-properties) — Enhanced limits and colimits
- [`E0/mapping-space-kan-and-equivalences`](#n-e0-mapping-space-kan-and-equivalences) — Right mapping spaces are spaces
- [`E0/locally-small-mapping-models`](#n-e0-locally-small-mapping-models) — Universe control for mapping spaces
- [`E0/kappa-filtered-diagrams`](#n-e0-kappa-filtered-diagrams) — Cardinal filteredness of coherent diagrams

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Definition 5.3.4.5, PDF p. 414; Definition 5.4.2.1 and Proposition 5.4.2.2, PDF pp. 441–442; Definition 5.5.0.1, PDF p. 474. These definitions are needed before E1 presentability and E3 adjoints; Ind-completion itself remains E5-owned.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E1/derived-presentability: combinatorial localization supplies this property
- EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations: the abstract adjoint theorem needs presentability

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `IsKappaCompact` | characterisation | Preservation of κ-filtered colimits by Map(c,−). | included |
| `IsAccessible` | characterisation | A small κ-compact generating family for a regular κ. | included |
| `IsPresentable` | characterisation | Accessibility together with all small colimits. | included |
| `presentable_universe` | compatibility | All diagrams and generating families are taken in the specified universe; a change of universe is recorded explicitly. | included |
| `IsKappaAccessible` | characterisation | κ-filtered colimits and a u-small κ-compact family generating every object. | included |
| `IsAccessibleFunctor` | characterisation | Preservation of κ-filtered colimits for some regular κ. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `compact_finite_free` | computation | A finite free R-module in degree zero is compact in D(R). | included |
| `compact_infinite_free` | non-example | ⊕_{n∈ℕ}ℤ[0] is not compact in D(ℤ): its identity does not factor through a finite subsum. | included |
| `presentable_zero` | degenerate | The zero stable category is presentable and its zero object is compact. | included |

**Acceptance.**

- A finite free R-module in degree zero is compact in D(R).
- ⊕_{n∈ℕ}ℤ[0] is not compact in D(ℤ): its identity does not factor through a finite subsum.
- The zero stable category is presentable and its zero object is compact.

**Lean prototype:** included (`IsKappaCompact`, `IsKappaAccessible`, `IsAccessible`, `IsPresentable`, `IsAccessibleFunctor`, `presentable_universe`). Actual mapping-space preservation, existence of filtered colimits, small generating families and regular cardinals at explicit universes. No Ind-completion theory is duplicated.

**Open obligations:** gap [G0.2](#gap-g0-2) (CoCartesian and accessible higher-category interfaces).


<a id="layer-e1"></a>

## E1 — Unbounded derived sheaves and presentability

Sheaves of modules on a small ringed site form a Grothendieck abelian category
(Mathlib). The enhancement is the dg nerve of the K-injective complexes, and
its homotopy category is identified with Mathlib's localization at
quasi-isomorphisms by mapping-space full faithfulness and essential
surjectivity; cohomology detects equivalences only after this comparison.
K-flat complexes are those whose tensor with every acyclic complex is acyclic;
bounded-above flat complexes and a filtered staircase give replacements of
unbounded complexes, which must be functorial and cardinal-bounded. D∞(O) is
presentable (accessible, not necessarily compactly generated); filtered
colimits are computed degreewise, and shifts of slice-free generators detect
objects. Derived tensor uses K-flat replacements, internal Hom a K-injective
second argument, and the tensor–Hom adjunction holds on mapping spaces.

Ringed pullback includes derived extension of scalars; pushforward is the
K-injective right derivation, and the adjunction between them is derived
through K-flat and K-injective comparisons rather than from preservation of
K-injectives, which needs an exact underived left adjoint. The coefficient map
ℤ → ℤ/p shows why scalar extension is not the ordinary tensor. The Koszul
complex of a linear form on an arbitrary module, a dg algebra augmenting to
A/(f) and perfect for finite projective modules, is planned here because E4
needs it and this roadmap precedes DerivedDeRhamCohomology.

The perfect-ring declarations serve E2's h-descent on perfect schemes. The
radical of a principal ideal in a perfect F_p-algebra is a filtered colimit of
free modules, which gives Tor independence of perfect algebras even for
nonflat quotient maps, but not Tor independence of arbitrary modules. A finite
perfect presentation bounds Tor dimension by the number of equations; finite
global dimension needs a regular Noetherian presentation of finite Krull
dimension, and the stronger intrinsic global-dimension claim of the source is
recorded as unproved (gap [G0.5](#gap-g0-5)). Dqc(X) is the enhancement of
complexes with quasicoherent cohomology; perfect schemes have derived base
change from Tor independence, and the splitting criterion tracks the
obstruction through a distinguished triangle for a connective complex.

<a id="n-e1-sheaves-of-modules-and-the-grothendieck-property"></a>
#### DG comparison for complexes of module sheaves

`E1/sheaves-of-modules-and-the-grothendieck-property` · comparison

For a small ringed site, use the pinned Grothendieck abelian category SheafOfModules O and instantiate the existing ℤ-linear Hom-complex enrichment on its unbounded cochain complexes. Compare its reindexed homological Hom complex Hom_m(F,G)=Hom^(−m)(F,G) and braiding-adjusted composition with HA 1.3.2.1, so that the dg-nerve construction applies to this existing carrier.

**Hypotheses.**

- O is a sheaf of rings on a small site; ℤ-linearity follows from preadditivity.
- The Grothendieck instance is already in Mathlib; it is not a planned declaration.
- The homological/cohomological reindexing and the order of tensor factors must both be compared.

**Proof.**

1. Import the pinned SheafOfModules Grothendieck instance and Tau Ceti enrichment.
2. Reindex the Hom differential by m↦−m and compare closed degree-zero maps with cochain maps.
3. Use the Koszul braiding to translate Mathlib enriched composition to the composition order in HA.

**Direct prerequisites.**

- `mathlib:SheafOfModules`
- `mathlib:CategoryTheory.IsGrothendieckAbelian`
- `tauceti:TauCeti.linearHomComplexEnrichedCategory`
- `mathlib:CategoryTheory.Preadditive`
- `tauceti:TauCetiRoadmap/DGAInfinity#layer-0-signed-graded-multilinear-and-tensor-coalgebra-infrastructure`

**Sources.**

- [Higher Algebra](#src-e0-lurie-ha), Definition 1.3.2.1 and Remark 1.3.2.2, p. 88. Read for the Hom differential and DG composition; the pinned-composition comparison is this node’s new obligation.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements: the replacements are constructed in this Grothendieck abelian category
- EnhancedDerivedSheaves:E1/enhanced-derived-category: the enhancement is the dg nerve of a model in this category
- DiamondEtaleCohomology:C0: the diamond sites instantiate it

**Acceptance.**

- Closed degree-zero elements are exactly chain maps.
- Degree-one homological boundaries identify homotopic maps.
- The ordinary underlying category remains the pinned cochain-complex category.

**Lean prototype:** omitted. The sheaf-level unbounded replacement/localization, coefficient and perfect-algebra comparison interfaces are not yet expressed; ordinary point-module signatures do not supply their generality or coherence.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions); request [R0.4](#req-r0-4) to `tauceti:TauCetiRoadmap/DGAInfinity#layer-0-signed-graded-multilinear-and-tensor-coalgebra-infrastructure`.

<a id="n-e1-k-injective-and-k-flat-replacements"></a>
#### Unbounded K-injective replacement

`E1/k-injective-and-k-flat-replacements` · theorem

For a Grothendieck abelian category A in the specified universe, unbounded complexes admit a functorial monomorphic quasi-isomorphism K→J(K), where J(K) is K-injective. The injective model structure on complexes has quasi-isomorphisms as weak equivalences and monomorphisms as cofibrations, is combinatorial, and its fibrant objects are K-injective complexes of injectives. A sufficiently large regular cardinal bounds the generating lifting problems.

**Proof.**

1. Use a generator and AB5 to choose a regular cardinal bounding small subcomplexes and their closure under differentials. Apply the injective small-object construction to factor K→0. Identify fibrancy using Hom from acyclic complexes and componentwise injectivity. The factorization is functorial by the chosen generating set.

**Direct prerequisites.**

- [`E1/sheaves-of-modules-and-the-grothendieck-property`](#n-e1-sheaves-of-modules-and-the-grothendieck-property) — DG comparison for complexes of module sheaves
- `mathlib:CochainComplex.IsKInjective`
- `mathlib:CategoryTheory.IsGrothendieckAbelian`

**Sources.**

- [Higher Algebra](#src-e0-lurie-ha), Proposition 1.3.5.3, Remarks 1.3.5.4–1.3.5.7 and Lemma 1.3.5.11, printed/PDF pp. 121–126. The injective combinatorial model and its Hom-acyclicity characterize the fibrant replacement.

**Acceptance.**

- The replacement applies to a complex with nonzero terms in arbitrarily negative degrees.
- A quasi-isomorphism between K-injective complexes is a chain homotopy equivalence.
- The size bound uses one regular cardinal for the site and ring, not one chosen separately for each map.

**Lean prototype:** partial (`kInjective_replacement`). Objectwise quasi-isomorphic K-injective replacement only; monomorphism, termwise injectivity, functoriality and uniform size/model structure are omitted.

**Open obligations:** gap [G0.3](#gap-g0-3) (Functorial replacements with universe control); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions); request [R0.1](#req-r0-1) to `DiamondsAndVStacks:D0`.

<a id="n-e1-enhanced-derived-category"></a>
#### The enhanced derived category

`E1/enhanced-derived-category` · construction · planet: **Derived infinity category**

Let A be a Grothendieck abelian category. D∞(A) is the dg nerve of the full dg category of K-injective complexes of injectives. Its homotopy category is equivalent to the pinned DerivedCategory A through the quasi-isomorphism localization; the comparison sends a complex to its K-injective replacement. Map(K,L) is Dold–Kan of the nonnegative homological truncation of derived Hom(K,L), with π_i=H^(−i)RHom(K,L) for i≥0. It is stable, with the pinned cone/shift convention.

**Construction.**

1. Compare the ordinary nerve of complexes localized at quasi-isomorphisms with the dg nerve of fibrant complexes. Use K-injective replacement for essential surjectivity and the Hom-acyclic lifting argument for mapping-space full faithfulness. Identify the ordinary localization with Mathlib DerivedCategory. Zero, cones and shifts verify stability.

**Direct prerequisites.**

- [`E1/k-injective-and-k-flat-replacements`](#n-e1-k-injective-and-k-flat-replacements) — Unbounded K-injective replacement
- [`E1/sheaves-of-modules-and-the-grothendieck-property`](#n-e1-sheaves-of-modules-and-the-grothendieck-property) — DG comparison for complexes of module sheaves
- [`E0/dg-nerve`](#n-e0-dg-nerve) — Differential graded nerve
- [`E0/dg-nerve-mapping-space`](#n-e0-dg-nerve-mapping-space) — Dold–Kan mapping-space comparison
- [`E0/stable-api-and-the-sign-comparison`](#n-e0-stable-api-and-the-sign-comparison) — The stable API, and the comparison of shifts and cone signs with the cochain convention
- [`E0/stable-categories`](#n-e0-stable-categories) — Stable quasicategories
- `mathlib:DerivedCategory`
- `mathlib:DerivedCategory.isIso_iff`
- `mathlib:DerivedCategory.isIso_Q_map_iff_quasiIso`

**Sources.**

- [Higher Algebra](#src-e0-lurie-ha), Definition 1.3.5.8, Proposition 1.3.5.9 and Proposition 1.3.5.15, pp. 124–127. The dg nerve of the fibrant model gives the derived enhancement and its localization comparison.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E2/coherent-towers-and-roos: inverse limits take place in this enhancement
- AInfCohomology:AI.1: unbounded sheaf tensor and descent use this common enhancement

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `enhancedDerived` | constructor | The dg nerve of the full K-injective dg model. | partial |
| `enhancedDerived.homotopyCategory` | equivalence | The canonical equivalence hD∞(A)≌DerivedCategory A. | partial |
| `enhancedDerived.mappingSpaces` | compatibility | The Dold–Kan computation and π_i=H^(−i)RHom formula. | omitted |
| `enhancedDerived.isStable` | structure | The stable-category instance with its cone/shift comparison. | omitted |
| `detection` | characterisation | A complex map becomes an equivalence precisely when it is a quasi-isomorphism; equivalences are detected by every integer cohomology object. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `enhancedDerived_zero` | degenerate | The zero complex is a zero object and its self-mapping space is contractible. | included |
| `enhancedDerived_Zmodp` | computation | For p prime, Map_D(ℤ/p,ℤ/p[1]) has π₁≅ℤ/p as well as π₀≅Ext¹_ℤ(ℤ/p,ℤ/p); a discrete Hom set loses the π₁. | omitted |
| `enhancedDerived_ordinary` | compatibility | The equivalence of homotopy categories carries the localization of any complex map to DerivedCategory.Q.map of that map. | omitted |

**Acceptance.**

- The zero complex is a zero object and its self-mapping space is contractible.
- For p prime, Hom_D(ℤ/p,ℤ/p[1])≅ℤ/p, so the corresponding derived mapping space cannot be replaced by a discrete set of chain maps.
- The equivalence of homotopy categories carries the localization of any complex map to DerivedCategory.Q.map of that map.

**Lean prototype:** partial (`enhancedDerived`, `enhancedDerived.homotopyCategory`, `enhancedLocalization`, `derivedVertex`, `enhancedDerived_quasicategory`). Generic Grothendieck abelian carrier and ordinary equivalence; canonical localization compatibility, stable structure, derived-Hom computation and detection are omitted.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e1-k-flat-complexes"></a>
#### K-flat complexes of module sheaves

`E1/k-flat-complexes` · definition

A complex P of module sheaves over a commutative sheaf of rings O is K-flat when, for every acyclic complex A of O-modules, the direct-sum total tensor A⊗_O P is acyclic. This is a homological condition on all unbounded test complexes. Termwise flatness alone is not its definition.

**Construction.**

1. Use sheafification of the total tensor with the cochain Koszul signs. Express acyclicity using the pinned homology functors.

**Direct prerequisites.**

- `mathlib:CochainComplex`
- `mathlib:SheafOfModules`
- `mathlib:CategoryTheory.Abelian`

**Sources.**

- [The Stacks Project, Cohomology on Sites](#src-e0-stacks-project), Cohomology on Sites, Definition 21.17.2 (06YN), Lemmas 21.17.4–6 (0E8K, 07A2, 07A3), PDF p. 29. The unbounded direct-sum tensor criterion defines K-flatness.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E1/k-flat-replacement: the target replacement must satisfy this universal acyclicity condition
- EnhancedDerivedSheaves:E1/presentability-and-derived-tensor: the localization tensor is constructed on K-flat models

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `IsKFlat` | characterisation | Tensor with every acyclic complex is acyclic. | partial |
| `isKFlat_boundedAbove` | structure | A bounded-above complex of flat module sheaves is K-flat. | partial |
| `isKFlat_tensor` | structure | The total tensor of two K-flat complexes is K-flat. | partial |
| `isKFlat_quasiIso_tensor` | compatibility | A quasi-isomorphism between K-flat complexes remains a quasi-isomorphism after tensoring with any complex. | partial |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `kFlat_unit` | degenerate | O[0] is K-flat. | included |
| `kFlat_flat_shift` | computation | A flat module F placed in any single degree is K-flat. | included |
| `kFlat_not_Zmodp` | non-example | For p prime, (ℤ/p)[0] is not K-flat over ℤ: tensoring the acyclic cone of [ℤ --p→ ℤ]→(ℤ/p)[0] gives nonzero cohomology. | included |

**Acceptance.**

- O[0] is K-flat.
- A flat module F placed in any single degree is K-flat.
- For p prime, (ℤ/p)[0] is not K-flat over ℤ: tensoring the acyclic cone of [ℤ --p→ ℤ]→(ℤ/p)[0] gives nonzero cohomology.

**Lean prototype:** partial (`IsKFlat`). Actual signed tensor/acyclicity predicate for modules at a point; sheaf version is omitted.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e1-k-flat-replacement"></a>
#### Unbounded K-flat replacement

`E1/k-flat-replacement` · theorem

On a small ringed site every unbounded O-complex K admits a termwise epimorphic quasi-isomorphism P(K)→K with P(K) termwise flat and K-flat. The free-module-cover staircase can be chosen functorially after fixing a universe and a generating covering family; the resulting diagrams have cardinality bounded by the input, site, coefficient sheaf and one regular closure cardinal.

**Proof.**

1. Cover modules using sums of slice-free modules and resolve bounded-above truncation complexes by these flat covers. Arrange the maps in a staircase with degreewise split monomorphisms between the flat approximations. Its filtered colimit is K-flat by AB5 and resolves K. Use the sum of all free cover maps rather than an objectwise arbitrary choice to obtain functoriality; record the regular-cardinal closure argument.

**Direct prerequisites.**

- [`E1/k-flat-complexes`](#n-e1-k-flat-complexes) — K-flat complexes of module sheaves
- [`E1/sheaves-of-modules-and-the-grothendieck-property`](#n-e1-sheaves-of-modules-and-the-grothendieck-property) — DG comparison for complexes of module sheaves
- `DiamondsAndVStacks:D0`

**Sources.**

- [The Stacks Project, Cohomology on Sites](#src-e0-stacks-project), Cohomology on Sites, Lemmas 21.17.8–12 (06YQ, 06YR, 077J, 06YS, 06YT), PDF pp. 30–31. Free sheaf covers and a filtered staircase construct unbounded K-flat resolutions; tensor invariance follows.

**Acceptance.**

- No lower boundedness on K is imposed.
- Tensoring two replacements computes the derived tensor, and replacing either model changes the result by a quasi-isomorphism.
- Functoriality and the single-universe cardinal bound are part of the construction, not consequences of objectwise existence alone.

**Lean prototype:** partial (`kFlat_replacement`). Point modules and objectwise existence only; flat terms, sheaf version, functoriality and cardinal control are omitted.

**Open obligations:** gap [G0.3](#gap-g0-3) (Functorial replacements with universe control); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions); request [R0.1](#req-r0-1) to `DiamondsAndVStacks:D0`.

<a id="n-e1-derived-presentability"></a>
#### Presentability of unbounded derived sheaves

`E1/derived-presentability` · theorem

For a small ringed site D∞(O) is presentable. Its localization functor from complexes inverts exactly quasi-isomorphisms and is accessible. Filtered homotopy colimits are represented by degreewise filtered colimits of complexes; cohomology commutes with them. Shifts of slice-free sheaf generators form a small detecting family, enlarged to κ-compact generators for a sufficiently large regular κ. This asserts accessibility, not compact generation for every site.

**Proof.**

1. Identify D∞ with the localization of the injective combinatorial model. Its small generating cofibrations and lifting maps provide an accessibility cardinal. AB5 identifies filtered homotopy colimits with degreewise colimits. A sheaf generator and all its shifts detect cohomology; choose a larger regular cardinal making their derived mapping functors κ-continuous.

**Direct prerequisites.**

- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/k-injective-and-k-flat-replacements`](#n-e1-k-injective-and-k-flat-replacements) — Unbounded K-injective replacement
- [`E0/accessible-and-presentable`](#n-e0-accessible-and-presentable) — Accessible and presentable quasicategories
- `mathlib:CategoryTheory.IsGrothendieckAbelian`
- `DiamondsAndVStacks:D0`

**Sources.**

- [Higher Algebra](#src-e0-lurie-ha), Proposition 1.3.5.21 and Warning 1.3.5.22, pp. 128–130. The combinatorial injective localization is presentable and filtered-colimit compatible, without automatic left completeness.

**Acceptance.**

- Infinite coproducts are represented by degreewise sums of complexes.
- Do not infer ω-compactness from the existence of a sheaf generator.
- The profinite-group counterexample to left completeness remains compatible with presentability.

**Lean prototype:** omitted. The sheaf-level unbounded replacement/localization, coefficient and perfect-algebra comparison interfaces are not yet expressed; ordinary point-module signatures do not supply their generality or coherence.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions); request [R0.1](#req-r0-1) to `DiamondsAndVStacks:D0`.

<a id="n-e1-presentability-and-derived-tensor"></a>
#### Derived sheaf tensor

`E1/presentability-and-derived-tensor` · construction · planet: **Derived tensor product**

For a commutative sheaf of rings O, define K⊗ᴸ_O L by the direct-sum total tensor of K-flat replacements and transfer it through the dg localization to D∞(O). It is independent of replacements, symmetric, associative and unital up to their coherent derived equivalences, and preserves small colimits separately. The cochain differential is d(x⊗y)=dx⊗y+(−1)^deg(x)x⊗dy.

**Construction.**

1. Tensor quasi-isomorphisms between K-flat models remain quasi-isomorphisms. Localize the multivariable K-flat relative category, retaining its symmetric-monoidal associators, unitors and braiding. Compare the resulting localization with the K-injective enhancement; tensor never requires K-injectives to be tensor-closed. A point-free coherence extension is recorded as a precise gap.

**Direct prerequisites.**

- [`E1/k-flat-complexes`](#n-e1-k-flat-complexes) — K-flat complexes of module sheaves
- [`E1/k-flat-replacement`](#n-e1-k-flat-replacement) — Unbounded K-flat replacement
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/derived-presentability`](#n-e1-derived-presentability) — Presentability of unbounded derived sheaves
- [`E0/cocartesian-fibrations-and-restricted-straightening`](#n-e0-cocartesian-fibrations-and-restricted-straightening) — Restricted straightening and sections
- `mathlib:CategoryTheory.MonoidalCategory`
- `mathlib:HomologicalComplex.monoidalCategory`

**Sources.**

- [The Stacks Project, Cohomology on Sites](#src-e0-stacks-project), Cohomology on Sites, Lemmas 21.17.5 and 21.17.12 (07A2, 06YT), Definition 21.17.13 (06YU), PDF pp. 29–31. K-flat tensor is invariant under quasi-isomorphisms and gives the ordinary derived tensor.
- [Enhanced six operations and base change theorem for higher Artin stacks](#src-e0-liuzheng-sixoperations), §3.1–§3.2, Proposition 3.1.3 and Lemma 3.2.2, pp. 84–87. Monoidal model localization supplies coherence when topoi have enough points; the point-free transfer is a separate proof input.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E4/completed-sheaf-tensor: completion is applied to this tensor
- EnhancedDerivedSheaves:E1/ringed-pullback-pushforward: ringed pullback includes this scalar extension

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `derivedTensor` | constructor | The enhanced bifunctor from the K-flat localization. | partial |
| `derivedTensor_map` | functoriality | Coherent tensor of maps, with identity and composition. | omitted |
| `derivedTensor_unit` | structure | O[0] is the tensor unit; associativity and the Koszul symmetry are coherent. | omitted |
| `derivedTensor_ordinary` | compatibility | Passing to hD∞ gives the ordinary K-flat-derived tensor. | omitted |
| `derivedTensor_colimits` | structure | Each tensor variable preserves small colimits. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `derivedTensor_unit_test` | degenerate | O[0]⊗ᴸK≃K. | omitted |
| `derivedTensor_Zmodp` | computation | Over ℤ, (ℤ/p)⊗ᴸ(ℤ/p) has ℤ/p in degrees −1 and 0, and no other cohomology. | omitted |
| `derivedTensor_flat` | compatibility | For a flat sheaf F in degree zero, F⊗ᴸK is represented by the ordinary tensor F⊗K. | omitted |
| `derivedTensor_sign` | computation | Interchanging two degree-one homogeneous elements introduces the sign −1. | omitted |

**Acceptance.**

- O[0]⊗ᴸK≃K.
- Over ℤ, (ℤ/p)⊗ᴸ(ℤ/p) has ℤ/p in degrees −1 and 0, and no other cohomology.
- For a flat sheaf F in degree zero, F⊗ᴸK is represented by the ordinary tensor F⊗K.
- Interchanging two degree-one homogeneous elements introduces the sign −1.

**Lean prototype:** partial (`derivedTensor`, `tensorVertex`). Point-module tensor carrier only; coherent localization, symmetric monoidal coherence and presentability are omitted.

**Open obligations:** gap [G0.4](#gap-g0-4) (Point-free enhanced ringed localization); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions); request [R0.1](#req-r0-1) to `DiamondsAndVStacks:D0`.

<a id="n-e1-derived-internal-hom"></a>
#### Derived internal Hom

`E1/derived-internal-hom` · construction

For K,L∈D∞(O), construct RHom_O(K,L) as the right adjoint in L to −⊗ᴸK, or by a compared K-injective internal Hom model. There is a natural mapping-space adjunction Map(M⊗ᴸK,L)≃Map(M,RHom(K,L)). Global sections give the derived Hom complex used by the mapping-space computation. Restriction to a slice preserves internal Hom.

**Construction.**

1. Construct the internal Hom using a K-injective replacement of the second argument and compare after a K-flat replacement of the first. The ordinary tensor/Hom adjunction descends to natural equivalences on all derived mapping spaces. The K-injective Hom lifting argument gives the representing comparison and coherent functoriality; the presentable Yoneda argument is a second proof, not an assumed adjoint field.
2. Use slice-free test generators to prove restriction compatibility.

**Direct prerequisites.**

- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- [`E1/k-injective-and-k-flat-replacements`](#n-e1-k-injective-and-k-flat-replacements) — Unbounded K-injective replacement
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Proposition 5.5.2.2 and Corollary 5.5.2.9, PDF pp. 481–484 (alternative Yoneda proof). Representability of the limit-preserving space-valued functor constructs the right adjoint.
- [Étale cohomology of diamonds](#src-e0-scholze-etalediamonds), Lemma 17.8, p. 100. The enhanced tensor/Hom representability argument; its étale coreflection is an application, not the ambient Hom.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E4/complete-internal-hom: completeness in the second variable is proved using the adjunction

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `derivedInternalHom` | constructor | The contravariant/covariant enhanced internal Hom. | partial |
| `derivedInternalHom_mapEquiv` | universal-property | The natural tensor/Hom mapping-space adjunction. | partial |
| `derivedInternalHom_unit` | simp | RHom(O,L)≃L. | omitted |
| `derivedInternalHom_ordinary` | compatibility | Its ordinary shadow is the K-injective-derived sheaf Hom. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `derivedHom_zero` | degenerate | RHom(0,L)≃0 and RHom(K,0)≃0. | included |
| `derivedHom_unit` | computation | RHom(O,L)≃L. | omitted |
| `derivedHom_Zmodp` | computation | Over ℤ, RHom(ℤ/p,ℤ) has ℤ/p in degree 1 and zero in all other degrees. | omitted |

**Acceptance.**

- RHom(0,L)≃0 and RHom(K,0)≃0.
- RHom(O,L)≃L.
- Over ℤ, RHom(ℤ/p,ℤ) has ℤ/p in degree 1 and zero in all other degrees.

**Lean prototype:** partial (`derivedInternalHom`, `derivedInternalHom_comparison`, `derivedInternalHom_mapEquiv`). Point-module object and actual space-equivalence adjunction; sheaf restriction, functoriality and ordinary comparison are omitted.

**Open obligations:** gap [G0.4](#gap-g0-4) (Point-free enhanced ringed localization); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e1-ringed-pullback-pushforward"></a>
#### Enhanced ringed pullback and pushforward

`E1/ringed-pullback-pushforward` · construction

For a morphism of ringed topoi f:(Y,S)→(X,R), with ring map f^(−1)R→S, define Lf* K=S⊗ᴸ_{f^(−1)R}f^(−1)K and Rf* by K-injective right derivation of f*. They form an enhanced adjunction. When S=f^(−1)R, Lf* agrees with the exact inverse-image functor. Composition of ringed morphisms gives coherent composition equivalences.

**Construction.**

1. Use exact inverse image of underlying sheaves and K-flat scalar extension to construct Lf*. Derive f* using a K-injective target model and compare dg Hom complexes to prove the derived mapping-space adjunction.
2. A right adjoint preserves K-injectives when its underived left adjoint is exact, as for a slice restriction or unchanged coefficients. Do not assert this for general ringed pushforward: restriction from Z/p to Z already fails to preserve injectives.
3. Descend both operations through localization and prove coherent composition of derived ringed morphisms. The enough-points construction is a comparison input; the arbitrary-topos extension remains the recorded point-free gap.

**Direct prerequisites.**

- [`E1/k-flat-replacement`](#n-e1-k-flat-replacement) — Unbounded K-flat replacement
- [`E1/k-injective-and-k-flat-replacements`](#n-e1-k-injective-and-k-flat-replacements) — Unbounded K-injective replacement
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations
- `DiamondsAndVStacks:D0`

**Sources.**

- [The Stacks Project, Cohomology on Sites](#src-e0-stacks-project), Cohomology on Sites, Lemmas 21.18.1–3 (0G7E, 06YY, 0D6D), PDF pp. 33–34; Lemmas 21.19.1–2 (07A6, 0D6E), PDF p. 37; Lemma 21.20.2 (0D6F), PDF pp. 40–41. K-flat pullback and K-injective pushforward construct the ordinary derived adjunction.
- [Enhanced six operations and base change theorem for higher Artin stacks](#src-e0-liuzheng-sixoperations), §3.2, construction preceding Lemma 3.2.2, pp. 85–87. The enough-points diagram construction retains coherent pullback and partial adjoints.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi: coherent pullback diagrams are assembled from these functors

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `enhancedPullback` | constructor | The functor Lf*. | omitted |
| `enhancedPushforward` | constructor | The functor Rf*. | omitted |
| `enhancedPullPush_mapEquiv` | universal-property | Map_Y(Lf*K,L)≃Map_X(K,Rf*L). | omitted |
| `enhancedPullback_comp` | functoriality | The ringed composition equivalence with associativity coherence. | omitted |
| `enhancedPullback_constant` | compatibility | At identical inverse-image coefficients it agrees with exact sheaf inverse image. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `pullPush_identity` | degenerate | Both functors for the identity ringed morphism are identity. | omitted |
| `pullPush_point` | compatibility | For a point topos and ℤ→ℤ/p, pullback is derived scalar extension; pushforward is restriction of scalars. | omitted |
| `pullback_not_underived` | computation | Pulling back (ℤ/p)[0] along ℤ→ℤ/p produces cohomology in degrees −1 and 0, so ordinary scalar extension is insufficient. | omitted |

**Acceptance.**

- Both functors for the identity ringed morphism are identity.
- For a point topos and ℤ→ℤ/p, pullback is derived scalar extension; pushforward is restriction of scalars.
- Pulling back (ℤ/p)[0] along ℤ→ℤ/p produces cohomology in degrees −1 and 0, so ordinary scalar extension is insufficient.

**Lean prototype:** omitted. The sheaf-level unbounded replacement/localization, coefficient and perfect-algebra comparison interfaces are not yet expressed; ordinary point-module signatures do not supply their generality or coherence.

**Open obligations:** gap [G0.4](#gap-g0-4) (Point-free enhanced ringed localization); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions); request [R0.1](#req-r0-1) to `DiamondsAndVStacks:D0`.

<a id="n-e1-coefficient-change-and-perfect-action"></a>
#### Coefficient change and the perfect action

`E1/coefficient-change-and-perfect-action` · construction

For a map of commutative coefficient sheaves R→S, enhanced extension of scalars −⊗ᴸ_R S is left adjoint to restriction of scalars, with coherent identities and compositions. The D∞(R)-action on its module categories restricts to Perf(R), the thick idempotent-complete subcategory generated by R. For a coherently R-linear exact functor, compatibility with the Perf(R)-action is proved by finite sums, cones, shifts and retracts.

**Construction.**

1. Apply the ringed adjunction to the identity underlying topos. Prove coefficient associativity on K-flat models. Define the perfect subcategory by finite cell constructions and retract closure; use exact R-linearity to extend the comparison from R to every perfect complex.

**Direct prerequisites.**

- [`E1/ringed-pullback-pushforward`](#n-e1-ringed-pullback-pushforward) — Enhanced ringed pullback and pushforward
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- [`E0/stable-categories`](#n-e0-stable-categories) — Stable quasicategories
- `mathlib:SheafOfModules.restrictScalars`

**Sources.**

- [Enhanced six operations and base change theorem for higher Artin stacks](#src-e0-liuzheng-sixoperations), Lemma 3.2.8, pp. 87–88. The perfect-complex scalar-action argument is finite-cell and retract devissage, not a second general operad construction.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E4/perfect-coefficient-change: all quotient powers are handled by their proved perfection, not a claim that each ideal power is regular

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `enhancedCoeffChange` | constructor | Derived scalar extension with its restriction right adjoint. | omitted |
| `enhancedCoeffChange_comp` | functoriality | (K⊗ᴸ_R S)⊗ᴸ_S T≃K⊗ᴸ_R T coherently. | omitted |
| `enhancedCoeffChange_ordinary` | compatibility | Restriction agrees with pinned SheafOfModules.restrictScalars on degree-zero objects. | omitted |
| `perfectAction_exactFunctor` | compatibility | A coherent R-linear exact functor commutes with tensor by perfect R-complexes. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `coeffChange_identity` | degenerate | Changing coefficients along R→R is the identity. | omitted |
| `coeffChange_finite_free` | computation | Changing R^r[0] to S gives S^r[0]. | omitted |
| `perfectAction_shift` | compatibility | Tensor by R[1] agrees with suspension, and an exact R-linear functor commutes with it. | omitted |

**Acceptance.**

- Changing coefficients along R→R is the identity.
- Changing R^r[0] to S gives S^r[0].
- Tensor by R[1] agrees with suspension, and an exact R-linear functor commutes with it.

**Lean prototype:** omitted. The sheaf-level unbounded replacement/localization, coefficient and perfect-algebra comparison interfaces are not yet expressed; ordinary point-module signatures do not supply their generality or coherence.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e1-frobenius-root-ideal"></a>
#### Frobenius-root ideals

`E1/frobenius-root-ideal` · construction

Let R be a perfect F_p-algebra and f∈R. Define J_f=√(f)=⋃_n(f^(1/p^n)). The module map from the sequential colimit of copies of R, whose n→n+1 map is multiplication by f^(1/p^n−1/p^(n+1)), to J_f sends a at stage n to f^(1/p^n)a and is an isomorphism. In particular J_f is flat and idempotent, even when R has zero divisors.

**Construction.**

1. Perfectness supplies unique roots. The stage maps have the same image element after transition. If f^(1/p^n)a=0, taking a pth root and using reducedness shows that a is killed at some larger index. This proves injectivity as well as surjectivity; filtered colimits of free modules give flatness.

**Direct prerequisites.**

- `mathlib:CategoryTheory.Limits.HasFilteredColimits`
- `mathlib:PerfectRing`
- `mathlib:frobeniusEquiv`

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e0-bhattscholze-wittgrassmannian), Proof of Lemma 3.16, p. 14. The explicit root transition system presents the radical principal ideal as a filtered colimit of free modules.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E1/perfect-ring-tor: the flat root ideals resolve radical quotient steps

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `frobeniusRootIdeal` | constructor | The union of the root-generated ideals. | included |
| `frobeniusRootIdeal_radical` | characterisation | J_f equals √(f). | included |
| `frobeniusRootIdeal_colimit` | compatibility | The stated colimit of free R-modules identifies with J_f. | omitted |
| `frobeniusRootIdeal_flat` | structure | J_f is flat and J_f²=J_f. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `rootIdeal_zero` | degenerate | J_0=0 in a perfect ring. | included |
| `rootIdeal_unit` | computation | J_1=R. | included |
| `rootIdeal_nonprincipal` | non-example | In F_p[t^(1/p∞)], t^(1/p)∈J_t but t^(1/p)∉(t). | omitted |

**Acceptance.**

- J_0=0 in a perfect ring.
- J_1=R.
- In F_p[t^(1/p∞)], t^(1/p)∈J_t but t^(1/p)∉(t).

**Lean prototype:** included (`frobeniusRootIdeal`). Uses the existing radical of the principal ideal; Frobenius-root membership is an additional included auxiliary theorem.

<a id="n-e1-perfect-ring-tor"></a>
#### Tor independence of perfect algebras

`E1/perfect-ring-tor` · theorem · planet: **Perfect-ring Tor independence**

For perfect F_p-algebras B←A→C, Tor_i^A(B,C)=0 for every i>0; equivalently the derived tensor of their degree-zero underlying modules is concentrated in degree zero and equals B⊗_A C. This requires all three rings to be perfect, not arbitrary modules over a perfect base.

**Proof.**

1. Factor A→B into a perfect polynomial extension and a radical quotient. Perfect polynomial extension is a filtered colimit of free polynomial extensions, hence flat. Reduce the radical ideal by filtered colimits to finitely many root generators and then to one generator. Tensor its flat root-ideal resolution; the tensor ideal identifies with the corresponding root ideal of C, and injects into C.

**Direct prerequisites.**

- [`E1/frobenius-root-ideal`](#n-e1-frobenius-root-ideal) — Frobenius-root ideals
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- `mathlib:CategoryTheory.Tor`

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e0-bhattscholze-wittgrassmannian), Lemma 3.16, p. 14; Lemma 11.10, p. 42. The direct root-ideal proof avoids any dependency on animated Frobenius discreteness in E5.

**Acceptance.**

- The result includes perfect quotient rings that are not flat as A-modules.
- For arbitrary modules over (k[x,y]/xy)^perf, Tor₂ can be nonzero.
- The ordinary tensor is still a perfect ring, whereas the statement only identifies its underlying derived module here.

**Lean prototype:** partial (`perfect_ring_tor`). All positive ordinary Tor groups vanish for perfect F_p-algebras. Comparison with the K-flat derived tensor concentration statement is not supplied.

**Open obligations:** gap [G0.5](#gap-g0-5) (Perfect-ring algebra bridges); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e1-perfect-finite-tor-dimension"></a>
#### Finite Tor dimension for perfect presentations

`E1/perfect-finite-tor-dimension` · theorem

If R is perfect and S is the perfection of R[X₁,…,X_n]/(f₁,…,f_m), then the underlying R-module S has Tor dimension at most m. In particular every perfectly finitely presented map of perfect rings has finite Tor dimension. Also R/√(f₁,…,f_m) has Tor dimension at most m over R.

**Proof.**

1. Perfect polynomial extensions are flat. A root-principal quotient has a flat resolution of length one. Successively kill the m root generators and compose the Tor-amplitude bounds.

**Direct prerequisites.**

- [`E1/frobenius-root-ideal`](#n-e1-frobenius-root-ideal) — Frobenius-root ideals
- [`E1/perfect-ring-tor`](#n-e1-perfect-ring-tor) — Tor independence of perfect algebras
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e0-bhattscholze-wittgrassmannian), Remark 3.17, p. 14; Proposition 11.29, pp. 47–48. Successively taking radical principal quotients gives the number-of-equations bound.

**Acceptance.**

- m=0 gives a flat perfect polynomial extension.
- The bound is the number of defining equations, not a claim that every perfect finite-presentation map is flat.

**Lean prototype:** omitted. The sheaf-level unbounded replacement/localization, coefficient and perfect-algebra comparison interfaces are not yet expressed; ordinary point-module signatures do not supply their generality or coherence.

**Open obligations:** gap [G0.5](#gap-g0-5) (Perfect-ring algebra bridges); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e1-perfect-finite-global-dimension"></a>
#### Finite global dimension after perfection

`E1/perfect-finite-global-dimension` · theorem · planet: **Finite global dimension**

Let k=k₀^perf with k₀ a regular Noetherian F_p-algebra of finite Krull dimension, and let R be perfectly finitely presented over k. Choose a surjection P=P₀^perf→R with P₀ regular Noetherian of dimension d. Every R-module has projective dimension at most d+1. The dimension d belongs to the chosen regular presentation; it is not dim R.

**Proof.**

1. Regularity makes the Frobenius steps P_n→P flat, by the classical forward Kunz theorem. For a P-module M put F_n=M|P_n⊗_{P_n}P; each has projective dimension ≤d and colim F_n=M. The sequential direct-sum telescope gives pd_P(M)≤d+1. The homological epimorphism P→R from perfect Tor independence gives M≃M⊗ᴸ_P R and transports a projective resolution to R.

**Direct prerequisites.**

- [`E1/perfect-ring-tor`](#n-e1-perfect-ring-tor) — Tor independence of perfect algebras
- [`E1/perfect-finite-tor-dimension`](#n-e1-perfect-finite-tor-dimension) — Finite Tor dimension for perfect presentations
- [`E1/derived-presentability`](#n-e1-derived-presentability) — Presentability of unbounded derived sheaves
- `mathlib:CategoryTheory.HasProjectiveDimensionLE`

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e0-bhattscholze-wittgrassmannian), Proposition 11.31 and Remark 11.32, p. 48. A Frobenius telescope adds one to the finite projective-dimension bound of the regular presentation.

**Acceptance.**

- For a perfect field and R=k the result gives a finite bound and the sharper actual global dimension is zero.
- The proof requires an ordinary regular presentation and its finite dimension.

**Lean prototype:** omitted. The sheaf-level unbounded replacement/localization, coefficient and perfect-algebra comparison interfaces are not yet expressed; ordinary point-module signatures do not supply their generality or coherence.

**Open obligations:** gap [G0.5](#gap-g0-5) (Perfect-ring algebra bridges); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e1-perfect-intrinsic-dimension-bounds"></a>
#### Intrinsic dimension bounds and their correction

`E1/perfect-intrinsic-dimension-bounds` · theorem

Under the preceding finite-dimensional perfect-presentation hypotheses, every R-module has Tor dimension at most 2dim R. The announced global-dimension refinement is at most 2dim R+1; its proof is an explicit separate gap. The stronger Tor bound dim R is false: for R=(k[x,y]/xy)^perf with k perfect, Tor₂^R(R/(x),R/(y))≠0 although dim R=1.

**Proof.**

1. Reduce to perfections of complete Noetherian local rings and use a regular Noether normalization P₀→R₀. Away from a nonzero f this is finite étale; tensoring with the flat idempotent root ideal I_f turns modules into retracts of complexes induced from P. Set J=I_fR and use the exact sequences with Tor₁^R(R/J,M), J⊗M, JM and M/JM; induction drops the quotient dimension and gives the 2dim R bound. This proof needs the precise localization/retraction bridge recorded in gaps.
2. For the counterexample, Ann(x) is the ideal of positive y-root monomials. The class of y is nonzero in Ann(x)/yAnn(x) and maps to zero in R/(y), providing the Tor₂ witness. Do not infer the unproved intrinsic global bound from the presentation bound.

**Direct prerequisites.**

- [`E1/perfect-finite-global-dimension`](#n-e1-perfect-finite-global-dimension) — Finite global dimension after perfection
- [`E1/frobenius-root-ideal`](#n-e1-frobenius-root-ideal) — Frobenius-root ideals

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e0-bhattscholze-wittgrassmannian), Remark 11.33 and footnotes 24–25, p. 49. The corrected Tor bound has a normalization/idempotent-ideal proof; the global bound is announced without proof.

**Acceptance.**

- The modules in the Tor₂ example are ordinary nonperfect quotient modules.
- The printed correction and its announced unproved global refinement are distinguishable.

**Lean prototype:** omitted. The sheaf-level unbounded replacement/localization, coefficient and perfect-algebra comparison interfaces are not yet expressed; ordinary point-module signatures do not supply their generality or coherence.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e1-kunz-converse-by-perfection"></a>
#### The converse Kunz criterion via perfection

`E1/kunz-converse-by-perfection` · theorem

For a Noetherian F_p-algebra R, flatness of absolute Frobenius implies that R is regular. The classical regular⇒Frobenius-flat theorem is an input to the finite-global-dimension proof, so this converse cannot be used to establish that input.

**Proof.**

1. Pass to complete local rings, verifying preservation of Frobenius flatness under completion. Choose a Cohen regular presentation of the complete local ring. Flat Frobenius gives faithful flatness of R→R^perf. Apply finite global dimension to the perfection and descend finite Tor dimension, then apply the ordinary homological regularity criterion.

**Direct prerequisites.**

- [`E1/perfect-finite-global-dimension`](#n-e1-perfect-finite-global-dimension) — Finite global dimension after perfection

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e0-bhattscholze-wittgrassmannian), Corollary 11.35, pp. 49–50. Faithfully flat perfection and finite Tor dimension prove the converse direction only.

**Acceptance.**

- For F_p[t] the Frobenius module is free of rank p.
- For F_p[ε]/ε² Frobenius is not flat.

**Lean prototype:** omitted. The sheaf-level unbounded replacement/localization, coefficient and perfect-algebra comparison interfaces are not yet expressed; ordinary point-module signatures do not supply their generality or coherence.

**Open obligations:** gap [G0.5](#gap-g0-5) (Perfect-ring algebra bridges); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e1-bounded-saturated-valuation-modules"></a>
#### Bounded saturated valuation modules

`E1/bounded-saturated-valuation-modules` · definition

Let K be a complete nonarchimedean field, V its valuation ring, m its maximal ideal, and M⊂K^r a V-submodule. Boundedness is Mathlib Bornology.IsBounded on the underlying subset of the finite normed power; equivalently its coordinate norms have a common real bound. It is m-saturated when the multiplication map M→Hom_V(m,M), sending x to (a↦ax), is an isomorphism. The finite-freeness theorem additionally requires spherical completeness and full nonzero real value group.

**Construction.**

1. Use the existing normed-field and valuation-ring notions, the ordinary submodule carrier, and the linear multiplication comparison. Transport through V-linear ambient isomorphisms which preserve bounded sets.

**Direct prerequisites.**

- `mathlib:CategoryTheory.Abelian`
- `mathlib:Bornology.IsBounded`
- `mathlib:isBounded_iff_forall_norm_le'`
- `mathlib:ValuationSubring`

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e0-bhattscholze-wittgrassmannian), Lemma 6.14, pp. 25–26. The bounded submodule and its explicit saturation comparison are the hypotheses of the finite-freeness statement.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E1/valuation-saturated-finite-free: makes the exact additional hypotheses of the valuation lemma reusable

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `valuationModule_isBounded_iff` | compatibility | Mathlib boundedness of M⊂K^r is equivalent to one common upper bound on its coordinate norms; reuse Bornology.IsBounded rather than a private bound predicate. | included |
| `valuationSaturationMap` | data | The canonical linear map M→Hom_V(m,M). | included |
| `IsValuationSaturated` | characterisation | Bijectivity of that multiplication map. | included |
| `valuationSaturation_transport` | functoriality | Boundedness and saturation transport under a V-linear ambient isomorphism. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `valuationModule_zero` | degenerate | The zero submodule is bounded and saturated. | included |
| `valuationModule_closed_ball` | computation | For full real value group, a nonzero closed ball of finite radius in K is principal and saturated. | omitted |
| `valuationModule_open_ball` | non-example | A nonzero open ball of finite radius fails saturation: its Hom from m is the corresponding closed ball. | omitted |

**Acceptance.**

- The zero submodule is bounded and saturated.
- For full real value group, a nonzero closed ball of finite radius in K is principal and saturated.
- A nonzero open ball of finite radius fails saturation: its Hom from m is the corresponding closed ball.

**Lean prototype:** included (`valuationModule_isBounded_iff`, `valuationSaturationMap`, `IsValuationSaturated`). Uses existing boundedness and the actual canonical multiplication map; spherical-complete valuation fixtures and splitting theorem are separate omissions.

<a id="n-e1-valuation-saturated-finite-free"></a>
#### Finite freeness of saturated lattices

`E1/valuation-saturated-finite-free` · theorem · planet: **Saturated valuation modules**

If K is spherically complete with full nonzero real value group and M⊂K^r is bounded and m-saturated, then M is a finite free V-module of rank at most r.

**Proof.**

1. For r=1, bounded submodules are open or closed balls. Saturation excludes the open ball, and the value-group condition makes the remaining ball principal. For general r, intersect with K^(r−1). Spherical completeness gives Ext¹_V(m,V)=0 and therefore saturation of the one-dimensional quotient. The finite free quotient splits the extension.

**Direct prerequisites.**

- [`E1/bounded-saturated-valuation-modules`](#n-e1-bounded-saturated-valuation-modules) — Bounded saturated valuation modules

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e0-bhattscholze-wittgrassmannian), Lemma 6.14, pp. 25–26. The induction uses closed balls and Ext¹_V(m,V)=0 from spherical completeness.

**Acceptance.**

- Rank zero gives the zero module.
- Omitting saturation allows a nonprincipal open ball.
- Neither spherical completeness nor the full value-group hypothesis is discarded.

**Lean prototype:** omitted. The sheaf-level unbounded replacement/localization, coefficient and perfect-algebra comparison interfaces are not yet expressed; ordinary point-module signatures do not supply their generality or coherence.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e1-quasicoherent-derived-sheaves"></a>
#### Quasicoherent derived sheaves

`E1/quasicoherent-derived-sheaves` · definition

For an ordinary qcqs scheme X define Dqc(X) as the full subcategory of D∞(O_X) on complexes with quasicoherent cohomology in every integer degree. Perf(X) is its full subcategory of objects locally represented by bounded complexes of finite projective modules. For X=Spec R the usual affine sheafification/global-sections comparison identifies Dqc(X) with D∞(R), including unbounded complexes.

**Construction.**

1. Use the ordinary scheme/module sheaf definition of quasicoherence. Define the full enhanced subcategory and verify that the affine unbounded derived equivalence extends the module equivalence, using affine acyclicity and truncation convergence. Ordinary affine geometry inputs are recorded as a gap where the current baseline lacks the required API.

**Direct prerequisites.**

- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/ringed-pullback-pushforward`](#n-e1-ringed-pullback-pushforward) — Enhanced ringed pullback and pushforward

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e0-bhattscholze-wittgrassmannian), Discussion following Lemma 3.18, p. 15; §11.1, pp. 40–41. Dqc is the quasicoherent full derived subcategory and uses ordinary scheme cohomology, not an animated replacement of X.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E1/perfect-scheme-base-change: the unrestricted base-change statement is in this ordinary quasicoherent subcategory
- EnhancedDerivedSheaves:E2/perfect-h-hyperdescent: h-hyperdescent takes values in this enhancement

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `QuasicoherentDerived` | constructor | The full enhanced subcategory with quasicoherent cohomology. | omitted |
| `quasicoherentDerived_affine` | equivalence | Dqc(Spec R)≃D∞(R). | omitted |
| `quasicoherentDerived_restrict` | functoriality | Restriction to opens preserves the subcategory. | omitted |
| `PerfectDerived` | characterisation | Local bounded finite-projective representability. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `dqc_affine_unit` | computation | O_SpecR corresponds to R[0]. | omitted |
| `dqc_zero` | degenerate | The zero complex is quasicoherent and perfect. | omitted |
| `dqc_not_all_perfect` | non-example | On Spec ℤ, ⊕_{n∈ℕ}ℤ[0] is quasicoherent but is not perfect. | omitted |

**Acceptance.**

- O_SpecR corresponds to R[0].
- The zero complex is quasicoherent and perfect.
- On Spec ℤ, ⊕_{n∈ℕ}ℤ[0] is quasicoherent but is not perfect.

**Lean prototype:** omitted. The sheaf-level unbounded replacement/localization, coefficient and perfect-algebra comparison interfaces are not yet expressed; ordinary point-module signatures do not supply their generality or coherence.

**Open obligations:** gap [G0.6](#gap-g0-6) (Ordinary geometric h-descent inputs); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e1-perfect-scheme-base-change"></a>
#### Derived base change on perfect schemes

`E1/perfect-scheme-base-change` · theorem · planet: **Perfect base change**

For a cartesian square X′→X over Y′→Y of perfect qcqs F_p-schemes, Lg*Rf*K→Rf′*Lg′*K is an equivalence for every K∈Dqc(X), without a flatness assumption on g or a boundedness assumption on K.

**Proof.**

1. For X=Spec A, Y=Spec B, Y′=Spec B′, the required identity is A⊗ᴸ_B B′≃A′. Derive it from perfect-ring Tor independence. Cover the qcqs schemes by finitely many affines and use Čech descent and the finite cohomological bounds to transport the identity to unbounded quasicoherent complexes.

**Direct prerequisites.**

- [`E1/quasicoherent-derived-sheaves`](#n-e1-quasicoherent-derived-sheaves) — Quasicoherent derived sheaves
- [`E1/perfect-ring-tor`](#n-e1-perfect-ring-tor) — Tor independence of perfect algebras
- [`E1/ringed-pullback-pushforward`](#n-e1-ringed-pullback-pushforward) — Enhanced ringed pullback and pushforward

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e0-bhattscholze-wittgrassmannian), Lemma 3.18, pp. 14–15. Perfect Tor independence supplies the affine change-of-rings identity; finite affine descent handles qcqs schemes.

**Acceptance.**

- The ring identity has base B: reversing the A and B factors would be ill-typed.
- The analogous ordinary square over ℤ with both sides ℤ/p is not Tor independent.

**Lean prototype:** omitted. The sheaf-level unbounded replacement/localization, coefficient and perfect-algebra comparison interfaces are not yet expressed; ordinary point-module signatures do not supply their generality or coherence.

**Open obligations:** gap [G0.11](#gap-g0-11) (Source-version collation); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e1-cohomology-base-change-map"></a>
#### The cohomology base-change map

`E1/cohomology-base-change-map` · construction

For a commutative ring map A→B and K∈D≥0(A), the canonical map H⁰(K)[0]→K induces H⁰(K)⊗_A B→H⁰(K⊗ᴸ_A B). It is functorial in K and in B, and compatible with successive scalar extensions. Flat B makes it an isomorphism; without flatness it can fail.

**Construction.**

1. Identify H⁰(K)[0] with τ≤0K using K∈D≥0. Tensor the canonical truncation map and apply H⁰. Identify H⁰ of the degree-zero module tensor with the ordinary tensor. Naturality gives identity/composition; flatness follows from exact tensor.

**Direct prerequisites.**

- [`E1/coefficient-change-and-perfect-action`](#n-e1-coefficient-change-and-perfect-action) — Coefficient change and the perfect action
- `mathlib:CategoryTheory.Triangulated.TStructure.truncLE`
- `mathlib:CategoryTheory.Triangulated.TStructure.truncLEι`

**Sources.**

- [On the direct summand conjecture and its derived variant](#src-e0-bhatt-directsummand), Lemma 5.3 and proof of Theorem 5.4, pp. 9–10. Degree-zero comparison maps and their obstruction classes are used after derived base change.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E1/splitting-through-comparison: splitting obstructions are transported by this specified map

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `cohomologyBaseChange` | constructor | The natural degree-zero comparison. | omitted |
| `cohomologyBaseChange_comp` | functoriality | Successive scalar changes give the same comparison as their composite. | omitted |
| `cohomologyBaseChange_flat` | compatibility | It is an isomorphism for flat B. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `cohomBaseChange_identity` | degenerate | For A→A the comparison is identity. | omitted |
| `cohomBaseChange_module` | computation | For K=M[0], the degree-zero comparison is the usual isomorphism M⊗B≅H⁰(M⊗ᴸB). | omitted |
| `cohomBaseChange_nonflat` | non-example | For A=ℤ, B=ℤ/p and K=(ℤ/p)[−1] with H¹=ℤ/p, its source is zero and its target H⁰ is ℤ/p. | omitted |

**Acceptance.**

- For A→A the comparison is identity.
- For K=M[0], the degree-zero comparison is the usual isomorphism M⊗B≅H⁰(M⊗ᴸB).
- For A=ℤ, B=ℤ/p and K=(ℤ/p)[−1] with H¹=ℤ/p, its source is zero and its target H⁰ is ℤ/p.

**Lean prototype:** omitted. The sheaf-level unbounded replacement/localization, coefficient and perfect-algebra comparison interfaces are not yet expressed; ordinary point-module signatures do not supply their generality or coherence.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e1-splitting-through-comparison"></a>
#### Splitting obstructions in a distinguished triangle

`E1/splitting-through-comparison` · theorem

For a distinguished triangle A→B→Q --δ→ A[1] in the chosen derived category, a map s:M→Q lifts to M→B if and only if δ∘s=0. In particular B→Q has a right inverse if and only if δ=0. An exact comparison functor carries this obstruction to the corresponding obstruction in the comparison triangle; vanishing after comparison implies vanishing before comparison only when the induced map on the relevant Hom group is injective.

**Proof.**

1. Apply Hom(M,−) to the triangle and use exactness at Hom(M,Q). Specialize to s=id_Q. Transport the triangle by an exact functor and use its Hom comparison, keeping the injectivity condition explicit.

**Direct prerequisites.**

- [`E1/cohomology-base-change-map`](#n-e1-cohomology-base-change-map) — The cohomology base-change map
- [`E0/stable-api-and-the-sign-comparison`](#n-e0-stable-api-and-the-sign-comparison) — The stable API, and the comparison of shifts and cone signs with the cochain convention
- `mathlib:CategoryTheory.Pretriangulated`

**Sources.**

- [On the direct summand conjecture and its derived variant](#src-e0-bhatt-directsummand), Proof of Theorem 5.4, pp. 9–10. The derived splitting class is killed through a comparison only after checking its detecting map.

**Acceptance.**

- For the split triangle A→A⊕Q→Q the connecting map is zero.
- For 0→ℤ --p→ℤ→ℤ/p→0 the associated triangle does not split for p prime.
- A nonconservative comparison functor cannot by itself certify an original splitting.

**Lean prototype:** omitted. The sheaf-level unbounded replacement/localization, coefficient and perfect-algebra comparison interfaces are not yet expressed; ordinary point-module signatures do not supply their generality or coherence.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e1-koszul-complex"></a>
#### Koszul complexes

`E1/koszul-complex` · construction

For a commutative ring A, an A-module E and a linear map φ:E→A, construct a cochain complex K_A(φ) with K^(−q)=∧^q_A E for q≥0 and zero terms in positive degrees. On a decomposable wedge the differential deletes e_j with coefficient (−1)^(j−1)φ(e_j). Exterior multiplication makes this a differential graded A-algebra. For f=(f₁,…,fᵣ), specialize to E=A^r and φ(e_i)=f_i; this complex occupies [−r,0] and augments to A/(f). Arbitrary E is allowed; bounded perfectness is asserted for finite projective E.

**Hypotheses.**

- A is commutative; cohomological grading and the E1 tensor signs are fixed.
- For a finite regular sequence the augmentation is a quasi-isomorphism. No regularity is required to define the complex.

**Construction.**

1. Descend alternating contraction through the existing exterior-power universal property, including the repeated-vector relation in characteristic two. The two terms deleting any given pair cancel, proving d²=0.
2. Check the graded Leibniz rule and functoriality for ψ:E→E′ with φ′ψ=φ on decomposable wedges, then use their spanning property.
3. For finite sequences identify the exterior decomposition with the signed tensor of the one-element complexes. Induction by the cone of multiplication proves the regular-sequence resolution.

**Direct prerequisites.**

- `mathlib:CochainComplex`
- `mathlib:ExteriorAlgebra.exteriorPower`
- `mathlib:exteriorPower.ιMulti`
- `mathlib:exteriorPower.alternatingMapLinearEquiv`
- `mathlib:HomologicalComplex.monoidalCategory`
- `mathlib:RingTheory.Sequence.IsRegular`

**Sources.**

- [The Stacks Project, More on Algebra](#src-e0-stacks-morealgebra), §29, Definitions 29.1–29.2 and Lemmas 29.3–29.12, pp. 69–72 (tags 0622, 0623, 0624, 0663, 0664); Lemma 31.2, p. 76 (062F). Exterior contraction defines the differential and its functoriality; a regular sequence resolves the quotient.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E4/koszul-completion-tower: Perfect Koszul power towers supply completion.
- EnhancedDerivedSheaves:E4/regular-ideal-quotients: Finite regular sequences resolve ordinary quotients.
- DerivedDeRhamCohomology:DD.1: The higher-tier roadmap imports this generic carrier after ownership moves down.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `koszulComplex` | constructor | The cochain Koszul complex for φ, including its exterior DG multiplication. | partial |
| `koszulComplex_degree` | characterisation | Degree −q is the existing qth exterior power; positive degrees vanish. | partial |
| `koszulComplex_differential` | characterisation | The alternating deletion formula on decomposable wedges, including the degree-one map φ. | omitted |
| `koszulComplex_map` | functoriality | ψ with φ′ψ=φ induces a DG map, compatible with identity/composition. | omitted |
| `koszulComplex_tensor` | equivalence | Concatenation of finite sequences corresponds to the signed tensor product. | omitted |
| `finiteKoszulComplex` | constructor | The specialization to a finite list of elements and its standard basis. | included |
| `koszulComplex_augmentation` | compatibility | The finite-sequence augmentation to A/(f) in degree zero. | included |
| `koszulComplex_regular` | compatibility | The augmentation is a quasi-isomorphism for a regular sequence. | included |
| `koszulComplex_nullHomotopy` | relation | Wedge by e supplies a null-homotopy of multiplication by φ(e). | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `koszul_empty` | degenerate | The empty-sequence complex is A in degree zero. | included |
| `koszul_prime` | computation | For a prime integer p, K_Z(p) resolves Z/p in degree zero, with zero negative cohomology. | included |
| `koszul_zero` | non-example | For any nonzero A, K_A(0) has H^(−1)=A and H⁰=A; it is not A[0]. | included |

**Acceptance.**

- For one element the differential is multiplication by that element, rather than zero.
- The zero one-element sequence has nonzero H^(−1), so replacing a Koszul complex by its ordinary quotient fails this test.

**Lean prototype:** partial (`koszulComplex`, `koszulComplex_degree`, `finiteKoszulComplex`, `koszulComplex_augmentation`, `koszulComplex_regular`). General Koszul carrier, negative-degree comparison, finite augmentation and regular-sequence fixture are typed. Full contraction, DG multiplication, functorial tensor maps and positive-degree vanishing remain untyped.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).


<a id="layer-e2"></a>

## E2 — Repleteness, inverse limits, Postnikov convergence and descent

A topos is replete when epimorphic inverse sequences have epimorphic limit
projections. Sets satisfy this by countable choice and presheaf topoi
pointwise, but it does not make all cofiltered limits exact: finite injections
of subsets of an uncountable set into ℤ form a surjective cofiltered system
with no compatible global injection. A coherent tower is a functor from the
nerve of the opposite of ℕ; its limit is the fibre of 1 − shift on the product,
for any stable enhanced category with countable products. Exact countable
products give the Milnor sequence in every integer degree, and towers whose
cohomology towers are pro-zero have vanishing derived limit. The tower and
pro-tower declarations use only E0 and E1, and E5's descendable algebras use
them; the first structural proposal makes them a sub-layer.

Postnikov completion consists of coherent towers K_n in degrees ≥ −n with
τ≥−n K_{n+1} ≃ K_n; the truncation functor and its derived-limit adjoint are
constructed before they are shown inverse. Repleteness gives the unit and
counit, with eventual constancy checked in each integer degree; local finite
cohomological dimension or a uniform bound on the negative cohomology of one
complex give convergence of that complex, and a category-wide conclusion needs
the bound for all complexes. Weakly contractible objects split every
epimorphism onto them; locally weakly contractible topoi are replete and have
compact detecting objects. Sheaves of spaces are covering-local presheaves of
Kan complexes, built with E3's accessible localizations; their
hypercompletion and Postnikov effectivity are kept apart.

Hypercovers carry all augmented matching maps, and degree one is compared
with Mathlib's `OneHypercover`. Bounded-below Cartesian descent holds without
repleteness; the unbounded unit does too, while unbounded effectivity uses
repleteness; refinement independence follows by comparing both augmentations
with the original category. On perfect schemes the targets are kept
separate: quantitative descendability of h-covers (a finite tensor-nilpotence
index, uniform along a Frobenius approximation), h-Čech descent of unbounded
Dqc through E5's module descent, h-hyperdescent of Perf, boundedness
detection, and unbounded h-hyperdescent over the perfection of a
finite-dimensional regular Noetherian F_p-base. The tensor–totalization step
applies to cosimplicial modules in degree zero with bounded totalization and
finite global dimension only.

<a id="n-e2-replete-topoi"></a>
#### Replete topoi

`E2/replete-topoi` · definition · planet: **Replete topoi**

For a topos X, repleteness means: for every inverse sequence F with epimorphic successor transitions, every projection lim F→F_n is epimorphic. Use the ordinary category of sheaves and categorical limits; this definition requires neither derived categories nor an enhancement.

**Hypotheses.**

- A fixed Grothendieck topos with countable limits. The analogous categorical property can be stated for any category with sequential limits.
- No repleteness assumption is made about arbitrary geometric sites.

**Construction.**

1. Define the property using all limit cones of inverse sequences, avoiding dependence on chosen limit objects.

**Direct prerequisites.**

- `mathlib:CategoryTheory.Sheaf`
- `mathlib:CategoryTheory.GrothendieckTopology`
- `mathlib:CategoryTheory.Limits.HasLimits`

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Definition 3.1.1, p. 16. Sequential, not arbitrary cofiltered, closure of epimorphisms.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E2/countable-products-and-inverse-limits: Countable products of epimorphisms.
- EnhancedDerivedSheaves:E2/left-completion: Postnikov reconstruction.
- DiamondEtaleCohomology:C0: Consumer must prove its site satisfies the abstract hypothesis.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `IsReplete` | characterisation | Every limit-cone projection of an epimorphic inverse sequence is epimorphic. | included |
| `IsReplete.projection` | structure | Apply repleteness at any index n of an inverse sequence. | included |
| `IsReplete.of_equivalence` | compatibility | An equivalence of categories transports the sequential epimorphism property. | included |
| `IsReplete.types` | example | The category of sets is replete, using countable choice. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `replete_sets` | compatibility | Set is replete: extend a chosen element recursively along surjective transitions. | included |
| `replete_presheaves` | compatibility | Presheaves of sets on any small category are replete, since limits and epimorphisms are pointwise. | included |
| `replete_not_all_cofiltered` | non-example | For an uncountable set T, the system of injections S→ℤ indexed by finite subsets S⊆T has surjective restrictions but empty limit; replacing sequential by all cofiltered limits would reject Set. | partial |

**Acceptance.**

- Check every displayed hypothesis and the indicated small-case specialization.

**Lean prototype:** included (`IsReplete`). Actual categorical sequential epimorphism property using limiting cones, not all cofiltered limits.

<a id="n-e2-inverse-limit-relative-epis"></a>
#### Epimorphisms of inverse limits

`E2/inverse-limit-relative-epis` · lemma

In a replete topos, a map F→G of inverse sequences induces an epimorphism lim F→lim G if F_i→G_i and F_{i+1}→F_i×_{G_i}G_{i+1} are epimorphisms for every i.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. For V→lim G start with V₀=V×_{G₀}F₀.
2. Set V_{n+1}=V_n×_{F_n×_{G_n}G_{n+1}}F_{n+1}; the maps V_{n+1}→V_n are epimorphisms.
3. Repleteness gives an epimorphism lim V_n→V carrying a compatible lift to lim F.

**Direct prerequisites.**

- [`E2/replete-topoi`](#n-e2-replete-topoi) — Replete topoi

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Lemma 3.1.8, p. 17. Compatible lifts are constructed after an epimorphic sequential base change.

**Acceptance.**

- If every F_i=G_i the limit map is identity.
- Levelwise epimorphisms alone are not the stated hypothesis.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-countable-products-and-inverse-limits"></a>
#### Countable products in a replete topos

`E2/countable-products-and-inverse-limits` · theorem

In a replete topos, the product of a countable family of epimorphisms is an epimorphism. Consequently countable products of abelian sheaves are exact.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Apply inverse-limit-relative-epis to finite partial products of the given arrows.
2. Finite products are exact in a topos; the relative lifting hypotheses follow.
3. Products preserve kernels, so preservation of epimorphisms proves exactness for abelian sheaves.

**Direct prerequisites.**

- [`E2/inverse-limit-relative-epis`](#n-e2-inverse-limit-relative-epis) — Epimorphisms of inverse limits
- `mathlib:CategoryTheory.CountableAB4Star`

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.1.9, p. 17. The inherited ID is retained only for product exactness; the derived inverse-limit claim is separate.

**Acceptance.**

- For Set this is the usual countable product of surjections.
- Do not infer exactness of arbitrary uncountable products from this argument.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-postnikov-left-completion"></a>
#### Postnikov left completion

`E2/postnikov-left-completion` · construction · planet: **Postnikov completion**

Let D(X) be the enhanced derived category of abelian sheaves. Its left completion is the full subcategory of the coherent derived category of inverse systems whose terms satisfy K_n∈D≥−n and whose transition induces τ≥−n K_{n+1}≃K_n. Define Ψ(K)_n=τ≥−n K. This construction is defined without assuming Ψ is an equivalence.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Construction.**

1. Use the existing ordinary truncation functors as comparison targets for the enhanced truncation tower.
2. Form the full subcategory cut out by the two conditions and the coherent truncation functor Ψ. The diagram/enhancement comparison remains an E1/E0 gap.

**Direct prerequisites.**

- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/ringed-pullback-pushforward`](#n-e1-ringed-pullback-pushforward) — Enhanced ringed pullback and pushforward
- [`E0/limits-colimits-and-slices`](#n-e0-limits-colimits-and-slices) — The simplicial join
- `mathlib:CategoryTheory.Triangulated.TStructure.eTruncGE`

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Definition 3.3.1, p. 18. Use coherent derived systems; do not replace them silently by diagrams in the ordinary homotopy category.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E2/completion-adjunction: Domain of the derived-limit right adjoint.
- EnhancedDerivedSheaves:E2/left-completion: Equivalence for replete topoi.
- EnhancedDerivedSheaves:E4: Keep Postnikov completion distinct from adic completion.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `postnikovCompletion` | constructor | Full subcategory of compatible connective towers. | included |
| `postnikovCompletion_eval` | projection | Evaluation at n lands in D≥−n. | partial |
| `postnikovFunctor` | constructor | Ψ sends K to its tower τ≥−n K. | partial |
| `postnikovFunctor_eval` | structure | Evaluation of Ψ(K) at n is τ≥−n K, including its canonical transition. | partial |
| `enhancedCohomology` | data | Integer cohomology evaluated through the ordinary-derived comparison. | included |
| `enhancedTruncGE` | constructor | Enhanced good connective truncation in integer degree. | included |
| `truncGEUnit` | data | Canonical coherent unit from id to connective truncation. | included |
| `IsPostnikovTower` | characterisation | The integer connectivity and truncated-successor-equivalence conditions. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `postnikov_zero` | degenerate | Ψ(0) is the zero tower. | partial |
| `postnikov_heart` | computation | For an abelian sheaf A in degree zero, Ψ(A) is constant at A. | partial |
| `postnikov_negative_shift` | computation | For A[1] with A≠0 in the heart, Ψ(A[1])₀=0 and Ψ(A[1])_n=A[1] for n≥1; the constant A[1] tower fails the n=0 connectivity condition. | partial |

**Acceptance.**

- Check every displayed hypothesis and the indicated small-case specialization.

**Lean prototype:** partial (`enhancedCohomology`, `enhancedTruncGE`, `IsPostnikovTower`, `postnikovCompletion`, `postnikovCompletion_eval`, `postnikovFunctor`, `postnikovFunctor_eval_equiv`). Actual integer connectivity and truncated-transition conditions with the full tower carrier. The truncation functor is typed into ambient towers; its factorization into completion and all canonical transition comparison laws remain unstated.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-coherent-towers-and-roos"></a>
#### Coherent inverse towers and the product–difference formula

`E2/coherent-towers-and-roos` · construction · planet: **Derived inverse limits**

For a stable enhanced category with countable products and a coherent inverse tower K:N(ℕᵒᵖ)→C, construct its homotopy limit as fib(1−s:∏_n K_n→∏_n K_n), where the nth component of s is the transition K_(n+1)→K_n after projection. This construction includes the projection cone and its mapping-space universal property. A strict tower of complexes or modules maps to a coherent tower by localization; an arbitrary ordinary diagram in hC is not silently substituted for it.

**Construction.**

1. Construct the shift map from the coherent tower transitions. Its fibre carries compatible projections. Apply mapping spaces from any test object; the homotopy equalizer of product and shifted product is the inverse limit of the mapping-space tower. This proves the cone universal property and functoriality.

**Direct prerequisites.**

- [`E0/stable-categories`](#n-e0-stable-categories) — Stable quasicategories
- [`E0/limits-colimits-universal-properties`](#n-e0-limits-colimits-universal-properties) — Enhanced limits and colimits
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category

**Sources.**

- [The Stacks Project, Derived Categories](#src-e0-stacks-derived-categories), Derived Categories, Definition 13.34.1 (08TC), Lemma 13.34.2 (07KC), Remark 13.34.4 (0H9J), PDF pp. 105–106; Cohomology on Sites, Lemma 21.23.1 (0941), PDF pp. 47–48. The product–difference triangle computes derived sequential inverse limits.
- [On the direct summand conjecture and its derived variant](#src-e0-bhatt-directsummand), §3, Definition 3.2 and Lemma 3.4, pp. 5–6. Ordinary module towers are used through their derived inverse limits.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E2/tower-milnor: the fibre triangle yields the cohomology sequence
- EnhancedDerivedSheaves:E4/inverse-limit-reconstruction: reconstruction uses this coherent homotopy limit
- CompletedCohomologyPartII:CC.2: the generic sequential construction is supplied here

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `coherentTower` | constructor | The coherent functor category Fun(Nℕᵒᵖ,C). | partial |
| `towerDifference` | data | The product endomorphism 1−s. | omitted |
| `derivedTowerLimit` | constructor | The fibre of towerDifference. | partial |
| `derivedTowerLimit_projection` | projection | Its coherent limit cone projections. | omitted |
| `derivedTowerLimit_mapEquiv` | universal-property | Map(z,Rlim K)≃lim_n Map(z,K_n). | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `tower_constant` | degenerate | The constant identity-transition tower has Rlim≃K. | omitted |
| `tower_zero_transitions` | computation | If every transition is zero, 1−s is identity and Rlim=0. | omitted |
| `tower_not_ordinary_limit` | non-example | The tower ℤ --×p←ℤ --×p←⋯ has lim=0 but lim¹=ℤ_p/ℤ for p prime, so its derived limit is nonzero in degree 1. | omitted |

**Acceptance.**

- The constant identity-transition tower has Rlim≃K.
- If every transition is zero, 1−s is identity and Rlim=0.
- The tower ℤ --×p←ℤ --×p←⋯ has lim=0 but lim¹=ℤ_p/ℤ for p prime, so its derived limit is nonzero in degree 1.

**Lean prototype:** partial (`coherentTower`, `CoherentTower`, `coherentTower_eval`, `derivedTowerLimit`). Actual nerve-indexed tower carrier and limit object only; Roos difference, universal cone and functorial coherent limit are omitted.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-completion-adjunction"></a>
#### Derived limit adjunction

`E2/completion-adjunction` · lemma

The derived-limit functor from the Postnikov left completion to D(X) is right adjoint to Ψ.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Compute mapping spaces of coherent derived systems using the homotopy equalizer of products.
2. Truncation adjunction identifies the relevant mapping spaces into the connective objects L_n. Do not assert equality of untruncated derived Hom complexes in every degree.
3. Pass to the inverse limit of mapping spaces to identify Map(ΨK,L) with Map(K,Rlim L). The diagram K-injective and coherent-limit comparison remains an explicit input.

**Direct prerequisites.**

- [`E2/postnikov-left-completion`](#n-e2-postnikov-left-completion) — Postnikov left completion
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/ringed-pullback-pushforward`](#n-e1-ringed-pullback-pushforward) — Enhanced ringed pullback and pushforward
- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Lemma 3.3.2, p. 18. The intended adjunction is retained using mapping spaces; the termwise all-degree RHom comparison is corrected in source issue EnhancedDerivedSheaves/E4.

**Acceptance.**

- The unit is K→Rlim τ≥−nK.
- An adjunction alone does not make this unit invertible.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-surjective-system-derived-limit"></a>
#### Derived limit of an epimorphic system

`E2/surjective-system-derived-limit` · theorem

For an inverse sequence F of abelian sheaves on a replete topos with epimorphic transitions, the canonical lim F→Rlim F is an equivalence (F is placed in degree zero).

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Exact countable products identify derived products with ordinary products.
2. In the Rlim fibre triangle, show t−1 on the product is epimorphic using the relative-lifting lemma on finite difference maps.
3. Its kernel is lim F; the triangle therefore has no higher cohomology.

**Direct prerequisites.**

- [`E2/countable-products-and-inverse-limits`](#n-e2-countable-products-and-inverse-limits) — Countable products in a replete topos
- [`E2/inverse-limit-relative-epis`](#n-e2-inverse-limit-relative-epis) — Epimorphisms of inverse limits
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/ringed-pullback-pushforward`](#n-e1-ringed-pullback-pushforward) — Enhanced ringed pullback and pushforward
- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.1.10, p. 17. Exact products and the difference map compute the derived limit.

**Acceptance.**

- Surjectivity of transitions is essential; no claim for every inverse system.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-replete-postnikov-unit"></a>
#### Postnikov reconstruction in a replete topos

`E2/replete-postnikov-unit` · lemma

If X is replete, K→Rlim τ≥−nK is an equivalence for every K∈D(X).

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Choose any complex I representing K. Exact products make the product of its truncations compute the derived product.
2. The good-truncation tower has termwise epimorphic transitions and ordinary termwise limit I.
3. Apply the difference-map argument degreewise to identify the derived limit with I.

**Direct prerequisites.**

- [`E2/completion-adjunction`](#n-e2-completion-adjunction) — Derived limit adjunction
- [`E2/surjective-system-derived-limit`](#n-e2-surjective-system-derived-limit) — Derived limit of an epimorphic system
- [`E2/countable-products-and-inverse-limits`](#n-e2-countable-products-and-inverse-limits) — Countable products in a replete topos
- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.3.3, p. 19, full-faithfulness argument. Use the actual complex and its good truncations.

**Acceptance.**

- No boundedness hypothesis on I.
- This is reconstruction of one object; essential surjectivity of Ψ still needs the next lemma.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-inverse-limit-amplitude"></a>
#### Cohomological amplitude of sequential limits

`E2/inverse-limit-amplitude` · lemma

For any inverse sequence F of abelian sheaves on a replete topos, Rlim F has cohomology only in degrees 0 and 1.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Use the fibre of t−1 between the two ordinary products, justified by exact products.
2. The long exact cohomology sequence gives vanishing outside [0,1].

**Direct prerequisites.**

- [`E2/countable-products-and-inverse-limits`](#n-e2-countable-products-and-inverse-limits) — Countable products in a replete topos
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/ringed-pullback-pushforward`](#n-e1-ringed-pullback-pushforward) — Enhanced ringed pullback and pushforward
- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.1.11, p. 17. Amplitude bound, with no surjective-transition hypothesis.

**Acceptance.**

- An epimorphic-transition system specializes to the preceding theorem with degree-one cohomology zero.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-tower-milnor"></a>
#### Milnor exact sequence

`E2/tower-milnor` · theorem

For a coherent tower K_n in D∞(O) on a replete topos, every integer q has a natural exact sequence 0→lim¹_n H^(q−1)(K_n)→H^q(Rlim_n K_n)→lim_n H^q(K_n)→0. Here lim¹ for a module-sheaf tower is the cokernel of its product–difference map. On an arbitrary topos use derived products instead; the simple sequence requires countable product exactness.

**Proof.**

1. Exact countable products imply that cohomology of the product is the product of cohomology in every degree. The long exact sequence of the fibre triangle then separates into kernel and cokernel of 1−s. Identify those as lim and lim¹.

**Direct prerequisites.**

- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula
- [`E2/countable-products-and-inverse-limits`](#n-e2-countable-products-and-inverse-limits) — Countable products in a replete topos
- [`E2/inverse-limit-amplitude`](#n-e2-inverse-limit-amplitude) — Cohomological amplitude of sequential limits

**Sources.**

- [The Stacks Project, Cohomology on Sites](#src-e0-stacks-project), Cohomology on Sites, Lemma 21.23.2 (0D6K), PDF p. 48; use exact countable products for the sheaf-cohomology version. The long exact sequence of the product–difference triangle yields Milnor when products are exact.

**Acceptance.**

- For an eventually constant cohomology tower, the lim¹ term vanishes.
- The statement covers negative and positive q alike.
- For strict module towers in the point topos this is the ordinary module Milnor sequence.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-replete-postnikov-counit"></a>
#### Reconstruction of a compatible truncation tower

`E2/replete-postnikov-counit` · lemma

For X replete and a tower L in the Postnikov left completion, the canonical map τ≥−n Rlim L→L_n is an equivalence for every n≥0.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. For each integer m, compatibility makes H^m(L_n) constant once n≥max(0,−m).
2. The product/difference fibre triangle and exact products give the Milnor sequence on cohomology. Both H^m and H^(m−1) towers are eventually constant, so their R¹lim terms vanish.
3. Thus H^m(Rlim L)≅H^m(L_n) whenever m≥−n. Compare the canonical map on all cohomology groups after truncation. Do not discard a finite product prefix as an equality of products.

**Direct prerequisites.**

- [`E2/postnikov-left-completion`](#n-e2-postnikov-left-completion) — Postnikov left completion
- [`E2/countable-products-and-inverse-limits`](#n-e2-countable-products-and-inverse-limits) — Countable products in a replete topos
- [`E2/inverse-limit-amplitude`](#n-e2-inverse-limit-amplitude) — Cohomological amplitude of sequential limits
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/ringed-pullback-pushforward`](#n-e1-ringed-pullback-pushforward) — Enhanced ringed pullback and pushforward
- [`E2/tower-milnor`](#n-e2-tower-milnor) — Milnor exact sequence

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.3.3, p. 19, essential-surjectivity argument. Corrected integer indexing; source issue E1 records the printed problem.

**Acceptance.**

- Test L=Ψ(A[1]) to force a negative degree.
- For m≥0 stabilization starts at n=0.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.11](#gap-g0-11) (Source-version collation); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-left-completion"></a>
#### Left completeness for replete topoi

`E2/left-completion` · theorem

If X is a replete topos, Ψ:D(X)→D̂(X) is an equivalence with inverse Rlim.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. The adjunction unit is invertible by replete-postnikov-unit.
2. The counit is termwise invertible by replete-postnikov-counit; evaluations detect equivalences of coherent systems.

**Direct prerequisites.**

- [`E2/completion-adjunction`](#n-e2-completion-adjunction) — Derived limit adjunction
- [`E2/replete-postnikov-unit`](#n-e2-replete-postnikov-unit) — Postnikov reconstruction in a replete topos
- [`E2/replete-postnikov-counit`](#n-e2-replete-postnikov-counit) — Reconstruction of a compatible truncation tower

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.3.3, p. 19. Both unit and counit are handled by separate lemmas.

**Acceptance.**

- The theorem specializes to D(Ab) because Set is replete.
- Repleteness alone is not asserted to give convergence of Postnikov towers of spaces; BS 3.1.12 asks that as a separate question.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-weakly-contractible-object"></a>
#### Weakly contractible object

`E2/weakly-contractible-object` · definition

An object U of a topos X is weakly contractible if every epimorphism V→U admits a section.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Construction.**

1. Use the categorical epi and section conditions in the existing sheaf category.

**Direct prerequisites.**

- `mathlib:CategoryTheory.Sheaf`

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Definition 3.2.1, p. 17. Section-lifting condition on an object.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E2/locally-weakly-contractible: Generators with exact section functors.
- EnhancedDerivedSheaves:E2/locally-weakly-contractible-topoi: Test epimorphisms on these objects.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `IsWeaklyContractible` | characterisation | Every epimorphism to U splits. | included |
| `IsWeaklyContractible.section` | projection | For an epimorphism V→U, obtain a section U→V. | included |
| `IsWeaklyContractible.sections_exact` | structure | For a weakly contractible U, Γ(U,−) on abelian sheaves is exact. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `weaklyContractible_singleton` | degenerate | The one-point set is weakly contractible in Set. | included |
| `weaklyContractible_sets` | compatibility | Every set is weakly contractible in Set, using choice. | included |
| `weaklyContractible_BG_nonexample` | non-example | For a nontrivial finite group G, the terminal G-set is not weakly contractible: the epimorphism from the free transitive G-set has no equivariant section. | omitted |

**Acceptance.**

- Check every displayed hypothesis and the indicated small-case specialization.

**Lean prototype:** included (`IsWeaklyContractible`). Actual split-epimorphism property; exact sections and the group-action non-example are omitted.

<a id="n-e2-locally-weakly-contractible"></a>
#### Locally weakly contractible topos

`E2/locally-weakly-contractible` · definition

A topos X is locally weakly contractible if every object admits an epimorphism from a coproduct of coherent weakly contractible objects.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Construction.**

1. Express the covering property in the existing topos. The coherent-object predicate and its sheaf-theoretic API are unresolved ordinary-site inputs.

**Direct prerequisites.**

- [`E2/weakly-contractible-object`](#n-e2-weakly-contractible-object) — Weakly contractible object

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Definition 3.2.1 and Example 3.2.2, pp. 17–18. Coherence is retained for compact generation; it is stronger than the weakly-contractible covering condition alone.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E2/locally-weakly-contractible-topoi: Supplies repleteness.
- EnhancedDerivedSheaves:E2/weakly-contractible-compact-generators: Coherence supplies compactness.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `IsLocallyWeaklyContractible` | characterisation | The stated coherent weakly contractible covering property. | omitted |
| `IsLocallyWeaklyContractible.cover` | projection | Choose an epimorphic family of coherent weakly contractible objects over a given object. | omitted |
| `IsLocallyWeaklyContractible.detect_epi` | characterisation | A map is epi iff sections on all weakly contractible test objects are surjective. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `locallyWeaklyContractible_sets` | compatibility | Set is locally weakly contractible via singleton covers. | omitted |
| `locallyWeaklyContractible_finite_BG` | compatibility | For a finite group G, G-sets admit covers by free transitive G-sets, which are coherent and weakly contractible. | omitted |
| `locallyWeaklyContractible_cover_terminal` | degenerate | For the terminal topos Set, one singleton already covers its terminal object. | omitted |

**Acceptance.**

- Check every displayed hypothesis and the indicated small-case specialization.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions); request [R0.1](#req-r0-1) to `DiamondsAndVStacks:D0`.

<a id="n-e2-locally-weakly-contractible-topoi"></a>
#### Local weak contractibility implies repleteness

`E2/locally-weakly-contractible-topoi` · theorem

A locally weakly contractible topos is replete.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Test each limit projection on weakly contractible objects; sections commute with limits.
2. An epi gives a surjection on such sections, so inverse-sequence lifting in Set proves the result.

**Direct prerequisites.**

- [`E2/locally-weakly-contractible`](#n-e2-locally-weakly-contractible) — Locally weakly contractible topos
- [`E2/replete-topoi`](#n-e2-replete-topoi) — Replete topoi

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.2.3(1), p. 18. The inherited aggregate ID is retained for the repleteness implication alone.

**Acceptance.**

- Recover repleteness of Set.
- This argument does not prove the converse.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-hypercover"></a>
#### Hypercover in a topos

`E2/hypercover` · definition

An augmented simplicial object U_•→1 in X is a hypercover if U₀→1 is epimorphic and U_n→(cosk_{n−1}U)_n is epimorphic for every n>0, with the coskeleton taken in augmented simplicial objects.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Construction.**

1. Use augmented simplicial objects and their matching objects.
2. Impose the matching epimorphism conditions; prove the comparison with the existing degree-one cover data.

**Direct prerequisites.**

- `mathlib:CategoryTheory.GrothendieckTopology.OneHypercover`
- `mathlib:SSet`

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.3.6 and following notation, p. 20. This is the usual hypercover notion used by the proposition; its foundational coskeleton development is not proved there and remains a gap.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E2/hypercovers-and-cohomological-descent: Indexing object for Cartesian derived systems.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `Hypercover` | constructor | Augmented simplicial object with all matching maps epimorphic. | omitted |
| `Hypercover.matching_epi` | projection | The matching map at every degree is epi. | omitted |
| `Hypercover.oneHypercover` | compatibility | Extract the degree-zero and degree-one data for the pinned OneHypercover after choosing representable covers on a site. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `hypercover_identity` | degenerate | The constant simplicial terminal object is a hypercover. | omitted |
| `hypercover_cech` | compatibility | The Cech nerve of an epimorphism U→1 is a hypercover. | omitted |
| `hypercover_matching_failure` | non-example | In Set, the constant simplicial two-element set augmented to 1 has surjective degree-zero map but degree-one diagonal {0,1}→{0,1}² is not surjective, so it is not a hypercover. | omitted |

**Acceptance.**

- Check every displayed hypothesis and the indicated small-case specialization.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.8](#gap-g0-8) (Higher sheaf localization and matching objects); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-hypercovers-and-cohomological-descent"></a>
#### Cartesian derived systems on a hypercover

`E2/hypercovers-and-cohomological-descent` · construction

For a hypercover f:U_•→1 in X, form the enhanced derived category of its simplicial topos and its full subcategory D_cart(U_•). A complex K is Cartesian when every simplicial transition α:[n]→[m] induces an equivalence α* K_n→K_m. Pullback f* sends K∈D(X) to its restrictions on X/U_n.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Construction.**

1. Construct the derived diagram of the slice topoi with the compatible pullbacks.
2. Take the full subcategory defined by the transition equivalences.
3. Slice pullbacks are exact and preserve limits/colimits via their two adjoints; establish this interface before proving descent.

**Direct prerequisites.**

- [`E2/hypercover`](#n-e2-hypercover) — Hypercover in a topos
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/ringed-pullback-pushforward`](#n-e1-ringed-pullback-pushforward) — Enhanced ringed pullback and pushforward
- [`E0/cocartesian-fibrations-and-restricted-straightening`](#n-e0-cocartesian-fibrations-and-restricted-straightening) — Restricted straightening and sections

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.3.6, p. 20, notation before proof. Cartesian condition and restrictions. Building the coherent diagram carrier remains an E0/E1 input, not an assumption of the descent theorem.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent: Bounded-below comparison.
- EnhancedDerivedSheaves:E2/unbounded-hypercover-descent: Unbounded comparison for replete X.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `cartesianDerivedSystem` | constructor | The full subcategory defined by the transition equivalences. | omitted |
| `cartesianDerivedSystem_transition` | projection | Each transition map after pullback is an equivalence. | omitted |
| `hypercoverPullback` | constructor | The coherent family K\|U_n attached to K. | omitted |
| `cartesianDerivedSystem_truncate` | structure | Good truncation preserves the Cartesian condition because slice pullbacks are exact. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `cartesian_identity_hypercover` | degenerate | For the identity hypercover, the Cartesian category identifies with D(X). | omitted |
| `cartesian_pullback` | compatibility | The family of restrictions of a single complex is Cartesian. | omitted |
| `cartesian_bad_transition` | non-example | On the identity hypercover of Set, the cosimplicial diagram [n]↦ℤ[Hom_Δ([0],[n])] in degree zero is not Cartesian: a coface gives ℤ→ℤ², not an isomorphism. | omitted |

**Acceptance.**

- Check every displayed hypothesis and the indicated small-case specialization.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-replete-slice"></a>
#### Slices of replete topoi

`E2/replete-slice` · lemma

If X is replete and U is an object of X, the slice topos X/U is replete.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Forget a sequence in X/U to X.
2. Its limit in the slice has the same underlying object because the indexing category is connected. Epimorphisms are detected in X.

**Direct prerequisites.**

- [`E2/replete-topoi`](#n-e2-replete-topoi) — Replete topoi

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Lemma 3.1.2, p. 16. Forgetful functor preserves epimorphisms and creates connected limits.

**Acceptance.**

- The slice at the terminal object recovers X.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-replete-cover-descent"></a>
#### Repleteness detected on a cover

`E2/replete-cover-descent` · lemma

If U→1 is an epimorphism in a topos X and X/U is replete, then X is replete.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Base change the tower to U; pullback commutes with the relevant limits.
2. Its projections are epimorphic in X/U. An arrow in X is epimorphic if its pullback along U→1 is.

**Direct prerequisites.**

- [`E2/replete-topoi`](#n-e2-replete-topoi) — Replete topoi

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Lemma 3.1.3, p. 16. Use base change to a covering object.

**Acceptance.**

- Together with replete-slice this gives the source iff statement.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-weakly-contractible-compact-generators"></a>
#### Compact generators from weakly contractible objects

`E2/weakly-contractible-compact-generators` · theorem

If X is locally weakly contractible, D(X,ℤ) is compactly generated by j_!ℤ for coherent weakly contractible objects j:U→1, with one generator for each object in a small covering family.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Identify maps from shifts of j_!ℤ with cohomology of sections on U.
2. Exactness of Γ(U,−) and commutation with coproducts for coherent U make j_!ℤ compact.
3. If all maps from shifts of these generators vanish, every cohomology sheaf vanishes on a covering family, hence the object is zero. The sheaf coproduct and size lemmas remain explicit proof inputs.

**Direct prerequisites.**

- [`E2/locally-weakly-contractible`](#n-e2-locally-weakly-contractible) — Locally weakly contractible topos
- [`E1/derived-presentability`](#n-e1-derived-presentability) — Presentability of unbounded derived sheaves
- [`E0/accessible-and-presentable`](#n-e0-accessible-and-presentable) — Accessible and presentable quasicategories
- `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.2.3(2), p. 18. Exact evaluation on U and coherence give compactness; small family chosen using the topos generator.

**Acceptance.**

- For Set use ℤ as generator of D(Ab).

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions); request [R0.1](#req-r0-1) to `DiamondsAndVStacks:D0`.

<a id="n-e2-space-sheaves-and-postnikov"></a>
#### Space-valued sheaves and Postnikov convergence

`E2/space-sheaves-and-postnikov` · construction

For a small site, use the quasicategory of presheaves of Kan spaces and its accessible localization at covering descent maps to construct sheaves of spaces; localizing further at all hypercovers gives the hypercomplete subcategory. Form τ≤n and the coherent Postnikov tower there. Hypercompleteness means descent along all hypercovers; Postnikov completeness is the stronger convergence/effectivity assertion used here and is not automatic for every hypercomplete topos.

**Construction.**

1. Construct space-valued presheaves using the coherent functor category and the Kan mapping-space model. Impose covering descent by accessible localization. Build truncation from n-truncated mapping targets and assemble its tower. Use exact weakly contractible sections or finite homotopy dimension for convergence; record the size of the hypercover localization and the effective-tower proof as explicit higher-sheaf inputs.

**Direct prerequisites.**

- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations
- [`E0/cocartesian-fibrations-and-restricted-straightening`](#n-e0-cocartesian-fibrations-and-restricted-straightening) — Restricted straightening and sections
- [`E3/accessible-localizations`](#n-e3-accessible-localizations) — Accessible localization and coreflection
- [`E2/hypercover`](#n-e2-hypercover) — Hypercover in a topos

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Definitions 6.2.2.1 and 6.2.2.6, Proposition 6.2.2.7 and Construction 6.2.2.9, PDF pp. 595–599; Proposition 6.5.2.8 and the hypercompletion construction, PDF pp. 686–687; Theorem 6.5.3.12 and Corollary 6.5.3.13, PDF p. 698; Definition 5.5.6.23 and Proposition 5.5.6.26, PDF pp. 516–517; Proposition 7.2.1.10 and proof, PDF pp. 738–739. Sheaf and hypercomplete localizations are distinct; local finite homotopy dimension ensures convergent Postnikov towers.
- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.2.3, p. 18. Weakly contractible objects give exact sections and Postnikov convergence.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E2/weakly-contractible-space-postnikov: weakly contractible sections verify this convergence
- EnhancedDerivedSheaves:E2/perfect-h-hyperdescent: space-level effectivity controls the categorical descent datum

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `spaceSheaves` | constructor | The covering-descent full subcategory of space-valued presheaves. | omitted |
| `hypercompleteSpaceSheaves` | constructor | The hypercover-local subcategory. | omitted |
| `spacePostnikovTower` | data | The coherent truncation tower and its canonical unit. | omitted |
| `spacePostnikov_convergence` | characterisation | Convergence is the equivalence F→lim_nτ≤nF, with tower effectivity required for categorical completeness. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `spaceSheaf_point` | degenerate | On the point site, sheaves are spaces and every Postnikov tower converges. | omitted |
| `spaceSheaf_discrete` | compatibility | A zero-truncated sheaf of spaces is the nerve of an ordinary sheaf of sets. | omitted |
| `spaceSheaf_KZn` | computation | For n≥1, τ≤(n−1)K(ℤ,n) is a point while τ≤nK(ℤ,n)≃K(ℤ,n). | omitted |

**Acceptance.**

- On the point site, sheaves are spaces and every Postnikov tower converges.
- A zero-truncated sheaf of spaces is the nerve of an ordinary sheaf of sets.
- For n≥1, τ≤(n−1)K(ℤ,n) is a point while τ≤nK(ℤ,n)≃K(ℤ,n).

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.8](#gap-g0-8) (Higher sheaf localization and matching objects); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-weakly-contractible-space-postnikov"></a>
#### Postnikov convergence for sheaves of spaces

`E2/weakly-contractible-space-postnikov` · theorem

For a locally weakly contractible topos, Postnikov towers converge in its associated hypercomplete infinity-topos.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Evaluate on weakly contractible objects U. The source identifies homotopy sheaves evaluated on U with homotopy groups of F(U).
2. Use convergence for spaces and the detecting family of U. HTT 7.2.1.10 and the sheaves-of-spaces foundation are unresolved proof inputs.

**Direct prerequisites.**

- [`E2/locally-weakly-contractible`](#n-e2-locally-weakly-contractible) — Locally weakly contractible topos
- [`E2/space-sheaves-and-postnikov`](#n-e2-space-sheaves-and-postnikov) — Space-valued sheaves and Postnikov convergence

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.2.3(3), p. 18. Separate space-valued statement, not deduced merely from derived left completeness.

**Acceptance.**

- On Set this is convergence of the usual Postnikov tower of a space.
- No claim that mere repleteness suffices for this statement.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.8](#gap-g0-8) (Higher sheaf localization and matching objects); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-bounded-below-hypercover-descent"></a>
#### Bounded-below hypercover descent

`E2/bounded-below-hypercover-descent` · theorem

For a hypercover in a topos, f* gives an equivalence D⁺(X)≃D⁺_cart(U_•), where the lower bound is uniform across simplicial degrees. Repleteness is not required.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Present the topos by a small site with fibre products and equalizers, and use the associated total site of the hypercover. Ordinary abelian-sheaf descent identifies the original abelian category with the Cartesian sheaves; the latter form a weak Serre subcategory (Stacks 85.12.6 and 85.17.1).
2. The augmented hypercover resolution and K-injective product totalization give the unit equivalence for all complexes (85.17.3). The inverse-image functor is exact. Apply Cohomology on Sites 21.28.5: the unit/counit statements for degree-zero sheaves extend to bounded complexes by triangles, then to uniformly bounded-below complexes by the truncation spectral sequence.
3. This yields D⁺(X)≃D⁺_cart(U_•) and Rf_* as quasi-inverse (85.17.5). The dg-localization comparison upgrades the natural unit and counit to enhanced equivalences; it is not an inference from bare h-category equivalence.

**Direct prerequisites.**

- [`E2/hypercovers-and-cohomological-descent`](#n-e2-hypercovers-and-cohomological-descent) — Cartesian derived systems on a hypercover

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.3.6 proof of (1) and (3), p. 20. This proof uses bounded-below Cartesian descent; the direct proof is now supplied by the stated Stacks results.
- [The Stacks Project, Simplicial Spaces](#src-e0-stacks-simplicialspaces), Lemma 85.17.5 (tag 0D8I), Simplicial Spaces PDF pp. 41–42; Lemmas 85.17.1 and 85.17.3 (tag 0D8G), pp. 39–41. Read the proof reducing bounded-below Cartesian descent to ordinary descent, the unbounded unit and the weak Serre criterion.
- [The Stacks Project, Cohomology on Sites](#src-e0-stacks-project), Lemma 21.28.5 (tag 0D7U), Cohomology on Sites PDF p. 60. The flat pullback, degree-zero equivalence and unit assumptions imply the bounded-below derived equivalence by cohomology and truncation.

**Acceptance.**

- The identity hypercover gives the identity equivalence.
- Do not replace a uniform lower bound by a separate bound in each degree.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-unbounded-hypercover-unit"></a>
#### Full faithfulness of unbounded hypercover pullback

`E2/unbounded-hypercover-unit` · lemma

For any hypercover in a topos X, the unit K→Rf_*f*K is an equivalence for every K∈D∞(X). Repleteness is not needed for this unit; it is still required for the stated unbounded Cartesian effectivity theorem.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Resolve by K-injectives and compare the product-total hypercover Hom double complex. The augmented free-module hypercover complex is acyclic, so the comparison is a quasi-isomorphism in every degree; identify this with the enhanced unit by the mapping-space computation.

**Direct prerequisites.**

- [`E2/hypercovers-and-cohomological-descent`](#n-e2-hypercovers-and-cohomological-descent) — Cartesian derived systems on a hypercover
- [`E1/k-injective-and-k-flat-replacements`](#n-e1-k-injective-and-k-flat-replacements) — Unbounded K-injective replacement

**Sources.**

- [The Stacks Project, Simplicial Spaces](#src-e0-stacks-simplicialspaces), Simplicial Spaces, Lemma 85.17.3 (0D8G) and proof, PDF pp. 39–40. The unbounded unit is proved from the augmented hypercover resolution and K-injectives, without a replete hypothesis.

**Acceptance.**

- No uniform global cohomological-dimension bound is required in this replete case.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-unbounded-hypercover-counit-left"></a>
#### Hypercover left-adjoint counit

`E2/unbounded-hypercover-counit-left` · lemma

For a hypercover in a replete topos and the adjunction f_!⊣f*, the counit f_!f*→id is an equivalence on D(X).

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Construct f_! using the presentable adjoint-functor theorem for this pullback. Its prerequisite proof is still open.
2. A fully faithful right adjoint has invertible counit; apply this to f* in f_!⊣f*.

**Direct prerequisites.**

- [`E2/unbounded-hypercover-unit`](#n-e2-unbounded-hypercover-unit) — Full faithfulness of unbounded hypercover pullback
- [`E2/hypercovers-and-cohomological-descent`](#n-e2-hypercovers-and-cohomological-descent) — Cartesian derived systems on a hypercover

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.3.6(2), p. 20. Formal consequence of full faithfulness of f*, once its left adjoint exists.

**Acceptance.**

- Do not replace f_! by f_* in this counit.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-unbounded-hypercover-descent"></a>
#### Unbounded hypercover descent

`E2/unbounded-hypercover-descent` · theorem · planet: **Cohomological descent**

For a hypercover in a replete topos X, f* gives an equivalence D(X)≃D_cart(U_•).

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Full faithfulness is unbounded-hypercover-unit.
2. Truncate a Cartesian system uniformly; exact slice pullbacks keep it Cartesian.
3. Bounded-below descent supplies the tower on X. Reconstruct its limit; preservation of inverse limits by slice pullback and repleteness of every slice identify its image with the original system.

**Direct prerequisites.**

- [`E2/unbounded-hypercover-unit`](#n-e2-unbounded-hypercover-unit) — Full faithfulness of unbounded hypercover pullback
- [`E2/bounded-below-hypercover-descent`](#n-e2-bounded-below-hypercover-descent) — Bounded-below hypercover descent
- [`E2/replete-slice`](#n-e2-replete-slice) — Slices of replete topoi
- [`E2/replete-postnikov-counit`](#n-e2-replete-postnikov-counit) — Reconstruction of a compatible truncation tower

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.3.6(3), p. 20. Both full faithfulness and essential surjectivity are needed.

**Acceptance.**

- For the identity hypercover this reduces to Postnikov reconstruction.
- General refinement coherence and independence must still be decomposed, not inferred from existence of one equivalence.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-postnikov-local-injectivity"></a>
#### Local injectivity for derived inverse limits

`E2/postnikov-local-injectivity` · lemma

Let K_n be an inverse system on a ringed site, V an object and m an integer. Suppose a cofinal system of covers {V_i→V} and one N≥0 satisfy R¹lim H^(m−1)(V_i,K_n)=0 and injectivity of H^m(V_i,K_n)→H^m(V_i,K_N) for all n≥N. Then H^m(Rlim K_n)(V)→H^m(K_N)(V) is injective.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Represent a cohomology-sheaf section locally by hypercohomology classes. Refine in the cofinal family until their images at stage N vanish.
2. The Milnor exact sequence and the two hypotheses make the map from each local limit class injective into the stage-N group.
3. All local classes vanish, so the original sheaf section vanishes.

**Direct prerequisites.**

- `DiamondsAndVStacks:D0`
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/ringed-pullback-pushforward`](#n-e1-ringed-pullback-pushforward) — Enhanced ringed pullback and pushforward

**Sources.**

- [The Stacks Project, Tag 0D6L](#src-e0-stacks-0d6l), Tag 0D6L (read 2026-09-26). The cofinal-cover condition allows a second refinement after choosing a local hypercohomology representative.

**Acceptance.**

- A single chosen cover without cofinal refinements does not discharge the hypothesis.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions); request [R0.1](#req-r0-1) to `DiamondsAndVStacks:D0`.

<a id="n-e2-postnikov-uniform-window"></a>
#### Uniform stabilization of truncation cohomology

`E2/postnikov-uniform-window` · lemma

On a ringed site let E∈D(O). For an object V suppose a cofinal family Cov_V of covers and an integer-valued b_V(t) satisfy H^p(V_i,H^(t−p)(E))=0 for p>b_V(t), every t and every member of every cover in Cov_V. Fix m. Set N=max(0,1+max(−m,b_V(m−1)−m,b_V(m)−m−1,b_V(m+1)−m−2)). For n≥N the transitions of K_n=τ≥−nE induce isomorphisms on H^(m−1)(V_i,−) and H^m(V_i,−), uniformly in the covering members.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Use the triangle H^(−n−1)(E)[n+1]→K_{n+1}→K_n→H^(−n−1)(E)[n+2].
2. The obstructing groups have cohomological degrees m+n, m+n+1, m+n+2; their corresponding total degrees are m−1,m,m+1.
3. The stated strict inequalities kill all three groups. The long exact sequence gives the two adjacent-degree isomorphisms.

**Direct prerequisites.**

- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/ringed-pullback-pushforward`](#n-e1-ringed-pullback-pushforward) — Enhanced ringed pullback and pushforward
- `DiamondsAndVStacks:D0`
- `mathlib:CategoryTheory.Triangulated.TStructure.eTruncGE`

**Sources.**

- [The Stacks Project, Tag 0D6M](#src-e0-stacks-0d6m), Tag 0D6M (read 2026-09-26). Extracted the explicit stabilization calculation from the proof; max with zero only ensures a natural-number tower index.

**Acceptance.**

- For b_V(t)=0 and m=0 the displayed sufficient bound is N=1.
- Controlling only total degree m misses the two adjacent groups.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions); request [R0.1](#req-r0-1) to `DiamondsAndVStacks:D0`.

<a id="n-e2-postnikov-diagonal-bound"></a>
#### Postnikov convergence from diagonal cohomology bounds

`E2/postnikov-diagonal-bound` · theorem

Let B cover a ringed site and E∈D(O). If each V∈B has a cofinal family Cov_V and bounds b_V(t) as in postnikov-uniform-window, then E→Rlim τ≥−nE is an equivalence.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Fix m and V. Stabilization in degrees m−1,m gives the two local-injectivity hypotheses, with eventually constant towers having R¹lim zero.
2. E→K_N induces an isomorphism on H^m for N≥−m. Since H^m(Rlim K_n)(V)→H^m(K_N)(V) is injective, the composite proves H^m(E)(V)→H^m(Rlim K_n)(V) bijective.
3. The family B covers every object, so the maps of cohomology sheaves are isomorphisms; apply cohomology detection.

**Direct prerequisites.**

- [`E2/postnikov-uniform-window`](#n-e2-postnikov-uniform-window) — Uniform stabilization of truncation cohomology
- [`E2/postnikov-local-injectivity`](#n-e2-postnikov-local-injectivity) — Local injectivity for derived inverse limits
- `mathlib:DerivedCategory.isIso_iff`
- `DiamondsAndVStacks:D0`

**Sources.**

- [The Stacks Project, Tag 0D6M](#src-e0-stacks-0d6m), Tag 0D6M (read 2026-09-26). The local bound may depend on V and total degree; uniformity is across the members of the chosen cofinal covers.

**Acceptance.**

- No exactness of products of arbitrary sheaves is assumed.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions); request [R0.1](#req-r0-1) to `DiamondsAndVStacks:D0`.

<a id="n-e2-postnikov-local-finite-dimension"></a>
#### Postnikov convergence from local dimension bounds

`E2/postnikov-local-finite-dimension` · theorem

Let E∈D(O) on a ringed site with covering family B. Suppose for every V∈B there are d_V≥0 and a cofinal family Cov_V with H^p(V_i,H^q(E))=0 whenever p>d_V and q<0. Then E→Rlim τ≥−nE is an equivalence.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Set b_V(t)=d_V+max(0,t).
2. If p>b_V(t), then p>d_V and t−p<0, so the diagonal vanishing hypothesis holds.
3. Apply postnikov-diagonal-bound.

**Direct prerequisites.**

- [`E2/postnikov-diagonal-bound`](#n-e2-postnikov-diagonal-bound) — Postnikov convergence from diagonal cohomology bounds

**Sources.**

- [The Stacks Project, Tag 0D6N](#src-e0-stacks-0d6n), Tag 0D6N (read 2026-09-26). The bound concerns negative cohomology sheaves; it need not bound all sheaves of the topos.

**Acceptance.**

- Different basis objects may have different finite bounds.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-postnikov-finite-cohomological-dimension"></a>
#### Finite cohomological dimension criterion

`E2/postnikov-finite-cohomological-dimension` · theorem

Let E∈D(O) on a ringed site. Suppose B is a covering family and d≥0 satisfies H^p(V,H^q(E))=0 for every V∈B, p>d and q<0. Then E→Rlim τ≥−nE is an equivalence. This is a theorem about E; a left-completeness statement for the entire derived category requires the criterion for every E.

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. For V∈B, use covers whose members are in B; they form a cofinal system by refining each member of any cover.
2. Apply the local finite-dimension criterion with d_V=d.

**Direct prerequisites.**

- [`E2/postnikov-local-finite-dimension`](#n-e2-postnikov-local-finite-dimension) — Postnikov convergence from local dimension bounds

**Sources.**

- [The Stacks Project, Tag 0D6P](#src-e0-stacks-0d6p), Tag 0D6P (read 2026-09-26). Site-level criterion. It replaces an unjustified application of the ringed-space tag 0719 to a general site.

**Acceptance.**

- For weakly contractible covering objects take d=0.
- A bound only for one E does not prove left completeness of D(O).

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.11](#gap-g0-11) (Source-version collation); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-exact-sections-postnikov"></a>
#### Postnikov comparison under exact sections

`E2/exact-sections-postnikov` · lemma

If Γ(U,−) on abelian sheaves of X is exact, then RΓ(U,K)→Rlim RΓ(U,τ≥−nK) is an equivalence for every K∈D(X).

**Hypotheses.**

- Universe sizes and the indicated grading conventions are fixed throughout.

**Proof.**

1. Compute derived sections by sections of any representative complex because the section functor is exact.
2. Exactness commutes with good truncations. Use left completeness of D(Ab), obtained from Set being replete.

**Direct prerequisites.**

- [`E1/ringed-pullback-pushforward`](#n-e1-ringed-pullback-pushforward) — Enhanced ringed pullback and pushforward
- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula
- [`E2/left-completion`](#n-e2-left-completion) — Left completeness for replete topoi

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.3.7(1), p. 20. Objectwise statement uses exactness and left completeness of D(Ab); no repleteness of X.

**Acceptance.**

- This does not imply K reconstructs unless the exact section functors detect equivalences.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-pro-towers"></a>
#### Ordinary pro-zero towers and pro-isomorphisms

`E2/pro-towers` · definition

An ordinary module-sheaf tower M is pro-zero when for every n there is m≥n such that the transition M_m→M_n is zero. A morphism of ordinary module towers is a pro-isomorphism when its kernel and cokernel towers are pro-zero. For a morphism of coherent derived towers the required degreewise condition is that every cohomology tower of its cone is pro-zero; a uniform vanishing stage across all degrees is a stronger condition and is not part of this definition.

**Construction.**

1. Use actual transition maps, not merely vanishing inverse limits. Form kernel, cokernel and cohomology towers functorially. Prove stability under cofinal reindexing and short exact sequences of ordinary towers.

**Direct prerequisites.**

- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula
- `mathlib:CategoryTheory.Abelian`

**Sources.**

- [On the direct summand conjecture and its derived variant](#src-e0-bhatt-directsummand), Definition 3.2, Lemmas 3.4–3.6 and Lemma 5.3, pp. 5–6 and 9. The ordinary specialization of almost pro-zero uses eventual zero transitions and a detecting comparison.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E2/pro-zero-derived-limit: this is the condition needed to deduce vanishing of the derived limit
- ArithmeticGaloisDuality:D7: imports the ordinary criterion from E2, without an almost clause

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `IsProZero` | characterisation | Each fixed target stage is killed by a sufficiently late transition. | included |
| `IsProIsomorphism` | characterisation | Kernel and cokernel towers are pro-zero. | included |
| `proZero_cofinal` | compatibility | The property is invariant under cofinal monotone reindexing. | included |
| `proIso_comp` | structure | Pro-isomorphisms satisfy composition and two-out-of-three. | partial |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `proZero_zero` | degenerate | The zero tower is pro-zero. | included |
| `proZero_zero_maps` | computation | An arbitrary nonzero family with zero transition maps is pro-zero. | included |
| `proZero_not_p_multiplication` | non-example | For the tower ℤ with ×p transitions no transition into a fixed stage is zero; the tower is not pro-zero although lim is zero. | included |

**Acceptance.**

- The zero tower is pro-zero.
- An arbitrary nonzero family with zero transition maps is pro-zero.
- For the tower ℤ with ×p transitions no transition into a fixed stage is zero; the tower is not pro-zero although lim is zero.

**Lean prototype:** included (`IsProZero`, `IsProIsomorphism`). Actual eventual zero transition maps and kernels/cokernels of the level transformation.

<a id="n-e2-pro-zero-derived-limit"></a>
#### Derived inverse-limit invariance under pro-zero errors

`E2/pro-zero-derived-limit` · theorem

In a replete topos, a pro-zero ordinary module-sheaf tower has lim=lim¹=0. Hence a coherent derived tower whose every cohomology tower is pro-zero has Rlim=0. A morphism whose cone has this degreewise property induces an equivalence on Rlim. The strict pro-Tor error of unbounded coefficient systems must separately be shown degreewise pro-zero by the uniform finite-amplitude algebraic argument from DD.1.

**Proof.**

1. For a pro-zero tower, solve (1−s)x=y by a finite sum in each component, since only finitely many composites into that fixed component are nonzero. Its kernel is zero; this proves both lim and lim¹ vanish. Apply Milnor in every integer degree to the cohomology towers of the cone, then use cohomology detection.

**Direct prerequisites.**

- [`E2/pro-towers`](#n-e2-pro-towers) — Ordinary pro-zero towers and pro-isomorphisms
- [`E2/tower-milnor`](#n-e2-tower-milnor) — Milnor exact sequence
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category

**Sources.**

- [On the direct summand conjecture and its derived variant](#src-e0-bhatt-directsummand), Lemmas 3.4–3.6 and Lemma 5.3, pp. 5–6 and 9. The ordinary pro-zero specialization kills the derived inverse-limit error.
- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Lemma 3.5.4, p. 25. The unbounded pro-Tor application needs finite regular-sequence amplitude, not arbitrary tensor preservation of pro-zero systems.

**Acceptance.**

- The chosen killing stage may depend on n and on the cohomology degree.
- Do not infer invariance after tensoring a variable unbounded tower solely from a degreewise pro-isomorphism of coefficient rings.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-hypercover-refinement"></a>
#### Independence under hypercover refinement

`E2/hypercover-refinement` · theorem

For a refinement V_•→U_• of hypercovers of X in a replete topos, pullback gives an equivalence D_cart(U_•)→D_cart(V_•), coherently compatible with refinement composition. Under either descent equivalence it identifies with id_{D∞(X)}. On the uniformly bounded-below Cartesian subcategories the same holds on an arbitrary topos.

**Proof.**

1. Compose refinement pullback with augmentation pullback from D∞(X). The canonical comparison with the second augmentation is an equivalence. Apply the descent equivalences to deduce refinement equivalence; contractible inverse choices yield composition coherence.

**Direct prerequisites.**

- [`E2/unbounded-hypercover-descent`](#n-e2-unbounded-hypercover-descent) — Unbounded hypercover descent
- [`E2/bounded-below-hypercover-descent`](#n-e2-bounded-below-hypercover-descent) — Bounded-below hypercover descent
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations
- [`E0/cocartesian-fibrations-and-restricted-straightening`](#n-e0-cocartesian-fibrations-and-restricted-straightening) — Restricted straightening and sections

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.3.6, p. 20. The descent equivalence identifies all refinements with the same original complex.
- [The Stacks Project, Simplicial Spaces](#src-e0-stacks-simplicialspaces), Simplicial Spaces, Lemmas 85.18.4 (0DA2) and 85.20.4 (0DA7), PDF pp. 43–45. The bounded-below Cartesian equivalence is natural in the augmented hypercover.

**Acceptance.**

- The identity refinement acts by identity.
- Two successive refinements give the same functor as their composite up to the prescribed natural equivalence.
- Refinement independence is stated for coherent Cartesian systems, not arbitrary simplicial derived objects.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-perfect-h-topology"></a>
#### The h-topology on perfect schemes

`E2/perfect-h-topology` · definition

On perfect qcqs F_p-schemes, h-covers are perfections of h-covers of ordinary qcqs F_p-schemes; the ordinary h-topology is generated by faithfully flat finite-presentation covers and proper surjective finite-presentation covers. On perfectly finitely presented schemes over a fixed perfect base restrict to those morphisms. All cutoffs are specified so that the site is small.

**Construction.**

1. Use ordinary scheme perfection and the finite-presentation h-cover generators. Verify pullback/composition closure after perfection and restrict to a fixed adequate cardinal cutoff.

**Direct prerequisites.**

- [`E1/quasicoherent-derived-sheaves`](#n-e1-quasicoherent-derived-sheaves) — Quasicoherent derived sheaves
- `DiamondsAndVStacks:D0`

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e0-bhattscholze-wittgrassmannian), Definition 11.1, p. 40; Theorem 2.9 and §2, pp. 6–8. The perfect h-topology retains the finite-presentation cover conditions from ordinary schemes.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E2/perfect-h-cech-descent: the cover conditions specify the descent problem

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `perfectHTopology` | constructor | The h-topology with these cover generators. | omitted |
| `perfectHCovers_pullback` | structure | Pullback of an h-cover is an h-cover. | omitted |
| `perfectHCovers_perfection` | compatibility | Perfection of an ordinary h-cover is a cover in the perfect h-site. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `perfectH_identity` | degenerate | The identity map is an h-cover. | omitted |
| `perfectH_fppf` | compatibility | The perfection of an fppf cover is an h-cover. | omitted |
| `perfectH_empty` | non-example | The empty scheme does not h-cover a nonempty scheme. | omitted |

**Acceptance.**

- The identity map is an h-cover.
- The perfection of an fppf cover is an h-cover.
- The empty scheme does not h-cover a nonempty scheme.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.6](#gap-g0-6) (Ordinary geometric h-descent inputs); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions); request [R0.1](#req-r0-1) to `DiamondsAndVStacks:D0`.

<a id="n-e2-perfect-h-boundedness"></a>
#### Boundedness detected by perfect h-covers

`E2/perfect-h-boundedness` · theorem

For an h-cover f:X→Y of perfect qcqs schemes and K∈Dqc(Y), if Lf*K is bounded, K is bounded. On perfectly finitely presented schemes finite Tor dimension also proves that pullback preserves bounded complexes.

**Proof.**

1. For the perfection of an fppf cover use faithful-flat detection on cohomology. For proper covers refine to modifications and induct on the closed complement. The proper-modification pullback square for structure sheaves, projection formula and finite cohomological dimension identify K as a finite pullback of bounded complexes. The scheme-theoretic refinement theorem is an ordinary-geometry proof input recorded in gaps.

**Direct prerequisites.**

- [`E2/perfect-h-topology`](#n-e2-perfect-h-topology) — The h-topology on perfect schemes
- [`E1/perfect-finite-tor-dimension`](#n-e1-perfect-finite-tor-dimension) — Finite Tor dimension for perfect presentations
- [`E1/perfect-scheme-base-change`](#n-e1-perfect-scheme-base-change) — Derived base change on perfect schemes

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e0-bhattscholze-wittgrassmannian), Lemma 11.30 and proof of Theorem 11.2(3), pp. 47–48. Refine into fppf and proper modifications and induct on the modification level.

**Acceptance.**

- The theorem detects a two-sided bound of K; it does not say arbitrary ring maps reflect boundedness.
- The finite-presentation condition is kept in the separate preservation statement.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.6](#gap-g0-6) (Ordinary geometric h-descent inputs); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-perfect-h-cover-descendability"></a>
#### Quantitative descendability of perfect h-covers

`E2/perfect-h-cover-descendability` · theorem

For an h-cover f:X→Y of perfect qcqs F_p-schemes, the structure-algebra map O_Y→Rf_*O_X is descendable: the canonical tensor power of its fibre maps null-homotopically to O_Y for some finite positive power. No uniform index over all h-covers is asserted. In the Frobenius approximation of a fixed fppf or proper Noetherian cover, the index is bounded independently of the approximation stage.

**Hypotheses.**

- Use the E1 unbounded Dqc enhancement and coherent tensor/derived base change. Ordinary geometry and finite Noetherian cover bounds are the requested lower-tier D0 inputs.

**Proof.**

1. Refine and approximate the cover by perfections of fppf or proper surjective maps of Noetherian schemes. Import the ordinary geometric tensor-nilpotence bound there, and lift its vanishing map through the E1 ordinary/enhanced comparison.
2. Base change along the Frobenius approximation preserves a fixed nilpotence exponent. The geometric Frobenius/Tor-vanishing bridge identifies the perfected limit of derived fibre products with the ordinary perfect fibre product; its formal comparison is an explicit geometry gap, rather than an assumed full animation theory.
3. For the countable telescope, the possible obstruction lies in lim¹ of mapping groups. Tensor two obstruction maps: their product lies in lim², which vanishes for a sequential tower. Thus a uniform exponent m gives an exponent at most 2m after passage to the limit. Use the E2 coherent Milnor calculation; abstract E5 module descent is not used to prove this geometric input.

**Direct prerequisites.**

- [`E2/perfect-h-topology`](#n-e2-perfect-h-topology) — The h-topology on perfect schemes
- [`E1/quasicoherent-derived-sheaves`](#n-e1-quasicoherent-derived-sheaves) — Quasicoherent derived sheaves
- [`E1/perfect-scheme-base-change`](#n-e1-perfect-scheme-base-change) — Derived base change on perfect schemes
- [`E1/perfect-ring-tor`](#n-e1-perfect-ring-tor) — Tor independence of perfect algebras
- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula
- [`E2/tower-milnor`](#n-e2-tower-milnor) — Milnor exact sequence
- `DiamondsAndVStacks:D0`

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e0-bhattscholze-wittgrassmannian), Lemma 11.22 and Lemma 11.23, p. 44; Proposition 11.25, p. 45; Theorem 11.27 and proof, p. 46; Frobenius comparison Proposition 11.6, pp. 41–42. Noetherian geometric bounds survive Frobenius base change uniformly, and the countable telescope argument retains descendability.

**Acceptance.**

- The index bound is uniform along the fixed Frobenius sequence, not merely finite separately at each stage.
- An arbitrary filtered colimit of descendable maps is not inferred to be descendable; Witt Example 11.21 supplies the counterexample.

**Lean prototype:** omitted. The exact quantitative geometric theorem and uniform-index proof are planned; its fibre/tensor-nilpotence and Frobenius comparison are not yet typed.

**Open obligations:** gap [G0.6](#gap-g0-6) (Ordinary geometric h-descent inputs); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions); request [R0.1](#req-r0-1) to `DiamondsAndVStacks:D0`.

<a id="n-e2-perfect-h-cech-descent"></a>
#### h-descent for quasicoherent and perfect complexes

`E2/perfect-h-cech-descent` · theorem · planet: **Perfect h-descent**

The functor X↦Dqc(X) on perfect qcqs F_p-schemes satisfies h-Čech descent. Perf(X) satisfies h-hyperdescent. For perfectly finitely presented maps the bounded subcategory Dqcᵇ is functorial and satisfies h-descent, because finite Tor dimension preserves boundedness and h-covers detect boundedness. These statements do not assert unbounded h-hyperdescent over arbitrary perfect bases.

**Proof.**

1. Use the preceding E2 geometric theorem that O_Y→Rf_*O_X is quantitatively descendable for an h-cover of perfect schemes (Witt Theorem 11.27, p. 46). Its proof needs fppf and proper Noetherian descendability, base-change control of the index, and a uniform bound along the countable Frobenius telescope (11.22–11.25, pp. 44–45); ordinary h-cover cohomology alone does not imply it. Apply the separately requested acyclic E5 abstract module-descent theorem to obtain Čech effectivity. Restrict to finite perfect amplitude for hyperdescent: the corresponding spaces are truncated, and a Cartesian hypercover datum retains the amplitude of its degree-zero member. Finite Tor dimension and h-boundedness detection handle Dqcᵇ.

**Direct prerequisites.**

- [`E2/perfect-h-topology`](#n-e2-perfect-h-topology) — The h-topology on perfect schemes
- [`E1/perfect-scheme-base-change`](#n-e1-perfect-scheme-base-change) — Derived base change on perfect schemes
- [`E1/perfect-finite-tor-dimension`](#n-e1-perfect-finite-tor-dimension) — Finite Tor dimension for perfect presentations
- [`E2/perfect-h-boundedness`](#n-e2-perfect-h-boundedness) — Boundedness detected by perfect h-covers
- [`E1/quasicoherent-derived-sheaves`](#n-e1-quasicoherent-derived-sheaves) — Quasicoherent derived sheaves
- [`E2/perfect-h-cover-descendability`](#n-e2-perfect-h-cover-descendability) — Quantitative descendability of perfect h-covers
- [`E5:abstract/module-descent-and-functoriality`](#n-e5-abstract-module-descent-and-functoriality) — Module descent and permanence of descendability

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e0-bhattscholze-wittgrassmannian), Theorem 11.2(1)–(3), p. 40; Lemmas 11.22–11.23 and Proposition 11.25, pp. 44–45; Theorem 11.27 and proof, p. 46; amplitude argument, pp. 46–48. Categorical h-descent, finite perfect-amplitude descent and boundedness detection have distinct hypotheses.

**Acceptance.**

- Perfect complexes carry a uniform local finite amplitude along the hypercover.
- Do not replace an h-Čech theorem for unbounded Dqc by a hyperdescent theorem without the finite-dimensional base condition.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.7](#gap-g0-7) (Acyclic abstract module descent); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions); request [R0.2](#req-r0-2) to `EnhancedDerivedSheaves:E5:abstract`.

<a id="n-e2-tensor-bounded-totalization"></a>
#### Tensor and bounded cosimplicial totalization

`E2/tensor-bounded-totalization` · theorem

If R has finite global dimension, N• is a cosimplicial ordinary R-module (each term in degree zero), and Tot N• is bounded, then for any unbounded M∈D∞(R) the canonical map M⊗ᴸ_R Tot N•→Tot(M⊗ᴸ_R N•) is an equivalence. It does not assert that arbitrary tensor products preserve arbitrary totalizations of unbounded cosimplicial complexes.

**Proof.**

1. Use the common global-dimension bound to compare tensor of unbounded M with its cochain truncations against bounded complexes. For bounded M reduce to projective modules; Dold–Kan computes the totalization. Then use uniform cohomological bounds on Tot N• and on degree-zero N^n to pass through truncation towers degree by degree.

**Direct prerequisites.**

- [`E1/perfect-finite-global-dimension`](#n-e1-perfect-finite-global-dimension) — Finite global dimension after perfection
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula
- [`E2/tower-milnor`](#n-e2-tower-milnor) — Milnor exact sequence

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e0-bhattscholze-wittgrassmannian), Lemma 11.36, pp. 50–51. Finite global dimension gives uniform Tor bounds and allows the two truncation/totalization limits to commute.

**Acceptance.**

- For a constant cosimplicial module N this is the identity comparison.
- The boundedness of Tot N• and the degree-zero condition on N^n are both retained.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e2-perfect-h-hyperdescent"></a>
#### Unbounded h-hyperdescent over a finite-dimensional perfect base

`E2/perfect-h-hyperdescent` · theorem · planet: **Perfect h-hyperdescent**

Let k be the perfection of a regular Noetherian F_p-algebra of finite Krull dimension. On perfectly finitely presented perfect k-schemes, X↦Dqc(X) satisfies h-hyperdescent. For an h-hypercover X•→Y and any K∈Dqc(Y), RΓ(Y,K)≃Tot RΓ(X•,K|X•); every coherent Cartesian Dqc datum is effective.

**Proof.**

1. Refine to an affine hypercover. The structure-sheaf totalization is the degree-zero base ring; finite global dimension and the tensor-totalization theorem give RΓ hyperdescent for any K. For a Cartesian datum define its hypercomplete sheaf by totalization after every base change; it restricts to the prescribed terms. Restrict to X⁰ and use already-proved h-Čech effectivity to obtain a quasicoherent object on Y.

**Direct prerequisites.**

- [`E2/perfect-h-cech-descent`](#n-e2-perfect-h-cech-descent) — h-descent for quasicoherent and perfect complexes
- [`E2/tensor-bounded-totalization`](#n-e2-tensor-bounded-totalization) — Tensor and bounded cosimplicial totalization
- [`E1/quasicoherent-derived-sheaves`](#n-e1-quasicoherent-derived-sheaves) — Quasicoherent derived sheaves
- [`E2/space-sheaves-and-postnikov`](#n-e2-space-sheaves-and-postnikov) — Space-valued sheaves and Postnikov convergence

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e0-bhattscholze-wittgrassmannian), Theorem 11.2(4), p. 40; Lemmas 11.37–11.38 and Remark 11.39, pp. 50–51. Mapping hyperdescent follows from bounded totalization; Čech effectivity supplies object effectivity.

**Acceptance.**

- The bound is on the ordinary regular presentation of the perfect base; it is not an assertion for every perfect ring.
- The conclusion is an enhanced categorical equivalence, including mapping spaces and essential surjectivity.

**Lean prototype:** omitted. The coherent enhanced diagram, Postnikov, higher sheaf/matching-object or perfect-scheme interface needed for this exact statement is not yet expressed.

**Open obligations:** gap [G0.6](#gap-g0-6) (Ordinary geometric h-descent inputs); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).


<a id="layer-e3"></a>

## E3 — Coherent diagrams, Kan extensions and adjoints

Kan extensions are universal properties in coherent functor categories. Along
a full inclusion the extension is given pointwise by slice colimits; existence
and contractible uniqueness come from the relative cone restriction theorem,
which needs a categorical fibration (an inner fibration alone does not give
HTT's trivial-fibration statement). Cofinality of a terminal fibre is a
comma-category contractibility criterion over a quasicategory base, and
preservation of coCartesian edges is tested by the universal mapping-space
square. The left Kan extension theorem uses only E0, so E5 can depend on it
without depending on any sheaf theory.

Liu and Zheng's construction gives coherent diagrams of ringed topoi with
varying coefficients when the topoi have enough points. Arbitrary replete topoi
need a point-free comparison of the variable-coefficient Cartesian model with
the enhanced limit, using a small site presentation in a larger universe; the
constant-model localization is an input, not the comparison (gap
[G0.4](#gap-g0-4)).

Space-valued representability constructs adjoints. Between presentable
quasicategories, a functor has a right adjoint exactly when it preserves small
colimits and a left adjoint exactly when it is accessible and preserves small
limits. Its étale acceptance example is the only use of E1's presentability.
Accessible localizations impose a small set of local conditions; reflections
and coreflections are kept apart. Limits of presentable categories record
whether the transitions are left or right adjoints. In a stable category exact
plus coproduct-preserving means colimit-preserving, and for a compactly
generated source a right adjoint preserves coproducts exactly when its left
adjoint preserves compact objects. Finite mates and their pasting are
Mathlib's; the new target is the coherent Beck–Chevalley datum for ringed
diagrams. At cardinal cutoffs, uniqueness of representing objects compares
right adjoints when the source is fixed, and each cutoff category must be
presentable.

<a id="n-e3-left-kan-extension-along-a-full-inclusion"></a>
#### Left Kan extension along a full inclusion

`E3/left-kan-extension-along-a-full-inclusion` · theorem · planet: **Left Kan extensions**

Let i:C₀→C be a full inclusion, p:D→B a categorical fibration (inner horn lifting together with equivalence lifting), and a prescribed base functor C→B. A lift F₀:C₀→D extends by relative left Kan extension if the diagram (C₀)_{/c}→D admits the required p-colimit for every c. Restriction from the full quasicategory of relative left Kan extensions to the extendible F₀ is a trivial fibration. The pointwise value is that relative colimit, and the space of extensions of a fixed F₀ is contractible.

**Hypotheses.**

- The full inclusion and all source/base quasicategories have the fixed sizes. The categorical-fibration condition is the hypothesis of HTT 4.3.2.12–15; inner horn lifting alone does not establish the asserted trivial fibration.

**Proof.**

1. Build the restriction simplicial map on relative functor categories. Extend successively over simplices using the prescribed slice colimits and their contractible spaces of choices. Lemmas 4.3.2.12–13 give boundary lifting and identify the full image; this proves the trivial fibration and coherent uniqueness.
2. Retain equivalence lifting in the relative extension argument; this is also used when a degenerate simplex is added. Ordinary absolute left Kan extension is the base-point specialization, not the entire relative assertion.

**Direct prerequisites.**

- [`E0/slices-and-cones`](#n-e0-slices-and-cones) — Slices and cone categories
- [`E0/limits-colimits-universal-properties`](#n-e0-limits-colimits-universal-properties) — Enhanced limits and colimits
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations
- [`E0/cocartesian-fibrations-and-restricted-straightening`](#n-e0-cocartesian-fibrations-and-restricted-straightening) — Restricted straightening and sections
- `mathlib:CategoryTheory.Functor.IsLeftKanExtension`

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Definition 4.3.2.2, PDF p. 289; Lemmas 4.3.2.12–13 and Propositions 4.3.2.15–17, PDF pp. 297–303. Relative cone extension gives existence and contractible uniqueness, with the slice pointwise formula.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `IsCategoricalFibration` | characterisation | Inner horn lifting together with lifting every outgoing base equivalence by an equivalence. | included |
| `IsLeftKanExtension` | universal-property | For every H, precomposition with η identifies Map(G,H) with Map(F,i*H). | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `categoricalFibration_identity` | degenerate | The identity simplicial map is a categorical fibration. | included |
| `categoricalFibration_point` | compatibility | A quasicategory maps to a point by a categorical fibration. | included |
| `categoricalFibration_product` | computation | The product projection B×C→B of quasicategories is a categorical fibration. | included |
| `categoricalFibration_missing_equivalence` | non-example | The nerve of the full inclusion of one object into the groupoid with two uniquely isomorphic objects is inner but not a categorical fibration: the missing object prevents lifting the base equivalence. | omitted |

**Acceptance.**

- When p:D→* the value at c is colim_{(x→c)∈C₀/c}F₀(x).
- For c in C₀ the slice has a final object id_c, so extension restricts to F₀.
- For ordinary category nerves this recovers pinned IsLeftKanExtension, with its ordinary comma-category formula.

**Lean prototype:** partial (`IsCategoricalFibration`, `coherentRestrict`, `IsLeftKanExtension`). Categorical fibration includes equivalence lifting; the absolute mapping-space Kan predicate is typed. Relative p-colimits, full inclusions and the restriction trivial-fibration conclusion are omitted.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e3-coherent-diagrams-of-ringed-topoi"></a>
#### Coherent ringed-topos diagrams

`E3/coherent-diagrams-of-ringed-topoi` · construction

For a small poset Ξ and a diagram of ringed topoi with enough points, localize the relative diagram of dg-flat complexes at quasi-isomorphisms. It gives a coherent diagram ξ↦D∞(X_ξ,R_ξ) whose transitions are the enhanced derived ringed pullbacks. For a fixed topos X and Λ:Ξᵒᵖ→CommRing, define D∞(X,Λ) by the enhancement of module sheaves on Fun(Ξᵒᵖ,X). Cartesian objects are the sections whose derived scalar-transition maps are equivalences. The enough-points assumption belongs to the cited flat-model construction.

**Construction.**

1. Use dg-flat complexes and mark quasi-isomorphisms before taking the multisimplicial nerve. Pullback preserves these marked maps. Relative localization and straightening assemble a coherent diagram. Compare the fibrewise localization with the K-injective enhancement. For constant Λ identify the diagram category with Fun(NΞᵒᵖ,D∞(X,Λ)); variable coefficients use the Cartesian scalar-change condition.

**Direct prerequisites.**

- [`E1/ringed-pullback-pushforward`](#n-e1-ringed-pullback-pushforward) — Enhanced ringed pullback and pushforward
- [`E1/k-flat-replacement`](#n-e1-k-flat-replacement) — Unbounded K-flat replacement
- [`E0/cocartesian-fibrations-and-restricted-straightening`](#n-e0-cocartesian-fibrations-and-restricted-straightening) — Restricted straightening and sections
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations

**Sources.**

- [Enhanced six operations and base change theorem for higher Artin stacks](#src-e0-liuzheng-sixoperations), Proposition 3.1.3; Definitions 3.2.1 and 3.2.5; Lemmas 3.2.2 and 3.2.10, pp. 84–88. The ringed-topos localization machine gives coherent pullbacks and ringed diagram categories.

**Uses that shape the API.**

- DiamondSixOperations:S2: supplies coherent pullback diagrams before geometric six-operation input
- EnhancedDerivedSheaves:E4/compatible-coefficient-systems: the variable-coefficient point-free comparison is stated separately

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `ringedDiagramDerived` | constructor | The enhanced derived category for the ringed diagram. | omitted |
| `ringedDiagram_eval` | projection | Evaluation at each ξ and each transition pullback. | omitted |
| `ringedDiagram_constant` | equivalence | For constant coefficients and fixed X, D∞(X,Λ_Ξ)≃Fun(NΞᵒᵖ,D∞(X,Λ)). | omitted |
| `ringedDiagram_cartesian` | characterisation | The full subcategory of sections with invertible derived transition maps. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `ringedDiagram_point` | degenerate | For a one-object Ξ the category is D∞(X,R). | omitted |
| `ringedDiagram_interval` | computation | For Ξ=[1] with constant coefficients it is the enhanced arrow category, retaining homotopies of commuting squares. | omitted |
| `ringedDiagram_nonflat_coefficients` | non-example | For ℤ→ℤ/p, a Cartesian transition from (ℤ/p)[0] is its derived reduction with degrees −1 and 0; replacing it by the ordinary tensor does not give a Cartesian section. | omitted |

**Acceptance.**

- For a one-object Ξ the category is D∞(X,R).
- For Ξ=[1] with constant coefficients it is the enhanced arrow category, retaining homotopies of commuting squares.
- For ℤ→ℤ/p, a Cartesian transition from (ℤ/p)[0] is its derived reduction with degrees −1 and 0; replacing it by the ordinary tensor does not give a Cartesian section.

**Lean prototype:** omitted. The genuine presentability, coherent ringed diagram, Kan or variable-source cutoff condition needed for this statement is not yet expressed; the existing bicategorical adjunction/mates alone are insufficient.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e3-representability"></a>
#### Space-valued representability

`E3/representability` · theorem · planet: **Representability**

If C is presentable, a functor F:Cᵒᵖ→Spaces is representable exactly when it preserves small limits. The space of representing objects with the representing equivalence is contractible. Presentable categories consequently admit small limits.

**Proof.**

1. Express C as an accessible localization of a presheaf category. A limit-preserving space-valued functor extends to a representable presheaf functor; the local condition puts the representing object in C. Fully faithful Yoneda gives contractible uniqueness.

**Direct prerequisites.**

- [`E0/accessible-and-presentable`](#n-e0-accessible-and-presentable) — Accessible and presentable quasicategories
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations
- [`E0/limits-colimits-universal-properties`](#n-e0-limits-colimits-universal-properties) — Enhanced limits and colimits

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Proposition 5.5.2.2 and Corollary 5.5.2.4, PDF pp. 481–482. The presentable Yoneda argument produces representing objects and hence adjoints.

**Acceptance.**

- For Map_C(−,c) the representing object is c.
- The theorem is about space-valued functors, including all higher mapping homotopy groups.

**Lean prototype:** omitted. The genuine presentability, coherent ringed diagram, Kan or variable-source cutoff condition needed for this statement is not yet expressed; the existing bicategorical adjunction/mates alone are insufficient.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e3-adjoint-functor-theorem-and-localisations"></a>
#### The enhanced adjoint functor theorem

`E3/adjoint-functor-theorem-and-localisations` · theorem · planet: **Adjoint functor theorem**

For a functor F:C→D between presentable quasicategories, F has a right adjoint if and only if it preserves all small colimits; F has a left adjoint if and only if it is accessible and preserves all small limits. The resulting adjunction is space-valued and unique up to contractible coherent choice. A full presentable subcategory whose inclusion preserves colimits has a right adjoint to that inclusion.

**Proof.**

1. For d∈D represent c↦Map_D(Fc,d) to construct Gd; coherent Yoneda assembles G and its mapping-space adjunction. For a left adjoint use accessibility to reduce its solution-set argument to one regular cardinal and limit preservation. Yoneda supplies uniqueness and both triangular coherences.

**Direct prerequisites.**

- [`E3/representability`](#n-e3-representability) — Space-valued representability
- [`E0/accessible-and-presentable`](#n-e0-accessible-and-presentable) — Accessible and presentable quasicategories
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations
- [`E1/derived-presentability`](#n-e1-derived-presentability) — Presentability of unbounded derived sheaves

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Corollary 5.5.2.9, PDF p. 484. Representability gives both directions with their different preservation/accessibility hypotheses.

**Acceptance.**

- For the inclusion of étale objects, the supplied colimit-closure hypothesis constructs a right adjoint (coreflection).
- An arbitrary fully faithful inclusion need not have a right adjoint.
- Ordinary categories viewed by nerves recover ordinary adjunctions, while the enhanced statement retains mapping spaces.

**Lean prototype:** partial (`HasEnhancedRightAdjoint`, `HasEnhancedLeftAdjoint`, `adjointFunctor_right_iff`, `adjointFunctor_left_iff`, `presentableCoreflector_adjunction`). Actual presentability, preservation and bicategorical adjunction conditions are typed; contractible uniqueness is not stated.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e3-mates-and-beck-chevalley"></a>
#### Coherent Beck–Chevalley comparisons

`E3/mates-and-beck-chevalley` · construction · planet: **Beck–Chevalley transformations**

For enhanced adjunctions L₁⊣R₁ and L₂⊣R₂ and a square α:gL₂→L₁h, the pinned bicategorical mate in QCat gives R₁g→hR₂ by unit, α and counit pasting. Beck–Chevalley means invertibility of this mate. Identity and finite pasting laws are imported from the bicategorical API. The additional target is a representative coherent natural transformation and its compatibility with the relative-localization diagram construction.

**Construction.**

1. Reuse the existing Bicategory.mateEquiv on QCat for the finite mate map and Bicategory.mateEquiv_vcomp for vertical pasting. Compare its unit/counit formula with the scalar/pullback squares from E1. The new enhanced target is functorial higher coherent Beck–Chevalley data in ringed diagrams and verification of its invertibility in applications; a finite bicategorical map alone does not prove that target.

**Direct prerequisites.**

- `mathlib:SSet.QCat.bicategory`
- `mathlib:CategoryTheory.Bicategory.mateEquiv`
- `mathlib:CategoryTheory.Bicategory.mateEquiv_vcomp`
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations
- [`E3/coherent-diagrams-of-ringed-topoi`](#n-e3-coherent-diagrams-of-ringed-topoi) — Coherent ringed-topos diagrams

**Sources.**

- [Enhanced six operations and base change theorem for higher Artin stacks](#src-e0-liuzheng-sixoperations), Proposition 2.2.4 and its proof, pp. 79–81. Contractible partial-adjoint choices assemble the higher coherences of the diagrammatic machine.

**Uses that shape the API.**

- DiamondSixOperations:S2: base-change transformations must compose coherently
- AdicCoefficientsAndComparisons:L0: the coefficient-system construction pastes these comparisons

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `coherentMate` | data | A coherent representative of the pinned mate, with its bicategorical class. | omitted |
| `beckChevalley` | characterisation | The representative is invertible exactly when its mate class is invertible. | omitted |
| `coherentMate_pasting` | compatibility | Evaluation of coherent pasting agrees with pinned mateEquiv_vcomp. | omitted |
| `coherentMate_ordinary` | compatibility | For ordinary category nerves the construction agrees with CategoryTheory.mateEquiv. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `mate_identity_square` | degenerate | For identity adjunctions the mate of α is α. | omitted |
| `mate_pasting_test` | compatibility | Vertical composition of two squares has mate equal to the composite of their two mates, with the prescribed whiskering. | omitted |
| `mate_not_automatic_equivalence` | non-example | For extension/restriction along ℤ→ℤ/p in the self-base-change square, the derived multiplication (ℤ/p)⊗ᴸ_ℤ(ℤ/p)→ℤ/p has nonzero degree −1 fibre; the base-change mate is not an equivalence. | omitted |

**Acceptance.**

- For identity adjunctions the mate of α is α.
- Vertical composition of two squares has mate equal to the composite of their two mates, with the prescribed whiskering.
- For extension/restriction along ℤ→ℤ/p in the self-base-change square, the derived multiplication (ℤ/p)⊗ᴸ_ℤ(ℤ/p)→ℤ/p has nonzero degree −1 fibre; the base-change mate is not an equivalence.

**Lean prototype:** omitted. The genuine presentability, coherent ringed diagram, Kan or variable-source cutoff condition needed for this statement is not yet expressed; the existing bicategorical adjunction/mates alone are insufficient.

**Open obligations:** gap [G0.10](#gap-g0-10) (Higher mate and coefficient reconstruction coherence); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e3-cofinality-to-a-fibre"></a>
#### Cofinality of the terminal fibre

`E3/cofinality-to-a-fibre` · theorem

If p:E→B is coCartesian and b is terminal in B, inclusion E_b→E is final. More generally E_b→E×_B B_{/b} is final. Therefore the colimit of a diagram on the latter total category can be computed on E_b, whenever either colimit exists.

**Hypotheses.**

- B is a quasicategory; the coCartesian total categories are therefore quasicategories as well.

**Proof.**

1. For x over u transport x along u→b. This gives an initial object of the comma category x/E_b up to contractible choice. Apply the quasicategorical Theorem A finality criterion. Replace B by B/b for the general version.

**Direct prerequisites.**

- [`E0/cocartesian-edges-and-fibrations`](#n-e0-cocartesian-edges-and-fibrations) — CoCartesian fibrations
- [`E0/slices-and-cones`](#n-e0-slices-and-cones) — Slices and cone categories
- [`E0/limits-colimits-universal-properties`](#n-e0-limits-colimits-universal-properties) — Enhanced limits and colimits

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Theorem 4.1.3.1 and Lemma 4.1.3.2, PDF pp. 254–256; §4.3.2, PDF pp. 297–303. The finality criterion applies because coCartesian transport makes each comma category contractible.

**Acceptance.**

- For an interval diagram C→D the terminal fibre D computes colimits over its Grothendieck total category.
- The initial fibre C is not in general final.

**Lean prototype:** omitted. The genuine presentability, coherent ringed diagram, Kan or variable-source cutoff condition needed for this statement is not yet expressed; the existing bicategorical adjunction/mates alone are insufficient.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e3-cocartesian-edge-preservation"></a>
#### The fibrewise edge-preservation criterion

`E3/cocartesian-edge-preservation` · theorem

For coCartesian fibrations E,E′ over B and a functor F:E→E′ over B, F preserves coCartesian edges if and only if for every a:b→c and x∈E_b the canonical comparison a′_!F_b(x)→F_c(a_!x) is an equivalence. Such a functor corresponds under straightening to a coherent natural transformation of the classified diagrams.

**Hypotheses.**

- B is a quasicategory; the coCartesian total categories are therefore quasicategories as well.

**Proof.**

1. Factor the image of a coCartesian lift through a chosen lift in E′. The image is coCartesian exactly when the remaining vertical edge is an equivalence. Independence of choices follows from contractibility of lift spaces; straightening retains the naturality coherences.

**Direct prerequisites.**

- [`E0/cocartesian-edges-and-fibrations`](#n-e0-cocartesian-edges-and-fibrations) — CoCartesian fibrations
- [`E0/cocartesian-fibrations-and-restricted-straightening`](#n-e0-cocartesian-fibrations-and-restricted-straightening) — Restricted straightening and sections
- [`E0/categorical-equivalences`](#n-e0-categorical-equivalences) — Categorical equivalences

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Proposition 2.4.4.3, PDF p. 149; §2.4.5 and Theorem 3.2.0.1, PDF pp. 150–155 and 187. Factor an edge through a chosen coCartesian lift and compare its vertical residual equivalence.

**Acceptance.**

- For a constant product fibration, an arbitrary fibre functor preserves transport edges exactly when its transport comparisons are equivalences.
- A fibrewise functor together with noninvertible transport comparisons does not pass the criterion.

**Lean prototype:** omitted. The genuine presentability, coherent ringed diagram, Kan or variable-source cutoff condition needed for this statement is not yet expressed; the existing bicategorical adjunction/mates alone are insufficient.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e3-point-free-ringed-system-comparison"></a>
#### Point-free coefficient-system comparison

`E3/point-free-ringed-system-comparison` · theorem

For a Grothendieck topos X presented by a fixed small site, in a larger ambient universe, and a sequence of sheaves of commutative rings R_n, the Cartesian full subcategory of the enhancement of R_•-module sheaves on Fun(ℕᵒᵖ,X) identifies, on mapping spaces as well as objects, with lim_n D∞(X,R_n) along derived scalar extension. This statement imposes no enough-points assumption; its localization proof is a separately recorded gap rather than an inference from the enough-points theorem.

**Proof.**

1. Use the point-free injective model for ringed diagram sheaves and localize the derived transition maps. Identify its homotopy-coherent Cartesian sections by mapping-space localization. Prove both fully faithful mapping-space comparison and essential surjectivity of systems; the constant-diagram theorem alone does not prove the variable-coefficient case.

**Direct prerequisites.**

- [`E3/coherent-diagrams-of-ringed-topoi`](#n-e3-coherent-diagrams-of-ringed-topoi) — Coherent ringed-topos diagrams
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/coefficient-change-and-perfect-action`](#n-e1-coefficient-change-and-perfect-action) — Coefficient change and the perfect action
- [`E0/cocartesian-fibrations-and-restricted-straightening`](#n-e0-cocartesian-fibrations-and-restricted-straightening) — Restricted straightening and sections

**Sources.**

- [Higher Algebra](#src-e0-lurie-ha), Proposition 1.3.4.25, printed/PDF p. 119. Combinatorial model localization compares coherent and strict diagram categories.
- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Definition 3.5.3 and Lemma 3.5.7, pp. 24–25. The ordinary ringed-system description motivates the enhanced variable-coefficient comparison.

**Acceptance.**

- For constant rings this is the constant diagram localization comparison.
- For the coefficient tower R/I^n all transition tensors are derived.
- An equivalence of triangulated homotopy categories is insufficient.

**Lean prototype:** omitted. The genuine presentability, coherent ringed diagram, Kan or variable-source cutoff condition needed for this statement is not yet expressed; the existing bicategorical adjunction/mates alone are insufficient.

**Open obligations:** gap [G0.4](#gap-g0-4) (Point-free enhanced ringed localization); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e3-accessible-localizations"></a>
#### Accessible localization and coreflection

`E3/accessible-localizations` · construction

Let C be presentable and S a small set of morphisms. An S-local object x is one for which Map(v,x)→Map(u,x) is an equivalence for every s:u→v in S. The full local subcategory C_S is presentable and its inclusion has an accessible left adjoint L_S. Separately, an accessible full presentable subcategory A⊂C closed under small colimits has a right adjoint G to its inclusion. These two adjoint directions are stated distinctly.

**Construction.**

1. Run the accessible localization construction for the set S, or the equivalent presentable solution-set argument. Identify local objects by mapping-space orthogonality and the idempotent unit. For coreflection apply the right-adjoint theorem to the inclusion and identify its fully faithful counit.

**Direct prerequisites.**

- [`E3/adjoint-functor-theorem-and-localisations`](#n-e3-adjoint-functor-theorem-and-localisations) — The enhanced adjoint functor theorem
- [`E0/mapping-space-kan-and-equivalences`](#n-e0-mapping-space-kan-and-equivalences) — Right mapping spaces are spaces
- [`E0/accessible-and-presentable`](#n-e0-accessible-and-presentable) — Accessible and presentable quasicategories

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Proposition 5.5.4.15, PDF pp. 500–501; Corollary 5.5.2.9, PDF p. 484. Localization at a small set is reflective; the colimit-preserving inclusion criterion gives coreflection.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E4/the-imported-completion-interface: completion is reflective; its inclusion need not preserve colimits
- DiamondEtaleCohomology:C2: the étale inclusion must supply its actual accessibility and colimit-closure hypotheses

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `IsLocalObject` | characterisation | Mapping-space orthogonality to S. | included |
| `accessibleLocalization` | constructor | The reflector L_S with its unit. | included |
| `localization_mapEquiv` | universal-property | For local x, Map(L_Sc,x)≃Map(c,x). | included |
| `presentableCoreflector` | constructor | The right adjoint G under accessibility and colimit closure. | partial |
| `localization_idempotent` | structure | L_SL_S≃L_S; for the coreflector G i≃id_A. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `localization_empty` | degenerate | For S=∅, C_S=C and L_S is identity. | included |
| `localization_zero` | computation | In a stable C, localizing at all generator maps g→0 gives the zero category when the generators detect zero objects. | included |
| `coreflection_direction` | compatibility | For a colimit-closed presentable A, Map_C(i a,c)≃Map_A(a,Gc); exchanging the two Hom variables gives the wrong direction. | partial |

**Acceptance.**

- For S=∅, C_S=C and L_S is identity.
- In a stable C, localizing at all generator maps g→0 gives the zero category when the generators detect zero objects.
- For a colimit-closed presentable A, Map_C(i a,c)≃Map_A(a,Gc); exchanging the two Hom variables gives the wrong direction.

**Lean prototype:** partial (`IsLocalObject`, `localCategory`, `accessibleLocalization`, `localization_mappingComparison`, `localization_mapEquiv`, `localization_presentable`, `presentableCoreflector`, `localization_idempotent_equiv`). Mapping-space orthogonality, reflector comparison, presentability and idempotence are typed. Naturality and the coreflector’s full-colimit subcategory laws remain unstated.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e3-presentable-category-limits"></a>
#### Limits of presentable categories

`E3/presentable-category-limits` · theorem · planet: **Limits of presentable categories**

A homotopy pullback of presentable categories along left-adjoint functors is presentable, its projection functors are left adjoints, and its colimits are evaluated componentwise. More generally Prᴸ admits all small limits, and the forgetful functor Prᴸ→Cat∞ preserves them. Thus a coherent inverse limit of D∞(X,R/I^n) along scalar-change left adjoints is presentable.

**Proof.**

1. For a pullback, lift objects together with an equivalence of their images; use a sufficiently large common accessibility cardinal to prove accessibility, and compute colimits componentwise. Products and homotopy pullbacks give all small limits. The coCartesian-sections comparison identifies the underlying coherent category.

**Direct prerequisites.**

- [`E0/accessible-and-presentable`](#n-e0-accessible-and-presentable) — Accessible and presentable quasicategories
- [`E0/cocartesian-fibrations-and-restricted-straightening`](#n-e0-cocartesian-fibrations-and-restricted-straightening) — Restricted straightening and sections
- [`E3/adjoint-functor-theorem-and-localisations`](#n-e3-adjoint-functor-theorem-and-localisations) — The enhanced adjoint functor theorem

**Sources.**

- [Higher Topos Theory](#src-e0-lurie-htt), Propositions 5.5.3.12–13 and Corollary 5.5.3.14, PDF pp. 487–488. The pullback theorem and arbitrary-limit theorem are needed together, with componentwise colimits.

**Acceptance.**

- The product of a small family of presentable categories is presentable.
- A limit of ordinary homotopy categories does not supply this result.
- Inclusion of the completed sheaf category into the ambient category can fail colimit preservation although the category itself is presentable.

**Lean prototype:** partial (`presentable_hasLimits`). Only existence of small limits in a presentable category is typed; coherent PrL pullbacks/category limits and projection left adjoints are omitted.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e3-exact-coproducts-colimits"></a>
#### Exactness and coproduct preservation

`E3/exact-coproducts-colimits` · theorem

An exact functor between stable quasicategories admitting small coproducts preserves all small colimits if and only if it preserves small coproducts. These stable categories admit all small colimits.

**Proof.**

1. Express sequential colimits by the cofiber of 1−shift on a coproduct. Express a general colimit as the geometric realization of its simplicial replacement, and each realization as the sequential colimit of finite skeleta. Exactness handles finite skeleta and cofibres; coproduct preservation handles the remaining sums.

**Direct prerequisites.**

- [`E0/stable-categories`](#n-e0-stable-categories) — Stable quasicategories
- [`E0/limits-colimits-universal-properties`](#n-e0-limits-colimits-universal-properties) — Enhanced limits and colimits
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations

**Sources.**

- [Higher Algebra](#src-e0-lurie-ha), Proposition 1.4.4.1(1)–(2) and proof, p. 154. Finite exactness together with coproduct preservation controls arbitrary colimits in stable categories.

**Acceptance.**

- Derived scalar extension is exact and coproduct-preserving, hence colimit-preserving.
- An exact right adjoint need not preserve coproducts.

**Lean prototype:** omitted. The genuine presentability, coherent ringed diagram, Kan or variable-source cutoff condition needed for this statement is not yet expressed; the existing bicategorical adjunction/mates alone are insufficient.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e3-right-adjoint-coproducts"></a>
#### The compact-generation adjoint criterion

`E3/right-adjoint-coproducts` · theorem · planet: **Compactness and adjoints**

Let F:C⇄D:G be an adjunction of stable categories, with C compactly generated by a small set of compact objects and both categories admitting coproducts. If F sends the compact generators to compact objects, G preserves coproducts. Conversely, if G preserves coproducts, F sends every compact object to a compact object.

**Hypotheses.**

- Compact generators detect equivalences by mapping from all their integer shifts. The left adjoint is exact, so their shifted images are compact as well.

**Proof.**

1. For every integer shift of each compact generator c compare Map_C(c,⊕Gy_i) with Map_D(Fc,⊕y_i) using adjunction and compactness. The comparison is an equivalence on mapping spaces, so generator detection proves ⊕Gy_i→G(⊕y_i) is an equivalence. For the converse use the same adjunction for any compact c and arbitrary coproducts.

**Direct prerequisites.**

- [`E0/accessible-and-presentable`](#n-e0-accessible-and-presentable) — Accessible and presentable quasicategories
- [`E0/stable-categories`](#n-e0-stable-categories) — Stable quasicategories
- [`E3/exact-coproducts-colimits`](#n-e3-exact-coproducts-colimits) — Exactness and coproduct preservation
- [`E3/adjoint-functor-theorem-and-localisations`](#n-e3-adjoint-functor-theorem-and-localisations) — The enhanced adjoint functor theorem

**Sources.**

- [Higher Algebra](#src-e0-lurie-ha), Proposition 1.4.4.1(3) and proof, p. 154; compact-generator detection in §1.4.4, pp. 155–156. Mapping out of compact generators detects the coproduct comparison; this is the stable enhanced form of the Neeman criterion.
- [Étale cohomology of diamonds](#src-e0-scholze-etalediamonds), Proposition 23.7 and its use, pp. 144–146. The geometric application uses preservation of compact objects to control a right adjoint.

**Acceptance.**

- For finite free R→S scalar extension, the restriction right adjoint preserves coproducts.
- Compact generation of C is the detecting hypothesis; presentability alone does not replace it.

**Lean prototype:** omitted. The genuine presentability, coherent ringed diagram, Kan or variable-source cutoff condition needed for this statement is not yet expressed; the existing bicategorical adjunction/mates alone are insufficient.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e3-cutoff-adjoint-compatibility"></a>
#### Adjoints at cardinal cutoffs

`E3/cutoff-adjoint-compatibility` · theorem

Suppose a filtered system of presentable categories D_κ has fully faithful transition functors, a fixed presentable C, and compatible colimit-preserving functors i_κ:C→D_κ. Let G_κ be the constructed right adjoints. Then G_λ restricted along D_κ→D_λ is naturally equivalent to G_κ, with all three-cutoff coherences. They assemble on the category of objects belonging to some adequate cutoff. If the source also varies as C_κ, additionally require that G_λ sends D_κ into the essential image of C_κ; compatibility is not automatic without this condition.

**Proof.**

1. For y∈D_κ, adjunction and full faithfulness show that G_κy and G_λy represent the same functor on C. Yoneda produces the comparison, and its contractible uniqueness gives identity, composition and triple-cutoff coherence. Check the image condition separately when both source and target vary.

**Direct prerequisites.**

- [`E3/adjoint-functor-theorem-and-localisations`](#n-e3-adjoint-functor-theorem-and-localisations) — The enhanced adjoint functor theorem
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations
- [`E3/coherent-diagrams-of-ringed-topoi`](#n-e3-coherent-diagrams-of-ringed-topoi) — Coherent ringed-topos diagrams

**Sources.**

- [Étale cohomology of diamonds](#src-e0-scholze-etalediamonds), Lemma 17.1 and Corollary 17.2, pp. 96–97. The étale subcategory is fixed while the ambient v-site cutoff grows; uniqueness then gives compatible right adjoints.

**Acceptance.**

- The fixed-source étale coreflection setup has compatible right adjoints.
- A larger ambient site does not by itself prove that a varying-source right adjoint has a small value.

**Lean prototype:** omitted. The genuine presentability, coherent ringed diagram, Kan or variable-source cutoff condition needed for this statement is not yet expressed; the existing bicategorical adjunction/mates alone are insufficient.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).


<a id="layer-e4"></a>

## E4 — Derived completion of sheaves and coefficient reconstruction

A complex of sheaves is derived complete for an ideal I when, on every slice
and for every local section x of I, the tower with every transition
multiplication by x has zero derived limit; local generators suffice, and
every integer shift of a localization generator is tested. The completion
reflector is a finite sequence of cofibres of such towers when I is globally
finitely generated, glued by hypercover descent otherwise; on the point topos
these declarations are the generic algebraic completion that
DerivedDeRhamCohomology imports. For any finite ideal and any unbounded
complex, completion is the derived limit of tensors with the Koszul complexes
of the powers f_i^n, with no Noetherian or regularity hypothesis. For a
finite regular sequence these Koszul complexes resolve the quotients by
cofinal ideals, gr_I A is polynomial over A/I, every A/I^n is perfect with
Tor amplitude in [−r,0], and completion is the derived limit of the ordinary
reductions.

Complete module sheaves are closed under kernels, cokernels and extensions,
not under arbitrary sub-objects and quotients; a complex is complete exactly
when all its cohomology sheaves are; classical completeness is derived
completeness plus separatedness. Internal Hom into a complete object is
complete, completed tensor is completion of the derived tensor, and limits of
complete objects are complete while colimits are ambient colimits followed by
the reflector.

For a commutative ring R and I generated by a finite regular sequence
(including I = 0), compatible systems are the enhanced limit of the D(X,R/I^n)
along derived scalar extension, with all coherences of the transition
equivalences. Reduction sends K to (K⊗ᴸR/I^n)_n; reconstruction forgets the
coefficients and takes the coherent derived limit. Uniform pro-Tor control for
regular sequences gives the counit and the completion unit for unbounded
complexes, and on a replete topos Red and Rec are inverse equivalences, with no
Noetherian or boundedness hypothesis. The completed coefficient object is the
inverse limit of the constant quotient sheaves, which need not be the constant
sheaf of a complete ring. Exact R-linear functors commute with tensoring by
perfect complexes, and reduction modulo I detects equivalences of complete
objects. The étale subcategory belongs to `AdicCoefficientsAndComparisons:L0`.

<a id="n-e4-derived-complete-sheaves"></a>
#### Derived complete sheaves

`E4/derived-complete-sheaves` · definition · planet: **Derived complete sheaves**

Dcomp(X,R,I) is the full enhanced subcategory of D(X,R) consisting of K such that, for every U∈X and every x∈I(U), the homotopy inverse limit T(K|U,x) of the tower with every term K|U and every transition multiplication by x is zero. This applies E4’s completeness condition on every slice; its point-topos specialization also owns the generic completeness definition needed by higher-tier roadmaps.

**Hypotheses.**

- X is a replete Grothendieck topos; size universes are fixed.
- R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified.
- D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

**Construction.**

1. Define local scalar-telescope vanishing using E2 coherent limits. On the point topos this is generic derived ideal completeness; the E1/E4 theory owns this prerequisite for later roadmaps.
2. Take the full subcategory on the objects satisfying all slice tests; fullness retains the mapping spaces of D(X,R).
3. The constant-ring localized-generator prototype tests Map(R[U][1/f][n],K) for every integer n. Testing the unshifted generator alone sees only nonpositive degrees of RHom and does not express completion.

**Direct prerequisites.**

- [`E2/replete-topoi`](#n-e2-replete-topoi) — Replete topoi
- [`E2/replete-slice`](#n-e2-replete-slice) — Slices of replete topoi
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Definition 3.4.1 and the paragraph following it, p. 21. The definition quantifies over all slices and all local sections of the ideal.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E4/the-imported-completion-interface: Target of the sheaf completion reflector.
- EnhancedDerivedSheaves:E4/coefficient-system-reconstruction: Domain of coefficient reconstruction.
- AdicCoefficientsAndComparisons:L0: Adds the étale condition after reduction; that condition is owned by L0.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `DerivedCompleteSheaves` | constructor | The full enhanced subcategory with its fully faithful inclusion. | partial |
| `derivedCompleteSheaf_iff` | characterisation | Membership is the vanishing of every local scalar telescope. | omitted |
| `derivedCompleteSheaf_restrict` | functoriality | Restriction to a slice preserves membership, coherently under successive restriction. | omitted |
| `derivedCompleteSheaf_zero` | simp | The zero complex belongs to Dcomp. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `derivedCompleteSheaf_zeroIdeal` | degenerate | For I=0 every complex is complete: a tower with zero transition maps has zero homotopy limit. | included |
| `derivedCompleteSheaf_sets` | compatibility | For X=Set the condition agrees with E4’s derived I-completeness for R-modules. | omitted |
| `derivedCompleteSheaf_inverted` | non-example | For X=Set, R=ℤ and I=(p), the nonzero complex ℤ[1/p] is not derived complete: its p-telescope is equivalent to itself. | omitted |
| `derivedCompleteSheaf_shift_detection` | non-example | On the point site with R=ℤ and I=(p), the nonzero localized module ℤ[1/p][−1] is not complete, even though Map(ℤ[1/p][0],ℤ[1/p][−1]) is contractible. The shifted orthogonality tests detect it. | included |

**Acceptance.**

- Verify the stated hypotheses and the indicated canonical map.

**Lean prototype:** partial (`IsDerivedCompleteSheaf`, `DerivedCompleteSheaves`, `DerivedCompleteSheaves_vertices`). Constant-ring localized-generator orthogonality quantifies every integer shift. General coefficient sheaves and comparison with slice telescope vanishing remain omitted.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-local-generator-criterion"></a>
#### Local generator criterion

`E4/local-generator-criterion` · lemma

For a cover {U_a→1} on which I has finite generators f_a,1,…,f_a,r(a), K is derived I-complete if and only if T(K|U_a,f_a,j)=0 for every a,j. Thus a different finite generating family gives the same full subcategory.

**Hypotheses.**

- X is a replete Grothendieck topos; size universes are fixed.
- R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified.
- D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

**Proof.**

1. Vanishing for all slices implies the displayed finite tests.
2. For the converse use E4’s localization orthogonality and localization Mayer–Vietoris argument on each slice: vanishing is stable under scalar multiples and finite sums of generators.
3. Restriction commutes with the relevant homotopy limits, and equivalences are local on a cover. The sheaf localization/Mayer–Vietoris bridge is an explicit unresolved input.

**Direct prerequisites.**

- [`E4/derived-complete-sheaves`](#n-e4-derived-complete-sheaves) — Derived complete sheaves
- [`E2/replete-slice`](#n-e2-replete-slice) — Slices of replete topoi
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Lemmas 3.4.6–8, pp. 21–22; Lemma 3.4.12, pp. 22–23. Reads the proof of the finite-generator test, including its localization inputs.

**Acceptance.**

- For I=0 an empty generating family imposes no condition.
- A test only on global sections is not substituted for the slice condition.

**Lean prototype:** omitted. The variable coefficient-sheaf telescope, regular-ideal pro-Tor and coherent coefficient-limit interfaces are not yet expressed; the constant-ring orthogonality prefix does not supply them.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-complete-sheaves-limits"></a>
#### Limits of complete sheaves

`E4/complete-sheaves-limits` · lemma

The inclusion Dcomp(X,R,I)→D(X,R) creates small limits and is exact: limits of complete objects, zero objects, shifts and finite cofibres are complete.

**Hypotheses.**

- X is a replete Grothendieck topos; size universes are fixed.
- R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified.
- D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

**Proof.**

1. On every slice, restriction and T(−,x) commute with limits, so a limit of zero telescope objects is zero.
2. The telescope functor is exact in the stable category, so its kernel is closed under shifts and finite cofibres.

**Direct prerequisites.**

- [`E4/derived-complete-sheaves`](#n-e4-derived-complete-sheaves) — Derived complete sheaves
- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula
- [`E2/tower-milnor`](#n-e2-tower-milnor) — Milnor exact sequence
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Paragraph after Definition 3.4.1, p. 21; proof of Lemma 3.4.13, p. 23. The source states locality, triangulated closure and homotopy-limit closure; enhanced exactness uses E1.

**Acceptance.**

- An arbitrary coproduct in D(X,R) need not be complete.
- Nilpotently I-annihilated objects and limits of such objects are complete.

**Lean prototype:** omitted. The variable coefficient-sheaf telescope, regular-ideal pro-Tor and coherent coefficient-limit interfaces are not yet expressed; the constant-ring orthogonality prefix does not supply them.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-the-imported-completion-interface"></a>
#### Sheaf completion reflector

`E4/the-imported-completion-interface` · construction · planet: **Sheaf completion**

Construct the generic and sheaf completion as a functor L_I:D(X,R)→Dcomp(X,R,I), left adjoint to the full inclusion. It commutes with slice restriction. If I=(f₁,…,fᵣ) globally, put F₀(K)=K and F_j(K)=cofib(T(F_{j−1}(K),f_j)→F_{j−1}(K)); then L_I K=Fᵣ(K). For a locally generated ideal these local reflectors glue by hypercover descent. The adjunction makes the result independent of the choices.

**Hypotheses.**

- X is a replete Grothendieck topos; size universes are fixed.
- R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified.
- D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

**Construction.**

1. Construct the one-generator reflector by the cofiber of its scalar telescope and prove the mapping-space adjunction by localization orthogonality. This includes the point-topos algebraic reflector; it is not imported from a higher-tier roadmap.
2. Apply the one-generator functors successively. Orthogonality proves that each step preserves completeness for earlier generators and has the required universal map into objects complete for the enlarged ideal.
3. Use restriction compatibility and the E2/E3 coherent hypercover descent equivalence to glue the locally defined functors and units.
4. Check the mapping-space adjunction locally and descend it. Fullness gives idempotence. The enhanced descent of the adjunction, beyond the source’s triangulated formulation, is recorded as a gap.

**Direct prerequisites.**

- [`E4/derived-complete-sheaves`](#n-e4-derived-complete-sheaves) — Derived complete sheaves
- [`E4/local-generator-criterion`](#n-e4-local-generator-criterion) — Local generator criterion
- [`E4/complete-sheaves-limits`](#n-e4-complete-sheaves-limits) — Limits of complete sheaves
- [`E3/point-free-ringed-system-comparison`](#n-e3-point-free-ringed-system-comparison) — Point-free coefficient-system comparison
- [`E3/presentable-category-limits`](#n-e3-presentable-category-limits) — Limits of presentable categories
- [`E2/unbounded-hypercover-descent`](#n-e2-unbounded-hypercover-descent) — Unbounded hypercover descent
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Lemma 3.4.9, pp. 21–22. Explicit successive-cofibre construction and its local-to-global proof are read in full.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E4/completed-sheaf-tensor: Complete the ambient derived tensor product.
- EnhancedDerivedSheaves:E4/completed-colimits: Complete ambient colimits.
- EnhancedDerivedSheaves:E4/reconstruction-unit: Recognize the inverse-limit unit.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `completeSheaf` | constructor | The reflector L_I and its unit η_K:K→L_I K. | omitted |
| `completeSheaf_map` | functoriality | Completion sends maps to maps, preserving identity and composition coherently. | omitted |
| `completeSheaf_mapEquiv` | universal-property | For complete L, Map(L_I K,L)≃Map(K,L), induced by η_K. | omitted |
| `completeSheaf_restrict` | compatibility | Restricting L_I K to X/U agrees with completing K\|U for I\|U. | omitted |
| `completeSheaf_idempotent` | simp | The unit L_I K→L_I L_I K is an equivalence. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `completeSheaf_zeroIdeal` | degenerate | For I=0 the reflector and its unit are the identity. | omitted |
| `completeSheaf_inverted` | computation | For X=Set, completion of ℤ[1/p] along (p) is zero. | omitted |
| `completeSheaf_integer` | computation | For X=Set the derived (p)-completion of ℤ[0] is ℤ_p[0]. | omitted |
| `completeSheaf_alreadyComplete` | characterisation | For any complete K the unit K→L_I K is an equivalence. | omitted |

**Acceptance.**

- Verify the stated hypotheses and the indicated canonical map.

**Lean prototype:** omitted. The variable coefficient-sheaf telescope, regular-ideal pro-Tor and coherent coefficient-limit interfaces are not yet expressed; the constant-ring orthogonality prefix does not supply them.

**Open obligations:** gap [G0.9](#gap-g0-9) (Completion algebra and its formal comparisons); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-complete-module-weak-serre"></a>
#### Kernels and cokernels of complete modules

`E4/complete-module-weak-serre` · lemma

The derived I-complete R-module sheaves, viewed in degree zero, contain zero and are closed under extensions, and under kernels and cokernels of morphisms between such modules. This is weak Serre closure. It does not assert closure under all subobjects or all quotients in Mod_R(X).

**Hypotheses.**

- X is a replete Grothendieck topos; size universes are fixed.
- R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified.
- D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

**Proof.**

1. For f:M→N between complete modules, apply T to the triangle ker(f)[1]→[M→N]→coker(f). The middle telescope is zero.
2. Repleteness gives cohomological amplitude [0,1] for Rlim on degree-zero towers. The left and right terms lie on opposite sides of the t-structure; their shifted identification forces both to vanish.
3. Repeat on every slice. Exactness of T gives extension closure.

**Direct prerequisites.**

- [`E4/derived-complete-sheaves`](#n-e4-derived-complete-sheaves) — Derived complete sheaves
- [`E4/complete-sheaves-limits`](#n-e4-complete-sheaves-limits) — Limits of complete sheaves
- [`E2/inverse-limit-amplitude`](#n-e2-inverse-limit-amplitude) — Cohomological amplitude of sequential limits
- [`E2/replete-slice`](#n-e2-replete-slice) — Slices of replete topoi
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Lemma 3.4.14 and its proof, p. 23. The proof establishes the explicit closure properties stated here; the printed term “Serre” is not interpreted as Mathlib’s stronger class.

**Acceptance.**

- For X=Set, R=ℤ, I=(2), ℤ₂ is derived complete but its submodule ℤ is not; do not construct an IsSerreClass instance.
- The statement concerns kernels and cokernels of maps whose two endpoints are complete.

**Lean prototype:** omitted. The variable coefficient-sheaf telescope, regular-ideal pro-Tor and coherent coefficient-limit interfaces are not yet expressed; the constant-ring orthogonality prefix does not supply them.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-complete-cohomology-criterion"></a>
#### Completeness of cohomology sheaves

`E4/complete-cohomology-criterion` · theorem

A complex K∈D(X,R) is derived I-complete if and only if every H^m(K), m∈ℤ, is a derived I-complete module sheaf.

**Hypotheses.**

- X is a replete Grothendieck topos; size universes are fixed.
- R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified.
- D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

**Proof.**

1. If the cohomology modules are complete, finite truncations are complete by extensions. E2 left completeness identifies each bounded-above truncation with the limit of its finite truncations.
2. Applying T to the upper-truncation triangles then makes T(K,x) arbitrarily connective, hence zero by nondegeneracy.
3. Conversely use the Rlim amplitude bound in the truncation triangles to prove completeness of the relevant truncations and their degree-zero cohomology. Shift and repeat on all slices.

**Direct prerequisites.**

- [`E4/derived-complete-sheaves`](#n-e4-derived-complete-sheaves) — Derived complete sheaves
- [`E4/complete-sheaves-limits`](#n-e4-complete-sheaves-limits) — Limits of complete sheaves
- [`E4/complete-module-weak-serre`](#n-e4-complete-module-weak-serre) — Kernels and cokernels of complete modules
- [`E2/left-completion`](#n-e2-left-completion) — Left completeness for replete topoi
- [`E2/inverse-limit-amplitude`](#n-e2-inverse-limit-amplitude) — Cohomological amplitude of sequential limits
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.4.4, p. 21; full proof on p. 23. Uses unbounded truncations and repleteness, not a bounded-complex restriction.

**Acceptance.**

- All integer cohomological degrees are quantified.
- Completeness is stable under good truncation and shift.

**Lean prototype:** omitted. The variable coefficient-sheaf telescope, regular-ideal pro-Tor and coherent coefficient-limit interfaces are not yet expressed; the constant-ring orthogonality prefix does not supply them.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-koszul-completion-tower"></a>
#### Koszul power model for completion

`E4/koszul-completion-tower` · theorem

For a finite ideal I=(f₁,…,fᵣ) in a commutative ring A and any unbounded K∈D∞(A), the E4 completion reflector has the natural model L_I K≃Rlim_n(K⊗ᴸ_A K_A(f₁^n,…,fᵣ^n)), n≥1. The transition from m to n (m≥n) is identity in degree zero and sends the i-th exterior generator to f_i^(m−n)e_i. No Noetherian or regular-sequence hypothesis is imposed; these are Koszul reductions, not ordinary quotient rings.

**Hypotheses.**

- Use the enhanced coherent inverse limit, the E1 signed tensor and E4 reflector specialized to the point topos.
- The same finite construction over a ringed slice is compatible with restriction; its enhanced comparison uses the recorded point-free localization interface.

**Proof.**

1. The transition formula follows from Koszul functoriality and preserves augmentations. Each f_i^n acts null-homotopically, so every tensor term and its limit are complete.
2. Filter each Koszul complex by degree. For a complete K the inverse limit of every negative graded piece is a finite sum of scalar telescopes for products of the generators; radical-ideal closure makes these vanish. The unit is therefore an equivalence on complete objects.
3. Compare the inverse-limit functor with the reflector using the dual finite-free Koszul model of the extended Čech localization complex. Tensor–Hom adjunction gives the natural mapping-space universal property and hence identifies the reflector.

**Direct prerequisites.**

- [`E1/koszul-complex`](#n-e1-koszul-complex) — Koszul complexes
- [`E4/derived-complete-sheaves`](#n-e4-derived-complete-sheaves) — Derived complete sheaves
- [`E4/local-generator-criterion`](#n-e4-local-generator-criterion) — Local generator criterion
- [`E4/the-imported-completion-interface`](#n-e4-the-imported-completion-interface) — Sheaf completion reflector
- [`E1/derived-internal-hom`](#n-e1-derived-internal-hom) — Derived internal Hom
- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula
- [`E2/tower-milnor`](#n-e2-tower-milnor) — Milnor exact sequence

**Sources.**

- [The Stacks Project, More on Algebra](#src-e0-stacks-morealgebra), Situation 93.15 and Lemmas 93.16–93.18, pp. 266–267 (tags 0BKC, 091Y, 091Z, 0920); extended Čech comparison, Lemma 30.6, pp. 74–75 (0913). The correct inverse transition direction and finite duality identify the Koszul tower with the reflector for arbitrary complexes.

**Acceptance.**

- The empty ideal tower is constant K and has completion K.
- For I=(p) and K=Z[0], the ordinary quotient comparison applies; for arbitrary ideals only the Koszul model is asserted.

**Lean prototype:** omitted. The exact mathematical tower/algebra statement and proof route are planned; its enhanced natural equivalence is not yet typed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-classical-completion-comparison"></a>
#### Classical and derived completeness

`E4/classical-completion-comparison` · comparison

For an R-module sheaf M, the canonical map M→lim_n M/I^nM is an isomorphism if and only if M[0] is derived I-complete and M is I-adically separated, meaning that the intersection of the subsheaves I^nM is zero.

**Hypotheses.**

- X is a replete Grothendieck topos; size universes are fixed.
- R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified.
- D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

**Proof.**

1. Classical completeness expresses M as the ordinary limit of its epimorphic quotient tower. Repleteness identifies this with the derived limit, and nilpotent quotients are complete.
2. Conversely use E4’s derived Koszul-tower formula locally, apply the E2 Milnor exact sequence in degree zero and identify H⁰ of each Koszul reduction.
3. The resulting map to the classical completion is surjective. Separatedness makes it injective. Descend the isomorphism.

**Direct prerequisites.**

- [`E4/derived-complete-sheaves`](#n-e4-derived-complete-sheaves) — Derived complete sheaves
- [`E4/complete-sheaves-limits`](#n-e4-complete-sheaves-limits) — Limits of complete sheaves
- [`E4/local-generator-criterion`](#n-e4-local-generator-criterion) — Local generator criterion
- [`E2/surjective-system-derived-limit`](#n-e2-surjective-system-derived-limit) — Derived limit of an epimorphic system
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- [`E4/koszul-completion-tower`](#n-e4-koszul-completion-tower) — Koszul power model for completion

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.4.2 and Remark 3.4.3, p. 21; Lemma 3.4.13, p. 23; proof of 3.4.2, p. 24. The separatedness hypothesis is essential and is not silently removed.

**Acceptance.**

- For X=Set, the left side is the condition represented by pinned IsAdicComplete; the carrier AdicCompletion is classical.
- Do not identify all degree-zero derived complete modules with classically complete modules.

**Lean prototype:** omitted. The variable coefficient-sheaf telescope, regular-ideal pro-Tor and coherent coefficient-limit interfaces are not yet expressed; the constant-ring orthogonality prefix does not supply them.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-complete-internal-hom"></a>
#### Complete internal Hom

`E4/complete-internal-hom` · lemma

For K∈D(X,R) arbitrary and L∈Dcomp(X,R,I), the internal derived Hom RHom_R(K,L) is derived I-complete.

**Hypotheses.**

- X is a replete Grothendieck topos; size universes are fixed.
- R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified.
- D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

**Proof.**

1. For every local x, commute the homotopy limit defining T through internal Hom in its second variable: T(RHom(K,L),x)≃RHom(K,T(L,x)).
2. Apply the same identity on every slice, using the internal-Hom restriction comparison and completeness of L.

**Direct prerequisites.**

- [`E4/derived-complete-sheaves`](#n-e4-derived-complete-sheaves) — Derived complete sheaves
- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula
- [`E2/tower-milnor`](#n-e2-tower-milnor) — Milnor exact sequence
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- [`E1/derived-internal-hom`](#n-e1-derived-internal-hom) — Derived internal Hom

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Lemma 3.4.11, p. 22. Only the target L is assumed complete; internal Hom is not replaced by global Hom.

**Acceptance.**

- Taking K=R recovers completeness of L.
- The proof does not assert tensor products of complete objects are automatically complete.

**Lean prototype:** omitted. The variable coefficient-sheaf telescope, regular-ideal pro-Tor and coherent coefficient-limit interfaces are not yet expressed; the constant-ring orthogonality prefix does not supply them.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-completed-sheaf-tensor"></a>
#### Completed sheaf tensor product

`E4/completed-sheaf-tensor` · construction · planet: **Completed tensor product**

For K,L∈Dcomp(X,R,I), define K⊗̂_R L=L_I(K⊗ᴸ_R L). This also defines generic completed tensor on the point topos, using the E1 derived sheaf tensor and the sheaf reflector.

**Hypotheses.**

- X is a replete Grothendieck topos; size universes are fixed.
- R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified.
- D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

**Construction.**

1. Apply the ambient derived tensor bifunctor and then the reflector.
2. Transport functoriality along these two functors. Symmetric monoidal coherence and the unit L_I R require the monoidal-localization input recorded below, not merely the object formula.

**Direct prerequisites.**

- [`E4/the-imported-completion-interface`](#n-e4-the-imported-completion-interface) — Sheaf completion reflector
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- [`E1/coefficient-change-and-perfect-action`](#n-e1-coefficient-change-and-perfect-action) — Coefficient change and the perfect action

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Definition 3.4.10, p. 22. The definition completes the derived tensor; ordinary tensor would give the wrong torsion test.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E4/completed-tensor-hom-adjunction: Closed tensor/Hom adjunction.
- AdicCoefficientsAndComparisons:L0: Uses this tensor on its étale full subcategory after verifying closure.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `completedSheafTensor` | constructor | The bifunctor (K,L)↦L_I(K⊗ᴸ_R L). | omitted |
| `completedSheafTensor_map` | functoriality | Pairs of maps induce maps of completed tensors, with identity and composition laws. | omitted |
| `completedSheafTensor_comparison` | data | The unit of completion gives K⊗ᴸ_R L→K⊗̂_R L. | omitted |
| `completedSheafTensor_unit` | structure | After proving the monoidal-localization comparison, L_I R is the tensor unit. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `completedSheafTensor_zero` | degenerate | Tensoring either variable with zero gives zero. | omitted |
| `completedSheafTensor_zeroIdeal` | compatibility | For I=0 it is the ambient derived tensor. | omitted |
| `completedSheafTensor_torsion` | computation | For X=Set, R=ℤ_p, I=(p), the tensor of two copies of ℤ/p[0] has H⁰=ℤ/p and H^(−1)=ℤ/p and no other cohomology; completion leaves it unchanged. | omitted |

**Acceptance.**

- Verify the stated hypotheses and the indicated canonical map.

**Lean prototype:** omitted. The variable coefficient-sheaf telescope, regular-ideal pro-Tor and coherent coefficient-limit interfaces are not yet expressed; the constant-ring orthogonality prefix does not supply them.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-completed-tensor-hom-adjunction"></a>
#### Completed tensor and Hom adjunction

`E4/completed-tensor-hom-adjunction` · lemma

For K,K′,L∈Dcomp(X,R,I), the ambient tensor/Hom adjunction and the completion unit give Map(K′⊗̂_R K,L)≃Map(K′,RHom_R(K,L)), where the internal Hom belongs to Dcomp.

**Hypotheses.**

- X is a replete Grothendieck topos; size universes are fixed.
- R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified.
- D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

**Proof.**

1. Apply the completion adjunction to the complete target L.
2. Apply E1’s mapping-space tensor/Hom adjunction and the full-subcategory inclusion.
3. Use complete-internal-hom to identify its target with an object of Dcomp.

**Direct prerequisites.**

- [`E4/completed-sheaf-tensor`](#n-e4-completed-sheaf-tensor) — Completed sheaf tensor product
- [`E4/complete-internal-hom`](#n-e4-complete-internal-hom) — Complete internal Hom
- [`E4/the-imported-completion-interface`](#n-e4-the-imported-completion-interface) — Sheaf completion reflector
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- [`E1/derived-internal-hom`](#n-e1-derived-internal-hom) — Derived internal Hom

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Lemma 3.4.11, p. 22. The source’s Hom adjunction lifts via the E1 enhanced adjunction; the lift is a prerequisite, not an automatic consequence of homotopy categories.

**Acceptance.**

- The equivalence is natural in all three variables.
- The internal-Hom argument does not require compactness of K.

**Lean prototype:** omitted. The variable coefficient-sheaf telescope, regular-ideal pro-Tor and coherent coefficient-limit interfaces are not yet expressed; the constant-ring orthogonality prefix does not supply them.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-compatible-coefficient-systems"></a>
#### Compatible coefficient systems

`E4/compatible-coefficient-systems` · definition · planet: **Compatible coefficient systems**

Define Sys_I(X,R) as the limit of the enhanced categories D(X,R_n), with transition functors −⊗ᴸ_{R_{n+1}}R_n. Equivalently, use the full category of coCartesian sections of their classifying fibration over the positive inverse integers. An object consists of K_n∈D(X,R_n), equivalences K_{n+1}⊗ᴸ_{R_{n+1}}R_n≃K_n and all composition coherences. An ordinary inverse limit of homotopy categories is not this category.

**Hypotheses.**

- X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X.
- I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed.
- Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.
- The pinned regular-sequence predicate includes nontriviality of the final quotient. The empty sequence handles I=0 on a nonzero ring; the zero ring is a separate trivial case. Noetherianity is not substituted for regularity.

**Construction.**

1. Use E1’s coherent derived coefficient-change functors.
2. Apply the E3 enhanced category-limit/coCartesian-section construction. Its comparison with the Cartesian objects in the derived category of the ringed diagram topos is an explicit unresolved input.

**Direct prerequisites.**

- [`E3/point-free-ringed-system-comparison`](#n-e3-point-free-ringed-system-comparison) — Point-free coefficient-system comparison
- [`E3/presentable-category-limits`](#n-e3-presentable-category-limits) — Limits of presentable categories
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- [`E0/cocartesian-edges-and-fibrations`](#n-e0-cocartesian-edges-and-fibrations) — CoCartesian fibrations

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Definition 3.5.3, p. 24; Lemma 3.5.7, pp. 25–26. Source ringed-diagram model; enhancement is furnished by E3.
- [Étale cohomology of diamonds](#src-e0-scholze-diamonds-v4-e4), Proposition 26.2 and proof, p. 162. Explicit enhanced limit of coefficient categories. The étale condition belongs to L0.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E4/coefficient-reduction: Target of the reductions functor.
- EnhancedDerivedSheaves:E4/inverse-limit-reconstruction: Input of the inverse-limit functor.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `CompatibleCoefficientSystems` | constructor | The limit category of the coefficient-change diagram. | included |
| `coefficientSystem_eval` | projection | Evaluation at n gives an object of D(X,R_n). | included |
| `coefficientSystem_transition` | data | The specified derived reduction equivalence at each successor, with coherent composites. | partial |
| `coefficientSystem_mapEquiv` | characterisation | A map of systems is an equivalence exactly when every component is an equivalence. | included |
| `coefficientSystemTotal` | constructor | Unstraightened quotient-ring diagram, with fibres D(X,R/I^(n+1)). | partial |
| `coefficientSystemProjection` | data | The coCartesian projection to the inverse-integer nerve. | included |
| `coefficientSystemProjection_coCartesian` | structure | Every outgoing edge has a coCartesian lift. | included |
| `coefficientSystem_transition_equiv` | equivalence | The chosen successor comparison is invertible. | included |
| `coefficientSystem_zeroIdeal_eval` | compatibility | Evaluation at index zero followed by the canonical quotient-by-zero coefficient identification gives an enhanced functor to D(X,R). It is a categorical equivalence. | partial |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `coefficientSystem_zero` | degenerate | The all-zero coherent system is the zero object. | partial |
| `coefficientSystem_unit` | computation | The objects R_n[0], with the canonical base-change equivalences, form a system. | omitted |
| `coefficientSystem_notUnderived` | non-example | For X=Set, R=ℤ_p and I=(p), the tower having ℤ/p[0] at every n with identity underlying transitions is not a compatible derived coefficient system: reduction from ℤ/p² to ℤ/p has nonzero higher Tor. | omitted |
| `coefficientSystem_zeroIdeal` | degenerate | At I=0 the coefficient-system category is equivalent to D(X,R). | included |

**Acceptance.**

- Verify the stated hypotheses and the indicated canonical map.

**Lean prototype:** partial (`coefficientSystemTotal`, `coefficientSystemProjection`, `coefficientSystemProjection_coCartesian`, `CompatibleCoefficientSystems`, `coefficientSystem_eval`, `coefficientSystem_transition_equiv`, `coefficientSystem_mapEquiv`). Actual coCartesian-section carrier, evaluation and equivalence detection; fibre identification and scalar-transport/composition laws are not yet typed.

**Open obligations:** gap [G0.10](#gap-g0-10) (Higher mate and coefficient reconstruction coherence); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-coefficient-reduction"></a>
#### Coefficient reduction functor

`E4/coefficient-reduction` · construction · planet: **Coefficient reduction**

Define Red:Dcomp(X,R,I)→Sys_I(X,R) by Red(K)_n=K⊗ᴸ_R R_n. Derived associativity supplies the transition equivalences and their coherences.

**Hypotheses.**

- X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X.
- I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed.
- Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.
- The pinned regular-sequence predicate includes nontriviality of the final quotient. The empty sequence handles I=0 on a nonzero ring; the zero ring is a separate trivial case. Noetherianity is not substituted for regularity.

**Construction.**

1. For each n apply derived extension of scalars.
2. Use (K⊗ᴸ_R R_{n+1})⊗ᴸ_{R_{n+1}}R_n≃K⊗ᴸ_R R_n and the associative coherence of the E1 monoidal enhancement.

**Direct prerequisites.**

- [`E4/derived-complete-sheaves`](#n-e4-derived-complete-sheaves) — Derived complete sheaves
- [`E4/compatible-coefficient-systems`](#n-e4-compatible-coefficient-systems) — Compatible coefficient systems
- [`E3/point-free-ringed-system-comparison`](#n-e3-point-free-ringed-system-comparison) — Point-free coefficient-system comparison
- [`E3/presentable-category-limits`](#n-e3-presentable-category-limits) — Limits of presentable categories
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Lemma 3.5.7, p. 25. Reduction is the pullback in the ringed-diagram model.
- [Étale cohomology of diamonds](#src-e0-scholze-diamonds-v4-e4), Proposition 26.2, p. 162. Uses the unbounded regular-ideal formulation without Noetherianity.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E4/reconstruction-unit: Builds the unit tower.
- EnhancedDerivedSheaves:E4/coefficient-system-reconstruction: One direction of the equivalence.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `coefficientReduction` | constructor | The reduction functor Red. | partial |
| `coefficientReduction_eval` | projection | Evaluation at n is −⊗ᴸ_R R_n. | omitted |
| `coefficientReduction_map` | functoriality | A map K→L gives compatible derived reductions, respecting identity and composition. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `coefficientReduction_zero` | degenerate | Red(0) is the zero system. | omitted |
| `coefficientReduction_zeroIdeal` | compatibility | For I=0 it is the constant system with identity transitions. | omitted |
| `coefficientReduction_tor` | computation | For X=Set, R=ℤ_p and K=ℤ/p[0], every derived reduction modulo p^n has cohomology ℤ/p in degrees 0 and −1. It is not the underived constant tower ℤ/p[0]. | omitted |

**Acceptance.**

- Verify the stated hypotheses and the indicated canonical map.

**Lean prototype:** partial (`coefficientReduction`). The functor between actual carriers is typed; evaluation as derived quotient tensor and coherent tensor-associativity laws are not stated.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-inverse-limit-reconstruction"></a>
#### Inverse limit of a coefficient system

`E4/inverse-limit-reconstruction` · construction

Define Rec:Sys_I(X,R)→Dcomp(X,R,I) by Rec(K_•)=Rlim_n K_n after restriction of each coefficient ring to R. The coherent underlying transitions come from the unit to reduction followed by the specified system equivalence.

**Hypotheses.**

- X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X.
- I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed.
- Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.
- The pinned regular-sequence predicate includes nontriviality of the final quotient. The empty sequence handles I=0 on a nonzero ring; the zero ring is a separate trivial case. Noetherianity is not substituted for regularity.

**Construction.**

1. Construct the underlying R-linear coherent tower.
2. Each K_n is I^n-annihilated as an R_n-module object; the nilpotent telescope criterion makes it complete.
3. Take its homotopy limit and apply complete-sheaves-limits.

**Direct prerequisites.**

- [`E4/compatible-coefficient-systems`](#n-e4-compatible-coefficient-systems) — Compatible coefficient systems
- [`E4/complete-sheaves-limits`](#n-e4-complete-sheaves-limits) — Limits of complete sheaves
- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula
- [`E2/tower-milnor`](#n-e2-tower-milnor) — Milnor exact sequence
- [`E3/point-free-ringed-system-comparison`](#n-e3-point-free-ringed-system-comparison) — Point-free coefficient-system comparison
- [`E3/presentable-category-limits`](#n-e3-presentable-category-limits) — Limits of presentable categories
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proof of Lemma 3.5.7, p. 25. Pushforward is Rlim, and its completeness follows from homotopy-limit closure.

**Uses that shape the API.**

- EnhancedDerivedSheaves:E4/reconstruction-counit: Construct the reduction of the inverse limit.
- EnhancedDerivedSheaves:E4/coefficient-system-reconstruction: Inverse direction of the equivalence.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `reconstructCoefficientSystem` | constructor | The inverse-limit functor Rec. | partial |
| `reconstructCoefficientSystem_projection` | projection | The compatible projection Rec(K_•)→K_n as an R-linear map. | omitted |
| `reconstructCoefficientSystem_map` | functoriality | A coherent map of systems induces a map of their homotopy limits. | omitted |
| `reconstructCoefficientSystem_complete` | characterisation | The result satisfies every slice telescope test. | omitted |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `reconstructCoefficientSystem_zero` | degenerate | The zero system reconstructs zero. | included |
| `reconstructCoefficientSystem_padic` | computation | For X=Set, R=ℤ_p, the system ℤ/p^n[0] reconstructs ℤ_p[0]. | omitted |
| `reconstructCoefficientSystem_zeroIdeal` | compatibility | For I=0 the coherent constant system at K reconstructs K. | omitted |

**Acceptance.**

- Verify the stated hypotheses and the indicated canonical map.

**Lean prototype:** partial (`reconstructCoefficientSystem`). The functor to the complete full subcategory is typed; the underlying Rlim, projections and completeness comparison laws are not stated.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-regular-ideal-quotients"></a>
#### Regular ideal quotient algebra

`E4/regular-ideal-quotients` · theorem

Let I=(f₁,…,fᵣ) be generated by a finite regular sequence in a commutative ring A. The ideals J_n=(f₁^n,…,fᵣ^n) are cofinal with I^n, K_A(f₁^n,…,fᵣ^n) resolves A/J_n, and gr_I A is the polynomial algebra over A/I on the generator classes. Every A/I^n is perfect over A with Tor-amplitude contained in [−r,0]. Thus for any unbounded K the Koszul completion model identifies naturally with Rlim_n(K⊗ᴸ_A A/I^n). These assertions do not require Noetherianity.

**Hypotheses.**

- I is generated by a finite regular sequence; arbitrary finitely generated ideals are not covered by this ordinary quotient model.

**Proof.**

1. Powers of a regular sequence remain Koszul-regular; use the E1 resolution. Compare J_n⊂I^n and I^(r(n−1)+1)⊂J_n to obtain cofinality.
2. Regular implies Koszul-regular, H₁-regular and quasi-regular; the last condition gives the polynomial associated graded. Each I^j/I^(j+1) is finite free over A/I, and a finite filtration gives perfect A/I^n with the same uniform Tor-amplitude bound.
3. Replace the Koszul terms by A/J_n and use cofinality in the enhanced limit. For sheaf coefficient applications these finite perfect calculations are used on every slice. The stronger varying-coefficient pro-Tor comparison is the separate E4 node, not a consequence of cofinality alone.

**Direct prerequisites.**

- [`E1/koszul-complex`](#n-e1-koszul-complex) — Koszul complexes
- [`E4/koszul-completion-tower`](#n-e4-koszul-completion-tower) — Koszul power model for completion
- `mathlib:RingTheory.Sequence.IsRegular`
- [`E1/coefficient-change-and-perfect-action`](#n-e1-coefficient-change-and-perfect-action) — Coefficient change and the perfect action

**Sources.**

- [The Stacks Project, More on Algebra](#src-e0-stacks-morealgebra), Lemmas 31.2–31.6, pp. 76–78 (062F, 062G, 062I); Situation 93.15 and Lemma 93.18, pp. 266–267. Regularity and the quasi-regular associated graded control quotient powers and the finite amplitude.
- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Regular-ideal discussion after Lemma 3.5.4 and proof of 3.5.5, p. 25. Finite regular-sequence algebra supplies the ordinary coefficient reduction argument.
- [Étale cohomology of diamonds](#src-e0-scholze-diamonds-v4-e4), Proof of Proposition 26.2 and Remark 26.3, p. 162. The perfect regular-ideal quotients remove Noetherianity and support exact linear coefficient changes.

**Acceptance.**

- For a principal non-zero-divisor f, K_A(f^n) resolves A/f^n.
- For A=k[x,y] and I=(x,y), quotient powers have bounded perfect resolutions even though they are not the two-generator Koszul quotient J_n.
- The sequence (0) in a nonzero ring fails the resolution claim and must retain its negative Koszul cohomology.

**Lean prototype:** omitted. The exact mathematical tower/algebra statement and proof route are planned; its enhanced natural equivalence is not yet typed.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-coefficient-pro-tor-comparison"></a>
#### Pro-Tor coefficient comparison

`E4/coefficient-pro-tor-comparison` · lemma

For a coherent system of complexes K_n of R_n-modules under the regular-sequence hypotheses, the change-of-rings maps induce a pro-isomorphism on each cohomology sheaf (the comparison error cone has pro-zero cohomology in every integer degree) {K_n⊗ᴸ_R R/I}→{K_n⊗ᴸ_{R_n}R/I}, and hence an equivalence of their homotopy inverse limits. The complexes may be unbounded.

**Hypotheses.**

- X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X.
- I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed.
- Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.
- The pinned regular-sequence predicate includes nontriviality of the final quotient. The empty sequence handles I=0 on a nonzero ring; the zero ring is a separate trivial case. Noetherianity is not substituted for regularity.

**Proof.**

1. Import from the E4 completion proof the cofinality of J_n=(f₁^n,…,fᵣ^n) and I^n and the uniformly bounded perfect Koszul resolutions for R/J_n.
2. Use the strict pro-Tor comparison from the E4 completion proof. Its uniform finite amplitude, not a boundedness assumption on K_n, is what permits tensoring with the varying unbounded complexes.
3. Apply the E2 derived inverse-limit comparison for these pro-zero error towers. This pro-descent input remains an explicit gap rather than being inferred from the word “pro”.

**Direct prerequisites.**

- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula
- [`E2/tower-milnor`](#n-e2-tower-milnor) — Milnor exact sequence
- [`E3/point-free-ringed-system-comparison`](#n-e3-point-free-ringed-system-comparison) — Point-free coefficient-system comparison
- [`E3/presentable-category-limits`](#n-e3-presentable-category-limits) — Limits of presentable categories
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- [`E2/pro-zero-derived-limit`](#n-e2-pro-zero-derived-limit) — Derived inverse-limit invariance under pro-zero errors
- [`E1/koszul-complex`](#n-e1-koszul-complex) — Koszul complexes
- [`E4/regular-ideal-quotients`](#n-e4-regular-ideal-quotients) — Regular ideal quotient algebra

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Lemma 3.5.4 and regular-ideal paragraph, p. 25. Reads the bounded-above/noetherian argument and its uniform-amplitude regular-ideal extension.
- [Étale cohomology of diamonds](#src-e0-scholze-diamonds-v4-e4), Proof of Proposition 26.2, p. 162. Confirms removal of Noetherianity under the regular-sequence assumption.

**Acceptance.**

- Uniform amplitude is independent of n.
- Do not apply the general noetherian bounded-above argument to an arbitrary unbounded system.

**Lean prototype:** omitted. The variable coefficient-sheaf telescope, regular-ideal pro-Tor and coherent coefficient-limit interfaces are not yet expressed; the constant-ring orthogonality prefix does not supply them.

**Open obligations:** gap [G0.9](#gap-g0-9) (Completion algebra and its formal comparisons); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-reconstruction-counit"></a>
#### Reduction of the reconstructed limit

`E4/reconstruction-counit` · lemma

For K_•∈Sys_I(X,R) and every k≥1, the canonical map (Rlim_n K_n)⊗ᴸ_R R/I^k→K_k is an equivalence.

**Hypotheses.**

- X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X.
- I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed.
- Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.
- The pinned regular-sequence predicate includes nontriviality of the final quotient. The empty sequence handles I=0 on a nonzero ring; the zero ring is a separate trivial case. Noetherianity is not substituted for regularity.

**Proof.**

1. For k=1, R/I is perfect over R by the finite regular sequence, so tensoring with it commutes with Rlim.
2. Apply coefficient-pro-tor-comparison; compatibility identifies the tower {K_n⊗ᴸ_{R_n}R/I} with the constant coherent tower K₁.
3. For general k, use the exact sequences with successive quotients I^j/I^(j+1). The E1 Koszul and E4 regular-ideal nodes supply their finite-free R/I description and the coherent devissage of the comparison map. Induct on k.
4. This proves equivalence of every counit component; E3 must supply the natural transformation with its coherences.

**Direct prerequisites.**

- [`E4/inverse-limit-reconstruction`](#n-e4-inverse-limit-reconstruction) — Inverse limit of a coefficient system
- [`E4/coefficient-pro-tor-comparison`](#n-e4-coefficient-pro-tor-comparison) — Pro-Tor coefficient comparison
- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula
- [`E2/tower-milnor`](#n-e2-tower-milnor) — Milnor exact sequence
- [`E3/point-free-ringed-system-comparison`](#n-e3-point-free-ringed-system-comparison) — Point-free coefficient-system comparison
- [`E3/presentable-category-limits`](#n-e3-presentable-category-limits) — Limits of presentable categories
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- [`E2/pro-zero-derived-limit`](#n-e2-pro-zero-derived-limit) — Derived inverse-limit invariance under pro-zero errors
- [`E1/koszul-complex`](#n-e1-koszul-complex) — Koszul complexes
- [`E4/regular-ideal-quotients`](#n-e4-regular-ideal-quotients) — Regular ideal quotient algebra

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Lemma 3.5.5 and proof, p. 25. The regular case uses the perfect quotient directly; devissage supplies all powers.

**Acceptance.**

- I^k is not assumed to be generated by a regular sequence.
- For R=k[[x,y]], I=(x,y), the case k=2 must work even though I² has three minimal generators and is not a regular-sequence ideal.

**Lean prototype:** omitted. The variable coefficient-sheaf telescope, regular-ideal pro-Tor and coherent coefficient-limit interfaces are not yet expressed; the constant-ring orthogonality prefix does not supply them.

**Open obligations:** gap [G0.9](#gap-g0-9) (Completion algebra and its formal comparisons); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-reconstruction-unit"></a>
#### Recovery from derived reductions

`E4/reconstruction-unit` · lemma

For K∈Dcomp(X,R,I), the canonical map K→Rlim_n(K⊗ᴸ_R R/I^n) is an equivalence under the finite regular-sequence hypotheses.

**Hypotheses.**

- X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X.
- I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed.
- Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.
- The pinned regular-sequence predicate includes nontriviality of the final quotient. The empty sequence handles I=0 on a nonzero ring; the zero ring is a separate trivial case. Noetherianity is not substituted for regularity.

**Proof.**

1. The E1 Koszul and E4 regular-ideal nodes supply the derived Koszul completion formula and, under the regular-sequence hypothesis, its comparison with ordinary quotient-ring reductions.
2. Apply this comparison locally in the sheaf category and use restriction compatibility to identify the resulting unit with the displayed map.
3. Use that the completion unit is an equivalence on complete objects.

**Direct prerequisites.**

- [`E4/coefficient-reduction`](#n-e4-coefficient-reduction) — Coefficient reduction functor
- [`E4/inverse-limit-reconstruction`](#n-e4-inverse-limit-reconstruction) — Inverse limit of a coefficient system
- [`E4/the-imported-completion-interface`](#n-e4-the-imported-completion-interface) — Sheaf completion reflector
- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula
- [`E2/tower-milnor`](#n-e2-tower-milnor) — Milnor exact sequence
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- [`E2/pro-zero-derived-limit`](#n-e2-pro-zero-derived-limit) — Derived inverse-limit invariance under pro-zero errors
- [`E4/regular-ideal-quotients`](#n-e4-regular-ideal-quotients) — Regular ideal quotient algebra

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Proposition 3.5.1, p. 24; Lemma 3.5.7(2), p. 25. The source’s noetherian formula is used only with the separate regular-sequence comparison.
- [Étale cohomology of diamonds](#src-e0-scholze-diamonds-v4-e4), Proof of Proposition 26.2, p. 162. Supports the nonnoetherian regular-sequence extension.

**Acceptance.**

- For nonregular ideals an additional valid comparison hypothesis is required.
- For X=Set this is E4’s algebraic comparison, not a new generic completion construction.

**Lean prototype:** omitted. The variable coefficient-sheaf telescope, regular-ideal pro-Tor and coherent coefficient-limit interfaces are not yet expressed; the constant-ring orthogonality prefix does not supply them.

**Open obligations:** gap [G0.9](#gap-g0-9) (Completion algebra and its formal comparisons); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-completed-coefficient-ring"></a>
#### Completed coefficient sheaf comparison

`E4/completed-coefficient-ring` · comparison

Let R̂_X=lim_n(R/I^n)_X in X. Then R̂_X⊗ᴸ_R R/I^k≃R/I^k for all k≥1, and restriction of scalars identifies the full derived I-complete subcategories for R̂_X and for the constant ring object R. Even when R is I-adically complete as an ordinary ring, the constant ring sheaf R_X need not equal R̂_X.

**Hypotheses.**

- X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X.
- I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed.
- Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.
- The pinned regular-sequence predicate includes nontriviality of the final quotient. The empty sequence handles I=0 on a nonzero ring; the zero ring is a separate trivial case. Noetherianity is not substituted for regularity.

**Proof.**

1. Apply reconstruction-counit to the system R_n[0]. Repleteness makes its ordinary epimorphic limit agree with its derived limit.
2. Apply the derived scalar-change adjunction. Its unit and counit are equivalences after all reductions, using the quotient comparison just proved.
3. Use E4’s conservativity of reductions on complete objects, extended locally to sheaves.

**Direct prerequisites.**

- [`E4/reconstruction-counit`](#n-e4-reconstruction-counit) — Reduction of the reconstructed limit
- [`E4/reconstruction-unit`](#n-e4-reconstruction-unit) — Recovery from derived reductions
- [`E2/surjective-system-derived-limit`](#n-e2-surjective-system-derived-limit) — Derived limit of an epimorphic system
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- [`E4/the-imported-completion-interface`](#n-e4-the-imported-completion-interface) — Sheaf completion reflector
- [`E4/regular-ideal-quotients`](#n-e4-regular-ideal-quotients) — Regular ideal quotient algebra

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Definition 3.5.2, p. 24; Lemma 3.5.6, p. 25. Keeps the completion of the constant sheaf distinct from the constant sheaf of the completed ring.

**Acceptance.**

- For X=Set and R already complete, R̂_X=R.
- The equality of constant and completed coefficient sheaves is not assumed on a general topos.

**Lean prototype:** omitted. The variable coefficient-sheaf telescope, regular-ideal pro-Tor and coherent coefficient-limit interfaces are not yet expressed; the constant-ring orthogonality prefix does not supply them.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-coefficient-system-reconstruction"></a>
#### Coefficient-system reconstruction

`E4/coefficient-system-reconstruction` · theorem · planet: **Coefficient reconstruction**

For a replete topos X and a commutative ring R with I generated by a finite regular sequence (also allowing I=0), Red and Rec give an equivalence of stable enhanced categories Dcomp(X,R,I)≃lim_n D(X,R/I^n). No Noetherianity or boundedness is required. By completed-coefficient-ring the same complete category can be expressed using R̂_X. In particular this applies to I-adically complete nonnoetherian coefficient rings Λ; the additional étale subcategory is the responsibility of L0.

**Hypotheses.**

- X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X.
- I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed.
- Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.
- The pinned regular-sequence predicate includes nontriviality of the final quotient. The empty sequence handles I=0 on a nonzero ring; the zero ring is a separate trivial case. Noetherianity is not substituted for regularity.

**Proof.**

1. E3 supplies the enhanced diagram-category identification and the reduction/inverse-limit adjunction.
2. The reconstruction-unit and reconstruction-counit lemmas make both coherent transformations equivalences.
3. Apply the enhanced equivalence criterion. Do not deduce this result merely from an equivalence of homotopy categories.

**Direct prerequisites.**

- [`E4/coefficient-reduction`](#n-e4-coefficient-reduction) — Coefficient reduction functor
- [`E4/inverse-limit-reconstruction`](#n-e4-inverse-limit-reconstruction) — Inverse limit of a coefficient system
- [`E4/reconstruction-unit`](#n-e4-reconstruction-unit) — Recovery from derived reductions
- [`E4/reconstruction-counit`](#n-e4-reconstruction-counit) — Reduction of the reconstructed limit
- [`E4/completed-coefficient-ring`](#n-e4-completed-coefficient-ring) — Completed coefficient sheaf comparison
- [`E3/point-free-ringed-system-comparison`](#n-e3-point-free-ringed-system-comparison) — Point-free coefficient-system comparison
- [`E3/presentable-category-limits`](#n-e3-presentable-category-limits) — Limits of presentable categories
- `mathlib:RingTheory.Sequence.IsRegular`

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Lemma 3.5.7, pp. 25–26. Ringed-diagram adjunction and unit/counit proof.
- [Étale cohomology of diamonds](#src-e0-scholze-diamonds-v4-e4), Proposition 26.2 and proof, p. 162. Explicit enhancement and the regular nonnoetherian extension.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `reconstructionUnit` | data | Coherent unit id→Rec Red. | included |
| `reconstructionCounit` | data | Coherent counit Red Rec→id. | included |
| `coefficient_system_reconstruction` | equivalence | Under repleteness and a finite regular sequence both transformations are equivalences. | included |

**Acceptance.**

- For I=0 the diagram is constant with identity transitions and the equivalence is the identity.
- For R=(∏_{m≥0}𝔽_p)[[t]] and I=(t), R is complete, nonnoetherian and t is a non-zero-divisor; the theorem still applies.
- Retain the uniform Tor-amplitude and coherent diagram inputs as unresolved leaves until their suppliers are decomposed.

**Lean prototype:** partial (`reconstructionUnit`, `reconstructionCounit`, `coefficient_system_reconstruction`). The regular-sequence/repleteness equivalence of coherent unit and counit is typed. The comparison with the completed coefficient sheaf and the stated stable-category structures remains omitted.

**Open obligations:** gap [G0.10](#gap-g0-10) (Higher mate and coefficient reconstruction coherence); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-completed-colimits"></a>
#### Colimits of complete sheaves

`E4/completed-colimits` · lemma

For a small enhanced diagram F:J→Dcomp(X,R,I), its colimit is L_I(colim_J iF), where i is the full inclusion. Thus Dcomp has small colimits. This formula does not assert that i preserves them.

**Hypotheses.**

- X is a replete Grothendieck topos; size universes are fixed.
- R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified.
- D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

**Proof.**

1. For complete L, the reflector adjunction identifies Map(L_I colim iF,L) with Map(colim iF,L).
2. The ambient colimit universal property identifies this with lim_j Map(F_j,L), giving the required colimit in the full subcategory.

**Direct prerequisites.**

- [`E4/the-imported-completion-interface`](#n-e4-the-imported-completion-interface) — Sheaf completion reflector
- [`E3/point-free-ringed-system-comparison`](#n-e3-point-free-ringed-system-comparison) — Point-free coefficient-system comparison
- [`E3/presentable-category-limits`](#n-e3-presentable-category-limits) — Limits of presentable categories
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor

**Sources.**

- [The pro-étale topology for schemes](#src-e0-bhattscholze-author-20260926), Lemma 3.4.9, pp. 21–22. The formula is a formal consequence of the reflector adjunction.
- [Étale cohomology of diamonds](#src-e0-scholze-diamonds-v4-e4), Proposition 26.2, p. 162. States the need to complete colimits in the adic sheaf application.

**Acceptance.**

- For X=Set and R=ℤ_p, the colimit of ℤ_p --p→ ℤ_p --p→ ⋯ is ℚ_p in D(R), but is zero in Dcomp(R,(p)).
- In the zero-ideal case the formula is the ordinary colimit.

**Lean prototype:** omitted. The variable coefficient-sheaf telescope, regular-ideal pro-Tor and coherent coefficient-limit interfaces are not yet expressed; the constant-ring orthogonality prefix does not supply them.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-perfect-coefficient-change"></a>
#### Perfect coefficient change for exact functors

`E4/perfect-coefficient-change` · lemma

Let C,D be stable R-linear enhanced categories with their compatible Perf(R)-actions, and let F:C→D be an exact functor with coherent R-linear structure. For every perfect R-complex P and K∈C there is a natural equivalence F(K⊗_R P)≃F(K)⊗_R P. In particular this holds for P=R/I^n under the finite regular-sequence hypotheses. Comparing to a separately defined finite-level functor additionally requires identification of that functor with this scalar extension; exactness of an arbitrary right adjoint alone is not enough.

**Hypotheses.**

- Stable enhanced R-linear categories and a coherent exact R-linear functor, with compatible actions of perfect R-complexes.
- For the quotient application, I is generated by a finite regular sequence. No assertion is made that I^n is a regular-sequence ideal.
- The pinned regular-sequence predicate includes nontriviality of the final quotient. The empty sequence handles I=0 on a nonzero ring; the zero ring is a separate trivial case. Noetherianity is not substituted for regularity.

**Proof.**

1. For P=R, and for finite sums and shifts of R, use the coherent R-linear structure and exactness.
2. Extend across finite cofibres and retracts to all perfect complexes, with naturality from the Perf(R)-action.
3. The E1 Koszul and E4 regular-ideal nodes supply perfection of R/I from the Koszul resolution and of all R/I^n by the filtration with finite-free R/I graded pieces.
4. L0 verifies the hypotheses and the finite-level identifications for each six-operation functor separately.

**Direct prerequisites.**

- [`E3/point-free-ringed-system-comparison`](#n-e3-point-free-ringed-system-comparison) — Point-free coefficient-system comparison
- [`E3/presentable-category-limits`](#n-e3-presentable-category-limits) — Limits of presentable categories
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- [`E1/coefficient-change-and-perfect-action`](#n-e1-coefficient-change-and-perfect-action) — Coefficient change and the perfect action
- [`E1/koszul-complex`](#n-e1-koszul-complex) — Koszul complexes
- [`E4/regular-ideal-quotients`](#n-e4-regular-ideal-quotients) — Regular ideal quotient algebra

**Sources.**

- [Étale cohomology of diamonds](#src-e0-scholze-diamonds-v4-e4), Remark 26.3, p. 162. Explains reduction compatibility via regular sequences and exactness, followed by induction on n; the node makes the necessary linear/coherent structure explicit.

**Acceptance.**

- Check the argument for a two-term perfect complex as preservation of its cofiber.
- A right adjoint that has not been shown R-linear with the required coherent action does not satisfy the hypotheses.
- No geometric six-operation construction is duplicated in E4.

**Lean prototype:** omitted. The variable coefficient-sheaf telescope, regular-ideal pro-Tor and coherent coefficient-limit interfaces are not yet expressed; the constant-ring orthogonality prefix does not supply them.

**Open obligations:** gap [G0.9](#gap-g0-9) (Completion algebra and its formal comparisons); gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).

<a id="n-e4-mod-ideal-detection"></a>
#### Equivalences detected modulo the ideal

`E4/mod-ideal-detection` · lemma

A map f:K→L of derived I-complete sheaves is an equivalence if and only if f⊗ᴸ_R R/I is an equivalence, under the finite regular-sequence hypotheses.

**Hypotheses.**

- X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X.
- I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed.
- Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.
- The pinned regular-sequence predicate includes nontriviality of the final quotient. The empty sequence handles I=0 on a nonzero ring; the zero ring is a separate trivial case. Noetherianity is not substituted for regularity.

**Proof.**

1. Take the complete cofiber C of f.
2. If C⊗ᴸ_R R/I=0, devissage using the finite-free graded pieces I^j/I^(j+1) gives C⊗ᴸ_R R/I^n=0 for every n.
3. Reconstruction-unit gives C=0. The converse follows by functoriality.
4. For the generic point case use the finite Koszul tower: vanishing modulo A/I kills each Koszul tensor term by finite nilpotent-ideal dévissage, hence its limit. This is the E4-owned derived Nakayama argument (Stacks Lemma 93.20, p. 268).

**Direct prerequisites.**

- [`E4/derived-complete-sheaves`](#n-e4-derived-complete-sheaves) — Derived complete sheaves
- [`E4/complete-sheaves-limits`](#n-e4-complete-sheaves-limits) — Limits of complete sheaves
- [`E4/reconstruction-unit`](#n-e4-reconstruction-unit) — Recovery from derived reductions
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- [`E4/koszul-completion-tower`](#n-e4-koszul-completion-tower) — Koszul power model for completion

**Sources.**

- [Étale cohomology of diamonds](#src-e0-scholze-diamonds-v4-e4), Remark 26.3, p. 162. Reduction to the mod-I case for natural transformations follows from this complete-object conservativity.
- [The Stacks Project, More on Algebra](#src-e0-stacks-morealgebra), Lemma 93.20, p. 268 (tag 0G1U). The Koszul tower proves derived Nakayama for finitely generated ideals; the stated regular case is a specialization.

**Acceptance.**

- The completeness assumption cannot be dropped: 0→ℚ_p over ℤ_p becomes an equivalence modulo p, but is not an equivalence before reduction.
- The zero test is for derived reduction, not ordinary module quotient.

**Lean prototype:** omitted. The variable coefficient-sheaf telescope, regular-ideal pro-Tor and coherent coefficient-limit interfaces are not yet expressed; the constant-ring orthogonality prefix does not supply them.

**Open obligations:** gap [G0.12](#gap-g0-12) (Actual suggested-signature conditions).


<a id="layer-e5"></a>

## E5 — Shared monoidal enhancement, Ind-completion and animated algebra

E5 is the single supplier of higher monoidal, presentable and animated
structure for the K-theory, trace, prismatic and geometric Langlands
roadmaps. It has no dependency on diamonds or prismatic cohomology. Its
carriers are quasicategories; passage to a homotopy category is a comparison,
never the definition of an enhanced limit, action or algebra. Its five
sub-layers follow; the layer itself holds one declaration, the joint
acceptance diagram, at the [end of E5](#layer-e5-acceptance). The cotangent
complex stays owned by `DerivedDeRhamCohomology:DD.0` and concrete spectra by
`StableHomotopyKTheory:H.5`; neither is an input to animation or to the
monoidal stable foundation.

<a id="layer-e5-abstract"></a>

### E5:abstract — Monoidal stable categorical baseline

A symmetric monoidal ∞-category is a cocartesian fibration over N(Fin_*) whose
fibres satisfy the Segal condition through the inert projections, with
terminal fibre at ⟨0⟩; ∞-operads relax this to inner fibrations with
cocartesian inert lifts and a product condition on mapping spaces, and
O-monoidal categories are cocartesian fibrations over an operad. E0's
restricted straightening covers only small shapes, so the extension to the
bases N(Fin_*), LM and Ass and their pullbacks follows Nikolaus–Scholze's
gluing of cocartesian families along colimits in Cat∞ (request
[R5.7](#req-r5-7)). Algebra objects are inert-preserving sections; for
cartesian tensor an associative algebra gives a Segal simplicial object, but
the product description is not claimed for a general tensor. Modules carry an
extension-of-scalars left adjoint computed by the bar construction, when
geometric realizations exist and are preserved separately by tensor and
action.

The stable declarations import E0's stability and add only the monoidal
comparison on homotopy categories. Idempotent completion, the monoidal
envelope (lax functors as strong functors out of a universal source),
monoidal Dwyer–Kan localization and the localization of a monoidal model
category, derivable cocartesian families, stable tensor ideals and Verdier
quotients (whose kernel is the retract closure) follow. Barr–Beck–Lurie
monadicity uses E3's adjoint theorem. Descendable algebras have a finite
nilpotence index of the augmentation fibre, equivalently a pro-constant
Amitsur tower; module descent along them is symmetric monoidal and is the
input of E2's h-Čech descent. ℤ_p → F_p is the standard non-example: its
Amitsur totalization recovers the p-complete unit, but it is not descendable.
Uniform index bounds pass to filtered colimits (2m for sequential ones); the
general multiplicative filtration is gap [G5.2](#gap-g5-2). Formal inversion
of a tensor object needs the cyclic permutation condition.

<a id="n-e5-abstract-symmetric-monoidal-infinity-category"></a>
#### Symmetric monoidal infinity-categories

`E5:abstract/symmetric-monoidal-infinity-category` · definition · planet: **Symmetric monoidal infinity-categories**

A symmetric monoidal infinity-category is a cocartesian fibration C⊗ → N(Fin_*) whose fibre over ⟨n⟩ maps equivalently to C^n through the n inert projections; C is the fibre at ⟨1⟩. The fibre at ⟨0⟩ is terminal. Active fold maps give tensor products and the nullary fold gives the unit.

**Hypotheses.**

- Work in specified nested universes; finite pointed sets are ordinary finite sets with a distinguished base point.
- Cocartesian lifts over all maps are required, not only inert lifts.

**Construction.**

1. Extend E0’s restricted straightening to the base N(Fin_*); assemble the fibrewise product diagrams.
2. Impose the Segal equivalences and recover coherent tensor and unit from active lifts.
3. Construct the ordinary operadic category from finite lists and multimorphisms, using the associator and symmetry coherence of the ordinary category, and compare its nerve fibrewise. The pinned Grothendieck construction applies to a strict category-valued diagram; use it only after such a strict diagram or strictification has been supplied.

**Direct prerequisites.**

- [`E0/cocartesian-fibrations-and-restricted-straightening`](#n-e0-cocartesian-fibrations-and-restricted-straightening) — Restricted straightening and sections
- `mathlib:CategoryTheory.Grothendieck`
- `mathlib:CategoryTheory.SymmetricCategory`
- `mathlib:SSet`
- `mathlib:SSet.Quasicategory`
- `mathlib:CategoryTheory.Functor`
- `mathlib:CategoryTheory.MonoidalCategory`
- `mathlib:SSet.HomotopyCategory`
- `mathlib:SSet.mapHomotopyCategory`

**Sources.**

- [Higher Algebra](#src-e5-lurie-ha), Definition 2.0.0.7, p. 169; Remark 2.1.2.19, p. 182. Defines symmetric monoidal categories as cocartesian families over pointed finite sets with the inert Segal equivalences; the nullary fibre supplies the unit.

**Uses that shape the API.**

- FS21, Theorem X.1.1: Coherent monoidal representations require the total operadic fibration, not a tensor on isomorphism classes.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `SymMonData` | data | Total space, projection to N(Fin_*), fibres and Segal equivalences; the full definition also imposes cocartesianness. | included |
| `SymMonData.tensor` | projection | Tensor is the active binary pushforward. | included |
| `SymMonData.unit` | projection | Unit is the active nullary pushforward. | included |
| `SymMonData.ofOrdinary` | constructor | The nerve of an ordinary SymmetricCategory gives the corresponding operadic fibration. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `SymMonData.test_zero` | degenerate | The zero-ary fibre is equivalent to the terminal infinity-category. | included |
| `SymMonData.test_one` | computation | The one-ary fibre is equivalent to the underlying category. | included |
| `SymMonData.test_ordinary` | compatibility | For an ordinary symmetric monoidal C the homotopy category of the underlying fibre is equivalent to C. | included |

**Acceptance.**

- The zero-ary fibre is equivalent to the terminal infinity-category.
- The one-ary fibre is equivalent to the underlying category.
- For an ordinary symmetric monoidal C the homotopy category of the underlying fibre is equivalent to C.

**Open obligations:** gap [G5.1](#gap-g5-1) (Refine abstract supplier dependencies across parts); request [R5.6](#req-r5-6) to `EnhancedDerivedSheaves:E3`; request [R5.7](#req-r5-7) to `EnhancedDerivedSheaves:E0`.

<a id="n-e5-abstract-infinity-operad"></a>
#### Infinity-operads

`E5:abstract/infinity-operad` · definition

An infinity-operad O⊗ → N(Fin_*) is an inner fibration with cocartesian inert lifts. For each map f:⟨m⟩→⟨n⟩, its mapping space over f is the product of the mapping spaces over ρ_i f to the n output colours. Its fibre at ⟨n⟩ is equivalent, via inert projections, to the n-fold product of its colour fibre. The mapping-space condition includes nullary operations.

**Hypotheses.**

- Mapping spaces are those of E0, with fibres over specified base morphisms.
- An infinity-operad need not admit active cocartesian lifts.

**Construction.**

1. Construct the inert/active factorization in Fin_*.
2. Use E0 mapping spaces and lifting predicates to state the inert, operation-product and object-Segal axioms.
3. Check the commutative operad and the associative operad with ordered fibres.

**Direct prerequisites.**

- [`E0/right-mapping-space`](#n-e0-right-mapping-space) — Right mapping space
- [`E5:abstract/symmetric-monoidal-infinity-category`](#n-e5-abstract-symmetric-monoidal-infinity-category) — Symmetric monoidal infinity-categories
- [`E0/mapping-space-kan-and-equivalences`](#n-e0-mapping-space-kan-and-equivalences) — Right mapping spaces are spaces

**Sources.**

- [Higher Algebra](#src-e5-lurie-ha), Definition 2.1.1.10, pp. 174–175. Specifies the inner fibration, inert cocartesian lifts, fibre decomposition and operation-space decomposition, including nullary operations.

**Uses that shape the API.**

- NS18, Appendix B, p. 140: Ordered fibres and the cuts functor produce the associative algebra interface.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `OperadData` | data | Underlying operadic map and colour category; lifting and operation-space axioms belong to the full definition. | included |
| `commOperad` | constructor | The identity operad of N(Fin_*) is the commutative operad. | included |
| `assOperad` | constructor | The associative operad has ordered nonbasepoint fibres; composition concatenates their orders. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `OperadData.test_comm` | degenerate | The colour category of the commutative operad is terminal. | included |
| `OperadData.test_assoc` | computation | The associative n-input operation space has n! components, represented by total orders. | included |
| `OperadData.test_nullary` | degenerate | The associative zero-input operation space is terminal. | included |

**Acceptance.**

- The colour category of the commutative operad is terminal.
- The associative n-input operation space has n! components, represented by total orders.
- The associative zero-input operation space is terminal.

**Open obligations:** gap [G5.1](#gap-g5-1) (Refine abstract supplier dependencies across parts); request [R5.7](#req-r5-7) to `EnhancedDerivedSheaves:E0`.

<a id="n-e5-abstract-monoidal-categories-over-an-operad"></a>
#### Monoidal categories over an operad

`E5:abstract/monoidal-categories-over-an-operad` · definition

An O-monoidal infinity-category is a cocartesian fibration C⊗ → O⊗ such that, for T with inert components T_i, C_T → ∏_i C_(T_i) is an equivalence. The composite to N(Fin_*) is then an infinity-operad. A map is O-monoidal if it preserves cocartesian edges; it is lax O-monoidal if it is an operad map and only preserves the inert edges.

**Hypotheses.**

- O⊗ is an infinity-operad.
- The product condition is on the fibres over individual objects T of O⊗.

**Construction.**

1. Use the fibre criterion in HA 2.1.2.12, rather than assuming any cocartesian fibration is monoidal.
2. Compose the operadic maps and verify the mapping-space and Segal conditions.
3. Build the full functor categories of strong and lax maps over the base.

**Direct prerequisites.**

- [`E5:abstract/infinity-operad`](#n-e5-abstract-infinity-operad) — Infinity-operads
- [`E5:abstract/symmetric-monoidal-infinity-category`](#n-e5-abstract-symmetric-monoidal-infinity-category) — Symmetric monoidal infinity-categories
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations

**Sources.**

- [Higher Algebra](#src-e5-lurie-ha), Proposition 2.1.2.12, p. 180; Definition 2.1.2.13, p. 182; Definition 2.1.3.7, p. 185. Characterizes the relative Segal cocartesian family and distinguishes maps preserving all cocartesian edges from lax maps preserving inert ones.

**Uses that shape the API.**

- NS18, Appendix A: Localization must distinguish strong from lax functor universal properties.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `OMonoidalData` | data | Cocartesian operadic map with componentwise fibre-product equivalences. | included |
| `strongMonoidalFunctors` | data | The infinity-category of maps preserving all cocartesian edges. | included |
| `laxMonoidalFunctors` | data | The infinity-category of operad maps preserving inert edges. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `OMonoidalData.test_comm` | compatibility | For O=Comm, this recovers symmetric monoidal categories. | included |
| `OMonoidalData.test_identity` | degenerate | The identity operad map is strong monoidal. | included |
| `OMonoidalData.test_unit` | characterisation | A lax map supplies a unit comparison; a strong map has an invertible unit comparison. | included |

**Acceptance.**

- For O=Comm, this recovers symmetric monoidal categories.
- The identity operad map is strong monoidal.
- A lax map supplies a unit comparison; a strong map has an invertible unit comparison.

**Open obligations:** gap [G5.1](#gap-g5-1) (Refine abstract supplier dependencies across parts); request [R5.7](#req-r5-7) to `EnhancedDerivedSheaves:E0`.

<a id="n-e5-abstract-algebra-objects"></a>
#### Operadic algebras

`E5:abstract/algebra-objects` · construction · planet: **Operadic algebras**

Alg_O(C) is the full infinity-category of sections O⊗ → C⊗ over O⊗ that preserve inert edges. For O=Comm write CAlg(C); for O=Ass use associative algebra objects. Algebra maps are coherent transformations over the operad. In a cartesian monoidal ordinary category, the construction agrees with ordinary commutative or associative monoid objects after passing to nerves.

**Hypotheses.**

- C⊗ is O-monoidal.
- A section need not preserve active cocartesian edges.

**Construction.**

1. Form the functor category over O⊗ using E0; select inert-preserving sections.
2. Compare with ordinary algebra objects by evaluating operation maps.
3. Compose an associative algebra section with the cuts functor Δop→Ass⊗ to obtain a diagram in the total operadic category, whose n-th value is the n-tuple of its underlying object. For cartesian tensor this corresponds to a Segal simplicial object in the underlying category, with A_n≃A_1^n and A_0 terminal; the product-valued description is not asserted for a general tensor.

**Direct prerequisites.**

- [`E5:abstract/monoidal-categories-over-an-operad`](#n-e5-abstract-monoidal-categories-over-an-operad) — Monoidal categories over an operad
- [`E5:abstract/infinity-operad`](#n-e5-abstract-infinity-operad) — Infinity-operads
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations

**Sources.**

- [Higher Algebra](#src-e5-lurie-ha), Definition 2.1.3.1, p. 184. Defines algebra objects by operadic sections preserving inert morphisms; commutative and associative algebra categories are its two specializations.
- [On topological cyclic homology](#src-e5-ns18), Appendix B, introductory construction of Δop→Ass⊗, p. 140 (before Proposition B.1). Constructs the ordered-fibre cuts functor; its algebra composite is a diagram in the total operadic category, with the underlying product-valued Segal interpretation specialized to cartesian tensor.

**Uses that shape the API.**

- NS18, Appendix B, p. 140: The cuts functor retains coherent associative operations in the total operadic category. For cartesian tensor it yields the Segal simplicial presentation; trace consumers in general tensor categories use the operadic section.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `operadicAlgebras` | constructor | For a symmetric monoidal C and operad O, pull C⊗ back along O⊗→N(Fin_*) and form its inert-preserving section category. The general relative O-monoidal case is supplied by relativeOperadicAlgebras. | included |
| `commutativeAlgebras` | data | The specialization CAlg(C). | included |
| `algebraForget` | projection | Evaluation at the sole colour in the commutative specialization; for a general coloured operad use algebraAtColour. | included |
| `assCuts` | data | The cuts functor Δop→Ass⊗ gives the n-tuple diagram in the total operadic category. A product-valued Segal simplicial object in C is obtained when the tensor is cartesian. | included |
| `relativeOperadicAlgebras` | constructor | For an O-monoidal category, the full coherent functor category of inert-preserving sections of C⊗→O⊗. | included |
| `algebraAtColour` | projection | Evaluation of a relative operadic algebra at a specified colour, taking values in the corresponding fibre of C⊗. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `operadicAlgebras.test_terminal` | degenerate | Algebras in the terminal monoidal category form a terminal category. | included |
| `operadicAlgebras.test_sets` | compatibility | Commutative algebras in cartesian sets are ordinary commutative monoids. | included |
| `operadicAlgebras.test_segal` | characterisation | In cartesian sets, an associative algebra has A_2≃A_1×A_1 and A_0 terminal. | included |

**Acceptance.**

- Algebras in the terminal monoidal category form a terminal category.
- Commutative algebras in cartesian sets are ordinary commutative monoids.
- In cartesian sets, an associative algebra has A_2≃A_1×A_1 and A_0 terminal.

**Open obligations:** gap [G5.1](#gap-g5-1) (Refine abstract supplier dependencies across parts); request [R5.7](#req-r5-7) to `EnhancedDerivedSheaves:E0`.

<a id="n-e5-abstract-module-objects"></a>
#### Modules and extension of scalars

`E5:abstract/module-objects` · construction · planet: **Module objects**

For an associative algebra A in C and a left C-tensored infinity-category M, LMod_A(M) is the fibre of the category of LM-algebras at A. Its objects have a coherently unital associative action A⊗M→M. If C and M admit geometric realizations, and both the tensor in C and its action on M preserve them separately in each variable, f:A→B has an extension-of-scalars left adjoint B⊗_A− to restriction. Compute it by the two-sided bar realization.

**Hypotheses.**

- LM is the two-coloured operad distinguishing the algebra and module colours.
- For a commutative A in presentably symmetric monoidal C, Mod_A(C) has relative tensor and unit A; tensors must preserve colimits.

**Construction.**

1. Apply the algebra-section construction to LM and take the fibre over A.
2. Realize Bar(B,A,M) and prove its mapping-space adjunction with restriction.
3. Use commutativity of A to descend tensor and its symmetry to the relative bar construction.

**Direct prerequisites.**

- [`E5:abstract/algebra-objects`](#n-e5-abstract-algebra-objects) — Operadic algebras
- [`E0/limits-colimits-and-slices`](#n-e0-limits-colimits-and-slices) — The simplicial join

**Sources.**

- [Higher Algebra](#src-e5-lurie-ha), Definitions 4.2.1.12–13, pp. 506–507; Definition 4.2.1.19, p. 508; Proposition 4.6.2.17, p. 627. Defines the LM-fibre of left modules in a left-tensored category; the relative tensor product gives composition of extension of scalars.

**Uses that shape the API.**

- BS17, Theorem 11.15, pp. 42–43; HA §4.8.4, pp. 736–738: Amitsur module descent changes coefficients along commutative algebra maps. Extension of scalars and its forgetful right adjoint must act on the same operadic module category, with relative tensor preserved.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `leftModuleObjects` | constructor | The LM-fibre LMod_A(M) for an associative algebra A and a left C-tensored category M. | included |
| `moduleObjects` | constructor | The commutative specialization Mod_A(C). | included |
| `extensionScalars` | functoriality | B⊗_A−, computed by a bar realization and left adjoint to restriction. | included |
| `moduleUnit` | projection | The unit of Mod_A(C) is A. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `moduleObjects.test_unit` | degenerate | Modules over the tensor unit are equivalent to C. | included |
| `moduleObjects.test_identity` | degenerate | Extension along the identity A→A is equivalent to the identity. | included |
| `moduleObjects.test_composition` | characterisation | C⊗_B(B⊗_A M) ≃ C⊗_A M for composable algebra maps. | included |

**Acceptance.**

- Modules over the tensor unit are equivalent to C.
- Extension along the identity A→A is equivalent to the identity.
- C⊗_B(B⊗_A M) ≃ C⊗_A M for composable algebra maps.

**Open obligations:** gap [G5.1](#gap-g5-1) (Refine abstract supplier dependencies across parts); request [R5.7](#req-r5-7) to `EnhancedDerivedSheaves:E0`.

<a id="n-e5-abstract-stable-infinity-category"></a>
#### Stable monoidal enhancement comparison

`E5:abstract/stable-infinity-category` · comparison

Import E0’s stable infinity-category and its exact/triangulated API. If C is also symmetric monoidal and its tensor is exact separately, the tensor descends to a symmetric monoidal structure on hC compatible with suspension and distinguished cofiber triangles. For derived modules it agrees with Mathlib’s ordinary derived category through E1’s enhancement; constructing the tensor uses K-flat replacements, not closure of K-injectives under tensor.

**Hypotheses.**

- Stability and cochain suspension signs are supplied by E0.
- Require exactness separately; it does not follow from merely having a monoidal structure.

**Proof.**

1. Transport the operadic coherent tensor along h and identify its associator, unit and symmetry.
2. Apply E0’s finite cofiber/triangle comparison to tensor in either variable.
3. Use E1’s derived tensor comparison to ordinary complexes.

**Direct prerequisites.**

- [`E0/stable-api-and-the-sign-comparison`](#n-e0-stable-api-and-the-sign-comparison) — The stable API, and the comparison of shifts and cone signs with the cochain convention
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- [`E5:abstract/symmetric-monoidal-infinity-category`](#n-e5-abstract-symmetric-monoidal-infinity-category) — Symmetric monoidal infinity-categories
- `mathlib:DerivedCategory`

**Sources.**

- [Higher Algebra](#src-e5-lurie-ha), §1.1.2, Theorem 1.1.2.14, pp. 27–28; §4.8.1, pp. 712–715. Gives the triangulated homotopy-category comparison and the monoidal extension machinery; the stable structure itself is imported from E0.

**Acceptance.**

- For R-modules, the monoidal homotopy-category comparison sends the enhanced tensor unit to R[0] and a cofiber triangle to the pinned cochain cone triangle.
- Tensoring the triangle R→R→0 by any K gives K→K→0, with the E0 shift convention.

<a id="n-e5-abstract-exact-functors"></a>
#### Exact monoidal functors and triangles

`E5:abstract/exact-functors` · comparison

For stable C,D, import E0’s equivalence of finite-limit and finite-colimit preservation. An exact strong or lax monoidal functor then induces the corresponding ordinary monoidal functor on homotopy categories and carries the cofiber triangle of f to that of Ff, with the suspension comparison inherited from E0. Coherent functors are retained before passing to homotopy categories.

**Hypotheses.**

- Exactness is an E0 property of the underlying functor.
- Lax monoidal does not imply exact, and exact does not imply strong monoidal.

**Proof.**

1. Restrict the coherent strong/lax functor categories by E0 exactness.
2. Apply h, transport suspension isomorphisms, and verify compatibility with the tensor structure.

**Direct prerequisites.**

- [`E0/stable-api-and-the-sign-comparison`](#n-e0-stable-api-and-the-sign-comparison) — The stable API, and the comparison of shifts and cone signs with the cochain convention
- [`E5:abstract/monoidal-categories-over-an-operad`](#n-e5-abstract-monoidal-categories-over-an-operad) — Monoidal categories over an operad
- [`E5:abstract/stable-infinity-category`](#n-e5-abstract-stable-infinity-category) — Stable monoidal enhancement comparison

**Sources.**

- [Higher Algebra](#src-e5-lurie-ha), Proposition 1.1.4.1, pp. 33–35; §2.1.2, pp. 177–182. Identifies finite-limit and finite-colimit preservation in stable categories; the monoidal map convention supplies the additional comparison structure.

**Acceptance.**

- The suspension comparison for the identity functor is the identity; comparisons compose naturally for two exact monoidal functors.
- For extension of scalars R→S, the image of a cone triangle is the derived-tensor cone triangle, without a flatness assumption on S.

<a id="n-e5-abstract-idempotent-completion"></a>
#### Idempotent completion and its monoidal extension

`E5:abstract/idempotent-completion` · construction · planet: **Idempotent completion**

Idem(C) is the full subcategory of P(C) spanned by retracts of representables. C→Idem(C) is fully faithful; restriction Fun(Idem(C),D)→Fun(C,D) is an equivalence for idempotent-complete D. For small stable C it is stable. A separately exact tensor extends to retracts, giving a symmetric monoidal completion and the corresponding monoidal universal property. For an ordinary category C this agrees with the nerve of its Mathlib Karoubi envelope.

**Hypotheses.**

- Use homotopy coherent idempotents, not just idempotents in hC.
- The ordinary comparison has discrete mapping spaces; no claim hIdem(C)=Karoubi(hC) in complete generality is needed.

**Construction.**

1. Take the retract closure of the representable Yoneda image in space-valued presheaves.
2. Use HTT’s functor restriction theorem for uniqueness of extensions.
3. Extend tensor on retracts and check closure of finite cofibers using E0.

**Direct prerequisites.**

- [`E0/stable-api-and-the-sign-comparison`](#n-e0-stable-api-and-the-sign-comparison) — The stable API, and the comparison of shifts and cone signs with the cochain convention
- [`E3/left-kan-extension-along-a-full-inclusion`](#n-e3-left-kan-extension-along-a-full-inclusion) — Left Kan extension along a full inclusion
- `mathlib:CategoryTheory.Idempotents.Karoubi`
- [`E5:abstract/symmetric-monoidal-infinity-category`](#n-e5-abstract-symmetric-monoidal-infinity-category) — Symmetric monoidal infinity-categories

**Sources.**

- [Higher Topos Theory](#src-e5-lurie-htt), §5.1.4, Propositions 5.1.4.2 and 5.1.4.9, pp. 321–323. Constructs idempotent completion from retracts of representables and gives its functor-extension universal property.

**Uses that shape the API.**

- GeneralAlgebraicKTheory:K.1: K-theory uses stable idempotent-complete categories. Compatibility is an output, not a prerequisite.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `idemCompletion` | constructor | Retracts of representables in P(C). | included |
| `idemInclusion` | data | The fully faithful embedding C→Idem(C). | included |
| `idemRestriction` | universal-property | Restriction is an equivalence for idempotent-complete targets. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `idemCompletion.test_idempotent` | degenerate | Completing a completed category changes it by an equivalence. | included |
| `idemCompletion.test_ordinary` | compatibility | Idem(NC) is equivalent to N(Karoubi C). | included |
| `idemCompletion.test_terminal` | degenerate | Idem(*) is terminal. | included |

**Acceptance.**

- Completing a completed category changes it by an equivalence.
- Idem(NC) is equivalent to N(Karoubi C).
- Idem(*) is terminal.

**Open obligations:** gap [G5.1](#gap-g5-1) (Refine abstract supplier dependencies across parts); request [R5.6](#req-r5-6) to `EnhancedDerivedSheaves:E3`.

<a id="n-e5-abstract-monoidal-envelope"></a>
#### The monoidal envelope

`E5:abstract/monoidal-envelope` · construction

Env(C⊗) has objects finite lists of colours of C; maps are active operadic maps, tensor concatenates lists. Inclusion of C as singleton lists extends lax maps: restriction Fun⊗(Env(C⊗),D) ≃ Fun_lax(C,D). Thus lax functors can be handled by strong functors out of a universal envelope. The envelope of the unit category has one isomorphism class per arity.

**Hypotheses.**

- D is symmetric monoidal.
- Use the operadic active-arrow construction, not a free ordinary tensor category on hC.

**Construction.**

1. Pull back the operad along the active-arrow category of Fin_* and evaluate targets.
2. Check the Segal equivalences for concatenation.
3. Give inverse functors by applying a lax functor to each list and using its coherent structure maps; verify the mapping-space equivalence.

**Direct prerequisites.**

- [`E5:abstract/monoidal-categories-over-an-operad`](#n-e5-abstract-monoidal-categories-over-an-operad) — Monoidal categories over an operad
- [`E5:abstract/algebra-objects`](#n-e5-abstract-algebra-objects) — Operadic algebras
- `mathlib:CategoryTheory.isIsomorphicSetoid`

**Sources.**

- [On topological cyclic homology](#src-e5-ns18), Proposition III.3.2, p. 76. Describes the finite-list monoidal envelope and the equivalence between strong maps from it and lax maps from the original monoidal category.

**Uses that shape the API.**

- NS18, Proposition III.3.2: Changes lax universal properties into strong ones.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `monoidalEnvelope` | constructor | The symmetric monoidal active-arrow envelope. | included |
| `envelopeSingleton` | data | The canonical lax singleton inclusion. | included |
| `envelopeRestriction` | universal-property | Strong functors out of the envelope are equivalent to lax functors out of C. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `monoidalEnvelope.test_arity` | computation | For the terminal input category, envelope objects up to isomorphism are indexed by ℕ. | included |
| `monoidalEnvelope.test_concat` | computation | Tensor of an m-list and an n-list has arity m+n. | included |
| `monoidalEnvelope.test_empty` | degenerate | The envelope unit is the empty list, of arity zero. | included |

**Acceptance.**

- For the terminal input category, envelope objects up to isomorphism are indexed by ℕ.
- Tensor of an m-list and an n-list has arity m+n.
- The envelope unit is the empty list, of arity zero.

<a id="n-e5-abstract-monoidal-dwyer-kan-localization"></a>
#### Symmetric monoidal Dwyer–Kan localization

`E5:abstract/monoidal-dwyer-kan-localization` · theorem · planet: **Monoidal localization**

If C⊗ is symmetric monoidal and a class W of underlying morphisms is stable under tensoring with any object in either variable, C[W⁻¹] carries a symmetric monoidal structure. The localization is strong monoidal. Restriction is fully faithful on strong and on lax monoidal functor categories with essential image the functors inverting W. For every base change K→N(Fin_*), the total operadic localization is the corresponding Dwyer–Kan localization.

**Hypotheses.**

- Use the saturated class generated by W; an ordinary categorical localization of hC alone does not supply this theorem.
- The tensor-stability hypothesis is essential for the fibrewise assertion.

**Proof.**

1. Mark the vertical product edges of W in the fibres of C⊗.
2. Localize the total space over Fin_* and use inert/product compatibility to prove the Segal equivalences.
3. Verify universal properties after arbitrary base change; distinguish the strong and lax subcategories.

**Direct prerequisites.**

- [`E5:abstract/monoidal-categories-over-an-operad`](#n-e5-abstract-monoidal-categories-over-an-operad) — Monoidal categories over an operad
- [`E0/limits-colimits-and-slices`](#n-e0-limits-colimits-and-slices) — The simplicial join

**Sources.**

- [On topological cyclic homology](#src-e5-ns18), Definitions A.1–A.4 and Proposition A.5, pp. 128–130. Constructs the symmetric monoidal localization when tensor preserves the marked morphisms, including the lax universal property and compatibility over the operadic base.

**Acceptance.**

- Localizing only equivalences recovers C and its unit.
- Restriction on both strong and lax functor categories is fully faithful and its essential image inverts each specified W-map; check inert as well as nullary operations.
- For any K→N(Fin_*), the operadic localization comparison after pullback is an equivalence.

<a id="n-e5-abstract-monoidal-model-category-localization"></a>
#### Monoidal localization of a model category

`E5:abstract/monoidal-model-category-localization` · theorem

A symmetric monoidal model category satisfying the pushout-product and unit axioms has a symmetric monoidal infinity-localization. The localization of cofibrant objects computes the derived tensor and is strongly monoidally equivalent to the underlying Dwyer–Kan localization with this derived structure. The map from the category of all objects is lax monoidal and initial among lax monoidal functors inverting weak equivalences. This operadic localization is compatible with base change over Fin_*. If the original unit is not cofibrant, the derived unit is represented by its cofibrant replacement; no strong all-object localization map is asserted.

**Hypotheses.**

- The model structure and Quillen tensor hypotheses must be supplied for each application.
- Tensor need not preserve weak equivalences between all objects; cofibrant replacements are indispensable.

**Proof.**

1. Apply tensor-compatible localization to cofibrant objects; the pushout-product axiom and Ken Brown argument give weak-equivalence preservation there. A cofibrant replacement of the unit supplies the derived nullary operation.
2. Use the unit axiom and cofibrant replacement to identify the all-object localization.
3. Construct the lax all-object comparison and verify its universal property on each fibre.

**Direct prerequisites.**

- [`E5:abstract/monoidal-dwyer-kan-localization`](#n-e5-abstract-monoidal-dwyer-kan-localization) — Symmetric monoidal Dwyer–Kan localization

**Sources.**

- [On topological cyclic homology](#src-e5-ns18), Theorem A.7, pp. 130–131. Passes from a symmetric monoidal model category to its coherent localization, distinguishing the cofibrant strong presentation from the all-object lax map.

**Acceptance.**

- For chain complexes, tensor on cofibrant replacements computes derived tensor; ordinary tensor on arbitrary nonflat complexes cannot replace it.
- With a noncofibrant unit, its replacement still maps to the derived tensor unit.
- The all-object localization supplies lax tensor and unit maps; an unsupported strong all-object comparison fails the specification.

<a id="n-e5-abstract-left-derivable-cocartesian-families"></a>
#### Derived cocartesian families

`E5:abstract/left-derivable-cocartesian-families` · construction

For a cocartesian fibration X→S over a small infinity-category, with vertical marked weak equivalences, call it left derivable when every transition has an absolute left derived functor, described as an absolute right Kan extension along the source localization, and the derived-composition comparisons are equivalences for all 2-simplices. Localizing X fibrewise gives a cocartesian fibration over S, with those derived transitions, compatible with base change by any small infinity-category K→S. The localization preserves original cocartesian lifts over a transition that preserves the marked weak equivalences; this is a sufficient condition, not a necessity assertion.

**Hypotheses.**

- Left derived is the source-localization right-Kan convention of NS A.8.
- S and every base-change K are small infinity-categories. E0 supplies restricted diagram shapes; the present construction requires the Cat∞ gluing argument for general S.

**Construction.**

1. Extend restricted straightening by NS A.16–A.17: points and intervals generate Cat∞ under colimits, cocartesian families glue along those categorical colimits, and pullback preserves the gluing. A strict colimit of raw simplicial sets is not substituted for that colimit.
2. Localize fibres and derive transitions using E3 Kan extensions.
3. Use the absolute property and the 2-simplex comparisons to assemble a coherent functor S→Cat∞.
4. Apply NS A.14–A.15 to identify the total localization and its base-change comparison.

**Direct prerequisites.**

- [`E0/cocartesian-fibrations-and-restricted-straightening`](#n-e0-cocartesian-fibrations-and-restricted-straightening) — Restricted straightening and sections
- [`E3/left-kan-extension-along-a-full-inclusion`](#n-e3-left-kan-extension-along-a-full-inclusion) — Left Kan extension along a full inclusion
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations
- [`E0/higher-category-carrier`](#n-e0-higher-category-carrier) — The infinity category of small categories

**Sources.**

- [On topological cyclic homology](#src-e5-ns18), Definition A.8, pp. 131–132; Proposition A.14, Corollary A.15, pp. 134–135; Lemmas A.16–A.17, pp. 136–137. States fibrewise localization and base-change compatibility under absolute derivation and coherent composition; the later lemmas provide the required arbitrary-base straightening input.

**Uses that shape the API.**

- NS18, Appendix A: Derives coherent diagram transports without pretending underived transition functors preserve weak equivalences.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `DerivedFamilyData` | data | Base, total space, projection and localized fibres; full derivability conditions are additional. | included |
| `derivedFamily` | constructor | The localized cocartesian family with derived transports. | included |
| `derivedFamilyBaseChange` | compatibility | Pullback of the derived family equals deriving the pulled-back family. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `DerivedFamilyData.test_point` | degenerate | Over a point the construction is the fibre localization. | included |
| `DerivedFamilyData.test_interval` | characterisation | Over Δ¹ the transition is the derived transition, not the underived functor. | included |
| `DerivedFamilyData.test_identity` | degenerate | For identity weak-equivalence classes the localized family is equivalent to the original one. | included |

**Acceptance.**

- Over a point the construction is the fibre localization.
- Over Δ¹ the transition is the derived transition, not the underived functor.
- For identity weak-equivalence classes the localized family is equivalent to the original one.

**Open obligations:** gap [G5.1](#gap-g5-1) (Refine abstract supplier dependencies across parts); request [R5.6](#req-r5-6) to `EnhancedDerivedSheaves:E3`; request [R5.7](#req-r5-7) to `EnhancedDerivedSheaves:E0`.

<a id="n-e5-abstract-stable-tensor-ideals"></a>
#### Stable subcategories and tensor ideals

`E5:abstract/stable-tensor-ideals` · definition

A stable subcategory D⊆C is a full subcategory closed under zero objects, fibers and cofibers; it need not be closed under retracts. In a stable monoidal C with separately exact tensor, it is a tensor ideal if X⊗Y lies in D whenever X lies in C and Y lies in D. The thick tensor ideal adds closure under retracts. For commutative A→B, the thick tensor ideal generated by B is taken in Mod_A(C), not in C unless A is the unit.

**Hypotheses.**

- C is stable; tensor-ideal statements require separately exact symmetric tensor.
- Keep stable, thick and localizing closure distinct.

**Construction.**

1. Use E0 stable full-subcategory operations and the existing object-property carrier.
2. Define the closures by intersection and derive inclusions and induction principles.
3. Tensor ideals and thick closure are used in quotient kernels and descendability.

**Direct prerequisites.**

- [`E0/stable-api-and-the-sign-comparison`](#n-e0-stable-api-and-the-sign-comparison) — The stable API, and the comparison of shifts and cone signs with the cochain convention
- [`E5:abstract/module-objects`](#n-e5-abstract-module-objects) — Modules and extension of scalars

**Sources.**

- [On topological cyclic homology](#src-e5-ns18), Definition I.3.2, p. 18. Defines stable subcategories separately from retract closure and requires the tensor-ideal condition for the monoidal Verdier quotient.
- [The Galois group of a stable homotopy theory](#src-e5-mathew), Definition 3.18, p. 19. Uses the thick tensor ideal generated by an algebra to define descendability; retract closure is essential.

**Uses that shape the API.**

- NS18, Theorem I.3.6: The quotient tensor needs an ideal.
- BS17, Definition 11.14: Descendability is thick tensor generation of the unit.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `stableClosure` | constructor | Smallest full stable subcategory containing the given objects. | included |
| `thickTensorClosure` | constructor | Closure additionally under retracts and tensoring with arbitrary objects. | included |
| `tensorIdealInduction` | characterisation | Any full thick tensor ideal containing the generators contains their thick tensor closure. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `stableClosure.test_zero` | degenerate | The thick tensor closure of zero contains only zero objects. | included |
| `stableClosure.test_unit` | characterisation | The thick tensor closure of the tensor unit is all of C. | included |
| `stableClosure.test_retract` | characterisation | Any retract of a generating object belongs to its thick tensor closure. | included |

**Acceptance.**

- The thick tensor closure of zero contains only zero objects.
- The thick tensor closure of the tensor unit is all of C.
- Any retract of a generating object belongs to its thick tensor closure.

<a id="n-e5-abstract-verdier-quotient"></a>
#### Verdier quotient of a small stable infinity-category

`E5:abstract/verdier-quotient` · construction

For small stable C and full stable D⊆C, C/D is the Dwyer–Kan localization at maps with cofiber in D. It is stable and universal for exact functors C→E annihilating D. For X,Y∈C its mapping space is the filtered colimit over maps Z→Y with Z∈D of Map_C(X,cofib(Z→Y)). The kernel on objects is the retract closure of D, rather than D itself when D is not thick. If D is a tensor ideal and tensor is separately exact, the quotient is symmetric monoidal with the analogous universal property for exact lax monoidal functors.

**Hypotheses.**

- No compact-generation assumption is used.
- Idempotent completion of the quotient is a separate construction.

**Construction.**

1. Invert maps with cofiber in D; identify their calculus through the filtered approximation of Y by cofibers of Z→Y.
2. Use the formula to establish mapping-space universality and stability.
3. Apply monoidal localization to an ideal; derive the lax monoidal universality, preserving the distinction from strong maps.

**Direct prerequisites.**

- [`E5:abstract/stable-tensor-ideals`](#n-e5-abstract-stable-tensor-ideals) — Stable subcategories and tensor ideals
- [`E5:abstract/monoidal-dwyer-kan-localization`](#n-e5-abstract-monoidal-dwyer-kan-localization) — Symmetric monoidal Dwyer–Kan localization
- [`E0/limits-colimits-and-slices`](#n-e0-limits-colimits-and-slices) — The simplicial join

**Sources.**

- [On topological cyclic homology](#src-e5-ns18), Theorems I.3.3 and I.3.6, pp. 18–23. Constructs the stable quotient, computes its mapping spaces from cofiber approximations and supplies the exact and monoidal universal properties.

**Uses that shape the API.**

- RefinedTraceMethods:RT.5: Imports the quotient formalism; trace-specific arguments are not prerequisites.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `verdierQuotient` | constructor | The stable localization C/D. | included |
| `verdierProjection` | data | The exact localization map. | included |
| `verdierRestriction` | universal-property | Exact functors out of C/D are exact functors out of C killing D. | included |
| `verdierMapping` | characterisation | Mapping spaces are the filtered cofiber approximation stated above. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `verdierQuotient.test_zero` | degenerate | C/0 is equivalent to C. | included |
| `verdierQuotient.test_all` | degenerate | C/C is the zero stable category. | included |
| `verdierQuotient.test_suspension` | characterisation | q(ΣX) ≃ ΣqX. | included |

**Acceptance.**

- C/0 is equivalent to C.
- C/C is the zero stable category.
- q(ΣX) ≃ ΣqX.

<a id="n-e5-abstract-barr-beck-lurie"></a>
#### Barr–Beck–Lurie monadicity

`E5:abstract/barr-beck-lurie` · theorem

For F:C⇄D:G with unit and counit, let T=GF be the coherent monad on C. The comparison D→LMod_T(C) is an equivalence precisely when G is conservative and D admits geometric realizations of G-split simplicial objects which G preserves. Split refers to the augmented simplicial diagram after applying G. The algebra comparison preserves the forgetful functor to C.

**Hypotheses.**

- The coherent adjunction is imported from E3.
- Preservation of all colimits is sufficient in applications but is not the criterion’s hypothesis.

**Proof.**

1. Construct the coherent monad and comparison from the unit and counit.
2. Use the split augmented bar resolution and conservativity to prove full faithfulness and essential surjectivity.
3. Apply the exact G-split realization condition; do not replace it by unqualified preservation of arbitrary limits.

**Direct prerequisites.**

- [`E3/adjoint-functor-theorem-and-localisations`](#n-e3-adjoint-functor-theorem-and-localisations) — The enhanced adjoint functor theorem
- [`E5:abstract/algebra-objects`](#n-e5-abstract-algebra-objects) — Operadic algebras
- [`E0/limits-colimits-and-slices`](#n-e0-limits-colimits-and-slices) — The simplicial join
- `mathlib:CategoryTheory.Functor.ReflectsIsomorphisms`

**Sources.**

- [Higher Algebra](#src-e5-lurie-ha), Theorem 4.7.3.5, p. 685. Gives the conservative-right-adjoint and split-realization criterion for the monadic comparison equivalence.

**Acceptance.**

- For the free/forgetful adjunction on modules, the monadic comparison commutes with the forgetful functor.
- For the identity adjunction, the monad is the identity and its module category recovers C.
- Use G-split realizations and conservativity separately; neither condition can be discarded in the comparison.

<a id="n-e5-abstract-descendable-algebras"></a>
#### Descendable algebras and finite index

`E5:abstract/descendable-algebras` · definition · planet: **Descendable algebras**

In a presentable stable symmetric monoidal C whose tensor preserves colimits separately, A→B is descendable when A belongs to the thick tensor ideal generated by B in Mod_A(C). Write I=fib(A→B). It has index at most m when the natural map I^⊗_A m→A is nullhomotopic. Descendability is equivalent to such a finite m and to the augmented Amitsur totalization tower being pro-isomorphic to the constant A tower. Its definition uses finite thick generation, not merely recovery of the completed unit by the infinite totalization.

**Hypotheses.**

- m is a nonnegative integer; m=0 forces the unit A to be zero.
- Nullhomotopy is a nullhomotopy of the map, stronger than vanishing on cohomology.

**Construction.**

1. Define the augmentation fibre and its tensor powers in Mod_A(C).
2. Relate the cubical bar tower to the cosimplicial partial-totalization tower by a pro-comparison.
3. Use nilpotence of the augmentation maps to prove finite-index ⇔ thick generation ⇔ pro-constant Amitsur tower.

**Direct prerequisites.**

- [`E5:abstract/module-objects`](#n-e5-abstract-module-objects) — Modules and extension of scalars
- [`E5:abstract/stable-tensor-ideals`](#n-e5-abstract-stable-tensor-ideals) — Stable subcategories and tensor ideals
- [`E0/stable-api-and-the-sign-comparison`](#n-e0-stable-api-and-the-sign-comparison) — The stable API, and the comparison of shifts and cone signs with the cochain convention
- [`E2/pro-towers`](#n-e2-pro-towers) — Ordinary pro-zero towers and pro-isomorphisms
- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula
- [`E5:presentability/presentable-categories`](#n-e5-presentability-presentable-categories) — Presentable infinity-categories

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e5-bs17), Definitions 11.14 and 11.18, p. 43; Lemma 11.20, p. 44. Defines finite tensor nilpotence, characterizes it by thick generation and compares it with the pro-constant Amitsur tower.
- [The Galois group of a stable homotopy theory](#src-e5-mathew), Definition 3.18 and Proposition 3.20, pp. 19–20. Defines descendability by thick tensor generation and derives the finite nilpotence criterion.

**Uses that shape the API.**

- BS17, Theorem 11.15: Finite nilpotence supplies coherent module descent.
- BM26, item 47: Descendability is categorical, independent of later concrete spectra.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `descendable` | characterisation | The thick tensor generation criterion in Mod_A(C). | included |
| `descendabilityIndex` | characterisation | The canonical augmentation-fibre tensor-power map is nullhomotopic. | included |
| `amitsurTower` | data | The coherent tower of finite Amitsur totalizations, with augmentation. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `descendable.test_identity` | degenerate | An identity algebra map has index at most one. | included |
| `descendable.test_zero_index` | non-example | Index at most zero forces A=0. | included |
| `descendable.test_completion` | non-example | ℤ_p→𝔽_p is not descendable, although its Amitsur completion recovers the p-complete unit. | included |

**Acceptance.**

- An identity algebra map has index at most one.
- Index at most zero forces A=0.
- ℤ_p→𝔽_p is not descendable, although its Amitsur completion recovers the p-complete unit.

**Open obligations:** gap [G5.2](#gap-g5-2) (Amitsur tower and general uniform-index proof input); request [R5.2](#req-r5-2) to `EnhancedDerivedSheaves:E2`; request [R5.3](#req-r5-3) to `EnhancedDerivedSheaves:E4`.

<a id="n-e5-abstract-module-descent-and-functoriality"></a>
#### Module descent and permanence of descendability

`E5:abstract/module-descent-and-functoriality` · theorem

For descendable A→B, Mod_A(C) → lim_[n] Mod_(B^⊗_A(n+1))(C) is a symmetric monoidal equivalence along extension-of-scalars transitions. Descendability is preserved by composition, by passage to an intermediate algebra, and by exact strong monoidal functors. Cocontinuous lax monoidal functors preserve a specified finite index after applying their algebra and module structure maps. For a finite simplicial diagram of presentably stable symmetric monoidal categories, a commutative algebra in its limit is descendable if and only if its evaluations at every vertex are descendable. Extension of scalars along a descendable map is conservative.

**Hypotheses.**

- All limits of module categories are coherent limits.
- For the finite-limit statement use a finite simplicial indexing set; arbitrary inverse limits are not asserted.

**Proof.**

1. Use the finite index to show the augmented Amitsur resolutions are effective for every module.
2. Apply the dual Barr–Beck–Lurie criterion to extension of scalars, whose conservativity follows from finite thick generation; the finite-index Amitsur resolution supplies the required split-totalization preservation.
3. Prove composition and intermediate-algebra assertions by induction through thick ideals.
4. Transport the canonical augmentation-power nullhomotopy under the functor. For finite limits of categories use the pointwise detection of a pro-constant bar tower (Mathew Proposition 3.25); for conservativity use the thick-generation argument.

**Direct prerequisites.**

- [`E5:abstract/descendable-algebras`](#n-e5-abstract-descendable-algebras) — Descendable algebras and finite index
- [`E5:abstract/barr-beck-lurie`](#n-e5-abstract-barr-beck-lurie) — Barr–Beck–Lurie monadicity
- [`E5:abstract/module-objects`](#n-e5-abstract-module-objects) — Modules and extension of scalars
- [`E5:presentability/limits-of-presentable-categories`](#n-e5-presentability-limits-of-presentable-categories) — Limits in PrL

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e5-bs17), Theorem 11.15 and Lemma 11.17, p. 43; Lemma 11.20, p. 44. Gives module descent and the permanence of a specified finite descendability index under the stated algebra operations and monoidal functors.
- [The Galois group of a stable homotopy theory](#src-e5-mathew), Propositions 3.19, 3.22, 3.24–3.25 and 3.27; Corollary 3.21; Definition 3.26, pp. 19–22. Proves module descent and permanence; Proposition 3.25 tests descendability pointwise in a finite limit of categories, rather than under arbitrary finite limits of algebra objects.

**Acceptance.**

- For A→A the Amitsur diagram is constant and its limit recovers Mod_A.
- Extension of scalars along a descendable A→B detects zero modules; compatible unit objects and relative tensor products descend.
- The sequence ℤ_p→𝔽_p recovers the completed unit by totalization but is not descendable, so it cannot pass the finite thick-generation test.

<a id="n-e5-abstract-uniform-index-colimits"></a>
#### Uniform index and categorical descendability examples

`E5:abstract/uniform-index-colimits` · theorem

Fix a presentably stable symmetric monoidal category C and A∈CAlg(C), with tensor preserving colimits separately. Let I be a small filtered ordinary category such that derived inverse limits of Iᵒᵖ-diagrams of spectra have finite cohomological dimension. A coherent diagram of A-algebras B_i with every A→B_i of descendability index at most the same m has descendable colimit map A→colim_i B_i. For I=ℕ, index at most 2m suffices. Without a uniform bound this can fail. For ordinary rings, nilpotent ideal quotients are descendable, while a locally nilpotent ideal quotient need not be. A faithfully flat map with countably presented target algebra is descendable. If its source is Noetherian Gorenstein of Krull dimension d, a faithfully flat target has index at most d+1.

**Hypotheses.**

- The source algebra A is fixed throughout the diagram. The finite cohomological dimension is a condition on derived limits of spectra over Iᵒᵖ, and the index bound is uniform in i.
- Countably presented means both generators and relations, not merely countably generated.
- For I=ℕ the BS proof gives a bound 2m through the vanishing of lim²; no quantitative bound for arbitrary I is asserted here.

**Proof.**

1. For sequential diagrams apply the multiplicative derived-limit filtration to the powers of the augmentation map; two filtration-one maps have zero composite.
2. For finite-cohomological-dimension I use the finite derived-limit filtration and multiplicativity; isolate this general tower input in the recorded gap.
3. Apply the augmentation-fibre nilpotence criterion to nilpotent quotients and BS’s locally-nilpotent counterexample.
4. Import E1’s ordinary Ext/projective-dimension statements to obtain the Gorenstein bound; use Mathew Corollary 3.33 for countable presentations.

**Direct prerequisites.**

- [`E5:abstract/descendable-algebras`](#n-e5-abstract-descendable-algebras) — Descendable algebras and finite index
- [`E1`](#layer-e1) (layer of this roadmap)
- [`E2`](#layer-e2) (layer of this roadmap)
- [`E5:abstract/module-descent-and-functoriality`](#n-e5-abstract-module-descent-and-functoriality) — Module descent and permanence of descendability
- [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) — Coherent inverse towers and the product–difference formula

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e5-bs17), Examples 11.19 and 11.21; Lemma 11.22; Remark 11.24, pp. 44–45. Proves the sequential uniform-index bound and records nilpotent, Gorenstein and countability applications; the general finite-cohomological-dimension filtration input remains explicit.
- [The Galois group of a stable homotopy theory](#src-e5-mathew), Corollary 3.33, p. 24. Gives faithful-flat descendability for a target with countably many generators and relations; countable generation alone is not the cited hypothesis.

**Acceptance.**

- For a sequential diagram over one A, the same index m works at every stage and yields the bound 2m on the colimit.
- For A=𝔽_p[x₁,x₂,…]/(x₁²,x₂³,…) and I=(x₁,x₂,…), every finite-generator subideal is nilpotent, but I is not nilpotent and A→A/I is not descendable. This detects removal of the uniform bound.
- Identity maps have index at most 1; zero source unit allows index 0, so no convention silently excludes the degenerate case.

**Open obligations:** gap [G5.2](#gap-g5-2) (Amitsur tower and general uniform-index proof input); request [R5.1](#req-r5-1) to `EnhancedDerivedSheaves:E1`; request [R5.2](#req-r5-2) to `EnhancedDerivedSheaves:E2`.

<a id="n-e5-abstract-formal-tensor-inversion"></a>
#### Formal inversion of a tensor object

`E5:abstract/formal-tensor-inversion` · construction

For presentably symmetric monoidal C and X∈C, C[X⁻¹] is initial among presentably symmetric monoidal categories receiving a colimit-preserving strong monoidal functor from C in which X becomes tensor invertible. For a presentable C-module M its base change M⊗_C C[X⁻¹] is the universal inversion of X on M. If the cyclic permutation of X⊗X⊗X is homotopic to the identity, its underlying presentable category is the colimit in PrL of the telescope M→M→⋯ with transition X⊗−. Without this symmetric-object hypothesis the telescope formula is not asserted.

**Hypotheses.**

- Universes and presentability are fixed.
- The cyclic symmetry is a coherent homotopy condition, not equality in an ordinary Grothendieck group.

**Construction.**

1. Construct the inversion as a localization in commutative algebra objects of PrL.
2. Base change modules along its universal map.
3. Apply Robalo’s symmetric-object argument to identify the telescope, checking the permutation hypothesis.

**Direct prerequisites.**

- [`E5:abstract/algebra-objects`](#n-e5-abstract-algebra-objects) — Operadic algebras
- [`E5:abstract/module-objects`](#n-e5-abstract-module-objects) — Modules and extension of scalars
- [`E3/adjoint-functor-theorem-and-localisations`](#n-e3-adjoint-functor-theorem-and-localisations) — The enhanced adjoint functor theorem
- [`E5:presentability/presentable-categories`](#n-e5-presentability-presentable-categories) — Presentable infinity-categories

**Sources.**

- [K-theory and the bridge from motives to noncommutative motives](#src-e5-robalo), Proposition 4.10, pp. 75–76; Definition 4.18, p. 88; Proposition 4.21, p. 90; Remark 4.23, p. 91; Corollary 4.24, p. 92. Constructs presentable tensor inversion and its module base change; the telescope calculation requires the cyclic symmetry condition on the inverted object.

**Uses that shape the API.**

- BM26, item 47: Imports formal categorical tensor inversion; motive-specific objects belong to the Berkovich continuation.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `tensorInversion` | constructor | The universal presentable symmetric monoidal inversion. | included |
| `tensorInversionMap` | data | The colimit-preserving strong monoidal universal map. | included |
| `tensorInversionUniversal` | universal-property | Restriction identifies colimit-preserving strong monoidal functors with those carrying X to an invertible object. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `tensorInversion.test_unit` | degenerate | Inverting the unit changes C by an equivalence. | included |
| `tensorInversion.test_zero` | degenerate | Inverting zero in a stable C gives the zero category. | included |
| `tensorInversion.test_idempotent` | characterisation | Inverting the already inverted object again changes nothing. | included |

**Acceptance.**

- Inverting the unit changes C by an equivalence.
- Inverting zero in a stable C gives the zero category.
- Inverting the already inverted object again changes nothing.


<a id="layer-e5-presentability"></a>

### E5:presentability — Presentable categories, Ind-completion and extensions

Compactness is preservation of κ-filtered colimits by the mapping space;
Ind_κ(C) consists of κ-filtered colimits of representables, and its universal
property extends functors along Yoneda. A finite-colimit-preserving functor
with presentable target extends to an all-colimit-preserving functor only in
the ω case; larger κ needs κ-small colimits. Ind of a small stable category is
stable, with a tensor that preserves colimits separately. Presentable
categories form PrL, whose limits are computed in Cat∞ and whose tensor
product represents functors preserving colimits separately; module base
change and Ind of a Verdier quotient follow, and Neeman's criterion relates
compact objects and coproduct-preserving right adjoints.

Coherent actions of a finite group are functors BG → Cat∞, with fixed points
as limits; profinite actions are pulled back from a specified finite quotient,
and the discrete continuous modules of Tau Ceti's ProfiniteCohomology give the
coefficient case. No filtered-colimit formula for categorical fixed points of
a general profinite action is asserted (gap [G5.4](#gap-g5-4)). Compact
morphisms, dualizable and compactly assembled categories (which need not be
compactly generated), strongly continuous filtered colimits, trace-class maps
and locally rigid categories serve the trace and Berkovich-motive consumers.

<a id="n-e5-presentability-compact-objects"></a>
#### Compact objects

`E5:presentability/compact-objects` · definition · planet: **Compact objects**

For regular κ, an object x of C is κ-compact if Map_C(x,−) preserves κ-filtered colimits. Compact means ω-compact. Write C^κ for the full subcategory. In a presentable stable C, compact generation means a small set of compact objects whose shifts detect zero. Finite colimits and retracts of compact objects are compact. Compactness is a mapping-space condition, not merely finite generation of the cohomology groups.

**Hypotheses.**

- C admits the indicated filtered colimits.
- Use universes where C^κ is essentially small when forming its Ind-completion.

**Construction.**

1. Apply E0 mapping spaces to the canonical filtered-colimit comparison.
2. Identify the full subcategory by this preservation property.
3. For stable C use finite-limit commutation in spaces and the suspension equivalence.

**Direct prerequisites.**

- [`E0/right-mapping-space`](#n-e0-right-mapping-space) — Right mapping space
- [`E0/limits-colimits-and-slices`](#n-e0-limits-colimits-and-slices) — The simplicial join
- [`E0/stable-api-and-the-sign-comparison`](#n-e0-stable-api-and-the-sign-comparison) — The stable API, and the comparison of shifts and cone signs with the cochain convention

**Sources.**

- [Higher Topos Theory](#src-e5-lurie-htt), Definition 5.3.4.5, printed p. 396 (PDF p. 414). Defines compactness using preservation of filtered colimits by mapping spaces, rather than finite generation of cohomology.

**Uses that shape the API.**

- FS21, Lemma IV.2.20: Compact objects test preservation of coproducts by right adjoints.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `compactObjects` | constructor | The full subcategory of ω-compact objects. | included |
| `compactMappingComparison` | characterisation | Map(x,colim y_i) ≃ colim Map(x,y_i) for x compact and the indexing diagram filtered. | included |
| `compactRetract` | structure | Retracts of compact objects are compact. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `compactObjects.test_zero` | degenerate | Zero is compact in any stable C. | included |
| `compactObjects.test_ring` | compatibility | R in D(R) is compact and its shifts detect zero. | included |
| `compactObjects.test_infinite_sum` | non-example | The countable direct sum of copies of a nonzero field is not compact in its derived category. | included |

**Acceptance.**

- Zero is compact in any stable C.
- R in D(R) is compact and its shifts detect zero.
- The countable direct sum of copies of a nonzero field is not compact in its derived category.

<a id="n-e5-presentability-ind-completion"></a>
#### Ind-completion

`E5:presentability/ind-completion` · construction · planet: **Ind-completion**

Ind_κ(C) is the full subcategory of P(C)=Fun(Cop,Spaces) spanned by κ-filtered colimits of representables. Yoneda lands in it and is fully faithful; the representables are κ-compact, and every object has a κ-filtered presentation. For a small idempotent-complete C with finite colimits, Ind(C) is compactly generated and its compact objects recover C. On ordinary C the 0-truncated presheaf part compares with Mathlib’s set-valued Ind(C); it is not an unconditional equivalence with the full space-valued completion.

**Hypotheses.**

- C is small in the input universe.
- For κ>ω the generation equivalence uses the relevant κ-small colimits; the finite-colimit formulation here is for ω.

**Construction.**

1. Use E3 presheaf Yoneda and select filtered colimits of representables.
2. Prove full faithfulness, compactness and filtered presentation using the mapping-space formula.
3. Identify compact objects as retracts of representables under the finite-colimit hypotheses.

**Direct prerequisites.**

- [`E5:presentability/compact-objects`](#n-e5-presentability-compact-objects) — Compact objects
- [`E3/left-kan-extension-along-a-full-inclusion`](#n-e3-left-kan-extension-along-a-full-inclusion) — Left Kan extension along a full inclusion
- `mathlib:CategoryTheory.Ind`

**Sources.**

- [Higher Topos Theory](#src-e5-lurie-htt), Definition 5.3.5.1, printed p. 403; Propositions 5.3.5.10–11, printed pp. 406–407. Constructs the space-valued filtered completion and gives compactness, generation and extension criteria for the Yoneda image.

**Uses that shape the API.**

- NS18, Proposition I.3.5: The large quotient is the Ind extension of the small quotient.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `indCompletion` | constructor | The space-valued filtered-colimit completion. | included |
| `indYoneda` | data | The fully faithful representable embedding. | included |
| `indCompactComparison` | equivalence | For small stable idempotent-complete C, compact objects of Ind(C) are C. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `indCompletion.test_terminal` | degenerate | Ind(*) is terminal. | included |
| `indCompletion.test_compacts` | characterisation | For small stable idempotent-complete C, the compact comparison is an equivalence. | included |
| `indCompletion.test_discrete` | computation | For an ordinary discrete category, no filtered presentation creates a new connected component. | included |

**Acceptance.**

- Ind(*) is terminal.
- For small stable idempotent-complete C, the compact comparison is an equivalence.
- For an ordinary discrete category, no filtered presentation creates a new connected component.

**Open obligations:** gap [G5.1](#gap-g5-1) (Refine abstract supplier dependencies across parts); request [R5.6](#req-r5-6) to `EnhancedDerivedSheaves:E3`.

<a id="n-e5-presentability-universal-property-of-ind"></a>
#### The universal property of Ind

`E5:presentability/universal-property-of-ind` · theorem

For small C and D admitting κ-filtered colimits, restriction along Yoneda gives Fun_κ(Ind_κ(C),D) ≃ Fun(C,D). The extension sends a filtered presentation colim_i y(c_i) to colim_i F(c_i), independently of the presentation. For κ=ω, if C has finite colimits, D is presentable and F preserves finite colimits, its Ind extension preserves all small colimits. For larger κ, the corresponding criterion requires κ-small colimits and their preservation, rather than finite colimits alone. The extension is an equivalence exactly when the input is fully faithful, its objects are κ-compact in D, and they κ-filtered-generate D.

**Hypotheses.**

- The equivalence criterion refers to the stated fully faithful input, not an arbitrary functor.

**Proof.**

1. Apply the E3 full-inclusion left Kan extension to Yoneda.
2. Use filtered presentations to prove evaluation and uniqueness on mapping spaces.
3. Use compactness to prove full faithfulness of the extension, then generation for essential surjectivity.
4. For ω, use the finite-colimit completion property and filtered-colimit preservation to obtain all colimits. In the presentable κ-accessible case apply HTT 5.5.1.9 with κ-small colimits of compact objects; do not substitute finite colimits at larger κ.

**Direct prerequisites.**

- [`E5:presentability/ind-completion`](#n-e5-presentability-ind-completion) — Ind-completion
- [`E3/left-kan-extension-along-a-full-inclusion`](#n-e3-left-kan-extension-along-a-full-inclusion) — Left Kan extension along a full inclusion

**Sources.**

- [Higher Topos Theory](#src-e5-lurie-htt), Propositions 5.3.5.10–11, printed pp. 406–407 (PDF pp. 424–425); Proposition 5.5.1.9, printed pp. 461–462 (PDF pp. 479–480). Proves extension from the small category to filtered-colimit-preserving functors and the compact-generation criterion for that extension to be an equivalence.
- [Higher Algebra](#src-e5-lurie-ha), Corollary 4.8.1.14(2), pp. 711–712. Its ω-Ind universal property identifies finite-colimit-preserving inputs with all-colimit-preserving extensions for presentable targets; the statement is explicitly the ordinary filtered, rather than arbitrary κ-filtered, completion.

**Acceptance.**

- Restriction of the extension of F is naturally equivalent to F; two filtered presentations of one Ind-object give the same mapping-space comparison.
- For an idempotent-complete small stable C, compact objects of Ind(C) recover C.
- The extension-equivalence criterion fails if its generators are not compact, even when they generate under colimits.

**Open obligations:** gap [G5.1](#gap-g5-1) (Refine abstract supplier dependencies across parts); request [R5.6](#req-r5-6) to `EnhancedDerivedSheaves:E3`.

<a id="n-e5-presentability-ind-of-a-stable-category-is-stable"></a>
#### Stable and monoidal Ind-completion

`E5:presentability/ind-of-a-stable-category-is-stable` · theorem

For small stable C, Ind_κ(C) is stable and Yoneda is exact. For small symmetric monoidal C, Ind(C) has a symmetric monoidal structure whose tensor preserves filtered colimits separately and extends C’s tensor. If C is stable and tensor exact separately, this tensor preserves all colimits separately. Exact strong monoidal functors on C extend to colimit-preserving strong monoidal functors on Ind(C); uniqueness includes their coherent monoidal structure.

**Hypotheses.**

- The monoidal colimit-preservation conclusion needs stability and exactness, not just existence of tensor.

**Proof.**

1. Express arrows as filtered colimits of arrows in C and compute their cofibers.
2. Use finite-limit commutation with filtered colimits in spaces to identify fibers.
3. Apply the monoidal free-colimit completion in HA 4.8.1.14; check finite cofiber compatibility to upgrade filtered preservation to all colimits.

**Direct prerequisites.**

- [`E5:presentability/ind-completion`](#n-e5-presentability-ind-completion) — Ind-completion
- [`E5:presentability/universal-property-of-ind`](#n-e5-presentability-universal-property-of-ind) — The universal property of Ind
- [`E5:abstract/symmetric-monoidal-infinity-category`](#n-e5-abstract-symmetric-monoidal-infinity-category) — Symmetric monoidal infinity-categories
- [`E0/stable-api-and-the-sign-comparison`](#n-e0-stable-api-and-the-sign-comparison) — The stable API, and the comparison of shifts and cone signs with the cochain convention

**Sources.**

- [Higher Algebra](#src-e5-lurie-ha), Proposition 1.1.3.6, p. 32; Corollary 4.8.1.14, pp. 711–712. Proves stability of Ind and extends the tensor by filtered colimits; separate exactness gives all-colimit preservation in the stable case.

**Acceptance.**

- The Ind Yoneda functor preserves the zero object, cofibers and the E0 suspension convention.
- Tensor of two filtered representable presentations is computed by the product filtered diagram, and the unit is the representable original unit.
- Separately exact tensor and filtered-colimit preservation imply arbitrary-colimit preservation in the stable completion.

<a id="n-e5-presentability-presentable-categories"></a>
#### Presentable infinity-categories

`E5:presentability/presentable-categories` · definition · planet: **Presentable categories**

C is presentable when it is accessible and admits all small colimits. Equivalently it is an accessible reflective localization of a presheaf infinity-category. PrL has these objects and colimit-preserving functors; PrR uses accessible right adjoints. Accessibility entails a regular cardinal and an essentially small subcategory of compact objects generating by that cardinal’s filtered colimits. Presentability alone does not assert compact generation at ω.

**Hypotheses.**

- Maintain the specified universe of small colimits.
- Representability and adjoint existence are supplied by E3, including the accessibility condition.

**Construction.**

1. Describe accessibility by the essentially small κ-compact subcategory and its filtered generation.
2. Construct the space-valued presheaf category using E0 functor/limit infrastructure; use HTT 5.5.1.1 to compare accessible presheaf localizations with the definition.
3. Define PrL and PrR by their coherent preservation/adjoint properties; E1’s concrete sheaf application imports this generic definition.

**Direct prerequisites.**

- [`E5:presentability/ind-completion`](#n-e5-presentability-ind-completion) — Ind-completion
- [`E5:presentability/compact-objects`](#n-e5-presentability-compact-objects) — Compact objects
- [`E0/limits-colimits-and-slices`](#n-e0-limits-colimits-and-slices) — The simplicial join

**Sources.**

- [Higher Topos Theory](#src-e5-lurie-htt), Definition 5.5.0.1, printed p. 456 (PDF p. 474); Theorem 5.5.1.1, printed pp. 457–460; Proposition 5.5.2.2, printed p. 463 (PDF p. 481). Defines accessible cocomplete categories and identifies them with accessible reflective localizations of presheaf categories. The representability test uses contravariant mapping spaces and preservation of limits in Cᵒᵖ.

**Uses that shape the API.**

- Diamonds, Lemma 17.1 and Proposition 26.2: The generic limit theorem is here; the geometric full subcategory and completion are consumers.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `PresentableData` | data | A category, a regular accessibility cardinal and a small generating subcategory; accessibility/colimit axioms are part of the full definition. | included |
| `presentableLeftFunctors` | data | Colimit-preserving coherent functors. | included |
| `presentableRightFunctors` | data | Accessible right adjoints. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `PresentableData.test_modules` | compatibility | The enhanced derived category of R-modules is presentable. | included |
| `PresentableData.test_terminal` | degenerate | The zero stable category is presentable. | included |
| `PresentableData.test_representability` | characterisation | A small-limit-preserving functor Cᵒᵖ→Spaces on a presentable C is represented by an object of C, as provided by E3’s criterion. | included |

**Acceptance.**

- The enhanced derived category of R-modules is presentable.
- The zero stable category is presentable.
- A small-limit-preserving presheaf P:Cᵒᵖ→Spaces is represented by some x through P≃Map_C(−,x). This checks both variance and the colimit-to-limit property.

**Open obligations:** gap [G5.1](#gap-g5-1) (Refine abstract supplier dependencies across parts); request [R5.6](#req-r5-6) to `EnhancedDerivedSheaves:E3`.

<a id="n-e5-presentability-limits-of-presentable-categories"></a>
#### Limits in PrL

`E5:presentability/limits-of-presentable-categories` · theorem

Every small diagram of presentable categories and colimit-preserving functors has a limit in PrL, and its underlying category is the limit in Cat∞. Colimits in that limit are detected and computed by the projections. In particular pullbacks of presentable colimit-preserving functors are presentable. The limit remains stable when the diagram categories are stable. This does not imply that an unrelated forgetful functor from a completed subcategory preserves colimits.

**Hypotheses.**

- The diagram is coherent in PrL, not a diagram of triangulated categories.

**Proof.**

1. Construct the Cat∞ limit using E0/E3 coherent diagrams.
2. Use the presentable pullback theorem and accessible-localization presentations to verify presentability.
3. Compute colimits pointwise and check the projection joint-detection property; stability follows from pointwise finite fibers and cofibers.

**Direct prerequisites.**

- [`E5:presentability/presentable-categories`](#n-e5-presentability-presentable-categories) — Presentable infinity-categories
- [`E0/limits-colimits-and-slices`](#n-e0-limits-colimits-and-slices) — The simplicial join
- [`E5:abstract/left-derivable-cocartesian-families`](#n-e5-abstract-left-derivable-cocartesian-families) — Derived cocartesian families

**Sources.**

- [Higher Topos Theory](#src-e5-lurie-htt), Propositions 5.5.3.12–13, printed pp. 469–470 (PDF pp. 487–488). Proves existence of small limits of presentable categories with colimit-preserving transition maps and identifies the underlying categorical limit.
- [Étale cohomology of diamonds](#src-e5-diamonds), Lemma 17.1, p. 96; Proposition 26.2, p. 162. Applies presentable limits to derived coefficient categories; those geometric applications remain downstream of the generic theorem.

**Acceptance.**

- The limit of a diagram over one point is its input; the empty limit is the terminal presentable category.
- In a pullback C×_E D of left adjoints, projections compute coproducts and cofibers componentwise.
- A completed-module inclusion into ambient modules can fail to preserve coproducts; this does not contradict the theorem, since that inclusion need not be a PrL map.

<a id="n-e5-presentability-tensor-product-and-module-base-change"></a>
#### Tensor products of presentable categories and module base change

`E5:presentability/tensor-product-and-module-base-change` · construction

For presentable C,D, C⊗D represents functors C×D→E preserving colimits separately: FunL(C⊗D,E) ≃ FunL,L(C×D,E). PrL is symmetric monoidal with unit Spaces; its stable subcategory has unit the abstract stabilization Sp, with no concrete spectral model required. For presentably monoidal C, a presentable right C-module M and algebra A∈C, M⊗_C RMod_A(C) ≃ RMod_A(M). Extension of scalars and these comparisons are coherent for compositions and units.

**Hypotheses.**

- The required geometric realizations exist and tensor actions preserve colimits separately.
- The relative tensor is categorical; distinguish it from an object’s derived tensor over a ring.

**Construction.**

1. Use HA’s separately-colimit universal property to construct C⊗D and its internal FunL category.
2. Realize the categorical two-sided bar construction for relative module tensors.
3. Evaluate the universal balanced functors on free A-modules to prove the module base-change comparison.

**Direct prerequisites.**

- [`E5:presentability/presentable-categories`](#n-e5-presentability-presentable-categories) — Presentable infinity-categories
- [`E5:abstract/module-objects`](#n-e5-abstract-module-objects) — Modules and extension of scalars
- [`E5:presentability/ind-of-a-stable-category-is-stable`](#n-e5-presentability-ind-of-a-stable-category-is-stable) — Stable and monoidal Ind-completion

**Sources.**

- [Higher Algebra](#src-e5-lurie-ha), Propositions 4.8.1.15 and 4.8.1.17, pp. 712–715; Theorem 4.8.4.6, p. 737. Gives the separately-colimit universal property of categorical tensor and the relative categorical module-tensor comparison for a right-tensored category.

**Uses that shape the API.**

- BM26, item 60: Dualizability and rigidity use the tensor of categories rather than tensor of coefficient modules.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `presentableTensor` | constructor | The separately-colimit-preserving tensor of categories. | included |
| `presentableTensorUniversal` | universal-property | The equivalence of colimit-preserving and separately colimit-preserving functors. | included |
| `categoricalModuleBaseChange` | compatibility | The relative categorical tensor agrees with the category of modules in M. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `presentableTensor.test_spaces` | degenerate | Spaces⊗C ≃ C for presentable C. | included |
| `presentableTensor.test_stable_unit` | degenerate | Sp⊗C ≃ C for presentable stable C. | included |
| `presentableTensor.test_zero` | degenerate | Zero⊗C is zero in PrL_st. | included |

**Acceptance.**

- Spaces⊗C ≃ C for presentable C.
- Sp⊗C ≃ C for presentable stable C.
- Zero⊗C is zero in PrL_st.

<a id="n-e5-presentability-ind-verdier-localization"></a>
#### Ind of a Verdier quotient

`E5:presentability/ind-verdier-localization` · theorem

For small stable C and full stable D, Ind(C)→Ind(C/D) is a localization with kernel Ind(D), interpreted by its fully faithful extension. Its right adjoint is fully faithful and preserves colimits; the right adjoint extends the quotient-Yoneda approximation C/D→Ind(C). The monoidal version exists for separately exact tensors and tensor ideals. Compact objects of the target are Idem(C/D), not C/D without an idempotent-completeness hypothesis.

**Hypotheses.**

- No retract closure hypothesis on D is necessary for the Ind localization statement.

**Proof.**

1. Extend the small quotient using the Ind universal property.
2. Use the mapping-space approximation to construct the right adjoint on quotient generators.
3. Extend it by colimits; verify the unit and counit on generators and identify the kernel.

**Direct prerequisites.**

- [`E5:abstract/verdier-quotient`](#n-e5-abstract-verdier-quotient) — Verdier quotient of a small stable infinity-category
- [`E5:presentability/universal-property-of-ind`](#n-e5-presentability-universal-property-of-ind) — The universal property of Ind
- [`E5:presentability/ind-of-a-stable-category-is-stable`](#n-e5-presentability-ind-of-a-stable-category-is-stable) — Stable and monoidal Ind-completion

**Sources.**

- [On topological cyclic homology](#src-e5-ns18), Proposition I.3.5, pp. 21–22. Identifies the kernel of the Ind-extended quotient and its fully faithful colimit-preserving right adjoint.

**Acceptance.**

- For D=0 the Ind localization is the identity; for D=C its target is zero.
- Objects of Ind(D) go to zero and the localization counit is invertible.
- Compact objects are the retract closure of C/D; a missing retract cannot be silently discarded.

<a id="n-e5-presentability-neeman-compactness-criterion"></a>
#### Compactness and right adjoints

`E5:presentability/neeman-compactness-criterion` · theorem · planet: **Neeman compactness criterion**

For F:C⇄D:G between presentable stable categories, if C is compactly generated then F preserves compact objects if and only if G preserves coproducts, equivalently all colimits. The forward direction tests the coproduct comparison against compact generators of C; the reverse uses the mapping-space adjunction. The general κ-accessible version replaces compact/coproduct preservation by κ-compact/κ-filtered preservation with the accessibility hypotheses of HTT 5.5.7.2.

**Hypotheses.**

- The source C of the left adjoint is compactly generated in the converse test; presentability alone is insufficient.
- G is already exact as a right adjoint between stable categories.

**Proof.**

1. Apply the adjunction to maps out of compact source generators.
2. Use detection by their shifts to identify the canonical coproduct comparison.
3. Use exactness plus coproduct preservation to obtain all colimits, and the adjunction to get preservation of compactness back.

**Direct prerequisites.**

- [`E5:presentability/compact-objects`](#n-e5-presentability-compact-objects) — Compact objects
- [`E5:presentability/presentable-categories`](#n-e5-presentability-presentable-categories) — Presentable infinity-categories
- [`E3/adjoint-functor-theorem-and-localisations`](#n-e3-adjoint-functor-theorem-and-localisations) — The enhanced adjoint functor theorem

**Sources.**

- [Higher Topos Theory](#src-e5-lurie-htt), Proposition 5.5.7.2, printed p. 501 (PDF p. 519). Gives the compact-object/right-adjoint-colimit correspondence with its accessibility hypotheses; the compactly generated stable specialization tests coproducts against generators.
- [Geometrization of the local Langlands correspondence](#src-e5-fs21), Lemma IV.2.20, pp. 123–124. Uses compact preservation to obtain preservation of sums by the right adjoint in the compactly generated derived setting.
- [Étale cohomology of diamonds](#src-e5-diamonds), Proposition 23.7 and its proof, pp. 144–145. Uses the compact-generation criterion to identify the right-adjoint preservation property in the geometric application.

**Acceptance.**

- For extension of scalars Mod_R→Mod_S, the unit R maps to the compact object S and restriction commutes with coproducts.
- The proof checks every shift of each compact generator when testing the coproduct comparison.
- Compact generation is required for the converse detection step; preservation on an empty compact subcategory gives no conclusion.

<a id="n-e5-presentability-coherent-group-actions"></a>
#### Coherent actions and continuous fixed points

`E5:presentability/coherent-group-actions` · construction · planet: **Coherent group actions**

For a finite group G, an action on C is a coherent functor BG→Cat∞, equivalently a cocartesian fibration over BG. Its homotopy fixed point category is its limit; for two actions, equivariant functors are the homotopy fixed points of Fun(C,D) under conjugation. Presentable stable actions by equivalences have presentable stable fixed point categories. For a profinite G, categorical actions factoring through a specified finite quotient are pulled back coherently from that quotient. The continuous coefficient specialization uses the E1 enhancement of discrete continuous G-modules: derived invariants agree with the canonical continuous-cochain object and, in degree n, the ProfiniteCohomology finite-quotient system colim_U Hⁿ(G/U,M^U). No filtered-colimit formula for arbitrary categorical homotopy fixed points is asserted.

**Hypotheses.**

- For profinite coefficient modules M the topology is discrete and stabilizers of each element are open.
- The all-degree finite-quotient statement is ProfiniteCohomology Layer 10; Layer 4 supplies only degrees 0,1,2.
- General topological actions on Cat∞ beyond finite-quotient factoring require a chosen continuity model.

**Construction.**

1. Use the arbitrary-base extension of E0 straightening and coherent limits to construct actions and fixed points.
2. Construct conjugation coherently on the functor category and take its limit.
3. For continuous modules use E1’s enhancement and import the existing ProfiniteCohomology dictionary and canonical comparisons; do not replan its cochain theory.

**Direct prerequisites.**

- [`E5:abstract/left-derivable-cocartesian-families`](#n-e5-abstract-left-derivable-cocartesian-families) — Derived cocartesian families
- [`E5:presentability/limits-of-presentable-categories`](#n-e5-presentability-limits-of-presentable-categories) — Limits in PrL
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-0-discrete-modules-and-continuous-sections`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`
- [`E0/coherent-functors`](#n-e0-coherent-functors) — Functor quasicategories and transformations
- [`E0/higher-category-carrier`](#n-e0-higher-category-carrier) — The infinity category of small categories

**Sources.**

- [Higher Topos Theory](#src-e5-lurie-htt), Propositions 5.5.3.12–13, printed pp. 469–470. The presentable-limit theorem applies to coherent BG families; finite-group and finite-quotient factoring actions are constructed from this and the explicit upstream continuous-coefficient interfaces.
- [On topological cyclic homology](#src-e5-ns18), Lemma A.16, p. 136. The coherent-family/straightening construction provides the BG action model; the continuous coefficient formula is imported from ProfiniteCohomology, not proved by this lemma.

**Uses that shape the API.**

- FS21, Theorem X.1.1: Coherent actions on a stable category enter the representation comparison.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `CoherentActionData` | data | The cocartesian family over BG, retaining coherent transitions. | included |
| `homotopyFixedPoints` | constructor | The coherent limit over BG. | included |
| `equivariantFunctors` | constructor | The limit of the conjugation action on Fun(C,D). | included |
| `continuousDerivedInvariants` | compatibility | The enhanced derived invariants specialize to the upstream canonical continuous cochains. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `CoherentActionData.test_trivial_group` | degenerate | The trivial group has C as its fixed point category. | included |
| `CoherentActionData.test_trivial_action` | characterisation | The trivial action of finite G on C has fixed point category Fun(BG,C). | included |
| `CoherentActionData.test_finite_coefficients` | compatibility | For finite G and coefficients M, derived invariants agree with ordinary group cohomology in every nonnegative degree. | included |

**Acceptance.**

- The trivial group has C as its fixed point category.
- The trivial action of finite G on C has fixed point category Fun(BG,C).
- For finite G and coefficients M, derived invariants agree with ordinary group cohomology in every nonnegative degree.

**Open obligations:** gap [G5.1](#gap-g5-1) (Refine abstract supplier dependencies across parts); gap [G5.4](#gap-g5-4) (Continuous categorical action beyond finite quotient factoring); request [R5.1](#req-r5-1) to `EnhancedDerivedSheaves:E1`; request [R5.4](#req-r5-4) to `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-0-discrete-modules-and-continuous-sections`; request [R5.5](#req-r5-5) to `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`; request [R5.7](#req-r5-7) to `EnhancedDerivedSheaves:E0`.

<a id="n-e5-presentability-compact-morphisms"></a>
#### Compact morphisms and compact exhaustions

`E5:presentability/compact-morphisms` · definition

A weakly compact map f:x→y factors through some stage whenever y maps into a filtered colimit. A compact map has the coherent lifting property for the square obtained by precomposition with f between colim_i Map(y,z_i)→Map(y,colim z_i) and colim_i Map(x,z_i)→Map(x,colim z_i). A strongly compact map has its representable transformation factoring through a filtered-colimit-preserving functor. A compact exhaustion is a sequential presentation x≃colim x_n with compact transition maps. In compactly assembled categories these three notions agree; outside this hypothesis they are kept distinct.

**Hypotheses.**

- Compactness of an object means compactness of its identity map.
- Weak factorization on components alone does not impose coherent diagonal fillers.

**Construction.**

1. Form the precomposition square in mapping spaces, then its coherent diagonal-lift condition.
2. Define sequential exhaustion using E0 coherent diagrams.
3. Apply Ramzi’s representable factorization argument to compare the notions under compact assembly.

**Direct prerequisites.**

- [`E5:presentability/compact-objects`](#n-e5-presentability-compact-objects) — Compact objects
- [`E0/right-mapping-space`](#n-e0-right-mapping-space) — Right mapping space
- [`E0/limits-colimits-and-slices`](#n-e0-limits-colimits-and-slices) — The simplicial join
- `mathlib:CategoryTheory.IsFiltered`

**Sources.**

- [Dualizable presentable infinity-categories](#src-e5-ramzidual), Definitions 2.1, 2.3 and 2.5, pp. 26–27; Definition 2.23 and Lemma 2.24, pp. 31–32. Distinguishes weak lifting, coherent diagonal lifting and representable-factorization compactness, and defines sequential compact exhaustions.

**Uses that shape the API.**

- BM26, Definition 2.7: Compact transitions, not compact terms, allow categories with too few compact objects.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `compactMorphismSquare` | data | The precomposition square whose diagonal fillers define compactness. | included |
| `compactExhaustion` | data | A sequential diagram with compact transitions realizing the given object. | included |
| `compactIdentityComparison` | characterisation | The identity is compact precisely when its object is compact. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `compactMorphismSquare.test_zero` | degenerate | The zero morphism is compact in a stable compactly assembled category. | included |
| `compactMorphismSquare.test_identity` | non-example | The identity of a countably infinite-dimensional rational vector space is not compact. | included |
| `compactMorphismSquare.test_finite_rank` | computation | Every finite-rank map of rational vector spaces in degree zero is compact. | included |

**Acceptance.**

- The zero morphism is compact in a stable compactly assembled category.
- The identity of a countably infinite-dimensional rational vector space is not compact.
- Every finite-rank map of rational vector spaces in degree zero is compact.

<a id="n-e5-presentability-dualizable-compactly-assembled-categories"></a>
#### Dualizable and compactly assembled categories

`E5:presentability/dualizable-compactly-assembled-categories` · definition · planet: **Compactly assembled categories**

A presentable stable C is dualizable in PrL_st if it admits a dual, evaluation and coevaluation with triangle homotopies. Equivalently C is a retract, through colimit-preserving functors, of a compactly generated stable category. Equivalently its large-universe colimit functor Ind(C)→C has a left adjoint. In the compactly assembled description filtered colimits commute with finite limits, and objects admitting compact exhaustions generate under filtered colimits. No compact-generation assumption on C is imposed.

**Hypotheses.**

- The Ind(C) criterion uses a larger universe; it is not Ind(C^ω).
- The triangle homotopies and coherent retraction are part of the categorical statement.

**Construction.**

1. Use the categorical tensor to define dual pairs.
2. Apply the retract/atomic-generator characterization of Ramzi Theorem 1.49 in the stable absolute specialization.
3. Identify the compact-exhaustion characterization via Theorem 2.39 and BM Remark 2.8.

**Direct prerequisites.**

- [`E5:presentability/presentable-categories`](#n-e5-presentability-presentable-categories) — Presentable infinity-categories
- [`E5:presentability/tensor-product-and-module-base-change`](#n-e5-presentability-tensor-product-and-module-base-change) — Tensor products of presentable categories and module base change
- [`E5:presentability/compact-morphisms`](#n-e5-presentability-compact-morphisms) — Compact morphisms and compact exhaustions
- [`E5:presentability/ind-completion`](#n-e5-presentability-ind-completion) — Ind-completion

**Sources.**

- [Dualizable presentable infinity-categories](#src-e5-ramzidual), Theorem 1.49, pp. 17–18; Definition 1.68, p. 25; Theorem 2.39, p. 39. Characterizes dualizable stable presentable categories by retracts of compactly generated categories and the left adjoint to the enlarged Ind-colimit functor, without assuming compact generation of the category itself.
- [Berkovich Motives](#src-e5-bm26), Definition 2.7 and Remark 2.8, p. 9. Gives the left-exact filtered-colimit and weak compact-exhaustion description, and the enlarged Ind-colimit adjoint criterion. Stability is imposed here before identifying compact assembly with dualizability.

**Uses that shape the API.**

- BM26, Lemma 10.5: Filtered colimits preserve dualizability under strong continuity even without compact generation.
- RefinedTraceMethods:RT.5: Imports dualizable categories as the trace-theoretic input.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `DualPairData` | data | Dual, evaluation and coevaluation; triangle homotopies are required in the full interface. | included |
| `dualizableRetractComparison` | characterisation | Dualizable stable presentable categories are retracts of compactly generated ones. | included |
| `assemblyLeftAdjoint` | data | The left adjoint to large-universe Ind colimit. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `DualPairData.test_modules` | compatibility | D(R) is dualizable, with the expected dual evaluation via relative tensor. | included |
| `DualPairData.test_zero` | degenerate | The zero category is self-dual. | included |
| `DualPairData.test_retract` | characterisation | A coherent colimit-preserving retract of a compactly generated category is dualizable. | included |

**Acceptance.**

- D(R) is dualizable, with the expected dual evaluation via relative tensor.
- The zero category is self-dual.
- A coherent colimit-preserving retract of a compactly generated category is dualizable.

<a id="n-e5-presentability-strongly-continuous-filtered-colimits"></a>
#### Filtered colimits of dualizable categories

`E5:presentability/strongly-continuous-filtered-colimits` · theorem

A left adjoint is strongly continuous when its right adjoint also preserves colimits. A filtered diagram of dualizable stable presentable categories with strongly continuous transitions has dualizable colimit in PrL_st. The canonical comparison from the colimit of their compact subcategories to the compact subcategory of the result is an equivalence, with colimits of small stable categories taken in the idempotent-complete convention. The result does not assert that any input or the colimit is compactly generated.

**Hypotheses.**

- Use strong continuity, not merely that the left adjoint preserves filtered colimits.
- For arbitrary presentable inputs the compact-subcategory comparison is not asserted.

**Proof.**

1. Use Ramzi Proposition 1.62, or Efimov Proposition 2.63: coherent atomic presentations retract onto the diagram along internal left adjoints, so the PrL_st colimit remains dualizable.
2. Choose a uniform uncountable regular accessibility cardinal. Embed each input by the assembly left adjoint into its Ind of cardinal-compact objects; the corresponding quotient is compactly generated. The compact subcategory of the input is the kernel between the two small compact subcategories.
3. Efimov Proposition 2.67 shows that filtered colimits preserve the strongly continuous fully faithful embeddings and their exact sequences. Finite kernels commute with filtered colimits in the category of small idempotent-complete stable categories, yielding Proposition 2.70 and the compact-object comparison. This does not require the input itself to be compactly generated.

**Direct prerequisites.**

- [`E5:presentability/dualizable-compactly-assembled-categories`](#n-e5-presentability-dualizable-compactly-assembled-categories) — Dualizable and compactly assembled categories
- [`E5:presentability/neeman-compactness-criterion`](#n-e5-presentability-neeman-compactness-criterion) — Compactness and right adjoints

**Sources.**

- [Berkovich Motives](#src-e5-bm26), Lemma 10.5, p. 55. States the compact-subcategory comparison for filtered diagrams of dualizable stable categories with strongly continuous maps. Its proof points to Efimov; Corollary 10.6 is a geometric application, not the generic closure theorem.
- [Dualizable presentable infinity-categories](#src-e5-ramzidual), Proposition 1.62, p. 22. Proves closure of dualizable presentable categories under colimits whose transitions are internal left adjoints, using coherent atomic-presentation retractions.
- [K-theory and localizing invariants of large categories](#src-e5-efimov), Propositions 2.63, 2.67 and 2.70, pp. 52–55 (arXiv v4). Proves strongly continuous colimit closure and the compact-subcategory comparison through exact sequences of compactly generated presentations and filtered finite-kernel commutation. This is the updated numbering of BM26’s cited Proposition 1.72.

**Acceptance.**

- A constant filtered diagram recovers the original category and its compact subcategory.
- For a diagram of D(R_i) along scalar extension, the compact comparison identifies the colimit of perfect subcategories with the perfect objects of the colimit.
- The compact-object comparison is checked on morphism spaces and retracts; no stage or colimit is assumed compactly generated.

<a id="n-e5-presentability-rigid-presentable-categories"></a>
#### Trace-class maps and rigid categories

`E5:presentability/rigid-presentable-categories` · definition

In a presentable closed symmetric monoidal C, f:x→y is trace-class if there are d, a pairing d⊗x→1 and a map 1→y⊗d whose contraction is f. Equivalently its class in Hom(x,y) lifts through Hom(x,1)⊗y. C is locally rigid over V when it is dualizable as a V-module and multiplication C⊗_V C→C is an internal left adjoint over C⊗_V C: its right adjoint preserves colimits and is bilinear. It is rigid when additionally its unit is V-atomic; absolutely over Sp this means compact. In the absolute stable case local rigidity is equivalent to dualizability plus every compact morphism being trace-class. Compact unit together with trace-class compact exhaustions generating under colimits implies rigidity.

**Hypotheses.**

- Objectwise dualizability is distinct from categorical rigidity.
- Absolute stable formulations use the abstract unit Sp of PrL_st, not a concrete spectrum model.

**Construction.**

1. Define the contraction of evaluation and coevaluation and the trace-class factorization.
2. Use the internal adjoint criterion for multiplication, with both linearity and preservation of colimits.
3. Apply Ramzi v2 Proposition 4.15 and Corollary 4.60, translating v1 locator 4.57 to v2 4.60.
4. For the right-adjoint API apply Observation 4.51 to the colimit-preserving strong symmetric monoidal functor: local rigidity of the source and compactness of the target unit give an internal left adjoint over the source.

**Direct prerequisites.**

- [`E5:presentability/dualizable-compactly-assembled-categories`](#n-e5-presentability-dualizable-compactly-assembled-categories) — Dualizable and compactly assembled categories
- [`E5:presentability/compact-morphisms`](#n-e5-presentability-compact-morphisms) — Compact morphisms and compact exhaustions
- [`E5:presentability/tensor-product-and-module-base-change`](#n-e5-presentability-tensor-product-and-module-base-change) — Tensor products of presentable categories and module base change
- [`E5:abstract/module-objects`](#n-e5-abstract-module-objects) — Modules and extension of scalars

**Sources.**

- [Locally rigid infinity-categories](#src-e5-ramzirigid), Definition 3.1, p. 21; Definition 4.5, p. 24; Proposition 4.15, pp. 26–27; Definition 4.36, p. 33; Corollary 4.60, p. 38; Observation 4.51, pp. 34–35. Defines trace-class maps and local rigidity and proves the compact-unit plus trace-class-exhaustion criterion for rigidity, using the downloaded v2 numbering.

**Uses that shape the API.**

- BM26, item 60: Rigid coefficient categories supply linear and colimit-preserving right adjoints.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `TraceClassData` | data | A factorization through an evaluation/coevaluation contraction. | included |
| `RigidData` | data | A dual pair and the bilinear colimit-preserving right adjoint to multiplication; compact unit is additional. | included |
| `rigidRightAdjointLinearity` | compatibility | For a colimit-preserving strong symmetric monoidal functor F:C→D between rigid stable presentable categories, its right adjoint is colimit-preserving and C-linear, where D has its C-action through F. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `RigidData.test_modules` | compatibility | For commutative R, D(R) is rigid with compact unit R. | included |
| `TraceClassData.test_dualizable` | characterisation | The identity of a dualizable object is trace-class. | included |
| `TraceClassData.test_infinite` | non-example | The identity of an infinite-dimensional rational vector space is not trace-class. | included |

**Acceptance.**

- For commutative R, D(R) is rigid with compact unit R.
- The identity of a dualizable object is trace-class.
- The identity of an infinite-dimensional rational vector space is not trace-class.


<a id="layer-e5-animation"></a>

### E5:animation — Animated commutative algebra

A category is sifted when it is nonempty and its diagonal is cofinal;
Mathlib's ordinary siftedness by connected comma categories is compared, not
assumed equivalent. PΣ(C) consists of presheaves of spaces turning finite
coproducts into products; its objects are sifted colimits of representables,
and sifted left Kan extension gives its universal property. Animated
commutative R-algebras are PΣ of finitely generated polynomial R-algebras,
equivalently simplicial commutative R-algebras localized at weak equivalences;
the discrete ones are ordinary R-algebras. In characteristic p, Frobenius acts
by zero on positive homotopy, so perfection is discrete. The degreewise Witt
vector functor preserves weak equivalences; its homotopy is a product of
copies of π_i additively only for i > 0, and π₀ carries Witt addition. The
coherent p-annihilation of the Witt fibre is gap [G5.3](#gap-g5-3). Bounded
totalizations commute with filtered colimits when the truncation bound is
uniform; unbounded convergence uses E2's sheaves of spaces.

<a id="n-e5-animation-sifted-colimits"></a>
#### Sifted colimits

`E5:animation/sifted-colimits` · definition

A small infinity-category I is sifted if it is nonempty and the diagonal I→I×I is cofinal; equivalently its colimits in spaces commute with finite products. Filtered categories and Δop are sifted. Empty is not sifted: its colimit does not preserve the empty product. Nerves of ordinary sifted categories compare with Mathlib’s IsSifted where the diagonal is homotopy cofinal; ordinary connectedness of comma categories alone does not establish homotopy cofinality.

**Hypotheses.**

- Infinity-categorical cofinality is supplied by the E0/E3 mapping-space machinery.
- Do not identify ordinary finality with homotopy cofinality without contractibility.

**Construction.**

1. Define the nonempty and diagonal cofinality criterion.
2. Use the spaces-colimit criterion to prove finite-product commutation.
3. Check Δop by its standard simplicial contraction, and filtered shapes by contractibility of finite cone categories.

**Direct prerequisites.**

- [`E0/limits-colimits-and-slices`](#n-e0-limits-colimits-and-slices) — The simplicial join
- [`E3/left-kan-extension-along-a-full-inclusion`](#n-e3-left-kan-extension-along-a-full-inclusion) — Left Kan extension along a full inclusion
- `mathlib:CategoryTheory.IsSifted`

**Sources.**

- [Higher Topos Theory](#src-e5-lurie-htt), Definition 5.5.8.1, Warning 5.5.8.2, Example 5.5.8.3 and Lemma 5.5.8.4, printed p. 506; Propositions 5.5.8.6–7 and Lemma 5.5.8.11, printed pp. 507–508 (PDF pp. 524–526). Uses nonemptiness and the cofinal diagonal to obtain finite-product commutation of space-valued colimits; simplicial realizations are the fundamental example.

**Uses that shape the API.**

- HTT, Proposition 5.5.8.15: The animation universal property uses filtered colimits and realizations, hence all sifted colimits.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `siftedDiagonal` | data | The diagonal I→I×I, with nonemptiness and cofinality as the definitive definition’s hypotheses. | included |
| `siftedProductComparison` | characterisation | The comparison colim(F×G)→colim F×colim G is an equivalence. | included |
| `siftedRealization` | compatibility | Geometric realization is a sifted colimit and commutes with finite products of spaces. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `siftedDiagonal.test_empty` | non-example | The empty category is not sifted. | included |
| `siftedDiagonal.test_simplex` | computation | Δop is sifted. | included |
| `siftedDiagonal.test_two_points` | non-example | The discrete category with two objects is not sifted. | included |

**Acceptance.**

- The empty category is not sifted.
- Δop is sifted.
- The discrete category with two objects is not sifted.

<a id="n-e5-animation-nonabelian-derived-category"></a>
#### The nonabelian derived category

`E5:animation/nonabelian-derived-category` · construction · planet: **Nonabelian derived categories**

For a small category C with finite coproducts, PΣ(C) is the full subcategory of Fun(Cop,Spaces) sending finite coproducts to products, including the empty coproduct. It is presentable. Yoneda is fully faithful, preserves finite coproducts and its image consists of compact projective objects. Every object is a sifted colimit of representables, more precisely a geometric realization of coproducts of representables. Compact-projective means Map(x,−) preserves sifted colimits, a stronger property than ordinary compactness.

**Hypotheses.**

- Space-valued presheaves are essential; replacing them by set-valued presheaves would remove animation.
- The target Spaces has cartesian products.

**Construction.**

1. Impose finite-coproduct relations on presheaves as an accessible localization.
2. Use Yoneda evaluation and sifted-product commutation for compact projectivity.
3. Use HTT’s simplicial resolution by representables for generation.

**Direct prerequisites.**

- [`E5:animation/sifted-colimits`](#n-e5-animation-sifted-colimits) — Sifted colimits
- [`E5:presentability/presentable-categories`](#n-e5-presentability-presentable-categories) — Presentable infinity-categories
- [`E3/left-kan-extension-along-a-full-inclusion`](#n-e3-left-kan-extension-along-a-full-inclusion) — Left Kan extension along a full inclusion

**Sources.**

- [Higher Topos Theory](#src-e5-lurie-htt), Proposition 5.5.8.10 and Lemma 5.5.8.14, printed pp. 507–510. Constructs finite-coproduct-preserving space-valued presheaves, their compact-projective Yoneda generators and simplicial presentations by coproducts of representables.

**Uses that shape the API.**

- DerivedDeRhamCohomology:DD.0/cotangent-complex: Polynomial resolutions use this single animation foundation.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `nonabelianDerived` | constructor | The finite-coproduct-to-product space-valued presheaves. | included |
| `animationYoneda` | data | The compact-projective representable embedding. | included |
| `animationResolution` | characterisation | Each object has a simplicial resolution by coproducts of representables. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `nonabelianDerived.test_initial` | degenerate | For the category with just its zero coproduct object, PΣ is terminal. | included |
| `nonabelianDerived.test_finite_sets` | computation | PΣ(FinSet) is Spaces. | included |
| `nonabelianDerived.test_coproduct` | characterisation | Yoneda preserves finite coproducts in PΣ, rather than pointwise coproducts of unrestricted presheaves. | included |

**Acceptance.**

- For the category with just its zero coproduct object, PΣ is terminal.
- PΣ(FinSet) is Spaces.
- Yoneda preserves finite coproducts in PΣ, rather than pointwise coproducts of unrestricted presheaves.

**Open obligations:** gap [G5.1](#gap-g5-1) (Refine abstract supplier dependencies across parts); request [R5.6](#req-r5-6) to `EnhancedDerivedSheaves:E3`.

<a id="n-e5-animation-universal-property-of-animation"></a>
#### The universal property of animation

`E5:animation/universal-property-of-animation` · theorem

If C is small with finite coproducts and D admits filtered colimits and geometric realizations, restriction gives Fun_sifted(PΣ(C),D) ≃ Fun(C,D). The inverse is sifted left Kan extension. It preserves all colimits exactly when its input preserves finite coproducts, provided D admits those coproducts. Evaluation on a simplicial polynomial resolution is realization of the values. HTT’s strict simplicial algebra model presents PΣ(C) by objectwise weak equivalences; rectification is part of the comparison, not a definition by assertion.

**Hypotheses.**

- The full equivalence includes coherent natural transformations and uniqueness.
- Model rectification uses the finite-product theory Cop.

**Proof.**

1. Use the representable resolution and E3 left Kan extension to construct the inverse.
2. Prove resolution independence and sifted-colimit preservation, then the restriction equivalence.
3. Apply HTT 5.5.9.2–3 for the strict-product-preserving simplicial model.

**Direct prerequisites.**

- [`E5:animation/nonabelian-derived-category`](#n-e5-animation-nonabelian-derived-category) — The nonabelian derived category
- [`E3/left-kan-extension-along-a-full-inclusion`](#n-e3-left-kan-extension-along-a-full-inclusion) — Left Kan extension along a full inclusion

**Sources.**

- [Higher Topos Theory](#src-e5-lurie-htt), Proposition 5.5.8.15, printed p. 510 (PDF p. 528); Proposition 5.5.9.1 and Corollary 5.5.9.3, printed pp. 516–517. Gives the sifted-colimit-preserving extension property and rectifies these presheaves to strict simplicial algebra models.

**Acceptance.**

- For C=FinSet, the sifted extension of C→Spaces recovers the identity on Spaces.
- Sifted extension of a finite-coproduct-preserving functor also preserves finite coproducts; applying a different simplicial resolution gives an equivalent value.
- Natural transformations extend uniquely, so the universal property is a functor-category equivalence rather than only a bijection on objects.

**Open obligations:** gap [G5.1](#gap-g5-1) (Refine abstract supplier dependencies across parts); request [R5.6](#req-r5-6) to `EnhancedDerivedSheaves:E3`.

<a id="n-e5-animation-animated-commutative-rings"></a>
#### Animated commutative rings

`E5:animation/animated-commutative-rings` · construction · planet: **Animated commutative rings**

For an ordinary commutative R, let Poly_R be the category of polynomial R-algebras in finitely many variables and all R-algebra maps. AnimAlg_R=PΣ(Poly_R) is equivalent to the infinity-localization of simplicial commutative R-algebras at maps inducing isomorphisms on all homotopy groups. Its discrete subcategory is ordinary R-algebras; inclusion has π₀ as left adjoint. Pushouts B⊗^L_A C are computed by simplicial polynomial resolutions. Their additive homotopy groups are Tor when the bases are ordinary; an underived pushout is correct only under suitable Tor vanishing.

**Hypotheses.**

- Animated means simplicial commutative, not strictly commutative cochain dg in positive characteristic.
- Higher homotopy groups have homological indices n≥0, corresponding to cohomological degree −n.

**Construction.**

1. Construct Poly_R using the existing MvPolynomial universal property and animate it.
2. Apply the strict-product model rectification to identify simplicial commutative algebras.
3. Use cofibrant polynomial resolutions to compute homotopy pushouts and the discrete/π₀ adjunction.

**Direct prerequisites.**

- [`E5:animation/nonabelian-derived-category`](#n-e5-animation-nonabelian-derived-category) — The nonabelian derived category
- [`E5:animation/universal-property-of-animation`](#n-e5-animation-universal-property-of-animation) — The universal property of animation
- `mathlib:MvPolynomial`
- `mathlib:CommRingCat`
- `mathlib:CategoryTheory.SimplicialObject`

**Sources.**

- [Higher Topos Theory](#src-e5-lurie-htt), §5.5.9, Propositions 5.5.9.1–2 and Corollary 5.5.9.3, printed pp. 516–517. The simplicial algebra rectification applies to the finite polynomial theory; the existing ordinary polynomial carrier supplies the generators.

**Uses that shape the API.**

- BS17, Proposition 11.6: Frobenius discreteness is a statement about this animation, independent of cotangent and spectra returns.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `animatedAlgebras` | constructor | The animation of finite polynomial R-algebras. | included |
| `animatedDiscrete` | constructor | Inclusion of ordinary rings as constant simplicial rings. | included |
| `animatedPiZero` | projection | The ordinary π₀ ring. | included |
| `animatedPushout` | data | The derived pushout in animated rings. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `animatedAlgebras.test_polynomial` | computation | The polynomial algebra in n generators remains discrete under inclusion and π₀. | included |
| `animatedAlgebras.test_tor` | non-example | For k=𝔽₂, π₁(k⊗^L_(k[t])k)≅k when t acts by zero on both factors. | included |
| `animatedAlgebras.test_identity` | degenerate | A⊗^L_A B≃B. | included |

**Acceptance.**

- The polynomial algebra in n generators remains discrete under inclusion and π₀.
- For k=𝔽₂, π₁(k⊗^L_(k[t])k)≅k when t acts by zero on both factors.
- A⊗^L_A B≃B.

<a id="n-e5-animation-frobenius-and-perfection"></a>
#### Frobenius discreteness and perfection

`E5:animation/frobenius-and-perfection` · theorem · planet: **Frobenius discreteness**

For a simplicial commutative 𝔽_p-algebra A, Frobenius acts by zero on π_i(A) for i>0. Thus perfection, the sequential Frobenius colimit, is discrete and equals the perfection of π₀A. Perfect discrete 𝔽_p-algebras are closed under ordinary and derived colimits. In particular a derived tensor of perfect B←A→C is discrete, perfect and equals its ordinary tensor. The perfection of a derived affine scheme is the perfection of its classical truncation; global scheme glueing is imported from E1/E2. The multiplication map A×A→A, based at (0,0), induces zero on positive homotopy because its restrictions to both axes are zero. This does not say multiplication as a bilinear graded ring operation vanishes. An imperfect base cannot be dropped: for A=𝔽_p(t), A_perf⊗_A A_perf has the nonzero nilpotent t^(1/p)⊗1−1⊗t^(1/p). Cosimplicial perfection need not be discrete, as the perfected elliptic-cohomology example in Remark 11.7 shows.

**Hypotheses.**

- p is prime and the algebra is commutative simplicial in characteristic p.
- A cosimplicial or arbitrary E∞ algebra does not satisfy this assertion.

**Proof.**

1. Resolve A by free simplicial algebras and calculate Frobenius on positive homotopy using the graded free resolution argument in BS.
2. Use filtered-colimit preservation of π_i to kill all positive homotopy in perfection.
3. Apply the same calculation to derived pushouts between perfect rings; identify π₀ with the ordinary pushout.

**Direct prerequisites.**

- [`E5:animation/animated-commutative-rings`](#n-e5-animation-animated-commutative-rings) — Animated commutative rings
- [`E5:animation/universal-property-of-animation`](#n-e5-animation-universal-property-of-animation) — The universal property of animation

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e5-bs17), Proposition 11.6, Remarks 11.7–11.8 and Lemma 11.10, pp. 41–42. Proves the vanishing of Frobenius on positive homotopy, discreteness of perfection and discreteness of derived colimits of perfect rings.
- [On the direct summand conjecture and its derived variant](#src-e5-bhatt18), Lemma 2.6, p. 5. Uses simplicial perfection in the integral perfectoid Koszul argument; the perfection theorem itself is supplied by BS17.

**Acceptance.**

- For A=𝔽_p⊗ᴸ_{𝔽_p[x]}𝔽_p, π₁A=𝔽_p while its perfection is discrete; the theorem must kill this genuine derived class.
- For perfect B←A→C with perfect A, all positive Tor groups vanish.
- Over the imperfect base 𝔽_p(t), the ordinary tensor of two perfections has the displayed nonzero nilpotent; perfect endpoints alone do not imply a perfect pushout.

<a id="n-e5-animation-derived-witt-adapter"></a>
#### The simplicial Witt adapter

`E5:animation/derived-witt-adapter` · construction · planet: **Simplicial Witt vectors**

Apply the existing p-typical Witt vector functor degreewise to a simplicial commutative 𝔽_p-algebra A. This preserves weak equivalences since its underlying simplicial set is A^ℕ, with π_i W(A)≅∏_ℕ π_i A as pointed homotopy sets. For i>0 this is an additive-group identification by Eckmann–Hilton; at i=0 the ring is W(π₀A), whose addition is the Witt addition rather than coordinatewise addition. Witt Frobenius induces zero on positive homotopy; its sequential localization is discrete and the map to W(π₀A) becomes an equivalence after Frobenius localization. The fibre of W(A)→W(π₀A) is killed by p in the derived sense, using the coherent Witt identity VF=p and the Frobenius nullhomotopy, rather than inferring a null map just from p-torsion cohomology.

**Hypotheses.**

- Use the pinned WittVector carrier, functorial maps and Frobenius/Verschiebung formulas.
- The p-nullhomotopy is stronger than the homotopy-group computation; its coherent construction is recorded as a remaining gap.

**Construction.**

1. Lift WittVector’s ordinary functor degreewise; compare its underlying simplicial set with the countable product.
2. Use the Kan underlying simplicial sets to compute pointed homotopy sets of the countable product, hence weak-equivalence preservation. For i>0 compare the two group laws by Eckmann–Hilton; keep Witt addition on π₀.
3. Apply Frobenius discreteness to the coordinate Frobenius and take the telescope.
4. Construct the p-annihilation nullhomotopy on the fibre from the coherent factorization through Frobenius and Verschiebung.

**Direct prerequisites.**

- [`E5:animation/animated-commutative-rings`](#n-e5-animation-animated-commutative-rings) — Animated commutative rings
- [`E5:animation/frobenius-and-perfection`](#n-e5-animation-frobenius-and-perfection) — Frobenius discreteness and perfection
- `mathlib:WittVector`

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e5-bs17), Lemma 11.43 and Remark 11.44, p. 52. Computes homotopy via Witt coordinates and shows Frobenius-localized discreteness; the fibre-level p-annihilation assertion needs the coherent nullhomotopy recorded as a gap.

**Uses that shape the API.**

- BS17, Lemma 11.43: Derived Witt constructions are reduced to the ordinary coefficient functor.

**API.**

| Name | Role | Statement | Lean |
| --- | --- | --- | --- |
| `simplicialWitt` | constructor | The degreewise existing Witt vector functor. | included |
| `simplicialWittPi` | characterisation | The Witt-coordinate comparison on pointed homotopy sets for i≥0; for i>0 it is additive. The π₀ ring identification is W(π₀A), not the coordinatewise product ring. | included |
| `wittFrobeniusLocalization` | compatibility | Frobenius localization is discrete and insensitive to the higher homotopy of A. | included |

**Unit tests.**

| Name | Kind | Statement | Lean |
| --- | --- | --- | --- |
| `simplicialWitt.test_constant` | compatibility | For constant A the result is constant W(A). | included |
| `simplicialWitt.test_coordinates` | computation | For constant A, the n-th coordinate is the existing WittVector.coeff n. | included |
| `simplicialWitt.test_positive` | computation | For A=𝔽_p⊗ᴸ_{𝔽_p[x]}𝔽_p with x mapping to zero on both sides, π₁W(A)≃∏_ℕ𝔽_p. Computing W only on π₀A would fail this test. | included |

**Acceptance.**

- For constant A the result is constant W(A).
- For constant A, the n-th coordinate is the existing WittVector.coeff n.
- For A=𝔽_p⊗ᴸ_{𝔽_p[x]}𝔽_p with x mapping to zero on both sides, π₁W(A)≃∏_ℕ𝔽_p. Computing W only on π₀A would fail this test.

**Open obligations:** gap [G5.3](#gap-g5-3) (Coherent p-annihilation for the derived Witt fibre).

<a id="n-e5-animation-bounded-totalization-colimits"></a>
#### Bounded totalizations and filtered colimits

`E5:animation/bounded-totalization-colimits` · theorem

For a cosimplicial diagram of n-truncated spaces, n≥0 fixed, totalization equals partial totalization through degree n+1. Consequently totalization commutes with filtered colimits when the truncation bound is uniform in both indices. For cosimplicial spectra whose terms all lie in Sp≤b for one integer b, π_k of totalization is computed by a finite partial stage r≥max(0,b−k+1). This gives filtered-colimit commutation degree by degree; coconnective terms are the case b=0. The analogous cohomological comparison for complexes uses a uniform lower cohomological bound. Without a uniform bound, arbitrary totalization need not commute with filtered colimits. Unbounded Postnikov convergence and hypercompleteness are supplied by E2.

**Hypotheses.**

- The bound must hold uniformly over both the filtered index and cosimplicial degree.
- A claim that an arbitrary infinite limit commutes with filtered colimits is excluded.

**Proof.**

1. Use the Reedy matching-object tower: extending Tot_(r−1) to Tot_r has obstruction in degree r−1 of the matching fibre and space of lifts Ωʳ of that fibre. For n-truncated spaces, obstructions and choices vanish for r>n+1, so Tot_(n+1) determines the result.
2. For spectra bounded above by b, the layer Ωʳ of a matching fibre is bounded above by b−r. Both π_k and π_(k−1) of that layer vanish for r>b−k+1, giving the displayed stable-degree window.
3. Partial totalizations are finite iterated homotopy limits built from matching diagrams. Filtered colimits commute with these finite limits and with homotopy groups, giving the comparison; E2 supplies convergence when using a more general Postnikov reconstruction.

**Direct prerequisites.**

- [`E5:animation/sifted-colimits`](#n-e5-animation-sifted-colimits) — Sifted colimits
- [`E0/limits-colimits-and-slices`](#n-e0-limits-colimits-and-slices) — The simplicial join
- [`E2/space-sheaves-and-postnikov`](#n-e2-space-sheaves-and-postnikov) — Space-valued sheaves and Postnikov convergence

**Sources.**

- [Projectivity of the Witt vector affine Grassmannian](#src-e5-bs17), §11, footnote 23, p. 46; the coconnective-spectra argument in the proof of Proposition 11.41, p. 53. Uses uniform n-truncation for space-valued totalizations and coconnectivity for spectral totalizations. The finite-stage bounds above are obtained from the matching-fibre obstruction tower; no unbounded commutation theorem is attributed to this source.

**Acceptance.**

- For 0-truncated terms, Tot₁ is the equalizer condition and suffices. For 1-truncated terms, Tot₂ must also impose coherence.
- The same truncation bound is used for every filtered input, and the comparison uses finite homotopy limits rather than an infinite product interchange.
- For spectra in Sp≤0, each π_k uses the window r≥max(0,1−k); the argument supplies no single finite stage for the whole spectrum.

**Open obligations:** request [R5.2](#req-r5-2) to `EnhancedDerivedSheaves:E2`.


<a id="layer-e5-cotangent-export"></a>

### E5:cotangent-export — The return from derived de Rham

The cotangent complex, its derivation characterization, transitivity, base
change, derived exterior powers and amplitude tests are constructed by
`DerivedDeRhamCohomology:DD.0` from this roadmap's animation; this sub-layer
only identifies them with the animated and monoidal module structures of E5,
and compares animated algebras with connective E∞ algebras, an equivalence
over ℚ-algebras only. Positive-characteristic spectral commutative algebras are
not identified with animated rings.

<a id="n-e5-cotangent-export-the-imported-interface"></a>
#### The cotangent-complex interface

`E5:cotangent-export/the-imported-interface` · theorem · planet: **Cotangent comparison**

Import L_(B/A) from DD.0 with Map_B(L_(B/A),M) ≃ Der_A(B,M), its transitivity cofiber sequence B⊗^L_A L_(A/R)→L_(B/R)→L_(B/A), and derived base change for a homotopy pushout. E5 identifies these maps with its animated and monoidal module structures, without defining a second cotangent complex. The low-degree comparison with Mathlib’s naive cotangent construction covers H⁰=Ω and H⁻¹, not the entire complex. Re-export derived exterior powers and the DD.0 amplitude tests through the same interface.

**Hypotheses.**

- Cohomological indexing puts connective animated homotopy in nonpositive degrees.
- Ordinary tensor base change needs Tor-independence unless explicitly derived.
- The square-zero derivation mapping-space comparison is for connective modules M, as in DD.0; extension to arbitrary M requires its own argument.
- The regular-quotient test requires a finite regular sequence. For A=k[ε]/(ε²)→k, relative L_(k/A) has H⁻¹=k and H⁻²=k; an arbitrary quotient cannot use the conormal-shift formula.

**Proof.**

1. Import DD.0’s stated constructions and characterize the comparison by the same derivation mapping spaces.
2. Identify transitivity and base-change arrows by naturality, including composite algebra maps.
3. Transport DD.0’s polynomial, regular-quotient and transitivity tests. Apply transitivity to k→k[ε]/(ε²)→k to compute the relative nonregular-quotient counterexample and retain all negative cohomology.

**Direct prerequisites.**

- `DerivedDeRhamCohomology:DD.0/cotangent-complex`
- `DerivedDeRhamCohomology:DD.0/derivations-cotangent-comparison`
- `DerivedDeRhamCohomology:DD.0/cotangent-naive-comparison`
- `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`
- `DerivedDeRhamCohomology:DD.0/cotangent-base-change`
- `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`
- `DerivedDeRhamCohomology:DD.0/smooth-cotangent`
- `DerivedDeRhamCohomology:DD.0/regular-quotient-cotangent`
- `DerivedDeRhamCohomology:DD.0/lci-amplitude`
- [`E5:animation/animated-commutative-rings`](#n-e5-animation-animated-commutative-rings) — Animated commutative rings
- [`E5:abstract/module-objects`](#n-e5-abstract-module-objects) — Modules and extension of scalars
- `mathlib:Algebra.Extension.H1Cotangent`
- `mathlib:RingTheory.Sequence.IsRegular`
- `mathlib:TrivSqZeroExt`

**Sources.**

- [Higher Algebra](#src-e5-lurie-ha), §7.1.4, pp. 1223–1227. Supplies the rational commutative dg comparison needed to identify the animated cotangent return; the cotangent construction and its test computations remain imported from DD.0.

**Acceptance.**

- Polynomial R[x₁,…,x_n] has relative cotangent B^n in degree zero; a length-c regular quotient has relative cotangent B^c[1].
- For k[ε]/(ε²)→k, transitivity gives H⁻¹L=k and H⁻²L=k, detecting substitution of the naive two-term truncation for the full object.
- Derived base change follows a homotopy pushout; its ordinary-square specialization separately checks positive Tor vanishing.

<a id="n-e5-cotangent-export-e-infinity-comparison-in-proved-ranges"></a>
#### Animation and E-infinity algebra comparison

`E5:cotangent-export/e-infinity-comparison-in-proved-ranges` · theorem · planet: **Rational algebra comparison**

There is a sifted-colimit-preserving comparison from animated commutative R-algebras to connective E∞ HR-algebras, determined on polynomial generators. It is an equivalence for R a ℚ-algebra. For any commutative R, simplicial associative R-algebras compare equivalently with connective E₁ HR-algebras. In positive characteristic the commutative comparison is not an equivalence in general: spectral free algebras retain the homology of symmetric groups, absent from a polynomial animated algebra on a degree-zero generator. Strictly commutative dg algebras are a general model only in characteristic zero. Cotangent comparisons are asserted only after the relevant equivalence or separately verified hypotheses.

**Hypotheses.**

- This is a return comparison requiring the concrete spectral supplier; it is not an input to animation.
- No positive-characteristic commutative dg replacement or unrestricted equivalence is asserted.

**Proof.**

1. Extend the polynomial-generator spectral comparison by the animation universal property.
2. Apply HA 7.1.4.20 over ℚ and 7.1.4.18 for associative algebras over any R.
3. Check the positive-characteristic free algebra counterexample and record the exact comparison boundary.

**Direct prerequisites.**

- [`E5:animation/universal-property-of-animation`](#n-e5-animation-universal-property-of-animation) — The universal property of animation
- [`E5:animation/animated-commutative-rings`](#n-e5-animation-animated-commutative-rings) — Animated commutative rings
- [`E5:cotangent-export/the-imported-interface`](#n-e5-cotangent-export-the-imported-interface) — The cotangent-complex interface
- `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-spectrum`
- `StableHomotopyKTheory:H.5:spectra/module-spectra-model-structure`

**Sources.**

- [Higher Algebra](#src-e5-lurie-ha), Proposition 7.1.4.11, p. 1223; Propositions 7.1.4.18 and 7.1.4.20, pp. 1225–1227; Warning 7.1.4.21, p. 1227. Proves the associative dg comparison over any base and the commutative comparison over a rational base; explicitly distinguishes the positive-characteristic non-equivalence.

**Acceptance.**

- Over ℚ the comparison is an equivalence on objects and mapping spaces and carries ordinary polynomials to the same connective rational spectral algebra.
- Over 𝔽₂ the arity-two summand of the free spectral commutative algebra on H𝔽₂ has positive H_*(BΣ₂;𝔽₂); the animated polynomial generator has no such positive homotopy.
- Associative comparison over any R is kept separate from the commutative characteristic-zero comparison.


<a id="layer-e5-spectra-comparison"></a>

### E5:spectra-comparison — Late concrete spectral realization

After `StableHomotopyKTheory:H.5`, the concrete symmetric spectra, derived
smash product, Eilenberg–Mac Lane objects and module spectra are compared,
through the monoidal model-category localization of E5:abstract, with the
abstract stable monoidal category Sp, and module spectra over HR with the E1
enhancement. This return is not a prerequisite of E5:abstract or
E5:animation.

<a id="n-e5-spectra-comparison-late-realisation"></a>
#### Concrete spectral realization of the enhancement

`E5:spectra-comparison/late-realisation` · theorem · planet: **Spectral realization**

Import the H.5 symmetric-spectrum stable model, derived smash, Eilenberg–Mac Lane object and module model. Apply the E5 monoidal model-localization interface to compare its infinity-localization with the abstract stable monoidal category Sp. For each ordinary commutative R, Mod_HR is symmetric monoidally equivalent to the E1 enhanced D(R), carrying HR to R and derived smash over HR to derived tensor over R. On homotopy categories it recovers Mathlib’s DerivedCategory of R-modules, with the same cochain shifts and exact triangles.

**Hypotheses.**

- Concrete spectra, stable model structures and Eilenberg–Mac Lane objects are supplied by H.5.
- This layer has no outgoing prerequisite edge to E5:abstract or E5:animation; its supplier direction must remain a return branch.

**Proof.**

1. Verify the supplier’s monoidal model axioms and apply NS A.7.
2. Use HA 7.1.2.13 to identify spectral modules with the enhanced derived category.
3. Compare E1’s homotopy category and tensor using E0’s sign convention and E5’s exact monoidal comparison.

**Direct prerequisites.**

- `StableHomotopyKTheory:H.5:spectra/stable-model-structure`
- `StableHomotopyKTheory:H.5:spectra/derived-smash-product`
- `StableHomotopyKTheory:H.5:spectra/module-spectra-model-structure`
- `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-spectrum`
- [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category) — The enhanced derived category
- [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor) — Derived sheaf tensor
- [`E5:abstract/monoidal-model-category-localization`](#n-e5-abstract-monoidal-model-category-localization) — Monoidal localization of a model category
- [`E5:abstract/stable-infinity-category`](#n-e5-abstract-stable-infinity-category) — Stable monoidal enhancement comparison

**Sources.**

- [Higher Algebra](#src-e5-lurie-ha), Theorem 7.1.2.13, p. 1212. Identifies derived modules with modules over the Eilenberg–Mac Lane ring spectrum; the chosen concrete stable model is imported from H.5.

**Acceptance.**

- HR corresponds to R[0]; relative smash corresponds to derived tensor and the spectral shift to the pinned cochain shift.
- Mapping spectra compare with derived Hom, so agreement only on homotopy categories is insufficient.
- For a nonflat pair of ordinary modules, derived smash retains the positive Tor term of derived tensor.


<a id="layer-e5-acceptance"></a>

### E5 — The joint acceptance diagram

<a id="n-e5-single-enhancement-supplier"></a>
#### Compatibility of enhancement and algebra comparisons

`E5/single-enhancement-supplier` · comparison

The shared interface commutes with passage from ordinary rings to animated rings and from algebra objects to modules. For the unit R, the enhanced module category, its tensor unit and ordinary derived-category comparison agree across E1, abstract E5 and the spectral return. For polynomial R[x₁,…,x_n], the imported cotangent complex is the free rank-n B-module in degree zero. For a quotient by a regular sequence of length c, the imported relative cotangent complex is (I/I²)[1], free rank c in cohomological degree −1. These computations, the homotopy pushout Tor example and preservation of exact triangles are the parent layer’s acceptance diagram. The nonregular quotient k[ε]/(ε²)→k retains a nonzero H⁻² term, checking that the full cotangent object was not replaced by its naive truncation.

**Hypotheses.**

- The cotangent and spectra supplier branches are prerequisites only for this joint acceptance diagram, not for abstract constructions.
- The regular-quotient statement is relative to the ambient ring, rather than its absolute cotangent complex.

**Proof.**

1. Apply the animation, unit-module and enhanced derived comparisons.
2. Transport the DD.0 polynomial and regular-quotient tests through the same module functor.
3. Use uniqueness from the universal properties to identify the comparison composites and their naturality.

**Direct prerequisites.**

- [`E5:animation/animated-commutative-rings`](#n-e5-animation-animated-commutative-rings) — Animated commutative rings
- [`E5:cotangent-export/the-imported-interface`](#n-e5-cotangent-export-the-imported-interface) — The cotangent-complex interface
- [`E5:spectra-comparison/late-realisation`](#n-e5-spectra-comparison-late-realisation) — Concrete spectral realization of the enhancement
- [`E5:abstract/exact-functors`](#n-e5-abstract-exact-functors) — Exact monoidal functors and triangles

**Sources.**

- [Higher Algebra](#src-e5-lurie-ha), Theorem 7.1.2.13, p. 1212. Supplies the derived-module-to-spectral comparison in the joint acceptance diagram; DD.0 supplies the other branch and the smooth and regular-quotient computations.

**Acceptance.**

- The unit and polynomial/regular-quotient cotangent comparisons commute with the same enhancement functor.
- The Tor pushout and k[ε]/(ε²)→k cotangent computations both retain their nonzero higher derived terms.
- Every cofiber triangle is transported with E0’s signs; neither comparison return is a prerequisite for constructing animation.


## Dependencies

**Cross-part prerequisites.** Layers E0–E4 used no E5 declaration before
assembly; E5 cites 14 declarations of E0–E4. The assembly made the following
cross-part citations exact. Each added identifier names an existing
declaration whose statement supplies what the citing declaration's statement
or proof uses.

- `E5:abstract/descendable-algebras` cited the whole layer E2 for its
  Amitsur-tower characterization; it now cites
  [`E2/pro-towers`](#n-e2-pro-towers) and
  [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos).
- `E5:abstract/uniform-index-colimits` also cites
  [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos) for the
  sequential lim/lim¹ argument. It keeps the citation of layer E2 for the
  general multiplicative derived-limit filtration, which no declaration
  states (gap [G5.2](#gap-g5-2)), and of layer E1 for the Gorenstein index
  bound, which needs ordinary Ext and projective-dimension facts that no E1
  declaration states (the E1 request [R5.1](#req-r5-1)).
- `E5:animation/bounded-totalization-colimits` cited layer E2 for unbounded
  Postnikov convergence and hypercompleteness; it now cites
  [`E2/space-sheaves-and-postnikov`](#n-e2-space-sheaves-and-postnikov).
- `E2/perfect-h-cech-descent` applies the E5 module-descent theorem for Čech
  effectivity (request [R0.2](#req-r0-2)) without citing it; it now cites
  [`E5:abstract/module-descent-and-functoriality`](#n-e5-abstract-module-descent-and-functoriality).
  The node graph stays acyclic: module descent depends on E0, E1, E3, the two
  tower declarations of E2 and E5 declarations, none of which uses
  h-descent.
- Five E5 declarations whose constructions use E0's coherent functor
  categories, Cat∞ or mapping-space equivalences, as request
  [R5.7](#req-r5-7) says, now cite them:
  `E5:abstract/infinity-operad` cites
  [`E0/mapping-space-kan-and-equivalences`](#n-e0-mapping-space-kan-and-equivalences);
  `E5:abstract/monoidal-categories-over-an-operad` and
  `E5:abstract/algebra-objects` cite
  [`E0/coherent-functors`](#n-e0-coherent-functors);
  `E5:abstract/left-derivable-cocartesian-families` and
  `E5:presentability/coherent-group-actions` cite
  [`E0/coherent-functors`](#n-e0-coherent-functors) and
  [`E0/higher-category-carrier`](#n-e0-higher-category-carrier).

**What remains across the parts.** Request [R5.6](#req-r5-6) asked E3 to
isolate its abstract Kan-extension and adjoint theorems from concrete inputs.
The Kan extension theorem now uses only E0. The adjoint theorem still cites
`E1/derived-presentability`, which serves only its acceptance example (the
étale coreflection); moving that example to the consumer would make the
theorem depend on E0 and E3 alone. Request [R5.7](#req-r5-7) remains open
for straightening over N(Fin_*), LM and Ass and for mapping-space
composition laws, which E0's restricted shapes do not cover. Requests
[R5.2](#req-r5-2) and [R5.3](#req-r5-3) are answered except for the
multiplicative filtration and the Amitsur–completion comparison of a finitely
generated module over a Noetherian ring, which no E4 declaration states; the
latter is used only by an acceptance check of `E5:abstract/descendable-algebras`.

**Layer order.** The table compares the layer edges induced by the
declarations' prerequisites (counting distinct prerequisite declarations) with
the stage edges the atlas records.

| Prerequisite layer | Consumer layer | Prerequisite declarations | Atlas stage edge |
| --- | --- | ---: | --- |
| E0 | E1 | 7 | yes |
| E0 | E2 | 6 | no |
| E1 | E2 | 10 | yes |
| E3 | E2 | 1 | no |
| E5:abstract | E2 | 1 | no |
| E0 | E3 | 9 | yes |
| E1 | E3 | 5 | yes |
| E2 | E3 | 0 | yes |
| E0 | E4 | 1 | no |
| E1 | E4 | 5 | yes |
| E2 | E4 | 9 | no |
| E3 | E4 | 2 | yes |
| E5:abstract | E5 | 1 | yes |
| E5:presentability | E5 | 0 | yes |
| E5:animation | E5 | 1 | yes |
| E5:cotangent-export | E5 | 1 | yes |
| E5:spectra-comparison | E5 | 1 | yes |
| E0 | E5:abstract | 7 | yes |
| E1 | E5:abstract | 2 | no |
| E2 | E5:abstract | 3 | no |
| E3 | E5:abstract | 2 | no |
| E5:presentability | E5:abstract | 2 | no |
| E0 | E5:presentability | 5 | no |
| E1 | E5:presentability | 1 | no |
| E3 | E5:presentability | 2 | yes |
| E5:abstract | E5:presentability | 4 | yes |
| E0 | E5:animation | 1 | yes |
| E2 | E5:animation | 1 | no |
| E3 | E5:animation | 1 | yes |
| E5:abstract | E5:animation | 0 | yes |
| E5:presentability | E5:animation | 1 | no |
| E5:abstract | E5:cotangent-export | 1 | no |
| E5:animation | E5:cotangent-export | 2 | yes |
| E1 | E5:spectra-comparison | 2 | no |
| E5:abstract | E5:spectra-comparison | 2 | yes |

Three conflicts follow, each with a structural proposal (proposals 5, 4 and 9 below):

1. The atlas records E2 → E3, but no E3 declaration uses E2, while
   `E2/space-sheaves-and-postnikov` uses `E3/accessible-localizations`.
   Proposal: replace the edge by E3 → E2.
2. E2 → E5:abstract → E2: E5's descendable algebras use the tower
   declarations of E2, and E2's h-Čech descent uses E5's module descent.
   Proposal: a sub-layer E2:towers holding `E2/coherent-towers-and-roos` and
   `E2/pro-towers`, which use only E0 and E1; the missing multiplicative
   filtration belongs there too.
3. E5:abstract → E5:presentability → E5:abstract: the descent declarations and
   formal tensor inversion use presentable categories, while E5:presentability
   uses the monoidal declarations. Proposal: a sub-layer E5:descent for
   `descendable-algebras`, `module-descent-and-functoriality` and
   `uniform-index-colimits`, and E5:presentability as the parent of
   `formal-tensor-inversion`.

With all three proposals, the layer graph is acyclic.

**Upward citations.** E0–E4 cite no roadmap of a higher upstream tier. In E5,
`E5:cotangent-export/the-imported-interface` cites nine DD.0 declarations,
and `E5:cotangent-export/e-infinity-comparison-in-proved-ranges` and
`E5:spectra-comparison/late-realisation` cite four H.5 declarations (see the
import table above). The joint acceptance diagram depends on both return
layers.

## Requests to other roadmaps

<a id="req-r0-1"></a>**R0.1** (layers E0–E4) to `DiamondsAndVStacks:D0`. Ordinary coherent-site/topos and slice interfaces: generic free module-sheaf generators/extensions by zero and exact/filtered-colimit section computations. Ordinary scheme geometry supplies perfection, affine quasicoherence, h-cover refinements and Noetherian fppf/proper cover bounds: tensor-nilpotence of the structure-algebra fibre in the ordinary derived category with finite index and its base-change bound. E1 lifts these ordinary comparisons to the enhancement; E2 owns the perfect-cover Frobenius/telescope argument and h-descent. The Frobenius elimination of positive Tor in the perfected fibre products is a precise geometric comparison input, not a request for a second general animation theory. Generic site-module generators and the geometric bounds are requested extensions where the current D0 packet lacks them. Reuse matching D0 nodes and the pinned SheafOfModules carrier.

Needed by: [`E1/k-injective-and-k-flat-replacements`](#n-e1-k-injective-and-k-flat-replacements), [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor), [`E2/postnikov-local-injectivity`](#n-e2-postnikov-local-injectivity), [`E2/postnikov-uniform-window`](#n-e2-postnikov-uniform-window), [`E2/postnikov-diagonal-bound`](#n-e2-postnikov-diagonal-bound), [`E2/locally-weakly-contractible`](#n-e2-locally-weakly-contractible), [`E2/weakly-contractible-compact-generators`](#n-e2-weakly-contractible-compact-generators), [`E1/k-flat-replacement`](#n-e1-k-flat-replacement), [`E1/derived-presentability`](#n-e1-derived-presentability), [`E1/ringed-pullback-pushforward`](#n-e1-ringed-pullback-pushforward), [`E2/perfect-h-topology`](#n-e2-perfect-h-topology), [`E2/perfect-h-cover-descendability`](#n-e2-perfect-h-cover-descendability).

<a id="req-r0-2"></a>**R0.2** (layers E0–E4) to `EnhancedDerivedSheaves:E5:abstract`. Only quantitative descendability and generic module-descent for a commutative algebra map whose fibre becomes tensor-nilpotent (BS Witt §§11.2–11.3, Theorem 11.15). E2 consumes this for h-Čech effectivity. Extract an acyclic declaration-level interface depending on E0/E1 foundations, without importing geometric h-descent back into its own proof. General monoidal/operadic, animation and Ind theories remain E5-owned.

Needed by: [`E2/perfect-h-cech-descent`](#n-e2-perfect-h-cech-descent).

<a id="req-r0-3"></a>**R0.3** (layers E0–E4) to `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules`. Reuse the existing DGAInfinity layer-1 DG carriers and H0 functors. Current Tau Ceti already implements TauCeti.DGCategory, dgHomComplex, DGHomotopyCategory and CategoryTheory.EnrichedFunctor.mapDGHomotopyCategory; adapt to those declarations on migration beyond the pins. No additional general DG carrier or H0 category is requested.

Needed by: [`E0/dg-nerve`](#n-e0-dg-nerve), [`E0/dold-kan-simplicial-enrichment`](#n-e0-dold-kan-simplicial-enrichment), [`E0/dg-nerve-homotopy-category-and-mapping-spaces`](#n-e0-dg-nerve-homotopy-category-and-mapping-spaces).

<a id="req-r0-4"></a>**R0.4** (layers E0–E4) to `tauceti:TauCetiRoadmap/DGAInfinity#layer-0-signed-graded-multilinear-and-tensor-coalgebra-infrastructure`. Reindexing from cohomological to homological grading and the Koszul-braiding comparison between enriched composition factor orders; the existing enrichment is cited separately.

Needed by: [`E0/dg-nerve`](#n-e0-dg-nerve), [`E1/sheaves-of-modules-and-the-grothendieck-property`](#n-e1-sheaves-of-modules-and-the-grothendieck-property).

<a id="req-r5-1"></a>**R5.1** (layers E5) to `EnhancedDerivedSheaves:E1`. Module specialization: perfect-ring Tor vanishing; flat Frobenius-root ideals; the projective/flat dimension bounds for perfections and finite presentations, with their countability hypotheses; valuation-module finite-freeness criterion; derived tensor/Hom and the splitting-obstruction triangle. Concrete qcqs Dqc, base change, Zariski/fppf/nilpotent-cover descent, and affine-to-scheme perfection comparison must use E1/E2’s enhancement. The claims and counterexamples in BS17 S318–S321, F618–F619 and Q1141,Q1143,Q1145–Q1148 remain in E1, with the source’s finite-dimension bounds stated separately from unsupported general finite global dimension.

Needed by: [`E5:abstract/uniform-index-colimits`](#n-e5-abstract-uniform-index-colimits), [`E5:presentability/coherent-group-actions`](#n-e5-presentability-coherent-group-actions).

<a id="req-r5-2"></a>**R5.2** (layers E5) to `EnhancedDerivedSheaves:E2`. Pro-zero towers and pro-isomorphisms of modules and their coherent enhancement; the strict countable Roos derived-limit model, Milnor sequence, pro-zero invariance, and multiplicative finite-cohomological-dimension derived-limit filtration used in uniform descendability. Supply bounded/Postnikov totalization convergence, h-descent/hypercompleteness and the geometric Dqc descent results of BS17 Q1132–Q1152 in this direction. CompletedCohomologyPartII and ArithmeticGaloisDuality consume this E2 construction; they do not supply it.

Needed by: [`E5:abstract/descendable-algebras`](#n-e5-abstract-descendable-algebras), [`E5:abstract/uniform-index-colimits`](#n-e5-abstract-uniform-index-colimits), [`E5:animation/bounded-totalization-colimits`](#n-e5-animation-bounded-totalization-colimits).

<a id="req-r5-3"></a>**R5.3** (layers E5) to `EnhancedDerivedSheaves:E4`. Identify Amitsur completion of a finitely generated module for a Noetherian ring and ideal quotient with derived adic completion (the Carlsson completion input); do not confuse this comparison with finite-index descendability.

Needed by: [`E5:abstract/descendable-algebras`](#n-e5-abstract-descendable-algebras).

<a id="req-r5-4"></a>**R5.4** (layers E5) to `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-0-discrete-modules-and-continuous-sections`. Import the upstream discrete continuous coefficient dictionary and finite-quotient actions unchanged; no new cochain theory is planned here.

Needed by: [`E5:presentability/coherent-group-actions`](#n-e5-presentability-coherent-group-actions).

<a id="req-r5-5"></a>**R5.5** (layers E5) to `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`. Import its canonical all-degree continuous finite-quotient cocone, with coefficients M^U and inflation-and-inclusion transitions, to test the E1 enhanced-invariants adapter.

Needed by: [`E5:presentability/coherent-group-actions`](#n-e5-presentability-coherent-group-actions).

<a id="req-r5-6"></a>**R5.6** (layers E5) to `EnhancedDerivedSheaves:E3`. Isolate the abstract full-inclusion left Kan extension (including the right-Kan variant for source-localization derivation) from its whole E1/E2 stage inputs, and the conditional accessible adjoint/localization theorem from E1’s concrete presentability application. Keep the existing precise node ids and restrict their prerequisite chains to E0 categorical infrastructure and the E5 generic presentability definition when that hypothesis is needed. E1’s concrete presentability-and-derived-tensor node then imports E5 rather than being an input to its definition.

Needed by: [`E5:abstract/symmetric-monoidal-infinity-category`](#n-e5-abstract-symmetric-monoidal-infinity-category), [`E5:abstract/idempotent-completion`](#n-e5-abstract-idempotent-completion), [`E5:abstract/left-derivable-cocartesian-families`](#n-e5-abstract-left-derivable-cocartesian-families), [`E5:presentability/ind-completion`](#n-e5-presentability-ind-completion), [`E5:presentability/universal-property-of-ind`](#n-e5-presentability-universal-property-of-ind), [`E5:presentability/presentable-categories`](#n-e5-presentability-presentable-categories), [`E5:animation/nonabelian-derived-category`](#n-e5-animation-nonabelian-derived-category), [`E5:animation/universal-property-of-animation`](#n-e5-animation-universal-property-of-animation).

<a id="req-r5-7"></a>**R5.7** (layers E5) to `EnhancedDerivedSheaves:E0`. Expose coherent functor categories, transformations, mapping-space Kan/composition laws and the straightening interfaces for N(Fin_*), LM/Ass operadic bases and their pullbacks. E5 extends to arbitrary small infinity-categorical bases by the NS A.16–A.17 Cat∞ colimit-gluing argument; do not silently replace E0’s restricted shapes by unrestricted straightening.

Needed by: [`E5:abstract/symmetric-monoidal-infinity-category`](#n-e5-abstract-symmetric-monoidal-infinity-category), [`E5:abstract/infinity-operad`](#n-e5-abstract-infinity-operad), [`E5:abstract/monoidal-categories-over-an-operad`](#n-e5-abstract-monoidal-categories-over-an-operad), [`E5:abstract/algebra-objects`](#n-e5-abstract-algebra-objects), [`E5:abstract/module-objects`](#n-e5-abstract-module-objects), [`E5:abstract/left-derivable-cocartesian-families`](#n-e5-abstract-left-derivable-cocartesian-families), [`E5:presentability/coherent-group-actions`](#n-e5-presentability-coherent-group-actions).


## Gaps

<a id="gap-g0-1"></a>**G0.1. Signed enrichment and nerve comparison.** DGAInfinity layers 0–1 own the graded/DG carriers and factor-order convention. The E0 plan gives the sign and Dold–Kan comparison; its explicit coherent comparison θ, operator compatibility and identification with the pinned cone/rotation convention need declaration-level Lean proofs and signatures. HA/HTT statements and the triangulation proof were read; this is a formal interface/proof gap, not an unread theorem. The plain Dold–Kan equivalence does not provide the right-lax monoidal truncation/Dold–Kan constraints or their Alexander–Whitney coherence. These and the Kan property of simplicial abelian groups are explicit formal inputs to node dold-kan-simplicial-enrichment.

Needed by: [`E0/dg-nerve`](#n-e0-dg-nerve), [`E0/dold-kan-simplicial-enrichment`](#n-e0-dold-kan-simplicial-enrichment), [`E0/dg-nerve-coherent-comparison`](#n-e0-dg-nerve-coherent-comparison), [`E0/stable-api-and-the-sign-comparison`](#n-e0-stable-api-and-the-sign-comparison).

<a id="gap-g0-2"></a>**G0.2. CoCartesian and accessible higher-category interfaces.** Cat∞, Spaces, cores, locally small mapping models, cardinal filteredness, compactness, presentability and horn-defined coCartesian edges now have actual typed prototypes. Restricted straightening/unstraightening, the mapping-space pullback comparison, size-preserving coherent classifier construction and several fixture comparisons still need signatures and proofs. Data signatures do not implement these carriers.

Needed by: [`E0/cocartesian-edges-and-fibrations`](#n-e0-cocartesian-edges-and-fibrations), [`E0/cocartesian-fibrations-and-restricted-straightening`](#n-e0-cocartesian-fibrations-and-restricted-straightening), [`E0/accessible-and-presentable`](#n-e0-accessible-and-presentable).

<a id="gap-g0-3"></a>**G0.3. Functorial replacements with universe control.** HA provides combinatorial injective localization and Stacks 06YS provides objectwise unbounded K-flat existence. The proposed free-cover staircase must be made functorial and shown closed within one sufficiently large regular cardinal. Objectwise 06YS alone does not prove those two stronger construction properties. Diagram replacement comparison is part of the same interface.

Needed by: [`E1/k-flat-replacement`](#n-e1-k-flat-replacement), [`E1/k-injective-and-k-flat-replacements`](#n-e1-k-injective-and-k-flat-replacements).

<a id="gap-g0-4"></a>**G0.4. Point-free enhanced ringed localization.** Liu–Zheng §3.1 assumes enough points. Extend the point-free injective/K-flat localization comparison to coherent variable-coefficient sections, retaining tensor/Hom and all mapping spaces. HA 1.3.4.25 for constant model diagrams is an input, not a proof of the variable-ring Cartesian comparison. Do not add an implicit enough-points hypothesis to arbitrary replete topoi.

Needed by: [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor), [`E1/derived-internal-hom`](#n-e1-derived-internal-hom), [`E1/ringed-pullback-pushforward`](#n-e1-ringed-pullback-pushforward), [`E3/point-free-ringed-system-comparison`](#n-e3-point-free-ringed-system-comparison).

<a id="gap-g0-5"></a>**G0.5. Perfect-ring algebra bridges.** The pinned Tor derives one tensor variable and does not contain the comparison with Tor′ or the K-flat enhancement. Supply this comparison, regular-Noetherian finite global dimension/Kunz prerequisites and their colimit-perfection bridge from existing commutative algebra. Do not identify the pinned inverse-limit Perfection construction with forward-colimit scheme perfection. The announced intrinsic global dimension ≤2dim+1 has no proof at the cited remark and is not planned as a proved target; the corrected Tor bound ≤2dim is the recorded target.

Needed by: [`E1/perfect-ring-tor`](#n-e1-perfect-ring-tor), [`E1/perfect-finite-tor-dimension`](#n-e1-perfect-finite-tor-dimension), [`E1/perfect-finite-global-dimension`](#n-e1-perfect-finite-global-dimension), [`E1/kunz-converse-by-perfection`](#n-e1-kunz-converse-by-perfection).

<a id="gap-g0-6"></a>**G0.6. Ordinary geometric h-descent inputs.** Lower-tier D0/ordinary scheme owners supply scheme perfection, affine quasicoherent-module comparison, h-cover refinement and ordinary Noetherian fppf/proper tensor-nilpotence bounds with base-change control. E1 owns the unbounded enhanced comparison. E2 perfect-h-cover-descendability owns the uniform-index Frobenius/telescope proof (Witt 11.22–11.27, pp. 44–46). The geometric Frobenius/positive-Tor elimination in perfected fibre products (11.6, pp. 41–42) still needs a formal comparison; ordinary h-cover cohomology alone does not suffice. Keep qcqs/perfect finite-presentation and finite-dimensional regular-base hypotheses exactly. Neither D0 nor the acyclic E5 abstract module-descent leaf is made dependent on E2 h-descent.

Needed by: [`E1/quasicoherent-derived-sheaves`](#n-e1-quasicoherent-derived-sheaves), [`E2/perfect-h-topology`](#n-e2-perfect-h-topology), [`E2/perfect-h-boundedness`](#n-e2-perfect-h-boundedness), [`E2/perfect-h-hyperdescent`](#n-e2-perfect-h-hyperdescent), [`E2/perfect-h-cover-descendability`](#n-e2-perfect-h-cover-descendability).

<a id="gap-g0-7"></a>**G0.7. Acyclic abstract module descent.** Request the E5-owned tensor-nilpotence/descendability module-descent theorem at declaration level. A stage-wide E5 import can conceal an E2→E5→E2 cycle. Its supplier theorem must use E0/E1 algebraic foundations alone; this packet does not build a private second abstract module-descent theory.

Needed by: [`E2/perfect-h-cech-descent`](#n-e2-perfect-h-cech-descent).

<a id="gap-g0-8"></a>**G0.8. Higher sheaf localization and matching objects.** The target statements and examples specify augmented matching objects, the OneHypercover degree-one comparison, sheaves of Kan spaces, hypercompletion and effective Postnikov towers. General matching-object/hypercover and small generating-set localization interfaces remain to be encoded. Hypercompleteness by itself is not treated as Postnikov effectivity. HTT 7.2.1.10 and its full convergence proof were read.

Needed by: [`E2/hypercover`](#n-e2-hypercover), [`E2/space-sheaves-and-postnikov`](#n-e2-space-sheaves-and-postnikov), [`E2/weakly-contractible-space-postnikov`](#n-e2-weakly-contractible-space-postnikov).

<a id="gap-g0-9"></a>**G0.9. Completion algebra and its formal comparisons.** E1/E4 now own Koszul complexes, generic completeness and its reflector, the Koszul power tower, regular-ideal ordinary quotients, completed tensor and derived Nakayama. The tier-9 DerivedDeRhamCohomology roadmap must import these lower-tier nodes. The formal varying-unbounded-coefficient pro-Tor comparison requires degreewise pro-zero error control and uniform finite Koszul amplitude; it is the E4 coefficient-pro-tor-comparison target and is not discharged by ordinary quotient cofinality alone. General generator/localization compatibility and coherent tensor/reflector proofs remain formal gaps, not requests to a higher roadmap.

Needed by: [`E4/the-imported-completion-interface`](#n-e4-the-imported-completion-interface), [`E4/coefficient-pro-tor-comparison`](#n-e4-coefficient-pro-tor-comparison), [`E4/reconstruction-counit`](#n-e4-reconstruction-counit), [`E4/reconstruction-unit`](#n-e4-reconstruction-unit), [`E4/perfect-coefficient-change`](#n-e4-perfect-coefficient-change).

<a id="gap-g0-10"></a>**G0.10. Higher mate and coefficient reconstruction coherence.** CoCartesian quotient-ring sections, evaluation and successor equivalences, reduction/reconstruction functors and coherent unit/counit now have typed prototypes. Their fibre/scalar-transport laws and identification with the point-free ringed diagram model remain explicit proof/signature obligations. Finite mate maps are already baseline. Apply the point-free E3 comparison and the E4 uniform regular-sequence pro-Tor input; do not infer this from h-category equivalence.

Needed by: [`E3/mates-and-beck-chevalley`](#n-e3-mates-and-beck-chevalley), [`E4/compatible-coefficient-systems`](#n-e4-compatible-coefficient-systems), [`E4/coefficient-system-reconstruction`](#n-e4-coefficient-system-reconstruction).

<a id="gap-g0-11"></a>**G0.11. Source-version collation.** Four author-copy proof/source issues have exact locators, corrected statements and concrete reasons. Collate the full version-of-record pages of the two BS papers; the unavailable published pages are not accused. The plan uses the corrected quantifiers, mapping spaces and ring directions.

Needed by: [`E2/replete-postnikov-counit`](#n-e2-replete-postnikov-counit), [`E2/postnikov-finite-cohomological-dimension`](#n-e2-postnikov-finite-cohomological-dimension), [`E1/perfect-scheme-base-change`](#n-e1-perfect-scheme-base-change).

<a id="gap-g0-12"></a>**G0.12. Actual suggested-signature conditions.** Follow the exhaustive suggestedCoverage matrix. Partial entries identify the exact mathematical condition or comparison still missing; omitted entries are not represented by proposition-valued fields. The new higher-category, Postnikov and constant-ring coefficient interfaces reduce the omitted signatures but do not discharge point-free localization, matching-object, signed-DG or supplier-algebra obligations.

Needed by: [`E0/dg-nerve`](#n-e0-dg-nerve), [`E0/dg-nerve-homotopy-category-and-mapping-spaces`](#n-e0-dg-nerve-homotopy-category-and-mapping-spaces), [`E0/limits-colimits-and-slices`](#n-e0-limits-colimits-and-slices), [`E0/stable-api-and-the-sign-comparison`](#n-e0-stable-api-and-the-sign-comparison), [`E0/cocartesian-fibrations-and-restricted-straightening`](#n-e0-cocartesian-fibrations-and-restricted-straightening), [`E1/sheaves-of-modules-and-the-grothendieck-property`](#n-e1-sheaves-of-modules-and-the-grothendieck-property), [`E1/k-injective-and-k-flat-replacements`](#n-e1-k-injective-and-k-flat-replacements), [`E1/enhanced-derived-category`](#n-e1-enhanced-derived-category), [`E1/presentability-and-derived-tensor`](#n-e1-presentability-and-derived-tensor), [`E2/countable-products-and-inverse-limits`](#n-e2-countable-products-and-inverse-limits), [`E2/left-completion`](#n-e2-left-completion), [`E2/locally-weakly-contractible-topoi`](#n-e2-locally-weakly-contractible-topoi), [`E2/hypercovers-and-cohomological-descent`](#n-e2-hypercovers-and-cohomological-descent), [`E3/left-kan-extension-along-a-full-inclusion`](#n-e3-left-kan-extension-along-a-full-inclusion), [`E3/coherent-diagrams-of-ringed-topoi`](#n-e3-coherent-diagrams-of-ringed-topoi), [`E3/adjoint-functor-theorem-and-localisations`](#n-e3-adjoint-functor-theorem-and-localisations), [`E3/mates-and-beck-chevalley`](#n-e3-mates-and-beck-chevalley), [`E0/right-mapping-space`](#n-e0-right-mapping-space), [`E0/dg-nerve-mapping-space`](#n-e0-dg-nerve-mapping-space), [`E0/dold-kan-simplicial-enrichment`](#n-e0-dold-kan-simplicial-enrichment), [`E0/dg-nerve-coherent-comparison`](#n-e0-dg-nerve-coherent-comparison), [`E2/replete-slice`](#n-e2-replete-slice), [`E2/replete-cover-descent`](#n-e2-replete-cover-descent), [`E2/inverse-limit-relative-epis`](#n-e2-inverse-limit-relative-epis), [`E2/surjective-system-derived-limit`](#n-e2-surjective-system-derived-limit), [`E2/inverse-limit-amplitude`](#n-e2-inverse-limit-amplitude), [`E2/postnikov-left-completion`](#n-e2-postnikov-left-completion), [`E2/completion-adjunction`](#n-e2-completion-adjunction), [`E2/replete-postnikov-unit`](#n-e2-replete-postnikov-unit), [`E2/replete-postnikov-counit`](#n-e2-replete-postnikov-counit), [`E2/locally-weakly-contractible`](#n-e2-locally-weakly-contractible), [`E2/weakly-contractible-compact-generators`](#n-e2-weakly-contractible-compact-generators), [`E2/weakly-contractible-space-postnikov`](#n-e2-weakly-contractible-space-postnikov), [`E2/hypercover`](#n-e2-hypercover), [`E2/bounded-below-hypercover-descent`](#n-e2-bounded-below-hypercover-descent), [`E2/unbounded-hypercover-unit`](#n-e2-unbounded-hypercover-unit), [`E2/unbounded-hypercover-counit-left`](#n-e2-unbounded-hypercover-counit-left), [`E2/unbounded-hypercover-descent`](#n-e2-unbounded-hypercover-descent), [`E2/postnikov-local-injectivity`](#n-e2-postnikov-local-injectivity), [`E2/postnikov-uniform-window`](#n-e2-postnikov-uniform-window), [`E2/postnikov-diagonal-bound`](#n-e2-postnikov-diagonal-bound), [`E2/postnikov-local-finite-dimension`](#n-e2-postnikov-local-finite-dimension), [`E2/postnikov-finite-cohomological-dimension`](#n-e2-postnikov-finite-cohomological-dimension), [`E2/exact-sections-postnikov`](#n-e2-exact-sections-postnikov), [`E4/derived-complete-sheaves`](#n-e4-derived-complete-sheaves), [`E4/local-generator-criterion`](#n-e4-local-generator-criterion), [`E4/complete-sheaves-limits`](#n-e4-complete-sheaves-limits), [`E4/the-imported-completion-interface`](#n-e4-the-imported-completion-interface), [`E4/complete-module-weak-serre`](#n-e4-complete-module-weak-serre), [`E4/complete-cohomology-criterion`](#n-e4-complete-cohomology-criterion), [`E4/classical-completion-comparison`](#n-e4-classical-completion-comparison), [`E4/complete-internal-hom`](#n-e4-complete-internal-hom), [`E4/completed-sheaf-tensor`](#n-e4-completed-sheaf-tensor), [`E4/completed-tensor-hom-adjunction`](#n-e4-completed-tensor-hom-adjunction), [`E4/compatible-coefficient-systems`](#n-e4-compatible-coefficient-systems), [`E4/coefficient-reduction`](#n-e4-coefficient-reduction), [`E4/inverse-limit-reconstruction`](#n-e4-inverse-limit-reconstruction), [`E4/coefficient-pro-tor-comparison`](#n-e4-coefficient-pro-tor-comparison), [`E4/reconstruction-counit`](#n-e4-reconstruction-counit), [`E4/reconstruction-unit`](#n-e4-reconstruction-unit), [`E4/completed-coefficient-ring`](#n-e4-completed-coefficient-ring), [`E4/coefficient-system-reconstruction`](#n-e4-coefficient-system-reconstruction), [`E4/completed-colimits`](#n-e4-completed-colimits), [`E4/perfect-coefficient-change`](#n-e4-perfect-coefficient-change), [`E4/mod-ideal-detection`](#n-e4-mod-ideal-detection), [`E0/slices-and-cones`](#n-e0-slices-and-cones), [`E0/limits-colimits-universal-properties`](#n-e0-limits-colimits-universal-properties), [`E0/mapping-space-kan-and-equivalences`](#n-e0-mapping-space-kan-and-equivalences), [`E0/stable-categories`](#n-e0-stable-categories), [`E0/cocartesian-edges-and-fibrations`](#n-e0-cocartesian-edges-and-fibrations), [`E1/k-flat-complexes`](#n-e1-k-flat-complexes), [`E1/k-flat-replacement`](#n-e1-k-flat-replacement), [`E1/derived-presentability`](#n-e1-derived-presentability), [`E1/derived-internal-hom`](#n-e1-derived-internal-hom), [`E1/ringed-pullback-pushforward`](#n-e1-ringed-pullback-pushforward), [`E1/coefficient-change-and-perfect-action`](#n-e1-coefficient-change-and-perfect-action), [`E1/perfect-ring-tor`](#n-e1-perfect-ring-tor), [`E1/perfect-finite-tor-dimension`](#n-e1-perfect-finite-tor-dimension), [`E1/perfect-finite-global-dimension`](#n-e1-perfect-finite-global-dimension), [`E1/perfect-intrinsic-dimension-bounds`](#n-e1-perfect-intrinsic-dimension-bounds), [`E1/kunz-converse-by-perfection`](#n-e1-kunz-converse-by-perfection), [`E1/valuation-saturated-finite-free`](#n-e1-valuation-saturated-finite-free), [`E1/quasicoherent-derived-sheaves`](#n-e1-quasicoherent-derived-sheaves), [`E1/perfect-scheme-base-change`](#n-e1-perfect-scheme-base-change), [`E1/cohomology-base-change-map`](#n-e1-cohomology-base-change-map), [`E1/splitting-through-comparison`](#n-e1-splitting-through-comparison), [`E3/cofinality-to-a-fibre`](#n-e3-cofinality-to-a-fibre), [`E3/cocartesian-edge-preservation`](#n-e3-cocartesian-edge-preservation), [`E3/point-free-ringed-system-comparison`](#n-e3-point-free-ringed-system-comparison), [`E3/representability`](#n-e3-representability), [`E3/accessible-localizations`](#n-e3-accessible-localizations), [`E3/presentable-category-limits`](#n-e3-presentable-category-limits), [`E3/exact-coproducts-colimits`](#n-e3-exact-coproducts-colimits), [`E3/right-adjoint-coproducts`](#n-e3-right-adjoint-coproducts), [`E3/cutoff-adjoint-compatibility`](#n-e3-cutoff-adjoint-compatibility), [`E2/coherent-towers-and-roos`](#n-e2-coherent-towers-and-roos), [`E2/tower-milnor`](#n-e2-tower-milnor), [`E2/pro-zero-derived-limit`](#n-e2-pro-zero-derived-limit), [`E2/hypercover-refinement`](#n-e2-hypercover-refinement), [`E2/space-sheaves-and-postnikov`](#n-e2-space-sheaves-and-postnikov), [`E2/perfect-h-topology`](#n-e2-perfect-h-topology), [`E2/perfect-h-cech-descent`](#n-e2-perfect-h-cech-descent), [`E2/perfect-h-boundedness`](#n-e2-perfect-h-boundedness), [`E2/tensor-bounded-totalization`](#n-e2-tensor-bounded-totalization), [`E2/perfect-h-hyperdescent`](#n-e2-perfect-h-hyperdescent), [`E0/full-enhanced-subcategories`](#n-e0-full-enhanced-subcategories), [`E0/enhanced-core`](#n-e0-enhanced-core), [`E0/locally-kan-coherent-nerve`](#n-e0-locally-kan-coherent-nerve), [`E1/koszul-complex`](#n-e1-koszul-complex), [`E4/koszul-completion-tower`](#n-e4-koszul-completion-tower), [`E4/regular-ideal-quotients`](#n-e4-regular-ideal-quotients), [`E2/perfect-h-cover-descendability`](#n-e2-perfect-h-cover-descendability).

<a id="gap-g5-1"></a>**G5.1. Refine abstract supplier dependencies across parts.** E3’s existing full-inclusion Kan-extension node lists whole E1/E2 stages, and its adjoint/localization node also lists E1’s concrete presentability result and the whole E5:presentability stage. The abstract Kan-extension and adjoint interfaces must be isolated from those concrete applications before the combined package has an acyclic prerequisite graph. This packet removes the direct E1/E3-application inputs from its generic presentability definition, preserves the exact existing supplier ids, and requests the dependency refinement from E3. Its own node graph is acyclic; no claim of cross-part closure is made. The separate signatureOmissions record incomplete prototypes, rather than treating absent implementations as mathematical results. E0’s restricted straightening must explicitly expose the operadic base shapes and coherent transformation/mapping-space operations requested here; no general unstraightening implementation is assumed.

Needed by: [`E5:abstract/symmetric-monoidal-infinity-category`](#n-e5-abstract-symmetric-monoidal-infinity-category), [`E5:abstract/idempotent-completion`](#n-e5-abstract-idempotent-completion), [`E5:abstract/left-derivable-cocartesian-families`](#n-e5-abstract-left-derivable-cocartesian-families), [`E5:presentability/ind-completion`](#n-e5-presentability-ind-completion), [`E5:presentability/universal-property-of-ind`](#n-e5-presentability-universal-property-of-ind), [`E5:presentability/presentable-categories`](#n-e5-presentability-presentable-categories), [`E5:animation/nonabelian-derived-category`](#n-e5-animation-nonabelian-derived-category), [`E5:animation/universal-property-of-animation`](#n-e5-animation-universal-property-of-animation), [`E5:abstract/infinity-operad`](#n-e5-abstract-infinity-operad), [`E5:abstract/monoidal-categories-over-an-operad`](#n-e5-abstract-monoidal-categories-over-an-operad), [`E5:abstract/algebra-objects`](#n-e5-abstract-algebra-objects), [`E5:abstract/module-objects`](#n-e5-abstract-module-objects), [`E5:presentability/coherent-group-actions`](#n-e5-presentability-coherent-group-actions).

<a id="gap-g5-2"></a>**G5.2. Amitsur tower and general uniform-index proof input.** Prove the cubical bar/partial-cosimplicial-totalization pro-comparison and import E2’s multiplicative derived-limit filtration for a finite-cohomological-dimension indexing category. The sequential 2m proof is read in BS17 Lemma 11.22; the general case is asserted there without a worked multiplicative-filtration proof. Do not claim a termwise fibre formula for the usual Tot_n solely from a pro-equivalence.

Needed by: [`E5:abstract/descendable-algebras`](#n-e5-abstract-descendable-algebras), [`E5:abstract/uniform-index-colimits`](#n-e5-abstract-uniform-index-colimits).

<a id="gap-g5-3"></a>**G5.3. Coherent p-annihilation for the derived Witt fibre.** BS17 Remark 11.44 asserts p-annihilation. The π_i calculation alone proves p-torsion in positive homotopy, not a nullhomotopy of multiplication by p on the entire fibre. Construct the fibre-level Frobenius nullhomotopy and combine it with the ordinary VF=p identity before claiming the derived map is zero.

Needed by: [`E5:animation/derived-witt-adapter`](#n-e5-animation-derived-witt-adapter).

<a id="gap-g5-4"></a>**G5.4. Continuous categorical action beyond finite quotient factoring.** The finite-group construction and the discrete-continuous-module adapter have precise models. A general profinite action on an infinity-category requires a specified topology or condensed continuity model; no universal filtered-colimit formula for categorical fixed points is supplied. The stage’s appropriate finite-quotient cases are planned; any broader application must name and supply its continuity model.

Needed by: [`E5:presentability/coherent-group-actions`](#n-e5-presentability-coherent-group-actions).


## Coverage

All eleven layers are planned; none is closed. Each layer's note and its
remaining refinements:

**[E0](#layer-e0): planned.** Every scoped target is represented at target level (25 nodes); chains terminate at pinned statements, lower-tier suppliers or explicit gaps. This finishes the planning pass without closure or implementation.

- Signed enrichment and nerve comparison: DGAInfinity layers 0–1 own the graded/DG carriers and factor-order convention. The E0 plan gives the sign and Dold–Kan comparison; its explicit coherent comparison θ, operator compatibility and identification with the pinned cone/rotation convention need declaration-level Lean proofs and signatures. HA/HTT statements and the triangulation proof were read; this is a formal interface/proof gap, not an unread theorem. The plain Dold–Kan equivalence does not provide the right-lax monoidal truncation/Dold–Kan constraints or their Alexander–Whitney coherence. These and the Kan property of simplicial abelian groups are explicit formal inputs to node dold-kan-simplicial-enrichment.
- CoCartesian and accessible higher-category interfaces: Cat∞, Spaces, cores, locally small mapping models, cardinal filteredness, compactness, presentability and horn-defined coCartesian edges now have actual typed prototypes. Restricted straightening/unstraightening, the mapping-space pullback comparison, size-preserving coherent classifier construction and several fixture comparisons still need signatures and proofs. Data signatures do not implement these carriers.
- Actual suggested-signature conditions: Follow the exhaustive suggestedCoverage matrix. Partial entries identify the exact mathematical condition or comparison still missing; omitted entries are not represented by proposition-valued fields. The new higher-category, Postnikov and constant-ring coefficient interfaces reduce the omitted signatures but do not discharge point-free localization, matching-object, signed-DG or supplier-algebra obligations.

**[E1](#layer-e1): planned.** Every scoped target is represented at target level (23 nodes); chains terminate at pinned statements, lower-tier suppliers or explicit gaps. This finishes the planning pass without closure or implementation.

- Functorial replacements with universe control: HA provides combinatorial injective localization and Stacks 06YS provides objectwise unbounded K-flat existence. The proposed free-cover staircase must be made functorial and shown closed within one sufficiently large regular cardinal. Objectwise 06YS alone does not prove those two stronger construction properties. Diagram replacement comparison is part of the same interface.
- Point-free enhanced ringed localization: Liu–Zheng §3.1 assumes enough points. Extend the point-free injective/K-flat localization comparison to coherent variable-coefficient sections, retaining tensor/Hom and all mapping spaces. HA 1.3.4.25 for constant model diagrams is an input, not a proof of the variable-ring Cartesian comparison. Do not add an implicit enough-points hypothesis to arbitrary replete topoi.
- Perfect-ring algebra bridges: The pinned Tor derives one tensor variable and does not contain the comparison with Tor′ or the K-flat enhancement. Supply this comparison, regular-Noetherian finite global dimension/Kunz prerequisites and their colimit-perfection bridge from existing commutative algebra. Do not identify the pinned inverse-limit Perfection construction with forward-colimit scheme perfection. The announced intrinsic global dimension ≤2dim+1 has no proof at the cited remark and is not planned as a proved target; the corrected Tor bound ≤2dim is the recorded target.
- Ordinary geometric h-descent inputs: Lower-tier D0/ordinary scheme owners supply scheme perfection, affine quasicoherent-module comparison, h-cover refinement and ordinary Noetherian fppf/proper tensor-nilpotence bounds with base-change control. E1 owns the unbounded enhanced comparison. E2 perfect-h-cover-descendability owns the uniform-index Frobenius/telescope proof (Witt 11.22–11.27, pp. 44–46). The geometric Frobenius/positive-Tor elimination in perfected fibre products (11.6, pp. 41–42) still needs a formal comparison; ordinary h-cover cohomology alone does not suffice. Keep qcqs/perfect finite-presentation and finite-dimensional regular-base hypotheses exactly. Neither D0 nor the acyclic E5 abstract module-descent leaf is made dependent on E2 h-descent.
- Source-version collation: Four author-copy proof/source issues have exact locators, corrected statements and concrete reasons. Collate the full version-of-record pages of the two BS papers; the unavailable published pages are not accused. The plan uses the corrected quantifiers, mapping spaces and ring directions.
- Actual suggested-signature conditions: Follow the exhaustive suggestedCoverage matrix. Partial entries identify the exact mathematical condition or comparison still missing; omitted entries are not represented by proposition-valued fields. The new higher-category, Postnikov and constant-ring coefficient interfaces reduce the omitted signatures but do not discharge point-free localization, matching-object, signed-DG or supplier-algebra obligations.

**[E2](#layer-e2): planned.** Every scoped target is represented at target level (41 nodes); chains terminate at pinned statements, lower-tier suppliers or explicit gaps. This finishes the planning pass without closure or implementation.

- Ordinary geometric h-descent inputs: Lower-tier D0/ordinary scheme owners supply scheme perfection, affine quasicoherent-module comparison, h-cover refinement and ordinary Noetherian fppf/proper tensor-nilpotence bounds with base-change control. E1 owns the unbounded enhanced comparison. E2 perfect-h-cover-descendability owns the uniform-index Frobenius/telescope proof (Witt 11.22–11.27, pp. 44–46). The geometric Frobenius/positive-Tor elimination in perfected fibre products (11.6, pp. 41–42) still needs a formal comparison; ordinary h-cover cohomology alone does not suffice. Keep qcqs/perfect finite-presentation and finite-dimensional regular-base hypotheses exactly. Neither D0 nor the acyclic E5 abstract module-descent leaf is made dependent on E2 h-descent.
- Acyclic abstract module descent: Request the E5-owned tensor-nilpotence/descendability module-descent theorem at declaration level. A stage-wide E5 import can conceal an E2→E5→E2 cycle. Its supplier theorem must use E0/E1 algebraic foundations alone; this packet does not build a private second abstract module-descent theory.
- Higher sheaf localization and matching objects: The target statements and examples specify augmented matching objects, the OneHypercover degree-one comparison, sheaves of Kan spaces, hypercompletion and effective Postnikov towers. General matching-object/hypercover and small generating-set localization interfaces remain to be encoded. Hypercompleteness by itself is not treated as Postnikov effectivity. HTT 7.2.1.10 and its full convergence proof were read.
- Source-version collation: Four author-copy proof/source issues have exact locators, corrected statements and concrete reasons. Collate the full version-of-record pages of the two BS papers; the unavailable published pages are not accused. The plan uses the corrected quantifiers, mapping spaces and ring directions.
- Actual suggested-signature conditions: Follow the exhaustive suggestedCoverage matrix. Partial entries identify the exact mathematical condition or comparison still missing; omitted entries are not represented by proposition-valued fields. The new higher-category, Postnikov and constant-ring coefficient interfaces reduce the omitted signatures but do not discharge point-free localization, matching-object, signed-DG or supplier-algebra obligations.

**[E3](#layer-e3): planned.** Every scoped target is represented at target level (13 nodes); chains terminate at pinned statements, lower-tier suppliers or explicit gaps. This finishes the planning pass without closure or implementation.

- Point-free enhanced ringed localization: Liu–Zheng §3.1 assumes enough points. Extend the point-free injective/K-flat localization comparison to coherent variable-coefficient sections, retaining tensor/Hom and all mapping spaces. HA 1.3.4.25 for constant model diagrams is an input, not a proof of the variable-ring Cartesian comparison. Do not add an implicit enough-points hypothesis to arbitrary replete topoi.
- Higher mate and coefficient reconstruction coherence: CoCartesian quotient-ring sections, evaluation and successor equivalences, reduction/reconstruction functors and coherent unit/counit now have typed prototypes. Their fibre/scalar-transport laws and identification with the point-free ringed diagram model remain explicit proof/signature obligations. Finite mate maps are already baseline. Apply the point-free E3 comparison and the E4 uniform regular-sequence pro-Tor input; do not infer this from h-category equivalence.
- Actual suggested-signature conditions: Follow the exhaustive suggestedCoverage matrix. Partial entries identify the exact mathematical condition or comparison still missing; omitted entries are not represented by proposition-valued fields. The new higher-category, Postnikov and constant-ring coefficient interfaces reduce the omitted signatures but do not discharge point-free localization, matching-object, signed-DG or supplier-algebra obligations.

**[E4](#layer-e4): planned.** Every scoped target is represented at target level (23 nodes); chains terminate at pinned statements, lower-tier suppliers or explicit gaps. This finishes the planning pass without closure or implementation.

- Completion algebra and its formal comparisons: E1/E4 now own Koszul complexes, generic completeness and its reflector, the Koszul power tower, regular-ideal ordinary quotients, completed tensor and derived Nakayama. The tier-9 DerivedDeRhamCohomology roadmap must import these lower-tier nodes. The formal varying-unbounded-coefficient pro-Tor comparison requires degreewise pro-zero error control and uniform finite Koszul amplitude; it is the E4 coefficient-pro-tor-comparison target and is not discharged by ordinary quotient cofinality alone. General generator/localization compatibility and coherent tensor/reflector proofs remain formal gaps, not requests to a higher roadmap.
- Higher mate and coefficient reconstruction coherence: CoCartesian quotient-ring sections, evaluation and successor equivalences, reduction/reconstruction functors and coherent unit/counit now have typed prototypes. Their fibre/scalar-transport laws and identification with the point-free ringed diagram model remain explicit proof/signature obligations. Finite mate maps are already baseline. Apply the point-free E3 comparison and the E4 uniform regular-sequence pro-Tor input; do not infer this from h-category equivalence.
- Actual suggested-signature conditions: Follow the exhaustive suggestedCoverage matrix. Partial entries identify the exact mathematical condition or comparison still missing; omitted entries are not represented by proposition-valued fields. The new higher-category, Postnikov and constant-ring coefficient interfaces reduce the omitted signatures but do not discharge point-free localization, matching-object, signed-DG or supplier-algebra obligations.
- The tier-4 ownership move requires the later DD.1 plan/package to import the generic completion nodes. Koszul tower and regular quotient natural-equivalence signatures remain explicitly omitted; varying coefficient pro-Tor still needs its uniform-amplitude formal comparison.

**[E5](#layer-e5): planned.** Every target is stated and linked to a baseline declaration, a supplier node/request, or a precise gap. This is a completed planning pass, not a closed or implemented library.

- Refine the full coherent Lean signatures against the E0/E3 supplier interfaces; see signatureOmissions.

**[E5:abstract](#layer-e5-abstract): planned.** Every target is stated and linked to a baseline declaration, a supplier node/request, or a precise gap. This is a completed planning pass, not a closed or implemented library.

- Refine the full coherent Lean signatures against the E0/E3 supplier interfaces; see signatureOmissions.
- Supply the E2 pro-tower comparison and multiplicative finite-cohomological-dimension filtration for descendability.
- Reconcile the recorded generic E3 supplier dependencies before claiming cross-part closure.

**[E5:animation](#layer-e5-animation): planned.** Every target is stated and linked to a baseline declaration, a supplier node/request, or a precise gap. This is a completed planning pass, not a closed or implemented library.

- Refine the full coherent Lean signatures against the E0/E3 supplier interfaces; see signatureOmissions.
- Construct the coherent p-nullhomotopy on the Witt fibre and use E2’s exact bounded-totalization input.
- Reconcile the recorded generic E3 supplier dependencies before claiming cross-part closure.

**[E5:cotangent-export](#layer-e5-cotangent-export): planned.** Every target is stated and linked to a baseline declaration, a supplier node/request, or a precise gap. This is a completed planning pass, not a closed or implemented library.

- Refine the full coherent Lean signatures against the E0/E3 supplier interfaces; see signatureOmissions.
- Integrate the exact DD.0 and H.5 comparisons at packaging; do not introduce a new cotangent complex.

**[E5:presentability](#layer-e5-presentability): planned.** Every target is stated and linked to a baseline declaration, a supplier node/request, or a precise gap. This is a completed planning pass, not a closed or implemented library.

- Refine the full coherent Lean signatures against the E0/E3 supplier interfaces; see signatureOmissions.
- Complete the discrete-continuous-module adapter to upstream ProfiniteCohomology; specify continuity before any broader profinite categorical application.
- Reconcile the recorded generic E3 supplier dependencies before claiming cross-part closure.

**[E5:spectra-comparison](#layer-e5-spectra-comparison): planned.** Every target is stated and linked to a baseline declaration, a supplier node/request, or a precise gap. This is a completed planning pass, not a closed or implemented library.

- Refine the full coherent Lean signatures against the E0/E3 supplier interfaces; see signatureOmissions.
- Integrate the H.5 model axioms and E1 comparison at packaging.


## Source issues

Five findings in the sources are confirmed by the reviews. Each is restricted
to the copy named in its locator; unavailable versions of record are not
accused. The declarations use the corrected statements.

**EnhancedDerivedSheaves/E1** (misprint; review: confirmed). Author copy SHA-256 99b418…14c7, Proposition 3.3.3, p. 19, essential-surjectivity paragraph and product display.

- *As printed:* The source asserts H^i(K) ≃ H^i(K_i) for every i ∈ N.
- *Correction used here:* Treat each cohomological degree m∈ℤ. The tower H^m(K_n) stabilizes for n≥max(0,−m); apply the product-difference/Milnor calculation to its eventual constant tail. Do not identify the full product with the tail by dropping a finite prefix.
- *Reason:* Checking only nonnegative i misses every negative cohomology group. The completion tower of A[1] has nonzero H^(−1). Moreover the displayed equality dropping factors with n<i is not justified: for the constant tower A[−1] and i=1 the omitted first H¹ factor is A, and the projection dropping it is not injective. The corrected argument uses eventual constancy separately in m and m−1 and proves the intended theorem.

**EnhancedDerivedSheaves/E2** (error; review: confirmed). Author copy SHA-256 99b418…14c7, Proposition 3.3.7(2), p. 20. Published target pages unavailable.

- *As printed:* The source asserts left-completeness of D(X).
- *Correction used here:* For the fixed complex K in the statement, conclude K≃Rlim τ≥−nK under a precise local bound uniform over its negative cohomology sheaves. To conclude that the category is left-complete, require the convergence condition for every complex, and verify reconstruction of compatible towers.
- *Reason:* The printed premise quantifies only the cohomology sheaves of one fixed K. Taking K=0 satisfies it in every topos, whereas Example 3.3.4 in the same author copy gives a topos with a non-left-complete derived category. Stacks 0D6P supplies the correctly quantified site-level object statement. The packet uses that statement and does not infer a category-wide theorem from one K.

**EnhancedDerivedSheaves/E3** (misprint; review: confirmed). Author PDF Witt.pdf, SHA-256 774032…7e7b64, proof of Lemma 3.18, p. 15, final derived-tensor display.

- *As printed:* The final sufficient tensor identity interchanges the base and source rings relative to the immediately preceding affine notation.
- *Correction used here:* With X=Spec A, Y=Spec B, Y′=Spec B′ and X′=Spec A′, use A⊗ᴸ_B B′≃A′. Then K⊗ᴸ_A A′≃K⊗ᴸ_B B′ by derived tensor associativity.
- *Reason:* The given morphism of schemes supplies B→A and B→B′; it supplies no A-module structure on B. Lemma 3.16 applies to the actual span A←B→B′. Visual inspection of the PDF confirms that this is not text-extraction reordering.

**EnhancedDerivedSheaves/E4** (error; review: confirmed). Author copy SHA-256 99b418…14c7, Lemma 3.3.2, printed p. 18, the truncation comparison and final termwise RHom assertion. Visual page inspection on 2026-10-11.

- *As printed:* The proof uses truncation adjunction to identify full derived Hom complexes termwise, both from K to L_n and from F_(n+1) to G_n.
- *Correction used here:* Use mapping spaces (equivalently the nonpositive part of the mapping complex), take their coherent inverse limit, and deduce the intended derived-limit adjunction. Do not claim a termwise comparison of all integer degrees of RHom.
- *Reason:* On the point topos take K=ℤ[1] and L_n=ℤ[0]. At n=0, τ≥0K=0 but RHom(K,L_0)=ℤ[−1] has H¹=ℤ. Likewise the compatible tower F_0=0, F_n=ℤ[1] for n≥1 and the constant compatible tower G_n=ℤ[0] give different H¹ for RHom(F_1,G_0) and RHom(F_0,G_0). Their mapping spaces are both contractible, as truncation adjunction actually requires. This corrects the proof and does not refute the adjunction theorem.

**EnhancedDerivedSheaves/E5** (gap; review: confirmed). BS17 author PDF, Remark 11.24, p. 45; Mathew Corollary 3.33, p. 24

- *As printed:* The remark attributes faithful-flat descendability under countable generation alone to Mathew.
- *Correction used here:* Use the verified countable-presentation hypothesis, controlling both generators and relations, from Mathew Corollary 3.33. No claim under countable generation alone is made.
- *Reason:* The theorem cited requires an aleph-bounded presentation, including relations; the shorter hypothesis is not supplied by that cited theorem.
- *Formerly recorded as* `EnhancedDerivedSheaves/E1` in the E5 part; renumbered so that the two parts' findings have distinct ids.


One terminology guard:

- BS Lemma 3.4.14, p. 23: the source's term "abelian Serre subcategory". Use the explicit kernel/cokernel/extension closure proved there. Do not identify this terminology with pinned IsSerreClass. The counterexample ℤ⊂ℤ₂ excludes strong Serre closure.

## The suggested Lean file

`EnhancedDerivedSheaves.lean` joins the two part files under one standard note,
one import block of 55 modules and one namespace `TauCeti.EnhancedDerivedSheaves`,
with the E0–E4 body and the E5 body in their own sections, each with its own
`open`s and options. No declaration is renamed or duplicated. It elaborates at
the pinned commits with `sorry` as its only warning (589 warnings: 242 from the
E0–E4 section, 347 from the E5 section).

| E0–E4 prototype | Included | Partial | Omitted |
| --- | ---: | ---: | ---: |
| Declarations | 12 | 31 | 82 |
| API items | 84 | 39 | 87 |
| Unit tests | 65 | 7 | 83 |

| E5 prototype | Declared | Named in a comment | Absent |
| --- | ---: | ---: | ---: |
| API items | 80 | 0 | 0 |
| Unit tests | 72 | 0 | 0 |

The E5 omissions, by scope:

- *All QCat interfaces.* Full infinity-equivalence, coherent natural transformations, universe enlargement and preservation predicates. HEquiv in the suggested file is only the homotopy-category consequence of the packet’s stronger equivalences; it does not encode a proof of those stronger statements.
- *SymMonData, OperadData, OMonoidalData, DerivedFamilyData, CoherentActionData.* Cocartesian/inner-fibration predicates, inert-operation mapping-space axioms, base identification, derived-transition Kan universality and 2-simplex coherence. The data signatures are not substitutes for the definitions. The operadicAlgebras prototype is the pullback of a symmetric monoidal category to an operad; relativeOperadicAlgebras names the general O-monoidal section construction, with colourwise evaluation.
- *PresentableData, DualPairData, RigidData, TraceClassData.* Regularity/accessibility and all-colimit preservation, higher triangle homotopies and internal module-linearity. Trace-class contraction is stated in the homotopy category; categorical rigidity still needs its stronger higher structure.
- *Theorem and test signatures.* Stable, presentable, compact-generation, model-structure, Tor-vanishing and derivability hypotheses requiring unavailable coherent interfaces. Each declaration refers to the packet’s explicit hypotheses. Existing ordinary ring/category hypotheses, regular-sequence regularity, conservativity on the homotopy category, filtered indexing and stated map equations are expressed in the file.
- *Compact maps, siftedness and tensored actions.* The compactMaps prototype tests small ordinary filtered indexing categories and records h-category diagonals without higher filler compatibility. The full criterion is definitive in the packet. Sifted cofinality, left/right action coherence and the n-truncated-space predicate require the unavailable higher interfaces; the prototype names their subcategories rather than inventing proposition fields. The characteristic-p condition for Witt Frobenius localization is expressed degreewise by CharP.
- *Coherent adjunctions and monads.* Barr–Beck records an ordinary adjunction and ReflectsIsomorphisms for the homotopy-category shadow, but omits coherent monad multiplication/unit and the G-split realization-preservation hypothesis. These cannot be inferred from its displayed ordinary adjunction alone.

## Structural proposals

Proposals 1–3 and 6–8 come from the parts; proposals 4, 5 and 9 were added by
the assembly (4 and 5 are recorded in the E0–E4 packet, 9 in the E5 packet).

1. **Generic enhanced sheaves belong to E1** (ownership-confirmed; layers E0–E4). Accepted RS-18 assigns the generic unbounded derived sheaf enhancement and derived ringed-topos functors to E1; SchemeKTheoryOperations:S.1 imports it. Accepted RS-05 assigns ordinary generic sheaf/cohomology continuation to D0. The pinned SheafOfModules Grothendieck instance is baseline. The old ownership question is resolved; the new node concerns the dg comparison only.
2. **Completion algebra moves down to E1/E4 for tier 4** (ownership-move; layers E0–E4). The older AUDIT-22/DD.1 ownership is superseded for the inputs needed here by the current WORKERS upstream rule. EnhancedDerivedSheaves is tier 4 and DerivedDeRhamCohomology tier 9. This packet removes every upward DD.1 prerequisite/request, plans the required Koszul carrier and power/regular-quotient theorems in E1/E4, and uses its generic point-topos completion/reflector/tensor/Nakayama instances. The later DD.1 plan/package and other completion consumers must import these nodes, retaining only their genuinely further filtered/de Rham constructions. Redirects are recorded in ownershipMoves and the handoff; no other job file is edited.
3. **Acyclic foundation interfaces** (split-layer; layers E0–E4). Foundations now have explicit E0 accessibility/stability, E1 tensor/presentability and E3 representability/adjoint nodes. E5 consumes them. The only remaining E5 supplier request is generic algebraic module descent for E2 h-Čech descent; extract it as an acyclic interface. Canonical DGAInfinity stage imports are restored as ordinary prerequisites accepted by the current checker.
4. **Sub-layer E2:towers for coherent towers and pro-towers** (sublayers; layers E0–E4). E5:abstract/descendable-algebras uses E2/pro-towers and E2/coherent-towers-and-roos (the Amitsur tower and its pro-constancy), and E5:abstract/uniform-index-colimits uses E2/coherent-towers-and-roos; E2/perfect-h-cech-descent applies E5:abstract/module-descent-and-functoriality for Čech effectivity. The node graph is acyclic, but the induced layer edges E2 -> E5:abstract -> E2 form a cycle. The two tower declarations use only E0 and E1/enhanced-derived-category; neither uses another E2 declaration or anything of E5. Add a sub-layer E2:towers, "Coherent towers and pro-towers", with parent E2, holding E2/coherent-towers-and-roos (keeping its planet "Derived inverse limits") and E2/pro-towers under their present identifiers. The multiplicative derived-limit filtration for a finite-cohomological-dimension index category, still a gap of E5:abstract/uniform-index-colimits, belongs in this sub-layer; the stage reference EnhancedDerivedSheaves:E2 of that node then becomes the new declaration. Layer edges: E0, E1 -> E2:towers -> E2 and E2:towers -> E4 and the E5 descent declarations; E5 descent -> E2.
5. **Replace the atlas edge E2 -> E3 by E3 -> E2** (rescope; layers E0–E4). The atlas records the stage edge E2 -> E3, but no E3 declaration uses an E2 declaration: E3 uses E0 and E1 only. Conversely E2/space-sheaves-and-postnikov uses E3/accessible-localizations, so the declarations induce E3 -> E2, and together with the recorded edge the atlas sees a two-cycle. Remove the stage edge E2 -> E3 and record E3 -> E2. The order of construction is then E0, E1, E3, E2, E4, as the declarations already require; E3's accessible localizations are an input to the sheaves of spaces of E2, and E4 uses both.
6. **Keep E5 comparison returns distinct from its foundations** (proposal; layers E5). Keep the six current stage ids. Refine dependencies when packaging: no concrete H.5 spectral or DD.0 cotangent input precedes E5:abstract, E5:presentability or E5:animation. Only the return layers and joint parent acceptance diagram import those interfaces. E0 owns the minimal stable and exact API; E5’s two retained ids are monoidal comparison targets. Avoids rebuilding foundational stable categories or a cycle through concrete spectra.
7. **Expose the extended presentable-category targets** (proposal; layers E5). Retain E5:presentability as owner of dualizable/compactly assembled/rigid categories and categorical tensor products. Consumers RefinedTraceMethods and the Berkovich continuation import these ids. Keep compactly generated Ind extensions as a specialization, not as a hypothesis of the dualizable targets. The added BM26 route needs categories which are not compactly generated.
8. **Separate generic supplier statements from their concrete applications** (proposal; layers E5). In the E0–E4 part, refine the broad prerequisites of E3/left-kan-extension-along-a-full-inclusion and E3/adjoint-functor-theorem-and-localisations. E1/presentability-and-derived-tensor is an application of E5/presentable-categories and the monoidal module interface, not a prerequisite of their definitions. Preserve existing node ownership and ids; remove only application-to-foundation edges when their generic proofs do not use those applications. The current broad stage inputs create apparent E1/E3/E5 cycles. They are explicitly unresolved until the supplier refinement is accepted.
9. **Sub-layer E5:descent, and formal tensor inversion in E5:presentability** (sublayers; layers E5). E5:presentability/presentable-categories is used by E5:abstract/descendable-algebras and E5:abstract/formal-tensor-inversion, and E5:presentability/limits-of-presentable-categories by E5:abstract/module-descent-and-functoriality, while E5:presentability uses the monoidal E5:abstract declarations (left-derivable-cocartesian-families, module-objects and others). The induced layer edges E5:abstract -> E5:presentability -> E5:abstract form a cycle. No other E5:abstract declaration and no E5:presentability declaration uses the three descent declarations or formal-tensor-inversion. Add a sub-layer E5:descent, "Descendable algebras and module descent", with parent E5, holding E5:abstract/descendable-algebras (keeping its planet "Descendable algebras"), E5:abstract/module-descent-and-functoriality and E5:abstract/uniform-index-colimits under their present identifiers; give E5:abstract/formal-tensor-inversion (Robalo's inversion in presentable categories) the parent E5:presentability. Layer edges: E5:abstract -> E5:presentability -> E5:descent, with E2:towers -> E5:descent -> E2 (see the E2:towers proposal in the E0 part). With both proposals the layer graph of the roadmap is acyclic.

Proposal 8 is now partly carried out: the Kan extension theorem uses only E0,
and E5:abstract no longer cites whole layers of E0–E4 except the two
references discussed under Dependencies.

## Notes on Tau Ceti roadmaps

- The Tau Ceti ProfiniteCohomology roadmap is imported unchanged. Layer 4 supplies explicit degrees 0,1,2; Layer 10 supplies the all-degree finite-quotient statement.
- E5 is outside the current tier; its DD.0 and concrete-spectra returns are recorded at planning level. Tier-compatible package edges must be checked against the accepted bundle order when this roadmap is packaged.
- The stage alias BS22 is resolved by the prismatic-paper extraction; its prism-specific constructions are outside this E5 part. Generic animation uses HTT, while descendability serves the prismatic consumers. No unidentified-source gap remains.
- Current TauCetiRoadmap main was checked on 11 October 2026 at 070dc2becd74419e76303ede84b465ed4a69461f, together with current TauCeti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. DGAInfinity’s DG/A-infinity perfect-category and Morita comparisons and StablePeriodicCurved’s ordinary triangulated-envelope/localization plans remain their existing owners. E5 supplies higher operadic, presentable and animation interfaces; it does not duplicate those concrete DG or ordinary triangulated constructions.

## What this plan does not claim

The plan claims no formalization: every declaration is `unchecked`, and the
suggested file proves nothing. No layer is closed. Coherent statements whose
Lean form is not yet expressible at the pinned interfaces (signed dg
comparisons, coherent classification of coCartesian fibrations, operadic and
cocartesian axioms, accessibility and higher coherence) remain explicit
targets and gaps; homotopy-category consequences in the suggested file do not
stand in for them. The roadmap does not assume that every site has enough
points, that every replete topos is left complete for every complex
regardless of bounds, that hypercompleteness implies Postnikov effectivity,
that arbitrary totalizations commute with tensor products or filtered
colimits, that every finitely generated ideal behaves like a regular one, or
that animated rings agree with E∞ algebras in positive characteristic.
Geometric verification of its hypotheses (repleteness of the sites of
diamonds, accessibility of étale subcategories, six operations, étale
coefficient categories) belongs to the consuming roadmaps.
