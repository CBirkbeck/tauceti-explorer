**Entire linear-division checkpoint, 27 September 2026.** The packet now has
92 unchecked nodes (8 comparisons, 11 constructions, 3 definitions, 49 lemmas, 21 theorems), 57 API entries, 70 packet tests,
70 typed examples, six planets and 94 baseline references. All 80 preceding
nodes and 84 baseline objects are preserved whole. Twelve new nodes and two
published-source findings are added. Eight gaps, five requests and zero closed
stages remain. Counts and validation statements in earlier checkpoint sections
below describe those historical checkpoints.

## L4 continuation: dividing entire series by a linear factor

Write F=sum c_n T^n in the existing native power-series ring A[[T]]. The predicate
IsEntire continues to mean that norm(c_n)R^n tends to zero for every real R>0.
This continuation uses a complete commutative normed ring A with submultiplicative
norm and norm(1)=1, and assumes the ultrametric inequality precisely in the
quotient bound, its entireness and the results that consume them. The parameter
a is any element of A. Neither a field structure, reducedness nor Noetherianity
is used. This is a weaker contract than the standing Noetherian K-Banach setup
of the Fredholm operator nodes.

The quotient is explicit:

q_n = sum_(k>=0) c_(n+1+k) a^k, and Q_a(F)=sum_(n>=0) q_n T^n.

Every tail converges for entire F. To see this, choose S>max(1,norm(a)). The
weighted coefficients at S tend to zero and are bounded by some M>=0. The kth
summand in the mth evaluated tail is bounded by
(M/S^m)(norm(a)/S)^k, an ordinary convergent geometric series of real norms.
This proves summability without an ultrametric assumption. The construction
uses native PowerSeries.mk and the total native tsum, so it has a value even
outside the entire subring; no additive, scalar or analytic interpretation is
claimed there unless separately justified.

For ultrametric A, a sharper bound gives norm(q_n)<=M/S^(n+1) whenever
norm(a)<=S and norm(c_m)S^m<=M. The existing native ultrametric infinite-sum
bound supplies this directly. Its total-sum convention also proves the bound
on arbitrary formal inputs; that is distinct from proving their convergence.
For an entire input and a desired radius R, choose S>max(R,norm(a),1). Then

norm(q_n) R^n <= (M/S)(R/S)^n,

which tends to zero. Thus the quotient is entire at every radius. Taking S=R
would only give a uniform bound, so the larger radius is essential.

Splitting the first term of each convergent tail gives
q_n=c_(n+1)+a q_(n+1). The same operation on evaluation gives
F(a)=c_0+a q_0. Coefficientwise these two equations prove

F=(T-a)Q_a(F)+F(a).

The sign, the one-step coefficient shift and the constant remainder are all
fixed by this identity. In particular Q_a(T^2)=T+a. At a=0 the construction
agrees with the native shifted-coefficient series appearing in
PowerSeries.eq_X_mul_shift_add_const; no new generic formal division operator
is introduced.

Uniqueness is an analytic statement even though the identity lives in native
formal series. If (T-a)H=b is constant and H is entire, its coefficients satisfy
h_n=a h_(n+1), hence h_n=a^k h_(n+k). Fix R>=max(1,norm(a)). Entireness implies
that R^(-n) norm(h_(n+k))R^(n+k) tends to zero, while it bounds norm(h_n) from
above. Thus every coefficient vanishes, then b=0. Apply this to the difference
of two entire quotients to obtain simultaneous uniqueness of quotient and
constant remainder. This does not cancel a nonunit or discard a nilpotent.

Native Polynomial.divByMonic and its remainder-at-a theorem already give the
polynomial division identity. Polynomial coefficients have finite support,
so the existing polynomial inclusion is entire. Comparing that identity with
the tail quotient by analytic uniqueness proves exact compatibility with the
native polynomial quotient. Finally, F(a)=0 is equivalent to divisibility of F
by T-a with an entire quotient; the converse follows by uniqueness of the
constant remainder. No evaluation operation on arbitrary formal substitutions
is assumed.

### Ownership and remaining scope

Accepted RS-16 leaves these Fredholm/entire-polynomial helpers in L4. The
reviewed AUDIT-25 rows and current upstream models were checked. The existing
ProfiniteProPGroups Layer9 linear Weierstrass division has a different contract:
bounded integral Z_p series and a topologically nilpotent parameter. It is not
reconstructed here. The DiophantineApproximationAndTranscendence division nodes
concern complex entire functions (and several complex variables), rather than
the coefficient-decay algebra over a Banach ring.

Pinned native PowerSeries.WeierstrassPreparation provides ideal-adic division
under IsWeierstrassDivisorAt and IsAdicComplete. It does not supply arbitrary-a
entire Banach-ring division, so it is a documented near miss rather than a
claimed baseline implementation. Existing native coefficient constructors,
infinite-sum bounds, geometric convergence and polynomial division are reused.

The earlier general monic division node is preserved. Its degree>=2 quotient
and finite-dimensional remainder recurrences still require decomposition, as
do the quotient-basis/resultant interfaces, spectral resultant transport and
finite-projective determinant/rank arguments. These twelve declarations do not
close L4, and they add no planet beyond its existing six.

### Summability of every evaluated coefficient tail

`LocallyAnalyticDistributions:L4/entire-tail-summable` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.entire_tail_summable`.

If F=sum c_n T^n is entire and a is any element of A, then for every m>=0 the series sum_(k>=0) c_(m+k) a^k is summable. The case m=0 is evaluation at a.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Choose S>max(1,norm(a)). Entireness at S makes norm(c_j)S^j converge to zero; the native bounded-range theorem supplies M>=0 bounding every term.
2. Submultiplicativity and norm_pow_le bound norm(c_(m+k)a^k) by (M/S^m)(norm(a)/S)^k. The ratio lies in [0,1).
3. Use the native summable geometric series, scalar multiplication and norm-dominated summability in the complete normed additive group. This argument does not require the ultrametric inequality.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:Filter.Tendsto.bddAbove_range`, `mathlib:norm_pow_le`, `mathlib:summable_geometric_of_lt_one`, `mathlib:Summable.of_norm_bounded_eventually_nat`.

Acceptance:

- At a=0 only k=0 survives. For m=0 this supplies the actual convergence needed to split entire_eval, not merely a total tsum value.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Tail quotient for division by a linear factor

`LocallyAnalyticDistributions:L4/entire-linear-quotient` (construction); proposed declaration `TauCeti.NonarchimedeanFredholm.entireLinearQuotient`.

For a in A and a native formal series F=sum c_n T^n, define Q_a(F) by coefficient q_n=sum_(k>=0) c_(n+1+k)a^k, using the total native infinite sum. Its analytic quotient interpretation and additive/scalar laws below are asserted for entire F, where every tail converges. No new carrier for entire series is introduced.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Apply native PowerSeries.mk to the displayed total coefficient function. The preceding tail-summability node justifies its convergent interpretation on the existing entire-series subring.
2. Derive zero, constants and the zero-parameter shift coefficientwise. For entire inputs, summability permits additivity and multiplication by a scalar. The promoted coefficient, recurrence, norm, entireness and polynomial comparison nodes expose the interface used by later declarations.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-series`, `LocallyAnalyticDistributions:L4/entire-tail-summable`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`.

Uses:

- Coleman A3, proof of Lemma A3.5 and the quotient-algebra interpretation on printed434: Provide the linear-factor analytic quotient and its polynomial remainder.
- L4/entire-linear-root-factor and existing entireResultant_linear API: Identify the entire ideal generated by T-a and the remainder F(a), without assuming evaluation on an arbitrary formal series converges.

Planning API:

- `entireLinearQuotient_coeff`: The coefficient q_n is the convergent tail sum_(k>=0)c_(n+1+k)a^k for entire F; the total coefficient equality holds for every F. Promoted to its own node.
- `entireLinearQuotient_zero`: Q_a(0)=0.
- `entireLinearQuotient_add`: For entire F,G, Q_a(F+G)=Q_a(F)+Q_a(G).
- `entireLinearQuotient_C_mul`: For entire F and any b in A, Q_a(bF)=b Q_a(F).
- `entireLinearQuotient_C`: Q_a(b)=0 for any constant b.
- `entireLinearQuotient_at_zero`: Q_0(F) is the native shifted series with coefficient c_(n+1), for every formal F.
- `entireLinearQuotient_entire`: If F is entire and A is ultrametric, Q_a(F) is entire. Promoted to its own node.
- `entireLinearQuotient_polynomial`: For a polynomial P, Q_a(P) is the native monic polynomial quotient P divided by T-a, included in the native power-series ring. Promoted to its own comparison node.

Typed tests:

- `linear_quotient_constant`: For any a,b in A, Q_a(b)=0.
- `linear_quotient_quadratic`: For any a in A, Q_a(T^2)=T+a.
- `linear_quotient_zero_shift`: For every formal F, Q_0(F)=PowerSeries.mk of the shifted coefficients c_(n+1).
- `linear_quotient_native_polynomial`: For ultrametric A, any a and polynomial P, Q_a(P)=the native polynomial quotient P divByMonic (T-a) included in A[[T]].
- `linear_quotient_zero_divisor`: For e in A with e^2=0, Q_e(eT^2)=eT. Nonzero nilpotents need not be discarded.

Acceptance:

- Q_a(T^2)=T+a; replacing n+1+k by n+k or changing a to -a fails this test.
- Neither a topologically nilpotent parameter nor a domain hypothesis is introduced.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Coefficient formula for the tail quotient

`LocallyAnalyticDistributions:L4/entire-linear-quotient-coeff` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.entireLinearQuotient_coeff`.

For every formal F, a and n, coeff_n(Q_a(F))=sum_(k>=0)c_(n+1+k)a^k as an equality of total native sums; for entire F the sum converges.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Unfold only the constructor and apply the native coefficient-of-mk equation. Summability on entire inputs is provided by the construction prerequisite.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-linear-quotient`, `mathlib:PowerSeries.coeff_mk`.

Acceptance:

- The first quotient coefficient starts at c_1, not c_0.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Recurrence for linear-quotient coefficients

`LocallyAnalyticDistributions:L4/entire-linear-quotient-recurrence` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.entireLinearQuotient_recurrence`.

For entire F, q_n=c_(n+1)+a q_(n+1) for every n>=0.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Use the generated additive Summable.tsum_eq_zero_add from the indexed native multiplicative declaration to split k=0 from the convergent tail.
2. Reindex the remaining k+1 terms, use a^(k+1)=a a^k and commute the scalar a with the sum.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-linear-quotient-coeff`, `LocallyAnalyticDistributions:L4/entire-tail-summable`, `mathlib:Multipliable.tprod_eq_zero_mul`, `mathlib:Summable.tsum_mul_left`.

Acceptance:

- For F=T^2 the recurrence gives q_1=1 and q_0=a, fixing both sign and indexing.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Ultrametric bound for each quotient coefficient

`LocallyAnalyticDistributions:L4/entire-linear-quotient-bound` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.entireLinearQuotient_bound`.

Suppose A is ultrametric, S>0, norm(a)<=S and M>=0 satisfies norm(c_m) S^m<=M for all m. Then norm(coeff_n(Q_a(F)))<=M/S^(n+1) for every n. This bound is valid for the total construction even without an entireness assumption; it does not by itself assert tail convergence.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Multiply the norm of the kth summand by S^(n+1). Submultiplicativity and norm(a)^k<=S^k give norm(c_(n+1+k))S^(n+1+k)<=M. Divide by the positive S^(n+1).
2. Install the native ultrametric instance and apply the generated additive norm_tsum_le_of_forall_le_of_nonneg. Its total-sum convention makes the bound valid even for a nonsummable input; analytic use separately invokes entire-tail-summable.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-linear-quotient-coeff`, `mathlib:norm_pow_le`, `mathlib:IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`, `mathlib:IsUltrametricDist.norm_tprod_le_of_forall_le_of_nonneg`.

Acceptance:

- At n=0 the loss is M/S, not M. The boundary norm(a)=S is allowed in the bound.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Entireness of the linear quotient

`LocallyAnalyticDistributions:L4/entire-linear-quotient-entire` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.entireLinearQuotient_entire`.

Over ultrametric A, for every a and entire F the quotient Q_a(F) is entire.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Fix R>0 and choose S>max(R,norm(a),1). Boundedness of the coefficient sequence at S supplies M>=0.
2. The quotient bound gives norm(q_n)R^n <= (M/S)(R/S)^n. Since 0<R/S<1, the native geometric limit and squeezing give convergence to zero. Repeat for every positive R.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-linear-quotient-bound`, `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:Filter.Tendsto.bddAbove_range`, `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one`.

Acceptance:

- There is no restriction norm(a)<1. A larger radius than the tested radius is essential; boundedness at R alone is insufficient.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Division identity with evaluation as remainder

`LocallyAnalyticDistributions:L4/entire-linear-division` (theorem); proposed declaration `TauCeti.NonarchimedeanFredholm.entire_linear_division`.

For entire F and arbitrary a, F=(T-a)Q_a(F)+F(a) in native A[[T]], where F(a)=sum_(n>=0)c_n a^n and the remainder is a constant series.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. For coefficient n+1 the displayed identity is exactly q_n-a q_(n+1)=c_(n+1), the preceding recurrence.
2. For coefficient zero, split the convergent evaluation sum to obtain F(a)=c_0+a q_0. The scalar term then cancels -a q_0.
3. Apply native coefficient extensionality. The identity itself uses normed-ring summability; the separate entireness node supplies the analytic quotient over an ultrametric ring.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-linear-quotient-recurrence`, `LocallyAnalyticDistributions:L4/entire-tail-summable`, `mathlib:PowerSeries.ext`, `mathlib:PowerSeries.coeff_succ_X_mul`, `mathlib:PowerSeries.coeff_C_mul`, `mathlib:Multipliable.tprod_eq_zero_mul`, `mathlib:Summable.tsum_mul_left`.

Acceptance:

- At a=0 this is the existing native shift identity F=T shift(F)+c_0. A formal substitution with nonzero constant is never applied to a general series.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### An entire linear product cannot be a nonzero constant

`LocallyAnalyticDistributions:L4/entire-linear-product-constant` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.entire_linear_product_constant`.

If H is entire and (T-a)H=b is a constant series, then H=0 and b=0. This holds over a complete commutative normed ring without a domain assumption.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Positive-degree coefficients give h_n=a h_(n+1), hence induction gives h_n=a^k h_(n+k) for every k.
2. Choose R>=max(1,norm(a)). For fixed n, norm(h_n)<=R^(-n) norm(h_(n+k))R^(n+k), whose right side tends to zero by entireness at R and a shifted natural-index limit. The native closed-order limit lemma forces norm(h_n)=0.
3. All coefficients vanish; coefficient zero in the product identity now gives b=0. This is the linear-factor corrected entire case of the issue in Coleman A3.1; no claim is made for all restricted series.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:PowerSeries.coeff_succ_X_mul`, `mathlib:PowerSeries.coeff_C_mul`, `mathlib:PowerSeries.ext`, `mathlib:norm_pow_le`, `mathlib:le_of_tendsto`.

Typed tests:

- `linear_entire_uniqueness_boundary`: For any a in A, the native formal geometric series H=sum a^n T^n satisfies (1-aT)H=1. At a=p in Q_p it is restricted but not entire, disproving the unrestricted replacement in Coleman A3.1.

Acceptance:

- For A=Q_p, H=sum p^n T^n is restricted and (1-pT)H=1. It is not entire: at radius p its weighted coefficients are all one. Thus restricted convergence cannot replace entireness.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.
- Coleman-PadicBanach-published-1997, Lemma A3.1, printed432/PDF16; corrected linear entire case, finding LocallyAnalyticDistributions/E1. Mathematical transcription of the displayed notation in the scanned page. The stated restricted-series assertion is false; the node assumes entire H and proves its own linear case.

### Uniqueness of the entire quotient and constant remainder

`LocallyAnalyticDistributions:L4/entire-linear-division-unique` (theorem); proposed declaration `TauCeti.NonarchimedeanFredholm.entire_linear_division_unique`.

If F=(T-a)G+b=(T-a)H+c with entire G,H and b,c in A, then G=H and b=c.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Subtract the two identities. The existing entire-series subring is closed under subtraction, so G-H is entire.
2. Apply the preceding product-constant lemma to (T-a)(G-H)=c-b; conclude both differences vanish.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-linear-product-constant`, `LocallyAnalyticDistributions:L4/entire-series`.

Acceptance:

- The statement permits zero divisors and arbitrary a. It never cancels T-a inside all formal series.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Native polynomials are entire

`LocallyAnalyticDistributions:L4/polynomial-series-entire` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.polynomialSeries_entire`.

The existing polynomialSeries inclusion sends every polynomial P in A[T] to an entire series. This promotes the existing polynomials_are_entire test to a named prerequisite.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Identify the existing eval-based polynomialSeries map with the native polynomial-to-power-series inclusion by polynomial induction. Its nth coefficient is P.coeff n by the baseline coefficient comparison.
2. Above the finite polynomial degree all coefficients are zero, so at each positive radius the weighted coefficient sequence is eventually zero.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:Polynomial.coeff_coe`.

Acceptance:

- Constants and the zero polynomial are included. No analytic convergence estimate is required.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Agreement with native monic polynomial division

`LocallyAnalyticDistributions:L4/entire-linear-quotient-polynomial` (comparison); proposed declaration `TauCeti.NonarchimedeanFredholm.entireLinearQuotient_polynomial`.

For ultrametric A, arbitrary a and polynomial P, Q_a(polynomialSeries(P)) equals polynomialSeries(P divByMonic (T-a)).

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. The native monic-division identity writes P=(T-a)(P divByMonic (T-a))+P(a). Map it into native power series; both polynomial terms are entire by the preceding lemma.
2. The entire division identity gives a second decomposition, with an entire tail quotient. Uniqueness equates the quotients and also the remainders. No separate evaluation comparison for a polynomial is needed to apply uniqueness with these two constants.

Prerequisites: `LocallyAnalyticDistributions:L4/polynomial-series-entire`, `LocallyAnalyticDistributions:L4/entire-linear-quotient-entire`, `LocallyAnalyticDistributions:L4/entire-linear-division`, `LocallyAnalyticDistributions:L4/entire-linear-division-unique`, `mathlib:Polynomial.divByMonic`, `mathlib:Polynomial.modByMonic_add_div`, `mathlib:Polynomial.modByMonic_X_sub_C_eq_C_eval`.

Acceptance:

- For P=T^2, native division gives T+a; for P constant it gives zero. The polynomial operation is imported rather than recreated.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Roots and linear factors in the entire-series ring

`LocallyAnalyticDistributions:L4/entire-linear-root-factor` (theorem); proposed declaration `TauCeti.NonarchimedeanFredholm.entire_root_iff_linear_factor`.

For ultrametric A, arbitrary a and entire F, F(a)=0 if and only if there exists an entire G with F=(T-a)G.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. If F(a)=0, take G=Q_a(F); entireness and the division identity supply the factorization.
2. Conversely compare the asserted decomposition with constant remainder zero to the constructed entire decomposition with constant remainder F(a). Uniqueness forces F(a)=0.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-linear-division`, `LocallyAnalyticDistributions:L4/entire-linear-quotient-entire`, `LocallyAnalyticDistributions:L4/entire-linear-division-unique`.

Acceptance:

- The factor must be entire; a merely formal factor can exist when evaluation is nonzero. Over Q_p, T-p^(-1) is a unit in Q_p[[T]], but it does not divide 1 in Q_p{{T}}.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Published source findings awaiting independent review

The fresh source reading covered the full published printed430–435/PDF14–19,
with separate image checks of printed432 and433, and the author copy PDF22–28.
The published scan and author copy are separately identified and hashed in
sourceVersions. These findings are recorded without an author-supplied or
independent-review verdict. The bounded correction search is documented below;
"new" records that no correction was found in that search.

#### LocallyAnalyticDistributions/E1: error affecting a stated result

Published Lemma A3.1, printed432/PDF16; also author-copy PDF22–23. Display notation checked on both page images.

Printed: H(T) is in A⟨T⟩ and G(T)H(T) is in A, then either G(T) is constant or H(T)=0. (Mathematical transcription of the scanned display.)

Correction: Replace the restricted-series hypothesis H in A⟨T⟩ by the entire-series hypothesis H in A{{T}} for the stated rescaling proof. The new nodes prove the linear-factor entire case directly.

Reason: Take A=Q_p, G=1-pT and H=sum_(n>=0)p^n T^n. The leading coefficient -p is multiplicative, H is a nonzero restricted series, and GH=1; G is nonconstant. H is not entire because at radius p the weighted coefficients are all1. Rescaling T to a^M T to make the leading term dominate does not in general preserve restricted convergence, whereas entire convergence survives every fixed rescaling. This falsifies the auxiliary lemma as stated; it does not refute the later entire-series division or resultant conclusions.

#### LocallyAnalyticDistributions/E2: misprint affecting the proof

Published proof of Lemma A3.4, printed433/PDF17; also author-copy PDF24. Published formula checked on the page image.

Printed: K(T)=sum_(i=1)^n (-1)^i c_i T^(n-i). (Mathematical transcription of the scanned display.)

Correction: Insert the missing leading term: K(T)=T^n+sum_(i=1)^n(-1)^i c_i T^(n-i).

Reason: The preceding Q is monic and the proof constructs a universal splitting algebra by imposing K(T)=product_i(T-b_i). As printed K has zero T^n coefficient; equating coefficients imposes0=1, giving the zero ring and no way to infer the claimed identity in C. The monic correction is the intended polynomial and restores the splitting-algebra argument. The displayed slip alone does not disprove Lemma A3.4.

Correction search:

- 27September2026: opened the Springer version-of-record landing page https://link.springer.com/article/10.1007/s002220050127; no correction link found. Read the published scan from the recorded public mirror and the separately hashed public author copy.
- Targeted public searches for the title with erratum/correction and Coleman A3.1 with error/entire, and Coleman A3.4 with correction/erratum; no relevant correction located. This was a bounded search, not proof that none exists.
- Searched the atlas source-issues registry and research/errata/REGISTER.md for the exact title and author-copy identifier: no existing finding found. The wstein memorial directory did not open and its paper endpoint returned403, so no successful reading of that page is claimed.

For A3.1 the counterexample meets the source's multiplicative-leading-coefficient
condition: every nonzero element of Q_p has multiplicative norm. Its rescaling
argument works for entire H because every fixed rescaling remains convergent.
The local new uniqueness lemma proves its own linear case directly. For A3.4
the missing monic term collapses the displayed coefficient quotient to the zero
ring; restoring it gives the intended universal splitting polynomial. Neither
finding is represented as a disproof of the later entire resultant conclusions.

### Validation boundary

The complete suggested file compiles with zero errors and 197 proof-placeholder
warnings only, against 1,983 byte-checked pinned Mathlib sources. It contains
seventeen newly named declarations and six new typed examples. All implementation
statuses remain unchecked. There are no actual planned-supplier or Tau Ceti imports.

A separate scratch file proves eleven lemmas using one native quotient
construction, with no errors, warnings or proof placeholders, against 2,795
byte-checked Mathlib sources. Three lemmas take explicit summability hypotheses
to verify addition, the recurrence and the division identity; another proves
iteration from an explicit coefficient recurrence. The other seven verify
native coefficients, zero/shift behavior, ultrametric sum and weighted bounds,
polynomial division and the formal geometric counterexample. These checks do
not implement the planned entire convergence or analytic uniqueness theorems.

Independent exact arithmetic passes 17,775 assertions over 640 finite polynomial
systems for primes2,3,5,7, using rational coefficient pairs modeling the
nonreduced ring Q_p[epsilon]/epsilon^2. It compares descending Euclidean division
with the coefficient-tail formula, checks Horner evaluation, norm/radius bounds,
scalar/additive laws, sign/index controls and both source findings. Finite
truncation tests are not used as a proof about infinite series.

## Earlier checkpoint material

**Fredholm coefficient checkpoint, 27 September 2026.** The current packet has
80 unchecked nodes, 49 API entries, 64 packet tests and typed examples,
6 planets and 84 baseline declarations. Eight gaps, five requests and no
closed stages remain. The coefficient section below gives the current proof
dependencies of the four existing Fredholm declarations. Earlier counts and
validation reports are historical.

# Locally analytic distributions, growth, and character spaces

Current checkpoint:75 nodes; the finite-projectivity continuation and current validation are below. Earlier validation paragraphs are explicitly historical. The roadmap remains partial, with no closed stage.

This is a **partial blueprint** for the five layers L0–L4. It preserves the thirteen reviewed operator-theory nodes already integrated in the atlas and refines their dependencies. No layer is marked closed. The construction of actual distribution families is not supplied by the abstract Fredholm theory alone.

The ownership decisions of accepted restructuring RS-16 are binding. The base roadmap is **Padic measures and Iwasawa algebras** (`PadicMeasuresIwasawaAlgebras`). Its layer L0a owns scalar character-space representability, component decompositions, universal characters and coordinate changes. This roadmap imports those objects. It owns the unbounded distribution transform, growth theory and distribution-family coefficient actions, including the uniform local radii needed to evaluate a universal character on an affinoid coefficient module. There is no reverse dependency making the scalar character-space construction depend on those distribution families.

## Conventions and existing libraries

Work over a complete nontrivially valued nonarchimedean field K. For the operator theory, A is a nonzero commutative Noetherian K-Banach algebra with a compatible submultiplicative ultrametric norm. Banach A-modules are complete and Hausdorff and have compatible bounded scalar action. A need not be a field, reduced or affinoid. Treat the zero algebra as a separate trivial case.

An operator norm on an A-linear map is its norm after restricting scalars to K. **Finite rank means that the image lies in a finitely generated A-submodule.** It does not mean finite dimension over K or that the containing module is free. Complete continuity means approximation in that operator norm by finite-A-image maps.

The pinned library baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet lists 66 Mathlib declarations whose actual source statements and surrounding hypotheses were inspected in source files verified against the pinned Git tree. In particular, reuse the following rather than reconstructing them:

* `ZeroAtInftyContinuousMap`, its extensionality theorem and completeness instance. For a discrete index type I this is the carrier c_A(I), with its sup norm. I is arbitrary, not necessarily countable.
* `NonarchimedeanAddGroup.summable_iff_tendsto_cofinite_zero` and `HasSum.mul_of_nonarchimedean`. These supply unconditional summability and multiplication of sums, not just convergence of a chosen enumeration.
* `ContinuousLinearMap.exists_preimage_norm_le` and `ContinuousLinearMap.isOpenMap`. These already apply over nontrivially normed fields, so the Banach open-mapping part of the nonarchimedean argument is not new work.
* `Matrix.det_mul` for finite matrices over a commutative ring.

The inspected definition `IsCompactOperator` is a related but different notion: some neighbourhood has relatively compact image. It is not substituted for complete continuity over A. For example, the A-linear identity of A is finite A-rank even when A is an infinite-dimensional K-affinoid algebra. This is not a claim that its image of a neighbourhood is relatively compact.

All five LAD rows of the reviewed aggregate `data/library-coverage.json` were read, together with the integrated thirteen-node decomposition, its accepted review, the LAD decisions of RS-16 and all applicable link records. Its Tau Ceti search results remain leads, not a fresh exhaustive audit. The native operator, Noetherian module and c0 interfaces listed in the packet are targeted statement checks.

## L0. Banach spaces of locally analytic functions

**Imports:** `PadicMeasuresIwasawaAlgebras:L0` and `:L2`.

The target is the fixed-radius Banach space of functions analytic on each residue ball, with its Gauss norm, over finite extensions of Q_p and finite-dimensional p-adic analytic manifolds. The declarations must prove uniform radius on compact manifolds, independence of charts, restrictions, tensor products and continuous inclusions. Construct the locally convex inductive-limit topology and compare its strong continuous dual with the projective system of Banach duals. The continuous-function dual from the base roadmap supplies the bounded-measure injection, not the locally analytic topology by definition.

The Q_p-locally analytic and F-locally analytic notions must be distinguished on O_F and its products. Equality of underlying functions does not identify their locally convex topologies. The source proofs for this layer have not yet been decomposed; its coverage is `not_read`. The operator-theory construction of c0 in L4 does not count as coverage of L0.

## L1. Amice's unbounded transform

**Imports:** L0 and the bounded transform and operator conventions from `PadicMeasuresIwasawaAlgebras:L2`.

Prove the unbounded Amice transform, including the Frechet topology comparison, in RJW Theorem 3.43. Its target series converge at every radius r<1, which is different from the entire series required by Fredholm theory. Extend restriction, twisting, phi, psi and differentiation with exact norm and domain statements. Division by x is constructed on distributions supported on units; it does not use a globally defined analytic inverse of x on Z_p.

Primitives on admitted balls are unique modulo locally constant functions. A single global additive constant requires a separate continuation theorem. Applications at p-power roots of unity must establish the logarithm's domain and cancellation of apparent poles. RJW was identified as arXiv:2309.15692, but its proof text was not read in this pass. This layer remains `not_read`.

## L2. Admissible growth and uniqueness

**Import:** L1.

Define order-h admissibility by explicit small-ball norms on locally polynomial test functions and compare it with coefficient growth. State the Amice–Velu/Vishik extension and uniqueness theorem with its strict degree bound. Prove that order zero agrees with bounded measures in the intended setting. Do not apply strict small-slope uniqueness at critical slope.

In several variables, retain vectors of radii and growth bounds. A specified collection of arithmetic characters determines a distribution only after the required density or admissibility theorem has been proved. No general principle identifying arbitrary analytic functions from unspecified arithmetic points is admitted. This layer remains `not_read`.

## L3. Character spaces and Mellin transforms

**Imports:** L2; `PadicMeasuresIwasawaAlgebras:L0a` and `:L3`.

Import, rather than reconstruct, the scalar character-space functor, its representability, universal character, generator changes, odd-prime components and the dyadic decomposition. The work here is the scalar Mellin transform, evaluation under coefficient extension, weight derivatives, twists and functoriality for the relevant ray-class group maps. Distinguish bounded functions arising from measures and meromorphic functions arising from pseudo-measures, with explicit evaluation domains.

The geometric comparison uses affinoid constructions and open gluing. Diamonds are not needed. General completed tensor products are not silently requested from the foundational AdicSpaces roadmap, whose stated scope excludes them. Source decomposition of this layer remains `not_read`.

## L4. Families and operator theory

### 4.1. Orthonormal coordinates and complete continuity

Use the source convention

\[
 u(e_i)=\sum_j a_{ij}e_j,\qquad r_j(u)=\sup_i\|a_{ij}\|.
\]

Thus i is an input index and j an output index. Let pi_S retain a finite set S of output coordinates.

A chosen orthonormalization is an A-linear isometry to c_A(I). A potential orthonormalization is a continuous A-linear equivalence with continuous inverse; equivalently, the module becomes ONable after replacing its norm by an equivalent norm. Do not confuse this with an algebraic basis of an infinite-dimensional module.

**Definition API.** `orthonormalization_coordinates` reconstructs an element from its coordinates; `potentiallyON_iff_equivalentNorm` gives the two-sided norm-bound characterization; `coordinateProjection_norm_le` states that finite coordinate projections are contractions in an ON chart. Unit tests: `empty_basis` gives the zero module; `finite_basis` compares with the max norm on A^n; `potential_not_isometric` uses a rescaled one-dimensional K-norm whose scale lies outside the value group, giving a potential but not unit-length ON basis for that norm.

**Bounded-family extension.** A bounded family m_i in M determines a unique continuous A-linear map c_A(I) to M by summing x_i m_i. The cofinite-null property of x and the boundedness of m give unconditional summability. Under the normalized action bound its norm is sup_i norm(m_i). The API is `c0Lift_apply`, `c0Lift_single`, `c0Lift_unique`. Tests are `zero_family`, `basis_family`, and `unbounded_family`: the images rho^(-i), with 0<norm(rho)<1, cannot be the basis images of a bounded functional.

**Imported complete-continuity API.** `finiteImage_isCompletelyContinuous` admits finite-A-image maps; `isCompletelyContinuous_comp` gives the two-sided ideal property; `isClosed_completelyContinuous` identifies the closed approximation class. Tests: `identity_on_A` is admitted even for infinite K-dimension; `identity_on_infinite_c0` is rejected over nonzero A; `decaying_diagonal` admits diag(rho^n) without requiring finite K-rank.

The finite-submodule argument is split into canonical topology, algebraic finite-coordinate detection, the inverse norm bound and uniform coordinate approximation. For a finite submodule Q and epsilon>0, prove

\[
 \|q-\pi_Tq\|\leq\epsilon\|q\|\quad(q\in Q)
\]

for a common finite T. The bounded-preimage theorem supplies uniformly controlled coefficients relative to finitely many generators. Their simultaneous small tails give the estimate. This is a uniform assertion on Q, not just a test on generators. The BGR canonical-topology and closed-submodule proofs still require full decomposition.

It follows that complete continuity of u is equivalent to cofinite decay of r_j(u), and pi_S u then converges to u in operator norm. The Noetherian hypothesis is retained in the finite-image-to-column-decay direction. Source: Buzzard Lemma 2.3 and Proposition 2.4.

### 4.2. Determinants, entire series and two different product rules

For a completely continuous endomorphism define

\[
 P_u(T)=\sum_{n\geq0}c_n(u)T^n,\quad c_0=1,
 \qquad c_n=(-1)^n\sum_{|S|=n}\det(a_{ij})_{i,j\in S}.
\]

The family of minors of each fixed size tends to zero outside finite subsets of its index set. Use unconditional summability to construct the formal series; prove entireness separately.

**Determinant API.** `fredholmSeries_coeff`, `fredholmSeries_constant`, `fredholmSeries_isEntire`. Tests: `zero_operator` gives one; `rank_one_scalar` gives 1-aT; `nonzero_nilpotent` gives one for a nonzero two-by-two nilpotent block. The last test prevents a false equivalence between determinant one and the zero operator.

Define A{{T}} by norm(c_n)R^n tending to zero for **every** R>0. Its topology uses the family of Gauss seminorms; do not call it complete for the single radius-one norm. The API is `mem_entireSeries`, `entire_eval`, `entire_eval_bound`. Tests: `polynomials_are_entire`, `superexponential_coefficients` with c_n=rho^(n*n), and `geometric_nonexample` with c_n=1. The geometric series distinguishes this algebra from L1's open-unit-disc algebra.

If u has image in the coordinate module A^S, all minors meeting its complement vanish. Its determinant therefore equals the ordinary determinant on A^S. General finite free submodule comparison, chart independence, equivalent-norm invariance and the cyclic identity P_uv=P_vu follow the reviewed Buzzard Lemma 2.5–2.7 route. In the cyclic proof only u is completely continuous. Truncate v on the finite relevant image; **do not assert that its global coordinate truncations converge to v**.

The new proof chain makes evaluation in the product identity explicit.

**Uniform minor tails.** Suppose one cofinite-null bounded family b_j bounds the output-column norms of an entire family of matrices. Given R>0 and 0<q<1, choose finite T with Rb_j<=q outside T. Put m=card(T) and B=max(1,R sup_j b_j). Then, uniformly in the matrix,

\[
 \|c_n\|R^n\leq B^m q^{\max(n-m,0)}.
\]

Every product in a principal n-minor uses distinct output columns. At most m are exceptional. Ultrametricity introduces neither a factorial nor a factor counting permutations. Passing through the unconditional sum preserves the bound.

For fixed n>=1 and norm(u),norm(v)<=C with C>=1, telescoping the difference of determinant products gives

\[
 \|c_n(u)-c_n(v)\|\leq\|u-v\|C^{n-1}.
\]

Consequently an operator-norm convergent family with a common column majorant has determinants converging in every R-Gauss seminorm. Choose a uniformly small tail in degree, then handle the finitely many remaining coefficients. For R>=1 this justifies evaluation at T=1. Coefficientwise convergence alone would not do so.

**Evaluated product identity.** Set w=u+v-uv, with uv meaning u composed with v. For common finite coordinate sets S, set u_S=pi_Su, v_S=pi_Sv and w_S=u_S+v_S-u_Sv_S. All three approximants have image in the same A^S and converge in norm. A common column majorant is

\[
 b_j=\max\{r_j(u),r_j(v),\|v\|r_j(u)\}.
\]

The output column in the composition estimate belongs to u. Apply ordinary `Matrix.det_mul` to (1-u_S)(1-v_S), then use the Gauss convergence proved above. This yields

\[
 P_{u+v-uv}(1)=P_u(1)P_v(1),
\]

without a commutation assumption. For a (Pr) module use one splitting i,r with ri=1 for both operators. The lift u to iur preserves sums and products and reduces the assertion to c0.

The rank-one regression u=v=1 is essential: P_{u+v-uv}(T)=1-T, whereas P_u(T)P_v(T)=(1-T)^2. This is not a whole-series identity for u+v-uv. By contrast, the direct-sum identity P_(u plus v)=P_u P_v really is an identity of series.

### 4.3. Property (Pr), scalar extension and its determinant

Define (Pr) by a continuous split embedding into a potentially ONable module, or equivalently into some c_A(I). It does not include finite generation or constant rank. Prove its equivalent lifting property for **surjective** continuous maps of Banach modules, using norm-controlled lifts of basis images. A bare choice of lifts is not enough to prove continuity. A finite (Pr) module is algebraically projective by splitting a finite free presentation.

**Property API.** `hasPr_of_potentiallyON`, `hasPr_retract`, `hasPr_iff_split_c0`. Tests: `zero_hasPr`, `finite_free_hasPr`, and `projective_not_free`. The last uses A=K times K and e=(1,0): eA is a continuous summand of A, but its component ranks differ, so it is not free.

Define the determinant on M with (Pr) by extending u by zero on a complement. The cyclic identity compares different complements. Its API is `fredholmSeriesPr_split`, `fredholmSeriesPr_agrees_ON`, `fredholmSeriesPr_baseChange`. Tests: `pr_zero_operator`, `add_zero_complement`, and `variable_rank_projective`. For id on eA the determinant is 1-eT. Its leading coefficient is not a unit, although the operator is invertible.

Completed scalar extension must identify the completed extension of c_A(I) with c_B(I) for a **continuous**, not necessarily contractive, algebra map A to B. Transfer column estimates and convergent coefficient sums. The completed tensor carrier, BGR 2.1.7 proof and the extension of retractions in Buzzard Lemmas 2.12–2.13 remain open decomposition tasks; they are not fields of an assumed eigenvariety structure.

### 4.4. Resultants, resolvents and finite-slope summands

For monic Q, establish unique division P=QS+R with S entire and degree R<degree Q. The recurrence estimates proving an entire quotient require an explicit source expansion. Define Res(Q,P) as the determinant of multiplication by the remainder of P on the finite free quotient A[T]/(Q). Its API is `entireResultant_remainder`, `entireResultant_mul`, `entireResultant_linear`. Tests: `constant_divisor` gives Res(1,P)=1, even for P=0; `linear_evaluation` gives Res(T-a,1-bT)=1-ba; `common_factor` gives Res(Q,Q)=0 for positive-degree monic Q.

The determinant/adjugate criterion and analytic division give: Res(Q,P) is a **unit** exactly when P and Q generate the unit ideal of A{{T}}. Being nonzero is not enough over A. The spectral resultant D(B,P), and its identification with the determinant of polynomial functional calculus, is a separate construction whose transport from Coleman A3.8–A3.9 is still unresolved here.

Define the Fredholm resolvent by v_0=1 and v_n=c_n 1+u v_(n-1). Serre's adjugate-minor estimate gives entire convergence of the operator-valued series; the recurrence by itself does not. Prove both identities (1-Tu)F_u=F_u(1-Tu)=P_u(T)1. API: `resolventCoeff_zero`, `resolventCoeff_succ`, `resolvent_entire`, `resolvent_identity`. Tests: `rank_one_resolvent` is one; `diagonal_two` is diag(1-bT,1-aT); `nilpotent_two` is 1+TN for a square-zero two-by-two block.

The reviewed polynomial criterion says Q is coprime to P_u exactly when Q*(u) is invertible. The new evaluated product theorem supplies a formerly implicit step in its converse. If L=Q*(u) is invertible, then v=1-L and w=1-L^(-1) are completely continuous, (1-v)(1-w)=1, and P_v(1)P_w(1)=1. **Identifying this value with the appropriate resultant still needs the spectral-mapping theorem.** Closing the product gap does not close all of Lemma 3.1.

At a Hasse root a of order h, differentiate the resolvent identity with Hasse derivatives and evaluate. Put z_s=Delta^s F_u(a), c=Delta^h P_u(a), e=c^(-1)(1-au)z_h and f=-c^(-1)u z_(h-1). The relations e+f=1 and f e^h=0 give complementary projectors e^h and 1-e^h. They lie in the operator-norm closure of A[u]. On their summands, (1-au)^h is respectively invertible and zero. Handle h=0 separately.

On the nilpotent summand the identity is a polynomial in u without constant term, hence completely continuous. A sufficiently close finite-A-image approximation is invertible by the Neumann series, proving finite generation. Property (Pr) then gives projectivity.

The rank argument must not conceal either of two pitfalls. First, an invertible operator on a finite projective module does not by itself give a determinant polynomial with unit leading coefficient before constant rank is known: id on eA is the counterexample above. Prove rank h on each maximal-ideal fibre from the exact Hasse order and the complementary factor's invertibility, then use the constant-rank determinant and analytic division argument. Second, equality on all residue fields is not equality over a nonreduced ring: 1+epsilon T over K[epsilon]/(epsilon^2) is a regression test.

For P_u=QS with Q(0)=S(0)=1, Q polynomial with unit leading coefficient and Q,S analytically coprime, obtain the finite projective slope summand N of rank degree Q. The initial root construction gives power-annihilation by Q*(u). The final determinant comparison P_(u|N)=Q and finite-projective Cayley–Hamilton are needed to prove that Q*(u) itself kills N. This final step is retained from Buzzard Theorem 3.3.

### 4.5. Distribution families and acceptance boundary

The actual affinoid-valued analytic functions and distributions, integral models, completed tensor products, specialization maps, universal-character actions and their uniform local radii remain part of L4. They are not supplied by naming an abstract Banach module. The semigroup operators used in modular symbols and automorphic cohomology require their own continuity and complete-continuity estimates. Specialization must preserve a stated slope-adapted factorization, not an arbitrary pointwise numerical slope cutoff.

Exports are required by the atlas consumers in PadicFamilies, ModularSymbolsPadicLFunctions, AutomorphicPadicLFunctions, AutomorphicGaloisRepresentationsPartII and PhiGammaModulesAndIwasawaCohomology. The acceptance suite must include an order-zero comparison, a positive-order distribution that is not a bounded measure, multivariable growth tests, strict-slope uniqueness and universal-character evaluation under scalar extension.

## Coordinate detection and the finite-generation criterion

The elementary interfaces below refine the operator theory without asserting that all its analytic foundations are settled. In particular, the finite-coordinate lemma is algebraic, whereas closedness of a finite submodule in a Banach module still uses the BGR input.

### One complete-continuity predicate

`AdicSpacesPartII:R3/completely-continuous-map` already owns the finite-range approximation predicate and its composition, addition and closure API. This packet imports that predicate. The existing `completely-continuous` ID is retained as a comparison, so its consumers and the reviewed Fredholm graph are preserved. The suggested file labels the supplier signature as a stub and uses a local abbreviation for it.

There are two conventions to compare. Buzzard calls an operator finite rank when its image is contained in a finite A-submodule. The supplier asks that the image itself be finitely generated. Over a Noetherian ring A these agree: `Submodule.FG.of_le` applies to the image contained in the finite submodule, and the reverse direction takes the image itself as the containing module. This argument does not use freeness or finite K-dimension. Without Noetherianity, a submodule of a finite module need not be finite, so the comparison must retain that hypothesis.

The supplier's mathematical contract currently assumes affinoid coefficients. Its suggested ordinary predicate has a broader signature, but a broad signature alone is not a proof plan for the required generality. The request to R3 asks for the ordinary predicate and ideal/closure API over commutative Noetherian K-Banach algebras and compatible complete modules. The strict complete-continuity variant is not part of this import. This request is an explicit dependency boundary for the generic Fredholm theory.

`isCompletelyContinuous_iff_containing_finite` is the comparison API. The original tests are preserved: the identity of A has finite A-image, the identity on infinite c0 does not, and a decaying diagonal does. These tests prevent the imported notion from being replaced by finite K-rank or by `IsCompactOperator`.

### The existing c0 carrier supports ring coefficients

Mathlib supplies `ZeroAtInftyContinuousMap`, its pointwise module operations and the norm inherited from bounded continuous functions. Its field-valued `NormedSpace` instance does not directly give the missing continuous A-action when A is only a normed ring. The scalar-bound node supplies the precise interface:

\[
\|a x\|\leq\|a\|\,\|x\|.
\]

For each coordinate, submultiplicativity bounds the product by the right-hand side. `BoundedContinuousFunction.norm_coe_le_norm` bounds each coordinate of x, and `BoundedContinuousFunction.norm_le` passes the uniform bound to the existing norm. Its nonnegative-bound condition handles an empty domain correctly. `IsBoundedSMul.of_norm_smul_le` and `IsBoundedSMul.continuousSMul` then give joint continuity. No field structure on A and no replacement sequence-space carrier are required.

The instance API is `c0ContinuousSMul`. Besides the inherited coordinate tests, `scalar_empty` checks the zero-index norm and `scalar_single` checks a times the vector with coefficient b equals the vector with coefficient ab. The repaired Lean signatures permit coordinate index types and coefficient types to inhabit different universes. This matters for the finite and countable examples with an arbitrary coefficient algebra.

### Algebraic finite-coordinate detection

Let B be any commutative Noetherian ring and Q a finite submodule of the full product B^I, where I is arbitrary. Choose generators q_1,...,q_r. For i in I, form the column

\[
v_i=(q_1(i),\ldots,q_r(i))\in B^r.
\]

The module B^r is Noetherian. Therefore the span of all the columns is finitely generated. The pinned finite-subset-of-generators theorem chooses a finite collection of the actual columns that spans it; choose their indices as S. This uses Noetherianity of the finite product B^r, not of the generally much larger product B^I.

If x and y in Q agree on S, express x-y as a linear combination of the q_alpha. Its coefficients define a linear functional on B^r. It vanishes on the selected columns, hence on their span, hence on every v_i. Every coordinate of x-y is therefore zero. This proves `finite_coordinate_detection` and the algebraic part of Buzzard Lemma 2.3(a).

The empty submodule needs no coordinates. The constant vector (1,0) in (K times K)^N gives a test with a nonfree finite submodule: coordinate zero detects it. Conversely a coordinate vector supported outside S is nonzero while all its S-coordinates vanish. This last test rules out an assertion that an arbitrary finite coordinate set detects every finite submodule.

For a finite submodule of c_A(I), apply the lemma to its image under the coordinate embedding; finite generation of this image is `Submodule.FG.map`. Proving that its induced norm is equivalent to the canonical finite-module norm remains dependent on BGR closedness and topology. The algebraic lemma does not conceal that analytic step.

### Complete continuity of the identity

The pointwise approximation predicate is equivalent to strict approximation in the K-operator norm. For the forward implication, approximate with pointwise error epsilon/2 and use `ContinuousLinearMap.opNorm_le_bound`. For the reverse implication, `ContinuousLinearMap.le_opNorm` bounds each value. `Metric.mem_closure_iff` identifies this with the norm-closure formulation. Strict error less than zero is impossible, which tests the positive-radius condition.

Now suppose the identity of M is completely continuous. Choose a finite-A-image operator alpha with norm(id-alpha)<1. Work in the existing complete normed ring of continuous K-linear endomorphisms and apply `isUnit_one_sub_of_norm_lt_one` to beta=id-alpha. The result says that alpha, after scalar restriction, is invertible. The native bijectivity criterion gives surjectivity of its underlying function. For this argument there is no need to construct a separate norm on the A-linear endomorphism ring or to prove that the inverse is A-linear.

The image of alpha is contained in a finite A-submodule Q. Surjectivity forces Q=M, so `Module.finite_def` gives finite generation over A. Conversely a finite A-module has a finite-range identity and a constant approximating family. Thus complete continuity of the identity is equivalent to finite A-generation, without potential ONability or property (Pr). The zero module, arbitrary endomorphisms of finite A-modules and the identity on a nonfinite A-module provide the three tests.

This closes the Neumann-series interface in the proof plan for Buzzard Proposition 3.2. The subsequent projectivity and rank arguments still have their separately recorded dependencies.

### Tests for norms and varying rank

All three inherited tests missing from the original prototype now have Lean example signatures. For the rescaled-line test, take an actual normed K-line M with an algebraic coordinate e and norm(x)=c norm(e(x)), for c>0 outside the value group of K. The coordinate gives a continuous equivalence, but an isometry would make c the norm of a nonzero scalar, a contradiction. The test states the rescaling law explicitly; it does not assume the desired failure of isometry.

For the other two tests, use the actual submodule generated by (1,0) inside A=K times K. Projection onto the first component gives a continuous splitting, so eA has (Pr). It is nonzero and the nonzero scalar (0,1) annihilates it; a nonzero free A-module is faithful, so eA cannot be free. Extending its identity by zero on the complementary factor is multiplication by e on the free rank-one module A. Its Fredholm determinant is consequently 1-eT. The leading coefficient is a nonunit, despite invertibility of the identity on eA. These are concrete safeguards for the later constant-rank argument.

## L4 continuation: Hasse calculus for the Riesz projectors

The source proof differentiates an entire operator-valued resolvent. This bridge
requires a formal operation, a norm estimate and an actual convergent evaluation.
Keep these separate. Polynomial Hasse derivatives already exist at the pin; the
new construction extends them to the native power-series carrier. All formulas
admit positive characteristic. Completeness enters evaluation, not the formal
coefficient construction or its norm bound.

The analytic statements below retain the explicit bounded scalar-action constant
C and the K-operator norm. In particular, the proof does not silently replace a
bounded A-action by a contractive one. The operator-valued adjugate estimate now has the separate finite-matrix,
truncation and retraction chain below; its convergence is not inferred from
the algebraic recurrence.

### Hasse derivatives of formal power series

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-series` (construction).

For any possibly noncommutative semiring B and s in N, construct the additive B-linear operation Delta_s on the existing B[[T]] by coefficient_n(Delta_s f)=choose(n+s,s) times coefficient_(n+s)(f). Multiplication by the natural number means repeated addition, with no inverse factorial and no convergence assumption.

**Hypotheses:** B is a semiring; s and coefficient indices are natural numbers. The variable T is central.

**Dependencies:** `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`.

**Proof/construction.** Apply the native power-series constructor to the displayed coefficient sequence. Coefficient extensionality and distributivity prove additivity and left B-linearity; natural-number multiplication commutes with left scalar multiplication. Order zero uses choose(n,0)=1. A monomial of degree d<s has every coefficient zero; at d=s its Hasse derivative is the constant coefficient. These finite computations do not shift a formal series by a nonzero constant.

**Uses:** LocallyAnalyticDistributions:L4/hasse-product: Differentiates the formal two-sided resolvent identity. LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation: Supplies the coefficient sequence to be summed after convergence is proved.

**API**

- `hasseSeries_coeff` (characterisation): Coefficient n is choose(n+s,s) times coefficient n+s.
- `hasseSeries_zero` (simp): Delta_0 f=f.
- `hasseSeries_add` (compatibility): Delta_s(f+g)=Delta_s f+Delta_s g.
- `hasseSeries_smul` (compatibility): Delta_s(b f)=b Delta_s f, including noncommutative B.

**Unit tests**

- `hasse_order_zero` (degenerate): Delta_0 fixes every series.
- `hasse_degree_boundary` (non-example): Delta_s(b T^d)=0 whenever d<s.
- `hasse_top_monomial` (characterisation): Delta_s(b T^s)=b, not s factorial times b.
- `hasse_characteristic_two` (non-example): Over Z/2, Delta_2(T^2)=1 although the second ordinary polynomial derivative is zero.

**Acceptance:** Do not define this by dividing an iterated derivative by s factorial. Formal substitution T+a is not performed on arbitrary formal power series.

**Sources:** Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Polynomial and series Hasse derivatives agree

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-polynomial-comparison` (comparison).

The native inclusion of B[T] in B[[T]] carries Polynomial.hasseDeriv s p to Delta_s of the included polynomial, for every semiring B.

**Hypotheses:** No topology, characteristic restriction or commutativity of B.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-series`, `mathlib:Polynomial.hasseDeriv`, `mathlib:Polynomial.hasseDeriv_coeff`, `mathlib:Polynomial.coeff_coe`.

**Proof/construction.** Compare coefficient n on both sides. The pinned polynomial formula is choose(n+s,s) times coefficient n+s. Natural-number scalar multiplication is its natural cast multiplied on the left. This is an adapter to the existing polynomial operation, not a new polynomial differentiation theory.

**Acceptance:** Preserve the order of coefficient multiplication over noncommutative semirings.

**Sources:** Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Hasse product formula for power series

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-product` (lemma).

For f,g in B[[T]] and s in N, Delta_s(fg)=sum over i+j=s of (Delta_i f)(Delta_j g), with f before g in every product.

**Hypotheses:** B is any semiring; the sum over pairs of natural numbers with i+j=s is finite.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-polynomial-comparison`, `mathlib:Polynomial.hasseDeriv_mul`, `mathlib:PowerSeries.coeff_trunc`, `mathlib:PowerSeries.coeff_mul_eq_coeff_trunc_mul_trunc`.

**Proof/construction.** Fix the coefficient n to be compared and truncate both f and g at N=n+s+1. All coefficients used on the left have degree at most n+s. On the right a contributing convolution pair r+t=n and Hasse pair i+j=s uses coefficients r+i and t+j, both less than N. Replace each by its polynomial truncation coefficient. Apply the existing polynomial Hasse product theorem and the polynomial comparison. Coefficient extensionality concludes the formal identity without any infinite rearrangement.

**Acceptance:** A noncommutative coefficient test must distinguish fg from gf.

**Sources:** Serre-EndomorphismesCC-1962, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Hasse coefficient radius bound

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-coefficient-bound` (lemma).

For a normed ring B, f in B[[T]], s,n in N and real R>0, norm(coefficient_n(Delta_s f)) R^n is at most R^(-s) norm(coefficient_(n+s)(f)) (2R)^(n+s).

**Hypotheses:** B need not be commutative, complete, ultrametric or norm-one. R is strictly positive.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-series`, `mathlib:norm_pow_le_mul_norm`, `mathlib:Nat.choose_le_two_pow`.

**Proof/construction.** The additive counterpart norm_nsmul_le of the indexed multiplicative declaration bounds repeated addition by choose(n+s,s) times the coefficient norm. Bound the binomial coefficient by 2^(n+s). Multiply by the nonnegative R^n and rewrite 2^(n+s) R^n as R^(-s)(2R)^(n+s). Positivity of R justifies cancellation.

**Acceptance:** The right radius is 2R; a fixed radius argument alone does not prove entireness. The zero operator ring is admitted; no norm-one identity is used.

**Sources:** Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Hasse derivatives preserve entireness

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-entire` (lemma).

If for every real R>0 the sequence norm(f_n) R^n tends to zero, the same holds for the coefficients of Delta_s f, for each fixed s. This applies to a possibly noncommutative normed coefficient ring.

**Hypotheses:** B is a normed ring; no completeness is needed for this coefficient limit statement.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-coefficient-bound`, `LocallyAnalyticDistributions:L4/entire-series`.

**Proof/construction.** Apply the original decay at 2R to the shifted index n+s, which tends to infinity. Multiply by the fixed factor R^(-s). The Hasse coefficient norm is nonnegative and bounded by this sequence. Squeeze to zero, for each R>0. On commutative A this is exactly membership in the existing entire-series carrier.

**Acceptance:** Entireness means all positive radii, not merely radii less than one.

**Sources:** Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Evaluated Hasse derivatives of the resolvent

**Declaration:** `LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation` (construction).

For a in A and s in N, construct z_s(a)=sum_n choose(n+s,s) a^n v_(n+s) as a continuous A-linear endomorphism of M, where v_n are the existing Fredholm resolvent coefficients. The sum converges in the native K-operator norm.

**Hypotheses:** Standing Banach hypotheses; M has (Pr) and u is completely continuous. Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one.

**Dependencies:** `LocallyAnalyticDistributions:L4/resolvent-series`, `LocallyAnalyticDistributions:L4/hasse-entire`, `mathlib:ContinuousLinearMap.instCompleteSpace`, `mathlib:ContinuousLinearMap.opNorm_le_bound`, `mathlib:ContinuousLinearMap.le_opNorm`, `mathlib:Summable.of_norm_bounded_eventually_nat`, `mathlib:summable_geometric_of_lt_one`.

**Proof/construction.** Form the Hasse coefficient series in the existing complete normed ring of continuous K-linear endomorphisms. The previous entireness lemma applies to the norm after scalar restriction. Choose rho>max(norm(a),0). Hasse entireness makes norm(w_n) rho^n eventually at most one. The scalar-action bound and operator-norm inequality give norm(a^n w_n) <= C (norm(a)/rho)^n eventually. Thus the norms and the operators are summable by the real geometric series and completeness. Every partial sum is A-linear. Operator-norm convergence implies pointwise convergence, and continuity of scalar multiplication lets the A-linearity equality pass to the limit. Package the limit as the native continuous A-linear map; uniqueness of limits makes it independent of the chosen bound and radius. At s=0 compare term by term with the existing resolvent evaluation. At a=0 the only surviving term is v_s. This uses no change of module norm and creates no competing operator carrier.

**Uses:** LocallyAnalyticDistributions:L4/evaluated-hasse-resolvent: Evaluates the formal differentiated identity. LocallyAnalyticDistributions:L4/riesz-root-projectors: Constructs the operators z_h and z_(h-1) entering the projectors.

**API**

- `resolventHasseAt_hasSum` (characterisation): The binomially weighted resolvent coefficient sequence has this sum in the native K-operator norm, with the explicit bounded-action hypothesis.
- `resolventHasseAt_zero` (compatibility): Hasse order zero agrees with the existing resolventAt.
- `resolventHasseAt_at_zero` (simp): At a=0 the value is exactly v_s.

**Unit tests**

- `hasse_scalar_resolvent` (degenerate): On the line A with u=a, the resolvent numerator is constant one, so z_1(t)=0.
- `hasse_diagonal_resolvent` (characterisation): For diag(a,b), z_1(t)=diag(-b,-a), independent of t.
- `hasse_nilpotent_resolvent` (non-example): For the nonzero nilpotent two-by-two Jordan block N, z_1(t)=N even though P_N=1.

**Acceptance:** This construction consumes resolvent-series entireness, now supported by resolvent-recurrence-entire and its separate adjugate/truncation/retraction chain. The recurrence alone cannot supply convergence.

**Sources:** Serre-EndomorphismesCC-1962, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Evaluated Hasse resolvent recurrence

**Declaration:** `LocallyAnalyticDistributions:L4/evaluated-hasse-resolvent` (lemma).

For every s>=0 and a in A, (1-au) z_(s+1)(a) - u z_s(a) = Delta_(s+1) P_u(a) times 1, and z_(s+1)(a)(1-au) - z_s(a)u has the same value. The order-zero identity is the existing two-sided resolvent identity, using z_0(a)=F_u(a).

**Hypotheses:** Standing Banach hypotheses; M has (Pr) and u is completely continuous. Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-product`, `LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation`, `LocallyAnalyticDistributions:L4/hasse-polynomial-comparison`, `LocallyAnalyticDistributions:L4/resolvent-series`, `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:HasSum.mul_left`, `mathlib:HasSum.mul_right`.

**Proof/construction.** Apply the formal product formula to (1-Tu)F_u=P_u times 1. Its only nonzero derivatives on the first factor have orders zero and one, with Delta_1(1-Tu)=-u. This gives the left formal recurrence; start with F_u(1-Tu) for the right recurrence. The Hasse evaluation construction gives absolute norm summability at a. Continuous left/right multiplication may therefore pass through the sum. The extra T shifts the index with an explicit zero constant term, and multiplication by a is the bounded scalar operator. Coefficient-wise scalar identities evaluate to Delta_(s+1) P_u(a) times the identity: the map b to scalar multiplication by b is bounded by C. Preserve both product orders until commutation is established separately.

**Acceptance:** At a Hasse root of order h the right side vanishes for s+1<h and equals the specified unit c at s+1=h. The s=0 identity is not obtained by using a negative derivative order.

**Sources:** Serre-EndomorphismesCC-1962, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Hasse resolvent values lie in the polynomial closure

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-polynomial-closure` (lemma).

For every a in A and s in N, the restricted K-linear map z_s(a) belongs to the closure, in the native K-operator norm, of the set of finite polynomial expressions sum_i b_i u^i with b_i in A.

**Hypotheses:** Standing Banach hypotheses; M has (Pr) and u is completely continuous. Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one.

**Dependencies:** `LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation`, `LocallyAnalyticDistributions:L4/resolvent-series`, `mathlib:hasSum_iff_tendsto_nat_of_summable_norm`.

**Proof/construction.** Induct on n in v_0=1 and v_(n+1)=c_(n+1) times 1+u v_n to express v_n as a polynomial in u with scalar A-coefficients. Each finite partial sum defining z_s(a) remains a polynomial in u; the binomial and a powers are scalar coefficients. The construction proves norm summability, hence convergence of initial partial sums to z_s(a). A limit of elements of the polynomial set lies in its closure. There is no use of a norm on A-linear endomorphisms independent of scalar restriction.

**Acceptance:** The topology is operator norm, not pointwise convergence. The zero module is included.

**Sources:** Serre-EndomorphismesCC-1962, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Hasse resolvent values commute

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-resolvent-commutation` (lemma).

Each z_s(a) commutes with u and with every z_t(b), for all a,b in A and s,t in N.

**Hypotheses:** Standing Banach hypotheses; M has (Pr) and u is completely continuous. Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-polynomial-closure`, `mathlib:ContinuousLinearMap.toNormedRing`.

**Proof/construction.** A-linearity of u makes every scalar multiplication by A commute with u; commutativity of A then makes all finite polynomials in u commute with one another. For a fixed polynomial operator q, the equation xq=qx defines a closed set because multiplication in the native K-operator ring is continuous. Taking the first limit shows z_s(a) commutes with each polynomial. Fix z_s(a) and take a second limit through the same closed commutation equation. This proves commutation with z_t(b); choosing q=u proves the first assertion. Faithfulness of scalar restriction returns the A-linear equalities.

**Acceptance:** Use two successive limits, not an unproved assertion that arbitrary limits preserve products uniformly.

**Sources:** Serre-EndomorphismesCC-1962, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14).

### Roots of an entire series with unit constant are units

**Declaration:** `LocallyAnalyticDistributions:L4/entire-root-unit` (lemma).

If f in A{{T}} has constant coefficient one and f(a)=0, then a is a unit with inverse -sum_(n>=0) f_(n+1) a^n. In particular a positive-order Hasse root of a Fredholm determinant is a unit.

**Hypotheses:** A is a complete commutative normed ring; no field, reducedness, Noetherianity or characteristic hypothesis is needed.

**Dependencies:** `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:Summable.of_norm_bounded_eventually_nat`, `mathlib:summable_geometric_of_lt_one`, `mathlib:HasSum.mul_left`.

**Proof/construction.** Choose rho>max(norm(a),0). Decay of norm(f_(n+1)) rho^(n+1) bounds the shifted coefficient norm by a constant times rho^(-n). Thus the shifted tail evaluated at a is absolutely summable by a geometric comparison. Separate the constant term in the convergent evaluation and shift the tail: 0=f(a)=1+a sum_n f_(n+1) a^n. Moving terms gives a times the displayed negative tail equal to one. Commutativity supplies the reverse product identity and therefore a unit with this inverse. The argument does not infer equality from residue fields.

**Unit tests**

- `root_nonunit_constant` (non-example): The entire polynomial T vanishes at zero, which is not a unit in a nonzero coefficient algebra.

**Acceptance:** The constant-coefficient assumption is essential: f=T has the nonunit root zero. For Hasse order zero no root vanishing is assumed, and this lemma is not applied.

**Sources:** Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Return to the Riesz proof

For h>0, the determinant has constant term one and vanishes at a, so the new
unit-root lemma gives an explicit inverse of a. Put c=Delta_h P_u(a), which is
assumed to be a unit. The evaluated recurrence gives e=c^(-1)(1-au)z_h and
f=-c^(-1)u z_(h-1), with e+f=1. Its vanishing equations inductively give
(1-au)^(s+1)z_s=0 for s<h. The commutation lemma therefore gives f e^h=0.
Expanding (e+f)^h proves that p=e^h and q=1-p are complementary idempotents.
Their polynomial-closure property now has explicit analytic prerequisites.

The finite-projective rank and exact determinant arguments retain the existing
nonreduced-coefficient safeguards. The Hasse nodes alone do not establish these arguments or the adjugate
coefficient estimate. The separate chain below supplies the latter; completed
tensors, spectral resultants and actual distribution families remain open. At order h=0
the root-vanishing/unit argument is not used.

## L4 continuation: the explicit Riesz decomposition

Write v=1-au, z_s=Delta_s F_u(a), and let c=Delta_h P_u(a) be a unit,
with all earlier Hasse values zero. Put b=c⁻¹z_h, p=(vb)^h and E=1-p.
The projector E selects the generalized root space N; its complement p selects F.
These are continuous A-linear endomorphisms on the existing module. The result is
N=ker(v^h), F=image(v^h), with a continuous inverse b for v on F.
No reducedness or scalar-field hypothesis on A is added.

The source proof has three distinct steps: Hasse calculus, the explicit
projector split, and finite-projective rank/determinant. This continuation
specifies the middle step. It imports native idempotents, kernel/image and
continuous projections, and retains every remaining analytic and rank gap.
The general ring and module facts used to verify the formulas are scratch
proofs, not a second proposed projection library.

### Lower Hasse resolvent annihilation

`LocallyAnalyticDistributions:L4/hasse-lower-annihilation` (lemma).

For every s<h, v^(s+1) z_s=0.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/evaluated-hasse-resolvent`, `LocallyAnalyticDistributions:L4/hasse-resolvent-commutation`, `LocallyAnalyticDistributions:L4/resolvent-series`.

Proof or construction:

1. For h>0 the order-zero identity v z_0=P_u(a) I is zero. For s+1<h the Hasse recurrence gives v z_(s+1)=u z_s.
2. Induct: v^(s+2)z_(s+1)=v^(s+1)u z_s=u v^(s+1)z_s=0. Commutation follows since v=1-au. For h=0 the conclusion has no instances.

Acceptance: Use the exact s+1 exponent, including the s=0 boundary; no factorials.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Normalized Hasse resolvent identity

`LocallyAnalyticDistributions:L4/hasse-normalized-annihilation` (lemma).

The actual b=c^(-1)z_h commutes with v, and v^h(1-vb)=0, including h=0.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/hasse-lower-annihilation`, `LocallyAnalyticDistributions:L4/evaluated-hasse-resolvent`, `LocallyAnalyticDistributions:L4/hasse-resolvent-commutation`, `LocallyAnalyticDistributions:L4/resolvent-series`.

Proof or construction:

1. For h>0 the top recurrence is v z_h-u z_(h-1)=c I. Multiply by the inverse scalar to get 1-vb=-c^(-1)u z_(h-1).
2. The lower-annihilation lemma at h-1 kills this after multiplication by v^h; scalar multiplication is central in the ring of A-linear endomorphisms. Commutation of v with b follows from commutation of u with z_h.
3. For h=0 use v z_0=P_u(a)I=cI directly, giving vb=1. This avoids a fictitious z_(-1) and supplies invertibility even though there is no root.

Acceptance: The nonzero coefficient must be a unit, not merely nonzero. For diag(1,3) over Z/4 at a=1, the first Hasse value is 2 and cannot be inverted. This finite-ring control tests the algebra, not the standing Banach hypotheses.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Explicit Hasse Riesz projector

`LocallyAnalyticDistributions:L4/riesz-projector-formula` (construction).

Define rieszRootProjector(u,Pr,cc,a,h,c)=E=1-((1-au)(c^(-1)z_h))^h as a native continuous A-linear endomorphism; its complement is p=1-E. The formula exists for every a,h and chosen unit c; its spectral properties require the exact Hasse-order hypotheses.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation`.

Proof or construction:

1. Use composition, powers, scalar multiplication and subtraction on the existing ring of continuous A-linear endomorphisms. There is no new operator carrier.
2. At h=0 the formula gives E=0 and p=1. Under the root hypotheses, the following lemmas identify it with the source projector onto N, while Serre calls its complement p.

Acceptance: The sign and choice of summand are fixed by the diagonal test. Retain generalized eigenspaces.

Uses:

- `LocallyAnalyticDistributions:L4/riesz-root-projectors`: Supplies explicit continuous projectors for the analytic split before finite generation and projectivity.
- `LocallyAnalyticDistributions:L4/finite-slope-summands`: The root splitting applied to a polynomial in u is the intermediate step; exact Q-star annihilation and rank remain separate.
- `PadicFamilies:L2a`: The existing consumer ultimately needs canonical finite-slope summands; this checkpoint supplies only the algebraic projector component of that chain.

API:

- `rieszRootProjector_formula`: Equality with 1-((1-au)(c^(-1)z_h))^h on the existing continuous-linear-map carrier.
- `rieszRootProjector_zero_order`: For h=0 the projector is zero for every a and chosen unit c.
- `rieszRootProjector_fixed_iff`: Under the exact Hasse-order hypotheses, E x=x if and only if v^h x=0.
- `rieszRootProjector_eq_projectionL`: Under the exact Hasse-order hypotheses, there is a native topological-complement proof for ker(v^h) and image(v^h), and E equals its existing Submodule.projectionL.

Unit tests:

- `riesz_order_zero` (degenerate): At order zero the formula gives E=0 on every M, even without the root hypotheses.
- `riesz_scalar_root` (computation): For u=identity on A, a=1, h=1 and c=-1, E is the identity.
- `riesz_diagonal_root` (characterisation): For u=diag(1,0) on the native two-coordinate c0 module, a=1, h=1, c=-1, E=diag(1,0), not its regular complement.
- `riesz_jordan_root` (non-example): For u=I+N with the nonzero two-by-two nilpotent Jordan block N, a=1, h=2, c=1, E=I although 1-u is nonzero. The full generalized eigenspace is required.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Idempotence of the Hasse projector

`LocallyAnalyticDistributions:L4/riesz-projector-idempotence` (lemma).

Under the exact Hasse-order hypotheses, E is idempotent; p=1-E is its complementary idempotent.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-projector-formula`, `LocallyAnalyticDistributions:L4/hasse-normalized-annihilation`, `mathlib:Commute.mul_pow`, `mathlib:one_sub_dvd_one_sub_pow`, `mathlib:IsIdempotentElem.one_sub`.

Proof or construction:

1. Use vb=bv to write e^h=v^h b^h. The normalized identity and commutation give (1-e)e^h=0, equivalently e^h(1-e)=0.
2. The pinned geometric-sum divisibility gives 1-e^h=(1-e)d. Multiplying by e^h gives e^h(1-e^h)=0, so p^2=p; apply the existing one_sub idempotent lemma to E.
3. The same factorization and v^h(1-e)=0 give v^h E=0. Products Ep=pE=0 and E+p=1 use the baseline idempotent API.

Acceptance: Do not assume e itself idempotent. For the source root of u=J_2(1) plus scalar 2 over Z/3, e is nonzero nilpotent on the first block; 1-e is not idempotent while 1-e^2 is.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Canonical kernel and image summands

`LocallyAnalyticDistributions:L4/riesz-kernel-image` (lemma).

The projector has image(E)=ker(v^h) and ker(E)=image(v^h); equivalently image(p)=image(v^h). These identify the summands of the root splitting canonically.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-projector-idempotence`, `LocallyAnalyticDistributions:L4/hasse-normalized-annihilation`, `mathlib:Commute.mul_pow`, `mathlib:LinearMap.IsIdempotentElem.range_eq_ker_one_sub`, `mathlib:LinearMap.IsIdempotentElem.ker_eq_range_one_sub`, `mathlib:LinearMap.IsIdempotentElem.mem_range_iff`.

Proof or construction:

1. v^h E=0 gives image(E) contained in ker(v^h). If v^h x=0 then p x=v^h b^h x=b^h v^h x=0, so E x=x and the reverse inclusion follows.
2. Since p=v^h b^h, image(p) is contained in image(v^h). Conversely v^h E=0 implies v^h=v^h p=p v^h, so p is the identity on image(v^h).
3. Use the baseline image/kernel identities of complementary idempotents to identify ker(E)=image(p). The fixed-vector API follows from the baseline characterization of an idempotent image.

Acceptance: At h=0, ker(v^0)=0 and image(v^0)=M. Uniqueness uses these actual submodules, without choosing a basis or a finite-rank approximation.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Topological Riesz decomposition

`LocallyAnalyticDistributions:L4/riesz-topological-splitting` (theorem).

N=ker(v^h) and F=image(v^h) are closed native A-submodules and topological complements. The constructed E agrees with the native continuous projection onto N along F.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-kernel-image`, `LocallyAnalyticDistributions:L4/riesz-projector-idempotence`, `mathlib:ContinuousLinearMap.IsIdempotentElem.isTopCompl`, `mathlib:ContinuousLinearMap.IsIdempotentElem.isClosed_range`, `mathlib:ContinuousLinearMap.IsIdempotentElem.eq_projectionL`.

Proof or construction:

1. The baseline isTopCompl theorem for a continuous idempotent supplies the topological direct sum, not merely an algebraic complement. Transport it along the kernel/image identifications.
2. The two continuous idempotents have closed images in the Hausdorff module. The baseline projectionL identity gives the native comparison with no new splitting structure.

Acceptance: Closedness of image(v^h) is proved through its idempotent presentation. Do not import real/complex Riesz closed-range theorems, or infer closed range for arbitrary continuous maps. This statement contains no claim of finite generation, projectivity or rank.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Inverse on the regular Riesz summand

`LocallyAnalyticDistributions:L4/riesz-regular-inverse` (theorem).

Both v and b preserve F=image(v^h), and v(bx)=b(vx)=x for every x in F. Their restrictions are mutually inverse continuous A-linear maps of F.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-kernel-image`, `LocallyAnalyticDistributions:L4/hasse-normalized-annihilation`, `LocallyAnalyticDistributions:L4/riesz-projector-idempotence`.

Proof or construction:

1. Commutation with v^h proves that v and b map its image into itself. From (1-e)p=0 obtain vb p=p; commutation gives bv p=p as well.
2. Write x=p y on F and evaluate those identities. Restrict the existing continuous A-linear maps to the invariant submodule. This exhibits a continuous inverse, without invoking an open mapping theorem.
3. Serre displays c^(-h)v^(h-1)z_h^h on F when h>0. It equals b on F: b^h v^(h-1)=b(vb)^(h-1), and vb is the identity there. Treat h=0 by vb=bv=1 on M.

Acceptance: The inverse is asserted only on F. In the Jordan test v is nilpotent on N and has no inverse there.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Polynomial closure of Riesz projectors

`LocallyAnalyticDistributions:L4/riesz-projector-closure` (lemma).

E and p belong to the K-operator-norm closure of the actual A-polynomials in u, represented by the existing finite polynomial evaluation formula.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-projector-formula`, `LocallyAnalyticDistributions:L4/hasse-polynomial-closure`.

Proof or construction:

1. Each z_h is in that closure by the prior analytic lemma. The identity, scalar endomorphisms and u belong to the polynomial set.
2. In the complete normed ring of K-linear endomorphisms, continuous addition, multiplication and the bounded scalar action show that this closure is closed under subtraction, multiplication and scalar multiplication. Apply these operations to the displayed finite formula for E; p=1-E follows.
3. This uses the already constructed A-linear Hasse value, not a formal infinite Taylor substitution. No convergence or adjugate estimate is inferred from the algebraic formula.

Acceptance: Keep the topology on the actual K-operator norm, as in the Hasse predecessor. No abstract substitute for A[u] is introduced.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Stability under commuting operators

`LocallyAnalyticDistributions:L4/riesz-commuting-stability` (lemma).

Every continuous A-linear endomorphism t commuting with u commutes with E and p, and preserves N=ker(v^h) and F=image(v^h).

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-projector-closure`, `LocallyAnalyticDistributions:L4/riesz-kernel-image`, `LocallyAnalyticDistributions:L4/riesz-projector-idempotence`, `mathlib:ContinuousLinearMap.IsIdempotentElem.commute_iff`.

Proof or construction:

1. A-linear t commutes with each A-polynomial in u. The commutant is closed in the K-operator norm because left and right multiplication by its scalar restriction are continuous.
2. Pass the polynomial commutation equality to E in the closure and then to p=1-E. Apply the existing idempotent commute_iff theorem and the kernel/image identifications for invariance.

Acceptance: No complete-continuity hypothesis on t and no extra source of finite projectivity. This is the stability needed by commuting Hecke operators in the existing slope consumer.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

## L4 continuation: the adjugate coefficient estimate

The resolvent recurrence has an algebraic part and an analytic part. Induction
alone gives its formal identity. Entire convergence uses a stronger estimate:
the n-th coefficient is bounded by products of n distinct output-column
majorants. Expanding finite adjugates gives this estimate without a factorial
loss. Finite coordinate projections and coefficient continuity then carry it
to arbitrary orthonormalizable modules, including uncountable coordinate sets.

There is an essential support condition in this passage. If u has finite
output support J, a restriction used to test V_n(e_i) must include i as well
as J. For diag(a,0), the degree-one adjugate coefficient vanishes on the image
coordinate and equals −a on its complement. A bound on the image alone cannot
bound the full operator. The comparison below consequently quantifies over
all finite L containing J and uses L=J∪{i} for norm detection.

The intermediate statements apply to any actual sequence of native continuous
linear maps satisfying the recurrence with the actual Fredholm coefficients.
They assume no convergence or coefficient bound. The resulting dependency
chain precedes resolvent-series and its Hasse/Riesz consumers. Passing to a
(Pr) module uses its actual retraction and retains the fixed norm factor
‖r‖‖i‖. A nonisometric retraction cannot be treated as a contraction.

### Finite coordinate truncation

`LocallyAnalyticDistributions:L4/finite-coordinate-projection` — `coordinateProjection` (construction).

For a finite T⊆I, the existing helper π_T is the native continuous A-linear endomorphism of c_A(I) that retains coordinates in T and sets every other coordinate to zero. Its value is the finite sum Σ_{j∈T}x_j e_j; the carrier remains the native C0 space.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Proof outline:**

1. The finite-support function is continuous because I is discrete, and vanishes at infinity because its support lies in finite T. This constructs an element of the native ZeroAtInftyContinuousMap carrier.
2. Linearity is pointwise. Transfer the native supremum norm through toBCF and bound the difference pointwise by the norm of the original difference, giving continuity without choosing a basis enumeration.
3. The empty projection, intersection composition and basis-vector formulas follow coordinatewise. The evaluation and norm API items are promoted below before use in the analytic estimates.

**Prerequisites:** `mathlib:ZeroAtInftyContinuousMap`, `mathlib:ZeroAtInftyContinuousMap.ext`, `mathlib:ZeroAtInftyContinuousMap.toBCF`, `mathlib:ZeroAtInftyContinuousMap.norm_toBCF_eq_norm`, `mathlib:BoundedContinuousFunction.norm_le`, `mathlib:BoundedContinuousFunction.norm_coe_le_norm`.

**Uses:**

- compact-matrix-criterion and resolvent-coefficient-bound: The actual finite-coordinate approximation is π_T composed with u; its image has finite A-support and its output columns retain the common majorant.
- c0-lift and orthonormalizable-modules: Finite-support truncations approximate each native c0 vector and give the coordinate norm and basis tests.

**API:**

- `coordinateProjection_apply` (projection): At coordinate j, π_T(x)_j is x_j if j∈T and zero otherwise; promoted to finite-coordinate-projection-evaluation.
- `coordinateProjection_norm_le` (compatibility): For every x, ‖π_T x‖≤‖x‖; the existing signature is promoted to finite-coordinate-projection-bound.
- `coordinateProjection_empty` (simp): π_∅=0 as a native continuous A-linear map.
- `coordinateProjection_inter` (functoriality): π_T composed with π_S is π_(T∩S); hence each finite projection is idempotent.
- `coordinateProjection_single` (simp): π_T(a e_j)=a e_j if j∈T, and zero if j∉T.

**Unit tests:**

- `projection_empty_support` (computation): For every x, π_∅x=0.
- `projection_selected_coordinate` (computation): π_{j}(a e_j)=a e_j.
- `projection_rejected_coordinate` (non-example): If i≠j, π_{i}(a e_j)=0.

**Acceptance:** This promotes the existing suggested helper; it does not define a second c0 carrier. Empty T gives zero, and the identity on an infinite c0 space is not a finite projection.

**Sources:** Buzzard-Eigenvarieties-2006, §2, pp.7–12 for coordinates; §3, full manuscript p.22 freshly reread on27 September2026 for the Fredholm resolvent over (Pr) modules. The coordinate maps use the existing C0 carrier. The source invokes Serre Proposition10 for a Noetherian Banach algebra and a (Pr) module; the explicit finite-coordinate and retraction steps are decomposed here rather than assumed from the recurrence.

### Evaluation of a finite coordinate projection

`LocallyAnalyticDistributions:L4/finite-coordinate-projection-evaluation` — `coordinateProjection_apply` (lemma).

For T finite, x∈c_A(I) and j∈I, (π_T x)_j=x_j when j∈T, and (π_T x)_j=0 otherwise.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Proof outline:**

1. Evaluate the defining finite-support function. This is the promoted projection formula, so subsequent coordinate arguments use an exact node.

**Prerequisites:** `LocallyAnalyticDistributions:L4/finite-coordinate-projection`.

**Acceptance:** The formula treats selected and unselected coordinates and implies that π_Tu has output support in T.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Contractivity of coordinate truncation

`LocallyAnalyticDistributions:L4/finite-coordinate-projection-bound` — `coordinateProjection_norm_le` (lemma).

For every finite T⊆I and every x∈c_A(I), ‖π_T x‖≤‖x‖.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Proof outline:**

1. Use finite-coordinate-projection-evaluation to bound each coordinate by ‖x‖, using zero outside T.
2. Apply the native bounded-function norm characterization and the C0-to-bounded-function norm equality.

**Prerequisites:** `LocallyAnalyticDistributions:L4/finite-coordinate-projection-evaluation`, `mathlib:BoundedContinuousFunction.norm_le`, `mathlib:BoundedContinuousFunction.norm_coe_le_norm`, `mathlib:ZeroAtInftyContinuousMap.norm_toBCF_eq_norm`.

**Acceptance:** This proves operator norm at most one after restricting scalars to K; it does not assert that every projection has norm one, since T can be empty.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Operator bound from the coordinate vectors

`LocallyAnalyticDistributions:L4/c0-operator-norm-criterion` — `c0_operator_norm_le_iff` (lemma).

For a continuous A-linear f:c_A(I)→c_A(I) and C≥0, ‖f‖_K≤C if and only if ‖f(e_i)‖≤C for every i∈I.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Proof outline:**

1. A coordinate vector has norm one when it exists. The forward implication follows from the native le_opNorm bound and the native C0 supremum norm.
2. For the reverse implication, use c0-lift on the bounded family f(e_i). Its norm formula, normalized A-action and uniqueness identify the resulting map with f and bound it by C. This includes empty I, where both the module and the operator norm are zero.

**Prerequisites:** `LocallyAnalyticDistributions:L4/c0-lift`, `LocallyAnalyticDistributions:L4/c0-scalar-bound`, `mathlib:ContinuousLinearMap.le_opNorm`, `mathlib:ContinuousLinearMap.opNorm_le_bound`.

**Acceptance:** No countability or algebraic spanning assertion for the infinite c0 module is assumed. Finite-support density is used through the already planned bounded-family extension.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Coefficients of the finite adjugate

`LocallyAnalyticDistributions:L4/finite-adjugate-recurrence` — `finite_adjugate_recurrence` (lemma).

For a d×d matrix D over A, put H(T)=I−TD, c_n=coeff_n det(H), and B_n=(coeff_n adj(H)_ij)_ij. Then B₀=I and B_(n+1)=c_(n+1)I+B_nD. This order is compatible with the input-first operator convention.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Proof outline:**

1. Apply the native identity adj(H)H=det(H)I over the existing polynomial ring. Taking degree n+1 gives B_(n+1)−B_nD=c_(n+1)I by the polynomial product coefficient formula.
2. The constant coefficient is adj(I)=I; extract it by evaluation at zero, or directly from the cofactor formula. Include d=0, where the matrix carrier is a subsingleton and the determinant is one.

**Prerequisites:** `mathlib:Matrix.adjugate`, `mathlib:Matrix.adjugate_mul`, `mathlib:Matrix.adjugate_one`, `mathlib:Polynomial.coeff_mul`.

**Unit tests:**

- `adjugate_rank_one` (computation): For the one-by-one matrix (a), adj(I−TD)=I.
- `adjugate_diagonal_two` (computation): For diag(a,b), the adjugate is diag(1−bT,1−aT).
- `adjugate_nilpotent_two` (computation): For the nonzero two-by-two nilpotent Jordan matrix N, adj(I−TN)=I+TN.

**Acceptance:** The adjugate is a numerator, not an inverse obtained by dividing by a determinant. In the input-first convention, f composed with V corresponds to the matrix of V multiplied on the right by D.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Distinct-column bound for adjugate coefficients

`LocallyAnalyticDistributions:L4/finite-adjugate-coefficient-bound` — `finite_adjugate_coeff_bound` (lemma).

Let D be a d×d matrix, b_j≥0 with ‖D_ij‖≤b_j, n≥0 and C≥0. Assume ∏_{j∈S}b_j≤C for every n-element subset S of its column index set. Every coefficient of degree n of every entry of adj(I−TD) then has norm at most C.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Proof outline:**

1. For d=0 the entry assertion is empty. For d>0 use the native cofactor formula adjugate_fin_succ_eq_det_submatrix, after the usual finite-index identification.
2. Expand the cofactor determinant by permutations and each product by Polynomial.coeff_mul. Every nonzero degree-n contribution selects n distinct columns of D, with coefficient a sign and the remaining factors from identity entries. Thus each contribution has norm at most a product of n distinct b_j.
3. Use submultiplicativity, norm one for signs and the ultrametric finite-sum inequality. There is no factorial multiplier. For n above the cofactor degree all contributions vanish. For n=0 the empty product is one.

**Prerequisites:** `mathlib:Matrix.adjugate_fin_succ_eq_det_submatrix`, `mathlib:Matrix.det_apply`, `mathlib:Polynomial.coeff_mul`, `mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`.

**Acceptance:** Repeated columns are not allowed in the product majorant. The estimate holds over nonreduced Banach algebras and uses no eigenvalues or division by n!.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Resolvent recurrence on finite coordinates

`LocallyAnalyticDistributions:L4/finite-coordinate-resolvent-comparison` — `finite_coordinate_resolvent_comparison` (comparison).

Let u:c_A(I)→c_A(I) be completely continuous, with output support in a finite J. Let V₀=I and V_(n+1)=c_(n+1)(u)I+uV_n, where c_n(u) are the actual Fredholm coefficients. For every finite L⊇J, the entries of V_n between coordinates i,j∈L equal the degree-n coefficients of adj(I−T D_L), where D_L=(u_ij)_(i,j∈L).

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Proof outline:**

1. The operator u preserves the coordinate submodule A^L because its entire output lies in A^J⊆A^L. The finite-coordinate-determinant comparison identifies the actual Fredholm series with det(I−TD_L), including the additional zero directions in L.
2. Restriction of V₀ is identity. Inductively restrict the recurrence to A^L. In the input-first convention uV_n has matrix B_nD_L. Apply finite-adjugate-recurrence and uniqueness of the algebraic recurrence.
3. This statement does not bound the whole operator by restricting only to J. In the following norm proof L is chosen to contain the tested input coordinate as well as J.

**Prerequisites:** `LocallyAnalyticDistributions:L4/finite-coordinate-determinant`, `LocallyAnalyticDistributions:L4/finite-adjugate-recurrence`.

**Unit tests:**

- `finite_output_support_is_not_enough_for_input` (non-example): For diag(a,0), coefficient one of the (1,1) entry of adj(I−TD) is −a, whereas that of the (0,0) entry is zero, using indices0,1.

**Acceptance:** For diag(a,0), the degree-one adjugate coefficient on the second coordinate is −a, even though it is zero on the image coordinate.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Resolvent bound for finite output support

`LocallyAnalyticDistributions:L4/finite-output-resolvent-bound` — `finite_output_resolvent_bound` (lemma).

Suppose u has output support in finite J. Let b_j≥0 bound its output-column norms, fix n≥0 and C≥0, and assume every product of n distinct b_j is at most C. Then ‖V_n‖_K≤C.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars. V is any sequence of native continuous A-linear endomorphisms with V₀=I and V_(n+1)=c_(n+1)(u)I+uV_n, where c_n(u) are the actual Fredholm coefficients. These are algebraic recurrence hypotheses; no analytic estimate or entireness is assumed.

**Proof outline:**

1. For each input coordinate i choose L=J∪{i}. The recurrence preserves A^L and finite-coordinate-resolvent-comparison gives the exact adjugate entries of V_n(e_i).
2. Apply finite-adjugate-coefficient-bound to D_L with the restricted b. Its n-element subsets give n-element subsets of I, so the same C applies. The finite supremum norm gives ‖V_n(e_i)‖≤C.
3. Apply c0-operator-norm-criterion. This treats every input coordinate, including those outside J, and avoids the incorrect inference from a bound on V_n restricted only to the image support.

**Prerequisites:** `LocallyAnalyticDistributions:L4/finite-coordinate-resolvent-comparison`, `LocallyAnalyticDistributions:L4/finite-adjugate-coefficient-bound`, `LocallyAnalyticDistributions:L4/c0-operator-norm-criterion`.

**Acceptance:** The uniform C is independent of L and of the input i. Arbitrary index sets and empty support are included.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Continuity of the finite recurrence

`LocallyAnalyticDistributions:L4/resolvent-coefficient-continuity` — `recurrence_coefficient_tendsto` (lemma).

Let α carry any filter l. Suppose u_α→u in K-operator norm on c_A(I), and c_(α,n)→c_n in A for each n. Define sequences V_(α,n) and V_n by initial identity and V_(α,n+1)=c_(α,n+1)I+u_αV_(α,n), respectively V_(n+1)=c_(n+1)I+uV_n. For every fixed n, V_(α,n)→V_n in K-operator norm.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Proof outline:**

1. Induct on n. The initial identity is constant. Addition and multiplication are continuous in the native K-operator ring.
2. The coefficient action a↦aI on c_A(I) is bounded by ‖a‖, using c0-scalar-bound and the native operator norm criterion. Its continuity carries the scalar coefficient limits into operator limits.
3. Apply the recurrence and the induction hypothesis. The filter is arbitrary, so the result applies to finite subsets of an uncountable I ordered by inclusion.

**Prerequisites:** `LocallyAnalyticDistributions:L4/c0-scalar-bound`, `mathlib:ContinuousLinearMap.toNormedRing`, `mathlib:ContinuousLinearMap.opNorm_le_bound`.

**Acceptance:** Only finitely many coefficient limits are used for a fixed n; no interchange with an infinite sum or evaluation is made.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Adjugate bound for the Fredholm resolvent

`LocallyAnalyticDistributions:L4/resolvent-coefficient-bound` — `resolvent_recurrence_norm_bound` (theorem).

Let u be completely continuous on c_A(I), and let b_j≥0 bound its output-column norms. For n≥0 and C≥0, if every product of n distinct b_j is at most C, then ‖V_n‖_K≤C.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars. V is any sequence of native continuous A-linear endomorphisms with V₀=I and V_(n+1)=c_(n+1)(u)I+uV_n, where c_n(u) are the actual Fredholm coefficients. These are algebraic recurrence hypotheses; no analytic estimate or entireness is assumed.

**Proof outline:**

1. Take u_T=π_Tu over the directed set of finite T⊆I. The promoted projection formula gives finite output support and the same majorant b. Its image is contained in the span of finitely many coordinate vectors, so it is completely continuous by the defining finite-image approximation criterion.
2. The existing compact-matrix-criterion gives u_T→u in operator norm. The projection bound gives a common operator-norm bound; apply coefficient-continuity to each fixed Fredholm coefficient.
3. Define V_(T,n) by the finite algebraic recurrence. Apply resolvent-coefficient-continuity to obtain V_(T,n)→V_n for each fixed n. Each V_(T,n) has norm at most C by finite-output-resolvent-bound.
4. Pass this closed norm inequality to the limit using le_of_tendsto. The finite-subset filter is nonempty and directed. No decreasing enumeration of column sizes is needed.

**Prerequisites:** `LocallyAnalyticDistributions:L4/finite-coordinate-projection-evaluation`, `LocallyAnalyticDistributions:L4/finite-coordinate-projection-bound`, `LocallyAnalyticDistributions:L4/compact-matrix-criterion`, `LocallyAnalyticDistributions:L4/coefficient-continuity`, `LocallyAnalyticDistributions:L4/finite-output-resolvent-bound`, `LocallyAnalyticDistributions:L4/resolvent-coefficient-continuity`, `mathlib:le_of_tendsto`.

**Acceptance:** This supplies the analytic estimate missing from the old resolvent node. The recurrence alone would give a geometric bound and does not establish this distinct-column bound.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Entire tail estimate for resolvent coefficients

`LocallyAnalyticDistributions:L4/resolvent-tail-bound` — `resolvent_recurrence_tail_bound` (lemma).

Let b_j≥0 bound the output-column norms of completely continuous u and satisfy b_j≤L. Fix R>0, 0<q<1 and finite T with Rb_j≤q off T. Put m=|T| and B=max(1,RL). Then ‖V_n‖_K Rⁿ≤B^m q^(max(n−m,0)) for every n≥0.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars. V is any sequence of native continuous A-linear endomorphisms with V₀=I and V_(n+1)=c_(n+1)(u)I+uV_n, where c_n(u) are the actual Fredholm coefficients. These are algebraic recurrence hypotheses; no analytic estimate or entireness is assumed.

**Proof outline:**

1. For any n-element subset S, split it into its intersection with T and its complement. At most m factors Rb_j are bounded by B; all others are bounded by q. Since B≥1 and 0<q<1, the product is at most B^m q^(max(n−m,0)).
2. Apply resolvent-coefficient-bound with C=B^m q^(max(n−m,0))/Rⁿ, which is nonnegative; Rⁿ is strictly positive. Multiply through by Rⁿ.
3. The constant B^m is independent of n. If b is cofinite-null, such T exists for every R and q, and the geometric right side tends to zero. The bound is also uniform for any family with the same b,L,T.

**Prerequisites:** `LocallyAnalyticDistributions:L4/resolvent-coefficient-bound`, `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one`.

**Acceptance:** The exponent is truncated at zero for n≤m. There is no factorial factor, summation over input coordinates, or normed-field hypothesis on A itself.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Compression of the coefficient recurrence

`LocallyAnalyticDistributions:L4/resolvent-retraction-comparison` — `recurrence_retraction` (lemma).

Let i:M→c_A(I) and r:c_A(I)→M be native continuous A-linear maps with ri=I. For u:M→M put U=iur. For any scalar sequence c_n, suppose V₀=I_M, W₀=I_c0, V_(n+1)=c_(n+1)I_M+uV_n and W_(n+1)=c_(n+1)I_c0+UW_n. Then rW_n i=V_n for every n.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars. M is a Banach A-module with compatible K-action. The stated continuous retraction is actual data; no claim that every finite module has such a retraction is made.

**Proof outline:**

1. At n=0 this is exactly ri=I. Apply r on the left and i on the right to the next recurrence.
2. Use A-linearity to move c_(n+1) through r and i; use ri=I in the product term, and then the induction hypothesis. This is purely algebraic and works for any scalar sequence.

**Prerequisites:** `LocallyAnalyticDistributions:L4/projective-banach-modules`.

**Acceptance:** The zero extension has identity on the whole ambient module at degree zero. It is the compression rW₀i that equals identity on M; do not replace W₀ by ir.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Entireness of the recurrence on a projective Banach module

`LocallyAnalyticDistributions:L4/resolvent-recurrence-entire` — `resolvent_recurrence_entire` (theorem).

Let M have (Pr), u:M→M be completely continuous, and c_n be its actual summand Fredholm coefficients. For any V₀=I and V_(n+1)=c_(n+1)I+uV_n, and every R>0, ‖V_n‖_K Rⁿ tends to zero.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars. M is a complete Banach A-module with compatible bounded coefficient action as in the standing roadmap hypotheses; property (Pr) supplies actual continuous inclusion and retraction data.

**Proof outline:**

1. Choose the actual retraction i:M→c_A(I), r:c_A(I)→M from property (Pr). Approximate u by finite-A-image maps g at error ε/(1+‖i‖‖r‖); the maps igr still have finite A-image, and the composition norm bound gives approximation of U=iur. Thus U is completely continuous directly from the imported definition. The summand-fredholm-theory comparison identifies its Fredholm coefficients with the given c_n.
2. For U use its column-norm family b_j. It is bounded by ‖U‖ and cofinite-null by compact-matrix-criterion; normalized basis/evaluation bounds justify the column bound. Take q=1/2 and apply resolvent-tail-bound for every R to the recurrence W_n on c_A(I).
3. The geometric estimate gives ‖W_n‖Rⁿ→0. Apply resolvent-retraction-comparison and the native composition norm bound twice: ‖V_n‖Rⁿ≤‖r‖‖i‖‖W_n‖Rⁿ. The fixed nonnegative factor preserves convergence to zero.
4. Instantiate this theorem with the existing resolvent coefficient construction and its initial/successor equations. This proof does not use resolvent-series, its entireness API or any Hasse/Riesz theorem as a prerequisite.

**Prerequisites:** `LocallyAnalyticDistributions:L4/projective-banach-modules`, `LocallyAnalyticDistributions:L4/summand-fredholm-theory`, `LocallyAnalyticDistributions:L4/completely-continuous`, `LocallyAnalyticDistributions:L4/compact-matrix-criterion`, `LocallyAnalyticDistributions:L4/c0-operator-norm-criterion`, `LocallyAnalyticDistributions:L4/resolvent-tail-bound`, `LocallyAnalyticDistributions:L4/resolvent-retraction-comparison`, `mathlib:ContinuousLinearMap.opNorm_comp_le`, `mathlib:Submodule.FG.map`, `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one`.

**Acceptance:** No isometric retraction is assumed: the factors ‖r‖ and ‖i‖ remain in the transfer. This analytic coefficient estimate does not establish finite-projectivity, constant rank or determinant equality of a root summand.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.; Buzzard-Eigenvarieties-2006, §2, pp.7–12 for coordinates; §3, full manuscript p.22 freshly reread on27 September2026 for the Fredholm resolvent over (Pr) modules. The coordinate maps use the existing C0 carrier. The source invokes Serre Proposition10 for a Noetherian Banach algebra and a (Pr) module; the explicit finite-coordinate and retraction steps are decomposed here rather than assumed from the recurrence.

## L4 continuation: finite projectivity of the root kernel

Fix a continuous A-linear endomorphism u, a coefficient a and an integer h≥0.
Write v=1−au and N=ker(v^h). Once a continuous complement F has been obtained,
the passage to finite projectivity has three different inputs: a geometric
left inverse for u on N, finite-image approximation of identity on N, and
inheritance of (Pr). The existing Riesz splitting supplies the complement;
the following declarations expose the remaining finite-projectivity paragraph
of Buzzard Proposition 3.2. They preserve the existing native kernel,
projection, continuous equivalence and algebraic projectivity carriers.

The finite geometric sum B=a(1+v+⋯+v^(h−1)) satisfies Bu=uB=1−v^h.
In particular u is continuously invertible on N before we know that N is
finite. No inverse of a is used: this observation also applies to root kernels
which do not arise from a Fredholm root of constant order. For h=0, N is zero.
For a=0, N is zero for every h. The construction and all estimates include
these boundary cases.

The analytic point is that an approximant α to u need not preserve N. If
π:M→N is the native projection along F and i:N→M is inclusion, put l=πB.
Then lui=identity_N, so β=lαi approximates identity_N and has finite A-image.
Its error is at most D times the error of α, with D=‖l‖_K‖i‖_K. Neither factor
is silently replaced by one. Choosing the input tolerance ε/(D+1) works even
when D=0. Complete continuity of identity_N then invokes the existing
compact-identity-finite theorem; it is not a second Neumann-series argument.

Property (Pr) passes through the actual continuous retraction πi=identity.
The already planned finite-pr-projective theorem then gives algebraic
projectivity. Its canonical finite-module-topology prerequisite remains an
explicit gap. The new nodes give the declaration graph for this paragraph,
not a claim that its whole dependency chain is implemented or closed.

A useful counterexample keeps the hypotheses precise. Over A=K×K take u=1,
a=(1,0) and h=1. The root kernel is (1,0)A. It is finite projective, with rank
one on the first component and zero on the second, while a is not a unit.
Thus neither the geometric inverse nor finite projectivity implies a unit
root parameter, freeness or constant rank. The full Hasse-root theorem has
additional hypotheses, and its remaining nonreduced determinant/rank proof
must still be supplied.

### Finite geometric factor for the root operator

`LocallyAnalyticDistributions:L4/riesz-geometric-factor` (lemma); proposed declaration `riesz_geometric_factor`.

For every continuous A-linear u, a∈A and h≥0, the single finite sum B=a Σ_{0≤j<h}(1−au)^j satisfies uB=Bu=1−(1−au)^h.

Hypotheses and conventions:

- A is a commutative normed ring; M is a normed additive commutative group with an A-module structure and jointly continuous scalar multiplication. All maps are native continuous A-linear maps.
- Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed.

Proof or construction:

1. The finite geometric identities give (1−v)Σv^j=Σv^j(1−v)=1−v^h in the endomorphism ring. The right identity is the native geom_sum_mul_neg; the left follows from mul_geom_sum by changing the sign, or directly by induction.
2. Use 1−v=au and centrality of the A-scalar action to move the scalar a across composition. Both factor identities hold without division by a.

Prerequisites: `mathlib:geom_sum_mul_neg`, `mathlib:mul_geom_sum`.


Acceptance:

- For h=0 both products and 1−v^0 are zero. For a=1 and u=1+j with j²=0, h=2 gives B=1−j.

Source: Proposition 3.2, complete proof on manuscript pp.23–24. The source makes the identity on N a polynomial in u with no constant term. This explicit geometric factor and its generality without a unit parameter are worker deductions of that step.

### Continuous inverse on the root kernel

`LocallyAnalyticDistributions:L4/riesz-kernel-operator-equiv` (construction); proposed declaration `rieszKernelOperatorEquiv`.

Define rieszKernelOperatorEquiv(u,a,h) to be the native continuous A-linear automorphism of N whose forward map is the restriction of u and whose inverse is the restriction of B=a Σ_{j<h}(1−au)^j.

Hypotheses and conventions:

- A is a commutative normed ring; M is a normed additive commutative group with an A-module structure and jointly continuous scalar multiplication. All maps are native continuous A-linear maps.
- Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed.

Proof or construction:

1. The endomorphisms u and B commute with v and hence v^h; applying the commutation relation to a vector killed by v^h shows that both preserve N. Use the native ContinuousLinearMap.restrict for these two maps.
2. On N, the two products from riesz-geometric-factor are identity because v^h vanishes. Apply ContinuousLinearEquiv.equivOfInverse to the actual continuous restrictions. The inverse uses a finite sum, so it has no convergence hypothesis.

Prerequisites: `LocallyAnalyticDistributions:L4/riesz-geometric-factor`, `mathlib:ContinuousLinearMap.restrict`, `mathlib:ContinuousLinearEquiv.equivOfInverse`, `mathlib:Commute.smul_right`.

API:

- `rieszKernelOperatorEquiv_apply` (coercion): For x∈N the image under the equivalence, viewed in M, is u(x).
- `rieszKernelOperatorEquiv_symm_apply` (simp): For x∈N the inverse image, viewed in M, is B(x).
- `rieszKernelOperatorEquiv_subtype` (compatibility): Composing the equivalence with the native inclusion i equals u composed with i, as continuous A-linear maps N→M.

Uses:

- Buzzard Proposition3.2, manuscript p.24: Identify the actual continuous inverse of u on the nilpotent root summand before considering its finite-projective determinant.
- riesz-compressed-approximation and finite-slope-summands: The underlying geometric factor gives the left inverse on the included root kernel; the native equivalence records that no inverse of the root parameter is needed.

Unit tests:

- `riesz_inverse_order_zero` (degenerate): At h=0 every x∈ker(v^0) is zero, and its image under the equivalence is zero.
- `riesz_inverse_zero_parameter` (degenerate): At a=0, for every h, every x∈N is zero and its inverse image is zero.
- `riesz_inverse_identity` (compatibility): For u=identity and a=1, both the equivalence and its inverse fix every element of N, for every h.
- `riesz_inverse_jordan` (computation): If j²=0, u=1+j, a=1 and h=2, the inverse on N acts by 1−j, including in characteristic two.

Acceptance:

- The construction does not replace N by a chosen finite free model and does not assume finite generation, a unit root parameter, a Fredholm series or complete continuity.

Source: Proposition 3.2, complete proof on manuscript pp.23–24. The source uses invertibility on N on p.24. The finite geometric inverse is made explicit here and is valid before any rank or determinant argument.

### Property (Pr) under continuous retractions

`LocallyAnalyticDistributions:L4/pr-continuous-retract` (lemma); proposed declaration `hasPr_retract`.

If P has (Pr) and continuous A-linear maps i:M→P and r:P→M satisfy ri=identity, then M has (Pr). This is the existing hasPr_retract API promoted before consumption.

Hypotheses and conventions:

- A is a commutative normed ring; M is a normed additive commutative group with an A-module structure and jointly continuous scalar multiplication. All maps are native continuous A-linear maps.
- P is another normed A-module in the same universe as M; no finite-generation hypothesis is needed.

Proof or construction:

1. Choose the defining continuous split inclusion s:P→c_A(I) and retraction t:c_A(I)→P. The composite maps si and rt are continuous and their product is rtsi=ri=identity.
2. Reuse the existing HasPr definition and existing hasPr_retract declaration; no second notion of a projective Banach module is introduced.

Prerequisites: `LocallyAnalyticDistributions:L4/projective-banach-modules`.


Acceptance:

- Taking i=r=identity retains the original property. No conclusion of algebraic projectivity is made without the finite-generation hypothesis.

Source: Definition of (Pr), full manuscript pp.18–19, and use of Lemma2.11 on p.23. The source defines (Pr) by a continuous direct summand of a potentially ONable module. Transitivity of its split inclusion is the existing API proof, now given its own dependency node.

### Property (Pr) of the complemented root kernel

`LocallyAnalyticDistributions:L4/riesz-kernel-pr` (lemma); proposed declaration `riesz_kernel_hasPr`.

If M has (Pr) and N=ker((1−au)^h) has a native topological complement F, then N has (Pr).

Hypotheses and conventions:

- A is a commutative normed ring; M is a normed additive commutative group with an A-module structure and jointly continuous scalar multiplication. All maps are native continuous A-linear maps.
- Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed.
- F is an A-submodule with the native topological-complement relation between N and F. Let π:M→N be Submodule.projectionOntoL along F, and put l=πB.

Proof or construction:

1. Use the native inclusion i and projection π onto N along F. The library projectionOntoL_apply_left gives πi=identity on N.
2. Apply pr-continuous-retract to this actual continuous retraction. In the Hasse Riesz setting riesz-topological-splitting supplies F=image(v^h) and the required topological complement.

Prerequisites: `LocallyAnalyticDistributions:L4/pr-continuous-retract`, `mathlib:Submodule.projectionOntoL`, `mathlib:Submodule.projectionOntoL_apply_left`.


Acceptance:

- This does not require u to be completely continuous. At h=0 the kernel is zero and the statement still applies.

Source: Proposition 3.2, complete proof on manuscript pp.23–24. Expands the finite-generation and projectivity paragraph using the existing native closed root kernel and continuous splitting; no constant-rank or determinant conclusion is imported.

### Finite-image approximation of the root identity

`LocallyAnalyticDistributions:L4/riesz-compressed-approximation` (lemma); proposed declaration `riesz_compressed_approximation`.

For any α:M→M with finite A-image, define β=lαi:N→N using l=πB. Then β has finite A-image and ‖identity_N−β‖_K≤D‖u−α‖_K, where D=‖l‖_K‖i‖_K. The map α need not preserve N.

Hypotheses and conventions:

- K is a complete nontrivially normed field; A is a nonzero complete Noetherian normed K-algebra with norm one for 1. M is a complete normed K-space and an A-module with compatible scalar tower and continuous A-action. Norms of A-linear maps mean the native K-operator norms after restriction of scalars.
- Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed.
- F is an A-submodule with the native topological-complement relation between N and F. Let π:M→N be Submodule.projectionOntoL along F, and put l=πB.

Proof or construction:

1. The geometric factor gives Bui=i, because v^h i=0. Apply πi=identity to obtain lui=identity_N. This is a kernel-specific adapter, not a new generic complete-continuity composition theorem.
2. If range(α) lies in a finitely generated A-submodule Q of M, range(β) lies in l(Q). The native Submodule.FG.map makes l(Q) finitely generated. Thus α is composed with πB rather than restricted to a submodule it may not preserve.
3. Subtract composites to obtain identity_N−β=l(u−α)i. Restrict scalars to K and apply ContinuousLinearMap.opNorm_comp_le twice. Retain both norm factors; the projection need not be contractive.

Prerequisites: `LocallyAnalyticDistributions:L4/riesz-geometric-factor`, `LocallyAnalyticDistributions:L4/finite-image-range-comparison`, `mathlib:Submodule.projectionOntoL`, `mathlib:Submodule.projectionOntoL_apply_left`, `mathlib:Submodule.FG.map`, `mathlib:ContinuousLinearMap.opNorm_comp_le`.


Acceptance:

- On K² with u=diag(1,0), a=1, h=1 and the coordinate complement, an approximant sending e₁ to e₁+εe₂ does not preserve N. Its compression β nevertheless equals identity_N.
- The finite-image condition is over A, not finite K-rank. D may be zero on the zero module; the following tolerance choice includes that case.

Source: Proposition 3.2, complete proof on manuscript pp.23–24. Expands the finite-generation and projectivity paragraph using the existing native closed root kernel and continuous splitting; no constant-rank or determinant conclusion is imported.

### Complete continuity of the root identity

`LocallyAnalyticDistributions:L4/riesz-kernel-compact-identity` (lemma); proposed declaration `riesz_kernel_identity_completelyContinuous`.

If u is completely continuous and N=ker((1−au)^h) has a native topological complement F, then identity_N is completely continuous in the imported ordinary complete-continuity sense.

Hypotheses and conventions:

- K is a complete nontrivially normed field; A is a nonzero complete Noetherian normed K-algebra with norm one for 1. M is a complete normed K-space and an A-module with compatible scalar tower and continuous A-action. Norms of A-linear maps mean the native K-operator norms after restriction of scalars.
- Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed.
- F is an A-submodule with the native topological-complement relation between N and F. Let π:M→N be Submodule.projectionOntoL along F, and put l=πB.

Proof or construction:

1. Fix ε>0 and put D=‖πB‖_K‖i‖_K≥0. The existing norm-approximation comparison supplies finite-A-image α with ‖u−α‖_K<ε/(D+1).
2. Compress α by riesz-compressed-approximation. Its error is at most D‖u−α‖_K, which is strictly less than ε: bound it by (D+1)‖u−α‖_K and multiply the strict approximation inequality by the positive D+1. This proof also handles D=0.
3. Apply completely-continuous-norm-approximation to identity_N. N is complete by the native completeSpace_ker instance. The predicate and its generality remain owned by AdicSpacesPartII:R3; this result is only its Riesz-kernel application.

Prerequisites: `LocallyAnalyticDistributions:L4/riesz-compressed-approximation`, `LocallyAnalyticDistributions:L4/completely-continuous-norm-approximation`, `mathlib:ContinuousLinearMap.completeSpace_ker`.


Acceptance:

- No countable approximating sequence or invariant approximant is assumed. The h=0 and a=0 kernels are zero.

Source: Proposition 3.2, complete proof on manuscript pp.23–24. Expands the finite-generation and projectivity paragraph using the existing native closed root kernel and continuous splitting; no constant-rank or determinant conclusion is imported.

### Finite generation of the root kernel

`LocallyAnalyticDistributions:L4/riesz-kernel-finite` (theorem); proposed declaration `riesz_kernel_finite`.

If u is completely continuous and N=ker((1−au)^h) has a native topological complement F, then N is a finite A-module.

Hypotheses and conventions:

- K is a complete nontrivially normed field; A is a nonzero complete Noetherian normed K-algebra with norm one for 1. M is a complete normed K-space and an A-module with compatible scalar tower and continuous A-action. Norms of A-linear maps mean the native K-operator norms after restriction of scalars.
- Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed.
- F is an A-submodule with the native topological-complement relation between N and F. Let π:M→N be Submodule.projectionOntoL along F, and put l=πB.

Proof or construction:

1. Use riesz-kernel-compact-identity and the native completeness of the closed kernel. Apply the already planned compact-identity-finite equivalence.
2. This invokes the existing Neumann approximation proof once; do not re-plan it or substitute a real/complex compact-operator theorem. Neither (Pr) nor finite K-dimension is required for this conclusion.

Prerequisites: `LocallyAnalyticDistributions:L4/riesz-kernel-compact-identity`, `LocallyAnalyticDistributions:L4/compact-identity-finite`, `mathlib:ContinuousLinearMap.completeSpace_ker`.


Acceptance:

- The conclusion is Module.Finite over the coefficient ring A; for infinite-dimensional A over K, this does not imply finite-dimensionality over K.

Source: Proposition 3.2, complete proof on manuscript pp.23–24. Expands the finite-generation and projectivity paragraph using the existing native closed root kernel and continuous splitting; no constant-rank or determinant conclusion is imported.

### Projectivity of the finite root kernel

`LocallyAnalyticDistributions:L4/riesz-kernel-projective` (theorem); proposed declaration `riesz_kernel_projective`.

If M has (Pr), u is completely continuous and N=ker((1−au)^h) has a native topological complement F, then N is an algebraically projective A-module; together with riesz-kernel-finite it is finite projective.

Hypotheses and conventions:

- K is a complete nontrivially normed field; A is a nonzero complete Noetherian normed K-algebra with norm one for 1. M is a complete normed K-space and an A-module with compatible scalar tower and continuous A-action. Norms of A-linear maps mean the native K-operator norms after restriction of scalars.
- Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed.
- F is an A-submodule with the native topological-complement relation between N and F. Let π:M→N be Submodule.projectionOntoL along F, and put l=πB.

Proof or construction:

1. Apply riesz-kernel-pr and riesz-kernel-finite to N with the given continuous projection. The native closed-kernel instance supplies its completeness.
2. Invoke the existing finite-pr-projective theorem, whose proof lifts identity through a continuous finite-free surjection and forgets topology. Its finite-module-topology dependency remains an explicit gap; this checkpoint does not establish that supplier.
3. In riesz-root-projectors specialize F to image(v^h) using riesz-topological-splitting. The root order and Hasse conditions are needed to construct that complement, not in the present finite-projectivity adapter.

Prerequisites: `LocallyAnalyticDistributions:L4/riesz-kernel-pr`, `LocallyAnalyticDistributions:L4/riesz-kernel-finite`, `LocallyAnalyticDistributions:L4/finite-pr-projective`, `mathlib:ContinuousLinearMap.completeSpace_ker`, `mathlib:Module.Projective`.


Acceptance:

- For A=K×K, u=identity and a=(1,0), h=1 gives N=(1,0)A, a finite projective module with varying component rank. The parameter a is not a unit; no freeness or constant rank follows from this theorem.
- The constant-rank h and exact determinant assertions of the full Fredholm-root theorem require its remaining nonreduced determinant argument.

Source: Lemma2.11, manuscript p.19, and Proposition3.2 proof, pp.23–24. Separates the finite-generation and (Pr) inputs from the remaining rank/determinant proof. The native algebraic projectivity carrier is reused.

### Executable and source boundary

The suggested file now includes the existing finite-pr-projective theorem as
`projective_of_finite_hasPr`, with native Module.Finite and Module.Projective.
The pre-existing `hasPr_retract` signature is reused once; it is promoted to
its own node because the root-kernel argument consumes it. Generic complete
continuity remains owned by AdicSpacesPartII:R3, with the existing request for
Noetherian Banach-algebra generality. No strict variant or second predicate is
introduced.

This follow-up freshly reads Buzzard manuscript pp.18–20 and23–25 and Serre
printed pp.80–82 (PDF13–15). The public PDFs have the hashes recorded below.
The explicit finite geometric inverse and approximant compression are worker
deductions of Buzzard's finite-projectivity paragraph. Serre's dimension
argument over a field is not transferred to a Banach coefficient algebra.
No new source error or review verdict is asserted.

## Current checkpoint and continuation

The packet has **75 nodes**: 3 definitions, 10 constructions, 37 lemmas,
18 theorems and7 comparisons. It has **49 API entries**, **60 packet tests**,
**60 typed examples**, **6 planets**, **75 baseline references**, **8 gaps**,
**5 requests** and**0 closed stages**. The thirteen definitions/constructions
have45 API entries and42 tests. All67 predecessor statements, hypotheses,
APIs and tests are preserved;66 predecessor node objects are unchanged.
Only the composite root theorem's third proof step and three prerequisites
are updated to consume the new chain. All13 adjugate nodes are unchanged.

The entire suggested file compiles with **zero errors and165 proof-placeholder
warnings only**. All1,890 reached Mathlib sources match the pinned commit.
There are no actual Tau Ceti or planned-supplier imports; the explicitly
labelled complete-continuity stub remains. This checks signatures, not proofs.
A separate scratch file proves11 complete lemmas and constructs the native
kernel equivalence with zero errors, warnings or placeholders, against1,633
byte-checked Mathlib sources. It checks both geometric factors, invariance,
the actual compressed identity, finite generation of mapped images and the
operator error estimate. It does not prove the final finite-projectivity
chain against implemented suppliers.

An exact finite regression passes611 assertions over primes2,3 and5. It checks
left and right geometric identities, Jordan inverses, and18 approximants that
do not preserve the kernel. With an oblique complement the actual projection
norm is necessary:18 controls fail if that factor is omitted. A product-ring
control retains the nonunit-parameter, varying-rank example. These finite
checks do not prove an infinite-dimensional theorem. Earlier adjugate and
Riesz validation below is historical and was not rerun for this follow-up.

Continue with canonical finite-module topology and inverse norm bounds, the
finite-projective determinant/rank proof over nonreduced coefficients,
Cayley–Hamilton, polynomial division, the (Pr) exercises and completed tensors,
and Coleman spectral-resultant transport. L0–L3 and the actual L4 distribution
families, coefficient action, uniform radii, semigroup estimates and
specialization remain open. Preserve the RS-16 owners and existing suppliers.

## Previous adjugate checkpoint: historical validation

The packet has **67 nodes**: 3 definitions, 9 constructions, 32 lemmas,
16 theorems and 7 comparisons. All 54 predecessor statements and hypotheses,
49 complete node objects, 13 integrated reviewed IDs and 19 links are retained.
Five earlier nodes gain precise dependencies, proof details or acceptance
text, and the resolvent gains its initial-coefficient API. Totals are
**46 API entries**, **56 packet tests and typed examples**, **6 planets**,
**66 baseline references**, **8 gaps**, **5 requests**, **0 closed stages**.
The twelve definitions/constructions have 42 API items and 38 tests.
All implementations remain unchecked.

At that checkpoint the suggested file compiled with **zero errors and 150 proof-placeholder
warnings only**. All 1,890 reached Mathlib source files match the pin.
No actual Tau Ceti or planned supplier module is imported. The explicitly
labelled AdicSpacesPartII complete-continuity signature stub and its generality
request are unchanged. Compilation checks types, not the proposed proofs.

A separate scratch file proves seven complete lemmas with no errors, warnings
or placeholders: the two-dimensional polynomial adjugate and its coefficients,
the determinant and recurrence, and compression of the native continuous-linear
recurrence through a genuine retraction. It reaches 1,635 source-audited Mathlib
modules. Exact finite arithmetic passes **56,192 assertions** over **2,190
systems** in dimensions one through three and primes 2, 3 and 5, using the
nonreduced normed coefficient rings Q_p[ε]/ε². These check the recurrence,
distinct-column bounds, uniform tail estimates and the necessary retraction
norm factors. Controls retain the missing-input-coordinate example, nilpotent
nonzero resolvents, nonreduced coefficients and degree-zero empty products.
These checks do not prove infinite-dimensional convergence or finite rank.
Earlier Riesz scratch proofs and finite regressions remain historical evidence.

That continuation freshly reads Buzzard's full manuscript p.22 and Serre's
full printed pp.78–79 (PDF11–12), including a rendered p.79 check. Both public
PDFs match the recorded hashes. The earlier reading scopes below are prior
provenance; no new source error is alleged.

## Sources

The packet records the read sections and public versions of [Buzzard, Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), [Serre, Endomorphismes complètement continus](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), and [Coleman, P-adic Banach Spaces and Families of Modular Forms](https://math.uchicago.edu/~fcale/Files/Cole2.pdf). BGR was not acquired. No new published error is asserted; the finite-projective and nonreduced examples above are guards against invalid proof shortcuts in a formalization.

The Buzzard manuscript was fetched again on 27 September 2026 and its SHA-256 verified as `0c54243868e2da8849452c4cc5a3d4e7b118cf17dd04487d4af137ab167ef57d`. The preceding continuation read manuscript/physical pp. 7–12 and 22–24. The current continuation freshly read full Buzzard pp. 22–24 and Serre printed pp. 78–81 (PDF pp. 11–14), rendering printed p. 81 to check the formulas. The Serre PDF hash is `67a032c129ad2a36adeeadc4b4ccb3c0ab17c5a1ef8de83f7dda85f2115fe402`. Earlier Coleman reading remains inherited provenance; downloading its PDF here is not claimed as a fresh source reading.

The Riesz algebra follow-up freshly read full Buzzard manuscript pp. 23–24 and Serre printed pp. 80–81 from the same hash-verified public PDFs. Earlier broader source readings remain predecessor provenance. No new source error or independent-review verdict is asserted. The native projection declarations were read at the exact Mathlib pin. Tau Ceti's finite-length Fitting result and the real/complex closed-range part of Riesz theory do not provide this Banach-algebra Hasse decomposition.


## Principal minors and Fredholm coefficients

The finite algebra works over a normed commutative ring with norm one and an
ultrametric norm. Completeness enters when cofinite decay is converted into
unconditional summability. Noetherianity enters through the earlier theorem
that identifies complete continuity with cofinite decay of the output-column
norms. Neither condition belongs in the finite matrix estimates themselves.

Keep the source convention u(e_i)=sum_j a_ij e_j, with input index first and
output index second. A term of a principal determinant uses every output
column once. Submultiplicativity bounds that term by the product of its column
majorants, and the ultrametric sum inequality preserves the same bound through
the permutation sum. Integer-unit signs preserve norms. There is no factorial
factor, and the empty determinant equals one.

For each positive degree n, choose a common column bound C≥1. Given ε>0,
only finitely many columns have size at least ε/C^(n−1). Only finitely many
n-element subsets lie entirely among those exceptional columns. Every other
minor contains a small column and has norm less than ε. This proves cofinite
decay on the actual fixed-cardinality subset type, without an enumeration of
the index set. In degree zero that type is a singleton and its cofinite filter
is bottom; its sole determinant is still one. Completeness and the native
nonarchimedean summability criterion give the coefficients of the formal series.

There are two separate estimates after this construction. For continuity in
one fixed degree, subtract two finite products and induct by adding one factor.
The ultrametric bound has one difference factor and n−1 factors bounded by C.
The corresponding determinant estimate passes through the summable family of
principal minors. For entireness, split a finite set of columns into those in
a fixed exceptional set T and those outside it. At radius R, use B≥1 on T and
q≤1 elsewhere. This gives B^card T q^max(n−card T,0), uniformly for every matrix
with the same column majorant. Taking q<1 gives the required tail decay.

The finite-coordinate comparison uses an existing Mathlib theorem:
`Matrix.coeff_det_one_add_X_smul_eq_sum_minors`. Apply it to the negative
matrix, then use `Matrix.det_neg`. Principal minors meeting a zero output
column vanish by `Matrix.det_eq_zero_of_column_eq_zero`. The polynomial
comparison therefore reduces to native finite algebra. An arbitrary finite
free image still requires the separately recorded topology and transport
arguments; this comparison does not identify such an image with a coordinate
submodule.

### Fredholm determinant in an orthonormal chart

`LocallyAnalyticDistributions:L4/fredholm-determinant` (construction).

For completely continuous u on c_A(I), construct the formal power series P_u with c_0=1 and c_n=(-1)^n sum_{S subset I, card S=n} det(a_ij)_{i,j in S}. Entireness and chart independence are the separately named ensuing theorems.

**Hypotheses:** Standing Banach hypotheses and complete continuity.

**Proof outline:**

1. Apply compact-matrix-criterion to obtain bounded cofinite-null output-column sizes. The fixed-degree-minors-null lemma supplies cofinite decay of the minor family at every n, including the singleton degree-zero family.
2. Install the native ultrametric-distance instance from the stated norm inequality and apply the generated additive form of NonarchimedeanGroup.multipliable_iff_tendsto_cofinite_one. Completeness gives the unconditional sum over the actual fixed-cardinality subset type.
3. Assemble the signed coefficients in the existing power-series carrier. The empty minor gives c_0=1. Entireness, basis independence and spectral properties remain ensuing theorems.

**Prerequisites:** `LocallyAnalyticDistributions:L4/compact-matrix-criterion`, `mathlib:NonarchimedeanGroup.multipliable_iff_tendsto_cofinite_one`, `LocallyAnalyticDistributions:L4/fixed-degree-minors-null`, `mathlib:IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`.

**Uses:**

- determinant-invariance, gauss-convergence and summand-fredholm-theory: The primary determinant, with analytic properties proved rather than assumed.

**API:**

- `fredholmSeries_coeff` (characterisation): The n-th coefficient is the signed principal-minor sum.
- `fredholmSeries_constant` (simp): The constant coefficient is one.
- `fredholmSeries_isEntire` (compatibility): The minor-tail-estimate proves decay at every positive real radius.

**Unit tests:**

- `zero_operator` (characterisation): P_0=1.
- `rank_one_scalar` (characterisation): For multiplication by a on A, P_u=1-aT.
- `nonzero_nilpotent` (characterisation): For the nonzero two-by-two nilpotent Jordan block, P_u=1; determinant one does not mean u=0.

**Acceptance:** The sign is (-1)^n and the constant coefficient is one, including the zero module.

**Sources:** Buzzard-Eigenvarieties-2006, Definition following Proposition 2.4, p. 12 The signed principal-minor construction, separated from its later invariance and growth statements.

### Uniform entire tail bound from column majorants

`LocallyAnalyticDistributions:L4/minor-tail-estimate` (lemma).

Suppose a family of completely continuous matrices has output-column norms bounded by one bounded cofinite-null family b_j>=0. Fix R>0 and 0<q<1, choose finite T with R b_j<=q outside T, m=card T and B=max(1,R sup_j b_j). Uniformly throughout the family, norm(c_n) R^n<=B^m q^max(n-m,0).

**Hypotheses:** Standing Banach hypotheses; coefficients c_n use the signed principal-minor construction.

**Proof outline:**

1. Apply ultrametric-determinant-bound to each principal minor, then multiply by R^n and rewrite as the product of the n distinct scaled column majorants R b_j.
2. Apply distinct-column-product-tail to these scaled majorants, B=max(1,R L) for any common upper bound L. It yields B^card T q^max(n−card T,0), independent of the matrix in the family.
3. Divide by the positive factor R^n, apply the native additive unconditional-sum bound to the minor family, and restore R^n. The sign (-1)^n preserves the norm.
4. For 0<q<1 the bound tends to zero as n increases; this gives the required entire tail, uniformly for a family with the same majorant.

**Prerequisites:** `LocallyAnalyticDistributions:L4/fredholm-determinant`, `LocallyAnalyticDistributions:L4/entire-series`, `LocallyAnalyticDistributions:L4/ultrametric-determinant-bound`, `LocallyAnalyticDistributions:L4/distinct-column-product-tail`, `mathlib:IsUltrametricDist.norm_tprod_le_of_forall_le_of_nonneg`, `mathlib:norm_units_zsmul`.

**Acceptance:** The bound applies to a family, not merely to one limit matrix; this distinction is needed to interchange evaluation and approximation.

**Sources:** Serre-EndomorphismesCC-1962, Proposition 7(b) and its column-product estimate, pp. 75-76; Proposition 8, p. 77 Explicit finite-exception formulation of the minor-product estimate; the argument uses only ultrametricity and submultiplicativity and therefore applies to A. The uniform-family formulation is proved here rather than attributed verbatim.

### Lipschitz bound in each determinant degree

`LocallyAnalyticDistributions:L4/coefficient-continuity` (lemma).

For completely continuous u,v in the same ON chart with norm(u),norm(v)<=C and C>=1, n>=1, norm(c_n(u)-c_n(v))<=norm(u-v) C^(n-1).

**Hypotheses:** Standing Banach hypotheses.

**Proof outline:**

1. In the common ON chart, bound every entry of u,v by C and their difference by the K-operator norm of u−v, using the basis vector of norm one and coordinate evaluation of norm at most one.
2. Apply ultrametric-determinant-perturbation to every n-element principal minor. The same bound holds for each difference.
3. Both minor families are summable by fixed-degree-minors-null and the native complete nonarchimedean criterion. Subtract their unconditional sums, then use the native additive unconditional-sum bound. The common sign preserves norm; degree zero is the separate constant-one case.

**Prerequisites:** `LocallyAnalyticDistributions:L4/fredholm-determinant`, `LocallyAnalyticDistributions:L4/ultrametric-determinant-perturbation`, `LocallyAnalyticDistributions:L4/fixed-degree-minors-null`, `LocallyAnalyticDistributions:L4/c0-operator-norm-criterion`, `mathlib:IsUltrametricDist.norm_tprod_le_of_forall_le_of_nonneg`, `mathlib:norm_units_zsmul`.

**Acceptance:** Handle the constant coefficient separately; it is identically one.

**Sources:** Serre-EndomorphismesCC-1962, Proposition 8 proof, p. 77 Isolates the telescoping estimate used before uniform control of all degrees.

### Determinant of a finite-coordinate operator

`LocallyAnalyticDistributions:L4/finite-coordinate-determinant` — `finite_coordinate_determinant` (comparison).

If u(c_A(I)) is contained in the coordinate submodule A^S for a finite S, then P_u is the ordinary characteristic polynomial det(1-T u|A^S).

**Hypotheses:** Standing Banach hypotheses; S is finite.

**Proof outline:**

1. If a principal subset meets the complement of S, choose an output index in that complement. Its column is identically zero by the image-support hypothesis, and Matrix.det_eq_zero_of_column_eq_zero makes the minor vanish.
2. The remaining unconditional sum is the finite sum over subsets of S of the specified cardinality. Reindex through their inclusion in I.
3. Apply the already implemented Matrix.coeff_det_one_add_X_smul_eq_sum_minors to the negative of the finite restricted matrix; Matrix.det_neg supplies (-1)^n. Compare coefficients of power series. No new finite determinant coefficient theorem is planned.

**Prerequisites:** `LocallyAnalyticDistributions:L4/fredholm-determinant`, `mathlib:Matrix.det_eq_zero_of_column_eq_zero`, `mathlib:Matrix.coeff_det_one_add_X_smul_eq_sum_minors`, `mathlib:Matrix.det_neg`, `mathlib:Finset.mem_powersetCard`.

**Unit tests:**

- `native_finite_coefficient_formula` (compatibility): For a finite matrix D, the coefficient of degree k in det(1+T D) is exactly the native sum of principal k-minors; applying it to -D supplies the Fredholm sign.

**Acceptance:** Apply only to the named finite coordinate module; do not silently identify a general finite image with a free module.

**Sources:** Buzzard-Eigenvarieties-2006, Lemma 2.5(b), pp. 12-13 The finite-coordinate comparison needed for the product-limit argument.

### Ultrametric perturbation of a finite product

`LocallyAnalyticDistributions:L4/ultrametric-product-perturbation` — `ultrametric_product_perturbation` (lemma).

Let S be a finite set, f,g:S→A, C≥1 and δ≥0. If norm(f_i),norm(g_i)≤C and norm(f_i−g_i)≤δ for every i, then norm(product f_i−product g_i)≤δ C^max(card S−1,0).

**Hypotheses:** A is any normed commutative ring with norm(1)=1 and an ultrametric norm; completeness, a coefficient field and Noetherianity are unnecessary.

**Proof outline:**

1. Induct on S. The empty product difference is zero; handle the singleton before the positive-cardinality induction step.
2. For an inserted index a, expand the difference as (f_a−g_a) product f + g_a(product f−product g). The native finite-product norm inequality bounds the first product by C^card S; the induction hypothesis bounds the difference in the second.
3. Apply the ultrametric two-term bound. Each term is at most δ C^card S, so no factor card S appears.

**Prerequisites:** `mathlib:Finset.norm_prod_le`, `mathlib:IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`.

**Unit tests:**

- `product_empty_difference` (degenerate): For empty S, the difference of the two empty products has norm zero, hence is at most every δ≥0.

**Acceptance:** For one factor this is precisely the assumed difference bound. For no factors it is 0≤δ. The two terms must be combined with a maximum, not an ordinary sum.

**Sources:** Serre-EndomorphismesCC-1962, Proposition 8 proof, printed p. 77 (PDF p. 10) Extracts the product-difference step and gives its explicit uniform C-bound over a normed ring; it uses only the displayed telescoping identity, submultiplicativity and ultrametricity.

### Determinant bound by distinct output columns

`LocallyAnalyticDistributions:L4/ultrametric-determinant-bound` — `ultrametric_determinant_bound` (lemma).

For a square matrix D indexed by a finite type J, let b_j≥0 satisfy norm(D_ij)≤b_j for all i,j. Then norm(det D)≤product_{j in J} b_j, including J empty.

**Hypotheses:** A is a normed commutative ring with norm(1)=1 and an ultrametric norm. No multiplicativity of the norm, reducedness, field hypothesis or completeness is required.

**Proof outline:**

1. Expand the native determinant as the permutation sum of signs times products D_(σ(j),j). Each product uses each output column exactly once.
2. Use the native product norm bound termwise and norm preservation under integer-unit signs. The common bound is nonnegative.
3. Apply the generated additive ultrametric finite-sum bound. For an empty matrix the unique empty permutation contributes one and the product bound is one.

**Prerequisites:** `mathlib:Matrix.det_apply`, `mathlib:Finset.norm_prod_le`, `mathlib:norm_units_zsmul`, `mathlib:IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`, `mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`.

**Unit tests:**

- `singleton_determinant_bound` (computation): The determinant of the one-by-one matrix (a) is a, so its norm is at most any bound on norm(a).
- `determinant_empty_bound` (degenerate): The determinant of the identity matrix on an empty finite type has norm one.

**Acceptance:** A diagonal matrix can attain the bound. A zero column gives zero. Nilpotent nonreduced coefficients remain in the determinant; no residue-field reduction is used.

**Sources:** Serre-EndomorphismesCC-1962, Proposition 7(a,b), printed pp. 75–76 (PDF pp. 8–9) Spells out the distinct-column estimate over the coefficient-ring generality used by Buzzard; the source proves the field case.

### Uniform finite determinant perturbation

`LocallyAnalyticDistributions:L4/ultrametric-determinant-perturbation` — `ultrametric_determinant_perturbation` (lemma).

Let D,E be square matrices on a finite type J, C≥1 and δ≥0. If every entry of D and E has norm at most C and every corresponding difference has norm at most δ, then norm(det D−det E)≤δ C^max(card J−1,0).

**Hypotheses:** A is a normed commutative ring with norm(1)=1 and an ultrametric norm. The empty-index case is allowed.

**Proof outline:**

1. Subtract the two native permutation expansions using the same permutations and signs.
2. Apply ultrametric-product-perturbation to each permutation product. Integer-unit signs preserve norms.
3. The native ultrametric finite-sum inequality preserves the same bound. For an empty type both determinants are one and their difference is zero.

**Prerequisites:** `LocallyAnalyticDistributions:L4/ultrametric-product-perturbation`, `mathlib:Matrix.det_apply`, `mathlib:norm_units_zsmul`, `mathlib:IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`, `mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`.

**Acceptance:** For degree one the estimate has constant one. The general estimate contains neither card J nor its factorial.

**Sources:** Serre-EndomorphismesCC-1962, Proposition 8 proof, printed p. 77 (PDF p. 10) Isolates the finite determinant estimate needed before taking the summable principal-minor difference.

### Cofinite decay of fixed-degree principal minors

`LocallyAnalyticDistributions:L4/fixed-degree-minors-null` — `fixed_degree_minors_null` (lemma).

Let I be any index type and a:I×I→A. Suppose norm(a_ij)≤b_j, where b_j≥0 is bounded and tends to zero along the cofinite filter on I. For every n≥0 the family det(a_ij) indexed by the finite subsets S of I with card S=n tends to zero along the cofinite filter on that family of subsets.

**Hypotheses:** A is a normed commutative ring with norm(1)=1 and an ultrametric norm. I need not be countable. Completeness is needed only when the ensuing construction invokes unconditional summability.

**Proof outline:**

1. For n=0 the index type has the single element empty; its cofinite filter is bottom, so convergence imposes no vanishing condition on that one determinant.
2. For n>0 choose C≥1 bounding every b_j. Given ε>0, the cofinite decay provides a finite T outside which b_j<ε/C^(n−1).
3. Except for the finite family T.powersetCard n, each S contains some j outside T. The determinant column bound gives norm(det a_S)≤b_j C^(n−1)<ε, using the other n−1 columns and their uniform C-bound.
4. Translate this finite-exception estimate into cofinite convergence. When A is complete, the native additive nonarchimedean summability criterion supplies the unconditional sum, with no chosen enumeration.

**Prerequisites:** `LocallyAnalyticDistributions:L4/ultrametric-determinant-bound`, `mathlib:Finset.mem_powersetCard`.

**Acceptance:** The constant coefficient comes from the sole empty minor equal to one; it is not forced to vanish. A single nonzero column can occur at an arbitrary index and must not require a countable enumeration.

**Sources:** Buzzard-Eigenvarieties-2006, Definition following Proposition 2.4, manuscript p. 12 Decomposes the asserted convergence of the principal-minor sum, retaining the arbitrary index set and explicitly separating the degree-zero boundary.

### Finite exceptional-set product estimate

`LocallyAnalyticDistributions:L4/distinct-column-product-tail` — `distinct_column_product_tail` (lemma).

Let S,T be finite subsets of an arbitrary set I. Let b:I→R satisfy 0≤b_j≤B with B≥1, and suppose b_j≤q outside T where 0≤q≤1. Then product_{j in S} b_j≤B^card(T) q^max(card(S)−card(T),0).

**Hypotheses:** The coefficient family in this lemma is real and nonnegative. It need not tend to zero; this is a finite product statement, valid also at q=0 and q=1.

**Proof outline:**

1. Split S into S intersect T and S minus T. Bound the product on the intersection by B^r and the remaining product by q^s.
2. The native cardinality identity gives r+s=card S and r≤card T, hence s≥max(card S−card T,0).
3. Since B≥1, increase r to card T; since q lies in [0,1], decrease s to max(card S−card T,0). Retain the empty-product convention, including 0^0=1.

**Prerequisites:** `mathlib:Finset.card_sdiff_add_card_inter`.

**Acceptance:** For T empty the bound is q^card S. If q=0 and card S>card T, a zero factor forces the product to vanish. Repeated column indices would invalidate the argument.

**Sources:** Serre-EndomorphismesCC-1962, Proposition 7(b), printed p. 76 (PDF p. 9) A finite-exception form of the distinct-column product bound; this avoids selecting a decreasing enumeration and works for arbitrary index types.

### Validation and continuation

All 75 predecessor statements and hypotheses, 71 whole node objects,
75 baseline records, six planets and five requests are preserved. Five new
lemma nodes and nine native baseline references refine the coefficient
argument. Four existing declarations gain exact proof dependencies; the
finite-coordinate comparison gains its typed conclusion. The packet contains
3 definitions, 10 constructions, 42 lemmas, 18 theorems and 7 comparisons.
Definitions and constructions account for 45 API entries and 42 tests.

The complete suggested file compiles with zero errors and 175 expected
proof-placeholder warnings only, reaching 1,983 byte-verified pinned Mathlib
sources. It imports no actual Tau Ceti or supplier module. The labelled
AdicSpacesPartII:R3 signature stub and generality request remain unchanged.
Seven complete scratch lemmas compile with zero errors, warnings or
placeholders, reaching 1,803 pinned Mathlib sources. Independent exact tests
pass 31,013 assertions in 1,200 finite matrix systems over rational dual-number
coefficients with the p-adic max norm, for p=2,3,5,7. The tests include finite
exceptional sets and q=0, q=1 boundary cases. These checks do not prove the
infinite-dimensional topology or close any roadmap stage.

Continue with arbitrary finite-free-image determinant comparison, finite
projective determinants and constant rank, BGR finite-module topology and
inverse bounds, spectral-resultant transport, and the actual completed tensor
carrier. The existing Riesz kernel finiteness/projectivity chain remains.
L0–L3 and the analytic distribution families and specialization in L4 still
require their full source decomposition. Preserve the PMIA suppliers and
RS-16 ownership boundaries.
