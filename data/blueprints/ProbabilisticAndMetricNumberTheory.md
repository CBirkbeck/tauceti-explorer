# Probabilistic, metric and ergodic number theory

## Scope and mathematical boundary

This roadmap concerns distributions over finite sets of integers, uniform distribution,
metric approximation and almost-everywhere dynamical statements. The probability space,
normalization and quantifiers belong to each theorem. A heuristic model is not an arithmetic
joint law, a dense orbit is not an equidistributed orbit, and mean convergence is not a
pointwise ergodic theorem.

The companion packet is **complete as a planning pass**, with 258 unchecked nodes. All six stages are planned; none is closed. Its exact gaps and supplier requests are listed in the final coverage ledger. The finite arithmetic, Weyl/torus and Koukoulopoulos–Maynard contracts below are retained, while the continuation adds the missing additive, distributional, discrepancy, Hausdorff, Gauss and multiplicative-function targets. No theorem is claimed implemented.

Suggested home: `TauCeti/NumberTheory/ArithmeticProbability/FiniteDivisibility.lean`.
The PM.1 comparison lemmas can follow in `FiniteGaussianMoments.lean`, and the
cutoff-removal interface in `PrimeTruncation.lean`. The full residue laws belong in
`ResidueLaws.lean` and reuse the implemented interval counts and CRT equivalence.
The repeated-factor comparison uses `RepeatedPrimeFactors.lean`; its fixed higher moments
and exponential bounds use `ExcessMoments.lean`.
Suggested namespace: `TauCeti.Probability.Arithmetic`.

## Existing library, not duplicate carriers

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The packet lists 173 baseline declarations. New statements were read at these commits; earlier receipts remain attributed to their historical passes. Generic finite coprime-product and subset-expansion
identities are reused, not scheduled as arithmetic-probability nodes.

Mathlib already supplies `ArithmeticFunction`, with value zero at zero; `cardDistinctFactors`
and `cardFactors`, which must not be confused; uniform measures; and the exact
`Nat.card_multiples` count. The audited generic moment, characteristic-function and weak
convergence infrastructure is not re-created here. No new generic probability carrier is
introduced.

An important additional supplier is Tau Ceti's
[`Probability/Process/EmpiricalMeasure.lean`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/Process/EmpiricalMeasure.lean).
Its `empiricalMeasure`, `empiricalMeasure_apply_toReal`, `integral_empiricalMeasure` and
finite-index uniform-pushforward comparison already implement the generic empirical-law
construction and finite-average dictionary. PM.0 specializes them to arithmetic observations.
The reviewed AUDIT-07 record did not cite this file in its PM.0 discussion; this is an extra
reuse finding, not an edit to the audit or a promotion of its whole-stage verdict.

The reviewed audit and its accepted review are
`research/blueprint/audit/AUDIT-07.result.json` and
`research/blueprint/reviews/REV-AUDIT-07.md`. All six PM entries in the integrated
`data/library-coverage.json` were also read for this continuation, together with the
matching atlas/link entries. Accepted RS-07 keeps arithmetic probability and independence
comparisons in PM.0 and imports the generic arithmetic-function/finite-sum baseline directly.
The existing upstream ArithmeticDirichletSeries and Exchangeability READMEs were also
consulted for carrier ownership and contract style, particularly their warnings against
parallel counting/measure wrappers.

## Conventions

Take a natural number m and put N=m+1. On the discrete natural numbers, let mu_N denote
Tau Ceti's existing `empiricalMeasure` for the sequence k |-> k+1 at index m. It is a
probability measure supported on the positive integers 1 through N. This is notation for
an existing specialization, not a new definition. The index and the denominator change
with m; zero is never sampled. There is no empty-sample probability theorem.

For any real function F on the naturals the existing integration theorem gives

    integral F dmu_N = (1/N) sum_{0 <= k < N} F(k+1).

Every such function is strongly measurable on the discrete natural carrier; the finite
Dirac decomposition also supplies integrability. Event probabilities use the real value
of the measure, obtained with `toReal`, and the existing measurable-set evaluation theorem.
Natural division in a floor count means integer division. All displayed normalized
probabilities, weights and error bounds are real quantities.

A finite prime set P has no repetitions. Double sums over P nevertheless include diagonal
pairs p=q. The divisor indicator I_d(n) is 1 when d divides n and 0 otherwise. All divisors
in probability-error statements are positive. Products of arithmetic functions in the
existing carrier mean Dirichlet convolution; the pointwise products of random variables
below are written explicitly and do not use that multiplication.

## Finite prime truncations and their API

For a finite set P of natural indices and real weights a, construct

    S(P,a)(0) = 0,
    S(P,a)(n) = sum_{p in P} a(p) I_p(n), for n > 0.

This gives an `ArithmeticFunction` without requiring primality. Primality is required
for its prime-power and coprime-product laws, and for the moment comparisons below.
The zero guard matters: the unguarded sum at zero would include every weight.

The seven separately declared API results are positive evaluation, empty truncation,
coefficient congruence on P, addition of weights, additivity on coprime positive products,
prime-power evaluation, and comparison with the existing omega function.

For coprime positive u,v and prime p, the two events p|u and p|v are disjoint, and
p|uv is their union. Their indicators therefore add; summing proves the coprime law.
For prime q and k>=1, a prime p divides q^k exactly when p=q. Thus
S(P,a)(q^k) is a(q) when q belongs to P, and zero otherwise. The exponent does not
multiply the weight. Finally, for P=n.primeFactors and unit weights, the sum at n
counts that finite set; it is `cardDistinctFactors n`, including the zero and unit cases.

The tests distinguish the construction from plausible wrong ones. With P={2,3} and a(p)=p,
S(12)=5 and S(0)=0. Every prime truncation has S(1)=0. Unit weights on 12.primeFactors
give 2, whereas the multiplicity-counting Omega gives 3. With P={2} and a(2)=2,
S(4)=2 differs from S(2)+S(2)=4, so complete additivity must not be asserted.

## Exact probabilities, before independence

Write P_N(d) for the real probability of d dividing the sampled integer. Specializing
`empiricalMeasure_apply_toReal` and the already implemented `Nat.card_multiples` gives

    P_N(d) = floor(N/d)/N.

This is a new arithmetic-probability consequence, not a request to reprove multiples
counting. Writing N=d floor(N/d)+r with 0<=r<d gives the exact signed error

    e_N(d) = P_N(d)-1/d = -r/(N d),
    -1/N < e_N(d) <= 0.

For positive d,e the joint event is lcm(d,e)|n, hence

    P_N(d|n and e|n) = floor(N/lcm(d,e))/N.

The least common multiple is essential: at N=12 the joint probability for 4 and 6 is
1/12, not zero. It becomes p*q for distinct primes but remains p when the two primes
are equal. At N=5, divisibility by 2 and 3 has respective probabilities 2/5 and 1/5,
yet joint probability zero. The product 2/25 is not the joint probability.

These pair statements provide an explicit comparison in place of an unproved independence
assumption. The finite Boolean joint law is established below with its precise period
hypothesis; a stronger growing-prime Kubilius approximation remains in the coverage ledger.

## First moments and the centering convention

For a finite prime set define the following local expressions:

    A = sum_{p in P} a(p)/p,
    L = sum_{p in P} |a(p)|,
    V = sum_{p in P} a(p)^2 (1/p - 1/p^2).

They are finite sums, not additional structure fields or assumptions of a limit theorem.
Interchanging the two finite sums in the empirical integral gives

    integral S(P,a) dmu_N = sum_{p in P} a(p) floor(N/p)/N.

Subtracting A leaves sum a(p)e_N(p), and therefore

    |integral S(P,a) dmu_N - A| <= L/N.

A is the reciprocal-prime/model centering, not in general the exact empirical mean.
For N=5, P={2,3}, a(p)=p, the observed values are 0,2,3,2,0. Their mean is 7/5,
whereas A=2. Signed weights are allowed in both the identity and its error estimate.

## Second moments: diagonal, off-diagonal, and the error

For positive p,q, expanding four terms in the finite average gives

    integral (I_p-1/p)(I_q-1/q) dmu_N
      = P_N(lcm(p,q)) - P_N(p)/q - P_N(q)/p + 1/(p q).

For primes, the reciprocal-density part is D(p,q), where D(p,p)=1/p-1/p^2 and
D(p,q)=0 for distinct p,q. The remainder is exactly

    e_N(lcm(p,q)) - e_N(p)/q - e_N(q)/p.

Its absolute value is at most (1+1/p+1/q)/N, hence at most 2/N, since p,q>=2.
This also covers the diagonal. For p=q=2 the centered square is identically 1/4,
so its actual error is zero, as the tests verify.

On the positive sample, S(P,a)-A is sum a(p)(I_p-1/p). Expand its square over
all ordered pairs. Subtracting the double sum of a(p)a(q)D(p,q) subtracts exactly V:
off-diagonal terms vanish, and diagonal terms have coefficient a(p)^2. Finite-sum
linearity and the triangle inequality then yield

    |integral (S(P,a)-A)^2 dmu_N - V| <= 2 L^2/N.

This is the central comparison theorem of the packet. It requires neither independence
nor any central limit theorem. It is a centered second moment about A; it is not silently
identified with variance about the empirical mean. Its error is useful only in regimes
where L^2/N is controlled. In particular it does not replace the Turan–Kubilius inequality,
large-prime removal, Mertens asymptotics or a valid convergence-in-law argument.

If Q=product_{p in P} p divides N, every p and every pairwise lcm divides N, so all
remainder terms vanish. The second-moment formula is then exact, and the first-moment
identity also gives the exact mean A. Only in that complete-period case is this centered
moment automatically the empirical variance. At N=6, P={2,3}, a(p)=p, A=2 and V=3.
At N=5 the centered second moment is 9/5, not 3. For P empty, Q=1 and all expressions
are zero for every positive N.

## Finite Boolean divisibility patterns

Five additional declarations extend the pair calculation to every finite zero/one
divisibility pattern. All of them use the same positive sample and existing empirical
measure; the following symbols are local mathematical notation, not new definitions.

For a finite prime set R, write Q_R for its product, with Q_empty=1. For disjoint
finite prime sets S,T, write E(S,T) for the event that every prime in S divides the
sample and no prime in T divides it. Define the local model expression

    b(S,T) = (product_{p in S} 1/p) (product_{q in T} (1-1/q)).

This is the mass of the corresponding Boolean pattern in the independent
Bernoulli model. It is not assumed to be the actual arithmetic probability.

### Simultaneous prime divisibility

The declaration `simultaneous_divisibility_probability` states

    mu_N({n: every p in P divides n}) = floor(N/Q_P)/N.

Distinct primes are coprime. The pinned `Nat.coprime_primes`,
`Finset.lcm_eq_prod` and `Finset.lcm_dvd_iff` identify the all-divisibility
event with Q_P dividing n. Positivity of every factor allows the existing
single-divisor probability lemma to finish the argument. The empty set gives
divisor 1, hence probability 1, not an empty event.

### The signed subset formula

The declaration `divisibility_pattern_formula` states the exact identity

    mu_N(E(S,T))
      = sum_{U subset T} (-1)^|U| floor(N/Q_{S union U})/N.

For each integer n its event indicator is

    (product_{p in S} I_p(n)) (product_{q in T} (1-I_q(n)).

Apply the pinned finite product expansion `Finset.prod_one_add` to the
second product, with factors -I_q(n). The term indexed by U is the sign
(-1)^|U| times the all-divisibility indicator for S union U. Average over
1,...,N, commute the two finite sums, and use simultaneous divisibility.
All subtraction takes place after the measurable-set evaluation has converted
probabilities to real finite sums; subtraction of extended nonnegative measures
is not being used. The divisors in the floors are natural products, and floor
division precedes the real cast.

### A quantitative comparison for one pattern

The declaration `divisibility_pattern_error` gives

    |mu_N(E(S,T))-b(S,T)| <= 2^|T|/N.

Indeed, disjointness gives Q_{S union U}=Q_S Q_U. Expanding the factors
1-1/q by the same pinned product identity yields

    b(S,T) = sum_{U subset T} (-1)^|U| / Q_{S union U}.

Subtract from the exact count. The difference is a signed sum of
e_N(Q_{S union U}); each term has absolute value at most 1/N. There are
2^|T| subsets, by `Finset.card_powerset`. No product-size restriction is
needed for the inequality, although an upper bound greater than 1 is weak.

### Complete-period Bernoulli law

The declaration `divisibility_pattern_completePeriod` assumes
Q_{S union T} divides N and concludes

    mu_N(E(S,T)) = b(S,T).

Every Q_{S union U} divides that complete product and hence N. Its remainder
vanishes in the exact divisor-error formula, so the signed-subset calculation
has no error. For each S contained in a finite prime set P, take T=P minus S.
These choices enumerate every Boolean atom, and the theorem gives the complete
finite Bernoulli-product atom law whenever Q_P divides N. This is stronger than
matching the first two moments. It is not a statement that the full residue
classes are independent on arbitrary truncated intervals.

### Summing all atom errors

The declaration `divisibility_pattern_summed_error` states

    sum_{S subset P} |mu_N(E(S,P minus S))-b(S,P minus S)|
      <= 3^|P|/N.

Apply the one-pattern bound to each S and its complement. Since
|P minus S|=|P|-|S|, the numerator is the sum of 2^(|P|-|S|).
The pinned `Finset.sum_pow_mul_eq_add_pow`, with a=1 and b=2, evaluates it
as 3^|P|. The arithmetic atoms partition the sample, and the nonnegative model
masses sum to product_{p in P}(1/p+(1-1/p))=1. The exported contract is the
explicit finite sum, not a competing total-variation definition.

The bound controls varying prime sets only in ranges where 3^|P|/N is small.
It does not provide the general growing-prime range required by a Kubilius
comparison, nor the large-prime tail needed for an arithmetic limit theorem.

### Acceptance and rejection tests

At N=6 and P={2,3}, the masses for no prime, only 2, only 3, and both
are 1/3, 1/3, 1/6, 1/6. At N=5 they are 2/5, 2/5, 1/5, 0.
Their absolute differences sum to 1/3. In particular, complete-period equality
cannot be used at N=5.

With S=T={2}, the event is empty while the displayed product expression is
1/4: disjointness is essential to the Bernoulli atom interpretation.
With the nonprime family {2,4} and N=4, the joint probability is 1/4;
replacing its lcm by the product 8 would incorrectly give zero. Empty
constraints always give mass 1. At N=1 the prime 2 is absent with probability
1, confirming that zero is not in the sample.

The suggested file includes ten additional theorem-level example contracts
for these cases. The construction's seven API items and five original tests
are retained unchanged; no new construction requires a second API.

## Centered prime products and higher moments

The finite moment comparison uses the same sample and arithmetic function as above.
For each p in a finite prime set P, write u_p=1/p and f_p(n)=I_p(n)-u_p.
Given natural exponents alpha_p, including zero, abbreviate

    v_p = (-u_p)^alpha_p,
    w_p = (1-u_p)^alpha_p - v_p,
    nu_p(e) = u_p(1-u_p)^e + (1-u_p)(-u_p)^e.

These expressions do not introduce new library carriers. The factor nu_p(e) is the
centered e-th moment of Mathlib's existing Bernoulli measure, by
[ProbabilityTheory.integral_bernoulliMeasure](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Probability/Distributions/Bernoulli.lean).
Its parameter belongs to the unit interval because p is prime. Generic independent
product integration is likewise supplied by
[ProbabilityTheory.iIndepFun.integral_fun_prod_comp](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Probability/Independence/Integration.lean).
Only the arithmetic finite-sample comparisons below are new targets.

### Exact subset expansion

The declaration centered_prime_product_expansion states

    integral product_{p in P} f_p(n)^alpha_p dmu_N
      = sum_{D subset P} (product_{p in D} w_p)
          (product_{p in P minus D} v_p) floor(N/Q_D)/N.

Splitting the two values of an indicator gives f_p^alpha_p=v_p+w_p I_p.
The pinned finite product-of-sums expansion then groups by the subset D whose
indicator terms were chosen. Its product of indicators is the all-divisibility
event for D. Average the identity with the existing empirical integration
formula, interchange finite sums, and use simultaneous prime divisibility.

The natural quotient in floor(N/Q_D) is formed before its real cast. Empty
products equal one; D empty contributes its coefficient without any floor error.
In particular this formula applies when P is empty or all exponents vanish.

### A sharp coefficient-dependent remainder

The declaration centered_prime_product_error compares that integral to

    G(P,alpha) = product_{p in P}(v_p+w_p/p)
               = product_{p in P} nu_p(alpha_p).

Its absolute error is at most

    [product_{p in P} (|v_p|+|w_p|) - product_{p in P}|v_p|] / N.

Expand G by the same subset identity. Subtracting leaves the D coefficient
times e_N(Q_D), the inherited signed divisor remainder. The empty-subset
remainder is zero. Apply the triangle inequality to the remaining subsets,
bound every divisor error by 1/N, and expand the product of absolute
coefficients. This explains both the nonnegative numerator and its subtraction.
Dropping the empty term is useful: for p=2 and exponent 2, v_p=1/4 and w_p=0,
so this bound is exactly zero even on an incomplete period.

### A uniform bound and complete periods

The declaration centered_prime_product_uniform_error gives the simpler bound

    |integral product f_p^alpha_p dmu_N - product nu_p(alpha_p)|
      <= (3/2)^|P| / N.

For exponent zero the absolute-coefficient sum is one. For positive exponent,
0<u_p<=1/2 and the pinned power bound on [0,1] give

    |v_p| <= u_p,
    |w_p| <= (1-u_p)^alpha_p + u_p^alpha_p <= 1.

Hence |v_p|+|w_p|<=3/2. Multiply over P and discard the nonnegative
subtracted product in the sharper estimate. This argument imposes no upper
bound on Q_P and no positive-exponent convention.

The declaration centered_prime_product_completePeriod assumes Q_P divides N
and concludes exact equality with product nu_p(alpha_p). Every subset product
Q_D then divides N, so every divisor remainder vanishes. The finite subset
expansion factors back into G. This is the mixed-moment consequence of the
complete-period Boolean law; it does not recreate a generic independence theorem.

The identity nu_p(1)=0 is ordinary real algebra. Thus a product moment vanishes
if any prime appears exactly once. This is the square-full-support cancellation
in the moment method, not its converse: p=2 with an odd exponent also has zero
centered moment. For p=3, in contrast, nu_p(3)=2/27 is nonzero.

### Weighted moments with repeated prime coordinates

The declaration primeDivisibilitySum_moment_error allows every natural k and
arbitrary real weights a, including negative weights. Put

    A = sum_{p in P} a(p)/p,        L = sum_{p in P}|a(p)|.

For an ordered tuple t from {0,...,k-1} to P, let T_t be its image and
alpha_t(p) the cardinality of its fiber over p. Define the local expressions

    G(t) = product_{p in T_t} nu_p(alpha_t(p)),
    M_k  = sum_t (product_{j<k} a(t(j))) G(t).

The target inequality is

    |integral (S(P,a)(n)-A)^k dmu_N - M_k|
      <= (3/2)^k L^k / N.

At positive sampled n, the centered sum is sum a(p)f_p(n). The existing
Finset.sum_pow' expands its k-th power into ordered tuples. Group the product
for a tuple by fibers, using Finset.prod_fiberwise_of_maps_to', and apply the
uniform mixed-product estimate to T_t. Its size is at most k, by
Finset.card_image_le, so its error constant is at most (3/2)^k. After multiplying
by the absolute weight product and summing, the power-of-a-sum identity applied
to |a| gives precisely L^k.

For an independent Bernoulli(1/p) family, M_k is its weighted centered k-th
moment: first group repeated occurrences of each random variable into a power,
then use the existing independent-product integration theorem only across
distinct primes. Treating the tuple's positions as independent would instead
erase the diagonal and give an incorrect result already at k=2.

There is one empty tuple when k=0, even for empty P, and M_0=1. For empty P
and positive k there are no tuples and both moments are zero. At k=2, M_k is
the variance expression already used above. The inherited bound 2 L^2/N
is sharper than the general bound 9 L^2/(4N) and remains part of the API.

### Moment acceptance tests and the limit-law boundary

The suggested file includes ten new example contracts. Zero exponents and
empty products have average one. The square of the centered 2-divisibility
indicator has average 1/4 on every sample, with sharp error numerator zero.
For p=3 the complete-period cube has average 2/27. Distinct primes 2 and 3
give mixed average -1/15 at N=5 and zero at N=6. With P={3} and a(3)=-1,
the complete-period weighted cube is -2/27; changing signed weights to absolute
weights inside M_k fails this test. Empty-P moments distinguish k=0 from k>0.

These are finite estimates around the model mean A, which need not be the
empirical mean. On their own they neither give a Gaussian approximation to M_k
nor control the discarded large primes. The next sections add finite unweighted
pairing and parity estimates and deterministic cutoff removal. Uniform growing-moment
ranges, Mertens normalization, asymptotic transfer and a valid moment-convergence argument
remain open. A generic
iid central limit theorem cannot be applied directly to the arithmetic indicators.

## Finite unweighted Gaussian moment comparison

The nine PM.1 declarations in this section take unit weights a(p)=1. The earlier
weighted results keep arbitrary real weights; the sign arguments here do not
silently extend to signed weights. For a finite prime set P write

    u_p = 1/p,
    nu_p(e) = u_p(1-u_p)^e + (1-u_p)(-u_p)^e,
    v_p = u_p(1-u_p),   V = sum_{p in P} v_p,   Q = sum_{p in P} v_p^2.

All these are local finite expressions, not new structures. The local-factor-bound
node states 0<=nu_p(e)<=v_p for e>=2. To prove it, put e=j+2 and factor out v_p:
the remaining factor is (1-u_p)^(j+1)-(-u_p)^(j+1). Since a prime has
0<u_p<=1/2, power monotonicity gives a nonnegative factor; bounding the two
absolute powers by their bases gives an upper bound of one. Direct evaluation
also gives nu_p(0)=1, nu_p(1)=0 and nu_p(2)=v_p.

The model-multinomial-expansion node rewrites the inherited unit-weight model as

    M_k = sum_{alpha in piAntidiag(P,k)}
            multinomial(P,alpha) product_{p in P} nu_p(alpha(p)).

The existing piAntidiag consists of functions taking natural values, zero outside
P, with sum k. The existing multinomial coefficient is k!/product alpha(p)!.
Neither carrier nor the general multinomial theorem is re-planned. One proof
compares the ordered-tuple expansion and Mathlib's multinomial expansion after
averaging over the auxiliary complete period product P. The PM.0 exact mixed
moments evaluate both expressions. This identifies finite model sums; it does
not assert independence at an arbitrary sample length N.

### Paired supports and collisions

For r>=0 set

    H_r = sum_{S subset P, |S|=r} product_{p in S} v_p,
    D_r = sum_{injective t:{0,...,r-1}->P} product_{j<r} v_(t(j)),
    C_(2r) = (2r)! / (2^r r!).

The paired-support-formula node restricts the multiplicity expansion of M_(2r)
to alpha(p) in {0,2}. Such an assignment corresponds uniquely to an r-subset S.
Its multinomial coefficient is (2r)!/2^r and its local product is product v_p.
Thus this paired part is ((2r)!/2^r) H_r.

The distinct-prime-tuples node gives D_r=r! H_r. Group injective tuples by image:
each fiber is the set of bijections from Fin r to that r-element subset. The
pinned Fintype.card_equiv already counts those bijections as r!. Therefore the
paired contribution is C_(2r) D_r, not yet C_(2r) V^r.

For r>=2 the prime-collision-bound node supplies

    0 <= V^r-D_r <= binom(r,2) Q V^(r-2).

Expand V^r over all ordered tuples. Every excluded tuple has two equal positions.
A finite union bound over the binom(r,2) position pairs bounds its nonnegative
weight, possibly more than once. For each pair the common prime contributes
sum v_p^2=Q and the other positions contribute V^(r-2). Existing powersetCard
cardinality supplies the pair count. No division by V occurs, so empty P is
allowed; at r=2 the difference is exactly Q.

### Smaller supports and the corrected count

The fixed-support-bound node handles a nonempty support S of size s and k>=2s.
Among multiplicity assignments on S with total k and every exponent at least two,
the exact number is binom(k-s-1,s-1). Subtract two in each coordinate and apply
the existing finsuppAntidiag cardinality formula to total k-2s. This is the
already-recorded correction E2 to the author copy, not a new source finding.

Each assignment has product of factorials at least 2^s, and each local factor
lies between zero and v_p. Its entire fixed-support contribution B therefore satisfies

    0 <= B <= k! binom(k-s-1,s-1) (product_{p in S} v_p) / 2^s.

The smaller-support-bound node sums over supports of size at most floor((k-1)/2).
Since k>0 the support is nonempty. Terms with multiplicity one vanish. Summing
the preceding bound over s-subsets gives a factor H_s, and s! H_s=D_s<=V^s.
Consequently, with

    R_k = k! sum_{s=1}^{floor((k-1)/2)}
               binom(k-s-1,s-1) V^s / (2^s s!),

the smaller-support contribution B_k satisfies 0<=B_k<=R_k. For k=1 or 2 this
sum is empty. When k is odd every nonzero model term is a smaller-support term.
When k=2r, a nonzero term with r distinct primes must be paired; all other
nonzero terms are precisely the smaller-support part.

### Arithmetic comparison and the existing Gaussian target

The pinned Tau Ceti
[Gaussian moment file](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/Distributions/Gaussian/Moments.lean)
already evaluates the even central moment of a Gaussian with variance V as
V^r (2r-1)!! and its odd central moments as zero, including V=0. Existing
factorial/double-factorial identities identify the even value with C_(2r)V^r.
V is the variance parameter, not the standard deviation; no new Gaussian theorem
is scheduled here.

Put A=sum 1/p, epsilon_k=(3/2)^k |P|^k/N, and let G be the existing real Gaussian
measure of mean zero and variance V. Combining the three errors gives the
finite-even-gaussian-bound node, for r>=2:

    |integral (S(P,1)-A)^(2r) dmu_N - centralMoment(id,2r,G)|
      <= epsilon_(2r) + C_(2r) binom(r,2) Q V^(r-2) + R_(2r).

The errors are, respectively, arithmetic versus independent model, collisions
inside the paired term, and smaller supports. The absolute value is essential:
the model moment can lie below the Gaussian moment. The inherited exact zero-th
moment and sharper second-moment comparison remain in force.

For r>=0 the finite-odd-moment-bound node gives

    |integral (S(P,1)-A)^(2r+1) dmu_N| <= epsilon_(2r+1)+R_(2r+1).

The unit-weight model odd moment is nonnegative and bounded by R, but it is not
generally zero. The arithmetic odd moment can even be negative. The left side
is centered at the model mean A, not necessarily at the empirical mean.

The eight new example contracts discriminate these distinctions. At P={2,3},
V=17/36, the paired fourth contribution is 1/3; the single-prime fourth
contributions add 59/432, giving M_4=203/432. The Gaussian value is 289/432,
so M_4 minus the Gaussian value is -43/216. At P={3},N=1 the arithmetic cube
is -1/27, while at the complete period N=3 it is 2/27. At prime 2 every odd
local factor vanishes, but at prime 3 the fourth factor is 2/27. Empty supports
at order zero give one, whereas an injective two-tuple on a one-prime set does
not exist.

These finite, explicit inequalities do not assert the source's growing-order
asymptotic range or prove convergence in distribution. General sieve-multiset
interfaces are still outside this slice and must be routed to their owners first.

## Deterministic prime cutoff removal

The cutoff-removal interface uses the existing inclusive set
P_z = Nat.primesLE(floor_nat(z)). For nonnegative real z, the pinned
membership and floor theorems say that a prime p lies in P_z exactly when
p<=z. No second prime-set carrier is introduced. Write

    T_z(n) = {p in n.primeFactors : z<p},
    A_z = sum_{p in P_z} 1/p,
    Y_z(n) = S(P_z,1)(n)-A_z.

These are local expressions in existing finite sets and arithmetic functions.
A prime equal to the cutoff belongs to the head. A prime power is counted once,
as required by omega; this is not the multiplicity-counting Omega branch.

### Exact decomposition and logarithmic tail

The omega-cutoff-identity node states, for n>0 and z>=0,

    omega(n) = S(P_z,1)(n) + |T_z(n)|.

Positive evaluation identifies the head with the cardinality of the prime
divisors at most z. The inherited omega comparison identifies the full
cardinality. Partitioning the same finite set at the cutoff proves the identity.
The finite sample remains 1,...,N; the factor-set convention at zero is not used
to justify a logarithmic statement there.

The large-prime-log-bound node states, for n>0 and z>1,

    |T_z(n)| <= log(n)/log(z).

Every member of T_z(n) is a distinct prime divisor of n. Mathlib's existing
finite-product divisibility theorem shows that their product divides n, and
hence is at most n. Sum log(z)<=log(p) over the tail, use the existing logarithm
of a finite product, and apply monotonicity to obtain

    |T_z(n)| log(z) <= log(product T_z(n)) <= log(n).

Division is valid because log(z)>0. Empty tails need no special exception:
their product is one. In particular n=1 gives zero on both sides, and z>n
is allowed. The theorem is not asserted at z=1 or n=0.

For n=60, cutoff 3 retains 2 and 3 and discards only 5; cutoff 5 retains all
three. At n=8, cutoff 3/2 retains none but discards just one distinct prime.
These tests detect both an exclusive-cutoff error and confusion with Omega.

### Centering and pointwise powers

For N=m+1, z>1 and an arbitrary real target center b put

    D = log(N)/log(z) + |A_z-b|.

The centered-cutoff-error node gives, uniformly for 1<=n<=N,

    |(omega(n)-b)-Y_z(n)| <= D.

Indeed the difference is exactly |T_z(n)|+(A_z-b). Apply the triangle
inequality, the logarithmic tail estimate and n<=N. The two errors have
different origins. The first controls the discarded factors. The second is a
change of center, and it does not disappear merely because all sampled prime
factors lie below the cutoff. At N=n=1,z=2,b=0, the tail is zero but the
centered discrepancy is 1/2. No estimate for A_z-log log(N) is assumed here.

The cutoff-power-error node exposes the next algebraic step. For every
natural k, including zero,

    |(omega(n)-b)^k-Y_z(n)^k|
      <= sum_{0<=j<k} binom(k,j) D^(k-j) |Y_z(n)|^j.

Set d=(omega(n)-b)-Y_z(n), expand (Y_z(n)+d)^k by the existing binomial
theorem, remove its j=k term, and apply the finite triangle inequality.
Each remaining |d|^(k-j) is at most D^(k-j). At k=0 the remainder is empty;
at k=1 the bound is D; at k=2 it is D^2+2D|Y_z(n)|. Absolute values on
the lower powers are essential. For n=1,N=2,z=3,b=A_z, one has Y_z(n)=-5/6
and 0<D=log(2)/log(3)<1. Replacing |Y_z(n)| by Y_z(n) would make the
quadratic upper bound negative.

### Absolute moments and adjacent even moments

The absolute-odd-moment node takes any finite P, real weights a and center b.
For Z(n)=S(P,a)(n)-b and E_j=integral Z^j dmu_N it gives

    integral |Z|^(2r+1) dmu_N <= sqrt(E_(2r) E_(2r+2)),  r>=0.

No primality or independence is needed for this arithmetic specialization.
The existing empirical integration theorem turns each integral into a finite
average. Apply the existing squared finite Cauchy–Schwarz inequality to
|Z|^r and |Z|^(r+1), divide by N^2 and take nonnegative square roots.
Their squared powers are the adjacent even moments. At r=0, E_0=1.

This does not bound an absolute odd moment by its signed counterpart.
For the complete period N=3 with P={3}, unit weights and b=1/3, the signed
first moment is zero but the absolute first moment is 4/9. For P={2} and
b=1/2, all absolute observations equal 1/2, and Cauchy–Schwarz is sharp
for every sample size and r. Generic Cauchy–Schwarz remains a library
supplier, not a new roadmap theorem.

### Finite transfer to omega moments

Use E_j=integral Y_z^j dmu_N and abbreviate U_j by E_j when j is even and
by sqrt(E_(j-1) E_(j+1)) when j is odd. The cutoff-moment-transfer theorem is

    |integral (omega-b)^k dmu_N - E_k|
      <= sum_{0<=j<k} binom(k,j) D^(k-j) U_j.

Average the pointwise power bound, interchange the finite sums and bound each
absolute lower moment. Even orders are already signed even moments; odd orders
use the adjacent-even result. The coefficients are nonnegative. At order zero
both moments are one; at orders one and two the bounds reduce to D and
D^2+2D sqrt(E_2), respectively.

The even inputs can be bounded using the inherited second-moment comparison
and finite even Gaussian estimate. This theorem does not assert those bounds
are small in a chosen asymptotic regime. The read source uses the special
cutoff z=x^(1/k), Mertens normalization and further uniform estimates.
Their exact growing-order ranges and a valid passage from moments to
distribution remain separate obligations. In particular, uniqueness of the
Gaussian from its moments alone is not a moment-convergence theorem.

## Sources and what was actually read

The elementary comparison is guided by
[Terence Tao, 254A Supplement 4, Section 3](https://terrytao.wordpress.com/2015/01/04/254a-supplement-4-probabilistic-models-and-heuristics-for-the-primes-optional/):
the first six paragraphs explain finite sampling, residue equidistribution, product-modulus
restrictions and weak comparison of statistics. The explicit signed remainder and
2 L^2/N inequality and finite-pattern formulas above are auxiliary calculations supplied
in this packet. They are
not attributed to a numbered theorem in that source and not called the Kubilius fundamental
lemma. No conclusion from the subsequent rough-number discussion is imported.

The source ledger records exact pinned files and read ranges for counting, arithmetic
functions, prime/lcm arithmetic, uniform measures and empirical measures. The selected
Kubilius monograph, the Kuipers/Niederreiter proofs, the metric approximation proofs,
and the Gauss-map/correlation sources have not been read for this checkpoint. Their
unread proof obligations remain explicit. The findings described below concern only
the versions and passages actually inspected.

The centered-product route follows
[Granville–Soundararajan, Sieving and the Erdos–Kac theorem, author copy](https://dms.umontreal.ca/~andrew/PDF/ErdosKac.pdf),
especially the proof of Proposition 2 on internal pages 4–5 and the weighted
expansion in the proof of Proposition 4 on pages 10–11. The complete author copy,
including all proofs and bibliography, was read. The five finite declarations
in PM.0 and the nine finite PM.1 declarations are explicit auxiliary refinements,
not claims that the source states these constants. Reading the full paper does not
mean its entire argument is
decomposed: the general sieve multiset framework, uniform growing-order estimates
and asymptotic passage remain explicit work. The focal proof on pages 4–6 was
reread in the preceding continuation, with page 5 visually rechecked. The cutoff
continuation reread pages 3–6, especially the full deduction on page 4, whose image
was checked. Its six new declarations refine that finite deduction; they do not
claim its remaining asymptotic estimates have been supplied.

The source ledger distinguishes that author typeset copy, with a 2006 footer,
from [arXiv math/0606039v1](https://arxiv.org/abs/math/0606039) and the
[published 2007 chapter](https://link.springer.com/chapter/10.1007/978-1-4020-5404-4_2).
The arXiv finding passages were spot-checked. The publisher served only its
[two-page preview, published pages 15–16](https://page-one.springer.com/pdf/preview/10.1007/978-1-4020-5404-4_2);
the full chapter endpoint returned subscription HTML, not a readable PDF.
Acquired-file hashes, dates and reading scopes are recorded in the packet.

Three source findings are recorded for independent verification:

- E1: inequality (1) should require k>=1, not k>=0, since its denominator is
  (k-1)!. The k=0 contribution is the single integer 1 and must be separated.
  This slip was checked in the published preview on page 15.
- E2: the author copy's pages 5 and 11 count ordered parts alpha_i>=2 summing
  to k as binom(k-s,s). For 1<=s and 2s<=k the count is
  binom(k-s-1,s-1); at k=5,s=2 it is two, not three. The printed binomial
  remains an upper bound, so the following estimates survive this correction.
- E3: the author copy's polynomial-value example on page 9 gives the mean's
  logarithmic asymptotic also for sigma_P. It should be for sigma_P squared.
  Already the polynomial f(t)=t has variance mu_P minus sum 1/p^2, and
  standard deviation of square-root rather than logarithmic size.

E2 and E3 are also present in the checked preprint passages, but the relevant
published pages were not accessible; they are not accusations about unread
version-of-record text. Publisher pages, arXiv version history and Granville's
publication lists revealed no existing correction in this search. These are
unreviewed findings, not an independent correctness verdict or a reason to
alter the valid finite model formulas.

## Full residue laws and exact finite error

This continuation completes the finite all-residue branch of PM.0. It preserves
all 42 inherited declaration objects and their APIs and tests. The positive sample
and native empirical measure are unchanged. Moduli are positive, with modulus one
allowed. The tuple theorem uses any finite index type and pairwise coprime moduli,
including composite moduli and the empty family. It does not construct a second
residue, probability, independence or total-variation carrier.

For a single modulus d, write p(a) for the probability that the sampled integer
has residue a in ZMod d. Put N=m+1, R=N mod d, and rho(a)=(a-1).val. The shift
is taken inside ZMod d, before taking the natural value. It converts the sample
k+1, for 0<=k<N, to the existing zero-origin congruence count. In particular,
residue zero has rho(0)=d-1 when d>1, not zero. All divisions after finite natural
counts are real divisions.

The exact count has R heavy atoms and d-R light atoms. Their respective signed
errors from 1/d are (d-R)/(N*d) and -R/(N*d). This gives both a strict per-atom
bound and the exact sum of absolute errors. The event bound is half that sum;
for a statistic in [L,U], the range U-L multiplies the event bound. Keeping this
factor distinguishes an event indicator from a signed statistic in [-1,1].

For a finite family q, put Q=product q(i) and use Mathlib's existing ring
equivalence E from ZMod Q to the product of the ZMod(q(i)). The whole tuple
observation is E(cast(n)). Every tuple therefore corresponds to exactly one
residue modulo Q. Reindexing through E gives the full joint formulas without
assuming independence on a truncated period. On a complete period Q divides N,
the atom masses are the product of coordinate uniform masses; finite rectangle
sums then give independence. If N<Q, the exact summed error is 2*(1-N/Q), which
exhibits the small-support obstruction to a strong uniform approximation. For
all Q, the event error is at most Q/(4N). This elementary bound does not close
the source-specific Kubilius comparison for larger growing prime families.

The source is the first six paragraphs of Section 3 of
[Tao's probabilistic-model notes](https://terrytao.wordpress.com/2015/01/04/254a-supplement-4-probabilistic-models-and-heuristics-for-the-primes-optional/),
reread on 27 September 2026. Its counting and CRT argument motivates this branch.
The exact constants, shifted formulas, range-sensitive statistic bounds and
composite-modulus generalization are explicit worker refinements with the proofs
below. No subsequent prime-pattern heuristic is treated as a theorem.

### Exact residue probability

Stable declaration: `ProbabilisticAndMetricNumberTheory:PM.0/residue-probability`.

For every a in ZMod d, p(a)=[floor(N/d)+1_{rho(a)<R}]/N. Natural division is taken before the real cast. The shift rho(a)=(a-1).val is essential because the sample starts at 1.

Hypotheses: m is natural, N=m+1, and mu_N is the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. All probabilities and normalized expressions below are real. d is a positive natural modulus; a ranges over the existing ZMod d. Put R=N mod d and rho(a)=(a-1).val, so 0<=rho(a)<d. Put p(a)=mu_N({n : the cast of n in ZMod d equals a}). These are local expressions, not new definitions.

Proof outline:

1. For each sample index k<N, cast(k+1)=a is equivalent to cast(k)=a-1, hence to k congruent to rho(a) modulo d, by natCast_zmod_val and natCast_eq_natCast_iff.
2. Apply the existing empiricalMeasure_apply_toReal. Its finite indicator sum is the natural count of this congruence predicate, cast to the reals.
3. Use the existing Nat.count_modEq_card with b=N and v=rho(a); val_lt reduces rho(a) mod d to rho(a). No interval-counting or CRT theorem is being replanned.

Suppliers: `tauceti:TauCeti.Probability.empiricalMeasure_apply_toReal`, `mathlib:Nat.count_modEq_card`, `mathlib:Nat.count_eq_card_filter_range`, `mathlib:ZMod.natCast_zmod_val`, `mathlib:ZMod.natCast_eq_natCast_iff`, `mathlib:ZMod.val_lt`.

Acceptance: N=5,d=3: masses at residues 0,1,2 are 1/5,2/5,2/5. d=1 gives mass 1. For N<d the supported residues are 1,...,N, not 0,...,N-1.

### Residue atom error

Stable declaration: `ProbabilisticAndMetricNumberTheory:PM.0/residue-atom-error`.

For every a, |p(a)-1/d|<1/N. More precisely the proof computes the signed difference as [1_{rho(a)<R}-R/d]/N; its sign depends on the residue.

Hypotheses: m is natural, N=m+1, and mu_N is the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. All probabilities and normalized expressions below are real. d is a positive natural modulus; a ranges over the existing ZMod d. Put R=N mod d and rho(a)=(a-1).val, so 0<=rho(a)<d. Put p(a)=mu_N({n : the cast of n in ZMod d equals a}). These are local expressions, not new definitions.

Proof outline:

1. Cast N=d*floor(N/d)+R to the reals and substitute residue-probability.
2. If rho(a)<R, then R>0 and the error is (d-R)/(N*d), strictly between 0 and 1/N. Otherwise the error is -R/(N*d), between -1/N and 0, since 0<=R<d. At R=0 both are zero.

Suppliers: `ProbabilisticAndMetricNumberTheory:PM.0/residue-probability`.

Acceptance: At N=5,d=3, residue 1 has positive error 1/15 while residue 0 has negative error -2/15. For residue zero this specializes to the inherited signed divisibility error; it does not extend its nonpositive sign to all residues.

### Exact summed residue error

Stable declaration: `ProbabilisticAndMetricNumberTheory:PM.0/residue-summed-error`.

The finite sum over all a in ZMod d of |p(a)-1/d| equals 2*R*(d-R)/(N*d). Thus it vanishes on complete periods. If N<d it is exactly 2*(1-N/d).

Hypotheses: m is natural, N=m+1, and mu_N is the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. All probabilities and normalized expressions below are real. d is a positive natural modulus; a ranges over the existing ZMod d. Put R=N mod d and rho(a)=(a-1).val, so 0<=rho(a)<d. Put p(a)=mu_N({n : the cast of n in ZMod d equals a}). These are local expressions, not new definitions.

Proof outline:

1. The translation a mapped to a-1 is a permutation. Composing with the native equivalence between ZMod d and Fin d shows exactly R residues satisfy rho(a)<R, and d-R do not.
2. The signed differences computed in residue-atom-error have absolute values (d-R)/(N*d) on the first group and R/(N*d) on the second. Sum the two constants with their group cardinalities and simplify.
3. At R=0 the sum is zero. If N<d, Nat.mod_eq_of_lt gives R=N and cancellation gives the displayed specialization. The exported Lean equality is the general exact formula; these specializations are acceptance consequences.

Suppliers: `ProbabilisticAndMetricNumberTheory:PM.0/residue-probability`, `ProbabilisticAndMetricNumberTheory:PM.0/residue-atom-error`, `mathlib:ZMod.finEquiv`, `mathlib:ZMod.val_injective`, `mathlib:ZMod.val_natCast_of_lt`, `mathlib:Finset.card_range`, `mathlib:Equiv.prod_comp`.

Acceptance: N=5,d=3 gives 4/15. N=2,d=5 gives 6/5; summed absolute error can exceed 1. N=6,d=3 and d=1 give zero. Half this finite sum is the finite-law total variation; no new variation carrier is defined.

### Sharp residue event bound

Stable declaration: `ProbabilisticAndMetricNumberTheory:PM.0/residue-event-error`.

For every subset A of ZMod d, |mu_N({n : cast(n) belongs to A})-|A|/d| <= R*(d-R)/(N*d). The bound is attained by A={a : rho(a)<R}.

Hypotheses: m is natural, N=m+1, and mu_N is the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. All probabilities and normalized expressions below are real. d is a positive natural modulus; a ranges over the existing ZMod d. Put R=N mod d and rho(a)=(a-1).val, so 0<=rho(a)<d. Put p(a)=mu_N({n : the cast of n in ZMod d equals a}). These are local expressions, not new definitions. A is represented by a Finset of the finite native residue carrier.

Proof outline:

1. Partition the empirical event into its disjoint residue atoms and sum their probabilities, using finite empirical indicators.
2. The sum of all signed differences is zero. Each positive atom error is (d-R)/(N*d) and there are R such atoms; their total is R*(d-R)/(N*d). The negative total is its negative.
3. The sum over any A lies between these negative and positive totals. The heavy-residue set selects exactly the positive errors, giving equality, including R=0 with an empty set.

Suppliers: `ProbabilisticAndMetricNumberTheory:PM.0/residue-probability`, `ProbabilisticAndMetricNumberTheory:PM.0/residue-atom-error`, `ProbabilisticAndMetricNumberTheory:PM.0/residue-summed-error`, `tauceti:TauCeti.Probability.empiricalMeasure_apply_toReal`, `mathlib:Finset.prod_le_prod'`.

Acceptance: N=5,d=3,A={1,2}: discrepancy is 2/15, exactly half the summed error. Empty and full A have zero error; cardinality is taken in ZMod d, so duplicate integer representatives do not count twice.

### Bounded residue statistic bound

Stable declaration: `ProbabilisticAndMetricNumberTheory:PM.0/residue-statistic-error`.

For F:ZMod d->R and real L<=U with L<=F(a)<=U for every a, |integral F(cast(n)) dmu_N - (1/d) sum_a F(a)| <= (U-L)*R*(d-R)/(N*d).

Hypotheses: m is natural, N=m+1, and mu_N is the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. All probabilities and normalized expressions below are real. d is a positive natural modulus; a ranges over the existing ZMod d. Put R=N mod d and rho(a)=(a-1).val, so 0<=rho(a)<d. Put p(a)=mu_N({n : the cast of n in ZMod d equals a}). These are local expressions, not new definitions. L,U are real with L<=U and F has pointwise values in [L,U].

Proof outline:

1. Use integral_empiricalMeasure and regroup the finite sample by its residue, obtaining sum_a F(a)*p(a). Subtract the uniform finite mean.
2. The atom errors sum to zero, so replacing F by F-L leaves the discrepancy unchanged. This shifted function lies between 0 and U-L.
3. Split the finite sum by the sign of the atom errors. Its positive and negative bounds are (U-L) times the common positive error mass computed in residue-event-error. Apply the absolute-value bound. All integrals are finite empirical integrals; no target measurability or integrability assumption is missing.

Suppliers: `ProbabilisticAndMetricNumberTheory:PM.0/residue-probability`, `ProbabilisticAndMetricNumberTheory:PM.0/residue-event-error`, `tauceti:TauCeti.Probability.integral_empiricalMeasure`, `mathlib:Finset.prod_fiberwise`, `mathlib:Finset.prod_le_prod'`.

Acceptance: Constant F has exactly zero error even if its constant is negative. At N=5,d=3 take F=1 on {1,2} and -1 on {0}: the error is 4/15, attained with U-L=2.

### Joint residue atom formula

Stable declaration: `ProbabilisticAndMetricNumberTheory:PM.0/crt-residue-probability`.

For every residue tuple a, put c=E^{-1}(a) in ZMod Q. Then J(a)=[floor(N/Q)+1_{(c-1).val<R}]/N.

Hypotheses: m is natural, N=m+1, and mu_N is the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. All probabilities and normalized expressions below are real. I is any finite index type, possibly empty; q:I->N has positive values and is pairwise coprime. Put Q=product_i q(i), R=N mod Q, E=ZMod.prodEquivPi q, and J(a)=mu_N({n : for every i, the cast of n in ZMod(q(i)) equals a(i)}). The tuple a lies in the native dependent product of ZMod(q(i)). Moduli 1 and composite coprime moduli are allowed.

Proof outline:

1. The native ring equivalence E takes cast(n) to the tuple of its coordinate casts, by prodEquivPi_apply and preservation of natural casts. Injectivity identifies the entire tuple event with the single event cast(n)=E^{-1}(a).
2. Every q(i)>0 implies Q>0, including the empty product Q=1. Apply residue-probability at Q. This is a probability specialization of an implemented CRT, not a new CRT construction.

Suppliers: `ProbabilisticAndMetricNumberTheory:PM.0/residue-probability`, `mathlib:ZMod.prodEquivPi`, `mathlib:ZMod.prodEquivPi_apply`, `mathlib:Finset.prod_pos`.

Acceptance: For q=(2,3),N=5, tuple (0,0) has mass 0 and tuple (1,1) mass 1/5. The empty index type has one tuple of probability 1. Noncoprime q=(2,4) is excluded: incompatible tuples cannot have uniform positive mass.

### Complete-period joint residue law

Stable declaration: `ProbabilisticAndMetricNumberTheory:PM.0/crt-complete-period-law`.

If Q divides N, every tuple a has J(a)=product_i(1/q(i)). These atom identities are exactly the joint uniform product law on the finite residue spaces.

Hypotheses: m is natural, N=m+1, and mu_N is the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. All probabilities and normalized expressions below are real. I is any finite index type, possibly empty; q:I->N has positive values and is pairwise coprime. Put Q=product_i q(i), R=N mod Q, E=ZMod.prodEquivPi q, and J(a)=mu_N({n : for every i, the cast of n in ZMod(q(i)) equals a(i)}). The tuple a lies in the native dependent product of ZMod(q(i)). Moduli 1 and composite coprime moduli are allowed. Q divides N.

Proof outline:

1. The divisibility assumption makes R zero, so crt-residue-probability gives J(a)=1/Q.
2. Move the natural product through the real cast and invert it to obtain product_i(1/q(i)). Every factor is nonzero. Finite tuples exhaust all outcomes, so these atom masses specify the joint product law.
3. Summing over any coordinate rectangle factors into the product of coordinate uniform probabilities by the existing finite product-of-sums identity. In particular, the all-zero tuple on distinct primes agrees with the inherited complete-period divisibility law. No independence is asserted without the complete-period or explicit approximation condition.

Suppliers: `ProbabilisticAndMetricNumberTheory:PM.0/crt-residue-probability`, `mathlib:Finset.prod_inv_distrib`, `mathlib:Fintype.prod_sum`.

Acceptance: q=(4,9),N=36 gives 1/36 at every tuple, so primality is unnecessary. q=(2,3),N=5 is a counterexample; at N=6 every tuple has mass 1/6.

### Exact joint residue error

Stable declaration: `ProbabilisticAndMetricNumberTheory:PM.0/crt-summed-error`.

The sum over all tuples a of |J(a)-product_i(1/q(i))| equals 2*R*(Q-R)/(N*Q).

Hypotheses: m is natural, N=m+1, and mu_N is the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. All probabilities and normalized expressions below are real. I is any finite index type, possibly empty; q:I->N has positive values and is pairwise coprime. Put Q=product_i q(i), R=N mod Q, E=ZMod.prodEquivPi q, and J(a)=mu_N({n : for every i, the cast of n in ZMod(q(i)) equals a(i)}). The tuple a lies in the native dependent product of ZMod(q(i)). Moduli 1 and composite coprime moduli are allowed.

Proof outline:

1. Rewrite the model atom as 1/Q and the arithmetic atom using the event identity in crt-residue-probability.
2. Reindex the finite sum through the native CRT equivalence E. Apply residue-summed-error at the positive product Q.
3. For N<Q the exact value is 2*(1-N/Q), giving the source small-support obstruction. For all Q the half-error is at most Q/(4N), from R*(Q-R)<=Q^2/4; this is useful when Q/N is small, not a general growing-prime approximation.

Suppliers: `ProbabilisticAndMetricNumberTheory:PM.0/crt-residue-probability`, `ProbabilisticAndMetricNumberTheory:PM.0/residue-summed-error`, `mathlib:ZMod.prodEquivPi`, `mathlib:Equiv.prod_comp`, `mathlib:Finset.prod_inv_distrib`.

Acceptance: q=(2,3),N=5 gives 1/3; q=(4,9),N=2 gives 17/9. The empty product gives zero error for every N. Noncoprime moduli cannot be inserted into this formula.

### Bounded joint residue statistic bound

Stable declaration: `ProbabilisticAndMetricNumberTheory:PM.0/crt-statistic-error`.

For a real function F on residue tuples with L<=F(a)<=U and L<=U, |integral F((cast(n) in ZMod(q(i)))_i) dmu_N - [product_i(1/q(i))]*sum_a F(a)| <= (U-L)*R*(Q-R)/(N*Q).

Hypotheses: m is natural, N=m+1, and mu_N is the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. All probabilities and normalized expressions below are real. I is any finite index type, possibly empty; q:I->N has positive values and is pairwise coprime. Put Q=product_i q(i), R=N mod Q, E=ZMod.prodEquivPi q, and J(a)=mu_N({n : for every i, the cast of n in ZMod(q(i)) equals a(i)}). The tuple a lies in the native dependent product of ZMod(q(i)). Moduli 1 and composite coprime moduli are allowed. F is real-valued on the finite tuple space; L,U are real and L<=U, with pointwise L<=F<=U.

Proof outline:

1. Compose F with the existing CRT equivalence E. Its range remains in [L,U]. The empirical statistic becomes the single-modulus statistic because E preserves natural casts.
2. Apply residue-statistic-error at Q. Reindex the uniform sum through E, and identify 1/Q with the product of coordinate reciprocal moduli.
3. Indicators of tuple events have L=0,U=1 and give the event comparison with half the exact summed error. Coordinate products can use any proved finite range bound; no heuristic replacement of arithmetic statistics is assumed.

Suppliers: `ProbabilisticAndMetricNumberTheory:PM.0/residue-statistic-error`, `ProbabilisticAndMetricNumberTheory:PM.0/crt-residue-probability`, `mathlib:ZMod.prodEquivPi`, `mathlib:Equiv.prod_comp`, `mathlib:Finset.prod_inv_distrib`.

Acceptance: At q=(2,3),N=5, the indicator of all tuples except (0,0) has discrepancy 1/6. Constants have zero error, and all statistics have zero discrepancy when Q divides N.

### Checked boundaries

Eighteen typed examples cover the shifted origin, zero and nonzero residues,
modulus one, a one-point sample, opposite error signs, a summed error exceeding
one, complete periods, sharp event and signed-statistic bounds, a negative
constant, incompatible noncoprime tuples, composite coprime moduli, the empty
tuple, and a redundant modulus-one coordinate. The sum of absolute differences
is kept distinct from its half, the event/finite-law total-variation bound.

The new exact-rational suite checks 98,400 single-modulus atom formulas and
strict error bounds, 4,800 summed errors and attaining events, 15,300 exhaustive
subset bounds, 14,400 bounded-statistic comparisons, 12,080 joint atoms and
640 joint summed errors. Single-modulus samples range from N=1 through 120 and
d=1 through 40; all subsets are enumerated for d<=8 and N<=30. Joint families
include the empty family, repeated unit moduli, (2,3), (4,9), (5,8), (1,4,9)
and (2,3,5), at N=1 through 80. Fractions are exact. The calculations supplement
the universal proof outlines; they do not implement the packet.

The 17 new baseline entries include three indexed multiplicative generators
whose source attributes provide the additive declarations actually used:
Equiv.sum_comp, Finset.sum_fiberwise and Finset.sum_le_sum. Their generated
statements were also checked in Lean. Existing interval counting, finite
summation and CRT are imported, not planned again.


## Repeated prime factors: from omega to Omega

The native functions distinguish the number of distinct prime factors from the
number counted with multiplicity. This section relates their arithmetic laws
without redefining either function. For every natural n write, as a local
expression,

    D(n) = (Omega(n) as a real number) - (omega(n) as a real number).

The subtraction is in the reals after casting, not a replacement by truncated
natural subtraction without justification. The existing factor-list interpretation
gives omega(n)<=Omega(n), because deduplication cannot increase length. Hence
D(n)>=0, also at zero and one under the existing zero-extension conventions.
The arithmetic observation at zero is legitimate; the probability sample still
contains only the positive integers 1,...,N, with N=m+1.

The source is the opening prime-factor identities, Exercise 46 and the relevant
parts of Theorem 47 and Exercise 51 in
[Tao's elementary multiplicative-number-theory notes](https://terrytao.wordpress.com/2014/11/23/254a-notes-1-elementary-multiplicative-number-theory/).
The exercise states bounded repeated-factor moments but does not supply their
proofs. The argument here supplies the first-moment case with an explicit finite
constant. The higher-moment cases and Gaussian limit transfer are not claimed.
The formula refinements and proofs below are the worker's derivations, not
unquoted source theorems.

### Factorization and the finite exponent count

The declaration `excess-factorization` says

    D(n) = sum_{p in n.primeFactors} ((n.factorization(p) as real) - 1).

The existing multiplicity count is the sum of the native finitely supported
factorization. Its support is exactly n.primeFactors; the existing distinct
count is the cardinality of that set. Subtracting the sum of ones proves the
identity. For n=0 or 1, the support is empty. This reuses both existing counts,
the existing factorization, and the finite-set/list dictionary.

For a prime p and positive n<=N, `prime-power-tail-count` gives the natural
identity

    sum_{2 <= j <= N} 1_{p^j divides n} = n.factorization(p) - 1.

The subtraction on this line is natural truncated subtraction. The native
prime-power divisibility theorem replaces the condition by j<=v, where
v=n.factorization(p). The implemented exponent bound v<n<=N reduces the
filtered interval to [2,v]. Its cardinality is v-1, including v=0 or 1.
These are the precise boundary cases that exclude a spurious first copy of p.
For n=0 every positive power divides n, so this count cannot use the native
zero factorization. For a composite base the exponent correspondence also
fails: at n=16, base 4 contributes the power 4^2, but factorization(16)(4)=0.

The declaration `excess-prime-power-expansion` combines the two identities:

    D(n) = sum_{p prime, p <= N} sum_{2 <= j <= N} 1_{p^j divides n},
    for 0 < n <= N.

All indicators on this line are real. A prime factor of n is at most n, hence
is in the native inclusive cutoff primesLE(N). At those supported primes v>=1,
so casting the natural v-1 agrees with the real difference. Primes outside the
support contribute zero. The deliberately coarse exponent cutoff N makes the
statement entirely finite and avoids any logarithmic-floor convention.

### Exact first moment and a uniform bound

For the same empirical probability mu_N, `excess-mean-formula` asserts

    integral D dmu_N
      = sum_{p prime, p <= N} sum_{2 <= j <= N} floor(N/p^j)/N.

Use the existing empirical-integral formula, insert the finite expansion at each
sample k+1, and exchange finite sums. Each inner average is the inherited
divisibility-probability declaration for the positive modulus p^j. Powers of
one prime give nested events; no independence is assumed or needed.

The theorem `excess-mean-bound` is

    0 <= integral D dmu_N <= 1 - 1/N.

The signed divisibility error bounds floor(N/p^j)/N by 1/p^j. For a prime p>=2,
the existing finite geometric-series bound gives

    sum_{2 <= j <= N} 1/p^j <= (1/p)^2/(1-1/p) = 1/[p(p-1)].

Enlarge the nonnegative prime sum to all integers r from 2 through N. The
existing finite telescope then gives

    sum_{2 <= r <= N} 1/[r(r-1)]
      = sum_{2 <= r <= N} (1/(r-1) - 1/r)
      = 1 - 1/N.

N=1 is checked separately by empty sums. The geometric and telescoping identities
are already library results, not new generic roadmap declarations. No infinite
series, prime number theorem or Mertens estimate enters this proof. The constant
is an explicit convenient bound, not a claimed sharp prime-sum constant.

This bound is about an average. The pointwise claim D(n)<=1 is false: D(16)=3,
and D(2^k)=k-1 for k>=1. The mean at N=12 is 5/12, not a count of the integers
that have any repeated factor: 8 contributes twice.

### Tail and scaled absolute mean

For t>0, `excess-tail-bound` says

    mu_N({n : t <= D(n)}).toReal <= (1-1/N)/t.

This is the implemented real Markov inequality applied to the arithmetic
observation D. Integrability is supplied by the finite empirical Dirac sum on
discrete naturals. The finite proof can equally be read directly from
t times the event indicator <= D(n), followed by the existing finite-average
dictionary. It does not create a second Markov theorem.

The threshold condition matters: at t=0 the event is the whole sample; totalized
division by zero would not produce a valid upper bound. The event is inclusive
at its threshold. At N=12 its masses at thresholds 1 and 2 are 1/3 and 1/12,
respectively.

For s>0, `excess-scaled-l1` says

    integral |D(n)/s| dmu_N <= (1-1/N)/s.

Remove the absolute value using D>=0 and the positive scale, then factor the
constant division out of the finite empirical sum. This supplies a first-absolute-
moment comparison at any positive scale, without committing to a logarithmic
normalization whose asymptotics still need proof. At N=12 and s=2 the absolute
mean is 5/24. Neither a bounded second moment nor convergence of all moments
follows from this first-moment estimate.

### A finite distribution sandwich

Use a common real center b and a common positive real scale s, and write

    X(n) = (omega(n)-b)/s,   Y(n) = (Omega(n)-b)/s.

For every real x and delta>0, `excess-cdf-sandwich` gives

    mu_N({X <= x-delta}).toReal - (1-1/N)/(s*delta)
      <= mu_N({Y <= x}).toReal
      <= mu_N({X <= x}).toReal.

These are event probabilities using the existing empirical law, not a new CDF
definition. Since Y=X+D/s and D>=0, the upper inclusion is immediate. If
X<=x-delta but Y>x, then D>s*delta. Thus the event on the left is contained in
the union of the middle event and {s*delta<=D}. Existing real-measure monotonicity
and subadditivity, followed by the arithmetic tail bound, prove the sandwich.

The direction is testable: at N=4,b=0,s=1,x=1, the Omega event has probability
3/4 and the omega event probability 1. A negative scale reverses the pointwise
order; using different centers removes the stated identity. Both are excluded.
No continuity hypothesis is needed for this finite statement.

The sandwich and scaled L1 estimate provide inputs to an asymptotic transfer
once convergence of the omega laws and divergence of the scale are established.
They do not supply those assumptions. In particular, the general arithmetic
CDF-continuity-point criterion, Mertens normalization and the moment-continuity
argument remain in the gap ledger. The new section below supplies the characteristic-function
dictionary and conditional weak-limit transfer. An iid central limit theorem still does not
apply directly to these arithmetic divisibility indicators.

### Historical repeated-factor checks and source limits

Sixteen suggested examples cover zero and one, squarefree and repeated factors,
prime and composite powers, the positive sample, exact means, inclusive thresholds,
the zero-threshold counterexample, the scaled absolute mean and the CDF direction.
The 51 inherited node objects and all 61 earlier examples are preserved.

Exact-rational regressions check 1,000 finite expansions and 52,588 single-prime
tail counts for n=1,...,500 at N=n and N=n+5; 500 mean/telescope chains;
12,000 positive-threshold bounds; 2,000 scaled L1 bounds; 5,900 finite geometric
bounds; and 20,160 CDF sandwiches with varying centers, positive scales, thresholds
and positive shifts. Five rejection checks cover pointwise misuse, composite
bases, zero samples, zero thresholds and negative scales. These are diagnostics,
not proofs of universal contracts.

A separate scratch Lean file proves six general auxiliary statements and six
examples with no placeholders or diagnostics. It checks both the arithmetic
counting reduction and the finite analytic inequalities, including the actual
additive suppliers generated by two indexed multiplicative statements. The full
suggested file elaborates with 136 expected placeholder warnings and no others;
all 59 packet nodes remain unchecked.

Only the stated Tao passages were read for this continuation. The author HTML
hash and access date are recorded. A bounded title/exercise correction search
and acquired-HTML occurrence screen produced no applicable correction; this is
not a full comment-thread collation or a source-wide correctness claim. The
three inherited Granville–Soundararajan findings and their edition restrictions
remain unchanged. The higher repeated-factor moments in Exercise 46, the full
Hardy–Ramanujan deduction remained explicit work at that checkpoint. The conditional
Omega transfer is now supplied in the following section; the underlying Gaussian limit is not.

## Arithmetic laws and conditional limit transfer

This continuation adds eight declarations to PM.0. Use the existing empirical
measure mu_N for N=m+1, with observations at k+1 for k=0,...,m. Every map from
the discrete naturals is measurable. The real pushforward law, CDF, characteristic
function and convergence-in-distribution relation are all native library objects.
Repeated values are counted with their multiplicities; no new probability carrier
is defined. Suggested home: `TauCeti/NumberTheory/ArithmeticProbability/LimitTransfer.lean`.

For the repeated-factor branch put D=Omega-omega, with real casts before
subtraction, and X_m=(omega-b_m)/s_m, Y_m=(Omega-b_m)/s_m. The centers and scales
are common. The finite Lipschitz bound requires s>0. The limit statements require
s_m tending to positive infinity, so initial zero or negative scales are harmless.
The target nu is any Borel probability law, including atomic laws. No continuity
of its CDF or arithmetic independence is assumed.

### Arithmetic observation frequencies

Suggested declaration: `TauCeti.Probability.Arithmetic.arithmetic_law_count`.
Node: `ProbabilisticAndMetricNumberTheory:PM.0/arithmetic-law-count`.

For f:N→R and every Borel set B, (map f mu_N).real(B)=#{k in {0,...,m}: f(k+1) in B}/N.

Proof outline:

1. Apply native measurability of every map from discrete naturals, then map_measureReal_apply to pull back B.
2. Apply empiricalMeasure_apply_toReal on the natural-number preimage. Convert its finite sum of 0/1 indicators to the cardinality of the filtered range and replace inverse multiplication by division. Count indices, not the image set; no injectivity of f is assumed.

Dependencies: `mathlib:measurable_of_countable`, `mathlib:MeasureTheory.map_measureReal_apply`, `tauceti:TauCeti.Probability.empiricalMeasure_apply_toReal`.

Regression contracts:

- `law_constant_retains_multiplicity`: A constant observation 7 on N=4 has mass 1 at 7, not 1/4.
- `law_one_point_samples_one`: For N=1 and f(n)=n, the law gives mass 1 to {1}, not {0}.

### Arithmetic cumulative distribution counts

Suggested declaration: `TauCeti.Probability.Arithmetic.arithmetic_law_cdf`.
Node: `ProbabilisticAndMetricNumberTheory:PM.0/arithmetic-law-cdf`.

For every f:N→R and x in R, the native cdf of map f mu_N at x equals #{k in {0,...,m}: f(k+1)<=x}/N.

Proof outline:

1. Use native cdf_eq_real for the pushforward probability measure.
2. Apply arithmetic-law-count to the closed half-line (-infinity,x]. The endpoint is inclusive; no continuity of the finite atomic CDF is assumed.

Dependencies: `ProbabilisticAndMetricNumberTheory:PM.0/arithmetic-law-count`, `mathlib:ProbabilityTheory.cdf_eq_real`.

Regression contracts:

- `cdf_inclusive_at_atom`: For N=2,f(n)=n,x=1 the CDF is 1/2; a strict endpoint gives 0.
- `cdf_below_positive_sample`: For N=4,f(n)=n,x=0 the CDF is 0.

### Arithmetic characteristic-function average

Suggested declaration: `TauCeti.Probability.Arithmetic.arithmetic_law_charfun`.
Node: `ProbabilisticAndMetricNumberTheory:PM.0/arithmetic-law-charfun`.

For every f:N→R and real t, charFun(map f mu_N)(t)=(1/N) sum_{k=0}^m exp(i*t*f(k+1)). The complex division uses the cast of the positive integer N.

Proof outline:

1. Expand native charFun_apply_real: its phase is +i*t*x, without a 2*pi factor.
2. Use integral_map with the measurable arithmetic observation and continuous complex exponential. Apply the existing complex-valued integral_empiricalMeasure to the composition on naturals.
3. Rewrite real scalar multiplication on C as division by the complex cast of N. This identity requires no integrability hypothesis on the infinite observation sequence: only a finite population is integrated.

Dependencies: `mathlib:measurable_of_countable`, `mathlib:MeasureTheory.charFun_apply_real`, `mathlib:MeasureTheory.integral_map`, `tauceti:TauCeti.Probability.integral_empiricalMeasure`.

Regression contracts:

- `charfun_zero_normalization`: At t=0 the characteristic function equals 1 for every m and f.
- `charfun_positive_phase`: The constant observation 1 at t=pi/2 has characteristic function i, not -i and not the 2*pi Fourier phase.

### Arithmetic Levy criterion

Suggested declaration: `TauCeti.Probability.Arithmetic.arithmetic_levy_criterion`.
Node: `ProbabilisticAndMetricNumberTheory:PM.0/arithmetic-levy-criterion`.

Let f_m:N→R be any sequence and nu a Borel probability measure on R. The native TendstoInDistribution of f_m under mu_(m+1) to the identity observation under nu holds if and only if, for every real t, (1/(m+1)) sum_{k=0}^m exp(i*t*f_m(k+1)) tends to charFun(nu)(t).

Proof outline:

1. Every f_m is measurable because the domain is countable and discrete; the identity observation under nu is measurable.
2. Apply the existing tendstoInDistribution_iff_tendsto_charFun, which permits varying source probability measures.
3. Substitute arithmetic-law-charfun termwise and map_id on the target. The target is supplied as an actual probability measure; arbitrary pointwise limits are not accepted without the missing continuity/tightness condition.

Dependencies: `ProbabilisticAndMetricNumberTheory:PM.0/arithmetic-law-charfun`, `mathlib:measurable_of_countable`, `mathlib:MeasureTheory.tendstoInDistribution_iff_tendsto_charFun`.

Regression contracts:

- `levy_constant_law`: The observations f_m(n)=c converge to the native Dirac law at c.
- `levy_sum_at_zero_not_zero`: For every m the finite normalized exponential sum at zero is 1; omitting normalization gives m+1.

### Lipschitz comparison of prime-factor laws

Suggested declaration: `TauCeti.Probability.Arithmetic.excess_lipschitz_bound`.
Node: `ProbabilisticAndMetricNumberTheory:PM.0/excess-lipschitz-bound`.

For real b, positive s, and a real-valued L-Lipschitz function g with L>=0, |E_muN[g((Omega-b)/s)]-E_muN[g((omega-b)/s)]| <= L*(1-1/N)/s.

Proof outline:

1. Rewrite both empirical integrals as finite normalized sums. Thus even globally unbounded g is integrable here.
2. For every sampled n, the common center cancels and |Y-X|=|D/s|. The native Lipschitz inequality bounds |g(Y)-g(X)| by L*|D/s|.
3. Apply the existing finite triangle inequality and termwise sum monotonicity, pull out the nonnegative factor L, and rewrite the resulting average as the empirical integral of |D/s|.
4. Apply excess-scaled-l1. The bound is not a pointwise claim D<=1, and requires no independence, differentiability or boundedness of g.

Dependencies: `ProbabilisticAndMetricNumberTheory:PM.0/excess-scaled-l1`, `mathlib:lipschitzWith_iff_dist_le_mul`, `mathlib:Finset.abs_sum_le_sum_abs`, `tauceti:TauCeti.Probability.integral_empiricalMeasure`.

Regression contracts:

- `lipschitz_constant_statistic`: A constant statistic has comparison error zero at every sample size.
- `lipschitz_identity_signed_gap`: At N=4,b=0,s=1,g=id the signed mean gap is +1/4.

### Vanishing normalized repeated-factor mean

Suggested declaration: `TauCeti.Probability.Arithmetic.excess_l1_limit`.
Node: `ProbabilisticAndMetricNumberTheory:PM.0/excess-l1-limit`.

For any real sequence s_m tending to positive infinity, E_mu(m+1)[|D/s_m|] tends to 0. Finitely many zero or negative scales are allowed by native total division and do not affect the limit.

Proof outline:

1. Divergence of s_m implies s_m>0 eventually, so the existing excess-scaled-l1 applies on that tail.
2. The integral is nonnegative and is at most (1-1/N)/s_m<=1/s_m eventually. Here N=m+1>=1 and 1/N>=0.
3. Compose tendsto_inv_atTop_zero with the scale limit and use the native eventual squeeze theorem. Do not require positivity at m=0.

Dependencies: `ProbabilisticAndMetricNumberTheory:PM.0/excess-scaled-l1`, `mathlib:tendsto_inv_atTop_zero`, `mathlib:squeeze_zero'`.

Regression contracts:

- `l1_scale_can_start_at_zero`: The scale s_m=m gives the zero limit although its first term is zero.
- `l1_fixed_scale_not_a_vanishing_bound`: At fixed scale 1 and N=4 the absolute mean is 1/4; scale divergence cannot be dropped from the proof.

### Vanishing repeated-factor tail frequencies

Suggested declaration: `TauCeti.Probability.Arithmetic.excess_tail_limit`.
Node: `ProbabilisticAndMetricNumberTheory:PM.0/excess-tail-limit`.

For s_m tending to positive infinity and every epsilon>0, mu_(m+1).real{n: epsilon<=|D(n)/s_m|} tends to 0. This is a tail-frequency limit for changing measures, not a fixed-measure TendstoInMeasure statement.

Proof outline:

1. For each m the absolute normalized excess is a nonnegative integrable finite-population observation; integrability follows directly from the native finite Dirac sum.
2. Apply the native real Markov inequality at epsilon. Divide by epsilon>0 to bound the event mass by E[|D/s_m|]/epsilon.
3. Apply excess-l1-limit, continuity of division by the nonzero constant epsilon and the nonnegative squeeze theorem. No assertion about convergence of the observations on one common probability space is needed.

Dependencies: `ProbabilisticAndMetricNumberTheory:PM.0/excess-l1-limit`, `mathlib:MeasureTheory.mul_meas_ge_le_integral_of_nonneg`, `mathlib:squeeze_zero`, `tauceti:TauCeti.Probability.empiricalMeasure`.

Regression contracts:

- `tail_diverging_integer_scale`: For s_m=m+1 and threshold epsilon=1, the tail frequency tends to zero.
- `tail_zero_threshold_mass_one`: At epsilon=0 the event has mass 1 for every m and scale, so a nonnegative threshold premise is insufficient.

### Transfer between omega and Omega limit laws

Suggested declaration: `TauCeti.Probability.Arithmetic.excess_distribution_transfer`.
Node: `ProbabilisticAndMetricNumberTheory:PM.0/excess-distribution-transfer`.

For arbitrary real centers b_m, a real scale s_m tending to positive infinity, and any Borel probability measure nu on R, (omega-b_m)/s_m under mu_(m+1) converges in distribution to nu if and only if (Omega-b_m)/s_m does. The limit law need not have a continuous CDF.

Proof outline:

1. All observations are measurable on discrete naturals; their pushforward laws are native probability measures. Use the existing bounded-Lipschitz integral characterization of weak convergence.
2. For each bounded L-Lipschitz test function g, integral_map rewrites integrals against the two laws as the arithmetic expectations. On the eventual positive-scale tail, excess-lipschitz-bound gives their absolute difference at most L/s_m.
3. The last bound tends to zero by reciprocal convergence. Apply the eventual squeeze theorem to the absolute difference, then the native metric criterion and addition/subtraction of limits to transfer the limiting integral from either law to the other.
4. Apply the reverse direction of the same bounded-Lipschitz characterization. No new Slutsky theorem is planned, and its existing fixed-sampling-measure helper is not misapplied.
5. Specializing the center and scale to the log-log Erdős–Kac normalization is valid once their scale divergence and the omega Gaussian-limit premise are supplied. This checkpoint does not supply the latter; it closes only the repeated-factor transfer in Exercise 51(iv).

Dependencies: `ProbabilisticAndMetricNumberTheory:PM.0/excess-lipschitz-bound`, `mathlib:MeasureTheory.TendstoInDistribution`, `mathlib:MeasureTheory.tendsto_iff_forall_lipschitz_integral_tendsto`, `mathlib:MeasureTheory.integral_map`, `mathlib:measurable_of_countable`, `mathlib:tendsto_inv_atTop_zero`, `mathlib:squeeze_zero'`, `mathlib:tendsto_iff_dist_tendsto_zero`.

Regression contracts:

- `transfer_arbitrary_common_center`: The equivalence holds for s_m=m+1 and arbitrary common b_m and target probability nu.
- `transfer_does_not_identify_finite_laws`: At N=4, the unnormalized Omega law assigns mass 1/4 to {2}, whereas the omega law assigns mass 0. Only the stated asymptotic equivalence is claimed.

### Sources, source correction and exact limits

The arithmetic transfer refines [Tao's 2014 Section 4, Exercises 46 and 51](https://terrytao.wordpress.com/2014/11/23/254a-notes-1-elementary-multiplicative-number-theory/).
The first-moment estimate is sufficient for this conditional weak-limit transfer;
higher repeated-factor moments are not needed for this step. They are now decomposed in
the finite exponential-moment section below.
The probability conventions are in [Tao's 2010 Notes 2](https://terrytao.wordpress.com/2010/01/05/254a-notes-2-the-central-limit-theorem/),
Exercise 5 and Section 2 equation (5), Theorem 13 and its proof. These selected
passages were read, including the distinction in Exercise 15 between an actual
probability target and an arbitrary pointwise characteristic-function limit.
The generic theorems are imported from the pinned library, not planned again.

Finding E4: Exercise 11's final derivative formula needs evaluation at t=0.
For the deterministic variable X=1, F(t)=exp(it); its first derivative at pi is -i,
not i. The correct general expression is E[(iX)^j exp(itX)], and the moment
identity holds at zero. This does not invalidate the preceding Taylor coefficients
or Theorem 13. The finding is restricted to the acquired author HTML, hash
`ffa97487e6339d8cef52ad1c0609373738520c027b06ba24a89e8af2caad332d`.
A bounded title/exercise correction search and current-page comment occurrence
screen found no applicable correction; no full comment-thread or print-edition
collation is claimed. The three inherited findings remain unchanged. No source
finding has been independently reviewed in this continuation.

The native convergence definition allows changing source measures. Its
fixed-measure Slutsky helper is not directly applicable here. The proof instead
uses the existing bounded-Lipschitz criterion on the two sequences of pushforward
probability laws and the finite Lipschitz estimate above. It works in both
directions and even for an atomic target. Neither direction proves that a limit
exists. The omega Gaussian theorem, Mertens normalization and source-specific
moment convergence remain open. The finite CDF identity is not yet the converse
weak-convergence criterion phrased only using counts at continuity points.

### Historical validation of the law-transfer checkpoint

That checkpoint had 67 declaration signatures and 93 examples, elaborating
with 160 expected placeholder warnings and no other diagnostics. All 67 nodes
remain unchecked. The inventory is 1 construction, 48 lemmas, 1 comparison and
17 theorems, with 7 construction API items, 21 packet test contracts (5 construction
tests and 16 new theorem/lemma regressions), 8 unchanged planets and 106 baseline
citations. No stage is closed; there remain 6 gaps and no supplier requests.

Exact rational tests check 4,800 event counts, 5,400 CDF endpoints and 10,200
characteristic-function values at multiples of pi/2 for N=1,...,120. The five
observation families are a constant, the positive identity, residue modulo 3,
omega and Omega. The characteristic checks use exact rational real/imaginary
parts of the four roots of unity, not floating-point exponentials.
For N=1,...,180, four centers, four positive rational scales and six statistics
(constant, identity, absolute value, positive part, clipped identity and twice a
shifted absolute value), 17,280 Lipschitz comparisons pass. Three diverging-scale
families give 540 finite mean envelopes and 2,160 positive-threshold envelopes.
The 173 fixed-scale obstructions use multiples of 4 to give a nonzero lower bound.
Eight mutations reject loss of multiplicity, sampling zero, a strict CDF endpoint,
wrong phase sign, omitted 1/N normalization, zero threshold, different centers
and a fixed scale. These finite regressions do not prove asymptotic statements.

A separate scratch Lean file proves six general statements and six examples,
without placeholders, axioms or diagnostics: the count, CDF and characteristic
identities, arithmetic Levy equivalence, reciprocal squeeze and a native
changing-measure bounded-Lipschitz weak-transfer bridge. The last assumes the
test-integral difference tends to zero; it does not assume a fixed source measure.
This checks the selected bridge and identities, not all eight nodes or a Gaussian limit.

## Uniform exponential and fixed higher repeated-factor moments

Let D(n)=(Omega(n):R)-(omega(n):R)>=0 and let mu_M be the existing empirical measure
on 1,...,M, with M=m+1. The fixed constants here are a=3/2 and t=log(a)>0.
These are real exponential moments, not the imaginary characteristic functions
in the preceding section; there is no factor of 2pi. No new arithmetic function,
probability carrier or infinite Euler-product object is defined.

The [source target](https://terrytao.wordpress.com/2014/11/23/254a-notes-1-elementary-multiplicative-number-theory/)
is Section 4, Exercise 46(ii): for each fixed natural k the sum of D(n)^k up to M is
bounded by a k-dependent constant times M. The exercise does not provide a proof.
The following finite positive-geometric proof and constants are worker derivations.

The proof chain is local geometric expansion → finite prime product → exact CRT
counting comparison → bounded finite Euler product → exponential mean → fixed
moments. In particular,

E_mu_M[exp(log(3/2)·D)] <= exp(2),

E_mu_M[|D|^k] <= exp(2)·k!/[log(3/2)]^k.

The constants are uniform in M, not in a growing k. Generic arithmetic-function
mean-value theorems, prime independence, a Mertens estimate and an infinite
interchange of sums are not used.

### Positive geometric expansion at one prime

- [ ] `ProbabilisticAndMetricNumberTheory:PM.0/excess-local-geometric` — lemma; unchecked.

Declaration: `TauCeti.Probability.Arithmetic.excess_local_geometric`.

For n>0, n<=N and prime p, a^(v_p(n)-1)=1+sum_{j=2}^N 1_{p^j|n}·(1/2)·a^(j-2), where v_p(n)=n.factorization p and both subtractions in natural exponents are truncated.

Hypotheses: m,n,N,k are natural. Where m occurs set M=m+1 and use mu_M, the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. Its support is 1,...,M, never zero. D(n)=(Omega(n):R)-(omega(n):R), with real casts before subtraction and the native cardFactors/cardDistinctFactors. D is nonnegative. Put a=3/2 and t=log(a)>0 only as local scalar notation; no new definition or carrier is exported. All finite sums use their displayed inclusive cutoffs.

Proof plan:

1. Set v=v_p(n). The native divisibility criterion says p^j|n iff j<=v; positivity of n is essential. Native factorization_lt gives v<n<=N.
2. If v=0 or v=1, the indicated exponent interval contributes nothing and the natural exponent v-1 is zero, so both sides equal one.
3. For v>=2, reindex j=i+2 over i=0,...,v-2. The native finite geometric identity at a=3/2 gives (1/2)·sum_{i=0}^{v-2}a^i=a^(v-1)-1.
4. No contribution from j=1 is permitted: the weight measures repeated factors, not all factors.

Prerequisites: `mathlib:Nat.Prime.pow_dvd_iff_le_factorization`, `mathlib:Nat.factorization_lt`, `mathlib:geom_sum_mul`.

Regression contracts:

- `geometric_unit`: At n=1 and p=2 the local weight is 1.
- `geometric_cube`: At n=8 and p=2 the local weight is 9/4.
- `first_prime_power_has_no_excess_weight`: At n=p=2 the local weight is 1, not 3/2.

Source: Tao 2014, Section 4 Exercise 46(ii). Worker-derived finite positive-geometric proof of the source exercise. The source supplies the fixed-k target, not this exponential-moment proof or these explicit constants. No generic mean-value or independence theorem is asserted.

### Finite prime product for the excess exponential

- [ ] `ProbabilisticAndMetricNumberTheory:PM.0/excess-exponential-product` — lemma; unchecked.

Declaration: `TauCeti.Probability.Arithmetic.excess_exponential_product`.

For n>0 and n<=N, exp(tD(n))=product_{p<=N, prime} a^(v_p(n)-1), with truncated natural exponents.

Hypotheses: m,n,N,k are natural. Where m occurs set M=m+1 and use mu_M, the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. Its support is 1,...,M, never zero. D(n)=(Omega(n):R)-(omega(n):R), with real casts before subtraction and the native cardFactors/cardDistinctFactors. D is nonnegative. Put a=3/2 and t=log(a)>0 only as local scalar notation; no new definition or carrier is exported. All finite sums use their displayed inclusive cutoffs.

Proof plan:

1. Use the inherited finite repeated-prime-power expansion and single-prime count to write D(n) as the sum over primes p<=N of the real cast of v_p(n)-1.
2. Distribute multiplication by t over this finite sum and apply native exp_sum.
3. For each natural exponent e, native exp_nat_mul and exp_log(a)=a identify exp(te)=a^e. No real-power convention is substituted for the natural exponent.
4. If N=1, the product is empty and n=1 has D=0. The positive sample ensures the zero-divisibility pathology is never used.

Prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/excess-prime-power-expansion`, `ProbabilisticAndMetricNumberTheory:PM.0/prime-power-tail-count`, `mathlib:Real.exp_sum`, `mathlib:Real.exp_nat_mul`, `mathlib:Real.exp_log`.

Regression contracts:

- `exponential_mixed_powers`: At n=72, exp(tD)=27/8.
- `squarefree_exponential_weight`: At the squarefree n=30, exp(tD)=1.

Source: Tao 2014, Section 4 Exercise 46(ii). Worker-derived finite positive-geometric proof of the source exercise. The source supplies the fixed-k target, not this exponential-moment proof or these explicit constants. No generic mean-value or independence theorem is asserted.

### Finite Euler upper bound for the excess mean

- [ ] `ProbabilisticAndMetricNumberTheory:PM.0/excess-exponential-euler` — lemma; unchecked.

Declaration: `TauCeti.Probability.Arithmetic.excess_exponential_euler`.

For M=m+1, E_mu_M[exp(tD)]<=product_{p<=M, prime}(1+sum_{j=2}^M (1/2)·a^(j-2)/p^j).

Hypotheses: m,n,N,k are natural. Where m occurs set M=m+1 and use mu_M, the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. Its support is 1,...,M, never zero. D(n)=(Omega(n):R)-(omega(n):R), with real casts before subtraction and the native cardFactors/cardDistinctFactors. D is nonnegative. Put a=3/2 and t=log(a)>0 only as local scalar notation; no new definition or carrier is exported. All finite sums use their displayed inclusive cutoffs.

Proof plan:

1. On the positive sample, replace exp(tD) by the finite prime product and then replace each local factor by its positive geometric expansion.
2. Expand the product using the native finite product-of-sums theorem. At each prime the choices are the constant term or an exponent j in [2,M]. Give the constant choice exponent zero, weight one and modulus p^0=1.
3. For a chosen exponent family, powers of distinct primes are pairwise coprime by the native theorem. Identify all zero-residue events with divisibility via natCast_eq_zero_iff. The inherited CRT atom formula gives joint probability floor(M/Q)/M for Q=product p^j.
4. To see the remainder indicator vanish at the zero tuple, its inverse CRT residue is zero and (-1).val=Q-1; the remainder R is always less than Q. This includes Q=1, where R=0. Thus no event is assumed independent.
5. Every coefficient is nonnegative. Replace floor(M/Q)/M by 1/Q, factor that denominator over the chosen prime powers, and reverse the finite product expansion.
6. All integration is the native finite empirical sum. There is no limiting product or infinite interchange of sums.

Prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/excess-exponential-product`, `ProbabilisticAndMetricNumberTheory:PM.0/excess-local-geometric`, `ProbabilisticAndMetricNumberTheory:PM.0/crt-residue-probability`, `mathlib:Nat.coprime_pow_primes`, `mathlib:ZMod.natCast_eq_zero_iff`, `mathlib:Fintype.prod_sum`, `tauceti:TauCeti.Probability.integral_empiricalMeasure`.

Regression contracts:

- `exponential_mean_four`: For M=4 the exponential mean is exactly 9/8.
- `exponential_mean_three`: For M=3 every sampled integer is squarefree and the exponential mean is 1.

Source: Tao 2014, Section 4 Exercise 46(ii). Worker-derived finite positive-geometric proof of the source exercise. The source supplies the fixed-k target, not this exponential-moment proof or these explicit constants. No generic mean-value or independence theorem is asserted.

### Uniform bound for one repeated-factor Euler term

- [ ] `ProbabilisticAndMetricNumberTheory:PM.0/excess-local-euler-bound` — lemma; unchecked.

Declaration: `TauCeti.Probability.Arithmetic.excess_local_euler_bound`.

For any prime p and natural N, sum_{j=2}^N (1/2)·a^(j-2)/p^j <= 2/p^2.

Hypotheses: m,n,N,k are natural. Where m occurs set M=m+1 and use mu_M, the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. Its support is 1,...,M, never zero. D(n)=(Omega(n):R)-(omega(n):R), with real casts before subtraction and the native cardFactors/cardDistinctFactors. D is nonnegative. Put a=3/2 and t=log(a)>0 only as local scalar notation; no new definition or carrier is exported. All finite sums use their displayed inclusive cutoffs.

Proof plan:

1. If N<2 the sum is empty and the right side is positive.
2. Otherwise reindex j=i+2. The sum is [1/(2p^2)]·sum_{i=0}^{N-2}(3/(2p))^i.
3. Since p>=2, the ratio is in (0,3/4], strictly less than one. The native finite geometric bound gives at most 1/[p(2p-3)].
4. The inequality 1/[p(2p-3)]<=2/p^2 follows by positive cross-multiplication from p>=2. It is equality at p=2 at the infinite-sum bound, not at a finite cutoff.
5. The fixed base a=3/2 is below 2. At base 2 the local ratio at p=2 is one and this uniform argument fails.

Prerequisites: `mathlib:geom_sum_Ico_le_of_lt_one`.

Regression contracts:

- `local_density_first_term`: For p=2,N=2 the sum is 1/8.
- `local_density_empty_cutoff`: At N=1 the sum is zero for every p.
- `base_two_loses_geometric_decay`: Replacing a by 2 gives sum_{j=2}^{10}2^(j-2)/2^j=9/4; geometric decay is lost.

Source: Tao 2014, Section 4 Exercise 46(ii). Worker-derived finite positive-geometric proof of the source exercise. The source supplies the fixed-k target, not this exponential-moment proof or these explicit constants. No generic mean-value or independence theorem is asserted.

### Uniform finite excess Euler product bound

- [ ] `ProbabilisticAndMetricNumberTheory:PM.0/excess-finite-euler-bound` — lemma; unchecked.

Declaration: `TauCeti.Probability.Arithmetic.excess_finite_euler_bound`.

For any finite set P of primes and any natural N, product_{p in P}(1+sum_{j=2}^N (1/2)·a^(j-2)/p^j)<=exp(2).

Hypotheses: m,n,N,k are natural. Where m occurs set M=m+1 and use mu_M, the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. Its support is 1,...,M, never zero. D(n)=(Omega(n):R)-(omega(n):R), with real casts before subtraction and the native cardFactors/cardDistinctFactors. D is nonnegative. Put a=3/2 and t=log(a)>0 only as local scalar notation; no new definition or carrier is exported. All finite sums use their displayed inclusive cutoffs.

Proof plan:

1. All local sums are nonnegative. Apply excess-local-euler-bound and finite product monotonicity to bound the product by product_{p in P}(1+2/p^2).
2. Use native prod_one_add_le_exp_sum with the globally nonnegative function n mapped to 2/(n:R)^2; total division at n=0 still gives a nonnegative value. The result is exp(2·sum_{p in P}1/p^2).
3. Take B=max(2,max P), with any native finite supremum implementing the empty case. Because all p>=2, enlarge the nonnegative sum to integers r=2,...,B.
4. For r>=2, 1/r^2<=1/[r(r-1)]=1/(r-1)-1/r. The existing additive form generated by prod_Icc_div telescopes the latter finite sum to 1-1/B<=1. The subset-sum monotonicity is the additive form of the recorded native multiplicative supplier.
5. Monotonicity of exp now gives exp(2). Empty P has product one and satisfies the same bound. No prime-reciprocal asymptotic, Mertens theorem or infinite Euler product enters.

Prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/excess-local-euler-bound`, `mathlib:Real.prod_one_add_le_exp_sum`, `mathlib:Real.exp_le_exp`, `mathlib:Finset.prod_Icc_div`, `mathlib:Finset.prod_le_prod_of_subset_of_one_le'`.

Regression contracts:

- `empty_euler_family`: The empty prime-family product is 1.
- `two_prime_finite_euler`: For P={2,3},N=2 the product is 19/16.

Source: Tao 2014, Section 4 Exercise 46(ii). Worker-derived finite positive-geometric proof of the source exercise. The source supplies the fixed-k target, not this exponential-moment proof or these explicit constants. No generic mean-value or independence theorem is asserted.

### Uniform exponential moment of repeated prime factors

- [ ] `ProbabilisticAndMetricNumberTheory:PM.0/excess-exponential-mean` — theorem; unchecked.

Declaration: `TauCeti.Probability.Arithmetic.excess_exponential_mean`.

For every M=m+1>=1, E_mu_M[exp(log(3/2)·D)]<=exp(2), with an absolute constant independent of M.

Hypotheses: m,n,N,k are natural. Where m occurs set M=m+1 and use mu_M, the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. Its support is 1,...,M, never zero. D(n)=(Omega(n):R)-(omega(n):R), with real casts before subtraction and the native cardFactors/cardDistinctFactors. D is nonnegative. Put a=3/2 and t=log(a)>0 only as local scalar notation; no new definition or carrier is exported. All finite sums use their displayed inclusive cutoffs.

Proof plan:

1. Apply excess-exponential-euler at M=m+1.
2. The native primesLE membership theorem supplies primality of every member; apply excess-finite-euler-bound to that finite set with cutoff M.
3. Compose the inequalities. This is a finite-sample theorem, not an assertion that the prime-power events are independent or that the distribution has a limit.

Prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/excess-exponential-euler`, `ProbabilisticAndMetricNumberTheory:PM.0/excess-finite-euler-bound`, `mathlib:Nat.mem_primesLE`.

Regression contracts:

- `exponential_singleton_sample`: For M=1 the exponential mean is 1.

Source: Tao 2014, Section 4 Exercise 46(ii). Worker-derived finite positive-geometric proof of the source exercise. The source supplies the fixed-k target, not this exponential-moment proof or these explicit constants. No generic mean-value or independence theorem is asserted.

### All fixed repeated-factor moments

- [ ] `ProbabilisticAndMetricNumberTheory:PM.0/excess-all-moments` — theorem; unchecked.

Declaration: `TauCeti.Probability.Arithmetic.excess_all_moments`.

For every natural k and M=m+1, E_mu_M[|D|^k]<=exp(2)·k!/[log(3/2)]^k. In particular sum_{n=1}^M D(n)^k is bounded by M times this explicit k-dependent constant.

Hypotheses: m,n,N,k are natural. Where m occurs set M=m+1 and use mu_M, the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. Its support is 1,...,M, never zero. D(n)=(Omega(n):R)-(omega(n):R), with real casts before subtraction and the native cardFactors/cardDistinctFactors. D is nonnegative. Put a=3/2 and t=log(a)>0 only as local scalar notation; no new definition or carrier is exported. All finite sums use their displayed inclusive cutoffs.

Proof plan:

1. D>=0 follows from distinct-factor cardinality at most total-factor cardinality (or the inherited nonnegative factorization sum). Thus |D|=D, including the arithmetic zero extension.
2. For t=log(3/2)>0, apply the native inequality (tD)^k/k!<=exp(tD). Both t^k and k! are strictly positive, even for k=0.
3. Rearrange pointwise to D^k<=[k!/t^k]exp(tD). Average over the finite positive sample using its native sum formula and then apply excess-exponential-mean.
4. The implied constant depends on k and is not claimed uniform in growing k. At k=0 the actual mean is one. The unnormalized sum version follows by multiplying by M; for a real cutoff x>=1, take M=floor(x)<=x.
5. This completes the worker proof decomposition of Exercise 46(ii)'s fixed-moment bound, not its surrounding omega variance estimate or the full Hardy-Ramanujan/Erdos-Kac theorems.

Prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/excess-exponential-mean`, `ProbabilisticAndMetricNumberTheory:PM.0/excess-factorization`, `mathlib:List.toFinset_card_le`, `mathlib:Real.pow_div_factorial_le_exp`, `mathlib:Real.log_pos`, `tauceti:TauCeti.Probability.integral_empiricalMeasure`.

Regression contracts:

- `excess_zeroth_moment`: The zeroth moment is exactly 1 for every positive sample, not zero.
- `excess_second_moment_eight`: For M=8 the second excess moment is 5/8.

Source: Tao 2014, Section 4 Exercise 46(ii). Worker-derived finite positive-geometric proof of the source exercise. The source supplies the fixed-k target, not this exponential-moment proof or these explicit constants. No generic mean-value or independence theorem is asserted.

### Exponential tail bound for repeated prime factors

- [ ] `ProbabilisticAndMetricNumberTheory:PM.0/excess-exponential-tail` — lemma; unchecked.

Declaration: `TauCeti.Probability.Arithmetic.excess_exponential_tail`.

For every M=m+1 and every real threshold u, mu_M{n:u<=D(n)}<=exp(2-log(3/2)·u), with inclusive threshold and real-valued probability.

Hypotheses: m,n,N,k are natural. Where m occurs set M=m+1 and use mu_M, the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. Its support is 1,...,M, never zero. D(n)=(Omega(n):R)-(omega(n):R), with real casts before subtraction and the native cardFactors/cardDistinctFactors. D is nonnegative. Put a=3/2 and t=log(a)>0 only as local scalar notation; no new definition or carrier is exported. All finite sums use their displayed inclusive cutoffs.

Proof plan:

1. The function exp(tD) is nonnegative and integrable for the finite empirical measure. Native Markov bounds exp(tu) times the probability of exp(tu)<=exp(tD) by its mean.
2. Because t>0 and exp preserves and reflects order, this event is exactly u<=D. There is no strict-versus-weak threshold change.
3. Divide by exp(tu)>0, use the exponential mean bound, and apply native exp_sub. The argument permits every real u; for u<=0 the bound may exceed one but remains valid.

Prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/excess-exponential-mean`, `mathlib:MeasureTheory.mul_meas_ge_le_integral_of_nonneg`, `mathlib:Real.exp_le_exp`, `mathlib:Real.exp_sub`, `mathlib:Real.log_pos`, `tauceti:TauCeti.Probability.integral_empiricalMeasure`.

Regression contracts:

- `excess_inclusive_tail_eight`: For M=8 the inclusive tail probability P(D>=2) is 1/8.

Source: Tao 2014, Section 4 Exercise 46(ii). Worker-derived finite positive-geometric proof of the source exercise. The source supplies the fixed-k target, not this exponential-moment proof or these explicit constants. No generic mean-value or independence theorem is asserted.

### Scaled repeated-factor moment bounds

- [ ] `ProbabilisticAndMetricNumberTheory:PM.0/excess-scaled-moments` — lemma; unchecked.

Declaration: `TauCeti.Probability.Arithmetic.excess_scaled_moments`.

For every natural k, M=m+1 and real s>0, E_mu_M[|D/s|^k]<=exp(2)·k!/([log(3/2)]^k·s^k).

Hypotheses: m,n,N,k are natural. Where m occurs set M=m+1 and use mu_M, the existing empiricalMeasure of k mapped to k+1 at index m, on discrete naturals. Its support is 1,...,M, never zero. D(n)=(Omega(n):R)-(omega(n):R), with real casts before subtraction and the native cardFactors/cardDistinctFactors. D is nonnegative. Put a=3/2 and t=log(a)>0 only as local scalar notation; no new definition or carrier is exported. All finite sums use their displayed inclusive cutoffs.

Proof plan:

1. Since s>0, |D/s|^k=|D|^k/s^k, with s^k>0 even when k=0.
2. Pull the positive scalar through the native finite empirical sum and apply excess-all-moments.
3. This gives the quantitative finite input for higher-moment comparisons at diverging scales. It does not assert an arithmetic Gaussian limit or a uniform growing-order estimate.

Prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/excess-all-moments`, `tauceti:TauCeti.Probability.integral_empiricalMeasure`.

Regression contracts:

- `scaled_second_moment_eight`: For M=8,s=2,k=2 the scaled moment is 5/32.
- `scaled_zeroth_moment`: At s=2,k=0 the scaled moment is 1 for every positive sample.

Source: Tao 2014, Section 4 Exercise 46(ii). Worker-derived finite positive-geometric proof of the source exercise. The source supplies the fixed-k target, not this exponential-moment proof or these explicit constants. No generic mean-value or independence theorem is asserted.

### Scope, source and endpoint checks

The geometric coefficient at exponent j>=2 is (1/2)(3/2)^(j-2). Including j=1
would incorrectly charge even a prime. For a prime p the local density ratio is
3/(2p), at most 3/4. Replacing the fixed base by 2 would give ratio one at p=2
and invalidate this uniform geometric bound.

The finite averaging proof uses the exact joint divisibility count floor(M/Q),
where Q is the product of the selected prime powers. The powers belong to
distinct primes. Repeating one prime as if its powers were coprime is invalid.
The constant choice has exponent zero and modulus one, so the empty expansion
term and the M=1 sample both work without exceptions.

The inclusive tail estimate is P(D>=u)<=exp(2-tu), for any real u. A threshold
at zero is allowed; the bound may exceed one. At k=0 the actual moment equals
one, and positive scale division does not change it.

Exercise 46 and its neighboring variance discussion, Theorem 47 and Exercise 51
were freshly reread from the same acquired author HTML, SHA-256
`c55a6de8d4c7d9292ea3bc739bd6339f4555a2bd53ec7f5e4f0a62b684a3dba3`.
Only those selected passages are claimed read. No new correction search,
version collation or source finding is claimed. All four findings and five
source-version records remain unchanged.

This completes the fixed repeated-factor moment proof plan, not the surrounding
omega variance/Mertens deduction, general Turan–Kubilius, full Hardy–Ramanujan
or Erdos–Kac. The existing weak-limit equivalence is still conditional on a
limit for one of the laws. All stronger growing-prime and growing-moment
requirements remain in the coverage ledger.

## Ownership and remaining inputs

The current continuation and its coverage ledger at the end of this document supersede earlier unplanned-stage placeholders. The inherited finite arithmetic estimates do not close the growing-prime or limit-law inputs. Existing Mathlib measures and arithmetic/continued-fraction carriers remain the foundation; cross-roadmap analytic inputs are requested from their current owners.

## Historical finite arithmetic verification

The `.lean` companion is a suggested signature skeleton, not the roadmap and not an
exhaustive file plan. This Markdown and the JSON mathematical contracts are definitive;
names and signatures are suggestions for implementation. Definitions, each of the seven
API declarations, five construction tests, ten finite-pattern examples, ten centered-moment
examples, eight finite-Gaussian examples, ten cutoff-removal examples and all comparison
statements are represented, together with nine full-residue declarations and 18 residue-law
acceptance cases. The repeated-factor section adds eight declarations and sixteen examples.
The law-transfer section adds eight declarations and sixteen examples.
The higher-moment section adds nine declarations and eighteen examples. All 76
declaration signatures and 111 example contracts elaborate at the pinned sources
with 187 expected placeholder warnings and no others.
The construction body is a planning placeholder too. Every node remains unchecked;
signature elaboration is not proof verification.

The official repository checker with the full pinned declaration index reports zero
errors and zero warnings. Earlier checkpoints reran the inherited 1,000 divisor,
25,000 joint-divisibility, 1,000 prime-pair and 2,680 weighted-moment cases, including
181 complete-period moment cases. They additionally checked 9,720 disjoint prime-pattern
cases (690 complete-period cases) and 1,920 summed-atom bounds for N=1,...,120 and
subsets of {2,3,5,7}. These computations are regression evidence, not proofs of the
universal statements. Separate proved Lean probes are recorded in the handoff; no
scratch scripts or source downloads are part of the deliverables.

The preceding centered-moment checks added 22,500 exact mixed-product cases (508 complete-period
cases), 625 tuple-model versus independently enumerated Boolean-model comparisons,
and 11,250 weighted moment cases (850 complete-period cases). A separate Lean probe
proves seven general auxiliary lemmas and seven examples with no placeholders or
warnings. These are historical diagnostics from the preceding continuation,
not a formal implementation of the packet.

Historical exact-rational checks compare 288 independent Boolean-atom models with
multinomial sums, 7,680 arithmetic moments with the finite parity bounds,
96 collision inequalities, 120 fixed-support bounds and 100 corrected allocation counts. They range over
all subsets of {2,3,5,7,11}, model orders 0 through 8, and sample sizes 1 through 30;
allocation counts cover k=1,...,20. A new scratch Lean probe proves one general
local-factor bound and six examples without placeholders or warnings. All 27
inherited node objects, construction API/tests and three source findings remain
unchanged. No whole stage is claimed complete.

The cutoff continuation preserves all 36 preceding node objects. Its new checks
cover 5,500 exact decompositions, 4,500 exact product bounds, 444,690 rational
pointwise binomial inequalities, 14,580 rational averaged transfers and 9,600
squared Cauchy–Schwarz inequalities. A separate 60-digit calculation checks
14,580 logarithmic/square-root transfer bounds; it is numerical evidence,
not an exact proof. The handoff records the ranges and error tolerance.
Three general scratch lemmas, a concrete prime-factor identity and eight examples
are proved without placeholders; the complete packet remains a plan.

The full-residue continuation adds the nine declarations above and preserves all
42 inherited node objects, all source findings and version records, and all
PM.1–PM.5 coverage. Its inherited-source claims are provenance from those earlier
checkpoints; the new source reading is the stated Tao passage and the pinned
baseline declarations. No new source finding or completed stage is asserted.

## Historical repeated-factor checkpoint verification

The historical inventory is 76 unchecked nodes: one construction, 55 lemmas, one
comparison and nineteen theorems. There are seven construction API entries,
39 packet test contracts (five construction tests and 34 lemma/theorem tests),
111 suggested examples, eight unchanged planets, 116 baseline declarations,
seventeen sources, four findings, five version records, six gaps and no requests.
No stage is closed; PM.2–PM.5 remain not_read.

The full suggested file elaborates with 187 expected placeholder warnings and
no others. All 8,482 reached Mathlib files byte-match the pin; two Tau Ceti modules
were freshly built from pinned sources. Six separate general scratch proofs
check the geometric identity, reindexed local density bound, reciprocal telescope,
factorial moment domination, joint prime-power divisibility and exponential tail
division. Six concrete arithmetic examples also compile without placeholders,
axioms or diagnostics. These are selected checks, not implementations of all
nine proposed declarations.

Exact fraction tests check 800 exponential means, 8,800 moments of orders 0–10,
44,000 scaled moments, 9,600 inclusive tails, 66 finite Euler mean chains,
615 local density bounds, 15,410 pointwise local expansions, 600 exponential
products, 4,096 prime-power joint counts and 399 telescoping sums. Alternating
log-series and positive exp-series with geometric tail bounds certify two rational
transcendental envelopes, so these comparisons use no floating point. Eight
mutations check the first-power term, cutoff, base-two ratio, repeated prime,
finite-sample independence, zero sampling, zeroth moment and inclusive threshold.
These are regressions, not universal or asymptotic proofs. All other counts above
are historical and were not rerun in this checkpoint.

All 67 inherited node objects and 106 baseline entries remain exact, along with
the construction API/tests, four findings and five version records. Only the Tao
2014 source gains a reading-scope entry; one pinned-code source record is added.
The other fifteen sources, PM.1–PM.5 coverage/gaps and all eight planets are unchanged.
Packet, source-envelope, preservation/DAG and four-file intake checks are run,
with a fresh consulted-input/link guard before publication.

## PM.2: asymptotic equidistribution on tori

The reviewed audit found PM.2 unbuilt. Neither library has a notion of an equidistributed sequence; Mathlib has only the density of an irrational rotation's orbit (`AddCircle.denseRange_zsmul_iff`) and its ergodicity (`AddCircle.ergodic_add_left`). This section decomposes the asymptotic core from Tao, *Higher order Fourier analysis*, §1.1.1, read in full in the author's copy (the 2010 blog notes are the same text, and were compared passage by passage). Everything reuses existing carriers. The definition is convergence of Tau Ceti's `empiricalMeasure` in Mathlib's `ProbabilityMeasure` topology; the torus is Mathlib's `UnitAddTorus` with its characters `mFourier`; and van der Corput's inequality is `ExponentialSumsAndCircleMethod:ES.0/q-vdc-lag-bound` at r = 1, which is not replanned.

Sequences are indexed by ℕ and averaged over 0, …, n, as `empiricalMeasure` does, whereas the source averages over 1, …, N. Equidistribution ignores any finite shift, and the API proves that (`asympEquidistributed_comp_add_iff`). The subsequent integer-indexed section supplies the two-sided indexing convention.

Reading the section turned up four misprints, recorded as `ProbabilisticAndMetricNumberTheory/E5`–`E8`. None is in the author's maintained errata list or the blog's corrected comments, and all four affect nothing:

- "left-hand side" for "right-hand side" in the proof of the van der Corput inequality;
- "leading coefficient shα_s n^{s−1}" for "shα_s" in the proof of Weyl's theorem;
- "this torus T" for "T′" after Proposition 1.1.5;
- "Example 1.1.7" for "Exercise 1.1.7" in Remark 1.1.19.

### `asymptotic-equidistribution` — Asymptotic equidistribution of a sequence

*definition* · planet **Asymptotic equidistribution**

For a topological space X with its Borel σ-algebra, a sequence x : ℕ → X and a Borel probability measure μ, AsympEquidistributed x μ means that the empirical measures of x converge to μ in ProbabilityMeasure X: Tendsto (TauCeti.Probability.empiricalMeasure x) atTop (𝓝 μ). Equivalently (1.1): (n+1)⁻¹ ∑_{i≤n} f(x i) → ∫ f dμ for every bounded continuous f, which for compact X is every f ∈ C(X). Tau Ceti's empiricalMeasure x n averages x 0, …, x n where the source averages x(1), …, x(N); the two notions agree because equidistribution ignores any finite shift of the index.

**Hypotheses.**
- X a topological space with a measurable structure for which open sets are measurable (OpensMeasurableSpace); compactness and metrizability are needed only for the Portmanteau and uniqueness items, never for the definition.
- x : ℕ → X; μ : ProbabilityMeasure X.

**Construction or proof, in steps.**
1. Define AsympEquidistributed x μ := Tendsto (empiricalMeasure x) atTop (𝓝 μ); no new measure or averaging carrier is introduced.
2. Characterise it by bounded continuous test functions: combine ProbabilityMeasure.tendsto_iff_forall_integral_tendsto (and its RCLike form for complex tests) with Tau Ceti's integral_empiricalMeasure, which evaluates ∫ f against the empirical measure as the average.
3. Index shift: the averages of x and of n ↦ x (n + m) differ by at most 2m‖f‖∞/(n+1) → 0, so the two notions coincide; this reconciles the ℕ-indexing with the source's [N] = {1, …, N}.
4. Uniqueness of μ from the Hausdorff property of ProbabilityMeasure X (instance t2Space, under HasOuterApproxClosed and BorelSpace), the formal counterpart of the source's appeal to the Riesz representation theorem.
5. Frequencies: Portmanteau (tendsto_measure_of_null_frontier_of_tendsto) applied to the empirical measures gives #{i ≤ n : x i ∈ E}/(n+1) → μ E whenever μ (frontier E) = 0, via empiricalMeasure_apply_toReal.
6. Positive lower density of visits to an open U with μ U > 0 (Exercise 1.1.2) from the lim-inf half of Portmanteau for open sets, and density of the range when μ charges every nonempty open set.

**API.**

| name | role | statement |
|---|---|---|
| `AsympEquidistributed` | constructor | Tendsto (TauCeti.Probability.empiricalMeasure x) atTop (𝓝 μ). |
| `asympEquidistributed_iff_integral_tendsto` | characterisation | AsympEquidistributed x μ ↔ ∀ f : X →ᵇ ℝ, (n+1)⁻¹ ∑_{i≤n} f (x i) → ∫ f dμ. |
| `asympEquidistributed_iff_integral_tendsto_complex` | characterisation | The same with bounded continuous complex-valued f; this is the form the Weyl criterion uses. |
| `asympEquidistributed_comp_add_iff` | structure | AsympEquidistributed (fun n => x (n + m)) μ ↔ AsympEquidistributed x μ. |
| `AsympEquidistributed.congr_of_eventuallyEq` | structure | Sequences that agree for all large n are equidistributed for the same measures. |
| `AsympEquidistributed.unique` | structure | Under HasOuterApproxClosed X and BorelSpace X, a sequence is equidistributed for at most one μ. |
| `AsympEquidistributed.tendsto_frequency` | relation | If μ (frontier E) = 0 then #{i ≤ n : x i ∈ E}/(n+1) → μ E (Portmanteau). |
| `AsympEquidistributed.eventually_frequency_ge` | relation | For open U with μ U > 0 there is c > 0 with #{i ≤ n : x i ∈ U}/(n+1) ≥ c for all large n. |
| `AsympEquidistributed.denseRange` | relation | If μ charges every nonempty open set, then x has dense range. |
| `asympEquidistributed_const_iff` | example | AsympEquidistributed (fun _ => p) μ ↔ μ = diracProba p. |

**Unit tests.** A wrong definition fails one of these.

- `asympEquidistributed.test_const_dirac` (computation) — AsympEquidistributed (fun _ => p) (diracProba p): the empirical measures are all diracProba p.
- `asympEquidistributed.test_dyadic_blocks` (non-example) — Source Example 1.1.1: on Bool, x n = true iff 2^{2j} ≤ n < 2^{2j+1} for some j is equidistributed for no μ, since the frequency of true oscillates between about 1/3 and 2/3. A definition by a lim inf or along a subsequence would accept it.
- `asympEquidistributed.test_alternating` (computation) — x n = decide (n % 2 = 1) on Bool is equidistributed for the uniform measure (PMF.uniformOfFintype Bool).toMeasure.
- `asympEquidistributed.test_update_first_term` (degenerate) — Changing x 0 does not change equidistribution: the source's [N] omits x(0), Tau Ceti's empiricalMeasure includes it.
- `asympEquidistributed.test_zero_not_haar` (non-example) — The constant sequence 0 in UnitAddCircle is not equidistributed for circleHaar: it is for diracProba 0, and limits are unique.

**Where it is used.**
- `total-asymptotic-equidistribution` — Total equidistribution asks for this along every progression q n + r.
- `weyl-criterion` — The Weyl criterion characterises this notion on the torus by exponential sums.
- `linear-equidistribution` — Linear sequences n α + β are equidistributed in this sense exactly when α is irrational.
- `van-der-corput-lemma` — The difference theorem deduces this notion from the same notion for every difference sequence.
- `weyl-polynomial-equidistribution` — Weyl's polynomial theorem is a statement in this notion.
- `uniform-distribution-mod-one` — Uniform distribution mod 1 of a real sequence is this notion for its image in ℝ/ℤ.
- `ProbabilisticAndMetricNumberTheory:PM.4` — Birkhoff averages along Gauss-map orbits are averages against these empirical measures.

**Acceptance tests.**
- A constant sequence at p is equidistributed for diracProba p and for nothing else.
- The source's Example 1.1.1 sequence is equidistributed for no μ at all.
- Changing finitely many terms, or shifting the index, never changes equidistribution.

**Dependencies.**
- On the pinned libraries: `tauceti:TauCeti.Probability.empiricalMeasure`, `tauceti:TauCeti.Probability.integral_empiricalMeasure`, `tauceti:TauCeti.Probability.empiricalMeasure_apply_toReal`, `mathlib:MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`, `mathlib:MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto`, `mathlib:MeasureTheory.ProbabilityMeasure.t2Space`, `mathlib:MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto`, `mathlib:MeasureTheory.diracProba`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 3, the definition (1.1). The definition: vague convergence of the empirical measures µ_N, equivalently convergence of the averages (1.1). Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 4, after (1.1). Uniqueness of the limit measure. Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 4, Exercise 1.1.1. The frequency characterisation; the node keeps the Portmanteau direction as API and plans the converse on the circle in uniform-distribution-mod-one. Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 4, Exercise 1.1.2. Positive lower density and dense range. Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 4, Example 1.1.1. The non-example test. Prose verbatim from the text layer of the author's PDF; formulas transcribed.

### `total-asymptotic-equidistribution` — Total asymptotic equidistribution

*definition*

TotallyAsympEquidistributed x μ means AsympEquidistributed (fun n => x (q * n + r)) μ for every q ≥ 1 and r ≥ 0: equidistribution along every infinite arithmetic progression of indices.

**Hypotheses.**
- The hypotheses of asymptotic-equidistribution.
- q, r : ℕ with q ≥ 1.

**Construction or proof, in steps.**
1. Define TotallyAsympEquidistributed x μ := ∀ q r : ℕ, 0 < q → AsympEquidistributed (fun n => x (q * n + r)) μ.
2. Taking q = 1 and r = 0 gives plain equidistribution.
3. Along n ↦ q' n + r', the sequence n ↦ x (q n + r) becomes n ↦ x ((q q') n + (q r' + r)), again a progression with q q' ≥ 1, so the notion is stable under passing to x (q n + r).

**API.**

| name | role | statement |
|---|---|---|
| `TotallyAsympEquidistributed` | constructor | ∀ q r : ℕ, 0 < q → AsympEquidistributed (fun n => x (q * n + r)) μ. |
| `TotallyAsympEquidistributed.asympEquidistributed` | structure | Total equidistribution implies equidistribution (q = 1, r = 0). |
| `TotallyAsympEquidistributed.comp_affine` | structure | If x is totally equidistributed then so is n ↦ x (q * n + r) for q ≥ 1. |

**Unit tests.** A wrong definition fails one of these.

- `totallyAsympEquidistributed.test_half_rotation` (non-example) — n ↦ n • (1/2 : ℝ/ℤ) is totally equidistributed for no μ: along 2n it is constantly 0 and along 2n + 1 constantly 1/2, though it is equidistributed for the average of the two Dirac masses.
- `totallyAsympEquidistributed.test_const` (computation) — The constant sequence at p is totally equidistributed for diracProba p.
- `totallyAsympEquidistributed.test_implies_plain` (degenerate) — q = 1, r = 0: TotallyAsympEquidistributed x μ → AsympEquidistributed x μ.

**Where it is used.**
- `linear-equidistribution` — Statement (ii) of the equidistribution theorem is total equidistribution of n α + β.

**Acceptance tests.**
- Total equidistribution implies equidistribution.
- n (1/2) in ℝ/ℤ is equidistributed for (δ₀ + δ_{1/2})/2 but not totally, for any μ.
- Constant sequences are totally equidistributed for their Dirac measure.

**Dependencies.**
- In this packet: `asymptotic-equidistribution`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 4, after (1.1). The definition. Prose verbatim from the text layer of the author's PDF; formulas transcribed.

### `torus-haar-probability` — Haar probability measure on the circle and the standard torus

*construction*

circleHaar : ProbabilityMeasure UnitAddCircle is AddCircle.haarAddCircle, and torusHaar d : ProbabilityMeasure (UnitAddTorus d) is Measure.pi (fun _ : d => AddCircle.haarAddCircle), for a finite index type d. They package the existing Haar measures as the probability measures that equidistribution on T and T^d refers to, and introduce no new measure.

**Hypotheses.**
- d a finite type (Fintype d); UnitAddTorus d = d → UnitAddCircle with the product topology and σ-algebra.

**Construction or proof, in steps.**
1. Define both as subtypes of Measure with the IsProbabilityMeasure instances of haarAddCircle and of a finite product of probability measures.
2. Show torusHaar d is an additive Haar measure (pi.isAddHaarMeasure) and equals volume, since volume on AddCircle 1 is 1 • haarAddCircle.
3. Compute ∫ mFourier k d(torusHaar d) = [k = 0], as in the proof of orthonormal_mFourier: the integral factorises over coordinates and ∫ fourier n dhaarAddCircle = [n = 0].

**API.**

| name | role | statement |
|---|---|---|
| `circleHaar` | constructor | ⟨AddCircle.haarAddCircle, inferInstance⟩ : ProbabilityMeasure UnitAddCircle. |
| `torusHaar` | constructor | ⟨Measure.pi (fun _ : d => AddCircle.haarAddCircle), _⟩ : ProbabilityMeasure (UnitAddTorus d). |
| `torusHaar_eq_volume` | compatibility | (torusHaar d : Measure (UnitAddTorus d)) = volume. |
| `circleHaar_eq_volume` | compatibility | (circleHaar : Measure UnitAddCircle) = volume. |
| `isAddHaarMeasure_torusHaar` | structure | torusHaar d is an additive Haar measure, in particular translation invariant. |
| `integral_mFourier_torusHaar` | characterisation | ∫ x, mFourier k x ∂torusHaar d = if k = 0 then 1 else 0. |
| `integral_fourier_circleHaar` | characterisation | ∫ y, fourier n y ∂circleHaar = if n = 0 then 1 else 0. |

**Unit tests.** A wrong definition fails one of these.

- `torusHaar.test_character_integral` (computation) — On UnitAddTorus (Fin 2), ∫ mFourier k d(torusHaar) = 0 for k = (1, −1); a counting or unnormalised measure gives a wrong value at k = 0.
- `torusHaar.test_zero_dim` (degenerate) — torusHaar (Fin 0) is the Dirac mass at the unique point 0 of the zero-dimensional torus.
- `torusHaar.test_marginal` (compatibility) — The pushforward of torusHaar (Fin 1) under x ↦ x 0 is circleHaar.
- `circleHaar.test_volume` (compatibility) — circleHaar is Mathlib's volume on UnitAddCircle, so interval lengths agree with Lebesgue measure on [0, 1).

**Where it is used.**
- `weyl-criterion` — The criterion is for equidistribution with respect to torusHaar d.
- `uniform-distribution-mod-one` — Uniform distribution mod 1 is equidistribution with respect to circleHaar.

**Acceptance tests.**
- For k ≠ 0 the character mFourier k integrates to 0; for k = 0 to 1.
- The zero-dimensional torus is a point and torusHaar is its Dirac mass.
- The one-coordinate marginal of torusHaar d is circleHaar.

**Dependencies.**
- On the pinned libraries: `mathlib:UnitAddTorus`, `mathlib:UnitAddCircle`, `mathlib:AddCircle.haarAddCircle`, `mathlib:MeasureTheory.Measure.pi.isHaarMeasure`, `mathlib:UnitAddTorus.mFourier`, `mathlib:UnitAddTorus.orthonormal_mFourier`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 5, before Proposition 1.1.2. Haar measure as the translation-invariant Borel probability measure, equal to Lebesgue measure on [0, 1)^d. Prose verbatim from the text layer of the author's PDF; formulas transcribed.

### `torus-irrational` — Irrational points of the torus

*definition*

α ∈ UnitAddTorus d is irrational if ∑ i, k i • α i ≠ 0 in UnitAddCircle for every nonzero k : d → ℤ, i.e. k · α ≠ 0 for every nonzero frequency. Equivalently mFourier k α ≠ 1 for every k ≠ 0. For one coordinate it is Mathlib's addOrderOf a = 0, the condition of AddCircle.denseRange_zsmul_iff and AddCircle.ergodic_add_left.

**Hypotheses.**
- d a finite type; α : UnitAddTorus d; the pairing k · α := ∑ i, k i • α i ∈ UnitAddCircle.

**Construction or proof, in steps.**
1. Define TorusIrrational α := ∀ k : d → ℤ, k ≠ 0 → ∑ i, k i • α i ≠ 0.
2. Relate to characters: mFourier k α = fourier 1 (∑ i, k i • α i), since toCircle is additive, and fourier 1 y = 1 iff y = 0 on UnitAddCircle.
3. For d with one element, identify it with addOrderOf a = 0: k • a = 0 for k ≠ 0 is exactly finite order.
4. Stability: m • α is irrational for every nonzero integer m, because k · (m • α) = (m k) · α and m k ≠ 0.

**API.**

| name | role | statement |
|---|---|---|
| `TorusIrrational` | constructor | ∀ k : d → ℤ, k ≠ 0 → ∑ i, k i • α i ≠ 0. |
| `torusIrrational_iff_mFourier` | characterisation | TorusIrrational α ↔ ∀ k ≠ 0, mFourier k α ≠ 1. |
| `mFourier_eq_fourier_sum` | compatibility | mFourier k α = fourier 1 (∑ i, k i • α i). |
| `torusIrrational_unique_iff` | compatibility | For d with exactly one element, TorusIrrational α ↔ addOrderOf (α default) = 0. |
| `TorusIrrational.zsmul` | structure | If α is irrational and m ≠ 0 then m • α is irrational. |
| `TorusIrrational.nsmul` | structure | If α is irrational and m ≠ 0 then m • α is irrational, for m : ℕ. |

**Unit tests.** A wrong definition fails one of these.

- `torusIrrational.test_mixed` (non-example) — ![√2, 1/2] is not irrational: k = (0, 2) kills it. A definition testing coordinates one at a time accepts it wrongly.
- `torusIrrational.test_sqrt2_sqrt3` (computation) — ![√2, √3] is irrational, by ℚ-linear independence of 1, √2, √3.
- `torusIrrational.test_empty` (degenerate) — Every α : UnitAddTorus (Fin 0) is irrational: there is no nonzero k.
- `torusIrrational.test_one_dim` (compatibility) — For a : UnitAddCircle, TorusIrrational (fun _ : Unit => a) ↔ addOrderOf a = 0, Mathlib's condition for dense and ergodic rotation.

**Where it is used.**
- `linear-equidistribution` — The equidistribution theorem is the equivalence of equidistribution of n α + β with irrationality of α.
- `weyl-polynomial-equidistribution` — Weyl's theorem assumes the leading coefficient irrational; the induction uses TorusIrrational.nsmul.

**Acceptance tests.**
- (√2, 1/2) is not irrational (k = (0, 2)), although √2 is.
- (√2, √3) is irrational.
- For an empty index type every point is irrational, matching the fact that every sequence equidistributes on a point.

**Dependencies.**
- On the pinned libraries: `mathlib:UnitAddTorus`, `mathlib:UnitAddTorus.mFourier`, `mathlib:fourier`, `mathlib:AddCircle.denseRange_zsmul_iff`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 6, Exercise 1.1.5 (iv). The definition. Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 5, after (1.2). The pairing Z^d × T^d → T used in the definition. Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 6, after Remark 1.1.4. The rational extreme, for the non-example test. Prose verbatim from the text layer of the author's PDF; formulas transcribed.

### `weyl-criterion` — Weyl equidistribution criterion

*theorem* · planet **Weyl equidistribution criterion**

A sequence x : ℕ → UnitAddTorus d is equidistributed for torusHaar d if and only if, for every nonzero k : d → ℤ, (n+1)⁻¹ ∑_{i≤n} mFourier k (x i) → 0.

**Hypotheses.**
- d a finite type; x : ℕ → UnitAddTorus d.

**Proof, in steps.**
1. Only if: mFourier k is a bounded continuous complex function with ∫ mFourier k d(torusHaar d) = 0 for k ≠ 0; apply the complex integral characterisation of the definition.
2. If: the hypothesis and the value 1 at k = 0 give convergence of the averages for every mFourier k, hence by linearity for every trigonometric polynomial, the span of the mFourier k.
3. The span is dense in C(UnitAddTorus d, ℂ) (span_mFourier_closure_eq_top). For f continuous and ε > 0 pick a trigonometric polynomial within ε uniformly; averages and integrals of f and of it differ by at most ε, so the lim sup of |average − ∫ f| is at most 2ε.
4. Every bounded continuous real function on the compact torus is a continuous complex function; conclude with the real integral characterisation.

**Acceptance tests.**
- For d empty the right side is vacuous and every sequence is equidistributed on the point.
- For d nonempty a constant sequence fails the criterion: its average at any k ≠ 0 is mFourier k (x 0), of modulus one.
- Only nonzero k are tested; the k = 0 average is identically 1.

**Dependencies.**
- In this packet: `asymptotic-equidistribution`, `torus-haar-probability`
- On the pinned libraries: `mathlib:UnitAddTorus.span_mFourier_closure_eq_top`, `mathlib:UnitAddTorus.mFourier`, `mathlib:MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 5, Proposition 1.1.2. The statement. Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 5, proof of Proposition 1.1.2. The density step of the proof. Prose verbatim from the text layer of the author's PDF; formulas transcribed.

### `weyl-criterion-projections` — Equidistribution in T^d through one-dimensional projections

*theorem*

x : ℕ → UnitAddTorus d is equidistributed for torusHaar d if and only if, for every nonzero k : d → ℤ, the sequence n ↦ ∑ i, k i • x n i in UnitAddCircle is equidistributed for circleHaar.

**Hypotheses.**
- d a finite type; x : ℕ → UnitAddTorus d.

**Proof, in steps.**
1. Apply weyl-criterion on T^d and on T (d = one point).
2. For nonzero k and nonzero m ∈ ℤ, fourier m (k · x) = mFourier (m k) x, and m k ≠ 0; so the one-dimensional criteria for all k · x are the d-dimensional criterion for all nonzero frequencies, each frequency m k being reached from k.

**Acceptance tests.**
- For d a single point it is weyl-criterion itself.
- Coordinatewise equidistribution is not enough: (√2 n, √2 n) has equidistributed coordinates but k = (1, −1) gives the constant 0.
- The frequency m k with m ≠ 0 is again nonzero, so no frequency is lost or gained.

**Dependencies.**
- In this packet: `weyl-criterion`, `torus-haar-probability`
- On the pinned libraries: `mathlib:fourier`, `mathlib:UnitAddTorus.mFourier`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 6, Corollary 1.1.3. The statement. Prose verbatim from the text layer of the author's PDF; formulas transcribed.

### `linear-equidistribution` — Equidistribution theorem for linear sequences

*theorem* · planet **Equidistribution theorem**

For α, β ∈ UnitAddTorus d the following are equivalent: (i) n ↦ n • α + β is equidistributed for torusHaar d; (ii) it is totally equidistributed; (iii) α is irrational (TorusIrrational α).

**Hypotheses.**
- d a finite type; α, β : UnitAddTorus d; n acts by natural-number scalar multiplication.

**Proof, in steps.**
1. (iii) ⇒ (i): by weyl-criterion it suffices that the averages of mFourier k (n α + β) = mFourier k β · ζⁿ vanish in the limit, where ζ = mFourier k α ≠ 1 by irrationality; the geometric sum ∑_{i≤n} ζ^i = (ζ^{n+1} − 1)/(ζ − 1) is bounded by 2/|ζ − 1|.
2. (iii) ⇒ (ii): along q n + r the sequence is n ↦ n • (q α) + (r α + β), and q α is irrational (TorusIrrational.nsmul); apply (iii) ⇒ (i).
3. (ii) ⇒ (i) is TotallyAsympEquidistributed.asympEquidistributed.
4. (i) ⇒ (iii): if k · α = 0 with k ≠ 0 then mFourier k (n α + β) = mFourier k β is constant of modulus one, so its averages do not tend to 0, contradicting weyl-criterion.

**Acceptance tests.**
- For d = 1, (i) implies Mathlib's density of the orbit (denseRange_zsmul_iff) via denseRange, and (iii) is its hypothesis addOrderOf α = 0.
- α = (√2, 1/2): not irrational, and the sequence is not equidistributed on T² (it lives on T × {0, 1/2}).
- β plays no role: the conditions do not depend on it.

**Dependencies.**
- In this packet: `weyl-criterion`, `asymptotic-equidistribution`, `total-asymptotic-equidistribution`, `torus-irrational`
- On the pinned libraries: `mathlib:geom_sum_eq`, `mathlib:AddCircle.denseRange_zsmul_iff`, `mathlib:AddCircle.ergodic_add_left`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 6, Exercise 1.1.5. Statements (i) and (ii); (iii) there is the ℤ-indexed version, not planned in this pass. Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 6, Exercise 1.1.5 (iv). Statement (iv), the irrationality condition. Prose verbatim from the text layer of the author's PDF; formulas transcribed.

### `van-der-corput-lemma` — Van der Corput's difference theorem

*theorem* · planet **van der Corput lemma**

If x : ℕ → UnitAddTorus d is such that for every h ≥ 1 the difference sequence n ↦ x (n + h) − x n is equidistributed for torusHaar d, then x is equidistributed for torusHaar d.

**Hypotheses.**
- d a finite type; x : ℕ → UnitAddTorus d; the hypothesis for every positive integer h.

**Proof, in steps.**
1. By weyl-criterion fix k ≠ 0 and put b(n) = mFourier k (x (n − 1)) for 1 ≤ n ≤ N and 0 otherwise, so |b| ≤ 1 and b vanishes outside (0, N].
2. Apply ES.0/q-vdc-lag-bound with A = 0, r = 1 and a ≡ 1 (1-periodic, bounded by one): H²|∑_{n≤N} b(n)|² ≤ (N + H − 1)(H·N + 2∑_{h=1}^{H−1} (H − h)|C(h)|), with C(h) = ∑_{n=1}^{N−h} b(n + h) conj b(n). This is the source's Lemma 1.1.6, which is therefore not replanned here.
3. For fixed h ≥ 1, C(h)/N = average of mFourier k (x (n + h) − x n) over n < N − h, up to O(h/N): it tends to 0 by weyl-criterion applied to the difference sequence (mFourier k is a character, so b(n+h) conj b(n) = mFourier k (x(n+h−1) − x(n−1))).
4. Divide by H²N² and let N → ∞ with H fixed: lim sup |average of mFourier k (x i)|² ≤ 1/H. Let H → ∞.

**Acceptance tests.**
- For x n = n² α with α = a/q rational the difference at h = q is constantly 0, so the hypothesis fails, as it must: x is periodic and not equidistributed.
- With d empty the statement is trivial.
- Only h ≥ 1 is assumed; the difference at h = 0 is constantly 0 and is never equidistributed for d nonempty.

**Dependencies.**
- In this packet: `weyl-criterion`, `torus-haar-probability`
- From other roadmaps: `ExponentialSumsAndCircleMethod:ES.0/q-vdc-lag-bound`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 8, Corollary 1.1.7. The statement; the ℤ-indexed version is not planned in this pass. Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 7, Lemma 1.1.6. The inequality the proof uses; ES.0/q-vdc-lag-bound at r = 1 supplies it in exact form. Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 8, end of the proof of Corollary 1.1.7. The limiting step. Prose verbatim from the text layer of the author's PDF; formulas transcribed.

### `weyl-polynomial-equidistribution` — Weyl's equidistribution theorem for polynomials

*theorem* · planet **Weyl equidistribution theorem for polynomials**

Let s ≥ 1 and α : ℕ → UnitAddTorus d with α s irrational. Then n ↦ ∑_{j=0}^{s} n^j • α j is equidistributed for torusHaar d.

**Hypotheses.**
- d a finite type; s ≥ 1; α 0, …, α s ∈ UnitAddTorus d, the higher values of α ignored; TorusIrrational (α s).

**Proof, in steps.**
1. Induct on s. For s = 1 the sequence is n • α 1 + α 0, and linear-equidistribution applies.
2. For s > 1 and h ≥ 1, P(n + h) − P(n) = ∑_{j<s} n^j • β_j with β_{s−1} = (s h) • α s, by the binomial theorem in each coefficient (n^j • is additive in the coefficient). Its leading coefficient s h α_s is irrational by TorusIrrational.nsmul.
3. By the induction hypothesis every difference sequence is equidistributed; conclude by van-der-corput-lemma.

**Acceptance tests.**
- For s = 1 it is the linear case, and the constant term plays no role.
- n² α with α rational, of denominator q, is periodic mod q and not equidistributed: the irrationality hypothesis cannot be dropped.
- Only the leading coefficient needs to be irrational: n² √2 + n/2 is equidistributed.

**Dependencies.**
- In this packet: `van-der-corput-lemma`, `linear-equidistribution`, `torus-irrational`, `asymptotic-equidistribution`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 8, Corollary 1.1.9. The statement; the node is the ℕ-indexed half. Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 9, proof of Corollary 1.1.9. The induction step. The printed 'leading coefficient shα_s n^{s−1}' is the leading term; the coefficient is shα_s (recorded as a misprint). Prose verbatim from the text layer of the author's PDF; formulas transcribed.

### `uniform-distribution-mod-one` — Uniform distribution modulo one

*theorem* · planet **Uniform distribution modulo one**

For a real sequence u : ℕ → ℝ the following are equivalent: (a) n ↦ (u n : ℝ/ℤ) is equidistributed for circleHaar; (b) for all 0 ≤ a ≤ b ≤ 1, #{i ≤ n : Int.fract (u i) ∈ [a, b)}/(n+1) → b − a; (c) for every nonzero integer k, (n+1)⁻¹ ∑_{i≤n} e(k u i) → 0. This is the classical definition of uniform distribution mod 1 and Weyl's criterion for it.

**Hypotheses.**
- u : ℕ → ℝ; UnitAddCircle = ℝ/ℤ with circleHaar; fourier k (u i) = e(k u i).

**Proof, in steps.**
1. (a) ⇔ (c) is weyl-criterion for d a single point, since fourier k of the class of u i is e(k u i).
2. (a) ⇒ (b): the image of [a, b) in ℝ/ℤ has frontier of at most two points, which are circleHaar-null, and its measure is b − a; apply AsympEquidistributed.tendsto_frequency.
3. (b) ⇒ (a): by (b) the averages of the indicator of every such arc converge to its length, hence by linearity for every step function on arcs. A continuous f on ℝ/ℤ is uniformly continuous, so it is within ε of a step function uniformly; conclude as in weyl-criterion. This is the circle case of the source's Exercise 1.1.1.

**Acceptance tests.**
- u n = n √2 satisfies all three.
- u n = log n satisfies none: its frequencies in [0, 1/2) oscillate.
- u n = n/2: the frequency of [0, 1/4) tends to 1/2, not 1/4, so (b) fails, although the frequency of [0, 1/2) is the correct 1/2.

**Dependencies.**
- In this packet: `asymptotic-equidistribution`, `torus-haar-probability`, `weyl-criterion`
- On the pinned libraries: `mathlib:Int.fract`, `mathlib:fourier`, `mathlib:MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 4, Exercise 1.1.1. The frequency characterisation, specialised to arcs of the circle. Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 5, before Proposition 1.1.2. Haar measure on T as Lebesgue measure on [0, 1). Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 5, Proposition 1.1.2. The criterion, at d = 1. Prose verbatim from the text layer of the author's PDF; formulas transcribed.

### Second pass: the rest of the asymptotic theory

The second pass finishes the asymptotic part of the source's §1.1.1. It adds doubly infinite sequences, the Weyl criterion for an arbitrary limit measure, total equidistribution through rational twists (Exercise 1.1.4), the ℤ-indexed equidistribution theorem (Exercise 1.1.5 (iii)) and the full criterion for polynomial sequences (Exercise 1.1.6). The last three nodes give the abelian Ratner theorems (Proposition 1.1.5 and Exercise 1.1.7): every polynomial sequence in a torus splits into a part totally equidistributed on a subtorus and a periodic part. A subtorus is the image of an integer matrix, following the source's SL_d(ℤ) normal form in §1.1.2, and its Haar measure is the pushforward of the standard one. The rational decomposition that produces it uses Mathlib's Smith normal form, where the source inducts on the dimension. One more misprint, `ProbabilisticAndMetricNumberTheory/E9`, is recorded: 'polynomials of degree s' in Exercise 1.1.7 should be 'of degree at most s'.

#### `asymptotic-equidistribution-int` — Equidistribution of doubly infinite sequences

*definition*

A sequence x : ℤ → X is asymptotically equidistributed for μ (AsympEquidistributedInt x μ) when both halves n ↦ x (n + 1) and n ↦ x (−(n + 1)), n ∈ ℕ, are AsympEquidistributed for μ; x(0) is omitted, as in the source. It is totally equidistributed when n ↦ x (q n + r) is AsympEquidistributedInt for every integer q ≥ 1 and every r ∈ ℤ.

**Hypotheses.**
- The hypotheses of asymptotic-equidistribution; x : ℤ → X; μ : ProbabilityMeasure X.

**Construction or proof, in steps.**
1. Define AsympEquidistributedInt x μ := AsympEquidistributed (fun n : ℕ => x (n + 1)) μ ∧ AsympEquidistributed (fun n : ℕ => x (-(n + 1))) μ.
2. Define TotallyAsympEquidistributedInt x μ := ∀ q : ℕ, 0 < q → ∀ r : ℤ, AsympEquidistributedInt (fun n => x (q * n + r)) μ.
3. The positive half with the shift by one is AsympEquidistributed (fun n : ℕ => x n) μ by asympEquidistributed_comp_add_iff, so the value x(0) never matters (the source's footnote 2).

**API.**

| name | role | statement |
|---|---|---|
| `AsympEquidistributedInt` | constructor | Both halves n ↦ x (n + 1) and n ↦ x (−(n + 1)) are AsympEquidistributed. |
| `TotallyAsympEquidistributedInt` | constructor | ∀ q ≥ 1, ∀ r : ℤ, AsympEquidistributedInt (fun n => x (q * n + r)). |
| `AsympEquidistributedInt.natCast` | relation | AsympEquidistributedInt x μ → AsympEquidistributed (fun n : ℕ => x n) μ. |
| `asympEquidistributedInt_update_zero` | structure | Changing x 0 does not change AsympEquidistributedInt. |
| `TotallyAsympEquidistributedInt.asympEquidistributedInt` | structure | Total implies plain (q = 1, r = 0). |
| `TotallyAsympEquidistributedInt.totallyAsympEquidistributed_natCast` | relation | Totally equidistributed on ℤ implies n ↦ x n totally equidistributed on ℕ. |

**Unit tests.** A wrong definition fails one of these.

- `asympEquidistributedInt.test_irrational_rotation` (computation) — n ↦ (n : ℝ) • ((√2 : ℝ) : UnitAddCircle) is AsympEquidistributedInt for circleHaar.
- `asympEquidistributedInt.test_one_sided` (non-example) — x n = if 0 ≤ n then 0 else n • √2 is not AsympEquidistributedInt for circleHaar, although its negative half is.
- `asympEquidistributedInt.test_zero_irrelevant` (degenerate) — Function.update x 0 p is AsympEquidistributedInt iff x is.

**Where it is used.**
- `linear-equidistribution-int` — Statement (iii) of Exercise 1.1.5 is total equidistribution on ℤ.
- `polynomial-equidistribution-criterion` — Statement (iii) of Exercise 1.1.6.
- `abelian-ratner-polynomial` — The source states the abelian Ratner theorems on ℤ.

**Acceptance tests.**
- n ↦ n α with α irrational in T is equidistributed on ℤ for circleHaar: both halves are linear sequences with irrational steps ±α.
- A sequence that is 0 for n ≥ 0 and n √2 for n < 0 is not: its positive half is constant.
- Changing x 0 does not change either notion.

**Dependencies.**
- In this packet: `asymptotic-equidistribution`, `total-asymptotic-equidistribution`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 4. The definition. Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 4, footnote 2. Omitting x(0) is harmless. Prose verbatim from the text layer of the author's PDF; formulas transcribed.

#### `weyl-criterion-general-measure` — Weyl's criterion for an arbitrary limit measure on the torus

*theorem*

For x : ℕ → UnitAddTorus d and any μ : ProbabilityMeasure (UnitAddTorus d), x is equidistributed for μ if and only if, for every k : d → ℤ, (n+1)⁻¹ ∑_{i≤n} mFourier k (x i) → ∫ mFourier k dμ. The measure μ is thus determined by its Fourier coefficients, and weyl-criterion is the case μ = torusHaar d.

**Hypotheses.**
- d a finite type; x : ℕ → UnitAddTorus d; μ a Borel probability measure on the torus.

**Proof, in steps.**
1. Only if: mFourier k is bounded continuous; use the complex integral characterisation of the definition.
2. If: by linearity the averages of every trigonometric polynomial converge to its μ-integral; trigonometric polynomials are dense in C(UnitAddTorus d, ℂ) (span_mFourier_closure_eq_top), and averages and integrals are 1-Lipschitz in the sup norm, so every continuous function converges (ε/3 argument), which is the definition on a compact space.

**Acceptance tests.**
- For μ = torusHaar d it is weyl-criterion, since ∫ mFourier k = [k = 0].
- For μ = diracProba p the criterion reads mFourier k (x i) averages → mFourier k p for all k.
- Two probability measures with the same Fourier coefficients are equal (take x equidistributed for one).

**Dependencies.**
- In this packet: `asymptotic-equidistribution`
- On the pinned libraries: `mathlib:UnitAddTorus.mFourier`, `mathlib:UnitAddTorus.span_mFourier_closure_eq_top`, `mathlib:MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 5, proof of Proposition 1.1.2. The argument of the proof, which uses nothing about Haar measure except the values of its Fourier coefficients; the source states only the Haar case. Prose verbatim from the text layer of the author's PDF; formulas transcribed.

#### `total-equidistribution-twisted-weyl` — Total equidistribution by rational twists

*theorem*

x : ℕ → UnitAddTorus d is totally equidistributed for torusHaar d if and only if, for every nonzero k : d → ℤ and every rational a/b (b ≥ 1), (n+1)⁻¹ ∑_{i≤n} mFourier k (x i) · e(a i / b) → 0.

**Hypotheses.**
- d a finite type; x : ℕ → UnitAddTorus d.

**Proof, in steps.**
1. If: for q ≥ 1 and r, the indicator of the progression {i ≡ r mod q} is a combination of the characters i ↦ e(a i / q), a = 0, …, q − 1 (finite Fourier inversion on ℤ/q); so the averages of mFourier k over the progression tend to 0, which by weyl-criterion is equidistribution of n ↦ x (q n + r).
2. Only if: split the average over residues i mod b; on each residue class e(a i / b) is constant, and the average of mFourier k along the class tends to 0 by total equidistribution and weyl-criterion.

**Acceptance tests.**
- With only the untwisted averages (a = 0) the condition is plain equidistribution, which is strictly weaker.
- x n = n • (1/2) in T: the twist a/b = 1/2 at k = 1 gives the constant average 1, so it is not totally equidistributed.
- Every twist can be taken with b ≤ the modulus of the progression one tests.

**Dependencies.**
- In this packet: `total-asymptotic-equidistribution`, `weyl-criterion`
- On the pinned libraries: `mathlib:UnitAddTorus.mFourier`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 6, Exercise 1.1.4. The statement. Prose verbatim from the text layer of the author's PDF; formulas transcribed.

#### `linear-equidistribution-int` — The equidistribution theorem on ℤ

*theorem*

For α, β ∈ UnitAddTorus d, n ↦ n • α + β (n ∈ ℤ) is totally equidistributed on ℤ for torusHaar d if and only if α is irrational.

**Hypotheses.**
- d a finite type; α, β : UnitAddTorus d.

**Proof, in steps.**
1. Along q m + r the two halves are m ↦ m • (q α) + (r α + β) and m ↦ m • (−q α) + (β − r α); the steps ±q α are irrational iff α is, so both reduce to linear-equidistribution on ℕ.
2. Conversely total equidistribution on ℤ gives equidistribution of the positive half, hence irrationality by linear-equidistribution.

**Acceptance tests.**
- For α rational, n α + β is periodic on ℤ and fails.
- It agrees with linear-equidistribution's (i)–(iii) on ℕ.
- β plays no role.

**Dependencies.**
- In this packet: `asymptotic-equidistribution-int`, `linear-equidistribution`, `torus-irrational`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 6, Exercise 1.1.5 (iii)–(iv). Statement (iii) and its equivalence with (iv). Prose verbatim from the text layer of the author's PDF; formulas transcribed.

#### `polynomial-equidistribution-criterion` — Equidistribution criterion for polynomial sequences

*theorem*

For P(n) = ∑_{j=0}^{s} n^j • α_j with α_0, …, α_s ∈ UnitAddTorus d, the following are equivalent: (i) n ↦ P(n) (n ∈ ℕ) is equidistributed for torusHaar d; (ii) it is totally equidistributed; (iii) n ↦ P(n) (n ∈ ℤ) is totally equidistributed on ℤ; (iv) there is no nonzero k : d → ℤ with k · α_1 = ⋯ = k · α_s = 0. Equivalently: for every nonzero k some k · α_j with 1 ≤ j ≤ s is irrational in T.

**Hypotheses.**
- d a finite type; s ≥ 1; α_0, …, α_s ∈ UnitAddTorus d.

**Proof, in steps.**
1. (iv) ⇔ 'for each k ≠ 0 some k · α_j (j ≥ 1) has infinite order': if all k · α_j have finite order, a common multiple m gives (m k) · α_j = 0.
2. By weyl-criterion-projections it suffices to treat k · P, a polynomial in T with coefficients k · α_j.
3. d = 1, (iv) ⇒ (ii): let j₀ be the largest j ≥ 1 with α_j of infinite order and Q a common order of the α_j with j > j₀. Along n = Q m + r the terms of degree > j₀ are constant, and the rest is a polynomial in m whose leading coefficient Q^{j₀} α_{j₀} has infinite order; weyl-polynomial-equidistribution (with the n ↦ Q m + r substitution preserving that leading coefficient up to the factor Q^{j₀}) makes n ↦ P(Q m + r) equidistributed for each r. For a general progression q m + r, split m further by its residue mod Q: each of the Q interleaved subsequences is of the previous kind (step q Q), so the progression is equidistributed.
4. (ii) ⇒ (i) trivially; (i) ⇒ (iv): if k ≠ 0 kills α_1, …, α_s then mFourier k (P(n)) = mFourier k (α_0) is constant of modulus one, so its averages do not tend to 0, contradicting weyl-criterion.
5. (iii) follows from (ii) for both halves, since P(−n) is again a polynomial with coefficients ± α_j; (iii) ⇒ (i) by restriction.

**Acceptance tests.**
- For s = 1 it is linear-equidistribution.
- P(n) = n²/2 + n/2 in T is constant 0 (n(n+1) is even): k = 2 kills both coefficients, as (iv) predicts.
- P(n) = n²/2 + n √2 is totally equidistributed, although its leading coefficient is rational: Weyl's theorem alone does not show this.

**Dependencies.**
- In this packet: `weyl-criterion-projections`, `weyl-polynomial-equidistribution`, `linear-equidistribution`, `total-asymptotic-equidistribution`, `asymptotic-equidistribution-int`, `weyl-criterion`, `torus-irrational`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 9, Exercise 1.1.6. Statements (i)–(iii). Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 9, Exercise 1.1.6 (iv). Statement (iv) and the reduction to d = 1. Prose verbatim from the text layer of the author's PDF; formulas transcribed.

#### `subtorus` — Subtori of the standard torus and their Haar measures

*definition*

A subtorus datum S of UnitAddTorus d consists of n : ℕ and an integer matrix M : Matrix d (Fin n) ℤ; its homomorphism is S.toHom : UnitAddTorus (Fin n) →+ UnitAddTorus d, y ↦ (i ↦ ∑_j M i j • y j), its carrier is the range (a compact connected subgroup), and its Haar measure S.haar is the pushforward of torusHaar (Fin n) along S.toHom. A character mFourier k of the big torus has S.haar-integral 1 if k vanishes on the carrier (k M = 0) and 0 otherwise, so S.haar depends only on the carrier. In the source's language S.carrier is a subtorus, and every subtorus arises this way with M the last d′ columns of some L⁻¹, L ∈ SL_d(ℤ) (Exercise 1.1.22).

**Hypotheses.**
- d a finite type; n : ℕ; M : Matrix d (Fin n) ℤ.

**Construction or proof, in steps.**
1. S.toHom is a continuous additive homomorphism (finite sums of integer multiples of coordinates).
2. carrier := S.toHom.range, compact (IsCompact.image of the compact torus) and connected (isConnected_range).
3. haar := ⟨map S.toHom (torusHaar (Fin n)), _⟩, a probability measure; haar (carrier) = 1.
4. integral_mFourier_haar: ∫ mFourier k d(S.haar) = ∫ mFourier (k M) d(torusHaar (Fin n)) = [k M = 0], by integral_map and integral_mFourier_torusHaar, since mFourier k ∘ S.toHom = mFourier (k M).
5. haar depends only on the carrier: k M = 0 iff mFourier k is 1 on the carrier, so two data with the same carrier have the same Fourier coefficients, hence equal measures (FiniteMeasure.ext_of_forall_integral_eq with density of trigonometric polynomials).
6. Translation invariance by carrier elements, from translation invariance of torusHaar (Fin n).

**API.**

| name | role | statement |
|---|---|---|
| `Subtorus` | constructor | Structure: n : ℕ, M : Matrix d (Fin n) ℤ. |
| `Subtorus.toHom` | data | UnitAddTorus (Fin n) →+ UnitAddTorus d, y ↦ (i ↦ ∑ j, M i j • y j). |
| `Subtorus.continuous_toHom` | structure | toHom is continuous. |
| `Subtorus.carrier` | data | The additive subgroup S.toHom.range. |
| `Subtorus.isCompact_carrier` | structure | The carrier is compact, hence closed. |
| `Subtorus.isConnected_carrier` | structure | The carrier is connected. |
| `Subtorus.haar` | constructor | The pushforward of torusHaar (Fin n) along toHom, as a ProbabilityMeasure. |
| `Subtorus.haar_carrier` | characterisation | S.haar (S.carrier) = 1. |
| `Subtorus.integral_mFourier_haar` | characterisation | ∫ mFourier k d(S.haar) = if k ᵥ* M = 0 then 1 else 0. |
| `Subtorus.mFourier_eq_one_iff` | characterisation | mFourier k is identically 1 on S.carrier iff k ᵥ* M = 0. |
| `Subtorus.haar_eq_of_carrier_eq` | structure | S.carrier = S'.carrier → S.haar = S'.haar. |
| `Subtorus.top` | example | The full torus: n = #d, M = 1, with haar = torusHaar d. |
| `Subtorus.bot` | example | The zero subtorus: n = 0, with haar = diracProba 0. |

**Unit tests.** A wrong definition fails one of these.

- `subtorus.test_top` (compatibility) — (Subtorus.top d).haar = torusHaar d.
- `subtorus.test_bot` (degenerate) — (Subtorus.bot d).haar = diracProba 0.
- `subtorus.test_diagonal` (computation) — For the diagonal of T² (M = column (1, 1)): ∫ mFourier (1, −1) = 1 and ∫ mFourier (1, 0) = 0; a measure spread over all of T² gives 0 for both.
- `subtorus.test_non_injective` (non-example) — M = (2) on T: toHom is x ↦ 2x, not injective, yet the carrier is all of T and haar = circleHaar. A definition that required toHom to be injective, or that weighted by the kernel, would treat this parametrisation of T differently from M = (1).

**Where it is used.**
- `torus-rational-decomposition` — The rational decomposition produces the subtorus on which the irrational part lives.
- `abelian-ratner-polynomial` — The abelian Ratner theorem equidistributes P′ for S.haar.
- `abelian-ratner-linear` — The linear case equidistributes n • α′ for S.haar.

**Acceptance tests.**
- The full torus (n = #d, M = 1) has haar = torusHaar d.
- The zero subtorus (n = 0) has haar = diracProba 0.
- The diagonal of T² (M = column (1, 1)) has ∫ mFourier (1, −1) = 1 and ∫ mFourier (1, 0) = 0.

**Dependencies.**
- In this packet: `torus-haar-probability`
- On the pinned libraries: `mathlib:UnitAddTorus.mFourier`, `mathlib:MeasureTheory.Measure.map`, `mathlib:MeasureTheory.integral_map`, `mathlib:IsCompact.image`, `mathlib:isConnected_range`, `mathlib:MeasureTheory.FiniteMeasure.ext_of_forall_integral_eq`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.2, printed p. 16, complexity of a subtorus. The source's description of a subtorus as the preimage of T^{d′} × {0} under L ∈ SL_d(Z); the node's M is the corresponding block of L⁻¹. Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.2, printed pp. 16–17, Exercise 1.1.22. Every compact connected subgroup is of this form; that identification is not planned in this pass (see coverage). Prose verbatim from the text layer of the author's PDF; formulas transcribed.

#### `torus-rational-decomposition` — Rational decomposition of torus points along a subtorus

*lemma*

Let α_1, …, α_s ∈ UnitAddTorus d and Γ := {k : d → ℤ | every k · α_j has finite order}. Then there is a subtorus datum S with S.toHom injective such that (a) k vanishes on S.carrier iff k ∈ Γ, and (b) every α_j = α′_j + α″_j with α′_j ∈ S.carrier and α″_j of finite order.

**Hypotheses.**
- d a finite type; α_1, …, α_s ∈ UnitAddTorus d.

**Proof, in steps.**
1. Γ is a saturated subgroup of ℤ^d: if m k ∈ Γ with m ≠ 0 then k ∈ Γ, because k · α has finite order iff m k · α does.
2. Smith normal form (Submodule.smithNormalForm) for Γ ≤ ℤ^d gives a basis b of ℤ^d with Γ = span(a_1 b_1, …, a_r b_r); saturation forces a_i = ±1, so Γ = span(b_1, …, b_r) is a direct summand.
3. Let L be the matrix with rows b_1, …, b_d (in GL_d(ℤ)); L acts on the torus as an automorphism. Take S := the image of {0}^r × T^{d−r} under L⁻¹, i.e. M := the last d − r columns of L⁻¹; toHom is injective.
4. (a): k vanishes on S.carrier iff k L⁻¹ has zero last d − r entries iff k ∈ span(b_1, …, b_r) = Γ.
5. (b): in the coordinates y = L α_j the first r entries b_i · α_j have finite order; subtract the torsion point with those first r entries (and zeros elsewhere) pulled back by L⁻¹, leaving α′_j with first r coordinates zero, i.e. in S.carrier.

**Acceptance tests.**
- If every α_j is irrational in the sense of torus-irrational, Γ = 0 and S is the whole torus with α″_j = 0.
- If every α_j has finite order, Γ = ℤ^d and S is the zero subtorus.
- For α = (√2, 1/2) in T², Γ = ℤ (0, 1), S = T × {0}, α′ = (√2, 0), α″ = (0, 1/2).

**Dependencies.**
- In this packet: `subtorus`, `torus-irrational`
- On the pinned libraries: `mathlib:Submodule.smithNormalForm`, `mathlib:IsOfFinOrder`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 7, proof of Proposition 1.1.5. The source splits off one primitive k′ at a time and inducts on the dimension; the lemma does all of Γ at once by Smith normal form, which also yields the subtorus in the SL_d(Z) form of §1.1.2. Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.2, printed p. 16. The SL_d(Z) normal form of a subtorus. Prose verbatim from the text layer of the author's PDF; formulas transcribed.

#### `abelian-ratner-polynomial` — Equidistribution theorem for abelian polynomial sequences

*theorem*

For P(n) = ∑_{j=0}^{s} n^j • α_j with α_0, …, α_s ∈ UnitAddTorus d there are a subtorus datum S and a decomposition P = P′ + P″, where P′(n) = ∑_{j=1}^{s} n^j • α′_j with every α′_j ∈ S.carrier and P″(n) = α_0 + ∑_{j=1}^{s} n^j • α″_j with every α″_j (j ≥ 1) of finite order, such that n ↦ P′(n) is totally equidistributed for S.haar on ℕ and on ℤ. P″ is periodic, and P is equidistributed for the average, over one period of P″, of the translates of S.haar by P″(n): a finite combination of Haar measures of cosets of S.carrier.

**Hypotheses.**
- d a finite type; s ≥ 0; α_0, …, α_s ∈ UnitAddTorus d.

**Proof, in steps.**
1. Apply torus-rational-decomposition to α_1, …, α_s to get S (with injective toHom) and α_j = α′_j + α″_j.
2. P″ is periodic: each α″_j has finite order, so n ↦ n^j • α″_j is periodic with period the order.
3. Total equidistribution of P′ for S.haar: by weyl-criterion-general-measure and integral_mFourier_haar it suffices that, for k not vanishing on S.carrier, the averages of mFourier k (P′(q n + r)) tend to 0. Write α′_j = S.toHom β_j; then mFourier k (P′(m)) = mFourier (k M) (∑ m^j • β_j). If all (k M) · β_j = k · α′_j had finite order, then so would all k · α_j, so k ∈ Γ and k vanishes on the carrier, a contradiction; hence polynomial-equidistribution-criterion (iv) holds for the polynomial ∑ m^j • β_j in T^n at frequency k M, which is nonzero, and the averages tend to 0 along every progression.
4. The ℤ statement follows in the same way from (iii) of the criterion.
5. The limit law of P: along each residue class mod a period Q of P″, P = P′ + constant, and P′ restricted to that class is equidistributed for S.haar; average over the Q classes.

**Acceptance tests.**
- If every α_j (j ≥ 1) is irrational, S is the whole torus and P″ = α_0: this is weyl-polynomial-equidistribution strengthened to total equidistribution.
- The source's example n ↦ (√2 n, n²/3) is equidistributed for (1/3)·Haar(T × {0}) + (2/3)·Haar(T × {1/3}).
- For s = 1 it is abelian-ratner-linear.

**Dependencies.**
- In this packet: `torus-rational-decomposition`, `subtorus`, `polynomial-equidistribution-criterion`, `weyl-criterion-general-measure`, `asymptotic-equidistribution-int`, `total-asymptotic-equidistribution`
- On the pinned libraries: `mathlib:Function.Periodic`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 9, Exercise 1.1.7. The statement. The printed 'P′, P′′ are polynomials of degree s' should read 'of degree at most s' (P′′ can be constant); recorded as a misprint. Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 9, after Exercise 1.1.7. The consequence for the limit law. Prose verbatim from the text layer of the author's PDF; formulas transcribed.

#### `abelian-ratner-linear` — Equidistribution for abelian linear sequences

*theorem*

For α, β ∈ UnitAddTorus d there are a subtorus datum S and α = α′ + α″ with α′ ∈ S.carrier and α″ of finite order, such that n ↦ n • α′ is totally equidistributed for S.haar on ℕ and on ℤ, and n ↦ n • α″ + β is periodic.

**Hypotheses.**
- d a finite type; α, β : UnitAddTorus d.

**Proof, in steps.**
1. The case s = 1 of abelian-ratner-polynomial, with α_1 = α and α_0 = β.
2. The source's own proof inducts on d, splitting off one primitive k′ with k′ · α rational at a time; the Smith-normal-form route of torus-rational-decomposition replaces that induction.

**Acceptance tests.**
- For α irrational, S is the whole torus and α″ = 0: linear-equidistribution.
- For α = (√2, 1/2): S = T × {0}, α′ = (√2, 0), α″ = (0, 1/2).
- For α of finite order, S is the zero subtorus and the sequence is periodic.

**Dependencies.**
- In this packet: `abelian-ratner-polynomial`, `torus-rational-decomposition`

**Sources.**
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 7, Proposition 1.1.5. The statement. Prose verbatim from the text layer of the author's PDF; formulas transcribed.
- Terence Tao, *Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori* — §1.1.1, printed p. 6. The rational extreme. Prose verbatim from the text layer of the author's PDF; formulas transcribed.

### Remaining in PM.2

- Tao §1.1.1 (asymptotic theory) is now decomposed in full except Exercises 1.1.1–1.1.3 beyond their Portmanteau directions, the recurrence Exercise 1.1.8 and the multidimensional Definition 1.1.10 and Exercises 1.1.9–1.1.15.
- Exercise 1.1.22 (every compact connected subgroup of T^d is the carrier of a subtorus datum) is not planned; the subtorus node takes the SL_d(Z) description as its definition.
- Discrepancy and Borel normality now have nodes in the continuation below, with exact source-proof and native digit/circle bridge gaps.
- Single-scale (quantitative) equidistribution, §1.1.2 of the same source, is not planned; ES and AC consumers should say whether they need it.

## PM.3: the Duffin–Schaeffer theorem (Koukoulopoulos–Maynard)

This section follows Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture*, Ann. of Math. 192 (2020), 251–307, read completely in the publisher PDF.

Take ψ: ℕ → ℝ≥0. The reduced approximation sets 𝒜_q collect the points of [0,1] within ψ(q)/q of a reduced fraction a/q. The theorem says that 𝒜 = limsup 𝒜_q has measure 1 exactly when Σφ(q)ψ(q)/q diverges.

Mathlib already provides the two probabilistic inputs:
- Borel–Cantelli, which gives the convergence half;
- Gallagher's zero-one law (`AddCircle.addWellApproximable_ae_empty_or_univ`), on the circle with open balls. The approximation-set node gives the translation.

The proof is then a second-moment argument. It reduces to an edge bound for "GCD graphs" (Proposition 6.3), which is proved by a compression iteration. The iteration adds one prime at a time to the multiplicative data while controlling a *quality* that mixes edge density with the size of the vertex sets. Every step of that iteration is finite combinatorics on weighted bipartite graphs, and is planned below as its own node.

Khinchin's theorem is derived here from Catlin's conjecture (Theorem 2), using a comparison of Σψ with Σφψ/q for decreasing ψ. So the whole of Khinchin's metric theorem rests on this chain.

### Approximation sets and the main theorems

#### `duffin-schaeffer-sets` — Duffin–Schaeffer approximation sets 𝒜_q, 𝒜, 𝒦_q and 𝒦

*definition* · planet **Duffin–Schaeffer approximation sets** · proposed `TauCeti.DuffinSchaeffer.dsSet`

For ψ: ℕ → ℝ_{≥0} and q ≥ 1 let 𝒜_q = [0,1] ∩ ⋃_{1≤a≤q, gcd(a,q)=1} [a/q − ψ(q)/q, a/q + ψ(q)/q] (1.3), and let 𝒜 = limsup_{q→∞} 𝒜_q, the set of α ∈ [0,1] lying in infinitely many 𝒜_q (1.4). Khinchin's 𝒦_q (1.2) uses every 0 ≤ a ≤ q, and 𝒦 = limsup 𝒦_q.

**Hypotheses.**
- ψ is arbitrary and nonnegative; the intervals are closed, as in the source.
- Mathlib's addWellApproximable on UnitAddCircle is the open-ball version of 𝒜 on the circle. The two agree up to the choice of radius: the open version for ψ lies in 𝒜, and an irrational point of 𝒜 lies in the open version for 2ψ. Since Σφ(q)ψ(q)/q and Σφ(q)ψ(q)/(2q) diverge together, every statement of this layer transfers between the conventions.

**Construction or proof, in steps.**
1. Define 𝒜_q, 𝒦_q as finite unions of closed intervals intersected with [0,1], and 𝒜, 𝒦 as Filter.limsup along atTop.
2. Measure bounds: 𝒜_q is a union of φ(q) intervals of length 2ψ(q)/q, so λ(𝒜_q) ≤ 2φ(q)ψ(q)/q. When ψ(q) ≤ 1/2 the intervals around a/q with 1 ≤ a ≤ q−1 are disjoint up to endpoints and lie in [0,1], and for q = 1 half of the interval survives; so λ(𝒜_q) ≥ φ(q)ψ(q)/q.
3. Circle comparison: for x ∈ [0,1] and q ≥ 2, if the circle distance from x to a reduced m/q is less than δ, then some reduced a/q with 1 ≤ a ≤ q (m or its reflection q − m) is within δ of x on the line; q = 1 affects only one index. Conversely an irrational x in the closed interval of radius ψ(q)/q has ψ(q) > 0 and lies in the open interval of radius 2ψ(q)/q.

**API.**

| name | role | statement |
|---|---|---|
| `TauCeti.DuffinSchaeffer.dsLimsup` | data | 𝒜 = limsup_{q→∞} 𝒜_q. |
| `TauCeti.DuffinSchaeffer.khinchinSet` | data | Khinchin's 𝒦_q, over every 0 ≤ a ≤ q. |
| `TauCeti.DuffinSchaeffer.khinchinLimsup` | data | 𝒦 = limsup 𝒦_q. |
| `TauCeti.DuffinSchaeffer.volume_dsSet_le` | other | λ(𝒜_q) ≤ 2φ(q)ψ(q)/q for ψ ≥ 0. |
| `TauCeti.DuffinSchaeffer.le_volume_dsSet` | other | λ(𝒜_q) ≥ φ(q)ψ(q)/q for q ≥ 1 and 0 ≤ ψ(q) ≤ 1/2. |
| `TauCeti.DuffinSchaeffer.dsSet_mono` | relation | 𝒜_q is monotone in ψ. |
| `TauCeti.DuffinSchaeffer.dsSet_subset_khinchinSet` | relation | 𝒜_q ⊆ 𝒦_q. |
| `TauCeti.DuffinSchaeffer.mem_dsLimsup_of_mem_addWellApproximable` | compatibility | For x ∈ [0,1], if the image of x on the circle is in Mathlib's addWellApproximable for δ(n) = ψ(n)/n, then x ∈ 𝒜. |
| `TauCeti.DuffinSchaeffer.mem_addWellApproximable_of_mem_dsLimsup` | compatibility | An irrational x ∈ 𝒜 maps into addWellApproximable for δ(n) = 2ψ(n)/n. |

**Unit tests.** A wrong definition fails one of these.

- `duffin-schaeffer-sets.test_dsSet_one_half` (computation) — With ψ ≡ 1/2, 𝒜_1 = [1/2, 1]: only the interval around 1/1 is present, cut at 1.
- `duffin-schaeffer-sets.test_dsSet_two_half` (computation) — With ψ ≡ 1/2, 𝒜_2 = [1/4, 3/4]: only a = 1 is coprime to 2.
- `duffin-schaeffer-sets.test_volume_dsSet_zero` (degenerate) — ψ ≡ 0 gives λ(𝒜_q) = 0: 𝒜_q is a finite set of reduced fractions.
- `duffin-schaeffer-sets.test_khinchinSet_ne_dsSet` (non-example) — With ψ ≡ 1/2, 0 ∈ 𝒦_2 but 0 ∉ 𝒜_2: the non-reduced fraction 0/2 is used by Khinchin's set and not by the Duffin–Schaeffer set.

**Where it is used.**
- Koukoulopoulos–Maynard Theorem 1 and (1.5) — The limsup set whose measure is determined.
- Koukoulopoulos–Maynard Theorem 2 and Khinchin's theorem — The non-reduced set 𝒦.
- Mathlib AddCircle.addWellApproximable_ae_empty_or_univ — Gallagher's zero-one law, transported to 𝒜 through the compatibility items.
- DiophantineApproximationAndTranscendence:DT.0 (library audit duplicate note) — Approximation exponents whose almost-everywhere behaviour these sets describe.

**Acceptance tests.**
- min{ψ(q), 1/2} ≤ λ(𝒦_q) ≤ 2 min{ψ(q), 1/2} (p. 252) follows in the same way; only the upper bound is used.

**Dependencies.**
- On the pinned libraries: `mathlib:Nat.totient`, `mathlib:UnitAddCircle.mem_addWellApproximable_iff`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §1, (1.2)–(1.4), pp. 252–253. The sets and the reason for reduced fractions.
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §1, (1.2), p. 252. The measure bounds.

#### `duffin-schaeffer-convergence` — The convergence half (1.5)

*lemma* · proposed `TauCeti.DuffinSchaeffer.volume_dsLimsup_eq_zero`

If ψ ≥ 0 and Σ_q φ(q)ψ(q)/q < ∞, then λ(𝒜) = 0.

**Hypotheses.**
- No monotonicity or size condition on ψ.

**Proof, in steps.**
1. λ(𝒜_q) ≤ 2φ(q)ψ(q)/q, so Σ λ(𝒜_q) < ∞.
2. Borel–Cantelli (Mathlib measure_limsup_atTop_eq_zero) gives λ(limsup 𝒜_q) = 0.

**Acceptance tests.**
- This is the 'easy' direction of the Duffin–Schaeffer conjecture (1.5).

**Dependencies.**
- In this packet: `duffin-schaeffer-sets`
- On the pinned libraries: `mathlib:MeasureTheory.measure_limsup_atTop_eq_zero`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §1, (1.5), p. 253. The statement and its one-line proof.

#### `duffin-schaeffer-theorem` — The Duffin–Schaeffer theorem (Koukoulopoulos–Maynard Theorem 1)

*theorem* · planet **Duffin–Schaeffer theorem** · proposed `TauCeti.DuffinSchaeffer.volume_dsLimsup_eq_one`

Let ψ: ℕ → ℝ_{≥0} with Σ_{q≥1} ψ(q)φ(q)/q = ∞. Then the set 𝒜 of α ∈ [0,1] for which |α − a/q| ≤ ψ(q)/q has infinitely many coprime solutions a, q has Lebesgue measure 1.

**Hypotheses.**
- ψ is arbitrary. The proof below works with the open intervals of Mathlib's addWellApproximable (same measures, contained in 𝒜), which is enough since a set of measure 1 inside 𝒜 ⊆ [0,1] forces λ(𝒜) = 1.

**Proof, in steps.**
1. Split ψ = ψ₁ + ψ₂ with ψ₁ = ψ·𝟙_{ψ>1/2}. If Σψ₁φ/q = ∞, Lemma 5.2 (PM.3/duffin-schaeffer-large-values) gives λ(𝒜(ψ₁)) = 1 and 𝒜(ψ₁) ⊆ 𝒜(ψ). Otherwise Σψ₂φ/q = ∞ and 𝒜(ψ₂) ⊆ 𝒜(ψ); so assume ψ ≤ 1/2.
2. Gallagher's zero-one law (Mathlib addWellApproximable_ae_empty_or_univ; ψ(q)/q → 0 because ψ ≤ 1/2) makes the open-interval limsup set null or full, so it suffices to show it has positive measure.
3. For large X pick Y minimal with Σ_{X≤q≤Y} φ(q)ψ(q)/q ∈ [1,2]; this exists because every term is at most 1/2. Since 𝒜 = ⋂_j ⋃_{q≥j} 𝒜_q, it suffices that λ(⋃_{X≤q≤Y} 𝒜_q) ≫ 1 uniformly in X (5.5).
4. By the second-moment union bound, λ(⋃𝒜_q)·Σ_{q,r} λ(𝒜_q ∩ 𝒜_r) ≥ (Σλ(𝒜_q))² ≥ 1, so it suffices that Σ_{X≤q,r≤Y} λ(𝒜_q ∩ 𝒜_r) ≪ 1 (5.6). The diagonal contributes at most 4.
5. Off the diagonal apply the overlap estimate (Lemma 5.3, with the indicator 1_{2M ≥ gcd}; E10). Pairs whose prime product ∏(1+1/p) is below e^{100} contribute at most 4e^{100}.
6. For the other pairs Σ_{p | qr/gcd²} 1/p ≥ 100. Let j be maximal with Σ_{p | qr/gcd², p ≥ exp exp j} 1/p ≥ 10. By Mertens' theorem (requested from AN.2), ∏_{p > M/gcd}(1+1/p) ≪ 1 if M/gcd ≥ exp exp j and ≪ e^j otherwise, and in the latter case (q,r) ∈ ℰ_{exp exp j}.
7. So (5.7) reduces to Σ_{j≥0} e^j Σ_{(q,r)∈ℰ_{exp exp j}} μ(q)μ(r) ≪ 1 (5.8), which follows from Proposition 5.4: the inner sum is O(1/exp exp j) and Σ e^j/exp exp j < ∞.

**Acceptance tests.**
- ψ(q) = 1/q (Dirichlet's theorem regime) gives Σφ(q)/q² = ∞ and λ(𝒜) = 1.
- The convergence half is PM.3/duffin-schaeffer-convergence; together they give the zero-one dichotomy with an explicit criterion.
- Mathlib's WellApproximable.lean records that this theorem is not formalized there.

**Dependencies.**
- In this packet: `duffin-schaeffer-sets`, `duffin-schaeffer-large-values`, `overlap-estimate`, `second-moment-bound`, `second-moment-union-bound`
- On the pinned libraries: `mathlib:AddCircle.addWellApproximable_ae_empty_or_univ`
- Other roadmaps (requested): `AnalyticNumberTheory:AN.2`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §1, Theorem 1, p. 253. The theorem.
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §5, proof of Theorem 1 assuming Proposition 5.4, pp. 265–268. The reduction; Lemma 5.1 is replaced by Mathlib's formal Gallagher theorem.

#### `catlin-reduction` — Catlin's reduction to reduced fractions (2.2)

*lemma* · proposed `TauCeti.DuffinSchaeffer.catlin_reduction`

Let 0 ≤ ψ ≤ 1/2 and define ξ by ξ(q)/q = max_{n ∈ ℕ, q | n} ψ(n)/n. Then 𝒞 \ ℚ = 𝒦 \ ℚ, where 𝒞 = limsup 𝒞_q is the Duffin–Schaeffer set for ξ and 𝒦 is Khinchin's set for ψ.

**Hypotheses.**
- The maximum exists because ψ(n)/n ≤ 1/(2n) → 0.

**Proof, in steps.**
1. If α ∈ 𝒞 \ ℚ, pick infinitely many reduced aⱼ/qⱼ with |α − aⱼ/qⱼ| ≤ ξ(qⱼ)/qⱼ = ψ(nⱼ)/nⱼ for some multiple nⱼ of qⱼ. Then mⱼ = aⱼnⱼ/qⱼ satisfies |α − mⱼ/nⱼ| ≤ ψ(nⱼ)/nⱼ, and nⱼ ≥ qⱼ → ∞, so α ∈ 𝒦.
2. If α ∈ 𝒦 \ ℚ, reduce mⱼ/nⱼ to aⱼ/qⱼ with qⱼ | nⱼ, so |α − aⱼ/qⱼ| ≤ ψ(nⱼ)/nⱼ ≤ ξ(qⱼ)/qⱼ. Infinitely many aⱼ/qⱼ are distinct, since otherwise |α − a/q| ≤ 1/(2nⱼ) → 0 forces α = a/q ∈ ℚ.

**Acceptance tests.**
- Rational α are excluded on both sides: they may lie in 𝒦 through infinitely many non-reduced representations.

**Dependencies.**
- In this packet: `duffin-schaeffer-sets`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §2, Case 2 and (2.2), pp. 257–258. The reduction, following Catlin.

#### `catlin-theorem` — Catlin's conjecture (Koukoulopoulos–Maynard Theorem 2)

*theorem* · planet **Catlin's conjecture** · proposed `TauCeti.DuffinSchaeffer.catlin`

Let ψ: ℕ → ℝ_{≥0} and ψ*(q) = φ(q)·sup{ψ(n)/n : n ∈ ℕ, q | n} ∈ [0,∞]. Then (a) if Σ_q ψ*(q) < ∞, λ(𝒦) = 0; (b) if Σ_q ψ*(q) = ∞, λ(𝒦) = 1.

**Hypotheses.**
- ψ* takes values in [0,∞]: the supremum may be infinite, and then the series is ∞.

**Proof, in steps.**
1. Case 1: ψ(qᵢ) ≥ 1/2 for infinitely many qᵢ. Pass to a subsequence with q_{i+1} ≥ 2qᵢ²; then 𝒦_{qᵢ} = [0,1], so 𝒦 = [0,1], and Σ_{q_{i−1}<q≤qᵢ} ψ*(q) ≥ (1/(2qᵢ))(Σ_{q|qᵢ} φ(q) − Σ_{q≤q_{i−1}} φ(q)) ≥ 1/4 (2.1), so Σψ* = ∞.
2. Case 2: finitely many q have ψ(q) ≥ 1/2. Replacing ψ by min{ψ, 1/2} changes neither 𝒦 nor the convergence of Σψ*, so assume ψ ≤ 1/2; the supremum is a maximum, and ψ*(q) = φ(q)ξ(q)/q with ξ as in the Catlin reduction.
3. By the reduction, λ(𝒦) = λ(𝒞). Now (a) is the convergence half for ξ and (b) is Theorem 1 for ξ.

**Acceptance tests.**
- For qψ(q) decreasing, ψ*(q) = φ(q)ψ(q)/q, and the theorem becomes the Duffin–Schaeffer dichotomy for ψ; with the series comparison it contains Khinchin's theorem.

**Dependencies.**
- In this packet: `duffin-schaeffer-theorem`, `duffin-schaeffer-convergence`, `catlin-reduction`, `duffin-schaeffer-sets`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §1, Theorem 2, p. 253. The theorem.
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §2, pp. 256–258. The deduction from Theorem 1.

#### `decreasing-series-comparison` — Totient weights do not change divergence for decreasing ψ

*lemma* · proposed `TauCeti.DuffinSchaeffer.not_summable_totient_mul_of_antitone`

If ψ ≥ 0 is decreasing and Σ_q ψ(q) = ∞, then Σ_q φ(q)ψ(q)/q = ∞.

**Hypotheses.**
- Worker-derived: the source notes that Khinchin's theorem and the Duffin–Schaeffer conjecture agree for qψ(q) decreasing (Walfisz), which is the use made here.

**Proof, in steps.**
1. Φ(x) = Σ_{n≤x} φ(n)/n = Σ_{d≤x} μ(d)/d·⌊x/d⌋ ≥ x Σ_{d≤x} μ(d)/d² − Σ_{d≤x} 1/d ≥ (2 − ζ(2))x − 1 − log x, using φ(n)/n = Σ_{d|n} μ(d)/d and |Σ_{d≥2} μ(d)/d²| ≤ ζ(2) − 1 < 1. So Φ(x) ≥ x/4 for x ≥ x₀.
2. Abel summation with ψ decreasing: Σ_{q≤N} φ(q)ψ(q)/q = Σ_{q<N} (ψ(q) − ψ(q+1))Φ(q) + ψ(N)Φ(N) ≥ (1/4)Σ_{x₀≤q≤N} ψ(q) − O(1).

**Acceptance tests.**
- ψ(q) = 1/(q log q) (q ≥ 2): both series diverge.
- Without monotonicity the implication can fail, because φ(q)/q can be small on the support of ψ; this is why Duffin and Schaeffer passed to reduced fractions (p. 252).

**Dependencies.**
- On the pinned libraries: `mathlib:Nat.totient`, `mathlib:ArithmeticFunction.moebius`, `mathlib:hasSum_zeta_two`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §1, p. 253. The context; the comparison lemma itself is a worker derivation.

#### `khinchin-theorem` — Khinchin's theorem

*theorem* · planet **Khinchin's theorem** · proposed `TauCeti.DuffinSchaeffer.khinchin`

Let ψ: ℕ → [0,∞) with (qψ(q)) decreasing, and 𝒦 the set of α ∈ [0,1] for which |α − a/q| ≤ ψ(q)/q has infinitely many solutions (a,q) with 0 ≤ a ≤ q. (a) If Σψ(q) < ∞ then λ(𝒦) = 0. (b) If Σψ(q) = ∞ then λ(𝒦) = 1.

**Hypotheses.**
- (a) holds without monotonicity.

**Proof, in steps.**
1. (a): λ(𝒦_q) ≤ 2 min{ψ(q), 1/2} ≤ 2ψ(q); Borel–Cantelli.
2. (b): qψ(q) decreasing makes ψ(n)/n decreasing, so ψ*(q) = φ(q)ψ(q)/q. ψ is decreasing, so by the series comparison Σψ* = ∞, and Catlin's theorem (b) gives λ(𝒦) = 1.

**Acceptance tests.**
- ψ(q) = 1/(q log q): λ(𝒦) = 1. ψ(q) = 1/(q (log q)²): λ(𝒦) = 0.
- This route replaces Khinchin's 1924 proof by the Koukoulopoulos–Maynard theorem, as the source notes (p. 253); Mathlib has only the Liouville-type special case of (a) (library audit).

**Dependencies.**
- In this packet: `catlin-theorem`, `decreasing-series-comparison`, `duffin-schaeffer-sets`
- On the pinned libraries: `mathlib:MeasureTheory.measure_limsup_atTop_eq_zero`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §1, Khinchin's theorem, p. 252. The statement as the source gives it; the proof here goes through Theorem 2.

### Section 5: reduction to a second-moment bound

#### `second-moment-union-bound` — Second-moment lower bound for a finite union

*lemma* · proposed `TauCeti.DuffinSchaeffer.sq_sum_volume_le`

For measurable sets A_i of finite measure and a finite index set s, (Σ_{i∈s} λ(A_i))² ≤ λ(⋃_{i∈s} A_i)·Σ_{i,j∈s} λ(A_i ∩ A_j).

**Hypotheses.**
- A general measure-theoretic inequality (Chung–Erdős form).

**Proof, in steps.**
1. Let Q = Σ_i 1_{A_i}. Then ∫Q = Σλ(A_i), ∫Q² = Σ_{i,j} λ(A_i ∩ A_j), and Q vanishes off ⋃A_i.
2. Cauchy–Schwarz: (∫Q·1_{⋃A_i})² ≤ λ(⋃A_i)∫Q².

**Acceptance tests.**
- Pairwise disjoint sets give equality.

**Dependencies.**
- On the pinned libraries: `mathlib:MeasureTheory.lintegral_indicator`, `mathlib:ENNReal.lintegral_mul_le_Lp_mul_Lq`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §5, proof of Theorem 1, p. 266. The inequality in the source's application.

#### `duffin-schaeffer-large-values` — Duffin–Schaeffer when ψ takes only large values (Lemma 5.2)

*lemma* · proposed `TauCeti.DuffinSchaeffer.volume_dsLimsup_eq_one_of_large`

Let ψ: ℕ → ℝ_{≥0} with ψ(q) = 0 or ψ(q) ≥ 1/2 for every q, and Σψ(q)φ(q)/q = ∞. Then λ(𝒜) = 1.

**Hypotheses.**
- Imported: the source cites Pollington–Vaughan, Theorem 2, which was not read (gap).

**Proof, in steps.**
1. Pollington–Vaughan, Mathematika 37 (1990), Theorem 2; the proof is not decomposed here (gap 'Imported inputs of the Duffin–Schaeffer proof').

**Acceptance tests.**
- It is only used for the part ψ₁ = ψ·𝟙_{ψ>1/2} in the proof of Theorem 1.

**Dependencies.**
- In this packet: `duffin-schaeffer-sets`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §5, Lemma 5.2, p. 264. The statement; the proof is cited.

#### `overlap-estimate` — Overlap estimate for 𝒜_q ∩ 𝒜_r (Lemma 5.3, corrected)

*lemma* · proposed `TauCeti.DuffinSchaeffer.volume_dsSet_inter_le`

Let ψ: ℕ → [0,1/2] and M(q,r) = max{rψ(q), qψ(r)}. For q ≠ r, λ(𝒜_q ∩ 𝒜_r) ≪ λ(𝒜_q)λ(𝒜_r)·𝟙_{2M(q,r) ≥ gcd(q,r)}·∏_{p | qr/gcd(q,r)², p > M(q,r)/gcd(q,r)} (1 + 1/p). The printed indicator is 𝟙_{M(q,r) ≥ gcd(q,r)} (E10).

**Hypotheses.**
- Imported: the source cites Pollington–Vaughan, pp. 195–196, which was not read (gap).
- The indicator: distinct reduced fractions satisfy |a/q − b/r| ≥ gcd(q,r)/(qr), so the intervals can meet only if rψ(q) + qψ(r) ≥ gcd(q,r), which needs 2M ≥ gcd, not M ≥ gcd.

**Proof, in steps.**
1. Pollington–Vaughan, pp. 195–196; not decomposed here (gap).
2. The vanishing part is elementary: if 2M(q,r) < gcd(q,r) then every pair of centres is at distance at least gcd/(qr) > ψ(q)/q + ψ(r)/r.

**Acceptance tests.**
- q = 2, r = 3, ψ ≡ 3/10: M = 9/10 < 1 = gcd, yet λ(𝒜_2 ∩ 𝒜_3) = 1/6 (exact computation), so the printed indicator is wrong; the corrected indicator is 1 here.
- The proof of Theorem 1 is unaffected: it only restricts the sum (5.7), and pairs with gcd/2 ≤ M < gcd lie in the sets ℰ_t used later.

**Dependencies.**
- In this packet: `duffin-schaeffer-sets`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §5, Lemma 5.3, p. 264. The statement, with the indicator corrected (E10).

#### `second-moment-bound` — The second-moment bound (Proposition 5.4)

*lemma* · proposed `TauCeti.DuffinSchaeffer.second_moment_bound`

Let ψ: ℕ → [0,1/2], Y ≥ X ≥ 1 with 1 ≤ Σ_{X≤q≤Y} ψ(q)φ(q)/q ≤ 2, and L_t(a,b) = Σ_{p | ab/gcd(a,b)², p ≥ t} 1/p. For t ≥ 1 let ℰ_t = {(v,w) ∈ [X,Y]² : gcd(v,w) ≥ t^{−1}M(v,w), L_t(v,w) ≥ 10}. Then Σ_{(v,w)∈ℰ_t} (φ(v)ψ(v)/v)(φ(w)ψ(w)/w) ≪ 1/t.

**Hypotheses.**
- The implied constant is absolute.

**Proof, in steps.**
1. Let μ(v) = ψ(v)φ(v)/v and 𝒱 = ℤ ∩ [X,Y], so μ(𝒱) ∈ [1,2].
2. The bipartite graph (𝒱, 𝒱, ℰ_t) with trivial multiplicative data is a GCD graph; Proposition 6.3 gives μ(ℰ_t) ≪ 1/t, which is the claim.

**Acceptance tests.**
- t = exp exp j is the case used in (5.8).

**Dependencies.**
- In this packet: `edge-set-bound`, `gcd-graph`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §5, Proposition 5.4, p. 265; §6, its proof from Proposition 6.3, p. 270. The proposition and its translation into GCD graphs.

### Section 6: GCD graphs and their quality

#### `gcd-graph` — GCD graph and GCD subgraph (Definitions 6.1, 6.2, 6.4)

*definition* · planet **GCD graph** · proposed `TauCeti.DuffinSchaeffer.GCDGraph`

A GCD graph is G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) with μ a finite nonnegative weight on ℕ (extended to pairs by μ(𝒩) = Σ_{(n₁,n₂)∈𝒩} μ(n₁)μ(n₂)), 𝒱, 𝒲 finite sets of positive integers, ℰ ⊆ 𝒱 × 𝒲, 𝒫 a set of primes and f, g: 𝒫 → ℤ_{≥0} such that for p ∈ 𝒫: (i) p^{f(p)} | v for v ∈ 𝒱 and p^{g(p)} | w for w ∈ 𝒲; (ii) p^{min(f(p),g(p))} ∥ gcd(v,w) for (v,w) ∈ ℰ; (iii) if f(p) ≠ g(p) then p^{f(p)} ∥ v for all v ∈ 𝒱 and p^{g(p)} ∥ w for all w ∈ 𝒲. G is non-trivial if μ(ℰ) > 0. G' ⪯ G (a GCD subgraph) if μ' = μ, 𝒱' ⊆ 𝒱, 𝒲' ⊆ 𝒲, ℰ' ⊆ ℰ, 𝒫' ⊇ 𝒫 and f', g' extend f, g.

**Hypotheses.**
- 𝒫 is finite here; in the source it starts empty and grows by one prime per step, so nothing is lost.
- Condition (ii) is stated with p-adic valuations: the valuation of gcd(v,w) at p is min(f(p), g(p)).

**Construction or proof, in steps.**
1. Encode G as a structure with fields for the data and the conditions (i)–(iii), with f, g: ℕ → ℕ read only on 𝒫.
2. Define the vertex and edge measures, non-triviality and the subgraph relation.
3. Lemma 6.7: transitivity and reflexivity of ⪯, and ℛ monotone along ⪯ (ℛ of PM.3/gcd-graph-quality), are immediate from the definitions; non-trivial graphs have vertex sets of positive measure.

**API.**

| name | role | statement |
|---|---|---|
| `TauCeti.DuffinSchaeffer.GCDGraph.vertexMeasure` | data | μ(𝒮) = Σ_{n∈𝒮} μ(n). |
| `TauCeti.DuffinSchaeffer.GCDGraph.edgeMeasure` | data | μ(𝒩) = Σ_{(n₁,n₂)∈𝒩} μ(n₁)μ(n₂). |
| `TauCeti.DuffinSchaeffer.GCDGraph.IsNontrivial` | data | μ(ℰ) > 0 (Definition 6.2). |
| `TauCeti.DuffinSchaeffer.GCDGraph.IsSubgraph` | data | The relation G' ⪯ G of Definition 6.4. |
| `TauCeti.DuffinSchaeffer.GCDGraph.IsSubgraph.trans` | relation | Lemma 6.7(a): ⪯ is transitive. |
| `TauCeti.DuffinSchaeffer.GCDGraph.IsSubgraph.refl` | relation | G ⪯ G. |
| `TauCeti.DuffinSchaeffer.GCDGraph.R_subset_of_isSubgraph` | relation | Lemma 6.7(b): G' ⪯ G implies ℛ(G') ⊆ ℛ(G). |
| `TauCeti.DuffinSchaeffer.GCDGraph.vertexMeasure_pos_of_isNontrivial` | other | Lemma 6.7(c): a non-trivial G has μ(𝒱), μ(𝒲) > 0. |

**Unit tests.** A wrong definition fails one of these.

- `gcd-graph.test_edgeMeasure_single_edge` (computation) — With ℰ = {(2,3)} and μ ≡ 1, μ(ℰ) = 1.
- `gcd-graph.test_not_isNontrivial_of_empty` (degenerate) — An empty edge set gives a trivial graph.
- `gcd-graph.test_not_pow_succ_dvd_gcd` (characterisation) — For p ∈ 𝒫 and (v,w) ∈ ℰ, p^{min(f(p),g(p))+1} does not divide gcd(v,w): condition (ii) is exact divisibility, not mere divisibility.

**Where it is used.**
- Koukoulopoulos–Maynard §§6–14 — Every step of the compression argument is a GCD subgraph with more multiplicative data.
- edge-set-bound — Proposition 6.3 is an edge-measure bound for a GCD graph with trivial primes.

**Acceptance tests.**
- The graph of Proposition 5.4 (vertex sets two copies of ℤ ∩ [X,Y], edge set ℰ_t, trivial primes) is a GCD graph.

**Dependencies.**
- On the pinned libraries: `mathlib:Nat.factorization`, `mathlib:Nat.primeFactors`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §6, Definitions 6.1, 6.2 and 6.4, pp. 269–270. The definitions.
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §6, Lemma 6.7, p. 273. The basic API.

#### `gcd-graph-quality` — Edge density, ℛ(G) and the quality of a GCD graph (Definition 6.6)

*definition* · planet **Quality of a GCD graph** · proposed `TauCeti.DuffinSchaeffer.GCDGraph.quality`

For a GCD graph G: the edge density δ(G) = μ(ℰ)/(μ(𝒱)μ(𝒲)) (0 if a vertex set has measure 0); the neighbourhoods Γ_G(v), Γ_G(w); ℛ(G) = {p ∉ 𝒫 : p | gcd(v,w) for some (v,w) ∈ ℰ}; ℛ♯(G) = {p ∈ ℛ(G) : ∃k with μ(𝒱_{p^k})/μ(𝒱), μ(𝒲_{p^k})/μ(𝒲) ≥ 1 − 10⁴⁰/p}, ℛ♭(G) = ℛ(G) \ ℛ♯(G); and the quality q(G) = δ¹⁰ μ(𝒱)μ(𝒲) ∏_{p∈𝒫} p^{|f(p)−g(p)|}/((1 − 𝟙_{f(p)=g(p)≥1}/p)²(1 − p^{−31/30})¹⁰).

**Hypotheses.**
- 𝒱_{p^k} = {v ∈ 𝒱 : p^k ∥ v}; 𝒱_{p⁰} is the set of v coprime to p.
- In ℛ♯ the exponent k can be bounded by the largest vertex without changing the set.

**Construction or proof, in steps.**
1. Define each quantity as displayed; ℛ(G) is a finite set because ℰ is finite.
2. Remark after Definition 6.6: when μ(𝒱), μ(𝒲) > 0, q(G) = μ(ℰ)¹⁰/(μ(𝒱)⁹μ(𝒲)⁹)·∏_{p∈𝒫}(…).
3. Lemma 6.7(d): non-trivial ⟺ δ > 0 ⟺ q(G) > 0, since the product over 𝒫 is positive.
4. δ ≤ 1 because ℰ ⊆ 𝒱 × 𝒲 and μ ≥ 0.

**API.**

| name | role | statement |
|---|---|---|
| `TauCeti.DuffinSchaeffer.GCDGraph.edgeDensity` | data | δ(G) = μ(ℰ)/(μ(𝒱)μ(𝒲)), or 0. |
| `TauCeti.DuffinSchaeffer.GCDGraph.nbhdV` | data | Γ_G(v) = {w ∈ 𝒲 : (v,w) ∈ ℰ}. |
| `TauCeti.DuffinSchaeffer.GCDGraph.nbhdW` | data | Γ_G(w) = {v ∈ 𝒱 : (v,w) ∈ ℰ}. |
| `TauCeti.DuffinSchaeffer.GCDGraph.R` | data | ℛ(G), the primes outside 𝒫 dividing the gcd of an edge. |
| `TauCeti.DuffinSchaeffer.GCDGraph.Vpow` | data | 𝒱_{p^k}. |
| `TauCeti.DuffinSchaeffer.GCDGraph.Wpow` | data | 𝒲_{p^k}. |
| `TauCeti.DuffinSchaeffer.GCDGraph.RSharp` | data | ℛ♯(G). |
| `TauCeti.DuffinSchaeffer.GCDGraph.RFlat` | data | ℛ♭(G) = ℛ(G) \ ℛ♯(G). |
| `TauCeti.DuffinSchaeffer.GCDGraph.isNontrivial_iff` | characterisation | Lemma 6.7(d): non-trivial ⟺ δ > 0 ⟺ q > 0. |
| `TauCeti.DuffinSchaeffer.GCDGraph.quality_eq` | characterisation | q(G) = μ(ℰ)¹⁰/(μ(𝒱)⁹μ(𝒲)⁹)·∏ when μ(𝒱), μ(𝒲) > 0. |
| `TauCeti.DuffinSchaeffer.GCDGraph.edgeDensity_le_one` | other | δ(G) ≤ 1. |

**Unit tests.** A wrong definition fails one of these.

- `gcd-graph-quality.test_quality_empty_edges` (degenerate) — ℰ = ∅ gives q(G) = 0.
- `gcd-graph-quality.test_quality_trivial_primes` (computation) — With 𝒫 = ∅ and μ(𝒱), μ(𝒲) > 0, q(G) = δ⁹μ(ℰ), the identity used in the proof of Proposition 6.3.
- `gcd-graph-quality.test_R_empty_of_coprime_edges` (characterisation) — If every edge has coprime ends then ℛ(G) = ∅.

**Where it is used.**
- good-gcd-subgraph — The conclusions of Proposition 7.1 are stated in terms of δ, Γ, ℛ and q.
- Koukoulopoulos–Maynard §§8–14 — The iteration increases or boundedly loses q while shrinking ℛ.

**Acceptance tests.**
- The factor ∏(1 − p^{−31/30})^{−10} lies in [1, ζ(31/30)¹⁰]; the factor ∏(1 − 𝟙_{f=g≥1}/p)^{−2} is what the φ(q)/q weights pay for (Section 15).

**Dependencies.**
- In this packet: `gcd-graph`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §6, Definition 6.6 and the remark after it, pp. 271–273. The definitions.

#### `gcd-graph-special-subgraph` — The special GCD subgraphs G_{p^k,p^ℓ} (Definition 6.5)

*construction* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.restrictPow`

For a GCD graph G, a prime p ∉ 𝒫 and k, ℓ ≥ 0, G_{p^k,p^ℓ} = (μ, 𝒱_{p^k}, 𝒲_{p^ℓ}, ℰ ∩ (𝒱_{p^k} × 𝒲_{p^ℓ}), 𝒫 ∪ {p}, f_{p^k}, g_{p^ℓ}) with f_{p^k} extending f by k at p and g_{p^ℓ} extending g by ℓ. It is a GCD subgraph of G.

**Hypotheses.**
- The source requires only p ∉ 𝒫 for the definition.

**Construction or proof, in steps.**
1. Check (i)–(iii) at p: p^k ∥ v on 𝒱_{p^k}, p^ℓ ∥ w on 𝒲_{p^ℓ}, and the gcd of an edge has valuation min(k,ℓ) at p. At primes of 𝒫 the conditions are inherited.
2. The subgraph relation and ℛ(G_{p^k,p^ℓ}) ⊆ ℛ(G) \ {p} are immediate.

**API.**

| name | role | statement |
|---|---|---|
| `TauCeti.DuffinSchaeffer.GCDGraph.restrictPow_isSubgraph` | relation | G_{p^k,p^ℓ} ⪯ G. |
| `TauCeti.DuffinSchaeffer.GCDGraph.R_restrictPow` | relation | ℛ(G_{p^k,p^ℓ}) ⊆ ℛ(G) \ {p}. |
| `TauCeti.DuffinSchaeffer.GCDGraph.quality_restrictPow` | characterisation | Lemma 11.1, promoted to the node PM.3/special-subgraph-quality-ratio. |

**Unit tests.** A wrong definition fails one of these.

- `gcd-graph-special-subgraph.test_restrictPow_two_zero_zero` (computation) — The vertex set of G_{2⁰,2⁰} is the set of odd elements of 𝒱.
- `gcd-graph-special-subgraph.test_restrictPow_exact_valuation` (characterisation) — For k ≠ ℓ every vertex v of G_{p^k,p^ℓ} on the left has v_p(v) = k exactly.
- `gcd-graph-special-subgraph.test_restrictPow_quality_zero` (degenerate) — If 𝒱_{p^k} = ∅ then q(G_{p^k,p^ℓ}) = 0.

**Where it is used.**
- Koukoulopoulos–Maynard §§11–14 — Every step that adds a prime to 𝒫 passes to some G_{p^k,p^ℓ} or a union of them.
- special-subgraph-quality-ratio — The quality ratio formula.

**Acceptance tests.**
- G_{2⁰,2⁰} keeps the odd vertices on both sides.

**Dependencies.**
- In this packet: `gcd-graph`, `gcd-graph-quality`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §6, Definition 6.5, p. 271. The construction.

#### `special-subgraph-quality-ratio` — Quality ratio of G_{p^k,p^ℓ} (Lemma 11.1)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.quality_restrictPow`

If G is non-trivial, p ∉ 𝒫 and μ(𝒱_{p^k}), μ(𝒲_{p^ℓ}) > 0, then q(G_{p^k,p^ℓ})/q(G) = (μ(ℰ_{p^k,p^ℓ})/μ(ℰ))¹⁰(μ(𝒱)/μ(𝒱_{p^k}))⁹(μ(𝒲)/μ(𝒲_{p^ℓ}))⁹·p^{|k−ℓ|}/((1 − 𝟙_{k=ℓ≥1}/p)²(1 − p^{−31/30})¹⁰).

**Hypotheses.**
- The source assumes p ∈ ℛ(G); only p ∉ 𝒫 is needed (E13).

**Proof, in steps.**
1. Expand both qualities by the remark after Definition 6.6; the product over 𝒫 cancels and the factor at p remains.

**Acceptance tests.**
- k = ℓ = 0 gives the factor (1 − p^{−31/30})^{−10} > 1.

**Dependencies.**
- In this packet: `gcd-graph-special-subgraph`, `gcd-graph-quality`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §11, Lemma 11.1, p. 288. The formula.

### Sections 7–8: a good GCD subgraph and the iterative propositions

#### `edge-set-bound` — Edge-set bound (Proposition 6.3)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.edgeMeasure_le_of_Et`

Let ψ: ℕ → ℝ_{≥0}, t ≥ 1, μ(v) = ψ(v)φ(v)/v, and G = (μ, 𝒱, 𝒱, ℰ, ∅, f_∅, g_∅) with 0 < μ(𝒱) ≪ 1 and ℰ ⊆ ℰ_t. Then μ(ℰ) ≪ 1/t.

**Hypotheses.**
- ℰ_t as in Proposition 5.4: gcd(v,w) ≥ M(v,w)/t and L_t(v,w) ≥ 10.

**Proof, in steps.**
1. If δ ≤ 1/t or t ≤ 10²⁰⁰⁰, μ(ℰ) ≤ δμ(𝒱)² ≪ 1/t. Otherwise δ ≥ 1/t, t > 10²⁰⁰⁰ and t ≥ 10δ^{−1/50}; apply Proposition 7.1 to get G'.
2. With a = ∏_{p∈𝒫'} p^{f'(p)}, b = ∏ p^{g'(p)}: a | v, b | w, and gcd(v,w) = gcd(a,b) on ℰ' (ℛ(G') = ∅). Then ∏p^{|f'−g'|} = ab/gcd(a,b)² and ∏(1 − 𝟙/p)^{−2} ≤ ab/(φ(a)φ(b)), so q(G') ≪ δ'⁹μ(ℰ')(ab/gcd²)(ab/φ(a)φ(b)) (7.2).
3. From M ≤ t·gcd on edges, ψ(v) ≤ t·gcd(a,b)/w_max(v) and ψ(w) ≤ t·gcd(a,b)/v_max(w) (7.3). Restricting to the edges ℰ'' at the largest w₀ keeps μ(ℰ'') ≥ δ'μ(ℰ')/2 by the degree conditions, and φ(v)/v ≤ φ(a)/a, so q(G') ≪ t²ab Σ_{(v,w)∈ℰ'} 1/(v_max(w)w₀) (7.6).
4. Case (d)(i): the sum is ≤ 1/(ab), so q(G') ≪ t², and μ(ℰ) = δ^{−9}q(G) ≪ δ^{−10}t^{−50}q(G') ≪ 1/t.
5. Case (d)(ii): L_t(v',w') ≥ 4 forces Σ_{p|v',p≥t} 1/p ≥ 2 or the same for w'; Lemma 7.3 with c = 2 bounds the sum by ≪ 1/(ab t² e^t), so q(G') ≪ e^{−t} and μ(ℰ) ≪ t⁹e^{−t} ≪ 1/t.

**Acceptance tests.**
- The φ(v)/v factor in μ is what cancels ab/(φ(a)φ(b)) in (7.2); without it the argument fails (Section 15).

**Dependencies.**
- In this packet: `good-gcd-subgraph`, `few-integers-many-large-primes`, `gcd-graph`, `gcd-graph-quality`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §6, Proposition 6.3, p. 269; §7, its proof, pp. 275–279. The proposition and its proof from Proposition 7.1.

#### `multiplicative-function-bound` — Rankin-type bound for multiplicative functions (case of Lemma 7.2)

*lemma* · proposed `TauCeti.DuffinSchaeffer.sum_le_mul_exp_of_const_on_powers`

Let f be multiplicative with f(p^ν) = f(p) ≥ 1 for every prime p and ν ≥ 1. Then Σ_{n≤x} f(n) ≤ x·exp(Σ_{p≤x} (f(p) − 1)/p).

**Hypotheses.**
- Lemma 7.2 in the source is the general bound for 0 ≤ f ≤ τ_k, cited to Koukoulopoulos's book (Theorem 14.2), which was not read. Only this case is used (in Lemma 7.3), and it has the elementary proof below.

**Proof, in steps.**
1. Write f = 1 * h with h multiplicative, h(p) = f(p) − 1 ≥ 0 and h(p^ν) = 0 for ν ≥ 2.
2. Σ_{n≤x} f(n) = Σ_{d≤x} h(d)⌊x/d⌋ ≤ x Σ_{d≤x} h(d)/d ≤ x ∏_{p≤x}(1 + h(p)/p) ≤ x exp(Σ_{p≤x} h(p)/p).

**Acceptance tests.**
- f ≡ 1 gives ⌊x⌋ ≤ x.
- Lemma 7.3 uses f(p^ν) = e^{2T/p} for p ≥ T and 1 otherwise.

**Dependencies.**

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §7, Lemma 7.2, p. 274. The statement; the special case and its proof are worker-derived.

#### `few-integers-many-large-primes` — Few integers with many large prime factors (Lemma 7.3)

*lemma* · proposed `TauCeti.DuffinSchaeffer.card_many_large_prime_factors_le`

For x, t ≥ 1 and c ∈ [1,10], #{n ≤ x : Σ_{p|n, p≥t} 1/p ≥ c} ≪ x·exp(−t^{e^{c−1}}), with an absolute implied constant.

**Hypotheses.**
- The exponent is t^{e^{c−1}} (checked on the page image; the text layer is ambiguous).

**Proof, in steps.**
1. For bounded t the claim is trivial. Put T = t^{e^{c−1}}; by Mertens' theorem (requested from AN.2) Σ_{t≤p<T} 1/p ≤ c − 1/2 for large t, so the set lies in {n ≤ x : Σ_{p|n,p≥T} 1/p ≥ 1/2} (7.1).
2. Rankin: that set has at most e^{−T}Σ_{n≤x} ∏_{p|n,p≥T} e^{2T/p} elements. Apply the multiplicative-function bound with f(p^ν) = e^{2T/p} for p ≥ T and 1 for p < T.
3. Σ_{T≤p≤x} (e^{2T/p} − 1)/p = O(Σ_{p≥T} T/p²) = O(1), so the count is ≪ x e^{−T}.

**Acceptance tests.**
- c = 2 gives ≪ x exp(−t^e), used in Case (d)(ii) of Proposition 6.3.

**Dependencies.**
- In this packet: `multiplicative-function-bound`
- Other roadmaps (requested): `AnalyticNumberTheory:AN.2`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §7, Lemma 7.3 and proof, pp. 274–275. The lemma and its proof.

#### `good-gcd-subgraph` — Existence of a good GCD subgraph (Proposition 7.1)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.exists_good_subgraph`

Let G = (μ, 𝒱, 𝒲, ℰ, ∅, f_∅, g_∅) have edge density δ > 0, ℰ ⊆ {L_t ≥ 10}, t ≥ 10δ^{−1/50} and t > 10²⁰⁰⁰. Then there is G' ⪯ G with δ' > 0, ℛ(G') = ∅, μ(Γ_{G'}(v)) ≥ (9δ'/10)μ(𝒲') for v ∈ 𝒱', μ(Γ_{G'}(w)) ≥ (9δ'/10)μ(𝒱') for w ∈ 𝒲', and either (i) q(G') ≫ δt⁵⁰q(G), or (ii) q(G') ≫ q(G) and L_t(v',w') ≥ 4 for every edge, where v = v'∏_{p∈𝒫'}p^{f'(p)}, w = w'∏ p^{g'(p)}.

**Hypotheses.**
- The implied constants are absolute (explicitly, powers of 10^{10^{3000}}).

**Proof, in steps.**
1. It suffices to get (a) and (d); Lemma 8.5 then adds the degree conditions without changing 𝒫 or ℛ = ∅.
2. Stage 1: Proposition 8.3 gives G⁽¹⁾ with ℛ(G⁽¹⁾) ⊆ {p > 10²⁰⁰⁰} and q, δq losing at most 10^{10^{3000}} (8.1).
3. Stage 2: iterate Proposition 8.1 while ℛ♭ ≠ ∅ (ℛ strictly shrinks) to reach G⁽²⁾ with ℛ♭(G⁽²⁾) = ∅, gaining 2^N, N = #{p ∈ 𝒫⁽²⁾ \ 𝒫⁽¹⁾ : f ≠ g} (8.3).
4. Case (a), q(G⁽²⁾)/q(G) ≥ (t/10)⁵⁰δ/10^{10^{3000}}: iterate Proposition 8.1 or 8.2 until ℛ = ∅; the quality never drops, giving (d)(i).
5. Case (b): δ⁽²⁾ ≥ (10/t)⁵⁰ and 2^N ≤ t⁵⁰. Lemma 8.4 gives G⁽³ᵇ⁾ with 𝒫 unchanged, q ≥ q/2, and Σ_{p | vw/gcd², p≥t, p∉ℛ(G⁽²⁾)} 1/p ≥ 5 (8.8). The primes of 𝒫⁽²⁾ with f ≠ g contribute at most N/t < 1, giving (8.10).
6. Stage 4b: iterate Propositions 8.1/8.2 to reach ℛ = ∅. Every prime p with p | vw/gcd² but p ∤ v'w' lies in 𝒫_diff⁽²⁾ ∪ ℛ(G⁽²⁾), so (8.10) gives L_t(v',w') ≥ 4, which is (d)(ii).

**Acceptance tests.**
- The iteration terminates because ℛ strictly decreases and is finite.

**Dependencies.**
- In this packet: `iteration-flat-primes`, `iteration-sharp-primes`, `iteration-small-primes`, `remove-R-from-anatomy`, `high-degree-subgraph`, `gcd-graph-quality`, `gcd-graph-special-subgraph`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §7, Proposition 7.1, p. 273; §8, its proof, pp. 280–284. The proposition and its proof from Propositions 8.1–8.3 and Lemmas 8.4–8.5.

#### `iteration-flat-primes` — Iteration when ℛ♭(G) ≠ ∅ (Proposition 8.1)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.exists_subgraph_of_RFlat_nonempty`

If δ > 0, ℛ(G) ⊆ {p > 10²⁰⁰⁰} and ℛ♭(G) ≠ ∅, there is G' ⪯ G with δ' > 0, 𝒫 ⊊ 𝒫' ⊆ 𝒫 ∪ ℛ(G), ℛ(G') ⊊ ℛ(G) and min{1, δ'/δ}·q(G')/q(G) ≥ 2^N, N = #{p ∈ 𝒫' \ 𝒫 : f'(p) ≠ g'(p)}.

**Hypotheses.**
- G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) is a GCD graph (PM.3/gcd-graph) with edge density δ; μ(ℰ) = Σ_{(v,w)∈ℰ} μ(v)μ(w), 𝒱_{p^k} = {v ∈ 𝒱 : p^k ∥ v}, and G_{p^k,p^ℓ} is the special subgraph of Definition 6.5.

**Proof, in steps.**
1. Pick p ∈ ℛ♭(G); then p > 10²⁰⁰⁰ > 10⁴⁰. Conclusion (b) of Lemma 12.2 contradicts p ∉ ℛ♯(G), so conclusion (a) holds, with N = 𝟙_{f'(p)≠g'(p)}.

**Acceptance tests.**
- Only one prime is added per step.

**Dependencies.**
- In this packet: `large-prime-increment`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §8, Proposition 8.1, p. 279; §12, proof, p. 295. The proposition and its proof.

#### `iteration-sharp-primes` — Iteration when ℛ♭(G) = ∅ (Proposition 8.2)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.exists_subgraph_of_RFlat_empty`

If δ > 0, ℛ(G) ⊆ {p > 10²⁰⁰⁰}, ℛ♭(G) = ∅ and ℛ♯(G) ≠ ∅, there is G' ⪯ G with 𝒫 ⊊ 𝒫' ⊆ 𝒫 ∪ ℛ(G), ℛ(G') ⊊ ℛ(G) and q(G') ≥ q(G).

**Hypotheses.**
- G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) is a GCD graph (PM.3/gcd-graph) with edge density δ; μ(ℰ) = Σ_{(v,w)∈ℰ} μ(v)μ(w), 𝒱_{p^k} = {v ∈ 𝒱 : p^k ∥ v}, and G_{p^k,p^ℓ} is the special subgraph of Definition 6.5.

**Proof, in steps.**
1. Any p ∈ ℛ(G) exceeds 10²⁰⁰⁰; apply Lemma 14.1.

**Acceptance tests.**
- The quality does not decrease; there is no increment.

**Dependencies.**
- In this packet: `sharp-prime-increment`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §8, Proposition 8.2, p. 279; §14, proof, p. 304. The proposition and its proof.

#### `iteration-small-primes` — Bounded quality loss for small primes (Proposition 8.3)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.exists_subgraph_small_primes`

If G has trivial primes and δ > 0, there is G' ⪯ G with δ' > 0, 𝒫' ⊆ {p ≤ 10²⁰⁰⁰}, ℛ(G') ⊆ {p > 10²⁰⁰⁰} and min{1, δ'/δ}·q(G')/q(G) ≥ 10^{−10^{3000}}.

**Hypotheses.**
- G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) is a GCD graph (PM.3/gcd-graph) with edge density δ; μ(ℰ) = Σ_{(v,w)∈ℰ} μ(v)μ(w), 𝒱_{p^k} = {v ∈ 𝒱 : p^k ∥ v}, and G_{p^k,p^ℓ} is the special subgraph of Definition 6.5.

**Proof, in steps.**
1. If ℛ(G) has no prime ≤ 10²⁰⁰⁰, take G' = G. Otherwise apply Lemma 13.2 to such primes repeatedly; each step removes one small prime from ℛ and loses at most 10⁵⁰ in q and δq (13.3).
2. At most 10²⁰⁰⁰ steps occur, and (10⁵⁰)^{10²⁰⁰⁰} ≤ 10^{10^{3000}}.

**Acceptance tests.**
- The loss is enormous but independent of G and t.

**Dependencies.**
- In this packet: `add-small-prime`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §8, Proposition 8.3, p. 279; §13, proof, pp. 299–300. The proposition and its proof.

#### `remove-R-from-anatomy` — Removing the effect of ℛ(G) from L_t (Lemma 8.4)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.exists_subgraph_remove_R`

Let t ≥ 300, ℛ♭(G) = ∅, δ ≥ (10/t)⁵⁰ and ℰ ⊆ {L_t ≥ 10}. Then there is G' = (μ, 𝒱, 𝒲, ℰ', 𝒫, f, g) ⪯ G with q(G') ≥ q(G)/2 > 0 and Σ_{p | vw/gcd(v,w)², p ≥ t, p ∉ ℛ(G)} 1/p ≥ 5 for every (v,w) ∈ ℰ'.

**Hypotheses.**
- G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) is a GCD graph (PM.3/gcd-graph) with edge density δ; μ(ℰ) = Σ_{(v,w)∈ℰ} μ(v)μ(w), 𝒱_{p^k} = {v ∈ 𝒱 : p^k ∥ v}, and G_{p^k,p^ℓ} is the special subgraph of Definition 6.5.

**Proof, in steps.**
1. Let S(v,w) = Σ_{p | vw/gcd², p ∈ ℛ(G), p ≥ t⁵⁰} 1/p. Every p ∈ ℛ(G) is in ℛ♯(G), so a p dividing vw/gcd² separates the two sides of a dominant class p^k, and μ{(v,w) ∈ ℰ : p | vw/gcd²} ≤ 2·10⁴⁰μ(𝒱)μ(𝒲)/p.
2. Hence Σ_ℰ μ(v)μ(w)S(v,w) ≤ 2·10⁴⁰μ(𝒱)μ(𝒲)/t⁵⁰ < μ(ℰ)/100, using δ ≥ (10/t)⁵⁰. Keep ℰ' = {S ≤ 1}: μ(ℰ') ≥ 0.99μ(ℰ) and q(G')/q(G) = (μ(ℰ')/μ(ℰ))¹⁰ ≥ 1/2.
3. Σ_{t≤p≤t⁵⁰} 1/p ≤ log 50 + 1/(log t)² ≤ 4 for t ≥ 300 (Rosser–Schoenfeld Theorem 5, requested from AN.2). So the primes of ℛ(G) contribute at most 5 to L_t on ℰ', leaving at least 5.

**Acceptance tests.**
- In the application t > 10²⁰⁰⁰, so any effective form of Mertens' second theorem suffices.

**Dependencies.**
- In this packet: `gcd-graph-quality`
- Other roadmaps (requested): `AnalyticNumberTheory:AN.2`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §8, Lemma 8.4, p. 280; §9, proof, pp. 285–286. The lemma and its proof.

#### `high-degree-subgraph` — Subgraph with high-degree vertices (Lemma 8.5)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.exists_high_degree_subgraph`

If δ > 0, there is G' = (μ, 𝒱', 𝒲', ℰ', 𝒫, f, g) ⪯ G with δ' ≥ δ, q(G') ≥ q(G), and μ(Γ_{G'}(v)) ≥ (9δ'/10)μ(𝒲'), μ(Γ_{G'}(w)) ≥ (9δ'/10)μ(𝒱') for all vertices.

**Hypotheses.**
- G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) is a GCD graph (PM.3/gcd-graph) with edge density δ; μ(ℰ) = Σ_{(v,w)∈ℰ} μ(v)μ(w), 𝒱_{p^k} = {v ∈ 𝒱 : p^k ∥ v}, and G_{p^k,p^ℓ} is the special subgraph of Definition 6.5.

**Proof, in steps.**
1. Apply Lemma 10.1 repeatedly; each application removes a vertex without lowering δ or q, so the process stops, at a graph satisfying the degree conditions.

**Acceptance tests.**
- The multiplicative data never change.

**Dependencies.**
- In this packet: `degree-or-increment`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §8, Lemma 8.5, p. 280; §10, proof, p. 287. The lemma and its proof.

### Sections 10–14: the iteration lemmas

#### `degree-or-increment` — High degree or a quality increment (Lemma 10.1)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.high_degree_or_increment`

If δ > 0, either every vertex has μ(Γ(v)) ≥ (9δ/10)μ(𝒲) and μ(Γ(w)) ≥ (9δ/10)μ(𝒱), or there is G' ⪯ G with the same multiplicative data, δ' ≥ δ, q(G') ≥ q(G), and 𝒱' ⊊ 𝒱 or 𝒲' ⊊ 𝒲.

**Hypotheses.**
- G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) is a GCD graph (PM.3/gcd-graph) with edge density δ; μ(ℰ) = Σ_{(v,w)∈ℰ} μ(v)μ(w), 𝒱_{p^k} = {v ∈ 𝒱 : p^k ∥ v}, and G_{p^k,p^ℓ} is the special subgraph of Definition 6.5.

**Proof, in steps.**
1. If v has μ(Γ(v)) < (9δ/10)μ(𝒲), delete v: μ(ℰ') = μ(ℰ) − μ(v)μ(Γ(v)) > μ(ℰ)/10 > 0.
2. δ' ≥ δ(1 + (μ(v)/10)/(μ(𝒱) − μ(v))), and by Bernoulli (δ')¹⁰μ(𝒱 \ {v})μ(𝒲) ≥ δ¹⁰μ(𝒱)μ(𝒲), so q(G') ≥ q(G). The case of w is symmetric.

**Acceptance tests.**
- Deleting a vertex of zero weight changes nothing.

**Dependencies.**
- In this packet: `gcd-graph-quality`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §10, Lemma 10.1 and proof, pp. 286–287. The lemma and its proof.

#### `partition-pigeonhole` — One part has limited quality loss (Lemma 11.2)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.exists_part_subgraph`

If δ > 0 and 𝒱 = 𝒱₁ ⊔ … ⊔ 𝒱_I, 𝒲 = 𝒲₁ ⊔ … ⊔ 𝒲_J, there are i, j such that G' = (μ, 𝒱ᵢ, 𝒲ⱼ, ℰ ∩ (𝒱ᵢ × 𝒲ⱼ), 𝒫, f, g) has δ' ≥ δ/(IJ) > 0 and q(G') ≥ q(G)/(IJ)¹⁰.

**Hypotheses.**
- G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) is a GCD graph (PM.3/gcd-graph) with edge density δ; μ(ℰ) = Σ_{(v,w)∈ℰ} μ(v)μ(w), 𝒱_{p^k} = {v ∈ 𝒱 : p^k ∥ v}, and G_{p^k,p^ℓ} is the special subgraph of Definition 6.5.

**Proof, in steps.**
1. Pigeonhole: some ℰ_{i,j} has μ(ℰ_{i,j}) ≥ μ(ℰ)/(IJ).
2. δ'/δ ≥ μ(ℰ_{i,j})/μ(ℰ) and q'/q ≥ (μ(ℰ_{i,j})/μ(ℰ))¹⁰, because the vertex ratios are at least 1.

**Acceptance tests.**
- I = J = 1 returns G.

**Dependencies.**
- In this packet: `gcd-graph-quality`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §11, Lemma 11.2 and proof, p. 288. The lemma and its proof.

#### `unbalanced-sets-few-edges` — Few edges between unbalanced sets (Lemmas 11.3 and 11.4)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.restrictPow_increment_or_few_edges`

Let δ > 0, p ∉ 𝒫 prime, r ≥ 1, k ≥ 0 with p^r > 10²⁰⁰⁰ and μ(𝒲_{p^k}) ≥ (1 − 10⁴⁰/p)μ(𝒲), and L_{k,r} = {ℓ : |ℓ − k| ≥ r + 1}. Then either (a) some ℓ ∈ L_{k,r} has q(G_{p^k,p^ℓ}) > 2q(G) and δ_{p^k,p^ℓ}q(G_{p^k,p^ℓ}) > 2δq(G), or (b) Σ_{ℓ∈L_{k,r}} μ(ℰ_{p^k,p^ℓ}) ≤ μ(ℰ)/(4p^{31/30}). Lemma 11.4 is the same with the roles of 𝒱 and 𝒲 exchanged.

**Hypotheses.**
- G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) is a GCD graph (PM.3/gcd-graph) with edge density δ; μ(ℰ) = Σ_{(v,w)∈ℰ} μ(v)μ(w), 𝒱_{p^k} = {v ∈ 𝒱 : p^k ∥ v}, and G_{p^k,p^ℓ} is the special subgraph of Definition 6.5.
- The source assumes p ∈ ℛ(G); p ∉ 𝒫 suffices (E13).

**Proof, in steps.**
1. If (b) fails, some ℓ ∈ L_{k,r} has μ(ℰ_{p^k,p^ℓ}) > μ(ℰ)/(300·2^{|k−ℓ|/20}p^{31/30}), since Σ_j 2^{−|j|/20} ≤ 60.
2. μ(𝒲_{p^ℓ}) ≤ 10⁴⁰μ(𝒲)/p. By Lemma 11.1, q(G_{p^k,p^ℓ})/q(G) ≥ p^{−4/3}(p/2^{1/2})^{|k−ℓ|}/10³⁸⁵ ≥ p^{r/3}/(2^{4/3}·10³⁸⁵) > 2, using |k−ℓ| ≥ r + 1 ≥ 2r/3 + 4/3 and p^r > 10²⁰⁰⁰.
3. Likewise (δ'/δ)(q'/q) ≥ p^{−41/30}(p/2^{11/20})^{|k−ℓ|}/10⁴²⁸ ≥ (p^{9/20})^{19r/30}/(2^{41·11/600}·10⁴²⁸) > 2.

**Acceptance tests.**
- If p ≤ 10⁴⁰ the density hypothesis is vacuous.

**Dependencies.**
- In this packet: `special-subgraph-quality-ratio`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §11, Lemmas 11.3 and 11.4, pp. 288–290. The lemmas and the proof of 11.3.

#### `small-sets-few-edges` — Few edges between small sets (Lemma 11.5)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.few_edges_small_sets_or_increment`

Let δ > 0 and η ∈ (0,1). Either every A ⊆ 𝒱, B ⊆ 𝒲 with μ(A) ≤ ημ(𝒱), μ(B) ≤ ημ(𝒲) has μ(ℰ ∩ (A × B)) ≤ η^{9/5}μ(ℰ), or there is G' ⪯ G with the same multiplicative data, q(G') > q(G), 𝒱' ⊊ 𝒱 and 𝒲' ⊊ 𝒲.

**Hypotheses.**
- G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) is a GCD graph (PM.3/gcd-graph) with edge density δ; μ(ℰ) = Σ_{(v,w)∈ℰ} μ(v)μ(w), 𝒱_{p^k} = {v ∈ 𝒱 : p^k ∥ v}, and G_{p^k,p^ℓ} is the special subgraph of Definition 6.5.

**Proof, in steps.**
1. If A, B violate the bound, G' = (μ, A, B, ℰ ∩ (A × B), 𝒫, f, g) is non-trivial, A ⊊ 𝒱 and B ⊊ 𝒲 (η < 1), and q(G')/q(G) > (η^{9/5})¹⁰/(η⁹η⁹) = 1.

**Acceptance tests.**
- The exponent 9/5 balances 10 against 9 + 9.

**Dependencies.**
- In this packet: `gcd-graph-quality`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §11, Lemma 11.5 and proof, p. 290. The lemma and its proof.

#### `small-sets-subgraph` — Subgraph with few edges between small sets (Lemma 11.6)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.exists_subgraph_few_edges_small_sets`

Let δ > 0 and η ∈ (0,1). There is G' ⪯ G with the same multiplicative data, δ' > 0, q(G') ≥ q(G), and μ(ℰ' ∩ (A × B)) ≤ η^{9/5}μ(ℰ') whenever μ(A) ≤ ημ(𝒱'), μ(B) ≤ ημ(𝒲').

**Hypotheses.**
- G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) is a GCD graph (PM.3/gcd-graph) with edge density δ; μ(ℰ) = Σ_{(v,w)∈ℰ} μ(v)μ(w), 𝒱_{p^k} = {v ∈ 𝒱 : p^k ∥ v}, and G_{p^k,p^ℓ} is the special subgraph of Definition 6.5.

**Proof, in steps.**
1. Iterate Lemma 11.5; the vertex sets strictly shrink, so the process stops, and the quality strictly increases along the way.

**Acceptance tests.**
- Used in Lemma 14.1 with η = 10⁴⁰/p.

**Dependencies.**
- In this packet: `small-sets-few-edges`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §11, Lemma 11.6 and proof, pp. 291. The lemma and its proof.

#### `edge-distribution-bound` — Some pair of prime-power classes carries many edges (Lemma 12.1)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.exists_heavy_restriction`

Let p ∉ 𝒫 be prime, α_k = μ(𝒱_{p^k})/μ(𝒱), β_ℓ = μ(𝒲_{p^ℓ})/μ(𝒲). There are k, ℓ with α_k, β_ℓ > 0 and μ(ℰ_{p^k,p^ℓ})/μ(ℰ) ≥ (α_kβ_k)^{9/10} if k = ℓ, and ≥ (α_k(1−β_k) + β_k(1−α_k) + α_ℓ(1−β_ℓ) + β_ℓ(1−α_ℓ))/(2^{|k−ℓ|/20}·1000) if k ≠ ℓ.

**Hypotheses.**
- G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) is a GCD graph (PM.3/gcd-graph) with edge density δ; μ(ℰ) = Σ_{(v,w)∈ℰ} μ(v)μ(w), 𝒱_{p^k} = {v ∈ 𝒱 : p^k ∥ v}, and G_{p^k,p^ℓ} is the special subgraph of Definition 6.5.
- The source assumes p ∈ ℛ(G); p ∉ 𝒫 suffices (E13).

**Proof, in steps.**
1. Otherwise 1 = Σ_{(k,ℓ)} μ(ℰ_{p^k,p^ℓ})/μ(ℰ) < S₁ + S₂ with S₁ = Σ(α_kβ_k)^{9/10} and S₂ the off-diagonal sum.
2. Σ_{|j|≥1} 2^{−|j|/20} ≤ 100 gives S₂ ≤ (2/5)Σ_{k≠ℓ}α_kβ_ℓ ≤ (2/5)(1 − γ), γ = max α_kβ_k. Cauchy–Schwarz gives S₁ ≤ γ^{2/5}.
3. x^{2/5} + 2(1−x)/5 ≤ 1 on [0,1], a contradiction.

**Acceptance tests.**
- If all vertices have the same p-valuation k, the lemma returns (k,k) with the full edge set.

**Dependencies.**
- In this packet: `gcd-graph-special-subgraph`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §12, Lemma 12.1 and proof, pp. 291–293. The lemma and its proof.

#### `large-prime-increment` — Quality increment unless a prime power divides almost all (Lemma 12.2)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.restrictPow_increment_or_concentrated`

Let δ > 0 and p ∉ 𝒫 a prime with p > 10⁴⁰. Either (a) some G' = G_{p^k,p^ℓ} has δ' > 0 and min{1, δ'/δ}·q(G')/q(G) ≥ 2^{𝟙_{k≠ℓ}}, or (b) some k has μ(𝒱_{p^k}) ≥ (1 − 10⁴⁰/p)μ(𝒱) and μ(𝒲_{p^k}) ≥ (1 − 10⁴⁰/p)μ(𝒲).

**Hypotheses.**
- G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) is a GCD graph (PM.3/gcd-graph) with edge density δ; μ(ℰ) = Σ_{(v,w)∈ℰ} μ(v)μ(w), 𝒱_{p^k} = {v ∈ 𝒱 : p^k ∥ v}, and G_{p^k,p^ℓ} is the special subgraph of Definition 6.5.
- The source assumes p ∈ ℛ(G); p ∉ 𝒫 suffices (E13). In case (a), 𝒫' = 𝒫 ∪ {p} and ℛ(G') ⊆ ℛ(G) \ {p}.

**Proof, in steps.**
1. Take k, ℓ from Lemma 12.1. If k = ℓ, Lemma 11.1 gives q'/q ≥ 1 and δ'/δ ≥ (α_kβ_k)^{−1/10} ≥ 1.
2. If k ≠ ℓ, with S = α_k(1−β_k) + β_k(1−α_k) + α_ℓ(1−β_ℓ) + β_ℓ(1−α_ℓ) ≥ α_kβ_ℓ: min{q'/q, (δ'/δ)(q'/q)} ≥ S²/(1000¹¹α_kβ_ℓ)·(p/2^{11/20})^{|k−ℓ|} (12.3).
3. If (a) fails, S ≤ 10³⁴/p ≤ 1/5, and S ≥ (α_k + β_ℓ)(1 − max{α_ℓ, β_k}) with AM–GM gives max{α_ℓ, β_k} ≥ 1/2. If β_k ≥ 1/2 then 1 − α_k ≤ 2S and then 1 − β_k ≤ 2S, both ≤ 10⁴⁰/p; the other case is symmetric.

**Acceptance tests.**
- Case (b) is exactly p ∈ ℛ♯ when p ∈ ℛ(G).

**Dependencies.**
- In this packet: `edge-distribution-bound`, `special-subgraph-quality-ratio`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §12, Lemma 12.2 and proof, pp. 293–295. The lemma and its proof.

#### `any-prime-bounded-loss` — Small quality loss or a dominant prime power (Lemma 13.1)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.restrictPow_bounded_loss_or_concentrated`

Let δ > 0 and p ∉ 𝒫 prime. Either (a) some G' = G_{p^k,p^ℓ} has δ' > 0 and min{1, δ'/δ}·q(G')/q(G) ≥ 10^{−40}, or (b) some k has μ(𝒱_{p^k}) ≥ (9/10)μ(𝒱) and μ(𝒲_{p^k}) ≥ (9/10)μ(𝒲).

**Hypotheses.**
- G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) is a GCD graph (PM.3/gcd-graph) with edge density δ; μ(ℰ) = Σ_{(v,w)∈ℰ} μ(v)μ(w), 𝒱_{p^k} = {v ∈ 𝒱 : p^k ∥ v}, and G_{p^k,p^ℓ} is the special subgraph of Definition 6.5.
- The source assumes p ∈ ℛ(G); p ∉ 𝒫 suffices (E13).

**Proof, in steps.**
1. Proceed as in Lemma 12.2 up to (12.3), which does not use the size of p. If k = ℓ, (a) holds.
2. If k ≠ ℓ and (a) fails, S ≤ S²/(α_kβ_ℓ) ≤ 10^{−7}, so max{α_ℓ, β_k} ≥ 9/10; if β_k ≥ 9/10 then 1 − α_k ≤ 2S, so α_k ≥ 9/10. The other case is symmetric.

**Acceptance tests.**
- No lower bound on p is needed.

**Dependencies.**
- In this packet: `edge-distribution-bound`, `special-subgraph-quality-ratio`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §13, Lemma 13.1 and proof, p. 296. The lemma and its proof.

#### `add-small-prime` — Adding a small prime to 𝒫 (Lemma 13.2)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.exists_subgraph_add_small_prime`

Let δ > 0 and p ∈ ℛ(G) with p ≤ 10²⁰⁰⁰. There is G' ⪯ G with 𝒫' = 𝒫 ∪ {p}, ℛ(G') ⊆ ℛ(G) \ {p}, δ' > 0 and min{1, δ'/δ}·q(G')/q(G) ≥ 10^{−50}.

**Hypotheses.**
- G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) is a GCD graph (PM.3/gcd-graph) with edge density δ; μ(ℰ) = Σ_{(v,w)∈ℰ} μ(v)μ(w), 𝒱_{p^k} = {v ∈ 𝒱 : p^k ∥ v}, and G_{p^k,p^ℓ} is the special subgraph of Definition 6.5.

**Proof, in steps.**
1. Apply Lemma 10.1 until every v has μ(Γ(v)) ≥ (9δ⁽¹⁾/10)μ(𝒲⁽¹⁾); δ and q do not drop. (p may leave ℛ(G⁽¹⁾); the lemmas below need only p ∉ 𝒫, E13.)
2. Lemma 13.1: (a) finishes; otherwise some k has both classes of density ≥ 9/10. If p > 10⁴¹, Lemma 12.2 either finishes or gives a class of density ≥ 1 − 10⁴⁰/p, which must be the same k (13.2).
3. Fix r ≤ 6644 with p^r > 10²⁰⁰⁰ and apply Lemma 11.3: (a) finishes; (b) leaves at most μ(ℰ)/4 on classes |ℓ − k| > r. Restricting to 𝒱_{p^k} and the classes |ℓ − k| ≤ r keeps at least 56% of the edges, so δ and q lose at most 2 and 2¹⁰.
4. Lemma 11.2 on the at most 2·6644 + 1 ≤ 15000 classes gives some ℓ with q ≥ q/(15000¹⁰·2¹⁰) ≥ q/10⁵⁰ and δq ≥ δq/10⁵⁰; G_{p^k,p^ℓ} has at least this quality.

**Acceptance tests.**
- 2^{6644} > 10²⁰⁰⁰, so r ≤ 6644 exists for every prime.

**Dependencies.**
- In this packet: `degree-or-increment`, `any-prime-bounded-loss`, `large-prime-increment`, `unbalanced-sets-few-edges`, `partition-pigeonhole`, `special-subgraph-quality-ratio`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §13, Lemma 13.2 and proof, pp. 297–299. The lemma and its proof.

#### `sharp-prime-increment` — Quality increment even when a prime power divides almost all (Lemma 14.1)

*lemma* · proposed `TauCeti.DuffinSchaeffer.GCDGraph.exists_subgraph_add_large_prime`

Let δ > 0 and p ∈ ℛ(G) with p ≥ 10²⁰⁰⁰. There is G' ⪯ G with 𝒫' = 𝒫 ∪ {p}, ℛ(G') ⊆ ℛ(G) \ {p} and q(G') ≥ q(G) > 0.

**Hypotheses.**
- G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) is a GCD graph (PM.3/gcd-graph) with edge density δ; μ(ℰ) = Σ_{(v,w)∈ℰ} μ(v)μ(w), 𝒱_{p^k} = {v ∈ 𝒱 : p^k ∥ v}, and G_{p^k,p^ℓ} is the special subgraph of Definition 6.5.

**Proof, in steps.**
1. By Lemma 11.6 with η = 10⁴⁰/p assume few edges between small sets (14.1); p may leave ℛ, which does not matter (E13). Lemma 12.2 either finishes or gives k with both classes of density ≥ 1 − 10⁴⁰/p.
2. Lemmas 11.3 and 11.4 with r = 1 either finish or bound the edges from class k to classes at distance ≥ 2 by μ(ℰ)/(4p^{31/30}) (14.3)–(14.4). With (14.2), the edge set ℰ* = ℰ(𝒱_{p^k}, 𝒲̃_{p^k}) ∪ ℰ(𝒱̃_{p^k}, 𝒲_{p^k}) keeps a proportion (1 − p^{−31/30})^{2/3}, so q(G*) ≥ (1 − p^{−31/30})^{20/3}q(G) (14.5).
3. Split ℰ* into G⁺ (classes k, k+1 with f(p) = g(p) = k) and G_{p^k,p^{k−1}}, G_{p^{k−1},p^k}. If k = 0 then q(G⁺) ≥ q(G*)/(1 − p^{−31/30})¹⁰ ≥ q(G); the source writes equality here (E12).
4. If k ≥ 1, write the (k−1)-classes as densities A/p, B/p with A, B ≤ 10⁴⁰. One of (14.13)–(14.15) holds because S < 1 (using 1 − x ≤ e^{−x} ≤ 1 − x + x²/2 and the weighted AM–GM (9A + 1)/10 ≥ A^{9/10}); the corresponding graph among G⁺, G_{p^k,p^{k−1}}, G_{p^{k−1},p^k} has q ≥ q(G). The source prints k+1 for k−1 here (E14).

**Acceptance tests.**
- The factor (1 − 𝟙_{f=g≥1}/p)^{−2} in the quality is what makes G⁺ gain when k ≥ 1.

**Dependencies.**
- In this packet: `small-sets-subgraph`, `large-prime-increment`, `unbalanced-sets-few-edges`, `special-subgraph-quality-ratio`

**Sources.**
- Koukoulopoulos–Maynard, *On the Duffin–Schaeffer conjecture* — §14, Lemma 14.1 and proof, pp. 300–304. The lemma and its proof.

### Source findings in Koukoulopoulos–Maynard

Five new, unreviewed findings are recorded against the published text. Each is also present in arXiv v3.
- **E10 (error).** Lemma 5.3's indicator 𝟙_{M(q,r) ≥ gcd(q,r)} should be 𝟙_{2M(q,r) ≥ gcd(q,r)}.
  - Counterexample: q = 2, r = 3, ψ ≡ 3/10. Then 𝒜₂ ∩ 𝒜₃ has measure 1/6, although M = 9/10 < 1 = gcd.
  - The proof of Theorem 1 is unaffected.
- **E11 (misprint).** The proof of Theorem 1 cites (1.4) for 𝒜_q, which is defined in (1.3).
- **E12 (error, harmless).** In Case 1 of Lemma 14.1, G⁺ can have smaller vertex sets than G*, so the stated quality equality is only an inequality. The inequality is what the proof needs.
- **E13 (gap).** Lemmas 13.2 and 14.1 apply lemmas that assume p ∈ ℛ(G) to subgraphs from which p may have left ℛ.
  - The fix: those lemmas need only p ∉ 𝒫, and the nodes here state them that way.
- **E14 (misprint).** The last sentence of the proof of Lemma 14.1 has k+1 where k−1 is meant.

The Annals page lists no erratum.

### Remaining in PM.3

- Lemmas 5.2 and 5.3 are imported from Pollington–Vaughan (1990), which was not read (gap).
- Mertens' theorems, with Rosser–Schoenfeld's effective error, are requested from AnalyticNumberTheory:AN.2.
- Lemma 7.2 is used only in an elementary special case, which is proved in its node; Koukoulopoulos's book is not needed.
- Corollary3, general-gauge mass transference and Hausdorff versions now have nodes below; their native measure-extension and original higher-dimensional proof inputs remain explicit.
- Section 15's counterexample to the Model Problem, which shows why the φ(v)/v weights matter, is recorded in acceptance notes only.

### Verification of the Duffin–Schaeffer checkpoint

- The new `TauCeti.DuffinSchaeffer` Lean section imports Mathlib only.
  - Standalone, on Lean 4.34.0-rc2 against Mathlib 082e2d3, it elaborates with no errors and only proof-placeholder warnings.
  - The whole suggested file also imports Tau Ceti modules, and no pinned Tau Ceti build exists on this machine, so the full file was not elaborated.
- The official blueprint checker passes, as do the intake file check and the repository unit tests.

## Continuation across all six stages

All declarations in this continuation remain unchecked. The purpose of the dependency graph is to distinguish the arithmetic and analytic work from native infrastructure. A planned stage has its targets and key inputs stated, with every unresolved input exposed; it is not a claim of mathematical or Lean closure. Historical source-reading and compilation receipts in the preceding sections describe their own earlier passes.

The finite integer laws sample1 throughN. Geometric prime models use exponent zero as a possible value and success parameter1−1/p. Discrepancy samples use N points and the strict cut x_j<t. Normal digits use the native canonical expansion, overlapping windows and positions0 throughN−1. Gauss digits are indexed from zero, so digit n means the (n+1)st continued-fraction denominator. Rational termination is totalized only for the real digit observable; denominator comparison theorems require irrational input. Hausdorff measures use the native diameter convention, with a separate comparison to the source’s radius convention.

The short-interval paper includes both integer endpoints and normalizes by h, so a constant-one sample has mean(h+1)/h. The logarithmic correlation interval is x/w<n≤x, weighted by1/n and divided by log w. Positive slopes with integer shifts use native zero extension outside positive inputs. The correlation has no complex conjugate. Steinhaus covariance, by contrast, requires conjugation; the Rademacher model is supported on squarefree inputs, whereas the Steinhaus model is completely multiplicative.

### PM.0 — additive arithmetic and distribution interfaces

The generic carrier is the native zero hom ArithmeticFunction. Additivity requires f(1)=0 and the coprime product law; strong additivity adds constancy on positive prime powers. Native omega satisfies the strong law and native Omega fails it. Prime-power representation then recovers the general additive value from factorization. The probability law is the existing native ProbabilityMeasure, and concentration is a real supremum of strict-window mass. A zero-radius window has zero mass even at an atom; two equally weighted atoms distance one apart have concentration1/2 at radius1/2. These endpoint tests prevent a silent radius/length change.

The quantitative Kubilius target compares full small-prime exponents with independent native geometric laws. Its exponential total-variation error is a separate growing-prime theorem. Exact complete-period CRT identities and finite atom estimates do not prove it when the full prime product exceeds the sample size. The original small-prime proof and product-law realization are gaps. The real CDF criterion permits atoms and tests only continuity points. A moment-determinate Gaussian alone is not a theorem that arithmetic moments converge.

#### Additive arithmetic functions

`ProbabilisticAndMetricNumberTheory:PM.0/additive-predicate` (definition). For f:ArithmeticFunction R with R an additive commutative monoid, IsAdditive f means f(1)=0 and f(mn)=f(m)+f(n) for positive coprime m,n. Native f(0)=0 is retained; multiplication is on inputs, not Dirichlet convolution.

The proof plan is: Introduce the displayed predicate on the native carrier. The positive-input guards avoid imposing a false law at zero. The API is used by prime-power representation and the quadratic mean bound.

Direct prerequisites: `mathlib:ArithmeticFunction`.

The API laws are `IsAdditive.map_one`: If f is additive, f(1)=0.; `IsAdditive.map_mul`: Additivity on positive coprime products, retaining both positivity hypotheses.; `IsAdditive.add`: The pointwise sum of additive arithmetic functions is additive..

Tests: additive_zero: The native zero arithmetic function is additive.; additive_omega: The real cast of native omega is additive.; additive_Omega: The real cast of native Omega is additive.; additive_unit_rejected: The convolution unit takes value 1 at input 1 and is not additive..

Consumers: ProbabilisticAndMetricNumberTheory:PM.0/additive-prime-powers — Expands arbitrary additive functions from their coprime prime-power factors.; ProbabilisticAndMetricNumberTheory:PM.1/turan-kubilius — Defines the hypothesis of the source quadratic mean inequality..

Source: ElsholtzTao2011, Appendix A, Lemma A.2, physical pp.38–39.

#### IsAdditive.map_one

`ProbabilisticAndMetricNumberTheory:PM.0/additive-predicate-api-1` (lemma). If f is additive, f(1)=0.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/additive-predicate`.

Source: ElsholtzTao2011, Appendix A, Lemma A.2, physical pp.38–39.

#### IsAdditive.map_mul

`ProbabilisticAndMetricNumberTheory:PM.0/additive-predicate-api-2` (lemma). Additivity on positive coprime products, retaining both positivity hypotheses.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/additive-predicate`.

Source: ElsholtzTao2011, Appendix A, Lemma A.2, physical pp.38–39.

#### IsAdditive.add

`ProbabilisticAndMetricNumberTheory:PM.0/additive-predicate-api-3` (lemma). The pointwise sum of additive arithmetic functions is additive.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/additive-predicate`.

Source: ElsholtzTao2011, Appendix A, Lemma A.2, physical pp.38–39.

#### Strongly additive arithmetic functions

`ProbabilisticAndMetricNumberTheory:PM.0/strongly-additive-predicate` (definition). For f:ArithmeticFunction R, IsStronglyAdditive f means IsAdditive f and f(p^k)=f(p) for every natural prime p and k≥1. It is different from complete additivity f(mn)=f(m)+f(n) on all positive inputs.

The proof plan is: Add the explicit prime-power clause to IsAdditive; no change of arithmetic-function carrier. This clause is needed to replace the prime-power representation by the distinct-prime sum.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/additive-predicate`.

The API laws are `IsStronglyAdditive.isAdditive`: A strongly additive function is additive.; `IsStronglyAdditive.prime_pow`: For p prime and k>0, f(p^k)=f(p).; `IsStronglyAdditive.add`: Pointwise addition preserves strong additivity..

Tests: strong_zero: Zero is strongly additive.; strong_omega: Native omega, cast to real arithmetic functions, is strongly additive.; strong_Omega_rejected: Native Omega is not strongly additive: Omega(4)=2 but Omega(2)=1..

Consumers: ProbabilisticAndMetricNumberTheory:PM.0/strongly-additive-primes — Removes exponents from the prime-power representation.; ProbabilisticAndMetricNumberTheory:PM.1 — Distinguishes omega from Omega in the normal-order argument..

Source: ElsholtzTao2011, Appendix A, paragraph before Lemma A.3, physical p.39.

#### IsStronglyAdditive.isAdditive

`ProbabilisticAndMetricNumberTheory:PM.0/strongly-additive-predicate-api-1` (lemma). A strongly additive function is additive.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/strongly-additive-predicate`.

Source: ElsholtzTao2011, Appendix A, paragraph before Lemma A.3, physical p.39.

#### IsStronglyAdditive.prime_pow

`ProbabilisticAndMetricNumberTheory:PM.0/strongly-additive-predicate-api-2` (lemma). For p prime and k>0, f(p^k)=f(p).

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/strongly-additive-predicate`.

Source: ElsholtzTao2011, Appendix A, paragraph before Lemma A.3, physical p.39.

#### IsStronglyAdditive.add

`ProbabilisticAndMetricNumberTheory:PM.0/strongly-additive-predicate-api-3` (lemma). Pointwise addition preserves strong additivity.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/strongly-additive-predicate`.

Source: ElsholtzTao2011, Appendix A, paragraph before Lemma A.3, physical p.39.

#### Prime-power representation of additive functions

`ProbabilisticAndMetricNumberTheory:PM.0/additive-prime-powers` (lemma). For additive f:ArithmeticFunction R and n>0, f(n)=Σ_{p∈n.primeFactors}f(p^(n.factorization p)); this is the empty sum at n=1.

The proof plan is: Factor n as the product of its positive prime powers. Distinct prime powers are pairwise coprime. Induct on that finite product using IsAdditive.map_mul and f(1)=0. No independent random model is used.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/additive-predicate`, `mathlib:ArithmeticFunction`, `ProbabilisticAndMetricNumberTheory:PM.0/additive-predicate-api-2`.

Source: ML-PM79, ArithmeticFunction.Defs and Nat.factorization; elementary specialization of native factorization.

#### Distinct-prime representation

`ProbabilisticAndMetricNumberTheory:PM.0/strongly-additive-primes` (lemma). For strongly additive f and n>0, f(n)=Σ_{p∈n.primeFactors}f(p).

The proof plan is: Use the prime-power representation and positivity of every factorization exponent on primeFactors. Apply IsStronglyAdditive.prime_pow term by term.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/strongly-additive-predicate`, `ProbabilisticAndMetricNumberTheory:PM.0/additive-prime-powers`, `ProbabilisticAndMetricNumberTheory:PM.0/strongly-additive-predicate-api-2`.

Source: ElsholtzTao2011, Appendix A, strongly additive convention.

#### Concentration function of a real law

`ProbabilisticAndMetricNumberTheory:PM.0/real-concentration` (definition). For ν:ProbabilityMeasure ℝ and δ∈ℝ, Q(ν,δ)=sup_{u∈ℝ}ν.real((u−δ,u+δ)). The intervals are strict and δ is the radius, not the length. For δ≤0 the value is zero.

The proof plan is: Use native real measure on Ioo and real sSup. All terms lie in [0,1], so the supremum is bounded. Consumers pass native pushforward laws of measurable real observations. Do not apply the real theorem directly to complex observations.

Direct prerequisites: `mathlib:MeasureTheory.ProbabilityMeasure`.

The API laws are `concentration_bounds`: For every real radius, 0≤Q≤1.; `concentration_mono`: Increasing the radius cannot decrease Q.; `concentration_translate`: Translation of a real law leaves Q unchanged.; `concentration_scale`: For a≠0, Q(law(aX),δ)=Q(law(X),δ/|a|)..

Tests: concentration_zero_radius: A dirac law has zero concentration at zero radius because the interval is strict.; concentration_dirac_positive: A dirac law has concentration one at every positive radius.; concentration_two_atoms_boundary: For equal atoms at 0 and 1, radius 1/2 has Q=1/2; closed intervals would wrongly give 1..

Consumers: ProbabilisticAndMetricNumberTheory:PM.0/kolmogorov-rogozin — The deficit sum 1−Q of each independent real summand controls the sum.; PAPER-BARY-SOROKER-KOUKOULOPOULOS-KOZMA2023/61,/62 — Supplies the generic real concentration interface; polynomial complex root projections remain the paper owner’s responsibility..

Source: BSKK2023, Lemma 7.2, physical p.36, concentration convention.

#### concentration_bounds

`ProbabilisticAndMetricNumberTheory:PM.0/real-concentration-api-1` (lemma). For every real radius, 0≤Q≤1.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/real-concentration`.

Source: BSKK2023, Lemma 7.2, physical p.36, concentration convention.

#### concentration_mono

`ProbabilisticAndMetricNumberTheory:PM.0/real-concentration-api-2` (lemma). Increasing the radius cannot decrease Q.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/real-concentration`.

Source: BSKK2023, Lemma 7.2, physical p.36, concentration convention.

#### concentration_translate

`ProbabilisticAndMetricNumberTheory:PM.0/real-concentration-api-3` (lemma). Translation of a real law leaves Q unchanged.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/real-concentration`.

Source: BSKK2023, Lemma 7.2, physical p.36, concentration convention.

#### concentration_scale

`ProbabilisticAndMetricNumberTheory:PM.0/real-concentration-api-4` (lemma). For a≠0, Q(law(aX),δ)=Q(law(X),δ/|a|).

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/real-concentration`.

Source: BSKK2023, Lemma 7.2, physical p.36, concentration convention.

#### Kolmogorov–Rogozin inequality

`ProbabilisticAndMetricNumberTheory:PM.0/kolmogorov-rogozin` (theorem). There is an absolute C>0 such that for every finite independent family of a.e. measurable real random variables X_j on a probability space, every δ>0, and D=Σ_j(1−Q(law X_j,δ))>0, Q(law(Σ_j X_j),δ)≤C/sqrt(D). Radii are equal; the D=0 case is the separate trivial bound Q≤1.

The proof plan is: Match equal-radius real Kolmogorov–Rogozin, with native iIndepFun and native pushforwards. The original proof of the independent-sum concentration estimate in the cited references remains an explicit gap.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/real-concentration`.

Source: BSKK2023, Lemma 7.2, physical p.36; references [19,33,34].

#### CDF continuity-point criterion

`ProbabilisticAndMetricNumberTheory:PM.0/cdf-weak-criterion` (theorem). For ν_m,ν:ProbabilityMeasure ℝ, ν_m converges weakly to ν if and only if cdf(ν_m,x)→cdf(ν,x) at every continuity point x of the limiting native CDF. Atoms of ν are allowed; no convergence is demanded at their jumps.

The proof plan is: Forward: apply the native null-frontier Portmanteau theorem to Iic at a continuity point. Reverse: subtract CDF limits on half-open intervals with continuity endpoints; these form a measurable pi-system and arbitrarily small neighborhoods. Apply the native pi-system theorem. The density of continuity points follows from countability of atoms; confirm the exact native atom/countability lemmas before implementing this bridge.

Direct prerequisites: `mathlib:MeasureTheory.ProbabilityMeasure`, `mathlib:ProbabilityTheory.cdf_eq_real`, `mathlib:IsPiSystem.tendsto_probabilityMeasure_of_tendsto_of_mem`.

Source: ML-PM79, CDF.cdf_eq_real and Portmanteau.IsPiSystem.tendsto_probabilityMeasure_of_tendsto_of_mem.

#### Kubilius small-prime valuation comparison

`ProbabilisticAndMetricNumberTheory:PM.0/kubilius-small-prime-model` (theorem). For each positive integer N sample J_N uniformly from {1,…,N}. Let β_N>0 tend to infinity and P_N={p prime:p≤N^(1/β_N)}. The joint valuation vector (J_N.factorization p)_(p∈P_N) is compared with independent geometric exponents G_p having P(G_p=k)=(1−1/p)p^(−k), k≥0. There are C,δ>0 (independent of N) such that, eventually, their total variation distance is at most C exp(−δβ_N). Total variation is one-half the sum of absolute atom-probability differences. Positive support is essential; a coordinate is an exponent, not merely a divisibility bit.

The proof plan is: Use the native factorization map on the finite positive integer sample and the native finite product of geometricMeasure with success parameter 1−1/p. The bound (1.1) is quoted there from Kubilius [10], not proved by the finite CRT comparison: acquire and decompose the fundamental-lemma/small-prime estimate before closure. The displayed signature uses fully specified native model atom laws, without claiming a private carrier or a supplied independence theorem proves the arithmetic comparison.

Direct prerequisites: `mathlib:ProbabilityTheory.geometricMeasure`, `mathlib:ProbabilityTheory.geometricMeasure_real_singleton`, `mathlib:Nat.primesLE`, `ProbabilisticAndMetricNumberTheory:PM.0/complete-period-joint-law`.

Source: Kubilius2021, Classical uniform result (1.1), physical p.2, and exact atom convention (1.6), p.3.

### PM.1 — normal order and Gaussian arithmetic laws

Turán–Kubilius uses A_N=Σf(p^k)/p^k and B_N²=Σ|f(p^k)|²/p^k, with coefficient30 from the acquired Elsholtz–Tao statement. Its uniform quadratic-mean proof is not supplied by a finite independence computation. Hardy–Ramanujan uses deviations on the log log N scale. Erdős–Kac uses the square-root scale and the native standard Gaussian CDF, for both omega and Omega. The preserved repeated-factor estimates transfer the two functions only after genuine convergence is established.

The source proof chooses a moment-order-dependent prime cutoff and controls growing Gaussian moments, collisions, large-prime removal and Mertens normalization separately. Its fixed even-moment bounds are useful without being a completed asymptotic theorem. The Koymans–Pagano application conditions on positive squarefree integers whose prime factors are1 or2 modulo4. Its mean is half log log N, its exceptional window is at least(log log N)^(2/3), and its error is relative to the restricted family. Ordinary Erdős–Kac by itself does not give that conditional quantitative bound.

#### Turán–Kubilius quadratic mean inequality

`ProbabilisticAndMetricNumberTheory:PM.1/turan-kubilius` (theorem). For real additive f and N≥2, put A_N=Σ_{p prime,k≥1,p^k≤N}f(p^k)/p^k and B_N²=Σ_{p prime,k≥1,p^k≤N}|f(p^k)|²/p^k. Then Σ_{1≤n≤N}|f(n)−A_N|²≤30 N B_N². This is precisely Elsholtz–Tao Lemma A.2; a different centering with (1−1/p) is not substituted.

The proof plan is: The displayed finite prime-power expressions use the native prime set and factorization convention. The cited quadratic-mean proof [60, p.20] is unread; its uniform covariance estimates are a recorded gap, not an application of finite-head independence.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.0/additive-predicate`, `ProbabilisticAndMetricNumberTheory:PM.0/additive-prime-powers`, `mathlib:Nat.primesLE`, `AnalyticNumberTheory:AN.2`.

Source: ElsholtzTao2011, Appendix A, Lemma A.2, physical p.38.

#### Hardy–Ramanujan normal order

`ProbabilisticAndMetricNumberTheory:PM.1/hardy-ramanujan` (theorem). For every ε>0, both fractions #{1≤n≤N: |ω(n)−log log N|>ε log log N}/N and #{1≤n≤N: |Ω(n)−log log N|>ε log log N}/N tend to zero. These are normal-order laws, with ω and Ω the native distinct and repeated factor counts.

The proof plan is: Apply the exact source mean-square estimate to omega, compare its source A_N and B_N² to log log N using the requested reciprocal-prime asymptotic. Use the quadratic Markov bound. Transfer to Omega using the inherited uniform O(1) mean of Omega−omega and a linear Markov estimate.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.1/turan-kubilius`, `ProbabilisticAndMetricNumberTheory:PM.0/excess-mean-bound`, `AnalyticNumberTheory:AN.2`.

Source: ElsholtzTao2011, Appendix A, discussion after Lemma A.2, physical pp.38–39.

#### Erdős–Kac Gaussian law

`ProbabilisticAndMetricNumberTheory:PM.1/erdos-kac` (theorem). For every real x, the fractions of positive n≤N with (ω(n)−log log N)/sqrt(log log N)≤x tend to cdf(gaussianReal(0,1),x); the same statement holds for Ω. The scale is sqrt(log log N), and Gaussian variance is 1.

The proof plan is: Choose a moment-order-dependent prime cutoff, normalize the inherited pairing and collision bounds and show their errors tend to zero for each fixed order. Use reciprocal-prime asymptotics and a Gaussian moment-convergence theorem, not moment determinacy alone. These analytic limit inputs remain recorded gaps. Apply the continuity-point CDF bridge (the Gaussian CDF is continuous) and the inherited omega/Omega transfer.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.1/finite-even-gaussian-bound`, `ProbabilisticAndMetricNumberTheory:PM.1/finite-odd-moment-bound`, `ProbabilisticAndMetricNumberTheory:PM.1/cutoff-moment-transfer`, `ProbabilisticAndMetricNumberTheory:PM.0/excess-distribution-transfer`, `ProbabilisticAndMetricNumberTheory:PM.0/cdf-weak-criterion`, `AnalyticNumberTheory:AN.2`.

Source: GS-SIEVING, Author copy physical pp.2–4: (5), Theorem 1 and its deduction; new target combines the preserved fixed-moment nodes.

#### Restricted squarefree prime-factor window

`ProbabilisticAndMetricNumberTheory:PM.1/restricted-squarefree-window` (theorem). For D(N)={d∈ℕ:0<d<N, d squarefree, and every prime divisor is 1 or 2 modulo 4}, there are absolute C,N₀>0 such that for N≥N₀ the number of d∈D(N) with |ω(d)−(1/2)log log N|≥(log log N)^(2/3) is at most C|D(N)|/(log log N)^(1/100). Routed item PAPER-KOYMANS-PAGANO/175. The printed union of cardinalities is read as the sum, following the independently confirmed extraction E29.

The proof plan is: Use the already routed family convention and sum the disjoint integer r-slices; the extraction’s E29 supplies the corrected summation symbol. A quantitative concentration estimate conditional on this restricted family is a separate missing input. The ordinary Erdős–Kac theorem has center log log N and supplies neither the half-center nor this relative polynomial tail.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.1/erdos-kac`.

Source: KoymansPagano2022, Theorem 7.2(a), (7.2), physical p.60; family physical p.2.

### PM.2 — discrepancy and canonical normal digits

The inherited character criterion, Weyl polynomial argument, integer indexing and abelian rational/Ratner decomposition remain in their original carriers. The extension supplies finite star discrepancy and its permutation/perturbation API. Erdős–Turán is a one-dimensional consequence with an explicitly nonsharp constant3. Koksma multiplies discrepancy by the native finite total variation on[0,1]; it is not the multidimensional Hardy–Krause theorem. The sampler’s original majorant and integration-by-parts proof inputs remain gaps.

Normality means every canonical length-k digit block has frequency b^(−k), including overlapping blocks and the empty block. A dense orbit does not supply these frequencies. The proof uses the native expanding-circle ergodicity theorem, the missing pointwise Birkhoff extension and a half-open positional-cylinder comparison. Countability of lengths, words and bases gives simultaneous almost-everywhere normality. The endpoint correction is essential for all-point digit identities, even though the exceptional endpoints are null.

#### Star discrepancy

`ProbabilisticAndMetricNumberTheory:PM.2/star-discrepancy` (definition). For x:Fin N→ℝ, D*(x)=sup_{0≤t≤1}|#{j:x_j<t}/N−t| when N>0; define D*(empty)=0. Arithmetic samples must lie in [0,1). The cut is strict and the normalization is N.

The proof plan is: Use Finset.univ.filter and native real sSup over t∈Icc 0 1; guard the empty sample. Use this same normalization in Koksma and the one-dimensional Erdős–Turán estimate.

Direct prerequisites: `mathlib:MeasureTheory.ProbabilityMeasure`.

The API laws are `starDiscrepancy_bounds`: 0≤D*≤1 for every finite real sample.; `starDiscrepancy_perm`: Reordering the finite sample preserves star discrepancy.; `starDiscrepancy_perturb`: If both samples lie in [0,1) and corresponding points differ by at most ε≥0, their star discrepancies differ by at most ε..

Tests: discrepancy_empty: The guarded empty sample has discrepancy zero.; discrepancy_at_zero: A single point at zero has discrepancy one.; discrepancy_midpoint: A single point at one half has discrepancy one half..

Consumers: ProbabilisticAndMetricNumberTheory:PM.2/erdos-turan — Measures the finite count error bounded by Fourier sums.; ProbabilisticAndMetricNumberTheory:PM.2/koksma — Multiplies the variation in the quadrature error bound..

Source: StrauchPorubsky2018, §1.9 and §1.11.2, physical pp.73–74,95.

#### starDiscrepancy_bounds

`ProbabilisticAndMetricNumberTheory:PM.2/star-discrepancy-api-1` (lemma). 0≤D*≤1 for every finite real sample.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.2/star-discrepancy`.

Source: StrauchPorubsky2018, §1.9 and §1.11.2, physical pp.73–74,95.

#### starDiscrepancy_perm

`ProbabilisticAndMetricNumberTheory:PM.2/star-discrepancy-api-2` (lemma). Reordering the finite sample preserves star discrepancy.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.2/star-discrepancy`.

Source: StrauchPorubsky2018, §1.9 and §1.11.2, physical pp.73–74,95.

#### starDiscrepancy_perturb

`ProbabilisticAndMetricNumberTheory:PM.2/star-discrepancy-api-3` (lemma). If both samples lie in [0,1) and corresponding points differ by at most ε≥0, their star discrepancies differ by at most ε.

The proof plan is: For each t, compare the two empirical counts using the inclusions {x_j<t−ε}⊆{y_j<t}⊆{x_j<t+ε}. Clip t±ε to [0,1], using the support assumptions, then take the two suprema.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.2/star-discrepancy`.

Source: StrauchPorubsky2018, §1.9 and §1.11.2, physical pp.73–74,95.

#### Erdős–Turán discrepancy inequality

`ProbabilisticAndMetricNumberTheory:PM.2/erdos-turan` (theorem). For N,H≥1 and x_j∈[0,1), D*(x)≤3/(H+1)+3Σ_{h=1}^H |N⁻¹Σ_j exp(2πihx_j)|/h. This is the s=1 consequence of the exact extremal-discrepancy constant (3/2)^s in Strauch–Porubský Theorem 1.11.2.1, pairing ±h; no sharp constant is claimed.

The proof plan is: Use interval trigonometric majorants/minorants of degree H to bound count minus length. Pair positive and negative Fourier frequencies, apply D*≤D, and retain the stated factor 3. The referenced Vaaler/Grabner finite-majorant proof is not read; record this input as a gap.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.2/star-discrepancy`.

Source: StrauchPorubsky2018, Theorem 1.11.2.1, physical p.95; D*≤D comparison.

#### Koksma quadrature inequality

`ProbabilisticAndMetricNumberTheory:PM.2/koksma` (theorem). For N≥1, x_j∈[0,1), and f:ℝ→ℝ with native BoundedVariationOn f [0,1], |N⁻¹Σ_j f(x_j)−∫_[0,1] f dvolume|≤(eVariationOn f [0,1]).toReal D*(x). Variation is finite by hypothesis. Values at sampled discontinuities are retained.

The proof plan is: First prove the integration-by-parts bound for a monotone f against empirical distribution minus Lebesgue distribution. Decompose bounded variation into two monotone functions and add their variations. Match native diameter/variation conventions. The referenced full Koksma proof and the exact native Stieltjes bridge still need source acquisition and declaration matching.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.2/star-discrepancy`, `mathlib:BoundedVariationOn`, `mathlib:eVariationOn`.

Source: StrauchPorubsky2018, Theorem 1.9.0.3, physical p.74.

#### Normality in a base

`ProbabilisticAndMetricNumberTheory:PM.2/normal-base` (definition). For b≥2 and x∈[0,1), IsNormalBase b x means that every block w:Fin k→Fin b, including overlapping blocks, has frequency b^(−k) in the canonical native Real.digits x b sequence. Count starting positions 0≤j<N; digits beyond N may occur in the final k−1 windows. The empty block has frequency one.

The proof plan is: State the predicate using canonical native digits and finite windows, not a second digit-expansion carrier. Cylinder indicators for the expanding circle map give the simultaneous countable block-frequency theorem.

Direct prerequisites: `mathlib:Real.digits`.

The API laws are `IsNormalBase.block`: For a normal x each specified block has the stated overlapping frequency.; `IsNormalBase.digit`: Each single digit has frequency 1/b.; `IsNormalBase.empty_block`: The empty block is counted at all N positions, giving limiting frequency one..

Tests: normal_zero_rejected: Zero is not normal in base 2.; normal_half_rejected: One half has terminating canonical binary digits and is not normal.; normal_base_one_rejected: Base one is excluded even though its single digit sequence satisfies a spurious frequency-one formula..

Consumers: ProbabilisticAndMetricNumberTheory:PM.2/borel-normal — Gives the precise Lebesgue almost-everywhere conclusion, beyond density of a circle orbit..

Source: Smyth2020, Lesson 5 pointwise frequency discussion, physical pp.28–29; block version via cylinder observables.

#### IsNormalBase.block

`ProbabilisticAndMetricNumberTheory:PM.2/normal-base-api-1` (lemma). For a normal x each specified block has the stated overlapping frequency.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.2/normal-base`.

Source: Smyth2020, Lesson 5 pointwise frequency discussion, physical pp.28–29; block version via cylinder observables.

#### IsNormalBase.digit

`ProbabilisticAndMetricNumberTheory:PM.2/normal-base-api-2` (lemma). Each single digit has frequency 1/b.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.2/normal-base`.

Source: Smyth2020, Lesson 5 pointwise frequency discussion, physical pp.28–29; block version via cylinder observables.

#### IsNormalBase.empty_block

`ProbabilisticAndMetricNumberTheory:PM.2/normal-base-api-3` (lemma). The empty block is counted at all N positions, giving limiting frequency one.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.2/normal-base`.

Source: Smyth2020, Lesson 5 pointwise frequency discussion, physical pp.28–29; block version via cylinder observables.

#### Digit cylinders and expanding circle orbits

`ProbabilisticAndMetricNumberTheory:PM.2/digit-cylinder-bridge` (lemma). For b≥2, except the countable b-adic endpoint set, the length-k canonical digit block beginning at j equals w if and only if the jth iterate of x↦fract(bx) lies in the half-open base-b cylinder determined by w. Each cylinder has Lebesgue measure b^(−k). The same count is the corresponding Birkhoff indicator sum.

The proof plan is: Evaluate the floor-based native digits on the half-open interval and identify the affine cylinder endpoint by its finite positional sum. Iterate the digit shift and sum indicators. The floor/circle/cylinder comparison needs a fresh detailed native proof; do not identify dense orbits with digit frequencies.

Direct prerequisites: `mathlib:Real.digits`.

Source: Smyth2020, Lesson 1 digits/dynamics and Lesson 5, physical pp.5–7,28–29; native digit refinement.

#### Borel normal number theorem

`ProbabilisticAndMetricNumberTheory:PM.2/borel-normal` (theorem). For each b≥2, IsNormalBase b x holds for volume-almost every x∈[0,1);

The proof plan is: Use native AddCircle.ergodic_nsmul for multiplication by b, with its positive-period volume hypothesis. Apply the pointwise ergodic theorem to each cylinder indicator and transport to native digits by the bridge. Take a countable union of null sets over lengths, words and bases. A mean/L1 theorem does not establish the needed pointwise frequencies.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.2/normal-base`, `ProbabilisticAndMetricNumberTheory:PM.2/digit-cylinder-bridge`, `ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-pointwise-ergodic`, `mathlib:AddCircle.ergodic_nsmul`.

Source: Smyth2020, Lesson 5 pointwise frequency theorem, physical pp.28–29, applied to base-b cylinders.

#### Simultaneous normality in every base

`ProbabilisticAndMetricNumberTheory:PM.2/borel-normal-all-bases` (theorem). For volume-almost every x∈[0,1), for every natural b≥2, the canonical native digits make x normal in base b simultaneously.

The proof plan is: Intersect the full-measure sets from the fixed-base theorem over natural b≥2. Introduce the native nonzero-base instance from b≥2; no uncountable intersection is used.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.2/borel-normal`.

Source: Smyth2020, Lesson 5 pointwise frequency theorem, physical pp.28–29; countable intersection refinement.

### PM.3 — Hausdorff transference and metric approximation

The existing Koukoulopoulos–Maynard GCD-graph proof and its corrected overlap statement remain intact. The new dimension-function predicate constrains a native nonnegative-real function; native mkMetric already supplies the Hausdorff measure. The gauge normalization lemma compares radius and diameter covers rather than asserting an equality of constants. The source mass transference theorem is for Euclidean space with shrinking radii and a monotone gauge/volume ratio.

The proof separates finite disjoint covering, the labelled Cantor levels with properties(P0)–(P5), compatible probability extension, selected-ball mass, elementary geometry and the arbitrary small-ball bound. The floor-plus-one sublevel counts retain their volume-comparison constants. The arbitrary-ball constant must be independent of η, or the final infinite Hausdorff-measure argument fails. The native tree/measure-extension interface remains a gap, not a hidden Prop-valued assumption. Power transference yields Jarník–Besicovitch and the dimension corollary, while higher-dimensional Pollington–Vaughan retains its stronger coordinatewise coprimality and unread original proof. General quasi-independence gives positive limsup mass; a separate zero-one or local argument is needed for full mass.

#### Dimension functions

`ProbabilisticAndMetricNumberTheory:PM.3/dimension-gauge` (definition). IsDimensionGauge f for f:ℝ≥0→ℝ≥0 means f(0)=0, f(r)>0 for r>0, f is monotone, and f is continuous. This extends the source’s positive-radius convention continuously at zero. Its Hausdorff measure is the existing Measure.mkMetric diameter-gauge construction, with the ENNReal extension retaining f on every finite radius; no new measure carrier is introduced.

The proof plan is: Bundle only the precise hypotheses on the existing scalar function, retaining positivity and the zero limit. The diameter/radius comparison is a separate lemma; its constants are not an equality of normalizations.

Direct prerequisites: `mathlib:MeasureTheory.Measure.mkMetric`.

The API laws are `IsDimensionGauge.zero`: A dimension gauge vanishes at zero.; `IsDimensionGauge.positive`: Every positive radius has positive gauge value.; `IsDimensionGauge.tendsto_zero`: The gauge tends to zero as the radius tends to zero..

Tests: gauge_linear: The identity gauge is a dimension function.; gauge_square: The square gauge is a dimension function.; gauge_constant_rejected: A positive constant gauge violates the zero-limit convention.; gauge_zero_rejected: The zero function violates positive-radius positivity..

Consumers: ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-general — Controls expanded ball radii and the Hausdorff gauge in the full source theorem..

Source: BeresnevichVelani, §2.1, printed p.974.

#### IsDimensionGauge.zero

`ProbabilisticAndMetricNumberTheory:PM.3/dimension-gauge-api-1` (lemma). A dimension gauge vanishes at zero.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/dimension-gauge`.

Source: BeresnevichVelani, §2.1, printed p.974.

#### IsDimensionGauge.positive

`ProbabilisticAndMetricNumberTheory:PM.3/dimension-gauge-api-2` (lemma). Every positive radius has positive gauge value.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/dimension-gauge`.

Source: BeresnevichVelani, §2.1, printed p.974.

#### IsDimensionGauge.tendsto_zero

`ProbabilisticAndMetricNumberTheory:PM.3/dimension-gauge-api-3` (lemma). The gauge tends to zero as the radius tends to zero.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/dimension-gauge`.

Source: BeresnevichVelani, §2.1, printed p.974.

#### Radius versus diameter Hausdorff conventions

`ProbabilisticAndMetricNumberTheory:PM.3/gauge-normalization` (lemma). For a dimension gauge f with f(r)/r^k monotone near zero, compare the source’s ball-radius H^f to native diameter mkMetric(f). When f(r)/r^k tends to infinity, f(2r)≤2^k f(r) near zero, so the two constructions have the same null sets and full/infinite-measure conclusions on open balls. If the ratio has finite limit, treat zero or a constant multiple of k-dimensional measure separately. No exact scalar normalization equality is asserted.

The proof plan is: Replace a radius cover by a diameter cover and conversely, tracking the factor two in scale. Apply native mkMetric_mono_smul to compare gauges once a bounded doubling ratio is established. Handle the zero/finite-ratio cases separately. The exact gauge-extension and comparison signatures are omitted until their ENNReal boundary convention is fixed.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/dimension-gauge`, `mathlib:MeasureTheory.Measure.mkMetric`, `mathlib:MeasureTheory.Measure.mkMetric_apply`.

Source: BeresnevichVelani, §2.1, Remark 3 and proof of Theorem 2, pp.974,977,979–980.

#### Disjoint finite covering for mass transference

`ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cover` (lemma). Under Theorem 2’s expanded-ball full-measure hypothesis, each positive-radius ball B and each index cutoff G admit a finite family of expanded balls of indices at least G, disjoint and inside B, whose union has at least κ times the k-dimensional measure of B. Here κ>0 depends only on dimension and the fixed ball-volume comparison constants, not on B or G.

The proof plan is: Restrict sufficiently small expanded balls to half B and use the native 5r covering lemma. Use volume doubling/comparison and continuity of the disjoint series to select a finite initial subfamily with at least half the obtained mass. The source-specific expanding-radius signature awaits the dimension-gauge bridge; record the omitted signature explicitly.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/dimension-gauge`.

Source: BeresnevichVelani, Lemma 5 and its proof, printed pp.978–979.

#### Separated nested Cantor levels

`ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor` (construction). For k≥1, η>1, a bounded positive-radius root B₀, and the full expanded-ball limsup hypothesis with f(r)/r^k→∞, construct finite labelled closed-ball levels K(n), finite local sublevels K(n,B,i) and increasing source index cutoffs, with K(1)={B₀}. (P1) All triples3L of children of B are disjoint, contained in B and contained in L^f. (P2) Expanded L^f are disjoint inside each sublevel and contained in B. (P3) Each sublevel has Σ_L V^k(L^f)≥c₃V^k(B). (P4) Every next-sublevel M satisfies f(r_M)≤f(r_L)/2 for every previous-sublevel L. (P5) l_B₀=floor(c₂η/(c₃H^k(B₀)))+1; for later B, l_B=floor(f(r_B)/(c₃r_B^k))+1≥2. Here V^k(B)=r_B^k and c₁,c₂ are the source Hausdorff/volume comparison constants, c₃=κc₁²/(2c₂²10^k). The compact intersection Kη lies in B₀∩limsup B_i.

The proof plan is: Use Lemma 5 for the first sublevel and estimate volume of previously selected quadruple balls by a small gauge/volume ratio. Apply the 5r lemma to the remaining half-parent region, then Lemma 5 after a larger cutoff to enforce half-mass, triple separation and increasing source indices. Induct over the finite sublevels and levels. The source-specific finite-tree carrier and native projective-measure interface are not fixed; omit their signatures explicitly.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cover`, `ProbabilisticAndMetricNumberTheory:PM.3/dimension-gauge`.

The API laws are `MassTransferenceCantor.nested`: Every level lies inside its parent level.; `MassTransferenceCantor.limsup`: Every point of Kη belongs to infinitely many original balls with unbounded indices.; `MassTransferenceCantor.separated`: Distinct child triples are disjoint; the stronger expanded-ball disjointness holds within each sublevel..

Tests: cantor_parent: No child crosses the boundary of its parent.; cantor_indices: A construction repeating a fixed finite collection of balls is rejected by the increasing-cutoff requirement.; cantor_multi_sublevel: For nonroot parents the source choice gives at least two sublevels, preventing an incorrect single-child measure model..

Consumers: ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-measure — Supports the compatible normalized f-mass weights used to construct a probability measure..

Source: BeresnevichVelani, §§5.1–5.2, printed pp.980–986.

#### MassTransferenceCantor.nested

`ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor-api-1` (lemma). Every level lies inside its parent level.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor`.

Source: BeresnevichVelani, §§5.1–5.2, printed pp.980–986.

#### MassTransferenceCantor.limsup

`ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor-api-2` (lemma). Every point of Kη belongs to infinitely many original balls with unbounded indices.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor`.

Source: BeresnevichVelani, §§5.1–5.2, printed pp.980–986.

#### MassTransferenceCantor.separated

`ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor-api-3` (lemma). Distinct child triples are disjoint; the stronger expanded-ball disjointness holds within each sublevel.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor`.

Source: BeresnevichVelani, §§5.1–5.2, printed pp.980–986.

#### Compatible Cantor probability measure

`ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-measure` (construction). On the source Cantor levels attach weight 1 to B₀ and weight μ(L)=f(r_L) μ(B)/Σ_{M child of B}f(r_M) to each child L of B. Extend these compatible finite masses to a Borel probability supported on Kη.

The proof plan is: Normalize each finite child mass; positive denominator follows from (P3) and (P5). The external extension [3, Proposition 1.7] remains an explicit input. The disjoint compatible finite distributions define the native Borel probability on the nested compact intersection once the external extension theorem is matched. The measure-extension signature is omitted pending the native finite-tree interface.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor`, `mathlib:MeasureTheory.Measure.le_hausdorffMeasure`.

The API laws are `MassTransferenceMeasure.root`: The root mass is one.; `MassTransferenceMeasure.children`: The sum of finite child masses equals the parent mass.; `MassTransferenceMeasure.ball_bound`: For A of radius below the construction cutoff, μ(A)≤C_k f(r_A)/η with C_k independent of η and A..

Tests: mass_positive: Every selected positive-radius ball has positive normalized mass.; mass_sum: For two children of equal gauge size the masses are each half the parent mass.; mass_eta_uniform: The constant C_k cannot grow with η; otherwise infinite Hausdorff measure does not follow..

Consumers: ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-general — Native mass-distribution domination supplies arbitrarily large Hausdorff lower bounds as η grows..

Source: BeresnevichVelani, §§5.3–5.5, printed pp.986–990.

#### MassTransferenceMeasure.root

`ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-measure-api-1` (lemma). The root mass is one.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-measure`.

Source: BeresnevichVelani, §§5.3–5.5, printed pp.986–990.

#### MassTransferenceMeasure.children

`ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-measure-api-2` (lemma). The sum of finite child masses equals the parent mass.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-measure`.

Source: BeresnevichVelani, §§5.3–5.5, printed pp.986–990.

#### MassTransferenceMeasure.ball_bound

`ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-measure-api-3` (lemma). For A of radius below the construction cutoff, μ(A)≤C_k f(r_A)/η with C_k independent of η and A.

The proof plan is: Apply the separate arbitrary-ball bound, retaining its dimension-only constant and construction-dependent cutoff. The finite-tree/native-measure interface remains an explicit gap.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-measure`, `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-ball-bound`.

Source: BeresnevichVelani, §§5.3–5.5, printed pp.986–990.

#### Bounds on selected level-ball masses

`ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-level-mass` (lemma). For every selected level ball L below the root, μ(L)≤f(r_L)/η. Use exactly the root and nonroot floor-plus-one sublevel counts from the Cantor construction; the comparison H^k(B)≤c₂r_B^k is retained.

The proof plan is: At the root each sublevel has f-mass at least c₃r_B₀^k≥(c₃/c₂)H^k(B₀), so the prescribed root count makes the denominator at least η. At a later parent the denominator is at least c₃l_Br_B^k≥f(r_B); substitute the inductive parent bound into the exact child-mass recursion. The finite-tree signature is omitted until its native interface is fixed.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-measure`, `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor`.

Source: BeresnevichVelani, §5.4, printed p.987.

#### Ball intersection geometry

`ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-ball-geometry` (lemma). For closed Euclidean balls A,M and c≥3, if A meets M and A has a point outside the concentric c-fold dilate of M, then r_M≤r_A and cM is contained in the concentric 5-fold dilate of A. In the proof the final triangle inequality is non-strict; the point outside cM makes the first inequality strict.

The proof plan is: Combine center distances from a point in A∩M with the distance of the point of A outside cM to get (c−1)r_M<2r_A. For y∈cM, d(y,center A)≤r_A+(c+1)r_M≤5r_A by the sharper preceding inequality when c≥3.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor`.

Source: BeresnevichVelani, Lemma 7, printed p.988, with corrected proof inequality.

#### Arbitrary small-ball mass bound

`ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-ball-bound` (lemma). There are constants C_k>0 and r₀>0, where C_k depends only on the dimension and covering constants and r₀ may depend on the construction, such that every ball A with 0<r_A<r₀ satisfies μ(A)≤C_k f(r_A)/η for the Cantor probability. C_k is independent of η.

The proof plan is: Use the deepest parent for which A meets at least two children; all its relevant children have radius at most r_A by triple separation and Lemma 7. For sublevels with a single hit, use their f-mass halving property to sum a geometric series bounded by 2f(r_A). For sublevels with multiple hits, use expanded disjointness inside 5A and monotonic f(r)/r^k to bound the sum by a dimension constant times l_B f(r_A); the denominator lower bound c₃l_BH^k(B) and the parent mass bound finish the estimate. The native finite-tree/small-radius interface is not yet fixed, so its signature is omitted.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-level-mass`, `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-ball-geometry`, `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor`, `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-measure`.

Source: BeresnevichVelani, §5.5, printed pp.988–990.

#### Mass transference principle

`ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-general` (theorem). BV Theorem 2: for k≥1, balls B_i⊂ℝ^k of radii tending to zero, a dimension function f with f(r)/r^k monotone, and expanded balls B_i^f of radius f(r_i)^(1/k), assume limsup B_i^f has full Lebesgue measure in every ball. Then H^f(B∩limsup B_i)=H^f(B) for every ball B. Use native mkMetric through the explicit normalization comparison; no claim about a general metric space without §6.1’s local compactness/doubling hypotheses.

The proof plan is: If f(r)/r^k has finite zero/positive limit, use the comparison of Hausdorff measures and the covering/full-measure argument. For the infinite ratio, apply the Cantor construction and arbitrary-ball bound, then native mass distribution to get H^f≥cη for all η. The general gauge/tree interface and external measure-extension input are explicit gaps; omit the unavailable general signature.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/dimension-gauge`, `ProbabilisticAndMetricNumberTheory:PM.3/gauge-normalization`, `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cover`, `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-ball-bound`, `mathlib:MeasureTheory.Measure.le_hausdorffMeasure`.

Source: BeresnevichVelani, Theorem 2 and §5, printed pp.977–990.

#### Power-gauge mass transference on the line

`ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-power` (theorem). For 0<s<1, centers c_i∈ℝ, positive radii r_i→0, and E=limsup closedBall(c_i,r_i), assume every nonempty open ball meets limsup closedBall(c_i,r_i^s) in full Lebesgue measure. Then every positive-radius ball meets E in infinite native s-dimensional Hausdorff measure.

The proof plan is: Apply the general mass transference principle with the power dimension function; its ratio r^(s−1) tends to infinity. Use the radius/diameter normalization bridge; it changes finite factors and preserves infinity.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-general`, `mathlib:MeasureTheory.Measure.hausdorffMeasure`.

Source: BeresnevichVelani, Theorem 2 specialized to k=1, f(r)=r^s.

#### Jarník–Besicovitch dimension theorem

`ProbabilisticAndMetricNumberTheory:PM.3/jarnik-besicovitch` (theorem). For v>2, let W_v consist of x∈[0,1] with |x−a/q|<q^(−v) for infinitely many coprime integers a and positive q. Then native dimH(W_v)=2/v and its critical (2/v)-Hausdorff measure is infinite. The source writes ψ(q)=q^(−τ), τ=v−1, so the exponent is 2/(1+τ), not 2/(2+τ).

The proof plan is: Use Dirichlet’s theorem for the expanded radius q^(−2), and the critical power mass-transference statement for the lower bound and infinity. For s>2/v the rational-ball cover has summable q·q^(−vs) cost, giving zero Hausdorff measure and the upper dimension bound. Strict versus closed approximation radii require a constant-radius comparison; the native rational-approximation/dimH signature bridge remains explicit.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-power`, `ProbabilisticAndMetricNumberTheory:PM.3/duffin-schaeffer-sets`, `mathlib:MeasureTheory.Measure.hausdorffMeasure`.

Source: BeresnevichVelani, §3.2, printed pp.977–978.

#### Hausdorff Duffin–Schaeffer theorem

`ProbabilisticAndMetricNumberTheory:PM.3/hausdorff-duffin-schaeffer` (theorem). For the one-dimensional reduced approximation limsup and dimension function f with f(r)/r monotone, convergence of Σ_q φ(q) f(ψ(q)/q) gives zero H^f-measure; divergence gives H^f equal to that of [0,1]. No monotonicity of ψ is imposed. The divergence follows by native Lebesgue Duffin–Schaeffer for θ(q)=q f(ψ(q)/q), followed by mass transference.

The proof plan is: Treat nonshrinking radii separately, enumerate reduced rational balls without retaining zero-radius empty approximants, and use the series transformation for θ. Apply the preserved Lebesgue theorem and MTP locally. A direct covering/tsum argument supplies the convergence half. The general gauge comparison, strict-radius and enumeration bridges are explicit gaps; omit the general gauge signature until they are fixed.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-general`, `ProbabilisticAndMetricNumberTheory:PM.3/duffin-schaeffer-theorem`, `ProbabilisticAndMetricNumberTheory:PM.3/duffin-schaeffer-convergence`.

Source: BeresnevichVelani, Theorem 1 and §3.1, printed pp.973,977.

#### Second moment for limsup events

`ProbabilisticAndMetricNumberTheory:PM.3/quasi-independent-borel-cantelli` (theorem). For measurable events E_n in a probability space, suppose Σμ(E_n)=∞ and there is C≥1 such that for every M there are arbitrarily large N≥M with Σ_{M≤i,j≤N}μ(E_i∩E_j)≤C(Σ_{M≤i≤N}μ(E_i))². Then μ(limsup E_n)≥1/C. Full measure needs an additional zero-one or local-full-measure input; it does not follow from this positive bound alone.

The proof plan is: Apply the preserved finite second-moment union bound to each tail interval with nonzero total mass. Take continuity from below for unions and from above for the decreasing tail unions under a probability measure.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/second-moment-union-bound`.

Source: BeresnevichVelani, §2.2 and Lemmas 4–6, printed pp.976,979; refinement of the preserved second-moment argument.

#### Higher-dimensional Duffin–Schaeffer theorem

`ProbabilisticAndMetricNumberTheory:PM.3/higher-dimensional-duffin-schaeffer` (theorem). For k≥2 and ψ:ℕ→[0,∞), let S_k(ψ) consist of x∈[0,1]^k such that for infinitely many q≥1 there are a_i∈ℤ with gcd(a_i,q)=1 separately for every coordinate and max_i|x_i−a_i/q|<ψ(q)/q. Its Lebesgue measure is zero if Σ_q(φ(q)ψ(q)/q)^k converges and one if the sum diverges. The coordinatewise coprimality is stronger than gcd(a₁,…,a_k,q)=1.

The proof plan is: The convergence direction is a covering/Borel–Cantelli estimate with the explicit coordinatewise totient count. Read the original Pollington–Vaughan higher-dimensional divergence proof, with its pair-overlap estimates and zero-one/local-full-measure step; it is a separate input, not a consequence of the one-dimensional theorem. The finite-coordinate reduced-approximation/native-volume bridge and the original proof are not yet obtained; omit the full signature until that interface is specified.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/quasi-independent-borel-cantelli`.

Source: BeresnevichVelani, Introduction, printed pp.971–972: simultaneous definition and Pollington–Vaughan theorem.

#### Hausdorff dimension of reduced approximation

`ProbabilisticAndMetricNumberTheory:PM.3/duffin-schaeffer-dimension` (theorem). KM Corollary3: for 0≤ψ(q)≤1/2, let A be the preserved closed reduced-rational limsup. Put s=inf{b≥0:Σ_{q≥1}φ(q)(ψ(q)/q)^b converges}, with inf(empty)=∞. Then native dimH(A)=min(s,1). The bound ψ≤1/2 belongs to this exact source statement.

The proof plan is: For any b>s the direct rational cover has summable b-gauge cost and hence zero Hausdorff measure. For 0<b<min(s,1) the Hausdorff Duffin–Schaeffer divergence theorem gives infinite b-measure. Supremum/infimum comparisons in native dimH yield equality, with the ambient line bound. The signature expands the existing dsLimsup formula only to permit a Mathlib-only elaboration check; no second approximation-set definition is introduced.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.3/hausdorff-duffin-schaeffer`, `ProbabilisticAndMetricNumberTheory:PM.3/duffin-schaeffer-sets`, `mathlib:dimH`.

Source: KM-2020, Published Corollary3, printed p.255, freshly read.

### PM.4 — pointwise Gauss metric laws

The native mean/L1 ergodic statements do not give almost-everywhere averages. The generic pointwise extension uses Sarig’s coloring/limsup argument, invariant-set integrals and conditional-expectation identification. Measurable representative and martingale interfaces remain named gaps. Native Ergodic is reused. Mixing and exactness are specified as predicates on the native probability-space data, and their tests distinguish a trivial point, a two-atom identity and an ergodic periodic swap.

The Gauss map is the total native fractional part of inverse. Its invariant density is1/((1+x)log2) on(0,1], bounded above by1/log2. Inverse branches use absolute Jacobians. Uniform finite-word distortion feeds Rényi’s cylinder comparison and exactness; exactness gives mixing, and mixing gives ergodicity through a separate declaration. Digit and finite-word frequencies are cylinder measures; no digit independence is asserted.

Khinchin’s constant is the exponential of the log-digit integral with factor1+1/(a(a+2)). The native convergent denominators are indexed by q₀=1. Their orbit-log comparison has bounded error log2 for irrational inputs; Birkhoff and the positive integral π²/(12log2) then yield Lévy’s growth law. Gauss–Kuzmin concerns the marginal distribution from Lebesgue initial data and needs a transfer-operator spectral estimate. Qualitative mixing does not supply its exponential rate. GN.4 retains homogeneous spaces and group flows; no lattice or quotient is defined here.

#### Pointwise Birkhoff theorem

`ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-pointwise` (theorem). For a measure-preserving map T of a probability space and integrable f:Ω→ℝ, native birkhoffAverage ℝ T f N converges almost everywhere to the native conditional expectation of f on MeasurableSpace.invariants T. This is pointwise convergence of a representative, not just mean/L1 convergence.

The proof plan is: For nonnegative f, the coloring/truncated-limsup estimate and the complementary liminf estimate force equality of limsup and liminf almost everywhere. The limit is invariant and integrable; its integrals over every invariant measurable set equal those of f, identifying native conditional expectation. Split signed f into positive/negative parts. The coloring and identification nodes below are direct prerequisites; no existing mean-ergodic result is claimed as the pointwise proof.

Direct prerequisites: `mathlib:birkhoffAverage`, `mathlib:MeasurableSpace.invariants`, `ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-coloring`, `ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-identification`.

Source: Sarig2023, Theorems 2.2–2.3 and their complete proof, physical pp.45–49.

#### Coloring estimate for Birkhoff limsup

`ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-coloring` (lemma). For a nonnegative integrable real observable on a probability-preserving system, the integrable truncation g_M=min(limsup_N A_N f,M) has integral at most ∫f. Apply the statement with its source measurable invariant limsup representative; positive limsup may be infinite before this bound.

The proof plan is: For ε>0 choose finite orbit blocks with average above g_M−ε on a set whose measure tends to one as the permitted block length grows. Color disjoint blocks along a long orbit; boundary and bad-set contributions are bounded by M times their frequency. Integrate using preservation. First let the long orbit length tend to infinity, then remove the bad set and ε. A precise measurable extended-limsup representative and the finite coloring lemma signatures remain to be split.

Direct prerequisites: `mathlib:birkhoffAverage`.

Source: Sarig2023, Theorem 2.2 proof, physical pp.45–47.

#### Invariant limit and conditional expectation

`ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-identification` (lemma). If the almost-everywhere Birkhoff limit g of an integrable f is integrable and invariant, the coloring/liminf argument gives ∫_A g=∫_A f for every native invariant measurable set A; hence g equals native condExp(invariants T,μ,f) almost everywhere.

The proof plan is: Restrict the probability-preserving system to an invariant set, normalizing when its mass is positive; zero-mass sets are immediate. Use the signed coloring argument to identify the restricted integrals and the native uniqueness criterion for conditional expectation. The exact native conditional-expectation uniqueness/restriction lemmas are still to be matched; omit a bundled limit signature rather than a Prop-valued stand-in.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-coloring`, `mathlib:MeasurableSpace.invariants`.

Source: Sarig2023, Theorem 2.3, physical pp.48–49.

#### Ergodic pointwise averages

`ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-pointwise-ergodic` (theorem). For native Ergodic T μ on a probability space and integrable real f, A_N f(x)→∫f dμ for μ-almost every x.

The proof plan is: Identify the pointwise limit as conditional expectation on the invariant sigma-algebra. Ergodicity makes this invariant function almost surely constant; its integral is the integral of f.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-pointwise`, `mathlib:Ergodic`.

Source: Sarig2023, Theorem 2.2, ergodic conclusion, physical pp.45–47.

#### Gauss map

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-map` (definition). Define T:ℝ→ℝ by T(x)=Int.fract(x⁻¹), using native total inversion so T(0)=0. Its measure-theoretic domain is [0,1]; all metric digit theorems exclude rationals, and T preserves irrational points in (0,1).

The proof plan is: Use the native floor/fractional-part operation rather than a second continued-fraction algorithm. Match the inverse branches x↦1/(a+x) for integers a≥1 on the irrational domain; rational boundary values are handled separately.

Direct prerequisites: `mathlib:GenContFract.of`.

The API laws are `gaussMap_zero`: T(0)=0.; `gaussMap_range`: Every real input maps into [0,1).; `gaussMap_measurable`: The total Gauss map is Borel measurable..

Tests: gauss_half: T(1/2)=0, showing rational termination.; gauss_two_thirds: T(2/3)=1/2.; gauss_zero: The endpoint convention is T(0)=0..

Consumers: ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure — Preserves the specific absolutely continuous Gauss probability.; ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit — Its iterates define the digit observations for metric laws..

Source: SarigTransfer, §2.3 and Appendix A.2, physical pp.11,32.

#### gaussMap_zero

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-map-api-1` (lemma). T(0)=0.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-map`.

Source: SarigTransfer, §2.3 and Appendix A.2, physical pp.11,32.

#### gaussMap_range

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-map-api-2` (lemma). Every real input maps into [0,1).

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-map`.

Source: SarigTransfer, §2.3 and Appendix A.2, physical pp.11,32.

#### gaussMap_measurable

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-map-api-3` (lemma). The total Gauss map is Borel measurable.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-map`.

Source: SarigTransfer, §2.3 and Appendix A.2, physical pp.11,32.

#### Gauss probability measure

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure` (construction). Use native μ_G=(volume restricted to (0,1]).withDensity(ofReal(1/((1+x)log 2))). It is a Borel probability measure equivalent to the restricted Lebesgue measure; on its support the density lies between 1/(2 log 2) and 1/log 2. Outside the support density values do not affect μ_G.

The proof plan is: Integrate the density explicitly by log(1+x); the mass of (0,1] is one. Use positive finite density on the support to prove mutual absolute continuity. The erroneous printed upper bound 2 log 2 is not used.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-map`, `mathlib:MeasureTheory.ProbabilityMeasure`.

The API laws are `gaussMeasure_univ`: The measure has total mass one.; `gaussMeasure_interval`: For 0≤a≤b≤1, μ_G((a,b])=(log(1+b)−log(1+a))/log 2.; `gaussMeasure_equivalent`: Gauss and restricted Lebesgue measure have the same null sets..

Tests: gauss_mass: μ_G((0,1])=1.; gauss_first_digit: μ_G((1/2,1])=log(4/3)/log 2, the frequency of digit 1.; gauss_no_atoms: The totalized endpoint has no mass..

Consumers: ProbabilisticAndMetricNumberTheory:PM.4/gauss-invariant — The invariant probability for Gauss ergodic averages.; ProbabilisticAndMetricNumberTheory:PM.4/gauss-density-log-integral — Sets the logarithmic observable integrals and exact constants..

Source: SarigTransfer, Appendix A.2, physical pp.32–33, density with corrected upper bound.

#### gaussMeasure_univ

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure-api-1` (lemma). The measure has total mass one.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure`.

Source: SarigTransfer, Appendix A.2, physical pp.32–33, density with corrected upper bound.

#### gaussMeasure_interval

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure-api-2` (lemma). For 0≤a≤b≤1, μ_G((a,b])=(log(1+b)−log(1+a))/log 2.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure`.

Source: SarigTransfer, Appendix A.2, physical pp.32–33, density with corrected upper bound.

#### gaussMeasure_equivalent

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure-api-3` (lemma). Gauss and restricted Lebesgue measure have the same null sets.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure`.

Source: SarigTransfer, Appendix A.2, physical pp.32–33, density with corrected upper bound.

#### Gauss digit observations

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit` (definition). For real x define a_{n+1}(x)=gaussDigit(x,n)=Nat.floor((T^[n]x)⁻¹), n indexed from zero. On irrational x∈(0,1), all digits are positive and this agrees with the n-indexed native GenContFract.of x partial denominator stream. At rational termination the observable is zero, without inventing an infinite native continued fraction.

The proof plan is: Use the single floor observable on native iterates. At n=0 it is the first fractional continued-fraction digit. For irrational inputs the native computation stream is nonterminating and its next inverse-fractional-part step matches T.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-map`, `mathlib:GenContFract.of`.

The API laws are `gaussDigit_zero`: The first digit is floor(x⁻¹).; `gaussDigit_shift`: Digit n at T(x) equals digit n+1 at x.; `gaussDigit_native`: On irrational x in (0,1), native partial denominator n is some real cast of gaussDigit(x,n)..

Tests: digit_half_first: The first digit of 1/2 is 2.; digit_half_terminated: The next digit of 1/2 is zero under totalization.; digit_two_thirds: The digits of 2/3 start 1,2,0..

Consumers: ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit-frequency — Pins the off-by-one convention in empirical frequencies.; ProbabilisticAndMetricNumberTheory:PM.4/khinchin-geometric-mean — Uses log of the positive digit observable, not its nonintegrable arithmetic mean..

Source: SarigTransfer, §2.3, physical p.11, corrected iterate/digit index; native partial denominator bridge.

#### gaussDigit_zero

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit-api-1` (lemma). The first digit is floor(x⁻¹).

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit`.

Source: SarigTransfer, §2.3, physical p.11, corrected iterate/digit index; native partial denominator bridge.

#### gaussDigit_shift

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit-api-2` (lemma). Digit n at T(x) equals digit n+1 at x.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit`.

Source: SarigTransfer, §2.3, physical p.11, corrected iterate/digit index; native partial denominator bridge.

#### gaussDigit_native

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit-api-3` (lemma). On irrational x in (0,1), native partial denominator n is some real cast of gaussDigit(x,n).

The proof plan is: Induct on n through native GenContFract.of and IntFractPair.stream, using irrational nontermination and positivity of each inverse fractional part. Match the first fractional denominator to digit zero and the next stream step to the iterate of the total Gauss map. The native bridge remains an explicit gap.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit`, `mathlib:GenContFract.of`, `mathlib:Irrational`.

Source: SarigTransfer, §2.3, physical p.11, corrected iterate/digit index; native partial denominator bridge.

#### Strong mixing of probability-preserving maps

`ProbabilisticAndMetricNumberTheory:PM.4/strong-mixing` (definition). IsStrongMixing T μ for native μ:ProbabilityMeasure Ω means MeasurePreserving T μ μ and, for all measurable A,B, μ.real(A∩(T^[n])⁻¹B)→μ.real(A)μ.real(B). This is a general probability-system predicate; Gauss is an application.

The proof plan is: Define the precise mixing limit using native iterates, preimages and real measure. General consumers include Gauss mixing here and homogeneous dynamics at GN.4. Ergodicity is imported as the native notion, not redefined.

Direct prerequisites: `mathlib:MeasureTheory.ProbabilityMeasure`, `mathlib:Ergodic`.

The API laws are `IsStrongMixing.measurePreserving`: Mixing includes measure preservation.; `IsStrongMixing.ergodic`: A strongly mixing probability system is native Ergodic.; `IsStrongMixing.correlation`: Exports the defining measurable-set correlation limit..

Tests: mix_dirac: Identity on a one-point dirac probability is mixing.; mix_identity_rejected: Identity on a fair two-atom measure is not mixing: take A=B={0}.; mix_periodic_rejected: The swap x↦1−x on that fair two-atom space is ergodic but not mixing..

Consumers: ProbabilisticAndMetricNumberTheory:PM.4/gauss-mixing — States the Gauss-system correlation limit.; GeometryOfNumbersAndQuadraticArithmetic:GN.4 — Offers one generic map-level predicate; group flows and quotient measures remain that supplier’s objects..

Source: SarigTransfer, Appendix A.2, physical p.32.

#### IsStrongMixing.measurePreserving

`ProbabilisticAndMetricNumberTheory:PM.4/strong-mixing-api-1` (lemma). Mixing includes measure preservation.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/strong-mixing`.

Source: SarigTransfer, Appendix A.2, physical p.32.

#### IsStrongMixing.ergodic

`ProbabilisticAndMetricNumberTheory:PM.4/strong-mixing-api-2` (lemma). A strongly mixing probability system is native Ergodic.

The proof plan is: For a measurable strictly invariant A, the iterated preimage is A; apply mixing with B=A to obtain μ(A)=μ(A)². Since 0≤μ(A)≤1, the mass is zero or one; with the measure-preserving projection this is native Ergodic.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/strong-mixing`, `mathlib:Ergodic`.

Source: SarigTransfer, Appendix A.2, physical p.32.

#### IsStrongMixing.correlation

`ProbabilisticAndMetricNumberTheory:PM.4/strong-mixing-api-3` (lemma). Exports the defining measurable-set correlation limit.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/strong-mixing`.

Source: SarigTransfer, Appendix A.2, physical p.32.

#### Exact probability systems

`ProbabilisticAndMetricNumberTheory:PM.4/exact-system` (definition). IsExact T μ means T preserves the native probability μ and every set measurable for the tail sigma-algebra inf_n comap(T^[n],mΩ) is μ-null or μ-conull. This is exactness for a noninvertible system, stronger than ergodicity.

The proof plan is: Use native MeasurableSpace.comap and its indexed infimum, not a private sigma-algebra carrier. Keep the explicit tail zero-one condition; invariance of a single set is not exactness.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/strong-mixing`.

The API laws are `IsExact.measurePreserving`: Exactness includes measure preservation.; `IsExact.tail_zero_one`: Exports the native tail-sigma zero-one law.; `IsExact.strongMixing`: An exact probability system is strongly mixing, by reverse martingale convergence..

Tests: exact_dirac: Identity on a dirac probability is exact.; exact_identity_rejected: Identity on a fair two-atom measure is not exact.; exact_swap_rejected: An invertible two-point swap is not exact even though it is ergodic..

Consumers: ProbabilisticAndMetricNumberTheory:PM.4/gauss-exact — Provides the tail condition of Rényi’s proof.; ProbabilisticAndMetricNumberTheory:PM.4/gauss-mixing — Turns Gauss exactness into the measurable-set correlation limit..

Source: SarigTransfer, Appendix A.2, physical p.32.

#### IsExact.measurePreserving

`ProbabilisticAndMetricNumberTheory:PM.4/exact-system-api-1` (lemma). Exactness includes measure preservation.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/exact-system`.

Source: SarigTransfer, Appendix A.2, physical p.32.

#### IsExact.tail_zero_one

`ProbabilisticAndMetricNumberTheory:PM.4/exact-system-api-2` (lemma). Exports the native tail-sigma zero-one law.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/exact-system`.

Source: SarigTransfer, Appendix A.2, physical p.32.

#### IsExact.strongMixing

`ProbabilisticAndMetricNumberTheory:PM.4/exact-system-api-3` (lemma). An exact probability system is strongly mixing, by reverse martingale convergence.

The proof plan is: For each bounded observable, apply reverse-martingale conditional-expectation convergence to the decreasing sigma-algebras comap(T^[n]). Tail triviality identifies the limit as the constant expectation. Measure preservation converts these conditional expectations into the measurable-set mixing correlation. The native reverse-martingale theorem, its exact filtration/completion hypotheses and the conditional-expectation/pushforward identity are recorded as a gap; this API is not an unfolding lemma.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/exact-system`, `ProbabilisticAndMetricNumberTheory:PM.4/strong-mixing`.

Source: SarigTransfer, Appendix A.2, physical p.32.

#### Gauss inverse branches and Jacobians

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-branch-jacobian` (lemma). For integer a≥1, v_a(x)=1/(a+x) maps (0,1) to its ath Gauss cylinder and T(v_a(x))=x. The derivative needed for measure transport is a separate lemma.

The proof plan is: Use a< a+x<a+1 on (0,1), so floor(a+x)=a, and evaluate the total inverse/fractional-part formula.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-map`.

Source: SarigTransfer, §2.3 and Appendix A.2, physical pp.12,32.

#### Invariant density telescope

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-density-telescope` (lemma). For x∈[0,1], Σ_{a≥1}1/((a+x)(a+x+1))=1/(1+x). Therefore the Lebesgue transfer operator sends h(x)=1/((1+x)log 2) to h(x).

The proof plan is: Write each summand as 1/(a+x)−1/(a+x+1) and telescope finite partial sums. Let the final reciprocal tend to zero; then substitute the density into the inverse-branch Jacobian formula.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-branch-jacobian`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure`.

Source: SarigTransfer, §2.3 transfer formula, physical p.12; worker’s exact telescoping verification.

#### Gauss measure invariance

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-invariant` (theorem). The native total Gauss map is MeasurePreserving for μ_G. The statement is equality of pushforward and μ_G on the Borel real line, with support and endpoints explicitly handled.

The proof plan is: Partition the irrational support into countably many branches and use nonnegative/absolutely integrable change of variables. Use the density telescope, then native measure extensionality; all omitted rational boundaries have zero measure.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-map`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-branch-jacobian`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-density-telescope`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-branch-derivative`.

Source: SarigTransfer, Transfer duality Proposition 1.1 and §2.3, physical pp.6,12.

#### Uniform distortion of continued-fraction cylinders

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-single-branch-distortion` (lemma). For a≥1 and x,y∈[0,1], the logarithms of the absolute derivatives of v_a(x)=1/(a+x) differ by at most 2|x−y|. This does not assert Lip(v_a′)≤1.

The proof plan is: Use the native continuant recurrences to obtain the Möbius denominator and determinant ±1. Since 0≤q_(n−1)/q_n≤1, compare denominator factors between q_n and 2q_n; differentiate log|v′| to get the bound 2.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit`, `mathlib:GenContFract.of`, `mathlib:GenContFract.dens`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-branch-jacobian`.

Source: SarigTransfer, Exercise 2.5(c),(d), physical pp.12–13, corrected derivative hint; native matrix recurrence bridge.

#### Uniform finite-word cylinder distortion

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-cylinder-distortion` (lemma). For every positive-digit finite word w=(a₁,…,a_n), n≥1, put v_w=v_a₁∘…∘v_a_n. Its absolute derivative is (q_n+x q_(n−1))⁻², with the word continuants q₀=1,q₋₁=0. For all x,y∈[0,1], 1/4≤|v_w′(x)|/|v_w′(y)|≤4, and |log|v_w′(x)|−log|v_w′(y)||≤2|x−y|.

The proof plan is: Induct on the finite word using the existing continuant/matrix recurrence and determinant ±1. Use q_(n−1)≤q_n to compare denominators between q_n and 2q_n, then differentiate their logarithm. The finite-word/native stream and differentiable branch interface has not been fixed; the general-word signature is explicitly omitted.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-single-branch-distortion`, `mathlib:GenContFract.of`, `mathlib:GenContFract.dens`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-branch-derivative`.

Source: SarigTransfer, Exercise 2.5(c),(d), physical pp.12–13.

#### Rényi cylinder comparison

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-renyi` (lemma). There is C≥1 independent of n and the digit word a such that for every Gauss cylinder [a] of depth n and every measurable B⊂[0,1], C⁻¹m([a])m(B)≤m([a]∩(T^[n])⁻¹B)≤C m([a])m(B), where m is restricted Lebesgue measure.

The proof plan is: Integrate the absolute derivative of the cylinder inverse branch over B. Compare it to its integral over [0,1] using the uniform distortion bound. Extend from intervals to Borel sets by native measure extensionality. The general finite-word cylinder/continuant bridge must be made explicit; its signature is omitted until that native comparison is fixed.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-cylinder-distortion`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-branch-jacobian`.

Source: SarigTransfer, Appendix A.2, physical p.32.

#### Rényi exactness theorem for the Gauss map

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-exact` (theorem). The Gauss map with μ_G is exact in the native tail-sigma sense. Any tail measurable B with positive mass has full mass.

The proof plan is: Write a tail set as T^(-n)B_n and apply Rényi’s lower bound in every depth-n cylinder. Use the correct density bounds to obtain a uniform positive lower bound m(B∩[a])/m([a])≥m(B)/(2C). The cylinders generate the Borel sigma-algebra; increasing conditional expectations converge to 1_B, forcing its positivity almost everywhere. Match this native martingale/generation input rather than inventing it.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/exact-system`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-invariant`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-renyi`.

Source: SarigTransfer, Appendix A.2, physical pp.32–33, corrected density estimate.

#### Gauss mixing theorem

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-mixing` (theorem). For μ_G, all Borel A,B satisfy μ_G(A∩T^(-n)B)→μ_G(A)μ_G(B).

The proof plan is: Apply the general exact-to-mixing theorem through native reverse conditional expectations. Export the precise measurable-set mixing predicate, with the Gauss probability instance.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-exact`, `ProbabilisticAndMetricNumberTheory:PM.4/exact-system-api-3`.

Source: SarigTransfer, Appendix A.2: exactness implies mixing, physical p.32.

#### Gauss ergodicity theorem

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-ergodic` (theorem). The total Gauss map is native Ergodic for the Gauss probability measure.

The proof plan is: Apply the generic mixing-to-ergodicity API with the existing Gauss probability instance.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-mixing`, `ProbabilisticAndMetricNumberTheory:PM.4/strong-mixing-api-2`.

Source: SarigTransfer, Appendix A.2, physical pp.32–33.

#### Gauss digit frequency law

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit-frequency` (theorem). For Lebesgue-almost every irrational x∈(0,1), simultaneously for every a≥1, #{0≤j<N:gaussDigit(x,j)=a}/N tends to log((a+1)^2/(a(a+2)))/log 2.

The proof plan is: Identify a single-digit cylinder with (1/(a+1),1/a), up to zero-mass endpoints, and apply ergodic pointwise averages to its indicator. Evaluate its Gauss measure by the interval formula and take a countable common null set over digits. Transport almost-everywhere statements through the positive density to restricted Lebesgue measure.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-ergodic`, `ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-pointwise-ergodic`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure-api-2`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure-api-3`.

Source: Smyth2020, Lesson 9 §1.2, physical pp.45–46.

#### Finite continued-fraction block frequencies

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-word-frequency` (theorem). For each positive-digit word w:Fin k→ℕ with k≥1, let C_w={y∈(0,1):∀i<k,gaussDigit(y,i)=w_i}. For Lebesgue-almost every x∈(0,1), simultaneously for every such w, the frequency of starts j<N with ∀i<k,gaussDigit(x,j+i)=w_i tends to μ_G(C_w). The digits are not asserted independent.

The proof plan is: Apply pointwise ergodicity to the measurable finite intersection defining C_w and use the digit-shift API. Take the countable common null set over finite words and transport via Gauss/Lebesgue equivalence.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-ergodic`, `ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-pointwise-ergodic`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure-api-3`.

Source: Smyth2020, Lesson 5 cylinder indicators and Lesson 9, physical pp.28–29,45–46.

#### Khinchin’s constant

`ProbabilisticAndMetricNumberTheory:PM.4/khinchin-constant` (definition). Define K=exp(Σ_{a≥1}log(a)·log(1+1/(a(a+2)))/log 2). The positive series converges by comparison with log(a)/a². This is the exponential of the Gauss integral of log of the first digit; it is not an independence product. The printed factor a(a+1) in the school notes is corrected.

The proof plan is: Define the scalar using native tsum and real exp, prove summability separately by comparison. Identify the series with the integral of log of the digit observable by the countable cylinder partition.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit`.

The API laws are `khinchin_series_summable`: The logarithmic series defining K is summable.; `khinchinConstant_pos`: K is positive.; `khinchinConstant_log_integral`: log K equals the Gauss integral of log of the first digit..

Tests: khinchin_first_term: The digit-1 logarithmic term is zero.; khinchin_second_term: The digit-2 logarithmic term is log(9/8), distinguishing a(a+2) from the printed a(a+1).; khinchin_not_unit: The constant exceeds one, unlike the all-digit-1 exceptional orbit..

Consumers: ProbabilisticAndMetricNumberTheory:PM.4/khinchin-geometric-mean — The pointwise logarithmic average exponentiates to K..

Source: Smyth2020, Theorem 21, physical p.46, corrected using the preceding digit-frequency formula.

#### khinchin_series_summable

`ProbabilisticAndMetricNumberTheory:PM.4/khinchin-constant-api-1` (lemma). The logarithmic series defining K is summable.

The proof plan is: Use log(1+u)≤u for u≥0 to dominate the summand by log(k+1)/((k+1)(k+3)log 2). Compare log(k+1)/(k+1)² with a summable power tail; the finitely many endpoint terms are immediate.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/khinchin-constant`.

Source: Smyth2020, Theorem 21, physical p.46, corrected using the preceding digit-frequency formula.

#### khinchinConstant_pos

`ProbabilisticAndMetricNumberTheory:PM.4/khinchin-constant-api-2` (lemma). K is positive.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/khinchin-constant`.

Source: Smyth2020, Theorem 21, physical p.46, corrected using the preceding digit-frequency formula.

#### khinchinConstant_log_integral

`ProbabilisticAndMetricNumberTheory:PM.4/khinchin-constant-api-3` (lemma). log K equals the Gauss integral of log of the first digit.

The proof plan is: Partition (0,1) by the first-digit cylinders and compute their masses by the Gauss interval formula. Use the summability API and integral over the measurable countable partition to identify the tsum, then log(exp(t))=t.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/khinchin-constant`, `ProbabilisticAndMetricNumberTheory:PM.4/khinchin-constant-api-1`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure-api-2`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit`.

Source: Smyth2020, Theorem 21, physical p.46, corrected using the preceding digit-frequency formula.

#### Integrability of Gauss logarithmic observables

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-log-integrability` (lemma). The real functions x↦log(gaussDigit(x,0)) and x↦−log x are integrable for μ_G.

The proof plan is: For log of the digit, sum the positive cylinder integral weights and compare with the summable logarithmic series. For −log x use the bounded positive Gauss density and the classical integral of |log x| on (0,1). The divergent digit mean can be established separately by truncation.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit`, `ProbabilisticAndMetricNumberTheory:PM.4/khinchin-constant`.

Source: Smyth2020, Lesson 9 §1.2 and exercises 2.3–2.4, physical pp.46,48–49.

#### Khinchin geometric mean theorem

`ProbabilisticAndMetricNumberTheory:PM.4/khinchin-geometric-mean` (theorem). For Lebesgue-almost every x∈(0,1), (∏_{0≤j<N}gaussDigit(x,j))^(1/N) tends to K. The exponent is real, N→∞, and irrational positive-digit inputs hold outside one null set.

The proof plan is: Apply the pointwise ergodic theorem to the integrable logarithmic first-digit observable. Use the digit-shift identity and positivity to turn the log average into the logarithm of the geometric mean; exponentiate and transport measure.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/khinchin-constant-api-3`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-log-integrability`, `ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-pointwise-ergodic`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-ergodic`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit-api-2`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure-api-3`.

Source: Smyth2020, Theorem 21 and exercise 2.3(c), physical pp.46,48, corrected constant.

#### Convergent denominators and orbit logarithms

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-denominator-log-bridge` (lemma). For irrational x∈(0,1) and N≥0, |log((GenContFract.of x).dens N)+Σ_{j<N}log(T^[j]x)|≤log 2. Use the exact identity ∏_{j<N}(T^[j]x)⁻¹=q_N+q_(N−1)T^[N]x, with q_(−1)=0, q_0=1. Rational terminated streams are excluded.

The proof plan is: Induct on the native continuant recurrence to obtain the exact product identity. Use 0≤q_(N−1)≤q_N and 0<T^[N]x<1 to trap the product between q_N and 2q_N; take logs.

Direct prerequisites: `mathlib:GenContFract.of`, `mathlib:GenContFract.dens`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-map`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit`.

Source: Smyth2020, Lesson 7 continuants and Lesson 9 exercise 2.4, physical pp.34–37,48–49; sharper bounded-error refinement.

#### Gauss logarithmic integral

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-density-log-integral` (lemma). The Gauss integral ∫−log x dμ_G is π²/(12 log 2). The value is positive; the corresponding integral of log x is its negative.

The proof plan is: Expand 1/(1+x) on (0,1) with controlled truncation and integrate −x^n log x=1/(n+1)². Use the native ζ(2) evaluation and even/odd splitting to identify the alternating sum π²/12. The exact native integral-series interchange declarations remain to be matched.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-log-integrability`.

Source: Smyth2020, Lesson 9 exercise 2.4(c) with corrected sign, physical p.49; elementary integral/series evaluation.

#### Lévy denominator growth theorem

`ProbabilisticAndMetricNumberTheory:PM.4/levy-denominator` (theorem). For Lebesgue-almost every x∈(0,1), log((GenContFract.of x).dens N)/N tends to π²/(12 log 2). The native denominator index is fixed by q_0=1, not shifted to the first fractional digit.

The proof plan is: Apply the pointwise ergodic theorem to −log x and use the explicit integral. Divide the bounded log-denominator error by N; it tends to zero.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-denominator-log-bridge`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-density-log-integral`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-log-integrability`, `ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-pointwise-ergodic`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-ergodic`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure-api-3`.

Source: Smyth2020, Lesson 9 §1.2 and exercise 2.4, physical pp.46,48–49.

#### Gauss–Kuzmin exponential convergence

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-kuzmin` (theorem). There are absolute C>0 and 0<ρ<1 such that for every a≥1 and n≥0, the Lebesgue probability that gaussDigit(x,n)=a differs from log((a+1)^2/(a(a+2)))/log 2 by at most Cρ^n. This is convergence of the nth marginal law from Lebesgue initial data; pointwise ergodic frequency alone gives no exponential rate.

The proof plan is: Use the Lebesgue transfer operator Lf(x)=Σ_{a≥1} f(1/(a+x))/(a+x)² and its fixed density. Prove the Lipschitz Doeblin–Fortet estimate and compact embedding; apply the separately recorded Hennion spectral input and simplicity from Gauss mixing. Integrate L^n1−h over the digit cylinder. Its L1 norm gives a constant uniform in a; the iterate index follows the corrected first-digit convention.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-invariant`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-mixing`, `ProbabilisticAndMetricNumberTheory:PM.4/gauss-cylinder-distortion`.

Source: SarigTransfer, §2.3 Gauss–Kuzmin theorem and Doeblin–Fortet proof, physical pp.11–13.

#### Absolute Gauss inverse-branch derivative

`ProbabilisticAndMetricNumberTheory:PM.4/gauss-branch-derivative` (lemma). For a≥1 and x∈[0,1], v_a(x)=1/(a+x) has real derivative −1/(a+x)² and absolute derivative 1/(a+x)².

The proof plan is: Differentiate the reciprocal away from its zero denominator, using a+x≥1. The determinant sign is removed only when forming the unsigned measure Jacobian.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.4/gauss-branch-jacobian`.

Source: SarigTransfer, §2.3 transfer formula and Appendix A.2, physical pp.12,32.

### PM.5 — local multiplicative laws and separate random models

The short-interval theorem concerns bounded real multiplicative functions. Its exceptional set counts integer starting points; the intermediate good-integer estimate integrates real starting points and keeps every prime-range inequality. The full analytic proof and the source modulated-sum input remain gaps. AN.3 owns quantitative Dirichlet-polynomial estimates, AN.5 owns pretentious/Halász interfaces, and ES.0 is requested for the specific circle-method input.

The logarithmic two-point theorem retains nonproportional affine forms, the growing window and harmonic normalization. The Elliott condition is uniform over |t|≤Ax for every fixed character and A; fixed-t divergence is insufficient. The ordinary fixed-shift Liouville bound has a fixed positive savingδ(h), not an o(N) conclusion. The Rademacher and Steinhaus constructions use existing arithmetic carriers outcome by outcome; their prime-power tests and separately stated covariance laws distinguish the two models. The native product-law/independent-integral bridge is still a gap. Neither expected random cancellation nor a two-point logarithmic theorem proves the general Chowla/Sarnak conjectures.

#### Inclusive short-interval means

`ProbabilisticAndMetricNumberTheory:PM.5/short-interval-mean` (definition). For real arithmetic f, natural x,h, shortMean(f,x,h)=h⁻¹Σ_{x≤n≤x+h}f(n). The source includes both endpoints but normalizes by h, giving h+1 terms. Native total division gives shortMean(f,x,0)=0. Its long dyadic mean is the same expression shortMean(f,X,X).

The proof plan is: Use native Finset.Icc with exactly the source normalization; do not replace the denominator by h+1. The exceptional set is a finite set of integer x∈[X,2X] for Theorem 1; the source’s intermediate L2 estimate integrates real starting points separately.

Direct prerequisites: `mathlib:ArithmeticFunction`, `mathlib:ArithmeticFunction.IsMultiplicative`.

The API laws are `shortMean_zero`: The totalized zero-length mean is zero.; `shortMean_add`: The mean is linear for pointwise addition of arithmetic functions.; `shortMean_bound`: If |f(n)|≤1 on the interval and h>0, |shortMean|≤(h+1)/h..

Tests: short_zero: The zero arithmetic function has zero means.; short_one_length: A length-one interval includes f(x) and f(x+1), with denominator one.; short_constant: For x,h>0 and f(n)=1 on positive inputs, the mean is (h+1)/h, not one..

Consumers: ProbabilisticAndMetricNumberTheory:PM.5/matomaki-radziwill — Pins the main theorem’s local and dyadic comparison with exact finite endpoints..

Source: MatomakiRadziwill, Theorem 1, physical p.1; collated published pp.1015–1017,1020–1021.

#### shortMean_zero

`ProbabilisticAndMetricNumberTheory:PM.5/short-interval-mean-api-1` (lemma). The totalized zero-length mean is zero.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/short-interval-mean`.

Source: MatomakiRadziwill, Theorem 1, physical p.1; collated published pp.1015–1017,1020–1021.

#### shortMean_add

`ProbabilisticAndMetricNumberTheory:PM.5/short-interval-mean-api-2` (lemma). The mean is linear for pointwise addition of arithmetic functions.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/short-interval-mean`.

Source: MatomakiRadziwill, Theorem 1, physical p.1; collated published pp.1015–1017,1020–1021.

#### shortMean_bound

`ProbabilisticAndMetricNumberTheory:PM.5/short-interval-mean-api-3` (lemma). If |f(n)|≤1 on the interval and h>0, |shortMean|≤(h+1)/h.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/short-interval-mean`.

Source: MatomakiRadziwill, Theorem 1, physical p.1; collated published pp.1015–1017,1020–1021.

#### Matomäki–Radziwiłł short-interval theorem

`ProbabilisticAndMetricNumberTheory:PM.5/matomaki-radziwill` (theorem). There are absolute C,C′>1 such that for every real multiplicative f with |f(n)|≤1 on positive integers, natural 2≤h≤X and δ>0, all but at most C X[(log h)^(1/3)/(δ² h^(δ/25))+1/(δ²(log X)^(1/50))] integer x∈[X,2X] satisfy |shortMean(f,x,h)−shortMean(f,X,X)|≤δ+C′log log h/log h. C,C′ are independent of f,h,X,δ. Complex-valued functions are not covered by this source theorem.

The proof plan is: Use Theorem 3’s mean-square comparison on the source set with one prime factor in each specified prime interval. Control the excluded source integers and the local excluded mass using the same theorem with f=1, then apply Markov with δ. The analytic and good-integer/sieve estimates of Sections 3–9 are precise remaining inputs; no proved conclusion is derived from a random model.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/short-interval-mean`, `mathlib:ArithmeticFunction.IsMultiplicative`, `AnalyticNumberTheory:AN.5`, `AnalyticNumberTheory:AN.3`.

Source: MatomakiRadziwill, Theorem 1, physical p.1; collated published pp.1015–1017,1020–1021.

#### Good-integer mean-square input

`ProbabilisticAndMetricNumberTheory:PM.5/short-interval-good-set` (lemma). MR Theorem 3: for η∈(0,1/6), increasing prime intervals [P_j,Q_j], Q₁≤exp(sqrt(log X)), and every j≥2, (log log Q_j)/(log P_(j−1)−1)≤η/(4j²) and (η/j²)log P_j≥8log Q_(j−1)+16log j. Let J be the largest j with Q_j≤exp(sqrt(log X)), and S_X={n∈[X,2X]: each interval [P_j,Q_j],1≤j≤J, contains a prime divisor of n}. If [P₁,Q₁]⊂[1,h], then for X≥X₀(η), ∫_X^(2X)|h⁻¹Σ_{x≤n≤x+h,n∈S_X}f(n)−X⁻¹Σ_{X≤n≤2X,n∈S_X}f(n)|²dx ≤ C_η X[(log h)^(1/3)/P₁^(1/6−η)+(log X)^(−1/50)]. The start x is real and both finite sums retain the inclusive endpoints. Formula (4) is one admissible choice, not the complete hypothesis.

The proof plan is: Use the source restricted Dirichlet polynomial integral and its decomposition by prime intervals. Keep the exact good-set interface, real-starting-point endpoint convention and all interval inequalities from (4). Its full Sections 3–9 proof is unread; omit that foreign supplier-dependent signature.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/short-interval-mean`.

Source: MatomakiRadziwill, Theorem 3 and (4), physical pp.6–7; collated published pp.1015–1017,1020–1021.

#### Logarithmic two-point averages

`ProbabilisticAndMetricNumberTheory:PM.5/log-correlation` (definition). For complex native arithmetic f,g, positive natural slopes a₁,a₂, integer shifts b₁,b₂ and real x,w, logCorrelation is [Σ_{floor(x/w)<n≤floor(x)} f((a₁n+b₁).toNat)g((a₂n+b₂).toNat)/n]/log w. The range is x/w<n≤x when x≥w≥1. Native zero-extension makes negative/zero linear forms contribute zero; those finitely many initial terms do not affect limits with log w→∞. No complex conjugation is inserted.

The proof plan is: Use the exact half-open interval, harmonic weight and logarithmic normalization. Integer shifts use the native zero-extended arithmetic carrier; positive slopes guarantee eventual positive arguments.

Direct prerequisites: `mathlib:ArithmeticFunction`, `mathlib:ArithmeticFunction.liouville`.

The API laws are `logCorrelation_swap`: Swapping the observations and both linear forms leaves the product average unchanged.; `logCorrelation_add_left`: The average is linear in the first observation for pointwise arithmetic-function addition.; `logCorrelation_one_window`: When w=1 the summation interval is empty and the totalized average is zero..

Tests: log_weight_small: For Liouville at forms n,n+1, x=w=2, the value is 1/(2 log 2).; log_weight_sign: At x=w=4 the n,n+1 numerator is −1/12, distinguishing harmonic from uniform averaging.; log_degenerate_forms: At x=w=4 identical Liouville forms give numerator 13/12, demonstrating the determinant exclusion..

Consumers: ProbabilisticAndMetricNumberTheory:PM.5/logarithmic-chowla — The two-point Liouville conclusion has this exact window and harmonic weight.; ProbabilisticAndMetricNumberTheory:PM.5/logarithmic-elliott — The corrected uniform nonpretentiousness condition controls the same complex product average..

Source: TaoLogChowla, Theorems 1.2–1.3 and Corollary 1.5, physical pp.1–6; collated published Theorem 2 (p.3), Theorem 3 (p.5) and Corollary 5 (p.6).

#### logCorrelation_swap

`ProbabilisticAndMetricNumberTheory:PM.5/log-correlation-api-1` (lemma). Swapping the observations and both linear forms leaves the product average unchanged.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/log-correlation`.

Source: TaoLogChowla, Theorems 1.2–1.3 and Corollary 1.5, physical pp.1–6; collated published Theorem 2 (p.3), Theorem 3 (p.5) and Corollary 5 (p.6).

#### logCorrelation_add_left

`ProbabilisticAndMetricNumberTheory:PM.5/log-correlation-api-2` (lemma). The average is linear in the first observation for pointwise arithmetic-function addition.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/log-correlation`.

Source: TaoLogChowla, Theorems 1.2–1.3 and Corollary 1.5, physical pp.1–6; collated published Theorem 2 (p.3), Theorem 3 (p.5) and Corollary 5 (p.6).

#### logCorrelation_one_window

`ProbabilisticAndMetricNumberTheory:PM.5/log-correlation-api-3` (lemma). When w=1 the summation interval is empty and the totalized average is zero.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/log-correlation`.

Source: TaoLogChowla, Theorems 1.2–1.3 and Corollary 1.5, physical pp.1–6; collated published Theorem 2 (p.3), Theorem 3 (p.5) and Corollary 5 (p.6).

#### Logarithmic two-point Chowla theorem

`ProbabilisticAndMetricNumberTheory:PM.5/logarithmic-chowla` (theorem). For fixed positive slopes a₁,a₂ and integer shifts b₁,b₂ with a₁b₂−a₂b₁≠0, and 1≤w(x)≤x eventually with w(x)→∞, logCorrelation(λ,λ,a₁,a₂,b₁,b₂,x,w(x))→0 as x→∞. This is source Theorem 1.2 with harmonic weighting, not ordinary two-point cancellation on every prefix.

The proof plan is: Apply the corrected logarithmic Elliott theorem to Liouville, with the source’s uniform twisted-character nonpretentiousness supplied analytically. Bound the finitely many nonpositive linear-form terms by an absolute constant and divide by log w. The entropy-decrement/modulated-short-sum proof and uniform character input remain named gaps, not consequences of iid signs.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/log-correlation`, `mathlib:ArithmeticFunction.liouville`, `mathlib:ArithmeticFunction.liouville_apply_mul`, `AnalyticNumberTheory:AN.5`, `AnalyticNumberTheory:AN.3`, `ExponentialSumsAndCircleMethod:ES.0`.

Source: TaoLogChowla, Theorem 1.2, physical p.2 and Corollary 1.5, pp.5–6; collated published Theorem 2 (p.3), Theorem 3 (p.5) and Corollary 5 (p.6).

#### Corrected logarithmic Elliott theorem

`ProbabilisticAndMetricNumberTheory:PM.5/logarithmic-elliott` (theorem). For native complex multiplicative f,g bounded by 1, fixed positive slopes and distinct nonproportional linear forms, assume: for every fixed Dirichlet character χ and A≥1, inf_{|t|≤Ax}Σ_{p≤x}(1−Re(f(p)conj(χ(p))p^(−it)))/p→∞. Then for every eventually 1≤w(x)≤x with w→∞, the normalized logarithmic two-point correlation tends to zero. This is Corollary 1.5; divergence for each fixed t alone is explicitly insufficient.

The proof plan is: Use Theorem 1.3’s finite ε,A uniform nonpretentiousness estimate, with characters of bounded period and the entire |t|≤Ax range. For each ε choose its threshold and apply the stated uniform divergence condition, then let ε tend to zero. The AN.5-owned distance/character API and complete entropy-decrement proof have not been supplied; omit the foreign condition signature explicitly.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/log-correlation`, `mathlib:ArithmeticFunction.IsMultiplicative`, `AnalyticNumberTheory:AN.5`, `ExponentialSumsAndCircleMethod:ES.0`.

Source: TaoLogChowla, Corollary 1.5 and Remark 1.6, physical pp.5–6; collated published Theorem 2 (p.3), Theorem 3 (p.5) and Corollary 5 (p.6).

#### Nontrivial ordinary Liouville correlation bound

`ProbabilisticAndMetricNumberTheory:PM.5/liouville-two-point-nontrivial` (theorem). For each fixed integer h≥1 there are δ(h)>0 and X₀(h) such that for X≥X₀, |Σ_{1≤n≤X}λ(n)λ(n+h)|≤(1−δ(h))X. MR Corollary 2 proves a bound separated from 1; it is not o(X) and is not an ordinary Chowla theorem.

The proof plan is: Use the source short-interval/sign-change argument with complete multiplicativity of Liouville. Read the complete corollary proof and its dependence on h before promoting a quantitative δ(h).

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/matomaki-radziwill`, `mathlib:ArithmeticFunction.liouville`, `mathlib:ArithmeticFunction.liouville_apply_mul`.

Source: MatomakiRadziwill, Corollary 2, physical pp.2–3; collated published pp.1015–1017,1020–1021.

#### Rademacher random multiplicative model

`ProbabilisticAndMetricNumberTheory:PM.5/rademacher-model` (construction). Given a measurable family ξ_p of independent fair signs on a native probability space, construct for each outcome the native real arithmetic function R(n)=∏_{p|n}ξ_p when n is squarefree and R(n)=0 otherwise, including n=0. R(1)=1. This is the standard squarefree-supported Möbius model, not a completely multiplicative sign model.

The proof plan is: Construct the zero hom by the displayed squarefree guard and finite prime-factor product; randomness is in the supplied independent family. Coprime multiplicativity follows from the native squarefree-product and prime-factor union laws; no deterministic arithmetic cancellation is inferred.

Direct prerequisites: `mathlib:ArithmeticFunction`.

The API laws are `rademacherModel_squarefree`: On squarefree n the value is the product of its prime signs.; `rademacherModel_nonsquarefree`: On nonsquarefree n the value is zero.; `rademacherModel_multiplicative`: For every outcome the native arithmetic function is multiplicative..

Tests: rademacher_one: The empty product at one is one.; rademacher_four: The value at four is zero, unlike a completely multiplicative sign model.; rademacher_six: The value at six is ξ₂ξ₃..

Consumers: ProbabilisticAndMetricNumberTheory:PM.5/random-model-orthogonality — Native expectation computes exact finite-model covariance.; ProbabilisticAndMetricNumberTheory:PM.5 — A model for conjecture heuristics only; neither Chowla nor Sarnak follows without an arithmetic comparison..

Source: Harper, Introduction, printed p.2277.

#### rademacherModel_squarefree

`ProbabilisticAndMetricNumberTheory:PM.5/rademacher-model-api-1` (lemma). On squarefree n the value is the product of its prime signs.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/rademacher-model`.

Source: Harper, Introduction, printed p.2277.

#### rademacherModel_nonsquarefree

`ProbabilisticAndMetricNumberTheory:PM.5/rademacher-model-api-2` (lemma). On nonsquarefree n the value is zero.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/rademacher-model`.

Source: Harper, Introduction, printed p.2277.

#### rademacherModel_multiplicative

`ProbabilisticAndMetricNumberTheory:PM.5/rademacher-model-api-3` (lemma). For every outcome the native arithmetic function is multiplicative.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/rademacher-model`.

Source: Harper, Introduction, printed p.2277.

#### Steinhaus completely multiplicative model

`ProbabilisticAndMetricNumberTheory:PM.5/steinhaus-model` (construction). Given independent uniform unit-circle prime observations ζ_p, construct S(n)=∏_{p|n}ζ_p^(v_p(n)) for n>0 and S(0)=0 in the native complex arithmetic-function carrier. Unlike the Rademacher squarefree model, S(p²)=ζ_p² and every positive input has unit modulus.

The proof plan is: Use the native factorization exponents and the explicit zero extension. Factorization addition gives complete multiplicativity on positive inputs; zero cases follow from the native guard.

Direct prerequisites: `mathlib:ArithmeticFunction`.

The API laws are `steinhausModel_mul`: The model is completely multiplicative for every outcome.; `steinhausModel_prime_pow`: For prime p and k>0, the value at p^k is ζ_p^k.; `steinhausModel_norm`: Unit modulus of prime observations gives unit modulus at every positive input..

Tests: steinhaus_zero: The native zero extension gives S(0)=0.; steinhaus_one: The empty positive-input product gives S(1)=1.; steinhaus_four: S(4)=ζ₂² rather than zero..

Consumers: ProbabilisticAndMetricNumberTheory:PM.5/random-model-orthogonality — Distinct integer products give distinct prime exponent vectors; Haar phase integration detects equality..

Source: Harper, Introduction, printed p.2277.

#### steinhausModel_mul

`ProbabilisticAndMetricNumberTheory:PM.5/steinhaus-model-api-1` (lemma). The model is completely multiplicative for every outcome.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/steinhaus-model`.

Source: Harper, Introduction, printed p.2277.

#### steinhausModel_prime_pow

`ProbabilisticAndMetricNumberTheory:PM.5/steinhaus-model-api-2` (lemma). For prime p and k>0, the value at p^k is ζ_p^k.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/steinhaus-model`.

Source: Harper, Introduction, printed p.2277.

#### steinhausModel_norm

`ProbabilisticAndMetricNumberTheory:PM.5/steinhaus-model-api-3` (lemma). Unit modulus of prime observations gives unit modulus at every positive input.

The proof plan is: Unfold the defining formula or use the indicated native compatibility theorem. Prove the stated API law in the native carrier; retain the parent definition’s discriminating tests.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/steinhaus-model`.

Source: Harper, Introduction, printed p.2277.

#### Rademacher covariance

`ProbabilisticAndMetricNumberTheory:PM.5/rademacher-covariance` (lemma). For independent fair signs on the primes and positive m,n, E[R(m)R(n)]=1 if m=n is squarefree, and zero otherwise.

The proof plan is: If either input is not squarefree its value vanishes. For squarefree inputs factor the expectation prime by prime; an odd exponent has zero fair-sign mean, while an even exponent contributes one. The exact native independent fair-sign product-law conditions are not yet matched; omit the law-bearing signature.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/rademacher-model`.

Source: Harper, Printed p.2278, finite moment counting.

#### Steinhaus covariance

`ProbabilisticAndMetricNumberTheory:PM.5/steinhaus-covariance` (lemma). For independent unit-circle Haar phases at primes and positive m,n, E[S(m)conj(S(n))]=1 if m=n and zero otherwise.

The proof plan is: Factor the finite expectation over the prime support of mn, with conjugation on the second factor. Haar phase integration annihilates every nonzero exponent difference; unique factorization identifies the diagonal. The exact native independent Haar-phase product-law conditions are not yet matched; omit the law-bearing signature.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/steinhaus-model`.

Source: Harper, Printed p.2278, finite moment counting.

#### Finite random-model second moments

`ProbabilisticAndMetricNumberTheory:PM.5/random-model-orthogonality` (lemma). For N≥1 the Rademacher partial sum over 1≤n≤N has second moment equal to #{n≤N:squarefree n}; the Steinhaus partial sum has absolute-square second moment N. These identities are model expectations and imply no deterministic Möbius/Liouville cancellation.

The proof plan is: Expand the finite sum square and use linearity of expectation. Insert the separate covariance formulas and sum the surviving diagonal terms. The exact native law-bearing signatures are omitted until the corresponding product probability interfaces are fixed.

Direct prerequisites: `ProbabilisticAndMetricNumberTheory:PM.5/rademacher-covariance`, `ProbabilisticAndMetricNumberTheory:PM.5/steinhaus-covariance`.

Source: Harper, Printed p.2278, finite diagonal counting.

### Conjecture register

**Chowla conjecture (conjecture).** For distinct nonnegative shifts a₁<⋯<a_t, exponents k_i∈{1,2} not all even, N⁻¹Σ_{1≤n≤N}∏_i μ(n+a_i)^(k_i)→0. The Liouville formulation for pairwise nonproportional positive-slope affine forms is N⁻¹Σ_n∏_i λ(a_i n+b_i)→0. These ordinary averages are conjectural; the separate two-point logarithmic theorem does not prove them. Source: Sarnak, Conjecture 1, p.3; TaoLogChowla, Published Conjecture 1, p.2.

**Sarnak conjecture (conjecture).** For every compact metric X, continuous T:X→X of zero topological entropy, continuous f:X→ℂ and x∈X, N⁻¹Σ_{1≤n≤N} μ(n)f(T^[n]x)→0. The zero-entropy condition, all points x and ordinary average are essential. The Möbius–nilsequence theorem owned by AC.5 is a proved special case, not the whole conjecture. Source: Sarnak, Definitions of deterministic flow and orthogonality and Conjecture 4, p.4.

### Current coverage and remaining obligations

**ProbabilisticAndMetricNumberTheory:PM.0 — planned.**

- Original Kolmogorov–Rogozin proof not read: BSKK Lemma 7.2 cites references [19,33,34]. Its equal-radius real inequality is the exact target; acquire the original concentration-function proof and split its symmetrization/combinatorial estimate before claiming lemma-level closure. A complex root projection needs a separate real comparison and is outside this generic theorem.
- Classical Kubilius quantitative proof and native product law: Chen–Jaramillo–Yang (1.1) supplies the exact classical target but cites Kubilius [10]; acquire its full small-prime/fundamental-lemma proof or a complete proof of this bound. Match the native finite product of geometricMeasure and its atom factorization. The existing exact finite-period and finite-head error estimates do not imply this growing-prime comparison, since the prime product need not be small relative to N.
- Finite versus growing arithmetic limit-law input: Complete the source’s growing/fixed-order prime cutoff and Mertens normalization estimates using the retained arithmetic moment nodes, then apply a genuine moment-convergence theorem with uniform integrability/tightness and the native Gaussian moment determinacy. The latter alone does not imply convergence. Match density of CDF continuity points via countability of atoms. The inherited finite Gaussian upper bounds are not asserted to be asymptotic moment formulas.

**ProbabilisticAndMetricNumberTheory:PM.1 — planned.**

- Turán–Kubilius proof input: Acquire the proof cited as Elsholtz–Tao [60, p.20]. The centering A_N and coefficient 30 above are read; independent Bernoulli moments for a fixed finite prime set do not prove this uniform full prime-power mean-square bound.
- Restricted-family quantitative concentration: Read the source for Theorem 7.2(a)’s quantitative Erdős–Kac input on D(N), or prove a restricted-family second-moment bound with center (1/2)log log N and O(|D(N)|log log N) variance. The latter would give a stronger (log log N)^(-1/3) tail. Neither estimate has been established here; ordinary Turán–Kubilius on all integers is insufficient after conditioning on this thin family.
- Gaussian moment convergence and source cutoff estimates: Promote precise fixed-order cutoff/normalization asymptotics and prove convergence to the Gaussian from all fixed moments with tightness/uniform integrability. Native Gaussian moment formulas and moment determinacy alone are insufficient. Do not state a uniform growing-moment range without reading Granville–Soundararajan’s exact source theorem.
- Finite versus growing arithmetic limit-law input: Complete the source’s growing/fixed-order prime cutoff and Mertens normalization estimates using the retained arithmetic moment nodes, then apply a genuine moment-convergence theorem with uniform integrability/tightness and the native Gaussian moment determinacy. The latter alone does not imply convergence. Match density of CDF continuity points via countability of atoms. The inherited finite Gaussian upper bounds are not asserted to be asymptotic moment formulas.
- Supplier AnalyticNumberTheory:AN.2: Reciprocal-prime Mertens asymptotic Σ_{p≤z}1/p=log log z+O(1), including the bounded prime-power remainder needed to compare the source Turán–Kubilius A_N,B_N²; supply exact scope/effectivity. Import existing summation APIs instead of rebuilding AN.0.

**ProbabilisticAndMetricNumberTheory:PM.2 — planned.**

- Discrepancy proof inputs: Read the original or a complete freely accessible proof of the Vaaler/Grabner interval majorants and Koksma integration-by-parts formula; the author sampler supplies exact statements and constants, not those proofs. Native BoundedVariationOn/eVariationOn are used directly, and no Hardy–Krause variation or multidimensional Koksma–Hlawka theorem is silently substituted.
- Native digit/circle cylinder bridge: Check the complete positional-cylinder/floor proof and half-open endpoint transport for Real.digits at the pin. The native expanding-circle ergodicity theorem is available, but its pointwise-frequency bridge is not. A Bernoulli-shift isomorphism is an alternative proof only once its canonical digit/endpoints comparison is established.
- Retained torus refinements: Retained asymptotic torus statements include integer indexing and the abelian rational/Ratner decomposition. Exercise1.1.22’s compact-connected-subgroup realization and the higher-dimensional criterion exercises still need refinement beyond the SL_d(Z) subtorus presentation. Quantitative single-scale equidistribution has not been decomposed; obtain an exact requested rate and source passage from ES/AC consumers before claiming it.

**ProbabilisticAndMetricNumberTheory:PM.3 — planned.**

- Pollington–Vaughan inputs of the Duffin–Schaeffer proof not read: Koukoulopoulos–Maynard Lemma 5.2 (the conjecture when ψ takes only values 0 or ⩾ 1/2) and Lemma 5.3 (the overlap estimate for λ(𝒜_q ∩ 𝒜_r)) are cited to Pollington–Vaughan, Mathematika 37 (1990), Theorem 2 and pp. 195–196, which were not read. The overlap estimate is recorded with its indicator corrected (E10). An open source for both proofs must be read before these two nodes are decomposed; the source notes that related proofs appear in Harman's book Metric Number Theory (Theorems 2.5, 2.6 and 3.6), which is not freely available.
- Mass-transference native interfaces: Fix the source’s finite separated-ball tree using native Finset/Metric.closedBall and the compatible finite-mass extension to a native Borel probability. Read or replace Falconer [3, Proposition 1.7] cited in BV §5.3; the source asserts this extension without proving it. Match the full arbitrary-gauge radius/diameter comparison with Measure.mkMetric, the reduced-rational ball enumeration and strict/closed-radius transport. No private Prop-valued fields stand in for these missing conditions in the suggested file.
- Higher-dimensional Pollington–Vaughan theorem: Acquire the original k≥2 divergence proof and match its coordinatewise coprimality, sup-norm cubes, ambient volume normalization and overlap/zero-one lemmas. BV supplies the precise target but only cites the proof. The preserved one-dimensional Pollington–Vaughan overlap gap remains separately recorded.
- Supplier AnalyticNumberTheory:AN.2: Mertens' theorems: Σ_{p≤x} 1/p = log log x + B + O(1/log x), with an effective error such as Rosser–Schoenfeld Theorem 5 (|error| ⩽ 1/(log x)² for x ⩾ 286), and its consequences Σ_{w≤p<z} 1/p = log(log z/log w) + O(1/log w) and ∏_{p≤x}(1 + 1/p) ≍ log x. Koukoulopoulos–Maynard use them in the proof of Theorem 1 ((5.8)), Lemma 7.3 and Lemma 8.4. Mathlib 082e2d3 has Chebyshev's bounds but no Mertens theorem.

**ProbabilisticAndMetricNumberTheory:PM.4 — planned.**

- Pointwise ergodic proof and native representative: Complete the finite measurable coloring lemma, extended-real limsup truncation and conditional-expectation identification in the exact native invariants sigma-algebra. The full source proof was read; this pass records its logic and interfaces, not a checked implementation. Tau Ceti’s audited L1/mean Birkhoff results remain imports and do not supply this pointwise theorem. No existing roadmap stage was found to own the generic pointwise extension.
- Gauss martingale and native cylinder inputs: Match the forward cylinder conditional-expectation convergence, Borel-generation proof, and reverse-martingale exact-to-mixing theorem at the pin. Read their actual native hypotheses before citing declarations; the source proofs invoke them. Native Gauss digits must be matched to the existing nonterminating continued-fraction stream, not reconstructed in a second carrier.
- Gauss–Kuzmin analytic closure: Finish native Lipschitz Banach-space/transfer-operator norm estimates, prove compact embedding, and read Hennion’s Appendix A.3 proof (physical pp.35–38). This input and the spectral-gap/simplicity argument are not supplied by qualitative mixing or pointwise averages. No abstract spectral-gap Prop parameter replaces these conditions in the suggested file.
- Native continued-fraction orbit and integral bridges: Prove the floor-stream/digit shift identification on irrational (0,1), match exact native nontermination, positive-continuant and adjacent-denominator comparison lemmas, and identify finite-word inverse branches with native convergents. Match the integral/series interchange and ζ(2) evaluation used in the Gauss logarithmic integral. Definitions alone are not treated as those proof inputs.
- Homogeneous dynamics is GN.4-owned: use its quotient/flow contracts for the roadmap’s overview applications. The real Gauss metric statements here do not depend on those unrelated group-flow theorems.

**ProbabilisticAndMetricNumberTheory:PM.5 — planned.**

- Short-interval analytic proof: Read MR Sections 3–9 in full: source prime-interval parameters (4), the mean-square Dirichlet-polynomial estimate (5), the factorization by prime blocks, Halász/sieve bounds, and the exceptional-set conversion. The source theorem statement and Theorem 3 were read; no complete analytic decomposition is claimed. The intermediate integral over real x and final exceptional cardinality over integer x are distinct.
- Logarithmic correlation proof inputs: Read Tao Sections 2–4 fully and route their finite Shannon entropy/conditional entropy/mutual-information APIs, entropy decrement with scale selection, concentration and circle-method estimate. Obtain the cited modulated short-Liouville sums of Matomäki–Radziwiłł–Tao. The original Elliott fixed-t condition is false; this plan requires the corrected uniform infimum condition. The general concentration theorem in PM.0 does not replace entropy decrement or the modulated-sum estimate.
- Random-model law realization and covariance: Match native infinite product probability, independent fair signs and unit-circle Haar phase laws, and their finite integral-factorization statements. The outcome-wise arithmetic constructions and their discriminating prime-power tests are concrete; no transfer from their expected cancellation to deterministic Möbius/Liouville is available.
- Supplier AnalyticNumberTheory:AN.5: Supply the existing-owner pretentious-distance and Halász interfaces with quantitative conductor/height ranges. For Tao Corollary 1.5 specifically, require uniform divergence over |t|≤Ax for every fixed character χ and A≥1; fixed-t divergence is insufficient. Also supply the Halász input to MR’s restricted Dirichlet-polynomial argument.
- Supplier AnalyticNumberTheory:AN.3: Supply source-scoped Dirichlet-polynomial mean-value bounds and any required quantitative zero-free-region/nonpretentiousness estimate for Liouville against characters with the |t|≤Ax height range. Ordinary short-interval prime-counting estimates or a qualitative fixed-modulus PNT are insufficient for these uniform twisted bounds.
- Supplier ExponentialSumsAndCircleMethod:ES.0: Supply the source-scoped modulated short-sum/circle-method Fourier estimates used in Tao’s entropy-decrement proof; they must include their averaging variables and scale ranges. Existing finite character-sum identities alone do not give the needed Liouville minor-arc cancellation.
- General Chowla and Sarnak remain conjectures in the register; the theorem nodes assert only the explicitly stated proved short-interval/logarithmic results.

### Source observations and versions

The following observations await independent review. Their exact version, correction search and mathematical check appear in the packet; inherited findings retain their original receipts. No author was contacted.

- **ProbabilisticAndMetricNumberTheory/E15** (SarigTransfer, misprint, affects nothing): Proposition 1.1, physical p.6 / printed p.4, uniqueness proof in acquired author notes. Replace the second h₁ by h₂. The surrounding argument compares two densities h₁ and h₂. Repeating h₁ gives zero independently of h₂ and cannot establish their equality. Known: new.
- **ProbabilisticAndMetricNumberTheory/E16** (SarigTransfer, misprint, affects the proof): §2.3, physical p.11 / printed p.9, first continued-fraction iterate display. Write T^(n−1)(x)=1/(aₙ+⋯), or retain Tⁿ with first denominator a_(n+1). The text starts x=[0;a₁,a₂,…] and T deletes the first digit. At n=1 the next digit is a₂, as also used in the following cylinder formula. Known: new.
- **ProbabilisticAndMetricNumberTheory/E17** (SarigTransfer, error, affects the proof): Exercise 2.5(b), physical p.12 / printed p.10, uniform contraction in acquired author notes. Use ≤ for all x,y, or require x≠y for a strict version. Set x=y. Both sides vanish, so the printed strict inequality says 0<0. The non-strict contraction is the proof input. Known: new.
- **ProbabilisticAndMetricNumberTheory/E18** (SarigTransfer, error, affects the proof): Exercise 2.5(c), physical p.13 / printed p.11, derivative hint in acquired author notes. For one-digit branches use Lip(log|v′ₐ|)≤2; for all words use the continuant denominator to bound relative derivative distortion. For a=1, v(x)=1/(1+x); the derivative secant between 0 and 1/4 has absolute slope 36/25>1. The logarithmic derivative slope is at most 2 on [0,1]. The hinted derivative bound is false, while the intended relative distortion remains valid. Known: new.
- **ProbabilisticAndMetricNumberTheory/E19** (SarigTransfer, misprint, affects the proof): Appendix A.2, physical p.32 / printed p.30, Rényi cylinder change of variables. Integrate |v′ₐ| for the unsigned Lebesgue Jacobian. An odd-length inverse branch has negative derivative. Its integral over a positive-measure cylinder would be negative, unlike the positive measure being computed. Known: new.
- **ProbabilisticAndMetricNumberTheory/E20** (SarigTransfer, error, affects the proof): Appendix A.2, physical p.33 / printed p.31, Gauss density comparison. Replace the upper density bound by 1/log 2. Thus m(Bₙ)≥(log 2)μ_G(Bₙ)≥m(B)/2 for a tail preimage Bₙ. The density tends to 1/log 2 at zero. Since log 2<7/10, 2(log 2)²<98/100<1, so the printed upper bound is smaller than the supremum and fails on an interval of positive measure. The corrected comparison still proves exactness. Known: new.
- **ProbabilisticAndMetricNumberTheory/E21** (Smyth2020, misprint, affects nothing): Proposition 15 proof, physical p.34 / printed Lesson 7 p.31. Use pₖ=aₖp_(k−1)+p_(k−2), and the corresponding q recurrence. The native matrix recurrence and the proposition’s preceding recurrence are correct; the induction line swaps the coefficients. For [0;1,2], p₂=2·p₁+p₀=2. Known: new.
- **ProbabilisticAndMetricNumberTheory/E22** (Smyth2020, error, affects a stated result): Theorem 17, physical p.35 / printed Lesson 7 p.32, acquired final author notes. Require that A is invariant as a set (or invariant modulo null sets); equality of measure under preimages alone is automatic for every measurable A. The Gauss measure is invariant. The interval A=(1/2,1) has ν(A)=log(4/3)/log 2 strictly between zero and one, while ν(T^(−n)A)=ν(A) for every n. The theorem as printed confuses invariance of a set with preservation of its mass. Known: new.
- **ProbabilisticAndMetricNumberTheory/E23** (Smyth2020, misprint, affects a stated result): Lesson 9 second bullet, physical p.46 / printed p.43, approximation-error logarithm. The limit of N⁻¹ log|x−p_N/q_N| is −π²/(6 log 2). Approximation errors eventually lie between zero and one, so their logarithms are negative. Theorem 30 later prints the negative exponent. Known: Theorem 30, physical p.53 / printed Lesson 10 p.50, in the same acquired final notes.
- **ProbabilisticAndMetricNumberTheory/E24** (Smyth2020, error, affects a stated result): Theorem 21, physical p.46 / printed Lesson 9 p.43, Khinchin product. Use 1+1/(k(k+2)) inside the product defining K. The preceding first-digit formula gives mass log((k+1)²/(k(k+2)))/log 2. Exponentiating the log-digit integral gives precisely the corrected factor. Every k≥2 term in the printed product is strictly larger, so it cannot give the claimed Khinchin constant. Known: new.
- **ProbabilisticAndMetricNumberTheory/E25** (Smyth2020, misprint, affects the proof): Exercise 2.4(c), physical p.49 / printed Lesson 9 p.46. The integral of log x is negative; use f(x)=−log x for the positive value π²/(12 log 2). log x<0 throughout (0,1). Integrating against the positive Gauss density gives a strictly negative integral, whereas denominator growth uses its negative. Known: new.
- **ProbabilisticAndMetricNumberTheory/E26** (Smyth2020, error, affects the proof): Exercise 2.4(d),(f), physical p.49 / printed Lesson 9 p.46. Restrict the Fibonacci denominator bounds to irrational inputs, or indices before native rational termination. At x=1/2 the native continued fraction terminates; subsequent native denominators stay 2 while Fibonacci numbers grow without bound. The metric conclusions already discard this null rational set. Known: new.
- **ProbabilisticAndMetricNumberTheory/E27** (Smyth2020, misprint, affects a stated result): Conjecture 24, physical p.48 / printed Lesson 9 p.45. Use Q(Zⁿ) for the Oppenheim lattice-value density statement. The preceding bullet correctly says integer vectors. For real vectors any indefinite real quadratic form already takes every real value by homogeneity, independent of irrationality. Known: Correct integer-vector formulation in the preceding bullet on the same page.
- **ProbabilisticAndMetricNumberTheory/E28** (Smyth2020, misprint, affects a stated result): Theorem 20 final line, physical p.45 / printed Lesson 9 p.42. Use x∈X\N_f in the general probability-space theorem. The theorem’s domain is an arbitrary measurable X. The preceding limit-existence conclusion uses X correctly; [0,1) was retained from the special-case theorem above. Known: new.
- **ProbabilisticAndMetricNumberTheory/E29** (BeresnevichVelani, misprint, affects the proof): Published p.988, Lemma 7 proof, middle triangle inequality. Use ≤ at the last triangle bound and < at c r_M<d(x_M,z), since z lies outside the closed ball cM. Closed balls permit equality in the triangle bound. On the line take A=closedBall(0,1), M=closedBall(3/2,1/2), c=3 and z=−1. Then A meets M at 1 and z∉cM, but d(x_M,x_A)+d(x_A,z)=5/2=2r_A+r_M. The corrected inequalities retain the lemma. Known: new.
- **ProbabilisticAndMetricNumberTheory/E30** (BeresnevichVelani, misprint, affects nothing): Published §§6.1–6.2, pp.991–992, theorem numbering. Disambiguate the general-space MTP on p.991 from the distinct simultaneous-approximation consequence numbered Theorem 3 on p.992. The two displayed theorems have different hypotheses and conclusions but the same number. Our citations always include section and page. Known: new.
- **ProbabilisticAndMetricNumberTheory/E31** (MatomakiRadziwill, misprint, affects nothing): Published p.1021, prose following Theorem 4; also arXiv v4 physical p.7. Read “while Theorem 2” in the weaker C(ε) comparison. The paragraph explicitly compares Theorem 4 with Theorem 2, gives the stronger bound from Theorem 4, and then accidentally attributes the weaker bound to Theorem 4 again. Known: new.
- **ProbabilisticAndMetricNumberTheory/E32** (TaoLogChowla, misprint, affects nothing): Published Theorem 2, p.3; also arXiv v4 Theorem 1.2 physical p.2. Use x→∞. n is the bound summation variable; x is the free cutoff and ω depends on x. The hypothesis and the next displayed specialization both use x→∞. Known: new.
- **ProbabilisticAndMetricNumberTheory/E33** (Smyth2020, error, affects a stated result): Lesson 1 boxed digit/orbit equivalence, physical p.7 / printed p.4. Use half-open fundamental intervals for the canonical terminating expansion, or remove the countable endpoints. Earlier I₀ is the closed interval [0,1/3]. For x=1/9 and n=1, T₃x=1/3 belongs to I₀ while the second canonical digit is 1. The all-point equivalence fails at endpoints; the almost-everywhere consequence remains valid. Known: new.
- **ProbabilisticAndMetricNumberTheory/E34** (Smyth2020, misprint, affects the proof): Lesson 5 mixing interpretation, physical p.29 / printed p.26, two consecutive bounds. Use εν(A) for the bound before dividing by ν(A), with ν(A)>0. Dividing the printed bound by ν(A) gives ε ν(B)/ν(A), which need not be ≤ε. Choosing a smaller tolerance proves the intended conditional-probability statement. Known: new.
- **ProbabilisticAndMetricNumberTheory/E35** (MatomakiRadziwill, misprint, affects nothing): Published p.1017, displayed (1). Use X→∞. The average in that display uses the free cutoff X and has no free x. The surrounding text already discusses large X. Known: new.
- **ProbabilisticAndMetricNumberTheory/E36** (Sarnak, misprint, affects nothing): Lecture 1, physical p.3, realization in the full shift. Use ξ(n)=π₁(T^(n−1)ξ) for n≥1, or choose the sampling convention T^(n−1). The source indexes ξ from one and defines Tx(n)=x(n+1). At n=1, π₁(Tξ)=ξ(2), not ξ(1). The conjecture is unaffected by a fixed index shift. Known: new.
- **ProbabilisticAndMetricNumberTheory/E37** (Kubilius2021, error, affects a stated result): arXiv v1, Remark1.2, physical p.4. Require 0<s<1 for the claim of a positive asymptotic distance from uniform; s=0 is exactly uniform. At s=0, Z_(n,0)=n and the truncated Pareto mass is1/n at every point, so total variation distance is identically zero. The main approximation theorem is not altered by correcting the example. Known: new.

### Current verification boundary

The packet and suggested file are plans. The current compilation covers only the Mathlib-only continuation. The preserved incoming prefix imports pinned Tau Ceti modules whose compiled interfaces are absent in the existing build, so the whole file was not elaborated. No library build, Lake update or cache download was started. Precise omitted-signature comments name unresolved native finite-tree, product-law and analytic interfaces. The handoff records the final checker and compilation receipts; earlier numerical/proof-probe counts above remain historical.

Current validation: the pinned-index checker and source-issue/version validator report zero errors; the packet checker has zero warnings. The 708-line Mathlib-only continuation has 104 named signatures and 50 examples and elaborates with 140 expected proof-placeholder warnings only. All 2,944 reached Mathlib sources match the pin. The 139 exact rational cases check finite arithmetic and source corrections; they do not establish the limit theorems. Whole-file elaboration remains unavailable as explained above.
