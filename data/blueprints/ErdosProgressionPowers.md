# Perfect powers in primitive arithmetic progressions

## Purpose and boundary

Bennett and Siksek bound the prime exponent in a product of consecutive terms of a primitive arithmetic progression. The main endpoint is exactly an effectively computable absolute threshold k0 such that, for positive k>=k0, integer n,d,y and prime ell, gcd(n,d)=1 and the progression product equal to y^ell imply y*d=0 or ell<=exp(10^k). The exponential has 10 raised to the progression length. No claim replaces it by exp(10*k).

There are two independent analytic endgames after a common arithmetic and modular construction. The original proof uses a quadratic-character PNT, short smooth-modulus correlations, a Gram inequality, a thin-prime sieve and quantitative Roth. Granville’s published addendum uses bounded-height exceptional moduli, a truncated explicit formula and one small-conductor triple avoiding all bad indices. Both routes lead to the same exponent statement. Fixed-exponent rational-point finiteness then gives all-exponent finiteness for each fixed sufficiently large length. It is not finiteness as the length varies, an effective enumeration of points, or the stronger Erdős eventual-nonexistence conjecture.

This roadmap owns the progression-specific normalization, second family, conductor estimates, character selection and endgame adapters. Generic elliptic curves, Frey models, torsion, reduction, Artin conductors, modularity, level lowering, quadratic characters, analytic estimates, Roth, CM and Faltings have existing owners. A mathematical request does not assert that its supplier has a closed proof. A missing owner is a gap, not permission to build a duplicate.

The target-level pass has 48 nodes, with all 80 routed catalogue items accounted for: 79 appear in nodes and the historical Erdős–Selfridge theorem is imported in the statement register. Every node remains unchecked. All eight stages are planned, not closed. Exact supplier requests and gaps are part of this specification; they are not hidden hypotheses.

## Conventions

The index range is 0,...,k-1. Write t_i=n+i*d. Integer gcd is the native nonnegative gcd; it is positive whenever the relevant terms are not all zero. S is the explicit primitive, nontrivial prime-exponent solution predicate of EP.0. H adds k>=10^8 and ell>exp(10^k); Hplus adds k>=2*10^10. Factors and models are attached only under their stated hypotheses.

In the signed factorization, A_i is positive and retains every small-prime power p<k. The signed factor z_i has only primes p>=k. This uses positive odd ell. It is not an ell-powerfree factorization, and the boundary prime p=k belongs to the large side. In the separate Darmon–Granville adapter the finite coefficient classes are ell-powerfree representatives, including signs; they must not be confused with A_i.

The native equation Y²=X(X-a)(X+c), a+b+c=0, has discriminant 16(abc)² and c4=16(a²-bc). Its progression-coordinate discriminant is 64*t_i²*t_j²*t_h²/g⁶. A displayed equation discriminant is not automatically a minimal discriminant at 2. The second equation is Y²=X(X²+2*kappa*d*X+kappa*A), with discriminant -64*kappa³*A²*B. Local reduction predicates concern minimal integral equations, not arbitrary isomorphic equations.

M is an original elliptic conductor, M0 a deletion level, and N(rho) a prime-to-ell residual Artin conductor. Their equality needs the coefficient-prime theorem. M_a is the first-family deletion level until that bridge is proved. N_a is instead the actual conductor of the selected primitive quadratic character. Its odd part is N_a/2^v2(N_a), is squarefree and divides the small coefficient product; it is not asserted to equal its largest odd squarefree divisor. N_a<=8*N_a^odd is the dyadic bound. The largest prime factor P(N) uses the native convention, but applications always have N>1.

The half interval is k/2<m<=k, with integer m; the suggested finite sum uses the floor k/2. Lambda is the von Mangoldt function, so prime powers are included. A prime-only sum is explicitly labeled. Real logarithms, square roots, casts and nonintegral powers are used throughout numerical estimates. Natural subtraction is not used in place of signed rational or real expressions. The selected character has a large absolute sum. A negative signed multiple of a character is not silently treated as another multiplicative character.

## Construction order

The common spine is EP.0 → EP.1 → EP.2. From there, EP.3 → EP.4 is the original analytic route and EP.5 is the Granville route. Each feeds EP.6. EP.7 is a separate statement register and contributes no conjectural premise to either route.

Every definition and construction below states its native carrier, use-derived API and discriminating tests. A construction’s simultaneous conclusions refer to one chosen object. The two witnesses of EP.4 and EP.5 cannot be replaced by unrelated existential choices for each desired property.

## Pinned baseline

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 are the baseline. Each declaration cited in the packet was checked by reading its actual source statement; the index located it. Native Weierstrass coefficients/invariants, positive integer gcd, integer prime valuations, factorization, largest prime factor, primitive Dirichlet characters, actual conductor, meromorphic Dirichlet L-functions and von Mangoldt are reused. Tau Ceti’s existing Frobenius trace is not reconstructed. Mathlib’s naive Dirichlet LSeries, which has a junk value outside convergence, is not used to define exceptional zeros.

The reviewed audit and the exact supplier descriptions were read before assigning ownership. Existing CA.1 squareclass/conductor nodes, CA.4 quartic descent, the SV.2 diagonal/off-diagonal Gram node and the AN.5 eventual divisor-subpower node are reused by id. ES.0’s current CRT, finite differencing and numerical nodes do not yet provide the complete generic Proposition 8.2 cancellation theorem. The missing named Legendre-interface roadmap is explicitly recorded rather than cited through an invented stage.

## EP.0. Primitive solutions and signed factors

Define primitive nontrivial solutions with n,d,y in Z, positive length k and prime exponent ell, using the exact product over 0<=i<k and positive integer gcd. Prove the gcd-of-two-terms and large-prime valuation contracts. Construct the unique positive small-prime factors A_i with signed large-prime factors y_i for odd ell. Define strict arithmetic-progression triples and equal-sum quadruples. Define divisibility index sets and their one-residue-class cardinal bounds, including the +1 boundary.

**Coverage:** planned, not closed.

### Primitive progression solutions

`ErdosProgressionPowers:EP.0/primitive-solution` · definition · proposed name `TauCeti.ProgressionPowers.primitive_solution`.

For n,d,y in Z and k,ell in N, S(n,d,k,y,ell) means k>0, ell prime, gcd(n,d)=1, product over i in range(k) of n+i*d equals y^ell, and y*d is nonzero. H adds k>=10^8 and ell>exp(10^k); Hplus adds k>=2*10^10. All real casts and exponentials are explicit.

Proof or construction route:

1. Use the native positive integer gcd and finite product. Nonzero product implies every indexed term is nonzero. H and Hplus are explicit conjunctions, not new opaque assumptions.

Direct prerequisites: `mathlib:Int.gcd_def`.

Recorded uses:

- BS20 §3 and every subsequent modular argument: supplies the exact signed, primitive, nonzero product hypothesis.

- EP.6 effective prime bound: negates H for sufficiently large k without asserting positivity of n,d,y.

API:

- `TauCeti.ProgressionPowers.primitive_solution_iff` (characterisation): S is equivalent to precisely the five conjuncts in its definition.

- `TauCeti.ProgressionPowers.primitive_solution_term_ne_zero` (relation): S and i<k imply n+i*d is nonzero.

- `TauCeti.ProgressionPowers.primitive_solution_prime` (projection): S implies ell is prime and ell>=2.

Unit tests:

- `TauCeti.ProgressionPowers.primitive_solution_square` (computation): S(1,24,3,35,2) holds: 1*25*49=35^2.

- `TauCeti.ProgressionPowers.primitive_solution_signed` (computation): S(-3,2,4,3,2) holds; its four factors are -3,-1,1,3.

- `TauCeti.ProgressionPowers.primitive_solution_zero_length` (degenerate): S(n,d,0,y,ell) never holds.

- `TauCeti.ProgressionPowers.primitive_solution_nonprimitive` (non-example): S(4,2,1,2,2) does not hold despite its product equation.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Sections 1 and 3, equation (2), pp. 356, 360.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/01`.

### Gcd of progression terms

`ErdosProgressionPowers:EP.0/term-gcd` · lemma · proposed name `TauCeti.ProgressionPowers.term_gcd`.

If gcd(n,d)=1 and 0<=i<j, then gcd(n+i*d,n+j*d) divides j-i, with gcd nonnegative and the right side a natural integer.

Proof or construction route:

1. Subtract the two terms. Any common divisor divides (j-i)*d. The term is coprime to d by a Bezout combination with n; cancel d using the native gcd cancellation theorem.

Direct prerequisites: `ErdosProgressionPowers:EP.0/primitive-solution`, `mathlib:Int.gcd_greatest`, `mathlib:Int.dvd_of_dvd_mul_left_of_gcd_one`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Lemma 3.1(i), p. 360.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/11`.

### Large-prime valuation divisibility

`ErdosProgressionPowers:EP.0/large-prime-valuations` · lemma · proposed name `TauCeti.ProgressionPowers.large_prime_valuations`.

Assume S. For prime q>=k and i<k, ell divides padicValInt(q,n+i*d). The valuation is on the absolute value of a nonzero integer.

Proof or construction route:

1. The gcd bound prevents q dividing two distinct terms because their difference of indices is less than q. Apply valuation additivity to the nonzero product and the ell-th power. Only the chosen term contributes.

Direct prerequisites: `ErdosProgressionPowers:EP.0/term-gcd`, `mathlib:padicValInt`, `mathlib:padicValInt.mul`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Lemma 3.1(ii), p. 360.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/12`.

### Signed small-prime factorization

`ErdosProgressionPowers:EP.0/signed-factors` · construction · proposed name `TauCeti.ProgressionPowers.signed_factors`.

For positive odd ell and nonzero terms n+i*d, i<k, whose valuations at every prime q>=k are divisible by ell, choose the unique family (A_i,z_i) with A_i>0, z_i a nonzero signed integer, n+i*d=A_i*z_i^ell, every prime of A_i <k and every prime of |z_i| >=k. S with odd ell supplies these hypotheses. All powers of small primes remain in A_i; it need not be ell-powerfree.

Proof or construction route:

1. Split the factorization of |n+i*d| at the strict bound k. Divide each large-prime exponent by ell using large-prime valuation divisibility. Since ell is odd, restore the sign in z_i. Unique factorization and injectivity of odd powers give uniqueness.

Direct prerequisites: `ErdosProgressionPowers:EP.0/large-prime-valuations`, `mathlib:Nat.factorization`, `mathlib:Nat.prod_factorization_pow_eq_self`.

Recorded uses:

- BS20 §§3,9,12: isolates small-prime coefficients for reduced conductors and factorial deletion.

API:

- `TauCeti.ProgressionPowers.signed_factors_eq` (projection): For i<k, n+i*d=A_i*z_i^ell.

- `TauCeti.ProgressionPowers.signed_factors_support` (characterisation): A_i>0 and z_i!=0; p|A_i implies p<k, and p||z_i| implies k<=p, for every prime p.

- `TauCeti.ProgressionPowers.signed_factors_unique` (extensionality): Any family with these equality, sign and support conditions agrees componentwise with the chosen family.

- `TauCeti.ProgressionPowers.signed_factors_sign` (relation): The sign of z_i is the sign of n+i*d.

Unit tests:

- `TauCeti.ProgressionPowers.signed_factors_negative` (computation): For S(-8,1,1,-2,3), the single factor is (1,-2).

- `TauCeti.ProgressionPowers.signed_factors_boundary` (computation): For S(8,19,2,6,3), the factors are (1,2),(1,3); the prime p=k=2 belongs to the large side.

- `TauCeti.ProgressionPowers.signed_factors_small_power` (non-example): For n=64,d=0,k=3,ell=3 the valuation construction gives (64,1) at each index; 64 retains its full small-prime exponent and is not cube-free. This tests the construction, not S, since d=0.

- `TauCeti.ProgressionPowers.signed_factors_mixed_sign` (computation): For S(-8,7,2,2,3), the factors are (1,-2),(1,-1).

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Equation (6), p. 360.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/13`.

### Three-term progression triples

`ErdosProgressionPowers:EP.0/ap-triples` · definition · proposed name `TauCeti.ProgressionPowers.ap_triples`.

A(k) is the finite set of natural triples (i,j,h) with i,j,h<k, i<j and i+h=2*j. Thus i<j<h and the spacing is positive; there is no truncated subtraction in its definition.

Proof or construction route:

1. Filter the finite product of three copies of range(k) by the two displayed conditions. Membership and strict h>j follow by natural-number arithmetic.

Recorded uses:

- BS20 §3 first Frey family: indexes nontrivial three-term progressions.

- BS20 §§9,12: Roth and disjoint-block selection choose one member of this same set.

API:

- `TauCeti.ProgressionPowers.ap_triples_mem` (characterisation): Membership is equivalent to i,j,h<k, i<j and i+h=2*j.

- `TauCeti.ProgressionPowers.ap_triples_spacing` (relation): A member has i<j<h and j-i=h-j>0.

- `TauCeti.ProgressionPowers.ap_triples_mono` (functoriality): k<=K implies A(k) is a subset of A(K).

Unit tests:

- `TauCeti.ProgressionPowers.ap_triples_empty` (degenerate): A(0)=A(1)=A(2)=empty.

- `TauCeti.ProgressionPowers.ap_triples_three` (computation): A(3) consists exactly of (0,1,2).

- `TauCeti.ProgressionPowers.ap_triples_five` (computation): A(5) has exactly four elements.

- `TauCeti.ProgressionPowers.ap_triples_no_constant` (non-example): No triple (i,i,i) belongs to A(k).

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Section 3.1, equations (7)-(8), p. 361.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/14`.

### Equal-sum progression quadruples

`ErdosProgressionPowers:EP.0/equal-sum-quadruples` · definition · proposed name `TauCeti.ProgressionPowers.equal_sum_quadruples`.

I(k) consists of (j1,i1,i2,j2) in range(k)^4 with j1<i1<=i2<j2 and i1+i2=j1+j2. Equality i1=i2 is permitted.

Proof or construction route:

1. Filter the fourfold finite product. The positive gap makes kappa=j1*j2-i1*i2 a negative integer, of absolute value less than k^2.

Recorded uses:

- BS20 Lemmas3.4–3.5 and4.1: indexes the second Frey model, including the repeated-middle-index case.

API:

- `TauCeti.ProgressionPowers.equal_sum_quadruples_mem` (characterisation): Membership is equivalent to the four bounds, ordering and equal-sum equation.

- `TauCeti.ProgressionPowers.equal_sum_quadruples_kappa` (relation): For a member, the integer kappa is negative and 0<|kappa|<k^2.

- `TauCeti.ProgressionPowers.equal_sum_quadruples_mono` (functoriality): The quadruple sets are monotone in k.

Unit tests:

- `TauCeti.ProgressionPowers.equal_sum_quadruples_empty` (degenerate): I(2) is empty.

- `TauCeti.ProgressionPowers.equal_sum_quadruples_three` (computation): I(3) consists exactly of (0,1,1,2), with kappa=-1.

- `TauCeti.ProgressionPowers.equal_sum_quadruples_repeated` (non-example): The middle indices in (0,1,1,2) must not be required to be distinct.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Section 3.2, equations (11)-(13), p. 362.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/20`.

### Divisibility index sets

`ErdosProgressionPowers:EP.0/divisibility-indices` · definition · proposed name `TauCeti.ProgressionPowers.divisibility_indices`.

For n,d in Z and k,r in N, I_r is the set of i<k such that the integer r divides n+i*d. The definition is total, including r=0; counting statements require r>0.

Proof or construction route:

1. Filter range(k) by integer divisibility, rather than by a rational or real quotient. The range excludes k.

Recorded uses:

- BS20 §9 sieve losses: counts the indices deleted by small primes.

- BS20 Proposition 12.3: counts large exceptional divisors, retaining the +1 term.

API:

- `TauCeti.ProgressionPowers.divisibility_indices_mem` (characterisation): i belongs to I_r iff i<k and (r:Z)|(n+i*d).

- `TauCeti.ProgressionPowers.divisibility_indices_one` (simp): I_1 equals range(k).

- `TauCeti.ProgressionPowers.divisibility_indices_prime_d` (relation): If gcd(n,d)=1, p is prime and p|d, then I_p is empty.

Unit tests:

- `TauCeti.ProgressionPowers.divisibility_indices_sample` (computation): For n=1,d=2,k=6,r=3, I_r={1,4}.

- `TauCeti.ProgressionPowers.divisibility_indices_empty` (degenerate): For k=0 the set is empty, for every r.

- `TauCeti.ProgressionPowers.divisibility_indices_boundary` (non-example): For n=1,d=1,k=3,r=4, the set is empty; index k=3 is not included.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, §9 before Proposition 9.1, p. 381; Proof of Proposition 12.3, pp.387–388.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/100`, `PAPER-BENNETT-SIKSEK-20/140`.

### One-residue-class count

`ErdosProgressionPowers:EP.0/residue-class-count` · lemma · proposed name `TauCeti.ProgressionPowers.residue_class_count`.

If gcd(n,d)=1 and r>0, then I_r is empty when gcd(r,d)>1. Otherwise I_r is a single residue class modulo r and |I_r|<=k/r+1 as a real inequality; for prime p with p not dividing d, ||I_p|-k/p|<1.

Proof or construction route:

1. A common prime of r,d cannot divide n. In the coprime case invert d modulo r and count one class in range(k); keep the rounding error even for r>k.

Direct prerequisites: `ErdosProgressionPowers:EP.0/divisibility-indices`, `ErdosProgressionPowers:EP.0/term-gcd`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, §9 before Proposition 9.1, p. 381; Proof of Proposition 12.3, pp.387–388.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/100`, `PAPER-BENNETT-SIKSEK-20/140`.

## EP.1. Frey families and residual comparisons

Normalize the three progression terms to coprime a+b+c=0 and specialize the upstream Frey-Hellegouarch model, without constructing a second generic curve. Build the application-specific equal-sum second model, its discriminant and odd-prime local tests. Prove the reduced-level divisibility, odd squarefreeness and exponential bounds for both families. Prove that primes k/2<p<=k divide d under k>=10^8 and ell>exp(10^k); the two-term case needs its own c4-unit test. Establish the coefficient-prime Serre-weight/conductor bridge, compare to an actual full-two-torsion curve at the reduced level using Kraus, and prove good reduction and equality of integer traces throughout the half interval, including forced trace zero at primes 3 modulo4.

**Coverage:** planned, not closed.

**Stage inputs:** `AnalyticNumberTheory:AN.2`, `AnalyticNumberTheory:AN.5`, `ArithmeticGaloisRepresentations:R01.3`, `EllipticModularityEffectiveComparisons:EC.1`, `EllipticModularityEffectiveComparisons:EC.2`, `EllipticModularityEffectiveComparisons:EC.3`, `EllipticModularityEffectiveComparisons:EC.4`, `ErdosProgressionPowers:EP.0`, `SerreWeightAndLevelOptimisation:R20.2`, `SerreWeightAndLevelOptimisation:R20.4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-8-selected-ℚ-specific-database-adapters`.

### Progression Frey specialization

`ErdosProgressionPowers:EP.1/first-curve` · construction · proposed name `TauCeti.ProgressionPowers.first_curve`.

For integer n,d and a triple (i,j,h), put t_r=n+r*d, g=gcd(t_i,gcd(2*t_j,t_h)), a=t_i/g, b=-2*t_j/g, c=t_h/g. The specialization E has coefficients a1=a3=a6=0, a2=c-a, a4=-a*c, equivalently Y^2=X(X-a)(X+c). Under S and membership in A(k), g>0 and a,b,c are nonzero pairwise coprime with a+b+c=0. This is an application adapter to the upstream Frey model, not a second generic Frey carrier.

Proof or construction route:

1. Normalize by the positive gcd. Use i+h=2*j and the gcd-of-terms contract. Specialize the upstream model to these coefficients and compare its native Weierstrass coefficients. At present the upstream generic adapter is planned but absent; the source-specific polynomial model is typable.

Direct prerequisites: `ErdosProgressionPowers:EP.0/ap-triples`, `ErdosProgressionPowers:EP.0/term-gcd`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-8-selected-ℚ-specific-database-adapters`, `mathlib:WeierstrassCurve`, `mathlib:Int.gcd_def`.

Recorded uses:

- BS20 §3 first Frey family: attaches the existing Frey model to a primitive normalized progression.

- EP.2 CM exclusion: uses its c4 and discriminant to calculate j.

API:

- `TauCeti.ProgressionPowers.first_curve_coefficients` (data): The native five coefficients are 0,c-a,0,-a*c,0, with a,c the normalized terms.

- `TauCeti.ProgressionPowers.first_curve_normalization` (relation): Under S and a member of A(k), g>0; g*a=t_i, g*b=-2*t_j, g*c=t_h; a+b+c=0 and every pair is coprime.

- `TauCeti.ProgressionPowers.first_curve_frey_compatibility` (compatibility): The specialization equals the upstream Frey model on the normalized coefficients, when that interface is supplied.

Unit tests:

- `TauCeti.ProgressionPowers.first_curve_unit_gcd` (computation): n=1,d=1,(i,j,h)=(0,1,2) gives g=1, (a,b,c)=(1,-4,3), a2=2,a4=-3.

- `TauCeti.ProgressionPowers.first_curve_even_gcd` (computation): n=2,d=1,(0,1,2) gives g=2, (a,b,c)=(1,-3,2), a2=1,a4=-2.

- `TauCeti.ProgressionPowers.first_curve_signed` (computation): n=-3,d=2,(0,1,2) gives (a,b,c)=(-3,2,1), a2=4,a4=3.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Section 3.1, equations (7)-(8), p. 361; Section 3.1, display before equation (7), p. 361.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/14`, `PAPER-BENNETT-SIKSEK-20/15`.

### First-family invariants and odd local properties

`ErdosProgressionPowers:EP.1/first-local-invariants` · theorem · proposed name `TauCeti.ProgressionPowers.first_local_invariants`.

Under S, odd ell and a triple in A(k), Delta(E)=16(abc)^2=64*t_i^2*t_j^2*t_h^2/g^6, c4(E)=16(a^2-b*c); E is minimal and semistable at each odd prime, and ell divides v_p(Delta(E)) for every prime p>=k. The displayed Delta is for this equation, not an arbitrary minimal change at 2.

Proof or construction route:

1. Compute the native Weierstrass discriminant and c4 by polynomial algebra. Pairwise coprimality forces c4 a unit whenever an odd prime divides Delta; use the upstream minimal/multiplicative criterion. At p>=k the gcd is a unit and the large-prime valuations are multiples of ell.

Direct prerequisites: `ErdosProgressionPowers:EP.1/first-curve`, `ErdosProgressionPowers:EP.0/large-prime-valuations`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.c₄`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Lemma 3.2 discriminant display, p. 361; corrected normalization; Lemma 3.2, p. 361; Lemma 3.2 last conclusion, p.361.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/16`, `PAPER-BENNETT-SIKSEK-20/17`, `PAPER-BENNETT-SIKSEK-20/132`.

Prototype boundary: The equation invariants are stated; the local minimality, semistability and valuation clauses require reconciliation with the actual p-adic reduction signatures.

### Progression generalized Fermat identities

`ErdosProgressionPowers:EP.1/linear-fermat-identities` · lemma · proposed name `TauCeti.ProgressionPowers.linear_fermat_identities`.

For any integers i1<i2<i3, (i3-i2)t_i1+(i1-i3)t_i2+(i2-i1)t_i3=0. Under signed factorization substitute t_i=A_i*z_i^ell. For a triple in A(k) this is A_i*z_i^ell-2*A_j*z_j^ell+A_h*z_h^ell=0.

Proof or construction route:

1. Expand t_i=n+i*d, cancel n and d terms, then substitute the signed factor equalities. No generalized-Fermat theorem is assumed.

Direct prerequisites: `ErdosProgressionPowers:EP.0/signed-factors`, `ErdosProgressionPowers:EP.0/ap-triples`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Section 3.1, display before equation (7), p. 361; §3.1 opening, p. 361.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/15`, `PAPER-BENNETT-SIKSEK-20/63`.

### Equal-sum second Frey family

`ErdosProgressionPowers:EP.1/second-curve` · construction · proposed name `TauCeti.ProgressionPowers.second_curve`.

For q=(j1,i1,i2,j2) define A=t_j1*t_j2, B=t_i1*t_i2 and the integer kappa=j1*j2-i1*i2. The native Weierstrass model has coefficients 0,2*kappa*d,0,kappa*A,0. For q in I(k), A-B=kappa*d^2, kappa<0 and |kappa|<k^2. Signed factor substitution gives A_j1*A_j2*(z_j1*z_j2)^ell-A_i1*A_i2*(z_i1*z_i2)^ell=kappa*d^2.

Proof or construction route:

1. Use the equal-sum cancellation to obtain the quadratic identity. This second curve is source-specific and is not a generic replacement elliptic-curve carrier. Its invariants are obtained by the native coefficient formulas.

Direct prerequisites: `ErdosProgressionPowers:EP.0/equal-sum-quadruples`, `ErdosProgressionPowers:EP.0/signed-factors`, `mathlib:WeierstrassCurve`.

Recorded uses:

- BS20 §3 second Frey family: handles the two-endpoint-divisibility branch in Lemma 4.1.

API:

- `TauCeti.ProgressionPowers.second_curve_coefficients` (data): The coefficients are 0,2*kappa*d,0,kappa*A,0.

- `TauCeti.ProgressionPowers.second_curve_difference` (relation): Membership in I(k) implies A-B=kappa*d^2 and kappa<0.

- `TauCeti.ProgressionPowers.second_curve_equation` (compatibility): Its native affine equation is Y^2=X*(X^2+2*kappa*d*X+kappa*A).

Unit tests:

- `TauCeti.ProgressionPowers.second_curve_three` (computation): n=d=1,q=(0,1,1,2) gives kappa=-1,A=3,B=4,a2=-2,a4=-3.

- `TauCeti.ProgressionPowers.second_curve_signed` (computation): n=-3,d=2,q=(0,1,1,2) gives kappa=-1,A=-3,B=1,a2=-4,a4=3.

- `TauCeti.ProgressionPowers.second_curve_not_first` (non-example): At n=d=1,q=(0,1,1,2) the second a2 is -2, while the first model on (0,1,2) has a2=2.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Section 3.2, equations (11)-(13), p. 362; Equation (11), p. 362.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/20`, `PAPER-BENNETT-SIKSEK-20/62`.

### Second-family invariants and local tests

`ErdosProgressionPowers:EP.1/second-local-invariants` · theorem · proposed name `TauCeti.ProgressionPowers.second_local_invariants`.

Under S, odd ell and q in I(k), Delta(E_q)=-64*kappa^3*A^2*B and c4(E_q)=16*kappa*(4*kappa*d^2-3*A). At prime p>=k with p not dividing kappa the model is minimal and semistable and ell divides v_p(Delta). In the separate Lemma 4.1 branch q=(i,i+1,i+p-1,i+p) with k/2<p<=k, p not dividing d and both endpoint terms divisible by p, one has p|A, p not dividing B*kappa*d, ell|v_p(A), c4 a p-unit and positive Delta valuation divisible by ell; thus reduction is minimal multiplicative there.

Proof or construction route:

1. Compute invariants using A-B=kappa*d^2. For p>=k use gcd and large valuations. For the half-interval two-term branch use unique or paired term valuations from the product equation and p-unit d, gaps p-1,1; prove the c4 unit directly. Do not invoke the p>=k statement at p<k.

Direct prerequisites: `ErdosProgressionPowers:EP.1/second-curve`, `ErdosProgressionPowers:EP.0/term-gcd`, `ErdosProgressionPowers:EP.0/large-prime-valuations`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Lemma 3.4, p. 362; Lemma 3.4 last conclusion, p.362; §4 second case, p.364.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/21`, `PAPER-BENNETT-SIKSEK-20/22`, `PAPER-BENNETT-SIKSEK-20/135`, `PAPER-BENNETT-SIKSEK-20/136`.

Prototype boundary: The equation invariants are stated; the p-adic local and two-term half-interval clauses are mathematical specifications, not fully typed local-model signatures.

### First-family reduced-level bounds

`ErdosProgressionPowers:EP.1/first-reduced-level` · theorem · proposed name `TauCeti.ProgressionPowers.first_reduced_level`.

For S, ell>=7 and a in A(k), the irreducible residual representation of E_a occurs in a weight-two newform at the deletion level M_a. M_a divides 2^8*A_i*A_j*A_h, its odd part is squarefree, M_a divides 2^7*product over primes q<=k of q, and M_a<=2^7*exp(1.000081*k). No identification with the prime-to-ell residual conductor is implicit.

Proof or construction route:

1. Import the uniform full-two-torsion irreducibility cutoff and modular level lowering. Delete odd multiplicative primes whose Delta valuation is divisible by ell. Odd local exponents are zero or one; use the exact wild bound at 2. Apply the imported explicit Chebyshev upper bound at x=k.

Direct prerequisites: `ErdosProgressionPowers:EP.1/first-local-invariants`, `ErdosProgressionPowers:EP.0/signed-factors`, `EllipticModularityEffectiveComparisons:EC.4`, `SerreWeightAndLevelOptimisation:R20.2`, `ArithmeticGaloisRepresentations:R01.3`, `AnalyticNumberTheory:AN.2`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Lemma 3.3, equation (9), and proof, pp. 361-362; Lemma 3.3 and proof, pp. 361-362; Proof of Lemma 3.3, p.362.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/18`, `PAPER-BENNETT-SIKSEK-20/19`, `PAPER-BENNETT-SIKSEK-20/133`, `PAPER-BENNETT-SIKSEK-20/134`.

Prototype boundary: this geometric endpoint is specified here but omitted from the suggested declarations until its native supplier interface is available.

### Second-family reduced-level bounds

`ErdosProgressionPowers:EP.1/second-reduced-level` · theorem · proposed name `TauCeti.ProgressionPowers.second_reduced_level`.

For S, ell>=11 and q in I(k), E_q has irreducible residual representation realized by a weight-two newform at deletion level M_q, with M_q dividing 2^7*3^5*kappa^2*product over primes r<=k of r^2 and M_q<=2^7*3^5*k^4*exp(2.000162*k).

Proof or construction route:

1. Use the rational-two-torsion irreducibility cutoff. Apply level lowering with the second local tests. Keep wild factors at 2 and3 and the kappa^2 exceptional factor; use |kappa|<k^2 and Chebyshev bound.

Direct prerequisites: `ErdosProgressionPowers:EP.1/second-local-invariants`, `EllipticModularityEffectiveComparisons:EC.4`, `SerreWeightAndLevelOptimisation:R20.2`, `ArithmeticGaloisRepresentations:R01.3`, `AnalyticNumberTheory:AN.2`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Lemma 3.5 and proof, p. 363; Proof of Lemma 3.5, p.363.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/23`, `PAPER-BENNETT-SIKSEK-20/137`.

Prototype boundary: this geometric endpoint is specified here but omitted from the suggested declarations until its native supplier interface is available.

### Half-interval primes divide the difference

`ErdosProgressionPowers:EP.1/half-primes-divide-d` · theorem · proposed name `TauCeti.ProgressionPowers.half_primes_divide_d`.

Under H every prime p in (k/2,k] divides d.

Proof or construction route:

1. Suppose p does not divide d. One or two terms are divisible by p. Choose a first-family triple containing the unique term, or the source equal-sum quadruple for two terms. Prove minimal multiplicative reduction and deleted p; p differs from ell. Apply the exact removed-prime norm bound to M_a or M_q. The exponential level bounds contradict ell>exp(10^k), using the numerical range k>=10^8.

Direct prerequisites: `ErdosProgressionPowers:EP.1/first-reduced-level`, `ErdosProgressionPowers:EP.1/second-reduced-level`, `ErdosProgressionPowers:EP.1/second-local-invariants`, `EllipticModularityEffectiveComparisons:EC.1/removed-prime-bound`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Lemma 4.1, p. 364.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/24`.

### Serre-weight and residual-conductor bridge

`ErdosProgressionPowers:EP.1/coefficient-prime-bridge` · lemma · proposed name `TauCeti.ProgressionPowers.coefficient_prime_bridge`.

Under H, E_a[ell] is irreducible of Serre weight 2, its prime-to-ell Artin conductor equals the deletion level M_a, and ell does not divide M_a.

Proof or construction route:

1. The level bound places ell above all level primes. At ell, use the good or finite-flat multiplicative case of coefficient-prime weight-two lowering, justified by the large-prime discriminant divisibility. Match every local conductor exponent with the deletion level. This is a real theorem, not an equality assigned by definition.

Direct prerequisites: `ErdosProgressionPowers:EP.1/first-reduced-level`, `ErdosProgressionPowers:EP.0/large-prime-valuations`, `SerreWeightAndLevelOptimisation:R20.4`, `ArithmeticGaloisRepresentations:R01.3`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Adapter between Theorem 4 and Lemma 5.1, §§2–5.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/150`.

Prototype boundary: this geometric endpoint is specified here but omitted from the suggested declarations until its native supplier interface is available.

### Kraus threshold for progression levels

`ErdosProgressionPowers:EP.1/kraus-progression-threshold` · lemma · proposed name `TauCeti.ProgressionPowers.kraus_progression_threshold`.

Under H, mu(M_a) and mu(lcm(M_a,4)) are at most 2^8*log(k)*exp(1.000081*k), and the exact Kraus threshold H_K(M_a) is less than exp(10^k). Here mu is the Gamma0 index and the dimension in H_K is the trivial-character newspace dimension.

Proof or construction route:

1. Use the primorial divisibility and the explicit totient ratio bound. Combine the resulting mu bounds with the upstream Martin newspace inequality and exact Kraus F,G,H definitions; compare their logarithms to 10^k. Do not use the full Gamma1 dimension.

Direct prerequisites: `ErdosProgressionPowers:EP.1/first-reduced-level`, `EllipticModularityEffectiveComparisons:EC.2/kraus-f`, `EllipticModularityEffectiveComparisons:EC.2/kraus-g`, `EllipticModularityEffectiveComparisons:EC.2/kraus-h`, `AnalyticNumberTheory:AN.5`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Proof of Lemma 5.1, p. 365 (Tenenbaum Theorem 9 and following remark).

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/64`.

Prototype boundary: this geometric endpoint is specified here but omitted from the suggested declarations until its native supplier interface is available.

### Actual comparison elliptic curve

`ErdosProgressionPowers:EP.1/comparison-curve` · theorem · proposed name `TauCeti.ProgressionPowers.comparison_curve`.

Under H, for every a in A(k) there exists an actual elliptic curve F_a/Q with full rational two-torsion, conductor exactly M_a and residual representation at the same prime ell isomorphic to that of E_a. All subsequent choices use one such F_a for each triple.

Proof or construction route:

1. Apply the Kraus realization theorem with the coefficient-prime bridge, irreducibility and the strict threshold just proved. Fix a choice only after proving existence. A free natural-number field called conductor is not an admissible substitute for the native invariant.

Direct prerequisites: `ErdosProgressionPowers:EP.1/coefficient-prime-bridge`, `ErdosProgressionPowers:EP.1/kraus-progression-threshold`, `EllipticModularityEffectiveComparisons:EC.3`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Lemma 5.1, p. 365.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/25`.

Prototype boundary: this geometric endpoint is specified here but omitted from the suggested declarations until its native supplier interface is available.

### Good reduction and forced trace zero

`ErdosProgressionPowers:EP.1/good-trace-comparison` · theorem · proposed name `TauCeti.ProgressionPowers.good_trace_comparison`.

Under H, a in A(k), and prime k/2<p<=k, both E_a and its chosen F_a have good reduction at p and their integer Frobenius traces agree. If p is 3 modulo 4, that common trace is zero and F_a has supersingular reduction. Trace zero implies the supersingular criterion here because p>=5; the geometric definition is not replaced by trace zero in all characteristics.

Proof or construction route:

1. p|d and gcd(n,d)=1 imply every term is a p-unit, hence good reduction for the first model. The level bound gives good reduction of F_a. Residual congruence together with the Hasse bounds and ell>4*sqrt(p) makes the integer traces equal. Reducing the first model with d=0 modulo p gives a twist of Y^2=X(X-1)(X+1), whose trace vanishes for p3mod4.

Direct prerequisites: `ErdosProgressionPowers:EP.1/comparison-curve`, `ErdosProgressionPowers:EP.1/half-primes-divide-d`, `ErdosProgressionPowers:EP.1/first-local-invariants`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `SerreWeightAndLevelOptimisation:R20.2`, `tauceti:WeierstrassCurve.frobeniusTrace`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Lemma 5.2, first conclusion, pp. 365-366; Lemma 5.2, second conclusion, pp. 365-366.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/26`, `PAPER-BENNETT-SIKSEK-20/27`.

Prototype boundary: this geometric endpoint is specified here but omitted from the suggested declarations until its native supplier interface is available.

## EP.2. Legendre cases and the simultaneous character family

Partition the six Legendre parameters by -Q^2 union2Q^2. Prove the application-specific nonsquare test at primes 3 mod 8, positive normalization lambda=2t^2 and 1-lambda=2v^2 in CaseII, and the tv square test at primes 5 mod 8 using the corrected order-four witness imported from the Legendre-interface owner. Exclude complex multiplication of the progression Frey curve. Under k>=2*10^10 construct one fixed family of primitive quadratic characters of conductors N_a with squarefree nontrivial odd part dividing M_a and absolute von-Mangoldt half-interval sum greater than 0.1239k. Both cases must give all conclusions for the same character; positivity of the signed sum is not assumed.

**Coverage:** planned, not closed.

**Stage inputs:** `AnalyticNumberTheory:AN.2`, `ClassicalArithmeticCompletion:CA.1`, `ClassicalArithmeticCompletion:CA.4`, `ComplexMultiplicationAndExplicitReciprocity:CM.3`, `ComplexMultiplicationAndExplicitReciprocity:CM.4`, `EllipticModularityEffectiveComparisons:EC.5`, `ErdosProgressionPowers:EP.0`, `ErdosProgressionPowers:EP.1`.

### Legendre case partition

`ErdosProgressionPowers:EP.2/case-partition` · construction · proposed name `TauCeti.ProgressionPowers.case_partition`.

Given k and finite parameter sets L_a of rational numbers for a in A(k), form CaseI={a: some lambda in L_a is neither minus a rational square nor twice a rational square} and CaseII=A(k) minus CaseI. In the application L_a is the six-parameter set of the same chosen F_a, supplied by the Legendre-interface owner. Both cases are disjoint and exhaust A(k).

Proof or construction route:

1. Filter A(k) by the explicit rational-square predicate and take the relative complement. Import the six-parameter interface rather than reconstructing the generic Legendre theory here.

Direct prerequisites: `ErdosProgressionPowers:EP.0/ap-triples`, `ErdosProgressionPowers:EP.1/comparison-curve`.

Recorded uses:

- BS20 §6: splits the simultaneous character construction into exhaustive branches.

API:

- `TauCeti.ProgressionPowers.case_partition_mem` (characterisation): Membership in CaseI is the stated existential nonsquare condition; membership in CaseII means every parameter is in -Q^2 union2Q^2.

- `TauCeti.ProgressionPowers.case_partition_union` (relation): The union of the two components is A(k) and they are disjoint.

- `TauCeti.ProgressionPowers.case_partition_reindex` (functoriality): Pointwise equal finite parameter sets give equal partitions.

Unit tests:

- `TauCeti.ProgressionPowers.case_partition_three` (computation): k=3 and L_a={3} put the unique triple in CaseI, not CaseII.

- `TauCeti.ProgressionPowers.case_partition_minus_one` (computation): k=3 and L_a={-1} put the unique triple in CaseII.

- `TauCeti.ProgressionPowers.case_partition_empty` (degenerate): k=0 gives two empty sets for every parameter assignment.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, §6, p. 367.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/75`.

### Case-I nonsquare and absolute projection

`ErdosProgressionPowers:EP.2/case-one-projection` · theorem · proposed name `TauCeti.ProgressionPowers.case_one_projection`.

Under H, every associated Legendre parameter lambda is a nonsquare modulo every prime k/2<p<=k with p = 3 mod 8. Under Hplus, a CaseI parameter lies outside all four squareclasses ±Q^2,±2Q^2. The primitive characters of lambda,-lambda,2lambda,-2lambda have mod8 projection mu1-mu2-mu3+mu4=4*(lambda/p) at p = 3 mod 8 and zero otherwise, away from support. One of the four therefore has absolute prime-weighted sum at least (1-3*0.002811)*k/8 and nontrivial odd conductor. Positivity of one unsigned character sum is not inferred from this signed projection.

Proof or construction route:

1. Use trace zero, the imported Legendre order-four test and the congruence #F_p=p+1 to rule out a square lambda. The mod8 classes rule out the other excluded squareclasses. Apply the checked theta(x;8,3) error bound at k and k/2. The triangle inequality bounds the maximum absolute sum by a quarter of the absolute signed combination.

Direct prerequisites: `ErdosProgressionPowers:EP.2/case-partition`, `ErdosProgressionPowers:EP.1/good-trace-comparison`, `ClassicalArithmeticCompletion:CA.1/quadratic-character-of-a-squareclass`, `AnalyticNumberTheory:AN.2`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Lemma 6.4, p. 368; §6, Case I, equations (19)–(21), p. 369; Equation (21), p.369.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/32`, `PAPER-BENNETT-SIKSEK-20/80`, `PAPER-BENNETT-SIKSEK-20/143`.

Prototype boundary: this geometric endpoint is specified here but omitted from the suggested declarations until its native supplier interface is available.

### Case-II positive normalization and square test

`ErdosProgressionPowers:EP.2/case-two-normalization` · theorem · proposed name `TauCeti.ProgressionPowers.case_two_normalization`.

Under H and CaseII one can choose lambda=2*t^2 and 1-lambda=2*v^2 with positive rational t,v, so 2*t^2+2*v^2=1. For each prime k/2<p<=k with p = 5 mod 8, t and v are p-units and the Legendre symbol of t*v is +1.

Proof or construction route:

1. Use the six-parameter transformations to place lambda in(0,1) and both lambda,1-lambda in2Q^2. At p = 5 mod 8 compare the first-family reduction to a twist of the CM model with lambda=-1. If tv were nonsquare, the corrected imported order-four point yields forbidden8-divisibility of a point count, contradicting the explicit CM trace class.

Direct prerequisites: `ErdosProgressionPowers:EP.2/case-partition`, `ErdosProgressionPowers:EP.1/good-trace-comparison`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Lemma 6.6, pp. 371-372; §6 before (22), p. 370.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/35`, `PAPER-BENNETT-SIKSEK-20/76`.

Prototype boundary: this geometric endpoint is specified here but omitted from the suggested declarations until its native supplier interface is available.

### CM exclusion for progression Frey curves

`ErdosProgressionPowers:EP.2/frey-non-cm` · theorem · proposed name `TauCeti.ProgressionPowers.frey_non_cm`.

Under H, the native elliptic curve E_a is not CM, for every a in A(k). Its j-invariant is 2^8*(a^2-b*c)^3/(a*b*c)^2. Integral j and pairwise coprimality would force each of a,b,c to be a signed power of 2; the relation a+b+c=0 forces two to be equal. The resulting index equations imply d=0 or d divides3, contrary to H and the half-prime-divisibility theorem.

Proof or construction route:

1. Import algebraic integrality of CM j-values and deduce integer j for rational j. At an odd divisor of abc the numerator is a unit, contradicting integrality. Classify the elementary signed powers-of-two relation and use gcd(n,d)=1 and index bounds. The contradiction uses at least one prime in the half interval, supplied by the explicit prime estimate.

Direct prerequisites: `ErdosProgressionPowers:EP.1/first-local-invariants`, `ErdosProgressionPowers:EP.1/half-primes-divide-d`, `ComplexMultiplicationAndExplicitReciprocity:CM.3`, `AnalyticNumberTheory:AN.2`, `mathlib:WeierstrassCurve.j`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, §6 final Case-II proof, p. 373.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/84`.

Prototype boundary: this geometric endpoint is specified here but omitted from the suggested declarations until its native supplier interface is available.

### Case-II conductor exclusion and projection

`ErdosProgressionPowers:EP.2/case-two-projection` · theorem · proposed name `TauCeti.ProgressionPowers.case_two_projection`.

Under Hplus and CaseII choose a character from the four squareclasses omega*t*v, omega in{±1,±2}. One has absolute prime-weighted sum at least (1-3*0.002811)*k/8; its odd conductor divides M_a and is not 1. If odd conductor were1, tv is a square or twice a square; parity excludes the latter, quartic descent forces lambda=1/2, and the CM residual image versus non-CM surjectivity at ell>37 contradicts the residual comparison.

Proof or construction route:

1. Project to primes 5 mod 8 using the previous square test and the checked theta(x;8,5) estimate. Use Legendre parameter valuation and conductor support. Clear denominators primitively in2t^2+2v^2=1. Apply the exact T^4+V^4=2U^2 descent node, not FLT4. Import the CM normalizer image and the rational-isogeny surjectivity theorem, then use the same residual comparison.

Direct prerequisites: `ErdosProgressionPowers:EP.2/case-two-normalization`, `ErdosProgressionPowers:EP.2/frey-non-cm`, `ErdosProgressionPowers:EP.1/comparison-curve`, `ClassicalArithmeticCompletion:CA.1/quadratic-character-of-a-squareclass`, `ClassicalArithmeticCompletion:CA.4/quartic-descent-t4-plus-v4-equals-2u2`, `ComplexMultiplicationAndExplicitReciprocity:CM.4`, `EllipticModularityEffectiveComparisons:EC.5`, `AnalyticNumberTheory:AN.2`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, §6 Case II, pp. 372–373; §6 Case II first paragraph, p.372.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/85`, `PAPER-BENNETT-SIKSEK-20/144`.

Prototype boundary: this geometric endpoint is specified here but omitted from the suggested declarations until its native supplier interface is available.

### Simultaneous quadratic character family

`ErdosProgressionPowers:EP.2/character-family` · construction · proposed name `TauCeti.ProgressionPowers.character_family`.

Under Hplus choose for every a in A(k) one pair (N_a,chi_a), with N_a>1 and chi_a a native primitive real quadratic character modulo its conductor N_a. The same choice simultaneously has: |sum over integers k/2<m<=k of chi_a(m)*Lambda(m)|>0.1239*k; N_a^odd squarefree, N_a^odd dividing M_a and A_i*A_j*A_h, N_a^odd!=1; and N_a<=8*N_a^odd. N_a is the actual native character conductor, not a freely assigned modulus.

Proof or construction route:

1. Use the exhaustive partition and the respective four-character constructions. The primitive squareclass character gives the exact conductor and dyadic bound. Convert prime sums to von-Mangoldt sums by the effective prime-power tail; the strict numerical margin is0.000045875*k. Fix one finite family only after all its simultaneous conclusions hold.

Direct prerequisites: `ErdosProgressionPowers:EP.2/case-one-projection`, `ErdosProgressionPowers:EP.2/case-two-projection`, `ErdosProgressionPowers:EP.1/first-reduced-level`, `ClassicalArithmeticCompletion:CA.1/quadratic-character-of-a-squareclass`, `ClassicalArithmeticCompletion:CA.1/odd-part-of-a-quadratic-conductor-is-squarefree`, `ClassicalArithmeticCompletion:CA.1/two-adic-conductor-bound`, `AnalyticNumberTheory:AN.2`, `mathlib:DirichletCharacter.conductor`, `mathlib:DirichletCharacter.IsPrimitive`, `mathlib:ArithmeticFunction.vonMangoldt`.

Recorded uses:

- BS20 Propositions7.2,8.1,9.1: uses the same selected character and its conductor in all combinatorial and analytic estimates.

- BS20 §12: compares its >0.1239k mass to an exceptional-modulus bound.

API:

- `TauCeti.ProgressionPowers.character_family_primitive` (compatibility): For every a, chi_a.IsPrimitive and chi_a.conductor=N_a; it is quadratic and real.

- `TauCeti.ProgressionPowers.character_family_mass` (relation): The absolute half-interval von-Mangoldt sum is strictly greater than 0.1239*k.

- `TauCeti.ProgressionPowers.character_family_support` (relation): N_a^odd is squarefree, divides both M_a and A_i*A_j*A_h, and N_a<=8*N_a^odd.

- `TauCeti.ProgressionPowers.character_family_nonprincipal` (characterisation): N_a^odd!=1, hence N_a>1 and chi_a is not the principal character.

Unit tests:

- `TauCeti.ProgressionPowers.character_family_one` (compatibility): Under Hplus, at every triple chi_a(1)=1.

- `TauCeti.ProgressionPowers.character_family_zero` (non-example): Under Hplus, chi_a(0)=0 and N_a>1; the principal modulus1 character cannot be selected.

- `TauCeti.ProgressionPowers.character_family_same_witness` (characterisation): Under Hplus, each selected pair satisfies both the large absolute sum and the odd-support bound; selecting different pairs for the two properties does not meet the contract.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Proposition 6.1 and its two-case construction, pp. 366-373; Proposition 6.1, p. 367; Proposition 6.1, p. 367; Case II exclusion, pp. 372–373.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/36`, `PAPER-BENNETT-SIKSEK-20/37`, `PAPER-BENNETT-SIKSEK-20/38`, `PAPER-BENNETT-SIKSEK-20/39`.

Prototype boundary: Odd conductor divisibility into the actual curve reduced level M_a is omitted. Native primitivity, quadraticity, actual character conductor, coefficient-product support, nonprincipality and absolute mass are stated.

## EP.3. The original analytic contradiction criteria

Prove the progression-specific harmonic-family criterion of Proposition 7.2 for pairwise distinct largest conductor primes, P(N_a)<(log k)^(1-c1) and reciprocal mass at least 0.166, retaining effective dependence on 0<c1<1 and decay exponent min(c1,1/2). Prove the distinct-character criterion of Proposition 8.1 for more than 17 log k characters, P(N_a)<=k^(7/16) and N_a<k^c2 with c2>10. Import the generic character PNT, exceptional-zero repulsion, checked small-conductor zero exclusion, pairwise smooth-modulus cancellation and Bombieri-Selberg inequality. Apply the exact diagonal/off-diagonal bounds and the margin 1/68<0.1239^2.

**Coverage:** planned, not closed.

**Stage inputs:** `AnalyticNumberTheory:AN.2`, `AnalyticNumberTheory:AN.3`, `AnalyticNumberTheory:AN.5`, `ErdosProgressionPowers:EP.2`, `ExponentialSumsAndCircleMethod:ES.0`, `SieveMethodsAndPrimePatterns:SV.2`.

### Harmonic smooth-conductor criterion

`ErdosProgressionPowers:EP.3/harmonic-criterion` · theorem · proposed name `TauCeti.ProgressionPowers.harmonic_criterion`.

For each fixed 0<c1<1 there is an effectively computable k1(c1) such that under Hplus, any finite D subset A(k) with pairwise distinct P(N_a), P(N_a)<(log k)^(1-c1) and sum over D of 1/P(N_a)>=0.166 forces k<=k1(c1). Here P is the native largest prime factor and all selected characters are nonprincipal.

Proof or construction route:

1. For a nonexceptional character use log N<1.07*(log k)^(1-c1) and the imported effective PNT: the error is O(k*exp(-c*(log k)^min(c1,1/2))*(log k)^4), contradicting the fixed lower bound for effective large k. If all characters are exceptional, order their conductors; repulsion gives N_j>N_1^(2^(j-1)). The reciprocal mass is<2.13/log N_1, so N_1<=373743<400000. Use the checked unconditional small-conductor zero-exclusion certificate, not an assumed GRH statement.

Direct prerequisites: `ErdosProgressionPowers:EP.2/character-family`, `AnalyticNumberTheory:AN.2`, `AnalyticNumberTheory:AN.3`, `mathlib:Nat.maxPrimeFac`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Proposition 7.2, pp. 374-375; §7 proof, p.375; corrected exponent for general c1; §7 proof, pp.375–376.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/42`, `PAPER-BENNETT-SIKSEK-20/145`, `PAPER-BENNETT-SIKSEK-20/146`.

### Many smooth characters criterion

`ErdosProgressionPowers:EP.3/many-character-criterion` · theorem · proposed name `TauCeti.ProgressionPowers.many_character_criterion`.

For each c2>10 there is an effective k2(c2) such that under Hplus any B subset A(k) with |B|>17*log k, pairwise distinct selected characters, P(N_a)<=k^(7/16) and N_a<k^c2 forces k<=k2(c2). Quantitative proof: the mean squared absolute weighted sum is at most (k*log k/2+O(k))*((k+1)/(34*log k)+k^(1-c3))=(1/68+o(1))*k^2, where c3(c2)>0 is effective.

Proof or construction route:

1. Apply the existing Bombieri diagonal/off-diagonal node to x_m=Lambda(m), y_a,m=chi_a(m) on the integer half interval. The diagonal is at most(k+1)/2, the input norm is k log k/2+O(k), and the generic smooth-modulus cancellation bound controls off-diagonal pairs by k^(1-c3). Its proof must use the product ambient modulus separately from the primitive conductor and eventual divisor subpower bounds. Compare1/68<0.1239^2; no fourth power of0.1239 enters.

Direct prerequisites: `ErdosProgressionPowers:EP.2/character-family`, `SieveMethodsAndPrimePatterns:SV.2/bombieri-diagonal-offdiagonal`, `ExponentialSumsAndCircleMethod:ES.0`, `AnalyticNumberTheory:AN.2`, `AnalyticNumberTheory:AN.5/eventual-divisor-subpower-bound`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Proposition 8.1, p. 376; Equations (32)–(35), pp. 379–380.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/91`, `PAPER-BENNETT-SIKSEK-20/99`.

## EP.4. Thin-prime sieves and the original proof assembly

Define survivors avoiding a prime set S of reciprocal mass below 0.17 and the two open-left sieving intervals. Bound the losses, perform maximal-valuation deletion so the surviving A-product divides(k-1)!, and prove the smooth factorial bound and density of A_i<=k^139. At the certified threshold k>=exp(exp(10^7)), use the imported quantitative Roth bound to choose one triple simultaneously avoiding S, with P(N_a)<=k^(7/16), no conductor prime in((log k)^(1-10^-4),10^4log k], and N_a<k^418. Keep the printed 10^6 threshold in the source register with its proof gap, not as an executed estimate. Build the maximal distinct-largest-prime family, prove its reciprocal-mass dichotomy and dispatch the small endpoint with c1=1/20000. This is one complete original-route reduction to an effective bound on k.

**Coverage:** planned, not closed.

**Stage inputs:** `AdditiveCombinatorics:AC.2`, `AnalyticNumberTheory:AN.2`, `AnalyticNumberTheory:AN.5`, `ErdosProgressionPowers:EP.0`, `ErdosProgressionPowers:EP.2`, `ErdosProgressionPowers:EP.3`.

### Thin-prime sieve survivors

`ErdosProgressionPowers:EP.4/thin-prime-survivors` · construction · proposed name `TauCeti.ProgressionPowers.thin_prime_survivors`.

For n,d,k and a finite set S of primes<=k define T_pr={p prime:k^(7/16)<p<=k}, U_pr={p prime:(log k)^(1-10^-4)<p<=10^4*log k}, and J=range(k) minus the union of divisibility index sets I_p for p in S union T_pr union U_pr. Both lower endpoints are open; no integer ceiling replaces the prime predicates.

Proof or construction route:

1. Form finite prime sets with explicit real bounds, then take their divisibility-index union and relative complement. The construction is total; density and conductor consequences require Hplus and the certified numerical range.

Direct prerequisites: `ErdosProgressionPowers:EP.0/divisibility-indices`.

Recorded uses:

- BS20 Proposition 9.1: simultaneously enforces all three forbidden prime conditions.

API:

- `TauCeti.ProgressionPowers.thin_prime_survivors_mem` (characterisation): i is in J iff i<k and none of the three forbidden prime sets divides n+i*d.

- `TauCeti.ProgressionPowers.thin_prime_survivors_antitone` (functoriality): Increasing S can only shrink J.

- `TauCeti.ProgressionPowers.thin_prime_survivors_conductor` (relation): Under Hplus, a triple in J has N_a avoiding S and U_pr and P(N_a)<=k^(7/16).

Unit tests:

- `TauCeti.ProgressionPowers.thin_prime_survivors_zero` (degenerate): For k=0 the survivor set is empty.

- `TauCeti.ProgressionPowers.thin_prime_survivors_union` (characterisation): Deleting S,T_pr,U_pr in any order gives the same finite set.

- `TauCeti.ProgressionPowers.thin_prime_survivors_open_left` (non-example): A prime exactly at a lower endpoint is not in that interval prime set; it is deleted only if it occurs in another forbidden set.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, §9 proof, p. 382.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/104`.

### Maximal-valuation deletion

`ErdosProgressionPowers:EP.4/valuation-deletion` · construction · proposed name `TauCeti.ProgressionPowers.valuation_deletion`.

For gcd(n,d)=1, nonzero terms i<k, positive coefficients A_i dividing |n+i*d| supported on primes<k, and J subset range(k), delete for every prime p<k dividing some A_i with i in J an index having maximal v_p(A_i). Break ties by the least index. The resulting J1 is a subset of J, loses at most the number of primes below k, and product over J1 of A_i divides(k-1)!. Signed factors satisfy the coefficient hypotheses.

Proof or construction route:

1. For each prime in the finite support union take the least maximizer of the native valuation. If j is its deleted index, each remaining valuation is bounded by v_p(|i-j|), by the term-gcd bound and maximality. The product of nonzero index differences divides j!*(k-1-j)!, which divides(k-1)!. Combine prime valuations.

Direct prerequisites: `ErdosProgressionPowers:EP.0/term-gcd`, `ErdosProgressionPowers:EP.0/signed-factors`, `mathlib:padicValNat_def`, `mathlib:Nat.factorization`.

Recorded uses:

- BS20 §9: makes the smooth coefficient product divide a factorial.

- BS20 §12: bounds the products of disjoint surviving triples.

API:

- `TauCeti.ProgressionPowers.valuation_deletion_subset` (projection): J1 is a subset of J and its cardinal is at least |J| minus the number of primes below k.

- `TauCeti.ProgressionPowers.valuation_deletion_factorial` (relation): Under the coefficient and primitive-term hypotheses, the product over J1 of A_i divides(k-1)!.

- `TauCeti.ProgressionPowers.valuation_deletion_tie` (characterisation): For each supported prime the removed maximizer is the least among equal-valuation indices.

Unit tests:

- `TauCeti.ProgressionPowers.valuation_deletion_empty` (degenerate): An empty J remains empty.

- `TauCeti.ProgressionPowers.valuation_deletion_units` (computation): If every A_i=1, then J1=J and its product is1.

- `TauCeti.ProgressionPowers.valuation_deletion_sample` (computation): n=d=1,k=5,J=range(5),A=(1,2,3,4,1) gives J1={0,1,4} and product2 dividing24.

- `TauCeti.ProgressionPowers.valuation_deletion_least_tie` (non-example): n=d=1,k=4,J=range(4),A=(1,2,1,2) removes index1 rather than3 for the prime2.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Proof of Proposition 9.1, p. 384.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/48`.

### Sieve losses and coefficient density

`ErdosProgressionPowers:EP.4/survivor-density` · theorem · proposed name `TauCeti.ProgressionPowers.survivor_density`.

Under Hplus, k>=exp(exp(10^7)) and sum over S of 1/p<0.17, the losses from T_pr,U_pr,S are at most k*log(16/7), k*log(1/(1-10^-4))+5*k*log10/loglogk+10^4*logk, and strictly less than 0.17*k+1.1*k/logk. Thus |J|>0.0032*k. Deletion gives |J1|>0.00319*k. Its smooth coefficient product is less than k^(0.44*k), and J2={i in J1:A_i<=k^139} has |J2|>10^-5*k.

Proof or construction route:

1. Sum the one-residue-class bound over primes, keeping endpoints and the +1 loss. Import explicit reciprocal-prime and prime-count estimates. Apply maximal-valuation deletion. The large-prime part of(k-1)! has log at least(9/16)*k*logk-5*k; combine the imported explicit Stirling upper bound. Markov counting with log A_i>139*logk bounds the complement of J2. The numerical range is strengthened to the certified Roth threshold.

Direct prerequisites: `ErdosProgressionPowers:EP.4/thin-prime-survivors`, `ErdosProgressionPowers:EP.4/valuation-deletion`, `ErdosProgressionPowers:EP.0/residue-class-count`, `AnalyticNumberTheory:AN.2`, `AnalyticNumberTheory:AN.5`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, §9 proof, pp. 382–383; §9 proof, pp. 383–384; §9 proof, p. 384; §9 end of proof, p. 384; §9 p.384, reference [43].

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/105`, `PAPER-BENNETT-SIKSEK-20/106`, `PAPER-BENNETT-SIKSEK-20/107`, `PAPER-BENNETT-SIKSEK-20/108`, `PAPER-BENNETT-SIKSEK-20/141`.

### Simultaneous thin-conductor witness

`ErdosProgressionPowers:EP.4/thin-conductor-witness` · construction · proposed name `TauCeti.ProgressionPowers.thin_conductor_witness`.

Under Hplus and k>=exp(exp(10^7)), for every finite S of primes<=k with reciprocal mass<0.17 choose one a in A(k) such that no p in S divides N_a, P(N_a)<=k^(7/16), no prime in((logk)^(1-10^-4),10^4logk] divides N_a, and N_a<k^418. All four conclusions hold for this same triple. The printed 10^6 version is kept as a source assertion with its proof gap, not an executed bound.

Proof or construction route:

1. Apply the imported quantitative Roth statement to J2 with density10^-5. Its loglog threshold is132*log2*10^5<10^7, not<10^6. Choose one three-term progression in J2. The odd-support and dyadic conductor bound yield N<=2^8*k^417<k^418, and membership in J enforces all avoidance properties.

Direct prerequisites: `ErdosProgressionPowers:EP.4/survivor-density`, `ErdosProgressionPowers:EP.0/ap-triples`, `ErdosProgressionPowers:EP.2/character-family`, `AdditiveCombinatorics:AC.2`, `mathlib:Real.log_two_gt_d9`, `mathlib:Real.log_two_lt_d9`.

Recorded uses:

- BS20 §10: augments the maximal distinct-largest-prime family.

API:

- `TauCeti.ProgressionPowers.thin_conductor_witness_mem` (projection): The selected triple belongs to A(k) and all its indices belong to J2.

- `TauCeti.ProgressionPowers.thin_conductor_witness_avoid` (relation): Its conductor has no prime in S or in U_pr.

- `TauCeti.ProgressionPowers.thin_conductor_witness_size` (relation): Its largest prime factor is<=k^(7/16) and its conductor is<k^418.

Unit tests:

- `TauCeti.ProgressionPowers.thin_conductor_witness_empty_s` (degenerate): For S empty the two nonvacuous size bounds and U_pr avoidance still hold under the stated large-k hypotheses.

- `TauCeti.ProgressionPowers.thin_conductor_witness_same` (characterisation): One triple satisfies the conjunction of all four properties; four independently chosen witnesses are insufficient.

- `TauCeti.ProgressionPowers.thin_conductor_witness_certified_threshold` (non-example): The quantitative Roth exponent needed at density10^-5 exceeds10^6 and is less than10^7; the constructor requires the certified latter threshold.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Proposition 9.1, pp. 381-384; §9 end of proof, p. 384; Proposition 9.1(I), p. 382; Proposition 9.1(II), p. 382; Proposition 9.1(III), p. 382; Proposition 9.1(IV), p. 382; Proposition 9.1, pp.381–384; repaired Roth-threshold calculation.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/47`, `PAPER-BENNETT-SIKSEK-20/108`, `PAPER-BENNETT-SIKSEK-20/109`, `PAPER-BENNETT-SIKSEK-20/110`, `PAPER-BENNETT-SIKSEK-20/111`, `PAPER-BENNETT-SIKSEK-20/112`, `PAPER-BENNETT-SIKSEK-20/149`.

### Maximal largest-prime family

`ErdosProgressionPowers:EP.4/maximal-conductor-family` · construction · proposed name `TauCeti.ProgressionPowers.maximal_conductor_family`.

Under Hplus at the certified threshold, choose a nonempty inclusion-maximal finite B subset A(k) whose P(N_a) are pairwise distinct, all P(N_a)<=k^(7/16), N_a<k^418, and N_a avoids U_pr. Maximality is by inclusion, not by conductor size or cardinal alone.

Proof or construction route:

1. The witness for S empty makes the family nonempty. Select an inclusion-maximal member of the finite family of admissible subsets of A(k). For |B|<=17logk a reciprocal mass<0.17 would permit a new witness with S={P(N_a):a in B}, contradicting maximality.

Direct prerequisites: `ErdosProgressionPowers:EP.4/thin-conductor-witness`.

Recorded uses:

- BS20 §10: gives the original-route large-cardinality or reciprocal-mass dichotomy.

API:

- `TauCeti.ProgressionPowers.maximal_conductor_family_admissible` (projection): B is nonempty, lies in A(k), has distinct P(N_a), and satisfies all three conductor restrictions.

- `TauCeti.ProgressionPowers.maximal_conductor_family_maximal` (characterisation): Every admissible superset of B equals B.

- `TauCeti.ProgressionPowers.maximal_conductor_family_mass` (relation): If |B|<=17logk, its reciprocal-largest-prime mass is at least0.17.

Unit tests:

- `TauCeti.ProgressionPowers.maximal_conductor_family_nonempty` (non-example): Under the constructor hypotheses B cannot be empty.

- `TauCeti.ProgressionPowers.maximal_conductor_family_no_duplicate` (characterisation): Two distinct members never have the same largest conductor prime, even if their conductors differ.

- `TauCeti.ProgressionPowers.maximal_conductor_family_extension` (characterisation): An outside triple satisfying all size and gap restrictions must repeat one of B’s largest primes.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, §10, pp. 384–385; endpoint correction.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/113`.

### Original analytic endgame

`ErdosProgressionPowers:EP.4/original-route-bound` · theorem · proposed name `TauCeti.ProgressionPowers.original_route_bound`.

There is an effective absolute K_original such that Hplus implies k<=K_original. For the maximal B, if |B|>17logk apply the many-character criterion with c2=418; otherwise D={a in B:P(N_a)<=(logk)^(1-10^-4)} has reciprocal mass>=0.1683>0.166. Its smoothness is strictly less than(logk)^(1-1/20000), so the harmonic criterion applies.

Proof or construction route:

1. Distinct largest prime factors imply distinct primitive characters. In the small-cardinality branch, U_pr avoidance places every complementary largest prime above10^4logk, giving complementary mass<=0.0017. Use c1=1/20000 to handle the closed endpoint, instead of substituting the strict criterion at c1=10^-4. Take the maximum of the certified threshold and both effective contradiction thresholds.

Direct prerequisites: `ErdosProgressionPowers:EP.4/maximal-conductor-family`, `ErdosProgressionPowers:EP.3/harmonic-criterion`, `ErdosProgressionPowers:EP.3/many-character-criterion`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, §10 proof of Theorem 2, p. 385; corrected endpoint dispatch.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/114`.

## EP.5. Granville exceptional moduli and a single witness

For a bounded-height Landau-Page constant c>0 define T=exp(c log k/(3log log k)) and the moduli 1<=q<=k^4 having a primitive L-function zero with |Im rho|<=T and Re rho>1-3log log k/log k. Prove the polylogarithmic cardinal bound, minimum modulus>=log k and at-most-one modulus below T. Apply the corrected half-interval explicit formula to primitive nonprincipal characters outside this set. Define the exceptional divisibility indices with r|q and r>=q^(1/3)/2 and prove their sparse cardinal bound with all k/r+1 losses retained. Combine maximal-valuation deletion with disjoint triples to choose one triple that both avoids these indices and satisfies 8A_iA_jA_h<=k^4. Odd-conductor divisibility and the bound N<=8Nodd force that same conductor outside the exceptional set. The resulting contradiction gives an independent effective bound on k without Roth or short-sum cancellation.

**Coverage:** planned, not closed.

**Stage inputs:** `AnalyticNumberTheory:AN.3`, `AnalyticNumberTheory:AN.5`, `ErdosProgressionPowers:EP.0`, `ErdosProgressionPowers:EP.2`, `ErdosProgressionPowers:EP.4`.

### Bounded-height exceptional moduli

`ErdosProgressionPowers:EP.5/exceptional-moduli` · definition · proposed name `TauCeti.ProgressionPowers.exceptional_moduli`.

For k>=3 and fixed c>0 from the bounded-height Landau-Page theorem put T=exp(c*logk/(3*loglogk)). Q(k,c) consists of integers1<=q<=k^4 for which some native primitive complex Dirichlet character modulo q has a zero rho of its meromorphic LFunction with |Im rho|<=T and Re rho>1-3*loglogk/logk. The modulus is positive; LSeries, which is zero outside convergence, is not used.

Proof or construction route:

1. Take a subset of range(k^4+1) using the exact quantified character and complex-zero predicate. Use the native primitive-character and meromorphic continuation vocabulary. The analytic height restriction is essential.

Direct prerequisites: `mathlib:DirichletCharacter.LFunction`, `mathlib:DirichletCharacter.IsPrimitive`.

Recorded uses:

- BS20 §§12.1–12.3: isolates moduli where the uniform half-interval estimate can fail.

API:

- `TauCeti.ProgressionPowers.exceptional_moduli_mem` (characterisation): Membership is equivalent to the displayed positive-modulus bounds and the bounded-height zero witness.

- `TauCeti.ProgressionPowers.exceptional_moduli_finite` (structure): The set is finite, contained in{1,...,k^4}.

- `TauCeti.ProgressionPowers.exceptional_moduli_height` (projection): Every witness zero obeys the same T used in the zero-density estimates.

Unit tests:

- `TauCeti.ProgressionPowers.exceptional_moduli_zero` (non-example): 0 never belongs to Q(k,c), regardless of zero witnesses.

- `TauCeti.ProgressionPowers.exceptional_moduli_upper` (characterisation): q>k^4 never belongs.

- `TauCeti.ProgressionPowers.exceptional_moduli_high_zero` (non-example): A zero with |Im rho|>T alone cannot witness membership.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Section 12, equations (40)-(41), p. 386.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/49`.

### Exceptional-modulus bounds

`ErdosProgressionPowers:EP.5/exceptional-moduli-bounds` · theorem · proposed name `TauCeti.ProgressionPowers.exceptional_moduli_bounds`.

For the fixed positive Landau-Page constant c, there are effective K,C such that k>=K gives |Q(k,c)|<=C*(logk)^61, every q in Q(k,c) is>=logk, and at most one q in Q(k,c) is<T. These conclusions are proved simultaneously from zero density and bounded-height zero-free input.

Proof or construction route:

1. Apply the imported log-free density estimate at Q=k^4 and the exact T, with all character/modulus multiplicities. For small q apply bounded-height zero exclusion and the Landau-Page uniqueness strip. Constants depend only on the fixed analytic input, not on n,d.

Direct prerequisites: `ErdosProgressionPowers:EP.5/exceptional-moduli`, `AnalyticNumberTheory:AN.3`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Proposition 12.1 first conclusion, p.386; Proposition 12.1 second conclusion, pp.386–387; Proposition 12.1 third conclusion, pp.386–387.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/119`, `PAPER-BENNETT-SIKSEK-20/120`, `PAPER-BENNETT-SIKSEK-20/121`.

### Nonexceptional half-interval character estimate

`ErdosProgressionPowers:EP.5/nonexceptional-half-sum` · theorem · proposed name `TauCeti.ProgressionPowers.nonexceptional_half_sum`.

For sufficiently large k, every native primitive nonprincipal character of conductor q<=k^4 outside Q(k,c) has absolute von-Mangoldt half-interval sum<=C*k/logk, uniformly with effective C. The principal character is excluded.

Proof or construction route:

1. Subtract the imported truncated explicit formulas at k and k/2 with the same height T. Bound(k^rho-(k/2)^rho)/rho as an integral, by C*k^Re(rho)*min(1,1/|rho|); a naked sum1/|rho| is not uniform near zero. Use local zero counts for the weighted zero sum and the nonexceptional real-part bound. Track parity constants, trivial zeros and horizontal truncation errors. T, not Q=k^4, belongs in the truncation denominator.

Direct prerequisites: `ErdosProgressionPowers:EP.5/exceptional-moduli`, `AnalyticNumberTheory:AN.3`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Proposition 12.2, p.387; repaired hypothesis and zero-sum estimate.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/122`.

### Exceptional divisibility indices

`ErdosProgressionPowers:EP.5/exceptional-indices` · definition · proposed name `TauCeti.ProgressionPowers.exceptional_indices`.

For integers n,d, positive k and any finite set Q of positive moduli, Bad is the set of i<k for which some q in Q has a positive divisor r with r>=q^(1/3)/2 and r dividing n+i*d. In the application Q=Q(k,c). The real cube-root threshold and the +1 count for r>k are retained.

Proof or construction route:

1. Filter range(k) by the finite exceptional-modulus/divisor witness. Do not restrict the divisors to r<=k.

Direct prerequisites: `ErdosProgressionPowers:EP.5/exceptional-moduli`, `ErdosProgressionPowers:EP.0/divisibility-indices`.

Recorded uses:

- BS20 Proposition 12.3 and final argument: deletes every possible exceptional-conductor detector.

API:

- `TauCeti.ProgressionPowers.exceptional_indices_mem` (characterisation): Membership is precisely the positive-divisor witness with i<k.

- `TauCeti.ProgressionPowers.exceptional_indices_empty_moduli` (simp): An empty exceptional-modulus set gives an empty bad-index set.

- `TauCeti.ProgressionPowers.exceptional_indices_mono` (functoriality): Increasing the exceptional-modulus set can only increase the bad-index set.

Unit tests:

- `TauCeti.ProgressionPowers.exceptional_indices_empty` (degenerate): An empty modulus set gives no bad indices.

- `TauCeti.ProgressionPowers.exceptional_indices_large_divisor` (non-example): With modulus set{1000},n=1000,d=1,k=3, index0 is bad via r=1000>k; truncating r at k loses it.

- `TauCeti.ProgressionPowers.exceptional_indices_sample` (computation): With modulus set{8},n=d=1,k=4, every index is bad, since r=1 is an admissible divisor at the exact threshold8^(1/3)/2=1.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Proposition 12.3, pp.387–388.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/123`.

### Exceptional indices are sparse

`ErdosProgressionPowers:EP.5/exceptional-indices-sparse` · theorem · proposed name `TauCeti.ProgressionPowers.exceptional_indices_sparse`.

For all sufficiently large k and coprime nonzero n,d, |Bad|<=C*k/(logk)^(1/4), with effective C uniform in n,d.

Proof or construction route:

1. For each q sum k/r+1 over its divisors r>=q^(1/3)/2, using the residue count. Split off the at-most-one q<T, where q>=logk and eventual divisor subpower estimates suffice. For remaining q>=T use T decay against the polylogarithmic cardinal bound. The total +1 error is O(k^(1/3)*(logk)^61) after using q<=k^4 and a sufficiently small divisor exponent; it is negligible relative to k/(logk)^(1/4).

Direct prerequisites: `ErdosProgressionPowers:EP.5/exceptional-indices`, `ErdosProgressionPowers:EP.5/exceptional-moduli-bounds`, `ErdosProgressionPowers:EP.0/residue-class-count`, `AnalyticNumberTheory:AN.5/eventual-divisor-subpower-bound`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Proposition 12.3, pp.387–388.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/124`.

### Single Granville conductor witness

`ErdosProgressionPowers:EP.5/addendum-witness` · construction · proposed name `TauCeti.ProgressionPowers.addendum_witness`.

Under Hplus and sufficiently large effective k choose one triple a=(i,j,h) in A(k) whose three indices avoid Bad and with N_a<=8*A_i*A_j*A_h<=k^4. Both properties hold for the same triple.

Proof or construction route:

1. Delete one maximal-valuation index per small prime, then delete Bad. Use the original disjoint consecutive blocks(0,1,2),(3,4,5),...; at most one block is lost per deleted index. Effectively more than2k/7 blocks survive. Their combined A-product divides(k-1)!<=k^k. One block has coefficient product<=k^(7/2); k>=64 implies8*k^(7/2)<=k^4. Choose that block, which already avoids Bad.

Direct prerequisites: `ErdosProgressionPowers:EP.4/valuation-deletion`, `ErdosProgressionPowers:EP.5/exceptional-indices-sparse`, `ErdosProgressionPowers:EP.2/character-family`, `ErdosProgressionPowers:EP.0/ap-triples`, `mathlib:Nat.factorial_le_pow`.

Recorded uses:

- BS20 §12 final paragraph: provides the single small conductor proved outside the exceptional set.

API:

- `TauCeti.ProgressionPowers.addendum_witness_mem` (projection): The chosen triple belongs to A(k), with positive spacing1.

- `TauCeti.ProgressionPowers.addendum_witness_avoid` (relation): Each of its three indices is outside Bad.

- `TauCeti.ProgressionPowers.addendum_witness_size` (relation): Its conductor and coefficient product satisfy N_a<=8*A_i*A_j*A_h<=k^4.

Unit tests:

- `TauCeti.ProgressionPowers.addendum_witness_same` (characterisation): One chosen triple satisfies both avoidance and size; two separate existential witnesses are insufficient.

- `TauCeti.ProgressionPowers.addendum_witness_disjoint` (compatibility): The chosen triple is one of the disjoint consecutive blocks used in the factorial product estimate.

- `TauCeti.ProgressionPowers.addendum_witness_scale` (computation): At k=64,8*k^(7/2)=k^4; the final size implication holds for every k>=64.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, §12 final paragraph, p.388; explicit simultaneous-witness repair.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/125`.

### Exceptional-conductor detection

`ErdosProgressionPowers:EP.5/conductor-detection` · lemma · proposed name `TauCeti.ProgressionPowers.conductor_detection`.

For the single witness above, N_a is not in Q(k,c). Indeed N_a^odd divides A_i*A_j*A_h and N_a<=8*N_a^odd, so the product of the three gcd(N_a,A_r) is>=N_a/8. One gcd is>=N_a^(1/3)/2, and as a positive divisor of N_a and the indexed term it would make that same index bad if N_a were exceptional.

Proof or construction route:

1. Use squarefreeness of Nodd to distribute its prime factors among the three gcds. Apply the product lower bound and the real cube-root threshold. Since A_r divides |t_r|, the selected gcd is exactly a permitted Bad witness. Contradict the avoidance API of the same chosen triple.

Direct prerequisites: `ErdosProgressionPowers:EP.5/addendum-witness`, `ErdosProgressionPowers:EP.2/character-family`, `ErdosProgressionPowers:EP.5/exceptional-indices`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, §12 final paragraph, p.388; corrected divisibility.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/126`.

### Granville analytic endgame

`ErdosProgressionPowers:EP.5/granville-route-bound` · theorem · proposed name `TauCeti.ProgressionPowers.granville_route_bound`.

There is an effectively computable absolute K_Granville such that Hplus implies k<=K_Granville. This route uses no quantitative Roth theorem or short smooth-modulus cancellation bound.

Proof or construction route:

1. Choose the single addendum witness. Detection puts its conductor outside Q, its size is<=k^4 and its odd part is nontrivial, so the selected character is nonprincipal. The uniform O(k/logk) bound contradicts its strict absolute lower bound>0.1239*k for effective large k.

Direct prerequisites: `ErdosProgressionPowers:EP.5/addendum-witness`, `ErdosProgressionPowers:EP.5/conductor-detection`, `ErdosProgressionPowers:EP.5/nonexceptional-half-sum`, `ErdosProgressionPowers:EP.2/character-family`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, §12 end, p.388.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/127`.

## EP.6. Effective exponent bound and fixed-length finiteness

Prove the main theorem: an effectively computable absolute k0 exists such that every primitive integer progression product of length k>=k0 with prime exponent ell has y*d=0 or ell<=exp(10^k). Either proof route supplies such a threshold. For each fixed k>=k0, increased to at least5, import Faltings and construct the Darmon-Granville fixed-exponent adapter. Reduce composite exponents to prime divisors and exclude power variables0,1,-1 in nontrivial sufficiently long progressions. Deduce finiteness of positive integer(n,d,y,ell) tuples for each fixed k and all ell>=2, not one finite set over all lengths and not an effective enumeration of points.

**Coverage:** planned, not closed.

**Stage inputs:** `ErdosProgressionPowers:EP.0`, `ErdosProgressionPowers:EP.4`, `ErdosProgressionPowers:EP.5`, `HeightsRationalPointsAndObstructions:RP.4`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula`.

### Effective prime-exponent bound

`ErdosProgressionPowers:EP.6/effective-prime-bound` · theorem · proposed name `TauCeti.ProgressionPowers.effective_prime_bound`.

There exists an effectively computable absolute integer k0>=5 such that for every positive integer k>=k0, integers n,d,y with gcd(n,d)=1, and prime ell satisfying product over i<k of(n+i*d)=y^ell, either y*d=0 or ell<=exp(10^k). The same logical statement has both an original-route and a Granville-route effective threshold; an unqualified classical existential by itself is not an effectivity certificate.

Proof or construction route:

1. Suppose y*d!=0 and ell>exp(10^k). Taking k0 above10^8 and2*10^10 gives Hplus. Either analytic endgame contradicts sufficiently large k. Fix the maximum of the explicit or effectively controlled input thresholds. Keep a ledger of effective dependencies; none uses ineffective Siegel constants or a rational-point height bound.

Direct prerequisites: `ErdosProgressionPowers:EP.4/original-route-bound`, `ErdosProgressionPowers:EP.5/granville-route-bound`, `ErdosProgressionPowers:EP.0/primitive-solution`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Theorem 2, p. 357.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/02`.

### Fixed-exponent progression finiteness

`ErdosProgressionPowers:EP.6/fixed-exponent-finiteness` · theorem · proposed name `TauCeti.ProgressionPowers.fixed_exponent_finiteness`.

For every fixed k>=5 and integer ell>=2, the set of coprime integer(n,d,y) with y*d!=0 and product over i<k of(n+i*d)=y^ell is finite. For positive n,d,y this is Darmon–Granville Corollary 2.1; the signed extension needs the same finite sign patterns rather than an unsupported appeal to positivity.

Proof or construction route:

1. Choose finite small-prime ell-powerfree coefficient classes, including signs. Eliminate n,d to get a diagonal complete intersection in P^(k-1); its projection to the ternary curve has degree ell^(k-3) and the displayed Riemann-Hurwitz computation gives2g-2=k*ell^(k-1)*(1-2/k-1/ell)>0. Import the smoothness, ramification and genus-to-Faltings interface from the geometry owner. Each rational projective point has only finitely many primitive integral lifts, then only finitely many y. Repeat over finitely many sign patterns. The source proof was read in the author-hosted scan, not independently collated with the publisher.

Direct prerequisites: `ErdosProgressionPowers:EP.0/term-gcd`, `HeightsRationalPointsAndObstructions:RP.4`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula`, `SchemeAndStackFoundations:SF.3`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: DG95, §2.1, Corollary 2.1 and its full proof, pp.520–521; BS20, §1, p.357, discussion of Darmon–Granville Corollary 2.1.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/129`.

### Composite exponent reduction

`ErdosProgressionPowers:EP.6/composite-exponent-reduction` · lemma · proposed name `TauCeti.ProgressionPowers.composite_exponent_reduction`.

If ell>=2 and p is a prime divisor of ell, set Y=y^(ell/p); then y^ell=Y^p and the same progression has prime exponent p. For a nontrivial progression of length k>=5, |y|>1: otherwise every nonzero factor is±1, impossible for five distinct terms with d!=0. For each fixed integer Y with |Y|>1 there are finitely many pairs(y,r), r>=1, with y^r=Y.

Proof or construction route:

1. Use exact division p*(ell/p)=ell and power associativity. If |y|=1 the absolute product is1 and all absolute factors are1. Bound r by any nonzero prime valuation of |Y| and bound y by |Y|. No exponent bound for composite ell is asserted directly.

Direct prerequisites: `ErdosProgressionPowers:EP.0/primitive-solution`, `mathlib:Nat.factorization`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, §1 finiteness consequence of Theorem 2, p.357.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/128`.

### Fixed-length all-exponent finiteness

`ErdosProgressionPowers:EP.6/fixed-length-finiteness` · theorem · proposed name `TauCeti.ProgressionPowers.fixed_length_finiteness`.

For each fixed k>=k0, there are finitely many positive integer tuples(n,d,y,ell) with ell>=2, gcd(n,d)=1 and product over i<k of(n+i*d)=y^ell. Also the nontrivial signed tuples with y*d!=0 form a finite set when the signed fixed-exponent adapter is supplied. This is not finiteness as k varies and not an effective point-enumeration theorem.

Proof or construction route:

1. The effective prime theorem bounds the possible prime divisors p of ell for this fixed k. The fixed-exponent theorem yields finitely many triples(n,d,Y) for every such p. The composite reduction and |Y|>1 give finitely many roots/exponent multipliers above every triple; take the finite union.

Direct prerequisites: `ErdosProgressionPowers:EP.6/effective-prime-bound`, `ErdosProgressionPowers:EP.6/fixed-exponent-finiteness`, `ErdosProgressionPowers:EP.6/composite-exponent-reduction`.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, Abstract and §1 after Theorem 2, p. 357.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/50`.

## EP.7. The statement register and scope

Import the Erdős-Selfridge theorem for positive consecutive integers from its classical-arithmetic owner. State the stronger Erdős eventual-nonexistence conjecture with positivity and the gcd condition, without proving it or using it as an assumption. Register the Section 11 smooth-multiplier equation product(n+id)=b*y^ell with nonzero b supported on primes<=tau*k for fixed tau<1/2, marking the announced extension as lacking a separate quantified proof. Specify the two assertions and test their domains; neither is a shortcut in either unconditional proof route.

**Coverage:** planned, not closed.

**Stage inputs:** `ClassicalArithmeticCompletion:CA.4`, `ErdosProgressionPowers:EP.0`.

### Erdős nonexistence assertion

`ErdosProgressionPowers:EP.7/erdos-threshold` · definition · proposed name `TauCeti.ProgressionPowers.erdos_threshold`.

For integer K>=0 let ErdosThreshold(K) assert that for every k>=K, k>=2, positive integers n,d,y and ell>=2 with gcd(n,d)=1, the progression product is not y^ell. The Erdős conjecture is the assertion that some K satisfies this explicit predicate. It is recorded, not proved or used as an assumption.

Proof or construction route:

1. State the positive-domain quantifiers and exact primitive product equation. Keep integer exponent ell>=2, not just prime ell. The definition is an explicit predicate; it has no admitted proposition body.

Direct prerequisites: `ErdosProgressionPowers:EP.0/primitive-solution`, `ClassicalArithmeticCompletion:CA.4`.

Recorded uses:

- BS20 introduction and§11: distinguishes the conjecture from the unconditional exponent bound.

API:

- `TauCeti.ProgressionPowers.erdos_threshold_iff` (characterisation): The predicate is equivalent to the displayed positive-domain universal nonexistence statement.

- `TauCeti.ProgressionPowers.erdos_threshold_mono` (functoriality): K<=L and ErdosThreshold(K) imply ErdosThreshold(L).

- `TauCeti.ProgressionPowers.erdos_threshold_nonexistence` (projection): For every k>=K with k>=2, ErdosThreshold(K) implies the exact primitive positive-domain product inequality for every n,d,y>0 and integer ell>=2.

Unit tests:

- `TauCeti.ProgressionPowers.erdos_threshold_zero` (non-example): ErdosThreshold(0) is false because n=1,d=24,k=3,y=35,ell=2 is a primitive positive solution.

- `TauCeti.ProgressionPowers.erdos_threshold_three` (non-example): The same solution shows ErdosThreshold(3) is false.

- `TauCeti.ProgressionPowers.erdos_threshold_positive_domain` (characterisation): The signed solution(-3,2,4,3,2) is excluded by positivity and is not itself a counterexample to ErdosThreshold(4).

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, §1, Conjecture, p. 356.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/52`.

### Smooth-multiplier progression equation

`ErdosProgressionPowers:EP.7/smooth-multiplier` · definition · proposed name `TauCeti.ProgressionPowers.smooth_multiplier`.

For real tau, n,d,y,b in Z and k,ell in N, SmoothMultiplierSolution means 0<k, ell prime, gcd(n,d)=1, y*d!=0, b!=0, product over i<k of(n+i*d)=b*y^ell, and every prime divisor of |b| is<=tau*k. The discussion concerns fixed 0<=tau<1/2. Its extension is an announcement without a separate quantified proof, not an unconditional theorem in this plan.

Proof or construction route:

1. Use the explicit equation and native prime-divisor predicate. The zero multiplier is excluded so its prime support cannot make the support condition vacuous. The fixed tau<1/2 restriction does not cover all multipliers supported below k.

Direct prerequisites: `ErdosProgressionPowers:EP.0/primitive-solution`, `mathlib:Nat.maxPrimeFac`.

Recorded uses:

- BS20 §11: registers the announced extension and prevents its use in the proof of Theorem 2.

API:

- `TauCeti.ProgressionPowers.smooth_multiplier_iff` (characterisation): The predicate has exactly the displayed domain, equation and support conditions.

- `TauCeti.ProgressionPowers.smooth_multiplier_one` (compatibility): For tau>=0 and b=1 it is equivalent to S(n,d,k,y,ell).

- `TauCeti.ProgressionPowers.smooth_multiplier_tau_mono` (functoriality): For tau<=sigma, a solution for tau is a solution for sigma.

Unit tests:

- `TauCeti.ProgressionPowers.smooth_multiplier_zero` (non-example): b=0 never gives a SmoothMultiplierSolution.

- `TauCeti.ProgressionPowers.smooth_multiplier_unit` (computation): tau=0,n=1,d=24,k=3,y=35,ell=2,b=1 gives a solution.

- `TauCeti.ProgressionPowers.smooth_multiplier_half_boundary` (non-example): n=d=y=1,k=2,ell=2,b=2 satisfies the equation, but cannot satisfy the support bound for tau<1/2.

Acceptance: Retain every domain, sign, endpoint, conductor and effectivity restriction in the statement; use the native library or the cited owner for its prerequisites.

Source: BS20, §11, pp. 385–386.

Catalogue coverage: `PAPER-BENNETT-SIKSEK-20/115`.

## Cross-roadmap contracts

These are exact output contracts, not requests to duplicate the suppliers’ objects. Each request lists its consuming declarations in the packet.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-8-selected-ℚ-specific-database-adapters`

The existing generic integral Frey model Y^2=X(X-a)(X+c), native coefficient/discriminant formulas, full-two-torsion and semistable algorithmic-to-Artin comparison interface. This roadmap supplies only the progression normalization and specialization.

Consumed by: `ErdosProgressionPowers:EP.1/first-curve`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`

Native p-adic integral-model minimality and reduction criteria: at odd p, c4 a unit and Delta of positive valuation imply minimal multiplicative reduction; Delta a unit implies good reduction. Identify semistable algorithmic exponents with actual Artin exponents; no unrestricted wild comparison is inferred.

Consumed by: `ErdosProgressionPowers:EP.1/first-local-invariants`, `ErdosProgressionPowers:EP.1/second-local-invariants`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`

Hasse bound for elliptic good reductions with the native all-points trace, trace-zero calculation for twists of x(x-1)(x+1) at primes3mod4, and the geometric supersingular criterion at p>=5.

Consumed by: `ErdosProgressionPowers:EP.1/good-trace-comparison`.

### `ArithmeticGaloisRepresentations:R01.3`

Actual elliptic and residual Artin conductors including the wild bounds f2<=8 and f3<=5, odd semistable exponents, and the prime-to-ell residual conductor; identify these invariants with the qualified local algorithmic outputs.

Consumed by: `ErdosProgressionPowers:EP.1/first-reduced-level`, `ErdosProgressionPowers:EP.1/second-reduced-level`, `ErdosProgressionPowers:EP.1/coefficient-prime-bridge`.

### `SerreWeightAndLevelOptimisation:R20.2`

Weight-two level lowering for the same actual irreducible elliptic residual representation, with the odd multiplicative primes whose minimal-Delta valuation is divisible by ell removed. Good-prime Hecke/Frobenius congruences retain coefficient field and prime above ell.

Consumed by: `ErdosProgressionPowers:EP.1/first-reduced-level`, `ErdosProgressionPowers:EP.1/second-reduced-level`, `ErdosProgressionPowers:EP.1/good-trace-comparison`.

### `SerreWeightAndLevelOptimisation:R20.4`

Coefficient-prime finite-flat weight-two lowering at ell>=5, including good and multiplicative cases, to prove M_a equals the prime-to-ell residual conductor. This equality is not supplied by the deletion-level definition.

Consumed by: `ErdosProgressionPowers:EP.1/coefficient-prime-bridge`.

### `EllipticModularityEffectiveComparisons:EC.3`

Exact-conductor Kraus realization under full-two-torsion, irreducibility, Serre weight 2 and ell>H_K(N), producing an actual full-two-torsion elliptic curve with conductor exactly N and the same residual representation.

Consumed by: `ErdosProgressionPowers:EP.1/comparison-curve`.

### `EllipticModularityEffectiveComparisons:EC.4`

Uniform rational-isogeny classification consequences: full rational two-torsion implies irreducibility at prime ell>=7; a rational two-torsion point implies irreducibility at prime ell>=11.

Consumed by: `ErdosProgressionPowers:EP.1/first-reduced-level`, `ErdosProgressionPowers:EP.1/second-reduced-level`.

### `EllipticModularityEffectiveComparisons:EC.5`

Lemos surjectivity at every residual prime ell>37 for a non-CM elliptic curve over Q admitting a nontrivial rational cyclic isogeny; preserve that isogeny hypothesis. The first progression Frey curve has rational two-torsion.

Consumed by: `ErdosProgressionPowers:EP.2/case-two-projection`.

### `ComplexMultiplicationAndExplicitReciprocity:CM.3`

CM j-values are algebraic integers; in the Q-rational elliptic specialization j is an integer. Match the native j-invariant and do not infer integrality for arbitrary non-CM curves.

Consumed by: `ErdosProgressionPowers:EP.2/frey-non-cm`.

### `ComplexMultiplicationAndExplicitReciprocity:CM.4`

For the CM lambda=1/2 curve, its residual Galois image lies in a Cartan normalizer and is not all GL2 at primes ell>37; state the field, CM extension and conjugacy/isogeny hypotheses and compare to the same residual representation.

Consumed by: `ErdosProgressionPowers:EP.2/case-two-projection`.

### `AnalyticNumberTheory:AN.2`

Checked effective prime estimates used here: theta(x)<1.000081x at the stated large range; theta(x;8,3) and theta(x;8,5) errors<=0.002811x/4 at x>=10^10; explicit pi, reciprocal-prime and sum(log p)/p bounds for §§5,9; the primitive nonprincipal character PNT with denominator sqrt(log x)+log N; and a sufficient effective prime-power tail for the0.000045875k margin. Record all ranges and distinguish theta from psi.

Consumed by: `ErdosProgressionPowers:EP.1/first-reduced-level`, `ErdosProgressionPowers:EP.1/second-reduced-level`, `ErdosProgressionPowers:EP.2/case-one-projection`, `ErdosProgressionPowers:EP.2/case-two-projection`, `ErdosProgressionPowers:EP.2/frey-non-cm`, `ErdosProgressionPowers:EP.2/character-family`, `ErdosProgressionPowers:EP.3/harmonic-criterion`, `ErdosProgressionPowers:EP.3/many-character-criterion`, `ErdosProgressionPowers:EP.4/survivor-density`.

### `AnalyticNumberTheory:AN.3`

Effective quadratic exceptional-zero repulsion N_j>N_1^(2^(j-1)); reproducible unconditional nonvanishing certificate excluding the required exceptional zeros for conductors<400000; bounded-height Landau-Page; the log-free zero-density estimate producing exponent61; and a truncated primitive nonprincipal half-interval explicit formula with parity, trivial zeros, endpoint and horizontal errors plus local zero counts. Constants remain effective and uniform.

Consumed by: `ErdosProgressionPowers:EP.3/harmonic-criterion`, `ErdosProgressionPowers:EP.5/exceptional-moduli-bounds`, `ErdosProgressionPowers:EP.5/nonexceptional-half-sum`.

### `AnalyticNumberTheory:AN.5`

Explicit totient-ratio bound for the Kraus mu application, and a proved Stirling bound m!<=sqrt(2*pi*m)*(m/e)^m*exp(1/(12m)) for m>=1. The existing eventual-divisor-subpower-bound node is reused directly and is not requested again.

Consumed by: `ErdosProgressionPowers:EP.1/kraus-progression-threshold`, `ErdosProgressionPowers:EP.4/survivor-density`.

### `ExponentialSumsAndCircleMethod:ES.0`

Full Bennett–Siksek Proposition8.2 cancellation: for fixed c2>0, distinct native primitive quadratic characters with conductors N_i<k^c2 and P(N_i)<=k^(7/16), the half-interval correlation is<=k^(1-c3(c2)) for effective sufficiently large k and c3>0. Reuse the existing product/exclusion, bounded CRT-character blocks, finite differencing and divisor-threshold nodes. They do not yet supply the full external Graham–Ringrose correlation bound or final assembly; preserve ambient moduli and possible principal components.

Consumed by: `ErdosProgressionPowers:EP.3/many-character-criterion`.

### `AdditiveCombinatorics:AC.2`

Quantitative three-term Roth theorem: density delta in(0,1), subset J of range(k) with |J|>=delta*k and k>=exp(exp(132*log2/delta)) gives a strict three-term progression in J. Obtain Rahman’s actual proof/edition and reconcile with the existing qualitative Mathlib Roth theorem; no fresh qualitative Roth node is planned here.

Consumed by: `ErdosProgressionPowers:EP.4/thin-conductor-witness`.

### `HeightsRationalPointsAndObstructions:RP.4`

Faltings finiteness of rational points for each fixed smooth projective geometrically connected curve of genus>=2 over Q; no effective height or enumeration bound. Apply to the finite diagonal-curve coefficient family with a proved primitive-lift adapter.

Consumed by: `ErdosProgressionPowers:EP.6/fixed-exponent-finiteness`.

### `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula`

Riemann–Hurwitz with exact degree, tame different and constant-field hypotheses for the characteristic-zero diagonal cover in Darmon–Granville Corollary 2.1. The source-specific degree ell^(k-3) and branch calculation are local adapter proof obligations, not a second generic theorem.

Consumed by: `ErdosProgressionPowers:EP.6/fixed-exponent-finiteness`.

### `SchemeAndStackFoundations:SF.3`

Native bridge between the source diagonal smooth projective curve, its function field, geometrically connected genus, and the same rational-point carrier consumed by Faltings; no use of finiteness without smoothness or the genus identification.

Consumed by: `ErdosProgressionPowers:EP.6/fixed-exponent-finiteness`.

### `ClassicalArithmeticCompletion:CA.4`

Import the historical Erdős–Selfridge theorem that a positive product of at least two consecutive integers is not a perfect power of exponent>=2. This is background in the statement register only, never an assumed proof of the progression conjecture.

Consumed by: `ErdosProgressionPowers:EP.7/erdos-threshold`.

## Closure obligations

A planned stage is not a closed stage. These boundaries must be discharged before a proof-closed packet can be claimed.

### Missing named Legendre supplier

The reviewed paper route names EllipticLegendreCharacterInterfaces, but no definition, packet or reserved endpoint is present at this base. Needed: the six full-two-torsion parameters, conductor valuation support, p3mod4 order-four square test, twists/CM trace modulo8, and the corrected p = 5 mod 8 halving point(2lambda+4itv,8itv(t+iv)). These are generic elliptic interfaces and are not re-owned here. A valid supplier stage must be designated before adding prerequisite ids.

Consumers: `ErdosProgressionPowers:EP.2/case-partition`, `ErdosProgressionPowers:EP.2/case-one-projection`, `ErdosProgressionPowers:EP.2/case-two-normalization`, `ErdosProgressionPowers:EP.2/case-two-projection`.

### Native conductor and residual-comparison signature boundary

The pins contain native Weierstrass models, reduction predicates and a Tau Ceti trace, but the required native conductor/residual/Serre-weight interfaces and upstream generic Frey adapter are not all declarations with stable signatures. No artificial conductor field, residual predicate placeholder or surrogate curve bundle is introduced. The suggested file marks precisely the unavailable clauses; they must be reconciled with the supplier APIs.

Consumers: `ErdosProgressionPowers:EP.1/first-reduced-level`, `ErdosProgressionPowers:EP.1/second-reduced-level`, `ErdosProgressionPowers:EP.1/coefficient-prime-bridge`, `ErdosProgressionPowers:EP.1/comparison-curve`, `ErdosProgressionPowers:EP.1/good-trace-comparison`, `ErdosProgressionPowers:EP.2/character-family`.

### Primary quantitative analytic proof and certificates

Bennett–Siksek quotes the quantitative prime, zero-density, PNT, small-zero computation and Graham–Ringrose results. Their generic owner requests preserve exact contracts, but the original proofs and immutable finite nonvanishing certificate have not been independently verified in this design pass. Proof closure must read/verify those inputs; this packet does not claim source closure from quotations.

Consumers: `ErdosProgressionPowers:EP.3/harmonic-criterion`, `ErdosProgressionPowers:EP.3/many-character-criterion`, `ErdosProgressionPowers:EP.4/survivor-density`, `ErdosProgressionPowers:EP.5/exceptional-moduli-bounds`, `ErdosProgressionPowers:EP.5/nonexceptional-half-sum`.

### Quantitative Roth proof

The numerical substitution in the published quoted Rahman threshold is verified, but Rahman’s original full proof and exact edition remain required through AC.2. The printed Proposition 9.1 at10^6 has a recorded proof gap; the application here uses the independently checked sufficient10^7 range.

Consumers: `ErdosProgressionPowers:EP.4/thin-conductor-witness`.

### Signed diagonal-curve and primitive-lift adapter

The positive fixed-exponent source proof and genus formula have been read. Explicitly prove smoothness and geometric connectedness for all signed finite coefficient patterns, identify the native function-field and scheme genus, and show finiteness of primitive integral lifts of each projective point. The DG source was not independently publisher-collated. Positive fixed-k finiteness remains the mandatory endpoint; the signed statement cannot be certified by a positivity-only citation.

Consumers: `ErdosProgressionPowers:EP.6/fixed-exponent-finiteness`, `ErdosProgressionPowers:EP.6/fixed-length-finiteness`.

### Effectivity ledger

Every analytic cutoff and certificate entering k0 must be effective. A classical existential theorem in the suggested file expresses the logical endpoint only; it does not by itself prove effective computability, nor an effective enumeration of Faltings points.

Consumers: `ErdosProgressionPowers:EP.6/effective-prime-bound`, `ErdosProgressionPowers:EP.4/original-route-bound`, `ErdosProgressionPowers:EP.5/granville-route-bound`.

### Unproved statement register

The stronger eventual-nonexistence conjecture is not proved, and Section 11 supplies no separate quantified proof for the smooth-multiplier announcement. These two objects are explicit assertions, not axioms and not prerequisites of EP.0–EP.6.

Consumers: `ErdosProgressionPowers:EP.7/erdos-threshold`, `ErdosProgressionPowers:EP.7/smooth-multiplier`.

## Statement register

### Erdős–Selfridge theorem

There are no positive integers n,k,y,ell with k>=2, ell>=2 and n(n+1)...(n+k-1)=y^ell.

Imported historical endpoint; no fresh local theorem duplicates its owner.

### Erdős conjecture

ErdosProgressionPowers:EP.7/erdos-threshold

Unproved assertion; not a prerequisite of EP.0–EP.6.

### Smooth multiplier announcement

ErdosProgressionPowers:EP.7/smooth-multiplier

Section 11 announcement only; no quantified unconditional endpoint asserted.

### Printed Proposition 9.1 threshold

Assume Hplus and k>=exp(exp(10^6)). For any set S of primes <=k with sum_{p in S}1/p<0.17, there exists one a in A such that simultaneously: no p in S divides N_a; P(N_a)<=k^(7/16); no prime in ((log(k))^(1-10^(-4)),10^4*log(k)] divides N_a; and N_a<k^418.

Registered source claim; this plan executes item149 at the certified10^7 threshold.

## Source-faithfulness register

The version read is the 38-page published publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf. The published addendum is included. The full text and selected formula images were read. The independent atlas errata register was then read; rejected findings E8, E12, E13 are not revived, and E18 supplies a Q/T correction without alleging an extra small-zero gap. The open-left interval and c1=1/20000 adapter used here are valid implementation choices, not required corrections to a source endpoint where no prime can occur. The source’s empty principal family is already permitted.

The first 19 findings below reuse independently reviewed register findings after checking their passages. No verdict is copied as an independent review of this packet. E23 is a separately recorded local signed-pigeonhole gap requiring independent review. The bounded correction search is not a proof of global novelty; no author contact was made.

### ErdosProgressionPowers/E1 — misprint

Lemma 3.2, p.361, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf)

Printed mathematical fragment: Δ_a=64(a_a b_a c_a)^2=2^8*g^(-6)*t_i^2*t_j^2*t_h^2.

Correct contract: Δ_a = 16(a_a b_a c_a)² = (2⁶/g⁶)(n+id)²(n+jd)²(n+(2j−i)d)².

Check: For y² = x³ + a₂x² + a₄x, Δ = 16a₄²(a₂² − 4a₄). For E_a: Y² = X(X−a)(X+c), a₂ = c − a and a₄ = −ac, so Δ = 16a²c²(a+c)² = 16(abc)² since a+b+c = 0; with b_a = −2(n+jd)/g this is 2⁶/g⁶ times the product. The extraction found this (item 16, report D1); the review re-derived it.

Reach: nothing. Existing register: `PAPER-BENNETT-SIKSEK-20/E1`.

### ErdosProgressionPowers/E2 — error

§8.1, proof of Proposition 8.2, p.378 (and its reuse in §12, p.388), in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf)

Printed mathematical fragment: τ(q)≤q^(1/loglog(3q)).

Correct contract: Use τ(q) ≪_ε q^ε for each fixed ε>0. This holds uniformly with a constant, and is enough both for τ(q)^(r²)<q^(1/2) at large q with bounded r and for the §12 choice ε=1/12.

Check: For q=120 the claimed all-q bound gives 14.892219892447224<16=τ(120). The subpower repair follows elementarily: for p≥2^(1/ε), a+1≤2^a≤p^(εa); the finitely many smaller primes each contribute a finite supremum of (a+1)/p^(εa). Multiply over prime powers. This repairs the uses without relying on an unverified exact constant from the cited book.

Reach: a stated result. Existing register: `PAPER-BENNETT-SIKSEK-20/E2`.

### ErdosProgressionPowers/E3 — error

Proof of Proposition 8.2, p.377, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf)

Printed mathematical fragment: M=lcm(N1,N2); M=M1*M2.

Correct contract: M = lcm(N₁,N₂) is an ambient modulus of χ, not in general its conductor. With η the primitive character inducing χ, M₁ = cond(η) and M₂ the product of the primes dividing M but not M₁, one has χ(m) = η(m)·1_{gcd(m,M₂)=1}, gcd(M₁,M₂) = 1, M₁M₂ | M and M₂ | gcd(N₁,N₂); M = M₁M₂ can fail at 2.

Check: For distinct primitive quadratic characters, an odd prime present in exactly one conductor remains in the primitive product; primes deleted entirely therefore divide gcd(N₁,N₂). At 2 the conductor exponent can shrink without disappearing: χ_8χ_−8=χ_−4. Taking M₂ as the squarefree product of the primes of M absent from M₁ gives χ=η·1_(gcd(·,M₂)=1), M₁M₂|M and M₂|gcd(N₁,N₂). The Case 2 complete-period bound uses M₁M₂, not the false equality M=M₁M₂. The Case 1 size bounds remain valid.

Reach: the proof. Existing register: `PAPER-BENNETT-SIKSEK-20/E3`.

### ErdosProgressionPowers/E4 — error

Lemma 3.1 and equation (6), p.360, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf)

Printed mathematical fragment: n+id=A_i*y_i^ell; A_i>0.

Correct contract: For odd ℓ, write n + id = A_i y_i^ℓ with A_i > 0 and y_i signed. For ℓ = 2 and a negative term, the sign must go into A_i.

Check: The terms −3,−1,1,3 multiply to 9, with gcd(−3,2)=1. A negative term cannot equal a positive A_i times an integer square. For odd ℓ a signed y_i works. The case ℓ=2 already satisfies the main exponent bound, so one can exclude it before using positive A_i.

Reach: a stated result. Existing register: `PAPER-BENNETT-SIKSEK-20/E4`.

### ErdosProgressionPowers/E5 — error

§12, proof of Proposition 12.3, p.388, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf)

Printed mathematical fragment: k/r+O(1)≪k/r.

Correct contract: The count is at most k/r + 1, and the +1 terms must be summed separately. With q ≤ k⁴ and τ(q) ≪ q^{1/12} their total is O(k^{1/3}(log k)^{61}), negligible against k/(log k)^{1/4}.

Check: If gcd(r,d)>1 there are no solutions because gcd(a,d)=1. Otherwise there is one residue class modulo r, with at most k/r+1 representatives. A single representative can occur when r≫k, so no uniform O(k/r) estimate follows. Summing gives kΣ_(q∈Q(k))τ(q)/q^(1/3)+Σ_(q∈Q(k))τ(q). The first term is treated by Proposition 12.1 as printed; the second is O(k^(1/3)(log k)^61).

Reach: the proof. Existing register: `PAPER-BENNETT-SIKSEK-20/E5`.

### ErdosProgressionPowers/E6 — gap

§12, final paragraph, p.388, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf)

Printed mathematical fragment: N_a^odd.

Correct contract: Only N_a^odd | A_iA_jA_{2j−i} is justified. With N_a ≤ 8N_a^odd this already gives the displayed inequality.

Check: Proposition 6.1 says N_a^odd divides M_a, and (9) places its odd support in A_iA_jA_(2j−i). Neither statement identifies all primes of that product with primes of N_a. Since N_a^odd is squarefree, every one of its primes occurs in at least one of the three gcds, so their product is at least N_a^odd≥N_a/8. No equality of prime supports is needed.

Reach: the proof. Existing register: `PAPER-BENNETT-SIKSEK-20/E6`.

### ErdosProgressionPowers/E7 — misprint

§8.2, end of the proof of Proposition 8.1, p.380, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf)

Printed mathematical fragment: 1/68<ϖ².

Correct contract: "As 1/68 < ϖ", i.e. 1/68 < 0.1239².

Check: 1/68 ≈ 0.0147 < 0.1239² ≈ 0.01535, but 0.1239⁴ ≈ 0.000236 < 1/68, so the printed comparison is false; the intended one is true. Checked on the page images of pp.379–380. The extraction found this (item 99, report D7).

Reach: nothing. Existing register: `PAPER-BENNETT-SIKSEK-20/E7`.

### ErdosProgressionPowers/E9 — gap

Proof of Proposition 7.2, p.375, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf)

Printed mathematical fragment: exp(-c′(logk)^c1).

Correct contract: Theorem 5 gives decay exp(−c′(log k)^{min(c₁,1/2)}), since its denominator is √(log k) + log N_a. The contradiction with (16) still follows for every 0 < c₁ < 1.

Check: Writing L=log k, the available denominator is sqrt(L)+log N_a≤sqrt(L)+1.07L^(1−c₁). Thus the ratio is bounded below by a positive constant times L^min(c₁,1/2). For c₁>1/2 the square-root contribution prevents deduction of decay exp(−c′L^c₁). This need not disprove that stronger estimate by another method. The weaker deduction still gives o(k) and the same contradiction.

Reach: the proof. Existing register: `PAPER-BENNETT-SIKSEK-20/E9`.

### ErdosProgressionPowers/E10 — error

Theorem 5, equation (26), p.374, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf)

Printed mathematical fragment: (log N)^4.

Correct contract: State it for N > 1, or replace (log N)⁴ by (log 2N)⁴; for the principal character (N = 1) the printed error term is 0.

Check: With N = 1 the formula would assert ψ(X) = X exactly. The paper uses only nonprincipal characters with N > 1. The extraction found this (item 89, report D13).

Reach: a stated result. Existing register: `PAPER-BENNETT-SIKSEK-20/E10`.

### ErdosProgressionPowers/E11 — misprint

Theorem 6, pp.376–377, and Case 1 of the proof of Proposition 8.2, pp.377–378, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf)

Printed mathematical fragment: conductor.

Correct contract: Use modulus q_i in Theorem 6 and modulus M₂ for the principal character. The first factor retains its explicit primitivity requirement. No extra M₂=1 case is missing: allow r=s, so the product of principal factors is empty.

Check: A principal Dirichlet character has primitive conductor 1 regardless of its ambient modulus; the application itself says modulus for the factors. The original errata additionally objected that M₂=1 forces a missing nontrivial principal block, but the source never requires r>s. When r=s, condition (d) applies to the last primitive factor. Pack the odd prime factors into blocks between B=k^(7/32) and B², leaving at most one short primitive block (including any 2-part) and one short principal block; discard empty blocks. The first block is odd and at least B. If M₂=1, the second collection is empty and the same construction applies. The printed r−2 count remains sufficient.

Reach: nothing. Existing register: `PAPER-BENNETT-SIKSEK-20/E11`.

### ErdosProgressionPowers/E14 — misprint

Proof of Lemma 6.6, p.371, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf)

Printed mathematical fragment: (128iv^5-64iv^3)t-128v^6+96v^4-16v^2.

Correct contract: P=(4itv+2λ,8itv(t+iv)) belongs to F′_λ(F_p), not the undefined E(F_p) in this display. Its double is (2λ,0). The x-coordinate and θ′₃(P)=4itv remain unchanged.

Check: For the local coordinate identity take p=5, t=v=2, i=3, λ=3. Then 2t²+2v²=1, but the printed point is (4,4), with y²=1 and x(x−2)(x−2λ)=4. This is a counterexample to that formula, not to all global hypotheses of the lemma. With r=2t and s=2iv, r²=2λ and s²=2λ−2, the point x=r²+rs, y=rs(r+s) lies on the curve and doubles to (2λ,0), as verified symbolically. Its x-coordinate and descent coordinate are unchanged, so the intended argument is preserved.

Reach: nothing. Existing register: `PAPER-BENNETT-SIKSEK-20/E14`.

### ErdosProgressionPowers/E15 — error

Proof of Proposition 9.1, p.384 (threshold (37) and Theorem 8 with (36), p.381), in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf)

Printed mathematical fragment: K0(10^-5)<exp(exp(10^6)).

Correct contract: K₀(10^{−5}) = exp(exp(132 log 2·10⁵)) ≈ exp(exp(9.15·10⁶)) > exp(exp(10⁶)). The argument works with the threshold k ≥ exp(exp(10⁷)); every other estimate of the proof holds there.

Check: 132·log 2·10⁵ ≈ 9.1495·10⁶ > 10⁶, so the claimed comparison fails and Proposition 9.1 is not proved at the stated threshold (it may still be true). Theorem 2 has an unspecified effective k₀, so it is unaffected. Checked on the page image of p.381. The extraction found this (items 47, 108 and 149, report D16).

Reach: the proof. Existing register: `PAPER-BENNETT-SIKSEK-20/E15`.

### ErdosProgressionPowers/E16 — gap

§12, statement of the Landau–Page theorem, p.386, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf)

Printed mathematical fragment: β<1-c/log T.

Correct contract: Restrict the zero β+it to |t|≤T. This is the classical Landau–Page statement required in the addendum; no claim that the stronger all-height assertion is known false is made.

Check: The standard Landau–Page region depends on log(Q(1+|t|)), as in Ford–Green–Konyagin–Maynard–Tao, Long gaps between primes, Lemma 7.1, published p.96, https://www.ams.org/journals/jams/2018-31-01/S0894-0347-2017-00876-2/S0894-0347-2017-00876-2.pdf. With Q=T and |t|≤T this yields the stated strip after changing the absolute constant. No such fixed strip for all heights follows. The paper’s (41) uses exactly the bounded-height form.

Reach: a stated result. Existing register: `PAPER-BENNETT-SIKSEK-20/E16`.

### ErdosProgressionPowers/E17 — error

§12, statement of Proposition 12.2, p.387, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf)

Printed mathematical fragment: q≤k^4; q∉Q(k).

Correct contract: Add that χ is a primitive nonprincipal character modulo q.

Check: The character is not specified in the proposition. For q=1, Proposition 12.1 itself gives q∉Q(k) at large k, but the principal-character sum is ψ(k)−ψ(k/2)∼k/2. Nonprincipality is therefore necessary. Primitivity ensures that the modulus excluded from Q(k) is the conductor of the L-function in question. The proof and application use these intended hypotheses.

Reach: a stated result. Existing register: `PAPER-BENNETT-SIKSEK-20/E17`.

### ErdosProgressionPowers/E18 — misprint

§12, proof of Proposition 12.2, p.387, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf)

Printed mathematical fragment: |t|≤Q.

Correct contract: Replace |t|≤Q by |t|≤T in both zero sums. The claimed additional gap concerning small zeros is rejected: q∉Q(k) and the functional equation already control them.

Check: Put δ=3 log log k/log k. For a primitive character of conductor q∉Q(k), all zeros with |γ|≤T have δ≤β≤1−δ, by reflection in the functional equation. Thus the zeros with |γ|≤1 contribute at most N(1,χ)/δ≪log(2q)/δ to Σ1/|ρ|. For 1<|γ|≤T, partial summation of N(u,χ)≪u log(q(u+2)) gives O(log(2q)log T+(log T)²). Since q≤k⁴ and log T=O(log k/log log k), the total is O((log k)²), as required. Bennett–Martin–O’Bryant–Rechnitzer, arXiv:1802.00085, p.11 and Proposition 2.5 p.14, explicitly provide the reflection and zero-counting input cited by the paper.

Reach: nothing. Existing register: `PAPER-BENNETT-SIKSEK-20/E18`.

### ErdosProgressionPowers/E19 — misprint

§4, proof of Lemma 4.1, p.364, in the published version, Annals of Mathematics 191 (2020), 355–392 (publisher PDF, SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf)

Printed mathematical fragment: divides divides.

Correct contract: "If instead p divides precisely two terms"

Check: A repeated word. Found by the errata job while checking the passage of E12.

Reach: nothing. Existing register: `PAPER-BENNETT-SIKSEK-20/E19`.

### ErdosProgressionPowers/E20 — misprint

Lemma 4.1 proof, published p.364; arXiv:1709.01022v1 p.9.

Printed mathematical fragment: n+d,n+2d,...,n+kd.

Correct contract: Use n,n+d,…,n+(k−1)d.

Check: The product (2) and the index sets A and I use indices 0 through k−1. The subsequent choice of a triple or quadruple containing the divisible term needs that range, not the displayed shifted range. Verified in both versions and on the publisher image.

Reach: nothing. Existing register: `PAPER-BENNETT-SIKSEK-20/E20`.

### ErdosProgressionPowers/E21 — misprint

Proposition 9.1 proof, published p.383, union-size bound before 0.9968k; compare arXiv:1709.01022v1 p.25.

Printed mathematical fragment: + (12k/loglogk)f.

Correct contract: Delete the trailing f.

Check: The undefined factor f occurs on the published image but is absent from the earlier arXiv formula. The preceding three estimates give 12k/log log k without a multiplier. No published correction was located.

Reach: nothing. Existing register: `PAPER-BENNETT-SIKSEK-20/E21`.

### ErdosProgressionPowers/E22 — misprint

Proposition 8.1 proof, published p.380, off-diagonal inner-product display; arXiv:1709.01022v1 p.22.

Printed mathematical fragment: k/2<m<k.

Correct contract: Use k/2<m≤k, as in the vectors and Proposition 8.2.

Check: The vector coordinates were indexed by k/2<m≤k, so their inner product includes the m=k coordinate. Restoring the endpoint permits the direct use of Proposition 8.2. Verified on the publisher image and in v1.

Reach: nothing. Existing register: `PAPER-BENNETT-SIKSEK-20/E22`.

### ErdosProgressionPowers/E23 — gap

§6, Case I, equation (21), p. 369; Proposition 6.1, pp. 366–367, published publisher PDF read 2026-10-05

Printed mathematical fragment: Σ μ_i(p)log p≥(1-3ε)k/8.

Correct contract: The signed four-character projection directly guarantees a large absolute sum, not a positive sum of one of the unsigned characters. Use |Σchi_a Lambda|>0.1239k throughout both endgames. An additional argument would be required for the printed positive choice.

Check: From -s1+s2+s3-s4>=4C one may infer max|s_i|>=C. The inference max s_i>=C does not hold for real s_i, for example (-4C,0,0,0). The four correlated mod 8 patterns likewise permit the local pattern obtained by lambda nonsquare in every class. This diagnoses the local pigeonhole deduction, not a counterexample to Proposition 6.1 under all global hypotheses. Both analytic contradictions require only absolute values.

Reach: the proof.

## Suggested-file boundary and acceptance

The file contains 38 native target declarations, 55 actual API declarations and 58 labeled unit-test examples. Ten geometric target declarations and the first-curve upstream-compatibility API are explicitly omitted. Local first/second-family statements give the equation invariants without a fully reconciled p-adic reduction signature. The character API retains native conductor and small-coefficient support but omits divisibility into the unavailable actual curve level. This is not a full combined Tau Ceti/Mathlib signature check. The unimplemented mathematical statements in this reader remain definitive.

The native file elaborates against the existing Mathlib build at its exact pin, with only admission warnings. No Tau Ceti build at its pin was available; the existing trace is not prototyped as a replacement. Compile success certifies syntax and types of the stated portion only, not its omitted conditions, source correctness, effective constants, independence review, proof closure or implementation.

Finite arithmetic checks separately verify primitive signed and positive examples, strict progression indices, repeated-middle quadruples, divisibility endpoints, normalization, both model discriminants and maximal-valuation deletion. The exact Gram and projection margins and the safe Roth numerical substitution have separate arithmetic diagnostics; these do not replace the imported analytic proofs.

## Sources

- Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums*. Published Annals of Mathematics 191 (2020), no. 2, 355–392, including §12 (Granville addendum); publisher PDF, 38 pages. https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf. Read: Published §§1–12 and references, pp.355–392; full text re-read 2026-10-05. Images inspected at pp.357,361,371,384.

- Henri Darmon and Andrew Granville, *On the equations z^m=F(x,y) and Ax^p+By^q=Cz^r*. Author-hosted scan of Bulletin of the London Mathematical Society 27 (1995), 513–543; accessed 2026-10-05; not independently collated with the publisher. https://www.math.mcgill.ca/darmon/pub/Articles/Research/12.Granville/pub12.pdf. Read: §2.1, Corollary 2.1 and its complete printed proof, pp.520–521; selected §2 descent setup pp.519–520. Genus formula verified on the p.521 image. No full-paper reading or publisher collation is claimed.
