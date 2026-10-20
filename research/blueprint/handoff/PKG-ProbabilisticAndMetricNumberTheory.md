# Package handoff: probabilistic, metric and ergodic number theory

Job `PKG-ProbabilisticAndMetricNumberTheory`, issue #10777. Worker: Codex (GPT-6), session `codex-O6ujTl`, 20 October 2026. Claim confirmed by the claim bot at issue comment 6295841161. Branch: `codex-O6ujTl-pkg-probabilistic-metric`.

## Completed deliverable

The package contains a detailed README, a compact elaborating Suggested.lean and `topic = "math.NT"` metadata. It is ready for the independent package review. No packet, source-observation record, planet assignment, link map or upstream file was changed. Nothing is claimed formalised: theorem signatures have admitted proofs, while retained data definitions and examples have real bodies.

The README opens with a Summary, fixes conventions and ownership, states exact supplier contracts, and presents six layers in 52 mathematical topic groups. Each target retains its statement, hypotheses, source locator and prerequisites; definitions retain their API and distinguishing Checks. Layer examples make the relevant numerical values and counterexamples explicit. The document contains no packet identifiers or programme history and no verbatim source passages or source-by-source synopsis.

The inventory accounts for all 415 accepted targets: 300 from the parent packet and 115 from its PM.4 continuation. It retains all 177 API items and all 164 test entries; the latter include the 130 definition/construction Checks reported by the packet validators. All 39 definition/construction entries have at least three tests. Six already-native Haar/Fourier targets are consumed in the opening boundary rather than proposed as new work; the other 409 targets appear in the layers. The boundary carries seven API items and four Checks, leaving 170 API items and 160 tests in the layer inventory.

The six boundary targets are `PM.2/torus-haar-probability` and its `torus-haar-probability-review-api-2` through `-6`, all under `ProbabilisticAndMetricNumberTheory`. They use existing circle Haar probability, native product measure, translation invariance, native Fourier orthogonality and the zero/one-dimensional normalizations. `circleHaar` and `torusHaar` in Lean are light bundles of these existing measures, not new measure constructions.

## Suggested Lean

The file has 821 lines, 31 light definitions, 55 theorem signatures, one admitted Prop-valued probability instance, and 34 proved examples. Imports are Mathlib and the used Tau Ceti empirical-measure module. The namespace is `TauCetiRoadmap.ProbabilisticAndMetricNumberTheory`. There are no sorry-bodied data definitions, data instances, fabricated carriers or chains of auxiliary lemmas. All named declarations occur in the README. The closing comment names the larger README-only interfaces: integer equidistribution, subtori, GCD graphs and restrictions, Cantor objects and their measure, the pointwise-proof selectors/coloring/limit, and the Gauss filtration.

The examples exercise every retained light definition, with shared examples for the plain/total constant-sequence predicates. They include the guarded weighted sum, zero-radius concentration, constant empirical Dirac limits, dimension-zero torus, failure of irrationality at the zero one-torus point, empty discrepancy, exclusion of base one, closed denominator-one approximation, unrestricted zero numerators, an admissible length gauge, Gauss support and rational termination, atomic mixing/exactness, cylinder irrationality, word order and matrices, transfer of zero, inclusive short means, the empty logarithmic window, and the different prime-square behavior of sign and phase models. Expensive positive examples remain precise README Checks rather than additional formal development.

`lean-check research/blueprint/packages/ProbabilisticAndMetricNumberTheory/Suggested.lean` finished with exit code 0: 56 `declaration uses sorry` warnings, no errors and no other warnings. The last run includes the final documentation edits. Available memory was 79 GB before it started. Only one worker compilation ran at a time; no language server, Lake build, dependency update or cache fetch was started.

A separate temporary native-API audit imported the required existing modules and resolved 224 `#check` declarations at the implementation pins, exit code 0 with no errors or warnings. Their printed statements were read, including probability/topology hypotheses, conditional expectations, Gaussian variance conventions, finite products/CRT, continued fractions, Fourier and Hausdorff interfaces. That audit is not a package deliverable.

## Library and ownership audit

Implementation pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library-coverage entries and their actual declarations were checked. Current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were inspected read-only. The nine post-snapshot roadmaps, the Completed roadmaps and nearby ArithmeticDirichletSeries, Exchangeability and IntegralLattices were checked for overlap; the first two READMEs were read in full. No further current PM-specific result replaces a retained target.

Existing arithmetic carriers, omega/Omega, empirical laws, Gaussian moments/determinacy, CDF/characteristic-function tools, circle Haar/Fourier theory, circle ergodicity, Borel–Cantelli, approximation zero–one facts, mean ergodic and conditional-expectation convergence are imports. In particular, the current mean-ergodic L1 conclusion still assumes an L2 observable; it does not supply arbitrary-integrable pointwise Birkhoff. Native `Measure.le_hausdorffMeasure` handles power gauges; the arbitrary-gauge target uses `Measure.mkMetric` and needs its own comparison.

No ownership moves or upward deferrals were introduced. Seven accepted contracts remain explicit in the README:

| Supplier | Exact consumer requirement |
|---|---|
| AN.2, GCD-graph use | Reciprocal-prime Mertens errors, prime-block sums and product estimates with the stated ranges. |
| AN.2, additive limits | Reciprocal-prime asymptotic and bounded prime-power remainder for the exact Turán–Kubilius centers and variances. |
| AN.5 | Pretentious distance and Halász with conductor/height ranges; for each fixed character and A, divergence uniform over the whole interval \|t\|≤Ax. |
| AN.3 | Source-scoped Dirichlet-polynomial means and uniform Liouville/character twists in the required height ranges. |
| ExponentialSumsAndCircleMethod:ES.0 | Modulated short-sum/Fourier estimates with averaging variables and scales; finite Fourier identities alone do not suffice. |
| DT.0 | Bounded native continued-fraction digits iff bad approximation, for irrational unit-interval inputs and positive denominators. |
| GN.4 | Concrete modular quotient, lattice/Haar/action, max-norm Mahler, transpose and time-one mixing; continuous-flow ergodicity alone is insufficient. |

Generic arithmetic/summation stays with libraries and ArithmeticDirichletSeries/AN.0; nilsequence orthogonality with AC.5. IntegralLattices is not the modular homogeneous-flow supplier. These statements retain the accepted requests rather than asserting those suppliers already implement them.

## Source checks made in this run

Public source versions are linked in the README; the following locators were personally read. This records the extent of reading, not a claim that every analytic proof was checked.

| Source and locator | Check |
|---|---|
| Granville–Soundararajan, author copy pp.1–4, Theorem 1, Proposition 2 and (5) | Even/odd moments, multiplicities, cutoff dependence and fixed-order use. No new growing-moment uniformity asserted. |
| Tao, Higher Order Fourier Analysis §1.1, Proposition 1.1.2, Corollary 1.1.3 and Exercises 1.1.4–5, printed pp.5–6 | Bounded-continuous tests, character criterion and the progression/integer conventions. |
| Koukoulopoulos–Maynard, Lemmas 5.2–5.3 and Proposition 5.4, pp.263–265 | Overlap indicator, large values, and the threshold L_t≥10, with t≥1 and Y≥X≥1. Page 265 was also read visually. |
| Bary-Soroker–Koukoulopoulos–Kozma, Lemma 7.2 | Strict concentration intervals and the equal-radius inequality, separate from a zero denominator. |
| Koymans–Pagano v1, Theorem 7.2 and the family definition, pp.59–60 | Conditional center (1/2)log log N, 2/3 window exponent and relative exceptional proportion. |
| Elsholtz–Tao, Appendix A, physical pp.38–39 | Prime-power center/size, coprime additivity and the coefficient 30 in Lemma A.2. |
| Sarig, Ergodic Theory, Theorems 2.2–2.3, printed pp.37,40–41 (physical pp.45,48–49) | Finite coloring, signed integrable observables and the canonical conditional-expectation limit. |
| Sarig, Transfer Operator Method, Appendix A.2, pp.30–31 | Gauss invariance, exactness/mixing and the lower density comparison used after cylinder distortion. |
| Glasscock–Merriman–Robertson–Smyth, Theorems 20–21, Lesson 9 pp.42–43 | Digit law and geometric-mean constant; retain the accepted a(a+2) denominator correction, witnessed at digit 2. |
| Strauch–Porubský, Theorems 1.9.0.1, 1.9.0.3 and 1.11.2.1, physical pp.73–74,95 | Perturbation, bounded variation and the sufficient one-dimensional Fourier constant; these are statement checks. |
| Beresnevich–Velani, Theorem 2 p.977 and Lemma 7 p.988 | General Euclidean gauge, shrinking radii, local full measure and finite disjoint covering. The native compatible-mass extension remains a separate obligation. |
| Matomäki–Radziwiłł v4, Theorem 1 pp.1–2, Corollary 2 p.3, (2)–(4) p.6 and Theorem 3 p.7 | Inclusive short intervals, normalizations, exceptional count, real-start mean-square estimate and prime-block ranges. |
| Tao logarithmic Chowla v4, Theorems 1.2–1.3 and Corollary 1.5/Remark 1.6, pp.2,5–6 | Determinant condition, logarithmic window and corrected uniform-infimum Elliott hypothesis. |
| Harper, pp.2277–2278 | Outcome-wise sign/phase models and their different squarefree support and second moments. |
| Chen–Jaramillo–Yang v1, pp.1–3, (1.1) and (1.6) | Classical geometric full-valuation comparison and half-ell1 total variation; (1.1) is not their Theorem 1.1. |
| Sun v2, Theorem 2 and its proof, pp.3–6 | Absolute derivative coefficients after cancellation and a sufficient contraction below 9/10; no sharper published rate substituted. |
| Gorodnik, Lecture 1, scanned pp.3–8 | Row quotient, Mahler criterion and short-vector argument; transpose gives column convention with source time s=2t. |

The previously accepted source corrections are retained, including the Gauss digit denominator and the GCD-graph slice-cardinality sum. No new errata file or source-observation verdict was created. The cleared-library index was checked; no uncleared copy of Harman or Falconer was used. Downloaded PDFs and extracted passages were kept only in temporary job scratch and are removed after submission. No fetched text was executed. No suspicious instruction was encountered in the sources or issue comments read.

## Mathematical checks and review priorities

| Layer | Distinguishing calculations and boundary checks |
|---|---|
| 0 | Weighted prime sum at 12 is 5 and at 0 is 0. With N=5 its center is 2, variance model 3 and empirical centered second moment 9/5; the complete period N=6 gives 3. Intersections use lcm even on the diagonal. For N=5,d=3 the residue masses are 1/5,2/5,2/5 and TV error 2/15. Include composite coprime moduli, unit/empty CRT families, order-zero moments, nonzero odd Bernoulli moments and full valuation 2 at prime 2. |
| 1 | For two paired primes the ordered coefficient is 6; collisions prevent replacing the finite answer by 3V² without error. Positive-composition count for k=5,s=2 is 2. Cutoff 1 is excluded from logarithmic division. The thin restricted family needs its conditional center and cannot inherit an unconditional error bound. |
| 2 | A constant zero orbit has Dirac limit and fails Haar equidistribution. Dimension-zero irrationality is vacuous; (α,α) fails frequency (1,−1). Empty discrepancy is 0; single observations at 0 and 1/2 give 1 and 1/2. Binary block 10 uses [1/2,3/4), with canonical endpoint digits. |
| 3 | At q=1,radius 1/2 the reduced set is [1/2,1], while the unrestricted set is [0,1]. Keep strict/open-circle transport, irrationality and factor two distinct. A one-edge graph on vertex 2 has quality 4(1−2^(−31/30))^(−10); multiplying the common weight by c multiplies quality by c² and leaves density unchanged. Finite positive vertex weights need not have finite total mass on all naturals. Cantor nesting, separation and Borel extension are different requirements. Radius/diameter gauge comparison is bounded-factor transport, not equality. |
| 4 | Constant averages, divergent-orbit default, least positive hit and red singleton defaults are explicit. An atomic identity system is mixing/exact; a nonatomic identity need not be. Gauss 1/2 has digits 2,0. Words (1,2) and (2,1) send 0 to 2/3 and 1/3. The first word matrix is [[1,2],[1,3]]. Digit-2 probability is log(9/8)/log 2. The −log x mean is positive. L1(0)=π²/6, while P1=1 and P(id)(0)=π²/6−1. Absolute coefficient total 18913/21600<9/10 follows cancellation. The column short-vector constants are min(1,√c) and δ²/2. Haar-generic quotient averages do not imply a generic-horocycle assertion. |
| 5 | h=1 gives two terms, h=0 the totalized zero. For λ at forms n,n+1 the harmonic numerator is 1/2 at x=w=2 and −1/12 at x=w=4. Identical forms give 13/12 at x=w=4. w=1 is empty. The Elliott hypothesis is uniform in growing t. R(4)=0, while S(4)=ζ₂²; neither model proves deterministic cancellation. |

## Nineteen retained proof/source obligations

These are inherited from the accepted target-level plan, not unfinished packaging tasks or newly discharged proof gaps. All consuming targets and their proposed proof routes remain in the README. Independent review should start here when assessing the plan's remaining depth; this package does not claim lemma-level or implementation closure.

1. **Pollington–Vaughan overlap/large-values proofs:** KM Lemmas 5.2–5.3 were checked, but their original cited proof (Theorem 2, pp.195–196) was not acquired. An open proof is needed; the Harman book is not an available substitute. Consumers: §3.2–3.3.
2. **Original Kolmogorov–Rogozin proof:** the BSKK statement was read; its cited symmetrization/combinatorial proof still needs acquisition and decomposition. Consumer: §0.12.
3. **Turán–Kubilius proof:** the source's prime-power center and constant 30 were checked, but its cited reference [60, p.20] proof was not. Consumer: §1.5.
4. **Restricted-family concentration:** conditional Erdős–Kac or a correctly centered restricted second moment is required; ordinary unconditional Turán–Kubilius is insufficient. Consumer: §1.6.
5. **Moments imply weak convergence:** tightness, uniform integrability, cutoff and normalization estimates remain obligations beyond Gaussian formulas/determinacy. Consumer: §1.3–1.5.
6. **Discrepancy proof inputs:** the sampler statements were checked; complete Vaaler/Grabner approximation and Koksma integration-by-parts proofs remain to be matched. Consumer: §2.7.
7. **Native positional cylinders:** the `Real.digits` floor/cylinder and half-open endpoint bridge still needs a complete native proof. Expanding-circle ergodicity alone is insufficient. Consumer: §2.8.
8. **Cantor measure extension:** finite separated trees and compatible child masses must yield a native Borel probability; read or replace the cited Falconer Proposition 1.7. Consumer: §3.9–3.10.
9. **Higher-dimensional Pollington–Vaughan:** acquire the coordinatewise-coprime divergence proof, native cube-volume bridge and overlap/full-measure step. Consumer: §3.11.
10. **Short-interval analytic proof:** MR §§3–9, factorization, Halász/sieve and real-integral to integer-exceptional conversion were not checked in full. Consumer: §5.1.
11. **Logarithmic analytic proof:** Tao §§2–4, finite entropy, entropy decrement, scale selection and modulated MRT sums remain to be decomposed with their uniform ranges. Consumer: §5.2.
12. **Independent prime law realization:** native infinite product probabilities, fair signs/Haar phases and finite integral factorization must be matched. Outcome-wise arithmetic functions alone do not give covariance. Consumer: §5.3.
13. **Classical growing-prime Kubilius proof:** CJJ (1.1) states the cited classical theorem; obtain its fundamental-lemma proof and realize the native geometric product. Fixed-head CRT errors do not imply it. Consumer: §0.13.
14. **Fixed/growing cutoff and CDF bridge:** prove the asymptotics and CDF continuity/density transfer, without treating a finite error bound as an asymptotic conclusion. Consumer: §0.10–0.11 and §1.3–1.5.
15. **Subtorus realization:** compact connected subgroup realization by integral matrices and the higher-dimensional character criterion need proof beyond the parametrized constructor. No unsupported quantitative single-scale criterion is asserted. Consumer: §2.3–2.6.
16. **Remaining equidistribution APIs:** the integer/totally equidistributed interfaces and zero-update/default details remain target-level statements with their tests, not a completed library. Consumer: §2.1–2.2.
17. **Native weak/Fourier bridges:** open-set Portmanteau, circle Haar integrals, frequency kernels and compact pushforward hypotheses must be matched exactly. Native existence of neighboring declarations is insufficient by itself. Consumer: §2.1–2.6.
18. **Reduced interval/limsup transport:** retain q=1, numerator ranges, endpoints, wrapping/order, unbounded denominators and the strict factor-two comparison for irrationals. Consumer: §3.1–3.3.
19. **General-gauge mass distribution:** prove the `Measure.mkMetric` gauge and radius/diameter comparisons; the existing power-gauge inequality does not supply the arbitrary-gauge theorem. Consumer: §3.8–3.10.

## Validation and next step

- Both `scripts/check_blueprint.py` packet runs: exit 0, zero errors and warnings; inputs unchanged.
- `scripts/check_sorry_data.py` on the package Lean file: exit 0.
- Final `lean-check` on the package: exit 0, only 56 sorry warnings.
- Native declaration audit: all 224 checks resolve at the pins.
- Coverage inventory: 415 unique targets, 177 API items, 164 tests; all 39 definition/construction entries have at least three tests. All Lean declaration names are represented in the README.
- `research/blueprint/intake.py check-files` on the four deliverables: 4 files, 0 problems. `git diff --check` and the staged-diff check: exit 0.

No package task remains. The next worker is the independent package reviewer, who should compare the full README to the two accepted packets and rerun Lean. The nineteen inherited obligations and seven supplier contracts above must not be mistaken for completed formal proofs. No further issue is claimed in this run.
