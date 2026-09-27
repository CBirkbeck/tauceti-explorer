# Sieve methods, prime gaps and prime patterns

## Purpose and scope

A sieve estimates a nonnegative weighted population after excluding specified local divisibility conditions. Its finite algebra must be separated from the analytic assertion that a remainder is small. This roadmap develops that algebra on the existing Mathlib sieve carrier, then uses it as the foundation for dimension estimates, combinatorial and quadratic weights, large-sieve inequalities, distribution of primes and prime-pattern applications.

The specification contains twenty finite SV.0 declarations on weighted families and arbitrary excluded residue classes, and seven finite SV.2 declarations giving the weighted Selberg and Bombieri–Selberg inner-product inequalities. Empty local conditions, full-residue obstructions, zero Gram rows and empty vector families are handled explicitly. SV.0–SV.2 remain partial: dimension, concrete polynomial/CRT discrepancy estimates, analytic large sieves and bilinear decompositions are substantial additional targets. SV.3–SV.5 retain their outstanding source-decomposition work. These coverage boundaries are not claims that any theorem is implemented.

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

The ten basic finite examples test the eight initial results. The indexed-family and residue-class development below adds two constructions into the same existing carrier, with fourteen API items and nine discriminating construction tests, plus two further theorem examples. SV.0 has twenty main declarations, fourteen API signatures and twenty-one examples. The separate SV.2 Gram development adds seven declarations and twelve examples. Every packet node retains implementation status unchecked.

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

The two SV.2 planets are Selberg's weighted inner-product inequality and the Bombieri–Selberg inequality. The zero-row and quadratic/defect lemmas explain their proof; the uniform-row and diagonal/off-diagonal forms explain how consumers use them. No new definition is required, so the inherited two construction APIs and their tests stay unchanged.

## Remaining source decomposition and ownership

### SV.0: general local conditions and analytic remainder estimates

The new finite-family and residue constructors bridge Kedlaya's arbitrary local conditions to the pinned divisibility carrier, preserving every indexed weight and handling zero-density local conditions. The seven parameters in the source's n(10−n) example retain total mass seven despite having only four distinct image values. Concrete polynomial root descriptions, CRT residue counts and uniform interval discrepancy estimates still require application-specific proofs; they are not consequences merely of this representation.

Sieve dimension requires its actual logarithmic inequality, constants, quantifiers and range. A family-level remainder estimate requires an actual family of samples and a bound uniform in the intended parameters. Both remain targets. The finite cutoff lemma is the interface consuming such an estimate, not its proof.

The remaining Chapter 11 route includes Rankin's estimate, the weighted divisor-count estimate, its tail estimate, the quantitative Eratosthenes theorem and a justified Brun application. Their exercises and analytic estimates require decomposition. Any summation or asymptotic input belonging to AnalyticNumberTheory:AN.0 must be requested at its exact statement once the consuming nodes are specified. None of the twenty finite SV.0 nodes needs an unresolved analytic supplier. The labels themselves can greatly exceed the original sample bound: 33 has label 1155 for the bad residues 0 and −2 at primes 3,5,7,11. Thus the representation does not repair or assume the missing linear cutoff in source finding E7.

### SV.1: Brun and Selberg

Use the existing quadratic coefficient construction and diagonalized main form. The remaining targets are the optimizer and its hypotheses, Brun combinatorial weights, fundamental-lemma estimates in proved ranges, applications, and explicit parity limitations. Read Kedlaya Chapters 12–14 and the continuation of Heath-Brown's Section 2 before specifying these missing declarations. Reading through Lemma 2.1's statement does not supply its proof.

### SV.2: large sieves and bilinear decompositions

SV.2 owns additive and multiplicative large-sieve inequalities, duality, primitive-character reduction, Vaughan identities and Type I/II decompositions. Accepted RS-07 puts the Vaughan/bilinear direction from SV.2 into AnalyticNumberTheory:AN.3; the old reverse prerequisite must not be reintroduced.

The routed Bennett–Siksek item PAPER-BENNETT-SIKSEK-20/45 is supplied by the finite theorem above. The original four-page Bombieri paper is read in full, but its analytic theorem still needs decomposition: for δ-separated points, the exponential-sum square average is bounded by (N+2/δ) times the coefficient square sum. Its proof constructs finitely supported tapered vectors in ℓ², expresses their Gram entries by a difference of Fejér kernels, bounds a reciprocal-sine-square separation sum, chooses an integer taper length and changes the interval by translation and parity. These are concrete remaining targets, not consequences asserted from the finite inequality alone.

Read Kedlaya Chapters 15–16 and the Chapter 18 Vaughan route for the remaining duality, multiplicative and bilinear work. The quadratic-symbol bilinear estimate required by ArithmeticStatistics:ST.5 and the polynomial Farey estimate required by FiniteFieldsAndCharacterSums:FF.1 remain distinct consumer needs. Neither the finite SV.0 algebra nor the finite Gram theorem discharges their analytic hypotheses.

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


Bombieri's [published paper](https://www.impan.pl/en/publishing-house/journals-and-series/acta-arithmetica/all/18/0/97707/a-note-on-the-large-sieve), pp.401–404, was read completely in the publisher scan. The packet distinguishes the decomposed Proposition 1 from the read but undecomposed analytic theorem. The coefficient display after (4), p.402, prints a global double sum of squared Gram moduli in the denominator. The proof requires the first-power sum over the fixed row. At x=1,y=2 the printed coefficient is 1/8, yielding defect 9/16, whereas the corrected coefficient 1/2 yields zero. This is an unreviewed misprint finding about the proof choice, not a challenge to the proposition. The [volume's published errata](https://impan.pl/en/publishing-house/journals-and-series/acta-arithmetica/all/18/0/97710/errata-acta-arithmetica-xviii-1971) were read completely and contain no correction to p.402; bounded title/correction searches found none. No exhaustive novelty claim is made.

The relevant [Bennett–Siksek publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf) reading for this sieve slice is §8.2, printed pp.379–380, including Theorem 7 and its application. Its arithmetic application motivates the diagonal/off-diagonal consequence but is not certified complete here. Hashes, versions and exact reading boundaries appear in the packet.

## Verification and boundaries

The packet has 27 nodes: two constructions, sixteen lemmas and nine theorems; fourteen API items; nine construction tests; thirty-three suggested examples; seven planets, five in SV.0 and two in SV.2; sixty-three baseline references; six gaps and no supplier requests. The twenty SV.0 node objects and their APIs, tests, source findings and version scopes are preserved. SV.0–SV.2 are partial and SV.3–SV.5 remain not_read.

The suggested file elaborates under Lean 4.34.0-rc2 with exactly 74 required proof-placeholder warnings and no other warning or error. All 8,482 reached Mathlib source files byte-match the pin. Complete scratch proofs of all seven general Gram statements and all twelve new examples also compile without placeholders or warnings. Scratch proofs are verification evidence only; no proof is submitted and every implementation status remains unchecked.

Exact Gaussian-rational regressions cover 3,280 finite families, 9,432 zero-row checks, 13,120 quadratic estimates, and 19,680 checks each of the defect, weighted, uniform-row and diagonal/off-diagonal bounds. The 19,656 nonempty-family cases also check the maximum form. Families have zero to three vectors in dimension two, with four complex phase patterns; test vectors and coefficients include nonintegral complex rationals. The source coefficient and opposite-conjugation witnesses are checked separately. These finite checks supplement, rather than replace, the general scratch proofs.

Earlier finite-sieve and residue-constructor proof/regression evidence is retained in the packet and was not rerun in this Gram continuation. The official packet checker with the pinned declaration index and the source-issue/version checker report no errors. Only the four authorized deliverables are submitted. The handoff distinguishes the finite statement supplied from the remaining analytic proofs.
