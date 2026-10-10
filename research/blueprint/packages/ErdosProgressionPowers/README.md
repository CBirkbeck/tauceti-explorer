# Roadmap: perfect powers in primitive arithmetic progressions

This roadmap develops the arithmetic of an equation

\[
  \prod_{0\le i<k}(n+id)=y^\ell,\qquad \gcd(n,d)=1.
\]

The main theorem supplies an effectively computable absolute integer \(k_0\ge5\)
such that a solution with positive length \(k\ge k_0\) and prime exponent \(\ell\)
has \(yd=0\) or \(\ell\le\exp(10^k)\). The integers \(n,d,y\) may have either
sign. For each fixed sufficiently large \(k\), this bound combines with
fixed-exponent rational-point finiteness to give finitely many nontrivial solutions
with arbitrary exponent at least two. In particular it gives finiteness in the
positive domain of the classical progression problem.

The development follows Bennett–Siksek [BS20], Theorem 2, printed p. 357. It
retains two proofs after a common modular spine. The original proof combines
smooth-conductor character estimates, a thin-prime sieve and quantitative Roth.
Granville's addendum constructs a single small conductor outside an exceptional
set and uses an explicit formula. Having both routes makes their different
analytic requirements visible. The finiteness application uses Darmon–Granville
[DG95], Corollary 2.1 and its proof, printed pp. 520–521.

The exponent in the bound is \(10^k\). The assertion concerns each fixed large
length. An effective threshold for the prime-exponent theorem does not give an
effective enumeration of Faltings points. The stronger Erdős assertion of
nonexistence for all sufficiently large lengths belongs to the statement layer
EP.7; it supplies no premise to the proofs in EP.0–EP.6.

Suggested home: `TauCeti/NumberTheory/ProgressionPowers/`. Use individual files
for the arithmetic, the two Frey specializations, the character family and the two
analytic endgames. The README specifies the mathematics. `Suggested.lean`
suggests names and signatures and is not an exhaustive replacement for it.

## Scope and boundaries

The work here is the normalization of progression terms, two explicit Frey
specializations, progression-specific local and reduced-level bounds, selection of
one quadratic character per triple, and the arithmetic and analytic adapters
which turn those characters into the final bound. It also builds the diagonal
progression-curve application needed for fixed-exponent finiteness. Generic
elliptic, character, analytic and curve theories are consumed through the
following contracts.

| Owner | Material consumed here | Consumer |
|---|---|---|
| `EllipticCurves`, Layers 3, 4 and 8 | finite-field trace/Hasse theory; local minimality and reduction; the generic Frey equation | EP.1 |
| `ArithmeticGaloisRepresentations:R01.3` | actual Artin conductors and local wild bounds | EP.1–EP.2 |
| `SerreWeightAndLevelOptimisation:R20.2`, `R20.4` | ordinary and coefficient-prime weight-two level lowering | EP.1 |
| `EllipticModularityEffectiveComparisons:EC.1`–`EC.5` | removed-prime bound, Kraus thresholds and realization, irreducibility, rational-isogeny surjectivity | EP.1–EP.2 |
| `EllipticLegendreCharacterInterfaces:LG.0`–`LG.5` | six root-ordering parameters, good-prime units, character support, native halving and finite-field trace comparisons | EP.2 |
| `ClassicalArithmeticCompletion:CA.1`, `CA.4` | primitive squareclass characters, dyadic conductor bound, the quartic descent | EP.2 |
| `ComplexMultiplicationAndExplicitReciprocity:CM.3`, `CM.4` | CM integrality and CM residual-image comparison | EP.2 |
| `AnalyticNumberTheory:AN.2`, `AN.3`, `AN.5` | explicit prime estimates, zero density and effective character PNT, divisor-subpower bounds | EP.3–EP.5 |
| `SieveMethodsAndPrimePatterns:SV.2` | the diagonal/off-diagonal Gram inequality | EP.3 |
| `ExponentialSumsAndCircleMethod:ES.0` | generic smooth-modulus cancellation with the required quantitative contract | EP.3 |
| `AdditiveCombinatorics:AC.2` | the quantitative three-term progression theorem | EP.4 |
| `AlgebraicCurves`, Layer 7; `SchemeAndStackFoundations:SF.3`; `HeightsRationalPointsAndObstructions:RP.4` | Hurwitz, scheme/function-field genus comparison and Faltings | EP.6 |

The contracts are statements to consume, with their hypotheses intact. Local
reduction uses minimal integral models; a polynomial discriminant calculation
does not itself supply an Artin conductor. Kraus realization produces an actual
elliptic curve with the same residual representation. A private curve carrier
with a freely assigned natural number called its conductor is not that theorem.
The Legendre owner constructs the six parameters and their geometric
interpretation. The finite partition in EP.2 only classifies those parameters
for the chosen comparison curve.

The other owners likewise keep the generic analytic theorems. In particular,
CRT and finite differencing alone do not supply the short-character estimate
used in EP.3. The precise cancellation, zero-exclusion and Roth contracts below
are required in addition to the elementary algebra. The progression applications
are targets here; the underlying general theorems remain with their owners.

## Conventions and library foundation

Write \(t_i=n+id\), with \(0\le i<k\). Integer gcd is nonnegative:
`Int.gcd n d = Nat.gcd n.natAbs d.natAbs`. The primitive nontrivial solution
predicate \(S(n,d,k,y,\ell)\) includes positive length, a prime exponent,
coprimality, the product equation and \(yd\ne0\). Write \(H\) for \(S\)
together with \(k\ge10^8\) and \(\ell>\exp(10^k)\), and \(H^+\) for \(H\)
together with \(k\ge2\cdot10^{10}\). These are explicit conjunctions, not
opaque hypotheses containing a desired conclusion.

For positive odd \(\ell\), the signed factorization is
\(t_i=A_i z_i^\ell\), where \(A_i>0\) retains **all** powers of primes below
\(k\), and every prime of \(|z_i|\) is at least \(k\). Thus the prime equal to
\(k\), when it is prime, belongs to the large side. These \(A_i\) are distinct
from the finite signed, powerfree coefficient classes used in EP.6.

An elliptic curve is Mathlib's [`WeierstrassCurve`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.html#WeierstrassCurve) with its `IsElliptic`
condition; points and variable changes use its existing types. For
\(Y^2=X(X-a)(X+c)\), \(a+b+c=0\), the native discriminant and invariant are
\(16(abc)^2\) and \(16(a^2-bc)\). After progression normalization the first
quantity is \(64t_i^2t_j^2t_h^2/g^6\). A minimal discriminant at 2 requires a
separate local calculation. The second family has equation
\(Y^2=X(X^2+2\kappa dX+\kappa A)\) and discriminant
\(-64\kappa^3 A^2B\).

Keep three invariants distinct: the original elliptic conductor \(M\), the
deletion level \(M_0\), and the prime-to-\(\ell\) residual Artin conductor
\(N(\bar\rho)\). Their comparison is a theorem in EP.1. The symbol \(M_a\)
means the first-family deletion level. By contrast \(N_a\) is the actual
conductor of the chosen primitive quadratic character. Its odd part means
\(N_a/2^{v_2(N_a)}\), not a largest squarefree divisor. The selected family
satisfies \(N_a>1\), its odd part is nontrivial and squarefree, and
\(N_a\le8N_a^{\rm odd}\). `Nat.maxPrimeFac` has its library values at 0 and
1; all prime-factor inequalities here apply to conductors greater than 1.

Character sums include the integer interval \(k/2<m\le k\), represented by
\(\lfloor k/2\rfloor<m\le k\). The von Mangoldt weight includes prime
powers. A prime-only sum is identified separately before estimating the
prime-power tail. Lower bounds use absolute values. Negating a character's
values does not generally produce a multiplicative character. Logarithms,
square roots and fractional powers are real; their domain and positive
threshold hypotheses are retained in every analytic application.

Use the native meromorphic `DirichletCharacter.LFunction` for complex zeros.
The principal pole at 1 is excluded from zero witnesses. The naive
`LSeries` is totalized outside convergence and cannot define an exceptional
zero set. The bounded-height strip in EP.5 carries its height \(T\) explicitly.

Mathlib supplies integer gcd, natural factorization, integer prime valuations,
finite products, Weierstrass coefficients and invariants, Dirichlet characters
and their conductors, von Mangoldt, largest prime factors, and the Stirling
sequence. Tau Ceti supplies `WeierstrassCurve.frobeniusTrace`; it is the full
projective point-count defect, and its elliptic specialization is used for good
reductions. The declaration references at each target below identify the
existing inputs; none of these carriers is reconstructed.

## Construction order

| Layer | Targets | Inputs within this roadmap |
|---|---|---|
| EP.0 | signed factors, index sets and elementary divisibility | library foundation |
| EP.1 | Frey specializations, deletion levels and comparison curves | EP.0 |
| EP.2 | Legendre partition and one simultaneous character family | EP.0–EP.1 |
| EP.3 | harmonic and many-character contradiction criteria | EP.2 |
| EP.4 | thin-prime sieve, Roth witness and original endgame | EP.0, EP.2–EP.3 |
| EP.5 | bounded-height exceptional moduli and Granville witness | EP.0, EP.2 |
| EP.6 | effective prime bound and fixed-length finiteness | either EP.4 or EP.5, then the fixed-exponent adapter |
| EP.7 | explicit conjectural and announced predicates | EP.0; no outgoing premise to EP.1–EP.6 |

Every construction selects one object satisfying its conclusions simultaneously.
In particular, avoidance and small conductor must belong to the same triple.
The API and unit tests below are part of the targets, not separate hypotheses
which may be assumed during their proofs. All proposed local declaration names
are in `TauCeti.ProgressionPowers` unless a library or supplier namespace is
written explicitly.

## EP.0. Primitive solutions and signed factors

Define primitive nontrivial solutions with n,d,y in Z, positive length k and prime exponent ell, using the exact product over 0<=i<k and positive integer gcd. Prove the gcd-of-two-terms and large-prime valuation contracts. Construct the unique positive small-prime factors A_i with signed large-prime factors y_i for odd ell. Define strict arithmetic-progression triples and equal-sum quadruples. Define divisibility index sets and their one-residue-class cardinal bounds, including the +1 boundary.

### Primitive progression solutions

For n,d,y in Z and k,ell in N, S(n,d,k,y,ell) means k>0, ell prime, gcd(n,d)=1, product over i in range(k) of n+i*d equals y^ell, and y*d is nonzero. H adds k>=10^8 and ell>exp(10^k); Hplus adds k>=2*10^10. All real casts and exponentials are explicit.

**Hypotheses and domain.** For n,d,y in Z and k,ell in N, S(n,d,k,y,ell) means k>0, ell prime, gcd(n,d)=1, product over i in range(k) of n+i*d equals y^ell, and y*d is nonzero.

**API.**

- `TauCeti.ProgressionPowers.primitive_solution_iff` (characterisation): S is equivalent to precisely the five conjuncts in its definition.
- `TauCeti.ProgressionPowers.primitive_solution_term_ne_zero` (relation): S and i<k imply n+i*d is nonzero.
- `TauCeti.ProgressionPowers.primitive_solution_prime` (projection): S implies ell is prime and ell>=2.

**Unit tests.**

- `TauCeti.ProgressionPowers.primitive_solution_square` (computation): S(1,24,3,35,2) holds: 1*25*49=35^2.
- `TauCeti.ProgressionPowers.primitive_solution_signed` (computation): S(-3,2,4,3,2) holds; its four factors are -3,-1,1,3.
- `TauCeti.ProgressionPowers.primitive_solution_zero_length` (degenerate): S(n,d,0,y,ell) never holds.
- `TauCeti.ProgressionPowers.primitive_solution_nonprimitive` (non-example): S(4,2,1,2,2) does not hold despite its product equation.

**Construction and proof requirements.** Use the native positive integer gcd and finite product. Nonzero product implies every indexed term is nonzero. H and Hplus are explicit conjunctions, not new opaque assumptions.

**Prerequisites.** Mathlib `Int.gcd_def`.

**Source.** [BS20], Sections 1 and 3, equation (2), pp. 356, 360.

### Gcd of progression terms

If gcd(n,d)=1 and 0<=i<j, then gcd(n+i*d,n+j*d) divides j-i, with gcd nonnegative and the right side a natural integer.

**Hypotheses and domain.** If gcd(n,d)=1 and 0<=i<j, then gcd(n+i*d,n+j*d) divides j-i, with gcd nonnegative and the right side a natural integer.

**Construction and proof requirements.** Subtract the two terms. Any common divisor divides (j-i)*d. The term is coprime to d by a Bezout combination with n; cancel d using the native gcd cancellation theorem.

**Prerequisites.** EP.0 — primitive progression solutions; Mathlib `Int.gcd_greatest`; Mathlib `Int.dvd_of_dvd_mul_left_of_gcd_one`.

**Source.** [BS20], Lemma 3.1(i), p. 360.

### Large-prime valuation divisibility

Assume S. For prime q>=k and i<k, ell divides padicValInt(q,n+i*d). The valuation is on the absolute value of a nonzero integer.

**Hypotheses and domain.** Assume S.

**Construction and proof requirements.** The gcd bound prevents q dividing two distinct terms because their difference of indices is less than q. Apply valuation additivity to the nonzero product and the ell-th power. Only the chosen term contributes.

**Prerequisites.** EP.0 — gcd of progression terms; Mathlib `padicValInt`; Mathlib `padicValInt.mul`.

**Source.** [BS20], Lemma 3.1(ii), p. 360.

### Signed small-prime factorization

For positive odd ell and nonzero terms n+i*d, i<k, whose valuations at every prime q>=k are divisible by ell, choose the unique family (A_i,z_i) with A_i>0, z_i a nonzero signed integer, n+i*d=A_i*z_i^ell, every prime of A_i <k and every prime of |z_i| >=k. S with odd ell supplies these hypotheses. All powers of small primes remain in A_i; it need not be ell-powerfree.

**Hypotheses and domain.** For positive odd ell and nonzero terms n+i*d, i<k, whose valuations at every prime q>=k are divisible by ell, choose the unique family (A_i,z_i) with A_i>0, z_i a nonzero signed integer, n+i*d=A_i*z_i^ell, every prime of A_i <k and every prime of |z_i| >=k.

**API.**

- `TauCeti.ProgressionPowers.signed_factors_eq` (projection): For i<k, n+i*d=A_i*z_i^ell.
- `TauCeti.ProgressionPowers.signed_factors_support` (characterisation): A_i>0 and z_i!=0; p|A_i implies p<k, and p||z_i| implies k<=p, for every prime p.
- `TauCeti.ProgressionPowers.signed_factors_unique` (extensionality): Any family with these equality, sign and support conditions agrees componentwise with the chosen family.
- `TauCeti.ProgressionPowers.signed_factors_sign` (relation): The sign of z_i is the sign of n+i*d.

**Unit tests.**

- `TauCeti.ProgressionPowers.signed_factors_negative` (computation): For S(-8,1,1,-2,3), the single factor is (1,-2).
- `TauCeti.ProgressionPowers.signed_factors_boundary` (computation): For S(8,19,2,6,3), the factors are (1,2),(1,3); the prime p=k=2 belongs to the large side.
- `TauCeti.ProgressionPowers.signed_factors_small_power` (non-example): For n=64,d=0,k=3,ell=3 the valuation construction gives (64,1) at each index; 64 retains its full small-prime exponent and is not cube-free. This tests the construction, not S, since d=0.
- `TauCeti.ProgressionPowers.signed_factors_mixed_sign` (computation): For S(-8,7,2,2,3), the factors are (1,-2),(1,-1).

**Construction and proof requirements.** Split the factorization of |n+i*d| at the strict bound k. Divide each large-prime exponent by ell using large-prime valuation divisibility. Since ell is odd, restore the sign in z_i. Unique factorization and injectivity of odd powers give uniqueness.

**Prerequisites.** EP.0 — large-prime valuation divisibility; Mathlib `Nat.factorization`; Mathlib `Nat.prod_factorization_pow_eq_self`.

**Source.** [BS20], Equation (6), p. 360.

### Three-term progression triples

A(k) is the finite set of natural triples (i,j,h) with i,j,h<k, i<j and i+h=2*j. Thus i<j<h and the spacing is positive; there is no truncated subtraction in its definition.

**Hypotheses and domain.** A(k) is the finite set of natural triples (i,j,h) with i,j,h<k, i<j and i+h=2*j.

**API.**

- `TauCeti.ProgressionPowers.ap_triples_mem` (characterisation): Membership is equivalent to i,j,h<k, i<j and i+h=2*j.
- `TauCeti.ProgressionPowers.ap_triples_spacing` (relation): A member has i<j<h and j-i=h-j>0.
- `TauCeti.ProgressionPowers.ap_triples_mono` (functoriality): k<=K implies A(k) is a subset of A(K).

**Unit tests.**

- `TauCeti.ProgressionPowers.ap_triples_empty` (degenerate): A(0)=A(1)=A(2)=empty.
- `TauCeti.ProgressionPowers.ap_triples_three` (computation): A(3) consists exactly of (0,1,2).
- `TauCeti.ProgressionPowers.ap_triples_five` (computation): A(5) has exactly four elements.
- `TauCeti.ProgressionPowers.ap_triples_no_constant` (non-example): No triple (i,i,i) belongs to A(k).

**Construction and proof requirements.** Filter the finite product of three copies of range(k) by the two displayed conditions. Membership and strict h>j follow by natural-number arithmetic.

**Prerequisites.** Mathlib finite-set and arithmetic operations.

**Source.** [BS20], Section 3.1, equations (7)-(8), p. 361.

### Equal-sum progression quadruples

I(k) consists of (j1,i1,i2,j2) in range(k)^4 with j1<i1<=i2<j2 and i1+i2=j1+j2. Equality i1=i2 is permitted.

**Hypotheses and domain.** I(k) consists of (j1,i1,i2,j2) in range(k)^4 with j1<i1<=i2<j2 and i1+i2=j1+j2.

**API.**

- `TauCeti.ProgressionPowers.equal_sum_quadruples_mem` (characterisation): Membership is equivalent to the four bounds, ordering and equal-sum equation.
- `TauCeti.ProgressionPowers.equal_sum_quadruples_kappa` (relation): For a member, the integer kappa is negative and 0<|kappa|<k^2.
- `TauCeti.ProgressionPowers.equal_sum_quadruples_mono` (functoriality): The quadruple sets are monotone in k.

**Unit tests.**

- `TauCeti.ProgressionPowers.equal_sum_quadruples_empty` (degenerate): I(2) is empty.
- `TauCeti.ProgressionPowers.equal_sum_quadruples_three` (computation): I(3) consists exactly of (0,1,1,2), with kappa=-1.
- `TauCeti.ProgressionPowers.equal_sum_quadruples_repeated` (non-example): The middle indices in (0,1,1,2) must not be required to be distinct.

**Construction and proof requirements.** Filter the fourfold finite product. The positive gap makes kappa=j1*j2-i1*i2 a negative integer, of absolute value less than k^2.

**Prerequisites.** Mathlib finite-set and arithmetic operations.

**Source.** [BS20], Section 3.2, equations (11)-(13), p. 362.

### Divisibility index sets

For n,d in Z and k,r in N, I_r is the set of i<k such that the integer r divides n+i*d. The definition is total, including r=0; counting statements require r>0.

**Hypotheses and domain.** For n,d in Z and k,r in N, I_r is the set of i<k such that the integer r divides n+i*d.

**API.**

- `TauCeti.ProgressionPowers.divisibility_indices_mem` (characterisation): i belongs to I_r iff i<k and (r:Z)|(n+i*d).
- `TauCeti.ProgressionPowers.divisibility_indices_one` (simp): I_1 equals range(k).
- `TauCeti.ProgressionPowers.divisibility_indices_prime_d` (relation): If gcd(n,d)=1, p is prime and p|d, then I_p is empty.

**Unit tests.**

- `TauCeti.ProgressionPowers.divisibility_indices_sample` (computation): For n=1,d=2,k=6,r=3, I_r={1,4}.
- `TauCeti.ProgressionPowers.divisibility_indices_empty` (degenerate): For k=0 the set is empty, for every r.
- `TauCeti.ProgressionPowers.divisibility_indices_boundary` (non-example): For n=1,d=1,k=3,r=4, the set is empty; index k=3 is not included.

**Construction and proof requirements.** Filter range(k) by integer divisibility, rather than by a rational or real quotient. The range excludes k.

**Prerequisites.** Mathlib finite-set and arithmetic operations.

**Source.** [BS20], §9 before Proposition 9.1, p. 381; Proof of Proposition 12.3, pp.387–388.

### One-residue-class count

If gcd(n,d)=1 and r>0, then I_r is empty when gcd(r,d)>1. Otherwise I_r is a single residue class modulo r and |I_r|<=k/r+1 as a real inequality; for prime p with p not dividing d, ||I_p|-k/p|<1.

**Hypotheses and domain.** If gcd(n,d)=1 and r>0, then I_r is empty when gcd(r,d)>1.

**Construction and proof requirements.** A common prime of r,d cannot divide n. In the coprime case invert d modulo r and count one class in range(k); keep the rounding error even for r>k.

**Prerequisites.** EP.0 — divisibility index sets; EP.0 — gcd of progression terms.

**Source.** [BS20], §9 before Proposition 9.1, p. 381; Proof of Proposition 12.3, pp.387–388.

## EP.1. Frey families and residual comparisons

Normalize the three progression terms to coprime a+b+c=0 and specialize the upstream Frey-Hellegouarch model, without constructing a second generic curve. Build the application-specific equal-sum second model, its discriminant and odd-prime local tests. Prove the reduced-level divisibility, odd squarefreeness and exponential bounds for both families. Prove that primes k/2<p<=k divide d under k>=10^8 and ell>exp(10^k); the two-term case needs its own c4-unit test. Establish the coefficient-prime Serre-weight/conductor bridge, compare to an actual full-two-torsion curve at the reduced level using Kraus, and prove good reduction and equality of integer traces throughout the half interval, including forced trace zero at primes 3 modulo4.

### Progression Frey specialization

For integer n,d and a triple (i,j,h), put t_r=n+r*d, g=gcd(t_i,gcd(2*t_j,t_h)), a=t_i/g, b=-2*t_j/g, c=t_h/g. The specialization E has coefficients a1=a3=a6=0, a2=c-a, a4=-a*c, equivalently Y^2=X(X-a)(X+c). Under S and membership in A(k), g>0 and a,b,c are nonzero pairwise coprime with a+b+c=0. This is an application adapter to the upstream Frey model, not a second generic Frey carrier.

**Hypotheses and domain.** For integer n,d and a triple (i,j,h), put t_r=n+r*d, g=gcd(t_i,gcd(2*t_j,t_h)), a=t_i/g, b=-2*t_j/g, c=t_h/g.

**API.**

- `TauCeti.ProgressionPowers.first_curve_coefficients` (data): The native five coefficients are 0,c-a,0,-a*c,0, with a,c the normalized terms.
- `TauCeti.ProgressionPowers.first_curve_normalization` (relation): Under S and a member of A(k), g>0; g*a=t_i, g*b=-2*t_j, g*c=t_h; a+b+c=0 and every pair is coprime.
- `TauCeti.ProgressionPowers.first_curve_frey_compatibility` (compatibility): The specialization equals the upstream Frey model on the normalized coefficients, when that interface is supplied.

**Unit tests.**

- `TauCeti.ProgressionPowers.first_curve_unit_gcd` (computation): n=1,d=1,(i,j,h)=(0,1,2) gives g=1, (a,b,c)=(1,-4,3), a2=2,a4=-3.
- `TauCeti.ProgressionPowers.first_curve_even_gcd` (computation): n=2,d=1,(0,1,2) gives g=2, (a,b,c)=(1,-3,2), a2=1,a4=-2.
- `TauCeti.ProgressionPowers.first_curve_signed` (computation): n=-3,d=2,(0,1,2) gives (a,b,c)=(-3,2,1), a2=4,a4=3.

**Construction and proof requirements.** Normalize by the positive gcd. Use i+h=2*j and the gcd-of-terms contract. Specialize the upstream model to these coefficients and compare its native Weierstrass coefficients. Compare the progression model to the EllipticCurves Layer 8 generic Frey equation coefficient by coefficient.

**Prerequisites.** EP.0 — three-term progression triples; EP.0 — gcd of progression terms; `EllipticCurves#layer-8-selected-ℚ-specific-database-adapters`; Mathlib `WeierstrassCurve`; Mathlib `Int.gcd_def`.

**Source.** [BS20], Section 3.1, equations (7)-(8), p. 361; Section 3.1, display before equation (7), p. 361.

### First-family invariants and odd local properties

Under S, odd ell and a triple in A(k), Delta(E)=16(abc)^2=64*t_i^2*t_j^2*t_h^2/g^6, c4(E)=16(a^2-b*c); E is minimal and semistable at each odd prime, and ell divides v_p(Delta(E)) for every prime p>=k. The displayed Delta is for this equation, not an arbitrary minimal change at 2.

**Hypotheses and domain.** Under S, odd ell and a triple in A(k), Delta(E)=16(abc)^2=64*t_i^2*t_j^2*t_h^2/g^6, c4(E)=16(a^2-b*c); E is minimal and semistable at each odd prime, and ell divides v_p(Delta(E)) for every prime p>=k.

**Construction and proof requirements.** Compute the native Weierstrass discriminant and c4 by polynomial algebra. Pairwise coprimality forces c4 a unit whenever an odd prime divides Delta; use the upstream minimal/multiplicative criterion. At p>=k the gcd is a unit and the large-prime valuations are multiples of ell.

**Prerequisites.** EP.1 — progression frey specialization; EP.0 — large-prime valuation divisibility; `EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`; Mathlib `WeierstrassCurve.Δ`; Mathlib `WeierstrassCurve.c₄`.

**Source.** [BS20], Lemma 3.2 discriminant display, p. 361; corrected normalization; Lemma 3.2, p. 361; Lemma 3.2 last conclusion, p.361.

### Progression generalized Fermat identities

For any integers i1<i2<i3, (i3-i2)t_i1+(i1-i3)t_i2+(i2-i1)t_i3=0. Under signed factorization substitute t_i=A_i*z_i^ell. For a triple in A(k) this is A_i*z_i^ell-2*A_j*z_j^ell+A_h*z_h^ell=0.

**Hypotheses and domain.** For any integers i1<i2<i3, (i3-i2)t_i1+(i1-i3)t_i2+(i2-i1)t_i3=0.

**Construction and proof requirements.** Expand t_i=n+i*d, cancel n and d terms, then substitute the signed factor equalities. No generalized-Fermat theorem is assumed.

**Prerequisites.** EP.0 — signed small-prime factorization; EP.0 — three-term progression triples.

**Source.** [BS20], Section 3.1, display before equation (7), p. 361; §3.1 opening, p. 361.

### Equal-sum second Frey family

For q=(j1,i1,i2,j2) define A=t_j1*t_j2, B=t_i1*t_i2 and the integer kappa=j1*j2-i1*i2. The native Weierstrass model has coefficients 0,2*kappa*d,0,kappa*A,0. For q in I(k), A-B=kappa*d^2, kappa<0 and |kappa|<k^2. Signed factor substitution gives A_j1*A_j2*(z_j1*z_j2)^ell-A_i1*A_i2*(z_i1*z_i2)^ell=kappa*d^2.

**Hypotheses and domain.** For q=(j1,i1,i2,j2) define A=t_j1*t_j2, B=t_i1*t_i2 and the integer kappa=j1*j2-i1*i2.

**API.**

- `TauCeti.ProgressionPowers.second_curve_coefficients` (data): The coefficients are 0,2*kappa*d,0,kappa*A,0.
- `TauCeti.ProgressionPowers.second_curve_difference` (relation): Membership in I(k) implies A-B=kappa*d^2 and kappa<0.
- `TauCeti.ProgressionPowers.second_curve_equation` (compatibility): Its native affine equation is Y^2=X*(X^2+2*kappa*d*X+kappa*A).

**Unit tests.**

- `TauCeti.ProgressionPowers.second_curve_three` (computation): n=d=1,q=(0,1,1,2) gives kappa=-1,A=3,B=4,a2=-2,a4=-3.
- `TauCeti.ProgressionPowers.second_curve_signed` (computation): n=-3,d=2,q=(0,1,1,2) gives kappa=-1,A=-3,B=1,a2=-4,a4=3.
- `TauCeti.ProgressionPowers.second_curve_not_first` (non-example): At n=d=1,q=(0,1,1,2) the second a2 is -2, while the first model on (0,1,2) has a2=2.

**Construction and proof requirements.** Use the equal-sum cancellation to obtain the quadratic identity. This second curve is source-specific and is not a generic replacement elliptic-curve carrier. Its invariants are obtained by the native coefficient formulas.

**Prerequisites.** EP.0 — equal-sum progression quadruples; EP.0 — signed small-prime factorization; Mathlib `WeierstrassCurve`.

**Source.** [BS20], Section 3.2, equations (11)-(13), p. 362; Equation (11), p. 362.

### Second-family invariants and local tests

Under S, odd ell and q in I(k), Delta(E_q)=-64*kappa^3*A^2*B and c4(E_q)=16*kappa*(4*kappa*d^2-3*A). At prime p>=k with p not dividing kappa the model is minimal and semistable and ell divides v_p(Delta). In the separate Lemma 4.1 branch q=(i,i+1,i+p-1,i+p) with k/2<p<=k, p not dividing d and both endpoint terms divisible by p, one has p|A, p not dividing B*kappa*d, ell|v_p(A), c4 a p-unit and positive Delta valuation divisible by ell; thus reduction is minimal multiplicative there.

**Hypotheses and domain.** Under S, odd ell and q in I(k), Delta(E_q)=-64*kappa^3*A^2*B and c4(E_q)=16*kappa*(4*kappa*d^2-3*A).

**Construction and proof requirements.** Compute invariants using A-B=kappa*d^2. For p>=k use gcd and large valuations. For the half-interval two-term branch use unique or paired term valuations from the product equation and p-unit d, gaps p-1,1; prove the c4 unit directly. Do not invoke the p>=k statement at p<k.

**Prerequisites.** EP.1 — equal-sum second frey family; EP.0 — gcd of progression terms; EP.0 — large-prime valuation divisibility; `EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Source.** [BS20], Lemma 3.4, p. 362; Lemma 3.4 last conclusion, p.362; §4 second case, p.364.

### First-family reduced-level bounds

For S, ell>=7 and a in A(k), the irreducible residual representation of E_a occurs in a weight-two newform at the deletion level M_a. M_a divides 2^8*A_i*A_j*A_h, its odd part is squarefree, M_a divides 2^7*product over primes q<=k of q, and M_a<=2^7*exp(1.000081*k). No identification with the prime-to-ell residual conductor is implicit.

**Hypotheses and domain.** For S, ell>=7 and a in A(k), the irreducible residual representation of E_a occurs in a weight-two newform at the deletion level M_a.

**Construction and proof requirements.** Import the uniform full-two-torsion irreducibility cutoff and modular level lowering. Delete odd multiplicative primes whose Delta valuation is divisible by ell. Odd local exponents are zero or one; use the exact wild bound at 2. Apply the supplier explicit Chebyshev upper bound at x=k.

**Prerequisites.** EP.1 — first-family invariants and odd local properties; EP.0 — signed small-prime factorization; `EllipticModularityEffectiveComparisons:EC.4`; `SerreWeightAndLevelOptimisation:R20.2`; `ArithmeticGaloisRepresentations:R01.3`; `AnalyticNumberTheory:AN.2`.

**Source.** [BS20], Lemma 3.3, equation (9), and proof, pp. 361-362; Lemma 3.3 and proof, pp. 361-362; Proof of Lemma 3.3, p.362.

### Second-family reduced-level bounds

For S, ell>=11 and q in I(k), E_q has irreducible residual representation realized by a weight-two newform at deletion level M_q, with M_q dividing 2^7*3^5*kappa^2*product over primes r<=k of r^2 and M_q<=2^7*3^5*k^4*exp(2.000162*k).

**Hypotheses and domain.** For S, ell>=11 and q in I(k), E_q has irreducible residual representation realized by a weight-two newform at deletion level M_q, with M_q dividing 2^7*3^5*kappa^2*product over primes r<=k of r^2 and M_q<=2^7*3^5*k^4*exp(2.000162*k).

**Construction and proof requirements.** Use the rational-two-torsion irreducibility cutoff. Apply level lowering with the second local tests. Keep wild factors at 2 and3 and the kappa^2 exceptional factor; use |kappa|<k^2 and Chebyshev bound.

**Prerequisites.** EP.1 — second-family invariants and local tests; `EllipticModularityEffectiveComparisons:EC.4`; `SerreWeightAndLevelOptimisation:R20.2`; `ArithmeticGaloisRepresentations:R01.3`; `AnalyticNumberTheory:AN.2`.

**Source.** [BS20], Lemma 3.5 and proof, p. 363; Proof of Lemma 3.5, p.363.

### Half-interval primes divide the difference

Under H every prime p in (k/2,k] divides d.

**Hypotheses and domain.** Under H every prime p in (k/2,k] divides d.

**Construction and proof requirements.** Suppose p does not divide d. One or two terms are divisible by p. Choose a first-family triple containing the unique term, or the source equal-sum quadruple for two terms. Prove minimal multiplicative reduction and deleted p; p differs from ell. Apply the exact removed-prime norm bound to M_a or M_q. The exponential level bounds contradict ell>exp(10^k), using the numerical range k>=10^8.

**Prerequisites.** EP.1 — first-family reduced-level bounds; EP.1 — second-family reduced-level bounds; EP.1 — second-family invariants and local tests; `EllipticModularityEffectiveComparisons:EC.1` — removed prime bound.

**Source.** [BS20], Lemma 4.1, p. 364.

### Serre-weight and residual-conductor bridge

Under H and a in A(k), E_a[ell] is irreducible of Serre weight 2, its prime-to-ell Artin conductor equals the deletion level M_a, and ell does not divide M_a.

**Hypotheses and domain.** Under H and a in A(k), E_a[ell] is irreducible of Serre weight 2, its prime-to-ell Artin conductor equals the deletion level M_a, and ell does not divide M_a.

**Construction and proof requirements.** The level bound places ell above all level primes. At ell, use the good or finite-flat multiplicative case of coefficient-prime weight-two lowering, justified by the large-prime discriminant divisibility. Match every local conductor exponent with the deletion level. This is a real theorem, not an equality assigned by definition.

**Prerequisites.** EP.1 — first-family reduced-level bounds; EP.0 — large-prime valuation divisibility; `SerreWeightAndLevelOptimisation:R20.4`; `ArithmeticGaloisRepresentations:R01.3`.

**Source.** [BS20], Adapter between Theorem 4 and Lemma 5.1, §§2–5.

### Kraus threshold for progression levels

Under H and a in A(k), mu(M_a) and mu(lcm(M_a,4)) are at most 2^8*log(k)*exp(1.000081*k), and the exact Kraus threshold H_K(M_a) is less than exp(10^k). Here mu is the Gamma0 index and the dimension in H_K is the trivial-character newspace dimension.

**Hypotheses and domain.** Under H and a in A(k), mu(M_a) and mu(lcm(M_a,4)) are at most 2^8*log(k)*exp(1.000081*k), and the exact Kraus threshold H_K(M_a) is less than exp(10^k).

**Construction and proof requirements.** Use the primorial divisibility and the explicit totient ratio bound. Combine the resulting mu bounds with the upstream Martin newspace inequality and exact Kraus F,G,H definitions; compare their logarithms to 10^k. Do not use the full Gamma1 dimension.

**Prerequisites.** EP.1 — first-family reduced-level bounds; `EllipticModularityEffectiveComparisons:EC.2` — kraus f; `EllipticModularityEffectiveComparisons:EC.2` — kraus g; `EllipticModularityEffectiveComparisons:EC.2` — kraus h; `AnalyticNumberTheory:AN.5`.

**Source.** [BS20], Proof of Lemma 5.1, p. 365 (Tenenbaum Theorem 9 and following remark).

### Actual comparison elliptic curve

Under H, for every a in A(k) there exists an actual elliptic curve F_a/Q with full rational two-torsion, conductor exactly M_a and residual representation at the same prime ell isomorphic to that of E_a. All subsequent choices use one such F_a for each triple.

**Hypotheses and domain.** Under H, for every a in A(k) there exists an actual elliptic curve F_a/Q with full rational two-torsion, conductor exactly M_a and residual representation at the same prime ell isomorphic to that of E_a.

**Construction and proof requirements.** Apply the Kraus realization theorem with the coefficient-prime bridge, irreducibility and the strict threshold just proved. Fix a choice only after proving existence. A free natural-number field called conductor is not an admissible substitute for the native invariant.

**Prerequisites.** EP.1 — serre-weight and residual-conductor bridge; EP.1 — kraus threshold for progression levels; `EllipticModularityEffectiveComparisons:EC.3`.

**Source.** [BS20], Lemma 5.1, p. 365.

### Good reduction and forced trace zero

Under H, a in A(k), and prime k/2<p<=k, both E_a and its chosen F_a have good reduction at p and their integer Frobenius traces agree. If p is 3 modulo 4, that common trace is zero and F_a has supersingular reduction. Trace zero implies the supersingular criterion here because p>=5; the geometric definition is not replaced by trace zero in all characteristics.

**Hypotheses and domain.** Under H, a in A(k), and prime k/2<p<=k, both E_a and its chosen F_a have good reduction at p and their integer Frobenius traces agree.

**Construction and proof requirements.** p|d and gcd(n,d)=1 imply every term is a p-unit, hence good reduction for the first model. The level bound gives good reduction of F_a. Residual congruence together with the Hasse bounds and ell>4*sqrt(p) makes the integer traces equal. Reducing the first model with d=0 modulo p gives a twist of Y^2=X(X-1)(X+1), whose trace vanishes for p≡3 mod 4.

**Prerequisites.** EP.1 — actual comparison elliptic curve; EP.1 — half-interval primes divide the difference; EP.1 — first-family invariants and odd local properties; `EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`; `SerreWeightAndLevelOptimisation:R20.2`; Tau Ceti `WeierstrassCurve.frobeniusTrace`.

**Source.** [BS20], Lemma 5.2, first conclusion, pp. 365-366; Lemma 5.2, second conclusion, pp. 365-366.

## EP.2. Legendre cases and the simultaneous character family

Partition the six Legendre parameters by -Q^2 union2Q^2. Prove the application-specific nonsquare test at primes 3 mod 8, positive normalization lambda=2t^2 and 1-lambda=2v^2 in CaseII, and the tv square test at primes 5 mod 8 using the corrected order-four witness supplier from the Legendre-interface owner. Exclude complex multiplication of the progression Frey curve. Under k>=2*10^10 construct one fixed family of primitive quadratic characters of conductors N_a with squarefree nontrivial odd part dividing M_a and absolute von-Mangoldt half-interval sum greater than 0.1239k. Both cases must give all conclusions for the same character; positivity of the signed sum is not assumed.

### Legendre case partition

Given k and finite parameter sets L_a of rational numbers for a in A(k), form CaseI={a: some lambda in L_a is neither minus a rational square nor twice a rational square} and CaseII=A(k) minus CaseI. In the application L_a is the six-parameter set of the same chosen F_a, supplied by the Legendre-interface owner. Both cases are disjoint and exhaust A(k).

**Hypotheses and domain.** Given k and finite parameter sets L_a of rational numbers for a in A(k), form CaseI={a: some lambda in L_a is neither minus a rational square nor twice a rational square} and CaseII=A(k) minus CaseI.

**API.**

- `TauCeti.ProgressionPowers.case_partition_mem` (characterisation): Membership in CaseI is the stated existential nonsquare condition; membership in CaseII means every parameter is in -Q^2 union2Q^2.
- `TauCeti.ProgressionPowers.case_partition_union` (relation): The union of the two components is A(k) and they are disjoint.
- `TauCeti.ProgressionPowers.case_partition_reindex` (functoriality): Pointwise equal finite parameter sets give equal partitions.

**Unit tests.**

- `TauCeti.ProgressionPowers.case_partition_three` (computation): k=3 and L_a={3} put the unique triple in CaseI, not CaseII.
- `TauCeti.ProgressionPowers.case_partition_minus_one` (computation): k=3 and L_a={-1} put the unique triple in CaseII.
- `TauCeti.ProgressionPowers.case_partition_empty` (degenerate): k=0 gives two empty sets for every parameter assignment.

**Construction and proof requirements.** Filter A(k) by the explicit rational-square predicate and take the relative complement. Import the six-parameter interface rather than reconstructing the generic Legendre theory here.

**Prerequisites.** EP.0 — three-term progression triples; EP.1 — actual comparison elliptic curve; `EllipticLegendreCharacterInterfaces:LG.0`.

**Source.** [BS20], §6, p. 367.

### Case-I nonsquare and absolute projection

Under H, every associated Legendre parameter lambda is a nonsquare modulo every prime k/2<p<=k with p = 3 mod 8. Under Hplus, a CaseI parameter lies outside all four squareclasses ±Q^2,±2Q^2. The primitive characters of lambda,-lambda,2lambda,-2lambda have mod8 projection mu1-mu2-mu3+mu4=4*(lambda/p) at p = 3 mod 8 and zero otherwise, away from support. One of the four therefore has absolute prime-weighted sum at least (1-3*0.002811)*k/8 and nontrivial odd conductor. The absolute values are printed in equation (21) and Proposition 6.1, equation (16).

**Hypotheses and domain.** Under H, every associated Legendre parameter lambda is a nonsquare modulo every prime k/2<p<=k with p = 3 mod 8.

**Construction and proof requirements.** Use trace zero, the supplier Legendre order-four test and the congruence #F_p=p+1 to rule out a square lambda. The mod8 classes rule out the other excluded squareclasses. Apply the explicit theta(x;8,3) error bound at k and k/2. The triangle inequality bounds the maximum absolute sum by a quarter of the absolute signed combination.

**Prerequisites.** EP.2 — legendre case partition; EP.1 — good reduction and forced trace zero; `ClassicalArithmeticCompletion:CA.1` — quadratic character of a squareclass; `AnalyticNumberTheory:AN.2`; `EllipticLegendreCharacterInterfaces:LG.1`; `EllipticLegendreCharacterInterfaces:LG.3`; `EllipticLegendreCharacterInterfaces:LG.5`.

**Source.** [BS20], Lemma 6.4, p. 368; §6, Case I, equations (19)–(21), p. 369; Equation (21), p.369.

### Case-II positive normalization and square test

Under H and CaseII one can choose lambda=2*t^2 and 1-lambda=2*v^2 with positive rational t,v, so 2*t^2+2*v^2=1. For each prime k/2<p<=k with p = 5 mod 8, t and v are p-units and the Legendre symbol of t*v is +1.

**Hypotheses and domain.** Under H and CaseII one can choose lambda=2*t^2 and 1-lambda=2*v^2 with positive rational t,v, so 2*t^2+2*v^2=1.

**Construction and proof requirements.** Use the six-parameter transformations to place lambda in(0,1) and both lambda,1-lambda in2Q^2. At p = 5 mod 8 compare the first-family reduction to a twist of the CM model with lambda=-1. If tv were nonsquare, the corrected supplier order-four point yields forbidden8-divisibility of a point count, contradicting the explicit CM trace class.

**Prerequisites.** EP.2 — legendre case partition; EP.1 — good reduction and forced trace zero; `EllipticLegendreCharacterInterfaces:LG.0`; `EllipticLegendreCharacterInterfaces:LG.2`; `EllipticLegendreCharacterInterfaces:LG.3`; `EllipticLegendreCharacterInterfaces:LG.4`; `EllipticLegendreCharacterInterfaces:LG.5`.

**Source.** [BS20], Lemma 6.6, pp. 371-372; §6 before (22), p. 370.

### CM exclusion for progression Frey curves

Under H, the native elliptic curve E_a is not CM, for every a in A(k). Its j-invariant is 2^8*(a^2-b*c)^3/(a*b*c)^2. Integral j and pairwise coprimality would force each of a,b,c to be a signed power of 2; the relation a+b+c=0 forces two to be equal. The resulting index equations imply d=0 or d divides3, contrary to H and the half-prime-divisibility theorem.

**Hypotheses and domain.** Under H, the native elliptic curve E_a is not CM, for every a in A(k).

**Construction and proof requirements.** Import algebraic integrality of CM j-values and deduce integer j for rational j. At an odd divisor of abc the numerator is a unit, contradicting integrality. Classify the elementary signed powers-of-two relation and use gcd(n,d)=1 and index bounds. The contradiction uses at least one prime in the half interval, supplied by the explicit prime estimate.

**Prerequisites.** EP.1 — first-family invariants and odd local properties; EP.1 — half-interval primes divide the difference; `ComplexMultiplicationAndExplicitReciprocity:CM.3`; `AnalyticNumberTheory:AN.2`; Mathlib `WeierstrassCurve.j`.

**Source.** [BS20], §6 final Case-II proof, p. 373.

### Case-II conductor exclusion and projection

Under Hplus and CaseII choose a character from the four squareclasses omega*t*v, omega in{±1,±2}. One has absolute prime-weighted sum at least (1-3*0.002811)*k/8; its odd conductor divides M_a and is not 1. If odd conductor were1, tv is a square or twice a square; parity excludes the latter, quartic descent forces lambda=1/2, and the CM residual image versus non-CM surjectivity at ell>37 contradicts the residual comparison.

**Hypotheses and domain.** Under Hplus and CaseII choose a character from the four squareclasses omega*t*v, omega in{±1,±2}.

**Construction and proof requirements.** Project to primes 5 mod 8 using the previous square test and the explicit theta(x;8,5) estimate. Use Legendre parameter valuation and conductor support. Clear denominators primitively in2t^2+2v^2=1. Apply the exact T^4+V^4=2U^2 descent theorem, not FLT4. Import the CM normalizer image and the rational-isogeny surjectivity theorem, then use the same residual comparison.

**Prerequisites.** EP.2 — case-ii positive normalization and square test; EP.2 — cm exclusion for progression frey curves; EP.1 — actual comparison elliptic curve; `ClassicalArithmeticCompletion:CA.1` — quadratic character of a squareclass; `ClassicalArithmeticCompletion:CA.4` — quartic descent t4 plus v4 equals 2u2; `ComplexMultiplicationAndExplicitReciprocity:CM.4`; `EllipticModularityEffectiveComparisons:EC.5`; `AnalyticNumberTheory:AN.2`; `EllipticLegendreCharacterInterfaces:LG.1`; `EllipticLegendreCharacterInterfaces:LG.2`; `EllipticLegendreCharacterInterfaces:LG.4`.

**Source.** [BS20], §6 Case II, pp. 372–373; §6 Case II first paragraph, p.372.

### Simultaneous quadratic character family

Under Hplus choose for every a in A(k) one pair (N_a,chi_a), with N_a>1 and chi_a a native primitive real quadratic character modulo its conductor N_a. The same choice simultaneously has: |sum over integers k/2<m<=k of chi_a(m)*Lambda(m)|>0.1239*k; N_a^odd squarefree, N_a^odd dividing M_a and A_i*A_j*A_h, N_a^odd!=1; and N_a<=8*N_a^odd. N_a is the actual native character conductor, not a freely assigned modulus.

**Hypotheses and domain.** Under Hplus choose for every a in A(k) one pair (N_a,chi_a), with N_a>1 and chi_a a native primitive real quadratic character modulo its conductor N_a.

**API.**

- `TauCeti.ProgressionPowers.character_family_primitive` (compatibility): For every a, chi_a.IsPrimitive and chi_a.conductor=N_a; it is quadratic and real.
- `TauCeti.ProgressionPowers.character_family_mass` (relation): The absolute half-interval von-Mangoldt sum is strictly greater than 0.1239*k.
- `TauCeti.ProgressionPowers.character_family_support` (relation): N_a^odd is squarefree, divides both M_a and A_i*A_j*A_h, and N_a<=8*N_a^odd.
- `TauCeti.ProgressionPowers.character_family_nonprincipal` (characterisation): N_a^odd!=1, hence N_a>1 and chi_a is not the principal character.

**Unit tests.**

- `TauCeti.ProgressionPowers.character_family_one` (compatibility): Under Hplus, at every triple chi_a(1)=1.
- `TauCeti.ProgressionPowers.character_family_zero` (non-example): Under Hplus, chi_a(0)=0 and N_a>1; the principal modulus1 character cannot be selected.
- `TauCeti.ProgressionPowers.character_family_same_witness` (characterisation): Under Hplus, each selected pair satisfies both the large absolute sum and the odd-support bound; selecting different pairs for the two properties does not meet the contract.

**Construction and proof requirements.** Use the exhaustive partition and the respective four-character constructions. The primitive squareclass character gives the exact conductor and dyadic bound. Convert prime sums to von-Mangoldt sums by the effective prime-power tail; the strict numerical margin is0.000045875*k. Fix one finite family only after all its simultaneous conclusions hold.

**Prerequisites.** EP.2 — case-i nonsquare and absolute projection; EP.2 — case-ii conductor exclusion and projection; EP.1 — first-family reduced-level bounds; `ClassicalArithmeticCompletion:CA.1` — quadratic character of a squareclass; `ClassicalArithmeticCompletion:CA.1` — odd part of a quadratic conductor is squarefree; `ClassicalArithmeticCompletion:CA.1` — two adic conductor bound; `AnalyticNumberTheory:AN.2`; Mathlib `DirichletCharacter.conductor`; Mathlib `DirichletCharacter.IsPrimitive`; Mathlib `ArithmeticFunction.vonMangoldt`.

**Source.** [BS20], Proposition 6.1 and its two-case construction, pp. 366-373; Proposition 6.1, p. 367; Proposition 6.1, p. 367; Case II exclusion, pp. 372–373.

## EP.3. The original analytic contradiction criteria

Prove the progression-specific harmonic-family criterion of Proposition 7.2 for pairwise distinct largest conductor primes, P(N_a)<(log k)^(1-c1) and reciprocal mass at least 0.166, retaining effective dependence on 0<c1<1 and decay exponent min(c1,1/2). Prove the distinct-character criterion of Proposition 8.1 for more than 17 log k characters, P(N_a)<=k^(7/16) and N_a<k^c2 with c2>10. Import the generic character PNT, exceptional-zero repulsion, checked small-conductor zero exclusion, pairwise smooth-modulus cancellation and Bombieri-Selberg inequality. Apply the exact diagonal/off-diagonal bounds and the margin 1/68<0.1239^2.

### Harmonic smooth-conductor criterion

For each fixed 0<c1<1 there is an effectively computable k1(c1) such that under Hplus, any finite D subset A(k) with pairwise distinct P(N_a), P(N_a)<(log k)^(1-c1) and sum over D of 1/P(N_a)>=0.166 forces k<=k1(c1). Here P is the native largest prime factor and all selected characters are nonprincipal.

**Hypotheses and domain.** For each fixed 0<c1<1 there is an effectively computable k1(c1) such that under Hplus, any finite D subset A(k) with pairwise distinct P(N_a), P(N_a)<(log k)^(1-c1) and sum over D of 1/P(N_a)>=0.166 forces k<=k1(c1).

**Construction and proof requirements.** For a nonexceptional character use log N<1.07*(log k)^(1-c1) and the supplier effective PNT: the error is O(k*exp(-c*(log k)^min(c1,1/2))*(log k)^4), contradicting the fixed lower bound for effective large k. If all characters are exceptional, order their conductors; repulsion gives N_j>N_1^(2^(j-1)). The reciprocal mass is<2.13/log N_1, so N_1<=373743<400000. Use the checked unconditional small-conductor zero-exclusion certificate, not an assumed GRH statement.

**Prerequisites.** EP.2 — simultaneous quadratic character family; `AnalyticNumberTheory:AN.2`; `AnalyticNumberTheory:AN.3`; Mathlib `Nat.maxPrimeFac`.

**Source.** [BS20], Proposition 7.2, pp. 374-375; §7 proof, p.375; corrected exponent for general c1; §7 proof, pp.375–376.

### Many smooth characters criterion

For each c2>10 there is an effective k2(c2) such that under Hplus any B subset A(k) with |B|>17*log k, pairwise distinct selected characters, P(N_a)<=k^(7/16) and N_a<k^c2 forces k<=k2(c2). Quantitative proof: the mean squared absolute weighted sum is at most (k*log k/2+O(k))*((k+1)/(34*log k)+k^(1-c3))=(1/68+o(1))*k^2, where c3(c2)>0 is effective.

**Hypotheses and domain.** For each c2>10 there is an effective k2(c2) such that under Hplus any B subset A(k) with |B|>17*log k, pairwise distinct selected characters, P(N_a)<=k^(7/16) and N_a<k^c2 forces k<=k2(c2).

**Construction and proof requirements.** Apply the SieveMethodsAndPrimePatterns:SV.2 Gram inequality to x_m=Lambda(m), y_a,m=chi_a(m) on the integer half interval. The diagonal is at most(k+1)/2, the input norm is k log k/2+O(k), and the generic smooth-modulus cancellation bound controls off-diagonal pairs by k^(1-c3). Its proof must use the product ambient modulus separately from the primitive conductor and eventual divisor subpower bounds. Compare1/68<0.1239^2; no fourth power of0.1239 enters.

**Prerequisites.** EP.2 — simultaneous quadratic character family; `SieveMethodsAndPrimePatterns:SV.2` — bombieri diagonal offdiagonal; `ExponentialSumsAndCircleMethod:ES.0`; `AnalyticNumberTheory:AN.2`; `AnalyticNumberTheory:AN.5` — eventual divisor subpower bound.

**Source.** [BS20], Proposition 8.1, p. 376; Equations (32)–(35), pp. 379–380.

## EP.4. Thin-prime sieves and the original proof assembly

Define survivors avoiding a prime set S of reciprocal mass below 0.17 and the two open-left sieving intervals. Bound the losses, perform maximal-valuation deletion so the surviving A-product divides(k-1)!, and prove the smooth factorial bound and density of A_i<=k^139. At the certified threshold k>=exp(exp(10^7)), use the supplier quantitative Roth bound to choose one triple simultaneously avoiding S, with P(N_a)<=k^(7/16), no conductor prime in((log k)^(1-10^-4),10^4log k], and N_a<k^418. The substitution 132 log(2)*10^5<10^7 certifies the Roth cutoff; the smaller 10^6 cutoff does not follow from this substitution. Build the maximal distinct-largest-prime family, prove its reciprocal-mass dichotomy and dispatch the small endpoint with c1=1/20000. This is one complete original-route reduction to an effective bound on k. The generic survivor API controls odd primes; reciprocal mass<0.17 excludes2. Include the explicit Stirling upper adapter to the native sequence and its telescoping bound.

### Thin-prime sieve survivors

For n,d,k and a finite set S of primes<=k define T_pr={p prime:k^(7/16)<p<=k}, U_pr={p prime:(log k)^(1-10^-4)<p<=10^4*log k}, and J=range(k) minus the union of divisibility index sets I_p for p in S union T_pr union U_pr. Both lower endpoints are open; no integer ceiling replaces the prime predicates.

**Hypotheses and domain.** For n,d,k and a finite set S of primes<=k define T_pr={p prime:k^(7/16)<p<=k}, U_pr={p prime:(log k)^(1-10^-4)<p<=10^4*log k}, and J=range(k) minus the union of divisibility index sets I_p for p in S union T_pr union U_pr.

**API.**

- `TauCeti.ProgressionPowers.thin_prime_survivors_mem` (characterisation): i is in J iff i<k and none of the three forbidden prime sets divides n+i*d.
- `TauCeti.ProgressionPowers.thin_prime_survivors_antitone` (functoriality): Increasing S can only shrink J.
- `TauCeti.ProgressionPowers.thin_prime_survivors_conductor` (relation): Under Hplus, a triple in J has conductor N_a avoiding every odd prime in S union U_pr and P(N_a)<=k^(7/16). If S has reciprocal mass<0.17, it cannot contain2, so the full avoidance conclusion follows. Under Hplus all primes of U_pr are odd.

**Unit tests.**

- `TauCeti.ProgressionPowers.thin_prime_survivors_zero` (degenerate): For k=0 the survivor set is empty.
- `TauCeti.ProgressionPowers.thin_prime_survivors_union` (characterisation): Deleting S,T_pr,U_pr in any order gives the same finite set.
- `TauCeti.ProgressionPowers.thin_prime_survivors_open_left` (non-example): A prime exactly at a lower endpoint is not in that interval prime set; it is deleted only if it occurs in another forbidden set.

**Construction and proof requirements.** Form finite prime sets with explicit real bounds, then take their divisibility-index union and relative complement. The construction is total; density and conductor consequences require Hplus and the certified numerical range. Only odd primes in the forbidden sets are excluded from N_a by the coefficient-support theorem. Its dyadic factor is bounded by8; 2<=k^(7/16) under Hplus. For the later thinSet application, 2 in S would force reciprocal mass>=1/2, contradicting<0.17.

**Prerequisites.** EP.0 — divisibility index sets; EP.2 — simultaneous quadratic character family.

**Source.** [BS20], §9 proof, p. 382.

### Maximal-valuation deletion

For gcd(n,d)=1, nonzero terms i<k, positive coefficients A_i dividing |n+i*d| supported on primes<k, and J subset range(k), delete for every prime p<k dividing some A_i with i in J an index having maximal v_p(A_i). Break ties by the least index. The resulting J1 is a subset of J, loses at most the number of primes below k, and product over J1 of A_i divides(k-1)!. Signed factors satisfy the coefficient hypotheses.

**Hypotheses and domain.** For gcd(n,d)=1, nonzero terms i<k, positive coefficients A_i dividing |n+i*d| supported on primes<k, and J subset range(k), delete for every prime p<k dividing some A_i with i in J an index having maximal v_p(A_i).

**API.**

- `TauCeti.ProgressionPowers.valuation_deletion_subset` (projection): J1 is a subset of J and its cardinal is at least |J| minus the number of primes below k.
- `TauCeti.ProgressionPowers.valuation_deletion_factorial` (relation): Under the coefficient and primitive-term hypotheses, the product over J1 of A_i divides(k-1)!.
- `TauCeti.ProgressionPowers.valuation_deletion_tie` (characterisation): For each supported prime the removed maximizer is the least among equal-valuation indices.

**Unit tests.**

- `TauCeti.ProgressionPowers.valuation_deletion_empty` (degenerate): An empty J remains empty.
- `TauCeti.ProgressionPowers.valuation_deletion_units` (computation): If every A_i=1, then J1=J and its product is1.
- `TauCeti.ProgressionPowers.valuation_deletion_sample` (computation): n=d=1,k=5,J=range(5),A=(1,2,3,4,1) gives J1={0,1,4} and product2 dividing24.
- `TauCeti.ProgressionPowers.valuation_deletion_least_tie` (non-example): n=d=1,k=4,J=range(4),A=(1,2,1,2) removes index1 rather than3 for the prime2.

**Construction and proof requirements.** For each prime in the finite support union take the least maximizer of the native valuation. If j is its deleted index, each remaining valuation is bounded by v_p(|i-j|), by the term-gcd bound and maximality. The product of nonzero index differences divides j!*(k-1-j)!, which divides(k-1)!. Combine prime valuations.

**Prerequisites.** EP.0 — gcd of progression terms; EP.0 — signed small-prime factorization; Mathlib `padicValNat_def`; Mathlib `Nat.factorization`.

**Source.** [BS20], Proof of Proposition 9.1, p. 384.

### Explicit Stirling upper bound

For every natural m>=1, (m!:R)<=sqrt(2*pi*m)*(m/exp(1))^m*exp(1/(12*m)). This is the numerical adapter quoted in the source, derived from the pinned Stirling sequence rather than a second asymptotic theory.

**Hypotheses and domain.** m is a positive natural number; all displayed divisions, square roots and exponentials are real.

**Construction and proof requirements.** For integers M>m>=1, sum the pinned inequality log(stirlingSeq j)-log(stirlingSeq(j+1))<=1/(12*j*(j+1)) over m<=j<M. Both sides telescope, giving log(stirlingSeq m)-log(stirlingSeq M)<=1/(12*m)-1/(12*M). Use the pinned limit stirlingSeq M -> sqrt(pi)>0 and continuity of log to pass to M -> infinity. Exponentiating gives stirlingSeq m<=sqrt(pi)*exp(1/(12*m)). Unfold the existing stirlingSeq and multiply by its positive denominator sqrt(2*m)*(m/exp1)^m. Combine positive square roots to obtain the displayed bound.

**Prerequisites.** Mathlib `Stirling.stirlingSeq`; Mathlib `Stirling.log_stirlingSeq_sdiff_le`; Mathlib `Stirling.tendsto_stirlingSeq_sqrt_pi`.

**Source.** [BS20], Proof of Proposition9.1, printed p.384, first displayed factorial bound and reference[43].

### Sieve losses and coefficient density

Under Hplus, k>=exp(exp(10^7)) and sum over S of 1/p<0.17, the losses from T_pr,U_pr,S are at most k*log(16/7), k*log(1/(1-10^-4))+5*k*log10/loglogk+10^4*logk, and strictly less than 0.17*k+1.1*k/logk. Thus |J|>0.0032*k. Deletion gives |J1|>0.00319*k. Its smooth coefficient product is less than k^(0.44*k), and J2={i in J1:A_i<=k^139} has |J2|>10^-5*k.

**Hypotheses and domain.** Under Hplus, k>=exp(exp(10^7)) and sum over S of 1/p<0.17, the losses from T_pr,U_pr,S are at most k*log(16/7), k*log(1/(1-10^-4))+5*k*log10/loglogk+10^4*logk, and strictly less than 0.17*k+1.1*k/logk.

**Construction and proof requirements.** Sum the one-residue-class bound over primes, keeping endpoints and the +1 loss. Import explicit reciprocal-prime and prime-count estimates. Apply maximal-valuation deletion. The large-prime part of(k-1)! has log at least(9/16)*k*logk-5*k; combine the local explicit Stirling upper adapter. Markov counting with log A_i>139*logk bounds the complement of J2. The numerical range is strengthened to the certified Roth threshold. For the 0.44 bound one may instead use the weaker native (k-1)!<=k^k: subtracting the large-prime contribution gives log(product A_i)<=(7/16)*k*logk+5*k<0.44*k*logk in the certified range. The sharper Stirling adapter remains a separately covered source item.

**Prerequisites.** EP.4 — thin-prime sieve survivors; EP.4 — maximal-valuation deletion; EP.0 — one-residue-class count; `AnalyticNumberTheory:AN.2`; EP.4 — explicit stirling upper bound; Mathlib `Nat.factorial_le_pow`.

**Source.** [BS20], §9 proof, pp. 382–383; §9 proof, pp. 383–384; §9 proof, p. 384; §9 end of proof, p. 384; §9 p.384, reference [43].

### Simultaneous thin-conductor witness

Under Hplus and k>=exp(exp(10^7)), for every finite S of primes<=k with reciprocal mass<0.17 choose one a in A(k) such that no p in S divides N_a, P(N_a)<=k^(7/16), no prime in((logk)^(1-10^-4),10^4logk] divides N_a, and N_a<k^418. All four conclusions hold for this same triple. Use the 10^7 cutoff, which follows from the quantitative Roth substitution in the integration requirements below.

**Hypotheses and domain.** Under Hplus and k>=exp(exp(10^7)), for every finite S of primes<=k with reciprocal mass<0.17 choose one a in A(k) such that no p in S divides N_a, P(N_a)<=k^(7/16), no prime in((logk)^(1-10^-4),10^4logk] divides N_a, and N_a<k^418.

**API.**

- `TauCeti.ProgressionPowers.thin_conductor_witness_mem` (projection): The selected triple belongs to A(k) and all its indices belong to J2.
- `TauCeti.ProgressionPowers.thin_conductor_witness_avoid` (relation): Its conductor has no prime in S or in U_pr.
- `TauCeti.ProgressionPowers.thin_conductor_witness_size` (relation): Its largest prime factor is<=k^(7/16) and its conductor is<k^418.

**Unit tests.**

- `TauCeti.ProgressionPowers.thin_conductor_witness_empty_s` (degenerate): For S empty the two nonvacuous size bounds and U_pr avoidance still hold under the stated large-k hypotheses.
- `TauCeti.ProgressionPowers.thin_conductor_witness_same` (characterisation): One triple satisfies the conjunction of all four properties; four independently chosen witnesses are insufficient.
- `TauCeti.ProgressionPowers.thin_conductor_witness_certified_threshold` (non-example): The quantitative Roth exponent needed at density10^-5 exceeds10^6 and is less than10^7; the constructor requires the certified latter threshold.

**Construction and proof requirements.** Apply the supplier quantitative Roth statement to J2 with density10^-5. Its loglog threshold is132*log2*10^5<10^7, not<10^6. Choose one three-term progression in J2. The odd-support and dyadic conductor bound yield N<=2^8*k^417<k^418, and membership in J enforces all avoidance properties. The reciprocal-mass hypothesis excludes2 from S, and the lower endpoint of U_pr exceeds2 in this range; therefore the odd-prime survivor API supplies full conductor avoidance here.

**Prerequisites.** EP.4 — sieve losses and coefficient density; EP.0 — three-term progression triples; EP.2 — simultaneous quadratic character family; `AdditiveCombinatorics:AC.2`; Mathlib `Real.log_two_gt_d9`; Mathlib `Real.log_two_lt_d9`.

**Source.** [BS20], Proposition 9.1, pp. 381-384; §9 end of proof, p. 384; Proposition 9.1(I), p. 382; Proposition 9.1(II), p. 382; Proposition 9.1(III), p. 382; Proposition 9.1(IV), p. 382; Proposition 9.1, pp.381–384; repaired Roth-threshold calculation.

### Maximal largest-prime family

Under Hplus at the certified threshold, choose a nonempty inclusion-maximal finite B subset A(k) whose P(N_a) are pairwise distinct, all P(N_a)<=k^(7/16), N_a<k^418, and N_a avoids U_pr. Maximality is by inclusion, not by conductor size or cardinal alone.

**Hypotheses and domain.** Under Hplus at the certified threshold, choose a nonempty inclusion-maximal finite B subset A(k) whose P(N_a) are pairwise distinct, all P(N_a)<=k^(7/16), N_a<k^418, and N_a avoids U_pr.

**API.**

- `TauCeti.ProgressionPowers.maximal_conductor_family_admissible` (projection): B is nonempty, lies in A(k), has distinct P(N_a), and satisfies all three conductor restrictions.
- `TauCeti.ProgressionPowers.maximal_conductor_family_maximal` (characterisation): Every admissible superset of B equals B.
- `TauCeti.ProgressionPowers.maximal_conductor_family_mass` (relation): If |B|<=17logk, its reciprocal-largest-prime mass is at least0.17.

**Unit tests.**

- `TauCeti.ProgressionPowers.maximal_conductor_family_nonempty` (non-example): Under the constructor hypotheses B cannot be empty.
- `TauCeti.ProgressionPowers.maximal_conductor_family_no_duplicate` (characterisation): Two distinct members never have the same largest conductor prime, even if their conductors differ.
- `TauCeti.ProgressionPowers.maximal_conductor_family_extension` (characterisation): An outside triple satisfying all size and gap restrictions must repeat one of B’s largest primes.

**Construction and proof requirements.** The witness for S empty makes the family nonempty. Select an inclusion-maximal member of the finite family of admissible subsets of A(k). For |B|<=17logk a reciprocal mass<0.17 would permit a new witness with S={P(N_a):a in B}, contradicting maximality.

**Prerequisites.** EP.4 — simultaneous thin-conductor witness.

**Source.** [BS20], §10, pp. 384–385; endpoint correction.

### Original analytic endgame

There is an effective absolute K_original such that Hplus implies k<=K_original. For the maximal B, if |B|>17logk apply the many-character criterion with c2=418; otherwise D={a in B:P(N_a)<=(logk)^(1-10^-4)} has reciprocal mass>=0.1683>0.166. Its smoothness is strictly less than(logk)^(1-1/20000), so the harmonic criterion applies.

**Hypotheses and domain.** There is an effective absolute K_original such that Hplus implies k<=K_original.

**Construction and proof requirements.** Distinct largest prime factors imply distinct primitive characters. In the small-cardinality branch, U_pr avoidance places every complementary largest prime above10^4logk, giving complementary mass<=0.0017. Use c1=1/20000 to handle the closed endpoint, instead of substituting the strict criterion at c1=10^-4. Take the maximum of the certified threshold and both effective contradiction thresholds.

**Prerequisites.** EP.4 — maximal largest-prime family; EP.3 — harmonic smooth-conductor criterion; EP.3 — many smooth characters criterion.

**Source.** [BS20], §10 proof of Theorem 2, p. 385; corrected endpoint dispatch.

## EP.5. Granville exceptional moduli and a single witness

For a bounded-height Landau-Page constant c>0 define T=exp(c log k/(3log log k)) and the moduli 1<=q<=k^4 having a primitive L-function zero with |Im rho|<=T and Re rho>1-3log log k/log k. Prove the polylogarithmic cardinal bound, minimum modulus>=log k and at-most-one modulus below T. Apply the corrected half-interval explicit formula to primitive nonprincipal characters outside this set. Define the exceptional divisibility indices with r|q and r>=q^(1/3)/2 and prove their sparse cardinal bound with all k/r+1 losses retained. Combine maximal-valuation deletion with disjoint triples to choose one triple that both avoids these indices and satisfies 8A_iA_jA_h<=k^4. Odd-conductor divisibility and the bound N<=8Nodd force that same conductor outside the exceptional set. The resulting contradiction gives an independent effective bound on k without Roth or short-sum cancellation. Both analytic zero predicates exclude the principal-character pole at1.

### Bounded-height exceptional moduli

For k>=3 and fixed c>0 from the bounded-height Landau-Page theorem put T=exp(c*logk/(3*loglogk)). Q(k,c) consists of integers1<=q<=k^4 for which some native primitive complex Dirichlet character modulo q has a zero rho of its meromorphic LFunction at a regular point (rho!=1 or chi is nonprincipal) with |Im rho|<=T and Re rho>1-3*loglogk/logk. The modulus is positive; LSeries, which is zero outside convergence, is not used.

**Hypotheses and domain.** For k>=3 and fixed c>0 from the bounded-height Landau-Page theorem put T=exp(c*logk/(3*loglogk)).

**API.**

- `TauCeti.ProgressionPowers.exceptional_moduli_mem` (characterisation): Membership is equivalent to the displayed positive-modulus bounds and the bounded-height zero witness. A zero witness satisfies rho!=1 or chi!=1, excluding the principal pole.
- `TauCeti.ProgressionPowers.exceptional_moduli_finite` (structure): The set is finite, contained in{1,..,k^4}.
- `TauCeti.ProgressionPowers.exceptional_moduli_height` (projection): Every witness zero obeys the same T used in the zero-density estimates.

**Unit tests.**

- `TauCeti.ProgressionPowers.exceptional_moduli_zero` (non-example): 0 never belongs to Q(k,c), regardless of zero witnesses.
- `TauCeti.ProgressionPowers.exceptional_moduli_upper` (characterisation): q>k^4 never belongs.
- `TauCeti.ProgressionPowers.exceptional_moduli_high_zero` (non-example): A zero with |Im rho|>T alone cannot witness membership.
- `TauCeti.ProgressionPowers.exceptional_moduli_principal_pole` (non-example): For every positive modulus, the pair chi=1,rho=1 never satisfies the zero-witness predicate, regardless of the totalized LFunction value.

**Construction and proof requirements.** Take a subset of range(k^4+1) using the exact quantified character and complex-zero predicate. Use the native primitive-character and meromorphic continuation vocabulary. The analytic height restriction is essential. Explicitly exclude the principal-character pole at rho=1. Mathlib totalizes the function there; an assigned value is not a meromorphic zero. The same guard belongs in the bounded-height Landau-Page input predicate.

**Prerequisites.** Mathlib `DirichletCharacter.LFunction`; Mathlib `DirichletCharacter.IsPrimitive`.

**Source.** [BS20], Section 12, equations (40)-(41), p. 386.

### Exceptional-modulus bounds

For the fixed positive Landau-Page constant c, there are effective K,C such that k>=K gives |Q(k,c)|<=C*(logk)^61, every q in Q(k,c) is>=logk, and at most one q in Q(k,c) is<T. These conclusions are proved simultaneously from zero density and bounded-height zero-free input.

**Hypotheses and domain.** For the fixed positive Landau-Page constant c, there are effective K,C such that k>=K gives |Q(k,c)|<=C*(logk)^61, every q in Q(k,c) is>=logk, and at most one q in Q(k,c) is<T.

**Construction and proof requirements.** Apply the supplier log-free density estimate at Q=k^4 and the exact T, with all character/modulus multiplicities. For small q apply bounded-height zero exclusion and the Landau-Page uniqueness strip. Constants depend only on the fixed analytic input, not on n,d.

**Prerequisites.** EP.5 — bounded-height exceptional moduli; `AnalyticNumberTheory:AN.3`.

**Source.** [BS20], Proposition 12.1 first conclusion, p.386; Proposition 12.1 second conclusion, pp.386–387; Proposition 12.1 third conclusion, pp.386–387.

### Nonexceptional half-interval character estimate

For sufficiently large k, every native primitive nonprincipal character of conductor q<=k^4 outside Q(k,c) has absolute von-Mangoldt half-interval sum<=C*k/logk, uniformly with effective C. The principal character is excluded.

**Hypotheses and domain.** For sufficiently large k, every native primitive nonprincipal character of conductor q<=k^4 outside Q(k,c) has absolute von-Mangoldt half-interval sum<=C*k/logk, uniformly with effective C.

**Construction and proof requirements.** Subtract the supplier truncated explicit formulas at k and k/2 with the same height T. Bound(k^rho-(k/2)^rho)/rho as an integral, by C*k^Re(rho)*min(1,1/|rho|); a naked sum1/|rho| is not uniform near zero. Use local zero counts for the weighted zero sum and the nonexceptional real-part bound. Track parity constants, trivial zeros and horizontal truncation errors. T, not Q=k^4, belongs in the truncation denominator.

**Prerequisites.** EP.5 — bounded-height exceptional moduli; `AnalyticNumberTheory:AN.3`.

**Source.** [BS20], Proposition 12.2, p.387; repaired hypothesis and zero-sum estimate.

### Exceptional divisibility indices

For integers n,d, positive k and any finite set Q of positive moduli, Bad is the set of i<k for which some q in Q has a positive divisor r with r>=q^(1/3)/2 and r dividing n+i*d. In the application Q=Q(k,c). The real cube-root threshold and the +1 count for r>k are retained.

**Hypotheses and domain.** For integers n,d, positive k and the exceptional modulus set Q(k,c), Bad is the set of i<k for which some q in Q(k,c) has a positive divisor r with r>=q^(1/3)/2 and r dividing n+i*d.

**API.**

- `TauCeti.ProgressionPowers.exceptional_indices_mem` (characterisation): Membership is precisely the positive-divisor witness with i<k.
- `TauCeti.ProgressionPowers.exceptional_indices_empty_moduli` (simp): An empty exceptional-modulus set gives an empty bad-index set.
- `TauCeti.ProgressionPowers.exceptional_indices_mono` (functoriality): Increasing the exceptional-modulus set can only increase the bad-index set.

**Unit tests.**

- `TauCeti.ProgressionPowers.exceptional_indices_empty` (degenerate): An empty modulus set gives no bad indices.
- `TauCeti.ProgressionPowers.exceptional_indices_large_divisor` (non-example): With modulus set{1000},n=1000,d=1,k=3, index0 is bad via r=1000>k; truncating r at k loses it.
- `TauCeti.ProgressionPowers.exceptional_indices_sample` (computation): With modulus set{8},n=d=1,k=4, every index is bad, since r=1 is an admissible divisor at the exact threshold8^(1/3)/2=1.

**Construction and proof requirements.** Filter range(k) by the finite exceptional-modulus/divisor witness. Do not restrict the divisors to r<=k.

**Prerequisites.** EP.5 — bounded-height exceptional moduli; EP.0 — divisibility index sets.

**Source.** [BS20], Proposition 12.3, pp.387–388.

### Exceptional indices are sparse

For all sufficiently large k and coprime nonzero n,d, |Bad|<=C*k/(logk)^(1/4), with effective C uniform in n,d.

**Hypotheses and domain.** For all sufficiently large k and coprime nonzero n,d, |Bad|<=C*k/(logk)^(1/4), with effective C uniform in n,d.

**Construction and proof requirements.** For each q sum k/r+1 over its divisors r>=q^(1/3)/2, using the residue count. Split off the at-most-one q<T, where q>=logk and eventual divisor subpower estimates suffice. For remaining q>=T use T decay against the polylogarithmic cardinal bound. The total +1 error is O(k^(1/3)*(logk)^61) after using q<=k^4 and a sufficiently small divisor exponent; it is negligible relative to k/(logk)^(1/4).

**Prerequisites.** EP.5 — exceptional divisibility indices; EP.5 — exceptional-modulus bounds; EP.0 — one-residue-class count; `AnalyticNumberTheory:AN.5` — eventual divisor subpower bound.

**Source.** [BS20], Proposition 12.3, pp.387–388.

### Single Granville conductor witness

Under Hplus and sufficiently large effective k choose one triple a=(i,j,h) in A(k) whose three indices avoid Bad and with N_a<=8*A_i*A_j*A_h<=k^4. Both properties hold for the same triple.

**Hypotheses and domain.** Under Hplus and sufficiently large effective k choose one triple a=(i,j,h) in A(k) whose three indices avoid Bad and with N_a<=8*A_i*A_j*A_h<=k^4.

**API.**

- `TauCeti.ProgressionPowers.addendum_witness_mem` (projection): The chosen triple belongs to A(k), with positive spacing1.
- `TauCeti.ProgressionPowers.addendum_witness_avoid` (relation): Each of its three indices is outside Bad.
- `TauCeti.ProgressionPowers.addendum_witness_size` (relation): Its conductor and coefficient product satisfy N_a<=8*A_i*A_j*A_h<=k^4.

**Unit tests.**

- `TauCeti.ProgressionPowers.addendum_witness_same` (characterisation): One chosen triple satisfies both avoidance and size; two separate existential witnesses are insufficient.
- `TauCeti.ProgressionPowers.addendum_witness_disjoint` (compatibility): The chosen triple is one of the disjoint consecutive blocks used in the factorial product estimate.
- `TauCeti.ProgressionPowers.addendum_witness_scale` (computation): At k=64,8*k^(7/2)=k^4; the final size implication holds for every k>=64.

**Construction and proof requirements.** Delete one maximal-valuation index per small prime, then delete Bad. Use the original disjoint consecutive blocks(0,1,2),(3,4,5),..; at most one block is lost per deleted index. Effectively more than2k/7 blocks survive. Their combined A-product divides(k-1)!<=k^k. One block has coefficient product<=k^(7/2); k>=64 implies8*k^(7/2)<=k^4. Choose that block, which already avoids Bad. The effective prime-count estimate from AN.2 bounds the number of maximal-valuation deletions by pi(k)=o(k); combine it with the uniform Bad bound before counting disjoint blocks.

**Prerequisites.** EP.4 — maximal-valuation deletion; EP.5 — exceptional indices are sparse; EP.2 — simultaneous quadratic character family; EP.0 — three-term progression triples; Mathlib `Nat.factorial_le_pow`; `AnalyticNumberTheory:AN.2`.

**Source.** [BS20], §12 final paragraph, p.388; explicit simultaneous-witness repair.

### Exceptional-conductor detection

For the single witness above, N_a is not in Q(k,c). Indeed N_a^odd divides A_i*A_j*A_h and N_a<=8*N_a^odd, so the product of the three gcd(N_a,A_r) is>=N_a/8. One gcd is>=N_a^(1/3)/2, and as a positive divisor of N_a and the indexed term it would make that same index bad if N_a were exceptional.

**Hypotheses and domain.** For the single witness above, N_a is not in Q(k,c).

**Construction and proof requirements.** Use squarefreeness of Nodd to distribute its prime factors among the three gcds. Apply the product lower bound and the real cube-root threshold. Since A_r divides |t_r|, the selected gcd is exactly a permitted Bad witness. Contradict the avoidance API of the same chosen triple.

**Prerequisites.** EP.5 — single granville conductor witness; EP.2 — simultaneous quadratic character family; EP.5 — exceptional divisibility indices.

**Source.** [BS20], §12 final paragraph, p.388; corrected divisibility.

### Granville analytic endgame

There is an effectively computable absolute K_Granville such that Hplus implies k<=K_Granville. This route uses no quantitative Roth theorem or short smooth-modulus cancellation bound.

**Hypotheses and domain.** There is an effectively computable absolute K_Granville such that Hplus implies k<=K_Granville.

**Construction and proof requirements.** Choose the single addendum witness. Detection puts its conductor outside Q, its size is<=k^4 and its odd part is nontrivial, so the selected character is nonprincipal. The uniform O(k/logk) bound contradicts its strict absolute lower bound>0.1239*k for effective large k.

**Prerequisites.** EP.5 — single granville conductor witness; EP.5 — exceptional-conductor detection; EP.5 — nonexceptional half-interval character estimate; EP.2 — simultaneous quadratic character family.

**Source.** [BS20], §12 end, p.388.

## EP.6. Effective exponent bound and fixed-length finiteness

Prove the main theorem: an effectively computable absolute k0 exists such that every primitive integer progression product of length k>=k0 with prime exponent ell has y*d=0 or ell<=exp(10^k). Either proof route supplies such a threshold. For each fixed k>=k0, increased to at least5, import Faltings and construct the Darmon-Granville fixed-exponent adapter. Reduce composite exponents to prime divisors and exclude power variables0,1,-1 in nontrivial sufficiently long progressions. Deduce finiteness of positive integer(n,d,y,ell) tuples for each fixed k and all ell>=2, not one finite set over all lengths and not an effective enumeration of points. Correct equation(2.2) of Darmon–Granville to coefficients j-1 and j-2 with its1-based term indexing.

### Effective prime-exponent bound

There exists an effectively computable absolute integer k0>=5 such that for every positive integer k>=k0, integers n,d,y with gcd(n,d)=1, and prime ell satisfying product over i<k of(n+i*d)=y^ell, either y*d=0 or ell<=exp(10^k). The same logical statement has both an original-route and a Granville-route effective threshold; an unqualified classical existential by itself is not an effectivity certificate.

**Hypotheses and domain.** There exists an effectively computable absolute integer k0>=5 such that for every positive integer k>=k0, integers n,d,y with gcd(n,d)=1, and prime ell satisfying product over i<k of(n+i*d)=y^ell, either y*d=0 or ell<=exp(10^k).

**Construction and proof requirements.** Suppose y*d!=0 and ell>exp(10^k). Taking k0 above10^8 and2*10^10 gives Hplus. Either analytic endgame contradicts sufficiently large k. Fix the maximum of the explicit or effectively controlled input thresholds. Keep a ledger of effective dependencies; none uses ineffective Siegel constants or a rational-point height bound.

**Prerequisites.** EP.4 — original analytic endgame; EP.5 — granville analytic endgame; EP.0 — primitive progression solutions.

**Source.** [BS20], Theorem 2, p. 357.

### Fixed-exponent progression finiteness

For every fixed k>=5 and integer ell>=2, the set of coprime integer(n,d,y) with y*d!=0 and product over i<k of(n+i*d)=y^ell is finite. For positive n,d,y this is Darmon–Granville Corollary 2.1; the signed extension needs the same finite sign patterns rather than an unsupported appeal to positivity.

**Hypotheses and domain.** For every fixed k>=5 and integer ell>=2, the set of coprime integer(n,d,y) with y*d!=0 and product over i<k of(n+i*d)=y^ell is finite.

**Construction and proof requirements.** Choose finite small-prime ell-powerfree coefficient classes, including signs. Eliminate n,d to get a diagonal complete intersection in P^(k-1); its projection to the ternary curve has degree ell^(k-3) and the displayed Riemann-Hurwitz computation gives2g-2=k*ell^(k-1)*(1-2/k-1/ell)>0. Import the smoothness, ramification and genus-to-Faltings interface from the geometry owner. Each rational projective point has only finitely many primitive integral lifts, then only finitely many y. Repeat over finitely many sign patterns. The source version is the author-hosted scan listed in the references. With the source indexing t_i=a+i*d for1<=i<=k, use lambda_j*z_j^ell=(j-1)*lambda_2*z_2^ell-(j-2)*lambda_1*z_1^ell for3<=j<=k. The printed (2.2) coefficients j and j-1 shift the term by d; this local misprint does not change the distinct-branch or genus argument.

**Prerequisites.** EP.0 — gcd of progression terms; `HeightsRationalPointsAndObstructions:RP.4`; `AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula`; `SchemeAndStackFoundations:SF.3`.

**Source.** [DG95], §2.1, Corollary 2.1 and its full proof, pp.520–521; [BS20], §1, p.357, discussion of Darmon–Granville Corollary 2.1.

### Composite exponent reduction

If ell>=2 and p is a prime divisor of ell, set Y=y^(ell/p); then y^ell=Y^p and the same progression has prime exponent p. For a nontrivial progression of length k>=5, |y|>1: otherwise every nonzero factor is±1, impossible for five distinct terms with d!=0. For each fixed integer Y with |Y|>1 there are finitely many pairs(y,r), r>=1, with y^r=Y.

**Hypotheses and domain.** If ell>=2 and p is a prime divisor of ell, set Y=y^(ell/p); then y^ell=Y^p and the same progression has prime exponent p.

**Construction and proof requirements.** Use exact division p*(ell/p)=ell and power associativity. If |y|=1 the absolute product is1 and all absolute factors are1. Bound r by any nonzero prime valuation of |Y| and bound y by |Y|. No exponent bound for composite ell is asserted directly.

**Prerequisites.** EP.0 — primitive progression solutions; Mathlib `Nat.factorization`.

**Source.** [BS20], §1 finiteness consequence of Theorem 2, p.357.

### Fixed-length all-exponent finiteness

For each fixed k>=k0, there are finitely many positive integer tuples(n,d,y,ell) with ell>=2, gcd(n,d)=1 and product over i<k of(n+i*d)=y^ell. Also the nontrivial signed tuples with y*d!=0 form a finite set when the signed fixed-exponent adapter is supplied. This is not finiteness as k varies and not an effective point-enumeration theorem.

**Hypotheses and domain.** For each fixed k>=k0, there are finitely many positive integer tuples(n,d,y,ell) with ell>=2, gcd(n,d)=1 and product over i<k of(n+i*d)=y^ell.

**Construction and proof requirements.** The effective prime theorem bounds the possible prime divisors p of ell for this fixed k. The fixed-exponent theorem yields finitely many triples(n,d,Y) for every such p. The composite reduction and |Y|>1 give finitely many roots/exponent multipliers above every triple; take the finite union.

**Prerequisites.** EP.6 — effective prime-exponent bound; EP.6 — fixed-exponent progression finiteness; EP.6 — composite exponent reduction.

**Source.** [BS20], Abstract and §1 after Theorem 2, p. 357.

## EP.7. Conjectural and announced predicates

Import the Erdős-Selfridge theorem for positive consecutive integers from its classical-arithmetic owner. State the stronger Erdős eventual-nonexistence conjecture with positivity and the gcd condition, without proving it or using it as an assumption. Register the Section 11 smooth-multiplier equation product(n+id)=b*y^ell with nonzero b supported on primes<=tau*k for fixed tau<1/2, marking the announced extension as lacking a separate quantified proof. Specify the two assertions and test their domains; neither is a shortcut in either unconditional proof route.

### Erdős nonexistence assertion

For integer K>=0 let ErdosThreshold(K) assert that for every k>=K, k>=2, positive integers n,d,y and ell>=2 with gcd(n,d)=1, the progression product is not y^ell. The Erdős conjecture is the assertion that some K satisfies this explicit predicate. It is recorded, not proved or used as an assumption.

**Hypotheses and domain.** For integer K>=0 let ErdosThreshold(K) assert that for every k>=K, k>=2, positive integers n,d,y and ell>=2 with gcd(n,d)=1, the progression product is not y^ell.

**API.**

- `TauCeti.ProgressionPowers.erdos_threshold_iff` (characterisation): The predicate is equivalent to the displayed positive-domain universal nonexistence statement.
- `TauCeti.ProgressionPowers.erdos_threshold_mono` (functoriality): K<=L and ErdosThreshold(K) imply ErdosThreshold(L).
- `TauCeti.ProgressionPowers.erdos_threshold_nonexistence` (projection): For every k>=K with k>=2, ErdosThreshold(K) implies the exact primitive positive-domain product inequality for every n,d,y>0 and integer ell>=2.

**Unit tests.**

- `TauCeti.ProgressionPowers.erdos_threshold_zero` (non-example): ErdosThreshold(0) is false because n=1,d=24,k=3,y=35,ell=2 is a primitive positive solution.
- `TauCeti.ProgressionPowers.erdos_threshold_three` (non-example): The same solution shows ErdosThreshold(3) is false.
- `TauCeti.ProgressionPowers.erdos_threshold_positive_domain` (characterisation): The signed solution(-3,2,4,3,2) is excluded by positivity and is not itself a counterexample to ErdosThreshold(4).

**Construction and proof requirements.** State the positive-domain quantifiers and exact primitive product equation. Keep integer exponent ell>=2, not just prime ell. The definition is an explicit predicate; it has no admitted proposition body.

**Prerequisites.** EP.0 — primitive progression solutions; `ClassicalArithmeticCompletion:CA.4`.

**Source.** [BS20], §1, Conjecture, p. 356.

### Smooth-multiplier progression equation

For real tau, n,d,y,b in Z and k,ell in N, SmoothMultiplierSolution means 0<k, ell prime, gcd(n,d)=1, y*d!=0, b!=0, product over i<k of(n+i*d)=b*y^ell, and every prime divisor of |b| is<=tau*k. The discussion concerns fixed 0<=tau<1/2. Its extension is an announcement without a separate quantified proof, not an unconditional theorem of this roadmap.

**Hypotheses and domain.** For real tau, n,d,y,b in Z and k,ell in N, SmoothMultiplierSolution means 0<k, ell prime, gcd(n,d)=1, y*d!=0, b!=0, product over i<k of(n+i*d)=b*y^ell, and every prime divisor of |b| is<=tau*k.

**API.**

- `TauCeti.ProgressionPowers.smooth_multiplier_iff` (characterisation): The predicate has exactly the displayed domain, equation and support conditions.
- `TauCeti.ProgressionPowers.smooth_multiplier_one` (compatibility): For tau>=0 and b=1 it is equivalent to S(n,d,k,y,ell).
- `TauCeti.ProgressionPowers.smooth_multiplier_tau_mono` (functoriality): For tau<=sigma, a solution for tau is a solution for sigma.

**Unit tests.**

- `TauCeti.ProgressionPowers.smooth_multiplier_zero` (non-example): b=0 never gives a SmoothMultiplierSolution.
- `TauCeti.ProgressionPowers.smooth_multiplier_unit` (computation): tau=0,n=1,d=24,k=3,y=35,ell=2,b=1 gives a solution.
- `TauCeti.ProgressionPowers.smooth_multiplier_half_boundary` (non-example): n=d=y=1,k=2,ell=2,b=2 satisfies the equation, but cannot satisfy the support bound for tau<1/2.

**Construction and proof requirements.** Use the explicit equation and native prime-divisor predicate. The zero multiplier is excluded so its prime support cannot make the support condition vacuous. The fixed tau<1/2 restriction does not cover all multipliers supported below k.

**Prerequisites.** EP.0 — primitive progression solutions; Mathlib `Nat.maxPrimeFac`.

**Source.** [BS20], §11, pp. 385–386.

## Supplier contracts

The following inputs are supplied by their named owners. Each must be applied to the same objects and conventions as the consuming targets above.

### EllipticCurves#layer-8-selected-ℚ-specific-database-adapters

The existing generic integral Frey model Y^2=X(X-a)(X+c), native coefficient/discriminant formulas, full-two-torsion and semistable algorithmic-to-Artin comparison interface. This roadmap supplies only the progression normalization and specialization.

Consumed by EP.1 — progression frey specialization.

### EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

Native p-adic integral-model minimality and reduction criteria: at odd p, c4 a unit and Delta of positive valuation imply minimal multiplicative reduction; Delta a unit implies good reduction. Identify semistable algorithmic exponents with actual Artin exponents; no unrestricted wild comparison is inferred.

Consumed by EP.1 — first-family invariants and odd local properties, EP.1 — second-family invariants and local tests.

### EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1

Hasse bound for elliptic good reductions with the native all-points trace, trace-zero calculation for twists of x(x-1)(x+1) at primes3mod4, and the geometric supersingular criterion at p>=5.

Consumed by EP.1 — good reduction and forced trace zero.

### ArithmeticGaloisRepresentations:R01.3

Actual elliptic and residual Artin conductors including the wild bounds f2<=8 and f3<=5, odd semistable exponents, and the prime-to-ell residual conductor; identify these invariants with the qualified local algorithmic outputs.

Consumed by EP.1 — first-family reduced-level bounds, EP.1 — second-family reduced-level bounds, EP.1 — serre-weight and residual-conductor bridge.

### SerreWeightAndLevelOptimisation:R20.2

Weight-two level lowering for the same actual irreducible elliptic residual representation, with the odd multiplicative primes whose minimal-Delta valuation is divisible by ell removed. Good-prime Hecke/Frobenius congruences retain coefficient field and prime above ell.

Consumed by EP.1 — first-family reduced-level bounds, EP.1 — second-family reduced-level bounds, EP.1 — good reduction and forced trace zero.

### SerreWeightAndLevelOptimisation:R20.4

Coefficient-prime finite-flat weight-two lowering at ell>=5, including good and multiplicative cases, to prove M_a equals the prime-to-ell residual conductor. This equality is not supplied by the deletion-level definition.

Consumed by EP.1 — serre-weight and residual-conductor bridge.

### EllipticModularityEffectiveComparisons:EC.3

Exact-conductor Kraus realization under full-two-torsion, irreducibility, Serre weight 2 and ell>H_K(N), producing an actual full-two-torsion elliptic curve with conductor exactly N and the same residual representation.

Consumed by EP.1 — actual comparison elliptic curve.

### EllipticModularityEffectiveComparisons:EC.4

Uniform rational-isogeny classification consequences: full rational two-torsion implies irreducibility at prime ell>=7; a rational two-torsion point implies irreducibility at prime ell>=11.

Consumed by EP.1 — first-family reduced-level bounds, EP.1 — second-family reduced-level bounds.

### EllipticModularityEffectiveComparisons:EC.5

Lemos surjectivity at every residual prime ell>37 for a non-CM elliptic curve over Q admitting a nontrivial rational cyclic isogeny; preserve that isogeny hypothesis. The first progression Frey curve has rational two-torsion.

Consumed by EP.2 — case-ii conductor exclusion and projection.

### ComplexMultiplicationAndExplicitReciprocity:CM.3

CM j-values are algebraic integers; in the Q-rational elliptic specialization j is an integer. Match the native j-invariant and do not infer integrality for arbitrary non-CM curves.

Consumed by EP.2 — cm exclusion for progression frey curves.

### ComplexMultiplicationAndExplicitReciprocity:CM.4

For the CM lambda=1/2 curve, its residual Galois image lies in a Cartan normalizer and is not all GL2 at primes ell>37; state the field, CM extension and conjugacy/isogeny hypotheses and compare to the same residual representation.

Consumed by EP.2 — case-ii conductor exclusion and projection.

### AnalyticNumberTheory:AN.2

Checked effective prime estimates used here: theta(x)<1.000081x at the stated large range; theta(x;8,3) and theta(x;8,5) errors<=0.002811x/4 at x>=10^10; explicit pi, reciprocal-prime and sum(log p)/p bounds for §§5,9; the primitive nonprincipal character PNT with denominator sqrt(log x)+log N; and a sufficient effective prime-power tail for the0.000045875k margin. Record all ranges and distinguish theta from psi. Also provide an effective pi(k)=o(k) bound for the disjoint-block witness.

Consumed by EP.1 — first-family reduced-level bounds, EP.1 — second-family reduced-level bounds, EP.2 — case-i nonsquare and absolute projection, EP.2 — case-ii conductor exclusion and projection, EP.2 — cm exclusion for progression frey curves, EP.2 — simultaneous quadratic character family, EP.3 — harmonic smooth-conductor criterion, EP.3 — many smooth characters criterion, EP.4 — sieve losses and coefficient density, EP.5 — single granville conductor witness.

### AnalyticNumberTheory:AN.3

Effective quadratic exceptional-zero repulsion N_j>N_1^(2^(j-1)); reproducible unconditional nonvanishing certificate excluding the required exceptional zeros for conductors<400000; bounded-height Landau-Page; the log-free zero-density estimate producing exponent61; and a truncated primitive nonprincipal half-interval explicit formula with parity, trivial zeros, endpoint and horizontal errors plus local zero counts. Constants remain effective and uniform.

Consumed by EP.3 — harmonic smooth-conductor criterion, EP.5 — exceptional-modulus bounds, EP.5 — nonexceptional half-interval character estimate.

### AnalyticNumberTheory:AN.5

Explicit totient-ratio bound for the Kraus mu application, with its numerical validity range. The existing eventual-divisor-subpower bound is reused directly. The source Stirling upper bound is a local adapter to pinned Mathlib results, not an open generic request.

Consumed by EP.1 — kraus threshold for progression levels.

### ExponentialSumsAndCircleMethod:ES.0

Full Bennett–Siksek Proposition8.2 cancellation: for fixed c2>0, distinct native primitive quadratic characters with conductors N_i<k^c2 and P(N_i)<=k^(7/16), the half-interval correlation is<=k^(1-c3(c2)) for effective sufficiently large k and c3>0. Reuse the existing product/exclusion, bounded CRT-character blocks, finite differencing and divisor-threshold interfaces. They do not yet supply the full external Graham–Ringrose correlation bound or final assembly; preserve ambient moduli and possible principal components.

Consumed by EP.3 — many smooth characters criterion.

### AdditiveCombinatorics:AC.2

Quantitative three-term Roth theorem: density delta in(0,1), subset J of range(k) with |J|>=delta*k and k>=exp(exp(132*log2/delta)) gives a strict three-term progression in J. The quantitative proof must establish the displayed cutoff; the qualitative Mathlib Roth theorem alone supplies no such value. Its qualitative conclusion is reused rather than reconstructed.

Consumed by EP.4 — simultaneous thin-conductor witness.

### HeightsRationalPointsAndObstructions:RP.4

Faltings finiteness of rational points for each fixed smooth projective geometrically connected curve of genus>=2 over Q; no effective height or enumeration bound. Apply to the finite diagonal-curve coefficient family with a proved primitive-lift adapter.

Consumed by EP.6 — fixed-exponent progression finiteness.

### AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula

Riemann–Hurwitz with exact degree, tame different and constant-field hypotheses for the characteristic-zero diagonal cover in Darmon–Granville Corollary 2.1. The source-specific degree ell^(k-3) and branch calculation are local adapter proof obligations, not a second generic theorem.

Consumed by EP.6 — fixed-exponent progression finiteness.

### SchemeAndStackFoundations:SF.3

Native bridge between the source diagonal smooth projective curve, its function field, geometrically connected genus, and the same rational-point carrier consumed by Faltings; no use of finiteness without smoothness or the genus identification.

Consumed by EP.6 — fixed-exponent progression finiteness.

### ClassicalArithmeticCompletion:CA.4

Import the historical Erdős–Selfridge theorem that a positive product of at least two consecutive integers is not a perfect power of exponent>=2. This is background in the statement register only, never an assumed proof of the progression conjecture.

Consumed by EP.7 — erdős nonexistence assertion.

### EllipticLegendreCharacterInterfaces:LG.0–LG.5

Use LG.0 for native Legendre and scaled-Legendre models, full rational two-torsion normalization and the six labelled root-ordering parameters. Use LG.1 for p-adic units of both λ and 1−λ at good odd primes and odd squareclass-character conductor support. LG.2 supplies the split-cubic reading of the existing native descent map and the halving criterion; LG.3 supplies the two-by-four subgroup for a square parameter and the exact two-primary count of the minus-one model at primes 5 modulo 8. LG.4 supplies the point (2λ+4itv,8itv(t+iv)) on the twist by 2 and its doubling and descent coordinates. LG.5 supplies the symmetric-cubic trace-zero calculation and equation-specific twist Euler-factor comparison. EP.2 specializes these contracts to F_a; it does not rebuild them. A set of parameter values is used only for the existential case partition, while the supplier retains all six labelled orderings even when values coincide.

## Quantitative and geometric integration requirements

The generic character PNT used in EP.3 must retain its effective error and
exceptional-zero alternative. The error for a nonexceptional smooth conductor has
exponent \(\min(c_1,1/2)\). Conductors of exceptional characters grow by the
repulsion law \(N_j>N_1^{2^{j-1}}\). An explicit small-conductor zero-exclusion
certificate supplies the remaining finite range. This certificate is
unconditional finite verification of its specified region, not an assumption of
GRH. The prime estimates and zero-density results in the supplier contracts
carry constants and valid ranges; an asymptotic theorem with an unspecified
ineffective constant cannot discharge these requirements.

The short-character estimate separates an ambient product modulus from the
conductor of the induced primitive product character. The Gram inequality is
applied to squared absolute sums. With the hypotheses of the many-character
criterion, its main coefficient is \(1/68\), while the character-family lower
coefficient is \(0.1239^2\). The strict inequality between them must survive
all quantified error terms. Eventual divisor-subpower bounds are applied only
after fixing their positive exponent.

For the original route use the certified range
\(k\ge\exp(\exp(10^7))\). The required Roth substitution is
\(132\log 2\cdot10^5<10^7\); it does not give a cutoff \(10^6\).
The smoothness condition in the harmonic criterion is strict. The maximal-family
branch supplies a closed bound with exponent \(1-10^{-4}\), so apply the
criterion with \(c_1=1/20000\). These constants and the strictness of every
endpoint are part of the specification.

In the Granville route, keep both the real-part condition and bounded height in
the exceptional-zero predicate. Subtract explicit formulas at \(k\) and
\(k/2\) at the same height \(T\). A zero near zero is controlled by the
integral form of \((k^\rho-(k/2)^\rho)/\rho\); bounding a bare sum of
\(1/|\rho|\) would lose uniformity. The principal pole at 1 is not a zero.
The divisibility-index count includes a rounding term \(+1\), even when a
divisor exceeds the length. This term is summed before being shown negligible.
The simultaneous witness is selected from the surviving disjoint blocks, not
by choosing unrelated triples for its smallness and its avoidance property.

The signed fixed-exponent application in EP.6 includes the complete geometric
adapter. For each of the finitely many nonzero signed coefficient patterns,
prove smoothness and geometric connectedness of the diagonal complete
intersection, construct its projection with the stated degree, compute genus
by Hurwitz, and compare that genus to the scheme-theoretic invariant entering
Faltings. The sign of a coefficient does not change the Jacobian-rank argument
over an algebraic closure in characteristic zero. Primitive integral
representatives of a rational projective point are unique up to sign; translating
back through the fixed coefficient pattern gives finitely many primitive
\((n,d,y)\). The source's positive-domain corollary by itself does not supply
this signed adapter.

For indexing \(t_i=a+id\), \(1\le i\le k\), elimination uses
\[
 \lambda_j z_j^\ell=(j-1)\lambda_2z_2^\ell
                        -(j-2)\lambda_1z_1^\ell\qquad(3\le j\le k).
\]
This gives the correct index \(j\) in [DG95], equation (2.2). With zero-based
progression indices the same identity is transported after replacing \(a\)
by \(n-d\). Its distinct branch values, the covering degree
\(\ell^{k-3}\), and
\(2g-2=k\ell^{k-1}(1-2/k-1/\ell)>0\) are the genus requirements.

Finally, prove effectivity alongside the prime-exponent theorem. Record an
algorithm or an explicit finite bound for every prime-counting, PNT,
zero-density, correlation and Roth cutoff used by each route. Take the maximum
of the finitely many thresholds which its proof needs. No ineffective Siegel
constant or rational-point height bound can enter the prime-exponent threshold.
The existential Lean statement of \(k_0\) expresses its logical conclusion;
computability is an additional mathematical obligation in the theorem above.

## Implementation and signature conventions

Every definition has its API and at least three discriminating tests above. Test signs, nontriviality, the strict small-prime boundary, repeated middle indices, dyadic conductor factors, half-interval endpoints and simultaneous choices before using the construction in a later layer. The numerical endpoints require the constants in the quantitative integration requirements, and the geometric endpoints require actual elliptic curves and native residual representations.

The accompanying suggested file gives the portion expressible with existing native signatures. It explicitly identifies the ten geometric target signatures, the generic-Frey compatibility API and the local/conductor clauses which require their suppliers’ types and names. Those mathematical targets remain specified above. No condition is represented by an arbitrary proposition field or a predicate with an admitted proposition body. Supplying the native signatures does not change the target mathematics.

## References

- **[BS20]** Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums*, Annals of Mathematics 191 (2020), no. 2, 355–392, DOI [10.4007/annals.2020.191.2.2](https://doi.org/10.4007/annals.2020.191.2.2). [Publisher text](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf). Section 12 contains Andrew Granville’s addendum, pp. 386–388. All page references above are printed pages in this published version.
- **[DG95]** Henri Darmon and Andrew Granville, *On the equations z^m = F(x,y) and Ax^p + By^q = Cz^r*, Bulletin of the London Mathematical Society 27 (1995), 513–543. [Author-hosted scan](https://www.math.mcgill.ca/darmon/pub/Articles/Research/12.Granville/pub12.pdf). The fixed-exponent application uses Corollary 2.1 and its proof, pp. 520–521, including the index normalization stated above.

The generic inputs of the supplier-contract table are developed in their owners’ references. They are used only with the exact hypotheses and numerical ranges specified here.
