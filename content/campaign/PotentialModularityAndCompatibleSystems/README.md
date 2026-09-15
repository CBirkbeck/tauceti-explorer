# Roadmap: Potential Modularity And Compatible Systems

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Prove the potential-modularity input used to establish global deformation-ring finiteness and compatible systems. The proof is staged: first potential residual modularity, then potential modularity of characteristic-zero lifts after applying an already established lifting theorem.

## Existing material and ownership

R10/R18 provide the twisted Hilbert–Blumenthal moduli and their geometric/local properties; R17 the solvable Artin and base-change inputs; R22 a modularity-lifting theorem with supplied residual modularity. Use Chebotarev and class field theory from their existing owners. Moret–Bailly's approximation/existence theorem is proved here unless a current supplier already states it.

## Conventions

The finite totally real extension must satisfy all disjointness, splitting and local-extension requirements simultaneously. A potential-modularity theorem with an unspecified extension is insufficient for the global deformation-ring argument. Keep the auxiliary residual prime distinct from the characteristic of the original residual representation.


<a id="r23-1"></a>

## R23.1. Moret–Bailly's theorem

**Milestone:** `R23.1`

Prove the rational-point existence theorem for the smooth geometrically irreducible varieties used here, with prescribed nonempty local open sets and a finite extension satisfying the required disjointness and real-place conditions. Include the geometric and approximation prerequisites of the theorem rather than citing it as an axiom. State exactly which places split and how linear disjointness is forced.

**Dependencies:** [AlgebraicModuliForArithmeticGeometry R09.3](../AlgebraicModuliForArithmeticGeometry/README.md#r09-3).

<a id="r23-2"></a>

## R23.2. The auxiliary moduli problem

**Milestone:** `R23.2`

Construct the simultaneous torsion/polarisation problem using R10's actual moduli scheme. Prove its geometric irreducibility, suitable real points and every prescribed finite local point, with pairing and determinant compatibilities. If a moduli twist has several components, identify the one to which the theorem applies. Nonemptiness of the untwisted moduli space is not enough.

**Dependencies:** [HilbertModularVarietiesAndShimuraCurves H6](../HilbertModularVarietiesAndShimuraCurves/README.md#h6); [PotentialModularityAndCompatibleSystems R23.1](README.md#r23-1).

<a id="r23-3"></a>

## R23.3. Potential residual modularity

**Milestone:** `R23.3`

Prove the residual theorem in KW II Theorem 6.1's strength by finding the auxiliary abelian variety over a suitable totally real field and transferring known modularity from the auxiliary residual representation. Verify all solvable-image, ordinary/finite-flat and lifting hypotheses. This theorem must not use a global characteristic-zero lift of the original representation obtained from R24.

**Dependencies:** [GL2AutomorphicRepresentationsAndTransfer R17.5](../GL2AutomorphicRepresentationsAndTransfer/README.md#r17-5); [PotentialModularityAndCompatibleSystems R23.2](README.md#r23-2).

<a id="r23-4"></a>

## R23.4. Potential modularity of a given lift

**Milestone:** `R23.4`

Start with a characteristic-zero lift that is already supplied as data and use the residual theorem plus R22 to prove its modularity after a suitable extension, under the local hypotheses of the source. Verify that the extension preserves residual irreducibility and permits the local component comparison. This is a theorem about a given lift, not an existence proof of the lift.

**Dependencies:** [GL2ModularityLifting R22.6](../GL2ModularityLifting/README.md#r22-6); [OrdinaryAutomorphicFormsAndModularityLifting R21.6](../OrdinaryAutomorphicFormsAndModularityLifting/README.md#r21-6); [PotentialModularityAndCompatibleSystems R23.3](README.md#r23-3).

<a id="r23-5"></a>

## R23.5. Control of the extension and descent data

**Milestone:** `R23.5`

Strengthen the construction to the precise local splitting and disjointness conditions used in compatible systems and finite deformation rings. Prove compatibility with solvable intermediate fields and the automorphic base-change/descent statements actually invoked later. Record determinant and weight throughout. A modularity statement over a large field is not by itself a compatible system over Q.

**Dependencies:** R23.4 (preceding layer).

<a id="r23-6"></a>

## R23.6. Exports and noncircularity

**Milestone:** `R23.6`

Export separate residual and characteristic-zero potential-modularity statements with all hypotheses visible. Provide the application table showing that R24 global finiteness uses the residual theorem and a modular deformation problem over the extension, while the later compatible-system construction uses the theorem for a supplied lift. Validate this separation against KW II §§6 and 10 and Taylor's proof.

**Dependencies:** R23.5 (preceding layer).

## Required examples and checks

Work through the simultaneous torsion moduli example of the source and verify each requested local condition, including at infinity. Test the disjointness requirement against a prescribed finite extension cutting out the residual representation.



## References

TAYLOR02, MORET_BAILLY, KW2. The bibliography records what was inspected and what remains to be transcribed.

## Additional strand: Global lifts and compatible systems of two-dimensional representations


Prove the existence of the prescribed characteristic-zero lifts and almost strictly compatible systems used by the Serre inductions. This is where local deformation geometry, global dimension estimates, automorphic finiteness and potential modularity are combined.

## Existing material and ownership

R04 supplies presentations, R08 local deformation components/nonemptiness, R22 patching, R23 residual potential modularity and potential modularity of supplied lifts, and R17/R19 automorphic descent and compatible systems. R03 supplies the characteristic-zero-point algebra. No final Serre theorem is allowed as an input to a lift used in its own proof.

## Conventions

Define weak, compatible, almost strictly compatible and strictly compatible systems separately, with a common number field of coefficients, labelled embeddings and local parameters. Record where local compatibility at the coefficient prime is proved. An integral lift carries a stable lattice and the specified residual representation, not merely a congruence of some traces.


<a id="r24-1"></a>

## R24.1. Finiteness over the coefficient ring

**Milestone:** `R24.1`

Prove the global deformation-ring finiteness statement of KW II Theorem 10.1 by restriction to a suitable totally real extension and comparison with the modular deformation problem. Verify the residual potential-modularity input and the finiteness of the restriction map. Apply it to the unframed/global ring with the stated fixed determinant and local conditions; a framed power-series enlargement is not finite over O.

**Dependencies:** [DeformationAndDerivedPatchingAlgebra R03.6](../DeformationAndDerivedPatchingAlgebra/README.md#r03-6); [GlobalGaloisDeformations R04.6](../GlobalGaloisDeformations/README.md#r04-6); [LocalGaloisDeformationRings R08.6](../LocalGaloisDeformationRings/README.md#r08-6); [GL2AutomorphicRepresentationsAndTransfer R17.6](../GL2AutomorphicRepresentationsAndTransfer/README.md#r17-6); [AutomorphicGaloisRepresentations R19.6](../AutomorphicGaloisRepresentations/README.md#r19-6); [GL2ModularityLifting R22.6](../GL2ModularityLifting/README.md#r22-6); [PotentialModularityAndCompatibleSystems R23.6](README.md#r23-6).

<a id="r24-2"></a>

## R24.2. Existence of characteristic-zero points

**Milestone:** `R24.2`

Combine finiteness with the global presentation lower bound and local nonemptiness to obtain a point over a finite extension of the coefficient field. Prove that the point has nonzero characteristic and that the induced representation is continuous with the required residual reduction. Finiteness and nonzeroness alone are insufficient. Track the integrality and the extension of coefficients necessary to realise the point.

**Dependencies:** R24.1 (preceding layer).

<a id="r24-3"></a>

## R24.3. Prescribed local lifts

**Milestone:** `R24.3`

Pin the earlier input to KW, Annals 169 (2009), §5.2 and Böckle's appendix Proposition 1/Theorem 1. Proposition 1 assumes the specified local deformation rings are complete intersections flat over Z_p with the displayed relative dimensions, and tracks fixed versus variable determinant via d=0 or 1 and ad⁰ versus ad. Theorem 1 deduces minimal R=T from an auxiliary R_Q≅T_Q of finite flat W(k)-algebras. It is not an unconditional lift-existence theorem: R04 supplies the presentation and R22 the auxiliary automorphic finiteness comparison before this application.

Prove the four lift constructions in KW I Theorem 5.1 with their exact determinant, weight, ramification and local-type hypotheses. Enumerate the minimum-ramification, weight-two and auxiliary good-dihedral applications used in §§8–9. Include the local-at-2 cases and any prescribed-type strengthening from Gee/Snowden used only by the modern route. Nonemptiness of a local type must be proved before requesting a global point of that type.

**Dependencies:** R24.2 (preceding layer).

<a id="r24-4"></a>

## R24.4. The full KW modularity-lifting interface

**Milestone:** `R24.4`

Complete the derivation of KW I Theorem 4.1 from the results of KW II §10 and the earlier patching theorem. Preserve its p=2 nonsolvable-image assumption and its crystalline-weight-two/semistable-weight-two distinction; in the latter dyadic case retain the residual weight-four condition. For odd p retain cyclotomic absolute irreducibility and the stated crystalline weight interval or potentially semistable weight-two condition.

**Dependencies:** R24.3 (preceding layer).

<a id="r24-5"></a>

## R24.5. Compatible systems from potential modularity

**Milestone:** `R24.5`

Use potential modularity, solvable base change/descent and character induction to construct a system over the original field with the prescribed member. Prove independence of choices and existence of genuine two-dimensional representations; a virtual linear combination from Brauer induction is not itself such a representation. Prove the common coefficient field, Frobenius polynomials, purity, Hodge weights and exactly the local compatibility available in the source.

**Dependencies:** R24.4 (preceding layer).

<a id="r24-6"></a>

## R24.6. Changing residual characteristic

**Milestone:** `R24.6`

Prove the reduction and specialisation lemmas used to change prime, including determinant, conductor, inertial type, irreducibility and oddness. Enumerate the hypotheses that make local compatibility valid when the new coefficient prime was already ramified. In the modern route, preserve the almost-strict limitation in the residually reducible case and use a de Rham lifting theorem rather than silently restoring the missing Weil–Deligne assertion.

**Dependencies:** R24.5 (preceding layer).

## Required examples and checks

Construct the minimal and good-dihedral lift specifications from the source and check every local condition survives the compatible-system construction. Include an example of a nonzero O-torsion deformation ring that the characteristic-zero-point argument correctly rejects.



## References

KW1, KW2, DIEULEFAIT04, GEE11, SNOWDEN09, SAVITT05. The bibliography records what was inspected and what remains to be transcribed.

## General arithmetic-point and system interfaces

R23.1 is the general Moret–Bailly/Skolem theorem with specified local open conditions, prescribed splitting and linear disjointness. Construct the field-extension selection, smooth local points, approximation and geometric connectedness arguments for an arbitrary smooth geometrically irreducible variety over a number field; Hilbert torsion moduli is one application, supplied by H6. Prove total reality only when the real local conditions ensure it.

<a id="stage-R24.5:operations"></a>

**R24.5:operations — general systems before existence theorems.** Build compatible systems as actual representations at coefficient places with common Frobenius polynomials, not only a table of traces; support weak, almost strict and strict local predicates separately. Extend the elementary operations to rank n and polarized systems, proving tensor products, duals, symmetric/exterior powers, induced systems and restriction with the precise conditions for retaining irreducibility, regularity, polarization and purity; these properties are not all preserved automatically. Import ArithmeticGaloisRepresentations:G7 and R01.5 for the actual representation operations and recognition, and PadicHodgeTheory:R06.2–3 for Hodge–Tate and local monodromy compatibility. This construction takes a system as input and does not assume R24.5's two-dimensional existence theorem or a potential-automorphy endpoint. PA.5 consumes these generic operations and checks the particular lifting input survives the permitted operation. The old two-dimensional existence/Serre theorem requirements R23–R24 are retained. The new ACC+ campaign requests reusable deformation, cohomology, support and systems theory; no new universal potential-automorphy endpoint is imposed here.


## Implementation handoff: Arithmetic points, lifts and systems

**Stages:** R23.1, R23.2, R23.3, R23.5, R24.1, R24.2, R24.5, R24.6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

The Moret–Bailly application consumes an actual smooth geometrically irreducible component and nonempty local open sets at every requested place, plus one combined disjointness condition. The torsion twist must carry the Weil-pairing multiplier. Any restriction of scalars used to construct an abelian variety is along a finite separable field extension via A6; its ramified integral places receive separate model checks.

**Acceptance and consumer contract.** The global-point step proves nonzero characteristic by dimension/flatness, rejecting a nonzero O-torsion ring. In compatible systems prove that the Brauer-induction construction is an actual representation, with common coefficient field and Frobenius polynomials. After changing characteristic record whether local compatibility is weak, almost strict or strict; reducible reduction at an already ramified coefficient prime needs the separately permitted lifting branch.

## Source anchors and prototype coverage

- PotentialModularity source targets.
- GlobalLiftsAndCompatibleSystems source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
