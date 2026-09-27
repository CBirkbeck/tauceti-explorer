# Probabilistic, metric and ergodic number theory

## Scope and mathematical boundary

This roadmap concerns distributions over finite sets of integers, uniform distribution,
metric approximation and almost-everywhere dynamical statements. The probability space,
normalization and quantifiers belong to each theorem. A heuristic model is not an arithmetic
joint law, a dense orbit is not an equidistributed orbit, and mean convergence is not a
pointwise ergodic theorem.

The companion packet is **partial**. Its 27 nodes give a finite weighted prime-truncation
API, quantitative first/second-moment comparisons and finite Boolean divisibility-pattern
laws, centered mixed products and higher moments with explicit errors. None is labelled implemented. These
results address a bounded part of PM.0; they neither close PM.0 nor prove Turan–Kubilius,
Hardy–Ramanujan or Erdos–Kac. The full six-stage coverage ledger is in the JSON.

Suggested home: `TauCeti/NumberTheory/ArithmeticProbability/FiniteDivisibility.lean`.
Suggested namespace: `TauCeti.Probability.Arithmetic`.

## Existing library, not duplicate carriers

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The packet lists 33 declarations whose
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
empirical mean. They neither give a Gaussian approximation to M_k nor control
the discarded large primes. PM.1 must still supply Gaussian pairing and
collision estimates, the smaller-support contribution with correct composition
counts, parity bounds, uniform moment ranges, Mertens normalization,
large-prime removal and a valid moment-convergence argument. A generic iid
central limit theorem cannot be applied directly to the arithmetic indicators.

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
above are explicit auxiliary refinements, not claims that the source states
these constants. Reading the full paper does not mean its entire argument is
decomposed: the general sieve multiset framework and the Gaussian-moment
estimates remain explicit PM.1 work.

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

## Remaining roadmap work and ownership

PM.0 still needs general additive/strongly additive interfaces, the Omega branch, an
all-residue-class model and stronger growing-prime comparison,
and the counting/CDF/characteristic-function/weak-convergence dictionary. Use the existing
empirical, moment and characteristic-function carriers for these tasks.

PM.1 still needs decomposition of the read Granville–Soundararajan Erdos–Kac proof,
including the precise Gaussian moment range, Mertens normalization and large-prime control.
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
examples and all comparison statements are represented. All 27 declaration signatures and
25 example contracts elaborate at the pinned sources with 52 expected placeholder warnings
and no others.
The construction body is a planning placeholder too. Every node remains unchecked;
signature elaboration is not proof verification.

The official repository checker with the full pinned declaration index reports zero
errors and zero warnings. Exact-rational computations reran the inherited 1,000 divisor,
25,000 joint-divisibility, 1,000 prime-pair and 2,680 weighted-moment cases, including
181 complete-period moment cases. They additionally checked 9,720 disjoint prime-pattern
cases (690 complete-period cases) and 1,920 summed-atom bounds for N=1,...,120 and
subsets of {2,3,5,7}. These computations are regression evidence, not proofs of the
universal statements. Separate proved Lean probes are recorded in the handoff; no
scratch scripts or source downloads are part of the deliverables.

The centered-moment checks add 22,500 exact mixed-product cases (508 complete-period
cases), 625 tuple-model versus independently enumerated Boolean-model comparisons,
and 11,250 weighted moment cases (850 complete-period cases). A separate Lean probe
proves seven general auxiliary lemmas and seven examples with no placeholders or
warnings. These are diagnostics, not a formal implementation of the 27-node packet.
