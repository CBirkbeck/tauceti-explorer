# Weil conjectures: the independent finite-spectrum argument

## Purpose and ownership

This part supplies the numerical converse needed to pass from estimates for every extension-field point count to bounds on each member of a finite Frobenius spectrum. It also supplies the negative-power obstruction routed from Hongjie Yu’s Appendix C. The common ingredient is finite linear algebra over the actual coefficient field, not purity and not a new cohomology theory.

The owner is **WeilConjectures:WC.5:power-sum-converse**, as fixed by the accepted RS-17 restructuring. Its consumers include WC.5’s numerical estimates, the independent surface route WC.5:surface-alternative, and the arithmetic application of PAPER-YU-23/120. The surface route must be able to use this lemma without first importing Deligne’s RH theorem. Consequently the finite-spectrum file imports neither DWP.1/DWP.4 nor a geometric estimate proved from RH. These are genuine dependency boundaries.

The wider WC.0 part also includes WC.0–WC.5 and WC.5:surface-alternative. Their geometric and cohomological construction contracts are described under **Interfaces outside this strand**. This document develops the finite-spectrum component; it does not replace those contracts by an assumed finite list of eigenvalues or an assumed point-count formula.

Suggested home: **TauCeti/Analysis/ExponentialSum/FiniteSpectrum**. Although the application is arithmetic geometry, the core theorem makes sense in every normed field. It should not acquire scheme or étale-cohomology imports merely because of its application.

## Existing carriers and conventions

Use finite families on Fin d, or a finite multiset represented by such a family. A permutation does not change a finite sum. Passing from a multiset to its set of distinct values is permitted only after attaching the multiplicity or the total coefficient of each fibre. A zero aggregate coefficient is invisible and supplies no information about that value. There is no new finite-spectrum structure in this specification: the existing finite functions, finite sums, polynomials and matrices express the data directly.

For a family β and coefficients c write S_n = Σ_i c_i β_i^n. This is mathematical notation for an existing finite sum, not an additional definition with a private API. The generating expression uses positive exponents, so its sequence is S_(n+1) z^(n+1) for n≥0. S_0 is allowed in the recovery lemma and equals the sum of the coefficients; it is not silently set to zero. Thus zero roots and the empty family have unambiguous behaviour even at exponent zero.

The core coefficient type is a **normed field K** with its actual multiplicative norm. It need not be complete, archimedean or of characteristic zero. Constants C and R are real and nonnegative. The bound can hold for n≥N for an arbitrary fixed natural N. The characteristic-zero assumption appears only when unweighted multiplicities must remain nonzero in K. In characteristic p, p copies of a root cancel, so an unweighted converse with no characteristic hypothesis would be false.

For the Vandermonde matrix use Mathlib’s orientation: V_ij = β_i^j, where a row fixes a root and a column fixes an exponent. The inverse coefficient in the recovery formula is (V inverse)_jk, not (V inverse)_kj. If v_i = c_i β_i^n, the row of consecutive moments is vV and recovery is (vV)V inverse. The determinant criterion is used only for an injective β; the inverse of a singular matrix is never mistaken for an inverse satisfying cancellation.

## Proof architecture

Recover each c_k β_k^n from d consecutive moments. Taking norms gives a fixed multiple of R^n bounding its norm. When R is positive, division reduces the issue to boundedness of powers of the nonnegative real number ‖β_k‖/R. A number larger than one cannot have bounded powers. When R is zero, use a positive exponent window and finite moment uniqueness instead of dividing by R. This separates the endpoint case from the ordinary exponential-growth argument.

This reasoning tolerates cancellation in any individual power sum. It does not claim that one of the original moments has no cancellation, or that a maximal-modulus term dominates each other term. The inverse Vandermonde coefficients resolve those possible cancellations using the whole window. Although the bound uses a fixed number of consecutive moments at a time, the windows must be available at arbitrarily large indices; an arbitrary finite initial segment cannot supply the conclusion.

The rational generating expression is constructed independently by summing finitely many convergent geometric series. Its common denominator is D(T)=∏(1−β_i T), with D(0)=1, and its numerator is the explicit polynomial displayed below. After equal roots are grouped, evaluation of the numerator at a reciprocal root determines exactly when that denominator factor cancels. The norm theorem then excludes every remaining pole from the open convergence disc. No analytic identity theorem, residue theorem, or unproved assertion that every visible denominator must be a pole is required.

The final pairing argument is separate: an upper bound by R and the actual relation α_i α_(τ(i))=R² force equality. For q>0 set R=√q. To prove an all-conjugates statement, instantiate the argument in every complex embedding with the pairing and point-count identity valid there. Checking one embedding alone does not produce that quantifier.

## Declarations and proof obligations

Every name below lies in **TauCeti.FiniteSpectrum** and is a proposed theorem or lemma. None introduces a new object. The acceptance conditions supplement the typed examples in the suggested file. The twenty-four pinned baseline declarations listed in the packet are inputs, not new targets. All fourteen nodes realise **WeilConjectures:WC.5:power-sum-converse**.

### Recover one weighted exponential from consecutive moments

**Declaration:** recover_consecutive_moments. **Node:** recover-consecutive-moments.

Let K be a field, β: Fin d → K injective, V_ij=β_i^j and A=V inverse. For arbitrary c: Fin d → K, n≥0 and k in Fin d, prove

c_k β_k^n = Σ_(j<d) A_jk (Σ_(i<d) c_i β_i^(n+j)).

The determinant criterion makes det V nonzero and hence a unit. Apply the existing identity VA=I. Expanding the right side and commuting the two finite sums gives Σ_i c_i β_i^n Σ_j β_i^j A_jk. The inner sum is the (i,k) entry of VA, hence the Kronecker delta. This proves the statement without any norm, characteristic-zero or nonzero-root hypothesis.

**Inputs:** Matrix.vandermonde, Matrix.det_vandermonde_ne_zero_iff and Matrix.mul_nonsing_inv at the pin. Do not reconstruct those facts. The empty family has no k; a zero root is permitted, with the usual zeroth-power convention.

**Acceptance:** d=1 gives the identity matrix. For β=(2,−2), recovery of the first coefficient is S_n/2+S_(n+1)/4. An inverse transposition changes that formula and must fail the test. For β=(0,1), test n=0 and n=1 separately.

### A quantitative bound from a moment window

**Declaration:** consecutive_moment_bound. **Node:** consecutive-moment-bound.

Let K be a normed field, β injective, C,R≥0 and N≤n. Assume ‖S_m‖≤C R^m for every m≥N. Then

‖c_k‖ ‖β_k‖^n ≤ C R^n Σ_(j<d) ‖A_jk‖ R^j.

Apply the recovery identity and norm_sum_le. Every n+j is at least N. Multiplicativity of the norm and the identity R^(n+j)=R^n R^j give the estimate after extracting the nonnegative common factors. The remaining finite sum depends on β and R, but not on n. No coefficient and no radius is divided out in this lemma.

**Inputs:** recover-consecutive-moments and norm_sum_le. **Acceptance:** for β=(2,−2), the first coefficient’s constant is 1/2+R/4 in the usual norm. At R=0 and n≥1 the right side is zero. A zero c_k is permitted.

### An eventual exponential bound controls each visible root

**Declaration:** norm_le_of_distinct_moment_bound. **Node:** distinct-spectrum-bound.

Let K be a normed field, β: Fin d → K injective and c arbitrary. If C,R≥0 and ‖S_n‖≤C R^n for every n≥N, then c_k≠0 implies ‖β_k‖≤R.

For R>0, divide the window bound by ‖c_k‖ R^n. All powers of ‖β_k‖/R, from N onwards, are bounded by

C (Σ_j ‖A_jk‖ R^j)/‖c_k‖.

If the base were greater than one, the pinned pow_unbounded_of_one_lt theorem over the real numbers would give a larger power. Enlarge its exponent to at least N; powers of a base greater than one are increasing. This contradicts the bound. The coefficient field itself is not required to be archimedean: the growth argument concerns its real-valued norm.

For R=0 take n=max(N,1). All d moments in that window are zero. Recovery gives c_k β_k^n=0 and hence β_k=0. Equivalently use the existing finite moment uniqueness theorem on coefficients c_i β_i^n. This case never divides by R and never infers a value from 0 to the zeroth power.

**Inputs:** the two preceding nodes, pow_unbounded_of_one_lt, and the pinned finite-moment uniqueness theorem. **Acceptance:** zero coefficients give no root bound; roots 2 and −2 can cancel in S_1; a zero-radius tail bound forces every visible root to zero even if N is large. Completeness and characteristic zero are absent from the hypotheses.

### Combine coincident roots before applying the bound

**Declaration:** norm_le_of_grouped_moment_bound. **Node:** grouped-spectrum-bound.

For α,w: Fin d → K, take the finite image B of α and attach to b in B its total weight a_b=Σ_(i:α_i=b) w_i. Expanding the finite double sum proves Σ_i w_i α_i^n=Σ_(b in B) a_b b^n for every n. Enumerating B gives an injective family to which distinct-spectrum-bound applies. Thus an eventual estimate by C R^n bounds ‖α_j‖ whenever the total weight of the fibre of α_j is nonzero.

The nonzero hypothesis is on the aggregate, not an individual occurrence. Weights can be negative or can cancel. The conclusion is invariant under the enumeration of B. This is a finite regrouping, not a new quotient or multiset carrier.

**Input:** distinct-spectrum-bound. **Acceptance:** two occurrences of 100 with weights 1 and −1 have all moments zero and yield no information about 100. Two occurrences of 2 with weights one contribute 2·2^n, not 2^n. Adding a zero-weight occurrence changes nothing.

### The unweighted power-sum converse in characteristic zero

**Declaration:** norm_le_of_power_sum_bound. **Node:** power-sum-converse.

Let K be a characteristic-zero normed field and α: Fin d → K. If C,R≥0 and ‖Σ_i α_i^n‖≤C R^n for every n≥N, then every ‖α_i‖≤R. This includes every finite multiset of complex numbers, counting multiplicities, with a bound on all positive powers.

Apply the grouped theorem with weights one. Each coefficient is the natural cardinal of a nonempty fibre. Its image in K is nonzero precisely because the field has characteristic zero. A permutation of a finite enumeration changes neither the power sums nor the conclusion, giving the multiset interpretation without replacing a multiset by a root set.

**Input:** grouped-spectrum-bound. **Acceptance:** the empty family is allowed; the pair (2,2) retains multiplicity two. In characteristic p, p copies of a nonzero root have vanishing moments, so the characteristic-zero hypothesis cannot be removed from this unweighted statement.

### Root bounds are equivalent to all-power bounds

**Declaration:** power_sum_bound_iff. **Node:** power-sum-bound-iff.

For a finite family in a characteristic-zero normed field and R≥0, existence of C≥0 with ‖Σ_i α_i^n‖≤C R^n for every n≥1 is equivalent to ‖α_i‖≤R for every i. The forward implication is the preceding theorem with N=1. For the reverse implication, the triangle inequality and monotonicity of powers give the explicit constant C=d.

**Inputs:** power-sum-converse and norm_sum_le. **Acceptance:** d=0 admits C=0 and R=0 is included. Roots ±M have a vanishing first moment for arbitrary M, but cannot meet an all-power bound at a smaller radius. Scaled m-th roots of unity have zero moments from exponent one through m−1; this shows why no arbitrary finite initial segment suffices.

### The nonarchimedean negative-power obstruction

**Declaration:** reciprocal_moments_escape. **Node:** reciprocal-moments-escape-unit-ball.

Let K be a normed field, d>0, γ injective, 0<‖γ_i‖<1 and every c_i nonzero. For every N there is n≥max(N,1) such that ‖Σ_i c_i (γ_i inverse)^n‖>1.

Otherwise some tail would have norm at most one. Apply distinct-spectrum-bound to the distinct inverted roots with C=R=1. It implies ‖γ_i inverse‖≤1, contradicting the given inequalities; d>0 supplies an index. The argument needs neither completeness nor integral coefficients. For a p-adic field the norm criterion identifies the resulting sum as outside the valuation ring. The output is the norm statement; no parallel valuation ring is constructed.

**Input:** distinct-spectrum-bound. **Source:** the unnumbered lemma in Yu’s Appendix C, routed as PAPER-YU-23/120, motivates this specialization. Yu’s proof is successive elimination; the matrix proof here is an explicit alternative and proves the stronger arbitrary-coefficient, arbitrarily-large-exponent formulation.

**Acceptance:** γ=(p,−p), c=(1,1) gives cancellation at odd exponents but escape at sufficiently large even exponents, including p=2. Use γ=3, not 1/3, for a root of norm less than one in the 3-adic norm. The empty family is excluded because it would make the existence conclusion false.

### The convergent rational generating expression

**Declaration:** hasSum_power_sum_generating. **Node:** power-sum-generating-series.

For β,c: Fin d → K and z with every ‖β_i z‖<1, the series with terms S_(n+1) z^(n+1) for n≥0 has sum Σ_i c_i β_i z/(1−β_i z).

Apply the existing geometric-series theorem at ξ=β_i z and multiply by c_i β_i z. The term is c_i β_i^(n+1) z^(n+1). The pinned hasProd_prod theorem, applied to the existing Multiplicative wrapper of K, combines the finitely many series; this is also the finite-sum rule generated as hasSum_sum. The norm hypotheses ensure that each denominator is nonzero. The theorem is stated as a specified convergent sum, not as a value assigned to a divergent infinite sum. The geometric theorem at this pin does not need the field to be complete.

**Inputs:** hasSum_geometric_of_norm_lt_one and hasProd_prod. **Acceptance:** both sides vanish at z=0. A single root gives cβz/(1−βz), not c/(1−βz). Repeated roots add their weights. Milne’s Lemma 27.5 motivates the connection with traces; the weighted geometric-series computation is a separate argument, not a quotation of his logarithmic formula in arbitrary characteristic. No geometric cohomology theorem is imported.

### A common polynomial denominator for the generating function

**Declaration:** generating_common_denominator. **Node:** generating-numerator-denominator.

In the existing polynomial ring put

D(T)=∏_i(1−β_i T),

N(T)=Σ_i c_i β_i T ∏_(j≠i)(1−β_j T).

Then D(0)=1, and N(z)/D(z)=Σ_i c_i β_i z/(1−β_i z) wherever all denominator factors are nonzero. Each summand is obtained by factoring D and cancelling its nonzero factor after evaluation. Distributing the finite sum gives the identity. Thus N/D is a rational function with a specified polynomial presentation and nonzero denominator; it is not merely a name for a series.

**Inputs:** finite polynomial arithmetic over a field, expanding finite sums and cancelling the stated nonzero factors. **Acceptance:** d=0 gives 0/1. The numerator has constant term zero. With roots (b,b) and both weights c, N=2cbT(1−bT); reduction cancels one repeated denominator factor in characteristic zero. This is why poles are considered after grouping.

### The exact criterion for cancelling a reciprocal root

**Declaration:** generating_pole_cancellation_iff. **Node:** pole-cancellation-criterion.

Suppose β is injective and β_k≠0. Evaluate the preceding numerator at β_k inverse. Every summand except k has a zero factor, and the remaining summand is

N(β_k inverse)=c_k ∏_(j≠k)(1−β_j/β_k).

Injectivity and β_k≠0 make every factor in that product nonzero. Hence N(β_k inverse)=0 exactly when c_k=0. The denominator has a simple zero there: its k-th factor is linear and its complementary product is nonzero at the point. Therefore the reduced rational function has a pole there exactly when the grouped weight is nonzero.

**Input:** generating-numerator-denominator. **Acceptance:** for a single nonzero root the evaluated numerator is c. Equal roots with weights 1 and −1 must lose their alleged pole after grouping. A zero root contributes no positive moment and no finite reciprocal pole. No statement about a reciprocal of zero is used.

### An all-power bound excludes poles in the convergence disc

**Declaration:** no_pole_of_power_sum_bound. **Node:** no-pole-in-bounded-disc.

Suppose β is injective, all grouped weights are nonzero, and an eventual moment bound C R^n holds. For any z with R‖z‖<1, distinct-spectrum-bound gives ‖β_i z‖≤R‖z‖<1. Every denominator factor is therefore nonzero, and the generating-series theorem applies. The common-denominator theorem identifies its value with N(z)/D(z).

For R>0 this is the open disc of radius 1/R. For R=0 every visible root is zero and the rational expression is zero everywhere. A pole on the boundary is not excluded. Weights zero after grouping must be removed before this statement about every denominator factor; invisible roots do not constrain the disc.

**Inputs:** distinct-spectrum-bound, power-sum-generating-series and generating-numerator-denominator. This argument proves the norm bound first and then excludes poles. It does not circularly assume the pole exclusion as a premise of that norm bound. **Acceptance:** retain the open-disc inequality and separately test R=0.

### Reciprocal pairing turns the upper bound into equality

**Declaration:** norm_eq_of_reciprocal_pairing. **Node:** reciprocal-pairing-forces-equality.

Let α: Fin d → ℂ, τ a permutation, R>0, and assume α_i α_(τ(i))=R² for every i. If the eventual bound ‖Σ_i α_i^n‖≤C R^n holds with fixed C≥0, then every ‖α_i‖=R.

The unweighted converse bounds both members of every pair by R. Taking norms in the pairing gives product R². A strict inequality for either member would give product strictly below R², a contradiction. For q>0 substitute R=√q, using its positivity and square identity. An all-conjugates conclusion requires this argument to be instantiated in every complex embedding; one embedding is not a substitute for the quantifier.

**Input:** power-sum-converse. The numerical argument is elementary and conditional on a supplied pairing; the source’s geometric pairing is not fabricated here. **Acceptance:** 3+4i and 3−4i have product 25 and modulus five. Roots two and eight have product 16 but fail any tail bound C·4^n with a fixed C. The empty family is vacuous and allowed.

## Acceptance suite

The suggested file gives twenty explicit examples under the following names. They are statements to prove, not reports of completed proofs. Successful elaboration checks their carriers and types, not their mathematical truth.

**Degenerate and multiplicity checks:** empty_family, repeated_root_multiplicity, invisible_grouped_root, positive_characteristic_multiplicity, zero_radius_tail, zero_root_no_finite_pole. These distinguish an empty family from a nonempty zero family, retain repeated roots, and reject an illicit characteristic-independent converse.

**Cancellation and normalization checks:** first_moment_cancellation, second_moment_detection, four_equal_modulus_roots, transpose_orientation, positive_exponents_only. In particular, the four fourth roots of unity have zero first, second and third moments but fourth moment four. Scaling them makes arbitrary finite prefix tests misleading. The inverse-orientation test uses a nonsymmetric inverse and nonconstant coefficients; a symmetric example would not detect transposition.

**Generating and pairing checks:** zero_at_origin, one_root_generating_function, repeated_denominator_requires_grouping, reciprocal_pair. The one-root expression has numerator cβz, not c. The reciprocal-pair example uses 3+4i and 3−4i, with product 25 and modulus five. A pair with product 16 and unequal moduli two and eight fails the hypothesized all-power bound at radius four; the pairing alone never supplies an upper bound.

**Formal carrier checks:** formal_positive_coefficients checks both the zero coefficient and the positive index shift; formal_single_root_laurent compares actual PowerSeries and RatFunc images; formal_empty_spectrum checks the empty sum; formal_characteristic_two_cancellation checks cancellation without division by an index; formal_zero_root_zeroth_power distinguishes the positive series from the full moment series at exponent zero.

For Yu’s nonarchimedean application test γ=(p,−p), coefficients (1,1), and the usual p-adic norm. Odd negative moments vanish, while sufficiently large even ones are outside the valuation ring, including at p=2. This is the same finite-spectrum theorem with inverted roots, not an independent theory of exponential sums.

## Pinned library interfaces

The pins are Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. The reviewed AUDIT-19 records the missing power-sum converse and pole analysis, despite the existing matrix and symmetric-polynomial infrastructure. Its accepted review also emphasizes that WC.0 contains mathematical point-set finiteness targets, not just bookkeeping. Do not retire those targets as process work.

**Matrix.vandermonde**, **Matrix.det_vandermonde_ne_zero_iff**, and **Matrix.eq_zero_of_forall_pow_sum_mul_pow_eq_zero**, in Mathlib/LinearAlgebra/Vandermonde.lean, supply the matrix, its determinant criterion and finite moment uniqueness. **Matrix.mul_nonsing_inv**, in Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean, supplies the actual inverse cancellation under the unit-determinant hypothesis.

**norm_sum_le**, in Mathlib/Analysis/Normed/Group/Basic.lean, supplies the finite triangle inequality. **pow_unbounded_of_one_lt**, in Mathlib/Algebra/Order/Archimedean/Basic.lean, is used on real numbers, not on the potentially nonarchimedean coefficient field.

**hasSum_geometric_of_norm_lt_one**, in Mathlib/Analysis/SpecificLimits/Normed.lean, gives the explicit geometric limit. **hasSum_sum**, in Mathlib/Topology/Algebra/InfiniteSum/Basic.lean, is the generated additive name of hasProd_prod and applies to a finite family of genuinely convergent series. The finite-recovery and norm arguments contain no infinite sum at all.

The formal-series baseline is equally concrete. PowerSeries.mk, coeff_mk and ext supply the existing coefficient constructor and extensionality. The polynomial inclusion preserves multiplication and is injective. PowerSeries.mk_one_mul_one_sub_eq_one, rescale, rescale_mk and rescale_X supply the scalar formal geometric identity; coeff_succ_mul_X and coeff_C_mul identify its positive coefficients. HahnSeries.ofPowerSeries_injective specializes to the existing Laurent-series embedding. PowerSeries.coe_mul, RatFunc.coe_coe and RatFunc.algebraMap_apply_div identify the two polynomial images and their quotient; PowerSeries.coeff_coe reads back all Laurent coefficients. The RatFunc algebra structure is the existing scoped liftAlgebra instance, not a newly postulated field map. The packet records each exact source module and checked hypotheses.

## Formal generating-series comparison

### The denominator-cleared formal identity

**Declaration:** formal_power_sum_product. **Node:** formal-power-sum-product.

Over any commutative ring K, use the same polynomials N and D and let G be the existing power series whose coefficient at zero is zero and whose coefficient at n>0 is S_n. Prove DG=N in PowerSeries K. This is an identity over rings with zero divisors as well as over fields, with no norm, distinctness or characteristic restriction.

Apply the existing rescaling ring homomorphism at β_i to the formal geometric identity. It gives H_i(1−β_iT)=1, where H_i has coefficient β_i^n at n. Multiply H_i by c_iβ_iT to obtain G_i. The coefficient-shift and constant-multiplication formulas give G=Σ_i G_i, including the separate constant coefficient zero. For each i, factor D=(1−β_iT)D_i. Commutativity gives DG_i=c_iβ_iTD_i. Sum these identities and use the polynomial inclusion's ring laws to obtain DG=N. Each local calculation is coefficient arithmetic or finite product manipulation; it does not require a new geometric-series definition.

**Inputs:** the existing formal geometric, rescaling, coefficient and polynomial-inclusion interfaces listed above. **Acceptance:** a single root yields (1−bT)G=cbT; opposite weights on a repeated root yield zero; two unit weights at the same root in characteristic two also yield zero. No division by n occurs.

### Equality in the common Laurent-series field

**Declaration:** formal_power_sum_eq_ratFunc. **Node:** formal-rational-comparison.

Over a field K, the image of G in LaurentSeries K equals the image of the rational function N/D under the existing RatFunc-to-LaurentSeries algebra map. This is the exact formal expansion comparison. It does not posit a map from every rational function into power series: 1/T has no such expansion at the origin.

The common-denominator lemma gives D(0)=1, hence D is nonzero. Injectivity of the polynomial and power-series embeddings makes its Laurent image nonzero. Map DG=N to LaurentSeries, divide by this nonzero image, and use RatFunc.coe_coe and RatFunc.algebraMap_apply_div to identify the quotient with the image of N/D. PowerSeries.coeff_coe and coeff_mk now give zero at every negative index, zero at index zero, and S_n at every positive index. This establishes existence of the expansion on the existing carriers; injectivity of the power-series embedding gives uniqueness. Evaluating the expansion is a separate analytic operation governed by the earlier norm conditions.

**Inputs:** formal-power-sum-product, generating-numerator-denominator, and the checked injectivity, multiplication, quotient and coefficient comparisons. **Acceptance:** d=0 gives 0/1; b=2,c=3 gives positive coefficients 6,12,24 and zero constant term; a zero root contributes nothing; repeated roots can cancel in characteristic two. These cases also check that the formal comparison does not accidentally inherit the characteristic-zero hypothesis of the unweighted converse.

The cancellation theorem is algebraic and independent of this carrier comparison: it computes N at each proposed denominator root. The converse root bound is likewise independent, since it is proved by the finite matrix calculation. Thus a formal-series implementation cannot introduce a circular prerequisite into either result.

## Interfaces outside this strand

**WC.0 — Conventions and existing portfolio.** Reconcile the existing WC project and CohomologicalPointCounting interfaces. Prove finiteness of the actual rational point set of a finite-type scheme over each finite extension and its functorial identifications under field isomorphisms. Do not replace these theorems by an assumed finite-type instance.

**WC.1 — Zeta and rationality.** Preserve the stable IDs of the integrated Euler-product and cohomological-formula nodes. Refine their proof steps and exact suppliers for extension counts, closed-point degrees, Möbius inversion, determinant identities and normalized rational descent. The finite sums in this document are not a new definition of zeta.

**WC.2 — Functional equation.** Construct the actual pairings and sign-normalized determinant identities needed to supply reciprocal roots. A pairing supplied to the numerical theorem here is not a proof that the geometric pairing exists.

**WC.3 — Canonical factors.** Follow RS-17’s boundary: import proved purity from DWP.4 and assemble the Galois-stable, integral factors with multiplicity and ℓ-independence. Preserve the integrated source work; it is not newly certified by this finite-spectrum argument.

**WC.4 — Comparison and Betti numbers.** State the family and lift hypotheses of each comparison, with the applicable Artin/base-change input. No universal characteristic-zero lift of a smooth projective finite-field variety is inferred.

**WC.5 — Numerical estimates.** Build the higher-dimensional all-power inequalities and recurrences from the specified cohomological inputs, keeping the dimension-zero case separate. Import the curve estimate from DWP.1 and the elliptic estimate from the existing EllipticCurves layer as RS-17 requires. The converse uses the independent child, not the RH-based proof of its parent’s bound.

**WC.5:surface-alternative.** Obtain the exact diagonal/Frobenius-graph intersection and Hodge-index statements from SF.5, derive an all-extension curve estimate, and combine it with this child and the WC.2 reciprocal pairing. Its proof cannot use DWP.1, DWP.4 or a parent WC.5 estimate already derived from RH. Those would remove the independence of the surface proof.

## Sources

Hongjie Yu, *Comptage des systèmes locaux ℓ-adiques sur une courbe*, arXiv:1807.04659v5 (18 July 2022), Appendix C, the unnumbered lemma on printed p. 81. The routed item is PAPER-YU-23/120. The preprint’s argument uses successive elimination; the explicit matrix-recovery proof above is an alternative generalization, not a claim that Yu prints the same formula. The general normed-field statement also weakens the source’s coefficient-integrality requirement. Only the cited passage is used here.

J. S. Milne, *Lectures on Étale Cohomology*, version 2.21 (22 March 2013), §27, Lemma 27.5 and its proof, printed pp. 155–156. Its trace/power-sum identity and characteristic-zero formal logarithm motivate the rational expression. The weighted finite calculations above do not import Milne’s geometric rationality theorem. Public URLs, exact versions, access date, hashes and inspected passages are recorded in the packet.

The source-issue record WeilConjectures/E-WC0-1 isolates a missing hypothesis in that lemma: the formal logarithmic identity divides by every positive integer and therefore requires characteristic zero. Over F_p, the identity endomorphism on a one-dimensional space already asks for 1/p. The preceding trace formula remains valid, and the geometric application over Q_ℓ is unaffected. The division-free formal identity here works in every characteristic. The finding is against the author’s v2.21 course notes, not the different 1980 book; the author’s course-note errata list has no corresponding correction at the recorded check date.

The existing Mathlib Vandermonde and nonsingular-inverse source files at the pins provide the algebraic starting point. Every new item retains unchecked implementation status. The handoff separately records which validation and source-rendering steps actually ran.
