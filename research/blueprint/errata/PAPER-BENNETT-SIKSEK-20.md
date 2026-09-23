# Mistakes and rejected candidates in Bennett–Siksek

Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums*, Annals 191 (2020), 355–392, DOI 10.4007/annals.2020.191.2.2.

Original errata: Claude Code, `cc-fb70e5`, 22 September 2026. Independent review: Codex, `codex-7e92bd`, job `REV-ERRATA-PAPER-BENNETT-SIKSEK-20`, 23 September 2026. The adjacent JSON contains **nineteen confirmed findings and three rejected candidates**. E11 and E18 have been narrowed; E8, E12 and E13 are rejected. E20–E22 were added by this review.

The [published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf) has SHA-256 `3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf`; Bennett's hosted copy is identical. The earlier [arXiv v1](https://arxiv.org/pdf/1709.01022v1) has SHA-256 `6998123fab2c8cd4b9da9aa90478461de883222782f879fcfe18d8cd9b91d56f`. It lacks the addendum, and lacks the stray f in E21. Relevant other passages agree.

The [review report](../reviews/REV-ERRATA-PAPER-BENNETT-SIKSEK-20.md) records exact source coverage, public references and the bounded correction search. No later version or erratum correcting these entries was found. A false auxiliary assertion can affect a stated result even when the main theorem is unaffected; the JSON now makes that distinction.

Theorem 2's printed bound is exp(10^k), as verified on the image. It is not exp(10k); the latter is a text-extraction artefact, not a source error. The repairs below preserve the intended exponent-bound argument, with the larger threshold in E15 when using (36). This review does not claim to reprove every external theorem or audit the entire paper.

## E1. Discriminant coefficient

**Confirmed** · misprint · affects nothing.

Lemma 3.2, p.361, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) Compared with arXiv:1709.01022v1, pp.6.

Printed: "Its discriminant is Δ_a = 64(a_a b_a c_a)² = (2⁸/g⁶)(n+id)²(n+jd)²(n+(2j−i)d)²."

Δ_a = 16(a_a b_a c_a)² = (2⁶/g⁶)(n+id)²(n+jd)²(n+(2j−i)d)².

For y² = x³ + a₂x² + a₄x, Δ = 16a₄²(a₂² − 4a₄). For E_a: Y² = X(X−a)(X+c), a₂ = c − a and a₄ = −ac, so Δ = 16a²c²(a+c)² = 16(abc)² since a+b+c = 0; with b_a = −2(n+jd)/g this is 2⁶/g⁶ times the product. The extraction found this (item 16, report D1); the review re-derived it.

Review: Confirmed from the publisher image and v1 p.6, with an independent symbolic calculation of the Weierstrass discriminant. Classified as a coefficient misprint: the displayed model fixes the intended discriminant and all later odd valuations are unchanged.

## E2. Universal divisor bound

**Confirmed** · error · affects a stated result.

§8.1, proof of Proposition 8.2, p.378 (and its reuse in §12, p.388), in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) Compared with arXiv:1709.01022v1, pp.20–21 (the §12 reuse is absent).

Printed: "We will now apply Theorem 6. Let q = q₁ and note that we have (see, e.g., page 334 of [19]) τ(q) ≤ q^{1/log log 3q} for all q ≥ 1."

Use τ(q) ≪_ε q^ε for each fixed ε>0. This holds uniformly with a constant, and is enough both for τ(q)^(r²)<q^(1/2) at large q with bounded r and for the §12 choice ε=1/12.

For q=120 the claimed all-q bound gives 14.892219892447224<16=τ(120). The subpower repair follows elementarily: for p≥2^(1/ε), a+1≤2^a≤p^(εa); the finitely many smaller primes each contribute a finite supremum of (a+1)/p^(εa). Multiply over prime powers. This repairs the uses without relying on an unverified exact constant from the cited book.

Review: Confirmed by independently evaluating τ(120)=16 and the printed upper bound 14.892219892447224. Changed reach: the explicitly universal auxiliary assertion is false, although the later applications require only a subpower estimate.

## E3. Product conductor versus ambient modulus

**Confirmed** · error · affects the proof.

Proof of Proposition 8.2, p.377, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) Compared with arXiv:1709.01022v1, pp.19–21.

Printed: "Let χ = χ₁χ₂, and write M = lcm(N₁,N₂) for the conductor of χ. We can thus rewrite χ = ηψ, where η is primitive of conductor M₁ and ψ is principal of conductor M₂ with M = M₁M₂ and gcd(M₁,M₂) = 1."

M = lcm(N₁,N₂) is an ambient modulus of χ, not in general its conductor. With η the primitive character inducing χ, M₁ = cond(η) and M₂ the product of the primes dividing M but not M₁, one has χ(m) = η(m)·1_{gcd(m,M₂)=1}, gcd(M₁,M₂) = 1, M₁M₂ | M and M₂ | gcd(N₁,N₂); M = M₁M₂ can fail at 2.

For distinct primitive quadratic characters, an odd prime present in exactly one conductor remains in the primitive product; primes deleted entirely therefore divide gcd(N₁,N₂). At 2 the conductor exponent can shrink without disappearing: χ_8χ_−8=χ_−4. Taking M₂ as the squarefree product of the primes of M absent from M₁ gives χ=η·1_(gcd(·,M₂)=1), M₁M₂|M and M₂|gcd(N₁,N₂). The Case 2 complete-period bound uses M₁M₂, not the false equality M=M₁M₂. The Case 1 size bounds remain valid.

Review: Confirmed by the exact periodic identity χ_8χ_−8=χ_−4, whose conductor is 4 rather than lcm(8,8)=8. Checked the repair in both cases: the relevant period in Case 2 is M₁M₂, which divides M; the factor-count bound uses only log(M₁M₂)≤log M.

## E4. Signed square solutions

**Confirmed** · error · affects a stated result.

Lemma 3.1 and equation (6), p.360, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) Compared with arXiv:1709.01022v1, pp.5.

Printed: "Thus we may write (6) n + id = A_i y_i^ℓ, 0 ≤ i ≤ k−1, where A_i are positive integers divisible only by primes < k, whereas y_i are divisible only by primes ≥ k."

For odd ℓ, write n + id = A_i y_i^ℓ with A_i > 0 and y_i signed. For ℓ = 2 and a negative term, the sign must go into A_i.

The terms −3,−1,1,3 multiply to 9, with gcd(−3,2)=1. A negative term cannot equal a positive A_i times an integer square. For odd ℓ a signed y_i works. The case ℓ=2 already satisfies the main exponent bound, so one can exclude it before using positive A_i.

Review: Confirmed with an actual primitive solution: (n,d,k,y,ℓ)=(−3,2,4,3,2), whose first two terms are negative. The paper itself gives arbitrarily long signed square-product families on p.356. Changed reach to the stated factorization, while the large-exponent proof is unaffected.

## E5. The omitted additive counting term

**Confirmed** · error · affects the proof.

§12, proof of Proposition 12.3, p.388, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) The §12 addendum is absent from arXiv:1709.01022v1.

Printed: "… the number of n ≤ k with a + nd divisible by r is at most k/r + O(1) ≪ k/r, which is ≪ k/q^{1/3} if r ≥ q^{1/3}/2."

The count is at most k/r + 1, and the +1 terms must be summed separately. With q ≤ k⁴ and τ(q) ≪ q^{1/12} their total is O(k^{1/3}(log k)^{61}), negligible against k/(log k)^{1/4}.

If gcd(r,d)>1 there are no solutions because gcd(a,d)=1. Otherwise there is one residue class modulo r, with at most k/r+1 representatives. A single representative can occur when r≫k, so no uniform O(k/r) estimate follows. Summing gives kΣ_(q∈Q(k))τ(q)/q^(1/3)+Σ_(q∈Q(k))τ(q). The first term is treated by Proposition 12.1 as printed; the second is O(k^(1/3)(log k)^61).

Review: Confirmed the nonuniform deletion of the additive one. Independently summed the omitted terms using #Q(k)≪(log k)^61, q≤k^4 and τ(q)≪q^(1/12). The correction is O(k^(1/3)(log k)^61)=o(k/(log k)^(1/4)).

## E6. Conductor support: divisibility suffices

**Confirmed** · gap · affects the proof.

§12, final paragraph, p.388, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) The §12 addendum is absent from arXiv:1709.01022v1.

Printed: "Since N_a^odd is the largest odd squarefree divisor of A_iA_jA_{2j−i}, it follows that gcd(N_a,A_i)·gcd(N_a,A_j)·gcd(N_a,A_{2j−i}) ≥ N_a/8."

Only N_a^odd | A_iA_jA_{2j−i} is justified. With N_a ≤ 8N_a^odd this already gives the displayed inequality.

Proposition 6.1 says N_a^odd divides M_a, and (9) places its odd support in A_iA_jA_(2j−i). Neither statement identifies all primes of that product with primes of N_a. Since N_a^odd is squarefree, every one of its primes occurs in at least one of the three gcds, so their product is at least N_a^odd≥N_a/8. No equality of prime supports is needed.

Review: Confirmed as an unsupported equality, not as a counterexample under the global Diophantine hypotheses. Proposition 6.1 and (9) provide divisibility only. Replacing the equality by that divisibility proves the needed inequality; changed reach to the local proof assertion.

## E7. The squared constant

**Confirmed** · misprint · affects nothing.

§8.2, end of the proof of Proposition 8.1, p.380, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) Compared with arXiv:1709.01022v1, pp.21–22.

Printed: "As 1/68 < ϖ², we have inequality (33), as desired", where (32) on p.379 defines ϖ = 0.1239².

"As 1/68 < ϖ", i.e. 1/68 < 0.1239².

1/68 ≈ 0.0147 < 0.1239² ≈ 0.01535, but 0.1239⁴ ≈ 0.000236 < 1/68, so the printed comparison is false; the intended one is true. Checked on the page images of pp.379–380. The extraction found this (item 99, report D7).

Review: Confirmed on both formula pages: ϖ=0.01535121, ϖ²=0.0002356596484641, and 1/68=0.01470588235…. Exact rational comparisons give ϖ²<1/68<ϖ.

## E8. The logarithmic endpoint: rejected

**Rejected** · gap · affects nothing.

§10, proof of Theorem 2, pp.384–385, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) Compared with arXiv:1709.01022v1, pp.23, 26.

Printed: Condition "(iii) N_a is not divisible by primes in the range [(log k)^{1−10^{−4}}, 10⁴ log k]" (closed on the left), where Proposition 9.1(III) supplies only the open-left range "((log k)^{1−10^{−4}}, 10⁴ log k]".

No correction is necessary. The two intervals contain exactly the same primes for every integer k>1.

If p=(log k)^(9999/10000) were a prime, then (log k)^9999=p^10000 would make log k a nonzero algebraic number. Hermite–Lindemann would imply exp(log k)=k is transcendental, contrary to k being an integer. Hence the disputed endpoint cannot be prime, and the printed maximal-family and strict P(N_a) arguments are valid with c₁=10^−4.

Review: Rejected after checking the integer hypothesis on k in Proposition 9.1. The apparent endpoint discrepancy does not change the prime set. Read the real Hermite–Lindemann statement in Lee Butler, A proof of the Hermite–Lindemann theorem, p.3, https://people.maths.bris.ac.uk/~malab/PDFs/HL.pdf. The previously proposed change to c₁ is optional and is not a required proof repair.

## E9. Decay exponent supplied by Theorem 5

**Confirmed** · gap · affects the proof.

Proof of Proposition 7.2, p.375, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) Compared with arXiv:1709.01022v1, pp.18.

Printed: "By assumption (ii) and Lemma 7.3, log N_a < 1.07(log k)^{1−c₁}. Applying Theorem 5, we have Σ_{k/2<m≤k} χ_a(m)Λ(m) = O(k exp(−c′(log k)^{c₁})·(log k)⁴)", for an arbitrary fixed 0 < c₁ < 1.

Theorem 5 gives decay exp(−c′(log k)^{min(c₁,1/2)}), since its denominator is √(log k) + log N_a. The contradiction with (16) still follows for every 0 < c₁ < 1.

Writing L=log k, the available denominator is sqrt(L)+log N_a≤sqrt(L)+1.07L^(1−c₁). Thus the ratio is bounded below by a positive constant times L^min(c₁,1/2). For c₁>1/2 the square-root contribution prevents deduction of decay exp(−c′L^c₁). This need not disprove that stronger estimate by another method. The weaker deduction still gives o(k) and the same contradiction.

Review: Confirmed only as an overstrong deduction from Theorem 5, not as a counterexample to the displayed character-sum estimate itself. For c₁>1/2 the square-root term prevents the asserted exponent from following. Changed kind and reach accordingly.

## E10. The trivial-character case of Theorem 5

**Confirmed** · error · affects a stated result.

Theorem 5, equation (26), p.374, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) Compared with arXiv:1709.01022v1, pp.17.

Printed: "Let χ be a primitive Dirichlet character of conductor N. Then Σ_{m≤X} χ(m)Λ(m) = δ_χX − X^{β_χ}/β_χ + O(X exp(−c log X/(√(log X) + log N))·(log N)⁴)."

State it for N > 1, or replace (log N)⁴ by (log 2N)⁴; for the principal character (N = 1) the printed error term is 0.

With N = 1 the formula would assert ψ(X) = X exactly. The paper uses only nonprincipal characters with N > 1. The extraction found this (item 89, report D13).

Review: Confirmed on the page image, including the sentence explicitly admitting the trivial character. For conductor 1 the error term vanishes, forcing ψ(X)=X although ψ is a step function. Changed reach to Theorem 5 as stated; later uses have N>1.

## E11. Character terminology; empty product already permitted

**Confirmed** · misprint · affects nothing.

Theorem 6, pp.376–377, and Case 1 of the proof of Proposition 8.2, pp.377–378, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) Compared with arXiv:1709.01022v1, pp.19–20.

Printed: “Let π_i be characters of conductor q_i for 1 ≤ i ≤ r”, later applied with “ψ … principal of conductor M₂”.

Use modulus q_i in Theorem 6 and modulus M₂ for the principal character. The first factor retains its explicit primitivity requirement. No extra M₂=1 case is missing: allow r=s, so the product of principal factors is empty.

A principal Dirichlet character has primitive conductor 1 regardless of its ambient modulus; the application itself says modulus for the factors. The original errata additionally objected that M₂=1 forces a missing nontrivial principal block, but the source never requires r>s. When r=s, condition (d) applies to the last primitive factor. Pack the odd prime factors into blocks between B=k^(7/32) and B², leaving at most one short primitive block (including any 2-part) and one short principal block; discard empty blocks. The first block is odd and at least B. If M₂=1, the second collection is empty and the same construction applies. The printed r−2 count remains sufficient.

Review: Confirmed only the conductor/modulus terminology. Rejected the alleged missing M₂=1 gap: the empty product is already permitted by the displayed factorization and conditions. Removed the unnecessary enlarged factor-count repair. This review does not claim to have independently read or reproved the original Iwaniec–Kowalski Theorem 12.13.

## E12. Local multiplicative reduction: rejected

**Rejected** · gap · affects nothing.

§4, proof of Lemma 4.1, second case, p.364, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) Compared with arXiv:1709.01022v1, pp.9.

Printed: "From (2) and (12), we have p | A, ℓ | ord_p(A) and p ∤ B. Equation (13) thus implies that p ∤ κ and so the model E_i has multiplicative reduction at p."

No substantive correction is needed. The standard reduction criterion applies directly to the displayed model; the c₄ calculation is a useful expansion of the proof.

The source does not invoke Lemma 3.4 outside its range. For its displayed E_i, c₄=16κ(4κd²−3A). The stated p|A and p∤B together with A−B=κd² give p∤κd, hence c₄ is a p-unit. Also Δ=−64κ³A²B has positive valuation divisible by ℓ. Thus the integral model is minimal and has multiplicative reduction. Equivalently its reduction has a double root at zero and the distinct simple root −2κd. This is exactly the routine local criterion behind the sentence’s “so”.

Review: Rejected as a substantive gap after independently computing c₄ and Δ. No additional hypothesis, lemma extension or new argument is needed beyond the standard immediate criterion. The earlier errata incorrectly treated the absence of an explicit c₄ computation as a failure of the proof.

## E13. The algebraic endpoint: rejected

**Rejected** · misprint · affects nothing.

§9, proof of Proposition 9.1, p.384, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) Compared with arXiv:1709.01022v1, pp.25.

Printed: "Since no prime p ≥ k^{7/16} divides any of these A_i, Stirling's formula …"

No correction is necessary: p≥k^(7/16) and p>k^(7/16) are equivalent when p is prime and k is an integer.

If a prime p equalled k^(7/16), then k^7=p^16. Taking the p-adic valuation gives 7v_p(k)=16, impossible for an integer valuation. Thus no prime lies at the disputed endpoint.

Review: Rejected using unique factorization. Checked that Proposition 9.1 explicitly assumes integer k. The proposed weak/strict distinction has no mathematical effect and the source assertion is correct.

## E14. The order-four point

**Confirmed** · misprint · affects nothing.

Proof of Lemma 6.6, p.371, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) Compared with arXiv:1709.01022v1, pp.14–15.

Printed: "P = (4ivt + 2λ, (128iv⁵ − 64iv³)t − 128v⁶ + 96v⁴ − 16v²) ∈ E(F_p). Then 2P = (2λ,0) and so P is a point of order 4."

P=(4itv+2λ,8itv(t+iv)) belongs to F′_λ(F_p), not the undefined E(F_p) in this display. Its double is (2λ,0). The x-coordinate and θ′₃(P)=4itv remain unchanged.

For the local coordinate identity take p=5, t=v=2, i=3, λ=3. Then 2t²+2v²=1, but the printed point is (4,4), with y²=1 and x(x−2)(x−2λ)=4. This is a counterexample to that formula, not to all global hypotheses of the lemma. With r=2t and s=2iv, r²=2λ and s²=2λ−2, the point x=r²+rs, y=rs(r+s) lies on the curve and doubles to (2λ,0), as verified symbolically. Its x-coordinate and descent coordinate are unchanged, so the intended argument is preserved.

Review: Confirmed independently by symbolic curve membership and denominator-cleared doubling identities modulo i²+1 and 2t²+2v²−1. Also checked all 2,504 admissible nonzero tuples for p<200, p≡5 mod8; the printed point is off the curve in 2,472 cases, and every corrected point doubles as required. These finite examples test the coordinate identity, not the full global hypotheses of Lemma 6.6.

## E15. The explicit Roth threshold

**Confirmed** · error · affects the proof.

Proof of Proposition 9.1, p.384 (threshold (37) and Theorem 8 with (36), p.381), in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) Compared with arXiv:1709.01022v1, pp.23, 25.

Printed: "Checking that in (36) we have K₀(10^{−5}) < exp(exp(10⁶)), we may thus apply Theorem 8 (Roth's theorem)", with (36) K₀(δ) = exp(exp(132 log(2)·δ^{−1})) and hypothesis (37) k ≥ exp(exp(10⁶)).

K₀(10^{−5}) = exp(exp(132 log 2·10⁵)) ≈ exp(exp(9.15·10⁶)) > exp(exp(10⁶)). The argument works with the threshold k ≥ exp(exp(10⁷)); every other estimate of the proof holds there.

132·log 2·10⁵ ≈ 9.1495·10⁶ > 10⁶, so the claimed comparison fails and Proposition 9.1 is not proved at the stated threshold (it may still be true). Theorem 2 has an unspecified effective k₀, so it is unaffected. Checked on the page image of p.381. The extraction found this (items 47, 108 and 149, report D16).

Review: Confirmed on the enlarged image that the coefficient is 132 and the threshold exponent is 10^6. Recomputed 132 log(2)·10^5=9149542.783391276, between 10^6 and 10^7. The replacement threshold repairs this invocation of the displayed (36). No independent verification of Rahman’s original proof is claimed.

## E16. The Landau–Page height restriction

**Confirmed** · gap · affects a stated result.

§12, statement of the Landau–Page theorem, p.386, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) The §12 addendum is absent from arXiv:1709.01022v1.

Printed: "… every zero of every Dirichlet L-function corresponding to a primitive character of modulus q ≤ T (where T ≥ 2) necessarily has real part β satisfying β < 1 − c/log T, with at most a single exception"

Restrict the zero β+it to |t|≤T. This is the classical Landau–Page statement required in the addendum; no claim that the stronger all-height assertion is known false is made.

The standard Landau–Page region depends on log(Q(1+|t|)), as in Ford–Green–Konyagin–Maynard–Tao, Long gaps between primes, Lemma 7.1, published p.96, https://www.ams.org/journals/jams/2018-31-01/S0894-0347-2017-00876-2/S0894-0347-2017-00876-2.pdf. With Q=T and |t|≤T this yields the stated strip after changing the absolute constant. No such fixed strip for all heights follows. The paper’s (41) uses exactly the bounded-height form.

Review: Confirmed the omitted height condition, and changed the classification: the unrestricted zero-free strip is not shown false here, but it is stronger than the classical result being invoked. The actual use in (41) is at height T.

## E17. Character hypotheses in Proposition 12.2

**Confirmed** · error · affects a stated result.

§12, statement of Proposition 12.2, p.387, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) The §12 addendum is absent from arXiv:1709.01022v1.

Printed: "Proposition 12.2. If q ≤ Q = k⁴ and q ∉ Q(k), then Σ_{k/2<m≤k} χ(m)·Λ(m) ≪ k/log k."

Add that χ is a primitive nonprincipal character modulo q.

The character is not specified in the proposition. For q=1, Proposition 12.1 itself gives q∉Q(k) at large k, but the principal-character sum is ψ(k)−ψ(k/2)∼k/2. Nonprincipality is therefore necessary. Primitivity ensures that the modulus excluded from Q(k) is the conductor of the L-function in question. The proof and application use these intended hypotheses.

Review: Confirmed the missing character hypotheses. The principal character has a weighted sum asymptotic to k/2, contradicting the stated bound. Primitivity also ties q∉Q(k) to the correct conductor; excluding a modulus alone would not exclude a bad primitive inducing conductor. Changed reach to Proposition 12.2 as written.

## E18. Zero-sum height; small-zero objection rejected

**Confirmed** · misprint · affects nothing.

§12, proof of Proposition 12.2, p.387, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) The §12 addendum is absent from arXiv:1709.01022v1.

Printed: The explicit formula is truncated at |t| ≤ T, but the bound is then written for "Σ_{L(β+it,χ)=0, β>0, |t|≤Q} k^ρ/ρ" and finished with "(k/(log k)³) Σ 1/|ρ| ≪ k/log k; here, the last inequality follows from the standard proof of the Prime Number Theorem in Arithmetic Progressions".

Replace |t|≤Q by |t|≤T in both zero sums. The claimed additional gap concerning small zeros is rejected: q∉Q(k) and the functional equation already control them.

Put δ=3 log log k/log k. For a primitive character of conductor q∉Q(k), all zeros with |γ|≤T have δ≤β≤1−δ, by reflection in the functional equation. Thus the zeros with |γ|≤1 contribute at most N(1,χ)/δ≪log(2q)/δ to Σ1/|ρ|. For 1<|γ|≤T, partial summation of N(u,χ)≪u log(q(u+2)) gives O(log(2q)log T+(log T)²). Since q≤k⁴ and log T=O(log k/log log k), the total is O((log k)²), as required. Bennett–Martin–O’Bryant–Rechnitzer, arXiv:1802.00085, p.11 and Proposition 2.5 p.14, explicitly provide the reflection and zero-counting input cited by the paper.

Review: Confirmed only the Q/T typo. Rejected the additional substantive-gap allegation after reading the cited source’s functional equation discussion and Proposition 2.5 and deriving the bound above. Subtracting the two explicit formulas first is a valid alternative, but is not necessary to repair the printed proof.

## E19. Repeated word

**Confirmed** · misprint · affects nothing.

§4, proof of Lemma 4.1, p.364, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf) Compared with arXiv:1709.01022v1, pp.9.

Printed: "If instead p divides divides precisely two terms"

"If instead p divides precisely two terms"

A repeated word. Found by the errata job while checking the passage of E12.

Review: Confirmed the repeated word on the publisher p.364 image and in v1 p.9; no mathematical consequence.

## E20. Shifted progression range

**Confirmed** · misprint · affects nothing.

Lemma 4.1 proof, published p.364; arXiv:1709.01022v1 p.9.

Printed: “n+d, n+2d, …, n+kd”

Use n,n+d,…,n+(k−1)d.

The product (2) and the index sets A and I use indices 0 through k−1. The subsequent choice of a triple or quadruple containing the divisible term needs that range, not the displayed shifted range. Verified in both versions and on the publisher image.

Review: Added during this independent review. The product (2) and the index sets A and I use indices 0 through k−1. The subsequent choice of a triple or quadruple containing the divisible term needs that range, not the displayed shifted range. Verified in both versions and on the publisher image.

## E21. Stray multiplier in the published version

**Confirmed** · misprint · affects nothing.

Proposition 9.1 proof, published p.383, union-size bound before 0.9968k; compare arXiv:1709.01022v1 p.25.

Printed: “+ (12k/log log k) f”

Delete the trailing f.

The undefined factor f occurs on the published image but is absent from the earlier arXiv formula. The preceding three estimates give 12k/log log k without a multiplier. No later correction was located.

Review: Added during this independent review. The undefined factor f occurs on the published image but is absent from the earlier arXiv formula. The preceding three estimates give 12k/log log k without a multiplier. No later correction was located.

## E22. Inner-product endpoint

**Confirmed** · misprint · affects nothing.

Proposition 8.1 proof, published p.380, off-diagonal inner-product display; arXiv:1709.01022v1 p.22.

Printed: “Σ_(k/2<m<k) χ₁(m)χ₂(m)”

Use k/2<m≤k, as in the vectors and Proposition 8.2.

The vector coordinates were indexed by k/2<m≤k, so their inner product includes the m=k coordinate. Restoring the endpoint permits the direct use of Proposition 8.2. Verified on the publisher image and in v1.

Review: Added during this independent review. The vector coordinates were indexed by k/2<m≤k, so their inner product includes the m=k coordinate. Restoring the endpoint permits the direct use of Proposition 8.2. Verified on the publisher image and in v1.

## Expanded checks for the disputed entries

For **E8**, Hermite–Lindemann makes log k transcendental for integer k>1. If its positive rational power were algebraic, then log k would be algebraic too. Thus the endpoint is not merely nonprime but nonalgebraic; the two prime intervals are equal. The real theorem is stated on p.3 of [Lee Butler's proof](https://people.maths.bris.ac.uk/~malab/PDFs/HL.pdf). For **E13**, unique factorization alone suffices. No threshold or c₁ change is needed for either entry.

For **E11**, let B=k^(7/32). A prime factor at least B is a block by itself; combine smaller odd prime factors until the block first reaches B, which keeps it below B². Leave the residual block below B, adjoining the 2-part (at most 8) to that residual primitive block; for sufficiently large k it remains at most B². Perform the principal packing separately and discard empty blocks. There are at most two short blocks and the first primitive block is odd and at least B. When M₂=1, take r=s: the principal product is empty, while q_r in (d) is the last primitive block. The alleged missing case was based on imposing r>s, which the paper does not impose.

For **E18**, write δ=3 log log k/log k. The reflection ρ↦1−overline(ρ) and Proposition 2.5 in [Bennett–Martin–O’Bryant–Rechnitzer](https://arxiv.org/pdf/1802.00085), pp.11,14, imply

\[
\sum_{|\gamma|\le T}\frac1{|\rho|}
\ll \frac{\log(2q)}{\delta}
  +\log(2q)\log T+(\log T)^2
\ll (\log k)^2.
\]

Here q is the primitive conductor and q∉Q(k); the low-zero lower bound β≥δ follows from the same excluded region at the reflected zero. Multiplication by k/(log k)³ gives the required bound. The height typo must be fixed, but the cited standard proof needs no further hypothesis concerning small zeros. The old difference-kernel suggestion is a valid alternative, not a necessary repair.

For **E14**, set r=2t and s=2iv, so r²=2λ and s²=2λ−2. Then x=r²+rs and y=rs(r+s) satisfy the curve equation and double to (r²,0). Neither r nor s nor r+s vanishes in the stated odd-characteristic setting: (r+s)=0 would imply r²=s², hence 2=0. Thus the double is defined and P has exact order four. The finite-field counterexample in the JSON disproves the printed coordinate identity; it is not asserted to instantiate the entire Diophantine setup.

The scratch calculations supplement these general arguments. No Lean file was required or compiled.
