# Polylogarithms, explicit regulators and Zagier statements

Low-weight polylogarithmic complexes and regulator comparisons.

## Canonical ownership and interfaces

- Construct single-valued functions independently of K-theory and prove descent through the precise five-term quotient. Real-regulator equality is insufficient to identify torsion classes.
- All stated general Zagier, Leopoldt and higher elliptic conjectures use constructed source and target groups. Their definitions contain actual equalities/injectivity conditions; they never become typeclass assumptions for unconditional results.

**Campaign dependencies:** [K3BlochGroups](../K3BlochGroups/README.md), [BorelRegulators](../BorelRegulators/README.md), [SchemeKTheoryOperations](../SchemeKTheoryOperations/README.md), [MotivicEtaleKTheory](../MotivicEtaleKTheory/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

**Prefix:** P. **Dependencies:** V, R, S, M, complex analysis. **References:** Handbook II.3; Bloch, Lectures 5–7; Goncharov; Goncharov–Rudenko, §2; K-book VI §5.

## P.1 — Classical and single-valued polylogarithms

Define `Li_n(z)` by its convergent power series on the unit disk. Prove differentiation, analytic continuation on a specified cut domain, branch-change formulas and distribution relations. Define the single-valued real polylogarithms with the Bernoulli coefficients and parity convention of the selected source. Prove the continuous extensions needed at 0, 1 and infinity.

For weight two define the Bloch–Wigner dilogarithm

\[
 D(z)=\operatorname{Im}(\operatorname{Li}_2(z))
       +\arg(1-z)\log|z|
\]

on a cut domain and prove that the resulting single-valued function is independent of the presentation. Prove conjugation, inversion, the five-term identity and the differential formula. Boundary values and logarithmic singularities are handled explicitly, so no use of `arg` is made as a globally continuous function.

## P.2 — The weight-two regulator

Descend the Bloch–Wigner function through the exact V.3 Bloch-group convention. Assemble its embedding-wise map for a number field and compare it with the Borel class. Develop the configuration/cross-ratio cocycle and hyperbolic-volume calculation used by Bloch to identify this map with the abstract regulator.

The comparison includes its sign and scalar. Since a real regulator kills torsion, it cannot by itself distinguish two integral Bloch groups differing by 2-torsion. Retain the integral comparison from V for finite regulators, rather than identifying models solely because their real regulators agree.

Prove certified numerical evaluation by explicit truncation and tail bounds. The numerical approximation is a separate function with an error theorem; it is not the definition of the real regulator or a proof that a value is exactly nonzero.

## P.3 — Weight-three polylogarithmic complexes

Construct the weight-three polylogarithmic groups and relations of the adopted Goncharov model, the complex

\[
 B_3(F)\longrightarrow B_2(F)\otimes F^\times
       \longrightarrow\bigwedge^3F^\times,
\]

and the proof that successive differentials compose to zero. Supply residue maps, transfers and functoriality. Construct the comparison from the appropriate weight-three rational K-groups and prove compatibility with the explicit trilogarithm regulator.

Prove the resulting weight-three special-value theorem in its established number-field form using R's theorem and this comparison. Avoid stating that a general polylogarithmic complex computes every motivic cohomology group in every weight; each comparison carries its proven degree range.

## P.4 — General polylogarithmic statement infrastructure

Define the rational polylogarithmic complexes in the degrees needed to state Zagier's conjecture for a number field and an integer weight. Fix admissible configurations and relations rather than declaring an abstract vector space whose dimension is the expected regulator rank. Define the determinant of the embedding-wise regulator matrix and the exact period/discriminant normalisation.

State the general Zagier assertion in terms of actual polylogarithmic elements satisfying their boundary relations and the nonzero rational proportionality of their determinant with the relevant zeta value. Separate existence of such elements, generation/comparison with motivic cohomology, and the numerical determinant identity. These are different propositions.

Use the explicit formulation in Goncharov–Rudenko §2 to specify the weight-four statement. This family constructs the statement and its regulator objects; a full proof of the weight-four cluster/motivic-correlator theorem is not silently claimed as a consequence of the weight-three construction. The theorem is a separately identified extension, not a prerequisite for the elliptic weight-two or Habiro K₃ endpoints.

## P.5 — Curves and regulator complexes

Construct the low-weight polylogarithmic complexes of a smooth curve using the generic field, residue complexes and the specified boundary maps. Prove that unramified classes define the relevant global motivic/Deligne classes. Compare the regulator with M's higher Chern character in the degrees established by the source.

For weight two derive the logarithmic differential expression used by ER. Retain real/complex conjugation, periods and Tate twists. For weight three construct the corresponding curve regulator and the Eisenstein–Kronecker expression as a target where the needed analytic result is proved; the elliptic weight-three special-value conjecture is not included among theorems proved by Bloch's weight-two argument.

## P.6 — Other precise statements and tests

Using N's units and D's p-adic logarithm, state Leopoldt as injectivity of the correctly defined completed global-unit map to local units/logarithms, or equivalently nonvanishing of its regulator, and prove equivalence of the two formulations with torsion removed. This statement does not assume Leopoldt in constructing the local regulator or Iwasawa cohomology.

Test the weight-two five-term relation at algebraic points, conjugation cancellation at real embeddings, and the weight-three differential identity. Test that every claimed Bloch element has a supplied boundary proof. A list of floating-point dilogarithm values is not a certificate for a K₃ element.

## Scope boundary

The proved endpoints are the specified low-weight regulator constructions, their K-theory comparisons and their established special-value consequences. General Zagier, finite-level Leopoldt and general higher-weight elliptic Beilinson assertions are precise conjecture declarations. They are never installed as assumptions in the ordinary number-field K-theory namespace.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-polyloganalysis"></a>

**KU-polyloganalysis — Classical polylogarithms and their functional equations.** Readiness checkpoint for original `polyloganalysis`: verify completion and map-level compatibility of [Polylogarithms:P.1](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `existing`. 

<a id="stage-KU-realregulators"></a>

**KU-realregulators — Explicit low-weight regulators and comparisons.** Readiness checkpoint for original `realregulators`: verify completion and map-level compatibility of [Polylogarithms:P.2](README.md), [Polylogarithms:P.3](README.md), [Polylogarithms:P.4](README.md), [Polylogarithms:P.5](README.md), [BorelRegulators:R.7](../BorelRegulators/README.md), [MotivicEtaleKTheory:M.8](../MotivicEtaleKTheory/README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `polyloganalysis`, `blochk3`, `borelreg`, `motivicspectral`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `P.1` | Construct analytic continuation and cancellation of branch monodromy before defining the global Bloch–Wigner map; prove boundary limits at 0, 1 and infinity. |
| `P.3` | Build the weight-three relation quotient, residue maps and differential-square-zero proof before mapping from rational K-theory. Retain the exact degree range of the source comparison. |
| `P.4` | For general weights distinguish determinant special-value statements from a motivic comparison equivalence; a conjectural equality cannot supply a constructor of Bloch elements. |

**Producer–consumer handoff.** EllipticRegulators ER.2–4 receives weight-two functions and exact normalization; PeriodsAndSpecialValues takes the broader conjectural statement interface.

**Acceptance.** Check five-term relations using admissible algebraic entries with boundary certificates and compare numerical enclosures only after an analytic error theorem.

**Source-readiness boundary.** Weight-four and arbitrary-weight comparison proofs are separately scoped extensions, not consequences of the weight-three development.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
