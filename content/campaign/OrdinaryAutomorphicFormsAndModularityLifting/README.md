# Roadmap: Ordinary automorphic forms and ordinary modularity lifting

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Construct the Hida-theoretic and ordinary lifting results used in the level-one seed and the residually reducible branches of the Serre arguments. They are not consequences of the absolutely irreducible residual R=T theorem.

## Existing material and ownership

R14/R18 supply finite-level Hecke modules, R19 their Galois representations, R04 global deformation theory and R08 local conditions. PadicMeasuresIwasawaAlgebras owns completed coefficient algebras, and PadicFamilies L0a/L0/L5 owns the generic ordinary projector/control and totally real family interface. This roadmap owns the additional nearly ordinary, Eisenstein and modularity-lifting arithmetic.

## Conventions

Specify the ordinary filtration and the quotient character at each p-adic place. Distinguish an irreducible characteristic-zero representation with reducible residual semisimplification from a reducible characteristic-zero representation. A p-distinguished hypothesis, when required by the source, is not erased. Weight space includes the finite-order character components and arithmetic specialisations.


<a id="r21-1"></a>

## R21.1. Iwasawa algebras and ordinary projectors

**Milestone:** `R21.1`

Consume [PadicMeasuresIwasawaAlgebras](../PadicMeasuresIwasawaAlgebras/README.md) for completed group algebras and [PadicFamilies](../PadicFamilies/README.md) for ordinary projectors and their finite-level comparison. Apply the projector to the modular/Hilbert/quaternionic Hecke complexes constructed by ModularCurvesPartII and HilbertModularVarietiesAndShimuraCurves. Prove that each map used for the arithmetic deformation problem preserves its ordinary image.

**Dependencies:** [HilbertModularVarietiesAndShimuraCurves R18.4](../HilbertModularVarietiesAndShimuraCurves/README.md#r18-4); [ModularCurvesPartII R14.3](../ModularCurvesPartII/README.md#r14-3); [PadicFamilies L0a](../PadicFamilies/README.md); [PadicMeasuresIwasawaAlgebras L1](../PadicMeasuresIwasawaAlgebras/README.md).

<a id="r21-2"></a>

## R21.2. Hida control and finite flatness

**Milestone:** `R21.2`

Import ordinary families, the ordinary Hecke algebra and Hida control from [PadicFamilies](../PadicFamilies/README.md). Prove the additional nearly ordinary totally real and Eisenstein/residually reducible control statements needed by Skinner–Wiles, specifying p-distinguishedness, tame characters, stabilizers, degree and localizations. Compare each arithmetic specialization with the same classical newform and Galois family. Finite flatness is proved only in the source cases establishing it.

**Dependencies:** R21.1; PadicFamilies L0 for ordinary control and L5 for the totally real family interface. The extra nearly ordinary/Eisenstein statements are constructed here, not imported from a generic rank-one Q-family theorem.

<a id="r21-3"></a>

## R21.3. Ordinary Galois and deformation families

**Milestone:** `R21.3`

Construct the Galois representation or determinant law over the ordinary Hecke algebra and prove its ordinary local structure. Construct ordinary deformation rings with the filtration data, compare local tangent conditions and prove the map to the Hecke algebra. For residually reducible cases use the representation/pseudorepresentation formalism actually supplied by the source, not the absolutely irreducible representability theorem.

**Dependencies:** [AutomorphicGaloisRepresentations R19.6](../AutomorphicGaloisRepresentations/README.md#r19-6); [GlobalGaloisDeformations R04.3](../GlobalGaloisDeformations/README.md#r04-3); [LocalGaloisDeformationRings R08.3](../LocalGaloisDeformationRings/README.md#r08-3); [OrdinaryAutomorphicFormsAndModularityLifting R21.2](README.md#r21-2).

<a id="r21-4"></a>

## R21.4. Ordinary R=T and modularity lifting

**Milestone:** `R21.4`

Prove the ordinary lifting theorem in the form needed by the source, including the commutative algebra, dual Selmer and integral Hecke arguments. Generic patching algebra comes from R03 and auxiliary-prime cohomology from R04, so this proof does not require the completed Serre theorem. Record determinant, ramification, local distinguishedness, character and residual modularity assumptions individually.

**Dependencies:** [DeformationAndDerivedPatchingAlgebra R03.5](../DeformationAndDerivedPatchingAlgebra/README.md#r03-5); [GlobalGaloisDeformations R04.5](../GlobalGaloisDeformations/README.md#r04-5); [OrdinaryAutomorphicFormsAndModularityLifting R21.3](README.md#r21-3).

<a id="r21-5"></a>

## R21.5. Skinner–Wiles and the small-prime cases

**Milestone:** `R21.5`

Prove the residually reducible ordinary results invoked in Khare's level-one argument and in the modern p=3 branch. In the latter, retain the precise residual 1⊕χ₃ shape, ordinary local condition and nontriviality hypotheses. Supply the crystalline-to-ordinary criterion used in the source, including the Berger–Li–Zhu calculation rather than assuming low weight forces ordinarity.

**Dependencies:** R21.4 (preceding layer).

<a id="r21-6"></a>

## R21.6. Ordinary-family outputs and independence

**Milestone:** `R21.6`

Export the exact lifting statements and their finite-level modularity witnesses. Give a dependency check showing that the ordinary theorem used to initialise Serre does not import Serre via a globalisation or modularity assertion. Supply the classical ordinary family for later p-adic L-function work, without adding interpolation or a main conjecture to this roadmap.

**Dependencies:** R21.5 (preceding layer).

## Required examples and checks

Check an ordinary weight-two form and its arithmetic specialisations, a residual p-distinguished split representation, and a case where the distinguishedness hypothesis fails. Verify that the residual-reducible theorem still assumes irreducibility of the characteristic-zero representation where required.



## References

HIDA, SKINNER_WILES, KW1, KHARE06, DP23. The bibliography records what was inspected and what remains to be transcribed.


## Implementation handoff: Ordinary control with arithmetic local conditions

**Stages:** R21.1, R21.2, R21.3, R21.4, R21.5, R21.6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Apply PadicFamilies L0a/L5 to the precise nearly ordinary Hilbert modules, and prove the residual localization, torsion-character component and level-control comparisons. Construct the ordinary Galois filtration with ordered characters and saturation, then the local ordinary deformation map.

**Acceptance and consumer contract.** Record the exact residual distinguishedness and character conditions of each Skinner–Wiles application, including the small-prime p=3 branch. Compare the arithmetic specialization of the Hecke module with the local ordinary quotient before R=T. Finite flatness over weight space and freeness over an auxiliary diamond group are separate statements; neither follows from existence of an idempotent projector.

## Source anchors and prototype coverage

- OrdinaryAutomorphicFormsAndModularityLifting source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
