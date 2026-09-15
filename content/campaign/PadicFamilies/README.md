# Hida and Coleman families, period modules, and family L-functions

Ordinary and finite-slope families with integral period modules.

## Canonical ownership and interfaces

- This is the sole generic ordinary-projector/control and Hida-family owner, including the totally real ordinary interface needed by OrdinaryAutomorphicFormsAndModularityLifting. The latter supplies its extra nearly ordinary/residually reducible hypotheses and lifting theorem.
- Pseudorepresentations and Galois determinant algebra come from IntegralHeckeAndGaloisDeterminants; actual Galois families import the arithmetic representation owner. Weight and cyclotomic variables and their two specialization maps remain distinct.

**Campaign dependencies:** [PadicMeasuresIwasawaAlgebras](../PadicMeasuresIwasawaAlgebras/README.md), [LocallyAnalyticDistributions](../LocallyAnalyticDistributions/README.md), [ModularSymbolsPadicLFunctions](../ModularSymbolsPadicLFunctions/README.md), [ArithmeticGaloisRepresentations](../ArithmeticGaloisRepresentations/README.md), [IntegralHeckeAndGaloisDeterminants](../IntegralHeckeAndGaloisDeterminants/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

## Scope and dependencies

Construct families of modular forms and their p-adic L-functions. The ordinary theory is integral over finite flat ordinary Hecke algebras; the finite-slope theory uses affinoid coefficients and coherent period/eigensymbol modules. Weight and cyclotomic character are separate variables. The basic family construction does not depend on Kato's Euler system or a main conjecture.

Use R01–R02 for coefficients, distributions, weights and Fredholm theory, R10 for classical and overconvergent symbols, and R11.L0–L2 for modular geometry and integral comparison. R11.L3–L4 supplies Galois representations for the later arithmetic layers. This roadmap owns the modular control and spectral theorems not supplied by those inputs.

## L0a — Finite and profinite ordinary projectors

This is the group-independent supplier for PotentialAutomorphyInfrastructure PA.2 and OrdinaryAutomorphicFormsAndModularityLifting R21.1. For an endomorphism U of a **finite underlying module**, prove the Fitting decomposition into its eventually invertible image and eventually killed kernel. Prove that U^(n!) is eventually constant with value the projector e onto the invertible summand; identify e by this decomposition, prove e²=e, U-equivariance and naturality for maps commuting with U. This finite-set argument does not require dividing by a group order.

For a complete separated module M presented as an inverse limit of finite discrete quotient modules M/J with compatible U, construct e as the inverse limit of these finite projectors. Prove pointwise convergence of U^(n!) in the specified inverse-limit topology, continuity, image/kernel decomposition, invertibility of U on eM, and topological nilpotence on (1−e)M. No uniform finite exponent is asserted across the tower. A finite module over a complete noetherian local ring with **finite residue field**, with its separated complete adic topology, is a standard sufficient instance; finite generation over an arbitrary complete local ring is not enough (R=C, maximal ideal 0, U=2 is a failure test).

Prove exactness first for U-equivariant exact sequences of finite modules, then for inverse-limit sequences under the actual exactness/Mittag–Leffler or compact-surjectivity hypotheses. Apply the result degreewise to finite perfect/cohomological complexes with commuting U and differential, prove compatibility with cohomology under the chosen limits, and prove coefficient/level compatibility only for maps respecting the quotient systems. A supplied idempotent is not a substitute for this construction; averaging arguments with p-torsion group order are not used.

## L0. Ordinary modular forms and Hecke algebras

Construct p-adic modular forms from the ordinary tower and the corresponding spaces of q-expansions, including the q-expansion principle, integral level structures and diamond actions. Instantiate L0a after proving the finite-quotient and continuity hypotheses for Up; use its canonical ordinary projector. Establish finite generation and the appropriate finite flatness/control statements for ordinary cuspidal modules and Hecke algebras over weight Iwasawa algebras, with the exact level and residual-localization hypotheses.

Construct the ordinary Eisenstein family from R03 and prove the geometric/cohomological identification of its q-expansion. Build ordinary cusp forms independently of the Eisenstein construction. At arithmetic characters prove specialization to the correct classical ordinary space, with nebentypus, p-stabilization and multiplicity recorded. Do not assume a localized Hecke algebra is Gorenstein or a rank-one module is free without a theorem or an explicit hypothesis.

## L1. Integral symbols and periods in ordinary families

Construct the ordinary modular-symbol module with its integral structure, sign action and Hecke algebra action. Prove its control theorem and comparison with R10 at classical points. Define the associated period modules and congruence modules. Where a period module is invertible, retain it as a line bundle; a scalar function requires a chosen trivialization. Prove how the function changes with that choice.

Integrate universal characters against the universal ordinary symbol to obtain a cyclotomic measure with coefficients in the Hecke/period module. Prove arithmetic specialization, including the relationship between family periods and canonical single-form periods. State integral results before inverting p; separate a period equality up to a unit from equality up to an arbitrary field scalar.

## L2a — Group-independent eigenvariety gluing

Use [PadicMeasuresIwasawaAlgebras L0a](../PadicMeasuresIwasawaAlgebras/README.md#l0a--rigid-character-and-weight-spaces) for rigid weights and [LocallyAnalyticDistributions L4](../LocallyAnalyticDistributions/README.md) for compact operators/Fredholm theory. Fix a reduced rigid weight space, compatible orthonormalizable Banach modules (or the precise property-(Pr) modules of Buzzard's construction) over its affinoids, a commuting Hecke algebra and a distinguished compact operator. Construct the Fredholm hypersurface, finite-projective slope summands on adapted affinoids, finite Hecke-algebra spectral pieces and their gluing. Prove the eigenvalue/weight maps, coherent eigenmodule sheaf, independence of admissible coverings and compatibility with the linked Banach modules. A reduced weight base does not itself imply that the total eigenvariety is reduced: state any subsequent reduction explicitly and retain the eigensheaf/generalized eigenspaces and required Tor comparisons. This abstract analytic machine has no modular-form or rank-two Galois input. AutomorphicGaloisRepresentationsPartII AG2.3 supplies its definite-unitary coefficients, compactness and classical points; it does not import L4's final Galois family.

The normative general construction is Buzzard, *Eigenvarieties* (2007), with Coleman–Mazur, *The eigencurve* (1998), for the modular instance. Register access and edition-specific loci independently; a secondary eigenbook is not a substitute for an unrecorded primary source.

## L2. Finite-slope eigenvarieties

Construct the compact Up action on affinoid distribution-valued modular cohomology and verify L2a's hypotheses using the Fredholm theory of LocallyAnalyticDistributions L4. Apply L2a to build the eigencurve, eigenvalue/weight maps and coherent eigensymbol sheaf. Prove the additional modular base-change statements, including the Tor terms and generalized eigenspaces at non-reduced or ramified points; retain a coherent enhancement where the reduced eigenvariety alone loses these data.

Prove the classicality/control theorem in the precise small-slope range. Treat a noncritical eigensymbol as an actual lift, not as an assumed section of a sheaf whose existence has not been proved. Establish the local freeness or multiplicity-one hypotheses required for a scalar family. Do not identify an eigenpacket with a unique vector at every point.

## L3. Family L-functions and critical specialization

Construct the evaluation map from the coherent eigensymbol module to distributions in the cyclotomic variable. Prove analytic variation, specialization and compatibility with the single-form construction. On a trivialized period line this gives a scalar function; globally retain the sheaf-valued object.

Prove the Pollack–Stevens non-theta-critical and Bellaïche critical-point results by their respective arguments, with their local eigenvariety and multiplicity hypotheses. Distinguish critical slope from failure of the specialization map to be an isomorphism. In a theta-critical situation include the relevant vanishing and secondary/derivative construction where the selected theorem supplies one; interpolation values alone are not a uniqueness theorem here. R10.L3 consumes these results without feeding its noncritical construction back into their hypotheses.

## L4. Arithmetic families

Using R11, construct the ordinary big Galois representation on the appropriate Hecke component, first as a pseudorepresentation if that is what descent supplies and then as an actual representation when the residual hypotheses justify it. Prove the local ordinary filtration, saturation and arithmetic specialization. Construct the corresponding family Selmer complex through R07.

After R09 and R12, construct the required family regulators and big Kato classes and prove specialization. Derive the family reciprocity law rather than defining the family class by it. For nonordinary families use the precise local triangulation/de Rham hypotheses in the regulator theorem; do not assert a crystalline module of constant dimension over every eigencurve neighborhood.

**Acceptance:** ordinary integral control and two-variable interpolation; the eigencurve and eigensymbol evaluation; precise critical-slope specializations; period-line compatibility; big Galois and regulator specializations with all residual and local hypotheses visible. Universal-family main-conjecture proofs are in R15–R16, not a consequence of family interpolation alone.

## L5. Ordinary theory over totally real fields

Instantiate L0a on the integral Hilbert automorphic/cohomology modules furnished by the Shimura and general automorphic owners, proving their finite quotient hypotheses. Prove compatibility with coefficient extension, residual localization and trace in p-power level. Establish Hida control on the actual ordinary loci and integral weight algebras used by OrdinaryAutomorphicFormsAndModularityLifting, including central-character and torsion-unit restrictions. Nearly ordinary filtrations at each place above p are distinct data; the specialized residually reducible Eisenstein cases belong to that lifting owner. Export period modules as invertible modules only under proved freeness/multiplicity-one hypotheses, and compare with the rational modular-curve case.

## Shared conventions and sources

The programme conventions, dependency contracts, and source register are part of this specification. References such as RJW, Rubin, SU, and FW denote the precise sources and versions listed there. The mathematical milestones above, not a source-code inventory, define completion.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.

## Implementation handoff: From compact operators to family periods

**Stages:** L0a, L0, L1, L2a, L2, L3, L4, L5. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Construct factorial-power projectors only after the finite-quotient hypotheses, then prove their compatibility in the profinite limit. For finite slope give the Fredholm determinant, slope-factor decomposition, finite projective summand and Hecke image on each affinoid chart; prove link-map cocycles before eigenvariety gluing.

**Acceptance and consumer contract.** Test the ordinary specialization with its p-stabilization and nebentypus, and a critical-slope point where the specialization map loses information. Period data remains an invertible module until a basis is chosen. A scalar L-function, local triangulation, or big Galois lattice needs its own existence and specialization theorem; equality of pointwise eigenvalues does not supply these.
