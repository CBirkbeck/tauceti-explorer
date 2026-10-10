# Independent review: Arithmetic Dirichlet series and Tauberian methods, Part II

Accepted, 10 October 2026. Reviewer: Codex, session `codex-XfY0zf`, independent of the design session `codex-W83w7l` that submitted #8622. This review covers the roadmap definition, packet and suggested Lean file for #3495. All implementation statuses remain `unchecked`: elaboration checks the proposed statements, and their proofs remain work for contributors.

The final packet has 16 nodes: four definitions and twelve theorem targets, with 26 API items, 16 definition tests and 11 planets. Each definition has at least three discriminating tests. All six stages are closed at target level. All 31 original baseline citations are confirmed; two supporting declarations were added, giving 33. No citations were removed or replaced, no nodes were added, and there are no gaps, supplier requests or source-error findings. Thirteen nodes are recorded as corrected and three as verified.

## Corrections made

1. **Follow the existing Mathlib design direction.** The required open-PR search found [Mathlib #40582](https://github.com/leanprover-community/mathlib4/pull/40582), head `90482cd37e85e423459de2ed103cea2f4d98cb20`, for the one-sided Laplace transform. Its interface uses a normed target, a complex scalar action and an optional measure defaulting to Lebesgue measure on `(0,∞)`. The proposed `HasLaplace` now follows that shape, with the API spellings `congr_ae`, `const_smul` and `comp_mul_left`. Its planned owner is `TauCeti/Analysis/LaplaceTransform`, namespace `TauCeti`; the Tauberian-specific material stays in `TauCeti.HigherPoleTauberian`. Real counting functions are explicitly cast to ℂ. The omitted singleton has zero Lebesgue measure, so the analytic theorem is unchanged. The open PR is a design input, not a pinned-library citation or a waiting dependency. Public Zulip searches found no additional relevant design to adopt.
2. **Complete usable APIs.** Added `HasLaplace.integrable`, `HasLaplace.integral_eq` and `delangeWeight_continuous`. The former expose the convergence and value needed for differentiation and Fubini. The latter supplies compact bounds used when unsmoothing. The weight sketch now derives uniform shift ratios over every fixed bounded interval from its normalization, rather than using pointwise shift convergence as if it were uniform.
3. **Make analytic prerequisites explicit.** Added `Real.GammaIntegral_convergent` for norm integrability; the already cited Gamma integral evaluates an integral and is not by itself a convergence theorem. Added `hasDerivAt_integral_of_dominated_loc_of_deriv_le` for complex differentiation. Its proof sketch chooses an abscissa strictly to the left and bounds the extra factor by `t exp(−δt)`. The boundary sketch splits the regularizer inside/outside the pole ball and bounds its worst pole contribution by an integrable logarithm. The smoothing sketch records the conversion from angular frequency to Mathlib's Fourier convention. The unsmoothing sketch specifies its shifted convolution centres and takes limits in the order T, λ, h.
4. **Complete the Lean conclusions.** The logarithmic bridge now states nonnegativity, monotonicity and the inclusive initial value `α(0)=c₁` as well as its convergent transform. The dyadic rejection theorem now includes the two promised subsequential limits: `S(2^j)/2^j→2` and `S(3·2^j)/(3·2^j)→4/3`.
5. **Correct locators and metadata.** Delange's kernel discussion is §3.3.3–3.3.5, printed pp.224–226; unsmoothing is §3.4.1–3.4.2, pp.227–228; the boundary argument spans §3.3.1–3.3.2, pp.221–224; smoothing spans §3.3.1–3.3.5, pp.221–226. Lemma 4 is on p.233. The source's opening Theorems I–II occupy pp.213–215. Mixed Delange/Wood locators were split into separate source references. All 16 test kinds now use the protocol's vocabulary. The dyadic rejection test remains a target and example, but its planet was removed under the rule excluding checks and caveats.

The roadmap definition and packet agree on the revised carrier, endpoint convention and counterexample indexing. None of these changes adds a minor-lemma node or expands the Tauberian theorem to noninteger singularities.

## Node-by-node mathematical check

Locators below use the printed pages of [Delange's paper](https://www.numdam.org/item/ASENS_1954_3_71_3_213_0.pdf) and [Wood's public author version](https://par.nsf.gov/servlets/purl/10152050). The downloaded files match both recorded SHA-256 hashes. The conclusions and arguments here are independently stated in our own words.

| Node suffix | Verdict | Mathematical check and source |
| --- | --- | --- |
| HP.0/laplace | Corrected | Convergence is part of the assertion; a totalized divergent integral cannot establish it. The predicate generalizes the ordinary integral of Delange, p.213 and §3.3.1, pp.221–222, following the Mathlib PR carrier. |
| HP.0/boundary | Corrected | The local numerator and every nonreal boundary germ are separate conditions; agreement is only inside the half-plane. Nonzero A gives exact order. Theorem III, §5.2.1, pp.235–238; the carrier's API follows analytic-germ uniqueness. |
| HP.1/kernel | Corrected | The mass is one, the support in angular frequency is [−2λ,2λ], and the spatial tails concentrate. §3.3.3–3.3.5, pp.224–226; §3.4, pp.227–228. |
| HP.1/weight | Corrected | Substitution gives `w_k(t)t^k=(1/k!)∫_0^t e^(−x)x^k dx` for t>0. Gamma convergence proves the bound and limit; compact parameter domination gives continuity. §3.1–3.2, pp.220–221; Lemma 3, pp.231–232; §5.2.1, p.237. |
| HP.2/gamma-model | Corrected | The complex transform is `k!/(s−a)^(k+1)` for Re(s)>a. Norm convergence uses a positive real decay rate; repeated integration by parts evaluates it. Lemma 4, p.233; §5.2.1, pp.236–237. |
| HP.2/boundary-l1 | Corrected | Subtracting the leading pole leaves order at most k. Differentiation adds one order, and the u^k weight reduces the worst boundary bound to a locally integrable logarithm. Apply Laurent extraction to the germ, not to assigned F(a). §3.3.1–3.3.2, pp.221–224; §4.1, pp.228–229; §5.2.1, pp.237–238. |
| HP.2/smoothed-limit | Corrected | The transform differentiation, regularizing Fubini identity and damped Fourier identity have absolute majorants. Boundary L1 convergence and Fatou justify the undamped identity before Fourier decay is used. The normalized model gives A/k!. §3.3.1–3.3.5, pp.221–226; §4.1, pp.228–229. |
| HP.3/unsmoothing | Corrected | A fixed interval first bounds the weighted count; the resulting global bound controls the tails. Monotonicity applies to α, not to the weighted count. Both comparisons converge to C, including C=0. §3.4.1–3.4.2, pp.227–228. |
| HP.3/laplace-theorem | Corrected | The preceding two targets imply the positive integer specialization of Theorem III with exponent m=k+1 and constant A/k!. §5.2.1, pp.235–238. The signature change only makes the complex cast explicit. |
| HP.4/logarithmic-bridge | Corrected | Absolute Dirichlet convergence supplies the sum of norm integrals. Each indicator tail integrates to `c_n n^(−s)/s`, retaining c₁ and suppressing n=0. Delange p.213 and Theorem III, pp.235–238; consumer motivation in Wood §7, pp.416–417. |
| HP.4/dirichlet-theorem | Corrected | The transform is F/s, whose numerator at a=1 is A. Substitution t=log X gives the inclusive limit A/k!. Delange Theorem III, pp.235–238; Wood §7, p.417. |
| HP.4/positive-abscissa | Verified | At a>0, division by s gives A/a, yielding `A/(a k!)`. Variable rescaling independently confirms this factor; the n-coefficient example detects a missing 1/a. Delange Theorem III, pp.235–238. |
| HP.4/finite-change | Corrected | The reused Northcott API gives an eventual fixed difference; the positive-abscissa denominator diverges. No positivity or transform is needed for the altered sequences. Delange p.213, footnote 1; Wood §7, p.417. |
| HP.4/lower-pole | Verified | The majorant has its own complete analytic hypotheses. The summatory triangle bound and l<k make its normalized count vanish. Wood §7, p.417; arithmetic construction of that majorant belongs to ArithmeticStatistics. |
| HP.5/zeta-square | Verified | Arithmetic convolution identifies the divisor coefficients, and the ζ residue becomes an analytic numerator by removable singularity. Squaring gives A=1,k=1, hence the divisor count limit one. Delange Theorem III, pp.235–238; pinned arithmetic and ζ APIs. |
| HP.5/counterexample | Corrected | The geometric series has a local simple pole at 1 and an additional pole at `1+2πi/log 2`. Finite geometric sums give the two distinct limits. This independently calculated witness tests the distinction discussed in §5.3, p.242; it is not attributed as Delange's example. |

## Exact pinned-library audit

The sources were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Tau Ceti's three relevant source modules were also compared byte-for-byte against those pinned git objects. Module names and line numbers are recorded in the packet. Every entry below is confirmed under its full namespace, with the required ambient hypotheses.

| Declaration | Statement fit checked |
| --- | --- |
| `AnalyticAt` | Native convergent power-series germ over the chosen normed field. |
| `AnalyticOnNhd` | Analytic germs at every point of a set; the set need not be open. |
| `LSeriesHasSum` | Unconditional complex series convergence with a specified sum; hence norm summability. |
| `LSeries.term` | Zero term is suppressed; positive n uses the complex power denominator. |
| `LSeriesHasSum.convolution` | Two convergent series give the convolution sum equal to the product. This is the lemma at line 140, not the similarly named convolution definition. |
| `Real.sinc` | The value at zero is one. |
| `Real.continuous_sinc` | Global real continuity. |
| `Real.abs_sinc_le_one` | Uniform real absolute bound. |
| `Real.Gamma_nat_eq_factorial` | The real Gamma value at k+1 is k!; this is the Real theorem at line 422. |
| `Real.integral_rpow_mul_exp_neg_mul_Ioi` | Positive real exponent and rate; supplies a real integral value, not a complex-rate formula. |
| `MeasureTheory.lintegral_liminf_le'` | Nonnegative measurable Fatou limit for a countably generated filter. |
| `Complex.analyticAt_of_differentiable_on_punctured_nhds_of_continuousAt` | Punctured differentiability plus centre continuity produces the required analytic numerator. |
| `MeasureTheory.integral_tsum` | Requires a.e. strong measurability and a finite sum of norm integrals. |
| `MeasureTheory.integral_integral_swap` | Requires product integrability of the uncurried integrand. |
| `MeasureTheory.tendsto_integral_filter_of_dominated_convergence` | Requires a uniform integrable norm majorant, measurability and a.e. pointwise convergence. |
| `Real.tendsto_integral_exp_smul_cocompact` | Fourier decay at infinity; converting angular frequency requires division of the parameter by 2π. |
| `integrableOn_exp_mul_complex_Ioi` | Negative real part gives convergence on an upper half-line. |
| `Complex.summable_one_div_nat_cpow` | Summability is equivalent to Re(s)>1. |
| `hasSum_geometric_of_norm_lt_one` | Complete normed division ring and ratio norm below one. |
| `integral_exp_mul_complex_Ioi` | Negative real part gives the tail value `−exp(zc)/z`. |
| `analyticOn_riemannZeta` | Analytic continuation is analytic away from 1. |
| `riemannZeta_residue_one` | Complex punctured residue limit; removal of the singularity is still a proof step. |
| `zeta_eq_tsum_one_div_nat_cpow` | Identifies ζ with its convergent sum only for Re(s)>1. |
| `ArithmeticFunction.sigma_zero_apply` | σ₀(n) equals the divisor cardinality, including the zero convention. |
| `ArithmeticFunction.zeta_mul_pow_eq_sigma` | At k=0, arithmetic convolution gives the divisor coefficient. |
| `TauCeti.summatory` | Inclusive real cutoff for a natural-valued Northcott function. |
| `TauCeti.summatory_mono` | Nonnegative weights give monotonicity in the cutoff. |
| `TauCeti.summatory_nonneg` | Nonnegative weights give a nonnegative sum. |
| `TauCeti.eventually_summatory_sub_eq` | Agreement outside a finite set gives an eventual fixed finite difference. |
| `TauCeti.Contour.exists_laurent_data_of_meromorphicAt` | A meromorphic germ has a finite principal part and analytic remainder; equality is punctured. |
| `TauCeti.Contour.tendsto_integral_sin_mul_div_atTop` | Positive frequency, truncated sine-integral limit π/2; not an unsquared Lebesgue sinc integral. |
| `Real.GammaIntegral_convergent` (added) | Positive real parameter supplies Euler-integrand convergence; use positive scaling for the model. |
| `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (added) | RCLike parameter includes ℂ; supplies derivative and derivative-integrand convergence under a local uniform bound. |

## Closure, ownership and remaining work

The HP.0–HP.5 order is sound. The kernel and weight feed the Gamma model, regularized boundary and smoothed limit; unsmoothing then gives the Laplace theorem. The inclusive logarithmic adapter gives both counting exports. Perturbation and application targets use those exports and existing summatory/ζ APIs. There is no dependency back from ArithmeticStatistics ST.3, and no hidden arithmetic positivity or continuation assumption. The main result requires a>0, A>0 and a full boundary condition; it asserts no zero-abscissa or noninteger singularity theorem.

The reviewed library audit entries for AnalyticNumberTheory AN.0 and ArithmeticDirichletSeries Layers 4 and 9 were checked. The current read-only TauCetiRoadmap main, commit `81207c7f16d5abf770f13a7d2bdcdb465c030787`, and current Tau Ceti, commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, were separately searched, including the roadmaps newer than the atlas and the Completed directory. The nearby ArithmeticDirichletSeries README and Suggested file and Chebotarev README were read. The parent owns simple-pole Wiener–Ikehara, generic cutoffs and finite-change calculus; their higher-pole specializations here reuse those interfaces. Existing completely-monotone Laplace representations concern positive measures and real parameters, not this convergent complex-parameter counting transform. ContourIntegration already supplies Laurent extraction and the sine-integral input. No existing higher-pole Tauberian export or competing continuous squared-sinc construction was found.

There are no questions requiring a mathematical decision by the orchestrator. Packaging should use the reviewed packet and signatures to produce the README and reader, including the revised Laplace carrier and API names. The existing standalone reader was outside this review's listed deliverables and was not edited. All source results are stated in our own words; the locator corrections are blueprint mistakes, not mistakes in the papers, so `sourceIssues` stays empty.

Validation: the packet checker with the pinned declaration index reports **0 errors, 0 warnings**. The suggested file elaborates with `lean-check` at the pinned baseline with **61 warnings, all admissions using `sorry`**, and no errors or other warnings. All four definitions, 26 API names, twelve theorem names and 16 named definition-test markers agree between packet and Lean. The file also retains seven theorem acceptance examples, giving 23 examples in total. The final suggested-file hash is recorded in the handoff.
