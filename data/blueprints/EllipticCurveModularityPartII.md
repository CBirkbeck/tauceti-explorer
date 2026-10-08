# Modularity and modular parametrisations of elliptic curves over ℚ, Part II: effective residual comparisons

Modularity attaches a weight-two newform to every elliptic curve over ℚ. The modular method uses more than its existence. It removes primes from the level and compares residual representations, and it needs to know how large the residual characteristic ℓ can be when a prime is removed, when the newform at the lowered level has rational coefficients, when the elliptic curve of that newform keeps the two-torsion of the curve one started from, and when E[ℓ] is irreducible, or the representation on it surjective, by a bound that does not depend on the curve. These are the effective residual comparisons: Martin's bound for the dimension of the weight-two newspace, the exponent bound of Bennett and Siksek at a removed prime, Kraus's two realization theorems, the irreducibility statements that follow from the classification of rational cyclic isogenies, and Lemos's surjectivity theorem.

This mathematics is planned in the roadmap `EllipticModularityEffectiveComparisons`, which has the same title, extends the same parent `EllipticCurveModularity`, and plans the statements below as declarations of its layers EC.0 to EC.5, with proof outlines, API and unit tests. One input, Chen's isogeny theorem in EC.6, is a declaration of neither roadmap; the owner records it as a gap. This roadmap therefore states no declaration of its own. Its six layers are an index: for each target, this document gives the statement and the declarations of the owner that plan it. To use one of these results, cite the owner's declaration.

## Scope and boundary

- **Owner.** The definitions, constructions and theorems named here are owned by `EllipticModularityEffectiveComparisons`, with the one exception noted under EC.6. The correspondence is target by target in the layer sections, and it is recorded in the packet as `targetCoverage` (31 targets) and `imports` (66 declarations read).
- **Nothing planned here.** The packet has no nodes, and the roadmap has no API items, unit tests or planets. The layers are not mathematically closed: the owner's layers are planned, with their own gaps and requests to other roadmaps, and those are the owner's.
- **Parent.** `EllipticCurveModularity:R29.6/modularity-theorem` supplies modularity over ℚ. Its proof of residual irreducibility for a fixed curve does not use the uniform statements of EC.5, so no link returns from EC.5 to the parent.
- **Other continuations of the parent.** Modularity over imaginary quadratic fields is `EllipticCurveModularityImaginaryQuadratic`, modularity of abelian varieties of GL₂-type is `EllipticCurveModularityPartIIGL2TypeAbelianVarieties`, and the wild 3-adic route to modularity over ℚ is assigned to the separate design job `EllipticCurveModularityWild3Adic`. None of them is planned here.
- **One roadmap.** The atlas plans this mathematics once. The packet proposes merging this roadmap into `EllipticModularityEffectiveComparisons`: the owner's layers and identifiers stay, and the layers EC.1–EC.6 of this roadmap leave the atlas.

## Conventions

The statements below use the owner's conventions. Mixed modular fibre products mean their smooth projective normalizations; a fibre product as a scheme can have singularities and is not substituted for this curve. The quotient X₀⁺(rp²) uses w_{p²}, preserving the r-level.

- Elliptic curves are over ℚ; M is the conductor and Δ the minimal discriminant. ord_q(Δ) is the exponent of q in Δ, an integer; q ∥ M means that the exponent of q in M is 1.
- μ(N) = [SL₂(ℤ) : Γ₀(N)], which is N times the product of 1 + 1/q over the primes q dividing N. g⁺(N) is the complex dimension of the weight-two newspace of Γ₀(N) with trivial character. In the pinned Tau Ceti the newspace is defined on Γ₁(N); g⁺(N) is the dimension of its trivial-character part, not of the whole Γ₁(N) newspace.
- E[ℓ] is the group of ℓ-torsion points over an algebraic closure, a two-dimensional representation of the absolute Galois group of ℚ over 𝔽_ℓ. N(E[ℓ]) is its Artin conductor away from ℓ, so it has no factor ℓ. Its Serre weight is the weight of Serre's conjecture.
- M₀ is the deletion level of `SerreWeightAndLevelOptimisation:R20.6/reduced-level-of-elliptic-curve`: M divided by the primes q ∥ M with ℓ | ord_q(Δ). The prime q = ℓ is allowed in that product. M₀ and N(E[ℓ]) are different numbers in general.
- Full rational two-torsion means that E(ℚ) contains all four points of E[2]. A rational point of order two is one nonzero point of E[2] in E(ℚ).
- A rational cyclic isogeny of degree n is given by a cyclic subgroup of order n of the points over an algebraic closure that is stable under Galois; its points need not be rational.
- E has no complex multiplication when its endomorphism ring over an algebraic closure is ℤ. Endomorphisms defined over ℚ are always multiplications by integers, so they do not detect this.
- A nonsplit Cartan subgroup of GL₂(𝔽_p) is the image of the multiplicative group of 𝔽_{p²} acting on 𝔽_{p²} by multiplication, in a basis over 𝔽_p; any two are conjugate, and the normalizer contains it with index 2.

## Layers

### EC.1. Thresholds and sharp newspace dimensions

Owner: `EllipticModularityEffectiveComparisons:EC.0`, `EllipticModularityEffectiveComparisons:EC.2`.

Kraus's comparison theorems are effective because their thresholds are explicit functions of a level. Two numbers attached to a positive integer N enter: the index μ(N) of Γ₀(N) in SL₂(ℤ), which is N times the product of 1 + 1/q over the primes q dividing N, and the dimension g⁺(N) of the space of weight-two newforms on Γ₀(N) with trivial character. The threshold F controls rationality of a newform, G controls a congruence modulo 4, and H is their maximum. All three are real numbers and are used in strict inequalities ℓ > F(N), ℓ > G(N), ℓ > H(N). The division by 6 is a real division and the square root is taken before the power; the level in G is lcm(N, 4).

Martin's theorem bounds g⁺(N) by (N + 1)/12 and says exactly when equality holds. It is what turns a bound in terms of the degree of a coefficient field into a bound in terms of the level alone.

**Kraus's rationality threshold F.** For N ≥ 1, with μ(N) = [SL₂(ℤ) : Γ₀(N)] and g⁺(N) the complex dimension of the weight-two newspace of Γ₀(N) with trivial character, F(N) = (√(μ(N)/6) + 1)^(2g⁺(N)), a real number.

Owned by `EllipticModularityEffectiveComparisons:EC.2/kraus-f`. The same definition on the same carriers: the native index, and the trivial-character part of the Γ₁(N) newspace. The owner's API (krausF_eq, one_le_krausF, krausF_of_dimension_zero) and its tests at levels 1, 11 and 35 cover what the threshold is used for; 3 + 2√2 = (√2 + 1)².

**Kraus's two-torsion threshold G.** For N ≥ 1, G(N) = (√(μ(lcm(N, 4))/6) + 1)², a real number; the level is lcm(N, 4), not 4N and not the radical of N.

Owned by `EllipticModularityEffectiveComparisons:EC.2/kraus-g`. The same definition. The owner tests levels 1, 4 and 11, and 13 + 4√3 = (√12 + 1)². The value G(2) = 4 and the invariance of G under lcm(N, 4) = lcm(M, 4) follow from its formula krausG_eq.

**Kraus's comparison threshold H.** For N ≥ 1, H(N) = max(F(N), G(N)).

Owned by `EllipticModularityEffectiveComparisons:EC.2/kraus-h`. The same definition, with krausF_le_krausH, krausG_le_krausH and krausH_lt_iff. That F cannot replace H is visible at level 11: F(11) = 3 + 2√2 < 13 + 4√3 = H(11), the owner's tests krausF_eleven and krausH_eleven.

**Martin's sharp weight-two newspace bound.** For every N ≥ 1, 12·g⁺(N) ≤ N + 1, with equality exactly when N = 35 or N is a prime congruent to 11 modulo 12.

Owned by `EllipticModularityEffectiveComparisons:EC.0/martin-bound`, `EllipticModularityEffectiveComparisons:EC.0/dimension-comparison`. The same statement with the same equality cases. The owner also plans the proof: Martin's prime-power table, the identification of his arithmetic expression with the actual newspace dimension, and the estimates and finite checks of his §4 (EC.0/local-factors to EC.0/bounded-family).

Named declarations, API and unit tests of this layer: none; they are the owner's. Dependencies: `EllipticModularityEffectiveComparisons:EC.0`, `EllipticModularityEffectiveComparisons:EC.2`. Layer coverage: every target is cited to its owner; nothing remains to plan here.

### EC.2. Removed-prime exponent bounds

Owner: `EllipticModularityEffectiveComparisons:EC.1`, `EllipticModularityEffectiveComparisons:EC.3`.

Let E[ℓ] be irreducible. When ℓ divides the exponent of a prime p ∥ M, p ≠ ℓ, in the minimal discriminant, p leaves the level: the residual representation E[ℓ] comes from a newform f of level M₀ prime to p, and the Frobenius comparison at p reads p + 1 ≡ ±c_p modulo a prime λ above ℓ. The algebraic integer p + 1 ∓ c_p is nonzero, because every conjugate of c_p has absolute value at most 2√p < p + 1, and it lies in λ, so ℓ divides its norm. The norm is at most (√p + 1)^(2d) with d the degree of the coefficient field of f, and d ≤ g⁺(M₀) ≤ (M₀ + 1)/12. This gives the bound of the layer. The level M₀ is the deletion level: M divided by the primes q ∥ M with ℓ | ord_q(Δ), where ord_q is the exponent of q. A factor ℓ can remain in M₀: it does when E has additive reduction at ℓ, and when ℓ ∥ M with ℓ ∤ ord_ℓ(Δ). So M₀ is in general not the prime-to-ℓ conductor of E[ℓ].

**The norm bound behind a congruence.** Let K be a number field of degree d, λ a prime of its ring of integers above the rational prime ℓ, and x a nonzero element of λ whose image under every embedding K → ℂ has absolute value at most B. Then ℓ ≤ |Norm_{K/ℚ}(x)| ≤ B^d.

Owned by `EllipticModularityEffectiveComparisons:EC.1/prime-divides-integral-norm`, `EllipticModularityEffectiveComparisons:EC.1/trace-norm`, `EllipticModularityEffectiveComparisons:EC.3/bounded-integer-trace-norm`. The lower bound ℓ ≤ |Norm(x)| is EC.1/prime-divides-integral-norm, with the Mathlib declarations on ideal norms it rests on. The owner states the upper bound for the two elements to which it is applied, p + 1 ∓ c_p (EC.1/trace-norm) and b − a_q(f) (EC.3/bounded-integer-trace-norm). The general inequality |Norm(x)| ≤ B^d follows from the pinned `Algebra.norm_eq_prod_embeddings` and `AlgHom.card`: there are exactly d complex embeddings, so multiplying the d absolute-value bounds gives B^d. Nonzero x forces B > 0; B ≥ 1 is unnecessary. The packet records these two baseline declarations. This consequence is not a separately owned theorem.

**The removed-prime exponent bound.** Let E/ℚ have conductor M and minimal discriminant Δ, let ℓ ≥ 3 be a prime with E[ℓ] irreducible, and let M₀ be M divided by the primes q with q ∥ M and ℓ | ord_q(Δ). If p ≠ ℓ is a prime with p ∥ M and ℓ | ord_p(Δ), then ℓ ≤ (√p + 1)^((M₀+1)/6).

Owned by `EllipticModularityEffectiveComparisons:EC.1/removed-prime-bound`, `EllipticModularityEffectiveComparisons:EC.1/removed-prime-degree-bound`, `EllipticModularityEffectiveComparisons:EC.1/coefficient-orbit-degree`, `EllipticModularityEffectiveComparisons:EC.1/real-exponent-bound`, `EllipticModularityEffectiveComparisons:EC.1/trace-gap`. The same statement and hypotheses (Bennett–Siksek, Lemma 2.2), with M₀ the deletion level of SerreWeightAndLevelOptimisation R20.6 and ord the valuation exponent. The owner splits the proof into the nonvanishing of p + 1 ∓ c_p, the bound by the degree of the coefficient field, the bound of that degree by g⁺(M₀), and the comparison of real powers.

Named declarations, API and unit tests of this layer: none; they are the owner's. Dependencies: `EllipticModularityEffectiveComparisons:EC.1`, `EllipticModularityEffectiveComparisons:EC.3`. Layer coverage: every target is cited to its owner; nothing remains to plan here.

### EC.3. Rationality and exact-conductor realization

Owner: `EllipticModularityEffectiveComparisons:EC.3`.

Kraus's first theorem starts from E[ℓ], irreducible, of Serre weight 2 and of prime-to-ℓ Artin conductor N, with ℓ ≥ 5. Modularity, with the optimisation of level and weight, gives a newform f of weight two and level exactly N with trivial character whose residual representation at a prime λ above ℓ is E[ℓ]. If some coefficient c_q with q ≤ μ(N)/6 and q ∤ N were not an integer, then c_q minus the integer it is congruent to modulo λ (the trace of Frobenius of E at q, or ±(q + 1) if E has multiplicative reduction at q) would be a nonzero element of λ of norm at most (√q + 1)^(2d) ≤ F(N), against ℓ > F(N). So the coefficients at the primes up to μ(N)/6 are integers; the recurrences for the coefficients and the Sturm bound in characteristic zero then make f equal to all its conjugates, and f is rational. A rational newform of level N gives an elliptic curve of conductor exactly N with the same residual representation.

**Rationality from finitely many prime coefficients.** If a normalized newform f of weight two, level N and trivial character has c_q ∈ ℤ for every prime q ≤ μ(N)/6, then every Fourier coefficient of f is in ℤ.

Owned by `EllipticModularityEffectiveComparisons:EC.3/rationality-from-small-primes`. The same statement (Kraus, Lemme 1), with the additional conclusion that the coefficient field is ℚ.

**Integrality of the small prime coefficients above F(N).** Let ℓ ≥ 5 be prime, E/ℚ with E[ℓ] irreducible of Serre weight 2 and prime-to-ℓ conductor N, and f a normalized newform of weight two, level N and trivial character whose residual representation at a prime above ℓ is E[ℓ]. If ℓ > F(N), then c_q ∈ ℤ for every prime q ≤ μ(N)/6.

Owned by `EllipticModularityEffectiveComparisons:EC.3/rational-coefficient-forcing`, `EllipticModularityEffectiveComparisons:EC.3/exact-weight-two-lift`, `EllipticModularityEffectiveComparisons:EC.3/nonrational-witness`, `EllipticModularityEffectiveComparisons:EC.3/small-prime-below-f`, `EllipticModularityEffectiveComparisons:EC.3/bounded-integer-trace-norm`. The owner states the stronger conclusion that the coefficient field of f is ℚ, with the same contradiction with ℓ > F(N): a non-integral coefficient at a prime q ≤ μ(N)/6 with q ∤ N differs from an integer trace, or from ±(q + 1), by a nonzero element of the prime above ℓ whose norm is at most F(N). The existence of f is EC.3/exact-weight-two-lift.

**The elliptic curve of a rational newform.** A normalized newform f of weight two, exact level N and trivial character with integer coefficients has an elliptic curve F/ℚ of conductor exactly N with a_q(F) = c_q at the primes of good reduction; if ℓ ≥ 5 is prime and the residual representation of f at a prime above ℓ is an irreducible E[ℓ], then F[ℓ] ≅ E[ℓ] as representations of the absolute Galois group of ℚ.

Owned by `EllipticModularityEffectiveComparisons:EC.3/rational-form-elliptic-realization`. The same statement, from the one-dimensional quotient of J₀(N) (ModularCurvesPartII R14.5) and the conductor theorem (AutomorphicGaloisRepresentations R19.4).

**Kraus's rational comparison theorem.** For E/ℚ and a prime ℓ ≥ 5 with E[ℓ] irreducible of Serre weight 2 and prime-to-ℓ conductor N, if ℓ > F(N) there is an elliptic curve F/ℚ of conductor exactly N with F[ℓ] ≅ E[ℓ].

Owned by `EllipticModularityEffectiveComparisons:EC.3/kraus-rational-realization`. The same statement (Kraus, Théorème 3); the modularity of E that Kraus assumes is EllipticCurveModularity:R29.6/modularity-theorem.

Named declarations, API and unit tests of this layer: none; they are the owner's. Dependencies: `EllipticModularityEffectiveComparisons:EC.3`. Layer coverage: every target is cited to its owner; nothing remains to plan here.

### EC.4. Full rational two-torsion realization

Owner: `EllipticModularityEffectiveComparisons:EC.3`.

If E has full rational two-torsion, the comparison curve C of the preceding layer need not have it, but its point counts show a trace of it. For ℓ > G(N) and a prime q ∤ 2N with q ≤ μ(lcm(N, 4))/6, the traces of E and of C at q are congruent modulo ℓ and differ by less than ℓ, so they are equal, and #C(𝔽_q) = #E(𝔽_q) is divisible by 4 (bad reduction of E at such a prime is excluded by the same inequality). A congruence criterion of Sturm type modulo 4, at level lcm(N, 4), extends the divisibility from these finitely many primes to every prime q ∤ 2N. By Chebotarev's theorem the condition constrains the action of Galois on C[4], and it follows that C, or the quotient of C by its rational point of order two, has full rational two-torsion. The isogeny has degree 1 or 2, so it changes neither the conductor nor the representation on ℓ-torsion.

The theorems of this layer and the preceding one are stated at the residual conductor N(E[ℓ]). The removed-prime bound is stated at the deletion level M₀. The two levels agree under a condition on the reduction of E at ℓ, and an application that uses both must check it.

**Finite recognition of point counts modulo four.** For a (modular) elliptic curve C/ℚ of conductor N, 4 divides #C(𝔽_q) for every prime q ∤ 2N as soon as it does so for every such prime q ≤ μ(lcm(N, 4))/6.

Owned by `EllipticModularityEffectiveComparisons:EC.3/finite-four-count-witness`, `EllipticModularityEffectiveComparisons:EC.3/prime-power-ideal-sturm`, `EllipticModularityEffectiveComparisons:EC.3/filtered-coefficients`, `EllipticModularityEffectiveComparisons:EC.3/odd-eisenstein-series`, `EllipticModularityEffectiveComparisons:EC.3/local-mod-four-filters`. The owner states the contrapositive: a failure of the divisibility at some prime q ∤ 2N occurs at such a prime below the bound (Kraus, Appendice II, Corollaire). It also plans what the proof rests on: Kraus's congruence criterion modulo a power of a prime, his local filters, and the comparison with the Eisenstein series Σ_{n odd} σ₁(n)qⁿ on Γ₀(4).

**Transfer of the point counts to the comparison curve.** Let ℓ ≥ 5 be prime, E/ℚ with full rational 2-torsion and E[ℓ] irreducible of Serre weight 2 and prime-to-ℓ conductor N, and C/ℚ of conductor exactly N with C[ℓ] ≅ E[ℓ]. If ℓ > G(N), then 4 divides #C(𝔽_q) for the primes q ∤ 2N.

Owned by `EllipticModularityEffectiveComparisons:EC.3/mod-four-trace-transfer`, `EllipticModularityEffectiveComparisons:EC.3/small-prime-below-g`. The owner's lemma has this conclusion, for every prime q ∤ 2N, and argues by contradiction from a small prime at which the divisibility fails. Kraus's argument passes through two intermediate facts at the primes q ≤ μ(lcm(N, 4))/6, good reduction of E and the equality a_q(E) = a_q(C); the owner does not state them as conclusions.

**Repair of rational two-torsion by a two-isogeny.** If C/ℚ has 4 | #C(𝔽_q) at every odd prime of good reduction, there is an isogeny C → F over ℚ of degree 1 or 2 onto a curve with full rational 2-torsion; it preserves the conductor and, for odd ℓ, the representation on ℓ-torsion.

Owned by `EllipticModularityEffectiveComparisons:EC.3/four-count-rational-two`, `EllipticModularityEffectiveComparisons:EC.3/four-count-square-classes`, `EllipticModularityEffectiveComparisons:EC.3/four-count-full-two-selection`, `EllipticModularityEffectiveComparisons:EC.3/kraus-full-two-realization`. The owner plans three nodes: the existence of the rational point of order two, the square-class dichotomy on the model y² = x(x² + ax + b), and the selection of a curve with full two-torsion by an isogeny of degree at most two. The transport of the conductor and of the ℓ-torsion along that isogeny is the last step of EC.3/kraus-full-two-realization. The owner's hypothesis is at every odd prime of good reduction, which is what the application provides; Kraus allows finitely many exceptional primes, and that form is not planned.

**Kraus's full two-torsion realization.** If E/ℚ has full rational 2-torsion, ℓ ≥ 5 is prime, E[ℓ] is irreducible of Serre weight 2 and prime-to-ℓ conductor N, and ℓ > H(N), then there is an elliptic curve F/ℚ of conductor exactly N with full rational 2-torsion and F[ℓ] ≅ E[ℓ].

Owned by `EllipticModularityEffectiveComparisons:EC.3/kraus-full-two-realization`. The same statement (Kraus, Théorème 4). Bennett and Siksek quote it, as their Theorem 4, at the level M₀ of their Theorem 3; the passage from M₀ to N(E[ℓ]) is the next target.

**From the deletion level to the residual conductor.** Kraus's theorems are stated at the prime-to-ℓ conductor N(E[ℓ]) and Serre weight 2; an application at the deletion level M₀ needs N(E[ℓ]) = M₀ and weight 2 as separate facts.

Owned by `EllipticModularityEffectiveComparisons:EC.3/deletion-conductor-away`, `EllipticModularityEffectiveComparisons:EC.3/deletion-level-exact-adapter`. The owner states N(E[ℓ]) = M₀ for ℓ ≥ 5 when E has good reduction at ℓ, or multiplicative reduction at ℓ with ℓ | ord_ℓ(Δ) (EC.3/deletion-level-exact-adapter); the case ℓ ∤ M is its good-reduction case. It rests on the comparison of conductor exponents away from ℓ (EC.3/deletion-conductor-away), whose full local form the owner requests from ArithmeticGaloisRepresentations R01.3. For ℓ ≥ 11 the owner attributes to Kraus the deduction of the reduction alternative from Serre weight 2 and requests that local theorem; for ℓ = 5, 7 it keeps the alternative as a hypothesis.

Named declarations, API and unit tests of this layer: none; they are the owner's. Dependencies: `EllipticModularityEffectiveComparisons:EC.3`. Layer coverage: every target is cited to its owner; nothing remains to plan here.

### EC.5. Uniform two-torsion irreducibility

Owner: `EllipticModularityEffectiveComparisons:EC.4`, `EllipticModularityEffectiveComparisons:EC.5`.

A reducible E[ℓ] has an invariant line, which is a Galois-stable cyclic subgroup of order ℓ; its points need not be rational. With a rational point of order two, the sum of the two subgroups is a stable cyclic subgroup of order 2ℓ. With full rational two-torsion, a stable cyclic subgroup of order 4 exists on the quotient of E by one of the points of order two (the kernel of the composite E/T → E → E/T′ for two distinct rational subgroups T, T′ of order 2), and with the transported line it gives a cyclic subgroup of order 4ℓ. The degrees of rational cyclic isogenies of elliptic curves over ℚ are known: they are the integers from 1 to 19 and 21, 25, 27, 37, 43, 67, 163. No 2ℓ with ℓ ≥ 11 and no 4ℓ with ℓ ≥ 5 is among them, which gives the two irreducibility statements. They hold for every curve with the stated two-torsion, with or without complex multiplication. A curve with a cyclic 14-isogeny shows that ℓ ≥ 11 cannot be lowered to ℓ ≥ 7 in the statement with one point of order two.

**Mazur's theorem on isogenies of prime degree.** If E/ℚ has a rational cyclic isogeny of prime degree r, then r ∈ {2, 3, 5, 7, 11, 13, 17, 19, 37, 43, 67, 163}; if moreover E has no complex multiplication over an algebraic closure, then r ∈ {2, 3, 5, 7, 11, 13, 17, 37}.

Owned by `EllipticModularityEffectiveComparisons:EC.4/mazur-prime-isogeny-classification`, `EllipticModularityEffectiveComparisons:EC.5/large-prime-isogeny-cm`. The list of twelve primes is EC.4/mazur-prime-isogeny-classification, with Mazur's argument planned in the nodes it cites (the Eisenstein quotient, the formal immersion, the isogeny character and its three cases). The list of eight primes for curves without complex multiplication is EC.5/large-prime-isogeny-cm.

**No cyclic isogenies of degree 2ℓ or 4ℓ.** No elliptic curve over ℚ has a rational cyclic isogeny of degree 2ℓ for a prime ℓ ≥ 11, or of degree 4ℓ for a prime ℓ ≥ 7.

Owned by `EllipticModularityEffectiveComparisons:EC.4/mazur-kenku-cyclic-degrees`. The owner plans the whole list of degrees of rational cyclic isogenies, {1, …, 19, 21, 25, 27, 37, 43, 67, 163}. It contains no even number above 18, hence no 2ℓ with ℓ ≥ 11 and no 4ℓ with ℓ ≥ 5.

**From two-torsion and an invariant line to a cyclic isogeny.** Let ℓ be an odd prime and E/ℚ have a Galois-stable subgroup of order ℓ. If E has a rational point of order 2, it has a rational cyclic isogeny of degree 2ℓ; if E has full rational 2-torsion, a curve isogenous to E over ℚ has a rational cyclic isogeny of degree 4ℓ.

Owned by `EllipticModularityEffectiveComparisons:EC.4/rational-two-times-prime`, `EllipticModularityEffectiveComparisons:EC.4/full-two-cyclic-four`, `EllipticModularityEffectiveComparisons:EC.4/full-two-times-prime`. The same three arguments: the sum of the coprime kernels; the cyclic kernel of order 4 of the composite E/T → E → E/T′ for distinct rational subgroups T, T′ of order 2; and the sum of that kernel with the transported line.

**Irreducibility with full rational two-torsion.** If E/ℚ has full rational 2-torsion and ℓ ≥ 7 is prime, then E[ℓ] is irreducible, and absolutely irreducible.

Owned by `EllipticModularityEffectiveComparisons:EC.4/irreducible-full-two`, `ArithmeticGaloisRepresentations:R01.4/odd-irreducible-implies-absolutely-irreducible`. Irreducibility is the owner's theorem (Bennett–Siksek, proof of Lemma 3.3). Absolute irreducibility follows from the cited node of ArithmeticGaloisRepresentations R01.4, because E[ℓ] is odd.

**Irreducibility with a rational point of order two.** If E/ℚ has a rational point of order 2 and ℓ ≥ 11 is prime, then E[ℓ] is irreducible, and absolutely irreducible.

Owned by `EllipticModularityEffectiveComparisons:EC.4/irreducible-one-two`, `ArithmeticGaloisRepresentations:R01.4/odd-irreducible-implies-absolutely-irreducible`. Irreducibility is the owner's theorem (Bennett–Siksek, proof of Lemma 3.5); absolute irreducibility follows as in the preceding target.

Named declarations, API and unit tests of this layer: none; they are the owner's. Dependencies: `EllipticModularityEffectiveComparisons:EC.4`, `EllipticModularityEffectiveComparisons:EC.5`, and `ArithmeticGaloisRepresentations:R01.4/odd-irreducible-implies-absolutely-irreducible`. Layer coverage: every target is cited to its owner; nothing remains to plan here.

### EC.6. Rational-isogeny uniformity

Owner: `EllipticModularityEffectiveComparisons:EC.5`.

Lemos's theorem is Serre's uniformity statement for the curves that have a rational cyclic isogeny. Let E have no complex multiplication and a rational cyclic isogeny of prime degree r, and let p > 37. If the representation on E[p] is not surjective, its image lies in the normalizer of a nonsplit Cartan subgroup: the Borel case is excluded by Mazur's theorem, the exceptional images by Serre's bound on inertia, and the split Cartan case by the theorem of Bilu, Parent and Rebolledo. For r in {11, 17, 37} the curve has one of six explicit j-invariants. For r in {2, 3, 5, 7, 13} the curve gives a rational point on the curve X₀(r) ×_{X(1)} X_ns⁺(p); a quotient of its Jacobian with finitely many rational points and a formal immersion at the cusps show that j(E) has no prime other than p in its denominator, and the local behaviour at p of a nonsplit Cartan image shows that p is not in the denominator either. So j(E) is an integer, and on the genus-zero curve X₀(r) the integral values of j are finitely many, explicit numbers. Surjectivity for p > 37 at each of the finitely many j-invariants, which depends only on j because quadratic twisting preserves it, completes the proof.

The curve X₀⁺(rp²) of the argument is the quotient of X₀(rp²) by the Atkin–Lehner involution w_{p²}, which keeps the level structure at r; it is not the quotient by w_{rp²}.

**Potential good reduction under a nonsplit Cartan image.** If p ≥ 5 is prime and the image of the Galois representation on E[p] lies in the normalizer of a nonsplit Cartan subgroup, then E has potentially good reduction at p and at every prime q ≢ ±1 mod p.

Owned by `EllipticModularityEffectiveComparisons:EC.5/nonsplit-potential-multiplicative`. The same statement (Lemos, Proposition 2.2) in contrapositive form: a prime of potentially multiplicative reduction is different from p and congruent to ±1 modulo p.

**The Cartan correspondence and Chen's isogeny.** For r ∈ {2, 3, 5, 7, 13} and a prime p outside that set, the correspondence through X₀(r) ×_{X(1)} X(p)/(N_sp ∩ N_ns) maps the Jacobian of X₀(rp²)/w_{p²} to the Jacobian of X₀(r) ×_{X(1)} X_ns⁺(p), commutes with the Hecke operators T_n for n prime to p, and vanishes on the p-old part. (Chen's theorem, that the induced map on the p-new quotient is an isogeny, is an input the owner records and does not plan as a node.)

Owned by `EllipticModularityEffectiveComparisons:EC.5/cartan-correspondence-kills-old`. The owner plans the homomorphism, its Hecke equivariance and its vanishing on the p-old part (Lemos, Lemma 3.2), with the quotient by w_{p²} that keeps the level structure at r. That the induced map is an isogeny (Chen; Lemos, Theorem 3.3), and its use in EC.5/finite-winding-quotient, are in the owner's gap “Chen isogeny and higher-dimensional winding quotient” and in its proposal of a continuation of ModularCurvesPartII for Cartan correspondences. The case r = 1, which no target uses, is not planned.

**The winding quotient of rank zero.** For r ∈ {2, 3, 5, 7, 13} and a prime p outside that set, the Jacobian of X₀(r) ×_{X(1)} X_ns⁺(p) has a nonzero optimal quotient A over ℚ with A(ℚ) finite, whose kernel is stable under T_n for n prime to p.

Owned by `EllipticModularityEffectiveComparisons:EC.5/finite-winding-quotient`, `EllipticModularityEffectiveComparisons:EC.5/winding-period-component`, `EllipticModularityEffectiveComparisons:EC.5/winding-class-nonzero`. The same statement (Lemos, Theorem 3.4). The owner separates the nonvanishing of the winding class, proved by Darmon and Merel for r = 2, 3 and recorded as a gap for r = 5, 7, 13, from the nonvanishing of the central values of the surviving newforms and from the rank-zero theorem for their abelian varieties.

**Formal immersion at a cusp, and the torsion image of a rational point.** For r ∈ {2, 3, 5, 7, 13}, prime p > 37 and prime q ≡ ±1 mod p, let A be the specified optimal winding quotient of the preceding target, K = ℚ(ζ_p)⁺, and ∞ a cusp defined over K. The Abel–Jacobi map P ↦ [(P) − (∞)], followed by projection to A, extends from the smooth locus of the canonical integral model of the normalized mixed curve X₀(r) ×_{X(1)} X_ns⁺(p) over the localization of the integers of K at a prime above q to the Néron model of A, and is a formal immersion at ∞ in characteristic q. For the same r and A and any prime p outside {2, 3, 5, 7, 13}, the image in A(K) of each ℚ-rational point of the mixed curve is torsion.

Owned by `EllipticModularityEffectiveComparisons:EC.5/cartan-cusp-formal-immersion`, `EllipticModularityEffectiveComparisons:EC.5/cartan-point-torsion`, `EllipticModularityEffectiveComparisons:EC.5/cartan-cusp-residue`. The owner states the formal immersion for p > 37, the range the exported theorem uses; Lemos states it for every prime p outside {2, 3, 5, 7, 13}, following Darmon and Merel's Lemma 8.2 for r = 2, 3. The torsion statement is EC.5/cartan-point-torsion (Darmon–Merel, Lemma 8.3), and the field of definition of the cusps is EC.5/cartan-cusp-residue.

**Integrality of j away from p.** For r ∈ {2, 3, 5, 7, 13}, a prime p > 37, and E/ℚ with a rational cyclic r-isogeny whose mod-p image lies in the normalizer of a nonsplit Cartan subgroup, j(E) ∈ ℤ[1/p].

Owned by `EllipticModularityEffectiveComparisons:EC.5/cartan-denominator-exclusion`. The owner states this for p > 37. Lemos's Theorem 1.4 states it for every prime p outside {2, 3, 5, 7, 13}; the exported theorem needs only p > 37.

**Integrality of j.** For r ∈ {2, 3, 5, 7, 13}, a prime p > 37, and E/ℚ without complex multiplication, with a rational cyclic r-isogeny and a mod-p representation that is not surjective, j(E) is an integer.

Owned by `EllipticModularityEffectiveComparisons:EC.5/integral-j-forcing`. The owner's statement. Lemos's Proposition 2.1 assumes an image in the normalizer of a nonsplit Cartan subgroup, for every prime p outside {2, 3, 5, 7, 13}, and no hypothesis on complex multiplication; the owner assumes a proper image for p > 37 and no complex multiplication, which by EC.5/proper-image-nonsplit is the same hypothesis in that range, and combines EC.5/cartan-denominator-exclusion with potential good reduction at p.

**Integral j-values at the five genus-zero levels.** For r ∈ {2, 3, 5, 7, 13} there is a coordinate t on X₀(r) with j = f_r(t)/t, where f₂ = (t+16)³, f₃ = (t+27)(t+3)³, f₅ = (t²+10t+5)³, f₇ = (t²+5t+1)³(t²+13t+49), f₁₃ = (t⁴+7t³+20t²+19t+1)³(t²+5t+13); a noncuspidal rational point with j ∈ ℤ has t a nonzero integer dividing f_r(0).

Owned by `EllipticModularityEffectiveComparisons:EC.5/genus-zero-j-numerators`, `EllipticModularityEffectiveComparisons:EC.5/genus-zero-j-map`, `EllipticModularityEffectiveComparisons:EC.5/integral-parameter-divisibility`, `EllipticModularityEffectiveComparisons:EC.5/finite-integral-j`, `EllipticModularityEffectiveComparisons:EC.5/integral-j-characterisation`. The same five polynomials and the same divisibility argument. The owner also defines the finite sets of integral j-values, of cardinalities 25, 13, 8, 6 and 4, and states (EC.5/integral-j-characterisation) that they are exactly the integral j-values of noncuspidal rational points; the identification of f_r(t)/t with the j-map is in its gap on exact j-maps.

**A proper image for p > 37 is of nonsplit Cartan type.** For E/ℚ without complex multiplication and a prime p > 37, if the representation on E[p] is not surjective onto GL₂(𝔽_p), its image lies in the normalizer of a nonsplit Cartan subgroup.

Owned by `EllipticModularityEffectiveComparisons:EC.5/proper-image-nonsplit`, `EllipticModularityEffectiveComparisons:EC.5/exceptional-projective-exclusion`, `EllipticModularityEffectiveComparisons:EC.5/projective-inertia-order`, `EllipticModularityEffectiveComparisons:EC.5/split-cartan-exclusion`. The same statement (Lemos, Theorem 2.3). The owner plans its three inputs as nodes: Mazur's theorem for the Borel case, Serre's bound on projective inertia for the exceptional images, and the theorem of Bilu, Parent and Rebolledo for the split Cartan case.

**Surjectivity is a property of the j-invariant.** For a prime p ≥ 5, two elliptic curves over ℚ that are quadratic twists of one another have surjective mod-p representations simultaneously.

Owned by `EllipticModularityEffectiveComparisons:EC.5/quadratic-twist-surjectivity`. The owner's statement, for every pair of quadratic twists. The case p = 3 is not stated and is not used, since the exported theorem concerns p > 37.

**Surjectivity at the finitely many rational j-values.** For each j-value without complex multiplication among the rational noncuspidal points of X₀(11), X₀(17), X₀(37), namely −11·131³, −11², −17²·101³/2, −17·373³/2¹⁷, −7·137³·2083³, −7·11³, and each one among the integral j-values of the five genus-zero levels, every E/ℚ with that j-invariant has surjective mod-p representation for every prime p > 37.

Owned by `EllipticModularityEffectiveComparisons:EC.5/large-isogeny-j-table`, `EllipticModularityEffectiveComparisons:EC.5/large-isogeny-image-certificates`, `EllipticModularityEffectiveComparisons:EC.5/small-isogeny-image-certificates`. The same statements, with the same requirement that the proof be a certified bound valid for all primes and not a finite sample; the seventh rational j-value at these three levels, −2¹⁵, has complex multiplication.

**Lemos's theorem.** If E/ℚ has no complex multiplication over an algebraic closure and has a rational cyclic isogeny of degree greater than 1, then the representation of the absolute Galois group of ℚ on E[p] is surjective onto GL₂(𝔽_p) for every prime p > 37.

Owned by `EllipticModularityEffectiveComparisons:EC.5/lemos-surjectivity`. The same statement (Lemos, Theorem 1.1).

Named declarations, API and unit tests of this layer: none; they are the owner's. Dependencies: `EllipticModularityEffectiveComparisons:EC.5`. Layer coverage: every target is cited to its owner, and the one input without an owner, Chen's isogeny theorem, is recorded in the owner's gap; nothing remains to plan here.

## The owner's definitions

The targets above rest on eight definitions, all planned by the owner with their API outlines and unit tests:

- `EllipticModularityEffectiveComparisons:EC.0/local-factors` and `EllipticModularityEffectiveComparisons:EC.0/dimension-expression`: Martin's table of prime-power factors and the arithmetic expression for the weight-two new dimension, with tests at levels 1, 11, 30 and 35.
- `EllipticModularityEffectiveComparisons:EC.2/kraus-f`, `EllipticModularityEffectiveComparisons:EC.2/kraus-g`, `EllipticModularityEffectiveComparisons:EC.2/kraus-h`: the three thresholds, with tests at levels 1, 4, 11 and 35.
- `EllipticModularityEffectiveComparisons:EC.3/local-mod-four-filters`: the pairs of local polynomials that Kraus applies to a newform and to the Eisenstein series on Γ₀(4).
- `EllipticModularityEffectiveComparisons:EC.5/genus-zero-j-numerators` and `EllipticModularityEffectiveComparisons:EC.5/finite-integral-j`: the five polynomials f_r and the finite sets of integral j-values.

## Where the owner's statements are narrower or wider

The owner's statements are the ones in force. They differ from the statements in the sources, or from an obvious general form, in these places.

- **Range of p.** Lemos states the formal immersion, the integrality of j away from p (his Theorem 1.4) and the integrality of j (his Proposition 2.1) for every prime p outside {2, 3, 5, 7, 13}. The owner states them for p > 37, which is the range of the exported theorem.
- **Chen's isogeny.** Lemos states, for r in {1, 2, 3, 5, 7, 13}, that the Cartan correspondence induces an isogeny on the p-new quotient. The owner's node on the correspondence, for r in {2, 3, 5, 7, 13}, states its Hecke equivariance and its vanishing on the p-old part; the isogeny is an input it records as a gap. No target uses r = 1.
- **Levels r.** Darmon and Merel prove the winding and formal-immersion statements for r = 2, 3; their extension to r = 5, 7, 13 is asserted by Lemos and recorded by the owner as a gap.
- **Deletion level and residual conductor.** The owner states M₀ = N(E[ℓ]) for ℓ ≥ 5 when E has good reduction at ℓ, or multiplicative reduction at ℓ with ℓ | ord_ℓ(Δ), and requests the local comparison of conductors it rests on from ArithmeticGaloisRepresentations R01.3. For ℓ ≥ 11 it attributes to Kraus the deduction of this alternative from Serre weight 2; for ℓ = 5, 7 it keeps the alternative as a hypothesis.
- **Norms.** The owner states the upper bound for a norm only for the two elements it is applied to; the general bound is the product formula over embeddings in Mathlib.
- **Twists.** The owner states invariance of surjectivity under quadratic twist for p ≥ 5 and all curves.
- **Point counts modulo 4.** The owner states the finite recognition in contrapositive form, and the transfer of point counts with the single conclusion 4 | #C(𝔽_q) for every prime q ∤ 2N; good reduction of E and equality of traces at the tested primes, through which Kraus's argument passes, are not stated as conclusions.
- **Exceptional primes.** Kraus's repair of two-torsion allows the divisibility by 4 to fail at finitely many primes. The owner assumes it at every odd prime of good reduction, which is what the application provides.

## Remarks on the owner's statements

The first three are consequences of the owner's own declarations, or alternative arguments for them; the last three concern locators and a supplier. They add no target. The suggested file proves the residue-prime estimate in remark 2 and the finite-group calculation in remark 3, as well as the numerical threshold identities and polynomial divisibility test. It does not implement the elliptic-curve consequences in remark 1.

1. **Full two-torsion and ℓ = 5.** With full rational two-torsion, E[ℓ] is irreducible already for ℓ = 5: a reducible E[5] would give, by EC.4/full-two-times-prime, a rational cyclic isogeny of degree 20 on an isogenous curve, and 20 is not in the list of EC.4/mazur-kenku-cyclic-degrees. The range ℓ ≥ 7 is the one the route asks for. At ℓ = 3 the statement fails: y² = x(x + 5)(x + 32) has three distinct rational roots and the rational point P = (4, 36). Its tangent slope at P is 7, so 2P = (4, −36) = −P and P has order three.
2. **The range p > 37.** The owner's nodes EC.5/cartan-cusp-formal-immersion and EC.5/cartan-denominator-exclusion are stated for p > 37, while Lemos's Theorem 1.4 and Proposition 2.1 are stated for every prime p outside {2, 3, 5, 7, 13}. The conditions on the residue characteristic that their proofs use (q > r, q > 3, good reduction of the quotient at q, and ramification index 1 < q − 1) hold in the whole of that range: a prime q ≡ ±1 mod p with p ≥ 11 is at least 2p − 1 ≥ 21, since p ± 1 is even. So the restriction to p > 37 is not forced by small residue characteristics, and the inputs recorded in the owner's gap on Chen's isogeny and the winding quotient are stated by Lemos for the same wider range.
3. **The two-isogeny selection on E[4].** A proof of the selection lemma EC.3/four-count-full-two-selection that uses only the action on E[4]. Suppose every g in the image G of Galois in GL₂(ℤ/4) has det(1 − g) ≡ 0 mod 4, which Chebotarev's theorem gives from the point counts, and that the image modulo 2 has order 2, fixing the point P = 2e₁ for a basis e₁, e₂ of E[4]. Write g(e₁) = a·e₁ + c·e₂ and g(e₂) = b·e₁ + d·e₂; then a, d are odd, c is even, and det(1 − g) ≡ −bc mod 4, so c ≡ 0 mod 4 or b is even. An element t of G that is nontrivial modulo 2 has b odd, hence c ≡ 0. If some h in G had c ≡ 2, then h would be trivial modulo 2 and th would have b odd and c ≡ 2d ≡ 2, a contradiction. So every element of G maps e₁ to ±e₁, and G acts trivially on {Q in E[4] : 2Q ∈ ⟨P⟩}/⟨P⟩, which is the two-torsion of E/⟨P⟩. This avoids the Weierstrass model and the halving criterion of EC.3/four-count-square-classes. The statement about subgroups of GL₂(ℤ/4) is proved in this roadmap's suggested file.
4. **Lemma 3.2 of Lemos's preprint.** A locator. In arXiv:1702.01985v2 the statement that the correspondence kills the p-old part is Lemma 3.2 (p. 9), quoted from Darmon–Merel, Lemma 6.2(a); the owner's node and its source finding E2 call it Proposition 3.2. Theorem 3.1 there is Chen's theorem and Theorem 3.3 the isogeny for r in {1, 2, 3, 5, 7, 13}.
5. **The Eisenstein series on Γ₀(4).** A supplier. The weight-two Eisenstein combinations E₂(z) − t·E₂(tz) with t > 1, from which the series Σ_{n odd} σ₁(n)qⁿ on Γ₀(4) is built (t = 2 and t = 4), are specified in the upstream layer tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus, in its treatment of Eisenstein series with character at the exceptional weight 2. The owner's node cites Layer 10 and AlgebraicModularFormsAndSerreWeights:R15.2 and has no request for the series; Layer 0 is the layer whose stated scope covers its construction.
6. **Darmon–Merel pagination.** Pagination: in the linked Darmon–Merel author copy, Lemma 8.2 begins on p. 22 and its proof continues on p. 23; Lemma 8.3 is on p. 23. The owner’s locators pp. 23–24 and p. 24 are one page late. This index gives author-copy page numbers without editing the owner.

## Acceptance tests

The roadmap is an index, so its tests are tests of the index.

- Each of the 31 targets has an explicit supplier or recorded gap route. The stated comparisons distinguish exact imports, consequences using baseline declarations, and the wider source claims that are left to the owner. No supplier match implies mathematical closure.
- The seven items of the Bennett–Siksek route are owned: the removed-prime bound (`EC.1/removed-prime-bound`), the thresholds (`EC.2/kraus-f`, `EC.2/kraus-g`, `EC.2/kraus-h`), Kraus's theorem with full two-torsion (`EC.3/kraus-full-two-realization`), Martin's bound (`EC.0/martin-bound`), the two irreducibility statements (`EC.4/irreducible-full-two`, `EC.4/irreducible-one-two`) and Lemos's theorem (`EC.5/lemos-surjectivity`), all in `EllipticModularityEffectiveComparisons`.
- The two notations for the thresholds at level 11 agree: (√2 + 1)² = 3 + 2√2 and (√12 + 1)² = 13 + 4√3; and F(11) < G(11). The suggested file proves these three statements.
- The five polynomials f_r are monic of degree r + 1 with constant terms 4096, 729, 125, 49 and 13, and the values f_r(t)/t at the signed divisors t of the constant term form sets of 25, 13, 8, 6 and 4 integers. The suggested file proves the divisibility step for every monic integer polynomial of degree at least 2: a nonzero rational t with f(t)/t an integer is an integer dividing f(0). Degree 1 fails, as f = X + 1 and t = 1/2 show.
- A prime q ≡ ±1 mod p with p ≥ 11 prime is at least 2p − 1. The suggested file proves this.
- A subgroup G of GL₂(ℤ/4) all of whose elements g satisfy det(1 − g) = 0 and fix 2e₁, and which contains an element that is not the identity modulo 2, maps e₁ into the subgroup generated by e₁. The suggested file proves this; it is the group theory of the third remark above.

## Sources

The mathematics is the owner's, and so are the citations for each declaration. The texts behind the targets are the following; the passages named are those read for the statements above. Each `targetCoverage` entry additionally records its theorem, section and page locator. Darmon–Merel is read in the linked author copy, not with the journal pagination.

- [Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums*](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf). Annals of Mathematics 191 (2020), 355–392; published PDF. Read: §2, pp. 358–360; §3, pp. 361–364; §6, p. 373; references.
- [Alain Kraus, *Majorations effectives pour l’équation de Fermat généralisée*](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf). Canadian Journal of Mathematics 49 (1997), 1139–1161; published PDF. Read: §1 notation; §3.1–3.3, pp. 1142–1146; Appendix I dimension formula; Appendix II, pp. 1158–1160.
- [Greg Martin, *Dimensions of the spaces of cusp forms and newforms on Γ₀(N) and Γ₁(N)*](https://arxiv.org/pdf/math/0306128). arXiv math/0306128v1, 6 June 2003; published J. Number Theory 112 (2005), 298–331; preprint read. Read: Theorems 1–2 and definitions 1A–1F; §4, Lemmas 16–22 and proof of Theorem 2, pp. 14–16 (v1).
- [Barry Mazur; appendix by Dorian Goldfeld, *Rational isogenies of prime degree*](https://www.math.columbia.edu/~goldfeld/Mazur-Goldfeld1978.pdf). Inventiones mathematicae 44 (1978), 129–162; published scan. Read: Introduction, pp. 129–133; §7, pp. 153–155; proof inputs located in §§1,4–6.
- [Pedro Lemos, *Serre’s uniformity conjecture for elliptic curves with rational cyclic isogenies*](https://arxiv.org/pdf/1702.01985v2). arXiv:1702.01985v2, 8 March 2017; published Trans. AMS 371 (2019), 137–146, DOI 10.1090/tran/7198; preprint read. Read: Entire v2, pp. 1–11: Theorems 1.1–1.4; §2; §3; references.
- [Henri Darmon and Loïc Merel, *Winding quotients and some variants of Fermat’s Last Theorem*](https://perso.imj-prg.fr/loic-merel/wp-content/uploads/merel-pub/winding.pdf). Author copy dated 5 January 2001; published J. reine angew. Math. 490 (1997), 81–100; author-copy pagination. Read: §6 notation/Theorem 6.1; §7, Propositions 7.1–7.2, pp. 18–21; §8, Theorem 8.1 and Lemmas 8.2–8.3, pp. 21–23.

The owner also reads Serre's paper on the Chebotarev density theorem, Bilu–Parent–Rebolledo on X₀⁺(p^r) and Banwait–Najman–Padurariu on cyclic isogenies, for the declarations of its layers EC.4 and EC.5. Three mistakes in the sources are recorded in the owner's packet: `EllipticModularityEffectiveComparisons/E1`, `EllipticModularityEffectiveComparisons/E2`, `EllipticModularityEffectiveComparisons/E3`. They concern the rank of the Jacobian of X₀(37) and the degrees of pulled-back divisors in Lemos's preprint, and the meaning of ord_q in Bennett–Siksek's formula for M₀.
