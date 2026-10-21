# CA.6. Special algebraic numbers and Mahler measure: analytic inputs

This part supplies the analytic tools for two existing CA.6 targets: Smyth’s nonreciprocal Mahler-measure bound and Dimitrov’s Schinzel–Zassenhaus bound. The arithmetic definitions, Pisot and Salem theory, root-power polynomials and degree inductions are imported from the [parent roadmap](ClassicalArithmeticCompletion.md#ca6-special-algebraic-numbers-and-mahler-measure). The statements here specify a proposed library; none asserts an implemented proof.

The coefficient route uses bounded holomorphic functions on the open unit disc and formal multiplication. The capacity route uses finite Fekete diameters, monic Chebyshev norms, a radial-slit conformal-radius comparison and integer Hankel determinants. It does not require general logarithmic-energy minimization, Sobolev spaces or a harmonic-measure library.

All finite root products include multiplicity. Complex segments use real affine parameters. The transfinite diameter has the length normalization d([0,a])=|a|/4 and d(closedBall(0,R))=R. Dirichlet condenser capacity has the separate normalization 2π/log(R/r). The Laurent variable is w=1/z; its leading Hankel matrix has entry a_(i+j+1), so a₀ is excluded. A rational formal series means Q(0)≠0 and Q·S=P for polynomials P,Q, using [CA.2/rational-power-series](ClassicalArithmeticCompletion.md#CA-2-rational-power-series).

At the pinned baseline, polynomial Mahler measure, number-field house, Kronecker’s root-of-unity theorem and Northcott already exist. The algebraic-number measure and its height comparisons are imported from DiophantineApproximationAndTranscendence:DT.0. Neither is reconstructed in this part. General logarithmic-energy capacity belongs to LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1; under the upstream tier order LP.1 imports the finite-diameter notions below from CA.6. CA.6 has no dependency on LP.1.

## Dependencies and milestones

For Smyth, the parent’s integral quotient supplies F. The bounded factorization supplies two real Schur series with constant c=M(P)⁻¹. The coefficient restrictions give the first-index reduction; the long-gap case gives c³+c²≤1. The short-gap target gives the quartic condition and hence the strict comparison with the plastic number. Its exact two multipliers and their inequalities remain the mathematical verification specified at that target. This part therefore supplies an explicit target chain without certifying the sharp bound’s missing calculation.

For Dimitrov, Fekete–Chebyshev equivalence gives regular lemniscate enclosures and monic contour bases. Dubinin’s rotational comparison gives the sharp hedgehog bound through inversion. The contour basis bounds the shifted Hankel determinants with exponent n(n−1). Integer coefficients and diameter below 1 force eventual vanishing, so Kronecker gives rationality over ℚ. The normalized square-root branch supplies the required continuation; the parent’s integer-series construction and degree induction consume this result.

## Disc coefficients and the nonreciprocal bound

<a id="real-schur-series"></a>

### Real coefficient Schur series

`ClassicalArithmeticCompletion:CA.6/real-schur-series` · definition.

A real coefficient sequence e : ℕ → ℝ is a real Schur series when there exists f : ℂ → ℂ holomorphic on |z|<1 such that Σ e_j z^j converges to f(z) at every point of that disc and |f(z)|≤1 there. The function is uniquely determined on the disc; no boundary extension is required. The formal series is PowerSeries.mk e.

Hypotheses and conventions: The disc is open. Real coefficients are part of the object, rather than a reality assumption on f at every complex point.

Uses: Smyth §2 and §5, pp. 170–171, 174–175: Supplies coefficient bounds for the numerator and denominator of the integral rational function. Smyth §4, pp. 172–174: Allows finite Parseval truncations after multiplication by auxiliary polynomials.

Planning API:

- `RealSchurSeries.function_unique` (characterisation): Two holomorphic witnesses with the specified HasSum expansion agree throughout the open unit disc.
- `RealSchurSeries.conj` (compatibility): For a witness f, f(conj z)=conj(f(z)) on the disc.
- `RealSchurSeries.constant` (constructor): The constant sequence e_0=c, e_j=0 for j>0 is Schur exactly when |c|≤1.
- `RealSchurSeries.mul` (structure): The coefficient convolution of two real Schur series is a real Schur series.
- `RealSchurSeries.coeff_zero_eq` (compatibility): Its constant coefficient is f(0), and its formal coefficients are exactly PowerSeries.coeff j (PowerSeries.mk e).

Checks:

- `realSchur_constant_boundary` (degenerate): Both constant series 1 and −1 are Schur.
- `realSchur_monomial` (computation): For k≥1, the coefficient sequence of z^k is Schur, with e_0=0 and e_k=1.
- `realSchur_constant_outside` (non-example): The constant series 3/2 is not Schur.
- `realSchur_rational_example` (compatibility): (1/2+z)/(1+z/2) is Schur and has coefficients e_0=1/2, e_1=3/4, e_2=−3/8.

Proof or construction:

1. Use HasSum for the coefficient expansion and DifferentiableOn for holomorphy; uniqueness of sums makes the associated function independent of its witness.
2. Conjugating the expansion gives f(conj z)=conj(f(z)); a function holomorphic on the open disc is the sum of its Taylor series at every point of the disc (Complex.hasSum_taylorSeries_on_ball), which gives the coefficient sequence of a witness; polynomial and rational examples also follow from the Cauchy power series on smaller closed discs.

Further acceptance checks:

- The closed bound permits constant functions ±1, while every nonconstant witness maps into the open disc.

Direct prerequisites: `mathlib:PowerSeries.mk`; `mathlib:DifferentiableOn.hasFPowerSeriesOnBall`; `mathlib:Complex.hasSum_taylorSeries_on_ball`.

Sources: [C. J. Smyth, §2 lemma, pp. 170–171][smyth-1971]. The coefficient estimates apply to real-coefficient bounded holomorphic functions; this definition removes the unnecessary neighbourhood-of-the-closed-disc restriction.

<a id="smyth-bounded-factorization"></a>

### Smyth’s bounded holomorphic quotient

`ClassicalArithmeticCompletion:CA.6/smyth-bounded-factorization` · construction.

Let P∈ℤ[X] be monic, P(0)=±1, with no complex root on the unit circle. Put Q=P.reverse and A=M(P). There are real-coefficient finite Blaschke products f,g, holomorphic on a neighbourhood of the closed unit disc, with f(0)=g(0)=c=A⁻¹>0 and Q(z)f(z)=P(0)P(z)g(z). On points where Q and g are nonzero, f/g=P(0)P/Q. If P is irreducible and nonreciprocal, that quotient is nonconstant and not a polynomial.

Hypotheses and conventions: P(0)=±1 excludes zero roots; no roots on the unit circle is explicit. Irreducibility and nonreciprocity are used only for the final non-polynomial assertion.

Uses: CA.6/smyth-nonreciprocal-lower-bound: Transforms the arithmetic target into coefficient restrictions with c=M(P)⁻¹. CA.6/smyth-schur-reduction: Supplies the formal multiplication identity and real bounded coefficients.

Planning API:

- `smythFactorization_schur` (compatibility): The Taylor coefficients of f and g are real Schur series.
- `smythFactorization_constant` (projection): Their common constant coefficient is M(P)⁻¹.
- `smythFactorization_boundary` (relation): Both products have modulus 1 on the unit circle.
- `smythFactorization_coeff_mul` (compatibility): For the integral formal expansion F of P(0)P/Q, the real-coefficient identity F·g=f holds coefficient by coefficient.
- `smythFactorization_nonpolynomial` (characterisation): If P is irreducible and P.reverse≠±P, F is not the coercion of any polynomial.

Checks:

- `smythFactorization_plastic` (computation): For P=X³−X−1, c=θ₀⁻¹ for both products.
- `smythFactorization_reciprocal` (degenerate): For P=X²−3X+1, f=g and F=1; this is permitted by the construction but excluded by the nonreciprocal theorem.
- `smythFactorization_nonunit` (non-example): P=X−2 is outside the unit-constant hypothesis; the assertion c_f=c_g=1/2 would be false for its inside-root product.

Proof or construction:

1. Use b_α for roots α of P inside the disc to form f, and b_(α⁻¹) for roots α of P outside the disc to form g, with multiplicities. Work with the scalar formula (z−α)/(1−conj(α)z) of the pinned disc factor: for |α|<1 its denominator does not vanish on |z|<1/|α|, so hasDerivAt_unitDiscMoebiusFormula gives holomorphy on a neighbourhood of the closed disc, and Complex.hasSum_taylorSeries_on_ball gives the Taylor coefficients of the products.
2. The inside-root product and the inverse outside-root product both have absolute value A⁻¹ because the total root product has modulus 1. Conjugation-stability makes the products real-coefficient; choose real signs to make both constants positive.
3. Compare the two rational functions by their zeros and poles and their value at zero. In the irreducible nonreciprocal case P and Q are coprime and have equal degree, so their nonconstant quotient is not polynomial.

Further acceptance checks:

- Keep the cross-multiplied identity; dividing at a zero of g is not permitted.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/real-schur-series`; `ClassicalArithmeticCompletion:CA.6/smyth-integer-power-series`; `ClassicalArithmeticCompletion:CA.6/reciprocal-iff-reverse`; `tauceti:TauCeti.unitDiscMoebius`; `tauceti:TauCeti.hasDerivAt_unitDiscMoebiusFormula`; `mathlib:Complex.norm_canonicalFactor_eval_circle_eq_one`; `mathlib:Complex.hasSum_taylorSeries_on_ball`.

Sources: [C. J. Smyth, §3, pp. 171–172, root-product quotient and (3)][smyth-1971]. The two bounded root products have the same positive constant, the inverse Mahler measure. [C. J. Smyth, §5.1, published pp. 328–329][smyth-survey-2008]. Smyth’s own outline: F=P(0)P(z)/(z^dP(1/z)) has integer Maclaurin coefficients, is nonconstant for nonreciprocal P, and is a quotient f/g of two functions bounded by 1 on the disc with f(0)=g(0)=M(P)⁻¹, whose coefficients obey Schur’s conditions.

<a id="schur-coefficient-conditions"></a>

### Schur’s first and doubled-index coefficient conditions

`ClassicalArithmeticCompletion:CA.6/schur-coefficient-conditions` · theorem.

If e is a real Schur series, c=e_0 and k≥1, then |e_k|≤1−c². If |c|<1, also −(1−c²)+e_k²/(1+c) ≤ e_(2k) ≤ (1−c²)−e_k²/(1−c). For c=±1 all coefficients of positive index vanish; the fractional inequalities are not stated there.

Hypotheses and conventions: e real Schur; k≥1. The doubled-index inequalities require |c|<1.

Proof or construction:

1. Average the witness over kth-root rotations. The resulting bounded function has expansion h(w)=c+e_k w+e_(2k)w²+⋯; existence on the disc follows from the rotation-invariant series.
2. For |c|<1, h is not a unimodular constant, so the maximum principle (Complex.eqOn_of_isPreconnected_of_isMaxOn_norm) gives |h|<1 on the disc. Apply the disc automorphism to h and divide by w: s(w)=(h(w)−c)/(w(1−c h(w))). Schwarz’s lemma in difference-quotient form (Complex.norm_dslope_le_div_of_mapsTo_ball, for the automorphism image of h, which vanishes at 0) makes s a map into the closed disc. Its first two coefficients are e_k/(1−c²) and e_(2k)/(1−c²)+c e_k²/(1−c²)².
3. Schwarz–Pick at zero bounds the derivative of s. A boundary value |s(0)|=1 forces s constant by the maximum principle, giving the same non-strict bounds. Rearrange to the two displayed inequalities. Treat c=±1 by the maximum principle on the original witness.

Further acceptance checks:

- For (c+z^k)/(1+c z^k), the upper doubled-index bound is attained: e_k=1−c² and e_(2k)=−c(1−c²).
- For −1<c<1 both denominators are positive; no multiplication by an unknown-sign denominator is used.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/real-schur-series`; `mathlib:Complex.norm_deriv_le_one_of_mapsTo_ball`; `mathlib:Complex.norm_dslope_le_div_of_mapsTo_ball`; `mathlib:Complex.eqOn_of_isPreconnected_of_isMaxOn_norm`; `tauceti:TauCeti.norm_deriv_div_one_sub_norm_sq_le`; `tauceti:TauCeti.mapsTo_ball_unitDiscMoebiusFormula_of_norm_lt_one`.

Sources: [C. J. Smyth, §2 lemma (1)–(2), pp. 170–171][smyth-1971]. The lemma bounds every positive coefficient and relates the kth and doubled-index coefficients. The Schur-transform proof here also applies without a boundary extension.

<a id="schur-parseval-contract"></a>

### Finite Parseval inequalities for Schur coefficients

`ClassicalArithmeticCompletion:CA.6/schur-parseval-contract` · theorem.

Let e be a real Schur series, p a finitely supported complex sequence, and N∈ℕ. Then Σ_(m=0)^N |Σ_(j=0)^m p_j e_(m−j)|² ≤ Σ_j |p_j|². In particular any selected finite set of output coefficients gives a lower bound for the squared norm of the input polynomial.

Hypotheses and conventions: The input sum on the right is finite. The output is a finite initial truncation or any finite subset.

Proof or construction:

1. On the circle of radius r<1 the holomorphic product f(z)Σ p_j z^j is continuous and square integrable. Identify its Fourier coefficients from its absolutely convergent Taylor expansion.
2. Apply the pinned Parseval identity with period 2π and bound |f|≤1. The output terms carry r^(2m), while the input terms carry r^(2j).
3. Let r tend to 1 from below in the finite output and finite input sums. Nonnegative omitted terms justify replacing the full output sum by the chosen finite subset.

Further acceptance checks:

- For f=z^k the complete output norm equals the input norm; the 2π normalization must cancel.
- The estimate does not assert a boundary value of an arbitrary Schur witness.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/real-schur-series`; `mathlib:hasSum_sq_fourierCoeffOn`; `mathlib:DifferentiableOn.hasFPowerSeriesOnBall`.

Sources: [C. J. Smyth, §2 proof, pp. 170–171 and §4, pp. 172–174][smyth-1971]. Parseval after multiplication by two- and three-term polynomials is the analytic mechanism for the coefficient inequalities.

<a id="smyth-schur-reduction"></a>

### The first two nonzero integral quotient coefficients

`ClassicalArithmeticCompletion:CA.6/smyth-schur-reduction` · lemma.

Let f,g have real Schur coefficient sequences u,v with u_0=v_0=c, 3/4≤c<1, and F∈ℤ⟦z⟧ satisfy F_0=1 and Fg=f. Suppose F is not a polynomial. Let 0<k<l be its first two nonzero positive indices, with coefficients a_k,a_l. Then |a_k|=|a_l|=1, |u_k|+|v_k|=c, and c/2≤1−c². Coefficient coupling gives u_k−v_k=a_k c, u_(k+i)−v_(k+i)=a_k v_i for 0<i<l−k, and u_l−v_l=a_k v_(l−k)+a_l c.

Hypotheses and conventions: F non-polynomial ensures two positive nonzero coefficients exist; it is stronger than merely nonconstant. All equalities are formal coefficient equalities and require no division at a zero of g.

Proof or construction:

1. Choose the first two nonzero indices using well-ordering and the non-polynomial hypothesis; apply the pinned finite coefficient convolution to Fg=f.
2. The Schur coefficient bound gives |a_k|c≤2(1−c²). Since c≥3/4, the integer |a_k| cannot be ≥2.
3. Because 1−c²<c, u_k and v_k have opposite signs, giving the absolute-value sum. At index l, |a_l|c≤3(1−c²)<2c, which rules out |a_l|≥2.
4. The larger of |u_k| and |v_k| is at least c/2, giving the weak quadratic condition.

Further acceptance checks:

- The k<l<2k branch gives u_(l−k)=v_(l−k); the long-gap branch uses the doubled-index coupling instead.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/schur-coefficient-conditions`; `mathlib:PowerSeries.coeff_mul`.

Sources: [C. J. Smyth, §3, (3)–(5), p. 172][smyth-1971]. The integer quotient coefficients and the Schur bounds force the two first nonzero coefficients to be signs and the kth coefficients to have opposite signs.

<a id="smyth-long-gap-condition"></a>

### The cubic condition in Smyth’s long-gap case

`ClassicalArithmeticCompletion:CA.6/smyth-long-gap-condition` · lemma.

Under the preceding Schur-pair assumptions, except that F need not be non-polynomial, write F=Σa_m z^m, let k be the first positive index with a_k≠0, and suppose |a_k|=1 and a_m=0 for every m with k<m≤2k. Then c³+c²≤1. If the second nonzero index equals 2k, replacing F by F⁻¹ and interchanging the Schur pair produces the same case after ruling out a coefficient of magnitude 2.

Hypotheses and conventions: 3/4≤c<1; |a_k|=1 at the first nonzero positive index k; a_m=0 for k<m≤2k. The computation uses no coefficient beyond index 2k, so it also applies to the inverse series F⁻¹ in the swap, which may be a polynomial.

Proof or construction:

1. Put S=1−c². For a_k=1 write x=u_k≥0 and v_k=x−c≤0; then c−S≤x≤S and u_(2k)−v_(2k)=x−c.
2. The lower Schur bound for u_(2k) and upper bound for v_(2k) give J(x)=x²/(1+c)+(c−x)²/(1−c)+(c−x)≤2S. For a_k=−1 the same expression follows by replacing the positive-coefficient variable by its complementary value c−x.
3. J is decreasing on [c−S,S]: its derivative has numerator at most 3−5c²−2c<0 for c≥3/4. Thus J(S)≤2S. The identity J(S)−2S=(c³+c²−1)/(1−c) proves the conclusion.
4. When l=2k, the inverse quotient has coefficient a_k²−a_(2k)=1−a_(2k). The value 2 contradicts the reduction bound at its second nonzero coefficient; the value 0 gives the normalized long-gap case. Do not swap a second time just to set a_k=1, since this would restore a_(2k)=1.

Further acceptance checks:

- The exact endpoint identity uses 1−c>0.
- The sign a_k=−1 is included; normalizing l>2k and then swapping again would invalidate the normalization.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/smyth-schur-reduction`; `ClassicalArithmeticCompletion:CA.6/schur-coefficient-conditions`; `mathlib:PowerSeries.coeff_mul`.

Sources: [C. J. Smyth, §5, (6)–(7) and the final minimization, pp. 174–175][smyth-1971]. The doubled-index coefficient restrictions give the cubic condition after a one-variable minimization.

<a id="smyth-short-gap-condition"></a>

### The quartic condition in Smyth’s short-gap case

`ClassicalArithmeticCompletion:CA.6/smyth-short-gap-condition` · lemma.

Let f,g be the bounded real-coefficient products in the Schur reduction. Assume 3/4≤c<(√17−1)/4 and k<l<2k. Then 40c⁴−93c²+40≥0. Consequently c³+c²<1 on this interval, equivalently c⁻¹>θ₀.

Hypotheses and conventions: The strict upper endpoint is the reciprocal of (1+√17)/4. Its arithmetic justification is supplied separately. This node records the exact source-supported target; its weighted three-term multiplier verification is named in gaps.

Proof or construction:

1. Interchange the quotient and pair to set a_k=1; because l<2k the second coefficient remains a sign and its index remains l.
2. Apply the finite Parseval contract to the two three-term multipliers in Smyth §4. Use u_(l−k)=v_(l−k), the couplings at k and l, and x=−a_l u_(l−k). The precise multiplier and selected-coefficient inequality must be checked from the displayed equations, not inferred from OCR.
3. Eliminate the two multiplier parameters by completing squares; minimize the resulting positive quadratic in x. The final necessary condition is 40c⁴−93c²+40≥0 (Smyth p. 173).
4. For A=c⁻¹∈((1+√17)/4,4/3], this is A⁴−(93/40)A²+1≥0. That polynomial is increasing on this interval and at θ₀ equals θ₀²(θ₀−53/40)<0. The last strict sign follows by evaluating T³−T−1 at 53/40, rather than using a decimal approximation.

Further acceptance checks:

- At c=θ₀⁻¹ the quartic is negative; at c=3/4 it is positive. Both are useful signs for the elimination.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/smyth-schur-reduction`; `ClassicalArithmeticCompletion:CA.6/schur-parseval-contract`; `ClassicalArithmeticCompletion:CA.6/plastic-number`.

Sources: [C. J. Smyth, §4, pp. 172–174, final quartic condition on p. 173][smyth-1971]. The first gap smaller than k forces the stated quartic condition, which excludes the plastic threshold. Intermediate displayed multiplier formulas are not legible in the obtained extraction.

<a id="monic-mahler-integrality"></a>

### Integrality of the Mahler measure of a monic integer polynomial

`ClassicalArithmeticCompletion:CA.6/monic-mahler-integrality` · lemma.

For a monic P∈ℤ[X], M(P), regarded as a real algebraic number, is integral over ℤ. In the Schur reduction for an irreducible nonreciprocal P with M(P)≤4/3, the weak bound M(P)≥(1+√17)/4 is therefore strict.

Hypotheses and conventions: P monic. The strict-bound consequence also assumes the preceding Schur reduction.

Proof or construction:

1. Every complex root α is integral, as is its complex conjugate because P has real coefficients. Thus |α|²=α·conj(α) is integral; integrality of a positive power implies integrality of |α| in ℂ. Reflect integrality along the injective map ℝ→ℂ (isIntegral_algebraMap_iff).
2. The root-product formula expresses M(P) as a finite product of 1 and |α|, hence as an integral element.
3. The quadratic number (1+√17)/4 has irreducible primitive polynomial 2T²−T−2 and field trace 1/2; it is not integral. Use this exclusion after the weak coefficient bound.

Further acceptance checks:

- The claim is for monic integer P; it is not asserted for arbitrary complex polynomials.

Direct prerequisites: `mathlib:roots_mem_integralClosure`; `mathlib:IsIntegral.mul`; `mathlib:IsIntegral.of_pow`; `mathlib:IsIntegral.multiset_prod`; `mathlib:isIntegral_algebraMap_iff`; `mathlib:Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots`; `ClassicalArithmeticCompletion:CA.6/smyth-schur-reduction`.

Sources: [C. J. Smyth, §3, p. 172, strictness after the first quadratic bound][smyth-1971]. The first bound is strict because a Mahler measure is integral but the quadratic endpoint is not.

<a id="smyth-analytic-input"></a>

### The analytic input for Smyth’s theorem

`ClassicalArithmeticCompletion:CA.6/smyth-analytic-input` · application.

Let P∈ℤ[X] be monic irreducible, P(0)=±1, P.reverse≠±P, and M(P)≤4/3. Then M(P)³−M(P)−1≥0. This supplies the missing analytic dependency of CA.6/smyth-nonreciprocal-lower-bound; the parent’s reductions for non-units and the plastic-number certificate remain its arithmetic dependencies.

Hypotheses and conventions: Positive degree, irreducibility and nonreciprocity exclude unit-circle roots: conjugation followed by inversion would otherwise make P reciprocal.

Proof or construction:

1. Use the bounded factorization and the integral quotient from the parent. Their common positive constant c=M(P)⁻¹ lies in [3/4,1); if c=1, the positive Schur coefficients vanish and F is constant.
2. The first-coefficient reduction and monic Mahler integrality give c<(√17−1)/4.
3. For k<l<2k use the short-gap quartic condition and its strict comparison with θ₀. For l≥2k use the inverse-series normalization and the long-gap cubic condition.
4. Translate c³+c²≤1 into M(P)³−M(P)−1≥0. The increasing cubic on [1,∞) gives the parent’s sharp bound. No equality classification or isolated-spectrum theorem is added.

Further acceptance checks:

- The reciprocal polynomial X²−3X+1 is excluded even though its factorization exists.
- The target inherits the precise short-gap verification gap; it is not marked closed.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/smyth-bounded-factorization`; `ClassicalArithmeticCompletion:CA.6/smyth-schur-reduction`; `ClassicalArithmeticCompletion:CA.6/monic-mahler-integrality`; `ClassicalArithmeticCompletion:CA.6/smyth-short-gap-condition`; `ClassicalArithmeticCompletion:CA.6/smyth-long-gap-condition`; `ClassicalArithmeticCompletion:CA.6/reciprocal-iff-reverse`; `ClassicalArithmeticCompletion:CA.6/plastic-number`.

Sources: [C. J. Smyth, Main theorem, p. 169; §§3–5, pp. 171–175][smyth-1971]. The integral quotient and the two coefficient cases produce the nonreciprocal lower bound. [C. J. Smyth, §5.1, (15), published p. 328, and the outline on pp. 328–329][smyth-survey-2008]. States the bound M(α)≥θ₀ for nonreciprocal algebraic integers and outlines its proof through the bounded quotient f/g and Schur’s conditions.

## Transfinite diameter and monic approximation

<a id="finite-fekete-diameter"></a>

### Finite Fekete diameters and transfinite diameter

`ClassicalArithmeticCompletion:CA.6/finite-fekete-diameter` · definition.

For a compact K⊆ℂ and n≥2, δ_n(K)=sup_(z∈K^n) (∏_(0≤i<j<n)|z_i−z_j|)^(2/(n(n−1))). Set δ_n(∅)=0, δ_0=δ_1=0. Define d(K)=inf_(n≥2) δ_n(K). This d is the transfinite diameter, with the usual length normalization for logarithmic capacity. Only compact sets receive mathematical assertions.

Hypotheses and conventions: K compact for the API. The total real-valued formula on other sets has no specified meaning. Repeated tuple entries are permitted; a collision gives product zero. The infimum excludes indices 0 and 1.

Uses: Dimitrov Theorem 3, pp. 12–13: Measures the hedgehog containing the finite branch points. Dimitrov Theorem 4, pp. 13–14: Bounds the n²-growth of Hankel determinants. LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1: Supplies the diameter carrier and its normalization to LP’s comparison with energy capacity; LP is outside the tier order, so it should import this node (see restructure).

Planning API:

- `feketeDiameter_nonneg` (relation): δ_n(K)≥0 and d(K)≥0 for compact K.
- `feketeDiameter_attained` (projection): For nonempty compact K and n≥2, a tuple in K^n attains δ_n(K).
- `feketeDiameter_mono` (functoriality): Compact K⊆L implies δ_n(K)≤δ_n(L) and d(K)≤d(L).
- `transfiniteDiameter_affine` (functoriality): d(aK+b)=|a|d(K), including a=0; δ_n has the same rule for n≥2.
- `transfiniteDiameter_finite` (simp): A finite set has d=0; δ_n=0 once n exceeds its cardinality.
- `finiteFeketeDiameter_two` (compatibility): For nonempty compact K, the two-point Fekete diameter δ₂(K) equals the metric diameter of K; the limiting diameter is identified with the Chebyshev limit by the key theorem below.

Checks:

- `fekete_two_points` (computation): For K={0,2}, δ_2=2, δ_3=0, and d=0.
- `fekete_singleton` (degenerate): For K={7}, every δ_n with n≥2 and d are zero.
- `fekete_disc_scale` (compatibility): For the closed radius-2 disc, δ_2=4 and d=2.
- `fekete_segment_normalization` (computation): d([−1,1])=1/2 and d([0,1])=1/4, rather than the ordinary segment diameter.

Proof or construction:

1. For nonempty K, continuity on compact K^n gives a maximizing Fekete tuple and a finite nonnegative supremum. Define the empty-set values explicitly.
2. Use the nonnegative real power with exponent 2/(n(n−1)). The monotonicity and limit are separate theorem targets, rather than assumptions in the definition.

Further acceptance checks:

- δ_2 is the ordinary diameter, while d is typically smaller.

Direct prerequisites: `mathlib:IsCompact.exists_isMaxOn`.

Sources: [Françoise Bertrandias, §1.1, p. 1; 1.4.1–1.4.4, p. 2][bertrandias-1964]. The pairwise-distance supremum defines the finite diameter; its limit is monotone under inclusion and scales like length. [E. B. Saff, (1.1), p. 167; Lemma 1.1, p. 168; (1.4) and the remarks after it, p. 169; Theorem 1.9, (1.14), p. 172][saff-2010]. δ_n is the maximum of the normalized pairwise-distance product; Lemma 1.1 makes it nonincreasing, its limit is the transfinite diameter (monotone under inclusion, scaling like length, zero on finite sets), and Theorem 1.9 identifies that limit with logarithmic capacity.

<a id="chebyshev-monic-norm"></a>

### Monic Chebyshev norms on a compact set

`ClassicalArithmeticCompletion:CA.6/chebyshev-monic-norm` · definition.

For compact K⊆ℂ, let ‖p‖_K=sup_(z∈K)|p(z)|, with empty-set value 0. For n∈ℕ let t_n(K)=inf{‖p‖_K : p∈ℂ[X], p monic of degree n}. For nonempty K, t_0(K)=1. For n≥1, set T_n(K)=t_n(K)^(1/n). Minimizers need not be chosen canonically or claimed unique.

Hypotheses and conventions: K compact; degree means natDegree together with monicity.

Uses: Bertrandias 1.4.6, p. 2 and §2.6, pp. 10–12: Finds a lemniscate enclosure and a monic polynomial basis of exponentially bounded norm on it (in §2.6 for the non-archimedean analogue). CA.6/monic-preimage-diameter: Controls both directions of the inverse-image diameter formula.

Planning API:

- `compactPolynomialNorm_eval_le` (projection): For z∈K, |p(z)|≤‖p‖_K.
- `compactPolynomialNorm_mul_le` (structure): ‖pq‖_K≤‖p‖_K‖q‖_K.
- `chebyshevNorm_attained` (constructor): For compact K and every n, some monic degree-n polynomial attains t_n(K).
- `chebyshevNorm_submultiplicative` (relation): t_(n+m)(K)≤t_n(K)t_m(K).
- `chebyshevNorm_mono` (functoriality): K⊆L implies t_n(K)≤t_n(L).
- `chebyshevNorm_affine` (functoriality): For a≠0, t_n(aK+b)=|a|^n t_n(K).
- `compactPolynomialNorm_eq_continuousMap_norm` (compatibility): For compact K, the evaluation restriction z↦p(z) is a ContinuousMap K ℂ, and ‖p‖_K equals its existing continuous-map norm, including empty K. No second general function sup norm is planned.

Checks:

- `chebyshev_singleton` (degenerate): t_0({0})=1, whereas t_n({0})=0 for every n≥1.
- `chebyshev_disc` (computation): For a radius-R closed disc with R>0, t_n=R^n.
- `chebyshev_segment` (computation): For [−1,1], t_1=1 and t_2=1/2, attained by X and X²−1/2.
- `compactNorm_constant` (compatibility): For nonempty compact K and constant p=c, both ‖p‖_K and the existing continuous-map norm of its restriction equal |c|; on ∅ both are 0.

Proof or construction:

1. Bound the evaluation norm by compactness. The class of monic degree-n polynomials is nonempty, so its nonnegative norm infimum is finite.
2. For existence of a minimizer, if K has at most n points use its annihilating polynomial with a monic padding factor. Otherwise evaluation at n+1 distinct points bounds the coefficients of a norm-bounded minimizing sequence by Vandermonde inversion; take a convergent subsequence.

Further acceptance checks:

- At degree zero the monic polynomial is 1, so its norm on nonempty K is 1 even if K is a singleton.

Direct prerequisites: `mathlib:IsCompact.exists_isMaxOn`; `mathlib:Matrix.det`; `mathlib:ContinuousMap.norm_eq_iSup_norm`.

Sources: [Françoise Bertrandias, §1.2–1.3, pp. 1–2][bertrandias-1964]. The monic minimax norm supplies the same limiting constant as the finite-diameter construction. [E. B. Saff, polynomial extremal problem, t_n(E) and (1.18), p. 175; Theorem 1.18, pp. 176–178][saff-2010]. Monic minimax norms t_n(E), their submultiplicativity and the limit of t_n^(1/n) as an infimum; Theorem 1.18 relates them to Fekete points. Saff assumes E infinite for the uniqueness of the minimizer, which this node does not claim.

<a id="fekete-chebyshev-limit"></a>

### Fekete–Chebyshev equality and elementary diameter values

`ClassicalArithmeticCompletion:CA.6/fekete-chebyshev-limit` · theorem.

For nonempty compact K, δ_n(K) decreases for n≥2 and tends to d(K). Also T_n(K) tends to d(K), and d(K)=inf_(n≥1) T_n(K). For R≥0, d(closedBall(b,R))=R. For a,b∈ℂ, d([a,b])=|b−a|/4. Finite sets have d=0.

Hypotheses and conventions: K compact and nonempty for the convergence assertions; the empty-set convention is handled separately.

Proof or construction:

1. Delete each point in a maximizing tuple and multiply the resulting pair-product inequalities to prove δ_(n+1)≤δ_n.
2. Use submultiplicativity of t_n and the elementary subadditive limit argument (including a zero t_n) to identify the nth-root limit with its infimum.
3. Removing one point of a Fekete tuple provides a monic degree-n polynomial with norm at most δ_(n+1)^n. Conversely replace the monomials in a Vandermonde determinant by monic Chebyshev polynomials and use its permutation sum: δ_(n+1)^(n(n+1)/2)≤(n+1)!∏_(j=1)^n t_j. Taking logarithms and Cesàro means gives the reverse limit comparison; the zero-capacity case follows by approximation.
4. The circle gives t_n=R^n by the Cauchy coefficient bound and X^n. On [−1,1], the classical real Chebyshev polynomial has leading coefficient 2^(n−1) and alternating extrema; real parts rule out a better complex monic polynomial, and the pinned extremal bound leadingCoeff_le_of_forall_abs_le_one gives the real lower bound directly. Thus t_n=2^(1−n), and affine transport gives the segment value.

Further acceptance checks:

- The exponent uses unordered pairs: counting ordered pairs without changing the exponent gives the wrong scaling.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/finite-fekete-diameter`; `ClassicalArithmeticCompletion:CA.6/chebyshev-monic-norm`; `mathlib:Matrix.det_apply`; `mathlib:DifferentiableOn.hasFPowerSeriesOnBall`; `mathlib:Polynomial.Chebyshev.leadingCoeff_T`; `mathlib:Polynomial.Chebyshev.T_real_cos`; `mathlib:Polynomial.Chebyshev.leadingCoeff_le_of_forall_abs_le_one`.

Sources: [E. B. Saff, Lemma 1.1, p. 168; Theorem 1.9, p. 172; (1.18), p. 175; Theorem 1.18(a) and proof, pp. 176–178; Examples 1.10–1.11, pp. 173–174][saff-2010]. The Fekete limit and monic minimax limit coincide, with disc and interval normalizations. [Françoise Bertrandias, 1.3, p. 2; 1.5.1–1.5.2, p. 3][bertrandias-1964]. The two definitions give the same constant (1.3); it is 1 for the closed unit disc of ℂ and 1/2 for [−1,1], the unit disc of ℝ (1.5.1–1.5.2). The general disc and segment values follow by 1.4.2 and translation.

<a id="monic-preimage-diameter"></a>

### Transfinite diameter under a monic polynomial inverse image

`ClassicalArithmeticCompletion:CA.6/monic-preimage-diameter` · theorem.

If K⊆ℂ is nonempty compact and P∈ℂ[X] is monic of degree m≥1, then P⁻¹(K) is nonempty compact and d(P⁻¹(K))=d(K)^(1/m). In particular d({z: |P(z)|≤r^m})=r for r≥0.

Hypotheses and conventions: P monic and m≥1; inverse image means P(z)∈K, an existential membership condition.

Proof or construction:

1. A positive-degree polynomial is proper and surjective on ℂ, so its inverse image is compact and nonempty.
2. Pull back a monic degree-n Chebyshev polynomial on K to obtain t_(mn)(P⁻¹K)≤t_n(K).
3. For a monic degree-j Q on P⁻¹K, form its polynomial norm N_Q(y)=∏_(P(z)=y)Q(z), with root multiplicities. The resultant construction (resultant_eq_prod_eval, applied to P−y, which splits over ℂ) gives a monic polynomial in y of degree j after its harmless sign normalization, and |N_Q(y)|≤‖Q‖_(P⁻¹K)^m. Hence t_j(K)≤t_j(P⁻¹K)^m.
4. Apply the Fekete–Chebyshev limit to both inequalities. This proof uses a determinant norm, rather than assuming an unplanned equilibrium measure.

Further acceptance checks:

- For P=X^m and K=[0,R^m], the regular m-spike hedgehog has d=R·4^(−1/m).
- For P=X² and K={1}, the inverse image is {−1,1} with d=0; finite Fekete diameter δ_2 need not be zero.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/fekete-chebyshev-limit`; `mathlib:Polynomial.resultant`; `mathlib:Polynomial.resultant_eq_prod_eval`; `mathlib:Matrix.det_apply`.

Sources: [Françoise Bertrandias, 1.4.5 and its Application, p. 2][bertrandias-1964]. The monic degree-m inverse-image law raises the diameter to the power 1/m; the set-membership quantifier is corrected in sourceIssues. [E. B. Saff, exercise after Theorem 1.18, p. 178][saff-2010]. The lemniscate case: a set {|P|≤Rⁿ} with P monic of degree n has capacity R.

<a id="lemniscate-enclosure"></a>

### A regular lemniscate enclosing a compact set

`ClassicalArithmeticCompletion:CA.6/lemniscate-enclosure` · construction.

Given nonempty compact K⊆ℂ and r>d(K), there exist m≥1, a monic degree-m P, and ρ with d(K)<ρ<r such that ‖P‖_K<ρ^m and L={z:|P(z)|≤ρ^m} contains K in its interior. The level ρ^m avoids the absolute values of the nonzero critical values of P; ∂L is a finite union of smooth analytic closed curves, positively oriented with total winding number 1 about every point of L°. Also d(L)=ρ<r. For every j≥0 there is a monic degree-j Q_j and a constant C independent of j such that ‖Q_j‖_L≤Cρ^j.

Hypotheses and conventions: r>d(K)≥0 implies r>0. No positive-capacity assumption on K is imposed. The enclosure is not asserted to lie in an arbitrarily small Euclidean neighbourhood of K; holes may be filled.

Uses: CA.6/hankel-analytic-growth: Produces a contour and monic basis with a uniform exponential entry bound.

Planning API:

- `lemniscateEnclosure_subset_interior` (projection): K⊆L° follows from the strict polynomial-norm inequality.
- `lemniscateEnclosure_diameter` (relation): d(L)=ρ<r.
- `lemniscateEnclosure_boundary` (structure): The chosen regular boundary is a finite analytic cycle enclosing every point of K with index 1.
- `lemniscateEnclosure_monic_basis` (constructor): Q_(qm+s)=P^q X^s is monic of degree qm+s and obeys the common exponential bound.
- `lemniscateEnclosure_contour_bound` (projection): For continuous G on ∂L there is B with |(2πi)⁻¹∮_(∂L)GQ_iQ_j dz|≤Bρ^(i+j).

Checks:

- `lemniscate_zero_capacity` (degenerate): For K={0}, P=X and ρ>0 give d(L)=ρ; no multiplicative bound (1+ε)d(K) can describe this enclosure.
- `lemniscate_two_spikes` (computation): P=X² and ρ=1 give L=closedBall(0,1), d(L)=1 and Q_j=X^j.
- `lemniscate_strict_level` (non-example): For K=closedBall(0,1), P=X and ρ=1, K is not contained in L°; the strict norm hypothesis is necessary.

Proof or construction:

1. Choose a degree m with t_m(K)^(1/m)<r and a monic P attaining that norm. Choose ρ strictly between its norm root and r, and above d(K), avoiding finitely many critical-value radii.
2. Properness and regularity of the polynomial level set give the compact enclosure, the strict interior inclusion and its finite analytic boundary. Apply the monic inverse-image formula to the radius-ρ^m disc.
3. For j=qm+s, 0≤s<m, use Q_j=P^q X^s. On L its norm is at most ρ^(mq) max_(z∈L)|z|^s; take C=max_(0≤s<m) max(1,max_(z∈L)|z|^s ρ^(−s)).

Further acceptance checks:

- For K={0} and r>0, choose P=X and 0<ρ<r: a positive-capacity enclosure is needed even though d(K)=0.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/chebyshev-monic-norm`; `ClassicalArithmeticCompletion:CA.6/fekete-chebyshev-limit`; `ClassicalArithmeticCompletion:CA.6/monic-preimage-diameter`.

Sources: [Françoise Bertrandias, 1.4.6, p. 2; §2.6, pp. 10–12][bertrandias-1964]. 1.4.6 encloses a bounded set in a polynomial lemniscate of nearly the same diameter (its multiplicative form fails for diameter zero; see sourceIssues), and §2.6 uses such an enclosure and its Chebyshev polynomials in the non-archimedean determinant estimate. The additive formulation here includes capacity-zero sets. [Vesselin Dimitrov, §4, proof of Theorem 4, pp. 13–14][dimitrov-2019]. Chebyshev polynomials on a boundary enclosing the singularity set provide the n²-growth estimate. [E. B. Saff, exercises after Theorem 1.18, p. 178][saff-2010]. Every compact set lies in a lemniscate of capacity below its own capacity plus ε, which is the additive form used here.

## Radial slits and Dubinin’s inequality

<a id="radial-hedgehog"></a>

### A finite radial hedgehog

`ClassicalArithmeticCompletion:CA.6/radial-hedgehog` · definition.

For a finite index type I and endpoints a_i∈ℂ, K(a)=⋃_(i∈I)[0,a_i], where [0,a_i]={t a_i: t∈[0,1]⊆ℝ}. The empty family gives ∅; a nonempty family of zero endpoints gives {0}. Define R(a)=max_i |a_i|, with empty-family value 0. Multiplicity and repeated directions are allowed in the data.

Hypotheses and conventions: The line segment is a real affine segment in ℂ, not an order interval of complex numbers.

Uses: Dimitrov §4, pp. 14–15: Contains the branch points α_i² and α_i⁴ of the normalized square root. CA.6/dubinin-hedgehog-bound: Allows repeated or zero endpoints to be removed and longer radial segments to be compared.

Planning API:

- `radialHedgehog_mem` (characterisation): z∈K(a) iff some endpoint index i and t∈[0,1] satisfy z=t a_i.
- `radialHedgehog_compact` (structure): Every finite radial hedgehog is compact.
- `radialHedgehog_zero_mem` (simp): For a nonempty index type, 0∈K(a).
- `radialHedgehog_norm_le` (projection): For z∈K(a), |z|≤R(a).
- `radialHedgehog_mono_lengths` (functoriality): Replacing endpoints by longer endpoints on the same rays enlarges the hedgehog.
- `radialHedgehog_affine_scale` (functoriality): For c∈ℂ, K(ca)=cK(a) and R(ca)=|c|R(a).
- `radialHedgehog_complement` (structure): For a nonempty family the plane complement is connected; its sphere complement is simply connected, and the inverted domain contains 0.
- `radialHedgehog_eq_iUnion_segment` (compatibility): K(a)=⋃_i segment ℝ 0 (a_i), with Mathlib’s real affine segment in ℂ.

Checks:

- `hedgehog_empty` (degenerate): An empty family gives K=∅, R=0; one zero endpoint gives K={0}.
- `hedgehog_one` (computation): The endpoint 4 gives [0,4], whose transfinite diameter is 1.
- `hedgehog_opposite` (computation): Endpoints 1 and −1 give [−1,1], whose diameter is 1/2.
- `hedgehog_duplicate` (compatibility): Endpoints 1,1 give the same set as Mathlib segment ℝ 0 1, namely [0,1]; multiplicity does not give the regular two-spike set.

Proof or construction:

1. Take the finite union of images of the compact real interval [0,1]. Compactness and the endpoint norm bound follow immediately.
2. For a nonempty family the set is star-shaped at 0. Its complement in the Riemann sphere is simply connected; its complement in ℂ is connected but is generally not simply connected. If some endpoint is nonzero, inversion turns the sphere domain into a proper simply connected plane domain containing 0; for K={0} the inverted domain is all of ℂ.

Further acceptance checks:

- Distinguish an empty index type from the singleton set {0}; the exterior inversion requires a hedgehog with a nonzero endpoint, since {0} inverts to the whole plane.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/finite-fekete-diameter`; `mathlib:StarConvex.contractibleSpace`; `mathlib:ContinuousMap.HomotopyEquiv.simplyConnectedSpace`; `mathlib:segment_eq_image`.

Sources: [Vesselin Dimitrov, §3, definition before Theorem 3, p. 12][dimitrov-2019]. The singularities are enclosed in a finite union of radial segments.

<a id="normalized-conformal-radius"></a>

### Conformal radius using the existing normalized map

`ClassicalArithmeticCompletion:CA.6/normalized-conformal-radius` · definition.

For a proper simply connected open Ω⊆ℂ and p∈Ω, take any existing TauCeti.IsNormalizedRiemannMapOn φ Ω p and define cr(Ω,p)=1/|φ′(p)|>0. The pinned existence and on-domain uniqueness theorems make this independent of φ. Outside the eligible pointed-domain class use value 0. No second normalized-map predicate or Riemann-map construction is introduced.

Hypotheses and conventions: Ω is nonempty, open, simply connected and proper; p is a specified point of Ω. Derivative positivity means its imaginary part is zero and its real part is strictly positive.

Uses: Dubinin §1, pp. 270–271: Turns the condenser inequality into a comparison of normalized slit-map derivatives. CA.6/diameter-exterior-radius: Relates the capacity of a hedgehog to the radius of its inverted complement.

Planning API:

- `conformalRadius_pos` (projection): cr(Ω,p)>0 on an eligible pointed domain.
- `conformalRadius_independent` (compatibility): The reciprocal derivative norm is independent of the existing normalized-map witness, by the pinned IsNormalizedRiemannMapOn.eqOn theorem.
- `conformalRadius_deriv` (compatibility): cr(Ω,p)=1/|φ′(p)| for any biholomorphism φ with φ(p)=0, even before fixing its phase.
- `conformalRadius_mono` (functoriality): If Ω⊆Ω′ are eligible domains containing p, cr(Ω,p)≤cr(Ω′,p).
- `conformalRadius_affine` (functoriality): cr(aΩ+b,ap+b)=|a|cr(Ω,p) for a≠0.
- `conformalRadius_exhaustion` (relation): If Ω_j increase to Ω and all are eligible with p∈Ω_j, then cr(Ω_j,p)→cr(Ω,p). This follows by placing the inverse image of every closed radius-q disc, q<1, inside one Ω_j.

Checks:

- `conformalRadius_disc` (computation): cr(ball(b,R),b)=R for R>0, using (z−b)/R.
- `conformalRadius_halfplane` (computation): For Re z>0 at p=1, cr=2, using (z−1)/(z+1).
- `conformalRadius_slitplane` (computation): For ℂ∖(−∞,0] at p=1, cr=4, using (√z−1)/(√z+1) with the principal square root.
- `conformalRadius_wrong_point` (non-example): On the unit disc, cr at p is 1−|p|²; it is not identically 1 for all base points.

Proof or construction:

1. Use the pinned exists_isNormalizedRiemannMapOn; its derivative is a positive real number. On-domain uniqueness from IsNormalizedRiemannMapOn.eqOn implies equality of derivatives at p and hence equality of the reciprocal moduli.
2. For Ω⊆Ω′ with normalized maps φ on Ω and ψ on Ω′ at p, the composition ψ∘φ⁻¹ is a holomorphic self-map of the unit disc fixing 0; the inverse is holomorphic by DifferentiableOn.invFunOn. Its derivative at 0 is ψ′(p)/φ′(p), so Schwarz’s derivative bound at 0 gives |ψ′(p)|≤|φ′(p)|, that is, cr(Ω,p)≤cr(Ω′,p).
3. The affine coordinate change z↦az+b gives cr(aΩ+b,ap+b)=|a|cr(Ω,p) for a≠0. For an increasing open exhaustion, the inverse image of a closed radius-q disc is compact; it lies in one exhausting domain and gives the lower bound q·cr(Ω,p).

Further acceptance checks:

- Normalization is at the specified base point; an arbitrary Riemann map derivative does not define a conformal radius.

Direct prerequisites: `tauceti:TauCeti.IsNormalizedRiemannMapOn`; `tauceti:TauCeti.exists_isNormalizedRiemannMapOn`; `tauceti:TauCeti.IsNormalizedRiemannMapOn.eqOn`; `mathlib:Complex.norm_deriv_le_one_of_mapsTo_ball`; `tauceti:DifferentiableOn.invFunOn`.

Sources: [V. N. Dubinin, §1, corollary and normalized slit maps, pp. 270–271][dubinin-1985]. The slit-domain comparison is expressed through the derivative of a disc map normalized at zero. [E. B. Saff, §3, Theorem 3.5, p. 185][saff-2010]. Exterior logarithmic capacity is determined by the derivative normalization of a conformal map at infinity.

<a id="slit-dirichlet-capacity"></a>

### Dirichlet capacity for radial slit condensers

`ClassicalArithmeticCompletion:CA.6/slit-dirichlet-capacity` · definition.

For closed disjoint plates E₀,E₁⊆ℂ, with E₁ compact, positive separation, and G=ℂ∖(E₀∪E₁) bounded with finitely many analytic boundary arcs, define Cap_D(E₀,E₁)=inf_u ∫_G |∇u|² dA. Admissible u are continuous on ℂ, take values in [0,1], equal 0 on E₀ and 1 on E₁, are locally Lipschitz on G and C¹ off finitely many piecewise C¹ cuts, and have finite energy. The energy is the nonnegative extended integral of the squared real derivative norm; the infimum of an empty admissible class is +∞. The norm of the real Fréchet derivative ℂ→ℝ equals the Euclidean gradient norm.

Hypotheses and conventions: This part uses E₀=ℂ∖D, E₁=closedBall(0,ε), where D is a disc with finitely many radial slits and 0<ε below the slit tips. The area measure is Lebesgue measure on ℝ² transported by ℂ≃ℝ². No factor 1/(2π) is inserted. Local Lipschitz regularity is imposed only in G, so gradients can be unbounded near slit endpoints on a plate.

Uses: Dubinin Theorem 1, pp. 269–270: The rotated test function proves the slit-domain capacity inequality without solving a PDE. CA.6/slit-radius-asymptotic: Reads the conformal radius from a shrinking-inner-disc condenser.

Planning API:

- `dirichletCapacity_nonneg` (relation): Cap_D takes values in ℝ≥0∞.
- `dirichletCapacity_test_le` (projection): Every admissible u gives Cap_D≤energy(u).
- `dirichletCapacity_mono_plate` (functoriality): Enlarging either plate, while keeping plates separated and the geometry eligible, can only increase Cap_D.
- `dirichletCapacity_conformal` (functoriality): A biholomorphism of condenser domains that continuously carries the corresponding plates preserves Cap_D under pullback.
- `dirichletCapacity_dihedral_average` (structure): A finite rotational/reflection group preserving the plates can average an admissible function without increasing its energy; the infimum over invariant functions equals the full infimum.

Checks:

- `dirichletCapacity_annulus` (computation): E₀={|z|≥2}, E₁={|z|≤1} give Cap_D=2π/log 2.
- `dirichletCapacity_scale` (compatibility): Scaling both annulus radii by 3 leaves Cap_D unchanged.
- `dirichletCapacity_separation` (non-example): The plates {|z|≥1} and {|z|≤1} are not eligible: they meet on the circle.
- `dirichletCapacity_thin_annulus` (computation): For fixed r>0, Cap_D tends to +∞ as R decreases to r; the reciprocal-log direction is essential.

Proof or construction:

1. Use an infimum in ℝ≥0∞ of nonnegative integrals; totalized real integrals of a nonintegrable function must not silently give zero.
2. The finite cuts have area zero, so changing derivative values on them does not affect energy. Radial logarithmic test functions give a nonempty class for round annuli; the special slit-domain comparisons use conformal pullbacks and monotonicity.
3. Do not introduce a general Sobolev-space, Perron-solution or harmonic-measure construction: the stated elementary variational class suffices for the source argument.

Further acceptance checks:

- For a round annulus r<|z|<R, Cap_D=2π/log(R/r). Saff’s logarithmic-energy condenser capacity is 1/log(R/r); these conventions must not be interchanged.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/normalized-conformal-radius`.

Sources: [V. N. Dubinin, §1, definition before Theorem 1 and proof, pp. 269–270][dubinin-1985]. Desymmetrization compares condenser capacities through Dirichlet integrals of admissible functions; the capacity on p. 269 is the Dirichlet integral itself, without a 1/(2π) factor, as here. [E. B. Saff, §5, p. 192, and Example 5.1, (5.3), p. 193][saff-2010]. The energy-normalized condenser capacity differs from the Dirichlet integral normalization by 2π.

<a id="dirichlet-capacity-change-variables"></a>

### Dirichlet conformal invariance and the annulus formula

`ClassicalArithmeticCompletion:CA.6/dirichlet-capacity-change-variables` · theorem.

For the radial slit condenser class, Cap_D is invariant under eligible conformal changes of coordinates. For round plates E₀={|z|≥R}, E₁={|z|≤r}, 0<r<R, Cap_D=2π/log(R/r). Plate monotonicity holds with the direction stated in the definition.

Hypotheses and conventions: Coordinate maps are biholomorphisms of the open condenser domains with continuous corresponding boundary values; the composed tests remain in the prescribed class.

Proof or construction:

1. For a holomorphic conformal map the derivative multiplies real lengths by |φ′| and area by |φ′|². The chain rule and the holomorphic change of variables (TauCeti.lintegral_image_eq_lintegral_enorm_deriv_sq_mul, area factor ‖φ′‖²) cancel the factors in the nonnegative Dirichlet integral; apply both map directions.
2. For an annulus, the admissible radial function log(R/|z|)/log(R/r) has energy 2π/log(R/r). On each radial line, the endpoint value difference is 1; weighted Cauchy–Schwarz gives radial energy at least 1/log(R/r). Integrate angles and discard the nonnegative angular contribution.
3. The larger-plate admissible class is a subset of the smaller-plate class, and gradients vanish in the plate regions. This proves monotonicity.

Further acceptance checks:

- Any formula log(R/r)/(2π) would be the reciprocal capacity and fails the thin-annulus check.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/slit-dirichlet-capacity`; `mathlib:MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul`; `tauceti:TauCeti.lintegral_image_eq_lintegral_enorm_deriv_sq_mul`.

Sources: [V. N. Dubinin, §1, Dirichlet integral characterization, pp. 269–270][dubinin-1985]. The proof uses capacity invariance and comparison of test-function energies. [E. B. Saff, Example 5.1, (5.3), p. 193][saff-2010]. The logarithmic annulus denominator confirms the normalization after multiplication by 2π.

<a id="slit-radius-asymptotic"></a>

### The small-inner-disc capacity asymptotic

`ClassicalArithmeticCompletion:CA.6/slit-radius-asymptotic` · lemma.

Let D be a bounded simply connected radial slit disc containing 0, and c_D=cr(D,0). For 0<ε sufficiently small put C_D(ε)=Cap_D(ℂ∖D,closedBall(0,ε)). Then 2π/C_D(ε)=log(1/ε)+log(c_D)+o(1) as ε→0+. In particular C_D(ε)≤C_E(ε) for all sufficiently small ε implies cr(D,0)≥cr(E,0).

Hypotheses and conventions: D and E have the specified finite slit geometry and contain 0. Capacity is finite and positive for these separated plates.

Proof or construction:

1. Use the normalized Riemann map φ with φ′(0)=1/c_D. Its image of the small inner disc is sandwiched between concentric discs of radii ε/c_D·(1±o(1)), from uniform differentiability and the inverse-map expansion.
2. Conformal invariance and plate monotonicity sandwich the capacity between the two explicit annulus capacities. Taking reciprocals yields the asserted asymptotic with the plus sign in front of log(c_D).
3. For the comparison, take reciprocal capacities, subtract log(1/ε), and pass to the limit.

Further acceptance checks:

- For D=ball(0,R), the identity is exact with c_D=R; increasing R decreases capacity and increases conformal radius.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/normalized-conformal-radius`; `ClassicalArithmeticCompletion:CA.6/dirichlet-capacity-change-variables`.

Sources: [V. N. Dubinin, §1 corollary proof, pp. 270–271][dubinin-1985]. The corollary’s proof compares condensers bounded by conformal images of concentric circles, using Grötzsch’s lemma, and lets the inner radius tend to 0 (pp. 270–271); the asymptotic here packages that limit.

<a id="dubinin-desymmetrization"></a>

### Dubinin’s finite rotational desymmetrization

`ClassicalArithmeticCompletion:CA.6/dubinin-desymmetrization` · construction.

For n≥1 distinct ray directions θ_j and 0<r<1, let D(r;θ)=ball(0,1)∖⋃_j{t exp(iθ_j):r≤t<1}. Let D*(r,n) use equally spaced directions 2πj/n. There is a finite partition into angular pieces with rotations about 0 sending the regular slit configuration to the prescribed one. On identified cut boundaries, the inverse images differ by elements of the dihedral symmetry group of the regular configuration. Consequently every dihedrally invariant admissible test function on D* transfers to a continuous admissible test function on D with the same Dirichlet energy and unchanged circular inner and outer plate values.

Hypotheses and conventions: Distinct directions and positive slit tip radius; repeated rays are collapsed before applying this construction. A partition of the plane into closed angular pieces has disjoint interiors; energy is computed on those interiors, and finite cuts have area zero.

Uses: CA.6/dubinin-slit-radius: Compares an arbitrary slit domain with its regular configuration through the capacity infimum.

Planning API:

- `desymmetrization_partition` (projection): The angular pieces cover the plane and have pairwise disjoint interiors, both before and after rotation.
- `desymmetrization_boundary_match` (relation): On each common cut, the two inverse images are related by an element of the regular configuration’s dihedral group.
- `desymmetrization_transfer` (constructor): A dihedrally invariant admissible function transfers by the inverse rotations and agrees on all cuts.
- `desymmetrization_energy` (compatibility): The transferred nonnegative Dirichlet integral equals the original integral.
- `desymmetrization_capacity_le` (relation): Averaging first over the dihedral group and then transferring gives Cap_D(D,ε)≤Cap_D(D*,ε) for 0<ε<r.

Checks:

- `desymmetrization_one_ray` (degenerate): For n=1, a single global rotation transfers the slit domain and preserves capacity.
- `desymmetrization_regular` (compatibility): For equally spaced directions the identity partition works and the capacities agree.
- `desymmetrization_two_rays` (non-example): For two distinct but non-antipodal rays the construction must still cover both domains and match cuts; a single global rotation cannot supply it.
- `desymmetrization_radius` (computation): Every piece rotation fixes the radius-ε inner plate; moving that plate independently violates the construction.

Proof or construction:

1. Use the angle-subdivision construction in Dubinin Lemma 1: move sectors by rotations, split a sector at every mismatch, and match cut rays by the dihedral reflections. The finite procedure reduces the remaining unmatched angular pieces.
2. Define the transferred function on each rotated piece by composing the original function with the inverse rotation. Dihedral invariance gives equal values on common cuts. Lemma 2 supplies local Lipschitz regularity across them; finite C1 cuts are transported to finite C1 cuts.
3. Rotations have area Jacobian 1 and preserve the gradient norm, so the sum of piece energies is unchanged. Rotations preserve the concentric plate circles and send the regular slits to the prescribed slit plate.

Further acceptance checks:

- Boundary matching is a mathematical condition, not an assertion that arbitrary independently rotated sectors automatically produce a continuous function.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/slit-dirichlet-capacity`.

Sources: [V. N. Dubinin, §1, Lemmas 1–2 and Theorem 1 proof, pp. 268–270][dubinin-1985]. A finite angular partition, its boundary matching, and the transferred symmetric test function give the desymmetrization capacity inequality.

<a id="dubinin-slit-radius"></a>

### Dubinin’s slit-domain conformal-radius comparison

`ClassicalArithmeticCompletion:CA.6/dubinin-slit-radius` · theorem.

For n≥1 distinct directions and 0<r<1, cr(D(r;θ),0)≥cr(D*(r,n),0). Equivalently the positive derivatives of their normalized disc maps satisfy φ_D′(0)≤φ_D*′(0).

Hypotheses and conventions: Exactly the radial slit domains specified in the desymmetrization construction. No equality characterization is required.

Proof or construction:

1. Average each admissible regular-domain test over its finite dihedral group; convexity of squared gradient norm does not increase energy.
2. Transfer that invariant test using the finite rotational partition. Take the infimum to obtain C_D(ε)≤C_D*(ε) for every 0<ε<r.
3. Apply the small-inner-disc asymptotic and invert the positive conformal radii to get the derivative comparison.

Further acceptance checks:

- For one slit the comparison is equality under rotation.
- The radius inequality is opposite to the normalized-derivative inequality.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/dubinin-desymmetrization`; `ClassicalArithmeticCompletion:CA.6/slit-radius-asymptotic`; `ClassicalArithmeticCompletion:CA.6/normalized-conformal-radius`.

Sources: [V. N. Dubinin, §1, corollary after Theorem 1, pp. 270–271][dubinin-1985]. The arbitrary slit map has no larger derivative at zero than the regular slit map.

<a id="diameter-exterior-radius"></a>

### Transfinite diameter and the inverted exterior radius

`ClassicalArithmeticCompletion:CA.6/diameter-exterior-radius` · theorem.

Let K be a nontrivial finite radial hedgehog and b>0. Put U_b={0}∪{b/z:z∈ℂ∖K}. Then U_b is a proper simply connected open domain containing 0 and d(K)=b/cr(U_b,0). Equivalently the normalized exterior map Ψ:ℂ∖K→{|w|>1} has Ψ(z)=γz+O(1) at infinity with γ=1/d(K)>0.

Hypotheses and conventions: Nontrivial means K contains a nonzero endpoint; the singleton hedgehog has d=0 and its inverted domain is the entire plane, which has no disc Riemann map.

Proof or construction:

1. The inverted domain is the plane with finitely many outward rays deleted, hence is open and star-convex at 0. Use the pinned contractibility and Riemann-mapping results. Compose its normalized map φ with the inversion to obtain Ψ(z)=1/φ(b/z); since φ(w)=φ′(0)w+O(w²), Ψ(z)=z/(bφ′(0))+O(1), so γ=1/(bφ′(0))=cr(U_b,0)/b.
2. For r>1 the level curve Γ_r=Ψ⁻¹({|w|=r}) encloses K. The polynomial part Q_n of γ⁻ⁿΨⁿ is monic of degree n. Its Cauchy integral over one level curve (homologyCauchyTheorem), with different level curves compared through the cycle form of Cauchy’s theorem, gives ‖Q_n‖_K≤C_r(r/γ)^n. The Chebyshev limit gives d(K)≤1/γ as r decreases to 1.
3. For every monic degree-n p, p/Ψⁿ is holomorphic on the exterior, including infinity, and tends to γ⁻ⁿ there. The maximum principle on the exterior of Γ_r, applied after the inversion w=1/z to a bounded domain (Complex.norm_le_of_forall_mem_frontier_norm_le), yields γ⁻ⁿ≤r⁻ⁿ‖p‖_(Γ_r). The curves approach K as r decreases to 1, yielding ‖p‖_K≥γ⁻ⁿ. Take the Chebyshev limit for the reverse inequality.

Further acceptance checks:

- For [0,a], the exterior radius relation gives d=|a|/4. The scale b is retained explicitly; taking b=R in the hedgehog comparison avoids a reciprocal-scale error.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/radial-hedgehog`; `ClassicalArithmeticCompletion:CA.6/normalized-conformal-radius`; `ClassicalArithmeticCompletion:CA.6/fekete-chebyshev-limit`; `mathlib:DifferentiableOn.hasFPowerSeriesOnBall`; `tauceti:TauCeti.Contour.homologyCauchyTheorem`; `tauceti:TauCeti.Contour.Cycle.homologyCauchyTheorem`; `mathlib:Complex.norm_le_of_forall_mem_frontier_norm_le`.

Sources: [E. B. Saff, §3, Theorem 3.5 and Example 3.6, p. 185; §1, Theorem 1.9, pp. 172–173][saff-2010]. The leading coefficient of the exterior conformal map is the reciprocal capacity (Φ(z)=z/c+⋯, c=cap E, in (3.3)), and capacity equals the transfinite diameter. The displayed proof uses the already planned Chebyshev characterization instead of adding a general energy-minimization theory.

<a id="dubinin-hedgehog-bound"></a>

### Dubinin’s radial hedgehog bound

`ClassicalArithmeticCompletion:CA.6/dubinin-hedgehog-bound` · theorem.

For n≥1 and endpoints a₁,…,a_n∈ℂ, with R=max_i|a_i|, d(K(a))≤R·4^(−1/n). Equivalently d(K(a))^n≤R^n/4. Zero endpoints, repeated endpoints and coincident rays are allowed. For the regular n-spike hedgehog with endpoints R exp(2πij/n), equality holds.

Hypotheses and conventions: n≥1; the bound is interpreted with the usual positive real nth root.

Proof or construction:

1. If R=0 then K={0} and its diameter is zero. Otherwise extend every nonzero segment to length R, collapse coincident rays, and let m≤n be the resulting positive number of distinct rays. Monotonicity reduces to this equal-length hedgehog.
2. Invert by z↦R/z. The resulting domain U is the plane minus m outward rays starting on the unit circle. Exhaust it by U∩ball(0,L), L>1. Scaling by 1/L gives the slit discs with tip radius 1/L. Dubinin’s slit-radius comparison and conformal-radius exhaustion give cr(U,0)≥cr(U*,0).
3. Apply the exterior-radius identity to turn this into d(K)≤d(K*). The regular m-spike set is the inverse image of [0,R^m] under X^m, so the monic inverse-image formula and d([0,s])=s/4 give d(K*)=R4^(−1/m)≤R4^(−1/n).

Further acceptance checks:

- One endpoint a gives the sharp value |a|/4. Endpoints 1,−1 give the sharp value 1/2. Endpoints 1,1 give 1/4, strictly below the n=2 bound 1/2; multiplicity is not an equality hypothesis.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/finite-fekete-diameter`; `ClassicalArithmeticCompletion:CA.6/radial-hedgehog`; `ClassicalArithmeticCompletion:CA.6/dubinin-slit-radius`; `ClassicalArithmeticCompletion:CA.6/diameter-exterior-radius`; `ClassicalArithmeticCompletion:CA.6/normalized-conformal-radius`; `ClassicalArithmeticCompletion:CA.6/monic-preimage-diameter`.

Sources: [Vesselin Dimitrov, §3, Theorem 3, p. 12][dimitrov-2019]. Dubinin’s bound for a finite union of radial segments is the analytic inequality needed by Schinzel–Zassenhaus. [V. N. Dubinin, §1, corollary, pp. 270–271][dubinin-1985]. The normalized slit-map derivative comparison supplies the geometric inequality through inversion and exhaustion.

## Hankel determinants and integer rationality

<a id="shifted-hankel-determinant"></a>

### The shifted leading Hankel determinant

`ClassicalArithmeticCompletion:CA.6/shifted-hankel-determinant` · definition.

For a sequence a:ℕ→R over a commutative ring and n∈ℕ, H_n(a) is the n×n matrix with entry a_(i+j+1), 0≤i,j<n, and D_n(a)=det H_n(a). In particular D₀=1. The coefficient a₀ does not enter these determinants.

Hypotheses and conventions: The +1 shift corresponds to the Laurent coefficient extracted by ∮G(z)z^k dz; use this convention throughout.

Uses: CA.6/hankel-analytic-growth: The contour coefficient formula is exactly the shifted moment matrix. CA.6/bertrandias-rationality: Integer determinants smaller than 1 must vanish, and Kronecker converts eventual vanishing into rationality.

Planning API:

- `shiftedHankelDet_zero` (simp): D₀(a)=1.
- `shiftedHankelDet_one` (simp): D₁(a)=a₁.
- `shiftedHankelDet_two` (example): D₂(a)=a₁a₃−a₂².
- `shiftedHankelDet_map` (functoriality): A ring homomorphism φ sends D_n(a) to D_n(φ∘a).
- `shiftedHankelDet_integer` (compatibility): For integer a, its complex determinant is the integer cast of D_n(a); hence a nonzero determinant has complex norm at least 1.
- `shiftedHankelDet_monic_basis` (compatibility): Replacing powers X^i in both rows and columns by monic degree-i polynomials leaves the determinant of the moment matrix unchanged.

Checks:

- `hankel_empty` (degenerate): D₀=1, not zero.
- `hankel_geometric` (computation): For a_j=2^j, D₁=2 and D₂=0.
- `hankel_shift` (compatibility): For a₀=7, a₁=2, a₂=3, a₃=5, D₂=1; changing a₀ has no effect.
- `hankel_single_zero` (non-example): For a₁=0, a₂=1, a₃=0, D₁=0 but D₂=−1. One vanishing determinant is insufficient.

Proof or construction:

1. Use Matrix (Fin n) (Fin n) R and the existing determinant. Ring-hom compatibility follows from determinant naturality.
2. A tail recurrence makes sufficiently many columns dependent, while the exact converse needs eventual vanishing of every leading determinant, as in Kronecker’s criterion.

Further acceptance checks:

- A single zero leading determinant does not establish rationality.

Direct prerequisites: `mathlib:Matrix.det`; `mathlib:Matrix.det_apply`; `mathlib:RingHom.map_det`.

Sources: [Vesselin Dimitrov, §4, Hankel determinant in the proof of Theorem 4, pp. 13–14][dimitrov-2019]. The matrix uses the coefficient shift a_(i+j+1). [Aitor Iribar López, §2, Theorem 1 and proof, pp. 2–3][iribar-kronecker]. Kronecker’s criterion is written for the unshifted sequence; apply it to the tail a_(j+1).

<a id="exterior-laurent-continuation"></a>

### An exterior Laurent continuation

`ClassicalArithmeticCompletion:CA.6/exterior-laurent-continuation` · definition.

For a:ℕ→ℂ and compact nonempty K⊆ℂ, an exterior Laurent continuation is a function G:ℂ→ℂ holomorphic on ℂ∖K, together with R>0 such that K⊆closedBall(0,R) and, whenever |z|>R, HasSum(Σ_j a_j z^(−j),G(z)). Equivalently the summand is a_j(z⁻¹)^j. Values of G on K are irrelevant.

Hypotheses and conventions: Only a convergent germ at infinity is claimed; arbitrary formal series are not silently treated as analytic functions. Connectedness of ℂ∖K is not required for the formal rationality conclusion. If the conclusion also identifies G with the rational function everywhere off K, require connectedness.

Uses: CA.6/hankel-analytic-growth: Permits deformation of a large coefficient circle to a lemniscate boundary. CA.6/hedgehog-square-root-continuation: Records the single-valued square-root branch with its actual formal germ.

Planning API:

- `exteriorContinuation_enlarge_radius` (functoriality): Any larger positive radius containing K is a valid convergence radius.
- `exteriorContinuation_enlarge_set` (functoriality): If K⊆L are compact, restrict the same witness to ℂ∖L and enlarge its radius.
- `exteriorContinuation_unique` (extensionality): For connected ℂ∖K, two witnesses for the same coefficients agree off K.
- `exteriorContinuation_coeff` (compatibility): The coefficient of z^(−j) is PowerSeries.coeff j (PowerSeries.mk a).
- `exteriorContinuation_moment` (relation): For a finite smooth contour cycle enclosing K with total index 1 and lying off K, a_(k+1)=(2πi)⁻¹∮G(z)z^k dz for every k≥0.

Checks:

- `continuation_geometric` (computation): G(z)=1/(z−2), K={2}, a₀=0 and a_j=2^(j−1) for j≥1 give a continuation and a rational formal series.
- `continuation_branch` (non-example): G(z)=sqrt(1−1/z) on the complement of [0,1] has the normalized branch at infinity but coefficients a₁=−1/2, so it fails integer integrality.
- `continuation_essential_infinity` (non-example): G(z)=exp z is holomorphic outside {0} but has no convergent series in nonpositive powers at infinity; holomorphy alone is insufficient.
- `continuation_constant` (degenerate): G=7 and a₀=7, a_j=0 for j>0 work for every nonempty compact K.

Proof or construction:

1. Store an unbundled holomorphic witness and an exterior convergence radius. The radius can be enlarged, and the excluded compact set can be enlarged, without changing the germ.
2. On a connected complement the identity theorem makes the witness unique there. The formal series at infinity is PowerSeries.mk a in the variable w=1/z.

Further acceptance checks:

- A0 may be nonzero. It is a constant term and has no effect on the shifted Hankel rationality criterion.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/shifted-hankel-determinant`; `mathlib:PowerSeries.mk`; `mathlib:DifferentiableOn.hasFPowerSeriesOnBall`.

Sources: [Vesselin Dimitrov, §4, Theorem 4 and Corollary 5, pp. 13–15][dimitrov-2019]. A convergent integer Laurent germ extends as a single-valued holomorphic function outside a small-diameter compact set. [Françoise Bertrandias, §3.1, Théorème, p. 12][bertrandias-1964]. The extension assumption is imposed on the germ, not merely on an unrelated holomorphic function. Bertrandias also asks for a simply connected complement; this definition needs no connectedness.

<a id="kronecker-hankel-rationality"></a>

### Kronecker’s eventual Hankel vanishing criterion

`ClassicalArithmeticCompletion:CA.6/kronecker-hankel-rationality` · theorem.

For a sequence a over a field k, PowerSeries.mk a is rational in the sense of CA.2/rational-power-series if and only if there exists N such that D_n(a)=0 for all n≥N. The denominator may be normalized to have constant term 1; no degree bound on the numerator is assumed.

Hypotheses and conventions: k is a field; no characteristic-zero hypothesis is needed for this algebraic criterion.

Proof or construction:

1. Rationality gives a linear recurrence for the coefficients after the numerator degree. For large n its shifted moment matrix has dependent columns, and D_n=0.
2. Conversely apply the source criterion to the tail b_j=a_(j+1). If all its leading determinants vanish, its first nonzero coefficient would give a nonzero anti-diagonal determinant, so the tail is zero. Otherwise take r maximal with a nonzero r×r leading determinant. Solve the unique r-term recurrence from its invertible block.
3. If the first subsequent recurrence failure is at the index controlled by d≥0, a block determinant factors as det(A_r) times a nonzero anti-diagonal block of size d+1, with sign (−1)^((d+1)d/2). This contradicts maximality. The recurrence is therefore valid from a finite index onward. Multiply the series by its recurrence polynomial to get a polynomial (coefficients of the coerced polynomial by Polynomial.coeff_coe); adding a₀ does not change rationality.

Further acceptance checks:

- The +1 shift discards only the constant coefficient. A zero determinant at one size does not satisfy the eventual condition.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/shifted-hankel-determinant`; `ClassicalArithmeticCompletion:CA.2/rational-power-series`; `mathlib:Matrix.det`; `mathlib:Polynomial.coeff_coe`.

Sources: [Aitor Iribar López, §2, Theorem 1 and proof, pp. 2–3][iribar-kronecker]. Eventual vanishing of all leading Hankel determinants characterizes rational formal series. The proof is used with the sign, index and recurrence corrections recorded under sourceIssues. [Françoise Bertrandias, §2.1, p. 6, and §3.1, proof, p. 12][bertrandias-1964]. Bertrandias calls det(u_(h+k)) the Kronecker determinant (§2.1) and concludes rationality from its eventual vanishing (§3.1) without restating the criterion; the theorem of §2.1 is the non-archimedean growth bound, not this criterion.

<a id="hankel-analytic-growth"></a>

### Analytic n²-growth bound for Hankel determinants

`ClassicalArithmeticCompletion:CA.6/hankel-analytic-growth` · theorem.

If a has an exterior Laurent continuation outside a nonempty compact K, then for every r>d(K) there exists B>0 such that |D_n(a)|≤n! B^n r^(n(n−1)) for every n∈ℕ. In particular limsup_(n→∞)|D_n(a)|^(1/n²)≤d(K).

Hypotheses and conventions: r>d(K)≥0, so r>0. The limsup statement concerns n≥1.

Proof or construction:

1. Choose a regular lemniscate enclosure L of diameter ρ with d(K)<ρ<r. Its boundary Γ lies off K and encloses K. The Laurent coefficient formula gives a_(k+1)=(2πi)⁻¹∮_ΓG(z)z^k dz, by deforming a large coefficient circle through the holomorphy region.
2. Change rows and columns from X^i to the monic basis Q_i supplied by the enclosure. Both change-of-basis matrices are triangular with diagonal 1, so their determinants are 1. The new moment entries obey |L(Q_iQ_j)|≤Bρ^(i+j), with B independent of i,j.
3. The determinant expansion has n! terms; in every term Σ_i(i+σ(i))=n(n−1). This gives the stated bound (enlarge B if needed and use ρ<r). Take n²th roots; log(n!)/n² and log(B)/n tend to zero, then let r decrease to d(K).

Further acceptance checks:

- At n=0 both sides equal 1. Factorial growth is negligible relative to any fixed r^(n²) with r<1; no unjustified uniform bound in n is imposed on G’s raw coefficients.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/exterior-laurent-continuation`; `ClassicalArithmeticCompletion:CA.6/lemniscate-enclosure`; `ClassicalArithmeticCompletion:CA.6/shifted-hankel-determinant`; `mathlib:Matrix.det_apply`; `mathlib:Matrix.det_mul`; `tauceti:TauCeti.Contour.Cycle.homologyCauchyTheorem`.

Sources: [Françoise Bertrandias, §2.1, Théorème, p. 6; §2.6, pp. 10–12; §3.1, proof, p. 12][bertrandias-1964]. Bertrandias proves the non-archimedean analogue (§2.1, proved in §2.6) by transforming the Kronecker determinant with the Chebyshev polynomials of a lemniscate enclosure and expanding over permutations; in §3.1 the archimedean bound is quoted from the classical literature. [Vesselin Dimitrov, §4, proof of Theorem 4, pp. 13–14][dimitrov-2019]. Monic row and column transformations expose the capacity bound on Hankel determinants.

<a id="bertrandias-rationality"></a>

### Bertrandias’s integer Laurent rationality criterion

`ClassicalArithmeticCompletion:CA.6/bertrandias-rationality` · theorem.

Let a:ℕ→ℤ, and suppose its complex coefficient casts have an exterior Laurent continuation outside a nonempty compact K⊆ℂ with d(K)<1. Then PowerSeries.mk (a cast to ℚ) is rational: there exist P,Q∈ℚ[X] with Q(0)≠0 and Q·PowerSeries.mk a=P in ℚ⟦X⟧. If ℂ∖K is connected, the continuation agrees there with that rational germ wherever its expression in 1/z is defined.

Hypotheses and conventions: Integer coefficients and the strict diameter bound are essential. The main conclusion is rationality over ℚ, not a claim that every allowed denominator has integer constant term ±1.

Proof or construction:

1. Choose d(K)<r<1. The analytic estimate gives |D_n|≤n!B^n r^(n(n−1)), which tends to zero because its logarithm has a negative quadratic leading term.
2. Each complex determinant is the cast of an integer determinant. For sufficiently large n its norm is below 1, so the integer determinant is zero. Transfer zero to ℚ and apply Kronecker’s criterion over ℚ.
3. On a connected complement, the identity theorem extends the equality of the rational germ and G away from poles and z=0; removable points are interpreted through G.

Further acceptance checks:

- The criterion applies to K={2} of diameter 0 for G=1/(z−2), despite a finite pole. K=[0,1] has diameter 1/4, but the normalized square-root example is excluded by its noninteger coefficients.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/hankel-analytic-growth`; `ClassicalArithmeticCompletion:CA.6/kronecker-hankel-rationality`; `ClassicalArithmeticCompletion:CA.6/shifted-hankel-determinant`; `ClassicalArithmeticCompletion:CA.2/rational-power-series`.

Sources: [Françoise Bertrandias, §3.1, Théorème and proof, p. 12][bertrandias-1964]. The archimedean small-diameter continuation condition forces the integer Hankel determinants to vanish. Bertrandias allows rational coefficients integral outside finitely many primes and assumes a simply connected complement; the integer case here needs no connectedness, since the lemniscate-contour estimate does not use it. [Vesselin Dimitrov, §4, Theorem 4 and Corollary 5, pp. 13–15][dimitrov-2019]. The integer-coefficient specialization is the rationality input used for the square root (Corollary 5 assumes a connected complement, which holds for hedgehogs).

<a id="hedgehog-square-root-continuation"></a>

### The square-root branch outside a hedgehog

`ClassicalArithmeticCompletion:CA.6/hedgehog-square-root-continuation` · construction.

For a nonempty finite endpoint family β_i∈ℂ, put K=K(β) and Q(w)=∏_i(1−β_i w). There is a unique complex formal series S with S(0)=1 and S²=Q. Off K define G(z)=∏_i exp((1/2)log(1−β_i/z)), using the principal log. Then G is holomorphic off K, G(z)²=Q(1/z), G tends to 1 at infinity, and G is an exterior Laurent continuation of the coefficients of S.

Hypotheses and conventions: 0∈K, so z⁻¹ is well-defined at every point of the holomorphy domain. Zero and repeated β_i are allowed. This statement produces a complex series; integer coefficients must be supplied separately by CA.6/integral-square-root-power-series.

Uses: CA.6/dimitrov-analytic-input: Supplies the exact continuation assumption for the integral normalized square root used in Dimitrov’s proof.

Planning API:

- `hedgehogSqrt_square` (projection): G(z)²=∏_i(1−β_i/z) for z∉K.
- `hedgehogSqrt_holomorphic` (structure): G is holomorphic on ℂ∖K.
- `hedgehogSqrt_at_infinity` (projection): G tends to 1 as |z| tends to infinity.
- `hedgehogSqrt_coeff_unique` (characterisation): The formal square equation and constant coefficient 1 uniquely determine S.
- `hedgehogSqrt_continuation` (compatibility): The convergent Laurent germ of G has exactly the coefficients of that formal S.
- `hedgehogSqrt_integer_import` (compatibility): When the normalized square equation is supplied by the parent’s integer-series construction, the complex coefficients equal its integer casts.

Checks:

- `hedgehogSqrt_one` (computation): For β=1, G(2)=sqrt(1/2)>0 and G(−1)=sqrt 2>0.
- `hedgehogSqrt_zero` (degenerate): With all β_i=0, K={0}, Q=1 and G=1.
- `hedgehogSqrt_repeated` (compatibility): For endpoints 1,1 the normalized branch is G(z)=1−1/z, not its negative.
- `hedgehogSqrt_no_cut` (non-example): For one β=1 there is no global single-valued holomorphic square root on ℂ∖{0,1}; a loop around the simple branch point changes its sign.

Proof or construction:

1. If z∉[0,β_i], then 1−β_i/z avoids the nonpositive real ray. Indeed a nonpositive real value would make z a real multiple tβ_i with 0<t≤1. Thus each principal-log factor is holomorphic outside K (DifferentiableAt.clog), and exp(log u)=u gives its square.
2. For |z| larger than every |β_i| the usual normalized analytic square root has a convergent expansion at infinity. The coefficient recursion 2s_m=q_m−Σ_(0<j<m)s_js_(m−j) uniquely specifies S over ℂ. Hence the analytic branch and the formal normalized square root have identical coefficients.
3. Multiply finitely many factors. Every factor tends to 1 at infinity; this fixes the sign of the square root.

Further acceptance checks:

- No free choice of signs on separate factors is allowed: the value at infinity is 1.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/radial-hedgehog`; `ClassicalArithmeticCompletion:CA.6/exterior-laurent-continuation`; `mathlib:Complex.differentiableAt_log`; `mathlib:DifferentiableAt.clog`; `mathlib:Complex.exp_log`; `mathlib:PowerSeries.coeff_mul`.

Sources: [Vesselin Dimitrov, §4, proof of Theorem 1, p. 15][dimitrov-2019]. The cuts join 0 to the roots of P₂ and P₄, making the normalized square root single-valued outside their hedgehog.

<a id="dimitrov-analytic-input"></a>

### The capacity-to-rationality input of Dimitrov’s bound

`ClassicalArithmeticCompletion:CA.6/dimitrov-analytic-input` · application.

For n≥1, endpoints β₁,…,β_n, and an integer formal series S with S(0)=1 and S²=∏_i(1−β_i w) after casting to ℂ, if R=max_i|β_i| satisfies R^n<4, then S is rational over ℚ. In the parent Schinzel–Zassenhaus argument use β=(α_i²,α_i⁴), n=2d: if the house H>1 obeys H<2^(1/(4d)), then R≤H⁴ and R^(2d)<4, so this theorem makes the parent’s normalized integral square root rational.

Hypotheses and conventions: The integer square-root hypothesis is explicit and supplied by the existing parent construction. The displayed house substitution concerns the unit case H>1 used in the parent degree induction.

Proof or construction:

1. The hedgehog square-root construction gives the exterior continuation of the integer coefficient casts. Dubinin’s bound and R^n<4 imply d(K)<1. Apply Bertrandias’s rationality criterion.
2. For a rational square root S of a polynomial, every irreducible factor of that polynomial has even valuation. The normalized reciprocal root product therefore corresponds to a square product P₂P₄ in the parent algebraic argument: P₂*P₄* has degree 2d and constant term 1, so a polynomial S with S²=P₂*P₄* has degree d, and X^dS(1/X) squares to X^(2d)P₂*P₄*(1/X)=P₂P₄; the same reversal goes back.
3. Bind this analytic result to the existing parent degree induction and corrected square-cyclotomic criterion; do not introduce a second Schinzel–Zassenhaus target.

Further acceptance checks:

- For d=1 the threshold in the contradiction is H<2^(1/4), and the estimate uses 2d segments, not d. A rational square-root branch does not alone prove cyclotomicity; the parent arithmetic induction is required.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.6/hedgehog-square-root-continuation`; `ClassicalArithmeticCompletion:CA.6/dubinin-hedgehog-bound`; `ClassicalArithmeticCompletion:CA.6/bertrandias-rationality`; `ClassicalArithmeticCompletion:CA.6/integral-square-root-power-series`; `ClassicalArithmeticCompletion:CA.6/root-power-polynomial`; `ClassicalArithmeticCompletion:CA.6/root-power-polynomial-square-cyclotomic`.

Sources: [Vesselin Dimitrov, §4, proof of Theorem 1, pp. 15–16, after Corollary 5][dimitrov-2019]. The strict capacity bound makes the normalized integral square root rational; the algebraic part then forces cyclotomicity or a smaller-degree contradiction.

## Interfaces to the existing arithmetic targets

- `ClassicalArithmeticCompletion:CA.6/smyth-nonreciprocal-lower-bound` consumes `ClassicalArithmeticCompletion:CA.6/smyth-bounded-factorization`; `ClassicalArithmeticCompletion:CA.6/schur-coefficient-conditions`; `ClassicalArithmeticCompletion:CA.6/schur-parseval-contract`; `ClassicalArithmeticCompletion:CA.6/smyth-analytic-input`. The parent’s broad missing-public-proof analytic gap is narrowed to verification of the short-gap multipliers, not declared closed.
- `ClassicalArithmeticCompletion:CA.6/plastic-number-least-pisot` consumes `ClassicalArithmeticCompletion:CA.6/smyth-analytic-input`. Only the inherited nonreciprocal-bound analytic dependency; the parent’s Pisot and polynomial certificates remain required.
- `ClassicalArithmeticCompletion:CA.6/schinzel-zassenhaus-dimitrov` consumes `ClassicalArithmeticCompletion:CA.6/finite-fekete-diameter`; `ClassicalArithmeticCompletion:CA.6/dubinin-hedgehog-bound`; `ClassicalArithmeticCompletion:CA.6/bertrandias-rationality`; `ClassicalArithmeticCompletion:CA.6/hedgehog-square-root-continuation`; `ClassicalArithmeticCompletion:CA.6/dimitrov-analytic-input`. The parent’s unsupplied potential-theory contract, at the exact integer-series and radial-cut conventions used in its proof.
- `ClassicalArithmeticCompletion:CA.6/dobrowolski-auxiliary-polynomial` consumes `DiophantineApproximationAndTranscendence:DT.0/siegel-lemma-number-field-product`. Replaces the inherited stage prerequisite DiophantineApproximationAndTranscendence:DT.0 and its request; the lemma is applied with N+1 unknowns (exponent 1/(N+1−dM)). Added by the independent review.

The rational square-root conclusion is an analytic input. It does not alone identify the input polynomial as cyclotomic. The parent supplies the root-power congruence, the normalized integer square root, the square-factor argument and the smaller-degree induction. In particular its square-cyclotomic conclusion uses 4∤N under nonsquare P₂; an odd-level restriction would fail on Φ₆.

The layer retains six existing planets: `Pisot number`, `Salem number`, `Lehmer's number`, `Smyth's theorem on nonreciprocal algebraic integers`, `Dobrowolski's lower bound`, `Schinzel–Zassenhaus conjecture (Dimitrov)`. The analytic prerequisites add no planets. Lehmer’s problem remains a conjecture in the parent document, not a theorem target.

## Imported CA.6 targets

The following IDs retain their full statements, hypotheses, APIs, tests and source locators in the linked parent targets and [parent packet](../packets/ClassicalArithmeticCompletion.json). This part adds the supplier bindings above; it does not replace those definitions or duplicate their nodes. More recent corrections and review assessments in the parent take precedence over its historical findings.

| Existing target | Retained contract |
| --- | --- |
| [Pisot numbers](ClassicalArithmeticCompletion.md#CA-6-pisot-number) (`CA.6/pisot-number`) | A Pisot number is a real number θ that is an algebraic integer (integral over ℤ), satisfies θ > 1, and all of whose other complex conjugates lie in the open unit disc: every complex root z ≠ θ of the minimal polynomial minpoly ℤ θ has &#124;z&#124; < 1. The conjugates are the complex roots of minpoly ℤ θ (Mathlib's aroots of the minimal polynomial over ℤ, which for an algebraic integer is the monic minimal polynomial over ℚ by Gauss's lemma). Convention (pinned): degree one is allowed, so the Pisot numbers of degree one are exactly the integers n ≥ 2; the inequality θ > 1 is strict, so 1 is not a Pisot number. |
| [Salem numbers](ClassicalArithmeticCompletion.md#CA-6-salem-number) (`CA.6/salem-number`) | A Salem number is a real number τ that is an algebraic integer, satisfies τ > 1, all of whose other complex conjugates lie in the closed unit disc (every complex root z ≠ τ of minpoly ℤ τ has &#124;z&#124; ≤ 1), and at least one of whose conjugates lies on the unit circle (some complex root z of minpoly ℤ τ has &#124;z&#124; = 1). This is Salem's form of the definition; by Salem's lemma (CA.6/salem-number-conjugates) it is equivalent to the form 'degree at least 4, conjugate to τ⁻¹, all conjugates other than τ^{±1} of modulus 1'. Convention (pinned): the reciprocal quadratic units (3 + √5)/2, … (sometimes called quadratic Salem numbers) are not Salem numbers. |
| [The classification of Pisot and Salem numbers by conjugate moduli](ClassicalArithmeticCompletion.md#CA-6-pisot-and-salem-numbers) (`CA.6/pisot-and-salem-numbers`) | Let τ be a real algebraic integer with τ > 1, and let r_> and r_= be the numbers of complex roots of minpoly ℤ τ (counted in the multiset of roots) of modulus > 1 and of modulus = 1. Then (a) τ is a Pisot number iff r_> = 1 and r_= = 0; (b) τ is a Salem number iff r_> = 1 and r_= ≥ 1. In particular every real algebraic integer τ > 1 whose other conjugates lie in the closed unit disc is exactly one of Pisot or Salem, and τ is neither iff r_> ≥ 2. In case (b) the number of roots of modulus < 1 is 1 and r_= = deg τ − 2 ≥ 2 (CA.6/salem-number-conjugates). |
| [A root certificate for Pisot numbers](ClassicalArithmeticCompletion.md#CA-6-pisot-certificate) (`CA.6/pisot-certificate`) | Let P ∈ ℤ[X] be monic and θ > 1 a real root of P such that every complex root of P other than one copy of θ (the multiset of complex roots of P with one occurrence of θ removed) has modulus < 1. Then θ is a Pisot number. No irreducibility of P is needed. |
| [Reciprocal algebraic integers and reciprocal minimal polynomials](ClassicalArithmeticCompletion.md#CA-6-reciprocal-iff-reverse) (`CA.6/reciprocal-iff-reverse`) | Let α ≠ 0 be an algebraic integer in a field of characteristic 0, with minimal polynomial P = minpoly ℤ α of degree d, and let P* = X^d P(1/X) (Mathlib's Polynomial.reverse). Then α is conjugate to α⁻¹ over ℚ (IsConjRoot ℚ α α⁻¹) iff P* = P or P* = −P. In that case P(0) = ±1, so α is a unit. |
| [Salem's lemma: the conjugates of a Salem number](ClassicalArithmeticCompletion.md#CA-6-salem-number-conjugates) (`CA.6/salem-number-conjugates`) | A real number τ is a Salem number iff τ is an algebraic integer, τ > 1, deg τ ≥ 4, τ is conjugate to τ⁻¹, and every complex conjugate z of τ other than τ and τ⁻¹ has &#124;z&#124; = 1. Consequently τ⁻¹ is the only conjugate of τ in the open unit disc, the conjugates on the circle are non-real and occur in pairs z, z̄ = z⁻¹, and deg τ is even. |
| [The minimal polynomial of a Salem number is reciprocal](ClassicalArithmeticCompletion.md#CA-6-salem-minpoly-reciprocal) (`CA.6/salem-minpoly-reciprocal`) | If τ is a Salem number with minimal polynomial P = minpoly ℤ τ of degree d, then X^d P(1/X) = P, i.e. Polynomial.reverse P = P (the plus sign). |
| [Powers of a Salem number](ClassicalArithmeticCompletion.md#CA-6-salem-number-pow) (`CA.6/salem-number-pow`) | If τ is a Salem number of degree d and n ≥ 1, then τⁿ is a Salem number of degree d. |
| [Powers of a Pisot number](ClassicalArithmeticCompletion.md#CA-6-pisot-number-pow) (`CA.6/pisot-number-pow`) | If θ is a Pisot number and n ≥ 1, then θⁿ is a Pisot number. |
| [Salem numbers through their traces τ + τ⁻¹](ClassicalArithmeticCompletion.md#CA-6-salem-number-iff-trace) (`CA.6/salem-number-iff-trace`) | Let τ > 1 be real and α = τ + τ⁻¹. Then τ is a Salem number iff α is an irrational algebraic integer all of whose conjugates other than α are real and lie in (−2, 2). In that case ℚ(α) is a totally real subfield of index 2 in ℚ(τ), α > 2, and deg τ = 2 deg α. Equivalently (Salem): a number field K is ℚ(τ) for a Salem number τ iff K has a totally real subfield ℚ(α) of index 2 with K = ℚ(τ), τ + τ⁻¹ = α, α > 2 an irrational algebraic integer with all other conjugates in (−2, 2). |
| [Salem numbers inside ℚ(τ)](ClassicalArithmeticCompletion.md#CA-6-salem-number-in-field) (`CA.6/salem-number-in-field`) | Let τ and τ′ be Salem numbers with τ′ ∈ ℚ(τ). Then ℚ(τ′) = ℚ(τ), and if τ′ > τ then τ′/τ is a Salem number (in ℚ(τ)). |
| [The Salem numbers of a field are the powers of one of them](ClassicalArithmeticCompletion.md#CA-6-salem-numbers-in-field-powers) (`CA.6/salem-numbers-in-field-powers`) | If K = ℚ(τ) for a Salem number τ, there is a Salem number τ₁ ∈ K such that the Salem numbers in K are exactly the powers τ₁ⁿ, n ≥ 1. |
| [λτⁿ is close to integers for a Salem number τ](ClassicalArithmeticCompletion.md#CA-6-salem-number-near-integers) (`CA.6/salem-number-near-integers`) | For every Salem number τ and every ε > 0 there is a real λ > 0 such that ‖λτⁿ‖ < ε for all n ∈ ℕ, where ‖x‖ = &#124;x − round x&#124; is the distance to the nearest integer. λ can be taken to be an algebraic integer of ℚ(τ). |
| [Powers of a Pisot number are near integers](ClassicalArithmeticCompletion.md#CA-6-pisot-number-pow-near-integer) (`CA.6/pisot-number-pow-near-integer`) | If θ is a Pisot number then ‖θⁿ‖ = &#124;θⁿ − round(θⁿ)&#124; → 0 as n → ∞; more precisely &#124;θⁿ − Tr(θⁿ)&#124; ≤ (d − 1)ρⁿ with d = deg θ, ρ < 1 the largest modulus of a conjugate other than θ, and Tr(θⁿ) ∈ ℤ. |
| [M(τ) = house(τ) = τ for Pisot and Salem numbers](ClassicalArithmeticCompletion.md#CA-6-mahler-measure-of-pisot-or-salem) (`CA.6/mahler-measure-of-pisot-or-salem`) | Let τ > 1 be a real algebraic integer all of whose other conjugates lie in the closed unit disc (a Pisot or a Salem number, CA.6/pisot-and-salem-numbers). Then M(τ) = τ and the house of τ (the largest modulus of a conjugate, DT.0/house-of-algebraic-number) equals τ. |
| [Reciprocal Pisot numbers are quadratic units](ClassicalArithmeticCompletion.md#CA-6-reciprocal-pisot-numbers) (`CA.6/reciprocal-pisot-numbers`) | If θ is a Pisot number conjugate to θ⁻¹, then minpoly ℤ θ = X² − aX + 1 for an integer a ≥ 3; so θ = (a + √(a² − 4))/2 ≥ (3 + √5)/2. |
| [The smallest Pisot number θ₀](ClassicalArithmeticCompletion.md#CA-6-plastic-number) (`CA.6/plastic-number`) | θ₀ = 1.3247179572… is the unique real root of X³ − X − 1 (the plastic number). As a declaration: the supremum of the set of real roots of x³ − x − 1, which is a singleton. |
| [Siegel's theorem: θ₀ is the smallest Pisot number](ClassicalArithmeticCompletion.md#CA-6-plastic-number-least-pisot) (`CA.6/plastic-number-least-pisot`) | Every Pisot number θ satisfies θ ≥ θ₀; θ₀ itself is a Pisot number. |
| [Lehmer's number τ₁₀](ClassicalArithmeticCompletion.md#CA-6-lehmer-number) (`CA.6/lehmer-number`) | Lehmer's number τ₁₀ = 1.1762808182… is the largest real root of Lehmer's polynomial L = X¹⁰ + X⁹ − X⁷ − X⁶ − X⁵ − X⁴ − X³ + X + 1. As a declaration: the supremum of the set of real roots of L (which is {τ₁₀⁻¹, τ₁₀}). |
| [Lehmer's number is a Salem number](ClassicalArithmeticCompletion.md#CA-6-lehmer-number-is-salem) (`CA.6/lehmer-number-is-salem`) | τ₁₀ is a Salem number and its minimal polynomial is L = X¹⁰ + X⁹ − X⁷ − X⁶ − X⁵ − X⁴ − X³ + X + 1; in particular deg τ₁₀ = 10 and M(τ₁₀) = τ₁₀. |
| [Mahler measure versus house](ClassicalArithmeticCompletion.md#CA-6-house-mahler-measure-comparison) (`CA.6/house-mahler-measure-comparison`) | Let α be an algebraic integer of degree d with r > 0 conjugates of modulus > 1. Then M(α)^{1/d} ≤ M(α)^{1/r} ≤ ⌈α⌉ ≤ M(α). |
| [Mahler measure of a unit versus the houses of α and α⁻¹](ClassicalArithmeticCompletion.md#CA-6-mahler-measure-of-unit-le-house) (`CA.6/mahler-measure-of-unit-le-house`) | Let α ≠ 0 be an algebraic unit (α and α⁻¹ algebraic integers) of degree d. Then M(α) = M(α⁻¹) and M(α) ≤ max(⌈α⌉, ⌈α⁻¹⌉)^{d/2}. |
| [⌈α⌉ ≥ 1 + h(α)](ClassicalArithmeticCompletion.md#CA-6-one-add-weil-height-le-house) (`CA.6/one-add-weil-height-le-house`) | For a nonzero algebraic integer α of degree d, ⌈α⌉ ≥ M(α)^{1/d} = exp(h(α)) ≥ 1 + h(α), where h(α) = log M(α)/d is the absolute logarithmic Weil height (Mathlib's NumberField.absLogHeight₁). Consequently any lower bound M(α) ≥ c₀ > 1 gives ⌈α⌉ ≥ 1 + log(c₀)/d. |
| [Algebraic numbers with M(α) < 2 are units](ClassicalArithmeticCompletion.md#CA-6-unit-of-mahler-measure-lt-two) (`CA.6/unit-of-mahler-measure-lt-two`) | If α is a nonzero algebraic number with M(α) < 2, then α and α⁻¹ are algebraic integers. |
| [Smyth's rational function F = P(0)P/P* has integer coefficients](ClassicalArithmeticCompletion.md#CA-6-smyth-integer-power-series) (`CA.6/smyth-integer-power-series`) | Let P ∈ ℤ[X] be monic with P(0) = ±1 and P* = X^d P(1/X) its reverse (so P*(0) = 1). Then F = P(0)·P/P* has a Maclaurin expansion with integer coefficients, F(0) = 1, and F is constant iff P is reciprocal (P* = ±P). |
| [Smyth's theorem: M(α) ≥ θ₀ for nonreciprocal α](ClassicalArithmeticCompletion.md#CA-6-smyth-nonreciprocal-lower-bound) (`CA.6/smyth-nonreciprocal-lower-bound`) | Let α be a nonzero algebraic integer that is not conjugate to α⁻¹. Then M(α) ≥ M(X³ − X − 1) = θ₀ = 1.3247…, and the constant is best possible (equality for α = θ₀). |
| [f(X)^p ≡ f(X^p) (mod p) for integer polynomials](ClassicalArithmeticCompletion.md#CA-6-frobenius-congruence-integer-polynomial) (`CA.6/frobenius-congruence-integer-polynomial`) | Let p be prime and f ∈ ℤ[X₁, …, Xₙ] (any index type). Then f^p − f(X₁^p, …, Xₙ^p) is divisible by p in ℤ[X₁, …, Xₙ]; in Mathlib's terms (p : MvPolynomial σ ℤ) ∣ f^p − expand p f. |
| [Power sums of roots: s_{np} ≡ s_n (mod p)](ClassicalArithmeticCompletion.md#CA-6-power-sum-frobenius-congruence) (`CA.6/power-sum-frobenius-congruence`) | Let P ∈ ℤ[X] be monic with complex roots α₁, …, α_d (with multiplicity) and sₙ = Σ αᵢⁿ. Then every sₙ is a rational integer, and for every prime p and n ≥ 0, s_{np} ≡ sₙ (mod p). |
| [Power sums determine a multiset in characteristic zero](ClassicalArithmeticCompletion.md#CA-6-multiset-eq-of-power-sums-eq) (`CA.6/multiset-eq-of-power-sums-eq`) | Let K be a field of characteristic 0 and s, t multisets in K of the same cardinality d. If Σ_{a∈s} a^k = Σ_{b∈t} b^k for k = 1, …, d, then s = t. |
| [If α^k and α^l are conjugate (k ≠ l) then α is 0 or a root of unity](ClassicalArithmeticCompletion.md#CA-6-conjugate-powers-root-of-unity) (`CA.6/conjugate-powers-root-of-unity`) | Let α be algebraic over ℚ in a field of characteristic 0 and k ≠ l positive integers with α^k and α^l conjugate over ℚ. Then α = 0 or αⁿ = 1 for some n ≥ 1. |
| [Dobrowolski's house bound ⌈α⌉ > 1 + 1/(4ed²)](ClassicalArithmeticCompletion.md#CA-6-dobrowolski-house-bound) (`CA.6/dobrowolski-house-bound`) | Let α be a nonzero algebraic integer of degree d that is not a root of unity. Then ⌈α⌉ > 1 + 1/(4ed²), e = exp(1). Equivalently: if ⌈α⌉ ≤ 1 + 1/(4ed²) then α = 0 or α is a root of unity. |
| [N(f_α(α^p)) is divisible by p^d](ClassicalArithmeticCompletion.md#CA-6-norm-minpoly-pow-prime-dvd) (`CA.6/norm-minpoly-pow-prime-dvd`) | Let K be a number field, α ∈ K an algebraic integer with minimal polynomial f_α = minpoly ℤ α, and p a prime. Then N_{K/ℚ}(f_α(α^p)) is a rational integer divisible by p^{[K:ℚ]} (for K = ℚ(α): by p^d, d = deg α). |
| [A prime p with F(α^p) ≠ 0 in a dyadic range](ClassicalArithmeticCompletion.md#CA-6-exists-prime-power-not-root) (`CA.6/exists-prime-power-not-root`) | Let α be a nonzero algebraic integer of degree d, not a root of unity, with deg(αⁿ) = d for all n ≥ 1. Let F ∈ ℤ[X] be nonzero of degree N with N/d ≥ 13, and x = 3(N/d) log(N/d). Then there is a prime p with x < p ≤ 2x and F(α^p) ≠ 0. |
| [Reduction when a power of α has smaller degree](ClassicalArithmeticCompletion.md#CA-6-degree-drop-mahler-measure) (`CA.6/degree-drop-mahler-measure`) | Let α be an algebraic integer of degree d with M(α) > 1, and suppose deg(αⁿ) < d for some n ≥ 1. Then there is an algebraic integer β with deg β < d and 1 < M(β) ≤ M(α). |
| [Dobrowolski's auxiliary polynomial](ClassicalArithmeticCompletion.md#CA-6-dobrowolski-auxiliary-polynomial) (`CA.6/dobrowolski-auxiliary-polynomial`) | Let α be an algebraic integer of degree d, and N, M positive integers with M ≥ 3, N ≥ 10 and dM < N/2. Then there is a nonzero F ∈ ℤ[X] of degree ≤ N with f_α^M ∣ F (α is a zero of multiplicity ≥ M) and max_i &#124;F_i&#124; ≤ N^{2dM²/N} M(α)^{2M}. |
| [Dobrowolski's lower bound for the Mahler measure](ClassicalArithmeticCompletion.md#CA-6-dobrowolski-lower-bound) (`CA.6/dobrowolski-lower-bound`) | Let α be a nonzero algebraic number of degree d ≥ 2 that is not a root of unity. Then M(α) ≥ 1 + (1/11700)·(log log d / log d)³. Here M(α) is the Mahler measure of the primitive minimal polynomial (DT.0), equal to absMulHeight₁(α)^d; equivalently d·h(α) ≥ log(1 + (1/11700)(log log d/log d)³). |
| [The polynomial P_m = ∏(X − αᵢ^m)](ClassicalArithmeticCompletion.md#CA-6-root-power-polynomial) (`CA.6/root-power-polynomial`) | For a commutative ring R, a monic P ∈ R[X] of degree n and m ∈ ℕ, P_m is the characteristic polynomial of multiplication by x^m on the free R-module R[x]/(P) of rank n (basis 1, x, …, x^{n−1}, AdjoinRoot.powerBasis'). If P = ∏(X − αᵢ) over a field containing the roots, then P_m = ∏(X − αᵢ^m); in particular P_m ∈ ℤ[X] for P ∈ ℤ[X] monic. |
| [Arnold–Smyth congruence P₄ ≡ P₂ (mod 4)](ClassicalArithmeticCompletion.md#CA-6-root-power-polynomial-congruence) (`CA.6/root-power-polynomial-congruence`) | For every monic P ∈ ℤ[X], P₄ − P₂ ∈ 4ℤ[X]. |
| [√(1 + 4Y) has integer coefficients](ClassicalArithmeticCompletion.md#CA-6-sqrt-one-add-four-integral) (`CA.6/sqrt-one-add-four-integral`) | There is T ∈ ℤ⟦Y⟧ with constant term 1 and T² = 1 + 4Y; explicitly T = 1 + 2Σ_{k≥0} (−1)^k C_k Y^{k+1} with C_k the Catalan numbers, equivalently T = Σ_k C(1/2, k) 4^k Y^k. |
| [Square roots with integer coefficients (Dimitrov Proposition 2.2)](ClassicalArithmeticCompletion.md#CA-6-integral-square-root-power-series) (`CA.6/integral-square-root-power-series`) | Let Q ∈ ℤ[X] with Q(0) = 1 and Q a square modulo 4 (Q = U² + 4V with U, V ∈ ℤ[X]). Then there is S ∈ ℤ⟦X⟧ with S(0) = 1 and S² = Q. In particular, for P ∈ ℤ[X] monic with P* = X^n P(1/X), √(P₂*·P₄*) ∈ 1 + Xℤ⟦X⟧. |
| [When P₂P₄ is a square (Dimitrov Lemma 2.3)](ClassicalArithmeticCompletion.md#CA-6-root-power-polynomial-square-cyclotomic) (`CA.6/root-power-polynomial-square-cyclotomic`) | Let P ∈ ℤ[X] be monic irreducible of degree n > 1 with P₂ not a perfect square. Then the following are equivalent: (i) P = Φ_N for N > 0 with 4 ∤ N; (ii) P₂ = P₄; (iii) P₂P₄ is a perfect square in ℤ[X]; (iv) P₂P₄ is a square in ℚ(X) (the function √(P₂P₄) is rational). |
| [Dimitrov's theorem: the Schinzel–Zassenhaus conjecture](ClassicalArithmeticCompletion.md#CA-6-schinzel-zassenhaus-dimitrov) (`CA.6/schinzel-zassenhaus-dimitrov`) | Let P ∈ ℤ[X] be monic irreducible of degree n > 1 and not cyclotomic. Then P has a complex root of modulus at least 2^{1/(4n)} = 1 + log 2/(4n) + O(1/n²). Equivalently, a nonzero algebraic integer α of degree n > 1 that is not a root of unity has ⌈α⌉ ≥ 2^{1/(4n)}. |
| [h(αⁿ) = n·h(α) for the absolute Weil height](ClassicalArithmeticCompletion.md#CA-6-abs-log-height-pow) (`CA.6/abs-log-height-pow`) | For every element α of a field of characteristic 0 and n ∈ ℕ, absLogHeight₁(αⁿ) = n·absLogHeight₁(α) (Mathlib's absolute logarithmic Weil height, junk value 0 at transcendental α). |
| [Kronecker's theorem for the Weil height](ClassicalArithmeticCompletion.md#CA-6-weil-height-eq-zero-iff) (`CA.6/weil-height-eq-zero-iff`) | An algebraic number α (in a field of characteristic 0) has h(α) = 0 iff α = 0 or α is a root of unity. |
| [The canonical height of the power map is the Weil height](ClassicalArithmeticCompletion.md#CA-6-canonical-height-power-map) (`CA.6/canonical-height-power-map`) | Let d ≥ 2 and f(x) = x^d on P¹. For every α (in a field of characteristic 0), d^{−n} h(f^{∘n}(α)) = h(α) for all n, so Tate's limit defining the canonical height exists and ĥ_f(α) = h(α), which equals log M(α)/deg α for algebraic α (for transcendental α both sides are Mathlib's junk value 0); also ĥ_f(∞) = 0 = h(∞). Consequently, for algebraic α, ĥ_f(α) = 0 iff α is 0 or a root of unity, and ĥ_f(∞) = 0 (these are the preperiodic points of f), and the dynamical Lehmer problem for f is Lehmer's problem. |

## Library boundary

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` are the signature baseline. Current Tau Ceti and the current TauCetiRoadmap main, including Completed ContourIntegration and EffectiveBounds, were also checked for overlap. Completed ContourIntegration supplies the contour framework; the pinned Tau Ceti homology Cauchy theorems, for one closed curve and for cycles, are the concrete analytic baseline used below. Existing OperatorTheory and DifferentialGeometry do not supply these specialized capacity or rationality criteria.

| Existing declaration | Input used here |
| --- | --- |
| `mathlib:PowerSeries.mk` | Formal series with a prescribed coefficient sequence; coeff_mk identifies those coefficients. |
| `mathlib:PowerSeries.coeff_mul` | The coefficient of a product is the finite convolution over the antidiagonal. |
| `mathlib:Polynomial.coeff_coe` | Polynomial-to-power-series coercion preserves every coefficient. |
| `mathlib:Complex.norm_deriv_le_one_of_mapsTo_ball` | Schwarz derivative bound at the centre, with DifferentiableOn, a MapsTo closed-ball hypothesis and positive radius. |
| `tauceti:TauCeti.norm_deriv_div_one_sub_norm_sq_le` | Infinitesimal Schwarz–Pick for holomorphic maps from the open unit disc to itself. |
| `mathlib:hasSum_sq_fourierCoeffOn` | Parseval for MemLp functions on (a,b], normalized by 1/(b−a); coefficients indexed by integers. |
| `mathlib:DifferentiableOn.hasFPowerSeriesOnBall` | Cauchy power series on an open ball from complex differentiability on its closed ball and positive radius. |
| `mathlib:IsCompact.exists_isMaxOn` | A continuous real-valued function attains its maximum on a nonempty compact set. |
| `mathlib:Matrix.det` | Determinant of a finite square matrix over a commutative ring. |
| `mathlib:Matrix.det_apply` | The Leibniz sum over permutations; supplies the determinant norm estimate. |
| `mathlib:Matrix.det_mul` | Multiplicativity of the determinant; used for monic changes of basis. |
| `mathlib:Polynomial.resultant` | Sylvester determinant with explicit size parameters; polynomial norms over a monic finite map are obtained from it. |
| `tauceti:TauCeti.Contour.homologyCauchyTheorem` | Contour integral vanishing for a closed piecewise C1 curve null-homologous in an open holomorphy domain. |
| `mathlib:Complex.differentiableAt_log` | Principal complex log is differentiable at points of slitPlane. |
| `mathlib:Complex.exp_log` | exp(log z)=z for z≠0; used to square the chosen analytic branch. |
| `mathlib:IsIntegral.of_pow` | Integrality of a positive power implies integrality of the element. |
| `mathlib:IsIntegral.multiset_prod` | Finite products of integral elements are integral. |
| `mathlib:Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots` | For a complex polynomial, Mahler measure is leading-coefficient norm times the root product of max(1, root norm). |
| `mathlib:roots_mem_integralClosure` | Every aroot of a monic polynomial lies in the integral closure of its coefficient ring. |
| `mathlib:IsIntegral.mul` | Products of two integral elements in a commutative algebra remain integral. |
| `mathlib:StarConvex.contractibleSpace` | A nonempty real star-convex set, as a subtype, is contractible. |
| `mathlib:ContinuousMap.HomotopyEquiv.simplyConnectedSpace` | A homotopy equivalence transports simply connectedness; use the contraction equivalence with Unit for these star-convex domains. |
| `mathlib:MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul` | Nonnegative change of variables for an injective differentiable map on a measurable set, using the absolute real determinant. |
| `mathlib:Polynomial.Chebyshev.leadingCoeff_T` | The leading coefficient of T_n is 2^(|n|−1) over a domain where 2 is nonzero. |
| `mathlib:Polynomial.Chebyshev.T_real_cos` | The real polynomial T_n evaluated at cos θ is cos(nθ); gives the alternating extrema on [−1,1]. |
| `tauceti:TauCeti.unitDiscMoebius` | The unit-disc Möbius factor (z−a)/(1−conj(a)z), on Complex.UnitDisc; its scalar formula is used off the subtype when needed. |
| `tauceti:TauCeti.mapsTo_ball_unitDiscMoebiusFormula_of_norm_lt_one` | For |a|<1 the scalar Möbius formula maps the open unit disc into itself. |
| `tauceti:TauCeti.hasDerivAt_unitDiscMoebiusFormula` | Derivative of the scalar disc factor at every point where its denominator is nonzero; extends holomorphy through the closed disc for |a|<1. |
| `tauceti:TauCeti.IsNormalizedRiemannMapOn` | Existing pointed holomorphic bijection to the unit disc with positive real derivative. |
| `tauceti:TauCeti.exists_isNormalizedRiemannMapOn` | Existence of an already normalized map on a proper simply connected open domain at a specified point. |
| `tauceti:TauCeti.IsNormalizedRiemannMapOn.eqOn` | Two normalized maps on the same open pointed domain agree there; only on-domain uniqueness is asserted. |
| `mathlib:Complex.norm_canonicalFactor_eval_circle_eq_one` | Canonical factors have modulus one on a circle when their pole is strictly inside; the reciprocal at radius one is the scalar disc factor. |
| `mathlib:ContinuousMap.norm_eq_iSup_norm` | On a compact domain, the continuous-map norm equals the supremum of its pointwise norms; polynomial sup norm is this existing norm after restriction to K. |
| `mathlib:segment_eq_image` | A real affine segment is the image of [0,1] under (1−t)x+ty; fixes compatibility of the complex radial segment with the existing real segment. |
| `mathlib:RingHom.map_det` | A ring homomorphism maps a determinant to the determinant of the entrywise image matrix. |
| `mathlib:Complex.hasSum_taylorSeries_on_ball` | A function complex differentiable on an open ball is the sum of its Taylor series at the centre, at every point of that ball; no closed-ball hypothesis. |
| `mathlib:Complex.norm_dslope_le_div_of_mapsTo_ball` | Schwarz lemma in difference-quotient form: a map of ball c R₁ into closedBall (f c) R₂ has ‖dslope f c z‖ ≤ R₂/R₁ on the ball. |
| `mathlib:Complex.eqOn_of_isPreconnected_of_isMaxOn_norm` | Maximum modulus principle: a holomorphic function on a preconnected open set whose norm attains its maximum there is constant on the set. |
| `mathlib:Complex.norm_le_of_forall_mem_frontier_norm_le` | Maximum modulus principle on a bounded set for a function differentiable on it and continuous on its closure: a bound on the frontier holds on the closure. |
| `mathlib:isIntegral_algebraMap_iff` | Integrality is detected after an injective algebra map (here ℝ → ℂ over ℤ). |
| `mathlib:Polynomial.Chebyshev.leadingCoeff_le_of_forall_abs_le_one` | A real polynomial of degree at most n bounded by 1 on [−1,1] has leading coefficient at most 2^(n−1): the extremal property of the Chebyshev polynomial. |
| `mathlib:Polynomial.resultant_eq_prod_eval` | For split f, Res(f,g) with size parameters natDegree f and n ≥ natDegree g equals leadingCoeff(f)^n times the product of g over the roots of f. |
| `mathlib:DifferentiableAt.clog` | The principal logarithm of a differentiable function is differentiable at points where the function lies in slitPlane. |
| `tauceti:DifferentiableOn.invFunOn` | An injective holomorphic function on an open set has a holomorphic inverse Function.invFunOn on its image. |
| `tauceti:TauCeti.lintegral_image_eq_lintegral_enorm_deriv_sq_mul` | Holomorphic change of variables for nonnegative integrals: on the image of an injective holomorphic map the area factor is ‖deriv f‖². |
| `tauceti:TauCeti.Contour.Cycle.homologyCauchyTheorem` | Cauchy’s theorem for a cycle (a formal sum of closed piecewise C1 curves) in an open set, null-homologous there; covers deforming one contour into another. |

The [suggested file](../suggested/ClassicalArithmeticCompletion--CA.6.lean) states the light definitions and end theorems using existing carriers. Finite angular partitions, variational condenser capacity and the geometric enclosure/branch constructions are mathematical targets above; they are not simulated by empty predicates or unfinished data definitions. The Markdown carries all 69 planning API items and 46 checks.

## Corrected source conventions

Bertrandias’s inverse-image notation in 1.4.5, p. 2 is interpreted with membership P(z)∈A. His multiplicative lemniscate approximation in 1.4.6, p. 2 needs d(A)>0; the additive enclosure here works for capacity-zero sets too. In Iribar López’s §2 proof, pp. 2–3, use the actual anti-diagonal reversal signs, the index 2r+d and a homogeneous zero-right-side recurrence after adjoining c_r=−1. These corrections are recorded individually in the packet, with version and search receipts, and the independent review confirmed each on the page images. They preserve Kronecker’s criterion. Two reading conventions matter as well. Bertrandias’s theorem in §2.1, p. 6, and its proof in §2.6 concern a non-archimedean field; his archimedean bound in §3.1 is quoted, and Kronecker’s criterion itself is taken from Iribar López. Bertrandias and Dimitrov assume a connected complement, which the lemniscate-contour argument here does not need.

## Coverage and remaining inputs

This planning pass is complete. CA.6 is planned, with no claim that its proof obligations are closed. The parent’s 32-entry review frontier is a historical ledger: read each latest assessment before treating a finding as unresolved. This part preserves that ledger and the corrected parent contracts.

### Smyth short-gap multiplier verification

The public author-uploaded Smyth 1971 PDF extraction supplies the prose and final condition 40c⁴−93c²+40≥0, but omits the two displayed three-term multipliers and their exact selected-coefficient Parseval inequalities in §4, pp. 172–173. Obtain readable pages, verify the parameters and completing-square step giving that quartic under 3/4≤c<(√17−1)/4, k<l<2k, and record the exact inequalities in own words. The independent review could not obtain the article either (ResearchGate and Wiley refused access on 2026-10-14); Smyth’s 2008 survey (§5.1) and Pathiaux’s seminar note (Séminaire Delange–Pisot–Poitou 15 (1973–74), exposé G6, Numdam item SDPP_1973-1974__15_2_A4_0) outline the method without these inequalities. A numerical exploration by the review (minimizing, over the free coefficients, the larger operator norm of the two truncated lower-triangular Toeplitz matrices, with bisection in c) bounds what the step needs: for (k,l)=(2,3) and (3,4) the full finite Schur criterion for both coefficient sequences already forces c below about 0.734 and 0.739, consistent with the quartic, whereas the compressions of the two Toeplitz matrices to rows 0, l−k, k, l and columns 0, l−k, k (three-term multipliers 1, z^(l−k), z^k) allow c up to about 0.763; so Smyth’s multipliers must use further coefficients or a different selection of outputs. The independently derived Schur bounds, quotient coupling, long-gap cubic and quartic-to-plastic comparison do not close this step.

Needed by: `ClassicalArithmeticCompletion:CA.6/smyth-short-gap-condition`; `ClassicalArithmeticCompletion:CA.6/smyth-analytic-input`; `ClassicalArithmeticCompletion:CA.6/smyth-nonreciprocal-lower-bound`; `ClassicalArithmeticCompletion:CA.6/plastic-number-least-pisot`.

### Inherited trace and stronger small-height contracts

Retain the parent’s Smith 1–3 trace-ratio, finite-exception threshold and coprime auxiliary-resultant input; its BKK 69 contract requires an asymptotic Dobrowolski constant and uniform bounded-degree completion stronger than 1/11700; BKK 70 requires a count of degree-dropping primes. None is supplied by the present analytic input nodes. Import the exact parent gap contracts; do not reintroduce λ_SSS=2 as a current conjecture or theorem.

Needed by: `ClassicalArithmeticCompletion:CA.6`.

### Inherited explicit dyadic prime count

For real x≥41/2, supply π(2x)−π(x)>3x/(5 log x), with the parent’s prime-count convention. This remains CA.6-owned under the tier rule; the parent records but does not verify the Rosser–Schoenfeld attribution. The already corrected Dobrowolski rounding and 1/11700 calculation are not reopened here.

Needed by: `ClassicalArithmeticCompletion:CA.6/exists-prime-power-not-root`.

### Imported mathematical interfaces outside the analytic continuation scope

For each historical frontier target consult the parent’s latest reviewAssessment and revisionResponse. Genuine remaining carrier, separability, embedding, recurrence, unit and height interfaces remain imported obligations; demands merely for smaller auxiliary nodes and findings explicitly resolved locally are not new gaps. This analytic pass does not certify all imported proofs or the projective point-at-infinity signature of the power-map height computation. In particular the remaining projective contract must name an actual P¹ carrier, the power map [x:y]↦[x^d:y^d] for d≥2, and ∞=[1:0]; prove that ∞ is fixed, its projective logarithmic height is 0, and its Tate-limit sequence is constantly 0. The affine constant-sequence and preperiodic signatures already in the parent are not missing suppliers, and no upward ArithmeticDynamics dependency is introduced.

Needed by: `ClassicalArithmeticCompletion:CA.6/salem-number`; `ClassicalArithmeticCompletion:CA.6/pisot-and-salem-numbers`; `ClassicalArithmeticCompletion:CA.6/reciprocal-iff-reverse`; `ClassicalArithmeticCompletion:CA.6/salem-number-conjugates`; `ClassicalArithmeticCompletion:CA.6/salem-number-pow`; `ClassicalArithmeticCompletion:CA.6/pisot-number-pow`; `ClassicalArithmeticCompletion:CA.6/salem-number-iff-trace`; `ClassicalArithmeticCompletion:CA.6/salem-number-in-field`; `ClassicalArithmeticCompletion:CA.6/salem-number-near-integers`; `ClassicalArithmeticCompletion:CA.6/pisot-number-pow-near-integer`; `ClassicalArithmeticCompletion:CA.6/mahler-measure-of-pisot-or-salem`; `ClassicalArithmeticCompletion:CA.6/reciprocal-pisot-numbers`; `ClassicalArithmeticCompletion:CA.6/plastic-number`; `ClassicalArithmeticCompletion:CA.6/plastic-number-least-pisot`; `ClassicalArithmeticCompletion:CA.6/lehmer-number`; `ClassicalArithmeticCompletion:CA.6/lehmer-number-is-salem`; `ClassicalArithmeticCompletion:CA.6/mahler-measure-of-unit-le-house`; `ClassicalArithmeticCompletion:CA.6/unit-of-mahler-measure-lt-two`; `ClassicalArithmeticCompletion:CA.6/smyth-integer-power-series`; `ClassicalArithmeticCompletion:CA.6/smyth-nonreciprocal-lower-bound`; `ClassicalArithmeticCompletion:CA.6/power-sum-frobenius-congruence`; `ClassicalArithmeticCompletion:CA.6/conjugate-powers-root-of-unity`; `ClassicalArithmeticCompletion:CA.6/exists-prime-power-not-root`; `ClassicalArithmeticCompletion:CA.6/degree-drop-mahler-measure`; `ClassicalArithmeticCompletion:CA.6/dobrowolski-auxiliary-polynomial`; `ClassicalArithmeticCompletion:CA.6/dobrowolski-lower-bound`; `ClassicalArithmeticCompletion:CA.6/root-power-polynomial`; `ClassicalArithmeticCompletion:CA.6/root-power-polynomial-congruence`; `ClassicalArithmeticCompletion:CA.6/integral-square-root-power-series`; `ClassicalArithmeticCompletion:CA.6/root-power-polynomial-square-cyclotomic`; `ClassicalArithmeticCompletion:CA.6/schinzel-zassenhaus-dimitrov`; `ClassicalArithmeticCompletion:CA.6/canonical-height-power-map`.

### Resolved supplier request

The inherited supplier request to `DiophantineApproximationAndTranscendence:DT.0` for the product form of Siegel’s lemma over a number field, with rational-integer unknowns (Berrevoets, Lemma 3.2), is satisfied by `DiophantineApproximationAndTranscendence:DT.0/siegel-lemma-number-field-product`. That accepted node states exactly the requested bound, with M≥0 allowed. `ClassicalArithmeticCompletion:CA.6/dobrowolski-auxiliary-polynomial` applies it with N+1 unknowns, so its exponent is 1/(N+1−dM). The DT package README predates the node, so the CA package must cite a DT layer that contains it or state it itself.

### Duplicates in roadmaps outside the tier order

Two roadmaps that are not in the tier order define notions planned here. `LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1/transfinite-diameter` restates the Fekete diameters and transfinite diameter of [Finite Fekete diameters and transfinite diameter](#finite-fekete-diameter). `ConformalMappingPartII:U0/conformal-radius` gives, on proper simply connected domains, the number defined in [Conformal radius using the existing normalized map](#normalized-conformal-radius). This tier-5 plan cannot cite either roadmap, so CA.6 keeps both notions. The packet records restructure proposals asking those roadmaps to import or compare with the CA.6 nodes.

## References

- [C. J. Smyth, *On the Product of the Conjugates outside the unit circle of an Algebraic Integer*][smyth-1971]. Bulletin of the London Mathematical Society 3 (1971), 169–175; published article in an author-uploaded scan (2014). Read 14 October 2026.
- [C. J. Smyth, *The Mahler measure of algebraic numbers: a survey*][smyth-survey-2008]. In Number Theory and Polynomials, London Math. Soc. Lecture Note Ser. 352, Cambridge University Press (2008), 322–349; author preprint arXiv:math/0701397v2 (28 January 2008), which prints the published page numbers. Read 14 October 2026.
- [Vesselin Dimitrov, *A proof of the Schinzel–Zassenhaus conjecture on polynomials*][dimitrov-2019]. arXiv:1912.12545v1 (28 December 2019); 27-page preprint. Read 14 October 2026.
- [Françoise Bertrandias, *Diamètre transfini dans un corps valué. Application au prolongement analytique*][bertrandias-1964]. Séminaire Delange–Pisot–Poitou 5 (1963–1964), exposé 3, printed pp. 1–13; Numdam published scan. Read 14 October 2026.
- [E. B. Saff, *Logarithmic Potential Theory with Applications to Approximation Theory*][saff-2010]. Surveys in Approximation Theory 5 (2010), 165–200; author preprint arXiv:1010.3760. Read 14 October 2026.
- [V. N. Dubinin, *On the change in harmonic measure under symmetrization*][dubinin-1985]. Mathematics of the USSR-Sbornik 52 (1985), no. 1, 267–273; English translation of Mat. Sb. 124(166) (1984), 277–286. Read 14 October 2026.
- [Aitor Iribar López, *The Carlson-Pólya theorem on rational functions*][iribar-kronecker]. Undated author notes hosted at ETH Zürich; 36-page PDF including an appendix; §2 checked as page images. Read 14 October 2026.

[smyth-1971]: https://www.researchgate.net/profile/Christopher-Smyth-2/publication/247044379_On_the_Product_of_the_Conjugates_outside_the_unit_circle_of_an_Algebraic_Integer/links/542c18260cf277d58e8ac7ac/On-the-Product-of-the-Conjugates-outside-the-unit-circle-of-an-Algebraic-Integer.pdf
[smyth-survey-2008]: https://arxiv.org/pdf/math/0701397v2
[dimitrov-2019]: https://arxiv.org/pdf/1912.12545v1
[bertrandias-1964]: https://www.numdam.org/item/SDPP_1963-1964__5__A3_0.pdf
[saff-2010]: https://arxiv.org/pdf/1010.3760
[dubinin-1985]: https://www.mathnet.ru/php/getFT.phtml?jrnid=sm&paperid=2051&what=fullteng
[iribar-kronecker]: https://people.math.ethz.ch/~airibar/Polya_Carlson.pdf
