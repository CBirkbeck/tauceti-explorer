# Roadmap: GL₂ Modularity Lifting

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Prove modularity-lifting statements for a supplied residual modular representation by constructing and comparing deformation rings and Hecke modules. This is the common arithmetic patching theorem used before global potential modularity and compatible-system lifting. Final source theorems whose proof also needs global finiteness are assembled in R24.

## Existing material and ownership

R03 supplies patching algebra, R04 the global rings and auxiliary primes, R08 local ring geometry, R18 the quaternionic Hecke modules, R19 representations over Hecke algebras, and R20/R21 the required level and ordinary results. No endpoint of R26 or R27 may be imported here. The source organisation is KW II §§7–9 with the Kisin finite-flat and dyadic component arguments explicitly included.

## Conventions

A residual modularity witness is actual eigenform/Hecke data. The deformation ring, the chosen union of local components and the module patched over it are separately constructed. State whether the conclusion is an integral isomorphism, a reduced/torsion-free R=T, or modularity of points on specified components. Those conclusions are not interchangeable.


<a id="r22-1"></a>

## R22.1. Minimal deformation-to-Hecke maps

**Milestone:** `R22.1`

Choose the modular residual representation and construct the localised finite-level Hecke module and algebra with the required local type and determinant. Use the universal property to construct the deformation-to-Hecke map and prove surjectivity from generation by Frobenius/Hecke data. Identify the precise local deformation problem represented at each place. Do not assume a datum whose fields already assert the wanted R=T isomorphism.

**Dependencies:** [AutomorphicGaloisRepresentations R19.6](../AutomorphicGaloisRepresentations/README.md#r19-6); [DeformationAndDerivedPatchingAlgebra R03.6](../DeformationAndDerivedPatchingAlgebra/README.md#r03-6); [GlobalGaloisDeformations R04.6](../GlobalGaloisDeformations/README.md#r04-6); [HilbertModularVarietiesAndShimuraCurves R18.6](../HilbertModularVarietiesAndShimuraCurves/README.md#r18-6); [LocalGaloisDeformationRings R08.6](../LocalGaloisDeformationRings/README.md#r08-6); [SerreWeightAndLevelOptimisation R20.6](../SerreWeightAndLevelOptimisation/README.md#r20-6).

<a id="r22-2"></a>

## R22.2. Auxiliary levels and freeness

**Milestone:** `R22.2`

Add the Taylor–Wiles primes chosen by R04, construct the auxiliary Hecke modules and the finite group actions, and prove the required freeness/control statement. Verify stabilisers, integral torsion, character choices and specialisation back to the original level. Treat the p=2 twisting and real-place modifications from KW II separately.

**Dependencies:** R22.1 (preceding layer).

<a id="r22-3"></a>

## R22.3. Arithmetic patching

**Milestone:** `R22.3`

Apply the abstract patching construction to the actual rings and modules, proving each presentation and depth hypothesis. Establish the support statement obtained over the completed tensor product of local rings and the relation to finite-level Hecke modules. Keep framing variables and their removal explicit, and track the determinant through all specialisations.

**Dependencies:** R22.2 (preceding layer).

<a id="r22-4"></a>

## R22.4. Component arguments and nonminimal levels

**Milestone:** `R22.4`

Prove the local component matching, connectedness or component-changing results that permit the desired lift to lie in the patched support. Add and remove ramification under the exact level-change theorems. A patched Cohen–Macaulay module supported on one component does not establish modularity on another. State the hypotheses under which the generic-fibre or integral R=T statement strengthens.

**Dependencies:** R22.3 (preceding layer).

<a id="r22-5"></a>

## R22.5. Odd-prime modularity lifting

**Milestone:** `R22.5`

Deduce the ordinary, finite-flat/potentially Barsotti–Tate and required crystalline-range lifting results under supplied residual modularity and the correct cyclotomic irreducibility conditions. Record exactly which formulations are available without the later global-finiteness argument. The KW I Theorem 4.1 formulation is assembled in R24 after its full KW II §10 inputs, avoiding a circular appeal to potential modularity.

**Dependencies:** R22.4 (preceding layer).

<a id="r22-6"></a>

## R22.6. Dyadic lifting and Kisin's completion

**Milestone:** `R22.6`

Prove the 2-adic lifting results needed by KW I and the stronger Barsotti–Tate statement supplying its Hypothesis H. Include nonsolvable residual image, infinity, local deformation geometry and all twisting arguments. State the source theorem with its complete hypotheses, then derive precisely the hypothesis used in KW I §9. Do not identify characteristic-two oddness with a nontrivial complex-conjugation matrix.

**Dependencies:** R22.5 (preceding layer).

## Required examples and checks

Test the proof with a supplied classical modular residual representation, both ordinary and nonordinary local points, and an inadmissible different-component point that the theorem must not accept. Check the p=2 real-place dimension count explicitly.



## References

KW2, DIAMOND97, KISIN09F, KISIN2. The bibliography records what was inspected and what remains to be transcribed.

## Additional strand: Modern modularity lifting for two-dimensional representations over Q


Prove the stronger GL₂/Q lifting theorems that allow the shorter Dieulefait–Pacetti proof: regular de Rham lifting in the residually modular cases and the required residually reducible theorems. The hypotheses must match the individual published results, not an imagined theorem for every p-adic representation.

## Existing material and ownership

R30/R31 provide p-adic local Langlands and completed local–global compatibility; R08 local deformation spaces; R04/R03 global deformation and patching; R22 the classical Kisin results. R21 supplies the special ordinary p=3 theorem. The roadmap is organised around Dieulefait–Pacetti Theorems 1.4–1.7, but each is proved from its primary sources, not taken as an axiom because the survey lists it.

## Conventions

Characteristic-zero representations are continuous, irreducible where the theorem requires it, odd, unramified outside finitely many primes, and de Rham with distinct integral Hodge–Tate weights at p. Residual modularity and residual reducibility are separate cases. A de Rham condition is deliberately weaker than prescribing the full local Weil–Deligne parameter.


<a id="r32-1"></a>

## R32.1. Exact statement table

**Milestone:** `R32.1`

State the odd-prime residually modular theorem, the dyadic nonsolvable-residual theorem, Pan's p≥5 residually reducible theorem and the ordinary p=3 theorem as separate declarations. Record the cyclotomic/quadratic restriction condition and exceptional local cases exactly as in the primary source. Prove the elementary implications between alternative residual-image formulations before using one in place of another.

**Dependencies:** [DeformationAndDerivedPatchingAlgebra R03.6](../DeformationAndDerivedPatchingAlgebra/README.md#r03-6); [GlobalGaloisDeformations R04.6](../GlobalGaloisDeformations/README.md#r04-6); [LocalGaloisDeformationRings R08.6](../LocalGaloisDeformationRings/README.md#r08-6); [OrdinaryAutomorphicFormsAndModularityLifting R21.6](../OrdinaryAutomorphicFormsAndModularityLifting/README.md#r21-6); [GL2ModularityLifting R22.6](README.md#r22-6); [PadicLocalLanglandsForGL2Qp R30.6](../PadicLocalLanglandsForGL2Qp/README.md#r30-6); [CompletedCohomologyAndLocalGlobalCompatibility R31.6](../CompletedCohomologyAndLocalGlobalCompatibility/README.md#r31-6).

<a id="r32-2"></a>

## R32.2. Residually modular odd-prime lifting

**Milestone:** `R32.2`

Prove the regular de Rham lifting theorem through the local–global compatibility and support arguments, accounting for the progression from Kisin/Emerton to Paškūnas, Hu–Tan and Tung. Include the p=3 exceptional case rather than using a result stated for p≥5. Verify the determinant, ordinary/nonordinary and residual-image requirements at the application.

**Dependencies:** R32.1 (preceding layer).

<a id="r32-3"></a>

## R32.3. Dyadic de Rham lifting

**Milestone:** `R32.3`

Prove the corresponding p=2 theorem with nonsolvable residual image using the exact local and global results in R30/R31 and Kisin's dyadic input. Distinguish it from the potentially Barsotti–Tate theorem used in the classical proof. A regular de Rham representation need not be Barsotti–Tate after merely renaming its Hodge weights.

**Dependencies:** R32.2 (preceding layer).

<a id="r32-4"></a>

## R32.4. Pan's residually reducible theorem

**Milestone:** `R32.4`

Formalise the p≥5 residually reducible Fontaine–Mazur theorem needed by the modern proof, including pseudodeformations, reducibility ideals, the global support argument and the conversion to a classical modular form. Keep irreducibility of the characteristic-zero representation and every global/local hypothesis. The reduction being a sum of characters does not make its characteristic-zero lift a sum of characters.

**Dependencies:** R32.3 (preceding layer).

<a id="r32-5"></a>

## R32.5. Small-prime ordinary completion

**Milestone:** `R32.5`

Use the precisely proved Skinner–Wiles theorem and the local crystalline/ordinary calculation to cover the p=3 branch required by Dieulefait–Pacetti. Document why this branch is not a consequence of Pan's p≥5 theorem. Match the residual 1⊕χ₃ condition and character normalisation after twisting.

**Dependencies:** R32.4 (preceding layer).

<a id="r32-6"></a>

## R32.6. Modularity-transfer statements for congruence arguments

**Milestone:** `R32.6`

Deduce exact modularity-transfer lemmas for the changes of coefficient prime in R33, with a separate entry for reducible reduction at a ramified coefficient prime. Explain why de Rham lifting suffices when an almost strictly compatible system does not supply the full local Weil–Deligne comparison there. Supply a dependency audit locating every globalisation and verifying whether it uses an already proved restricted case or the general Serre endpoint.

**Dependencies:** R32.5 (preceding layer).

## Required examples and checks

Check an irreducible lift with reducible residual semisimplification, a nonsolvable dyadic residual case and the p=3 ordinary terminal case. The API must reject a reducible characteristic-zero representation in an application requiring irreducibility.



## References

KISIN_FM, EMERTON11, PASKUNAS15, PASKUNAS16, HU_TAN15, TUNG21, PAN22, DP23, BLZ04. The bibliography records what was inspected and what remains to be transcribed.

## Classical and modern module boundaries

R22 owns finite-level Taylor–Wiles–Kisin arithmetic patching and precedes potential modularity/global finiteness. R32 owns the stronger p-adic local Langlands/completed-cohomology consequences; it may consume R22 but never becomes an input to R22. Their shared rings and algebra are LocalGaloisDeformationRings, GlobalGaloisDeformations and DeformationAndDerivedPatchingAlgebra. A proof in the classical branch must import only the specific local component statements it uses, not the final modern module. Generalized dimension-n support lemmas are P7–P9 of the algebra owner, with arithmetic assembly in PotentialAutomorphyInfrastructure.


## Implementation handoff: Lifting theorems as verified applications

**Stages:** R22.1, R22.2, R22.3, R22.4, R22.6, R32.1, R32.6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

For each lifting row list residual witness, determinant, local types, chosen components, framed variables, Selmer dimensions and the module that detects support. Construct the universal ring map and prove that its kernel acts trivially on the actual patched module. Component coverage is a theorem after local geometry and auxiliary-level control; a Cohen–Macaulay module alone does not prove every component modular.

**Acceptance and consumer contract.** Audit each classical source application before potential modularity/global finiteness is imported. Keep R32 de Rham, Pan reducible-residual and dyadic branches separate, with their exact local block and globalisation assumptions. A test point on an unproved component must not pass the lifting API. Publication and theorem-version checks for exceptional blocks are required before a branch becomes a proof ticket.

## Source anchors and prototype coverage

- TaylorWilesKisinModularityLifting source targets.
- GeneralGL2QModularityLifting source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
