# p-adic measures, completed group algebras, and characteristic ideals

Analytic and algebraic Part II of ProfiniteProPGroups.

## Canonical ownership and interfaces

- Completed group rings import the existing profinite group and inverse-limit APIs. The owner constructs bounded measures, Amice comparison, Weierstrass structure, characteristic ideals and determinant lines.
- Generic congruence/Fitting commutative algebra from IntegralHeckeAndGaloisDeterminants is reused where applicable; this owner supplies the topological and Λ-specific hypotheses and specializations.

**Existing foundations:** Mathlib, LocalFieldsRamification and ProfiniteProPGroups.

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

## Purpose and scope

Develop the common analytic and algebraic language of Iwasawa theory. The basic measure theory is for an arbitrary profinite space and a finite extension K/Q_p. Convolution is for a profinite group; commutativity is required only where it is used. Completed group rings are constructed for complete separated adic coefficient rings. The structure theorem and ordinary characteristic ideals are stated over a complete discrete valuation ring O with finite residue field. Multivariable characteristic divisors and determinant lines are also included, with their additional hypotheses explicit.

**Dependencies:** Mathlib topological modules, continuous linear maps, inverse limits, power series, localization and commutative algebra; the existing ProfiniteProPGroups and LocalFieldsRamification roadmaps. This roadmap owns the p-adic analytic and module-theoretic facts not supplied by those dependencies. It does not assume class field theory.

## L0. Coefficients, continuous functions, and duals

Use the existing finite-extension and valuation-ring carriers. Develop continuous scalar extension along isometric embeddings of p-adic fields, finite free integral lattices, the relation between the normalized valuation v_p and a uniformizer valuation, and completed tensor products when needed. Define a K-valued bounded measure on a profinite space X as the continuous K-linear dual of C(X,K), with its supremum norm. The integral lattice consists of measures taking C(X,O) into O. Prove the integral-lattice description, boundedness and scaling into that lattice.

Prove density of locally constant functions using finite clopen partitions of an arbitrary profinite space, not a formula using residue classes valid only for Z_p. Identify integral measures with finitely additive O-valued functions on clopens; identify K-valued measures with **bounded** such functions. Establish extension from dense test-function spaces, uniqueness, scalar extension, pushforward, restriction to a clopen, extension by zero, support and disjoint decomposition. Noncompact subsets require a separately stated function space; do not extend the compact-space definition indiscriminately.

For Banach spaces whose nonzero norm values lie in the coefficient value group, prove the orthonormal-basis theorem used in RJW Remark 3.4 by lifting a basis of the integral lattice modulo varpi and completing the successive expansions.

Equip the dual with the operator-norm and weak topologies separately. Establish precisely the completeness and compactness statements used below; operator-norm convergence is uniform on the unit ball, and unrestricted weak completeness of the full continuous dual is not asserted; the integral dual is weakly compact, whereas its operator-norm topology generally is not compact.

## L0a — Rigid character and weight spaces

For a compact abelian p-adic analytic group G with an open subgroup isomorphic to Z_p^d, construct the rigid analytic space representing continuous characters G→A× on affinoid coefficient algebras A, with the prescribed analyticity condition for locally analytic weights. Give the generic-fibre construction from the completed group ring of L1, the finite-character components and polydisc charts after scalar extension; prove representability, evaluation of the universal character, pullback in G and affinoid base change. At p=2 keep torsion and the 1+4Z_2 chart distinct. Integral characters, rigid characters and locally analytic character subspaces have separate domains. For nonabelian groups, the one-dimensional character space factors through the relevant abelianization; it is not a space of arbitrary representations.

Construct the analytic universal-character action on the distribution/coefficient modules of LocallyAnalyticDistributions L0–L3, including radii, continuity and completed coefficient tensors. OverconvergentAutomorphicForms O0 imports this coefficient/weight API; it does not require the later eigenvariety or its Galois representations. PadicFamilies L2a consumes it for general spectral gluing. Dependencies: L0 and the early completed-group-ring construction of L1; no characteristic-ideal or main-conjecture theorem is used.

## L1. Completed group rings and convolution

For a complete adic ring R with ideal of definition I and profinite group G define

    R[[G]] = lim_(n,U) (R/I^n)[G/U],

where U ranges over open normal subgroups. Prove independence of the ideal of definition among ideals defining the same topology, functoriality, augmentation, Dirac elements, density of the ordinary group algebra, and the universal property for **continuous** actions on complete separated linearly topologized modules with a neighborhood basis of open G-stable R-submodules. For R=O prove the equivalent presentation lim_U O[G/U]. Do not identify lim_U K[G/U] with bounded K-valued measures: the latter are O[[G]][1/p].

Construct convolution by iterated integration and prove the interchange theorem first on locally constant functions and then by uniform approximation. Prove the topological O-algebra equivalence between integral measures and O[[G]]. For nonabelian G keep the order of convolution; the abelian specialization is a commutative algebra. Supply restriction/induction and finite-index norm maps, and their projection formulas.

The inclusion of measures supported on Z_p^× into measures on additive Z_p is linear, **not an algebra homomorphism** for the two different convolutions.

## L2. Mahler–Amice theory for bounded measures

Reuse Mathlib's `PadicInt.hasSum_mahler` and its coefficient-general Mahler basis. Establish the naturality and norm formulas needed to identify M(Z_p,O) with O[[T]] by

    A_mu(T) = sum_n mu(x ↦ binom(x,n)) T^n.

Prove the inverse by summing Mahler coefficients against a bounded coefficient sequence. Establish multiplication, Dirac transforms, coefficient extraction, injectivity and uniqueness from polynomial moments. Extend to finite products Z_p^d. Distinguish the coefficientwise/(uniformizer,T)-adic topology from uniform convergence of coefficients.

Build all of RJW §3.5: multiplying a measure by a function; the operator ∂=(1+T)d/dT; translations and dilations; roots-of-unity projections to residue classes; phi(T)=(1+T)^p−1; psi; psi phi=1 and phi psi=restriction to pZ_p; restriction to units as 1−phi psi; inversion of multiplication by x on units. Every root-of-unity expression includes scalar-extension/descent and convergence statements.

## L3. Pseudo-measures and evaluation

For commutative O[[G]], use localization at its non-zero-divisors. Define pseudo-measures by the condition ([g]−1)lambda∈O[[G]] for every g. Prove their module structure, augmentation-ideal description, and evaluation at nontrivial characters by clearing a factor [g]−1 whose evaluation is nonzero. Prove independence of g. Do **not** construct a character map on the entire total quotient ring: its denominators may vanish at that character.

For procyclic G prove the principal augmentation-ideal theorem, existence and uniqueness statements used by RJW §§3–4, and change of generator. Treat Z_2^× as {±1}×(1+4Z_2), not as a procyclic group. Arithmetic branches at p=2 are integral objects before any rational eigenspace decomposition.

## L4. Weierstrass theory and module structure

Prove Weierstrass division and preparation for O[[T]], including continuity and uniqueness. Derive noetherianity, regularity, dimension two, factoriality, and finite free remainders modulo distinguished polynomials. Prove the elementary-module theorem for finitely generated O[[T]]-modules with finite kernel and cokernel. The vertical factors are powers of a **uniformizer varpi**, not necessarily p. Record where pseudo-isomorphism is symmetric: do not declare it an equivalence relation for arbitrary non-torsion modules merely from the existence of one map.

Define characteristic ideals intrinsically from lengths at height-one primes and compare with the elementary-divisor formula. Prove multiplicativity in short exact sequences, invariance under pseudo-isomorphism, the value on a cyclic module, twisting, inversion, finite flat coefficient extension and change of topological generator. Define mu and lambda, using v_varpi for mu; specialize the class-number growth normalization to O=Z_p. Explain that finite modules have unit characteristic ideal but can have nonunit Fitting ideal.

For Delta finite abelian of order prime to p, construct integral character idempotents after adjoining character values and prove componentwise comparisons. For p-torsion in Delta, retain the group ring: no division by |Delta|. For O[[Z_p^d]] use height-one divisors; pseudo-null means codimension at least two and does not mean finite when d>1.

## L5. Determinants, specialization, and exactness

Construct determinant lines of bounded complexes of finite projective modules, compatible with quasi-isomorphism, exact triangles, duals and derived base change. Give the rational trivialization and the relation between its divisor and alternating characteristic divisors of torsion cohomology. For nonregular coefficient rings use perfect complexes and invertible modules, not an invented characteristic ideal on every module.

Prove exactness for the compact inverse systems actually used in arithmetic; prove the relevant Mittag–Leffler or compactness argument, not the false assertion that finite generation of each Z_p-module alone implies Mittag–Leffler. Include topological Nakayama, finite generation from finite residual quotient, specialization exact sequences with Tor terms, and finite-error control for coinvariants.

**Acceptance:** recover RJW Proposition 3.16, Theorems 3.21/3.25 and 13.1, Definitions 13.3/13.5, and Lemma 13.6; demonstrate both topologies on T^n; demonstrate the failure of unrestricted fraction evaluation; compute the characteristic ideal of O[[T]]/(varpi^a f(T)) and of a finite module.

## L6 — Gorenstein coefficient orders and exact duality

Own the ring-level algebra required by Burns–Sakamoto–Sano: a commutative O-order R (finite torsionfree over a complete DVR O, with its specified finite-dimensional semisimple fraction algebra), including semilocal products and the exact Gorenstein hypotheses used by BSS II. Construct the O-dual Hom_O(R,O) as an R-module and prove the equivalence between the selected Gorenstein-order condition and its invertibility/local rank-one freeness. For a nonzero element of O prove the appropriate Artinian quotient is self-injective; distinguish this from arbitrary quotients, which need not be Gorenstein. Develop the exact R-dual on finite modules over these zero-dimensional Gorenstein quotients, biduality, annihilator duality, length comparisons and compatibility with the coefficient reductions actually used in Euler/Kolyvagin systems.

For lattices and torsionfree modules over positive-dimensional orders distinguish Hom_R(−,R), O-linear duals and derived duals; prove the change-of-rings maps rather than assuming exactness of ordinary duality on every R-module. Supply Fitting ideals, projective presentations, exterior powers and exterior bidual base-change/denominator lemmas under their finiteness/reflexivity hypotheses, reusing the generic Fitting algebra of IntegralHeckeAndGaloisDeterminants. EulerSystemsAndKolyvaginSystems ES.6–ES.8 owns only system-specific contractions, Stark/Kolyvagin compatibility and arithmetic applications.

This is an explicit extension beyond open PR323 GorensteinHomologicalAlgebra (whose ring-level order theory is excluded) and beyond GlobalNumberFields' number-field-order carrier. Reuse their homological and arithmetic interfaces through proved comparisons, not by identifying p-adic coefficient orders with number-field orders. Tests include O, a finite product of DVRs, a nonmaximal Gorenstein order, and a nongorenstein coefficient ring where the self-injective-dual conclusion cannot be invoked. Normative arithmetic source: BSS II coefficient hypotheses and §§2–3, with Hypothesis 6.1 reflexivity retained in the later Λ-adic application.

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
| `L0` | Prove finite-clopen approximation and the bounded functional extension, keeping weak compactness of the integral dual separate from its operator-norm topology. |
| `L3` | Construct character evaluation only on the denominator set with nonzero character image. The augmentation example γ−1 is the mandatory obstruction to a full fraction-field evaluation. |
| `L5` | For a perfect complex write its determinant specialization triangle and Tor correction before evaluating a characteristic polynomial; finite modules disappear at height one but need not disappear under specialization. |

**Producer–consumer handoff.** Every Iwasawa/BSD consumer uses this one determinant/measure carrier. NoncommutativeAndEquivariantIwasawa extends it with Ore localization and K1 instead of imposing commutative characteristic ideals.

**Acceptance.** Test a finite Λ-module with unit characteristic ideal and nonunit Fitting ideal, and a ramified coefficient DVR using varpi rather than p.

**Source-readiness boundary.** Finish Weierstrass, determinant and completed-tensor source decompositions at the implementation pin.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
