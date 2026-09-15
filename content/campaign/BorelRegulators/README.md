# Stable arithmetic cohomology and Borel regulators

Stable arithmetic cohomology, regulator lattices and leading terms.

## Canonical ownership and interfaces

- Generic arithmetic quotients, reduction theory and compactifications are supplied by the campaign's automorphic foundations; this roadmap proves the stable-range comparison and Borel classes.
- The rank theorem uses rational cohomology before ArithmeticKTheory supplies finite generation. Lattice/covolume results explicitly consume that later finiteness theorem, with embedding conjugation and orientation preserved.

**Campaign dependencies:** [StableHomotopyKTheory](../StableHomotopyKTheory/README.md), [GeneralAlgebraicKTheory](../GeneralAlgebraicKTheory/README.md), [ArithmeticKTheory](../ArithmeticKTheory/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

**Prefix:** R. **Dependencies:** H, K, S, arithmetic groups, real/complex analysis and Lie theory. N supplies the finite-generation theorem where a lattice conclusion uses it; N's rank calculation consumes R's cohomology result only. **References:** Borel (1974), especially Proposition 12.2; Bloch, Lectures 1–7; Handbook II.3–II.4.

## R.1 — Arithmetic groups and finiteness infrastructure

Import restriction of scalars, Haar/Tamagawa measures and reduction from [AdelicAlgebraicGroups](../AdelicAlgebraicGroups/README.md), and Borel–Serre compactification, finite-complex models and torsion-stabilizer descent from [ArithmeticLocallySymmetricSpaces](../ArithmeticLocallySymmetricSpaces/README.md). Specialize to orders in central division algebras and construct the block-inclusion maps used by Borel. Prove the finite-type homotopy consequences needed by K-theory; keep finite generation separate from stable rational cohomology.

## R.2 — Continuous and relative Lie-algebra cohomology

Import continuous and relative Lie-algebra cochain complexes, van Est and invariant forms from [AutomorphicFormsOnReductiveGroups AF.1a](../AutomorphicFormsOnReductiveGroups/README.md). Construct the comparison to the arithmetic subgroup and prove compatibility with block inclusions, primitive classes and coefficient extension. The analytic estimates and stable-range calculation are proved in the next layer.

## R.3 — The stable cohomology calculation

Compute the stable cohomology of the compact duals using the classical groups and their fibrations, with primitive generators and their degrees. Prove the stable-range comparison with arithmetic groups, keeping the bound and rank parameters explicit. Establish that the direct-limit cohomology is the required exterior algebra and identify its primitive/indecomposable part.

Use rational Hurewicz and the plus-construction comparison to convert the primitive cohomology calculation into K-group ranks. Prove Borel's Proposition 12.2 at the stated generality of orders in a central division algebra over a number field: for i≥2 the ranks have the period-four pattern `0, r₁+r₂, 0, r₂` according to i modulo 4. Include the commutative order and S-integer cases via the appropriate comparison/localisation results.

This endpoint is a proof of the rank theorem, not the rank formula added as a typeclass instance.

## R.4 — Regulator classes and maps

Construct the normalised continuous-cohomology Borel classes and pair them with K-theory homology classes. For each embedding of F in C construct the component regulator, prove the complex-conjugation parity and assemble

\[
 r_j:K_{2j-1}(F)\longrightarrow V_j(F),\qquad j\geq2,
\]

where the archimedean target has dimension r₁+r₂ for odd j and r₂ for even j. Define the target with its embedding and conjugation action before choosing coordinates. Prove naturality, transfer/trace formulas, and compatibility with products and Adams weight j.

Construct the determinant line and the regulator covolume of the torsion-free arithmetic K-group. Finite generation is used here; it was not needed to assert the rank of a rational vector space. Prove that the image is a full lattice, with independence from the chosen integral basis up to the designated orientation/sign convention.

## R.5 — Dedekind zeta functions and leading terms

Import the completed Dedekind zeta function, archimedean factors, continuation and functional equation from [AutomorphicLFunctionsAndLocalFactors](../AutomorphicLFunctionsAndLocalFactors/README.md), with its comparison to ArithmeticDirichletSeries. The proof route uses Poisson summation/Tate integrals or the equivalent classical analytic construction, with Haar measures and discriminants normalised.

For j≥2 prove the order of vanishing at `1−j` agrees with `dim V_j(F)` and define the nonzero leading coefficient analytically. A real-field value at −1 is not a pole. Prove Borel's regulator theorem, including the rational proportionality statement between the properly normalised leading coefficient and regulator covolume. Rational proportionality is not the full integral Lichtenbaum formula; the latter has torsion and dyadic factors and is treated separately.

## R.6 — Bloch's Tamagawa reformulation

Develop the adelic and Tamagawa-measure description used in Bloch's first four lectures, the primitive cohomology pairings and the comparison with Borel's formulation. Define the local measures, their product, and the finite-volume integrals; prove the conversion of discriminant and archimedean factors. This supplies the framework needed to reproduce the number-field regulator results discussed in that book, rather than using the book's assumption of Borel's theorem as an unexplained formal axiom.

## R.7 — Beilinson comparison and tests

Compare the Borel map with M's Beilinson/Deligne regulator. State and prove the precise scalar under the selected conventions; the literature contains a factor of 2 between common normalisations, and the determinant then changes by the corresponding power. The convention is tested at weight two against the explicit Bloch–Wigner regulator of P.

Recover the zero-rank cases over Q and the rank-one weight-two regulator for an imaginary quadratic field. Compare the determinant/leading-term assertions under extension and restriction of embeddings. Export both coordinate-free maps and computational matrices, with the equality linking them proved.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-arithmeticgroups"></a>

**KU-arithmeticgroups — Reduction theory and arithmetic-group finiteness.** Readiness checkpoint for original `arithmeticgroups`: verify completion and map-level compatibility of [BorelRegulators:R.1](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `homotopy`, `existing`. 

<a id="stage-KU-borelranks"></a>

**KU-borelranks — Stable arithmetic cohomology and Borel ranks.** Readiness checkpoint for original `borelranks`: verify completion and map-level compatibility of [BorelRegulators:R.2](README.md), [BorelRegulators:R.3](README.md), [ArithmeticKTheory:N.3:ranks](../ArithmeticKTheory/README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `arithmeticgroups`, `pluscomparison`. 

<a id="stage-KU-borelreg"></a>

**KU-borelreg — Borel regulator, lattice and zeta proportionality.** Readiness checkpoint for original `borelreg`: verify completion and map-level compatibility of [BorelRegulators:R.4](README.md), [BorelRegulators:R.5](README.md), [BorelRegulators:R.6](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `borelranks`, `finitegeneration`, `zeta`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `R.3` | Prove the primitive continuous-cohomology comparison in a specified stable range before using rational Hurewicz to read off K-ranks. |
| `R.4` | Construct the embedding-conjugation target and its integral covolume after arithmetic finite generation; prove scalar extension, transfer and basis-change formulas. |
| `R.7` | Fix the Borel-to-Beilinson scalar by a weight-two comparison with the Bloch–Wigner map and transport it to rank-r determinants by the r-th power. |

**Producer–consumer handoff.** ArithmeticKTheory N.3:ranks uses only R.3; SpecialValuesBirchTate B.8 and PeriodsAndSpecialValues use the later lattice/determinant normalization.

**Acceptance.** Test a real zero-rank weight-two target and an imaginary-quadratic rank-one target. Rational proportionality must never be emitted as an integral torsion identity.

**Source-readiness boundary.** Transcribe the exact Borel/Beilinson scalar and orientation from the adopted primary conventions.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
