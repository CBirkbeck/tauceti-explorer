# Roadmap: GL₂ Automorphic Representations And Transfer

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Construct the representation-theoretic objects and local/global theorems used by modularity, transfer and potential modularity. Classical modular forms are an explicit specialisation, not the definition of an automorphic representation over an arbitrary number field.

## Existing material and ownership

Use adeles/ideles and class field theory from existing number-field roadmaps, Haar measure/Fourier analysis from their general owners, and RepresentationTheory for the algebraic foundations. ModularForms supplies classical Q-valued holomorphic theory. R01 owns local Weil groups and arithmetic Weil–Deligne representations. No full automorphic theory is claimed to exist merely because an abstract Hecke ring does.

## Conventions

Fix Haar measures and reciprocity normalisations. Distinguish arithmetic Galois normalisation from unitary automorphic normalisation and state the twist relating them. Smooth admissible representations, unitary completions, and locally algebraic representations are different objects. The coefficient field and allowed embeddings must be visible in every comparison.


<a id="r16-1"></a>

## R16.1. Locally compact groups and automorphic functions

**Milestone:** `R16.1`

Specialize [ReductiveGroupsPartII](../ReductiveGroupsPartII/README.md), [SmoothRepresentationsOfLocalGroups](../SmoothRepresentationsOfLocalGroups/README.md) and [AutomorphicFormsOnReductiveGroups](../AutomorphicFormsOnReductiveGroups/README.md) to GL₂ over every number field. Identify the chosen local compact subgroups, Haar measures, quotient central character and finite-level function spaces with those generic definitions. The generic convolution algebra, Schwartz–Bruhat space, growth conditions and smooth representation categories have those sole owners.

**Dependencies:** [ArithmeticGaloisRepresentations R01.1](../ArithmeticGaloisRepresentations/README.md#r01-1); [ArithmeticGaloisRepresentations R01.2](../ArithmeticGaloisRepresentations/README.md#r01-2); [AutomorphicFormsOnReductiveGroups AF.2](../AutomorphicFormsOnReductiveGroups/README.md); [SmoothRepresentationsOfLocalGroups SR.0](../SmoothRepresentationsOfLocalGroups/README.md).

<a id="r16-2"></a>

## R16.2. Local smooth representation theory

**Milestone:** `R16.2`

Import induction, admissibility, contragredients, Satake, derivatives and Whittaker functors from SmoothRepresentationsOfLocalGroups SR.2–SR.5 and the local factors from AutomorphicLFunctionsAndLocalFactors AL.1–AL.3. Specialize these constructions to GL₂. Prove its explicit principal-series/special/supercuspidal classification formulas and the conductor/newvector theorem, including dimensions of congruence-invariants, normalization of a newvector and character/twist calculations. The subsequent R16.3 compares these explicit descriptions with the generic type/segment classification of ET.6; that general classification is proved independently of this GL₂ application. Include residue characteristic 2 and wild supercuspidals when used; genericity is not a reason to discard them. There is no second Whittaker model or local-factor carrier.

**Dependencies:** [AutomorphicLFunctionsAndLocalFactors AL.1](../AutomorphicLFunctionsAndLocalFactors/README.md); [AutomorphicLFunctionsAndLocalFactors AL.2](../AutomorphicLFunctionsAndLocalFactors/README.md); [AutomorphicLFunctionsAndLocalFactors AL.3](../AutomorphicLFunctionsAndLocalFactors/README.md); [GL2AutomorphicRepresentationsAndTransfer R16.1](README.md#r16-1); [SmoothRepresentationsOfLocalGroups SR.2](../SmoothRepresentationsOfLocalGroups/README.md); [SmoothRepresentationsOfLocalGroups SR.3](../SmoothRepresentationsOfLocalGroups/README.md); [SmoothRepresentationsOfLocalGroups SR.4](../SmoothRepresentationsOfLocalGroups/README.md); [SmoothRepresentationsOfLocalGroups SR.5](../SmoothRepresentationsOfLocalGroups/README.md).

<a id="r16-3"></a>

## R16.3. Local Langlands for GL₂

**Milestone:** `R16.3`

Import the canonical characteristic-zero local correspondence from EndoscopicTransferAndUnitaryTraceComparison ET.6. Compare its rank-two specialization with the explicit GL₂ principal-series, Steinberg and supercuspidal descriptions, including wild/dyadic cases. Prove the arithmetic/unitary normalization bridge, determinant, character twist, Artin conductor and L/epsilon-factor formulas in these explicit coordinates, and identify the nilpotent monodromy for the special representation. Existence/bijectivity and the full Weil–Deligne carrier have the general owner; this is not a second construction. The p-adic Banach correspondence of R30 is different theory.

**Dependencies:** [EndoscopicTransferAndUnitaryTraceComparison ET.6](../EndoscopicTransferAndUnitaryTraceComparison/README.md); [GL2AutomorphicRepresentationsAndTransfer R16.2](README.md#r16-2).

<a id="r16-4"></a>

## R16.4. Global cuspidal decomposition and multiplicity

**Milestone:** `R16.4`

Import the cuspidal spectral decomposition and restricted tensor-product foundations from AutomorphicSpectralTheory. Prove GL₂ global multiplicity one and identify the concrete factorization with those generic constructions. Prove strong multiplicity one with a precise set of places where equality is required. Establish rationality/coefficient fields for the cohomological representations later used, or assign the geometric rationality theorem to R19 explicitly.

**Dependencies:** [AutomorphicSpectralTheory AS.4](../AutomorphicSpectralTheory/README.md); [GL2AutomorphicRepresentationsAndTransfer R16.1](README.md#r16-1); [GL2AutomorphicRepresentationsAndTransfer R16.2](README.md#r16-2).

<a id="r16-5"></a>

## R16.5. Integral formulas and converse-theorem prerequisites

**Milestone:** `R16.5`

Import Fourier/Poisson theory, Tate integrals, Godement–Jacquet standard factors and Rankin–Selberg integrals with their continuation and functional equations from AutomorphicLFunctionsAndLocalFactors AL.0–AL.3. Prove the GL₂ global Whittaker expansion and its identification with those integral models. Prove the exact GL₂ converse theorem used in R17, including its family of character twists, pole exclusions, vertical-strip/growth estimates and archimedean hypotheses; analytic continuation alone is not a converse theorem. Compare the rational/cohomological normalization with the existing classical modular-form L-function. The general zeta-integral construction and analytic continuation are not rebuilt here.

**Dependencies:** [AutomorphicLFunctionsAndLocalFactors AL.0](../AutomorphicLFunctionsAndLocalFactors/README.md); [AutomorphicLFunctionsAndLocalFactors AL.1](../AutomorphicLFunctionsAndLocalFactors/README.md); [AutomorphicLFunctionsAndLocalFactors AL.2](../AutomorphicLFunctionsAndLocalFactors/README.md); [AutomorphicLFunctionsAndLocalFactors AL.3](../AutomorphicLFunctionsAndLocalFactors/README.md); [GL2AutomorphicRepresentationsAndTransfer R16.4](README.md#r16-4).

<a id="r16-6"></a>

## R16.6. Classical and cohomological specialisations

**Milestone:** `R16.6`

Identify the holomorphic representations over Q with the existing newforms, including level, character, weight, Hecke eigenvalues and normalisation. Define the Hilbert cohomological weights and their local algebraic representations. Export the local newvector and global multiplicity results for the geometry and Galois construction. Prove the parameter conversion used when a weight-k form has determinant εχ_p^(k−1).

**Dependencies:** [GL2AutomorphicRepresentationsAndTransfer R16.3](README.md#r16-3); [GL2AutomorphicRepresentationsAndTransfer R16.5](README.md#r16-5).

## Required examples and checks

Check an unramified principal series, a Steinberg twist, a dihedral supercuspidal and a classical weight-two newform. Verify the determinant and epsilon-factor change under both normalisations.



## References

JL70, LANGLANDS80, BUSHNELL_HENNIART. The bibliography records what was inspected and what remains to be transcribed.

## Additional strand: Base change, Jacquet–Langlands and solvable Artin representations


Prove the transfer and descent theorems used to move modularity between number fields and between GL₂ and quaternion algebras. Include the solvable-image modularity results used in the initial and exceptional cases of Serre's conjecture.

## Existing material and ownership

R16 supplies automorphic representations, local Langlands, Whittaker models and the analytic prerequisites. ClassFieldTheory supplies characters and reciprocity; R01/R02 supply projective-lifting and Galois-cohomological inputs. RepresentationTheory owns finite-group character induction. R18 constructs the geometric quaternionic/Hilbert realisations, not the analytic transfer theorem.

## Conventions

State base change and descent with the extension, Galois invariance, character ambiguity, cuspidality exceptions and local conditions. Automorphic induction of a character and base change of a cuspidal representation are different constructions. Jacquet–Langlands transfers only the representations with the required discrete-series behaviour at ramified places.


<a id="r17-1"></a>

## R17.1. Quaternionic local transfer

**Milestone:** `R17.1`

Import local Jacquet–Langlands and the GL_r(D) representation/character carrier from EndoscopicTransferAndUnitaryTraceComparison ET.6. Prove its explicit quaternionic rank-two description, matching the regular-elliptic character sign, twists, conductors and R16.3's normalization. Work out split places, the one-dimensional quaternionic characters/Steinberg twists and the wild/dyadic examples needed by the arithmetic applications. Existence and the general inner-form correspondence are not rebuilt; the transfer of a principal series to a division algebra is not asserted.

**Dependencies:** [EndoscopicTransferAndUnitaryTraceComparison ET.6](../EndoscopicTransferAndUnitaryTraceComparison/README.md); [GL2AutomorphicRepresentationsAndTransfer R16.3](README.md#r16-3).

<a id="r17-2"></a>

## R17.2. Trace-formula prerequisites and matching

**Milestone:** `R17.2`

Import the invariant trace formula from AutomorphicSpectralTheory AS.6 and transfer factors, ordinary fundamental lemma/local transfer and simple cyclic/unitary comparison from EndoscopicTransferAndUnitaryTraceComparison ET.1/ET.3/ET.4. Specialize the matching identities to GL₂, quaternion algebras and the chosen cyclic extension, computing their actual local functions, measures, signs and central-character factors. Identify the continuous/residual terms with the supplied spectral decomposition and prove every cancellation used in the quaternionic/cyclic specialization. Generic transfer and fundamental-lemma proofs have the ET owner; this stage proves the concrete specialization and global transfer applications, not a second general engine.

**Dependencies:** [AutomorphicSpectralTheory AS.6](../AutomorphicSpectralTheory/README.md); [EndoscopicTransferAndUnitaryTraceComparison ET.1](../EndoscopicTransferAndUnitaryTraceComparison/README.md); [EndoscopicTransferAndUnitaryTraceComparison ET.3](../EndoscopicTransferAndUnitaryTraceComparison/README.md); [EndoscopicTransferAndUnitaryTraceComparison ET.4](../EndoscopicTransferAndUnitaryTraceComparison/README.md); [GL2AutomorphicRepresentationsAndTransfer R17.1](README.md#r17-1).

<a id="r17-3"></a>

## R17.3. Global Jacquet–Langlands

**Milestone:** `R17.3`

Prove global transfer and its converse under the archimedean and finite local hypotheses, preserving Hecke eigenvalues at split places. Prove the strong multiplicity-one uniqueness statements and the effect on rational structures where used. Record the parity condition on the ramification set of a quaternion algebra. Supply the definite and indefinite cases needed by R18/R22.

**Dependencies:** R17.2 (preceding layer).

<a id="r17-4"></a>

## R17.4. Cyclic and solvable base change

**Milestone:** `R17.4`

Prove cyclic base change and descent for GL₂, local compatibility and the exact failure-of-cuspidality criterion. Iterate to solvable extensions with a proof that the chosen tower and descent character ambiguities are controlled. Prove the local prescribed splitting/base-change consequences used by potential modularity and component arguments. Descent of Galois representations alone is not automorphic descent.

**Dependencies:** R17.3 (preceding layer).

<a id="r17-5"></a>

## R17.5. Automorphic induction and Langlands–Tunnell

**Milestone:** `R17.5`

Construct monomial automorphic representations and the solvable two-dimensional Artin modularity theorem with its weight-one interpretation over Q. Prove the projective and linear lifting steps, including the octahedral case via Tunnell's argument. Use R16's converse theorem where that proof requires it. A theorem for surjective GL₂(F₃) with cyclotomic determinant is only one case; the full soluble-image input required by the Serre proof is explicitly included.

**Dependencies:** R17.4 (preceding layer).

<a id="r17-6"></a>

## R17.6. Characteristic-two soluble cases and transfer interfaces

**Milestone:** `R17.6`

Supply the characteristic-two residual soluble-projective-image argument, with the Rohrlich–Tunnell lifting/modularity result and its coefficient and ramification hypotheses. Construct the residual modularity witness and its transition to the weight≥2 formulation used by the induction. Export exact base-change/descent statements for the compatible-system construction and potential modularity, including the conditions preserving residual irreducibility.

**Dependencies:** R17.5 (preceding layer).

## Required examples and checks

Check a dihedral representation induced from a quadratic character, the octahedral mod-3 application, a cyclic base change becoming noncuspidal, and a quaternion algebra with the permitted ramification parity.



## References

JL70, LANGLANDS80, ARTHUR_CLOZEL, TUNNELL81, RT97, WIESE04. The bibliography records what was inspected and what remains to be transcribed.


## Implementation handoff: Transfer with exact local data

**Stages:** R16.2, R16.3, R16.5, R17.3, R17.4, R17.5, R17.6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Each transfer record contains source field/group, target field/group, local ramification set, central character, Haar measures and reciprocity convention. R16.3 imports the full ET.6 Weil–Deligne correspondence and proves the rank-two formulas, including the special representation monodromy. R17.4 separates cyclic ascent, invariant descent and the ambiguity by twisting characters.

**Acceptance and consumer contract.** Compare a Steinberg twist, a dihedral supercuspidal and an unramified principal series under both factor normalizations. The converse theorem needs its family of character twists and growth estimates. A Langlands–Tunnell application must prove soluble projective image over the actual coefficient field; GL₂(F₃) cannot stand for GL₂(F_(3^r)). The character-two branch retains its separate lift theorem.

## Source anchors and prototype coverage

- GL2AutomorphicRepresentations source targets.
- GL2BaseChangeAndJacquetLanglands source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
