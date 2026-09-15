# Dirichlet p-adic L-functions, special values, and Eisenstein measures

Dirichlet interpolation, residues and Eisenstein measures.

## Canonical ownership and interfaces

- Adopt the existing ModularForms/GlobalNumberFields carriers and prove complex-to-algebraic-to-p-adic normalization diagrams. Small edits to existing zeta conventions suffice; the measure theory is substantial new scope.
- The dyadic branch uses ±1×(1+4Z₂); at k=1 the Euler factor annihilates the zeta(0) value. Analytic continuation of Dedekind zeta is shared with the campaign's general L-function owner.

**Campaign dependencies:** [PadicMeasuresIwasawaAlgebras](../PadicMeasuresIwasawaAlgebras/README.md), [LocallyAnalyticDistributions](../LocallyAnalyticDistributions/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

## Scope

Construct the analytic objects of RJW Parts I in full, including arbitrary tame conductor, complex comparisons, the value at one, residues and the Eisenstein family. Work with finite coefficient fields large enough for each character, with descent and scalar-extension theorems. Odd p is the exact scope of the notes; include a separate p=2 branch construction using 1+4Z_2 and the corrected integral normalization, rather than reusing the odd-prime generator argument.

**Dependencies:** R01–R02, LocalFieldsRamification, GlobalNumberFields, and the classical ModularForms roadmap for the actual Eisenstein modular forms. Use Mathlib Bernoulli numbers, Dirichlet characters and zeta/L-series wherever available. L0 owns the specific Bernoulli/Mellin and residue-normalization comparisons; general adelic continuation and functional equations import AutomorphicLFunctionsAndLocalFactors AL.0–1. Reuse Mathlib’s `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` for the arithmetic value of the class-number residue; L0 supplies the analytic-pole comparison in the preserved dependency contract, which is stronger than that existing real one-sided limit.

## L0. Complex special values and algebraicity

Prove the Mellin-transform continuation argument of RJW Theorem 2.4, including differentiation under integrals and decay bounds; apply it to the Bernoulli generating function and its smoothed variant. State the zeta special-value formula with the correct n=0 convention. Construct generalized Bernoulli numbers, primitive-character Gauss sums, their nonvanishing and inversion formula, conductor change and imprimitive Euler-factor deletion. Compare the algebraic values with the complex analytic L-functions.

For RJW Theorem 2.2, identify the existing Dedekind-zeta Dirichlet series with its meromorphic germ at one. Prove that germ has a simple pole, using the trivial-Hecke-character Tate theorem of AutomorphicLFunctionsAndLocalFactors AL.1 (or a separately proved ideal-counting/Mellin comparison), and identify its residue with Mathlib’s existing one-sided limit. This supplies the analytic statement without redoing the unit-lattice volume computation.

Do not use a field isomorphism C ≃ C_p to transport arbitrary complex values. Use the algebraic number containing the normalized L-value, together with explicit complex and p-adic embeddings. Supply the elementary idele-character identifications in RJW Propositions 2.9/2.11 using the shared idele-class group, including the archimedean connectedness argument.

## L1. The smoothed measure and Kubota–Leopoldt

For an integer a>1 prime to p construct

    F_a(T)=1/T − a/((1+T)^a−1) ∈ Z_p[[T]],

by cancellation in power series, not by pretending that T is invertible in Z_p[[T]]. Let mu_a be its Amice inverse. Prove its polynomial moments, psi(mu_a)=mu_a, and the Euler factor arising on restriction to units. Define the numerator x^−1 Res(mu_a). Divide by [a]−1 only in the total quotient ring, proving regularity and independence of the smoothing parameter.

The endpoint, in RJW's normalization, is the unique pseudo-measure zeta_p satisfying

    integral_(Z_p^×) x^k dzeta_p = (1−p^(k−1)) zeta(1−k),  k≥1.

At k=1 the Euler factor is zero; keep this case in the proof rather than claiming zeta(0)=0. Prove parity and descent to the quotient by ±1 for odd p. Derive the correctly smoothed and character-component Kummer congruences, including denominator restrictions; do not assert an integral congruence for an arbitrary unsmoothed pseudo-measure.

## L2. All Dirichlet characters

Construct the twist by a p-power conductor character and prove the roots-of-unity restriction formula and Gauss-sum computation. For primitive eta of conductor D>1 coprime to p, construct the integral measure zeta_eta and prove, for primitive chi of p-power conductor and k≥1,

    integral chi(x)x^k dzeta_eta
       = (1−(chi eta)(p)p^(k−1)) L(chi eta,1−k).

Define the evaluation at p using the conductor of the primitive character, not an arbitrary modulus. Include the trivial character separately, descent to the field generated by eta's values, compatibility with scalar extension and conductor change, and primitive/imprimitive comparisons. This covers RJW Theorems 5.1 and 5.7, including the detailed calculations left as exercises.

## L3. Branches, logarithms and poles

Use Teichmuller decomposition to define the branches and prove Theorems 5.17/5.20. Fix log_p(p)=0 and the logarithm on all algebraic extensions compatibly. Prove the complex logarithmic formula and Leopoldt's p-adic formula of Theorem 6.1, with primitive character, chosen Gauss sum and root of unity. Cover pure p-power conductor as well as nontrivial tame conductor; a proof only on the tame component is not completion.

Prove Theorem 7.1: exactly the trivial weight-space component can have the indicated pole, and in the s-coordinate of RJW its residue is 1−p^−1. Separate the numerator evaluation, convergence, nonvanishing of log_p(a), and division by the simple zero. Changing the s-coordinate changes the residue in the predicted way. R05 supplies the additional positive-integer polylogarithm values of Theorem 6.7.

## L4. Eisenstein families

For every even k≥4 prove the actual q-expansion of E_k and of E_k−p^(k−1)E_k(pz), using the shared classical modular forms. Construct the coefficient measures A_n=sum_(d|n,p∤d) delta_d for n>0 and the pseudo-measure A_0=x zeta_p/2. Prove coefficientwise specialization at x^(k−1) gives the p-stabilized form, exactly RJW Theorem 8.2.

Distinguish this measure-valued q-expansion from a full geometric family of overconvergent forms. Its realization on weight-space affinoids and comparison with Hida/Coleman theory belongs to R13. Generalized Eisenstein series with tame nebentypus and their integral q-expansion congruences are included here as the GL1 input to R14.

**Acceptance:** all named results in RJW §§2–8 except Theorem 6.7 (R05); Theorem 2.2 combines Mathlib’s class-number limit with L0’s analytic comparison; exact normalization and base-change tests against the pinned Mathlib/Tau Ceti arithmetic carriers (the source pack's undefined AINTLIB shorthand is not a dependency); p=2 tests are separately named and never justified with odd-order idempotents.

## Shared conventions and sources

The programme conventions, dependency contracts, and source register are part of this specification. References such as RJW, Rubin, SU, and FW denote the precise sources and versions listed there. The mathematical milestones above, not a source-code inventory, define completion.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-zeta"></a>

**KU-zeta — Completed Dedekind zeta and special values.** Readiness checkpoint for original `zeta`: verify completion and map-level compatibility of [DirichletPadicLFunctions:L0](README.md), [AutomorphicLFunctionsAndLocalFactors:AL.1](../AutomorphicLFunctionsAndLocalFactors/README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `existing`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `L1` | Construct the integral smoothed power series by cancellation before dividing; prove its moment formula at k=1 separately and attach a nonzero-denominator certificate to character evaluation. |
| `L2` | Transport imprimitive characters to their primitive inducing character before evaluating at p; expose every removed Euler factor and the tame/p-power conductor dictionary. |
| `L3` | Prove the pole as an analytic germ in the chosen weight coordinate and its residue transformation under coordinate change; keep the p=2 component construction integral. |

**Producer–consumer handoff.** ColemanPowerSeries L2 and IntegralIwasawaTheory I.3 consume the identical pseudomeasure, with sign/twist conversion maps; AutomorphicPadicLFunctions L3 compares F=Q.

**Acceptance.** Test zeta(0), pure p-power conductor, trivial character and the p=2 torsion component. No C-to-Cp isomorphism supplies algebraicity.

**Source-readiness boundary.** The dyadic normalization and exact primitive-character positive-value formulas require primary transcription.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
