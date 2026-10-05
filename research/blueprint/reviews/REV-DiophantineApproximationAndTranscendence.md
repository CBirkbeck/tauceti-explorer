# REV-DiophantineApproximationAndTranscendence

**Verdict: needs_changes.** Codex session `codex-J6LwjP`, 2026-10-05; issue #534. The author provenance names `codex-7e92bd`; this session did not write the input. The bot confirmed claim comment 5987345814 with comment 5987347245. The review started from commit `aad7e4ea3aa8a14ca5296906e87771def671bf29`.

The two remaining review blockers are specific: the primary Matveev Corollary 2.3 page was not independently accessible, and the Schneider–Lang auxiliary-function prototype omits part of its packet contract. They are the two `unverifiable` entries. The verdict does not reject the five honestly partial stages for their outstanding work.

The reviewed packet contains 397 nodes: 42 definitions, 5 constructions, 213 lemmas, 132 theorems and 5 applications. Its checker counts 346 definition/construction API items, 203 unit tests, 36 planets, 422 baseline declarations, 30 gaps and 2 requests. All 397 node contracts and the complete suggested file were read. The per-node review records 299 verified, 91 corrected, 5 added, 2 unverifiable. There are 90 independently adjudicated source findings: 85 confirmed and 5 rejected, including 14 added findings E8–E21.

“Verified” means the planning contract and its recorded dependency/proof scope were checked; a stated theorem with a precisely recorded proof gap is not being declared proved. In particular, no admitted Lean declaration is formalized mathematics. Downloaded or extracted source pages are not counted as read. Wider inherited `readSections` describe the input authors’ work; this report’s separate physical-page ledger describes this reviewer’s reading.

## Mathematical corrections

The review changes 92 inherited node objects and adds 5 supporting nodes. The table below records each changed node’s fields and mathematical reason; the complete before/after changes are in the pull request. Source-issue review objects, coverage follow-ups, summary/check receipts and reviewer provenance were also updated.

| Node suffix | Fields changed | Finding/correction |
| --- | --- | --- |
| `primitive-minimal-polynomial` | acceptance, api, tests | Added algebraic-integer and denominator-nonzero boundary requirements to the primitive-minimal-polynomial prototype; zero cannot be used as the claimed divisor of one. |
| `algebraic-approximation-exponent` | api, hypotheses, proofSteps, tests | Adding or removing the singleton ξ cannot alter infinitude of the approximation set. Replaced the false rationale and added singleton-removal and height-convention tests. |
| `infinite-places-over` | sources | Wu's relative height was divided by the field degree twice; keep the native absolute normalization and the independently checked source correction E8. |
| `mul-height-algebra-map` | sources | Same Wu normalization reconciliation; no double degree division. |
| `abs-mul-height-eq-rpow` | sources | Same Wu normalization reconciliation in the comparison API. |
| `height-comparisons` | sources | Reconciled Wu's convention with Mathlib relative and absolute heights. |
| `finite-algebraic-integers-house-le` | acceptance | Use the actual house bound for all conjugates. |
| `dirichlet-linear-forms-infinitely-many` | hypotheses | Retain the source’s nondegeneracy condition for shrinking non-exact approximations; if an exact integral image exists instead, its positive multiples also give bare infinitude. |
| `dirichlet-linear-form-infinitely-many` | hypotheses, sources | The simultaneous-approximation input needs independence of 1 together with the α_i. |
| `convergent-error-lower-bound` | sources | Corrected the continued-fraction irrationality lower bound to 1/(2q_nq_(n+1)). |
| `thue-auxiliary-polynomials` | proofSteps, sources, statement | Clear denominators by b^(m+1), not b^m. Derived a safe explicit ℓ¹ constant with base 48 instead of importing the unproved base 6 transition; the existential Thue theorem is unchanged. |
| `thue-nonvanishing-of-a-divided-derivative` | acceptance | Record the inclusive k≤d(2εr+1) derivative boundary. |
| `thue-remainder-bounds` | acceptance, hypotheses, statement | Require r≥1 before absorbing 1+∣α∣ into its r-th power. |
| `weighted-index-of-polynomial` | hypotheses, tests | Weighted index ∞ characterizes the zero polynomial; retain strict-below vanishing thresholds. |
| `weighted-index-add` | acceptance | Corrected the indexing of sums in the ultrametric/vanishing comparison. |
| `weighted-index-of-derivative` | proofSteps | Composition and derivative-index estimates must distinguish a nonzero higher jet from the zero polynomial. |
| `central-binomial-sqrt-bound` | proofSteps | Corrected the central-binomial numerical bound. |
| `gelfond-lemma-one-variable` | acceptance | Use the checked log2 constant in the Gelfond estimate. |
| `roth-lemma-one-variable` | proofSteps | Retain the zero-degree boundary in the one-variable index contract. |
| `wronskian-of-one-variable-polynomials` | sources, statement | The divided Wronskian is defined over any commutative ring. The multiplication-by-factorials comparison is valid there; inversion of factorials needs a rational algebra. |
| `wronskian-criterion-one-variable` | proofSteps | Differentiating a rational quotient to zero needs characteristic zero and a nonzero denominator. |
| `truncated-linear-sum-lower-bound` | proofSteps | Handle the k=0 truncated-sum boundary using the actual finite sum. |
| `roth-auxiliary-polynomial` | sources | The auxiliary-polynomial equation count and height bound use strict jet thresholds and the checked Siegel input. |
| `rapidly-increasing-good-approximations` | sources | The rational increasing-height argument uses rational Northcott directly. |
| `roth-theorem` | sources | To absorb a fixed approximation constant, choose κ′ strictly between 2 and κ and take height greater than 1; keep strict and weak source inequalities distinct. |
| `lacunary-series-transcendental` | acceptance | Removed the unsupported equality μ=3; the approximation gives the verified lower bound μ≥3. |
| `binary-form-lower-bound` | proofSteps | Separated the possible Y factor when dehomogenizing a degree-d binary form; its affine degree can be d−1. |
| `absolute-value-extends-to-algebraic-closure` | prerequisites, proofSteps | The general completed-absolute-value classification is not supplied by a theorem about an already complex normed algebra. Removed that citation and recorded the missing construction. |
| `p-adic-subspace-theorem` | proofSteps | Use min(ε,1) to meet the stated parametric theorem range. |
| `product-inequality-reduces-to-systems` | acceptance, prerequisites, proofSteps | Keep the exponent 1+d in the norm estimate and the finite-simplex discretization input; the suggested B must be at least1. |
| `vojta-effective-exceptional-subspaces` | proofSteps | Use δ=min(δ,1) when the source theorem bounds its parameter above by1. |
| `two-form-strict-inequality-finite` | acceptance | Record positivity of C1 and δ and the exact factor4 from the source. |
| `approximation-by-algebraic-numbers-of-bounded-degree` | acceptance | Removed an unsupported sharp Wirsing strengthening. |
| `squarefree-binary-form-linear-factors` | proofSteps | The one-variable homogeneous case F=a0Y requires its own boundary check. |
| `nondegenerate-solution` | acceptance, api | The maximal-complement API records maximality rather than an arbitrary choice of complement. |
| `homogeneous-unit-equation-subspace-cover` | acceptance | In the two-dimensional step the required object is a line in H. |
| `uniform-bound-zeros-simple-recurrence` | prerequisites | Added the actual pinned Vandermonde nonvanishing theorem and kept the rank/coset and arithmetic-progression counting decomposition as a separate gap. |
| `successive-infima-of-twisted-height` | api, tests | Corrected the interval i≤j≤n and the Q>1 test boundary. |
| `height-of-linear-subspace` | acceptance, statement | Corrected ambient dimension in the rational subspace-height/covolume comparison. |
| `weight-and-exceptional-subspace` | acceptance, api | Require finite weight support and placewise independent forms in the suggested exceptional-subspace constructor. The choice is conditional and defaults to bottom when those data fail. |
| `twisted-height-filtration` | hypotheses | For V={0}, use the one-term zero filtration, with no strict inclusions or slopes. |
| `twisted-height-gap-principle` | acceptance, proofSteps | Do not assert a computable exceptional threshold from a proof that supplies only existence; record the zero-weight/A>1 boundary. |
| `davenport-lemma-for-twisted-heights` | proofSteps | Corrected Davenport's explicit factor to 2^(n²)(1+ε)^(n+1). |
| `auxiliary-polynomial-for-twisted-heights` | statement | The C_K factor belongs outside the power in the source lower bound. |
| `interval-result-semistable-case` | acceptance | Coordinate projections do not automatically preserve the required stability property; added a discriminating example. |
| `limit-of-successive-infima` | acceptance | The relevant c0 is an infimum over the proper input sets; the coordinate example has value2. |
| `height-bound-for-filtration-subspaces` | proofSteps | Corrected consecutive slope gaps in the canonical filtration and retained E16's undefined final index as a source finding. |
| `lindemann-auxiliary-value` | acceptance, prerequisites | Link the auxiliary-polynomial prerequisite explicitly and require positive p. |
| `lindemann-auxiliary-value-small` | proofSteps | Take C≥1 to handle empty sets in the exponential estimate. |
| `lindemann-weierstrass-in-bakers-form` | acceptance | The tuple α=(1,0), β=(1,−e) is a nontrivial forbidden relation; corrected the acceptance example. |
| `transcendence-of-nonzero-algebraic-logarithm` | sources, statement | The arbitrary-logarithm form follows by contraposition from the exponential theorem. The historical PR only states the principal-logarithm special case; its source match now says so. Logarithms such as 2πi of 1 are allowed. |
| `gelfond-arithmetic-lower-bound` | proofSteps | Account for the √r loss in the norm-to-sum estimate; absorb it into an exponential constant. |
| `gelfond-analytic-upper-bound` | proofSteps | Account for the r factor in the analytic estimate, absorbing it into the exponential constant. |
| `several-variable-division-by-one-variable-polynomial` | acceptance, prerequisites, proofSteps | Retain p=0 and the exact geometric sum (3^p−1)/2. |
| `schwarz-lemma-cartesian-product` | proofSteps | The zero-count parameter needs p≥1 and positive dimension; the missing cutoffs cannot be silently treated as monotonicity. |
| `thue-siegel-lemma-complex-coefficients` | hypotheses, statement | Require ν≥1 and U,V>0 in the extrapolation signature. |
| `schneider-lang-liouville-lower-bound` | acceptance, hypotheses, statement | T0 and T1 start at2 in the source's exponential-monomial setting. |
| `schneider-lang-auxiliary-function-vanishing` | hypotheses, statement | Source statement checked, but the suggested auxiliary-function telescope omits the packet's polydisc output, large-L cutoff and parameter dependencies. Gap now states that mismatch. |
| `schneider-lang-extrapolation-upper-bound` | hypotheses, statement | Require positive grid orders and the nonzero first surviving derivative; reconcile the Step3 output before using this Step5 telescope. |
| `schneider-lang-inhomogeneous-corollary` | hypotheses, statement | The monomial-grid dimension must be positive. |
| `baker-linear-independence-of-logarithms` | acceptance | An integer relation between arbitrary complex logarithms need not have sum0; it gives a product1 modulo 2πi. No algorithm for equality of arbitrary complex data is asserted. |
| `baker-transcendence-of-linear-form` | hypotheses, statement | The zero-count statement needs positive dimension. |
| `baker-lower-bounds-for-linear-forms-in-logarithms` | proofSteps | Use log max(1,∣n_ij∣) for coefficients that may be zero. |
| `baker-lower-bound-for-multiplicative-form` | acceptance | The factor 2^b−1 is bounded below by1/2 in the specified range. |
| `matveev-multiplicative-form-number-field` | proofSteps | The real-field product-bound proof must first handle signs and absolute values; principal logarithms of negative factors need not have b0=0. E17 records the source proof issue without rejecting the quantitative conclusion. |
| `p-adic-lower-bound-one-power` | acceptance, proofSteps | At p=2 an odd integer has real norm1/2, not1; the uniform lower bound uses min with1/2. |
| `rational-s-unit-group` | api, tests | Prime support is essential for numerator/denominator and multiplicative-height APIs. Composite support{2,4} counts the same prime twice. |
| `bounded-divisor-representatives-finite` | hypotheses | For α=0 the divisor set is the singleton{0}, not infinite. |
| `divisors-up-to-units` | acceptance | Norm versus house cutoff example: in ℚ(i), Norm(5)=25, so the cutoff is5, not√5. |
| `pillai-equation-effective-finiteness` | proofSteps, statement | Absorb the product-form prefactor by increasing the linear-form constant by1. |
| `log-height-of-algebraic-integer-bound` | sources | The primary source's height is multiplicative; take its logarithm before inserting it into logarithmic estimates. |
| `baker-superelliptic-theorem` | sources, statement | Corrected 212 to 2^12 in the superelliptic bound after reading the rendered primary page. The ideal-power proof route remains an explicit gap. |
| `one-term-p-adic-lower-bound` | prerequisites, proofSteps | Import the existing lifting interface rather than plan a duplicate implementation. |
| `s-unit-equation-effective-finiteness` | statement | The rational height box has at most 2(2⌊B⌋+1)^∣S∣ representatives; handle empty support separately. |
| `exponent-height-bound-for-finitely-generated-groups` | proofSteps | The lattice-discreteness argument needs the reverse height comparison h≤(s/2)‖·‖, not the already stated upper bound on the norm. |
| `d-finite-power-series` | tests | Allow order0 in D-finiteness; the zero series is a legitimate boundary. |
| `minimal-differential-equation` | acceptance, api | Both equations in the minimal-order uniqueness signature must be over the same coefficient field and have nonzero leading coefficient. |
| `e-function` | acceptance | Corrected Bessel/hypergeometric coefficient examples and the parameter exclusions. |
| `mahler-function` | tests | A polynomial first-order system requires T≠0 and algebraic T,M coefficients; the zero system cannot supply a spurious finite-dimensional hypothesis. |
| `schanuel-conjecture` | planet | Schanuel's conjecture stays an explicit assumption; removed it from the capped list of theorem/definition planets. |
| `holomorphic-solutions-of-linear-systems` | acceptance, hypotheses, library, proofSteps, sources, statement | Cauchy uniqueness is EqOn on a positive-radius disc. Total functions can vary outside the disc, so unrestricted global uniqueness and dimension are false. |
| `fibre-dimension-over-the-affine-line` | prerequisites, proofSteps | Removed the Krull-dimension quotient bound with its extra Jacobson premise; it does not prove the required affine-line fibre comparison. Native integral/base-change inputs remain. |
| `chudnovsky-galochkin-condition` | acceptance, hypotheses, library, prerequisites, proofSteps, sources, statement | Use P_m=T^m B_m, where B_m already represents y^(m)/m!. Removed the extra factorial and added the scaled-iterate and Galochkin definitions and tests. |
| `laplace-transform-of-e-function` | acceptance, proofSteps, statement | Laplace integration by parts has a boundary polynomial −Σ_(j<k)x^(k−1−j)u^(j)(0). The exponential/k=1 example disproves the inherited boundary-free identity. |
| `andre-theorem-on-e-operators` | proofSteps | The corrected Laplace identity leaves a missing operator-transfer/cancellation lemma; the quoted André conclusion is kept with explicit proof limitation. |
| `andre-vanishing-corollary` | hypotheses | The apparent-singularity argument assumes a nonzero function and positive minimal order before choosing the leading coefficient. |
| `beukers-vanishing-theorem` | hypotheses | Same nonzero/positive-minimal-order boundary for the vanishing consequence. |
| `relation-module-basis-with-full-rank-specialisations` | hypotheses, statement | The cited linear-factor argument is over an algebraically closed coefficient field; an arbitrary subfield is insufficient for that proof. |
| `siegel-shidlovskii-theorem` | sources | Corrected André's locator to §1.7, Corollary1.7.1; its algebraic-independence comparison is conditional on equality of transcendence degrees. |
| `lindemann-weierstrass-via-e-functions` | acceptance | Include β=0 and1 in the elementary algebraic-exponential boundary cases. |
| `galochkin-chudnovsky-linear-independence` | acceptance | For (1,−log(1−z)) the two-component closeness condition is b>C∣a∣³, not a²; the suggested system now also retains T≠0 and algebraic coefficients. |
| `ax-integer-relation-lemma` | hypotheses, proofSteps | The differential-form kernel is a proper group, not an asserted algebraic subgroup. Kirby constructs a separate algebraic subgroup inside it; arbitrary constants still require extension/descent. |

The Mahler prototype also gained q≥2 in its predicate, algebraic coefficients for the solution tuple and rational-function matrix in the system equivalence, and algebraic matrix coefficients in the Nishioka/lifting telescopes. The regular-point iteration API now assumes q≥1. A transcendental constant in an identity system is a new discriminating non-example. The exceptional-subspace doc-comment placement was repaired after an elaboration failure. These changes affect the suggested file directly; the source-faithful Mahler packet statements already required the relevant field.

## Added nodes and closure

- `DiophantineApproximationAndTranscendence:DT.5/scaled-divided-system-iterates`: Scaled divided derivative matrices. `addedBy` names this review.
- `DiophantineApproximationAndTranscendence:DT.5/galochkin-condition`: Galochkin’s condition. `addedBy` names this review.
- `DiophantineApproximationAndTranscendence:DT.5/linear-system-solution-space-evaluation`: Evaluation identifies a holomorphic linear-system solution space. `addedBy` names this review.
- `DiophantineApproximationAndTranscendence:DT.5/scalar-equation-cauchy-initial-jets`: Cauchy initial jets for a scalar linear equation. `addedBy` names this review.
- `DiophantineApproximationAndTranscendence:DT.2/finite-simplex-discretisation`: Finite simplex discretisation for simultaneous inequalities. `addedBy` names this review.

The scaled-divided iterates use `(TP′+PM−mT′P)/(m+1)` and a single factorial normalization. The Galochkin denominator ranges over every m≤s with a positive integer multiplier. The geometric-series, exponential, zero-system and zero-denominator tests distinguish these conventions. The positive-radius Cauchy result now states uniqueness on the disc. Its two separated dimension consequences retain an explicit missing solution-carrier/companion-signature gap. The simplex-grid lemma makes the finite weight choice used by the Subspace-Theorem reduction an explicit dependency.

DT.1 retains closed planning coverage after a fresh reading of the ordinary Roth chain and the corrected Thue supporting argument. It does not consume the sharp Product-Theorem/Roth boundary result that remains open in DT.2. The five other layers stay partial. No missing target was silently marked proved. The gap count increases from 22 to 30; existing gaps were also refined. The eight newly appended gaps are listed below.

- Restricted-domain linear ODE solution carrier and scalar companion signatures.
- Completion and norm-preserving classification for continued number-field absolute values.
- Rank decomposition and coset counting in the uniform S-unit bound.
- Subspace-height API proof and rational lattice comparison.
- Schneider–Lang prototype output and parameter cutoffs need reconciliation.
- Effective general-group and superelliptic proof interfaces are not closed.
- Laplace boundary polynomial and André operator transfer.
- Ax integer-relation proof over arbitrary constants needs descent.

All six reviewed library-audit rows and the RS-03 ownership/review were read. Native height, integral-extension and field-base-change interfaces remain baseline inputs. Five exact GN.1 Minkowski/minimum interfaces and the CA.2 complex recurrence interface were read from their supplier packets. The stage anchors are promotion bridges, not duplicate definitions. GN.4 still owes the exact polar-lattice covering bound. The generic ODE/connection and subspace-lattice follow-ups need their existing owners confirmed before any duplicate implementation.

Each definition/construction’s API and at least three tests were reviewed, including degenerate cases that expose plausible wrong definitions. Lemma/application examples were checked too. Planets stay at six per layer; Schanuel remains a conditional conjecture contract and was removed from the DT.5 planet cap in favor of the Galochkin definition. Total 36.

## Baseline audit

Read all 423 original declaration statements, their surrounding variable hypotheses and parser-sensitive notation at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` / Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Final422 entries include the following corrections.

- Replace `Polynomial.rootMultiplicity_le_iff` by `Polynomial.le_rootMultiplicity_iff`: the former gives nondivisibility at the reversed inequality. The actual latter divisibility telescope is at line560.
- Remove `NormedRing.algEquivComplexOfComplete`: it presupposes a complex normed-algebra structure, so does not classify an arbitrary archimedean completion or construct that structure.
- Remove `ringKrullDim_le_ringKrullDim_quotient_add_spanFinrank`: its extra Jacobson premise is unavailable for the required affine-line fibre argument.
- Add `Matrix.det_vandermonde_ne_zero_iff`: injectivity of the coordinates gives the nonzero determinant in the recurrence-zero proof, at line233.

The retained declarations are conditional inputs. Their existence does not supply the constructions now explicitly gapped. The portable receipt below gives every final declaration’s actual module, line, pin and module SHA256; the reading included full surrounding telescopes, not just a declaration-name search.
<details><summary>All 422 baseline source receipts</summary>

```json
[
  {
    "ref": "mathlib:AbsoluteValue",
    "actualModule": "Mathlib/Algebra/Order/AbsoluteValue/Basic.lean",
    "actualLine": 36,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "e474a96551f8c6596416ada963232d3a1c719152fdea4ea80cd29d2b7305f991",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:AddMonoidAlgebra.lift",
    "actualModule": "Mathlib/Algebra/MonoidAlgebra/Basic.lean",
    "actualLine": 602,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "bbc8be41957a04ec5e6fbe5ab04ff943f3e5d596c73b64b68fc214bfa205a1f5",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:AddMonoidAlgebra.lift_single",
    "actualModule": "Mathlib/Algebra/MonoidAlgebra/Basic.lean",
    "actualLine": 628,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "bbc8be41957a04ec5e6fbe5ab04ff943f3e5d596c73b64b68fc214bfa205a1f5",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:AlgHom.restrictNormal'",
    "actualModule": "Mathlib/FieldTheory/Normal/Defs.lean",
    "actualLine": 156,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "131279d5867651ea15aecc6442076b7ff3d4b165265cec7533cfbc504a164389",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:AlgHom.restrictNormal_commutes",
    "actualModule": "Mathlib/FieldTheory/Normal/Defs.lean",
    "actualLine": 160,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "131279d5867651ea15aecc6442076b7ff3d4b165265cec7533cfbc504a164389",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Algebra.FormallyEtale.of_isSeparable",
    "actualModule": "Mathlib/RingTheory/Etale/Field.lean",
    "actualLine": 98,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "fe2660dd57ebc463fbf7f45a32424810e3fbd2577f6f3c99f056a63d72446e90",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Algebra.IsAlgebraic.exists_integral_multiples",
    "actualModule": "Mathlib/RingTheory/Algebraic/Integral.lean",
    "actualLine": 160,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d38705fa9b33a1c219472f65ade4392aecccb9cd3d3d1028021ffdc5993a7375",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Algebra.IsAlgebraic.isSeparable_of_perfectField",
    "actualModule": "Mathlib/FieldTheory/Perfect.lean",
    "actualLine": 338,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "557a6c6312edd40b889d07a9546a0d97bca53abcc08db3a778137aca7de59fe0",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Algebra.IsAlgebraic.isTranscendenceBasis_of_le_trdeg_of_finite",
    "actualModule": "Mathlib/RingTheory/AlgebraicIndependent/TranscendenceBasis.lean",
    "actualLine": 489,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "e55c683c5d63e14eb46e0fab7d53f8122ae1e7f24361561c112216317302ff4b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Algebra.IsAlgebraic.trdeg_le_cardinalMk",
    "actualModule": "Mathlib/RingTheory/AlgebraicIndependent/TranscendenceBasis.lean",
    "actualLine": 469,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "e55c683c5d63e14eb46e0fab7d53f8122ae1e7f24361561c112216317302ff4b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Algebra.discr_eq_det_embeddingsMatrixReindex_pow_two",
    "actualModule": "Mathlib/RingTheory/Discriminant.lean",
    "actualLine": 144,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2c5d8f3df2da089864578b3fcd71f33889254f3b982f668fa958abdd3d6dcad9",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Algebra.discr_not_zero_of_basis",
    "actualModule": "Mathlib/RingTheory/Discriminant.lean",
    "actualLine": 128,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2c5d8f3df2da089864578b3fcd71f33889254f3b982f668fa958abdd3d6dcad9",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Algebra.isIntegral_norm",
    "actualModule": "Mathlib/RingTheory/Norm/Transitivity.lean",
    "actualLine": 218,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "46b2a44d9c96ee4b387ba636bdb68a6356f0a7c8aeeade176da5181a27d39be2",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Algebra.natDenominator",
    "actualModule": "Mathlib/RingTheory/Algebraic/Denominator.lean",
    "actualLine": 66,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "18cb77ecb16a4f8d37b24f84dae9730d4641e1f13b69566a2888068c8936078d",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Algebra.natDenominator_dvd_iff",
    "actualModule": "Mathlib/RingTheory/Algebraic/Denominator.lean",
    "actualLine": 72,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "18cb77ecb16a4f8d37b24f84dae9730d4641e1f13b69566a2888068c8936078d",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Algebra.norm",
    "actualModule": "Mathlib/RingTheory/Norm/Defs.lean",
    "actualLine": 61,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "59365ae15613b3073ed34a7466a49304d085174e7192136ed69085388ad73d49",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Algebra.norm_algebraMap",
    "actualModule": "Mathlib/RingTheory/Norm/Defs.lean",
    "actualLine": 100,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "59365ae15613b3073ed34a7466a49304d085174e7192136ed69085388ad73d49",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Algebra.norm_eq_prod_embeddings",
    "actualModule": "Mathlib/RingTheory/Norm/Transitivity.lean",
    "actualLine": 268,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "46b2a44d9c96ee4b387ba636bdb68a6356f0a7c8aeeade176da5181a27d39be2",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Algebra.norm_ne_zero_iff",
    "actualModule": "Mathlib/RingTheory/Norm/Basic.lean",
    "actualLine": 112,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "339b46b1e3504eb136803c8bf1fc8472b57258a118b844bceac2f45579847343",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Algebra.norm_norm",
    "actualModule": "Mathlib/RingTheory/Norm/Transitivity.lean",
    "actualLine": 207,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "46b2a44d9c96ee4b387ba636bdb68a6356f0a7c8aeeade176da5181a27d39be2",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Algebra.trdeg",
    "actualModule": "Mathlib/RingTheory/AlgebraicIndependent/Basic.lean",
    "actualLine": 45,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "95ab6557cf64527e97fe918750662554244d4419a34d3da7cb15491e1352c50f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Algebraic.countable",
    "actualModule": "Mathlib/Algebra/AlgebraicCard.lean",
    "actualLine": 71,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f8621849138695269b9b703ef084196d7520b0a58a2b135fc461561a22a2b155",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:AlgebraicClosure",
    "actualModule": "Mathlib/FieldTheory/IsAlgClosed/AlgebraicClosure.lean",
    "actualLine": 127,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "374571bf2bd092d49e0a7faab8eea3d916f2cc0473330033417dd2f2327ecbb6",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:AlgebraicIndependent",
    "actualModule": "Mathlib/RingTheory/AlgebraicIndependent/Defs.lean",
    "actualLine": 54,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "057b6f961fd870a3bb4f53f9e5449dd452dcaa80c4d7a66cef1412f54185b4c4",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:AnalyticOnNhd",
    "actualModule": "Mathlib/Analysis/Analytic/Basic.lean",
    "actualLine": 120,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5bd829b44524785c84db262cade6c3cc4ab28f6966329429bcbf4dc35ba1e62c",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq",
    "actualModule": "Mathlib/Analysis/Analytic/Uniqueness.lean",
    "actualLine": 223,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "3c095cfff0c66f30905355dfe8918c74148cf462427b0b59f5322a495e002424",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:AnalyticOnNhd.eqOn_zero_of_preconnected_of_frequently_eq_zero",
    "actualModule": "Mathlib/Analysis/Analytic/IsolatedZeros.lean",
    "actualLine": 214,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "4ce04539d25690facf2a7eb31c39789ad73f84689f197c76d7ccf67831e9e50f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Complex.cpow_def_of_ne_zero",
    "actualModule": "Mathlib/Analysis/SpecialFunctions/Pow/Complex.lean",
    "actualLine": 40,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f0b0e01a90f834f1265cc216f97c8174622c116410c2a88b479f7a8d402d2453",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Complex.differentiableOn_dslope",
    "actualModule": "Mathlib/Analysis/Complex/RemovableSingularity.lean",
    "actualLine": 60,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "490172bf01117e29c87695714ab37333118560a458f2682456a3931846b1961e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Complex.exp",
    "actualModule": "Mathlib/Analysis/Complex/Exponential.lean",
    "actualLine": 62,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d27425575f2e2b71072c952ce38dced80e97498900b83d1da5d7c623adaeac4e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Complex.expMonoidHom",
    "actualModule": "Mathlib/Analysis/Complex/Exponential.lean",
    "actualLine": 134,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d27425575f2e2b71072c952ce38dced80e97498900b83d1da5d7c623adaeac4e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Complex.exp_add",
    "actualModule": "Mathlib/Analysis/Complex/Exponential.lean",
    "actualLine": 111,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d27425575f2e2b71072c952ce38dced80e97498900b83d1da5d7c623adaeac4e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Complex.exp_eq_exp_iff_exists_int",
    "actualModule": "Mathlib/Analysis/SpecialFunctions/Complex/Log.lean",
    "actualLine": 172,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "e3e7b5122318c59a7f391c87fecdc23e250f0702af5f6e4199cf530d78155a60",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Complex.exp_int_mul",
    "actualModule": "Mathlib/Analysis/Complex/Exponential.lean",
    "actualLine": 171,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d27425575f2e2b71072c952ce38dced80e97498900b83d1da5d7c623adaeac4e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Complex.exp_log",
    "actualModule": "Mathlib/Analysis/SpecialFunctions/Complex/Log.lean",
    "actualLine": 41,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "e3e7b5122318c59a7f391c87fecdc23e250f0702af5f6e4199cf530d78155a60",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Complex.exp_nat_mul",
    "actualModule": "Mathlib/Analysis/Complex/Exponential.lean",
    "actualLine": 157,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d27425575f2e2b71072c952ce38dced80e97498900b83d1da5d7c623adaeac4e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Complex.exp_ne_zero",
    "actualModule": "Mathlib/Analysis/Complex/Exponential.lean",
    "actualLine": 162,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d27425575f2e2b71072c952ce38dced80e97498900b83d1da5d7c623adaeac4e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Complex.exp_pi_mul_I",
    "actualModule": "Mathlib/Analysis/SpecialFunctions/Trigonometric/Basic.lean",
    "actualLine": 1214,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "95a967b7e1e11fbce6cfdaa0d8f88e1d0e4e5c9fb013dbaf2f3972d3efbf7352",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Complex.isIntegral_I",
    "actualModule": "Mathlib/Analysis/Complex/IsIntegral.lean",
    "actualLine": 26,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d16847dd96e57d1b6667434ebab66ef7c45e07fca5f136b875dafdbd526a8680",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Complex.log",
    "actualModule": "Mathlib/Analysis/SpecialFunctions/Complex/Log.lean",
    "actualLine": 30,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "e3e7b5122318c59a7f391c87fecdc23e250f0702af5f6e4199cf530d78155a60",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Complex.norm_exp",
    "actualModule": "Mathlib/Analysis/Complex/Trigonometric.lean",
    "actualLine": 983,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "b63dc0d49ca3deb88ffb47292745448b2611bf2d43b4ea05931628f8aa286b3b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le",
    "actualModule": "Mathlib/Analysis/Complex/Liouville.lean",
    "actualLine": 44,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "dda443f8b63abc286eaf675a65de4975cb0715f374b0fff91d75e259d7235161",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Complex.norm_le_of_forall_mem_frontier_norm_le",
    "actualModule": "Mathlib/Analysis/Complex/AbsMax.lean",
    "actualLine": 403,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "64b94cdd04cb19f4f2bb412b242ca57b18136d393cb660a1c9beb7acbd26f620",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Complex.norm_log_one_add_half_le_self",
    "actualModule": "Mathlib/Analysis/SpecialFunctions/Complex/LogBounds.lean",
    "actualLine": 213,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5555dbaa4313f7590501bc8b6ea0d0a387de82ae40d9aa235e9c58ba0472cc85",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:ContinuousLinearMap.le_opNorm",
    "actualModule": "Mathlib/Analysis/Normed/Operator/Basic.lean",
    "actualLine": 235,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "4c8daea8cc17e8f6647e665d5c0fad058af46758dff0e73af2b85a72976bd0e6",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Convex.norm_image_sub_le_of_norm_deriv_le",
    "actualModule": "Mathlib/Analysis/Calculus/MeanValue.lean",
    "actualLine": 728,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "7e1e6f097fe92a2493ea5b4bc9a1896c850514604f26f863f812906fb500b856",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Derivation",
    "actualModule": "Mathlib/RingTheory/Derivation/Basic.lean",
    "actualLine": 45,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "92bccd382e2e1f2caaf7497ed821f3cecb3cddd26b8b3252c9db118c943324ee",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Differentiable.analyticAt",
    "actualModule": "Mathlib/Analysis/Complex/CauchyIntegral.lean",
    "actualLine": 728,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "25c76fe24a2fcc04f6eadd8353f9be268611f8f8eeaf3f119dcaf7d140b7d33f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:EisensteinSeries.D2_S",
    "actualModule": "Mathlib/NumberTheory/ModularForms/EisensteinSeries/E2/Defs.lean",
    "actualLine": 102,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "bb727401e5f33b7c3b5d7a884a1300fe6a23d65a6382413acf0874df9f8dbf42",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:EisensteinSeries.E2",
    "actualModule": "Mathlib/NumberTheory/ModularForms/EisensteinSeries/E2/Defs.lean",
    "actualLine": 60,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "bb727401e5f33b7c3b5d7a884a1300fe6a23d65a6382413acf0874df9f8dbf42",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:EisensteinSeries.E2_slash_action",
    "actualModule": "Mathlib/NumberTheory/ModularForms/EisensteinSeries/E2/Transform.lean",
    "actualLine": 229,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "6ab5f9bfbef39fb1a8f1dd25ae40f0d81ea24f197ca7a58d4783ae173e22d64b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Finset.exists_ne_map_eq_of_card_lt_of_maps_to",
    "actualModule": "Mathlib/Data/Finset/Card.lean",
    "actualLine": 470,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "8fde02f405a78deb476e0e5507cddf6e082cb5d1de2ef29d5cb6465e82b9b815",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Finset.gcd_eq_sum_mul",
    "actualModule": "Mathlib/RingTheory/PrincipalIdealDomain.lean",
    "actualLine": 233,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5a11d63356b334f88b444943046fd24f4cabc65b893f9f17b105f4c6dd63ed3e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Finsupp.logHeight",
    "actualModule": "Mathlib/NumberTheory/Height/Basic.lean",
    "actualLine": 298,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "c98229ddbbb409fd658a404a8779ddb67ac93b982878aa81df82d9c41531349a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:FloorSemiring.tendsto_pow_div_factorial_atTop",
    "actualModule": "Mathlib/Topology/Algebra/Order/Floor.lean",
    "actualLine": 54,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "709ec4525c89f22139a16620f6917000250b0b2ab658ed50a27ffda82c3a17d0",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Function.Periodic.qParam",
    "actualModule": "Mathlib/Analysis/Complex/Periodic.lean",
    "actualLine": 40,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1d6d6a2844ce088b151f813866bc21f303c3e4970f15ba3cecc46631bb09cd76",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:GenContFract.abs_sub_convs_le",
    "actualModule": "Mathlib/Algebra/ContinuedFractions/Computation/Approximations.lean",
    "actualLine": 399,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "162ddb98f12c12915f5426aa3d617386f0b41b0fc6938859fe7d4b6b5d5769d9",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:GenContFract.determinant",
    "actualModule": "Mathlib/Algebra/ContinuedFractions/Determinant.lean",
    "actualLine": 64,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "375cd33a000c1de02522f76927fdcaf4203343c354f5d64622fd314dfb9aa7fc",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:GenContFract.sub_convs_eq",
    "actualModule": "Mathlib/Algebra/ContinuedFractions/Computation/Approximations.lean",
    "actualLine": 328,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "162ddb98f12c12915f5426aa3d617386f0b41b0fc6938859fe7d4b6b5d5769d9",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:HasFPowerSeriesOnBall",
    "actualModule": "Mathlib/Analysis/Analytic/Basic.lean",
    "actualLine": 74,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5bd829b44524785c84db262cade6c3cc4ab28f6966329429bcbf4dc35ba1e62c",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Height.logHeight",
    "actualModule": "Mathlib/NumberTheory/Height/Basic.lean",
    "actualLine": 272,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "c98229ddbbb409fd658a404a8779ddb67ac93b982878aa81df82d9c41531349a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Height.logHeight₁",
    "actualModule": "Mathlib/NumberTheory/Height/Basic.lean",
    "actualLine": 147,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "c98229ddbbb409fd658a404a8779ddb67ac93b982878aa81df82d9c41531349a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Height.logHeight₁_add_le",
    "actualModule": "Mathlib/NumberTheory/Height/Basic.lean",
    "actualLine": 911,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "c98229ddbbb409fd658a404a8779ddb67ac93b982878aa81df82d9c41531349a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Height.logHeight₁_eq_logHeight",
    "actualModule": "Mathlib/NumberTheory/Height/Basic.lean",
    "actualLine": 562,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "c98229ddbbb409fd658a404a8779ddb67ac93b982878aa81df82d9c41531349a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Height.logHeight₁_inv",
    "actualModule": "Mathlib/NumberTheory/Height/Basic.lean",
    "actualLine": 609,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "c98229ddbbb409fd658a404a8779ddb67ac93b982878aa81df82d9c41531349a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Height.logHeight₁_mul_le",
    "actualModule": "Mathlib/NumberTheory/Height/Basic.lean",
    "actualLine": 784,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "c98229ddbbb409fd658a404a8779ddb67ac93b982878aa81df82d9c41531349a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Height.logHeight₁_prod_le",
    "actualModule": "Mathlib/NumberTheory/Height/Basic.lean",
    "actualLine": 804,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "c98229ddbbb409fd658a404a8779ddb67ac93b982878aa81df82d9c41531349a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Height.logHeight₁_sub_le",
    "actualModule": "Mathlib/NumberTheory/Height/Basic.lean",
    "actualLine": 926,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "c98229ddbbb409fd658a404a8779ddb67ac93b982878aa81df82d9c41531349a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Height.logHeight₁_zpow",
    "actualModule": "Mathlib/NumberTheory/Height/Basic.lean",
    "actualLine": 636,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "c98229ddbbb409fd658a404a8779ddb67ac93b982878aa81df82d9c41531349a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Height.mulHeight",
    "actualModule": "Mathlib/NumberTheory/Height/Basic.lean",
    "actualLine": 233,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "c98229ddbbb409fd658a404a8779ddb67ac93b982878aa81df82d9c41531349a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Height.mulHeight_comp_equiv",
    "actualModule": "Mathlib/NumberTheory/Height/Basic.lean",
    "actualLine": 256,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "c98229ddbbb409fd658a404a8779ddb67ac93b982878aa81df82d9c41531349a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Height.mulHeight_fun_mul_eq",
    "actualModule": "Mathlib/NumberTheory/Height/Basic.lean",
    "actualLine": 703,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "c98229ddbbb409fd658a404a8779ddb67ac93b982878aa81df82d9c41531349a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Height.mulHeight_smul_eq_mulHeight",
    "actualModule": "Mathlib/NumberTheory/Height/Basic.lean",
    "actualLine": 336,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "c98229ddbbb409fd658a404a8779ddb67ac93b982878aa81df82d9c41531349a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Height.mulHeight₁",
    "actualModule": "Mathlib/NumberTheory/Height/Basic.lean",
    "actualLine": 114,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "c98229ddbbb409fd658a404a8779ddb67ac93b982878aa81df82d9c41531349a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Height.mulHeight₁_div_eq_mulHeight",
    "actualModule": "Mathlib/NumberTheory/Height/Basic.lean",
    "actualLine": 565,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "c98229ddbbb409fd658a404a8779ddb67ac93b982878aa81df82d9c41531349a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Height.mulHeight₁_eq_mulHeight",
    "actualModule": "Mathlib/NumberTheory/Height/Basic.lean",
    "actualLine": 555,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "c98229ddbbb409fd658a404a8779ddb67ac93b982878aa81df82d9c41531349a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown",
    "actualModule": "Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean",
    "actualLine": 462,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2a6af9f2a6d95b81374970f34edaf0d4f9879389031a0f423d6e3bc531997c1b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Ideal.sum_ramification_inertia_eq_finrank",
    "actualModule": "Mathlib/RingTheory/RamificationInertia/Basic.lean",
    "actualLine": 72,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "b7f5290e28d150f9ed28f5100cc0dac909345d4c1ab00a9df328f01bbf045d95",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:InnerProductSpace.gramSchmidt",
    "actualModule": "Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean",
    "actualLine": 52,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "704d995e01130543c48f9e21319a99c593b92ab190fde62135c181e77deff7fa",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:InnerProductSpace.gramSchmidt_orthogonal",
    "actualModule": "Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean",
    "actualLine": 83,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "704d995e01130543c48f9e21319a99c593b92ab190fde62135c181e77deff7fa",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Int.Matrix.exists_ne_zero_int_vec_norm_le",
    "actualModule": "Mathlib/NumberTheory/SiegelsLemma.lean",
    "actualLine": 155,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "363fb7497e5f2ef3a96024113a49dfcdfc875e99ff1ff3fd4c5792931fa8b198",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Int.emultiplicity_pow_sub_pow",
    "actualModule": "Mathlib/NumberTheory/Multiplicity.lean",
    "actualLine": 190,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "96aff8b28e38246c2820f8ddf0610af8d5340cfbcc16d9334737832a4c31833a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Int.two_pow_sub_pow'",
    "actualModule": "Mathlib/NumberTheory/Multiplicity.lean",
    "actualLine": 276,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "96aff8b28e38246c2820f8ddf0610af8d5340cfbcc16d9334737832a4c31833a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IntermediateField.adjoin",
    "actualModule": "Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean",
    "actualLine": 34,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "acccf606573e67aeb67d1354c50e8f0531ede578922f22bc4fa376b74b22d967",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IntermediateField.adjoin.finrank",
    "actualModule": "Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean",
    "actualLine": 489,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "8c664a4e82492fe856642f7b55db4650986c13845a94712998da5d769cfbdc7b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IntermediateField.adjoinRootEquivAdjoin",
    "actualModule": "Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean",
    "actualLine": 417,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "8c664a4e82492fe856642f7b55db4650986c13845a94712998da5d769cfbdc7b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IntermediateField.adjoin_rootSet_isSplittingField",
    "actualModule": "Mathlib/FieldTheory/SplittingField/IsSplittingField.lean",
    "actualLine": 194,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "b2d2217d78e9a1fc1a889c291d84d00f5378ca7ef0a9f5f2ac8a313ad0021a87",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Irrational",
    "actualModule": "Mathlib/NumberTheory/Real/Irrational.lean",
    "actualLine": 37,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "b5b8fef319876fc584704ec0902863ab8016fe0ba4dee5dd358f86f4688b13cc",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Irreducible.separable",
    "actualModule": "Mathlib/FieldTheory/Separable.lean",
    "actualLine": 510,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "e2dcc1b5d2115b14a25404cb188bd0e5cadb96d30e57b4dcba2abad77398fce1",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsAlgClosed.card_roots_eq_natDegree",
    "actualModule": "Mathlib/FieldTheory/IsAlgClosed/Basic.lean",
    "actualLine": 110,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "87c1116c746be4329038b669ca67118a9e008472fb44ca4cc2ff9e7c6347e3f1",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsAlgClosed.lift",
    "actualModule": "Mathlib/FieldTheory/IsAlgClosed/Basic.lean",
    "actualLine": 350,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "87c1116c746be4329038b669ca67118a9e008472fb44ca4cc2ff9e7c6347e3f1",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsAlgClosed.splits_domain",
    "actualModule": "Mathlib/FieldTheory/IsAlgClosed/Basic.lean",
    "actualLine": 66,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "87c1116c746be4329038b669ca67118a9e008472fb44ca4cc2ff9e7c6347e3f1",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsAlgebraic",
    "actualModule": "Mathlib/RingTheory/Algebraic/Defs.lean",
    "actualLine": 45,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "4c25b9f55ecd629a00eac8b686e553fb27bd6d48dc10fef02cf65d0d7bc3a134",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsAlgebraic.inv_iff",
    "actualModule": "Mathlib/RingTheory/Algebraic/Basic.lean",
    "actualLine": 389,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "0f498726195e8d49b9ff7ca275881f08571c2a064ea0b17c3ee05132daeea406",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsAlgebraic.mul",
    "actualModule": "Mathlib/RingTheory/Algebraic/Integral.lean",
    "actualLine": 316,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d38705fa9b33a1c219472f65ade4392aecccb9cd3d3d1028021ffdc5993a7375",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsAlgebraic.of_pow",
    "actualModule": "Mathlib/RingTheory/Algebraic/Basic.lean",
    "actualLine": 372,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "0f498726195e8d49b9ff7ca275881f08571c2a064ea0b17c3ee05132daeea406",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsAlgebraic.restrictScalars",
    "actualModule": "Mathlib/RingTheory/Algebraic/Integral.lean",
    "actualLine": 247,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d38705fa9b33a1c219472f65ade4392aecccb9cd3d3d1028021ffdc5993a7375",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsDedekindDomain.HeightOneSpectrum.adicAbv",
    "actualModule": "Mathlib/RingTheory/DedekindDomain/AdicValuation.lean",
    "actualLine": 1069,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "92259b08dff131695359f8ace62b8dadad972aba9276a137549fa71d483c342a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsDedekindDomain.HeightOneSpectrum.intValuation",
    "actualModule": "Mathlib/RingTheory/DedekindDomain/AdicValuation.lean",
    "actualLine": 166,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "92259b08dff131695359f8ace62b8dadad972aba9276a137549fa71d483c342a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsGalois.of_separable_splitting_field",
    "actualModule": "Mathlib/FieldTheory/Galois/Basic.lean",
    "actualLine": 534,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "59d802b6f4f3b7f44c18035fa37991962c37e28aef73d6e2859135db0b107ba5",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsIntegral",
    "actualModule": "Mathlib/RingTheory/IntegralClosure/IsIntegral/Defs.lean",
    "actualLine": 53,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "a5e0943b3a24caf651234968e24ae8951268df2d78be53c6af83d3f1156f2056",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsIntegral.add",
    "actualModule": "Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean",
    "actualLine": 156,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "9fba5af7ebaa7e858009518d0ee71e03969384eb7e64270c1574b90103797d5f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsIntegral.mul",
    "actualModule": "Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean",
    "actualLine": 196,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "9fba5af7ebaa7e858009518d0ee71e03969384eb7e64270c1574b90103797d5f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsIntegrallyClosed.algebraMap_eq_of_integral",
    "actualModule": "Mathlib/RingTheory/IntegralClosure/IntegrallyClosed.lean",
    "actualLine": 244,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d4818358821cc8b519cd9935148363d905529503a2bad380d9f4f2e915fc0e24",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsLocalization.integerNormalization",
    "actualModule": "Mathlib/RingTheory/Localization/Integral.lean",
    "actualLine": 50,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d427f15f5cec2700ee61fd9e4659e7c78868152a30a58e3ba2a95a29288bbac1",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsLocalization.integerNormalization_aeval_eq_zero",
    "actualModule": "Mathlib/RingTheory/Localization/Integral.lean",
    "actualLine": 82,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d427f15f5cec2700ee61fd9e4659e7c78868152a30a58e3ba2a95a29288bbac1",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsNonarchimedean.apply_sum_le",
    "actualModule": "Mathlib/NumberTheory/Height/MvPolynomial.lean",
    "actualLine": 42,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "986b7c9beca70f1259201b21563680572b1ad86e867a6145e141e3e5e3d4fb5e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:IsOfFinOrder",
    "actualModule": "Mathlib/GroupTheory/OrderOfElement.lean",
    "actualLine": 65,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "338cd8fd86078ff1c852185399474d85bd2d11218c7c8c79a229cf21296e4650",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:KaehlerDifferential",
    "actualModule": "Mathlib/RingTheory/Kaehler/Basic.lean",
    "actualLine": 153,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "e02262bfb54e1edb0dd9fc4f8725ad4c509efd6319e55b1220e11d7de2b18204",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:KaehlerDifferential.D",
    "actualModule": "Mathlib/RingTheory/Kaehler/Basic.lean",
    "actualLine": 198,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "e02262bfb54e1edb0dd9fc4f8725ad4c509efd6319e55b1220e11d7de2b18204",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:KaehlerDifferential.isLocalizedModule",
    "actualModule": "Mathlib/RingTheory/Kaehler/TensorProduct.lean",
    "actualLine": 231,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "0f95ba9fe488172901d81211124ad9f0356c7234ed9c148e8ffbd6e8f44c7903",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:KaehlerDifferential.mvPolynomialBasis",
    "actualModule": "Mathlib/RingTheory/Kaehler/Polynomial.lean",
    "actualLine": 60,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "43583c3ac7bef530c0b3cbfe6dc114d31d1a19b81ff88819ab7ad0165c02c799",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale",
    "actualModule": "Mathlib/RingTheory/Etale/Kaehler.lean",
    "actualLine": 38,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f7e25d2da5b3718ec670f000d3ce4fece4953a892bcafb957bbdaa171587048c",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:LaurentSeries",
    "actualModule": "Mathlib/RingTheory/LaurentSeries.lean",
    "actualLine": 102,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "dc23d8c6ba668df50051223d9099a8f0ce0e7a12385cfeb250bf2cc88f403ad9",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:LindemannWeierstrass.exp_polynomial_approx",
    "actualModule": "Mathlib/NumberTheory/Transcendental/Lindemann/AnalyticalPart.lean",
    "actualLine": 157,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2052e62931d13be5dc28440b40dbe9c198530a946ae1f9e272810c709b5f328b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:LindemannWeierstrass.integral_exp_mul_eval",
    "actualModule": "Mathlib/NumberTheory/Transcendental/Lindemann/AnalyticalPart.lean",
    "actualLine": 39,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2052e62931d13be5dc28440b40dbe9c198530a946ae1f9e272810c709b5f328b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:LinearRecurrence",
    "actualModule": "Mathlib/Algebra/LinearRecurrence.lean",
    "actualLine": 53,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "4051e6c800fadbe3ae4e6f67e8249cfa256dbb0dc58c31cb5d61a056d7272c54",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:LinearRecurrence.IsSolution",
    "actualModule": "Mathlib/Algebra/LinearRecurrence.lean",
    "actualLine": 70,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "4051e6c800fadbe3ae4e6f67e8249cfa256dbb0dc58c31cb5d61a056d7272c54",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:LinearRecurrence.charPoly",
    "actualModule": "Mathlib/Algebra/LinearRecurrence.lean",
    "actualLine": 209,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "4051e6c800fadbe3ae4e6f67e8249cfa256dbb0dc58c31cb5d61a056d7272c54",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Liouville",
    "actualModule": "Mathlib/NumberTheory/Transcendental/Liouville/Basic.lean",
    "actualLine": 36,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1cc189218e3cc07e383205c72ab25062d8480a810582580bf68ae9b7f20cf48f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Liouville.exists_pos_real_of_irrational_root",
    "actualModule": "Mathlib/NumberTheory/Transcendental/Liouville/Basic.lean",
    "actualLine": 126,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1cc189218e3cc07e383205c72ab25062d8480a810582580bf68ae9b7f20cf48f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:LiouvilleWith",
    "actualModule": "Mathlib/NumberTheory/Transcendental/Liouville/LiouvilleWith.lean",
    "actualLine": 51,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "aca4e066cc4cb66c731f13acb8b725ee68858cc8b9046ed232d6c69d5a9352aa",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:LiouvilleWith.irrational",
    "actualModule": "Mathlib/NumberTheory/Transcendental/Liouville/LiouvilleWith.lean",
    "actualLine": 283,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "aca4e066cc4cb66c731f13acb8b725ee68858cc8b9046ed232d6c69d5a9352aa",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:LiouvilleWith.mono",
    "actualModule": "Mathlib/NumberTheory/Transcendental/Liouville/LiouvilleWith.lean",
    "actualLine": 88,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "aca4e066cc4cb66c731f13acb8b725ee68858cc8b9046ed232d6c69d5a9352aa",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Matrix.det",
    "actualModule": "Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean",
    "actualLine": 60,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "870291a8544ad9297e0c17f3531bea11607a1f0d83b775b13a31981777c30f2e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Matrix.det_apply",
    "actualModule": "Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean",
    "actualLine": 63,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "870291a8544ad9297e0c17f3531bea11607a1f0d83b775b13a31981777c30f2e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Matrix.det_mul",
    "actualModule": "Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean",
    "actualLine": 138,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "870291a8544ad9297e0c17f3531bea11607a1f0d83b775b13a31981777c30f2e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Matrix.linearIndependent_rows_iff_isUnit",
    "actualModule": "Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean",
    "actualLine": 365,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1ee785b6ebd213ad2ed971bf3c804afee8cc6ce52be69e63572b4cf1bdb5e880",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Matrix.nonsing_inv_mul",
    "actualModule": "Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean",
    "actualLine": 217,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1ee785b6ebd213ad2ed971bf3c804afee8cc6ce52be69e63572b4cf1bdb5e880",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Matrix.rank",
    "actualModule": "Mathlib/LinearAlgebra/Matrix/Rank.lean",
    "actualLine": 134,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "4ce457849b67eca2d37842f1ebcac1dea88f16a202f5c6dfceb4bb6c6047e262",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure",
    "actualModule": "Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean",
    "actualLine": 91,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "de9131b24275b8eb68f91606f9e585eb4cf9a587ad386e46e1e7f930dbb11c75",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MeasureTheory.integral_Ioi_of_hasDerivAt_of_tendsto",
    "actualModule": "Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean",
    "actualLine": 786,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "ffecc4f2ef64fde604d2b878b0b38a55b2af05d25614e212924ca86956d97e06",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:ModularForm.E₄",
    "actualModule": "Mathlib/NumberTheory/ModularForms/EisensteinSeries/Basic.lean",
    "actualLine": 51,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "532f23d66f84a5553a4e3122bdf22285bc0c2b7ba2e9a0c689fa5ef7ae54713e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:ModularForm.E₆",
    "actualModule": "Mathlib/NumberTheory/ModularForms/EisensteinSeries/Basic.lean",
    "actualLine": 54,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "532f23d66f84a5553a4e3122bdf22285bc0c2b7ba2e9a0c689fa5ef7ae54713e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Module.Basis.equivFunL",
    "actualModule": "Mathlib/Topology/Algebra/Module/FiniteDimension.lean",
    "actualLine": 446,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "aae1cf2eb90fc1b11375074ec2bb8eccc904e3221d1ee4bfa65b806d971d9367",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Module.Basis.extend",
    "actualModule": "Mathlib/LinearAlgebra/Basis/VectorSpace.lean",
    "actualLine": 52,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "cdbe0fd512f13ea3e563290d2896c89e3882ed0040ecc7c3314676a8f278728a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Module.finBasis",
    "actualModule": "Mathlib/LinearAlgebra/Dimension/Free.lean",
    "actualLine": 334,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "a25ac832cd9d5fca78efa749185580787553643a190b73d4f0fea95108c1c8c5",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Module.finrank",
    "actualModule": "Mathlib/LinearAlgebra/Dimension/Finrank.lean",
    "actualLine": 62,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "4ab91c2b2e2d56f24c0260f25d55a31042cac8112a943a7c877594528c363e21",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Module.finrank_eq_zero_iff_isTorsion",
    "actualModule": "Mathlib/LinearAlgebra/Dimension/Torsion/Finite.lean",
    "actualLine": 38,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "6fb5c1c0a4f73e881fd450cb759c61fa1e758f7eda98f79b53fdab5d86d65c57",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Module.finrank_mul_finrank",
    "actualModule": "Mathlib/LinearAlgebra/Dimension/Free.lean",
    "actualLine": 68,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "a25ac832cd9d5fca78efa749185580787553643a190b73d4f0fea95108c1c8c5",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Module.free_of_finite_type_torsion_free'",
    "actualModule": "Mathlib/LinearAlgebra/FreeModule/PID.lean",
    "actualLine": 386,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "8d598b47f02aed4241122a2f88c132fce6b3a26776f24086a5d1d5acb7795aff",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MonoidAlgebra.mapDomainRingEquiv",
    "actualModule": "Mathlib/Algebra/MonoidAlgebra/MapDomain.lean",
    "actualLine": 362,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d42d0419b763d02aa349611604a171a509070a3c7562bc2f26a56697375f66f2",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MonoidAlgebra.mapRingEquiv",
    "actualModule": "Mathlib/Algebra/MonoidAlgebra/MapDomain.lean",
    "actualLine": 393,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d42d0419b763d02aa349611604a171a509070a3c7562bc2f26a56697375f66f2",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.IsHomogeneous",
    "actualModule": "Mathlib/RingTheory/MvPolynomial/Homogeneous.lean",
    "actualLine": 48,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "cc14ab54a1e88b37d838b98f7371540b9df545bdf071d8cb92740ddbea654335",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.aeval",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Eval.lean",
    "actualLine": 569,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "617a2278665e02a00684f6f17b96f9925a473c54e456fc53eb6dae299c0fd89f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.degreeOf",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Degrees.lean",
    "actualLine": 216,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "324da5ed3561171acf4705e703157e001d193403571ea393d1b560cc334d4360",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.pderiv",
    "actualModule": "Mathlib/Algebra/MvPolynomial/PDeriv.lean",
    "actualLine": 61,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "86fad42ffca71f9ffd94f59d1e6486977de3c79d14385e1c462afeaf59c09fc5",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.rename",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Rename.lean",
    "actualLine": 54,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "8b13bd16753f7de4cbd5fa7dd6b9ef0ade42ff563fca27e798885e31628477b8",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.ringKrullDim_of_isNoetherianRing",
    "actualModule": "Mathlib/RingTheory/KrullDimension/Polynomial.lean",
    "actualLine": 120,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "97e90a214217a074adce01350595f6bfd8c34acfec5d80d02f8589a208d8b3ef",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.vanishingIdeal_zeroLocus_eq_radical",
    "actualModule": "Mathlib/RingTheory/Nullstellensatz.lean",
    "actualLine": 172,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "4cff1e3d1983296280326087593b18b6a055088727c9b5e768291a0459f24ee1",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.vars",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Variables.lean",
    "actualLine": 69,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "30f6f39c0244dbf03c2854b529896edad2bdab15adc9f7ac8f9505844258126d",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPowerSeries.gaussNorm_mul_le",
    "actualModule": "Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean",
    "actualLine": 138,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "dd65b4fdb14dec44ae18cd69cacf62d8675a8b6c8a9f783efb6d46f196ba4a46",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Nat.choose_le_two_pow",
    "actualModule": "Mathlib/Data/Nat/Choose/Bounds.lean",
    "actualLine": 96,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "47d512919b879ee6a45a7c40b83fda92bb3cb94cd47696d51cede46d44bb7c32",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Nat.exists_infinite_primes",
    "actualModule": "Mathlib/Data/Nat/Prime/Infinite.lean",
    "actualLine": 33,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "21ada6c086aa96941e8e22fb355feb35dbc6e63f97fc9ec25de21349478b0def",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Nat.factoredNumbers",
    "actualModule": "Mathlib/NumberTheory/SmoothNumbers.lean",
    "actualLine": 45,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "538170c112ecd9dde356bd922d83cd7a70d474df96250998d5d3502a7425fa34",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Nat.factorization_prod_pow_eq_self",
    "actualModule": "Mathlib/Data/Nat/Factorization/Defs.lean",
    "actualLine": 103,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "0c2aa91e4d2e1ed491d9063e834c5debe73e3cbcd9ea6e5ecf37eed97b846309",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Nat.succ_mul_centralBinom_succ",
    "actualModule": "Mathlib/Data/Nat/Choose/Central.lean",
    "actualLine": 78,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "4e506ec3297069021a686f3818af8972e54cff0a36518851343b26af85d375e5",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Embeddings.card",
    "actualModule": "Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean",
    "actualLine": 61,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1c387b8e514d0511c5a6164bc2c661d9de542114b6b56a67449626d8f2aa0634",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Embeddings.coeff_bdd_of_norm_le",
    "actualModule": "Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean",
    "actualLine": 94,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1c387b8e514d0511c5a6164bc2c661d9de542114b6b56a67449626d8f2aa0634",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Embeddings.finite_of_norm_le",
    "actualModule": "Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean",
    "actualLine": 109,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1c387b8e514d0511c5a6164bc2c661d9de542114b6b56a67449626d8f2aa0634",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Embeddings.pow_eq_one_of_norm_eq_one",
    "actualModule": "Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean",
    "actualLine": 138,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1c387b8e514d0511c5a6164bc2c661d9de542114b6b56a67449626d8f2aa0634",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Embeddings.range_eval_eq_rootSet_minpoly",
    "actualModule": "Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean",
    "actualLine": 79,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1c387b8e514d0511c5a6164bc2c661d9de542114b6b56a67449626d8f2aa0634",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.FinitePlace",
    "actualModule": "Mathlib/NumberTheory/NumberField/Completion/FinitePlace.lean",
    "actualLine": 329,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "a0f9d2e9c50c19c06eb450e1635f9c092e4a214037640b73d9e8ca6da08a02e8",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.FinitePlace.add_le",
    "actualModule": "Mathlib/NumberTheory/NumberField/Completion/FinitePlace.lean",
    "actualLine": 455,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "a0f9d2e9c50c19c06eb450e1635f9c092e4a214037640b73d9e8ca6da08a02e8",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.FinitePlace.equivHeightOneSpectrum_symm_apply_algebraMap",
    "actualModule": "Mathlib/NumberTheory/NumberField/Completion/FinitePlace.lean",
    "actualLine": 478,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "a0f9d2e9c50c19c06eb450e1635f9c092e4a214037640b73d9e8ca6da08a02e8",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.FinitePlace.mulSupport_finite",
    "actualModule": "Mathlib/NumberTheory/NumberField/Completion/FinitePlace.lean",
    "actualLine": 445,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "a0f9d2e9c50c19c06eb450e1635f9c092e4a214037640b73d9e8ca6da08a02e8",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.FinitePlace.norm_le_one",
    "actualModule": "Mathlib/NumberTheory/NumberField/Completion/FinitePlace.lean",
    "actualLine": 293,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "a0f9d2e9c50c19c06eb450e1635f9c092e4a214037640b73d9e8ca6da08a02e8",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.HeightOneSpectrum.adicAbv_intCast_le_one",
    "actualModule": "Mathlib/NumberTheory/NumberField/Completion/FinitePlace.lean",
    "actualLine": 179,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "a0f9d2e9c50c19c06eb450e1635f9c092e4a214037640b73d9e8ca6da08a02e8",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.InfinitePlace",
    "actualModule": "Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean",
    "actualLine": 57,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "82ea5261f10b852efe8b3a7daba284b47e2facf91f115dc93a69e8f10a687415",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank",
    "actualModule": "Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean",
    "actualLine": 474,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "82ea5261f10b852efe8b3a7daba284b47e2facf91f115dc93a69e8f10a687415",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.InfinitePlace.card_eq_nrRealPlaces_add_nrComplexPlaces",
    "actualModule": "Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean",
    "actualLine": 447,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "82ea5261f10b852efe8b3a7daba284b47e2facf91f115dc93a69e8f10a687415",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.InfinitePlace.card_filter_mk_eq",
    "actualModule": "Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean",
    "actualLine": 307,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "82ea5261f10b852efe8b3a7daba284b47e2facf91f115dc93a69e8f10a687415",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.InfinitePlace.comap_apply",
    "actualModule": "Mathlib/NumberTheory/NumberField/InfinitePlace/Ramification.lean",
    "actualLine": 60,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "74bb414aeace7294191f2a8b804bc6849f12de9d07f463c9a09a9bbc85696ce6",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.InfinitePlace.embedding",
    "actualModule": "Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean",
    "actualLine": 102,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "82ea5261f10b852efe8b3a7daba284b47e2facf91f115dc93a69e8f10a687415",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.InfinitePlace.inertiaDeg_eq_finrank",
    "actualModule": "Mathlib/NumberTheory/NumberField/Completion/Ramification.lean",
    "actualLine": 107,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "8b85b8569d524966c509d2f7c27bfa6ee7fbb37d3c7d30389d4656a82cebc521",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.InfinitePlace.mult",
    "actualModule": "Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean",
    "actualLine": 274,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "82ea5261f10b852efe8b3a7daba284b47e2facf91f115dc93a69e8f10a687415",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.InfinitePlace.mult_mul_finrank",
    "actualModule": "Mathlib/NumberTheory/NumberField/Completion/Ramification.lean",
    "actualLine": 87,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "8b85b8569d524966c509d2f7c27bfa6ee7fbb37d3c7d30389d4656a82cebc521",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.InfinitePlace.norm_embedding_eq",
    "actualModule": "Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean",
    "actualLine": 112,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "82ea5261f10b852efe8b3a7daba284b47e2facf91f115dc93a69e8f10a687415",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.InfinitePlace.one_le_of_lt_one",
    "actualModule": "Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean",
    "actualLine": 382,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "82ea5261f10b852efe8b3a7daba284b47e2facf91f115dc93a69e8f10a687415",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.InfinitePlace.prod_eq_abs_norm",
    "actualModule": "Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean",
    "actualLine": 370,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "82ea5261f10b852efe8b3a7daba284b47e2facf91f115dc93a69e8f10a687415",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.InfinitePlace.sum_inertiaDeg_eq_finrank",
    "actualModule": "Mathlib/NumberTheory/NumberField/Completion/Ramification.lean",
    "actualLine": 125,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "8b85b8569d524966c509d2f7c27bfa6ee7fbb37d3c7d30389d4656a82cebc521",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.InfinitePlace.sum_mult_eq",
    "actualModule": "Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean",
    "actualLine": 335,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "82ea5261f10b852efe8b3a7daba284b47e2facf91f115dc93a69e8f10a687415",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.RingOfIntegers.instFintypeClassGroup",
    "actualModule": "Mathlib/NumberTheory/NumberField/ClassNumber.lean",
    "actualLine": 58,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "623fa7f3b56fc3609c5a2b2fc7b4015bd5dffba7a8453ef66bbb44e23e0425af",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.RingOfIntegers.rank",
    "actualModule": "Mathlib/NumberTheory/NumberField/Basic.lean",
    "actualLine": 418,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "4e9e600e2aeee2c69f498c2d5d8af2622b03d35a13e4f61dbb5730a88a7eb58b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Units.basisOfIsMaxRank",
    "actualModule": "Mathlib/NumberTheory/NumberField/Units/Regulator.lean",
    "actualLine": 78,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "ed32349527de7a8098b2d644c3ed24a31025047449da48e7e97676888d0e4f73",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Units.basisOfIsMaxRank_apply",
    "actualModule": "Mathlib/NumberTheory/NumberField/Units/Regulator.lean",
    "actualLine": 84,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "ed32349527de7a8098b2d644c3ed24a31025047449da48e7e97676888d0e4f73",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Units.dirichletUnitTheorem.logEmbedding_component",
    "actualModule": "Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean",
    "actualLine": 91,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "05800241f09658240aaf15d8d96bf5db95134062a0c55d96964cccae20dc366c",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Units.dirichletUnitTheorem.logEmbedding_eq_zero_iff",
    "actualModule": "Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean",
    "actualLine": 113,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "05800241f09658240aaf15d8d96bf5db95134062a0c55d96964cccae20dc366c",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Units.exist_unique_eq_mul_prod",
    "actualModule": "Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean",
    "actualLine": 506,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "05800241f09658240aaf15d8d96bf5db95134062a0c55d96964cccae20dc366c",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Units.finrank_eq",
    "actualModule": "Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean",
    "actualLine": 462,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "05800241f09658240aaf15d8d96bf5db95134062a0c55d96964cccae20dc366c",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Units.fundSystem",
    "actualModule": "Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean",
    "actualLine": 476,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "05800241f09658240aaf15d8d96bf5db95134062a0c55d96964cccae20dc366c",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Units.isMaxRank_fundSystem",
    "actualModule": "Mathlib/NumberTheory/NumberField/Units/Regulator.lean",
    "actualLine": 268,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "ed32349527de7a8098b2d644c3ed24a31025047449da48e7e97676888d0e4f73",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Units.logEmbedding",
    "actualModule": "Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean",
    "actualLine": 84,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "05800241f09658240aaf15d8d96bf5db95134062a0c55d96964cccae20dc366c",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Units.norm",
    "actualModule": "Mathlib/NumberTheory/NumberField/Units/Basic.lean",
    "actualLine": 129,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f02c4bd80ac3e37ee23a88f285e92900281086905dac10a6422216aede297482",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Units.rank",
    "actualModule": "Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean",
    "actualLine": 359,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "05800241f09658240aaf15d8d96bf5db95134062a0c55d96964cccae20dc366c",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Units.sum_mult_mul_log",
    "actualModule": "Mathlib/NumberTheory/NumberField/Units/Basic.lean",
    "actualLine": 138,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f02c4bd80ac3e37ee23a88f285e92900281086905dac10a6422216aede297482",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Units.torsion",
    "actualModule": "Mathlib/NumberTheory/NumberField/Units/Basic.lean",
    "actualLine": 146,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f02c4bd80ac3e37ee23a88f285e92900281086905dac10a6422216aede297482",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.Units.unitLattice",
    "actualModule": "Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean",
    "actualLine": 174,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "05800241f09658240aaf15d8d96bf5db95134062a0c55d96964cccae20dc366c",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.absLogHeight₁",
    "actualModule": "Mathlib/NumberTheory/Height/NumberField.lean",
    "actualLine": 146,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d7712fffae0cb869a560439bfaaa3e6fbe5badba9d6d52a293b62f9423d81883",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.absMulHeight₁",
    "actualModule": "Mathlib/NumberTheory/Height/NumberField.lean",
    "actualLine": 137,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d7712fffae0cb869a560439bfaaa3e6fbe5badba9d6d52a293b62f9423d81883",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.classNumber",
    "actualModule": "Mathlib/NumberTheory/NumberField/ClassNumber.lean",
    "actualLine": 64,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "623fa7f3b56fc3609c5a2b2fc7b4015bd5dffba7a8453ef66bbb44e23e0425af",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.exists_conjugate_one_le_norm",
    "actualModule": "Mathlib/NumberTheory/NumberField/House.lean",
    "actualLine": 73,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "6ab06070828026afb24c4d1816e59c4441ca6a3e6a3bb21e8aff0f81de573be6",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.finite_setOfPred_logHeight₁_le",
    "actualModule": "Mathlib/NumberTheory/Height/NumberField.lean",
    "actualLine": 432,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d7712fffae0cb869a560439bfaaa3e6fbe5badba9d6d52a293b62f9423d81883",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.finite_setOfPred_mulHeight₁_le",
    "actualModule": "Mathlib/NumberTheory/Height/NumberField.lean",
    "actualLine": 411,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d7712fffae0cb869a560439bfaaa3e6fbe5badba9d6d52a293b62f9423d81883",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.house",
    "actualModule": "Mathlib/NumberTheory/NumberField/House.lean",
    "actualLine": 39,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "6ab06070828026afb24c4d1816e59c4441ca6a3e6a3bb21e8aff0f81de573be6",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.house.exists_ne_zero_int_vec_house_le",
    "actualModule": "Mathlib/NumberTheory/NumberField/House.lean",
    "actualLine": 343,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "6ab06070828026afb24c4d1816e59c4441ca6a3e6a3bb21e8aff0f81de573be6",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.house_add_le",
    "actualModule": "Mathlib/NumberTheory/NumberField/House.lean",
    "actualLine": 58,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "6ab06070828026afb24c4d1816e59c4441ca6a3e6a3bb21e8aff0f81de573be6",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.house_eq_sup'",
    "actualModule": "Mathlib/NumberTheory/NumberField/House.lean",
    "actualLine": 42,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "6ab06070828026afb24c4d1816e59c4441ca6a3e6a3bb21e8aff0f81de573be6",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.house_mul_le",
    "actualModule": "Mathlib/NumberTheory/NumberField/House.lean",
    "actualLine": 52,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "6ab06070828026afb24c4d1816e59c4441ca6a3e6a3bb21e8aff0f81de573be6",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.house_nat_mul",
    "actualModule": "Mathlib/NumberTheory/NumberField/House.lean",
    "actualLine": 64,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "6ab06070828026afb24c4d1816e59c4441ca6a3e6a3bb21e8aff0f81de573be6",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.house_pow_le",
    "actualModule": "Mathlib/NumberTheory/NumberField/House.lean",
    "actualLine": 61,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "6ab06070828026afb24c4d1816e59c4441ca6a3e6a3bb21e8aff0f81de573be6",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.instAdmissibleAbsValues",
    "actualModule": "Mathlib/NumberTheory/Height/NumberField.lean",
    "actualLine": 78,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d7712fffae0cb869a560439bfaaa3e6fbe5badba9d6d52a293b62f9423d81883",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.isUnit_iff_norm",
    "actualModule": "Mathlib/NumberTheory/NumberField/Units/Basic.lean",
    "actualLine": 59,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f02c4bd80ac3e37ee23a88f285e92900281086905dac10a6422216aede297482",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.logHeight₁_eq",
    "actualModule": "Mathlib/NumberTheory/Height/NumberField.lean",
    "actualLine": 120,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d7712fffae0cb869a560439bfaaa3e6fbe5badba9d6d52a293b62f9423d81883",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.mixedEmbedding",
    "actualModule": "Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean",
    "actualLine": 191,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "79467a7873a64a9cb6f47296f8ad6373559f0990c6d860a9384f93cf903f5109",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.mulHeight_eq",
    "actualModule": "Mathlib/NumberTheory/Height/NumberField.lean",
    "actualLine": 128,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d7712fffae0cb869a560439bfaaa3e6fbe5badba9d6d52a293b62f9423d81883",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.mulHeight₁_eq",
    "actualModule": "Mathlib/NumberTheory/Height/NumberField.lean",
    "actualLine": 112,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d7712fffae0cb869a560439bfaaa3e6fbe5badba9d6d52a293b62f9423d81883",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.natDenominator_le_mulHeight₁",
    "actualModule": "Mathlib/NumberTheory/Height/NumberField.lean",
    "actualLine": 324,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d7712fffae0cb869a560439bfaaa3e6fbe5badba9d6d52a293b62f9423d81883",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.norm_embedding_le_house",
    "actualModule": "Mathlib/NumberTheory/NumberField/House.lean",
    "actualLine": 83,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "6ab06070828026afb24c4d1816e59c4441ca6a3e6a3bb21e8aff0f81de573be6",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.norm_norm_le_norm_mul_house_pow",
    "actualModule": "Mathlib/NumberTheory/NumberField/House.lean",
    "actualLine": 95,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "6ab06070828026afb24c4d1816e59c4441ca6a3e6a3bb21e8aff0f81de573be6",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.one_le_house_of_isIntegral",
    "actualModule": "Mathlib/NumberTheory/NumberField/House.lean",
    "actualLine": 88,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "6ab06070828026afb24c4d1816e59c4441ca6a3e6a3bb21e8aff0f81de573be6",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.prod_abs_eq_one",
    "actualModule": "Mathlib/NumberTheory/NumberField/ProductFormula.lean",
    "actualLine": 98,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2e455921e3500a75dae3095965c88c49788334e57e724b470afe8dd5455e0a0f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.totalWeight_eq_finrank",
    "actualModule": "Mathlib/NumberTheory/Height/NumberField.lean",
    "actualLine": 158,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d7712fffae0cb869a560439bfaaa3e6fbe5badba9d6d52a293b62f9423d81883",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:PadicAlgCl",
    "actualModule": "Mathlib/NumberTheory/Padics/Complex.lean",
    "actualLine": 54,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "871e53b99b7b974bdd68a596d91663eef37ebb2bb9585511f6ca841a909dbfe6",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:PadicAlgCl.norm_extends",
    "actualModule": "Mathlib/NumberTheory/Padics/Complex.lean",
    "actualLine": 81,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "871e53b99b7b974bdd68a596d91663eef37ebb2bb9585511f6ca841a909dbfe6",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:PerfectField.separable_iff_squarefree",
    "actualModule": "Mathlib/FieldTheory/Perfect.lean",
    "actualLine": 327,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "557a6c6312edd40b889d07a9546a0d97bca53abcc08db3a778137aca7de59fe0",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.C_leadingCoeff_mul_prod_multiset_X_sub_C",
    "actualModule": "Mathlib/Algebra/Polynomial/Roots.lean",
    "actualLine": 858,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "df0438048d5298d3dc6cc2f7ff032564991f19aed29142596d4a13e21e94685a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.Gal.galActionHom",
    "actualModule": "Mathlib/FieldTheory/PolynomialGaloisGroup.lean",
    "actualLine": 204,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f23ac7e91d2374d28f4875a90e5c8f124b0331806f72dad054c6dc15006875a2",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.IsPrimitive",
    "actualModule": "Mathlib/RingTheory/Polynomial/Content.lean",
    "actualLine": 45,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "85bf1eb66f427594255629fc47c138aa63a1eed1fff47edb7edc56594b5a4a51",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.IsPrimitive.Int.dvd_iff_map_cast_dvd_map_cast",
    "actualModule": "Mathlib/RingTheory/Polynomial/GaussLemma.lean",
    "actualLine": 324,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "df5e74401f4d1d03635fd82228b6efab30366d870e68d98ba31f41ef2d59cc38",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.IsPrimitive.Int.irreducible_iff_irreducible_map_cast",
    "actualModule": "Mathlib/RingTheory/Polynomial/GaussLemma.lean",
    "actualLine": 320,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "df5e74401f4d1d03635fd82228b6efab30366d870e68d98ba31f41ef2d59cc38",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.IsRoot.norm_lt_cauchyBound",
    "actualModule": "Mathlib/Analysis/Polynomial/CauchyBound.lean",
    "actualLine": 74,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f32318b89ebee05d372fe2b7242a7568707e7a3d89fe68b64ec0a92a51de5b74",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.Splits.roots_map_of_injective",
    "actualModule": "Mathlib/Algebra/Polynomial/Splits.lean",
    "actualLine": 389,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "6ada6592a269c78621347db36d99c0e22ad0d1e9002381b4cad5c864234f328f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.SplittingField",
    "actualModule": "Mathlib/FieldTheory/SplittingField/Construction.lean",
    "actualLine": 213,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "4dfab31fd94128cbc7f9c3efec8c7e3100ce15a27eac80f135cd05d4f9f36821",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.SplittingField.splits",
    "actualModule": "Mathlib/FieldTheory/SplittingField/Construction.lean",
    "actualLine": 273,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "4dfab31fd94128cbc7f9c3efec8c7e3100ce15a27eac80f135cd05d4f9f36821",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.aeval_iterate_derivative_of_lt",
    "actualModule": "Mathlib/Algebra/Polynomial/SumIteratedDerivative.lean",
    "actualLine": 123,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "374a33473eb3325efec6c49849e1c05355965cc25daa1f634336d27fc9ff24cc",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.aeval_iterate_derivative_self",
    "actualModule": "Mathlib/Algebra/Polynomial/SumIteratedDerivative.lean",
    "actualLine": 135,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "374a33473eb3325efec6c49849e1c05355965cc25daa1f634336d27fc9ff24cc",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.aroots",
    "actualModule": "Mathlib/Algebra/Polynomial/Roots.lean",
    "actualLine": 481,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "df0438048d5298d3dc6cc2f7ff032564991f19aed29142596d4a13e21e94685a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.card_roots'",
    "actualModule": "Mathlib/Algebra/Polynomial/Roots.lean",
    "actualLine": 80,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "df0438048d5298d3dc6cc2f7ff032564991f19aed29142596d4a13e21e94685a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.coeToPowerSeries.ringHom",
    "actualModule": "Mathlib/RingTheory/PowerSeries/Basic.lean",
    "actualLine": 836,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero",
    "actualModule": "Mathlib/Algebra/Polynomial/Roots.lean",
    "actualLine": 739,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "df0438048d5298d3dc6cc2f7ff032564991f19aed29142596d4a13e21e94685a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.eval_homogenize",
    "actualModule": "Mathlib/Algebra/Polynomial/Homogenize.lean",
    "actualLine": 227,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f2ee61f9a91769032bdb5efe9c6eee179a12074b43f0ec9072531c5348849af4",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.eval_map",
    "actualModule": "Mathlib/Algebra/Polynomial/Eval/Defs.lean",
    "actualLine": 577,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "324a019feeb6134861ed550dcbdff5425ff062b8894024ef852643d5dc873a7b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.exists_eq_pow_rootMultiplicity_mul_and_not_dvd",
    "actualModule": "Mathlib/Algebra/Polynomial/Div.lean",
    "actualLine": 552,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "55643f2d280dd81192e4486aad6a0fdacbcc0395bdc66ac7b806a263521d57b8",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.exists_iterate_derivative_eq_factorial_smul",
    "actualModule": "Mathlib/Algebra/Polynomial/SumIteratedDerivative.lean",
    "actualLine": 108,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "374a33473eb3325efec6c49849e1c05355965cc25daa1f634336d27fc9ff24cc",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.factorial_smul_hasseDeriv",
    "actualModule": "Mathlib/Algebra/Polynomial/HasseDeriv.lean",
    "actualLine": 133,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "04242cc80edd28f65a4510281a3321cba611d5c3583d8c1c9f06aad11a4bc343",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.finite_mahlerMeasure_le",
    "actualModule": "Mathlib/NumberTheory/MahlerMeasure.lean",
    "actualLine": 107,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "139fec8ac5b9f3faf8b48f6c7bedc2c2e26da14e4c504cfc86272660e8ca07b2",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.gaussNorm",
    "actualModule": "Mathlib/RingTheory/Polynomial/GaussNorm.lean",
    "actualLine": 54,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "464c530dfed29c3909f957c5bea27f5c35bf2567ce848c9de21bea0addadf575",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.gaussNorm_C",
    "actualModule": "Mathlib/RingTheory/Polynomial/GaussNorm.lean",
    "actualLine": 70,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "464c530dfed29c3909f957c5bea27f5c35bf2567ce848c9de21bea0addadf575",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.gaussNorm_mul",
    "actualModule": "Mathlib/RingTheory/Polynomial/GaussNorm.lean",
    "actualLine": 276,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "464c530dfed29c3909f957c5bea27f5c35bf2567ce848c9de21bea0addadf575",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.hasseDeriv",
    "actualModule": "Mathlib/Algebra/Polynomial/HasseDeriv.lean",
    "actualLine": 59,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "04242cc80edd28f65a4510281a3321cba611d5c3583d8c1c9f06aad11a4bc343",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.hasseDeriv_coeff",
    "actualModule": "Mathlib/Algebra/Polynomial/HasseDeriv.lean",
    "actualLine": 67,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "04242cc80edd28f65a4510281a3321cba611d5c3583d8c1c9f06aad11a4bc343",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.hasseDeriv_mul",
    "actualModule": "Mathlib/Algebra/Polynomial/HasseDeriv.lean",
    "actualLine": 211,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "04242cc80edd28f65a4510281a3321cba611d5c3583d8c1c9f06aad11a4bc343",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.homogenize",
    "actualModule": "Mathlib/Algebra/Polynomial/Homogenize.lean",
    "actualLine": 40,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f2ee61f9a91769032bdb5efe9c6eee179a12074b43f0ec9072531c5348849af4",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.homogenize_finsetProd",
    "actualModule": "Mathlib/Algebra/Polynomial/Homogenize.lean",
    "actualLine": 187,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f2ee61f9a91769032bdb5efe9c6eee179a12074b43f0ec9072531c5348849af4",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.integralNormalization",
    "actualModule": "Mathlib/RingTheory/Polynomial/IntegralNormalization.lean",
    "actualLine": 39,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "a5e81db8ff004d14a7bedd95c46d31f122554b68cc1b9936d876273f243121c1",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.integralNormalization_aeval_eq_zero",
    "actualModule": "Mathlib/RingTheory/Polynomial/IntegralNormalization.lean",
    "actualLine": 174,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "a5e81db8ff004d14a7bedd95c46d31f122554b68cc1b9936d876273f243121c1",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.isPrimitive_iff_forall_gaussNorm_eq_one",
    "actualModule": "Mathlib/RingTheory/DedekindDomain/GaussLemma.lean",
    "actualLine": 68,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2b858b6d9921996eb16b72a1380a48ba42f668eddf782bcc85299b34e88abfe7",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.isPrimitive_primPart",
    "actualModule": "Mathlib/RingTheory/Polynomial/Content.lean",
    "actualLine": 239,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "85bf1eb66f427594255629fc47c138aa63a1eed1fff47edb7edc56594b5a4a51",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.lt_rootMultiplicity_iff_isRoot_iterate_derivative",
    "actualModule": "Mathlib/Algebra/Polynomial/FieldDivision.lean",
    "actualLine": 174,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "be6ce05e85d9fc85537bc8a56f3fa07c3be27f81b8e48151c32ba116ca32d5fb",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.mahlerMeasure",
    "actualModule": "Mathlib/Analysis/Polynomial/MahlerMeasure.lean",
    "actualLine": 81,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5df0515e105ef3ff3534aa0177ad6ed6856419eb33b96143c004257f9b7f91f7",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots",
    "actualModule": "Mathlib/Analysis/Polynomial/MahlerMeasure.lean",
    "actualLine": 224,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5df0515e105ef3ff3534aa0177ad6ed6856419eb33b96143c004257f9b7f91f7",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.mahlerMeasure_le_sqrt_natDegree_add_one_mul_supNorm",
    "actualModule": "Mathlib/Analysis/Polynomial/MahlerMeasure.lean",
    "actualLine": 346,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5df0515e105ef3ff3534aa0177ad6ed6856419eb33b96143c004257f9b7f91f7",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.mahlerMeasure_le_sqrt_sum_sq_norm_coeff",
    "actualModule": "Mathlib/Analysis/Polynomial/MahlerMeasure.lean",
    "actualLine": 300,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5df0515e105ef3ff3534aa0177ad6ed6856419eb33b96143c004257f9b7f91f7",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.mahlerMeasure_le_sum_norm_coeff",
    "actualModule": "Mathlib/Analysis/Polynomial/MahlerMeasure.lean",
    "actualLine": 263,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5df0515e105ef3ff3534aa0177ad6ed6856419eb33b96143c004257f9b7f91f7",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.mahlerMeasure_mul",
    "actualModule": "Mathlib/Analysis/Polynomial/MahlerMeasure.lean",
    "actualLine": 126,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5df0515e105ef3ff3534aa0177ad6ed6856419eb33b96143c004257f9b7f91f7",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.mapMahlerMeasure",
    "actualModule": "Mathlib/Analysis/Polynomial/MahlerMeasure.lean",
    "actualLine": 459,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5df0515e105ef3ff3534aa0177ad6ed6856419eb33b96143c004257f9b7f91f7",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.natDegree_derivative_lt",
    "actualModule": "Mathlib/Algebra/Polynomial/Derivative.lean",
    "actualLine": 172,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "ab04d4335576e18032f8ed2c15f5bea04a9e0f44bcf15e5ac398a78a3056a5bb",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.natDegree_wronskian_lt_add",
    "actualModule": "Mathlib/RingTheory/Polynomial/Wronskian.lean",
    "actualLine": 111,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "b1e2c805fa0879d3adf32484a5e61746fa239dc6d0878cbab50ef1df4d41819a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.nodup_roots",
    "actualModule": "Mathlib/FieldTheory/Separable.lean",
    "actualLine": 289,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "e2dcc1b5d2115b14a25404cb188bd0e5cadb96d30e57b4dcba2abad77398fce1",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.norm_coeff_le_choose_mul_mahlerMeasure",
    "actualModule": "Mathlib/Analysis/Polynomial/MahlerMeasure.lean",
    "actualLine": 359,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5df0515e105ef3ff3534aa0177ad6ed6856419eb33b96143c004257f9b7f91f7",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.pow_eq_one_of_mahlerMeasure_eq_one",
    "actualModule": "Mathlib/NumberTheory/MahlerMeasure.lean",
    "actualLine": 180,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "139fec8ac5b9f3faf8b48f6c7bedc2c2e26da14e4c504cfc86272660e8ca07b2",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.pow_rootMultiplicity_dvd",
    "actualModule": "Mathlib/Algebra/Polynomial/Div.lean",
    "actualLine": 539,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "55643f2d280dd81192e4486aad6a0fdacbcc0395bdc66ac7b806a263521d57b8",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.primPart",
    "actualModule": "Mathlib/RingTheory/Polynomial/Content.lean",
    "actualLine": 227,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "85bf1eb66f427594255629fc47c138aa63a1eed1fff47edb7edc56594b5a4a51",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.rootMultiplicity",
    "actualModule": "Mathlib/Algebra/Polynomial/Div.lean",
    "actualLine": 498,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "55643f2d280dd81192e4486aad6a0fdacbcc0395bdc66ac7b806a263521d57b8",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.le_rootMultiplicity_iff",
    "actualModule": "Mathlib/Algebra/Polynomial/FieldDivision.lean",
    "actualLine": 560,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "be6ce05e85d9fc85537bc8a56f3fa07c3be27f81b8e48151c32ba116ca32d5fb",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.sumIDeriv",
    "actualModule": "Mathlib/Algebra/Polynomial/SumIteratedDerivative.lean",
    "actualLine": 62,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "374a33473eb3325efec6c49849e1c05355965cc25daa1f634336d27fc9ff24cc",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.sumIDeriv_map",
    "actualModule": "Mathlib/Algebra/Polynomial/SumIteratedDerivative.lean",
    "actualLine": 90,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "374a33473eb3325efec6c49849e1c05355965cc25daa1f634336d27fc9ff24cc",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.supNorm",
    "actualModule": "Mathlib/Analysis/Polynomial/Norm.lean",
    "actualLine": 53,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2be306c668562ecd87221c2e60abac1e8a05349bd1b487c36313574dab444c0a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.supNorm_le_choose_natDegree_div_two_mul_mahlerMeasure",
    "actualModule": "Mathlib/Analysis/Polynomial/MahlerMeasure.lean",
    "actualLine": 407,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5df0515e105ef3ff3534aa0177ad6ed6856419eb33b96143c004257f9b7f91f7",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.taylor",
    "actualModule": "Mathlib/Algebra/Polynomial/Taylor.lean",
    "actualLine": 38,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f2e00e9e019758d44ff9dc496a578942fee22a0c2c15cbf8c78d97e9509e56cd",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.taylor_coeff",
    "actualModule": "Mathlib/Algebra/Polynomial/Taylor.lean",
    "actualLine": 68,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f2e00e9e019758d44ff9dc496a578942fee22a0c2c15cbf8c78d97e9509e56cd",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.toMvPolynomial",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Equiv.lean",
    "actualLine": 880,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "95d16cfe9945f3f4b9a39f83afcf3ffbf264c62fb3acaee53b8499dfd54960c0",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.wronskian",
    "actualModule": "Mathlib/RingTheory/Polynomial/Wronskian.lean",
    "actualLine": 43,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "b1e2c805fa0879d3adf32484a5e61746fa239dc6d0878cbab50ef1df4d41819a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:PowerSeries.coeff_mul",
    "actualModule": "Mathlib/RingTheory/PowerSeries/Basic.lean",
    "actualLine": 249,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1df242ac321d5a93334dcf736f6c00b962a7a12d327af1975f8e40ebeff811fd",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:PowerSeries.derivative",
    "actualModule": "Mathlib/RingTheory/PowerSeries/Derivative.lean",
    "actualLine": 50,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "bc357a0ecb10539ec8af9c11b7a074a785abce798a5ff032c3b531643f6c39f9",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:PowerSeries.exp",
    "actualModule": "Mathlib/RingTheory/PowerSeries/Exp.lean",
    "actualLine": 49,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "ab5f250ee7bf1347bd74a29e72ad282f028ca93e585c0945b43faea67d08ed24",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:PowerSeries.subst",
    "actualModule": "Mathlib/RingTheory/PowerSeries/Substitution.lean",
    "actualLine": 158,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "6442dc150c2f686e966a3645a5d23885cd69598ec7b117047f14dfa643dade16",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun",
    "actualModule": "Mathlib/Probability/Moments/SubGaussian.lean",
    "actualLine": 780,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "e3302a51ed064b2c45fb405158a875cca3276cdd30951269e29ed88f10e631e7",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc",
    "actualModule": "Mathlib/Probability/Moments/SubGaussian.lean",
    "actualLine": 860,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "e3302a51ed064b2c45fb405158a875cca3276cdd30951269e29ed88f10e631e7",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Rat.HeightOneSpectrum.primesEquiv",
    "actualModule": "Mathlib/NumberTheory/Padics/HeightOneSpectrum.lean",
    "actualLine": 110,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "37fd8c91fafae37c9aa3c84eeb24936efb7ae5e90f8032224b4e4c2c1e4ee2eb",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Rat.iSup_finitePlace_apply_eq_one_of_gcd_eq_one",
    "actualModule": "Mathlib/NumberTheory/Height/NumberField.lean",
    "actualLine": 486,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d7712fffae0cb869a560439bfaaa3e6fbe5badba9d6d52a293b62f9423d81883",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Rat.mulHeight_eq_max_abs_of_gcd_eq_one",
    "actualModule": "Mathlib/NumberTheory/Height/NumberField.lean",
    "actualLine": 503,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d7712fffae0cb869a560439bfaaa3e6fbe5badba9d6d52a293b62f9423d81883",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Rat.mulHeight₁_eq_max",
    "actualModule": "Mathlib/NumberTheory/Height/NumberField.lean",
    "actualLine": 533,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d7712fffae0cb869a560439bfaaa3e6fbe5badba9d6d52a293b62f9423d81883",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:RatFunc",
    "actualModule": "Mathlib/FieldTheory/RatFunc/Defs.lean",
    "actualLine": 67,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "161a048ebc144141963a0a93930c30c3aa5aca51f0f05152118872b540275347",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:RatFunc.denom",
    "actualModule": "Mathlib/FieldTheory/RatFunc/Basic.lean",
    "actualLine": 935,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "eae3abf1c43a4123891fc0b204e16b2bfe41d0f3374bbd3a8b71f180a6321901",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Real.abs_exp_sub_one_sub_id_le",
    "actualModule": "Mathlib/Analysis/Complex/Exponential.lean",
    "actualLine": 537,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d27425575f2e2b71072c952ce38dced80e97498900b83d1da5d7c623adaeac4e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Real.add_one_le_exp",
    "actualModule": "Mathlib/Analysis/Complex/Exponential.lean",
    "actualLine": 632,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d27425575f2e2b71072c952ce38dced80e97498900b83d1da5d7c623adaeac4e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Real.convergent",
    "actualModule": "Mathlib/NumberTheory/DiophantineApproximation/Basic.lean",
    "actualLine": 323,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "abc84df69b88508535f62fd151f496b3587000aca07e5e3a2f098ce3ffb6b87d",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Real.convs_eq_convergent",
    "actualModule": "Mathlib/NumberTheory/DiophantineApproximation/ContinuedFractions.lean",
    "actualLine": 38,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "bf321024753de2c3f2cf80db5135540666784633e9a841aabbeb011387d9549f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Real.exists_int_int_abs_mul_sub_le",
    "actualModule": "Mathlib/NumberTheory/DiophantineApproximation/Basic.lean",
    "actualLine": 95,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "abc84df69b88508535f62fd151f496b3587000aca07e5e3a2f098ce3ffb6b87d",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Real.exists_rat_abs_sub_le_and_den_le",
    "actualModule": "Mathlib/NumberTheory/DiophantineApproximation/Basic.lean",
    "actualLine": 147,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "abc84df69b88508535f62fd151f496b3587000aca07e5e3a2f098ce3ffb6b87d",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Real.exists_rat_eq_convergent",
    "actualModule": "Mathlib/NumberTheory/DiophantineApproximation/Basic.lean",
    "actualLine": 538,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "abc84df69b88508535f62fd151f496b3587000aca07e5e3a2f098ce3ffb6b87d",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Real.exp_ne_zero",
    "actualModule": "Mathlib/Analysis/Complex/Exponential.lean",
    "actualLine": 237,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d27425575f2e2b71072c952ce38dced80e97498900b83d1da5d7c623adaeac4e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Real.finrank_eq_int_finrank_of_discrete",
    "actualModule": "Mathlib/Algebra/Module/ZLattice/Basic.lean",
    "actualLine": 659,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "84ad8094205020f08da00e0370c8b0b9a7bf81e8c61ae9e1670b75a83f19c880",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Real.infinite_rat_abs_sub_lt_one_div_den_sq_of_irrational",
    "actualModule": "Mathlib/NumberTheory/DiophantineApproximation/Basic.lean",
    "actualLine": 197,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "abc84df69b88508535f62fd151f496b3587000aca07e5e3a2f098ce3ffb6b87d",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Real.log_le_sub_one_of_pos",
    "actualModule": "Mathlib/Analysis/SpecialFunctions/Log/Basic.lean",
    "actualLine": 307,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5c3ecb5112d5d46df46d3dff3efa1548095356259633b34885db8ab4275340a2",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Real.pi_ne_zero",
    "actualModule": "Mathlib/Analysis/SpecialFunctions/Trigonometric/Basic.lean",
    "actualLine": 166,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "95a967b7e1e11fbce6cfdaa0d8f88e1d0e4e5c9fb013dbaf2f3972d3efbf7352",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Real.rpow_def_of_pos",
    "actualModule": "Mathlib/Analysis/SpecialFunctions/Pow/Real.lean",
    "actualLine": 51,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5f4970fe329b14615ca6cfa3e0dcb0cf9d2017c98d2e3501237412aa2474e70b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:RingHom.toRatAlgHom",
    "actualModule": "Mathlib/Algebra/Algebra/Hom/Rat.lean",
    "actualLine": 25,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "6c35b118fe985289555a847bcc2076afb04a5476379717e15b3150450b0c07ee",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Set.unit",
    "actualModule": "Mathlib/RingTheory/DedekindDomain/SInteger.lean",
    "actualLine": 108,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d5fc0cf09bf6f642248bcb0afa5c1d61f094b714250c0a23d723aca57fdcb1f6",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Subgroup.FG",
    "actualModule": "Mathlib/GroupTheory/Finiteness.lean",
    "actualLine": 303,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "b07ea088766fcf0954199acfe91fc63d00737c0f6401c9b28fd8fb1ee2a8134e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Submodule",
    "actualModule": "Mathlib/Algebra/Module/Submodule/Defs.lean",
    "actualLine": 41,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f1735fb71af000fc2047c5e6456fa2b31d0f5443d23a169ac25a6ce388fe2b78",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Submodule.IsPrincipal",
    "actualModule": "Mathlib/LinearAlgebra/Span/Defs.lean",
    "actualLine": 51,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "85ab3958143d9d498abcc3dc17b63cb585602e812039c5af89b7be98d78532c8",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Submodule.span",
    "actualModule": "Mathlib/LinearAlgebra/Span/Defs.lean",
    "actualLine": 46,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "85ab3958143d9d498abcc3dc17b63cb585602e812039c5af89b7be98d78532c8",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Transcendental",
    "actualModule": "Mathlib/RingTheory/Algebraic/Defs.lean",
    "actualLine": 49,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "4c25b9f55ecd629a00eac8b686e553fb27bd6d48dc10fef02cf65d0d7bc3a134",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:TwoUniqueProds.toUniqueProds",
    "actualModule": "Mathlib/Algebra/Group/UniqueProds/Basic.lean",
    "actualLine": 270,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "e0532ecd6841ad55da1cb32f7d0270d98750d7791bd61901c5750966840ef25b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:UniqueFactorizationMonoid.fintypeSubtypeDvd",
    "actualModule": "Mathlib/RingTheory/UniqueFactorizationDomain/Finite.lean",
    "actualLine": 31,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "374d3706eb469a58fdf0e3680096ade5fc0cbc02b517024461115791bc85882d",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:ZSpan.floor",
    "actualModule": "Mathlib/Algebra/Module/ZLattice/Basic.lean",
    "actualLine": 125,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "84ad8094205020f08da00e0370c8b0b9a7bf81e8c61ae9e1670b75a83f19c880",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:ZSpan.fract_apply",
    "actualModule": "Mathlib/Algebra/Module/ZLattice/Basic.lean",
    "actualLine": 166,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "84ad8094205020f08da00e0370c8b0b9a7bf81e8c61ae9e1670b75a83f19c880",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:ZSpan.norm_fract_le",
    "actualModule": "Mathlib/Algebra/Module/ZLattice/Basic.lean",
    "actualLine": 212,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "84ad8094205020f08da00e0370c8b0b9a7bf81e8c61ae9e1670b75a83f19c880",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:ae_not_liouvilleWith",
    "actualModule": "Mathlib/NumberTheory/Transcendental/Liouville/Measure.lean",
    "actualLine": 115,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "0ea118e6f0767bd4dcf10072059c872800140adf69259fa4b4e5352b46255baf",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:algebraicIndependent_iff",
    "actualModule": "Mathlib/RingTheory/AlgebraicIndependent/Defs.lean",
    "actualLine": 63,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "057b6f961fd870a3bb4f53f9e5449dd452dcaa80c4d7a66cef1412f54185b4c4",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:analyticOrderAt_eq_nat_iff_iteratedDeriv_eq_zero",
    "actualModule": "Mathlib/Analysis/Analytic/Order.lean",
    "actualLine": 457,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1ddcb725d6b05d11b582d7f62a9650131edf4a1324e65c81081aae20ca982246",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:analyticOrderAt_eq_top",
    "actualModule": "Mathlib/Analysis/Analytic/Order.lean",
    "actualLine": 75,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1ddcb725d6b05d11b582d7f62a9650131edf4a1324e65c81081aae20ca982246",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:analyticOrderAt_mul",
    "actualModule": "Mathlib/Analysis/Analytic/Order.lean",
    "actualLine": 509,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1ddcb725d6b05d11b582d7f62a9650131edf4a1324e65c81081aae20ca982246",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:dotProduct",
    "actualModule": "Mathlib/Data/Matrix/Mul.lean",
    "actualLine": 72,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "b770bcc914584d4b04065b2d05f50b4eb098709a7fd367adad0e055dfc9d6d0e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:exists_deriv_eq_zero",
    "actualModule": "Mathlib/Analysis/Calculus/LocalExtr/Rolle.lean",
    "actualLine": 61,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "30e76f2c08ee6d0f19c6eeb93f2484154accb9862b4563d040664efa32f0057b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:exists_integral_inj_algHom_of_fg",
    "actualModule": "Mathlib/RingTheory/NoetherNormalization.lean",
    "actualLine": 274,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "8dc5ce3ea3a4f866420ccbc4f2ae21ff8cbc0061754d7e3e3308615e57b9970b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:exists_isTranscendenceBasis",
    "actualModule": "Mathlib/RingTheory/AlgebraicIndependent/TranscendenceBasis.lean",
    "actualLine": 58,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "e55c683c5d63e14eb46e0fab7d53f8122ae1e7f24361561c112216317302ff4b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:forall_liouvilleWith_iff",
    "actualModule": "Mathlib/NumberTheory/Transcendental/Liouville/LiouvilleWith.lean",
    "actualLine": 335,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "aca4e066cc4cb66c731f13acb8b725ee68858cc8b9046ed232d6c69d5a9352aa",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:hasFDerivAt_integral_of_dominated_of_fderiv_le",
    "actualModule": "Mathlib/Analysis/Calculus/ParametricIntegral.lean",
    "actualLine": 210,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "495f1a89774b147de1528e0213f519817d50fc3602724c9cbea633e9617c3375",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:intervalIntegral.integral_eq_sub_of_hasDerivAt",
    "actualModule": "Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean",
    "actualLine": 1148,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5fd64054d9ae8bfce585ff809933a756bcf2d224ef144ae24c8fe8870c68050c",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:intervalIntegral.norm_integral_le_of_norm_le_const",
    "actualModule": "Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean",
    "actualLine": 771,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "97e7a2efda146d0d1280f23d660cc07655dd7c48b51631752e9aa94deaa18ab9",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:irrational_pi",
    "actualModule": "Mathlib/Analysis/Real/Pi/Irrational.lean",
    "actualLine": 281,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "0c041eca65dd0f02330634e15db157fb07e79db045b078c8cc3bfd7b14c321cf",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:irrational_sqrt_two",
    "actualModule": "Mathlib/NumberTheory/Real/Irrational.lean",
    "actualLine": 145,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "b5b8fef319876fc584704ec0902863ab8016fe0ba4dee5dd358f86f4688b13cc",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:isAlgebraic_iff_isIntegral",
    "actualModule": "Mathlib/RingTheory/Algebraic/Integral.lean",
    "actualLine": 66,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d38705fa9b33a1c219472f65ade4392aecccb9cd3d3d1028021ffdc5993a7375",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:isIntegral_algHom_iff",
    "actualModule": "Mathlib/RingTheory/IntegralClosure/IsIntegral/Basic.lean",
    "actualLine": 79,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "8f4f47147ea5786a0140f9c443408bdd88e22cfc96ebbf1d224c474033f11c49",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:isIntegral_leadingCoeff_smul",
    "actualModule": "Mathlib/RingTheory/IntegralClosure/IsIntegralClosure/Basic.lean",
    "actualLine": 304,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "93c72646554b01f2e8ae6657a656b07e0b6aa6b9c792e7d0d3cef0de5dbc653e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:iteratedDeriv_cexp_const_mul",
    "actualModule": "Mathlib/Analysis/SpecialFunctions/ExpDeriv.lean",
    "actualLine": 210,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d73b5159fee4d0c7ed3f7ff31ffd091f13cfbaf0e0006cba696bb2413a16b597",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:iteratedDeriv_mul",
    "actualModule": "Mathlib/Analysis/Calculus/IteratedDeriv/Lemmas.lean",
    "actualLine": 420,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2938694d3f8f120a8c47d905efe4f8ab06579a3235d1a5a7d5a026c76e3bb797",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:linearIndependent_iff'",
    "actualModule": "Mathlib/LinearAlgebra/LinearIndependent/Defs.lean",
    "actualLine": 729,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "3fcdf0317742c6a001b5d01ffee498873c0998bf38e4e048bf24ddb01e109aff",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:linearIndependent_monoidHom",
    "actualModule": "Mathlib/LinearAlgebra/LinearIndependent/Basic.lean",
    "actualLine": 502,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "e0b9ddc89268abb33348324624b1bf03f1e6d2c60f149a1a1be45da01674fb3e",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:liouvilleWith_one",
    "actualModule": "Mathlib/NumberTheory/Transcendental/Liouville/LiouvilleWith.lean",
    "actualLine": 55,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "aca4e066cc4cb66c731f13acb8b725ee68858cc8b9046ed232d6c69d5a9352aa",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:liouville_liouvilleNumber",
    "actualModule": "Mathlib/NumberTheory/Transcendental/Liouville/LiouvilleNumber.lean",
    "actualLine": 176,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "bec474e5c8561a3858188a558e7d479ad4cf633f401abb802903f3d6f6119ab0",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:minpoly",
    "actualModule": "Mathlib/FieldTheory/Minpoly/Basic.lean",
    "actualLine": 41,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "62da5f62378f41b17f87b91110a97c0c4b514fe4ecce8d63500d78d854fecdda",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:minpoly.algHom_eq",
    "actualModule": "Mathlib/FieldTheory/Minpoly/Basic.lean",
    "actualLine": 69,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "62da5f62378f41b17f87b91110a97c0c4b514fe4ecce8d63500d78d854fecdda",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:minpoly.dvd",
    "actualModule": "Mathlib/FieldTheory/Minpoly/Field.lean",
    "actualLine": 69,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "ca3b5096bab21a1967ffa07168ccf13609c1b7aa67bc3f92078e674edc371269",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:minpoly.irreducible",
    "actualModule": "Mathlib/FieldTheory/Minpoly/Basic.lean",
    "actualLine": 269,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "62da5f62378f41b17f87b91110a97c0c4b514fe4ecce8d63500d78d854fecdda",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:natCast_le_analyticOrderAt_iff_iteratedDeriv_eq_zero",
    "actualModule": "Mathlib/Analysis/Analytic/Order.lean",
    "actualLine": 333,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1ddcb725d6b05d11b582d7f62a9650131edf4a1324e65c81081aae20ca982246",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:norm_image_sub_le_of_norm_deriv_le_segment_01'",
    "actualModule": "Mathlib/Analysis/Calculus/MeanValue.lean",
    "actualLine": 346,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "7e1e6f097fe92a2493ea5b4bc9a1896c850514604f26f863f812906fb500b856",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:padicNorm",
    "actualModule": "Mathlib/NumberTheory/Padics/PadicNorm.lean",
    "actualLine": 45,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "829e03829fb2887a25eae6bb38a892d1864675221e923ed5cd8ef6e4310658be",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:padicNorm.eq_zpow_of_nonzero",
    "actualModule": "Mathlib/NumberTheory/Padics/PadicNorm.lean",
    "actualLine": 56,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "829e03829fb2887a25eae6bb38a892d1864675221e923ed5cd8ef6e4310658be",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:padicNormE.eq_padic_norm'",
    "actualModule": "Mathlib/NumberTheory/Padics/PadicNumbers.lean",
    "actualLine": 659,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "cf6dade8de7e28f169ff639e1dc29950e34076df367765ba648de504f5808c08",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:padicValInt",
    "actualModule": "Mathlib/NumberTheory/Padics/PadicVal/Basic.lean",
    "actualLine": 90,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "caa95ad16873b4922b196ba217dcc41a684e42a688441a5841bfd6c43c84d707",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:padicValNat.pow_sub_pow",
    "actualModule": "Mathlib/NumberTheory/Multiplicity.lean",
    "actualLine": 375,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "96aff8b28e38246c2820f8ddf0610af8d5340cfbcc16d9334737832a4c31833a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:padicValRat",
    "actualModule": "Mathlib/NumberTheory/Padics/PadicVal/Basic.lean",
    "actualLine": 128,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "caa95ad16873b4922b196ba217dcc41a684e42a688441a5841bfd6c43c84d707",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:padicValRat.div",
    "actualModule": "Mathlib/NumberTheory/Padics/PadicVal/Basic.lean",
    "actualLine": 265,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "caa95ad16873b4922b196ba217dcc41a684e42a688441a5841bfd6c43c84d707",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:padicValRat.inv",
    "actualModule": "Mathlib/NumberTheory/Padics/PadicVal/Basic.lean",
    "actualLine": 253,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "caa95ad16873b4922b196ba217dcc41a684e42a688441a5841bfd6c43c84d707",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:padicValRat.mul",
    "actualModule": "Mathlib/NumberTheory/Padics/PadicVal/Basic.lean",
    "actualLine": 227,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "caa95ad16873b4922b196ba217dcc41a684e42a688441a5841bfd6c43c84d707",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:pow_card_eq_one",
    "actualModule": "Mathlib/GroupTheory/OrderOfElement.lean",
    "actualLine": 1223,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "338cd8fd86078ff1c852185399474d85bd2d11218c7c8c79a229cf21296e4650",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:pow_padicValNat_dvd",
    "actualModule": "Mathlib/Data/Nat/MaxPowDiv.lean",
    "actualLine": 138,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "0df9016de9c7bd74907f7cc95849412cb8ce514f6405e13dbf7fea5e5ddde5a9",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:ringKrullDim",
    "actualModule": "Mathlib/RingTheory/KrullDimension/Basic.lean",
    "actualLine": 29,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "8f13add369eccc487e8a64924cf065dc198bce4c7eb9207649f571349e008998",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:spectralNorm_unique_field_norm_ext",
    "actualModule": "Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean",
    "actualLine": 770,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "0d51edad9814143c5a50f959fe5acada1ec2e3e85a31340762de77b145606047",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:sub_smul_dslope",
    "actualModule": "Mathlib/Analysis/Calculus/DSlope.lean",
    "actualLine": 67,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f0a8f117b95d786c84c618e6d6ba2766bf833242cc120930217d500a7687a205",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:transcendental_liouvilleNumber",
    "actualModule": "Mathlib/NumberTheory/Transcendental/Liouville/LiouvilleNumber.lean",
    "actualLine": 191,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "bec474e5c8561a3858188a558e7d479ad4cf633f401abb802903f3d6f6119ab0",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Nat.lt_floor_add_one",
    "actualModule": "Mathlib/Algebra/Order/Floor/Semiring.lean",
    "actualLine": 63,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1b0e45f02a914287979a2f39feb3f5b4808bff05f49e5a998e718168c4e36efb",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Nat.le_floor_iff",
    "actualModule": "Mathlib/Algebra/Order/Floor/Defs.lean",
    "actualLine": 138,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f6cc4cbab72e40e7afadb67d625a720359c26b32b9293a72255df2018a7876f7",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Nat.floor_le",
    "actualModule": "Mathlib/Algebra/Order/Floor/Semiring.lean",
    "actualLine": 47,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1b0e45f02a914287979a2f39feb3f5b4808bff05f49e5a998e718168c4e36efb",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.count_roots",
    "actualModule": "Mathlib/Algebra/Polynomial/Roots.lean",
    "actualLine": 99,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "df0438048d5298d3dc6cc2f7ff032564991f19aed29142596d4a13e21e94685a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.finSuccEquiv",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Equiv.lean",
    "actualLine": 649,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "95d16cfe9945f3f4b9a39f83afcf3ffbf264c62fb3acaee53b8499dfd54960c0",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.finSuccEquiv_coeff_coeff",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Equiv.lean",
    "actualLine": 688,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "95d16cfe9945f3f4b9a39f83afcf3ffbf264c62fb3acaee53b8499dfd54960c0",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.natDegree_finSuccEquiv",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Equiv.lean",
    "actualLine": 815,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "95d16cfe9945f3f4b9a39f83afcf3ffbf264c62fb3acaee53b8499dfd54960c0",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.degreeOf_coeff_finSuccEquiv",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Equiv.lean",
    "actualLine": 834,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "95d16cfe9945f3f4b9a39f83afcf3ffbf264c62fb3acaee53b8499dfd54960c0",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.degreeOf_sum_le",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Degrees.lean",
    "actualLine": 303,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "324da5ed3561171acf4705e703157e001d193403571ea393d1b560cc334d4360",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.eval_polynomial_eval_finSuccEquiv",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Polynomial.lean",
    "actualLine": 31,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "43330a5e928a56af89b209101f98be347937384d2d435f875e2eaff698ccd650",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.IsWeightedHomogeneous",
    "actualModule": "Mathlib/RingTheory/MvPolynomial/WeightedHomogeneous.lean",
    "actualLine": 128,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2e6a01a2f03ae1d91348a8af28ee7df250f91cacd37f9089e616d875edd198fb",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.isWeightedHomogeneous_X",
    "actualModule": "Mathlib/RingTheory/MvPolynomial/WeightedHomogeneous.lean",
    "actualLine": 230,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2e6a01a2f03ae1d91348a8af28ee7df250f91cacd37f9089e616d875edd198fb",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.IsWeightedHomogeneous.C_mul",
    "actualModule": "Mathlib/RingTheory/MvPolynomial/WeightedHomogeneous.lean",
    "actualLine": 300,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2e6a01a2f03ae1d91348a8af28ee7df250f91cacd37f9089e616d875edd198fb",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.IsWeightedHomogeneous.sum",
    "actualModule": "Mathlib/RingTheory/MvPolynomial/WeightedHomogeneous.lean",
    "actualLine": 290,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2e6a01a2f03ae1d91348a8af28ee7df250f91cacd37f9089e616d875edd198fb",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.IsWeightedHomogeneous.pow",
    "actualModule": "Mathlib/RingTheory/MvPolynomial/WeightedHomogeneous.lean",
    "actualLine": 305,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2e6a01a2f03ae1d91348a8af28ee7df250f91cacd37f9089e616d875edd198fb",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.IsWeightedHomogeneous.prod",
    "actualModule": "Mathlib/RingTheory/MvPolynomial/WeightedHomogeneous.lean",
    "actualLine": 313,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2e6a01a2f03ae1d91348a8af28ee7df250f91cacd37f9089e616d875edd198fb",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Finsupp.instLocallyFiniteOrder",
    "actualModule": "Mathlib/Data/Finsupp/Interval.lean",
    "actualLine": 85,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "1eb2cb560c16222d8c20731ffe776b1344a8eacfc17384ab6e66ded182d22c08",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.eval₂_monomial",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Eval.lean",
    "actualLine": 92,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "617a2278665e02a00684f6f17b96f9925a473c54e456fc53eb6dae299c0fd89f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.eval_eval₂",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Eval.lean",
    "actualLine": 313,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "617a2278665e02a00684f6f17b96f9925a473c54e456fc53eb6dae299c0fd89f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.as_sum",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Basic.lean",
    "actualLine": 967,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "7b61c67ecb295e766b2fc1a3408e9a5dd22e75ed6fe4dd467675cb4b2551b4e2",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.degreeOf_le_iff",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Degrees.lean",
    "actualLine": 235,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "324da5ed3561171acf4705e703157e001d193403571ea393d1b560cc334d4360",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.eval₂Hom_eq_zero",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Eval.lean",
    "actualLine": 685,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "617a2278665e02a00684f6f17b96f9925a473c54e456fc53eb6dae299c0fd89f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.eval₂_congr",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Eval.lean",
    "actualLine": 226,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "617a2278665e02a00684f6f17b96f9925a473c54e456fc53eb6dae299c0fd89f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:LinearIndependent.ne_zero",
    "actualModule": "Mathlib/LinearAlgebra/LinearIndependent/Defs.lean",
    "actualLine": 153,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "3fcdf0317742c6a001b5d01ffee498873c0998bf38e4e048bf24ddb01e109aff",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:finProdFinEquiv",
    "actualModule": "Mathlib/Logic/Equiv/Fin/Basic.lean",
    "actualLine": 332,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2ac0956bbd9efbccdb576d4ba271575add94db22b8952f2e51304b18e7cd83ed",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Finset.prod_one_add",
    "actualModule": "Mathlib/Algebra/BigOperators/Ring/Finset.lean",
    "actualLine": 196,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "3260deb025880a9c56b258bc0d9c53106aab2452599141b1e1c8f5bb0f589aa3",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Module.Dual.finrank_ker_add_one_of_ne_zero",
    "actualModule": "Mathlib/LinearAlgebra/Dual/Lemmas.lean",
    "actualLine": 778,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "6f35690f4fdd81db8ecfaca36197ff19eea2b7f99e33b832c85536802c23710d",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.coeff_monomial_mul",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Basic.lean",
    "actualLine": 661,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "7b61c67ecb295e766b2fc1a3408e9a5dd22e75ed6fe4dd467675cb4b2551b4e2",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.coeff_monomial_mul'",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Basic.lean",
    "actualLine": 733,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "7b61c67ecb295e766b2fc1a3408e9a5dd22e75ed6fe4dd467675cb4b2551b4e2",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.eval_zero",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Eval.lean",
    "actualLine": 674,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "617a2278665e02a00684f6f17b96f9925a473c54e456fc53eb6dae299c0fd89f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.eval₂_sum",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Eval.lean",
    "actualLine": 236,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "617a2278665e02a00684f6f17b96f9925a473c54e456fc53eb6dae299c0fd89f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.funext",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Funext.lean",
    "actualLine": 82,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d20b2f428fce75d4009eede0c05b4e852269809b4327bbb104496ecfce4ee6cc",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.sumAlgEquiv",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Equiv.lean",
    "actualLine": 397,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "95d16cfe9945f3f4b9a39f83afcf3ffbf264c62fb3acaee53b8499dfd54960c0",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:NumberField.FinitePlace.hasFiniteMulSupport",
    "actualModule": "Mathlib/NumberTheory/NumberField/Completion/FinitePlace.lean",
    "actualLine": 437,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "a0f9d2e9c50c19c06eb450e1635f9c092e4a214037640b73d9e8ca6da08a02e8",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Pi.basisFun",
    "actualModule": "Mathlib/LinearAlgebra/StdBasis.lean",
    "actualLine": 122,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "19e1b24253a473ea329f136c127a468b09880049a008bfad010e2fcb191772ac",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Real.rpow_le_rpow",
    "actualModule": "Mathlib/Analysis/SpecialFunctions/Pow/Real.lean",
    "actualLine": 550,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5f4970fe329b14615ca6cfa3e0dcb0cf9d2017c98d2e3501237412aa2474e70b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Real.rpow_le_rpow_iff",
    "actualModule": "Mathlib/Analysis/SpecialFunctions/Pow/Real.lean",
    "actualLine": 574,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "5f4970fe329b14615ca6cfa3e0dcb0cf9d2017c98d2e3501237412aa2474e70b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Submodule.eq_of_le_of_finrank_eq",
    "actualModule": "Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean",
    "actualLine": 258,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "033ff059870ce0ec5ee132f4aaa5fb97afe74c5a3c4b95535e4276093853b17f",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Submodule.exists_le_ker_of_lt_top",
    "actualModule": "Mathlib/LinearAlgebra/Basis/VectorSpace.lean",
    "actualLine": 323,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "cdbe0fd512f13ea3e563290d2896c89e3882ed0040ecc7c3314676a8f278728a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Submodule.mem_span_range_iff_exists_fun",
    "actualModule": "Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean",
    "actualLine": 379,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "b2b03a2690cce460dd1425b6acd5309eaa31483c85f1f9fd39f58e53c1223081",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Finsupp.equivFunOnFinite",
    "actualModule": "Mathlib/Data/Finsupp/Defs.lean",
    "actualLine": 206,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "7b90af26d38d9ff54977a820f5b200729f78b10110311fcd6e0b31e67b2463e3",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Finsupp.sumElim",
    "actualModule": "Mathlib/Data/Finsupp/Basic.lean",
    "actualLine": 1044,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "4764e646a04db1c29dea72f2bd96e52ea33572b120a298061792c2a8f473cc7b",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.IsWeightedHomogeneous.mul",
    "actualModule": "Mathlib/RingTheory/MvPolynomial/WeightedHomogeneous.lean",
    "actualLine": 296,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2e6a01a2f03ae1d91348a8af28ee7df250f91cacd37f9089e616d875edd198fb",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.IsWeightedHomogeneous.sub",
    "actualModule": "Mathlib/RingTheory/MvPolynomial/WeightedHomogeneous.lean",
    "actualLine": 270,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2e6a01a2f03ae1d91348a8af28ee7df250f91cacd37f9089e616d875edd198fb",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.coeff_monomial",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Basic.lean",
    "actualLine": 582,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "7b61c67ecb295e766b2fc1a3408e9a5dd22e75ed6fe4dd467675cb4b2551b4e2",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.coeff_mul",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Basic.lean",
    "actualLine": 652,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "7b61c67ecb295e766b2fc1a3408e9a5dd22e75ed6fe4dd467675cb4b2551b4e2",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.coeff_uniqueAlgEquiv_symm",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Equiv.lean",
    "actualLine": 115,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "95d16cfe9945f3f4b9a39f83afcf3ffbf264c62fb3acaee53b8499dfd54960c0",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.isWeightedHomogeneous_C",
    "actualModule": "Mathlib/RingTheory/MvPolynomial/WeightedHomogeneous.lean",
    "actualLine": 209,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "2e6a01a2f03ae1d91348a8af28ee7df250f91cacd37f9089e616d875edd198fb",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.monomial",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Basic.lean",
    "actualLine": 93,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "7b61c67ecb295e766b2fc1a3408e9a5dd22e75ed6fe4dd467675cb4b2551b4e2",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:MvPolynomial.uniqueAlgEquiv",
    "actualModule": "Mathlib/Algebra/MvPolynomial/Equiv.lean",
    "actualLine": 67,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "95d16cfe9945f3f4b9a39f83afcf3ffbf264c62fb3acaee53b8499dfd54960c0",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Polynomial.coeff_homogenize",
    "actualModule": "Mathlib/Algebra/Polynomial/Homogenize.lean",
    "actualLine": 111,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "f2ee61f9a91769032bdb5efe9c6eee179a12074b43f0ec9072531c5348849af4",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:add_pow",
    "actualModule": "Mathlib/Data/Nat/Choose/Sum.lean",
    "actualLine": 76,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "d88800d197e20be7772e01499720c761b0140c4d0a21b889d590ef606665faf8",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "tauceti:TauCeti.ringKrullDim_eq_of_isIntegral_of_faithfulSMul",
    "actualModule": "TauCeti/RingTheory/KrullDimension/Integral.lean",
    "actualLine": 76,
    "pin": "f790474821cf4256814db967cb154e7af3d0c369",
    "moduleSha256": "e2b18d78c4964f6b68aafb5be0ff41f6cc1f97b7aa9c1b006880b3189b29ef5a",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "tauceti:TauCeti.ringKrullDim_eq_of_injective_of_isIntegral_mvPolynomial",
    "actualModule": "TauCeti/RingTheory/KrullDimension/FiniteType.lean",
    "actualLine": 54,
    "pin": "f790474821cf4256814db967cb154e7af3d0c369",
    "moduleSha256": "01a2133e662ed97ddeca12866b7f0da7dffe871301e0682013e7ec788c479b25",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "tauceti:TauCeti.ringKrullDim_tensorProduct_field_of_finiteType",
    "actualModule": "TauCeti/RingTheory/KrullDimension/FiniteType.lean",
    "actualLine": 97,
    "pin": "f790474821cf4256814db967cb154e7af3d0c369",
    "moduleSha256": "01a2133e662ed97ddeca12866b7f0da7dffe871301e0682013e7ec788c479b25",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  },
  {
    "ref": "mathlib:Matrix.det_vandermonde_ne_zero_iff",
    "actualModule": "Mathlib/LinearAlgebra/Vandermonde.lean",
    "actualLine": 233,
    "pin": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "moduleSha256": "132f71d1c931c61cceac4770d5ea1ddabd71d2f0f7657b40e2a90cd9e846c58c",
    "result": "statement and hypotheses read; appropriate conditional input, not proof of an explicitly gapped construction"
  }
]
```
</details>

## Source findings and version boundaries

Rejected findings are E102 (the checked Wronskian degree estimate is valid), E106 (the source already handles the quadratic case), E212 (the proposed order-zero counterexample was not established in the stated nonzero-coefficient convention), E312 (the alleged missing prefactor does not by itself falsify the printed bound, and the primary page was inaccessible) and E501 (using a valid stronger global theorem is not a source mistake just because a local proof would suffice). Rejection of E312 is not independent verification of Matveev’s bound. E313 and E406 describe the same Yu constant typo and must not be counted as two independent discoveries.

The new findings include Wu’s height normalization, the AWS gauge sign and Apéry recurrence, Thue denominator clearing, the Pottmeyer boundary, the Fischler–Rivoal parameter index, the Evertse Lemma7.6 dimension, the EF terminal filtration index, the BMS negative-logarithm proof step, the Gelfond–Schneider quotient-at-all-zeros and final-exponent steps, the Laplace boundary polynomial, and the additive-versus-multiplicative ambient space in the Ax–Lindemann lecture statement. Every finding has its own mathematical reason and verdict in `sourceIssues`.

Version comparisons are bounded and explicit. The published Evertse1995 and 1996 PDFs were independently fetched and matched their recorded hashes. The published 1996 pp.290,292,294 were visually read: they retain the threshold and grid-degree mistakes. E223 is solely about the author copy; the published 1995 pp.242,247 already fix δ_m and1955. The current Fischler–Rivoal author-copy p.2 fixes the b_p/b_q index, while the identified arXivv3 passage retains it. The AWS current linked draft has the same hash as the identified draft. GF arXiv history currently lists v1; the findings concern its text, not the validity of any formal Lean proof. BMS is scoped to the identified arXivv1 proof passage. Corrections-search statements are bounded searches, never claims that no correction exists anywhere.

The primary Matveev PDF could not be acquired: the recorded expected hash is inherited evidence, not a reviewer download. This prevents independently confirming its locator/excerpt. Proofs outside the ledger, including the full quantitative Matveev/Yu/Baker, Nishioka, Nesterenko, Catalan and intersection-theory routes, remain the precisely named follow-ups. The Laplace fix establishes the missing boundary terms; it does not yet establish a formal cancellation/transfer argument. The Kirby subgroup correction likewise does not establish arbitrary-constant descent.

## Independent source-reading receipt

Physical pages, not printed-page numbers, are listed below. The packet keeps printed locators; for the Evertse chapters, physical→printed offsets are−2,+10,+38,+62,+84,+106,+136,+154 respectively. Published/preprint pages are kept separate. No complete-book reading is claimed. `zhao…` denotes selected HTTP-in-memory reading of the historical Basic.lean source; no extra Lean file was created.

| Version/source id | Physical pages actually read |
| --- | --- |
| `adamczewski-faverjon-mahler-2017` | 1–5 |
| `andre-solution-algebras-2014` | 6–7 |
| `bakker-tsimerman-ax-schanuel-lectures` | 3–6 |
| `berczes-evertse-gyory-superelliptic-2013` | 3–4 |
| `beukers-e-g-functions-aws-2008` | 8–9, 11–15, 18, 20–25, 28–29 |
| `beukers-refined-siegel-shidlovskii-2006` | 1–9 |
| `bugeaud-exponents-2015` | 1–6 |
| `bugeaud-gyory-unit-equations-1996` | 1–2, 4–6 |
| `bugeaud-mignotte-siksek-fibonacci-2006` | 16–17 |
| `evertse-dio-1` | 3–5, 8, 10–11 |
| `evertse-dio-2` | 10–12, 25–26 |
| `evertse-dio-3` | 1–5, 11–15 |
| `evertse-dio-4` | 1–20 |
| `evertse-dio-5` | 1–20, 22 |
| `evertse-dio-6` | 1–29 |
| `evertse-dio-7` | 1–17 |
| `evertse-dio-8` | 1–32 |
| `evertse-explicit-product-theorem-1995` | 1, 3–4, 6, 8, 28, 30–33 |
| `evertse-explicit-product-theorem-1995-published` | 3–8, 28, 31–33 |
| `evertse-ferretti-quantitative-subspace-2013` | 1–4, 7–18, 20, 23, 25, 27–30, 33–36, 42–44, 49–50, 56–57, 65–71, 79–82 |
| `evertse-improvement-quantitative-subspace-1996` | 2, 63–68 |
| `evertse-improvement-quantitative-subspace-1996-published` | 67, 69, 71 |
| `evertse-quantitative-subspace-survey-2010` | 4 |
| `evertse-schlickewei-absolute-subspace-2002` | 97 |
| `evertse-schlickewei-schmidt-linear-equations-2002` | 1–15 |
| `fischler-rivoal-siegel-problem-2020` | 1–3 |
| `karatarakis-wiedijk-gelfond-schneider-2026` | 6–13 |
| `kirby-exponential-differential-equations-2009` | 2, 35–38 |
| `own-fischler-rivoal-author` | 2 |
| `pottmeyer-diophantine-approximation-2022` | 74–79, 81–83, 86–110 |
| `smyth-mahler-survey-2008` | 1–4 |
| `sondow-irrationality-2004` | 5 |
| `soundararajan-transcendence-notes-2010` | 11, 14–15 |
| `tzanakis-deweger-thue-mahler-1992` | 1–2, 9–12 |
| `waldschmidt-dalag-2000` | 12–14, 23, 57, 103–104, 137–161, 271–272, 306 |
| `waldschmidt-transcendence-periods-2006` | 9–10, 21, 25–26 |
| `wu-heights-notes-2018` | 1–7 |
| `yang-heights-notes-2015` | 1–5 |
| `yu-p-adic-logarithms-1990` | 11, 24 |
| `yu-p-adic-logarithms-1994` | 1–3 |
| `zhao-lindemann-weierstrass-mathlib-pr-28013` | Basic.lean lines33–262; pinned historical commit5a0057ccc26b13a4e361f503f5f765bf56a8d353; HTTP memory only |

Visual disambiguation was additionally performed on the rendered pages listed in the following receipt.

```json
{
  "wu-heights-notes-2018": [
    4
  ],
  "evertse-dio-3": [
    14,
    15
  ],
  "beukers-e-g-functions-aws-2008": [
    8,
    11,
    20
  ],
  "pottmeyer-diophantine-approximation-2022": [
    75,
    102,
    103
  ],
  "fischler-rivoal-siegel-problem-2020": [
    2
  ],
  "evertse-dio-7": [
    6
  ],
  "evertse-ferretti-quantitative-subspace-2013": [
    44,
    81
  ],
  "yu-p-adic-logarithms-1994": [
    2,
    3
  ],
  "yu-p-adic-logarithms-1990": [
    11
  ],
  "berczes-evertse-gyory-superelliptic-2013": [
    4
  ],
  "karatarakis-wiedijk-gelfond-schneider-2026": [
    10,
    13
  ],
  "evertse-improvement-quantitative-subspace-1996-published": [
    67,
    69,
    71
  ]
}
```

The download receipts below identify the reviewed versions by public URL and SHA256. Prepared PDFs without a ledger page entry were not read; the Matveev failure is kept as a failure, not a PDF hash verification.
<details><summary>Version/download receipts</summary>

```json
[
  {
    "id": "evertse-dio-1",
    "url": "https://pub.math.leidenuniv.nl/~evertsejh/dio19-1.pdf",
    "bytes": 232051,
    "sha256": "299eabc4e88d0e114bc35819531c803699c3beb2873b9b24e11afadd84d82e23",
    "pages": 11
  },
  {
    "id": "evertse-dio-2",
    "url": "https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf",
    "bytes": 333973,
    "sha256": "99194d1c4a670d42219e277d5b9945d5e80ef159c3969ac1e0e467c304586063",
    "pages": 28
  },
  {
    "id": "evertse-dio-3",
    "url": "https://pub.math.leidenuniv.nl/~evertsejh/dio19-3.pdf",
    "bytes": 304966,
    "sha256": "205a3bd4614aff0e4da77c0ff7ecb106cea63fcfd3bba60528f18d841d1e39df",
    "pages": 23
  },
  {
    "id": "evertse-dio-4",
    "url": "https://pub.math.leidenuniv.nl/~evertsejh/dio19-4.pdf",
    "bytes": 277821,
    "sha256": "1d120934e01ca54eb985678211716b7f5dd656dc3ad6882ed8cbfbbff5ddee54",
    "pages": 22
  },
  {
    "id": "evertse-dio-5",
    "url": "https://pub.math.leidenuniv.nl/~evertsejh/dio19-5.pdf",
    "bytes": 308165,
    "sha256": "1f60cf276ff1a995036c7a238f20b9ce98a0ccfb65e1e759e95fd48b2b49e3b5",
    "pages": 22
  },
  {
    "id": "evertse-dio-6",
    "url": "https://pub.math.leidenuniv.nl/~evertsejh/dio19-6.pdf",
    "bytes": 356870,
    "sha256": "07430cdb8be3a56ce39fd6c442f6c153f9b7fadfdcb7ae327a51e21ae63da97a",
    "pages": 29
  },
  {
    "id": "evertse-dio-7",
    "url": "https://pub.math.leidenuniv.nl/~evertsejh/dio19-7.pdf",
    "bytes": 274353,
    "sha256": "8535b816bfc2899719849ab531686f2a7d812d0427ac9042b4ee7c86fe726610",
    "pages": 17
  },
  {
    "id": "evertse-dio-8",
    "url": "https://pub.math.leidenuniv.nl/~evertsejh/dio19-8.pdf",
    "bytes": 373166,
    "sha256": "f2d717adf6adb48802ab3d57e6e1b1a6a8a08d3735247c67f538911023537f5a",
    "pages": 32
  },
  {
    "id": "bugeaud-exponents-2015",
    "url": "https://arxiv.org/pdf/1502.03052v1",
    "bytes": 268023,
    "sha256": "5d98ac74c956da01bc275aefc1d06b41b676df1fcf57511604e93ff66f7518f3",
    "pages": 37
  },
  {
    "id": "sondow-irrationality-2004",
    "url": "https://arxiv.org/pdf/math/0406300",
    "bytes": 88945,
    "sha256": "537c120ed1ce44e5bf5fd65e7bbc4084707198970dbf95773e229ec920adaf3c",
    "pages": 14
  },
  {
    "id": "smyth-mahler-survey-2008",
    "url": "https://arxiv.org/pdf/math/0701397v2",
    "bytes": 387705,
    "sha256": "8adb228e63181516fa09b41b512e4b24ad9db18e49658d3bdfef61e0d0511c28",
    "pages": 28
  },
  {
    "id": "wu-heights-notes-2018",
    "url": "https://www.math.columbia.edu/~xiaorunw/diop/08.pdf",
    "bytes": 346342,
    "sha256": "b03c8700cf9fd2c9bbfe012dc740861228c832c30485614fada1388901effa36",
    "pages": 15
  },
  {
    "id": "yang-heights-notes-2015",
    "url": "https://mathstat.dal.ca/~yanghs/notes.php?name=Heights",
    "bytes": 464240,
    "sha256": "aa3b39e85972dedd2bf26574c15e382596bb52f49a4b164f057079799ac5f8bc",
    "pages": 50
  },
  {
    "id": "pottmeyer-diophantine-approximation-2022",
    "url": "https://esaga.uni-due.de/f/lukas.pottmeyer/DioApp.pdf",
    "bytes": 2424149,
    "sha256": "f86bb6072e20c5515e29d86fd654b3e37f0c0841d50b69c607f0d6240d7235cf",
    "pages": 137
  },
  {
    "id": "evertse-ferretti-quantitative-subspace-2013",
    "url": "https://arxiv.org/pdf/1008.2340v1",
    "bytes": 833731,
    "sha256": "af2dbf4f9d9d286fc7f58b5fd5fec8e32ef93d037fbbef61f6543c504df0793d",
    "pages": 93
  },
  {
    "id": "evertse-schlickewei-absolute-subspace-2002",
    "url": "https://pub.math.leidenuniv.nl/~evertsejh/00-abssub.pdf",
    "bytes": 568228,
    "sha256": "12b5cb1e324988adcfab1ae94fdc8af6016f9968f72835d06d932bb903eaa7c2",
    "pages": 105
  },
  {
    "id": "evertse-schlickewei-schmidt-linear-equations-2002",
    "url": "https://arxiv.org/pdf/math/0409604v1",
    "bytes": 237960,
    "sha256": "3c809fcadaddbc08f57045e4f55562c8a379b5fa33d7e83046b63a9c14766e8f",
    "pages": 30
  },
  {
    "id": "evertse-improvement-quantitative-subspace-1996",
    "url": "https://pub.math.leidenuniv.nl/~evertsejh/95-subspace.pdf",
    "bytes": 501568,
    "sha256": "ac82a38059a5d0d9fd23a40a3896fb58d8525b14ef44c42199df9582bd9a0fb4",
    "pages": 83
  },
  {
    "id": "evertse-explicit-product-theorem-1995",
    "url": "https://pub.math.leidenuniv.nl/~evertsejh/95-product.pdf",
    "bytes": 311846,
    "sha256": "7e030067f7502778eb7a1982e52e31f133ca18f7de869600f25326116bda71e8",
    "pages": 34
  },
  {
    "id": "evertse-quantitative-subspace-survey-2010",
    "url": "https://arxiv.org/pdf/1008.2268v1",
    "bytes": 276523,
    "sha256": "db1b7d64130842f3f79540e6b55d6e0ffbee081bd71404dee350dfe4438e31c9",
    "pages": 26
  },
  {
    "id": "schmidt-subspace-theorem-1989",
    "url": "https://www.numdam.org/item/CM_1989__69_2_121_0.pdf",
    "bytes": 2698511,
    "sha256": "aeeb61a491c8d7a437fe4b5555d23d80c27e543ff1e22371429c72dab85f8f1d",
    "pages": 54
  },
  {
    "id": "waldschmidt-dalag-2000",
    "url": "https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf",
    "bytes": 77395061,
    "sha256": "e04a822f5b5d61be78c290f508ee7c8a28766e060ef4ec62377d068a942e3d59",
    "pages": 653
  },
  {
    "id": "karatarakis-wiedijk-gelfond-schneider-2026",
    "url": "https://arxiv.org/pdf/2603.24823v1",
    "bytes": 677153,
    "sha256": "d12afa71451e5e9470e860c928c8b1de4a479241ad15ad494bbf9096396e115b",
    "pages": 16
  },
  {
    "id": "soundararajan-transcendence-notes-2010",
    "url": "https://math.stanford.edu/~ksound/TransNotes.pdf",
    "bytes": 580870,
    "sha256": "c22df296f0b7978f789d5e5fdca036a89c34b63d38651cbd7a81d5c6beecc1f3",
    "pages": 78
  },
  {
    "id": "matveev-linear-forms-2000",
    "url": "https://www.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=314&what=fullteng&option_lang=eng",
    "error": "403 Client Error: Forbidden for url: https://www.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=314&what=fullteng&option_lang=eng"
  },
  {
    "id": "yu-p-adic-logarithms-1994",
    "url": "https://www.numdam.org/item/CM_1994__91_3_241_0.pdf",
    "bytes": 1762322,
    "sha256": "caea575fec7e5abb1fc7c4397cbd7a5f0f76e2b81a30aeb275b7c60ad8a1d846",
    "pages": 37
  },
  {
    "id": "yu-p-adic-logarithms-1990",
    "url": "https://www.numdam.org/item/CM_1990__74_1_15_0.pdf",
    "bytes": 4121423,
    "sha256": "953caea45f0bd7935e67f1c1b00e79a71001c66ce6e79e2c24460cf989dfd45b",
    "pages": 100
  },
  {
    "id": "bugeaud-mignotte-siksek-fibonacci-2006",
    "url": "https://arxiv.org/pdf/math/0403046",
    "bytes": 512600,
    "sha256": "95a781491a737c4c1cc7abe1473fa57a90c156341e79618dc4776ef035ee7a76",
    "pages": 42
  },
  {
    "id": "bugeaud-gyory-unit-equations-1996",
    "url": "https://matwbn.icm.edu.pl/ksiazki/aa/aa74/aa7416.pdf",
    "bytes": 265478,
    "sha256": "988ced2aaf34294d7e4caff62e9ca93a125889809b52cf2441336cf4fb870103",
    "pages": 14
  },
  {
    "id": "berczes-evertse-gyory-superelliptic-2013",
    "url": "https://arxiv.org/pdf/1301.7168v1",
    "bytes": 333857,
    "sha256": "6f0c3522bec1af5548ddd4fcb3bd7fc3bc02a2e4294276abc6219289ee94334c",
    "pages": 31
  },
  {
    "id": "tzanakis-deweger-thue-mahler-1992",
    "url": "https://www.numdam.org/item/CM_1992__84_3_223_0.pdf",
    "bytes": 4062852,
    "sha256": "28e5806fea4590b40267c0529a9f867440ee04403e863bc5ec7952e7f0ceffc8",
    "pages": 67
  },
  {
    "id": "beukers-refined-siegel-shidlovskii-2006",
    "url": "https://arxiv.org/pdf/math/0405549v3",
    "bytes": 126458,
    "sha256": "d35e6e176508a3c827c36edec822055f487a94be71dcc6e96e06e57214ee91d1",
    "pages": 10
  },
  {
    "id": "beukers-e-g-functions-aws-2008",
    "url": "https://www.math.arizona.edu/~swc/aws/2008/08BeukersNotesDraft.pdf",
    "bytes": 265050,
    "sha256": "070b5faec742c86027768173f5000bcde16a61b1b8775d4797c5818678699592",
    "pages": 31
  },
  {
    "id": "fischler-rivoal-siegel-problem-2020",
    "url": "https://arxiv.org/pdf/1910.06817v3",
    "bytes": 331390,
    "sha256": "37ce9631650e51081aa075f3d99736b8a766b1ce35dc26b206e86e05b6fb4d6a",
    "pages": 27
  },
  {
    "id": "adamczewski-faverjon-mahler-2017",
    "url": "https://arxiv.org/pdf/1508.07158v2",
    "bytes": 416065,
    "sha256": "d44bec7a6c2b016d4a65971e60e583a9d013e8389948c52393911f5b12b7e7dd",
    "pages": 46
  },
  {
    "id": "kirby-exponential-differential-equations-2009",
    "url": "https://arxiv.org/pdf/0708.1352v3",
    "bytes": 448407,
    "sha256": "a08ea00b740736a506fedd2361d79d2b040141bc2456b12696ea4f42f7167c42",
    "pages": 53
  },
  {
    "id": "bakker-tsimerman-ax-schanuel-lectures",
    "url": "https://benjamin-bakker.github.io/montreal.pdf",
    "bytes": 562836,
    "sha256": "468c791f1cdc84ab7d1e4fbd738c5487eb0ddc247512a99cd405271cacaa8189",
    "pages": 52
  },
  {
    "id": "waldschmidt-transcendence-periods-2006",
    "url": "https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/TranscendencePeriods.pdf",
    "bytes": 288946,
    "sha256": "97428d55ee27acc74280f8d766d9bd3778bbf9f0ed2d7f38feda684052ed3bcc",
    "pages": 29
  },
  {
    "id": "andre-solution-algebras-2014",
    "url": "https://arxiv.org/pdf/1107.1179v2",
    "bytes": 199470,
    "sha256": "7e7945bec322812105b5ad216b18ec2e498f87826662a0aaf81085634e6b1713",
    "pages": 22
  },
  {
    "url": "https://www.numdam.org/item/CM_1996__101_3_225_0.pdf",
    "sha256": "49e5d3f8160660828d10f2b5dcad4d7f22ffa2052623b954abbbb6fe7bc98177",
    "bytes": 5410856,
    "id": "evertse-improvement-quantitative-subspace-1996-published"
  },
  {
    "url": "https://matwbn.icm.edu.pl/ksiazki/aa/aa73/aa7332.pdf",
    "sha256": "94a89d838a199cce195bba2aaba31084d1dafb9b376b4a579b2cd2968c115a62",
    "bytes": 375535,
    "id": "evertse-explicit-product-theorem-1995-published"
  },
  {
    "url": "https://rivoal.perso.math.cnrs.fr/articles/probsiegel.pdf",
    "sha256": "477174d05ecbf5f9b7ec2f7e074e19a20b692be6083806b28fa04b1b3027aa1b",
    "bytes": 381504
  },
  {
    "url": "https://swc-math.github.io/aws/2008/08BeukersNotesDraft.pdf",
    "sha256": "070b5faec742c86027768173f5000bcde16a61b1b8775d4797c5818678699592",
    "bytes": 265050,
    "sameAsReviewedArizonaCopy": true
  }
]
```
</details>

## Validation and portable handoff

The packet checker exits0 with zero errors and warnings against the pinned declaration index. The complete suggested file elaborates using the existing exact-pin build: zero errors, 841 `sorry` warnings and no other warnings. A fresh memory check showed42 GiB available. The compile was serial, `-j1 -M8192`, with a 1200-second timeout. All 3832 transitive imported Mathlib source files matched the source checkout and had existing oleans; dependency commits and Lean version also matched. No Tau Ceti module is imported by the suggested file. No library build/cache/project setup or Lean language server was used.

```json
{
  "checker": {
    "summary": {
      "packet": "research/blueprint/packets/DiophantineApproximationAndTranscendence.json",
      "roadmap": "DiophantineApproximationAndTranscendence",
      "status": "complete",
      "nodes": 397,
      "kinds": {
        "definition": 42,
        "lemma": 213,
        "theorem": 132,
        "construction": 5,
        "application": 5
      },
      "apiItems": 346,
      "unitTests": 203,
      "planets": 36,
      "baselineDeclarations": 422,
      "prerequisites": {
        "baseline": 740,
        "node (this packet)": 657,
        "node (blueprint)": 7,
        "stage": 5
      },
      "gaps": 30,
      "requests": 2,
      "stagesInScope": 6,
      "stagesClosed": 1,
      "stagesPlanned": 1
    },
    "errors": [],
    "warnings": []
  },
  "compile": {
    "mathlib": "082e2d37e8b0463410cdb532e111cd43d5a66174",
    "compiler": "Lean (version 4.34.0-rc2, x86_64-unknown-linux-gnu, commit 6a10ac8c22beadecabdbb0919c2b50214762f91d, Release)",
    "sourceModules": 3832,
    "packages": {
      "plausible": "d9598f07b1bc701f1e3aae163d2681c1fd978793",
      "LeanSearchClient": "ba67e212be1197b84c1f1f6299488a10a3002713",
      "importGraph": "e6f3c9cd0408a0024ba182319984f6243752cf4d",
      "proofwidgets": "a8acbfd87375ff4abe14ce09db5b7664d383bc7f",
      "aesop": "18889deb9e83ea7420ef51c160d6f88552e744e3",
      "Qq": "507746ab8f4b643ccdacb2ec4cdb5853fa9f8ab3",
      "batteries": "4cac2177c37f5530c4da76aa8e4307f3fc9e4dcb",
      "Cli": "ab3a82db9fea14cf0fd7f5a2de650f4b534640af"
    },
    "availableGiB": 42,
    "sourceSha256": "b30a968a070bd1cc8a942be44210ff7ac16036753f59f9dec3c0e36a4095666c",
    "serial": true,
    "timeoutSeconds": 1200,
    "memoryLimitMiB": 8192,
    "source": "research/blueprint/suggested/DiophantineApproximationAndTranscendence.lean",
    "exitCode": 0,
    "errors": 0,
    "warnings": 841,
    "otherWarnings": [],
    "logSha256": "4e2ec759c040a446989990fe0655d1088b12b0b903fc9d8072779539d9861db0"
  },
  "packetSha256": "4242f02096f9be2b35ed1f55de02ac3e1e0c55f09f0d1926d11b9f005e91a4b7",
  "initialPacketSha256": "dabd6a505faf952bfeef73db27d44c783bf8b640be17ce33b4d5f5287370473f",
  "initialSuggestedSha256": "11098cdafa73f711dd5a246f747acac2c7cd256a75256b5138f8695845617ac0",
  "transitiveSourceAuditSha256": "6603c3310a3959ba5b1ad7487ea046f896cbdc394582dc916776139bb723d073"
}
```

This report is the handoff artifact allowed by issue #534. No fourth deliverable is required. Private downloaded PDFs, extracted text, images, helpers and compiler logs will be deleted after PR opening. Public recovery uses the URL/hash/page ledger above, the final packet’s node verdicts and gaps, and the suggested-file SHA in the compile receipt.

For the orchestrator: obtain/recheck the exact published Matveev Corollary 2.3 page, then reconcile `Baker.schneiderLang_exists_vanishing` with the source/packet polydisc bound and cutoffs. Route the partial-stage follow-ups using their explicit remaining lists and existing suppliers. Do not promote this needs_changes packet as accepted, count duplicate Yu source findings twice, or treat signature elaboration as proof completion.
