# Exponential sums, decoupling and the circle method

This is a partial blueprint for ES.0–ES.5. Its fifty-eight declaration-sized nodes develop the small-conductor branch of Bennett–Siksek Proposition 8.2, the bounded modulus packing, the uniform numerical large-conductor saving, the CRT character factors, and the elementary finite q–van der Corput method. The complete Graham–Ringrose proof and the final Proposition 8.2 assembly remain open. Every declaration has implementation status unchecked.

The ten CRT continuation nodes preserve all thirty-five inherited node objects. The new work composes existing equivalences, reconstructs the character at all integers, identifies each component conductor, and obtains a primitive distinguished factor with the original strict factor-count bound. It imports three precise ClassicalArithmeticCompletion:CA.1 nodes: primitivity of products at coprime levels, the squarefree odd part of a quadratic conductor, and its 2-adic conductor bound. The generic binary primitivity and conductor-classification proofs stay with that owner.

## Sources and ownership

The selected source is Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums*, Annals of Mathematics 191 (2020), 355–392, DOI 10.4007/annals.2020.191.2.2. The [published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf) has SHA-256 `3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf`. The complete selected §8.1 argument, printed pp.376–379, was reread for this continuation. This is targeted reading, not whole-paper coverage. The paper's quotation of Theorem 6 is not a reading of the external Graham–Ringrose proof.

The accepted paper extraction, route review, items44 and92–97, and reviewed errata E2, E3 and E11 were checked against the selected published passage. E11's independent review narrows the earlier extraction's objection: the principal-factor family may be empty, and the original r−2 count suffices. The older report's proposed separate smooth-modulus roadmap was superseded by the accepted route8 to ES.0.

The pinned libraries are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All six reviewed AUDIT-07 rows were read before selecting work. RS-03 and its accepted review retain ES.0's analytic differencing/completion direction and import general finite-field character bounds from FF.2. Torus orthogonality in ES.1 and optimized circle-method applications in ES.4 retain their distinct contracts from AC.0 and AC.5. RS-07 supplies AN.3 for prime-progression analysis and SV.2 for Vaughan/Heath-Brown and Type I/II estimates; no retired AN layer is used. The fifty-two ES-related entries across both link directories are negative screens of varying depth, not absence proofs.

The native character carrier, primitive reduction, conductor, changeLevel and quadratic predicate are reused. Native ZMod.prodEquivPi, Units.mapEquiv, MulEquiv.piUnits and Pi.monoidHomMulEquiv already supply CRT and the finite-product homomorphism decomposition. The new crtCharacterEquiv only composes those existing maps with MulChar.mulEquivToUnitHom. It does not introduce a replacement residue ring, group of units, character structure, or primitive conductor.

The divisor-bound proof belongs to AnalyticNumberTheory:AN.5. Its exact explicit-divisor-subpower-bound and uniform-divisor-subpower-bound nodes remain the suppliers. For ε>0 and B≥exp(1/ε), the explicit bound is τ(n)≤max(1,(ε log2)⁻¹)^B n^ε for every positive n. This is a proposed supplier theorem, not an assertion that the pin implements it. Its Tao-source reading and quantified refinement are inherited provenance; the proof is not duplicated in ES.0.

## Conventions and the source interface

Natural intervals (A,B] are finite sets and are empty for B≤A. Natural subtraction and division are truncated subtraction and floor division. Reindexing m=dn changes the interval to (A div d,B div d]; an odd k uses the integers floor(k/2)+1 through k. The analytic interval (k/2,k] has exactly those integer points, but its real length is k/2. The full analytic application must use that length consistently.

Characters are native multiplicative characters on ZMod. They vanish at nonunits. The principal character is one on units and zero elsewhere; at level one every residue is a unit, including zero. Nonprincipal means unequal to that native principal character. Quadraticity is MulChar.IsQuadratic and includes principal characters. Complex norm is absolute value. Nonintegral exponents are real powers, and expressions such as 2^(−r) use signed real exponents, never natural subtraction.

For the original product set M=lcm(N₁,N₂), σ=χ₁.mul χ₂, D=cond(σ), η=σ.primitiveCharacter, and R equal to the product of primes dividing M but not D. Then gcd(D,R)=1, DR divides M, and σ(z)=η(z) times the coprimality mask for R for every integer z. DR need not equal M. Neither a period nor an ambient modulus is automatically a conductor. The older interval lemmas use q for any positive character modulus and M for any positive exclusion modulus; the application substitutes D and R into those roles.

For the CRT continuation write nᵢ for pairwise-coprime block moduli, N=∏ᵢnᵢ, and E for the native unit-group CRT equivalence. The factor in coordinate i is restriction along u↦E⁻¹(eᵢ(u)), with all other coordinates equal to one. This is a map on units, followed by native zero extension. Restricting a character along an arbitrary map on residue rings would not provide the same construction. Reconstruction is proved at every integer, not only at units.

The factor conductor is gcd(cond(χ),nᵢ). A block dividing the conductor therefore carries a primitive factor; a coprime block carries a principal one. A general grouping may carry an imprimitive nonprincipal factor. Theorem 6 permits general characters at their ambient moduli after the first factor. The endpoint supplies the exact condition it needs: an odd squarefree first modulus, a primitive first factor, and the specified size, coprimality and count bounds.

The source counts all factors as r. The new endpoint indexes a nonempty family by Fin(r+1), so its total count is r+1<10c+2. The maximum L over the other moduli is zero for a singleton family. Empty principal families are allowed. From k>2⁶⁴, all moduli≤k^(7/16), and the existing scalar threshold one obtains max(L,n₀^(1/4))n₀^(5/4)<k/2. This establishes the analytic theorem's size input, not its estimate.

For the paper's χ₁,χ₂, use the native ambient product σ, whose pointwise equality is the inherited ambient-product-evaluation. Quadraticity follows by lifting the two squared-to-one equalities and multiplying them. Every prime dividing lcm(N₁,N₂) divides an original modulus, and M≤N₁N₂≤k^(2c). Thus the large-conductor-character-blocks endpoint applies to Case1 without a false equality between ambient modulus and reduced period. The small-conductor branch is already supplied by small-conductor-product-cancellation.

## Corrected source statements

The three inherited source findings are preserved without adding an independent-review verdict. E2's universal displayed divisor bound is false: τ(120)=16 exceeds 120^(1/log log360), approximately14.8922. The usable replacement is τ(n)≤Cε n^ε uniformly for positive n, with its constant and threshold tracked by AN.5 and the numerical ES nodes.

E3 distinguishes ambient modulus from primitive conductor. The exact table identity χ₈χ₋₈=χ₋₄ has ambient modulus8, conductor4 and R=1. The corrected relation DR|M suffices for the size estimates. Shared-prime cancellation and the nonunit mask remain part of the character identity.

E11 corrects “conductor” to “modulus” for general and principal factors. The distinguished factor retains its explicit primitivity hypothesis. Its accepted review rejects the alleged missing R=1 case: the principal collection can be empty. The new continuation preserves the source's r−2 bound. No new source error or fresh global correction search is claimed; the recorded publisher, arXiv, Crossref and author-page search belongs to the inherited errata review.

## Declaration graph

The order below preserves the packet's inherited node order. Each definition and construction records the uses that determine its API and has discriminating contract tests. Named mathematical prerequisites, proof obligations and source locators are explicit.

### 1. The bounded squared divisor factor

`ExponentialSumsAndCircleMethod:ES.0/bounded-divisor-power` — lemma; unchecked.

For q>0 and natural 1≤R and r≤R, let C≥1 and suppose τ(q)≤C q^(1/(4R²)), where τ(q)=card(q.divisors). Then τ(q)^(r²)≤C^(R²) q^(1/4). All powers with nonintegral exponents are real powers.

Hypotheses and conventions:

- q is natural and positive; R,r are natural; R≥1; r≤R; C is real and C≥1. The displayed divisor estimate is a hypothesis furnished by AN.5.

Proof plan:

1. The positive integer q satisfies q≥1, so C q^(1/(4R²))≥1. Raise the nonnegative bound for τ(q) to r².

2. Since r²≤R², increase the exponent of the upper bound from r² to R², not the exponent of a base below one.

3. Distribute the ordinary power and use the real-power multiplication law: (q^(1/(4R²)))^(R²)=q^(1/4). R≥1 ensures the denominator is nonzero. This keeps the entire factor C^(R²).

Prerequisites: `mathlib:pow_le_pow_left₀`, `mathlib:pow_le_pow_right₀`, `mathlib:Real.one_le_rpow`, `mathlib:Real.rpow_natCast`, `mathlib:Real.rpow_mul`.

Acceptance:

- At R=1 and r=0 the left side is one, which is still bounded.
- The restriction R≥1 prevents a zero denominator in the selected exponent.

Sources:

- BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.

### 2. Strict saving in the divisor factor

`ExponentialSumsAndCircleMethod:ES.0/large-conductor-divisor-saving` — lemma; unchecked.

Under bounded-divisor-power’s hypotheses, if q>1 and C^(4R²)<q, then τ(q)^(r²)<q^(1/2). The constant and strict threshold cannot be discarded.

Hypotheses and conventions:

- The same q,R,r,C and divisor input as bounded-divisor-power; q>1; C^(4R²)<q.

Proof plan:

1. Raise C^(4R²)<q to the positive real exponent 1/4. Natural-to-real power compatibility gives C^(R²)<q^(1/4).

2. Multiply this strict inequality by q^(1/4)>0 and combine with bounded-divisor-power.

3. Use q^(1/4)q^(1/4)=q^(1/2). A threshold equality gives only a non-strict conclusion from these hypotheses.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/bounded-divisor-power`, `mathlib:Real.rpow_lt_rpow`, `mathlib:Real.rpow_mul`, `mathlib:Real.rpow_natCast`, `mathlib:Real.rpow_add`.

Acceptance:

- At q=1 the asserted strict saving would read 1<1 and is false.
- The arithmetic boundary C=2,R=r=1,q=16,t=4 satisfies t=Cq^(1/4), C^4=q and t=q^(1/2); it rules out strict absorption from a non-strict threshold.

Sources:

- BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.

### 3. An explicit large-conductor divisor threshold

`ExponentialSumsAndCircleMethod:ES.0/large-conductor-explicit-divisor-threshold` — theorem; unchecked.

Let R≥1 and r≤R be natural and choose B∈ℕ with exp(4R²)≤B. Put C=max(1,((1/(4R²)) log 2)⁻¹)^B. For real k>max(1,(C^(4R²))^(32/7)) and positive natural q with k^(7/32)≤q, one has τ(q)^(r²)<q^(1/2).

Hypotheses and conventions:

- R,r,B are natural; R≥1; r≤R. The displayed C is a local expression, not a new carrier or unspecified constant.

Proof plan:

1. Take ε=1/(4R²)>0. The existing AN.5 explicit-divisor-subpower-bound, with 1/ε=4R² and the supplied B, gives τ(q)≤Cq^ε and C≥1.

2. From k>(C^(4R²))^(32/7), strict real-power monotonicity at exponent 7/32 gives k^(7/32)>C^(4R²). Compose with the lower bound for q.

3. Since k>1, the same positive power gives q>1. Invoke large-conductor-divisor-saving. B may be any certified natural upper bound.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/large-conductor-divisor-saving`, `AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound`, `mathlib:Real.rpow_lt_rpow`, `mathlib:Real.rpow_mul`.

Acceptance:

- For R=1 the AN exponent is 1/4 and the B cutoff is exp 4.
- The reciprocal exponent product (32/7)(7/32)=1 is exact; the lower modulus bound is essential.

Sources:

- BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.

### 4. One divisor threshold for the bounded factor family

`ExponentialSumsAndCircleMethod:ES.0/large-conductor-eventual-divisor-saving` — theorem; unchecked.

For every real c>0 there exists a natural K≥2 such that, for every natural k≥K, positive natural q with k^(7/32)≤q, and natural r with r<10c+2, one has τ(q)^(r²)<q^(1/2). The same K works for all permitted q and r.

Hypotheses and conventions:

- c>0. Natural k,q,r; q>0. The factor-count hypothesis is an inequality after casting r to ℝ.

Proof plan:

1. Choose a natural R≥max(1,10c+2) using exists_nat_ge; then every permitted r satisfies r≤R and R≥1.

2. Choose natural B≥exp(4R²), define C by the explicit threshold node, and choose a natural K strictly larger than max(1,(C^(4R²))^(32/7)).

3. For k≥K all the explicit threshold hypotheses hold. Apply large-conductor-explicit-divisor-threshold; the choices R,B,C,K depend only on c, not on q or r.

4. The arithmetic bounded-factor-count node supplies r<10c+2 in the source application. No squarefreeness is needed for this divisor estimate.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/large-conductor-explicit-divisor-threshold`, `ExponentialSumsAndCircleMethod:ES.0/bounded-factor-count`, `mathlib:exists_nat_ge`, `mathlib:exists_nat_gt`.

Acceptance:

- For c=1 one may choose R=12 because r<12 implies r≤12.
- Replacing the family by unbounded r is invalid even at a fixed positive q>1.

Sources:

- BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.

### 5. The numerical Graham–Ringrose saving factor

`ExponentialSumsAndCircleMethod:ES.0/graham-ringrose-saving-kernel` — lemma; unchecked.

For real k≥0, q>0, t≥0 and S, and natural r, if t≤q^(1/2) and S≤2k(t/q)^(2^(−r)), then S≤2k/q^(2^(−r−1)). This is a numerical implication; an analytic estimate for a character sum is not a conclusion.

Hypotheses and conventions:

- k,q,t,S are real; k≥0; q>0; t≥0; r is natural. The nested exponent 2^(−r) is a real power, not natural subtraction.

Proof plan:

1. Divide t≤q^(1/2) by q>0 to get t/q≤q^(−1/2). Both sides are nonnegative.

2. Raise to the positive exponent 2^(−r), then multiply by 2k≥0.

3. Use (−1/2)2^(−r)=−2^(−r−1) and the native negative-real-power law. In the application t=τ(q)^(r²); the antecedent S-bound must still come from the external analytic theorem with interval length k/2.

Prerequisites: `mathlib:Real.rpow_le_rpow`, `mathlib:Real.rpow_pos_of_pos`, `mathlib:Real.rpow_mul`, `mathlib:Real.rpow_sub`, `mathlib:Real.rpow_neg`.

Acceptance:

- At r=1 the resulting denominator exponent is 1/4, not 1/2.
- At k=0 the implication preserves the upper bound S≤0.

Sources:

- BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.

### 6. Converting the modulus saving to the interval scale

`ExponentialSumsAndCircleMethod:ES.0/large-conductor-denominator-conversion` — lemma; unchecked.

For real k>0, q≥k^(7/32), S, and natural r, the bound S≤2k/q^(2^(−r−1)) implies S≤2k^(1−(7/32)2^(−r−1)).

Hypotheses and conventions:

- All bases are positive: k>0 and q≥k^(7/32)>0; r is natural.

Proof plan:

1. Raise q≥k^(7/32) to the positive exponent 2^(−r−1), giving q^(2^(−r−1))≥k^((7/32)2^(−r−1)).

2. Use antitonicity of division by a positive denominator while retaining the nonnegative numerator 2k.

3. Rewrite k/k^d=k^(1−d) with d=(7/32)2^(−r−1). No integer floor is introduced into the real interval length.

Prerequisites: `mathlib:Real.rpow_le_rpow`, `mathlib:Real.rpow_mul`, `mathlib:Real.rpow_sub`.

Acceptance:

- The factor 7/32 remains in the exponent; omitting it gives a stronger unsupported saving.

Sources:

- BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.

### 7. Margin above Bennett–Siksek’s stated exponent

`ExponentialSumsAndCircleMethod:ES.0/large-conductor-exponent-margin` — lemma; unchecked.

For c>0 and natural r<10c+2, put γ=2^(−10c−6) and d=(7/32)2^(−r−1). Then d>(7/4)γ. In particular the exponent margin d−γ exceeds (3/4)γ>0.

Hypotheses and conventions:

- c is real and positive; r is natural with its stated strict real upper bound; γ and d are explicit real expressions.

Proof plan:

1. The bound on r gives −r−1>−10c−3. Strict monotonicity of the base-two real exponential gives 2^(−r−1)>2^(−10c−3).

2. Write 2^(−10c−3)=8·2^(−10c−6)=8γ and multiply by 7/32.

3. Conclude d>(7/4)γ and subtract γ. This identifies the slack needed to absorb the factor 2; it does not suppress that factor.

Prerequisites: `mathlib:Real.rpow_lt_rpow_of_exponent_lt`, `mathlib:Real.rpow_add`, `mathlib:Real.rpow_pos_of_pos`.

Acceptance:

- For c=1 and r=11, γ=2^(−16) and d=7·2^(−17)=(7/2)γ.
- If the excluded boundary r=10c+2 is integral, the displayed comparison becomes equality d=(7/4)γ, so strictness uses the strict factor count.

Sources:

- BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.

### 8. Absorbing the remaining factor two

`ExponentialSumsAndCircleMethod:ES.0/large-conductor-constant-absorption` — lemma; unchecked.

For real k≥1, γ>0, d≥(7/4)γ and S≤2k^(1−d), if k≥2^(4/(3γ)), then S≤k^(1−γ).

Hypotheses and conventions:

- The threshold is non-strict; the bases and exponent γ are positive. No character or modulus hypothesis is needed in this numerical lemma.

Proof plan:

1. Raise k≥2^(4/(3γ)) to exponent 3γ/4 to obtain k^(3γ/4)≥2.

2. Multiply by k^(1−d)>0. The resulting power is k^(1−d+3γ/4).

3. Since d≥7γ/4, its exponent is at most 1−γ; monotonicity in the exponent for k≥1 proves the claim.

Prerequisites: `mathlib:Real.rpow_le_rpow`, `mathlib:Real.rpow_mul`, `mathlib:Real.rpow_add`, `mathlib:Real.rpow_le_rpow_of_exponent_le`.

Acceptance:

- At γ=1/4, d=7/16 and k=2^(16/3), the absorption comparison is equality.
- At k=1 and S=2, the conclusion S≤1 fails if the threshold is removed.

Sources:

- BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.

### 9. Uniform conditional large-conductor cancellation

`ExponentialSumsAndCircleMethod:ES.0/large-conductor-numeric-threshold` — theorem; unchecked.

For every c>0, put γ=2^(−10c−6). There exists a natural K≥2 such that for all natural k≥K, q>0 and r<10c+2 with k^(7/32)≤q, and every real S satisfying S≤2k(τ(q)^(r²)/q)^(2^(−r)), one has S≤k^(1−γ). The analytic inequality for S is an explicit premise, not a proved character-sum estimate.

Hypotheses and conventions:

- Natural k,q,r; c>0; q>0; the displayed lower bound and factor-count bound. S is real; γ is local notation.

Proof plan:

1. Take K₁ from large-conductor-eventual-divisor-saving. Choose a natural K₂≥2^(4/(3γ)), and let K=max(K₁,K₂). Positivity of γ follows from the positive base two.

2. For k≥K, the divisor factor is strictly below q^(1/2). Apply graham-ringrose-saving-kernel to the assumed analytic-size inequality, with t=τ(q)^(r²).

3. Apply large-conductor-denominator-conversion. The source exponent margin gives d≥7γ/4, and large-conductor-constant-absorption removes the factor 2.

4. All threshold choices depend only on c. In the intended application S is the norm of the original product-character sum over k/2<m≤k. Proving its displayed premise still requires the exact CRT character factors and the complete Graham–Ringrose proof; this theorem does not close Proposition 8.2.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/large-conductor-eventual-divisor-saving`, `ExponentialSumsAndCircleMethod:ES.0/graham-ringrose-saving-kernel`, `ExponentialSumsAndCircleMethod:ES.0/large-conductor-denominator-conversion`, `ExponentialSumsAndCircleMethod:ES.0/large-conductor-exponent-margin`, `ExponentialSumsAndCircleMethod:ES.0/large-conductor-constant-absorption`, `mathlib:exists_nat_ge`, `mathlib:Real.rpow_pos_of_pos`.

Acceptance:

- The statement keeps q and r universally quantified after K, expressing uniformity.
- There is no assertion that every nonnegative S satisfies the analytic-size premise.

Sources:

- BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation. Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction.

### 10. Divisor in a smooth-modulus window

`ExponentialSumsAndCircleMethod:ES.0/smooth-divisor-window` — lemma; unchecked.

Let T > 1 be real and N a natural number with T ≤ N. If every prime p dividing N satisfies p ≤ T², then there is a natural divisor d of N with T ≤ d ≤ T².

Hypotheses and conventions:

- N is automatically positive. Squarefreeness is not required for this divisor-extraction step. Bounds on natural numbers are comparisons after casting to ℝ.

Proof plan:

1. Use strong induction on N. Since N > 1, Nat.ne_one_iff_exists_prime_dvd supplies a prime p dividing N.

2. If p ≥ T, choose d = p; the smoothness hypothesis gives p ≤ T².

3. If p < T, write N = pA with A = N div p < N. Every prime divisor of A divides N. If A ≥ T, apply the induction hypothesis to A and compose divisibility.

4. If A < T, then N = pA ≤ T². Choose d = N, which still satisfies N ≥ T. This proves the window without an ordering of the prime factors or a new smooth-number predicate.

Prerequisites: `mathlib:Nat.ne_one_iff_exists_prime_dvd`.

Acceptance:

- T = 3, N = 30 permits d = 6; primality of the selected block is not required.
- T = 5, N = 6 permits d = N, illustrating the final induction branch.
- T = 3, N = 11 has no divisor in [3,9]; the bound on prime factors cannot be dropped.

Sources:

- BennettSiksek2020, §8.1, printed pp.377–378, Case 1, factor conditions (a)–(c). Worker-derived extraction lemma exposing the arithmetic behind the asserted grouping of prime factors; not a separately numbered theorem of the source.

### 11. Pairwise-coprime bounded blocks of a squarefree modulus

`ExponentialSumsAndCircleMethod:ES.0/squarefree-modulus-blocks` — theorem; unchecked.

Let T > 1, let N be squarefree, and suppose every prime divisor p of N is at most T². There exist a list B of natural numbers and a residual integer u with 0 < u < T, u·∏B = N, every b in B in [T,T²], the entries of B pairwise coprime, and gcd(u,∏B) = 1.

Hypotheses and conventions:

- The list and residual use the existing List, product, Squarefree and Nat.Coprime carriers. No new factorization object is defined.
- N = 1 is allowed and gives B empty, u = 1. The residual may equal one. Since T > 1, every listed block exceeds one.

Proof plan:

1. Use strong induction on N. Squarefreeness implies N ≠ 0. If N < T, take the empty list and residual N.

2. Otherwise extract d in [T,T²] by ES.0/smooth-divisor-window and write N = dA, A = N div d < N.

3. Nat.squarefree_mul_iff supplies squarefreeness of A and gcd(d,A) = 1. Prime-factor bounds pass to A, so apply the induction hypothesis to obtain A = u·∏B.

4. Prepend d. The product identity follows by associativity and commutativity. From gcd(d,u·∏B) = 1 obtain coprimality with u and with each member of B using Nat.coprime_list_prod_right_iff. These give pairwise coprimality of the enlarged list and coprimality of u with its product.

5. If N ≥ T the list cannot be empty, because the product identity would force N = u < T. Each block and the residual divide N; hence they inherit squarefreeness and, when N is odd, oddness.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/smooth-divisor-window`, `mathlib:Nat.squarefree_mul_iff`, `mathlib:Nat.coprime_of_squarefree_mul`, `mathlib:Nat.coprime_list_prod_right_iff`, `mathlib:Squarefree.squarefree_of_dvd`, `mathlib:Odd.of_dvd_nat`.

Acceptance:

- T = 3, N = 210: B = [3,5,7], u = 2 satisfies all assertions.
- T = 8, N = 1: the list is empty and u = 1. No nonempty-family convention is imposed.
- N = 36, T = 3 can yield [3,3,4] by unrestricted repeated extraction; pairwise coprimality fails without squarefreeness.

Sources:

- BennettSiksek2020, §8.1, printed pp.377–378, Case 1, factor conditions (a)–(e). Makes the bounded prime-block grouping and its single residual explicit. It permits an empty list instead of assuming every family has a last block.

### 12. Bounded CRT modulus blocks

`ExponentialSumsAndCircleMethod:ES.0/bounded-crt-modulus-blocks` — theorem; unchecked.

Let T ≥ 8 and a,Q,R be natural numbers with 0 < a ≤ 8, Q and R squarefree, Q odd, Q ≥ T, gcd(Q,R) = 1 and gcd(a,QR) = 1. Suppose every prime divisor of Q or R is at most T². Then there exist q and a list B such that q divides Q, q is odd and squarefree, T ≤ q ≤ T², the product of q::B is aQR, its entries are pairwise coprime and all in (1,T²], and at most two entries of B are less than T.

Hypotheses and conventions:

- This is a pure modulus-packing theorem. In the intended application a is the bounded 2-primary factor of the primitive conductor, Q its odd part, and R the excluded-prime product. The theorem does not prove that a given character has such a conductor decomposition.
- R = 1 is explicitly permitted. Unit factors are removed. The distinguished factor comes from Q, not from the principal exclusion modulus.

Proof plan:

1. Apply ES.0/squarefree-modulus-blocks separately to Q and R, obtaining Q = u·∏U and R = v·∏V with 1 ≤ u,v < T and every full block in [T,T²].

2. Since Q ≥ T, U is nonempty. Choose its first entry q. It divides Q, so inherits oddness and squarefreeness; it also satisfies the required lower and upper bounds.

3. Replace the primitive residual u by au. Since a ≤ 8 ≤ T and u < T, au ≤ 8T ≤ T². The principal residual v is also below T². Both are positive; no squarefreeness of a is needed because a is kept inside this single block.

4. Concatenate U, [au], V and [v], then delete entries equal to one. List.prod_filter_bne_one preserves the product. The first entry q remains since q ≥ T > 1.

5. Within each family, coprimality follows from the packing theorem. The assumptions gcd(Q,R) = 1 and gcd(a,QR) = 1 give all cross-family coprimalities and coprimality of au with the other primitive blocks. Use divisibility of each factor into its family product; filtering preserves pairwise coprimality.

6. Every surviving full block is at least T. Only au and v can be smaller, so after taking out the distinguished q there are at most two small entries. If R = 1, its full-block list is empty and v = 1 is deleted; no principal factor is inserted artificially.

7. Reindexing the resulting list by its positions provides the hypotheses of ES.0/bounded-factor-count. This gives the source's r−2 count, including an empty principal family, without replacing it by an unnecessary weaker factor bound. Character restriction and reconstruction along CRT remain a separate unclosed interface.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/squarefree-modulus-blocks`, `mathlib:List.prod_filter_bne_one`, `mathlib:Nat.coprime_list_prod_right_iff`, `mathlib:Squarefree.squarefree_of_dvd`, `mathlib:Odd.of_dvd_nat`.

Acceptance:

- T = 8, a = 4, Q = 11, R = 3 gives q::B = [11,4,3]. Both residual blocks are small: an r−1 large-block count would be false.
- T = 8, a = 1, Q = 105, R = 1 permits [15,7]; the principal family contributes no factor.
- T = 8, a = 1, Q = 11, R = 1 permits the one-factor list [11]. Empty maxima in the analytic threshold must then be handled by the distinguished q term alone.
- A residual au = 8·7 = 56 at T = 8 lies below T² = 64; retaining the bounded a in a separate extra small block would lose the sharp two-exception count.

Sources:

- BennettSiksek2020, §8.1, printed pp.377–378, Case 1, (a)–(e) and r−2 bound; accepted E11 review. Arithmetic part of routed item 95. The accepted errata review allows the principal family to be empty; this theorem keeps that convention and the original two-residual count. It does not claim the external Graham–Ringrose proof or the character CRT adapters are supplied.

### 13. Factor count with two exceptional blocks

`ExponentialSumsAndCircleMethod:ES.0/bounded-factor-count` — lemma; unchecked.

Let k > 1, c > 0, qᵢ ≥ 1 for i in Fin r, and let E be a subset of Fin r with at most two members. Suppose qᵢ ≥ k^(7/32) whenever i is outside E, and ∏ᵢqᵢ ≤ k^(2c). Then r < 10c + 2. All inequalities and the product bound are interpreted in ℝ.

Hypotheses and conventions:

- The exceptional set is an input identifying the at most two residual blocks from ES.0/bounded-crt-modulus-blocks. The result also permits r = 0 or 1.
- Neither distinctness nor primality of the qᵢ is needed for this numerical bound. Positivity follows from qᵢ ≥ 1.

Proof plan:

1. Each exceptional factor contributes a nonnegative logarithm. Each of the r−|E| other factors contributes at least (7/32)log k, by logarithmic monotonicity and Real.log_rpow.

2. Sum and use Real.log_prod. The product bound gives (r−|E|)(7/32)log k ≤ 2c log k.

3. Since log k > 0, divide to obtain r ≤ (64/7)c + |E| ≤ (64/7)c + 2. Because c > 0 and 64/7 < 10, the claimed strict bound follows.

4. The packing theorem supplies E after indexing the list; the ambient source bound aQR ∣ lcm(N₁,N₂) ≤ N₁N₂ ≤ k^(2c) is used as an inequality, never the false equality between ambient modulus and reduced period.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/bounded-crt-modulus-blocks`, `mathlib:Real.log_prod`, `mathlib:Real.log_le_log`, `mathlib:Real.log_nonneg`, `mathlib:Real.log_pos`, `mathlib:Real.log_rpow`.

Acceptance:

- For r ≤ 2 the result is consistent even if all factors are exceptional.
- The coefficient is 64/7, not 32/7, because the ambient product bound is k^(2c).
- Three small factors cannot be allowed: take k = 2³², c = 3/64, and q₁=q₂=q₃=2. The product is k^(2c)=8, but 3 < 10c+2 is false.

Sources:

- BennettSiksek2020, §8.1, printed p.378, displayed r−2 logarithmic bound. Makes the strict numerical constant and the two exceptional blocks explicit. This estimate is independent of the unproved analytic character-sum bound.

### 14. Interval length for the smooth-modulus estimate

`ExponentialSumsAndCircleMethod:ES.0/graham-ringrose-interval-threshold` — lemma; unchecked.

Let k > 2⁶⁴ be real, let 0 ≤ q ≤ k^(7/16), and let L ≤ k^(7/16). Then max(L,q^(1/4))·q^(5/4) ≤ k^(63/64) < k/2.

Hypotheses and conventions:

- In the application L is an upper bound for the other moduli; L = 0 is allowed when there are no other factors. No character estimate is a hypothesis or a conclusion.
- The first inequality only needs k > 1. The displayed combined contract uses the explicit strict threshold k > 2⁶⁴ for the second inequality.

Proof plan:

1. Monotonicity of real powers gives q^(1/4) ≤ k^(7/64) ≤ k^(7/16), so the maximum is at most k^(7/16). Also q^(5/4) ≤ k^(35/64).

2. Multiply these nonnegative upper bounds and use Real.rpow_add to get exponent 7/16 + 35/64 = 63/64.

3. Raise k > 2⁶⁴ to the positive exponent 1/64, obtaining k^(1/64) > 2. Multiply by k^(63/64) > 0 and use the exponent sum one to get 2k^(63/64) < k.

4. Thus the quoted analytic theorem's lower bound R₀ is below the real interval length k/2 once the factor moduli have the stated cap. This establishes the length condition only, not the quoted estimate or its full source decomposition.

Prerequisites: `mathlib:Real.rpow_le_rpow`, `mathlib:Real.rpow_lt_rpow`, `mathlib:Real.rpow_le_rpow_of_exponent_le`, `mathlib:Real.rpow_mul`, `mathlib:Real.rpow_add`, `mathlib:Real.rpow_natCast`.

Acceptance:

- At k = 2⁶⁴ the second comparison is equality, so the strict threshold cannot be weakened to k ≥ 2⁶⁴.
- At k = 2¹²⁸ the comparison is 2¹²⁶ < 2¹²⁷.
- L = 0 retains the q^(1/4) term for a one-factor decomposition; an undefined empty maximum is not used.

Sources:

- BennettSiksek2020, §8.1, printed p.378, displayed R₀ inequality. Pure size calculation underlying the use of Theorem 6; supplies an explicit threshold omitted under the source's sufficiently-large-k convention.

### 15. Zero-mean periodic interval remainder

`ExponentialSumsAndCircleMethod:ES.0/periodic-interval-remainder` — lemma; unchecked.

For f:N→C, q>0, f(n+q)=f(n) and Σ_{0≤j<q}f(j)=0, and any natural A,B, Σ_{A<m≤B}f(m)=Σ_{0≤j<(B−A) mod q}f(A+j+1). Subtraction is truncated natural subtraction.

Hypotheses and conventions:

- No ordering assumption on A,B.
- No norm bound on f is needed.

Proof plan:

1. If B≤A, both finite index sets are empty, so conclude directly.

2. For B>A, use the existing natural interval enumeration m=A+j+1 with 0≤j<B−A.

3. The sum f(1)+...+f(q) equals the range-q sum by f(q)=f(0). Moving a length-q block one step replaces f(a+1) by f(a+q+1), which is equal by periodicity; induction gives zero for every shifted full block.

4. Write B−A=tq+r with 0≤r<q. Reindex the first tq entries by t blocks of length q; each block contributes zero.

5. In the remaining r entries, apply periodicity t times to replace f(A+tq+j+1) by f(A+j+1).

Prerequisites: `mathlib:Function.Periodic`, `mathlib:Nat.card_Ioc`.

Uses:

- the incomplete η-sums on p.379: Removes complete periods before taking norms.

API:

- `TauCeti.ExponentialSumsPlan.periodic_interval_remainder` (relation): For f:N→C, q>0, f(n+q)=f(n) and Σ_{0≤j<q}f(j)=0, and any natural A,B, Σ_{A<m≤B}f(m)=Σ_{0≤j<(B−A) mod q}f(A+j+1). Subtraction is truncated natural subtraction.

Contract tests:

- `character_three_complete` (computation): For the integer χ3 table (0,1,−1), Σ_{0<n≤2}χ3(n)=0.

- `reversed_interval` (degenerate): Σ_{5<n≤4}(n:Z)=0.

Acceptance:

- For f(n)=(0,1,−1) indexed by n mod 3, the interval (0,2] sums to zero and (1,2] sums to −1.
- When q divides B−A, the sum is zero for every starting point.
- For B<A, both sides are zero; no signed-interval convention is used.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; the incomplete η-sums on p.379. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.

### 16. Norm bound by the residual interval length

`ExponentialSumsAndCircleMethod:ES.0/periodic-interval-norm` — lemma; unchecked.

Under the hypotheses of periodic-interval-remainder, also assume ‖f(n)‖≤1 for every natural n. Then ‖Σ_{A<m≤B}f(m)‖≤((B−A) mod q), with the natural remainder cast to R.

Hypotheses and conventions:

- q>0; zero mean over a complete period; pointwise norm at most one.

Proof plan:

1. Rewrite the interval sum with periodic-interval-remainder.

2. Apply the finite-sum triangle inequality.

3. Bound each of the r summands by one, and evaluate the cardinality of range r. In particular this proves a bound strictly less than q, although the exported character adapter uses the weaker ≤q.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/periodic-interval-remainder`, `mathlib:norm_sum_le`.

Uses:

- the bound for each inner η-sum on p.379: Avoids the unnecessary 2q loss from subtracting two prefix estimates.

API:

- `TauCeti.ExponentialSumsPlan.periodic_interval_norm` (relation): Under the hypotheses of periodic-interval-remainder, also assume ‖f(n)‖≤1 for every natural n. Then ‖Σ_{A<m≤B}f(m)‖≤((B−A) mod q), with the natural remainder cast to R.

Contract tests:

- `character_three_singleton` (computation): For the same table, Σ_{1<n≤2}χ3(n)=−1.

Acceptance:

- The χ3 table on (1,2] has norm 1 and remainder length 1, so equality occurs.
- A length-q interval has bound zero, not q.
- Scaling a nonzero zero-mean sequence by 2 can violate the bound: the pointwise hypothesis is essential.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; the bound for each inner η-sum on p.379. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.

### 17. Incomplete nonprincipal character bound

`ExponentialSumsAndCircleMethod:ES.0/character-interval-bound` — lemma; unchecked.

For q>0 and a nonprincipal complex Dirichlet character χ modulo q, ‖Σ_{A<m≤B}χ(m)‖≤q for all natural A,B. Values are taken by natural casting into ZMod q.

Hypotheses and conventions:

- Nonprincipal means χ≠1 in the existing character monoid.
- Neither primitive nor quadratic is assumed.

Proof plan:

1. The character is q-periodic because q casts to zero in ZMod q.

2. Identify the q natural representatives 0,...,q−1 bijectively with ZMod q; use MulChar.sum_eq_zero_of_ne_one over C for the zero complete sum.

3. Use DirichletCharacter.norm_le_one pointwise.

4. Apply periodic-interval-norm; since q>0, the natural remainder is <q and hence ≤q.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/periodic-interval-norm`, `mathlib:DirichletCharacter`, `mathlib:ZMod.natCast_self`, `mathlib:MulChar.sum_eq_zero_of_ne_one`, `mathlib:DirichletCharacter.norm_le_one`.

Uses:

- p.379, inner sums indexed by k/(2d)<n≤k/d: Provides the uniform bound after each divisor reindexing.

API:

- `TauCeti.ExponentialSumsPlan.character_interval_bound` (relation): For q>0 and a nonprincipal complex Dirichlet character χ modulo q, ‖Σ_{A<m≤B}χ(m)‖≤q for all natural A,B. Values are taken by natural casting into ZMod q.

Contract tests:

- `constant_nonexample` (non-example): The constant-one function sums to 12 on (0,12]; bounded values alone do not imply a bound by a fixed period.

Acceptance:

- The nonprincipal character modulo 3 has values (0,1,−1), and its (1,2] sum is −1.
- The principal character modulo 3 sums to 8 on (0,12], exceeding q=3.
- An imprimitive but nonprincipal character is allowed; conductor need not equal q.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.379, inner sums indexed by k/(2d)<n≤k/d. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.

### 18. Reindexing divisible interval entries

`ExponentialSumsAndCircleMethod:ES.0/divisible-interval-reindex` — lemma; unchecked.

For f:N→C, natural A,B and d>0, Σ_{m∈(A,B], d|m}f(m)=Σ_{A div d<n≤B div d}f(dn), where div is natural floor division.

Hypotheses and conventions:

- d>0 is required for injectivity and division.
- Both interval endpoints are divided, and the lower endpoint remains open.

Proof plan:

1. Map n to dn. Division with remainder gives A<dn iff A div d<n, and dn≤B iff n≤B div d.

2. Positive multiplication is injective, so no weight or multiplicity is introduced.

3. For each divisible m in the left index set, m=d(m div d); its quotient satisfies the right inequalities.

4. Use the finite-sum bijection. If B≤A both sides are empty because floor division is monotone.

Prerequisites: `mathlib:Nat.card_Ioc`.

Uses:

- p.379, change from m to nd: Records both floors rather than suppressing endpoint conventions.

API:

- `TauCeti.ExponentialSumsPlan.divisible_interval_reindex` (relation): For f:N→C, natural A,B and d>0, Σ_{m∈(A,B], d|m}f(m)=Σ_{A div d<n≤B div d}f(dn), where div is natural floor division.

Contract tests:

- `divisible_sum_floor` (computation): Σ_{2<n≤7,3|n}(n:C)=9.

- `divisible_sum_open_left` (computation): Σ_{3<n≤6,3|n}(n:C)=6.

- `divisible_sum_empty` (degenerate): Σ_{1<n≤2,3|n}(n:C)=0.

Acceptance:

- For f(n)=n, A=2,B=7,d=3, both sides sum 3+6=9.
- For A=3,B=6,d=3, only m=6 survives; including the lower endpoint would wrongly add 3.
- For A=1,B=2,d=3 there are no terms; rounding an upper endpoint upward gives a wrong term.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.379, change from m to nd. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.

### 19. Weighted coprimality expansion

`ExponentialSumsAndCircleMethod:ES.0/coprime-moebius-expansion` — lemma; unchecked.

For f:N→C and natural A,B,M with M>0, Σ_{A<m≤B}1_{gcd(m,M)=1}f(m)=Σ_{d|M}μ(d) Σ_{A<m≤B,d|m}f(m), with μ(d) cast from Z to C and d ranging over M.divisors.

Hypotheses and conventions:

- M>0; no squarefreeness assumption.
- The coprimality factor means f(m) if Nat.Coprime m M and zero otherwise, not a newly defined carrier.

Proof plan:

1. For each m, gcd(m,M)>0 because M>0.

2. Evaluate moebius_mul_coe_zeta at gcd(m,M), use coe_mul_zeta_apply and one_apply, and obtain Σ_{d|gcd(m,M)}μ(d)=1 if gcd(m,M)=1 and zero otherwise.

3. A positive d divides gcd(m,M) exactly when it divides both m and M. Replace this divisor sum by the divisor set of M filtered by d|m.

4. Multiply by f(m), distribute and interchange the two finite sums. Coerce the integer identity to C; no infinite summability input is involved.

Prerequisites: `mathlib:ArithmeticFunction.moebius`, `mathlib:ArithmeticFunction.moebius_mul_coe_zeta`, `mathlib:ArithmeticFunction.coe_mul_zeta_apply`, `mathlib:ArithmeticFunction.one_apply`, `mathlib:Nat.divisors`, `mathlib:Nat.mem_divisors`.

Uses:

- p.378, Möbius divisor identity; p.379, first finite interchange: Uses the existing arithmetic function and gcd instead of rebuilding either.

API:

- `TauCeti.ExponentialSumsPlan.coprime_moebius_expansion` (relation): For f:N→C and natural A,B,M with M>0, Σ_{A<m≤B}1_{gcd(m,M)=1}f(m)=Σ_{d|M}μ(d) Σ_{A<m≤B,d|m}f(m), with μ(d) cast from Z to C and d ranging over M.divisors.

Contract tests:

- `moebius_one` (degenerate): Σ_{d|1}μ(d)=1.

- `moebius_six` (computation): Σ_{d|6}μ(d)=0.

- `moebius_four` (computation): Σ_{d|4}μ(d)=0.

Acceptance:

- M=1 retains every term, since its only divisor is 1 with μ(1)=1.
- For M=4, μ(4)=0 and the expansion is still correct; squarefreeness is not needed.
- M=0 is excluded: its library divisor set is empty, but the interval containing m=1 can have a nonzero coprime contribution.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.378, Möbius divisor identity; p.379, first finite interchange. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.

### 20. Möbius expansion of an excluded character sum

`ExponentialSumsAndCircleMethod:ES.0/character-exclusion-expansion` — lemma; unchecked.

For a complex Dirichlet character χ modulo any natural q and M>0, Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)=Σ_{d|M}μ(d)χ(d)Σ_{A div d<n≤B div d}χ(n).

Hypotheses and conventions:

- q may be zero for this algebraic identity; positivity is imposed only for the subsequent finite-period bound.
- M may share prime factors with q and may be nonsquarefree.

Proof plan:

1. Apply coprime-moebius-expansion to the character-value function.

2. Every d in M.divisors is positive by Nat.pos_of_mem_divisors; apply divisible-interval-reindex to each inner sum.

3. Use multiplicativity χ(dn)=χ(d)χ(n), including zero values at nonunits.

4. Move the fixed scalar χ(d) outside its inner finite sum and associate the factors in C.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/coprime-moebius-expansion`, `ExponentialSumsAndCircleMethod:ES.0/divisible-interval-reindex`, `mathlib:DirichletCharacter`, `mathlib:Nat.pos_of_mem_divisors`.

Uses:

- p.379, final Möbius expansion: Exposes the only analytic input needed by each divisor term.

API:

- `TauCeti.ExponentialSumsPlan.character_exclusion_expansion` (relation): For a complex Dirichlet character χ modulo any natural q and M>0, Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)=Σ_{d|M}μ(d)χ(d)Σ_{A div d<n≤B div d}χ(n).

Contract tests:

- `moebius_square` (computation): μ(4)=0.

Acceptance:

- For χ3, M=2 and interval (0,2], the excluded sum is 1, not the unrestricted sum zero.
- For χ3 and M=3, divisors containing 3 contribute χ(3)=0; no coprimality hypothesis between q and M is required.
- Replacing M=2 by M=4 leaves the coprimality filter unchanged; μ(4)=0 makes the divisor expression compatible.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.379, final Möbius expansion. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.

### 21. Divisor-weighted character bound

`ExponentialSumsAndCircleMethod:ES.0/character-exclusion-bound` — theorem; unchecked.

For q>0, nonprincipal χ modulo q, M>0, and natural A,B, ‖Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)‖≤τ(M)q, where τ(M)=card(M.divisors).

Hypotheses and conventions:

- No primitivity, quadraticity, squarefreeness or gcd(q,M)=1 assumption.
- The inequality is non-strict and uniform in both endpoints.

Proof plan:

1. Use character-exclusion-expansion and the finite-sum triangle inequality.

2. Each coefficient μ(d)χ(d) has norm at most one: combine abs_moebius_le_one after scalar coercion and DirichletCharacter.norm_le_one.

3. Apply character-interval-bound to the interval with endpoints A div d and B div d; it is valid even when that interval is empty.

4. There are exactly τ(M) divisor terms, each bounded by q, so their sum is at most τ(M)q.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/character-exclusion-expansion`, `ExponentialSumsAndCircleMethod:ES.0/character-interval-bound`, `mathlib:ArithmeticFunction.abs_moebius_le_one`, `mathlib:DirichletCharacter.norm_le_one`, `mathlib:norm_sum_le`.

Uses:

- p.379, final displayed character-sum bound: Supplies the small-conductor cancellation input after a separately owned divisor estimate.

API:

- `TauCeti.ExponentialSumsPlan.character_exclusion_bound` (relation): For q>0, nonprincipal χ modulo q, M>0, and natural A,B, ‖Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)‖≤τ(M)q, where τ(M)=card(M.divisors).

Contract tests:

- `divisor_count_six` (computation): card(6.divisors)=4.

- `divisor_count_one` (degenerate): card(1.divisors)=1.

- `divisor_count_counterexample` (non-example): card(120.divisors)=16.

Acceptance:

- M=1 gives the ordinary bound q, since τ(1)=1.
- For M=6 there are four divisor terms and the stated upper bound is 4q, not 2q.
- τ(120)=16; the estimate makes no use of a false all-q logarithmic upper bound for τ.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.379, final displayed character-sum bound. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.

### 22. Zero mean for the excluded product period

`ExponentialSumsAndCircleMethod:ES.0/exclusion-complete-period` — lemma; unchecked.

For q>0, nonprincipal χ modulo q and M>0, Σ_{0<m≤qM}1_{gcd(m,M)=1}χ(m)=0. The integer qM is a period, not an assertion about primitive conductor.

Hypotheses and conventions:

- No gcd(q,M)=1 or squarefree M restriction.

Proof plan:

1. Apply character-exclusion-expansion with A=0,B=qM.

2. If d divides M then (qM) div d=q(M div d), so each inner character sum has length divisible by q.

3. The q-periodicity and zero complete character sum established in the proof of character-interval-bound give the hypotheses of periodic-interval-remainder; use it with this divisible length to get zero.

4. Every weighted term is zero, hence so is the finite divisor sum.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/character-exclusion-expansion`, `ExponentialSumsAndCircleMethod:ES.0/periodic-interval-remainder`, `mathlib:ZMod.natCast_self`, `mathlib:MulChar.sum_eq_zero_of_ne_one`, `mathlib:Nat.mem_divisors`.

Uses:

- p.378, direct period estimate in Case 2: Justifies the complete-period cancellation for the masked character.

API:

- `TauCeti.ExponentialSumsPlan.exclusion_complete_period` (relation): For q>0, nonprincipal χ modulo q and M>0, Σ_{0<m≤qM}1_{gcd(m,M)=1}χ(m)=0. The integer qM is a period, not an assertion about primitive conductor.

Contract tests:

- `excluded_complete_period` (computation): For the integer χ3 table, Σ_{0<n≤6, gcd(n,2)=1}χ3(n)=0.

Acceptance:

- For χ3 and M=2, the interval (0,6] contributes 1−1=0.
- For M=1 this is the usual complete-period cancellation.
- For χ3 and M=3 the interval (0,9] also sums to zero, despite shared prime factors.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.378, direct period estimate in Case 2. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.

### 23. Product-period character bound

`ExponentialSumsAndCircleMethod:ES.0/exclusion-direct-period-bound` — theorem; unchecked.

For q>0, nonprincipal χ modulo q, M>0, and natural A,B, ‖Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)‖≤qM.

Hypotheses and conventions:

- qM is only a valid period; it need not be the least period or an ambient conductor.

Proof plan:

1. Write F(m) for the existing expression equal to χ(m) when m is coprime to M and zero otherwise; this is local notation, not a new definition node.

2. The character factor is qM-periodic by q-periodicity. The indicator is qM-periodic by the existing coprimality invariance under adding multiples of M. Thus F is qM-periodic and has norm at most one.

3. Use exclusion-complete-period and F(qM)=F(0) to turn the sum over (0,qM] into the range-qM zero mean required by periodic-interval-norm.

4. Apply that bound with qM>0 and weaken the remainder bound to qM.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/exclusion-complete-period`, `ExponentialSumsAndCircleMethod:ES.0/periodic-interval-norm`, `mathlib:Nat.coprime_add_mul_right_right`, `mathlib:DirichletCharacter.norm_le_one`, `mathlib:ZMod.natCast_self`.

Uses:

- p.378, the direct bound preceding the assumption on M₂: Keeps the valid period estimate without the source's false modulus equality.

API:

- `TauCeti.ExponentialSumsPlan.exclusion_direct_period_bound` (relation): For q>0, nonprincipal χ modulo q, M>0, and natural A,B, ‖Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)‖≤qM.

Contract tests:

- `nonsquarefree_mask` (compatibility): For the χ3 table on (0,6], the sums restricted by gcd(n,2)=1 and gcd(n,4)=1 are equal.

Acceptance:

- For χ3 and M=4, the bound is 12 although the masked sequence already has period 6; least-period minimality is not claimed.
- M=1 returns the ordinary q bound.
- The character identity χ8χ−8=χ−4 has ambient lcm 8 but primitive conductor 4; period and conductor cannot be conflated.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.378, the direct bound preceding the assumption on M₂. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.

### 24. Small-conductor square-root saving

`ExponentialSumsAndCircleMethod:ES.0/small-conductor-power-saving` — theorem; unchecked.

Let c>0, C≥1 and assume τ(M)≤C M^(1/(64c)) for every positive natural M. If k≥1 is natural with 8C≤k^(17/64), q>0, χ modulo q is nonprincipal, M>0, q≤8k^(7/32), and M≤k^c, then ‖Σ_{k div 2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2). All powers in the hypotheses and conclusion are real powers of nonnegative casts.

Hypotheses and conventions:

- The divisor estimate is an explicit hypothesis of this conditional adapter; the new unconditional supplier-instantiation nodes below import it from AN.5.
- The conclusion is this small-conductor branch, not the full distinct-quadratic-character proposition.

Proof plan:

1. Apply character-exclusion-bound to A=k div 2 and B=k.

2. Put ε=1/(64c)>0. Monotonicity of nonnegative real powers gives M^ε≤(k^c)^ε=k^(1/64); justify the exponent simplification using c>0 and k≥1.

3. The assumed divisor bound and q≤8k^(7/32) now give τ(M)q≤8C k^(15/64).

4. Multiply 8C≤k^(17/64) by the nonnegative k^(15/64) and use the real-power addition law: 17/64+15/64=1/2.

5. This proof needs no artificial split at M=k^(3/4); AN.5 supplies a uniform constant for every positive M.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/character-exclusion-bound`, `mathlib:Real.rpow_le_rpow`, `mathlib:Real.rpow_mul`, `mathlib:Real.rpow_add`.

Uses:

- pp.378–379, end of Case 2, using the corrected divisor estimate: Makes constant dependence and the large-k threshold explicit.

API:

- `TauCeti.ExponentialSumsPlan.small_conductor_power_saving` (relation): Let c>0, C≥1 and assume τ(M)≤C M^(1/(64c)) for every positive natural M. If k≥1 is natural with 8C≤k^(17/64), q>0, χ modulo q is nonprincipal, M>0, q≤8k^(7/32), and M≤k^c, then ‖Σ_{k div 2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2). All powers in the hypotheses and conclusion are real powers of nonnegative casts.

Contract tests:

- `odd_half_endpoint` (computation): Natural floor division gives 7 div 2=3.

- `saving_exponents` (computation): As real numbers, 7/32+1/64+17/64=1/2.

Acceptance:

- The exact exponent identity is 7/32+1/64+17/64=1/2.
- For odd k=7 the index interval begins after floor(7/2)=3, so it contains 4,5,6,7.
- Neither c=0 nor deletion of the lower-threshold condition is permitted; the reciprocal exponent and constant absorption need the stated hypotheses.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; pp.378–379, end of Case 2, using the corrected divisor estimate. The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper.

### 25. Explicit excluded-character subpower bound

`ExponentialSumsAndCircleMethod:ES.0/character-exclusion-explicit-subpower-bound` — theorem; unchecked.

For ε>0 and a natural B≥exp(1/ε), every nonprincipal complex character χ modulo q>0, positive exclusion modulus M and natural endpoints A,Z satisfy ‖Σ_{A<m≤Z}1_{gcd(m,M)=1}χ(m)‖≤D^B q M^ε, where D=max(1,(ε log2)⁻¹).

Hypotheses and conventions:

- ε>0; B natural with exp(1/ε)≤B; q>0; χ≠1; M>0; A,Z natural with no ordering assumption.

Proof plan:

1. Apply character-exclusion-bound to bound the norm by τ(M)q.

2. Import AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound at ε,B,M, obtaining τ(M)≤D^B M^ε.

3. Multiply by q≥0 and rearrange the real factors. Neither the divisor function nor its subpower proof is duplicated.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/character-exclusion-bound`, `AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound`.

Uses:

- Bennett–Siksek §8.1 Case2; routed item97: Instantiate the separate AN.5 divisor supplier, keeping all constant/threshold dependencies explicit.

API:

- `TauCeti.ExponentialSumsPlan.character_exclusion_explicit_subpower_bound` (relation): For ε>0 and a natural B≥exp(1/ε), every nonprincipal complex character χ modulo q>0, positive exclusion modulus M and natural endpoints A,Z satisfy ‖Σ_{A<m≤Z}1_{gcd(m,M)=1}χ(m)‖≤D^B q M^ε, where D=max(1,(ε log2)⁻¹).

Contract tests:

- `explicit_constant_one_exponent` (degenerate): For ε>0 and any natural B, max(1,(ε log2)⁻¹)^B≥1.

Acceptance:

- The same constant works for every character and both endpoints.
- M=1 yields the coarser D^B q bound; the original sharper q theorem is retained.
- Shared prime factors of q,M and nonsquarefree M remain allowed.

Sources:

- BennettSiksek2020, §8.1, Case2, printed pp.378–379. Worker-derived explicit consequence of the corrected divisor input; the source's invalid universal divisor estimate is not reused.

- TaoDivisor2008, Small/large-prime proof; AN.5 explicit and uniform divisor nodes. The AN.5 packet owns the proof and exact constant. This node only composes its statement with the already planned character estimate.

### 26. Explicit small-conductor threshold

`ExponentialSumsAndCircleMethod:ES.0/small-conductor-explicit-threshold` — theorem; unchecked.

Let c>0, B∈ℕ with B≥exp(64c), and put D=max(1,((64c)⁻¹ log2)⁻¹), C=D^B. For natural k≥1 with (8C)^(64/17)≤k, every nonprincipal complex character χ modulo q>0 and M>0 satisfying q≤8k^(7/32) and M≤k^c obeys ‖Σ_{k div2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2).

Hypotheses and conventions:

- c>0; B natural with exp(64c)≤B; k≥1; the displayed explicit size threshold; q>0; χ≠1; M>0; the two growth bounds.

Proof plan:

1. Set ε=(64c)⁻¹>0; 1/ε=64c. The imported explicit AN.5 bound with this B supplies τ(M)≤C M^ε for every M>0, and C≥1.

2. Monotonicity of the real power17/64 applied to (8C)^(64/17)≤k gives 8C≤k^(17/64), using positive base8C and (64/17)(17/64)=1.

3. Apply small-conductor-power-saving with this actual uniform divisor bound. No unspecified constant or unrecorded eventual condition remains.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/small-conductor-power-saving`, `AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound`, `mathlib:Real.rpow_le_rpow`, `mathlib:Real.rpow_mul`.

Uses:

- Bennett–Siksek §8.1 Case2; routed item97: Instantiate the separate AN.5 divisor supplier, keeping all constant/threshold dependencies explicit.

API:

- `TauCeti.ExponentialSumsPlan.small_conductor_explicit_threshold` (relation): Let c>0, B∈ℕ with B≥exp(64c), and put D=max(1,((64c)⁻¹ log2)⁻¹), C=D^B. For natural k≥1 with (8C)^(64/17)≤k, every nonprincipal complex character χ modulo q>0 and M>0 satisfying q≤8k^(7/32) and M≤k^c obeys ‖Σ_{k div2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2).

Contract tests:

- `threshold_reciprocal_exponents` (computation): (64/17)(17/64)=1 in the real numbers.

- `threshold_equality` (compatibility): For C≥1, ((8C)^(64/17))^(17/64)=8C.

- `threshold_one_rejected` (non-example): For C≥1, the inequality8C≤1^(17/64) is false.

- `divisor_supplier_exponent` (compatibility): For c>0, 1/((64c)⁻¹)=64c.

Acceptance:

- Equality at the threshold is permitted.
- For C≥1 the size condition cannot hold at k=1; dropping it is detectable.
- B may be any certified integer upper bound, so exact real ceilings are not required.

Sources:

- BennettSiksek2020, §8.1, Case2, printed pp.378–379. Worker-derived explicit consequence of the corrected divisor input; the source's invalid universal divisor estimate is not reused.

- TaoDivisor2008, Small/large-prime proof; AN.5 explicit and uniform divisor nodes. The AN.5 packet owns the proof and exact constant. This node only composes its statement with the already planned character estimate.

### 27. Uniform eventual small-conductor cancellation

`ExponentialSumsAndCircleMethod:ES.0/eventual-small-conductor-power-saving` — theorem; unchecked.

For each real c>0 there exists a natural K≥1 such that for all k≥K, all positive q, all nonprincipal complex Dirichlet characters χ modulo q, and all M>0, the inequalities q≤8k^(7/32) and M≤k^c imply ‖Σ_{k div2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2). K depends only on c, not on q,χ,M or k.

Hypotheses and conventions:

- c>0; the universal variables satisfy the displayed positivity, nonprincipality and growth conditions.

Proof plan:

1. Import AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound at ε=(64c)⁻¹ to choose C≥1 independent of M.

2. Choose a natural K≥max(1,(8C)^(64/17)) using exists_nat_ge.

3. For every k≥K, real-power monotonicity and rpow_mul give8C≤k^(17/64). Apply small-conductor-power-saving.

4. For an effectively presented positive c, the preceding explicit-threshold theorem gives a computable certified choice by taking B≥exp(64c) and C=max(1,((64c)⁻¹ log2)⁻¹)^B. The abstract real existence theorem is not an executable arbitrary-real algorithm.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/small-conductor-power-saving`, `AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound`, `mathlib:exists_nat_ge`, `mathlib:Real.rpow_le_rpow`, `mathlib:Real.rpow_mul`.

Uses:

- Bennett–Siksek §8.1 Case2; routed item97: Instantiate the separate AN.5 divisor supplier, keeping all constant/threshold dependencies explicit.

API:

- `TauCeti.ExponentialSumsPlan.eventual_small_conductor_power_saving` (relation): For each real c>0 there exists a natural K≥1 such that for all k≥K, all positive q, all nonprincipal complex Dirichlet characters χ modulo q, and all M>0, the inequalities q≤8k^(7/32) and M≤k^c imply ‖Σ_{k div2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2). K depends only on c, not on q,χ,M or k.

Contract tests:

- `one_small_conductor_exponent` (computation): At c=1/64 the divisor exponent1/(64c) equals1.

Acceptance:

- The quantifier order is ∀c>0 ∃K ∀k,q,χ,M; separate thresholds per character are weaker.
- At c=1/64 the imported exponent is exactly1.
- This is only the small-conductor branch; it does not assert the full product-character proposition.

Sources:

- BennettSiksek2020, §8.1, Case2, printed pp.378–379. Worker-derived explicit consequence of the corrected divisor input; the source's invalid universal divisor estimate is not reused.

- TaoDivisor2008, Small/large-prime proof; AN.5 explicit and uniform divisor nodes. The AN.5 packet owns the proof and exact constant. This node only composes its statement with the already planned character estimate.

### 28. Integer evaluation of the ambient product

`ExponentialSumsAndCircleMethod:ES.0/ambient-product-evaluation` — lemma; unchecked.

For positive N1,N2, complex Dirichlet characters χi modulo Ni and every integer a, the existing character σ=χ1.mul χ2 modulo M=lcm(N1,N2) satisfies σ(a)=χ1(a)χ2(a).

Hypotheses and conventions:

- No primitivity, quadraticity, distinctness or coprimality of the moduli is required.
- Evaluations cast the same integer to each residue ring, including nonunits.

Proof plan:

1. Unfold the existing ambient product as A·B, with A and B the change-level lifts to M.

2. If a is coprime to M, apply the existing coprime change-level evaluation theorem to both factors.

3. If a is not coprime to M, choose a common prime of |a| and M. A prime divides an lcm exactly when it divides at least one input modulus, so at least one original character vanishes. The ambient character vanishes as well.

4. Use integer gcd via natural absolute values to cover a=0 and negative a; no division or representative choice is needed.

Prerequisites: `mathlib:DirichletCharacter.mul`, `mathlib:DirichletCharacter.changeLevel_eq_cast_of_dvd'`, `mathlib:DirichletCharacter.apply_eq_zero_iff`, `mathlib:Nat.Prime.dvd_lcm`, `mathlib:Nat.Prime.not_coprime_iff_dvd`.

Uses:

- Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94: Transfers the source's pointwise product into the already existing ambient character.

API:

- `TauCeti.ExponentialSumsPlan.ambient_product_evaluation` (relation): For positive N1,N2, complex Dirichlet characters χi modulo Ni and every integer a, the existing character σ=χ1.mul χ2 modulo M=lcm(N1,N2) satisfies σ(a)=χ1(a)χ2(a).

Contract tests:

- `quadratic_two_adic_cancellation` (relation): The integer residue tables satisfy χ8(a)χ−8(a)=χ−4(a) for every integer a, including negative a and even nonunits.

Acceptance:

- Do not apply the coprime change-level formula at a nonunit.
- Distinct characters of equal modulus are allowed.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed p.377. Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper.

### 29. Coprimality of conductor and excluded primes

`ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-coprime` — lemma; unchecked.

For any complex character σ modulo M>0, put q=cond(σ) and R=∏{p prime : p divides M and p does not divide q}p. Then gcd(q,R)=1.

Hypotheses and conventions:

- The finite prime set is the existing primeFactors(M) filtered by p not dividing q; the empty product is 1.
- σ may be principal or imprimitive.

Proof plan:

1. Every factor p is prime and does not divide q, hence is coprime to q.

2. Apply the finite-product coprimality equivalence; no prime power or multiplicity is included.

Prerequisites: `mathlib:Nat.primeFactors`, `mathlib:Nat.mem_primeFactors`, `mathlib:Nat.coprime_prod_right_iff`.

Uses:

- Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94: Provides the coprime primitive/exclusion split required before the CRT branch.

API:

- `TauCeti.ExponentialSumsPlan.primitive_exclusion_coprime` (relation): For any complex character σ modulo M>0, put q=cond(σ) and R=∏{p prime : p divides M and p does not divide q}p. Then gcd(q,R)=1.

Contract tests:

- `exclusion_shrink_eight` (degenerate): At ambient M=8 and primitive conductor q=4, R=1; repeated powers of 2 are not extra excluded primes.

- `exclusion_modulus_one` (degenerate): At M=q=1 the empty prime product R equals 1.

Acceptance:

- M=8,q=4 gives R=1.
- M=q=1 has an empty excluded-prime set and satisfies the result.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed p.377. Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper.

### 30. The reduced product divides the ambient modulus

`ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-period-divides` — lemma; unchecked.

For σ modulo M>0, q=cond(σ) and R the product of prime divisors of M absent from q, qR divides M.

Hypotheses and conventions:

- No assertion that qR=M or that qR is a primitive conductor.
- All prime factors in R occur once; q>0 is supplied by conductor_ne_zero.

Proof plan:

1. The product R over a subset of primeFactors(M) divides the full prime product, which divides M.

2. The existing conductor theorem gives q dividing M.

3. Combine these two divisibilities using gcd(q,R)=1, or equivalently identify their lcm with qR.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-coprime`, `mathlib:DirichletCharacter.conductor_dvd_level`, `mathlib:DirichletCharacter.conductor_ne_zero`, `mathlib:Finset.prod_dvd_prod_of_subset`, `mathlib:Nat.prod_primeFactors_dvd`.

Uses:

- Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94: Replaces the source's unjustified equality between the ambient modulus and its reduced primitive/exclusion product.

API:

- `TauCeti.ExponentialSumsPlan.primitive_exclusion_period_divides` (relation): For σ modulo M>0, q=cond(σ) and R the product of prime divisors of M absent from q, qR divides M.

Contract tests:

- `period_divisibility_not_equality` (non-example): For χ8χ−8, qR=4 divides ambient 8 but is not equal to it.

- `exclusion_principal_twelve` (degenerate): For the principal character modulo 12, q=1 and R=6, not 12.

Acceptance:

- The 2-adic example gives strict divisibility 4|8.
- For the principal character modulo 12, qR=6|12.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed p.377. Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper.

### 31. The primitive character with its exclusion mask

`ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-evaluation` — theorem; unchecked.

For every complex character σ modulo M>0 and integer a, let q=cond(σ), η=σ.primitiveCharacter and R the product of prime divisors of M absent from q. Then σ(a)=η(a) if gcd(|a|,R)=1, and σ(a)=0 otherwise.

Hypotheses and conventions:

- No nonprincipality or primitivity hypothesis on σ; q=1 is allowed.
- The mask uses coprimality of integers, equivalent to natural coprimality for nonnegative inputs.

Proof plan:

1. If a is not coprime to R, a prime of R divides both a and M; the ambient character vanishes.

2. Suppose a is coprime to R. If a is also coprime to q, it is coprime to M: a hypothetical common prime of a and M either divides q or occurs among the factors of R, giving a contradiction.

3. In this coprime-to-M case use primitiveCharacter_apply_of_isCoprime to equate η(a) and σ(a).

4. In the remaining case a is not coprime to q. Since q divides M, neither character is evaluated at a unit, so both values vanish. These cases also handle a=0 and negative a.

Prerequisites: `mathlib:DirichletCharacter.primitiveCharacter`, `mathlib:DirichletCharacter.primitiveCharacter_apply_of_isCoprime`, `mathlib:DirichletCharacter.apply_eq_zero_iff`, `mathlib:DirichletCharacter.conductor_dvd_level`, `mathlib:Nat.mem_primeFactors`, `mathlib:Nat.Prime.not_coprime_iff_dvd`, `mathlib:Nat.isCoprime_iff_coprime`.

Uses:

- Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94: Turns the product evaluation into the exact masked finite sums already decomposed in the first thirteen nodes.

API:

- `TauCeti.ExponentialSumsPlan.primitive_exclusion_evaluation` (relation): For every complex character σ modulo M>0 and integer a, let q=cond(σ), η=σ.primitiveCharacter and R the product of prime divisors of M absent from q. Then σ(a)=η(a) if gcd(|a|,R)=1, and σ(a)=0 otherwise.

Contract tests:

- `exclusion_mixed_fifteen` (computation): At M=15 and q=5, R=3.

- `mask_negative_excluded` (computation): For R=3 and a=−3, the mask kills the nonzero primitive χ5 value −1.

- `mask_negative_kept` (computation): For R=3 and a=−2, the mask retains the primitive χ5 value −1.

- `mask_zero_excluded` (degenerate): For the principal character modulo 12, primitive η modulo 1 takes value 1 at 0 but the R=6 mask makes the ambient value 0.

Acceptance:

- At M=15,q=5 the mask must remove multiples of 3 even when η is nonzero there.
- At M=12 for the principal character, η is the character modulo 1 and R=6; the masked identity includes a=0.
- The formula is valid for R=1; do not require a nonempty principal-factor family.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed p.377. Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper.

### 32. Cancelled primes divide both original conductors

`ExponentialSumsAndCircleMethod:ES.0/cancelled-prime-common-support` — lemma; unchecked.

Let χ1,χ2 be primitive complex Dirichlet characters of positive moduli N1,N2. Set M=lcm(N1,N2), σ=χ1.mul χ2, q=cond(σ), and R the product of prime divisors of M not dividing q. Then R divides gcd(N1,N2).

Hypotheses and conventions:

- Quadraticity and distinctness are unnecessary, but primitivity of both inputs is required.

Proof plan:

1. Lift χ1,χ2 to A,B modulo M. By conductor_changeLevel and primitivity, their conductors are N1,N2.

2. Write A=(A·B)·B⁻¹. Apply conductor_mul_dvd_lcm_conductor and conductor_inv to obtain N1 dividing lcm(q,N2). Similarly N2 divides lcm(q,N1).

3. For a prime p of M not dividing q, the lcm criterion first gives p dividing at least one Ni. The corresponding reverse conductor divisibility then forces p to divide the other Ni.

4. Every factor of R is consequently a prime divisor of gcd(N1,N2). Its distinct-prime product divides the radical of that gcd, which divides the gcd.

Prerequisites: `mathlib:DirichletCharacter.IsPrimitive`, `mathlib:DirichletCharacter.conductor_changeLevel`, `mathlib:DirichletCharacter.conductor_inv`, `mathlib:DirichletCharacter.conductor_mul_dvd_lcm_conductor`, `mathlib:Nat.Prime.dvd_lcm`, `mathlib:Nat.mem_primeFactors`, `mathlib:Finset.prod_dvd_prod_of_subset`, `mathlib:Nat.prod_primeFactors_dvd`.

Uses:

- Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94: Supplies R≤min(N1,N2), preserving the source growth exponent c in the small-conductor application.

API:

- `TauCeti.ExponentialSumsPlan.cancelled_prime_common_support` (relation): Let χ1,χ2 be primitive complex Dirichlet characters of positive moduli N1,N2. Set M=lcm(N1,N2), σ=χ1.mul χ2, q=cond(σ), and R the product of prime divisors of M not dividing q. Then R divides gcd(N1,N2).

Contract tests:

- `common_prime_not_coprime_moduli` (computation): For χ3 times the primitive χ15, q=5 and R=3 divides gcd(3,15); the original conductors need not be coprime.

- `imprimitive_support_obstruction` (non-example): If the inputs are principal modulo 8 and modulo 1, then q=1 and R=2 does not divide gcd(8,1); input primitivity is necessary for the common-support conclusion.

Acceptance:

- Do not infer the claim merely from q dividing M; the reverse conductor bounds are essential.
- The imprimitive principal modulo 8 paired with modulo 1 is a counterexample without primitivity.
- R is bounded by either original modulus, not merely by their product.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed p.377. Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper.

### 33. Quadraticity survives primitive reduction

`ExponentialSumsAndCircleMethod:ES.0/primitive-product-quadratic` — lemma; unchecked.

For positive N1,N2 and quadratic complex Dirichlet characters χi modulo Ni, the existing primitive product η=χ1.primitive_mul χ2 is quadratic.

Hypotheses and conventions:

- Quadratic means the existing predicate that every value is 0, 1 or −1; it includes the principal character.
- No input primitivity or distinctness is required.

Proof plan:

1. Use the existing equivalence between quadraticity and χ²=1.

2. Change level to M=lcm(N1,N2); the lifts preserve squares as monoid homomorphisms, so σ²=1.

3. The existing change-level equality sends η to σ. Apply injectivity of changeLevel from q to M to infer η²=1, and convert back to quadraticity.

Prerequisites: `mathlib:DirichletCharacter.mul`, `mathlib:DirichletCharacter.primitive_mul`, `mathlib:DirichletCharacter.changeLevel`, `mathlib:DirichletCharacter.changeLevel_injective`, `mathlib:DirichletCharacter.changeLevel_primitiveCharacter`, `mathlib:MulChar.IsQuadratic`, `mathlib:MulChar.IsQuadratic.sq_eq_one`, `mathlib:MulChar.isQuadratic_iff_sq_eq_one`.

Uses:

- Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94: Supplies the quadratic hypothesis for later large-conductor arithmetic; that later branch is not asserted here.

API:

- `TauCeti.ExponentialSumsPlan.primitive_product_quadratic` (relation): For positive N1,N2 and quadratic complex Dirichlet characters χi modulo Ni, the existing primitive product η=χ1.primitive_mul χ2 is quadratic.

Contract tests:

- `quadratic_two_adic_cancellation` (relation): The integer residue tables satisfy χ8(a)χ−8(a)=χ−4(a) for every integer a, including negative a and even nonunits.

- `diagonal_principal_obstruction` (non-example): The square of χ3 sums to 2 on (0,3], whereas its primitive conductor is 1; equal input characters cannot satisfy a nonprincipal conductor bound.

Acceptance:

- The diagonal product may become principal and is still quadratic.
- Primitivity of η is already primitive_mul_isPrimitive; do not introduce a new existence theorem.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed p.377. Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper.

### 34. Distinct primitive quadratic inputs give a nonprincipal inducer

`ExponentialSumsAndCircleMethod:ES.0/primitive-product-nonprincipal` — lemma; unchecked.

For positive N1,N2, primitive quadratic complex characters χi modulo Ni, and an integer a with χ1(a)≠χ2(a), the primitive product η=χ1.primitive_mul χ2 is not principal.

Hypotheses and conventions:

- Distinctness is as functions on integers; moduli may coincide.
- The interface retains both source quadratic hypotheses; the proof only needs the second input to square to the principal character.

Proof plan:

1. Assume η=1. Changing level to M gives A·B=1 for the two lifted inputs.

2. Quadraticity gives B²=1, so A=B.

3. Conductor invariance under changeLevel and input primitivity imply N1=N2.

4. Transport across this equality and apply injectivity of changeLevel to deduce χ1=χ2, contradicting the integer witness.

Prerequisites: `mathlib:DirichletCharacter.primitive_mul`, `mathlib:DirichletCharacter.changeLevel_primitiveCharacter`, `mathlib:DirichletCharacter.changeLevel_injective`, `mathlib:DirichletCharacter.conductor_changeLevel`, `mathlib:DirichletCharacter.IsPrimitive`, `mathlib:MulChar.IsQuadratic.sq_eq_one`.

Uses:

- Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94: Justifies the nonprincipal hypothesis needed by incomplete and masked character cancellation.

API:

- `TauCeti.ExponentialSumsPlan.primitive_product_nonprincipal` (relation): For positive N1,N2, primitive quadratic complex characters χi modulo Ni, and an integer a with χ1(a)≠χ2(a), the primitive product η=χ1.primitive_mul χ2 is not principal.

Contract tests:

- `diagonal_principal_obstruction` (non-example): The square of χ3 sums to 2 on (0,3], whereas its primitive conductor is 1; equal input characters cannot satisfy a nonprincipal conductor bound.

- `quadratic_two_adic_cancellation` (relation): The integer residue tables satisfy χ8(a)χ−8(a)=χ−4(a) for every integer a, including negative a and even nonunits.

Acceptance:

- Equal primitive inputs give a principal product and must be excluded.
- Distinct conjugate order-three characters modulo 7 have principal product; distinctness without quadraticity is insufficient.
- The χ8,χ−8 example has equal moduli and different character values, so distinct-modulus hypotheses would be too restrictive.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed p.377. Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper.

### 35. Small-conductor cancellation for the original product

`ExponentialSumsAndCircleMethod:ES.0/small-conductor-product-cancellation` — theorem; unchecked.

For each real c>0 there is a natural K≥1 such that, for every k≥K and every pair of distinct primitive quadratic complex Dirichlet characters χi of positive moduli Ni≤k^c, if q=cond(χ1.mul χ2)≤8k^(7/32), then ‖Σ_{k div2<a≤k}χ1(a)χ2(a)‖≤k^(1/2). The threshold K depends only on c.

Hypotheses and conventions:

- Distinctness means an integer witness of different values; the moduli may be equal.
- There is no prime-factor smoothness hypothesis in this small-conductor branch.
- The theorem does not cover q>8k^(7/32), or assert full Proposition 8.2.

Proof plan:

1. Choose K from eventual-small-conductor-power-saving for the same c.

2. Form the existing σ and η, with q>0 and η nonprincipal by primitive-product-nonprincipal.

3. The excluded prime product R is positive, since all its factors are positive primes (including the empty product 1). By cancelled-prime-common-support, R divides gcd(N1,N2), hence R≤N1≤k^c.

4. Combine ambient-product-evaluation and primitive-exclusion-evaluation, converting integer coprimality to natural coprimality at the natural interval arguments.

5. Apply the uniform masked-character bound with character η modulo q and exclusion modulus R. The threshold is independent of both inputs; no exponent 2c from the ambient lcm is needed.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/ambient-product-evaluation`, `ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-evaluation`, `ExponentialSumsAndCircleMethod:ES.0/cancelled-prime-common-support`, `ExponentialSumsAndCircleMethod:ES.0/primitive-product-nonprincipal`, `ExponentialSumsAndCircleMethod:ES.0/eventual-small-conductor-power-saving`, `mathlib:DirichletCharacter.conductor_ne_zero`, `mathlib:DirichletCharacter.primitive_mul_isPrimitive`, `mathlib:Nat.isCoprime_iff_coprime`.

Uses:

- Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94 and Case 2/item 97: Completes the product-to-masked-sum application for the small-conductor branch without duplicating AN.5 or claiming the large-conductor result.

API:

- `TauCeti.ExponentialSumsPlan.small_conductor_product_cancellation` (relation): For each real c>0 there is a natural K≥1 such that, for every k≥K and every pair of distinct primitive quadratic complex Dirichlet characters χi of positive moduli Ni≤k^c, if q=cond(χ1.mul χ2)≤8k^(7/32), then ‖Σ_{k div2<a≤k}χ1(a)χ2(a)‖≤k^(1/2). The threshold K depends only on c.

Contract tests:

- `exclusion_shrink_eight` (degenerate): At ambient M=8 and primitive conductor q=4, R=1; repeated powers of 2 are not extra excluded primes.

- `diagonal_principal_obstruction` (non-example): The square of χ3 sums to 2 on (0,3], whereas its primitive conductor is 1; equal input characters cannot satisfy a nonprincipal conductor bound.

- `common_prime_not_coprime_moduli` (computation): For χ3 times the primitive χ15, q=5 and R=3 divides gcd(3,15); the original conductors need not be coprime.

Acceptance:

- Preserve the quantifier order ∀c>0 ∃K ∀k,N1,N2,χ1,χ2.
- The strict source Case 2 condition implies the stated non-strict bound; equality at the conductor threshold is harmless.
- R=1 needs no exceptional case. Equal inputs fail the nonprincipal reduction.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed p.377 and Case 2, pp.378–379. Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper.

### 36. CRT decomposition of Dirichlet characters

`ExponentialSumsAndCircleMethod:ES.0/crt-character-equivalence` — definition; unchecked.

For a finite index type I, pairwise coprime natural moduli nᵢ and a commutative monoid with zero C, put N=∏ᵢnᵢ. Define crtCharacterEquiv(n) from Dirichlet characters C of level N to families of characters C of levels nᵢ, as a multiplicative equivalence. Let E be the native unit-group CRT equivalence from (ZMod N)× to ∏ᵢ(ZMod nᵢ)×. The i-th factor has unit homomorphism u ↦ χ(E⁻¹(eᵢ(u))), where eᵢ places u in coordinate i and one elsewhere; extend by zero at nonunits using the native unit-character equivalence. The inverse multiplies the coordinate characters on CRT units and extends by zero. No new character or conductor carrier is introduced.

Proposed declaration: `TauCeti.ExponentialSumsPlan.crtCharacterEquiv`.

Hypotheses and conventions:

- I is finite, with decidable equality for the coordinate inclusions; nᵢ are pairwise coprime. No positivity is needed for this algebraic equivalence; all conductor statements below require nᵢ>0.
- C is any commutative monoid with zero. Empty I has N=1; modulus-one coordinates are allowed.

Proof plan:

1. Compose ZMod.prodEquivPi with Units.mapEquiv and MulEquiv.piUnits to obtain E. These are existing equivalences, not additional constructions.

2. Compose MulChar.mulEquivToUnitHom, transport along E by MulEquiv.monoidHomCongrLeft, Pi.monoidHomMulEquiv on the finite product of unit groups, and the coordinate inverses of MulChar.mulEquivToUnitHom through MulEquiv.piCongrRight.

3. The native Pi.monoidHomMulEquiv supplies both inverse laws and multiplicativity. Unfold its forward map to get the single-coordinate restriction, and its inverse to get the product on units. Zero extension is inherited from MulChar.ofUnitHom.

Prerequisites: `mathlib:ZMod.prodEquivPi`, `mathlib:MulChar.mulEquivToUnitHom`, `mathlib:Units.mapEquiv`, `mathlib:MulEquiv.piUnits`, `mathlib:MulEquiv.monoidHomCongrLeft`, `mathlib:Pi.monoidHomMulEquiv`, `mathlib:MulEquiv.piCongrRight`.

Uses:

- Bennett–Siksek §8.1, Case 1, printed pp.377–378: Produce actual characters on the pairwise-coprime bounded blocks and recover the summand at all integers.
- Theorem 6, printed pp.376–377: Separate each ambient block modulus from its conductor; establish primitivity only where the analytic theorem requires it.
- ES.0/crt-product-conductor and /crt-quadratic-components: Use the multiplicative equivalence to compare primitive conductors and squares of characters.

API:

- `TauCeti.ExponentialSumsPlan.crtCharacterEquiv_apply_unit` (characterisation): With E and eᵢ as in the definition, the unit homomorphism of the i-th factor sends u to χ.toUnitHom(E⁻¹(eᵢ(u))). This fixes the coordinate order.

- `TauCeti.ExponentialSumsPlan.crtCharacterEquiv_symm_unit` (simp): For a family φᵢ and a unit u modulo N, the inverse character at u equals ∏ᵢφᵢ(reductionᵢ(u)), using the native ZMod.unitsMap for nᵢ|N.

- `TauCeti.ExponentialSumsPlan.crtCharacterEquiv_one` (structure): The principal character maps to the family of principal characters, with their native zero values at nonunits.

- `TauCeti.ExponentialSumsPlan.crtCharacterEquiv_mul` (structure): The image of χψ is the coordinatewise product of the images of χ and ψ.

- `TauCeti.ExponentialSumsPlan.crtCharacterEquiv_ext` (extensionality): Two characters of level N are equal if and only if every corresponding CRT factor is equal.

- `TauCeti.ExponentialSumsPlan.crt_inverse_product` (compatibility): The inverse of φ is ∏ᵢ changeLevel(nᵢ|N)(φᵢ), an equality of native characters at N. Promoted to ES.0/crt-inverse-product because conductor arguments consume it.

- `TauCeti.ExponentialSumsPlan.crt_integer_evaluation` (compatibility): For every integer a, χ(a)=∏ᵢ(crtCharacterEquiv(n)(χ))ᵢ(a), including nonunits and negative a. Promoted to ES.0/crt-integer-evaluation for the summand comparison.

Contract tests:

- `crt_empty_inverse` (degenerate): For I=Fin 0 and its empty family, the inverse character evaluates to 1 at every integer a.

- `crt_one_zero` (degenerate): For the singleton modulus-one family, the factor of the principal character evaluates to 1 at zero.

- `crt_singleton` (characterisation): For the singleton modulus-seven family and arbitrary χ, the unique factor agrees with χ at every integer.

- `crt_principal_nonunit` (non-example): At the two moduli (3,4), the inverse of the principal family evaluates to 0 at 2; it is not the constant function one.

- `crt_principal_unit` (computation): At the two moduli (3,4), the inverse of the principal family evaluates to 1 at −1.

- `crt_principal_conductor` (compatibility): The inverse of the principal family at (3,4) has native conductor 1, despite ambient modulus 12.

Acceptance:

- An empty family reconstructs the unique character modulo one, whose value is one even at zero.
- A singleton family recovers its input character; at moduli 3 and 4 the principal family reconstructs a character zero at 2 and one at −1.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker-defined adapter composing the pinned CRT and unit-character equivalences for the block factors used in Case 1; the paper does not name this equivalence separately.

### 37. CRT reconstruction as a product of level lifts

`ExponentialSumsAndCircleMethod:ES.0/crt-inverse-product` — lemma; unchecked.

For the finite pairwise-coprime family nᵢ, N=∏ᵢnᵢ and characters φᵢ with values in a commutative monoid with zero C, crtCharacterEquiv(n)⁻¹(φ)=∏ᵢ changeLevel(nᵢ|N)(φᵢ), as characters modulo N.

Proposed declaration: `TauCeti.ExponentialSumsPlan.crt_inverse_product`.

Hypotheses and conventions:

- Same finite family and coefficient assumptions as crt-character-equivalence; zero moduli and empty families are allowed here.

Proof plan:

1. Use the unit-character equivalence to compare the two characters on units modulo N.

2. The inverse API gives the product of φᵢ evaluated on coordinate reductions. ZMod.prodEquivPi_apply identifies each coordinate with its native reduction; DirichletCharacter.changeLevel_toUnitHom gives exactly the same unit homomorphism for each lifted factor.

3. The finite product of characters agrees on units, hence agrees as a native MulChar; at nonunits zero extension is already part of the carrier.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/crt-character-equivalence`, `mathlib:ZMod.prodEquivPi_apply`, `mathlib:DirichletCharacter.changeLevel_toUnitHom`, `mathlib:MulChar.mulEquivToUnitHom`.

Acceptance:

- Empty product is the principal character modulo one.
- The right side is a product after all factors are lifted to N, not the mixed-level binary mul constructor.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker derivation supplying the precise meaning of the source product notation through native changeLevel.

### 38. All-integer CRT reconstruction

`ExponentialSumsAndCircleMethod:ES.0/crt-integer-evaluation` — lemma; unchecked.

For every integer z and character χ at N=∏ᵢnᵢ with values in a commutative monoid with zero C, χ(z)=∏ᵢφᵢ(z), where φ=crtCharacterEquiv(n)(χ). No coprimality hypothesis on z is imposed.

Proposed declaration: `TauCeti.ExponentialSumsPlan.crt_integer_evaluation`.

Hypotheses and conventions:

- I finite and the nᵢ pairwise coprime. Empty I and modulus-one coordinates are included.

Proof plan:

1. If z is a unit modulo N, use the inverse unit formula, its inverse law, and ZMod.prodEquivPi_apply to identify every coordinate with the integer cast at nᵢ.

2. If z is a nonunit modulo N, transport its unit predicate across the ring CRT equivalence and use Pi.isUnit_iff. Some coordinate z modulo nᵢ is a nonunit. Both χ(z) and that factor vanish by the native MulChar nonunit law, so the product is zero.

3. For empty I the target product is the one-element ring; all residues are units and the empty character product has value one.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/crt-character-equivalence`, `mathlib:ZMod.prodEquivPi_apply`, `mathlib:Pi.isUnit_iff`, `mathlib:MulChar.map_nonunit`.

Acceptance:

- Principal modulo 12 vanishes at 2, so reconstruction must retain nonunit zeros.
- The formula applies at z=0 and z=−1; N=1 gives value one at both.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker derivation of the all-integer product identity needed inside the source interval sum; equality on units alone would not suffice.

### 39. Finite CRT products of primitive factors

`ExponentialSumsAndCircleMethod:ES.0/crt-primitive-family` — lemma; unchecked.

Let nᵢ>0 be a finite pairwise-coprime family and φᵢ native Dirichlet characters with values in a commutative monoid with zero C. If every φᵢ is primitive at nᵢ, then crtCharacterEquiv(n)⁻¹(φ) is primitive at ∏ᵢnᵢ.

Proposed declaration: `TauCeti.ExponentialSumsPlan.crt_primitive_family`.

Hypotheses and conventions:

- All nᵢ>0. The index set may be empty and some nᵢ may equal one.

Proof plan:

1. Induct over the finite index set, using crt-inverse-product to express the inverse character as a product of level lifts. The empty case is the native primitive principal character at level one.

2. At an insertion i, pairwise coprimality and Nat.coprime_prod_right_iff make nᵢ coprime to the product of the remaining levels. The induction hypothesis makes the remaining product primitive.

3. Apply the exact CA.1 primitivity-of-a-product-at-coprime-levels supplier. DirichletCharacter.changeLevel_trans identifies its two lifted factors with the full product. Reindexing and associating finite products are routine; the binary primitivity proof stays with CA.1.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/crt-inverse-product`, `ClassicalArithmeticCompletion:CA.1/primitivity-of-a-product-at-coprime-levels`, `mathlib:DirichletCharacter.isPrimitive_one_level_one`, `mathlib:DirichletCharacter.changeLevel_trans`, `mathlib:Nat.coprime_prod_right_iff`.

Acceptance:

- The empty family is primitive at level one.
- Primitivity at level one does not require nonprincipality.
- Without coprimality, squaring a nonprincipal quadratic character gives a principal product; the conclusion fails.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Finite-family adapter for the primitive factors on p.377, importing the owned binary theorem instead of rebuilding it.

### 40. Conductor of a finite CRT product

`ExponentialSumsAndCircleMethod:ES.0/crt-product-conductor` — theorem; unchecked.

For positive pairwise-coprime nᵢ and arbitrary characters φᵢ valued in a commutative monoid with zero C, the conductor of crtCharacterEquiv(n)⁻¹(φ) equals ∏ᵢ cond(φᵢ).

Proposed declaration: `TauCeti.ExponentialSumsPlan.crt_product_conductor`.

Hypotheses and conventions:

- All nᵢ>0; neither primitivity nor nonprincipality of φᵢ is required.

Proof plan:

1. Set dᵢ=cond(φᵢ). The native conductor_dvd_level and conductor_ne_zero give positive dᵢ dividing nᵢ. The dᵢ remain pairwise coprime by divisibility.

2. Take each native primitiveCharacter φᵢ and reconstruct it at D=∏ᵢdᵢ. The preceding finite primitive-family lemma makes this character primitive at D.

3. Its change of level from D to N equals the reconstructed original family. Expand both inverse products, use changeLevel as a monoid homomorphism and changeLevel_trans, then use changeLevel_primitiveCharacter coordinatewise.

4. Conductor invariance under changeLevel gives the stated exact product. This uses positive N and does not confuse dᵢ with nᵢ.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/crt-inverse-product`, `ExponentialSumsAndCircleMethod:ES.0/crt-primitive-family`, `mathlib:DirichletCharacter.conductor_dvd_level`, `mathlib:DirichletCharacter.conductor_ne_zero`, `mathlib:DirichletCharacter.primitiveCharacter_isPrimitive`, `mathlib:DirichletCharacter.changeLevel_primitiveCharacter`, `mathlib:DirichletCharacter.changeLevel_trans`, `mathlib:DirichletCharacter.conductor_changeLevel`.

Acceptance:

- A principal family has product conductor one regardless of its ambient moduli.
- A mixture of a primitive factor modulo 4 and a principal factor modulo 3 has conductor 4 and ambient level 12.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker derivation making the source primitive/principal distinction precise for arbitrary CRT groupings.

### 41. Conductor of one CRT factor

`ExponentialSumsAndCircleMethod:ES.0/crt-component-conductor` — lemma; unchecked.

For χ of positive level N=∏ᵢnᵢ with positive pairwise-coprime nᵢ, the conductor of its i-th CRT factor equals gcd(cond(χ),nᵢ). In particular a block nᵢ dividing cond(χ) has a primitive factor; a block coprime to cond(χ) has a principal factor.

Proposed declaration: `TauCeti.ExponentialSumsPlan.crt_component_conductor`.

Hypotheses and conventions:

- C is a commutative monoid with zero; every nᵢ>0. The two consequences use the native IsPrimitive and principal-character criteria.

Proof plan:

1. Apply crt-product-conductor to the family crtCharacterEquiv(n)(χ), using the inverse law to obtain cond(χ)=∏ⱼdⱼ.

2. The i-th dᵢ divides nᵢ. The product of all other dⱼ is coprime to nᵢ because dⱼ|nⱼ and the nⱼ are pairwise coprime.

3. Split the conductor product at i and apply Nat.gcd_mul_of_coprime_of_dvd, obtaining gcd(cond(χ),nᵢ)=dᵢ.

4. The first consequence unfolds IsPrimitive. For a block coprime to cond(χ), dᵢ=1 and eq_one_iff_conductor_eq_one identifies its factor with the principal character.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/crt-product-conductor`, `ExponentialSumsAndCircleMethod:ES.0/crt-character-equivalence`, `mathlib:DirichletCharacter.conductor_dvd_level`, `mathlib:Nat.coprime_prod_right_iff`, `mathlib:Nat.gcd_mul_of_coprime_of_dvd`, `mathlib:DirichletCharacter.IsPrimitive`, `mathlib:DirichletCharacter.eq_one_iff_conductor_eq_one`.

Acceptance:

- At ambient level 12 and conductor 4, the mod-3 factor is principal and the mod-4 factor primitive.
- A principal character at a block of size greater than one is not primitive there.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker derivation of exactly the distinguished-factor primitivity required by Theorem 6; it also recovers the source principal factors when their moduli are coprime to the conductor.

### 42. Quadratic CRT factors

`ExponentialSumsAndCircleMethod:ES.0/crt-quadratic-components` — lemma; unchecked.

Every CRT factor of a complex quadratic Dirichlet character is quadratic in the native MulChar.IsQuadratic sense, which includes principal characters.

Proposed declaration: `TauCeti.ExponentialSumsPlan.crt_quadratic_components`.

Hypotheses and conventions:

- A finite pairwise-coprime family; χ is a complex-valued native quadratic character at its product level.

Proof plan:

1. Use MulChar.isQuadratic_iff_sq_eq_one to express quadraticity as χ²=1 in the character group.

2. The multiplicative equivalence sends this equality to the coordinatewise square equality. Evaluate at the selected coordinate and apply the same native criterion.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/crt-character-equivalence`, `mathlib:MulChar.isQuadratic_iff_sq_eq_one`.

Acceptance:

- A principal component satisfies this predicate.
- No claim that all components are nonprincipal or have exact order two is made.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker derivation preserving the quadratic nature of the source factors without adding a new quadratic-character definition.

### 43. Level lifting as an exclusion mask

`ExponentialSumsAndCircleMethod:ES.0/change-level-exclusion` — lemma; unchecked.

For any natural D,R, any complex Dirichlet character η modulo D and any integer z, changeLevel(D|DR)(η)(z) equals η(z) if z and R are coprime as integers, and zero otherwise. No coprimality between D and R, and no positivity assumption, is needed for this evaluation identity.

Proposed declaration: `TauCeti.ExponentialSumsPlan.change_level_exclusion`.

Hypotheses and conventions:

- Native integer evaluation and IsCoprime are used, including D=0 or R=0; analytic applications have D,R>0.

Proof plan:

1. If z is coprime to both D and R, IsCoprime.mul_right_iff shows it is a unit modulo DR and changeLevel_eq_cast_of_dvd' gives the original value.

2. If z is not coprime to R, it is not coprime to DR and apply_eq_zero_iff makes the lifted value zero.

3. If z is not coprime to D, both η(z) and the lifted value vanish; the conditional right side is then zero in either case.

Prerequisites: `mathlib:DirichletCharacter.changeLevel`, `mathlib:DirichletCharacter.changeLevel_eq_cast_of_dvd'`, `mathlib:DirichletCharacter.apply_eq_zero_iff`, `mathlib:IsCoprime.mul_right_iff`.

Acceptance:

- R=1 gives equality at every integer, including nonunits modulo D.
- Repeated prime factors in R do not change the mask; coprimality of D and R is unnecessary.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker derivation identifying the corrected excluded-prime summand on pp.377–379 with a native character at the reduced period.

### 44. Characters on the bounded CRT blocks

`ExponentialSumsAndCircleMethod:ES.0/bounded-crt-character-factors` — theorem; unchecked.

Let T≥8, 0<a≤8, Q odd squarefree with Q≥T, and R squarefree, with gcd(Q,R)=1 and gcd(a,QR)=1. Every prime dividing Q or R is at most T². Let η be a primitive complex character modulo aQ. There exist a natural r, positive moduli nᵢ indexed by Fin(r+1), and characters φᵢ modulo nᵢ, with: the moduli pairwise coprime and product aQR; n₀|Q, n₀ odd squarefree and T≤n₀; every 1<nᵢ≤T²; at most two indices i≠0 have nᵢ<T; cond(φᵢ)=gcd(aQ,nᵢ), so φ₀ is primitive; and η(z) times the coprimality mask for R equals ∏ᵢφᵢ(z) for every integer z.

Proposed declaration: `TauCeti.ExponentialSumsPlan.bounded_crt_character_factors`.

Hypotheses and conventions:

- The native primitive η and arithmetic hypotheses are supplied. No quadraticity is needed for this factor construction.
- R=1 is allowed; all modulus-one blocks have already been discarded. Other factors need not all be primitive or principal for an arbitrary admissible grouping; their exact gcd conductors are stated.

Proof plan:

1. Apply bounded-crt-modulus-blocks to obtain the distinguished q and the tail list B. Set r=length(B), enumerate q::B by Fin(r+1), and transfer its product, pairwise coprimality, bounds and exceptional-count properties. This is finite list indexing, not a new arithmetic packing theorem.

2. Lift η to aQR by native changeLevel and transport its level along the enumerated product equality. Its conductor is aQ by conductor_changeLevel and primitivity.

3. Apply crtCharacterEquiv to that native character. crt-component-conductor gives every gcd conductor. Since n₀|Q, it divides aQ and the distinguished factor is primitive.

4. Use change-level-exclusion and crt-integer-evaluation to identify the original masked summand at every integer. All nonunit zeros remain in this equality.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/bounded-crt-modulus-blocks`, `ExponentialSumsAndCircleMethod:ES.0/crt-character-equivalence`, `ExponentialSumsAndCircleMethod:ES.0/crt-component-conductor`, `ExponentialSumsAndCircleMethod:ES.0/crt-integer-evaluation`, `ExponentialSumsAndCircleMethod:ES.0/change-level-exclusion`, `mathlib:DirichletCharacter.conductor_changeLevel`.

Acceptance:

- For a=4,Q=11,R=1,T=8, use moduli (11,4); both factors of a primitive η modulo 44 are primitive and the principal family is empty.
- For a=4,Q=11,R=3,T=8, moduli (11,4,3) exhibit two small blocks; the mod-3 factor is principal and the mod-11 factor primitive.
- A singleton family has r=0; its maximum over the other moduli is the empty maximum zero in the endpoint below.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker assembly of the corrected source factorization, preserving the existing r−2 arithmetic bound and accepted empty-principal-family convention. General subsequent factors are permitted by the corrected Theorem 6 modulus interface.

### 45. Large-conductor character blocks and interval threshold

`ExponentialSumsAndCircleMethod:ES.0/large-conductor-character-blocks` — theorem; unchecked.

Fix c>0 and a natural k>2⁶⁴. Let σ be any complex quadratic character at a positive ambient modulus M≤k^(2c), whose conductor D satisfies D≥8k^(7/32). Suppose every prime divisor of M is at most k^(7/16). Then there exist r≥0, pairwise-coprime moduli nᵢ indexed by Fin(r+1), and quadratic characters φᵢ modulo nᵢ, such that ∏ᵢnᵢ divides M, every 1<nᵢ≤k^(7/16), n₀ is odd squarefree and at least k^(7/32), φ₀ is primitive, σ(z)=∏ᵢφᵢ(z) for every integer z, and r+1<10c+2. If L=max{nᵢ:i≠0}, with L=0 for the empty set, then max(L,n₀^(1/4))n₀^(5/4)<k/2. All displayed nonintegral powers are real powers of nonnegative real casts.

Proposed declaration: `TauCeti.ExponentialSumsPlan.large_conductor_character_blocks`.

Hypotheses and conventions:

- σ need not be primitive at M. The large lower bound already excludes a principal σ.
- This theorem supplies the factors and the size hypotheses for Theorem 6; it contains no character-sum estimate.

Proof plan:

1. Set η=σ.primitiveCharacter, D=cond(σ), and R to the product of primes of M absent from D. The inherited primitive-exclusion lemmas give gcd(D,R)=1, DR|M and σ(z)=η(z) times the R mask. R is squarefree by Finset.squarefree_prod_of_pairwise_isCoprime on its finite set of distinct primes.

2. η is primitive by the native theorem. It is quadratic because changeLevel(η)=σ, changeLevel is injective into M>0 and a monoid homomorphism, and the square-to-one criterion descends along that injection.

3. Use the exact CA.1 odd-part and two-adic-conductor-bound suppliers, not their proofs: write a=2^(D.factorization(2)) and Q=D/a. Then 0<a≤8, D=aQ, Q is odd squarefree and gcd(a,Q)=1. Native ordProj_pos, ordProj_mul_ordCompl_eq_self, ordProj_dvd, not_dvd_ordCompl and coprime_ordCompl supply the elementary factor split and coprimality. From D≥8T and a≤8 obtain Q≥T for T=k^(7/32); k>2⁶⁴ gives T≥8.

4. Since Q|D|M and R|M, the smoothness hypotheses transfer from M; T²=k^(7/16) by Real.rpow_mul. Coprimality of D and R gives all remaining packing inputs. Apply bounded-crt-character-factors to η; its moduli multiply to DR and therefore divide M.

5. The native lift of η to DR is quadratic by the square criterion and changeLevel multiplicativity. crt-quadratic-components then gives all factor predicates, while the inherited mask equality identifies their product with σ at every integer.

6. Let the bad set be all indices with nᵢ<T. The distinguished block is not bad and the packing bound gives card(bad)≤2. The total product is at most M≤k^(2c), and all blocks are at least one. Apply bounded-factor-count to the total number r+1 to get its strict bound 10c+2.

7. Take the finite maximum L of all other moduli, zero if none. Its bound is k^(7/16), as is n₀. Apply graham-ringrose-interval-threshold to obtain the stated strict inequality; no analytic estimate is invoked.

Prerequisites: `ExponentialSumsAndCircleMethod:ES.0/bounded-crt-character-factors`, `ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-coprime`, `ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-period-divides`, `ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-evaluation`, `ExponentialSumsAndCircleMethod:ES.0/crt-quadratic-components`, `ExponentialSumsAndCircleMethod:ES.0/bounded-factor-count`, `ExponentialSumsAndCircleMethod:ES.0/graham-ringrose-interval-threshold`, `ClassicalArithmeticCompletion:CA.1/odd-part-of-a-quadratic-conductor-is-squarefree`, `ClassicalArithmeticCompletion:CA.1/two-adic-conductor-bound`, `mathlib:DirichletCharacter.primitiveCharacter_isPrimitive`, `mathlib:DirichletCharacter.changeLevel_primitiveCharacter`, `mathlib:DirichletCharacter.changeLevel_injective`, `mathlib:DirichletCharacter.changeLevel`, `mathlib:DirichletCharacter.conductor_dvd_level`, `mathlib:DirichletCharacter.conductor_ne_zero`, `mathlib:MulChar.isQuadratic_iff_sq_eq_one`, `mathlib:Nat.ordProj_dvd`, `mathlib:Nat.not_dvd_ordCompl`, `mathlib:Nat.coprime_ordCompl`, `mathlib:Nat.squarefree_mul_iff`, `mathlib:Real.rpow_mul`, `mathlib:Real.rpow_le_rpow`, `mathlib:Real.rpow_pos_of_pos`, `mathlib:Nat.ordProj_mul_ordCompl_eq_self`, `mathlib:Nat.ordProj_pos`, `mathlib:Finset.squarefree_prod_of_pairwise_isCoprime`.

Acceptance:

- For σ=χ₁.mul χ₂ at M=lcm(N₁,N₂), the earlier ambient-product-evaluation and primitive-product-quadratic arguments give the source summand and quadraticity; M≤N₁N₂≤k^(2c), so the statement supplies Case 1 factors without assuming M=D R.
- The source has r factors; this signature uses Fin(r+1), so its count is r+1 throughout.
- Singleton factors use L=0. Empty principal families and conductor shrinkage at 2 remain valid.
- The strict k>2⁶⁴ threshold is retained; equality would only give R₀≤k/2 from the inherited scalar bound.

Sources:

- BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377. Worker derivation of the complete arithmetic/character input to Case 1, importing both precise CA.1 classification statements. This realizes the factor-block portion of routed item 95 and leaves the external analytic proof explicit.

## Routed-input ledger

| Item | Disposition |
| --- | --- |
| PAPER-BENNETT-SIKSEK-20/44 | Open full Proposition 8.2; present nodes do not assert closure. |
| PAPER-BENNETT-SIKSEK-20/92 | Open complete Graham–Ringrose proof and corrected modulus interface. |
| PAPER-BENNETT-SIKSEK-20/93 | Existing primitiveCharacter/changeLevel/IsPrimitive APIs, with the coprime evaluation boundary recorded. |
| PAPER-BENNETT-SIKSEK-20/94 | Decomposed by the eight inherited adapters: ambient evaluation, primitive exclusion mask, coprimality, reduced-period divisibility, common cancelled-prime support, quadraticity, nonprincipality and the small-conductor product application. Reuses the existing primitive construction; all nodes remain unchecked. |
| PAPER-BENNETT-SIKSEK-20/95 | Decomposed: bounded-crt-character-factors and large-conductor-character-blocks connect inherited arithmetic packing to exact CRT characters, using the two CA.1 conductor-shape suppliers. Distinguished primitivity, all-integer reconstruction, original strict factor count, interval threshold and empty principal families are included. No external analytic bound is asserted. |
| PAPER-BENNETT-SIKSEK-20/96 | Resolved by AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound and /uniform-divisor-subpower-bound; no ES-owned divisor proof. |
| PAPER-BENNETT-SIKSEK-20/97 | The thirteen-node masked-character chain is preserved and applied by small-conductor-product-cancellation to distinct primitive quadratic inputs via the eight new conductor adapters. |

## Remaining work

### Complete Graham–Ringrose proof

Routed item92 remains open: read and decompose the complete external Graham–Ringrose proof, or the exact Iwaniec–Kowalski Theorem12.13 version used by Bennett–Siksek. The published quotation is not its proof. Routed item95 now has exact bounded character factors, all-integer reconstruction, distinguished primitivity, r<10c+2 and R₀<k/2 through large-conductor-character-blocks. The conductor shape is imported from the two exact CA.1 nodes and binary primitivity from its exact CA.1 supplier. Remaining analytic work must preserve ambient moduli for general factors, permit one factor and empty principal families, and align real interval endpoints.

### Full distinct-quadratic cancellation proposition

Routed item44 (Proposition8.2) still requires the analytic large-conductor estimate and the final combination with small-conductor-product-cancellation. The CRT character interfaces and their size hypotheses are now decomposed. The existing uniform large-conductor numeric threshold gives γ=2^(−10c−6) only after its analytic premise is established. Read the entire external proof and match its real interval length k/2, so odd k yields exactly the inherited natural interval (k div2,k]. No full cancellation theorem is claimed from character factorization alone.

### ExponentialSumsAndCircleMethod:ES.0 remaining source decomposition

Fifty-eight nodes cover the inherited conductor/CRT/numerical work and a thirteen-node finite q–van der Corput chain. The exact shift, support, energy and lag bounds are decomposed, including the conditional bound 4Nr+2NT. Complete correlation estimates, the full Graham–Ringrose proof and Proposition 8.2 assembly remain open, as do the other Weyl, stationary-phase and completion targets.

### ExponentialSumsAndCircleMethod:ES.1 remaining source decomposition

Read exact source proofs for torus counting identities, normalized Haar measure, major/minor arc definitions and disjointness, and weighted/smoothed limiting arguments; finite additive orthogonality and torus Fourier basics already exist and must be reused.

### ExponentialSumsAndCircleMethod:ES.2 remaining source decomposition

Select and read an entire efficient-congruencing or decoupling proof; decompose restriction/Kakeya inputs and Vinogradov mean values with both expected terms and epsilon loss, plus every low-degree case actually needed.

### ExponentialSumsAndCircleMethod:ES.3 remaining source decomposition

Specify singular integral/series, their convergence and Euler factorization, normalized p-adic densities, and positivity from explicitly nonsingular local solutions at every place. Existing Haar infrastructure alone does not prove these analytic assertions.

### ExponentialSumsAndCircleMethod:ES.4 remaining source decomposition

Separate Waring, prime-weighted, and forms-in-many-variables endpoints with exact variable/degree/singular-locus/error ranges. Import uniform progression estimates from AN.3 and Vaughan/Heath-Brown Type I/II interfaces from SV.2; unweighted mean values do not prove prime estimates.

### ExponentialSumsAndCircleMethod:ES.5 remaining source decomposition

Read and decompose determinant-method point bounds and arithmetic-geometric comparison interfaces with explicit degree/coefficient/height dependence; distinguish upper bounds from positive-main-term asymptotics. Bounded-height finiteness and Pila–Wilkie are not substitutes.

## Inherited checkpoint verification and atlas landmarks

The packet and reader describe a plan. The suggested file supplies typed signatures, API items and examples, and makes no implementation claim. This inherited checkpoint used six ES.0 planets; the continuation below updates the shortlist without removing a mathematical declaration.

The prior CRT checkpoint recorded zero checker errors and warnings. It contained forty-five nodes (twenty-eight lemmas, sixteen theorems and one definition), ninety-six baseline declarations, twenty-eight API items, forty-eight packet tests, eight gaps and no requests. The new definition has seven API items and six tests. All thirty-five inherited node objects, their API/tests, the three source findings, all source-version objects and the six planets are preserved.

The prior CRT checkpoint recorded a complete suggested-file compilation with exactly118 expected unproved-declaration warnings and no other diagnostics. It contains68 typed examples. Its SHA-256 is `82b94d488f040a44d6fc03eed8cc2ff2e42a9df464c41bbe5198405364da52dd`. The build byte-verified all8,482 reached Mathlib sources and uses no Tau Ceti imports.

Three temporary complete Lean checks validated the equivalence composition, its unit restriction formula and the general level-exclusion identity. Their printed axiom lists contain no placeholder axiom. They were performed only inside the authorized suggested file and removed before its final compilation. These checks do not implement the other proposed declarations.

Exact character tables use rational arguments modulo one, with a separate nonunit-zero marker, and enumerate all characters in the selected finite unit groups rather than only quadratic characters. The regressions cover512 modulus families,8,882 characters,19,220 factor-conductor comparisons,897,006 signed CRT identities and2,051,196 mask identities. A further1,090 integrated bounded packings test31,674 primitive character inputs,69,930 component conductors and1,995,462 signed identities. Those packings include137 empty principal families and188 cases with exactly two small blocks. These are finite checks of the conventions and adapters, not proofs of the general theorems or of Graham–Ringrose.


## Finite q–van der Corput continuation

This continuation preserves all forty-five inherited mathematical declarations and adds thirteen. It gives an exact finite version of the elementary shift argument in D. H. J. Polymath, *New equidistribution estimates of Zhang type*, Proposition 4.12(ii), published pp.2108–2110. The published proposition and proof on pp.2106–2110 were read; this is not whole-paper coverage. The [published PDF](https://msp.org/ant/2014/8-9/ant-v8-n9-p03-s.pdf) has SHA-256 220232ac124e2adb984fd6082d959057314a0006adc7cdf10d7185683bba47a8.

Write I=(A,A+N]∩ℤ and suppose b vanishes outside I. The shifts are 0,…,H−1, their envelope is J=(A−(H−1)r,A+N], and its exact cardinality is W=N+(H−1)r. The periodic factor a is bounded by one. Correlations conjugate the second factor, and differences of shift indices are integers. There is no cyclic wraparound and no implicit smooth weight. The undivided bounds allow N=0 and r=0; the optimized floor-division bound requires 1≤r≤N. Its separate correlation hypothesis is not an assumed Graham–Ringrose theorem.

### 46. Finite interval correlation

ExponentialSumsAndCircleMethod:ES.0/interval-correlation — definition; unchecked.

For A∈ℤ, N∈ℕ, b:ℤ→ℂ and t∈ℤ define intervalCorrelation(A,N,b,t)=Σ_{n∈(A,A+N]} b(n+t) conjugate(b(n)). This finite expression is defined without a support hypothesis. Its autocorrelation identities require b to vanish outside (A,A+N]. No cyclic wraparound is used.

Proposed declaration: intervalCorrelation.

Hypotheses and conventions:

- A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.
- The second factor, not the shifted first factor, is conjugated.

Proof plan:

1. Use the existing finite integer interval, complex conjugation and finite sum; no replacement sequence, convolution or character carrier is introduced.

Prerequisites: mathlib:Int.card_Ioc, mathlib:Complex.mul_conj'.

Uses:

- Polymath 2014, proof of Proposition 4.12(ii), (4-22)–(4-24): Express shifted products with their precise complex conjugation and separate diagonal energy from off-diagonal lags.

- ES.0/shift-energy-expansion and /q-vdc-lag-bound: Compress H² shift pairs into H−1 positive lags with multiplicity H−h.

- ES.0/q-vdc-uniform-correlation: Accept a correlation bound from a separately proved analytic or finite-field estimate without duplicating that supplier.

API:

- TauCeti.ExponentialSumsPlan.intervalCorrelation_empty (simp): intervalCorrelation(A,0,b,t)=0 for arbitrary A,b,t.

- TauCeti.ExponentialSumsPlan.interval_correlation_zero (compatibility): C(0) is the real energy Σ_{n∈I}‖b(n)‖², cast into ℂ. Promoted to interval-correlation-zero.

- TauCeti.ExponentialSumsPlan.interval_correlation_neg (relation): If b vanishes outside I, then C(−t)=conjugate(C(t)). Promoted to interval-correlation-neg.

- TauCeti.ExponentialSumsPlan.interval_correlation_vanish (simp): If b vanishes outside I and N≤|t|, then C(t)=0. Promoted to interval-correlation-vanish.

- TauCeti.ExponentialSumsPlan.intervalCorrelation_scale (compatibility): For z∈ℂ, intervalCorrelation(A,N,z b,t)=‖z‖² intervalCorrelation(A,N,b,t). No support hypothesis is needed.

- TauCeti.ExponentialSumsPlan.intervalCorrelation_translate (compatibility): For s∈ℤ, intervalCorrelation(A−s,N,n↦b(n+s),t)=intervalCorrelation(A,N,b,t). No support hypothesis is needed.

Contract tests:

- correlation_empty (degenerate): For arbitrary b and t, intervalCorrelation(−3,0,b,t)=0.

- correlation_complex_diagonal (computation): For b(1)=1,b(2)=i and b zero elsewhere, intervalCorrelation(0,2,b,0)=2.

- correlation_positive_phase (non-example): For that b, intervalCorrelation(0,2,b,1)=i, not −i or 1.

- correlation_negative_phase (computation): For that b, intervalCorrelation(0,2,b,−1)=−i.

- correlation_no_wraparound (non-example): For that b, intervalCorrelation(0,2,b,2)=0, not 2.

- correlation_negative_interval (computation): For b(−1)=i and b zero elsewhere, intervalCorrelation(−2,1,b,0)=1.

Acceptance:

- For b(1)=1,b(2)=i and b zero elsewhere, C(1)=i and C(−1)=−i.
- N=0 gives zero for all b and shifts.

Source: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.

### 47. Zero-lag correlation energy

ExponentialSumsAndCircleMethod:ES.0/interval-correlation-zero — lemma; unchecked.

For arbitrary A,N,b, intervalCorrelation(A,N,b,0)=(Σ_{n∈I}‖b(n)‖²:ℝ), cast into ℂ. In particular its imaginary part is zero and its real part is nonnegative.

Proposed declaration: interval_correlation_zero.

Hypotheses and conventions:

- A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.
- No support hypothesis is required.

Proof plan:

1. Expand intervalCorrelation at shift zero.

2. Apply Complex.mul_conj' termwise and commute the real-to-complex cast with the finite sum.

Prerequisites: ExponentialSumsAndCircleMethod:ES.0/interval-correlation, mathlib:Complex.mul_conj'.

Acceptance:

- b(1)=i on I={1} gives energy one; the unconjugated square would be −1.

Source: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.

### 48. Hermitian correlation symmetry

ExponentialSumsAndCircleMethod:ES.0/interval-correlation-neg — lemma; unchecked.

If b vanishes outside I, then intervalCorrelation(A,N,b,−t)=conjugate(intervalCorrelation(A,N,b,t)) for every integer t.

Proposed declaration: interval_correlation_neg.

Hypotheses and conventions:

- A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.
- b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.

Proof plan:

1. In the sum at −t retain only n for which n and n−t lie in I; the other terms vanish by the support hypothesis.

2. Reindex by m=n−t between this intersection and the intersection defining C(t). Translation is bijective with inverse m↦m+t.

3. Conjugate termwise and commute complex multiplication. The equality is not claimed for an arbitrary function restricted only in its second factor.

Prerequisites: ExponentialSumsAndCircleMethod:ES.0/interval-correlation, mathlib:Finset.prod_bij, mathlib:Finset.prod_subset.

Acceptance:

- For the two-point values (1,i), the lags 1 and −1 are i and −i.
- Without support, take I={1}, b(1)=b(2)=1,b(0)=0: C(1)=1 but C(−1)=0.

Source: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.

### 49. Disjoint-shift correlation vanishing

ExponentialSumsAndCircleMethod:ES.0/interval-correlation-vanish — lemma; unchecked.

If b vanishes outside I and N≤|t|, then intervalCorrelation(A,N,b,t)=0.

Proposed declaration: interval_correlation_vanish.

Hypotheses and conventions:

- A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.
- b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.

Proof plan:

1. If n and n+t both belong to the half-open integer interval of length N, subtract the strict lower and weak upper inequalities to obtain −N<t<N.

2. Under N≤|t|, at least one value in each product is therefore zero. Sum the zero terms; N=0 is the empty sum.

Prerequisites: ExponentialSumsAndCircleMethod:ES.0/interval-correlation.

Acceptance:

- At |t|=N the correlation is already zero.
- N=1 and t=0 is not a vanishing case for a nonzero singleton.

Source: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.

### 50. Support of the averaged shifts

ExponentialSumsAndCircleMethod:ES.0/shift-support-envelope — lemma; unchecked.

Assume H>0 and b vanishes outside I. If k<H and n∉J, then b(n+kr)=0. Thus every shift in 0,…,H−1 is supported in J, whose cardinality is exactly W=N+(H−1)r.

Proposed declaration: shift_support_envelope.

Hypotheses and conventions:

- A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.
- b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.
- H>0; r≥0 by its natural type.

Proof plan:

1. For n≤A−(H−1)r and k≤H−1, n+kr≤A. For n>A+N, n+kr>A+N since r≥0.

2. Apply the support hypothesis in either case.

3. Int.card_Ioc evaluates card(J) as its nonnegative endpoint difference W. This envelope may contain gaps when r>N; it is not asserted to be the exact union of supports.

Prerequisites: mathlib:Int.card_Ioc.

Acceptance:

- N=2,r=3,H=2 gives J=(A−3,A+2] with five points, although the two shifted supports are disjoint.
- H=1 gives J=I; r=0 also gives J=I.
- For N=0 all shifted values vanish even if J is nonempty.

Source: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.

### 51. Translation of a supported finite sum

ExponentialSumsAndCircleMethod:ES.0/supported-shift-sum — lemma; unchecked.

For H>0, k<H and any f:ℤ→ℂ vanishing outside I, Σ_{n∈J} f(n+kr)=Σ_{m∈I} f(m).

Proposed declaration: supported_shift_sum.

Hypotheses and conventions:

- A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.
- b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.
- The support hypothesis applies to f; b is not used in this lemma. H>0 and k<H.

Proof plan:

1. Translate the exact interval (A−kr,A+N−kr] by n↦n+kr onto I; inverse translation proves a finite bijection.

2. That translated interval is contained in J by 0≤kr≤(H−1)r. Extend its sum to J: each extra term is zero by the support hypothesis.

Prerequisites: ExponentialSumsAndCircleMethod:ES.0/shift-support-envelope, mathlib:Finset.prod_bij, mathlib:Finset.prod_subset.

Acceptance:

- For f supported only at A+1, the term with k=H−1 is at the leftmost permitted integer A+1−(H−1)r.
- Using I instead of J loses translated terms at the boundary.

Source: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.

### 52. Periodic-factor shift averaging

ExponentialSumsAndCircleMethod:ES.0/periodic-shift-averaging — lemma; unchecked.

Let a:ℤ→ℂ satisfy a(n+r)=a(n) for every integer n, let b vanish outside I and let H>0. Set S=Σ_{n∈I}a(n)b(n). Then H S=Σ_{n∈J} a(n)(Σ_{k=0}^{H−1} b(n+kr)), with H cast into ℂ.

Proposed declaration: periodic_shift_averaging.

Hypotheses and conventions:

- A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.
- b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.
- Function.Periodic a r; H>0. No bound on a or b is required for this identity.

Proof plan:

1. Apply supported-shift-sum to f(n)=a(n)b(n) for every k<H; its support follows from that of b.

2. Function.Periodic.nat_mul identifies a(n+kr) with a(n).

3. Sum the H identical translated sums, interchange the finite n,k sums and factor a(n).

Prerequisites: ExponentialSumsAndCircleMethod:ES.0/supported-shift-sum, mathlib:Function.Periodic.nat_mul.

Acceptance:

- r=0 is permitted and gives repeated identical shifts.
- H=1 is the original sum; H=0 is excluded from this averaging contract.

Source: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.

### 53. Shift-pair correlation reindexing

ExponentialSumsAndCircleMethod:ES.0/shift-pair-correlation — lemma; unchecked.

Let H>0, k,l<H and b vanish outside I. Then Σ_{n∈J} b(n+kr) conjugate(b(n+lr))=intervalCorrelation(A,N,b,(k−l)r), where k−l is computed in ℤ, not by natural subtraction.

Proposed declaration: shift_pair_correlation.

Hypotheses and conventions:

- A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.
- b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.
- H>0; k,l<H.

Proof plan:

1. Put f(m)=b(m+(k−l)r) conjugate(b(m)); this is supported in I because its second factor is zero elsewhere.

2. Apply supported-shift-sum with shift l. Ring arithmetic identifies m=n+lr and the first argument with n+kr.

3. Unfold only the defining finite sum of intervalCorrelation.

Prerequisites: ExponentialSumsAndCircleMethod:ES.0/interval-correlation, ExponentialSumsAndCircleMethod:ES.0/supported-shift-sum.

Acceptance:

- k=0,l=1 produces the negative lag −r.
- At k=l the equality recovers diagonal energy.

Source: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.

### 54. Multiplicity of ordered shift differences

ExponentialSumsAndCircleMethod:ES.0/shift-pair-lag-count — lemma; unchecked.

For every natural H and every F:ℤ→ℂ, Σ_{k=0}^{H−1}Σ_{l=0}^{H−1} F(k−l)=H F(0)+Σ_{h=1}^{H−1}(H−h)(F(h)+F(−h)), with differences in ℤ and multiplicities cast into ℂ.

Proposed declaration: shift_pair_lag_count.

Hypotheses and conventions:

- H∈ℕ may be zero. The positive-lag sum is over the natural interval [1,H).

Proof plan:

1. Partition the ordered square into k=l, k>l and k<l. The diagonal has H elements.

2. For fixed 1≤h<H, pairs with k−l=h are exactly (j+h,j) for 0≤j<H−h; the inverse reads j=l. The opposite triangle is obtained by swapping the coordinates.

3. Use these finite bijections and sum each constant F(±h) exactly H−h times. This gives both the multiplicity and the empty H=0,1 cases.

Prerequisites: mathlib:Finset.prod_bij.

Acceptance:

- H=0 gives zero; H=1 gives F(0).
- H=3 gives 3F(0)+2(F(1)+F(−1))+F(2)+F(−2).

Source: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.

### 55. Energy of the averaged shifts

ExponentialSumsAndCircleMethod:ES.0/shift-energy-expansion — lemma; unchecked.

For H>0 and b supported in I, Σ_{n∈J}‖Σ_{k=0}^{H−1} b(n+kr)‖²=H D+2Σ_{h=1}^{H−1}(H−h) Re C(hr), where D=Σ_{n∈I}‖b(n)‖² and C(t)=intervalCorrelation(A,N,b,t).

Proposed declaration: shift_energy_expansion.

Hypotheses and conventions:

- A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.
- b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.
- H>0. The right side is real; individual Re C(hr) may be negative.

Proof plan:

1. Use Complex.mul_conj' on the inner sum and Finset.sum_mul_sum to expand its squared norm into ordered shift pairs.

2. Interchange the finite sums and apply shift-pair-correlation.

3. Apply shift-pair-lag-count to F(t)=C(tr), use interval-correlation-neg to pair opposite lags, and interval-correlation-zero for the diagonal. Take real parts to obtain the stated real equality.

Prerequisites: ExponentialSumsAndCircleMethod:ES.0/shift-pair-correlation, ExponentialSumsAndCircleMethod:ES.0/shift-pair-lag-count, ExponentialSumsAndCircleMethod:ES.0/interval-correlation-neg, ExponentialSumsAndCircleMethod:ES.0/interval-correlation-zero, mathlib:Complex.mul_conj', mathlib:Finset.sum_mul_sum.

Acceptance:

- For b=1 on an interval of N=2, r=1,H=2, energy is 6, not the diagonal-only value 4.
- For b values (1,−1), N=2,r=1,H=2, energy is 2, so the real parts cannot be replaced by norms inside this equality.

Source: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.

### 56. Finite q–van der Corput energy bound

ExponentialSumsAndCircleMethod:ES.0/q-vdc-energy-bound — theorem; unchecked.

Let H>0, a be r-periodic with ‖a(n)‖≤1 for every integer n, and b vanish outside I. Then H²‖Σ_{n∈I}a(n)b(n)‖²≤W Σ_{n∈J}‖Σ_{k=0}^{H−1}b(n+kr)‖², where W=N+(H−1)r.

Proposed declaration: q_vdc_energy_bound.

Hypotheses and conventions:

- A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.
- b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.
- H>0; a is r-periodic and bounded in norm by one.

Proof plan:

1. Use periodic-shift-averaging and take norms. The triangle inequality and the bound on a give H‖S‖≤Σ_{n∈J}‖Σ_k b(n+kr)‖.

2. Both sides are nonnegative; square the inequality. Apply the existing finite Cauchy–Schwarz inequality to the real sequences 1 and the inner norms.

3. The sum of the constant squares is card(J)=W by shift-support-envelope. Keep this exact factor rather than a hidden constant.

Prerequisites: ExponentialSumsAndCircleMethod:ES.0/periodic-shift-averaging, ExponentialSumsAndCircleMethod:ES.0/shift-support-envelope, mathlib:norm_sum_le, mathlib:Finset.sum_mul_sq_le_sq_mul_sq.

Acceptance:

- H=1 reduces to the interval Cauchy–Schwarz bound.
- N=0 has S=0 and zero energy, even when W>0.
- The hypothesis on a cannot be omitted: a=2,b supported at one point,H=N=1 gives 4≤1 falsely.

Source: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.

### 57. Finite q–van der Corput lag bound

ExponentialSumsAndCircleMethod:ES.0/q-vdc-lag-bound — theorem; unchecked.

Under q-vdc-energy-bound's hypotheses, H²‖Σ_{n∈I}a(n)b(n)‖²≤W(H D+2Σ_{h=1}^{H−1}(H−h)‖C(hr)‖), where D=Σ_{n∈I}‖b(n)‖², C(t)=intervalCorrelation(A,N,b,t), and W=N+(H−1)r.

Proposed declaration: q_vdc_lag_bound.

Hypotheses and conventions:

- A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction.
- b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.
- H>0; a is r-periodic and bounded in norm by one.

Proof plan:

1. Substitute shift-energy-expansion into q-vdc-energy-bound.

2. For each positive lag use Complex.re_le_norm. The factors H−h and W are nonnegative, so replacing real parts by norms preserves the upper bound.

Prerequisites: ExponentialSumsAndCircleMethod:ES.0/q-vdc-energy-bound, ExponentialSumsAndCircleMethod:ES.0/shift-energy-expansion, mathlib:Complex.re_le_norm.

Acceptance:

- The coefficient of positive-lag norms is two and their multiplicity is H−h.
- For H=1 the off-diagonal sum is empty.
- This estimates an arbitrary supported b; it does not assume b is a multiplicative character.

Source: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.

### 58. One-step q–van der Corput estimate

ExponentialSumsAndCircleMethod:ES.0/q-vdc-uniform-correlation — theorem; unchecked.

Suppose 1≤r≤N, a:ℤ→ℂ is r-periodic, ‖a(n)‖≤1, b vanishes outside I=(A,A+N], and ‖b(n)‖≤1 for n∈I. Put H=N div r. If T≥0 and ‖intervalCorrelation(A,N,b,hr)‖≤T for every natural 1≤h<H, then ‖Σ_{n∈I}a(n)b(n)‖²≤4Nr+2NT. All terms in this inequality are real casts; div is natural floor division.

Proposed declaration: q_vdc_uniform_correlation.

Hypotheses and conventions:

- A∈ℤ; N,r∈ℕ with 1≤r≤N; T∈ℝ with T≥0.
- The correlation assumption retains the zero-extended finite interval; it is not a complete sum or a periodic wraparound correlation.

Proof plan:

1. Set H=N div r. Integer division gives H≥1, Hr≤N<(H+1)r≤2Hr, and W=N+(H−1)r≤2N.

2. Use q-vdc-lag-bound. The pointwise bound on b and Int.card_Ioc give D≤N.

3. Bound each positive-lag norm by T. Gauss' finite sum formula gives 2Σ_{h=1}^{H−1}(H−h)=H(H−1). Thus the bound after dividing by H² is W(N/H+(H−1)T/H).

4. Use N/H≤2r, (H−1)/H≤1 and W≤2N to obtain 4Nr+2NT. These are elementary inequalities between nonnegative reals; division is legitimate because H>0.

Prerequisites: ExponentialSumsAndCircleMethod:ES.0/q-vdc-lag-bound, mathlib:Int.card_Ioc, mathlib:Finset.sum_range_id_mul_two.

Acceptance:

- r=N gives H=1 and an empty correlation premise; the non-sharp 4N² bound is valid.
- For N=0 or r=0 the theorem is not invoked; those cases are already covered by the undivided energy bound.
- In the Polymath application a is the r-periodic factor and b is the remaining factor multiplied by its supported weight. A separate bound for C(hr) is still needed; no Weil or Graham–Ringrose estimate is hidden in T.

Source: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2110, K=⌊N/r⌋ and (4-22)–(4-24). Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates.

### Source-acquisition findings

The [author-hosted Iwaniec–Kowalski extract](https://people.math.ethz.ch/~kowalski/ik-ant-exp-sums.pdf) contains Chapter 11, not Chapter 12. Its cover and pp.269–271 were read, and p.271 was visually checked. SHA-256: b4c346a8459e9a0450a16a22438220cf7f40926d875beacbcdeccdfc75c5eee5. A separate university download was only a table of contents; the publisher catalogue returned no readable text. Consequently these three new findings concern the author copy only, not the uncollated version of record.

- ExponentialSumsAndCircleMethod/E12: In additive-character orthogonality the exceptional argument is x=0, not x=1. Over F₂ the two additive characters have values 1,1 at zero, summing to 2, and 1,−1 at one, summing to 0. The following sentence itself says the relation solves x=0.

- ExponentialSumsAndCircleMethod/E13: The subgroup consists of characters whose orders divide δ, equivalently characters annihilated by the δ-th power map. Exact order δ is not a subgroup when δ>1. For F₅ and δ=4 the character group has four elements but only two have exact order four. The identity has order one and must belong to every subgroup.

- ExponentialSumsAndCircleMethod/E14: For the degree-n extension F_n/F, solutions of a=σ(b)/b are unique up to multiplication by F*, the fixed-field units, not by arbitrary F_n*. If b and c are two solutions, σ(c/b)=c/b, so c/b lies in F*. For F₉/F₃ the map b↦b² on eight nonzero elements has kernel {1,−1}, not all eight elements.

The [authors’ corrections list](https://people.math.ethz.ch/~kowalski/corrections-ant.pdf), dated March 8, 2010, was read in full; it has no entry for these slips. Author-page and targeted web searches located no correction. The findings await independent review. They do not supply or change the new finite q–van der Corput argument, and the existing reviewed E2, E3 and E11 are unchanged.

### Continuation coverage and verification

Fifty-eight nodes cover the inherited conductor/CRT/numerical work and a thirteen-node finite q–van der Corput chain. The exact shift, support, energy and lag bounds are decomposed, including the conditional bound 4Nr+2NT. Complete correlation estimates, the full Graham–Ringrose proof and Proposition 8.2 assembly remain open, as do the other Weyl, stationary-phase and completion targets.

The planet shortlist replaces Product-period character bound with q–van der Corput inequality; the former theorem remains intact. There are six planets, all in ES.0. All six stages remain partial, with eight gaps and no requests. 

Pinned-index blueprint checker: zero errors and zero warnings; errata checker: no errors; intake path/schema checks: four files, zero problems. Fifty-eight nodes (37 lemmas, 19 theorems, two definitions), 105 baseline entries, 34 API items and 54 packet tests, six planets, eight gaps, no requests.

Complete suggested file compiles at the pins with exactly 146 expected unproved-declaration warnings and no other diagnostics. It contains 66 definition/theorem signatures and 80 typed examples. All 8,482 reached Mathlib source files were byte-checked against the pinned sources; no Tau Ceti imports.

A separate temporary proof check has three complete general theorems (empty correlation, zero-lag energy and complex-scalar scaling) and seven complete examples. It compiled with no warnings or errors; the printed axiom lists contain only propext, Classical.choice and Quot.sound. The 1,630 reached Mathlib source files were checked against the pin. This does not implement the thirteen proposed roadmap declarations.

Exact Gaussian-rational regressions passed: 1,323 zero-lag identities; 19,335 Hermitian/support cases; 21,168 periodic averages and 21,168 energy-identity/energy-bound/lag-bound cases; 158,760 shift-pair identities; 3,888 floor-optimized bounds; 25 ordered-lag counts; nine rejected mutations; three source-issue witnesses. Lag norms use exact rational lower certificates, not floating-point acceptance; these are finite tests, not general proofs.

All 45 inherited mathematical node objects and 96 baseline entries preserved; only the product-period node's planet marker moves to the new q–van der Corput endpoint. Inherited source entries/findings/versions retained, with two sources, three unreviewed author-copy findings and three version entries added. Every node is unchecked; all six stages remain partial. The static index omits generated Finset.sum_bij and sum_subset, so their indexed prod_bij/prod_subset declarations are cited with the explicit Multiplicative ℂ specialization; no index or baseline is modified.
