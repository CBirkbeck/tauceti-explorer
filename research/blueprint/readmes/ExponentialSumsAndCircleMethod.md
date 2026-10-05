# Exponential sums, decoupling and the circle method

This is a partial mathematical planning checkpoint, not an implementation. It preserves the 58 incoming ES.0 node objects and adds 47 target-level declarations across the six layers. All 105 nodes remain unchecked. The whole-roadmap breadth pass is not finished; every stage remains partial. The named endpoints below are precise contracts, and their proof sketches expose the unresolved analytic or geometric inputs rather than assuming the endpoints as record fields.

The pinned baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Native characters, probability Haar measure, Lebesgue integration, Lp seminorms, Euclidean vectors, residue rings and multivariate polynomial APIs are reused. The suggested file supplies admitted signatures and tests; elaboration does not certify the mathematics.

## Conventions and ownership

Torus characters use exp(2πinx) on AddCircle1, and probability Haar measure has mass one. Finite positive power sums start at1, while complete residue sums include zero. Ordered tuples are not permutation classes. The Waring singular series is an actual analytic sum only after native summability is proved; a totalized nonsummable sum cannot be interpreted as a zero density. Local normalization is q^(s−1), not q^s. Infinite products require absolute convergence before rearrangement.

The moment curve uses the Euclidean L2 metric and coordinates(t,t²,…,tⁿ). Decoupling retains the weight exponent E≥100n throughout dimensional induction. Critical p is n(n+1), not half that number. In the discrete estimate normalization is by the ordinary ball volume, not the mass of its polynomial weight. The exact-solution count is a subset of the source near-solution count at the last tolerance1.

RS03 retains ES.0–ES.5. Finite-field complete bounds and Gauss conventions come from FF.1–2; character conductor classification from its exact existing supplier; divisor subpower bounds from AN.5; and prime-weighted TypeI/II and uniform progression inputs from SV.2 and AN.3. No unweighted mean-value theorem supplies a prime theorem. The Browning–Sawin branch must import only an independent early geometric prefix and its nonarchimedean lattice supplier; ES.0 must not depend on its own late ES.5 application.

## Sources and reading boundaries

### BennettSiksek2020 — A conjecture of Erdős, supersingular primes and short character sums

Michael A. Bennett and Samir Siksek. Annals of Mathematics 191 (2020), 355–392; published version of record.

Source: [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf).

SHA-256: 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf.

Reading: §8.1, printed pp.376–379, including Theorem 6, Proposition 8.2 and both proof cases. Page images 377–379 checked for conductor notation, divisor bound, factors and interval endpoints. Continuation on 2026-09-27: freshly reread the whole selected §8.1 argument on printed pp.376–379 and inspected page 377 image, distinguishing ambient lcm, primitive conductor and excluded primes. CRT continuation, 2026-09-27: selected published pp.376–379 reread; extraction items44 and92–97, accepted route8 and reviewed E2/E3/E11 compared with the actual factor requirements.

### MathlibPin — Pinned characters, Möbius arithmetic and finite-interval APIs

The Mathlib contributors. Commit 082e2d37e8b0463410cdb532e111cd43d5a66174

Source: [Pinned characters, Möbius arithmetic and finite-interval APIs](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib).

Reading: DirichletCharacter/Basic.lean: carrier/change-level and primitive-character declarations; Bounds.lean in full. MulChar/Basic.lean complete-sum section; ArithmeticFunction/Moebius.lean lines35–190; Zeta.lean lines72–104; Defs.lean identity evaluation. Algebra/Ring/Periodic.lean lines35–125; natural divisors membership/positivity and definition; natural Ioc cardinality; ZMod natural modulus cast. Finite-sum norm inequality, natural coprimality under adding multiples, and real-power addition/multiplication/monotonicity statements with hypotheses. Algebra/Order/Archimedean/Defs.lean: exists_nat_ge; real-power nonnegativity and inverse-exponent threshold laws reread for the continuation. DirichletCharacter/Basic.lean lines1–445 in full for carrier, nonunit evaluation, change-level, conductor invariance, inverse, ambient/primitive product and conductor-product divisibility; Tau Ceti's DirichletCharacter/Basic.lean read in full as a duplication screen. MulChar/Basic.lean quadratic predicate and square criterion (lines428–568); PrimeFin.lean lines30–122; Factorization/Basic.lean lines330–360; GCD/BigOperators.lean and GCD/Prime.lean in full; finite-subset product divisibility; common-prime characterization of noncoprimality; integer/natural coprimality comparison. CRT continuation: ZMod/QuotientRing native finite CRT; Algebra/BigOperators/Pi native homomorphism-product equivalence; unit equivalences; character/conductor/level-lifting statements; natural prime-power complement and gcd-product statements. All newly cited source blobs verified at the pin.

### TaoDivisor2008 — The divisor bound

Terence Tao. Author post, 23 September 2008, updated 24 September

Source: [The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/).

SHA-256: 1a26cc2a78746463092d440c0a1e119bd8d4c3e223f805dd000ae8a76830b2f9.

Reading: Entire main post: both small/large-prime proofs and applications. The explicit constant D^B below is the worker's refinement, not a quoted constant.

### Polymath2014 — New equidistribution estimates of Zhang type

D. H. J. Polymath. Algebra & Number Theory 8 (2014), no. 9, 2067–2199; published version

Source: [New equidistribution estimates of Zhang type](https://msp.org/ant/2014/8-9/ant-v8-n9-p03-s.pdf).

SHA-256: 220232ac124e2adb984fd6082d959057314a0006adc7cdf10d7185683bba47a8.

Reading: Proposition 4.12 and its proof, printed pp.2106–2110, including the elementary shift argument (4-22)–(4-23) and the separate off-diagonal input (4-24). Selected passage only, not whole-paper coverage.

### IwaniecKowalskiChapter11Author — Analytic Number Theory, Chapter 11: Sums over finite fields

Henryk Iwaniec and Emmanuel Kowalski. Author-hosted chapter extract; published book version not independently obtained

Source: [Analytic Number Theory, Chapter 11: Sums over finite fields](https://people.math.ethz.ch/~kowalski/ik-ant-exp-sums.pdf).

SHA-256: b4c346a8459e9a0450a16a22438220cf7f40926d875beacbcdeccdfc75c5eee5.

Reading: Cover and printed pp.269–271 only; p.271 visually collated against extracted text. This PDF contains Chapter 11 and bibliography, not Theorem 12.13. Included to preserve the source findings made during acquisition, not as a supplier of the new finite analytic bounds.

### BDG2016 — Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three

Jean Bourgain; Ciprian Demeter; Larry Guth. Published Annals of Mathematics 184 (2016), 633–682; revised 18 April 2016

Source: [Proof of the main conjecture in Vinogradov’s Mean Value Theorem for degrees higher than three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf).

SHA-256: b19172d5169e5e3b199dc362bb955e6b4ceab296cb58f2a9d51456579fd3b946.

Reading: Full published paper §§1–10, pp.633–682, including appendix and references; figures3–5 visually inspected pp.663/669/674. External cited papers are not included in this reading.

### AssingCircle2022 — The circle method and Waring’s problem

Edgar Assing. Author-hosted Bonn winter-term 2021/22 lecture notes, dated 1 April 2022, 120-page PDF

Source: [The circle method and Waring’s problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf).

SHA-256: e904c9e2a1709270fe600db9ce7a34ebe3d61c9d858c1c9f5968cddb94cd7612.

Reading: Title/date/contents and pp.1–4 orientation; §5 pp.28–33, §6 pp.33–48 through Theorem6.19 and proof, §8.1–8.3 pp.66–83 and §9 pp.83–95 read, including available proofs. Pages34,44,45,46,75,82,86 visually inspected. Remaining chapters/exercises/external cited papers are not included. The general-curve theorem8.6 is stated without a proof in these notes.

### HeathBrown2002 — The density of rational points on curves and surfaces

D. R. Heath-Brown; appendix by J.-L. Colliot-Thélène. Annals155(2002),553–598, as reproduced in arXiv math/0405392v1 dated20May2004; this reprint is not independently collated with the publisher scan.

Source: [The density of rational points on curves and surfaces](https://arxiv.org/pdf/math/0405392).

SHA-256: 8193f2278d26f5a38f9a0244826ec50a830b02e0b8d26d2d1990ec5fc25bbcaa.

Reading: Reprint pp.553–557 and561–575, including §2 preliminaries and the complete §3 proof of Theorem14. Theorem3 deduction onp.562 and Theorem4 proof onp.564 read. Other endpoint proofs, appendix and cited external texts are not included.

The complete published BDG reading does not include the external originals it cites for the parabola base, Brascamp–Lieb finiteness/stability or plate Kakeya. Assing’s general-curve theorem8.6 is stated without a proof in those notes and is not replaced by the moment-curve theorem. The Heath-Brown arXiv reprint is explicitly not independently collated with the publisher scan. Historical source checks in the packet are attributed to their earlier checkpoints.

## ES.0 — Oscillation and finite sums

Coverage: partial. The 58 inherited conductor/CRT/numerical and finite q–van der Corput nodes are preserved. The classical Weyl target is specified using native forward differences and the exact AN.5 divisor supplier; routine squared-phase, mixed-leading, product-multiplicity and rational-block algebra stay in its proof sketch as required at target level. Complete correlations, the full Graham–Ringrose proof and Proposition8.2 assembly remain open, as do stationary-phase, completion and other routed targets.

### The bounded squared divisor factor

Identifier: ExponentialSumsAndCircleMethod:ES.0/bounded-divisor-power. Kind: lemma.

For q>0 and natural 1≤R and r≤R, let C≥1 and suppose τ(q)≤C q^(1/(4R²)), where τ(q)=card(q.divisors). Then τ(q)^(r²)≤C^(R²) q^(1/4). All powers with nonintegral exponents are real powers.

Hypotheses and conventions: q is natural and positive; R,r are natural; R≥1; r≤R; C is real and C≥1. The displayed divisor estimate is a hypothesis furnished by AN.5.

Proof or construction outline:

1. The positive integer q satisfies q≥1, so C q^(1/(4R²))≥1. Raise the nonnegative bound for τ(q) to r².
1. Since r²≤R², increase the exponent of the upper bound from r² to R², not the exponent of a base below one.
1. Distribute the ordinary power and use the real-power multiplication law: (q^(1/(4R²)))^(R²)=q^(1/4). R≥1 ensures the denominator is nonzero. This keeps the entire factor C^(R²).

Direct dependencies: mathlib:pow_le_pow_left₀, mathlib:pow_le_pow_right₀, mathlib:Real.one_le_rpow, mathlib:Real.rpow_natCast, mathlib:Real.rpow_mul.

Acceptance: At R=1 and r=0 the left side is one, which is still bounded. The restriction R≥1 prevents a zero denominator in the selected exponent.

Source match: BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation — Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction..

### Strict saving in the divisor factor

Identifier: ExponentialSumsAndCircleMethod:ES.0/large-conductor-divisor-saving. Kind: lemma.

Under bounded-divisor-power’s hypotheses, if q>1 and C^(4R²)<q, then τ(q)^(r²)<q^(1/2). The constant and strict threshold cannot be discarded.

Hypotheses and conventions: The same q,R,r,C and divisor input as bounded-divisor-power; q>1; C^(4R²)<q.

Proof or construction outline:

1. Raise C^(4R²)<q to the positive real exponent 1/4. Natural-to-real power compatibility gives C^(R²)<q^(1/4).
1. Multiply this strict inequality by q^(1/4)>0 and combine with bounded-divisor-power.
1. Use q^(1/4)q^(1/4)=q^(1/2). A threshold equality gives only a non-strict conclusion from these hypotheses.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/bounded-divisor-power, mathlib:Real.rpow_lt_rpow, mathlib:Real.rpow_mul, mathlib:Real.rpow_natCast, mathlib:Real.rpow_add.

Acceptance: At q=1 the asserted strict saving would read 1<1 and is false. The arithmetic boundary C=2,R=r=1,q=16,t=4 satisfies t=Cq^(1/4), C^4=q and t=q^(1/2); it rules out strict absorption from a non-strict threshold.

Source match: BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation — Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction..

### An explicit large-conductor divisor threshold

Identifier: ExponentialSumsAndCircleMethod:ES.0/large-conductor-explicit-divisor-threshold. Kind: theorem.

Let R≥1 and r≤R be natural and choose B∈ℕ with exp(4R²)≤B. Put C=max(1,((1/(4R²)) log 2)⁻¹)^B. For real k>max(1,(C^(4R²))^(32/7)) and positive natural q with k^(7/32)≤q, one has τ(q)^(r²)<q^(1/2).

Hypotheses and conventions: R,r,B are natural; R≥1; r≤R. The displayed C is a local expression, not a new carrier or unspecified constant.

Proof or construction outline:

1. Take ε=1/(4R²)>0. The existing AN.5 explicit-divisor-subpower-bound, with 1/ε=4R² and the supplied B, gives τ(q)≤Cq^ε and C≥1.
1. From k>(C^(4R²))^(32/7), strict real-power monotonicity at exponent 7/32 gives k^(7/32)>C^(4R²). Compose with the lower bound for q.
1. Since k>1, the same positive power gives q>1. Invoke large-conductor-divisor-saving. B may be any certified natural upper bound.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/large-conductor-divisor-saving, AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound, mathlib:Real.rpow_lt_rpow, mathlib:Real.rpow_mul.

Acceptance: For R=1 the AN exponent is 1/4 and the B cutoff is exp 4. The reciprocal exponent product (32/7)(7/32)=1 is exact; the lower modulus bound is essential.

Source match: BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation — Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction..

### One divisor threshold for the bounded factor family

Identifier: ExponentialSumsAndCircleMethod:ES.0/large-conductor-eventual-divisor-saving. Kind: theorem.

For every real c>0 there exists a natural K≥2 such that, for every natural k≥K, positive natural q with k^(7/32)≤q, and natural r with r<10c+2, one has τ(q)^(r²)<q^(1/2). The same K works for all permitted q and r.

Hypotheses and conventions: c>0. Natural k,q,r; q>0. The factor-count hypothesis is an inequality after casting r to ℝ.

Proof or construction outline:

1. Choose a natural R≥max(1,10c+2) using exists_nat_ge; then every permitted r satisfies r≤R and R≥1.
1. Choose natural B≥exp(4R²), define C by the explicit threshold node, and choose a natural K strictly larger than max(1,(C^(4R²))^(32/7)).
1. For k≥K all the explicit threshold hypotheses hold. Apply large-conductor-explicit-divisor-threshold; the choices R,B,C,K depend only on c, not on q or r.
1. The arithmetic bounded-factor-count node supplies r<10c+2 in the source application. No squarefreeness is needed for this divisor estimate.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/large-conductor-explicit-divisor-threshold, ExponentialSumsAndCircleMethod:ES.0/bounded-factor-count, mathlib:exists_nat_ge, mathlib:exists_nat_gt.

Acceptance: For c=1 one may choose R=12 because r<12 implies r≤12. Replacing the family by unbounded r is invalid even at a fixed positive q>1.

Source match: BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation — Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction..

### The numerical Graham–Ringrose saving factor

Identifier: ExponentialSumsAndCircleMethod:ES.0/graham-ringrose-saving-kernel. Kind: lemma.

For real k≥0, q>0, t≥0 and S, and natural r, if t≤q^(1/2) and S≤2k(t/q)^(2^(−r)), then S≤2k/q^(2^(−r−1)). This is a numerical implication; an analytic estimate for a character sum is not a conclusion.

Hypotheses and conventions: k,q,t,S are real; k≥0; q>0; t≥0; r is natural. The nested exponent 2^(−r) is a real power, not natural subtraction.

Proof or construction outline:

1. Divide t≤q^(1/2) by q>0 to get t/q≤q^(−1/2). Both sides are nonnegative.
1. Raise to the positive exponent 2^(−r), then multiply by 2k≥0.
1. Use (−1/2)2^(−r)=−2^(−r−1) and the native negative-real-power law. In the application t=τ(q)^(r²); the antecedent S-bound must still come from the external analytic theorem with interval length k/2.

Direct dependencies: mathlib:Real.rpow_le_rpow, mathlib:Real.rpow_pos_of_pos, mathlib:Real.rpow_mul, mathlib:Real.rpow_sub, mathlib:Real.rpow_neg.

Acceptance: At r=1 the resulting denominator exponent is 1/4, not 1/2. At k=0 the implication preserves the upper bound S≤0.

Source match: BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation — Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction..

### Converting the modulus saving to the interval scale

Identifier: ExponentialSumsAndCircleMethod:ES.0/large-conductor-denominator-conversion. Kind: lemma.

For real k>0, q≥k^(7/32), S, and natural r, the bound S≤2k/q^(2^(−r−1)) implies S≤2k^(1−(7/32)2^(−r−1)).

Hypotheses and conventions: All bases are positive: k>0 and q≥k^(7/32)>0; r is natural.

Proof or construction outline:

1. Raise q≥k^(7/32) to the positive exponent 2^(−r−1), giving q^(2^(−r−1))≥k^((7/32)2^(−r−1)).
1. Use antitonicity of division by a positive denominator while retaining the nonnegative numerator 2k.
1. Rewrite k/k^d=k^(1−d) with d=(7/32)2^(−r−1). No integer floor is introduced into the real interval length.

Direct dependencies: mathlib:Real.rpow_le_rpow, mathlib:Real.rpow_mul, mathlib:Real.rpow_sub.

Acceptance: The factor 7/32 remains in the exponent; omitting it gives a stronger unsupported saving.

Source match: BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation — Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction..

### Margin above Bennett–Siksek’s stated exponent

Identifier: ExponentialSumsAndCircleMethod:ES.0/large-conductor-exponent-margin. Kind: lemma.

For c>0 and natural r<10c+2, put γ=2^(−10c−6) and d=(7/32)2^(−r−1). Then d>(7/4)γ. In particular the exponent margin d−γ exceeds (3/4)γ>0.

Hypotheses and conventions: c is real and positive; r is natural with its stated strict real upper bound; γ and d are explicit real expressions.

Proof or construction outline:

1. The bound on r gives −r−1>−10c−3. Strict monotonicity of the base-two real exponential gives 2^(−r−1)>2^(−10c−3).
1. Write 2^(−10c−3)=8·2^(−10c−6)=8γ and multiply by 7/32.
1. Conclude d>(7/4)γ and subtract γ. This identifies the slack needed to absorb the factor 2; it does not suppress that factor.

Direct dependencies: mathlib:Real.rpow_lt_rpow_of_exponent_lt, mathlib:Real.rpow_add, mathlib:Real.rpow_pos_of_pos.

Acceptance: For c=1 and r=11, γ=2^(−16) and d=7·2^(−17)=(7/2)γ. If the excluded boundary r=10c+2 is integral, the displayed comparison becomes equality d=(7/4)γ, so strictness uses the strict factor count.

Source match: BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation — Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction..

### Absorbing the remaining factor two

Identifier: ExponentialSumsAndCircleMethod:ES.0/large-conductor-constant-absorption. Kind: lemma.

For real k≥1, γ>0, d≥(7/4)γ and S≤2k^(1−d), if k≥2^(4/(3γ)), then S≤k^(1−γ).

Hypotheses and conventions: The threshold is non-strict; the bases and exponent γ are positive. No character or modulus hypothesis is needed in this numerical lemma.

Proof or construction outline:

1. Raise k≥2^(4/(3γ)) to exponent 3γ/4 to obtain k^(3γ/4)≥2.
1. Multiply by k^(1−d)>0. The resulting power is k^(1−d+3γ/4).
1. Since d≥7γ/4, its exponent is at most 1−γ; monotonicity in the exponent for k≥1 proves the claim.

Direct dependencies: mathlib:Real.rpow_le_rpow, mathlib:Real.rpow_mul, mathlib:Real.rpow_add, mathlib:Real.rpow_le_rpow_of_exponent_le.

Acceptance: At γ=1/4, d=7/16 and k=2^(16/3), the absorption comparison is equality. At k=1 and S=2, the conclusion S≤1 fails if the threshold is removed.

Source match: BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation — Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction..

### Uniform conditional large-conductor cancellation

Identifier: ExponentialSumsAndCircleMethod:ES.0/large-conductor-numeric-threshold. Kind: theorem.

For every c>0, put γ=2^(−10c−6). There exists a natural K≥2 such that for all natural k≥K, q>0 and r<10c+2 with k^(7/32)≤q, and every real S satisfying S≤2k(τ(q)^(r²)/q)^(2^(−r)), one has S≤k^(1−γ). The analytic inequality for S is an explicit premise, not a proved character-sum estimate.

Hypotheses and conventions: Natural k,q,r; c>0; q>0; the displayed lower bound and factor-count bound. S is real; γ is local notation.

Proof or construction outline:

1. Take K₁ from large-conductor-eventual-divisor-saving. Choose a natural K₂≥2^(4/(3γ)), and let K=max(K₁,K₂). Positivity of γ follows from the positive base two.
1. For k≥K, the divisor factor is strictly below q^(1/2). Apply graham-ringrose-saving-kernel to the assumed analytic-size inequality, with t=τ(q)^(r²).
1. Apply large-conductor-denominator-conversion. The source exponent margin gives d≥7γ/4, and large-conductor-constant-absorption removes the factor 2.
1. All threshold choices depend only on c. In the intended application S is the norm of the original product-character sum over k/2<m≤k. Proving its displayed premise still requires the exact CRT character factors and the complete Graham–Ringrose proof; this theorem does not close Proposition 8.2.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/large-conductor-eventual-divisor-saving, ExponentialSumsAndCircleMethod:ES.0/graham-ringrose-saving-kernel, ExponentialSumsAndCircleMethod:ES.0/large-conductor-denominator-conversion, ExponentialSumsAndCircleMethod:ES.0/large-conductor-exponent-margin, ExponentialSumsAndCircleMethod:ES.0/large-conductor-constant-absorption, mathlib:exists_nat_ge, mathlib:Real.rpow_pos_of_pos.

Acceptance: The statement keeps q and r universally quantified after K, expressing uniformity. There is no assertion that every nonnegative S satisfies the analytic-size premise.

Source match: BennettSiksek2020, §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃ calculation — Worker decomposition of the numerical argument using the corrected AN.5 divisor supplier. It does not prove or assume away the missing Graham–Ringrose theorem or CRT character reconstruction..

### Divisor in a smooth-modulus window

Identifier: ExponentialSumsAndCircleMethod:ES.0/smooth-divisor-window. Kind: lemma.

Let T > 1 be real and N a natural number with T ≤ N. If every prime p dividing N satisfies p ≤ T², then there is a natural divisor d of N with T ≤ d ≤ T².

Hypotheses and conventions: N is automatically positive. Squarefreeness is not required for this divisor-extraction step. Bounds on natural numbers are comparisons after casting to ℝ.

Proof or construction outline:

1. Use strong induction on N. Since N > 1, Nat.ne_one_iff_exists_prime_dvd supplies a prime p dividing N.
1. If p ≥ T, choose d = p; the smoothness hypothesis gives p ≤ T².
1. If p < T, write N = pA with A = N div p < N. Every prime divisor of A divides N. If A ≥ T, apply the induction hypothesis to A and compose divisibility.
1. If A < T, then N = pA ≤ T². Choose d = N, which still satisfies N ≥ T. This proves the window without an ordering of the prime factors or a new smooth-number predicate.

Direct dependencies: mathlib:Nat.ne_one_iff_exists_prime_dvd.

Acceptance: T = 3, N = 30 permits d = 6; primality of the selected block is not required. T = 5, N = 6 permits d = N, illustrating the final induction branch. T = 3, N = 11 has no divisor in [3,9]; the bound on prime factors cannot be dropped.

Source match: BennettSiksek2020, §8.1, printed pp.377–378, Case 1, factor conditions (a)–(c) — Worker-derived extraction lemma exposing the arithmetic behind the asserted grouping of prime factors; not a separately numbered theorem of the source..

### Pairwise-coprime bounded blocks of a squarefree modulus

Identifier: ExponentialSumsAndCircleMethod:ES.0/squarefree-modulus-blocks. Kind: theorem.

Let T > 1, let N be squarefree, and suppose every prime divisor p of N is at most T². There exist a list B of natural numbers and a residual integer u with 0 < u < T, u·∏B = N, every b in B in [T,T²], the entries of B pairwise coprime, and gcd(u,∏B) = 1.

Hypotheses and conventions: The list and residual use the existing List, product, Squarefree and Nat.Coprime carriers. No new factorization object is defined. N = 1 is allowed and gives B empty, u = 1. The residual may equal one. Since T > 1, every listed block exceeds one.

Proof or construction outline:

1. Use strong induction on N. Squarefreeness implies N ≠ 0. If N < T, take the empty list and residual N.
1. Otherwise extract d in [T,T²] by ES.0/smooth-divisor-window and write N = dA, A = N div d < N.
1. Nat.squarefree_mul_iff supplies squarefreeness of A and gcd(d,A) = 1. Prime-factor bounds pass to A, so apply the induction hypothesis to obtain A = u·∏B.
1. Prepend d. The product identity follows by associativity and commutativity. From gcd(d,u·∏B) = 1 obtain coprimality with u and with each member of B using Nat.coprime_list_prod_right_iff. These give pairwise coprimality of the enlarged list and coprimality of u with its product.
1. If N ≥ T the list cannot be empty, because the product identity would force N = u < T. Each block and the residual divide N; hence they inherit squarefreeness and, when N is odd, oddness.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/smooth-divisor-window, mathlib:Nat.squarefree_mul_iff, mathlib:Nat.coprime_of_squarefree_mul, mathlib:Nat.coprime_list_prod_right_iff, mathlib:Squarefree.squarefree_of_dvd, mathlib:Odd.of_dvd_nat.

Acceptance: T = 3, N = 210: B = [3,5,7], u = 2 satisfies all assertions. T = 8, N = 1: the list is empty and u = 1. No nonempty-family convention is imposed. N = 36, T = 3 can yield [3,3,4] by unrestricted repeated extraction; pairwise coprimality fails without squarefreeness.

Source match: BennettSiksek2020, §8.1, printed pp.377–378, Case 1, factor conditions (a)–(e) — Makes the bounded prime-block grouping and its single residual explicit. It permits an empty list instead of assuming every family has a last block..

### Bounded CRT modulus blocks

Identifier: ExponentialSumsAndCircleMethod:ES.0/bounded-crt-modulus-blocks. Kind: theorem.

Let T ≥ 8 and a,Q,R be natural numbers with 0 < a ≤ 8, Q and R squarefree, Q odd, Q ≥ T, gcd(Q,R) = 1 and gcd(a,QR) = 1. Suppose every prime divisor of Q or R is at most T². Then there exist q and a list B such that q divides Q, q is odd and squarefree, T ≤ q ≤ T², the product of q::B is aQR, its entries are pairwise coprime and all in (1,T²], and at most two entries of B are less than T.

Hypotheses and conventions: This is a pure modulus-packing theorem. In the intended application a is the bounded 2-primary factor of the primitive conductor, Q its odd part, and R the excluded-prime product. The theorem does not prove that a given character has such a conductor decomposition. R = 1 is explicitly permitted. Unit factors are removed. The distinguished factor comes from Q, not from the principal exclusion modulus.

Proof or construction outline:

1. Apply ES.0/squarefree-modulus-blocks separately to Q and R, obtaining Q = u·∏U and R = v·∏V with 1 ≤ u,v < T and every full block in [T,T²].
1. Since Q ≥ T, U is nonempty. Choose its first entry q. It divides Q, so inherits oddness and squarefreeness; it also satisfies the required lower and upper bounds.
1. Replace the primitive residual u by au. Since a ≤ 8 ≤ T and u < T, au ≤ 8T ≤ T². The principal residual v is also below T². Both are positive; no squarefreeness of a is needed because a is kept inside this single block.
1. Concatenate U, [au], V and [v], then delete entries equal to one. List.prod_filter_bne_one preserves the product. The first entry q remains since q ≥ T > 1.
1. Within each family, coprimality follows from the packing theorem. The assumptions gcd(Q,R) = 1 and gcd(a,QR) = 1 give all cross-family coprimalities and coprimality of au with the other primitive blocks. Use divisibility of each factor into its family product; filtering preserves pairwise coprimality.
1. Every surviving full block is at least T. Only au and v can be smaller, so after taking out the distinguished q there are at most two small entries. If R = 1, its full-block list is empty and v = 1 is deleted; no principal factor is inserted artificially.
1. Reindexing the resulting list by its positions provides the hypotheses of ES.0/bounded-factor-count. This gives the source's r−2 count, including an empty principal family, without replacing it by an unnecessary weaker factor bound. Character restriction and reconstruction along CRT remain a separate unclosed interface.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/squarefree-modulus-blocks, mathlib:List.prod_filter_bne_one, mathlib:Nat.coprime_list_prod_right_iff, mathlib:Squarefree.squarefree_of_dvd, mathlib:Odd.of_dvd_nat.

Acceptance: T = 8, a = 4, Q = 11, R = 3 gives q::B = [11,4,3]. Both residual blocks are small: an r−1 large-block count would be false. T = 8, a = 1, Q = 105, R = 1 permits [15,7]; the principal family contributes no factor. T = 8, a = 1, Q = 11, R = 1 permits the one-factor list [11]. Empty maxima in the analytic threshold must then be handled by the distinguished q term alone. A residual au = 8·7 = 56 at T = 8 lies below T² = 64; retaining the bounded a in a separate extra small block would lose the sharp two-exception count.

Source match: BennettSiksek2020, §8.1, printed pp.377–378, Case 1, (a)–(e) and r−2 bound; accepted E11 review — Arithmetic part of routed item 95. The accepted errata review allows the principal family to be empty; this theorem keeps that convention and the original two-residual count. It does not claim the external Graham–Ringrose proof or the character CRT adapters are supplied..

Atlas planet: Bounded CRT modulus blocks.

### Factor count with two exceptional blocks

Identifier: ExponentialSumsAndCircleMethod:ES.0/bounded-factor-count. Kind: lemma.

Let k > 1, c > 0, qᵢ ≥ 1 for i in Fin r, and let E be a subset of Fin r with at most two members. Suppose qᵢ ≥ k^(7/32) whenever i is outside E, and ∏ᵢqᵢ ≤ k^(2c). Then r < 10c + 2. All inequalities and the product bound are interpreted in ℝ.

Hypotheses and conventions: The exceptional set is an input identifying the at most two residual blocks from ES.0/bounded-crt-modulus-blocks. The result also permits r = 0 or 1. Neither distinctness nor primality of the qᵢ is needed for this numerical bound. Positivity follows from qᵢ ≥ 1.

Proof or construction outline:

1. Each exceptional factor contributes a nonnegative logarithm. Each of the r−|E| other factors contributes at least (7/32)log k, by logarithmic monotonicity and Real.log_rpow.
1. Sum and use Real.log_prod. The product bound gives (r−|E|)(7/32)log k ≤ 2c log k.
1. Since log k > 0, divide to obtain r ≤ (64/7)c + |E| ≤ (64/7)c + 2. Because c > 0 and 64/7 < 10, the claimed strict bound follows.
1. The packing theorem supplies E after indexing the list; the ambient source bound aQR ∣ lcm(N₁,N₂) ≤ N₁N₂ ≤ k^(2c) is used as an inequality, never the false equality between ambient modulus and reduced period.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/bounded-crt-modulus-blocks, mathlib:Real.log_prod, mathlib:Real.log_le_log, mathlib:Real.log_nonneg, mathlib:Real.log_pos, mathlib:Real.log_rpow.

Acceptance: For r ≤ 2 the result is consistent even if all factors are exceptional. The coefficient is 64/7, not 32/7, because the ambient product bound is k^(2c). Three small factors cannot be allowed: take k = 2³², c = 3/64, and q₁=q₂=q₃=2. The product is k^(2c)=8, but 3 < 10c+2 is false.

Source match: BennettSiksek2020, §8.1, printed p.378, displayed r−2 logarithmic bound — Makes the strict numerical constant and the two exceptional blocks explicit. This estimate is independent of the unproved analytic character-sum bound..

### Interval length for the smooth-modulus estimate

Identifier: ExponentialSumsAndCircleMethod:ES.0/graham-ringrose-interval-threshold. Kind: lemma.

Let k > 2⁶⁴ be real, let 0 ≤ q ≤ k^(7/16), and let L ≤ k^(7/16). Then max(L,q^(1/4))·q^(5/4) ≤ k^(63/64) < k/2.

Hypotheses and conventions: In the application L is an upper bound for the other moduli; L = 0 is allowed when there are no other factors. No character estimate is a hypothesis or a conclusion. The first inequality only needs k > 1. The displayed combined contract uses the explicit strict threshold k > 2⁶⁴ for the second inequality.

Proof or construction outline:

1. Monotonicity of real powers gives q^(1/4) ≤ k^(7/64) ≤ k^(7/16), so the maximum is at most k^(7/16). Also q^(5/4) ≤ k^(35/64).
1. Multiply these nonnegative upper bounds and use Real.rpow_add to get exponent 7/16 + 35/64 = 63/64.
1. Raise k > 2⁶⁴ to the positive exponent 1/64, obtaining k^(1/64) > 2. Multiply by k^(63/64) > 0 and use the exponent sum one to get 2k^(63/64) < k.
1. Thus the quoted analytic theorem's lower bound R₀ is below the real interval length k/2 once the factor moduli have the stated cap. This establishes the length condition only, not the quoted estimate or its full source decomposition.

Direct dependencies: mathlib:Real.rpow_le_rpow, mathlib:Real.rpow_lt_rpow, mathlib:Real.rpow_le_rpow_of_exponent_le, mathlib:Real.rpow_mul, mathlib:Real.rpow_add, mathlib:Real.rpow_natCast.

Acceptance: At k = 2⁶⁴ the second comparison is equality, so the strict threshold cannot be weakened to k ≥ 2⁶⁴. At k = 2¹²⁸ the comparison is 2¹²⁶ < 2¹²⁷. L = 0 retains the q^(1/4) term for a one-factor decomposition; an undefined empty maximum is not used.

Source match: BennettSiksek2020, §8.1, printed p.378, displayed R₀ inequality — Pure size calculation underlying the use of Theorem 6; supplies an explicit threshold omitted under the source's sufficiently-large-k convention..

### Zero-mean periodic interval remainder

Identifier: ExponentialSumsAndCircleMethod:ES.0/periodic-interval-remainder. Kind: lemma.

For f:N→C, q>0, f(n+q)=f(n) and Σ_{0≤j<q}f(j)=0, and any natural A,B, Σ_{A<m≤B}f(m)=Σ_{0≤j<(B−A) mod q}f(A+j+1). Subtraction is truncated natural subtraction.

Hypotheses and conventions: No ordering assumption on A,B. No norm bound on f is needed.

Proof or construction outline:

1. If B≤A, both finite index sets are empty, so conclude directly.
1. For B>A, use the existing natural interval enumeration m=A+j+1 with 0≤j<B−A.
1. The sum f(1)+...+f(q) equals the range-q sum by f(q)=f(0). Moving a length-q block one step replaces f(a+1) by f(a+q+1), which is equal by periodicity; induction gives zero for every shifted full block.
1. Write B−A=tq+r with 0≤r<q. Reindex the first tq entries by t blocks of length q; each block contributes zero.
1. In the remaining r entries, apply periodicity t times to replace f(A+tq+j+1) by f(A+j+1).

API:

- TauCeti.ExponentialSumsPlan.periodic_interval_remainder (relation): For f:N→C, q>0, f(n+q)=f(n) and Σ_{0≤j<q}f(j)=0, and any natural A,B, Σ_{A<m≤B}f(m)=Σ_{0≤j<(B−A) mod q}f(A+j+1). Subtraction is truncated natural subtraction.

Unit contracts:

- character_three_complete: For the integer χ3 table (0,1,−1), Σ_{0<n≤2}χ3(n)=0.
- reversed_interval: Σ_{5<n≤4}(n:Z)=0.

Uses: the incomplete η-sums on p.379 — Removes complete periods before taking norms..

Direct dependencies: mathlib:Function.Periodic, mathlib:Nat.card_Ioc.

Acceptance: For f(n)=(0,1,−1) indexed by n mod 3, the interval (0,2] sums to zero and (1,2] sums to −1. When q divides B−A, the sum is zero for every starting point. For B<A, both sides are zero; no signed-interval convention is used.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; the incomplete η-sums on p.379 — The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper..

### Norm bound by the residual interval length

Identifier: ExponentialSumsAndCircleMethod:ES.0/periodic-interval-norm. Kind: lemma.

Under the hypotheses of periodic-interval-remainder, also assume ‖f(n)‖≤1 for every natural n. Then ‖Σ_{A<m≤B}f(m)‖≤((B−A) mod q), with the natural remainder cast to R.

Hypotheses and conventions: q>0; zero mean over a complete period; pointwise norm at most one.

Proof or construction outline:

1. Rewrite the interval sum with periodic-interval-remainder.
1. Apply the finite-sum triangle inequality.
1. Bound each of the r summands by one, and evaluate the cardinality of range r. In particular this proves a bound strictly less than q, although the exported character adapter uses the weaker ≤q.

API:

- TauCeti.ExponentialSumsPlan.periodic_interval_norm (relation): Under the hypotheses of periodic-interval-remainder, also assume ‖f(n)‖≤1 for every natural n. Then ‖Σ_{A<m≤B}f(m)‖≤((B−A) mod q), with the natural remainder cast to R.

Unit contracts:

- character_three_singleton: For the same table, Σ_{1<n≤2}χ3(n)=−1.

Uses: the bound for each inner η-sum on p.379 — Avoids the unnecessary 2q loss from subtracting two prefix estimates..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/periodic-interval-remainder, mathlib:norm_sum_le.

Acceptance: The χ3 table on (1,2] has norm 1 and remainder length 1, so equality occurs. A length-q interval has bound zero, not q. Scaling a nonzero zero-mean sequence by 2 can violate the bound: the pointwise hypothesis is essential.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; the bound for each inner η-sum on p.379 — The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper..

### Incomplete nonprincipal character bound

Identifier: ExponentialSumsAndCircleMethod:ES.0/character-interval-bound. Kind: lemma.

For q>0 and a nonprincipal complex Dirichlet character χ modulo q, ‖Σ_{A<m≤B}χ(m)‖≤q for all natural A,B. Values are taken by natural casting into ZMod q.

Hypotheses and conventions: Nonprincipal means χ≠1 in the existing character monoid. Neither primitive nor quadratic is assumed.

Proof or construction outline:

1. The character is q-periodic because q casts to zero in ZMod q.
1. Identify the q natural representatives 0,...,q−1 bijectively with ZMod q; use MulChar.sum_eq_zero_of_ne_one over C for the zero complete sum.
1. Use DirichletCharacter.norm_le_one pointwise.
1. Apply periodic-interval-norm; since q>0, the natural remainder is <q and hence ≤q.

API:

- TauCeti.ExponentialSumsPlan.character_interval_bound (relation): For q>0 and a nonprincipal complex Dirichlet character χ modulo q, ‖Σ_{A<m≤B}χ(m)‖≤q for all natural A,B. Values are taken by natural casting into ZMod q.

Unit contracts:

- constant_nonexample: The constant-one function sums to 12 on (0,12]; bounded values alone do not imply a bound by a fixed period.

Uses: p.379, inner sums indexed by k/(2d)<n≤k/d — Provides the uniform bound after each divisor reindexing..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/periodic-interval-norm, mathlib:DirichletCharacter, mathlib:ZMod.natCast_self, mathlib:MulChar.sum_eq_zero_of_ne_one, mathlib:DirichletCharacter.norm_le_one.

Acceptance: The nonprincipal character modulo 3 has values (0,1,−1), and its (1,2] sum is −1. The principal character modulo 3 sums to 8 on (0,12], exceeding q=3. An imprimitive but nonprincipal character is allowed; conductor need not equal q.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.379, inner sums indexed by k/(2d)<n≤k/d — The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper..

### Reindexing divisible interval entries

Identifier: ExponentialSumsAndCircleMethod:ES.0/divisible-interval-reindex. Kind: lemma.

For f:N→C, natural A,B and d>0, Σ_{m∈(A,B], d|m}f(m)=Σ_{A div d<n≤B div d}f(dn), where div is natural floor division.

Hypotheses and conventions: d>0 is required for injectivity and division. Both interval endpoints are divided, and the lower endpoint remains open.

Proof or construction outline:

1. Map n to dn. Division with remainder gives A<dn iff A div d<n, and dn≤B iff n≤B div d.
1. Positive multiplication is injective, so no weight or multiplicity is introduced.
1. For each divisible m in the left index set, m=d(m div d); its quotient satisfies the right inequalities.
1. Use the finite-sum bijection. If B≤A both sides are empty because floor division is monotone.

API:

- TauCeti.ExponentialSumsPlan.divisible_interval_reindex (relation): For f:N→C, natural A,B and d>0, Σ_{m∈(A,B], d|m}f(m)=Σ_{A div d<n≤B div d}f(dn), where div is natural floor division.

Unit contracts:

- divisible_sum_floor: Σ_{2<n≤7,3|n}(n:C)=9.
- divisible_sum_open_left: Σ_{3<n≤6,3|n}(n:C)=6.
- divisible_sum_empty: Σ_{1<n≤2,3|n}(n:C)=0.

Uses: p.379, change from m to nd — Records both floors rather than suppressing endpoint conventions..

Direct dependencies: mathlib:Nat.card_Ioc.

Acceptance: For f(n)=n, A=2,B=7,d=3, both sides sum 3+6=9. For A=3,B=6,d=3, only m=6 survives; including the lower endpoint would wrongly add 3. For A=1,B=2,d=3 there are no terms; rounding an upper endpoint upward gives a wrong term.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.379, change from m to nd — The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper..

### Weighted coprimality expansion

Identifier: ExponentialSumsAndCircleMethod:ES.0/coprime-moebius-expansion. Kind: lemma.

For f:N→C and natural A,B,M with M>0, Σ_{A<m≤B}1_{gcd(m,M)=1}f(m)=Σ_{d|M}μ(d) Σ_{A<m≤B,d|m}f(m), with μ(d) cast from Z to C and d ranging over M.divisors.

Hypotheses and conventions: M>0; no squarefreeness assumption. The coprimality factor means f(m) if Nat.Coprime m M and zero otherwise, not a newly defined carrier.

Proof or construction outline:

1. For each m, gcd(m,M)>0 because M>0.
1. Evaluate moebius_mul_coe_zeta at gcd(m,M), use coe_mul_zeta_apply and one_apply, and obtain Σ_{d|gcd(m,M)}μ(d)=1 if gcd(m,M)=1 and zero otherwise.
1. A positive d divides gcd(m,M) exactly when it divides both m and M. Replace this divisor sum by the divisor set of M filtered by d|m.
1. Multiply by f(m), distribute and interchange the two finite sums. Coerce the integer identity to C; no infinite summability input is involved.

API:

- TauCeti.ExponentialSumsPlan.coprime_moebius_expansion (relation): For f:N→C and natural A,B,M with M>0, Σ_{A<m≤B}1_{gcd(m,M)=1}f(m)=Σ_{d|M}μ(d) Σ_{A<m≤B,d|m}f(m), with μ(d) cast from Z to C and d ranging over M.divisors.

Unit contracts:

- moebius_one: Σ_{d|1}μ(d)=1.
- moebius_six: Σ_{d|6}μ(d)=0.
- moebius_four: Σ_{d|4}μ(d)=0.

Uses: p.378, Möbius divisor identity; p.379, first finite interchange — Uses the existing arithmetic function and gcd instead of rebuilding either..

Direct dependencies: mathlib:ArithmeticFunction.moebius, mathlib:ArithmeticFunction.moebius_mul_coe_zeta, mathlib:ArithmeticFunction.coe_mul_zeta_apply, mathlib:ArithmeticFunction.one_apply, mathlib:Nat.divisors, mathlib:Nat.mem_divisors.

Acceptance: M=1 retains every term, since its only divisor is 1 with μ(1)=1. For M=4, μ(4)=0 and the expansion is still correct; squarefreeness is not needed. M=0 is excluded: its library divisor set is empty, but the interval containing m=1 can have a nonzero coprime contribution.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.378, Möbius divisor identity; p.379, first finite interchange — The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper..

### Möbius expansion of an excluded character sum

Identifier: ExponentialSumsAndCircleMethod:ES.0/character-exclusion-expansion. Kind: lemma.

For a complex Dirichlet character χ modulo any natural q and M>0, Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)=Σ_{d|M}μ(d)χ(d)Σ_{A div d<n≤B div d}χ(n).

Hypotheses and conventions: q may be zero for this algebraic identity; positivity is imposed only for the subsequent finite-period bound. M may share prime factors with q and may be nonsquarefree.

Proof or construction outline:

1. Apply coprime-moebius-expansion to the character-value function.
1. Every d in M.divisors is positive by Nat.pos_of_mem_divisors; apply divisible-interval-reindex to each inner sum.
1. Use multiplicativity χ(dn)=χ(d)χ(n), including zero values at nonunits.
1. Move the fixed scalar χ(d) outside its inner finite sum and associate the factors in C.

API:

- TauCeti.ExponentialSumsPlan.character_exclusion_expansion (relation): For a complex Dirichlet character χ modulo any natural q and M>0, Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)=Σ_{d|M}μ(d)χ(d)Σ_{A div d<n≤B div d}χ(n).

Unit contracts:

- moebius_square: μ(4)=0.

Uses: p.379, final Möbius expansion — Exposes the only analytic input needed by each divisor term..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/coprime-moebius-expansion, ExponentialSumsAndCircleMethod:ES.0/divisible-interval-reindex, mathlib:DirichletCharacter, mathlib:Nat.pos_of_mem_divisors.

Acceptance: For χ3, M=2 and interval (0,2], the excluded sum is 1, not the unrestricted sum zero. For χ3 and M=3, divisors containing 3 contribute χ(3)=0; no coprimality hypothesis between q and M is required. Replacing M=2 by M=4 leaves the coprimality filter unchanged; μ(4)=0 makes the divisor expression compatible.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.379, final Möbius expansion — The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper..

### Divisor-weighted character bound

Identifier: ExponentialSumsAndCircleMethod:ES.0/character-exclusion-bound. Kind: theorem.

For q>0, nonprincipal χ modulo q, M>0, and natural A,B, ‖Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)‖≤τ(M)q, where τ(M)=card(M.divisors).

Hypotheses and conventions: No primitivity, quadraticity, squarefreeness or gcd(q,M)=1 assumption. The inequality is non-strict and uniform in both endpoints.

Proof or construction outline:

1. Use character-exclusion-expansion and the finite-sum triangle inequality.
1. Each coefficient μ(d)χ(d) has norm at most one: combine abs_moebius_le_one after scalar coercion and DirichletCharacter.norm_le_one.
1. Apply character-interval-bound to the interval with endpoints A div d and B div d; it is valid even when that interval is empty.
1. There are exactly τ(M) divisor terms, each bounded by q, so their sum is at most τ(M)q.

API:

- TauCeti.ExponentialSumsPlan.character_exclusion_bound (relation): For q>0, nonprincipal χ modulo q, M>0, and natural A,B, ‖Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)‖≤τ(M)q, where τ(M)=card(M.divisors).

Unit contracts:

- divisor_count_six: card(6.divisors)=4.
- divisor_count_one: card(1.divisors)=1.
- divisor_count_counterexample: card(120.divisors)=16.

Uses: p.379, final displayed character-sum bound — Supplies the small-conductor cancellation input after a separately owned divisor estimate..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/character-exclusion-expansion, ExponentialSumsAndCircleMethod:ES.0/character-interval-bound, mathlib:ArithmeticFunction.abs_moebius_le_one, mathlib:DirichletCharacter.norm_le_one, mathlib:norm_sum_le.

Acceptance: M=1 gives the ordinary bound q, since τ(1)=1. For M=6 there are four divisor terms and the stated upper bound is 4q, not 2q. τ(120)=16; the estimate makes no use of a false all-q logarithmic upper bound for τ.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.379, final displayed character-sum bound — The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper..

Atlas planet: Divisor-weighted character bound.

### Zero mean for the excluded product period

Identifier: ExponentialSumsAndCircleMethod:ES.0/exclusion-complete-period. Kind: lemma.

For q>0, nonprincipal χ modulo q and M>0, Σ_{0<m≤qM}1_{gcd(m,M)=1}χ(m)=0. The integer qM is a period, not an assertion about primitive conductor.

Hypotheses and conventions: No gcd(q,M)=1 or squarefree M restriction.

Proof or construction outline:

1. Apply character-exclusion-expansion with A=0,B=qM.
1. If d divides M then (qM) div d=q(M div d), so each inner character sum has length divisible by q.
1. The q-periodicity and zero complete character sum established in the proof of character-interval-bound give the hypotheses of periodic-interval-remainder; use it with this divisible length to get zero.
1. Every weighted term is zero, hence so is the finite divisor sum.

API:

- TauCeti.ExponentialSumsPlan.exclusion_complete_period (relation): For q>0, nonprincipal χ modulo q and M>0, Σ_{0<m≤qM}1_{gcd(m,M)=1}χ(m)=0. The integer qM is a period, not an assertion about primitive conductor.

Unit contracts:

- excluded_complete_period: For the integer χ3 table, Σ_{0<n≤6, gcd(n,2)=1}χ3(n)=0.

Uses: p.378, direct period estimate in Case 2 — Justifies the complete-period cancellation for the masked character..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/character-exclusion-expansion, ExponentialSumsAndCircleMethod:ES.0/periodic-interval-remainder, mathlib:ZMod.natCast_self, mathlib:MulChar.sum_eq_zero_of_ne_one, mathlib:Nat.mem_divisors.

Acceptance: For χ3 and M=2, the interval (0,6] contributes 1−1=0. For M=1 this is the usual complete-period cancellation. For χ3 and M=3 the interval (0,9] also sums to zero, despite shared prime factors.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.378, direct period estimate in Case 2 — The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper..

### Product-period character bound

Identifier: ExponentialSumsAndCircleMethod:ES.0/exclusion-direct-period-bound. Kind: theorem.

For q>0, nonprincipal χ modulo q, M>0, and natural A,B, ‖Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)‖≤qM.

Hypotheses and conventions: qM is only a valid period; it need not be the least period or an ambient conductor.

Proof or construction outline:

1. Write F(m) for the existing expression equal to χ(m) when m is coprime to M and zero otherwise; this is local notation, not a new definition node.
1. The character factor is qM-periodic by q-periodicity. The indicator is qM-periodic by the existing coprimality invariance under adding multiples of M. Thus F is qM-periodic and has norm at most one.
1. Use exclusion-complete-period and F(qM)=F(0) to turn the sum over (0,qM] into the range-qM zero mean required by periodic-interval-norm.
1. Apply that bound with qM>0 and weaken the remainder bound to qM.

API:

- TauCeti.ExponentialSumsPlan.exclusion_direct_period_bound (relation): For q>0, nonprincipal χ modulo q, M>0, and natural A,B, ‖Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)‖≤qM.

Unit contracts:

- nonsquarefree_mask: For the χ3 table on (0,6], the sums restricted by gcd(n,2)=1 and gcd(n,4)=1 are equal.

Uses: p.378, the direct bound preceding the assumption on M₂ — Keeps the valid period estimate without the source's false modulus equality..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/exclusion-complete-period, ExponentialSumsAndCircleMethod:ES.0/periodic-interval-norm, mathlib:Nat.coprime_add_mul_right_right, mathlib:DirichletCharacter.norm_le_one, mathlib:ZMod.natCast_self.

Acceptance: For χ3 and M=4, the bound is 12 although the masked sequence already has period 6; least-period minimality is not claimed. M=1 returns the ordinary q bound. The character identity χ8χ−8=χ−4 has ambient lcm 8 but primitive conductor 4; period and conductor cannot be conflated.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.378, the direct bound preceding the assumption on M₂ — The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper..

### Small-conductor square-root saving

Identifier: ExponentialSumsAndCircleMethod:ES.0/small-conductor-power-saving. Kind: theorem.

Let c>0, C≥1 and assume τ(M)≤C M^(1/(64c)) for every positive natural M. If k≥1 is natural with 8C≤k^(17/64), q>0, χ modulo q is nonprincipal, M>0, q≤8k^(7/32), and M≤k^c, then ‖Σ_{k div 2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2). All powers in the hypotheses and conclusion are real powers of nonnegative casts.

Hypotheses and conventions: The divisor estimate is an explicit hypothesis of this conditional adapter; the new unconditional supplier-instantiation nodes below import it from AN.5. The conclusion is this small-conductor branch, not the full distinct-quadratic-character proposition.

Proof or construction outline:

1. Apply character-exclusion-bound to A=k div 2 and B=k.
1. Put ε=1/(64c)>0. Monotonicity of nonnegative real powers gives M^ε≤(k^c)^ε=k^(1/64); justify the exponent simplification using c>0 and k≥1.
1. The assumed divisor bound and q≤8k^(7/32) now give τ(M)q≤8C k^(15/64).
1. Multiply 8C≤k^(17/64) by the nonnegative k^(15/64) and use the real-power addition law: 17/64+15/64=1/2.
1. This proof needs no artificial split at M=k^(3/4); AN.5 supplies a uniform constant for every positive M.

API:

- TauCeti.ExponentialSumsPlan.small_conductor_power_saving (relation): Let c>0, C≥1 and assume τ(M)≤C M^(1/(64c)) for every positive natural M. If k≥1 is natural with 8C≤k^(17/64), q>0, χ modulo q is nonprincipal, M>0, q≤8k^(7/32), and M≤k^c, then ‖Σ_{k div 2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2). All powers in the hypotheses and conclusion are real powers of nonnegative casts.

Unit contracts:

- odd_half_endpoint: Natural floor division gives 7 div 2=3.
- saving_exponents: As real numbers, 7/32+1/64+17/64=1/2.

Uses: pp.378–379, end of Case 2, using the corrected divisor estimate — Makes constant dependence and the large-k threshold explicit..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/character-exclusion-bound, mathlib:Real.rpow_le_rpow, mathlib:Real.rpow_mul, mathlib:Real.rpow_add.

Acceptance: The exact exponent identity is 7/32+1/64+17/64=1/2. For odd k=7 the index interval begins after floor(7/2)=3, so it contains 4,5,6,7. Neither c=0 nor deletion of the lower-threshold condition is permitted; the reciprocal exponent and constant absorption need the stated hypotheses.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, Case 2, pp.378–379; pp.378–379, end of Case 2, using the corrected divisor estimate — The source motivates this finite-sum interface. Generic periodic/reindexing lemmas and the explicit corrected threshold are worker derivations from the listed pinned APIs, not additional theorems attributed to the paper..

Atlas planet: Small-conductor cancellation.

### Explicit excluded-character subpower bound

Identifier: ExponentialSumsAndCircleMethod:ES.0/character-exclusion-explicit-subpower-bound. Kind: theorem.

For ε>0 and a natural B≥exp(1/ε), every nonprincipal complex character χ modulo q>0, positive exclusion modulus M and natural endpoints A,Z satisfy ‖Σ_{A<m≤Z}1_{gcd(m,M)=1}χ(m)‖≤D^B q M^ε, where D=max(1,(ε log2)⁻¹).

Hypotheses and conventions: ε>0; B natural with exp(1/ε)≤B; q>0; χ≠1; M>0; A,Z natural with no ordering assumption.

Proof or construction outline:

1. Apply character-exclusion-bound to bound the norm by τ(M)q.
1. Import AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound at ε,B,M, obtaining τ(M)≤D^B M^ε.
1. Multiply by q≥0 and rearrange the real factors. Neither the divisor function nor its subpower proof is duplicated.

API:

- TauCeti.ExponentialSumsPlan.character_exclusion_explicit_subpower_bound (relation): For ε>0 and a natural B≥exp(1/ε), every nonprincipal complex character χ modulo q>0, positive exclusion modulus M and natural endpoints A,Z satisfy ‖Σ_{A<m≤Z}1_{gcd(m,M)=1}χ(m)‖≤D^B q M^ε, where D=max(1,(ε log2)⁻¹).

Unit contracts:

- explicit_constant_one_exponent: For ε>0 and any natural B, max(1,(ε log2)⁻¹)^B≥1.

Uses: Bennett–Siksek §8.1 Case2; routed item97 — Instantiate the separate AN.5 divisor supplier, keeping all constant/threshold dependencies explicit..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/character-exclusion-bound, AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound.

Acceptance: The same constant works for every character and both endpoints. M=1 yields the coarser D^B q bound; the original sharper q theorem is retained. Shared prime factors of q,M and nonsquarefree M remain allowed.

Source match: BennettSiksek2020, §8.1, Case2, printed pp.378–379 — Worker-derived explicit consequence of the corrected divisor input; the source's invalid universal divisor estimate is not reused.; TaoDivisor2008, Small/large-prime proof; AN.5 explicit and uniform divisor nodes — The AN.5 packet owns the proof and exact constant. This node only composes its statement with the already planned character estimate..

### Explicit small-conductor threshold

Identifier: ExponentialSumsAndCircleMethod:ES.0/small-conductor-explicit-threshold. Kind: theorem.

Let c>0, B∈ℕ with B≥exp(64c), and put D=max(1,((64c)⁻¹ log2)⁻¹), C=D^B. For natural k≥1 with (8C)^(64/17)≤k, every nonprincipal complex character χ modulo q>0 and M>0 satisfying q≤8k^(7/32) and M≤k^c obeys ‖Σ_{k div2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2).

Hypotheses and conventions: c>0; B natural with exp(64c)≤B; k≥1; the displayed explicit size threshold; q>0; χ≠1; M>0; the two growth bounds.

Proof or construction outline:

1. Set ε=(64c)⁻¹>0; 1/ε=64c. The imported explicit AN.5 bound with this B supplies τ(M)≤C M^ε for every M>0, and C≥1.
1. Monotonicity of the real power17/64 applied to (8C)^(64/17)≤k gives 8C≤k^(17/64), using positive base8C and (64/17)(17/64)=1.
1. Apply small-conductor-power-saving with this actual uniform divisor bound. No unspecified constant or unrecorded eventual condition remains.

API:

- TauCeti.ExponentialSumsPlan.small_conductor_explicit_threshold (relation): Let c>0, B∈ℕ with B≥exp(64c), and put D=max(1,((64c)⁻¹ log2)⁻¹), C=D^B. For natural k≥1 with (8C)^(64/17)≤k, every nonprincipal complex character χ modulo q>0 and M>0 satisfying q≤8k^(7/32) and M≤k^c obeys ‖Σ_{k div2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2).

Unit contracts:

- threshold_reciprocal_exponents: (64/17)(17/64)=1 in the real numbers.
- threshold_equality: For C≥1, ((8C)^(64/17))^(17/64)=8C.
- threshold_one_rejected: For C≥1, the inequality8C≤1^(17/64) is false.
- divisor_supplier_exponent: For c>0, 1/((64c)⁻¹)=64c.

Uses: Bennett–Siksek §8.1 Case2; routed item97 — Instantiate the separate AN.5 divisor supplier, keeping all constant/threshold dependencies explicit..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/small-conductor-power-saving, AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound, mathlib:Real.rpow_le_rpow, mathlib:Real.rpow_mul.

Acceptance: Equality at the threshold is permitted. For C≥1 the size condition cannot hold at k=1; dropping it is detectable. B may be any certified integer upper bound, so exact real ceilings are not required.

Source match: BennettSiksek2020, §8.1, Case2, printed pp.378–379 — Worker-derived explicit consequence of the corrected divisor input; the source's invalid universal divisor estimate is not reused.; TaoDivisor2008, Small/large-prime proof; AN.5 explicit and uniform divisor nodes — The AN.5 packet owns the proof and exact constant. This node only composes its statement with the already planned character estimate..

### Uniform eventual small-conductor cancellation

Identifier: ExponentialSumsAndCircleMethod:ES.0/eventual-small-conductor-power-saving. Kind: theorem.

For each real c>0 there exists a natural K≥1 such that for all k≥K, all positive q, all nonprincipal complex Dirichlet characters χ modulo q, and all M>0, the inequalities q≤8k^(7/32) and M≤k^c imply ‖Σ_{k div2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2). K depends only on c, not on q,χ,M or k.

Hypotheses and conventions: c>0; the universal variables satisfy the displayed positivity, nonprincipality and growth conditions.

Proof or construction outline:

1. Import AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound at ε=(64c)⁻¹ to choose C≥1 independent of M.
1. Choose a natural K≥max(1,(8C)^(64/17)) using exists_nat_ge.
1. For every k≥K, real-power monotonicity and rpow_mul give8C≤k^(17/64). Apply small-conductor-power-saving.
1. For an effectively presented positive c, the preceding explicit-threshold theorem gives a computable certified choice by taking B≥exp(64c) and C=max(1,((64c)⁻¹ log2)⁻¹)^B. The abstract real existence theorem is not an executable arbitrary-real algorithm.

API:

- TauCeti.ExponentialSumsPlan.eventual_small_conductor_power_saving (relation): For each real c>0 there exists a natural K≥1 such that for all k≥K, all positive q, all nonprincipal complex Dirichlet characters χ modulo q, and all M>0, the inequalities q≤8k^(7/32) and M≤k^c imply ‖Σ_{k div2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2). K depends only on c, not on q,χ,M or k.

Unit contracts:

- one_small_conductor_exponent: At c=1/64 the divisor exponent1/(64c) equals1.

Uses: Bennett–Siksek §8.1 Case2; routed item97 — Instantiate the separate AN.5 divisor supplier, keeping all constant/threshold dependencies explicit..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/small-conductor-power-saving, AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound, mathlib:exists_nat_ge, mathlib:Real.rpow_le_rpow, mathlib:Real.rpow_mul.

Acceptance: The quantifier order is ∀c>0 ∃K ∀k,q,χ,M; separate thresholds per character are weaker. At c=1/64 the imported exponent is exactly1. This is only the small-conductor branch; it does not assert the full product-character proposition.

Source match: BennettSiksek2020, §8.1, Case2, printed pp.378–379 — Worker-derived explicit consequence of the corrected divisor input; the source's invalid universal divisor estimate is not reused.; TaoDivisor2008, Small/large-prime proof; AN.5 explicit and uniform divisor nodes — The AN.5 packet owns the proof and exact constant. This node only composes its statement with the already planned character estimate..

### Integer evaluation of the ambient product

Identifier: ExponentialSumsAndCircleMethod:ES.0/ambient-product-evaluation. Kind: lemma.

For positive N1,N2, complex Dirichlet characters χi modulo Ni and every integer a, the existing character σ=χ1.mul χ2 modulo M=lcm(N1,N2) satisfies σ(a)=χ1(a)χ2(a).

Hypotheses and conventions: No primitivity, quadraticity, distinctness or coprimality of the moduli is required. Evaluations cast the same integer to each residue ring, including nonunits.

Proof or construction outline:

1. Unfold the existing ambient product as A·B, with A and B the change-level lifts to M.
1. If a is coprime to M, apply the existing coprime change-level evaluation theorem to both factors.
1. If a is not coprime to M, choose a common prime of |a| and M. A prime divides an lcm exactly when it divides at least one input modulus, so at least one original character vanishes. The ambient character vanishes as well.
1. Use integer gcd via natural absolute values to cover a=0 and negative a; no division or representative choice is needed.

API:

- TauCeti.ExponentialSumsPlan.ambient_product_evaluation (relation): For positive N1,N2, complex Dirichlet characters χi modulo Ni and every integer a, the existing character σ=χ1.mul χ2 modulo M=lcm(N1,N2) satisfies σ(a)=χ1(a)χ2(a).

Unit contracts:

- quadratic_two_adic_cancellation: The integer residue tables satisfy χ8(a)χ−8(a)=χ−4(a) for every integer a, including negative a and even nonunits.

Uses: Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94 — Transfers the source's pointwise product into the already existing ambient character..

Direct dependencies: mathlib:DirichletCharacter.mul, mathlib:DirichletCharacter.changeLevel_eq_cast_of_dvd', mathlib:DirichletCharacter.apply_eq_zero_iff, mathlib:Nat.Prime.dvd_lcm, mathlib:Nat.Prime.not_coprime_iff_dvd.

Acceptance: Do not apply the coprime change-level formula at a nonunit. Distinct characters of equal modulus are allowed.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed p.377 — Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper..

### Coprimality of conductor and excluded primes

Identifier: ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-coprime. Kind: lemma.

For any complex character σ modulo M>0, put q=cond(σ) and R=∏{p prime : p divides M and p does not divide q}p. Then gcd(q,R)=1.

Hypotheses and conventions: The finite prime set is the existing primeFactors(M) filtered by p not dividing q; the empty product is 1. σ may be principal or imprimitive.

Proof or construction outline:

1. Every factor p is prime and does not divide q, hence is coprime to q.
1. Apply the finite-product coprimality equivalence; no prime power or multiplicity is included.

API:

- TauCeti.ExponentialSumsPlan.primitive_exclusion_coprime (relation): For any complex character σ modulo M>0, put q=cond(σ) and R=∏{p prime : p divides M and p does not divide q}p. Then gcd(q,R)=1.

Unit contracts:

- exclusion_shrink_eight: At ambient M=8 and primitive conductor q=4, R=1; repeated powers of 2 are not extra excluded primes.
- exclusion_modulus_one: At M=q=1 the empty prime product R equals 1.

Uses: Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94 — Provides the coprime primitive/exclusion split required before the CRT branch..

Direct dependencies: mathlib:Nat.primeFactors, mathlib:Nat.mem_primeFactors, mathlib:Nat.coprime_prod_right_iff.

Acceptance: M=8,q=4 gives R=1. M=q=1 has an empty excluded-prime set and satisfies the result.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed p.377 — Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper..

### The reduced product divides the ambient modulus

Identifier: ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-period-divides. Kind: lemma.

For σ modulo M>0, q=cond(σ) and R the product of prime divisors of M absent from q, qR divides M.

Hypotheses and conventions: No assertion that qR=M or that qR is a primitive conductor. All prime factors in R occur once; q>0 is supplied by conductor_ne_zero.

Proof or construction outline:

1. The product R over a subset of primeFactors(M) divides the full prime product, which divides M.
1. The existing conductor theorem gives q dividing M.
1. Combine these two divisibilities using gcd(q,R)=1, or equivalently identify their lcm with qR.

API:

- TauCeti.ExponentialSumsPlan.primitive_exclusion_period_divides (relation): For σ modulo M>0, q=cond(σ) and R the product of prime divisors of M absent from q, qR divides M.

Unit contracts:

- period_divisibility_not_equality: For χ8χ−8, qR=4 divides ambient 8 but is not equal to it.
- exclusion_principal_twelve: For the principal character modulo 12, q=1 and R=6, not 12.

Uses: Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94 — Replaces the source's unjustified equality between the ambient modulus and its reduced primitive/exclusion product..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-coprime, mathlib:DirichletCharacter.conductor_dvd_level, mathlib:DirichletCharacter.conductor_ne_zero, mathlib:Finset.prod_dvd_prod_of_subset, mathlib:Nat.prod_primeFactors_dvd.

Acceptance: The 2-adic example gives strict divisibility 4|8. For the principal character modulo 12, qR=6|12.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed p.377 — Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper..

### The primitive character with its exclusion mask

Identifier: ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-evaluation. Kind: theorem.

For every complex character σ modulo M>0 and integer a, let q=cond(σ), η=σ.primitiveCharacter and R the product of prime divisors of M absent from q. Then σ(a)=η(a) if gcd(|a|,R)=1, and σ(a)=0 otherwise.

Hypotheses and conventions: No nonprincipality or primitivity hypothesis on σ; q=1 is allowed. The mask uses coprimality of integers, equivalent to natural coprimality for nonnegative inputs.

Proof or construction outline:

1. If a is not coprime to R, a prime of R divides both a and M; the ambient character vanishes.
1. Suppose a is coprime to R. If a is also coprime to q, it is coprime to M: a hypothetical common prime of a and M either divides q or occurs among the factors of R, giving a contradiction.
1. In this coprime-to-M case use primitiveCharacter_apply_of_isCoprime to equate η(a) and σ(a).
1. In the remaining case a is not coprime to q. Since q divides M, neither character is evaluated at a unit, so both values vanish. These cases also handle a=0 and negative a.

API:

- TauCeti.ExponentialSumsPlan.primitive_exclusion_evaluation (relation): For every complex character σ modulo M>0 and integer a, let q=cond(σ), η=σ.primitiveCharacter and R the product of prime divisors of M absent from q. Then σ(a)=η(a) if gcd(|a|,R)=1, and σ(a)=0 otherwise.

Unit contracts:

- exclusion_mixed_fifteen: At M=15 and q=5, R=3.
- mask_negative_excluded: For R=3 and a=−3, the mask kills the nonzero primitive χ5 value −1.
- mask_negative_kept: For R=3 and a=−2, the mask retains the primitive χ5 value −1.
- mask_zero_excluded: For the principal character modulo 12, primitive η modulo 1 takes value 1 at 0 but the R=6 mask makes the ambient value 0.

Uses: Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94 — Turns the product evaluation into the exact masked finite sums already decomposed in the first thirteen nodes..

Direct dependencies: mathlib:DirichletCharacter.primitiveCharacter, mathlib:DirichletCharacter.primitiveCharacter_apply_of_isCoprime, mathlib:DirichletCharacter.apply_eq_zero_iff, mathlib:DirichletCharacter.conductor_dvd_level, mathlib:Nat.mem_primeFactors, mathlib:Nat.Prime.not_coprime_iff_dvd, mathlib:Nat.isCoprime_iff_coprime.

Acceptance: At M=15,q=5 the mask must remove multiples of 3 even when η is nonzero there. At M=12 for the principal character, η is the character modulo 1 and R=6; the masked identity includes a=0. The formula is valid for R=1; do not require a nonempty principal-factor family.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed p.377 — Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper..

Atlas planet: Primitive character and exclusion mask.

### Cancelled primes divide both original conductors

Identifier: ExponentialSumsAndCircleMethod:ES.0/cancelled-prime-common-support. Kind: lemma.

Let χ1,χ2 be primitive complex Dirichlet characters of positive moduli N1,N2. Set M=lcm(N1,N2), σ=χ1.mul χ2, q=cond(σ), and R the product of prime divisors of M not dividing q. Then R divides gcd(N1,N2).

Hypotheses and conventions: Quadraticity and distinctness are unnecessary, but primitivity of both inputs is required.

Proof or construction outline:

1. Lift χ1,χ2 to A,B modulo M. By conductor_changeLevel and primitivity, their conductors are N1,N2.
1. Write A=(A·B)·B⁻¹. Apply conductor_mul_dvd_lcm_conductor and conductor_inv to obtain N1 dividing lcm(q,N2). Similarly N2 divides lcm(q,N1).
1. For a prime p of M not dividing q, the lcm criterion first gives p dividing at least one Ni. The corresponding reverse conductor divisibility then forces p to divide the other Ni.
1. Every factor of R is consequently a prime divisor of gcd(N1,N2). Its distinct-prime product divides the radical of that gcd, which divides the gcd.

API:

- TauCeti.ExponentialSumsPlan.cancelled_prime_common_support (relation): Let χ1,χ2 be primitive complex Dirichlet characters of positive moduli N1,N2. Set M=lcm(N1,N2), σ=χ1.mul χ2, q=cond(σ), and R the product of prime divisors of M not dividing q. Then R divides gcd(N1,N2).

Unit contracts:

- common_prime_not_coprime_moduli: For χ3 times the primitive χ15, q=5 and R=3 divides gcd(3,15); the original conductors need not be coprime.
- imprimitive_support_obstruction: If the inputs are principal modulo 8 and modulo 1, then q=1 and R=2 does not divide gcd(8,1); input primitivity is necessary for the common-support conclusion.

Uses: Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94 — Supplies R≤min(N1,N2), preserving the source growth exponent c in the small-conductor application..

Direct dependencies: mathlib:DirichletCharacter.IsPrimitive, mathlib:DirichletCharacter.conductor_changeLevel, mathlib:DirichletCharacter.conductor_inv, mathlib:DirichletCharacter.conductor_mul_dvd_lcm_conductor, mathlib:Nat.Prime.dvd_lcm, mathlib:Nat.mem_primeFactors, mathlib:Finset.prod_dvd_prod_of_subset, mathlib:Nat.prod_primeFactors_dvd.

Acceptance: Do not infer the claim merely from q dividing M; the reverse conductor bounds are essential. The imprimitive principal modulo 8 paired with modulo 1 is a counterexample without primitivity. R is bounded by either original modulus, not merely by their product.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed p.377 — Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper..

### Quadraticity survives primitive reduction

Identifier: ExponentialSumsAndCircleMethod:ES.0/primitive-product-quadratic. Kind: lemma.

For positive N1,N2 and quadratic complex Dirichlet characters χi modulo Ni, the existing primitive product η=χ1.primitive_mul χ2 is quadratic.

Hypotheses and conventions: Quadratic means the existing predicate that every value is 0, 1 or −1; it includes the principal character. No input primitivity or distinctness is required.

Proof or construction outline:

1. Use the existing equivalence between quadraticity and χ²=1.
1. Change level to M=lcm(N1,N2); the lifts preserve squares as monoid homomorphisms, so σ²=1.
1. The existing change-level equality sends η to σ. Apply injectivity of changeLevel from q to M to infer η²=1, and convert back to quadraticity.

API:

- TauCeti.ExponentialSumsPlan.primitive_product_quadratic (relation): For positive N1,N2 and quadratic complex Dirichlet characters χi modulo Ni, the existing primitive product η=χ1.primitive_mul χ2 is quadratic.

Unit contracts:

- quadratic_two_adic_cancellation: The integer residue tables satisfy χ8(a)χ−8(a)=χ−4(a) for every integer a, including negative a and even nonunits.
- diagonal_principal_obstruction: The square of χ3 sums to 2 on (0,3], whereas its primitive conductor is 1; equal input characters cannot satisfy a nonprincipal conductor bound.

Uses: Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94 — Supplies the quadratic hypothesis for subsequent large-conductor arithmetic; that subsequent branch is not asserted here..

Direct dependencies: mathlib:DirichletCharacter.mul, mathlib:DirichletCharacter.primitive_mul, mathlib:DirichletCharacter.changeLevel, mathlib:DirichletCharacter.changeLevel_injective, mathlib:DirichletCharacter.changeLevel_primitiveCharacter, mathlib:MulChar.IsQuadratic, mathlib:MulChar.IsQuadratic.sq_eq_one, mathlib:MulChar.isQuadratic_iff_sq_eq_one.

Acceptance: The diagonal product may become principal and is still quadratic. Primitivity of η is already primitive_mul_isPrimitive; do not introduce a new existence theorem.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed p.377 — Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper..

### Distinct primitive quadratic inputs give a nonprincipal inducer

Identifier: ExponentialSumsAndCircleMethod:ES.0/primitive-product-nonprincipal. Kind: lemma.

For positive N1,N2, primitive quadratic complex characters χi modulo Ni, and an integer a with χ1(a)≠χ2(a), the primitive product η=χ1.primitive_mul χ2 is not principal.

Hypotheses and conventions: Distinctness is as functions on integers; moduli may coincide. The interface retains both source quadratic hypotheses; the proof only needs the second input to square to the principal character.

Proof or construction outline:

1. Assume η=1. Changing level to M gives A·B=1 for the two lifted inputs.
1. Quadraticity gives B²=1, so A=B.
1. Conductor invariance under changeLevel and input primitivity imply N1=N2.
1. Transport across this equality and apply injectivity of changeLevel to deduce χ1=χ2, contradicting the integer witness.

API:

- TauCeti.ExponentialSumsPlan.primitive_product_nonprincipal (relation): For positive N1,N2, primitive quadratic complex characters χi modulo Ni, and an integer a with χ1(a)≠χ2(a), the primitive product η=χ1.primitive_mul χ2 is not principal.

Unit contracts:

- diagonal_principal_obstruction: The square of χ3 sums to 2 on (0,3], whereas its primitive conductor is 1; equal input characters cannot satisfy a nonprincipal conductor bound.
- quadratic_two_adic_cancellation: The integer residue tables satisfy χ8(a)χ−8(a)=χ−4(a) for every integer a, including negative a and even nonunits.

Uses: Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94 — Justifies the nonprincipal hypothesis needed by incomplete and masked character cancellation..

Direct dependencies: mathlib:DirichletCharacter.primitive_mul, mathlib:DirichletCharacter.changeLevel_primitiveCharacter, mathlib:DirichletCharacter.changeLevel_injective, mathlib:DirichletCharacter.conductor_changeLevel, mathlib:DirichletCharacter.IsPrimitive, mathlib:MulChar.IsQuadratic.sq_eq_one.

Acceptance: Equal primitive inputs give a principal product and must be excluded. Distinct conjugate order-three characters modulo 7 have principal product; distinctness without quadraticity is insufficient. The χ8,χ−8 example has equal moduli and different character values, so distinct-modulus hypotheses would be too restrictive.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed p.377 — Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper..

### Small-conductor cancellation for the original product

Identifier: ExponentialSumsAndCircleMethod:ES.0/small-conductor-product-cancellation. Kind: theorem.

For each real c>0 there is a natural K≥1 such that, for every k≥K and every pair of distinct primitive quadratic complex Dirichlet characters χi of positive moduli Ni≤k^c, if q=cond(χ1.mul χ2)≤8k^(7/32), then ‖Σ_{k div2<a≤k}χ1(a)χ2(a)‖≤k^(1/2). The threshold K depends only on c.

Hypotheses and conventions: Distinctness means an integer witness of different values; the moduli may be equal. There is no prime-factor smoothness hypothesis in this small-conductor branch. The theorem does not cover q>8k^(7/32), or assert full Proposition 8.2.

Proof or construction outline:

1. Choose K from eventual-small-conductor-power-saving for the same c.
1. Form the existing σ and η, with q>0 and η nonprincipal by primitive-product-nonprincipal.
1. The excluded prime product R is positive, since all its factors are positive primes (including the empty product 1). By cancelled-prime-common-support, R divides gcd(N1,N2), hence R≤N1≤k^c.
1. Combine ambient-product-evaluation and primitive-exclusion-evaluation, converting integer coprimality to natural coprimality at the natural interval arguments.
1. Apply the uniform masked-character bound with character η modulo q and exclusion modulus R. The threshold is independent of both inputs; no exponent 2c from the ambient lcm is needed.

API:

- TauCeti.ExponentialSumsPlan.small_conductor_product_cancellation (relation): For each real c>0 there is a natural K≥1 such that, for every k≥K and every pair of distinct primitive quadratic complex Dirichlet characters χi of positive moduli Ni≤k^c, if q=cond(χ1.mul χ2)≤8k^(7/32), then ‖Σ_{k div2<a≤k}χ1(a)χ2(a)‖≤k^(1/2). The threshold K depends only on c.

Unit contracts:

- exclusion_shrink_eight: At ambient M=8 and primitive conductor q=4, R=1; repeated powers of 2 are not extra excluded primes.
- diagonal_principal_obstruction: The square of χ3 sums to 2 on (0,3], whereas its primitive conductor is 1; equal input characters cannot satisfy a nonprincipal conductor bound.
- common_prime_not_coprime_moduli: For χ3 times the primitive χ15, q=5 and R=3 divides gcd(3,15); the original conductors need not be coprime.

Uses: Bennett–Siksek §8.1, Proposition 8.2, printed pp.377–379; routed item 94 and Case 2/item 97 — Completes the product-to-masked-sum application for the small-conductor branch without duplicating AN.5 or claiming the large-conductor result..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/ambient-product-evaluation, ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-evaluation, ExponentialSumsAndCircleMethod:ES.0/cancelled-prime-common-support, ExponentialSumsAndCircleMethod:ES.0/primitive-product-nonprincipal, ExponentialSumsAndCircleMethod:ES.0/eventual-small-conductor-power-saving, mathlib:DirichletCharacter.conductor_ne_zero, mathlib:DirichletCharacter.primitive_mul_isPrimitive, mathlib:Nat.isCoprime_iff_coprime.

Acceptance: Preserve the quantifier order ∀c>0 ∃K ∀k,N1,N2,χ1,χ2. The strict source Case 2 condition implies the stated non-strict bound; equality at the conductor threshold is harmless. R=1 needs no exceptional case. Equal inputs fail the nonprincipal reduction.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed p.377 and Case 2, pp.378–379 — Worker decomposition of the reviewed modulus/conductor correction. The primitive construction and general conductor laws are already in the pinned library; this node states only the indicated arithmetic adapter, not a new construction or a verbatim theorem from the paper..

Atlas planet: Small-conductor product cancellation.

### CRT decomposition of Dirichlet characters

Identifier: ExponentialSumsAndCircleMethod:ES.0/crt-character-equivalence. Kind: definition.

For a finite index type I, pairwise coprime natural moduli nᵢ and a commutative monoid with zero C, put N=∏ᵢnᵢ. Define crtCharacterEquiv(n) from Dirichlet characters C of level N to families of characters C of levels nᵢ, as a multiplicative equivalence. Let E be the native unit-group CRT equivalence from (ZMod N)× to ∏ᵢ(ZMod nᵢ)×. The i-th factor has unit homomorphism u ↦ χ(E⁻¹(eᵢ(u))), where eᵢ places u in coordinate i and one elsewhere; extend by zero at nonunits using the native unit-character equivalence. The inverse multiplies the coordinate characters on CRT units and extends by zero. No new character or conductor carrier is introduced.

Hypotheses and conventions: I is finite, with decidable equality for the coordinate inclusions; nᵢ are pairwise coprime. No positivity is needed for this algebraic equivalence; all conductor statements below require nᵢ>0. C is any commutative monoid with zero. Empty I has N=1; modulus-one coordinates are allowed.

Proof or construction outline:

1. Compose ZMod.prodEquivPi with Units.mapEquiv and MulEquiv.piUnits to obtain E. These are existing equivalences, not additional constructions.
1. Compose MulChar.mulEquivToUnitHom, transport along E by MulEquiv.monoidHomCongrLeft, Pi.monoidHomMulEquiv on the finite product of unit groups, and the coordinate inverses of MulChar.mulEquivToUnitHom through MulEquiv.piCongrRight.
1. The native Pi.monoidHomMulEquiv supplies both inverse laws and multiplicativity. Unfold its forward map to get the single-coordinate restriction, and its inverse to get the product on units. Zero extension is inherited from MulChar.ofUnitHom.

API:

- TauCeti.ExponentialSumsPlan.crtCharacterEquiv_apply_unit (characterisation): With E and eᵢ as in the definition, the unit homomorphism of the i-th factor sends u to χ.toUnitHom(E⁻¹(eᵢ(u))). This fixes the coordinate order.
- TauCeti.ExponentialSumsPlan.crtCharacterEquiv_symm_unit (simp): For a family φᵢ and a unit u modulo N, the inverse character at u equals ∏ᵢφᵢ(reductionᵢ(u)), using the native ZMod.unitsMap for nᵢ|N.
- TauCeti.ExponentialSumsPlan.crtCharacterEquiv_one (structure): The principal character maps to the family of principal characters, with their native zero values at nonunits.
- TauCeti.ExponentialSumsPlan.crtCharacterEquiv_mul (structure): The image of χψ is the coordinatewise product of the images of χ and ψ.
- TauCeti.ExponentialSumsPlan.crtCharacterEquiv_ext (extensionality): Two characters of level N are equal if and only if every corresponding CRT factor is equal.
- TauCeti.ExponentialSumsPlan.crt_inverse_product (compatibility): The inverse of φ is ∏ᵢ changeLevel(nᵢ|N)(φᵢ), an equality of native characters at N. Promoted to ES.0/crt-inverse-product because conductor arguments consume it.
- TauCeti.ExponentialSumsPlan.crt_integer_evaluation (compatibility): For every integer a, χ(a)=∏ᵢ(crtCharacterEquiv(n)(χ))ᵢ(a), including nonunits and negative a. Promoted to ES.0/crt-integer-evaluation for the summand comparison.

Unit contracts:

- crt_empty_inverse: For I=Fin 0 and its empty family, the inverse character evaluates to 1 at every integer a.
- crt_one_zero: For the singleton modulus-one family, the factor of the principal character evaluates to 1 at zero.
- crt_singleton: For the singleton modulus-seven family and arbitrary χ, the unique factor agrees with χ at every integer.
- crt_principal_nonunit: At the two moduli (3,4), the inverse of the principal family evaluates to 0 at 2; it is not the constant function one.
- crt_principal_unit: At the two moduli (3,4), the inverse of the principal family evaluates to 1 at −1.
- crt_principal_conductor: The inverse of the principal family at (3,4) has native conductor 1, despite ambient modulus 12.

Uses: Bennett–Siksek §8.1, Case 1, printed pp.377–378 — Produce actual characters on the pairwise-coprime bounded blocks and recover the summand at all integers.; Theorem 6, printed pp.376–377 — Separate each ambient block modulus from its conductor; establish primitivity only where the analytic theorem requires it.; ES.0/crt-product-conductor and /crt-quadratic-components — Use the multiplicative equivalence to compare primitive conductors and squares of characters..

Direct dependencies: mathlib:ZMod.prodEquivPi, mathlib:MulChar.mulEquivToUnitHom, mathlib:Units.mapEquiv, mathlib:MulEquiv.piUnits, mathlib:MulEquiv.monoidHomCongrLeft, mathlib:Pi.monoidHomMulEquiv, mathlib:MulEquiv.piCongrRight.

Acceptance: An empty family reconstructs the unique character modulo one, whose value is one even at zero. A singleton family recovers its input character; at moduli 3 and 4 the principal family reconstructs a character zero at 2 and one at −1.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377 — Worker-defined adapter composing the pinned CRT and unit-character equivalences for the block factors used in Case 1; the paper does not name this equivalence separately..

### CRT reconstruction as a product of level lifts

Identifier: ExponentialSumsAndCircleMethod:ES.0/crt-inverse-product. Kind: lemma.

For the finite pairwise-coprime family nᵢ, N=∏ᵢnᵢ and characters φᵢ with values in a commutative monoid with zero C, crtCharacterEquiv(n)⁻¹(φ)=∏ᵢ changeLevel(nᵢ|N)(φᵢ), as characters modulo N.

Hypotheses and conventions: Same finite family and coefficient assumptions as crt-character-equivalence; zero moduli and empty families are allowed here.

Proof or construction outline:

1. Use the unit-character equivalence to compare the two characters on units modulo N.
1. The inverse API gives the product of φᵢ evaluated on coordinate reductions. ZMod.prodEquivPi_apply identifies each coordinate with its native reduction; DirichletCharacter.changeLevel_toUnitHom gives exactly the same unit homomorphism for each lifted factor.
1. The finite product of characters agrees on units, hence agrees as a native MulChar; at nonunits zero extension is already part of the carrier.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/crt-character-equivalence, mathlib:ZMod.prodEquivPi_apply, mathlib:DirichletCharacter.changeLevel_toUnitHom, mathlib:MulChar.mulEquivToUnitHom.

Acceptance: Empty product is the principal character modulo one. The right side is a product after all factors are lifted to N, not the mixed-level binary mul constructor.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377 — Worker derivation supplying the precise meaning of the source product notation through native changeLevel..

### All-integer CRT reconstruction

Identifier: ExponentialSumsAndCircleMethod:ES.0/crt-integer-evaluation. Kind: lemma.

For every integer z and character χ at N=∏ᵢnᵢ with values in a commutative monoid with zero C, χ(z)=∏ᵢφᵢ(z), where φ=crtCharacterEquiv(n)(χ). No coprimality hypothesis on z is imposed.

Hypotheses and conventions: I finite and the nᵢ pairwise coprime. Empty I and modulus-one coordinates are included.

Proof or construction outline:

1. If z is a unit modulo N, use the inverse unit formula, its inverse law, and ZMod.prodEquivPi_apply to identify every coordinate with the integer cast at nᵢ.
1. If z is a nonunit modulo N, transport its unit predicate across the ring CRT equivalence and use Pi.isUnit_iff. Some coordinate z modulo nᵢ is a nonunit. Both χ(z) and that factor vanish by the native MulChar nonunit law, so the product is zero.
1. For empty I the target product is the one-element ring; all residues are units and the empty character product has value one.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/crt-character-equivalence, mathlib:ZMod.prodEquivPi_apply, mathlib:Pi.isUnit_iff, mathlib:MulChar.map_nonunit.

Acceptance: Principal modulo 12 vanishes at 2, so reconstruction must retain nonunit zeros. The formula applies at z=0 and z=−1; N=1 gives value one at both.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377 — Worker derivation of the all-integer product identity needed inside the source interval sum; equality on units alone would not suffice..

### Finite CRT products of primitive factors

Identifier: ExponentialSumsAndCircleMethod:ES.0/crt-primitive-family. Kind: lemma.

Let nᵢ>0 be a finite pairwise-coprime family and φᵢ native Dirichlet characters with values in a commutative monoid with zero C. If every φᵢ is primitive at nᵢ, then crtCharacterEquiv(n)⁻¹(φ) is primitive at ∏ᵢnᵢ.

Hypotheses and conventions: All nᵢ>0. The index set may be empty and some nᵢ may equal one.

Proof or construction outline:

1. Induct over the finite index set, using crt-inverse-product to express the inverse character as a product of level lifts. The empty case is the native primitive principal character at level one.
1. At an insertion i, pairwise coprimality and Nat.coprime_prod_right_iff make nᵢ coprime to the product of the remaining levels. The induction hypothesis makes the remaining product primitive.
1. Apply the exact CA.1 primitivity-of-a-product-at-coprime-levels supplier. DirichletCharacter.changeLevel_trans identifies its two lifted factors with the full product. Reindexing and associating finite products are routine; the binary primitivity proof stays with CA.1.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/crt-inverse-product, ClassicalArithmeticCompletion:CA.1/primitivity-of-a-product-at-coprime-levels, mathlib:DirichletCharacter.isPrimitive_one_level_one, mathlib:DirichletCharacter.changeLevel_trans, mathlib:Nat.coprime_prod_right_iff.

Acceptance: The empty family is primitive at level one. Primitivity at level one does not require nonprincipality. Without coprimality, squaring a nonprincipal quadratic character gives a principal product; the conclusion fails.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377 — Finite-family adapter for the primitive factors on p.377, importing the owned binary theorem instead of rebuilding it..

### Conductor of a finite CRT product

Identifier: ExponentialSumsAndCircleMethod:ES.0/crt-product-conductor. Kind: theorem.

For positive pairwise-coprime nᵢ and arbitrary characters φᵢ valued in a commutative monoid with zero C, the conductor of crtCharacterEquiv(n)⁻¹(φ) equals ∏ᵢ cond(φᵢ).

Hypotheses and conventions: All nᵢ>0; neither primitivity nor nonprincipality of φᵢ is required.

Proof or construction outline:

1. Set dᵢ=cond(φᵢ). The native conductor_dvd_level and conductor_ne_zero give positive dᵢ dividing nᵢ. The dᵢ remain pairwise coprime by divisibility.
1. Take each native primitiveCharacter φᵢ and reconstruct it at D=∏ᵢdᵢ. The preceding finite primitive-family lemma makes this character primitive at D.
1. Its change of level from D to N equals the reconstructed original family. Expand both inverse products, use changeLevel as a monoid homomorphism and changeLevel_trans, then use changeLevel_primitiveCharacter coordinatewise.
1. Conductor invariance under changeLevel gives the stated exact product. This uses positive N and does not confuse dᵢ with nᵢ.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/crt-inverse-product, ExponentialSumsAndCircleMethod:ES.0/crt-primitive-family, mathlib:DirichletCharacter.conductor_dvd_level, mathlib:DirichletCharacter.conductor_ne_zero, mathlib:DirichletCharacter.primitiveCharacter_isPrimitive, mathlib:DirichletCharacter.changeLevel_primitiveCharacter, mathlib:DirichletCharacter.changeLevel_trans, mathlib:DirichletCharacter.conductor_changeLevel.

Acceptance: A principal family has product conductor one regardless of its ambient moduli. A mixture of a primitive factor modulo 4 and a principal factor modulo 3 has conductor 4 and ambient level 12.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377 — Worker derivation making the source primitive/principal distinction precise for arbitrary CRT groupings..

### Conductor of one CRT factor

Identifier: ExponentialSumsAndCircleMethod:ES.0/crt-component-conductor. Kind: lemma.

For χ of positive level N=∏ᵢnᵢ with positive pairwise-coprime nᵢ, the conductor of its i-th CRT factor equals gcd(cond(χ),nᵢ). In particular a block nᵢ dividing cond(χ) has a primitive factor; a block coprime to cond(χ) has a principal factor.

Hypotheses and conventions: C is a commutative monoid with zero; every nᵢ>0. The two consequences use the native IsPrimitive and principal-character criteria.

Proof or construction outline:

1. Apply crt-product-conductor to the family crtCharacterEquiv(n)(χ), using the inverse law to obtain cond(χ)=∏ⱼdⱼ.
1. The i-th dᵢ divides nᵢ. The product of all other dⱼ is coprime to nᵢ because dⱼ|nⱼ and the nⱼ are pairwise coprime.
1. Split the conductor product at i and apply Nat.gcd_mul_of_coprime_of_dvd, obtaining gcd(cond(χ),nᵢ)=dᵢ.
1. The first consequence unfolds IsPrimitive. For a block coprime to cond(χ), dᵢ=1 and eq_one_iff_conductor_eq_one identifies its factor with the principal character.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/crt-product-conductor, ExponentialSumsAndCircleMethod:ES.0/crt-character-equivalence, mathlib:DirichletCharacter.conductor_dvd_level, mathlib:Nat.coprime_prod_right_iff, mathlib:Nat.gcd_mul_of_coprime_of_dvd, mathlib:DirichletCharacter.IsPrimitive, mathlib:DirichletCharacter.eq_one_iff_conductor_eq_one.

Acceptance: At ambient level 12 and conductor 4, the mod-3 factor is principal and the mod-4 factor primitive. A principal character at a block of size greater than one is not primitive there.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377 — Worker derivation of exactly the distinguished-factor primitivity required by Theorem 6; it also recovers the source principal factors when their moduli are coprime to the conductor..

### Quadratic CRT factors

Identifier: ExponentialSumsAndCircleMethod:ES.0/crt-quadratic-components. Kind: lemma.

Every CRT factor of a complex quadratic Dirichlet character is quadratic in the native MulChar.IsQuadratic sense, which includes principal characters.

Hypotheses and conventions: A finite pairwise-coprime family; χ is a complex-valued native quadratic character at its product level.

Proof or construction outline:

1. Use MulChar.isQuadratic_iff_sq_eq_one to express quadraticity as χ²=1 in the character group.
1. The multiplicative equivalence sends this equality to the coordinatewise square equality. Evaluate at the selected coordinate and apply the same native criterion.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/crt-character-equivalence, mathlib:MulChar.isQuadratic_iff_sq_eq_one.

Acceptance: A principal component satisfies this predicate. No claim that all components are nonprincipal or have exact order two is made.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377 — Worker derivation preserving the quadratic nature of the source factors without adding a new quadratic-character definition..

### Level lifting as an exclusion mask

Identifier: ExponentialSumsAndCircleMethod:ES.0/change-level-exclusion. Kind: lemma.

For any natural D,R, any complex Dirichlet character η modulo D and any integer z, changeLevel(D|DR)(η)(z) equals η(z) if z and R are coprime as integers, and zero otherwise. No coprimality between D and R, and no positivity assumption, is needed for this evaluation identity.

Hypotheses and conventions: Native integer evaluation and IsCoprime are used, including D=0 or R=0; analytic applications have D,R>0.

Proof or construction outline:

1. If z is coprime to both D and R, IsCoprime.mul_right_iff shows it is a unit modulo DR and changeLevel_eq_cast_of_dvd' gives the original value.
1. If z is not coprime to R, it is not coprime to DR and apply_eq_zero_iff makes the lifted value zero.
1. If z is not coprime to D, both η(z) and the lifted value vanish; the conditional right side is then zero in either case.

Direct dependencies: mathlib:DirichletCharacter.changeLevel, mathlib:DirichletCharacter.changeLevel_eq_cast_of_dvd', mathlib:DirichletCharacter.apply_eq_zero_iff, mathlib:IsCoprime.mul_right_iff.

Acceptance: R=1 gives equality at every integer, including nonunits modulo D. Repeated prime factors in R do not change the mask; coprimality of D and R is unnecessary.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377 — Worker derivation identifying the corrected excluded-prime summand on pp.377–379 with a native character at the reduced period..

### Characters on the bounded CRT blocks

Identifier: ExponentialSumsAndCircleMethod:ES.0/bounded-crt-character-factors. Kind: theorem.

Let T≥8, 0<a≤8, Q odd squarefree with Q≥T, and R squarefree, with gcd(Q,R)=1 and gcd(a,QR)=1. Every prime dividing Q or R is at most T². Let η be a primitive complex character modulo aQ. There exist a natural r, positive moduli nᵢ indexed by Fin(r+1), and characters φᵢ modulo nᵢ, with: the moduli pairwise coprime and product aQR; n₀|Q, n₀ odd squarefree and T≤n₀; every 1<nᵢ≤T²; at most two indices i≠0 have nᵢ<T; cond(φᵢ)=gcd(aQ,nᵢ), so φ₀ is primitive; and η(z) times the coprimality mask for R equals ∏ᵢφᵢ(z) for every integer z.

Hypotheses and conventions: The native primitive η and arithmetic hypotheses are supplied. No quadraticity is needed for this factor construction. R=1 is allowed; all modulus-one blocks have already been discarded. Other factors need not all be primitive or principal for an arbitrary admissible grouping; their exact gcd conductors are stated.

Proof or construction outline:

1. Apply bounded-crt-modulus-blocks to obtain the distinguished q and the tail list B. Set r=length(B), enumerate q::B by Fin(r+1), and transfer its product, pairwise coprimality, bounds and exceptional-count properties. This is finite list indexing, not a new arithmetic packing theorem.
1. Lift η to aQR by native changeLevel and transport its level along the enumerated product equality. Its conductor is aQ by conductor_changeLevel and primitivity.
1. Apply crtCharacterEquiv to that native character. crt-component-conductor gives every gcd conductor. Since n₀|Q, it divides aQ and the distinguished factor is primitive.
1. Use change-level-exclusion and crt-integer-evaluation to identify the original masked summand at every integer. All nonunit zeros remain in this equality.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/bounded-crt-modulus-blocks, ExponentialSumsAndCircleMethod:ES.0/crt-character-equivalence, ExponentialSumsAndCircleMethod:ES.0/crt-component-conductor, ExponentialSumsAndCircleMethod:ES.0/crt-integer-evaluation, ExponentialSumsAndCircleMethod:ES.0/change-level-exclusion, mathlib:DirichletCharacter.conductor_changeLevel.

Acceptance: For a=4,Q=11,R=1,T=8, use moduli (11,4); both factors of a primitive η modulo 44 are primitive and the principal family is empty. For a=4,Q=11,R=3,T=8, moduli (11,4,3) exhibit two small blocks; the mod-3 factor is principal and the mod-11 factor primitive. A singleton family has r=0; its maximum over the other moduli is the empty maximum zero in the endpoint below.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377 — Worker assembly of the corrected source factorization, preserving the existing r−2 arithmetic bound and accepted empty-principal-family convention. General subsequent factors are permitted by the corrected Theorem 6 modulus interface..

### Large-conductor character blocks and interval threshold

Identifier: ExponentialSumsAndCircleMethod:ES.0/large-conductor-character-blocks. Kind: theorem.

Fix c>0 and a natural k>2⁶⁴. Let σ be any complex quadratic character at a positive ambient modulus M≤k^(2c), whose conductor D satisfies D≥8k^(7/32). Suppose every prime divisor of M is at most k^(7/16). Then there exist r≥0, pairwise-coprime moduli nᵢ indexed by Fin(r+1), and quadratic characters φᵢ modulo nᵢ, such that ∏ᵢnᵢ divides M, every 1<nᵢ≤k^(7/16), n₀ is odd squarefree and at least k^(7/32), φ₀ is primitive, σ(z)=∏ᵢφᵢ(z) for every integer z, and r+1<10c+2. If L=max{nᵢ:i≠0}, with L=0 for the empty set, then max(L,n₀^(1/4))n₀^(5/4)<k/2. All displayed nonintegral powers are real powers of nonnegative real casts.

Hypotheses and conventions: σ need not be primitive at M. The large lower bound already excludes a principal σ. This theorem supplies the factors and the size hypotheses for Theorem 6; it contains no character-sum estimate.

Proof or construction outline:

1. Set η=σ.primitiveCharacter, D=cond(σ), and R to the product of primes of M absent from D. The inherited primitive-exclusion lemmas give gcd(D,R)=1, DR|M and σ(z)=η(z) times the R mask. R is squarefree by Finset.squarefree_prod_of_pairwise_isCoprime on its finite set of distinct primes.
1. η is primitive by the native theorem. It is quadratic because changeLevel(η)=σ, changeLevel is injective into M>0 and a monoid homomorphism, and the square-to-one criterion descends along that injection.
1. Use the exact CA.1 odd-part and two-adic-conductor-bound suppliers, not their proofs: write a=2^(D.factorization(2)) and Q=D/a. Then 0<a≤8, D=aQ, Q is odd squarefree and gcd(a,Q)=1. Native ordProj_pos, ordProj_mul_ordCompl_eq_self, ordProj_dvd, not_dvd_ordCompl and coprime_ordCompl supply the elementary factor split and coprimality. From D≥8T and a≤8 obtain Q≥T for T=k^(7/32); k>2⁶⁴ gives T≥8.
1. Since Q|D|M and R|M, the smoothness hypotheses transfer from M; T²=k^(7/16) by Real.rpow_mul. Coprimality of D and R gives all remaining packing inputs. Apply bounded-crt-character-factors to η; its moduli multiply to DR and therefore divide M.
1. The native lift of η to DR is quadratic by the square criterion and changeLevel multiplicativity. crt-quadratic-components then gives all factor predicates, while the inherited mask equality identifies their product with σ at every integer.
1. Let the bad set be all indices with nᵢ<T. The distinguished block is not bad and the packing bound gives card(bad)≤2. The total product is at most M≤k^(2c), and all blocks are at least one. Apply bounded-factor-count to the total number r+1 to get its strict bound 10c+2.
1. Take the finite maximum L of all other moduli, zero if none. Its bound is k^(7/16), as is n₀. Apply graham-ringrose-interval-threshold to obtain the stated strict inequality; no analytic estimate is invoked.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/bounded-crt-character-factors, ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-coprime, ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-period-divides, ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-evaluation, ExponentialSumsAndCircleMethod:ES.0/crt-quadratic-components, ExponentialSumsAndCircleMethod:ES.0/bounded-factor-count, ExponentialSumsAndCircleMethod:ES.0/graham-ringrose-interval-threshold, ClassicalArithmeticCompletion:CA.1/odd-part-of-a-quadratic-conductor-is-squarefree, ClassicalArithmeticCompletion:CA.1/two-adic-conductor-bound, mathlib:DirichletCharacter.primitiveCharacter_isPrimitive, mathlib:DirichletCharacter.changeLevel_primitiveCharacter, mathlib:DirichletCharacter.changeLevel_injective, mathlib:DirichletCharacter.changeLevel, mathlib:DirichletCharacter.conductor_dvd_level, mathlib:DirichletCharacter.conductor_ne_zero, mathlib:MulChar.isQuadratic_iff_sq_eq_one, mathlib:Nat.ordProj_dvd, mathlib:Nat.not_dvd_ordCompl, mathlib:Nat.coprime_ordCompl, mathlib:Nat.squarefree_mul_iff, mathlib:Real.rpow_mul, mathlib:Real.rpow_le_rpow, mathlib:Real.rpow_pos_of_pos, mathlib:Nat.ordProj_mul_ordCompl_eq_self, mathlib:Nat.ordProj_pos, mathlib:Finset.squarefree_prod_of_pairwise_isCoprime.

Acceptance: For σ=χ₁.mul χ₂ at M=lcm(N₁,N₂), the earlier ambient-product-evaluation and primitive-product-quadratic arguments give the source summand and quadraticity; M≤N₁N₂≤k^(2c), so the statement supplies Case 1 factors without assuming M=D R. The source has r factors; this signature uses Fin(r+1), so its count is r+1 throughout. Singleton factors use L=0. Empty principal families and conductor shrinkage at 2 remain valid. The strict k>2⁶⁴ threshold is retained; equality would only give R₀≤k/2 from the inherited scalar bound.

Source match: BennettSiksek2020, §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377 — Worker derivation of the complete arithmetic/character input to Case 1, importing both precise CA.1 classification statements. This realizes the factor-block portion of routed item 95 and leaves the external analytic proof explicit..

### Finite interval correlation

Identifier: ExponentialSumsAndCircleMethod:ES.0/interval-correlation. Kind: definition.

For A∈ℤ, N∈ℕ, b:ℤ→ℂ and t∈ℤ define intervalCorrelation(A,N,b,t)=Σ_{n∈(A,A+N]} b(n+t) conjugate(b(n)). This finite expression is defined without a support hypothesis. Its autocorrelation identities require b to vanish outside (A,A+N]. No cyclic wraparound is used.

Hypotheses and conventions: A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction. The second factor, not the shifted first factor, is conjugated.

Proof or construction outline:

1. Use the existing finite integer interval, complex conjugation and finite sum; no replacement sequence, convolution or character carrier is introduced.

API:

- TauCeti.ExponentialSumsPlan.intervalCorrelation_empty (simp): intervalCorrelation(A,0,b,t)=0 for arbitrary A,b,t.
- TauCeti.ExponentialSumsPlan.interval_correlation_zero (compatibility): C(0) is the real energy Σ_{n∈I}‖b(n)‖², cast into ℂ. Promoted to interval-correlation-zero.
- TauCeti.ExponentialSumsPlan.interval_correlation_neg (relation): If b vanishes outside I, then C(−t)=conjugate(C(t)). Promoted to interval-correlation-neg.
- TauCeti.ExponentialSumsPlan.interval_correlation_vanish (simp): If b vanishes outside I and N≤|t|, then C(t)=0. Promoted to interval-correlation-vanish.
- TauCeti.ExponentialSumsPlan.intervalCorrelation_scale (compatibility): For z∈ℂ, intervalCorrelation(A,N,z b,t)=‖z‖² intervalCorrelation(A,N,b,t). No support hypothesis is needed.
- TauCeti.ExponentialSumsPlan.intervalCorrelation_translate (compatibility): For s∈ℤ, intervalCorrelation(A−s,N,n↦b(n+s),t)=intervalCorrelation(A,N,b,t). No support hypothesis is needed.

Unit contracts:

- correlation_empty: For arbitrary b and t, intervalCorrelation(−3,0,b,t)=0.
- correlation_complex_diagonal: For b(1)=1,b(2)=i and b zero elsewhere, intervalCorrelation(0,2,b,0)=2.
- correlation_positive_phase: For that b, intervalCorrelation(0,2,b,1)=i, not −i or 1.
- correlation_negative_phase: For that b, intervalCorrelation(0,2,b,−1)=−i.
- correlation_no_wraparound: For that b, intervalCorrelation(0,2,b,2)=0, not 2.
- correlation_negative_interval: For b(−1)=i and b zero elsewhere, intervalCorrelation(−2,1,b,0)=1.

Uses: Polymath 2014, proof of Proposition 4.12(ii), (4-22)–(4-24) — Express shifted products with their precise complex conjugation and separate diagonal energy from off-diagonal lags.; ES.0/shift-energy-expansion and /q-vdc-lag-bound — Compress H² shift pairs into H−1 positive lags with multiplicity H−h.; ES.0/q-vdc-uniform-correlation — Accept a correlation bound from a separately proved analytic or finite-field estimate without duplicating that supplier..

Direct dependencies: mathlib:Int.card_Ioc, mathlib:Complex.mul_conj'.

Acceptance: For b(1)=1,b(2)=i and b zero elsewhere, C(1)=i and C(−1)=−i. N=0 gives zero for all b and shifts.

Source match: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). — Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates..

### Zero-lag correlation energy

Identifier: ExponentialSumsAndCircleMethod:ES.0/interval-correlation-zero. Kind: lemma.

For arbitrary A,N,b, intervalCorrelation(A,N,b,0)=(Σ_{n∈I}‖b(n)‖²:ℝ), cast into ℂ. In particular its imaginary part is zero and its real part is nonnegative.

Hypotheses and conventions: A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction. No support hypothesis is required.

Proof or construction outline:

1. Expand intervalCorrelation at shift zero.
1. Apply Complex.mul_conj' termwise and commute the real-to-complex cast with the finite sum.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/interval-correlation, mathlib:Complex.mul_conj'.

Acceptance: b(1)=i on I={1} gives energy one; the unconjugated square would be −1.

Source match: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). — Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates..

### Hermitian correlation symmetry

Identifier: ExponentialSumsAndCircleMethod:ES.0/interval-correlation-neg. Kind: lemma.

If b vanishes outside I, then intervalCorrelation(A,N,b,−t)=conjugate(intervalCorrelation(A,N,b,t)) for every integer t.

Hypotheses and conventions: A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.

Proof or construction outline:

1. In the sum at −t retain only n for which n and n−t lie in I; the other terms vanish by the support hypothesis.
1. Reindex by m=n−t between this intersection and the intersection defining C(t). Translation is bijective with inverse m↦m+t.
1. Conjugate termwise and commute complex multiplication. The equality is not claimed for an arbitrary function restricted only in its second factor.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/interval-correlation, mathlib:Finset.prod_bij, mathlib:Finset.prod_subset.

Acceptance: For the two-point values (1,i), the lags 1 and −1 are i and −i. Without support, take I={1}, b(1)=b(2)=1,b(0)=0: C(1)=1 but C(−1)=0.

Source match: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). — Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates..

### Disjoint-shift correlation vanishing

Identifier: ExponentialSumsAndCircleMethod:ES.0/interval-correlation-vanish. Kind: lemma.

If b vanishes outside I and N≤|t|, then intervalCorrelation(A,N,b,t)=0.

Hypotheses and conventions: A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required.

Proof or construction outline:

1. If n and n+t both belong to the half-open integer interval of length N, subtract the strict lower and weak upper inequalities to obtain −N<t<N.
1. Under N≤|t|, at least one value in each product is therefore zero. Sum the zero terms; N=0 is the empty sum.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/interval-correlation.

Acceptance: At |t|=N the correlation is already zero. N=1 and t=0 is not a vanishing case for a nonzero singleton.

Source match: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). — Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates..

### Support of the averaged shifts

Identifier: ExponentialSumsAndCircleMethod:ES.0/shift-support-envelope. Kind: lemma.

Assume H>0 and b vanishes outside I. If k<H and n∉J, then b(n+kr)=0. Thus every shift in 0,…,H−1 is supported in J, whose cardinality is exactly W=N+(H−1)r.

Hypotheses and conventions: A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required. H>0; r≥0 by its natural type.

Proof or construction outline:

1. For n≤A−(H−1)r and k≤H−1, n+kr≤A. For n>A+N, n+kr>A+N since r≥0.
1. Apply the support hypothesis in either case.
1. Int.card_Ioc evaluates card(J) as its nonnegative endpoint difference W. This envelope may contain gaps when r>N; it is not asserted to be the exact union of supports.

Direct dependencies: mathlib:Int.card_Ioc.

Acceptance: N=2,r=3,H=2 gives J=(A−3,A+2] with five points, although the two shifted supports are disjoint. H=1 gives J=I; r=0 also gives J=I. For N=0 all shifted values vanish even if J is nonempty.

Source match: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). — Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates..

### Translation of a supported finite sum

Identifier: ExponentialSumsAndCircleMethod:ES.0/supported-shift-sum. Kind: lemma.

For H>0, k<H and any f:ℤ→ℂ vanishing outside I, Σ_{n∈J} f(n+kr)=Σ_{m∈I} f(m).

Hypotheses and conventions: A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required. The support hypothesis applies to f; b is not used in this lemma. H>0 and k<H.

Proof or construction outline:

1. Translate the exact interval (A−kr,A+N−kr] by n↦n+kr onto I; inverse translation proves a finite bijection.
1. That translated interval is contained in J by 0≤kr≤(H−1)r. Extend its sum to J: each extra term is zero by the support hypothesis.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/shift-support-envelope, mathlib:Finset.prod_bij, mathlib:Finset.prod_subset.

Acceptance: For f supported only at A+1, the term with k=H−1 is at the leftmost permitted integer A+1−(H−1)r. Using I instead of J loses translated terms at the boundary.

Source match: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). — Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates..

### Periodic-factor shift averaging

Identifier: ExponentialSumsAndCircleMethod:ES.0/periodic-shift-averaging. Kind: lemma.

Let a:ℤ→ℂ satisfy a(n+r)=a(n) for every integer n, let b vanish outside I and let H>0. Set S=Σ_{n∈I}a(n)b(n). Then H S=Σ_{n∈J} a(n)(Σ_{k=0}^{H−1} b(n+kr)), with H cast into ℂ.

Hypotheses and conventions: A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required. Function.Periodic a r; H>0. No bound on a or b is required for this identity.

Proof or construction outline:

1. Apply supported-shift-sum to f(n)=a(n)b(n) for every k<H; its support follows from that of b.
1. Function.Periodic.nat_mul identifies a(n+kr) with a(n).
1. Sum the H identical translated sums, interchange the finite n,k sums and factor a(n).

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/supported-shift-sum, mathlib:Function.Periodic.nat_mul.

Acceptance: r=0 is permitted and gives repeated identical shifts. H=1 is the original sum; H=0 is excluded from this averaging contract.

Source match: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). — Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates..

### Shift-pair correlation reindexing

Identifier: ExponentialSumsAndCircleMethod:ES.0/shift-pair-correlation. Kind: lemma.

Let H>0, k,l<H and b vanish outside I. Then Σ_{n∈J} b(n+kr) conjugate(b(n+lr))=intervalCorrelation(A,N,b,(k−l)r), where k−l is computed in ℤ, not by natural subtraction.

Hypotheses and conventions: A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required. H>0; k,l<H.

Proof or construction outline:

1. Put f(m)=b(m+(k−l)r) conjugate(b(m)); this is supported in I because its second factor is zero elsewhere.
1. Apply supported-shift-sum with shift l. Ring arithmetic identifies m=n+lr and the first argument with n+kr.
1. Unfold only the defining finite sum of intervalCorrelation.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/interval-correlation, ExponentialSumsAndCircleMethod:ES.0/supported-shift-sum.

Acceptance: k=0,l=1 produces the negative lag −r. At k=l the equality recovers diagonal energy.

Source match: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). — Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates..

### Multiplicity of ordered shift differences

Identifier: ExponentialSumsAndCircleMethod:ES.0/shift-pair-lag-count. Kind: lemma.

For every natural H and every F:ℤ→ℂ, Σ_{k=0}^{H−1}Σ_{l=0}^{H−1} F(k−l)=H F(0)+Σ_{h=1}^{H−1}(H−h)(F(h)+F(−h)), with differences in ℤ and multiplicities cast into ℂ.

Hypotheses and conventions: H∈ℕ may be zero. The positive-lag sum is over the natural interval [1,H).

Proof or construction outline:

1. Partition the ordered square into k=l, k>l and k<l. The diagonal has H elements.
1. For fixed 1≤h<H, pairs with k−l=h are exactly (j+h,j) for 0≤j<H−h; the inverse reads j=l. The opposite triangle is obtained by swapping the coordinates.
1. Use these finite bijections and sum each constant F(±h) exactly H−h times. This gives both the multiplicity and the empty H=0,1 cases.

Direct dependencies: mathlib:Finset.prod_bij.

Acceptance: H=0 gives zero; H=1 gives F(0). H=3 gives 3F(0)+2(F(1)+F(−1))+F(2)+F(−2).

Source match: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). — Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates..

### Energy of the averaged shifts

Identifier: ExponentialSumsAndCircleMethod:ES.0/shift-energy-expansion. Kind: lemma.

For H>0 and b supported in I, Σ_{n∈J}‖Σ_{k=0}^{H−1} b(n+kr)‖²=H D+2Σ_{h=1}^{H−1}(H−h) Re C(hr), where D=Σ_{n∈I}‖b(n)‖² and C(t)=intervalCorrelation(A,N,b,t).

Hypotheses and conventions: A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required. H>0. The right side is real; individual Re C(hr) may be negative.

Proof or construction outline:

1. Use Complex.mul_conj' on the inner sum and Finset.sum_mul_sum to expand its squared norm into ordered shift pairs.
1. Interchange the finite sums and apply shift-pair-correlation.
1. Apply shift-pair-lag-count to F(t)=C(tr), use interval-correlation-neg to pair opposite lags, and interval-correlation-zero for the diagonal. Take real parts to obtain the stated real equality.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/shift-pair-correlation, ExponentialSumsAndCircleMethod:ES.0/shift-pair-lag-count, ExponentialSumsAndCircleMethod:ES.0/interval-correlation-neg, ExponentialSumsAndCircleMethod:ES.0/interval-correlation-zero, mathlib:Complex.mul_conj', mathlib:Finset.sum_mul_sum.

Acceptance: For b=1 on an interval of N=2, r=1,H=2, energy is 6, not the diagonal-only value 4. For b values (1,−1), N=2,r=1,H=2, energy is 2, so the real parts cannot be replaced by norms inside this equality.

Source match: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). — Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates..

### Finite q–van der Corput energy bound

Identifier: ExponentialSumsAndCircleMethod:ES.0/q-vdc-energy-bound. Kind: theorem.

Let H>0, a be r-periodic with ‖a(n)‖≤1 for every integer n, and b vanish outside I. Then H²‖Σ_{n∈I}a(n)b(n)‖²≤W Σ_{n∈J}‖Σ_{k=0}^{H−1}b(n+kr)‖², where W=N+(H−1)r.

Hypotheses and conventions: A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required. H>0; a is r-periodic and bounded in norm by one.

Proof or construction outline:

1. Use periodic-shift-averaging and take norms. The triangle inequality and the bound on a give H‖S‖≤Σ_{n∈J}‖Σ_k b(n+kr)‖.
1. Both sides are nonnegative; square the inequality. Apply the existing finite Cauchy–Schwarz inequality to the real sequences 1 and the inner norms.
1. The sum of the constant squares is card(J)=W by shift-support-envelope. Keep this exact factor rather than a hidden constant.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/periodic-shift-averaging, ExponentialSumsAndCircleMethod:ES.0/shift-support-envelope, mathlib:norm_sum_le, mathlib:Finset.sum_mul_sq_le_sq_mul_sq.

Acceptance: H=1 reduces to the interval Cauchy–Schwarz bound. N=0 has S=0 and zero energy, even when W>0. The hypothesis on a cannot be omitted: a=2,b supported at one point,H=N=1 gives 4≤1 falsely.

Source match: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). — Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates..

### Finite q–van der Corput lag bound

Identifier: ExponentialSumsAndCircleMethod:ES.0/q-vdc-lag-bound. Kind: theorem.

Under q-vdc-energy-bound's hypotheses, H²‖Σ_{n∈I}a(n)b(n)‖²≤W(H D+2Σ_{h=1}^{H−1}(H−h)‖C(hr)‖), where D=Σ_{n∈I}‖b(n)‖², C(t)=intervalCorrelation(A,N,b,t), and W=N+(H−1)r.

Hypotheses and conventions: A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness, multiplicativity or modulus factorization is required. H>0; a is r-periodic and bounded in norm by one.

Proof or construction outline:

1. Substitute shift-energy-expansion into q-vdc-energy-bound.
1. For each positive lag use Complex.re_le_norm. The factors H−h and W are nonnegative, so replacing real parts by norms preserves the upper bound.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/q-vdc-energy-bound, ExponentialSumsAndCircleMethod:ES.0/shift-energy-expansion, mathlib:Complex.re_le_norm.

Acceptance: The coefficient of positive-lag norms is two and their multiplicity is H−h. For H=1 the off-diagonal sum is empty. This estimates an arbitrary supported b; it does not assume b is a multiplicative character.

Source match: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through (4-23). — Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates..

### One-step q–van der Corput estimate

Identifier: ExponentialSumsAndCircleMethod:ES.0/q-vdc-uniform-correlation. Kind: theorem.

Suppose 1≤r≤N, a:ℤ→ℂ is r-periodic, ‖a(n)‖≤1, b vanishes outside I=(A,A+N], and ‖b(n)‖≤1 for n∈I. Put H=N div r. If T≥0 and ‖intervalCorrelation(A,N,b,hr)‖≤T for every natural 1≤h<H, then ‖Σ_{n∈I}a(n)b(n)‖²≤4Nr+2NT. All terms in this inequality are real casts; div is natural floor division.

Hypotheses and conventions: A∈ℤ; N,r∈ℕ with 1≤r≤N; T∈ℝ with T≥0. The correlation assumption retains the zero-extended finite interval; it is not a complete sum or a periodic wraparound correlation.

Proof or construction outline:

1. Set H=N div r. Integer division gives H≥1, Hr≤N<(H+1)r≤2Hr, and W=N+(H−1)r≤2N.
1. Use q-vdc-lag-bound. The pointwise bound on b and Int.card_Ioc give D≤N.
1. Bound each positive-lag norm by T. Gauss' finite sum formula gives 2Σ_{h=1}^{H−1}(H−h)=H(H−1). Thus the bound after dividing by H² is W(N/H+(H−1)T/H).
1. Use N/H≤2r, (H−1)/H≤1 and W≤2N to obtain 4Nr+2NT. These are elementary inequalities between nonnegative reals; division is legitimate because H>0.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/q-vdc-lag-bound, mathlib:Int.card_Ioc, mathlib:Finset.sum_range_id_mul_two.

Acceptance: r=N gives H=1 and an empty correlation premise; the non-sharp 4N² bound is valid. For N=0 or r=0 the theorem is not invoked; those cases are already covered by the undivided energy bound. In the Polymath application a is the r-periodic factor and b is the remaining factor multiplied by its supported weight. A separate bound for C(hr) is still needed; no Weil or Graham–Ringrose estimate is hidden in T.

Source match: Polymath2014, Proof of Proposition 4.12(ii), printed pp.2108–2110, K=⌊N/r⌋ and (4-22)–(4-24). — Worker's exact finite, complex-valued formulation of the elementary shift-and-square argument. The source uses shifts 1,…,K and an implicit support constant; this plan uses 0,…,H−1 and the exact support length. It does not supply the source's finite-field correlation estimates..

Atlas planet: q–van der Corput inequality.

### Polynomial Weyl inequality

Identifier: ExponentialSumsAndCircleMethod:ES.0/polynomial-weyl-inequality. Kind: theorem.

For every degree d≥2 and ε>0 there is C(d,ε)>0 such that for every real polynomial f of degree d, every integer a and positive q with gcd(|a|,q)=1 and |leadingCoeff(f)−a/q|≤q^{−2}, and every N≥1, |Σ_{m=1}^Nexp(2πif(m))|≤CN^{1+ε}(N^{−1}+q^{−1}+qN^{−d})^{1/2^{d−1}}. The constant is independent of the lower coefficients, a,q,N and the leading coefficient subject to the approximation hypothesis.

Hypotheses and conventions: The approximation is to the actual native leading coefficient. All powers with nonintegral exponents are real rpow; positive N,q make divisions legitimate. This classical bound is distinct from the stronger VMV-driven exponent1/[d(d−1)].

Proof or construction outline:

1. Expand the squared phase sum as N+2 times the sum over positive shifts of the real parts of the shifted finite phase sums; use native sum_mul_sum, unit phase modulus and conjugation. Iterate with Cauchy–Schwarz d−1 times to obtain source(9) at exponent2^{d−1}. These finite algebraic steps stay in the target proof sketch.
1. Fold native fwdDiff at the d−1 shifts. Binomial expansion gives the linear slope d!leadingCoeff(f) times their product; lower-degree terms become a constant. The native polynomial forward-difference theorem confirms the all-unit-step case and is not falsely used as the arbitrary-shift statement.
1. Each resulting finite geometric sum is at most the smaller of N and reciprocal native torus distance of its slope, with the distance-zero summand set to N. Group by the positive integer m=d!∏h. Projection to the first d−2 divisor coordinates gives at mostτ(m)^{d−2} tuples; use the exact AN.5 supplier at a smaller exponent, separating d=2 to avoid division by zero.
1. For |α−a/q|≤q^{-2}, a complete q-block is a permuted shifted rational grid with perturbation≤1/q. Its clipped reciprocal-distance sum is bounded by a constant times N+qlog(2q), including arbitrary starting offset and a shorter final block. If q>N^d the final desired bound follows directly from|S|≤N; otherwise log(2q) is absorbed by N to an arbitrarily small positive power.
1. Combine the diagonal and block contributions into N^{2^{d−1}+ε}(N^{-1}+q^{-1}+qN^{-d}); take the positive2^{d−1}-th root and renameε. All lower coefficients remain arbitrary. No additional lemma-level nodes are introduced before the breadth pass.

Direct dependencies: mathlib:fwdDiff, mathlib:Complex.mul_conj', mathlib:Finset.sum_mul_sum, mathlib:Complex.norm_exp_ofReal_mul_I, mathlib:Int.card_Ioc, mathlib:Polynomial.fwdDiff_iter_degree_eq_factorial, mathlib:Polynomial.natDegree, mathlib:Polynomial.leadingCoeff, mathlib:Polynomial.eval, mathlib:Nat.divisors, AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound, mathlib:AddCircle.norm_eq, mathlib:Real.log_pos.

Acceptance: For rational leading coefficient with small denominator the estimate retains q^{−1}; no uniform cancellation is asserted at every phase. The d! product is included before grouping, and the root exponent is2^{−(d−1)}, not2^{−d}.

Source match: AssingCircle2022, Lemma5.1 and proof pp.28–31; Lemma5.2 and proof pp.31–32 — The selected classical differencing and divisor proofs were read in full. Native forward differences and the exact AN.5 divisor supplier replace informal algebraic/analytic black boxes..

### Complete monomial exponential sum

Identifier: ExponentialSumsAndCircleMethod:ES.0/complete-power-sum. Kind: definition.

completePowerSum(d,q,a)=Σ_{x mod q}exp(2πiax^d/q), represented by the native finite residue range x=0,…,q−1 and native fourier(ax^d) evaluated at1/q in AddCircle1. The zero residue is included. q=0 is an empty sum by definition; analytical moduli are positive. No additive-character, finite-field or cyclic Fourier carrier is reconstructed.

Hypotheses and conventions: d,q are natural and a is integer. At q=1 there is one residue and the sum is1. The sum at q>0 is independent of the choice of complete representatives.

Proof or construction outline:

1. Use the native Fourier monomial and finite range.
1. Periodicity of the phase under x→x+q identifies any complete residue interval with the source interval1..q.
1. Complex conjugation negates a; at a=0 all q terms equal one.

API:

- completePowerSum_zero_modulus (simp): q=0 gives0.
- completePowerSum_one_modulus (simp): q=1 gives1.
- completePowerSum_zero_frequency (simp): a=0 gives q, cast to complex.
- completePowerSum_conjugate (compatibility): Conjugation changes a to−a.
- completePowerSum_residue_formula (compatibility): The native Fourier expression equals the source real-lift exponential sum.

Unit contracts:

- completePowerSum_zero_test: d=3,q=0,a=1 gives0.
- completePowerSum_one_test: d=3,q=1,a=7 gives1.
- completePowerSum_linear_test: d=1,q=2,a=1 gives0, agreeing with complete additive orthogonality.
- completePowerSum_quadratic_test: d=2,q=3,a=1 gives i√3.

Uses: Assing Lemmas6.3,6.14–6.17 — Major-arc approximation uses its exact normalization; finite-field Gauss inputs are imported rather than reproduced..

Direct dependencies: mathlib:fourier, mathlib:fourier_coe_apply, mathlib:fourier_neg, mathlib:fourier_zero.

Acceptance: Including x=0 makes the linear nontrivial sum zero, rather than−1. This monomial complete-sum adapter does not assume a Weil estimate for arbitrary composite q.

Source match: AssingCircle2022, §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked — The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion..

### Complete monomial sum bound

Identifier: ExponentialSumsAndCircleMethod:ES.0/complete-power-bound. Kind: theorem.

For every d≥3 there is C_d>0 such that for all q≥1 and integers a with gcd(|a|,q)=1, |completePowerSum(d,q,a)|≤C_dq^{1−1/d}. The constant is independent of a and q. This is the monomial composite-modulus bound used to obtain a simple Waring singular-series convergence range, not the general finite-field Weil theorem.

Hypotheses and conventions: Degree two is excluded from this source proof because E18 invalidates its blanket two-adic recurrence. That degree has a separate proof obligation.

Proof or construction outline:

1. Reduce prime moduli using the gcd(d,p−1)-th-power fibre formula and the exact FF.1 Gauss/convention suppliers. Their trivial character must contribute the missing zero residue so its complete additive sum vanishes.
1. For prime powers use the binomial stationary phase recurrence in Lemmas6.15–6.16. For d≥3 the stated v>d range meets the required two-adic binomial threshold; the excluded d=2,p=2,v=3 case is not imported.
1. After reducing to exponents≤d, the normalized sum is≤1 except at finitely many primes depending only on d; at large primes the Gauss bound gives d p^{−1/6}.
1. CRT multiplicativity and the finite set of bad primes give one uniform C_d for all q. These are the source’s target-level proof steps; no new field Gauss theorem is planned.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/complete-power-sum, FiniteFieldsAndCharacterSums:FF.1/power-count-via-characters, FiniteFieldsAndCharacterSums:FF.1/gauss-sum-absolute-value, FiniteFieldsAndCharacterSums:FF.1/trivial-character-conventions.

Acceptance: At prime p with gcd(d,p−1)=1 the complete sum is0 for a coprime to p. The finitely many primes dividing d are included in C_d, not silently discarded.

Source match: AssingCircle2022, §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked — The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion..

## ES.1 — Fourier counting identities

Coverage: partial. Finite weighted torus extraction, ordered Vinogradov counting, native major/minor sets and their strict disjointness condition are now planned. Weighted/smoothed limiting transfers and the routed function-field counting interfaces still require their source contracts. These nodes do not supply local major-arc approximations or minor-arc analytic estimates.

### Weighted torus exponential sum

Identifier: ExponentialSumsAndCircleMethod:ES.1/weighted-torus-sum. Kind: definition.

For any finite subset A of a type ι, integral frequency map Φ:ι→ℤⁿ and complex weights w:ι→ℂ, define weightedTorusSum(A,Φ,w)(α)=Σ_{a∈A} w(a)∏_{j∈Fin n} fourier(Φ(a)ⱼ)(αⱼ), for α∈(ℝ/ℤ)ⁿ. All torus characters and probability Haar measures are the existing Mathlib objects. No cyclic finite Fourier transform is redefined.

Hypotheses and conventions: n≥0 is natural; A is finite; no positivity or multiplicativity is assumed for w. Coordinates are indexed by Fin n. Empty products equal one.

Proof or construction outline:

1. Use native continuous Fourier monomials and finite products, then the finite weighted sum.
1. Continuity is preserved under finite sums/products; the sum is integrable on the compact probability torus.
1. Translate the character convention using fourier_coe_apply, with T=1; the exponent has the positive 2πi sign.

API:

- weightedTorusSum_empty (simp): For A empty, weightedTorusSum is identically zero.
- weightedTorusSum_singleton (simp): For A={a}, the value is w(a)∏ⱼfourier(Φ(a)ⱼ)(αⱼ).
- weightedTorusSum_zero (simp): At α=0 the value is the sum of the weights.
- weightedTorusSum_add_weights (relation): For weights u+v the sum is the sum of the two weighted torus sums.
- weightedTorusSum_continuous (structure): The function of α is continuous, and hence integrable for the product probability Haar measure.
- weightedTorusSum_integer_phase (compatibility): For a real lift x∈ℝⁿ, its value is Σ_a w(a)exp(2πi ΣⱼΦ(a)ⱼxⱼ), independent of the lift.
- weightedTorusSum_zero_dimension (characterisation): For n=0 the function on the one-point torus is Σ_aw(a).

Unit contracts:

- weightedTorusSum_empty_test: The empty set gives zero, not a constant one character.
- weightedTorusSum_singleton_negative_test: For n=1, A={0}, Φ(0)=−1, w(0)=2 and α=1/4, the value is −2i.
- weightedTorusSum_fourier_test: For a singleton of weight one and frequency m in dimension one the function is the existing fourier(m).
- weightedTorusSum_zero_dimension_test: In dimension zero two weights 2 and −3 give value −1, not zero.

Uses: BDG Theorem4.1; ES.2 discrete restriction — Retains arbitrary complex coefficients in the finite sum.; ES.1 coefficient extraction; ES.4 prime-weighted branch — Weights may encode configuration multiplicities or arithmetic weights without altering torus normalization..

Direct dependencies: mathlib:fourier, mathlib:fourier_coe_apply, mathlib:fourier_add, mathlib:fourier_neg, mathlib:fourier_eval_zero, mathlib:fourier_zero, mathlib:AddCircle.haarAddCircle, mathlib:MeasureTheory.Measure.pi, mathlib:Continuous.integrable_of_hasCompactSupport.

Acceptance: At α=0 the value is Σ_{a∈A}w(a). A singleton at a nonzero frequency distinguishes the sign convention.

Source match: BDG2016, §1 p.633 and Theorem4.1 pp.637–638 — The torus phase and weighted finite sums follow the published normalization; extension to a finite carrier is finite algebra..

Atlas planet: Weighted torus exponential sum.

### Torus coefficient-counting identity

Identifier: ExponentialSumsAndCircleMethod:ES.1/torus-coefficient-extraction. Kind: theorem.

For the preceding A,Φ,w and b∈ℤⁿ, the integral of weightedTorusSum(A,Φ,w)(α)∏ⱼfourier(−bⱼ)(αⱼ), with respect to the product probability Haar measure, equals Σ_{a∈A,Φ(a)=b}w(a). The equality is complex-valued and exact; it requires neither a limiting integral nor an asymptotic hypothesis.

Hypotheses and conventions: All input sums are finite; product measure is ΠⱼhaarAddCircle at period one. Complex signed weights are allowed.

Proof or construction outline:

1. Distribute the finite sum through the integral; each summand is integrable because it is continuous on the compact torus.
1. Combine frequencies Φ(a)ⱼ−bⱼ by fourier_add and fourier_neg.
1. Use native Fourier-coefficient orthogonality on each coordinate, then native finite-product Fubini. The product of Kronecker deltas is one exactly when Φ(a)=b.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.1/weighted-torus-sum, mathlib:fourierCoeff, mathlib:fourierCoeff_fourier, mathlib:MeasureTheory.integral_fintype_prod_eq_prod, mathlib:MeasureTheory.Measure.pi, mathlib:MeasureTheory.integral_finsetSum.

Acceptance: If w=1 the result counts precisely the fibre Φ⁻¹(b). Replacing −b by +b gives the wrong fibre in a nonsymmetric example.

Source match: BDG2016, §1 p.633 and Theorem4.1 pp.637–638 — The torus phase and weighted finite sums follow the published normalization; extension to a finite carrier is finite algebra..

Atlas planet: Fourier counting identity.

### Moment-curve Weyl sum

Identifier: ExponentialSumsAndCircleMethod:ES.1/moment-weyl-sum. Kind: definition.

For n,N≥0 natural, momentWeylSum(n,N)(α)=Σ_{1≤m≤N}∏_{j∈Fin n}fourier(m^(j+1))(αⱼ). It is weightedTorusSum on the positive natural interval with weights one and moment frequencies m,m²,…,mⁿ. The exponent j+1 excludes an accidental constant-frequency coordinate; zero is not included in the summation interval.

Hypotheses and conventions: The value is a complex function on the product of n copies of AddCircle(1). N=0 and n=0 are defined explicitly by native empty-sum/product conventions.

Proof or construction outline:

1. Specialize weightedTorusSum to the native interval [1,N], constant weights one and the integer moment map.
1. Re-use all continuity and integration properties of weightedTorusSum.
1. The real-lift comparison is exactly the exponential sum in BDG §1, p.633.

API:

- momentWeylSum_eq_weightedTorusSum (compatibility): The specialization of weightedTorusSum uses Φ(m)ⱼ=m^(j+1) and w(m)=1.
- momentWeylSum_zero_cutoff (simp): For N=0 the function is zero.
- momentWeylSum_zero_phase (simp): For α=0 its value is the natural N cast into ℂ.
- momentWeylSum_zero_dimension (simp): For n=0 its value is N at the unique torus point.
- momentWeylSum_real_lift (compatibility): For x∈ℝⁿ the value is Σ_{1≤m≤N}exp(2πi Σ_{j=1}ⁿxⱼmʲ).

Unit contracts:

- momentWeylSum_zero_cutoff_test: For every n, N=0 gives zero.
- momentWeylSum_zero_phase_test: For n=2,N=3 and α=(0,0), the value is 3.
- momentWeylSum_linear_test: For n=1,N=1 the function agrees with the existing frequency-one Fourier monomial.
- momentWeylSum_signed_value_test: For n=1,N=2 and α=1/2 the sum is zero; adding m=0 would incorrectly give one.

Uses: BDG §1 p.633 and §5 p.639 — Provides the exact phase sum in mean values, not a totalized infinite Fourier series.; ES.2 Vinogradov mean-value integral — The integral of its 2s-th norm power counts ordered solution pairs..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.1/weighted-torus-sum, mathlib:fourier, mathlib:fourier_coe_apply, mathlib:fourier_add, mathlib:fourier_neg, mathlib:fourier_eval_zero, mathlib:fourier_zero.

Acceptance: The zero-torus value is N. In dimension zero the function is constant N, not a new zero-dimensional oscillatory object.

Source match: BDG2016, §1 p.633; §5 p.639 — Matches the moment sum used for the mean-value integral and keeps all n coordinates..

### Vinogradov counting integral

Identifier: ExponentialSumsAndCircleMethod:ES.1/vinogradov-counting-integral. Kind: theorem.

For all natural n,s,N, vinogradovMeanValue(n,s,N)=∫_{(ℝ/ℤ)ⁿ}‖momentWeylSum(n,N)(α)‖^(2s)dα. The left side is cast into ℝ, and dα is the product of the native probability Haar measures. Ordered tuples, positive entries and all n moment equations match exactly.

Hypotheses and conventions: This finite identity also covers n=0,s=0 and N=0; the convention is 0⁰=1. No mean-value estimate is assumed.

Proof or construction outline:

1. Expand the s-th power of the finite sum and its complex conjugate over the ordered x and y configurations.
1. Apply torus-coefficient-extraction to the frequency vector of moment differences.
1. The surviving weights are one on the concrete solution subtype; take the real part and use zˢconjugate(z)ˢ=‖z‖^(2s).

Direct dependencies: ExponentialSumsAndCircleMethod:ES.1/torus-coefficient-extraction, ExponentialSumsAndCircleMethod:ES.1/moment-weyl-sum, ExponentialSumsAndCircleMethod:ES.2/vinogradov-mean-value, mathlib:fourier, mathlib:fourier_coe_apply, mathlib:fourier_add, mathlib:fourier_neg, mathlib:fourier_eval_zero, mathlib:fourier_zero, mathlib:Fintype.card, mathlib:MeasureTheory.Measure.pi, mathlib:MeasureTheory.integral_finsetSum.

Acceptance: For n=2,s=2,N=2 the integral is 6. Unnormalized period-T volume would introduce Tⁿ; the use of normalized Haar prevents that error.

Source match: BDG2016, §1 p.633, analytic representation — The equality is the exact analytic representation, with boundary cases justified by finite expansion..

### Reduced rational arc indices

Identifier: ExponentialSumsAndCircleMethod:ES.1/reduced-arc-indices. Kind: definition.

For a natural denominator cutoff Q, reducedArcIndices(Q) is the finite set of pairs (a,q) with 1≤q≤Q, 0≤a<q and gcd(a,q)=1. Use a filtered native finite product. The pair (0,1) is the unique zero centre, representing the source fraction 1/1 modulo one. The numerator q is excluded, and nonreduced presentations are not counted twice.

Hypotheses and conventions: Q is natural, possibly zero. Both components are natural; a=0 is permitted only at q=1 by coprimality.

Proof or construction outline:

1. Filter the product of the two ranges [0,Q] by positivity, a<q and coprimality.
1. Extract the exact membership formula from native finite-product/filter membership.
1. Reduced fractions in [0,1) give unique torus centres; the proof uses cross multiplication and coprimality, not merely injectivity of real-to-torus coercion.

API:

- mem_reducedArcIndices (characterisation): (a,q) is indexed iff 1≤q≤Q, a<q and Nat.Coprime a q.
- reducedArcIndices_zero (simp): The zero cutoff gives the empty finite set.
- reducedArcIndices_one (simp): The cutoff one gives {(0,1)}.
- reducedArcIndices_mono (relation): Q≤R implies the Q index set is a subset of the R index set.

Unit contracts:

- reducedArcIndices_zero_test: The cutoff zero has cardinality zero, not one.
- reducedArcIndices_one_test: The cutoff one is {(0,1)}, not {(1,1)}.
- reducedArcIndices_three_test: The cutoff three is {(0,1),(1,2),(1,3),(2,3)}.
- reducedArcIndices_nonreduced_test: At cutoff four (1,2) is present and (2,4) is absent, matching reduced rational representatives.

Uses: Assing §6.1 p.34; major-arc sum — Provides a finite once-only list of centres, with the wrapped zero arc included.; Pairwise arc separation — Coprimality is essential for excluding two presentations of one torus point..

Direct dependencies: mathlib:Finset.product, mathlib:Finset.filter.

Acceptance: Q=0 has no indices; Q=1 has just (0,1). The two equivalent centres 1/2 and 2/4 are never both indexed.

Source match: AssingCircle2022, §6.1 p.34, Farey fractions and arc definitions; page visually inspected — Replaces the representative-dependent shorthand by native torus balls; reduced 0/1 represents the source endpoint 1/1. The missing size restriction is recorded in E16..

### Rational major arc

Identifier: ExponentialSumsAndCircleMethod:ES.1/major-arc. Kind: definition.

For a pair (a,q) of natural numbers and a real radius η, majorArc((a,q),η) is the native closed metric ball of radius η about (a/q mod 1) in AddCircle(1). Only indices in reducedArcIndices(Q) are used by the circle-method family. Definition at q=0 is totalized native division, but no admissible index has q=0. Real lifts are all intervals [a/q+z−η,a/q+z+η], z∈ℤ.

Hypotheses and conventions: No new torus, circle metric or arc carrier is introduced. η<0 gives the empty set; η≥1/2 gives the whole torus. The analytical application uses 0≤η<1/2.

Proof or construction outline:

1. Specialize native Metric.closedBall to the rational centre.
1. Use AddCircle.norm_eq after dist_eq_norm to get nearest-integer distance.
1. Use the native real-preimage integer-translate identity to justify the zero arc wraparound.

API:

- mem_majorArc (characterisation): α belongs exactly when dist(α,a/q mod1)≤η.
- majorArc_lift (compatibility): A real lift x belongs iff there is z∈ℤ with |x−a/q−z|≤η.
- majorArc_negative (simp): If η<0 then the arc is empty.
- majorArc_centre_mem (simp): For η≥0 the rational centre belongs.
- majorArc_measurable (structure): The arc is closed, hence measurable for the torus Borel space.

Unit contracts:

- majorArc_wrap_test: The real lift 19/20 belongs to the zero arc of radius 1/10.
- majorArc_boundary_test: The real lift 1/4 belongs to the zero closed arc of radius 1/4.
- majorArc_negative_test: A radius −1 arc is empty, including at its centre.
- majorArc_native_ball_test: Every arc is exactly Metric.closedBall at the corresponding native rational torus point.

Uses: Assing §6.1 p.34 — The interval at 1/1 has two components in the chosen fundamental interval; the torus ball records both without a special-case definition..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.1/reduced-arc-indices, mathlib:Metric.closedBall, mathlib:AddCircle.norm_eq, mathlib:AddCircle.coe_real_preimage_closedBall_eq_iUnion, mathlib:dist_triangle, mathlib:Metric.isClosed_closedBall.

Acceptance: The arc about zero contains points immediately below one as well as immediately above zero. Closed boundary points belong to the arc; a negative radius gives no points.

Source match: AssingCircle2022, §6.1 p.34, Farey fractions and arc definitions; page visually inspected — Replaces the representative-dependent shorthand by native torus balls; reduced 0/1 represents the source endpoint 1/1. The missing size restriction is recorded in E16..

### Major arcs

Identifier: ExponentialSumsAndCircleMethod:ES.1/major-arcs. Kind: definition.

majorArcs(Q,η) is the finite union of majorArc((a,q),η) over reducedArcIndices(Q), as a native Set(AddCircle(1)). This definition alone neither asserts disjointness nor prescribes a relation between Q and η.

Hypotheses and conventions: Q is natural; η is real. In the Waring application Q=⌊P^δ⌋ and η=P^(−d+δ), with P large and 0<δ<d/3 to make 2ηQ²<1.

Proof or construction outline:

1. Use the native finite indexed union, with no extra arc-family structure.
1. Finite unions of the closed arc sets are closed, so their indicator functions and restricted integrals are legitimate.
1. Monotonicity follows separately in Q and in the radius; no false nesting is asserted when one parameter grows and the other shrinks.

API:

- mem_majorArcs (characterisation): Membership is existence of an admissible reduced pair whose arc contains α.
- majorArcs_zero (simp): majorArcs(0,η)=∅.
- majorArcs_one (simp): majorArcs(1,η)=majorArc((0,1),η).
- majorArcs_mono (relation): If Q≤R and η≤θ then majorArcs(Q,η)⊆majorArcs(R,θ).
- majorArcs_measurable (structure): The union is closed and hence measurable.

Unit contracts:

- majorArcs_zero_test: Q=0 and η=1 gives an empty major set, not the full torus.
- majorArcs_one_test: At Q=1,η=1/10 the lift 19/20 belongs.
- majorArcs_half_test: At Q=2,η=0 the point 1/2 is present.
- majorArcs_native_union_test: The union over Q=3 is exactly the four native closed balls at 0,1/2,1/3,2/3.

Uses: Circle-method counting partition — Provides the major domain before any local approximation is inserted..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.1/reduced-arc-indices, ExponentialSumsAndCircleMethod:ES.1/major-arc, mathlib:Metric.closedBall, mathlib:AddCircle.norm_eq, mathlib:AddCircle.coe_real_preimage_closedBall_eq_iUnion, mathlib:dist_triangle, mathlib:Metric.isClosed_closedBall.

Acceptance: The zero cutoff gives an empty major set even when η is nonnegative. At cutoff one the union is exactly the wrapped zero arc.

Source match: AssingCircle2022, §6.1 p.34, Farey fractions and arc definitions; page visually inspected — Replaces the representative-dependent shorthand by native torus balls; reduced 0/1 represents the source endpoint 1/1. The missing size restriction is recorded in E16..

Atlas planet: Major arcs.

### Minor arcs

Identifier: ExponentialSumsAndCircleMethod:ES.1/minor-arcs. Kind: definition.

minorArcs(Q,η) is the native set complement of majorArcs(Q,η) in AddCircle(1). In particular all major-arc boundary points are excluded from the minor set. No representative interval endpoint is omitted from the underlying torus.

Hypotheses and conventions: The complement is taken in the entire period-one torus. Parameters are the same Q and η as in the major set.

Proof or construction outline:

1. Use native Set complement.
1. The major/minor sets are disjoint and their union is the whole torus by native complement algebra.
1. Measurability follows from that of majorArcs; expanding Q or η shrinks the minor set.

API:

- mem_minorArcs (characterisation): α is minor iff no admissible pair has dist(α,a/q mod1)≤η.
- minorArcs_zero (simp): minorArcs(0,η)=Set.univ.
- minorArcs_measurable (structure): The minor set is measurable, indeed open.
- minorArcs_antitone (relation): If Q≤R and η≤θ then minorArcs(R,θ)⊆minorArcs(Q,η).

Unit contracts:

- minorArcs_zero_test: With Q=0, zero belongs to the minor set.
- minorArcs_centre_test: At Q=1,η=0 zero is not minor.
- minorArcs_interior_test: At Q=1,η=1/10 the point 1/2 is minor.
- minorArcs_boundary_test: At Q=1,η=1/4 the lift 1/4 belongs only to major arcs, matching the closed-ball convention.

Uses: Assing Lemma6.1 p.34 — Its rational-approximation denominator lower bound applies to this complement, rather than an informal subset of [0,1]..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.1/major-arcs.

Acceptance: Every torus point belongs to precisely one side of the partition. With Q=0 the minor set is the whole torus.

Source match: AssingCircle2022, §6.1 p.34, Farey fractions and arc definitions; page visually inspected — Replaces the representative-dependent shorthand by native torus balls; reduced 0/1 represents the source endpoint 1/1. The missing size restriction is recorded in E16..

Atlas planet: Minor arcs.

### Reduced rational centre separation

Identifier: ExponentialSumsAndCircleMethod:ES.1/reduced-centre-separation. Kind: theorem.

For distinct reduced pairs (a,q),(b,r) in reducedArcIndices(Q), their torus centres have distance at least 1/(qr), and hence at least 1/Q². In particular the two centres are unequal. All divisions are real, and the positive denominators follow from membership.

Hypotheses and conventions: The pairs are distinct as ordered pairs and each is reduced with numerator in [0,denominator). Q≥1 follows from nonempty membership.

Proof or construction outline:

1. Choose the integer translate attaining nearest-integer distance using AddCircle.norm_eq.
1. Multiply the translated difference a/q−b/r−z by qr to get the integer ar−bq−zqr.
1. This integer cannot vanish: the two reduced fractions in [0,1) would then be equal and uniqueness of reduced form would force equal pairs. Its absolute value is therefore at least one.
1. Divide by positive qr and use q,r≤Q.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.1/reduced-arc-indices, mathlib:AddCircle.norm_eq.

Acceptance: At Q=3 the centres 1/2 and 1/3 have distance 1/6, so a denominator-dependent positive gap is required. Wraparound centres near zero are treated by the integer z; ordinary real distance is not substituted.

Source match: AssingCircle2022, §6.1 p.34, Farey fractions and arc definitions; page visually inspected — Replaces the representative-dependent shorthand by native torus balls; reduced 0/1 represents the source endpoint 1/1. The missing size restriction is recorded in E16..

### Major-arc separation

Identifier: ExponentialSumsAndCircleMethod:ES.1/major-arcs-disjoint. Kind: theorem.

If Q≥1, η≥0 and 2ηQ²<1, then the closed major arcs indexed by reducedArcIndices(Q) are pairwise disjoint. This is a sufficient strict size condition, not a claim of disjointness for every δ>0 in the source parametrization.

Hypotheses and conventions: Arcs are closed. Strict inequality is used because two closed balls may meet at a boundary when twice the radius equals the distance of their centres.

Proof or construction outline:

1. If a point lies in two indexed arcs, native triangle inequality bounds the centre distance by 2η.
1. Reduced-centre separation gives centre distance≥1/Q², contradicting 2ηQ²<1.
1. For Q=⌊P^δ⌋ and η=P^(−d+δ), sufficient size is 2P^(3δ−d)<1; for any 0<δ<d/3 this holds eventually.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.1/major-arc, ExponentialSumsAndCircleMethod:ES.1/reduced-centre-separation, mathlib:dist_triangle.

Acceptance: For Q=2 and η=1/4 the point 1/4 lies in both the zero and half arcs; disjointness without a size condition is false. The sufficient condition is not presented as necessary; it uses the coarse Q² bound.

Source match: AssingCircle2022, §6.1 p.34, Farey fractions and arc definitions; page visually inspected — Replaces the representative-dependent shorthand by native torus balls; reduced 0/1 represents the source endpoint 1/1. The missing size restriction is recorded in E16..

### Major–minor arc counting partition

Identifier: ExponentialSumsAndCircleMethod:ES.1/major-minor-counting-partition. Kind: theorem.

For an integrable complex function F on the probability torus, Q≥1, η≥0 and 2ηQ²<1, its full integral equals the sum of its restricted integrals over all indexed majorArc((a,q),η), plus its restricted integral over minorArcs(Q,η). Without the size condition one may still split into the major union and its complement, but may not replace the union integral by a sum over overlapping arcs.

Hypotheses and conventions: Use AddCircle.haarAddCircle at period one. Integrable F is an explicit hypothesis; finite torus exponential polynomials satisfy it by continuity on the compact torus.

Proof or construction outline:

1. Use native integral_add_compl on the measurable major union.
1. Use major-arcs-disjoint and native integral_biUnion_finset to expand the major-union integral.
1. For finite counting insert the appropriate finite weighted phase polynomial from torus-coefficient-extraction; no asymptotic or singular-series estimate is used.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.1/major-arcs, ExponentialSumsAndCircleMethod:ES.1/minor-arcs, ExponentialSumsAndCircleMethod:ES.1/major-arcs-disjoint, ExponentialSumsAndCircleMethod:ES.1/torus-coefficient-extraction, mathlib:MeasureTheory.integral_add_compl, mathlib:MeasureTheory.integral_biUnion_finset.

Acceptance: The formula keeps the minor contribution, which may have either complex sign. No rational centre or wrapped portion of the zero arc is counted twice.

Source match: AssingCircle2022, §6.1 p.34, Farey fractions and arc definitions; page visually inspected — Replaces the representative-dependent shorthand by native torus balls; reduced 0/1 represents the source endpoint 1/1. The missing size restriction is recorded in E16..

### Monomial Weyl sum

Identifier: ExponentialSumsAndCircleMethod:ES.1/monomial-weyl-sum. Kind: definition.

powerWeylSum(d,N,α)=Σ_{x=1}^N fourier(x^d)(α) on native AddCircle1. This is the single-frequency monomial sum, not the n-dimensional momentWeylSum, whose phase contains every degree1..n. It is the specialization of weightedTorusSum to one coordinate and unit weights.

Hypotheses and conventions: d,N are natural; α is a torus point. The empty positive interval N=0 gives zero, even at d=0. Degree-zero nonempty phases are N times the frequency-one character.

Proof or construction outline:

1. Specialize the existing finite weighted character sum.
1. At phase zero every term is one.
1. Conjugation negates the phase. Native character continuity makes the finite sum continuous.

API:

- powerWeylSum_eq_sum (characterisation): The sum is over the positive native interval1..N with phase x^d.
- powerWeylSum_zero_cutoff (simp): N=0 gives zero.
- powerWeylSum_zero_phase (simp): At α=0 the value is N.
- powerWeylSum_zero_degree (simp): At d=0 it is N fourier(1)(α).
- powerWeylSum_conjugate (compatibility): Conjugation equals evaluation at−α.

Unit contracts:

- powerWeylSum_empty_test: For d=3,N=0,α=0 the sum is0, not1.
- powerWeylSum_linear_test: For d=1,N=2,α=1/2 the sum is0.
- powerWeylSum_zero_phase_test: For d=3,N=4,α=0 the sum is4.
- powerWeylSum_weighted_test: For d=2,N=3 it agrees exactly with weightedTorusSum in dimension1 and phase x².

Uses: Assing §6.1 and §9 — Finite positive counting, major-arc approximations and monomial mean/minor bounds use this single-frequency sum..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.1/weighted-torus-sum, mathlib:fourier, mathlib:fourier_neg, mathlib:fourier_eval_zero.

Acceptance: The zero-variable contribution is not inserted into this sum. A degree-three sum has only the cubic frequency, not three independent torus coordinates.

Source match: AssingCircle2022, §6.1 pp.34–39, statements and full proofs, with E15–16 and E23–24 corrected — Positive variables, symmetric frequency truncations and strict arc-size constraints are retained. The degree-two local proof boundary is not silently imported..

## ES.2 — Mean-value theorems

Coverage: partial. The Vinogradov count, curve, weight, native extension, integrability and exact critical decoupling/discrete/mean-value endpoints are specified. The complete analytic proof graph is not yet decomposed: external parabola base[9], BL finiteness[2], BL stability[1], Guth plate Kakeya[15], BDG§§6–10 adapters, off-critical restriction and Fourier-positive Schwartz counting transfer remain explicit frontier tasks. Low-degree n=1 has an elementary node; n=2 needs an actual base proof.

### Vinogradov mean value

Identifier: ExponentialSumsAndCircleMethod:ES.2/vinogradov-mean-value. Kind: definition.

Define vinogradovMeanValue(n,s,N) as the number of ordered pairs (x,y)∈{1,…,N}ˢ×{1,…,N}ˢ satisfying Σ_ixᵢʲ=Σ_iyᵢʲ for every j=1,…,n. Its carrier is the native finite subtype of pairs of Fin s→Fin N maps, with entries interpreted as val+1. In particular n=0 imposes no equations and s=0 has exactly the empty pair. No quotient by permutations is taken.

Hypotheses and conventions: n,s,N are natural. The main bound below requires n≥2 and s≥1, but the definition includes all boundary cases.

Proof or construction outline:

1. Use Fintype.card on the explicitly specified finite subtype.
1. Identify Fin N with the positive interval [1,N] by m↦val(m)+1.
1. Expose equality with the source count and its native finite-sum indicator expression; do not count unordered solutions.

API:

- vinogradovMeanValue_source_count (compatibility): For n≥2,s≥1,N≥2 this is exactly the published J_s,n(N).
- vinogradovMeanValue_zero_variables (simp): For s=0, the count is 1 for every n,N.
- vinogradovMeanValue_zero_degree (simp): For n=0 the count is N^(2s), with 0^0=1.
- vinogradovMeanValue_one_variable (simp): For n≥1 and s=1 the count is N.
- vinogradovMeanValue_one_cutoff (simp): For N=1 the count is 1 for every n,s.
- vinogradovMeanValue_zero_cutoff (simp): For N=0 and s>0 the count is zero.
- vinogradovMeanValue_mono_degree (relation): Increasing n can only decrease the count, for fixed s,N.

Unit contracts:

- vinogradovMeanValue_ordered_test: For n=2,s=2,N=2 the count is 6.
- vinogradovMeanValue_empty_pair_test: For s=0 and N=0 the count is 1, not zero.
- vinogradovMeanValue_linear_count_test: For n≥1,s=1 the count equals the cardinality of [1,N].
- vinogradovMeanValue_three_variables_test: For n=2,s=3,N=2 the count is 20, the central binomial coefficient, not an unordered partition count.

Uses: BDG Theorem1.1 — Names the precise counting target with both expected terms.; ES.1 torus identity and ES.4 minor arcs — Converts an exact finite solution count into a moment estimate for the moment-curve sum..

Direct dependencies: mathlib:Fintype.card.

Acceptance: The count at n=2,s=2,N=2 is 6, not 3. A constant moment map is not interchangeable with the positive moment map.

Source match: BDG2016, §1 p.633, opening definition — The two s-tuples and all equations are exactly the published solution count; boundary conventions are explicit extensions..

Atlas planet: Vinogradov mean value.

### Moment curve

Identifier: ExponentialSumsAndCircleMethod:ES.2/moment-curve. Kind: definition.

momentCurve(n,t) is (t,t²,…,tⁿ) in native EuclideanSpace ℝ (Fin n), constructed by WithLp.toLp 2. Coordinate j has exponent j+1. The analytical curve is its restriction to t∈[0,1]; the polynomial map itself is defined for all real t and includes n=0.

Hypotheses and conventions: n is natural; t is real. The ambient metric is Euclidean, not the native sup norm on an unwrapped Pi type.

Proof or construction outline:

1. Build the native Euclidean vector from the coordinate power functions.
1. Coordinates give continuity and smoothness. For n≥1 the first coordinate is t, so the map is injective.

API:

- momentCurve_apply (projection): The j-th coordinate is t^(j+1).
- momentCurve_zero (simp): The image of t=0 is the zero vector.
- momentCurve_continuous (structure): The polynomial map into native Euclidean space is continuous.
- momentCurve_first_injective (characterisation): For n≥1 it is injective because the first coordinate is t.

Unit contracts:

- momentCurve_quadratic_test: At n=2,t=2 the coordinates are (2,4).
- momentCurve_zero_dimension_test: At n=0,t=3 the vector is zero.
- momentCurve_linear_test: At n=1 its sole coordinate is the identity t, agreeing with the linear moment map.

Uses: BDG §§6–8 — Its derivative spans control transversality, plate geometry and lower-dimensional decoupling..

Direct dependencies: mathlib:EuclideanSpace, mathlib:PiLp.toLp_apply.

Acceptance: At degree two, t=2 gives (2,4), not (1,2). At degree zero there is just the zero vector in the zero-dimensional native space.

Source match: BDG2016, §1 pp.634–635 and §3 p.637 — The moment curve, extension operator and family of polynomial spatial weights are the published inputs. Euclidean norm and Lebesgue measure are explicit..

Atlas planet: Moment curve.

### Decoupling weight

Identifier: ExponentialSumsAndCircleMethod:ES.2/decoupling-weight. Kind: definition.

For a native Euclidean centre c, real radius R>0 and natural E, decouplingWeight(n,E,c,R)(x)=(1+‖x−c‖/R)^(−E). The spatial weighted measure is the native volume.withDensity(ENNReal.ofReal∘weight), and weighted norms are native eLpNorm. The endpoint uses E≥100n and keeps the same E on both sides.

Hypotheses and conventions: R>0 for geometric properties; E may be zero in the definition. Native inversion and division make the expression total, but R≤0 is not an analytical radius. No custom measure or Lp carrier is introduced.

Proof or construction outline:

1. Define the real positive reciprocal of the indicated natural power.
1. Positive radius and norm nonnegativity give 0<weight≤1; at the centre its value is one.
1. Translation of both centre and argument leaves their difference unchanged.
1. Only with E>n does the density have finite Lebesgue mass; boundedness alone is not integrability on the whole space.

API:

- decouplingWeight_centre (simp): The centre value is one.
- decouplingWeight_bounds (structure): For R>0 its value is strictly positive and at most one.
- decouplingWeight_continuous (structure): For R>0 the weight is continuous.
- decouplingWeight_translate (compatibility): Translate c and x by the same vector to leave the value unchanged.
- decouplingWeight_zero_exponent (simp): At E=0 the weight is the constant one function.

Unit contracts:

- decouplingWeight_value_test: In dimension one, c=0,R=1,E=2,x=1 gives1/4.
- decouplingWeight_scale_test: At c=0,R=2,E=2,x=2 the value is again1/4.
- decouplingWeight_zero_exponent_test: In positive dimension E=0 gives one, not a decaying density.

Uses: BDG §3 p.637 and Lemma8.2 — A single E≥100n is retained during dimensional induction; uniform constants may depend on E..

Direct dependencies: mathlib:EuclideanSpace, mathlib:MeasureTheory.eLpNorm, mathlib:MeasureTheory.MemLp, mathlib:MeasureTheory.Measure.withDensity.

Acceptance: The dimension-dependent exponent is not changed when passing to a lower-dimensional inequality. For E=0 the weight is constant one and has infinite total mass when n>0.

Source match: BDG2016, §1 pp.634–635 and §3 p.637 — The moment curve, extension operator and family of polynomial spatial weights are the published inputs. Euclidean norm and Lebesgue measure are explicit..

### Moment-curve extension operator

Identifier: ExponentialSumsAndCircleMethod:ES.2/moment-extension. Kind: definition.

For a real interval [a,b], complex amplitude g and x∈EuclideanSpace ℝ (Fin n), momentExtension(n,a,b,g)(x)=∫_[a,b]g(t)exp(2πiΣ_jx_jt^(j+1))dt, using native Lebesgue measure and Bochner integration. For analytical claims g is IntegrableOn [a,b]; in the decoupling theorem it is IntegrableOn [0,1]. The source’s interval operator is an adapter to native integration, not a new Fourier transform.

Hypotheses and conventions: a,b are real. If b<a the interval is empty. Integrability is exposed on continuity, norm bounds and additive APIs; the totalized native definition is not interpreted as a meaningful nonintegrable oscillatory integral.

Proof or construction outline:

1. Use native set integral against Lebesgue measure of a complex-valued amplitude times a unit-modulus phase.
1. The phase is continuous in x and t; the norm is bounded by |g(t)|, independent of x. Dominated convergence gives spatial continuity.
1. Finite adjacent parameter intervals partition [0,1] up to finitely many null endpoints, giving the source extension decomposition.

API:

- momentExtension_empty (simp): If b<a the function is zero.
- momentExtension_zero_amplitude (simp): Zero amplitude gives zero.
- momentExtension_add (relation): For amplitudes integrable on the interval, extension is additive.
- momentExtension_smul (relation): Complex scalar multiplication commutes with the native extension integral.
- momentExtension_zero_spatial (simp): At x=0 the value is ∫_[a,b]g.
- momentExtension_norm_bound (structure): For integrable g, every spatial value has norm at most ∫_[a,b]|g|.
- momentExtension_continuous (structure): For integrable g the spatial function is continuous.
- momentExtension_partition (compatibility): For M≥1, extension on[0,1] is the sum of its M adjacent equal-interval extensions; their endpoints have zero measure.

Unit contracts:

- momentExtension_constant_test: For amplitude one on[0,1] and x=0 the value is1.
- momentExtension_empty_test: The interval[1,0] gives zero.
- momentExtension_negative_test: For amplitude−1 on[0,1] and x=0 the result is−1, not the integral of its norm.
- momentExtension_zero_dimension_test: In dimension zero the operator agrees with the native integral of g.

Uses: BDG Theorem1.2 and §7 rescaling — Keeps amplitude integrability and interval endpoints explicit for partitioning and changes of variables..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.2/moment-curve, mathlib:MeasureTheory.integral, mathlib:MeasureTheory.IntegrableOn, mathlib:Complex.norm_exp_ofReal_mul_I, mathlib:MeasureTheory.norm_integral_le_integral_norm.

Acceptance: At x=0 the result is exactly the amplitude integral. The frequency starts with t, not a constant coordinate.

Source match: BDG2016, §1 pp.634–635 and §3 p.637 — The moment curve, extension operator and family of polynomial spatial weights are the published inputs. Euclidean norm and Lebesgue measure are explicit..

Atlas planet: Moment-curve extension operator.

### Weighted extension integrability

Identifier: ExponentialSumsAndCircleMethod:ES.2/weighted-extension-finite. Kind: lemma.

If R>0, E>n, 1≤p<∞ and g is integrable on[a,b], then momentExtension(n,a,b,g) belongs to native MemLp at exponent p for the measure volume.withDensity(weight). Thus its eLpNorm is finite; no invalid conversion of +∞ to real zero is used.

Hypotheses and conventions: E is natural, p is real, c is any Euclidean centre. There is no finite-volume-ball restriction on the integral; the weight is integrated on the whole space.

Proof or construction outline:

1. Continuity of the extension gives strong measurability.
1. Its uniform L1 amplitude bound reduces the Lp integral to the total mass of the weight.
1. Split space into a radius-R ball and dyadic shells: shell j has volume bounded by a dimension constant times R^n 2^(jn), and weight bounded by a constant times2^(−jE). Sum the geometric series since E>n. Native norm-power integration and withDensity then give MemLp.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.2/moment-extension, ExponentialSumsAndCircleMethod:ES.2/decoupling-weight, mathlib:MeasureTheory.MemLp, mathlib:MeasureTheory.eLpNorm, mathlib:MeasureTheory.Measure.withDensity.

Acceptance: Constant amplitude produces a bounded extension; finite weighted mass is still a required step. This result does not apply to E=0 in positive dimension.

Source match: BDG2016, §1 p.634, weight-exponent discussion — Makes the source’s integrability requirement explicit; the dyadic-shell argument is an elementary proof obligation, not an implemented theorem..

### Critical moment-curve decoupling theorem

Identifier: ExponentialSumsAndCircleMethod:ES.2/critical-decoupling. Kind: theorem.

For n≥2, natural E≥100n and ε>0 there is C(n,E,ε)>0 such that for every integer M≥1, every centre c and every amplitude g integrable on[0,1], with R=M^n, ‖E_[0,1]g‖_L^{n(n+1)}(w_{c,R,E})≤CM^ε(Σ_{j=0}^{M−1}‖E_[j/M,(j+1)/M]g‖_L^{n(n+1)}(w_{c,R,E})²)^{1/2}. The norms integrate over the entire Euclidean space with weighted Lebesgue measure. C is independent of M,c,g.

Hypotheses and conventions: The same E is retained in all weighted norms. Intervals are exactly the reciprocal-integer partition specified after source Theorem1.2. There is no source claim here of arbitrary noninteger partition data or automatic interpolation of every p.

Proof or construction outline:

1. Use the n=2 parabola decoupling base from source[9], not an unsupported assertion that this paper proves that base.
1. For n≥3 combine source§6 transversality/Brascamp–Lieb/plate Kakeya and ball inflation, §7 parabolic rescaling and linear–multilinear comparison, and §8 L2/lower-dimensional decoupling and the weighted iteration.
1. The finite recurrence in appendix§10 forces the decisive growth factor greater than one; §9 bootstraps the decoupling exponent to zero and passes to the critical endpoint.
1. The exact input declarations and geometric APIs for those analytic steps remain an explicit partial-stage frontier, including external proof gaps. Merely reading the whole BDG paper does not close those inputs.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.2/moment-curve, ExponentialSumsAndCircleMethod:ES.2/decoupling-weight, ExponentialSumsAndCircleMethod:ES.2/moment-extension, ExponentialSumsAndCircleMethod:ES.2/weighted-extension-finite.

Acceptance: The critical exponent is n(n+1), not its half. No theorem-bearing hypothesis record assumes the inequality; the suggested file states it as an unchecked conclusion.

Source match: BDG2016, Theorem1.2 p.635; weight extension p.637; §§6–10 — Matches the full critical statement, uniformity and actual proof route; the external base and Kakeya/BL inputs are not falsely attributed as proved in this paper..

Atlas planet: Moment-curve decoupling theorem.

### Critical discrete restriction estimate

Identifier: ExponentialSumsAndCircleMethod:ES.2/discrete-restriction. Kind: theorem.

For n≥2,E≥100n,ε>0 there is C(n,E,ε)>0 so that for N≥1, points (i−1)/N<t_i≤i/N, arbitrary complex coefficients a_i and any ball B of radius N^n, the normalized weighted L^{n(n+1)} norm of Σ_i a_i exp(2πiΣ_jx_jt_i^j) is at most CN^ε(Σ_i|a_i|²)^{1/2}. Normalized means dividing the weighted p-th-power integral by the ordinary Lebesgue volume of B, not by the weight’s total mass.

Hypotheses and conventions: The ordered points lie in their separate bins but no additional uniform separation distance is assumed. Bin boundaries use the source half-open convention. The full source Theorem4.1 also covers R≳N^n and all finite p≥2; those additional target contracts remain to be split and proved.

Proof or construction outline:

1. Choose shrinking one-sided amplitude approximations supported inside each point’s assigned bin, including points at the right endpoint, with prescribed complex mass a_i.
1. Apply critical decoupling to their sum. Each interval extension is bounded by |a_i| and tends pointwise to the desired phase term.
1. Weighted dominated convergence is justified by integrability of w and the finite boundΣ|a_i|; the right-side weight mass divided by|B| is a constant depending only on n,E.
1. Let the approximation width tend to zero. The statement is the critical-radius specialization, not a claim that an arbitrary finite torus sum is bounded by this estimate.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.2/critical-decoupling, ExponentialSumsAndCircleMethod:ES.2/weighted-extension-finite, ExponentialSumsAndCircleMethod:ES.2/moment-extension.

Acceptance: At critical exponent the second N-power term of source Theorem4.1 is another N^ε and is absorbed in C. Normalization uses ordinary ball volume; a zero-radius ball is excluded by N≥1.

Source match: BDG2016, Theorem4.1 and proof pp.637–638 — Specializes to critical exponent and R=N^n, keeping complex coefficients and normalized weighted measure. One-sided approximants repair endpoint support details without changing the stated bound..

Atlas planet: Discrete restriction estimate.

### Vinogradov mean-value theorem

Identifier: ExponentialSumsAndCircleMethod:ES.2/vinogradov-main-bound. Kind: theorem.

For n≥2,s≥1 and ε>0 there exists C(n,s,ε)>0 such that for every integer N≥2, J_{s,n}(N)≤C(N^{s+ε}+N^{2s−n(n+1)/2+ε}). Here J is the concrete ordered positive-integer tuple count. Both expected terms are retained, and the real exponent in the second term is not truncated by natural subtraction.

Hypotheses and conventions: The constant is uniform in N. This is an upper bound with ε loss, not an asymptotic or a local-solubility conclusion. Degree one is separate. Source n=2 arithmetic proof is only mentioned, so its use requires either a new divisor proof contract or the explicitly external n=2 decoupling base.

Proof or construction outline:

1. Use the discrete restriction estimate and the source Corollary4.2 Fourier-positive Schwartz majorant to bound near solutions at anisotropic tolerances N^{j−n}. Exact integer solutions form a subset; no false equivalence is used at tolerance1.
1. The Fourier expansion gives nonnegative terms and a uniform contribution from every counted solution, while the discrete estimate gives the two exponents.
1. For n≥3 the selected route includes the cubic case via decoupling induction from the parabola base; the paper title is not used as evidence excluding or establishing n=3.
1. For n=2 the stated endpoint is pending its actual base proof; for n=1 use the independent elementary node below. The Schwartz construction, anisotropic scaling and off-critical discrete norm contracts are still explicit proof-graph frontier tasks.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.2/vinogradov-mean-value, ExponentialSumsAndCircleMethod:ES.1/vinogradov-counting-integral, ExponentialSumsAndCircleMethod:ES.2/discrete-restriction.

Acceptance: For s=1 the exact count is N, making the N^s term indispensable. An exponent such as2s−n(n+1)/2 may be negative and is represented with real rpow.

Source match: BDG2016, Theorem1.1 p.633; Corollary4.2 pp.638–639 — Matches source quantifiers, both exponents and the near-solution proof route; not a formalization claim..

Atlas planet: Vinogradov mean-value theorem.

### Linear Vinogradov mean-value bound

Identifier: ExponentialSumsAndCircleMethod:ES.2/linear-mean-bound. Kind: theorem.

For s≥1 and all N≥0, J_{s,1}(N)≤N^{2s−1}. In degree one the only condition is equality of tuple sums, and specifying all but the final y coordinate determines that remaining coordinate uniquely. This elementary bound has constant one and no ε loss.

Hypotheses and conventions: The tuples are ordered and entries are1..N. The exponent2s−1 is positive when s≥1; N=0 gives zero.

Proof or construction outline:

1. Project a solution to its s x-coordinates and first s−1 y-coordinates.
1. If two solutions have the same projection, the remaining y coordinate is equal by the one linear equation; hence the projection is injective.
1. Apply native finite cardinality to the2s−1 free coordinates. This uses no decoupling result.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.2/vinogradov-mean-value.

Acceptance: At s=1 the bound is equality N. At s=2,N=3 the count is19≤27, not an unordered count.

Source match: BDG2016, §1 p.633, source system specialized to n=1 — The source declares n≥2; this degree-one extension is an elementary argument supplied here, not a claim that the source proves it..

### Hua mean-value inequality

Identifier: ExponentialSumsAndCircleMethod:ES.2/hua-mean-value. Kind: theorem.

For each d≥2,1≤v≤d and ε>0 there is C(d,v,ε)>0 such that for every N≥1, the normalized-Haar integral on AddCircle(1) of |Σ_{m=1}^Nfourier(m^d)(α)|^{2^v} is at most CN^{2^v−v+ε}. It is a one-frequency monomial sum, not the n-dimensional full moment-curve sum and not the sharp Vinogradov critical theorem.

Hypotheses and conventions: Positive entries1..N are used; d is the monomial degree and v the differencing level. The native probability Haar at period one is explicit. The allowed upper endpoint is v=d, not every v.

Proof or construction outline:

1. For v=1, native Fourier orthogonality and strict injectivity of m↦m^d on positive integers give the exact second moment N.
1. For the induction step use the non-absolute real-part differencing inequality for the monomial phase, multiply by its2^v-th absolute power and integrate; exact orthogonality converts it to a shifted-power counting problem.
1. With positive shifts the v-fold difference of x^d is strictly positive and strictly increasing in positive x when v<d, and divisible by every shift. Thus the fixed power-difference right side is nonzero, each shift is a divisor, and x is determined uniquely.
1. Import the exact AN.5 divisor subpower supplier with smaller ε to bound the positive-shift choices, giving the source recurrence. The signed differencing, monomial monotonicity/divisibility and counting calculation remain in this target-level proof sketch rather than becoming routine lemma nodes. The target remains unchecked.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.1/torus-coefficient-extraction, mathlib:AddCircle.haarAddCircle, mathlib:fourierCoeff_fourier, AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound, mathlib:fwdDiff, mathlib:Polynomial.fwdDiff_iter_degree_eq_factorial, mathlib:Nat.divisors, mathlib:Complex.norm_exp_ofReal_mul_I, mathlib:Finset.sum_mul_sum.

Acceptance: At d=2,v=2,N=2 the fourth moment is6. Zero-inclusive sums would change the exact base count; the definition does not include m=0.

Source match: AssingCircle2022, Lemma5.1 and proof pp.28–31; Lemma5.2 and proof pp.31–32 — The selected classical differencing and divisor proofs were read in full. Native forward differences and the exact AN.5 divisor supplier replace informal algebraic/analytic black boxes..

## ES.3 — Major arcs and local factors

Coverage: partial. Classical positive-power singular integral/series, complete residue coefficients, simple absolute convergence, Euler factorization, normalized prime-power density limits, primitive lifting positivity and uniform d≥3 classical Waring positivity are specified. Finish the generic weighted-form densities, routed Ghosh–Sarnak and quadratic-form Heath–Brown contracts, and native sine-kernel/beta-convolution/quantitative-tail interfaces. The quadratic two-adic exception E18 and the degree-two source-proof boundary E26 remain explicit.

### Waring singular-series coefficient

Identifier: ExponentialSumsAndCircleMethod:ES.3/waring-series-coefficient. Kind: definition.

For degree d, number of variables s and integer target m≥0, A_{d,s,m}(q)=Σ_{a mod q,gcd(a,q)=1}(q^{-1}completePowerSum(d,q,a))^s exp(−2πiam/q). Use native finite residues and the negative target-frequency sign. Define A(0)=0 by the empty sum; at q=1 its sole reduced residue is0 and A(1)=1.

Hypotheses and conventions: All four parameters are natural. At q>0 this agrees with the source reduced representatives1≤a≤q. The coefficient may be negative; it is not defined by absolute values.

Proof or construction outline:

1. Use a native finite sum with decidable coprimality and the source q^{-s} normalization.
1. Pair a with−a modulo q and conjugate the phase to show the coefficient is real.
1. The target phase is periodic in m modulo q.

API:

- waringSeriesCoeff_zero (simp): A(0)=0.
- waringSeriesCoeff_one (simp): A(1)=1.
- waringSeriesCoeff_conjugate (structure): Complex conjugation fixes A(q).
- waringSeriesCoeff_periodic_target (compatibility): A_{m+q}(q)=A_m(q).

Unit contracts:

- waringSeriesCoeff_zero_test: d=3,s=7,m=1,q=0 gives0.
- waringSeriesCoeff_one_test: d=3,s=7,m=1,q=1 gives1.
- waringSeriesCoeff_normalization_test: d=2,s=2,m=1,q=3 gives1/3.
- waringSeriesCoeff_negative_test: d=2,s=2,m=0,q=3 gives−2/3, not2/3.

Uses: Assing §6.2 Lemmas6.6–6.9 — CRT multiplicativity, global Euler factorization and local finite-density identities all use this exact coefficient..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/complete-power-sum, mathlib:fourier_neg, mathlib:fourier_add.

Acceptance: A(1)=1 is the initial Euler-product term. Negative coefficients are needed for exact local densities.

Source match: AssingCircle2022, §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked — The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion..

### Singular-series coefficient multiplicativity

Identifier: ExponentialSumsAndCircleMethod:ES.3/waring-series-multiplicative. Kind: theorem.

For positive coprime u,v, A_{d,s,m}(uv)=A_{d,s,m}(u)A_{d,s,m}(v), for every natural d,s,m. This is exact coefficient multiplicativity, independent of absolute convergence of the infinite series.

Hypotheses and conventions: Both moduli are positive and coprime. The correspondence between unit target frequencies uses a/(uv)≡a₁/u+a₂/v modulo one.

Proof or construction outline:

1. Use the native CRT equivalence to reindex both complete residues and reduced frequency residues.
1. Rescale the residue coordinates by the units u and v to separate the monomial phases.
1. Separate the target phase under the same frequency correspondence and distribute finite products/sums.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.0/complete-power-sum, ExponentialSumsAndCircleMethod:ES.3/waring-series-coefficient, mathlib:ZMod.prodEquivPi, mathlib:Finset.sum_mul_sum.

Acceptance: The case u=1 leaves the coefficient unchanged. Without coprimality the CRT product identity is not asserted.

Source match: AssingCircle2022, §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked — The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion..

### Waring singular series

Identifier: ExponentialSumsAndCircleMethod:ES.3/waring-singular-series. Kind: definition.

waringSingularSeries(d,s,m)=Σ_{q≥1}A_{d,s,m}(q), implemented with native tsum over all naturals and A(0)=0. A summability proof is required before treating this native totalized value as an analytic singular series: nonsummable input gives native zero and is not evidence for a vanishing arithmetic density.

Hypotheses and conventions: The convergence theorem below uses d≥3,s≥2d+1. Other ranges require their own proven hypotheses; the definition alone has no positivity or convergence content.

Proof or construction outline:

1. Use the existing generated native tsum, not a custom summation or limit carrier.
1. Under Summable, native HasSum gives the meaningful sum and its finite-partial-sum limit.
1. Conjugation of the real coefficients gives a real value.

API:

- waringSingularSeries_eq_tsum (characterisation): The value is the native tsum of the coefficient family with A0=0.
- waringSingularSeries_hasSum (compatibility): Summable coefficients have this value as their native HasSum limit.
- waringSingularSeries_real (structure): Under summability its imaginary part is zero.

Unit contracts:

- waringSingularSeries_linear_test: For d=1,s=2 and any m the series is1, since every coefficient q>1 vanishes.
- waringSingularSeries_native_limit_test: A Summable degree3,s7 coefficient family has native HasSum equal to this defined series, not to an arbitrary supplied constant.
- waringSingularSeries_real_test: For every Summable real-coefficient family, the series has imaginary part zero.

Uses: Waring asymptotic and local positivity — Provides the normalized arithmetic factor; convergence is supplied separately..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.3/waring-series-coefficient, mathlib:tprod, mathlib:Multipliable.

Acceptance: The modulus-zero term has no contribution. The series is not replaced by a sum of norms.

Source match: AssingCircle2022, §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked — The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion..

Atlas planet: Singular series.

### Waring singular-series absolute convergence

Identifier: ExponentialSumsAndCircleMethod:ES.3/waring-series-absolute-convergence. Kind: theorem.

For d≥3 and s≥2d+1, the family q↦|A_{d,s,m}(q)| is summable for every m, with a bound uniform in m. In particular the complex singular series exists as an actual sum.

Hypotheses and conventions: This is the simple source Theorem6.18 range; it is not falsely substituted for the sharper §9 range that depends on fixed target m and more delicate prime-power estimates.

Proof or construction outline:

1. The complete monomial bound gives|A(q)|≤C_{d,s}q^{1−s/d} for q≥1 by at most q reduced residues.
1. Since1−s/d≤−1−1/d, compare with the convergent real p-series, keeping the q=1 term and excluding the empty q=0 term.
1. Native summability of norms implies complex summability and identifies the tsum with the usual series.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.3/waring-series-coefficient, ExponentialSumsAndCircleMethod:ES.0/complete-power-bound, mathlib:Multipliable, mathlib:tprod.

Acceptance: The constant does not depend on the integer target. The claim does not extend to arbitrary s merely because every individual coefficient is finite.

Source match: AssingCircle2022, §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked — The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion..

### Waring singular integral

Identifier: ExponentialSumsAndCircleMethod:ES.3/waring-singular-integral. Kind: definition.

I_{d,s}=∫_{β∈ℝ}(∫_{0≤t≤1}exp(2πiβt^d)dt)^s exp(−2πiβ)dβ, using native Lebesgue measure and Bochner integration. For d≥1 and s>d the integrand is absolutely integrable. This is the real local factor at normalized target1 for positive power variables, not a p-adic density or the volume of an unweighted arbitrary real solution set.

Hypotheses and conventions: The definition is native and totalized, but the valid analytic domain is d≥1,s>d. Parameter and frequency endpoints use full Lebesgue integration; there is no unproved cutoff removal.

Proof or construction outline:

1. Define the bounded inner finite-interval integral using native integration.
1. After u=t^d and integration by parts/Dirichlet convergence, the inner integral has bound C_d(1+|β|)^{−1/d}.
1. Its s-th power is integrable on the full line when s>d, so the source symmetric-frequency truncations tend to this value.

API:

- waringSingularIntegral_eq_integral (characterisation): The value is the specified native two-step integral with phase normalization2π.
- waringSingularIntegral_integrable (structure): For d≥1,s>d the full-line integrand is integrable.
- waringSingularIntegral_positive (relation): On the valid domain its real part is positive, by the Gamma evaluation theorem.

Unit contracts:

- waringSingularIntegral_linear_test: d=1,s=2 gives1.
- waringSingularIntegral_three_test: d=1,s=3 gives1/2.
- waringSingularIntegral_quadratic_test: d=2,s=3 givesπ/4, matching the Gamma ratio with the native2π convention.

Uses: Assing Theorem6.5 proof pp.38–39 — Real rescaling and Fourier inversion supply the archimedean main-term factor..

Direct dependencies: mathlib:MeasureTheory.integral, mathlib:MeasureTheory.IntegrableOn.

Acceptance: The target-frequency sign is negative. The source full-frequency cutoff is symmetric; a one-sided unbounded truncation is not substituted.

Source match: AssingCircle2022, §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked — The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion..

Atlas planet: Singular integral.

### Waring singular integral evaluation

Identifier: ExponentialSumsAndCircleMethod:ES.3/waring-singular-integral-evaluation. Kind: theorem.

For d≥1 and s>d, I_{d,s}=Γ(1+1/d)^s/Γ(s/d), cast into ℂ. Its imaginary part is zero and its real part is strictly positive.

Hypotheses and conventions: The arguments of native Real.Gamma are strictly positive; its totalization at poles is not used. The positivity conclusion is archimedean only.

Proof or construction outline:

1. Substitute u_i=t_i^d in the s parameter integrals and use finite-frequency Fubini for symmetric truncations.
1. The frequency integral is the sine kernel inΣu_i−1. The convolution density at1 is evaluated by the native beta/Gamma identities on the simplex.
1. Use the source bounded-variation/Fourier inversion argument for the density to identify the symmetric limit, already equal to the full integral by absolute integrability.
1. Apply the native Gamma recurrence and positivity at positive arguments. The general sine-kernel inversion/beta convolution interfaces are an explicit source-to-library frontier, not an assumed result field.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.3/waring-singular-integral, mathlib:Real.Gamma, mathlib:Real.Gamma_pos_of_pos.

Acceptance: At d=2,s=3 the ratio isπ/4. This does not show positivity of any p-adic factor or of the whole singular series.

Source match: AssingCircle2022, §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked — The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion..

### Waring congruence solution count

Identifier: ExponentialSumsAndCircleMethod:ES.3/waring-congruence-count. Kind: definition.

For a positive natural modulus q, waringCongruenceCount(d,s,m,q) is the native cardinality of the subtype of x∈(ZMod q)^s with Σ_ix_i^d=m modq. Residues are unrestricted, including zero; tuples are ordered. Use native ZMod and its existing finite instance under NeZero q.

Hypotheses and conventions: q>0 via NeZero; q=0 cannot be given a finite residue count because native ZMod0 is infinite. s=0 is permitted and leaves only the empty tuple.

Proof or construction outline:

1. Count the concrete finite subtype with native Fintype.card.
1. At modulus1 the ring has one element, so every tuple is the unique tuple.
1. For d=1,s=1 there is exactly the prescribed residue; target-periodicity follows from native casts.

API:

- waringCongruenceCount_one (simp): At modulus1 the count is1 for all d,s,m.
- waringCongruenceCount_empty_tuple (simp): For s=0 it is1 if m=0modq and0 otherwise.
- waringCongruenceCount_linear_one (characterisation): For d=1,s=1 the count is1 for every positive q and target.
- waringCongruenceCount_periodic_target (compatibility): Replacing m by m+q does not change the count.

Unit contracts:

- waringCongruenceCount_one_test: d=3,s=7 and q=1 gives1 for every m.
- waringCongruenceCount_three_test: For d=2,s=2,m=1,q=3 the count is4.
- waringCongruenceCount_empty_test: For q=2,s=0 the targets0and1 have counts1and0.
- waringCongruenceCount_native_linear_test: For d=1,s=1 it agrees with the cardinality of the singleton prescribed residue.

Uses: Assing Lemma6.9 and positivity lifting — Orthogonality relates the local partial series to q^{1−s} times this count..

Direct dependencies: mathlib:ZMod.fintype, mathlib:Fintype.card, mathlib:ZMod.natCast_self.

Acceptance: Finite congruence counts do not impose positive representative restrictions from the bounded global Waring count. The singular-density normalization is by q^{s−1}, not by the total number q^s of all tuples.

Source match: AssingCircle2022, §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked — The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion..

### Waring local factor

Identifier: ExponentialSumsAndCircleMethod:ES.3/waring-local-factor. Kind: definition.

For a prime p, χ_{d,s,m}(p)=Σ_{e≥0}A_{d,s,m}(p^e), using native tsum. The e=0 term isA(1)=1. Only once local summability and the normalized-count limit are proved is this interpreted as a p-adic solution density. The native totalized value for a divergent family is not a chosen density.

Hypotheses and conventions: The expression is defined for natural p, but analytical uses require p prime. The simple global convergence range d≥3,s≥2d+1 supplies local convergence. Degree-one special tests are elementary independent cases.

Proof or construction outline:

1. Use the existing tsum of the prime-power coefficients.
1. Under local Summable, HasSum and coefficient reality give the meaningful real local factor.
1. The finite orthogonality identity identifies the partial sum through e with M(p^e)/p^{e(s−1)}; taking its proved limit gives the local density theorem.

API:

- waringLocalFactor_eq_tsum (characterisation): The value is the native prime-power coefficient series including e=0.
- waringLocalFactor_hasSum (compatibility): Under local Summable this value is the native HasSum limit.
- waringLocalFactor_real (structure): Under local Summable its imaginary part is zero.

Unit contracts:

- waringLocalFactor_linear_test: At d=1,s=2,m=1,p=3 the value is1.
- waringLocalFactor_native_limit_test: Any locally Summable prime-power coefficient family has its native HasSum equal to this factor.
- waringLocalFactor_real_test: A locally Summable factor has no nonzero imaginary part.
- waringLocalFactor_three_normalization_test: For d=2,s=2,m=1,p=3 the factor is4/3: there are4 solutions modulo3, all primitive, and4·3^{e−1} modulo3^e. This separates the correct q^{s−1} normalization from q^s and detects omission of the e=0 term.

Uses: Euler factorization and all-place positivity — One factor at each prime is identified with its normalized congruence-density limit..

Direct dependencies: ExponentialSumsAndCircleMethod:ES.3/waring-series-coefficient, ExponentialSumsAndCircleMethod:ES.3/waring-congruence-count, mathlib:tprod, mathlib:Multipliable, mathlib:Filter.Tendsto.

Acceptance: The e=0 term is not lost. A p-adic density is a normalized convergent limit, not an unnormalized finite count.

Source match: AssingCircle2022, §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked — The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion..

Atlas planet: Local singular-series factor.

### Waring p-adic density limit

Identifier: ExponentialSumsAndCircleMethod:ES.3/waring-local-density-limit. Kind: theorem.

For d≥3,s≥2d+1 and every prime p, M(p^e)/p^{e(s−1)} tends to Reχ_{d,s,m}(p) as e→∞. In fact for every e the normalized count equalsΣ_{v=0}^eA(p^v), a real number; therefore the limit exists and is nonnegative.

Hypotheses and conventions: All residues are counted in native ZMod(p^e). The exponent e(s−1) is interpreted as a signed integer before any totalized boundary convention, though the theorem’s range has s≥1. Prime p>0 makes its denominator nonzero.

Proof or construction outline:

1. Apply finite additive orthogonality to the congruence indicator and expand over the s residue coordinates.
1. Classify a frequency modulo p^e by its exact reduced denominator p^v, and use the repeated-period identity for the complete monomial sum.
1. This gives M(p^e)=p^{e(s−1)}Σ_{v≤e}A(p^v), exactly source Lemma6.9.
1. Global absolute convergence bounds every prime-power subseries, so its partial sums converge to the local factor. Nonnegative normalized finite counts force the real limit to be nonnegative.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.3/waring-congruence-count, ExponentialSumsAndCircleMethod:ES.3/waring-local-factor, ExponentialSumsAndCircleMethod:ES.3/waring-series-absolute-convergence, mathlib:fourierCoeff_fourier, mathlib:Filter.Tendsto.

Acceptance: The normalization is p^{e(s−1)}, not p^{es}. Nonnegativity alone does not imply strict positivity.

Source match: AssingCircle2022, §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked — The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion..

Atlas planet: p-adic solution density.

### Waring singular-series Euler product

Identifier: ExponentialSumsAndCircleMethod:ES.3/waring-series-euler-product. Kind: theorem.

For d≥3,s≥2d+1 and any target m, the singular series equals the native infinite product of χ_{d,s,m}(p) over the subtype of prime naturals. The series and product are absolutely convergent; each factor is real and nonnegative.

Hypotheses and conventions: Infinite rearrangement is justified by absolute convergence, not by formal multiplicativity alone. A factor may vanish in a locally insoluble case.

Proof or construction outline:

1. Combine exact coefficient multiplicativity with the fundamental theorem of arithmetic for finite products over primes.
1. Expand each finite prime-power product and identify the corresponding coefficient sum.
1. Use absolute convergence to pass through growing finite sets of primes and prime-power truncations; native tprod records the resulting product.
1. Use the local normalized-count limit for reality and nonnegativity.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.3/waring-singular-series, ExponentialSumsAndCircleMethod:ES.3/waring-local-factor, ExponentialSumsAndCircleMethod:ES.3/waring-series-multiplicative, ExponentialSumsAndCircleMethod:ES.3/waring-series-absolute-convergence, mathlib:tprod.

Acceptance: A vanishing local factor gives a zero product, not a Hasse principle. Strict positivity requires an additional nonsingular local-solubility argument at every prime.

Source match: AssingCircle2022, §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46 visually checked — The selected classical local-factor proof is read, with the quadratic two-adic exception E18 excluded from any blanket recursion..

Atlas planet: Singular-series Euler product.

### Monomial major-arc approximation

Identifier: ExponentialSumsAndCircleMethod:ES.3/waring-major-arc-approximation. Kind: theorem.

For d≥1 there is C_d>0 such that for P≥1,q≥1, any integer a and real β, the difference between powerWeylSum(d,P,a/q+β) and q^{-1}completePowerSum(d,q,a) times∫_0^P exp(2πiβt^d)dt has norm at most C_dq(1+|β|P^d). Thus on q≤P^δ,|β|≤P^{−d+δ} it is O_d(P^{2δ}) when δ≥0.

Hypotheses and conventions: No coprimality is needed for this exact residue decomposition estimate. Its sharp §9 stationary-phase refinement is a separate theorem and is not asserted here.

Proof or construction outline:

1. Split the positive interval into residue classes modulo q, keeping the end pieces.
1. On each class approximate the amplitude exp(2πiβ(qy+z)^d) by its integral. The error is bounded by endpoint norms plus integrated absolute derivative, not the defective printed quadrature bound in the notes.
1. The derivative integral is O_d(|β|P^d); summing q residues yields the stated error.
1. Collect the complete residue phase and rescale the integral variable.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.1/monomial-weyl-sum, ExponentialSumsAndCircleMethod:ES.0/complete-power-sum, mathlib:MeasureTheory.integral, mathlib:MeasureTheory.IntegrableOn, mathlib:Complex.norm_exp_ofReal_mul_I.

Acceptance: At β=0 the discrepancy is bounded by a constant times q. No composite-modulus complete-sum cancellation follows from this approximation.

Source match: AssingCircle2022, Lemma6.3 and proof pp.35–36 — Tracks the underlying q(1+|β|P^d) estimate, using a valid bounded-variation/quadrature argument. The precise native sum-integral interface is a recorded analytic frontier..

### Primitive Waring local positivity

Identifier: ExponentialSumsAndCircleMethod:ES.3/waring-primitive-local-positivity. Kind: theorem.

Let d≥3,s≥2d+1,p prime,d=p^τu with p∤u, and γ=τ+1 for odd p orτ+2 for p=2. IfΣ_i x_i^d=m modp^γ has a solution with at least one unit coordinate, then Reχ_{d,s,m}(p)≥p^{−γ(s−1)}>0. The hypothesis is primitive solubility at the indicated depth, not arbitrary solubility modulo p.

Hypotheses and conventions: The native residues are in ZMod(p^γ). The prime-power exponent and the derivative valuation are not replaced by a nonsingularity assumption at level1 when p divides d.

Proof or construction outline:

1. Choose a unit coordinate and retain the other s−1 residues modulo p^γ.
1. The source unit-power lifting argument gives a unit d-th root at every larger depth for each of the p^{(e−γ)(s−1)} choices of the other coordinates.
1. Normalize the resulting lower bound on M(p^e) and use the proved local-density limit. This is a specialized monomial lifting theorem, not a duplicate general Hensel theory.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.3/waring-congruence-count, ExponentialSumsAndCircleMethod:ES.3/waring-local-density-limit, ExponentialSumsAndCircleMethod:ES.3/waring-local-factor, mathlib:IsUnit.

Acceptance: At primes dividing d, a solution merely modulo p need not meet the stated hypothesis. The explicit lower bound remains positive even when γ>1.

Source match: AssingCircle2022, §6.2 Lemmas6.10–6.13 pp.41–44, statements and proofs; E25–26 — The primitive lifting condition is explicit; the uniform source proof is used only in degree at least three..

### Uniform Waring singular-series positivity

Identifier: ExponentialSumsAndCircleMethod:ES.3/waring-uniform-series-positivity. Kind: theorem.

For d≥3 and s≥2^d+1 there is c(d,s)>0 such that ReS_{d,s}(m)≥c(d,s) for every natural target m. This is the classical Waring range of Theorem6.13 with its degree-two proof boundary excluded, not a claim that the mere existence of Euler factors implies positivity.

Hypotheses and conventions: The bound is uniform in m. The numerical source local-solubility thresholds are2d for odd d and4d for even d; the claimed s range dominates both when d≥3.

Proof or construction outline:

1. For every prime, source Lemma6.12 constructs a primitive solution modulo p^γ. Use the corrected γ calculation from E25 and the primitive local-positivity theorem.
1. For the finitely many small primes the explicit p^{−γ(s−1)} lower bounds are independent of m.
1. The complete monomial bound givesχ(p)=1+O_{d,s}(p^{−1−κ}) for large primes, uniformly in m with κ>0. The tail product is bounded away from zero.
1. Combine finite local lower bounds and the convergent Euler product.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.3/waring-primitive-local-positivity, ExponentialSumsAndCircleMethod:ES.3/waring-series-euler-product, ExponentialSumsAndCircleMethod:ES.0/complete-power-bound, ExponentialSumsAndCircleMethod:ES.3/waring-series-absolute-convergence.

Acceptance: No local-global conclusion is claimed for a general form. The quadratic degree is not accepted merely by citing the unproved n=2 extension of the source’s argument.

Source match: AssingCircle2022, §6.2 Lemmas6.10–6.13 pp.41–44, statements and proofs; E25–26 — The primitive lifting condition is explicit; the uniform source proof is used only in degree at least three..

## ES.4 — Minor arcs and Diophantine endpoints

Coverage: partial. The ordered positive Waring count, exact counting identity, classical minor-arc saving, classical d≥3,s≥2^d+1 asymptotic and its existence consequence are specified. Finish the independent optimized §9 endpoint with its general-curve/restriction inputs and different arcs; the separate prime-weighted branch and routed forms-in-many-variables, Markoff variance and maximal-lattice endpoints still need exact source contracts. None follows just from unweighted VMV.

### Positive Waring representation count

Identifier: ExponentialSumsAndCircleMethod:ES.4/waring-positive-count. Kind: definition.

waringPositiveCount(d,s,m) is the native finite cardinality of ordered tuples x∈(Fin m)^s satisfyingΣ_i(x_i.val+1)^d=m. For d≥1 it counts all representations of m by s positive integral d-th powers: every positive coordinate of a solution is at most m. This is not the nonnegative-variable count and does not identify tuples up to permutations.

Hypotheses and conventions: d,s,m are natural. The interpretation as all positive representations requires d≥1. At s=0 the count is1 for m=0 and0 otherwise; at m=0,s>0 it is0.

Proof or construction outline:

1. Use the native finite tuple subtype and Fintype.card.
1. For d≥1, positivity and x≤x^d bound each coordinate by m.
1. The finite fibre equality gives the native bounded-tuple count without an artificial real cutoff.

API:

- waringPositiveCount_eq_card (characterisation): The count is the cardinality of the concrete ordered finite subtype.
- waringPositiveCount_empty_tuple (simp): At s=0 it is1 exactly at m=0.
- waringPositiveCount_zero_target (simp): At m=0,s>0 it is0.
- waringPositiveCount_one_variable (relation): For d≥1,s=1 it is1 iff m is a positive d-th power, and0 otherwise.
- waringPositiveCount_cutoff (compatibility): For d≥1 and m≤P^d, replacing Fin m by Fin P leaves the count unchanged.

Unit contracts:

- waringPositiveCount_linear_test: d=1,s=2,m=4 gives3.
- waringPositiveCount_squares_test: d=2,s=2,m=5 gives2.
- waringPositiveCount_empty_test: At s=0 targets0and1 give1and0 respectively.
- waringPositiveCount_positive_test: d=1,s=2,m=2 gives1, rather than the nonnegative count3.

Uses: Assing Theorem6.5; circle coefficient extraction — This is the exact integer count in the asymptotic and in the orthogonality identity..

Direct dependencies: mathlib:Fintype.card, mathlib:Finset.sum_mul_sum.

Acceptance: For d=1,s=2,m=4 the count is3; including zero would give5. For d=2,s=2,m=5 the two ordered tuples are(1,2),(2,1).

Source match: AssingCircle2022, §6.1 pp.34–39, statements and full proofs, with E15–16 and E23–24 corrected — Positive variables, symmetric frequency truncations and strict arc-size constraints are retained. The degree-two local proof boundary is not silently imported..

Atlas planet: Waring representation count.

### Waring counting identity

Identifier: ExponentialSumsAndCircleMethod:ES.4/waring-counting-integral. Kind: theorem.

For d≥1,m≤P^d, the integral over AddCircle1 of powerWeylSum(d,P,α)^s times fourier(−m)(α), with probability Haar measure, equals waringPositiveCount(d,s,m), cast to complex. The tuples are ordered and positive. Empty s=0 and m=0 are included with the native zero-th-power convention.

Hypotheses and conventions: The integer target uses the negative Fourier sign and native normalized Haar measure. There is no limiting passage in this finite identity.

Proof or construction outline:

1. Expand the finite product of sums and group each ordered tuple into the phaseΣx_i^d−m.
1. Native coefficient extraction gives one for a zero frequency and zero otherwise.
1. Since m≤P^d and d≥1, each coordinate of any positive solution is≤P; identify this finite count with the definition.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.1/monomial-weyl-sum, ExponentialSumsAndCircleMethod:ES.4/waring-positive-count, ExponentialSumsAndCircleMethod:ES.1/torus-coefficient-extraction, mathlib:fourier_add, mathlib:fourierCoeff_fourier.

Acceptance: For d=1,s=2,m=2,P=2 the integral is1, not3. At s=0 the integral is1 at m=0 and0 at a positive integer target.

Source match: AssingCircle2022, §6.1 pp.34–39, statements and full proofs, with E15–16 and E23–24 corrected — Positive variables, symmetric frequency truncations and strict arc-size constraints are retained. The degree-two local proof boundary is not silently imported..

### Classical Waring minor-arc estimate

Identifier: ExponentialSumsAndCircleMethod:ES.4/waring-classical-minor-arcs. Kind: theorem.

Let d≥3,s≥2^d+1 and0<δ<1/10. Put Q=floor(P^δ),η=P^{−d+δ}. There is C(d,s,δ)>0 such that for every integer P≥2, ∫_{minorArcs(Q,η)}|powerWeylSum(d,P,α)|^s dα≤CP^{s−d−δ/2^d}. The measure is probability Haar on AddCircle1.

Hypotheses and conventions: The radii and denominator cutoff are explicit. Strict separation holds for sufficiently large P because3δ<d; small P are absorbed in C.

Proof or construction outline:

1. Dirichlet approximation provides q≤P^{d−δ}; outside the major arcs q>P^δ. Apply the polynomial Weyl bound to get a supremum P^{1−δ/2^{d−1}+ε}.
1. Apply Hua at exponent2^d and multiply by the supremum to power s−2^d.
1. Choose ε=δ/((s+1−2^d)2^d), giving a saving at least δ/2^d. Constant dependencies do not include P.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.1/monomial-weyl-sum, ExponentialSumsAndCircleMethod:ES.1/minor-arcs, ExponentialSumsAndCircleMethod:ES.0/polynomial-weyl-inequality, ExponentialSumsAndCircleMethod:ES.2/hua-mean-value, mathlib:Nat.floor.

Acceptance: This estimate concerns the unweighted monomial sum. It supplies no TypeI/II or arithmetic-progression estimate for a prime-weighted sum.

Source match: AssingCircle2022, Lemma6.1 and proof pp.34–35 — Correct positive-sum convention, explicit degree/variable range and the source proof’s positive saving are retained..

Atlas planet: Waring minor-arc estimate.

### Classical Waring asymptotic

Identifier: ExponentialSumsAndCircleMethod:ES.4/waring-classical-asymptotic. Kind: theorem.

For integers d≥3 and s≥2^d+1 there exist σ(d,s)>0,C(d,s)>0 and M₀ such that for every m≥M₀, |r^+_{d,s}(m)−[Γ(1+1/d)^s/Γ(s/d)] ReS_{d,s}(m)m^{s/d−1}|≤Cm^{s/d−1−σ}. Here r^+ is the concrete ordered positive representation count. The source asserts a positive saving; no numerical optimized exponent is claimed.

Hypotheses and conventions: The Gamma factor uses the positive-variable archimedean normalization. σ,C,M₀ are independent of m; this is not a theorem about arbitrary forms or prime variables.

Proof or construction outline:

1. Use P=ceil(m^{1/d}), choose0<δ<1/10, and split the exact finite counting integral over disjoint major arcs and their complement for large P.
1. The classical minor-arc theorem gives a power-saving error.
1. Use the major-arc approximation and binomial expansion; the total local error is O(P^{s−d−1+5δ}).
1. Replace the truncated series by its absolutely convergent value, and the symmetric truncated singular integral by its Gamma evaluation. Polynomial complete-sum bounds control both tails. Replace P^d by m using the actual source phase estimate corrected in E24.
1. Take a positive minimum of the errors’ savings and convert P-powers to m-powers. The native dominated-convergence, quadrature and beta-inversion interfaces are explicitly recorded frontiers.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.4/waring-positive-count, ExponentialSumsAndCircleMethod:ES.4/waring-counting-integral, ExponentialSumsAndCircleMethod:ES.4/waring-classical-minor-arcs, ExponentialSumsAndCircleMethod:ES.3/waring-major-arc-approximation, ExponentialSumsAndCircleMethod:ES.1/major-minor-counting-partition, ExponentialSumsAndCircleMethod:ES.3/waring-singular-integral-evaluation, ExponentialSumsAndCircleMethod:ES.3/waring-series-absolute-convergence.

Acceptance: At d=3 the stated range starts at s=9; it does not claim the best known variable threshold. An optimized §9 asymptotic is a distinct source theorem with distinct arcs and inputs.

Source match: AssingCircle2022, §6.1 pp.34–39, statements and full proofs, with E15–16 and E23–24 corrected — Positive variables, symmetric frequency truncations and strict arc-size constraints are retained. The degree-two local proof boundary is not silently imported..

Atlas planet: Waring asymptotic formula.

### Eventual positive Waring representation

Identifier: ExponentialSumsAndCircleMethod:ES.4/waring-eventual-representation. Kind: theorem.

For d≥3,s≥2^d+1 there exists M₀ such that every integer m≥M₀ is a sum of s positive d-th powers. The conclusion is existence of an ordered tuple, not an asymptotic for an arbitrary locally soluble Diophantine problem.

Hypotheses and conventions: The theorem uses the uniform strictly positive singular series and the Gamma factor in this particular classical range.

Proof or construction outline:

1. The Gamma constant and uniform singular-series lower bound make the main term positive.
1. Increase M₀ until the relative error Cm^{−σ} is less than half the lower main-term constant.
1. The positive integer finite count gives a tuple.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.4/waring-classical-asymptotic, ExponentialSumsAndCircleMethod:ES.3/waring-uniform-series-positivity, mathlib:Real.Gamma_pos_of_pos, mathlib:Fintype.card.

Acceptance: A nonnegative series or an upper point bound does not suffice for this conclusion.

Source match: AssingCircle2022, §6.1 pp.34–39, statements and full proofs, with E15–16 and E23–24 corrected — Positive variables, symmetric frequency truncations and strict arc-size constraints are retained. The degree-two local proof boundary is not silently imported..

## ES.5 — Uniform and geometric applications

Coverage: partial. The canonical primitive projective box count, coefficient-height alternative, quantitative determinant auxiliary cover and uniform ternary curve bound are specified from selected complete Heath-Brown proofs. Resolve their native geometric/p-adic interfaces, the integral/surface and arithmetic-statistics transfers, and the routed independent Browning–Sawin geometric prefix/application without importing late ES.5 back into ES.0. No full-stage coverage or positive asymptotic is claimed.

### Bounded projective point count

Identifier: ExponentialSumsAndCircleMethod:ES.5/bounded-projective-point-count. Kind: definition.

boundedProjectivePointCount(F,B) counts integer vectors x with |x_i|≤B_i, F(x)=0, gcd_i|x_i|=1, and first nonzero coordinate positive. F is a native integer MvPolynomial in finitely many coordinates; B_i are natural box sizes. The concrete finite carrier uses coordinate k_i∈Fin(2B_i+1) and x_i=k_i−B_i. For a homogeneous nonzero form, these are unique primitive representatives of rational projective points, not every scalar multiple or both signs.

Hypotheses and conventions: The definition permits zero box sizes and the zero polynomial for boundary tests; determinant bounds require B_i≥1 and a homogeneous form irreducible over the specified field. The zero vector is never primitive.

Proof or construction outline:

1. Use native finite tuple cardinality, evaluation and finite gcd.
1. Finite interval translation identifies the carrier with the source integer box.
1. Every rational projective point has exactly one primitive integer representative with first nonzero coordinate positive. This is an adapter to projective points, not a new projective-space construction.

API:

- boundedProjectivePointCount_eq_card (characterisation): The count equals the native finite subtype cardinality with the displayed evaluation/gcd/sign conditions.
- boundedProjectivePointCount_zero_box (simp): With every B_i=0 the count is0.
- boundedProjectivePointCount_one_polynomial (simp): The constant-one polynomial has count0.
- boundedProjectivePointCount_scale (compatibility): A nonzero integer scalar multiple of F has the same count.
- boundedProjectivePointCount_mono (relation): Increasing every box size can only increase the count.

Unit contracts:

- boundedProjectivePointCount_line_test: For F=X₀ in three coordinates and unit box the count is4.
- boundedProjectivePointCount_zero_box_test: For every F the all-zero box has count0.
- boundedProjectivePointCount_conic_test: For the native form X₀X₂−X₁² and unit box, the count is4.
- boundedProjectivePointCount_sign_test: For the zero polynomial in three coordinates and unit box the count is13, not26: both signs are not counted.

Uses: Heath-Brown Theorems3,4,14 — The exact count supplies the geometric endpoint and the coefficient-height alternative..

Direct dependencies: mathlib:MvPolynomial.eval, mathlib:MvPolynomial.map, mathlib:MvPolynomial.totalDegree, mathlib:MvPolynomial.IsHomogeneous, mathlib:MvPolynomial.support, mathlib:Finset.gcd, mathlib:Irreducible, mathlib:Fintype.card.

Acceptance: At F=X₀ in three coordinates and B=(1,1,1) the count is4, not8 or9. Multiplying F by a nonzero integer leaves its zeros and count unchanged.

Source match: HeathBrown2002, §1 pp.553–555 and562; §2 p.564; complete §3 pp.567–575 in the specified arXiv reprint — Exact normalized projective representatives, anisotropic box sizes, coefficient height and theorem uniformity are retained; unacquired external proof interfaces are recorded as gaps..

Atlas planet: Bounded projective point count.

### Ternary coefficient-height alternative

Identifier: ExponentialSumsAndCircleMethod:ES.5/ternary-coefficient-height-alternative. Kind: theorem.

For every degree d≥1 there is C_d>0 such that for every primitive-coefficient integral ternary homogeneous form F of degree d irreducible over ℚ and B≥1, either N(F;B,B,B)≤d² or max|coeff(F)|≤C_dB^{d(d+1)(d+2)/2}. The height is the native supremum of coefficient absolute values on support, not an unrecorded projective or logarithmic height.

Hypotheses and conventions: Primitivity is gcd of all coefficient absolute values equal to1. Irreducibility is after native coefficient extension ℤ→ℚ; it is not weakened to irreducibility over ℤ for a form with nontrivial content.

Proof or construction outline:

1. If there are d²+1 distinct projective representatives, form their degree-d monomial evaluation matrix with(d+1)(d+2)/2 columns.
1. A nonzero integer kernel vector is given by bounded minors, producing a degree-d form G with height O_d(B^{d(d+1)(d+2)/2}).
1. The source projective Bézout input implies G is a scalar multiple of F; coefficient primitivity bounds the height of F by that of G. The precise Bézout and kernel-minor suppliers remain explicit frontiers.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.5/bounded-projective-point-count, mathlib:MvPolynomial.eval, mathlib:MvPolynomial.map, mathlib:MvPolynomial.totalDegree, mathlib:MvPolynomial.IsHomogeneous, mathlib:MvPolynomial.support, mathlib:Finset.gcd, mathlib:Irreducible.

Acceptance: Scaling F changes coefficient height but not N, so coefficient primitivity is essential. The theorem is a quantitative alternative, not a positive point asymptotic.

Source match: HeathBrown2002, §1 pp.553–555 and562; §2 p.564; complete §3 pp.567–575 in the specified arXiv reprint — Exact normalized projective representatives, anisotropic box sizes, coefficient height and theorem uniformity are retained; unacquired external proof interfaces are recorded as gaps..

### Determinant-method auxiliary hypersurface cover

Identifier: ExponentialSumsAndCircleMethod:ES.5/determinant-auxiliary-cover. Kind: theorem.

For n≥3,d≥2,ε>0 there are C(n,d,ε)>0 and D(n,d,ε) such that for every degree-d integral homogeneous F irreducible over ℚ, with H=max|coeff(F)|≥2, and B_i≥1, set V=∏B_i and T=max_{e∈support F}∏B_i^{e_i}. There is a finite set of integral homogeneous auxiliary forms G_j of degrees≤D, none divisible by F after native coefficient extension to ℚ, covering every primitive normalized integer zero in the box, and its cardinality is at most C(V^d/T)^{d^{−(n−1)/(n−2)}}V^ε(log H)^{2n−3}. C,D are independent of F and the B_i. For H=1 apply the theorem to2F, giving a log(2H) convention; the unmodified zero logarithm is excluded.

Hypotheses and conventions: This is the exact source quantitative cover, with bounded degree and nondivisibility both essential. Irreducibility is over ℚ. No smoothness assumption on F is imposed: its singular points are handled separately. Nondivisibility is over ℚ, not merely over ℤ: otherwise a nonprimitive scalar multiple of F would permit an auxiliary form defining the entire same hypersurface.

Proof or construction outline:

1. A nonzero partial derivative covers the singular points and is not divisible by F.
1. For nonsingular points choose O(log(HB)) primes of the required scale so every point is nonsingular modulo one of them; split by nonzero projective residue classes.
1. In each residue class use the source unit-derivative p-adic implicit polynomial graph, then order its monomials by degree. Column elimination forces a p-adic determinant valuationν with the source combinatorial expression.
1. Compare this divisibility to the archimedean determinant bound; choose a fixed degree D large enough to force all maximal minors to vanish. A bounded-degree kernel form then vanishes on the class.
1. Select the support monomials excluding a maximal Newton-polytope vertex multiple, ensuring F does not divide the auxiliary form. The asymptotic monomial/valuation calculation gives the stated prime scale and number of classes.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.5/bounded-projective-point-count, mathlib:MvPolynomial.eval, mathlib:MvPolynomial.map, mathlib:MvPolynomial.totalDegree, mathlib:MvPolynomial.IsHomogeneous, mathlib:MvPolynomial.support, mathlib:Finset.gcd, mathlib:Irreducible.

Acceptance: The theorem covers points by bounded-degree proper intersections, not by forms whose degrees grow with height. At coefficient height1 the expression log H=0 cannot be used as a cardinality bound.

Source match: HeathBrown2002, §1 pp.553–555 and562; §2 p.564; complete §3 pp.567–575 in the specified arXiv reprint — Exact normalized projective representatives, anisotropic box sizes, coefficient height and theorem uniformity are retained; unacquired external proof interfaces are recorded as gaps..

Atlas planet: Determinant-method auxiliary cover.

### Uniform rational plane-curve bound

Identifier: ExponentialSumsAndCircleMethod:ES.5/uniform-ternary-curve-bound. Kind: theorem.

For degree d≥2 and ε>0 there is C(d,ε)>0 such that for every integral ternary homogeneous F of degree d irreducible over ℚ and every B_i≥1, N(F;B₁,B₂,B₃)≤CT^{−1/d²}V^{1/d+ε}. In particular N(F;B,B,B)≤C′(d,ε)B^{2/d+ε} for all B≥1. Constants are independent of every coefficient of F; no positive lower bound or asymptotic is asserted.

Hypotheses and conventions: V and T have the same source definitions as the auxiliary cover. Absolute irreducibility is not required. For the cubic homogeneous form the cube exponent is2/3+ε; height-one coefficient cases use the corrected logarithmic convention.

Proof or construction outline:

1. Apply the auxiliary cover with n=3. Each proper plane intersection has at most dD projective points by the source Bézout input.
1. Normalize coefficient content without changing zeros. If there are at most d² points the bound is absorbed, since T≤V^d. Otherwise apply the coefficient-height alternative with the largest box size.
1. Absorb the resulting logarithmic coefficient dependence into a smaller chosen positive V exponent, obtaining T^{−1/d²}V^{1/d+ε}.
1. For equal sides T=B^d,V=B³. Choose the anisotropic ε/3 to obtain the requested cube exponent2/d+ε.

Direct dependencies: ExponentialSumsAndCircleMethod:ES.5/bounded-projective-point-count, ExponentialSumsAndCircleMethod:ES.5/determinant-auxiliary-cover, ExponentialSumsAndCircleMethod:ES.5/ternary-coefficient-height-alternative, mathlib:MvPolynomial.eval, mathlib:MvPolynomial.map, mathlib:MvPolynomial.totalDegree, mathlib:MvPolynomial.IsHomogeneous, mathlib:MvPolynomial.support, mathlib:Finset.gcd, mathlib:Irreducible.

Acceptance: The estimate is uniform in F. Reducible forms containing lines do not satisfy the irreducibility hypothesis. No local-solubility conclusion follows from this upper bound.

Source match: HeathBrown2002, §1 pp.553–555 and562; §2 p.564; complete §3 pp.567–575 in the specified arXiv reprint — Exact normalized projective representatives, anisotropic box sizes, coefficient height and theorem uniformity are retained; unacquired external proof interfaces are recorded as gaps..

Atlas planet: Uniform rational plane-curve bound.

## Exact unresolved inputs

### Complete Graham–Ringrose proof

Routed item92 remains open: read and decompose the complete external Graham–Ringrose proof, or the exact Iwaniec–Kowalski Theorem12.13 version used by Bennett–Siksek. The published quotation is not its proof. Routed item95 now has exact bounded character factors, all-integer reconstruction, distinguished primitivity, r<10c+2 and R₀<k/2 through large-conductor-character-blocks. The conductor shape is imported from the two exact CA.1 nodes and binary primitivity from its exact CA.1 supplier. Remaining analytic work must preserve ambient moduli for general factors, permit one factor and empty principal families, and align real interval endpoints. The finite q–van der Corput nodes now supply exact elementary averaging and lag reduction. They do not establish a bound for the resulting correlations or the required iterated multiplicative-character estimate.

### Full distinct-quadratic cancellation proposition

Routed item44 (Proposition8.2) still requires the analytic large-conductor estimate and the final combination with small-conductor-product-cancellation. The CRT character interfaces and their size hypotheses are now decomposed. The existing uniform large-conductor numeric threshold gives γ=2^(−10c−6) only after its analytic premise is established. Read the entire external proof and match its real interval length k/2, so odd k yields exactly the inherited natural interval (k div2,k]. No full cancellation theorem is claimed from character factorization alone.

### ExponentialSumsAndCircleMethod:ES.0 remaining source decomposition

The 58 inherited conductor/CRT/numerical and finite q–van der Corput nodes are preserved. The classical Weyl target is specified using native forward differences and the exact AN.5 divisor supplier; routine squared-phase, mixed-leading, product-multiplicity and rational-block algebra stay in its proof sketch as required at target level. Complete correlations, the full Graham–Ringrose proof and Proposition8.2 assembly remain open, as do stationary-phase, completion and other routed targets.

### ExponentialSumsAndCircleMethod:ES.1 remaining source decomposition

Finite weighted torus extraction, ordered Vinogradov counting, native major/minor sets and their strict disjointness condition are now planned. Weighted/smoothed limiting transfers and the routed function-field counting interfaces still require their source contracts. These nodes do not supply local major-arc approximations or minor-arc analytic estimates.

### ExponentialSumsAndCircleMethod:ES.2 remaining source decomposition

The Vinogradov count, curve, weight, native extension, integrability and exact critical decoupling/discrete/mean-value endpoints are specified. The complete analytic proof graph is not yet decomposed: external parabola base[9], BL finiteness[2], BL stability[1], Guth plate Kakeya[15], BDG§§6–10 adapters, off-critical restriction and Fourier-positive Schwartz counting transfer remain explicit frontier tasks. Low-degree n=1 has an elementary node; n=2 needs an actual base proof.

### ExponentialSumsAndCircleMethod:ES.3 remaining source decomposition

Classical positive-power singular integral/series, complete residue coefficients, simple absolute convergence, Euler factorization, normalized prime-power density limits, primitive lifting positivity and uniform d≥3 classical Waring positivity are specified. Finish the generic weighted-form densities, routed Ghosh–Sarnak and quadratic-form Heath–Brown contracts, and native sine-kernel/beta-convolution/quantitative-tail interfaces. The quadratic two-adic exception E18 and the degree-two source-proof boundary E26 remain explicit.

### ExponentialSumsAndCircleMethod:ES.4 remaining source decomposition

The ordered positive Waring count, exact counting identity, classical minor-arc saving, classical d≥3,s≥2^d+1 asymptotic and its existence consequence are specified. Finish the independent optimized §9 endpoint with its general-curve/restriction inputs and different arcs; the separate prime-weighted branch and routed forms-in-many-variables, Markoff variance and maximal-lattice endpoints still need exact source contracts. None follows just from unweighted VMV.

### ExponentialSumsAndCircleMethod:ES.5 remaining source decomposition

The canonical primitive projective box count, coefficient-height alternative, quantitative determinant auxiliary cover and uniform ternary curve bound are specified from selected complete Heath-Brown proofs. Resolve their native geometric/p-adic interfaces, the integral/surface and arithmetic-statistics transfers, and the routed independent Browning–Sawin geometric prefix/application without importing late ES.5 back into ES.0. No full-stage coverage or positive asymptotic is claimed.

### Quadratic two-adic source boundary

Assing Lemma6.16 is false for n=p=2,v=3 (E18); the complete-power-sum recursion and its subsequent analytic consumers cannot cite the blanket range. Supply the corrected two-adic quadratic bases before using the improved degree-two singular-series proof. Finite-field Gauss inputs stay with FF.1; composite prime-power stationary phase is not claimed from a finite-field bound.

### Native Waring analytic transfer interfaces

Specify and locate the native bounded-variation sum–integral estimate, quantitative absolute-series and full-frequency integral tails, and simplex beta-convolution/sine-kernel inversion used by the selected complete §6 source proof. These are proof-to-library adapters, not premise fields assuming the desired asymptotic. Keep symmetric cutoffs and positive tuples.

### Determinant-method source-to-library interfaces

The selected complete source proof uses projective Bézout for plane intersections, bounded-minor integer kernel vectors, unit-derivative p-adic implicit multivariable graphs, determinant valuation/monomial counting, and source Lemma4 prime selection. Their exact native or supplier interfaces have not been resolved; do not replace them with a record field assuming the auxiliary cover. The arXiv reprint is not collated with the publisher scan. The broader ES.5 integral/surface/ST and Browning–Sawin consumers are still untouched.

## Routed target frontier

A contract listed here covers only the named portion, not every theorem in its routed source. An empty contract list identifies untouched source work; these worklist descriptions are not replacement definitions or premise fields.

- ExponentialSumsAndCircleMethod:ES.0: Weyl differencing and polynomial Weyl bound with degree and rational-approximation constants Saved contracts: ExponentialSumsAndCircleMethod:ES.0/polynomial-weyl-inequality.

- ExponentialSumsAndCircleMethod:ES.0: Real derivative van der Corput A/B bounds with quantitative stationary phase Saved contracts: none from this continuation.

- ExponentialSumsAndCircleMethod:ES.0: Completion of finite interval sums from exact FF.2 complete-sum suppliers Saved contracts: none from this continuation.

- ExponentialSumsAndCircleMethod:ES.0: Graham–Ringrose short sums and Bennett–Siksek Proposition8.2 (inherited partial chain) Saved contracts: none from this continuation.

- ExponentialSumsAndCircleMethod:ES.0: Browning–Sawin polarization, polar locus, top-degree phase, Nalpha bound, iterative shrinking, short-zero and polar dimension Saved contracts: none from this continuation.

- ExponentialSumsAndCircleMethod:ES.0: Burgess character sums for the routed Duke–Imamoglu–Toth analytic application Saved contracts: none from this continuation.

- ExponentialSumsAndCircleMethod:ES.0: Skorobogatov–Sofos symmetric and one-sided Dirichlet-kernel L1 bounds Saved contracts: none from this continuation.

- ExponentialSumsAndCircleMethod:ES.0: FIMR Conjecture C_n as a hypothesis; Burgess r=6 gives C_3 with δ=1/48; Koymans–Milovic Corollary2.2 carries C_n Saved contracts: none from this continuation.

- ExponentialSumsAndCircleMethod:ES.1: Normalized torus finite counting and weighted coefficient extraction (new weighted sum/moment/counting nodes saved) Saved contracts: ExponentialSumsAndCircleMethod:ES.1/weighted-torus-sum, ExponentialSumsAndCircleMethod:ES.1/torus-coefficient-extraction, ExponentialSumsAndCircleMethod:ES.1/vinogradov-counting-integral.

- ExponentialSumsAndCircleMethod:ES.1: Major/minor arc definitions, separation, wraparound and disjointness under actual size conditions Saved contracts: ExponentialSumsAndCircleMethod:ES.1/reduced-arc-indices, ExponentialSumsAndCircleMethod:ES.1/major-arc, ExponentialSumsAndCircleMethod:ES.1/major-arcs, ExponentialSumsAndCircleMethod:ES.1/minor-arcs, ExponentialSumsAndCircleMethod:ES.1/major-arcs-disjoint.

- ExponentialSumsAndCircleMethod:ES.1: Weighted/smoothed counting and justified limiting transfers Saved contracts: none from this continuation.

- ExponentialSumsAndCircleMethod:ES.1: Browning–Sawin Nalpha coefficient-count identity and uniform arithmetic minor-arc count; import nonarchimedean lattice PartII and independent geometric prefix Saved contracts: none from this continuation.

- ExponentialSumsAndCircleMethod:ES.2: Vinogradov mean value, exact integral identity and bound with both expected terms and epsilon loss Saved contracts: ExponentialSumsAndCircleMethod:ES.2/vinogradov-mean-value, ExponentialSumsAndCircleMethod:ES.2/vinogradov-main-bound.

- ExponentialSumsAndCircleMethod:ES.2: Complete selected BDG route: extension/weight conventions, critical decoupling and analytic restriction inputs Saved contracts: ExponentialSumsAndCircleMethod:ES.2/moment-curve, ExponentialSumsAndCircleMethod:ES.2/decoupling-weight, ExponentialSumsAndCircleMethod:ES.2/moment-extension, ExponentialSumsAndCircleMethod:ES.2/critical-decoupling, ExponentialSumsAndCircleMethod:ES.2/discrete-restriction.

- ExponentialSumsAndCircleMethod:ES.2: Low degrees n=1 and n=2 separately; cubic decoupling established by the selected route, not by a title-only citation Saved contracts: ExponentialSumsAndCircleMethod:ES.2/linear-mean-bound, ExponentialSumsAndCircleMethod:ES.2/critical-decoupling.

- ExponentialSumsAndCircleMethod:ES.2: Analytic proof inputs traced to Brascamp–Lieb finiteness/stability and the plate Kakeya theorem; external proof gaps explicit Saved contracts: none from this continuation.

- ExponentialSumsAndCircleMethod:ES.3: Singular integral and singular series definitions, absolute convergence and Euler factorization Saved contracts: ExponentialSumsAndCircleMethod:ES.3/waring-singular-integral, ExponentialSumsAndCircleMethod:ES.3/waring-singular-integral-evaluation, ExponentialSumsAndCircleMethod:ES.3/waring-singular-series, ExponentialSumsAndCircleMethod:ES.3/waring-series-absolute-convergence, ExponentialSumsAndCircleMethod:ES.3/waring-series-euler-product.

- ExponentialSumsAndCircleMethod:ES.3: Normalized p-adic solution density, real and p-adic positivity under explicitly nonsingular local solutions Saved contracts: ExponentialSumsAndCircleMethod:ES.3/waring-local-factor, ExponentialSumsAndCircleMethod:ES.3/waring-local-density-limit, ExponentialSumsAndCircleMethod:ES.3/waring-primitive-local-positivity, ExponentialSumsAndCircleMethod:ES.3/waring-uniform-series-positivity.

- ExponentialSumsAndCircleMethod:ES.3: Ghosh–Sarnak AppendixB δ_p(k), δ_p(a1,a2), moving-sector integral9.20 and truncated singular series Proposition9.6; FF.1 Gauss conventions Saved contracts: none from this continuation.

- ExponentialSumsAndCircleMethod:ES.3: Heath–Brown admissible weight classes and singular integral/local density normalizations for quadratic forms Saved contracts: none from this continuation.

- ExponentialSumsAndCircleMethod:ES.4: Waring asymptotics in the selected actual degree/variable/error ranges Saved contracts: ExponentialSumsAndCircleMethod:ES.4/waring-positive-count, ExponentialSumsAndCircleMethod:ES.4/waring-classical-minor-arcs, ExponentialSumsAndCircleMethod:ES.4/waring-classical-asymptotic, ExponentialSumsAndCircleMethod:ES.4/waring-eventual-representation.

- ExponentialSumsAndCircleMethod:ES.4: Separate prime-weighted endpoint with SV.2 Vaughan/Heath–Brown identities and AN.3 uniform progression major arcs Saved contracts: none from this continuation.

- ExponentialSumsAndCircleMethod:ES.4: Forms-in-many-variables endpoints with degree/variables/singular-locus/error fixed separately Saved contracts: none from this continuation.

- ExponentialSumsAndCircleMethod:ES.4: Ghosh–Sarnak Markoff Theorem1.2(ii): tentacles, Lemmas9.2–9.5, δ-method9.17, Proposition9.6, lower9.36, AppendixA invariants; no pointwise local-global replacement Saved contracts: none from this continuation.

- ExponentialSumsAndCircleMethod:ES.4: Heath–Brown Theorem4 and Corollary1 n≥5, Niedermowwe expanding regions and Shankar–Shankar–Tang–Tayou Corollary4.7 Saved contracts: none from this continuation.

- ExponentialSumsAndCircleMethod:ES.5: Determinant-method rational/integral point upper bounds with explicit coefficient/degree/height dependence Saved contracts: ExponentialSumsAndCircleMethod:ES.5/bounded-projective-point-count, ExponentialSumsAndCircleMethod:ES.5/ternary-coefficient-height-alternative, ExponentialSumsAndCircleMethod:ES.5/determinant-auxiliary-cover, ExponentialSumsAndCircleMethod:ES.5/uniform-ternary-curve-bound.

- ExponentialSumsAndCircleMethod:ES.5: Arithmetic-geometric comparison and ST handoff; upper bound is not a positive asymptotic Saved contracts: none from this continuation.

- ExponentialSumsAndCircleMethod:ES.5: Browning–Sawin geometric application consumes only already independent polynomial-point/intersection inputs, without an ES.0→late ES.5→ES.0 cycle Saved contracts: none from this continuation.

## Source corrections awaiting independent review

Every new finding is unreviewed. The text below specifies the version read, the correction and its check. No independent-review verdict is supplied by this worker.

### ExponentialSumsAndCircleMethod/E1

BennettSiksek2020; Published §8.1 p.378 and its reuse on p.379; known source issue E2.

Printed: τ(q) ≤ q^(1/log log 3q) for all q ≥ 1.

Correction: Use AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound or /uniform-divisor-subpower-bound; absorb its constant at the explicit threshold k≥(8Cε)^(64/17).

Reason: At q=120 the left side is 16 while the displayed power is about14.89222. The current small-conductor application uses ε=1/(64c) and 8Cε≤k^(17/64), not the false universal estimate.

Effect: a stated result. Known correction status: Previously recorded and independently confirmed as PAPER-BENNETT-SIKSEK-20/E2; no new finding claimed..

### ExponentialSumsAndCircleMethod/E2

BennettSiksek2020; Published §8.1 pp.377–378, product-character reduction and direct period bound; known E3.

Printed: M = M₁M₂

Correction: M=lcm(N1,N2) is an ambient modulus, not necessarily the primitive conductor. For the primitive inducing η and the squarefree product M2 of primes absent from its conductor M1, use M1M2|M, gcd(M1,M2)=1 and the pointwise masked-character identity. The valid direct cancellation period is M1M2.

Reason: For χ8χ−8=χ−4, the ambient lcm is 8, the primitive conductor is4 and M2=1; equality fails. The present period theorem only asserts that qM is a period and does not assert minimality.

Effect: the proof. Known correction status: Previously recorded and independently confirmed as PAPER-BENNETT-SIKSEK-20/E3; no new finding claimed..

### ExponentialSumsAndCircleMethod/E3

BennettSiksek2020; Published Theorem6 pp.376–377 and Case1 pp.377–378; known E11.

Printed: conductor q_i

Correction: Use ambient modulus q_i for general factors, retaining primitivity for the distinguished first factor. A principal factor's conductor is1. Permit an empty family of principal factors when M2=1; the accepted review rejects the alleged missing-case error.

Reason: The finite sums depend on the displayed modulus while a principal character always has primitive conductor1. The displayed factorization permits r=s, and the original r−2 factor count remains sufficient; no extra missing-case finding is asserted.

Effect: nothing. Known correction status: Previously recorded as PAPER-BENNETT-SIKSEK-20/E11, whose review confirms only the terminology and rejects the M2=1 gap allegation..

### ExponentialSumsAndCircleMethod/E12

IwaniecKowalskiChapter11Author; First additive-character orthogonality display, printed p.271 of the identified author-hosted Chapter 11 extract; not collated with the published book.

Printed: q if x = 1

Correction: In additive-character orthogonality the exceptional argument is x=0, not x=1.

Reason: Over F₂ the two additive characters have values 1,1 at zero, summing to 2, and 1,−1 at one, summing to 0. The following sentence itself says the relation solves x=0.

Effect: a stated result. Known correction status: new.

### ExponentialSumsAndCircleMethod/E13

IwaniecKowalskiChapter11Author; Sentence before the multiplicative orthogonality display, printed p.271 of the identified author-hosted Chapter 11 extract; not collated with the published book.

Printed: characters of order δ

Correction: The subgroup consists of characters whose orders divide δ, equivalently characters annihilated by the δ-th power map. Exact order δ is not a subgroup when δ>1.

Reason: For F₅ and δ=4 the character group has four elements but only two have exact order four. The identity has order one and must belong to every subgroup.

Effect: a stated result. Known correction status: new.

### ExponentialSumsAndCircleMethod/E14

IwaniecKowalskiChapter11Author; Opening continuation of the multiplicative Hilbert 90 paragraph, printed p.271 of the identified author-hosted Chapter 11 extract; not collated with the published book.

Printed: unique up to multiplication by an element in F_n*

Correction: For the degree-n extension F_n/F, solutions of a=σ(b)/b are unique up to multiplication by F*, the fixed-field units, not by arbitrary F_n*.

Reason: If b and c are two solutions, σ(c/b)=c/b, so c/b lies in F*. For F₉/F₃ the map b↦b² on eight nonzero elements has kernel {1,−1}, not all eight elements.

Effect: a stated result. Known correction status: new.

### ExponentialSumsAndCircleMethod/E15

AssingCircle2022; §6 pp.33–34, nonnegative representation count and its Fourier identity, identified 1 April 2022 author-hosted lecture notes; not a published paper.

Printed: non-negative integers

Correction: The sum T on p.34 runs from 1 to P and its kth power counts positive entries. Either call the identity a positive representation count, as Theorem6.5 subsequent does, or include x=0 in T when retaining the nonnegative count.

Reason: For degree one, two variables and m=2, nonnegative ordered representations are (0,2),(1,1),(2,0), whereas the displayed T from1to2 gives the integral count1. This packet uses positive intervals and does not conflate the two counts.

Effect: a stated result. Known correction status: new.

### ExponentialSumsAndCircleMethod/E16

AssingCircle2022; §6.1 p.34, sentence after definition of the closed major arcs, 1 April 2022 author-hosted lecture notes; visually inspected.

Printed: These intervals do not overlap

Correction: Impose a size condition. For denominator bound Q and closed torus radius η, 2ηQ²<1 suffices. With Q=⌊P^δ⌋ and η=P^(−d+δ), require 0<δ<d/3 and sufficiently large P. The bare condition δ>0 is not enough.

Reason: With degree d=2, P=16, δ=3/2 the cutoff is64 and the radius is1/4. Both centres0and1/2 are indexed and their closed arcs meet at1/4. General separation follows from the nonzero integer ar−bq−zqr.

Effect: the proof. Known correction status: new.

### ExponentialSumsAndCircleMethod/E17

BDG2016; §3 p.637, paragraph extending the weight exponent E, published Annals184(2016) PDF.

Printed: Theorem 1.1 holds true for all weights

Correction: The weighted decoupling assertion is Theorem1.2; Theorem1.1 is the arithmetic count and has no spatial weight. Both references to Theorem1.1 in this paragraph’s dimensional/weighted induction discussion should refer to the corresponding decoupling theorem.

Reason: Source Theorem1.1 onp.633 bounds J, whereas Theorem1.2 onp.635 compares weighted extension norms. The paragraph discusses induction for arbitrary w_{B,E}.

Effect: nothing. Known correction status: new.

### ExponentialSumsAndCircleMethod/E18

AssingCircle2022; Lemma6.16 pp.46–47, author-hosted 1April2022 lecture notes; statement visually inspected p.46.

Printed: S(a,p^v)=p^{n-1}S(a,p^{v-n}) for v>n

Correction: Exclude the exceptional quadratic two-adic case n=p=2,v=3. The proof needs v−τ−1≥2 when p=2 and τ=1, which fails there. Treat that base separately; the blanket v>n range cannot be imported unchanged.

Reason: For n=2,a=1,p=2,v=3, the square residues modulo8 occur with multiplicities2at0,4at1,2at4. Hence S(1,8)=4e(1/8), of norm4. But S(1,2)=1+e(1/2)=0, so the asserted2S(1,2) vanishes. The quadratic two-adic binomial expansion used in(13) retains the omitted4y² term.

Effect: a stated result. Known correction status: new.

### ExponentialSumsAndCircleMethod/E19

AssingCircle2022; Proof of Lemma6.14, last Gauss-norm display p.45, author-hosted1April2022 lecture notes; visually inspected.

Printed: |G(a,ψ)|²=pψ(1)−Σ_{x≠1}ψ(v)=p

Correction: The first contribution is(p−1)ψ(1) when the other sum excludes1. Alternatively retain pψ(1) and subtract the sum over all residues. The proved Gauss-norm conclusion p remains correct.

Reason: The immediately preceding inner additive sum is p−1 atx=1 and−1 elsewhere. A nonprincipal character has ψ(1)=1 and sum excluding1 equal−1, so the printed expression is p+1. Atp=3 the quadratic character gives4 in that expression, whereas the Gauss sum squared norm is3.

Effect: the proof. Known correction status: new.

### ExponentialSumsAndCircleMethod/E20

AssingCircle2022; §8.1 Step4, p.75, equations(27)–(28), visually checked; author notes1April2022.

Printed: γ_j=γ_{j₁}+…+γ_{j_L}

Correction: The iterated leaf exponent is the product γ_{j₁}⋯γ_{j_L}. The prefactor exponent after L iterations is1−(Σ_jγ_j)^L, not1−Σ_jγ_j as printed in(28).

Reason: Substituting an inequality into a factor A^γ multiplies, not adds, exponents. With one child of weight1/2 and two iterations the leaf exponent is1/4, not1. The total leaf mass is(Σγ)^L; geometric summation of the prefactor gives1−(Σγ)^L. The final cancellation depends on these corrected values.

Effect: the proof. Known correction status: new.

### ExponentialSumsAndCircleMethod/E21

AssingCircle2022; Proof of Proposition9.2, p.86, linear sum and definition of ψ; visually checked.

Printed: ‖kyθ+α_{k+1}‖⁻¹

Correction: Both occurrences use α_{k−1}, matching the phase−h(kyθ+α_{k−1}) and the displayed argument ψ(θ,α_{k−1}).

Reason: The tuple α has k−1 coordinates and no α_{k+1}. The preceding finite geometric sum has coefficient kyθ+α_{k−1}.

Effect: the proof. Known correction status: new.

### ExponentialSumsAndCircleMethod/E22

AssingCircle2022; Proof of Theorem8.8, p.82, final two displays; visually checked.

Printed: J_{k−1}(3N;2b)

Correction: Use J_{k−1}(3N;b), as in the preceding identification R₂(0)=J_{k−1}(3N;b), and use this same b in the final VMV application.

Reason: The source notation J_n(N;s) has2s tuple variables. R₂(0) comes from a2b-th-power integral and therefore has parameter b. At b=k(k−1)/2 the printed2b count has main size N^{3b}, while the denominator is N^b; the claimed cancellation fails.

Effect: the proof. Known correction status: new.

### ExponentialSumsAndCircleMethod/E23

AssingCircle2022; Lemma6.4, p.36, definition of J(P^δ), and its proof p.37; source text read.

Printed: γ<P^δ

Correction: The defining frequency domain is |γ|<P^δ. It is a symmetric bounded interval, as follows from the change of variables β=P^{−n}γ with |β|<P^{−n+δ}.

Reason: The one-sided printed domain extends to negative infinity and is not the rescaled bounded major-arc integral. Page38 subsequently replaces the symmetric bounded domain by the full real line.

Effect: the proof. Known correction status: new.

### ExponentialSumsAndCircleMethod/E24

AssingCircle2022; Lemma6.4 proof p.37, sentence after the phase replacement; source text read.

Printed: replacing m with P^k

Correction: Replace m with P^n, as in the immediately following display and the estimate m−P^n≪P^{n−1}.

Reason: n is the degree and k the number of variables. Only P^n approximates m from P=ceil(m^{1/n}); replacing m by P^k has no asserted small error.

Effect: the proof. Known correction status: new.

### ExponentialSumsAndCircleMethod/E25

AssingCircle2022; Lemma6.12 proof p.44, final equality in the two-adic case; visually checked p.44.

Printed: 2^γ−1=2^{τ+1}−1

Correction: For p=2 the declared γ is τ+2, so the middle expression is2^{τ+2}−1. The intended upper bound≤4n−1 remains valid.

Reason: For n=2 one has τ=1,γ=3, and the printed equality says7=3. Since n=2^τn₀, the corrected2^{τ+2}≤4n still proves the claimed range.

Effect: the proof. Known correction status: new.

### ExponentialSumsAndCircleMethod/E26

AssingCircle2022; Theorem6.13 proof p.44, use of(12) for n>2; source text read.

Printed: 2^n+1≥Γ(n) for n>2

Correction: The proof presented covers n>2. Supply a separate quadratic primitive-solubility argument to deduce the stated n=2 case; the node using this proof is restricted to d≥3.

Reason: The theorem is stated without n>2, but its proof explicitly invokes that restriction. At n=2 the only even-degree bound just proved is Γ(2)≤8, which does not imply positivity for five variables. This is a proof boundary, not a counterexample to the quadratic conclusion.

Effect: the proof. Known correction status: new.

### ExponentialSumsAndCircleMethod/E27

AssingCircle2022; Proof of Lemma6.3, p.36, first sum–integral inequality; author notes1April2022.

Printed: (B−A)max|f(x)|+max|f′(x)|

Correction: The derivative supremum is multiplied by the interval length, and the function supremum controls the endpoint error: an absolute constant times(max|f|+(B−A)max|f′|). A bounded-variation formulation suffices.

Reason: For constant f=1 on[A,B]=[1−ε,1+ε],0<ε<1/2, the difference between the integral and the strict interior integer sum is1−2ε. The printed right side is2ε, so no uniform implicit constant works as ε→0. The subsequent application uses the intended corrected order.

Effect: the proof. Known correction status: new.

### ExponentialSumsAndCircleMethod/E28

HeathBrown2002; Box count p.554 and the two source sets at the start of§3 p.567. Version: arXiv math/0405392v1,20May2004; no publisher-scan collation.

Printed: (1≤i≤1)

Correction: The box-coordinate range is1≤i≤n in all three occurrences.

Reason: The box has n coordinate bounds B_i, and every following determinant comparison uses all of them. Restricting the stated condition to the first coordinate would generally make the displayed count infinite.

Effect: the proof. Known correction status: new.

### ExponentialSumsAndCircleMethod/E29

HeathBrown2002; Lemma3 discussion and proof pp.566–567. Version: arXiv math/0405392v1,20May2004; no publisher-scan collation.

Printed: factor of degree d

Correction: The two concluding consistency references refer to degreeδ, the fixed parameter0<δ<d, not degree d.

Reason: The lemma detects a proper factor of degreeδ. A degree-d factor of the degree-d form would be the whole form, and cannot characterize this condition.

Effect: the proof. Known correction status: new.

### ExponentialSumsAndCircleMethod/E30

HeathBrown2002; §3 p.571, determinant column-elimination paragraph. Version: arXiv math/0405392v1,20May2004; no publisher-scan collation.

Printed: remaining n−1 columns

Correction: The matrix has E columns, so the remaining column count is E−1.

Reason: The matrix was defined as E×E and there is no equality E=n. The following elimination argument and valuation calculation do run through all E columns.

Effect: nothing. Known correction status: new.

### ExponentialSumsAndCircleMethod/E31

HeathBrown2002; Theorem14 p.562 and bound(3.1) p.568, scoped only to the arXiv-v1 reprint; p.562 visually checked. Version: arXiv math/0405392v1,20May2004; no publisher-scan collation.

Printed: (log‖F‖)^{2n−3}

Correction: Use a positive logarithmic height, such as log(2‖F‖), or state the displayed log‖F‖ bound only for‖F‖≥2 and handle height-one forms by rescaling. The proposed node explicitly takes the second option. This finding does not claim independent confirmation in the publisher scan.

Reason: For the irreducible conic F=X₁X₃−X₂² the coefficient height is1 and the normalized primitive point(0,0,1) lies in the unit box. The printed bound forces the number of auxiliary forms to be0 because log1=0, making the cover impossible. Replacing F by2F leaves the rational hypersurface and nondivisibility overℚ unchanged and repairs the small-height boundary.

Effect: a stated result. Known correction status: new.
