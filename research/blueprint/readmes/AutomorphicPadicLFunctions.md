# Dirichlet p-adic L-functions, special values, and Eisenstein measures, Part II: Ray-class and automorphic interpolation

**Status: partial blueprint.** This document extends `DirichletPadicLFunctions` and follows accepted restructuring RS-14. It does not claim to construct a p-adic L-function. Its present mathematical contribution is the algebraic part of weighted evaluation and simultaneous conductor normalization, with the arithmetic and analytic instantiation boundaries made explicit.

The packet has nineteen declaration-sized nodes. The four definitions/constructions have twelve separately named API lemmas and twelve discriminating tests. All nineteen declarations and all twelve tests have suggested Lean signatures, but the file has **not been compiled**. No layer is closed.

## Ownership and imports

Use the finite ray-class carriers and transition maps already in GlobalNumberFields, together with the canonical Hecke/infinity-type and class-field-theory interfaces recorded in RS-14. The pinned declarations `TauCeti.GlobalNumberFields.classMap` and `classMap_comp_classMap` have been inspected. They do not by themselves construct the topological infinite ray-class group.

`PadicMeasuresIwasawaAlgebras:L0a` owns generic scalar character spaces and universal characters, and `:L1` owns the generic measure/Iwasawa-algebra interface. `LocallyAnalyticDistributions:L0` supplies the analytic function/dual topology, `:L3` the Mellin interface, and `:L4` generic operator theory. This roadmap owns their arithmetic ray-class specialization and the proof that its actual coefficient actions and Hecke operators satisfy the required hypotheses. It does not send those operator estimates back to the generic Fredholm supplier as if they were already proved.

The remaining constructions retain the approved PEL, automorphic-bundle, compactification and Igusa ownership boundaries. A generic special-fibre Igusa tower is not a substitute for the mixed-characteristic integral geometry in the unitary construction. The KU Hilbert-Eisenstein item is a readiness checkpoint, not an additional mathematical stage in this issue's eight-stage scope.

## Baseline and conventions

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The relevant records in accepted `AUDIT-23.result.json` and its review were read in place of the oversized aggregate coverage file. Six specific declarations were freshly checked at the pins: the two finite ray-class transition declarations above, `Module.Dual`, `LinearMap.dualMap`, `Subgroup.topologicalClosure`, and `Set.EqOn.closure`.

For the algebraic core, G is a commutative group, L is a field, and w:G to L-units is a multiplicative weight. A linear functional on the full module of functions G to L is an **algebraic dual element**. It is not a locally analytic distribution. The prototype uses that existing carrier only to express and check the algebraic calculation without inventing missing analytic structures.

For arithmetic instantiation, retain the number field F, rational prime p, sufficiently large p-adic coefficient field L, weight, eigenclass, periods, refinements and uniformizers. The p-power conductor must be divisible by every prime above p. Global units are quotiented through their actual topological closure; no prescribed quotient rank or Leopoldt assumption is introduced.

## L0. Arithmetic ray-class quotients

**Coverage: partial.** The one new helper here is `unit-invariance-closure`. If a continuous function phi on a topological group is invariant under a subgroup E, then it is invariant under the closure of E. For each fixed z, compare the continuous maps e to phi(ez) and e to phi(z), and apply the existing equality-on-closure theorem. The Hausdorff codomain is essential to that argument.

This does not prove locally analytic descent. Still required are the topological inverse limit of the existing finite ray-class groups, the local-unit quotient comparison, its torsion, its actual global-unit closure, and the locally analytic topology and norm comparison on the quotient. Generic character spaces and Mellin transforms are imported from the named suppliers, not rebuilt here.

An interpolation characterization must state and prove its determining-family and growth hypotheses. Equality of a constructed distribution under changes of representatives is a different assertion from uniqueness of a distribution with specified interpolation values.

## L1. Cohomological input

**Coverage: not_read for the target source proofs.** Construct the arithmetic locally symmetric spaces, coefficient local systems, compactly supported cohomology, cycles of degree r1+r2, orientations, trace and integration. Read and decompose the period/rationality and critical-value input, including BSW Theorem 5.7 with signs and normalization factors. Compare the F=Q construction with the existing modular-symbol direction.

None of this is supplied by giving an abstract linear map a suggestive name. The `T` and `nu` maps in the next section are input maps to an algebraic lemma; the actual pullback and cycle evaluation must be constructed here and in L2.

## L2. Weighted evaluation and conductor normalization

### Weighted inversion

Define the linear endomorphism of the full function module by

\[
 W_w f(z)=w(z)f(z^{-1}).
\]

The multiplication by w and inversion of z are both necessary. Its API consists of `weightedTwist_apply`, `weightedTwist_involutive`, and `weightedTwist_translate`; these are separate packet nodes. The first is the evaluation formula. For the second, the scalar factors w(z) and w(z inverse) multiply to one. For the third, put

\[
 D_u f(z)=w(u)f(u^{-1}z).
\]

A direct calculation gives

\[
 W_w(f\circ(z\mapsto uz))=D_u(W_w f).
\]

The inverse of a product and commutativity of G are used in the argument transformation. The three definition tests are `twist_trivial_weight`, where W is ordinary inversion; `twist_character_degree`, where G is the nonzero rationals, w(z)=z squared and f(z)=z cubed, giving Wf(2)=1/2; and `twist_constant_one`, giving W(1)=w. Dropping the weight or dropping the inverse fails these tests.

The separate node `twist-covariance` proves that E-invariance of f becomes the weight-covariance relation Wf(ez)=w(e)Wf(z). Use the E-invariance of f at e inverse and z inverse. On the arithmetic domain, this is why the twisted test function has the required coefficient transformation law.

For actual locally analytic functions, prove that inversion and the weight character preserve the relevant chart spaces, prove LF continuity and the required Banach-radius bounds, and justify extension by zero outside a clopen unit domain. These facts are **not** inferred from the full-function construction above.

### Charts, dual action and cancellation

Fix the forward chart c_a(z)=a z on the appropriate ray-class fibre. Its pullback is psi_a(z)=phi(a z). If a prime equals a times gamma times u times r, with gamma and r trivial in the ray quotient, then

\[
 \psi_{a'}(z)=\psi_a(uz).
\]

Suppose the corresponding evaluation functional transforms by

\[
 \nu'(h)=\nu(D_{u^{-1}}h).
\]

These are statements about two separately constructed input maps. The pairing lemma then gives

\[
 \nu'(W_w\psi_{a'})
 =\nu(D_{u^{-1}}D_uW_w\psi_a)
 =\nu(W_w\psi_a).
\]

No interpolation values or density theorem occur. The formula is an instance of the existing transpose/precomposition operation on linear duals, with the directions written explicitly.

The source register below records a discrepancy between this cancellation and the inverse chart displayed in the checked preprint. A correction must be propagated consistently through the later conductor calculations; changing one inverse in isolation is not sufficient.

### Finite component evaluation

For a finite component type Y, linear pullbacks T_y from an L-module V to functions on G, and linear functionals nu_y on those functions, define

\[
 \operatorname{Eval}(T,\nu)(\phi)
 =\sum_{y\in Y}\nu_y\bigl(W_w(T_y\phi)\bigr).
\]

This is a finite sum of existing linear-map compositions. Its API consists of `finiteEvaluation_apply`, `finiteEvaluation_reindex`, and `finiteEvaluation_representative`. Reindexing transports both arrays along the same finite equivalence. Representative independence applies the pairing lemma component by component, under the explicit pullback and contragredient transformation laws.

Tests: `finite_empty` gives the zero functional; `finite_single` gives the ordinary composition of the three existing linear maps; `finite_two_components` uses the trivial group over Q with two identity pullbacks and functional coefficients 2 and -3, yielding -7 on input 7. The last test detects omission of a component or a sign.

The full arithmetic assertion requires the local-system pullbacks, unit descent, cycle evaluation and their change-of-representative laws. These have not been replaced by a structure that assumes its desired invariance theorem.

### Simultaneous eigenvalue products

Let P be the finite set of primes above p, let alpha(q) be nonzero eigenvalues represented as units of L, and let n:P to natural numbers be an exponent vector. Define

\[
 \alpha_n=\prod_{q\in P}\alpha(q)^{n(q)}.
\]

The API is `refinementEigenvalue_zero`, `refinementEigenvalue_add`, and `refinementEigenvalue_step`: the zero vector gives one, adding vectors multiplies the products, and increasing one coordinate q multiplies by alpha(q). These are separate nodes. Tests are `eigenvalue_empty`, `eigenvalue_two_primes` with eigenvalues 2 and 3 and exponents 2 and 1 giving 12, and `eigenvalue_zero_rejected`, which prohibits coercing zero to a unit.

This product is algebraically defined for zero exponents, but the arithmetic norm relation below is available only on the specified positive levels. The algebraic zero-vector identity does not remove the source's all-primes-divide condition.

### Normalization and the common-level proof

For a raw family mu(n) in an L-module, define

\[
 N_\mu(n)=\alpha_n^{-1}\mu(n).
\]

Its API is `normalisedEvaluation_apply`, `normalisedEvaluation_step`, and `normalisedEvaluation_commonLevel`. The one-prime lemma takes the actual relation

\[
 \mu(n+\delta_q)=\alpha(q)\mu(n)
\]

as input, substitutes the corresponding product identity, and cancels the nonzero eigenvalue. The construction itself assumes no such relation.

For two componentwise positive levels n and m, put h(q)=max(n(q),m(q)). To compare n with h, induct on the finite sum of the coordinate differences. If it is positive, choose a deficient coordinate, increment it and apply the one-prime lemma; positivity is preserved and the sum decreases. Repeat from m to h. This proves equality even when n and m are incomparable. An empty place type has only one exponent vector.

Tests: `normalise_one_prime` uses mu(n)=7 times 2 to the n and gives 7; `normalise_two_incomparable` uses eigenvalues 2 and 3 and compares (1,2) with (2,1), obtaining 5 in both cases. `normalise_excluded_zero_level` sets mu(0)=3 and mu(n)=2 to the n for n positive: all positive-level relations hold, but the normalized values at 0 and 1 are 3 and 1. This detects an incorrect extension to conductors missing a p-prime.

Exactly 378 rational weighted-inversion/rechart cases and 625 two-prime level comparisons were executed successfully. They are regression calculations, not Lean elaboration or a test of the arithmetic construction.

### Remaining BSW obligations

Prove the actual trace/restriction diagram and one-prime norm relation before instantiating the normalization theorem. Construct the coefficient actions, strict radius-improving operators, partially overconvergent modules, theta/BGG exactness and cohomological finite-slope control. Retain the approved strict bound

\[
 h_{\mathfrak q}<
 \frac{\min_{\sigma\mid\mathfrak q}k_\sigma+v_{\mathfrak q}(\lambda)+1}
 {e_{\mathfrak q}},
 \qquad v_p(p)=1.
\]

Read and decompose growth and the complete interpolation calculation, with periods, additive characters, Haar measures, Gauss sums, Euler factors, powers and uniformizers distinguished. Independence of conductor with those data fixed does not imply independence of periods or refinements. BSW's Section 12 does not supply the general-number-field uniqueness theorem needed to identify arbitrary distributions from arithmetic interpolation values.

## L3, L3h, L4, L4e and L5: retained targets, not decomposed proofs

All five layers remain `not_read` for their target source proofs. The constraints below are retained from the approved campaign and RS-14, not presented as newly checked source theorems.

**L3:** Deligne-Ribet and ordinary Katz retain their actual integral Eisenstein congruences, CM type, differential operators, period data and canonical imported geometry. No nonordinary Katz construction is asserted.

**L3h:** The Hsieh direction retains the toric distribution and its square interpolation. CM-type ordinarity is not ordinarity of the automorphic representation. The extra local and residual hypotheses for the mu theorem and the distinction between local-degree-one finite-exception results and higher-degree density results must remain explicit.

**L4:** EHLS retains its named Gorenstein/freeness, multiplicity and minimality hypotheses. The output coefficient algebra is an Iwasawa-Hecke/period algebra, not silently a scalar-valued function. Integral mixed-characteristic geometry and the local doubling computations must be constructed.

**L4e:** Eischen-Wan retains the specified definite GU(r,0), odd split-prime and auxiliary-character/refinement setting. The cited constant-term divisibility results retain the rank r=2 restriction.

**L5:** Comparisons require matching normalizations, not just the same underlying complex L-value. Import the Selmer realizations; the analytic Coates-Perrin-Riou/Panchishkin existence target is a proposition with verified cases, not a constructor for arbitrary motives. It is separate from the arithmetic main-conjecture statement owned elsewhere.

## Source issue register — independent review required

The source read is Barrera Salazar–Williams, *P-adic L-functions for GL2*, arXiv:1602.06244v3 (29 December 2017), using manuscript page numbers. Printed page 31 was successfully rendered and visually checked. Other requested renders failed, and the published journal text was not collated. The findings below concern the formulas/statements as checked in this preprint; **no novelty claim or failure of its main theorem is asserted**.

**AutomorphicPadicLFunctions/E1 — mixed inverse conventions, pp.31–32.** The displayed pullback on p.31 uses phi(a_y inverse times z), and Proposition 9.3 consequently gives the opposite translation to the one needed by the displayed contragredient evaluation action and weighted inversion. For u=4 on the principal units of Q_3, w(z)=z squared, psi(z)=z and evaluation at 1, that combination gives 1/16 in place of 1. Forward charts give 1. The p.31 formulas were visually checked; the p.32 proof was read as parsed text. The correction proposed here uses forward charts consistently and requires recollating the subsequent trace diagram.

**AutomorphicPadicLFunctions/E2 — compact action hypothesis, pp.21–22.** As parsed, Lemma 6.7 includes every element of the stated semigroup, hence the identity. In weight zero over Q_p, the coefficient functional extracting the m-th coefficient at zero has dual norm 1 at analytic radius zero and norm |p| to the power -m at the next analytic level. A continuous factorization of the identity from the first dual level to the second would bound these latter norms uniformly, which is impossible. The intended contracting operators require an explicit radius-gain hypothesis. Collate the printed lemma, Urban's cited lemma and the journal version before treating this as a confirmed published error.

**AutomorphicPadicLFunctions/E3 — lattice hypothesis, p.24.** The parsed norm condition in Lemma 8.1(iii) is nonnegativity and allows the zero submodule. Take M=L and U=p inverse times identity; the zero submodule is stable but the slope -1 part is nonzero. A bounded absorbing O_L-lattice stable under each specified operator supplies the missing argument: rescale a nonzero eigenvector into the lattice and contradict boundedness using its negative-slope orbit. Stability should concern the operators, not arbitrary L scalar multiples. The rendering and journal comparison remain to be completed.

The packet supplies the printed excerpts, exact local arguments, proposed corrections, search history and limited reach of each finding. No independent review verdict has been entered.

## Handoff boundary

Finish source collation first, then the genuine analytic and cohomological instantiation and norm relation. Continue the eight target source decompositions without relaxing the approved hypotheses. Audit the remaining finite-sum/product and coordinate-induction helper declarations at the pins and compile the suggested file. All implementation statuses remain unchecked, and neither a schema pass nor the rational regressions would certify these mathematical obligations.
