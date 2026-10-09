# Modularity and modular parametrisations of elliptic curves over ℚ, Part II: effective residual comparisons

Modularity provides a weight-two newform for every elliptic curve over ℚ. The modular method also needs effective control of the residual representation: a bound on the residual characteristic when a multiplicative prime disappears from the level, a criterion forcing the lowered newform to have rational coefficients, a comparison curve with the same rational two-torsion, and uniform irreducibility or surjectivity statements. This roadmap presents those comparisons in the order in which an application uses them.

The library development supplying these results is **EllipticModularityEffectiveComparisons**. The six layers here are an interface to its layers EC.0–EC.5. All definitions and theorems below are imports from that roadmap or consequences of the specified imports. Their owning identifiers are given at each target; use those declarations rather than introducing a second definition or theorem under this roadmap's name. The general modular-curve geometry, Galois representation theory and elliptic-curve theory also retain their existing owners.

## Scope, boundaries and prerequisites

The starting input is the modularity theorem over ℚ, `EllipticCurveModularity:R29.6/modularity-theorem`. The continuation supplies Martin's sharp newspace dimension bound, the Bennett–Siksek removed-prime estimate, Kraus's exact-conductor comparison theorems, uniform irreducibility for curves with rational two-torsion, and Lemos's surjectivity theorem for non-CM curves with a rational cyclic isogeny.

The parent modularity theorem is used in the comparison arguments. Its proof of residual irreducibility for a fixed curve is independent of the uniform statements below. Keep that dependency in this direction; uniform surjectivity is an application of modularity, rather than an input to its parent proof.

Modularity over imaginary quadratic fields belongs to `EllipticCurveModularityImaginaryQuadratic`; modularity of GL₂-type abelian varieties belongs to `EllipticCurveModularityPartIIGL2TypeAbelianVarieties`; the wild 3-adic proof belongs to `EllipticCurveModularityWild3Adic`. These developments use different coefficient fields, varieties or local lifting arguments and supply none of the effective bounds here.

Use the upstream Elliptic curves roadmap for isogenies, dual isogenies, rational and geometric torsion, the Weil pairing, local reduction, Tate curves and twists. Use Modular forms for native cusp forms, primitive newforms, integral Hecke coefficients, coefficient fields, Galois conjugation and the characteristic-zero Sturm comparison. Use `ArithmeticGaloisRepresentations:R01.3` for local conductors, `ArithmeticGaloisRepresentations:R01.4` for the finite-image and oddness arguments, and `SerreWeightAndLevelOptimisation:R20.2`, `R20.3`, `R20.6` for the precise level and weight interfaces.

General Cartan correspondences and Chen's isogeny, the integral winding quotient, semistable cotangent comparison and the higher-dimensional rank-zero theorem are prerequisites of the last layer. They are supplied through the extensions of ModularCurvesPartII and the corresponding modular-abelian BSD theory described below. In particular, the Hecke-equivariant correspondence vanishing on the old part does not itself establish the isogeny on the new quotient. Every use of that isogeny requires the separate theorem.

| Layer here | Mathematical output | Owning layer |
| --- | --- | --- |
| EC.1 | Three explicit thresholds and Martin's dimension bound | EllipticModularityEffectiveComparisons:EC.0, EC.2 |
| EC.2 | The norm estimate and the removed-prime bound | EllipticModularityEffectiveComparisons:EC.1, EC.3 |
| EC.3 | Rational coefficients and an exact-conductor elliptic curve | EllipticModularityEffectiveComparisons:EC.3 |
| EC.4 | Full rational two-torsion and the conductor adapter | EllipticModularityEffectiveComparisons:EC.3 |
| EC.5 | Uniform irreducibility with rational two-torsion | EllipticModularityEffectiveComparisons:EC.4, EC.5; ArithmeticGaloisRepresentations:R01.4 |
| EC.6 | Rational-isogeny uniform surjectivity | EllipticModularityEffectiveComparisons:EC.5 |

## Conventions

Fix an algebraic closure of ℚ. All elliptic curves are over ℚ unless another field is displayed. A prime-torsion representation means the action on geometric torsion; isomorphisms are equivariant for the absolute Galois group of ℚ.

- M is the conductor of an elliptic curve E, and Δ is its minimal discriminant. The integer ord_q(Δ) is the valuation exponent. The notation q ∥ M means that q has exponent exactly one in M.
- For a positive level N, μ(N) is the index [SL₂(ℤ):Γ₀(N)], with μ(N)=N∏_{q|N}(1+1/q). The number g⁺(N) is the complex dimension of the weight-two newspace on Γ₀(N) with trivial character. When using the Tau Ceti Γ₁(N) newspace, take its trivial-character part. The whole Γ₁(N) space has a different dimension.
- N(E[ℓ]) is the Artin conductor away from ℓ, so ℓ does not divide it. Serre weight means the weight in the refined modularity statement for the residual representation.
- M₀ is the deletion level `SerreWeightAndLevelOptimisation:R20.6/reduced-level-of-elliptic-curve`: divide M by the product of the primes q ∥ M for which ℓ divides ord_q(Δ). This product can include q=ℓ. M₀ need not equal N(E[ℓ]). Retain the local reduction and weight hypotheses in every adapter between them.
- Full rational two-torsion means E[2]⊆E(ℚ), including all four points. One rational point of order two means one nonzero rational element of E[2].
- A rational cyclic n-isogeny has a Galois-stable geometric cyclic kernel of order n; the individual kernel points need not be rational.
- Non-CM means End(E over the algebraic closure)=ℤ. Endomorphisms defined only over ℚ do not express this condition.
- A nonsplit Cartan in GL₂(𝔽_p) is the multiplicative group of 𝔽_{p²} acting by multiplication in a chosen 𝔽_p-basis. Its normalizer has index two over it; use conjugacy-invariant containment statements.
- Mixed modular curves are smooth projective normalizations of the indicated fibre products. Write X₀⁺(rp²)=X₀(rp²)/w_{p²}; this involution preserves the r-level.
- F, G and H are real-valued. Division by 6 is real division, the square root precedes the power, and every comparison with ℓ is strict. In G, use lcm(N,4).

Suggested home for the imported interfaces: the modules and namespace of EllipticModularityEffectiveComparisons, including `TauCeti.EffectiveEllipticComparison`. This roadmap adds no parallel arithmetic or geometric carriers. [Suggested.lean](Suggested.lean) records the Mathlib arithmetic checks for the imports. It is not an exhaustive specification; this document gives the mathematical requirements, including imports whose native signatures belong to their supplying roadmap.

## Layers

### EC.1. Thresholds and sharp newspace dimensions

Kraus's comparison theorems are effective because their thresholds are explicit functions of a level. Two numbers attached to a positive integer N enter: the index μ(N) of Γ₀(N) in SL₂(ℤ), which is N times the product of 1 + 1/q over the primes q dividing N, and the dimension g⁺(N) of the space of weight-two newforms on Γ₀(N) with trivial character. The threshold F controls rationality of a newform, G controls a congruence modulo 4, and H is their maximum. All three are real numbers and are used in strict inequalities ℓ > F(N), ℓ > G(N), ℓ > H(N). The division by 6 is a real division and the square root is taken before the power; the level in G is lcm(N, 4).

Martin's theorem bounds g⁺(N) by (N + 1)/12 and says exactly when equality holds. It is what turns a bound in terms of the degree of a coefficient field into a bound in terms of the level alone.


#### Kraus's rationality threshold F

For N ≥ 1, with μ(N) = [SL₂(ℤ) : Γ₀(N)] and g⁺(N) the complex dimension of the weight-two newspace of Γ₀(N) with trivial character, F(N) = (√(μ(N)/6) + 1)^(2g⁺(N)), a real number.

**Source:** [Kraus](#references), §3.1, equation (7), p. 1143.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.2/kraus-f`.

**Construction or proof route.** Use the native congruence index and the trivial-character newspace dimension. The formula is evaluated after embedding these nonnegative numbers into ℝ. The exponent is twice the actual dimension, including the dimension-zero case.

#### Kraus's two-torsion threshold G

For N ≥ 1, G(N) = (√(μ(lcm(N, 4))/6) + 1)², a real number; the level is lcm(N, 4), not 4N and not the radical of N.

**Source:** [Kraus](#references), §3.1, equation (8), p. 1144.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.2/kraus-g`.

**Construction or proof route.** First form L=lcm(N,4), then evaluate its congruence index. This distinguishes the threshold from a formula using 4N: N=4 must give L=4. Levels 1 and 2 also have L=4.

#### Kraus's comparison threshold H

For N ≥ 1, H(N) = max(F(N), G(N)).

**Source:** [Kraus](#references), §3.1, equation (9), p. 1144.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.2/kraus-h`.

**Construction or proof route.** The maximum combines two independent requirements. Its order API must identify ℓ>H(N) with the conjunction ℓ>F(N) and ℓ>G(N). At N=11 the second threshold is larger, so retaining only F loses the two-torsion conclusion.

#### Martin's sharp weight-two newspace bound

For every N ≥ 1, 12·g⁺(N) ≤ N + 1, with equality exactly when N = 35 or N is a prime congruent to 11 modulo 12.

**Source:** [Martin](#references), Theorem 2, p. 3; §4, Lemmas 16–22 and its proof, pp. 14–16 (v1).

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.0/martin-bound`, `EllipticModularityEffectiveComparisons:EC.0/dimension-comparison`.

**Construction or proof route.** Identify the arithmetic dimension expression with the native trivial-character newspace before applying its bound. The proof uses the prime-power local factors, the old/new decomposition and convolution inversion, then Martin’s separate estimates and finite exceptional checks. Numerical verification of the formula alone does not identify the modular space.

### EC.2. Removed-prime exponent bounds

Let E[ℓ] be irreducible. When ℓ divides the exponent of a prime p ∥ M, p ≠ ℓ, in the minimal discriminant, p leaves the level: the residual representation E[ℓ] comes from a newform f of level M₀ prime to p, and the Frobenius comparison at p reads p + 1 ≡ ±c_p modulo a prime λ above ℓ. The algebraic integer p + 1 ∓ c_p is nonzero, because every conjugate of c_p has absolute value at most 2√p < p + 1, and it lies in λ, so ℓ divides its norm. The norm is at most (√p + 1)^(2d) with d the degree of the coefficient field of f, and d ≤ g⁺(M₀) ≤ (M₀ + 1)/12. This gives the bound of the layer. The level M₀ is the deletion level: M divided by the primes q ∥ M with ℓ | ord_q(Δ), where ord_q is the exponent of q. A factor ℓ can remain in M₀: it does when E has additive reduction at ℓ, and when ℓ ∥ M with ℓ ∤ ord_ℓ(Δ). So M₀ is in general not the prime-to-ℓ conductor of E[ℓ].


#### The norm bound behind a congruence

Let K be a number field of degree d, λ a prime of its ring of integers above the rational prime ℓ, and x a nonzero element of λ whose image under every embedding K → ℂ has absolute value at most B. Then ℓ ≤ |Norm_{K/ℚ}(x)| ≤ B^d.

**Source:** [BS](#references), §2, proof of Lemma 2.2, p. 359; general consequence of the cited Mathlib product formula.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.1/prime-divides-integral-norm`, `EllipticModularityEffectiveComparisons:EC.1/trace-norm`, `EllipticModularityEffectiveComparisons:EC.3/bounded-integer-trace-norm`, `mathlib:Algebra.norm_eq_prod_embeddings`, `mathlib:AlgHom.card`.

**Construction or proof route.** Read x as an algebraic integer in the prime λ of O_K. Divisibility of its nonzero integral norm gives the lower bound. For the upper bound, multiply the absolute-value estimates over all d embeddings into ℂ. `Algebra.norm_eq_prod_embeddings` provides the product, and `AlgHom.card` provides exactly d factors for a finite separable extension. Since x≠0, its image under every embedding is nonzero; thus B>0 suffices, with no B≥1 assumption.

#### The removed-prime exponent bound

Let E/ℚ have conductor M and minimal discriminant Δ, let ℓ ≥ 3 be a prime with E[ℓ] irreducible, and let M₀ be M divided by the primes q with q ∥ M and ℓ | ord_q(Δ). If p ≠ ℓ is a prime with p ∥ M and ℓ | ord_p(Δ), then ℓ ≤ (√p + 1)^((M₀+1)/6).

**Source:** [BS](#references), §2, Lemmas 2.1–2.2 and proof, p. 359.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.1/removed-prime-bound`, `EllipticModularityEffectiveComparisons:EC.1/removed-prime-degree-bound`, `EllipticModularityEffectiveComparisons:EC.1/coefficient-orbit-degree`, `EllipticModularityEffectiveComparisons:EC.1/real-exponent-bound`, `EllipticModularityEffectiveComparisons:EC.1/trace-gap`.

**Construction or proof route.** Level lowering at p yields p+1≡±c_p modulo λ. All conjugates satisfy |c_p|≤2√p, so p+1∓c_p is nonzero and its norm has absolute value at most (√p+1)^(2d). Bound d by g⁺(M₀), apply EC.1, and compare positive real powers. The deleted-prime condition and p≠ℓ are needed before the unramified Frobenius comparison.

### EC.3. Rationality and exact-conductor realization

Kraus's first theorem starts from E[ℓ], irreducible, of Serre weight 2 and of prime-to-ℓ Artin conductor N, with ℓ ≥ 5. Modularity, with the optimisation of level and weight, gives a newform f of weight two and level exactly N with trivial character whose residual representation at a prime λ above ℓ is E[ℓ]. If some coefficient c_q with q ≤ μ(N)/6 and q ∤ N were not an integer, then c_q minus the integer it is congruent to modulo λ (the trace of Frobenius of E at q, or ±(q + 1) if E has multiplicative reduction at q) would be a nonzero element of λ of norm at most (√q + 1)^(2d) ≤ F(N), against ℓ > F(N). So the coefficients at the primes up to μ(N)/6 are integers; the recurrences for the coefficients and the Sturm bound in characteristic zero then make f equal to all its conjugates, and f is rational. A rational newform of level N gives an elliptic curve of conductor exactly N with the same residual representation.


#### Rationality from finitely many prime coefficients

If a normalized newform f of weight two, level N and trivial character has c_q ∈ ℤ for every prime q ≤ μ(N)/6, then every Fourier coefficient of f is in ℤ.

**Source:** [Kraus](#references), §3.2, Lemma 1 and proof, pp. 1144–1145.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.3/rationality-from-small-primes`.

**Construction or proof route.** Apply Galois conjugation at the same primitive level and trivial character. The Hecke recurrences extend equality at the tested primes to equality of the coefficients through the Sturm bound. The characteristic-zero Sturm theorem then identifies f with every conjugate. All coefficients are algebraic integers, so rationality makes them integers.

#### Integrality of the small prime coefficients above F(N)

Let ℓ ≥ 5 be prime, E/ℚ with E[ℓ] irreducible of Serre weight 2 and prime-to-ℓ conductor N, and f a normalized newform of weight two, level N and trivial character whose residual representation at a prime above ℓ is E[ℓ]. If ℓ > F(N), then c_q ∈ ℤ for every prime q ≤ μ(N)/6.

**Source:** [Kraus](#references), §3.2, proof of Theorem 3, p. 1145.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.3/rational-coefficient-forcing`, `EllipticModularityEffectiveComparisons:EC.3/exact-weight-two-lift`, `EllipticModularityEffectiveComparisons:EC.3/nonrational-witness`, `EllipticModularityEffectiveComparisons:EC.3/small-prime-below-f`, `EllipticModularityEffectiveComparisons:EC.3/bounded-integer-trace-norm`.

**Construction or proof route.** Choose a nonintegral prime coefficient below the bound if f is not rational. At a good prime its congruent integer is the trace of E; at a removed multiplicative prime it is ±(q+1). The coefficient difference is a nonzero element of λ. Its conjugate norm is bounded by F(N), contradicting ℓ>F(N). Keep the coefficient prime, exact primitive level and weight-two lift in this argument; abstract residual modularity does not specify them.

#### The elliptic curve of a rational newform

A normalized newform f of weight two, exact level N and trivial character with integer coefficients has an elliptic curve F/ℚ of conductor exactly N with a_q(F) = c_q at the primes of good reduction; if ℓ ≥ 5 is prime and the residual representation of f at a prime above ℓ is an irreducible E[ℓ], then F[ℓ] ≅ E[ℓ] as representations of the absolute Galois group of ℚ.

**Source:** [Kraus](#references), §3.1, rational-coefficient paragraph before equation (7), p. 1143.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.3/rational-form-elliptic-realization`.

**Construction or proof route.** Use the one-dimensional quotient of J₀(N) from `ModularCurvesPartII:R14.5` and the exact conductor theorem from `AutomorphicGaloisRepresentations:R19.4`. Equality of the Frobenius traces and irreducibility identify the residual representations. Exact level is needed to conclude conductor N rather than a divisor of N.

#### Kraus's rational comparison theorem

For E/ℚ and a prime ℓ ≥ 5 with E[ℓ] irreducible of Serre weight 2 and prime-to-ℓ conductor N, if ℓ > F(N) there is an elliptic curve F/ℚ of conductor exactly N with F[ℓ] ≅ E[ℓ].

**Source:** [Kraus](#references), §3.1, Theorem 3, p. 1144.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.3/kraus-rational-realization`.

**Construction or proof route.** Combine the optimized weight-two lift, the preceding rationality argument and the elliptic realization of a rational newform. Modularity of E is the parent input. The conclusion is an isomorphism of residual representations, rather than just a congruence at a chosen finite list of primes.

### EC.4. Full rational two-torsion realization

If E has full rational two-torsion, the comparison curve C of the preceding layer need not have it, but its point counts show a trace of it. For ℓ > G(N) and a prime q ∤ 2N with q ≤ μ(lcm(N, 4))/6, the traces of E and of C at q are congruent modulo ℓ and differ by less than ℓ, so they are equal, and #C(𝔽_q) = #E(𝔽_q) is divisible by 4 (bad reduction of E at such a prime is excluded by the same inequality). A congruence criterion of Sturm type modulo 4, at level lcm(N, 4), extends the divisibility from these finitely many primes to every prime q ∤ 2N. By Chebotarev's theorem the condition constrains the action of Galois on C[4], and it follows that C, or the quotient of C by its rational point of order two, has full rational two-torsion. The isogeny has degree 1 or 2, so it changes neither the conductor nor the representation on ℓ-torsion.

The theorems of this layer and the preceding one are stated at the residual conductor N(E[ℓ]). The removed-prime bound is stated at the deletion level M₀. The two levels agree under a condition on the reduction of E at ℓ, and an application that uses both must check it.


#### Finite recognition of point counts modulo four

For a (modular) elliptic curve C/ℚ of conductor N, 4 divides #C(𝔽_q) for every prime q ∤ 2N as soon as it does so for every such prime q ≤ μ(lcm(N, 4))/6.

**Source:** [Kraus](#references), Appendix II (§8), Proposition 2 and Corollary, pp. 1158–1159.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.3/finite-four-count-witness`, `EllipticModularityEffectiveComparisons:EC.3/prime-power-ideal-sturm`, `EllipticModularityEffectiveComparisons:EC.3/filtered-coefficients`, `EllipticModularityEffectiveComparisons:EC.3/odd-eisenstein-series`, `EllipticModularityEffectiveComparisons:EC.3/local-mod-four-filters`.

**Construction or proof route.** The equivalent contrapositive gives a witness below μ(lcm(N,4))/6 whenever divisibility fails. Apply the integral prime-power-ideal Sturm theorem to filtered coefficients of the newform and the odd Eisenstein series. A Sturm equality theorem over ℂ is insufficient for this congruence modulo four.

#### Transfer of the point counts to the comparison curve

Let ℓ ≥ 5 be prime, E/ℚ with full rational 2-torsion and E[ℓ] irreducible of Serre weight 2 and prime-to-ℓ conductor N, and C/ℚ of conductor exactly N with C[ℓ] ≅ E[ℓ]. If ℓ > G(N), then 4 divides #C(𝔽_q) for the primes q ∤ 2N.

**Source:** [Kraus](#references), §3.3, equations (10)–(11) and trace comparison, p. 1146.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.3/mod-four-trace-transfer`, `EllipticModularityEffectiveComparisons:EC.3/small-prime-below-g`.

**Construction or proof route.** Argue from a small witness supplied by the preceding criterion. If E has bad reduction there, the removed-prime congruence and the Hasse estimate contradict ℓ>G(N). Otherwise both curves have good reduction: their congruent integer traces differ by less than ℓ and hence are equal. Full two-torsion then forces the point count to be divisible by four. This argument proves the all-primes divisibility conclusion; good reduction and trace equality are intermediate facts at the tested primes.

#### Repair of rational two-torsion by a two-isogeny

If C/ℚ has 4 | #C(𝔽_q) at every odd prime of good reduction, there is an isogeny C → F over ℚ of degree 1 or 2 onto a curve with full rational 2-torsion; it preserves the conductor and, for odd ℓ, the representation on ℓ-torsion.

**Source:** [Kraus](#references), §3.3, final two-isogeny paragraph, p. 1146.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.3/four-count-rational-two`, `EllipticModularityEffectiveComparisons:EC.3/four-count-square-classes`, `EllipticModularityEffectiveComparisons:EC.3/four-count-full-two-selection`, `EllipticModularityEffectiveComparisons:EC.3/kraus-full-two-realization`.

**Construction or proof route.** Use Chebotarev on C[4]. It first supplies a rational point P of order two. If C already has full two-torsion, use the identity. Otherwise the quotient C/⟨P⟩ has full rational two-torsion. The degree is two, so prime-to-degree torsion equivalence transports every odd-ℓ representation; rational isogenies preserve the conductor.

#### Kraus's full two-torsion realization

If E/ℚ has full rational 2-torsion, ℓ ≥ 5 is prime, E[ℓ] is irreducible of Serre weight 2 and prime-to-ℓ conductor N, and ℓ > H(N), then there is an elliptic curve F/ℚ of conductor exactly N with full rational 2-torsion and F[ℓ] ≅ E[ℓ].

**Source:** [Kraus](#references), §3.1, Theorem 4, p. 1144; §3.3, pp. 1145–1146.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.3/kraus-full-two-realization`.

**Construction or proof route.** First use ℓ>F(N) to obtain C of conductor N. Then use ℓ>G(N) to transfer the mod-four point-count condition and apply the isogeny repair. The maximum H supplies both strict inequalities. Full two-torsion is a condition on E as well as on the chosen F.

#### From the deletion level to the residual conductor

Kraus's theorems are stated at the prime-to-ℓ conductor N(E[ℓ]) and Serre weight 2; an application at the deletion level M₀ needs N(E[ℓ]) = M₀ and weight 2 as separate facts.

**Source:** [BS](#references), §2, Theorems 3–4, pp. 359–360; application adapter with separate local-conductor and weight hypotheses.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.3/deletion-conductor-away`, `EllipticModularityEffectiveComparisons:EC.3/deletion-level-exact-adapter`.

**Construction or proof route.** Use the away-from-ℓ conductor formula first. For ℓ≥5, the adapter gives M₀=N(E[ℓ]) if E has good reduction at ℓ, or multiplicative reduction there with ℓ|ord_ℓ(Δ). For ℓ≥11, the specified local weight-two theorem supplies this reduction alternative. For ℓ=5 or 7, retain it as an explicit hypothesis. An additive prime ℓ can remain in M₀ even though N(E[ℓ]) is prime to ℓ.

### EC.5. Uniform two-torsion irreducibility

A reducible E[ℓ] has an invariant line, which is a Galois-stable cyclic subgroup of order ℓ; its points need not be rational. With a rational point of order two, the sum of the two subgroups is a stable cyclic subgroup of order 2ℓ. With full rational two-torsion, a stable cyclic subgroup of order 4 exists on the quotient of E by one of the points of order two (the kernel of the composite E/T → E → E/T′ for two distinct rational subgroups T, T′ of order 2), and with the transported line it gives a cyclic subgroup of order 4ℓ. The degrees of rational cyclic isogenies of elliptic curves over ℚ are known: they are the integers from 1 to 19 and 21, 25, 27, 37, 43, 67, 163. No 2ℓ with ℓ ≥ 11 and no 4ℓ with ℓ ≥ 5 is among them, which gives the two irreducibility statements. They hold for every curve with the stated two-torsion, with or without complex multiplication. A curve with a cyclic 14-isogeny shows that ℓ ≥ 11 cannot be lowered to ℓ ≥ 7 in the statement with one point of order two.


#### Mazur's theorem on isogenies of prime degree

If E/ℚ has a rational cyclic isogeny of prime degree r, then r ∈ {2, 3, 5, 7, 11, 13, 17, 19, 37, 43, 67, 163}; if moreover E has no complex multiplication over an algebraic closure, then r ∈ {2, 3, 5, 7, 11, 13, 17, 37}.

**Source:** [Mazur](#references), Theorem 1, pp. 129–130; introduction table and CM discussion, p. 129; §7, Theorem 7.1, pp. 153–155.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.4/mazur-prime-isogeny-classification`, `EllipticModularityEffectiveComparisons:EC.5/large-prime-isogeny-cm`.

**Construction or proof route.** The prime-degree theorem uses the Eisenstein quotient, cusp formal immersion, isogeny character and its local/global cases. The non-CM refinement excludes the CM-only prime degrees 19,43,67,163. Retain the distinction between a rational cyclic subgroup and a rational generator throughout.

#### No cyclic isogenies of degree 2ℓ or 4ℓ

No elliptic curve over ℚ has a rational cyclic isogeny of degree 2ℓ for a prime ℓ ≥ 11, or of degree 4ℓ for a prime ℓ ≥ 7.

**Source:** [BS](#references), §3, irreducibility applications in Lemmas 3.3 and 3.5, pp. 361–363; the composite-degree exclusions are imported from the separate Mazur–Kenku node.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.4/mazur-kenku-cyclic-degrees`.

**Construction or proof route.** Use the full Mazur–Kenku degree classification {1,…,19,21,25,27,37,43,67,163}. No degree 2ℓ for ℓ≥11 or 4ℓ for ℓ≥7 occurs. The prime-degree theorem by itself does not exclude these composite degrees; the supplier’s composite-level point and descent arguments are required.

#### From two-torsion and an invariant line to a cyclic isogeny

Let ℓ be an odd prime and E/ℚ have a Galois-stable subgroup of order ℓ. If E has a rational point of order 2, it has a rational cyclic isogeny of degree 2ℓ; if E has full rational 2-torsion, a curve isogenous to E over ℚ has a rational cyclic isogeny of degree 4ℓ.

**Source:** [BS](#references), §3, Lemmas 3.3 and 3.5, pp. 361–363; derived coprime-kernel and dual-isogeny argument, not a separately stated source lemma.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.4/rational-two-times-prime`, `EllipticModularityEffectiveComparisons:EC.4/full-two-cyclic-four`, `EllipticModularityEffectiveComparisons:EC.4/full-two-times-prime`.

**Construction or proof route.** For one rational two-torsion point, take the sum of its kernel and the odd-ℓ stable line: coprime cyclic kernels give a cyclic kernel of order 2ℓ. For full two-torsion, use distinct rational subgroups T,T′ of order two. The composite E/T→E→E/T′ has cyclic kernel of order four; transport the stable ℓ-line and combine the coprime kernels. This second curve is isogenous to E, rather than necessarily E itself.

#### Irreducibility with full rational two-torsion

If E/ℚ has full rational 2-torsion and ℓ ≥ 7 is prime, then E[ℓ] is irreducible, and absolutely irreducible.

**Source:** [BS](#references), §3, Lemma 3.3 proof, p. 362; absolute irreducibility uses the separately imported oddness lemma.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.4/irreducible-full-two`, `ArithmeticGaloisRepresentations:R01.4/odd-irreducible-implies-absolutely-irreducible`.

**Construction or proof route.** A reducible E[ℓ] would give the stable line used in the preceding construction, hence a forbidden 4ℓ-isogeny on an isogenous curve. Irreducibility is uniform in E. For the absolute upgrade use oddness of the elliptic representation and `ArithmeticGaloisRepresentations:R01.4/odd-irreducible-implies-absolutely-irreducible`; irreducibility of an arbitrary finite-field representation would not suffice.

#### Irreducibility with a rational point of order two

If E/ℚ has a rational point of order 2 and ℓ ≥ 11 is prime, then E[ℓ] is irreducible, and absolutely irreducible.

**Source:** [BS](#references), §3, Lemma 3.5 proof, p. 363; absolute irreducibility uses the separately imported oddness lemma.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.4/irreducible-one-two`, `ArithmeticGaloisRepresentations:R01.4/odd-irreducible-implies-absolutely-irreducible`.

**Construction or proof route.** A reducible E[ℓ] gives a forbidden 2ℓ-isogeny on E. Upgrade to absolute irreducibility by the same oddness lemma. The lower bound cannot be replaced by ℓ≥7: a rational cyclic 14-isogeny supplies a counterexample with a rational point of order two.

### EC.6. Rational-isogeny uniformity

Lemos's theorem is Serre's uniformity statement for the curves that have a rational cyclic isogeny. Let E have no complex multiplication and a rational cyclic isogeny of prime degree r, and let p > 37. If the representation on E[p] is not surjective, its image lies in the normalizer of a nonsplit Cartan subgroup: the Borel case is excluded by Mazur's theorem, the exceptional images by Serre's bound on inertia, and the split Cartan case by the theorem of Bilu, Parent and Rebolledo. For r in {11, 17, 37} the curve has one of six explicit j-invariants. For r in {2, 3, 5, 7, 13} the curve gives a rational point on the curve X₀(r) ×_{X(1)} X_ns⁺(p); a quotient of its Jacobian with finitely many rational points and a formal immersion at the cusps show that j(E) has no prime other than p in its denominator, and the local behaviour at p of a nonsplit Cartan image shows that p is not in the denominator either. So j(E) is an integer, and on the genus-zero curve X₀(r) the integral values of j are finitely many, explicit numbers. Surjectivity for p > 37 at each of the finitely many j-invariants, which depends only on j because quadratic twisting preserves it, completes the proof.

The curve X₀⁺(rp²) of the argument is the quotient of X₀(rp²) by the Atkin–Lehner involution w_{p²}, which keeps the level structure at r; it is not the quotient by w_{rp²}.


#### Potential good reduction under a nonsplit Cartan image

If p ≥ 5 is prime and the image of the Galois representation on E[p] lies in the normalizer of a nonsplit Cartan subgroup, then E has potentially good reduction at p and at every prime q ≢ ±1 mod p.

**Source:** [Lemos](#references), §2, Proposition 2.2 and proof, pp. 4–5 (v2).

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.5/nonsplit-potential-multiplicative`.

**Construction or proof route.** Use the quadratic-twist Tate description at a potentially multiplicative prime. Squaring elements of the normalizer places them in the nonsplit Cartan. Its eigenvalue structure forces the square of the local cyclotomic character to be trivial. At q=p this contradicts p≥5; at q≠p it forces q≡±1 modulo p. This uses local torsion at residue characteristic possibly different from p.

#### The Cartan correspondence and Chen's isogeny

For r ∈ {2, 3, 5, 7, 13} and a prime p outside that set, the correspondence through X₀(r) ×_{X(1)} X(p)/(N_sp ∩ N_ns) maps the Jacobian of X₀(rp²)/w_{p²} to the Jacobian of X₀(r) ×_{X(1)} X_ns⁺(p), commutes with the Hecke operators T_n for n prime to p, and vanishes on the p-old part. Chen's theorem that the induced map on the p-new quotient is an isogeny is a separate imported prerequisite.

**Source:** [Lemos](#references), §3, correspondence and Lemma 3.2, p. 9; Theorem 3.3, p. 9 (v2), for the separate isogeny input.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.5/cartan-correspondence-kills-old`.

**Construction or proof route.** Construct the pull-push map through the normalized correspondence and identify the split quotient with X₀(rp²)/w_{p²}. The equality N_ns B⁺=N_ns B⁻=GL₂(𝔽_p) sends old divisors to old divisors, and X₀(r) has genus zero. For the induced map on the p-new quotient to be an isogeny, import Chen’s separate theorem through the modular-curve continuation. The old-part calculation and prime-to-p Hecke commutation are necessary but do not prove it.

#### The winding quotient of rank zero

For r ∈ {2, 3, 5, 7, 13} and a prime p outside that set, the Jacobian of X₀(r) ×_{X(1)} X_ns⁺(p) has a nonzero optimal quotient A over ℚ with A(ℚ) finite, whose kernel is stable under T_n for n prime to p.

**Source:** [Lemos](#references), §3, Theorem 3.4 and proof sketch, p. 10 (v2).

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.5/finite-winding-quotient`, `EllipticModularityEffectiveComparisons:EC.5/winding-period-component`, `EllipticModularityEffectiveComparisons:EC.5/winding-class-nonzero`.

**Construction or proof route.** Use Chen’s prime-to-p Hecke-equivariant isogeny to transfer the winding construction to the mixed Jacobian. Project the winding class to the full-new part, quotient by its integral Hecke annihilator, prove the quotient nonzero, and apply rank-zero results to every surviving modular abelian factor. `RankZeroOneBSD:BSD.4` alone covers elliptic factors and requires a higher-dimensional extension here. For r=5,7,13 require the winding boundary/nonvanishing argument in addition to the Darmon–Merel r=2,3 cases.

#### Formal immersion at a cusp, and the torsion image of a rational point

For r ∈ {2, 3, 5, 7, 13}, prime p > 37 and prime q ≡ ±1 mod p, let A be the specified optimal winding quotient of the preceding target, K = ℚ(ζ_p)⁺, and ∞ a cusp defined over K. The Abel–Jacobi map P ↦ [(P) − (∞)], followed by projection to A, extends from the smooth locus of the canonical integral model of the normalized mixed curve X₀(r) ×_{X(1)} X_ns⁺(p) over the localization of the integers of K at a prime above q to the Néron model of A, and is a formal immersion at ∞ in characteristic q. For the same r and A and any prime p outside {2, 3, 5, 7, 13}, the image in A(K) of each ℚ-rational point of the mixed curve is torsion.

**Source:** [DarmonMerel](#references), §8, Lemmas 8.2–8.3, pp. 22–23 (author copy); Lemos §3 conclusion, p. 10 (v2), for the extended range.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.5/cartan-cusp-formal-immersion`, `EllipticModularityEffectiveComparisons:EC.5/cartan-point-torsion`, `EllipticModularityEffectiveComparisons:EC.5/cartan-cusp-residue`.

**Construction or proof route.** The quotient A is the winding quotient with its integral Hecke and cotangent properties, not an arbitrary rank-zero quotient. Work at a prime of the integers of K above q, on the smooth integral locus, and compare completed local rings at the cusp. The needed coefficient-support/degeneracy lemma is in characteristic q with q∤rp and q>3. For the point-torsion assertion, Manin–Drinfeld makes a multiple of the cusp difference descend to A(ℚ); finiteness of A(ℚ) then proves torsion in A(K). The formal immersion and point-torsion statements have the two different p-ranges displayed above.

#### Integrality of j away from p

For r ∈ {2, 3, 5, 7, 13}, a prime p > 37, and E/ℚ with a rational cyclic r-isogeny whose mod-p image lies in the normalizer of a nonsplit Cartan subgroup, j(E) ∈ ℤ[1/p].

**Source:** [Lemos](#references), Theorem 1.4, p. 3; §3 conclusion, p. 10 (v2); indexed range restricted to p > 37.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.5/cartan-denominator-exclusion`.

**Construction or proof route.** A denominator prime q≠p makes the noncuspidal point meet a cusp. Its residue field forces q≡±1 modulo p. The point image is torsion and specializes to zero; full torsion injection over the unramified local field, with e=1<q−1, kills it. Formal immersion then identifies the point section with the cusp section, a contradiction. Use the smooth integral model, the specified winding quotient and `NeronModelsAndSemistableAbelianVarieties:R11.5`.

#### Integrality of j

For r ∈ {2, 3, 5, 7, 13}, a prime p > 37, and E/ℚ without complex multiplication, with a rational cyclic r-isogeny and a mod-p representation that is not surjective, j(E) is an integer.

**Source:** [Lemos](#references), §2, Proposition 2.1, p. 4; Theorem 2.3, p. 6 (v2); indexed range restricted to p > 37.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.5/integral-j-forcing`.

**Construction or proof route.** First use the proper-image classification to obtain a nonsplit Cartan normalizer. The preceding target removes every denominator prime except p; potential good reduction at p removes that last one. Endomorphisms over the algebraic closure and p>37 are part of the proper-image input. The source proposition itself has a wider range under explicit nonsplit containment.

#### Integral j-values at the five genus-zero levels

For r ∈ {2, 3, 5, 7, 13} there is a coordinate t on X₀(r) with j = f_r(t)/t, where f₂ = (t+16)³, f₃ = (t+27)(t+3)³, f₅ = (t²+10t+5)³, f₇ = (t²+5t+1)³(t²+13t+49), f₁₃ = (t⁴+7t³+20t²+19t+1)³(t²+5t+13); a noncuspidal rational point with j ∈ ℤ has t a nonzero integer dividing f_r(0).

**Source:** [Lemos](#references), §2, numerator table and integral-parameter proof, pp. 6–7 (v2).

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.5/genus-zero-j-numerators`, `EllipticModularityEffectiveComparisons:EC.5/genus-zero-j-map`, `EllipticModularityEffectiveComparisons:EC.5/integral-parameter-divisibility`, `EllipticModularityEffectiveComparisons:EC.5/finite-integral-j`, `EllipticModularityEffectiveComparisons:EC.5/integral-j-characterisation`.

**Construction or proof route.** Use the modular j-map in the specified coordinate; a generic genus-zero parametrization does not determine these polynomials. If t=a/b in lowest terms and f_r(t)/t is integral, monicity forces b=1, and then t divides f_r(0). Evaluate both positive and negative divisors and identify equal j-values. The coordinate/j-map theorem and the rational-point models belong to `ModularCurvesPartII:R12.5`; arithmetic evaluation alone does not prove that every value is modular.

#### A proper image for p > 37 is of nonsplit Cartan type

For E/ℚ without complex multiplication and a prime p > 37, if the representation on E[p] is not surjective onto GL₂(𝔽_p), its image lies in the normalizer of a nonsplit Cartan subgroup.

**Source:** [Lemos](#references), §2, Theorem 2.3, p. 6 (v2).

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.5/proper-image-nonsplit`, `EllipticModularityEffectiveComparisons:EC.5/exceptional-projective-exclusion`, `EllipticModularityEffectiveComparisons:EC.5/projective-inertia-order`, `EllipticModularityEffectiveComparisons:EC.5/split-cartan-exclusion`.

**Construction or proof route.** Exclude the Borel case by the non-CM prime-isogeny list, the exceptional projective cases by Serre’s quantitative inertia argument, and the split Cartan case by Bilu–Parent–Rebolledo. Use `ArithmeticGaloisRepresentations:R01.4` for the subgroup classification. The split Cartan input includes the quantitative large-prime estimates and the finite certified sieve, rather than just an assertion that a proper image has familiar types.

#### Surjectivity is a property of the j-invariant

For a prime p ≥ 5, two elliptic curves over ℚ that are quadratic twists of one another have surjective mod-p representations simultaneously.

**Source:** [Lemos](#references), §2, proof of Theorem 1.1, p. 5 (v2); universal quadratic-twist statement is the derived group argument.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.5/quadratic-twist-surjectivity`.

**Construction or proof route.** Write the twist representation as χ⊗ρ for a quadratic character χ. For p≥5 use the group structure of GL₂(𝔽_p), including its SL₂ subgroup, to show that multiplication by these scalar signs preserves surjectivity in both directions. Curves with the same non-CM j-invariant are quadratic twists. Neither the CM j-values 0,1728 nor the unused p=3 case is needed for the final theorem.

#### Surjectivity at the finitely many rational j-values

For each j-value without complex multiplication among the rational noncuspidal points of X₀(11), X₀(17), X₀(37), namely −11·131³, −11², −17²·101³/2, −17·373³/2¹⁷, −7·137³·2083³, −7·11³, and each one among the integral j-values of the five genus-zero levels, every E/ℚ with that j-invariant has surjective mod-p representation for every prime p > 37.

**Source:** [Lemos](#references), §2, proof of Theorem 1.1 and finite j-lists, pp. 5–7 (v2); with an all-primes certificate required.

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.5/large-isogeny-j-table`, `EllipticModularityEffectiveComparisons:EC.5/large-isogeny-image-certificates`, `EllipticModularityEffectiveComparisons:EC.5/small-isogeny-image-certificates`.

**Construction or proof route.** Use exact rational-point tables for X₀(11), X₀(17), X₀(37) and the signed-divisor sets from the five genus-zero levels. Exclude the CM values using certified endomorphism checks. For each remaining j, supply a curve model and a certificate bounding every exceptional prime, with the local/isogeny/subgroup witnesses for any exceptions. A finite set of Frobenius computations or a finite sample of primes does not prove the all-p statement.

#### Lemos's theorem

If E/ℚ has no complex multiplication over an algebraic closure and has a rational cyclic isogeny of degree greater than 1, then the representation of the absolute Galois group of ℚ on E[p] is surjective onto GL₂(𝔽_p) for every prime p > 37.

**Source:** [Lemos](#references), Theorem 1.1, p. 2; §2 proof, pp. 5–7 (v2).

**Imports and prerequisites:** `EllipticModularityEffectiveComparisons:EC.5/lemos-surjectivity`.

**Construction or proof route.** A nontrivial cyclic isogeny yields a rational prime-degree isogeny. The non-CM degree list reduces r to {2,3,5,7,11,13,17,37}. For r=11,17,37 use the finite rational j-table. For r=2,3,5,7,13 a proper image forces integral j, reducing to the finite signed-divisor table. The uniform image certificates and quadratic-twist invariance then contradict the assumed failure for any p>37.

## Imported definitions and their usable interfaces

The following definitions are supplied by EllipticModularityEffectiveComparisons. Use the named API and examples there to make the imports usable without unfolding their internal representations. These are interface requirements of the supplying development; do not duplicate its definitions in a second namespace.

### Martin’s prime-power correction table

**Supplier:** `EllipticModularityEffectiveComparisons:EC.0/local-factors`.

Define localTerms(p,e) in Q^5, ordered (s,v∞,v2,v3,m), with e=0 giving (1,1,1,1,1). For a prime p and e≥1: s is 1−1/p for e=1, 1−1/p−1/p² for e=2, and (1−1/p)(1−1/p²) for e≥3. v∞ is 0 for odd e, p−2 for e=2, and p^(e/2−2)(p−1)² for even e≥4. For v2, at p=2 the values for e=1,2,3 are −1,−1,1 and thereafter 0; at odd p≡1 mod4 they are 0,−1 and thereafter 0; at odd p≡3 mod4 they are −2,1 and thereafter 0. For v3, at p=3 the values for e=1,2,3 are −1,−1,1 and thereafter 0; at p≡1 mod3 they are 0,−1 and thereafter 0; at p≡2 mod3 they are −2,1 and thereafter 0. m=−1 for e=1 and 0 for e≥2. For nonprime p and e>0 set the whole vector to zero. These are one finite table, not new factorization or modular-form carriers.

**Sources:** [Martin](#references), Definitions 1A–1D and the Möbius term of Theorem 1, p.2.

**Required API:**

- `TauCeti.EffectiveEllipticComparison.localTerms_zeroExponent`: For every p, localTerms(p,0)=(1,1,1,1,1).
- `TauCeti.EffectiveEllipticComparison.localTerms_nonprime`: For p not prime and e>0, localTerms(p,e) is the zero vector.
- `TauCeti.EffectiveEllipticComparison.localTerms_table`: For p prime and e>0 every coordinate is the corresponding entry of the displayed prime-power table.

**Discriminating examples:**

- `TauCeti.EffectiveEllipticComparison.tests.local_zero_exponent`: localTerms(0,0)=(1,1,1,1,1).
- `TauCeti.EffectiveEllipticComparison.tests.local_two_square`: localTerms(2,2)=(1/4,0,−1,1,0).
- `TauCeti.EffectiveEllipticComparison.tests.local_three_square`: localTerms(3,2)=(5/9,1,1,−1,0).
- `TauCeti.EffectiveEllipticComparison.tests.local_two_cube`: localTerms(2,3)=(3/8,0,1,0,0).

### The weight-two arithmetic dimension expression

**Supplier:** `EllipticModularityEffectiveComparisons:EC.0/dimension-expression`.

For N>0 let (S,I,A,B,M) be the coordinatewise product of localTerms(p,N.factorization(p)) over p in N.primeFactors. Define martinValue(N)=N S/12−I/2−A/4−B/3+M in Q. Set martinValue(0)=0 only as a total-function convention. The equality with an actual modular-form dimension is a separate comparison theorem. In particular this definition does not use a freely supplied dimension or an assumed newspace.

**Sources:** [Martin](#references), Theorem 1 at k=2 and Definitions 1A–1F, p.2.

**Required API:**

- `TauCeti.EffectiveEllipticComparison.martinValue_zero`: martinValue(0)=0, a junk-level convention only.
- `TauCeti.EffectiveEllipticComparison.martinValue_one`: martinValue(1)=0.
- `TauCeti.EffectiveEllipticComparison.martinValue_formula`: For N>0, martinValue is the displayed five-product expression with the native factorization of N.

**Discriminating examples:**

- `TauCeti.EffectiveEllipticComparison.tests.dimension_level_one`: martinValue(1)=0.
- `TauCeti.EffectiveEllipticComparison.tests.dimension_eleven`: martinValue(11)=1.
- `TauCeti.EffectiveEllipticComparison.tests.dimension_thirtyfive`: martinValue(35)=3.
- `TauCeti.EffectiveEllipticComparison.tests.dimension_thirty`: martinValue(30)=1.

### Kraus’s coefficient-rationality threshold

**Supplier:** `EllipticModularityEffectiveComparisons:EC.2/kraus-f`.

For N>0 put I(N)=[SL2(Z):Gamma0(N)] using the native subgroup index, and g(N)=finrank_C(cuspFormsNew(N,2)∩cuspFormCharSpace(2,1)). Define krausF(N)=(sqrt(I(N)/6)+1)^(2g(N)).

**Sources:** [BS](#references), §2, equation (5), the three threshold displays and Theorem 4, p.360.

**Required API:**

- `TauCeti.EffectiveEllipticComparison.krausF_eq`: krausF is the displayed expression in the native index and newspace dimension.
- `TauCeti.EffectiveEllipticComparison.one_le_krausF`: For positive N, 1≤krausF(N).
- `TauCeti.EffectiveEllipticComparison.krausF_of_dimension_zero`: If the actual g(N)=0 then krausF(N)=1.

**Discriminating examples:**

- `TauCeti.EffectiveEllipticComparison.tests.krausF_one`: krausF(1)=1.
- `TauCeti.EffectiveEllipticComparison.tests.krausF_eleven`: krausF(11)=3+2 sqrt(2).
- `TauCeti.EffectiveEllipticComparison.tests.krausF_thirtyfive`: krausF(35)=(1+sqrt(8))^6.

### Kraus’s two-torsion threshold

**Supplier:** `EllipticModularityEffectiveComparisons:EC.2/kraus-g`.

For N>0 define krausG(N)=(sqrt(I(lcm(N,4))/6)+1)^2, where I is the native Gamma0 index. The lcm is essential and is not replaced by 4N.

**Sources:** [BS](#references), §2, equation (5), the three threshold displays and Theorem 4, p.360.

**Required API:**

- `TauCeti.EffectiveEllipticComparison.krausG_eq`: krausG is the displayed least-common-multiple expression.
- `TauCeti.EffectiveEllipticComparison.one_le_krausG`: For positive N, 1≤krausG(N).
- `TauCeti.EffectiveEllipticComparison.krausG_of_four_dvd`: If 4 divides N, krausG(N)=(sqrt(I(N)/6)+1)^2.

**Discriminating examples:**

- `TauCeti.EffectiveEllipticComparison.tests.krausG_one`: krausG(1)=4.
- `TauCeti.EffectiveEllipticComparison.tests.krausG_four`: krausG(4)=4, whereas replacing lcm(4,4) by 16 would give 9.
- `TauCeti.EffectiveEllipticComparison.tests.krausG_eleven`: krausG(11)=13+4 sqrt(3).

### Kraus’s full-two-torsion comparison threshold

**Supplier:** `EllipticModularityEffectiveComparisons:EC.2/kraus-h`.

For N>0 define krausH(N)=max(krausF(N),krausG(N)).

**Sources:** [BS](#references), §2, equation (5), the three threshold displays and Theorem 4, p.360.

**Required API:**

- `TauCeti.EffectiveEllipticComparison.krausH_eq`: For N>0, krausH(N)=max(krausF(N),krausG(N)).
- `TauCeti.EffectiveEllipticComparison.krausF_le_krausH`: krausF(N)≤krausH(N).
- `TauCeti.EffectiveEllipticComparison.krausG_le_krausH`: krausG(N)≤krausH(N).
- `TauCeti.EffectiveEllipticComparison.krausH_lt_iff`: For real ell, krausH(N)<ell iff krausF(N)<ell and krausG(N)<ell.

**Discriminating examples:**

- `TauCeti.EffectiveEllipticComparison.tests.krausH_one`: krausH(1)=4.
- `TauCeti.EffectiveEllipticComparison.tests.krausH_four`: krausH(4)=4.
- `TauCeti.EffectiveEllipticComparison.tests.krausH_eleven`: krausH(11)=13+4 sqrt(3).

### Kraus’s local coefficient filters

**Supplier:** `EllipticModularityEffectiveComparisons:EC.3/local-mod-four-filters`.

For a commutative ring R, p,e∈N and a∈R, define the pair krausLocalFilters(p,e,a)=(V,V′) in R[X]². For p=2,e=0 use (1−aX+2X²,1); for p=2,e=1 use (1−aX,1); for p=2,e≥2 use (1,1). For p≠2,e=0 use (1,1); for p≠2,e=1 use (1,1−(p+1−a)X); for p≠2,e≥2 use (1,1−(p+1)X+pX²). At prime p with e=v_p(N), X acts as R_p:h(z)↦h(pz), so X² acts as R_(p²).

**Sources:** [Kraus](#references), Appendix II, §8.1, p.1160.

**Required API:**

- `TauCeti.EffectiveEllipticComparison.krausLocalFilters_two`: The three p=2 rows are the displayed e=0, e=1 and e≥2 pairs.
- `TauCeti.EffectiveEllipticComparison.krausLocalFilters_odd`: For p≠2 the e=0, e=1 and e≥2 rows are the displayed pairs.
- `TauCeti.EffectiveEllipticComparison.krausLocalFilters_constant`: Both filters have constant coefficient one.
- `TauCeti.EffectiveEllipticComparison.krausLocalFilters_map`: Mapping coefficients along a commutative-ring homomorphism sends the filters of a to the filters of its image.

**Discriminating examples:**

- `TauCeti.EffectiveEllipticComparison.tests.filters_two_unramified`: Over Z, krausLocalFilters(2,0,3)=(1−3X+2X²,1).
- `TauCeti.EffectiveEllipticComparison.tests.filters_two_square`: Over Z, krausLocalFilters(2,2,0)=(1,1).
- `TauCeti.EffectiveEllipticComparison.tests.filters_three_once`: Over Z, krausLocalFilters(3,1,−1)=(1,1−5X).
- `TauCeti.EffectiveEllipticComparison.tests.filters_three_square`: Over Z, krausLocalFilters(3,2,0)=(1,1−4X+3X²).

### The five genus-zero j-numerators

**Supplier:** `EllipticModularityEffectiveComparisons:EC.5/genus-zero-j-numerators`.

Define lemosNumerator(r) in Z[X] by the five formulas: r=2:(X+16)³; r=3:(X+27)(X+3)³; r=5:(X²+10X+5)³; r=7:(X²+5X+1)³(X²+13X+49); r=13:(X⁴+7X³+20X²+19X+1)³(X²+5X+13). At every other r set it to zero.

**Sources:** [Lemos](#references), §2, j-map table, p.6.

**Required API:**

- `TauCeti.EffectiveEllipticComparison.lemosNumerator_table`: For the five levels the polynomial is exactly the displayed formula.
- `TauCeti.EffectiveEllipticComparison.lemosNumerator_monic`: For r∈{2,3,5,7,13}, lemosNumerator(r) is monic of degree r+1.
- `TauCeti.EffectiveEllipticComparison.lemosNumerator_constant`: The five constant terms are 4096,729,125,49,13 respectively.
- `TauCeti.EffectiveEllipticComparison.lemosNumerator_other`: Outside {2,3,5,7,13}, lemosNumerator(r)=0.

**Discriminating examples:**

- `TauCeti.EffectiveEllipticComparison.tests.j_two_constant`: lemosNumerator(2)(0)=4096.
- `TauCeti.EffectiveEllipticComparison.tests.j_seven_degree`: lemosNumerator(7) has degree 8 and constant term 49.
- `TauCeti.EffectiveEllipticComparison.tests.j_thirteen_degree`: lemosNumerator(13) has degree 14 and constant term 13.
- `TauCeti.EffectiveEllipticComparison.tests.j_eleven_other`: lemosNumerator(11)=0: the genus-one level does not use a genus-zero formula.

### The finite integral j-candidate sets

**Supplier:** `EllipticModularityEffectiveComparisons:EC.5/finite-integral-j`.

Define lemosIntegralJ(r) as the finite set of integers lemosNumerator(r)(t)/t for all signed nonzero divisors t of the polynomial’s constant term; use the exact integer quotient, and the empty set outside the five levels.

**Sources:** [Lemos](#references), §2, five finite sets, p.7.

**Required API:**

- `TauCeti.EffectiveEllipticComparison.mem_lemosIntegralJ`: j belongs iff r∈{2,3,5,7,13} and there is a nonzero signed divisor t of the constant term with j equal to the exact quotient f(t)/t.
- `TauCeti.EffectiveEllipticComparison.lemosIntegralJ_other`: For r outside {2,3,5,7,13}, lemosIntegralJ(r) is empty.
- `TauCeti.EffectiveEllipticComparison.lemosIntegralJ_cards`: The cardinalities at 2,3,5,7,13 are 25,13,8,6,4.

**Discriminating examples:**

- `TauCeti.EffectiveEllipticComparison.tests.integral_j_two`: lemosIntegralJ(2) has 25 elements and contains 0 and 1728.
- `TauCeti.EffectiveEllipticComparison.tests.integral_j_five`: lemosIntegralJ(5) has 8 elements and contains 64.
- `TauCeti.EffectiveEllipticComparison.tests.integral_j_thirteen`: lemosIntegralJ(13)={−64·9·4079³,576,4096·27·19,4096·27·19·991³}.
- `TauCeti.EffectiveEllipticComparison.tests.integral_j_other`: lemosIntegralJ(11) is empty; its separate finite j-table is used instead.

## Native interfaces required by the imports

Arithmetic formulas and finite calculations are used through comparison theorems with the native objects. The modular-form interface must identify Martin's expression with the dimension of the trivial-character newspace, using the Γ₀ genus formula, old/new multiplicities and convolution inversion. The coefficient-field interface must carry an integral Hecke coefficient, a prime above ℓ and its residue map together; norm divisibility is a statement about the ring of integers, while the embedding bound is a statement in the field. These are the inputs of `EllipticModularityEffectiveComparisons:EC.0/dimension-comparison` and `EC.1/prime-divides-integral-norm`.

For Kraus's comparison, the level-and-weight interface provides a primitive weight-two form of exact residual conductor with trivial character, together with its residual isomorphism. The local conductor calculation and the finite-flat weight calculation remain separate inputs. The integral Sturm interface compares coefficients modulo a power of a prime ideal, including the dyadic lattice at lcm(N,4). Its conclusion is stronger than equality of complex modular forms. Use `EllipticModularityEffectiveComparisons:EC.3/exact-weight-two-lift`, `EC.3/deletion-level-exact-adapter` and `EC.3/prime-power-ideal-sturm` with their stated hypotheses.

For the isogeny classification, the prime-degree Eisenstein argument and the composite-degree rational-point arguments are distinct. The half-character case uses the global imaginary-quadratic class-number-one classification; the finite-character case uses global triviality of characters unramified at every finite prime. Local inertia calculations alone do not provide either conclusion. The composite classification also needs the point tables and descent exclusions at levels 26, 35, 39, 50, 65, 91, 125 and 169. These enter through `EllipticModularityEffectiveComparisons:EC.4/mazur-prime-isogeny-classification` and `EC.4/mazur-kenku-cyclic-degrees`.

For Cartan uniformity, the ModularCurvesPartII continuation supplies the prime-to-p Hecke-equivariant Chen isogeny, integral winding-annihilator quotient, smooth integral models and semistable cotangent injection. Its winding input includes the nonzero order-p cuspidal boundary divisor, projection to the full-new part and the characteristic-q coefficient-support/degeneracy statement. The r=5,7,13 cases require these calculations at their own levels. The rank-zero input applies to modular abelian factors of arbitrary dimension occurring in that quotient. It enters through `EllipticModularityEffectiveComparisons:EC.5/winding-class-nonzero`, `EC.5/finite-winding-quotient` and `EC.5/cartan-cusp-formal-immersion`.

The proper-image classification uses quantitative split-Cartan estimates and a certified finite sieve, through `EllipticModularityEffectiveComparisons:EC.5/split-cartan-exclusion`. The finite j-value step uses the actual modular coordinate maps and rational-point tables, followed by all-primes image certificates. A computation of the five polynomials establishes their arithmetic properties; the coordinate comparison establishes that they give the modular j-map. Likewise, the image certificates must bound every possible exceptional prime. These two comparisons are part of the imported statements, not consequences of checking a finite collection of values or Frobenius traces.

## Arithmetic examples in Suggested.lean

The namespace `EllipticCurveModularityPartIIAcceptance` contains proved arithmetic lemmas used to check the conventions above. They supplement the native interfaces and do not replace their geometric comparison statements.

- `sqrt_two_add_one_sq` and `sqrt_twelve_add_one_sq` identify the level-11 expressions as F(11)=3+2√2 and G(11)=13+4√3 after the native index and dimension evaluations. `krausF_eleven_lt_krausG_eleven` checks the strict inequality, so H(11)=G(11).
- `two_mul_sub_one_le_of_mod_eq` proves that primes p≥11 and q with q≡±1 modulo p satisfy q≥2p−1. In the formal-immersion application, q is consequently larger than 13 and than 3; the small residue characteristics do not occur.
- `int_of_eval_div_self_int` works for any monic integer polynomial of degree at least two. For nonzero rational t with f(t)/t integral it proves that t is a nonzero integer dividing f(0). The example f=X+1, t=1/2 shows why the degree hypothesis is necessary. The five modular numerators satisfy it, but the lemma alone does not identify a modular coordinate.
- `lower_left_eq_zero_of_det_one_sub_eq_zero` is the finite matrix step in the two-isogeny argument. For a subgroup of GL₂(ℤ/4), assume every element has det(1−g)=0, every element fixes 2e₁, and some element has odd upper-right entry. It proves that every lower-left entry is zero. Chebotarev, the elliptic torsion basis, and the identification of the quotient's two-torsion supply the geometric interpretation in EC.4.

## References

Page numbers below refer to the displayed editions. The theorem, section and page locators at each target specify the portion supplying its statement or argument.

- **BS:** Michael A. Bennett and Samir Siksek, [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), *Annals of Mathematics* 191 (2020), 355–392. The effective comparison inputs are in §2, pp. 358–360; the two-torsion applications are in §3, pp. 361–364.
- **Kraus:** Alain Kraus, [Majorations effectives pour l'équation de Fermat généralisée](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf), *Canadian Journal of Mathematics* 49 (1997), 1139–1161. Use §3.1–3.3, pp. 1142–1146, and Appendix II, §8, pp. 1158–1160.
- **Martin:** Greg Martin, [Dimensions of the spaces of cusp forms and newforms on Γ₀(N) and Γ₁(N)](https://arxiv.org/pdf/math/0306128), arXiv math/0306128v1 (6 June 2003). Use Theorems 1–2 and Definitions 1A–1F, pp. 2–3, and §4, pp. 14–16. The journal version is *Journal of Number Theory* 112 (2005), 298–331; the locators here use the preprint pagination.
- **Mazur:** Barry Mazur, with an appendix by Dorian Goldfeld, [Rational isogenies of prime degree](https://www.math.columbia.edu/~goldfeld/Mazur-Goldfeld1978.pdf), *Inventiones mathematicae* 44 (1978), 129–162. Use Theorem 1 and the introduction table, pp. 129–130, and §7, pp. 153–155. The composite-degree classification is the separate Mazur–Kenku import identified in EC.5.
- **Lemos:** Pedro Lemos, [Serre's uniformity conjecture for elliptic curves with rational cyclic isogenies](https://arxiv.org/pdf/1702.01985v2), arXiv:1702.01985v2 (8 March 2017). The locators use this version's pp. 1–11: Theorems 1.1–1.4, §2 and §3. The journal version is *Transactions of the American Mathematical Society* 371 (2019), 137–146.
- **DarmonMerel:** Henri Darmon and Loïc Merel, [Winding quotients and some variants of Fermat's Last Theorem](https://perso.imj-prg.fr/loic-merel/wp-content/uploads/merel-pub/winding.pdf), author copy dated 5 January 2001. Use §§6–8, especially Propositions 7.1–7.2, pp. 18–21, and Lemmas 8.2–8.3, pp. 22–23. The journal version is *Journal für die reine und angewandte Mathematik* 490 (1997), 81–100; the locators here use the author-copy pagination. The original r=2,3 argument is combined with the explicit five-level extension in Lemos §3.
