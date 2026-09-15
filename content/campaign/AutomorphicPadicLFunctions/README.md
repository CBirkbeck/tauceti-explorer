# ray-class distributions and general automorphic constructions

Ray-class evaluation and GL₂, totally real, CM and unitary constructions.

## Canonical ownership and interfaces

- General reductive-group automorphic representations, local zeta integrals and arithmetic quotients come from the campaign's automorphic owners; PEL geometry, ordinary Igusa towers and compactification theory come from the Shimura family.
- This owner proves the source-specific BSW evaluation/control and Katz/Deligne–Ribet/EHLS arithmetic construction. An analytic interpolation theorem does not imply a main conjecture for all groups or number fields.

**Campaign dependencies:** [PadicMeasuresIwasawaAlgebras](../PadicMeasuresIwasawaAlgebras/README.md), [LocallyAnalyticDistributions](../LocallyAnalyticDistributions/README.md), [PadicFamilies](../PadicFamilies/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

## Scope

Build a general evaluation-and-interpolation framework and instantiate it in four substantial settings: GL2 over an arbitrary number field; abelian L-functions over totally real fields; ordinary CM characters; and the ordinary unitary-group construction of Eischen–Harris–Li–Skinner. The framework does not postulate a p-adic L-function for every motive or every automorphic representation.

Use GlobalNumberFields and ClassFieldTheory for ray classes and reciprocity, ReductiveGroups/RepresentationTheory for their actual algebraic input, R01–R02 for distributions, and R10/R13 for the rational modular case and family operations. The specialized higher-dimensional geometry is supplied by the canonical PEL, compactification and Igusa owners named above. This roadmap proves the source-specific evaluation, differential-operator and interpolation constructions on those objects, with explicit comparison maps.

## L0. Ray-class character spaces and evaluation

Construct the inverse limit of ray class groups with p-power conductor and fixed tame modulus, its reciprocity interpretation, and its character space. Keep the image/closure of global units and all torsion factors. Prove the dimension formula with the Leopoldt defect where it occurs; do not assume Leopoldt to simplify the definition over a general number field.

Develop locally algebraic Hecke characters, their algebraic and p-adic avatars through chosen embeddings, conductors, infinity types and local factors. Define distributions on the actual ray-class quotient, not merely on a product of local units before quotienting by global units. Prove descent, finite-level evaluation, norm relations, character twists and change of tame modulus.

Prove the following construction principle. Starting with a specified classical cohomology class with a period-normalized algebraic evaluation formula, a compatible distribution-valued lift, and verified Hecke norm relations and growth estimates, the evaluation maps define a distribution interpolating those algebraic values. Its uniqueness follows only in the range established by the relevant growth theorem. This is a conditional construction theorem with concrete mathematical input, not a general existence axiom.

## L1. Cohomological automorphic input for GL2/F

Import arithmetic quotients, Borel–Serre finiteness, Hecke local systems and automorphic-to-cohomology maps from [ArithmeticLocallySymmetricSpaces](../ArithmeticLocallySymmetricSpaces/README.md) and [AutomorphicFormsOnReductiveGroups](../AutomorphicFormsOnReductiveGroups/README.md). Import GL₂ Whittaker models, local zeta integrals and standard L-functions from [AutomorphicLFunctionsAndLocalFactors](../AutomorphicLFunctionsAndLocalFactors/README.md). Construct BSW's evaluation cycles in degree r₁+r₂, signs and rational/period structures and prove its precise critical-value formula (Theorem 5.7). Prove agreement for F=Q with ModularForms and ModularSymbolsPadicLFunctions.

## L2. Overconvergent cohomology and the BSW construction

For admissible weight lambda=(k,v), with k+2v parallel, construct the locally analytic/distribution coefficient modules at every place q|p and the specialization to the algebraic module. Fix the normalization of each U_q and its slope. With v_p(p)=1, prove BSW Theorem 8.7 in its stated range

    h_q < (min_(sigma inducing q) k_sigma + v_q(lambda) + 1) / e_q.

The weight contribution v_q(lambda) and ramification index e_q are those of BSW; prove the conversion when renormalizing U_q. Include the level hypotheses, in particular the p-level used there. Work with finite extensions of Q_p containing all required embeddings and eigenvalues, not a coefficient field fixed too small for the weight.

Construct the automorphic cycles and their distribution-valued evaluations, prove distribution relations, independence of representatives and unit descent, and establish the order of growth at every q. Prove the interpolation theorem BSW 11.1 for p-power-conductor Hecke characters in the critical infinity-type range. This includes its archimedean signs, discriminant and Gauss factors, refined eigenvalue factors, periods and local Euler factors. Encode these factors individually and prove their product is the source's factor; do not leave an unspecified scalar in the theorem.

Prove agreement with R10 for F=Q and obtain Hilbert and Bianchi specializations. Hilbert nonparallel weights are allowed when they satisfy the admissibility/criticality conditions. This construction need not pass through a perfectoid Shimura variety. For families over general F, prove the cohomological control and nonabelian-Leopoldt-type hypotheses of the chosen family result where required, or retain them explicitly; a single-form theorem is not an unconditional family theorem.

## L3. Totally real abelian and CM constructions

For a totally real field F construct the Deligne–Ribet p-adic partial zeta functions/pseudo-measure, including the algebraicity of negative critical values, integral congruences, smoothing factors and Euler factors. Build the Hilbert Eisenstein series, integral q-expansion principle and constant-term argument required for that proof. A Shintani-cone realization can be used for the computational comparison, but the distribution and measure must be proved equal under the same normalization. Specialization F=Q agrees with R03.

For a CM field with a p-ordinary CM type, construct Katz's p-adic L-function on its actual Hecke-character space. The development includes CM abelian varieties and their integral ordinary deformation/Igusa theory, algebraic and p-adic differential operators, CM periods, Eisenstein measure, and the comparison of CM evaluations with critical Hecke L-values. State the ordinary CM-type and prime hypotheses explicitly. Do not extrapolate this to a nonordinary CM prime or to all infinity types.

## L4. Ordinary unitary groups and the doubling method

Construct the PEL/unitary Shimura varieties, their automorphic vector bundles, integral/toroidal compactifications and ordinary Igusa towers in the exact setting of EHLS. Establish coherent cohomology and integral q/Fourier–Jacobi expansion principles. Construct the required ordinary Hecke modules, pairings, differential operators and Eisenstein measures. Define the doubling embedding and prove the global zeta integral identity from local integrals, including ramified and p-adic local calculations.

Prove EHLS Main Theorem 9.2.2 with its stated anti-holomorphic cuspidal ordinary representation, tame type, coefficient modules and chosen bases. Keep Hypothesis 7.3.2 (Gorenstein/freeness), Hypothesis 7.3.3 (global multiplicity one) and Proposition–Hypothesis 7.3.5 (minimality) visible. These are not properties of every ordinary component. The output belongs to the specified completed tensor product of the character Iwasawa algebra with the ordinary Hecke algebra/period module and specializes with the actual congruence and local zeta factors.

## L3h — Anticyclotomic toric distributions and Hsieh's μ theorem

Construct Hsieh's toric test vectors, CM evaluations, integral differential operators and anticyclotomic square-root distribution for a Hilbert representation π over totally real F and CM extension K/F. Prove published Theorem A's interpolation with every period, gamma, epsilon, conductor and unit factor; its square, not the unsquared element, interpolates complex central L-values. Retain the p-ordinary CM type, compatible infinity types/central character, squarefree n⁻ and Hypothesis A: normalized local root number +1 at every v|n⁻. Ordinariness of a CM type does not assert ordinariness of π.

Prove the CM-integrality criterion and Theorem B's μ=0 with its additional p unramified in F, absolute irreducibility of the residual representation restricted to K, and p prime to the product of finite local character-image orders at v(c⁻_λ)=1. Prove Theorem C under its separate conductor conditions; distinguish all but finitely many characters in local degree one from a Zariski-dense set in higher dimension. Export these exact statements to GeneralizedHeegnerCycles GH.6 and AutomorphicCongruences L2/L5a. Source: Hsieh, published Doc. Math. 19 (2014), Theorems A–C and §6. Assuming μ=0 is not a substitute for its proof.

## L4e — Eischen–Wan finite-slope Klingen families

Construct the genuinely distinct vector-valued Klingen family, Eisenstein measure, pullback identity and local zeta calculations for a cusp representation of definite GU(r,0), unramified principal series at an odd split p over an imaginary quadratic field. Preserve its auxiliary Hecke character, finite-slope refinement, coefficient module and integral local sections; neither ordinary EHLS nor the scalar SU family supplies this construction. Prove Eischen–Wan §§3–5's local/global comparison and interpolation before using a congruence.

For r=2 prove Theorem 5.8 and Corollary 5.9's constant-term divisibility with the actual two-variable L-function and local factors. Do not extrapolate this conclusion to arbitrary r because the earlier construction is general. AutomorphicCongruences L2 owns the additional cuspidal congruence/Galois-class argument. A possible CM-field extension requires its own hypothesis checks. Source: arXiv:1404.7153v2 (acquired PDF dated October 2018), §§1.3, 3–5; the register records that version.

## L5. Comparison and generalized statements

Prove changes of periods, coefficients and primitive/imprimitive conventions across the constructions, and the reduction of the general evaluation principle to each concrete example. State the Coates–Perrin-Riou/Panchishkin existence problem using a specified realization, critical set, periods, refinement/Panchishkin subspace and interpolation formula. Do not add a constructor asserting the conjecture. The noncommutative formulation in RJW Remark 13.24 is a contextual direction; no universal noncommutative main-conjecture theorem is claimed in this package.

**Acceptance:** the BSW construction for all number fields in its actual small-slope range, with Q/Hilbert/Bianchi comparisons; Deligne–Ribet and ordinary Katz constructions; EHLS under its complete hypotheses; one reusable evaluation formalism rather than four incompatible measure definitions.

## Shared conventions and sources

The programme conventions, dependency contracts, and source register are part of this specification. References such as RJW, Rubin, SU, and FW denote the precise sources and versions listed there. The mathematical milestones above, not a source-code inventory, define completion.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-hilberteisenstein"></a>

**KU-hilberteisenstein — Hilbert Eisenstein theory and p-adic interpolation.** Readiness checkpoint for original `hilberteisenstein`: verify completion and map-level compatibility of [AutomorphicPadicLFunctions:L3](README.md), [IntegralIwasawaTheory:I.3](../IntegralIwasawaTheory/README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `iwasawamodules`, `zeta`. Owns any missing modular-form and q-expansion prerequisites; no weight-two shortcut.

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `L0` | Prove descent of evaluations through the closure of global units and retain the Leopoldt defect in ray-class character dimensions. |
| `L2` | Construct BSW cycles in degree r1+r2 and prove the ramification-normalized slope bound and each local interpolation factor on the actual Hecke-character domain. |
| `L3` | Construct Deligne–Ribet from Hilbert Eisenstein congruences before using its pseudomeasure; construct Katz only with an admitted ordinary CM type and selected CM periods. |
| `L4` | Import the PEL/compactification/Igusa objects from their owners and prove the EHLS-specific doubling, local integral and ordinary-module hypotheses, preserving its Gorenstein/minimality conditions. |

**Producer–consumer handoff.** IntegralIwasawaTheory I.3 receives Deligne–Ribet with the Stickelberger dictionary; congruence proofs receive the relevant Klingen/Hsieh instance rather than a generic existence principle.

**Acceptance.** Check Q/Hilbert/Bianchi specialization and a CM prime outside the ordinary type. A single-form theorem must not instantiate an unrestricted family theorem.

**Source-readiness boundary.** Transcribe BSW/EHLS and Hsieh/Eischen–Wan branch hypothesis tables at their selected versions.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
