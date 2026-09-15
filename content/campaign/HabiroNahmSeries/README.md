# Nahm series, asymptotics and Habiro integrality

Nahm equations, q-difference equations, integrality and radial asymptotics.

## Canonical ownership and interfaces

This application roadmap belongs to the standalone [Habiro rings and cohomology family](../HabiroRings/README.md). Classical, relative and number-field rings are constructed by their separate owners; this roadmap constructs the actual q-series and their arithmetic properties.

- Classical cyclotomic completions belong to HabiroCyclotomicCompletions. Number-field rings use local Frobenius gluing and the actual K₃ group from K3BlochGroups.
- Reusable ring/module constructions and analytic q-series applications have distinct canonical owners; source conventions and excluded-prime hypotheses remain explicit.

**Campaign dependencies:** [HabiroNumberFields](../HabiroNumberFields/README.md), [Polylogarithms](../Polylogarithms/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

## HB.3 — Nahm equations and their Bloch classes

For a symmetric positive-definite rational matrix A, construct the distinguished real solution to the Nahm equations in `(0,1)^N`, prove its existence and uniqueness, and prove that its coordinates are algebraic. Define its number field and the associated Bloch class, clearing denominators explicitly when A is rational.

Show that symmetry of A annihilates the relevant Bloch boundary. In the true exterior-square quotient this calculation can lose 2-torsion; relate it to HB.1's exact integral convention before asserting an integral class. Construct all field embeddings of the solution and the regulator evaluations needed later.

The multivariable formal series associated to an arbitrary symmetric integral matrix in GSWZ has a different hypothesis set from this analytic positive-definite Nahm sum. Use different bundled input data rather than accidentally imposing positivity on a formal identity or dropping it from a convergence theorem.

## HB.4 — Root-of-unity asymptotics

Define the q-Pochhammer products and the analytic Nahm sums, prove convergence in their stated disk, and pin the normalisation of the factor q^C. Formalise the all-orders radial asymptotic expansion of CGZ Theorem 7.1 using the detailed proof of Garoufalidis–Zagier. The proof includes Euler–Maclaurin estimates, the critical point, the Hessian determinant and branch, formal Gaussian integration, the finite root-of-unity sum, and uniform bounds on the remainder for each finite truncation.

Include the hypotheses that the root order is coprime to the denominators of A and B. State the limit along the source's radial positive parameter; a sectorial complex expansion requires a stronger theorem. Construct the expansion coefficients and prove their field of definition and the cyclic-dilogarithm transformation law.

The leading series Φ may vanish in the cited theorem. Results dividing by Φ(0) require its separate nonvanishing hypothesis. Use the corrected published/v3 normalisation: the q^C convention and root-of-unity factors must be checked against the corrected theorem, not copied from an earlier version.

## HB.5a — Finite-index modular functions at cusps

Own the minimal analytic supplier used by the CGZ implication for **any finite-index subgroup** Γ of SL₂(Z), not just a congruence subgroup. Import the upper half-plane, slash action and elementary modular transformations from the existing ModularForms roadmap. Construct rational cusps, widths and scaling matrices; define weight-zero Γ-invariant meromorphic functions with meromorphic expansions at every cusp. Prove the local parameter q_c=exp(2πiz/w_c), transformation under a scaling matrix, and the Laurent expansion with finite principal part. Along the radial approach used in HB.4 derive the rational π² exponential rate from the integral leading exponent and rational cusp data, with the exact normalization of q and the radial parameter. Vanishing leading coefficients require selecting the first nonzero Laurent term; the identically zero case is separated. These facts do not assume Γ is congruence and do not require an algebraic modular-curve model. This scoped analytic stage is the unique supplier of the finite-index cusp-growth input of CGZ Theorem 7.5.

## HB.5 — The proved implication in Nahm's conjecture

Formalise CGZ Theorem 7.5 (and its equivalent introductory formulation): modularity of the specified Nahm sum implies torsion of the distinguished Bloch class. Use HB.5a's finite-index modular-function transformation and growth at cusps, the asymptotics from HB.4, the finite Chern/cyclic-dilogarithm identities and the good-order injectivity results.

Prove the final finitely generated abelian-group argument: if the free part of the class survived, its reductions could not vanish for the unbounded family of allowed orders. Show that the exceptional integer excludes only finitely many primes and that the orders required by the modular argument satisfy the arithmetic hypotheses.

This endpoint is **modularity ⇒ torsion**. It does not assert the converse for general A, nor turn the existence of a torsion Bloch class into a modularity test without an additional theorem. Preserve the finite-index modular-group generality of the cited result.

## HB.8 — Admissibility and integrality: GSWZ Theorem 6

Define admissible multivariable series by their logarithmic coefficients, equivalently the infinite product with integers c_{n,i}. Prove existence and uniqueness of the product expansion in the completed ring with its support conditions.

For each symmetric integral matrix A, construct GSWZ's series F_A and its q-difference equations. Prove Lemma 2.6 by the formal Gaussian/q-difference calculation and then prove Theorem 6: **for each fixed nonzero n, only finitely many i have c_{n,i}≠0**. Mere integrality or uniqueness of an unrestricted product expansion does not complete this theorem.

Implement the Laurent-polynomial coefficient recurrence, induction, cancellation of possible cyclotomic poles and the comparison with the multivariable formal Gaussian solution. This provides the finite-support property without importing a general Donaldson–Thomas integrality theorem as an unplanned prerequisite.

## HB.9 — Frobenius congruences and module membership

Formalise GSWZ Theorem 4 with its precise variables and coprimality assumptions: the difference between the p-th substitution of the logarithm and p times the original logarithm lies in the stated `(p/x)`-multiple of the completed coefficient ring. Track the fractional powers, residue class k modulo m, chosen m-th roots and Frobenius action.

Then prove Theorem 5 for a nondegenerate Nahm solution z: the specified formal Gaussian series belongs to the restricted-root-order module

\[
 f_{A,z}\in\mathcal H_{R[\delta^{-1/2}],\xi}\big|_\Delta.
\]

Here ξ, the Hessian/discriminant quantity δ, its square root, the enlarged coefficient ring and the excluded root orders are constructed exactly as in the source. Omitting the nondegeneracy, the square-root/localisation extension or the restriction by Δ changes the theorem.

Show how admissibility, the Frobenius congruence and the p-adic regulator identity supply each defining condition of HB.7. Prove the coefficient and gluing assertions, not just a formal equality of leading terms.

## HB.10 — Explicit examples and boundaries

Work out one rational and one genuine nonabelian number-field example from GSWZ, with an exact algebraic presentation of the field, verified nondegenerate solution, Bloch/K₃ class, excluded primes, first coefficients and the general module-membership proof. Include a rank-one product identity as a check of the q-difference and admissibility conventions.

For knot-related perturbative series, distinguish the formal series theorem from the assertion that the series represents a topological invariant or a particular Chern–Simons quantity. Prove the identification and independence of presentation whenever that stronger assertion is included; membership of a series in a Habiro module alone does not prove quantum modularity or topological invariance.

Export the coefficient rings, completions, Frobenius actions, K₃ index, regulators and q-series identities to [HabiroRings](../HabiroRings/README.md) HR.6 and [HabiroCohomologyFoundations](../HabiroCohomologyFoundations/README.md) HQ.5–8 through actual comparison maps. The q-Hodge complex, crystalline/A_inf/prismatic comparisons and Fargues–Fontaine geometry have separate substantial foundations and are not consequences of the q-series construction. In particular, membership in a K₃-indexed Habiro module does not by itself produce a cohomology class on an arbitrary scheme.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-nahmasymptotic"></a>

**KU-nahmasymptotic — Nahm solutions, q-series and root asymptotics.** Readiness checkpoint for original `nahmasymptotic`: verify completion and map-level compatibility of [HabiroNahmSeries:HB.3](README.md), [HabiroNahmSeries:HB.4](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `polyloganalysis`, `existing`. 

<a id="stage-KU-nahmtorsion"></a>

**KU-nahmtorsion — Modularity implies Bloch torsion.** Readiness checkpoint for original `nahmtorsion`: verify completion and map-level compatibility of [HabiroNahmSeries:HB.5](README.md), [HabiroNahmSeries:HB.5a](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `nahmasymptotic`, `finitereg`. 

<a id="stage-KU-admissibility"></a>

**KU-admissibility — Formal Gaussian series and finite-support product theorem.** Readiness checkpoint for original `admissibility`: verify completion and map-level compatibility of [HabiroNahmSeries:HB.8](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `existing`, `polyloganalysis`. 

<a id="stage-KU-habiromembership"></a>

**KU-habiromembership — Frobenius congruence and module membership.** Readiness checkpoint for original `habiromembership`: verify completion and map-level compatibility of [HabiroNahmSeries:HB.9](README.md), [HabiroNahmSeries:HB.10](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `admissibility`, `habiromodules`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `HB.3` | Use distinct input records for a positive-definite rational analytic Nahm matrix and a symmetric integral formal matrix. Prove algebraicity and the exact Bloch-boundary relation in the former. |
| `HB.4` | For each truncation produce a radial remainder estimate and a declared branch of the Hessian square root. Any division by the leading coefficient needs a separate nonvanishing theorem. |
| `HB.9` | Check the nondegenerate solution, δ square-root extension, excluded orders and Frobenius logarithm congruence against each condition of HB.7, rather than inferring membership from a few coefficients. |

**Producer–consumer handoff.** ArithmeticQuantumTopology may use the constructed series and modules but must separately prove topological invariance, peripheral normalization and any asymptotic/geometric identification.

**Acceptance.** Prove finite i-support for each nonzero multi-index, check a nonabelian number-field example and retain only the established modularity-implies-torsion implication.

**Source-readiness boundary.** The all-orders asymptotic estimates and good-order arithmetic comparison require complete primary proof decomposition.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
