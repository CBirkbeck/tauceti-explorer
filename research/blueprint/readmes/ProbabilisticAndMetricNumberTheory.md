# Probabilistic, metric and ergodic number theory

## Scope and mathematical boundary

This roadmap concerns distributions over finite sets of integers, uniform distribution,
metric approximation and almost-everywhere dynamical statements. The probability space,
normalization and quantifiers belong to each theorem. A heuristic model is not an arithmetic
joint law, a dense orbit is not an equidistributed orbit, and mean convergence is not a
pointwise ergodic theorem.

The companion packet is **partial**. Its 22 nodes give a finite weighted prime-truncation
API, quantitative first/second-moment comparisons and finite Boolean divisibility-pattern
laws with explicit errors. None is labelled implemented. These
results address a bounded part of PM.0; they neither close PM.0 nor prove Turan–Kubilius,
Hardy–Ramanujan or Erdos–Kac. The full six-stage coverage ledger is in the JSON.

Suggested home: `TauCeti/NumberTheory/ArithmeticProbability/FiniteDivisibility.lean`.
Suggested namespace: `TauCeti.Probability.Arithmetic`.

## Existing library, not duplicate carriers

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The packet lists 25 declarations whose
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
unread proof obligations remain explicit; an empty source-issue list applies only to
the listed inspected sections, not to all those publications.

## Remaining roadmap work and ownership

PM.0 still needs general additive/strongly additive interfaces, the Omega branch, an
all-residue-class model and stronger growing-prime comparison, higher-moment bookkeeping,
and the counting/CDF/characteristic-function/weak-convergence dictionary. Use the existing
empirical, moment and characteristic-function carriers for these tasks.

PM.1 still needs source-scoped Turan–Kubilius, Hardy–Ramanujan and Erdos–Kac proofs,
Mertens normalization and large-prime control. The generic iid CLT is not a theorem
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
API declarations, five construction tests, ten finite-pattern examples and all comparison
statements are represented. All 22 declaration signatures and 15 example contracts
elaborate at the pinned sources with 37 expected placeholder warnings and no others.
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
