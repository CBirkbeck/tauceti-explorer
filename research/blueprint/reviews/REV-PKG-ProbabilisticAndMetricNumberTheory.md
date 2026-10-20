# Package review: probabilistic, metric and ergodic number theory

**Verdict: accepted, with the corrections below applied.** Reviewer: Codex (GPT-6), session `codex-h5Vkdx`, 20 October 2026. Job `REV-PKG-ProbabilisticAndMetricNumberTheory`, issue #10909. The package author was the separate session `codex-O6ujTl`; this reviewer did not write the package.

This accepts a target-level roadmap for a draft TauCetiRoadmap pull request. It does not certify the proposed proofs, discharge the accepted plan's nineteen proof/source obligations, or assert that the mathematical targets are formalised. No package defect remains identified by this review.

## Changes made

1. In §0.1, corrected the Elsholtz–Tao additive convention to physical pp.37–38 and the strongly additive convention to the defining paragraph of Lemma A.3 on physical p.38. The previous reference to a paragraph before A.3 on p.39 was wrong: p.39 concerns other analytic estimates. Applied the correction to the definition and its API citations, and made the distinct-prime representation locator precise.
2. In §1.5, distinguished the source's N>2 hypothesis in Lemma A.2 from the package's N≥2 statement. The extension is immediate: writing a=f(2), the two sides at N=2 are a²/2 and 30a². Thus the existing Lean signature needs no weakening. Sharpened the following normal-order discussion locator to p.38.
3. In §3.9, required **exactly** two equal-weight children for the half-parent-mass Check. Two selected siblings among a larger child set need not receive halves. Added three equal children and unequal weights 1:3, giving thirds and quarter/three-quarter masses respectively. These distinguish the normalization over all children from a pairwise or unweighted normalization.

Only the README, this report, `review.json` and the required handoff change. The Lean signatures, metadata and accepted packets remain unchanged.

## Shape, coverage and definition tests

Read WORKERS, PROTOCOL, PACKAGE_REVIEW, UPSTREAM_GUIDE and the expansion protocol, then both accepted packets and the entire package. The two upstream style models read in full were ArithmeticDirichletSeries and Exchangeability; their current suggested files were also inspected. The package has the opening Summary, ownership, conventions, exact suppliers, six ordered layers, mathematical topic prose, worked examples, dependencies and references. It contains no packet/job identifiers, coverage tables, review history or source-by-source synopsis. Source statements are written in the roadmap's own words. Metadata is the single fitting line `topic = "math.NT"`.

The parent and PM.4 continuation contain 300 and 115 distinct nodes. Independently counted their combined 415 unique targets, 177 API entries and 164 test entries. All 39 definition/construction entries have at least three tests. Compared their statements, hypotheses, APIs and Checks with the README; the existing six Haar/Fourier items belong in the native boundary, and the other 409 targets are retained in the layers. No accepted target was removed by this review. The normalization Checks above augment the retained tests.

The tests use values, degenerate cases, native comparisons and non-examples. Particularly consequential distinctions are the positive arithmetic sample, strong versus complete additivity, repeated-prime moments, total versus plain equidistribution, finite-order characters, canonical half-open digits, denominator-one reduced approximation, local versus global graph finiteness, compatible masses versus a Borel extension, integrable versus square-integrable observables, irrational cylinder domains, inverse-word order, normalized versus Lebesgue transfer, inclusive short intervals, and sign versus phase random models. The former child-mass ambiguity was the test defect found and repaired.

## Source-locator sample

Sampled 15 distinct nodes reproducibly using Python's `random.Random(10909).sample` on the parent nodes followed by the PM.4 continuation nodes. Read every source location attached to each selected node, including the secondary locators. The package has no individual locator flagged unverified. Its separate proof-acquisition obligations are addressed below; they are not silently treated as verified proofs. Page numbers below distinguish printed from physical PDF numbering.

| Selected target | Source actually checked | Result |
|---|---|---|
| Empty inverse word | Sarig, [Transfer Operator Method](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.32–33, printed pp.30–31 | The inverse-cylinder setting matches. The empty word is the elementary identity case of the package's ordered composition, not a separately numbered source theorem. |
| Sharp residue event error | Tao, [probabilistic prime models](https://terrytao.wordpress.com/2015/01/04/254a-supplement-4-probabilistic-models-and-heuristics-for-the-primes-optional/), §3, opening six paragraphs | Residue counts and the CRT comparison are present. The exact remainder/total-variation constant is explicitly the roadmap's finite refinement; checked its positive and negative atom sums independently. |
| Transfer between ω and Ω limit laws | Tao, [elementary multiplicative number theory](https://terrytao.wordpress.com/2014/11/23/254a-notes-1-elementary-multiplicative-number-theory/), §4 Exercises 46(i), 51(iv); [central limit theorem notes](https://terrytao.wordpress.com/2010/01/05/254a-notes-2-the-central-limit-theorem/), §1 Exercise 5, §2 (5), Theorem 13 and proof | Sources support the repeated-factor comparison and weak-limit principle. The arbitrary common center, diverging scale and possibly discontinuous target CDF are an explicit bounded-Lipschitz refinement, whose finite empirical proof is retained. |
| Cantor-level nesting | Beresnevich–Velani, [mass transference](https://annals.math.princeton.edu/wp-content/uploads/annals-v164-n3-p06.pdf), §§5.1–5.2, printed pp.980–986 | Construction and properties P0–P5 supply the cited nested, separated levels. Read the sublevel and cutoff conditions as well as containment. |
| Signed divisibility error | Mathlib at `082e2d37`, `Data/Nat/Factorization/Basic.lean`, `Nat.card_multiples` | Read the native count and resolved its type at the pin. Quotient/remainder gives the stated negative error on the positive sample; d=1 gives zero. |
| Cantor measure root mass | Beresnevich–Velani, §§5.3–5.5, printed pp.986–990 | Root normalization, weighted child masses and arbitrary-ball estimate match. The separately cited compact-tree measure extension remains a named target, not an assumed construction. |
| Signed prime-divisibility pattern formula | Mathlib at `082e2d37`, `Finset.lcm_eq_prod`, `Finset.lcm_dvd_iff`, `Finset.prod_one_add`, `Finset.sum_pow_mul_eq_add_pow`; Tao prime models §3 | Read and resolved the generic identities. Their empirical finite-subset specialization has the correct signs and real-valued subtraction; the source is not credited with the exact derived formula. |
| Cylinder shift law | Sarig, Transfer Operator Method, Appendix A.2, physical pp.32–33 | Inverse branches and cylinders match; the README explicitly supplies the irrational-domain and zero-index digit refinement. |
| GCD-graph nontriviality, density and quality | Koukoulopoulos–Maynard, [Duffin–Schaeffer](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n1-p05-s.pdf), Definition 6.6 and remark, printed pp.271–273; Lemma 6.7(d), p.273 | Positive edge mass, positive density and positive quality agree. Checked the zero-mass guards and positive finite Euler factors. Visually checked p.272 where text extraction obscures the ≥ sign in the common-valuation condition. |
| Concentration monotonicity | Bary-Soroker–Koukoulopoulos–Kozma, [v3](https://arxiv.org/pdf/2007.14567v3), Lemma 7.2, physical p.36 | The convention uses strict real intervals. Monotonicity is an immediate inclusion consequence; radius zero is empty. The original inequality's proof remains a separate acquisition obligation. |
| Strong additivity implies additivity | Elsholtz–Tao, [egyptian-count13](https://terrytao.wordpress.com/wp-content/uploads/2011/07/egyptian-count13.pdf), Appendix A, Lemma A.3, defining paragraph, physical p.38 | Corrected the wrong p.39 locator throughout §0.1. This is projection of the two-clause predicate, not an additional analytic theorem. |
| Gauss–Kuzmin exponential convergence | Sarig, Transfer Operator Method §2.3, physical pp.11–13; Sun, [v2](https://arxiv.org/pdf/1705.02921v2), Theorem 2 and proof, physical pp.3–6 | Both exponential-convergence routes are located correctly. The package uses the continuation's absolute derivative coefficients and sufficient 9/10 rate, preserving the correction to Sun's signed triangle estimate; it does not claim the sharper printed rate. |
| Finite random-model second moments | Harper, [High moments](https://msp.org/ant/2019/13-10/ant-v13-n10-p02-s.pdf), printed pp.2277–2278, especially p.2278 | Independent prime signs are squarefree-supported and phases completely multiplicative; diagonal expansion gives squarefree count and N. No deterministic cancellation is inferred. |
| Van der Corput difference theorem | Tao, [Higher Order Fourier Analysis](https://terrytao.wordpress.com/wp-content/uploads/2012/12/gsm-142-tao7-higher-book-05june2012.pdf), §1.1.1, Lemma 1.1.6 p.7, Corollary 1.1.7 and limiting step p.8 | Positive-lag differencing and the order of the two limits match. The exact finite lag inequality is consumed from ES.0; it is not reproposed here or claimed to be the identical displayed source inequality. |
| Gauss ergodicity | Sarig, Transfer Operator Method, Appendix A.2, physical pp.32–33 | The exactness/mixing argument supports ergodicity after the explicitly named generic bridge. The corrected lower density comparison is retained. |

No verbatim source passages were added. Public author or publisher versions were used; the cleared-library index was checked, and no uncleared Harman or Falconer copy was acquired. In particular, reading a source's citation to a proof is not recorded as reading that proof.

## Prerequisites, pins and current upstream overlap

Read the reviewed `data/library-coverage.json` entries and the actual native declarations used at implementation pins Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. A separate temporary Lean audit resolved **232 unique native declarations**, including every distinct declaration in the two packet baselines; read the printed types rather than relying on name resolution alone. The checks include arithmetic-function conventions, empirical indexing, real/extended probability conversions, multinomial/CRT tools, Gaussian variance and centered moments, weak/CDF/characteristic-function criteria, native Fourier/Haar inputs, Hausdorff interfaces, conditional expectations, continued-fraction indexing and transfer-operator calculus prerequisites.

Independently verified the read-only current commits: TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searched the complete current roadmap tree, Completed tree and library using both mathematical names and object fields/operators: finite-law arithmetic and factorization, empirical measures, moments and exponential integrability, Fourier characters and Haar, bounded variation, reduced approximation and Hausdorff gauges, invariant sigma-algebras and Birkhoff averages, continued fractions, entropy, and multiplicative statistics. Included the nine post-snapshot roadmaps and Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts.

No additional retained target was found to duplicate a current result. In particular:

- Native arithmetic functions, ω/Ω, finite counts, empirical laws, Gaussian moments and determinacy, Fourier/Haar, circle ergodicity, approximation zero–one tools and martingale convergence are prerequisites. The six already-native Haar/Fourier targets were already confined to the opening boundary; no further removal was needed.
- Read `Probability/Ergodic/CondExpProjection.lean` at the current commit: its L1 mean-convergence theorem still requires `MemLp f 2`. It does not replace the package's pointwise theorem or L1 convergence for every integrable observable.
- Read `Probability/Moments/Determinacy.lean`, including `Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp`. This identifies measures from moments under exponential integrability; it does not itself give convergence from a sequence of arithmetic moments. The package retains tightness and uniform-integrability targets.
- Native `Measure.le_hausdorffMeasure` is the power-gauge input. The package keeps the arbitrary-gauge `Measure.mkMetric` comparison and Cantor probability extension as additional targets.
- IntegralLattices concerns integral bilinear/quadratic lattices and does not supply the generic modular-flow contract. Those inputs remain with GN.4.

Walked the target prerequisites against the accepted links and CaraianiNewton order. There is no FoundationsAndLibraryIntegration or `UPSTREAM:` residue, and no new upward citation or ownership move. PM lies outside the 94-roadmap order; its stage-specific contracts do not justify importing an upward coarse roadmap cycle. AN.2/3/5 are the earlier analytic suppliers, not consumers of PM's later analytic conclusions. The seven explicit contracts remain: two AN.2 estimate families; AN.3 uniform Dirichlet-polynomial/twist estimates; AN.5 pretentious distance and Halász with the growing-height infimum; ES.0 Fourier/modulated short sums and lag inequality; DT.0 bounded digits/bad approximation; GN.4 quotient, Haar, Mahler and time-one mixing. The apparent Layer 2→4 normality dependency is acyclic because pointwise Birkhoff does not use normality or equidistribution.

## Adversarial mathematics pass

Read every target, identity, definition, API item and convention. The table groups the checks by the README's 51 topic groups; a retained row means no correction was needed beyond the explicit edits above. Divisions use positive sample size, modulus, prime, scale on the eventual tail, positive radii or child-weight sums, or the stated totalized convention. Empty supports and order zero were checked separately from positive-order bounds.

| Topic | Instances and failure modes checked | Outcome |
|---|---|---|
| 0.1 Additive predicates | f=0; convolution unit at 1; ω(4)=1 versus Ω(4)=2; zero inputs excluded from product law | Predicates retained; source pages corrected. |
| 0.2 Weighted prime sums | P empty; n=0,1,12; P={2,3}, a(p)=p gives 5 at 12 and 0 at zero | Zero guard and native carrier retained. |
| 0.3 Divisibility | d=1; d>N; N=5,d=2 gives error −1/10; repeated divisors require lcm | Floor before real cast; correct error sign. |
| 0.4 Model-centered moments | N=5 gives second moment 9/5 versus model 3; N=6 complete period gives 3 | No finite-sample independence assumed. |
| 0.5 Boolean patterns | Empty S,T; S={2},T={3},N=5 gives 2/5; N=6 full period | Inclusion-exclusion signs and 3^\|P\| error retained. |
| 0.6 Higher finite moments | Order zero, repeated primes, diagonal intersections and singleton centered exponent | Products use lcm and permit repeated prime indices. |
| 0.7 Residues | N=5,d=3 gives masses (1/5,2/5,2/5), TV 2/15; R=0; d=1 | Shift ρ(a)=(a−1).val and half-ell1 factor retained. |
| 0.8 CRT laws | Empty family; unit modulus; coprime composite moduli; common divisor obstruction | No prime-only restriction or false noncoprime product law. |
| 0.9 Repeated factors | n=1,4; N=4 mean excess 1/4; arbitrary common center | One-sided excess and finite law differences retained. |
| 0.10 Weak arithmetic limits | Constant scale versus divergent scale; point-mass target; common sampling law at each index | Bounded-Lipschitz transfer does not require continuous target CDF. |
| 0.11 Exponential moments | k=0; N=1; θ=log(3/2)>0; negative tail threshold | exp(2), factorial and nonpositive-threshold bounds remain consistent. |
| 0.12 Concentration | Dirac law, radius zero and negative radius; no summands; denominator zero | Strict intervals and positive denominator retained. |
| 0.13 Kubilius | Empty small-prime set; valuation 2 at p=2; large prime product | Full geometric valuations and growing-prime theorem distinguished from finite CRT. |
| 1.1 Prime model | Bernoulli means; p=2; nonzero third moment at p=3 | No symmetry assumption on centered prime indicators. |
| 1.2 Pairing/collisions | Two pairs give coefficient 6; k=5,s=2 gives two compositions; empty support | Collision term and corrected composition count retained. |
| 1.3 Gaussian comparison | P={2,3}: fourth moments 203/432 and 289/432; k=1; negative arithmetic odd moment | Finite inequalities do not assert moment asymptotics. |
| 1.4 Prime cutoff | Y=1 excluded; n=1; z>N; center mismatch; fixed order | Log denominators and separate center/tail errors retained. |
| 1.5 Normal/Gaussian laws | N=2; full prime-power center; variance one; small N totalization irrelevant at infinity | Added direct N=2 calculation; analytic cutoff/convergence targets remain separate. |
| 1.6 Thin family | Conditional half-log-log center and relative count; unconditional bound insufficient | Restricted-family hypothesis and quantitative obligation retained. |
| 2.1 Weak equidistribution | Constant sequence → Dirac; multiplicity of repeated values; zero-dimensional torus | Native successor empirical law and null-frontier restrictions retained. |
| 2.2 Progressions/integers | q=1,r=0; q>0; positive/negative halves; update at zero | No zero-step total-equidistribution assumption; zero update invisible to both halves. |
| 2.3 Torus irrationality | Empty dimension; zero point; (α,α) and frequency (1,−1); rational coordinate | All nonzero integer characters required, not coordinatewise irrationality. |
| 2.4 Fourier criteria | Frequency zero; nonzero characters; arbitrary limiting probability | Native orthogonality imported; finite Fourier tests not enough for weak convergence. |
| 2.5 Linear/polynomial | s=1; rational leading term; positive lag only; characterwise irrational nonconstant coefficient | Leading-irrational sufficient theorem and general criterion both retained. |
| 2.6 Subtori | Trivial/full subgroup; nonsaturated integer relations; rational periodic component | Saturated relation lattice and integral matrix realization not conflated. |
| 2.7 Discrepancy | Empty sample 0; one point at 0 or 1/2 gives 1 or 1/2; constant integrand | Strict [0,t) convention, N>0 analytic estimates and BV hypotheses retained. |
| 2.8 Normal digits | Base 1; binary block 10 on [1/2,3/4); canonical endpoints; countably many bases | Native digit/circle bridge remains explicit. |
| 3.1 Approximation sets | q=1, ψ=1/2: reduced [1/2,1], unrestricted [0,1]; q=2; ψ=0 | Numerator ranges, coprimality and closed endpoints retained. |
| 3.2 Limsup theorems | Zero ψ; nonmonotone ψ; Catlin infinite supremum; Khinchin monotonicity | ENNReal supremum and factor-two irrational circle transport retained. |
| 3.3 Overlap/second moment | q=2,r=3, ψ=.3 gives overlap 1/6; zero maximum; positive proportion versus full measure | Correct overlap indicator and distinct zero–one/full-measure step retained. |
| 3.4 GCD graphs | One edge at 2; zero endpoint mass; individually finite weights with infinite global total; scaling by c | Density unchanged, quality scaled by c²; guarded quotient and exact valuation fields retained. |
| 3.5 Pruning | Zero vertices; positive edge forces positive endpoint totals; sum over slice indices | 10/9 threshold and weighted pigeonhole hypotheses retained. |
| 3.6 Prime increments | Equal zero/positive valuations; p=2; diagonal versus off-diagonal slices | Common-valuation ≥1 indicator and positive Euler factors retained. |
| 3.7 Arithmetic anatomy | δ=0 excluded; prime cutoff endpoints; selected subgraph must remain nontrivial | Source ranges and AN.2 contracts retained. |
| 3.8 Gauges/coverings | f(0)=0; constant gauge rejected; f(r)=r^s; radius versus diameter | Gauge continuity/positivity and bounded-factor transport retained. |
| 3.9 Cantor/masses | Repeated finite balls; nonroot sublevels; root 1; two/three equal weights; weights 1:3 | Fixed child-count ambiguity and added normalization controls; extension remains a named theorem. |
| 3.10 Hausdorff consequences | s=0/1 boundaries; v>2 gives 2/v; dimension capped at 1; arbitrary ball versus construction ball | No power-gauge theorem substituted for the general gauge. |
| 3.11 Higher dimension | k=1 excluded from k≥2 theorem; coordinatewise versus joint coprimality | Exact cube and coprimality convention retained. |
| 4.1 Truncation/first hit | A₀=0; constant orbit; no positive hit; infinite upper limit | Finite truncation and least-positive-hit sentinel explicit. |
| 4.2 Coloring/convergence | Empty/terminal interval; red singleton; last block length; signed integrable f | Termination, short tail and measurable representative/conull orbit step retained. |
| 4.3 Limit/conditional expectation | Divergent orbit default 0; invariant event; T=id; arbitrary L1 observable | Strict representative invariance and L1 conclusion distinguished from existing L2 mean theorem. |
| 4.4 Gauss system | x=0,1/2; rational termination; irrational invariant D; atomic versus nonatomic identity mixing | Total map, digit index zero and native probability support retained. |
| 4.5 Words/convergents | Empty word; [1,2] versus [2,1] gives 2/3 versus 1/3 at zero; matrix [[1,2],[1,3]]; N=0 | Order, determinant (−1)^n, q₀=1 and q₋₁=0 fixed with witnesses. |
| 4.6 Filtrations/exactness | Empty cylinder D; zero digit rejected; trace Borel on D; density at 0 and 1; tail event | Correct density bounds 1/(2log 2) to 1/log 2; reverse conditional expectations supply mixing. |
| 4.7 Metric constants | Digit 2: log(9/8)/log 2; Khinchin denominator a(a+2); −log integral positive | Correct constant/sign and native denominator comparison retained. |
| 4.8 Transfer operators | L1(0)=π²/6; P1=1; P(id)(0)=π²/6−1; zero function | Lebesgue and normalized operators remain distinct; summation hypotheses explicit. |
| 4.9 Contraction/rate | h₂′(1)=−1/72; absolute total 18913/21600<9/10; n=0; interval endpoints | Cancellation precedes absolute values; C¹ endpoint derivatives and uniform digit bound retained. |
| 4.10 Homogeneous consumers | q=0; nearest integer; δ≤1; x rational; row/column transpose; source time s=2t | Constants min(1,√c) and δ²/2 agree. Time-one mixing is a supplier hypothesis; Haar-typical does not mean horocycle-typical. |
| 5.1 Short intervals | h=0,1; h=1 has two terms; h≤X; real versus complex f | Inclusive denominator h and real multiplicative theorem retained; real-start L2 bound distinct from integer exceptions. |
| 5.2 Log correlations | w=1; λ at n,n+1 gives 1/2 at x=w=2 and −1/12 at 4; identical forms give 13/12 at 4 | Floor window, no conjugation, nonzero determinant and uniform growing-height Elliott premise retained. |
| 5.3 Random models | n=1,4; R(4)=0 versus S(4)=ζ₂²; independent laws versus arbitrary outcomes | Native law realization/covariance remain separate from arithmetic functions and deterministic cancellation. |

## Lean signatures and checks

`Suggested.lean` has 821 lines: 31 light real-bodied definitions, 55 theorem signatures, one Prop-valued probability instance with an admitted proof, and 34 proved examples. The two local instances provide native topology/Borel structures with real bodies. Imports are `Mathlib` and the used Tau Ceti empirical-measure module. There are no sorry-bodied data objects, surrogate heavy carriers, admitted examples or auxiliary proof development. Every named Lean declaration is present in the README; the closing comment records the heavier README-only definitions. At most two proved examples exercise any retained definition.

Compared all retained signatures with the README. The following spot-checks record the most sensitive hypotheses explicitly:

| Signature | Agreement checked |
|---|---|
| `primeDivisibilitySum_secondMoment_error` | Positive successor sample, real weights, prime set and factor 2L²/N. |
| `crt_statistic_error` | Pairwise coprime nonzero moduli, real oscillation bound and sharp remainder denominator. |
| `excess_distribution_transfer` | Same arbitrary center/scale; scale tends to +∞; any probability target. |
| `kolmogorov_rogozin` | Measurable independent real summands; positive radius and positive deficit denominator. |
| `kubilius_small_prime_model` | Full valuation vectors; native product atoms; half-ell1 total variation and diverging β. |
| `turan_kubilius` | Full prime-power center/size, real additive f and N≥2, including the direct endpoint extension. |
| `restricted_squarefree_window` | Exact squarefree residue-restricted family, half-log-log center and relative tail. |
| `linear_equidistribution_tfae`, `weyl_polynomial` | Finite torus, total/plain equivalence and positive polynomial degree. |
| `catlin`, `khinchin` | Extended supremum versus monotonicity requirement; no accidental denominator-zero series term. |
| `mass_transference_power`, `duffin_schaeffer_dimension` | Shrinking positive radii and local full measure; 0<s<1; dimension capped at one. |
| `birkhoff_pointwise` | Probability-preserving map, every integrable real observable and native invariant conditional expectation. |
| `wordMatrix_native`, `orbit_product_identity` | Irrational cylinders, nonempty matrix comparison and separate N=0 product convention. |
| `transfer_derivative_contraction`, `density_uniform_error` | Closed-interval C¹ hypothesis, nonnegative derivative bound and sufficient 9/10 factor. |
| `homogeneous_birkhoff`, `bounded_digits_compact_orbit` | Exact diagonal/unipotent entries, native quotient and time-one mixing, positive-time closure. |
| `matomaki_radziwill`, `logarithmic_chowla` | Real bounded multiplicativity for the first; distinct positive-slope integer forms and growing admissible window for the second. |

Validation performed in this review:

- `lean-check` on the unchanged package file: exit 0, exactly 56 `declaration uses sorry` warnings, no errors or other warnings. Memory availability exceeded 20 GB. No direct Lake operation or language server was used.
- Separate temporary 232-declaration API audit via `lean-check`: exit 0, no warnings or errors.
- `scripts/check_blueprint.py` on each accepted packet: exit 0, zero errors and warnings; inputs unchanged.
- `scripts/check_sorry_data.py` on the package file: exit 0.
- `research/blueprint/intake.py check-files` on the four changed deliverables: 0 problems.
- `git diff --check`: passed.

## Retained obligations and handoff

The accepted plan still has nineteen target-level proof/source obligations. They concern Pollington–Vaughan overlap/large-values proofs; the original concentration proof; the Turán–Kubilius proof; restricted-family concentration; Gaussian moment convergence and cutoff estimates; discrepancy proof inputs; native digit cylinders; Cantor measure extension; higher-dimensional divergence; short-interval analytic proof; logarithmic analytic proof; independent prime-law realization; classical growing-prime Kubilius; cutoff/CDF bridges; subtorus realization; remaining integer/total equidistribution APIs; native weak/Fourier bridges; reduced interval/limsup transport; and arbitrary-gauge mass distribution. They remain identified in the accepted packets and package handoff, and their consuming targets and proof routes remain in the README. The sample confirms the stated source results, not all of their original proofs. The PM.4 continuation's explicit pointwise, exactness and corrected transfer route is retained without inventing a substitute spectral-gap construction.

No further fix, ownership move or duplicate-target removal is requested. The package is ready for the draft roadmap PR under these stated limits. See the [review handoff](../handoff/REV-PKG-ProbabilisticAndMetricNumberTheory.md) for the submission record and next action. No suspicious instruction was encountered in the source or issue material read.
