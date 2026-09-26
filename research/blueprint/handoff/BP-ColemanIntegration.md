# BP-ColemanIntegration — local Abel repair checkpoint

Issue #698. Agent: Codex. Session: `codex-a71f92`. Date: 26 September 2026.
Claim 5850138616, confirmed by bot 5850139603; the whole issue was read again.
Input main: `5a1de1831c9b99f5f9d59a00c6a7e25048b55909`.
Publication base: `2b7a9eaff6e45705f025d2e393ac1c6b2ea9f2ba`.

## Status and preservation

**Partial checkpoint, with packet, reader and suggested Lean changes.** Six new
lemma nodes decompose an ordinary-series Abel identity and the branch-uniform
five-term relation when `0 < |y| < |x| < 1`. The global five-term gap is
narrowed, not removed. No layer is newly closed and every node remains unchecked.

Inventory: **118 nodes** (18 definitions, 9 constructions, 51 lemmas, 30 theorems,
10 comparisons); **229 API items**; **117 definition/construction tests plus 5
new lemma regressions**; **22 planets**, **92 baseline declarations**, **20
requests**, **5 gaps**. The validator's unitTests count is 117 because it counts
definition/construction tests, not the five new lemma test records.

All 112 inherited node IDs survive. Of these, 111 records are byte-for-byte equal
after JSON parsing; only `L2/five-term-relation` is revised. All inherited
definitions, APIs, tests, planets, 89 baseline records, 19 requests and
sourceIssues are unchanged. The suggested file's inherited declarations and
bodies are preserved; its global five-term comment now explicitly names the
remaining proof obligations.

Previous handoff-only work, including the normalization case split and test code,
is preserved at an immutable revision:
[prior handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/5a1de1831c9b99f5f9d59a00c6a7e25048b55909/research/blueprint/handoff/BP-ColemanIntegration.md).
Its original packet handoff is linked there. Historical numerical/source claims
in inherited nodes remain historical; this worker did not rerun their GP tests
or re-audit every L0–L3 source.

## New declaration chain

1. `L2/abel-disc-rational-pair`: with
   `v=u(1-x)/(1-xu)`, `w=x(1-u)/(1-xu)`, prove the complement identities,
   unit denominators, norm equalities and admissibility.
2. `L2/abel-composite-coefficients`: explicit convergent coefficient sequences
   for the two rational compositions. For fixed `|u|<1`, the v-composite
   coefficients are bounded by `C_u=sum_{m>=1}m^2|u|^m`; the w-composite's
   nth coefficient has norm at most `n^2`. The first series has a generally
   nonzero constant coefficient; no zero-constant formal substitution is used.
3. `L2/abel-series-disc-analyticity`: these estimates give one power series for
   the Abel difference on the entire open unit disc, including its centre.
4. `L2/abel-series-unit-bidisc`: differentiate that single series; the derivative
   cancels on the punctured disc, continuity extends the cancellation to zero,
   and characteristic-zero coefficient uniqueness plus value zero at the centre
   gives the identity. Cases x=0 and u=0 are included.
5. `L2/abel-branch-cancellation`: apply the branch homomorphism to the rational
   arguments; the polynomial log contribution is exactly minus the product in
   Abel's identity. Both branch-dependent symbols cancel before differentiating.
6. `L2/five-term-nested-discs`: set u=y/x, use reflection for the fifth argument
   and ordinary-series normalization for the remaining terms, then cancel the
   two contributions. This works for every branch, also at p=2.

The coefficient argument replaces the prior handoff's Tate-algebra convergence
sketch: no unverified complete normed Tate-algebra instance is required. It also
avoids using a generic local analytic composition theorem to claim a
radius-preserving whole-disc expansion. None of the six nodes depends on the
global five-term target.

No new definition was introduced. The six results are supporting lemmas; the
inherited L2 planet count is already six, so no additional planet is added.

## Inputs, baseline and sources actually checked

The reviewed AUDIT-23 Coleman entries in data/library-coverage.json were read
before planning. The whole issue, worker rules, both protocols, upstream guide,
campaign document, current handoff, node inventory, relevant L0/L2 statements
and signatures, stage links, ownership and overlapping link entries were read.
The near-area upstream style documents ClassFieldTheory and
LocalFieldsRamification had already been read in full during this worker session.
This is not a claim to have reread every line of the inherited large reader.

Pinned declarations checked directly include HasFPowerSeriesOnBall's fields,
HasFPowerSeriesOnBall.fderiv, HasFPowerSeriesAt.eq_formalMultilinearSeries,
FormalMultilinearSeries.ofScalars_norm,
FormalMultilinearSeries.le_radius_of_bound and
summable_norm_pow_mul_geometric_of_norm_lt_one. The last three are new baseline
records; in the last, take the normed ring to be the real numbers when forming
the polynomial/geometric majorants. The radius bound is applied for every r<1,
not at r=1 with an unbounded polynomial estimate.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`;
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Fresh public sources:

- Rob de Jeu, *Describing all multivariable functional equations of
  dilogarithms*, [arXiv:2007.11014v1](https://arxiv.org/abs/2007.11014v1),
  21 July 2020. Read Proposition 2.10 on printed p. 6, branch discussion on p. 7,
  and the corrected-sign paragraph before its proof on p. 14. Page 14 was
  visually checked. PDF SHA-256:
  `6d96d3d58d55e4c55506271e5cd0058b8ea8406995ca642febe868be87440b68`.
- Z. Wojtkowiak, *A note on functional equations of the p-adic polylogarithms*,
  [version-of-record PDF](https://www.numdam.org/item/10.24033/bsmf.2171.pdf),
  printed pp. 362–365 (Lemma 4.3, Example 3, Proposition 4.4 and proof).
  Printed p. 364 was visually checked. SHA-256:
  `3c29dd4f28f92bf84357ac423860d43b2aab91f840a3620333fabe84fd22e97e`.

These references fix the normalization and target. The local coefficient proof
is explicitly a worker-derived elaboration, not a proof claimed to be printed
in either source. Coleman 1982 itself was not obtained. No new source erratum
is asserted, and the inherited sourceIssues are untouched.

## Checks actually run

- Original suggested file: elaborated at both pins, zero errors and 270 expected
  warnings for unfinished proofs.
- Modified complete suggested file: **elaborated with zero errors and 282
  expected warnings for unfinished proofs, and no other warnings**. All new
  suggested proofs are placeholders, as required by the protocol.
- Compile harness checked 8,482 Mathlib source files against the pinned source
  checkout and built the one reached Tau Ceti module
  `TauCeti.Analysis.Normed.Algebra.LogOneAdd.Basic` from pinned source.
- Separate scratch Lean file proved six algebraic checks, with no placeholders,
  errors or warnings: both complement identities, both rational logarithmic
  derivative identities, cancellation of F', and the branch-log polynomial.
  This checks those calculations only, not the new analytic theorem chain.
- Exact rational sparse bivariate series modulo total degrees 8, 12 and 18:
  every coefficient of the Abel residual vanished. Reversing the product sign
  was rejected at XU with residual 2.
- **5,776 exact coefficient/norm checks**: p=2,3,5,7;
  u=0,p,p^2,p/(p+1); n=0,...,18 and m=1,...,18. Checked the negative-binomial
  coefficient formula against independent repeated geometric convolution,
  its p-adic norm bound and the finite w-coefficient bound.
- **64 exact rational substitution cases**, including zero x/u, using the same
  four p values and four possible values for each coordinate. Checked complement
  identities, norm equalities, nested arguments and boundary exclusions.
- Indexed blueprint validation: zero errors and warnings.
- Four-file intake validation: rerun immediately before publication.
- Preservation audit: all inherited records listed above retained, and no
  local dependency cycle introduced.
- Before publication, the four deliverable blobs, four binding instruction
  blobs, Polylogarithms supplier packet and reviewed audit all matched the
  publication base. Only the four authorized deliverables enter the PR.

The exact bivariate test algorithm is reproduced in the immutable previous
handoff linked above. Its rerun and the coefficient tests use exact fractions,
not finite-precision p-adic approximations. Finite tests support but do not prove
the mathematical statements.

## Remaining work / where to resume

**Global five-term gap:**

1. Polylogarithms:P.1 currently states the cross-ratio identities over the complex
   numbers. A new request asks that owner for the field-general complement,
   inverse, permutation, fractional-linear and cyclic identities, including
   infinity and all denominator conditions. Its complex Bloch–Wigner theorem
   remains unchanged and is not used over C_p.
2. Split and prove the C_p five-point normalization and sign-correct alternating
   omission-sum covariance. The prior handoff gives explicit maps and a proposed
   exhaustive case split; they are not yet declaration nodes here.
3. Split and check the four-distinct-reductions Coleman argument on
   P^1 minus {0,1,infinity,y} for arbitrary special unit y. The explicit L1 model
   treats roots-of-unity punctures, not an arbitrary such y. Verify the model,
   pullback hypotheses, finite-extension construction and extension by density
   to arbitrary C_p points, staying in the admissible open locus.
4. Assemble these with the new nested-disc theorem before removing the gap or
   treating the global pre-Bloch consequences as established.

**Unchanged inherited remainder:** general-curve algebraic de Rham comparison;
lift independence/pullback where the differential module is not globally free;
Besser–de Jeu Theorem 1.10(2)'s regulator proof decomposition; owner for complex
Artin L-functions with coefficients; all nineteen inherited supplier requests.
The semistable-scope proposal is revised only to remove the claimed need for it
in this local repair. Broader semistable functional-equation theory remains a
separate scope decision.

Keep status partial. Do not replace the residual global obligations by naive
local-analytic constancy, the complex five-term theorem, or the assumption that
every C_p element belongs to a finite extension.
