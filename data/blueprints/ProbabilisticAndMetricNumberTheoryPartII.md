# Probabilistic, metric and ergodic number theory, Part II

This continuation starts after PM.4. It plans countable-branch transfer operators, their spectral data and uniform renewal counting on the ordered projective simplex. The end result is a positive C¹ leading function B and a unique exponent β with N(w,r)∼B(w)e^{βr} uniformly in w, together with its conformal-measure characterization. All nodes are planning targets, not implementation claims.

Conventions: n≥3; coordinate subscripts in the mathematical statements start at 1. Δ has affine dimension n−2 and w_n=1 is a homogeneous placeholder. Norms of derivatives are real Fréchet operator norms. C¹ is built in the affine span with the sum of value and derivative sup norms. Complex weights always mean exp(−s log q) with real q>0. Chronological finite words and outer-prefix infinite codes have their orders stated separately. Counts include the empty word and distinguish semigroup elements, even at a boundary point with coinciding orbit images. Time is a real variable; N vanishes at negative times.

The exponent is obtained from pressure without arithmetic counting. Markoff-Hurwitz nonlinear comparison, Baragar identification and exceptional integral orbits belong to ArithmeticDynamicsPartII. No Hausdorff-dimension conclusion is made. Generic scalar Delange theory is imported from ArithmeticDirichletSeriesPartII, while this roadmap owns the uniform parameter adapter. PM.4 supplies base Gauss dynamics and its density, not the complex parameter family or its C¹ spectral theorem.

## Ownership and dependencies

Import PM.4’s exact nodes `gauss-map`, `gauss-branch-derivative`, `gauss-density-transfer`, `gauss-density-telescope` and `gauss-measure`. Import `ArithmeticDirichletSeriesPartII:HP.0/laplace` and `HP.3/laplace-theorem`. The finite positive-matrix cone metric is owned by `tauceti:TauCetiRoadmap/OptimalTransport#13b-iterative-proportional-fitting-and-finite-sinkhorn`; the general function-cone extension is here.

Current upstream DifferentialGeometry, Layer 10 §10.5, owns Brouwer’s theorem. Its `exists_fixedPoint_closedBall` statement and README were read at commit `0d144d044dacebca17b654695b6f1ad58f159b27`. [The owner](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/DifferentialGeometry/README.md#layer-10-the-brouwer-mapping-degree) is absent from the atlas snapshot. G1 records the indexing bridge needed at packaging; no Brouwer node is created here.

Packets use the pinned native `spectralRadius`, valued in ℝ≥0∞; real bounds are coerced explicitly. The baseline table records 17 declarations whose actual statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti is pinned at `f790474821cf4256814db967cb154e7af3d0c369`. General cone contraction, this affine C¹ carrier, the two-norm spectral decomposition and analytic simple eigendata were not found at either pin. Existing resolvent, real-measure Laplace, scalar Cauchy and Gauss APIs are retained as imports, not re-planned.

## TO.0 — Affine carriers and branch counting

Dependencies: `ProbabilisticAndMetricNumberTheory:PM.4`.

### Ordered projective simplex

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.0/simplex` (definition).

For an integer n≥3 let H_n be the nonzero nonnegative ordered tuples y₁≤⋯≤y_n with Σ_{i<n}y_i=y_n. Its positive-ray quotient is identified with Δ_n={0≤w₁≤⋯≤w_{n−1}, Σw_i=1} by w_i=y_i/y_n. The affine ambient space has dimension n−2; write w_n=1 only as a homogeneous placeholder. H_n is not itself a vector space. The vectors e_i+e_n form a basis of its linear span.

Proof or construction:

1. Positivity and the sum relation force y_n>0. Normalize, and use multiplication by the last coordinate as the inverse ray construction.
2. Δ_n is a closed bounded convex subset of its affine hyperplane. A strictly increasing positive tuple with sum one gives relative interior.

API:

- `simplex.compact_convex` — Δ_n is nonempty, compact, convex, with nonempty interior in its affine span.
- `simplex.normalize` — Normalization is constant precisely on positive rays of H_n.
- `simplex.coordinate_bound` — For j≤n−2, 0≤w_j≤1/2; the last free coordinate w_{n−1} need not satisfy this bound.

Checks:

- `simplex_three` — For n=3, Δ consists of (u,1−u), 0≤u≤1/2.
- `simplex_zero` — The zero homogeneous tuple is excluded; it cannot be normalized.
- `simplex_scaling` — (1,2,3) and (2,4,6) give the same n=3 point, but (1,1,3) is not in H.

Uses: TO.1 and TO.2: Provides the compact convex domain, positive branch denominators and affine tangent space.

Acceptance: Recover y up to a positive scalar; derivatives act in dimension n−2, never n−1.

Direct prerequisites: native finite-dimensional linear algebra, order and topology.

Source: GMR19, §1, (1.4)–(1.5), pp.755–757. The homogeneous ordered cone and its projective cross-section are the carriers for the linear dynamics.

### Accelerated projective branches

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.0/branches` (definition).

For 1≤i≤n−1 put γ_i(y)=(y₁,…,ŷ_i,…,y_n,Σ_{k≠i}y_k), where the sum includes k=n. For a=(A,j)∈ℕ×{1,…,n−2}, define q_a(w)=1+(A+1)(1−w_j) and F_a(w)=(w₁,…,ŵ_j,…,w_{n−1},1+A(1−w_j))/q_a(w). This is the normalized action of γ_{n−1}^Aγ_j. Put τ_a=log q_a and exp(−sτ_a) for its complex weight. Every denominator is positive.

Proof or construction:

1. Induct on A in the homogeneous action to obtain the displayed numerator. Verify order and that its entries sum to q_a.
2. Restrict the rational formula from an open neighborhood of Δ in its affine span; its denominator stays away from zero.

API:

- `branch.homogeneous` — γ_{n−1}^Aγ_j(y)=y_n q_a(w)·(F_a(w),1).
- `branch.delay_pos` — log(3/2)≤τ_a and |d log q_a| is bounded independently of A,j,w.
- `branch.smooth` — F_a is smooth on a neighborhood of Δ and preserves Δ.
- `branch.weight_norm` — |exp(−sτ_a)|=q_a^(−Re s); at real s the weight is positive.

Checks:

- `branch_four` — n=4, w=(1/6,1/3,1/2), (A,j)=(0,1): q=11/6 and F=(2/11,3/11,6/11).
- `branch_acceleration` — At the same w, (A,j)=(1,2): q=7/3 and F=(1/14,3/14,5/7).
- `branch_three_endpoint` — n=3, w=(0,1): q=A+2, F=(1/(A+2),(A+1)/(A+2)); A=0 is a genuine branch.

Uses: GMR19 (4.7), TO.2/operator: Fixes indices, derivative formulas and positive weights. TO.6/conformal: The homogeneous ratio supplies the projective Jacobian.

Acceptance: (A+3)/2≤q_a≤A+2 and τ_a≥log(3/2); never use a complex logarithm of a nonpositive base.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.0/simplex`.

Source: GMR19, §4.1, (4.5)–(4.7), Lemma 33, pp.791–792. The accelerated lift gives the scalar expansion factor and the countable-branch transfer weights.

### Words, delays and renewal count

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.0/words-count` (definition).

Use the free monoid on the alphabet a=(A,j). For a list u=[a₁,…,a_m], act chronologically: F_u=F_{a_m}∘⋯∘F_{a₁}; set T_u(w)=Σ_{k=1}^m τ_{a_k}(F_{a_{k−1}}⋯F_{a₁}w). The empty word has F=id,T=0. Define N(w,r)=#{u:T_u(w)≤r} for real r, including the empty word. Put N=0 for r<0. This counts words or semigroup elements, with multiplicity when several elements send w to the same point; it does not count distinct orbit points.

Proof or construction:

1. T is additive along chronological concatenation, and equals log((γ_u y)_n/y_n). Since T≥m log(3/2), lengths below a cutoff are bounded. Each prefix has delay≤r, hence A≤2e^r−3, so the count is finite.
2. Establish freeness of the homogeneous generating maps on a strictly ordered generic tuple: from an output z recover the deleted coordinate as 2z_{n−1}−z_n, insert it into the sorted list z₁,…,z_{n−2}, and use its insertion slot to recover the last unaccelerated letter. Iterate this inverse; maximal final runs of γ_{n−1} recover the accelerated blocks. This is an identity-of-maps assertion; boundary stabilizers do not imply word relations.
3. Partition nonempty words by their first chronological letter to get N(w,r)=1_{r≥0}+Σ_a N(F_aw,r−τ_a(w)).

API:

- `word.delay_append` — T_{u++v}(w)=T_u(w)+T_v(F_u w); F_{u++v}=F_v∘F_u.
- `count.finite` — For fixed r≥0 only finitely many lengths and letters contribute.
- `count.renewal` — N=1_{r≥0}+Σ_a N(F_aw,r−τ_a(w)); the sum is finite at each r.
- `count.homogeneous` — For c>0, N(cy,r)=N(y,r); evaluation at a boundary point need not distinguish words.

Checks:

- `count_negative` — N(w,−1)=0.
- `count_small` — N(w,r)=1 for 0≤r<log(3/2).
- `count_order` — For [a,b], the delay is τ_a(w)+τ_b(F_aw), not τ_a(w)+τ_b(w).

Uses: TO.6/transform and TO.6/count-asymptotic: The finite word count supplies measurable monotone functions and the exact renewal equation.

Acceptance: N(w,0)=1, N is nonnegative and nondecreasing in r, Borel measurable in r; prove scale invariance on H.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.0/branches`.

Source: GMR19, §1, (1.7), Theorem 13, pp.759–761; §4.1, (4.1), p.790; freeness discussion p.756. The count includes the identity and the renewal recursion separates the first branch; freeness concerns transformations, not injectivity at boundary points.

### C¹ on a compact convex body

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.0/c1` (construction).

Let E be a finite-dimensional real normed space, K⊂E nonempty compact convex with nonempty interior, and V a real Banach space (also a complex Banach space when complex scalars are needed). Define C¹(K;V) as continuous pairs (f,D) with f:K→V, D:K→(E→L[ℝ]V), satisfying f(y)−f(x)=∫₀¹ D(x+t(y−x))(y−x)dt for all x,y∈K. Use ‖f‖∞+‖D‖∞. D is the unique continuous extension of the derivative on the interior; the resulting closed subspace of the product of continuous-map Banach spaces is complete. For an affine K translate to its affine span before applying this construction.

Proof or construction:

1. Segment integration is continuous under uniform convergence of f and D, making the defining equations closed. Use the sum product norm, rather than silently inheriting the maximum product norm.
2. On interior points the integral identity and continuity of D give the Fréchet derivative. Conversely apply the fundamental theorem on interior segments and approach boundary endpoints from an interior point. Density of the interior proves uniqueness.
3. Value evaluation, derivative evaluation, real/complex scalar actions and constants descend from the two continuous-map factors. The segment identity gives Lip(f)≤‖D‖∞.

API:

- `C1.ext` — Equality of values on K implies equality of jets by interior derivative uniqueness.
- `C1.complete` — The sum norm makes C¹(K;V) a Banach space; complex scalar multiplication acts on both components.
- `C1.eval` — Value evaluation has operator norm≤1; derivative evaluation has operator norm≤1.
- `C1.of_neighborhood` — A continuously differentiable map on an open neighborhood of K gives its restriction jet; agreement with the native Fréchet derivative on the interior is exact.
- `C1.lipschitz` — Lip(f)≤‖Df‖∞ for the ambient norm.

Checks:

- `C1_constant` — The constant 1 on [0,1] has D=0 and norm 1.
- `C1_affine` — For f(x)=2x+3 on [0,1], D=2 and norm=7.
- `C1_wrong_jet` — The pair f=0,D=1 on [0,1] is rejected by its segment equation.
- `C1_singleton` — In the zero-dimensional affine span of a singleton, every derivative is the unique zero map.

Uses: TO.2/two-norm and TO.3/real-rpf: Provides the strong Banach carrier and its derivative norm. TO.4/perturbation: Places the analytic family in a complete operator algebra.

Acceptance: The norm is value plus derivative; the value map is injective. Constant one has norm one. A bounded strong ball has relatively compact image in C(K;V) when V is finite-dimensional.

Direct prerequisites: native finite-dimensional linear algebra, order and topology.

Source: GMR19, Lemma 38 and the C¹ norm, p.793; proof pp.798–799. The operator argument requires precisely this complete value-and-derivative space; the closed-jet construction supplies the boundary convention omitted there.

### C¹ calculus and compact inclusion

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.0/pullback` (theorem).

For compact convex bodies K⊂E, J⊂F as above and a C¹ map Φ:K→J with a jet extending the interior derivative, pullback Φ*:C¹(J;V)→C¹(K;V) is bounded, with ‖f∘Φ‖C¹≤max(1,‖DΦ‖∞)‖f‖C¹ and D(f∘Φ)=Df(Φ)∘DΦ. Pullback preserves identity and reverses composition. For scalar V=ℂ the value inclusion C¹(K)→C(K) is compact; products obey the Leibniz rule and ‖fg‖C¹≤‖f‖C¹‖g‖C¹.

Proof or construction:

1. For maps whose image touches the boundary, apply the extended derivative formula by approximating along interior chords, or use the path fundamental theorem for jets. This proves the chain rule without assuming Φ maps interior to interior.
2. The segment Lipschitz bound gives equicontinuity of the strong unit ball; values lie in a compact scalar disk. Apply the pinned Arzelà–Ascoli theorem after the native compact continuous-map/bounded-map equivalence.

Acceptance: Pullback of constants has derivative zero; restriction to affine maps agrees with native continuous-linear composition.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.0/c1`, `mathlib:BoundedContinuousFunction.arzela_ascoli`.

Source: GMR19, Lemma 46, pp.798–799. The derivative estimate uses the chain and product rules; compact inclusion is the weak-norm compactness input.

## TO.1 — Explicit contraction and the coding attractor

Dependencies: `ProbabilisticAndMetricNumberTheoryPartII:TO.0`.

### Core and cusp

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.1/regions` (definition).

For n≥4 write b=Σ_{i≤n−2}w_i, w_{n−1}=1−b. Define Δ₀={b≤1/2}, core={0≤1−2b≤w_{n−2}}, cusp={1−2b≥w_{n−2}}, all as subsets of Δ. Thus Δ₀=core∪cusp, with a shared boundary. The unaccelerated projective γ_i sends Δ to core for i≤n−2 and γ_{n−1} sends Δ to cusp.

Proof or construction:

1. Substitute the unaccelerated normalized formulas into each inequality. On core, w_{n−2}≤1/2 and w_{n−3}≤1/4; on cusp, w_{n−2}≤1/3 and w_{n−3}≤1/5.
2. Use non-strict inequalities throughout; all regions are closed.

API:

- `regions.union` — core∪cusp=Δ₀; their intersection is 1−2b=w_{n−2}.
- `regions.invariant` — γ_iΔ⊂core for i≤n−2, γ_{n−1}Δ⊂cusp; hence F_aΔ⊂Δ₀.
- `regions.chart` — The first n−2 coordinates identify Δ with its compact convex coordinate polytope.

Checks:

- `regions_vertex` — n=4, (0,0,1) is in cusp and not in core.
- `regions_core` — n=4, (0,1/2,1/2) is in core and not in cusp.
- `regions_boundary` — n=4, (0,1/3,2/3) belongs to both regions; a strict cusp definition fails this test.

Uses: TO.1/ten-bounds: Gives sharp coordinate inequalities for all ten derivative estimates.

Acceptance: Every accelerated branch sends Δ into Δ₀, even when A=0.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.0/simplex`, `ProbabilisticAndMetricNumberTheoryPartII:TO.0/branches`.

Source: GMR19, §5.1, pp.800–801. These regions constrain the rational Jacobian columns in the contraction proof; the cusp boundary inequality is non-strict.

### Ten derivative bounds

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.1/ten-bounds` (theorem).

For n≥4 all norms below are induced ℓ¹ norms in the first n−2 coordinates, on Δ₀ unless a region is specified. Put b=Σ_{k≤n−2}w_k. The ten bounds are:
(5.1) ‖dγ_i‖≤2/(2−w_i), i≤n−2, bounded by 6/5 on cusp and 4/3 on core.
(5.2) ‖dγ_{n−1}‖=(1+2b−2w₁)/(1+b)²≤1.
(5.3) ‖d(γ_i∘γ_j)‖≤2/(4−2w_j−w_i)≤4/5 for i<j≤n−2.
(5.4) ‖d(γ_i∘γ_j)‖≤2/(4−2w_j−w_{i+1})≤4/5 for j≤i<n−2.
(5.5) ‖d(γ_{n−2}∘γ_j)‖≤(4+2b−2w₁−3w_j)/(3+b−2w_j)²≤4/5 for j≤n−2.
(5.6) ‖d(γ_{n−1}∘γ_i)‖≤2/(3−2w_i), i≤n−3, bounded by 10/13 on cusp and 4/5 on core.
(5.7) ‖d(γ_{n−1}∘γ_{n−2})‖≤2/(3−2w_{n−2}), bounded by 6/7 on cusp and 1 on core.
(5.8) ‖d(γ_i∘γ_{n−1}∘γ_{n−2})‖≤2/(6−4w_{n−2}−w_i)≤4/7 for i≤n−3.
(5.9) ‖d(γ_{n−2}∘γ_{n−1}∘γ_{n−2})‖≤(7+2b−2w₁−6w_{n−2})/(5+b−4w_{n−2})²≤32/49.
(5.10) ‖d(γ_{n−1}²∘γ_{n−2})‖≤2/(4−3w_{n−2}), bounded by 2/3 on cusp and 4/5 on core.

Proof or construction:

1. Differentiate the rational coordinate maps, compose before bounding, and compute each absolute column sum. In (5.1), columns k≠i have sum 2/(2−w_i); the exceptional column is no larger. Recompute the special final row from 1−b.
2. For (5.2), the distinguished column has sum (1+2b−2w_k)/(1+b)², maximal at k=1. For (5.3)–(5.5), retain the composed denominator before applying the region inequalities. The derivative of a linear-fractional expression has a squared denominator in (5.5) and (5.9).
3. For (5.6)–(5.10), calculate the short composite rational map, then bound the largest column using w_{n−2},w_{n−3} and b. Empty index ranges impose no assertions. The supplement gives the case calculations; its exceptional-column comparison sign is corrected by the actual column sums.

Acceptance: All ten expressions must pass exact rational directional-derivative checks, including i=n−2 and shared boundaries; a numerical check alone is not a proof.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.1/regions`.

Source: GMR19, §5.2, (5.1)–(5.10), pp.801–802; Table 1 p.804. The published list supplies the short-block estimates, with the two squared denominators restored.; GMRv3, §5.3, pp.46–53, equations (5.2)–(5.10). The arXiv supplement supplies the explicit Jacobian and absolute-column computations omitted from the journal version.

### Uniform contraction

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.1/contraction` (theorem).

For every n≥3 there are D≥1 and 0<ρ<1 such that every m-letter branch composition satisfies sup_{w∈Δ}‖dF_u(w)‖₂≤Dρ^m. For n≥4, two accelerated branches on Δ₀ have ℓ¹ derivative norm≤24/25. Constants depend on n and the chosen equivalent affine norm, not on letters, exponents or w.

Proof or construction:

1. Write a two-branch composition as γ_{n−1}^A γ_i γ_{n−1}^B γ_j. If A,B≥1, (5.2),(5.6),(5.7) give 6/7. If B=0, (5.3)–(5.5) give 4/5. If A=0,B≥1,j≤n−3, use (5.1),(5.6) for 24/25. For j=n−2 and B=1, (5.8),(5.9) give 32/49; for B≥2, (5.1),(5.10) give 24/25.
2. The first branch enters Δ₀. Bound its derivative uniformly on all Δ directly from q_a≥(A+3)/2, then group the remaining letters into pairs and absorb the unpaired factor. Compare finite-dimensional norms only once.
3. For n=3 use x=w₁/w₂. The Gauss inverse branch is x↦1/(A+1+x); any two branches have derivative≤1/4 on [0,1]. The coordinate change is bi-C¹, giving the same form of estimate.

Acceptance: Include m=0 with derivative norm one; no estimate of each branch by a number<1 is claimed.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.1/ten-bounds`, `ProbabilisticAndMetricNumberTheoryPartII:TO.0/pullback`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-branch-derivative`.

Source: GMR19, Proposition 45 p.798; Lemma 48 and proof pp.802–803. The block decomposition gives eventual uniform contraction, after handling the first factor outside Δ₀.; GMR19, Examples 34,37, pp.791–793. The one-dimensional case is reduced to Gauss branches.

### Closed coding attractor

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.1/attractor` (construction).

For an infinite sequence a₁,a₂,… define π(a)=lim_m F_{a₁}∘⋯∘F_{a_m}(w₀), with the outermost letters fixed as m increases; this ordering is the reverse of chronological word evaluation. The limit exists independently of w₀. Define K to be the closure in Δ of the image of π. Then K is nonempty compact, F_aK⊂K, and K=closure(⋃_a F_aK). Every branch fixed point lies in K, and dist(F_u(w),K)≤Cρ^{length u}.

Proof or construction:

1. Nested images of Δ are nonempty compact and have diameter≤Dρ^m diam Δ. Completeness gives a unique point; use the same bound for basepoint independence.
2. Take closure because the countable alphabet has noncompact sequence space. Continuity proves forward invariance; prefix approximation proves the closed-union equality. Complete a finite prefix by a periodic tail to estimate distance from its image to K.

API:

- `attractor.code` — π(a)=F_{a₁}(π(tail a)); π is independent of its basepoint.
- `attractor.compact` — K is compact and invariant; closure of the branch union equals K.
- `attractor.fixedPoint` — The unique fixed point of every branch belongs to K.
- `attractor.approx` — Every m-letter image lies within Dρ^m diam Δ of K.

Checks:

- `attractor_periodic` — A constant code gives the branch fixed point.
- `attractor_zero` — For n=3, x_A=2/(A+1+sqrt((A+1)²+4))→0; K contains 0.
- `attractor_countable` — Do not conclude that the unclosed coding image is compact: all n=3 codes give x>0.

Uses: TO.5/fixed-delays and TO.5/wielandt: Supplies compact support, periodic points and attraction for the phase argument.

Acceptance: For n=3 the coding image alone omits 0, although fixed points with A→∞ tend to 0. K contains that limit.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.1/contraction`.

Source: GMR19, §4.2, limit-set definition p.794. The coding construction is used for the non-lattice argument; taking its closure repairs compactness for countably many branches.

## TO.2 — Transfer operators and convergent transforms

Dependencies: `ProbabilisticAndMetricNumberTheoryPartII:TO.0`, `ProbabilisticAndMetricNumberTheoryPartII:TO.1`, `ArithmeticDirichletSeriesPartII:HP.0`.

### Countable transfer operator

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.2/operator` (construction).

For Re s>1 define L_s f(w)=Σ_{j=1}^{n−2}Σ_{A≥0} exp(−sτ_{A,j}(w)) f(F_{A,j}(w)). Construct it as a bounded complex-linear operator on C(Δ;ℂ), and on C¹(Δ;ℂ) after the derivative estimates below. For real s its real restriction is positive. The two operators commute with the value inclusion; their mth powers are the absolutely convergent word sums of length m.

Proof or construction:

1. Sum branch operators in operator norm using q_a≥(A+3)/2 and the p-series criterion. Each branch is a bounded weighted pullback.
2. Apply the product and chain rules to each branch. The uniform bounds on d log q_a and dF_a give the same shifted p-series majorant for the strong norm, on compact s-sets.
3. Absolute convergence justifies iterated sums and identifies powers with chronological words; the scalar weights multiply by the cocycle identity.

API:

- `transfer.apply` — The operator evaluates to the stated absolutely and uniformly convergent sum.
- `transfer.compatible` — The C¹ operator followed by value inclusion equals the C⁰ operator on values.
- `transfer.pow` — L_s^m f=Σ_{|u|=m} exp(−sT_u) f∘F_u.
- `transfer.positive` — For real s>1 and f≥0, L_sf≥0; |L_sf|≤L_{Re s}|f|.

Checks:

- `transfer_zero` — L_s0=0.
- `transfer_one` — L_s1=Σ_a q_a^(−s); it is generally not the constant one.
- `transfer_three` — After the n=3 coordinate change, at x=0 the weight of branch A is (A+2)^(−s), not (A+1)^(−s).

Uses: TO.3/real-rpf and TO.6/transform: The same operator acts on the strong space and in the scalar renewal transform.

Acceptance: Real positivity is asserted only for real s. The word-power formula has the order and delays of TO.0.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.0/branches`, `ProbabilisticAndMetricNumberTheoryPartII:TO.0/c1`, `ProbabilisticAndMetricNumberTheoryPartII:TO.0/pullback`, `mathlib:Complex.summable_one_div_nat_cpow`, `mathlib:Real.summable_one_div_nat_rpow`.

Source: GMR19, Lemma 35 p.792; Lemma 38 p.793; (4.3),(4.7), pp.791–792. Summability of the infinitely many positive-base branch weights constructs the operator.

### Summability, tails and spectral bounds

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.2/c0-bounds` (theorem).

For σ>1, (n−2)Σ_{A≥0}(A+2)^(−σ)≤inf_w L_σ1(w)≤sup_w L_σ1(w)≤2^σ(n−2)Σ_{A≥0}(A+3)^(−σ). The C⁰ operator norm equals sup L_σ1. For complex s, ‖L_s‖C⁰≤sup L_{Re s}1. Truncating A at B leaves a C⁰ tail≤2^σ(n−2)Σ_{A>B}(A+3)^(−σ), bounded by 2^σ(n−2)(B+2)^(1−σ)/(σ−1). Any eigenprobability eigenvalue lies between these real bounds.

Proof or construction:

1. Use both sides of (A+3)/2≤q_a≤A+2 term by term; apply positivity to constants and integrate against a probability eigenmeasure.
2. The norm equality follows by testing on 1. Integral comparison bounds the shifted tail. Keep 2^σ, which cannot be replaced by a constant 2.

Acceptance: As σ↓1 the lower sum diverges. As σ→∞ the upper bound tends to zero by domination at a fixed σ₀>1, using 2/(A+3)<1.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.2/operator`.

Source: GMR19, Proof of Proposition 43, §4.5, p.799; Lemma 35 p.792. The corrected upper p-series estimate and its lower counterpart establish the two pressure limits directly.

### Ionescu–Tulcea–Marinescu inequality

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.2/two-norm` (theorem).

With σ=Re s>1 and m≥0, there is C independent of m,s,w such that |D(L_s^m f)(w)|≤C|s|L_σ^m|f|(w)+Dρ^m L_σ^m|Df|(w). Also |L_s^m f|≤L_σ^m|f|. On each compact subset of Re s>1 all coefficient constants can be chosen uniformly. Here |Df| is the norm of the real derivative, and L_σ on the right acts on nonnegative continuous functions.

Proof or construction:

1. The derivative of T_u is a sum of dτ at successive images composed with prefix derivatives. Sum the geometric contraction bound to get |DT_u|≤C uniformly in u.
2. Differentiate exp(−sT_u)f∘F_u: its two summands are bounded by |s|C exp(−σT_u)|f∘F_u| and Dρ^m exp(−σT_u)|Df∘F_u|.
3. The p-series majorant permits summation and differentiation. Use L_σ, not the complex L_s, on the right side of an order inequality.

Acceptance: At s with nonzero imaginary part the entire right side is real and nonnegative; m=0 gives a valid bound.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.1/contraction`, `ProbabilisticAndMetricNumberTheoryPartII:TO.2/operator`, `ProbabilisticAndMetricNumberTheoryPartII:TO.0/pullback`.

Source: GMR19, Lemma 46 and proof, pp.798–799. The derivative of the delay cocycle and contraction give the two-norm bound; the real-part operator corrects the printed complex inequality.

### Holomorphic operator family

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.2/holomorphic` (theorem).

The map s↦L_s is holomorphic from {Re s>1} into the complex Banach algebra of bounded operators on C¹(Δ). Its kth derivative is the operator sum Σ_a (−τ_a)^k exp(−sτ_a) f∘F_a. For every compact s-set the sums and their C¹ derivatives converge uniformly in operator norm.

Proof or construction:

1. Truncate the A-sum: each branch is multiplication by exp(−sτ_a) followed by a fixed pullback. Since τ_a is a fixed bounded C¹ function, its exponential is entire in the C¹ Banach algebra; finite branch sums are entire. On a compact subset choose 1<σ₀<inf Re s.
2. Logarithmic factors and their spatial derivatives are absorbed by q^{−σ₀}, giving uniform strong-norm tails for all fixed parameter derivative orders. The first-derivative series proves complex differentiability, then use the pinned one-variable Banach-valued Cauchy theorem for analyticity.

Acceptance: Holomorphy is in operator norm on C¹, not merely pointwise in w.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.2/two-norm`, `mathlib:DifferentiableOn.analyticOnNhd`.

Source: GMR19, Lemma 38 p.793, proof pp.798–799. Strong-norm control of the truncated branch sums supplies the analytic family needed for perturbation.

### Bilateral Laplace adapters

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.2/bilateral` (definition).

For a complex Banach space V define HasBilateralLaplace f s z to mean that exp(−st)•f(t) is Bochner integrable on ℝ and has integral z. Reuse the one-sided HasLaplace predicate of HP.0. For an a.e. strongly measurable f, a strip a<Re s<b supports a holomorphic bilateral transform if for each compact [c,d]⊂(a,b), t↦sup_{σ∈[c,d]}e^{−σt}‖f(t)‖ is integrable. With g(u)=f(log u) on u>0, integrability is equivalent to MellinConvergent g (−s), and the values agree.

Proof or construction:

1. Split ℝ into positive and negative half-lines; reflection gives the sum of one-sided transforms at s and −s. The point t=0 is null.
2. For holomorphy choose a slightly larger compact real interval inside the strip; polynomial t-factors are bounded by its exponential slack, permitting differentiation under the integral.
3. Use u=exp t, du/u=dt and the positive-base complex power identity: u^{−s−1}g(u)du=e^{−st}f(t)dt. Include absolute convergence in this change of variables.

API:

- `bilateral.unique` — Convergent bilateral transform values are unique.
- `bilateral.split` — Bf(s)=L(f)(s)+L(t↦f(−t))(−s) when both half-line integrals converge.
- `bilateral.zeroExtension` — HasLaplace f s z implies HasBilateralLaplace of its zero extension s z.
- `bilateral.mellin` — HasBilateralLaplace f s z iff MellinConvergent (f∘log) (−s) and mellin (f∘log) (−s)=z, ignoring u≤0.
- `bilateral.translate` — Translation f(t−c) changes a convergent transform by exp(−sc), for real c.

Checks:

- `bilateral_indicator` — For f=1_{[c,∞)}, Re s>0, Bf(s)=exp(−sc)/s.
- `bilateral_two_sided` — For f(t)=exp(−|t|), −1<Re s<1, Bf(s)=2/(1−s²).
- `bilateral_sign` — g=1_{[1,∞)} has mellin g (−s)=1/s for Re s>0; +s has the wrong convergence half-plane.
- `bilateral_divergence` — The constant one on all ℝ has no absolutely convergent bilateral transform.

Uses: TO.6/transform: Converts the zero-extended renewal count to the supplier’s ordinary Laplace convention and to Mathlib mellin.

Acceptance: Zero extension makes the bilateral transform exactly the shared one-sided transform, with no factor s.

Direct prerequisites: `ArithmeticDirichletSeriesPartII:HP.0/laplace`, `mathlib:mellin`, `mathlib:MellinConvergent`, `mathlib:MeasureTheory.integral_tsum`, `mathlib:MeasureTheory.tendsto_integral_filter_of_dominated_convergence`.

Source: GMR19, §4.1, (4.2)–(4.4), pp.790–791. The paper uses a bilateral transform of a function zero at negative times; these adapters supply its integration and Mellin conventions.

## TO.3 — Fixed points, cones and spectral decomposition

Dependencies: `ProbabilisticAndMetricNumberTheoryPartII:TO.0`, `ProbabilisticAndMetricNumberTheoryPartII:TO.1`, `ProbabilisticAndMetricNumberTheoryPartII:TO.2`, `tauceti:TauCetiRoadmap/OptimalTransport#13b-iterative-proportional-fitting-and-finite-sinkhorn`.

### Schauder–Tychonoff fixed point theorem

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.3/schauder` (theorem).

Let V be a Hausdorff locally convex real topological vector space, C⊂V nonempty compact convex and f:C→C continuous. Then some x∈C satisfies f(x)=x. This general compact-convex theorem is new here; finite-dimensional Brouwer is imported from current upstream DifferentialGeometry Layer 10.5, not re-planned.

Proof or construction:

1. For each convex symmetric neighborhood U of zero choose a finite U-cover of C and a continuous partition of unity subordinate to it. Form a finite convex combination approximation p_U:C→conv{x₁,…,x_m} with x−p_Ux∈U.
2. On the finite convex hull apply imported Brouwer to p_U∘f. To pass from the upstream unit-ball version, compose with nearest-point projection onto the finite convex hull inside a containing Euclidean ball; handle affine dimension zero separately.
3. The approximate fixed points form a net indexed by shrinking neighborhoods. Compactness gives a cluster point and Hausdorff continuity forces f(x)=x. Local convexity is used to keep approximation errors in U.

Acceptance: The compact set and the ambient space must be nonempty and Hausdorff respectively; no Banach norm is required. G1 records the upstream stage-index bridge.

Direct prerequisites: native finite-dimensional calculus and topology; the upstream Brouwer import is recorded as G1.

Source: MN75, Theorem 2.6, §2, pp.166–168. The source proves a stronger compact-image fixed point result; the compact convex self-map case here follows. Its finite-dimensional input is Brouwer.

### Positive eigenprobability

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.3/eigenprobability` (construction).

For every real σ>1 there exist a Borel probability ν on Δ and λ>0 with ∫L_σf dν=λ∫f dν for every continuous complex f. Construct ν as a fixed point of μ↦L_σ*μ/(∫L_σ1 dμ) on probability measures, and put λ=∫L_σ1 dν. This stage asserts existence, not uniqueness.

Proof or construction:

1. Realize probability measures as positive normalized functionals μ↦(f↦∫f dμ) inside the product ℝ^{C(Δ;ℝ)}, a Hausdorff locally convex space. Weak topology agrees with the induced integral topology. Native Prokhorov with constant compact set Δ proves compactness; injectivity of integrals identifies the carrier, avoiding an unproved Riesz representation theorem.
2. The lower bound inf L_σ1>0 makes normalization continuous and nonzero. The branch formula constructs L_σ*μ as a convergent sum of weighted pushforwards, whose total mass is the denominator. Apply Schauder–Tychonoff to the compact convex image of probability measures.
3. The fixed point gives the real integral identity; split real and imaginary parts for complex f.

API:

- `eigenprob.mass` — ν is a probability and λ=∫L_σ1 dν>0.
- `eigenprob.dual` — ∫L_σf dν=λ∫f dν for every f∈C(Δ;ℂ).
- `eigenprob.normalize` — The normalized pushforward sum agrees with the integral-functional formula.

Checks:

- `eigenprob_onepoint` — On a one-point space with branch weights of total c>0, ν is its point mass and λ=c.
- `eigenprob_constant` — Testing f=1 gives λ=ν(L1), not a forced value 1.
- `eigenprob_zero` — The zero operator fails the positive denominator hypothesis.

Uses: TO.3/cone-rpf: Normalization by ν selects the leading eigenfunction and eigenprojection.

Acceptance: ν1=1 and the two scalar p-series bounds enclose λ; positivity is not asserted for complex s.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.3/schauder`, `ProbabilisticAndMetricNumberTheoryPartII:TO.2/c0-bounds`, `mathlib:MeasureTheory.ProbabilityMeasure.continuous_integral_continuousMap`, `mathlib:isCompact_setOfPred_probabilityMeasure_mass_eq_compl_isCompact_le`, `mathlib:MeasureTheory.FiniteMeasure.ext_of_forall_integral_eq`.

Source: GMR19, Corollary 36, p.792. Normalized dual action on probabilities produces a positive eigenmeasure.

### Cone order and Hilbert distance

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.3/cones` (definition).

For a closed proper convex cone C in a real Banach space define α(f,g)=sup{a>0:g−af∈C}, β(f,g)=inf{b>0:bf−g∈C} and d_C(f,g)=log(β/α) whenever 0<α≤β<∞. Functions in the same positive ray have distance zero; quotient by rays gives the Hilbert metric on each comparable component. For a>0 on C¹(Δ;ℝ), use C_a={f≥0:|Df|≤af}. Every nonzero element is strictly positive, by the segment identity and Grönwall. For 0<κ<1, C_{κa}\{0} has finite projective diameter inside C_a, at most 2log((1+κ)/(1−κ))+2κa diam Δ.

Proof or construction:

1. Use cone order to derive scaling invariance, triangle inequality and separation modulo rays; restrict to comparable nonzero elements instead of totalizing infinite distances.
2. Along a segment, |Df|≤af yields the exponential comparison f(y)≤exp(a‖x−y‖)f(x). If f vanishes at one point it vanishes everywhere.
3. For f,g∈C_{κa}, the derivatives of g−tf are bounded by κa(g+tf). Choose t≤(1−κ)/(1+κ)·inf(g/f), and bound the reverse order similarly. The log-Lipschitz estimate bounds oscillation of g/f.

API:

- `hilbert.scale` — d_C(cf,dg)=d_C(f,g) for c,d>0.
- `hilbert.zero_iff` — For comparable nonzero elements of a proper closed cone, d=0 iff they lie on one positive ray.
- `hilbert.positiveOrthant` — On strictly positive finite vectors the distance is the logarithmic max/min ratio of the OptimalTransport owner.
- `cone.interiorDiameter` — C_{κa} has the displayed finite C_a diameter; C_a contains constants.

Checks:

- `hilbert_ray` — d((1,2),(3,6))=0.
- `hilbert_vector` — In ℝ²_{≥0}, d((1,1),(1,4))=log 4.
- `hilbert_incomparable` — (1,0) and (0,1) are not in a finite-distance component.
- `cone_affine` — On [0,1], f=1+x belongs to C_1 but not to C_a for 0<a<1.

Uses: TO.3/cone-rpf: Finite projective diameter contracts normalized transfer iterates in a norm-controlling cone.

Acceptance: For a positive vector cone, recover log(max_i g_i/f_i / min_i g_i/f_i), the exact finite-matrix supplier convention.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.0/c1`, `tauceti:TauCetiRoadmap/OptimalTransport#13b-iterative-proportional-fitting-and-finite-sinkhorn`.

Source: LIV95, §1, projective metric preceding Theorem 1.1, preprint pp.3–5. Cone order defines the projective metric and contraction framework. The differentiable function cone is the present specialization.

### Measure of noncompactness

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.3/noncompactness` (definition).

For a bounded subset A of a complex Banach space let χ(A) be the infimum of radii r>0 of finite covers by norm balls of radius r with centers in the ambient space. For a bounded operator T let χ(T)=χ(T(B₁)) for the closed unit ball B₁, and r_χ(T)=lim_m χ(T^m)^(1/m), with the zero convention. The limit equals the infimum, by submultiplicativity. In finite dimension these quantities vanish.

Proof or construction:

1. Finite covers give χ(A+B)≤χ(A)+χ(B) and homogeneity. For bounded linear T, χ(TA)≤χ(T)χ(A), first using radii slightly above the infima, then taking limits.
2. This proves submultiplicativity and the root limit. Completeness identifies χ(A)=0 with relative compactness.

API:

- `noncompact.zero` — χ(A)=0 iff closure A is compact, for bounded A in a Banach space.
- `noncompact.compactPerturbation` — For bounded A and nonempty relatively compact K, χ(A+K)=χ(A); adding a compact operator does not change r_χ.
- `noncompact.powers` — χ(T^{m+k})≤χ(T^m)χ(T^k), and r_χ(T)≤spectralRadius ℂ T after coercion to ℝ≥0∞.

Checks:

- `noncompact_finite` — A finite set and any bounded set in finite dimension have χ=0.
- `noncompact_identity` — On an infinite-dimensional Banach space, χ(B₁)=1 and r_χ(id)=1.
- `noncompact_scaling` — For c∈ℂ, r_χ(cT)=|c|r_χ(T).
- `noncompact_empty_sum` — χ(∅)=0 and A+∅=∅. Thus on an infinite-dimensional Banach space χ(B₁+∅)=0≠1=χ(B₁); the compact-set addition rule needs nonemptiness.

Uses: TO.3/itm: Weak compactness and a two-norm inequality yield a bound on the noncompact spectral part without assuming an approximation property.

Acceptance: This definition uses arbitrary finite covers, not compact operators or an approximation-property assumption.

Direct prerequisites: `mathlib:spectralRadius`.

Source: HEN95, §5, Definitions 5.1–5.2 and Propositions 5.1–5.2, pp.19–20. The ball-cover measure quantifies the compactness defect used in the spectral proof.

### Two-norm spectral criterion

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.3/itm` (theorem).

Let B be a complex Banach space with auxiliary continuous norm |·|_w≤C‖·‖. Let T:B→B be bounded for both norms, and assume T maps the strong unit ball to a set relatively compact for the weak norm. If for some k≥1, R≥0,r>0 one has ‖T^k f‖≤R|f|_w+r^k‖f‖, then r_χ(T)≤r. For every t>r the part of spectrum with |z|≥t is finite and consists of isolated eigenvalues with finite-dimensional generalized eigenspaces; invariant finite-dimensional/complementary decompositions exist after choosing a circle avoiding the spectrum. If additionally sup_m|T^m|_w<∞ and r<1, then either spectralRadius(T)<1 or spectralRadius(T)=1 with all unit-circle spectral points of this finite-eigenvalue form.

Proof or construction:

1. Iterate the k-step estimate to get ‖T^{ks}f‖≤R_s|f|_w+r^{ks}‖f‖. Cover T(B₁) by finitely many weak balls with centers in B; their strong norms are bounded. This gives χ(T^{ks+1})≤2‖T‖r^{ks}, and hence r_χ≤r.
2. Prove the spectral decomposition directly from Hennion Appendix A: for |z|>r_χ, bounded approximate solutions of (z−T)f=g have convergent subsequences; separated chains of invariant subspaces contradict the ball-cover bound. This makes kernels finite, ranges closed, and ascending kernels/descending ranges stationary. Split the generalized eigenspace from the stable range. Only finitely many such eigenvalues lie outside a larger circle.
3. Gelfand’s formula plus the iterated two-norm estimate transfers weak power boundedness to a strong spectral-radius bound≤1. If the radius is 1, the exterior spectral decomposition applies. No generic contour-projection package is assumed.

Acceptance: Retain the alternative radius<1: a contraction need not have a unit-circle eigenvalue. For normalized complex transfer operators apply the alternative before using a hypothetical equality of radii.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.3/noncompactness`, `mathlib:spectrum.gelfand_formula`, `mathlib:spectrum.nonempty`.

Source: HEN95, Theorem 3.1, Proposition 3.3, Corollary 3.1, pp.11–13; §5 Corollary 5.2 p.21; Appendix A pp.43–46. The finite-cover argument gives the essential bound, and Appendix A proves the finite spectral decomposition from it. The statement uses ≤r, not an unjustified strict bound at the endpoint.

### Countable-branch cone convergence

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.3/cone-rpf` (theorem).

For each real σ>1 choose Q≥1,a>0 and 0<κ<1 so that L_σ^Q maps C_a\{0} into C_{κa}\{0}. With the eigenprobability ν and λ from TO.3/eigenprobability, there is h∈C¹(Δ;ℝ), h>0, νh=1 and constants M<∞,0<θ<1 with ‖λ^{−m}L_σ^m f−hνf‖C¹≤Mθ^m‖f‖C¹ for every complex f and m≥0. This proof includes the infinitely many branches and the boundary of Δ.

Proof or construction:

1. The two-norm inequality gives |D L_σ^Qf|≤(Cσ+Dρ^Qa)L_σ^Qf for f∈C_a. First choose Q with Dρ^Q<κ, then a>Cσ/(κ−Dρ^Q). Strictly positive sums remain positive; the summability bounds pass cone inequalities through limits.
2. Prove the general Birkhoff contraction inequality d(Tf,Tg)≤tanh(diam(TC)/4)d(f,g) for a cone-preserving linear T of finite projective diameter, using the four order bounds α,β; this extends the existing finite-positive-matrix theorem. Use the finite C_a diameter of C_{κa}.
3. On the section νf=1, cone order controls the C¹ norm: every order-positive difference has |Dg|≤ag, and cone functions have uniform upper/lower bounds from their log-Lipschitz ratio and νf=1. Thus projective contraction gives a norm-Cauchy sequence λ^{−kQ}L_σ^{kQ}1, with limit h and exponential error.
4. Every real C¹ function becomes an element of C_a after adding a constant of size bounded by its C¹ norm; subtract its constant part and use linearity. Handle complex f by real/imaginary parts. Uniqueness on the normalized cone and commutation show L_σh=λh; the finitely many remainders m mod Q give the full bound.

Acceptance: No finite-type symbolic theorem is substituted for the countable sums. The norm conclusion is C¹, not merely projective or C⁰ convergence.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.2/two-norm`, `ProbabilisticAndMetricNumberTheoryPartII:TO.3/eigenprobability`, `ProbabilisticAndMetricNumberTheoryPartII:TO.3/cones`.

Source: LIV95, §1 Theorem 1.1 and Lemma 1.3, preprint pp.4–6; §2 Lemmas 2.1–2.3 and Theorem 2.5, preprint pp.8–12. Cone contraction and order-to-norm control provide the method, specialized here to the C¹ derivative cone.; GMR19, Theorem 39 p.793; proof sketch p.799. The transfer-family spectral theorem calls for this countable-branch cone argument.

### Ruelle–Perron–Frobenius theorem

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.3/real-rpf` (theorem).

For real σ>1, L_σ on C¹(Δ;ℂ) has a positive algebraically simple eigenvalue λ_σ>0, a strictly positive real eigenfunction h_σ, and a unique eigenprobability ν_σ, normalized by ν_σ1=ν_σh_σ=1. Its spectral projection is P_σ f=h_σν_σf; write R_σ=L_σ−λ_σP_σ, with PR=RP=0 and spectralRadius(R_σ)<λ_σ. The probability h_σν_σ is invariant for the normalized Markov operator f↦L_σ(h_σ f)/(λ_σh_σ). The support of ν_σ is exactly K.

Proof or construction:

1. The exponential rank-one convergence proves the simple eigenspace, rules out Jordan vectors and other peripheral spectrum, and bounds the remainder by a smaller radius.
2. If another eigenprobability has eigenvalue c>0, testing h gives c=λ. Apply the convergence to C¹ functions; density of restricted smooth functions in C(Δ) and boundedness of the measures give equality on all continuous functions. For the stated leading eigenvalue uniqueness follows the same way.
3. Strict positivity of all branch weights gives forward invariance of support. Iteration of support points and contraction include all coding points. Conversely the normalized Markov iterates concentrate within Dρ^m diam Δ of K, so the invariant probability hν, and hence ν, is supported on K.

Acceptance: The s=2 Gauss specialization distinguishes a leading eigenfunction from an invariant probability density; the normalizations fix both scalar freedoms.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.3/cone-rpf`, `ProbabilisticAndMetricNumberTheoryPartII:TO.1/attractor`, `mathlib:spectrum.gelfand_formula`.

Source: GMR19, Theorem 39, pp.793–794; §4.4 p.799. The spectral gap, unique eigenprobability and positive normalized eigenfunction are the three parts of the real RPF theorem.

## TO.4 — Analytic perturbation and uniform gaps

Dependencies: `ProbabilisticAndMetricNumberTheoryPartII:TO.2`, `ProbabilisticAndMetricNumberTheoryPartII:TO.3`.

### Simple isolated eigendata

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.4/simple-data` (definition).

For a complex Banach space B and bounded T:B→B, simple isolated eigendata consist of λ∈ℂ, h∈B, φ∈B*, with φh=1, Th=λh, φT=λφ, and a bounded inverse of (T−λ) restricted to ker φ. Define P(f)=φ(f)h and R=T−λP. Then P²=P, PR=RP=0; T−λ+P is invertible. The complement condition encodes algebraic simplicity and isolation, rather than only a one-dimensional eigenspace.

Proof or construction:

1. Split B=span{h}⊕ker φ by the bounded rank-one projection. In this splitting T−λ+P acts as identity on h and as the given invertible restriction on ker φ.
2. Equivalence with an isolated spectral point of algebraic multiplicity one follows from the finite spectral decomposition when that is available; the explicit inverse data are the core interface used by the implicit function theorem.

API:

- `simpleData.projection` — P is the projection onto span h with kernel ker φ; PT=TP=λP.
- `simpleData.rescale` — Replacing h by ch and φ by c⁻¹φ for c≠0 preserves P and the data.
- `simpleData.inverse` — T−λ+P is invertible; the reduced inverse on ker φ is bounded.
- `simpleData.nativeSpectrum` — The encoded λ belongs to the native complex spectrum, and a punctured disk about λ lies in its resolvent set.

Checks:

- `simpleData_diagonal` — For diag(2,1), λ=2,h=e₁,φ=first coordinate gives P=diag(1,0).
- `simpleData_jordan` — A nontrivial 2×2 Jordan block at λ fails the invariant-complement inverse condition, despite its one-dimensional eigenspace.
- `simpleData_one_dimension` — On ℂ, multiplication by λ has complement {0}; the inverse condition is valid also when λ=0.

Uses: TO.4/perturbation: Supplies the explicit invertible derivative for analytic eigendata and the rank-one projection.

Acceptance: No positive measure interpretation is assigned to φ for non-real parameters.

Direct prerequisites: `mathlib:spectralRadius`.

Source: KLO19, Definition 1.1, p.178; §3.1, pp.185–186. A complementary invariant hyperplane with invertible restriction is the simple-isolated-eigenvalue interface.

### Analytic simple-eigenvalue perturbation

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.4/perturbation` (theorem).

Let U⊂ℂ be open, T:U→(B→L[ℂ]B) holomorphic, z₀∈U, with simple isolated eigendata at z₀. On some neighborhood of z₀ there are holomorphic λ(z),h(z),φ(z),P(z) and reduced inverses, extending the data and satisfying φ(z)h(z)=1. The perturbed λ stays simple isolated, and λ′(z)=φ(z)(T′(z)h(z)). Normalizing φ(z)1=1 is possible in the transfer application since that scalar is nonzero at a real basepoint. If R(z₀) has radius<|λ(z₀)|, this strict gap persists locally.

Proof or construction:

1. Apply the complex Banach implicit function theorem to (z,u,ℓ)↦(T(z)u−ℓu,φ₀u−1). Its derivative in (u,ℓ) is ((T₀−λ₀)v−th₀,φ₀v), whose inverse is explicit on span h₀⊕ker φ₀. Native strict differentiable implicit functions give differentiability on a neighborhood by applying the local uniqueness argument at each nearby point; one-variable complex Cauchy yields analyticity.
2. Apply the same argument to the dual family and rescale to φh=1. Invertibility on the moving hyperplane persists after identifying it with the original hyperplane by P₀. Differentiate the eigenrelation and apply φ to get the derivative formula.
3. For gap stability choose a power m with ‖R₀^m‖^{1/m}<r<|λ₀| by Gelfand’s formula. Continuity of R^m and λ preserves this inequality after shrinking the neighborhood; no unproved continuity of spectral radius is used.

Acceptance: Test the derivative against diag(e^z,1/2). Kato is a historical attribution; no access to its uncleared book is claimed.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.4/simple-data`, `mathlib:ImplicitFunctionData.differentiableAt_implicitFunction`, `mathlib:DifferentiableOn.analyticOnNhd`, `mathlib:spectrum.hasFDerivAt_resolvent`, `mathlib:spectrum.gelfand_formula`.

Source: KLO19, Qualitative theorem and proof pp.177–178; Proposition 3.1 p.186; Proposition 3.2 p.186; Corollary 1.13 p.182. Kloeckner supplies a public implicit-function proof of analytic simple eigendata, their derivative and gap stability.

### Spectral gap on compact parameter intervals

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.4/uniform-gap` (theorem).

For each compact real I⊂(1,∞) there are M_I<∞, θ_I<1 and ε_I>0 such that for σ∈I and m≥0, ‖λ_σ^{−m}L_σ^m−P_σ‖C¹≤M_I θ_I^m, and every spectral point other than λ_σ has modulus≤λ_σ−ε_I. Locally around each real σ, λ,h,ν and P have holomorphic continuations, with ν1=νh=1; away from real parameters ν denotes a continuous complex-linear functional, not a probability measure.

Proof or construction:

1. At each real parameter choose a power for which the normalized remainder norm is<1. Perturbation and continuity preserve the power bound in a neighborhood.
2. A finite subcover of I, bounded norms for the finitely many power remainders and a positive minimum of λ give uniform M,θ and an additive ε. Real uniqueness patches the local eigenvalue branches; compatible normalizations patch h and ν.

Acceptance: The claim is uniform on compact real intervals, with no global gap as σ approaches 1 or ∞.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.3/real-rpf`, `ProbabilisticAndMetricNumberTheoryPartII:TO.2/holomorphic`, `ProbabilisticAndMetricNumberTheoryPartII:TO.4/perturbation`.

Source: GMR19, Theorem 39(1), p.793; §4.4 p.799. The stated compact-parameter spectral gap is obtained here from local norm estimates and analytic perturbation.

## TO.5 — Non-lattice separation and pressure

Dependencies: `ProbabilisticAndMetricNumberTheoryPartII:TO.1`, `ProbabilisticAndMetricNumberTheoryPartII:TO.2`, `ProbabilisticAndMetricNumberTheoryPartII:TO.3`, `ProbabilisticAndMetricNumberTheoryPartII:TO.4`.

### Non-lattice delay cocycle

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.5/nonlattice` (definition).

The delay cocycle is non-lattice on K if, for each t∈ℝ\{0}, there do not exist a bounded function G:K→ℝ and r∈ℝ such that −tτ_a(w)−G(F_aw)+G(w)−r∈2πℤ for all a,w∈K. No continuity of G is required. Equivalently there is no circle-valued phase u(w) with exp(−itτ_a(w))u(F_aw)=exp(ir)u(w); a bounded principal argument converts a phase to G.

Proof or construction:

1. Exponentiation removes the integer ambiguity; choose a principal argument in a bounded interval for the converse. Its possible discontinuity is why G is not required continuous.
2. At a branch fixed point the G terms cancel, making the corresponding delays lie in one common arithmetic coset if such data existed.

API:

- `nonlattice.circle` — The bounded-real and circle-phase formulations are equivalent.
- `nonlattice.fixed` — A lattice representation forces −tτ_a(p_a)−r∈2πℤ at every fixed point.
- `nonlattice.coboundary` — Adding H∘F_a−H to all delays preserves the condition when H is bounded.

Checks:

- `nonlattice_constant` — All delays equal c admit G=0,r=−tc for any nonzero t, so are lattice.
- `nonlattice_coset` — Delays in c+dℤ admit t=2π/d,r=−tc; omitting r would misclassify them.
- `nonlattice_close` — A sequence of fixed-point delays with successive differences positive and tending to zero precludes a common lattice coset.

Uses: TO.5/wielandt: Rules out equality in the complex-to-real spectral-radius comparison.

Acceptance: A single branch cannot certify non-lattice; the common phase r is essential.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.1/attractor`, `ProbabilisticAndMetricNumberTheoryPartII:TO.0/branches`.

Source: GMR19, Definition 40 and Proposition 42, pp.794–796. The non-lattice condition includes a common additive phase and is tested at branch fixed points.

### Fixed-point non-lattice test

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.5/fixed-delays` (theorem).

The GMR delay cocycle on K is non-lattice. For the branches a_A=(A,n−2), a fixed ray has homogeneous multiplier t_A=((A+1)+sqrt((A+1)²+4))/2, and delay log t_A. These delays are strictly increasing, and log t_{A+1}−log t_A→0.

Proof or construction:

1. In the last two basis coordinates the branch matrix is [[0,1],[1,A+1]]. Take its positive eigenvector; other coordinates are zero. The resulting tuple belongs to H and is nonnegative, though not strictly positive in all coordinates. Its ray is in K by periodic coding.
2. The quadratic root is strictly increasing and asymptotic to A+1, so the positive successive log differences tend to zero. A common arithmetic coset with nonzero spacing has no such sequence of differences.

Acceptance: The boundary fixed vector is allowed; do not assert every coordinate is strictly positive.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.5/nonlattice`.

Source: GMR19, Proposition 42, proof pp.795–796. The explicit quadratic multipliers provide the non-lattice contradiction.

### Wielandt spectral separation

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.5/wielandt` (theorem).

For s=σ+it, σ>1 and t≠0, the complex operator satisfies spectralRadius(L_s)<λ_σ. For t=0 its radius is λ_σ. Consequently 1−L_s is invertible at every s with Re s=β and Im s≠0 once λ_β=1.

Proof or construction:

1. Normalize by λ_σ and conjugate by positive h_σ. Positivity bounds the weak norm of every complex iterate by a constant. The two-norm inequality and compact C¹→C⁰ inclusion give the ITM alternative and radius≤1; if equality holds there is a unit-modulus eigenvalue with an eigenvector f.
2. Write g=f/h_σ. On K choose a maximum of |g|. If its maximum were zero, attraction to K and the eigenrelation would force f=0. Equality in the convex average then forces all descendant values to have the same maximal modulus; descendants of one point are dense in K by coding and contraction. Thus |g| is a nonzero constant on K.
3. Equality in the triangle inequality for the absolutely convergent countable sum with strictly positive branch probabilities forces exp(−itτ_a(w))g(F_aw)=ζg(w) for every a,w∈K. Its phase yields the forbidden lattice representation. This contradiction gives strict separation.

Acceptance: A domination inequality alone does not give strict separation; both quasi-compactness and the non-lattice phase argument are required.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.3/itm`, `ProbabilisticAndMetricNumberTheoryPartII:TO.3/real-rpf`, `ProbabilisticAndMetricNumberTheoryPartII:TO.2/two-norm`, `ProbabilisticAndMetricNumberTheoryPartII:TO.5/fixed-delays`.

Source: GMR19, Theorem 41 p.795 and Proposition 42 pp.795–796; Lemma 46 pp.798–799. The generalized Wielandt argument is made explicit using the two-norm spectral criterion and the fixed-point test.

### Pressure and the unique exponent

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.5/pressure` (theorem).

For real σ>1, λ_σ is real analytic and satisfies λ′_σ=ν_σ((d/dσ)L_σ h_σ)≤−log(3/2)λ_σ<0. Moreover λ_σ→∞ as σ↓1 and λ_σ→0 as σ→∞. There is a unique β(n)>1 with λ_β=1. This establishes existence intrinsically, with no use of Baragar’s arithmetic counting theorem.

Proof or construction:

1. Use the perturbation derivative formula and differentiate weights to get −τ_aq_a^{−σ}. The probability normalization and τ_a≥log(3/2) give the quantitative negative derivative.
2. Integrate the lower p-series bound against ν for divergence at 1. Use the corrected 2^σ upper sum and domination at a fixed σ₀>1 for decay at infinity.
3. Continuity and the intermediate value theorem give existence; strict negativity gives uniqueness and a simple crossing.

Acceptance: Strict monotonicity alone is not used to infer a nonzero derivative at β.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.4/uniform-gap`, `ProbabilisticAndMetricNumberTheoryPartII:TO.2/c0-bounds`, `ProbabilisticAndMetricNumberTheoryPartII:TO.0/branches`.

Source: GMR19, Proposition 43 pp.796,799–800; Lemma 35 p.792. The real analytic pressure and large-parameter estimate are strengthened by the lower p-series bound to prove existence without the arithmetic comparison.

## TO.6 — Uniform renewal and conformal measures

Dependencies: `ProbabilisticAndMetricNumberTheoryPartII:TO.0`, `ProbabilisticAndMetricNumberTheoryPartII:TO.2`, `ProbabilisticAndMetricNumberTheoryPartII:TO.4`, `ProbabilisticAndMetricNumberTheoryPartII:TO.5`, `ArithmeticDirichletSeriesPartII:HP.3`.

### Uniform exponential renewal bound

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.6/growth` (theorem).

With β from TO.5, there is C<∞ such that 0≤N(w,r)≤Ce^{βr} for every w∈Δ,r≥0. The bound is uniform in w. Extend N by zero at negative times; N(w,·) is measurable and nondecreasing. No continuity of w↦N(w,r) is asserted.

Proof or construction:

1. Set p_a(w)=q_a(w)^{−β}h_β(F_aw)/h_β(w); the eigenrelation makes Σp_a=1. Put G(w,r)=e^{−βr}N(w,r)/h_β(w) and c=log(3/2).
2. For 0≤r<c, G≤1/min h. If r∈[kc,(k+1)c), all child times are<kc. The recurrence bounds the supremum through this interval by its previous supremum plus (min h)⁻¹e^{−βkc}.
3. Sum the geometric forcing terms over k and multiply by max h. Measurability and monotonicity follow from the finite indicator sum below each cutoff.

Acceptance: The common exponential bound is proved before using Fourier smoothing, rather than assumed from the desired asymptotic.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.0/words-count`, `ProbabilisticAndMetricNumberTheoryPartII:TO.5/pressure`, `ProbabilisticAndMetricNumberTheoryPartII:TO.3/real-rpf`.

Source: LAL89, Lemma 8.1 and recurrence argument, pp.28–29. Lalley first bounds the exponentially normalized renewal count; the positive minimum branch delay makes the adapted proof elementary.; GMR19, (4.1) p.790. The GMR recursion supplies the forcing and branch terms.

### Renewal resolvent and Mellin identity

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.6/transform` (theorem).

For Re s>β, the ordinary one-sided and zero-extended bilateral Laplace transforms of r↦N(w,r) converge absolutely, uniformly in w on compact parameter sets, and equal F(s)(w)=s⁻¹((1−L_s)⁻¹1)(w). The right side is holomorphic with values in C¹(Δ). For g_w(u)=0 at u<1 and g_w(u)=N(w,log u) at u≥1, the same value is mellin g_w (−s).

Proof or construction:

1. The uniform growth majorizes the integrand by Ce^{−(Re s−β)r}. Integrating each word indicator gives e^{−sT_u}/s. Fubini is justified by the corresponding positive real sum or the growth bound.
2. For σ>β, λ_σ<1. The two-norm argument and positivity give spectralRadius(L_s)≤λ_σ<1; hence the operator Neumann series Σ_m L_s^m converges and equals (1−L_s)⁻¹. This needs the non-strict comparison part of the spectral argument, also when t=0.
3. Identify powers with word sums and apply the bilateral/Mellin change of variables. The count itself is not assumed to be C(Δ)-valued at a fixed r; its transform is C¹-valued because it equals the resolvent expression.

Acceptance: The factor s⁻¹ arises from integrating an indicator, and no Stieltjes convention is substituted.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.6/growth`, `ProbabilisticAndMetricNumberTheoryPartII:TO.2/bilateral`, `ProbabilisticAndMetricNumberTheoryPartII:TO.2/holomorphic`, `ProbabilisticAndMetricNumberTheoryPartII:TO.5/wielandt`, `ArithmeticDirichletSeriesPartII:HP.0/laplace`, `mathlib:MeasureTheory.integral_tsum`.

Source: GMR19, §4.1, (4.2)–(4.4), pp.790–791. The transformed renewal equation is rigorously identified with a resolvent using convergence proved in advance.

### Simple pole and counting residue

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.6/pole` (theorem).

Near β choose holomorphic λ_s,P_s and R_s=L_s−λ_sP_s. Then (1−L_s)⁻¹=[λ_s/(1−λ_s)]P_s+(1−R_s)⁻¹. Equivalently it is (1−λ_s)⁻¹P_s+(1−R_s)⁻¹(1−P_s). The transform F(s)=s⁻¹(1−L_s)⁻¹1 has simple-pole coefficient B=h_β/(β|λ′_β|), a strictly positive C¹ function. F(s)−B/(s−β) extends holomorphically near every point on Re s=β.

Proof or construction:

1. Use PR=RP=0, R P=0. On range P the first identity acts as λ/(1−λ)+1=1/(1−λ); on ker P it is the remainder inverse. The remainder inverse is holomorphic near β because its radius is<1.
2. Expand 1−λ_s=−λ′_β(s−β)+O((s−β)²). Since ν_β1=1, P_β1=h_β. Division by s supplies β⁻¹.
3. At every other point of the boundary line strict Wielandt separation puts 1 in the resolvent set, and openness plus analytic inversion gives a local holomorphic continuation. No common strip width at arbitrarily large imaginary parts is asserted.

Acceptance: Evaluate the decomposition on h_s; the uncorrected source formula fails this test. The residue is not h_β itself.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.6/transform`, `ProbabilisticAndMetricNumberTheoryPartII:TO.4/perturbation`, `ProbabilisticAndMetricNumberTheoryPartII:TO.5/wielandt`, `ProbabilisticAndMetricNumberTheoryPartII:TO.5/pressure`.

Source: GMR19, §4.3, item (1), p.797. The perturbation decomposition must include the λ numerator or the complementary projection; this leaves the pole but changes the displayed exact identity.; LAL89, Proposition 7.2, (7.7), p.25; coefficient in Theorem 1 (2.5) p.9. The renewal coefficient contains the pressure derivative and the exponential abscissa. Formula (7.7) has the same full-remainder double-counting defect as GMR19; the node states the corrected identity.

### Uniform band-limited smoothing

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.6/smoothing` (theorem).

Let X be compact, a>0, α_x:ℝ→[0,∞) measurable, zero for t<0, with 0≤α_x(t)≤Ce^{at} uniformly for t≥0. Suppose its Laplace transform F is C(X;ℂ)-valued holomorphic on Re s>a and F(s)−B/(s−a) has a C(X)-valued holomorphic germ at every point of Re s=a, with B∈C(X;ℝ). For every even nonnegative Schwartz probability density k whose angular Fourier transform is smooth and compactly supported, ∫k(r−t)e^{−at}α_x(t)dt→B(x) uniformly in x as r→∞.

Proof or construction:

1. Such kernels exist: start with an even nonzero smooth compactly supported Fourier bump, inverse-transform it to ψ, and normalize k=|ψ|²/∫|ψ|². Its Fourier transform is a compactly supported smooth convolution. Supply the angular normalization ∫e^{−iξt}k(t)dt and inverse factor 1/(2π).
2. Damp the bounded g_x(t)=e^{−at}α_x(t) by e^{−εt} for t≥0. Fubini expresses convolution with k(r−t)+k(−r−t) using 2cos(rξ) times F(a+ε+iξ) and its real part.
3. Subtract the pole. In the real part it gives B·ε/(ε²+ξ²); its normalized mass tends to a delta at zero, giving B. The regular germ is smooth with a bounded C(X)-valued derivative on the fixed compact frequency interval. Integrate its oscillatory term by parts to get a uniform O(1/r) bound.
4. Let ε↓0 by the uniform bound on g and integrability of k. The extra convolution at −r tends uniformly to zero because g is zero on negative times and k has integrable tails. Only compact frequency intervals are used.

Acceptance: Prove convergence in the sup norm on X; pointwise Riemann–Lebesgue alone does not give this conclusion. No global high-frequency resolvent estimate is assumed.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.2/bilateral`, `mathlib:MeasureTheory.tendsto_integral_filter_of_dominated_convergence`, `mathlib:Real.tendsto_integral_exp_smul_cocompact`.

Source: LAL89, §8, proof of Theorem 1, (8.10)–(8.12), pp.30–32. The damped symmetric convolution, pole subtraction and compact-frequency integration by parts give uniform smoothing.

### Uniform renewal Tauberian adapter

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.6/uniform-tauberian` (theorem).

Under TO.6/smoothing, if each α_x is nondecreasing then sup_x|e^{−ar}α_x(r)−B(x)|→0 as r→∞. In the positive-B case this is a uniform relative asymptotic since min B>0. This is a uniform extension of the imported scalar simple-pole Laplace theorem, not a second scalar Tauberian theory.

Proof or construction:

1. For a small δ>0 choose a kernel concentrated in [−δ,δ], with tail mass<ε. The uniform bound on g makes the omitted tails≤Cε.
2. The smoothed quantity at r+δ bounds g_x(r) from below by (1−ε)e^{−2aδ}g_x(r), using monotonicity of α on [r,r+2δ]. The smoothed quantity at r−δ is at most e^{2aδ}g_x(r)+Cε, using [r−2δ,r].
3. Apply the uniform smoothed limit, then let ε,δ↓0. B is bounded, so these two inequalities squeeze uniformly. For a fixed x, the hypotheses also satisfy the supplier PoleBoundary with k=0,A=B(x)>0, verifying agreement of constants. If B=0 at a point the direct squeeze still applies.

Acceptance: Continuity of B is not used as a replacement for uniform smoothing. The assumed uniform exponential bound is indispensable to this proof.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.6/smoothing`, `ArithmeticDirichletSeriesPartII:HP.3/laplace-theorem`.

Source: LAL89, Lemma 8.2, p.30. Shifted concentrated kernels and monotonicity recover the unsmoothed limit uniformly.

### Uniform linear-semigroup counting theorem

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.6/count-asymptotic` (theorem).

For n≥3 and β=β(n), let B=h_β/(β|λ′_β|) with ν_β1=ν_βh_β=1. Then sup_{w∈Δ}|N(w,r)/(B(w)e^{βr})−1|→0 as r→∞. B is positive C¹ and satisfies L_βB=B. Pullback by y↦y/y_n gives a bounded positive degree-zero C¹ function on H_n with the same uniform asymptotic and Σ_a((γ_a y)_n/y_n)^{−β}B(γ_a y)=B(y).

Proof or construction:

1. Use the resolvent transform to supply the uniform adapter hypotheses with X=Δ, a=β and residue B. Local boundary holomorphy suffices because smoothing uses compact frequency supports.
2. The growth bound and monotone finite count supply the remaining real hypotheses. Positivity and compactness give min B>0, converting absolute normalized error to relative error.
3. The eigenrelation gives L_βB=B. Homogeneous normalization transfers it to H_n; C¹ there means the degree-zero function in affine/projective charts. No identification with an arithmetic Baragar exponent is used in this proof.

Acceptance: The unnormalized leading function B and the ν-normalized h_β are recorded separately.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.6/pole`, `ProbabilisticAndMetricNumberTheoryPartII:TO.6/uniform-tauberian`, `ProbabilisticAndMetricNumberTheoryPartII:TO.6/growth`.

Source: GMR19, Theorem 13 and (1.8), pp.759–761; §4.3 pp.796–797. This is the uniform linear orbit-counting target, with the Lalley normalization made explicit.

### Conformal measure characterization

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.6/conformal` (theorem).

For the projective action of every γ∈Γ, |Jac_wγ|=((γy)_n/y_n)^{−(n−1)}. Consequently β is the unique s>1 for which a Borel probability ν on Δ satisfies ∫f dν=Σ_a∫f(F_aw)|Jac_wF_a|^{s/(n−1)}dν for every continuous f. At β this probability is ν_β, uniquely. Its support is K. The exponent β is not asserted to be a Hausdorff dimension.

Proof or construction:

1. On the (n−1)-dimensional linear span of H, γ_i has determinant of absolute value one in the basis e_j+e_n. The projective quotient has dimension n−2: differentiating normalization divides the affine determinant by q^{dim+1}=q^{n−1}. Compose using the homogeneous cocycle.
2. The Jacobian weight is q_a^{−s}; absolute uniform convergence justifies the integral sum, identifying the equation with L_s*ν=ν.
3. Testing the positive h_s gives λ_s=1, forcing s=β. Conversely ν_β works, and RPF gives uniqueness.

Acceptance: The determinant exponent is n−1 although Δ has dimension n−2; no identification of β with dimension follows.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.0/branches`, `ProbabilisticAndMetricNumberTheoryPartII:TO.5/pressure`, `ProbabilisticAndMetricNumberTheoryPartII:TO.3/real-rpf`.

Source: GMR19, Theorem 10, Remarks 11–12 p.759; Lemma 44 p.797. The projective determinant converts the spectral eigenprobability into the stated conformal measure and characterizes its exponent.

## TO.7 — Gauss, Rauzy and dimensional comparisons

Dependencies: `ProbabilisticAndMetricNumberTheoryPartII:TO.0`, `ProbabilisticAndMetricNumberTheoryPartII:TO.1`, `ProbabilisticAndMetricNumberTheoryPartII:TO.4`, `ProbabilisticAndMetricNumberTheoryPartII:TO.5`, `ProbabilisticAndMetricNumberTheoryPartII:TO.6`, `ProbabilisticAndMetricNumberTheory:PM.4`.

### Parameter-dependent Gauss conjugacy

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.7/gauss` (theorem).

For n=3 use x=w₁/w₂∈[0,1], so w=(x/(1+x),1/(1+x)). Then F_A(x)=1/(x+A+1), q_A(x)=(x+A+2)/(x+1). For complex Re s>1 let M_s f(x)=exp(s log(1+x))f(x). It and its inverse are bounded on C¹([0,1]), and M_s⁻¹ L_s M_s=G_s, where G_sf(x)=Σ_{A≥0}(x+A+1)^{−s}f(1/(x+A+1)). The coordinate pullback is understood in this identity.

Proof or construction:

1. Substitute the n=3 branch formula and coordinate change. Branchwise, q_A^{−s}(1+F_A(x))^s/(1+x)^s=(x+A+1)^{−s}.
2. The multiplier and its derivative are bounded on [0,1]; its inverse has the same property. Uniform strong convergence permits summation of the branchwise identity. At s=2, G₂ agrees exactly with the real PM.4 density-transfer operator after complexification.

Acceptance: The GMR weight at x=0 is (A+2)^{−s}; the Gauss weight after conjugacy is (A+1)^{−s}.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.2/operator`, `ProbabilisticAndMetricNumberTheoryPartII:TO.0/pullback`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-map`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-branch-derivative`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-density-transfer`.

Source: GMR19, Example 34 p.791; Example 37 pp.792–793. The one-dimensional operator is compared branchwise with the Gauss operator, keeping the parameter multiplier explicit.

### Gauss normalization and C¹ spectral theorem

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.7/gauss-spectrum` (theorem).

For real s>1 the Gauss operator G_s on C¹([0,1]) has a simple positive leading eigenvalue and compact-parameter uniform spectral gap, transported from the general RPF theorem. At s=2, G₂(1/(1+x))=1/(1+x), so λ₂=1 and β(3)=2. The invariant Gauss probability density is 1/((1+x)log 2). The corresponding unnormalized GMR eigenfunction is (1+x)²/(1+x)=1+x=1/w₂; it is not necessarily ν₂-normalized.

Proof or construction:

1. Use the supplier telescoping identity to prove the eigenfunction calculation for G₂, and the supplier integral normalization for the probability density.
2. Conjugacy transfers positivity and the C¹ spectral gap. Since the transported positive eigenfunction has eigenvalue one, uniqueness of the real RPF eigenvalue and pressure zero gives β(3)=2.

Acceptance: Do not identify the raw eigenfunction 1/(1+x) with its probability normalization, nor 1+x with the normalized h₂.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.7/gauss`, `ProbabilisticAndMetricNumberTheoryPartII:TO.4/uniform-gap`, `ProbabilisticAndMetricNumberTheoryPartII:TO.5/pressure`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-density-telescope`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure`.

Source: GMR19, Example 37 and Theorem 39, pp.792–794. The n=3 C¹ spectral theorem follows by conjugacy; the Gauss density itself is imported from PM.4.

### Rauzy gasket comparison

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.7/rauzy` (comparison).

For n=4, in the basis e_i+e₄ of the homogeneous span, γ₁,γ₂,γ₃ have matrices [[0,1,0],[0,0,1],[1,1,1]], [[1,0,0],[0,0,1],[1,1,1]], [[1,0,0],[0,1,0],[1,1,1]]. After multiplying on the left by the permutations moving the final coordinate back to slot i, these are the three usual fully subtractive inverse matrices A_i, with row i all ones and other rows those of identity. Their normalized action on the full positive 2-simplex gives the Rauzy gasket IFS. Sorting coordinates gives precisely the ordered γ dynamics; the full gasket is the permutation-saturation of the ordered closed attractor, with the parabolic boundary points included through closure under acceleration.

Proof or construction:

1. For each i directly multiply its displayed matrix by the output permutation; check equality with A_i. Normalization commutes with coordinate permutations.
2. The full family {A_i} is equivariant under permutations. Sort the input and output to identify its quotient with the ordered branch system.
3. Decompose unaccelerated words into maximal γ₃-runs separated by γ₁ or γ₂. Infinite sequences with infinitely many separators are accelerated codes; tails with only γ₃ give parabolic boundary limits, already contained in the closed accelerated attractor by taking exponents to infinity.

Acceptance: Give the matrices and sorting/permutation comparison; equality of unsorted individual branches with sorted ones is not claimed.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.0/branches`, `ProbabilisticAndMetricNumberTheoryPartII:TO.1/attractor`.

Source: GMR19, Example 9, pp.757–758. The three matrices and permutation modification identify the Rauzy gasket example; the comparison uses the closed attractor convention.

### Numerical n=4 diagnostic

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.7/numeric` (application).

Use piecewise affine collocation on Δ₄ with vertices (0,0,1),(0,1/2,1/2),(1/3,1/3,1/3), both branch indices and A=0,…,B. Power iteration estimates the Perron eigenvalue of the resulting finite nonnegative matrix. A fresh diagnostic gives, for mesh m=16,B=100: λ(2.42)≈1.02201312, λ(2.44)≈1.00155870, λ(2.46)≈0.98166645; for m=32,B=300: 1.02398743,1.00333699,0.98326670 respectively. These support a crossing near 2.44, but are not certified enclosures of β or λ.

Proof or construction:

1. Use mesh points w=(j/(3m),i/(2m)+j/(3m),1−i/(2m)−2j/(3m)) with nonnegative integers i,j,i+j≤m. For each branch image convert back to coordinates u=2m(w₂−w₁),v=3mw₁, and linearly interpolate on the two triangles in each lattice square.
2. Build nonnegative row contributions q^{−s} times interpolation weights. Start f=1, repeatedly compute g=Lf and normalize by max g; stop when the maximum coordinate change is<10⁻¹¹ (20–21 iterations in these runs). The final normalization factor is the displayed finite-matrix estimate.
3. The explicit tail bound controls the omitted operator in C⁰, but without an interpolation error estimate and a spectral enclosure it does not certify the true eigenvalue. Retain the values, method and this limitation as an acceptance diagnostic, never as the proof of existence or uniqueness.

Acceptance: Repeat with a larger cutoff/mesh and reproduce the trend; record both discretizations, not an unsupported decimal for β.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.2/c0-bounds`, `ProbabilisticAndMetricNumberTheoryPartII:TO.5/pressure`, `ProbabilisticAndMetricNumberTheoryPartII:TO.7/rauzy`.

Source: GMR19, Theorem 2 discussion, §1 pp.753–755; Examples 9 and 37 pp.757,792–793. The source motivates the n=4 exponent; these numerical values are newly computed diagnostics, not a theorem extracted from that discussion.

### Monotonicity of the renewal exponent

Target `ProbabilisticAndMetricNumberTheoryPartII:TO.7/dimension-monotonicity` (theorem).

For n≥4, β(n)≥β(n−1), and therefore β(n)≥2 for all n≥3. The embedding Δ_{n−1}→Δ_n prepends a zero, and sends a=(A,j) to (A,j+1); it intertwines branches and preserves q and every word delay.

Proof or construction:

1. Check the embedding and index shift directly in the branch formula. The injective map of alphabets induces an injective map of words, giving N_n(ιw,r)≥N_{n−1}(w,r).
2. If β(n)<β(n−1), divide this inequality by e^{β(n−1)r} and apply the positive uniform leading constants, a contradiction. Use β(3)=2 as the base case.

Acceptance: The index shift is j↦j+1; a dimension comparison without a word injection is insufficient.

Direct prerequisites: `ProbabilisticAndMetricNumberTheoryPartII:TO.6/count-asymptotic`, `ProbabilisticAndMetricNumberTheoryPartII:TO.7/gauss-spectrum`, `ProbabilisticAndMetricNumberTheoryPartII:TO.0/branches`.

Source: GMR19, Remark 14, p.761. Compatible embeddings of the ordered cones compare their growth exponents.

## Source corrections and acceptance discipline

Independent review confirmed twelve findings and rejected E9 as a source-error claim. Version-specific locators and reasons follow; the packet records the source versions and file hashes.

- **E1 — confirmed** (Annals §4.2 p.794, coding-image compactness). Define K as the closure of that image. Confirmed at journal p.794. In n=3, the fixed points of branches A tend to the endpoint 0 in the Gauss coordinate; no infinite code with a finite first letter maps to that endpoint. Closing the coding image is necessary.

- **E2 — confirmed** (Annals §4.5 p.799, final p-series bound; extraction E8). Use 2^σ(n−2)Σ(A+3)^(−σ). Confirmed at journal p.799, not p.800. The bound q≥(A+3)/2 gives q^(−σ)≤2^σ(A+3)^(−σ). For n=3 and w=(1/2,1/2), q=(A+3)/2, so the printed factor 2 already fails when σ>1.

- **E3 — confirmed** (Annals Lemma 46 p.798; extraction E15). Use L_{Re s} for both nonnegative majorants. Confirmed: Lemma 46 orders a generally complex right side. Taking absolute values of each weight gives exactly the real operator L_{Re s} in both majorants.

- **E4 — confirmed** (Annals §4.3 p.797, exact resolvent decomposition; extraction E16). Use λ/(1−λ)P+(1−R)⁻¹, or (1−λ)⁻¹P+(1−R)⁻¹(1−P). Confirmed by applying the printed identity to the normalized eigenfunction: R h=0 makes the full remainder inverse contribute an additional h. Either correction stated in the node removes it.

- **E5 — confirmed** (Annals §4.3 p.797, leading renewal coefficient; extraction E16). Use B=h_β/(β|λ′_β|) when ν_β1=ν_βh_β=1. Confirmed relative to Theorem 39’s probability and eigenfunction normalizations. The simple zero 1−λ_s=−λ′_β(s−β)+O((s−β)²) and the prefactor 1/s give B=h_β/(β|λ′_β|). Theorem 13 itself allows this rescaling.

- **E6 — confirmed** (Annals (5.5) p.801 and (5.9) p.802; arXiv supplement corresponding formulas; extraction E17). Use (3+b−2w_j)² and (5+b−4w_{n−2})² respectively. Confirmed: direct quotient differentiation and the arXiv Jacobians have squared denominators. Exact rational composite-Jacobian checks support all ten corrected bounds, including boundary points.

- **E7 — confirmed** (Annals §5.1 p.801; arXiv (5.1) p.44; extraction E9/E17). Use w_{n−1}≥(1+w_{n−2})/2 on cusp; (5.1) applies through i=n−2. Confirmed with version distinction. Equality belongs to the closed cusp (for example n=4, w=(1/5,1/5,3/5)); the arXiv strict index range omits i=n−2, whereas the Annals list includes it.

- **E8 — confirmed** (Annals Table 1 p.804 and arXiv §5.3 derivative table; extraction E18). Use the coordinate of that row, w₃ when it precedes the deleted index. Confirmed in the journal table. The derivative in the row for a surviving coordinate w_k is w_k/(2−w_i)², so the third such row cannot repeat the numerator w₂.

- **E9 — rejected** (Annals Proposition 42 p.795; arXiv Proposition 40 p.38). Make the convention explicit as nonzero nonnegative; no correction to the fixed-ray argument is needed. Rejected as an allegation that the source explicitly requires strict coordinatewise positivity. It displays v₊>0 but does not say all coordinates are strictly positive; this notation can mean a nonzero element of the positive cone. The zeros are displayed openly and the proof uses a boundary fixed ray correctly. Keep the node’s explicit nonnegative convention.

- **E10 — confirmed** (arXiv v3 §5.3, proof of (5.5), p.49). For ordinary columns use C₁≥C_k because −2w₁≥−2w_k; retain −2w₁ in the displayed numerator. If j=1, use the same expression as a common upper bound, not an equality for the exceptional column. Confirmed against arXiv v3 p.49. The ordinary-column formula decreases with w_k, so the comparison sign is reversed. For j=1 the same expression is a common upper bound rather than the actual exceptional-column sum; the final 4/5 bound remains correct.

- **E11 — confirmed** (HEN95, §5, Proposition 5.1(v) and its proof, p.19). For bounded A and nonempty relatively compact K, χ(A+K)=χ(A). K=∅ makes A+K empty, so the assertion fails for the unit ball of an infinite-dimensional Banach space. The source’s proof explicitly assumes the compact set nonempty.

- **E12 — confirmed** (LAL89, §7, Proposition 7.2, (7.3)–(7.7), p.25). Use λ/(1−λ)P+(1−R)⁻¹, or (1−λ)⁻¹P+(1−R)⁻¹(1−P). On h, Rh=0 and Ph=h, so the printed sum gives (1−λ)⁻¹h+h instead of (1−λ)⁻¹h. The same error appears in GMR19 and is already corrected in TO.6/pole.

- **E13 — confirmed** (LAL89, §7, paragraphs preceding Proposition 7.2 and Proposition 7.3, p.25). Use upper semicontinuity, or choose a finite power whose norm is strictly below the desired power bound and preserve that inequality by continuity. Lower semicontinuity does not keep nearby values below a given bound. The finite-power Gelfand argument in TO.4/perturbation supplies the required upper bound; local resolvent openness handles the other boundary points.

These findings are stated in our own words. A bounded search of the journal record, Magee’s publication list, arXiv history, Numdam record and Lalley’s author page found no separate correction; the arXiv index-range correction already appears in Annals. No claim of novelty is made. The contraction estimates are exact mathematical obligations; the reproduced n=4 collocation values remain uncertified diagnostics.

## Suggested file and planning status

The suggested file uses existing native carriers only. Heavy C¹, cone, spectral and coding constructions stay as the explicit targets above. It contains real-bodied finite-coordinate formulas and pointwise weights, statements of basic branch and Gauss identities, and an end-counting milestone phrased in native functions. It does not assert that a totalized infinite sum is a bounded operator without convergence. The omission ledger in the packet records the missing carriers.

The packet is complete at target level. TO.0–TO.2 are closed; TO.3–TO.7 are planned because G1 and the finite-matrix compatibility request must be reconciled at packaging. There is no missing mathematical target or second job claimed by this submission. Independent review accepted all 40 targets after checking the cone-to-C¹ norm argument, Appendix-A spectral decomposition, uniform Tauberian squeeze, freeness and Rauzy permutation comparison. All 17 baseline citations were confirmed. The suggested Lean file elaborated at the pinned build with only sorry warnings. G1 remains a packaging dependency-index task: import the existing upstream Brouwer owner without duplicating it; reconcile the finite-matrix specialization with OptimalTransport.

## Routed-item crosswalk

| Extraction item | Targets |
| --- | --- |
| 24 | `TO.0/simplex`, `TO.0/branches`, `TO.0/words-count`, `TO.7/rauzy` |
| 25 | `TO.0/words-count` |
| 26 | `TO.6/count-asymptotic` |
| 27 | `TO.6/conformal` |
| 28 | `TO.7/dimension-monotonicity` |
| 29 | `TO.0/branches`, `TO.0/words-count`, `TO.2/operator`, `TO.6/transform` |
| 32 | `TO.2/c0-bounds`, `TO.3/eigenprobability` |
| 33 | `TO.3/schauder` |
| 34 | `TO.0/c1`, `TO.0/pullback`, `TO.2/two-norm`, `TO.2/holomorphic`, `TO.3/itm` |
| 35 | `TO.3/cones`, `TO.3/cone-rpf`, `TO.3/real-rpf`, `TO.4/uniform-gap` |
| 36 | `TO.1/attractor` |
| 37 | `TO.5/wielandt` |
| 38 | `TO.5/nonlattice`, `TO.5/fixed-delays` |
| 39 | `TO.5/pressure` |
| 40 | `TO.4/simple-data`, `TO.4/perturbation`, `TO.6/pole` |
| 41 | `TO.6/growth`, `TO.6/pole`, `TO.6/smoothing`, `TO.6/uniform-tauberian` |
| 42 | `TO.1/contraction` |
| 43 | `TO.1/regions`, `TO.1/ten-bounds`, `TO.1/contraction` |
| 44 | `TO.7/gauss` |
| 45 | `TO.7/gauss-spectrum` |
| 46 | `TO.0/c1`, `TO.0/pullback` |
| 47 | `TO.2/bilateral`, `TO.6/transform` |

## Sources read

- **GMR19**. Alex Gamburd, Michael Magee and Ryan Ronan, *An asymptotic formula for integer points on Markoff–Hurwitz varieties*, Annals of Mathematics 190(3) (2019), 751–809. [Public source](https://annals.math.princeton.edu/wp-content/uploads/annals-v190-n3-p02-s.pdf). Read 2026-10-18: §1, pp.751–761, definitions, examples and targets; §§4.1–4.5, pp.790–800, renewal and spectral arguments; §§5.1–5.2, pp.800–804, core/cusp and ten bounds. SHA-256 `c5e7ebb5322cdfd455735f13c2b420dba318089b382a3f78f40628efc838215a`.

- **GMRv3**. Alex Gamburd, Michael Magee and Ryan Ronan, *An asymptotic formula for integer points on Markoff–Hurwitz varieties, arXiv version 3*, arXiv:1603.06267v3 (2018); numbering differs from journal. [Public source](https://arxiv.org/pdf/1603.06267v3). Read 2026-10-18: §5.3, pp.46–53, derivative computations (5.2)–(5.10). SHA-256 `965e264e260ca42bbaa5a65f789e5cc6eb6117d70d7219603a3b855d29ba997a`.

- **LAL89**. Steven P. Lalley, *Renewal theorems in symbolic dynamics, with applications to geodesic flows, non-Euclidean tessellations and their fractal limits*, Acta Mathematica 163 (1989), 1–55. [Public source](https://www.stat.uchicago.edu/~lalley/Papers/acta.pdf). Read 2026-10-18: §7, pp.23–27, resolvents and the pole; §8, pp.27–32, uniform growth, smoothing and monotonicity. SHA-256 `f6f04148aa28d43c1684a49b746fb6ecd6393835de35ce9d487e6df952a83f55`.

- **LIV95**. Carlangelo Liverani, *Decay of correlations*, Annals of Mathematics 142 (1995), 239–301; author preprint dated 1993; locators use preprint pages. [Public source](https://carlangelo-liverani.github.io/Lavori/live9502.ps.gz). Read 2026-10-18: §1, Theorem 1.1 and Lemma 1.3, preprint pp.3–6; §2, Lemmas 2.1–2.3 and Theorem 2.5, preprint pp.7–12. SHA-256 `8df257369551b64632adaa3c55e53f0d484931bd5b17d1b952a8223c0535ac18`.

- **MN75**. Sidney A. Morris and E. S. Noussair, *The Schauder–Tychonoff fixed point theorem and applications*, Matematický časopis 25(2) (1975), 165–172; author-hosted copy; locators use printed page numbers. [Public source](https://www.sidneymorris.net/Morris34.pdf). Read 2026-10-18: §§1–2, pp.165–168, compact-image fixed point theorem and finite-dimensional approximation. SHA-256 `81ca799d39a2eeb7a9cbb41df1d7c0ebe77999f922db5cbb16768ca01bc45e35`.

- **KLO19**. Benoît R. Kloeckner, *Effective perturbation theory for simple isolated eigenvalues of linear operators*, Journal of Operator Theory 81(1) (2019), 175–194. [Public source](https://jot.theta.ro/jot/archive/2019-081-001/2019-081-001-008.pdf). Read 2026-10-18: Introduction and Definition 1.1, pp.175–178; Corollary 1.13 p.182; §2.2 pp.183–184; §3.1–3.4, pp.185–189, persistence and derivatives. SHA-256 `c21ab145cd98ca11a01dc4c700bc203a055917fdd1ff700406df27a996ba3788`.

- **HEN95**. Hubert Hennion, *Quasi-compacité. Cas des noyaux lipschitziens et des noyaux markoviens*, Publications mathématiques et informatiques de Rennes (1995), fascicule 2, pp.1–50. [Public source](https://www.numdam.org/item/PSMIR_1995___2_A6_0.pdf). Read 2026-10-18: §§1,3, pp.2–3,11–13, spectral splitting and two-norm criterion; §5 pp.19–22, ball-cover measure and finite-cover proof; Appendix A pp.43–46, spectral decomposition proof. SHA-256 `a574a1be8a917c8290ca34444e22a0b5fecf4f98f0071b034203ef494a002490`.
