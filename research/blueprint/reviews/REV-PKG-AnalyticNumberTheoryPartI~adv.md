# Independent package review: AnalyticNumberTheoryPartI

Job REV-PKG-AnalyticNumberTheoryPartI~adv, issue #10271. Reviewer: Codex (GPT-6), session codex-9sCfy4, 2026-10-17. The reviewed split was written by another session, codex-Digyy3, in #10249 / PR #10252. This is a completed independent fixing review.

**Verdict: needs_changes.** The package retains a specific prerequisite gap in §3.23: the proposed quantitative second-moment proof requires a divisor Voronoi transform, Bessel-function convergence/remainder estimates, and moving-cutoff saddle-point contracts which neither the package nor a cited supplier supplies. The theorem itself has a verified public source. The README now marks the missing mathematics explicitly. The package is not ready to port upstream until that gap is closed; this verdict does not claim that compiling statements proves them.

## Scope, baseline and preservation

Read WORKERS.md, PACKAGE_REVIEW.md in full, PROTOCOL.md (including §§5, 13, 15, 20), the expansion source rules, UPSTREAM_GUIDE.md, and the full issue after the bot confirmed the claim. Read the upstream ArithmeticDirichletSeries and Chebotarev README models, and the current upstream contribution instructions. The Part I wildcard has no separate packet: the available accepted plan is `research/blueprint/packets/AnalyticNumberTheory.json`; its validation reports zero errors and warnings. Its 239 nodes are a planning input, not a substitute for the package's statements.

Compared the unsplit README immediately before split commit `34883ce8b` with the checked-in routing index and both part READMEs. Every one of the 497 explicit legacy anchors remains in the index and resolves to an existing owning-part anchor. Before this review, all mapped target first statements agree after normalizing source-link labels and the new subsidiary section numbers; the only remaining first-paragraph difference is the Layer 4 introduction. Checked §§2.1–2.2 separately because their legacy route goes to the containing Layer 2 anchor. All 236 numbered primary headings and 257 subsidiary statements across the two parts remain; Part I has 139 numbered primary targets and 62 subsidiary statements. The three primary headings without their own canonical `s` anchor explain why a count of only those anchors is smaller than the heading count.

Every original Check bullet remains across the parts; the simple Check-block extractor finds 372 original bullets and 374 after the two additional analytic-conductor controls. That extractor does not count ordinary worked-example bullets or inline Checks. The 31 Part I Check blocks, their individual tests, inline tests, API lists and expanded Needs clauses were read, not merely counted. No tests or hypotheses were cut to meet the size cap. Redundant assumption paragraphs were removed only where the first target statement already contains all their hypotheses. The four quadratic-CM targets now identify their canonical reciprocity character once in place of repeating the same setup.

There is no Part I reference to Part II, and no ArithmeticStatistics or ModularityAndLanglandsExtensions input. The unsuffixed index identifies ArithmeticStatistics as downstream. The Part I supplier boundary remains independent of those consumers. Part II was inspected only for preservation, routing and dependency direction; this is not its mathematical review.

## Corrections applied

1. Replaced the §0.4 reliance on a finite numerical prime-power check with an explicit certificate from θ(x)<1.000081x. At k≥2·10^10 the higher-power error divided by k is bounded by `(1000081/1000000)(1/140000+35/7290000)`, strictly less than the required margin `(1−3·0.002811)/8−0.1239`. The ratio functions decrease from the threshold. Added an exact rational Lean control proved by `norm_num`.
2. Gave §0.23 a precise good-circle factorization milestone and a public source: Kupers, *Lectures on complex analysis*, §14.1, pp.89–93, Lemmas14.1.4–14.1.5 and Corollary14.1.6. The auxiliary exponent stays strictly below the next genus integer; the source's non-strict printed inequality cannot be used at equality. The source supplies the proof mechanism, while our target uses the correct strict hypothesis.
3. Removed finite Artin conductor construction, integrality, prime independence, direct-sum and conductor–discriminant ownership from §2.2. These are lower-tier ArithmeticGaloisRepresentations Layer 3, §§3.2–3.5, not new AnalyticNumberTheory targets. Added that exact supplier contract and retained the genuinely analytic base-discriminant normalization, its API and every old Check. Added the zero-dimensional and trivial-over-ℚ(i) controls.
4. Corrected lower-ramification attribution to `TauCeti.LocalFieldsRamification`, rather than LocalGaloisGroups. Updated the DifferentialGeometry supplier to its current §§5.6.2–5.6.3 finite weighted subdivision, planar Green and corner comparison interfaces. Nielsen-core orbifold multiplicities, boundary projection and the cusp limit remain local work.
5. Corrected §2.16a's accidental dependency on §2.1 (Nielsen cores): the positive Mellin argument uses Dedekind continuation §2.5 and the completed equation §2.17a.
6. Corrected the smooth-count unit statement to x≥1; Ψ(0,2)=0, whereas Ψ(x,y)=1 for x≥1 and y<2. Added the zero-cutoff Lean control.
7. Matched `pretentiousDist_mul_le` to primewise unit-disc hypotheses; values at composite arguments are irrelevant. Added D(0,0;2)²=1/2, which refutes the tempting but false assertion that every disc-valued function has zero distance from itself.
8. Replaced the fourth-moment appeal to an unexamined Heath-Brown input by a direct Kösters §3 route with four named, quantified auxiliary targets: the moving-cutoff approximate equation, squared-divisor diagonal, divisor off-diagonal and first/second derivative oscillatory bounds. The CRT divisor-correlation argument is supplied in our own words. The weaker O(T log³T) theorem needs no Heath-Brown remainder.
9. Supplied the compact-u induction for §3.34. The prime harmonic rescaling comes from §0.21, the terminal interval is cut off at p>x^(1−η), and the remaining recursive argument has x/p≥x^η and a compact smaller-u range. Taking x→∞ before η→0 closes the fixed-u theorem, without claiming uniformity for u→∞.
10. Corrected the Mertens source ranges to Sarnak–Södergren Lemma4.9/proof pp.713–714 and Lemma4.11/proof pp.715–716. Pinned the second-moment source to arXiv v3, with Theorem2 on p.4 and the sufficient bound (109) on p.35. Replaced stale moment proof-route prose and repaired the Lean closing definition inventory. Removed obsolete review/process phrases from the roadmap.

## Current upstream and library duplication audit

The runner's read-only roadmap checkout is at `0d144d044dacebca17b654695b6f1ad58f159b27`; it is not the GitHub main tip. Independently checked GitHub main `350e970ce49f707a327909beac0b7b7c782cc7ee` and its changes from common ancestor `094dd0a7ca814cab4f0dbb8c1778c567ea1cc0c2`. Read relevant changed files individually, without cloning or copying a repository. Current Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The compilation baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Searched by objects and hypotheses as well as names: finite-order entire functions, canonical products and Gamma remainders; prime/progression sums and conditional error terms; weighted separated-frequency Hilbert sums; finite ramification, inertia-invariant determinants, conductor ideals and induced characters; ideal-class counts and Hecke continuations; multiplicative convolutions, smooth integers/delay equations, indexed generalized primes, divisor correlations and zeta moments. Inspected matching statements, rather than interpreting a missing name as a proof of absence. The nine newer roadmap directions and Completed/ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts were included. Current-main DifferentialGeometry, LocalFieldsRamification, LocalGaloisGroups, RealAlgebraicGeometry and OperatorTheory subroadmaps were checked where the main comparison changed the supplied snapshot.

| Existing owner | Imported object or theorem | Disposition |
|---|---|---|
| Current ArithmeticDirichletSeries / Chebotarev library | Qualitative prime-ideal/Frobenius PNT, canonical weight continuation and nonvanishing, Perron/Abel and Tauberian infrastructure | Existing boundary deferrals retained; local targets concern quantitative errors and specific arithmetic comparisons. |
| Current representation library | Integral Brauer induction and nilpotent monomiality | Existing import retained; no second induction theorem. Arithmetic local-factor comparison remains local. |
| Current contour library / Completed ContourIntegration | Residue theorem, argument principle, winding numbers and curve integration | Generic results remain imports; safe heights, endpoint kernels and infinite-height adapters remain local. |
| DifferentialGeometry §§5.6.2–5.6.3 | Weighted planar arc subdivision/cancellation and Green/corner comparison | Updated supplier; general planar Green is not an extra local target. Orbifold and cusp adapters are distinct. |
| ArithmeticGaloisRepresentations Layer 3 §§3.2–3.5 | Finite Artin conductor ideal, integrality, conductor–discriminant and its compatibility | Removed duplicate finite construction from §2.2, imported as a **planned lower-tier** contract. Checked public PR #856 head `a8238d96cc8f57a4a7365895b5d033422c8a204d`; this does not claim it is already library code. |
| LocalFieldsRamification / ClassFieldTheory 7 | Lower ramification filtration / abelian conductor comparison | Corrected module attribution and retained the compatibility input. |
| LFunctions / ZerosOfLFunctions | Generic order-one, Gamma, degree-one zero counting and logarithmic derivatives | Existing import; our finite-order and arithmetic-uniform variants specify their extra hypotheses. |
| Remaining newer roadmaps / Completed items | Vector bundles, lattices/spin, peripheral/profinite actions, real algebraic and operator/spectral theory | No second owner of the remaining Part I quantitative targets found. Hadamard matrices, calculus's `hadamardFactor`, Nielsen–Schreier and operator Atkinson are different objects. |

ArithmeticGaloisRepresentations is tier 7, below AnalyticNumberTheory's tier 14; no upward dependency was introduced. Ownership removal is a supplier deferral, not a loss of the accepted original's conductor capability.

## Public-source checks

The random sample was drawn once, before source checking, using the session/issue seed `codex-9sCfy4-10271`; it was not replaced after finding difficult sources. Read the stated passages and the surrounding hypotheses/proofs where needed. Printed pages are used below except Tate's explicitly physical PDF pages. Sources are linked by the package bibliography. No source passage is reproduced here or in the roadmap.

| Sample target | Source passage actually checked | Result |
|---|---|---|
| §1.8 Weil formula | Mestre §I.1–I.2 pp.211–215, Remark1.1.3 and Lemmas1.2.1–1.2.2; Colmez–Tsimerman §2.3 pp.275–276, (2.3.5) | BV/decay and archimedean conventions retained. |
| §2.24 CM partial zeta | Duke–İmamoğlu–Tóth §7 (7.1), p.970 | Half-unit normalization agrees. |
| §0.31 Mertens comparison | Koukoulopoulos Thm3.4(c) pp.40–41; Sarnak–Södergren L4.9/proof pp.713–714 and L4.11/proof pp.715–716 | Corrected the proof page ranges. |
| §0.17 two-real-zero inequality | Bennett–Siksek Prop7.1(i), (23), p.373 | Primitive/nonprincipal and strict endpoint hypotheses retained. |
| §2.5 Dedekind continuation | Tate §4.4 Main Thm4.4.1 and §4.5, physical pp.50–58 | Continuation is canonical Tate continuation; measure/different conventions retained. |
| §3.35 Rankin bound | Hildebrand–Tenenbaum p.414 (1.3), checked page image | σ>0 and finite-prime geometric factors agree. |
| §2.40 Heilbronn | Heilbronn Thm1 p.870 and entire proof pp.871–873; Aramata Sätze4–6/proof pp.32–34 | Simple-zero and virtual-character steps distinguished from Artin holomorphy. |
| §3.34 Dickman limit | Hildebrand–Tenenbaum p.414 unnumbered fixed-u limit before (1.5)–(1.6) | Statement agrees; supplied compact-u proof adapter separately. |
| §3.15 shifted squares | Ghosh–Sarnak arXiv v3 §1 p.3, §4.1 pp.12–13, §8 p.24 | Finite square-zero endpoint and exceptional families agree. |
| §3.17 prime-divisor logarithmic weight | Shankar–Shankar–Tang–Tayou, proof of Prop5.2 p.27 | Divisor-supported sum and logarithmic bound agree. |
| §0.26 Euler product | Koukoulopoulos Thm3.4(c), (3.6), pp.40–41, Ex5.4 p.61 | Inverse-product direction and e^γ factor agree. |
| §3.22 divisor average | Koukoulopoulos Thm3.3/proof pp.38–39; Thm1.11/proof pp.15–16 | Hyperbola and harmonic remainders agree at square cutoffs. |
| §3.45 Halász integral | Granville–Harper–Soundararajan Thm1.1 p.2, §2 pp.7–12, L2.6/proof p.11 | Λ weight and log^(κ+1) mean-square input retained. |
| §1.2 Davenport | Sarnak–Södergren L3.2 p.690 | Statement agrees; its citation is not claimed to contain the full proof. Package's major/minor-arc adapter is separately present. |
| §2.10 genus characters | Gross–Zagier Ch.IV introduction after (0.3), p.268 | Fundamental-discriminant/genus-character boundary agrees. |

Flagged and delicate sources beyond the sample:

| Target / concern | Reading and mathematical disposition |
|---|---|
| §0.4 numerical margin | Replaced the dependency on an unspecified finite check by the rational certificate above. The proof only uses the θ bound already stated in §0.3. |
| §0.23 factorization | Read Kupers §14.1 pp.89–93 in full. Explicit good circles and strict genus exponent now appear. |
| §§0.31a–b effective endpoint | Read Bennett–Martin–O'Bryant–Rechnitzer Lemma6.3 pp.491–492 and Koukoulopoulos Lemma11.2 p.113, (12.11)–(12.12) p.124. Distinguish fixed-width derivative estimates from the shrinking near-one interval. |
| §1.5 weighted Hilbert | Read Montgomery–Vaughan's weighted separated-frequency formulation; singleton/empty sums use arbitrary positive spacing bounds, not a minimum of an empty set. The 3π/2 constant implies the retained 6π polynomial bound. |
| §2.9 Zaman 35/19 | Read thesis Thm1.3.1 pp.11–12 and proof §7.2 pp.159–169, especially Lemma7.2.3 pp.159–160, plus the repulsion/table input pp.139–152. Retained the four regimes, bandwise cutoffs and the actual numerical inequalities; a printed 40 was not silently substituted into a 35 claim. |
| §3.23 second moment | Simonič–Starichkova arXiv:2105.06821v3 (1) p.1, Thm2 p.4, divisor-transform input (25) and L1 pp.8–9, and §7 (101)–(102), (109) p.35. The 110√T log T estimate is sufficient and sourced. Its Bessel/Voronoi prerequisite remains a real gap, now explicit. |
| §3.24 fourth moment | Read Kösters arXiv:0803.1141v1 §3 pp.9–15 and Appendix A p.20; independently checked the divisor-correlation step and constants. Conrey p.1 fixes the same leading constant but only cites Heath-Brown for the strong error. The publisher's Ingham and Heath-Brown PDFs returned 403: neither original is represented as read. The replacement route needs neither original as its proof supplier. |
| §3.34 smooth limit | Read Hildebrand–Tenenbaum p.414; then supplied the terminal split and compact-u induction instead of claiming the introductory statement contains that proof. |

Also inspected the official public TIFR82 Ivić lectures, §4.6 pp.225–231 and notes p.239, while comparing fourth-moment routes. Its stronger route introduces additive-divisor/Kloosterman machinery, so it was not silently made a supplier. The library index was checked; no restricted or uncleared book was used. Source PDFs and extracted text stay out of the repository.

## Adversarial pass: every primary statement

Each row checks the target as stated with its standing hypotheses; a small input outside an asymptotic range is a negative control on a definition or proof step, not an asserted application of the asymptotic theorem there. Subsidiary targets are covered separately below. “Retained” means no further defect was found by these instances, not a claim of formal proof.

| Statement | Instances / normalization / denominator audit | Result and change |
| §0.1 Exceptional real zero | N=1, c=0, β=1 and the strict lower endpoint; principal versus nonprincipal | Retained explicit exclusions; Lean controls remain. |
| §0.2 Chebyshev sum in a residue class | q=1; x=1; θ(5;3,8)=log3; nonunit class 0 mod2 contains only2 | Retained inclusive cutoff and no built-in coprimality. |
| §0.3 Schoenfeld explicit Chebyshev bound | x>0 is essential at x=0 for a strict bound; θ below first prime | Retained positive domain. |
| §0.4 Prime powers do not erase the character-sum margin | k=2·10^10; compare exact error ratio to 367/8000000 | Replaced finite-check dependency by exact decreasing-ratio certificate. |
| §0.5 Rosser–Schoenfeld explicit prime-count bounds | Separate numerical validity thresholds from x=1 where log x=0 | Retained each source range; no all-x interpretation. |
| §0.6 Bounded-height Landau–Page theorem | Bounded conductor family, at most one exceptional primitive character; no existence conclusion | Retained height/conductor bounds. |
| §0.7 Quadratic real-zero separation from one | Q=3 and a zero outside the derivative interval; log Q>0 | Retained effective distance alternative. |
| §0.8 Weighted-prime sum input to the factorial estimate | Empty weighted-prime interval versus nonempty source range; both interval endpoints | Retained inclusive arithmetic conventions and threshold. |
| §0.9 Siegel's theorem | No near-one zero versus a fixed exceptional χ₁; χ=χ₁ is a finite exception | Retained ineffective constant and positive convolution coefficients. |
| §0.10 Prime-number input | Interval (x,3x] excludes its left endpoint; bounded x handled separately | Qualitative supplier is not re-planned. |
| §0.11 Mertens's first theorem and Σ_{p | N} log p/p = O(log log N) | N>1 and prime-power N; log log N may be negative for small N | Retained eventual big-O and finite initial absorption. |
| §0.12 Effective distance of a quadratic real zero from one | Imaginary quadratic w=6 and real regulator minimum; zero left of interval | Retained effective exponent 1/2, not an effective Siegel exponent. |
| §0.13 Exceptional quadratic squareclasses | D and D times a nonzero rational square; D=0; conductor at2 | Retained squareclass invariance, zero exclusion and conductor dictionary. |
| §0.14 Pole-cancelled Riemann xi | s=0,1; pole-cancelled endpoint value 1/2; functional reflection | Retained canonical entire extension. |
| §0.15 Elementary canonical factors of every genus | genus0; z=0; factor at its zero and log-series radius<1 | Retained actual polynomial/exponential body and every genus. |
| §0.16 Mod-eight prime mass | Mod8 classes3 and5 versus even primes; mass on a half interval | Retained separate residue masses and positive margin. |
| §0.17 Two-real-zero inequality | Distinct primitive real characters; β at strict boundary; no division by zero | Retained Proposition7.1 hypotheses. |
| §0.18 Effective character prime-number estimate | Principal character separately; small conductor; possible exceptional term | Retained explicit ranges and exceptional alternative. |
| §0.19 Explicit reciprocal-prime estimate | Prime p at upper inclusive cutoff; loglog domain requires eventual x | Retained stated explicit threshold. |
| §0.20 Weighted prime sum on an interval | Equal interval endpoints give an empty sum; endpoint prime inclusion | Retained partial-summation endpoint terms. |
| §0.21 Mertens's second theorem: the reciprocal-prime sum | Lower cutoff below2 and upper prime endpoint; fixed compact logarithmic interval | Retained additive Mertens constant and usable O(1/log x) remainder. |
| §0.22 Origin-zero adapter for Hadamard factorization | Nonzero constant gives origin multiplicity0; z^m gives exactly m | Retained nonzero-entire hypothesis and removable quotient. |
| §0.23 Finite-order Hadamard factorization | Noninteger order below n+1; zero function excluded; genus integer boundary | Added good-circle milestone and strict auxiliary exponent. |
| §0.24 Repulsion of exceptional conductors | Same versus distinct exceptional conductor; enlarged width preserves membership | Retained distinctness and conductor repulsion ranges. |
| §0.25 Explicit prime Euler-product bound | Empty prime product=1; p=2 local factor; product direction | Retained positive finite Euler factors. |
| §0.26 Mertens's third theorem: the Euler product | Inverse product versus product; leading constant e^γ rather than e^(−γ) | Retained normalization with verified source. |
| §0.27 Landau repulsion for exceptional squareclasses | Same quadratic squareclass has same primitive character; zero discriminant excluded | Retained distinct-squareclass hypothesis. |
| §0.28 Quadratic prime-character interval estimate | Quadratic χ²=1; prime dividing conductor has χ(p)=0 | Retained primitive dictionary and interval error normalization. |
| §0.29 Strict derivative positivity requires nonpolynomiality | Constant/polynomial counterexample; cosh-type paired imaginary zeros | Retained nonpolynomiality and parity conditions for strict derivatives. |
| §0.30 Rational Dirichlet-to-ray-class dictionary | Conductor reduction Q(−1)=4,Q(2)=8; quartic character at2=i tests reciprocity direction | Retained arithmetic Frobenius and inversion witness. |
| §0.31 Mertens product input | κ=γ normalization; Q=3; principal character excluded from derivative estimate | Corrected source proof pages; retained both derivative widths. |
| §0.32 Siegel–Walfisz theorem | q=1; q≤(log x)^B with B fixed; exceptional conductor alternative | Retained uniform modulus and error quantifiers. |
| §0.33 Zero-free zeta strip and logarithmic bounds | Pole at1 requires regularization; bounded t distinct from high-height strip | Retained meromorphic-germ and log-branch distinctions. |
| §1.1 Reciprocal zeta on the line one | s=1 has a pole, so reciprocal extends by zero rather than pointwise quotient logic | Retained right-line nonvanishing/reciprocal interpretation. |
| §1.2 Davenport uniform Möbius exponential cancellation | Frequency0 and rational/irrational α; supremum uniform in α | Retained full major/minor-arc proof adapter. |
| §1.3 Admissible Weil test function | e^(−a|x|) has BV derivative and cusp at0; a>1/2 for decay | Retained BV test class, not falsely C¹ everywhere. |
| §1.4 Half-interval explicit formula and low-zero-safe bound | k≥4; K_k(0)=log2; near-real low zero uses min(1,1/|ρ|) | Retained removable kernel and half-endpoint terms. |
| §1.5 Mean square of a Dirichlet polynomial | N=0 or1; T=0; two frequencies0,1 with coefficients1,i give Hilbert sum2i | Retained spacing hypotheses and 3π/2,6π constants. |
| §1.6 Riemann and generalized Riemann hypotheses as statements | Principal pole excluded; zeros at Re≤0 excluded; hypothetical zero at Re=3/4 refutes GRH | Retained conditional predicates without asserting truth. |
| §1.7 Selberg zero-density input | Empty low-height zero set; multiplicities; modulus versus primitive conductor | Retained density ranges and zero multiplicities. |
| §1.8 Weil's explicit formula (Mestre's formalism) | Even decaying test; zero multiplicities; archimedean real/complex factors | Retained Mestre normalization after source check. |
| §1.9 Prime error terms under RH and GRH | q=1 and nonunit residue; ε>0; conditional RH/GRH only | Retained unit-class and positive-power-loss hypotheses. |
| §2.1 Nielsen cores and their oriented boundary maps | D=28 periods(3,6) and(3,3,2,2,2) give areas2π and5π; log-y rectangle gives1/4 | Updated planar supplier; orientation/multiplicity and full norm-one units retained. |
| §2.2 Artin analytic conductor normalization | Dimension0 gives1; trivial rep over ℚ(i) gives4 analytically; χ₋₄ conductor4 | Removed duplicate finite theory; kept analytic normalization and added controls. |
| §2.3 Hecke series and Tate integral comparison | Unramified place with nontrivial different contributes N(d_v)^(−1/2) | Retained Tate measures, finite bad set and real-part convergence range. |
| §2.4 Hecke boundary adapter for Landau positivity | Trivial ray character permits pole at1; regular order0 means nonvanishing | Retained Landau pole-order alternative. |
| §2.5 Dedekind continuation and real-side comparison | Rational field degree1; real-side limit at1; junk point values do not define continuation | Retained canonical Tate continuation and finite normalization factors. |
| §2.6 Sufficient conductor-discriminant estimate | Normal closure of bounded-degree field versus arbitrary larger Galois field | Corrected conductor supplier attribution; retained actual normal-closure budget. |
| §2.7 Quadratic zeta factorization and the residue quotient | Split/inert/ramified quadratic Euler factors; positive residue quotient | Retained the ramified factor and canonical continuation. |
| §2.8 Partial ideal zeta series | Class of ℚ recovers ζ; norm0 coefficient0; sum over all ordinary classes | Retained actual nonzero-ideal fibres; narrow classes are separate. |
| §2.9 Lemma 4.4 (Zaman's effective lower bound for prime ideals) | Trivial G and D=1 separate; β₁ absent/present; ten nonmonotone R_j cutoffs | Retained 35/19 four-case certificate and real-zero repulsion ranges. |
| §2.10 Imaginary quadratic genus-character classification | D=−15 genus characters at a norm2 ideal both−1; ideals prime to D | Retained discriminant/sign/genus dictionary. |
| §2.11 Artin local polynomial | Zero-dimensional polynomial1; unramified line1−T; cyclic degree-f permutation1−T^f | Retained determinant on inertia invariants and arithmetic Frobenius. |
| §2.12 Primitive Hecke functional-equation normalization | Conductor1 trivial character has poles; imaginary quadratic odd parity | Retained archimedean and finite-conductor factors. |
| §2.13 Ideal-character Hecke L-function | Trivial class character gives ζ; missing bad Euler factors distinguished | Retained unitary finite-order presentation and canonical germ. |
| §2.14 Siegel lower bound for real quadratic class number times regulator | Real quadratic regulator, norm−1 unit dichotomy, discriminant>1 | Retained hR quantity and ineffective constants. |
| §2.15 Siegel lower bound for imaginary quadratic class numbers | D=−3,−4 have extra roots of unity; h=1 | Retained correct w factor and eventual lower bound. |
| §2.16 Explicit residue bound for Dedekind zeta functions (Louboutin) | Degree1 excluded; imaginary-quadratic alternative separated; 6·0.329²<1 | Corrected Mellin prerequisites; retained exceptional ranges. |
| §2.17 Imaginary quadratic completion and root number | D=−4 standard completion at0,1 equals1; DIT equals√π/2 | Retained root number1 and two distinct completions. |
| §2.18 Imaginary quadratic class-number value at one | χ₋₄: L(1)=π/4; h=1,w=4 | Retained canonical endpoint and class-number constant. |
| §2.19 Artin Euler series | Zero rep series1; direct sum product; regular rep ζ_L | Retained higher-rank coefficients rather than a multiplicative degree-one carrier. |
| §2.20 Negative even zeros of the continuation | Negative even integer; vanishing order r₁+r₂; rational field gives simple zero | Retained positive integer index and gamma-pole count. |
| §2.21 Canonical ray-character comparison and the quadratic endpoint | Nonreal character uses conjugate; quadratic ζ(s)/ζ(2s) auxiliary has nonnegative coefficients | Retained separate quadratic endpoint argument and canonical ray comparison. |
| §2.22 Explicit degree-uniform Hecke convexity | Trivial-character pole cleared before full-circle Cauchy; degree dependence explicit | Retained degree-uniform conductor-height bound. |
| §2.23 Logarithmic functional equation at zero and one | CM relative quadratic character from reciprocity; ℓ₀+ℓ₁=−logQ+g(γ+log2π) | Removed repeated setup; retained gamma/parity sign. |
| §2.24 Hecke CM partial-zeta identity | D=−4 half-unit ω=2; D=−3 half-unit ω=3 | Retained the period convention rather than full w. |
| §2.25 Hecke positive-sign real quadratic formula | Positive-sign real quadratic period; full norm-one unit length2log ε | Retained sign, orientation and narrow-class conventions. |
| §2.26 Genus Hecke factorization | Trivial genus factor separated; finite class-character expansion | Retained both fundamental discriminants and their signs. |
| §2.27 Hecke negative-sign real quadratic formula | Negative-sign genus character reverses the oriented boundary period | Retained core rather than unweighted projected geodesic image. |
| §2.28 Imaginary quadratic class-number value at zero | D=−4 endpoint L(0)=1/2; D=−3 endpoint1/3 | Retained w and odd-parity endpoint conversion. |
| §2.29 Global meromorphic Artin continuation | Signed integral Brauer coefficients, not only nonnegative/rational combinations | Retained meromorphic continuation rather than Artin entire claim. |
| §2.30 Imprimitive Hecke deleted factors | Deleting one Euler factor rescales simple-pole residue; log-derivative pole coefficient stays1 | Retained both distinct endpoint effects. |
| §2.31 Sign of the quadratic Gauss sum from the Dedekind functional equation | χ₋₄ Gauss sum2i and root number1; conductor1 permitted | Retained root-number sign and conductor parity. |
| §2.32 Artin continuation near the line one | m=1 root gluing; nonzero disc; trivial representation has simple pole | Retained pole-free disc and overlap hypotheses. |
| §2.33 Bounded-degree Brauer-Siegel | Fixed n=1 gives ℚ; ε>0; n held fixed before constants | Retained two-sided hR bound without variable-degree uniformity. |
| §2.34 Two-sided subpolynomial values at one | Nontrivial odd irreducible, normal closure |G|≤(2g)!; endpoint poles cancel | Retained separate reciprocal endpoint estimate. |
| §2.35 A fixed small circle gives a subpolynomial derivative | Full small Cauchy circle, not two real intervals; denominator nonzero at1 | Kept fixed-degree family and canonical relative character. |
| §2.36 Theorem3 negative factors | Negative-factor genus period; projection can overlap/retrace | Retained signed core area comparison. |
| §2.37 Theorem3 positive factors | Positive-factor geodesic period; norm−1 unit does not halve full norm-one length silently | Retained full unit convention. |
| §2.38 Theorem3 CM factors | Mixed-sign CM genus factor; ω at D=−3,−4 | Retained CM endpoint/gamma factors. |
| §2.39 Ray-class L-function zero-density estimate | Ray modulus versus primitive conductor; zero multiplicity and height bounds | Retained density parameter ranges. |
| §2.40 Heilbronn's theorem on real zeros of Dedekind zeta functions | Simple real zero gives linear character; virtual multiplicities can be negative; trivial G empty augmentation | Retained Heilbronn/Aramata distinction from Artin conjecture. |
| §2.41 Eisenstein series at a CM point equals a partial zeta function | CM point for D=−4; isotropy half-unit factor | Retained canonical Eisenstein parameter and partial-zeta normalization. |
| §2.42 Artin holomorphy as a hypothesis | Trivial irreducible excluded from entire Artin predicate; zero rep factor1 | Retained as hypothesis, not theorem. |
| §2.43 Extended Riemann hypothesis for Dedekind and Hecke L-functions | Dedekind trivial zeros at Re≤0; Hecke trivial pole excluded | Retained separate conditional field and character predicates. |
| §2.44 Explicit exceptional-zero region for an abelian character product | Product includes trivial character/pole; one possible exceptional real zero | Retained abelian product rather than factorwise false zero-free claim. |
| §2.45 Logarithmic functional equation | Arithmetic conductor includes base discriminant; odd CM parity at each real place | Retained gamma-sign and logarithmic identity. |
| §2.46 Factorwise logarithmic derivative at one | Σn_jδ_j=0 for nontrivial irreducible; individual Hecke poles regularized | Retained signed sum of H′/H with uniform conductor budget. |
| §2.47 Uniform subpolynomial Dedekind residues | Fixed degree; κ_ℚ=1; ineffective lower versus effective upper | Retained uniform subpower exponents. |
| §2.48 Eisenstein Weyl sums bounded by Dirichlet L-values | CM discriminant sign; DIT versus standard completion factor for odd character | Retained L-value rather than incorrectly normalized completed value. |
| §2.49 Many split primes outside a small quadratic exception set | Finite exceptional squareclasses removed; ramified primes have χ(p)=0 | Retained quantitative interval/range and split-prime interpretation. |
| §2.50 Effective Chebotarev density theorem | D=1 separated before logD; possible Li(x^β₀) retained; GRH part conditional | Retained three distinct error/range alternatives. |
| §2.51 Two-sided quadratic Hecke value bound | Quadratic endpoint equals κ_E/κ_F>0; Q=D_E/D_F | Removed repeated setup; retained both subpower directions. |
| §2.52 Subpolynomial logarithmic derivative at one | Canonical relative η; full-circle derivative plus separate positive reciprocal | Removed repeated setup; retained logarithmic derivative bound. |
| §3.1 Explicit divisor subpower bound | ε>0,n>0; n=1 givesτ=1; local constant≥1 | Retained actual uniform constant and prime-power factors. |
| §3.2 Largest prime factor of a quadratic conductor | Fundamental discriminant at2; no largest-prime assertion about1 without convention | Retained conductor/squareclass comparison. |
| §3.3 Uniform coefficient bound by a divisor function | Unit ideal coefficient1; norm0 coefficient0; split prime maximizes degree bound | Retained fixed-degree divisor majorant. |
| §3.4 Subpolynomial fixed-order divisor function | n=1,a=0 binomial coefficient1; order fixed | Retained positive n and subpower quantifiers. |
| §3.5 Products of distinct medium primes | m=0 gives{1}; interval[x/2,x] includes endpoints; products unordered/distinct | Retained empty-product and uniqueness conventions. |
| §3.6 Inverse-totient counting input | φ(1)=1, φ(2)=1; inverse values counted by n, not image multiplicity | Retained complete elementary O(x) proof requirement. |
| §3.7 Maximal-order divisor upper bound | Small-prime cutoff and n=1 below loglog range; limsup only as n→∞ | Retained small/large prime split and coefficient log2. |
| §3.8 Even von Mangoldt function | Λ(−n)=Λ(n), Λ(0)=Λ(±1)=0; ±prime powers | Retained even extension and no spurious zero term. |
| §3.9 Coprime Möbius sums weighted by log t/t | q=1; q≤T^(1/4) ensures T/q≥√T; empty bounded initial intervals | Retained modulus/truncation ranges. |
| §3.10 Gamma Euler-product truncation | Euler factor at parameter0 equals1; arbitrary retained infinite prime subset | Retained local binomial bounds and logarithm summability. |
| §3.11 Size of 1/φ(n) and of the divisor function (3.7) | n=1 separate from loglog n; φ(1)=τ(1)=1 | Retained eventual domains and constants. |
| §3.12 Coprime Möbius sums weighted by 1/t | q=1 and q≤T^(1/4); local branch at exponent0,−1 | Retained all-order compact transfer and coprimality. |
| §3.13 Landau–Ramanujan count of sums of two squares | Counts at K=1,3,5 are1,2,4; 9 allowed with even inert exponent | Retained unrestricted prime powers and C_L=1/√2 times product. |
| §3.14 Landau upper bound for shifted Eisenstein norms | k=1,2 allowed,3 excluded,4 allowed via(3,1),5 via(4,0) | Retained Eisenstein rather than Gaussian criterion and C_E. |
| §3.15 Elementary shifted-square count | K=3,4,5,13 give0,1,2,4; square witness0 at k=4 | Retained exact integer count and real-floor adapter. |
| §3.16 Counts supported on half the reduced prime classes | M=1,2 cannot satisfy2#R=φ(M); a outside generated H has count0 | Retained full integer half-cardinality and repeated allowed primes. |
| §3.17 Logarithmic weight of prime divisors | N=1 empty prime-divisor sum; p divides N once or many times | Retained distinct-prime rather than valuation weight. |
| §3.18 Pretentious distance | D(1,1)=0; D(1,−1)²=2Σ1/p; D(0,0;2)²=1/2 | Added nonzero self-distance control; primewise Lean hypotheses fixed. |
| §3.19 Logarithmic-derivative coefficient class | f(1)=1, f(0)=0; exponential Euler series nonzero; μ has coefficients−Λ | Retained logarithmic rather than raw coefficient bound. |
| §3.20 Smooth-number counting function | Ψ(8,2)=4, Ψ(6,3)=5, Ψ(0,2)=0; 1 counted for x≥1 | Fixed unit API domain and added zero-cutoff Lean example. |
| §3.21 Dickman function | ρ=0 for u<0,1 on[0,1]; ρ(2)=1−log2; derivative jumps at1 | Retained delay equation only on stated smooth intervals. |
| §3.22 Dirichlet divisor average | Perfect square cutoff retains diagonal correction; N=1 harmonic remainder positive | Retained exact hyperbola identity. |
| §3.23 Second moment of zeta | T≥10^30 gives sufficient 110√TlogT; generic polynomial mean square cannot supply Voronoi | Explicit remaining gap; theorem statement itself verified. |
| §3.24 Fourth moment of zeta | A cutoff t/2π; squared-divisor coefficient1/π²; doubling diagonal gives1/(2π²) | Replaced proof route; diagonal, off-diagonal and oscillatory errors quantified. |
| §3.25 Beurling prime system | Repeated primes2,2 give prime count2 and N(2)=3; index multiplicity essential | Retained finite-support exponent vectors and p_j→∞. |
| §3.26 Uniform divisor subpower bound | n=1; ε>0; abstract real ε gives existence, not executable computation | Retained effective-presented versus arbitrary-real distinction. |
| §3.27 Uniform bounded-norm ideal count | Norm1 unit ideal; norm0 empty; degree fixed | Retained actual ideal fibres and uniform degree bound. |
| §3.28 Cardinality of medium-prime products | m=0 count1; N₁(4)=2 from primes2,3; m exceeds available primes gives0 | Retained binomial and unique-factorization count. |
| §3.29 Truncated von Mangoldt function | Λ₂(0)=log2; z<1; integer sign symmetry | Retained truncated divisor sum, including zero. |
| §3.30 Shifted coprime Möbius sum | q=1; shifted endpoint and q≤T^(1/4) | Retained uniform coprime Möbius estimate and floor remainder. |
| §3.31 Asymptotic count of the three exceptional families | Union at13 has8 values; norm-family intersection subleading; shifted squares O(√K) | Retained inclusion–exclusion and positive leading constants. |
| §3.32 Restricted squarefree Landau asymptotic | D(2)={1}; D(14)={1,2,5,10,13}; 4,9 excluded | Retained strict cutoff and p=2 factor1+2^(−s). |
| §3.33 Pretentious Halász mean bound | f=1 has M=0; multiplicative need not completely multiplicative; squarefull correction | Retained convolution tail and height split. |
| §3.34 Dickman fixed-u asymptotic | u≤1 gives floor x/x; u=2 gives1−log2; terminal p close to x | Added compact-u induction, prime rescaling and endpoint limit order. |
| §3.35 Rankin smooth-number upper bound | σ>0 includes σ≤1; x=y=2 finite sum3/2 versus full product2 | Retained upper bound rather than false finite-sum equality. |
| §3.36 Zeta function of an indexed Beurling system | Indexed repeated primes; p_j→∞ alone does not imply convergence for every σ>1 | Retained separate summability and actual holomorphic Euler product. |
| §3.37 Shiu bound for the Halász coefficient class | q=1 and unit residue; x^ε≤z≤x,q≤z^(1−ε) | Retained all progression and short-interval hypotheses. |
| §3.38 Eventual unit-constant divisor bound | Absorb a fixed C by n^(ε/2), not at n=1 | Retained eventual threshold. |
| §3.39 Von Mangoldt truncation error | E₂(0)=−log2; n≠0,z≥|n| gives0; zero handled separately | Retained exact zero formula and two-sided errors. |
| §3.40 Wintner-type mean over prime divisors | a=1∗g; f(2)=1/2 gives mean1.25 in single-prime test | Retained absolute square-root summability and integrated error. |
| §3.41 Restricted squarefree Sathe–Selberg bounds | r=0 excluded; r=1 leading N/(2logN); at14 counts3 and1 for r=1,2 | Retained fixed-A full range and high-order remainder. |
| §3.42 Beurling PNT with all logarithmic remainders | ζ_P=ζ² gives N~xlogx, not ax; all derivative orders and β_n/n→0 | Retained strong smooth-boundary pair, not ordinary Wiener–Ikehara alone. |
| §3.43 Mangoldt weight in a Fourier window | T≥1,m≥T²; prime powers near m; angular support[−2,2] | Retained triangular Fourier normalization π(2−|u|). |
| §3.44 Uniform cancellation of the truncation error E_z (Corollary 3.3) | z=0; n=0 contributes explicit logarithm; n outside truncation | Retained zero term and absolute-value convention. |
| §3.45 Halász integral mean bound | κ fixed, Λ coefficient not Λ²; empty prime interval | Retained weighted Plancherel mean input log^(κ+1) before final log^κ. |

## Subsidiary statements and new proof milestones

These 62 rows supplement, rather than replace, the primary-target checks.

| Statement | Instances / proof-interface check | Result |
|---|---|---|
| §0.23a Higher derivatives of the Gamma remainder. | j=1 and j=2; nonpositive real cut excludes Gamma poles; differentiate only a normally dominated integral. | Retained with stated hypotheses. |
| §0.29a Pairing imaginary zeros. | Origin multiplicity m and pairs ±iλ; λ>0; nonpolynomiality supplies infinitely many occurrences. | Retained with stated hypotheses. |
| §0.29b Nonnegative coefficients of the paired product. | Finite products have nonnegative even coefficients; odd coefficients vanish; parity shift by z^m retained. | Retained with stated hypotheses. |
| §0.30a Conductor-uniform rational logarithmic-derivative adapter. | q=3 and high-height strips; primitive conductor, not arbitrary modulus, controls the zero divisor. | Retained with stated hypotheses. |
| §0.31a Near-one Dirichlet derivative bounds. | q=3; σ=1 and σ=1−1/logq; fixed-width version carries its extra conductor power. | Retained with stated hypotheses. |
| §0.31b Quadratic zero separation from an L-value. | β outside the shrinking interval uses 1/logq instead of an invalid derivative bound; L(1,χ)>0. | Retained with stated hypotheses. |
| §1.2a Uniform Möbius major/minor arcs. | Major arcs q small use Siegel–Walfisz; complementary q range uses a bilinear estimate; choices D,C fixed after A. | Retained with stated hypotheses. |
| §1.4a Primitive-character subtracted Perron contour. | s=0 is removable with value log2; integer endpoint receives half weight; q≥3 and k≥4. | Retained with stated hypotheses. |
| §1.4b Bounded right-edge logarithmic derivative. | Re s=2 absolutely convergent Λ-series; vertical height unrestricted; no pole at1 in the domain. | Retained with stated hypotheses. |
| §1.4c Low-zero-safe interval kernel. | ρ→0 gives bounded log2 kernel; the large-|ρ| and integral bounds yield the stated minimum. | Retained with stated hypotheses. |
| §1.4d Logarithmic-square sum of zero weights. | Primitive conductor1 uses zeta; low zeros have weight≤1 and multiplicities; T≥2. | Retained with stated hypotheses. |
| §1.5a Weighted finite Hilbert inequality. | Empty/singleton family has sum0; positive lower spacing bound avoids undefined nearest-neighbour minimum. | Retained with stated hypotheses. |
| §2.9a The exact 35/19 prime-ideal adapter. | All four β₁ regimes; ten height bands; 24·0.6881<16.6 and the 33.23/33.24 margin are not rounded in the wrong direction. | Retained with stated hypotheses. |
| §2.16a Positive Mellin comparison with the sharp residue constant. | d=1 excluded; (r₁,r₂)=(0,1),D=3 uses endpoint3, not false g(6)≤1; positivity retains e/2. | Corrected supplier chain. |
| §2.17a Dedekind completed-functional-equation comparison. | For ℚ, Γ_R(s) and pole at1; complex place Γ_C(s)=2(2π)^−sΓ(s) retained. | Retained with stated hypotheses. |
| §2.18a Quadratic Hecke value as residue quotient. | Quadratic extension gives κ_E/κ_F>0; rational base κ_ℚ=1; canonical germ equality before endpoints. | Retained with stated hypotheses. |
| §2.21a Ray-class product has no boundary zeros. | Trivial ray character contributes one simple pole; total product logarithmic coefficients nonnegative. | Retained with stated hypotheses. |
| §2.21b Nonnegative ray-character logarithmic coefficients. | Prime powers with class identity give full character sum; other classes give0; ramified primes omitted. | Retained with stated hypotheses. |
| §2.21c Nonreal Hecke characters are nonzero at one. | χ distinct from its conjugate permits paired positivity; real character case is not inferred from this argument. | Retained with stated hypotheses. |
| §2.21d Positive quadratic auxiliary Euler factors. | χ(p)=±1,0 each gives nonnegative local coefficients for the actual quadratic auxiliary product. | Retained with stated hypotheses. |
| §2.21e Auxiliary holomorphy under vanishing at one. | A hypothetical quadratic zero at1 cancels the only possible pole; other points already holomorphic. | Retained with stated hypotheses. |
| §2.21f Landau contradiction for a quadratic character. | Nonnegative coefficients with f(1)>0 force the Landau singularity, contradicting the auxiliary holomorphy. | Retained with stated hypotheses. |
| §2.29a Absolute convergence of Artin factors. | Eigenvalues on inertia invariants are roots of unity; dimension0 has local factor1; σ>1 gives convergence. | Retained with stated hypotheses. |
| §2.29b Induction identity including ramification. | Ramified and unramified decomposition orbits both retained; induction determinant accounts for residue degree. | Retained with stated hypotheses. |
| §2.29c Linear Artin factors are Hecke factors. | Arithmetic reciprocity at an unramified uniformizer; ramified linear inertia invariants may be0. | Retained with stated hypotheses. |
| §2.29d Uniform finite Artin factor bound. | Dimension0 bound1; |α|=1 gives |1−αq^−s|≥1−q^−σ>0. | Retained with stated hypotheses. |
| §2.29e Ramified local Artin induction identity. | A relative Frobenius f-cycle gives 1−αT^f, fixing exponent and determinant sign. | Retained with stated hypotheses. |
| §2.32a Gluing m-th roots across the line Re s = 1. | m=1; nonzero analytic root; overlapping boundary discs normalized from their right-half-plane values. | Retained with stated hypotheses. |
| §2.32b Direct sums of Artin local factors. | Zero summand has polynomial1; determinant block sum becomes product; no sign ambiguity. | Retained with stated hypotheses. |
| §2.32c Analytic root on a nonvanishing disc. | Disc simply connected and function nonzero; choice of initial root necessary for uniqueness. | Retained with stated hypotheses. |
| §2.32d Overlaps of boundary-centred discs. | Intersecting discs centered on Re=1 have a connected overlap meeting Re>1; identity theorem applies. | Retained with stated hypotheses. |
| §2.32e Normal-closure discriminants and conductor budgets. | Actual normal closure has |G|≤(2g)!; D_L≤D_E^m and analytic conductor includes base discriminant. | Retained with stated hypotheses. |
| §2.32f Fixed-degree residue lower bound, including nonnormal fields. | Nonnormal fields use normal closure and quotient residues; simple near-one zero comes from quadratic subfield. | Retained with stated hypotheses. |
| §2.32g Uniform regularized finite-order Hecke endpoints. | Trivial ψ has δ=1, nontrivial ψ δ=0; Σn_jδ_j=0; Cauchy does not replace reciprocal lower bound. | Retained with stated hypotheses. |
| §2.40a Positive cyclic decomposition of the augmentation character. | Trivial group has empty augmentation; signed rational character decomposition is not termwise positivity. | Retained with stated hypotheses. |
| §2.40b Aramata entire quotient. | ζ_L/ζ_F is entire for Galois L/F without assuming every irreducible Artin factor entire. | Retained with stated hypotheses. |
| §3.1a Uniform prime-power divisor bound. | Prime exponent0 gives1; optimize over exponent before taking a finite bad-prime product. | Retained with stated hypotheses. |
| §3.1b Large-prime divisor factor bound. | p above threshold makes (a+1)≤p^(εa); a=0 retained. | Retained with stated hypotheses. |
| §3.1c Divisor bounds from local factors. | n=1 empty product; n=0 excluded; multiply local bounds using unique factorization. | Retained with stated hypotheses. |
| §3.7a Small-prime divisor logarithm. | Finite set of small primes; log(a+1) bound with positive exponents; no loglog at n=1. | Retained with stated hypotheses. |
| §3.7b Large-prime divisor logarithm. | Large prime p has logp bounded below; sum valuations controlled by log n. | Retained with stated hypotheses. |
| §3.7c Vanishing small-prime contribution. | Fix cutoff parameter before n→∞, then send parameter to its limit; no reversed uniformity. | Retained with stated hypotheses. |
| §3.12a Compact-parameter multiplicative transfer. | Complex singular parameter α=0,−1 uses entire 1/Γ; all truncation orders and uniform compact derivatives retained. | Retained with stated hypotheses. |
| §3.12b Eisenstein norm criterion. | Inert2 odd exponent fails; ramified3 represented; split primes use proper gcd; Euclidean rounding norm≤3/4. | Retained with stated hypotheses. |
| §3.18a Triangle inequality for pretentious products. | Disc-valued prime data only; zero functions allowed; real square root requires nonnegative radicand. | Retained with stated hypotheses. |
| §3.18b Squared pretentious-distance formula. | Primewise Re(f·conj g)≤1; x<2 empty sum; D(0,0;2)²=1/2. | Retained with stated hypotheses. |
| §3.18c Unit-disc product distance inequality. | All four unit-disc points; endpoints ±1 and0; local nonnegative quadratic bound feeds ℓ² triangle. | Retained with stated hypotheses. |
| §3.22a Harmonic sum remainder. | N=1: 0<1−γ<log2≤1; positive N makes denominators nonzero. | Retained with stated hypotheses. |
| §3.22b Divisor hyperbola identity. | x=1 and x=4 retain M² overlap correction; positive integer divisor pairs only. | Retained with stated hypotheses. |
| §3.28a Distinct-product cardinality. | m=0 count1; too few primes gives0; unordered products and squarefreeness make map injective. | Retained with stated hypotheses. |
| §3.31a Shifted norm intersection sieve. | m=0 boundary separated; p=2,3 treated separately; local densities for other primes give dimension1. | Retained with stated hypotheses. |
| §3.34a Largest-prime-factor smooth decomposition. | Largest prime of1 absent; every n>1 assigned once; prime powers stay in Ψ(x/p,p). | Retained with stated hypotheses. |
| §3.35a Finite-prime smooth Dirichlet series. | Finite prime set, σ>0; empty set product1; full geometric series counts all exponents. | Retained with stated hypotheses. |
| §3.36a Beurling counting growth from summability. | Repeated generalized integers counted separately; convergence at σ bounds N(x) by ζ_P(σ)x^σ. | Retained with stated hypotheses. |
| §3.36b Rough progression sieve with its remainder. | q=1 endpoint retained; unit progression and q≤z^(1−ε) control finite remainder. | Retained with stated hypotheses. |
| §3.38a Absorption of the divisor-bound constant. | Use ε/2 with C fixed, then n≥C^(2/ε); eventual rather than all-n unit constant. | Retained with stated hypotheses. |
| §3.40a Integrated prime-divisor mean. | T=1 integral0 on count side; floor endpoint has measure0; initial [0,1] contribution bounded. | Retained with stated hypotheses. |
| §3.42a Smooth Laplace boundary and one-sided remainder. | All derivative orders with β_n/n→0; one-sided bump and monotonicity prevent false two-sided pointwise inference. | Retained with stated hypotheses. |
| §3.42b Beurling zeta and Euler product. | Local finite Euler factors first; indexed multiplicities and locally uniform convergence before logarithmic differentiation. | Retained with stated hypotheses. |
| §3.42c Beurling higher-prime-power correction. | Prime squares dominate high powers; each fixed σ>1 summability input remains explicit. | Retained with stated hypotheses. |
| §3.44a Two-sided error and the zero term. | n=0 exact E_z(0) retained; n<0 uses even extension; z≥|n| nonzero input makes error0. | Retained with stated hypotheses. |
| §3.45a Prime-weighted Dirichlet-polynomial mean bound. | Λ-weighted coefficients rather than Λ²; T≥1 and specified integration range; log-power retained. | Retained with stated hypotheses. |

The new §3.24 auxiliaries were also checked: at t≥2 the moving cutoff has no negative indices; the squared-divisor Dirichlet series has leading coefficient 1/(3!ζ(2))=1/π², and Abel summation contributes the factor1/4. For the off-diagonal sum, n≥2m is bounded using the divisor average. On comparable dyadic blocks the denominator is bounded below by a constant times h=n−m; the CRT solution count has main term proportional to gcd(a,b)/(ab) and O(1) per divisor pair, giving the stated Y log²Y·Σ_(d|h)1/d+Y bound. Summing in h with weight1/h gives O(Y log³Y). The oscillatory estimates require λ>0 and the stated derivative monotonicity; integration by parts and splitting at a derivative threshold give absolute constants. The S² diagonal is O(√T log⁴T), absorbed by O(T log³T) eventually. The approximate-equation error integrates to that latter scale by Cauchy–Schwarz. These are roadmap targets/proof routes, not claims of existing Lean implementations.

The new §3.34 compact-limit adapter was checked for 0<a≤U, including crossing u=1. On the nonterminal prime range the recursive parameter lies in [η/(1−η),U−1] and the base variable tends uniformly to infinity. The terminal mass is at most −log(1−η)+o(1), using Q≤1. The limiting integral is the Dickman integral after v=1/t−1. Constants depend on the fixed compact interval. The proof does not exchange the two limiting operations or assert a growing-u range.

## Definition tests, conventions and Lean comparisons

The definition audit includes the formal predicates and light definitions, plus the prose-defined canonical factors/origin adapter/paired products, Weil test functions, ray/quadratic dictionaries, Nielsen cores, partial zetas, analytic conductors, local polynomials and Artin series, medium-prime products, even/truncated Mangoldt and its error, prime-data distance, logarithmic coefficient class, smooth counts, Dickman function, Beurling carriers/norms/counts/series, gamma factors and residue-supported/squarefree counts. Their APIs and ≥3 discriminating tests are in the corresponding target or its shared Checks block. Inline test groups, such as the squarefree family and gamma-product truncation, were included. No vacuous test was substituted for a computed endpoint, agreement, or non-example. Finite ramification conductors are now supplier-owned; their old normalization tests remain useful consumption tests.

Every convention was tested where it is consumed: strict/inclusive prime and smooth cutoffs; totalized pole values versus germs; arithmetic Frobenius and ray reciprocity direction; inertia invariants; ordinary/narrow classes; full norm-one units; DIT versus standard odd completion; root number and determinant signs; angular Fourier support; prime-index multiplicity; and fixed parameters before asymptotic limits. Modulus/logarithm denominators use positive/nontrivial conductors, unit classes where asymptotics need them, and separate D=1 or low-height cases. The primary/subsidiary tables record the actual witnesses.

Ten signature comparisons against the README, in addition to reading the full Suggested.lean:

| Lean declaration | README contract checked | Result |
|---|---|---|
| `thetaAP` / `thetaAP_one` | §0.2 inclusive p≤x, q=1 and arbitrary residues | Nat floor and prime filter match; q=0 is permitted for the definition, not an asymptotic modulus. |
| `IsExceptionalRealZero` | §0.1 positive c, N>1, primitive/nonprincipal/quadratic and strict interval | Every conjunction is present; conductor-one and width-zero controls retained. |
| `riemannXi` | §0.14 pole-cancelled entire ξ and endpoint convention | Real-bodied light definition uses pinned completed zeta, with no sorry carrier. |
| `DirichletGRH` / `GRH` | §1.6 individual and universal predicates | Re>0, principal pole exclusion and universal modulus quantification match. |
| `psiAP_isBigO_of_dirichletGRH` | §1.9 fixed positive q, unit a, ε>0 | All hypotheses and φ(q) main term present. |
| `dirichlet_polynomial_mean_square` | §1.5 interval [−T,T], T≥0, inclusive n=1..N | 2T diagonal and 6π weighted error match, including N=0. |
| `weighted_hilbert_inequality` | §1.5a arbitrary finite separated frequencies | Positive lower spacing bounds make singleton case meaningful; coefficient conjugation matches 2i control. |
| `partialIdealZeta` / `sum_partialIdealZeta` | §2.8 ordinary class, nonzero integral ideals and norm fibres | Uses actual class group/ideals, Re s>1 for sum; narrow version stays a README target. |
| `pretentiousDist_mul_le` | §3.18 prime-data multiplicative triangle | Corrected norm bounds to prime arguments only; no false zero self-distance axiom. |
| `smoothCount` / `smoothCount_eq` | §3.20 inclusive largest-prime bound and strict-cutoff library adapter | Filter on 1..floor x and floor(y)+1 agree; y≥0 required only for adapter. |

Also checked `bounded_degree_brauer_siegel` (fixed degree, both bounds, ε>0), the two χ₋₄ completion examples, and the real-bodied `BeurlingPrimeSystem` and its indexed count. Heavy definitions are not represented by sorry-valued data. The closing comment now names every README definition family absent from Lean with the correct section. The file has 399 lines, far below 5,000; the only sorry bodies are proofs.

## Verification and limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnalyticNumberTheory.json`: exit 0, zero errors and warnings.
- `lean-check research/blueprint/packages/AnalyticNumberTheoryPartI/Suggested.lean`: exit 0; 44 warnings, all exactly declarations using `sorry`, no other diagnostics. Available memory was 77 GiB before the final run. The exact rational margin and Hilbert-sign controls elaborate with actual tactic proofs.
- README size: 349,932 bytes (below the issue's 350,000-byte interpretation of 350 KB). The source locators, hypotheses, Checks and prerequisite sets remain in the README.
- All explicit legacy routes resolve; no unresolved internal Markdown/reference anchors found in the index or either part. The Parts' prerequisite direction remains I→II as supply, never II→I. No upward Statistics or Modularity input, no FoundationsAndLibraryIntegration or UPSTREAM stage id was introduced.
- `python3 research/blueprint/intake.py check-files` on the five issue deliverables: exit 0, five files, zero problems.

Compilation checks elaboration at the historical pins. The current-library duplication audit uses the newer read-only library and does not imply those newer modules are available in the historical build. Source sampling and the instantiated cases do not amount to formal proofs of all targets. This review's unresolved closure defect is recorded below; it is not hidden behind the successful Lean run.

## Handoff: the one remaining correction

Resume at §3.23, before treating the package as ready for a draft TauCetiRoadmap PR. The sourced target is the classical second-moment formula with O(√T log T), and the explicit sufficient estimate is |E(T)|≤110√T log T for T≥10^30 in Simonič–Starichkova, [arXiv:2105.06821v3](https://arxiv.org/pdf/2105.06821v3), §7 (109), p.35. Theorem2 is on p.4, not p.3. N=floor T lies in the required fixed-proportion truncation range.

The missing chain is mathematical: the exact endpoint-weighted divisor Voronoi identity (25) uses K₁ and Y₁; Lemma1 pp.8–9 requires their definitions, asymptotics, convergence and a uniform remainder. These objects and the transform are not among the imported contour/Gamma APIs, and cannot be treated as a name for an existing supplier. The saddle-point estimates used to pass from that transform to Atkinson's moving-cutoff sums must also have explicit domains, quantitative remainders and endpoint terms. To close the gap, either plan that chain with its carrier APIs, ≥3 tests per new definition and earlier prerequisites, or replace it with a fully specified proof of the same O(√T log T) bound from existing suppliers. Corollary1's stronger smoothing is unnecessary, and merely citing its true conclusion would not close the roadmap.

Retain the source verification, all old tests, the fourth-moment replacement and the supplier removals listed above. There is only 68 bytes of README headroom; further substantial proof material may require a maintainer-authorized boundary/size decision, rather than dropping targets or tests. No other job was claimed and no Part II file was changed. The review report itself carries the handoff because the issue restricts editable paths.

## Public PDF fingerprints

SHA-256 of the public PDFs actually read; these are provenance records, not copied source content. Bibliographic URLs are in the package References.

| Source | SHA-256 |
|---|---|
| R47 | `3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf` |
| R48 | `958b0390475236b68afdec28ce006b1a1d6ac59484eea9443e0b287e9f61a541` |
| R49 | `1445e107bba9c89db6529aeb4bca3ecf01170fc2854a675f5ca6f288c77ea0a8` |
| R58 | `8499680e907e06bf0b1eeae0c1bc7d46e5cbe93411388b17e843f3b8c6a0e9b1` |
| R60 | `a67de7157f76ee700bc2e6a0034a920adc390022d4ff528aa80084f829f35f61` |
| R61 | `98150bde6477d77e4fc4983b4176562b62e7df69755446229c45cb7649bea024` |
| R62 | `0dbcddf24bc41c65d1920c59aafe7fe85f13a7519b0edf9be9164c84d1cc6db4` |
| R63 | `ea90fb0faabeaaa56be15f2c6f9c22450e7891c2181130fd79fe356cd83ba3de` |
| R65 | `0c40f263e8ab7924d1f0a8c7e40d81d464aec6620b8ec14101f21f7b07e6f0c8` |
| R67 | `03e075ae749209d319a8b6f3e2b121fca4aa3e27a62d90285a15e26895804c06` |
| R71 | `8afee839cdc0e2056c6dcbe348e39c0a6aa27344125d8c3b80dd735f2e6d9521` |
| R76 | `964ddf95ad82a4ae23f7c1a7fe0c7b99b8adf1d1a3c2abd804d59b0ac9460210` |
| R77 | `c8acbebdf493a5a2f17cd5deff543fa62659d3b41484d1fe9c1f4bf7c80fb2de` |
| R82 | `e4ddc7a115ad4afd61f0063d0b931baf85792eee2267d1d5c232bece11d3163d` |
| R83 | `5816ba661b3c93ce225b99babfa48971e6a443134cc5e3c4d6392e183fe5e062` |
| R85 | `f0e172b6d6a89bfda96c5b4f264641509742030a7567cc9f0ae9815dccde7d06` |
| R86 | `f7641a11188d783d8e941883467d541d71429b98d6760e7d20bf85cf53e80bac` |
| R87 | `f2f19c87cef5ab706147604f058985e5aa6dee2d27b05513e6ad411e57375d05` |
| R89 | `12dee995d331a58767f57790190ab00f87236b8be71db026894120adec596093` |
| Kupers | `b76b7a9341e6758ace0e8e573886db531b1df89a1aa85f72e7ae7543accb28ca` |
| Kosters | `15fd5d8767fcf45a2ad46a5594e112229ca4c63b82b710e7f10cab60d9a6573e` |
