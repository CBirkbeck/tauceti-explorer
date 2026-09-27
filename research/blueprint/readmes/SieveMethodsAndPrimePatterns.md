# Sieve methods, prime gaps and prime patterns

## Purpose and scope

A sieve estimates a nonnegative weighted population after excluding specified local divisibility conditions. Its finite algebra must be separated from the analytic assertion that a remainder is small. This roadmap develops that algebra on the existing Mathlib sieve carrier, then uses it as the foundation for dimension estimates, combinatorial and quadratic weights, large-sieve inequalities, distribution of primes and prime-pattern applications.

The specification contains twenty finite SV.0 declarations and forty-nine SV.2 declarations: weighted sieve and residue interfaces; Selberg and Bombieri–Selberg inequalities; tapered Fourier vectors, circular packing and the H+2/δ additive large sieve; the H+2Q² primitive-character large sieve; and the finite Vaughan/incomplete-log Type I–II decomposition. Empty inputs, cutoff equality, zero coefficients and the small-number boundary are explicit. SV.0–SV.3 remain partial; SV.4–SV.5 remain not read. Sharp constants, analytic bilinear and distribution estimates, and the recorded application gaps are not supplied by these finite identities. Every declaration is a specification, not an implementation claim.

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

A SelbergSieve additionally has a real level at least one. No native definition or theorem uses this level to impose a support cutoff. A coefficient-support hypothesis must be stated separately. The parameter gives no theorem about the average size of \(R_d\), and is not by itself a level of distribution.

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

The basic finite-sieve part of the suggested file carries eight named result signatures and ten examples:

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

The ten basic finite examples test the eight initial results. The indexed-family and residue-class development below adds two constructions into the same existing carrier, with fourteen API items and nine discriminating construction tests, plus two further theorem examples. SV.0 has twenty main declarations, fourteen API signatures and twenty-one examples. The separate SV.2 Gram development adds seven declarations and twelve examples; the taper continuation adds twelve declarations, three API items (two promoted), five construction tests and thirteen further examples. Every packet node retains implementation status unchecked.

The existing BoundingSieve.IsUpperMoebius, its weighted upper inequality, and its main-term-plus-error inequality are baseline results. So are lambdaSquared, its upper-coefficient property, and mainSum_lambdaSquared_eq_sum_mul_sum_sq. The roadmap adds missing Selberg optimization and applications beyond these declarations, not repeated diagonalization under new names.

## General residue conditions without losing multiplicities

The two constructors below return the existing BoundingSieve. They do not define a second sieve type or a second multiplicative-extension operation.

For a finite index set A, allow an integer sample map x with repeated values and real weights w nonnegative on A. At each prime p in a finite set Q, let Ωp be an arbitrary finite subset of ZMod p. Write ρ(p)=card(Ωp)/p and Q+={p∈Q : Ωp is nonempty}. When every Ωp is proper, use the prime product P=∏_{p∈Q+}p. The local label L(b)=∏_{p∈Q,b mod p∈Ωp}p is only a displayed finite product; it is not a new definition node.

The distinction between the original sample x(a) and its label L(x(a)) is essential. For example, excluding residue 1 modulo 2 keeps the integer zero, even though an ordinary divisibility sieve at 2 removes zero. The label of that zero sample is 1, so the existing carrier makes the correct decision. Repeated labels receive the sum of all their source weights.

Empty local sets have density zero and must be removed from P before invoking the carrier's strict positive-density fields. They still contribute factors one to the full Q Euler product. If some local set has cardinality p, every sample is excluded and a separate zero theorem applies; there is no attempt to insert density one into BoundingSieve. These cases exhaust the possibilities because ZMod p has p elements.

The density is the existing ArithmeticFunction.prodPrimeFactors applied to ρ. It is zero at zero and multiplies one factor per distinct prime at a positive argument. On the squarefree divisors of P this is exactly the desired product of local densities. Its behavior on higher prime powers need not be completely multiplicative and is not used to claim prime-power residue counts.

### Weighted finite-family sieve

Identifier: `SieveMethodsAndPrimePatterns:SV.0/finite-family-sieve`. Proposed declaration: `BoundingSieve.ofFiniteFamily`.

Construct s.ofFiniteFamily(A,f,w) as a BoundingSieve with support f(A), weight at n equal to Σ_{a∈A,f(a)=n}w(a), and the same prime product, density and approximate mass as s.

s is an existing BoundingSieve; A is a finite set of indices in any type; f maps indices to naturals; w is real-valued and nonnegative on A. No injectivity or positivity of f is assumed.

Proof or construction plan:

1. Use the existing BoundingSieve record, replacing only support and weights by the displayed finite image and fiber sums.
2. Every fiber weight is nonnegative because all its indices belong to A. Retain the template's squarefreeness and both strict prime-density bounds unchanged.
3. The projection and off-image API follow from the record and finite sums. For identity-family compatibility, interchange finite fibers using the existing additive fiber theorem; only observables, not unrestricted off-support weights, agree.

Direct prerequisites: `mathlib:BoundingSieve`, `mathlib:Finset.prod_fiberwise_eq_prod_filter`.

Acceptance:

- All repeated labels contribute to the weight; this is not an unweighted image sieve.
- The map may take the value zero. Its divisibility and survival follow the existing natural conventions.
- Replacing a population does not prove that the retained X approximates its mass.

Uses which determine the API:

- Heath-Brown arXiv v1 pp.2–3, Example 2; existing finding E3: Retain each parameter of n(2N−n) with its weight instead of losing multiplicities in the literal image set.
- SieveMethodsAndPrimePatterns:SV.0/residue-class-sieve: Push the finite indexed population through its product-of-bad-primes labels while retaining the already specified local density and mass.
- SV.0 finite identities and SV.1 sieve applications: Reuse the existing BoundingSieve sums for noninjective sample maps without introducing a competing indexed-sieve type.

Planning API:

- `BoundingSieve.ofFiniteFamily_support` (projection): The new support is the finite image f(A).
- `BoundingSieve.ofFiniteFamily_weights` (characterisation): For every natural n the weight is Σ_{a∈A,f(a)=n}w(a), including repeated labels and zero labels.
- `BoundingSieve.ofFiniteFamily_prodPrimes` (simp): The prime product is exactly the template's prime product.
- `BoundingSieve.ofFiniteFamily_totalMass` (simp): The approximate mass is exactly the template's arbitrary real mass X.
- `BoundingSieve.ofFiniteFamily_nu` (simp): The entire multiplicative density function is exactly the template's density.
- `BoundingSieve.ofFiniteFamily_weights_of_not_mem` (simp): If n is outside the finite image f(A), its new weight is zero.
- `BoundingSieve.ofFiniteFamily_id_siftedSum` (compatibility): Taking A equal to the template support, f the identity and w the template weights preserves its sifted sum. Equality of the full records is not asserted: the original may have nonzero weights outside its support.

Tests:

- `family_collision_weights`: Two indices mapping to 7, of weights 2 and 3, give weight 5 at 7, not 1, 2 or 3.
- `family_empty_population`: An empty index set gives sifted sum zero for any template.
- `family_identity_agreement`: Using the template support, identity label and original weights preserves multSum(1).
- `family_polynomial_multiplicity`: The seven parameters 2≤n≤8 map under n(10−n) to four distinct values, but their unit-weight pushforward has multSum(1)=7, not 4.

### Divisibility sums of a weighted family

Identifier: `SieveMethodsAndPrimePatterns:SV.0/finite-family-multsum`. Proposed declaration: `BoundingSieve.ofFiniteFamily_multSum`.

For every natural d, multSum(d) of s.ofFiniteFamily(A,f,w) equals Σ_{a∈A,d|f(a)}w(a).

s is an existing BoundingSieve; A is a finite set of indices in any type; f maps indices to naturals; w is real-valued and nonnegative on A. No injectivity or positivity of f is assumed.

Proof or construction plan:

1. Expand only the new support and weights and the existing multSum.
2. Use Finset's generated additive fiberwise identity on the finite image restricted by d dividing the image value.
3. An index lies over that restricted image exactly when d divides its label; no injectivity is used. In particular d=0 picks exactly zero labels.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.0/finite-family-sieve`, `mathlib:BoundingSieve.multSum`, `mathlib:Finset.prod_fiberwise_eq_prod_filter`.

Acceptance:

- At d=1 the result is the total indexed weight, not the cardinality of the image.
- At d=0 retain all indices whose label is zero.

### Sifted sums of a weighted family

Identifier: `SieveMethodsAndPrimePatterns:SV.0/finite-family-siftedsum`. Proposed declaration: `BoundingSieve.ofFiniteFamily_siftedSum`.

The sifted sum of s.ofFiniteFamily(A,f,w) equals Σ_{a∈A,gcd(s.prodPrimes,f(a))=1}w(a).

s is an existing BoundingSieve; A is a finite set of indices in any type; f maps indices to naturals; w is real-valued and nonnegative on A. No injectivity or positivity of f is assumed.

Proof or construction plan:

1. Expand the carrier's sifted sum and restrict the finite image by coprimality with the unchanged prime product.
2. Apply the existing finite fiber-sum identity. The preimage of this restricted image is exactly the displayed subset of A.
3. No information about ν or X is used in this equality.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.0/finite-family-sieve`, `mathlib:BoundingSieve.siftedSum`, `mathlib:Finset.prod_fiberwise_eq_prod_filter`.

Acceptance:

- When the prime product is 1, even zero labels survive.
- For any larger prime product zero labels are removed, but their multiplicities still appear in divisibility sums.

### Prime divisibility of a residue label

Identifier: `SieveMethodsAndPrimePatterns:SV.0/prime-dvd-residue-label`. Proposed declaration: `BoundingSieve.prime_dvd_residueLabel_iff`.

Let Q be a finite set of primes and Ωp a finite subset of ZMod p. For any integer a and p∈Q, p divides L(a)=∏_{q∈Q,a mod q∈Ωq}q if and only if a mod p belongs to Ωp.

No properness, nonemptiness, sign or interval condition is needed for Ω or a.

Proof or construction plan:

1. The factors in L(a) are distinct primes, so the existing primeFactors_prod theorem identifies its prime-factor set with the defining filtered set.
2. The product is nonzero, including when the filter is empty.
3. Apply prime-factor membership at the prime p and use p∈Q to eliminate the redundant membership condition.

Direct prerequisites: `mathlib:Nat.primeFactors_prod`, `mathlib:Nat.mem_primeFactors_of_ne_zero`.

Acceptance:

- The result handles negative integers by the existing integer cast to ZMod.
- An empty bad set can never contribute its prime to the label.

### Simultaneous local conditions as divisibility

Identifier: `SieveMethodsAndPrimePatterns:SV.0/divisor-dvd-residue-label`. Proposed declaration: `BoundingSieve.dvd_residueLabel_iff`.

Under the same finite prime data, for every d dividing ∏_{p∈Q}p and every integer a, d divides L(a) if and only if a mod p belongs to Ωp for every p∈primeFactors(d).

The divisor hypothesis is on the squarefree prime product; d=1 is allowed, and d=0 is excluded by that hypothesis.

Proof or construction plan:

1. Distinct primes are pairwise coprime, so the existing squarefree-product theorem makes the ambient product squarefree; hence its divisor d is squarefree.
2. Replace d by the product of its prime factors. Use prod_primeFactors_dvd_iff and primeFactors_prod to translate divisibility into containment of prime supports.
3. Every prime of d already lies in Q because d divides the ambient product, leaving precisely the displayed simultaneous residue conditions.

Direct prerequisites: `mathlib:Finset.squarefree_prod_of_pairwise_isCoprime`, `mathlib:Nat.coprime_primes`, `mathlib:Nat.coprime_iff_isRelPrime`, `mathlib:Nat.prod_primeFactors_of_squarefree`, `mathlib:Nat.prod_primeFactors_dvd_iff`, `mathlib:Nat.primeFactors_prod`.

Acceptance:

- At d=1 the local condition is vacuous and every label is divisible by d.
- Do not extend to d=4 with Q={2}: a label containing the prime 2 once is not divisible by 4.

### Local avoidance as coprimality

Identifier: `SieveMethodsAndPrimePatterns:SV.0/residue-label-survival`. Proposed declaration: `BoundingSieve.coprime_residueLabel_iff`.

For the same data, gcd(∏_{p∈Q}p,L(a))=1 if and only if a mod p is outside Ωp for every p∈Q.

Q consists of primes; no assumption that the bad residue is zero. Empty and full local sets are allowed.

Proof or construction plan:

1. Use the finite-product coprimality equivalence to reduce to coprimality of each p∈Q with L(a).
2. A prime is coprime to a natural number exactly when it does not divide it.
3. Use prime-dvd-residue-label at each p and negate its equivalence.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.0/prime-dvd-residue-label`, `mathlib:Nat.coprime_prod_left_iff`.

Acceptance:

- Bad residue {1} modulo 2 keeps the original integer zero and removes one.
- The empty prime set gives label 1 and all samples survive.

### Sieve with arbitrary excluded residue classes

Identifier: `SieveMethodsAndPrimePatterns:SV.0/residue-class-sieve`. Proposed declaration: `BoundingSieve.ofResidueClasses`.

Construct BoundingSieve.ofResidueClasses(A,x,w,Q,Ω,X) with prime product P, multiplicative density prodPrimeFactors(ρ), approximate mass X, support the image of L∘x on A, and weights the sums over its fibers.

A is a finite index set, x maps indices to integers, w is real-valued and nonnegative on A, Q is a finite set consisting of primes, Ωp is a finite subset of ZMod p for each natural p, card(Ωp)<p for p∈Q, and X is an arbitrary real. Write ρ(p)=card(Ωp)/p, Q+= {p∈Q : Ωp is nonempty}, P=∏_{p∈Q+}p and L(b)=∏_{p∈Q,b mod p∈Ωp}p. All products are finite, with empty product 1. These are local expressions, not new carriers or functions in the blueprint.

Proof or construction plan:

1. Remove precisely the empty local sets to form Q+. The product P is squarefree by the existing distinct-prime product theorem.
2. Use the existing arithmetic function prodPrimeFactors(ρ), not a new multiplicative-extension construction. Its prime value is ρ(p), and its value at zero is zero.
3. For p∈Q+, nonempty Ωp gives ρ(p)>0; the properness hypothesis gives ρ(p)<1. Empty densities occur only outside P, where the carrier imposes no strict bound.
4. Build the existing carrier with this prime/density/mass data and apply finite-family-sieve to the label map L∘x. This supplies global nonnegativity of the fiber weights.
5. Verify the projection, prime-value and inactive-prime API directly. The supported divisibility and sifted-sum laws are separate promoted lemma nodes because the error theorem consumes them.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.0/finite-family-sieve`, `mathlib:Finset.squarefree_prod_of_pairwise_isCoprime`, `mathlib:Nat.coprime_primes`, `mathlib:Nat.coprime_iff_isRelPrime`, `mathlib:Nat.primeFactors_prod`, `mathlib:ArithmeticFunction.prodPrimeFactors`, `mathlib:ArithmeticFunction.IsMultiplicative.prodPrimeFactors`, `mathlib:ArithmeticFunction.prodPrimeFactors_apply`, `mathlib:Nat.Prime.primeFactors`.

Acceptance:

- All-empty local data are valid and give P=1. Do not impose card(Ωp)>0 on the original Q.
- If a local set has card p, use full-residue-obstruction rather than forcing density 1 into this carrier.
- The chosen density extension is only multiplicative on coprime inputs: at prime powers it repeats no factor. On the squarefree divisors actually used, it is exactly the product of local densities.
- The natural labels record local membership, not the magnitude of the original integer samples; no linear cutoff follows.

Uses which determine the API:

- Kedlaya Definition 11.6 and weighted Lemma 11.2: Realize arbitrary sets of excluded residue classes, with the original indexed weights, in the pinned sieve carrier.
- SieveMethodsAndPrimePatterns:SV.0/residue-legendre-error: Make the existing Legendre error theorem applicable to those local conditions; deleting zero densities keeps its Euler product unchanged.
- SV.1–SV.5 local-data inputs: Separate the exact finite representation from dimension, distribution and analytic cutoff hypotheses needed by later sieve estimates.

Planning API:

- `BoundingSieve.ofResidueClasses_prodPrimes` (projection): The carrier's prime product is P=∏_{p∈Q,Ωp nonempty}p; empty local conditions are removed.
- `BoundingSieve.ofResidueClasses_nu` (characterisation): The density is the existing arithmetic function prodPrimeFactors(ρ), with ρ(p)=card(Ωp)/p: ν(0)=0 and ν(d)=∏_{p|d}ρ(p) for d>0.
- `BoundingSieve.ofResidueClasses_totalMass` (simp): The approximate mass equals the supplied real X, without a sign or normalization assumption.
- `BoundingSieve.ofResidueClasses_support` (projection): The support is the finite image of a↦L(x(a)), where L(b)=∏_{p∈Q, b mod p∈Ωp}p.
- `BoundingSieve.ofResidueClasses_weights` (characterisation): At a natural n the weight is the sum of w(a) over indices a∈A with L(x(a))=n. Equal labels retain all their multiplicities.
- `BoundingSieve.ofResidueClasses_nu_prime` (simp): For every prime p, including those outside Q, ν(p)=card(Ωp)/p.
- `BoundingSieve.ofResidueClasses_inactive_prime` (relation): If p∈Q and Ωp is empty, then p does not divide the carrier prime product. The zero density is not forced into a strictly positive carrier field.

Tests:

- `residue_empty_prime_set`: With no sieving primes, three integer samples −1,0,1 of weight 2 give sifted sum 6, independently of unused residue data.
- `residue_all_zero_densities`: For Q={2,3} and both local residue sets empty, the carrier has prime product 1 and all three weight-2 samples survive.
- `residue_nonzero_bad_class`: For Q={2}, bad residue {1}, sample 0 of weight 2 and sample 1 of weight 3, the sifted sum is 2. A divisibility-only interpretation would incorrectly give 3.
- `residue_mixed_empty_negative`: For Q={2,3}, empty bad set at 2 and bad residue {1} at 3, the prime product is 3 and the six unit-weight samples −2,…,3 have sifted sum 4.
- `residue_radical_density`: The existing prodPrimeFactors extension at a single bad residue modulo 2 has ν(4)=1/2, not 1/4. Complete multiplicativity is neither required nor asserted.

### Divisibility sum equals the local intersection

Identifier: `SieveMethodsAndPrimePatterns:SV.0/residue-class-multsum`. Proposed declaration: `BoundingSieve.ofResidueClasses_multSum`.

For s=ofResidueClasses(A,x,w,Q,Ω,X) and every d|s.prodPrimes, s.multSum(d)=Σ_{a∈A,∀p∈primeFactors(d),x(a) mod p∈Ωp}w(a).

A is a finite index set, x maps indices to integers, w is real-valued and nonnegative on A, Q is a finite set consisting of primes, Ωp is a finite subset of ZMod p for each natural p, card(Ωp)<p for p∈Q, and X is an arbitrary real. Write ρ(p)=card(Ωp)/p, Q+= {p∈Q : Ωp is nonempty}, P=∏_{p∈Q+}p and L(b)=∏_{p∈Q,b mod p∈Ωp}p. All products are finite, with empty product 1. These are local expressions, not new carriers or functions in the blueprint.

Proof or construction plan:

1. The active prime product P divides the full Q prime product by finite-subset product divisibility, so d also divides the latter.
2. Apply finite-family-multsum to the residue constructor's label map.
3. Use divisor-dvd-residue-label at each index to identify the filter. For d=1 this is the entire indexed population.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.0/residue-class-sieve`, `SieveMethodsAndPrimePatterns:SV.0/finite-family-multsum`, `SieveMethodsAndPrimePatterns:SV.0/divisor-dvd-residue-label`, `mathlib:Finset.prod_dvd_prod_of_subset`.

Acceptance:

- The local conditions are simultaneous, not a sum of separate prime conditions.
- Repeated integer or label values remain weighted with all of their preimages.

### Sifted sum equals the original local avoidance count

Identifier: `SieveMethodsAndPrimePatterns:SV.0/residue-class-siftedsum`. Proposed declaration: `BoundingSieve.ofResidueClasses_siftedSum`.

For s=ofResidueClasses(A,x,w,Q,Ω,X), s.siftedSum=Σ_{a∈A,∀p∈Q,x(a) mod p∉Ωp}w(a).

A is a finite index set, x maps indices to integers, w is real-valued and nonnegative on A, Q is a finite set consisting of primes, Ωp is a finite subset of ZMod p for each natural p, card(Ωp)<p for p∈Q, and X is an arbitrary real. Write ρ(p)=card(Ωp)/p, Q+= {p∈Q : Ωp is nonempty}, P=∏_{p∈Q+}p and L(b)=∏_{p∈Q,b mod p∈Ωp}p. All products are finite, with empty product 1. These are local expressions, not new carriers or functions in the blueprint.

Proof or construction plan:

1. Apply finite-family-siftedsum to the label map and active prime product.
2. For each index, filtering Q by bad-residue membership already removes every empty Ωp. Thus its label equals the label formed using Q+.
3. Apply residue-label-survival on Q+. Avoidance on Q+ is equivalent to avoidance on all Q because empty local sets cannot contain any residue.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.0/residue-class-sieve`, `SieveMethodsAndPrimePatterns:SV.0/finite-family-siftedsum`, `SieveMethodsAndPrimePatterns:SV.0/residue-label-survival`.

Acceptance:

- Zero survives when it avoids the chosen residues; it is not automatically removed just because the carrier is a divisibility sieve.
- The mixed empty/nonempty example at negative integers has P=3 and sifted sum 4.

### Deleting empty local conditions preserves the Euler product

Identifier: `SieveMethodsAndPrimePatterns:SV.0/residue-euler-product`. Proposed declaration: `BoundingSieve.ofResidueClasses_eulerProduct`.

For s=ofResidueClasses(A,x,w,Q,Ω,X), ∏_{p∈primeFactors(s.prodPrimes)}(1−s.nu(p)) = ∏_{p∈Q}(1−card(Ωp)/p).

A is a finite index set, x maps indices to integers, w is real-valued and nonnegative on A, Q is a finite set consisting of primes, Ωp is a finite subset of ZMod p for each natural p, card(Ωp)<p for p∈Q, and X is an arbitrary real. Write ρ(p)=card(Ωp)/p, Q+= {p∈Q : Ωp is nonempty}, P=∏_{p∈Q+}p and L(b)=∏_{p∈Q,b mod p∈Ωp}p. All products are finite, with empty product 1. These are local expressions, not new carriers or functions in the blueprint.

Proof or construction plan:

1. Use primeFactors_prod to identify the carrier prime factors with Q+.
2. Evaluate prodPrimeFactors(ρ) at each prime, obtaining ρ(p).
3. Extend the product from Q+ to Q. Every added prime has empty local set, hence density zero and factor one.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.0/residue-class-sieve`, `mathlib:Nat.primeFactors_prod`, `mathlib:ArithmeticFunction.prodPrimeFactors_apply`, `mathlib:Nat.Prime.primeFactors`.

Acceptance:

- Empty local sets contribute factors one, not zero.
- With Q empty both products are one, independent of X and the population.

### A fully excluded residue space leaves no survivors

Identifier: `SieveMethodsAndPrimePatterns:SV.0/full-residue-obstruction`. Proposed declaration: `BoundingSieve.full_residueClass_siftedSum_eq_zero`.

For any finite indexed population A, integer sample map x, arbitrary real weights w, finite prime set Q and finite local sets Ωp, if p∈Q and card(Ωp)=p, then Σ_{a∈A,∀q∈Q,x(a) mod q∉Ωq}w(a)=0.

No nonnegativity of weights and no properness of the other local sets is needed. This result is stated before constructing a BoundingSieve; density one is outside its permitted prime-density range.

Proof or construction plan:

1. Since p is prime it is nonzero. The finite residue ring ZMod p has cardinality p.
2. A finite subset of that cardinality equals the full residue space, by eq_univ_of_card.
3. Every index fails the avoidance condition at p, so the filtered set is empty.
4. For completeness of the input split, card_le_univ ensures no local set at a prime has cardinality above p: either this obstruction applies or every local set is proper.

Direct prerequisites: `mathlib:ZMod.card`, `mathlib:Finset.eq_univ_of_card`, `mathlib:Finset.card_le_univ`.

Acceptance:

- The obstruction handles nonempty sample sets, not just the trivial empty-population case.
- Do not replace the density-one local set by a positive but smaller artificial density.

Tests:

- `residue_full_class_obstruction`: Excluding every residue modulo 3 leaves weighted sum zero on −2,…,3.

### Legendre error for arbitrary local residue conditions

Identifier: `SieveMethodsAndPrimePatterns:SV.0/residue-legendre-error`. Proposed declaration: `BoundingSieve.residueClass_legendre_error`.

Under the proper local-set hypotheses, let S=Σ_{a∈A,∀p∈Q,x(a) mod p∉Ωp}w(a), ρ(p)=card(Ωp)/p and P=∏_{p∈Q,Ωp nonempty}p. Then |S−X∏_{p∈Q}(1−ρ(p))| ≤ Σ_{d|P}|Σ_{a∈A,∀p∈primeFactors(d),x(a) mod p∈Ωp}w(a)−X∏_{p∈primeFactors(d)}ρ(p)|.

A is a finite index set, x maps indices to integers, w is real-valued and nonnegative on A, Q is a finite set consisting of primes, Ωp is a finite subset of ZMod p for each natural p, card(Ωp)<p for p∈Q, and X is an arbitrary real. The divisor sum includes d=1; X need not equal the indexed total weight. No analytic remainder, dimension or distribution hypothesis is implied.

Proof or construction plan:

1. Apply the inherited legendre-error theorem to the residue-class constructor.
2. Use residue-class-siftedsum to replace its sifted sum by S, and residue-euler-product to restore the full Q Euler product.
3. Expand the existing signed remainder using residue-class-multsum. Every d|P is positive, so the existing prodPrimeFactors evaluation gives the displayed product of local densities.
4. Reorder real multiplication to place X first. All errors remain inside absolute values; no source-claimed cutoff or quantitative estimate is imported.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.0/residue-class-sieve`, `SieveMethodsAndPrimePatterns:SV.0/residue-class-multsum`, `SieveMethodsAndPrimePatterns:SV.0/residue-class-siftedsum`, `SieveMethodsAndPrimePatterns:SV.0/residue-euler-product`, `SieveMethodsAndPrimePatterns:SV.0/legendre-error`, `mathlib:BoundingSieve.rem`, `mathlib:ArithmeticFunction.prodPrimeFactors_apply`.

Acceptance:

- All-empty local data give the identity |Σw−X|≤|Σw−X|, retaining the mass-normalization error at d=1.
- The indexed Goldbach polynomial example retains seven parameters, not four image points.
- Even labels larger than the original sample bound are allowed; quantitative sieve applications still need independently proved cutoff or tail hypotheses.

Tests:

- `residue_label_has_no_linear_cutoff`: For bad residues {0,−2} and Q={3,5,7,11}, the integer 33 has prime-product label 1155; the label is not bounded by the original sample's size.

The finite-family divisibility and sifted-sum laws, and the three residue sum/Euler laws, are promoted from API obligations to separate nodes because the error theorem consumes them. Other field projections and base-case compatibility stay in the construction APIs. The finite fiber-sum operation itself is already in Mathlib: the source declaration prod_fiberwise_eq_prod_filter generates the additive companion sum_fiberwise_eq_sum_filter, which the complete scratch proofs use.

## SV.2: finite Gram-row inequalities

The finite geometry of a large-sieve argument is independent of its arithmetic estimates. Fix a finite indexing type I, a real or complex normed inner-product space E and an indexed family y:I→E. Neither completeness nor finite dimensionality is required. Repeated vectors, linear dependence and zero vectors are allowed. A finite subset of another type is represented by its membership subtype; no new finite-family carrier is needed.

Use Mathlib's convention: the first inner-product argument is conjugate-linear and the second is linear. Put Gᵢⱼ=⟨yᵢ,yⱼ⟩, the existing Matrix.gram, and rᵢ=Σⱼ|Gᵢⱼ|. The row sums are real and nonnegative; they are local notation, not additional definitions. Scalar norms, not real parts or squared moduli, are summed in rᵢ. All divisions by a zero real denominator are zero. Only the maximum form requires I to be nonempty.

Bombieri's original Proposition 1 is attributed there, including its proof, to Selberg. It gives a weighted inequality stronger than the maximum form cited by Bennett–Siksek. Its finite proof uses a squared-distance defect and a symmetric Gram estimate. The source writes the inner product linear in its first argument; translating its coefficient without switching the arguments would break the complex case. The theorem uses the corrected coefficient choice recorded in source finding E9.

### Vanishing Gram row detects the zero vector

Identifier: `SieveMethodsAndPrimePatterns:SV.2/gram-row-zero`. Proposed declaration: `SieveGram.gramRow_eq_zero_iff`.

For each i∈I, rᵢ=0 if and only if yᵢ=0.



Proof outline:

1. Each summand defining rᵢ is nonnegative. The diagonal term |⟨yᵢ,yᵢ⟩| is at most rᵢ by finite-sum monotonicity.
2. If rᵢ=0 the diagonal inner product is zero, so the existing positive-definite inner-product lemma gives yᵢ=0. Conversely, a zero vector makes every entry of its row zero.

Direct prerequisites: `mathlib:Matrix.gram`, `mathlib:Matrix.gram_apply`, `mathlib:inner_self_eq_zero`.

Acceptance:

- A family containing a zero vector has a zero row without making any other denominator invalid.
- A nonzero vector always has positive row sum, even in a dependent family.

### Gram-row bound for a finite linear combination

Identifier: `SieveMethodsAndPrimePatterns:SV.2/gram-row-quadratic`. Proposed declaration: `SieveGram.norm_sum_smul_sq_le_gramRows`.

For every scalar family c:I→𝕜, ‖Σᵢcᵢyᵢ‖² ≤ Σᵢ|cᵢ|²rᵢ.



Proof outline:

1. Expand the squared norm as the real part of Σᵢⱼ conjugate(cᵢ)cⱼGᵢⱼ, using the existing Gram quadratic identity, or its finite inner-product sum laws.
2. Bound each real part by its modulus and then use 2|cᵢ||cⱼ|≤|cᵢ|²+|cⱼ|²; this follows by expanding the nonnegative square (|cᵢ|−|cⱼ|)².
3. Interchange indices in the terms containing |cⱼ|². Norm symmetry of the inner product makes the two half-sums equal, leaving exactly Σᵢ|cᵢ|²rᵢ.

Direct prerequisites: `mathlib:InnerProductSpace`, `mathlib:Matrix.star_dotProduct_gram_mulVec`, `mathlib:sum_inner`, `mathlib:inner_sum`, `mathlib:inner_smul_left`, `mathlib:inner_smul_right`, `mathlib:norm_inner_symm`, `mathlib:RCLike.re_le_norm`.

Acceptance:

- The empty family gives 0≤0.
- Repeated unit vectors with all coefficients 1 attain equality; no orthogonality is assumed.
- Changing Gᵢⱼ to its real part without taking absolute values is invalid: the family 1,−1 has cancelling signed rows.

### Selberg's normalized projection defect bound

Identifier: `SieveMethodsAndPrimePatterns:SV.2/selberg-defect`. Proposed declaration: `SieveGram.selberg_defect_le`.

Set cᵢ=⟨yᵢ,x⟩/rᵢ, casting the real denominator to 𝕜. Then ‖x−Σᵢcᵢyᵢ‖² ≤ ‖x‖²−Σᵢ|⟨x,yᵢ⟩|²/rᵢ.

x is any vector of E.

Proof outline:

1. Use the existing norm_sub_sq expansion with the finite linear combination. Apply gram-row-quadratic to its squared norm.
2. For each i, conjugate symmetry and z·conjugate(z)=|z|² give Re(cᵢ⟨x,yᵢ⟩)=|⟨x,yᵢ⟩|²/rᵢ.
3. Since rᵢ≥0, scalar norm/division gives |cᵢ|²rᵢ=|⟨x,yᵢ⟩|²/rᵢ. Split rᵢ=0 before field cancellation; both sides of this identity are zero in that case.
4. Sum the two identities and collect the −2 and +1 contributions. Use the corrected single row sum, not the printed global sum of squared Gram entries recorded in E9.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.2/gram-row-quadratic`, `mathlib:norm_sub_sq`, `mathlib:inner_sum`, `mathlib:inner_smul_right`, `mathlib:inner_conj_symm`, `mathlib:norm_inner_symm`, `mathlib:RCLike.mul_conj`, `mathlib:RCLike.norm_ofReal`, `mathlib:RCLike.div_re_ofReal`.

Acceptance:

- For x=1 and y=i in ℂ the coefficient is −i, and its multiple of y is 1. The opposite convention gives −1 and does not prove the defect estimate.
- For x=1,y=2 in ℝ the corrected coefficient is 1/2 and the defect is zero; the printed coefficient 1/8 gives defect 9/16.

### Selberg's weighted inner-product inequality

Identifier: `SieveMethodsAndPrimePatterns:SV.2/selberg-weighted-inner`. Proposed declaration: `SieveGram.selberg_weighted_inner`.

Σᵢ |⟨x,yᵢ⟩|²/rᵢ ≤ ‖x‖².

x is any vector of E; zero rows contribute zero.

Proof outline:

1. The left-hand squared norm in selberg-defect is nonnegative. Move the weighted sum to the other side.
2. The proof is finite over either scalar field. Thus the Hilbert-space statement extends to normed inner-product spaces without a completeness assumption.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.2/selberg-defect`.

Acceptance:

- An empty or all-zero family has weighted sum zero.
- For a single nonzero vector this is Cauchy–Schwarz after dividing by its squared norm.
- For x=1 and real y=(1,2), the two terms are 1/3 and 4/6, summing to 1; replacing the denominators by their squares fails already at y=1/2.
- For an orthonormal family all rows equal one, so the result agrees with the existing finite Bessel inequality; it does not rebuild the orthonormal theory.

### Inner-product bound from a uniform Gram row estimate

Identifier: `SieveMethodsAndPrimePatterns:SV.2/bombieri-row-bound`. Proposed declaration: `SieveGram.bombieri_of_gramRow_le`.

If B≥0 and rᵢ≤B for every i, then Σᵢ|⟨x,yᵢ⟩|² ≤ ‖x‖²B.

x∈E; B is a real nonnegative bound, not a new bound predicate.

Proof outline:

1. If rᵢ=0 then gram-row-zero makes yᵢ=0, hence its unweighted numerator is zero.
2. For rᵢ>0, multiply rᵢ≤B by the nonnegative quotient |⟨x,yᵢ⟩|²/rᵢ. This bounds the unweighted numerator by B times that quotient.
3. Sum and multiply selberg-weighted-inner by B≥0. This form needs no maximum and therefore supports the empty family.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.2/gram-row-zero`, `SieveMethodsAndPrimePatterns:SV.2/selberg-weighted-inner`.

Acceptance:

- B=0 forces every indexed vector zero.
- For an empty family and x=1, allowing B=−1 would assert 0≤−1; the sign hypothesis is necessary in the empty case.

### Bombieri–Selberg Gram-row inequality

Identifier: `SieveMethodsAndPrimePatterns:SV.2/bombieri-selberg`. Proposed declaration: `SieveGram.bombieri_selberg`.

For nonempty I, Σᵢ|⟨x,yᵢ⟩|² ≤ ‖x‖² maxᵢ∈I rᵢ.

x∈E and I is nonempty; use the existing finite supremum, not a chosen default maximum.

Proof outline:

1. Take B to be the existing finite supremum of the real row sums. Every row is bounded by it.
2. Choose an index only to infer B≥0 from the nonnegative row at that index; no maximizing vector or Gram inverse is needed.
3. Apply bombieri-row-bound. Empty families are covered by that lemma instead of assigning an artificial real maximum.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.2/bombieri-row-bound`, `mathlib:Finset.sup'`, `mathlib:Finset.le_sup'`.

Acceptance:

- For m repeated copies of a unit vector and x that vector, both sides equal m, including the Gram off-diagonal contributions.
- For y=(1,2) and x=1 over ℝ the unweighted sum is 5 and the maximum row is 6.
- Taking the maximum of individual entries instead of row sums fails on repeated unit vectors.

### Diagonal and off-diagonal Gram estimate

Identifier: `SieveMethodsAndPrimePatterns:SV.2/bombieri-diagonal-offdiagonal`. Proposed declaration: `SieveGram.bombieri_diagonal_offDiagonal`.

If D,C≥0, ‖yᵢ‖²≤D for every i, and |⟨yᵢ,yⱼ⟩|≤C whenever i≠j, then Σᵢ|⟨x,yᵢ⟩|² ≤ ‖x‖²(D+(|I|−1)₊C), where (|I|−1)₊ is natural truncated subtraction.

x∈E; I may be empty. D and C are real nonnegative constants.

Proof outline:

1. For an index i, use the existing additive companion of mul_prod_erase to separate its diagonal term from the remaining finite row.
2. The diagonal norm is ‖yᵢ‖². Bound the remaining |I|−1 terms individually by C; the existing erase-cardinality identity counts them exactly.
3. Thus each row is bounded by D+(|I|−1)₊C, a nonnegative number. Apply bombieri-row-bound, whose empty-family case requires no index choice.
4. For nonempty I, division by |I| and (|I|−1)/|I|≤1 gives the normalized bound (Σᵢ|⟨x,yᵢ⟩|²)/|I|≤‖x‖²(D/|I|+C) used in Bennett–Siksek. This is routine real arithmetic, not an analytic estimate of D or C.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.2/bombieri-row-bound`, `mathlib:inner_self_re_eq_norm`, `mathlib:inner_self_eq_norm_sq`, `mathlib:Finset.mul_prod_erase`, `mathlib:Finset.card_erase_of_mem`.

Acceptance:

- The empty family satisfies 0≤‖x‖²D and the singleton case has no off-diagonal contribution.
- For m≥1 repeated unit vectors, D=C=1 gives equality with constant m.
- For an orthonormal family D=1,C=0 recovers the finite Bessel bound. No arithmetic character-correlation or prime-number theorem bound is assumed implicitly.

### Library boundary and applications

Matrix.gram, its Hermitian symmetry, its finite quadratic identity and positive semidefiniteness already exist. The pinned Orthonormal.sum_inner_products_le is also already a finite Bessel inequality, but it requires orthonormality and does not furnish arbitrary Gram row control. The new proofs use the existing finite inner-product identities and scalar norm arithmetic. They introduce neither a Gram record nor a Schur-bound predicate, and do not repeat orthonormal bases, operator theory or generic matrix constructions.

For the Bennett–Siksek application, the finite diagonal/off-diagonal estimate gives the normalized average bound once the family cardinality is positive. Establishing that the characters satisfy a useful off-diagonal correlation bound, estimating the norm of the von Mangoldt vector and deriving the large-parameter threshold are additional arithmetic inputs. This finite result supplies no such estimate by itself. In particular, it is not the additive or multiplicative analytic large sieve, a quadratic-symbol bilinear estimate or a polynomial Farey large sieve.

The two Gram-slice SV.2 planets are Selberg's weighted inner-product inequality and the Bombieri–Selberg inequality. The zero-row and quadratic/defect lemmas explain their proof; the uniform-row and diagonal/off-diagonal forms explain how consumers use them. The Gram slice requires no new definition. The taper slice below adds one construction into a native Euclidean space; the two SV.0 construction APIs and their tests stay unchanged.

## SV.2: finite taper and Fourier kernel

This slice of Bombieri pp.402–403 feeds the finite Gram theorem with explicit vectors. It does not yet prove the separated-point large sieve. Use the existing real Fourier character e(t)=exp(2πit), and only local abbreviations

\[
T_M(n)=\max(0,M-|n|),\qquad
W_{N,L}(n)=\frac{T_{N+L}(n)-T_N(n)}{L},\qquad
K_M(t)=\left|\sum_{k=0}^{M-1}e(kt)\right|^2.
\]

K is the unnormalized finite Fejér expression: K_M(0)=M². These abbreviations introduce no new kernel record or Fourier-character object. All sums are finite. Frequencies in the native Euclidean space of dimension 2(N+L)+1 are n_k=k−(N+L); the two outer endpoint coordinates vanish. The new vector is

\[
\phi_{N,L}(x)_k=\sqrt{W_{N,L}(n_k)}\,e(-n_kx).
\]

The source also uses this negative phase. We swap the arguments of its linear-first inner product to get Mathlib's conjugate-linear-first pairing ⟨φ(x),f⟩. This avoids conjugating the original coefficients. The construction permits L=0, in which case totalized division makes it zero; all useful taper estimates require L>0.

### Multiplicity of an integer difference

Node SV.2/difference-pair-count; proposed declaration SieveTaper.card_difference_pairs.

For M∈ℕ and n∈ℤ, the number of ordered pairs 0≤a,b<M with a−b=n is M−|n|, using natural truncated subtraction M−n.natAbs.

M may be zero; the difference a−b is in ℤ, not natural subtraction.

Proof outline:

1. For n≥0, send b in 0,…,M−n−1 to (b+n,b). For n<0, send a in 0,…,M−|n|−1 to (a,a+|n|). These are inverse coordinate projections on the filtered pair set.
2. Check the empty ranges when |n|≥M and M=0 before using endpoint arithmetic. The native finite-cardinality bijection and interval count give the common truncated value.

Acceptance:

- M=3,n=−1 gives two pairs; M=3,n=3 gives none. Natural subtraction inside the filter would incorrectly count extra pairs at n=0.

Source: Bombieri, p.403, finite expansion underlying the displayed formula for K_M. Worker-supplied combinatorial decomposition of the source's finite kernel identity, including signed differences and empty sums.

### Triangular Fourier sum as a squared modulus

Node SV.2/triangular-fourier; proposed declaration SieveTaper.triangular_fourier.

For every M∈ℕ and t∈ℝ, Σ_{n=−M}^{M}T_M(n)e(nt)=K_M(t), with the real right side cast to ℂ.

Proof outline:

1. Expand the squared modulus of Σ_{a<M}e(at) as its product with its complex conjugate. The native Fourier character laws turn each pair term into e((a−b)t).
2. Group the finite pair sum by its integer difference in [−M,M], using the additive companions of the cited finite product/fiber lemmas. Every pair's difference belongs to that interval.
3. Apply difference-pair-count to each fiber and cast its truncated natural value to max(0,M−|n|). The endpoints ±M have coefficient zero, also when M=0.

Acceptance:

- At t=0 the sum is M², not M; no normalized Fejér kernel is being used.
- For M=1 the expression is constantly 1; for M=0 it is zero.

Source: Bombieri, p.403, displayed definition and evaluation of K_M. Finite coefficient expansion that the paper suppresses; no convergence or infinite Fourier-series theorem is needed.

### Sine quotient for a finite Fourier sum

Node SV.2/geometric-sine-square; proposed declaration SieveTaper.geometric_sine_square.

If sin(πt)≠0, then K_M(t)=(sin(πMt)/sin(πt))² for every M∈ℕ.

The nonzero denominator is essential. At integer t the finite sum is instead M, and K_M(t)=M²; a totalized quotient would incorrectly give zero.

Proof outline:

1. Write e(kt)=e(t)^k using the native additive-character power law.
2. The native exponential-difference norm identity gives |e(t)−1|=2|sin(πt)|, so the hypothesis permits the native finite geometric-series formula.
3. Take norms of (e(t)^M−1)/(e(t)−1). Apply the same exponential identity to the numerator, square, cancel the factor 4, and commute scalar products to obtain the displayed real quotient. M=0 is valid without a separate nonempty-sum assumption.

Acceptance:

- M=2,t=1/2 gives zero; M=1,t=1/2 gives one.
- At t=0,M=3 the actual value is 9, demonstrating why the sine-denominator hypothesis cannot be omitted.

Source: Bombieri, p.403, sine-quotient evaluation of K_M. The source's quotient formula with its removable-value restriction made explicit.

### Piecewise taper weights and their bounds

Node SV.2/taper-weight; proposed declaration SieveTaper.taper_weight.

For L>0, W_{N,L}(n) equals 1 if |n|≤N, equals (N+L−|n|)/L if N<|n|≤N+L, and equals 0 otherwise. In all cases 0≤W_{N,L}(n)≤1.

N,L∈ℕ, n∈ℤ; all inequalities in this formula are real after casting.

Proof outline:

1. Split at |n|≤N and |n|≤N+L. In each branch evaluate the two maxima defining T.
2. Since L>0, subtraction of the two affine expressions gives L on the core and a number between 0 and L on the taper. Divide by positive L. Outside both supports the numerator is zero.

Acceptance:

- N=1,L=2,n=2 gives 1/2; at |n|=N the value is 1, and at |n|=N+L it is zero.
- L=0 is excluded here; the totalized expression is zero everywhere, not an indicator of the core.

Source: Bombieri, p.403, definition of φ_i and the split into its core and taper. Algebraic form of the source's squared amplitudes; the square root is taken only after nonnegativity is proved.

### Finite tapered Fourier vector

Node SV.2/tapered-character; proposed declaration SieveTaper.taperedCharacter.

Construct φ_{N,L}(x) with coordinate k equal to √W_{N,L}(n_k)·e(−n_k x), as a vector in the existing finite Euclidean space. Real square roots are cast to ℂ.

The constructor allows every natural L, including zero under totalized real division. The useful identities below require L>0.

Proof outline:

1. Use the native WithLp.toLp 2 constructor on the displayed coordinate function; no new vector-space or kernel structure is introduced.
2. The finite range contains every integer frequency from −(N+L) to N+L, including zero endpoint coordinates. It is the support-restricted version of the source's ℓ² vector.
3. The negative phase translates the source's linear-first convention to Mathlib's conjugate-linear-first convention. With L=0 the numerator and quotient are zero, making the entire vector zero.

Acceptance:

- Do not replace √W by W: that changes the squared norm and the Gram kernel.
- The phase sign is tested at a quarter turn; the zero-width case must not assert a positive diagonal mass.

Its API has three entries: the coordinate equality, the zero-width equality, and the core equality. The coordinate and core interfaces are consumed below and therefore promoted to separate lemma nodes, not left as untracked API prerequisites. Existing vector extensionality and inner-product structure are inherited from EuclideanSpace.

Recorded uses:

- Bombieri p.403 Gram identity; SV.2/tapered-gram: Its square-root amplitudes make the Gram entries exactly the difference of two triangular Fourier kernels.
- Bombieri p.403 (f,φ_i)=S(x_i); SV.2/tapered-fourier-pairing: Unit amplitudes on the full core recover the original Fourier coefficients with the native inner-product convention.
- SV.2/tapered-row-large-sieve: Feed the family into the existing finite Gram-row theorem; no separate vector-space or norm construction is needed.

Construction tests:

- taper_zero_width: For every N and x, φ_{N,0}(x) is the zero vector.
- taper_unit_core: φ_{0,1}(0) is the native Euclidean vector (0,1,0).
- taper_quarter_phase: For N=L=1,x=1/4, coordinate k=1 (frequency −1) is i, not −i.
- taper_square_root_weight: For N=0,L=2,x=0, coordinate k=1 (frequency −1) has squared modulus 1/2, not 1/4.
- taper_diagonal_mass: The native Euclidean squared norm of φ_{1,2}(0) is 4.

Source: Bombieri, pp.402–403, finite support of f and the definition of φ_i. Faithful finite-dimensional realization of the source's finitely supported ℓ² vectors, with no completeness or infinite-sum infrastructure.

### Coordinates of the tapered Fourier vector

Node SV.2/tapered-coordinate; proposed declaration SieveTaper.taperedCharacter_apply.

For every k, φ_{N,L}(x)_k=√W_{N,L}(n_k)·e(−n_kx).

N,L∈ℕ and x∈ℝ; L may be zero.

Proof outline:

1. Evaluate the native finite vector constructor at k. This is the promoted coordinate API, allowing the later inner-product proof to avoid unfolding a new abstraction.

Acceptance:

- The frequency is k−(N+L), not k; the endpoints have zero weight when L>0.

Source: Bombieri, p.403, definition of φ_i. Coordinate interface for the source's taper construction.

### Untapered coordinates on the core

Node SV.2/tapered-core; proposed declaration SieveTaper.taperedCharacter_core.

If L>0 and |n_k|≤N, then φ_{N,L}(x)_k=e(−n_kx).

Proof outline:

1. Use the coordinate interface and the first branch of taper-weight. The native real square root of 1 is 1, leaving precisely the phase.

Acceptance:

- The boundary frequencies ±N belong to the core; strict inequality would discard an actual coefficient in the pairing theorem.

Source: Bombieri, p.403, inner-product identification with S(x_i). Promoted core API used to retain every original coefficient.

### Signed Gram kernel of tapered vectors

Node SV.2/tapered-gram; proposed declaration SieveTaper.taperedCharacter_inner.

For L>0, ⟨φ_{N,L}(x),φ_{N,L}(y)⟩=(K_{N+L}(x−y)−K_N(x−y))/L, with the real quotient cast to ℂ.

Proof outline:

1. Expand the native finite inner product. The nonnegative square root has squared value W, and conjugation changes e(−n_kx) to e(n_kx), so the term is W(n_k)e(n_k(x−y)).
2. Reindex k to the integer interval [−(N+L),N+L] by n_k=k−(N+L), with inverse n↦n+N+L. Split the two triangular sums and divide by L.
3. Use triangular-fourier for N+L. Extend the smaller N interval by zero using the additive companion of the cited subset-product lemma, then use triangular-fourier for N.
4. The result is a signed real difference. Only after taking its absolute value does it give the norm of the inner product; E10 records the source display's missing absolute value on this difference.

Acceptance:

- N=L=1 and x−y=1/2 give Gram value −1 and norm 1, not a negative norm.
- At x=y the two kernel values are (N+L)² and N².

Source: Bombieri, p.403, displayed off-diagonal inner-product formula after K_M. Corrected signed equality behind the source's norm estimate; finding E10 does not challenge the final bound.

### Squared norm of the tapered Fourier vector

Node SV.2/tapered-diagonal; proposed declaration SieveTaper.taperedCharacter_norm_sq.

For L>0, ‖φ_{N,L}(x)‖²=2N+L.

Proof outline:

1. Set y=x in the signed Gram identity. Every phase in K_M(0) is one, so K_M(0)=M².
2. Use the native inner-self identity and expand ((N+L)²−N²)/L=2N+L, cancelling only after L>0.

Acceptance:

- N=0,L=1 has squared norm 1; N=1,L=2 has squared norm 4.
- This mass is not the ambient dimension 2(N+L)+1, and not merely the core length 2N+1.

Source: Bombieri, p.403, displayed diagonal inner product. Exact diagonal contribution, independent of x.

### Off-diagonal tapered Gram bound

Node SV.2/tapered-offdiagonal; proposed declaration SieveTaper.taperedCharacter_inner_norm_le.

If L>0 and sin(π(x−y))≠0, then |⟨φ_{N,L}(x),φ_{N,L}(y)⟩|≤1/(L sin²(π(x−y))).

Proof outline:

1. Put A=1/sin²(π(x−y)), which is positive. The sine-square formula and the native upper bound sin²≤1 give 0≤K_M(x−y)≤A for both M=N and M=N+L.
2. Two numbers in [0,A] have difference with absolute value at most A, not merely 2A. Apply this elementary interval bound to the corrected signed Gram formula and divide by positive L.
3. Do not assume the kernel difference nonnegative; its sign changes in the half-turn example.

Acceptance:

- N=L=1,x−y=1/2 attains the bound 1, despite negative Gram value.
- Coincident phases modulo one are excluded by the nonzero-sine hypothesis; totalized division cannot justify a zero upper bound there.

Source: Bombieri, p.403, off-diagonal estimate preceding the separation sum. The source's valid bound survives correction of E10; the factor one depends on bounding a difference of two nonnegative kernels.

### Tapered pairing recovers a core Fourier sum

Node SV.2/tapered-fourier-pairing; proposed declaration SieveTaper.taperedCharacter_pairing.

For L>0 and f with f_k=0 whenever |n_k|>N, ⟨φ_{N,L}(x),f⟩=Σ_k f_k e(n_kx).

f is any vector in the same native Euclidean space; coefficients may be arbitrary complex numbers.

Proof outline:

1. Expand the finite inner product and split coordinates by |n_k|≤N.
2. On the core apply tapered-core, then conjugate its negative phase to obtain e(n_kx). Outside the core both sides vanish because f_k=0.
3. The identity keeps the full core including both endpoints, without assuming f real or introducing a new padding constructor.

Acceptance:

- The phase sign and order of the inner-product arguments matter for complex coefficients.
- Without the support hypothesis a tapered coordinate has an extra square-root factor, so this identity is false.

Source: Bombieri, p.403, (f,φ_i)=S(x_i), translated to the native convention. Exact bridge from the finite Fourier sum to the previously planned Gram inequality.

### Large-sieve bound from cosecant row control

Node SV.2/tapered-row-large-sieve; proposed declaration SieveTaper.largeSieve_of_cosecantRow_le.

Let x_i be a finite real family and C≥0. Suppose sin(π(x_i−x_j))≠0 for i≠j and Σ_{j≠i}1/sin²(π(x_i−x_j))≤C for every i. For L>0 and core-supported f, Σ_i|Σ_k f_k e(n_kx_i)|²≤‖f‖²(2N+L+C/L).

The indexing type may be empty. N,L∈ℕ, L>0, and f_k=0 whenever |n_k|>N. The explicit cosecant row bound is a hypothesis, not an inferred consequence of separation.

Proof outline:

1. For each i split the Gram row into its diagonal and its erased off-diagonal sum using the native additive erase identity.
2. Use tapered-diagonal on the diagonal and tapered-offdiagonal term by term elsewhere. Factor 1/L out of the finite sum and use the assumed row bound C.
3. The resulting bound B=2N+L+C/L is nonnegative even for an empty family. Apply bombieri-row-bound to the family of tapered vectors and f.
4. Use norm symmetry of the inner product and tapered-fourier-pairing to identify every summand. No maximum or nonempty-family hypothesis is needed.
5. Do not replace the row hypothesis by the paper's final separation constant here: corrected bin packing, the cosecant sum, the integer taper choice, and interval translation/parity are supplied by separate declarations below.

Acceptance:

- The empty family gives 0≤‖f‖²B; a singleton has C=0.
- This conditional theorem is not the full additive large-sieve theorem with constant length+2/δ.

Source: Bombieri, pp.403–404, reduction to (5) and its diagonal/off-diagonal decomposition. Finite conditional interface to the separate separation and taper-optimization steps.

### Source-proof corrections and library boundary

E10 records that the displayed Gram modulus on p.403 is equated to a signed kernel difference. For N=L=1 and phase difference 1/2 the difference is −1, whereas the modulus is 1. Taking the absolute value of the difference repairs the identity. Because both kernels lie between zero and the same cosecant-square bound, their difference has modulus at most that bound; the later estimate does not acquire a factor two.

E11 records the incomplete bin coverage at the start of p.404. Requiring (m+1)δ≤1/2 discards the final partial bin and can discard the antipodal endpoint. With δ=3/10 and points 0,2/5, the permitted bins miss distance 2/5. The radial-bin lemma below keeps every floor bin, including the final piece and the antipodal endpoint, and proves the at-most-two count using two oriented half-circles. The antipodal representative belongs only to the negative half.

The native real Fourier character, EuclideanSpace, finite sums and geometric-series identity are library inputs. Tau Ceti's continuous Bochner/Fejér ball-overlap argument is a different result and is not cited as this discrete finite identity. The exact large-sieve taper belongs to SV.2; no generic ES character-sum bound, operator carrier or infinite ℓ² construction is duplicated. Its planets include the tapered Fourier vector and the conditional large-sieve bound from cosecant rows. Together with Bombieri's additive large sieve below, SV.2 has five planets.

## SV.2: circular separation and the original interval

Use d(t)=‖(t:UnitAddCircle)‖, the native circle norm, and e(t)=exp(2πit). Separation means δ≤d(x_i−x_j) for distinct labels, with δ>0 explicit. Repeated representatives modulo one are excluded for distinct labels, but an empty or singleton indexing type imposes no upper bound on δ. No competing distance, separation predicate, Fourier character or coefficient-space carrier is introduced.

The proof has two logically different branches. If 0<δ≤1/2, choose a positive taper width and apply the finite Gram estimate. If δ>1/2, the point family has at most one element and ordinary finite Cauchy–Schwarz suffices. This distinction is necessary: the floor width is zero at δ=2 despite a singleton satisfying the separation hypothesis.

### Sine lower bound from circular distance

Node SV.2/circular-sine-square; proposed declaration SieveTaper.four_circle_norm_sq_le_sin_sq.

For every real t, 4d(t)²≤sin²(πt).

Proof route:

1. Put r=t−round t and a=|r|=d(t). Native rounding gives 0≤a≤1/2.
2. Integer π-shift invariance after squaring and the oddness of sine give sin²(πt)=sin²(πa). The sign of r and integer-shift sign disappear only after squaring.
3. Apply Real.le_sin_mul to y=2a: 2a≤sin(πa). Both sides are nonnegative, so square.

Acceptance checks:

- At t=0 both sides vanish; at t=1/2 both sides equal one.
- Positive d(t) implies sin(πt)≠0; the inequality does not falsely exclude integer t.

Source: Bombieri, p.404, the sine inequality preceding the reciprocal-square sum. Specializes native Jordan inequality to the circle norm used by the packing argument.

### Two-point bound for circular radial bins

Node SV.2/circular-bin-packing; proposed declaration SieveTaper.circular_bin_card_le_two.

For a δ-separated finite real family, fixed i and m∈ℕ, #{j≠i: floor(d(x_i−x_j)/δ)=m}≤2. No upper restriction on m is imposed.

Proof route:

1. For each j reduce x_j−x_i to r_j=(x_j−x_i)−round(x_j−x_i)∈[−1/2,1/2). Its absolute value is d(x_i−x_j), by native norm symmetry.
2. Within one floor bin, each |r_j| lies in [mδ,(m+1)δ). Two representatives of the same sign therefore differ in absolute value by strictly less than δ. Zero cannot occur because j≠i and δ>0.
3. For j≠k, round_le applied to x_j−x_k and the integer round(x_j−x_i)−round(x_k−x_i) bounds d(x_j−x_k) by |r_j−r_k|. This contradicts separation for two distinct labels with the same sign.
4. Thus the map recording whether r_j<0 is injective from the bin into the two signs. Apply the native finite-cardinality inequality.
5. The representative of an antipode is −1/2, never +1/2. The unrestricted floor-bin statement keeps the final partial bin and exact distance 1/2; it corrects the proof coverage gap E11.

Acceptance checks:

- With δ=3/10 and x=(0,2/5), the off-diagonal point lies in m=1 although (m+1)δ>1/2.
- For δ=1/4 an antipode lies in m=2 and is counted once; bin zero is empty for j≠i.

Source: Bombieri, p.404, radial intervals I_m and their at-most-two assertion, with E11 corrected. Provides the exact endpoint-safe finite packing lemma underlying the source row estimate.

### Separated cosecant-square row bound

Node SV.2/cosecant-row-bound; proposed declaration SieveTaper.cosecantRow_le.

For every row i of a δ-separated finite family with δ>0, Σ_{j≠i}1/sin²(π(x_i−x_j))≤π²/(12δ²).

Proof route:

1. For j≠i separation gives positive distance, hence nonzero sine by circular-sine-square. Put m_j=floor(d(x_i−x_j)/δ); then m_j≥1 and d(x_i−x_j)≥m_jδ.
2. The sine bound implies 1/sin²(π(x_i−x_j))≤1/(4m_j²δ²). Group the erased finite sum by the finite image of m_j using native sum_fiberwise_of_maps_to.
3. Each fiber contains at most two labels by circular-bin-packing. The row is at most (1/(2δ²)) times the sum of 1/m² over that finite image.
4. Native hasSum_zeta_two and the additive form of prod_le_hasProd bound that nonnegative finite sum by π²/6. The zero natural term is zero but never occurs in the finite image. Multiplication yields π²/(12δ²).

Acceptance checks:

- Empty off-diagonal sums and singleton point families are allowed.
- This proves the row estimate without assuming δ≤1/2; if there is an off-diagonal point, that upper bound follows automatically.

Source: Bombieri, p.404, displayed reciprocal-square row estimate. Completes the corrected packing-to-Basel-sum argument, retaining the source factor π²/12.

### Explicit positive integer taper width

Node SV.2/integer-taper-choice; proposed declaration SieveTaper.floor_taper_bound.

If 0<δ≤1/2 and L=floor(1/δ)∈ℕ, then L>0 and L+[π²/(12δ²)]/L≤2/δ.

Proof route:

1. The floor inequalities give L≥2, Lδ≤1 and (L+1)δ>1. Set r=Lδ. Since L≥2, r>L/(L+1)≥2/3.
2. The native bound π<3.15 implies π²/12≤8/9. For 2/3≤r≤1, (r−2/3)(r−4/3)≤0, so r²−2r+8/9≤0.
3. Consequently r²+π²/12≤2r. Divide by positive rδ to obtain the stated taper bound.
4. This is a worker-derived explicit floor choice proving the source's desired bound, not a transcription of the source's nearest-integer choice to π/(√12δ). No claim is made that the choices coincide.

Acceptance checks:

- At δ=1/2, L=2; at δ=3/10, L=3.
- For δ=2 the floor is zero: the hypothesis δ≤1/2 cannot be dropped from this taper-width lemma.

Source: Bombieri, p.404, final integer choice after the row estimate. An explicit elementary refinement supplies the inequality needed by the proof without appealing to unchecked rounding optimization.

### Large sieve on the centered finite core

Node SV.2/separated-core; proposed declaration SieveTaper.largeSieve_centered.

Let 0<δ≤1/2, L=floor(1/δ), N∈ℕ, and x be δ-separated. In EuclideanSpace ℂ (Fin(2(N+L)+1)), write n_k=k−(N+L). If f_k=0 for |n_k|>N, then Σ_i|Σ_k f_k e(n_kx_i)|²≤‖f‖²(2N+2/δ).

The ambient width is this chosen L; the theorem does not silently alter an arbitrary input vector's dimension.

Proof route:

1. Set C=π²/(12δ²)≥0. Separation and circular-sine-square supply every nonzero sine required by tapered-row-large-sieve.
2. Cosecant-row-bound supplies its row hypotheses. Integer-taper-choice supplies L>0 and L+C/L≤2/δ.
3. Apply the inherited conditional theorem to the same f, then multiply the scalar inequality by the nonnegative squared norm.

Acceptance checks:

- N=0 is allowed; the single central coefficient is embedded in the stated larger native space.
- The number 2N is a centered half-width parameter, not yet an arbitrary original interval length.

Source: Bombieri, pp.403–404, estimate (5) after the separation sum. Composes the prior finite Gram/taper theorem with the now explicit separation estimate.

### Centered interval coefficient vector

Node SV.2/interval-vector; proposed declaration SieveTaper.intervalVector.

For H,L∈ℕ and a:Fin H→ℂ, put N=floor(H/2), o=L+1−(H mod 2), and D=2(N+L)+1. Define intervalVector H L a∈EuclideanSpace ℂ (Fin D) by coordinate k equal to Σ_{j∈Fin H} [k=o+j]a_j. The bracket is the ordinary finite indicator, not a new scalar or carrier.

Natural subtraction in o is nontruncating because H mod 2≤1≤L+1; no positivity of H or L is required.

Proof route:

1. Use the native EuclideanSpace constructor on the finite coordinate function; no new coefficient-vector space or quotient is introduced.
2. The expression k=o+j uses natural indices. This fixes which endpoint is padded when H is even; the four promoted interfaces establish the usable support, norm and phase properties.

Recorded uses:

- SV.2/separated-core and SV.2/additive-large-sieve: Places an arbitrary H-term coefficient family in exactly the centered ambient space demanded by the taper estimate.
- Bombieri p.402, parity and translation reduction: Keeps all coefficients, one even-length endpoint zero, and the unit Fourier phase associated to the integer translation.

The complete construction API is promoted to the four following lemma nodes:

- SieveTaper.intervalVector_apply: For k in the ambient finite index, (intervalVector H L a)_k=Σ_{j∈Fin H, k=o+j}a_j, with o=L+1−(H mod 2); promoted as interval-coordinate.
- SieveTaper.intervalVector_support: Every coordinate with |k−(floor(H/2)+L)|>floor(H/2) is zero; promoted as interval-support.
- SieveTaper.intervalVector_norm_sq: The native squared norm equals Σ_{j∈Fin H}|a_j|²; promoted as interval-norm.
- SieveTaper.intervalVector_fourier: For c=M+ceil(H/2), the original interval sum equals e(cx) times the centered Fourier sum; promoted as interval-phase.

Construction tests:

- interval_empty (degenerate): For every L and a:Fin 0→ℂ, intervalVector 0 L a is the zero native vector.
- interval_even_padding (computation): For a,b∈ℂ, intervalVector 2 1 (a,b)=(0,0,a,b,0) in the five-dimensional native Euclidean space.
- interval_odd_padding (computation): For a,b,c∈ℂ, intervalVector 3 1 (a,b,c)=(0,a,b,c,0) in the five-dimensional native Euclidean space.
- interval_zero_taper (compatibility): For a,b∈ℂ, intervalVector 2 0 (a,b)=(0,a,b). Padding itself is valid at L=0 even though the taper theorem requires L>0.

Acceptance checks:

- Its uses and four discriminating tests are specified below.

Source: Bombieri, p.402, replacing the interval length by 2N or 2N+1 and translating the exponential sum. Makes the source's implicit translation and zero padding a precise native-carrier construction.

### Coordinates of the centered interval vector

Node SV.2/interval-coordinate; proposed declaration SieveTaper.intervalVector_apply.

With N=floor(H/2), o=L+1−(H mod 2), each coordinate of intervalVector H L a is Σ_{j∈Fin H}[k=o+j]a_j.

H,L∈ℕ; no positivity assumption.

Proof route:

1. Unfold only the construction and the native Euclidean coordinate map; this is the canonical evaluation rule.
2. For fixed k there is at most one contributing j, because translation of natural indices is injective.

Acceptance checks:

- The four construction tests distinguish empty, even, odd and zero-width indexing.

Source: Bombieri, p.402, centered coefficient family. Promoted evaluation API consumed by all subsequent padding lemmas.

### Core support of the interval vector

Node SV.2/interval-support; proposed declaration SieveTaper.intervalVector_support.

For H,L∈ℕ, N=floor(H/2) and n_k=k−(N+L), |n_k|>N implies (intervalVector H L a)_k=0.

Proof route:

1. Write H=2N+ε with ε∈{0,1}. The offset is o=L+1−ε. For j<H, the occupied frequency is n_{o+j}=j+1−N−ε.
2. If ε=0, occupied frequencies are 1−N through N, so the −N endpoint is zero. If ε=1, they are −N through N. If H=0 there are no occupied coordinates.
3. Thus a coordinate outside [−N,N] cannot match o+j for any j; all indicator summands in interval-coordinate vanish.

Acceptance checks:

- H=2 occupies frequencies 0 and 1, not −1 and 0 under this translation.
- No separate cutoff assumption is passed to the final theorem.

Source: Bombieri, p.402, replacement by even/odd centered intervals. Spells out the parity-dependent support needed by the inherited taper pairing.

### Norm preservation under interval padding

Node SV.2/interval-norm; proposed declaration SieveTaper.intervalVector_norm_sq.

For every H,L∈ℕ and a:Fin H→ℂ, ‖intervalVector H L a‖²=Σ_j|a_j|².

Proof route:

1. The index map j↦o+j is injective. Using H=2N+ε and o=L+1−ε, verify 0≤o+j<2(N+L)+1 for every j<H; H=0 is empty.
2. Apply EuclideanSpace.norm_sq_eq. At each occupied coordinate, the indicator sum is exactly its unique coefficient; unoccupied coordinates contribute zero.
3. Reindex the finite coordinate-square sum along the injective map, using singleton fibers of native sum_fiberwise_of_maps_to. No cross terms and no multiplicities occur.

Acceptance checks:

- For complex (1,i) and H=2,L=1, the squared norm is 2.
- The conclusion includes H=0 and L=0.

Source: Bombieri, p.402, preservation of the coefficient-square sum under translation. Ensures the original source norm is unchanged by zero extension.

### Fourier translation of the padded interval

Node SV.2/interval-phase; proposed declaration SieveTaper.intervalVector_fourier.

For M∈ℤ, H,L∈ℕ, a:Fin H→ℂ, x∈ℝ, N=floor(H/2), c=M+floor((H+1)/2), one has Σ_j a_j e((M+j+1)x)=e(cx)Σ_k(intervalVector H L a)_k e((k−(N+L))x).

Proof route:

1. Expand interval-coordinate, interchange the finite sums and retain the unique coordinate k=o+j. The index is inside the ambient dimension by H=2N+ε.
2. The integer identity c+(o+j−(N+L))=M+j+1 holds for ε=0 and ε=1, since floor((H+1)/2)=N+ε.
3. The native additive character turns the frequency sum into a product. This is equivalently obtained from the existing subtraction/division law; multiply by the nonzero unit phase.
4. Keep the positive 2π Fourier phase and the original starting frequency M+1; do not replace c by M+N for odd H.

Acceptance checks:

- For H=2,M=−2,a=(1,i),x=1/4 the original sum is 0; changing the phase sign makes it 2i.
- For H=1,M=0,a=(1),x=1/4 the original sum is i; this distinguishes the starting frequency M+1 from M and the positive phase from the negative phase.

Source: Bombieri, p.402, translation and the resulting trigonometric polynomial. The exact complex equality, stronger than the modulus equality used in the final estimate.

### Cardinality above the circle diameter

Node SV.2/separation-card-small; proposed declaration SieveTaper.card_le_one_of_half_lt_separation.

If δ>1/2 and a finite real family is δ-separated modulo one, its indexing type has cardinality at most one.

Proof route:

1. Two distinct labels would have δ≤d(x_i−x_j)≤1/2 by the native half-period bound, a contradiction.
2. Hence all labels are equal; the finite type is empty or a singleton.

Acceptance checks:

- For δ=2 a singleton is allowed, while floor(1/δ)=0.
- This does not infer δ≤1/2 from a vacuous separation condition.

Source: Bombieri, p.401, separated-point hypothesis of the main theorem. Makes the degenerate finite-family branch explicit so that the final theorem keeps its unrestricted positive δ.

### Bombieri's additive large sieve

Node SV.2/additive-large-sieve; proposed declaration SieveTaper.additive_largeSieve.

Let M∈ℤ, H∈ℕ, a:Fin H→ℂ, δ>0 and x:ι→ℝ be a finite δ-separated family modulo one. Then Σ_i|Σ_{j=0}^{H−1}a_j e((M+j+1)x_i)|²≤(H+2/δ)Σ_{j=0}^{H−1}|a_j|².

Empty coefficient and point families are allowed. No restriction δ≤1/2 or normalization of coefficients is imposed.

Proof route:

1. When 0<δ≤1/2, set N=floor(H/2), L=floor(1/δ), and f=intervalVector H L a. Its support is interval-support, so separated-core applies.
2. Use interval-phase and norm one of e(cx) to identify each original summand; interval-norm identifies the coefficient-square sum. Since 2floor(H/2)≤H, increase the nonnegative scalar bound to H+2/δ.
3. When δ>1/2, separation-card-small leaves at most one point. Native norm_sum_le gives |Σ_j a_j e(...)|≤Σ_j|a_j|. Squared finite Cauchy–Schwarz against the constant one gives its square at most HΣ_j|a_j|²; this is bounded by the claimed expression.
4. The empty point family gives zero on the left. H=0 also gives zero, so all branches include both degenerate cases.

Acceptance checks:

- The theorem has the original interval length H, not the centered N.
- It is Bombieri's H+2/δ constant, not the sharper H−1+1/δ large sieve and not a multiplicative-character or quadratic-symbol large sieve.

Source: Bombieri, p.401, main Theorem; pp.402–404, complete finite proof. Finishes the source theorem through explicit separation, integer taper and parity-preserving translation.

### Baseline, granularity and ownership

The native UnitAddCircle norm, half-period bound and nearest-integer rounding supply the representatives and the antipodal convention. Native Jordan and Basel results supply the trigonometric lower bound and infinite reciprocal-square sum; this packet does not redevelop either. Native finite fiber sums and cardinality inequalities organize the two-point bins and injective zero extension. The explicit floor width is an elementary refinement of the source proof, not a claim that Bombieri printed that choice.

All four consumed intervalVector interfaces are separate lemma nodes. The construction is just a specified finite function in the existing EuclideanSpace; it has no new vector-space, topology, norm or character API. Its even and odd padding tests distinguish the two offsets, and the zero-width test separates this valid constructor from the positive-width taper theorem. The original interval theorem follows only after the norm and exact complex phase identities, so no reindexing or parity assumption is hidden inside the final estimate.

The additive large sieve is owned by SV.2 under RS-07 and supplies the relevant AN.3 direction. It does not assert the sharp H−1+1/δ constant, a multiplicative-character inequality, a quadratic-symbol bilinear estimate, the polynomial Farey analogue or the arithmetic hypotheses of Bennett–Siksek's application. No new cross-roadmap request is needed for this finite additive theorem.

## SV.2: primitive Dirichlet-character large sieve

The multiplicative estimate uses every positive integer modulus through Q. Its left side contains only primitive Dirichlet characters, with the weight q/φ(q). For a complex coefficient family a indexed by an H-term interval, the new theorem is

\[
\sum_{1\le q\le Q}\frac{q}{\varphi(q)}
 \sum_{\chi\;\mathrm{primitive}\;(\mathrm{mod}\;q)}
 \left|\sum_{j=0}^{H-1}a_j\chi(M+j+1)\right|^2
 \le (H+2Q^2)\sum_{j=0}^{H-1}|a_j|^2.
\]

This is the Bombieri–Davenport reduction of Kedlaya §§16.1–16.2 applied to the additive theorem already specified in this packet. Kedlaya states a sharper constant H−1+Q² using a sharper additive theorem. The displayed H+2Q² is the constant this dependency chain proves. There is no inferred improvement in that scalar constant. The finite estimates allow Q=0 and H=0, arbitrary complex coefficients and negative interval starts.

Use the existing DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate, its inverse character and the existing gaussSum. On nonunits the character is zero. The trivial ring q=1 is essential: its unique residue is a unit, its unique character is primitive, its totient is one and its Gauss sum is one. Thus modulus one contributes the ordinary square modulus of the total coefficient sum. An assertion that every character vanishes at residue zero would be wrong in this case.

The additive family is indexed by native residue units, not a new Farey sequence. At modulus q the representative val(u)/q lies in [0,1). Rational uniqueness identifies collisions, and an integer numerator gives separation after subtracting the nearest integer. This controls the circle distance, including wraparound. CA.2 owns the ordered Farey sequence with both endpoints 0 and 1; this slice does not reconstruct that object or its neighbour theory.

The Gauss normalization is also a library adaptation. At the pin the finite Fourier transform uses the negative phase and satisfies D²f=q·f(−·). For primitive χ, its transform is χ⁻¹(−k)τ(χ). Apply this formula twice and compare with D²χ at −1. Native conjugation of the Gauss sum then gives τ(χ)conjugate(τ(χ))=q. This works at nonsquarefree composite moduli; FF.1's finite-field norm theorem and FF.2's squarefree polynomial-quotient theorem have different hypotheses and are not duplicated here.

At a fixed modulus, first use the primitive Gauss identity. Only after converting to Fourier values may the primitive character set be enlarged to all characters by nonnegativity. Orthogonality then gives an exact factor φ(q), which cancels the denominator of q/φ(q). Using the primitive identity directly for all characters is invalid: the principal character modulo four has Gauss sum zero. The eight declarations below expose each normalization, support and positivity step.


### Circular separation of reduced fractions

For natural a,b,p,q,Q with 0<p,q≤Q, a<p, b<q, gcd(a,p)=gcd(b,q)=1 and (a,p)≠(b,q), one has ‖(a/p−b/q:UnitAddCircle)‖≥1/Q².

Assumptions and conventions: Use e(t)=(Real.fourierChar t:ℂ)=exp(2πit), the existing UnitAddCircle norm, and the native DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate and its inverse. There is no new Fourier, character or Farey carrier.

Proof route:

1. Put t=a/p−b/q and z=round(t). Since both fractions lie in [0,1), t lies strictly between −1 and 1. If t were an integer, it would therefore be zero. Equality of the rational fractions would force a=b and p=q by the native reduced-fraction uniqueness theorem, contradicting the hypothesis.
2. The integer D=aq−bp−zpq is consequently nonzero. Thus |D|≥1. Clear only the positive denominators p and q to obtain |t−z|=|D|/(pq)≥1/(pq).
3. The native circle-norm formula identifies |t−z| with the required norm. Since pq≤Q² and Q>0, reciprocal monotonicity gives the result. This argument includes wraparound, not just the linear separation of real fractions.

Acceptance instances:

- The sole reduced pair with numerator zero is (0,1); the endpoint 1/1 is excluded by a<p.
- 0/1 and 3/4 have circle distance 1/4 although their linear distance is 3/4.
- Dropping coprimality allows labels (1,2) and (2,4) at the same point.

Source: [Kedlaya, Chapter 16](https://kskedlaya.org/ant/chap-largesieve2.html), §16.1, (16.1.1)–(16.1.2). Expands the integer-numerator spacing argument. Rat.div_int_inj supplies uniqueness; no Farey sequence definition, ordering or neighbour theorem is repeated.

Prerequisites: mathlib:Rat.div_int_inj, mathlib:UnitAddCircle.norm_eq.

### Additive large sieve over reduced residues

Σ_{1≤q≤Q}Σ_{u∈(Z/qZ)×}|S(val(u)/q)|² ≤ (H+2Q²)Σ_{j<H}|a_j|².

Assumptions and conventions: Use e(t)=(Real.fourierChar t:ℂ)=exp(2πit), the existing UnitAddCircle norm, and the native DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate and its inverse. There is no new Fourier, character or Farey carrier. M is any integer, H and Q are natural numbers, and a:Fin H→ℂ is arbitrary. Write n_j=M+j+1 and S(t)=Σ_{j<H}a_j e(n_j t). Empty intervals and Q=0 are permitted.

Proof route:

1. For Q>0 index the family by the native dependent sum of q∈Fin Q and u∈(ZMod(q+1))ˣ, assigning the real point val(u)/(q+1). Native residue bounds and unit coprimality give the hypotheses of reduced-fraction-separation.
2. Distinct labels give distinct reduced pairs: equal moduli and equal natural representatives imply equal residues and then equal units. Thus the family is separated by δ=Q⁻².
3. Apply the inherited additive_largeSieve with this positive δ. The additive companion of Finset.prod_sigma rewrites its single family sum as the displayed double sum. Substitute 2/δ=2Q².
4. For Q=0 the modulus indexing type is empty and the right side is nonnegative. H=0 is already admitted by the inherited theorem.

Acceptance instances:

- Modulus one contributes its single unit at phase zero; it is not discarded.
- The source Theorem 16.1 has H−1+Q². This node deliberately uses the weaker H+2Q² supported by the inherited additive theorem.

Source: [Kedlaya, Chapter 16](https://kskedlaya.org/ant/chap-largesieve2.html), §16.1, Theorem 16.1 and its proof. Same reduced-residue specialization, with an explicitly different inherited additive constant; no claim to have decomposed the sharp additive input.

Prerequisites: SieveMethodsAndPrimePatterns:SV.2/reduced-fraction-separation, SieveMethodsAndPrimePatterns:SV.2/additive-large-sieve, mathlib:ZMod.val_lt, mathlib:ZMod.val_coe_unit_coprime, mathlib:Finset.prod_sigma.

### Integer phase of the standard residue character

For u∈ZMod q and n∈ℤ, stdAddChar(u·n)=e(n·val(u)/q).

Assumptions and conventions: Use e(t)=(Real.fourierChar t:ℂ)=exp(2πit), the existing UnitAddCircle norm, and the native DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate and its inverse. There is no new Fourier, character or Farey carrier. q is a positive natural number. The finite ring ZMod q and its unit group use their native instances, including the trivial ring q=1. Write φ(q)=q.totient and τ(χ)=gaussSum χ ZMod.stdAddChar.

Proof route:

1. Replace u by the integer cast of its native natural representative. Combine the residue casts into the cast of the integer product val(u)n.
2. Apply the native standard-character formula at that integer product and the real Fourier-character formula. Rearrange scalar products in the complex exponential. This also handles negative n and nonunit u.

Acceptance instances:

- At q=4,u=1,n=−1 the value is −i, detecting a sign reversal.
- At q=1 every phase is one, including the unique residue zero.

Source: [Kedlaya, Chapter 16](https://kskedlaya.org/ant/chap-largesieve2.html), §16.2, the exponential convention in τ and S. Explicit normalization adapter between two existing character APIs; verified by a complete temporary Lean proof.

Prerequisites: mathlib:ZMod.stdAddChar_coe, mathlib:Real.fourierChar_apply.

### Squared norm of a primitive Dirichlet Gauss sum

For a primitive Dirichlet character χ modulo q>0, |τ(χ)|²=q.

Assumptions and conventions: Use e(t)=(Real.fourierChar t:ℂ)=exp(2πit), the existing UnitAddCircle norm, and the native DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate and its inverse. There is no new Fourier, character or Farey carrier. q is a positive natural number. The finite ring ZMod q and its unit group use their native instances, including the trivial ring q=1. Write φ(q)=q.totient and τ(χ)=gaussSum χ ZMod.stdAddChar. χ.IsPrimitive is required; χ≠1 alone is not a substitute at composite modulus.

Proof route:

1. Conductor invariance under inverse makes χ⁻¹ primitive. The native finite Fourier formula gives Dχ(k)=χ⁻¹(−k)τ(χ), using the unnormalized negative-phase DFT.
2. Apply the native DFT twice and evaluate at −1. Its inversion formula gives qχ(1)=q. Factoring constants and commuting reflection with DFT identifies the same value as χ(−1)τ(χ⁻¹)τ(χ).
3. The native Gauss conjugation formula gives conjugate(τ(χ))=gaussSum χ⁻¹ (stdAddChar⁻¹). The inverse additive character is its shift by −1. The native primitive shift theorem identifies this as χ(−1)τ(χ⁻¹).
4. Combine the two equalities and take real parts of τ(χ)conjugate(τ(χ))=q. This proves the square-norm formula without a finite-field assumption, a squarefree modulus assumption or a new Parseval theorem.

Acceptance instances:

- For q=1 the unique character is primitive and its Gauss sum is 1. Treating zero as a nonunit in this trivial ring would break the statement.
- The principal character modulo 4 has Gauss sum 0 and does not satisfy the conclusion.

Source: [Kedlaya, Chapter 16](https://kskedlaya.org/ant/chap-largesieve2.html), §16.2, proof of Theorem 16.2, |τ(χ)|=√q. The source cites the norm formula; the packet supplies its complete route through pinned DFT inversion and primitive character formulas. The algebraic product and real norm were verified by temporary Lean proofs.

Prerequisites: mathlib:DirichletCharacter.conductor_inv, mathlib:DirichletCharacter.IsPrimitive.fourierTransform_eq_inv_mul_gaussSum, mathlib:ZMod.dft_dft, mathlib:ZMod.dft_mul_const, mathlib:ZMod.dft_comp_neg, mathlib:star_gaussSum_eq, mathlib:AddChar.inv_mulShift, mathlib:gaussSum_mulShift_of_isPrimitive, mathlib:RCLike.mul_conj.

### Gauss expansion of a finite character sum

For primitive χ modulo q>0, τ(χ⁻¹)Σ_{j<H}a_jχ(n_j)=Σ_{u∈(Z/qZ)×}χ⁻¹(u)S(val(u)/q).

Assumptions and conventions: Use e(t)=(Real.fourierChar t:ℂ)=exp(2πit), the existing UnitAddCircle norm, and the native DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate and its inverse. There is no new Fourier, character or Farey carrier. q is a positive natural number. The finite ring ZMod q and its unit group use their native instances, including the trivial ring q=1. Write φ(q)=q.totient and τ(χ)=gaussSum χ ZMod.stdAddChar. M is any integer, H and Q are natural numbers, and a:Fin H→ℂ is arbitrary. Write n_j=M+j+1 and S(t)=Σ_{j<H}a_j e(n_j t). Empty intervals and Q=0 are permitted. χ.IsPrimitive; Q is unused in this single-modulus statement.

Proof route:

1. Apply the native primitive Gauss-shift theorem to χ⁻¹ and the residue n_j. Inversion of χ⁻¹ yields χ(n_j), even when n_j is not a unit.
2. Multiply the equality by a_j and sum over the finite interval. Expand the existing Gauss sum and interchange the two finite sums.
3. Terms indexed by nonunits vanish because χ⁻¹ vanishes there. Reindex the remaining residues by the native unit group; this is a bijection onto the unit residues.
4. Apply standard-character-phase at each unit and each integer n_j. Collect the inner finite sum S. Multiplication by τ avoids making an unproved nonzero-denominator cancellation.

Acceptance instances:

- The coefficients can be complex, and M can be negative.
- The formula must hold at nonunit frequencies. A formula proved only for gcd(n_j,q)=1 would be insufficient for an arbitrary interval.

Source: [Kedlaya, Chapter 16](https://kskedlaya.org/ant/chap-largesieve2.html), §16.2, proof of Theorem 16.2, primitive Gauss expansion. Finite weighted consequence of the already implemented shift formula; inverse characters express conjugation without a competing convention.

Prerequisites: SieveMethodsAndPrimePatterns:SV.2/standard-character-phase, mathlib:DirichletCharacter.conductor_inv, mathlib:gaussSum, mathlib:gaussSum_mulShift_of_isPrimitive, mathlib:MulChar.map_nonunit.

### Parseval identity over Dirichlet characters

For arbitrary F:(ZMod q)ˣ→ℂ, Σ_{χ mod q}|Σ_u χ⁻¹(u)F(u)|²=φ(q)Σ_u|F(u)|², summing over all Dirichlet characters modulo q.

Assumptions and conventions: Use e(t)=(Real.fourierChar t:ℂ)=exp(2πit), the existing UnitAddCircle norm, and the native DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate and its inverse. There is no new Fourier, character or Farey carrier. q is a positive natural number. The finite ring ZMod q and its unit group use their native instances, including the trivial ring q=1. Write φ(q)=q.totient and τ(χ)=gaussSum χ ZMod.stdAddChar.

Proof route:

1. Expand each squared norm as its complex product with its conjugate. Finite interchange gives a sum over pairs u,v of F(u)conjugate(F(v)) multiplied by Σχχ⁻¹(u)χ(v).
2. On units the inverse-character value is χ(u⁻¹). Apply the pinned character orthogonality formula with first argument u. Complex numbers have the required roots of unity; q>0 supplies the finite residue and character instances.
3. Only the diagonal u=v survives, with coefficient φ(q). Units.val is injective, so equality of residues is equality of unit indices. Take real parts to obtain the exact real square-norm identity.

Acceptance instances:

- For q=4 and F≡1 on the two units, the left side is 4, equal to 2·2. Using q instead of φ(q) gives the wrong normalization.
- At q=1 the equality is |F(1)|²=|F(1)|²; no nontriviality of ZMod q is assumed.

Source: [Kedlaya, Chapter 16](https://kskedlaya.org/ant/chap-largesieve2.html), §16.2, character-orthogonality step in Theorem 16.2. Finite energy restatement of the existing orthogonality theorem on the unit group, not a new character theory or general Fourier transform.

Prerequisites: mathlib:DirichletCharacter.sum_char_inv_mul_char_eq, mathlib:MulChar.star_apply', mathlib:MulChar.inv_apply, mathlib:RCLike.mul_conj.

### Primitive character energy at one modulus

(q/φ(q))Σ_{χ primitive mod q}|Σ_{j<H}a_jχ(n_j)|² ≤ Σ_{u∈(Z/qZ)×}|S(val(u)/q)|².

Assumptions and conventions: Use e(t)=(Real.fourierChar t:ℂ)=exp(2πit), the existing UnitAddCircle norm, and the native DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate and its inverse. There is no new Fourier, character or Farey carrier. q is a positive natural number. The finite ring ZMod q and its unit group use their native instances, including the trivial ring q=1. Write φ(q)=q.totient and τ(χ)=gaussSum χ ZMod.stdAddChar. M is any integer, H and Q are natural numbers, and a:Fin H→ℂ is arbitrary. Write n_j=M+j+1 and S(t)=Σ_{j<H}a_j e(n_j t). Empty intervals and Q=0 are permitted.

Proof route:

1. For each primitive χ, take squared norms of finite-gauss-expansion. The inverse is primitive, so its Gauss square norm is q. Divide by positive φ(q), obtaining the source weighted identity.
2. Sum these identities over the finite subset of primitive characters. On the Fourier side only, enlarge that subset to all characters, since every squared modulus is nonnegative.
3. Apply character-parseval to F(u)=S(val(u)/q). Cancel φ(q)>0. The arithmetic character sum itself is never extended to imprimitive χ using the primitive Gauss formula.

Acceptance instances:

- The factor is q/φ(q); neither it nor the primitive filter is suppressed.
- At modulus one both sides equal |Σ_j a_j|². H=0 gives zero.

Source: [Kedlaya, Chapter 16](https://kskedlaya.org/ant/chap-largesieve2.html), §16.2, weighted equality and enlargement to all characters. Separates the primitive Gauss identity from the positivity step, preventing an invalid application of that identity to imprimitive characters.

Prerequisites: SieveMethodsAndPrimePatterns:SV.2/finite-gauss-expansion, SieveMethodsAndPrimePatterns:SV.2/primitive-gauss-norm, SieveMethodsAndPrimePatterns:SV.2/character-parseval, mathlib:Nat.totient_pos.

### Primitive-character large sieve

Σ_{1≤q≤Q}(q/φ(q))Σ_{χ primitive mod q}|Σ_{j<H}a_jχ(M+j+1)|² ≤ (H+2Q²)Σ_{j<H}|a_j|².

Assumptions and conventions: Use e(t)=(Real.fourierChar t:ℂ)=exp(2πit), the existing UnitAddCircle norm, and the native DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate and its inverse. There is no new Fourier, character or Farey carrier. M is any integer, H and Q are natural numbers, and a:Fin H→ℂ is arbitrary. Write n_j=M+j+1 and S(t)=Σ_{j<H}a_j e(n_j t). Empty intervals and Q=0 are permitted.

Proof route:

1. Sum primitive-modulus-energy over moduli 1 through Q, represented in the seed by q∈Fin Q with actual modulus q+1.
2. Apply reduced-fraction-large-sieve to the resulting double sum of Fourier values. Its constant is exactly H+2Q².
3. When Q=0 or H=0 the appropriate sums are empty. No asymptotic range, primality of the moduli, coprimality of the frequencies, or restriction on the complex coefficients is introduced.

Acceptance instances:

- This is the Bombieri–Davenport reduction with the inherited Bombieri constant. It does not claim the source sharp H−1+Q² constant.
- The theorem estimates primitive characters of every positive modulus, including nonsquarefree moduli and modulus one. It is not a quadratic-symbol or polynomial-function-field large sieve.

Source: [Kedlaya, Chapter 16](https://kskedlaya.org/ant/chap-largesieve2.html), §§16.1–16.2, Theorems 16.1–16.2 and full reduction proof. Closes the multiplicative reduction from the already decomposed additive estimate; the source sharper additive input remains a separate gap.

Prerequisites: SieveMethodsAndPrimePatterns:SV.2/primitive-modulus-energy, SieveMethodsAndPrimePatterns:SV.2/reduced-fraction-large-sieve.

### Boundary cases and the source application

Ten additional suggested examples distinguish modulus one, the imprimitive principal character modulo four, the totient normalization, unreduced duplicate fractions, circular wraparound, the negative integer phase and both empty ranges. They supplement the eighteen inherited construction tests. This slice introduces no definition or construction, so it requires no new carrier API. All inherited construction APIs and their examples remain in the seed.

RS-07 assigns this large-sieve estimate to SV.2, supplying the AN.3 direction. It is not the quadratic-symbol bilinear estimate needed by arithmetic statistics or the polynomial Farey estimate needed over function fields. Those exact consumer interfaces remain open. The retained Gram theorem also does not itself prove the character-correlation or von Mangoldt norm estimates in the Bennett–Siksek application.

The complete live Chapter 16 HTML was read. Its separate §16.3 application is not part of the new proof chain. Source findings E12–E18 are scoped to those acquired bytes and await independent review:

- E12 collects inconsistent dummy indices and a constant/variable typo.
- E13 records that the local energy lemma needs coefficients vanishing on excluded residue classes. With coefficients one at both 1 and 2, excluding residue zero modulo two gives a printed inequality 4≤0. Truncate the coefficients to survivors first, and identify its value at phase zero with the desired sifted sum. Set the prime density to zero outside the sieving set, or restrict the denominator sum accordingly.
- E14 corrects the application proof's reference: its upper bound for additive reduced-residue energy comes from Theorem 16.1. The multiplicative Theorem 16.2 does not give that bound in the needed direction.
- E15 corrects misplaced braces in the CRT phase. The required phase is the sum a₁/q₁+a₂/q₂.
- E16 corrects the limit of (p−1)/(p+1) to one. The lower bound used in the proof survives this correction.
- E17 records ordered-tuple overcounting and the unrestricted use of ε⁻¹ as an integer tuple length. For ε=1/2 and N=100000, the source sum counts 36745 representations but there are only 35819 smooth integers. Two exact integer methods verify the discrepancy. A multiplicity bound and a valid integer choice are needed; the intended Linnik theorem is not refuted.
- E18 restricts the least positive quadratic nonresidue definition to odd primes, or requires a separate convention at two, since every residue modulo two is a square.

The packet records bounded correction searches and the acquired version hash. It makes no exhaustive novelty claim, no finding against the uncollated 2007 lecture notes, and no assertion that the intended sieve or Linnik theorem is false. Theorem 16.4, the corrected local energy lemma, Linnik's theorem and the exercises still need a complete source decomposition before they can become suppliers.


## Remaining source decomposition and ownership

### SV.0: general local conditions and analytic remainder estimates

The new finite-family and residue constructors bridge Kedlaya's arbitrary local conditions to the pinned divisibility carrier, preserving every indexed weight and handling zero-density local conditions. The seven parameters in the source's n(10−n) example retain total mass seven despite having only four distinct image values. Concrete polynomial root descriptions, CRT residue counts and uniform interval discrepancy estimates still require application-specific proofs; they are not consequences merely of this representation.

Sieve dimension requires its actual logarithmic inequality, constants, quantifiers and range. A family-level remainder estimate requires an actual family of samples and a bound uniform in the intended parameters. Both remain targets. The finite cutoff lemma is the interface consuming such an estimate, not its proof.

The remaining Chapter 11 route includes Rankin's estimate, the weighted divisor-count estimate, its tail estimate, the quantitative Eratosthenes theorem and a justified Brun application. Their exercises and analytic estimates require decomposition. AN.0 is retired under accepted RS-07. Import its existing arithmetic-function and summation APIs directly from the pinned library; any genuinely missing analytic input must be assigned to its surviving owner at an exact consuming statement. None of the twenty finite SV.0 nodes needs an unresolved analytic supplier. The labels themselves can greatly exceed the original sample bound: 33 has label 1155 for the bad residues 0 and −2 at primes 3,5,7,11. Thus the representation does not repair or assume the missing linear cutoff in source finding E7.

### SV.1: Brun and Selberg

Use the existing quadratic coefficient construction and diagonalized main form. The remaining targets are the optimizer and its hypotheses, Brun combinatorial weights, fundamental-lemma estimates in proved ranges, applications, and explicit parity limitations. Read Kedlaya Chapters 12–14 and the continuation of Heath-Brown's Section 2 before specifying these missing declarations. Reading through Lemma 2.1's statement does not supply its proof.

### SV.2: large sieves and bilinear decompositions

SV.2 owns additive and multiplicative large-sieve inequalities, duality, primitive-character reduction, Vaughan identities and Type I/II decompositions. Accepted RS-07 puts the Vaughan/bilinear direction from SV.2 into AnalyticNumberTheory:AN.3; the old reverse prerequisite must not be reintroduced.

The routed Bennett–Siksek item PAPER-BENNETT-SIKSEK-20/45 is supplied by the finite Gram theorem above. Bombieri's 1971 additive theorem with original interval length H+2/δ is now decomposed: endpoint-safe circular bins, the cosecant row bound, an explicit positive integer taper choice, and exact parity/translation/padding are all nodes. The continuation below supplies the primitive-character version with H+2Q². It does not supply the sharper H−1+1/δ additive or H−1+Q² multiplicative form, or any consumer-specific arithmetic correlation estimate.

Chapter 16 has been read completely and its primitive-character reduction is decomposed. The final continuation below now decomposes Chapter 18's finite Vaughan route, not its analytic bilinear estimates. Read Chapter 15 for the remaining sharp additive input and squared-inequality duality adapter; native adjoint/operator-norm duality is already built. Chapter 16's residue-exclusion and Linnik applications remain undecomposed. The quadratic-symbol bilinear estimate needed by ArithmeticStatistics:ST.5 and the polynomial Farey estimate needed by FiniteFieldsAndCharacterSums:FF.1 remain distinct consumer needs; finite Gram and Vaughan identities do not discharge their analytic hypotheses.

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


Bombieri's [published paper](https://www.impan.pl/en/publishing-house/journals-and-series/acta-arithmetica/all/18/0/97707/a-note-on-the-large-sieve), pp.401–404, was read completely in the publisher scan. The packet separates Proposition 1, the finite taper/kernel construction, circular packing, the scalar taper choice and exact interval reduction into declaration-sized statements. The coefficient display after (4), p.402, prints a global double sum of squared Gram moduli in the denominator. The proof requires the first-power sum over the fixed row. At x=1,y=2 the printed coefficient is 1/8, yielding defect 9/16, whereas the corrected coefficient 1/2 yields zero. This is an unreviewed misprint finding about the proof choice, not a challenge to the proposition. The [volume's published errata](https://impan.pl/en/publishing-house/journals-and-series/acta-arithmetica/all/18/0/97710/errata-acta-arithmetica-xviii-1971) were read completely and contain no correction to p.402; bounded title/correction searches found none. No exhaustive novelty claim is made.

The published Bombieri pp.401–404 were reread visually from the same acquired primary scan for the separation and interval argument. The earlier taper reading also included the complete volume errata; its attempted fresh publisher download returned HTTP 403. No new download or new errata search is claimed here. E10 and E11 are retained unreviewed findings against that scan. Bounded title/erratum/kernel searches and the atlas source register found no matching correction; the 1975 almost-prime corrigendum is a different paper. The volume errata correct pp.171–178 and 278, not pp.403–404. No author contact or exhaustive novelty claim is made.

The relevant [Bennett–Siksek publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf) reading for this sieve slice is §8.2, printed pp.379–380, including Theorem 7 and its application. Its arithmetic application motivates the diagonal/off-diagonal consequence but is not certified complete here. Hashes, versions and exact reading boundaries appear in the packet.

## Inherited primitive-character checkpoint validation

The following counts and checks describe the preceding checkpoint. Current Vaughan totals and checks appear at the end of this document and in the handoff.

The packet has 59 nodes: four constructions, forty-one lemmas and fourteen theorems; twenty-one API items, six promoted into main lemma nodes; eighteen construction tests; sixty-eight suggested examples; eleven planets, five in SV.0 and six in SV.2; 122 baseline references; six gaps and no supplier requests. All 51 inherited node objects, 101 baseline entries, eleven findings and four version objects are preserved exactly. Eight nodes, 21 baseline references, one source/version and seven unreviewed source findings are added. All implementation statuses remain unchecked; SV.0–SV.2 remain partial and SV.3–SV.5 remain not_read.

The suggested file compiles against Lean 4.34.0-rc2 and the pinned imports with 142 expected proof-placeholder warnings, no errors and no other warnings. All 8482 reached Mathlib source files match the pin byte for byte. Three complete temporary Lean proofs independently validate the primitive Gauss product, its squared norm and the phase adapter; their printed axiom lists contain no proof-placeholder axiom, and they call no planned declaration. These probes are not submitted as implementation.

Exact rational regression checks cover 6979 reduced-pair entries and 1062945 circular-spacing comparisons through Q=40. Exact cyclotomic-quotient polynomial arithmetic covers all 46 Dirichlet characters for moduli 1 through 12, 27 primitive Gauss norms, 663 shifts including nonunit frequencies, 322 phase comparisons, 36 Parseval cases, 1215 finite Gauss expansions, 540 single-modulus bounds and 585 complete large-sieve cases. Nine mutations distinguish the rejected hypotheses, normalizations and source-proof steps. These are finite regression checks, not general proofs.

The packet checker and intake path checks pass. Earlier finite-sieve, residue, Gram, taper and separation regressions remain inherited evidence; this continuation does not claim to have rerun them. Only the four authorized deliverables are submitted. Completing this multiplicative reduction does not close SV.2 or the roadmap.

## SV.2: finite Vaughan decomposition

This continuation exports the algebraic identity needed by SV.3 and the prime-weighted ES.4 branch. It does not prove Type I/II cancellation, a rectangle approximation, or a prime-distribution theorem. The carrier, convolution ring, Möbius function and von Mangoldt function already exist in Mathlib. The only new construction is the incomplete logarithm in that carrier.

U,V,N,L,M,n,m,ℓ are natural numbers. Divisors are the native positive divisor finsets; n=0 has no divisors. μ is the native integer Möbius function, Λ the native real von Mangoldt function, and log is the real logarithm with its native value at zero. Write λ_V for incompleteLog V. All cutoffs are inclusive below and strict above. Ioc(a,b) means a<k≤b and is empty when b≤a. No positivity of U or V is needed for the finite identities.

The source is [Kedlaya, live Chapter 18](https://kskedlaya.org/ant/chap-bombieri2.html), equations (18.2.1)–(18.2.2) and Exercises 18.4.1–2, collated with the [author's revised 2007 handout](https://kskedlaya.org/18.785/bombieri2.pdf), p.3, (3)–(4). The finite extensions below are derived explicitly from the native convolution identities. Natural cutoffs avoid ambiguous real endpoints.

### Incomplete logarithm

Node SV.2/incomplete-log; proposed declaration SieveVaughan.incompleteLog.

Construct λ_V:ArithmeticFunction ℝ by λ_V(n)=Σ_{d|n,V<d}Λ(d). This is a cutoff divisor sum, not log(n/V) and not a multiplicative function.

Proof route:

1. Use the existing zero-preserving arithmetic-function carrier. The finite formula is zero at n=0 because the native divisor finset is empty.

2. For the convolution proof, let h_V(n) be Λ(n) when V<n and zero otherwise, as a local zero-preserving function. Native convolution with ζ gives λ_V=h_V*ζ by coe_mul_zeta_apply. This local abbreviation is not a new exported truncation carrier.

3. The source uses V=floor(x^(1/5)); natural V keeps every endpoint exact and admits independent U,V. Its subtraction formula is established by the next lemma.

Acceptance cases:

- Keep every prime-power divisor, not just prime divisors.

- At V=0 the result is the full logarithm, while λ_V(n)=0 for n≤V.

Prerequisites: mathlib:ArithmeticFunction, mathlib:ArithmeticFunction.vonMangoldt, mathlib:ArithmeticFunction.coe_mul_zeta_apply.

Consumed API:

- SieveVaughan.incompleteLog_apply: λ_V(n)=Σ_{d|n,V<d}Λ(d).

- SieveVaughan.incompleteLog_eq_sub: λ_V(n)=log n−Σ_{d|n,d≤V}Λ(d); promoted as incomplete-log-sub.

- SieveVaughan.incompleteLog_eq_zero_of_le: n≤V implies λ_V(n)=0; promoted as incomplete-log-support.

- SieveVaughan.incompleteLog_bounds: 0≤λ_V(n)≤log n for every natural n; promoted as incomplete-log-bounds.

- SieveVaughan.moebius_mul_incompleteLog: (μ*λ_V)(n)=Λ(n) if V<n, and zero otherwise; promoted as moebius-incomplete-log.

- SieveVaughan.incompleteLog_zero_cutoff: λ_0 is the existing arithmetic logarithm.

Uses:

- Kedlaya §18.2 (18.2.2); SV.2/vaughan-type-i-ii: A single coefficient separates the small and large Möbius factors without changing the exact summation domain.

- SV.3 averaged prime distribution and ES.4 prime-weighted circle-method branch: The exported finite weighted identity allows arbitrary complex weights. Progression and Fourier weights specialize it; their analytic bounds stay with their existing owners.

- SV.2/vaughan-coefficient-energy: Nonnegativity and the logarithmic upper bound provide the real coefficient energy input for subsequent Cauchy–Schwarz/large-sieve estimates.

Construction tests:

- incomplete_zero_argument (degenerate): λ_2(0)=0, as required by the existing carrier.

- incomplete_cutoff_boundary (non-example): λ_4(4)=0; replacing V<d by V≤d would give log 2.

- incomplete_prime_power (computation): λ_2(4)=log 2, not log 4: the retained divisor is 4.

- incomplete_composite (computation): λ_2(12)=log 2+log 3, retaining the prime-power divisors 4 and 3.

- incomplete_zero_cutoff (compatibility): λ_0(n)=log n for every n, including zero and one.

### Subtracting the short von Mangoldt divisor sum

Node SV.2/incomplete-log-sub; proposed declaration SieveVaughan.incompleteLog_eq_sub.

λ_V(n)=log n−Σ_{d|n,d≤V}Λ(d).

Proof route:

1. Partition the finite positive divisors into V<d and d≤V; these are complementary predicates, including equality.

2. Apply the native vonMangoldt_sum to the unfiltered sum and rearrange the two real finite sums. At n=0 all divisor sums and the native real logarithm vanish.

Acceptance cases:

- For n=4,V=2 the subtraction removes Λ(1)+Λ(2), leaving Λ(4).

- No analytic convergence or inversion theorem is needed.

Prerequisites: SieveMethodsAndPrimePatterns:SV.2/incomplete-log, mathlib:ArithmeticFunction.vonMangoldt_sum.

### Vanishing below the incomplete-log cutoff

Node SV.2/incomplete-log-support; proposed declaration SieveVaughan.incompleteLog_eq_zero_of_le.

If n≤V then λ_V(n)=0.

Proof route:

1. Every divisor in the defining sum satisfies d≤n by Nat.divisor_le.

2. Under n≤V, the additional strict inequality V<d is impossible; the filtered finset is empty. This argument includes n=0.

Acceptance cases:

- The equality case n=V must vanish.

- This is only a sufficient condition: some n>V also have λ_V(n)=0.

Prerequisites: SieveMethodsAndPrimePatterns:SV.2/incomplete-log, mathlib:Nat.divisor_le.

### Pointwise incomplete-log coefficient bounds

Node SV.2/incomplete-log-bounds; proposed declaration SieveVaughan.incompleteLog_bounds.

For every V,n, 0≤λ_V(n) and λ_V(n)≤log n.

Proof route:

1. Every summand in the tail formula is nonnegative, so the finite sum is nonnegative.

2. In the subtraction formula the short sum is nonnegative, proving the upper bound. No assertion that Λ itself equals log on general n is used.

Acceptance cases:

- For n=0 or 1 both bounds are equalities at zero.

- At V=0 the upper bound is equality for every n.

Prerequisites: SieveMethodsAndPrimePatterns:SV.2/incomplete-log, SieveMethodsAndPrimePatterns:SV.2/incomplete-log-sub, mathlib:ArithmeticFunction.vonMangoldt_nonneg.

### Möbius inversion of the incomplete logarithm

Node SV.2/moebius-incomplete-log; proposed declaration SieveVaughan.moebius_mul_incompleteLog.

(μ*λ_V)(n) equals Λ(n) if V<n and zero otherwise, where μ is cast to ArithmeticFunction ℝ and * is native Dirichlet convolution.

Proof route:

1. Use the local high-part h_V from the construction and the identity λ_V=h_V*ζ.

2. In the native commutative convolution ring, μ*(h_V*ζ)=h_V*(μ*ζ)=h_V by the already implemented Möbius–zeta inverse.

3. Evaluate at n. In particular, this is an identity for all natural n rather than a formula requiring the later small-number error to be discarded.

Acceptance cases:

- For n≤V the convolution vanishes, not Λ(n).

- For V=0 this specializes to the existing μ*log=Λ; it does not replan that library theorem.

Prerequisites: SieveMethodsAndPrimePatterns:SV.2/incomplete-log, mathlib:ArithmeticFunction.coe_moebius_mul_coe_zeta.

### Vaughan's identity with its boundary term

Node SV.2/vaughan-identity; proposed declaration SieveVaughan.vaughan_identity.

Λ(n)=1_{n≤V}Λ(n)+Σ_{b|n,b≤U}μ(b)log(n/b)−Σ_{b|n,b≤U}μ(b)Σ_{c|n/b,c≤V}Λ(c)+Σ_{b|n,U<b}μ(b)Σ_{c|n/b,V<c}Λ(c). All μ values are cast to ℝ, and n/b is exact natural division at divisor indices.

Proof route:

1. Expand (μ*λ_V)(n) using native mul_apply and the generated additive companion of prod_divisorsAntidiagonal. This gives Σ_{b|n}μ(b)λ_V(n/b).

2. Add the complementary boundary 1_{n≤V}Λ(n). By moebius-incomplete-log, the result is Λ(n), including n=0.

3. Partition b-divisors at b≤U. In the low part insert incomplete-log-sub and distribute the finite sum over subtraction; in the high part insert the construction's tail-divisor formula.

4. For n>V the boundary term is zero and the result is exactly the source three-term identity. At positive n, c|(n/b) is equivalent to bc|n when b|n, so the nested divisor form has exactly the printed indexing, with no extra multiplicities.

Acceptance cases:

- At n=V=2 the three nonboundary terms cancel to zero; the retained boundary is log 2.

- U=0 and V=0 are permitted; there is no division by a cutoff and no loss factor.

Prerequisites: SieveMethodsAndPrimePatterns:SV.2/moebius-incomplete-log, SieveMethodsAndPrimePatterns:SV.2/incomplete-log-sub, SieveMethodsAndPrimePatterns:SV.2/incomplete-log, mathlib:ArithmeticFunction.mul_apply, mathlib:Nat.prod_divisorsAntidiagonal.

### Weighted Vaughan identity on a finite hyperbola

Node SV.2/weighted-vaughan-hyperbola; proposed declaration SieveVaughan.weighted_vaughan_hyperbola.

For arbitrary w:ℕ→ℂ, Σ_{n∈Ioc(0,N)}Λ(n)w(n)=Σ_{n∈Ioc(0,min(N,V))}Λ(n)w(n)+Σ_{m∈Ioc(0,N)}μ(m)Σ_{ℓ∈Ioc(0,⌊N/m⌋)}λ_V(ℓ)w(mℓ). Real and integer coefficients are cast to ℂ.

Proof route:

1. Evaluate moebius-incomplete-log and separate the boundary at each n. Cast to ℂ, multiply by w(n) and sum; the boundary condition n≤V identifies Ioc(0,min(N,V)).

2. For the convolution part expand mul_apply. At 0<n≤N rewrite n.divisorsAntidiagonal as the filtered product Ioc(0,N)×Ioc(0,N), using the native divisor-antidiagonal theorem.

3. Interchange finite sums. For any positive m,ℓ, summing the equality test mℓ=n over n∈Ioc(0,N) leaves the unique term w(mℓ) precisely when mℓ≤N. Thus arbitrary w stays attached to the product, not to either factor separately.

4. For m>0 the product restriction is ℓ≤⌊N/m⌋. Apply the same finite domain conversion as the pinned unweighted sum_Ioc_mul_eq_sum_sum, now retaining w(mℓ). This is the specialized weighted adapter; the already built unweighted convolution summation is not replanned.

Acceptance cases:

- N=0 makes every sum empty.

- The weight need not be multiplicative, nonnegative, bounded or periodic. Replacing w(mℓ) with w(m)w(ℓ) is invalid.

Prerequisites: SieveMethodsAndPrimePatterns:SV.2/moebius-incomplete-log, mathlib:ArithmeticFunction.mul_apply, mathlib:Nat.divisorsAntidiagonal_eq_prod_filter_of_le, mathlib:ArithmeticFunction.sum_Ioc_mul_eq_sum_sum.

### Exact support of the bilinear Vaughan term

Node SV.2/vaughan-bilinear-support; proposed declaration SieveVaughan.vaughan_bilinear_support.

If λ_V(ℓ)≠0 and mℓ≤N, then V<ℓ and m≤⌊N/(V+1)⌋.

Proof route:

1. Contraposition of incomplete-log-support gives V<ℓ, hence V+1≤ℓ.

2. Multiply by m and use mℓ≤N. Since V+1 is positive, native natural division gives m≤N/(V+1). The denominator never vanishes, even at V=0.

Acceptance cases:

- No converse is claimed: lying in this region does not imply a nonzero coefficient.

- For V=2,N=12, ℓ=3,m=4 reaches the exact cofactor endpoint; replacing the bound by a strict inequality would lose it.

Prerequisites: SieveMethodsAndPrimePatterns:SV.2/incomplete-log-support.

### Finite Type I–Type II Vaughan decomposition

Node SV.2/vaughan-type-i-ii; proposed declaration SieveVaughan.vaughan_typeI_typeII.

Put B=⌊N/(V+1)⌋. For arbitrary w:ℕ→ℂ, Σ_{0<n≤N}Λ(n)w(n)=Σ_{0<n≤min(N,V)}Λ(n)w(n)+Σ_{0<m≤min(U,B)}μ(m)Σ_{V<ℓ≤⌊N/m⌋}λ_V(ℓ)w(mℓ)+Σ_{U<m≤B}μ(m)Σ_{V<ℓ≤⌊N/m⌋}λ_V(ℓ)w(mℓ).

Proof route:

1. Start with weighted-vaughan-hyperbola. Remove ℓ≤V by incomplete-log-support; every removed summand is zero.

2. Remove m>B by vaughan-bilinear-support: for every retained inner index, nonzero λ_V(ℓ) would contradict that m-bound. The zero coefficients can be removed without any condition on w.

3. Partition Ioc(0,B) into Ioc(0,min(U,B)) and Ioc(U,B). These sets are disjoint and cover even if U>B. Distribute the finite sum.

4. The first block is the small-Möbius-factor Type I contribution; the second is a bilinear sum with both factors above their cutoffs. Its inner upper limit remains dependent on m. Turning this hyperbola into independent rectangles requires a separate analytic argument, not an equality asserted here.

Acceptance cases:

- Both degenerate regimes U≥B (empty Type II) and V≥N (boundary only) are included.

- A point-mass weight at n=V detects loss of the boundary; a complex nonmultiplicative weight detects incorrect weight factoring.

- ES.4 may substitute w(n)=e(αn), and SV.3 may substitute progression indicators; neither specialization supplies the required analytic estimates.

Prerequisites: SieveMethodsAndPrimePatterns:SV.2/weighted-vaughan-hyperbola, SieveMethodsAndPrimePatterns:SV.2/vaughan-bilinear-support, SieveMethodsAndPrimePatterns:SV.2/incomplete-log-support.

### Elementary Vaughan coefficient energies

Node SV.2/vaughan-coefficient-energy; proposed declaration SieveVaughan.vaughan_coefficient_energy.

For L≤M, Σ_{ℓ∈Ioc(L,M)}λ_V(ℓ)²≤(M−L)(log M)² and Σ_{m∈Ioc(L,M)}(μ(m):ℝ)²≤M−L.

Proof route:

1. If M=0 then L=0 and both sums are empty. Otherwise each index is positive and at most M.

2. Use incomplete-log-bounds and monotonicity of log on positive inputs to obtain 0≤λ_V(ℓ)≤log M. Square this nonnegative inequality and sum.

3. Use the native |μ(m)|≤1, cast from ℤ to ℝ, square and sum. The two constant sums have cardinal M−L by the native interval cardinality formula.

4. These coefficient-only upper bounds are available to a later bilinear Cauchy–Schwarz step. They claim no cancellation and do not turn the dependent hyperbola into a rectangle.

Acceptance cases:

- At L=M both energies are zero.

- For V≥M the incomplete-log energy is zero, even though the displayed upper bound may be positive.

- The Möbius bound is an inequality, not equality: the squarefree filter excludes m=4.

Prerequisites: SieveMethodsAndPrimePatterns:SV.2/incomplete-log-bounds, mathlib:Real.log_le_log, mathlib:ArithmeticFunction.abs_moebius_le_one, mathlib:Nat.card_Ioc.

### Planet budget and preservation

Vaughan's identity replaces the intermediate cosecant-row large-sieve bound as a planet. That bound remains a complete planned lemma and keeps every mathematical field unchanged. SV.2 still has six planets: weighted Selberg, Bombieri–Selberg, tapered Fourier vector, additive large sieve, primitive-character large sieve and Vaughan's identity. SV.0 keeps its five planets. No layer is silently split or enlarged.

### Chapter 18 reading and source findings

The entire live Chapter 18 was read, including §§18.1–18.4 and exercises. All five pages of the revised 9 May 2007 author handout were text-read; pp.3–4 were also visually collated. The packet records SHA-256 hashes and exact acquisition URLs. Earlier source evidence is inherited, not claimed freshly reread here. No journal edition is claimed.

The finite identities above do not use the following eight unreviewed findings. Bounded correction searches on the author's site and general title/correction queries found no repair; the older revised PDF contains the corresponding defects too. This is not an exhaustive novelty claim and no author was contacted.

- E19 (misprint, §18.1, Theorem 18.3 proof, small-r bound after (18.1.2); 2007 p.2, Theorem 2 proof): Retain the x^(1/2) factor supplied by Lemma 18.2, and write the coefficient norms consistently as |f|₂, |g|₂. Lemma 18.2 contributes x^(1/2)Δ^3rτ(s)|f|₂. Cauchy–Schwarz bounds the g sum by y^(1/2)|g|₂. Their product contains (xy)^(1/2); the displayed small-r line omits the x factor. The final theorem does contain the expected Δ(xy)^(1/2).

- E20 (gap, §18.1, Theorem 18.3 proof, summation of the dyadic large-r estimates; 2007 p.3, opening paragraph): Supply a sharper summation argument or retain the logarithmic loss from the stated block bounds; the displayed estimates alone do not imply the quoted uniform bound. Take R=1, Q=t=2^k, x=t^4, y=1. Each displayed block upper-bound expression P^(-1)√(4P²+x)√(4P²+y) is at least 2t² for P=1,2,…,t/2. Their sum is at least 2kt², whereas the claimed aggregate expression is t+2t²+1. No absolute constant compares these as k grows. This challenges the inference from the printed estimates, not the actual character sum or classical theorem.

- E21 (misprint, §18.2, boundary explanation following (18.2.2); 2007 p.3 after (4)): The omitted small-number part includes n≤x^(1/5), including a prime-power endpoint. For x=32 the cutoff is 2. At n=2 the incomplete-log convolution is zero but Λ(2)=log 2. The discrepancy boundary must include this endpoint. The stated order-of-magnitude error can still absorb it.

- E22 (misprint, §18.2, multiplicative partition parameter after (18.2.3); 2007 p.3, last paragraph): At minimum the lower bound must be changed to permit 0<δ≤1 for x>1; the expected small negative power and all needed lower-range constraints require a fresh proof. For x>1 the printed interval is empty. The later choice δ=Δ^(1/2) is at most one and cannot satisfy its lower bound. This checkpoint does not silently substitute an unverified exponent.

- E23 (gap, §18.2, multiplicative partition and rectangles after (18.2.3); 2007 pp.3–4): Specify the actual covered interval and count, the rectangle selection below the hyperbola and every boundary strip. A partition of [1,x] into consecutive multiplicative intervals generally needs a log x factor. After k consecutive intervals of ratio 1+δ starting at 1, the endpoint is (1+δ)^k, so reaching x requires k≥log x/log(1+δ). Moreover the printed boxes have ℓ>L and m>M with LM=x, hence ℓm>x throughout: they cannot cover terms with ℓm≤x. The original proof may intend a different restricted interval and selection, but it must be stated and justified.

- E24 (misprint, §18.2, display defining D(L,M;N,m); 2007 p.4): Use a distinct residue a and product congruence ℓm≡a mod N; include λ(ℓ)μ(m) in the reduced-residue average, with the same two interval restrictions. The current display repeats m as residue and summation variable and leaves the second sum without a summand. Definition 18.1 applied to the finite bilinear coefficients determines the corrected expression.

- E25 (error, §18.2, last aggregate bound and substitution δ=Δ^(1/2); 2007 p.4): Re-establish the aggregate bound. The expression (δ+δ^(-1)Δ)x(log x)^3 would balance at the stated choice, but this is only a candidate correction until the preceding rectangle argument is supplied. Substitution in the printed expression yields (Δ^(-1/2)x+Δ)x(log x)^3, not Δ^(1/2)x(log x)^3. For x≥1 and 0<Δ≤1 their ratio is at least x/Δ, unbounded. This is an invalid proof step, not a counterexample to Bombieri–Vinogradov.

- E26 (misprint, §18.3, Theorem 18.5 display; 2007 p.4, Theorem 3): Replace the free residue m by the bound variable a in the summand and read |f|² as the squared ℓ² norm consistently with Definition 18.1/Lemma 18.2. The sum binds a while its summand uses a different free variable m. A variance over residue classes must evaluate the discrepancy at the residue being summed. Only this syntactic correction is asserted; the theorem's proof remains an explicit exercise gap.

### Remaining analytic work

Chapter 18 has been read completely but its analytic proof is not decomposed: Definition 18.1 discrepancy API; Lemma 18.2 character bound; Theorem 18.3 convolution estimate; Theorem 18.4 averaged prime distribution; Theorem 18.5 variance; Corollary 18.6 and Exercises 18.4.3–5 remain work.

Repair E19–E26 before relying on the small-r normalization, dyadic summation, finite boundary, multiplicative partition, rectangle coverage or final balancing. The exact finite identity now supplied by SV.2 does not establish these analytic assertions.

State every A>0, a corresponding B and sufficiently large x, the range Q≤sqrt(x)/(log x)^B, weighted moduli sums and maxima over reduced residues. Import precisely stated small-modulus/zero-density inputs from AN.3 and the existing arithmetic Dirichlet-series owners. Stronger distribution remains an explicit hypothesis.

The exact Vaughan cutoff identity, incomplete logarithm, arbitrary-weight hyperbola/Type I–II decomposition and elementary coefficient energies are decomposed. Analytic Type I/II estimates and independent-rectangle reduction remain open. Read Chapter 15 for the sharp additive input and squared-inequality duality adapter; native operator-norm duality is already built.

### Current checkpoint validation

The current packet has 69 nodes (five constructions, forty-eight lemmas and sixteen theorems), 27 API items, 23 construction tests, 78 typed examples, eleven planets, 137 baseline references, six sources, 26 source findings, seven source-version records and six open gaps. All inherited mathematical node fields are preserved, with only the documented planet reassignment. SV.0–SV.3 are partial; SV.4–SV.5 remain not read.

The suggested file passed Lean 4.34.0-rc2 with no errors and exactly 164 expected proof-placeholder warnings, no others. It contains signatures and typed examples only; every node remains unchecked. All 8,482 imported Mathlib source files match the pin. The packet and source-issue/version checks pass. The optional standalone proof run is not counted as passing evidence: an earlier concrete divisor example required repair, and a later run was stopped under severe shared-host memory pressure. That limitation does not alter the separate passing full signature build.

Exact sparse prime-log coefficient vectors and Gaussian-rational weights verify 8,481 incomplete-log/convolution cases, 76,329 three-term identities, 17,640 weighted hyperbola/Type I–II decompositions and 41,280 support pairs. There are 20,825 coefficient-energy certificates using integer exponential bounds and twenty dyadic-gap certificates. Eight mutations reject the false boundary, cutoff, prime-power, coefficient and weight variants. These finite regressions are not general proofs. Earlier regression results are inherited evidence, not rerun by this continuation.
