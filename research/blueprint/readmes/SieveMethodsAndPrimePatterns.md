# Sieve methods, prime gaps and prime patterns

## Purpose and scope

A sieve estimates a nonnegative weighted population after excluding specified local divisibility conditions. Its finite algebra must be separated from the analytic assertion that a remainder is small. This roadmap develops that algebra on the existing Mathlib sieve carrier, then uses it as the foundation for dimension estimates, combinatorial and quadratic weights, large-sieve inequalities, distribution of primes and prime-pattern applications.

The declaration-sized specification here concerns eight finite results in SV.0. SV.0 remains partial: arbitrary excluded residue classes, dimension hypotheses and family-level remainder distribution are substantial additional targets. SV.1 has source reading and baseline identifications but no new declaration-sized decomposition here. SV.2–SV.5 remain source-decomposition work, with their ownership and outstanding inputs listed below. These coverage boundaries are not claims that any theorem is implemented.

Use the existing BoundingSieve and SelbergSieve types. Do not construct a competing record of sieve data, redefine the Möbius function, or package a single coefficient inequality into a new predicate. Generic multiplicative functions, Dirichlet convolution, finite sums, prime factorization and Selberg quadratic-form diagonalization are library inputs.

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The mathematical statements of the cited declarations, not just their names, determine the interfaces.

## Conventions and the existing carrier

For a BoundingSieve write \(A\) for its finite support, \(P\) for its squarefree natural prime product, \(w:\mathbb N\to\mathbb R\) for its weights, \(X\) for its real approximate mass, and \(\nu\) for its real-valued arithmetic function.

The carrier requires \(w(n)\geq0\) for every natural \(n\). It does not require the weight function to vanish outside \(A\); the finite support determines the sum. Squarefreeness gives \(P\ne0\). The case \(P=1\) is allowed and means there are no sieving primes. The finite sample may contain zero. That sample point survives exactly when \(P=1\), because \(\gcd(P,0)=P\).

The density function is multiplicative on coprime arguments and satisfies \(0<\nu(p)<1\) for primes dividing \(P\). In particular \(\nu(1)=1\). Complete multiplicativity is not required. No positivity assumption on \(X\) is part of the carrier, and no identity between \(X\) and the actual total weight is available without an additional hypothesis.

All divisor sums are over positive natural divisors. The following is notation for existing declarations, not a list of new definitions:

- \(A_d=\sum_{n\in A,\ d\mid n}w(n)\), the existing multSum.
- \(R_d=A_d-\nu(d)X\), the existing signed rem.
- \(S=\sum_{n\in A,\ \gcd(P,n)=1}w(n)\), the existing siftedSum.
- \(M(c)=\sum_{d\mid P}c(d)\nu(d)\), the existing mainSum.
- \(E(c)=\sum_{d\mid P}|c(d)|\,|R_d|\), the existing errSum.
- \(W=\prod_{p\mid P,\ p\ {\rm prime}}(1-\nu(p))\), an abbreviation for a finite product, not a new object.

Thus \(A_1\) is the actual total weight and \(R_1=A_1-X\). This term is part of every unrestricted remainder sum. Absolute values in \(E(c)\) are taken before summing: opposite signs in the coefficients cannot cancel this error bound.

A SelbergSieve additionally has a real level at least one. This parameter supports coefficient truncation. It is not a theorem about the average size of \(R_d\), and is not by itself a level of distribution.

Heath-Brown forms a prime product over \(p<z\), whereas Kedlaya Chapter 11 uses \(p\leq z\). The abstract finite product \(P\) avoids silently identifying these conventions. Every concrete specialization must identify its exact set of sieving primes.

## SV.0: finite weighted identities

### Weighted divisor interchange

The lemma BoundingSieve.sum_multSum_eq_sum_gcd_divisors, node SV.0/weighted-divisor-interchange, states for every real coefficient function \(c\):
\[
 \sum_{d\mid P}c(d)A_d
 =
 \sum_{n\in A}w(n)\sum_{d\mid\gcd(P,n)}c(d).
\]

There is no sign condition on \(c\). Expand \(A_d\), interchange the two finite sums, and observe that a divisor of \(P\) contributes precisely when it also divides \(n\). The existing Nat.divisors_filter_dvd_of_dvd identifies the resulting divisor set, with BoundingSieve.prodPrimes_ne_zero supplying its nonzero hypothesis. This is the reusable finite interchange behind Heath-Brown's equation (1.7).

For \(P=1\), both sides are \(c(1)\sum_{n\in A}w(n)\), including a possible weight at zero. For \(P=6\), the four coefficients at \(1,2,3,6\) remain distinct; divisibility by both primes is not counted as two unrelated sample points.

### Exact Legendre identity

The theorem BoundingSieve.siftedSum_eq_moebius_multSum, node SV.0/legendre-identity, states
\[
 S=\sum_{d\mid P}\mu(d)A_d.
\]
Here \(\mu\) is the existing integer Möbius function cast to the reals.

Apply the interchange with \(c=\mu\). The existing convolution identity ArithmeticFunction.coe_moebius_mul_coe_zeta, evaluated using coe_mul_zeta_apply and one_apply, gives
\[
 \sum_{d\mid r}\mu(d)=
 \begin{cases}1&r=1,\\0&r\ne1.\end{cases}
\]
Use \(r=\gcd(P,n)\) and the existing indicator presentation of the sifted sum. This specializes existing inversion to the sieve carrier rather than adding a second general Möbius inversion theorem.

For unit weights on \(1,\ldots,10\) and \(P=6\), the formula reads \(10-5-3+1=3\); the surviving integers are \(1,5,7\). The unit survives and must not be mistaken for a prime. For unit weights on \(\{0,1,2,3,6\}\), the count is \(5-3-3+2=1\). Zero contributes to all four divisibility sums but cancels from the sifted output.

Heath-Brown (1.1) supplies the unweighted formula; Kedlaya Lemma 11.2 supplies the weighted inclusion-exclusion interpretation. Nonnegative weights are inherited from the common carrier, although this particular identity does not use their sign.

### Euler product and signed remainder

The lemma BoundingSieve.siftedSum_eq_eulerProduct_add_rem, node SV.0/legendre-main-remainder, states
\[
 S=XW+\sum_{d\mid P}\mu(d)R_d.
\]

Substitute the existing identity \(A_d=\nu(d)X+R_d\) into the Legendre sum. ArithmeticFunction.IsMultiplicative.prodPrimeFactors_one_sub_of_squarefree turns \(\sum_{d\mid P}\mu(d)\nu(d)\) into \(W\), using squarefreeness of \(P\) and multiplicativity of \(\nu\). Everything else is finite distributivity.

Keep the remainder signed. It records exact cancellation, whereas the next estimate discards cancellation to obtain a uniform bound. For \(P=6\) the signed remainder is \(R_1-R_2-R_3+R_6\). For \(P=1\), the equation reduces to \(A_1=X+R_1\). No inference about the sign of \(X\) is needed.

### Absolute Legendre error

The theorem BoundingSieve.abs_siftedSum_sub_eulerProduct_le, node SV.0/legendre-error, states
\[
 |S-XW|\leq\sum_{d\mid P}|R_d|.
\]

Apply the finite triangle inequality to the signed remainder identity. Every divisor of squarefree \(P\) is squarefree by the existing sieve lemma. The existing Möbius absolute-value formula therefore gives \(|\mu(d)|=1\) at each summation index.

Heath-Brown Corollary 1.1 is the source statement. Its extension to the pinned weighted carrier changes no analytic argument: the proof is finite. If \(P=1\), \(A_1=10\) and \(X=7\), the error is exactly three. A formula summing only over \(d>1\) would give zero and is false for this valid carrier.

The Legendre identity and the absolute error theorem are two atlas planets. The intervening Euler-product manipulation and divisor interchange remain ordinary supporting declarations.

## SV.0: lower bounds and coefficient support

### Relative lower coefficient condition

For a real function \(c\), assume explicitly
\[
 \sum_{d\mid r}c(d)\leq {\bf1}_{r=1}
 \qquad\text{for every }r\mid P.
\]
This is a hypothesis on finitely many divisor sums. Do not introduce a new one-line property wrapper or impose a global condition at all naturals when this relative condition suffices.

The lemma BoundingSieve.sum_multSum_le_siftedSum_of_divisor_lower, node SV.0/lower-sieve-sum, concludes
\[
 \sum_{d\mid P}c(d)A_d\leq S.
\]

For each sample \(n\), its gcd with \(P\) divides \(P\), so the hypothesis applies. Multiply by \(w(n)\geq0\), sum and invoke the divisor interchange. This is the lower version of the source's weighted upper-bound argument following condition (1.5). Nonnegativity of the sample weights matters here; the coefficients themselves may have either sign.

Taking \(c=\mu\) on the divisors yields equality. Taking \(P=1\) reduces the hypothesis to \(c(1)\leq1\). These tests distinguish the relative condition from an unnecessarily stronger global condition.

### Lower main term minus error

The theorem BoundingSieve.mainSum_sub_errSum_le_siftedSum, node SV.0/lower-sieve-main-error, concludes from the same hypothesis that
\[
 XM(c)-E(c)\leq S.
\]

Expand the divisibility sums in the preceding inequality. For every divisor, \(c(d)R_d\geq-|c(d)|\,|R_d|\). Summing gives the stated lower estimate. The argument never multiplies an inequality by \(X\); arbitrary real \(X\) remains permitted.

The zero coefficient function gives \(0\leq S\). The Möbius coefficients give the lower half of the Legendre absolute-error theorem. Together with Mathlib's existing upper-coefficient theorems, this provides the elementary two-sided framework without reconstructing those upper results.

### Explicit dependence on the cutoff

The lemma BoundingSieve.errSum_le_truncated_remSum, node SV.0/truncated-coefficient-error, takes a natural cutoff \(D\), a nonnegative real \(C\), and explicit assumptions
\[
 d\mid P,\ d>D\ \Longrightarrow\ c(d)=0,\qquad
 d\mid P,\ d\leq D\ \Longrightarrow\ |c(d)|\leq C.
\]
It concludes
\[
 E(c)\leq C\sum_{\substack{d\mid P\\d\leq D}}|R_d|.
\]

Split the finite divisor sum at \(D\), discard the zero terms and use the coefficient bound on the remainder. The endpoint \(d=D\) is included. There is no hidden growth estimate for the right side and no assertion that increasing the cutoff improves the error.

At \(D=0\), no positive divisor remains, so all contributing coefficients vanish. At \(D=1\), a coefficient supported at one retains the error \(|R_1|\). If \(P=6\), \(c(2)=1\), \(c(3)=-1\), other divisor coefficients vanish and \(R_2=R_3=1\), then \(E(c)=2\), although the signed sum of these two remainder contributions is zero. These tests distinguish both the absolute-value convention and the endpoints.

### First Bonferroni lower bound

The theorem BoundingSieve.multSum_one_sub_prime_multSum_le_siftedSum, node SV.0/first-order-lower-sieve, states
\[
 A_1-\sum_{p\mid P,\ p\ {\rm prime}}A_p\leq S.
\]

For each sample count the sieving primes dividing it. If its gcd with \(P\) is not one, Nat.ne_one_iff_exists_prime_dvd supplies a prime divisor of that gcd, and Nat.mem_primeFactors_of_ne_zero places it among the sieving primes. Hence the count is at least one. The pointwise inequality is \(1-k\leq{\bf1}_{\gcd(P,n)=1}\). Multiply by the weight, sum, and interchange the finite sums.

This is the first lower truncation of the pointwise inclusion-exclusion argument in Kedlaya Lemma 11.1. For \(P=1\) it is equality. For a single sample at six, \(P=6\), and weight one, the left side is \(-1\) while \(S=0\). The elementary lower bound may therefore be negative. It supplies no positive lower bound for primes and does not overcome the parity limitation. It is the third SV.0 planet.

## Acceptance examples and library boundaries

The suggested file carries eight named theorem signatures and ten theorem examples:

1. Empty support has sifted sum zero.
2. With \(P=1\), all support weight survives, including weight at zero.
3. Sieving the first ten positive integers by two and three leaves total weight three.
4. The sample \(\{0,1,2,3,6\}\) sifted by two and three has total weight one.
5. For \(P=6\), inclusion-exclusion has coefficients \(+1,-1,-1,+1\).
6. Approximate mass seven and actual mass ten give \(R_1=3\).
7. The first lower bound on the singleton sample six can be negative.
8. Coefficients vanishing on every divisor have error zero.
9. A coefficient supported at one retains the normalization remainder.
10. Opposite real coefficient signs do not cancel the absolute error.

No new definition or construction is introduced, so there is no new construction API or construction unit-test list. These examples test theorems on the existing data model. Every packet node retains implementation status unchecked.

The existing BoundingSieve.IsUpperMoebius, its weighted upper inequality, and its main-term-plus-error inequality are baseline results. So are lambdaSquared, its upper-coefficient property, and mainSum_lambdaSquared_eq_sum_mul_sum_sq. The roadmap adds missing Selberg optimization and applications beyond these declarations, not repeated diagonalization under new names.

## Remaining source decomposition and ownership

### SV.0: general local conditions and analytic remainder estimates

Kedlaya's local data select arbitrary excluded residue classes at each prime. The pinned carrier instead sums natural sample values satisfying divisibility. A polynomial-value realization must construct a weighted pushforward, prove its divisibility equivalence and preserve repeated values. An ordinary finite image set can lose half the samples even in a quadratic example. Density zero also needs explicit treatment: the carrier requires strictly positive density on its sieving primes. Neither general conversion is asserted here.

Sieve dimension requires its actual logarithmic inequality, constants, quantifiers and range. A family-level remainder estimate requires an actual family of samples and a bound uniform in the intended parameters. Both remain targets. The finite cutoff lemma is the interface consuming such an estimate, not its proof.

The remaining Chapter 11 route includes Rankin's estimate, the weighted divisor-count estimate, its tail estimate, the quantitative Eratosthenes theorem and a justified Brun application. Their exercises and analytic estimates require decomposition. Any summation or asymptotic input belonging to AnalyticNumberTheory:AN.0 must be requested at its exact statement once the consuming nodes are specified. None of the eight finite nodes needs an unresolved analytic supplier.

### SV.1: Brun and Selberg

Use the existing quadratic coefficient construction and diagonalized main form. The remaining targets are the optimizer and its hypotheses, Brun combinatorial weights, fundamental-lemma estimates in proved ranges, applications, and explicit parity limitations. Read Kedlaya Chapters 12–14 and the continuation of Heath-Brown's Section 2 before specifying these missing declarations. Reading through Lemma 2.1's statement does not supply its proof.

### SV.2: large sieves and bilinear decompositions

SV.2 owns additive and multiplicative large-sieve inequalities, duality, primitive-character reduction, Vaughan identities and Type I/II decompositions. Accepted RS-07 puts the Vaughan/bilinear direction from SV.2 into AnalyticNumberTheory:AN.3; the old reverse prerequisite must not be reintroduced.

The routed Bennett–Siksek item PAPER-BENNETT-SIKSEK-20/45 requires the finite Gram-row inequality
\[
 \sum_i|\langle x,y_i\rangle|^2
 \leq \|x\|^2\max_i\sum_j|\langle y_i,y_j\rangle|
\]
for a nonempty finite family in a real or complex inner-product space. Its extracted statement is a lead, not a substitute for reading Theorem 7 and its proof at p.379. The quadratic-symbol bilinear estimate required by ArithmeticStatistics:ST.5 and the polynomial Farey estimate required by FiniteFieldsAndCharacterSums:FF.1 are distinct consumer needs. The finite SV.0 declarations do not discharge them.

### SV.3: average distribution of primes

State Bombieri–Vinogradov with the complete order of quantifiers: every requested logarithmic saving \(A>0\), a corresponding \(B\), sufficiently large \(x\), and \(Q\leq\sqrt{x}/(\log x)^B\). Keep the sum over moduli, its weight and the maximum over reduced residue classes. The selected proof route imports its actual small-modulus or zero-density input from AN.3. A stronger distribution estimate is a hypothesis when it is not proved.

### SV.4: bounded gaps and clusters

The source is Maynard's original argument, not an incomplete course outline. Specify admissible tuples, multidimensional weights, the asymptotic quadratic forms, the positivity argument and the analytic error inputs. The output is a source-supported finite bound on repeated prime gaps. The twin-prime and general prime-tuple conjectures are not interchangeable with that theorem; their ownership here does not make them proved inputs.

### SV.5: almost primes and advanced sieves

Beta and weighted sieves, Chen-type arguments and affine sieves are separate developments. Each has its own bilinear or parity-breaking conditions, or orbit and expansion hypotheses. State the number of prime factors and count multiplicities explicitly. Existing almost-prime notions are imported; local obstructions and exceptional cases remain visible. Original proof sources for each route must be selected and read.

## Sources and precision of the reading

The finite weighted statements use [Heath-Brown, Lectures on sieves, arXiv v1](https://arxiv.org/pdf/math/0209360v1), especially (1.1), (1.3), Corollary 1.1 and (1.5)–(1.8), and [Kedlaya, Chapter 11](https://kskedlaya.org/ant/chap-eratosthenes.html), especially its inclusion-exclusion arguments. The packet records exact hashes and access dates. Heath-Brown pp.1–8 were read through the statement of Lemma 2.1; Kedlaya Chapter 11 was read completely. The historical dated Kedlaya edition and Heath-Brown's Bonner proceedings text have not been identified with the acquired files.

The source-issue entries are version-specific. In the Heath-Brown preprint, the introductory Goldbach range must begin at four; the prime-counting example needs the surviving unit and the strict cutoff; the Goldbach image example loses parameter multiplicities and also needs the cutoff on both prime factors; the primitive sum-of-two-squares example needs to exclude multiples of four; and the Mertens asymptotic needs the sieve cutoff to tend to infinity. None of these findings is asserted against the unacquired published proceedings text.

For Kedlaya's displayed Brun proof, the packet records the unverified linear cutoff needed by the invoked theorem, and the need for a precise leading coefficient rather than an unspecified logarithmic big-O bound in its dimension calculation. These are proof-interface findings, not assertions that Brun's upper bound is false. The analytic application remains a source-decomposition gap. The finite identities and bounds above do not depend on either unresolved inference.

