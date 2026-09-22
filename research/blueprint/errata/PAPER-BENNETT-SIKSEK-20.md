# Mistakes in Bennett–Siksek, *A conjecture of Erdős, supersingular primes and short character sums*

Job ERRATA-PAPER-BENNETT-SIKSEK-20. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-BENNETT-SIKSEK-20.json` beside this file.

**Paper and version read.** Michael A. Bennett and Samir Siksek, Annals of Mathematics 191 (2020), 355–392, DOI 10.4007/annals.2020.191.2.2. The version read is the publisher PDF (SHA-256 `3920a752…`, as recorded by the extraction). Every quoted passage was re-read in it. The formula pages 357, 361, 371 and 379–381 were checked on the page images, because the PDF text layer flattens superscripts.

**Earlier work.**
- The extraction PAPER-BENNETT-SIKSEK-20, by Codex (`codex-a71f92`) continuing a ChatGPT checkpoint, corrected the paper in passing. Its report numbers these corrections D1–D16, and they are E1–E18 here.
- The independent review REV-PAPER-BENNETT-SIKSEK-20 re-derived them.
- This job found E19.

**Existing corrections.** None was found:
- the Annals article page links no erratum;
- arXiv 1709.01022 has only its v1 of September 2017, which predates the published text;
- a web search found nothing;
- Siksek's homepage and Bennett's homepage and CV list no correction.

All nineteen findings are new.

**Effect on the main results.** Theorem 2 (ℓ ≤ exp(10^k) for all sufficiently large k) is unaffected. Five findings break a step of a proof as written, and each has a short repair:
- E3: the conductor of a product of characters;
- E5: a residue-class count;
- E8: an interval endpoint;
- E11: the case with no principal factor;
- E15: the numerical threshold in the Roth step.

The rest are harmless slips.

**Not a mistake.** Theorem 2 prints ℓ ≤ exp(10^k), as the image of p. 357 shows. The PDF text layer reads it as "exp(10k)". The review's table listed that as a printed claim, but the table describes the text layer, not the paper.

---

## E1. The discriminant in Lemma 3.2 (error; affects nothing)

The lemma gives Δ_a = 64(a_a b_a c_a)² = (2⁸/g⁶)(n+id)²(n+jd)²(n+(2j−i)d)² for the Frey curve E_a : Y² = X(X − a_a)(X + c_a).

For y² = x³ + a₂x² + a₄x the discriminant is 16a₄²(a₂² − 4a₄). Here a₂ = c − a and a₄ = −ac, so Δ = 16a²c²(a + c)² = 16(abc)², because a + b + c = 0. With b_a = −2(n + jd)/g, the factor is 2⁶/g⁶, not 2⁸/g⁶.

Only odd valuations of Δ are used later (ℓ | ord_p Δ_a for p ≥ k), and those are unchanged.

## E2. The divisor bound in §8 (error; affects nothing)

The paper asserts τ(q) ≤ q^{1/log log 3q} "for all q ≥ 1", citing [19, p. 334], and uses it in §8 and again in §12. It is false at q = 120: τ(120) = 16, while 120^{1/log log 360} ≈ 14.89. What is true is an eventual bound such as τ(q) ≤ q^{(log 2 + o(1))/log log q}, or τ(q) ≪_ε q^ε. Both applications need only such a bound, for large q.

## E3. The conductor of χ₁χ₂ in the proof of Proposition 8.2 (error; affects the proof)

The paper writes: "Let χ = χ₁χ₂, and write M = lcm(N₁,N₂) for the conductor of χ. We can thus rewrite χ = ηψ, where η is primitive of conductor M₁ and ψ is principal of conductor M₂ with M = M₁M₂ and gcd(M₁,M₂) = 1."

The least common multiple of the conductors is a modulus of χ, not in general its conductor, and M = M₁M₂ can fail at 2. The primitive quadratic characters of conductor 8 (discriminants 8 and −8) have product the primitive character of conductor 4, while lcm(8, 8) = 8.

What is true, and enough for the rest of the proof, is the following. Let η be the primitive character inducing χ, M₁ = cond(η), and M₂ the product of the primes dividing M but not M₁. Then χ(m) = η(m)·1_{gcd(m,M₂)=1}, gcd(M₁,M₂) = 1, M₁M₂ | M, and M₂ | gcd(N₁,N₂).

## E4. The factorization (6) for even exponent (error; affects nothing)

Lemma 3.1 allows every prime ℓ, and Theorem 2 explicitly covers negative solutions. Yet (6) writes n + id = A_i y_i^ℓ with A_i positive. For ℓ = 2 and a negative term this is impossible, since the sign must then sit in A_i. For odd ℓ the sign goes into y_i. The case ℓ = 2 is trivially within the bound of Theorem 2, so nothing downstream is affected.

## E5. A residue-class count in §12 (error; affects the proof)

In the proof of Proposition 12.3 the number of n ≤ k with a + nd divisible by r is bounded by "k/r + O(1) ≪ k/r". Here r can be as large as q ≤ k⁴, so it can exceed k, and then k/r + O(1) is not ≪ k/r. The correct bound is k/r + 1, and the +1 terms have to be summed separately. Using q ≤ k⁴ and τ(q) ≪ q^{1/12}, their total is O(k^{1/3}(log k)^{61}), negligible against the k/(log k)^{1/4} being proved.

## E6. The last paragraph of §12 (gap; affects nothing)

"Since N_a^odd is the largest odd squarefree divisor of A_iA_jA_{2j−i}, it follows that gcd(N_a,A_i)·gcd(N_a,A_j)·gcd(N_a,A_{2j−i}) ≥ N_a/8." Only the divisibility N_a^odd | A_iA_jA_{2j−i} is justified. Together with N_a ≤ 8N_a^odd, that divisibility already gives the displayed inequality, so the equality is neither proved nor needed.

## E7. A squared constant in (35) (misprint; affects nothing)

Equation (32) defines ϖ = 0.1239², and the proof of Proposition 8.1 ends "As 1/68 < ϖ², we have inequality (33)". The needed comparison is 1/68 < ϖ, which holds: 1/68 ≈ 0.0147 < 0.1239² ≈ 0.01535. The printed one is false, since 0.1239⁴ ≈ 0.000236.

## E8. An interval endpoint in §10 (gap; affects the proof)

The proof of Theorem 2 needs conductors not divisible by primes in the closed-left range [(log k)^{1−10^{−4}}, 10⁴ log k]. Proposition 9.1(III) supplies only the open-left range ((log k)^{1−10^{−4}}, 10⁴ log k]. The repair keeps the open interval in the maximal-family construction. For the remaining conductors it uses P(N_a) ≤ (log k)^{1−10^{−4}} and applies Proposition 7.2 with c₁ = 1/20000, which gives the strict inequality P(N_a) < (log k)^{1−c₁} that the proposition requires.

## E9. The decay exponent in the proof of Proposition 7.2 (error; affects nothing)

Proposition 7.2 is stated for any fixed 0 < c₁ < 1. Its proof applies Theorem 5 with log N_a < 1.07(log k)^{1−c₁} and writes the error as O(k exp(−c′(log k)^{c₁})(log k)⁴). Theorem 5's exponent is c′ log k/(√(log k) + log N_a), which is of order (log k)^{min(c₁, 1/2)}: for c₁ > 1/2 the √(log k) term dominates. The contradiction with (16) still follows for every c₁, and the application uses c₁ = 10^{−4}.

## E10. The principal case of Theorem 5 (error; affects nothing)

Theorem 5, quoted from Iwaniec–Kowalski, is stated for any primitive character of conductor N. It has error term O(X exp(…)(log N)⁴), which vanishes when N = 1 and would then assert ψ(X) = X exactly. It should be stated for N > 1, or with (log 2N)⁴. The paper applies it only to nonprincipal characters.

## E11. "Conductor" for "modulus" in Theorem 6, and the case M₂ = 1 (gap; affects the proof)

Theorem 6 is stated for "characters of conductor q_i". It is applied with a principal factor ψ "of conductor M₂", but a principal character has conductor 1: what is meant is modulus M₂. More substantively, the packing in Case 1 of the proof of Proposition 8.2 presupposes a last principal block with 1 < q_r. When M₂ = 1 there is no such block, so that case must be handled separately and modulus-one factors discarded. A packing with at most ⌈10c₂⌉ + 4 factors suffices for the existence of the cancellation exponent c₃.

## E12. Multiplicative reduction at p ∈ (k/2, k] in §4 (gap; affects nothing)

In the second case of the proof of Lemma 4.1, the paper concludes from p ∤ κ that "the model E_i has multiplicative reduction at p". Lemma 3.4, which gives minimality and semistability, covers only primes p ≥ k, while here k/2 < p ≤ k. The conclusion is still true: c₄(E_i) = 16κ(4κd² − 3A) is prime to p because p | A and p ∤ κd, so E_i is minimal with multiplicative reduction at p and ℓ | ord_p(Δ_i).

## E13. A strict inequality in §9 (misprint; affects nothing)

"Since no prime p ≥ k^{7/16} divides any of these A_i": the sieve removes only the primes in (k^{7/16}, k], so the statement should read p > k^{7/16}. The weak form is what the subsequent product over p > k^{7/16} uses.

## E14. The order-four point in the proof of Lemma 6.6 (error; affects nothing)

The paper takes P = (4ivt + 2λ, (128iv⁵ − 64iv³)t − 128v⁶ + 96v⁴ − 16v²) on F′_λ : Y² = X(X − 2)(X − 2λ) over F_p, with 2P = (2λ, 0). The x-coordinate is right, but the y-coordinate is not on the curve. For example, at p = 5, t = v = 2, i = 3, λ = 3 (so that 2t² + 2v² = 1), the printed point is (4, 4), with y² = 1 but x(x − 2)(x − 2λ) = 4.

Halving (2λ, 0) with r = 2t and s = 2iv (so r² = 2λ and s² = 2λ − 2) gives x = r² + rs and y = rs(r + s). The correct point is therefore P = (4itv + 2λ, 8itv(t + iv)). This was checked symbolically modulo 2t² + 2v² − 1, and at every admissible t, v, i for all primes below 200. The argument uses only x(P) and the descent coordinate θ′₃(P) = 4itv, which are unchanged.

## E15. The Roth threshold in the proof of Proposition 9.1 (error; affects the proof)

The proof applies Roth's theorem after "Checking that in (36) we have K₀(10^{−5}) < exp(exp(10⁶))". Here (36) gives K₀(δ) = exp(exp(132 log 2 · δ^{−1})), after Rahman, and (37) assumes k ≥ exp(exp(10⁶)). But 132 · log 2 · 10⁵ ≈ 9.15 · 10⁶ > 10⁶, so K₀(10^{−5}) ≈ exp(exp(9.15 · 10⁶)) exceeds the stated threshold.

The argument goes through verbatim with the threshold k ≥ exp(exp(10⁷)): every other estimate of the proof holds there. Proposition 9.1 is therefore proved at that threshold, and it may still be true as stated. Theorem 2 asks only for an effective k₀, so it is unaffected.

## E16. The Landau–Page theorem as quoted in §12 (error; affects nothing)

The addendum states that every zero of every L-function of a primitive character of modulus q ≤ T has β < 1 − c/log T, with at most one exception. That is not known for zeros of arbitrary height. The classical zero-free region is β < 1 − c/log(q(|t| + 2)), and Iwaniec–Kowalski Theorem 5.26 restricts to |t| ≤ T. The paper uses the statement only for |t| ≤ T, as in (41).

## E17. A missing hypothesis in Proposition 12.2 (error; affects nothing)

"If q ≤ Q = k⁴ and q ∉ Q(k), then Σ_{k/2<m≤k} χ(m)Λ(m) ≪ k/log k." As stated this fails for the principal character, where the sum is about k/2. The proof begins "if χ is a nonprincipal character modulo q", and the application is to nonprincipal characters, so the hypothesis should be stated.

## E18. The zero sum in the proof of Proposition 12.2 (gap; affects nothing)

The explicit formula is truncated at |t| ≤ T, but the bound is then written for zeros with |t| ≤ Q. It is finished with "(k/(log k)³) Σ 1/|ρ| ≪ k/log k", citing "the standard proof of the Prime Number Theorem in Arithmetic Progressions". Q is a slip for T.

The uniform bound on Σ 1/|ρ| also needs an argument that controls zeros near s = 0. One clean way is to subtract the explicit formulas at k and k/2 first. Each zero then contributes (k^ρ − (k/2)^ρ)/ρ = ∫_{k/2}^{k} t^{ρ−1} dt, which is ≪ k^β min(1, 1/|ρ|), and local zero counting finishes the proof.

## E19. A repeated word in §4 (misprint; affects nothing)

"If instead p divides divides precisely two terms" (p. 364) should read "If instead p divides precisely two terms".
