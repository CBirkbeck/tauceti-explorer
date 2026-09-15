# Roadmap: Completed cohomology and p-adic local–global compatibility over Q

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Construct completed cohomology of the relevant modular/Shimura-curve towers and prove the p-adic local–global compatibility used in modern GL₂/Q modularity lifting. Finite-level Galois representations alone do not provide this result.

## Existing material and ownership

R14/R18 supply finite-level cohomology and Hecke/Galois actions; R02 handles topological coefficients and limits; R30 the local Banach correspondence; R03/R04 patching algebra and deformation problems. Keep the construction compatible with future completed cohomology over other number fields, but do not assert their local–global compatibility by analogy.

## Conventions

Specify whether the construction is homology or cohomology, compactly supported or ordinary, completed before or after localisation, and integral or rational. Limits are topological limits with continuous actions. The coefficient prime is allowed to be small only where the exact theorem supports it.


<a id="r31-1"></a>

## R31.1. Towers and completed cohomology

**Milestone:** `R31.1`

Specialize [CompletedCohomologyPartII CC.0–CC.8](../CompletedCohomologyPartII/README.md) to modular/Shimura curves. Identify its actual tower and transfer maps with ModularCurvesPartII R14 and HilbertModularVarietiesAndShimuraCurves R18. Apply CC.5's admissibility and finite-generation theorem after verifying its finite-cell and local-group hypotheses; prove the additional GL₂ boundary/non-Eisenstein results here. ALS.6 and TC.2 are consumers of that same generic supplier, not constructors or prerequisites of this stage.

**Dependencies:** CompletedCohomologyPartII CC.2/CC.5/CC.7/CC.8; HilbertModularVarietiesAndShimuraCurves R18.4; ModularCurvesPartII R14.3.

<a id="r31-2"></a>

## R31.2. Classical specialisations and locally algebraic vectors

**Milestone:** `R31.2`

Relate classical finite-level cohomology with algebraic coefficients to the locally algebraic vectors or the appropriate derived construction in completed cohomology. Prove the comparison with the existing modular-form/newform objects. State the needed cohomological degree and vanishing/torsion assumptions; a formal interchange of invariants and inverse limits is not a proof.

**Dependencies:** R31.1 and CompletedCohomologyPartII CC.6.

<a id="r31-3"></a>

## R31.3. Hecke and deformation actions

**Milestone:** `R31.3`

Construct the completed Hecke algebra and its Galois determinant/representation with the correct residual hypotheses. Prove the commuting local group action and the map from the local deformation or pseudodeformation ring. Establish compatibility with classical specialisations, including integral/nilpotent information where required.

**Dependencies:** [AutomorphicGaloisRepresentations R19.6](../AutomorphicGaloisRepresentations/README.md#r19-6); [CompletedCohomologyAndLocalGlobalCompatibility R31.2](README.md#r31-2); [GlobalGaloisDeformations R04.2](../GlobalGaloisDeformations/README.md#r04-2).

<a id="r31-4"></a>

## R31.4. p-adic local–global compatibility

**Milestone:** `R31.4`

Prove the source theorem identifying the local p-adic representation attached to the Galois representation inside completed cohomology. Include the multiplicity module, central character, completions and the exact subspace or localised module involved. An isomorphism of locally algebraic vectors alone is not the full Banach-space compatibility theorem used in R32.

The concrete initial branch is Emerton's **unpublished 2011 manuscript**, Theorem 1.2.1: V is a continuous irreducible two-dimensional **promodular** E-representation of G_Q, unramified outside finitely many primes, with absolutely irreducible residual representation and residual local representation not a twist of an extension of the mod-p cyclotomic character by the trivial character. The theorem first constructs a nonzero map from B(V_p) tensored with the specified away-p local factors into the V-multiplicity space of completed degree-one cohomology. Its injectivity statement additionally excludes V_p being a sum of two characters or a self-extension of a character. The isomorphism statement additionally assumes residual p-distinguishedness: the local residual representation is not a twist of an extension of the trivial character by itself. Preserve the source's tensor product and tame factors; do not assert an isomorphism under just absolute irreducibility. Remark 1.1.2 warns against the unrestricted conjectural formulation in the exceptional cyclotomic-extension case.

**Dependencies:** [CompletedCohomologyAndLocalGlobalCompatibility R31.3](README.md#r31-3); [PadicLocalLanglandsForGL2Qp R30.6](../PadicLocalLanglandsForGL2Qp/README.md#r30-6).

<a id="r31-5"></a>

## R31.5. Patched completed modules and support

**Milestone:** `R31.5`

Construct the patched completed module or the equivalent local–global argument used by the selected lifting theorem. Prove finite generation, projectivity where stated, support and multiplicity assertions. Transfer the local block/deformation-ring results from R30 with all hypotheses checked. Do not infer full support merely from its occurrence at a dense set of unnamed classical points.

**Dependencies:** R31.4 (preceding layer).

<a id="r31-6"></a>

## R31.6. Exports and source independence

**Milestone:** `R31.6`

Supply the exact local–global compatibility and support statements used in each branch of R32, especially p=2 and p=3. Audit all globalisation inputs: a result used in an independent proof of Serre must not invoke the full Serre theorem to construct its auxiliary global residual representation. Where the source has only a post-Serre globalisation, locate and prove the restricted independent construction or record that dependence explicitly.

In particular Emerton Theorems 1.2.3–1.2.4 assume p>2, residual absolute irreducibility after restriction to G_Q(ζ_p), and both local exclusions from R31.4. The Fontaine–Mazur consequence also requires de Rham local behaviour with distinct Hodge–Tate weights and the stated oddness/ramification conditions. They do not supply the dyadic branch and their use of Serre modularity is recorded rather than recycled into an independent proof of Serre. R32's Paškūnas/Hu–Tan/Tung branches retain their distinct source hypotheses.

**Dependencies:** R31.5 (preceding layer).

## Required examples and checks

Compute the finite-level specialisation at a known weight-two form and compare its local algebraic vectors and Galois representation. Verify that the limit definitions preserve the Hecke operator normalisation of R14.



## References

EMERTON11, PASKUNAS15, PASKUNAS16, TUNG21. The bibliography records what was inspected and what remains to be transcribed.


## Implementation handoff: GL₂ Banach local–global application

**Stages:** R31.1, R31.2, R31.3, R31.4, R31.5, R31.6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Instantiate the common CC tower with actual modular/Shimura curve transition maps and the chosen support. Construct the completed Hecke action and multiplicity space, then distinguish the nonzero-map, injective-map and isomorphism branches of Emerton 1.2.1 with their different residual local exclusions.

**Acceptance and consumer contract.** Run a classical weight-two eigensystem through finite-level, completed, locally algebraic and Banach comparisons while retaining the same Hecke normalization. A proof of isomorphism of locally algebraic vectors does not finish the Banach theorem. R31.6 records whether each auxiliary globalisation invokes Serre; any claimed independent R33 route must replace or explicitly retain that dependence.

## Source anchors and prototype coverage

- CompletedCohomologyAndLocalGlobalCompatibility source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
