# Probabilistic, metric and ergodic number theory

## Scope and mathematical boundary

This roadmap concerns distributions over finite sets of integers, uniform distribution,
metric approximation and almost-everywhere dynamical statements. The probability space,
normalization and quantifiers belong to each theorem. A heuristic model is not an arithmetic
joint law, a dense orbit is not an equidistributed orbit, and mean convergence is not a
pointwise ergodic theorem.

The companion packet is **partial**. Its 76 nodes give a finite weighted prime-truncation
API, quantitative first/second-moment comparisons and finite Boolean divisibility-pattern
laws, centered mixed products and higher moments with explicit errors, and finite
unweighted even/odd Gaussian moment comparisons, and deterministic prime-cutoff removal
with finite moment transfer to omega, full residue-class joint laws and sharp finite
comparison bounds, and the repeated-prime-factor first-moment, tail and finite
distribution comparison, arithmetic law dictionary and conditional weak-limit transfer,
and a uniform exponential bound yielding every fixed repeated-factor moment.
None is labelled implemented. These
results address bounded parts of PM.0 and PM.1; they neither close either stage nor prove Turan–Kubilius,
Hardy–Ramanujan or Erdos–Kac. The full six-stage coverage ledger is in the JSON.

Suggested home: `TauCeti/NumberTheory/ArithmeticProbability/FiniteDivisibility.lean`.
The PM.1 comparison lemmas can follow in `FiniteGaussianMoments.lean`, and the
cutoff-removal interface in `PrimeTruncation.lean`. The full residue laws belong in
`ResidueLaws.lean` and reuse the implemented interval counts and CRT equivalence.
The repeated-factor comparison uses `RepeatedPrimeFactors.lean`; its fixed higher moments
and exponential bounds use `ExcessMoments.lean`.
Suggested namespace: `TauCeti.Probability.Arithmetic`.

## Existing library, not duplicate carriers

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The packet lists 116 declarations whose
statements were read at these commits. Generic finite coprime-product and subset-expansion
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

## Remaining roadmap work and ownership

PM.0 still needs general additive/strongly additive interfaces, general prime-power
representation, stronger growing-prime comparison
beyond the finite full-residue laws, and the converse criterion using counting limits
at CDF continuity points. The finite counting/CDF/characteristic-function identities,
arithmetic Levy criterion and conditional omega-to-Omega weak-limit equivalence are
now decomposed, as are all fixed repeated-factor moments from Exercise 46(ii).
Use the existing empirical, moment and characteristic-function carriers.

PM.1 still needs decomposition of the read Granville–Soundararajan Erdos–Kac proof,
including the precise Gaussian moment range, Mertens normalization and source-specific
asymptotic estimates for the now-explicit cutoff and moment-transfer bounds.
The full Turan–Kubilius and Hardy–Ramanujan proof sources remain to be acquired.
The generic iid CLT is not a theorem
about these arithmetic indicators. PM.2 needs Weyl/discrepancy/digit proofs and a precise
ES.0 differencing input. PM.3 needs full metric approximation proofs with their measure,
monotonicity and coprimality restrictions. Existing Borel–Cantelli and Gallagher results
are suppliers, not new targets.

PM.4 needs primary Gauss-map and continued-fraction sources, pointwise ergodic input and
integrability. GN.4 remains the homogeneous-dynamics supplier; the audited mean ergodic
and L1 convergence results do not supply pointwise digit statistics. PM.5 must reconcile
short-interval and correlation ownership with AN.3, AN.5 and AC.5, keep exact averaging
and exceptional-set hypotheses, and keep general Chowla/Sarnak claims conjectural.
No uninspected supplier has been inserted as a supposedly resolved theorem dependency.

## Verification and suggested code

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

## Current checkpoint verification

The current inventory is 76 unchecked nodes: one construction, 55 lemmas, one
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

Sequences are indexed by ℕ and averaged over 0, …, n, as `empiricalMeasure` does, whereas the source averages over 1, …, N. Equidistribution ignores any finite shift, and the API proves that (`asympEquidistributed_comp_add_iff`). The source's ℤ-indexed statements are left for a later pass.

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

### Remaining in PM.2

- Asymptotic equidistribution, total equidistribution, the Haar probability measures on T and T^d, irrational points, the Weyl criterion and its projection form, the linear equidistribution theorem, van der Corput's difference theorem, Weyl's polynomial theorem and uniform distribution mod 1 are decomposed (ℕ-indexed), from Tao, Higher order Fourier analysis §1.1.1. Van der Corput's inequality is ES.0/q-vdc-lag-bound at r = 1 and is not replanned.
- Still to decompose from the same section: the ℤ-indexed versions ((iii) of Exercises 1.1.5 and 1.1.6); total equidistribution by rational twists (Exercise 1.1.4); Exercise 1.1.6, the full polynomial criterion that no nonzero k kills α_1, …, α_s; and the abelian Ratner decompositions (Proposition 1.1.5, Exercise 1.1.7).
- Discrepancy (Erdős–Turán, Koksma) and the normal-number consequences (Borel's theorem, linking Mathlib's digit expansions and Tau Ceti's Bernoulli-shift ergodicity) still need a source read and nodes; the audit records both as absent.
- Single-scale (quantitative) equidistribution, §1.1.2 of the same source, is not planned; ES and AC consumers should say whether they need it.
