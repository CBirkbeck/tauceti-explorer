# Arithmetic Dirichlet series and Tauberian methods, Part II

This continuation develops the integer-pole Delange theorem needed for nonnegative arithmetic counting sequences. It separates ordinary Laplace integration from Dirichlet-series summation, builds a polynomial regularizer and squared-sine smoothing, and proves the monotonicity step that recovers the leading asymptotic. The resulting counting interface retains the full boundary continuation hypotheses, the factorial constant and the positive-abscissa factor 1/a. Finite alterations and lower-pole dominated errors preserve that leading term. Wood’s arithmetic constructions remain with ArithmeticStatistics.

The parent is [ArithmeticDirichletSeries](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries), after its Layer 9 (`tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-9-wienerikehara`). Use its LSeries vocabulary, inclusive cutoffs and named boundary extensions. The pinned libraries already supply generic summatory functions, arithmetic convolution, Gamma integrals, Laurent expansions and Fourier decay. This roadmap builds the higher-pole argument; its k=0 specialization agrees with the parent simple-pole theorem. Euler products, ideal carriers and the parent Wiener–Ikehara theorem are imports.

Write m=k+1 with k∈ℕ. Coefficients live on ℕ, with the n=0 term ignored as in Mathlib LSeries.term. S_c(X) is the existing TauCeti.summatory for the identity norm, applied to the weight that is zero at 0 and c_n for n>0. Thus S_c is inclusive and S_c(1)=c_1. Complex integrals are ordinary Bochner integrals with respect to Lebesgue measure. The Laplace assertion includes integrability. All pole identities concern the open half-plane; analytic extensions supply boundary germs, without evaluating a divergent total LSeries on that line.

For a>0 and a pole of order m with leading coefficient A>0, the export is S_c(X)∼A X^a(log X)^(m−1)/(a(m−1)!). At a=1 this is the required Wood counting interface. ArithmeticStatistics ST.3 supplies Wood’s local factors, continuation, positivity and the majorant for lower-rank images; it consumes this theorem and contributes no analytic prerequisite. Real exponents, logarithmic branch singularities and the case a=0 lie outside the integer-pole scope.

## Library baseline and dependencies

Prototype at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The library names below denote imports rather than implementation targets. The suggested namespace is `TauCeti.HigherPoleTauberian`, in `TauCeti/NumberTheory/LSeries/HigherPole`.

Use `LSeriesHasSum` and `LSeries.term`; `TauCeti.summatory`, `summatory_mono`, `summatory_nonneg` and `eventually_summatory_sub_eq`; `Real.sinc`, its continuity and bound; `Real.Gamma_nat_eq_factorial` and `Real.integral_rpow_mul_exp_neg_mul_Ioi`; Bochner Fubini, dominated convergence and `integral_tsum`; and `Real.tendsto_integral_exp_smul_cocompact`. `TauCeti.Contour.exists_laurent_data_of_meromorphicAt` supplies finite principal parts. `TauCeti.Contour.tendsto_integral_sin_mul_div_atTop` supplies the improper sine-integral limit, not a Lebesgue integral of sinc. Mathlib zeta continuation, its residue and arithmetic convolution supply the acceptance examples.

## Layer HP.0: Convergent transforms and boundary continuation

Prerequisites: `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-9-wienerikehara`.

### Convergent Laplace integral

`HasLaplace`. HasLaplace α s z means that t ↦ exp(−st)α(t), with α(t) cast to ℂ, is Bochner integrable on [0,∞) and its integral is z. α is a total real-valued function; no condition is imposed at negative t.

API:

- `HasLaplace.unique`: Two HasLaplace values at the same α and s coincide.
- `HasLaplace.congr`: Equality almost everywhere for volume restricted to [0,∞) preserves HasLaplace.
- `HasLaplace.add`: Transforms z,w at s add to z+w for α+β.
- `HasLaplace.smul`: For real c, the transform of cα is cz.
- `HasLaplace.dilate`: If c>0 and α has transform z at s/c, then t ↦ α(ct) has transform z/c at s.

Unit tests:

- `HasLaplace_test_zero`: α=0 has transform 0 at every complex s.
- `HasLaplace_test_constant`: α=1 has transform 1/s when Re(s)>0.
- `HasLaplace_test_quadratic`: α(t)=t² has transform 2/s³ for Re(s)>0, fixing the factorial convention.
- `HasLaplace_test_nonintegrable`: HasLaplace (constant 1) 0 0 is false; a junk-valued integral is not a transform.

Construction or proof:

1. Use the existing restricted-volume Bochner integral; integrability is part of the predicate, so its totalized value cannot witness a divergent transform.
1. Uniqueness, addition and real scaling follow from the Bochner integral API. A positive change of variable proves dilation; an almost-everywhere change on the half-line preserves the predicate.

Acceptance: The constant-one function has transform 1/s on Re(s)>0; at s=0 it is not integrable.

Source: DEL54, Standing hypotheses p.213; §3.3.1, pp.221–222. The argument uses ordinary Laplace integration of the counting function, rather than a Stieltjes transform. The predicate records exactly that convergence.

### Boundary continuation and pole numerator

`PoleBoundary`. PoleBoundary F a k A consists of: F analytic on Re(s)>a; a radius r>0 and g analytic on the ball about a such that g(a)=A and F(s)=g(s)/(s−a)^(k+1) on its intersection with Re(s)>a; and, for each real y≠0, a radius r_y>0 and an analytic g_y about a+iy agreeing with F on the corresponding right-half-plane intersection. k is natural. A≠0 makes the pole order exactly k+1; the main theorems require A>0. Values assigned to F on the boundary carry no meaning.

API:

- `PoleBoundary.congr`: Equality on Re(s)>a preserves the predicate; no boundary equality is needed.
- `PoleBoundary.leading_unique`: For fixed F,a,k, two leading coefficients A,B coincide.
- `PoleBoundary.order_unique`: For fixed F,a and nonzero leading coefficients, two indices k,l coincide.
- `PoleBoundary.div_argument`: For a>0, PoleBoundary F a k A implies PoleBoundary (F(s)/s) a k (A/a).
- `PoleBoundary.rescale`: For a>0, F(as) satisfies PoleBoundary at 1 with leading A/a^(k+1).
- `PoleBoundary.mul_regular`: If H is analytic near every point of Re(s)≥a and H(a)=C is real, FH satisfies PoleBoundary with leading AC.

Unit tests:

- `PoleBoundary_test_model`: F(s)=A/(s−a)^(k+1) satisfies the predicate for all real a,A and natural k.
- `PoleBoundary_test_wrong_leading`: F(s)=1/(s−1) does not have index k=0 and leading coefficient 2.
- `PoleBoundary_test_boundary_value`: Setting F(1)=37 while retaining F(s)=1/(s−1) elsewhere still gives PoleBoundary at a=1,k=0,A=1.
- `PoleBoundary_test_dyadic`: F(s)=1/(1−exp((1−s)log 2)) does not satisfy the full predicate at a=1,k=0,A=1/log 2, because of the other poles on the boundary line.
- `PoleBoundary_test_zero_not_exact`: F=0 cannot satisfy PoleBoundary with A≠0.

Construction or proof:

1. Express each extension using AnalyticOnNhd and an explicit agreement domain. A local holomorphic remainder is absorbed into the numerator.
1. Use uniqueness of analytic germs on the intersection to obtain unique leading coefficient and, when nonzero, pole order.
1. Multiplication by a regular function multiplies the leading coefficient. Division by the argument is valid for a>0 and changes A to A/a. Rescaling s ↦ as moves the line to Re(s)=1 and changes A to A/a^(k+1).

Acceptance: Boundary values of F can be changed arbitrarily without changing PoleBoundary. Positivity belongs to the main theorem, not to the carrier.

Source: DEL54, §5.2.1 Theorem III, pp.235–238; standing hypotheses p.213. The integer specialization needs holomorphic extensions at every other point of the line and an analytic numerator at the pole. A one-sided real limit does not supply these hypotheses.

## Layer HP.1: Squared-sine smoothing and polynomial weights

Prerequisites: `ArithmeticDirichletSeriesPartII:HP.0`.

### Normalized squared-sinc kernel

`squaredSinc`. For real λ,v set K_λ(v)=squaredSinc λ v=(λ/π) sinc(λv)², using Mathlib Real.sinc(0)=1. Its analytic and probability assertions assume λ>0. Angular Fourier frequency y is used: K_λ(v)=(1/(2π))∫_(−2λ)^(2λ)(1−|y|/(2λ))exp(iyv)dy.

API:

- `squaredSinc_nonneg`: K_λ(v)≥0 for λ>0 and all real v.
- `squaredSinc_even`: K_λ(−v)=K_λ(v).
- `squaredSinc_continuous`: K_λ is continuous for every real λ.
- `squaredSinc_integrable`: K_λ is Lebesgue integrable on ℝ for λ>0.
- `squaredSinc_mass`: For λ>0, ∫ℝ K_λ=1.
- `squaredSinc_fourier`: The angular-frequency triangular integral in the definition statement equals K_λ, as a complex-valued equality.
- `squaredSinc_tail`: For h>0, ∫_(|v|≥h)K_λ(v)dv tends to 0 as λ tends to infinity.

Unit tests:

- `squaredSinc_test_origin`: For λ>0, K_λ(0)=λ/π.
- `squaredSinc_test_zero`: For λ>0, K_λ(π/λ)=0.
- `squaredSinc_test_mass_two`: ∫ℝ K_2=1, detecting a missing scaling or π factor.

Construction or proof:

1. Use the existing sinc function, its continuity and bound near zero. Away from zero the square is bounded by a constant times v^(−2), giving integrability.
1. Compute mass by integration by parts on a finite positive interval, reducing to the pinned improper sine-integral limit; evenness gives the full integral. There is no use of a Lebesgue integral of unsquared sinc.
1. Integrate the triangular frequency weight explicitly, including v=0 by continuity. Scaling and integrability give vanishing tails outside every fixed neighbourhood as λ tends to infinity.

Acceptance: The continuous value at zero and frequency endpoint 2λ are fixed; this is a kernel on ℝ, distinct from the finite-circle Fejér expression in the sieve roadmap.

Source: DEL54, §3.3.3–3.3.5, pp.222–224; §3.4, pp.225–227. The proof uses the square of the sine quotient with compact triangular frequency support. Here it is normalized to mass one, so the smoothing limit is a coefficient rather than π times that coefficient.

### Polynomial Laplace regularization weight

`delangeWeight`. For k∈ℕ and t∈ℝ define w_k(t)=delangeWeight k t=t∫_0^1 exp(−ut)u^k/k! du. It is zero at t=0, positive for t>0, and satisfies w_k(t)t^k→1 as t→∞. Its definition is total; positivity and upper bounds are asserted only for t≥0.

API:

- `delangeWeight_nonneg`: w_k(t)≥0 for t≥0.
- `delangeWeight_pos`: w_k(t)>0 for t>0.
- `delangeWeight_normalization`: w_k(t)t^k→1 as t→∞.
- `delangeWeight_shift`: For each fixed h∈ℝ, w_k(t+h)/w_k(t)→1.
- `delangeWeight_bound`: For t≥0, w_k(t)t^k≤1.

Unit tests:

- `delangeWeight_test_origin`: w_k(0)=0 for every k.
- `delangeWeight_test_simple`: w_0(t)=1−exp(−t) for every real t.
- `delangeWeight_test_double`: t w_1(t)=1−(1+t)exp(−t) for every real t.
- `delangeWeight_test_triple`: t²w_2(t)=1−(1+t+t²/2)exp(−t) for every real t, detecting the 2! normalization.

Construction or proof:

1. Change variable x=ut. For t>0, w_k(t)t^k=(1/k!)∫_0^t exp(−x)x^k dx.
1. Use the real Gamma integral and Γ(k+1)=k! to obtain normalization and the bound ≤1.
1. The normalization and (t+h)^k/t^k→1 yield w_k(t+h)/w_k(t)→1 for every fixed real h. The first two cases follow by elementary integration.

Acceptance: The weight is not identically t^(−k) near the origin; the vanishing at zero makes the ordinary integral regularizer precise.

Source: DEL54, §3.1–3.2, pp.220–221; §5.1.1 Lemma 3, pp.231–232; §5.2.1, p.237. Specializing the source regularizer to integer powers gives this explicit Gamma-normalized weight. The cutoff 1 is a positive fixed cutoff; the argument and limit are independent of its particular positive value.

## Layer HP.2: Regularized transforms and smoothed limits

Prerequisites: `ArithmeticDirichletSeriesPartII:HP.0`, `ArithmeticDirichletSeriesPartII:HP.1`.

### Integer Gamma Laplace model

`integerGammaLaplace`. For k∈ℕ, a∈ℝ and complex s with Re(s)>a, the function α(t)=exp(at)t^k has HasLaplace value k!/(s−a)^(k+1).

Hypotheses: Re(s)>a.

Construction or proof:

1. The norm is exp(−(Re(s)−a)t)t^k, integrable by the real Gamma integral.
1. Start with the pinned complex exponential integral at k=0; repeated integration by parts proves the formula for every integer k. Exponential decay removes each endpoint at infinity.
1. Thus β(t)=(A/k!)exp(at)t^k has transform A/(s−a)^(k+1), with no truncation error or choice of complex powers.

Acceptance: For k=0 the transform is 1/(s−a); for k=1 it is 1/(s−a)².

Source: DEL54, §5.1.2 Lemma 4, pp.232–233; §5.2.1, pp.236–237. The Gamma model identifies the pole term with its ordinary Laplace inverse. Only positive integer pole orders are needed here.

Internal inputs: `ArithmeticDirichletSeriesPartII:HP.0/laplace`.

### Locally integrable regularized boundary

`regularizedBoundaryL1`. Assume PoleBoundary F a k A. Set R(s)=F(s)−A/(s−a)^(k+1) on Re(s)>a and H(s)=−∫_0^1 R′(s+u)u^k/k! du. There is b:ℝ→ℂ such that, for every L>0, b is integrable on [−L,L] and ∫_(−L)^L |H(a+ε+iy)−b(y)|dy→0 as ε↓0. All derivative evaluations in this limit have ε>0.

Hypotheses: PoleBoundary F a k A; k∈ℕ; no positivity or Laplace representation is needed for this analytic lemma.

Construction or proof:

1. Apply the existing Laurent decomposition to the local analytic numerator quotient, not to the arbitrary boundary values of F. Subtracting the leading term leaves poles of orders at most k and a holomorphic remainder.
1. Differentiate each remaining term and integrate u^k R′(a+ε+iy+u). Near y=0 this is bounded uniformly in ε>0 by C(1+|log|y||), because the worst denominator has power k+1. For k=0 the remainder is regular. The majorant is locally integrable.
1. Away from zero, boundary germs and compactness of the u interval give ordinary convergence and a uniform bound. Patch a finite cover of each y interval.
1. Define b by the limit away from zero, assigning any finite value at zero. Apply dominated convergence to the norm of the difference; the logarithmic majorant gives L1 convergence.

Acceptance: A lower pole of order k produces at most logarithmic boundary growth after regularization, rather than an unintegrable power.

Source: DEL54, §3.3.1–3.3.2, pp.221–222; §4.1, pp.228–229; §5.2.1, pp.237–238. This is the holomorphic-boundary specialization of the regularized transform step. It replaces the source broader boundary-limit machinery by compact L1 convergence under the stronger hypotheses used in this roadmap.

Internal inputs: `ArithmeticDirichletSeriesPartII:HP.0/boundary`, `ArithmeticDirichletSeriesPartII:HP.1/weight`.

### Higher-pole smoothed counting limit

`delangeSmoothedLimit`. Let a>0, k∈ℕ and A∈ℝ. Let α be nonnegative and nondecreasing on [0,∞), HasLaplace α s (F(s)) for all Re(s)>a, and PoleBoundary F a k A. For every λ>0 and T∈ℝ the integral ∫_0^∞ w_k(t)exp(−at)α(t)K_λ(t−T)dt is absolutely integrable, and as T→∞ it tends to A/k!.

Hypotheses: a>0; α(t)≥0 for t≥0; MonotoneOn α [0,∞); convergence at every s with Re(s)>a; full PoleBoundary, not only a local pole.

Construction or proof:

1. Subtract the Gamma model β=(A/k!)exp(at)t^k. Differentiate the convergent Laplace integral: convergence a little to the left absorbs the extra t factor. Fubini then identifies H(s) with the transform of w_k(t)(α(t)−β(t)).
1. Insert the triangular Fourier formula for K_λ in the ε-damped integral. The u,t,y interchanges are justified at ε>0 by absolute convergence and compact frequency support.
1. Use regularizedBoundaryL1 to pass ε↓0 on the frequency side, then the Riemann–Lebesgue lemma to let T→∞. On the counting side positivity gives undamped integrability by Fatou and the finite damped limit; dominated convergence removes ε using the integrable undamped nonnegative product as majorant. This proves the undamped identity before using its limit.
1. For the model, w_k(t)t^k is bounded by 1 and tends to 1. Translation, dominated convergence and ∫K_λ=1 give model limit A/k!, so the count has that same smoothed limit.

Acceptance: No bound α(t)=O(exp(at)t^k) is assumed: that bound is obtained in the next monotonicity step.

Source: DEL54, §3.3.1–3.3.5, pp.221–224; §4.1, pp.228–229. The squared-sine convolution extracts the leading coefficient from the regularized transform. Positivity justifies passing from damped integrals to their undamped counterparts.

Internal inputs: `ArithmeticDirichletSeriesPartII:HP.0/laplace`, `ArithmeticDirichletSeriesPartII:HP.2/gamma-model`, `ArithmeticDirichletSeriesPartII:HP.2/boundary-l1`, `ArithmeticDirichletSeriesPartII:HP.1/kernel`, `ArithmeticDirichletSeriesPartII:HP.1/weight`.

## Layer HP.3: Delange’s integer-pole Laplace theorem

Prerequisites: `ArithmeticDirichletSeriesPartII:HP.1`, `ArithmeticDirichletSeriesPartII:HP.2`.

### Monotone removal of squared-sine smoothing

`monotoneUnsmoothing`. Let a>0, C≥0 and k∈ℕ. Suppose α is nonnegative and nondecreasing on [0,∞). Assume that for every λ>0 the smoothed integral in HP.2 is integrable for every T and tends to C as T→∞. Then α(t)/(exp(at)t^k)→C as t→∞.

Hypotheses: No transform or boundary hypothesis is used here; all positive λ are required, along with their actual convolution limits and integrability.

Construction or proof:

1. Write J(t)=w_k(t)exp(−at)α(t). Fix a short interval [T,T+h]. Monotonicity of α and the weight shift law compare J(T) with the convolution on that interval. Positivity and a nonzero kernel mass give an eventual upper bound for J; local monotonicity also bounds it on compact intervals.
1. This bound controls tails outside [T−h,T+h]. The smoothed limit, monotonicity and the weight shift law give lower and upper limits for J(T) with errors from the tails and exp(±ah).
1. First let λ→∞ for fixed h>0, using squaredSinc_tail; then let h↓0. Both limits equal C.
1. Use w_k(t)t^k→1 to replace J(t) by α(t)/(exp(at)t^k). This also proves the case C=0.

Acceptance: The weighted function J itself need not be monotone. A limit for one fixed bandwidth is insufficient for this statement.

Source: DEL54, §3.4.1–3.4.2, pp.225–227. The Tauberian step uses the nondecreasing counting function and the shift behaviour of the regularizer. It derives the necessary bound instead of taking the intended asymptotic as a premise.

Internal inputs: `ArithmeticDirichletSeriesPartII:HP.1/kernel`, `ArithmeticDirichletSeriesPartII:HP.1/weight`.

### Delange integer-pole Laplace theorem

`delangeLaplace`. Let a>0, A>0 and m=k+1 with k∈ℕ. If α:[0,∞)→[0,∞) is nondecreasing, its ordinary Laplace integral is F(s) for Re(s)>a, and PoleBoundary F a k A holds, then α(t)/(exp(at)t^k)→A/k!. Equivalently α(t)∼(A/k!)exp(at)t^k.

Hypotheses: Nonnegative finite real α and MonotoneOn on [0,∞); local integrability follows from monotonicity. Convergence and boundary assertions are the separate predicates of HP.0.

Construction or proof:

1. Apply delangeSmoothedLimit for every λ>0.
1. A/k!>0 since A>0. Apply monotoneUnsmoothing with this C.
1. Use m=k+1 to identify k!=(m−1)!; the denominator is eventually positive.

Acceptance: For m=1 the result reduces to the simple-pole exponential asymptotic under holomorphic boundary extensions. For m=2 it has coefficient A and one power of t.

Source: DEL54, §5.2.1 Theorem III, pp.235–238; standing hypotheses p.213. This is the positive integer exponent specialization of Theorem III, proved through the recorded smoothing and monotonicity chain.

Internal inputs: `ArithmeticDirichletSeriesPartII:HP.2/smoothed-limit`, `ArithmeticDirichletSeriesPartII:HP.3/unsmoothing`.

## Layer HP.4: Higher-pole Dirichlet counts and perturbations

Prerequisites: `ArithmeticDirichletSeriesPartII:HP.0`, `ArithmeticDirichletSeriesPartII:HP.3`.

### Inclusive logarithmic summatory Laplace bridge

`logSummatory_hasLaplace`. For c:ℕ→ℝ with c_n≥0, let S_c(X)=TauCeti.summatory id ĉ X, where ĉ(0)=0 and ĉ(n)=c_n for n>0. Put α(t)=S_c(exp t) for t≥0. If Re(s)>0 and LSeriesHasSum (c cast to ℂ) s (F(s)), then HasLaplace α s (F(s)/s). Moreover α is nonnegative and nondecreasing, and α(0)=c_1.

Hypotheses: Nonnegative coefficients; actual LSeriesHasSum at s; Re(s)>0, even when the series happens to converge at a nonpositive real part.

Construction or proof:

1. Use the existing Northcott summatory function; no second finite-cutoff carrier is introduced. Its sum is inclusive, so n=1 is present at t=0.
1. Write α(t)=Σ_(n≥1)c_n 1_(log n≤t). The n=0 term of LSeries is zero and must not be inserted as mass.
1. The sum of integrals of norms is Σ_(n≥1)c_n n^(−Re(s))/Re(s), finite by absolute convergence. Interchange sum and integral using integral_tsum.
1. Integrate each tail exp(−st) from log n to infinity to obtain c_n n^(−s)/s. Sum using LSeriesHasSum. Nonnegativity and monotonicity are existing summatory API composed with exp.

Acceptance: logSummatory_test_initial: S_c(exp 0)=c_1. logSummatory_test_unit_mass: the sole coefficient c_1=1 gives transform 1/s. logSummatory_test_endpoint: S_c(exp(log 2))=c_1+c_2. These are explicit suggested-file examples.

Source: DEL54, Standing hypotheses p.213; §5.2.1 pp.235–238, applied to Wood §7 pp.416–417. The source theorem is an ordinary Laplace theorem. This direct absolute-convergence adapter establishes the Dirichlet-series interface, with division by s and the inclusive n=1 mass.

Internal inputs: `ArithmeticDirichletSeriesPartII:HP.0/laplace`.

### Delange higher-pole Dirichlet counting theorem

`delangeDirichlet`. Let c_n≥0 and A>0. Assume F(s) is the LSeriesHasSum value of c for every Re(s)>1 and PoleBoundary F 1 k A holds. Then S_c(X)/(X(log X)^k)→A/k! as X→∞, where S_c excludes n=0 and includes every 1≤n≤X.

Hypotheses: k∈ℕ, so m=k+1≥1; positive leading coefficient; genuine local analytic extensions along the entire line.

Construction or proof:

1. The bridge gives α(t)=S_c(exp t) with transform F(s)/s.
1. PoleBoundary.div_argument at a=1 preserves the leading coefficient A. Apply delangeLaplace.
1. Substitute t=log X for X>1 and use exp(log X)=X and log X→∞. This gives the inclusive real-cutoff conclusion.

Acceptance: c_n=1 for n>0 gives S(X)/X→1; m=2 gives the divisor-counting denominator X log X.

Source: DEL54, §5.2.1 Theorem III, pp.235–238; Wood §7 p.417. The Laplace theorem and explicit division-by-s adapter yield the higher-pole partial sum asymptotic required by Wood’s counting application.

Internal inputs: `ArithmeticDirichletSeriesPartII:HP.4/logarithmic-bridge`, `ArithmeticDirichletSeriesPartII:HP.0/boundary`, `ArithmeticDirichletSeriesPartII:HP.3/laplace-theorem`.

### Positive-abscissa counting and scaling

`delangeDirichlet_positiveAbscissa`. For a>0, A>0, k∈ℕ and c_n≥0, suppose F(s) is the LSeriesHasSum value for Re(s)>a and PoleBoundary F a k A holds. Then S_c(X)/(X^a(log X)^k)→A/(a k!). Real powers use Mathlib Real.rpow, and X>1 is automatic eventually.

Hypotheses: a>0 is essential to this adapter and constant; no a=0 logarithmic-counting theorem is asserted.

Construction or proof:

1. Use the same logarithmic summatory bridge. PoleBoundary.div_argument changes the leading coefficient to A/a at the original line.
1. Apply delangeLaplace and substitute t=log X, using exp(a log X)=X^a.
1. For an independent normalization check, rescale the transformed variable s↦as: the leading coefficient becomes A/a^(k+1); the time dilation contributes a^k. Their product is A/a.

Acceptance: At a=1 this agrees with delangeDirichlet. counting_test_abscissa_two: coefficients c_n=n give S_c(X)/X²→1/2, detecting a missing 1/a at the simple pole of ζ(s−1).

Source: DEL54, §5.2.1 Theorem III, pp.235–238; standing hypotheses p.213. The source allows any positive abscissa. The factor 1/a comes from the ordinary Laplace transform of the logarithmic counting function.

Internal inputs: `ArithmeticDirichletSeriesPartII:HP.4/logarithmic-bridge`, `ArithmeticDirichletSeriesPartII:HP.0/boundary`, `ArithmeticDirichletSeriesPartII:HP.3/laplace-theorem`.

### Finite-change invariance of counting asymptotics

`finiteChange_asymptotic`. For real sequences c,d agreeing outside a finite set, a>0 and k∈ℕ, if S_c(X)/(X^a(log X)^k)→C, then S_d(X)/(X^a(log X)^k)→C. The conclusion permits signed coefficients and does not require a series or boundary theorem.

Hypotheses: Finite disagreement; a>0; k natural; a known asymptotic for c.

Construction or proof:

1. Apply the existing eventually_summatory_sub_eq to the zero-suppressed weights. Their difference is eventually the finite constant sum of coefficient changes.
1. X^a(log X)^k→∞ when a>0, so this fixed difference divided by the denominator tends to zero.
1. Transfer the limit by addition. A mass at n=1 is a constant contribution and is covered by this theorem.

Acceptance: Inserting seven at n=1 into the divisor sequence leaves the X log X leading coefficient equal to one.

Source: WOOD19, Wood §7 p.417; Delange standing hypotheses p.213, footnote 1. Finite alterations change a summatory function by a bounded amount. The generic export states this elementary consequence using the existing finite-change summatory API.

### Lower-pole dominated signed perturbation

`lowerPole_perturbation`. Let a>0, B>0 and l<k be natural indices. Let b_n≥0 have a convergent Dirichlet series G on Re(s)>a and PoleBoundary G a l B. Suppose |d_n−c_n|≤b_n for every n and S_c(X)/(X^a(log X)^k)→C. Then S_d(X)/(X^a(log X)^k)→C. Thus a signed change dominated by a sequence of pole order l+1<k+1 is negligible at the higher counting scale.

Hypotheses: The majorant b has its own convergence and full boundary hypotheses. A local pole of a formal perturbation alone is insufficient; c,d need not be nonnegative.

Construction or proof:

1. Apply the positive-abscissa theorem to b to get S_b(X)=O(X^a(log X)^l).
1. Use the finite sum triangle inequality and the coefficient bound to obtain |S_d(X)−S_c(X)|≤S_b(X).
1. Divide by the higher scale and use (log X)^(l−k)→0. Transfer the limit by the squeeze theorem.

Acceptance: The strict inequality l<k rules out removing a same-order pole without changing the leading coefficient.

Source: WOOD19, Wood §7 p.417; lower-rank removal after the Tauberian asymptotic. Wood removes counts of smaller-rank images by bounding them by a lower-order counting sequence. This export provides the generic analytic estimate; the arithmetic majorant and its positivity stay in ArithmeticStatistics ST.3.

Internal inputs: `ArithmeticDirichletSeriesPartII:HP.4/positive-abscissa`.

## Layer HP.5: Zeta checks and boundary rejection

Prerequisites: `ArithmeticDirichletSeriesPartII:HP.4`.

### Divisor coefficients of the square of zeta

`zetaSquare_counting`. For Re(s)>1, the nonnegative coefficient d(n)=#(Nat.divisors n) has LSeriesHasSum value ζ(s)². This F satisfies PoleBoundary F 1 1 1. Consequently Σ_(1≤n≤X)d(n)/(X log X)→1. The sequence has d(0)=0 by the existing divisor convention.

Hypotheses: Use the analytic continuation riemannZeta, identified with its Dirichlet series only on Re(s)>1.

Construction or proof:

1. Use the existing arithmetic-function convolution identity ζ_arith*ζ_arith=σ_0 and sigma_zero_apply to identify d. LSeriesHasSum.convolution and the convergent zeta series give its transform.
1. analyticOn_riemannZeta supplies the away germs. The pinned residue limit and analyticity on a punctured ball imply a removable holomorphic extension of (s−1)ζ(s) with value 1. Its square gives the numerator with value 1 for an exact double pole.
1. Apply delangeDirichlet at k=1,A=1. Check d(4)=3, and apply finiteChange_asymptotic to the inserted n=1 mass.
1. The constant-one acceptance example uses the same residue germ at k=0; its conclusion also agrees with the elementary floor count.

Acceptance: counting_test_ones: S_1(X)/X→1, with the n=0 coefficient suppressed. counting_test_divisors_four: d(4)=3. counting_test_insert_one: replacing d by d+7·1_(n=1) keeps the limit one.

Source: DEL54, §5.2.1 Theorem III, pp.235–238. The simple and double zeta poles provide elementary checks of the integer-pole counting formula and factorial normalization. The arithmetic identities and continuation are imported from Mathlib.

Internal inputs: `ArithmeticDirichletSeriesPartII:HP.4/dirichlet-theorem`, `ArithmeticDirichletSeriesPartII:HP.4/finite-change`, `ArithmeticDirichletSeriesPartII:HP.0/boundary`.

### Local-pole hypothesis rejection

`dyadicLocalPoleCounterexample`. Let c_n=n if n=2^j for some j∈ℕ, and c_n=0 otherwise. For Re(s)>1 its convergent Dirichlet series is F(s)=1/(1−exp((1−s)log 2)). It has a local analytic numerator F(s)=g(s)/(s−1), g(1)=1/log 2. But PoleBoundary F 1 0 (1/log 2) is false, and S_c(X)/X does not tend to 1/log 2. In fact it has two distinct subsequential limits, 2 and 4/3.

Hypotheses: This is a rejection test for omitting the away-boundary field; its coefficients are nonnegative. The local numerator is explicitly required, not merely a real residue limit.

Construction or proof:

1. Reindex the absolutely convergent series by n=2^j, giving the geometric sum with ratio 2^(1−s). The denominator has a simple zero at 1 with derivative log 2, so the local numerator has the stated value.
1. At 1+2πi/log 2 the denominator vanishes again, and the singularity is a genuine pole. No holomorphic boundary extension there can agree on the open half-plane.
1. Compute S_c(2^j)=2^(j+1)−1. At X=3·2^(j−1), j≥1, the same sum gives ratio tending to 4/3; at X=2^j it tends to 2.
1. Distinct subsequential limits exclude any global counting limit and in particular the proposed residue constant. This directly tests the theorem’s full boundary hypothesis.

Acceptance: The counterexample passes nonnegativity, right-half-plane convergence and the exact local pole test, and fails only the full boundary requirement.

Source: DEL54, §5.3, p.242; contrast with Theorem III, pp.235–236. Delange explains why information at the real singularity alone has weaker consequences. The dyadic geometric series is an independently computed witness of the necessary distinction, not an example attributed to the source.

Internal inputs: `ArithmeticDirichletSeriesPartII:HP.0/boundary`.

## Export contract for arithmetic consumers

The inputs are the actual convergent series, nonnegative coefficients, the analytic pole numerator, all away-boundary germs and a positive leading coefficient. These give the counting limit; they do not encode it in a structure field. A lower-rank subtraction supplies its own nonnegative majorant, convergence and boundary data with strictly smaller pole order. The `lowerPole_perturbation` conclusion then applies to the signed subtraction. Wood §7 has m=2^r, so the log exponent is 2^r−1, and the leading constant is the supplied residue coefficient divided by (2^r−1)!. The arithmetic proof that this coefficient is positive belongs to ArithmeticStatistics ST.3.

## Sources

- [Delange (1954)](https://www.numdam.org/item/ASENS_1954_3_71_3_213_0.pdf), standing hypotheses p.213; regularization and smoothing §§3–4.1, pp.220–229; Gamma models §5.1, pp.231–235; Theorem III §5.2.1, pp.235–238; local-hypothesis limitation §5.3, p.242. This is the primary proof source for the integer-pole theorem.
- [Wood (2019)](https://par.nsf.gov/servlets/purl/10152050), §7, pp.415–417, supplies the arithmetic motivation and lower-rank counting use. The generic analytic theorem here is sourced directly to Delange; no reliance on an unavailable copy of Wood’s Narkiewicz reference is needed.

Both were accessed on 2026-10-10. The packet records hashes and reading scope. Statements and proof plans are in this roadmap’s own words.
