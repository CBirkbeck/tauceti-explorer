# BP-DiophantineApproximationAndTranscendence~2

Codex — `codex-chIQQ9`, 2026-10-09. Issue [#6514](https://github.com/CBirkbeck/tauceti-explorer/issues/6514); successful claim [6080346184](https://github.com/CBirkbeck/tauceti-explorer/issues/6514#issuecomment-6080346184), confirmed by the swarm bot. Branch `codex-chIQQ9-diophantine-revision`. This completes the issue’s budgeted revision pass. No second job was claimed.

## Outcome and preservation

The two blockers in [the independent review](../reviews/REV-DiophantineApproximationAndTranscendence.md) are addressed: Matveev’s published Corollary 2.3 is accessible as primary text, and the Schneider–Lang auxiliary-function telescope includes the polydisc output, cutoff and shared constants. The inherited 397 node IDs, node order, reviewer object, accepted corrections and five reviewer additions are retained. No nodes were added, as the issue requires for an inherited packet above 300 nodes. All nodes remain unchecked.

The [packet](../packets/DiophantineApproximationAndTranscendence.json), [reader](../readmes/DiophantineApproximationAndTranscendence.md) and [suggested file](../suggested/DiophantineApproximationAndTranscendence.lean) agree on the revised conventions and coverage. The reader now gives all 397 contracts, replacing its stale 392-node account and incorporating the corrected factorial, Laplace-boundary, restricted-domain ODE, rank/counting and dimension interfaces.

| Inventory | Count |
|---|---:|
| Definitions | 42 |
| Constructions | 5 |
| Lemmas | 213 |
| Theorems | 132 |
| Applications | 5 |
| Definition/construction API entries | 346 |
| Definition/construction unit tests | 203 |
| API entries including other node kinds | 389 |
| Test entries including other node kinds | 243 |
| Planets | 36, six per stage |
| Baseline declarations | 422 |
| Remaining gaps | 29 |
| Supplier requests | 2 |

## Schneider–Lang repair

Read Waldschmidt, *Diophantine Approximation on Linear Algebraic Groups*, §4.6 Steps 1–6, printed pp.137–141 (PDF157–161). The repaired `schneider-lang-auxiliary-function-vanishing` contract fixes a witness c₁≥1 of the full uniform Liouville inequality (4.14), then chooses c₂,…,c₈ before T₀,T₁,S₀,S₁,E. It requires n≥1 and n<d₀+d₁, retains the source cutoff L≥6^(2n+2)n^(2n)c₁ and conditions (4.15), (4.17), (4.18), and outputs a nonzero integer coefficient vector, the coefficient bound exp N, a nonzero entire exponential polynomial, a bound exp(−U) throughout the closed sup-norm polydisc of radius c₂S₁, and grid-jet vanishing.

The constant equations are c₂=Σ|yⱼ|+2, c₄=1/(2c₁), c₃=c₄^(1/n)6^(−1−1/n), c₆=c₂(d₀+d₁+ΣᵢΣν|xᵢν|), c₅=c₃/c₆. The conservative lower bound c₇≥max{c₅⁻¹,(2c₁/c₃)(n+1+log(n+1))} absorbs the logarithm of S₁+nS₀: S₁+nS₀≤(n+1)S₀S₁ and log(S₀S₁E)≥1. The remaining factorial and Liouville costs are then strictly below U/2; c₁N=U/2. These enlargements are proof supplements, not a new source erratum.

Taking c₈≥1+2nc₃ also carries N≤(S₀S₁/(2n))log E′ for every E′≥E into the reviewer’s corrected total-order Step 5. `schneider-lang-extrapolation-upper-bound` exposes that budget and positive c₉,c₁₀ explicitly. Sup-order and total-order vanishing remain distinct. The issue’s signature mismatch gap is removed; admitted elaboration does not supply a proof of the telescope.

## Matveev primary verification

Read [the published MathNet PDF text](https://www.mathnet.ru/php/getFT.phtml?jrnid=im&option_lang=eng&paperid=314&what=fullteng), E. M. Matveev, *Izvestiya: Mathematics* 64 (2000), 1217–1269: §1 pp.1217–1218, §2 p.1219 and §21 pp.1263–1266. The mathematical verification checks the fixed embedding, nonzero chosen logarithms, κ=1 for a real embedded field and κ=2 otherwise, Aⱼ≥max{Dh(αⱼ),|λⱼ|,0.16}, Λ≠0 and the strict lower bound with C₁(n,κ)=min{κ⁻¹(en/2)^κ30^(n+3)n^3.5,2^(6n+20)}. Linear independence of the logarithms is not a corollary hypothesis. The case αⱼ=1 with nonzero λⱼ=2πik is allowed.

The corollary permits the weighted B of (1.3) or B*=max|bⱼ|. Reordering Aₙ=max Aⱼ makes B≤B*, as explained at the end of §21 p.1266. The supporting proof is §§3–21, pp.1220–1266, correcting the inherited §§3–9 locator. The primary text is newly read; no new downloaded-PDF hash or rendered-page inspection is claimed. Earlier workers’ source hashes remain historical receipts. The complete quantitative proof decomposition is still a gap.

## Retained review corrections

All 98 contracts classified as corrected, added or unverifiable were read with the reviewer’s mathematical reasons, hypotheses, dependencies and prototype boundaries. The checks below concern the revised mathematical contracts; they do not claim a fresh reading of every source or every one of the 422 baseline declarations. The original review retains its 299 verified / 91 corrected / 5 added / 2 unverifiable ledger until the next independent reviewer replaces it. Both formerly unverifiable contracts have the resolutions above.

The suggested file now includes the packet’s composite-support S-unit example explicitly: 4 has valuations 2 at base 2 and 1 at base 4, so the unsupported product over {2,4} gives 16 instead of rational height 4. Prime-only support remains required. The existing Mahler transcendental-constant example now has the packet test’s label. No new packet tests or nodes were invented for these synchronizations.

### DT.0

| Node suffix | Review classification retained | Check or retained correction |
|---|---|---|
| `primitive-minimal-polynomial` | corrected | Added algebraic-integer and denominator-nonzero boundary requirements to the primitive-minimal-polynomial prototype; zero cannot be used as the claimed divisor of one. |
| `algebraic-approximation-exponent` | corrected | Adding or removing the singleton ξ cannot alter infinitude of the approximation set. Replaced the false rationale and added singleton-removal and height-convention tests. |
| `infinite-places-over` | corrected | Wu's relative height was divided by the field degree twice; keep the native absolute normalization and the independently checked source correction E8. |
| `mul-height-algebra-map` | corrected | Same Wu normalization reconciliation; no double degree division. |
| `abs-mul-height-eq-rpow` | corrected | Same Wu normalization reconciliation in the comparison API. |
| `height-comparisons` | corrected | Reconciled Wu's convention with Mathlib relative and absolute heights. |
| `finite-algebraic-integers-house-le` | corrected | Use the actual house bound for all conjugates. |
| `dirichlet-linear-forms-infinitely-many` | corrected | Retain the source’s nondegeneracy condition for shrinking non-exact approximations; if an exact integral image exists instead, its positive multiples also give bare infinitude.  |
| `dirichlet-linear-form-infinitely-many` | corrected | The simultaneous-approximation input needs independence of 1 together with the α_i. |
| `convergent-error-lower-bound` | corrected | Corrected the continued-fraction irrationality lower bound to 1/(2q_nq_(n+1)). |

### DT.1

| Node suffix | Review classification retained | Check or retained correction |
|---|---|---|
| `thue-auxiliary-polynomials` | corrected | Clear denominators by b^(m+1), not b^m. Derived a safe explicit ℓ¹ constant with base48 instead of importing the unproved base6 transition; the existential Thue theorem is unchanged. |
| `thue-nonvanishing-of-a-divided-derivative` | corrected | Record the inclusive k≤d(2εr+1) derivative boundary. |
| `thue-remainder-bounds` | corrected | Require r≥1 before absorbing 1+\|α\| into its r-th power. |
| `weighted-index-of-polynomial` | corrected | Weighted index ∞ characterizes the zero polynomial; retain strict-below vanishing thresholds. |
| `weighted-index-add` | corrected | Corrected the indexing of sums in the ultrametric/vanishing comparison. |
| `weighted-index-of-derivative` | corrected | Composition and derivative-index estimates must distinguish a nonzero higher jet from the zero polynomial. |
| `central-binomial-sqrt-bound` | corrected | Corrected the central-binomial numerical bound. |
| `gelfond-lemma-one-variable` | corrected | Use the checked log2 constant in the Gelfond estimate. |
| `roth-lemma-one-variable` | corrected | Retain the zero-degree boundary in the one-variable index contract. |
| `wronskian-of-one-variable-polynomials` | corrected | The divided Wronskian is defined over any commutative ring. The multiplication-by-factorials comparison is valid there; inversion of factorials needs a rational algebra.  |
| `wronskian-criterion-one-variable` | corrected | Differentiating a rational quotient to zero needs characteristic zero and a nonzero denominator. |
| `truncated-linear-sum-lower-bound` | corrected | Handle the k=0 truncated-sum boundary using the actual finite sum. |
| `roth-auxiliary-polynomial` | corrected | The auxiliary-polynomial equation count and height bound use strict jet thresholds and the checked Siegel input. |
| `rapidly-increasing-good-approximations` | corrected | The rational increasing-height argument uses rational Northcott directly. |
| `roth-theorem` | corrected | To absorb a fixed approximation constant, choose κ′ strictly between 2 and κ and take height greater than 1; keep strict and weak source inequalities distinct.  |
| `lacunary-series-transcendental` | corrected | Removed the unsupported equality μ=3; the approximation gives the verified lower bound μ≥3. |
| `binary-form-lower-bound` | corrected | Separated the possible Y factor when dehomogenizing a degree-d binary form; its affine degree can be d−1. |

### DT.2

| Node suffix | Review classification retained | Check or retained correction |
|---|---|---|
| `absolute-value-extends-to-algebraic-closure` | corrected | The general completed-absolute-value classification is not supplied by a theorem about an already complex normed algebra. Removed that citation and recorded the missing construction. Proof/interface limitations remain recorded in: Completion and norm-preserving classification for continued number-field absolute values. |
| `p-adic-subspace-theorem` | corrected | Use min(ε,1) to meet the stated parametric theorem range. |
| `product-inequality-reduces-to-systems` | corrected | Keep the exponent 1+d in the norm estimate and the finite-simplex discretization input; the suggested B must be at least1. |
| `vojta-effective-exceptional-subspaces` | corrected | Use δ=min(δ,1) when the source theorem bounds its parameter above by1. |
| `two-form-strict-inequality-finite` | corrected | Record positivity of C1 and δ and the exact factor4 from the source. |
| `approximation-by-algebraic-numbers-of-bounded-degree` | corrected | Removed an unsupported sharp Wirsing strengthening. |
| `squarefree-binary-form-linear-factors` | corrected | The one-variable homogeneous case F=a0Y requires its own boundary check. |
| `nondegenerate-solution` | corrected | The maximal-complement API records maximality rather than an arbitrary choice of complement. |
| `homogeneous-unit-equation-subspace-cover` | corrected | In the two-dimensional step the required object is a line in H. |
| `uniform-bound-zeros-simple-recurrence` | corrected | Added the actual pinned Vandermonde nonvanishing theorem and kept the rank/coset and arithmetic-progression counting decomposition as a separate gap. Proof/interface limitations remain recorded in: Rank decomposition and coset counting in the uniform S-unit bound. |
| `successive-infima-of-twisted-height` | corrected | Corrected the interval i≤j≤n and the Q>1 test boundary. |
| `height-of-linear-subspace` | corrected | Corrected ambient dimension in the rational subspace-height/covolume comparison. Proof/interface limitations remain recorded in: Subspace-height API proof and rational lattice comparison. |
| `weight-and-exceptional-subspace` | corrected | Require finite weight support and placewise independent forms in the suggested exceptional-subspace constructor. The choice is conditional and defaults to bottom when those data fail. |
| `twisted-height-filtration` | corrected | For V={0}, use the one-term zero filtration, with no strict inclusions or slopes.  |
| `twisted-height-gap-principle` | corrected | Do not assert a computable exceptional threshold from a proof that supplies only existence; record the zero-weight/A>1 boundary. |
| `davenport-lemma-for-twisted-heights` | corrected | Corrected Davenport's explicit factor to 2^(n²)(1+ε)^(n+1). Proof/interface limitations remain recorded in: Davenport's lemma for twisted heights: proof of Evertse–Schlickewei Lemma 9.2 not decomposed. |
| `auxiliary-polynomial-for-twisted-heights` | corrected | The C_K factor belongs outside the power in the source lower bound. Proof/interface limitations remain recorded in: Internal lemmas of the Evertse–Ferretti proof are not split into separate nodes. |
| `interval-result-semistable-case` | corrected | Coordinate projections do not automatically preserve the required stability property; added a discriminating example. Proof/interface limitations remain recorded in: Internal lemmas of the Evertse–Ferretti proof are not split into separate nodes. |
| `limit-of-successive-infima` | corrected | The relevant c0 is an infimum over the proper input sets; the coordinate example has value2. Proof/interface limitations remain recorded in: Internal lemmas of the Evertse–Ferretti proof are not split into separate nodes. |
| `height-bound-for-filtration-subspaces` | corrected | Corrected consecutive slope gaps in the canonical filtration and retained E16's undefined final index as a source finding. Proof/interface limitations remain recorded in: Internal lemmas of the Evertse–Ferretti proof are not split into separate nodes. |
| `finite-simplex-discretisation` | added | Added supporting contract and checked its mathematical proof route, ownership and source match. Its API/tests and suggested signature were reviewed. |

### DT.3

| Node suffix | Review classification retained | Check or retained correction |
|---|---|---|
| `lindemann-auxiliary-value` | corrected | Link the auxiliary-polynomial prerequisite explicitly and require positive p. |
| `lindemann-auxiliary-value-small` | corrected | Take C≥1 to handle empty sets in the exponential estimate. |
| `lindemann-weierstrass-in-bakers-form` | corrected | The tuple α=(1,0), β=(1,−e) is a nontrivial forbidden relation; corrected the acceptance example. |
| `transcendence-of-nonzero-algebraic-logarithm` | corrected | The arbitrary-logarithm form follows by contraposition from the exponential theorem. The historical PR only states the principal-logarithm special case; its source match now says so. Logarithms such as 2πi of 1 are allowed.  |
| `gelfond-arithmetic-lower-bound` | corrected | Account for the √r loss in the norm-to-sum estimate; absorb it into an exponential constant. |
| `gelfond-analytic-upper-bound` | corrected | Account for the r factor in the analytic estimate, absorbing it into the exponential constant. |
| `several-variable-division-by-one-variable-polynomial` | corrected | Retain p=0 and the exact geometric sum (3^p−1)/2. |
| `schwarz-lemma-cartesian-product` | corrected | The zero-count parameter needs p≥1 and positive dimension; the missing cutoffs cannot be silently treated as monotonicity. |
| `thue-siegel-lemma-complex-coefficients` | corrected | Require ν≥1 and U,V>0 in the extrapolation signature. |
| `schneider-lang-liouville-lower-bound` | corrected | T0 and T1 start at2 in the source's exponential-monomial setting. |
| `schneider-lang-auxiliary-function-vanishing` | unverifiable | Resolved by the restored auxiliary-function/extrapolation telescope above. |
| `schneider-lang-extrapolation-upper-bound` | corrected | Require positive grid orders and the nonzero first surviving derivative; reconcile the Step3 output before using this Step5 telescope. Proof/interface limitations remain recorded in: Schneider–Lang prototype output and parameter cutoffs need reconciliation. |
| `schneider-lang-inhomogeneous-corollary` | corrected | The monomial-grid dimension must be positive. |
| `baker-linear-independence-of-logarithms` | corrected | An integer relation between arbitrary complex logarithms need not have sum0; it gives a product1 modulo 2πi. No algorithm for equality of arbitrary complex data is asserted. |
| `baker-transcendence-of-linear-form` | corrected | The zero-count statement needs positive dimension. |
| `baker-lower-bounds-for-linear-forms-in-logarithms` | corrected | Use log max(1,\|n_ij\|) for coefficients that may be zero. Proof/interface limitations remain recorded in: Absolute Weil height API for NumberField.absLogHeight₁. |
| `baker-lower-bound-for-multiplicative-form` | corrected | The factor 2^b−1 is bounded below by1/2 in the specified range. Proof/interface limitations remain recorded in: Absolute Weil height API for NumberField.absLogHeight₁. |
| `matveev-corollary-linear-form-bound` | unverifiable | Resolved by primary verification above. |
| `matveev-multiplicative-form-number-field` | corrected | The real-field product-bound proof must first handle signs and absolute values; principal logarithms of negative factors need not have b0=0. E17 records the source proof issue without rejecting the quantitative conclusion. Proof/interface limitations remain recorded in: Absolute Weil height API for NumberField.absLogHeight₁. |
| `p-adic-lower-bound-one-power` | corrected | At p=2 an odd integer has real norm1/2, not1; the uniform lower bound uses min with1/2. |

### DT.4

| Node suffix | Review classification retained | Check or retained correction |
|---|---|---|
| `rational-s-unit-group` | corrected | Prime support is essential for numerator/denominator and multiplicative-height APIs. Composite support{2,4} counts the same prime twice. |
| `bounded-divisor-representatives-finite` | corrected | For α=0 the divisor set is the singleton{0}, not infinite. |
| `divisors-up-to-units` | corrected | Norm versus house cutoff example: in ℚ(i), Norm(5)=25, so the cutoff is5, not√5. |
| `pillai-equation-effective-finiteness` | corrected | Absorb the product-form prefactor by increasing the linear-form constant by1. |
| `log-height-of-algebraic-integer-bound` | corrected | The primary source's height is multiplicative; take its logarithm before inserting it into logarithmic estimates. |
| `baker-superelliptic-theorem` | corrected | Corrected 212 to 2^12 in the superelliptic bound after reading the rendered primary page. The ideal-power proof route remains an explicit gap. Proof/interface limitations remain recorded in: Yu's p-adic lower bound for linear forms in logarithms of algebraic numbers; Proof of Baker's superelliptic theorem (Theorem 5.14) not decomposed; Effective general-group and superelliptic proof interfaces are not closed. |
| `one-term-p-adic-lower-bound` | corrected | Import the existing lifting interface rather than plan a duplicate implementation. |
| `s-unit-equation-effective-finiteness` | corrected | The rational height box has at most 2(2⌊B⌋+1)^\|S\| representatives; handle empty support separately. |
| `exponent-height-bound-for-finitely-generated-groups` | corrected | The lattice-discreteness argument needs the reverse height comparison h≤(s/2)‖·‖, not the already stated upper bound on the norm. Proof/interface limitations remain recorded in: Effective general-group and superelliptic proof interfaces are not closed. |

### DT.5

| Node suffix | Review classification retained | Check or retained correction |
|---|---|---|
| `d-finite-power-series` | corrected | Allow order0 in D-finiteness; the zero series is a legitimate boundary. |
| `minimal-differential-equation` | corrected | Both equations in the minimal-order uniqueness signature must be over the same coefficient field and have nonzero leading coefficient. |
| `e-function` | corrected | Corrected Bessel/hypergeometric coefficient examples and the parameter exclusions. |
| `mahler-function` | corrected | A polynomial first-order system requires T≠0 and algebraic T,M coefficients; the zero system cannot supply a spurious finite-dimensional hypothesis. |
| `schanuel-conjecture` | corrected | Schanuel's conjecture stays an explicit assumption; removed it from the capped list of theorem/definition planets. |
| `holomorphic-solutions-of-linear-systems` | corrected | Cauchy uniqueness is EqOn on a positive-radius disc. Total functions can vary outside the disc, so unrestricted global uniqueness and dimension are false. |
| `fibre-dimension-over-the-affine-line` | corrected | Removed the Krull-dimension quotient bound with its extra Jacobson premise; it does not prove the required affine-line fibre comparison. Native integral/base-change inputs remain. Proof/interface limitations remain recorded in: Remaining dimension and affine-family comparison after native integral-extension inputs. |
| `chudnovsky-galochkin-condition` | corrected | Use P_m=T^m B_m, where B_m already represents y^(m)/m!. Removed the extra factorial and added the scaled-iterate and Galochkin definitions and tests. Proof/interface limitations remain recorded in: Shidlovskii's Lemma II has no proof in the public source; Chudnovsky proof closure after the factorial-normalisation correction. |
| `laplace-transform-of-e-function` | corrected | Laplace integration by parts has a boundary polynomial −Σ_(j<k)x^(k−1−j)u^(j)(0). The exponential/k=1 example disproves the inherited boundary-free identity. Proof/interface limitations remain recorded in: Laplace boundary polynomial and André operator transfer. |
| `andre-theorem-on-e-operators` | corrected | The corrected Laplace identity leaves a missing operator-transfer/cancellation lemma; the quoted André conclusion is kept with explicit proof limitation. Proof/interface limitations remain recorded in: Shidlovskii's Lemma II has no proof in the public source; Laplace boundary polynomial and André operator transfer. |
| `andre-vanishing-corollary` | corrected | The apparent-singularity argument assumes a nonzero function and positive minimal order before choosing the leading coefficient. Proof/interface limitations remain recorded in: Laplace boundary polynomial and André operator transfer. |
| `beukers-vanishing-theorem` | corrected | Same nonzero/positive-minimal-order boundary for the vanishing consequence. Proof/interface limitations remain recorded in: Differential Galois theory (Picard–Vessiot) is planned by no roadmap; Laplace boundary polynomial and André operator transfer. |
| `relation-module-basis-with-full-rank-specialisations` | corrected | The cited linear-factor argument is over an algebraically closed coefficient field; an arbitrary subfield is insufficient for that proof. |
| `siegel-shidlovskii-theorem` | corrected | Corrected André's locator to §1.7, Corollary1.7.1; its algebraic-independence comparison is conditional on equality of transcendence degrees. Proof/interface limitations remain recorded in: Remaining dimension and affine-family comparison after native integral-extension inputs; Laplace boundary polynomial and André operator transfer. |
| `lindemann-weierstrass-via-e-functions` | corrected | Include β=0 and1 in the elementary algebraic-exponential boundary cases. |
| `galochkin-chudnovsky-linear-independence` | corrected | For (1,−log(1−z)) the two-component closeness condition is b>C\|a\|³, not a²; the suggested system now also retains T≠0 and algebraic coefficients. Proof/interface limitations remain recorded in: Galochkin's theorem: proof only sketched in the public source. |
| `ax-integer-relation-lemma` | corrected | The differential-form kernel is a proper group, not an asserted algebraic subgroup. Kirby constructs a separate algebraic subgroup inside it; arbitrary constants still require extension/descent. Proof/interface limitations remain recorded in: Algebraic subgroups of vector groups times tori and Chevalley's indecomposability theorem; Ax integer-relation proof over arbitrary constants needs descent. |
| `scaled-divided-system-iterates` | added | Added supporting contract and checked its mathematical proof route, ownership and source match. Its API/tests and suggested signature were reviewed. |
| `galochkin-condition` | added | Added supporting contract and checked its mathematical proof route, ownership and source match. Its API/tests and suggested signature were reviewed. |
| `linear-system-solution-space-evaluation` | added | Added supporting contract and checked its mathematical proof route, ownership and source match. Its restricted solution carrier/suggested equivalence is explicitly pending. Proof/interface limitations remain recorded in: Restricted-domain linear ODE solution carrier and scalar companion signatures. |
| `scalar-equation-cauchy-initial-jets` | added | Added supporting contract and checked its mathematical proof route, ownership and source match. Its restricted solution carrier/suggested equivalence is explicitly pending. Proof/interface limitations remain recorded in: Restricted-domain linear ODE solution carrier and scalar companion signatures. |

## Sources and library boundaries checked in this run

Read all six reviewed library-audit rows, the accepted RS-03 result and ownership decisions, the roadmap/stage records and current target document, the 28 distinct touching link-map entries and the four routed CDT extraction items. Link-map negative screens are limited to their recorded scope; they do not establish global absence. Read the complete nearby upstream roadmaps Multiquadratic and Completed/EffectiveBounds. The older author and independent-review provenance remains attributed to those workers.

| Primary source | Selected reading on 2026-10-09 | Current file SHA256 |
|---|---|---|
| [Waldschmidt DALAG](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf) | §4.6 Steps1–6, printed pp.137–141 / PDF157–161 | `e04a822f5b5d61be78c290f508ee7c8a28766e060ef4ec62377d068a942e3d59` |
| [Matveev published article](https://www.mathnet.ru/php/getFT.phtml?jrnid=im&option_lang=eng&paperid=314&what=fullteng) | §1 pp.1217–1218; §2 Corollary2.3 p.1219; §21 pp.1263–1266 | Primary reader text; no fresh file hash |
| [Evertse Chapter6](https://pub.math.leidenuniv.nl/~evertsejh/dio19-6.pdf) | Printed pp.111–113,115–119 / PDF5–7,9–13; binary-form boundary and Thue auxiliary coefficients | `07430cdb8be3a56ce39fd6c442f6c153f9b7fadfdcb7ae327a51e21ae63da97a` |
| [Beukers AWS notes](https://www.math.arizona.edu/~swc/aws/2008/08BeukersNotesDraft.pdf) | §§4.4–5.4 pp.20–25 and Theorem6.2.7 p.29; factorial normalization, minimal equation, Laplace boundary and absent proof | `070b5faec742c86027768173f5000bcde16a61b1b8775d4797c5818678699592` |

The source records preserve 90 previously adjudicated findings and their verdicts (85 confirmed, five rejected). In particular E312 remains rejected: a gap in a proposed derivation is insufficient to refute the quantitative statement. E313/E406 remain the same reported issue at two locators. This run adds no source findings. Literal prose excerpts in the current mathematical records were replaced with descriptions in our own words; mathematical displays and precise locators retain the source comparison.

At the pinned Mathlib, reread the four declaration boundaries changed by the review, with their surrounding hypotheses:

| Declaration | Module and line | Conclusion for the revision |
|---|---|---|
| `Polynomial.le_rootMultiplicity_iff` | `Mathlib/Algebra/Polynomial/Div.lean:560` | For nonzero p, n≤rootMultiplicity iff the n-th power divides p; the opposite inequality theorem states nondivisibility. |
| `Matrix.det_vandermonde_ne_zero_iff` | `Mathlib/LinearAlgebra/Vandermonde.lean:233` | Coordinates injective over a domain iff the determinant is nonzero. |
| `NormedRing.algEquivComplexOfComplete` | `Mathlib/Analysis/Normed/Algebra/GelfandFormula.lean:203`, context at99 | Assumes a complete complex normed algebra; cannot construct an arbitrary archimedean completion or its scalar structure. The removed citation stays removed. |
| `ringKrullDim_le_ringKrullDim_quotient_add_spanFinrank` | `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:368` | Requires I≤Ring.jacobson R; cannot supply the affine-family dimension comparison. The removed citation stays removed. |

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The independent review report supplies the historical receipt for all 422 retained declarations. No private reference-library source was used. Sources without a public complete proof remain the explicit gaps below; downloading a public file is not a reading claim.

## Validation

- `lean-check research/blueprint/suggested/DiophantineApproximationAndTranscendence.lean`: exit0, zero errors, 842 admitted-proof warnings and no other warnings. One serial check in the shared pinned build; memory checked above20GiB. No build, cache download or language server was started.
- Suggested-file SHA256: `dcf6207faecd3f03a1324e3d8ab650a03742b63d938ae7b1396c5a9276c28c61`.
- `python3 scripts/check_blueprint.py research/blueprint/packets/DiophantineApproximationAndTranscendence.json`: zero errors and warnings.
- Reader inventory: each of the397 node IDs occurs exactly once as a contract, with its packet statement, API and tests. Suggested inventory: terminal declaration names or labelled examples account for all389 API entries and243 test entries. This check is not a claim that every proof-gapped theorem has a complete telescope.
- JSON validity, unchanged reviewer object/node identifiers, only four permitted deliverables, no private absolute paths, and `git diff --check` verified.

## Coverage and resumption

| Stage | Nodes | Status | Next work |
|---|---:|---|---|
| DT.0 | 46 | partial | Obtain GN.4 polar-lattice covering and retire the GN.1 promotion bridge only after supplier promotion. |
| DT.1 | 78 | closed | Preserve ordinary Roth and the corrected Thue chain; closed is planning closure, not formalization. |
| DT.2 | 100 | partial | Split Parametric Subspace/Product-Theorem proofs, absolute twisted-height Minkowski/Davenport, ESS rank and coset counting, norm forms, completion classification, subspace-height/lattice API. |
| DT.3 | 80 | partial | Split Matveev or Waldschmidt quantitative proof, Yu and two-logarithm bounds, and import exact absolute-height API. |
| DT.4 | 41 | partial | Close general-group and superelliptic reductions, Schinzel–Tijdeman and Catalan proof inputs; send certified enumeration to ED.2. |
| DT.5 | 52 | partial | Close restricted-disc ODE interfaces, Chudnovsky/Shidlovskii and CDT monodromy, dimension, Laplace operator transfer, Mahler/Nesterenko and Ax descent. |

The exact proof-interface gaps, needed-by nodes and source locators remain in the packet and reader. The following list preserves their titles for reliable resumption:

- No public proof of Schmidt's norm form theorem ((i) ⇒ (ii) of Evertse Theorem 7.13) was read.
- Absolute Minkowski theorem for twisted heights (Evertse–Ferretti Proposition 9.2) is imported, not decomposed.
- Davenport's lemma for twisted heights: proof of Evertse–Schlickewei Lemma 9.2 not decomposed.
- Sharp Roth's lemma (Evertse 1995, Theorem 3) and the explicit Faltings Product Theorem are not decomposed.
- Bombieri–Vaaler's Siegel lemma (Invent. Math. 73 (1983), Theorem 9) not read.
- Internal lemmas of the Evertse–Ferretti proof are not split into separate nodes.
- Evertse–Schlickewei–Schmidt §§6–12 (proof of their Theorem 2.1) not decomposed.
- Proofs of the quantitative linear-form bounds are not decomposed.
- Absolute Weil height API for NumberField.absLogHeight₁.
- Yu's p-adic lower bound for linear forms in logarithms of algebraic numbers.
- Proof of Baker's superelliptic theorem (Theorem 5.14) not decomposed.
- Proof of the Schinzel–Tijdeman theorem (Theorem 5.15) not decomposed.
- Proof of Tijdeman's bound for Catalan's equation not read.
- Remaining dimension and affine-family comparison after native integral-extension inputs.
- Differential Galois theory (Picard–Vessiot) is planned by no roadmap.
- Shidlovskii's Lemma II has no proof in the public source.
- Nishioka's theorem: no public complete proof read.
- Nesterenko's theorem: no public proof.
- Algebraic subgroups of vector groups times tori and Chevalley's indecomposability theorem.
- Galochkin's theorem: proof only sketched in the public source.
- CDT G-function to global monodromy chain remains incomplete.
- Chudnovsky proof closure after the factorial-normalisation correction.
- Restricted-domain linear ODE solution carrier and scalar companion signatures.
- Completion and norm-preserving classification for continued number-field absolute values.
- Rank decomposition and coset counting in the uniform S-unit bound.
- Subspace-height API proof and rational lattice comparison.
- Effective general-group and superelliptic proof interfaces are not closed.
- Laplace boundary polynomial and André operator transfer.
- Ax integer-relation proof over arbitrary constants needs descent.

CDT requires exact Bombieri–André global-nilpotence and Katz regular-singularity/quasi-unipotence nodes, including infinity. Existing G-function and corrected Chudnovsky nodes do not supply this complete chain. Begin from the four accepted routed items of PAPER-CALEGARI-DIMITROV-TANG-25 and its Theorem7.3.3, JAMS38 (2025), pp.690–691. DGS94 and Kat70 were not freshly read here. Confirm the generic connection/ODE owner before planning those constructions; preserve the separately routed modular application and arithmetic algebraization/holonomy PartII.

The only two requests are GN.4’s polar-lattice covering bound (Evertse Theorem2.20/Corollary2.21) and GN.1’s promotion bridge for the already existing exact Minkowski/minimum node contracts. No new supplier request or upward ownership move is introduced. CA.2 remains the supplier of the complex-recurrence closed form. RS-03 keeps native heights/product formula/Northcott as baseline, DT.4 as mathematical-bound owner, and ED.2 as certified-enumeration owner.

The status is complete for this revision pass, with one closed and five partial stages. Follow-up workers should use the coverage `remaining` lists and precise gaps; they should not reopen the repaired signature mismatch merely because the admitted construction has no implemented proof. The next independent reviewer must replace the inherited needs_changes verdict after checking these resolutions. All information needed to resume is in committed deliverables; source downloads and local scratch are discarded after submission.
