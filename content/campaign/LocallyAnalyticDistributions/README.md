# locally analytic distributions, growth, and character spaces

Analytic distributions, character spaces and Fredholm operators.

## Canonical ownership and interfaces

- Define a locally analytic manifold's function spaces with their actual inductive-limit topology. A family specialization is a continuous base-change map, not evaluation on an arbitrary point set.
- The same compact-operator/Fredholm theory supplies modular and general reductive-group eigenvarieties. Group-specific compactness/control estimates belong to their application owners.

**Campaign dependencies:** [PadicMeasuresIwasawaAlgebras](../PadicMeasuresIwasawaAlgebras/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

## Scope and dependencies

Build the distribution spaces needed by nonordinary modular forms and by p-adic regulators. Work over finite extensions K/Q_p, over finite-dimensional p-adic analytic manifolds, and over reduced affinoid K-algebras for families. General topological or distribution spaces are not silently treated as Banach spaces. Depend on R01; use AdicSpaces only for the final geometric interpretation of analytic character spaces, not for elementary one-variable power-series calculations.

## L0. Banach spaces of locally analytic functions

Construct the Banach spaces of functions analytic on every residue ball of a fixed radius, with their Gauss norms. Prove compactness of X supplies a uniform radius for locally analytic functions, independence of charts, restriction to smaller balls, tensor products and continuous inclusions. Define the locally convex inductive-limit topology on C^la(X,K). Construct its continuous dual and the projective system of Banach duals. Prove density and the map from bounded measures. Equality of the underlying functions is not equality of their locally convex topologies.

For X=O_F or a finite product of local integer rings, distinguish Q_p-locally analytic from F-locally analytic functions. The number-field automorphic construction uses the embeddings and multivariable weights it actually needs.

## L1. Amice's unbounded transform

Prove RJW Theorem 3.43: the Amice transform identifies distributions on Z_p with power series convergent on every closed disc of radius r<1. Prove the Frechet topology comparison and the compatibility with R01's bounded transform. Extend the toolbox of restriction, twisting, phi, psi and differentiation with continuity on the appropriate spaces. Prove division by x on distributions supported on units without using a globally defined function x^−1 on Z_p.

Provide locally analytic primitives on each admitted ball and the precise freedom to add a locally constant function. A single global constant is justified only after a separate continuation/uniqueness theorem. Applications involving logarithms of (1+T)xi−1 must justify their analytic domain and cancellation of apparent poles, especially when xi has p-power order.

## L2. Admissible growth and uniqueness

Define order-h admissibility by explicit norm estimates on small balls against locally polynomial test functions, with h a nonnegative real or rational number as appropriate. Give equivalences with coefficient-growth descriptions. Prove extension and uniqueness from locally polynomial distributions under the Amice–Velu/Vishik degree bound. Prove order zero agrees with bounded measures in the setting used for modular L-functions. At critical slope do not apply the strict small-slope uniqueness theorem.

For several p-adic variables, retain a vector of radii and growth bounds. State uniqueness with precisely the available locally algebraic characters and the density/admissibility theorem; values at a collection of arithmetic points are not automatically determining on an arbitrary analytic space.

## L3. Character spaces and Mellin transforms

Construct the functor of continuous characters of a compact commutative p-adic analytic group on affinoid K-algebras. For G=Z_p^d identify its character space with the d-dimensional open polydisc. For Z_p^× and odd p obtain p−1 components; for p=2 use {±1} and 1+4Z_2. Prove the coordinate change for a different topological generator.

Construct the universal character and identify distributions with analytic functions in the cases covered by Amice theory; bounded measures give bounded functions and pseudo-measures give meromorphic functions on their stated domains. Prove the Mellin transform, evaluation, derivatives in weight, twisting, and functoriality for homomorphisms of ray-class groups. The statement is about analytic functions over K and their K'-valued points, not an arbitrary K-valued function on C_p-points.

Build the corresponding adic/rigid spaces using the shared affinoid and open-gluing APIs of AdicSpaces. Prove comparison with the power-series construction; do not require diamonds to construct these objects.

## L4. Families and operator theory

Define affinoid-valued analytic functions and distributions, integral models where available, completed tensor products and specialization. Prove continuity and compactness of the semigroup operators used for modular symbols, nuclear/Fredholm determinants in the precise compact-operator setting, slope decompositions, and compatibility with specialization on slope-adapted affinoids. These operator theorems are supplied to R10, R13 and R14; they are not hypotheses hidden in a structure called an eigenvariety.

**Acceptance:** RJW §§3.7–3.8; order-zero and multivariable tests; the strict slope threshold for R10; universal-character evaluation under scalar extension; a positive-order distribution which is not a bounded measure.

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
| `L0` | Define the inductive-limit topology through radius-indexed Banach spaces; prove chart independence and compare Q_p-analytic with F-analytic coefficients. |
| `L1` | State primitive uniqueness locally: derivative-zero locally analytic functions may be locally constant with different constants on disjoint balls. A single global constant needs a connected/coherent continuation theorem. |
| `L4` | Construct completely continuous operators and Fredholm determinants on the admitted Banach modules, prove slope factorization/base change, then export group-specific operator hypotheses to consumers. |

**Producer–consumer handoff.** ModularSymbolsPadicLFunctions L2 receives the strict small-slope uniqueness theorem; ColemanIntegration separately supplies Frobenius continuation.

**Acceptance.** Use a locally constant function on two disjoint balls to test derivative-zero ambiguity, and an admissible positive-order distribution that is unbounded.

**Source-readiness boundary.** Select the exact nonarchimedean functional-analysis/Fredholm hypotheses, including orthonormalizable or property-(Pr) modules.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
