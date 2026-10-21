# Exponential sums, decoupling and the circle method

This roadmap builds the analytic interfaces between finite oscillation, Fourier counting and Diophantine counts. Its first route takes completion and differencing to Vinogradov mean values and decoupling, then to classical and optimized Waring asymptotics. Its prime route takes the von Mangoldt function through Vaughan’s identity, bilinear estimates and progression major arcs to the three-prime asymptotic. Its quadratic route keeps the weight, dimension and coefficient dependence visible, including expanding regions and moving-plane Markoff variance. Its geometric route gives uniform determinant bounds and a concrete handoff to binary-form arithmetic statistics.

This is a complete **target-level planning pass**, as defined in PROTOCOL §0: every target of ES.0–ES.5 has an exact contract and a prerequisite chain ending in a library declaration, another owner, a requested stage, or an explicit gap. All six layers are **planned**; none is **closed**. The gaps below describe work required to close them. Every node remains `unchecked`. The suggested file contains planning signatures and examples; its admitted proofs are not an implementation.

The accepted RS-03 ownership decisions govern these layers. Finite-field complete character estimates stay in **FiniteFieldsAndCharacterSums FF.1–FF.2**, finite abelian Fourier theory in **AbstractHarmonicAnalysis AC.0**, divisor estimates in **AnalyticNumberTheory AN.5**, and the Vaughan identity and coefficient-energy machinery in **SieveMethodsAndPrimePatterns SV.2**. Primitive-character reduction and generic CRT are native library inputs. The ordinary Kloosterman owner is **QSeriesPartitionsAndMockModularForms QM.3**. Quadratic maximality, integral lattices and isometries are imported from the current **IntegralLattices** and **OrthogonalSpinGroups** roadmaps; their stabilizer-density statements do not identify representation densities.

The pin used for prototypes is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` with Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Current TauCetiRoadmap main `070dc2becd74419e76303ede84b465ed4a69461f` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were also screened. **EffectiveBounds** and **OrthogonalL2Bases** provide established analytic infrastructure. Their existing constructions are cited, not planned again. The native current lattice interfaces that are not matched precisely remain identified supplier gaps.

## Conventions and exact endpoint ranges

Write e(t)=exp(2πit). The real torus is the native additive circle ℝ/ℤ with probability Haar measure; products use its product probability measure. Fourier extraction has a negative target character. Finite sums use the displayed positive interval or the displayed shifted integer interval, never an unstated symmetric cutoff. Ordered tuples remain ordered: neither Waring nor prime triples are divided by a permutation factorial.

Polynomial equations use native integral multivariate polynomials and their evaluations in quotient rings, ℝ, ℚ or its algebraic closure. For n variables and r equations, the residue mass at modulus q is q^{−(n−r)} times the raw solution count; the exponent is an integer and redundant equations do not change it to rank. P-adic density and real density are native limit choices, interpreted as limits only after convergence is proved. A real symmetric tube of width ε in each of r equations has normalization (2ε)^{−r}. A totalized infinite sum, product or limit alone is not a convergence or positivity theorem.

Vinogradov’s bound is J_{s,k}(N) ≪_{s,k,ε} N^ε(N^s+N^{2s−k(k+1)/2}). The degree-one case and the parabola analytic base are separate contracts. The BDG multiscale proof imports its exact Brascamp–Lieb, plate Kakeya and restriction inputs; a title or a generic mean-value assertion does not discharge those inputs.

The classical Waring endpoint here has k≥3 and s≥2^k+1. The optimized endpoint has k≥3 and an integer 1≤t<k with

s > k² − t(k−t−1)/(k+1−t),   s≤k(k+1).

Its minor arcs use q≤N/(2k) and |qα−a|≤N^{1−k}/(2k), and its positive error margin is specified below. These are separate major/minor estimates, not a substitution into the classical result. The local lower bound uses s≥2k+1 for odd k and s≥4k for even k. All existence statements refer to sufficiently large targets in the actual analytic and local range.

The prime endpoint counts ordered Λ-weighted triples and has main term N²/2 times the ternary prime series, with arbitrary logarithmic saving and ineffective major-arc constants. Removing higher prime powers gives representation of sufficiently large odd integers by three primes. This argument supplies no effective numerical threshold for the small odd integers.

The fixed quadratic compact-weight theorem has n≥5, positive target m and scaling x/√m, with error m^{(n−1)/4+ε}. Niedermowwe’s fixed-form, fixed nonzero-target theorem has n≥4 and a different Gaussian/expanding-box scale. Neither statement supplies the uniform n=4 moving-coefficient Markoff pair estimate. The Birch single-form endpoint requires n−dim{∇F=0}>(d−1)2^d and nonsingular local points for positivity. These variable, degree and singular-locus hypotheses precede every claimed asymptotic.

Markoff counts retain the tentacled sectors and their parity lattice. The transformation s₁=2x₁+ax₂, s₂=x₂ has determinant 2 and image condition s₁−as₂ even. The positive sector has area (¼log(3/2))/√(a²−4) in transformed coordinates. The negative-target argument uses its distinct sector; its precise uniform interface is an open gap. Almost-all representation means an o(K) exceptional count among admissible |k|≤K. It does not assert that every locally soluble fiber has an integral point.

Projective counts use one primitive integral representative, with first nonzero coordinate positive. Coefficient-uniform determinant estimates are upper bounds. The geometric surface theorem removes every contained geometric line. The binary-form transfer keeps fixed-form constants and Roth’s possible ineffectivity. Upper bounds do not imply a positive asymptotic.

## Source and ownership boundaries

The source statements below are written in the worker’s own words, with theorem, section and page locators. Source versions and hashes are in the packet. Selected portions are read for the targets they supply; an external proof that was not acquired is named as a gap. Historical checkpoint inspections remain provenance, and do not become fresh whole-source reading claims.

The Bennett–Siksek route retains ambient moduli separately from primitive conductors and uses the corrected divisor supplier. Burgess supplies the finite estimate used by Duke–İmamoğlu–Tóth, Proposition 2, pp.968–969; the resulting Dirichlet L-function bound belongs to AN. The Skorobogatov–Sofos route supplies both Dirichlet kernels, including the one-sided degree-one repair. Browning–Sawin supplies only its routed ES.0–ES.1 interfaces. Its independent nonarchimedean lattice Part II and early polynomial-box/intersection prefix have no published identifiers in this snapshot, so their exact statements are recorded as supplier gaps without invented ids. The late mapping-space application is never imported back into ES.0.

Ghosh–Sarnak’s reviewed extraction corrections are retained in the local-density and parity conventions. The higher erroneous explicit cases of Appendix B.12(3)–(4) are not used; the specified convergence and positivity still need their derivations. Appendix A’s announced fullness assertions and power-law conjectures are identified as unproved claims and receive no Lean theorem or axiom. The sum-of-three-cubes example cannot have its printed h=3, q=0: a two-term linear-times-quadratic decomposition gives h≤2, and the line (t,1−t,0) gives q≥1. The suggested file proves those two elementary identities.

Assing’s Theorem 8.6, p.77, displays a cube of scale N with a prefactor N^{−t²}. The improved-Hua argument needs scale N^t. The smaller displayed cube is insufficient for that transfer; this is a scale/proof gap, not a counterexample to the weaker displayed upper bound. Bourgain–Demeter’s nondegenerate-curve Theorem 1.4, p.3, gives p≤4t−2 and does not prove the required critical p=t(t+1) transfer. That proof remains explicit.

The remaining source findings, including the degree-two prime-power exception and the determinant logarithmic-height boundary, are listed in the source-issues appendix. Statements use the corrected conventions, with version scope preserved.


## ES.0 — Oscillation and finite sums

This layer preserves the incoming conductor/CRT and finite q–van der Corput chain and connects it to completion, real derivative bounds, stationary phase, Burgess and smooth-modulus character cancellation. Its function-field polarization is an analytic counting interface; the general lattice and geometric theories remain external owners. The mean-value Weyl improvement is distinct from the classical differencing exponent.

**Atlas planets:** Weyl inequality; Finite completion; Van der Corput B process; Burgess character bound; Graham–Ringrose bound; Polar forms.

**Coverage:** planned. The exact contracts follow; stage-specific refinements are listed after them.


<a id="es0-bounded-divisor-power"></a>

### The bounded squared divisor factor

Contract `ExponentialSumsAndCircleMethod:ES.0/bounded-divisor-power` (lemma).

For q>0 and natural 1≤R and r≤R, let C≥1 and suppose τ(q)≤C q^(1/(4R²)), where τ(q)=card(q.divisors). Then τ(q)^(r²)≤C^(R²) q^(1/4). All powers with nonintegral exponents are real powers.

**Additional hypotheses:** q is natural and positive; R,r are natural; R≥1; r≤R; C is real and C≥1. The displayed divisor estimate is a hypothesis furnished by AN.5..

**Construction or proof route.** The positive integer q satisfies q≥1, so C q^(1/(4R²))≥1. Raise the nonnegative bound for τ(q) to r². Since r²≤R², increase the exponent of the upper bound from r² to R², not the exponent of a base below one. Distribute the ordinary power and use the real-power multiplication law: (q^(1/(4R²)))^(R²)=q^(1/4). R≥1 ensures the denominator is nonzero. This keeps the entire factor C^(R²).

**Direct prerequisites:** `mathlib:pow_le_pow_left₀`; `mathlib:pow_le_pow_right₀`; `mathlib:Real.one_le_rpow`; `mathlib:Real.rpow_natCast`; `mathlib:Real.rpow_mul`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.


<a id="es0-large-conductor-divisor-saving"></a>

### Strict saving in the divisor factor

Contract `ExponentialSumsAndCircleMethod:ES.0/large-conductor-divisor-saving` (lemma).

Under bounded-divisor-power’s hypotheses, if q>1 and C^(4R²)<q, then τ(q)^(r²)<q^(1/2). The constant and strict threshold cannot be discarded.

**Additional hypotheses:** The same q,R,r,C and divisor input as bounded-divisor-power; q>1; C^(4R²)<q..

**Construction or proof route.** Raise C^(4R²)<q to the positive real exponent 1/4. Natural-to-real power compatibility gives C^(R²)<q^(1/4). Multiply this strict inequality by q^(1/4)>0 and combine with bounded-divisor-power. Use q^(1/4)q^(1/4)=q^(1/2). A threshold equality gives only a non-strict conclusion from these hypotheses.

**Direct prerequisites:** [The bounded squared divisor factor](#es0-bounded-divisor-power); `mathlib:Real.rpow_lt_rpow`; `mathlib:Real.rpow_mul`; `mathlib:Real.rpow_natCast`; `mathlib:Real.rpow_add`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.


<a id="es0-large-conductor-explicit-divisor-threshold"></a>

### An explicit large-conductor divisor threshold

Contract `ExponentialSumsAndCircleMethod:ES.0/large-conductor-explicit-divisor-threshold` (theorem).

Let R≥1 and r≤R be natural and choose B∈ℕ with exp(4R²)≤B. Put C=max(1,((1/(4R²)) log 2)⁻¹)^B. For real k>max(1,(C^(4R²))^(32/7)) and positive natural q with k^(7/32)≤q, one has τ(q)^(r²)<q^(1/2).

**Additional hypotheses:** R,r,B are natural; R≥1; r≤R. The displayed C is a local expression, not a new carrier or unspecified constant..

**Construction or proof route.** Take ε=1/(4R²)>0. The existing AN.5 explicit-divisor-subpower-bound, with 1/ε=4R² and the supplied B, gives τ(q)≤Cq^ε and C≥1. From k>(C^(4R²))^(32/7), strict real-power monotonicity at exponent 7/32 gives k^(7/32)>C^(4R²). Compose with the lower bound for q. Since k>1, the same positive power gives q>1. Invoke large-conductor-divisor-saving. B may be any certified natural upper bound.

**Direct prerequisites:** [Strict saving in the divisor factor](#es0-large-conductor-divisor-saving); `AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound`; `mathlib:Real.rpow_lt_rpow`; `mathlib:Real.rpow_mul`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.


<a id="es0-large-conductor-eventual-divisor-saving"></a>

### One divisor threshold for the bounded factor family

Contract `ExponentialSumsAndCircleMethod:ES.0/large-conductor-eventual-divisor-saving` (theorem).

For every real c>0 there exists a natural K≥2 such that, for every natural k≥K, positive natural q with k^(7/32)≤q, and natural r with r<10c+2, one has τ(q)^(r²)<q^(1/2). The same K works for all permitted q and r.

**Additional hypotheses:** c>0. Natural k,q,r; q>0. The factor-count hypothesis is an inequality after casting r to ℝ..

**Construction or proof route.** Choose a natural R≥max(1,10c+2) using exists_nat_ge; then every permitted r satisfies r≤R and R≥1. Choose natural B≥exp(4R²), define C by the explicit threshold node, and choose a natural K strictly larger than max(1,(C^(4R²))^(32/7)). For k≥K all the explicit threshold hypotheses hold. Apply large-conductor-explicit-divisor-threshold; the choices R,B,C,K depend only on c, not on q or r. The arithmetic bounded-factor-count node supplies r<10c+2 in the source application. No squarefreeness is needed for this divisor estimate.

**Direct prerequisites:** [An explicit large-conductor divisor threshold](#es0-large-conductor-explicit-divisor-threshold); [Factor count with two exceptional blocks](#es0-bounded-factor-count); `mathlib:exists_nat_ge`; `mathlib:exists_nat_gt`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.


<a id="es0-graham-ringrose-saving-kernel"></a>

### The numerical Graham–Ringrose saving factor

Contract `ExponentialSumsAndCircleMethod:ES.0/graham-ringrose-saving-kernel` (lemma).

For real k≥0, q>0, t≥0 and S, and natural r, if t≤q^(1/2) and S≤2k(t/q)^(2^(−r)), then S≤2k/q^(2^(−r−1)). This is a numerical implication; an analytic estimate for a character sum is not a conclusion.

**Additional hypotheses:** k,q,t,S are real; k≥0; q>0; t≥0; r is natural. The nested exponent 2^(−r) is a real power, not natural subtraction..

**Construction or proof route.** Divide t≤q^(1/2) by q>0 to get t/q≤q^(−1/2). Both sides are nonnegative. Raise to the positive exponent 2^(−r), then multiply by 2k≥0. Use (−1/2)2^(−r)=−2^(−r−1) and the native negative-real-power law. In the application t=τ(q)^(r²); the antecedent S-bound must still come from the external analytic theorem with interval length k/2.

**Direct prerequisites:** `mathlib:Real.rpow_le_rpow`; `mathlib:Real.rpow_pos_of_pos`; `mathlib:Real.rpow_mul`; `mathlib:Real.rpow_sub`; `mathlib:Real.rpow_neg`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.


<a id="es0-large-conductor-denominator-conversion"></a>

### Converting the modulus saving to the interval scale

Contract `ExponentialSumsAndCircleMethod:ES.0/large-conductor-denominator-conversion` (lemma).

For real k>0, q≥k^(7/32), S, and natural r, the bound S≤2k/q^(2^(−r−1)) implies S≤2k^(1−(7/32)2^(−r−1)).

**Additional hypotheses:** All bases are positive: k>0 and q≥k^(7/32)>0; r is natural..

**Construction or proof route.** Raise q≥k^(7/32) to the positive exponent 2^(−r−1), giving q^(2^(−r−1))≥k^((7/32)2^(−r−1)). Use antitonicity of division by a positive denominator while retaining the nonnegative numerator 2k. Rewrite k/k^d=k^(1−d) with d=(7/32)2^(−r−1). No integer floor is introduced into the real interval length.

**Direct prerequisites:** `mathlib:Real.rpow_le_rpow`; `mathlib:Real.rpow_mul`; `mathlib:Real.rpow_sub`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.


<a id="es0-large-conductor-exponent-margin"></a>

### Margin above Bennett–Siksek’s stated exponent

Contract `ExponentialSumsAndCircleMethod:ES.0/large-conductor-exponent-margin` (lemma).

For c>0 and natural r<10c+2, put γ=2^(−10c−6) and d=(7/32)2^(−r−1). Then d>(7/4)γ. In particular the exponent margin d−γ exceeds (3/4)γ>0.

**Additional hypotheses:** c is real and positive; r is natural with its stated strict real upper bound; γ and d are explicit real expressions..

**Construction or proof route.** The bound on r gives −r−1>−10c−3. Strict monotonicity of the base-two real exponential gives 2^(−r−1)>2^(−10c−3). Write 2^(−10c−3)=8·2^(−10c−6)=8γ and multiply by 7/32. Conclude d>(7/4)γ and subtract γ. This identifies the slack needed to absorb the factor 2; it does not suppress that factor.

**Direct prerequisites:** `mathlib:Real.rpow_lt_rpow_of_exponent_lt`; `mathlib:Real.rpow_add`; `mathlib:Real.rpow_pos_of_pos`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.


<a id="es0-large-conductor-constant-absorption"></a>

### Absorbing the remaining factor two

Contract `ExponentialSumsAndCircleMethod:ES.0/large-conductor-constant-absorption` (lemma).

For real k≥1, γ>0, d≥(7/4)γ and S≤2k^(1−d), if k≥2^(4/(3γ)), then S≤k^(1−γ).

**Additional hypotheses:** The threshold is non-strict; the bases and exponent γ are positive. No character or modulus hypothesis is needed in this numerical lemma..

**Construction or proof route.** Raise k≥2^(4/(3γ)) to exponent 3γ/4 to obtain k^(3γ/4)≥2. Multiply by k^(1−d)>0. The resulting power is k^(1−d+3γ/4). Since d≥7γ/4, its exponent is at most 1−γ; monotonicity in the exponent for k≥1 proves the claim.

**Direct prerequisites:** `mathlib:Real.rpow_le_rpow`; `mathlib:Real.rpow_mul`; `mathlib:Real.rpow_add`; `mathlib:Real.rpow_le_rpow_of_exponent_le`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.


<a id="es0-large-conductor-numeric-threshold"></a>

### Uniform conditional large-conductor cancellation

Contract `ExponentialSumsAndCircleMethod:ES.0/large-conductor-numeric-threshold` (theorem).

For every c>0, put γ=2^(−10c−6). There exists a natural K≥2 such that for all natural k≥K, q>0 and r<10c+2 with k^(7/32)≤q, and every real S satisfying S≤2k(τ(q)^(r²)/q)^(2^(−r)), one has S≤k^(1−γ). The analytic inequality for S is an explicit premise, not a proved character-sum estimate.

**Additional hypotheses:** Natural k,q,r; c>0; q>0; the displayed lower bound and factor-count bound. S is real; γ is local notation..

**Construction or proof route.** Take K₁ from large-conductor-eventual-divisor-saving. Choose a natural K₂≥2^(4/(3γ)), and let K=max(K₁,K₂). Positivity of γ follows from the positive base two. For k≥K, the divisor factor is strictly below q^(1/2). Apply graham-ringrose-saving-kernel to the assumed analytic-size inequality, with t=τ(q)^(r²). Apply large-conductor-denominator-conversion. The source exponent margin gives d≥7γ/4, and large-conductor-constant-absorption removes the factor 2. All threshold choices depend only on c. In the intended application S is the norm of the original product-character sum over k/2<m≤k. Proving its displayed premise still requires the exact CRT character factors and the complete Graham–Ringrose proof; this theorem does not close Proposition 8.2.

**Direct prerequisites:** [One divisor threshold for the bounded factor family](#es0-large-conductor-eventual-divisor-saving); [The numerical Graham–Ringrose saving factor](#es0-graham-ringrose-saving-kernel); [Converting the modulus saving to the interval scale](#es0-large-conductor-denominator-conversion); [Margin above Bennett–Siksek’s stated exponent](#es0-large-conductor-exponent-margin); [Absorbing the remaining factor two](#es0-large-conductor-constant-absorption); `mathlib:exists_nat_ge`; `mathlib:Real.rpow_pos_of_pos`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.


<a id="es0-smooth-divisor-window"></a>

### Divisor in a smooth-modulus window

Contract `ExponentialSumsAndCircleMethod:ES.0/smooth-divisor-window` (lemma).

Let T > 1 be real and N a natural number with T ≤ N. If every prime p dividing N satisfies p ≤ T², then there is a natural divisor d of N with T ≤ d ≤ T².

**Additional hypotheses:** N is automatically positive. Squarefreeness is not required for this divisor-extraction step. Bounds on natural numbers are comparisons after casting to ℝ..

**Construction or proof route.** Use strong induction on N. Since N > 1, Nat.ne_one_iff_exists_prime_dvd supplies a prime p dividing N. If p ≥ T, choose d = p; the smoothness hypothesis gives p ≤ T². If p < T, write N = pA with A = N div p < N. Every prime divisor of A divides N. If A ≥ T, apply the induction hypothesis to A and compose divisibility. If A < T, then N = pA ≤ T². Choose d = N, which still satisfies N ≥ T. This proves the window without an ordering of the prime factors or a new smooth-number predicate.

**Direct prerequisites:** `mathlib:Nat.ne_one_iff_exists_prime_dvd`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, printed pp.377–378, Case 1, factor conditions (a)–(c). Worker-derived extraction lemma exposing the arithmetic behind the asserted grouping of prime factors; not a separately numbered theorem of the source.


<a id="es0-squarefree-modulus-blocks"></a>

### Pairwise-coprime bounded blocks of a squarefree modulus

Contract `ExponentialSumsAndCircleMethod:ES.0/squarefree-modulus-blocks` (theorem).

Let T > 1, let N be squarefree, and suppose every prime divisor p of N is at most T². There exist a list B of natural numbers and a residual integer u with 0 < u < T, u·∏B = N, every b in B in [T,T²], the entries of B pairwise coprime, and gcd(u,∏B) = 1.

**Additional hypotheses:** The list and residual use the existing List, product, Squarefree and Nat.Coprime carriers. No new factorization object is defined.; N = 1 is allowed and gives B empty, u = 1. The residual may equal one. Since T > 1, every listed block exceeds one..

**Construction or proof route.** Use strong induction on N. Squarefreeness implies N ≠ 0. If N < T, take the empty list and residual N. Otherwise extract d in [T,T²] by ES.0/smooth-divisor-window and write N = dA, A = N div d < N. Nat.squarefree_mul_iff supplies squarefreeness of A and gcd(d,A) = 1. Prime-factor bounds pass to A, so apply the induction hypothesis to obtain A = u·∏B. Prepend d. The product identity follows by associativity and commutativity. From gcd(d,u·∏B) = 1 obtain coprimality with u and with each member of B using Nat.coprime_list_prod_right_iff. These give pairwise coprimality of the enlarged list and coprimality of u with its product. If N ≥ T the list cannot be empty, because the product identity would force N = u < T. Each block and the residual divide N; hence they inherit squarefreeness and, when N is odd, oddness.

**Direct prerequisites:** [Divisor in a smooth-modulus window](#es0-smooth-divisor-window); `mathlib:Nat.squarefree_mul_iff`; `mathlib:Nat.coprime_of_squarefree_mul`; `mathlib:Nat.coprime_list_prod_right_iff`; `mathlib:Squarefree.squarefree_of_dvd`; `mathlib:Odd.of_dvd_nat`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, printed pp.377–378, Case 1, factor conditions (a)–(e). Makes the bounded prime-block grouping and its single residual explicit. It permits an empty list instead of assuming every family has a last block.


<a id="es0-bounded-crt-modulus-blocks"></a>

### Bounded CRT modulus blocks

Contract `ExponentialSumsAndCircleMethod:ES.0/bounded-crt-modulus-blocks` (theorem).

Let T ≥ 8 and a,Q,R be natural numbers with 0 < a ≤ 8, Q and R squarefree, Q odd, Q ≥ T, gcd(Q,R) = 1 and gcd(a,QR) = 1. Suppose every prime divisor of Q or R is at most T². Then there exist q and a list B such that q divides Q, q is odd and squarefree, T ≤ q ≤ T², the product of q::B is aQR, its entries are pairwise coprime and all in (1,T²], and at most two entries of B are less than T.

**Additional hypotheses:** This is a pure modulus-packing theorem. In the intended application a is the bounded 2-primary factor of the primitive conductor, Q its odd part, and R the excluded-prime product. The theorem does not prove that a given character has such a conductor decomposition.; R = 1 is explicitly permitted. Unit factors are removed. The distinguished factor comes from Q, not from the principal exclusion modulus..

**Construction or proof route.** Apply ES.0/squarefree-modulus-blocks separately to Q and R, obtaining Q = u·∏U and R = v·∏V with 1 ≤ u,v < T and every full block in [T,T²]. Since Q ≥ T, U is nonempty. Choose its first entry q. It divides Q, so inherits oddness and squarefreeness; it also satisfies the required lower and upper bounds. Replace the primitive residual u by au. Since a ≤ 8 ≤ T and u < T, au ≤ 8T ≤ T². The principal residual v is also below T². Both are positive; no squarefreeness of a is needed because a is kept inside this single block. Concatenate U, [au], V and [v], then delete entries equal to one. List.prod_filter_bne_one preserves the product. The first entry q remains since q ≥ T > 1. Within each family, coprimality follows from the packing theorem. The assumptions gcd(Q,R) = 1 and gcd(a,QR) = 1 give all cross-family coprimalities and coprimality of au with the other primitive blocks. Use divisibility of each factor into its family product; filtering preserves pairwise coprimality. Every surviving full block is at least T. Only au and v can be smaller, so after taking out the distinguished q there are at most two small entries. If R = 1, its full-block list is empty and v = 1 is deleted; no principal factor is inserted artificially. Reindexing the resulting list by its positions provides the hypotheses of ES.0/bounded-factor-count. This gives the source's r−2 count, including an empty principal family, without replacing it by an unnecessary weaker factor bound. Character restriction and reconstruction along CRT remain a separate unclosed interface.

**Direct prerequisites:** [Pairwise-coprime bounded blocks of a squarefree modulus](#es0-squarefree-modulus-blocks); `mathlib:List.prod_filter_bne_one`; `mathlib:Nat.coprime_list_prod_right_iff`; `mathlib:Squarefree.squarefree_of_dvd`; `mathlib:Odd.of_dvd_nat`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, printed pp.377–378, Case 1, (a)–(e) and r−2 bound; accepted E11 review. Arithmetic part of routed item 95. The accepted errata review allows the principal family to be empty; this theorem keeps that convention and the original two-residual count. It does not claim the external Graham–Ringrose proof or the character CRT adapters are supplied.


<a id="es0-bounded-factor-count"></a>

### Factor count with two exceptional blocks

Contract `ExponentialSumsAndCircleMethod:ES.0/bounded-factor-count` (lemma).

Let k > 1, c > 0, qᵢ ≥ 1 for i in Fin r, and let E be a subset of Fin r with at most two members. Suppose qᵢ ≥ k^(7/32) whenever i is outside E, and ∏ᵢqᵢ ≤ k^(2c). Then r < 10c + 2. All inequalities and the product bound are interpreted in ℝ.

**Additional hypotheses:** The exceptional set is an input identifying the at most two residual blocks from ES.0/bounded-crt-modulus-blocks. The result also permits r = 0 or 1.; Neither distinctness nor primality of the qᵢ is needed for this numerical bound. Positivity follows from qᵢ ≥ 1..

**Construction or proof route.** Each exceptional factor contributes a nonnegative logarithm. Each of the r−|E| other factors contributes at least (7/32)log k, by logarithmic monotonicity and Real.log_rpow. Sum and use Real.log_prod. The product bound gives (r−|E|)(7/32)log k ≤ 2c log k. Since log k > 0, divide to obtain r ≤ (64/7)c + |E| ≤ (64/7)c + 2. Because c > 0 and 64/7 < 10, the claimed strict bound follows. The packing theorem supplies E after indexing the list; the ambient source bound aQR ∣ lcm(N₁,N₂) ≤ N₁N₂ ≤ k^(2c) is used as an inequality, never the false equality between ambient modulus and reduced period.

**Direct prerequisites:** [Bounded CRT modulus blocks](#es0-bounded-crt-modulus-blocks); `mathlib:Real.log_prod`; `mathlib:Real.log_le_log`; `mathlib:Real.log_nonneg`; `mathlib:Real.log_pos`; `mathlib:Real.log_rpow`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, printed p.378, displayed r−2 logarithmic bound. Makes the strict numerical constant and the two exceptional blocks explicit. This estimate is independent of the unproved analytic character-sum bound.


<a id="es0-graham-ringrose-interval-threshold"></a>

### Interval length for the smooth-modulus estimate

Contract `ExponentialSumsAndCircleMethod:ES.0/graham-ringrose-interval-threshold` (lemma).

Let k > 2⁶⁴ be real, let 0 ≤ q ≤ k^(7/16), and let L ≤ k^(7/16). Then max(L,q^(1/4))·q^(5/4) ≤ k^(63/64) < k/2.

**Additional hypotheses:** In the application L is an upper bound for the other moduli; L = 0 is allowed when there are no other factors. No character estimate is a hypothesis or a conclusion.; The first inequality only needs k > 1. The displayed combined contract uses the explicit strict threshold k > 2⁶⁴ for the second inequality..

**Construction or proof route.** Monotonicity of real powers gives q^(1/4) ≤ k^(7/64) ≤ k^(7/16), so the maximum is at most k^(7/16). Also q^(5/4) ≤ k^(35/64). Multiply these nonnegative upper bounds and use Real.rpow_add to get exponent 7/16 + 35/64 = 63/64. Raise k > 2⁶⁴ to the positive exponent 1/64, obtaining k^(1/64) > 2. Multiply by k^(63/64) > 0 and use the exponent sum one to get 2k^(63/64) < k. Thus the quoted analytic theorem's lower bound R₀ is below the real interval length k/2 once the factor moduli have the stated cap. This establishes the length condition only, not the quoted estimate or its full source decomposition.

**Direct prerequisites:** `mathlib:Real.rpow_le_rpow`; `mathlib:Real.rpow_lt_rpow`; `mathlib:Real.rpow_le_rpow_of_exponent_le`; `mathlib:Real.rpow_mul`; `mathlib:Real.rpow_add`; `mathlib:Real.rpow_natCast`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, printed p.378, displayed R₀ inequality. Pure size calculation underlying the use of Theorem 6; supplies an explicit threshold omitted under the source's sufficiently-large-k convention.


<a id="es0-periodic-interval-remainder"></a>

### Zero-mean periodic interval remainder

Contract `ExponentialSumsAndCircleMethod:ES.0/periodic-interval-remainder` (lemma).

For f:N→C, q>0, f(n+q)=f(n) and Σ_{0≤j<q}f(j)=0, and any natural A,B, Σ_{A<m≤B}f(m)=Σ_{0≤j<(B−A) mod q}f(A+j+1). Subtraction is truncated natural subtraction.

**Additional hypotheses:** No ordering assumption on A,B.; No norm bound on f is needed..

**API.**

- `TauCeti.ExponentialSumsPlan.periodic_interval_remainder` (relation): For f:N→C, q>0, f(n+q)=f(n) and Σ_{0≤j<q}f(j)=0, and any natural A,B, Σ_{A<m≤B}f(m)=Σ_{0≤j<(B−A) mod q}f(A+j+1). Subtraction is truncated natural subtraction.


**Named examples and contract tests.**

- `character_three_complete` (computation): For the integer χ3 table (0,1,−1), Σ_{0<n≤2}χ3(n)=0.
- `reversed_interval` (degenerate): Σ_{5<n≤4}(n:Z)=0.


**Uses:** the incomplete η-sums on p.379: Removes complete periods before taking norms..

**Construction or proof route.** If B≤A, both finite index sets are empty, so conclude directly. For B>A, use the existing natural interval enumeration m=A+j+1 with 0≤j<B−A. The sum f(1)+...+f(q) equals the range-q sum by f(q)=f(0). Moving a length-q block one step replaces f(a+1) by f(a+q+1), which is equal by periodicity; induction gives zero for every shifted full block. Write B−A=tq+r with 0≤r<q. Reindex the first tq entries by t blocks of length q; each block contributes zero. In the remaining r entries, apply periodicity t times to replace f(A+tq+j+1) by f(A+j+1).

**Direct prerequisites:** `mathlib:Function.Periodic`; `mathlib:Nat.card_Ioc`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, Case 2, pp.378–379; the incomplete η-sums on p.379. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.


<a id="es0-periodic-interval-norm"></a>

### Norm bound by the residual interval length

Contract `ExponentialSumsAndCircleMethod:ES.0/periodic-interval-norm` (lemma).

Under the hypotheses of periodic-interval-remainder, also assume ‖f(n)‖≤1 for every natural n. Then ‖Σ_{A<m≤B}f(m)‖≤((B−A) mod q), with the natural remainder cast to R.

**Additional hypotheses:** q>0; zero mean over a complete period; pointwise norm at most one..

**API.**

- `TauCeti.ExponentialSumsPlan.periodic_interval_norm` (relation): Under the hypotheses of periodic-interval-remainder, also assume ‖f(n)‖≤1 for every natural n. Then ‖Σ_{A<m≤B}f(m)‖≤((B−A) mod q), with the natural remainder cast to R.


**Named examples and contract tests.**

- `character_three_singleton` (computation): For the same table, Σ_{1<n≤2}χ3(n)=−1.


**Uses:** the bound for each inner η-sum on p.379: Avoids the unnecessary 2q loss from subtracting two prefix estimates..

**Construction or proof route.** Rewrite the interval sum with periodic-interval-remainder. Apply the finite-sum triangle inequality. Bound each of the r summands by one, and evaluate the cardinality of range r. In particular this proves a bound strictly less than q, although the exported character adapter uses the weaker ≤q.

**Direct prerequisites:** [Zero-mean periodic interval remainder](#es0-periodic-interval-remainder); `mathlib:norm_sum_le`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, Case 2, pp.378–379; the bound for each inner η-sum on p.379. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.


<a id="es0-character-interval-bound"></a>

### Incomplete nonprincipal character bound

Contract `ExponentialSumsAndCircleMethod:ES.0/character-interval-bound` (lemma).

For q>0 and a nonprincipal complex Dirichlet character χ modulo q, ‖Σ_{A<m≤B}χ(m)‖≤q for all natural A,B. Values are taken by natural casting into ZMod q.

**Additional hypotheses:** Nonprincipal means χ≠1 in the existing character monoid.; Neither primitive nor quadratic is assumed..

**API.**

- `TauCeti.ExponentialSumsPlan.character_interval_bound` (relation): For q>0 and a nonprincipal complex Dirichlet character χ modulo q, ‖Σ_{A<m≤B}χ(m)‖≤q for all natural A,B. Values are taken by natural casting into ZMod q.


**Named examples and contract tests.**

- `constant_nonexample` (non-example): The constant-one function sums to 12 on (0,12]; bounded values alone do not imply a bound by a fixed period.


**Uses:** p.379, inner sums indexed by k/(2d)<n≤k/d: Provides the uniform bound after each divisor reindexing..

**Construction or proof route.** The character is q-periodic because q casts to zero in ZMod q. Identify the q natural representatives 0,...,q−1 bijectively with ZMod q; use MulChar.sum_eq_zero_of_ne_one over C for the zero complete sum. Use DirichletCharacter.norm_le_one pointwise. Apply periodic-interval-norm; since q>0, the natural remainder is <q and hence ≤q.

**Direct prerequisites:** [Norm bound by the residual interval length](#es0-periodic-interval-norm); `mathlib:DirichletCharacter`; `mathlib:ZMod.natCast_self`; `mathlib:MulChar.sum_eq_zero_of_ne_one`; `mathlib:DirichletCharacter.norm_le_one`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.379, inner sums indexed by k/(2d)<n≤k/d. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.


<a id="es0-divisible-interval-reindex"></a>

### Reindexing divisible interval entries

Contract `ExponentialSumsAndCircleMethod:ES.0/divisible-interval-reindex` (lemma).

For f:N→C, natural A,B and d>0, Σ_{m∈(A,B], d|m}f(m)=Σ_{A div d<n≤B div d}f(dn), where div is natural floor division.

**Additional hypotheses:** d>0 is required for injectivity and division.; Both interval endpoints are divided, and the lower endpoint remains open..

**API.**

- `TauCeti.ExponentialSumsPlan.divisible_interval_reindex` (relation): For f:N→C, natural A,B and d>0, Σ_{m∈(A,B], d|m}f(m)=Σ_{A div d<n≤B div d}f(dn), where div is natural floor division.


**Named examples and contract tests.**

- `divisible_sum_floor` (computation): Σ_{2<n≤7,3|n}(n:C)=9.
- `divisible_sum_open_left` (computation): Σ_{3<n≤6,3|n}(n:C)=6.
- `divisible_sum_empty` (degenerate): Σ_{1<n≤2,3|n}(n:C)=0.


**Uses:** p.379, change from m to nd: Records both floors rather than suppressing endpoint conventions..

**Construction or proof route.** Map n to dn. Division with remainder gives A<dn iff A div d<n, and dn≤B iff n≤B div d. Positive multiplication is injective, so no weight or multiplicity is introduced. For each divisible m in the left index set, m=d(m div d); its quotient satisfies the right inequalities. Use the finite-sum bijection. If B≤A both sides are empty because floor division is monotone.

**Direct prerequisites:** `mathlib:Nat.card_Ioc`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.379, change from m to nd. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.


<a id="es0-coprime-moebius-expansion"></a>

### Weighted coprimality expansion

Contract `ExponentialSumsAndCircleMethod:ES.0/coprime-moebius-expansion` (lemma).

For f:N→C and natural A,B,M with M>0, Σ_{A<m≤B}1_{gcd(m,M)=1}f(m)=Σ_{d|M}μ(d) Σ_{A<m≤B,d|m}f(m), with μ(d) cast from Z to C and d ranging over M.divisors.

**Additional hypotheses:** M>0; no squarefreeness assumption.; The coprimality factor means f(m) if Nat.Coprime m M and zero otherwise, not a newly defined carrier..

**API.**

- `TauCeti.ExponentialSumsPlan.coprime_moebius_expansion` (relation): For f:N→C and natural A,B,M with M>0, Σ_{A<m≤B}1_{gcd(m,M)=1}f(m)=Σ_{d|M}μ(d) Σ_{A<m≤B,d|m}f(m), with μ(d) cast from Z to C and d ranging over M.divisors.


**Named examples and contract tests.**

- `moebius_one` (degenerate): Σ_{d|1}μ(d)=1.
- `moebius_six` (computation): Σ_{d|6}μ(d)=0.
- `moebius_four` (computation): Σ_{d|4}μ(d)=0.


**Uses:** p.378, Möbius divisor identity; p.379, first finite interchange: Uses the existing arithmetic function and gcd instead of rebuilding either..

**Construction or proof route.** For each m, gcd(m,M)>0 because M>0. Evaluate moebius_mul_coe_zeta at gcd(m,M), use coe_mul_zeta_apply and one_apply, and obtain Σ_{d|gcd(m,M)}μ(d)=1 if gcd(m,M)=1 and zero otherwise. A positive d divides gcd(m,M) exactly when it divides both m and M. Replace this divisor sum by the divisor set of M filtered by d|m. Multiply by f(m), distribute and interchange the two finite sums. Coerce the integer identity to C; no infinite summability input is involved.

**Direct prerequisites:** `mathlib:ArithmeticFunction.moebius`; `mathlib:ArithmeticFunction.moebius_mul_coe_zeta`; `mathlib:ArithmeticFunction.coe_mul_zeta_apply`; `mathlib:ArithmeticFunction.one_apply`; `mathlib:Nat.divisors`; `mathlib:Nat.mem_divisors`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.378, Möbius divisor identity; p.379, first finite interchange. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.


<a id="es0-character-exclusion-expansion"></a>

### Möbius expansion of an excluded character sum

Contract `ExponentialSumsAndCircleMethod:ES.0/character-exclusion-expansion` (lemma).

For a complex Dirichlet character χ modulo any natural q and M>0, Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)=Σ_{d|M}μ(d)χ(d)Σ_{A div d<n≤B div d}χ(n).

**Additional hypotheses:** q may be zero for this algebraic identity; positivity is imposed only for the subsequent finite-period bound.; M may share prime factors with q and may be nonsquarefree..

**API.**

- `TauCeti.ExponentialSumsPlan.character_exclusion_expansion` (relation): For a complex Dirichlet character χ modulo any natural q and M>0, Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)=Σ_{d|M}μ(d)χ(d)Σ_{A div d<n≤B div d}χ(n).


**Named examples and contract tests.**

- `moebius_square` (computation): μ(4)=0.


**Uses:** p.379, final Möbius expansion: Exposes the only analytic input needed by each divisor term..

**Construction or proof route.** Apply coprime-moebius-expansion to the character-value function. Every d in M.divisors is positive by Nat.pos_of_mem_divisors; apply divisible-interval-reindex to each inner sum. Use multiplicativity χ(dn)=χ(d)χ(n), including zero values at nonunits. Move the fixed scalar χ(d) outside its inner finite sum and associate the factors in C.

**Direct prerequisites:** [Weighted coprimality expansion](#es0-coprime-moebius-expansion); [Reindexing divisible interval entries](#es0-divisible-interval-reindex); `mathlib:DirichletCharacter`; `mathlib:Nat.pos_of_mem_divisors`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.379, final Möbius expansion. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.


<a id="es0-character-exclusion-bound"></a>

### Divisor-weighted character bound

Contract `ExponentialSumsAndCircleMethod:ES.0/character-exclusion-bound` (theorem).

For q>0, nonprincipal χ modulo q, M>0, and natural A,B, ‖Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)‖≤τ(M)q, where τ(M)=card(M.divisors).

**Additional hypotheses:** No primitivity, quadraticity, squarefreeness or gcd(q,M)=1 assumption.; The inequality is non-strict and uniform in both endpoints..

**API.**

- `TauCeti.ExponentialSumsPlan.character_exclusion_bound` (relation): For q>0, nonprincipal χ modulo q, M>0, and natural A,B, ‖Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)‖≤τ(M)q, where τ(M)=card(M.divisors).


**Named examples and contract tests.**

- `divisor_count_six` (computation): card(6.divisors)=4.
- `divisor_count_one` (degenerate): card(1.divisors)=1.
- `divisor_count_counterexample` (non-example): card(120.divisors)=16.


**Uses:** p.379, final displayed character-sum bound: Supplies the small-conductor cancellation input after a separately owned divisor estimate..

**Construction or proof route.** Use character-exclusion-expansion and the finite-sum triangle inequality. Each coefficient μ(d)χ(d) has norm at most one: combine abs_moebius_le_one after scalar coercion and DirichletCharacter.norm_le_one. Apply character-interval-bound to the interval with endpoints A div d and B div d; it is valid even when that interval is empty. There are exactly τ(M) divisor terms, each bounded by q, so their sum is at most τ(M)q.

**Direct prerequisites:** [Möbius expansion of an excluded character sum](#es0-character-exclusion-expansion); [Incomplete nonprincipal character bound](#es0-character-interval-bound); `mathlib:ArithmeticFunction.abs_moebius_le_one`; `mathlib:DirichletCharacter.norm_le_one`; `mathlib:norm_sum_le`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.379, final displayed character-sum bound. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.


<a id="es0-exclusion-complete-period"></a>

### Zero mean for the excluded product period

Contract `ExponentialSumsAndCircleMethod:ES.0/exclusion-complete-period` (lemma).

For q>0, nonprincipal χ modulo q and M>0, Σ_{0<m≤qM}1_{gcd(m,M)=1}χ(m)=0. The integer qM is a period, not an assertion about primitive conductor.

**Additional hypotheses:** No gcd(q,M)=1 or squarefree M restriction..

**API.**

- `TauCeti.ExponentialSumsPlan.exclusion_complete_period` (relation): For q>0, nonprincipal χ modulo q and M>0, Σ_{0<m≤qM}1_{gcd(m,M)=1}χ(m)=0. The integer qM is a period, not an assertion about primitive conductor.


**Named examples and contract tests.**

- `excluded_complete_period` (computation): For the integer χ3 table, Σ_{0<n≤6, gcd(n,2)=1}χ3(n)=0.


**Uses:** p.378, direct period estimate in Case 2: Justifies the complete-period cancellation for the masked character..

**Construction or proof route.** Apply character-exclusion-expansion with A=0,B=qM. If d divides M then (qM) div d=q(M div d), so each inner character sum has length divisible by q. The q-periodicity and zero complete character sum established in the proof of character-interval-bound give the hypotheses of periodic-interval-remainder; use it with this divisible length to get zero. Every weighted term is zero, hence so is the finite divisor sum.

**Direct prerequisites:** [Möbius expansion of an excluded character sum](#es0-character-exclusion-expansion); [Zero-mean periodic interval remainder](#es0-periodic-interval-remainder); `mathlib:ZMod.natCast_self`; `mathlib:MulChar.sum_eq_zero_of_ne_one`; `mathlib:Nat.mem_divisors`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.378, direct period estimate in Case 2. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.


<a id="es0-exclusion-direct-period-bound"></a>

### Product-period character bound

Contract `ExponentialSumsAndCircleMethod:ES.0/exclusion-direct-period-bound` (theorem).

For q>0, nonprincipal χ modulo q, M>0, and natural A,B, ‖Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)‖≤qM.

**Additional hypotheses:** qM is only a valid period; it need not be the least period or an ambient conductor..

**API.**

- `TauCeti.ExponentialSumsPlan.exclusion_direct_period_bound` (relation): For q>0, nonprincipal χ modulo q, M>0, and natural A,B, ‖Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)‖≤qM.


**Named examples and contract tests.**

- `nonsquarefree_mask` (compatibility): For the χ3 table on (0,6], the sums restricted by gcd(n,2)=1 and gcd(n,4)=1 are equal.


**Uses:** p.378, the direct bound preceding the assumption on M₂: Keeps the valid period estimate without the source's false modulus equality..

**Construction or proof route.** Write F(m) for the existing expression equal to χ(m) when m is coprime to M and zero otherwise; this is local notation, not a new definition node. The character factor is qM-periodic by q-periodicity. The indicator is qM-periodic by the existing coprimality invariance under adding multiples of M. Thus F is qM-periodic and has norm at most one. Use exclusion-complete-period and F(qM)=F(0) to turn the sum over (0,qM] into the range-qM zero mean required by periodic-interval-norm. Apply that bound with qM>0 and weaken the remainder bound to qM.

**Direct prerequisites:** [Zero mean for the excluded product period](#es0-exclusion-complete-period); [Norm bound by the residual interval length](#es0-periodic-interval-norm); `mathlib:Nat.coprime_add_mul_right_right`; `mathlib:DirichletCharacter.norm_le_one`; `mathlib:ZMod.natCast_self`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.378, the direct bound preceding the assumption on M₂. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.


<a id="es0-small-conductor-power-saving"></a>

### Small-conductor square-root saving

Contract `ExponentialSumsAndCircleMethod:ES.0/small-conductor-power-saving` (theorem).

Let c>0, C≥1 and assume τ(M)≤C M^(1/(64c)) for every positive natural M. If k≥1 is natural with 8C≤k^(17/64), q>0, χ modulo q is nonprincipal, M>0, q≤8k^(7/32), and M≤k^c, then ‖Σ_{k div 2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2). All powers in the hypotheses and conclusion are real powers of nonnegative casts.

**Additional hypotheses:** The divisor estimate is an explicit hypothesis of this conditional adapter; the new unconditional supplier-instantiation nodes below import it from AN.5.; The conclusion is this small-conductor branch, not the full distinct-quadratic-character proposition..

**API.**

- `TauCeti.ExponentialSumsPlan.small_conductor_power_saving` (relation): Let c>0, C≥1 and assume τ(M)≤C M^(1/(64c)) for every positive natural M. If k≥1 is natural with 8C≤k^(17/64), q>0, χ modulo q is nonprincipal, M>0, q≤8k^(7/32), and M≤k^c, then ‖Σ_{k div 2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2). All powers in the hypotheses and conclusion are real powers of nonnegative casts.


**Named examples and contract tests.**

- `odd_half_endpoint` (computation): Natural floor division gives 7 div 2=3.
- `saving_exponents` (computation): As real numbers, 7/32+1/64+17/64=1/2.


**Uses:** pp.378–379, end of Case 2, using the corrected divisor estimate: Makes constant dependence and the large-k threshold explicit..

**Construction or proof route.** Apply character-exclusion-bound to A=k div 2 and B=k. Put ε=1/(64c)>0. Monotonicity of nonnegative real powers gives M^ε≤(k^c)^ε=k^(1/64); justify the exponent simplification using c>0 and k≥1. The assumed divisor bound and q≤8k^(7/32) now give τ(M)q≤8C k^(15/64). Multiply 8C≤k^(17/64) by the nonnegative k^(15/64) and use the real-power addition law: 17/64+15/64=1/2. This proof needs no artificial split at M=k^(3/4); AN.5 supplies a uniform constant for every positive M.

**Direct prerequisites:** [Divisor-weighted character bound](#es0-character-exclusion-bound); `mathlib:Real.rpow_le_rpow`; `mathlib:Real.rpow_mul`; `mathlib:Real.rpow_add`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, Case 2, pp.378–379; pp.378–379, end of Case 2, using the corrected divisor estimate. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.


<a id="es0-character-exclusion-explicit-subpower-bound"></a>

### Explicit excluded-character subpower bound

Contract `ExponentialSumsAndCircleMethod:ES.0/character-exclusion-explicit-subpower-bound` (theorem).

For ε>0 and a natural B≥exp(1/ε), every nonprincipal complex character χ modulo q>0, positive exclusion modulus M and natural endpoints A,Z satisfy ‖Σ_{A<m≤Z}1_{gcd(m,M)=1}χ(m)‖≤D^B q M^ε, where D=max(1,(ε log2)⁻¹).

**Additional hypotheses:** ε>0; B natural with exp(1/ε)≤B; q>0; χ≠1; M>0; A,Z natural with no ordering assumption..

**API.**

- `TauCeti.ExponentialSumsPlan.character_exclusion_explicit_subpower_bound` (relation): For ε>0 and a natural B≥exp(1/ε), every nonprincipal complex character χ modulo q>0, positive exclusion modulus M and natural endpoints A,Z satisfy ‖Σ_{A<m≤Z}1_{gcd(m,M)=1}χ(m)‖≤D^B q M^ε, where D=max(1,(ε log2)⁻¹).


**Named examples and contract tests.**

- `explicit_constant_one_exponent` (degenerate): For ε>0 and any natural B, max(1,(ε log2)⁻¹)^B≥1.


**Uses:** Bennett–Siksek §8.1 Case2; routed item97: Instantiate the separate AN.5 divisor supplier, keeping all constant/threshold dependencies explicit..

**Construction or proof route.** Apply character-exclusion-bound to bound the norm by τ(M)q. Import AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound at ε,B,M, obtaining τ(M)≤D^B M^ε. Multiply by q≥0 and rearrange the real factors. Neither the divisor function nor its subpower proof is duplicated.

**Direct prerequisites:** [Divisor-weighted character bound](#es0-character-exclusion-bound); `AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, Case2, printed pp.378–379. Worker-derived explicit consequence of the corrected divisor input; the source's invalid universal divisor estimate is not reused.

**Source:** [The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), Small/large-prime proof; AN.5 explicit and uniform divisor nodes. The AN.5 packet owns the proof and exact constant. This node only composes its statement with the already planned character estimate.


<a id="es0-small-conductor-explicit-threshold"></a>

### Explicit small-conductor threshold

Contract `ExponentialSumsAndCircleMethod:ES.0/small-conductor-explicit-threshold` (theorem).

Let c>0, B∈ℕ with B≥exp(64c), and put D=max(1,((64c)⁻¹ log2)⁻¹), C=D^B. For natural k≥1 with (8C)^(64/17)≤k, every nonprincipal complex character χ modulo q>0 and M>0 satisfying q≤8k^(7/32) and M≤k^c obeys ‖Σ_{k div2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2).

**Additional hypotheses:** c>0; B natural with exp(64c)≤B; k≥1; the displayed explicit size threshold; q>0; χ≠1; M>0; the two growth bounds..

**API.**

- `TauCeti.ExponentialSumsPlan.small_conductor_explicit_threshold` (relation): Let c>0, B∈ℕ with B≥exp(64c), and put D=max(1,((64c)⁻¹ log2)⁻¹), C=D^B. For natural k≥1 with (8C)^(64/17)≤k, every nonprincipal complex character χ modulo q>0 and M>0 satisfying q≤8k^(7/32) and M≤k^c obeys ‖Σ_{k div2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2).


**Named examples and contract tests.**

- `threshold_reciprocal_exponents` (computation): (64/17)(17/64)=1 in the real numbers.
- `threshold_equality` (compatibility): For C≥1, ((8C)^(64/17))^(17/64)=8C.
- `threshold_one_rejected` (non-example): For C≥1, the inequality8C≤1^(17/64) is false.
- `divisor_supplier_exponent` (compatibility): For c>0, 1/((64c)⁻¹)=64c.


**Uses:** Bennett–Siksek §8.1 Case2; routed item97: Instantiate the separate AN.5 divisor supplier, keeping all constant/threshold dependencies explicit..

**Construction or proof route.** Set ε=(64c)⁻¹>0; 1/ε=64c. The imported explicit AN.5 bound with this B supplies τ(M)≤C M^ε for every M>0, and C≥1. Monotonicity of the real power17/64 applied to (8C)^(64/17)≤k gives 8C≤k^(17/64), using positive base8C and (64/17)(17/64)=1. Apply small-conductor-power-saving with this actual uniform divisor bound. No unspecified constant or unrecorded eventual condition remains.

**Direct prerequisites:** [Small-conductor square-root saving](#es0-small-conductor-power-saving); `AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound`; `mathlib:Real.rpow_le_rpow`; `mathlib:Real.rpow_mul`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, Case2, printed pp.378–379. Worker-derived explicit consequence of the corrected divisor input; the source's invalid universal divisor estimate is not reused.

**Source:** [The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), Small/large-prime proof; AN.5 explicit and uniform divisor nodes. The AN.5 packet owns the proof and exact constant. This node only composes its statement with the already planned character estimate.


<a id="es0-eventual-small-conductor-power-saving"></a>

### Uniform eventual small-conductor cancellation

Contract `ExponentialSumsAndCircleMethod:ES.0/eventual-small-conductor-power-saving` (theorem).

For each real c>0 there exists a natural K≥1 such that for all k≥K, all positive q, all nonprincipal complex Dirichlet characters χ modulo q, and all M>0, the inequalities q≤8k^(7/32) and M≤k^c imply ‖Σ_{k div2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2). K depends only on c, not on q,χ,M or k.

**Additional hypotheses:** c>0; the universal variables satisfy the displayed positivity, nonprincipality and growth conditions..

**API.**

- `TauCeti.ExponentialSumsPlan.eventual_small_conductor_power_saving` (relation): For each real c>0 there exists a natural K≥1 such that for all k≥K, all positive q, all nonprincipal complex Dirichlet characters χ modulo q, and all M>0, the inequalities q≤8k^(7/32) and M≤k^c imply ‖Σ_{k div2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2). K depends only on c, not on q,χ,M or k.


**Named examples and contract tests.**

- `one_small_conductor_exponent` (computation): At c=1/64 the divisor exponent1/(64c) equals1.


**Uses:** Bennett–Siksek §8.1 Case2; routed item97: Instantiate the separate AN.5 divisor supplier, keeping all constant/threshold dependencies explicit..

**Construction or proof route.** Import AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound at ε=(64c)⁻¹ to choose C≥1 independent of M. Choose a natural K≥max(1,(8C)^(64/17)) using exists_nat_ge. For every k≥K, real-power monotonicity and rpow_mul give8C≤k^(17/64). Apply small-conductor-power-saving. For an effectively presented positive c, the preceding explicit-threshold theorem gives a computable certified choice by taking B≥exp(64c) and C=max(1,((64c)⁻¹ log2)⁻¹)^B. The abstract real existence theorem is not an executable arbitrary-real algorithm.

**Direct prerequisites:** [Small-conductor square-root saving](#es0-small-conductor-power-saving); `AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound`; `mathlib:exists_nat_ge`; `mathlib:Real.rpow_le_rpow`; `mathlib:Real.rpow_mul`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, Case2, printed pp.378–379. Worker-derived explicit consequence of the corrected divisor input; the source's invalid universal divisor estimate is not reused.

**Source:** [The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), Small/large-prime proof; AN.5 explicit and uniform divisor nodes. The AN.5 packet owns the proof and exact constant. This node only composes its statement with the already planned character estimate.


<a id="es0-ambient-product-evaluation"></a>

### Integer evaluation of the ambient product

Contract `ExponentialSumsAndCircleMethod:ES.0/ambient-product-evaluation` (lemma).

For positive N1,N2, complex Dirichlet characters χi modulo Ni and every integer a, the existing character σ=χ1.mul χ2 modulo M=lcm(N1,N2) satisfies σ(a)=χ1(a)χ2(a).

**Additional hypotheses:** No primitivity, quadraticity, distinctness or coprimality of the moduli is required.; Evaluations cast the same integer to each residue ring, including nonunits..

**API.**

- `TauCeti.ExponentialSumsPlan.ambient_product_evaluation` (relation): For positive N1,N2, complex Dirichlet characters χi modulo Ni and every integer a, the existing character σ=χ1.mul χ2 modulo M=lcm(N1,N2) satisfies σ(a)=χ1(a)χ2(a).


**Named examples and contract tests.**

- `quadratic_two_adic_cancellation` (relation): The integer residue tables satisfy χ8(a)χ−8(a)=χ−4(a) for every integer a, including negative a and even nonunits.


**Uses:** Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94: Transfers the source's pointwise product into the already existing ambient character..

**Construction or proof route.** Unfold the existing ambient product as A·B, with A and B the change-level lifts to M. If a is coprime to M, apply the existing coprime change-level evaluation theorem to both factors. If a is not coprime to M, choose a common prime of |a| and M. A prime divides an lcm exactly when it divides at least one input modulus, so at least one original character vanishes. The ambient character vanishes as well. Use integer gcd via natural absolute values to cover a=0 and negative a; no division or representative choice is needed.

**Direct prerequisites:** `mathlib:DirichletCharacter.mul`; `mathlib:DirichletCharacter.changeLevel_eq_cast_of_dvd'`; `mathlib:DirichletCharacter.apply_eq_zero_iff`; `mathlib:Nat.Prime.dvd_lcm`; `mathlib:Nat.Prime.not_coprime_iff_dvd`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed p.377. Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper.


<a id="es0-primitive-exclusion-coprime"></a>

### Coprimality of conductor and excluded primes

Contract `ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-coprime` (lemma).

For any complex character σ modulo M>0, put q=cond(σ) and R=∏{p prime : p divides M and p does not divide q}p. Then gcd(q,R)=1.

**Additional hypotheses:** The finite prime set is the existing primeFactors(M) filtered by p not dividing q; the empty product is 1.; σ may be principal or imprimitive..

**API.**

- `TauCeti.ExponentialSumsPlan.primitive_exclusion_coprime` (relation): For any complex character σ modulo M>0, put q=cond(σ) and R=∏{p prime : p divides M and p does not divide q}p. Then gcd(q,R)=1.


**Named examples and contract tests.**

- `exclusion_shrink_eight` (degenerate): At ambient M=8 and primitive conductor q=4, R=1; repeated powers of 2 are not extra excluded primes.
- `exclusion_modulus_one` (degenerate): At M=q=1 the empty prime product R equals 1.


**Uses:** Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94: Provides the coprime primitive/exclusion split required before the CRT branch..

**Construction or proof route.** Every factor p is prime and does not divide q, hence is coprime to q. Apply the finite-product coprimality equivalence; no prime power or multiplicity is included.

**Direct prerequisites:** `mathlib:Nat.primeFactors`; `mathlib:Nat.mem_primeFactors`; `mathlib:Nat.coprime_prod_right_iff`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed p.377. Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper.


<a id="es0-primitive-exclusion-period-divides"></a>

### The reduced product divides the ambient modulus

Contract `ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-period-divides` (lemma).

For σ modulo M>0, q=cond(σ) and R the product of prime divisors of M absent from q, qR divides M.

**Additional hypotheses:** No assertion that qR=M or that qR is a primitive conductor.; All prime factors in R occur once; q>0 is supplied by conductor_ne_zero..

**API.**

- `TauCeti.ExponentialSumsPlan.primitive_exclusion_period_divides` (relation): For σ modulo M>0, q=cond(σ) and R the product of prime divisors of M absent from q, qR divides M.


**Named examples and contract tests.**

- `period_divisibility_not_equality` (non-example): For χ8χ−8, qR=4 divides ambient 8 but is not equal to it.
- `exclusion_principal_twelve` (degenerate): For the principal character modulo 12, q=1 and R=6, not 12.


**Uses:** Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94: Replaces the source's unjustified equality between the ambient modulus and its reduced primitive/exclusion product..

**Construction or proof route.** The product R over a subset of primeFactors(M) divides the full prime product, which divides M. The existing conductor theorem gives q dividing M. Combine these two divisibilities using gcd(q,R)=1, or equivalently identify their lcm with qR.

**Direct prerequisites:** [Coprimality of conductor and excluded primes](#es0-primitive-exclusion-coprime); `mathlib:DirichletCharacter.conductor_dvd_level`; `mathlib:DirichletCharacter.conductor_ne_zero`; `mathlib:Finset.prod_dvd_prod_of_subset`; `mathlib:Nat.prod_primeFactors_dvd`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed p.377. Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper.


<a id="es0-primitive-exclusion-evaluation"></a>

### The primitive character with its exclusion mask

Contract `ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-evaluation` (theorem).

For every complex character σ modulo M>0 and integer a, let q=cond(σ), η=σ.primitiveCharacter and R the product of prime divisors of M absent from q. Then σ(a)=η(a) if gcd(|a|,R)=1, and σ(a)=0 otherwise.

**Additional hypotheses:** No nonprincipality or primitivity hypothesis on σ; q=1 is allowed.; The mask uses coprimality of integers, equivalent to natural coprimality for nonnegative inputs..

**API.**

- `TauCeti.ExponentialSumsPlan.primitive_exclusion_evaluation` (relation): For every complex character σ modulo M>0 and integer a, let q=cond(σ), η=σ.primitiveCharacter and R the product of prime divisors of M absent from q. Then σ(a)=η(a) if gcd(|a|,R)=1, and σ(a)=0 otherwise.


**Named examples and contract tests.**

- `exclusion_mixed_fifteen` (computation): At M=15 and q=5, R=3.
- `mask_negative_excluded` (computation): For R=3 and a=−3, the mask kills the nonzero primitive χ5 value −1.
- `mask_negative_kept` (computation): For R=3 and a=−2, the mask retains the primitive χ5 value −1.
- `mask_zero_excluded` (degenerate): For the principal character modulo 12, primitive η modulo 1 takes value 1 at 0 but the R=6 mask makes the ambient value 0.


**Uses:** Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94: Turns the product evaluation into the exact masked finite sums already decomposed in the first thirteen nodes..

**Construction or proof route.** If a is not coprime to R, a prime of R divides both a and M; the ambient character vanishes. Suppose a is coprime to R. If a is also coprime to q, it is coprime to M: a hypothetical common prime of a and M either divides q or occurs among the factors of R, giving a contradiction. In this coprime-to-M case use primitiveCharacter_apply_of_isCoprime to equate η(a) and σ(a). In the remaining case a is not coprime to q. Since q divides M, neither character is evaluated at a unit, so both values vanish. These cases also handle a=0 and negative a.

**Direct prerequisites:** `mathlib:DirichletCharacter.primitiveCharacter`; `mathlib:DirichletCharacter.primitiveCharacter_apply_of_isCoprime`; `mathlib:DirichletCharacter.apply_eq_zero_iff`; `mathlib:DirichletCharacter.conductor_dvd_level`; `mathlib:Nat.mem_primeFactors`; `mathlib:Nat.Prime.not_coprime_iff_dvd`; `mathlib:Nat.isCoprime_iff_coprime`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed p.377. Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper.


<a id="es0-cancelled-prime-common-support"></a>

### Cancelled primes divide both original conductors

Contract `ExponentialSumsAndCircleMethod:ES.0/cancelled-prime-common-support` (lemma).

Let χ1,χ2 be primitive complex Dirichlet characters of positive moduli N1,N2. Set M=lcm(N1,N2), σ=χ1.mul χ2, q=cond(σ), and R the product of prime divisors of M not dividing q. Then R divides gcd(N1,N2).

**Additional hypotheses:** Quadraticity and distinctness are unnecessary, but primitivity of both inputs is required..

**API.**

- `TauCeti.ExponentialSumsPlan.cancelled_prime_common_support` (relation): Let χ1,χ2 be primitive complex Dirichlet characters of positive moduli N1,N2. Set M=lcm(N1,N2), σ=χ1.mul χ2, q=cond(σ), and R the product of prime divisors of M not dividing q. Then R divides gcd(N1,N2).


**Named examples and contract tests.**

- `common_prime_not_coprime_moduli` (computation): For χ3 times the primitive χ15, q=5 and R=3 divides gcd(3,15); the original conductors need not be coprime.
- `imprimitive_support_obstruction` (non-example): If the inputs are principal modulo 8 and modulo 1, then q=1 and R=2 does not divide gcd(8,1); input primitivity is necessary for the common-support conclusion.


**Uses:** Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94: Supplies R≤min(N1,N2), preserving the source growth exponent c in the small-conductor application..

**Construction or proof route.** Lift χ1,χ2 to A,B modulo M. By conductor_changeLevel and primitivity, their conductors are N1,N2. Write A=(A·B)·B⁻¹. Apply conductor_mul_dvd_lcm_conductor and conductor_inv to obtain N1 dividing lcm(q,N2). Similarly N2 divides lcm(q,N1). For a prime p of M not dividing q, the lcm criterion first gives p dividing at least one Ni. The corresponding reverse conductor divisibility then forces p to divide the other Ni. Every factor of R is consequently a prime divisor of gcd(N1,N2). Its distinct-prime product divides the radical of that gcd, which divides the gcd.

**Direct prerequisites:** `mathlib:DirichletCharacter.IsPrimitive`; `mathlib:DirichletCharacter.conductor_changeLevel`; `mathlib:DirichletCharacter.conductor_inv`; `mathlib:DirichletCharacter.conductor_mul_dvd_lcm_conductor`; `mathlib:Nat.Prime.dvd_lcm`; `mathlib:Nat.mem_primeFactors`; `mathlib:Finset.prod_dvd_prod_of_subset`; `mathlib:Nat.prod_primeFactors_dvd`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed p.377. Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper.


<a id="es0-primitive-product-quadratic"></a>

### Quadraticity survives primitive reduction

Contract `ExponentialSumsAndCircleMethod:ES.0/primitive-product-quadratic` (lemma).

For positive N1,N2 and quadratic complex Dirichlet characters χi modulo Ni, the existing primitive product η=χ1.primitive_mul χ2 is quadratic.

**Additional hypotheses:** Quadratic means the existing predicate that every value is 0, 1 or −1; it includes the principal character.; No input primitivity or distinctness is required..

**API.**

- `TauCeti.ExponentialSumsPlan.primitive_product_quadratic` (relation): For positive N1,N2 and quadratic complex Dirichlet characters χi modulo Ni, the existing primitive product η=χ1.primitive_mul χ2 is quadratic.


**Named examples and contract tests.**

- `quadratic_two_adic_cancellation` (relation): The integer residue tables satisfy χ8(a)χ−8(a)=χ−4(a) for every integer a, including negative a and even nonunits.
- `diagonal_principal_obstruction` (non-example): The square of χ3 sums to 2 on (0,3], whereas its primitive conductor is 1; equal input characters cannot satisfy a nonprincipal conductor bound.


**Uses:** Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94: Supplies the quadratic hypothesis for later large-conductor arithmetic; that later branch is not asserted here..

**Construction or proof route.** Use the existing equivalence between quadraticity and χ²=1. Change level to M=lcm(N1,N2); the lifts preserve squares as monoid homomorphisms, so σ²=1. The existing change-level equality sends η to σ. Apply injectivity of changeLevel from q to M to infer η²=1, and convert back to quadraticity.

**Direct prerequisites:** `mathlib:DirichletCharacter.mul`; `mathlib:DirichletCharacter.primitive_mul`; `mathlib:DirichletCharacter.changeLevel`; `mathlib:DirichletCharacter.changeLevel_injective`; `mathlib:DirichletCharacter.changeLevel_primitiveCharacter`; `mathlib:MulChar.IsQuadratic`; `mathlib:MulChar.IsQuadratic.sq_eq_one`; `mathlib:MulChar.isQuadratic_iff_sq_eq_one`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed p.377. Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper.


<a id="es0-primitive-product-nonprincipal"></a>

### Distinct primitive quadratic inputs give a nonprincipal inducer

Contract `ExponentialSumsAndCircleMethod:ES.0/primitive-product-nonprincipal` (lemma).

For positive N1,N2, primitive quadratic complex characters χi modulo Ni, and an integer a with χ1(a)≠χ2(a), the primitive product η=χ1.primitive_mul χ2 is not principal.

**Additional hypotheses:** Distinctness is as functions on integers; moduli may coincide.; The interface retains both source quadratic hypotheses; the proof only needs the second input to square to the principal character..

**API.**

- `TauCeti.ExponentialSumsPlan.primitive_product_nonprincipal` (relation): For positive N1,N2, primitive quadratic complex characters χi modulo Ni, and an integer a with χ1(a)≠χ2(a), the primitive product η=χ1.primitive_mul χ2 is not principal.


**Named examples and contract tests.**

- `diagonal_principal_obstruction` (non-example): The square of χ3 sums to 2 on (0,3], whereas its primitive conductor is 1; equal input characters cannot satisfy a nonprincipal conductor bound.
- `quadratic_two_adic_cancellation` (relation): The integer residue tables satisfy χ8(a)χ−8(a)=χ−4(a) for every integer a, including negative a and even nonunits.


**Uses:** Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94: Justifies the nonprincipal hypothesis needed by incomplete and masked character cancellation..

**Construction or proof route.** Assume η=1. Changing level to M gives A·B=1 for the two lifted inputs. Quadraticity gives B²=1, so A=B. Conductor invariance under changeLevel and input primitivity imply N1=N2. Transport across this equality and apply injectivity of changeLevel to deduce χ1=χ2, contradicting the integer witness.

**Direct prerequisites:** `mathlib:DirichletCharacter.primitive_mul`; `mathlib:DirichletCharacter.changeLevel_primitiveCharacter`; `mathlib:DirichletCharacter.changeLevel_injective`; `mathlib:DirichletCharacter.conductor_changeLevel`; `mathlib:DirichletCharacter.IsPrimitive`; `mathlib:MulChar.IsQuadratic.sq_eq_one`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed p.377. Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper.


<a id="es0-small-conductor-product-cancellation"></a>

### Small-conductor cancellation for the original product

Contract `ExponentialSumsAndCircleMethod:ES.0/small-conductor-product-cancellation` (theorem).

For each real c>0 there is a natural K≥1 such that, for every k≥K and every pair of distinct primitive quadratic complex Dirichlet characters χi of positive moduli Ni≤k^c, if q=cond(χ1.mul χ2)≤8k^(7/32), then ‖Σ_{k div2<a≤k}χ1(a)χ2(a)‖≤k^(1/2). The threshold K depends only on c.

**Additional hypotheses:** Distinctness means an integer witness of different values; the moduli may be equal.; There is no prime-factor smoothness hypothesis in this small-conductor branch.; The theorem does not cover q>8k^(7/32), or assert full Proposition 8.2..

**API.**

- `TauCeti.ExponentialSumsPlan.small_conductor_product_cancellation` (relation): For each real c>0 there is a natural K≥1 such that, for every k≥K and every pair of distinct primitive quadratic complex Dirichlet characters χi of positive moduli Ni≤k^c, if q=cond(χ1.mul χ2)≤8k^(7/32), then ‖Σ_{k div2<a≤k}χ1(a)χ2(a)‖≤k^(1/2). The threshold K depends only on c.


**Named examples and contract tests.**

- `exclusion_shrink_eight` (degenerate): At ambient M=8 and primitive conductor q=4, R=1; repeated powers of 2 are not extra excluded primes.
- `diagonal_principal_obstruction` (non-example): The square of χ3 sums to 2 on (0,3], whereas its primitive conductor is 1; equal input characters cannot satisfy a nonprincipal conductor bound.
- `common_prime_not_coprime_moduli` (computation): For χ3 times the primitive χ15, q=5 and R=3 divides gcd(3,15); the original conductors need not be coprime.


**Uses:** Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94 and Case 2/item 97: Completes the product-to-masked-sum application for the small-conductor branch without duplicating AN.5 or claiming the large-conductor result..

**Construction or proof route.** Choose K from eventual-small-conductor-power-saving for the same c. Form the existing σ and η, with q>0 and η nonprincipal by primitive-product-nonprincipal. The excluded prime product R is positive, since all its factors are positive primes (including the empty product 1). By cancelled-prime-common-support, R divides gcd(N1,N2), hence R≤N1≤k^c. Combine ambient-product-evaluation and primitive-exclusion-evaluation, converting integer coprimality to natural coprimality at the natural interval arguments. Apply the uniform masked-character bound with character η modulo q and exclusion modulus R. The threshold is independent of both inputs; no exponent 2c from the ambient lcm is needed.

**Direct prerequisites:** [Integer evaluation of the ambient product](#es0-ambient-product-evaluation); [The primitive character with its exclusion mask](#es0-primitive-exclusion-evaluation); [Cancelled primes divide both original conductors](#es0-cancelled-prime-common-support); [Distinct primitive quadratic inputs give a nonprincipal inducer](#es0-primitive-product-nonprincipal); [Uniform eventual small-conductor cancellation](#es0-eventual-small-conductor-power-saving); `mathlib:DirichletCharacter.conductor_ne_zero`; `mathlib:DirichletCharacter.primitive_mul_isPrimitive`; `mathlib:Nat.isCoprime_iff_coprime`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed p.377 and Case 2, pp.378–379. Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper.


<a id="es0-crt-character-equivalence"></a>

### CRT decomposition of Dirichlet characters

Contract `ExponentialSumsAndCircleMethod:ES.0/crt-character-equivalence` (definition).

For a finite index type I, pairwise coprime natural moduli nᵢ and a commutative monoid with zero C, put N=∏ᵢnᵢ. Define crtCharacterEquiv(n) from Dirichlet characters C of level N to families of characters C of levels nᵢ, as a multiplicative equivalence. Let E be the native unit-group CRT equivalence from (ZMod N)× to ∏ᵢ(ZMod nᵢ)×. The i-th factor has unit homomorphism u ↦ χ(E⁻¹(eᵢ(u))), where eᵢ places u in coordinate i and one elsewhere; extend by zero at nonunits using the native unit-character equivalence. The inverse multiplies the coordinate characters on CRT units and extends by zero. No new character or conductor carrier is introduced.

**Additional hypotheses:** I is finite, with decidable equality for the coordinate inclusions; nᵢ are pairwise coprime. No positivity is needed for this algebraic equivalence; all conductor statements below require nᵢ>0.; C is any commutative monoid with zero. Empty I has N=1; modulus-one coordinates are allowed..

**API.**

- `TauCeti.ExponentialSumsPlan.crtCharacterEquiv_apply_unit` (characterisation): With E and eᵢ as in the definition, the unit homomorphism of the i-th factor sends u to χ.toUnitHom(E⁻¹(eᵢ(u))). This fixes the coordinate order.
- `TauCeti.ExponentialSumsPlan.crtCharacterEquiv_symm_unit` (simp): For a family φᵢ and a unit u modulo N, the inverse character at u equals ∏ᵢφᵢ(reductionᵢ(u)), using the native ZMod.unitsMap for nᵢ|N.
- `TauCeti.ExponentialSumsPlan.crtCharacterEquiv_one` (structure): The principal character maps to the family of principal characters, with their native zero values at nonunits.
- `TauCeti.ExponentialSumsPlan.crtCharacterEquiv_mul` (structure): The image of χψ is the coordinatewise product of the images of χ and ψ.
- `TauCeti.ExponentialSumsPlan.crtCharacterEquiv_ext` (extensionality): Two characters of level N are equal if and only if every corresponding CRT factor is equal.
- `TauCeti.ExponentialSumsPlan.crt_inverse_product` (compatibility): The inverse of φ is ∏ᵢ changeLevel(nᵢ|N)(φᵢ), an equality of native characters at N. Promoted to ES.0/crt-inverse-product because conductor arguments consume it.
- `TauCeti.ExponentialSumsPlan.crt_integer_evaluation` (compatibility): For every integer a, χ(a)=∏ᵢ(crtCharacterEquiv(n)(χ))ᵢ(a), including nonunits and negative a. Promoted to ES.0/crt-integer-evaluation for the summand comparison.


**Named examples and contract tests.**

- `crt_empty_inverse` (degenerate): For I=Fin 0 and its empty family, the inverse character evaluates to 1 at every integer a.
- `crt_one_zero` (degenerate): For the singleton modulus-one family, the factor of the principal character evaluates to 1 at zero.
- `crt_singleton` (characterisation): For the singleton modulus-seven family and arbitrary χ, the unique factor agrees with χ at every integer.
- `crt_principal_nonunit` (non-example): At the two moduli (3,4), the inverse of the principal family evaluates to 0 at 2; it is not the constant function one.
- `crt_principal_unit` (computation): At the two moduli (3,4), the inverse of the principal family evaluates to 1 at −1.
- `crt_principal_conductor` (compatibility): The inverse of the principal family at (3,4) has native conductor 1, despite ambient modulus 12.


**Uses:** Bennett–Siksek §8.1, Case 1, printed pp.377–378: Produce actual characters on the pairwise-coprime bounded blocks and recover the summand at all integers.; Theorem 6, printed pp.376–377: Separate each ambient block modulus from its conductor; establish primitivity only where the analytic theorem requires it.; ES.0/crt-product-conductor and /crt-quadratic-components: Use the multiplicative equivalence to compare primitive conductors and squares of characters..

**Construction or proof route.** Compose ZMod.prodEquivPi with Units.mapEquiv and MulEquiv.piUnits to obtain E. These are existing equivalences, not additional constructions. Compose MulChar.mulEquivToUnitHom, transport along E by MulEquiv.monoidHomCongrLeft, Pi.monoidHomMulEquiv on the finite product of unit groups, and the coordinate inverses of MulChar.mulEquivToUnitHom through MulEquiv.piCongrRight. The native Pi.monoidHomMulEquiv supplies both inverse laws and multiplicativity. Unfold its forward map to get the single-coordinate restriction, and its inverse to get the product on units. Zero extension is inherited from MulChar.ofUnitHom.

**Direct prerequisites:** `mathlib:ZMod.prodEquivPi`; `mathlib:MulChar.mulEquivToUnitHom`; `mathlib:Units.mapEquiv`; `mathlib:MulEquiv.piUnits`; `mathlib:MulEquiv.monoidHomCongrLeft`; `mathlib:Pi.monoidHomMulEquiv`; `mathlib:MulEquiv.piCongrRight`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker-defined adapter composing the pinned CRT and unit-character equivalences for the block factors used in Case 1; the paper does not name this equivalence separately.


<a id="es0-crt-inverse-product"></a>

### CRT reconstruction as a product of level lifts

Contract `ExponentialSumsAndCircleMethod:ES.0/crt-inverse-product` (lemma).

For the finite pairwise-coprime family nᵢ, N=∏ᵢnᵢ and characters φᵢ with values in a commutative monoid with zero C, crtCharacterEquiv(n)⁻¹(φ)=∏ᵢ changeLevel(nᵢ|N)(φᵢ), as characters modulo N.

**Additional hypotheses:** Same finite family and coefficient assumptions as crt-character-equivalence; zero moduli and empty families are allowed here..

**Construction or proof route.** Use the unit-character equivalence to compare the two characters on units modulo N. The inverse API gives the product of φᵢ evaluated on coordinate reductions. ZMod.prodEquivPi_apply identifies each coordinate with its native reduction; DirichletCharacter.changeLevel_toUnitHom gives exactly the same unit homomorphism for each lifted factor. The finite product of characters agrees on units, hence agrees as a native MulChar; at nonunits zero extension is already part of the carrier.

**Direct prerequisites:** [CRT decomposition of Dirichlet characters](#es0-crt-character-equivalence); `mathlib:ZMod.prodEquivPi_apply`; `mathlib:DirichletCharacter.changeLevel_toUnitHom`; `mathlib:MulChar.mulEquivToUnitHom`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker derivation supplying the precise meaning of the source product notation through native changeLevel.


<a id="es0-crt-integer-evaluation"></a>

### All-integer CRT reconstruction

Contract `ExponentialSumsAndCircleMethod:ES.0/crt-integer-evaluation` (lemma).

For every integer z and character χ at N=∏ᵢnᵢ with values in a commutative monoid with zero C, χ(z)=∏ᵢφᵢ(z), where φ=crtCharacterEquiv(n)(χ). No coprimality hypothesis on z is imposed.

**Additional hypotheses:** I finite and the nᵢ pairwise coprime. Empty I and modulus-one coordinates are included..

**Construction or proof route.** If z is a unit modulo N, use the inverse unit formula, its inverse law, and ZMod.prodEquivPi_apply to identify every coordinate with the integer cast at nᵢ. If z is a nonunit modulo N, transport its unit predicate across the ring CRT equivalence and use Pi.isUnit_iff. Some coordinate z modulo nᵢ is a nonunit. Both χ(z) and that factor vanish by the native MulChar nonunit law, so the product is zero. For empty I the target product is the one-element ring; all residues are units and the empty character product has value one.

**Direct prerequisites:** [CRT decomposition of Dirichlet characters](#es0-crt-character-equivalence); `mathlib:ZMod.prodEquivPi_apply`; `mathlib:Pi.isUnit_iff`; `mathlib:MulChar.map_nonunit`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker derivation of the all-integer product identity needed inside the source interval sum; equality on units alone would not suffice.


<a id="es0-crt-primitive-family"></a>

### Finite CRT products of primitive factors

Contract `ExponentialSumsAndCircleMethod:ES.0/crt-primitive-family` (lemma).

Let nᵢ>0 be a finite pairwise-coprime family and φᵢ native Dirichlet characters with values in a commutative monoid with zero C. If every φᵢ is primitive at nᵢ, then crtCharacterEquiv(n)⁻¹(φ) is primitive at ∏ᵢnᵢ.

**Additional hypotheses:** All nᵢ>0. The index set may be empty and some nᵢ may equal one..

**Construction or proof route.** Induct over the finite index set, using crt-inverse-product to express the inverse character as a product of level lifts. The empty case is the native primitive principal character at level one. At an insertion i, pairwise coprimality and Nat.coprime_prod_right_iff make nᵢ coprime to the product of the remaining levels. The induction hypothesis makes the remaining product primitive. Apply the exact CA.1 primitivity-of-a-product-at-coprime-levels supplier. DirichletCharacter.changeLevel_trans identifies its two lifted factors with the full product. Reindexing and associating finite products are routine; the binary primitivity proof stays with CA.1.

**Direct prerequisites:** [CRT reconstruction as a product of level lifts](#es0-crt-inverse-product); `ClassicalArithmeticCompletion:CA.1/primitivity-of-a-product-at-coprime-levels`; `mathlib:DirichletCharacter.isPrimitive_one_level_one`; `mathlib:DirichletCharacter.changeLevel_trans`; `mathlib:Nat.coprime_prod_right_iff`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Finite-family adapter for the primitive factors on p.377, importing the owned binary theorem instead of rebuilding it.


<a id="es0-crt-product-conductor"></a>

### Conductor of a finite CRT product

Contract `ExponentialSumsAndCircleMethod:ES.0/crt-product-conductor` (theorem).

For positive pairwise-coprime nᵢ and arbitrary characters φᵢ valued in a commutative monoid with zero C, the conductor of crtCharacterEquiv(n)⁻¹(φ) equals ∏ᵢ cond(φᵢ).

**Additional hypotheses:** All nᵢ>0; neither primitivity nor nonprincipality of φᵢ is required..

**Construction or proof route.** Set dᵢ=cond(φᵢ). The native conductor_dvd_level and conductor_ne_zero give positive dᵢ dividing nᵢ. The dᵢ remain pairwise coprime by divisibility. Take each native primitiveCharacter φᵢ and reconstruct it at D=∏ᵢdᵢ. The preceding finite primitive-family lemma makes this character primitive at D. Its change of level from D to N equals the reconstructed original family. Expand both inverse products, use changeLevel as a monoid homomorphism and changeLevel_trans, then use changeLevel_primitiveCharacter coordinatewise. Conductor invariance under changeLevel gives the stated exact product. This uses positive N and does not confuse dᵢ with nᵢ.

**Direct prerequisites:** [CRT reconstruction as a product of level lifts](#es0-crt-inverse-product); [Finite CRT products of primitive factors](#es0-crt-primitive-family); `mathlib:DirichletCharacter.conductor_dvd_level`; `mathlib:DirichletCharacter.conductor_ne_zero`; `mathlib:DirichletCharacter.primitiveCharacter_isPrimitive`; `mathlib:DirichletCharacter.changeLevel_primitiveCharacter`; `mathlib:DirichletCharacter.changeLevel_trans`; `mathlib:DirichletCharacter.conductor_changeLevel`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker derivation making the source primitive/principal distinction precise for arbitrary CRT groupings.


<a id="es0-crt-component-conductor"></a>

### Conductor of one CRT factor

Contract `ExponentialSumsAndCircleMethod:ES.0/crt-component-conductor` (lemma).

For χ of positive level N=∏ᵢnᵢ with positive pairwise-coprime nᵢ, the conductor of its i-th CRT factor equals gcd(cond(χ),nᵢ). In particular a block nᵢ dividing cond(χ) has a primitive factor; a block coprime to cond(χ) has a principal factor.

**Additional hypotheses:** C is a commutative monoid with zero; every nᵢ>0. The two consequences use the native IsPrimitive and principal-character criteria..

**Construction or proof route.** Apply crt-product-conductor to the family crtCharacterEquiv(n)(χ), using the inverse law to obtain cond(χ)=∏ⱼdⱼ. The i-th dᵢ divides nᵢ. The product of all other dⱼ is coprime to nᵢ because dⱼ|nⱼ and the nⱼ are pairwise coprime. Split the conductor product at i and apply Nat.gcd_mul_of_coprime_of_dvd, obtaining gcd(cond(χ),nᵢ)=dᵢ. The first consequence unfolds IsPrimitive. For a block coprime to cond(χ), dᵢ=1 and eq_one_iff_conductor_eq_one identifies its factor with the principal character.

**Direct prerequisites:** [Conductor of a finite CRT product](#es0-crt-product-conductor); [CRT decomposition of Dirichlet characters](#es0-crt-character-equivalence); `mathlib:DirichletCharacter.conductor_dvd_level`; `mathlib:Nat.coprime_prod_right_iff`; `mathlib:Nat.gcd_mul_of_coprime_of_dvd`; `mathlib:DirichletCharacter.IsPrimitive`; `mathlib:DirichletCharacter.eq_one_iff_conductor_eq_one`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker derivation of exactly the distinguished-factor primitivity required by Theorem 6; it also recovers the source principal factors when their moduli are coprime to the conductor.


<a id="es0-crt-quadratic-components"></a>

### Quadratic CRT factors

Contract `ExponentialSumsAndCircleMethod:ES.0/crt-quadratic-components` (lemma).

Every CRT factor of a complex quadratic Dirichlet character is quadratic in the native MulChar.IsQuadratic sense, which includes principal characters.

**Additional hypotheses:** A finite pairwise-coprime family; χ is a complex-valued native quadratic character at its product level..

**Construction or proof route.** Use MulChar.isQuadratic_iff_sq_eq_one to express quadraticity as χ²=1 in the character group. The multiplicative equivalence sends this equality to the coordinatewise square equality. Evaluate at the selected coordinate and apply the same native criterion.

**Direct prerequisites:** [CRT decomposition of Dirichlet characters](#es0-crt-character-equivalence); `mathlib:MulChar.isQuadratic_iff_sq_eq_one`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker derivation preserving the quadratic nature of the source factors without adding a new quadratic-character definition.


<a id="es0-change-level-exclusion"></a>

### Level lifting as an exclusion mask

Contract `ExponentialSumsAndCircleMethod:ES.0/change-level-exclusion` (lemma).

For any natural D,R, any complex Dirichlet character η modulo D and any integer z, changeLevel(D|DR)(η)(z) equals η(z) if z and R are coprime as integers, and zero otherwise. No coprimality between D and R, and no positivity assumption, is needed for this evaluation identity.

**Additional hypotheses:** Native integer evaluation and IsCoprime are used, including D=0 or R=0; analytic applications have D,R>0..

**Construction or proof route.** If z is coprime to both D and R, IsCoprime.mul_right_iff shows it is a unit modulo DR and changeLevel_eq_cast_of_dvd' gives the original value. If z is not coprime to R, it is not coprime to DR and apply_eq_zero_iff makes the lifted value zero. If z is not coprime to D, both η(z) and the lifted value vanish; the conditional right side is then zero in either case.

**Direct prerequisites:** `mathlib:DirichletCharacter.changeLevel`; `mathlib:DirichletCharacter.changeLevel_eq_cast_of_dvd'`; `mathlib:DirichletCharacter.apply_eq_zero_iff`; `mathlib:IsCoprime.mul_right_iff`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker derivation identifying the corrected excluded-prime summand on pp.377–379 with a native character at the reduced period.


<a id="es0-bounded-crt-character-factors"></a>

### Characters on the bounded CRT blocks

Contract `ExponentialSumsAndCircleMethod:ES.0/bounded-crt-character-factors` (theorem).

Let T≥8, 0<a≤8, Q odd squarefree with Q≥T, and R squarefree, with gcd(Q,R)=1 and gcd(a,QR)=1. Every prime dividing Q or R is at most T². Let η be a primitive complex character modulo aQ. There exist a natural r, positive moduli nᵢ indexed by Fin(r+1), and characters φᵢ modulo nᵢ, with: the moduli pairwise coprime and product aQR; n₀|Q, n₀ odd squarefree and T≤n₀; every 1<nᵢ≤T²; at most two indices i≠0 have nᵢ<T; cond(φᵢ)=gcd(aQ,nᵢ), so φ₀ is primitive; and η(z) times the coprimality mask for R equals ∏ᵢφᵢ(z) for every integer z.

**Additional hypotheses:** The native primitive η and arithmetic hypotheses are supplied. No quadraticity is needed for this factor construction.; R=1 is allowed; all modulus-one blocks have already been discarded. Other factors need not all be primitive or principal for an arbitrary admissible grouping; their exact gcd conductors are stated..

**Construction or proof route.** Apply bounded-crt-modulus-blocks to obtain the distinguished q and the tail list B. Set r=length(B), enumerate q::B by Fin(r+1), and transfer its product, pairwise coprimality, bounds and exceptional-count properties. This is finite list indexing, not a new arithmetic packing theorem. Lift η to aQR by native changeLevel and transport its level along the enumerated product equality. Its conductor is aQ by conductor_changeLevel and primitivity. Apply crtCharacterEquiv to that native character. crt-component-conductor gives every gcd conductor. Since n₀|Q, it divides aQ and the distinguished factor is primitive. Use change-level-exclusion and crt-integer-evaluation to identify the original masked summand at every integer. All nonunit zeros remain in this equality.

**Direct prerequisites:** [Bounded CRT modulus blocks](#es0-bounded-crt-modulus-blocks); [CRT decomposition of Dirichlet characters](#es0-crt-character-equivalence); [Conductor of one CRT factor](#es0-crt-component-conductor); [All-integer CRT reconstruction](#es0-crt-integer-evaluation); [Level lifting as an exclusion mask](#es0-change-level-exclusion); `mathlib:DirichletCharacter.conductor_changeLevel`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker assembly of the corrected source factorization, preserving the existing r−2 arithmetic bound and accepted empty-principal-family convention. General subsequent factors are permitted by the corrected Theorem 6 modulus interface.


<a id="es0-large-conductor-character-blocks"></a>

### Large-conductor character blocks and interval threshold

Contract `ExponentialSumsAndCircleMethod:ES.0/large-conductor-character-blocks` (theorem).

Fix c>0 and a natural k>2⁶⁴. Let σ be any complex quadratic character at a positive ambient modulus M≤k^(2c), whose conductor D satisfies D≥8k^(7/32). Suppose every prime divisor of M is at most k^(7/16). Then there exist r≥0, pairwise-coprime moduli nᵢ indexed by Fin(r+1), and quadratic characters φᵢ modulo nᵢ, such that ∏ᵢnᵢ divides M, every 1<nᵢ≤k^(7/16), n₀ is odd squarefree and at least k^(7/32), φ₀ is primitive, σ(z)=∏ᵢφᵢ(z) for every integer z, and r+1<10c+2. If L=max{nᵢ:i≠0}, with L=0 for the empty set, then max(L,n₀^(1/4))n₀^(5/4)<k/2. All displayed nonintegral powers are real powers of nonnegative real casts.

**Additional hypotheses:** σ need not be primitive at M. The large lower bound already excludes a principal σ.; This theorem supplies the factors and the size hypotheses for Theorem 6; it contains no character-sum estimate..

**Construction or proof route.** Set η=σ.primitiveCharacter, D=cond(σ), and R to the product of primes of M absent from D. The inherited primitive-exclusion lemmas give gcd(D,R)=1, DR|M and σ(z)=η(z) times the R mask. R is squarefree by Finset.squarefree_prod_of_pairwise_isCoprime on its finite set of distinct primes. η is primitive by the native theorem. It is quadratic because changeLevel(η)=σ, changeLevel is injective into M>0 and a monoid homomorphism, and the square-to-one criterion descends along that injection. Use the exact CA.1 odd-part and two-adic-conductor-bound suppliers, not their proofs: write a=2^(D.factorization(2)) and Q=D/a. Then 0<a≤8, D=aQ, Q is odd squarefree and gcd(a,Q)=1. Native ordProj_pos, ordProj_mul_ordCompl_eq_self, ordProj_dvd, not_dvd_ordCompl and coprime_ordCompl supply the elementary factor split and coprimality. From D≥8T and a≤8 obtain Q≥T for T=k^(7/32); k>2⁶⁴ gives T≥8. Since Q|D|M and R|M, the smoothness hypotheses transfer from M; T²=k^(7/16) by Real.rpow_mul. Coprimality of D and R gives all remaining packing inputs. Apply bounded-crt-character-factors to η; its moduli multiply to DR and therefore divide M. The native lift of η to DR is quadratic by the square criterion and changeLevel multiplicativity. crt-quadratic-components then gives all factor predicates, while the inherited mask equality identifies their product with σ at every integer. Let the bad set be all indices with nᵢ<T. The distinguished block is not bad and the packing bound gives card(bad)≤2. The total product is at most M≤k^(2c), and all blocks are at least one. Apply bounded-factor-count to the total number r+1 to get its strict bound 10c+2. Take the finite maximum L of all other moduli, zero if none. Its bound is k^(7/16), as is n₀. Apply graham-ringrose-interval-threshold to obtain the stated strict inequality; no analytic estimate is invoked.

**Direct prerequisites:** [Characters on the bounded CRT blocks](#es0-bounded-crt-character-factors); [Coprimality of conductor and excluded primes](#es0-primitive-exclusion-coprime); [The reduced product divides the ambient modulus](#es0-primitive-exclusion-period-divides); [The primitive character with its exclusion mask](#es0-primitive-exclusion-evaluation); [Quadratic CRT factors](#es0-crt-quadratic-components); [Factor count with two exceptional blocks](#es0-bounded-factor-count); [Interval length for the smooth-modulus estimate](#es0-graham-ringrose-interval-threshold); `ClassicalArithmeticCompletion:CA.1/odd-part-of-a-quadratic-conductor-is-squarefree`; `ClassicalArithmeticCompletion:CA.1/two-adic-conductor-bound`; `mathlib:DirichletCharacter.primitiveCharacter_isPrimitive`; `mathlib:DirichletCharacter.changeLevel_primitiveCharacter`; `mathlib:DirichletCharacter.changeLevel_injective`; `mathlib:DirichletCharacter.changeLevel`; `mathlib:DirichletCharacter.conductor_dvd_level`; `mathlib:DirichletCharacter.conductor_ne_zero`; `mathlib:MulChar.isQuadratic_iff_sq_eq_one`; `mathlib:Nat.ordProj_dvd`; `mathlib:Nat.not_dvd_ordCompl`; `mathlib:Nat.coprime_ordCompl`; `mathlib:Nat.squarefree_mul_iff`; `mathlib:Real.rpow_mul`; `mathlib:Real.rpow_le_rpow`; `mathlib:Real.rpow_pos_of_pos`; `mathlib:Nat.ordProj_mul_ordCompl_eq_self`; `mathlib:Nat.ordProj_pos`; `mathlib:Finset.squarefree_prod_of_pairwise_isCoprime`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker derivation of the complete arithmetic/character input to Case 1, importing both precise CA.1 classification statements. This realizes the factor-block portion of routed item 95 and leaves the external analytic proof explicit.


<a id="es0-interval-correlation"></a>

### Finite interval correlation

Contract `ExponentialSumsAndCircleMethod:ES.0/interval-correlation` (definition).

For A∈ℤ, N∈ℕ, b:ℤ→ℂ and t∈ℤ define intervalCorrelation(A,N,b,t)=Σ_{n∈(A,A+N]} b(n+t) conjugate(b(n)). This finite expression is defined without a support hypothesis. Its autocorrelation identities require b to vanish outside (A,A+N]. No cyclic wraparound is used.

**Additional hypotheses:** A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.; The second factor, not the shifted first factor, is conjugated..

**API.**

- `TauCeti.ExponentialSumsPlan.intervalCorrelation_empty` (simp): intervalCorrelation(A,0,b,t)=0 for arbitrary A,b,t.
- `TauCeti.ExponentialSumsPlan.interval_correlation_zero` (compatibility): C(0) is the real energy Σ_{n∈I}‖b(n)‖², cast into ℂ. Promoted to interval-correlation-zero.
- `TauCeti.ExponentialSumsPlan.interval_correlation_neg` (relation): If b vanishes outside I, then C(−t)=conjugate(C(t)). Promoted to interval-correlation-neg.
- `TauCeti.ExponentialSumsPlan.interval_correlation_vanish` (simp): If b vanishes outside I and N≤|t|, then C(t)=0. Promoted to interval-correlation-vanish.
- `TauCeti.ExponentialSumsPlan.intervalCorrelation_scale` (compatibility): For z∈ℂ, intervalCorrelation(A,N,z b,t)=‖z‖² intervalCorrelation(A,N,b,t). No support hypothesis is needed.
- `TauCeti.ExponentialSumsPlan.intervalCorrelation_translate` (compatibility): For s∈ℤ, intervalCorrelation(A−s,N,n↦b(n+s),t)=intervalCorrelation(A,N,b,t). No support hypothesis is needed.


**Named examples and contract tests.**

- `correlation_empty` (degenerate): For arbitrary b and t, intervalCorrelation(−3,0,b,t)=0.
- `correlation_complex_diagonal` (computation): For b(1)=1,b(2)=i and b zero elsewhere, intervalCorrelation(0,2,b,0)=2.
- `correlation_positive_phase` (non-example): For that b, intervalCorrelation(0,2,b,1)=i, not −i or 1.
- `correlation_negative_phase` (computation): For that b, intervalCorrelation(0,2,b,−1)=−i.
- `correlation_no_wraparound` (non-example): For that b, intervalCorrelation(0,2,b,2)=0, not 2.
- `correlation_negative_interval` (computation): For b(−1)=i and b zero elsewhere, intervalCorrelation(−2,1,b,0)=1.


**Uses:** Polymath 2014, proof of Proposition 4.12(ii), (4-22)–(4-24): Express shifted products with their precise complex conjugation and separate diagonal energy from off-diagonal lags.; ES.0/shift-energy-expansion and /q-vdc-lag-bound: Compress H² shift pairs into H−1 positive lags with multiplicity H−h.; ES.0/q-vdc-uniform-correlation: Accept a correlation bound from a separately proved analytic or finite-field estimate without duplicating that supplier..

**Construction or proof route.** Use the existing finite integer interval, complex conjugation and finite sum; no replacement sequence, convolution or character carrier is introduced.

**Direct prerequisites:** `mathlib:Int.card_Ioc`; `mathlib:Complex.mul_conj'`.

**Source:** [New equidistribution estimates of Zhang type](https://msp.org/ant/2014/8-9/ant-v8-n9-p03-s.pdf), Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23).. Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.


<a id="es0-interval-correlation-zero"></a>

### Zero-lag correlation energy

Contract `ExponentialSumsAndCircleMethod:ES.0/interval-correlation-zero` (lemma).

For arbitrary A,N,b, intervalCorrelation(A,N,b,0)=(Σ_{n∈I}‖b(n)‖²:ℝ), cast into ℂ. In particular its imaginary part is zero and its real part is nonnegative.

**Additional hypotheses:** A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.; No support hypothesis is required..

**Construction or proof route.** Expand intervalCorrelation at shift zero. Apply Complex.mul_conj' termwise and commute the real-to-complex cast with the finite sum.

**Direct prerequisites:** [Finite interval correlation](#es0-interval-correlation); `mathlib:Complex.mul_conj'`.

**Source:** [New equidistribution estimates of Zhang type](https://msp.org/ant/2014/8-9/ant-v8-n9-p03-s.pdf), Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23).. Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.


<a id="es0-interval-correlation-neg"></a>

### Hermitian correlation symmetry

Contract `ExponentialSumsAndCircleMethod:ES.0/interval-correlation-neg` (lemma).

If b vanishes outside I, then intervalCorrelation(A,N,b,−t)=conjugate(intervalCorrelation(A,N,b,t)) for every integer t.

**Additional hypotheses:** A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.; b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required..

**Construction or proof route.** In the sum at −t retain only n for which n and n−t lie in I; the other terms vanish by the support hypothesis. Reindex by m=n−t between this intersection and the intersection defining C(t). Translation is bijective with inverse m↦m+t. Conjugate termwise and commute complex multiplication. The equality is not claimed for an arbitrary function restricted only in its second factor.

**Direct prerequisites:** [Finite interval correlation](#es0-interval-correlation); `mathlib:Finset.prod_bij`; `mathlib:Finset.prod_subset`.

**Source:** [New equidistribution estimates of Zhang type](https://msp.org/ant/2014/8-9/ant-v8-n9-p03-s.pdf), Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23).. Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.


<a id="es0-interval-correlation-vanish"></a>

### Disjoint-shift correlation vanishing

Contract `ExponentialSumsAndCircleMethod:ES.0/interval-correlation-vanish` (lemma).

If b vanishes outside I and N≤|t|, then intervalCorrelation(A,N,b,t)=0.

**Additional hypotheses:** A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.; b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required..

**Construction or proof route.** If n and n+t both belong to the half-open integer interval of length N, subtract the strict lower and weak upper inequalities to obtain −N<t<N. Under N≤|t|, at least one value in each product is therefore zero. Sum the zero terms; N=0 is the empty sum.

**Direct prerequisites:** [Finite interval correlation](#es0-interval-correlation).

**Source:** [New equidistribution estimates of Zhang type](https://msp.org/ant/2014/8-9/ant-v8-n9-p03-s.pdf), Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23).. Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.


<a id="es0-shift-support-envelope"></a>

### Support of the averaged shifts

Contract `ExponentialSumsAndCircleMethod:ES.0/shift-support-envelope` (lemma).

Assume H>0 and b vanishes outside I. If k<H and n∉J, then b(n+kr)=0. Thus every shift in 0,…,H−1 is supported in J, whose cardinality is exactly W=N+(H−1)r.

**Additional hypotheses:** A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.; b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.; H>0; r≥0 by its natural type..

**Construction or proof route.** For n≤A−(H−1)r and k≤H−1, n+kr≤A. For n>A+N, n+kr>A+N since r≥0. Apply the support hypothesis in either case. Int.card_Ioc evaluates card(J) as its nonnegative endpoint difference W. This envelope may contain gaps when r>N; it is not asserted to be the exact union of supports.

**Direct prerequisites:** `mathlib:Int.card_Ioc`.

**Source:** [New equidistribution estimates of Zhang type](https://msp.org/ant/2014/8-9/ant-v8-n9-p03-s.pdf), Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23).. Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.


<a id="es0-supported-shift-sum"></a>

### Translation of a supported finite sum

Contract `ExponentialSumsAndCircleMethod:ES.0/supported-shift-sum` (lemma).

For H>0, k<H and any f:ℤ→ℂ vanishing outside I, Σ_{n∈J} f(n+kr)=Σ_{m∈I} f(m).

**Additional hypotheses:** A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.; b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.; The support hypothesis applies to f; b is not used in this lemma. H>0 and k<H..

**Construction or proof route.** Translate the exact interval (A−kr,A+N−kr] by n↦n+kr onto I; inverse translation proves a finite bijection. That translated interval is contained in J by 0≤kr≤(H−1)r. Extend its sum to J: each extra term is zero by the support hypothesis.

**Direct prerequisites:** [Support of the averaged shifts](#es0-shift-support-envelope); `mathlib:Finset.prod_bij`; `mathlib:Finset.prod_subset`.

**Source:** [New equidistribution estimates of Zhang type](https://msp.org/ant/2014/8-9/ant-v8-n9-p03-s.pdf), Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23).. Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.


<a id="es0-periodic-shift-averaging"></a>

### Periodic-factor shift averaging

Contract `ExponentialSumsAndCircleMethod:ES.0/periodic-shift-averaging` (lemma).

Let a:ℤ→ℂ satisfy a(n+r)=a(n) for every integer n, let b vanish outside I and let H>0. Set S=Σ_{n∈I}a(n)b(n). Then H S=Σ_{n∈J} a(n)(Σ_{k=0}^{H−1} b(n+kr)), with H cast into ℂ.

**Additional hypotheses:** A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.; b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.; Function.Periodic a r; H>0. No bound on a or b is required for this identity..

**Construction or proof route.** Apply supported-shift-sum to f(n)=a(n)b(n) for every k<H; its support follows from that of b. Function.Periodic.nat_mul identifies a(n+kr) with a(n). Sum the H identical translated sums, interchange the finite n,k sums and factor a(n).

**Direct prerequisites:** [Translation of a supported finite sum](#es0-supported-shift-sum); `mathlib:Function.Periodic.nat_mul`.

**Source:** [New equidistribution estimates of Zhang type](https://msp.org/ant/2014/8-9/ant-v8-n9-p03-s.pdf), Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23).. Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.


<a id="es0-shift-pair-correlation"></a>

### Shift-pair correlation reindexing

Contract `ExponentialSumsAndCircleMethod:ES.0/shift-pair-correlation` (lemma).

Let H>0, k,l<H and b vanish outside I. Then Σ_{n∈J} b(n+kr) conjugate(b(n+lr))=intervalCorrelation(A,N,b,(k−l)r), where k−l is computed in ℤ, not by natural subtraction.

**Additional hypotheses:** A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.; b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.; H>0; k,l<H..

**Construction or proof route.** Put f(m)=b(m+(k−l)r) conjugate(b(m)); this is supported in I because its second factor is zero elsewhere. Apply supported-shift-sum with shift l. Ring arithmetic identifies m=n+lr and the first argument with n+kr. Unfold only the defining finite sum of intervalCorrelation.

**Direct prerequisites:** [Finite interval correlation](#es0-interval-correlation); [Translation of a supported finite sum](#es0-supported-shift-sum).

**Source:** [New equidistribution estimates of Zhang type](https://msp.org/ant/2014/8-9/ant-v8-n9-p03-s.pdf), Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23).. Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.


<a id="es0-shift-pair-lag-count"></a>

### Multiplicity of ordered shift differences

Contract `ExponentialSumsAndCircleMethod:ES.0/shift-pair-lag-count` (lemma).

For every natural H and every F:ℤ→ℂ, Σ_{k=0}^{H−1}Σ_{l=0}^{H−1} F(k−l)=H F(0)+Σ_{h=1}^{H−1}(H−h)(F(h)+F(−h)), with differences in ℤ and multiplicities cast into ℂ.

**Additional hypotheses:** H∈ℕ may be zero. The positive-lag sum is over the natural interval [1,H)..

**Construction or proof route.** Partition the ordered square into k=l, k>l and k<l. The diagonal has H elements. For fixed 1≤h<H, pairs with k−l=h are exactly (j+h,j) for 0≤j<H−h; the inverse reads j=l. The opposite triangle is obtained by swapping the coordinates. Use these finite bijections and sum each constant F(±h) exactly H−h times. This gives both the multiplicity and the empty H=0,1 cases.

**Direct prerequisites:** `mathlib:Finset.prod_bij`.

**Source:** [New equidistribution estimates of Zhang type](https://msp.org/ant/2014/8-9/ant-v8-n9-p03-s.pdf), Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23).. Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.


<a id="es0-shift-energy-expansion"></a>

### Energy of the averaged shifts

Contract `ExponentialSumsAndCircleMethod:ES.0/shift-energy-expansion` (lemma).

For H>0 and b supported in I, Σ_{n∈J}‖Σ_{k=0}^{H−1} b(n+kr)‖²=H D+2Σ_{h=1}^{H−1}(H−h) Re C(hr), where D=Σ_{n∈I}‖b(n)‖² and C(t)=intervalCorrelation(A,N,b,t).

**Additional hypotheses:** A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.; b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.; H>0. The right side is real; individual Re C(hr) may be negative..

**Construction or proof route.** Use Complex.mul_conj' on the inner sum and Finset.sum_mul_sum to expand its squared norm into ordered shift pairs. Interchange the finite sums and apply shift-pair-correlation. Apply shift-pair-lag-count to F(t)=C(tr), use interval-correlation-neg to pair opposite lags, and interval-correlation-zero for the diagonal. Take real parts to obtain the stated real equality.

**Direct prerequisites:** [Shift-pair correlation reindexing](#es0-shift-pair-correlation); [Multiplicity of ordered shift differences](#es0-shift-pair-lag-count); [Hermitian correlation symmetry](#es0-interval-correlation-neg); [Zero-lag correlation energy](#es0-interval-correlation-zero); `mathlib:Complex.mul_conj'`; `mathlib:Finset.sum_mul_sum`.

**Source:** [New equidistribution estimates of Zhang type](https://msp.org/ant/2014/8-9/ant-v8-n9-p03-s.pdf), Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23).. Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.


<a id="es0-q-vdc-energy-bound"></a>

### Finite q–van der Corput energy bound

Contract `ExponentialSumsAndCircleMethod:ES.0/q-vdc-energy-bound` (theorem).

Let H>0, a be r-periodic with ‖a(n)‖≤1 for every integer n, and b vanish outside I. Then H²‖Σ_{n∈I}a(n)b(n)‖²≤W Σ_{n∈J}‖Σ_{k=0}^{H−1}b(n+kr)‖², where W=N+(H−1)r.

**Additional hypotheses:** A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.; b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.; H>0; a is r-periodic and bounded in norm by one..

**Construction or proof route.** Use periodic-shift-averaging and take norms. The triangle inequality and the bound on a give H‖S‖≤Σ_{n∈J}‖Σ_k b(n+kr)‖. Both sides are nonnegative; square the inequality. Apply the existing finite Cauchy–Schwarz inequality to the real sequences 1 and the inner norms. The sum of the constant squares is card(J)=W by shift-support-envelope. Keep this exact factor rather than a hidden constant.

**Direct prerequisites:** [Periodic-factor shift averaging](#es0-periodic-shift-averaging); [Support of the averaged shifts](#es0-shift-support-envelope); `mathlib:norm_sum_le`; `mathlib:Finset.sum_mul_sq_le_sq_mul_sq`.

**Source:** [New equidistribution estimates of Zhang type](https://msp.org/ant/2014/8-9/ant-v8-n9-p03-s.pdf), Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23).. Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.


<a id="es0-q-vdc-lag-bound"></a>

### Finite q–van der Corput lag bound

Contract `ExponentialSumsAndCircleMethod:ES.0/q-vdc-lag-bound` (theorem).

Under q-vdc-energy-bound's hypotheses, H²‖Σ_{n∈I}a(n)b(n)‖²≤W(H D+2Σ_{h=1}^{H−1}(H−h)‖C(hr)‖), where D=Σ_{n∈I}‖b(n)‖², C(t)=intervalCorrelation(A,N,b,t), and W=N+(H−1)r.

**Additional hypotheses:** A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.; b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.; H>0; a is r-periodic and bounded in norm by one..

**Construction or proof route.** Substitute shift-energy-expansion into q-vdc-energy-bound. For each positive lag use Complex.re_le_norm. The factors H−h and W are nonnegative, so replacing real parts by norms preserves the upper bound.

**Direct prerequisites:** [Finite q–van der Corput energy bound](#es0-q-vdc-energy-bound); [Energy of the averaged shifts](#es0-shift-energy-expansion); `mathlib:Complex.re_le_norm`.

**Source:** [New equidistribution estimates of Zhang type](https://msp.org/ant/2014/8-9/ant-v8-n9-p03-s.pdf), Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23).. Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.


<a id="es0-q-vdc-uniform-correlation"></a>

### One-step q–van der Corput estimate

Contract `ExponentialSumsAndCircleMethod:ES.0/q-vdc-uniform-correlation` (theorem).

Suppose 1≤r≤N, a:ℤ→ℂ is r-periodic, ‖a(n)‖≤1, b vanishes outside I=(A,A+N], and ‖b(n)‖≤1 for n∈I. Put H=N div r. If T≥0 and ‖intervalCorrelation(A,N,b,hr)‖≤T for every natural 1≤h<H, then ‖Σ_{n∈I}a(n)b(n)‖²≤4Nr+2NT. All terms in this inequality are real casts; div is natural floor division.

**Additional hypotheses:** A∈ℤ; N,r∈ℕ with 1≤r≤N; T∈ℝ with T≥0.; The correlation assumption retains the zero-extended finite interval; it is not a complete sum or a periodic wraparound correlation..

**Construction or proof route.** Set H=N div r. Integer division gives H≥1, Hr≤N<(H+1)r≤2Hr, and W=N+(H−1)r≤2N. Use q-vdc-lag-bound. The pointwise bound on b and Int.card_Ioc give D≤N. Bound each positive-lag norm by T. Gauss' finite sum formula gives 2Σ_{h=1}^{H−1}(H−h)=H(H−1). Thus the bound after dividing by H² is W(N/H+(H−1)T/H). Use N/H≤2r, (H−1)/H≤1 and W≤2N to obtain 4Nr+2NT. These are elementary inequalities between nonnegative reals; division is legitimate because H>0.

**Direct prerequisites:** [Finite q–van der Corput lag bound](#es0-q-vdc-lag-bound); `mathlib:Int.card_Ioc`; `mathlib:Finset.sum_range_id_mul_two`.

**Source:** [New equidistribution estimates of Zhang type](https://msp.org/ant/2014/8-9/ant-v8-n9-p03-s.pdf), Proof of Proposition 4.12(ii), printed pp.2108–2110, K=⌊N/r⌋ and (4-22)–(4-24).. Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.


<a id="es0-polynomial-weyl-inequality"></a>

### Polynomial Weyl inequality

Contract `ExponentialSumsAndCircleMethod:ES.0/polynomial-weyl-inequality` (theorem).

For every degree d≥2 and ε>0 there is C(d,ε)>0 such that for every real polynomial f of degree d, every integer a and positive q with gcd(|a|,q)=1 and |leadingCoeff(f)−a/q|≤q^{−2}, and every N≥1, |Σ_{m=1}^Nexp(2πif(m))|≤CN^{1+ε}(N^{−1}+q^{−1}+qN^{−d})^{1/2^{d−1}}. The constant is independent of the lower coefficients, a,q,N and the leading coefficient subject to the approximation hypothesis.

**Additional hypotheses:** The approximation is to the actual native leading coefficient. All powers with nonintegral exponents are real rpow; positive N,q make divisions legitimate. This classical bound is distinct from the stronger VMV-driven exponent1/[d(d−1)]..

**Construction or proof route.** Expand the squared phase sum as N+2 times the sum over positive shifts of the real parts of the shifted finite phase sums; use native sum_mul_sum, unit phase modulus and conjugation. Iterate with Cauchy–Schwarz d−1 times to obtain source(9) at exponent2^{d−1}. These finite algebraic steps stay in the target proof sketch. Fold native fwdDiff at the d−1 shifts. Binomial expansion gives the linear slope d!leadingCoeff(f) times their product; lower-degree terms become a constant. The native polynomial forward-difference theorem confirms the all-unit-step case and is not falsely used as the arbitrary-shift statement. Each resulting finite geometric sum is at most the smaller of N and reciprocal native torus distance of its slope, with the distance-zero summand set to N. Group by the positive integer m=d!∏h. Projection to the first d−2 divisor coordinates gives at mostτ(m)^{d−2} tuples; use the exact AN.5 supplier at a smaller exponent, separating d=2 to avoid division by zero. For |α−a/q|≤q^{-2}, a complete q-block is a permuted shifted rational grid with perturbation≤1/q. Its clipped reciprocal-distance sum is bounded by a constant times N+qlog(2q), including arbitrary starting offset and a shorter final block. If q>N^d the final desired bound follows directly from|S|≤N; otherwise log(2q) is absorbed by N to an arbitrarily small positive power. Combine the diagonal and block contributions into N^{2^{d−1}+ε}(N^{-1}+q^{-1}+qN^{-d}); take the positive2^{d−1}-th root and renameε. All lower coefficients remain arbitrary. No additional lemma-level nodes are introduced before the breadth pass.

**Direct prerequisites:** `mathlib:fwdDiff`; `mathlib:Complex.mul_conj'`; `mathlib:Finset.sum_mul_sum`; `mathlib:Complex.norm_exp_ofReal_mul_I`; `mathlib:Int.card_Ioc`; `mathlib:Polynomial.fwdDiff_iter_degree_eq_factorial`; `mathlib:Polynomial.natDegree`; `mathlib:Polynomial.leadingCoeff`; `mathlib:Polynomial.eval`; `mathlib:Nat.divisors`; `AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound`; `mathlib:AddCircle.norm_eq`; `mathlib:Real.log_pos`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), Lemma5.1 and proof pp.28–31; Lemma5.2 and proof pp.31–32. The selected classical differencing and divisor proofs were read in full. Native forward differences and the exact AN.5 divisor supplier replace informal algebraic/analytic black boxes.


<a id="es0-complete-power-sum"></a>

### Complete monomial exponential sum

Contract `ExponentialSumsAndCircleMethod:ES.0/complete-power-sum` (definition).

completePowerSum(d,q,a)=Σ_{x mod q}exp(2πiax^d/q), represented by the native finite residue range x=0,…,q−1 and native fourier(ax^d) evaluated at1/q in AddCircle1. The zero residue is included. q=0 is an empty sum by definition; analytical moduli are positive. No additive-character, finite-field or cyclic Fourier carrier is reconstructed.

**Additional hypotheses:** d,q are natural and a is integer. At q=1 there is one residue and the sum is1. The sum at q>0 is independent of the choice of complete representatives..

**API.**

- `completePowerSum_zero_modulus` (simp): q=0 gives0.
- `completePowerSum_one_modulus` (simp): q=1 gives1.
- `completePowerSum_zero_frequency` (simp): a=0 gives q, cast to complex.
- `completePowerSum_conjugate` (compatibility): Conjugation changes a to−a.
- `completePowerSum_residue_formula` (compatibility): The native Fourier expression equals the source real-lift exponential sum.


**Named examples and contract tests.**

- `completePowerSum_zero_test` (degenerate): d=3,q=0,a=1 gives0.
- `completePowerSum_one_test` (computation): d=3,q=1,a=7 gives1.
- `completePowerSum_linear_test` (compatibility): d=1,q=2,a=1 gives0, agreeing with complete additive orthogonality.
- `completePowerSum_quadratic_test` (computation): d=2,q=3,a=1 gives i√3.


**Uses:** Assing Lemmas6.3,6.14–6.17: Major-arc approximation uses its exact normalization; finite-field Gauss inputs are imported rather than reproduced..

**Construction or proof route.** Use the native Fourier monomial and finite range. Periodicity of the phase under x→x+q identifies any complete residue interval with the source interval1..q. Complex conjugation negates a; at a=0 all q terms equal one.

**Direct prerequisites:** `mathlib:fourier`; `mathlib:fourier_coe_apply`; `mathlib:fourier_neg`; `mathlib:fourier_zero`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked. The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion.


<a id="es0-complete-power-bound"></a>

### Complete monomial sum bound

Contract `ExponentialSumsAndCircleMethod:ES.0/complete-power-bound` (theorem).

For every d≥3 there is C_d>0 such that for all q≥1 and integers a with gcd(|a|,q)=1, |completePowerSum(d,q,a)|≤C_dq^{1−1/d}. The constant is independent of a and q. This is the monomial composite-modulus bound used to obtain a simple Waring singular-series convergence range, not the general finite-field Weil theorem.

**Additional hypotheses:** Degree two is excluded from this source proof because E18 invalidates its blanket two-adic recurrence. That degree has a separate proof obligation..

**Construction or proof route.** Reduce prime moduli using the gcd(d,p−1)-th-power fibre formula and the exact FF.1 Gauss/convention suppliers. Their trivial character must contribute the missing zero residue so its complete additive sum vanishes. For prime powers use the binomial stationary phase recurrence in Lemmas6.15–6.16. For d≥3 the stated v>d range meets the required two-adic binomial threshold; the excluded d=2,p=2,v=3 case is not imported. After reducing to exponents≤d, the normalized sum is≤1 except at finitely many primes depending only on d; at large primes the Gauss bound gives d p^{−1/6}. CRT multiplicativity and the finite set of bad primes give one uniform C_d for all q. These are the source’s target-level proof steps; no new field Gauss theorem is planned.

**Direct prerequisites:** [Complete monomial exponential sum](#es0-complete-power-sum); `FiniteFieldsAndCharacterSums:FF.1/power-count-via-characters`; `FiniteFieldsAndCharacterSums:FF.1/gauss-sum-absolute-value`; `FiniteFieldsAndCharacterSums:FF.1/trivial-character-conventions`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked. The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion.


<a id="es0-finite-completion"></a>

### Completion of finite sums

Contract `ExponentialSumsAndCircleMethod:ES.0/finite-completion` (theorem).

For q≥1, f:ℤ/qℤ→ℂ and a finite integer set I, Σ_{m∈I}f(m mod q)=q⁻¹Σ_{h mod q}(dft f)(h)Σ_{m∈I}exp(2πihm/q). Consequently its norm is at most q⁻¹Σ_h |dft f(h)|·|Σ_{m∈I}exp(2πihm/q)|. The h=0 term is retained. The transform is unnormalized with a negative sign; its inverse has a positive sign.

**Construction or proof route.** Apply the inverse linear equivalence to dft f at each integer residue and exchange two finite sums. Use the triangle inequality. Complete-sum estimates are inputs applied to dft f, not definitions of f. For I an interval, its inner geometric sum gives the usual logarithmic completion loss.

**Direct prerequisites:** `mathlib:ZMod.dft`; `mathlib:ZMod.invDFT_apply`; `mathlib:ZMod.dft_apply`.

**Source:** [Pinned characters, Möbius arithmetic and finite-interval APIs](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib), Analysis/Fourier/ZMod.lean, dft_apply and invDFT_apply, lines108–121 at the pin. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-second-derivative-sum"></a>

### Second derivative exponential-sum bound

Contract `ExponentialSumsAndCircleMethod:ES.0/second-derivative-sum` (theorem).

For every A>1 there is C(A)>0 such that for integers a<b with b−a>1, a real phase f of class C² on a neighborhood of [a,b], and lam>0 satisfying lam≤|f″(x)|≤Alam throughout [a,b], |Σ_{a<m≤b}exp(2πif(m))|≤C(A)((b−a)√lam+lam⁻¹/²). C is independent of f,a,b,lam.

**Construction or proof route.** The continuous nonvanishing second derivative has a fixed sign, so f′ is monotone. Partition its range near and away from integers. Use Kusmin–Landau on the away intervals and the trivial bound on the near intervals; choose their width √lam for lam≤1/4. For larger lam the trivial bound suffices.

**Direct prerequisites:** [Kusmin–Landau inequality](#es0-kusmin-landau).

**Source:** [Lectures on exponential sums](https://www.atmschools.org/sites/default/files/Baier-Lectures_on_expo_sums.pdf), Theorem 7 p.6, proof pp.8–9. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-kusmin-landau"></a>

### Kusmin–Landau inequality

Contract `ExponentialSumsAndCircleMethod:ES.0/kusmin-landau` (theorem).

There is an absolute C>0 such that if f is C¹ near [a,b], f′ is monotone there, and for some δ∈(0,1/2] every derivative value is at distance at least δ from ℤ, then |Σ_{a<m≤b}exp(2πif(m))|≤C/δ. Here a,b are integers and a≤b.

**Construction or proof route.** Monotonicity and the avoided integer neighborhoods place f′ in one interval (j+δ,j+1−δ). Integrate f′ across consecutive integer cells to control their phase increments. Telescope with reciprocals of exp(2πi(f(m+1)−f(m)))−1; monotonicity bounds their total variation by O(δ⁻¹). The notes omit this proof, so its detailed source interface is recorded.

**Direct prerequisites:** Routine native algebra and the stated source construction.

**Source:** [Lectures on exponential sums](https://www.atmschools.org/sites/default/files/Baier-Lectures_on_expo_sums.pdf), Lemma 10 p.8; its proof is referred to Montgomery, Theorem2.1. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-van-der-corput-a"></a>

### Van der Corput A process

Contract `ExponentialSumsAndCircleMethod:ES.0/van-der-corput-a` (theorem).

For integers a<b, I=(a,b]∩ℤ, N=b−a, arbitrary f:ℤ→ℝ and 1≤H≤N, |Σ_I exp(2πif(m))|²≤2N²/H+(2N/H)Σ_{0<|h|<H}|Σ_{m∈I, m+h∈I}exp(2πi(f(m+h)−f(m)))|. All intersections retain the half-open endpoint convention.

**Construction or proof route.** Extend the exponential sequence by zero, average H consecutive shifts, and apply Cauchy–Schwarz. Expand the square. The lag h has weight H−|h|; bound this weight by H, separate the diagonal and use H≤N.

**Direct prerequisites:** [Finite q–van der Corput energy bound](#es0-q-vdc-energy-bound).

**Source:** [Lectures on exponential sums](https://www.atmschools.org/sites/default/files/Baier-Lectures_on_expo_sums.pdf), Lemma11 and Theorem12 pp.9–11. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-oscillatory-integral-derivative"></a>

### Van der Corput integral derivative bound

Contract `ExponentialSumsAndCircleMethod:ES.0/oscillatory-integral-derivative` (theorem).

For each integer k≥2 there is C(k)>0 such that if a≤b, c,lam>0, φ is smooth near [a,b], and |φ^(k)(x)|≥c there, then |∫_a^b exp(ilamφ(x))dx|≤C(k)(clam)^(−1/k). For k=1 the same bound C/(clam) requires φ′ monotone as well. These are Lebesgue integrals on [a,b].

**Construction or proof route.** For k=1, integrate by parts and use the variation of 1/φ′. For k≥2, isolate the short interval where |φ^(k−1)|≤α, bound it by its length, and apply the lower derivative estimate to the remaining at most two intervals. Optimize α.

**Direct prerequisites:** Routine native algebra and the stated source construction.

**Source:** [Lecture notes 8: oscillatory integrals](https://www.math.ucla.edu/~tao/247b.1.07w/notes8.pdf), Lemmas2.4–2.5 p.5 and proofs. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-stationary-phase-leading"></a>

### One-dimensional stationary phase

Contract `ExponentialSumsAndCircleMethod:ES.0/stationary-phase-leading` (theorem).

Let a:ℝ→ℂ be smooth and compactly supported, and φ:ℝ→ℝ smooth. Suppose φ′(x₀)=0, φ″(x₀)≠0, and x₀ is the only zero of φ′ in supp(a). Then for lam≥1, ∫ℝ a(x)exp(ilamφ(x))dx equals a(x₀)exp(ilamφ(x₀)+iπ sign(φ″(x₀))/4)√(2π/(lam|φ″(x₀)|)) with an error at most C(a,φ)lam^(−3/2). The constant depends on finitely many derivatives on a compact neighborhood of the support; this assertion does not give uniformity over arbitrary phases.

**Construction or proof route.** Partition the support into a neighborhood of x₀ and a region where φ′ stays nonzero. Repeated integration by parts controls the latter. Use a smooth local change of variable reducing the phase to ±y²; evaluate its regularized Fresnel integral with the complex Gaussian formula and expand the transformed amplitude to second order. The constant includes the derivative bounds for this change of variable.

**Direct prerequisites:** [Van der Corput integral derivative bound](#es0-oscillatory-integral-derivative).

**Source:** [Lecture notes 8: oscillatory integrals](https://www.math.ucla.edu/~tao/247b.1.07w/notes8.pdf), Lemmas2.6–2.8 pp.6–8, leading coefficient of (10). This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-van-der-corput-b"></a>

### Van der Corput B process

Contract `ExponentialSumsAndCircleMethod:ES.0/van-der-corput-b` (theorem).

Fix A≥1. There is C(A)>0 such that for N,F>0, integers a<b with [a,b]⊆[N,2N], and a C⁴ real phase f satisfying F/(AN²)≤f″≤AF/N², |f‴|≤AF/N³ and |f⁽⁴⁾|≤AF/N⁴, put α=f′(a), β=f′(b) and let x_h∈[a,b] be the unique point with f′(x_h)=h. The difference between Σ_{a<m≤b}exp(2πif(m)) and Σ_{h∈ℤ∩[α,β]}exp(2πi(f(x_h)−hx_h+1/8))/√f″(x_h) has norm at most C(A)(log(2+F/N)+N/√F). Endpoint stationary terms may have full weight because their discrepancy is included in N/√F.

**Construction or proof route.** Apply truncated Poisson summation with derivative-range endpoints enlarged by one. Use the quantitative stationary-phase estimate on interior saddle points, retain the endpoint error terms, and sum their reciprocal-distance bounds. Negative f″ follows by conjugation, with phase −1/8.

**Direct prerequisites:** [One-dimensional stationary phase](#es0-stationary-phase-leading).

**Source:** [Lectures on exponential sums](https://www.atmschools.org/sites/default/files/Baier-Lectures_on_expo_sums.pdf), Theorem21 and proof sketch pp.21–22; Lemma16 pp.13–14 and Theorem20 pp.20–21. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-symmetric-dirichlet-kernel"></a>

### Symmetric Dirichlet kernel

Contract `ExponentialSumsAndCircleMethod:ES.0/symmetric-dirichlet-kernel` (definition).

D_H(α)=Σ_{−H≤m≤H}fourier(m)(α) for H∈ℕ and α∈ℝ/ℤ. This uses native positive-sign Fourier characters and probability Haar measure.

**API.**

- `symmetricDirichletKernel_zero` (simp): H=0 gives the constant 1.
- `symmetricDirichletKernel_at_zero` (simp): At α=0 the value is 2H+1.
- `symmetricDirichletKernel_continuous` (structure): The function is continuous and integrable on the probability torus.
- `symmetricDirichletKernel_lift` (compatibility): On a real lift x the summands are exp(2πimx); integer shifts do not change the value.


**Named examples and contract tests.**

- `symmetricDirichletKernel_zero_test` (degenerate): H=0 gives 1, distinguishing whether frequency zero is included.
- `symmetricDirichletKernel_one_half_test` (computation): At H=1 and α=1/2 the value is −1.
- `symmetricDirichletKernel_at_zero_test` (computation): At H=2 and α=0 the value is 5.


**Uses:** Skorobogatov–Sofos §3 coefficient averages: Supplies the correctly oriented coefficient kernel.; ES.1 smoothing transfers: Controls cutoff operators by their L¹ norm..

**Construction or proof route.** Take the indicated finite integer interval in the already specified weighted torus sum; no new transform or measure is introduced.

**Direct prerequisites:** `mathlib:fourier`.

**Source:** [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), §3, definitions before (3.2), pp.691–692. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-one-sided-dirichlet-kernel"></a>

### One-sided Dirichlet kernel

Contract `ExponentialSumsAndCircleMethod:ES.0/one-sided-dirichlet-kernel` (definition).

D_H⁺(α)=Σ_{1≤m≤H}fourier(m)(α) for H∈ℕ and α∈ℝ/ℤ. This uses native positive-sign Fourier characters and probability Haar measure.

**API.**

- `oneSidedDirichletKernel_zero` (simp): H=0 gives the constant 0.
- `oneSidedDirichletKernel_at_zero` (simp): At α=0 the value is H.
- `oneSidedDirichletKernel_continuous` (structure): The function is continuous and integrable on the probability torus.
- `oneSidedDirichletKernel_lift` (compatibility): On a real lift x the summands are exp(2πimx); integer shifts do not change the value.


**Named examples and contract tests.**

- `oneSidedDirichletKernel_zero_test` (degenerate): H=0 gives 0, distinguishing whether frequency zero is included.
- `oneSidedDirichletKernel_one_half_test` (computation): At H=1 and α=1/2 the value is −1.
- `oneSidedDirichletKernel_at_zero_test` (computation): At H=2 and α=0 the value is 2.


**Uses:** Skorobogatov–Sofos §3 coefficient averages: Supplies the correctly oriented coefficient kernel.; ES.1 smoothing transfers: Controls cutoff operators by their L¹ norm..

**Construction or proof route.** Take the indicated finite integer interval in the already specified weighted torus sum; no new transform or measure is introduced.

**Direct prerequisites:** `mathlib:fourier`.

**Source:** [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), §3, definitions before (3.2), pp.691–692. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-dirichlet-kernel-l1"></a>

### Dirichlet-kernel L¹ bounds

Contract `ExponentialSumsAndCircleMethod:ES.0/dirichlet-kernel-l1` (theorem).

There is an absolute C>0 such that for every H≥0, both ∫_{ℝ/ℤ}|D_H| and ∫_{ℝ/ℤ}|D_H⁺| are at most C log(2+H). The measure is probability Haar. The positive logarithm covers H=0 and H=1; the one-sided bound does not follow by identifying its kernel with the symmetric kernel.

**Construction or proof route.** Evaluate each geometric sum and bound it by its number of terms and by a constant times dist(x,ℤ)⁻¹. Integrate the minimum of these bounds, splitting at 1/(H+1). Treat H=0 separately.

**Direct prerequisites:** [Symmetric Dirichlet kernel](#es0-symmetric-dirichlet-kernel); [One-sided Dirichlet kernel](#es0-one-sided-dirichlet-kernel).

**Source:** [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), §3, (3.2) pp.691–692; positive logarithm at the finite endpoint is an explicit correction. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-burgess-character-bound"></a>

### Burgess short-character estimate

Contract `ExponentialSumsAndCircleMethod:ES.0/burgess-character-bound` (theorem).

For r≥1 and ε>0 there is C(r,ε)>0 such that for every nonprincipal character χ modulo q≥2, all M∈ℤ and N≥1, |Σ_{M<m≤M+N}χ(m)|≤C N^(1−1/r) q^((r+1)/(4r²)+ε), provided q is cube-free or r≤3. For real nonprincipal characters the same estimate holds for every fixed r and arbitrary q, after treating their bounded two-adic conductor and induced zero factors. Primitivity is not silently inferred from nonprincipality.

**Construction or proof route.** The Burgess shift-and-average method reduces a 2r-th moment to complete multiplicative-character sums supplied by FF.2. Prime-power conductor reduction and the two-adic factor must be checked; FIMR quotes the external theorem, so this is a source-proof frontier, not a closed derivation.

**Direct prerequisites:** `FiniteFieldsAndCharacterSums:FF.2`.

**Source:** [Spins of prime ideals](https://arxiv.org/pdf/1110.6331v2), §9, (9.2), Corollary9.1 and qualification pp.39–40. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.

**Source:** [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Proposition2 and proof pp.968–969, routed item147. The analytic proof uses the finite Burgess character estimate to obtain the |d|^{3/16+ε} Dirichlet central-line bound. ES supplies that finite estimate; the L-function consequence is imported by AN.


<a id="es0-short-character-hypothesis"></a>

### FIMR short-character hypothesis

Contract `ExponentialSumsAndCircleMethod:ES.0/short-character-hypothesis` (definition).

shortCharacterHypothesis(n,δ) means n≥3, δ>0, and: for each ε>0 there is C(n,δ,ε)>0 such that for every integer Q≥3, every real nonprincipal character χ modulo 1≤q≤Q, every M∈ℤ and 1≤N≤Q^(1/n), |Σ_{M<m≤M+N}χ(m)|≤C Q^((1−δ)/n+ε). All shifts and moduli share the same C. C_n is the existential assertion that such a δ exists. For n≥4 it is a conjectural hypothesis.

**API.**

- `shortCharacterHypothesis_range` (projection): The predicate implies n≥3 and δ>0.
- `shortCharacterHypothesis_bound` (projection): For ε>0, extract one constant valid for all admitted Q,q,χ,M,N.
- `shortCharacterHypothesis_weaken` (relation): If 0<δ′≤δ then the hypothesis with δ implies the hypothesis with δ′.
- `shortCharacterHypothesis_progression` (compatibility): For a progression modulus coprime to q, reindexing gives the same bound uniformly in the progression residue and interval shift.


**Named examples and contract tests.**

- `shortCharacterHypothesis_small_degree_test` (non-example): The predicate is false for n=2, for every δ.
- `shortCharacterHypothesis_zero_saving_test` (non-example): The predicate with δ=0 is false, for every n.
- `shortCharacterHypothesis_shift_test` (compatibility): Its bound applies to an interval beginning at M=−20 as well as at zero; one extracted constant works for both shifts.


**Uses:** FIMR Theorem1.1 and Koymans–Milovic typeI estimates: Keep C_n in every higher-degree consumer’s hypotheses.; SV.5 and ST.3 spin endpoints: Provide the named analytic assumption; no new unconditional C_4 theorem is supplied..

**Construction or proof route.** Define a fully specified quantified predicate using native Dirichlet characters, integer intervals and real powers. It is not an axiom or an assumed proof of the desired endpoints.

**Direct prerequisites:** `mathlib:MulChar.IsQuadratic`.

**Source:** [Spins of prime ideals](https://arxiv.org/pdf/1110.6331v2), §9, ConjectureC_n (9.4) pp.39–40; Koymans–Milovic §2.5 pp.6–7. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-burgess-cubic-hypothesis"></a>

### Unconditional cubic short-character hypothesis

Contract `ExponentialSumsAndCircleMethod:ES.0/burgess-cubic-hypothesis` (theorem).

shortCharacterHypothesis(3,1/48) holds. Indeed the real-character r=6 estimate is C(ε)N^(5/6)q^(7/144+ε); for N≤Q^(1/3),q≤Q the combined exponent is 47/144+ε=(1−1/48)/3+ε.

**Construction or proof route.** Specialize the Burgess theorem to r=6; increase N and q to the upper Q bounds using nonnegative exponents. Compute 5/18+7/144=47/144. This computation gives no positive saving for n=4.

**Direct prerequisites:** [Burgess short-character estimate](#es0-burgess-character-bound); [FIMR short-character hypothesis](#es0-short-character-hypothesis).

**Source:** [Spins of prime ideals](https://arxiv.org/pdf/1110.6331v2), Corollary9.1 (9.3) and (9.5), pp.39–40. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-short-jacobi-progression"></a>

### Conditional Jacobi progression estimate

Contract `ExponentialSumsAndCircleMethod:ES.0/short-jacobi-progression` (theorem).

Assume shortCharacterHypothesis(n,δ). For every ε>0 there is C(n,δ,ε)>0 such that for every odd squarefree q>1, its primitive quadratic character χ_q, every nonzero integer k with q∤k, every l,M∈ℤ and 1≤N≤q^(1/n), |Σ_{M<m≤M+N, k∣m−l}χ_q(m)|≤C q^((1−δ)/n+ε). The constant is uniform in k,l,M. This ε-loss version retains the same δ. Shrinking δ absorbs ε to recover a fixed positive saving, as in the quoted corollary.

**Construction or proof route.** Let d=gcd(k,q). If d∤l the progression imposes fixed nonzero residue classes at primes dividing d; if d∣l it forces χ_q to vanish at those primes. In the nonzero case remove the fixed prime factors and apply C_n to the remaining nonprincipal squarefree character modulo q/d and the reindexed interval, using Q=q. Squarefreeness and q∤k ensure q/d>1. Bound the fixed factors by one.

**Direct prerequisites:** [FIMR short-character hypothesis](#es0-short-character-hypothesis).

**Source:** [Joint distribution of spins](https://arxiv.org/pdf/1809.09597v1), §2.5 Corollary2.2 p.7; FIMR (9.7) p.40 treats the coprime case. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-graham-ringrose-bound"></a>

### Graham–Ringrose smooth-modulus estimate

Contract `ExponentialSumsAndCircleMethod:ES.0/graham-ringrose-bound` (theorem).

Let r≥1, q₁>1 squarefree, and q₁,…,q_r≥1 pairwise coprime. Let π_i be Dirichlet characters at these ambient moduli, with π₁ primitive. Put R₀=max(q₂,…,q_r,q₁^(1/4))q₁^(5/4), where the maximum is q₁^(1/4) if r=1. For real M and R≥R₀, |Σ_{M<m≤M+R}∏_iπ_i(m)|≤4R(τ(q₁)^(r²)/q₁)^(2^(−r)). Ambient moduli of factors are preserved; the theorem does not require every factor primitive.

**Construction or proof route.** Iterate q-van der Corput differencing along the coprime blocks, complete the resulting correlations, and use the FF.2 complete bounds. The incoming CRT packing and numerical threshold nodes apply this statement. The full external analytic proof remains a precisely identified gap.

**Direct prerequisites:** [One-step q–van der Corput estimate](#es0-q-vdc-uniform-correlation); `FiniteFieldsAndCharacterSums:FF.2`.

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8.1, Theorem6 pp.376–377, quoting Graham–Ringrose and Iwaniec–Kowalski Theorem12.13. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-distinct-quadratic-cancellation"></a>

### Distinct quadratic character cancellation

Contract `ExponentialSumsAndCircleMethod:ES.0/distinct-quadratic-cancellation` (theorem).

For every c>0 there is an effective K(c) such that for every integer k≥K(c) and distinct primitive quadratic Dirichlet characters χ₁,χ₂ of conductors N₁,N₂≤k^c, if the largest prime factor of N₁N₂ is at most k^(7/16), then |Σ_{k/2<m≤k}χ₁(m)χ₂(m)|≤k^(1−γ), where γ=2^(−10c−6). The interval has real lower endpoint k/2 and integral m, so its integer version is (⌊k/2⌋,k].

**Construction or proof route.** Form the product at its ambient lcm, reduce its nonprincipal primitive part, and retain the prime-exclusion mask at the ambient level. Use incoming small-conductor Möbius cancellation for the small primitive conductor. For the other case use the incoming bounded CRT blocks, Graham–Ringrose, the AN.5 divisor bound and the uniform numeric threshold. Choose K(c) to satisfy both thresholds and absorb fixed factors without changing the stated γ.

**Direct prerequisites:** [Graham–Ringrose smooth-modulus estimate](#es0-graham-ringrose-bound); [Small-conductor cancellation for the original product](#es0-small-conductor-product-cancellation); [Large-conductor character blocks and interval threshold](#es0-large-conductor-character-blocks).

**Source:** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Proposition8.2 and both proof cases, pp.377–379. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-polar-forms"></a>

### Polar forms

Contract `ExponentialSumsAndCircleMethod:ES.0/polar-forms` (definition).

For a commutative ring R, n,r≥0, a tensor c indexed by (r+1)-tuples of n coordinate indices, and r vectors u, define polarForm(c,u)_j=(r+1)!Σ_{a∈(Fin n)^r}c(a₁,…,a_r,j)∏_{t=1}^r u^(t)_{a_t}. For a symmetric tensor of a degree-k homogeneous form, r=k−1. Over characteristic p>k the factorial is a unit; it must not be cancelled in characteristic dividing k!.

**API.**

- `polarForm_zero_tensor` (simp): The zero coefficient tensor gives zero.
- `polarForm_add_slot` (relation): Each vector slot is additive.
- `polarForm_smul_slot` (relation): Multiplying a slot by a scalar multiplies the result by that scalar.
- `polarForm_diagonal` (compatibility): For symmetric c of f₀ and k=r+1, the diagonal value is r! times ∂_j f₀.
- `polarForm_map` (functoriality): A ring homomorphism commutes with polarForm on both coefficients and vectors.


**Named examples and contract tests.**

- `polarForm_cubic_test` (computation): For R=ℚ,n=1,r=2,c=1 and both vectors equal1, the value is6.
- `polarForm_zero_slot_test` (degenerate): The same cubic tensor with its first vector zero gives0.
- `polarForm_bad_characteristic_test` (non-example): In F₃ the same tensor and unit vectors give0, so the factorial cannot be cancelled.


**Uses:** Browning–Sawin Lemma6.1: Convert differencing equations to polynomial coefficient conditions.; Browning–Sawin Proposition6.2: Use symmetry for shrinking and the diagonal gradient for the dimension bound..

**Construction or proof route.** Use the native finite coordinate sums, multiplication and natural-number cast; this is an explicit tensor evaluation, not a new multilinear-map theory.

**Direct prerequisites:** `mathlib:Finset.sum_mul`; `mathlib:Finset.prod_mul_distrib`.

**Source:** [A geometric version of the circle method](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p04-s.pdf), §5 p.932 and §6 p.936, definition of Ψ_j. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-multivariate-polarization"></a>

### Top-degree polarization identity

Contract `ExponentialSumsAndCircleMethod:ES.0/multivariate-polarization` (theorem).

Let k=r+1≥1, f=f₀+L with deg L≤r, and f₀(X)=Σ_{a∈(Fin n)^k}c(a)∏_tX_{a_t} with symmetric c. For r vectors u, the r successive differences Δ_{u¹}⋯Δ_{uʳ}f evaluated at x, minus their value at0, equal Σ_j polarForm(c,u)_j x_j. Lower-degree terms contribute only a constant and disappear from this linear part. No factorial is inverted in this identity.

**Construction or proof route.** Expand each monomial under the r difference operators. Only terms using all r increment slots and exactly one x factor survive after subtraction at zero. Symmetry collects the k! placements. A polynomial of degree≤r has constant r-th difference.

**Direct prerequisites:** [Polar forms](#es0-polar-forms); `mathlib:fwdDiff`.

**Source:** [A geometric version of the circle method](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p04-s.pdf), §5, paragraph following Proposition5.5 p.932. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-polar-zero-locus"></a>

### Common polar-zero locus

Contract `ExponentialSumsAndCircleMethod:ES.0/polar-zero-locus` (definition).

polarZeroLocus(c) is the native set of r vector tuples u for which polarForm(c,u)_j=0 for every j. It is the common zero set of n multihomogeneous polynomials, each degree1 in every vector block. For r≥1 the zero tuple belongs; equality with the diagonal singular locus uses the polarization identity and invertibility of k!.

**API.**

- `mem_polarZeroLocus` (characterisation): Membership means all polar coordinates vanish.
- `polarZeroLocus_zero_tensor` (simp): A zero tensor gives the whole space.
- `zero_mem_polarZeroLocus` (simp): For r≥1 the zero tuple belongs.
- `polarZeroLocus_smul_slot` (relation): Scalar multiplication in a single block preserves membership.


**Named examples and contract tests.**

- `polarZeroLocus_cubic_unit_test` (non-example): Over ℚ, n=1,r=2,c=1, the pair(1,1) does not belong.
- `polarZeroLocus_cubic_zero_test` (computation): For the same tensor the pair(0,1) belongs.
- `polarZeroLocus_zero_tensor_test` (degenerate): The zero tensor gives the whole tuple space.


**Uses:** ES.0 polar dimension: The diagonal intersection is the origin for a smooth leading form.; ES.1 shrunken count: The minor-arc condition forces all counted tuples into this locus..

**Construction or proof route.** Define the native common-zero set; its coordinate polynomial ideal supplies its scheme interpretation without a replacement affine-space structure.

**Direct prerequisites:** [Polar forms](#es0-polar-forms).

**Source:** [A geometric version of the circle method](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p04-s.pdf), §6 p.939, common Ψ_j-zero variety used in Proposition6.2. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-iterated-function-field-shrinking"></a>

### Iterated multilinear shrinking

Contract `ExponentialSumsAndCircleMethod:ES.0/iterated-function-field-shrinking` (theorem).

For symmetric c, char F_q>k=r+1≥3, d≥0 and 0≤s≤d, N(c,b,d,d)≤q^(rns)N(c,b,d−s,d+rs). The multiplier is q^(rns); neither the tightened fractional cutoff nor the changed box may be omitted.

**Construction or proof route.** Freeze all blocks except one and apply the independent nonarchimedean symmetric-matrix shrinking theorem. At step j the parameters are a=d,c=d+(j−1)s, so max(floor((a−c)/2),0)=0. Sum over frozen blocks and iterate r times.

**Direct prerequisites:** [Function-field differencing count](#es1-function-field-polar-count); [Polar forms](#es0-polar-forms).

**Source:** [A geometric version of the circle method](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p04-s.pdf), §6 after Lemma6.4 p.938. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-short-polar-values-zero"></a>

### Minor-arc exclusion forces polar values to vanish

Contract `ExponentialSumsAndCircleMethod:ES.0/short-polar-values-zero` (theorem).

Put L=kd, d≤m≤kd/2, r=k−1≥2 and s=d−floor(m/r). Suppose b lies outside the closed Hankel major arc A_m: equivalently there is no nonzero polynomial h of degree≤m whose first L−m negative coefficients in αh vanish. Every tuple counted by N(c,b,d−s,d+rs) then satisfies Ψ_j(u)=0 for every j.

**Construction or proof route.** A nonzero h=Ψ_j(u) has degree≤r(d−s−1)≤m. The fractional cutoff annihilates its first d+rs≥L−m negative coefficients. Its coefficient vector is a nonzero kernel vector for the Hankel matrix, contradicting the stated exclusion. This uses only the independent early Padé/Hankel prefix, not mapping-space cohomology.

**Direct prerequisites:** [Function-field differencing count](#es1-function-field-polar-count).

**Source:** [A geometric version of the circle method](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p04-s.pdf), Proof of Proposition6.2 pp.938–939; Lemma2.4(4) pp.903–904. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-polar-dimension-bound"></a>

### Polar-zero dimension bound

Contract `ExponentialSumsAndCircleMethod:ES.0/polar-dimension-bound` (theorem).

Let char F_q>k≥3 and let the homogeneous leading form f₀ define a smooth projective hypersurface. Then the common polar-zero scheme W⊆A^{n(k−1)} has dimension at most n(k−2). More generally it suffices that its common diagonal polar zeros over an algebraic closure consist only of0. The bound refers to geometric Krull dimension, not the number of rational zeros.

**Construction or proof route.** The diagonal copy of Aⁿ meets W only at0 by the gradient identity and Euler’s identity. Every multicone component contains0. Apply the independent affine intersection-dimension theorem componentwise: dim(W)+n−n(k−1)≤0.

**Direct prerequisites:** [Common polar-zero locus](#es0-polar-zero-locus); [Top-degree polarization identity](#es0-multivariate-polarization).

**Source:** [A geometric version of the circle method](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p04-s.pdf), Proof of Proposition6.2 p.939. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-vmv-weyl-bound"></a>

### Mean-value Weyl bound

Contract `ExponentialSumsAndCircleMethod:ES.0/vmv-weyl-bound` (theorem).

For k≥3,ε>0, real coefficientsα₁,…,α_k, and a reduced rational approximation |α_j−a/q|≤q^{-2} for any2≤j≤k, the lengthN polynomial sum is bounded by C(k,ε)N^{1+ε}(q^{-1}+N^{-1}+qN^{-j})^{1/(k(k−1))}. The classical differencing exponent2^{1−k} is a separate result.

**Construction or proof route.** Raise the sum to a moment, group equal lower power sums, and apply Cauchy–Schwarz. Shift the tuples, bound the remaining linear inner sum by a rational-block reciprocal-distance sum, and dominate translated counts by J_{k(k−1)/2,k−1}(3N). Apply the main mean-value bound and absorb divisor/log factors. Generalj is obtained by the analogous coefficient elimination; the displayed proof writes j=k.

**Direct prerequisites:** [Vinogradov mean-value theorem](#es2-vinogradov-main-bound); [Polynomial Weyl inequality](#es0-polynomial-weyl-inequality).

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), Theorem8.8 and proof pp.79–82. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es0-prime-bilinear-estimates"></a>

### Exponential Type I and Type II estimates

Contract `ExponentialSumsAndCircleMethod:ES.0/prime-bilinear-estimates` (theorem).

There is an absoluteC≥1 such that the following inverse estimates hold for M,N≥1,δ∈(0,1],θ∈ℝ/ℤ and a finite product intervalI. TypeI: a bounded sequencea_m and a real monotone sequenceb_n with bilinear sum>δMN‖a‖∞‖b‖∞ force N≤Cδ^{-2} or a positiveq≤Cδ^{-1} with ‖qθ‖≤Cδ^{-2}/(MN). TypeII: sum>δ√(MN)‖a‖₂‖b‖₂ forces min(M,N)≤Cδ^{-4} or q≤Cδ^{-2},‖qθ‖≤Cδ^{-4}/(MN).

**Construction or proof route.** TypeI uses monotone partial summation and the geometric sum to produce many small fractional parts. A spacing lemma turns them into a small rational denominator. TypeII applies Cauchy–Schwarz, expands in differencesn−n′, and repeats the same spacing argument. The elementary positive-density fractional-part pigeonhole estimate is included in the sketch of this key theorem; no new generic sieve identity is planned.

**Direct prerequisites:** [Kusmin–Landau inequality](#es0-kusmin-landau); [Completion of finite sums](#es0-finite-completion).

**Source:** [254A, Notes 8: The Hardy–Littlewood circle method](https://terrytao.wordpress.com/2015/03/22/254a-notes-8-the-hardy-littlewood-circle-method/), Theorem14 and complete proof §1; Lemmas12–13. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


### Required refinements for this layer

- Burgess original proof and conductor adapters: Acquire a complete publicly readable proof of the exact Burgess theorem, including imprimitive real characters and the bounded two-adic conductor, and identify the exact FF.2 complete 2r-th-moment character bound. The FIMR quotation and its r=6 consequence have exact contracts but are not an independent proof of Burgess.
- Complete Graham–Ringrose proof: Routed item92 remains open: read and decompose the complete external Graham–Ringrose proof, or the exact Iwaniec–Kowalski Theorem12.13 version used by Bennett–Siksek. The published quotation is not its proof. Routed item95 now has exact bounded character factors, all-integer reconstruction, distinguished primitivity, r<10c+2 and R₀<k/2 through large-conductor-character-blocks. The conductor shape is imported from the two exact CA.1 nodes and binary primitivity from its exact CA.1 supplier. Remaining analytic work must preserve ambient moduli for general factors, permit one factor and empty principal families, and align real interval endpoints. The finite q–van der Corput nodes now supply exact elementary averaging and lag reduction. They do not establish a bound for the resulting correlations or the required iterated multiplicative-character estimate.
- Full distinct-quadratic cancellation proposition: The full Proposition8.2 target now has an exact node and its published argument has been read. Its remaining analytic prerequisite is the complete Graham–Ringrose estimate, with the FF.2 correlation request. Verify the uniform numeric threshold against the real interval(k/2,k], including oddk. Conductor classification and the small-conductor Möbius argument are imported from their exact owners.
- Independent early geometric suppliers: The pending GeometricCircleMethodAndMappingSpaces prefix has no published stage/node id in this snapshot. It must supply componentwise affine intersection dimension and the coefficient-uniform polynomial-box bound #W(F_q[T]_{<D})≤C(N,degree)q^{D dim W}, including D=0, strict degree, and zero-dimensional boundary. Match its independent Padé/Hankel equivalence to the explicit kernel exclusion used here. Do not import the late mapping/cohomology stages into ES.0 or ES.1.
- Independent function-field lattice shrinking supplier: The pending FunctionFieldLatticesAndShrinking PartII has no published stage/node id in this snapshot. Request its independent symmetric γ theorem N_{γ,a,c}≤q^{ns+n max(floor((a−c)/2),0)}N_{γ,a−s,c+s}, including strict-ball counts and adjoint-minimum normalization. This is a supplier gap; ES does not reproduce its lattice definitions.
- Quadratic two-adic source boundary: Assing Lemma6.16 is false for n=p=2,v=3 (E18); the complete-power-sum recursion and its later analytic consumers cannot cite the blanket range. Supply the corrected two-adic quadratic bases before using the improved degree-two singular-series proof. Finite-field Gauss inputs stay with FF.1; composite prime-power stationary phase is not claimed from a finite-field bound.
- Quantitative discrete derivative proof interfaces: The selected notes omit the complete Kusmin–Landau proof and the truncated Poisson and quantitative finite-interval stationary-phase proofs needed for B process. The smooth compact-support stationary theorem alone does not establish the displayed B-process error. Supply those three exact interfaces, preserving endpoint errors and constants C(A).
- Smooth stationary normal form: Locate the smooth one-dimensional normal-form/change-of-variables statement at the pinned baseline or in DifferentialGeometry, including the Jacobian derivative controls used in the leading lam^(−3/2) remainder. The selected proof explains the reduction but the native library adapter remains open.



## ES.1 — Fourier counting identities

Integer solutions become Fourier coefficients using normalized Haar measure. Finite weighted identities precede countable summable identities, so interchanges and limiting arguments carry summability hypotheses. Arc definitions specify neither disjointness nor analytic estimates until their separate hypotheses are proved. Function-field coefficient arrays and strict cutoffs preserve the original polynomial-box normalization.

**Atlas planets:** Weighted torus sum; Fourier counting identity; Major arcs; Function-field polar count.

**Coverage:** planned. The exact contracts follow; stage-specific refinements are listed after them.


<a id="es1-weighted-torus-sum"></a>

### Weighted torus exponential sum

Contract `ExponentialSumsAndCircleMethod:ES.1/weighted-torus-sum` (definition).

For any finite subset A of a type ι, integral frequency map Φ:ι→ℤⁿ and complex weights w:ι→ℂ, define weightedTorusSum(A,Φ,w)(α)=Σ_{a∈A} w(a)∏_{j∈Fin n} fourier(Φ(a)ⱼ)(αⱼ), for α∈(ℝ/ℤ)ⁿ. All torus characters and probability Haar measures are the existing Mathlib objects. No cyclic finite Fourier transform is redefined.

**Additional hypotheses:** n≥0 is natural; A is finite; no positivity or multiplicativity is assumed for w. Coordinates are indexed by Fin n. Empty products equal one..

**API.**

- `weightedTorusSum_empty` (simp): For A empty, weightedTorusSum is identically zero.
- `weightedTorusSum_singleton` (simp): For A={a}, the value is w(a)∏ⱼfourier(Φ(a)ⱼ)(αⱼ).
- `weightedTorusSum_zero` (simp): At α=0 the value is the sum of the weights.
- `weightedTorusSum_add_weights` (relation): For weights u+v the sum is the sum of the two weighted torus sums.
- `weightedTorusSum_continuous` (structure): The function of α is continuous, and hence integrable for the product probability Haar measure.
- `weightedTorusSum_integer_phase` (compatibility): For a real lift x∈ℝⁿ, its value is Σ_a w(a)exp(2πi ΣⱼΦ(a)ⱼxⱼ), independent of the lift.
- `weightedTorusSum_zero_dimension` (characterisation): For n=0 the function on the one-point torus is Σ_aw(a).


**Named examples and contract tests.**

- `weightedTorusSum_empty_test` (degenerate): The empty set gives zero, not a constant one character.
- `weightedTorusSum_singleton_negative_test` (computation): For n=1, A={0}, Φ(0)=−1, w(0)=2 and α=1/4, the value is −2i.
- `weightedTorusSum_fourier_test` (compatibility): For a singleton of weight one and frequency m in dimension one the function is the existing fourier(m).
- `weightedTorusSum_zero_dimension_test` (degenerate): In dimension zero two weights 2 and −3 give value −1, not zero.


**Uses:** BDG Theorem4.1; ES.2 discrete restriction: Retains arbitrary complex coefficients in the finite sum.; ES.1 coefficient extraction; ES.4 prime-weighted branch: Weights may encode configuration multiplicities or arithmetic weights without altering torus normalization..

**Construction or proof route.** Use native continuous Fourier monomials and finite products, then the finite weighted sum. Continuity is preserved under finite sums/products; the sum is integrable on the compact probability torus. Translate the character convention using fourier_coe_apply, with T=1; the exponent has the positive 2πi sign.

**Direct prerequisites:** `mathlib:fourier`; `mathlib:fourier_coe_apply`; `mathlib:fourier_add`; `mathlib:fourier_neg`; `mathlib:fourier_eval_zero`; `mathlib:fourier_zero`; `mathlib:AddCircle.haarAddCircle`; `mathlib:MeasureTheory.Measure.pi`; `mathlib:Continuous.integrable_of_hasCompactSupport`.

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), §1 p.633 and Theorem4.1 pp.637–638. The torus phase and weighted finite sums follow the published normalization; extension to a finite carrier is finite algebra.


<a id="es1-torus-coefficient-extraction"></a>

### Torus coefficient-counting identity

Contract `ExponentialSumsAndCircleMethod:ES.1/torus-coefficient-extraction` (theorem).

For the preceding A,Φ,w and b∈ℤⁿ, the integral of weightedTorusSum(A,Φ,w)(α)∏ⱼfourier(−bⱼ)(αⱼ), with respect to the product probability Haar measure, equals Σ_{a∈A,Φ(a)=b}w(a). The equality is complex-valued and exact; it requires neither a limiting integral nor an asymptotic hypothesis.

**Additional hypotheses:** All input sums are finite; product measure is ΠⱼhaarAddCircle at period one. Complex signed weights are allowed..

**Construction or proof route.** Distribute the finite sum through the integral; each summand is integrable because it is continuous on the compact torus. Combine frequencies Φ(a)ⱼ−bⱼ by fourier_add and fourier_neg. Use native Fourier-coefficient orthogonality on each coordinate, then native finite-product Fubini. The product of Kronecker deltas is one exactly when Φ(a)=b.

**Direct prerequisites:** [Weighted torus exponential sum](#es1-weighted-torus-sum); `mathlib:fourierCoeff`; `mathlib:fourierCoeff_fourier`; `mathlib:MeasureTheory.integral_fintype_prod_eq_prod`; `mathlib:MeasureTheory.Measure.pi`; `mathlib:MeasureTheory.integral_finsetSum`.

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), §1 p.633 and Theorem4.1 pp.637–638. The torus phase and weighted finite sums follow the published normalization; extension to a finite carrier is finite algebra.


<a id="es1-moment-weyl-sum"></a>

### Moment-curve Weyl sum

Contract `ExponentialSumsAndCircleMethod:ES.1/moment-weyl-sum` (definition).

For n,N≥0 natural, momentWeylSum(n,N)(α)=Σ_{1≤m≤N}∏_{j∈Fin n}fourier(m^(j+1))(αⱼ). It is weightedTorusSum on the positive natural interval with weights one and moment frequencies m,m²,…,mⁿ. The exponent j+1 excludes an accidental constant-frequency coordinate; zero is not included in the summation interval.

**Additional hypotheses:** The value is a complex function on the product of n copies of AddCircle(1). N=0 and n=0 are defined explicitly by native empty-sum/product conventions..

**API.**

- `momentWeylSum_eq_weightedTorusSum` (compatibility): The specialization of weightedTorusSum uses Φ(m)ⱼ=m^(j+1) and w(m)=1.
- `momentWeylSum_zero_cutoff` (simp): For N=0 the function is zero.
- `momentWeylSum_zero_phase` (simp): For α=0 its value is the natural N cast into ℂ.
- `momentWeylSum_zero_dimension` (simp): For n=0 its value is N at the unique torus point.
- `momentWeylSum_real_lift` (compatibility): For x∈ℝⁿ the value is Σ_{1≤m≤N}exp(2πi Σ_{j=1}ⁿxⱼmʲ).


**Named examples and contract tests.**

- `momentWeylSum_zero_cutoff_test` (degenerate): For every n, N=0 gives zero.
- `momentWeylSum_zero_phase_test` (computation): For n=2,N=3 and α=(0,0), the value is 3.
- `momentWeylSum_linear_test` (compatibility): For n=1,N=1 the function agrees with the existing frequency-one Fourier monomial.
- `momentWeylSum_signed_value_test` (computation): For n=1,N=2 and α=1/2 the sum is zero; adding m=0 would incorrectly give one.


**Uses:** BDG §1 p.633 and §5 p.639: Provides the exact phase sum in mean values, not a totalized infinite Fourier series.; ES.2 Vinogradov mean-value integral: The integral of its 2s-th norm power counts ordered solution pairs..

**Construction or proof route.** Specialize weightedTorusSum to the native interval [1,N], constant weights one and the integer moment map. Re-use all continuity and integration properties of weightedTorusSum. The real-lift comparison is exactly the exponential sum in BDG §1, p.633.

**Direct prerequisites:** [Weighted torus exponential sum](#es1-weighted-torus-sum); `mathlib:fourier`; `mathlib:fourier_coe_apply`; `mathlib:fourier_add`; `mathlib:fourier_neg`; `mathlib:fourier_eval_zero`; `mathlib:fourier_zero`.

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), §1 p.633; §5 p.639. Matches the moment sum used for the mean-value integral and keeps all n coordinates.


<a id="es1-vinogradov-counting-integral"></a>

### Vinogradov counting integral

Contract `ExponentialSumsAndCircleMethod:ES.1/vinogradov-counting-integral` (theorem).

For all natural n,s,N, vinogradovMeanValue(n,s,N)=∫_{(ℝ/ℤ)ⁿ}‖momentWeylSum(n,N)(α)‖^(2s)dα. The left side is cast into ℝ, and dα is the product of the native probability Haar measures. Ordered tuples, positive entries and all n moment equations match exactly.

**Additional hypotheses:** This finite identity also covers n=0,s=0 and N=0; the convention is 0⁰=1. No mean-value estimate is assumed..

**Construction or proof route.** Expand the s-th power of the finite sum and its complex conjugate over the ordered x and y configurations. Apply torus-coefficient-extraction to the frequency vector of moment differences. The surviving weights are one on the concrete solution subtype; take the real part and use zˢconjugate(z)ˢ=‖z‖^(2s).

**Direct prerequisites:** [Torus coefficient-counting identity](#es1-torus-coefficient-extraction); [Moment-curve Weyl sum](#es1-moment-weyl-sum); [Vinogradov mean value](#es2-vinogradov-mean-value); `mathlib:fourier`; `mathlib:fourier_coe_apply`; `mathlib:fourier_add`; `mathlib:fourier_neg`; `mathlib:fourier_eval_zero`; `mathlib:fourier_zero`; `mathlib:Fintype.card`; `mathlib:MeasureTheory.Measure.pi`; `mathlib:MeasureTheory.integral_finsetSum`.

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), §1 p.633, analytic representation. The equality is the exact analytic representation, with boundary cases justified by finite expansion.


<a id="es1-reduced-arc-indices"></a>

### Reduced rational arc indices

Contract `ExponentialSumsAndCircleMethod:ES.1/reduced-arc-indices` (definition).

For a natural denominator cutoff Q, reducedArcIndices(Q) is the finite set of pairs (a,q) with 1≤q≤Q, 0≤a<q and gcd(a,q)=1. Use a filtered native finite product. The pair (0,1) is the unique zero centre, representing the source fraction 1/1 modulo one. The numerator q is excluded, and nonreduced presentations are not counted twice.

**Additional hypotheses:** Q is natural, possibly zero. Both components are natural; a=0 is permitted only at q=1 by coprimality..

**API.**

- `mem_reducedArcIndices` (characterisation): (a,q) is indexed iff 1≤q≤Q, a<q and Nat.Coprime a q.
- `reducedArcIndices_zero` (simp): The zero cutoff gives the empty finite set.
- `reducedArcIndices_one` (simp): The cutoff one gives {(0,1)}.
- `reducedArcIndices_mono` (relation): Q≤R implies the Q index set is a subset of the R index set.


**Named examples and contract tests.**

- `reducedArcIndices_zero_test` (degenerate): The cutoff zero has cardinality zero, not one.
- `reducedArcIndices_one_test` (computation): The cutoff one is {(0,1)}, not {(1,1)}.
- `reducedArcIndices_three_test` (computation): The cutoff three is {(0,1),(1,2),(1,3),(2,3)}.
- `reducedArcIndices_nonreduced_test` (compatibility): At cutoff four (1,2) is present and (2,4) is absent, matching reduced rational representatives.


**Uses:** Assing §6.1 p.34; major-arc sum: Provides a finite once-only list of centres, with the wrapped zero arc included.; Pairwise arc separation: Coprimality is essential for excluding two presentations of one torus point..

**Construction or proof route.** Filter the product of the two ranges [0,Q] by positivity, a<q and coprimality. Extract the exact membership formula from native finite-product/filter membership. Reduced fractions in [0,1) give unique torus centres; the proof uses cross multiplication and coprimality, not merely injectivity of real-to-torus coercion.

**Direct prerequisites:** `mathlib:Finset.product`; `mathlib:Finset.filter`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 p.34, Farey fractions and arc definitions; page visually inspected. Replaces the representative-dependent shorthand by native torus balls; reduced 0/1 represents the source endpoint 1/1. The missing size restriction is recorded in E16.


<a id="es1-major-arc"></a>

### Rational major arc

Contract `ExponentialSumsAndCircleMethod:ES.1/major-arc` (definition).

For a pair (a,q) of natural numbers and a real radius η, majorArc((a,q),η) is the native closed metric ball of radius η about (a/q mod 1) in AddCircle(1). Only indices in reducedArcIndices(Q) are used by the circle-method family. Definition at q=0 is totalized native division, but no admissible index has q=0. Real lifts are all intervals [a/q+z−η,a/q+z+η], z∈ℤ.

**Additional hypotheses:** No new torus, circle metric or arc carrier is introduced. η<0 gives the empty set; η≥1/2 gives the whole torus. The analytical application uses 0≤η<1/2..

**API.**

- `mem_majorArc` (characterisation): α belongs exactly when dist(α,a/q mod1)≤η.
- `majorArc_lift` (compatibility): A real lift x belongs iff there is z∈ℤ with |x−a/q−z|≤η.
- `majorArc_negative` (simp): If η<0 then the arc is empty.
- `majorArc_centre_mem` (simp): For η≥0 the rational centre belongs.
- `majorArc_measurable` (structure): The arc is closed, hence measurable for the torus Borel space.


**Named examples and contract tests.**

- `majorArc_wrap_test` (computation): The real lift 19/20 belongs to the zero arc of radius 1/10.
- `majorArc_boundary_test` (computation): The real lift 1/4 belongs to the zero closed arc of radius 1/4.
- `majorArc_negative_test` (degenerate): A radius −1 arc is empty, including at its centre.
- `majorArc_native_ball_test` (compatibility): Every arc is exactly Metric.closedBall at the corresponding native rational torus point.


**Uses:** Assing §6.1 p.34: The interval at 1/1 has two components in the chosen fundamental interval; the torus ball records both without a special-case definition..

**Construction or proof route.** Specialize native Metric.closedBall to the rational centre. Use AddCircle.norm_eq after dist_eq_norm to get nearest-integer distance. Use the native real-preimage integer-translate identity to justify the zero arc wraparound.

**Direct prerequisites:** [Reduced rational arc indices](#es1-reduced-arc-indices); `mathlib:Metric.closedBall`; `mathlib:AddCircle.norm_eq`; `mathlib:AddCircle.coe_real_preimage_closedBall_eq_iUnion`; `mathlib:dist_triangle`; `mathlib:Metric.isClosed_closedBall`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 p.34, Farey fractions and arc definitions; page visually inspected. Replaces the representative-dependent shorthand by native torus balls; reduced 0/1 represents the source endpoint 1/1. The missing size restriction is recorded in E16.


<a id="es1-major-arcs"></a>

### Major arcs

Contract `ExponentialSumsAndCircleMethod:ES.1/major-arcs` (definition).

majorArcs(Q,η) is the finite union of majorArc((a,q),η) over reducedArcIndices(Q), as a native Set(AddCircle(1)). This definition alone neither asserts disjointness nor prescribes a relation between Q and η.

**Additional hypotheses:** Q is natural; η is real. In the Waring application Q=⌊P^δ⌋ and η=P^(−d+δ), with P large and 0<δ<d/3 to make 2ηQ²<1..

**API.**

- `mem_majorArcs` (characterisation): Membership is existence of an admissible reduced pair whose arc contains α.
- `majorArcs_zero` (simp): majorArcs(0,η)=∅.
- `majorArcs_one` (simp): majorArcs(1,η)=majorArc((0,1),η).
- `majorArcs_mono` (relation): If Q≤R and η≤θ then majorArcs(Q,η)⊆majorArcs(R,θ).
- `majorArcs_measurable` (structure): The union is closed and hence measurable.


**Named examples and contract tests.**

- `majorArcs_zero_test` (degenerate): Q=0 and η=1 gives an empty major set, not the full torus.
- `majorArcs_one_test` (computation): At Q=1,η=1/10 the lift 19/20 belongs.
- `majorArcs_half_test` (computation): At Q=2,η=0 the point 1/2 is present.
- `majorArcs_native_union_test` (compatibility): The union over Q=3 is exactly the four native closed balls at 0,1/2,1/3,2/3.


**Uses:** Circle-method counting partition: Provides the major domain before any local approximation is inserted..

**Construction or proof route.** Use the native finite indexed union, with no extra arc-family structure. Finite unions of the closed arc sets are closed, so their indicator functions and restricted integrals are legitimate. Monotonicity follows separately in Q and in the radius; no false nesting is asserted when one parameter grows and the other shrinks.

**Direct prerequisites:** [Reduced rational arc indices](#es1-reduced-arc-indices); [Rational major arc](#es1-major-arc); `mathlib:Metric.closedBall`; `mathlib:AddCircle.norm_eq`; `mathlib:AddCircle.coe_real_preimage_closedBall_eq_iUnion`; `mathlib:dist_triangle`; `mathlib:Metric.isClosed_closedBall`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 p.34, Farey fractions and arc definitions; page visually inspected. Replaces the representative-dependent shorthand by native torus balls; reduced 0/1 represents the source endpoint 1/1. The missing size restriction is recorded in E16.


<a id="es1-minor-arcs"></a>

### Minor arcs

Contract `ExponentialSumsAndCircleMethod:ES.1/minor-arcs` (definition).

minorArcs(Q,η) is the native set complement of majorArcs(Q,η) in AddCircle(1). In particular all major-arc boundary points are excluded from the minor set. No representative interval endpoint is omitted from the underlying torus.

**Additional hypotheses:** The complement is taken in the entire period-one torus. Parameters are the same Q and η as in the major set..

**API.**

- `mem_minorArcs` (characterisation): α is minor iff no admissible pair has dist(α,a/q mod1)≤η.
- `minorArcs_zero` (simp): minorArcs(0,η)=Set.univ.
- `minorArcs_measurable` (structure): The minor set is measurable, indeed open.
- `minorArcs_antitone` (relation): If Q≤R and η≤θ then minorArcs(R,θ)⊆minorArcs(Q,η).


**Named examples and contract tests.**

- `minorArcs_zero_test` (degenerate): With Q=0, zero belongs to the minor set.
- `minorArcs_centre_test` (computation): At Q=1,η=0 zero is not minor.
- `minorArcs_interior_test` (computation): At Q=1,η=1/10 the point 1/2 is minor.
- `minorArcs_boundary_test` (compatibility): At Q=1,η=1/4 the lift 1/4 belongs only to major arcs, matching the closed-ball convention.


**Uses:** Assing Lemma6.1 p.34: Its rational-approximation denominator lower bound applies to this complement, rather than an informal subset of [0,1]..

**Construction or proof route.** Use native Set complement. The major/minor sets are disjoint and their union is the whole torus by native complement algebra. Measurability follows from that of majorArcs; expanding Q or η shrinks the minor set.

**Direct prerequisites:** [Major arcs](#es1-major-arcs).

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 p.34, Farey fractions and arc definitions; page visually inspected. Replaces the representative-dependent shorthand by native torus balls; reduced 0/1 represents the source endpoint 1/1. The missing size restriction is recorded in E16.


<a id="es1-reduced-centre-separation"></a>

### Reduced rational centre separation

Contract `ExponentialSumsAndCircleMethod:ES.1/reduced-centre-separation` (theorem).

For distinct reduced pairs (a,q),(b,r) in reducedArcIndices(Q), their torus centres have distance at least 1/(qr), and hence at least 1/Q². In particular the two centres are unequal. All divisions are real, and the positive denominators follow from membership.

**Additional hypotheses:** The pairs are distinct as ordered pairs and each is reduced with numerator in [0,denominator). Q≥1 follows from nonempty membership..

**Construction or proof route.** Choose the integer translate attaining nearest-integer distance using AddCircle.norm_eq. Multiply the translated difference a/q−b/r−z by qr to get the integer ar−bq−zqr. This integer cannot vanish: the two reduced fractions in [0,1) would then be equal and uniqueness of reduced form would force equal pairs. Its absolute value is therefore at least one. Divide by positive qr and use q,r≤Q.

**Direct prerequisites:** [Reduced rational arc indices](#es1-reduced-arc-indices); `mathlib:AddCircle.norm_eq`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 p.34, Farey fractions and arc definitions; page visually inspected. Replaces the representative-dependent shorthand by native torus balls; reduced 0/1 represents the source endpoint 1/1. The missing size restriction is recorded in E16.


<a id="es1-major-arcs-disjoint"></a>

### Major-arc separation

Contract `ExponentialSumsAndCircleMethod:ES.1/major-arcs-disjoint` (theorem).

If Q≥1, η≥0 and 2ηQ²<1, then the closed major arcs indexed by reducedArcIndices(Q) are pairwise disjoint. This is a sufficient strict size condition, not a claim of disjointness for every δ>0 in the source parametrization.

**Additional hypotheses:** Arcs are closed. Strict inequality is used because two closed balls may meet at a boundary when twice the radius equals the distance of their centres..

**Construction or proof route.** If a point lies in two indexed arcs, native triangle inequality bounds the centre distance by 2η. Reduced-centre separation gives centre distance≥1/Q², contradicting 2ηQ²<1. For Q=⌊P^δ⌋ and η=P^(−d+δ), sufficient size is 2P^(3δ−d)<1; for any 0<δ<d/3 this holds eventually.

**Direct prerequisites:** [Rational major arc](#es1-major-arc); [Reduced rational centre separation](#es1-reduced-centre-separation); `mathlib:dist_triangle`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 p.34, Farey fractions and arc definitions; page visually inspected. Replaces the representative-dependent shorthand by native torus balls; reduced 0/1 represents the source endpoint 1/1. The missing size restriction is recorded in E16.


<a id="es1-major-minor-counting-partition"></a>

### Major–minor arc counting partition

Contract `ExponentialSumsAndCircleMethod:ES.1/major-minor-counting-partition` (theorem).

For an integrable complex function F on the probability torus, Q≥1, η≥0 and 2ηQ²<1, its full integral equals the sum of its restricted integrals over all indexed majorArc((a,q),η), plus its restricted integral over minorArcs(Q,η). Without the size condition one may still split into the major union and its complement, but may not replace the union integral by a sum over overlapping arcs.

**Additional hypotheses:** Use AddCircle.haarAddCircle at period one. Integrable F is an explicit hypothesis; finite torus exponential polynomials satisfy it by continuity on the compact torus..

**Construction or proof route.** Use native integral_add_compl on the measurable major union. Use major-arcs-disjoint and native integral_biUnion_finset to expand the major-union integral. For finite counting insert the appropriate finite weighted phase polynomial from torus-coefficient-extraction; no asymptotic or singular-series estimate is used.

**Direct prerequisites:** [Major arcs](#es1-major-arcs); [Minor arcs](#es1-minor-arcs); [Major-arc separation](#es1-major-arcs-disjoint); [Torus coefficient-counting identity](#es1-torus-coefficient-extraction); `mathlib:MeasureTheory.integral_add_compl`; `mathlib:MeasureTheory.integral_biUnion_finset`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 p.34, Farey fractions and arc definitions; page visually inspected. Replaces the representative-dependent shorthand by native torus balls; reduced 0/1 represents the source endpoint 1/1. The missing size restriction is recorded in E16.


<a id="es1-monomial-weyl-sum"></a>

### Monomial Weyl sum

Contract `ExponentialSumsAndCircleMethod:ES.1/monomial-weyl-sum` (definition).

powerWeylSum(d,N,α)=Σ_{x=1}^N fourier(x^d)(α) on native AddCircle1. This is the single-frequency monomial sum, not the n-dimensional momentWeylSum, whose phase contains every degree1..n. It is the specialization of weightedTorusSum to one coordinate and unit weights.

**Additional hypotheses:** d,N are natural; α is a torus point. The empty positive interval N=0 gives zero, even at d=0. Degree-zero nonempty phases are N times the frequency-one character..

**API.**

- `powerWeylSum_eq_sum` (characterisation): The sum is over the positive native interval1..N with phase x^d.
- `powerWeylSum_zero_cutoff` (simp): N=0 gives zero.
- `powerWeylSum_zero_phase` (simp): At α=0 the value is N.
- `powerWeylSum_zero_degree` (simp): At d=0 it is N fourier(1)(α).
- `powerWeylSum_conjugate` (compatibility): Conjugation equals evaluation at−α.


**Named examples and contract tests.**

- `powerWeylSum_empty_test` (degenerate): For d=3,N=0,α=0 the sum is0, not1.
- `powerWeylSum_linear_test` (computation): For d=1,N=2,α=1/2 the sum is0.
- `powerWeylSum_zero_phase_test` (computation): For d=3,N=4,α=0 the sum is4.
- `powerWeylSum_weighted_test` (compatibility): For d=2,N=3 it agrees exactly with weightedTorusSum in dimension1 and phase x².


**Uses:** Assing §6.1 and §9: Finite positive counting, major-arc approximations and monomial mean/minor bounds use this single-frequency sum..

**Construction or proof route.** Specialize the existing finite weighted character sum. At phase zero every term is one. Conjugation negates the phase. Native character continuity makes the finite sum continuous.

**Direct prerequisites:** [Weighted torus exponential sum](#es1-weighted-torus-sum); `mathlib:fourier`; `mathlib:fourier_neg`; `mathlib:fourier_eval_zero`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 pp.34–39, statements and full proofs, with E15–16 and E23–24 corrected. Positive variables, symmetric frequency truncations and strict arc-size constraints are retained. The degree-two local proof boundary is not silently imported.


<a id="es1-function-field-top-phase"></a>

### Top-degree coefficient phase

Contract `ExponentialSumsAndCircleMethod:ES.1/function-field-top-phase` (theorem).

For a symmetric degree-k tensor c, coefficient vectors a_{i,j} (0≤i<d), and α=Σ_{l=1}^{kd}b_lT^(−l), the degree-k part in a of [T^(−1)]αf(xT^d+Σ_{i<d}a_iT^i) is Σ_{j₁,…,j_k}Σ_{i₁,…,i_k<d} c(j)b_{1+Σi_t}∏_ta_{i_t,j_t}. Lower-degree terms of f and fixed leading-vector terms contribute only lower degree in a. The formula describes the top-degree part, not the whole phase.

**Construction or proof route.** Expand the univariate substituted monomials and select the T^(−1) coefficient. A degree-k term in free a uses no fixed leading coefficient. Apply top-degree polarization to discard the lower-degree phase terms when forming the differencing locus.

**Direct prerequisites:** [Top-degree polarization identity](#es0-multivariate-polarization); `mathlib:Polynomial.coeff`.

**Source:** [A geometric version of the circle method](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p04-s.pdf), §6 p.935, G_b and F₀ displays; corrected extraction E20. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es1-function-field-polar-count"></a>

### Function-field differencing count

Contract `ExponentialSumsAndCircleMethod:ES.1/function-field-polar-count` (definition).

For finite F_q, tensor c of degree k=r+1, b_l∈F_q, box cutoff D≥0 and coefficient cutoff C≥0, functionFieldPolarCount(c,b,D,C) counts arrays a∈F_q^{r×n×D}. Write u^(t)_j=Σ_{i<D}a_{t,j,i}T^i. Admit a exactly when, for every j and 1≤l≤C, Σ_{v∈supp Ψ_j(u)} b_{v+l}coeff_v(Ψ_j(u))=0. Thus the box is deg u<D and the fractional condition is ||αΨ_j(u)||<q^(−C), with both boundaries strict. N=N(c,b,d,d) and N_s=N(c,b,d−s,d+rs).

**API.**

- `functionFieldPolarCount_zero_phase` (simp): b=0 gives q^(rnD).
- `functionFieldPolarCount_no_constraints` (simp): C=0 gives q^(rnD).
- `functionFieldPolarCount_zero_box` (simp): For r≥1, D=0 gives1.
- `functionFieldPolarCount_pos` (relation): For r≥1 the zero array shows the count is positive.
- `functionFieldPolarCount_cutoff_antitone` (relation): Increasing C weakly decreases the count at fixed D.
- `functionFieldPolarCount_coefficients` (characterisation): Its equations are precisely the first C negative Laurent coefficients of αΨ_j.


**Named examples and contract tests.**

- `functionFieldPolarCount_zero_phase_test` (computation): In F₅,n=1,r=2,D=C=1,c=1,b=0 the count is25.
- `functionFieldPolarCount_nonzero_phase_test` (computation): For the same parameters, b₁=1 and other b_l=0 gives9.
- `functionFieldPolarCount_strict_cutoff_test` (computation): For b₂=1 and other b_l=0, C=1 gives25 while C=2 gives9.
- `functionFieldPolarCount_zero_box_test` (degenerate): For D=0,r≥1, the count is1 even with a nonzero phase.


**Uses:** Browning–Sawin Lemma6.1: Gives the arithmetic cardinality of the differencing locus.; Browning–Sawin Proposition6.2: Makes the changing box and fractional thresholds explicit during iterated shrinking..

**Construction or proof route.** Use a finite coefficient array and filter its native finite universe by the displayed coefficient equalities. The Laurent variable is T^(−1); no new valuation, Haar measure or Laurent-series field is constructed. Coefficient convolution translates the fractional threshold exactly.

**Direct prerequisites:** [Polar forms](#es0-polar-forms); `mathlib:Polynomial.coeff`; `mathlib:Polynomial.support`; `mathlib:Fintype.card`.

**Source:** [A geometric version of the circle method](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p04-s.pdf), Lemma6.1 p.936; definition of N_s p.938. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es1-function-field-count-identity"></a>

### Differencing coefficient-count identity

Contract `ExponentialSumsAndCircleMethod:ES.1/function-field-count-identity` (theorem).

Assume char F_q=p>k=r+1. For the coefficient-space top-degree phase, its common polar equations indexed by (i,j),0≤i<d, are k!Σ_{a,v}c(a,j)b_{1+i+Σv_t}∏_ta_{t,a_t,v_t}=0. Their number of F_q-solutions is functionFieldPolarCount(c,b,d,d). Cancelling k! is valid only under p>k.

**Construction or proof route.** For each j expand Ψ_j(u) and compute the coefficient at T^(−i−1) of αΨ_j(u). Identify the arrays bijectively; each first-d coefficient equation agrees with the displayed coefficient-space equation.

**Direct prerequisites:** [Top-degree coefficient phase](#es1-function-field-top-phase); [Function-field differencing count](#es1-function-field-polar-count).

**Source:** [A geometric version of the circle method](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p04-s.pdf), Lemma6.1 and complete proof p.936. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es1-uniform-function-field-minor-count"></a>

### Uniform arithmetic minor-arc count

Contract `ExponentialSumsAndCircleMethod:ES.1/uniform-function-field-minor-count` (theorem).

For d≥k−1,k≥3,n≥1 there is C(d,k,n)>0, independent of the finite field, tensor coefficients and b, such that for char F_q>k, a smooth leading degree-k form, d≤m≤kd/2, and b outside the closed A_m⊆A^{kd}, N(c,b,d,d)≤C(d,k,n)q^(dn(k−1)−n floor(m/(k−1))). The same statement uses the equivalent explicit Hankel-kernel exclusion and common-diagonal-zero smoothness condition.

**Construction or proof route.** Take s=d−floor(m/(k−1)), apply iterated shrinking, and use minor-arc exclusion to replace the shrunken count by polynomial tuples on W. Import the early coefficient-uniform polynomial-box bound with strict box degree d−s and dimension≤n(k−2). Multiply q^((k−1)ns) by q^{n(k−2)(d−s)} and simplify.

**Direct prerequisites:** [Iterated multilinear shrinking](#es0-iterated-function-field-shrinking); [Minor-arc exclusion forces polar values to vanish](#es0-short-polar-values-zero); [Polar-zero dimension bound](#es0-polar-dimension-bound).

**Source:** [A geometric version of the circle method](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p04-s.pdf), Proposition6.2 p.936 and proof pp.938–939. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es1-summable-torus-counting"></a>

### Summable weighted Fourier extraction

Contract `ExponentialSumsAndCircleMethod:ES.1/summable-torus-counting` (theorem).

For a countable typeA, integer phase map Φ:A→ℤⁿ and summable complex weightsw, the uniformly absolutely convergent torus series S(α)=Σ_aw(a)∏_je(Φ_j(a)α_j) is integrable on probability Haar measure, and its b-th Fourier coefficient is Σ_{Φ(a)=b}w(a). Finite box cutoffs converge uniformly and in L¹. Gaussian/compact smoothing is an instance only after the actual lattice weight is proved summable.

**Construction or proof route.** Every character has modulus1. The summable norm ofw gives uniform convergence, and probability Haar gives an integrable common envelope. Pass the finite coefficient identity through the integral and through the filtered sum. This also justifies any dominated cutoff transfer used by the weighted endpoints.

**Direct prerequisites:** [Torus coefficient-counting identity](#es1-torus-coefficient-extraction); `mathlib:MeasureTheory.integral`.

**Source:** [254A, Notes 8: The Hardy–Littlewood circle method](https://terrytao.wordpress.com/2015/03/22/254a-notes-8-the-hardy-littlewood-circle-method/), §1 equations(3)–(5), summable extension by absolute convergence. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es1-mangoldt-exponential-sum"></a>

### Von Mangoldt exponential sum

Contract `ExponentialSumsAndCircleMethod:ES.1/mangoldt-exponential-sum` (definition).

mangoldtExponentialSum(N,α)=Σ_{1≤n≤N}Λ(n)e(nα), with native nonnegative real von Mangoldt coefficients. Prime powers remain in the sum; replacing it by an unweighted prime sum requires its own partial-summation/error adapter.

**API.**

- `mangoldtExponentialSum_zero` (simp): N=0 gives0.
- `mangoldtExponentialSum_at_zero` (relation): Atα=0 it is the sum ofΛ on1..N.
- `mangoldtExponentialSum_increment` (relation): IncreasingN by1 addsΛ(N+1)e((N+1)α).
- `mangoldtExponentialSum_conj` (compatibility): Negatingα conjugates the value.


**Named examples and contract tests.**

- `mangoldtExponentialSum_empty_test` (degenerate): N=0 gives0.
- `mangoldtExponentialSum_primepower_test` (computation): N=4,α=0 gives2log2+log3, includingΛ(4)=log2.
- `mangoldtExponentialSum_half_test` (computation): N=3,α=1/2 giveslog2−log3.


**Uses:** Prime major arcs: The nativeΛ-weighted model is approximated byμ(q)/φ(q).; Vinogradov endpoint: Its cube Fourier coefficient is the weighted ordered triple count..

**Construction or proof route.** Use the existing finite weighted torus sum and pinned ArithmeticFunction.vonMangoldt.

**Direct prerequisites:** [Weighted torus exponential sum](#es1-weighted-torus-sum); `mathlib:ArithmeticFunction.vonMangoldt`.

**Source:** [254A, Notes 8: The Hardy–Littlewood circle method](https://terrytao.wordpress.com/2015/03/22/254a-notes-8-the-hardy-littlewood-circle-method/), Introduction and §1 Proposition18. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


### Required refinements for this layer

- Independent early geometric suppliers: The pending GeometricCircleMethodAndMappingSpaces prefix has no published stage/node id in this snapshot. It must supply componentwise affine intersection dimension and the coefficient-uniform polynomial-box bound #W(F_q[T]_{<D})≤C(N,degree)q^{D dim W}, including D=0, strict degree, and zero-dimensional boundary. Match its independent Padé/Hankel equivalence to the explicit kernel exclusion used here. Do not import the late mapping/cohomology stages into ES.0 or ES.1.



## ES.2 — Mean-value theorems

The route is decoupling, with a separate parabola base and the main BDG transition tree. Its key inputs are Brascamp–Lieb finiteness/stability, quantitative moment-curve transversality, perturbed plate Kakeya, orthogonality, ball inflation and the exponent-collapse recurrence. These are targets with explicit external proof boundaries, not conclusion-bearing records. Improved Hua requires the further critical sparse-curve transfer.

**Atlas planets:** Vinogradov mean value; Critical decoupling; Vinogradov mean-value theorem; Brascamp–Lieb finiteness; Ball inflation; Improved Hua bound.

**Coverage:** planned. The exact contracts follow; stage-specific refinements are listed after them.


<a id="es2-vinogradov-mean-value"></a>

### Vinogradov mean value

Contract `ExponentialSumsAndCircleMethod:ES.2/vinogradov-mean-value` (definition).

Define vinogradovMeanValue(n,s,N) as the number of ordered pairs (x,y)∈{1,…,N}ˢ×{1,…,N}ˢ satisfying Σ_ixᵢʲ=Σ_iyᵢʲ for every j=1,…,n. Its carrier is the native finite subtype of pairs of Fin s→Fin N maps, with entries interpreted as val+1. In particular n=0 imposes no equations and s=0 has exactly the empty pair. No quotient by permutations is taken.

**Additional hypotheses:** n,s,N are natural. The main bound below requires n≥2 and s≥1, but the definition includes all boundary cases..

**API.**

- `vinogradovMeanValue_source_count` (compatibility): For n≥2,s≥1,N≥2 this is exactly the published J_s,n(N).
- `vinogradovMeanValue_zero_variables` (simp): For s=0, the count is 1 for every n,N.
- `vinogradovMeanValue_zero_degree` (simp): For n=0 the count is N^(2s), with 0^0=1.
- `vinogradovMeanValue_one_variable` (simp): For n≥1 and s=1 the count is N.
- `vinogradovMeanValue_one_cutoff` (simp): For N=1 the count is 1 for every n,s.
- `vinogradovMeanValue_zero_cutoff` (simp): For N=0 and s>0 the count is zero.
- `vinogradovMeanValue_mono_degree` (relation): Increasing n can only decrease the count, for fixed s,N.


**Named examples and contract tests.**

- `vinogradovMeanValue_ordered_test` (computation): For n=2,s=2,N=2 the count is 6.
- `vinogradovMeanValue_empty_pair_test` (degenerate): For s=0 and N=0 the count is 1, not zero.
- `vinogradovMeanValue_linear_count_test` (compatibility): For n≥1,s=1 the count equals the cardinality of [1,N].
- `vinogradovMeanValue_three_variables_test` (computation): For n=2,s=3,N=2 the count is 20, the central binomial coefficient, not an unordered partition count.


**Uses:** BDG Theorem1.1: Names the precise counting target with both expected terms.; ES.1 torus identity and ES.4 minor arcs: Converts an exact finite solution count into a moment estimate for the moment-curve sum..

**Construction or proof route.** Use Fintype.card on the explicitly specified finite subtype. Identify Fin N with the positive interval [1,N] by m↦val(m)+1. Expose equality with the source count and its native finite-sum indicator expression; do not count unordered solutions.

**Direct prerequisites:** `mathlib:Fintype.card`.

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), §1 p.633, opening definition. The two s-tuples and all equations are exactly the published solution count; boundary conventions are explicit extensions.


<a id="es2-moment-curve"></a>

### Moment curve

Contract `ExponentialSumsAndCircleMethod:ES.2/moment-curve` (definition).

momentCurve(n,t) is (t,t²,…,tⁿ) in native EuclideanSpace ℝ (Fin n), constructed by WithLp.toLp 2. Coordinate j has exponent j+1. The analytical curve is its restriction to t∈[0,1]; the polynomial map itself is defined for all real t and includes n=0.

**Additional hypotheses:** n is natural; t is real. The ambient metric is Euclidean, not the native sup norm on an unwrapped Pi type..

**API.**

- `momentCurve_apply` (projection): The j-th coordinate is t^(j+1).
- `momentCurve_zero` (simp): The image of t=0 is the zero vector.
- `momentCurve_continuous` (structure): The polynomial map into native Euclidean space is continuous.
- `momentCurve_first_injective` (characterisation): For n≥1 it is injective because the first coordinate is t.


**Named examples and contract tests.**

- `momentCurve_quadratic_test` (computation): At n=2,t=2 the coordinates are (2,4).
- `momentCurve_zero_dimension_test` (degenerate): At n=0,t=3 the vector is zero.
- `momentCurve_linear_test` (compatibility): At n=1 its sole coordinate is the identity t, agreeing with the linear moment map.


**Uses:** BDG §§6–8: Its derivative spans control transversality, plate geometry and lower-dimensional decoupling..

**Construction or proof route.** Build the native Euclidean vector from the coordinate power functions. Coordinates give continuity and smoothness. For n≥1 the first coordinate is t, so the map is injective.

**Direct prerequisites:** `mathlib:EuclideanSpace`; `mathlib:PiLp.toLp_apply`.

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), §1 pp.634–635 and §3 p.637. The moment curve, extension operator and family of polynomial spatial weights are the published inputs. Euclidean norm and Lebesgue measure are explicit.


<a id="es2-decoupling-weight"></a>

### Decoupling weight

Contract `ExponentialSumsAndCircleMethod:ES.2/decoupling-weight` (definition).

For a native Euclidean centre c, real radius R>0 and natural E, decouplingWeight(n,E,c,R)(x)=(1+‖x−c‖/R)^(−E). The spatial weighted measure is the native volume.withDensity(ENNReal.ofReal∘weight), and weighted norms are native eLpNorm. The endpoint uses E≥100n and keeps the same E on both sides.

**Additional hypotheses:** R>0 for geometric properties; E may be zero in the definition. Native inversion and division make the expression total, but R≤0 is not an analytical radius. No custom measure or Lp carrier is introduced..

**API.**

- `decouplingWeight_centre` (simp): The centre value is one.
- `decouplingWeight_bounds` (structure): For R>0 its value is strictly positive and at most one.
- `decouplingWeight_continuous` (structure): For R>0 the weight is continuous.
- `decouplingWeight_translate` (compatibility): Translate c and x by the same vector to leave the value unchanged.
- `decouplingWeight_zero_exponent` (simp): At E=0 the weight is the constant one function.


**Named examples and contract tests.**

- `decouplingWeight_value_test` (computation): In dimension one, c=0,R=1,E=2,x=1 gives1/4.
- `decouplingWeight_scale_test` (compatibility): At c=0,R=2,E=2,x=2 the value is again1/4.
- `decouplingWeight_zero_exponent_test` (degenerate): In positive dimension E=0 gives one, not a decaying density.


**Uses:** BDG §3 p.637 and Lemma8.2: A single E≥100n is retained during dimensional induction; uniform constants may depend on E..

**Construction or proof route.** Define the real positive reciprocal of the indicated natural power. Positive radius and norm nonnegativity give 0<weight≤1; at the centre its value is one. Translation of both centre and argument leaves their difference unchanged. Only with E>n does the density have finite Lebesgue mass; boundedness alone is not integrability on the whole space.

**Direct prerequisites:** `mathlib:EuclideanSpace`; `mathlib:MeasureTheory.eLpNorm`; `mathlib:MeasureTheory.MemLp`; `mathlib:MeasureTheory.Measure.withDensity`.

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), §1 pp.634–635 and §3 p.637. The moment curve, extension operator and family of polynomial spatial weights are the published inputs. Euclidean norm and Lebesgue measure are explicit.


<a id="es2-moment-extension"></a>

### Moment-curve extension operator

Contract `ExponentialSumsAndCircleMethod:ES.2/moment-extension` (definition).

For a real interval [a,b], complex amplitude g and x∈EuclideanSpace ℝ (Fin n), momentExtension(n,a,b,g)(x)=∫_[a,b]g(t)exp(2πiΣ_jx_jt^(j+1))dt, using native Lebesgue measure and Bochner integration. For analytical claims g is IntegrableOn [a,b]; in the decoupling theorem it is IntegrableOn [0,1]. The source’s interval operator is an adapter to native integration, not a new Fourier transform.

**Additional hypotheses:** a,b are real. If b<a the interval is empty. Integrability is exposed on continuity, norm bounds and additive APIs; the totalized native definition is not interpreted as a meaningful nonintegrable oscillatory integral..

**API.**

- `momentExtension_empty` (simp): If b<a the function is zero.
- `momentExtension_zero_amplitude` (simp): Zero amplitude gives zero.
- `momentExtension_add` (relation): For amplitudes integrable on the interval, extension is additive.
- `momentExtension_smul` (relation): Complex scalar multiplication commutes with the native extension integral.
- `momentExtension_zero_spatial` (simp): At x=0 the value is ∫_[a,b]g.
- `momentExtension_norm_bound` (structure): For integrable g, every spatial value has norm at most ∫_[a,b]|g|.
- `momentExtension_continuous` (structure): For integrable g the spatial function is continuous.
- `momentExtension_partition` (compatibility): For M≥1, extension on[0,1] is the sum of its M adjacent equal-interval extensions; their endpoints have zero measure.


**Named examples and contract tests.**

- `momentExtension_constant_test` (computation): For amplitude one on[0,1] and x=0 the value is1.
- `momentExtension_empty_test` (degenerate): The interval[1,0] gives zero.
- `momentExtension_negative_test` (computation): For amplitude−1 on[0,1] and x=0 the result is−1, not the integral of its norm.
- `momentExtension_zero_dimension_test` (compatibility): In dimension zero the operator agrees with the native integral of g.


**Uses:** BDG Theorem1.2 and §7 rescaling: Keeps amplitude integrability and interval endpoints explicit for partitioning and changes of variables..

**Construction or proof route.** Use native set integral against Lebesgue measure of a complex-valued amplitude times a unit-modulus phase. The phase is continuous in x and t; the norm is bounded by |g(t)|, independent of x. Dominated convergence gives spatial continuity. Finite adjacent parameter intervals partition [0,1] up to finitely many null endpoints, giving the source extension decomposition.

**Direct prerequisites:** [Moment curve](#es2-moment-curve); `mathlib:MeasureTheory.integral`; `mathlib:MeasureTheory.IntegrableOn`; `mathlib:Complex.norm_exp_ofReal_mul_I`; `mathlib:MeasureTheory.norm_integral_le_integral_norm`.

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), §1 pp.634–635 and §3 p.637. The moment curve, extension operator and family of polynomial spatial weights are the published inputs. Euclidean norm and Lebesgue measure are explicit.


<a id="es2-weighted-extension-finite"></a>

### Weighted extension integrability

Contract `ExponentialSumsAndCircleMethod:ES.2/weighted-extension-finite` (lemma).

If R>0, E>n, 1≤p<∞ and g is integrable on[a,b], then momentExtension(n,a,b,g) belongs to native MemLp at exponent p for the measure volume.withDensity(weight). Thus its eLpNorm is finite; no invalid conversion of +∞ to real zero is used.

**Additional hypotheses:** E is natural, p is real, c is any Euclidean centre. There is no finite-volume-ball restriction on the integral; the weight is integrated on the whole space..

**Construction or proof route.** Continuity of the extension gives strong measurability. Its uniform L1 amplitude bound reduces the Lp integral to the total mass of the weight. Split space into a radius-R ball and dyadic shells: shell j has volume bounded by a dimension constant times R^n 2^(jn), and weight bounded by a constant times2^(−jE). Sum the geometric series since E>n. Native norm-power integration and withDensity then give MemLp.

**Direct prerequisites:** [Moment-curve extension operator](#es2-moment-extension); [Decoupling weight](#es2-decoupling-weight); `mathlib:MeasureTheory.MemLp`; `mathlib:MeasureTheory.eLpNorm`; `mathlib:MeasureTheory.Measure.withDensity`.

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), §1 p.634, weight-exponent discussion. Makes the source’s integrability requirement explicit; the dyadic-shell argument is an elementary proof obligation, not an implemented theorem.


<a id="es2-critical-decoupling"></a>

### Critical moment-curve decoupling theorem

Contract `ExponentialSumsAndCircleMethod:ES.2/critical-decoupling` (theorem).

For n≥2, natural E≥100n and ε>0 there is C(n,E,ε)>0 such that for every integer M≥1, every centre c and every amplitude g integrable on[0,1], with R=M^n, ‖E_[0,1]g‖_L^{n(n+1)}(w_{c,R,E})≤CM^ε(Σ_{j=0}^{M−1}‖E_[j/M,(j+1)/M]g‖_L^{n(n+1)}(w_{c,R,E})²)^{1/2}. The norms integrate over the entire Euclidean space with weighted Lebesgue measure. C is independent of M,c,g.

**Additional hypotheses:** The same E is retained in all weighted norms. Intervals are exactly the reciprocal-integer partition specified after source Theorem1.2. There is no source claim here of arbitrary noninteger partition data or automatic interpolation of every p..

**Construction or proof route.** Use the n=2 parabola decoupling base from source[9], not an unsupported assertion that this paper proves that base. For n≥3 combine source§6 transversality/Brascamp–Lieb/plate Kakeya and ball inflation, §7 parabolic rescaling and linear–multilinear comparison, and §8 L2/lower-dimensional decoupling and the weighted iteration. The finite recurrence in appendix§10 forces the decisive growth factor greater than one; §9 bootstraps the decoupling exponent to zero and passes to the critical endpoint. The exact input declarations and geometric APIs for those analytic steps remain an explicit partial-stage frontier, including external proof gaps. Merely reading the whole BDG paper does not close those inputs.

**Direct prerequisites:** [Moment curve](#es2-moment-curve); [Decoupling weight](#es2-decoupling-weight); [Moment-curve extension operator](#es2-moment-extension); [Weighted extension integrability](#es2-weighted-extension-finite); [Decoupling exponent collapse](#es2-decoupling-exponent-collapse); [Parabola critical decoupling base](#es2-parabola-decoupling-base).

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), Theorem1.2 p.635; weight extension p.637; §§6–10. Matches the full critical statement, uniformity and actual proof route; the external base and Kakeya/BL inputs are not falsely attributed as proved in this paper.


<a id="es2-discrete-restriction"></a>

### Critical discrete restriction estimate

Contract `ExponentialSumsAndCircleMethod:ES.2/discrete-restriction` (theorem).

For n≥2,E≥100n,ε>0 there is C(n,E,ε)>0 so that for N≥1, points (i−1)/N<t_i≤i/N, arbitrary complex coefficients a_i and any ball B of radius N^n, the normalized weighted L^{n(n+1)} norm of Σ_i a_i exp(2πiΣ_jx_jt_i^j) is at most CN^ε(Σ_i|a_i|²)^{1/2}. Normalized means dividing the weighted p-th-power integral by the ordinary Lebesgue volume of B, not by the weight’s total mass.

**Additional hypotheses:** The ordered points lie in their separate bins but no additional uniform separation distance is assumed. Bin boundaries use the source half-open convention. The full source Theorem4.1 also covers R≳N^n and all finite p≥2; those additional target contracts remain to be split and proved..

**Construction or proof route.** Choose shrinking one-sided amplitude approximations supported inside each point’s assigned bin, including points at the right endpoint, with prescribed complex mass a_i. Apply critical decoupling to their sum. Each interval extension is bounded by |a_i| and tends pointwise to the desired phase term. Weighted dominated convergence is justified by integrability of w and the finite boundΣ|a_i|; the right-side weight mass divided by|B| is a constant depending only on n,E. Let the approximation width tend to zero. The statement is the critical-radius specialization, not a claim that an arbitrary finite torus sum is bounded by this estimate.

**Direct prerequisites:** [Critical moment-curve decoupling theorem](#es2-critical-decoupling); [Weighted extension integrability](#es2-weighted-extension-finite); [Moment-curve extension operator](#es2-moment-extension).

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), Theorem4.1 and proof pp.637–638. Specializes to critical exponent and R=N^n, keeping complex coefficients and normalized weighted measure. One-sided approximants repair endpoint support details without changing the stated bound.


<a id="es2-vinogradov-main-bound"></a>

### Vinogradov mean-value theorem

Contract `ExponentialSumsAndCircleMethod:ES.2/vinogradov-main-bound` (theorem).

For n≥2,s≥1 and ε>0 there exists C(n,s,ε)>0 such that for every integer N≥2, J_{s,n}(N)≤C(N^{s+ε}+N^{2s−n(n+1)/2+ε}). Here J is the concrete ordered positive-integer tuple count. Both expected terms are retained, and the real exponent in the second term is not truncated by natural subtraction.

**Additional hypotheses:** The constant is uniform in N. This is an upper bound with ε loss, not an asymptotic or a local-solubility conclusion. Degree one is separate. Source n=2 arithmetic proof is only mentioned, so its use requires either a new divisor proof contract or the explicitly external n=2 decoupling base..

**Construction or proof route.** Use the discrete restriction estimate and the source Corollary4.2 Fourier-positive Schwartz majorant to bound near solutions at anisotropic tolerances N^{j−n}. Exact integer solutions form a subset; no false equivalence is used at tolerance1. The Fourier expansion gives nonnegative terms and a uniform contribution from every counted solution, while the discrete estimate gives the two exponents. For n≥3 the selected route includes the cubic case via decoupling induction from the parabola base; the paper title is not used as evidence excluding or establishing n=3. For n=2 the stated endpoint is pending its actual base proof; for n=1 use the independent elementary node below. The Schwartz construction, anisotropic scaling and off-critical discrete norm contracts are still explicit proof-graph frontier tasks.

**Direct prerequisites:** [Vinogradov mean value](#es2-vinogradov-mean-value); [Vinogradov counting integral](#es1-vinogradov-counting-integral); [Critical discrete restriction estimate](#es2-discrete-restriction).

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), Theorem1.1 p.633; Corollary4.2 pp.638–639. Matches source quantifiers, both exponents and the near-solution proof route; not a formalization claim.


<a id="es2-linear-mean-bound"></a>

### Linear Vinogradov mean-value bound

Contract `ExponentialSumsAndCircleMethod:ES.2/linear-mean-bound` (theorem).

For s≥1 and all N≥0, J_{s,1}(N)≤N^{2s−1}. In degree one the only condition is equality of tuple sums, and specifying all but the final y coordinate determines that remaining coordinate uniquely. This elementary bound has constant one and no ε loss.

**Additional hypotheses:** The tuples are ordered and entries are1..N. The exponent2s−1 is positive when s≥1; N=0 gives zero..

**Construction or proof route.** Project a solution to its s x-coordinates and first s−1 y-coordinates. If two solutions have the same projection, the remaining y coordinate is equal by the one linear equation; hence the projection is injective. Apply native finite cardinality to the2s−1 free coordinates. This uses no decoupling result.

**Direct prerequisites:** [Vinogradov mean value](#es2-vinogradov-mean-value).

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), §1 p.633, source system specialized to n=1. The source declares n≥2; this degree-one extension is an elementary argument supplied here, not a claim that the source proves it.


<a id="es2-hua-mean-value"></a>

### Hua mean-value inequality

Contract `ExponentialSumsAndCircleMethod:ES.2/hua-mean-value` (theorem).

For each d≥2,1≤v≤d and ε>0 there is C(d,v,ε)>0 such that for every N≥1, the normalized-Haar integral on AddCircle(1) of |Σ_{m=1}^Nfourier(m^d)(α)|^{2^v} is at most CN^{2^v−v+ε}. It is a one-frequency monomial sum, not the n-dimensional full moment-curve sum and not the sharp Vinogradov critical theorem.

**Additional hypotheses:** Positive entries1..N are used; d is the monomial degree and v the differencing level. The native probability Haar at period one is explicit. The allowed upper endpoint is v=d, not every v..

**Construction or proof route.** For v=1, native Fourier orthogonality and strict injectivity of m↦m^d on positive integers give the exact second moment N. For the induction step use the non-absolute real-part differencing inequality for the monomial phase, multiply by its2^v-th absolute power and integrate; exact orthogonality converts it to a shifted-power counting problem. With positive shifts the v-fold difference of x^d is strictly positive and strictly increasing in positive x when v<d, and divisible by every shift. Thus the fixed power-difference right side is nonzero, each shift is a divisor, and x is determined uniquely. Import the exact AN.5 divisor subpower supplier with smaller ε to bound the positive-shift choices, giving the source recurrence. The signed differencing, monomial monotonicity/divisibility and counting calculation remain in this target-level proof sketch rather than becoming routine lemma nodes. The target remains unchecked.

**Direct prerequisites:** [Torus coefficient-counting identity](#es1-torus-coefficient-extraction); `mathlib:AddCircle.haarAddCircle`; `mathlib:fourierCoeff_fourier`; `AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound`; `mathlib:fwdDiff`; `mathlib:Polynomial.fwdDiff_iter_degree_eq_factorial`; `mathlib:Nat.divisors`; `mathlib:Complex.norm_exp_ofReal_mul_I`; `mathlib:Finset.sum_mul_sum`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), Lemma5.1 and proof pp.28–31; Lemma5.2 and proof pp.31–32. The selected classical differencing and divisor proofs were read in full. Native forward differences and the exact AN.5 divisor supplier replace informal algebraic/analytic black boxes.


<a id="es2-brascamp-lieb-bound"></a>

### Brascamp–Lieb inequality predicate

Contract `ExponentialSumsAndCircleMethod:ES.2/brascamp-lieb-bound` (definition).

For Euclidean H,H_j,continuous linear L_j,positive exponents a_j and C≥0, brascampLiebBound(L,a,C) means that every family of nonnegative integrable f_j has integrable product ∏f_j(L_jx)^a_j and integral≤C∏(∫f_j)^a_j. Use native canonical Euclidean volume and Bochner integrals.

**API.**

- `brascampLiebBound_iff` (characterisation): Expand the quantified integrability and bound.
- `brascampLiebBound_mono` (relation): Increasing C preserves the bound.
- `brascampLiebBound_identity` (example): A single identity map with a=1 has C=1.
- `brascampLiebBound_no_zero_map` (example): In dimension1, L=0,a=1 has no finite bound.


**Named examples and contract tests.**

- `brascampLiebBound_identity_test` (computation): The one-dimensional identity datum satisfies C=1.
- `brascampLiebBound_zero_map_test` (non-example): The zero map ℝ→ℝ fails every finite C.
- `brascampLiebBound_wrong_scaling_test` (non-example): The identity datum with a=2 fails every finite C.


**Uses:** BL finiteness/stability: Distinguishes actual analytic inequality from dimension conditions.; Plate Kakeya: The uniform inequality enters induction on scales..

**Construction or proof route.** Quantify both integrability and the actual inequality; a junk Bochner integral cannot witness the bound.

**Direct prerequisites:** `mathlib:MeasureTheory.integral`.

**Source:** [Finite bounds for Hölder–Brascamp–Lieb multilinear inequalities](https://arxiv.org/pdf/math/0505691), §1 and Theorem2.1 pp.1–2; BBFL§1 p.1 L¹-power formulation. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es2-brascamp-lieb-finiteness"></a>

### Brascamp–Lieb finiteness criterion

Contract `ExponentialSumsAndCircleMethod:ES.2/brascamp-lieb-finiteness` (theorem).

For surjective L_j:H→H_j and 0<a_j≤1, a finite BL bound exists iff dimH=Σa_jdimH_j and dimV≤Σa_jdim(L_jV) for every subspaceV⊆H.

**Construction or proof route.** Necessity follows by isotropic and subspace-adapted dilations of indicator boxes. Induct on dimH: a proper critical subspace factors the problem into restriction and quotient using Fubini. Without one, use the bounded exponent polytope: its extreme points either have a proper critical subspace or exponent0/1. Hölder and induction finish.

**Direct prerequisites:** [Brascamp–Lieb inequality predicate](#es2-brascamp-lieb-bound).

**Source:** [Finite bounds for Hölder–Brascamp–Lieb multilinear inequalities](https://arxiv.org/pdf/math/0505691), Theorem2.1 p.2; full proof §4 pp.5–8 and necessity §5. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es2-brascamp-lieb-stability"></a>

### Local boundedness of the BL constant

Contract `ExponentialSumsAndCircleMethod:ES.2/brascamp-lieb-stability` (theorem).

Fix a surjective datumL⁰ with finite BL bound and 0<a_j≤1. There are η,C>0 such that max_j‖L_j−L⁰_j‖<η implies brascampLiebBound(L,a,C). This is local boundedness, not continuity.

**Construction or proof route.** Greedy image bases for orthonormal flags have minors uniformly positive in a common neighborhood, by compactness. Gaussian extremality reduces the bound to a determinant ratio. Compare it with the spectral determinant of Σa_jL_j* A_jL_j; the dimension inequalities telescope eigenvalue powers.

**Direct prerequisites:** [Brascamp–Lieb finiteness criterion](#es2-brascamp-lieb-finiteness).

**Source:** [Stability of the Brascamp–Lieb constant and applications](https://arxiv.org/pdf/1508.07502v2), Theorem1.1 p.2; proof via Theorem2.1 §2.2 pp.7–9. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es2-moment-transversality"></a>

### Moment-curve osculating transversality

Contract `ExponentialSumsAndCircleMethod:ES.2/moment-transversality` (theorem).

For n≥2,1≤k<n,M=n!, and distinct t_j∈[0,1], let V_j spanγ′(t_j),…,γ^(k)(t_j) and π_j be its orthogonal projection. Every V⊆ℝⁿ satisfies dimV≤n/(kM)Σdimπ_jV. Thus this projection datum has finite BL bound.

**Construction or proof route.** Represent a basis of V by degree≤n polynomials without constant term. A nonzero Wronskian minor bounds the exceptional parameters where projected rank drops. Average over M=n! distinct points, obtain the dimension condition and the full-space scaling identity; apply BL finiteness.

**Direct prerequisites:** [Moment curve](#es2-moment-curve); [Brascamp–Lieb finiteness criterion](#es2-brascamp-lieb-finiteness).

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), Theorem6.3 and proof pp.640–642. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es2-uniform-moment-bl"></a>

### Uniform separated moment BL bound

Contract `ExponentialSumsAndCircleMethod:ES.2/uniform-moment-bl` (theorem).

For K≥2n!,M=n! nonconsecutive K-grid intervals I_j and t_j∈I_j, the preceding projection data have a uniform BL bound C(n,k,K), also in a sufficiently small common neighborhood.

**Construction or proof route.** The parameter set is compact and separated. Cover it by finitely many BL stability neighborhoods and maximize their constants.

**Direct prerequisites:** [Moment-curve osculating transversality](#es2-moment-transversality); [Local boundedness of the BL constant](#es2-brascamp-lieb-stability).

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), Proposition6.4 and proof pp.642–643. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es2-perturbed-plate-kakeya"></a>

### Perturbed Brascamp–Lieb plate Kakeya

Contract `ExponentialSumsAndCircleMethod:ES.2/perturbed-plate-kakeya` (theorem).

For finite BL datum(L,a),0<a_j≤1,onℝⁿ and ε>0, there areη,C>0 such that for0<δ≤1, finite families of δ-neighborhoods T_{j,α} of affine translates of kerL_{j,α}, with‖L_{j,α}−L_j‖<η, satisfy ∫_{[-1,1]ⁿ}∏(Σ_α1_T)^a_j≤Cδ^{n−ε}∏(#family_j)^a_j. Duplicates count with multiplicity; distance is Euclidean.

**Construction or proof route.** Partition into ν-cubes, straighten the tubes and apply the nearby uniform BL bound to thickened projections. Iterate the scale recurrence after choosingν small enough for the ε-loss. Rescale to tangent plate axes R^{1/2},R. The weighted recurrence gives the version with nonnegative plate coefficients needed in ball inflation; signed cancellation is not assumed.

**Direct prerequisites:** [Local boundedness of the BL constant](#es2-brascamp-lieb-stability); [Uniform separated moment BL bound](#es2-uniform-moment-bl).

**Source:** [Stability of the Brascamp–Lieb constant and applications](https://arxiv.org/pdf/1508.07502v2), Theorem1.2 p.4; full induction §3.1 pp.14–15; BDG Theorem6.5 p.643 tangent-plate rescaling. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es2-parabola-decoupling-base"></a>

### Parabola critical decoupling base

Contract `ExponentialSumsAndCircleMethod:ES.2/parabola-decoupling-base` (theorem).

For E≥200,ε>0 the n=2,M-grid critical-decoupling inequality holds at exponent6, with C(E,ε)M^ε. This is the analytic base, separate from elementary integer n=2 counting.

**Construction or proof route.** Use parabolic rescaling and linear/multilinear conversion for transverse caps. Multilinear restriction and balanced wave packets give the A_β recurrence. Iterate β→βξ,N→N^{1/2}; a positive excess exponent contradicts the linear comparison. Pass p>6 to p=6 by Fourier-support Bernstein and Hölder, then approximate the native extension operator. External restriction and wave-packet adapters remain explicit.

**Direct prerequisites:** [Moment-curve extension operator](#es2-moment-extension); [Decoupling weight](#es2-decoupling-weight); [Perturbed Brascamp–Lieb plate Kakeya](#es2-perturbed-plate-kakeya).

**Source:** [The proof of the ℓ² decoupling conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n1-p09-p.pdf), Theorem1.1 pp.351–352; full §5 pp.370–377 and §6 pp.377–383. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es2-weighted-l2-decoupling"></a>

### Weighted L² interval decoupling

Contract `ExponentialSumsAndCircleMethod:ES.2/weighted-l2-decoupling` (theorem).

For E≥100n,R≥1 and an interval I partitioned into adjacent lengthR^{-1} intervalsΔ, ‖E_Ig‖²_{L²(w_B)}≤C(n,E)Σ_Δ‖E_Δg‖²_{L²(w_B)} on a radius-R ball; C is independent ofR,I,g.

**Construction or proof route.** Choose a positive rapidly decreasing cutoff whose square root has small Fourier support. Nonadjacent pieces then have disjoint enlarged Fourier supports. Apply Plancherel to finitely many adjacency classes and transfer compact cutoffs to w_B by weighted covers. OrthogonalL2Bases supplies existing Hilbert infrastructure, not this support adapter.

**Direct prerequisites:** [Moment-curve extension operator](#es2-moment-extension); [Decoupling weight](#es2-decoupling-weight).

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), Lemma8.1 and proof pp.654–655. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es2-lower-dimensional-decoupling"></a>

### Lower-dimensional slicing

Contract `ExponentialSumsAndCircleMethod:ES.2/lower-dimensional-decoupling` (theorem).

For3≤k≤n,p≥2, the(k−1)-dimensional decoupling bound at scaleR^{-1/(k−1)} gives the same bound, up to C(n,E), for E^(n)_Ig on a radius-R ball with I partitioned at that scale. The same decay exponentE is used in both dimensions.

**Construction or proof route.** Freeze the last n−k+1 coordinates, absorb their phase into g, and apply the lower-dimensional inequality. Integrate by Fubini and Minkowski and compare projected/full Euclidean weights.

**Direct prerequisites:** [Moment-curve extension operator](#es2-moment-extension); [Decoupling weight](#es2-decoupling-weight).

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), Lemma8.2 and proof pp.655–656. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es2-ball-inflation"></a>

### Ball inflation

Contract `ExponentialSumsAndCircleMethod:ES.2/ball-inflation` (theorem).

Fix1≤k<n,p≥2n,K≥2n!,M=n!,separated K-grid intervals I_i,0<ρ<K^{-1}. B has radiusρ^{-k−1}, and {Δ} is a standard bounded-overlap radiusρ^{-k} cover. Withq=pk/n and normalized weighted L♯_q(B)=|B|^{-1/q}L_q(w_B), average_Δ[∏_i(Σ_{J⊆I_i,|J|=ρ}L♯_q(E_Jg,Δ)²)^{1/2}]^{p/M}≤C(n,p,E,K,ε)ρ^{-ε}[∏_i(Σ_JL♯_q(E_Jg,B)²)^{1/2}]^{p/M}. Cover geometry and normalization are required.

**Construction or proof route.** Group pieces by comparable norm size and absorb logarithmic losses. Use positive functions constant on tangent plates with k axesρ^{-k} and n−k axesρ^{-k−1}; apply plate Kakeya. Bound each local-supremum envelope by the weighted global norm using compact smooth Fourier multipliers, summable Taylor coefficients and convolution-weight comparison.

**Direct prerequisites:** [Perturbed Brascamp–Lieb plate Kakeya](#es2-perturbed-plate-kakeya); [Moment-curve extension operator](#es2-moment-extension); [Decoupling weight](#es2-decoupling-weight).

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), Theorem6.6 and full proof pp.643–647. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es2-linear-multilinear-conversion"></a>

### Linear–multilinear decoupling conversion

Contract `ExponentialSumsAndCircleMethod:ES.2/linear-multilinear-conversion` (theorem).

ForE≥100n,p≥2,K≥2n!, letV_p(δ) be the least linear weighted decoupling constant andV_p(δ,K) the M=n! separated-interval multilinear constant. ThenV_p(δ)≤C(n,p,E,K)δ^{-ε_p(K)}sup_{δ≤δ′<1}V_p(δ′,K), whereε_p(K)>0 tends to0 asK→∞. Both constants use the same weights, partitions and integrable amplitudes.

**Construction or proof route.** At each point either one K-piece dominates or M separated comparable pieces occur. Use parabolic rescaling in the first case and the multilinear constant in the second. Iterate the K-scale recurrence; its uniform per-step constant gives a log_K loss tending to0.

**Direct prerequisites:** [Moment-curve extension operator](#es2-moment-extension); [Decoupling weight](#es2-decoupling-weight).

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), Theorem7.6 and complete proof pp.652–654. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es2-multiscale-decoupling-iteration"></a>

### Multiscale decoupling iteration

Contract `ExponentialSumsAndCircleMethod:ES.2/multiscale-decoupling-iteration` (theorem).

Forn≥3,p<n(n+1) near critical, assuming critical decoupling in smaller dimensions, everyW>0 admits finiteb_I,γ_I>0 withΣγ_I<1,Σb_Iγ_I>W. Foru>0 small enough,δ∈(0,1], useD_p(q,B)=(∏_{i=1}^{n!}(Σ_{J⊆I_i,|J|=δ^q}L♯_p(E_Jg,B)²)^{1/2})^{1/n!}, A_p(q,B,s)=(average_{B_s⊆B}D₂(q,B_s)^p)^{1/p}. Then A_p(u,B_n,u)≤Cδ^{-ε}V_p(δ)^{1−Σγ_I}D_p(1,B_n)^{1−Σγ_I}∏_IA_p(ub_I,B_n,ub_I)^{γ_I}. B_r has radiusδ^{-r}; all covers are standard bounded-overlap covers.

**Construction or proof route.** Alternate ball inflation, L² orthogonality, lower-dimensional decoupling and Hölder on the finite transition tree. ForΔ=p/n useα_j=(Δ−j−1)/(Δ−j),β_j=2Δ/((j+1)(Δ−j+1)). The recurrenceω_j=(1−α_j)η_j+α_jω_{j+1},η_j=(1−β_j)(j+1)η_{j−1}/j+β_j(j+1)ω_j/j,ω_n=0,η_1=2 hasω_1>1 whenΔ<n+1 is near n+1. The appendix proves this by an affine θ-perturbation and decay of residual positive transition weights. Truncate and iterate until weighted gain exceedsW.

**Direct prerequisites:** [Ball inflation](#es2-ball-inflation); [Weighted L² interval decoupling](#es2-weighted-l2-decoupling); [Lower-dimensional slicing](#es2-lower-dimensional-decoupling); [Parabola critical decoupling base](#es2-parabola-decoupling-base).

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), Theorem8.3 pp.657–658; general-n Theorem8.14 pp.674–675; Appendix Theorem10.1 pp.679–681. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es2-decoupling-exponent-collapse"></a>

### Decoupling exponent collapse

Contract `ExponentialSumsAndCircleMethod:ES.2/decoupling-exponent-collapse` (theorem).

The multiscale inequality and linear/multilinear comparison imply growth exponentη_p=0 forp<n(n+1) near critical. A Bernstein/Hölder limiting argument givesη_{n(n+1)}=0 and critical decoupling for everyε>0.

**Construction or proof route.** Rescaling bounds deeper A-terms byV_p(δ^{1−ub_I})D_p(1), giving exponent(1−uW)(η_p+ε). The multilinear norm to A comparison costsδ^{-u/2}. Compare upper/lower growth to getη_p≤1/(2W) afterε→0,K→∞; letW→∞. Control the volume factor in local Fourier-support Bernstein/Hölder before passing p to critical.

**Direct prerequisites:** [Multiscale decoupling iteration](#es2-multiscale-decoupling-iteration); [Linear–multilinear decoupling conversion](#es2-linear-multilinear-conversion).

**Source:** [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf), Theorem9.1,Lemma9.2 and complete final proof pp.675–678. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es2-nondegenerate-curve-critical-transfer"></a>

### Critical discrete decoupling for the sparse monomial curve

Contract `ExponentialSumsAndCircleMethod:ES.2/nondegenerate-curve-critical-transfer` (theorem).

For integers1≤t≤k and ε>0, let γ(u)=(u^k,u^{t−1},…,u),u∈[1,2]. For one point per interval of length1/N and complex coefficientsa_i, normalized weighted L^{t(t+1)} on balls of radius≥N^t is at most C(k,t,E,ε)N^ε‖a‖₂, with E≥100t. For t=1 this is ordinary L² separation. For t≥2 the Wronskian does not vanish on[1,2]; a quantitative Taylor/perturbation transfer of critical moment-curve decoupling is required. The older Bourgain–Demeter2015 general-curve theorem gives only p≤4t−2 and cannot supply this exponent.

**Construction or proof route.** Establish a lower Wronskian bound for this fixed curve on[1,2]. Taylor-expand on short intervals, normalize the derivative matrix and compare the perturbed curve with the moment curve by induction on scales. Approximate point masses and use the weighted integrable envelope, exactly as in the moment-curve discrete restriction proof. The complete critical perturbation argument is an explicit gap. For the unweighted cube version the correct radius is N^t, giving normalization N^{−t²}; the displayed cube[-N,N]^t in Assing8.6 does not provide the scale needed by the next proof.

**Direct prerequisites:** [Critical moment-curve decoupling theorem](#es2-critical-decoupling); [Critical discrete restriction estimate](#es2-discrete-restriction).

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §8.1 Corollary8.5 pp.76–77 and Theorem8.6 p.77; BDG critical input. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.

**Source:** [ℓ² decouplings for hypersurfaces with nonzero Gaussian curvature and nondegenerate curves](https://arxiv.org/pdf/1409.1634v2), Theorem1.4 p.3. This is a boundary check: the theorem gives only2≤p≤4n−2. It is not cited as a proof of the needed p=n(n+1) transfer.


<a id="es2-improved-hua-moment"></a>

### Improved monomial mean value

Contract `ExponentialSumsAndCircleMethod:ES.2/improved-hua-moment` (theorem).

For k≥1,1≤t≤k,ε>0,N≥1, ∫₀¹|Σ_{1≤n≤N}e(αn^k)|^{t(t+1)}dα≤C(k,t,ε)N^{t²+ε}. The exponent is t² rather than the VMV exponent t(t+1)/2 because the lower coefficients are integrated out with kernels and the top coordinate is rescaled.

**Construction or proof route.** Apply sparse-curve critical restriction on the dyadic interval[N,2N] at radiusN^t. Rescale the lower coordinates and the top coefficient. Use trapezoidal Fourier kernels with L¹ bounded independently of their degree to remove lower phases, then a positive Fourier cutoff to count exact top-degree equalities. Sum dyadic intervals by Minkowski and absorb logarithms intoε.

**Direct prerequisites:** [Critical discrete decoupling for the sparse monomial curve](#es2-nondegenerate-curve-critical-transfer); [Torus coefficient-counting identity](#es1-torus-coefficient-extraction).

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), Theorem8.9 and full proof pp.82–83. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


### Required refinements for this layer

- Critical sparse-curve transfer and corrected scale: Assing8.6 gives a statement but omits the critical transfer proof. Its displayed[-N,N]^t cube withN^{-t²} normalization cannot yield the rescaling used in8.9; use[-N^t,N^t]^t. Bourgain–Demeter arXiv1409.1634v2 Theorem1.4 p.3 was read and gives onlyp≤4t−2. Acquire the complete critical C^t nonzero-Wronskian perturbation transfer, including constant control for this fixed sparse monomial curve.
- Gaussian extremality proof: BBFL stability invokes Lieb, Invent. Math.102(1990), Theorem6.2. The original complete proof is not acquired. Required interface: the optimal L¹-power BL constant equals the supremum of centered positive-definite Gaussian determinant ratios, including local Gaussian cutoffs.
- Native Fourier support, covers and iteration adapters: Exact analytic contracts are stated, but native proof-node signatures remain unwritten for uniform-moment-bl, perturbed-plate-kakeya, weighted-l2-decoupling, lower-dimensional-decoupling, ball-inflation, linear-multilinear-conversion, multiscale-decoupling-iteration and decoupling-exponent-collapse. They need canonical nonintegral-scale grid partitions; standard bounded-overlap covers of comparable cardinality; compact Fourier-support Bernstein; positive Schwartz cutoff with small square-root Fourier support; affine rescaling/Jacobian; finite D/A norm and least-constant constructions with ELP finiteness. Omitted under PROTOCOL§13; no arbitrary-cover or conclusion-bearing Prop fields stand in for them.
- Parabola restriction and wave packets: BD2015§6 quotes transverse multilinear restriction as Theorem6.1 from Bennett–Carbery–Tao,Acta196(2006),261–302, and uses §§3–5 wave packets. Acquire the complete restriction proof and native Fourier-support, cap-transversality, positive-localization and approximation adapters. Generic Kakeya or integer VMV alone does not prove the parabola target.



## ES.3 — Major arcs and local factors

Local factors are constructed before they are identified with convergent products. Waring, prime and generic-form normalizations are kept separate. The Markoff three-variable mass and quaternary moving pair mass have exponents −2 and −3 respectively; finite Gauss conventions enter through FF.1. Nonsingularity or the actual local lifting theorem is required for positivity.

**Atlas planets:** Singular series; P-adic representation density; Weighted real density; Markoff pair density; Prime major arcs.

**Coverage:** planned. The exact contracts follow; stage-specific refinements are listed after them.


<a id="es3-waring-series-coefficient"></a>

### Waring singular-series coefficient

Contract `ExponentialSumsAndCircleMethod:ES.3/waring-series-coefficient` (definition).

For degree d, number of variables s and integer target m≥0, A_{d,s,m}(q)=Σ_{a mod q,gcd(a,q)=1}(q^{-1}completePowerSum(d,q,a))^s exp(−2πiam/q). Use native finite residues and the negative target-frequency sign. Define A(0)=0 by the empty sum; at q=1 its sole reduced residue is0 and A(1)=1.

**Additional hypotheses:** All four parameters are natural. At q>0 this agrees with the source reduced representatives1≤a≤q. The coefficient may be negative; it is not defined by absolute values..

**API.**

- `waringSeriesCoeff_zero` (simp): A(0)=0.
- `waringSeriesCoeff_one` (simp): A(1)=1.
- `waringSeriesCoeff_conjugate` (structure): Complex conjugation fixes A(q).
- `waringSeriesCoeff_periodic_target` (compatibility): A_{m+q}(q)=A_m(q).


**Named examples and contract tests.**

- `waringSeriesCoeff_zero_test` (degenerate): d=3,s=7,m=1,q=0 gives0.
- `waringSeriesCoeff_one_test` (computation): d=3,s=7,m=1,q=1 gives1.
- `waringSeriesCoeff_normalization_test` (computation): d=2,s=2,m=1,q=3 gives1/3.
- `waringSeriesCoeff_negative_test` (non-example): d=2,s=2,m=0,q=3 gives−2/3, not2/3.


**Uses:** Assing §6.2 Lemmas6.6–6.9: CRT multiplicativity, global Euler factorization and local finite-density identities all use this exact coefficient..

**Construction or proof route.** Use a native finite sum with decidable coprimality and the source q^{-s} normalization. Pair a with−a modulo q and conjugate the phase to show the coefficient is real. The target phase is periodic in m modulo q.

**Direct prerequisites:** [Complete monomial exponential sum](#es0-complete-power-sum); `mathlib:fourier_neg`; `mathlib:fourier_add`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked. The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion.


<a id="es3-waring-series-multiplicative"></a>

### Singular-series coefficient multiplicativity

Contract `ExponentialSumsAndCircleMethod:ES.3/waring-series-multiplicative` (theorem).

For positive coprime u,v, A_{d,s,m}(uv)=A_{d,s,m}(u)A_{d,s,m}(v), for every natural d,s,m. This is exact coefficient multiplicativity, independent of absolute convergence of the infinite series.

**Additional hypotheses:** Both moduli are positive and coprime. The correspondence between unit target frequencies uses a/(uv)≡a₁/u+a₂/v modulo one..

**Construction or proof route.** Use the native CRT equivalence to reindex both complete residues and reduced frequency residues. Rescale the residue coordinates by the units u and v to separate the monomial phases. Separate the target phase under the same frequency correspondence and distribute finite products/sums.

**Direct prerequisites:** [Complete monomial exponential sum](#es0-complete-power-sum); [Waring singular-series coefficient](#es3-waring-series-coefficient); `mathlib:ZMod.prodEquivPi`; `mathlib:Finset.sum_mul_sum`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked. The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion.


<a id="es3-waring-singular-series"></a>

### Waring singular series

Contract `ExponentialSumsAndCircleMethod:ES.3/waring-singular-series` (definition).

waringSingularSeries(d,s,m)=Σ_{q≥1}A_{d,s,m}(q), implemented with native tsum over all naturals and A(0)=0. A summability proof is required before treating this native totalized value as an analytic singular series: nonsummable input gives native zero and is not evidence for a vanishing arithmetic density.

**Additional hypotheses:** The convergence theorem below uses d≥3,s≥2d+1. Other ranges require their own proven hypotheses; the definition alone has no positivity or convergence content..

**API.**

- `waringSingularSeries_eq_tsum` (characterisation): The value is the native tsum of the coefficient family with A0=0.
- `waringSingularSeries_hasSum` (compatibility): Summable coefficients have this value as their native HasSum limit.
- `waringSingularSeries_real` (structure): Under summability its imaginary part is zero.


**Named examples and contract tests.**

- `waringSingularSeries_linear_test` (computation): For d=1,s=2 and any m the series is1, since every coefficient q>1 vanishes.
- `waringSingularSeries_native_limit_test` (compatibility): A Summable degree3,s7 coefficient family has native HasSum equal to this defined series, not to an arbitrary supplied constant.
- `waringSingularSeries_real_test` (non-example): For every Summable real-coefficient family, the series has imaginary part zero.


**Uses:** Waring asymptotic and local positivity: Provides the normalized arithmetic factor; convergence is supplied separately..

**Construction or proof route.** Use the existing generated native tsum, not a custom summation or limit carrier. Under Summable, native HasSum gives the meaningful sum and its finite-partial-sum limit. Conjugation of the real coefficients gives a real value.

**Direct prerequisites:** [Waring singular-series coefficient](#es3-waring-series-coefficient); `mathlib:tprod`; `mathlib:Multipliable`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked. The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion.


<a id="es3-waring-series-absolute-convergence"></a>

### Waring singular-series absolute convergence

Contract `ExponentialSumsAndCircleMethod:ES.3/waring-series-absolute-convergence` (theorem).

For d≥3 and s≥2d+1, the family q↦|A_{d,s,m}(q)| is summable for every m, with a bound uniform in m. In particular the complex singular series exists as an actual sum.

**Additional hypotheses:** This is the simple source Theorem6.18 range; it is not falsely substituted for the sharper §9 range that depends on fixed target m and more delicate prime-power estimates..

**Construction or proof route.** The complete monomial bound gives|A(q)|≤C_{d,s}q^{1−s/d} for q≥1 by at most q reduced residues. Since1−s/d≤−1−1/d, compare with the convergent real p-series, keeping the q=1 term and excluding the empty q=0 term. Native summability of norms implies complex summability and identifies the tsum with the usual series.

**Direct prerequisites:** [Waring singular-series coefficient](#es3-waring-series-coefficient); [Complete monomial sum bound](#es0-complete-power-bound); `mathlib:Multipliable`; `mathlib:tprod`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked. The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion.


<a id="es3-waring-singular-integral"></a>

### Waring singular integral

Contract `ExponentialSumsAndCircleMethod:ES.3/waring-singular-integral` (definition).

I_{d,s}=∫_{β∈ℝ}(∫_{0≤t≤1}exp(2πiβt^d)dt)^s exp(−2πiβ)dβ, using native Lebesgue measure and Bochner integration. For d≥1 and s>d the integrand is absolutely integrable. This is the real local factor at normalized target1 for positive power variables, not a p-adic density or the volume of an unweighted arbitrary real solution set.

**Additional hypotheses:** The definition is native and totalized, but the valid analytic domain is d≥1,s>d. Parameter and frequency endpoints use full Lebesgue integration; there is no unproved cutoff removal..

**API.**

- `waringSingularIntegral_eq_integral` (characterisation): The value is the specified native two-step integral with phase normalization2π.
- `waringSingularIntegral_integrable` (structure): For d≥1,s>d the full-line integrand is integrable.
- `waringSingularIntegral_positive` (relation): On the valid domain its real part is positive, by the Gamma evaluation theorem.


**Named examples and contract tests.**

- `waringSingularIntegral_linear_test` (computation): d=1,s=2 gives1.
- `waringSingularIntegral_three_test` (computation): d=1,s=3 gives1/2.
- `waringSingularIntegral_quadratic_test` (compatibility): d=2,s=3 givesπ/4, matching the Gamma ratio with the native2π convention.


**Uses:** Assing Theorem6.5 proof pp.38–39: Real rescaling and Fourier inversion supply the archimedean main-term factor..

**Construction or proof route.** Define the bounded inner finite-interval integral using native integration. After u=t^d and integration by parts/Dirichlet convergence, the inner integral has bound C_d(1+|β|)^{−1/d}. Its s-th power is integrable on the full line when s>d, so the source symmetric-frequency truncations tend to this value.

**Direct prerequisites:** `mathlib:MeasureTheory.integral`; `mathlib:MeasureTheory.IntegrableOn`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked. The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion.


<a id="es3-waring-singular-integral-evaluation"></a>

### Waring singular integral evaluation

Contract `ExponentialSumsAndCircleMethod:ES.3/waring-singular-integral-evaluation` (theorem).

For d≥1 and s>d, I_{d,s}=Γ(1+1/d)^s/Γ(s/d), cast into ℂ. Its imaginary part is zero and its real part is strictly positive.

**Additional hypotheses:** The arguments of native Real.Gamma are strictly positive; its totalization at poles is not used. The positivity conclusion is archimedean only..

**Construction or proof route.** Substitute u_i=t_i^d in the s parameter integrals and use finite-frequency Fubini for symmetric truncations. The frequency integral is the sine kernel inΣu_i−1. The convolution density at1 is evaluated by the native beta/Gamma identities on the simplex. Use the source bounded-variation/Fourier inversion argument for the density to identify the symmetric limit, already equal to the full integral by absolute integrability. Apply the native Gamma recurrence and positivity at positive arguments. The general sine-kernel inversion/beta convolution interfaces are an explicit source-to-library frontier, not an assumed result field.

**Direct prerequisites:** [Waring singular integral](#es3-waring-singular-integral); `mathlib:Real.Gamma`; `mathlib:Real.Gamma_pos_of_pos`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked. The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion.


<a id="es3-waring-congruence-count"></a>

### Waring congruence solution count

Contract `ExponentialSumsAndCircleMethod:ES.3/waring-congruence-count` (definition).

For a positive natural modulus q, waringCongruenceCount(d,s,m,q) is the native cardinality of the subtype of x∈(ZMod q)^s with Σ_ix_i^d=m modq. Residues are unrestricted, including zero; tuples are ordered. Use native ZMod and its existing finite instance under NeZero q.

**Additional hypotheses:** q>0 via NeZero; q=0 cannot be given a finite residue count because native ZMod0 is infinite. s=0 is permitted and leaves only the empty tuple..

**API.**

- `waringCongruenceCount_one` (simp): At modulus1 the count is1 for all d,s,m.
- `waringCongruenceCount_empty_tuple` (simp): For s=0 it is1 if m=0modq and0 otherwise.
- `waringCongruenceCount_linear_one` (characterisation): For d=1,s=1 the count is1 for every positive q and target.
- `waringCongruenceCount_periodic_target` (compatibility): Replacing m by m+q does not change the count.


**Named examples and contract tests.**

- `waringCongruenceCount_one_test` (degenerate): d=3,s=7 and q=1 gives1 for every m.
- `waringCongruenceCount_three_test` (computation): For d=2,s=2,m=1,q=3 the count is4.
- `waringCongruenceCount_empty_test` (non-example): For q=2,s=0 the targets0and1 have counts1and0.
- `waringCongruenceCount_native_linear_test` (compatibility): For d=1,s=1 it agrees with the cardinality of the singleton prescribed residue.


**Uses:** Assing Lemma6.9 and positivity lifting: Orthogonality relates the local partial series to q^{1−s} times this count..

**Construction or proof route.** Count the concrete finite subtype with native Fintype.card. At modulus1 the ring has one element, so every tuple is the unique tuple. For d=1,s=1 there is exactly the prescribed residue; target-periodicity follows from native casts.

**Direct prerequisites:** `mathlib:ZMod.fintype`; `mathlib:Fintype.card`; `mathlib:ZMod.natCast_self`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked. The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion.


<a id="es3-waring-local-factor"></a>

### Waring local factor

Contract `ExponentialSumsAndCircleMethod:ES.3/waring-local-factor` (definition).

For a prime p, χ_{d,s,m}(p)=Σ_{e≥0}A_{d,s,m}(p^e), using native tsum. The e=0 term isA(1)=1. Only once local summability and the normalized-count limit are proved is this interpreted as a p-adic solution density. The native totalized value for a divergent family is not a chosen density.

**Additional hypotheses:** The expression is defined for natural p, but analytical uses require p prime. The simple global convergence range d≥3,s≥2d+1 supplies local convergence. Degree-one special tests are elementary independent cases..

**API.**

- `waringLocalFactor_eq_tsum` (characterisation): The value is the native prime-power coefficient series including e=0.
- `waringLocalFactor_hasSum` (compatibility): Under local Summable this value is the native HasSum limit.
- `waringLocalFactor_real` (structure): Under local Summable its imaginary part is zero.


**Named examples and contract tests.**

- `waringLocalFactor_linear_test` (computation): At d=1,s=2,m=1,p=3 the value is1.
- `waringLocalFactor_native_limit_test` (compatibility): Any locally Summable prime-power coefficient family has its native HasSum equal to this factor.
- `waringLocalFactor_real_test` (non-example): A locally Summable factor has no nonzero imaginary part.
- `waringLocalFactor_three_normalization_test` (computation): For d=2,s=2,m=1,p=3 the factor is4/3: there are4 solutions modulo3, all primitive, and4·3^{e−1} modulo3^e. This separates the correct q^{s−1} normalization from q^s and detects omission of the e=0 term.


**Uses:** Euler factorization and all-place positivity: One factor at each prime is identified with its normalized congruence-density limit..

**Construction or proof route.** Use the existing tsum of the prime-power coefficients. Under local Summable, HasSum and coefficient reality give the meaningful real local factor. The finite orthogonality identity identifies the partial sum through e with M(p^e)/p^{e(s−1)}; taking its proved limit gives the local density theorem.

**Direct prerequisites:** [Waring singular-series coefficient](#es3-waring-series-coefficient); [Waring congruence solution count](#es3-waring-congruence-count); `mathlib:tprod`; `mathlib:Multipliable`; `mathlib:Filter.Tendsto`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked. The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion.


<a id="es3-waring-local-density-limit"></a>

### Waring p-adic density limit

Contract `ExponentialSumsAndCircleMethod:ES.3/waring-local-density-limit` (theorem).

For d≥3,s≥2d+1 and every prime p, M(p^e)/p^{e(s−1)} tends to Reχ_{d,s,m}(p) as e→∞. In fact for every e the normalized count equalsΣ_{v=0}^eA(p^v), a real number; therefore the limit exists and is nonnegative.

**Additional hypotheses:** All residues are counted in native ZMod(p^e). The exponent e(s−1) is interpreted as a signed integer before any totalized boundary convention, though the theorem’s range has s≥1. Prime p>0 makes its denominator nonzero..

**Construction or proof route.** Apply finite additive orthogonality to the congruence indicator and expand over the s residue coordinates. Classify a frequency modulo p^e by its exact reduced denominator p^v, and use the repeated-period identity for the complete monomial sum. This gives M(p^e)=p^{e(s−1)}Σ_{v≤e}A(p^v), exactly source Lemma6.9. Global absolute convergence bounds every prime-power subseries, so its partial sums converge to the local factor. Nonnegative normalized finite counts force the real limit to be nonnegative.

**Direct prerequisites:** [Waring congruence solution count](#es3-waring-congruence-count); [Waring local factor](#es3-waring-local-factor); [Waring singular-series absolute convergence](#es3-waring-series-absolute-convergence); `mathlib:fourierCoeff_fourier`; `mathlib:Filter.Tendsto`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked. The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion.


<a id="es3-waring-series-euler-product"></a>

### Waring singular-series Euler product

Contract `ExponentialSumsAndCircleMethod:ES.3/waring-series-euler-product` (theorem).

For d≥3,s≥2d+1 and any target m, the singular series equals the native infinite product of χ_{d,s,m}(p) over the subtype of prime naturals. The series and product are absolutely convergent; each factor is real and nonnegative.

**Additional hypotheses:** Infinite rearrangement is justified by absolute convergence, not by formal multiplicativity alone. A factor may vanish in a locally insoluble case..

**Construction or proof route.** Combine exact coefficient multiplicativity with the fundamental theorem of arithmetic for finite products over primes. Expand each finite prime-power product and identify the corresponding coefficient sum. Use absolute convergence to pass through growing finite sets of primes and prime-power truncations; native tprod records the resulting product. Use the local normalized-count limit for reality and nonnegativity.

**Direct prerequisites:** [Waring singular series](#es3-waring-singular-series); [Waring local factor](#es3-waring-local-factor); [Singular-series coefficient multiplicativity](#es3-waring-series-multiplicative); [Waring singular-series absolute convergence](#es3-waring-series-absolute-convergence); `mathlib:tprod`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked. The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion.


<a id="es3-waring-major-arc-approximation"></a>

### Monomial major-arc approximation

Contract `ExponentialSumsAndCircleMethod:ES.3/waring-major-arc-approximation` (theorem).

For d≥1 there is C_d>0 such that for P≥1,q≥1, any integer a and real β, the difference between powerWeylSum(d,P,a/q+β) and q^{-1}completePowerSum(d,q,a) times∫_0^P exp(2πiβt^d)dt has norm at most C_dq(1+|β|P^d). Thus on q≤P^δ,|β|≤P^{−d+δ} it is O_d(P^{2δ}) when δ≥0.

**Additional hypotheses:** No coprimality is needed for this exact residue decomposition estimate. Its sharp §9 stationary-phase refinement is a separate theorem and is not asserted here..

**Construction or proof route.** Split the positive interval into residue classes modulo q, keeping the end pieces. On each class approximate the amplitude exp(2πiβ(qy+z)^d) by its integral. The error is bounded by endpoint norms plus integrated absolute derivative, not the defective printed quadrature bound in the notes. The derivative integral is O_d(|β|P^d); summing q residues yields the stated error. Collect the complete residue phase and rescale the integral variable.

**Direct prerequisites:** [Monomial Weyl sum](#es1-monomial-weyl-sum); [Complete monomial exponential sum](#es0-complete-power-sum); `mathlib:MeasureTheory.integral`; `mathlib:MeasureTheory.IntegrableOn`; `mathlib:Complex.norm_exp_ofReal_mul_I`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), Lemma6.3 and proof pp.35–36. Tracks the underlying q(1+|β|P^d) estimate, using a valid bounded-variation/quadrature argument. The precise native sum-integral interface is a recorded analytic frontier.


<a id="es3-waring-primitive-local-positivity"></a>

### Primitive Waring local positivity

Contract `ExponentialSumsAndCircleMethod:ES.3/waring-primitive-local-positivity` (theorem).

Let d≥3,s≥2d+1,p prime,d=p^τu with p∤u, and γ=τ+1 for odd p orτ+2 for p=2. IfΣ_i x_i^d=m modp^γ has a solution with at least one unit coordinate, then Reχ_{d,s,m}(p)≥p^{−γ(s−1)}>0. The hypothesis is primitive solubility at the indicated depth, not arbitrary solubility modulo p.

**Additional hypotheses:** The native residues are in ZMod(p^γ). The prime-power exponent and the derivative valuation are not replaced by a nonsingularity assumption at level1 when p divides d..

**Construction or proof route.** Choose a unit coordinate and retain the other s−1 residues modulo p^γ. The source unit-power lifting argument gives a unit d-th root at every larger depth for each of the p^{(e−γ)(s−1)} choices of the other coordinates. Normalize the resulting lower bound on M(p^e) and use the proved local-density limit. This is a specialized monomial lifting theorem, not a duplicate general Hensel theory.

**Direct prerequisites:** [Waring congruence solution count](#es3-waring-congruence-count); [Waring p-adic density limit](#es3-waring-local-density-limit); [Waring local factor](#es3-waring-local-factor); `mathlib:IsUnit`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.2 Lemmas6.10–6.13 pp.41–44, statements and proofs; E25–26. The primitive lifting condition is explicit; the uniform source proof is used only in degree at least three.


<a id="es3-waring-uniform-series-positivity"></a>

### Uniform Waring singular-series positivity

Contract `ExponentialSumsAndCircleMethod:ES.3/waring-uniform-series-positivity` (theorem).

For d≥3 and s≥2^d+1 there is c(d,s)>0 such that ReS_{d,s}(m)≥c(d,s) for every natural target m. This is the classical Waring range of Theorem6.13 with its degree-two proof boundary excluded, not a claim that the mere existence of Euler factors implies positivity.

**Additional hypotheses:** The bound is uniform in m. The numerical source local-solubility thresholds are2d for odd d and4d for even d; the claimed s range dominates both when d≥3..

**Construction or proof route.** For every prime, source Lemma6.12 constructs a primitive solution modulo p^γ. Use the corrected γ calculation from E25 and the primitive local-positivity theorem. For the finitely many small primes the explicit p^{−γ(s−1)} lower bounds are independent of m. The complete monomial bound givesχ(p)=1+O_{d,s}(p^{−1−κ}) for large primes, uniformly in m with κ>0. The tail product is bounded away from zero. Combine finite local lower bounds and the convergent Euler product.

**Direct prerequisites:** [Primitive Waring local positivity](#es3-waring-primitive-local-positivity); [Waring singular-series Euler product](#es3-waring-series-euler-product); [Complete monomial sum bound](#es0-complete-power-bound); [Waring singular-series absolute convergence](#es3-waring-series-absolute-convergence).

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.2 Lemmas6.10–6.13 pp.41–44, statements and proofs; E25–26. The primitive lifting condition is explicit; the uniform source proof is used only in degree at least three.


<a id="es3-form-congruence-count"></a>

### Polynomial-system congruence count

Contract `ExponentialSumsAndCircleMethod:ES.3/form-congruence-count` (definition).

For n variables, r integral polynomial equations F_j and integral target m_j, formCongruenceCount(n,r,q,F,m) is the cardinality of x∈(ℤ/qℤ)ⁿ with F_j(x)=m_j for all j. Require q≥1; q=1 gives1. The raw count is not a density and includes singular solutions.

**API.**

- `formCongruenceCount_one` (simp): Modulus1 gives1.
- `formCongruenceCount_no_equations` (simp): With r=0 the count is qⁿ.
- `formCongruenceCount_projection` (example): For F=X₀,n≥1,r=1 the count is q^{n−1}.
- `formCongruenceCount_periodic` (relation): Shifting targets by q does not change the count.
- `formCongruenceCount_crt` (compatibility): For coprime positive q,q′ the count at qq′ is the product.


**Named examples and contract tests.**

- `formCongruenceCount_projection_test` (computation): n=2,r=1,F=X₀,q=5,m=2 gives5.
- `formCongruenceCount_inconsistent_test` (non-example): The constant-zero equation with target1 has no solutions mod5.
- `formCongruenceCount_repeated_equation_test` (degenerate): Two identical X₀ equations with the same target still give5, not1, for n=2,q=5.


**Uses:** ES.3 local density: Determines the ambient dimension normalization.; ES.4 Markoff/quadratic counts: Uses the same native residue count for three- and four-variable equations..

**Construction or proof route.** Evaluate native MvPolynomial over native ZMod using the canonical integer ring map, then use the finite subtype cardinality.

**Direct prerequisites:** `mathlib:MvPolynomial.eval₂`; `mathlib:Fintype.card`.

**Source:** [Reductions of K3 surfaces and abelian varieties](https://web.math.princeton.edu/~yunqingt/ArithGSpin.pdf), §4.1 pp.14–16; generic normalization specializes the quadratic density; Ghosh–Sarnak(9.7),(9.19),(9.22) pp.28–30. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es3-form-normalized-count"></a>

### Normalized polynomial-system residue mass

Contract `ExponentialSumsAndCircleMethod:ES.3/form-normalized-count` (definition).

For q≥1 put formNormalizedCount=q^{−(n−r)}formCongruenceCount. The exponent n−r is an integer: redundant equations do not secretly change the normalization to rank, and r>n does not saturate subtraction at0. The dimension expected by a nonsingular codimension-r system is part of its hypotheses.

**API.**

- `formNormalizedCount_nonneg` (relation): The normalized mass is nonnegative.
- `formNormalizedCount_one` (simp): q=1 gives1.
- `formNormalizedCount_crt` (compatibility): It is multiplicative in coprime positive moduli.
- `formNormalizedCount_projection` (example): A coordinate projection equation has normalized mass1.


**Named examples and contract tests.**

- `formNormalizedCount_projection_test` (computation): The n=2,r=1 coordinate projection at q=5 gives1.
- `formNormalizedCount_duplicate_test` (degenerate): Repeating that equation with n=r=2 gives mass5.
- `formNormalizedCount_overdetermined_test` (degenerate): n=1,r=2 repeated X₀ equations at q=5 give mass5, using the negative normalization exponent.


**Uses:** ES.3 p-adic densities: The prime-power sequence has the intended geometric normalization.; Markoff pair variance: The four-variable pair equation has q^{-3}, whereas Markoff has q^{-2}..

**Construction or proof route.** Cast the finite count to ℝ and divide by the integer power q^{n−r}.

**Direct prerequisites:** [Polynomial-system congruence count](#es3-form-congruence-count).

**Source:** [Reductions of K3 surfaces and abelian varieties](https://web.math.princeton.edu/~yunqingt/ArithGSpin.pdf), §4.1 p.15, t(p,m,ν)=p^{−ν(n−1)}count; generic codimension-r extension is the elementary normalization. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es3-form-padic-density"></a>

### Polynomial-system p-adic representation density

Contract `ExponentialSumsAndCircleMethod:ES.3/form-padic-density` (definition).

formPadicDensity(F,m,p) is the native real limit choice of formNormalizedCount at p^t,t→∞. Require p prime and separately prove limit existence before using it. It is a representation density of a fiber; it is distinct from a lattice isometry stabilizer density. Convergence may fail for degenerate systems.

**API.**

- `formPadicDensity_eq_of_tendsto` (characterisation): If normalized prime-power masses tend to L, the density is L.
- `formPadicDensity_nonneg` (relation): A proved finite limit is nonnegative.
- `formPadicDensity_projection` (example): The coordinate-projection density is1.
- `formPadicDensity_inconsistent` (example): A constant-zero equation with target1 has density0.


**Named examples and contract tests.**

- `formPadicDensity_projection_test` (computation): n=2,r=1,F=X₀,target2,p=5 has density1.
- `formPadicDensity_inconsistent_test` (non-example): F=0,target1,p=5 has density0.
- `formPadicDensity_hyperbolic_test` (computation): F=XY,target1,n=2,r=1,p=5 has density4/5, since both factors must be units.


**Uses:** ES.4 weighted quadratic asymptotic: Supplies the representation Euler factors.; ES.4 Markoff: Used only after the odd/2-adic formulas prove convergence..

**Construction or proof route.** Use Filter.limUnder, with an API that requires Tendsto before identifying any numerical value. No automatic convergence or positivity is encoded.

**Direct prerequisites:** [Normalized polynomial-system residue mass](#es3-form-normalized-count); `mathlib:Filter.limUnder`.

**Source:** [Reductions of K3 surfaces and abelian varieties](https://web.math.princeton.edu/~yunqingt/ArithGSpin.pdf), §4.1 definition of μ_p pp.14–15; Ghosh–Sarnak(9.19) p.30. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es3-weighted-real-density"></a>

### Weighted real fiber density

Contract `ExponentialSumsAndCircleMethod:ES.3/weighted-real-density` (definition).

For F:ℝⁿ→ℝʳ,targetm and real weightw, weightedRealDensity is lim_{ε→0+}(2ε)^{−r}∫_{∀j|F_j(x)−m_j|<ε}w(x)dx, implemented by the native limit choice and with separate existence hypotheses. The symmetric tube uses(2ε)^{-r}. At a regular value, smooth compactly supported w gives the coarea fiber integral; a singular value needs separate analysis.

**API.**

- `weightedRealDensity_eq_of_tendsto` (characterisation): A proved tube limit identifies the value.
- `weightedRealDensity_add` (relation): Add weights when their restrictions to every sufficiently small positive tube are integrable and both normalized tube limits exist.
- `weightedRealDensity_smul` (relation): Scalar multiplication commutes with a proved limit.
- `weightedRealDensity_equation_scale` (compatibility): Scaling a scalar equation and target by nonzero a multiplies the density by|a|^{-1}.
- `weightedRealDensity_weight_zero` (simp): A zero weight gives0.


**Named examples and contract tests.**

- `weightedRealDensity_interior_test` (computation): n=r=1,F(x)=x,w=1_[0,1],m=1/2 gives1.
- `weightedRealDensity_boundary_test` (compatibility): The same equation/weight at m=0 gives1/2.
- `weightedRealDensity_outside_test` (non-example): At m=2 it gives0.


**Uses:** ES.4 quadratic forms: The regular level Q=1 supplies the archimedean coefficient.; Markoff quaternary pairs: Fixes the missing factor2 in the printed tube limit..

**Construction or proof route.** Use native Euclidean volume and set integrals. The limit is not a field of a record claiming the asymptotic.

**Direct prerequisites:** `mathlib:Filter.limUnder`; `mathlib:MeasureTheory.integral`.

**Source:** [Reductions of K3 surfaces and abelian varieties](https://web.math.princeton.edu/~yunqingt/ArithGSpin.pdf), §4.2 p.19 μ∞; Ghosh–Sarnak(9.20) p.30, corrected symmetric-tube factor. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es3-quadratic-local-stability"></a>

### Quadratic density stabilization

Contract `ExponentialSumsAndCircleMethod:ES.3/quadratic-local-stability` (theorem).

For a fixed nondegenerate integral quadratic form Q in n≥5 variables, targetm≠0 and primep, the normalized residue masses have a finite limit μ_p(Q,m). The finite-level tail is O_Q(p^{2−3 floor(t/2)}), uniformly in m, and |μ_p−1|≤C_Q/p. This individual O(p^{-1}) bound does not assert absolute convergence of the product over p.

**Construction or proof route.** Separate solutions according to their p-divisibility and nonsingular lifts; for high t only the deeply divisible blocks contribute to the tail. Use the fixed determinant/discriminant to separate finitely many bad primes. Read the cited local lifting interface before claiming closure.

**Direct prerequisites:** [Polynomial-system p-adic representation density](#es3-form-padic-density).

**Source:** [Reductions of K3 surfaces and abelian varieties](https://web.math.princeton.edu/~yunqingt/ArithGSpin.pdf), Lemma4.4 and Lemma4.5 with proofs pp.16–17. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es3-maximal-lattice-local-positivity"></a>

### Maximal-lattice local positivity

Contract `ExponentialSumsAndCircleMethod:ES.3/maximal-lattice-local-positivity` (theorem).

For a maximal integral quadratic lattice of rankn≥5 and a positive integer m, every p-adic lattice contains an integral hyperbolic plane. Consequently μ_p(Q,m)≥1/2 and the representation product is bounded below uniformly in m by a positive constant depending only on the lattice. The maximal lattice and integral hyperbolic-plane objects are imported from current IntegralLattices/OrthogonalSpinGroups; no generic lattice infrastructure is re-planned here.

**Construction or proof route.** Use the maximality theorem for local quadratic lattices to split an integral hyperbolic plane and write Q=x₁x₂+Q₁. For unit x₁, solve x₂ uniquely for every other coordinate; normalized count is≥1−1/p. Combine fixed bad-prime bounds with the sharper good-prime estimates, not the crude O(p^{-1}) estimate alone.

**Direct prerequisites:** [Quadratic density stabilization](#es3-quadratic-local-stability).

**Source:** [Reductions of K3 surfaces and abelian varieties](https://web.math.princeton.edu/~yunqingt/ArithGSpin.pdf), Lemma4.6 and proof pp.17–18; Corollary4.7 p.18. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es3-markoff-residue-mass"></a>

### Markoff finite residue mass

Contract `ExponentialSumsAndCircleMethod:ES.3/markoff-residue-mass` (definition).

For q≥1, δ_q(k)=q^{-2}#{x∈(ℤ/qℤ)³:x₁²+x₂²+x₃²+x₁x₂x₃=k}. This specializes formNormalizedCount with n=3,r=1. Changing the sign of x₃ identifies it with the standard minus-sign Markoff form. No convergence or positive density is assumed.

**API.**

- `markoffResidueMass_nonneg` (relation): The mass is nonnegative.
- `markoffResidueMass_one` (simp): Modulus1 gives1.
- `markoffResidueMass_periodic` (relation): It depends only on k modulo q.
- `markoffResidueMass_crt` (compatibility): It is multiplicative for coprime positive moduli.


**Named examples and contract tests.**

- `markoffResidueMass_obstruction_test` (non-example): q=4,k=3 gives0.
- `markoffResidueMass_odd_one_test` (computation): q=8,k=1 gives3/4.
- `markoffResidueMass_odd_five_test` (computation): q=8,k=5 gives9/4; the two odd classes have different masses.


**Uses:** Variance expected term: Uses the finite modulus m.; Local density tables: Prime-power limits are proved from explicit Gauss-sum formulas..

**Construction or proof route.** Evaluate the native integral polynomial through the existing normalized-count definition.

**Direct prerequisites:** [Normalized polynomial-system residue mass](#es3-form-normalized-count).

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), (9.7) p.28; (B.1)–(B.2) pp.45–46. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es3-markoff-pair-mass"></a>

### Quaternary Markoff pair mass

Contract `ExponentialSumsAndCircleMethod:ES.3/markoff-pair-mass` (definition).

For q≥1 let δ_q(a,b)=q^{-3}#{x,y∈(ℤ/qℤ)²:g_a(x)−g_b(y)=b²−a²}, g_a(u,v)=u²+v²+auv. This is the representation density of one equation in four variables, not the mass of a homogeneous zero fiber.

**API.**

- `markoffPairMass_one` (simp): q=1 gives1.
- `markoffPairMass_nonneg` (relation): The mass is nonnegative.
- `markoffPairMass_symm` (relation): Interchanging a,b and x,y preserves the mass.
- `markoffPairMass_crt` (compatibility): It is multiplicative in coprime moduli.


**Named examples and contract tests.**

- `markoffPairMass_one_test` (degenerate): q=1,a=4,b=3 gives1.
- `markoffPairMass_even_odd_test` (computation): q=4,a=4,b=3 gives5/4, not1.
- `markoffPairMass_odd_odd_test` (computation): q=32,a=3,b=5 gives93/64, consistent with valuation4.


**Uses:** Pair singular series: Controls the off-diagonal count.; Variance cancellation: The same finite pair mass is the common leading coefficient..

**Construction or proof route.** Specialize formNormalizedCount to the native quaternary polynomial with its nonzero, moving target.

**Direct prerequisites:** [Normalized polynomial-system residue mass](#es3-form-normalized-count).

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), (9.19),(9.22) p.30; (B.7) p.47. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es3-markoff-odd-local-density"></a>

### Odd-prime Markoff densities

Contract `ExponentialSumsAndCircleMethod:ES.3/markoff-odd-local-density` (theorem).

For odd prime p and k≠0,4, δ_{p^t}(k) converges. Write χ for the quadratic character modp, η_j(u)=1_{p^j|u}. Its increment N₁=χ(k−4)(3+χ(k))/p+1/p². For odd l≥3 the nonzero increments are4p^{−(l+1)/2}χ((k−4)/p^{l−1}) on p^{l−1}|k−4 and χ(−1)p^{−(l+1)/2}χ(k/p^{l−1}) on p^{l−1}|k. For even l≥2 they are−p^{−(l+2)/2}(4η_{l−1}(k−4)+η_{l−1}(k)) when p^{l−1} exactly divides k(k−4), and p^{−l/2}(1−1/p)(4η_l(k−4)+η_l(k)) when p^l divides that product; otherwise0. Thus the good-prime limit is1+N₁, p∥k gives1+3χ(−1)/p, and p∥k−4 gives1−3/p². At p=3 the limit vanishes exactly for k≡3,6 mod9. The χ(−1) sign is essential.

**Construction or proof route.** Use additive orthogonality to expand normalized counts into primitive frequency blocks. Evaluate the quadratic Gauss sums by FF.1; retain χ(−1) in the k-branch. Sum the resulting finite/geometric tails. For k≠0,4 their valuations are finite. The source omits parts of the block computation, recorded as a proof gap.

**Direct prerequisites:** [Markoff finite residue mass](#es3-markoff-residue-mass); `FiniteFieldsAndCharacterSums:FF.1`.

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), PropositionsB.1–B.2 pp.46–47, corrected reviewed E15–E16. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es3-markoff-two-adic-density"></a>

### Two-adic Markoff densities

Contract `ExponentialSumsAndCircleMethod:ES.3/markoff-two-adic-density` (theorem).

For k≠0,4 the sequence δ_{2^t}(k) converges, its limit is0 iff k≡3 mod4, and otherwise it is≥3/4. For odd k≡1 mod4 the value is(3/8)(1+χ₄(k))(2−χ₈(k)), hence3/4 in class1mod8 and9/4 in class5mod8. If2∥k the value is1. The other higher-valuation explicit cases are not imported from the erroneous printed table; only their convergence and positive lower bound are targets here.

**Construction or proof route.** Compute quadratic Gauss sums modulo2^l by their four/eight residue classes and decompose the Markoff complete sum into the resulting binary sums. Separate the initial l≤5 blocks from l≥6. Sum the tail for each finite valuation class; direct modulus8/16/32 checks distinguish the corrected odd factors.

**Direct prerequisites:** [Markoff finite residue mass](#es3-markoff-residue-mass); `FiniteFieldsAndCharacterSums:FF.1`.

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), LemmasB.7–B.10 and PropositionB.12 pp.48–50; reviewed E18 and warning on B.12(3)–(4). This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es3-markoff-pair-local-density"></a>

### Markoff pair local factors

Contract `ExponentialSumsAndCircleMethod:ES.3/markoff-pair-local-density` (theorem).

For a,b≥3,a≠b, δ_{p^t}(a,b) has a finite positive limit for every primep. At odd good primes p∤(a²−4)(b²−4)(a²−b²), it equals1−χ((a²−4)(b²−4))/p². If both discriminants are units and μ=v_p(a²−b²)≥1, it equals(1+1/p)(1−p^{−μ−1}); if exactly one discriminant is divisible it equals1+1/p. If η_i=v_p(a_i²−4)≥1 and η=minη_i, the three bad cases are: different valuations,1+η−(η−1)/p; equal valuationsη=μ,1+η−η/p−χ((a²−4)/p^η)χ((b²−4)/p^η)/p²; equalη<μ,1+η−(η−1)/p−p^{−(μ−η+1)}(1+1/p). At2, odd a,b with η=v₂(a²−b²) give(3/2)(1−2^{−η−1}); even a and odd b give5/4 when v₂(a²/4−1)=0 and3/2 when this valuation≥3. The even-even target is its bound δ₂=θ+O(1),θ=v₂(gcd(a²−4,b²−4)), and an absolute finite-level tail O(2^{−B}); the erroneous intermediate increment table is not used.

**Construction or proof route.** Complete the four-variable additive sum as a product of binary quadratic sums with the moving constant b²−a². Classify the discriminant valuations and sum the increment tails. For2 retain the initial blocks before invoking the tail. Good-prime O(p^{-2}) gives absolute convergence after the finitely many bad primes are excluded.

**Direct prerequisites:** [Quaternary Markoff pair mass](#es3-markoff-pair-mass); `FiniteFieldsAndCharacterSums:FF.1`.

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), PropositionsB.4–B.5 pp.47–48; B.14/CorollaryB.15 pp.51–53, corrected E17/E19. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es3-form-admissible"></a>

### Congruence admissibility

Contract `ExponentialSumsAndCircleMethod:ES.3/form-admissible` (definition).

An integral polynomial f in n variables and integerk are congruence-admissible when f(x)=k has a solution in(ℤ/qℤ)ⁿ for every positive integerq. CRT reduces this to prime powers. Compact inverse-limit compatibility identifies it with solubility over everyℤ_p; that identification requires a proof and is not encoded into the definition.

**API.**

- `formAdmissible_projection` (example): Coordinate projections are admissible for all targets.
- `formAdmissible_of_point` (relation): An integral point implies admissibility.
- `formAdmissible_prime_powers` (characterisation): Admissibility is equivalent to solubility at every prime power.
- `formAdmissible_target_congruence` (relation): Admissibility implies every single-modulus solubility condition.


**Named examples and contract tests.**

- `formAdmissible_projection_test` (computation): f=x₁,target2 is admissible.
- `formAdmissible_square_two_test` (non-example): f=x²,target2 is not admissible: no square is2mod4.
- `formAdmissible_square_one_test` (computation): f=x²,target1 is admissible.


**Uses:** Forms-in-many-variables endpoints: States the local hypothesis.; Perfect/almost-perfect/full forms: Restricts the target integers without assuming global points..

**Construction or proof route.** Use native MvPolynomial evaluation in native ZMod. Each prime-power tree is finitely branching; compactness/König’s lemma supplies a compatible path if every level is nonempty.

**Direct prerequisites:** `mathlib:MvPolynomial.eval₂`.

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), §1 p.1–2 and Proposition6.1 p.19; generic vocabulary. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es3-waring-refined-major-arcs"></a>

### Refined Waring major arcs

Contract `ExponentialSumsAndCircleMethod:ES.3/waring-refined-major-arcs` (theorem).

For k≥3 and s≥max(5,k+1), the preceding wider arcs M give ∫_M T_k(α)^s e(−mα)dα=Γ(1+1/k)^s/Γ(s/k) S_{s,k}(m)m^{s/k−1}+O_{k,s}(m^{s/k−1−δ}) for someδ>0, N=floor(m^{1/k}). This requires refined rational Gauss blocks and weighted singular-series tails; the elementary small-arc approximation alone does not prove it.

**Construction or proof route.** ApproximateT by q^{-1}S(a,q)v(β) with errorO(q^{1/2+ε}) on these arcs. Use the prime-power recursion and Gauss-sum expansion to bound A(p^l), its target-dependent vanishing, and Σ_{q≤Q}q^{1/k}|A(q)|≪(mQ)^ε. Enlarge the v-integral, control the tails and evaluate the same Gamma coefficient.

**Direct prerequisites:** [Complete monomial exponential sum](#es0-complete-power-sum); [Waring singular series](#es3-waring-singular-series); [Waring singular integral evaluation](#es3-waring-singular-integral-evaluation); `FiniteFieldsAndCharacterSums:FF.1`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), Lemma9.5 pp.89–91; Lemmas9.6–9.8 pp.92–94; Theorem9.9 pp.94–95. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es3-waring-linear-range-positivity"></a>

### Uniform Waring local positivity in the linear range

Contract `ExponentialSumsAndCircleMethod:ES.3/waring-linear-range-positivity` (theorem).

For degree k≥3, the singular series converges absolutely when s≥2k+1 and is bounded below by c(k,s)>0 uniformly in the positive targetm if s≥2k+1 for oddk or s≥4k for evenk. This is the local range used by the optimized endpoint, independent of the classical2^k+1 analytic range.

**Construction or proof route.** Construct a primitive solution at the finite lifting depth determined byv_p(k), including the extra2-adic depth; primitive lifts give a positive factor. The complete monomial bound yields an absolutely summable uniform good-prime error once s>2k. Multiply finite bad-prime minima and the positive good-prime product. The prime-power recursion is used only for degree≥3.

**Direct prerequisites:** [Primitive Waring local positivity](#es3-waring-primitive-local-positivity); [Complete monomial sum bound](#es0-complete-power-bound); [Waring singular-series Euler product](#es3-waring-series-euler-product).

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), Lemmas6.10–6.12 pp.41–44 and Theorem6.18 p.47. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es3-prime-major-arc-approximation"></a>

### Von Mangoldt major-arc approximation

Contract `ExponentialSumsAndCircleMethod:ES.3/prime-major-arc-approximation` (theorem).

For N≥3,1≤u≤v≤N,q≥1,gcd(a,q)=1,θ=a/q+ξ/q, one has Σ_{u≤n≤v}Λ(n)e(nθ)=μ(q)/φ(q)∫_u^v e(ξx/q)dx+O_A((q+N|ξ|)N(logN)^{-A}). The implied constant is ineffective. End-point changes of length≤1 are absorbed in the error. This analytic input is imported from the exact AN Siegel–Walfisz theorem and partial summation, not from VMV.

**Construction or proof route.** Split residue classes and discard nonunit classes using the fact that their nonzeroΛ terms are prime powers of primes dividingq. Apply theΛ-weighted interval Siegel–Walfisz adapter and partial summation to the remaining classes. Möbius inversion leaves theRamanujan factorμ(q)/φ(q); geometric-sum estimates control proper divisors.

**Direct prerequisites:** `AnalyticNumberTheory:AN.2/siegel-walfisz`; [Completion of finite sums](#es0-finite-completion); `AnalyticNumberTheory:AN.2`.

**Source:** [254A, Notes 8: The Hardy–Littlewood circle method](https://terrytao.wordpress.com/2015/03/22/254a-notes-8-the-hardy-littlewood-circle-method/), Proposition24 and complete proof §2. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es3-ternary-prime-singular-series"></a>

### Ternary prime singular series

Contract `ExponentialSumsAndCircleMethod:ES.3/ternary-prime-singular-series` (definition).

ternaryPrimeSeries(N) is the native product over primes of1−(p−1)^{-2} whenp|N, and1+(p−1)^{-3} otherwise; nonprimes contribute1. Prove multipliability before usingtprod. Thep=2 factor gives0 for evenN and2 for oddN. For oddN the product is uniformly bounded below by2∏_{p≥3}(1−(p−1)^{-2})>0.

**API.**

- `ternaryPrimeSeries_product` (structure): The displayed sequence over natural indices is multipliable.
- `ternaryPrimeSeries_even` (simp): Even targets have series0.
- `ternaryPrimeSeries_odd_lower` (relation): Odd targets have a positive uniform lower bound.
- `ternaryPrimeSeries_divisibility` (compatibility): The factor atp is selected byp|N.


**Named examples and contract tests.**

- `ternaryPrimeSeries_even_test` (non-example): N=8 has series0, so even targets cannot have the odd main term.
- `ternaryPrimeSeries_two_factor_test` (computation): Atp=2 the factors forN=7,8 are2,0.
- `ternaryPrimeSeries_three_factor_test` (computation): Atp=3 the factors forN=9,7 are3/4,9/8.


**Uses:** Vinogradov asymptotic: Supplies the exact Euler coefficient.; Odd three-prime existence: Provides the uniform positive lower bound..

**Construction or proof route.** The deviations are dominated by a convergentp^{-2} sum. For evenN isolate the zero2-factor; for oddN compare every factor with1−(p−1)^{-2}.

**Direct prerequisites:** `mathlib:MeasureTheory.integral`.

**Source:** [254A, Notes 8: The Hardy–Littlewood circle method](https://terrytao.wordpress.com/2015/03/22/254a-notes-8-the-hardy-littlewood-circle-method/), Theorem2, equation(1), and §3 Euler factors. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


### Required refinements for this layer

- Current maximal-lattice native import: Current IntegralLattices owns the maximal integral lattice and local splitting machinery; OrthogonalSpinGroups owns quadratic-space isometries. Identify their exact maximality/integral hyperbolic-plane theorem names at packaging. The rank≥5 splitting and uniform representation-product lower bound must be matched to them; the stabilizer-density target of IntegralLattices is not a representation density. Suggested omits the two maximal-lattice signatures until the supplier types are matched.
- Markoff corrected local tables and product-tail interface: The source omits parts of the Gauss-block derivations. Complete the odd χ(−1) correction, rederive erroneous higher2-adic explicit cases if needed beyond positivity, and prove the valuation-uniform even-even pair tail. Establish the product-aware finite-level comparison needed by the reciprocal estimate; summing individual O(p^{-B}) errors without controlling other factors is insufficient.
- Native Waring analytic transfer interfaces: Specify and locate the native bounded-variation sum–integral estimate, quantitative absolute-series and full-frequency integral tails, and simplex beta-convolution/sine-kernel inversion used by the selected complete §6 source proof. These are proof-to-library adapters, not premise fields assuming the desired asymptotic. Keep symmetric cutoffs and positive tuples.
- Quadratic two-adic source boundary: Assing Lemma6.16 is false for n=p=2,v=3 (E18); the complete-power-sum recursion and its later analytic consumers cannot cite the blanket range. Supply the corrected two-adic quadratic bases before using the improved degree-two singular-series proof. Finite-field Gauss inputs stay with FF.1; composite prime-power stationary phase is not claimed from a finite-field bound.
- Refined Waring Fourier/Gauss proof interfaces: Assing9.2–9.9 exact statements and full selected proofs are read. Remaining native proof interfaces are coefficient reconstruction with positive trapezoidal kernels; complete monomial prime-power Gauss blocks at bad primes; target-dependent weightedA(q) tails; and nonintegral radius/arc matching. No existing classical2^k+1 theorem supplies these optimized-range estimates.



## ES.4 — Minor arcs and Diophantine endpoints

This layer states each Diophantine endpoint separately, with its variable count, degree, weight and error. Prime weights have their own identity and bilinear route. Fixed quadratic forms, expanding boxes and moving Markoff pairs have different uniformity requirements. Affine-form predicates and Appendix A invariants have usable APIs; the unproved cubic claims remain an application boundary, not an asserted fullness theorem.

**Atlas planets:** Quadratic-form asymptotic; Almost-all Markoff representation; Optimized Waring asymptotic; Vinogradov three-prime theorem; Expanding-box quadratic count; Birch asymptotic.

**Coverage:** planned. The exact contracts follow; stage-specific refinements are listed after them.


<a id="es4-waring-positive-count"></a>

### Positive Waring representation count

Contract `ExponentialSumsAndCircleMethod:ES.4/waring-positive-count` (definition).

waringPositiveCount(d,s,m) is the native finite cardinality of ordered tuples x∈(Fin m)^s satisfyingΣ_i(x_i.val+1)^d=m. For d≥1 it counts all representations of m by s positive integral d-th powers: every positive coordinate of a solution is at most m. This is not the nonnegative-variable count and does not identify tuples up to permutations.

**Additional hypotheses:** d,s,m are natural. The interpretation as all positive representations requires d≥1. At s=0 the count is1 for m=0 and0 otherwise; at m=0,s>0 it is0..

**API.**

- `waringPositiveCount_eq_card` (characterisation): The count is the cardinality of the concrete ordered finite subtype.
- `waringPositiveCount_empty_tuple` (simp): At s=0 it is1 exactly at m=0.
- `waringPositiveCount_zero_target` (simp): At m=0,s>0 it is0.
- `waringPositiveCount_one_variable` (relation): For d≥1,s=1 it is1 iff m is a positive d-th power, and0 otherwise.
- `waringPositiveCount_cutoff` (compatibility): For d≥1 and m≤P^d, replacing Fin m by Fin P leaves the count unchanged.


**Named examples and contract tests.**

- `waringPositiveCount_linear_test` (computation): d=1,s=2,m=4 gives3.
- `waringPositiveCount_squares_test` (computation): d=2,s=2,m=5 gives2.
- `waringPositiveCount_empty_test` (degenerate): At s=0 targets0and1 give1and0 respectively.
- `waringPositiveCount_positive_test` (non-example): d=1,s=2,m=2 gives1, rather than the nonnegative count3.


**Uses:** Assing Theorem6.5; circle coefficient extraction: This is the exact integer count in the asymptotic and in the orthogonality identity..

**Construction or proof route.** Use the native finite tuple subtype and Fintype.card. For d≥1, positivity and x≤x^d bound each coordinate by m. The finite fibre equality gives the native bounded-tuple count without an artificial real cutoff.

**Direct prerequisites:** `mathlib:Fintype.card`; `mathlib:Finset.sum_mul_sum`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 pp.34–39, statements and full proofs, with E15–16 and E23–24 corrected. Positive variables, symmetric frequency truncations and strict arc-size constraints are retained. The degree-two local proof boundary is not silently imported.


<a id="es4-waring-counting-integral"></a>

### Waring counting identity

Contract `ExponentialSumsAndCircleMethod:ES.4/waring-counting-integral` (theorem).

For d≥1,m≤P^d, the integral over AddCircle1 of powerWeylSum(d,P,α)^s times fourier(−m)(α), with probability Haar measure, equals waringPositiveCount(d,s,m), cast to complex. The tuples are ordered and positive. Empty s=0 and m=0 are included with the native zero-th-power convention.

**Additional hypotheses:** The integer target uses the negative Fourier sign and native normalized Haar measure. There is no limiting passage in this finite identity..

**Construction or proof route.** Expand the finite product of sums and group each ordered tuple into the phaseΣx_i^d−m. Native coefficient extraction gives one for a zero frequency and zero otherwise. Since m≤P^d and d≥1, each coordinate of any positive solution is≤P; identify this finite count with the definition.

**Direct prerequisites:** [Monomial Weyl sum](#es1-monomial-weyl-sum); [Positive Waring representation count](#es4-waring-positive-count); [Torus coefficient-counting identity](#es1-torus-coefficient-extraction); `mathlib:fourier_add`; `mathlib:fourierCoeff_fourier`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 pp.34–39, statements and full proofs, with E15–16 and E23–24 corrected. Positive variables, symmetric frequency truncations and strict arc-size constraints are retained. The degree-two local proof boundary is not silently imported.


<a id="es4-waring-classical-minor-arcs"></a>

### Classical Waring minor-arc estimate

Contract `ExponentialSumsAndCircleMethod:ES.4/waring-classical-minor-arcs` (theorem).

Let d≥3,s≥2^d+1 and0<δ<1/10. Put Q=floor(P^δ),η=P^{−d+δ}. There is C(d,s,δ)>0 such that for every integer P≥2, ∫_{minorArcs(Q,η)}|powerWeylSum(d,P,α)|^s dα≤CP^{s−d−δ/2^d}. The measure is probability Haar on AddCircle1.

**Additional hypotheses:** The radii and denominator cutoff are explicit. Strict separation holds for sufficiently large P because3δ<d; small P are absorbed in C..

**Construction or proof route.** Dirichlet approximation provides q≤P^{d−δ}; outside the major arcs q>P^δ. Apply the polynomial Weyl bound to get a supremum P^{1−δ/2^{d−1}+ε}. Apply Hua at exponent2^d and multiply by the supremum to power s−2^d. Choose ε=δ/((s+1−2^d)2^d), giving a saving at least δ/2^d. Constant dependencies do not include P.

**Direct prerequisites:** [Monomial Weyl sum](#es1-monomial-weyl-sum); [Minor arcs](#es1-minor-arcs); [Polynomial Weyl inequality](#es0-polynomial-weyl-inequality); [Hua mean-value inequality](#es2-hua-mean-value); `mathlib:Nat.floor`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), Lemma6.1 and proof pp.34–35. Correct positive-sum convention, explicit degree/variable range and the source proof’s positive saving are retained.


<a id="es4-waring-classical-asymptotic"></a>

### Classical Waring asymptotic

Contract `ExponentialSumsAndCircleMethod:ES.4/waring-classical-asymptotic` (theorem).

For integers d≥3 and s≥2^d+1 there exist σ(d,s)>0,C(d,s)>0 and M₀ such that for every m≥M₀, |r^+_{d,s}(m)−[Γ(1+1/d)^s/Γ(s/d)] ReS_{d,s}(m)m^{s/d−1}|≤Cm^{s/d−1−σ}. Here r^+ is the concrete ordered positive representation count. The source asserts a positive saving; no numerical optimized exponent is claimed.

**Additional hypotheses:** The Gamma factor uses the positive-variable archimedean normalization. σ,C,M₀ are independent of m; this is not a theorem about arbitrary forms or prime variables..

**Construction or proof route.** Use P=ceil(m^{1/d}), choose0<δ<1/10, and split the exact finite counting integral over disjoint major arcs and their complement for large P. The classical minor-arc theorem gives a power-saving error. Use the major-arc approximation and binomial expansion; the total local error is O(P^{s−d−1+5δ}). Replace the truncated series by its absolutely convergent value, and the symmetric truncated singular integral by its Gamma evaluation. Polynomial complete-sum bounds control both tails. Replace P^d by m using the actual source phase estimate corrected in E24. Take a positive minimum of the errors’ savings and convert P-powers to m-powers. The native dominated-convergence, quadrature and beta-inversion interfaces are explicitly recorded frontiers.

**Direct prerequisites:** [Positive Waring representation count](#es4-waring-positive-count); [Waring counting identity](#es4-waring-counting-integral); [Classical Waring minor-arc estimate](#es4-waring-classical-minor-arcs); [Monomial major-arc approximation](#es3-waring-major-arc-approximation); [Major–minor arc counting partition](#es1-major-minor-counting-partition); [Waring singular integral evaluation](#es3-waring-singular-integral-evaluation); [Waring singular-series absolute convergence](#es3-waring-series-absolute-convergence).

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 pp.34–39, statements and full proofs, with E15–16 and E23–24 corrected. Positive variables, symmetric frequency truncations and strict arc-size constraints are retained. The degree-two local proof boundary is not silently imported.


<a id="es4-waring-eventual-representation"></a>

### Eventual positive Waring representation

Contract `ExponentialSumsAndCircleMethod:ES.4/waring-eventual-representation` (theorem).

For d≥3,s≥2^d+1 there exists M₀ such that every integer m≥M₀ is a sum of s positive d-th powers. The conclusion is existence of an ordered tuple, not an asymptotic for an arbitrary locally soluble Diophantine problem.

**Additional hypotheses:** The theorem uses the uniform strictly positive singular series and the Gamma factor in this particular classical range..

**Construction or proof route.** The Gamma constant and uniform singular-series lower bound make the main term positive. Increase M₀ until the relative error Cm^{−σ} is less than half the lower main-term constant. The positive integer finite count gives a tuple.

**Direct prerequisites:** [Classical Waring asymptotic](#es4-waring-classical-asymptotic); [Uniform Waring singular-series positivity](#es3-waring-uniform-series-positivity); `mathlib:Real.Gamma_pos_of_pos`; `mathlib:Fintype.card`.

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), §6.1 pp.34–39, statements and full proofs, with E15–16 and E23–24 corrected. Positive variables, symmetric frequency truncations and strict arc-size constraints are retained. The degree-two local proof boundary is not silently imported.


<a id="es4-weighted-quadratic-count"></a>

### Weighted integral quadratic representation count

Contract `ExponentialSumsAndCircleMethod:ES.4/weighted-quadratic-count` (definition).

For integral polynomial Q of degree2,targetm>0,real compactly supported weightw, weightedQuadraticCount is Σ_{x∈ℤⁿ,Q(x)=m}w(x/√m). The native tsum has finite support after compact support and m>0 are proved. Weight, equation and target are inputs; no replacement lattice or theta series is defined.

**API.**

- `weightedQuadraticCount_zero_weight` (simp): Zero weight gives0.
- `weightedQuadraticCount_add` (relation): Add compact weights at m>0.
- `weightedQuadraticCount_smul` (relation): Scalar multiplication scales the count.
- `weightedQuadraticCount_finite_support` (structure): Compact support and m>0 make the summand finitely supported.
- `weightedQuadraticCount_unary_square` (example): For Q=x²,m=1 the count is w(1)+w(−1).


**Named examples and contract tests.**

- `weightedQuadraticCount_unary_test` (computation): Q=x²,m=1,w=1_[−2,2] gives2.
- `weightedQuadraticCount_zero_test` (degenerate): Zero weight gives0 for every Q,m.
- `weightedQuadraticCount_scale_test` (computation): Q=x²,m=4,w=1_[−3/2,3/2] gives2 since the arguments are±1, not±2.


**Uses:** Heath–Brown weighted theorem: Its main term and error use this√m scaling.; SSTT lattice consumers: Weights can be pulled back through a fixed rational basis change..

**Construction or proof route.** Use the native integer coordinate lattice and finite-support tsum, scaling by√m exactly.

**Direct prerequisites:** [Weighted real fiber density](#es3-weighted-real-density); `mathlib:MvPolynomial.eval₂`.

**Source:** [Reductions of K3 surfaces and abelian varieties](https://web.math.princeton.edu/~yunqingt/ArithGSpin.pdf), §4.2 pp.19–20, w_m and weighted count before Theorem4.9. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-heath-brown-quadratic-asymptotic"></a>

### Weighted quadratic-form asymptotic

Contract `ExponentialSumsAndCircleMethod:ES.4/heath-brown-quadratic-asymptotic` (theorem).

Fix a nondegenerate integral quadratic form Q in n≥5 variables and w∈C∞_c(ℝⁿ). For every ε>0 and all integers m≥1, the representation Euler product converges and weightedQuadraticCount(Q,m,w)=μ∞(Q−1,w)m^{n/2−1}∏_pμ_p(Q,m)+O_{Q,w,ε}(m^{(n−1)/4+ε}). The constant is uniform in m, not in the coefficients of Q or arbitrary basis changes. A bounded family of derivative seminorms supplies the standard weight-class uniformity.

**Construction or proof route.** Apply the quadratic δ-method to the√m-scaled compact weight. Separate the zero dual frequency, whose main term is the real density times the representation Euler product. Estimate nonzero frequencies by Kloosterman-type sums and oscillatory integrals; the complete external HB proof and its precise product convergence remain an explicit acquisition/interface gap. Real regularity follows because Q is nondegenerate and Q=1 avoids the critical point0.

**Direct prerequisites:** [Weighted integral quadratic representation count](#es4-weighted-quadratic-count); [Quadratic density stabilization](#es3-quadratic-local-stability); [Weighted real fiber density](#es3-weighted-real-density).

**Source:** [Reductions of K3 surfaces and abelian varieties](https://web.math.princeton.edu/~yunqingt/ArithGSpin.pdf), Theorem4.9 and Corollary4.10 p.20, citing Heath–Brown1996 Theorem4/Corollary2. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-maximal-lattice-eventual-representation"></a>

### Eventual representation by maximal lattices

Contract `ExponentialSumsAndCircleMethod:ES.4/maximal-lattice-eventual-representation` (theorem).

A fixed maximal integral nondegenerate quadratic lattice of rankn≥5 whose real quadratic form represents1 represents every sufficiently large positive integer. The threshold depends on the lattice. Choose a nonnegative smooth compact weight with positive real density; the main term exponent n/2−1 exceeds the error exponent(n−1)/4.

**Construction or proof route.** Choose a real regular point Q(x)=1 and a positive compact smooth neighborhood weight. Apply the uniform representation-product lower bound and choose ε<(n−3)/4 to dominate the error. A positive weighted count gives an integer representation.

**Direct prerequisites:** [Maximal-lattice local positivity](#es3-maximal-lattice-local-positivity); [Weighted quadratic-form asymptotic](#es4-heath-brown-quadratic-asymptotic).

**Source:** [Reductions of K3 surfaces and abelian varieties](https://web.math.princeton.edu/~yunqingt/ArithGSpin.pdf), Corollary4.7 p.18 and its proof from the weighted asymptotic. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-markoff-sector"></a>

### Markoff moving-plane sector

Contract `ExponentialSumsAndCircleMethod:ES.4/markoff-sector` (definition).

For d>0 let S_d⊂ℝ² consist of s₁,s₂≥0 with 0≤s₁²−ds₂²≤1 and 2√d s₂≤s₁≤3√d s₂. It is a compact sector of area C/√d, C=¼log(3/2). Under s₁=2x₁+ax₂,s₂=x₂, d=a²−4, the original x-region has half this area. The transformed integral lattice satisfies s₁−as₂≡0 mod2, including even a.

**API.**

- `markoffSector_mem` (characterisation): Membership is exactly the four displayed inequalities.
- `markoffSector_volume` (characterisation): For d>0 its area is C/√d.
- `markoffSector_compact` (structure): S_d is compact for d>0.
- `markoffSector_origin` (simp): The origin belongs to S_d.


**Named examples and contract tests.**

- `markoffSector_origin_test` (degenerate): (0,0)∈S₁.
- `markoffSector_outer_test` (non-example): (2,1)∉S₁ because s₁²−s₂²=3>1.
- `markoffSector_interior_test` (computation): (1/2,1/4)∈S₁.


**Uses:** ES.4 Markoff variance: Retains the tentacled geometry rather than a square box.; Real pair density: Fixes the Jacobian and factor2..

**Construction or proof route.** Use the native Euclidean plane. In the coordinates u=s₁/(√d s₂), the sector is 2≤u≤3, 0≤s₂≤1/√(d(u²−1)); integrate its Jacobian. The linear transformation has determinant2. Its image lattice is exactly s₁−as₂ even; replacing a by1 is valid only when a is odd.

**Direct prerequisites:** `mathlib:MeasureTheory.integral`.

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), (9.1)–(9.4), pp.25–26; parity corrected as in reviewed source issue E14. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-markoff-representation-count"></a>

### Sector-restricted Markoff count

Contract `ExponentialSumsAndCircleMethod:ES.4/markoff-representation-count` (definition).

For integers a≥3, K≥1 and 1≤k≤K let r_a(K,k) count integral x₁,x₂≥0 with x₁²+x₂²+ax₁x₂+a²=k and (2x₁+ax₂,x₂)∈√(4K)S_{a²−4}. Implement it as the finite count in 0≤x_i≤2K and extend it by0 outside 1≤k≤K. The finite bounds lose no point of this sector. A point counted gives an integral point of the plus-sign Markoff form, conjugate to the usual minus-sign form by changing one coordinate sign.

**API.**

- `markoffRepresentationCount_outside` (simp): The count is0 unless 1≤k≤K.
- `markoffRepresentationCount_eq_sector` (characterisation): For a≥3 the finite rectangle equals the sector fiber.
- `markoffRepresentationCount_le` (relation): The count is at most(2K+1)².
- `markoffRepresentationCount_point` (relation): A positive count supplies a Markoff integral point.


**Named examples and contract tests.**

- `markoffRepresentationCount_basic_test` (computation): a=3,K=k=14 gives1, from(1,1).
- `markoffRepresentationCount_outside_test` (boundary): a=3,K=13,k=14 gives0.
- `markoffRepresentationCount_even_test` (computation): a=4,K=k=29 gives1, from(2,1); the even-a parity convention is retained.


**Uses:** Aggregate moving planes: Sums the fixed-coordinate slices.; Variance diagonal and pair terms: Defines the quantities whose second moments are estimated..

**Construction or proof route.** Express the transformed sector inequalities directly in the original integer coordinates. The equation and 1≤k≤K imply the radial inequality. The positive sector ratio bounds each original coordinate by2K. Use a finite native integer/natural rectangle, not an assumed finite fiber of an indefinite quadratic form.

**Direct prerequisites:** [Markoff moving-plane sector](#es4-markoff-sector); `mathlib:Fintype.card`.

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), (9.1)–(9.4) pp.25–26. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-markoff-aggregate"></a>

### Moving-plane aggregate

Contract `ExponentialSumsAndCircleMethod:ES.4/markoff-aggregate` (definition).

For integers A,K≥0, b_A(K,k)=Σ_{3≤a≤A,√A≤a}r_a(K,k). The lower bound3 ensures nondegenerate binary sectors; it is automatic in the asymptotic parameter range. Its support is 1≤k≤K.

**API.**

- `markoffAggregate_zero` (simp): A<3 gives0.
- `markoffAggregate_outside` (simp): Outside1≤k≤K the aggregate is0.
- `markoffAggregate_positive_iff` (characterisation): It is positive iff some allowed slice count is positive.
- `markoffAggregate_sum` (relation): Exchange the finite sums over a and k.


**Named examples and contract tests.**

- `markoffAggregate_small_test` (degenerate): A=2 gives0 for all K,k.
- `markoffAggregate_basic_test` (computation): A=3,K=k=14 gives1.
- `markoffAggregate_outside_test` (boundary): K=0 gives0.


**Uses:** Markoff almost-all theorem: Positivity implies representation.; Variance: Its expected value is compared to a local mass..

**Construction or proof route.** Use the finite interval filtered by the real inequality√A≤a. All slice counts are nonnegative integers.

**Direct prerequisites:** [Sector-restricted Markoff count](#es4-markoff-representation-count).

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), (9.4), pp.26–27. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-markoff-variance"></a>

### Moving-plane variance

Contract `ExponentialSumsAndCircleMethod:ES.4/markoff-variance` (definition).

For K,A≥0,q≥1 and real c, V(K,A,q,c)=Σ_{1≤k≤K}(b_A(K,k)−c(log A)δ_q(k))². The endpoint uses c=C=¼log(3/2) and the prescribed slowly growing modulus. The square is taken after casting the count to ℝ.

**API.**

- `markoffVariance_nonneg` (relation): Every variance is nonnegative.
- `markoffVariance_zero_length` (simp): K=0 gives0.
- `markoffVariance_expand` (characterisation): It equals Σb²−2c logAΣbδ+c²log²AΣδ².
- `markoffVariance_zero_iff` (characterisation): It vanishes iff all K summands vanish.


**Named examples and contract tests.**

- `markoffVariance_empty_test` (degenerate): K=0 gives0.
- `markoffVariance_log_zero_test` (boundary): A=1 gives0, since no slice occurs and log1=0.
- `markoffVariance_basic_test` (computation): K=1,A=3,q=1,c=1 gives(log3)².


**Uses:** Proposition9.6: The main coefficients1,−2,1 cancel.; Chebyshev transfer: Bounds the exceptional set of unrepresented integers..

**Construction or proof route.** Expand the finite square and exchange the k,a sums. This gives the diagonal slice energy, off-diagonal pair correlations, cross term and local-mass square.

**Direct prerequisites:** [Moving-plane aggregate](#es4-markoff-aggregate); [Markoff finite residue mass](#es3-markoff-residue-mass); [Quaternary Markoff pair mass](#es3-markoff-pair-mass).

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), (9.8)–(9.15), pp.28–29. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-markoff-sector-first-moment"></a>

### Sector counts and their first moment

Contract `ExponentialSumsAndCircleMethod:ES.4/markoff-sector-first-moment` (theorem).

Let ε>0, 3≤a≤A, √A≤a, (log K)²<A≤K^ε with ε sufficiently small. Uniformly in a, residue class α modm and the slowly growing m of the variance theorem, the sector count in that class equals2CK/(√(a²−4)m²)+O_ε(K^{3/4+ε}). The unrestricted slice count is2CK/√(a²−4)+O_ε(K^{1/2+ε}). Summing slices givesΣ_{k≤K}b_A(K,k)=CK logA+O(KA^{-1/2}+A K^{1/2+ε}). The latter error is absorbed in the stated parameter regime after shrinking ε. The printed unrestricted harmonic-sum error KA^{-1} is corrected to KA^{-1/2}.

**Construction or proof route.** Count each lattice coset in the transformed sector by summing one coordinate, respecting s₁−as₂ parity. Split near the curved boundary and use the elementary divisor bound. Sum1/√(a²−4) over a∈[√A,A]; its leading term is½logA and its endpoint discretization error isO(A^{-1/2}).

**Direct prerequisites:** [Moving-plane aggregate](#es4-markoff-aggregate); [Markoff moving-plane sector](#es4-markoff-sector).

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), Lemmas9.2–9.4 pp.26–28. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-markoff-diagonal-energy"></a>

### Markoff diagonal second moment

Contract `ExponentialSumsAndCircleMethod:ES.4/markoff-diagonal-energy` (theorem).

In the same K,A range, Σ_{√A≤a≤A}Σ_{1≤k≤K}r_a(K,k)²≤C K logA with an absolute constant for sufficiently largeK. The input binary estimate isΣ_{k≤K}R_d(k)²≪K/√d+K logK τ(d)/d.

**Construction or proof route.** Group equal values of the binary quadratic form and apply the imported uniform binary representation bound. Sum the discriminant-divisor factor over a, using A>(logK)² to absorb the diagonal remainder. The external binary bound is a named supplier, not a consequence of positive-definite box counting.

**Direct prerequisites:** [Sector-restricted Markoff count](#es4-markoff-representation-count).

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), Lemma9.5 p.29, using Blomer–Granville Theorem2. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-markoff-pair-asymptotic"></a>

### Uniform moving quaternary asymptotic

Contract `ExponentialSumsAndCircleMethod:ES.4/markoff-pair-asymptotic` (theorem).

There exist ε₀,ε₁>0 such that for(logK)²<A≤K^{ε₁} and distinct a,b∈[√A,A], Σ_{1≤k≤K}r_a(K,k)r_b(K,k)=δ∞^{(K)}(a,b)∏_pδ_p(a,b)+O(K^{1−ε₀}), uniformly in a,b. Here δ∞ is the symmetric-tube density with factor(2ε)^{-1} on the two original-coordinate sectors, and the equation is g_a(x)−g_b(y)=b²−a². Its real factor is(4C²K/(ab))(1+O(A^{-1})). This is a four-variable, moving-coefficient, nonzero-target theorem; the fixed n≥5 quadratic theorem does not provide it.

**Construction or proof route.** Smooth the sector boundaries with explicit thickness and derivative budgets, apply the weighted δ-method uniformly in the changing discriminants and nonzero target, then remove smoothing. Compute the real coarea integral using the sector parametrization. The Fourier delta convention corresponds to(2ε)^{-1}, correcting the printed ε^{-1}. The external δ-method theorem and the sharp-boundary/uniformity deduction remain a precise source/interface gap.

**Direct prerequisites:** [Weighted real fiber density](#es3-weighted-real-density); [Markoff pair local factors](#es3-markoff-pair-local-density); [Sector-restricted Markoff count](#es4-markoff-representation-count).

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), (9.17)–(9.21), pp.29–30. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-markoff-pair-truncation"></a>

### Weighted truncation of Markoff pair series

Contract `ExponentialSumsAndCircleMethod:ES.4/markoff-pair-truncation` (theorem).

Let Φ(A)=½√(loglogA/logloglogA), L=floor((logA/loglogA)Φ(A)), B=floor(loglogA/Φ(A)²), and m=∏_{p≤L}p^B, for A sufficiently large. In the parameter range of the pair theorem, replacing the pair Euler product by δ_m(a,b) in the weighted sum over distinct a,b costs O((logA)²/Φ(A)). More precisely pairs with gcd(a²−4,b²−4) containing a prime>L or an exponent≥B contribute O((logA)²min(L,2^B)^{-1/2}); the other tails contribute O((logA)²/Φ(A)). Constants are absolute; the finite-prime factors are not silently bounded uniformly in the bad discriminant valuations.

**Construction or proof route.** Split pairs by the prime-power content of their common discriminant. Estimate bad pairs by divisor counting and the local growth bound. For good pairs, the number of remaining bad primes isO(logA/loglogA); summing1/p for p>L givesO(Φ^{-1}), while the good-prime p^{-2} tail isO(L^{-1}). Use CRT to identify the finite product at p^B with δ_m. Expand the harmonic a,b weights and preserve the total error.

**Direct prerequisites:** [Markoff pair local factors](#es3-markoff-pair-local-density); [Quaternary Markoff pair mass](#es3-markoff-pair-mass).

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), (9.23)–(9.29), pp.30–32. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-markoff-variance-bound"></a>

### Markoff variance bound

Contract `ExponentialSumsAndCircleMethod:ES.4/markoff-variance-bound` (theorem).

With C=¼log(3/2), Φ,L,B,m as above and(logK)²<A≤K^{ε₁} for sufficiently small fixedε₁, V(K,A,m,C)≤C₁ K(logA)²/Φ(A) for all sufficiently largeK. The choice Φ tends to∞ and satisfies Φ²≪2^B=o(L); the rounded integers leave the bound unchanged up to fixed constants.

**Construction or proof route.** Expand V. The local square term and cross term use periodicity, the residue-class sector count, and CRT. The diagonal isO(KlogA); the off-diagonal uses the uniform pair asymptotic and weighted truncation. Their common finite pair-mass main term has coefficients1,−2,1 and cancels. Choose ε₁ small compared with ε₀ so A²K^{1−ε₀} and all smoothing/residue errors fit the displayed remainder.

**Direct prerequisites:** [Moving-plane variance](#es4-markoff-variance); [Sector counts and their first moment](#es4-markoff-sector-first-moment); [Markoff diagonal second moment](#es4-markoff-diagonal-energy); [Uniform moving quaternary asymptotic](#es4-markoff-pair-asymptotic); [Weighted truncation of Markoff pair series](#es4-markoff-pair-truncation).

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), Proposition9.6 and(9.9)–(9.29), pp.28–32. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-markoff-reciprocal-mass"></a>

### Reciprocal Markoff mass estimate

Contract `ExponentialSumsAndCircleMethod:ES.4/markoff-reciprocal-mass` (theorem).

For the same slowly growing m and admissible integers1≤k≤K (k≢3mod4 and k≢3,6mod9), Σ_k1/δ_m(k)≤C₂K for sufficiently largeK. Consequently #{admissiblek≤K:δ_m(k)<ε}≤C₂εK for everyε>0. The admissibility characterization is imported from the Markoff arithmetic owner.

**Construction or proof route.** Use the corrected2/3-adic lower bounds and the odd-prime expansionA(k,p)=χ(k−4)(3+χ(k)); its complete average is−1. Expand reciprocals into squarefree multiplicative terms, separating the convergent p^{-2} remainder, and average over k modulo their product. Quantify the finite-modulus error using m=K^{o(1)}. The claimed uniform product-tailO(2^{-B}) in(9.31) needs a relative/product-aware estimate; it is explicitly a refinement gap rather than inferred from adding individual tails.

**Direct prerequisites:** [Odd-prime Markoff densities](#es3-markoff-odd-local-density); [Two-adic Markoff densities](#es3-markoff-two-adic-density); [Markoff finite residue mass](#es3-markoff-residue-mass).

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), (9.31)–(9.36), pp.32–33. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-markoff-almost-all-representation"></a>

### Almost-all Markoff representation

Contract `ExponentialSumsAndCircleMethod:ES.4/markoff-almost-all-representation` (theorem).

As K→∞, the number of admissible integers k with|k|≤K having no integral point on x₁²+x₂²+x₃²−x₁x₂x₃=k is o(K). For almost all admissible k its integral points are Zariski dense. The first assertion is an analytic representation endpoint; the second imports the Markoff orbit-density theorem. The negative-k proof uses its own sector with ratios1/3 and1/2, not the positive sector unchanged.

**Construction or proof route.** Split the admissible k into masses<ε and masses≥ε. The reciprocal estimate bounds the first set byO(εK). If b_A(k)=0 in the second set, each variance summand is≥C²(logA)²ε², so the second set has sizeO(K/(Φ ε²)). First takeK→∞, thenε→0. Repeat the construction for negativek with the distinct sector constants and transformations. Finally apply the imported generic-orbit Zariski-density result; it is not proved by the scalar count alone.

**Direct prerequisites:** [Markoff variance bound](#es4-markoff-variance-bound); [Reciprocal Markoff mass estimate](#es4-markoff-reciprocal-mass).

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), Theorem1.2(ii) p.5; §9.1 pp.32–34; Remark9.1 p.26. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-markoff-orbit-growth"></a>

### Generic Markoff class-number growth

Contract `ExponentialSumsAndCircleMethod:ES.4/markoff-orbit-growth` (theorem).

For every fixed t≥0, the number of generic integersk with0<|k|≤K and Markoff orbit count h_M(k)=t is o(K). Thus h_M(k)→∞ along a density-one subset of the generic admissible integers. This requires the imported orbit/fundamental-set theorem in addition to the variance argument.

**Construction or proof route.** Use the variance proof to obtain increasingly many moving-plane representations outside a density-zero exceptional set. The orbit fundamental-set theorem controls how many such points can lie in a fixed number of generic orbits. The analytic count alone gives neither the orbit count nor this comparison.

**Direct prerequisites:** [Almost-all Markoff representation](#es4-markoff-almost-all-representation).

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), End of§9 p.34 and Theorem1.1 pp.3–5. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-form-zariski-dense"></a>

### Algebraic density of integral fibers

Contract `ExponentialSumsAndCircleMethod:ES.4/form-zariski-dense` (definition).

For an integral polynomialf and targetk, formZariskiDense means that every polynomialg over an algebraic closure ofℚ vanishing on all embedded integral solutions f(x)=k also vanishes on the entire geometric fiber. This is the polynomial-vanishing characterization of Zariski density; it uses no analytic topology on the coefficient field.

**API.**

- `formZariskiDense_iff` (characterisation): The value is exactly the stated polynomial-vanishing criterion.
- `formZariskiDense_projection` (example): A coordinate fiber has dense integral points.
- `formZariskiDense_no_integer_point` (relation): An empty integral fiber with a nonempty geometric fiber is not dense.
- `formZariskiDense_affine_equiv` (compatibility): An invertible integral affine change preserves density.


**Named examples and contract tests.**

- `formZariskiDense_projection_test` (computation): The line x₁=2 in two variables has dense integral points.
- `formZariskiDense_square_one_test` (computation): The two-point fiber x²=1 is entirely integral and is dense.
- `formZariskiDense_square_two_test` (non-example): x²=2 has geometric points and no integral points, so is not dense.


**Uses:** Perfect forms: Separates representation from geometric density.; Markoff arithmetic interface: Allows the imported orbit theorem to supply the stronger conclusion..

**Construction or proof route.** Use the native algebraic closure and evaluate the integral equation after the canonical coefficient map. The vanishing criterion is invariant under integral affine coordinate equivalences.

**Direct prerequisites:** `mathlib:MvPolynomial.eval₂`.

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), §1 pp.1–2, density in the definition of perfectness. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-form-perfect"></a>

### Perfect affine polynomial

Contract `ExponentialSumsAndCircleMethod:ES.4/form-perfect` (definition).

An integral polynomialf is perfect when only finitely many admissible integersk have a fiber whose integral points are not Zariski dense. This is a predicate on the native polynomial; geometric irreducibility and essential dependence on all variables are separate hypotheses when invoking results about affine forms.

**API.**

- `formPerfect_iff` (characterisation): Only finitely many admissible fibers fail density.
- `formPerfect_of_all_dense` (relation): Density for every admissible target implies perfectness.
- `formPerfect_projection` (example): Coordinate projections are perfect.
- `formPerfect_implies_almost` (relation): Perfectness implies almost-perfectness when the admissible target counts tend to∞.


**Named examples and contract tests.**

- `formPerfect_projection_test` (computation): f=x₁ in two variables is perfect.
- `formPerfect_identity_test` (computation): f=x in one variable is perfect, even though its fibers each have only one point.
- `formPerfect_constant_test` (degenerate): f=0 is perfect: its sole admissible target0 has a dense integer lattice.


**Uses:** Routed affine-form vocabulary: Keeps perfectness distinct from growing numbers of points.; Conditional moving-plane claims: Their geometric hypotheses are explicit..

**Construction or proof route.** Take finiteness of the set of admissible non-dense targets, using the two preceding native predicates.

**Direct prerequisites:** [Congruence admissibility](#es3-form-admissible); [Algebraic density of integral fibers](#es4-form-zariski-dense).

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), §1 pp.1–2. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-form-almost-perfect"></a>

### Almost-perfect affine polynomial

Contract `ExponentialSumsAndCircleMethod:ES.4/form-almost-perfect` (definition).

An integral polynomialf is almost perfect when, in the symmetric interval|k|≤K, the proportion of admissible targets failing integral-point Zariski density tends to0. The denominator is the number of admissible targets, not2K+1. When admissibility has positive natural density, this is equivalent to an absolute o(K) exceptional count.

**API.**

- `formAlmostPerfect_iff` (characterisation): The relative admissible exceptional ratio tends to0.
- `formAlmostPerfect_of_all_dense` (relation): If all admissible fibers are dense, it holds.
- `formAlmostPerfect_projection` (example): Coordinate projections are almost perfect.
- `formAlmostPerfect_absolute` (compatibility): With a positive-density admissible set, it is equivalent to an absolute o(K) count.


**Named examples and contract tests.**

- `formAlmostPerfect_projection_test` (computation): f=x₁ in two variables is almost perfect.
- `formAlmostPerfect_identity_test` (computation): f=x is almost perfect.
- `formAlmostPerfect_constant_test` (degenerate): f=0 is almost perfect: the admissible denominator is1, not divergent, and the numerator is0.


**Uses:** Markoff endpoint: Its explicit admissible congruences have positive density.; Generic forms endpoint: Does not turn a zero-density admissible set into a trivial theorem..

**Construction or proof route.** Use finite integer intervals and native Tendsto of a real ratio. Prove the denominator comparison separately for any application.

**Direct prerequisites:** [Algebraic density of integral fibers](#es4-form-zariski-dense); [Congruence admissibility](#es3-form-admissible).

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), §1 pp.1–2 and Theorem1.2(ii). This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-form-full"></a>

### Full affine polynomial

Contract `ExponentialSumsAndCircleMethod:ES.4/form-full` (definition).

An integral polynomialf is full when for every naturalT the proportion of admissible|k|≤K with fewer thanT distinct integral representations tends to0. Express at leastT representations by a finite set of integral points of cardinality≥T; this correctly includes infinite fibers and avoids Nat.card’s value0 on infinite types.

**API.**

- `formFull_iff` (characterisation): Every fixed finite point-count threshold has a density-zero exceptional set.
- `formFull_of_infinite_fibers` (relation): Infinite fibers at all admissible targets imply fullness.
- `formFull_projection` (example): A coordinate projection in dimension≥2 is full.
- `formFull_not_identity` (example): The one-variable identity is not full, since each target has exactly one point.


**Named examples and contract tests.**

- `formFull_plane_projection_test` (computation): f=x₁ in two variables is full.
- `formFull_identity_test` (non-example): f=x in one variable is not full, although it is perfect.
- `formFull_constant_test` (degenerate): f=0 in one variable is full: target0 has infinitely many points.


**Uses:** Deferred cubic fullness claims: States their conclusion without asserting the conjecture.; Moving-plane/orbit growth: A scalar representation theorem alone does not imply fullness..

**Construction or proof route.** Use native finite sets of integer coordinate tuples and relative exceptional ratios. No finite cardinality is assigned to an unbounded fiber.

**Direct prerequisites:** [Congruence admissibility](#es3-form-admissible).

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), §1 pp.1–2 and fullness claims pp.7–8. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-cubic-h-invariant"></a>

### Cubic h-invariant

Contract `ExponentialSumsAndCircleMethod:ES.4/cubic-h-invariant` (definition).

For a rational homogeneous cubicF, h(F) is the least number of products L_iQ_i whose sum isF, where L_i are homogeneous linear and Q_i homogeneous quadratic polynomials overℚ. For F=0 takeh=0. The decomposition always exists by grouping monomials, and h≤n. Equivalently n−h is the maximal dimension of a rational linear subspace on whichF vanishes. This is a property of the leading homogeneous cubic, not of lower-degree terms.

**API.**

- `cubicHInvariant_zero` (simp): The zero cubic has h=0.
- `cubicHInvariant_le` (relation): A homogeneous cubic in n variables has h≤n.
- `cubicHInvariant_le_iff` (characterisation): h≤r iff there is a decomposition with r products, allowing zero summands.
- `cubicHInvariant_one_iff` (characterisation): A nonzero homogeneous cubic has h=1 iff it has a rational linear factor.
- `cubicHInvariant_linear_equiv` (compatibility): Invertible rational linear substitution preserves h.


**Named examples and contract tests.**

- `cubicHInvariant_zero_test` (degenerate): The zero cubic in three variables has h=0.
- `cubicHInvariant_product_test` (computation): X₁X₂X₃ has h=1.
- `cubicHInvariant_two_cubes_test` (computation): X₁³+X₂³ has h=1, using(X₁+X₂)(X₁²−X₁X₂+X₂²), rather than counting variables.


**Uses:** Forms-in-many-variables vocabulary: Measures the rational linear spaces of the leading cubic.; Conditional fullness branch: Carries the precise h=1 hypothesis..

**Construction or proof route.** Use native homogeneous MvPolynomial and the infimum of the nonempty set of allowed decomposition lengths. A decomposition gives a vanishing subspace. Conversely choose coordinates transverse to a maximal vanishing subspace and group every cubic monomial by a transverse variable.

**Direct prerequisites:** `mathlib:MvPolynomial.IsHomogeneous`.

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), AppendixA,(A.1), p.45. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-affine-degree-invariant"></a>

### Exact-degree affine restriction invariant

Contract `ExponentialSumsAndCircleMethod:ES.4/affine-degree-invariant` (definition).

For rational polynomialf and d=1 or2, affineDegreeInvariant(f,d) is the maximum dimension s≤n of an injectively parametrized rational affine subspace on which the pulled-back polynomial has exact total degreed; take0 if no such subspace exists. l(f) is d=1 and q(f) is d=2. Constants are excluded from both. The pullback uses a native linear injection A:ℚˢ→ℚⁿ and translationb. A degree≤2 invariant would be a different notion.

**API.**

- `affineDegreeInvariant_le` (relation): The value is≤n.
- `affineDegreeInvariant_zero_constant` (simp): For d>0 a constant polynomial gives0.
- `affineDegreeInvariant_ge_iff` (characterisation): For s≥1 the value≥s iff some dimension≥s admits an injective exact-degree restriction.
- `affineDegreeInvariant_affine_equiv` (compatibility): Invertible rational affine substitutions preserve the value.


**Named examples and contract tests.**

- `affineDegreeInvariant_linear_test` (computation): In two variables f=X₁ has l=2 and q=0.
- `affineDegreeInvariant_quadratic_test` (computation): f=X₁²+X₂² has q=2 and l=0 overℚ.
- `affineDegreeInvariant_constant_test` (degenerate): A constant polynomial has l=q=0, despite being degree≤2 on the entire ambient space.


**Uses:** AppendixA correction: The line(t,1−t,0) gives exact quadratic restriction of the sum of three cubes.; Deferred fullness hypothesis: Does not equate exact quadratic restriction with a constant restriction..

**Construction or proof route.** Take the maximum of a bounded finite set of admissible dimensions. Evaluate the polynomial after the affine variable substitution. Invertible affine changes preserve the set of allowable dimensions. The exact-degree and injectivity conditions exclude constant restrictions and collapsed parameter spaces.

**Direct prerequisites:** `mathlib:MvPolynomial.totalDegree`; `mathlib:MvPolynomial.eval₂`.

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), AppendixA p.45, with the erroneous sum-of-cubes example excluded. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-cubic-invariant-comparisons"></a>

### Cubic invariant comparisons and regression

Contract `ExponentialSumsAndCircleMethod:ES.4/cubic-invariant-comparisons` (theorem).

For a nonzero rational homogeneous cubicF, h(F)=1 iffF is reducible overℚ, and n−h(F) is its maximal rational zero-subspace dimension. For an affine cubicf whose leading part essentially depends on all n variables, a rational hyperplane restriction of degree≤2 exists iffh=1. The stronger exact-degree q=n−1 conclusion requires that such a restriction has a nonzero quadratic part. The source’s sum-of-three-cubes example is false: F=(X₁+X₂)(X₁²−X₁X₂+X₂²)+X₃X₃² givesh≤2, and f(t,1−t,0)=3t²−3t+1 givesq≥1. These identities already refute the printed h=3,q=0 without any Fermat theorem.

**Construction or proof route.** Use the homogeneous factorization degree split1+2 and the maximal-zero-space characterization. A hyperplane restriction of degree≤2 annihilates the leading cubic on its direction, hence its linear equation divides the leading part. Exact degree2 needs a separate nonvanishing check. Verify the two displayed polynomial identities directly; do not import the source’s incorrect invariant values.

**Direct prerequisites:** [Cubic h-invariant](#es4-cubic-h-invariant); [Exact-degree affine restriction invariant](#es4-affine-degree-invariant).

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), AppendixA,(A.1)–(A.2) and example(1), p.45. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-cubic-fullness-hypotheses"></a>

### Announced cubic fullness and Markoff growth claims

Contract `ExponentialSumsAndCircleMethod:ES.4/cubic-fullness-hypotheses` (application).

The source announces, without a supplied proof, fullness for its nondegenerate irreducible-fiber affine cubics with reducible leading homogeneous part, and fullness under an unspecified circle-method estimate for tentacled counts f(x)=f(y). It also conjectures a power-law count C_tK^θ of admissible Markoff targets of each fixed orbit countt, with1/2<θ<1. These are conjectural/announced interfaces, not established theorems; the exact quantitative tentacled hypothesis is unavailable and is a recorded gap. The proved endpoint retained here is the almost-all Markoff theorem, not a three-cubes fullness theorem.

**Construction or proof route.** Keep the announced claims separate from proved nodes and from definition APIs. The exact hypothesis and proof must be supplied before any consumer can use them.

**Direct prerequisites:** [Full affine polynomial](#es4-form-full); [Cubic h-invariant](#es4-cubic-h-invariant); [Almost-all Markoff representation](#es4-markoff-almost-all-representation); [Essential absolutely irreducible affine form](#es4-affine-form).

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), Remark1.3 pp.7–8; Conjecture10.2 pp.34–35. Statement-level source boundary: these assertions are explicitly deferred or conjectural and create no unconditional dependency.


<a id="es4-affine-form"></a>

### Essential absolutely irreducible affine form

Contract `ExponentialSumsAndCircleMethod:ES.4/affine-form` (definition).

isAffineForm(f) requires positive total degree, essential dependence of its leading homogeneous part on every variable, and absolute irreducibility of f−k for every geometric constantk. In characteristic0 essential dependence is expressed by: if a rational directional derivative of the leading part vanishes identically, its direction is0. This is equivalent to not reducing the number of variables by an invertible linear change. The all-geometric-constant convention is explicit; it is stronger than checking only integral fibers. Perfectness and fullness remain separate predicates on arbitrary polynomials.

**API.**

- `isAffineForm_degree` (projection): Its degree is positive.
- `isAffineForm_essential` (projection): A vanishing directional derivative of the leading part has zero direction.
- `isAffineForm_fiber` (projection): Every geometric fiber polynomial is irreducible.
- `isAffineForm_affine_equiv` (compatibility): Invertible integral affine substitution preserves the predicate.


**Named examples and contract tests.**

- `isAffineForm_linear_test` (computation): The one-variable identityX is an affine form.
- `isAffineForm_cube_test` (non-example): X³ is not an affine form: its zero fiber is reducible.
- `isAffineForm_projection_test` (non-example): X₀ in two variables fails essential dependence although all its fibers are irreducible.


**Uses:** Ghosh–Sarnak generic cubic discussion: Supplies the geometric hypotheses before perfect/fullness predicates are applied.; AppendixA invariants: Makes the original nondegeneracy convention explicit..

**Construction or proof route.** Use the native homogeneous component, partial derivatives and polynomial irreducibility after mapping coefficients to the algebraic closure ofℚ. The directional-derivative criterion characterizes independence of a coordinate after a rational linear change in characteristic0.

**Direct prerequisites:** `mathlib:MvPolynomial.homogeneousComponent`; `mathlib:MvPolynomial.pderiv`; `mathlib:MvPolynomial.eval₂`.

**Source:** [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), §1 first paragraph p.1, affine-form convention. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-waring-optimized-minor-arcs"></a>

### Optimized Waring minor arcs

Contract `ExponentialSumsAndCircleMethod:ES.4/waring-optimized-minor-arcs` (theorem).

Fix k≥3 and1≤t<k. Define M by q≤N/(2k) and |qα−a|≤N^{1−k}/(2k), with reduceda/q and circular distance. If k²−t(k−t−1)/(k+1−t)<s≤k(k+1), there isδ(k,t,s)>0 with ∫_{Mᶜ}|Σ_{n≤N}e(αn^k)|^s dα≤C(k,t,s)N^{s−k−δ}. One can take any δ<η−k, where a=t(t+1),b=k(k+1),η=b−(b−t²−1)(b−s)/(b−a); the ε-loss must be chosen smaller than the margin.

**Construction or proof route.** Coefficient reconstruction and shifts bound the2u-th minor moment by N^{k(k−1)/2−1}log^{2u+1}N J_{u,k}(2N). At2u=k(k+1) this gives exponentk²−1+ε. Interpolate this moment with improved Hua at t(t+1), whose exponent ist²+ε. The displayed strict variable inequality is exactlyη>k.

**Direct prerequisites:** [Improved monomial mean value](#es2-improved-hua-moment); [Vinogradov mean-value theorem](#es2-vinogradov-main-bound); [Torus coefficient-counting identity](#es1-torus-coefficient-extraction).

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), Proposition9.2 and Corollary9.3 pp.84–87; Theorem9.4 p.88. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-waring-optimized-asymptotic"></a>

### Optimized Waring asymptotic and eventual representation

Contract `ExponentialSumsAndCircleMethod:ES.4/waring-optimized-asymptotic` (theorem).

For k≥3,1≤t<k,integer s with k²−t(k−t−1)/(k+1−t)<s≤k(k+1), there areδ,C>0 with R_{s,k}(m)=Γ(1+1/k)^s S_{s,k}(m)m^{s/k−1}/Γ(s/k)+O_{k,t,s}(m^{s/k−1−δ}). The local range above is satisfied at the minimum s. Hence all sufficiently large integers are sums of s positivek-th powers. In particular the minimum sufficient integer is k²+1−max_{1≤t≤k}ceil(t(k−t−1)/(k+1−t)). This is a sufficient bound, not an assertion that G(k) equals it.

**Construction or proof route.** Use the same major/minor partition in both input theorems. Convert the N-power error to an m-power error. Check the minimum satisfies s≥max(5,k+1) and the odd/even local positivity range; then the positive main term eventually dominates. For larger s, add extra powers equal1 after the minimum-variable existence theorem.

**Direct prerequisites:** [Optimized Waring minor arcs](#es4-waring-optimized-minor-arcs); [Refined Waring major arcs](#es3-waring-refined-major-arcs); [Uniform Waring local positivity in the linear range](#es3-waring-linear-range-positivity); [Positive Waring representation count](#es4-waring-positive-count).

**Source:** [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf), Theorem9.1 p.83 and completion §9.3 pp.95–96. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-mangoldt-triple-count"></a>

### Ordered von Mangoldt triple count

Contract `ExponentialSumsAndCircleMethod:ES.4/mangoldt-triple-count` (definition).

mangoldtTripleCount(N)=Σ_{a,b,c≥1,a+b+c=N}Λ(a)Λ(b)Λ(c), using ordered triples. Fourier extraction identifies it with theN-th coefficient of mangoldtExponentialSum(N,α)^3. There is no division by6.

**API.**

- `mangoldtTripleCount_small` (simp): ForN≤5 it is0 sinceΛ(1)=0.
- `mangoldtTripleCount_nonneg` (relation): All coefficients are nonnegative.
- `mangoldtTripleCount_fourier` (characterisation): The ordered triple count is the stated cube Fourier coefficient.
- `mangoldtTripleCount_pos_iff` (characterisation): It is positive iffN is a sum of three prime powers.


**Named examples and contract tests.**

- `mangoldtTripleCount_small_test` (degenerate): N=5 gives0.
- `mangoldtTripleCount_six_test` (computation): N=6 gives(log2)^3 from(2,2,2).
- `mangoldtTripleCount_seven_test` (computation): N=7 gives3(log2)^2log3 from the three permutations of(2,2,3).


**Uses:** Prime endpoint: States the exact quantity with an N²/2 main term.; Prime-power removal: A positive Λ count is converted to actual primes with a quantitative error..

**Construction or proof route.** Use a finite cube[1,N]^3 and its additive constraint.

**Direct prerequisites:** [Von Mangoldt exponential sum](#es1-mangoldt-exponential-sum); [Torus coefficient-counting identity](#es1-torus-coefficient-extraction).

**Source:** [254A, Notes 8: The Hardy–Littlewood circle method](https://terrytao.wordpress.com/2015/03/22/254a-notes-8-the-hardy-littlewood-circle-method/), Theorem2 and §3 first counting display. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-prime-minor-arc-estimate"></a>

### Von Mangoldt minor-arc saving

Contract `ExponentialSumsAndCircleMethod:ES.4/prime-minor-arc-estimate` (theorem).

For everyA>0 there isB>0 such that for everyN≥3 andα outside arcs q≤(logN)^B, |qα−a|≤(logN)^B/N, theΛ-weighted sum over any subinterval of[1,N] is O_A(N(logN)^{−A}). Constants in this minor-arc branch are effective. The dependenceB(A) absorbs the logarithms and inverse powersδ in the bilinear inverse bounds.

**Construction or proof route.** Import Vaughan’s identity and coefficient-energy estimates fromSV.2, takeU=V=N^{1/3}, and split dyadically. The shortΛ term is trivial. The twoTypeI terms have a long monotone second factor; theTypeII term has both lengths≥N^{1/3} and controlled energies. Apply the inverse bilinear bounds withδ=log^{-A}N and chooseB large enough to contradict the minor-arc condition.

**Direct prerequisites:** [Exponential Type I and Type II estimates](#es0-prime-bilinear-estimates); `SieveMethodsAndPrimePatterns:SV.2/vaughan-type-i-ii`; `SieveMethodsAndPrimePatterns:SV.2/vaughan-coefficient-energy`.

**Source:** [254A, Notes 8: The Hardy–Littlewood circle method](https://terrytao.wordpress.com/2015/03/22/254a-notes-8-the-hardy-littlewood-circle-method/), Proposition18 and complete proof §1. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-vinogradov-three-prime-asymptotic"></a>

### Vinogradov weighted three-prime asymptotic

Contract `ExponentialSumsAndCircleMethod:ES.4/vinogradov-three-prime-asymptotic` (theorem).

For everyA>0 andN≥3, mangoldtTripleCount(N)=ternaryPrimeSeries(N)N²/2+O_A(N²(logN)^{-A}); the constant is ineffective. For sufficiently large oddN, the contribution containing a nonprime prime power is O(N^{3/2}(logN)^3), soN is a sum of three primes. The argument supplies no effective numerical threshold and does not assert the full weak Goldbach theorem for every oddN>5.

**Construction or proof route.** Use the Fourier triple identity. Choose logarithmic arcs and combine the uniform minor saving with theL² energy bound. Insert the prime major model, evaluate its real simplex volumeN²/2 and theRamanujan Euler factors, and prove the truncated tail error. Alternatively Tao§3 computes the same main term with a smooth truncated-divisor model and Fourier comparison. Apply the odd uniform positive Euler bound. Count prime powers of exponent≥2 and the two remaining variables crudely to bound the unwanted weighted contribution.

**Direct prerequisites:** [Ordered von Mangoldt triple count](#es4-mangoldt-triple-count); [Von Mangoldt minor-arc saving](#es4-prime-minor-arc-estimate); [Von Mangoldt major-arc approximation](#es3-prime-major-arc-approximation); [Ternary prime singular series](#es3-ternary-prime-singular-series); [Summable weighted Fourier extraction](#es1-summable-torus-counting).

**Source:** [254A, Notes 8: The Hardy–Littlewood circle method](https://terrytao.wordpress.com/2015/03/22/254a-notes-8-the-hardy-littlewood-circle-method/), Theorems1–2; complete proof §3; Introduction prime-power removal. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-scaled-region-count"></a>

### Integral fiber count in a dilated region

Contract `ExponentialSumsAndCircleMethod:ES.4/scaled-region-count` (definition).

scaledRegionCount(f,m,S,P) is the number of integerx with f(x)=m and x∈P·S, whereS is a native real Euclidean set andP a real scalar. The definition uses Nat.card of the native subtype; boundedness ofS proves it finite for every finiteP. Dilation is an image, so atP=0 the only possible point is0, even if the region contains a neighborhood of0. No division byP is used.

**API.**

- `scaledRegionCount_finite` (structure): A bounded region gives a finite integer solution subtype.
- `scaledRegionCount_empty` (simp): The empty region gives0.
- `scaledRegionCount_mono` (relation): For boundedS⊆T, the count inS is≤the count inT.
- `scaledRegionCount_zero_scale` (characterisation): For nonempty boundedS,P=0 gives1 iff f(0)=m, otherwise0.


**Named examples and contract tests.**

- `scaledRegionCount_zero_scale_test` (degenerate): f=0,m=0,S=[−1,1]²,P=0 gives1, not an infinite count.
- `scaledRegionCount_projection_test` (computation): f=X₀,m=0,S=[−1,1]²,P=1 gives3.
- `scaledRegionCount_empty_test` (non-example): An empty region gives0 even for f=0,m=0.


**Uses:** Niedermowwe sharp region endpoint: Counts its exact rotated expanding box.; Birch endpoint: Counts a fixed coordinate box at dilationP..

**Construction or proof route.** Use the integer lattice embedding and the image ofS under real scalar multiplication. Prove bounded integer sets finite before interpreting the cardinality.

**Direct prerequisites:** `mathlib:MvPolynomial.eval₂`; `mathlib:Fintype.card`.

**Source:** [The circle method with weights](https://ftp.pdmi.ras.ru/pub/publicat/znsl/v377/p091.pdf), §1 pp.91–92,R_{1_{PB}}(N), native count formulation. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-niedermowwe-gaussian-asymptotic"></a>

### Quadratic Gaussian-weight asymptotic

Contract `ExponentialSumsAndCircleMethod:ES.4/niedermowwe-gaussian-asymptotic` (theorem).

Fix an integral nondegenerate quadraticF in n≥4 variables, a nonzero integer targetm, a bounded centerx₀ andA>0. PutK=logP and w_P(x)=π^{-n/2}K^{An}exp(−|x−Px₀|²P^{-2}K^{2A}). For everyε>0 the weighted count is I_{w_P}(m) S_F(m)+O_{F,m,A,x₀,ε}(P^{(n−1)/2+ε}), whereI is the real oscillatory density ofF−m andS_F is the representation series. The stated fixed-target version follows from the source; no uniformity in movingF is claimed. The Gaussian is smooth with rapid decay and has integralP^n, rather than compact support or total mass1.

**Construction or proof route.** Use the Kloosterman/Farey rational expansion, followed by Poisson summation. DiagonalizeF to evaluate the Gaussian frequency integral. Its nonzero dual frequencies have exponential tails. Splitq into squarefree and squarefull parts; the complete quadratic/Kloosterman estimate and squarefull sparsity give errorP^{(n−1)/2+ε}. The zero dual frequency tends toI timesS after the proved tails.

**Direct prerequisites:** [Summable weighted Fourier extraction](#es1-summable-torus-counting); [Weighted real fiber density](#es3-weighted-real-density); [Polynomial-system p-adic representation density](#es3-form-padic-density).

**Source:** [The circle method with weights](https://ftp.pdmi.ras.ru/pub/publicat/znsl/v377/p091.pdf), §2 weight(2) p.92; Lemmas2.1–2.7 pp.93–100 and Theorem2.8 p.101. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-niedermowwe-expanding-box"></a>

### Niedermowwe sharp expanding-box count

Contract `ExponentialSumsAndCircleMethod:ES.4/niedermowwe-expanding-box` (theorem).

Fix an integral nondegenerate quadraticF in n≥4 variables and nonzero integerm. LetM be a real orthogonal diagonalizing matrix forF, and choose a fixed bounded boxB such thatMᵀB is aligned with the coordinate axes. For everyD>0, asP→∞, scaledRegionCount(F,m,B,P)=I_{1_{PB}}(m)S_F(m)+O_{F,m,B,D}(P^{n−2}(logP)^{−D}). The real factor is the density ofF−m with the actual indicator ofPB, not an asserted positive constant. The theorem itself supplies neither positivity nor a moving-coefficient estimate.

**Construction or proof route.** Integrate the Gaussian centers over slightly enlarged/contracted diagonal boxes to sandwich the sharp count with superpolynomially small lattice error. Control the real boundary shell by oscillatory integrals and compare the averaged Gaussian integral with the sharp singular integral. The source error isP^{n−2}(logP)^{−A/6+1}; chooseA≥6(D+1). RecordF,m,B dependence and n≥4,m≠0.

**Direct prerequisites:** [Integral fiber count in a dilated region](#es4-scaled-region-count); [Quadratic Gaussian-weight asymptotic](#es4-niedermowwe-gaussian-asymptotic).

**Source:** [The circle method with weights](https://ftp.pdmi.ras.ru/pub/publicat/znsl/v377/p091.pdf), Lemmas3.2–3.5 pp.103–108 and Theorem3.6 p.109. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es4-birch-single-form-asymptotic"></a>

### Birch single-form asymptotic

Contract `ExponentialSumsAndCircleMethod:ES.4/birch-single-form-asymptotic` (theorem).

LetF be a fixed integral homogeneous polynomial of degreed≥2 in n variables. Letσ be the geometric affine dimension of {∇F=0}; if n−σ>(d−1)2^d, then for a fixed bounded coordinate boxB and P→∞, the zero-fiber count has asymptotic σ∞(F,B)(∏_pσ_p(F,0))P^{n−d}+O_{F,B}(P^{n−d−δ}),δ>0. The series and oscillatory integral converge absolutely. A nonsingular real zero in the interior ofB and nonsingular integralp-adic zeros for everyp make the main coefficient positive and give a nonzero integral zero for largeP. The box is chosen away from0 for that last conclusion. This is a fixed-form theorem; it does not give a uniform small-variable affine cubic fullness estimate.

**Construction or proof route.** TakeR=1 and a single degreed in Theorem1.2. Its numerical conditions reduce to the displayed Birch codimension condition. Iterated Weyl differencing and the polar dimension bound yield the major/minor alternative; a large set of near-integer values is controlled by the affine rank-defect locus. Integrate the minor saving and approximate the major arcs by the complete residue sum and real integral. Hensel/coarea local positivity requires nonsingular local points; congruence admissibility alone is insufficient.

**Direct prerequisites:** [Integral fiber count in a dilated region](#es4-scaled-region-count); [Top-degree polarization identity](#es0-multivariate-polarization); [Polynomial-system p-adic representation density](#es3-form-padic-density); [Weighted real fiber density](#es3-weighted-real-density).

**Source:** [Forms in many variables and differing degrees](https://arxiv.org/pdf/1403.5937v2), §1 equation(1.2) p.3; Theorem1.2 pp.4–5 and same-degree specialization; §2 pp.14–16; §§4–8 pp.19–41. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


### Required refinements for this layer

- Birch proof and nonsingular local positivity adapters: The fixed single-form endpoint is specified from the primary BHB Theorem1.2 specialization. Its Weyl/rank-defect estimates, absolutely convergent general-form residue series and real/p-adic nonsingular positivity must be instantiated in native polynomial/scheme types. The mere admissibility predicate is not enough. The source explicitly leaves the general positivity argument to the reader; record Hensel and regular-real coarea requirements.
- Current maximal-lattice native import: Current IntegralLattices owns the maximal integral lattice and local splitting machinery; OrthogonalSpinGroups owns quadratic-space isometries. Identify their exact maximality/integral hyperbolic-plane theorem names at packaging. The rank≥5 splitting and uniform representation-product lower bound must be matched to them; the stabilizer-density target of IntegralLattices is not a representation density. Suggested omits the two maximal-lattice signatures until the supplier types are matched.
- Markoff corrected local tables and product-tail interface: The source omits parts of the Gauss-block derivations. Complete the odd χ(−1) correction, rederive erroneous higher2-adic explicit cases if needed beyond positivity, and prove the valuation-uniform even-even pair tail. Establish the product-aware finite-level comparison needed by the reciprocal estimate; summing individual O(p^{-B}) errors without controlling other factors is insufficient.
- Markoff external binary and quaternary counting inputs: Acquire and match Blomer–Granville Theorem2 for the sector diagonal, and the exact Heath–Brown/Niedermowwe four-variable weighted δ-method plus coefficient/target/weight uniformity required for(9.17). The fixed n≥5 theorem is insufficient. Preserve the smoothing thickness and derivative losses when removing the sharp sectors.
- Native Waring analytic transfer interfaces: Specify and locate the native bounded-variation sum–integral estimate, quantitative absolute-series and full-frequency integral tails, and simplex beta-convolution/sine-kernel inversion used by the selected complete §6 source proof. These are proof-to-library adapters, not premise fields assuming the desired asymptotic. Keep symmetric cutoffs and positive tuples.
- Negative Markoff sector and arithmetic orbit supplier: Spell out the negative-target sector with ratios1/3,1/2 and its native slice signature, with all the same uniform variance errors. Link the reviewed ArithmeticDynamics Markoff-action PartII owner for congruence admissibility, Zariski density and the generic orbit-growth comparison; no unweighted circle-method count supplies these arithmetic facts.
- Quadratic Kloosterman, Gaussian Poisson and boundary adapters: Niedermowwe’s complete paper is read. His Lemma2.5 uses the quadratic complete-sum estimate from Heath–Brown1996 Lemma26: squarefreeq₁/squarefullq₂ bound q₁^{(n+1)/2+ε}q₂^{n/2+1}gcd(q₁,m)^{1/2}, uniformly in dual frequency. The native Poisson Gaussian normalization, composite Kloosterman/Salié conventions and sharp rotated-box boundary comparison are missing; match the ordinary Kloosterman ownerQM.3 and odd Gauss supplierFF.1 before closure.
- Quadratic delta-method complete external proof: Acquire and read Heath–Brown, J. reine angew. Math.481(1996),149–206, Theorem4/Corollary2 used by SSTT4.9. State its native δ-symbol expansion, complete composite-modulus Kloosterman estimate, weighted frequency integral bounds and Euler-product convergence. SSTT supplies exact endpoints and some local proofs, not this complete analytic proof. The n≥5 weighted theorem cannot supply the n=4 moving-coefficient Markoff pair estimate.
- Real symmetric lattice shrinking in the Birch proof: Browning–HeathBrown Lemma4.2 p.24 imports Davenport’s symmetric lattice estimate: for real symmetricn×nL,a>1,N(Z)=#{u∈ℤⁿ:|u|<aZ,‖(Lu)_i‖<a^{-1}Z}, and0<Z₁≤Z₂≤1, N(Z₂)≤C(n)(Z₂/Z₁)^nN(Z₁). Its complete external proof and native geometry-of-numbers supplier must be matched. The function-field PartII shrinking result has different scalars and is not a substitute. Lemma5.1 p.26 also imports the bounded-degree affine integer-box count with dimension bound; supply that exact arithmetic-geometric interface.
- Refined Waring Fourier/Gauss proof interfaces: Assing9.2–9.9 exact statements and full selected proofs are read. Remaining native proof interfaces are coefficient reconstruction with positive trapezoidal kernels; complete monomial prime-power Gauss blocks at bad primes; target-dependent weightedA(q) tails; and nonintegral radius/arc matching. No existing classical2^k+1 theorem supplies these optimized-range estimates.
- Unproved generic cubic fullness input: No quantitative tentacled second-moment hypothesis or complete proof is supplied for the generic cubic fullness claims. The AppendixA exact-degree invariants require nonvanishing hypotheses; its sum-of-three-cubes example has incorrect h/q values, refuted by the polynomial identities recorded here. Do not infer fullness of three cubes or a Markoff power-law exceptional exponent.



## ES.5 — Uniform and geometric applications

The determinant method counts primitive projective points uniformly in coefficients and transfers to integral plane curves, space curves and surfaces. Generic projections, line loci and bounded-degree elimination are imported from geometric foundations. The binary-form application is the concrete arithmetic-statistics handoff: rational symmetry defines equivalence, Roth controls tails, and the line-free surface bound controls inequivalent collisions.

**Atlas planets:** Primitive projective point count; Determinant auxiliary cover; Uniform plane-curve bound; Line-free surface bound; Binary-form representation statistics.

**Coverage:** planned. The exact contracts follow; stage-specific refinements are listed after them.


<a id="es5-bounded-projective-point-count"></a>

### Bounded projective point count

Contract `ExponentialSumsAndCircleMethod:ES.5/bounded-projective-point-count` (definition).

boundedProjectivePointCount(F,B) counts integer vectors x with |x_i|≤B_i, F(x)=0, gcd_i|x_i|=1, and first nonzero coordinate positive. F is a native integer MvPolynomial in finitely many coordinates; B_i are natural box sizes. The concrete finite carrier uses coordinate k_i∈Fin(2B_i+1) and x_i=k_i−B_i. For a homogeneous nonzero form, these are unique primitive representatives of rational projective points, not every scalar multiple or both signs.

**Additional hypotheses:** The definition permits zero box sizes and the zero polynomial for boundary tests; determinant bounds require B_i≥1 and a homogeneous form irreducible over the specified field. The zero vector is never primitive..

**API.**

- `boundedProjectivePointCount_eq_card` (characterisation): The count equals the native finite subtype cardinality with the displayed evaluation/gcd/sign conditions.
- `boundedProjectivePointCount_zero_box` (simp): With every B_i=0 the count is0.
- `boundedProjectivePointCount_one_polynomial` (simp): The constant-one polynomial has count0.
- `boundedProjectivePointCount_scale` (compatibility): A nonzero integer scalar multiple of F has the same count.
- `boundedProjectivePointCount_mono` (relation): Increasing every box size can only increase the count.


**Named examples and contract tests.**

- `boundedProjectivePointCount_line_test` (computation): For F=X₀ in three coordinates and unit box the count is4.
- `boundedProjectivePointCount_zero_box_test` (degenerate): For every F the all-zero box has count0.
- `boundedProjectivePointCount_conic_test` (compatibility): For the native form X₀X₂−X₁² and unit box, the count is4.
- `boundedProjectivePointCount_sign_test` (non-example): For the zero polynomial in three coordinates and unit box the count is13, not26: both signs are not counted.


**Uses:** Heath-Brown Theorems3,4,14: The exact count supplies the geometric endpoint and the coefficient-height alternative..

**Construction or proof route.** Use native finite tuple cardinality, evaluation and finite gcd. Finite interval translation identifies the carrier with the source integer box. Every rational projective point has exactly one primitive integer representative with first nonzero coordinate positive. This is an adapter to projective points, not a new projective-space construction.

**Direct prerequisites:** `mathlib:MvPolynomial.eval`; `mathlib:MvPolynomial.map`; `mathlib:MvPolynomial.totalDegree`; `mathlib:MvPolynomial.IsHomogeneous`; `mathlib:MvPolynomial.support`; `mathlib:Finset.gcd`; `mathlib:Irreducible`; `mathlib:Fintype.card`.

**Source:** [The density of rational points on curves and surfaces](https://arxiv.org/pdf/math/0405392), §1 pp.553–555 and562; §2 p.564; complete §3 pp.567–575 in the specified arXiv reprint. Exact normalized projective representatives, anisotropic box sizes, coefficient height and theorem uniformity are retained; unacquired external proof interfaces are recorded as gaps.


<a id="es5-ternary-coefficient-height-alternative"></a>

### Ternary coefficient-height alternative

Contract `ExponentialSumsAndCircleMethod:ES.5/ternary-coefficient-height-alternative` (theorem).

For every degree d≥1 there is C_d>0 such that for every primitive-coefficient integral ternary homogeneous form F of degree d irreducible over ℚ and B≥1, either N(F;B,B,B)≤d² or max|coeff(F)|≤C_dB^{d(d+1)(d+2)/2}. The height is the native supremum of coefficient absolute values on support, not an unrecorded projective or logarithmic height.

**Additional hypotheses:** Primitivity is gcd of all coefficient absolute values equal to1. Irreducibility is after native coefficient extension ℤ→ℚ; it is not weakened to irreducibility over ℤ for a form with nontrivial content..

**Construction or proof route.** If there are d²+1 distinct projective representatives, form their degree-d monomial evaluation matrix with(d+1)(d+2)/2 columns. A nonzero integer kernel vector is given by bounded minors, producing a degree-d form G with height O_d(B^{d(d+1)(d+2)/2}). The source projective Bézout input implies G is a scalar multiple of F; coefficient primitivity bounds the height of F by that of G. The precise Bézout and kernel-minor suppliers remain explicit frontiers.

**Direct prerequisites:** [Bounded projective point count](#es5-bounded-projective-point-count); `mathlib:MvPolynomial.eval`; `mathlib:MvPolynomial.map`; `mathlib:MvPolynomial.totalDegree`; `mathlib:MvPolynomial.IsHomogeneous`; `mathlib:MvPolynomial.support`; `mathlib:Finset.gcd`; `mathlib:Irreducible`.

**Source:** [The density of rational points on curves and surfaces](https://arxiv.org/pdf/math/0405392), §1 pp.553–555 and562; §2 p.564; complete §3 pp.567–575 in the specified arXiv reprint. Exact normalized projective representatives, anisotropic box sizes, coefficient height and theorem uniformity are retained; unacquired external proof interfaces are recorded as gaps.


<a id="es5-determinant-auxiliary-cover"></a>

### Determinant-method auxiliary hypersurface cover

Contract `ExponentialSumsAndCircleMethod:ES.5/determinant-auxiliary-cover` (theorem).

For n≥3,d≥2,ε>0 there are C(n,d,ε)>0 and D(n,d,ε) such that for every degree-d integral homogeneous F irreducible over ℚ, with H=max|coeff(F)|≥2, and B_i≥1, set V=∏B_i and T=max_{e∈support F}∏B_i^{e_i}. There is a finite set of integral homogeneous auxiliary forms G_j of degrees≤D, none divisible by F after native coefficient extension to ℚ, covering every primitive normalized integer zero in the box, and its cardinality is at most C(V^d/T)^{d^{−(n−1)/(n−2)}}V^ε(log H)^{2n−3}. C,D are independent of F and the B_i. For H=1 apply the theorem to2F, giving a log(2H) convention; the unmodified zero logarithm is excluded.

**Additional hypotheses:** This is the exact source quantitative cover, with bounded degree and nondivisibility both essential. Irreducibility is over ℚ. No smoothness assumption on F is imposed: its singular points are handled separately.; Nondivisibility is over ℚ, not merely over ℤ: otherwise a nonprimitive scalar multiple of F would permit an auxiliary form defining the entire same hypersurface..

**Construction or proof route.** A nonzero partial derivative covers the singular points and is not divisible by F. For nonsingular points choose O(log(HB)) primes of the required scale so every point is nonsingular modulo one of them; split by nonzero projective residue classes. In each residue class use the source unit-derivative p-adic implicit polynomial graph, then order its monomials by degree. Column elimination forces a p-adic determinant valuationν with the source combinatorial expression. Compare this divisibility to the archimedean determinant bound; choose a fixed degree D large enough to force all maximal minors to vanish. A bounded-degree kernel form then vanishes on the class. Select the support monomials excluding a maximal Newton-polytope vertex multiple, ensuring F does not divide the auxiliary form. The asymptotic monomial/valuation calculation gives the stated prime scale and number of classes.

**Direct prerequisites:** [Bounded projective point count](#es5-bounded-projective-point-count); `mathlib:MvPolynomial.eval`; `mathlib:MvPolynomial.map`; `mathlib:MvPolynomial.totalDegree`; `mathlib:MvPolynomial.IsHomogeneous`; `mathlib:MvPolynomial.support`; `mathlib:Finset.gcd`; `mathlib:Irreducible`.

**Source:** [The density of rational points on curves and surfaces](https://arxiv.org/pdf/math/0405392), §1 pp.553–555 and562; §2 p.564; complete §3 pp.567–575 in the specified arXiv reprint. Exact normalized projective representatives, anisotropic box sizes, coefficient height and theorem uniformity are retained; unacquired external proof interfaces are recorded as gaps.


<a id="es5-uniform-ternary-curve-bound"></a>

### Uniform rational plane-curve bound

Contract `ExponentialSumsAndCircleMethod:ES.5/uniform-ternary-curve-bound` (theorem).

For degree d≥2 and ε>0 there is C(d,ε)>0 such that for every integral ternary homogeneous F of degree d irreducible over ℚ and every B_i≥1, N(F;B₁,B₂,B₃)≤CT^{−1/d²}V^{1/d+ε}. In particular N(F;B,B,B)≤C′(d,ε)B^{2/d+ε} for all B≥1. Constants are independent of every coefficient of F; no positive lower bound or asymptotic is asserted.

**Additional hypotheses:** V and T have the same source definitions as the auxiliary cover. Absolute irreducibility is not required. For the cubic homogeneous form the cube exponent is2/3+ε; height-one coefficient cases use the corrected logarithmic convention..

**Construction or proof route.** Apply the auxiliary cover with n=3. Each proper plane intersection has at most dD projective points by the source Bézout input. Normalize coefficient content without changing zeros. If there are at most d² points the bound is absorbed, since T≤V^d. Otherwise apply the coefficient-height alternative with the largest box size. Absorb the resulting logarithmic coefficient dependence into a smaller chosen positive V exponent, obtaining T^{−1/d²}V^{1/d+ε}. For equal sides T=B^d,V=B³. Choose the anisotropic ε/3 to obtain the requested cube exponent2/d+ε.

**Direct prerequisites:** [Bounded projective point count](#es5-bounded-projective-point-count); [Determinant-method auxiliary hypersurface cover](#es5-determinant-auxiliary-cover); [Ternary coefficient-height alternative](#es5-ternary-coefficient-height-alternative); `mathlib:MvPolynomial.eval`; `mathlib:MvPolynomial.map`; `mathlib:MvPolynomial.totalDegree`; `mathlib:MvPolynomial.IsHomogeneous`; `mathlib:MvPolynomial.support`; `mathlib:Finset.gcd`; `mathlib:Irreducible`.

**Source:** [The density of rational points on curves and surfaces](https://arxiv.org/pdf/math/0405392), §1 pp.553–555 and562; §2 p.564; complete §3 pp.567–575 in the specified arXiv reprint. Exact normalized projective representatives, anisotropic box sizes, coefficient height and theorem uniformity are retained; unacquired external proof interfaces are recorded as gaps.


<a id="es5-integral-plane-curve-bound"></a>

### Uniform integral plane-curve bound

Contract `ExponentialSumsAndCircleMethod:ES.5/integral-plane-curve-bound` (theorem).

For each degreed≥2 andε>0 there isC(d,ε) independent of all coefficients such that for every integral polynomialf(X,Y) of exact total degreed irreducible overℚ, andB≥1, #{(x,y)∈ℤ²:|x|,|y|≤B,f(x,y)=0}≤C(d,ε)B^{1/d+ε}. Homogenize and apply the anisotropic ternary theorem with(B,B,1); the monomial-height parameterT≥B^d. This is an upper bound, not a point-count asymptotic.

**Construction or proof route.** Homogenize the exact-degree polynomial; rational irreducibility is preserved. Map(x,y) to the primitive projective representative(x,y,1), making the sign convention explicit. UseV=B²,T≥B^d in the uniform anisotropic curve bound, adjusting itsε by a factor2.

**Direct prerequisites:** [Uniform rational plane-curve bound](#es5-uniform-ternary-curve-bound).

**Source:** [The density of rational points on curves and surfaces](https://arxiv.org/pdf/math/0405392), Theorem3,(1.8),p.555 and integral specialization pp.554–555; proof §§3–4 pp.565–579. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es5-projective-space-curve-bound"></a>

### Uniform space-curve bound

Contract `ExponentialSumsAndCircleMethod:ES.5/projective-space-curve-bound` (theorem).

An irreducible geometric projective curveC⊆ℙ³ of degreed≥2 has at mostC(d,ε)B^{2/d+ε} rational points of standard primitive height≤B. C need not be defined overℚ. The uniform constant does not depend onC. Choose a bounded-height projection with finite degree1 onC and apply the plane-curve estimate; native schemes, degree and generic projection are imported from algebraic foundations.

**Construction or proof route.** Elimination bounds the exceptional projection-center locus solely in terms ofd. Choose an integral center outside it of bounded height. Projection preserves degree and has uniformly bounded fibers; rational source points map to rational plane points of heightO_d(B). Handle a curve not defined overℚ by the source coefficient/intersection alternative.

**Direct prerequisites:** [Uniform rational plane-curve bound](#es5-uniform-ternary-curve-bound); `SchemeAndStackFoundations:SF.5/isolated-plane-bezout`; `SchemeAndStackFoundations:SF.5`.

**Source:** [The density of rational points on curves and surfaces](https://arxiv.org/pdf/math/0405392), Theorem5 p.556; Lemma7 and full proof §4 pp.575–579. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es5-surface-linefree-bound"></a>

### Uniform line-free surface bound

Contract `ExponentialSumsAndCircleMethod:ES.5/surface-linefree-bound` (theorem).

For an integral homogeneousF of degreed≥3 that is absolutely irreducible overℚ, the rational points of primitive height≤B onF=0 inℙ³ which lie on no geometric line contained inF=0 number at mostC(d,ε)B^{52/27+ε}, uniformly inF. Removing only a chosen list of obvious rational lines is insufficient; the geometric line locus defines the count.

**Construction or proof route.** Cover points by rational planes with normal height≤B^{1/3}, using short lattice vectors. Irreducible degree≥3 sections give exponent4/3+16/(9d)≤52/27. Linear components are excluded. Conic sections lie in a bounded-degree exceptional normal locus; counting those normals and their conic lattice points gives exponent17/9. Bertini generic irreducibility and degree-bounded elimination must be supplied, as recorded in the supplier request.

**Direct prerequisites:** [Uniform rational plane-curve bound](#es5-uniform-ternary-curve-bound); `SchemeAndStackFoundations:SF.5/isolated-plane-bezout`; `SchemeAndStackFoundations:SF.5`.

**Source:** [The density of rational points on curves and surfaces](https://arxiv.org/pdf/math/0405392), Theorem6 p.557; complete §6 proof pp.581–583. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es5-surface-all-points-bound"></a>

### Uniform surface point bound

Contract `ExponentialSumsAndCircleMethod:ES.5/surface-all-points-bound` (theorem).

For every degreed≥2,ε>0, an absolutely irreducible integral formF in four variables has boundedProjectivePointCount(F,B)≤C(d,ε)B^{2+ε}. The result includes points on lines, unlike the line-free estimate. It is uniform in coefficients and remains only an upper bound.

**Construction or proof route.** For degree≥3 use the line-free bound. The Fano line locus in the Grassmannian has dimension≤1 and no linear component; project it to bounded-degree plane curves to count lines of given Plücker height. A rational line of lattice determinantΔ contributesO(1+B²/Δ); dyadic summation givesB^{2+ε}. Irrational lines contain at most one rational projective point. For degree2 use the rank≥3 quadric bound.

**Direct prerequisites:** [Uniform line-free surface bound](#es5-surface-linefree-bound); [Uniform space-curve bound](#es5-projective-space-curve-bound); [Bounded projective point count](#es5-bounded-projective-point-count); `SchemeAndStackFoundations:SF.5`.

**Source:** [The density of rational points on curves and surfaces](https://arxiv.org/pdf/math/0405392), Theorem9 p.559; quadratic §5 pp.579–581 and general §6 pp.583–585. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es5-binary-form-equivalence"></a>

### Equivalence of binary-form representations

Contract `ExponentialSumsAndCircleMethod:ES.5/binary-form-equivalence` (definition).

For rational binary formG and integral vectorsx,y, binaryFormEquivalent(G,x,y) means that some invertible rational linear mapM preservesG identically and sendsx toy. The map need not preserve the entire integer lattice. This is exactly the equivalence relation used by Heath–Brown’s representation statistics; equality ofG-values alone is weaker.

**API.**

- `binaryFormEquivalent_refl` (relation): Every integral vector is equivalent to itself.
- `binaryFormEquivalent_symm` (relation): Inversion of the rational symmetry reverses equivalence.
- `binaryFormEquivalent_trans` (relation): Composition proves transitivity.
- `binaryFormEquivalent_value` (compatibility): Equivalent representations have equalG-values.
- `binaryFormEquivalent_zero` (characterisation): Zero is equivalent only to zero.


**Named examples and contract tests.**

- `binaryFormEquivalent_swap_test` (computation): ForG=X³+Y³,(1,0) and(0,1) are equivalent by swapping coordinates.
- `binaryFormEquivalent_value_test` (non-example): For the sameG,(1,1) and(2,0) are not equivalent because their values are2 and8.
- `binaryFormEquivalent_zero_test` (degenerate): Even forG=0,zero is not equivalent to(1,0), sinceM is invertible.


**Uses:** Binary-form arithmetic-statistics endpoint: Defines the exceptional integers with genuinely inequivalent representations.; Surface transfer: The rational symmetry lines are excluded from collision counts..

**Construction or proof route.** Use native rational LinearEquiv and native polynomial evaluation, including the universal preservation equation.

**Direct prerequisites:** `mathlib:MvPolynomial.eval₂`.

**Source:** [The density of rational points on curves and surfaces](https://arxiv.org/pdf/math/0405392), Definition before Theorem8 p.558; §7 lines and automorphisms pp.588–589. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


<a id="es5-binary-form-representation-statistics"></a>

### Binary-form value and collision bounds

Contract `ExponentialSumsAndCircleMethod:ES.5/binary-form-representation-statistics` (theorem).

LetG∈ℤ[X,Y] be a fixed homogeneous binary form of degreed≥3 with no geometric linear factor of multiplicity≥d/2 andG(1,0)>0. Its rational linear symmetry group is finite of order≤d·d!. The number of positive integersm≤X represented byG is bounded above and below by positiveG-dependent multiples ofX^{2/d}. For everyε>0 at mostC(G,ε)X^{52/(1+26d)+ε} have two inequivalent integral representations in binaryFormEquivalent. Constants depend onG and may be ineffective through Roth. This supplies the analytic transfer to arithmetic statistics, without re-planning a generic statistical framework.

**Construction or proof route.** Count the tails of integral representations near roots using Roth’s exact lower-bound form and primitive lattice strips; obtainΣr_tail≤X^{1/d}logX+(X/C)^{2/(d−1)}. The collision surfaceG(x₁,x₂)−G(x₃,x₄)=0 has no linear/quadratic rational factor under the multiplicity hypothesis. Its line-free points are controlled by the surface theorem; rational symmetry lines give equivalent representations. BalanceC^{52/27} with(X/C)^{2/(d−1)} atC=X^{27/(1+26d)}. Positive area and Cauchy–Schwarz give the represented-value lower bound. The symmetry group acts faithfully on the≥3 geometric roots modulo scalar d-th roots of unity, giving order≤d·d!.

**Direct prerequisites:** [Equivalence of binary-form representations](#es5-binary-form-equivalence); [Uniform line-free surface bound](#es5-surface-linefree-bound); `DiophantineApproximationAndTranscendence:DT.1/roth-theorem-lower-bound-form`.

**Source:** [The density of rational points on curves and surfaces](https://arxiv.org/pdf/math/0405392), Theorem8 p.558; full §7 pp.585–589. This locator supplies the stated mathematical input; the formulation fixes the normalizations and hypotheses required by its consumers.


### Required refinements for this layer

- Determinant-method source-to-library interfaces: The determinant proof still needs native projective Bézout, bounded-minor integer kernel vectors, a unit-derivative p-adic implicit multivariable graph, determinant valuation/monomial counts and the source Lemma4 prime-selection estimate. Match these to existing native/supplier declarations rather than a record assuming the auxiliary cover. The broader integral/surface/statistics targets now have exact nodes, but generic projection, Bertini and the Fano locus remain the separate SF.5 request. The arXiv reprint is not collated with the publisher scan.
- Geometric surface and binary-statistics adapters: The all-surface upper bound now has a native signature. Native geometric projective curves and line-free counts still need degree-controlled projection/line-locus suppliers; binary statistics needs the root-multiplicity and rational-symmetry group interfaces. These upper bounds do not assert a positive asymptotic.



## Supplier requests and unassigned identifiers

The following stage requests are explicit prerequisites. A finer node is imported where it already matches; the request covers only the additional statement.

- **`FiniteFieldsAndCharacterSums:FF.2`:** Complete multiplicative-character correlation estimates sufficient for the Burgess 2r-th moment and the iterated smooth-squarefree Graham–Ringrose correlations, with exceptional repeated factors, primitive distinguished character and dependence on r recorded. Do not identify a generic Weil bound with this exact moment interface. Consumers: [Burgess short-character estimate](#es0-burgess-character-bound), [Graham–Ringrose smooth-modulus estimate](#es0-graham-ringrose-bound).
- **`FiniteFieldsAndCharacterSums:FF.1`:** Canonical quadratic-character convention and the odd-prime quadratic Gauss-sum square/evaluation, including χ(−1), needed to evaluate the initial Markoff frequency blocks. Composite2-power block calculations are proved here, not imported as finite-field results. Consumers: [Odd-prime Markoff densities](#es3-markoff-odd-local-density), [Two-adic Markoff densities](#es3-markoff-two-adic-density), [Markoff pair local factors](#es3-markoff-pair-local-density).
- **`AnalyticNumberTheory:AN.2`:** The node AN.2/siegel-walfisz currently states π in reduced residue classes. Supply its Λ-weighted version uniform over all subintervals of[1,N],q≤log^B N, with partial-summation main term length/φ(q), arbitrary logarithmic saving and ineffective constants; exact error for nonunit prime-power residue classes. Consumers: [Von Mangoldt major-arc approximation](#es3-prime-major-arc-approximation).
- **`SchemeAndStackFoundations:SF.5`:** Supply degree-controlled generic plane projection and generic plane-section irreducibility for a geometrically integral projective curve/surface, and elimination bounds for the exceptional section locus and Fano line locus. SF.5/isolated-plane-bezout is matched, but it does not by itself prove these uniform geometric inputs. Use current native schemes/Grassmannians; no duplicate ES geometric foundation. Consumers: [Uniform space-curve bound](#es5-projective-space-curve-bound), [Uniform line-free surface bound](#es5-surface-linefree-bound), [Uniform surface point bound](#es5-surface-all-points-bound).

The independent function-field lattice and early geometric Part II prefixes have no published stage/node ids in the snapshot. Their exact missing statements are the two named supplier gaps in ES.0–ES.1. Their absence is recorded rather than filled with invented references. Current maximal-lattice and Markoff orbit types also require an exact owner match before packaging.


## Sources and version scope

- **BennettSiksek2020:** Michael A. Bennett and Samir Siksek, [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf). Annals of Mathematics 191 (2020), 355–392; published version of record.. Read scope: §8.1, printed pp.376–379, including Theorem 6, Proposition 8.2 and both proof cases.; Page images 377–379 checked for conductor notation, divisor bound, factors and interval endpoints.; Continuation on 2026-09-27: freshly reread the whole selected §8.1 argument on printed pp.376–379 and inspected page 377 image, distinguishing ambient lcm, primitive conductor and excluded primes.; CRT continuation, 2026-09-27: selected published pp.376–379 reread; extraction items44 and92–97, accepted route8 and reviewed E2/E3/E11 compared with the actual factor requirements..
- **MathlibPin:** The Mathlib contributors, [Pinned characters, Möbius arithmetic and finite-interval APIs](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib). Commit 082e2d37e8b0463410cdb532e111cd43d5a66174. Read scope: DirichletCharacter/Basic.lean: carrier/change-level and primitive-character declarations; Bounds.lean in full.; MulChar/Basic.lean complete-sum section; ArithmeticFunction/Moebius.lean lines35–190; Zeta.lean lines72–104; Defs.lean identity evaluation.; Algebra/Ring/Periodic.lean lines35–125; natural divisors membership/positivity and definition; natural Ioc cardinality; ZMod natural modulus cast.; Finite-sum norm inequality, natural coprimality under adding multiples, and real-power addition/multiplication/monotonicity statements with hypotheses.; Algebra/Order/Archimedean/Defs.lean: exists_nat_ge; real-power nonnegativity and inverse-exponent threshold laws reread for the continuation.; DirichletCharacter/Basic.lean lines1–445 in full for carrier, nonunit evaluation, change-level, conductor invariance, inverse, ambient/primitive product and conductor-product divisibility; Tau Ceti's DirichletCharacter/Basic.lean read in full as a duplication screen.; MulChar/Basic.lean quadratic predicate and square criterion (lines428–568); PrimeFin.lean lines30–122; Factorization/Basic.lean lines330–360; GCD/BigOperators.lean and GCD/Prime.lean in full; finite-subset product divisibility; common-prime characterization of noncoprimality; integer/natural coprimality comparison.; CRT continuation: ZMod/QuotientRing native finite CRT; Algebra/BigOperators/Pi native homomorphism-product equivalence; unit equivalences; character/conductor/level-lifting statements; natural prime-power complement and gcd-product statements. All newly cited source blobs verified at the pin..
- **TaoDivisor2008:** Terence Tao, [The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/). Author post, 23 September 2008, updated 24 September. Read scope: Entire main post: both small/large-prime proofs and applications. The explicit constant D^B below is the worker's refinement, not a quoted constant..
- **Polymath2014:** D. H. J. Polymath, [New equidistribution estimates of Zhang type](https://msp.org/ant/2014/8-9/ant-v8-n9-p03-s.pdf). Algebra & Number Theory 8 (2014), no. 9, 2067–2199; published version. Read scope: Proposition 4.12 and its proof, printed pp.2106–2110, including the elementary shift argument (4-22)–(4-23) and the separate off-diagonal input (4-24). Selected passage only, not whole-paper coverage..
- **IwaniecKowalskiChapter11Author:** Henryk Iwaniec and Emmanuel Kowalski, [Analytic Number Theory, Chapter 11: Sums over finite fields](https://people.math.ethz.ch/~kowalski/ik-ant-exp-sums.pdf). Author-hosted chapter extract; published book version not independently obtained. Read scope: Cover and printed pp.269–271 only; p.271 visually collated against extracted text. This PDF contains Chapter 11 and bibliography, not Theorem 12.13. Included to preserve the source findings made during acquisition, not as a supplier of the new finite analytic bounds..
- **BDG2016:** Jean Bourgain; Ciprian Demeter; Larry Guth, [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf). Published Annals of Mathematics 184 (2016), 633–682; revised 18 April 2016. Read scope: Full published paper §§1–10, pp.633–682, including appendix and references; figures3–5 visually inspected pp.663/669/674. External cited papers are not included in this reading..
- **AssingCircle2022:** Edgar Assing, [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf). Author-hosted Bonn winter-term 2021/22 lecture notes, dated 1 April 2022, 120-page PDF. Read scope: Title/date/contents and pp.1–4 orientation; §5 pp.28–33, §6 pp.33–48 through Theorem6.19 and proof, §8.1–8.3 pp.66–83 and §9 pp.83–95 read, including available proofs. Pages34,44,45,46,75,82,86 visually inspected. Remaining chapters/exercises/external cited papers are not included. The general-curve theorem8.6 is stated without a proof in these notes..
- **HeathBrown2002:** D. R. Heath-Brown; appendix by J.-L. Colliot-Thélène, [The density of rational points on curves and surfaces](https://arxiv.org/pdf/math/0405392). Annals155(2002),553–598, as reproduced in arXiv math/0405392v1 dated20May2004; this reprint is not independently collated with the publisher scan.. Read scope: Reprint pp.553–557 and561–575, including §2 preliminaries and the complete §3 proof of Theorem14. Theorem3 deduction onp.562 and Theorem4 proof onp.564 read. Other endpoint proofs, appendix and cited external texts are not included.; Continuation: Theorem5 generic projection pp.577–579; complete §6 surface proof pp.581–585 and §7 binary representation proof pp.585–589, read11October2026. These locators use the Annals page headers of the arXiv reprint..
- **BaierExponentialLectures:** Stephan Baier, [Lectures on exponential sums](https://www.atmschools.org/sites/default/files/Baier-Lectures_on_expo_sums.pdf). Author lecture notes; undated 35-page supplied PDF. Read scope: Lecture 2, Theorem 7 and proof pp.6–9; Lecture 3, Lemma 11 and Theorem 12 pp.9–11; Lecture 4, Lemmas 16–18 pp.13–15; Lecture 5, Theorems 20–22 pp.20–22. Omitted proofs are identified separately..
- **TaoStationary2007:** Terence Tao, [Lecture notes 8: oscillatory integrals](https://www.math.ucla.edu/~tao/247b.1.07w/notes8.pdf). 247B, Winter 2007, author notes. Read scope: §2, Lemmas 2.3–2.8 and available proofs, pp.4–8. Only the one-dimensional route is used..
- **FIMR2012:** John Friedlander; Henryk Iwaniec; Barry Mazur; Karl Rubin, [Spins of prime ideals](https://arxiv.org/pdf/1110.6331v2). Author arXiv v2, 2012; page numbers refer to this author version. Read scope: §9, pp.39–40 in full, including the general-modulus qualification, C_n and progression reindexing. Burgess’s external proof is not contained here..
- **KoymansMilovic2018:** Peter Koymans; Djordjo Milovic, [Joint distribution of spins](https://arxiv.org/pdf/1809.09597v1). Author arXiv v1, 25 September 2018; not collated with Duke 170 (2021). Read scope: §2.5 pp.6–7, Conjecture C_n, Corollary 2.2 and its external proof reference..
- **SkorobogatovSofos2023:** Alexei Skorobogatov; Efthymios Sofos, [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf). Published Inventiones 231 (2023), 673–739. Read scope: §3 pp.691–693, Dirichlet kernels and equation (3.2); the degree-one consumer requires the one-sided kernel..
- **BrowningSawin2020:** Tim Browning; Will Sawin, [A geometric version of the circle method](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p04-s.pdf). Published Annals191 (2020),893–948. Read scope: §2, Definition2.3 and Lemma2.4 pp.903–905; §5 polarization p.932; §6 pp.935–939 in full. The independent geometric and nonarchimedean lattice suppliers retain their own ownership..
- **BCCT2005:** Jonathan Bennett; Anthony Carbery; Michael Christ; Terence Tao, [Finite bounds for Hölder–Brascamp–Lieb multilinear inequalities](https://arxiv.org/pdf/math/0505691). Author v1,31 May2005; published Math. Res. Lett.17(2010),647–666. Read scope: Theorem2.1 pp.1–2, complete critical-subspace/polytope proof §4 pp.5–8 and necessity §5. Locators use author pagination..
- **BBFL2018:** Jonathan Bennett; Neal Bez; Taryn C. Flock; Sanghyuk Lee, [Stability of the Brascamp–Lieb constant and applications](https://arxiv.org/pdf/1508.07502v2). Author v2,22 May2018; published Amer. J. Math.140(2018),543–569. Read scope: Theorems1.1–1.3 pp.2–5; uniform-basis/Gaussian proof §2.2 pp.7–9; perturbed plate Kakeya proof §3.1 pp.14–15. Gaussian extremality is external..
- **BD2015:** Jean Bourgain; Ciprian Demeter, [The proof of the ℓ² decoupling conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n1-p09-p.pdf). Published Annals182(2015),351–389. Read scope: Theorem1.1 pp.351–352; §5 linear/multilinear conversion pp.370–377; complete §6 parabola bootstrap and endpoint pp.377–383. Multilinear restriction is external..
- **SSTT2022:** Ananth N. Shankar; Arul Shankar; Yunqing Tang; Salim Tayou, [Reductions of K3 surfaces and abelian varieties](https://web.math.princeton.edu/~yunqingt/ArithGSpin.pdf). Author version; locators are its 48-page pagination. Read scope: §4.1 pp.14–18, local densities, Lemmas4.4–4.6 and Corollary4.7; §4.2 pp.19–20, weight class and Theorem4.9/Corollary4.10. Their external quadratic-form counting proof is not included..
- **GhoshSarnak2022:** Amit Ghosh; Peter Sarnak, [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3). Author final arXiv v3, 30 May 2022; 55-page pagination, not collated with the published text. Read scope: §1 pp.1–8 for the endpoint vocabulary; §9 pp.25–34 in full; Appendix A p.45; Appendix B pp.45–53, including the stated omissions. The explicit formulas are corrected using the reviewed extraction and finite counts..
- **TaoPrimes2015:** Terence Tao, [254A, Notes 8: The Hardy–Littlewood circle method](https://terrytao.wordpress.com/2015/03/22/254a-notes-8-the-hardy-littlewood-circle-method/). Author lecture notes,22 March2015; unpaginated HTML. Read scope: Theorems1–2; Fourier identities and Corollary6; Lemmas12–13 and full Theorem14/Proposition18 proofs; full Proposition24 proof §2; full Theorem2 assembly §3..
- **Niedermowwe2010:** N. Niedermowwe, [The circle method with weights](https://ftp.pdmi.ras.ru/pub/publicat/znsl/v377/p091.pdf). Published Zapiski Nauchnykh Seminarov POMI377(2010),91–110. Read scope: Complete mathematical argument pp.91–109, Gaussian/Kloosterman proof §2 and Gaussian averaging/sharp-box proof §3. The external Heath–Brown complete-sum estimate is an explicit gap..
- **BrowningHeathBrown2015:** T.D. Browning; D.R. Heath-Brown, [Forms in many variables and differing degrees](https://arxiv.org/pdf/1403.5937v2). Author v2,2 February2015; PDF date30May2018; published JEMS19(2017),357–394. Read scope: Introduction pp.3–5, Theorem1.2 and its same-degree specialization; definitions §2 pp.14–16; source proof §§4–8 pp.19–41 selected for the single-degree specialization..
- **DukeImamogluToth2016:** William Duke; Özlem İmamoğlu; Árpád Tóth, [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf). Published Annals184(2016),949–990. Read scope: Proposition2 and proof pp.968–969; Burgess is an imported finite-character estimate and the Dirichlet L-function consequence belongs to AnalyticNumberTheory..
- **BDNondegenerateCurves2015:** Jean Bourgain; Ciprian Demeter, [ℓ² decouplings for hypersurfaces with nonzero Gaussian curvature and nondegenerate curves](https://arxiv.org/pdf/1409.1634v2). Author v2; published JEMS19(2017),483–506. Read scope: Theorem1.4 p.3 and introduction pp.1–4 only. The stated curve range p≤4n−2 is checked and is insufficient for the later critical transfer..

## Source findings

These are mathematical findings with the text version and correction scope preserved. They are not independent-review verdicts. Original source passages are not reproduced.

- **`ExponentialSumsAndCircleMethod/E1`** (error), Published §8.1 p.378 and its reuse on p.379; known source issue E2.. Use AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound or /uniform-divisor-subpower-bound; absorb its constant at the explicit threshold k≥(8Cε)^(64/17). Reason: At q=120 the left side is 16 while the displayed power is about14.89222. The current small-conductor application uses ε=1/(64c) and 8Cε≤k^(17/64), not the false universal estimate.
- **`ExponentialSumsAndCircleMethod/E2`** (error), Published §8.1 pp.377–378, product-character reduction and direct period bound; known E3.. M=lcm(N1,N2) is an ambient modulus, not necessarily the primitive conductor. For the primitive inducing η and the squarefree product M2 of primes absent from its conductor M1, use M1M2|M, gcd(M1,M2)=1 and the pointwise masked-character identity. The valid direct cancellation period is M1M2. Reason: For χ8χ−8=χ−4, the ambient lcm is 8, the primitive conductor is4 and M2=1; equality fails. The present period theorem only asserts that qM is a period and does not assert minimality.
- **`ExponentialSumsAndCircleMethod/E3`** (misprint), Published Theorem6 pp.376–377 and Case1 pp.377–378; known E11.. Use ambient modulus q_i for general factors, retaining primitivity for the distinguished first factor. A principal factor's conductor is1. Permit an empty family of principal factors when M2=1; the accepted review rejects the alleged missing-case error. Reason: The finite sums depend on the displayed modulus while a principal character always has primitive conductor1. The displayed factorization permits r=s, and the original r−2 factor count remains sufficient; no extra missing-case finding is asserted.
- **`ExponentialSumsAndCircleMethod/E12`** (misprint), First additive-character orthogonality display, printed p.271 of the identified author-hosted Chapter 11 extract; not collated with the published book.. In additive-character orthogonality the exceptional argument is x=0, not x=1. Reason: Over F₂ the two additive characters have values 1,1 at zero, summing to 2, and 1,−1 at one, summing to 0. The following sentence itself says the relation solves x=0.
- **`ExponentialSumsAndCircleMethod/E13`** (misprint), Sentence before the multiplicative orthogonality display, printed p.271 of the identified author-hosted Chapter 11 extract; not collated with the published book.. The subgroup consists of characters whose orders divide δ, equivalently characters annihilated by the δ-th power map. Exact order δ is not a subgroup when δ>1. Reason: For F₅ and δ=4 the character group has four elements but only two have exact order four. The identity has order one and must belong to every subgroup.
- **`ExponentialSumsAndCircleMethod/E14`** (misprint), Opening continuation of the multiplicative Hilbert 90 paragraph, printed p.271 of the identified author-hosted Chapter 11 extract; not collated with the published book.. For the degree-n extension F_n/F, solutions of a=σ(b)/b are unique up to multiplication by F*, the fixed-field units, not by arbitrary F_n*. Reason: If b and c are two solutions, σ(c/b)=c/b, so c/b lies in F*. For F₉/F₃ the map b↦b² on eight nonzero elements has kernel {1,−1}, not all eight elements.
- **`ExponentialSumsAndCircleMethod/E15`** (error), §6 pp.33–34, nonnegative representation count and its Fourier identity, identified 1 April 2022 author-hosted lecture notes; not a published paper.. The sum T on p.34 runs from 1 to P and its kth power counts positive entries. Either call the identity a positive representation count, as Theorem6.5 later does, or include x=0 in T when retaining the nonnegative count. Reason: For degree one, two variables and m=2, nonnegative ordered representations are (0,2),(1,1),(2,0), whereas the displayed T from1to2 gives the integral count1. This packet uses positive intervals and does not conflate the two counts.
- **`ExponentialSumsAndCircleMethod/E16`** (gap), §6.1 p.34, sentence after definition of the closed major arcs, 1 April 2022 author-hosted lecture notes; visually inspected.. Impose a size condition. For denominator bound Q and closed torus radius η, 2ηQ²<1 suffices. With Q=⌊P^δ⌋ and η=P^(−d+δ), require 0<δ<d/3 and sufficiently large P. The bare condition δ>0 is not enough. Reason: With degree d=2, P=16, δ=3/2 the cutoff is64 and the radius is1/4. Both centres0and1/2 are indexed and their closed arcs meet at1/4. General separation follows from the nonzero integer ar−bq−zqr.
- **`ExponentialSumsAndCircleMethod/E17`** (misprint), §3 p.637, paragraph extending the weight exponent E, published Annals184(2016) PDF.. The weighted decoupling assertion is Theorem1.2; Theorem1.1 is the arithmetic count and has no spatial weight. Both references to Theorem1.1 in this paragraph’s dimensional/weighted induction discussion should refer to the corresponding decoupling theorem. Reason: Source Theorem1.1 onp.633 bounds J, whereas Theorem1.2 onp.635 compares weighted extension norms. The paragraph discusses induction for arbitrary w_{B,E}.
- **`ExponentialSumsAndCircleMethod/E18`** (error), Lemma6.16 pp.46–47, author-hosted 1April2022 lecture notes; statement visually inspected p.46.. Exclude the exceptional quadratic two-adic case n=p=2,v=3. The proof needs v−τ−1≥2 when p=2 and τ=1, which fails there. Treat that base separately; the blanket v>n range cannot be imported unchanged. Reason: For n=2,a=1,p=2,v=3, the square residues modulo8 occur with multiplicities2at0,4at1,2at4. Hence S(1,8)=4e(1/8), of norm4. But S(1,2)=1+e(1/2)=0, so the asserted2S(1,2) vanishes. The quadratic two-adic binomial expansion used in(13) retains the omitted4y² term.
- **`ExponentialSumsAndCircleMethod/E19`** (misprint), Proof of Lemma6.14, last Gauss-norm display p.45, author-hosted1April2022 lecture notes; visually inspected.. The first contribution is(p−1)ψ(1) when the other sum excludes1. Alternatively retain pψ(1) and subtract the sum over all residues. The proved Gauss-norm conclusion p remains correct. Reason: The immediately preceding inner additive sum is p−1 atx=1 and−1 elsewhere. A nonprincipal character has ψ(1)=1 and sum excluding1 equal−1, so the printed expression is p+1. Atp=3 the quadratic character gives4 in that expression, whereas the Gauss sum squared norm is3.
- **`ExponentialSumsAndCircleMethod/E20`** (misprint), §8.1 Step4, p.75, equations(27)–(28), visually checked; author notes1April2022.. The iterated leaf exponent is the product γ_{j₁}⋯γ_{j_L}. The prefactor exponent after L iterations is1−(Σ_jγ_j)^L, not1−Σ_jγ_j as printed in(28). Reason: Substituting an inequality into a factor A^γ multiplies, not adds, exponents. With one child of weight1/2 and two iterations the leaf exponent is1/4, not1. The total leaf mass is(Σγ)^L; geometric summation of the prefactor gives1−(Σγ)^L. The final cancellation depends on these corrected values.
- **`ExponentialSumsAndCircleMethod/E21`** (misprint), Proof of Proposition9.2, p.86, linear sum and definition of ψ; visually checked.. Both occurrences use α_{k−1}, matching the phase−h(kyθ+α_{k−1}) and the displayed argument ψ(θ,α_{k−1}). Reason: The tuple α has k−1 coordinates and no α_{k+1}. The preceding finite geometric sum has coefficient kyθ+α_{k−1}.
- **`ExponentialSumsAndCircleMethod/E22`** (misprint), Proof of Theorem8.8, p.82, final two displays; visually checked.. Use J_{k−1}(3N;b), as in the preceding identification R₂(0)=J_{k−1}(3N;b), and use this same b in the final VMV application. Reason: The source notation J_n(N;s) has2s tuple variables. R₂(0) comes from a2b-th-power integral and therefore has parameter b. At b=k(k−1)/2 the printed2b count has main size N^{3b}, while the denominator is N^b; the claimed cancellation fails.
- **`ExponentialSumsAndCircleMethod/E23`** (misprint), Lemma6.4, p.36, definition of J(P^δ), and its proof p.37; source text read.. The defining frequency domain is |γ|<P^δ. It is a symmetric bounded interval, as follows from the change of variables β=P^{−n}γ with |β|<P^{−n+δ}. Reason: The one-sided printed domain extends to negative infinity and is not the rescaled bounded major-arc integral. Page38 subsequently replaces the symmetric bounded domain by the full real line.
- **`ExponentialSumsAndCircleMethod/E24`** (misprint), Lemma6.4 proof p.37, sentence after the phase replacement; source text read.. Replace m with P^n, as in the immediately following display and the estimate m−P^n≪P^{n−1}. Reason: n is the degree and k the number of variables. Only P^n approximates m from P=ceil(m^{1/n}); replacing m by P^k has no asserted small error.
- **`ExponentialSumsAndCircleMethod/E25`** (misprint), Lemma6.12 proof p.44, final equality in the two-adic case; visually checked p.44.. For p=2 the declared γ is τ+2, so the middle expression is2^{τ+2}−1. The intended upper bound≤4n−1 remains valid. Reason: For n=2 one has τ=1,γ=3, and the printed equality says7=3. Since n=2^τn₀, the corrected2^{τ+2}≤4n still proves the claimed range.
- **`ExponentialSumsAndCircleMethod/E26`** (gap), Theorem6.13 proof p.44, use of(12) for n>2; source text read.. The proof presented covers n>2. Supply a separate quadratic primitive-solubility argument to deduce the stated n=2 case; the node using this proof is restricted to d≥3. Reason: The theorem is stated without n>2, but its proof explicitly invokes that restriction. At n=2 the only even-degree bound just proved is Γ(2)≤8, which does not imply positivity for five variables. This is a proof boundary, not a counterexample to the quadratic conclusion.
- **`ExponentialSumsAndCircleMethod/E27`** (misprint), Proof of Lemma6.3, p.36, first sum–integral inequality; author notes1April2022.. The derivative supremum is multiplied by the interval length, and the function supremum controls the endpoint error: an absolute constant times(max|f|+(B−A)max|f′|). A bounded-variation formulation suffices. Reason: For constant f=1 on[A,B]=[1−ε,1+ε],0<ε<1/2, the difference between the integral and the strict interior integer sum is1−2ε. The printed right side is2ε, so no uniform implicit constant works as ε→0. The subsequent application uses the intended corrected order.
- **`ExponentialSumsAndCircleMethod/E28`** (misprint), Box count p.554 and the two source sets at the start of§3 p.567. Version: arXiv math/0405392v1,20May2004; no publisher-scan collation.. The box-coordinate range is1≤i≤n in all three occurrences. Reason: The box has n coordinate bounds B_i, and every following determinant comparison uses all of them. Restricting the stated condition to the first coordinate would generally make the displayed count infinite.
- **`ExponentialSumsAndCircleMethod/E29`** (misprint), Lemma3 discussion and proof pp.566–567. Version: arXiv math/0405392v1,20May2004; no publisher-scan collation.. The two concluding consistency references refer to degreeδ, the fixed parameter0<δ<d, not degree d. Reason: The lemma detects a proper factor of degreeδ. A degree-d factor of the degree-d form would be the whole form, and cannot characterize this condition.
- **`ExponentialSumsAndCircleMethod/E30`** (misprint), §3 p.571, determinant column-elimination paragraph. Version: arXiv math/0405392v1,20May2004; no publisher-scan collation.. The matrix has E columns, so the remaining column count is E−1. Reason: The matrix was defined as E×E and there is no equality E=n. The following elimination argument and valuation calculation do run through all E columns.
- **`ExponentialSumsAndCircleMethod/E31`** (error), Theorem14 p.562 and bound(3.1) p.568, scoped only to the arXiv-v1 reprint; p.562 visually checked. Version: arXiv math/0405392v1,20May2004; no publisher-scan collation.. Use a positive logarithmic height, such as log(2‖F‖), or state the displayed log‖F‖ bound only for‖F‖≥2 and handle height-one forms by rescaling. The proposed node explicitly takes the second option. This finding does not claim independent confirmation in the publisher scan. Reason: For the irreducible conic F=X₁X₃−X₂² the coefficient height is1 and the normalized primitive point(0,0,1) lies in the unit box. The printed bound forces the number of auxiliary forms to be0 because log1=0, making the cover impossible. Replacing F by2F leaves the rational hypersurface and nondivisibility overℚ unchanged and repairs the small-height boundary.
- **`ExponentialSumsAndCircleMethod/E32`** (gap), Theorem8.6 p.77, 120-page Bonn notes. Use coordinate scaleN^t and the same normalized weight/volume. The notes give the intended critical transfer without a full proof; the complete perturbation proof remains a gap. Reason: The following rescaling to a top phase of degreek and lower degrees1,…,t−1 uses radiusN^t. The smaller displayed cube yields only a weaker restriction statement and does not support the subsequent argument. This is an unresolved scale/proof interface in the notes, rather than a counterexample to the displayed upper bound. The needed radiusN^t statement is planned with its complete transfer proof as an explicit gap.
- **`ExponentialSumsAndCircleMethod/E33`** (error), AppendixA p.45, sum-of-three-cubes example, arXivv3. The elementary identities give h≤2 and q≥1; no exact replacement values are asserted here. Reason: FactorX³+Y³=(X+Y)(X²−XY+Y²) and keepZ·Z². On the affine line(t,1−t,0), the form restricts to3t²−3t+1. Both identities are proved by ring normalization in Suggested.
- **`ExponentialSumsAndCircleMethod/E34`** (error), Lemma9.4 harmonic-sum estimate p.28, arXivv3. UseKA^{-1/2}, and retain the separateAK^{1/2+ε} sum of slice errors. Both fit the specified slowly growingA range. Reason: The lower summation limit is√A, so rounding its endpoint changes the sum of1/a by orderA^{-1/2}; anA^{-1} bound without an endpoint correction is not uniform in realA.
- **`ExponentialSumsAndCircleMethod/E35`** (error), Equation(9.20) p.30, arXivv3; reviewed extraction E14–E19 used for local normalizations. The Fourier delta/coarea density of one equation uses(2ε)^{-1}. Retain the original-coordinate Jacobian2 and parity lattice. Reason: A symmetric interval|F−m|<ε has normal width2ε. The density ofF(x)=x at an interior point against unit interval weight is1, which the printed normalization doubles.

## Native baseline and verification

The packet records 175 baseline declarations with pinned module locations and statement-reading provenance. The index verifies their existence; their stated `provides` fields describe the exact input used. The current-upstream screens supplement this pin without pretending that later interfaces already compile at the old pin.

This pass has 205 nodes: 52 definitions, 38 lemmas, 114 theorem contracts and one unproved-claim application boundary. The definitions have 236 API items and 178 named tests; the whole packet also retains theorem acceptance tests. There are 32 planets, 25 precise gaps and 4 stage requests. All 105 incoming node ids are retained.

The indexed blueprint checker reports zero errors and zero warnings. The complete suggested file elaborates serially at the pinned shared build, with only `sorry` warnings. Every definition API and named definition test is present as a typed declaration or a named `example` comment immediately above its typed example. Native signature omissions for analytic covers, critical curve transfer, maximal lattices, moving quaternary/negative-sector estimates and geometric line/root interfaces are recorded under PROTOCOL §13; no omitted hypothesis is replaced with an arbitrary `Prop` field or axiom. The handoff records the final check counts and the exact review frontier.
