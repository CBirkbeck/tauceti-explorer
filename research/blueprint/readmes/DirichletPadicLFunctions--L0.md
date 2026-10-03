# Complex special values and algebraicity: L0

This layer develops the explicit Mellin argument used in Rodrigues Jacinto and Williams, then compares its Bernoulli and smoothed kernels with the existing complex zeta function. It also specifies the remaining arithmetic comparisons with generalized Bernoulli values, Dedekind zeta and rational idele characters. Its objects are native real and complex functions, within derivatives, Mellin integrals, formal series and ring maps. It introduces no second character, generalized Bernoulli, measure or idele carrier.

The packet contains 63 unchecked declarations, 51 construction API entries and 42 specified tests, with five planets. The layer remains partial. These are mathematical specifications and suggested signatures, not formalization claims. Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`, and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`.

## Ownership and inputs

The existing ModularForms Layer 0 owns generalized Bernoulli quantities and the classical finite Fourier/Gauss translation. L0 imports those objects and supplies the comparison with analytic values. Mathlib already supplies ordinary Bernoulli numbers and polynomials, zeta values at every nonpositive integer, Dirichlet continuation, conductor change and imprimitive Euler factors. The general adelic GL₁ continuation and trivial-character pole belong to AutomorphicLFunctionsAndLocalFactors AL.1. GlobalNumberFields Layers 9–10 supply the canonical Hecke/ray characters and their three distinct infinity-type conventions.

The actual Mellin proof remains part of L0 even though Mathlib has another continuation route. A reference to the existing zeta function does not prove smoothness at the origin of the kernel used in this argument, and a real one-sided Dedekind residue limit does not by itself prove a meromorphic simple pole.

The two formal-value interfaces below consume L1's integral smoothing series and its iterated Mahler derivative formula. They do not reconstruct the arithmetic series. L1 owns the corresponding measure cocycles; the real-kernel cocycle here is an independent analytic identity whose scalar and derivative weights agree with those arithmetic formulas. No arithmetic measure is required to prove it.

For nonprincipal characters, QSeries QM.5 already plans the finite Bernoulli-polynomial formula, including its separate endpoint argument at zero. Dirichlet L2's tame complex special-values and common-value comparison specialize it and compare explicit complex and p-adic embeddings. The L0 work still needed is comparison with the canonical generalized Bernoulli quantities, with conductor and endpoint conventions retained. It is not another copy of that finite-sum theorem.

## Conventions

Let J=[0,∞). Smoothness on J means native smoothness within J; derivatives at zero are right derivatives in that same native API. Every derivative order has some positive exponential decay rate at positive infinity, and the rate may depend on the order. Functions on the negative half-line need not satisfy a condition in the general continuation theorem.

The native Mellin integral is unnormalized:

M(f,s)=∫₀∞ t^(s−1)f(t)dt.

Complex powers follow Mathlib's principal convention. On the integration domain t>0 the base is positive real. The symbol L_f denotes the separately constructed entire continuation of M(f,s)/Γ(s), not that totalized quotient at every s. In particular, Γ(0)=0 in the native totalized function. For f(t)=exp(−t), the continued value at zero is one, while the raw quotient at zero is zero.

The ordinary Bernoulli convention is B₁=−1/2. The pinned all-n formula is ζ(−n)=(−1)^n B_(n+1)/(n+1), including ζ(0)=−1/2. A rational value is transported by the actual rational algebra map to the desired field. No field isomorphism from all of ℂ to a p-adic field is used.

Real smoothing parameters are unrestricted in the kernel definition and its algebraic identities. Exponential decay and Mellin comparisons require a>0. Natural arithmetic parameters additionally carry the relevant unit or coprimality hypothesis. The value a=1 is the zero-kernel test and is not a parameter for dividing a pseudomeasure numerator by a nonzero smoothing denominator.

## Entire normalized continuation

Integration by parts gives the unnormalized derivative shift after both boundary terms have been justified. The boundary at infinity uses exponential decay against a complex power; the boundary at zero uses continuity within J and Re(s)>0. The endpoint integral of an iterated derivative at s=1 is minus its preceding derivative at zero.

Normalize the shift by Gamma and prove coherence between any two admissible shifts. For an arbitrary complex s choose N(s)=ceil(|Re(s)|)+1, so Re(s+N(s))>0. Define L_f(s) by the signed normalized Mellin integral of the N(s)-th within derivative. This is a total function definition. Under the smoothness and decay hypotheses, shift coherence replaces its discontinuous integer-valued choice locally by a fixed admissible integer. The local formula proves entire differentiability. Iterating to s+n+1=1 proves L_f(−n)=(−1)^n D_n f(0).

The construction API includes uniqueness among entire functions agreeing on the initial half-plane, congruence of inputs agreeing on J, zero, addition under the analytic hypotheses, and scalar compatibility. These are separate from the initial-half-plane and negative-integer evaluations. The tests include exponential kernels with transforms one and s, rescaling by two, and the nondecaying constant as a rejected input.

## Bernoulli kernel and its zeta comparison

Define β(t) as the reciprocal of native dslope(exp,0,t). At zero its value is one. Away from zero it equals t/(exp(t)−1). The literal quotient has value zero at zero and is not the defined kernel. Analyticity of the divided difference and nonvanishing of its denominator give real analyticity everywhere and hence smoothness.

The product identity β(t)(exp(t)−1)=t supplies a derivative recurrence. Comparing this recurrence with the native Bernoulli recurrence determines every origin derivative β^(n)(0)=B_n. The inclusion into ℂ preserves derivatives, and the within derivatives agree at the endpoint by unique differentiability of J.

On the positive half-line, expand the reciprocal exponential denominator as a geometric series. For each m use the explicit positive-index series F_m(t)=Σ_(r≥1)r^m exp(−rt). Bounds uniform on t≥δ>0 justify differentiating that sum; the derivative is −F_(m+1). Leibniz gives the derivative formula for tF₀(t). A positive rate such as 1/2 absorbs its extra factor t and proves exponential decay at every order. A purported rate-one bound for the polynomially weighted kernel is deliberately rejected by a test.

The entire continuation therefore applies to β. Native sum/integral interchange identifies its actual Mellin integral with Γ(s+1)ζ(s+1) on Re(s)>0. The normalized continuation agrees with sζ(s+1) for s≠0. Its value at zero is one. The raw totalized expression 0·ζ(1) cannot replace that removable value.

## Smoothing, composition and special values

Define h_a(t) by the extended divided difference at zero of β(t)−β(at). It is real analytic for every real a, with

h_a(0)=(a−1)/2, t h_a(t)=β(t)−β(at).

For a≠0 and t≠0, this recovers 1/(exp(t)−1)−a/(exp(at)−1). The origin-derivative formula is

h_a^(n)(0)=(1−a^(n+1))B_(n+1)/(n+1).

For a>0 every derivative decays with positive rate min(1,a). The complex inclusion g_a is consequently an eligible normalized Mellin input. Its Mellin integral converges for Re(s)>0, and on Re(s)>1 the Gamma–zeta identity gives the normalized factor (1−a^(1−s))ζ(s). Analytic continuation extends this comparison to s≠1. The punctured limit and continuity give the distinct value L_a(1)=log(a).

Composition is an identity of the actual kernels:

h_(ab)(t)=h_a(t)+a h_b(at).

For t≠0, multiply by t and cancel β(at) using the product identity. No division by a is needed. For t=0, the origin values give (ab−1)/2=(a−1)/2+a(b−1)/2. Thus the kernel identity includes a=0, b=0 and negative parameters. Applying it in the two orders gives the commutation relation. This does not identify the individual dilated summands.

At derivative order n the weight becomes a^(n+1). It can be checked directly by factoring the common Bernoulli coefficient, using 1−(ab)^(n+1)=(1−a^(n+1))+a^(n+1)(1−b^(n+1)). The exponent contains both the n powers from dilation and the outer scalar a. For a=2, b=3, n=3 the weight is16 and the derivative is259/24; a weight of8 fails.

For a,b>0, use convergence of both actual kernels before applying addition of Mellin integrals. Dilation contributes a^(−s), which combines with the outer scalar to give a^(1−s). The identity holds on the entire convergence half-plane Re(s)>0, including s=1. No addition rule for arbitrary divergent totalized integrals is used.

The corresponding continued identity holds for every complex s:

L_(ab)(s)=L_a(s)+a^(1−s)L_b(s).

Off s=1, the existing zeta comparison and multiplicativity of complex powers with positive real bases prove it by algebra. At s=1, use log(ab)=log(a)+log(b). This second case is necessary: the raw totalized products would all be zero and would not establish the continued values. At s=−n the multiplier is a^(n+1), matching the derivative cocycle with the common sign (−1)^n. In particular L_6(−3)=−259/24.

## Formal and arithmetic interfaces

L1's smoothing denominator is q_a(T)=Σ choose(a,n+1)Tⁿ. With a a unit in the coefficient ring, its smoothing series is the product of Σ choose(a,n+2)Tⁿ and the native inverse series for q_a. PadicMeasuresIwasawaAlgebras owns the Mahler derivation ∂=(1+T)d/dT. In a rational coefficient ring, L1 identifies the constant coefficient of ∂^[k]F_a with (1−a^(k+1))B_(k+1)/(k+1).

L0 compares that same rational constant first with the real origin derivative and then with the complex continued value, retaining the sign (−1)^k in the latter. These are comparisons of independently specified objects. They make no claim that an arbitrary formal series converges after evaluation at exp(t)−1. Ordinary formal differentiation and the Mahler operator have different coefficients; the second-derivative control test keeps this distinction visible.

The standalone suggested file expresses those two supplier formulas through local notation for their exact native definitions, without exporting new carrier declarations. It consequently imports no later Dirichlet stage. All other L0 signatures and every listed test are present in that file. The specifications below, not a particular abbreviation spelling, determine the intended mathematics.

## Remaining source obligations

The Dedekind comparison must identify the existing series with the AL.1 meromorphic germ near one, prove the simple-pole statement, and match its residue with Mathlib's real class-number limit. The general idele and infinity-type carriers come from GlobalNumberFields; L0 must instantiate their conductor, parity and normalization dictionaries for ℚ. Generalized Bernoulli comparisons must retain the trivial-character B₁ endpoint and explicit embeddings.

RJW's footnote10 on printed149 states transcendence of L(θ,1). The existing L3 logarithmic formula, Baker theory in DiophantineApproximationAndTranscendence DT.3, and native nonvanishing at one supply the named inputs. The logarithms in the finite cyclotomic sum are not assumed independent. A proof must pass to an independent logarithm family and retain a nonzero coefficient. The terminal corollary needs a placement consistent with the accepted order L0→Coleman L0→L3. This packet records the remaining obligation and does not introduce a backward stage dependency or a second logarithmic formula.

The preserved source findings E3 and E5 explain two required conventions. A negative smoothing parameter need not decay: a=−1 gives the constant−1. The printed negative-zeta formula also needs its n=0 sign corrected with B₁=−1/2. Neither finding is newly claimed here.

## Declaration specifications

Each record below is one declaration. Its prerequisites are the packet's exact node or pinned-library references. The three construction records include their complete API and required tests.


### Complex comparison of the smoothed rational value

Identifier: `DirichletPadicLFunctions:L0/smoothed-value-complex`. Kind: comparison.

For a,k∈ℕ the complex image of the rational number (1−a^(k+1)) B_(k+1)/(k+1) equals (−1)^k (1−a^(k+1)) ζ(−k).

Hypotheses: a,k are natural numbers. Bernoulli numbers use Mathlib's B₁=−1/2 convention. The comparison uses algebraMap ℚ ℂ, not an isomorphism from ℂ to a p-adic field.

Proof or construction:

1. Rewrite ζ(−k) by the existing riemannZeta_neg_nat_eq_bernoulli. This statement includes k=0.

2. The two factors (−1)^k multiply to 1. Use the rational-to-complex ring-map laws to identify the result with the indicated rational image.

3. This is only the smoothing and embedding comparison. The baseline special-value theorem is not re-proved. The actual Bernoulli and smoothed kernels instantiate the normalized entire Mellin continuation, with their zeta comparisons and removable values. The common rational formal-derivative constant now compares the actual real origin derivatives, signed complex continued values and integral arithmetic moments.

Prerequisites: `mathlib:riemannZeta_neg_nat_eq_bernoulli`.

Tests:

- `SuggestedTests.complex_zero_sign` (computation): (1−2)ζ(0)=1/2 in ℂ.

Acceptance: At a=2,k=0, (1−2)ζ(0)=1/2. For k=1 the value is (1−a²)/12. This formula does not yet include any unit-restriction Euler factor.

Source: RJW-published, Lemma 4.2 and Proposition 4.6, printed pp. 136–137 / PDF 37–38.


### The Mellin boundary term at infinity

Identifier: `DirichletPadicLFunctions:L0/mellin-infinity-boundary`. Kind: lemma.

For f:ℝ→ℂ, a>0 and f(t)=O(exp(−at)) at +∞, and for every s∈ℂ, f(t)t^s tends to zero at +∞.

Hypotheses: f:ℝ→ℂ, a∈ℝ with a>0, f=O(exp(−at)) at +∞; s is any complex number.

Proof or construction:

1. For t>0 use Complex.norm_cpow_eq_rpow_re_of_pos to bound t^s in norm by t^(Re s). Multiply this Big-O estimate by the exponential bound for f.

2. The baseline limit tendsto_rpow_mul_exp_neg_mul_atTop_nhds_zero sends t^(Re s)exp(−at) to zero for every real Re s. IsBigO.trans_tendsto then gives the complex-valued limit.

Prerequisites: `mathlib:Complex.norm_cpow_eq_rpow_re_of_pos`, `mathlib:Asymptotics.IsBigO.of_norm_eventuallyLE`, `mathlib:Asymptotics.IsBigO.trans_tendsto`, `mathlib:tendsto_rpow_mul_exp_neg_mul_atTop_nhds_zero`.

Acceptance: Allow every s, including Re s≤0; the restriction Re s>0 is needed at zero, not at infinity.

Source: RJW-published, §2.3, Theorem 2.4 and its full proof, printed110–111 / PDF11–12; surrounding application through Lemma2.7 on printed112 read on27 September2026.


### The Mellin boundary term at zero

Identifier: `DirichletPadicLFunctions:L0/mellin-zero-boundary`. Kind: lemma.

If f:ℝ→ℂ is continuous at zero within [0,∞), then f(t)t^s tends to zero as t→0+ for every s with Re s>0.

Hypotheses: f:ℝ→ℂ is continuous within [0,∞) at zero; s∈ℂ and Re s>0.

Proof or construction:

1. Restrict right continuity from [0,∞) to (0,∞). Complex.continuousAt_cpow_zero_of_re_pos is joint continuity of (z,w)↦z^w at (0,s); compose it with t↦(t,s).

2. Since Re s>0 implies s≠0, the value 0^s is zero. Multiply the two limits to get f(0)·0=0.

Prerequisites: `mathlib:Complex.continuousAt_cpow_zero_of_re_pos`.

Acceptance: The hypothesis Re s>0 is essential when f(0)≠0; the assertion at s=0 would be false.

Source: RJW-published, §2.3, Theorem 2.4 and its full proof, printed110–111 / PDF11–12; surrounding application through Lemma2.7 on printed112 read on27 September2026.


### The unnormalized Mellin derivative shift

Identifier: `DirichletPadicLFunctions:L0/mellin-derivative-shift`. Kind: lemma.

Let Re s>0. Suppose f is continuous at zero from the right, f has derivative g at every t>0, M(f,s) and M(g,s+1) converge, and f(t)t^s→0 at +∞. Then M(g,s+1)=−s M(f,s).

Hypotheses: Exactly the continuity, derivative, convergence, endpoint and Re s>0 hypotheses in the statement; no global smoothness or decay assumption is needed for this general adapter.

Proof or construction:

1. Apply mellin-zero-boundary for the lower endpoint. On (0,∞), hasDerivAt_ofReal_cpow_const differentiates t^s as s t^(s−1); s≠0 follows from Re s>0.

2. Use integral_Ioi_mul_deriv_eq_deriv_mul with u(t)=t^s and v(t)=f(t). Its two separate integrability hypotheses are exactly the given Mellin convergence statements, with a constant scalar s on the second integrand.

3. Both endpoint products are zero. Pull s outside the remaining integral and unfold only the native definition of mellin to obtain the stated sign and shift.

Prerequisites: `DirichletPadicLFunctions:L0/mellin-zero-boundary`, `mathlib:mellin`, `mathlib:MellinConvergent`, `mathlib:hasDerivAt_ofReal_cpow_const`, `mathlib:MeasureTheory.integral_Ioi_mul_deriv_eq_deriv_mul`.

Acceptance: The new exponent is s+1 and the multiplier is −s. The theorem uses right continuity, not differentiability at zero.

Source: RJW-published, §2.3, Theorem 2.4 and its full proof, printed110–111 / PDF11–12; surrounding application through Lemma2.7 on printed112 read on27 September2026.


### The Gamma-normalized derivative shift

Identifier: `DirichletPadicLFunctions:L0/normalized-mellin-derivative-shift`. Kind: lemma.

Under the common smoothness and all-derivative decay hypotheses, for every n≥0 and Re s>0, M(D_n f,s)/Γ(s)=−M(D_(n+1) f,s+1)/Γ(s+1).

Hypotheses: J=[0,∞)⊆ℝ; f:ℝ→ℂ is smooth within J in the native ContDiffOn sense. Write D_n f for native iteratedDerivWithin n f J, including its right-hand value at zero. For every n≥0 there is a real a_n>0 such that D_n f(t)=O(exp(−a_n t)) as t→+∞. The rate may depend on n. No condition is imposed on f on the negative half-line. M(f,s) is Mathlib’s unnormalized mellin: the complex integral over t>0 of t^(s−1)f(t). Complex powers use Mathlib’s principal convention; positive real t makes that convention unambiguous. Γ is native Complex.Gamma.

Proof or construction:

1. Native smoothness on J, uniqueDiffOn_Ici and the iterated derivative criterion give continuity of D_n on J and derivative D_(n+1) at each positive point. Continuity gives local integrability and a bounded right germ at zero by Tendsto.isBigO_one.

2. Apply mellinConvergent_of_isBigO_rpow_exp with its lower exponent b=0 to D_n at s and D_(n+1) at s+1. This is an application of existing convergence, not a replacement convergence theorem.

3. Use mellin-infinity-boundary and mellin-derivative-shift. Combine M(D_(n+1),s+1)=−sM(D_n,s) with Gamma_add_one at s≠0 and cancel s. The result holds on Re s>0, strengthening the source proof’s sufficient Re s>1 domain.

Prerequisites: `DirichletPadicLFunctions:L0/mellin-infinity-boundary`, `DirichletPadicLFunctions:L0/mellin-derivative-shift`, `mathlib:Complex.Gamma_add_one`, `mathlib:ContDiffOn.continuousOn_iteratedDerivWithin`, `mathlib:contDiffOn_iff_continuousOn_differentiableOn_deriv`, `mathlib:iteratedDerivWithin_succ`, `mathlib:uniqueDiffOn_Ici`, `mathlib:ContinuousOn.locallyIntegrableOn`, `mathlib:Filter.Tendsto.isBigO_one`, `mathlib:mellinConvergent_of_isBigO_rpow_exp`.

Acceptance: Keep the same index n on both input and decay hypotheses. Do not infer a uniform exponential rate over all n.

Source: RJW-published, §2.3, Theorem 2.4 and its full proof, printed110–111 / PDF11–12; surrounding application through Lemma2.7 on printed112 read on27 September2026.


### The endpoint integral of an iterated derivative

Identifier: `DirichletPadicLFunctions:L0/mellin-derivative-at-one`. Kind: lemma.

Under the common hypotheses, M(D_(n+1) f,1)=−D_n f(0) for every n≥0.

Hypotheses: J=[0,∞)⊆ℝ; f:ℝ→ℂ is smooth within J in the native ContDiffOn sense. Write D_n f for native iteratedDerivWithin n f J, including its right-hand value at zero. For every n≥0 there is a real a_n>0 such that D_n f(t)=O(exp(−a_n t)) as t→+∞. The rate may depend on n. No condition is imposed on f on the negative half-line. M(f,s) is Mathlib’s unnormalized mellin: the complex integral over t>0 of t^(s−1)f(t). Complex powers use Mathlib’s principal convention; positive real t makes that convention unambiguous. Γ is native Complex.Gamma.

Proof or construction:

1. Apply the existing exponential Mellin convergence criterion to D_(n+1) at exponent1, using continuity at zero to supply b=0. At exponent1 the weight t^0 is one, so D_(n+1) is integrable on (0,∞).

2. Smoothness supplies HasDerivAt(D_n,D_(n+1)) on the open half-line and continuity at zero within J. Mellin-infinity-boundary with s=0 gives D_n(t)→0.

3. Use integral_Ioi_of_hasDerivAt_of_tendsto, whose boundary value is 0−D_n(0). Unfold mellin at exponent1 to identify that integral.

Prerequisites: `DirichletPadicLFunctions:L0/mellin-infinity-boundary`, `mathlib:mellin`, `mathlib:MeasureTheory.integral_Ioi_of_hasDerivAt_of_tendsto`, `mathlib:ContDiffOn.continuousOn_iteratedDerivWithin`, `mathlib:contDiffOn_iff_continuousOn_differentiableOn_deriv`, `mathlib:iteratedDerivWithin_succ`, `mathlib:uniqueDiffOn_Ici`, `mathlib:ContinuousOn.locallyIntegrableOn`, `mathlib:Filter.Tendsto.isBigO_one`, `mathlib:mellinConvergent_of_isBigO_rpow_exp`.

Acceptance: This is the right derivative at zero. No integration over negative t, omitted endpoint limit, or unproved fundamental-theorem hypothesis is used.

Source: RJW-published, §2.3, Theorem 2.4 and its full proof, printed110–111 / PDF11–12; surrounding application through Lemma2.7 on printed112 read on27 September2026.


### Coherence of translated Mellin formulas

Identifier: `DirichletPadicLFunctions:L0/mellin-shift-coherence`. Kind: lemma.

Under the common hypotheses, if n,m≥0 and Re(s+n)>0, Re(s+m)>0, then (−1)^n M(D_n f,s+n)/Γ(s+n)=(−1)^m M(D_m f,s+m)/Γ(s+m).

Hypotheses: J=[0,∞)⊆ℝ; f:ℝ→ℂ is smooth within J in the native ContDiffOn sense. Write D_n f for native iteratedDerivWithin n f J, including its right-hand value at zero. For every n≥0 there is a real a_n>0 such that D_n f(t)=O(exp(−a_n t)) as t→+∞. The rate may depend on n. No condition is imposed on f on the negative half-line. M(f,s) is Mathlib’s unnormalized mellin: the complex integral over t>0 of t^(s−1)f(t). Complex powers use Mathlib’s principal convention; positive real t makes that convention unambiguous. Γ is native Complex.Gamma.

Proof or construction:

1. For an admissible n apply normalized-mellin-derivative-shift at s+n. Multiplication by (−1)^n identifies the n formula with the n+1 formula.

2. Induct on k to compare n and n+k. Admissibility persists because adding a nonnegative real integer increases the real part. Compare arbitrary n and m by their order, or through max(n,m).

Prerequisites: `DirichletPadicLFunctions:L0/normalized-mellin-derivative-shift`.

Acceptance: The equality only uses integrals inside their positive half-planes; it never divides an undefined integral at a nonpositive integer.

Source: RJW-published, §2.3, Theorem 2.4 and its full proof, printed110–111 / PDF11–12; surrounding application through Lemma2.7 on printed112 read on27 September2026.


### The continued normalized Mellin transform

Identifier: `DirichletPadicLFunctions:L0/normalized-mellin-continuation`. Kind: construction.

For f:ℝ→ℂ define a function L_f:ℂ→ℂ by N(s)=ceil(|Re s|)+1 and L_f(s)=(−1)^N(s) M(D_N(s) f,s+N(s))/Γ(s+N(s)). Under the common hypotheses this is the canonical entire continuation of the Gamma-normalized Mellin integral. The definition is total for arbitrary f; the analytic and special-value assertions require those hypotheses.

Hypotheses: J=[0,∞)⊆ℝ; f:ℝ→ℂ is smooth within J in the native ContDiffOn sense. Write D_n f for native iteratedDerivWithin n f J, including its right-hand value at zero. For every n≥0 there is a real a_n>0 such that D_n f(t)=O(exp(−a_n t)) as t→+∞. The rate may depend on n. No condition is imposed on f on the negative half-line. M(f,s) is Mathlib’s unnormalized mellin: the complex integral over t>0 of t^(s−1)f(t). Complex powers use Mathlib’s principal convention; positive real t makes that convention unambiguous. Γ is native Complex.Gamma.

Proof or construction:

1. Choose the explicit natural integer N(s). Nat.le_ceil and Re s≥−|Re s| give Re(s+N(s))≥1>0. Therefore, under the common hypotheses the derivative integral in the formula converges by the existing criterion.

2. The displayed expression defines one native complex-valued function. Mellin-shift-coherence shows that any admissible integer choice gives the same value. This is the only new carrier-level construction; no custom smooth-function type, Mellin integral, Gamma function, or growth predicate is introduced.

3. The API separates the unconditional defining formula, congruence and scalar identities from the conditional analytic and addition properties. Its four principal analytic evaluations are promoted below so their consumers have exact node prerequisites.

Prerequisites: `DirichletPadicLFunctions:L0/mellin-shift-coherence`, `mathlib:Nat.le_ceil`, `mathlib:mellin`, `mathlib:iteratedDerivWithin_congr`, `mathlib:iteratedDerivWithin_add`, `mathlib:iteratedDerivWithin_const_smul_field`, `mathlib:hasMellin_add`, `mathlib:mellin_const_smul`, `mathlib:Complex.GammaIntegral_eq_mellin`, `mathlib:Complex.Gamma_eq_integral`, `mathlib:Complex.Gamma_ne_zero_of_re_pos`, `mathlib:Complex.Gamma_zero`, `mathlib:mellin_cpow_smul`, `mathlib:mellin_comp_mul_left`, `mathlib:DifferentiableOn.analyticOnNhd`, `mathlib:AnalyticOnNhd.eq_of_eventuallyEq`.

API:

- `normalizedMellinContinuation_def` (data): For every f and s, the defining formula uses N=ceil(|Re s|)+1 and equals (−1)^N M(D_N f,s+N)/Γ(s+N).

- `normalizedMellinContinuation_eq_shift` (characterisation): Under the common hypotheses the same formula holds for any n≥0 with Re(s+n)>0; promoted to normalized-mellin-admissible-shift.

- `normalizedMellinContinuation_eq_mellin` (compatibility): For Re s>0 it equals the native unnormalized mellin(f,s) divided by Γ(s); promoted to normalized-mellin-initial-halfplane.

- `normalizedMellinContinuation_entire` (structure): The continuation is complex differentiable at every s under the common hypotheses; promoted to normalized-mellin-entire.

- `normalizedMellinContinuation_neg_nat` (example): Its value at −n is (−1)^n D_n f(0), including n=0; promoted to normalized-mellin-negative-values.

- `normalizedMellinContinuation_unique` (universal-property): Under the common hypotheses, any entire F:ℂ→ℂ agreeing with M(f,s)/Γ(s) for all Re s>0 equals this continuation.

- `normalizedMellinContinuation_congr` (extensionality): For arbitrary f,g:ℝ→ℂ agreeing on J, their continuation formulas define the same function. No smoothness is needed for this congruence.

- `normalizedMellinContinuation_zero` (simp): The zero input gives the zero function.

- `normalizedMellinContinuation_add` (simp): For f and g each satisfying the common hypotheses, the continuation of f+g is the pointwise sum of their continuations.

- `normalizedMellinContinuation_smul` (simp): For every c∈ℂ and every f:ℝ→ℂ, the continuation formula for cf equals c times the formula for f. This uses native within-derivative and Mellin scalar compatibility without extra smoothness assumptions.

Tests:

- `SuggestedMellinContinuationTests.zero_input` (computation): For any s∈ℂ, the zero input gives zero.

- `SuggestedMellinContinuationTests.exponential_normalization` (characterisation): For f(t)=exp(−t), the continuation equals1 at every complex s.

- `SuggestedMellinContinuationTests.linear_exponential` (computation): For f(t)=t exp(−t), the continuation equals s at every complex s; in particular its value at−1 is−1.

- `SuggestedMellinContinuationTests.scaled_exponential` (computation): For f(t)=exp(−2t), the continuation at−3 equals8.

- `SuggestedMellinContinuationTests.naive_quotient_at_zero` (non-example): For f(t)=exp(−t), the continuation at0 is1, whereas the totalized native expression mellin(f,0)/Γ(0) is0 since native Γ(0)=0. The latter cannot define the continuation.

- `SuggestedMellinContinuationTests.nondecaying_constant` (non-example): The constant function1 has no exponential Big-O decay with positive rate at +∞ and is excluded by the hypotheses.

Acceptance: Distinguish this normalized continuation from native unnormalized mellin. The explicit integer-valued N need not vary continuously; entire differentiability comes from replacing it locally by a fixed admissible shift.

Source: RJW-published, §2.3, Theorem 2.4 and its full proof, printed110–111 / PDF11–12; surrounding application through Lemma2.7 on printed112 read on27 September2026.


### Evaluation using any admissible shift

Identifier: `DirichletPadicLFunctions:L0/normalized-mellin-admissible-shift`. Kind: lemma.

Under the common hypotheses, for any n≥0 and s∈ℂ with Re(s+n)>0, L_f(s)=(−1)^n M(D_n f,s+n)/Γ(s+n).

Hypotheses: J=[0,∞)⊆ℝ; f:ℝ→ℂ is smooth within J in the native ContDiffOn sense. Write D_n f for native iteratedDerivWithin n f J, including its right-hand value at zero. For every n≥0 there is a real a_n>0 such that D_n f(t)=O(exp(−a_n t)) as t→+∞. The rate may depend on n. No condition is imposed on f on the negative half-line. M(f,s) is Mathlib’s unnormalized mellin: the complex integral over t>0 of t^(s−1)f(t). Complex powers use Mathlib’s principal convention; positive real t makes that convention unambiguous. Γ is native Complex.Gamma.

Proof or construction:

1. Unfold the chosen-shift definition of L_f. Nat.le_ceil makes its N(s) admissible. Apply mellin-shift-coherence to N(s) and n.

Prerequisites: `DirichletPadicLFunctions:L0/normalized-mellin-continuation`, `DirichletPadicLFunctions:L0/mellin-shift-coherence`, `mathlib:Nat.le_ceil`.

Acceptance: This promoted evaluation is the dependency used in the holomorphic and special-value arguments.

Source: RJW-published, §2.3, Theorem 2.4 and its full proof, printed110–111 / PDF11–12; surrounding application through Lemma2.7 on printed112 read on27 September2026.


### Agreement on the initial half-plane

Identifier: `DirichletPadicLFunctions:L0/normalized-mellin-initial-halfplane`. Kind: lemma.

Under the common hypotheses and Re s>0, L_f(s)=M(f,s)/Γ(s).

Hypotheses: J=[0,∞)⊆ℝ; f:ℝ→ℂ is smooth within J in the native ContDiffOn sense. Write D_n f for native iteratedDerivWithin n f J, including its right-hand value at zero. For every n≥0 there is a real a_n>0 such that D_n f(t)=O(exp(−a_n t)) as t→+∞. The rate may depend on n. No condition is imposed on f on the negative half-line. M(f,s) is Mathlib’s unnormalized mellin: the complex integral over t>0 of t^(s−1)f(t). Complex powers use Mathlib’s principal convention; positive real t makes that convention unambiguous. Γ is native Complex.Gamma.

Proof or construction:

1. Apply normalized-mellin-admissible-shift with n=0. Native zeroth within derivative is f, (−1)^0=1 and s+0=s, so simplification yields the original normalized integral.

Prerequisites: `DirichletPadicLFunctions:L0/normalized-mellin-admissible-shift`.

Acceptance: The comparison is restricted to the convergence half-plane; the formula at zero for exp(−t) is a deliberate negative control.

Source: RJW-published, §2.3, Theorem 2.4 and its full proof, printed110–111 / PDF11–12; surrounding application through Lemma2.7 on printed112 read on27 September2026.


### Entire continuation of the normalized Mellin transform

Identifier: `DirichletPadicLFunctions:L0/normalized-mellin-entire`. Kind: theorem.

Under the common hypotheses, L_f is differentiable over ℂ at every point of ℂ.

Hypotheses: J=[0,∞)⊆ℝ; f:ℝ→ℂ is smooth within J in the native ContDiffOn sense. Write D_n f for native iteratedDerivWithin n f J, including its right-hand value at zero. For every n≥0 there is a real a_n>0 such that D_n f(t)=O(exp(−a_n t)) as t→+∞. The rate may depend on n. No condition is imposed on f on the negative half-line. M(f,s) is Mathlib’s unnormalized mellin: the complex integral over t>0 of t^(s−1)f(t). Complex powers use Mathlib’s principal convention; positive real t makes that convention unambiguous. Γ is native Complex.Gamma.

Proof or construction:

1. Fix s₀ and an integer n with Re(s₀+n)>0, for example its defining N. The strict inequality holds throughout an open neighborhood of s₀. On that neighborhood normalized-mellin-admissible-shift identifies L_f with the fixed function (−1)^n M(D_n f,s+n)/Γ(s+n).

2. As in normalized-mellin-derivative-shift, smoothness makes D_n locally integrable and bounded near zero; its exponential bound and the existing mellin_differentiableAt_of_isBigO_rpow_exp make M(D_n,·) differentiable on Re z>0.

3. Multiply by the entire inverse Gamma function supplied by Complex.differentiable_one_div_Gamma, compose with s↦s+n, and multiply by (−1)^n. DifferentiableAt.congr_of_eventuallyEq transfers differentiability to L_f at s₀. No differentiation of the discontinuous integer choice N(s) is taken.

Prerequisites: `DirichletPadicLFunctions:L0/normalized-mellin-admissible-shift`, `mathlib:Nat.le_ceil`, `mathlib:mellin_differentiableAt_of_isBigO_rpow_exp`, `mathlib:Complex.differentiable_one_div_Gamma`, `mathlib:DifferentiableAt.congr_of_eventuallyEq`, `mathlib:ContDiffOn.continuousOn_iteratedDerivWithin`, `mathlib:contDiffOn_iff_continuousOn_differentiableOn_deriv`, `mathlib:iteratedDerivWithin_succ`, `mathlib:uniqueDiffOn_Ici`, `mathlib:ContinuousOn.locallyIntegrableOn`, `mathlib:Filter.Tendsto.isBigO_one`, `mathlib:mellinConvergent_of_isBigO_rpow_exp`.

Acceptance: Entire means native Differentiable ℂ on all ℂ. The Gamma inverse is used as its existing entire function; no meromorphic quotient at a pole is asserted.

Source: RJW-published, §2.3, Theorem 2.4 and its full proof, printed110–111 / PDF11–12; surrounding application through Lemma2.7 on printed112 read on27 September2026.


### Nonpositive-integer values of the Mellin continuation

Identifier: `DirichletPadicLFunctions:L0/normalized-mellin-negative-values`. Kind: theorem.

Under the common hypotheses, for every n≥0, L_f(−n)=(−1)^n D_n f(0). In particular L_f(0)=f(0).

Hypotheses: J=[0,∞)⊆ℝ; f:ℝ→ℂ is smooth within J in the native ContDiffOn sense. Write D_n f for native iteratedDerivWithin n f J, including its right-hand value at zero. For every n≥0 there is a real a_n>0 such that D_n f(t)=O(exp(−a_n t)) as t→+∞. The rate may depend on n. No condition is imposed on f on the negative half-line. M(f,s) is Mathlib’s unnormalized mellin: the complex integral over t>0 of t^(s−1)f(t). Complex powers use Mathlib’s principal convention; positive real t makes that convention unambiguous. Γ is native Complex.Gamma.

Proof or construction:

1. At s=−n use normalized-mellin-admissible-shift with shift n+1, so the shifted argument is exactly1 and is admissible.

2. Complex.Gamma_one removes the denominator, and mellin-derivative-at-one replaces M(D_(n+1),1) by −D_n(0). Multiplying this minus sign by (−1)^(n+1) gives (−1)^n.

Prerequisites: `DirichletPadicLFunctions:L0/normalized-mellin-admissible-shift`, `DirichletPadicLFunctions:L0/mellin-derivative-at-one`, `mathlib:Complex.Gamma_one`.

Acceptance: Include n=0. For t exp(−t) at n=1 this gives−1, detecting a missing alternating sign.

Source: RJW-published, §2.3, Theorem 2.4 and its full proof, printed110–111 / PDF11–12; surrounding application through Lemma2.7 on printed112 read on27 September2026.


### Uniform weighted-exponential bounds

Identifier: `DirichletPadicLFunctions:L0/weighted-exponential-halfline-bound`. Kind: lemma.

For every m≥0, δ>0 and t≥δ, 0≤F_m(t)≤exp(δ−t) F_m(δ).

Hypotheses: For m≥0 and t>0, write F_m(t)=sum_(n≥1) n^m exp(−nt), using the native real infinite sum. This is notation for an explicit function, not a new summability predicate or carrier. Write b(t)=t/(exp(t)−1) on the positive half-line.

Proof or construction:

1. The native polynomial-weighted exponential summability theorem, shifted to positive indices, proves convergence at δ and at every t≥δ.

2. For n≥1, exp(−nt)≤exp(δ−t)exp(−nδ), since (n−1)(t−δ)≥0. Multiply by n^m≥0 and use the native comparison of two summable families.

3. All summands are nonnegative. Factoring exp(δ−t)=exp(δ)exp(−t) gives a fixed Big-O constant exp(δ)F_m(δ).

Prerequisites: `mathlib:Real.summable_pow_mul_exp_neg_nat_mul`, `mathlib:multipliable_nat_add_iff`, `mathlib:Multipliable.tprod_le_tprod`, `mathlib:Asymptotics.IsBigO.of_bound`.

Acceptance: The cutoff is strictly positive. The estimate makes no uniform claim as δ tends to zero or as m tends to infinity.

Source: RJW-published, §2.3, Lemma2.6 and its complete proof, printed111–112 / physicalPDF12–13; surrounding Theorem2.4 and Lemma2.7 read27 September2026.


### Derivative of the weighted exponential sum

Identifier: `DirichletPadicLFunctions:L0/weighted-exponential-derivative`. Kind: lemma.

For every m≥0 and t>0, F_m has real derivative −F_(m+1)(t) at t.

Hypotheses: For m≥0 and t>0, write F_m(t)=sum_(n≥1) n^m exp(−nt), using the native real infinite sum. This is notation for an explicit function, not a new summability predicate or carrier. Write b(t)=t/(exp(t)−1) on the positive half-line.

Proof or construction:

1. Fix t>0 and work on the preconnected open interval (t/2,∞). The nth summand has derivative −n^(m+1)exp(−ny), by the native exponential and constant-multiplication rules.

2. The derivative norm for y>t/2 is bounded by n^(m+1)exp(−n t/2). This majorant is summable by the pinned polynomial-weighted exponential theorem; the original sum converges at t.

3. Apply hasDerivAt_tsum_of_isPreconnected with those exact hypotheses. Pull the minus sign through the convergent derivative series.

Prerequisites: `mathlib:Real.summable_pow_mul_exp_neg_nat_mul`, `mathlib:multipliable_nat_add_iff`, `mathlib:Real.hasDerivAt_exp`, `mathlib:HasDerivAt.const_mul`, `mathlib:hasDerivAt_tsum_of_isPreconnected`.

Acceptance: Convergence of the original series alone would not justify differentiation; retain the summable derivative majorant and the open positive interval.

Source: RJW-published, §2.3, Lemma2.6 and its complete proof, printed111–112 / physicalPDF12–13; surrounding Theorem2.4 and Lemma2.7 read27 September2026.


### Geometric expansion of the reciprocal exponential

Identifier: `DirichletPadicLFunctions:L0/reciprocal-exponential-geometric`. Kind: lemma.

For t>0, F_0(t)=1/(exp(t)−1), and consequently b(t)=t F_0(t).

Hypotheses: For m≥0 and t>0, write F_m(t)=sum_(n≥1) n^m exp(−nt), using the native real infinite sum. This is notation for an explicit function, not a new summability predicate or carrier. Write b(t)=t/(exp(t)−1) on the positive half-line.

Proof or construction:

1. The ratio exp(−t) has norm less than one. Each positive-index term exp(−nt) is a power of this ratio.

2. Factor out the first power, apply the native geometric-sum theorem and simplify using exp(−t)=exp(t)⁻¹.

3. The denominator exp(t)−1 is positive for t>0, justifying the algebraic cancellation. Multiply by t to obtain the Bernoulli-kernel identity.

Prerequisites: `mathlib:tsum_geometric_of_norm_lt_one`, `mathlib:Real.summable_pow_mul_exp_neg_nat_mul`, `mathlib:multipliable_nat_add_iff`.

Tests:

- `SuggestedBernoulliDecayTests.geometric_log_two` (computation): At t=log(2), F_0(t)=1.

- `SuggestedBernoulliDecayTests.unextended_zero` (non-example): The literal quotient t/(exp(t)−1) at t=0 is zero; it does not itself define the required smooth extension with value one.

Acceptance: The formula is restricted to t>0. At zero the literal totalized quotient has value zero, while its removable extension must have value one.

Source: RJW-published, §2.3, Lemma2.6 and its complete proof, printed111–112 / physicalPDF12–13; surrounding Theorem2.4 and Lemma2.7 read27 September2026.


### Iterated derivatives of the reciprocal exponential

Identifier: `DirichletPadicLFunctions:L0/reciprocal-exponential-iterated-derivative`. Kind: lemma.

For every m≥0 and t>0, the mth ordinary real iterated derivative of t↦1/(exp(t)−1) equals (−1)^m F_m(t).

Hypotheses: For m≥0 and t>0, write F_m(t)=sum_(n≥1) n^m exp(−nt), using the native real infinite sum. This is notation for an explicit function, not a new summability predicate or carrier. Write b(t)=t/(exp(t)−1) on the positive half-line.

Proof or construction:

1. The zeroth formula is reciprocal-exponential-geometric.

2. Induct on m. The inductive identity holds on the open positive half-line, hence as an equality of germs at every positive t.

3. Use iteratedDeriv_succ and equality of derivatives of equal germs. Differentiate (−1)^m F_m with weighted-exponential-derivative and the constant-multiplication rule, obtaining (−1)^(m+1)F_(m+1).

Prerequisites: `DirichletPadicLFunctions:L0/reciprocal-exponential-geometric`, `DirichletPadicLFunctions:L0/weighted-exponential-derivative`, `mathlib:iteratedDeriv_succ`, `mathlib:Filter.EventuallyEq.deriv_eq`, `mathlib:HasDerivAt.const_mul`.

Acceptance: Only local identities at positive t are differentiated. No derivative of a divergent series at zero is asserted.

Source: RJW-published, §2.3, Lemma2.6 and its complete proof, printed111–112 / physicalPDF12–13; surrounding Theorem2.4 and Lemma2.7 read27 September2026.


### Positive-half-line Bernoulli derivative formula

Identifier: `DirichletPadicLFunctions:L0/bernoulli-positive-derivative-formula`. Kind: lemma.

For every m≥0 and t>0, b^(m+1)(t)=(−1)^m((m+1)F_m(t)−tF_(m+1)(t)).

Hypotheses: For m≥0 and t>0, write F_m(t)=sum_(n≥1) n^m exp(−nt), using the native real infinite sum. This is notation for an explicit function, not a new summability predicate or carrier. Write b(t)=t/(exp(t)−1) on the positive half-line.

Proof or construction:

1. Differentiate b=tF_0 locally, using the product rule and the weighted exponential derivative, to obtain b′=F_0−tF_1.

2. For the inductive step differentiate the displayed m formula on the open positive half-line. The two contributions to F_(m+1) have coefficients −(m+1) and −1, giving the new coefficient m+2 with the next alternating sign.

3. Use the native sum, product and constant rules and iteratedDeriv_succ. The zeroth formula comes from the geometric comparison and is kept separate to avoid a negative derivative index.

Prerequisites: `DirichletPadicLFunctions:L0/reciprocal-exponential-geometric`, `DirichletPadicLFunctions:L0/weighted-exponential-derivative`, `mathlib:iteratedDeriv_succ`, `mathlib:Filter.EventuallyEq.deriv_eq`, `mathlib:HasDerivAt.mul`, `mathlib:HasDerivAt.add`, `mathlib:HasDerivAt.const_mul`.

Tests:

- `SuggestedBernoulliDecayTests.first_derivative_log_two` (computation): The first derivative of the literal Bernoulli kernel at log(2) is 1−2 log(2).

Acceptance: For m=0 the formula is F_0−tF_1. The source expression with an (n−1) derivative is not applied at n=0.

Source: RJW-published, §2.3, Lemma2.6 and its complete proof, printed111–112 / physicalPDF12–13; surrounding Theorem2.4 and Lemma2.7 read27 September2026.


### Exponential decay of every Bernoulli derivative

Identifier: `DirichletPadicLFunctions:L0/bernoulli-ordinary-derivative-decay`. Kind: theorem.

For every m≥0, the mth ordinary real iterated derivative of b(t)=t/(exp(t)−1) is O(exp(−t/2)) as t→+∞.

Hypotheses: For m≥0 and t>0, write F_m(t)=sum_(n≥1) n^m exp(−nt), using the native real infinite sum. This is notation for an explicit function, not a new summability predicate or carrier. Write b(t)=t/(exp(t)−1) on the positive half-line.

Proof or construction:

1. Use the uniform weighted-exponential bounds with δ=1. The zeroth derivative is bounded by C_0 t exp(−t) for t≥1.

2. For m=n+1, the derivative formula and nonnegativity of each F_j bound its absolute value by ((n+1)C_n+t C_(n+1))exp(−t). Each C_j is a fixed finite constant.

3. The native domination of powers by exp(t/2) absorbs both the constant and linear factor. Equivalently, (1+t)exp(−t/2) is eventually bounded. Apply the native Big-O norm-bound criterion.

4. This proves the decay assertion of Lemma2.6 with one admissible rate 1/2; the implicit bound may depend on the derivative order. It does not establish smoothness at zero.

Prerequisites: `DirichletPadicLFunctions:L0/weighted-exponential-halfline-bound`, `DirichletPadicLFunctions:L0/bernoulli-positive-derivative-formula`, `DirichletPadicLFunctions:L0/reciprocal-exponential-geometric`, `mathlib:isLittleO_pow_exp_pos_mul_atTop`, `mathlib:Asymptotics.IsBigO.of_bound`.

Tests:

- `SuggestedBernoulliDecayTests.rate_one_fails` (non-example): The zeroth Bernoulli kernel is not O(exp(−t)) at positive infinity; the factor t cannot be dropped.

Acceptance: Include derivative order zero. The stronger rate-one Big-O statement for b itself is false because b(t)/exp(−t) grows like t.

Source: RJW-published, §2.3, Lemma2.6 and its complete proof, printed111–112 / physicalPDF12–13; surrounding Theorem2.4 and Lemma2.7 read27 September2026.


### Decay on the actual Mellin half-line

Identifier: `DirichletPadicLFunctions:L0/bernoulli-within-derivative-decay`. Kind: theorem.

Let g:ℝ→ℂ agree with the real Bernoulli quotient included into ℂ at every t>0. For every m≥0, its native iteratedDerivWithin m g [0,∞) is O(exp(−t/2)) at +∞.

Hypotheses: For m≥0 and t>0, write F_m(t)=sum_(n≥1) n^m exp(−nt), using the native real infinite sum. This is notation for an explicit function, not a new summability predicate or carrier. Write b(t)=t/(exp(t)−1) on the positive half-line. g:ℝ→ℂ satisfies g(t)=(t/(exp(t)−1):ℝ) included into ℂ for all t>0.

Proof or construction:

1. The real quotient is smooth on the positive half-line by native smoothness of exp and the quotient theorem, since exp(t)−1>0 there. Inclusion into ℂ preserves its real derivatives by HasDerivAt.ofReal_comp and induction.

2. At any t>0 the equality assumption identifies g with this smooth quotient on a neighborhood. Within derivatives on [0,∞) equal the ordinary derivatives at such an interior point, and equality of germs preserves all these derivatives.

3. The complex norm of an included real value is its absolute value. Transfer bernoulli-ordinary-derivative-decay through these eventual equalities.

4. This supplies exactly the all-derivative decay premise of normalized-mellin-continuation for any correct smooth extension. The independent ContDiffOn hypothesis at zero must still be proved.

Prerequisites: `DirichletPadicLFunctions:L0/bernoulli-ordinary-derivative-decay`, `mathlib:Real.contDiff_exp`, `mathlib:ContDiffOn.div`, `mathlib:HasDerivAt.ofReal_comp`, `mathlib:iteratedDerivWithin_eq_iteratedDeriv`, `mathlib:Filter.EventuallyEq.iteratedDerivWithin_eq`.

Acceptance: No condition on g(0) or on negative inputs is needed for this asymptotic assertion. The result does not imply that an arbitrary such g is continuous at zero.

Source: RJW-published, §2.3, Lemma2.6 and its complete proof, printed111–112 / physicalPDF12–13; surrounding Theorem2.4 and Lemma2.7 read27 September2026.


### The smooth Bernoulli kernel

Identifier: `DirichletPadicLFunctions:L0/smooth-bernoulli-kernel`. Kind: construction.

Define β:ℝ→ℝ by β(t)=dslope(exp,0,t)⁻¹, using native extended divided differences. This is the distinguished removable extension of t/(exp(t)−1) at zero.

Hypotheses: All derivatives of real-valued functions are over ℝ. B_n denotes native ordinary bernoulli(n) in ℚ, with B_1=−1/2, included in ℝ or ℂ as indicated. β is the real extension defined below, and g(t) denotes its inclusion into ℂ.

Proof or construction:

1. Use native dslope for exp centered at zero and take its pointwise reciprocal in ℝ. This introduces one function, with no custom analytic, derivative or Bernoulli carrier.

2. The following evaluation, analyticity and derivative nodes provide its operational API. Native ordinary Bernoulli numbers and their recurrence remain baseline material.

Prerequisites: `mathlib:dslope`.

API:

- `smoothBernoulliKernel_def` (data): For all real t, β(t) is the reciprocal of native dslope(exp,0,t).

- `smoothBernoulliKernel_zero` (simp): β(0)=1; promoted below.

- `smoothBernoulliKernel_of_ne` (characterisation): For t≠0, β(t)=t/(exp(t)−1); promoted below.

- `smoothBernoulliKernel_analyticAt` (structure): β is real analytic at every real point; promoted below.

- `smoothBernoulliKernel_contDiff` (structure): β is smooth to every finite order, including at zero; promoted below.

- `smoothBernoulliKernel_mul_exp_sub_one` (relation): β(t)(exp(t)−1)=t for every t; promoted below.

- `smoothBernoulliKernel_iteratedDeriv_zero` (example): The nth derivative at zero is the real image of B_n; promoted below.

- `smoothBernoulliKernel_complex_contDiff` (coercion): The inclusion g:ℝ→ℂ is smooth over ℝ; promoted below.

- `smoothBernoulliKernel_iteratedDerivWithin_zero` (compatibility): The complex within derivative D_n g at the origin equals the complex image of B_n; promoted below.

- `smoothBernoulliKernel_mellin_convergent` (compatibility): For every s∈ℂ with Re(s)>0, the actual complex kernel g is MellinConvergent at s.

- `smoothBernoulliKernel_mellin_hasSum` (compatibility): If Re(s)>0, the complex series with nth term Γ(s+1)/(n+1)^(s+1) has sum mellin(g,s).

- `smoothBernoulliKernel_mellin_eq_gamma_zeta` (compatibility): For Re(s)>0, mellin(g,s)=Γ(s+1)ζ(s+1).

- `smoothBernoulliKernel_normalizedMellin_eq_of_re_pos` (compatibility): For Re(s)>0, L(s)=sζ(s+1).

- `smoothBernoulliKernel_normalizedMellin_eq_zeta` (compatibility): For every s∈ℂ with s≠0, L(s)=sζ(s+1). At the removable point the existing Bernoulli value gives L(0)=1; the raw totalized expression 0·ζ(1) is zero and is not asserted equal to it.

Tests:

- `SuggestedBernoulliOriginTests.extended_zero` (computation): β(0)=1.

- `SuggestedBernoulliOriginTests.log_two` (computation): β(log(2))=log(2).

- `SuggestedBernoulliOriginTests.literal_quotient_mismatch` (non-example): β(0) differs from the literal totalized quotient 0/(exp(0)−1), which is zero.

Acceptance: The real field uses totalized inverse. Its value at the origin is verified by the derivative of exp, so the defining expression is not the totalized quotient t/(exp(t)−1).

Source: RJW-published, §2.3, Theorem2.4, the Bernoulli generating-function paragraph and Remark2.5, printed110–111 / PDF11–12; complete surrounding printed110–114 freshly read27 September2026.


### The Bernoulli kernel at zero

Identifier: `DirichletPadicLFunctions:L0/smooth-bernoulli-zero`. Kind: lemma.

β(0)=1.

Hypotheses: All derivatives of real-valued functions are over ℝ. B_n denotes native ordinary bernoulli(n) in ℚ, with B_1=−1/2, included in ℝ or ℂ as indicated. β is the real extension defined below, and g(t) denotes its inclusion into ℂ.

Proof or construction:

1. Native dslope_same evaluates the denominator as exp′(0). The native derivative of exp gives exp(0)=1, whose inverse is one.

Prerequisites: `DirichletPadicLFunctions:L0/smooth-bernoulli-kernel`, `mathlib:dslope_same`, `mathlib:Real.hasDerivAt_exp`.

Acceptance: This value supplies B_0 and is essential for continuity.

Source: RJW-published, §2.3, Theorem2.4, the Bernoulli generating-function paragraph and Remark2.5, printed110–111 / PDF11–12; complete surrounding printed110–114 freshly read27 September2026.


### The Bernoulli quotient away from zero

Identifier: `DirichletPadicLFunctions:L0/smooth-bernoulli-away`. Kind: lemma.

For every real t≠0, β(t)=t/(exp(t)−1).

Hypotheses: All derivatives of real-valued functions are over ℝ. B_n denotes native ordinary bernoulli(n) in ℚ, with B_1=−1/2, included in ℝ or ℂ as indicated. β is the real extension defined below, and g(t) denotes its inclusion into ℂ.

Proof or construction:

1. Use dslope_of_ne and the native slope formula to identify the denominator as (exp(t)−1)/t.

2. Invert the quotient in ℝ and simplify. This identity holds on both punctured real half-lines.

Prerequisites: `DirichletPadicLFunctions:L0/smooth-bernoulli-kernel`, `mathlib:dslope_of_ne`.

Acceptance: The hypothesis t≠0 must remain; the equality fails at zero.

Source: RJW-published, §2.3, Theorem2.4, the Bernoulli generating-function paragraph and Remark2.5, printed110–111 / PDF11–12; complete surrounding printed110–114 freshly read27 September2026.


### Analyticity of the Bernoulli extension

Identifier: `DirichletPadicLFunctions:L0/smooth-bernoulli-analytic`. Kind: theorem.

β is real analytic at every t∈ℝ.

Hypotheses: All derivatives of real-valued functions are over ℝ. B_n denotes native ordinary bernoulli(n) in ℚ, with B_1=−1/2, included in ℝ or ℂ as indicated. β is the real extension defined below, and g(t) denotes its inclusion into ℂ.

Proof or construction:

1. At zero choose the native power series of exp. HasFPowerSeriesAt.has_fpower_series_dslope_fslope supplies an analytic power series for dslope(exp,0) there.

2. At a nonzero t, a neighborhood avoids zero. The slope agrees there with (exp(x)−1)/x, analytic by native division and equality of germs.

3. The denominator dslope(exp,0,t) never vanishes: at zero it is one; away from zero exp(t)−1 and t are nonzero because the real exponential equals one exactly at zero. Apply native analytic inversion.

Prerequisites: `DirichletPadicLFunctions:L0/smooth-bernoulli-kernel`, `mathlib:dslope_same`, `mathlib:dslope_of_ne`, `mathlib:Real.hasDerivAt_exp`, `mathlib:HasFPowerSeriesAt.has_fpower_series_dslope_fslope`, `mathlib:analyticAt_rexp`, `mathlib:AnalyticAt.div`, `mathlib:AnalyticAt.inv`, `mathlib:AnalyticAt.congr`, `mathlib:Real.exp_eq_one_iff`.

Acceptance: Analyticity is over ℝ on the real line. No claim of an entire complex extension of t/(exp(t)−1) is made.

Source: RJW-published, §2.3, Theorem2.4, the Bernoulli generating-function paragraph and Remark2.5, printed110–111 / PDF11–12; complete surrounding printed110–114 freshly read27 September2026.


### Smoothness of the Bernoulli extension

Identifier: `DirichletPadicLFunctions:L0/smooth-bernoulli-smooth`. Kind: lemma.

β is a native C∞ real function on all of ℝ.

Hypotheses: All derivatives of real-valued functions are over ℝ. B_n denotes native ordinary bernoulli(n) in ℚ, with B_1=−1/2, included in ℝ or ℂ as indicated. β is the real extension defined below, and g(t) denotes its inclusion into ℂ.

Proof or construction:

1. Assemble the analytic-at-every-point conclusion into native AnalyticOnNhd on the whole real line. Apply AnalyticOnNhd.contDiff.

Prerequisites: `DirichletPadicLFunctions:L0/smooth-bernoulli-analytic`, `mathlib:AnalyticOnNhd.contDiff`.

Acceptance: This includes smoothness at zero, not just on t>0.

Source: RJW-published, §2.3, Theorem2.4, the Bernoulli generating-function paragraph and Remark2.5, printed110–111 / PDF11–12; complete surrounding printed110–114 freshly read27 September2026.


### The Bernoulli exponential product identity

Identifier: `DirichletPadicLFunctions:L0/smooth-bernoulli-product`. Kind: lemma.

For every real t, β(t)(exp(t)−1)=t.

Hypotheses: All derivatives of real-valued functions are over ℝ. B_n denotes native ordinary bernoulli(n) in ℚ, with B_1=−1/2, included in ℝ or ℂ as indicated. β is the real extension defined below, and g(t) denotes its inclusion into ℂ.

Proof or construction:

1. At zero both sides vanish. At t≠0 use smooth-bernoulli-away and cancel exp(t)−1, nonzero by exp(t)=1 iff t=0.

Prerequisites: `DirichletPadicLFunctions:L0/smooth-bernoulli-away`, `mathlib:Real.exp_eq_one_iff`.

Acceptance: The identity holds at zero, but by itself it does not determine β(0) or regularity there.

Source: RJW-published, §2.3, Theorem2.4, the Bernoulli generating-function paragraph and Remark2.5, printed110–111 / PDF11–12; complete surrounding printed110–114 freshly read27 September2026.


### The Bernoulli derivative recurrence

Identifier: `DirichletPadicLFunctions:L0/smooth-bernoulli-derivative-recurrence`. Kind: lemma.

For every n≥0, the sum over 0≤k≤n of choose(n+1,k) β^(k)(0) equals one if n=0 and zero otherwise.

Hypotheses: All derivatives of real-valued functions are over ℝ. B_n denotes native ordinary bernoulli(n) in ℚ, with B_1=−1/2, included in ℝ or ℂ as indicated. β is the real extension defined below, and g(t) denotes its inclusion into ℂ.

Proof or construction:

1. Differentiate the product identity n+1 times at zero using native iteratedDeriv_mul and the established smoothness of both factors.

2. The zeroth derivative of exp−1 at zero is zero; every positive derivative is one, by native subtraction, constant derivatives and iterated exponential derivatives. Thus the k=n+1 product term vanishes and all remaining second-factor derivatives are one.

3. The (n+1)st derivative of the identity at zero is one exactly when n=0. This gives the displayed finite recurrence without differentiating an unproved Bernoulli infinite series.

Prerequisites: `DirichletPadicLFunctions:L0/smooth-bernoulli-product`, `DirichletPadicLFunctions:L0/smooth-bernoulli-smooth`, `mathlib:Real.contDiff_exp`, `mathlib:iteratedDeriv_mul`, `mathlib:iteratedDeriv_sub`, `mathlib:iteratedDeriv_const`, `mathlib:Real.iter_deriv_exp`, `mathlib:iteratedDeriv_eq_iterate`, `mathlib:iteratedDeriv_fun_id_zero`.

Acceptance: The upper limit is n and the binomial coefficient uses n+1. The coefficient of the unknown nth derivative is n+1.

Source: RJW-published, §2.3, Theorem2.4, the Bernoulli generating-function paragraph and Remark2.5, printed110–111 / PDF11–12; complete surrounding printed110–114 freshly read27 September2026.


### Bernoulli derivatives at the origin

Identifier: `DirichletPadicLFunctions:L0/smooth-bernoulli-derivatives`. Kind: theorem.

For every n≥0, β^(n)(0) is the real image of the rational Bernoulli number B_n.

Hypotheses: All derivatives of real-valued functions are over ℝ. B_n denotes native ordinary bernoulli(n) in ℚ, with B_1=−1/2, included in ℝ or ℂ as indicated. β is the real extension defined below, and g(t) denotes its inclusion into ℂ.

Proof or construction:

1. Map native sum_bernoulli(n+1) from ℚ to ℝ, obtaining exactly the same recurrence as smooth-bernoulli-derivative-recurrence.

2. Strongly induct on n. Split both finite sums into k<n and k=n. All terms of lower order agree by the inductive hypothesis.

3. Cancel the common lower-order sum and then the nonzero coefficient choose(n+1,n)=n+1 in ℝ. The n=0 case gives β(0)=B_0 without a separate division by zero.

Prerequisites: `DirichletPadicLFunctions:L0/smooth-bernoulli-derivative-recurrence`, `mathlib:sum_bernoulli`, `mathlib:bernoulli_zero`, `mathlib:bernoulli_one`, `mathlib:bernoulli_two`.

Tests:

- `SuggestedBernoulliOriginTests.first_derivative` (computation): β′(0)=−1/2.

- `SuggestedBernoulliOriginTests.second_derivative` (computation): β^(2)(0)=1/6.

Acceptance: Use ordinary bernoulli, not the positive-B_1 variant bernoulli-prime. No convergence radius for the Bernoulli series is asserted.

Source: RJW-published, §2.3, Theorem2.4, the Bernoulli generating-function paragraph and Remark2.5, printed110–111 / PDF11–12; complete surrounding printed110–114 freshly read27 September2026.


### The complex-valued Bernoulli kernel

Identifier: `DirichletPadicLFunctions:L0/smooth-bernoulli-complex-smooth`. Kind: lemma.

The function g:ℝ→ℂ given by g(t)=β(t) included into ℂ is C∞ over ℝ.

Hypotheses: All derivatives of real-valued functions are over ℝ. B_n denotes native ordinary bernoulli(n) in ℚ, with B_1=−1/2, included in ℝ or ℂ as indicated. β is the real extension defined below, and g(t) denotes its inclusion into ℂ.

Proof or construction:

1. Compose β with native Complex.ofRealCLM. Native smoothness under a continuous linear map preserves all orders. Restricting to [0,∞) gives the exact ContDiffOn premise used by normalized Mellin continuation.

Prerequisites: `DirichletPadicLFunctions:L0/smooth-bernoulli-smooth`, `mathlib:ContDiff.continuousLinearMap_comp`, `mathlib:Complex.ofRealCLM`.

Acceptance: The scalar field for differentiating g is ℝ; its codomain is ℂ.

Source: RJW-published, §2.3, Theorem2.4, the Bernoulli generating-function paragraph and Remark2.5, printed110–111 / PDF11–12; complete surrounding printed110–114 freshly read27 September2026.


### Bernoulli right derivatives at zero

Identifier: `DirichletPadicLFunctions:L0/smooth-bernoulli-within-values`. Kind: lemma.

For every n≥0, the native iterated derivative within [0,∞) of g at zero equals B_n included into ℂ.

Hypotheses: All derivatives of real-valued functions are over ℝ. B_n denotes native ordinary bernoulli(n) in ℚ, with B_1=−1/2, included in ℝ or ℂ as indicated. β is the real extension defined below, and g(t) denotes its inclusion into ℂ.

Proof or construction:

1. The closed real half-line has unique derivatives, including at zero. The native ordinary/within comparison applies to the globally smooth g.

2. Native composition of iterated Frechet derivatives with Complex.ofRealCLM identifies the nth real derivative of g with the included nth derivative of β; evaluate the multilinear maps on n copies of one.

3. Use smooth-bernoulli-derivatives and compatibility of the rational, real and complex embeddings.

Prerequisites: `DirichletPadicLFunctions:L0/smooth-bernoulli-complex-smooth`, `DirichletPadicLFunctions:L0/smooth-bernoulli-smooth`, `DirichletPadicLFunctions:L0/smooth-bernoulli-derivatives`, `mathlib:uniqueDiffOn_Ici`, `mathlib:iteratedDerivWithin_eq_iteratedDeriv`, `mathlib:ContinuousLinearMap.iteratedFDeriv_comp_left`.

Acceptance: The endpoint comparison uses UniqueDiffOn, not the false assertion that zero is interior to [0,∞).

Source: RJW-published, §2.3, Theorem2.4, the Bernoulli generating-function paragraph and Remark2.5, printed110–111 / PDF11–12; complete surrounding printed110–114 freshly read27 September2026.


### Entire Bernoulli Mellin continuation

Identifier: `DirichletPadicLFunctions:L0/bernoulli-mellin-entire`. Kind: theorem.

The existing normalizedMellinContinuation applied to g(t)=β(t) included into ℂ is complex differentiable at every s∈ℂ.

Hypotheses: All derivatives of real-valued functions are over ℝ. B_n denotes native ordinary bernoulli(n) in ℚ, with B_1=−1/2, included in ℝ or ℂ as indicated. β is the real extension defined below, and g(t) denotes its inclusion into ℂ.

Proof or construction:

1. Use the complex smoothness node and restrict to [0,∞). On t>0, the away-from-zero quotient formula identifies g with the literal real Bernoulli quotient.

2. Instantiate bernoulli-within-derivative-decay with this equality: for every order choose the positive rate1/2. Apply normalized-mellin-entire.

Prerequisites: `DirichletPadicLFunctions:L0/smooth-bernoulli-complex-smooth`, `DirichletPadicLFunctions:L0/smooth-bernoulli-away`, `DirichletPadicLFunctions:L0/bernoulli-within-derivative-decay`, `DirichletPadicLFunctions:L0/normalized-mellin-entire`.

Acceptance: This is an instantiation of the existing normalized continuation; no new Mellin carrier is introduced. The zeta comparison requires a separate sum/integral proof.

Source: RJW-published, §2.3, Theorem2.4, the Bernoulli generating-function paragraph and Remark2.5, printed110–111 / PDF11–12; complete surrounding printed110–114 freshly read27 September2026.


### Bernoulli Mellin values

Identifier: `DirichletPadicLFunctions:L0/bernoulli-mellin-values`. Kind: theorem.

For every n≥0, normalizedMellinContinuation(g,−n)=(−1)^n B_n in ℂ.

Hypotheses: All derivatives of real-valued functions are over ℝ. B_n denotes native ordinary bernoulli(n) in ℚ, with B_1=−1/2, included in ℝ or ℂ as indicated. β is the real extension defined below, and g(t) denotes its inclusion into ℂ.

Proof or construction:

1. Supply smoothness and all-derivative decay exactly as for bernoulli-mellin-entire. Apply the existing normalized-mellin-negative-values theorem.

2. Substitute the actual within derivative at zero from smooth-bernoulli-within-values.

Prerequisites: `DirichletPadicLFunctions:L0/smooth-bernoulli-complex-smooth`, `DirichletPadicLFunctions:L0/smooth-bernoulli-away`, `DirichletPadicLFunctions:L0/bernoulli-within-derivative-decay`, `DirichletPadicLFunctions:L0/normalized-mellin-negative-values`, `DirichletPadicLFunctions:L0/smooth-bernoulli-within-values`.

Tests:

- `SuggestedBernoulliOriginTests.mellin_minus_one` (computation): The continued normalized Mellin transform of g at −1 equals +1/2.

Acceptance: The n=1 value is +1/2. This is a Mellin-continuation value, not ζ(0); the source E2 correction and native ζ(0)=−1/2 remain unchanged.

Source: RJW-published, §2.3, Theorem2.4, the Bernoulli generating-function paragraph and Remark2.5, printed110–111 / PDF11–12; complete surrounding printed110–114 freshly read27 September2026.


### Convergence of the Bernoulli Mellin integral

Identifier: `DirichletPadicLFunctions:L0/bernoulli-mellin-convergent`. Kind: lemma.

For every s∈ℂ with Re(s)>0, the actual complex kernel g is MellinConvergent at s.

Hypotheses: β is the existing real smoothBernoulliKernel, and g(t) is β(t) included into ℂ. L(s) is the existing normalizedMellinContinuation(g,s). Real powers on t>0 and native complex powers use the library conventions. All sums run over n≥0 with positive index n+1.

Proof or construction:

1. Global real smoothness of g gives continuity, hence local integrability on the measurable open positive half-line. Continuity at zero gives g=O(1) in the right-hand neighborhood filter; write one as t^0.

2. Specialize bernoulli-within-derivative-decay to order zero, using smooth-bernoulli-away on t>0. Its rate1/2 gives g=O(exp(−t/2)) at infinity.

3. Apply native mellinConvergent_of_isBigO_rpow_exp with a=1/2 and b=0. Its remaining inequality is exactly Re(s)>0.

Prerequisites: `DirichletPadicLFunctions:L0/smooth-bernoulli-complex-smooth`, `DirichletPadicLFunctions:L0/smooth-bernoulli-away`, `DirichletPadicLFunctions:L0/bernoulli-within-derivative-decay`, `mathlib:ContinuousOn.locallyIntegrableOn`, `mathlib:Filter.Tendsto.isBigO_one`, `mathlib:mellinConvergent_of_isBigO_rpow_exp`.

Acceptance: Use the actual removable extension and native integrability, so subsequent integral values are not artifacts of totalized integration.

Source: RJW-published, §2.3, Lemma2.7 and its full proof, printed112/PDF13; Theorem2.4–Corollary2.8 and surrounding printed110–114/PDF11–15 read27 September2026.


### The Bernoulli Mellin Dirichlet series

Identifier: `DirichletPadicLFunctions:L0/bernoulli-mellin-dirichlet-sum`. Kind: lemma.

If Re(s)>0, the complex series with nth term Γ(s+1)/(n+1)^(s+1) has sum mellin(g,s).

Hypotheses: β is the existing real smoothBernoulliKernel, and g(t) is β(t) included into ℂ. L(s) is the existing normalizedMellinContinuation(g,s). Real powers on t>0 and native complex powers use the library conventions. All sums run over n≥0 with positive index n+1.

Proof or construction:

1. For real t>0, exp(−t) has norm less than one. Instantiate the native geometric HasSum theorem and shift by one positive index to get sum exp(−(n+1)t)=1/(exp(t)−1). Native exp_nat_mul and field algebra give the exact complex-valued terms.

2. Apply native hasSum_mellin to F(t)=1/(exp(t)−1), coefficients a_n=1, frequencies p_n=n+1, and parameter s+1. All frequencies are positive. The required sum of norms is sum 1/(n+1)^(Re(s)+1), summable by the native shifted p-series theorem.

3. The native theorem already supplies each scaled Gamma integral and the absolutely convergent sum/integral interchange. Do not introduce replacement nodes for those general results.

4. On t>0 the existing kernel satisfies g(t)=tF(t). The native Mellin power shift at exponent one, or equality of the two integrands, identifies mellin(F,s+1)=mellin(g,s). The value at zero does not enter the integral.

Prerequisites: `DirichletPadicLFunctions:L0/smooth-bernoulli-away`, `DirichletPadicLFunctions:L0/bernoulli-mellin-convergent`, `mathlib:hasSum_mellin`, `mathlib:hasSum_geometric_of_norm_lt_one`, `mathlib:Complex.exp_nat_mul`, `mathlib:Real.summable_one_div_nat_add_rpow`, `mathlib:mellin_cpow_smul`.

Acceptance: The summability check must use Re(s)+1>1, positive indices and the actual coefficients one. No unproved interchange premise is accepted.

Source: RJW-published, §2.3, Lemma2.7 and its full proof, printed112/PDF13; Theorem2.4–Corollary2.8 and surrounding printed110–114/PDF11–15 read27 September2026.


### The Bernoulli Gamma–zeta integral

Identifier: `DirichletPadicLFunctions:L0/bernoulli-mellin-gamma-zeta`. Kind: theorem.

For Re(s)>0, mellin(g,s)=Γ(s+1)ζ(s+1).

Hypotheses: β is the existing real smoothBernoulliKernel, and g(t) is β(t) included into ℂ. L(s) is the existing normalizedMellinContinuation(g,s). Real powers on t>0 and native complex powers use the library conventions. All sums run over n≥0 with positive index n+1.

Proof or construction:

1. Take the sum of bernoulli-mellin-dirichlet-sum. Factor out Γ(s+1) using the native scalar-multiple rule for infinite sums.

2. Apply the native positive-index Dirichlet-series formula for ζ at s+1; its condition Re(s+1)>1 follows from Re(s)>0.

Prerequisites: `DirichletPadicLFunctions:L0/bernoulli-mellin-dirichlet-sum`, `mathlib:zeta_eq_tsum_one_div_nat_add_one_cpow`.

Tests:

- `SuggestedBernoulliMellinTests.integral_at_one` (comparison): mellin(g,1)=ζ(2), using Γ(2)=1.

Acceptance: The Gamma argument is s+1. This is a convergent integral identity only on the stated half-plane.

Source: RJW-published, §2.3, Lemma2.7 and its full proof, printed112/PDF13; Theorem2.4–Corollary2.8 and surrounding printed110–114/PDF11–15 read27 September2026.


### The normalized Bernoulli Mellin comparison

Identifier: `DirichletPadicLFunctions:L0/bernoulli-mellin-normalized-halfplane`. Kind: lemma.

For Re(s)>0, L(s)=sζ(s+1).

Hypotheses: β is the existing real smoothBernoulliKernel, and g(t) is β(t) included into ℂ. L(s) is the existing normalizedMellinContinuation(g,s). Real powers on t>0 and native complex powers use the library conventions. All sums run over n≥0 with positive index n+1.

Proof or construction:

1. Use the existing normalized-mellin-initial-halfplane API for this actual g. Its smoothness and all-order exponential decay follow from the already supplied Bernoulli nodes, with rate1/2 for every order.

2. Substitute bernoulli-mellin-gamma-zeta into L(s)=mellin(g,s)/Γ(s). Since Re(s)>0, s≠0 and Γ(s)≠0.

3. Apply the native recurrence Γ(s+1)=sΓ(s) and cancel Γ(s), obtaining the displayed normalization.

Prerequisites: `DirichletPadicLFunctions:L0/smooth-bernoulli-complex-smooth`, `DirichletPadicLFunctions:L0/smooth-bernoulli-away`, `DirichletPadicLFunctions:L0/bernoulli-within-derivative-decay`, `DirichletPadicLFunctions:L0/normalized-mellin-initial-halfplane`, `DirichletPadicLFunctions:L0/bernoulli-mellin-gamma-zeta`, `mathlib:Complex.Gamma_add_one`, `mathlib:Complex.Gamma_ne_zero_of_re_pos`.

Tests:

- `SuggestedBernoulliMellinTests.factor_at_two` (computation): L(2)=2ζ(3), detecting loss of the Gamma recurrence factor.

Acceptance: Keep the factor s. No equation at the raw totalized pole follows from this half-plane result.

Source: RJW-published, §2.3, Lemma2.7 and its full proof, printed112/PDF13; Theorem2.4–Corollary2.8 and surrounding printed110–114/PDF11–15 read27 September2026.


### Bernoulli Mellin continuation and zeta

Identifier: `DirichletPadicLFunctions:L0/bernoulli-mellin-zeta-comparison`. Kind: theorem.

For every s∈ℂ with s≠0, L(s)=sζ(s+1). At the removable point the existing Bernoulli value gives L(0)=1; the raw totalized expression 0·ζ(1) is zero and is not asserted equal to it.

Hypotheses: β is the existing real smoothBernoulliKernel, and g(t) is β(t) included into ℂ. L(s) is the existing normalizedMellinContinuation(g,s). Real powers on t>0 and native complex powers use the library conventions. All sums run over n≥0 with positive index n+1.

Proof or construction:

1. The actual L is entire by bernoulli-mellin-entire. Native differentiability of ζ away from one makes s↦sζ(s+1) analytic on neighborhoods of ℂ minus {0}.

2. The punctured complex plane is connected: its real module rank is two, so the native complement-of-singleton theorem applies. The half-plane comparison gives equality in a neighborhood of the point1.

3. Apply the native analytic identity principle on that punctured plane. This extends the equality to every s≠0 without choosing an unproved global continuation.

4. For the boundary test only, specialize the existing bernoulli-mellin-values at n=0 to get L(0)=B_0=1. This is a removable value, not a new construction or a pointwise extension of the raw product.

Prerequisites: `DirichletPadicLFunctions:L0/bernoulli-mellin-entire`, `DirichletPadicLFunctions:L0/bernoulli-mellin-normalized-halfplane`, `DirichletPadicLFunctions:L0/bernoulli-mellin-values`, `mathlib:bernoulli_zero`, `mathlib:differentiableAt_riemannZeta`, `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `mathlib:isConnected_compl_singleton_of_one_lt_rank`, `mathlib:Complex.rank_real_complex`.

Tests:

- `SuggestedBernoulliMellinTests.continued_origin` (computation): L(0)=1.

- `SuggestedBernoulliMellinTests.raw_pole_mismatch` (non-example): L(0) differs from the raw totalized complex expression 0·ζ(1).

Acceptance: The suggested theorem states s≠0 explicitly. Native ζ(−n) values are imported; source E2/E5 remain intact, and no new source error is inferred from meromorphic notation.

Source: RJW-published, §2.3, Lemma2.7 and its full proof, printed112/PDF13; Theorem2.4–Corollary2.8 and surrounding printed110–114/PDF11–15 read27 September2026.


### The smooth smoothed Mellin kernel

Identifier: `DirichletPadicLFunctions:L0/smoothed-mellin-kernel`. Kind: construction.

For real a, define h_a:ℝ→ℝ as the native extended divided difference at zero of x↦β(x)−β(ax). Equivalently away from t=0 it is (β(t)−β(at))/t, with its derivative-defined value at zero.

Hypotheses: β is the already constructed real smoothBernoulliKernel, with ordinary Bernoulli convention B_1=−1/2. Define h_a below and write g_a(t) for its inclusion into ℂ. F_m(t) denotes the existing explicit real sum of (n+1)^m exp(−(n+1)t) for n≥0. Real and complex derivatives of these kernels are taken over ℝ.

Proof or construction:

1. The difference β(x)−β(ax) vanishes at x=0. Apply native dslope centered at zero to that function. This is a real function built from the existing β, not a new analytic-function carrier.

2. The following origin, punctured quotient, smoothness and derivative declarations give its operational API. At a=1 the difference is identically zero, so the kernel vanishes.

3. For a≠0 and t≠0, substitution of the existing Bernoulli quotient recovers the source f_a. Positivity is imposed when using decay and Mellin continuation, as required by the preserved source finding E3.

Prerequisites: `DirichletPadicLFunctions:L0/smooth-bernoulli-kernel`, `mathlib:dslope`.

API:

- `smoothedMellinKernel_def` (data): h_a(t) is native dslope at zero of x↦β(x)−β(ax).

- `smoothedMellinKernel_zero` (simp): For every real a, h_a(0)=(a−1)/2.

- `smoothedMellinKernel_one` (simp): For every real t, h_1(t)=0.

- `smoothedMellinKernel_of_ne` (characterisation): For a≠0 and t≠0, h_a(t)=1/(exp(t)−1)−a/(exp(at)−1); promoted below.

- `smoothedMellinKernel_analyticAt` (structure): For every real a, h_a is real analytic everywhere; promoted below.

- `smoothedMellinKernel_contDiff` (structure): For every real a, h_a is globally smooth over ℝ; promoted below.

- `smoothedMellinKernel_mul` (relation): For all real a,t, t h_a(t)=β(t)−β(at); promoted below.

- `smoothedMellinKernel_iteratedDeriv_zero` (example): For every n≥0, h_a^(n)(0)=(1−a^(n+1))B_(n+1)/(n+1); promoted below.

- `smoothedMellinKernel_iteratedDeriv_pos` (relation): For a,t>0, the mth derivative is (−1)^m(F_m(t)−a^(m+1)F_m(at)); promoted below.

- `smoothedMellinKernel_iteratedDeriv_decay` (compatibility): For a>0, every derivative has decay O(exp(−min(1,a)t)); promoted below.

- `smoothedMellinKernel_complex_contDiff` (coercion): The inclusion g_a is globally smooth over ℝ; promoted below.

- `smoothedMellinKernel_iteratedDerivWithin_zero` (compatibility): The complex within derivative at zero is the included real Bernoulli formula; promoted below.

- `smoothedMellinKernel_iteratedDerivWithin_decay` (compatibility): For a>0, every complex within derivative has the same positive decay rate; promoted below.

- `smoothedMellinKernel_mellin_entire` (structure): For a>0, the existing normalizedMellinContinuation of g_a is entire; promoted below.

- `smoothedMellinKernel_mellin_neg_nat` (example): For a>0, the continued value at −n is (−1)^n(1−a^(n+1))B_(n+1)/(n+1); promoted below.

- `smoothedMellinKernel_mellin_convergent` (compatibility): For a>0, the actual complex kernel is Mellin-convergent for Re(s)>0; promoted below.

- `smoothedMellinKernel_mellin_eq_gamma_zeta` (compatibility): For a>0 and Re(s)>1, its Mellin transform is Γ(s)(1−a^(1−s))ζ(s); promoted below.

- `smoothedMellinKernel_normalized_halfplane` (compatibility): For a>0 and Re(s)>1, its normalized continuation is (1−a^(1−s))ζ(s); promoted below.

- `smoothedMellinKernel_normalized_eq_zeta` (compatibility): For a>0 the smoothed zeta comparison holds for every s≠1; promoted below.

- `smoothedMellinKernel_mellin_one` (example): For a>0 its normalized value at1 is the included real log(a); promoted below.

- `smoothedMellinKernel_iteratedDeriv_eq_formal` (compatibility): For natural a with rational unit image, every actual real origin derivative is the real image of c_(a,k); promoted.

- `smoothedMellinKernel_mellin_neg_nat_eq_formal` (compatibility): For natural a>0, the normalized value at−k is (−1)^k times the complex image of c_(a,k); promoted.

- `smoothedMellinKernel_cocycle` (relation): For every a,b,t∈ℝ, h_(ab)(t)=h_a(t)+a h_b(at). Promoted to DirichletPadicLFunctions:L0/smoothed-kernel-cocycle.

- `smoothedMellinKernel_commute` (relation): For every real a,b,t, h_a(t)+a h_b(at)=h_b(t)+b h_a(bt). Promoted to DirichletPadicLFunctions:L0/smoothed-kernel-commute.

- `smoothedMellinKernel_iteratedDeriv_cocycle` (relation): For a,b∈ℝ and n∈ℕ, h_(ab)^(n)(0)=h_a^(n)(0)+a^(n+1)h_b^(n)(0). Promoted to DirichletPadicLFunctions:L0/smoothed-origin-derivative-cocycle.

- `smoothedMellinKernel_mellin_cocycle` (relation): For a,b>0 and s∈ℂ with Re(s)>0, M(g_(ab),s)=M(g_a,s)+a^(1−s)M(g_b,s), where g_a(t) is the complex inclusion of h_a(t) and M is native unnormalized mellin. Promoted to DirichletPadicLFunctions:L0/smoothed-mellin-cocycle.

- `smoothedMellinKernel_normalized_cocycle` (compatibility): For a,b>0 and every s∈ℂ, L_(ab)(s)=L_a(s)+a^(1−s)L_b(s), where L_a is the already constructed normalizedMellinContinuation of g_a. Promoted to DirichletPadicLFunctions:L0/smoothed-normalized-cocycle.

Tests:

- `SuggestedSmoothedKernelTests.two_at_zero` (computation): h_2(0)=1/2.

- `SuggestedSmoothedKernelTests.one_kernel` (degenerate): h_1 is identically zero.

- `SuggestedSmoothedKernelTests.two_at_log_two` (computation): h_2(log(2))=1/3, agreeing with 1/(exp(t)+1).

Acceptance: Do not define h_a by the raw totalized reciprocal-exponential difference: that expression is zero at t=0, while h_a(0)=(a−1)/2. The real parameter a=0 is admitted in the definition but not in the decay application.

Source: RJW-published, §4.1, the function f_a and Lemma4.2, printed136/PDF37; surrounding printed134–139/PDF35–40 read27 September2026. Theorem2.4 and Lemma2.6 supply the earlier continuation/decay context.


### The smoothed exponential quotient

Identifier: `DirichletPadicLFunctions:L0/smoothed-kernel-away`. Kind: lemma.

For real a≠0 and t≠0, h_a(t)=1/(exp(t)−1)−a/(exp(at)−1).

Hypotheses: β is the already constructed real smoothBernoulliKernel, with ordinary Bernoulli convention B_1=−1/2. Define h_a below and write g_a(t) for its inclusion into ℂ. F_m(t) denotes the existing explicit real sum of (n+1)^m exp(−(n+1)t) for n≥0. Real and complex derivatives of these kernels are taken over ℝ.

Proof or construction:

1. Expand dslope away from its center as (β(t)−β(at))/t. The center value of the difference is zero.

2. Apply smooth-bernoulli-away at t and at at, both nonzero. Cancel t and the exponential denominators, which are nonzero by exp(x)=1 iff x=0.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-mellin-kernel`, `DirichletPadicLFunctions:L0/smooth-bernoulli-away`, `mathlib:dslope_of_ne`, `mathlib:Real.exp_eq_one_iff`.

Acceptance: Keep both nonzero hypotheses. At zero the displayed raw quotient has value zero by totalized division.

Source: RJW-published, §4.1, the function f_a and Lemma4.2, printed136/PDF37; surrounding printed134–139/PDF35–40 read27 September2026. Theorem2.4 and Lemma2.6 supply the earlier continuation/decay context.


### Analyticity of the smoothed kernel

Identifier: `DirichletPadicLFunctions:L0/smoothed-kernel-analytic`. Kind: theorem.

For every real a and every real t, h_a is real analytic at t.

Hypotheses: β is the already constructed real smoothBernoulliKernel, with ordinary Bernoulli convention B_1=−1/2. Define h_a below and write g_a(t) for its inclusion into ℂ. F_m(t) denotes the existing explicit real sum of (n+1)^m exp(−(n+1)t) for n≥0. Real and complex derivatives of these kernels are taken over ℝ.

Proof or construction:

1. The function x↦β(x)−β(ax) is real analytic everywhere, by the existing analyticity of β, analytic linear composition and subtraction.

2. At t=0, take its native analytic power series and apply HasFPowerSeriesAt.has_fpower_series_dslope_fslope. This produces the analytic extension at the center.

3. At t≠0, divide the analytic difference by x on a neighborhood avoiding zero and use equality of germs with dslope. No positivity assumption on a is needed for real analyticity.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-mellin-kernel`, `DirichletPadicLFunctions:L0/smooth-bernoulli-analytic`, `mathlib:AnalyticAt.comp`, `mathlib:AnalyticAt.sub`, `mathlib:HasFPowerSeriesAt.has_fpower_series_dslope_fslope`, `mathlib:AnalyticAt.div`, `mathlib:AnalyticAt.congr`, `mathlib:dslope_of_ne`.

Acceptance: The domain and scalar field are real. This does not assert that the reciprocal-exponential difference is entire in a complex t variable.

Source: RJW-published, §4.1, the function f_a and Lemma4.2, printed136/PDF37; surrounding printed134–139/PDF35–40 read27 September2026. Theorem2.4 and Lemma2.6 supply the earlier continuation/decay context.


### Smoothness of the smoothed kernel

Identifier: `DirichletPadicLFunctions:L0/smoothed-kernel-smooth`. Kind: lemma.

For every real a, h_a is globally C∞ over ℝ.

Hypotheses: β is the already constructed real smoothBernoulliKernel, with ordinary Bernoulli convention B_1=−1/2. Define h_a below and write g_a(t) for its inclusion into ℂ. F_m(t) denotes the existing explicit real sum of (n+1)^m exp(−(n+1)t) for n≥0. Real and complex derivatives of these kernels are taken over ℝ.

Proof or construction:

1. Assemble smoothed-kernel-analytic into native AnalyticOnNhd on the whole real line and apply native AnalyticOnNhd.contDiff.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-analytic`, `mathlib:AnalyticOnNhd.contDiff`.

Acceptance: The conclusion includes t=0 and all finite derivative orders.

Source: RJW-published, §4.1, the function f_a and Lemma4.2, printed136/PDF37; surrounding printed134–139/PDF35–40 read27 September2026. Theorem2.4 and Lemma2.6 supply the earlier continuation/decay context.


### The smoothed kernel product identity

Identifier: `DirichletPadicLFunctions:L0/smoothed-kernel-product`. Kind: lemma.

For all real a and t, h_a(t)t=β(t)−β(at).

Hypotheses: β is the already constructed real smoothBernoulliKernel, with ordinary Bernoulli convention B_1=−1/2. Define h_a below and write g_a(t) for its inclusion into ℂ. F_m(t) denotes the existing explicit real sum of (n+1)^m exp(−(n+1)t) for n≥0. Real and complex derivatives of these kernels are taken over ℝ.

Proof or construction:

1. Apply native sub_smul_dslope to the analytic difference, centered at zero. Its value at the center is β(0)−β(0)=0. Convert real scalar multiplication to multiplication.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-mellin-kernel`, `mathlib:sub_smul_dslope`.

Acceptance: This identity is global and valid also for a=0 and t=0. Regularity and the actual dslope value, not this identity alone, determine h_a(0).

Source: RJW-published, §4.1, the function f_a and Lemma4.2, printed136/PDF37; surrounding printed134–139/PDF35–40 read27 September2026. Theorem2.4 and Lemma2.6 supply the earlier continuation/decay context.


### Smoothed Bernoulli derivatives

Identifier: `DirichletPadicLFunctions:L0/smoothed-kernel-origin-derivatives`. Kind: theorem.

For every real a and every n≥0, h_a^(n)(0)=(1−a^(n+1))B_(n+1)/(n+1) in ℝ.

Hypotheses: β is the already constructed real smoothBernoulliKernel, with ordinary Bernoulli convention B_1=−1/2. Define h_a below and write g_a(t) for its inclusion into ℂ. F_m(t) denotes the existing explicit real sum of (n+1)^m exp(−(n+1)t) for n≥0. Real and complex derivatives of these kernels are taken over ℝ.

Proof or construction:

1. Differentiate the global product identity n+1 times at zero. Native higher Leibniz leaves only the term (n+1)h_a^(n)(0), because the identity function has only its first derivative nonzero there.

2. On the right, native iterated derivatives of a difference and of the globally smooth dilation β(at) give (1−a^(n+1))β^(n+1)(0). Substitute the existing Bernoulli derivative value.

3. Cancel the nonzero real integer n+1. For n=0 this gives the API value (a−1)/2 using B_1=−1/2. No infinite Bernoulli-series differentiation is used.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-product`, `DirichletPadicLFunctions:L0/smoothed-kernel-smooth`, `DirichletPadicLFunctions:L0/smooth-bernoulli-smooth`, `DirichletPadicLFunctions:L0/smooth-bernoulli-derivatives`, `mathlib:ContDiff.comp`, `mathlib:iteratedDeriv_mul`, `mathlib:iteratedDeriv_sub`, `mathlib:iteratedDeriv_comp_const_mul`, `mathlib:iteratedDeriv_fun_id_zero`, `mathlib:bernoulli_one`, `mathlib:bernoulli_two`.

Tests:

- `SuggestedSmoothedKernelTests.two_first_derivative` (computation): h_2′(0)=−1/4.

Acceptance: The Bernoulli index is n+1 and the denominator is n+1. The globally smooth β, not the singular reciprocal quotient, is used in the dilation derivative theorem.

Source: RJW-published, §4.1, the function f_a and Lemma4.2, printed136/PDF37; surrounding printed134–139/PDF35–40 read27 September2026. Theorem2.4 and Lemma2.6 supply the earlier continuation/decay context.


### Positive-half-line smoothed derivatives

Identifier: `DirichletPadicLFunctions:L0/smoothed-kernel-positive-derivatives`. Kind: lemma.

For a>0, t>0 and m≥0, h_a^(m)(t)=(−1)^m(F_m(t)−a^(m+1)F_m(at)).

Hypotheses: β is the already constructed real smoothBernoulliKernel, with ordinary Bernoulli convention B_1=−1/2. Define h_a below and write g_a(t) for its inclusion into ℂ. F_m(t) denotes the existing explicit real sum of (n+1)^m exp(−(n+1)t) for n≥0. Real and complex derivatives of these kernels are taken over ℝ.

Proof or construction:

1. At m=0, use smoothed-kernel-away and the existing reciprocal-exponential-geometric identity at t and at at.

2. Induct on m. The induction hypothesis holds on the open positive half-line, hence on a neighborhood of each positive t. Transfer derivatives through this equality of germs.

3. Differentiate F_m(t) using weighted-exponential-derivative. Differentiate F_m(at) with the same theorem at at>0 and the native chain rule for multiplication by a. The latter supplies one additional factor a.

4. Combine subtraction and scalar-multiplication derivatives and simplify the signs and powers, obtaining the m+1 formula. No global smoothness at zero is assumed for the raw reciprocal exponential.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-away`, `DirichletPadicLFunctions:L0/reciprocal-exponential-geometric`, `DirichletPadicLFunctions:L0/weighted-exponential-derivative`, `mathlib:iteratedDeriv_succ`, `mathlib:Filter.EventuallyEq.deriv_eq`, `mathlib:HasDerivAt.comp`, `mathlib:hasDerivAt_const_mul`, `mathlib:HasDerivAt.const_mul`, `mathlib:HasDerivAt.sub`.

Acceptance: The dilation power is a^(m+1), not a^m. Positivity keeps both evaluation points in the series convergence domain.

Source: RJW-published, §4.1, the function f_a and Lemma4.2, printed136/PDF37; surrounding printed134–139/PDF35–40 read27 September2026. Theorem2.4 and Lemma2.6 supply the earlier continuation/decay context.


### Exponential decay of smoothed derivatives

Identifier: `DirichletPadicLFunctions:L0/smoothed-kernel-derivative-decay`. Kind: theorem.

For a>0 and every m≥0, h_a^(m) is O(exp(−min(1,a)t)) as t→+∞.

Hypotheses: β is the already constructed real smoothBernoulliKernel, with ordinary Bernoulli convention B_1=−1/2. Define h_a below and write g_a(t) for its inclusion into ℂ. F_m(t) denotes the existing explicit real sum of (n+1)^m exp(−(n+1)t) for n≥0. Real and complex derivatives of these kernels are taken over ℝ.

Proof or construction:

1. Use weighted-exponential-halfline-bound at cutoff1. Write C_m=exp(1)F_m(1)≥0. Then F_m(t)≤C_m exp(−t) for t≥1, and F_m(at)≤C_m exp(−at) once at≥1.

2. For t≥max(1,1/a), both estimates apply. The positive-derivative formula and triangle inequality bound the absolute derivative by C_m(exp(−t)+a^(m+1)exp(−at)).

3. Since a>0 and t≥0, both exponentials are at most exp(−min(1,a)t). The explicit bound is C_m(1+a^(m+1)) times this exponential. Apply native IsBigO.of_bound.

4. The rate min(1,a) is positive and independent of m; the implicit constant may depend on both a and m. No uniform bound as a tends to zero is asserted.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-positive-derivatives`, `DirichletPadicLFunctions:L0/weighted-exponential-halfline-bound`, `mathlib:Asymptotics.IsBigO.of_bound`.

Tests:

- `SuggestedSmoothedKernelTests.negative_parameter` (non-example): For every real t, h_(−1)(t)=−1; the decay theorem cannot admit this negative parameter.

Acceptance: The negative parameter control h_(−1)(t)=−1 shows why source E3 positivity is necessary. The case a=1 is the zero kernel and is included.

Source: RJW-published, §4.1, the function f_a and Lemma4.2, printed136/PDF37; surrounding printed134–139/PDF35–40 read27 September2026. Theorem2.4 and Lemma2.6 supply the earlier continuation/decay context.


### The complex smoothed kernel

Identifier: `DirichletPadicLFunctions:L0/smoothed-kernel-complex-smooth`. Kind: lemma.

For every real a, g_a:ℝ→ℂ obtained by including h_a is globally C∞ over ℝ.

Hypotheses: β is the already constructed real smoothBernoulliKernel, with ordinary Bernoulli convention B_1=−1/2. Define h_a below and write g_a(t) for its inclusion into ℂ. F_m(t) denotes the existing explicit real sum of (n+1)^m exp(−(n+1)t) for n≥0. Real and complex derivatives of these kernels are taken over ℝ.

Proof or construction:

1. Compose smoothed-kernel-smooth with native Complex.ofRealCLM. Native continuous-linear-map composition preserves every derivative order.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-smooth`, `mathlib:Complex.ofRealCLM`, `mathlib:ContDiff.continuousLinearMap_comp`.

Acceptance: Smoothness is over ℝ with codomain ℂ. Its restriction supplies ContDiffOn on the closed Mellin half-line.

Source: RJW-published, §4.1, the function f_a and Lemma4.2, printed136/PDF37; surrounding printed134–139/PDF35–40 read27 September2026. Theorem2.4 and Lemma2.6 supply the earlier continuation/decay context.


### Smoothed right derivatives at zero

Identifier: `DirichletPadicLFunctions:L0/smoothed-kernel-within-values`. Kind: lemma.

For every real a and n≥0, the nth iterated derivative within [0,∞) of g_a at zero is (1−a^(n+1))B_(n+1)/(n+1), with all factors included into ℂ.

Hypotheses: β is the already constructed real smoothBernoulliKernel, with ordinary Bernoulli convention B_1=−1/2. Define h_a below and write g_a(t) for its inclusion into ℂ. F_m(t) denotes the existing explicit real sum of (n+1)^m exp(−(n+1)t) for n≥0. Real and complex derivatives of these kernels are taken over ℝ.

Proof or construction:

1. Unique differentiability of the closed real half-line identifies the within derivative at zero with the ordinary derivative of globally smooth g_a.

2. Native continuous-linear-map composition of iterated Frechet derivatives identifies that complex-valued derivative with the real derivative of h_a included into ℂ. Evaluate on n copies of1.

3. Apply smoothed-kernel-origin-derivatives and compatibility of the rational/real/complex embeddings.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-complex-smooth`, `DirichletPadicLFunctions:L0/smoothed-kernel-smooth`, `DirichletPadicLFunctions:L0/smoothed-kernel-origin-derivatives`, `mathlib:uniqueDiffOn_Ici`, `mathlib:iteratedDerivWithin_eq_iteratedDeriv`, `mathlib:ContinuousLinearMap.iteratedFDeriv_comp_left`.

Acceptance: Zero is handled as an endpoint of a uniquely differentiable closed half-line, not as an interior point.

Source: RJW-published, §4.1, the function f_a and Lemma4.2, printed136/PDF37; surrounding printed134–139/PDF35–40 read27 September2026. Theorem2.4 and Lemma2.6 supply the earlier continuation/decay context.


### Smoothed decay on the Mellin half-line

Identifier: `DirichletPadicLFunctions:L0/smoothed-kernel-within-decay`. Kind: lemma.

For a>0 and every m≥0, iteratedDerivWithin m g_a [0,∞) is O(exp(−min(1,a)t)) at +∞.

Hypotheses: β is the already constructed real smoothBernoulliKernel, with ordinary Bernoulli convention B_1=−1/2. Define h_a below and write g_a(t) for its inclusion into ℂ. F_m(t) denotes the existing explicit real sum of (n+1)^m exp(−(n+1)t) for n≥0. Real and complex derivatives of these kernels are taken over ℝ.

Proof or construction:

1. At every t>0 the closed-half-line within derivative equals the ordinary derivative of the globally smooth g_a.

2. As in smoothed-kernel-within-values, continuous-linear inclusion commutes with derivatives. The complex norm of an included real derivative is its absolute value.

3. Transfer smoothed-kernel-derivative-decay through these eventual equalities. Values at the endpoint do not enter this atTop assertion.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-complex-smooth`, `DirichletPadicLFunctions:L0/smoothed-kernel-smooth`, `DirichletPadicLFunctions:L0/smoothed-kernel-derivative-decay`, `mathlib:uniqueDiffOn_Ici`, `mathlib:iteratedDerivWithin_eq_iteratedDeriv`, `mathlib:ContinuousLinearMap.iteratedFDeriv_comp_left`.

Acceptance: Keep the positive parameter and actual kernel. This is the precise decay premise used by the existing normalized continuation.

Source: RJW-published, §4.1, the function f_a and Lemma4.2, printed136/PDF37; surrounding printed134–139/PDF35–40 read27 September2026. Theorem2.4 and Lemma2.6 supply the earlier continuation/decay context.


### Entire smoothed Mellin continuation

Identifier: `DirichletPadicLFunctions:L0/smoothed-kernel-mellin-entire`. Kind: theorem.

For a>0, the existing normalizedMellinContinuation(g_a) is complex differentiable everywhere.

Hypotheses: β is the already constructed real smoothBernoulliKernel, with ordinary Bernoulli convention B_1=−1/2. Define h_a below and write g_a(t) for its inclusion into ℂ. F_m(t) denotes the existing explicit real sum of (n+1)^m exp(−(n+1)t) for n≥0. Real and complex derivatives of these kernels are taken over ℝ.

Proof or construction:

1. Restrict smoothed-kernel-complex-smooth to [0,∞). For every derivative order use smoothed-kernel-within-decay with the positive rate min(1,a).

2. Apply the already decomposed normalized-mellin-entire theorem to those actual inputs. No new continuation object is constructed.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-complex-smooth`, `DirichletPadicLFunctions:L0/smoothed-kernel-within-decay`, `DirichletPadicLFunctions:L0/normalized-mellin-entire`.

Acceptance: This declaration supplies entirety. Separate comparison nodes identify the continuation away from1, give log(a) at1, and compare its nonpositive-integer values with the rational formal-derivative constants.

Source: RJW-published, §4.1, the function f_a and Lemma4.2, printed136/PDF37; surrounding printed134–139/PDF35–40 read27 September2026. Theorem2.4 and Lemma2.6 supply the earlier continuation/decay context.


### Smoothed Mellin special values

Identifier: `DirichletPadicLFunctions:L0/smoothed-kernel-mellin-values`. Kind: theorem.

For a>0 and every n≥0, normalizedMellinContinuation(g_a,−n)=(−1)^n(1−a^(n+1))B_(n+1)/(n+1) in ℂ.

Hypotheses: β is the already constructed real smoothBernoulliKernel, with ordinary Bernoulli convention B_1=−1/2. Define h_a below and write g_a(t) for its inclusion into ℂ. F_m(t) denotes the existing explicit real sum of (n+1)^m exp(−(n+1)t) for n≥0. Real and complex derivatives of these kernels are taken over ℝ.

Proof or construction:

1. Supply the same smoothness and all-order positive-rate decay as for smoothed-kernel-mellin-entire to normalized-mellin-negative-values.

2. Substitute smoothed-kernel-within-values. The continuation contributes the factor (−1)^n, whereas the real kernel derivative itself has no such extra factor.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-complex-smooth`, `DirichletPadicLFunctions:L0/smoothed-kernel-within-decay`, `DirichletPadicLFunctions:L0/smoothed-kernel-within-values`, `DirichletPadicLFunctions:L0/normalized-mellin-negative-values`.

Tests:

- `SuggestedSmoothedKernelTests.two_mellin_minus_one` (computation): The normalized Mellin continuation of g_2 at−1 is+1/4.

Acceptance: For a=2,n=1 the real derivative is−1/4 while the normalized continued value is+1/4. Native zeta negative values remain baseline.

Source: RJW-published, §4.1, the function f_a and Lemma4.2, printed136/PDF37; surrounding printed134–139/PDF35–40 read27 September2026. Theorem2.4 and Lemma2.6 supply the earlier continuation/decay context.


### Convergence of the smoothed Mellin integral

Identifier: `DirichletPadicLFunctions:L0/smoothed-mellin-convergent`. Kind: lemma.

For a>0 and Re(s)>0, the actual complex kernel g_a is MellinConvergent at s.

Hypotheses: Let a>0 be real. The actual smoothed kernel is h_a=smoothedMellinKernel(a), its complex inclusion is g_a, and L_a=normalizedMellinContinuation(g_a). The actual Bernoulli kernel is β and its complex inclusion is g. Complex powers and the native Riemann zeta function use the pinned library conventions.

Proof or construction:

1. Complex smoothness gives continuity of g_a, hence local integrability on the measurable positive half-line and a right-hand O(1) bound at zero.

2. Take order zero in smoothed-kernel-within-decay. Its rate min(1,a) is positive. Apply native mellinConvergent_of_isBigO_rpow_exp with b=0.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-complex-smooth`, `DirichletPadicLFunctions:L0/smoothed-kernel-within-decay`, `mathlib:ContinuousOn.locallyIntegrableOn`, `mathlib:Filter.Tendsto.isBigO_one`, `mathlib:mellinConvergent_of_isBigO_rpow_exp`.

Acceptance: The smoothed kernel is integrable on the larger half-plane Re(s)>0, although its decomposition into two Bernoulli integrals below initially requires Re(s)>1.

Source: RJW-published, §4.1, Lemma4.2 and its proof, printed136/PDF37; full surrounding printed134–139/PDF35–40 read27 September2026. The prior Bernoulli comparison is Lemma2.7, printed112/PDF13.


### The smoothed Gamma–zeta integral

Identifier: `DirichletPadicLFunctions:L0/smoothed-mellin-gamma-zeta`. Kind: theorem.

For a>0 and Re(s)>1, mellin(g_a,s)=Γ(s)(1−a^(1−s))ζ(s).

Hypotheses: Let a>0 be real. The actual smoothed kernel is h_a=smoothedMellinKernel(a), its complex inclusion is g_a, and L_a=normalizedMellinContinuation(g_a). The actual Bernoulli kernel is β and its complex inclusion is g. Complex powers and the native Riemann zeta function use the pinned library conventions.

Proof or construction:

1. Include the global real product identity into ℂ: t g_a(t)=g(t)−g(at). Apply native mellin_cpow_smul at exponent s−1 with the multiplier t^1 to identify the Mellin transform of this difference with mellin(g_a,s).

2. The Bernoulli kernel is Mellin-convergent at s−1 because Re(s−1)>0. Native MellinConvergent.comp_mul_left gives convergence of g(at) at the same exponent for a>0. Therefore hasMellin_sub splits the difference integral legitimately.

3. Native mellin_comp_mul_left gives mellin(g(a·),s−1)=a^(1−s)mellin(g,s−1). Substitute bernoulli-mellin-gamma-zeta at s−1 and factor the result. This reuses the already established Gamma-weighted integral, without a new sum/integral interchange theorem.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-product`, `DirichletPadicLFunctions:L0/bernoulli-mellin-convergent`, `DirichletPadicLFunctions:L0/bernoulli-mellin-gamma-zeta`, `mathlib:mellin_cpow_smul`, `mathlib:MellinConvergent.comp_mul_left`, `mathlib:hasMellin_sub`, `mathlib:mellin_comp_mul_left`.

Acceptance: Retain a>0 for dilation and Re(s)>1 for both separate integrals. The exponent is 1−s and the Gamma argument is s.

Source: RJW-published, §4.1, Lemma4.2 and its proof, printed136/PDF37; full surrounding printed134–139/PDF35–40 read27 September2026. The prior Bernoulli comparison is Lemma2.7, printed112/PDF13.


### The normalized smoothed half-plane identity

Identifier: `DirichletPadicLFunctions:L0/smoothed-mellin-normalized-halfplane`. Kind: lemma.

For a>0 and Re(s)>1, L_a(s)=(1−a^(1−s))ζ(s).

Hypotheses: Let a>0 be real. The actual smoothed kernel is h_a=smoothedMellinKernel(a), its complex inclusion is g_a, and L_a=normalizedMellinContinuation(g_a). The actual Bernoulli kernel is β and its complex inclusion is g. Complex powers and the native Riemann zeta function use the pinned library conventions.

Proof or construction:

1. Supply the actual complex smoothness and all-order within-derivative decay to normalized-mellin-initial-halfplane. It gives L_a(s)=mellin(g_a,s)/Γ(s).

2. Substitute smoothed-mellin-gamma-zeta and cancel Γ(s), which is nonzero since Re(s)>0 by the native Gamma theorem.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-complex-smooth`, `DirichletPadicLFunctions:L0/smoothed-kernel-within-decay`, `DirichletPadicLFunctions:L0/normalized-mellin-initial-halfplane`, `DirichletPadicLFunctions:L0/smoothed-mellin-gamma-zeta`, `mathlib:Complex.Gamma_ne_zero_of_re_pos`.

Tests:

- `SuggestedSmoothedZetaTests.two_at_two` (computation): L_2(2)=ζ(2)/2; the factor is 1−2^(−1).

Acceptance: This is a convergent half-plane calculation for the existing continuation, not a definition of its values at the zeta pole.

Source: RJW-published, §4.1, Lemma4.2 and its proof, printed136/PDF37; full surrounding printed134–139/PDF35–40 read27 September2026. The prior Bernoulli comparison is Lemma2.7, printed112/PDF13.


### The smoothed zeta comparison

Identifier: `DirichletPadicLFunctions:L0/smoothed-mellin-zeta-comparison`. Kind: comparison.

For a>0 and every s∈ℂ with s≠1, L_a(s)=(1−a^(1−s))ζ(s).

Hypotheses: Let a>0 be real. The actual smoothed kernel is h_a=smoothedMellinKernel(a), its complex inclusion is g_a, and L_a=normalizedMellinContinuation(g_a). The actual Bernoulli kernel is β and its complex inclusion is g. Complex powers and the native Riemann zeta function use the pinned library conventions.

Proof or construction:

1. The left side is entire by smoothed-kernel-mellin-entire. On ℂ excluding1 the right side is analytic: the fixed positive base a is nonzero, so native complex exponent differentiation applies globally, while native ζ is differentiable away from1.

2. The complement of a point in ℂ is connected because its real dimension is two. On a neighborhood of2 contained in Re(s)>1, smoothed-mellin-normalized-halfplane supplies equality.

3. Apply native analytic uniqueness on this preconnected punctured plane. Keep s≠1 in the result; the native raw product at1 equals zero and does not encode the removable extension.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-mellin-entire`, `DirichletPadicLFunctions:L0/smoothed-mellin-normalized-halfplane`, `mathlib:HasDerivAt.const_cpow`, `mathlib:differentiableAt_riemannZeta`, `mathlib:DifferentiableOn.analyticOnNhd`, `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `mathlib:isConnected_compl_singleton_of_one_lt_rank`, `mathlib:Complex.rank_real_complex`.

Acceptance: Use the connected punctured domain and a genuine open half-plane neighborhood of2. No identity theorem across a pole of the raw ζ function is invoked.

Source: RJW-published, §4.1, Lemma4.2 and its proof, printed136/PDF37; full surrounding printed134–139/PDF35–40 read27 September2026. The prior Bernoulli comparison is Lemma2.7, printed112/PDF13.


### The smoothed zeta logarithmic limit

Identifier: `DirichletPadicLFunctions:L0/smoothed-zeta-pole-limit`. Kind: lemma.

For a>0, the limit of (1−a^(1−s))ζ(s) as s tends to1 through s≠1 is log(a), included from ℝ into ℂ.

Hypotheses: Let a>0 be real. The actual smoothed kernel is h_a=smoothedMellinKernel(a), its complex inclusion is g_a, and L_a=normalizedMellinContinuation(g_a). The actual Bernoulli kernel is β and its complex inclusion is g. Complex powers and the native Riemann zeta function use the pinned library conventions.

Proof or construction:

1. Set q(s)=1−a^(1−s). It vanishes at1, and native HasDerivAt.const_cpow and the scalar chain rule give q′(1)=Complex.log(a). Native Complex.ofReal_log identifies this with the included real logarithm since a>0.

2. The native derivative/difference-quotient equivalence gives q(s)/(s−1)→log(a) in the punctured neighborhood filter.

3. Multiply by the native residue limit (s−1)ζ(s)→1. In that filter s−1 is eventually nonzero, so cancel it and obtain the asserted product limit.

Prerequisites: `mathlib:HasDerivAt.const_cpow`, `mathlib:Complex.ofReal_log`, `mathlib:hasDerivAt_iff_tendsto_slope`, `mathlib:riemannZeta_residue_one`.

Acceptance: The limit is taken in the punctured neighborhood of1. The derivative has positive log(a), not its negative. This is a specialized cancellation using the existing native residue theorem.

Source: RJW-published, §4.1, Lemma4.2 and its proof, printed136/PDF37; full surrounding printed134–139/PDF35–40 read27 September2026. The prior Bernoulli comparison is Lemma2.7, printed112/PDF13.


### The smoothed Mellin value at one

Identifier: `DirichletPadicLFunctions:L0/smoothed-mellin-value-one`. Kind: theorem.

For a>0, L_a(1)=log(a), included from ℝ into ℂ.

Hypotheses: Let a>0 be real. The actual smoothed kernel is h_a=smoothedMellinKernel(a), its complex inclusion is g_a, and L_a=normalizedMellinContinuation(g_a). The actual Bernoulli kernel is β and its complex inclusion is g. Complex powers and the native Riemann zeta function use the pinned library conventions.

Proof or construction:

1. Entirety of L_a gives continuity at1 and hence its own value as the limit along the punctured neighborhood filter.

2. The comparison for s≠1 identifies that limit with smoothed-zeta-pole-limit. Native uniqueness of limits on the nontrivial punctured complex neighborhood gives L_a(1)=log(a).

3. For the integral-at-one acceptance test, apply the existing initial-half-plane equality at1 and native Γ(1)=1. This also gives mellin(g_a,1)=log(a), although the two separate Bernoulli integrals used for Re(s)>1 cannot be split at this endpoint.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-mellin-entire`, `DirichletPadicLFunctions:L0/smoothed-mellin-zeta-comparison`, `DirichletPadicLFunctions:L0/smoothed-zeta-pole-limit`, `mathlib:tendsto_nhds_unique`, `DirichletPadicLFunctions:L0/smoothed-kernel-complex-smooth`, `DirichletPadicLFunctions:L0/smoothed-kernel-within-decay`, `DirichletPadicLFunctions:L0/normalized-mellin-initial-halfplane`, `DirichletPadicLFunctions:L0/smoothed-mellin-convergent`, `mathlib:Complex.Gamma_one`.

Tests:

- `SuggestedSmoothedZetaTests.two_at_one` (computation): L_2(1)=log(2), included into ℂ.

- `SuggestedSmoothedZetaTests.one_at_one` (degenerate): L_1(1)=0.

- `SuggestedSmoothedZetaTests.integral_at_one` (comparison): For a>0, mellin(g_a,1)=log(a), included into ℂ.

- `SuggestedSmoothedZetaTests.raw_pole_mismatch` (non-example): L_2(1) differs from the raw totalized product (1−2^(1−1))ζ(1), since that product is0 and log(2)≠0.

Acceptance: For a=1 the value is0. For a=2 it is nonzero log(2); the raw totalized product at1 remains0. No new source finding is inferred from notation for a removable singularity.

Source: RJW-published, §4.1, Lemma4.2 and its proof, printed136/PDF37; full surrounding printed134–139/PDF35–40 read27 September2026. The prior Bernoulli comparison is Lemma2.7, printed112/PDF13.


### Analytic and formal smoothing derivatives

Identifier: `DirichletPadicLFunctions:L0/smoothed-kernel-formal-derivatives`. Kind: comparison.

For natural a with unit image in ℚ and every k≥0, h_a^(k)(0)=algebraMap ℚ ℝ c_(a,k).

Hypotheses: F_a is the existing smoothedSeries, with its specified unit certificate. The operator ∂ is the imported PowerSeries.mahlerDerivation=(1+T)d/dT, not ordinary formal differentiation. Write c_(a,k)=constantCoeff(∂^[k]F_a) over ℚ; this is notation for an expression, not a new scalar or series carrier. The actual real kernel is h_a=smoothedMellinKernel(a), g_a is its complex inclusion, and L_a is the existing normalizedMellinContinuation(g_a). a,k are natural numbers and the rational image of a is a unit. No analytic convergence of a p-adic exponential series is assumed.

Proof or construction:

1. Specialize smoothed-series-euler-values to R=ℚ. The result identifies c_(a,k) with the rational smoothed Bernoulli expression.

2. Apply the actual real derivative theorem smoothed-kernel-origin-derivatives at the real image of a. Native ring-map laws transport the rational expression, including its nonzero integer denominator, to exactly that real derivative.

3. This is the source equation(4-1) with the right-hand value interpreted as the constant coefficient of the formal iterate. All real derivatives are derivatives of the actual smooth kernel, not formal derivatives relabelled as analytic ones.

4. For the derivative-operator control at a=2, the existing coefficient recurrence gives coefficient2(F_2)=1/8. Native ordinary-formal-derivative normalization yields constantCoeff(D²F_2)=1/4, while ∂² gives0 and the actual real second derivative is0.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-origin-derivatives`, `DirichletPadicLFunctions:L1/smoothed-series-euler-values`, `DirichletPadicLFunctions:L1/series-coefficient-recurrence`, `mathlib:PowerSeries.constantCoeff_iterate_derivative`.

Tests:

- `SuggestedSmoothedJetTests.ordinary_derivative_control` (non-example): At a=2 the actual second real derivative is0, but constantCoeff(D²F_2)=1/4. Replacing ∂ by D in the comparison is false.

Acceptance: This compares every finite origin derivative. It makes no assertion of evaluating the formal series globally or identifying an arbitrary formal series with an analytic function. Native analyticity of the actual h_a is already supplied.

Source: RJW-published, Lemma4.3 and equation(4-1), printed136/PDF37, together with Proposition4.6, printed137/PDF38; full surrounding134–139 read27 September2026.


### Mellin and formal smoothing values

Identifier: `DirichletPadicLFunctions:L0/smoothed-mellin-formal-values`. Kind: comparison.

For natural a>0 with rational unit certificate and every k≥0, L_a(−k)=(−1)^k algebraMap ℚ ℂ c_(a,k).

Hypotheses: F_a is the existing smoothedSeries, with its specified unit certificate. The operator ∂ is the imported PowerSeries.mahlerDerivation=(1+T)d/dT, not ordinary formal differentiation. Write c_(a,k)=constantCoeff(∂^[k]F_a) over ℚ; this is notation for an expression, not a new scalar or series carrier. The actual real kernel is h_a=smoothedMellinKernel(a), g_a is its complex inclusion, and L_a is the existing normalizedMellinContinuation(g_a). a,k are natural numbers, a>0, and the rational image of a is a unit. The parameter inequality supplies the actual kernel decay and continuation hypotheses.

Proof or construction:

1. Apply smoothed-kernel-mellin-values to the positive real image of a. This gives (−1)^k times the complex smoothed Bernoulli value.

2. Use smoothed-series-euler-values over ℚ and native rational-to-complex ring-map laws. The resulting expression is (−1)^k times the complex image of c_(a,k).

3. The complex continuation and the real derivative use opposite signs at odd k: the former includes the factor (−1)^k. Both are compared independently through the same rational number.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-mellin-values`, `DirichletPadicLFunctions:L1/smoothed-series-euler-values`.

Tests:

- `SuggestedSmoothedJetTests.mellin_odd_sign` (computation): L_2(−3)=−1/8, whereas c_(2,3)=+1/8.

Acceptance: The value at k=0 is included. For a=2,k=3 the real derivative/formal constant is+1/8 and the normalized Mellin value is−1/8.

Source: RJW-published, Lemma4.3 and equation(4-1), printed136/PDF37, together with Proposition4.6, printed137/PDF38; full surrounding134–139 read27 September2026.


### The value of the smoothing kernel at the origin

Identifier: `DirichletPadicLFunctions:L0/smoothed-kernel-zero`. Kind: lemma.

For every real a, h_a(0)=(a−1)/2.

Hypotheses: β is the existing smoothBernoulliKernel and h_a is the existing smoothedMellinKernel, defined by native dslope at zero of t↦β(t)−β(at). The derivative is the ordinary real derivative.

Proof or construction:

1. Specialize the existing origin-derivative formula to n=0. Native B₁=−1/2 and the zeroth derivative is the function itself.

2. This promotes the inherited construction API item to a named prerequisite; it does not change its statement.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-origin-derivatives`.

Acceptance: At a=0 the value is−1/2, at a=1 it is0, and at a=6 it is5/2.

Source: RJW-published, §4.1, definition of f_a and Lemma4.2, printed136/PDF37; §2.3, Theorem2.4, printed110–111/PDF11–12. Page37 freshly read as text and image on3 October2026.


### Composition of smoothing kernels

Identifier: `DirichletPadicLFunctions:L0/smoothed-kernel-cocycle`. Kind: lemma.

For every a,b,t∈ℝ, h_(ab)(t)=h_a(t)+a h_b(at).

Hypotheses: β is the existing smoothBernoulliKernel and h_a is the existing smoothedMellinKernel, defined by native dslope at zero of t↦β(t)−β(at). The derivative is the ordinary real derivative. No positivity or nonzero hypothesis is imposed on a,b or t.

Proof or construction:

1. For t≠0, multiply the desired equality by t. The existing product identity gives β(t)−β(abt) on the left. On the right the middle terms β(at) cancel. This argument uses neither division by a nor a≠0.

2. For t=0, use the promoted origin value three times: (ab−1)/2=(a−1)/2+a(b−1)/2.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-product`, `DirichletPadicLFunctions:L0/smoothed-kernel-zero`.

Tests:

- `SuggestedSmoothingCocycleTests.origin` (computation): h_6(0)=h_2(0)+2h_3(0)=5/2.

- `SuggestedSmoothingCocycleTests.negative_parameter` (compatibility): For every real t, h_(−6)(t)=h_(−2)(t)−2h_3(−2t).

- `SuggestedSmoothingCocycleTests.zero_parameter` (degenerate): For every real a,t, h_0(t)=h_a(t)+a h_0(at).

- `SuggestedSmoothingCocycleTests.missing_weight` (non-example): h_6(0)≠h_2(0)+h_3(0); omitting the scalar a gives a false identity.

Acceptance: The scalar a and the argument at are both required. Zero and negative parameters are legitimate here even though the Mellin theorem has a smaller domain.

Source: RJW-published, §4.1, definition of f_a and Lemma4.2, printed136/PDF37; §2.3, Theorem2.4, printed110–111/PDF11–12. Page37 freshly read as text and image on3 October2026.


### Independence of the order of two smoothing parameters

Identifier: `DirichletPadicLFunctions:L0/smoothed-kernel-commute`. Kind: lemma.

For every real a,b,t, h_a(t)+a h_b(at)=h_b(t)+b h_a(bt).

Hypotheses: β is the existing smoothBernoulliKernel and h_a is the existing smoothedMellinKernel, defined by native dslope at zero of t↦β(t)−β(at). The derivative is the ordinary real derivative.

Proof or construction:

1. Apply the preceding cocycle in both orders. The two results are h_(ab)(t) and h_(ba)(t), which agree by commutativity.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-cocycle`.

Acceptance: The comparison changes the dilation and scalar together; h_b(at)=h_a(bt) is not asserted.

Source: RJW-published, §4.1, definition of f_a and Lemma4.2, printed136/PDF37; §2.3, Theorem2.4, printed110–111/PDF11–12. Page37 freshly read as text and image on3 October2026.


### Composition of the origin derivatives

Identifier: `DirichletPadicLFunctions:L0/smoothed-origin-derivative-cocycle`. Kind: lemma.

For a,b∈ℝ and n∈ℕ, h_(ab)^(n)(0)=h_a^(n)(0)+a^(n+1)h_b^(n)(0).

Hypotheses: β is the existing smoothBernoulliKernel and h_a is the existing smoothedMellinKernel, defined by native dslope at zero of t↦β(t)−β(at). The derivative is the ordinary real derivative.

Proof or construction:

1. Apply the existing origin derivative formula to ab,a,b. All three have the common factor B_(n+1)/(n+1).

2. The coefficient identity 1−(ab)^(n+1)=(1−a^(n+1))+a^(n+1)(1−b^(n+1)) proves the result. This also verifies the extra power contributed by the outer scalar in the kernel cocycle.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-origin-derivatives`.

Tests:

- `SuggestedSmoothingCocycleTests.third_derivative` (computation): h_6^(3)(0)=259/24=h_2^(3)(0)+16h_3^(3)(0).

Acceptance: For n=0 recover the origin cocycle; for n=3 and a=2 the weight is16, not8 or2.

Source: RJW-published, §4.1, definition of f_a and Lemma4.2, printed136/PDF37; §2.3, Theorem2.4, printed110–111/PDF11–12. Page37 freshly read as text and image on3 October2026.


### Composition of the convergent Mellin integrals

Identifier: `DirichletPadicLFunctions:L0/smoothed-mellin-cocycle`. Kind: lemma.

For a,b>0 and s∈ℂ with Re(s)>0, M(g_(ab),s)=M(g_a,s)+a^(1−s)M(g_b,s), where g_a(t) is the complex inclusion of h_a(t) and M is native unnormalized mellin.

Hypotheses: β is the existing smoothBernoulliKernel and h_a is the existing smoothedMellinKernel, defined by native dslope at zero of t↦β(t)−β(at). The derivative is the ordinary real derivative. Complex powers of positive real numbers use Mathlib’s principal convention. Both kernels have a convergent Mellin integral on Re(s)>0.

Proof or construction:

1. Use the existing convergence node for g_a and g_b. Native MellinConvergent.comp_mul_left transports convergence under t↦at; its const_smul lemma supplies convergence after the factor a.

2. Include the real cocycle into ℂ. Apply native hasMellin_add and mellin_const_smul, then mellin_comp_mul_left to obtain the factor a·a^(−s).

3. Since a>0, its complex image is nonzero. Complex.cpow_add at exponents1 and−s and Complex.cpow_one turn that product into a^(1−s).

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-kernel-cocycle`, `DirichletPadicLFunctions:L0/smoothed-mellin-convergent`, `mathlib:MellinConvergent.comp_mul_left`, `mathlib:MellinConvergent.const_smul`, `mathlib:hasMellin_add`, `mathlib:mellin_const_smul`, `mathlib:mellin_comp_mul_left`, `mathlib:Complex.cpow_add`, `mathlib:Complex.cpow_one`.

Acceptance: This theorem includes s=1, where the integrals converge. No addition rule for arbitrary divergent totalized integrals is used.

Source: RJW-published, §4.1, definition of f_a and Lemma4.2, printed136/PDF37; §2.3, Theorem2.4, printed110–111/PDF11–12. Page37 freshly read as text and image on3 October2026.


### Composition of the entire normalized Mellin continuations

Identifier: `DirichletPadicLFunctions:L0/smoothed-normalized-cocycle`. Kind: lemma.

For a,b>0 and every s∈ℂ, L_(ab)(s)=L_a(s)+a^(1−s)L_b(s), where L_a is the already constructed normalizedMellinContinuation of g_a.

Hypotheses: β is the existing smoothBernoulliKernel and h_a is the existing smoothedMellinKernel, defined by native dslope at zero of t↦β(t)−β(at). The derivative is the ordinary real derivative. At s=1, L_a(1) is log(a), not the raw totalized zeta product. The statement includes all negative integers and all positive real parameters, not only natural arithmetic parameters.

Proof or construction:

1. For s≠1 apply the existing punctured zeta comparison three times. Native Complex.mul_cpow_ofReal_nonneg gives (ab)^(1−s)=a^(1−s)b^(1−s), and ring algebra proves the result.

2. For s=1 use the existing continued-value theorem. The multiplier a^0 is1, and Real.log_mul gives log(ab)=log(a)+log(b) because a,b are nonzero. Keep this case separate: substitution in the raw zeta product would replace each continued value by zero.

Prerequisites: `DirichletPadicLFunctions:L0/smoothed-mellin-zeta-comparison`, `DirichletPadicLFunctions:L0/smoothed-mellin-value-one`, `mathlib:Complex.mul_cpow_ofReal_nonneg`, `mathlib:Real.log_mul`.

Tests:

- `SuggestedSmoothingCocycleTests.pole_value` (compatibility): L_6(1)=log(2)+log(3).

- `SuggestedSmoothingCocycleTests.negative_value` (computation): L_6(−3)=−259/24.

- `SuggestedSmoothingCocycleTests.origin_not_punctured` (non-example): L_6(1) differs from the raw totalized product (1−6^(1−1))ζ(1)=0.

Acceptance: At s=−n the weight is a^(n+1), agreeing with the signed origin-derivative cocycle. At s=1 the result is the actual logarithmic identity.

Source: RJW-published, §4.1, definition of f_a and Lemma4.2, printed136/PDF37; §2.3, Theorem2.4, printed110–111/PDF11–12. Page37 freshly read as text and image on3 October2026.


## Sources and baseline

The primary source is [Rodrigues Jacinto–Williams, An introduction to p-adic L-functions, published version](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), especially Theorem2.4, Lemmas2.6–2.7 and4.2–4.3. The [arXiv v2](https://arxiv.org/pdf/2309.15692v2) has different page locators. The packet retains the hashes, source-version comparisons and the E3/E5 findings. [Stein’s Eisenstein chapter](https://wstein.org/books/modform/modform/eisenstein.html) gives the generalized Bernoulli normalization used by the classical owner.

The complete pinned baseline ledger is in the packet. The composition extension uses native Mellin convergence, addition and dilation, Complex.cpow_add, Complex.mul_cpow_ofReal_nonneg and Real.log_mul. It does not claim those general library results as new declarations.
