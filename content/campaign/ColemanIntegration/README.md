# Coleman integration and noncritical Dirichlet L-values

Frobenius continuation, p-adic polylogarithms and positive values.

## Canonical ownership and interfaces

- This is the unique analytic owner of p-adic polylogarithms used by PadicHodgeRegulators D.1. It supplies integration and branch-change rather than assuming a global locally analytic primitive.
- Good-reduction/wide-open and de Rham prerequisites import AdicSpaces and ClassicalAdicEtaleCohomology's geometric comparison interfaces; the explicit Frobenius integration construction is proved here.

**Campaign dependencies:** [DirichletPadicLFunctions](../DirichletPadicLFunctions/README.md), [LocallyAnalyticDistributions](../LocallyAnalyticDistributions/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

## Scope

Theorem 6.7 is a theorem stated in the notes, not just a passing reference. Covering the notes fully therefore requires Coleman polylogarithms; a project ending with s=1 does not meet the scope. Construct the required theory of Coleman integration on good-reduction curves and its application to the punctured projective line. No theory of every p-adic period or every regulator is assumed as a substitute.

**Dependencies:** R01–R03, LocalFieldsRamification, AdicSpaces for rigid/adic analytic domains and gluing, AlgebraicCurves for algebraic differentials and de Rham complexes. The missing overconvergent de Rham and Frobenius-continuation facts are targets below.

## L0. Analytic differential equations on residue discs

Develop convergent and overconvergent power series, annuli, residues, exact differentials and termwise integration with its convergence domain. Prove the unique primitive with chosen base value on a disc. Construct the logarithm with log_p(p)=0 on the necessary annuli and record how another branch changes it. Prove path-independent continuation only in the theory constructed below, not for arbitrary locally analytic functions.

## L1. Frobenius continuation

Construct wide-open and overconvergent neighborhoods of a smooth curve with good reduction, Frobenius lifts on a cover, and finite-dimensional rigid/de Rham cohomology in the degree used for integration. Prove independence of lift and the comparison between cohomological and local analytic pullback. Prove the Frobenius polynomial argument giving analytic continuation of primitives, and the Coleman uniqueness principle.

Define Coleman functions by compatible local analytic functions with the Frobenius continuation data. Build pullback, differentiation, products and integration, and prove that changing auxiliary Frobenius choices yields the canonical same function after fixing the base normalization. State exactly the good-reduction and unipotence assumptions used. For the application to P^1 minus {0,1,infinity}, provide a direct construction by successive extensions, so that no general Tannakian theorem is an unowned prerequisite.

## L2. Polylogarithms

Begin with Li_1(z)=−log_p(1−z) and define Li_k by dLi_k=Li_{k−1}(z) dz/z and its power series sum_(n≥1) z^n/n^k on |z|<1. Prove existence, uniqueness in the Coleman category, the differential recursion, distribution relations, inversion relations and Frobenius relations. Treat the tangential/base-point normalization at zero explicitly. A mere antiderivative in each residue disc does not characterize Li_k globally.

Establish evaluation at roots of unity different from 1, including roots of p-power order, and the norm/trace compatibilities needed by primitive characters. Prove compatibility with coefficient embeddings and the complex polylogarithm formula separately.

## L3. Positive integer values

Prove RJW Theorem 6.7 in the normalization of R03:

    L_p(theta,k) = (1−theta(p)p^(−k)) / G(theta^−1)
                   * sum_c theta^−1(c) Li_{k,p}(xi_N^c),  k≥1,

for nontrivial primitive theta, with all characters, branches and Gauss sums as in the notes. Give the corresponding complex formula, and prove k=1 recovers Theorem 6.1. Prove the comparison with the locally analytic-distribution argument where both apply.

A regulator interpretation is a separate theorem, not the definition of the L-value. Supply the de Rham/finite-polynomial regulator interpretation needed to compare this example with R09 and R12; the general motivic Beilinson conjecture is stated as a proposition about defined realizations, not asserted as proved.

**Acceptance:** Theorem 6.7 for every positive integer k; the k=1 and tame/p-power-conductor tests; independence of auxiliary Frobenius lifts; explicit distinction between Coleman functions and all locally analytic functions.

## Shared conventions and sources

The programme conventions, dependency contracts, and source register are part of this specification. References such as RJW, Rubin, SU, and FW denote the precise sources and versions listed there. The mathematical milestones above, not a source-code inventory, define completion.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `L0` | Prove the derivative of the normalized formal primitive in characteristic zero, then a radius-loss estimate on each residue disc. Residues obstruct Laurent primitives on annuli and require the logarithm branch. |
| `L1` | Construct the finite-dimensional Frobenius action and prove the polynomial annihilation argument used in continuation; state uniqueness after base/tangential normalization. |
| `L3` | Evaluate roots of unity of tame and pure p-power order separately, checking Gauss sums and the k=1 reduction before the positive-integer formula. |

**Producer–consumer handoff.** PadicHodgeRegulators D.1 consumes the fixed branch and Frobenius/dilogarithm identities, rather than an arbitrary formal antiderivative.

**Acceptance.** The formal primitive seed now requires characteristic zero. Check branch change and a nonzero-residue annulus where an ordinary analytic primitive does not exist.

**Source-readiness boundary.** Transcribe the precise Coleman continuation and positive-value formula from RJW/Coleman primary proofs.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
