# Roadmap: Adic Spaces PartII

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

## Purpose and scope

Extend the existing AdicSpaces roadmap to the geometric and sheaf-theoretic operations needed for p-adic Shimura varieties. Construct analytification of finite-type schemes over a complete nonarchimedean field, the relevant formal generic fibres, finite/étale/proper maps, fibre products in the required categories, and coherent coefficient theory.

This is a successor to AdicSpaces, not another construction of valuations, Huber pairs, `Spa`, or the structure sheaf. The earlier roadmap explicitly stops before these operations. Primary references are Huber's adic-space theory, the formal/rigid generic-fibre theory used by Scholze, and the coherent sheaf and descent results cited by the p-adic sources.

## Inputs and conventions

Consume the existing Huber-pair and adic-space definitions, with `A⁺` explicit and completeness/Hausdorffness recorded separately. Reuse the existing sheaf categories and generic descent machinery. The base is a complete nonarchimedean field, with a chosen open integrally closed ring of integral elements where the construction requires it.

The principal categories are analytic locally strongly noetherian adic spaces, perfectoid spaces once PerfectoidSpaces P0–P3 are constructed, and the sousperfectoid spaces needed for families. A completed tensor product of arbitrary Huber rings is not automatically uniform or sheafy. No theorem of unrestricted fibre-product existence is obtained by overlooking this issue.

## Milestones

<a id="r0"></a>

### R0. Morphisms and admissible affinoid products

**Dependencies:** AdicSpaces and complete topological algebra.

Construct completed tensor products with their topology and explicit plus-ring construction. Prove the universal property on the classes of Huber pairs where it is valid. Prove sheafiness/localization compatibility for the affinoid products actually needed, then glue to fibre products of locally strongly noetherian analytic spaces.

Construct open and closed immersions, separatedness, finite maps, smooth maps, and étale maps using local presentations and prove independence from the presentation. Relate these to topological and stalkwise properties only under the hypotheses that justify the relation. Closed analytic subspaces and their defining coherent ideals must be retained as ringed spaces, not merely closed subsets.

<a id="r1"></a>

### R1. Analytification and algebraic correspondences

**Dependencies:** R0.

Construct the adic analytification of a finite-type scheme over the base field from affine charts. Prove independence of presentation, gluing, and compatibility with fibre products, open/closed immersions, finite maps, smoothness, and étaleness. Establish the properness comparison and the proper GAGA results required for algebraic coefficient sheaves.

Construct analytification of finite locally free group schemes, abelian schemes, isogenies, and their quotient maps. Compare their sheaves of invariant differentials. A nonproper algebraic variety and the generic fibre of the completion of one integral model need not be the same analytic space; the open immersion and the locus it represents are separate results in R2.

<a id="r2"></a>

### R2. Formal schemes, generic fibres, and Hasse domains

**Dependencies:** [AdicSpacesPartII F0](README.md#f0); [AdicSpacesPartII R0](README.md#r0); [AdicSpacesPartII R1](README.md#r1).

Construct admissible formal schemes, formal completion, admissible blow-ups, and the adic generic-fibre functor. Prove invariance under the admissible modifications used in the construction. Establish the comparison of a model's formal generic fibre with the analytification of its algebraic generic fibre, identifying precisely the integral/good-reduction locus.

Construct rational subdomains cut out by a section of a line bundle and a valuation bound, using local trivializations and proving their independence. Apply this to a Hasse ideal and its blow-ups. Establish the transition maps as the radius changes. Define fractional p-valuation bounds by valuation ideals or by an explicitly chosen extension containing the relevant p-power root; do not silently treat `p^ε` as an element of every base field.

<a id="r3"></a>

### R3. Coherent sheaves and finite traces

**Dependencies:** R0–R2.

Prove the affinoid coherent-sheaf equivalence, acyclicity and the comparison needed for finite affinoid covers. Construct locally free sheaves, coherent ideals, tensor operations, and base change. Establish Kiehl-type proper finiteness/coherence and the analytic comparison statements actually used for compactifications.

Construct trace for finite locally free algebras and finite étale analytic maps, its base-change and composition laws, and its compatibility with algebraic trace. Construct pull–identify–trace on coefficient sheaves along correspondences. A trace is not defined as a sum over geometric points in a setting with nonreduced fibres or ramification.

### R4. Étale and pro-étale sites

**Dependencies:** R0–R1 for analytic morphisms, smooth charts and algebraic-pair analytification; [AdicEtaleGeometry A1](../AdicEtaleGeometry/README.md) for the elementary étale/pro-étale site construction and its corrected covering convention.

R4 is the **early site reexport**, not a completed derived-cohomology package. Identify the sites on the same adic carriers, their geometric pullbacks and restriction to a smooth pair's boundary complement. Transport the elementary site and sheaf operations from A1 without constructing a second site. HodgeTateAndCanonicalSubgroups T6:log-sites uses precisely this input when constructing the logarithmic sites; the logarithmic comparison theorem is not an R4 prerequisite.

[ClassicalAdicEtaleCohomology H0](../ClassicalAdicEtaleCohomology/README.md) separately owns classical derived cohomology, and its later stages own the actual comparison theorems. Coherent and finite-trace operations use R3; perfectoid coefficient/torsor descent uses its named perfectoid suppliers where needed. None is silently imported by the basic-site reexport. PerfectoidSpaces consumes R0–R3 and the elementary site construction before R5; neither R4 nor that early perfectoid construction consumes the R5 sousperfectoid-family result or a later period comparison.

<a id="r5"></a>

### R5. Families and sousperfectoid spaces

**Dependencies:** [AdicEtaleGeometry A1](../AdicEtaleGeometry/README.md); [AdicSpacesPartII R3](README.md#r3); [ClassicalAdicEtaleCohomology C0](../ClassicalAdicEtaleCohomology/README.md); [PerfectoidSpaces P0](../PerfectoidSpaces/README.md); [PerfectoidSpaces P3](../PerfectoidSpaces/README.md).

Construct the sousperfectoid class and its usable local affinoid descriptions, following the sources used by BHW for products with weight spaces. Prove the existence and sheaf properties of `X_∞×_L U` for a perfectoid `X_∞` and a smooth rigid-analytic parameter space `U`, together with completed coefficient sheaves and torsor descent.

Do not assert that such a product is perfectoid merely because one factor is. Establish the sheaf base-change and equalizer results needed to define and descend families of automorphic coefficients. Prove local compatibility of rational and integral sheaves where used. Arbitrary nonflat base change for global sections is not an automatic consequence.

## Completion conditions

Starting from the algebraic schemes and maps supplied by V/M/H/C, the library constructs their analytic realizations, Hasse neighbourhoods, formal models, and coefficient correspondences. Every use of fibre products has a sheafiness/existence theorem. The later perfectoid and period-sheaf constructions reuse this geometry and add their special properties; they do not replace the underlying adic spaces.

<a id="f0"></a>

## F0. Formal geometry integrated with R0–R3

Construct Spf(A) for complete separated Noetherian adic rings and its structure sheaf; prove independence of the ideal of definition, gluing and equivalence with compatible systems modulo its powers. Completion along a closed subscheme is functorial. Establish affine coherent-module equivalence, formal functions and formal GAGA in the proper finite-presentation setting, retaining the ample-line-bundle hypotheses used for algebraization. These are the formal-specific portions of source R05.1–R05.4; the generic-fibre, tensor-product and coherent analytic portions are R0–R3 above.

Construct locally strongly noetherian analytic fibre products from admissible completed tensors, prove stability of finite and étale morphisms and the implicit-function/Jacobian local criteria under their precise hypotheses. Prove properness, separatedness and smoothness comparisons with formal models and finite-type analytification. This includes original diamond AdicEtaleGeometry A0 and ordinary geometric portions of A1–A2. AdicEtaleGeometry owns the sites, generalized presentations and approximation after these constructions.

R5 uses PerfectoidSpaces P0–P3 to construct products with smooth weight spaces. PerfectoidSpaces P0–P8 use the earlier R0–R3/F0 inputs; its P9 weight-space extension additionally consumes R5. This is the forward order R0–R3 → perfectoid foundations → R5 → P9, not a whole-area cycle. Deformation-specific bounded-height Grassmannians, proper maps to deformation rings and component images are LocalGaloisDeformationRings L7.

<a id="f1"></a>

## F1. Dagger geometry and overconvergent de Rham complexes

Construct weakly complete dagger affinoid algebras, their radius-indexed presentations and the comparison to completed rigid/adic affinoids; prove independence of presentations and cofinal systems of strict neighborhoods. Build restriction, completed/overconvergent tensor products and the admissible gluing needed for dagger spaces. Define coherent dagger modules, differential forms, exterior derivative and the logarithmic complex for a strict normal crossings boundary. Prove local acyclicity/base-change statements with convergence and finiteness hypotheses explicit. For smooth pairs define compact-support variants through extension/vanishing at the boundary and prove the natural localization maps. General analytic constructions live here; the ordinary-locus rigid cohomology, slope comparison and automorphic boundary realization used by HLTT are AutomorphicGaloisRepresentationsPartII AG2.4. Do not infer a rigid/de Rham comparison merely from equality of underlying point sets.

## Source anchors and prototype coverage

- AdicGeometry source targets.
- FormalGeometryForDeformationRings source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.

## Completion contracts added on 2026-09-15

**Applies to:** `R0`, `R2`, `R3`, `R4`, `R5`, `F0`, `F1`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Separate formal coherent descent over complete noetherian adic rings from integral perfectoid formal models over O_C, which are not covered by noetherian F0 merely because they are formal schemes. Construct the latter models by the topologically finitely presented charts needed by BMS and prove their generic-fiber/gluing comparisons on that range. For finite trace, construct the module-theoretic trace on a finite locally free algebra and verify ramified examples before transporting it to sheaves.

### Producer–consumer contract

Export ringed-space fiber products with a sheafiness theorem and an explicit integral subring. R4 exports elementary sites only; its old copied seed paragraph importing all derived cohomology is superseded. F1's dagger radii and completion map are the analytic inputs to PadicDifferentialEquationsAndRigidCohomology.

### Acceptance and source route

Compare a ramified finite algebra trace with its geometric-point count; compare a formal torus over O_C with a noetherian formal torus; test a smooth weight disc times a perfectoid space without claiming that the product is perfectoid.

**Source route:** Hub96 analytic/formal geometry; BMS1 §8 formal O_C setup; KL15 coherent descent. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
