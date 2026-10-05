# Sieve methods, prime gaps and prime patterns

## Purpose and scope

Current checkpoint: 125 declarations, all unchecked; 96 API items, 68 definition/construction tests, 23 planets and 172 pinned baseline declarations. All six stages remain partial. Nineteen declarations are new; incoming mathematical fields are preserved, with only the verified obsolete AC.4 use metadata removed. Historical validation sections describe the earlier checkpoints; the quantitative continuation and its remaining inventory below are current.

A sieve estimates a nonnegative weighted population after excluding specified local divisibility conditions. Its finite algebra must be separated from the analytic assertion that a remainder is small. This roadmap develops that algebra on the existing Mathlib sieve carrier, then uses it as the foundation for dimension estimates, combinatorial and quadratic weights, large-sieve inequalities, distribution of primes and prime-pattern applications.

The specification contains twenty finite SV.0 declarations and fifty-five SV.2 declarations: weighted sieve and residue interfaces; Selberg and Bombieri–Selberg inequalities; tapered Fourier vectors, circular packing and the H+2/δ additive large sieve; the H+2Q² primitive-character large sieve; the finite Vaughan/incomplete-log Type I–II decomposition; and primitive-character rectangular bilinear bounds with an explicit dyadic-scale loss. Empty inputs, cutoff equality, zero coefficients and the small-number boundary are explicit. SV.0–SV.3 remain partial. The incoming Maynard source decomposition is preserved, but the added polynomial-prime predicates keep SV.4 partial. SV.5 now has the elementary roughness-to-almost-prime transfer; its advanced sources remain unplanned. Sharp constants, hyperbolic Type I/II and distribution estimates, and the recorded application gaps are not supplied by these finite identities. Every declaration is a specification, not an implementation claim.

The Maynard checkpoint adds thirty-one declarations. SV.4 has twenty-seven: admissible tuples and the prime k-tuples conjecture, the W-trick, Maynard's multidimensional weights and the variational quantity M_k, Lemmas 5.1–6.3, Propositions 4.1–4.3 and Theorems 1.1–1.4 of *Small gaps between primes*. SV.3 has two: the level of distribution of Maynard (1.3), with the Elliott–Halberstam hypothesis, and its Bombieri–Vinogradov instance θ<1/2. SV.1 has two: GGPY's dimension-one diagonal sums. They appear in the last part of this document.

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
- SV.1–SV.5 local-data inputs: Separate the exact finite representation from dimension, distribution and analytic cutoff hypotheses needed by downstream sieve estimates.

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

1. Evaluate the native finite vector constructor at k. This is the promoted coordinate API, allowing the dependent inner-product proof to avoid unfolding a new abstraction.

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

E10 records that the displayed Gram modulus on p.403 is equated to a signed kernel difference. For N=L=1 and phase difference 1/2 the difference is −1, whereas the modulus is 1. Taking the absolute value of the difference repairs the identity. Because both kernels lie between zero and the same cosecant-square bound, their difference has modulus at most that bound; the resulting estimate does not acquire a factor two.

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

The continuation specifies both sieve-dimension predicates and the quantitative family-level interface. Actual application-family remainder bounds remain targets. A coefficient cutoff consumes such an estimate, rather than proving it.

The continuation specifies finite weighted Rankin and dimension-controlled divisor estimates and a conditional mass-and-cutoff Eratosthenes variant. The generic smooth-number count is requested from AN.5. The exact advertised Theorem 11.9 and the justified twin-prime application remain gaps. AN.0 is retired under accepted RS-07. Import its existing arithmetic-function and summation APIs directly from the pinned library; any genuinely missing analytic input must be assigned to its surviving owner at an exact consuming statement. None of the twenty finite SV.0 nodes needs an unresolved analytic supplier. The labels themselves can greatly exceed the original sample bound: 33 has label 1155 for the bad residues 0 and −2 at primes 3,5,7,11. Thus the representation does not repair or assume the missing linear cutoff in source finding E7.

### SV.1: Brun and Selberg

Use the existing quadratic coefficient construction and diagonalized main form. The Chapter 12 Brun coefficients and their elementary fundamental estimate are specified in the continuation. The remaining targets are the Selberg optimizer and its hypotheses, the other fundamental-lemma estimates, applications, and explicit parity limitations. Read Kedlaya Chapters 13–14 and the continuation of Heath-Brown's Section 2 before specifying these missing declarations. Reading through Lemma 2.1's statement does not supply its proof. The Maynard checkpoint adds GGPY Lemmas 3–4 in dimension one (Σ_{d<z}μ²(d)g(d) and its smoothly weighted form), because Maynard's Lemma 6.1 needs them. The proof of Lemma 3 is cited to Halberstam–Richert Lemmas 5.3–5.4, which were not read (gap). The dimension-κ statement and the Selberg optimizer remain.

### SV.2: large sieves and bilinear decompositions

SV.2 owns additive and multiplicative large-sieve inequalities, duality, primitive-character reduction, Vaughan identities and Type I/II decompositions. The accepted 30 September RS-07 decision withholds replacement of the existing AN.3→SV.2 edge. Retain that graph edge; the intended SV.2→AN.3 replacement was not applied.

The routed Bennett–Siksek item PAPER-BENNETT-SIKSEK-20/45 is supplied by the finite Gram theorem above. Bombieri's 1971 additive theorem with original interval length H+2/δ is now decomposed: endpoint-safe circular bins, the cosecant row bound, an explicit positive integer taper choice, and exact parity/translation/padding are all nodes. The continuation below supplies the primitive-character version with H+2Q². It does not supply the sharper H−1+1/δ additive or H−1+Q² multiplicative form, or any consumer-specific arithmetic correlation estimate.

Chapter 16 has been read completely and its primitive-character reduction is decomposed. The final continuation below now decomposes Chapter 18's finite Vaughan route, not its analytic bilinear estimates. Read Chapter 15 for the remaining sharp additive input and squared-inequality duality adapter; native adjoint/operator-norm duality is already built. Chapter 16's residue-exclusion and Linnik applications remain undecomposed. The quadratic-symbol bilinear estimate needed by ArithmeticStatistics:ST.5 and the polynomial Farey estimate needed by FiniteFieldsAndCharacterSums:FF.1 remain distinct consumer needs; finite Gram and Vaughan identities do not discharge their analytic hypotheses.

### SV.3: average distribution of primes

State Bombieri–Vinogradov with the complete order of quantifiers: every requested logarithmic saving \(A>0\), a corresponding \(B\), sufficiently large \(x\), and \(Q\leq\sqrt{x}/(\log x)^B\). Keep the sum over moduli, its weight and the maximum over reduced residue classes. The selected proof route imports its actual small-modulus or zero-density input from AN.3. A stronger distribution estimate is a hypothesis when it is not proved. The level-of-distribution definition in Maynard's normalization (1.3), the Elliott–Halberstam hypothesis and the level θ<1/2 are now planned; the last takes Kedlaya Theorem 18.4 as input, and its decomposition is still the SV.3 gap.

### SV.4: bounded gaps and clusters

The incoming Maynard paper is source-decomposed, not the whole expanded SV.4 stage; see the final part of this document. Its outside inputs are Bombieri–Vinogradov (SV.3), GGPY's diagonal sum (SV.1) and Mertens' theorem with the prime number theorem, which are requested from AnalyticNumberTheory:AN.2. The prime k-tuples conjecture is a named statement here, owned by SV.4 under RS-07 and never assumed. Maynard's theorems are the finite-gap results, not the twin-prime conjecture. The Zhang and Polymath refinements, and the Maynard–Tao results for other sequences, are not planned.

### SV.5: almost primes and advanced sieves

Beta and weighted sieves, Chen-type arguments and affine sieves are separate developments. Each has its own bilinear or parity-breaking conditions, or orbit and expansion hypotheses. State the number of prime factors and count multiplicities explicitly. Existing almost-prime notions are imported; local obstructions and exceptional cases remain visible. Original proof sources for each route must be selected and read.

## Sources and precision of the reading

The finite weighted statements use [Heath-Brown, Lectures on sieves, arXiv v1](https://arxiv.org/pdf/math/0209360v1), especially (1.1), (1.3), Corollary 1.1 and (1.5)–(1.8), and [Kedlaya, Chapter 11](https://kskedlaya.org/ant/chap-eratosthenes.html), especially its inclusion-exclusion arguments. The packet records exact hashes and access dates. Heath-Brown pp.1–8 were read through the statement of Lemma 2.1; Kedlaya Chapter 11 was read completely. The historical dated Kedlaya edition and Heath-Brown's Bonner proceedings text have not been identified with the acquired files.

The source-issue entries are version-specific. In the Heath-Brown preprint, the introductory Goldbach range must begin at four; the prime-counting example needs the surviving unit and the strict cutoff; the Goldbach image example loses parameter multiplicities and also needs the cutoff on both prime factors; the primitive sum-of-two-squares example needs to exclude multiples of four; and the Mertens asymptotic needs the sieve cutoff to tend to infinity. None of these findings is asserted against the unacquired published proceedings text.

For Kedlaya's displayed Brun proof, the packet records the unverified linear cutoff needed by the invoked theorem, and the need for a precise leading coefficient rather than an unspecified logarithmic big-O bound in its dimension calculation. These are proof-interface findings, not assertions that Brun's upper bound is false. The analytic application remains a source-decomposition gap. The finite identities and bounds above do not depend on either unresolved inference.


Bombieri's [published paper](https://www.impan.pl/en/publishing-house/journals-and-series/acta-arithmetica/all/18/0/97707/a-note-on-the-large-sieve), pp.401–404, was read completely in the publisher scan. The packet separates Proposition 1, the finite taper/kernel construction, circular packing, the scalar taper choice and exact interval reduction into declaration-sized statements. The coefficient display after (4), p.402, prints a global double sum of squared Gram moduli in the denominator. The proof requires the first-power sum over the fixed row. At x=1,y=2 the printed coefficient is 1/8, yielding defect 9/16, whereas the corrected coefficient 1/2 yields zero. This is an unreviewed misprint finding about the proof choice, not a challenge to the proposition. The [volume's published errata](https://impan.pl/en/publishing-house/journals-and-series/acta-arithmetica/all/18/0/97710/errata-acta-arithmetica-xviii-1971) were read completely and contain no correction to p.402; bounded title/correction searches found none. No exhaustive novelty claim is made.

The published Bombieri pp.401–404 were reread visually from the same acquired primary scan for the separation and interval argument. The earlier taper reading also included the complete volume errata; its attempted fresh publisher download returned HTTP 403. No new download or new errata search is claimed here. E10 and E11 are retained unreviewed findings against that scan. Bounded title/erratum/kernel searches and the atlas source register found no matching correction; the 1975 almost-prime corrigendum is a different paper. The volume errata correct pp.171–178 and 278, not pp.403–404. No author contact or exhaustive novelty claim is made.

The relevant [Bennett–Siksek publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf) reading for this sieve slice is §8.2, printed pp.379–380, including Theorem 7 and its application. Its arithmetic application motivates the diagonal/off-diagonal consequence but is not certified complete here. Hashes, versions and exact reading boundaries appear in the packet.

Maynard's [published paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v181-n1-p07-p.pdf) (Ann. of Math. 181 (2015), 383–413) was read completely and collated with [arXiv:1311.4600](https://arxiv.org/abs/1311.4600) v1–v3. The SV.4 nodes cite its printed pages. §2 of [GGPY, arXiv:math/0609615v1](https://arxiv.org/pdf/math/0609615v1) was read for Lemmas 3–4, and the statement of Kedlaya's Theorem 18.4 was reread.

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

3. Evaluate at n. In particular, this is an identity for all natural n rather than a formula requiring the small-number error to be discarded.

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

4. These coefficient-only upper bounds are available to a bilinear Cauchy–Schwarz step. They claim no cancellation and do not turn the dependent hyperbola into a rectangle.

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

- E22 (misprint, §18.2, multiplicative partition parameter after (18.2.3); 2007 p.3, last paragraph): At minimum the lower bound must be changed to permit 0<δ≤1 for x>1; the expected small negative power and all needed lower-range constraints require a fresh proof. For x>1 the printed interval is empty. The subsequent choice δ=Δ^(1/2) is at most one and cannot satisfy its lower bound. This checkpoint does not silently substitute an unverified exponent.

- E23 (gap, §18.2, multiplicative partition and rectangles after (18.2.3); 2007 pp.3–4): Specify the actual covered interval and count, the rectangle selection below the hyperbola and every boundary strip. A partition of [1,x] into consecutive multiplicative intervals generally needs a log x factor. After k consecutive intervals of ratio 1+δ starting at 1, the endpoint is (1+δ)^k, so reaching x requires k≥log x/log(1+δ). Moreover the printed boxes have ℓ>L and m>M with LM=x, hence ℓm>x throughout: they cannot cover terms with ℓm≤x. The original proof may intend a different restricted interval and selection, but it must be stated and justified.

- E24 (misprint, §18.2, display defining D(L,M;N,m); 2007 p.4): Use a distinct residue a and product congruence ℓm≡a mod N; include λ(ℓ)μ(m) in the reduced-residue average, with the same two interval restrictions. The current display repeats m as residue and summation variable and leaves the second sum without a summand. Definition 18.1 applied to the finite bilinear coefficients determines the corrected expression.

- E25 (error, §18.2, last aggregate bound and substitution δ=Δ^(1/2); 2007 p.4): Re-establish the aggregate bound. The expression (δ+δ^(-1)Δ)x(log x)^3 would balance at the stated choice, but this is only a candidate correction until the preceding rectangle argument is supplied. Substitution in the printed expression yields (Δ^(-1/2)x+Δ)x(log x)^3, not Δ^(1/2)x(log x)^3. For x≥1 and 0<Δ≤1 their ratio is at least x/Δ, unbounded. This is an invalid proof step, not a counterexample to Bombieri–Vinogradov.

- E26 (misprint, §18.3, Theorem 18.5 display; 2007 p.4, Theorem 3): Replace the free residue m by the bound variable a in the summand and read |f|² as the squared ℓ² norm consistently with Definition 18.1/Lemma 18.2. The sum binds a while its summand uses a different free variable m. A variance over residue classes must evaluate the discrepancy at the residue being summed. Only this syntactic correction is asserted; the theorem's proof remains an explicit exercise gap.

### Remaining analytic work

Chapter 18 has been read completely; the large-r primitive rectangular subargument of Theorem 18.3 is decomposed below, but the following analytic work remains: Definition 18.1 discrepancy API; Lemma 18.2 character bound; Theorem 18.3 convolution estimate; Theorem 18.4 averaged prime distribution; Theorem 18.5 variance; Corollary 18.6 and Exercises 18.4.3–5 remain work.

Repair E19–E26 before relying on the small-r normalization, dyadic summation, finite boundary, multiplicative partition, rectangle coverage or final balancing. The exact finite identity now supplied by SV.2 does not establish these analytic assertions.

State every A>0, a corresponding B and sufficiently large x, the range Q≤sqrt(x)/(log x)^B, weighted moduli sums and maxima over reduced residues. Import precisely stated small-modulus/zero-density inputs from AN.3 and the existing arithmetic Dirichlet-series owners. Stronger distribution remains an explicit hypothesis.

The exact Vaughan cutoff identity, incomplete logarithm, arbitrary-weight hyperbola/Type I–II decomposition, elementary coefficient energies and finite primitive rectangular estimates below are decomposed. The hyperbolic Type I/II estimates and independent-rectangle reduction remain open. Read Chapter 15 for the sharp additive input and squared-inequality duality adapter; native operator-norm duality is already built.

### Inherited Vaughan-checkpoint validation

The prior Vaughan packet had 69 nodes (five constructions, forty-eight lemmas and sixteen theorems), 27 API items, 23 construction tests, 78 typed examples, eleven planets, 137 baseline references, six sources, 26 source findings, seven source-version records and six open gaps. All inherited mathematical node fields are preserved, with only the documented planet reassignment. SV.0–SV.3 are partial; SV.4–SV.5 remain not read.

The prior suggested file passed Lean 4.34.0-rc2 with no errors and exactly 164 expected proof-placeholder warnings, no others. It contains signatures and typed examples only; every node remains unchecked. All 8,482 imported Mathlib source files match the pin. The packet and source-issue/version checks pass. The separate standalone proof run is not counted as passing evidence: an earlier concrete divisor example required repair, and a subsequent run was stopped under severe shared-host memory pressure. That limitation does not alter the separate passing full signature build.

Exact sparse prime-log coefficient vectors and Gaussian-rational weights verify 8,481 incomplete-log/convolution cases, 76,329 three-term identities, 17,640 weighted hyperbola/Type I–II decompositions and 41,280 support pairs. There are 20,825 coefficient-energy certificates using integer exponential bounds and twenty dyadic-gap certificates. Eight mutations reject the false boundary, cutoff, prime-power, coefficient and weight variants. These finite regressions are not general proofs. Earlier regression results are inherited evidence, not rerun by this continuation.

## SV.2: primitive rectangular bilinear estimates

### Domain, weights and exact endpoints

This continuation isolates the large-conductor rectangular step in Kedlaya's Chapter 18, §18.1, proof of Theorem 18.3. It uses the already planned primitive-character large sieve, whose constant is H+2Q². It does not replace this by the sharper source constant, and it does not assert the source's full convolution theorem.

Let H,K be natural lengths, M,N arbitrary integers, and a:Fin H→ℂ, b:Fin K→ℂ arbitrary coefficients. They do not depend on the modulus or the character. Set Aχ=Σ_{j<H}a_jχ(M+j+1), Bχ=Σ_{j<K}b_jχ(N+j+1), E_a=Σ|a_j|² and E_b=Σ|b_j|². The integer argument is cast to the native residue ring before evaluating the native Dirichlet character. Negative translations are permitted. The norms are the usual complex norms; empty coefficients have zero energy.

For natural R,Q write T(R,Q)=Σ_{R<q≤Q}φ(q)⁻¹Σχ*|Aχ||Bχ|. The star means primitive characters modulo q. The character in the two factors is the same. All contributing moduli are positive; φ(q)>0. In the suggested signatures q ranges through the positive labels q.val+1 of Fin Q and an explicit strict lower-cutoff test. There is no finite character enumeration at modulus zero. For Q≤R the sum is empty.

These letters are display abbreviations, not new definitions or bound predicates. All character and finite-sum carriers are imported. The six declaration-sized steps are owned by SV.2 under RS-07. SV.3 may consume the resulting finite estimate, but that does not import an unstated conductor decomposition or small-modulus theorem.

### Primitive character energy on a dyadic band

Node SV.2/dyadic-primitive-energy; proposed declaration SieveCharacters.dyadic_primitive_energy.

Σ_{P<q≤2P}φ(q)⁻¹Σχ*|Aχ|² ≤ ((H+8P²)/P)E_a.

Hypotheses:

- M,N are arbitrary integers; H,K are natural interval lengths; a:Fin H→ℂ and b:Fin K→ℂ are arbitrary. Write Aχ=Σ_{j<H}a_jχ(M+j+1), Bχ=Σ_{j<K}b_jχ(N+j+1), E_a=Σ|a_j|² and E_b=Σ|b_j|². Character values use the native residue cast.

- φ(q) is the native totient. Every character sum is over primitive Dirichlet characters modulo the positive integer q. Write T(R,Q)=Σ_{R<q≤Q}φ(q)⁻¹Σχ*|Aχ||Bχ|; this is display notation, not a new carrier or bound predicate. Empty intervals and zero coefficients are allowed.

- P is a positive natural number.

Proof route:

1. For each q>P, φ(q)>0 and 1/φ(q)≤q/(Pφ(q)). Multiply by the nonnegative primitive character energy.

2. Extend the resulting positive sum to all 1≤q≤2P, factor out 1/P, and apply primitive-large-sieve with upper cutoff 2P.

3. The inherited constant is H+2(2P)²=H+8P². The source sharper H−1+4P² is not substituted for it.

Acceptance cases:

- At H=0 the energy is zero for every P and M.

- For P=2 the band is {3,4}: q=2 is excluded and q=4 retained.

- No application of a primitive Gauss identity to imprimitive characters occurs.

Prerequisites: SieveMethodsAndPrimePatterns:SV.2/primitive-large-sieve, mathlib:Nat.totient_pos.

### Bilinear primitive character bound on one band

Node SV.2/dyadic-primitive-bilinear; proposed declaration SieveCharacters.dyadic_primitive_bilinear.

T(P,2P) ≤ P⁻¹√(H+8P²)√(K+8P²)√E_a√E_b.

Hypotheses:

- M,N are arbitrary integers; H,K are natural interval lengths; a:Fin H→ℂ and b:Fin K→ℂ are arbitrary. Write Aχ=Σ_{j<H}a_jχ(M+j+1), Bχ=Σ_{j<K}b_jχ(N+j+1), E_a=Σ|a_j|² and E_b=Σ|b_j|². Character values use the native residue cast.

- φ(q) is the native totient. Every character sum is over primitive Dirichlet characters modulo the positive integer q. Write T(R,Q)=Σ_{R<q≤Q}φ(q)⁻¹Σχ*|Aχ||Bχ|; this is display notation, not a new carrier or bound predicate. Empty intervals and zero coefficients are allowed.

- P is a positive natural number.

Proof route:

1. Flatten the finite family of pairs (q,χ), P<q≤2P and χ primitive. Apply real finite Cauchy–Schwarz to the entries |Aχ|/√φ(q) and |Bχ|/√φ(q).

2. The squares of these entries recover the two weighted energies because φ(q)>0. Apply dyadic-primitive-energy to each.

3. Factor their nonnegative square roots. The product of the two factors P^(−1/2) is P⁻¹. Neither coefficient family depends on q or χ; their integer translations can differ.

Acceptance cases:

- Setting b=a and K=H, N=M gives the same one-band energy bound.

- If either family is zero, both sides are zero.

- The single common character in the two factors is retained, not replaced by two independently summed characters.

Prerequisites: SieveMethodsAndPrimePatterns:SV.2/dyadic-primitive-energy, mathlib:Real.sum_mul_le_sqrt_mul_sqrt, mathlib:Real.sqrt_mul, mathlib:Real.sq_sqrt, mathlib:Real.sqrt_nonneg, mathlib:Real.sqrt_le_sqrt.

### Exact partition of the dyadic modulus interval

Node SV.2/dyadic-modulus-partition; proposed declaration SieveCharacters.dyadic_modulus_partition.

For R,J∈ℕ and arbitrary c:ℕ→ℝ, Σ_{R<q≤R2^J}c(q)=Σ_{i=0}^{J−1}Σ_{R2^i<q≤2R2^i}c(q).

Hypotheses:

- R and J are natural numbers, including zero. The real coefficient c may have either sign. Every interval is lower-open and upper-closed.

Proof route:

1. Use the generated additive companion of the indexed prod_Ioc_consecutive, or specialize that indexed statement to Multiplicative ℝ. This supplies the already built adjacent-interval sum identity.

2. Induct on J. For J=0 both sides are empty. At J+1 join (R,R2^J] and (R2^J,2R2^J]; their union is (R,R2^(J+1)] and the shared endpoint lies only in the first interval.

3. The endpoint order follows from R≥0 and 2^J≥1. For R=0 all intervals are empty. No new general interval partition API is planned.

Acceptance cases:

- At R=2,J=2 a point mass at q=4 contributes exactly once.

- At R=2,J=3 a point mass at q=16 contributes once and one at q=2 contributes zero.

- Signed test coefficients verify equality, not only a bound for positive terms.

Prerequisites: mathlib:Finset.prod_Ioc_consecutive.

### Finite sum of the bilinear dyadic coefficients

Node SV.2/dyadic-bilinear-kernel; proposed declaration SieveCharacters.dyadic_bilinear_kernel.

For real R>0, H,K≥0 and natural J, put P_i=R2^i. Then Σ_{i<J}√(H+8P_i²)√(K+8P_i²)/P_i ≤ 9R(2^J−1)+3J(√H+√K)+(2/R)(1−2^(−J))√H√K.

Hypotheses:

- R is a positive real number; H and K are nonnegative real numbers; J is natural, including zero. The reciprocal power is 2^(−J)=(1/2)^J, never natural subtraction in an exponent.

Proof route:

1. For any P>0 and X≥0, square the nonnegative proposed upper bound √X+3P to prove √(X+8P²)≤√X+3P. This is deliberately weaker than using √8.

2. Multiply the two bounds and divide by P. The result is at most 9P+3(√H+√K)+√H√K/P.

3. Sum the first and last terms using the existing finite geometric-sum formula with ratios 2 and 1/2: ΣP_i=R(2^J−1) and Σ1/P_i=(2/R)(1−(1/2)^J).

4. The middle term does not decay with i and contributes exactly 3J(√H+√K). Retain this factor; dropping it is not justified by the block estimates. All expressions vanish at J=0.

Acceptance cases:

- At H=K=0, R=2,J=3 the left side is 112; the displayed upper bound is 126.

- At J=0 both sides are zero.

- The scale-independent sum over four bands is four times its summand, not once.

Prerequisites: mathlib:Real.sqrt_le_iff, mathlib:Real.sq_sqrt, mathlib:Real.sqrt_nonneg, mathlib:geom_sum_eq.

### Primitive bilinear tail through a dyadic endpoint

Node SV.2/primitive-bilinear-dyadic-tail; proposed declaration SieveCharacters.primitive_bilinear_dyadic_tail.

For R>0 and J∈ℕ, T(R,R2^J) ≤ [9R(2^J−1)+3J(√H+√K)+(2/R)(1−2^(−J))√H√K]√E_a√E_b.

Hypotheses:

- M,N are arbitrary integers; H,K are natural interval lengths; a:Fin H→ℂ and b:Fin K→ℂ are arbitrary. Write Aχ=Σ_{j<H}a_jχ(M+j+1), Bχ=Σ_{j<K}b_jχ(N+j+1), E_a=Σ|a_j|² and E_b=Σ|b_j|². Character values use the native residue cast.

- φ(q) is the native totient. Every character sum is over primitive Dirichlet characters modulo the positive integer q. Write T(R,Q)=Σ_{R<q≤Q}φ(q)⁻¹Σχ*|Aχ||Bχ|; this is display notation, not a new carrier or bound predicate. Empty intervals and zero coefficients are allowed.

- R is a positive natural number and J is any natural number. Every power and scalar factor on the right is interpreted in ℝ.

Proof route:

1. In the exact partition set c(q)=φ(q)⁻¹Σχ*|Aχ||Bχ| for q>0, and c(0)=0. No character family at modulus zero needs to be summed.

2. Each band has positive lower endpoint R2^i. Apply dyadic-primitive-bilinear in each band, using the same a,b and translations.

3. Factor √E_a√E_b out of the scale sum and apply dyadic-bilinear-kernel. Nonnegativity of the energy factor preserves the inequality.

4. The R=q boundary is excluded and the top R2^J boundary is included. With J=0 the tail is exactly empty, and the complete right side is zero.

Acceptance cases:

- The empty-scale case is equality at zero, not an asymptotic exception.

- For R=2,J=3 the character energy at q=16 is retained.

- No coprimality between the two translations or primality of the moduli is required.

Prerequisites: SieveMethodsAndPrimePatterns:SV.2/dyadic-modulus-partition, SieveMethodsAndPrimePatterns:SV.2/dyadic-primitive-bilinear, SieveMethodsAndPrimePatterns:SV.2/dyadic-bilinear-kernel.

### Primitive bilinear tail at an arbitrary cutoff

Node SV.2/primitive-bilinear-cutoff; proposed declaration SieveCharacters.primitive_bilinear_cutoff.

If R>0 and Q≤R2^J≤2Q, then T(R,Q) ≤ [18Q+3J(√H+√K)+(2/R)√H√K]√E_a√E_b.

Hypotheses:

- M,N are arbitrary integers; H,K are natural interval lengths; a:Fin H→ℂ and b:Fin K→ℂ are arbitrary. Write Aχ=Σ_{j<H}a_jχ(M+j+1), Bχ=Σ_{j<K}b_jχ(N+j+1), E_a=Σ|a_j|² and E_b=Σ|b_j|². Character values use the native residue cast.

- φ(q) is the native totient. Every character sum is over primitive Dirichlet characters modulo the positive integer q. Write T(R,Q)=Σ_{R<q≤Q}φ(q)⁻¹Σχ*|Aχ||Bχ|; this is display notation, not a new carrier or bound predicate. Empty intervals and zero coefficients are allowed.

- R,Q,J are natural numbers with R>0 and Q≤R2^J≤2Q. These explicit cover and size hypotheses replace a hidden logarithmic rounding convention.

Proof route:

1. Use the positivity of every modulus contribution to enlarge (R,Q] to (R,R2^J], rather than discarding the last partial band.

2. Apply primitive-bilinear-dyadic-tail. From R2^J≤2Q obtain 9R(2^J−1)≤18Q. Since 0≤(1/2)^J≤1, bound 1−(1/2)^J by one.

3. Preserve the middle term 3J(√H+√K). All factors multiplying these comparisons are nonnegative.

4. For R≤Q a valid J can be chosen as the least integer with Q≤R2^J: J=0 if Q=R, while minimality at J>0 gives R2^J<2Q. The theorem requires the explicit two inequalities and does not assert a floating-point logarithm identity. If Q<R the original tail is empty and can be treated directly.

Acceptance cases:

- R=2,Q=5,J=2 satisfies the hypotheses and keeps q=5 in the partial last band; J=1 fails the cover condition.

- Zero-length or zero-coefficient families give zero without dividing by an energy.

- Applying this to coprimality-filtered coefficients is valid, but extending from primitive to imprimitive characters still requires the separate conductor argument.

Prerequisites: SieveMethodsAndPrimePatterns:SV.2/primitive-bilinear-dyadic-tail.

### Why the scale count stays in the estimate

On a band of lower scale P, the inherited primitive large sieve at 2P gives H+8P², not H−1+4P². Weighted Cauchy–Schwarz therefore gives the scalar coefficient √(H+8P²)√(K+8P²)/P. Its elementary upper bound is 9P+3(√H+√K)+√H√K/P. The first and last terms sum geometrically; the middle term is constant in P and occurs J times. This is why the finite coefficient contains 3J(√H+√K).

The J factor cannot simply be deleted from this argument. E20 records that the source's displayed sharper block-bound expressions do not, by summing alone, imply its stated uniform aggregate expression. The present theorem is a weaker replacement for that one step, with fully explicit constants and endpoint conventions. It neither confirms E20 by independent review nor disproves the classical theorem. Whether the additional loss can be absorbed into the downstream logarithmic exponents is a further proof obligation, not a conclusion of this checkpoint.

For a cutoff Q between dyadic endpoints, keep the least covering scale rather than the last scale below Q. In particular R=2,Q=5 needs J=2, so that the band (4,8] controls the modulus 5. Positivity allows enlarging to 8; it does not permit deleting the contribution at 5. No norm is divided out, so empty or zero-energy families need no special nonzero assumption.

### Library and ownership checks

The additional baseline declarations are Real.sum_mul_le_sqrt_mul_sqrt, Real.sqrt_mul, Real.sqrt_nonneg, Real.sqrt_le_sqrt, Real.sqrt_le_iff and Finset.prod_Ioc_consecutive. Their statements were read at Mathlib 082e2d3. The last is the indexed multiplicative declaration generating the additive interval identity; equivalently specialize it to Multiplicative ℝ. The native general interval API is not replanned. The existing Real.sq_sqrt, geom_sum_eq and Nat.totient_pos supply the remaining named scalar inputs.

The current six reviewed audit rows, accepted RS-07 ownership, the upstream Arithmetic Dirichlet series and Modular forms readers, and the 28 link-map screening entries mentioning this roadmap were inspected. Those link-map entries assert no exact supply relation; a negative screen is not a proof that no relation exists. Current consumer packets do not identify the present rectangular estimate with the quadratic-symbol bilinear input needed by ArithmeticStatistics:ST.5 or the polynomial Farey large sieve needed by FiniteFieldsAndCharacterSums:FF.1. Those distinct contracts remain explicit gaps, not satisfied requests. The unchanged generic character carriers remain library-owned.

### Source-version boundary

The full live author Chapter 18 was read afresh on 28 September 2026 at https://kskedlaya.org/ant/chap-bombieri2.html. The acquired HTML has SHA-256 9bd73d12d648dc61a5c09804bbee04992cb8108b15858146688ac7ae9b69f523, identical to the prior acquisition. It is an author copy, not a claimed journal edition. The prior revised-2007 handout reading and its collation are inherited, not freshly repeated. All 26 inherited source findings and all seven prior source-version records are retained verbatim; there is one new acquisition record and no new finding or review verdict. The explicit constants and retained J loss are worker derivations motivated by the source, not source quotations.

### Historical validation of the dyadic checkpoint (28 September 2026)

There are 75 nodes: five constructions, fifty-one lemmas and nineteen theorems. All 69 inherited node objects are preserved exactly. The five constructions retain 27 API items (ten promoted into main nodes and seventeen additional signatures) and 23 construction tests. The suggested file has 92 named declarations and 86 typed examples, including eight new endpoint, zero, constant and cutoff examples. The eleven planets are unchanged: five in SV.0 and six in SV.2. There are 143 pinned baseline references, six sources, 26 findings, eight source-version records, six open gaps and no requests. SV.0–SV.3 remain partial; SV.4–SV.5 remain not read.

The full suggested file elaborated with Lean 4.34.0-rc2: no errors, exactly 178 expected proof-placeholder warnings, and no other warnings. Its 3,362-file Mathlib source dependency closure was compared with the clean pinned baseline, using existing oleans only. No library build or new Lake environment was made. This file contains specifications, not implementations; all nodes remain unchecked.

A separate scratch-only Lean probe proves the general signed dyadic interval partition, the pointwise scalar kernel inequality and its finite geometric sum, plus six endpoint/scale examples. It has no errors or warnings; the three printed axiom lists contain only propext, Classical.choice and Quot.sound. It does not prove the primitive-character inequalities or use the planned character large sieve as an axiom.

Independent exact arithmetic tests cover 324 signed partitions, 5,500 pointwise and 1,100 finite kernel certificates, 216 primitive band energies, 3,240 bilinear band certificates and 1,701 arbitrary-cutoff certificates. The character cases enumerate all twelve characters and six primitive characters for moduli 1 through 6, using exact Gaussian-rational values and certified rational upper bounds for square roots. Negative starts, complex and zero coefficients, empty lengths and final partial bands occur. Thirty certificates test E20's displayed-expression obstruction, not the actual character sum. Eight endpoint, scale, geometric-sum and character-family mutations are rejected. These are finite regressions, not general proofs. Earlier test results above remain inherited evidence and were not rerun.

The current official blueprint checker and four-file intake checks pass without errors or warnings, with the pinned declaration index and current Git-object world. Preservation, declaration/example counts, source-version fields and the local dependency DAG are also checked.

### Continuation boundary of the dyadic checkpoint

The finite rectangular estimate is now available at SV.2/primitive-bilinear-cutoff. To continue Chapter 18, define the discrepancy with its actual maximum and coprimality convention, decompose Lemma 18.2, and justify the primitive/imprimitive conductor transition and totient-weighted cofactor summation. Keep the small-conductor bound, and its normalization repair E19, separate from this large-conductor estimate. Every downstream use must carry or absorb the explicit J loss through a proved estimate.

The Vaughan hyperbola has dependent inner limits; this rectangular theorem alone does not supply the required covering, boundary-strip estimates or final balancing. Repair E21–E25 and state the exact analytic Type I/II estimates before using Theorem 18.4. The variance route, Corollary 18.6 and exercises remain open, as do the sharp Chapter 15 constants, Chapter 16 applications, remaining finite-sieve analysis and the unread SV.4–SV.5 sources. No coverage status is promoted.

## Maynard checkpoint: level of distribution (SV.3)

Maynard's arithmetic hypothesis is a level of distribution θ in the sense of (1.3): the discrepancies of primes in progressions, summed over moduli up to x^θ, are O_A(x/(log x)^A) for every A. The definition compares with π(x)/φ(q), as Maynard does. The window form used in (5.20) is part of its API. Elliott–Halberstam is the named hypothesis that every θ<1 is a level, and Theorem 1.4 carries it explicitly. Bombieri–Vinogradov gives every θ<1/2: the node converts Kedlaya's ψ-form Theorem 18.4 by the N=1 term, the ψ–θ comparison and Abel summation. The proof of Theorem 18.4 is still the SV.3 gap.

### Level of distribution of the primes (Maynard (1.3))

Identifier: `SieveMethodsAndPrimePatterns:SV.3/level-of-distribution`. Proposed declaration: `SieveDistribution.PrimesHaveLevel`. Atlas planet: Level of distribution of the primes.

For real θ the primes have level of distribution θ if, for every A>0, Σ_{1≤q≤x^θ} max_{(a,q)=1} |π(x;q,a) − π(x)/φ(q)| = O_A(x/(log x)^A) as x→∞. Here π(x;q,a) counts the primes p≤x with p≡a (mod q), π(x) counts all primes p≤x and φ is Euler's function. The Elliott–Halberstam conjecture is the statement that the primes have level of distribution θ for every θ<1.

x is real; q runs over the integers 1≤q≤⌊x^θ⌋ and a over the reduced residues 0≤a<q. The term q=1 vanishes identically.

The comparison term is π(x)/φ(q), counting all primes up to x, exactly as in Maynard (1.3). His footnote 1 notes that other authors use slightly different definitions; this node fixes (1.3).

Elliott–Halberstam is a named hypothesis. No node of this roadmap asserts it, and every consumer carries it as an explicit hypothesis (RS-07).

Proof or construction plan:

1. Define π(x;q,a) as the number of primes p≤⌊x⌋ with p≡a (mod q), the discrepancy as the supremum over reduced residues a<q of |π(x;q,a) − π(x)/φ(q)|, and PrimesHaveLevel θ as the family of big-O statements along x→∞ indexed by A>0.
2. Define windowError(N,q) = 1 + sup_{(a,q)=1} |#{N≤n<2N : n prime, n≡a} − #{N≤n<2N : n prime}/φ(q)|, which is Maynard's E(N,q) of (5.16). The window API follows from the level estimates at x=2N−1 and x=N−1, since windowError(N,q) ≤ 1 + discrepancy(2N−1,q) + discrepancy(N−1,q), together with Σ_{q≤N^θ′}1 ≤ N^θ′ for θ′<θ<1.
3. Monotonicity in θ: for x≥1 the sum over q≤x^θ′ is a subsum of the sum over q≤x^θ, and every term is nonnegative. For θ≤0 only q=1 can occur.

Direct prerequisites: `mathlib:Nat.primeCounting`, `mathlib:Nat.totient`, `mathlib:Nat.ModEq`, `mathlib:Asymptotics.IsBigO`.

Acceptance:

- The level is a statement for every A>0, with an implied constant depending on A. It is not a single-A bound.
- Levels θ>1 fail (non-example test), so the Elliott–Halberstam range θ<1 is the natural limit. The Friedlander–Granville obstruction that Maynard mentions (p. 384) is not planned here.

Uses which determine the API:

- Maynard §4, Propositions 4.1–4.2, and (5.20): The one arithmetic input of the S₂ asymptotic, used through the window form.
- Maynard, proofs of Theorems 1.3 and 1.4, p. 390: Bombieri–Vinogradov supplies θ = 1/2 − ε and Elliott–Halberstam supplies θ = 1 − ε.
- SieveMethodsAndPrimePatterns:SV.3/bombieri-vinogradov-level: The conclusion of Bombieri–Vinogradov in this form.
- The former SV.3→AC.4 consumer attribution is removed under confirmed RT-AREA-combinatorics/9; its graph-edge deletion is a restructuring/maintainer proposal.

Planning API:

- `SieveDistribution.primeCountAP` (data): π(x;q,a), the number of primes p≤⌊x⌋ with p≡a (mod q).
- `SieveDistribution.discrepancy` (data): max over reduced a<q of |π(x;q,a) − π(x)/φ(q)|; the supremum over an empty index is zero.
- `SieveDistribution.windowError` (data): Maynard's E(N,q) of (5.16): 1 plus the largest deviation of the prime count in [N,2N) in a reduced class mod q from 1/φ(q) of the total.
- `SieveDistribution.ElliottHalberstam` (other): The Elliott–Halberstam conjecture: PrimesHaveLevel θ for every θ<1. It is a named hypothesis, never asserted.
- `SieveDistribution.discrepancy_one` (simp): discrepancy(x,1) = 0.
- `SieveDistribution.PrimesHaveLevel.mono` (relation): If θ′≤θ and the primes have level θ, they have level θ′.
- `SieveDistribution.primesHaveLevel_of_nonpos` (example): Every θ≤0 is a level of distribution.
- `SieveDistribution.PrimesHaveLevel.sum_windowError` (other): If the primes have level θ<1 and θ′<θ, then Σ_{1≤q≤N^θ′} windowError(N,q) = O_A(N/(log N)^A) for every A>0. This is the form Maynard uses in (5.20).

Tests:

- `discrepancy_ten_three` (computation): discrepancy(10,3) = 1: π(10;3,1) = 1 (the prime 7), π(10;3,2) = 2 (the primes 2 and 5), and π(10)/φ(3) = 4/2 = 2.
- `primesHaveLevel_zero` (degenerate): The primes have level 0: only q=1 occurs, and its discrepancy vanishes.
- `not_primesHaveLevel_of_one_lt` (non-example): For θ>1 the level fails. For each q in (x,x^θ] one of a=2,3 is coprime to q with π(x;q,a) = 1, while Σ_{q≤x^θ} π(x)/φ(q) = O(x). So the sum is ≫ x^θ, which is not O(x/(log x)^A). A definition that dropped the restriction q≤x^θ, or took the minimum over a, would accept these levels.
- `primeCountAP_one` (compatibility): primeCountAP(x,1,0) = Nat.primeCounting ⌊x⌋₊: modulo 1 every prime up to x is counted, which agrees with Mathlib's prime-counting function.

Sources: MAYNARD-2015, §1, definition (1.3) and footnote 1, p. 383; Elliott–Halberstam conjecture, p. 384; MAYNARD-2015, §1, p. 384.

### Bombieri–Vinogradov: every level θ<1/2

Identifier: `SieveMethodsAndPrimePatterns:SV.3/bombieri-vinogradov-level`. Proposed declaration: `SieveDistribution.primesHaveLevel_of_lt_half`. Atlas planet: Bombieri–Vinogradov theorem.

For every θ<1/2 the primes have level of distribution θ in the sense of Maynard (1.3).

The input is the ψ-form Bombieri–Vinogradov theorem, Kedlaya Theorem 18.4: for every A>0 there are c(A) and B(A) with Σ_{N≤Q} max_{m∈(ℤ/Nℤ)^×} |ψ(x;N,m) − x/φ(N)| ≤ c·x(log x)^{−A} for Q = x^{1/2}(log x)^{−B}. Its proof is the SV.3 decomposition still to be done (gap 'SV.3 remaining source decomposition').

The conclusion compares with π(x)/φ(q), as Maynard does, and not with li(x)/φ(q).

Proof or construction plan:

1. Input: Kedlaya Theorem 18.4. Its N=1 term alone gives |ψ(x) − x| ≤ c·x(log x)^{−A}.
2. Prime powers: in every progression |ψ(t;q,a) − θ(t;q,a)| ≤ |ψ(t) − θ(t)| ≤ 2√t·log t (Mathlib abs_psi_sub_theta_le_sqrt_mul_log). Summed over q≤x^θ this costs O(x^{θ+1/2} log x), which is O(x/(log x)^A) because θ<1/2.
3. Abel summation with f = 1/log (sum_mul_eq_sub_sub_integral_mul): π(x;q,a) = θ(x;q,a)/log x + ∫_2^x θ(t;q,a)/(t log²t) dt, and the same holds for π(x) with θ(t). Hence |π(x;q,a) − π(x)/φ(q)| ≤ E(x;q)/log x + ∫_2^x E(t;q)/(t log²t) dt + φ(q)^{−1}(|θ(x) − x|/log x + ∫_2^x |θ(t) − t|/(t log²t) dt), where E(t;q) = max_{(a,q)=1} |θ(t;q,a) − t/φ(q)|.
4. Split the integrals at t₀ = x/(log x)^{A+2}. For t≤t₀ the trivial bound E(t;q) ≤ (t/q + 1 + t/φ(q))·log t suffices. For t₀<t≤x and x large, x^θ ≤ t^{1/2}(log t)^{−B} because θ<1/2, so Theorem 18.4 at t covers every q≤x^θ.
5. Sum over q≤x^θ using Σ_{q≤y} 1/φ(q) = O(log y). Every term is O(x/(log x)^A).

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.3/level-of-distribution`, `mathlib:Chebyshev.psi`, `mathlib:Chebyshev.theta`, `mathlib:Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log`, `mathlib:sum_mul_eq_sub_sub_integral_mul`.

Acceptance:

- θ<1/2 is strict: the theorem gives no level 1/2 (Maynard, p. 384).
- Instance: θ = 1/2 − ε is the input of Maynard Theorem 1.3.
- The implied constants are ineffective, through Siegel's theorem inside Theorem 18.4. Maynard's remark after Lemma 5.2 records this.

Sources: MAYNARD-2015, §1, p. 384; KED-ANT-18, §18.3, Theorem 18.4 (Bombieri–Vinogradov).

## Maynard checkpoint: Selberg's diagonal sum in dimension one (SV.1)

Maynard evaluates every one-variable sum by GGPY's Lemma 4 at κ=1 (his Lemma 6.1), which rests on GGPY's Lemma 3. Both belong to the Selberg-sieve layer. Lemma 3's proof is cited to Halberstam–Richert and was not read, so its node carries a worker outline and a gap. The uniformity of the constant in L matters: Maynard applies the lemma with L ≪ log log N.

### Selberg's diagonal sum in dimension one (GGPY Lemma 3, κ=1)

Identifier: `SieveMethodsAndPrimePatterns:SV.1/selberg-diagonal-sum-dimension-one`. Proposed declaration: `SieveSelberg.abs_sum_squarefree_diagonal_sub_le`.

Under (Ω₁) and (Ω₂(1,L)), the partial products of ∏_p (1 − γ(p)/p)^{−1}(1 − 1/p) converge to some c_γ, and for z≥2, Σ_{d<z} μ²(d)g(d) = c_γ log z + O(c_γ L). The implied constant depends only on A₁ and A₂.

γ is multiplicative, A₁>1, A₂≥0 and L≥1. (Ω₁): 0 ≤ γ(p)/p ≤ 1 − 1/A₁ for every prime p. (Ω₂(1,L)): −L ≤ Σ_{w≤p<z} γ(p)log p/p − log(z/w) ≤ A₂ for 2≤w≤z. g(d) = ∏_{p|d} γ(p)/(p − γ(p)) on squarefree d. GGPY state (2.3) as γ(p)/p ≤ 1 − 1/A₁; Maynard's Lemma 6.1 writes 1 − A₁, an equivalent reparametrization.

Only squarefree d contribute, so g need only be defined on squarefree integers. Maynard calls it totally multiplicative.

Proof or construction plan:

1. Outline only: the source proof is Halberstam–Richert, Lemmas 5.3–5.4, which was not read (gap). Write G(y) = Σ_{d<y} μ²(d)g(d). For squarefree d, log d = Σ_{p|d} log p, so Σ_{d<z} μ²(d)g(d) log d = Σ_{p<z} g(p) log p·G_p(z/p), where G_p is G restricted to d coprime to p.
2. By (Ω₁), G_p(y) = G(y) + O(g(p)G(y)) and Σ_p g(p)² log p = O_{A₁}(1). By (Ω₂) and Abel summation, Σ_{p<z} g(p) log p·G(z/p) = ∫_1^z G(u) du/u + O((L+1)G(z)).
3. Abel summation on the left-hand side gives G(z) log z − ∫_1^z G(t) dt/t. Hence G(z) log z = 2∫_1^z G(t) dt/t + O((L+1)G(z)). The solution of this integral relation is G(z) = c·log z + O(cL), by the Levin–Fainleib iteration in H–R Lemma 5.3.
4. Identify c = c_γ. The Dirichlet series Σ μ²(d)g(d)d^{−s} equals ζ(s+1)H(s) with H(s) = ∏_p (1 + g(p)p^{−s})(1 − p^{−1−s}), and H(0) = c_γ. Convergence of the partial products follows from (Ω₂) and Mertens' estimate Σ_{w≤p<z} log p/p = log(z/w) + O(1) (requested from AN.2), by partial summation against 1/log p.

Direct prerequisites: `mathlib:ArithmeticFunction.moebius`, `mathlib:Squarefree`, `mathlib:sum_mul_eq_sub_sub_integral_mul`, `AnalyticNumberTheory:AN.2`.

Acceptance:

- γ(p) = 1 for p∤W and γ(p) = 0 for p|W gives g(d) = 1/φ(d) on d coprime to W and c_γ = φ(W)/W, so Σ_{d<z,(d,W)=1} μ²(d)/φ(d) = (φ(W)/W)(log z + O(L)) with L ≪ 1 + Σ_{p|W} log p/p (Maynard (6.7)–(6.8)).
- The constant is independent of L and of γ beyond A₁ and A₂. Maynard uses this uniformity with L ≪ log log N.

Sources: GGPY-2009, §2, Lemma 3 with (2.3)–(2.5), pp. 9–10 (arXiv v1); MAYNARD-2015, §6, Lemma 6.1 and its proof, p. 400.

### Smoothly weighted diagonal sum (Maynard Lemma 6.1, GGPY Lemma 4)

Identifier: `SieveMethodsAndPrimePatterns:SV.1/selberg-smooth-diagonal-sum`. Proposed declaration: `SieveSelberg.abs_sum_squarefree_diagonal_smooth_sub_le`.

Under (Ω₁) and (Ω₂(1,L)), for G: [0,1]→ℝ of class C¹ with G_max = sup_{[0,1]}(|G| + |G′|): Σ_{d<z} μ²(d)g(d)G(log d/log z) = c_γ log z ∫_0^1 G(x) dx + O(c_γ L G_max). The implied constant depends only on A₁ and A₂, not on L or G.

γ is multiplicative, A₁>1, A₂≥0 and L≥1. (Ω₁): 0 ≤ γ(p)/p ≤ 1 − 1/A₁ for every prime p. (Ω₂(1,L)): −L ≤ Σ_{w≤p<z} γ(p)log p/p − log(z/w) ≤ A₂ for 2≤w≤z. g(d) = ∏_{p|d} γ(p)/(p − γ(p)) on squarefree d. GGPY state (2.3) as γ(p)/p ≤ 1 − 1/A₁; Maynard's Lemma 6.1 writes 1 − A₁, an equivalent reparametrization.

GGPY state Lemma 4 for piecewise differentiable F evaluated at log(z/d)/log z. With G(x) = F(1−x) this is Maynard's form, with ∫_0^1 G = ∫_0^1 F(1−x) dx. Maynard writes S for c_γ.

Proof or construction plan:

1. Write the sum as the Stieltjes integral ∫_{1−}^{z} G(log u/log z) d𝒢(u), where 𝒢(u) = Σ_{d<u} μ²(d)g(d) = c_γ log u + E(u) and |E(u)| ≤ C c_γ L by SV.1/selberg-diagonal-sum-dimension-one.
2. Main part: the substitution u = z^x gives c_γ log z ∫_0^1 G(x) dx.
3. The E part: integrate by parts (Abel summation). The boundary terms are at most G_max·C c_γ L, and ∫_1^z |E(u)||G′(log u/log z)| du/(u log z) ≤ C c_γ L G_max.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.1/selberg-diagonal-sum-dimension-one`, `mathlib:sum_mul_eq_sub_sub_integral_mul`.

Acceptance:

- Maynard applies it with γ from (6.7), (6.11) and (6.19), obtaining (6.9), (6.13) and (6.21).
- G ≡ 1 recovers SV.1/selberg-diagonal-sum-dimension-one.

Sources: MAYNARD-2015, §6, Lemma 6.1, p. 400; GGPY-2009, §2, Lemma 4 and its proof, p. 10 (arXiv v1).

## Maynard checkpoint: admissible tuples and weights (SV.4)

Maynard's refinement of the GPY method chooses sieve weights λ_{d₁,…,d_k} that depend on the divisors of each n+hᵢ separately. Changing variables to y_r diagonalizes both quadratic forms S₁ and S₂, and a smooth choice y_r = F(log rᵢ/log R) turns them into the integrals I_k(F) and J_k^{(m)}(F). The positivity of S₂ − ρS₁ then produces ⌈θM_k/2⌉ primes among n+h₁, …, n+h_k for infinitely many n.

### Admissible tuple

Identifier: `SieveMethodsAndPrimePatterns:SV.4/admissible-tuple`. Proposed declaration: `SieveMaynard.IsAdmissible`. Atlas planet: Admissible tuple.

A finite set H of nonnegative integers is admissible if, for every prime p, there is an integer a_p with a_p ≢ h (mod p) for every h∈H.

H is a Finset ℕ. The empty set is admissible. Only primes p≤#H can obstruct admissibility, since #H elements meet at most #H residue classes.

Proof or construction plan:

1. Define IsAdmissible H as: for every prime p there is a with ¬ h ≡ a [MOD p] for all h∈H.
2. Characterisation: H misses a class mod p exactly when the image of reduction mod p has fewer than p elements, which is automatic for p>#H. This makes the predicate decidable.
3. Monotonicity under subsets and invariance under translation h ↦ h+c (replace a_p by a_p + c) are immediate.
4. isAdmissible_of_forall_not_dvd: if no element is divisible by a prime p≤#H, residue 0 is missed for those p.

Direct prerequisites: `mathlib:Nat.ModEq`.

Acceptance:

- {0,2,6,8,12} (Theorem 1.4) and Engelsma's 105-element set (footnote 2) are admissible. {0,2,4} is not, since it covers ℤ/3.

Uses which determine the API:

- Maynard §1, the prime k-tuples conjecture: Admissibility is the hypothesis of the conjecture.
- Maynard §4, p. 388: By the Chinese remainder theorem, admissibility gives the residue v₀ of the W-trick.
- Maynard, proofs of Theorems 1.1–1.4, pp. 390–391: Admissible tuples of small diameter: {0,2,6,8,12}, Engelsma's H₁₀₅, the first k primes above k, and the thinned sets of Theorem 1.2.
- SieveMethodsAndPrimePatterns:SV.4/prime-tuples-conjecture: The prime k-tuples conjecture quantifies over admissible sets.

Planning API:

- `SieveMaynard.isAdmissible_iff_card_image_lt` (characterisation): H is admissible iff, for every prime p≤#H, the image of H in ℤ/p has fewer than p elements.
- `SieveMaynard.IsAdmissible.mono` (relation): Subsets of admissible sets are admissible.
- `SieveMaynard.IsAdmissible.map_add` (relation): Translating an admissible set by c gives an admissible set.
- `SieveMaynard.isAdmissible_of_forall_not_dvd` (other): If no element of H is divisible by a prime p≤#H, then H is admissible.

Tests:

- `admissible_zero_two` (computation): {0,2} is admissible: it misses 1 mod 2.
- `not_admissible_zero_two_four` (non-example): {0,2,4} is not admissible: it meets all three classes mod 3. A definition that checked only p=2, or only p>#H, would accept it.
- `admissible_zero_two_six_eight_twelve` (computation): {0,2,6,8,12} is admissible: it misses 1 mod 2, 1 mod 3 and 4 mod 5.
- `admissible_empty` (degenerate): ∅ is admissible.
- `not_admissible_zero_one` (non-example): {0,1} is not admissible: it covers ℤ/2.

Sources: MAYNARD-2015, §1, p. 383.

### The prime k-tuples conjecture, as a named statement

Identifier: `SieveMethodsAndPrimePatterns:SV.4/prime-tuples-conjecture`. Proposed declaration: `SieveMaynard.PrimeTuplesConjecture`. Atlas planet: Prime k-tuples conjecture.

For a finite H⊂ℕ let primeTranslates(H) = {n : n+h is prime for every h∈H}. The prime k-tuples conjecture asserts that primeTranslates(H) is infinite for every admissible H.

It is a named statement, not an assumption. RS-07 moves the prime-tuple statement register here from AnalyticNumberTheory:AN.6, separately from Maynard's proven theorems.

Proof or construction plan:

1. Define primeTranslates and PrimeTuplesConjecture as displayed.
2. Necessity: if H covers every class mod p, then for each n some n+h is divisible by p, hence equals p. So n ≤ p, and primeTranslates(H) is finite.
3. The singleton {0} gives the set of primes (Mathlib infinite_setOfPred_prime), and {0,2} gives the twin primes.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/admissible-tuple`, `mathlib:Nat.infinite_setOfPred_prime`.

Acceptance:

- Maynard's proven statement (SV.4/positive-proportion-prime-tuples) is a positive-proportion result, not this conjecture. The twin prime conjecture is the case H = {0,2}, and it is not proved.

Uses which determine the API:

- Maynard §1, p. 383: The conjecture that motivates the paper.
- Maynard Theorem 1.2, p. 385: The subsets counted there are exactly those with infinite primeTranslates.
- RS-07 owners record: The prime-tuple statements formerly registered in AN.6.

Planning API:

- `SieveMaynard.primeTranslates` (data): The set of n such that n+h is prime for every h∈H.
- `SieveMaynard.isAdmissible_of_infinite_primeTranslates` (relation): If primeTranslates(H) is infinite, then H is admissible.
- `SieveMaynard.primeTranslates_singleton_zero` (compatibility): primeTranslates({0}) is the set of primes.
- `SieveMaynard.PrimeTuplesConjecture.infinite_twin` (relation): The conjecture implies that there are infinitely many twin primes.

Tests:

- `primeTranslates_zero_infinite` (compatibility): primeTranslates({0}) is infinite: this is Mathlib's infinitude of primes.
- `primeTranslates_zero_one` (non-example): primeTranslates({0,1}) = {2}. The set is finite but nonempty, so 'nonempty' cannot replace 'infinite' in the conjecture.
- `primeTranslates_zero_two_four` (computation): primeTranslates({0,2,4}) = {3}: one of n, n+2, n+4 is divisible by 3.
- `primeTranslates_empty` (degenerate): primeTranslates(∅) is all of ℕ.

Sources: MAYNARD-2015, §1, p. 383.

### The W-trick residue v₀ (Maynard (4.1))

Identifier: `SieveMethodsAndPrimePatterns:SV.4/w-trick-residue`. Proposed declaration: `SieveMaynard.wResidue`.

For real D₀ let W = ∏_{p≤D₀} p, the primorial of ⌊D₀⌋. For admissible H there is v₀ with 0≤v₀<W and gcd(v₀+h, W) = 1 for every h∈H; wResidue(H,D₀) is the least such v₀ (0 if none exists). Maynard takes D₀ = log log log N, and then W ≪ (log log N)².

H is admissible. Only ⌊D₀⌋ matters.

AdditiveCombinatorics:AC.4 plans a separate W-trick for the Green–Tao majorant (one linear form). RS-07 keeps the two apart; this is the tuple version.

Proof or construction plan:

1. For each prime p≤D₀, admissibility gives a class a_p missed by H. Require v₀ ≡ −a_p (mod p); then v₀+h ≡ h − a_p ≢ 0 (mod p) for every h∈H.
2. The primes p≤D₀ are pairwise coprime, so Nat.chineseRemainderOfFinset gives v₀ mod W. Minimality: take Nat.find of the decidable existence statement over v<W.
3. W ≤ 4^{⌊D₀⌋} ≤ 4^{D₀} by primorial_le_four_pow. With D₀ = log log log N, 4^{D₀} = (log log N)^{log 4} ≤ (log log N)² for large N.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/admissible-tuple`, `mathlib:primorial`, `mathlib:primorial_le_four_pow`, `mathlib:Nat.chineseRemainderOfFinset`.

Acceptance:

- For H = {0,2} and D₀ = 3: W = 6 and v₀ = 5, since 5 and 7 are both coprime to 6.

Uses which determine the API:

- Maynard (4.2)–(4.3): S₁ and S₂ sum only over n ≡ v₀ (mod W).
- Maynard Lemmas 5.1–5.3: Every support variable is coprime to W, so any other common prime factor exceeds D₀; this gives the 1/D₀ savings.
- SieveMethodsAndPrimePatterns:SV.4/maynard-sieve-weights: The support condition of y and λ.

Planning API:

- `SieveMaynard.wModulus` (data): W = primorial ⌊D₀⌋.
- `SieveMaynard.wResidue_coprime` (characterisation): For admissible H, gcd(wResidue(H,D₀) + h, W) = 1 for every h∈H.
- `SieveMaynard.wResidue_lt` (projection): wResidue(H,D₀) < W.
- `SieveMaynard.wModulus_le` (other): W ≤ 4^{D₀} for D₀ ≥ 0.
- `SieveMaynard.eventually_wModulus_le` (other): wModulus(log log log N) ≤ (log log N)² for all large N.

Tests:

- `wModulus_three` (computation): wModulus(3) = 6.
- `wResidue_zero_two` (computation): wResidue({0,2}, 3) = 5.
- `wModulus_one` (degenerate): wModulus(1) = 1: there are no primes ≤ 1, and every residue works.
- `no_wResidue_zero_one` (non-example): For H = {0,1} and W = wModulus(2) = 2, no v makes both v and v+1 coprime to 2. The construction genuinely needs admissibility.

Sources: MAYNARD-2015, §4, (4.1) and the following sentence, pp. 388–389.

### Maynard's multidimensional sieve weights

Identifier: `SieveMethodsAndPrimePatterns:SV.4/maynard-sieve-weights`. Proposed declaration: `SieveMaynard.maynardLambda`.

Fix k, W, R>1 and F: ℝ^k→ℝ. For r∈ℕ^k put y_r = F(log r₁/log R, …, log r_k/log R) when ∏rᵢ is squarefree, coprime to W and less than R, and y_r = 0 otherwise (6.3). Define λ_d = (∏ μ(dᵢ)dᵢ) Σ_{r: dᵢ|rᵢ} y_r/∏φ(rᵢ) (5.8), and the weight w_n = (Σ_{dᵢ|n+hᵢ ∀i} λ_d)² (2.4). With these, S₁ = Σ_{N≤n<2N, n≡v₀ (W)} w_n, S₂^{(m)} = Σ_{same n} χ_P(n+h_m)w_n, and y^{(m)}_r = (∏ μ(rᵢ)g(rᵢ)) Σ_{rᵢ|dᵢ, d_m=1} λ_d/∏φ(dᵢ), where g is totally multiplicative with g(p) = p−2 ((4.2), (5.14), (5.23)).

λ built from a general y (maynardLambdaOfY) is what Lemmas 5.1–5.3 use; maynardLambda specializes to (6.3). Proposition 4.1 writes λ directly from F and replaces ∏rᵢ<R by 'F supported on ℛ_k'. The two differ only at ∏rᵢ = R, which does not affect the asymptotics.

All sums are finite: rᵢ and dᵢ run below ⌈R⌉, and every other term vanishes by the support condition.

Proof or construction plan:

1. Define y, λ, w, S₁, S₂^{(m)}, g and y^{(m)} as displayed.
2. Support: if dᵢ|rᵢ for all i, then ∏dᵢ divides ∏rᵢ. So some y_r in the sum can be nonzero only if ∏dᵢ is squarefree, coprime to W and less than R.
3. Inversion (5.7)–(5.8): substitute the definition and use Σ_{dᵢ|rᵢ|eᵢ} μ(rᵢ) = μ(dᵢ)·[eᵢ = dᵢ] for squarefree eᵢ.
4. Dimension one: (Σ_{d|m} λ_d)² = Σ_{e|m} Σ_{lcm(d₁,d₂)=e} λ_{d₁}λ_{d₂} = Σ_{e|m} lambdaSquared(λ)(e).

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/w-trick-residue`, `mathlib:ArithmeticFunction.moebius`, `mathlib:Nat.totient`, `mathlib:Squarefree`, `mathlib:BoundingSieve.lambdaSquared`.

Acceptance:

- For R = 2 only r = (1,…,1) is supported, so λ_{(1,…,1)} = F(0), every other λ_d vanishes, and w_n = F(0)² for every n.
- The weights depend on (d₁,…,d_k) jointly, not only on ∏dᵢ. This is the new feature of the method (p. 387).

Uses which determine the API:

- Maynard Proposition 4.1, p. 388: The weights whose S₁ and S₂ are evaluated.
- Maynard Lemmas 5.1–5.3: The change of variables diagonalizes S₁ and S₂.
- Maynard, proof of Proposition 4.2, p. 389: The weights are nonnegative, so a positive S₂ − ρS₁ produces a good n.

Planning API:

- `SieveMaynard.IsMaynardSupport` (data): ∏rᵢ is squarefree, coprime to W, and less than R.
- `SieveMaynard.maynardY` (data): The smooth choice (6.3): F(log rᵢ/log R) on the support, and 0 elsewhere.
- `SieveMaynard.maynardLambdaOfY` (data): λ_d = (∏ μ(dᵢ)dᵢ) Σ_{dᵢ|rᵢ} y_r/∏φ(rᵢ) for an arbitrary y (5.8).
- `SieveMaynard.maynardWeight` (data): w_n = (Σ_{dᵢ|n+hᵢ} λ_d)².
- `SieveMaynard.sieveSumS1` (data): S₁ = Σ_{N≤n<2N, n≡v₀ (W)} w_n (4.2).
- `SieveMaynard.sieveSumS2` (data): S₂^{(m)} = Σ_{N≤n<2N, n≡v₀ (W)} χ_P(n+h_m)w_n (5.14). S₂ is the sum over m.
- `SieveMaynard.maynardG` (data): The totally multiplicative g with g(p) = p−2.
- `SieveMaynard.maynardYm` (data): y^{(m)}_r of (5.23). It vanishes unless r_m = 1.
- `SieveMaynard.maynardLambdaOfY_eq_zero` (projection): If y vanishes off the support, then λ_d = 0 whenever d is not supported.
- `SieveMaynard.maynardY_eq_sum_lambda` (characterisation): For supported r, y_r = (∏ μ(rᵢ)φ(rᵢ)) Σ_{rᵢ|dᵢ} λ_d/∏dᵢ; this is (5.7), which inverts (5.8).
- `SieveMaynard.maynardWeight_nonneg` (simp): w_n ≥ 0.
- `SieveMaynard.maynardWeight_one_eq_sum_lambdaSquared` (compatibility): For k = 1, w_n = Σ_{e|n+h₁} BoundingSieve.lambdaSquared(λ)(e), which is Mathlib's Λ² sieve.

Tests:

- `maynardLambda_zero` (degenerate): F = 0 gives λ = 0.
- `maynardWeight_R_two` (computation): R = 2: w_n = F(0)² whenever every n+hᵢ ≠ 0.
- `maynardLambda_two_two` (non-example): k = 2 and d = (2,2): each dᵢ is squarefree but ∏dᵢ = 4 is not, so λ_d = 0. A definition that tested squarefreeness coordinatewise would get this wrong.

Sources: MAYNARD-2015, §2, (2.4)–(2.5), p. 387; MAYNARD-2015, §4, Proposition 4.1, p. 388; §5, (5.7)–(5.8), p. 393; §6, (6.3), p. 400.

### Maynard's variational quantity M_k

Identifier: `SieveMethodsAndPrimePatterns:SV.4/maynard-functionals`. Proposed declaration: `SieveMaynard.maynardM`. Atlas planet: Maynard's variational quantity M_k.

Let ℛ_k = {t∈[0,1]^k : Σtᵢ ≤ 1}. For F: [0,1]^k→ℝ put I_k(F) = ∫F² and J_k^{(m)}(F) = ∫(∫_0^1 F dt_m)² dt₁…dt_{m−1}dt_{m+1}…dt_k. Let 𝒮_k be the set of F supported on ℛ_k with I_k(F) ≠ 0 and J_k^{(m)}(F) ≠ 0 for every m. Then M_k = sup_{F∈𝒮_k} Σ_m J_k^{(m)}(F)/I_k(F).

Maynard's 𝒮_k consists of Riemann-integrable functions; here it consists of square-integrable functions on the cube. The suprema agree: every Riemann-integrable function is square-integrable, and SV.4/ratio-smooth-approximation approximates every square-integrable member by smooth functions supported on ℛ_k.

J^{(m)} is integrated over the whole cube. Its integrand does not depend on t_m, so this is the (k−1)-fold integral of the source.

G_{b,j} of Lemma 8.1 is included as data, with the r = 0 term (E31).

Proof or construction plan:

1. Define ℛ_k, I_k, J_k^{(m)}, the admissible class, the ratio, and M_k as the supremum of a set of reals bounded above by k.
2. Upper bound: by Cauchy–Schwarz, (∫_0^1 F dt_m)² ≤ ∫_0^1 F² dt_m. So J^{(m)} ≤ I and M_k ≤ k.
3. Replacing F by cF multiplies I and each J^{(m)} by c². Permuting the coordinates permutes the J^{(m)}.
4. Radial case F = G(Σtᵢ) on ℛ_k: slice by s = Σ_{i≠m} tᵢ, whose density on ℛ_{k−1} is s^{k−2}/(k−2)!. This gives the GPY integrals of the remark after Lemma 6.3.

Direct prerequisites: `mathlib:MeasureTheory.MemLp`, `mathlib:Finset.Nat.antidiagonalTuple`.

Acceptance:

- M₁ = 1: J^{(1)} = (∫F)² ≤ ∫F², with equality for F = 1 on [0,1].
- The support condition is essential: F ≡ 1 on the cube has ratio k.

Uses which determine the API:

- Maynard Proposition 4.2, p. 389: r_k = ⌈θM_k/2⌉.
- Maynard Proposition 4.3 and §§7–8: Lower bounds for M_k from explicit F.
- SieveMethodsAndPrimePatterns:SV.4/maynard-sum-asymptotics: I_k and J_k^{(m)} are the constants in the S₁, S₂ asymptotics.

Planning API:

- `SieveMaynard.maynardSimplex` (data): ℛ_k = {t : tᵢ ≥ 0, Σtᵢ ≤ 1}.
- `SieveMaynard.maynardI` (data): I_k(F) = ∫_{[0,1]^k} F².
- `SieveMaynard.maynardJ` (data): J_k^{(m)}(F) = ∫_{[0,1]^k} (∫_0^1 F(t with t_m := s) ds)² dt.
- `SieveMaynard.IsMaynardAdmissible` (data): F vanishes off ℛ_k, lies in L²([0,1]^k), I_k(F) ≠ 0, and J_k^{(m)}(F) ≠ 0 for every m.
- `SieveMaynard.maynardRatio` (data): Σ_m J_k^{(m)}(F)/I_k(F).
- `SieveMaynard.simplexG` (data): G_{b,j}(x) = b! Σ_{r=0}^{b} C(x,r) Σ_{b₁,…,b_r ≥ 1, Σ = b} ∏ (jbᵢ)!/bᵢ!, including the term r = 0.
- `SieveMaynard.maynardRatio_smul` (simp): The ratio of cF equals the ratio of F for c ≠ 0.
- `SieveMaynard.maynardJ_eq_of_symmetric` (relation): If F is symmetric in its coordinates, J_k^{(m)}(F) does not depend on m.
- `SieveMaynard.maynardM_le` (other): M_k ≤ k.
- `SieveMaynard.maynardRatio_le_maynardM` (characterisation): The ratio of every admissible F is at most M_k.
- `SieveMaynard.maynardI_J_radial` (compatibility): For F = G(Σtᵢ) on ℛ_k with k ≥ 2: I = ∫_0^1 G(t)² t^{k−1}/(k−1)! dt and J^{(m)} = ∫_0^1 (∫_t^1 G)² t^{k−2}/(k−2)! dt, which are the one-dimensional GPY integrals.

Tests:

- `maynardM_one` (computation): M₁ = 1.
- `maynardI_J_triangle` (computation): For k = 2 and F the indicator of ℛ₂: I = 1/2 and J^{(1)} = ∫_0^1 (1−t)² dt = 1/3, so the ratio is 4/3.
- `not_admissible_zero` (degenerate): F = 0 is excluded, because I_k(0) = 0.
- `not_admissible_const_one` (non-example): F ≡ 1 on [0,1]² is not supported on ℛ₂ and has ratio 2. Without the support condition every M_k would be at least k.
- `simplexG_zero` (computation): G_{0,2}(5) = 1: the r = 0 term that the printed formula omits (E31).

Sources: MAYNARD-2015, §4, Proposition 4.1, p. 388, and Proposition 4.2, p. 389; MAYNARD-2015, §6, remark after Lemma 6.3, p. 404.

### Smooth approximation within the simplex

Identifier: `SieveMethodsAndPrimePatterns:SV.4/ratio-smooth-approximation`. Proposed declaration: `SieveMaynard.exists_smooth_maynardRatio_gt`.

For F∈𝒮_k and δ>0 there is a smooth F₁∈𝒮_k, supported on ℛ_k, with I_k(F₁) > 0 and ratio(F₁) > ratio(F) − δ. In particular M_k is also the supremum over smooth functions supported on ℛ_k.

𝒮_k is the L² class of SV.4/maynard-functionals.

Proof or construction plan:

1. Shrink: F_η(t) = F((t − η𝟙)/(1 − (k+1)η)) vanishes unless tᵢ ≥ η and Σtᵢ ≤ 1 − η. I scales by (1 − (k+1)η)^k and each J^{(m)} by (1 − (k+1)η)^{k+1}, so the ratio is multiplied by 1 − (k+1)η.
2. Mollify: convolve F_η with a smooth bump (Mathlib ContDiffBump) of radius below η/√k. The result is smooth, supported in ℛ_k, and converges to F_η in L²(cube) as the radius tends to 0.
3. Continuity: F ↦ ∫_0^1 F dt_m is 1-Lipschitz from L²(cube) to L²(cube) by Cauchy–Schwarz, so I and each J^{(m)} are continuous. For η and the radius small enough, the ratio moves by less than δ and I and the J^{(m)} stay nonzero.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/maynard-functionals`, `mathlib:ContDiffBump`.

Acceptance:

- Maynard's proof of Proposition 4.2 uses this step without proof; it is supplied here.

Sources: MAYNARD-2015, §4, proof of Proposition 4.2, p. 389.

## Maynard checkpoint: Selberg manipulations and asymptotics (SV.4)

Sections 5 and 6 of the source are decomposed lemma by lemma. The constants depend on k, H, θ and δ but are uniform in y and F, which is how the source states them. Level of distribution enters only through Lemma 5.2, and the prime number theorem only through X_N there.

### The GPY positivity criterion

Identifier: `SieveMethodsAndPrimePatterns:SV.4/gpy-positivity-criterion`. Proposed declaration: `SieveMaynard.exists_card_prime_gt_of_sum_pos`.

Let H be finite, N∈ℕ, w_n ≥ 0 and ρ∈ℝ. If Σ_{N≤n<2N} (#{h∈H : n+h prime} − ρ)w_n > 0, then some n∈[N,2N) has more than ρ, hence at least ⌊ρ+1⌋, of the n+h prime.

No arithmetic input. The weights need only be nonnegative.

Proof or construction plan:

1. If every n had at most ρ of the n+h prime, each summand (#{…} − ρ)w_n would be ≤ 0, because w_n ≥ 0, and so would the sum.
2. An integer c > ρ satisfies c ≥ ⌊ρ⌋ + 1 = ⌊ρ + 1⌋.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/admissible-tuple`.

Acceptance:

- With ρ = θM_k/2 − ε this is the positivity step of Proposition 4.2. For small ε>0, ⌊ρ+1⌋ = ⌈θM_k/2⌉.

Sources: MAYNARD-2015, §2, (2.1) and the following paragraph, p. 386.

### Size of λ in terms of y (Maynard (5.9))

Identifier: `SieveMethodsAndPrimePatterns:SV.4/lambda-max-bound`. Proposed declaration: `SieveMaynard.abs_maynardLambdaOfY_le`.

If y vanishes off the support (∏rᵢ squarefree, coprime to W, less than R) and |y_r| ≤ y_max, then |λ_d| ≤ y_max Σ_{u<R} μ²(u)τ_k(u)/φ(u) for every d. The right-hand side is O_k(y_max (log R)^k).

τ_k(u) is the number of ordered factorizations u = c₁⋯c_k.

Proof or construction plan:

1. Insert |y_r| ≤ y_max into (5.8) and write rᵢ = dᵢr′ᵢ. Since ∏rᵢ is squarefree, the r′ᵢ are coprime to ∏dᵢ.
2. Use d/φ(d) = Σ_{e|d} 1/φ(e) for squarefree d and the multiplicativity of φ to combine everything into Σ_{u<R} μ²(u)τ_k(u)/φ(u), with u = dr′ and τ_k(dr′) ≥ τ_k(r′) (5.9).
3. Σ_{u<R} μ²(u)τ_k(u)/φ(u) ≤ ∏_{p<R}(1 + k/(p−1)) ≤ exp(k Σ_{p<R} 1/(p−1)) = O_k((log R)^k). This uses Σ_{p<R} 1/p = log log R + O(1), which follows from Mertens' first theorem (requested from AN.2) by partial summation.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/maynard-sieve-weights`, `AnalyticNumberTheory:AN.2`.

Acceptance:

- The O_k((log R)^k) bound is what turns the error O(λ_max²R²(log R)^{2k}) of (5.3) into O(y_max²R²(log R)^{4k}).

Sources: MAYNARD-2015, §5, (5.9) and the following sentence, pp. 393–394.

### Diagonal form of S₁ (Maynard Lemma 5.1)

Identifier: `SieveMethodsAndPrimePatterns:SV.4/s1-diagonalization`. Proposed declaration: `SieveMaynard.sieveSumS1_diagonal`.

Let y vanish off the support, with |y_r| ≤ y_max, and λ = λ(y). Then S₁ = (N/W) Σ_r y_r²/∏φ(rᵢ) + O(y_max² φ(W)^k N(log R)^k/(W^{k+1}D₀)).

N is large, D₀ = log log log N, W = ∏_{p≤D₀}p, v₀ is the W-trick residue of the admissible H = {h₁,…,h_k} (distinct), R = N^{θ/2−δ} with 0<θ≤1 and δ>0 fixed. The implied constants depend on k, H, θ and δ, and not on N, y or F.

Proof or construction plan:

1. Expand the square and swap the sums (5.1). By the Chinese remainder theorem, the count of N≤n<2N with n≡v₀ (W) and [dᵢ,eᵢ] | n+hᵢ is N/q + O(1), q = W∏[dᵢ,eᵢ], when W, [d₁,e₁], …, [d_k,e_k] are pairwise coprime. Otherwise it is 0: a prime dividing [dᵢ,eᵢ] and [dⱼ,eⱼ] divides hᵢ − hⱼ and exceeds D₀ > max|hᵢ − hⱼ| (5.2).
2. The O(1) terms: λ is supported on ∏dᵢ < R, so they total ≪ λ_max²(Σ_{d<R} τ_k(d))² ≪ λ_max²R²(log R)^{2k} (5.3), with λ_max ≪ y_max(log R)^k (SV.4/lambda-max-bound).
3. Main term: 1/[dᵢ,eᵢ] = (dᵢeᵢ)^{−1} Σ_{uᵢ|dᵢ,eᵢ} φ(uᵢ) (5.4). Remove the remaining conditions (dᵢ,eⱼ) = 1 (i≠j) with Möbius sums over s_{i,j}, restricted as in the source (5.5)–(5.6).
4. Substitute the change of variables (5.7)–(5.8) to get (5.11). Every s_{i,j} ≠ 1 is coprime to W, hence exceeds D₀; these terms contribute O(y_max²φ(W)^kN(log R)^k/(W^{k+1}D₀)) (5.12), using Σ_{u<R,(u,W)=1} μ²(u)/φ(u) ≪ (φ(W)/W) log R (SV.1/selberg-diagonal-sum-dimension-one).
5. R² ≤ N^{1−2δ} and W ≪ N^δ, so the O(y_max²R²(log R)^{4k}) error is smaller than the first (5.13).

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/maynard-sieve-weights`, `SieveMethodsAndPrimePatterns:SV.4/lambda-max-bound`, `SieveMethodsAndPrimePatterns:SV.4/w-trick-residue`, `AnalyticNumberTheory:AN.2`.

Acceptance:

- The main term is diagonal in y: the change of variables diagonalizes the quadratic form S₁, as in the main term of Selberg's one-dimensional sieve (compare Mathlib's lambdaSquared).

Sources: MAYNARD-2015, §5, Lemma 5.1 and proof, (5.1)–(5.13), pp. 392–395.

### Diagonal form of S₂^{(m)} (Maynard Lemma 5.2)

Identifier: `SieveMethodsAndPrimePatterns:SV.4/s2-diagonalization`. Proposed declaration: `SieveMaynard.sieveSumS2_diagonal`.

Assume in addition that the primes have level of distribution θ, that k ≥ 2, and fix A>0. Then S₂^{(m)} = N/(φ(W) log N) Σ_r (y^{(m)}_r)²/∏g(rᵢ) + O((y^{(m)}_max)² φ(W)^{k−2}N(log N)^{k−2}/(W^{k−1}D₀)) + O(y_max² N/(log N)^A).

N is large, D₀ = log log log N, W = ∏_{p≤D₀}p, v₀ is the W-trick residue of the admissible H = {h₁,…,h_k} (distinct), R = N^{θ/2−δ} with 0<θ≤1 and δ>0 fixed. The implied constants depend on k, H, θ and δ, and not on N, y or F.

y^{(m)}_max bounds |y^{(m)}_r| for every r.

Proof or construction plan:

1. Expand as for S₁ (5.15). The inner sum runs over one class mod q = W∏[dᵢ,eᵢ] and is coprime to q exactly when d_m = e_m = 1. It equals X_N/φ(q) + O(E(N,q)), where X_N = #{N≤n<2N : n prime} and E is windowError (5.16)–(5.18).
2. Error: q is squarefree and less than R²W, and each q arises from at most τ_{3k}(q) tuples. With λ_max ≪ y_max(log R)^k the error is ≪ y_max²(log R)^{2k} Σ_{q<R²W} μ²(q)τ_{3k}(q)E(N,q). Cauchy–Schwarz with E(N,q) ≪ N/φ(q) and PrimesHaveLevel.sum_windowError (R²W < N^{θ−δ} for large N) give ≪ y_max²N/(log N)^A (5.19)–(5.20).
3. Main term: write 1/φ([dᵢ,eᵢ]) = (φ(dᵢ)φ(eᵢ))^{−1} Σ_{uᵢ|dᵢ,eᵢ} g(uᵢ) (5.21), remove the cross coprimality with Möbius sums, and substitute y^{(m)} (5.23) to get (5.24). Terms with s_{i,j} ≠ 1 contribute the D₀ error (5.25).
4. Replace X_N by N/log N + O(N/(log N)²), by the prime number theorem (requested from AN.2); the error is absorbed (5.26)–(5.27).

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/maynard-sieve-weights`, `SieveMethodsAndPrimePatterns:SV.4/lambda-max-bound`, `SieveMethodsAndPrimePatterns:SV.4/w-trick-residue`, `SieveMethodsAndPrimePatterns:SV.3/level-of-distribution`, `AnalyticNumberTheory:AN.2`.

Acceptance:

- This is the only use of the arithmetic hypothesis. Unconditional results come from SV.3/bombieri-vinogradov-level.
- The implied constants are ineffective through Bombieri–Vinogradov (remark after Lemma 5.2).

Sources: MAYNARD-2015, §5, Lemma 5.2 and proof, (5.14)–(5.27), pp. 395–398.

### y^{(m)} in terms of y (Maynard Lemma 5.3)

Identifier: `SieveMethodsAndPrimePatterns:SV.4/y-m-relation`. Proposed declaration: `SieveMaynard.maynardYm_sub_sum_le`.

If r_m = 1, then y^{(m)}_r = Σ_{a_m} y_{r₁,…,r_{m−1},a_m,r_{m+1},…,r_k}/φ(a_m) + O(y_max φ(W) log R/(W D₀)).

N is large, D₀ = log log log N, W = ∏_{p≤D₀}p, v₀ is the W-trick residue of the admissible H = {h₁,…,h_k} (distinct), R = N^{θ/2−δ} with 0<θ≤1 and δ>0 fixed. The implied constants depend on k, H, θ and δ, and not on N, y or F.

Proof or construction plan:

1. Substitute (5.8) into (5.23) (5.28), then swap the d and a sums (5.29).
2. Evaluate Σ_{rᵢ|dᵢ|aᵢ} μ(dᵢ)dᵢ/φ(dᵢ) = μ(aᵢ)rᵢ/φ(aᵢ) for squarefree aᵢ (5.30).
3. Since (aⱼ,W) = 1, either aⱼ = rⱼ or aⱼ > D₀rⱼ. The terms with aⱼ > D₀rⱼ contribute O(y_max φ(W) log R/(WD₀)), using Σ_{a_m<R,(a_m,W)=1} μ²(a_m)/φ(a_m) ≪ (φ(W)/W) log R (5.31).
4. When aⱼ = rⱼ for every j≠m, the factor ∏g(rᵢ)rᵢ/φ(rᵢ)² is 1 + O(1/D₀), because g(p)p/φ(p)² = 1 − 1/(p−1)² and every prime factor exceeds D₀ (5.32).

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/maynard-sieve-weights`, `SieveMethodsAndPrimePatterns:SV.4/w-trick-residue`, `SieveMethodsAndPrimePatterns:SV.1/selberg-diagonal-sum-dimension-one`.

Acceptance:

- y^{(m)} vanishes unless r_m = 1; the lemma is the only link between y^{(m)} and y.

Sources: MAYNARD-2015, §5, Lemma 5.3 and proof, (5.28)–(5.32), pp. 398–399.

### Asymptotic for S₁ (Maynard Lemma 6.2)

Identifier: `SieveMethodsAndPrimePatterns:SV.4/s1-asymptotic`. Proposed declaration: `SieveMaynard.sieveSumS1_smooth`.

S₁ = φ(W)^k N(log R)^k I_k(F)/W^{k+1} + O(F_max² φ(W)^k N(log R)^k/(W^{k+1}D₀)).

N is large, D₀ = log log log N, W = ∏_{p≤D₀}p, v₀ is the W-trick residue of the admissible H = {h₁,…,h_k} (distinct), R = N^{θ/2−δ} with 0<θ≤1 and δ>0 fixed. The implied constants depend on k, H, θ and δ, and not on N, y or F.

F is of class C¹ and supported on ℛ_k, and F_max = sup_{[0,1]^k} (|F| + Σᵢ|∂F/∂tᵢ|); y = y(F) is given by (6.3).

Proof or construction plan:

1. Insert (6.3) into Lemma 5.1 (6.4); y_max ≤ F_max.
2. Drop the pairwise coprimality of the uᵢ: two integers coprime to W with a common factor share a prime greater than D₀. This costs O(F_max²φ(W)^kN(log R)^k/(W^{k+1}D₀)) (6.5).
3. Apply SV.1/selberg-smooth-diagonal-sum k times, once in each variable, with γ(p) = 1 for p∤W and γ(p) = 0 for p|W. Then c_γ = φ(W)/W and L ≪ 1 + Σ_{p|W} log p/p ≪ log D₀ by Mertens (6.7)–(6.9).
4. Combine: the error O(log D₀ (log R)^{k−1}) is smaller than (log R)^k/D₀.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/s1-diagonalization`, `SieveMethodsAndPrimePatterns:SV.1/selberg-smooth-diagonal-sum`, `SieveMethodsAndPrimePatterns:SV.4/maynard-functionals`, `AnalyticNumberTheory:AN.2`.

Acceptance:

- The main term is positive whenever I_k(F) ≠ 0.

Sources: MAYNARD-2015, §6, Lemma 6.2 and proof, (6.4)–(6.9), pp. 401–402.

### Asymptotic for S₂^{(m)} (Maynard Lemma 6.3)

Identifier: `SieveMethodsAndPrimePatterns:SV.4/s2-asymptotic`. Proposed declaration: `SieveMaynard.sieveSumS2_smooth`.

If the primes have level of distribution θ, then S₂^{(m)} = φ(W)^k N(log R)^{k+1} J_k^{(m)}(F)/(W^{k+1} log N) + O(F_max² φ(W)^k N(log R)^k/(W^{k+1}D₀)).

N is large, D₀ = log log log N, W = ∏_{p≤D₀}p, v₀ is the W-trick residue of the admissible H = {h₁,…,h_k} (distinct), R = N^{θ/2−δ} with 0<θ≤1 and δ>0 fixed. The implied constants depend on k, H, θ and δ, and not on N, y or F.

F is of class C¹ and supported on ℛ_k, and F_max = sup_{[0,1]^k} (|F| + Σᵢ|∂F/∂tᵢ|); y = y(F) is given by (6.3).

Proof or construction plan:

1. By Lemma 5.3 and (6.3): if r_m = 1 and ∏rᵢ is squarefree and coprime to W, then y^{(m)}_r = Σ_{(u,W∏rᵢ)=1} μ²(u)/φ(u)·F(…, log u/log R, …) + O(F_max φ(W) log R/(WD₀)) (6.10). In particular y^{(m)}_max ≪ φ(W)F_max log R/W.
2. Apply SV.1/selberg-smooth-diagonal-sum in u with γ(p) = 1 for p∤W∏rᵢ, where L ≪ log log N (6.11)–(6.12). This gives y^{(m)}_r = (log R)(φ(W)/W)∏(φ(rᵢ)/rᵢ)·F^{(m)}_r + O(…), where F^{(m)}_r = ∫_0^1 F(…, t_m, …) dt_m (6.13)–(6.14).
3. Substitute into Lemma 5.2 (6.15)–(6.16) and drop the coprimality of the rᵢ at the cost (6.17).
4. Apply SV.1/selberg-smooth-diagonal-sum to each rᵢ (i≠m) with γ(p) = 1 − (p²−3p+1)/(p³−p²−2p+1) for p∤W, for which γ(p)/(p−γ(p)) = φ(p)²/(g(p)p²) (6.19). The result is J_k^{(m)} (6.21)–(6.22).

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/s2-diagonalization`, `SieveMethodsAndPrimePatterns:SV.4/y-m-relation`, `SieveMethodsAndPrimePatterns:SV.1/selberg-smooth-diagonal-sum`, `SieveMethodsAndPrimePatterns:SV.4/maynard-functionals`, `AnalyticNumberTheory:AN.2`.

Acceptance:

- Check of (6.19): p(p−1)²/(p³−p²−2p+1) = 1 − (p²−3p+1)/(p³−p²−2p+1). arXiv v2 printed a different γ; v3 and the published text agree on this one.

Sources: MAYNARD-2015, §6, Lemma 6.3 and proof, (6.10)–(6.22), pp. 402–404.

### Maynard's asymptotics for S₁ and S₂ (Proposition 4.1)

Identifier: `SieveMethodsAndPrimePatterns:SV.4/maynard-sum-asymptotics`. Proposed declaration: `SieveMaynard.tendsto_sieveSums`.

Let the primes have level of distribution θ∈(0,1], let R = N^{θ/2−δ} with δ>0 fixed, and let F be smooth and supported on ℛ_k with I_k(F) ≠ 0 and J_k^{(m)}(F) ≠ 0 for every m. With λ built from F: S₁ = (1+o(1)) φ(W)^k N(log R)^k I_k(F)/W^{k+1}, and for every m, S₂^{(m)} = (1+o(1)) φ(W)^k N(log R)^{k+1} J_k^{(m)}(F)/(W^{k+1} log N); hence S₂ = Σ_m S₂^{(m)} has the stated asymptotic.

N is large, D₀ = log log log N, W = ∏_{p≤D₀}p, v₀ is the W-trick residue of the admissible H = {h₁,…,h_k} (distinct), R = N^{θ/2−δ} with 0<θ≤1 and δ>0 fixed. The implied constants depend on k, H, θ and δ, and not on N, y or F.

Maynard states Proposition 4.1 with 'exponent of distribution θ'; it is the level of distribution of (1.3).

Proof or construction plan:

1. Apply Lemmas 6.2 and 6.3 with F fixed: F_max is a constant and D₀ → ∞, so each error term is o(main term), because I_k(F) and J_k^{(m)}(F) are nonzero.
2. The λ of Proposition 4.1 is the construction from (6.3), by the inversion (5.8).

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/s1-asymptotic`, `SieveMethodsAndPrimePatterns:SV.4/s2-asymptotic`.

Acceptance:

- The S₂ asymptotic, summed over m, is Proposition 4.1's display with Σ_m J_k^{(m)}(F).

Sources: MAYNARD-2015, §4, Proposition 4.1, p. 388.

### Primes in admissible tuples (Maynard Proposition 4.2)

Identifier: `SieveMethodsAndPrimePatterns:SV.4/maynard-many-primes`. Proposed declaration: `SieveMaynard.infinite_many_primes_of_level`. Atlas planet: Maynard's refinement of the GPY sieve.

Let the primes have level of distribution θ∈(0,1] and let H = {h₁,…,h_k} be admissible. With r_k = ⌈θM_k/2⌉, there are infinitely many n such that at least r_k of n+h₁, …, n+h_k are prime. In particular liminf_n (p_{n+r_k−1} − p_n) ≤ max_{i,j}(hᵢ − hⱼ).

The hᵢ are distinct. M_k is the quantity of SV.4/maynard-functionals.

Proof or construction plan:

1. Choose F₀∈𝒮_k with ratio > M_k − δ, and then a smooth F₁ with ratio > M_k − 2δ (SV.4/ratio-smooth-approximation).
2. Proposition 4.1 for F₁ gives S = S₂ − ρS₁ = (φ(W)^kN(log R)^k I_k(F₁)/W^{k+1})·((log R/log N) Σ_m J^{(m)}(F₁) − ρI(F₁) + o(1)) ≥ (…)·((θ/2 − δ)(M_k − 2δ) − ρ + o(1)). This is (4.4), whose printed sum index j should be m (E27).
3. Take ρ = θM_k/2 − ε, with δ small in terms of ε. Then S > 0 for all large N. The weights are nonnegative, so the positivity criterion gives, for each large N, some n∈[N,2N) with at least ⌊ρ+1⌋ = ⌈θM_k/2⌉ of the n+hᵢ prime (ε small).
4. Since this holds for every large N, there are infinitely many such n. The gap statement is SV.4/clustered-primes-to-gaps.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/maynard-sum-asymptotics`, `SieveMethodsAndPrimePatterns:SV.4/ratio-smooth-approximation`, `SieveMethodsAndPrimePatterns:SV.4/gpy-positivity-criterion`, `SieveMethodsAndPrimePatterns:SV.4/maynard-functionals`, `SieveMethodsAndPrimePatterns:SV.4/admissible-tuple`, `SieveMethodsAndPrimePatterns:SV.4/clustered-primes-to-gaps`.

Acceptance:

- k = 105 and θ = 1/2 − ε give r₁₀₅ ≥ 2 (Theorem 1.3). k = 5 and θ = 1 − ε give r₅ ≥ 2 under Elliott–Halberstam (Theorem 1.4).

Sources: MAYNARD-2015, §4, Proposition 4.2 and proof, (4.4), p. 389.

### From prime clusters to prime gaps

Identifier: `SieveMethodsAndPrimePatterns:SV.4/clustered-primes-to-gaps`. Proposed declaration: `SieveMaynard.frequently_nth_prime_sub_le`.

Let H be finite and nonempty and r ≥ 1. If infinitely many n have at least r of the n+h (h∈H) prime, then p_{j+r−1} − p_j ≤ max H − min H for infinitely many j, i.e. liminf_j (p_{j+r−1} − p_j) ≤ max H − min H. Here p_j is the j-th prime, counted from 0.

Maynard's p_n is 1-indexed. Differences p_{n+m} − p_n are unaffected by the shift.

Proof or construction plan:

1. For such an n, let q₁ < … < q_r be r of the primes among the n+h, and let j be the index of q₁. The r primes lie in [q₁, q_r], so p_{j+r−1} ≤ q_r and p_{j+r−1} − p_j ≤ q_r − q₁ ≤ max H − min H.
2. Distinct large n give arbitrarily large q₁, hence infinitely many j.

Direct prerequisites: `mathlib:Nat.nth`, `mathlib:Nat.prime_nth_prime`.

Acceptance:

- With r = 2 and H of diameter 600 this is the step from Proposition 4.2 to liminf(p_{n+1} − p_n) ≤ 600.

Sources: MAYNARD-2015, §4, Proposition 4.2, last sentence, p. 389.

## Maynard checkpoint: lower bounds for M_k (SV.4)

Section 7 gives M_k > log k − 2 log log k − 2 for large k from a product test function and a second-moment bound. Section 8 gives M₅ > 2 and M₁₀₅ > 4 from symmetric polynomials in P₁ and P₂ through Lemmas 8.1–8.2. Lemma 8.1's G_{b,j} must include the r=0 term (E31): with the printed formula the k=5 example evaluates to 26784/17753 instead of 1417255/708216. The source's numbers are right.

### Lower bound for M_k when k is large (Maynard Proposition 4.3(3))

Identifier: `SieveMethodsAndPrimePatterns:SV.4/maynard-large-k-lower-bound`. Proposed declaration: `SieveMaynard.eventually_log_sub_lt_maynardM`.

For all sufficiently large k, M_k > log k − 2 log log k − 2.

The implied constants in §7 are independent of k.

Proof or construction plan:

1. Take F(t) = ∏g(ktᵢ) on ℛ_k (7.3), with g supported on [0,T], γ = ∫g², and μ = ∫ug²/γ < 1 − T/k (7.8). Then I_k ≤ k^{−k}γ^k (7.4), and J_k ≥ J′_k − E_k with J′_k = k^{−k−1}γ^{k−1}(∫g)² (7.5)–(7.7).
2. Bound E_k by a second moment. With η = (k−T)/(k−1) − μ > 0, 1 ≤ η^{−2}(Σ_{i≥2}uᵢ/(k−1) − μ)² on the error region (7.9). Drop the constraint Σ_{i=2}^k uᵢ > k−T (printed with i=1, E30) and expand the square: E_k ≤ η^{−2}μTk^{−k−1}γ^{k−1}(∫g)²/(k−1) (7.10)–(7.13).
3. Hence kJ_k/I_k ≥ ((∫g)²/∫g²)·(1 − T/(k(1 − T/k − μ)²)) (7.14). This uses (k−1)η² ≥ k(1 − T/k − μ)², which holds because η = x + (k−T)/(k(k−1)) with x = 1 − T/k − μ and 2(k−T)/k ≥ x.
4. Choose g(t) = 1/(1+At) on [0,T] with 1 + AT = e^A (7.16)–(7.18), and A = log k − 2 log log k (7.20)–(7.21).

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/maynard-functionals`.

Acceptance:

- Only the leading term log k matters for Theorem 1.1. The −2 absorbs the loss log k/((log k)² + O(1)) in (7.21).

Sources: MAYNARD-2015, §7, (7.1)–(7.21), pp. 405–408.

### Moments on the simplex (Maynard Lemma 8.1, corrected)

Identifier: `SieveMethodsAndPrimePatterns:SV.4/simplex-dirichlet-moment`. Proposed declaration: `SieveMaynard.integral_simplex_moment`.

For integers k ≥ 1 and a, b, j ≥ 0: ∫_{ℛ_k} (1 − P₁)^a P_j^b dt = (a! b!/(k+a+jb)!) Σ_{b₁+…+b_k=b} ∏ᵢ (jbᵢ)!/bᵢ! = (a!/(k+jb+a)!)·G_{b,j}(k). Here P_j = Σtᵢ^j and G_{b,j}(x) = b! Σ_{r=0}^{b} C(x,r) Σ_{b₁,…,b_r≥1, Σbᵢ=b} ∏(jbᵢ)!/bᵢ!. The term r = 0, which makes G_{0,j} = 1, is needed; the printed formula starts at r = 1 (E31).

The multinomial form, summed over all (b₁,…,b_k) including zero entries, needs no convention at b = 0.

Proof or construction plan:

1. Dirichlet integral (8.2): ∫_{ℛ_k}(1−Σtᵢ)^a ∏tᵢ^{aᵢ} = a!∏aᵢ!/(k + a + Σaᵢ)!. Prove it by induction on k: integrate t₁ over [0, 1 − Σ_{i≥2}tᵢ] with v = t₁/(1 − Σ_{i≥2}tᵢ) and use the Beta integral ∫_0^1 t^a(1−t)^b dt = a!b!/(a+b+1)! (from Mathlib's Γ–Beta identity) (8.3).
2. Expand P_j^b by the multinomial theorem (8.4) and apply (8.2); this gives (8.5).
3. Group the tuples by the number r of nonzero bᵢ (8.6). For b = 0 the only tuple is zero, which is the r = 0 term.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/maynard-functionals`, `mathlib:Finset.Nat.antidiagonalTuple`, `mathlib:Complex.Gamma_mul_Gamma_eq_betaIntegral`.

Acceptance:

- k = 5, a = 2, b = 0: the integral is 2!/7! = 1/2520, while the printed formula gives 0.
- k = 1, a = 0, b = 1, j = 1: ∫_0^1 t dt = 1/2.

Sources: MAYNARD-2015, §8, Lemma 8.1 and proof, (8.2)–(8.6), pp. 409–410.

### I_k and J_k as quadratic forms (Maynard Lemma 8.2)

Identifier: `SieveMethodsAndPrimePatterns:SV.4/symmetric-polynomial-quadratic-forms`. Proposed declaration: `SieveMaynard.maynardI_J_symmetricPoly`.

For P = Σ_{i=1}^d aᵢ(1 − P₁)^{bᵢ}P₂^{cᵢ} and F = P on ℛ_k (0 elsewhere), with k ≥ 2: I_k(F) = Σ_{i,j} aᵢaⱼ(bᵢ+bⱼ)! G_{cᵢ+cⱼ,2}(k)/(k+bᵢ+bⱼ+2cᵢ+2cⱼ)!, and J_k^{(m)}(F) = Σ_{i,j} aᵢaⱼ Σ_{c′₁≤cᵢ, c′₂≤cⱼ} C(cᵢ,c′₁)C(cⱼ,c′₂)·γ·G_{c′₁+c′₂,2}(k−1)/(k+bᵢ+bⱼ+2cᵢ+2cⱼ+1)!. Here γ = bᵢ!bⱼ!(2cᵢ−2c′₁)!(2cⱼ−2c′₂)!(bᵢ+bⱼ+2cᵢ+2cⱼ−2c′₁−2c′₂+2)!/((bᵢ+2cᵢ−2c′₁+1)!(bⱼ+2cⱼ−2c′₂+1)!), and G includes the r = 0 term (E31). So I_k and Σ_m J_k^{(m)} are quadratic forms aᵀA₁a and aᵀA₂a with rational A₁, A₂.

F is symmetric, so J_k^{(m)} does not depend on m and Σ_m J_k^{(m)} = kJ_k^{(1)}.

Proof or construction plan:

1. I_k: expand P² and apply the corrected Lemma 8.1 with j = 2 (8.7).
2. J: expand P₂^c = Σ C(c,c′)(P′₂)^{c′} t₁^{2c−2c′} and integrate in t₁ with the Beta integral (8.8); then square (8.9).
3. Apply Lemma 8.1 on ℛ_{k−1}: ∫_{ℛ_{k−1}}(1−P′₁)^B(P′₂)^{c′} = B! G_{c′,2}(k−1)/(k−1+B+2c′)!. The printed (8.10) has (k+b+c−1)! and G_{c,2} (E32). With B = bᵢ+bⱼ+2cᵢ+2cⱼ−2c′₁−2c′₂+2 the denominator is (k+bᵢ+bⱼ+2cᵢ+2cⱼ+1)!, as in the lemma.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/simplex-dirichlet-moment`, `SieveMethodsAndPrimePatterns:SV.4/maynard-functionals`.

Acceptance:

- k = 5 with (8.16): exact rational arithmetic with these formulas gives I₅ = 29509/1222452000 and ratio 1417255/708216, which agrees with direct integration. The printed G (r ≥ 1) gives I₅ = 17753/977961600 and ratio 26784/17753 ≈ 1.509.
- By Lemma 8.3 the best ratio in the span is the largest eigenvalue of A₁^{−1}A₂. A lower bound for M_k needs only one explicit coefficient vector.

Sources: MAYNARD-2015, §8, Lemma 8.2 and proof, (8.7)–(8.10), pp. 410–411.

### M₅ > 2 (Maynard Proposition 4.3(1))

Identifier: `SieveMethodsAndPrimePatterns:SV.4/m5-lower-bound`. Proposed declaration: `SieveMaynard.maynardM_five_ge`.

M₅ ≥ 1417255/708216 > 2.

F = P·1_{ℛ₅} with P = (1−P₁)P₂ + (7/10)(1−P₁)² + (1/14)P₂ − (3/14)(1−P₁) (8.16).

Proof or construction plan:

1. F is bounded and supported on ℛ₅, with I ≠ 0 and every J^{(m)} ≠ 0, so it is admissible.
2. Lemma 8.2 with these four monomials gives I₅(F) = 29509/1222452000, Σ_m J₅^{(m)}(F) = 5J₅^{(1)}(F), and the ratio exactly 1417255/708216 (8.17).
3. maynardRatio_le_maynardM.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/symmetric-polynomial-quadratic-forms`, `SieveMethodsAndPrimePatterns:SV.4/maynard-functionals`.

Acceptance:

- 1417255/708216 ≈ 2.00115. The exact value was recomputed here, both by direct Dirichlet-integral expansion and by the corrected Lemma 8.2.
- θM₅/2 > 1 needs θ > 2·708216/1417255 ≈ 0.99942, which is why Theorem 1.4 needs Elliott–Halberstam.

Sources: MAYNARD-2015, §8, (8.16)–(8.17), p. 412.

### M₁₀₅ > 4 (Maynard Proposition 4.3(2))

Identifier: `SieveMethodsAndPrimePatterns:SV.4/m105-lower-bound`. Proposed declaration: `SieveMaynard.four_lt_maynardM_105`.

M₁₀₅ > 4.

P is a linear combination of the 42 monomials (1−P₁)^bP₂^c with b + 2c ≤ 11, and k = 105.

Proof or construction plan:

1. Form the 42×42 rational matrices A₁, A₂ of Lemma 8.2 at k = 105.
2. The largest eigenvalue of A₁^{−1}A₂ is ≈ 4.0020697 (8.15). Instead of bounding an eigenvalue, take a rational approximation a of the eigenvector and check aᵀA₂a > 4aᵀA₁a in exact arithmetic, as the source suggests.
3. maynardRatio_le_maynardM.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/symmetric-polynomial-quadratic-forms`, `SieveMethodsAndPrimePatterns:SV.4/maynard-functionals`.

Acceptance:

- Recomputed here: the largest eigenvalue is 4.00206976…, and a rational coefficient vector (denominators 10^60) gives an exact ratio 4.0020697619… > 4.
- (1/2 − ε)M₁₀₅/2 > 1 for small ε: this is the input of Theorem 1.3.

Sources: MAYNARD-2015, §8, (8.15) and the following sentence, p. 412.

## Maynard checkpoint: the bounded-gap theorems (SV.4)

Theorems 1.1–1.4 follow from Propositions 4.2 and 4.3 with explicit admissible tuples. Unconditionally, Bombieri–Vinogradov gives liminf(p_{n+1}−p_n) ≤ 600 and liminf(p_{n+m}−p_n) ≪ m³e^{4m}. Under Elliott–Halberstam, 12 and 600. The positive-proportion theorem is not the prime k-tuples conjecture for any single tuple.

### Engelsma's admissible 105-tuple of diameter 600

Identifier: `SieveMethodsAndPrimePatterns:SV.4/engelsma-admissible-105-tuple`. Proposed declaration: `SieveMaynard.engelsma_tuple_admissible`.

The 105-element set H₁₀₅ = {0, 10, 12, 24, 28, …, 594, 598, 600} of Maynard's footnote 2 is admissible, contains 0 and 600, and lies in [0,600].

The set is copied in full into the suggested Lean file.

Proof or construction plan:

1. By isAdmissible_iff_card_image_lt, only the 27 primes p ≤ 103 need checking. For each, exhibit a missed residue: for example 1 mod 2, 2 mod 3, 1 mod 5, 4 mod 7, 7 mod 11 and 6 mod 13.
2. This is a finite, decidable computation.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/admissible-tuple`.

Acceptance:

- Recomputed here: the 105 elements are distinct and sorted, the set is admissible, and its diameter is 600. The list in the published text agrees with arXiv v3.

Sources: MAYNARD-2015, §4, footnote 2, p. 390.

### The first k primes above k are admissible

Identifier: `SieveMethodsAndPrimePatterns:SV.4/first-primes-above-k-admissible`. Proposed declaration: `SieveMaynard.firstPrimesAbove_admissible`.

For every k, the first k primes greater than k form an admissible set. Its diameter p_{π(k)+k} − p_{π(k)+1} is O(k log k).

In 0-indexed form the set is {nth prime (π(k) + i) : i < k}.

Proof or construction plan:

1. Every element is a prime greater than k, so none is divisible by a prime p ≤ k = #H; apply isAdmissible_of_forall_not_dvd. The published argument says 'less than k', and so omits p = k when k is prime (E29).
2. Diameter: π(k) + k ≤ 2k, and Chebyshev's lower bound π(x) ≥ c·x/log x (Mathlib pi_ge') gives p_n ≪ n log n.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/admissible-tuple`, `mathlib:Nat.nth`, `mathlib:Nat.prime_nth_prime`, `mathlib:Chebyshev.pi_ge'`.

Acceptance:

- k = 5: {7, 11, 13, 17, 19}. It misses 0 mod 5 because no element is divisible by 5; this is the case p = k.

Sources: MAYNARD-2015, §4, proof of Theorem 1.1, p. 391.

### Bounded gaps between primes (Maynard Theorem 1.3)

Identifier: `SieveMethodsAndPrimePatterns:SV.4/bounded-gaps-600`. Proposed declaration: `SieveMaynard.frequently_nth_prime_succ_sub_le_600`. Atlas planet: Bounded gaps between primes (at most 600).

liminf_n (p_{n+1} − p_n) ≤ 600.

Unconditional. It uses Bombieri–Vinogradov and none of Zhang's technology.

Proof or construction plan:

1. Bombieri–Vinogradov gives level θ = 1/2 − ε. Since M₁₀₅ > 4, θM₁₀₅/2 > 1 for small ε, so r₁₀₅ = ⌈θM₁₀₅/2⌉ ≥ 2.
2. Proposition 4.2 with Engelsma's admissible H₁₀₅ (diameter 600): infinitely many n have two primes among the n + H₁₀₅. Hence liminf(p_{n+1} − p_n) ≤ 600.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/maynard-many-primes`, `SieveMethodsAndPrimePatterns:SV.4/m105-lower-bound`, `SieveMethodsAndPrimePatterns:SV.4/engelsma-admissible-105-tuple`, `SieveMethodsAndPrimePatterns:SV.3/bombieri-vinogradov-level`, `SieveMethodsAndPrimePatterns:SV.4/clustered-primes-to-gaps`.

Acceptance:

- This is not the twin prime conjecture, and 600 is not optimal (Maynard, p. 385).

Sources: MAYNARD-2015, §1, Theorem 1.3, p. 385; proof, p. 390.

### Gaps under Elliott–Halberstam (Maynard Theorem 1.4)

Identifier: `SieveMethodsAndPrimePatterns:SV.4/elliott-halberstam-gaps`. Proposed declaration: `SieveMaynard.elliottHalberstam_gaps`.

If the primes have level of distribution θ for every θ < 1 (the Elliott–Halberstam conjecture), then liminf(p_{n+1} − p_n) ≤ 12 and liminf(p_{n+2} − p_n) ≤ 600.

Conditional on the named hypothesis ElliottHalberstam of SV.3/level-of-distribution.

Proof or construction plan:

1. k = 105 and θ = 1 − ε: θM₁₀₅/2 > 2, so three primes occur among n + H₁₀₅ infinitely often, and liminf(p_{n+2} − p_n) ≤ 600.
2. k = 5, H = {0,2,6,8,12} (admissible, diameter 12) and θ = 1 − ε: θM₅/2 > 1, so liminf(p_{n+1} − p_n) ≤ 12.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/maynard-many-primes`, `SieveMethodsAndPrimePatterns:SV.4/m5-lower-bound`, `SieveMethodsAndPrimePatterns:SV.4/m105-lower-bound`, `SieveMethodsAndPrimePatterns:SV.4/engelsma-admissible-105-tuple`, `SieveMethodsAndPrimePatterns:SV.4/admissible-tuple`, `SieveMethodsAndPrimePatterns:SV.3/level-of-distribution`, `SieveMethodsAndPrimePatterns:SV.4/clustered-primes-to-gaps`.

Acceptance:

- 12 appears to be optimal for the method in its current form (Maynard, p. 385).

Sources: MAYNARD-2015, §1, Theorem 1.4, p. 385; proof, p. 390.

### m + 1 primes in bounded intervals (Maynard Theorem 1.1)

Identifier: `SieveMethodsAndPrimePatterns:SV.4/m-primes-bounded-intervals`. Proposed declaration: `SieveMaynard.exists_frequently_nth_prime_sub_le`. Atlas planet: m + 1 primes in bounded intervals.

There is an absolute constant C such that liminf_n (p_{n+m} − p_n) ≤ C m³ e^{4m} for every m ≥ 1.

Unconditional.

Proof or construction plan:

1. Take θ = 1/2 − 1/k (Bombieri–Vinogradov). By Proposition 4.3(3), θM_k/2 ≥ (1/4 − 1/(2k))(log k − 2 log log k − 2) (4.5), which exceeds m once k ≥ C₀m²e^{4m} for an absolute C₀.
2. Take k = ⌈C₀m²e^{4m}⌉ and H the first k primes above k, which is admissible with diameter ≪ k log k.
3. Proposition 4.2 gives m + 1 primes among n + H infinitely often, so liminf(p_{n+m} − p_n) ≪ k log k ≪ m³e^{4m}.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/maynard-many-primes`, `SieveMethodsAndPrimePatterns:SV.4/maynard-large-k-lower-bound`, `SieveMethodsAndPrimePatterns:SV.4/first-primes-above-k-admissible`, `SieveMethodsAndPrimePatterns:SV.3/bombieri-vinogradov-level`, `SieveMethodsAndPrimePatterns:SV.4/clustered-primes-to-gaps`.

Acceptance:

- Under Elliott–Halberstam the bound improves to O(m³e^{2m}) (Maynard, p. 385); that is not planned here.

Sources: MAYNARD-2015, §1, Theorem 1.1, p. 384; proof, p. 391.

### A positive proportion of admissible m-tuples are prime (Maynard Theorem 1.2)

Identifier: `SieveMethodsAndPrimePatterns:SV.4/positive-proportion-prime-tuples`. Proposed declaration: `SieveMaynard.positive_proportion_prime_tuples`.

For every m ≥ 1 there are r₀ and c > 0 such that every set A of r ≥ r₀ distinct nonnegative integers has at least c·C(r,m) subsets {h₁,…,h_m} ⊆ A for which infinitely many n make every n + hᵢ prime.

The source allows arbitrary integers. Translating A by a constant changes neither count, so natural numbers suffice.

Proof or construction plan:

1. With k = ⌈Cm²e^{4m}⌉ as in Theorem 1.1, every admissible k-set contains an m-subset with infinitely many prime translates.
2. Thin A: for each prime p ≤ k, delete the residue class mod p with the fewest elements. The remainder A₂ has s ≥ r∏_{p≤k}(1 − 1/p) elements, and every k-subset of it is admissible.
3. Double count: each of the C(s,k) k-subsets contains a good m-subset, and each m-subset lies in C(s−m,k−m) of them. So there are at least C(s,k)/C(s−m,k−m) ≫_m s^m ≫_m r^m good m-subsets, while C(r,m) ≤ r^m.

Direct prerequisites: `SieveMethodsAndPrimePatterns:SV.4/maynard-many-primes`, `SieveMethodsAndPrimePatterns:SV.4/maynard-large-k-lower-bound`, `SieveMethodsAndPrimePatterns:SV.4/admissible-tuple`, `SieveMethodsAndPrimePatterns:SV.4/prime-tuples-conjecture`, `SieveMethodsAndPrimePatterns:SV.3/bombieri-vinogradov-level`.

Acceptance:

- This is a positive-proportion statement, not the prime m-tuples conjecture for any given tuple.

Sources: MAYNARD-2015, §1, Theorem 1.2, p. 385; proof, p. 391.

## Maynard checkpoint: sources, findings, ownership and validation

### Source findings

Six new, unreviewed findings against the published paper are recorded. Each is also present in arXiv v1–v3.

- E27 (misprint): the sum in (4.4) is indexed by j but its summand is J_k^{(m)}; it should run over m.
- E28 (misprint): (5.8) prints μ_i(d_i) for μ(d_i).
- E29 (misprint): the admissibility argument for the first k primes above k says 'a prime less than k', which omits p = k when k is prime. The correct wording is 'at most k'.
- E30 (misprint): before (7.10), the dropped constraint is Σ_{i=2}^k uᵢ > k−T, not Σ_{i=1}^k.
- E31 (error): Lemma 8.1's G_{b,j} sums from r=1, so G_{0,j} = 0 and the lemma fails at b = 0, which Lemma 8.2 needs. The r=0 term restores it. The paper's numerical results (8.15) and (8.17) are nonetheless correct.
- E32 (misprint): (8.10) should read b!/(k+b+2c′−1)!·G_{c′,2}(k−1). The statement of Lemma 8.2 already agrees with the corrected form.

The Annals article page lists no erratum, and a web search found none. No author contact and no exhaustive novelty claim are made.

### Ownership and requests

Under accepted RS-07, SV.4 owns admissible tuples, the prime-tuple conjecture statement formerly in AN.6, Maynard's weights, asymptotics and positivity, and the finite-gap theorems. SV.3 owns Bombieri–Vinogradov and the explicit distribution hypotheses. AdditiveCombinatorics:AC.4 keeps its own W-trick and Goldston–Yıldırım majorant. The Maynard W-trick here is the tuple version and does not duplicate it. One request goes to AnalyticNumberTheory:AN.2: Mertens' first theorem, and the prime number theorem with error O(N/(log N)²) on [N,2N). Mathlib 082e2d3 has neither; it has Chebyshev's bounds, Abel summation, primorials, CRT and the Λ² sieve, and these are imported rather than replanned. Mathlib's lambdaSquared is the one-dimensional case of Maynard's weights (a compatibility API item).

### Historical validation of the Maynard checkpoint (29 September 2026)

- The packet has 106 nodes: 75 inherited node objects, preserved exactly, and 31 new ones. The new nodes are 4 definitions, 2 constructions, 15 lemmas and 10 theorems, with 44 API items and 25 unit tests. There are eight new planets: two in SV.3 and six in SV.4.
- The suggested file elaborates with Lean 4.34.0-rc2 against the pinned Mathlib. It has no errors and 252 proof-placeholder warnings (178 inherited, 74 new), and no other warnings. It contains specifications only; every node is unchecked.
- Exact rational arithmetic reproduces (8.17): I₅ = 29509/1222452000 and ratio 1417255/708216. This was done both by expanding the test polynomial into Dirichlet integrals and by the corrected Lemma 8.2.
- The 42×42 problem at k = 105 gives the largest eigenvalue 4.00206976…, which agrees with (8.15). A rational eigenvector approximation has an exact ratio above 4.
- Engelsma's 105-tuple is admissible with diameter 600, and the first k primes above k are admissible for every k < 60. The small values used in the unit tests were recomputed.
- The official blueprint checker and the four-file intake check pass.

### Continuation boundary

The incoming Maynard paper is source-decomposed. The added SV.4 polynomial-prime predicates are separate remaining targets. Maynard’s remaining outside inputs are:
- the decomposition of Kedlaya Theorem 18.4 (SV.3);
- an open proof source for GGPY Lemma 3 (SV.1);
- Mertens' theorem and the prime number theorem (AN.2).

Natural next sources for this roadmap are Polymath 8b (variants of M_k and the ε-trick) for SV.4, and the Chen and beta-sieve papers for SV.5.

## Quantitative sieve dimension and the combinatorial sieve

The absolute remainder of a finite sieve is a mathematical quantity, not a consequence of its coefficient cutoff. This continuation distinguishes two density conditions, specifies a changing population's level of distribution, and connects them to the corrected elementary Brun estimate. The underlying population, density, divisibility sums and Möbius function remain the pinned library objects.

There are two different dimension hypotheses. With fixed selected primes and density g(p)=ω(p)/p, the logarithmic condition bounds the partial sums of g(p)log p by κlog z+C for every z≥2. It controls a positively tilted finite Euler product by a power of log z. The combinatorial sieve instead uses a product ratio over w≤p<z, bounded by K(log z/log w)^κ for every 2≤w≤z. Positivity and g(p)<1 must accompany the latter in a sieve application: the totalized inverse at g(p)=1 is zero and cannot represent removal of a full local obstruction. The two predicates are not identified without a proof comparing their hypotheses.

The strict remainder mass sums |R_d| over positive divisors d<D. In particular, it is zero for D≤1, includes |A₁−X| once D>1, and retains the sum of the absolute values when two signed remainders cancel. A family F(x) has positive level θ when each requested logarithmic saving A has one B,C,x₀ controlling the entire absolute remainder sum below x^θ/(log x)^B, for every x≥x₀. None of these constants may be selected afresh at each x. This weighted-population predicate is distinct from the prime-counting predicate already specified for Maynard: it has different observables and cannot silently replace a π-centred discrepancy estimate.

The finite weighted Rankin inequalities use only squarefree divisor algebra and real-power monotonicity. The moment identity

\[
 \sum_{d\mid P}\nu(d)d^a=\prod_{p\mid P}(1+\nu(p)p^a)
\]

holds for every real a because each divisor is a product of distinct primes. The product is finite; neither convergence of an infinite Euler product nor a smooth-number counting theorem is required. Multiply the small-divisor indicator by (x/d)^σ to obtain the weighted prefix bound, and multiply the large-divisor indicator by (d/x)^a to obtain the density tail bound. Empty and one-prime sets have the same conventions as the existing sieve. The generic Rankin smooth-number count of Kedlaya Lemma 11.5 is requested from AN.5 using the existing positive smooth-number finset, whose threshold is strict. The source's p≤z convention becomes the native threshold z+1 for an integer z. No competing smoothness predicate is introduced here.

For the analytic dimension consequence, partial summation of the logarithmic bound gives Σg(p)≤κlog log z+O(1). Write α=1/log z. On p≤z, the quantity αlog p lies between zero and one, so exp(αlog p)−1≤exp(1)αlog p. The logarithmic dimension condition therefore bounds the extra tilt Σg(p)(p^α−1) by a constant independent of z. The native finite product-versus-exponential inequality now gives the tilted Euler bound. Choose z₀≥exp(2) so that σ=1−1/log z lies strictly between zero and one. Weighted Rankin then gives the source's divisor-count estimate, with constants uniform in both the cutoff and the population. A direct finite tail argument even removes the extra logarithm from the source's integral-tail proof. That improvement is an explicit derivation, not a quotation of a stronger source theorem.

The Eratosthenes variant requires a separately justified 0≤X≤Mx and a genuine A_d=0 condition above x. It splits the finite absolute remainder into the small-divisor bound c dν(d) and the zero-count tail Xν(d). Both are controlled by the same tilted moment. The residue-label construction does not supply either hypothesis: a label made from all bad primes may be much larger than the original sample parameter. The exact advertised Theorem 11.9 under its printed hypotheses and the two-residue twin-prime application remain source gaps; this stronger-hypothesis conditional result is not an unqualified repair.

For Brun's coefficients, list a divisor's primes in strictly decreasing order. The prefix in the threshold includes the prime at the tested position. The positive coefficients impose the threshold at odd positions; the negative coefficients impose it at even positions. Neither system restricts a divisor merely by whether its total number of prime factors is odd or even. Both retain the unit. The first-failure expansion gives a nonnegative correction to the upper main term and a nonnegative deficit from the lower main term. This proves the direction of the pointwise divisor brackets before any distribution hypothesis is used.

The support bound treats the exceptional single-prime lower coefficient explicitly. It follows from p<z≤y, while the longer lists are controlled by the last relevant prefix condition. Thus every nonzero coefficient has d<y, not d≤y. The modulus is at most one because the coefficient is zero or a native Möbius value. These support and modulus facts, and the coefficient-sensitive remainder bound, are promoted to separate declarations because the fundamental estimate consumes them.

With β=9κ+1 and u≥β, set z=y^(1/u) and δ=exp(β−u)K^10. The corrected estimate is

\[
 (1-\delta)V X-\mathcal R(y)\le S\le(1+\delta)V X+\mathcal R(y),
 \qquad V=\prod_{p\mid P}(1-\nu(p)).
\]

It assumes X≥0, the actual product-dimension hypothesis and the prime cutoff. A positive sifted lower bound additionally needs δ<1 and an error smaller than its main term. This is the elementary combinatorial sieve in its specified range, not a sharp beta-sieve theorem, a prime lower bound or a parity-breaking Chen input.

The elementary almost-prime transfer uses the existing at-most predicate, with factors counted with multiplicity. If every prime factor is at least a natural z≥2 and n<z^(k+1), then Ω(n)≤k. Equality at the cutoff cannot be allowed: n=8,z=2,k=2 has one distinct prime factor but three factors counted with multiplicity. The unit is permitted and zero is excluded. This transfer supplies no lower count of a sifted population and no advanced-sieve analytic theorem.

### Source corrections and evidence boundaries

The entire live author Chapters 11 and 12, including their exercises, were read. Chapter 11 is byte-identical to its earlier acquisition. Chapter 12's exact acquisition and scope are recorded in the packet; no dated print edition is identified or collated.

E33 records the lower-sign slip in Theorem 12.2. Its first-failure identity has V−V⁻ nonnegative, so V⁻ cannot exceed (1+δ)V for positive δ and V. The next displayed consequence already uses the intended minus sign. E34 records the unshifted prime-indicator example: at x=25,z=5 it gives six surviving primes, whereas there are nine primes at most 25 and four twin-prime starts. A shifted bad residue n≡−2 and its endpoint and uniform-distribution obligations are missing from that paragraph. E35 records the source's inclusive-versus-strict prime-product mismatch: for selected primes {2},g(2)=1/2,z=3 its exercise identity gives 3/4 instead of 1/2 if V(2) includes the prime 2. The first-failure factor must use primes strictly below its last prime. These findings do not assert that an intended classical sieve theorem is false. They await independent review; bounded correction searches establish no exhaustive novelty claim.

Exact rational tests verify the finite coefficient and first-failure identities, including high-density local factors, strict boundaries and empty prime sets. The integer-exponent Rankin tests do not verify the real-exponent analytic estimate or the infinite uniform quantifiers in the family-level predicate. Separate kernel-checked finite examples establish the native almost-prime multiplicities, source prime-count witness and strict divisor-cutoff counts without using any of the suggested declarations. Earlier Maynard, character, Fourier and dyadic evidence is retained as historical evidence, not claimed rerun by this continuation.

### Ownership and unfinished target-level pass

The accepted 30 September RS-07 decision withholds the non-atomic edge replacement. The existing AN.3→SV.2 graph edge remains; SV.2→AN.3 must not be installed from the older handoff. Mathematical ownership of the large-sieve and Vaughan core is distinct from that withheld graph operation.

The confirmed RT-AREA-combinatorics/9 finding says that SV.3→AC.4 has no actual consuming route. Its deletion is a maintainer/restructuring proposal, not an edit to another roadmap's packet or atlas data. AC.4 requires the SV.1 majorant and its modulus-uniform AN.3 input; AC.5 has its separate SV.2/AN.3 needs. The obsolete AC.4 use is removed from this packet's prime-distribution definition.

The six-stage inventory includes every added paper route. Their exact proof contracts are not claimed established merely by assigning a stage. Khayutin's binary-form densities and convex-domain estimates, the vector density and polynomial Farey bounds of Bary-Soroker–Koukoulopoulos–Kozma, the specific Heath-Brown quadratic bilinear input to Skorobogatov–Sofos, and the Jutila/Smith Legendre-symbol input to Koymans–Pagano remain distinct obligations. A finite Gram inequality does not identify their character families or discharge their norms. The Bouniakowsky and Schinzel-H predicates belong to SV.4 and are not the incoming prime-tuple predicate. Koymans–Milovic's Type I/II spin-sieve conversion remains explicitly conditional on its short-character input, with generic number-field fundamental domains imported from their existing owner.

This is an unfinished pass, not a complete job at the 300-node budget. Every stage remains partial. The full Maynard source decomposition is preserved, but SV.4's added polynomial-prime predicates prevent that stage from being called completely source-decomposed. The seven gaps and two supplier requests name where the continuation must proceed. The per-stage list below is definitive for current remaining work.

### Logarithmic sieve dimension

Node SieveMethodsAndPrimePatterns:SV.0/log-sieve-dimension. HasLogSieveDimension(P,g,κ,C) means: for every real z≥2, Σ_{p∈P, p prime, p≤z} g(p) log p ≤ κ log z+C. The sum is finite. P is a fixed set of naturals and g is a fixed real function; constants do not depend on z or on an application population.

The predicate records only the displayed inequality. Positivity of g, κ and C are separate theorem hypotheses; it does not assert a local density or any distribution estimate. In Chapter 11 g(p)=ω(p)/p.

Proof or construction. Use the finite prime set obtained by filtering naturals up to floor z. Quantify the bound over every real z≥2, not merely a single cutoff.

Acceptance. A finite set at a single cutoff does not supply constants uniform across a varying prime family.

Uses. Kedlaya Lemma 11.7 and Exercise 11.6.1: Control the tilted finite Euler product in Rankin’s trick. SV.0/eratosthenes-mass-cutoff: Keep every analytic constant fixed independently of the population.

API.

- SieveQuantitative.hasLogSieveDimension_iff (characterisation): Equivalent to the displayed bound for every z≥2.
- SieveQuantitative.HasLogSieveDimension.mono_constant (functoriality): Increase C and retain the same dimension bound.
- SieveQuantitative.HasLogSieveDimension.mono_dimension (functoriality): Increasing κ preserves the condition because log z≥0 on the quantified domain.
- SieveQuantitative.HasLogSieveDimension.mono_density (functoriality): If h(p)≤g(p) at all selected primes, the bound for g implies the same bound for h.
- SieveQuantitative.hasLogSieveDimension_empty (simp): For empty P and nonnegative κ,C the predicate holds.

Unit tests.

- dimension_empty (degenerate): P empty, κ=C=0 satisfies the bound with sum zero.
- dimension_negative_constant (non-example): P empty, κ=0,C=−1 does not satisfy the bound.
- dimension_single_prime (computation): P={2}, g(2)=1/2, κ=0,C=log 2/2 satisfies the bound exactly at z=2.
- dimension_single_cutoff_not_uniform (non-example): A bound checked only at z=2 is not the all-z predicate; an unbounded density at later primes is not constrained by that check.

Direct prerequisites: mathlib:Real.log.

Source: KED-ANT-11, §11.4, (11.4.1). A quantified version of the source logarithmic condition; explicit C replaces its bounded additive term.

### Euler-product sieve dimension

Node SieveMethodsAndPrimePatterns:SV.0/product-sieve-dimension. HasProductSieveDimension(P,g,κ,K) means: for every real 2≤w≤z, ∏_{p∈P, p prime, w≤p<z}(1−g(p))⁻¹ ≤ K (log z/log w)^κ.

All endpoint choices are part of the definition: p=w is included and p=z is excluded. The predicate alone does not require g(p)<1; every sieve theorem requires 0≤g(p)<1 separately.

Proof or construction. Take the finite product over primes below ceil z and filter by w≤p. Use real powers and the strictly positive logarithm of w.

Acceptance. Do not infer this product-ratio condition from the logarithmic condition without controlling primes with g(p) near one.

Uses. Kedlaya §12.4, Theorem 12.2: Bound the ratio V(z_n)/V(z) in the first-failure sums. SV.1 applications and Khayutin §8 route inventory: Require the actual uniform dimension condition; no conic-density estimate is asserted by this predicate.

API.

- SieveQuantitative.hasProductSieveDimension_iff (characterisation): Unfold to the exact interval product and logarithmic ratio.
- SieveQuantitative.HasProductSieveDimension.mono_constant (functoriality): K≤K′ preserves the bound since the logarithmic power is nonnegative.
- SieveQuantitative.HasProductSieveDimension.mono_dimension (functoriality): For K≥0 and κ≤κ′ increase the exponent of a ratio at least one.
- SieveQuantitative.HasProductSieveDimension.interval_bound (relation): Apply the predicate on any explicit interval with 2≤w≤z.
- SieveQuantitative.hasProductSieveDimension_zero_density (example): For g identically zero and κ≥0,K≥1 every product is one, so the predicate holds.

Unit tests.

- product_dimension_zero (degenerate): Zero density with κ=0,K=1 satisfies the condition.
- product_dimension_diagonal (computation): At w=z the empty product is one and the logarithmic ratio is one; K<1 cannot satisfy the predicate.
- product_dimension_endpoint (computation): For P={2},g(2)=1/2, the interval [2,2) has product 1, whereas [2,3) has product 2.
- product_dimension_unit_density (non-example): g(2)=1 is forbidden by the sieve theorem even if the totalized inverse in the bare predicate is zero.

Direct prerequisites: mathlib:Real.log.

Source: KED-ANT-12, §12.3, (12.3.1). The source’s dimension condition with a valid explicit logarithmic domain.

### Truncated remainder mass

Node SieveMethodsAndPrimePatterns:SV.0/remainder-mass. For an existing BoundingSieve s and real D, remainderMass(s,D)=Σ_{d|s.prodPrimes, d<D}|s.rem(d)|. Divisors are positive; the cutoff is strict.

D can be any real. The sum is zero if D≤1. If D>1 it includes d=1 and hence the mass-normalization error.

Proof or construction. Filter the native positive divisor finset and sum absolute values of the existing remainder.

Acceptance. This is not SelbergSieve.level, and signed cancellation cannot reduce it.

Uses. Kedlaya (12.2.2) and Theorem 12.2: Replace each signed Brun error by the same absolute divisor sum. SV.0/family-sieve-level: Specify a genuine average error estimate for a changing population.

API.

- SieveQuantitative.remainderMass_nonneg (relation): Every remainder mass is nonnegative.
- SieveQuantitative.remainderMass_mono (functoriality): D≤E implies remainderMass(s,D)≤remainderMass(s,E).
- SieveQuantitative.remainderMass_of_le_one (simp): D≤1 implies remainderMass(s,D)=0.
- SieveQuantitative.remainderMass_eq_of_remainders (extensionality): The same prime product and equal remainders on its divisors give equal remainder masses.
- SieveQuantitative.errSum_le_remainderMass (relation): Coefficients of modulus≤L on divisors, vanishing for d≥D, have errSum≤L remainderMass(s,D), for L≥0.

Unit tests.

- remainder_mass_endpoint (computation): P=6 and all four remainders equal one give masses 0 at D=1, 1 at D=2, 2 at D=3, 3 at D=6 and 4 at D=7.
- remainder_mass_signed (computation): R_2=1 and R_3=−1 contribute 2 once D>3, not zero.
- remainder_mass_mass_error (characterisation): P=1,D=2 gives |A_1−X|.
- remainder_mass_negative_cutoff (degenerate): D=−3 gives zero even if zero belongs to the sample support.

Direct prerequisites: mathlib:BoundingSieve, mathlib:BoundingSieve.rem.

Source: KED-ANT-12, §12.2, display R(x,y) preceding §12.3. Native-carrier version of the source truncated absolute remainder sum.

### Level of distribution of a sieve family

Node SieveMethodsAndPrimePatterns:SV.0/family-sieve-level. HasSieveLevel(F,θ) for a fixed family F:real→BoundingSieve means θ>0, X_F(x)≥0 for all x≥2, and: for every A>0 there exist B>0,C>0,x₀≥2 such that for all x≥x₀, remainderMass(F(x), x^θ/(log x)^B)≤ C X_F(x)/(log x)^A.

F and θ are fixed before A is chosen. B,C,x₀ may depend on F,θ,A, not on the varying x. This is a weighted sieve-family predicate, not Maynard’s π-centred prime-distribution predicate.

Proof or construction. Write out the order of quantifiers. Retain the absolute divisor sum, its strict cutoff and its mass-normalization remainder.

Acceptance. An arbitrary coefficient level, a pointwise error without summed uniformity, or a negative approximate mass is not this condition.

Uses. SV.1 fundamental lemma and applications: An application must supply a uniform absolute remainder estimate, independently of the coefficient construction. Bary-Soroker–Koukoulopoulos–Kozma and Khayutin sieve route inventory: Track the error-uniformity obligation; this scalar interface is not claimed to replace their vector or binary-domain local data.

API.

- SieveQuantitative.hasSieveLevel_iff (characterisation): Equivalent to the full quantified family estimate with positivity conditions.
- SieveQuantitative.HasSieveLevel.bound (relation): For a specified A>0 obtain one B,C,x₀ uniform for every x≥x₀.
- SieveQuantitative.HasSieveLevel.mono (functoriality): If 0<η≤θ a family of level θ has level η, using monotonicity of remainder mass and x≥2.
- SieveQuantitative.HasSieveLevel.mass_nonneg (projection): Every x≥2 has nonnegative approximate mass.
- SieveQuantitative.hasSieveLevel_of_zero_remainders (example): A nonnegative-mass family with every divisor remainder zero has every positive level.

Unit tests.

- family_level_exact (characterisation): A nonnegative-mass family with all remainders zero satisfies the condition at θ=1.
- family_level_zero (non-example): θ=0 fails the stated positive-level predicate even for an exact family.
- family_level_fixed_mass_error (non-example): A family with X=1 and |R_1|=1 for every x≥2 has no positive level: the cutoff eventually exceeds 1 but no logarithmic saving controls R_1.
- family_level_zero_mass (degenerate): The empty exact family X=0 is permitted and has every positive level.

Direct prerequisites: SieveMethodsAndPrimePatterns:SV.0/remainder-mass, mathlib:BoundingSieve.

Source: KED-ANT-12, §12.1 remainder discussion and §12.2 R(x,y). A worker-specified quantitative family interface for the source’s distribution requirement; the logarithmic parametrization is explicit, not attributed as a definition in the source.

### Coefficient error controlled by remainder mass

Node SieveMethodsAndPrimePatterns:SV.0/coefficient-error-remainder-mass. If L≥0, |c(d)|≤L on the divisors of P and c(d)=0 on every divisor d≥D, then s.errSum(c)≤L remainderMass(s,D).

s is a BoundingSieve; D is real and the cutoff is strict. This promotes the remainderMass API item used by Brun’s estimate.

Proof or construction. Split the finite divisor sum by d<D. The complementary coefficients vanish. Bound each remaining nonnegative term by L|R_d| and factor the constant out.

Acceptance. D≤1 forces every contributing coefficient to vanish; L=0 gives zero error.

Direct prerequisites: SieveMethodsAndPrimePatterns:SV.0/remainder-mass, mathlib:BoundingSieve.errSum.

Source: KED-ANT-12, §12.2, error estimate for R±. Exact coefficient-sensitive native form, without a claim that truncation proves distribution.

### Finite tilted density Euler product

Node SieveMethodsAndPrimePatterns:SV.0/density-euler-moment. For any real a and BoundingSieve s, Σ_{d|P} ν(d)d^a = ∏_{p|P}(1+ν(p)p^a).

P=s.prodPrimes is nonzero squarefree; all powers have positive natural bases, including d=1.

Proof or construction. Use the native squarefree-divisor/subset correspondence. Multiplicativity of ν and real powers on positive products identify each subset term. Expand the finite product by choosing either 1 or ν(p)p^a at each prime.

Acceptance. P=1 gives 1=1 for every a; a=0 gives Σν(d)=∏(1+ν(p)).

Direct prerequisites: mathlib:BoundingSieve, mathlib:BoundingSieve.prod_primeFactors_nu, mathlib:Nat.sum_divisors_filter_squarefree.

Source: KED-ANT-11, §11.3, Rankin proof; Exercise 11.6.1. The squarefree weighted analogue of the Euler-product expansion, derived on the existing carrier.

### Weighted Rankin cutoff bound

Node SieveMethodsAndPrimePatterns:SV.0/rankin-weighted-prefix. For x>0 and σ≥0, Σ_{d|P, d≤x} dν(d) ≤ x^σ ∏_{p|P}(1+ν(p)p^(1−σ)).

s is a BoundingSieve. The inclusive cutoff is explicit; x<1 gives an empty sum.

Proof or construction. For d≤x compare d^σ≤x^σ, multiply by ν(d)d^(1−σ), and sum. Extend the sum by nonnegative terms and apply the finite Euler-moment identity with exponent 1−σ.

Acceptance. σ=0 remains valid; x=1 retains the d=1 contribution; do not include d=0.

Direct prerequisites: SieveMethodsAndPrimePatterns:SV.0/density-euler-moment, mathlib:BoundingSieve.nu_pos_of_dvd_prodPrimes.

Source: KED-ANT-11, §11.3, Rankin proof; §11.4, Lemma 11.7 and Exercise 11.6.1. Explicit finite weighted Rankin inequality; no smooth-number carrier or asymptotic estimate is redefined.

### Weighted Rankin remainder-tail bound

Node SieveMethodsAndPrimePatterns:SV.0/rankin-weighted-tail. For x>0 and a≥0, Σ_{d|P, x<d} ν(d) ≤ x^(−a) ∏_{p|P}(1+ν(p)p^a).

s is a BoundingSieve; the tail is strict.

Proof or construction. On the tail use 1≤(d/x)^a, retain nonnegative ν(d), and extend to all divisors. Apply the Euler-moment identity.

Acceptance. At x=P the tail is empty; x<1 includes d=1; a=0 gives the full density sum as an upper bound.

Direct prerequisites: SieveMethodsAndPrimePatterns:SV.0/density-euler-moment, mathlib:BoundingSieve.nu_pos_of_dvd_prodPrimes.

Source: KED-ANT-11, §11.3, Rankin proof; §11.4, Lemma 11.8. A finite Rankin replacement for the integral tail route, with all parameters and endpoints explicit.

### Tilted Euler-product estimate from logarithmic dimension

Node SieveMethodsAndPrimePatterns:SV.0/log-dimension-euler-bound. Fix a set P and function g, with κ>0,C≥0, nonnegative g(p) for selected primes and HasLogSieveDimension(P,g,κ,C). There exist K>0,z₀≥exp(2) such that for every z≥z₀, ∏_{p∈P,p prime,p≤z}(1+g(p)p^(1/log z)) ≤ K(log z)^κ.

All data P,g,κ,C are fixed before K,z₀ are chosen. The constants are independent of z and of every application population.

Proof or construction. Set A(t)=Σ_{p≤t,p∈P}g(p)log p. Apply the native Abel formula on [2,z] to 1/log t, isolating p=2, to obtain Σg(p)≤κ log log z+O_{κ,C}(1). Its derivative is −1/(t(log t)²), integrable on this domain. For α=1/log z and 2≤p≤z, use exp(u)−1≤exp(1)u for 0≤u=α log p≤1. Thus Σg(p)(p^α−1)≤exp(1)(κ+C/log z), uniformly bounded. Extend the finite summand by zero off the selected primes before using Real.prod_one_add_le_exp_sum, whose input is globally nonnegative. Exponentiate the two bounds and absorb only fixed constants in K.

Acceptance. The lower endpoint is at least exp(2), so 0<1−1/log z<1 in the cutoff applications. No Mertens theorem is required when the logarithmic condition is given.

Direct prerequisites: SieveMethodsAndPrimePatterns:SV.0/log-sieve-dimension, mathlib:sum_mul_eq_sub_sub_integral_mul, mathlib:Real.prod_one_add_le_exp_sum.

Source: KED-ANT-11, §11.4, Lemma 11.7; Exercise 11.6.1. Explicit proof route for the Euler product used in the weighted Rankin exercise; the proof is specified, not implemented.

### Dimension-controlled weighted divisor count

Node SieveMethodsAndPrimePatterns:SV.0/dimension-divisor-count. For fixed data of log-dimension-euler-bound, there exist K>0,z₀≥exp(2) such that for every z≥z₀, every x>0 and every BoundingSieve s whose prime factors are exactly the selected primes p≤z and whose ν(p)=g(p), Σ_{d|P_s,d≤x}dν(d) ≤ K x(log z)^κ exp(−log x/log z).

Constants are uniform in x and s; all density data and dimension constants are fixed. This implies the strict-cutoff version of source Lemma 11.7.

Proof or construction. Apply weighted Rankin with σ=1−1/log z, then bound its finite Euler product by the preceding theorem. Rewrite x^σ as x exp(−log x/log z).

Acceptance. The inclusive cutoff is a stronger conclusion than the source’s d<x; x<1 gives an empty divisor sum.

Direct prerequisites: SieveMethodsAndPrimePatterns:SV.0/rankin-weighted-prefix, SieveMethodsAndPrimePatterns:SV.0/log-dimension-euler-bound.

Source: KED-ANT-11, §11.4, Lemma 11.7 and Exercise 11.6.1. Same weighted sum with ω(d)=dν(d); preserves every uniform parameter.

### Dimension-controlled divisor-density tail

Node SieveMethodsAndPrimePatterns:SV.0/dimension-divisor-tail. For the same fixed data there exist K>0,z₀≥exp(2) such that for every z≥z₀,x>0 and matching sieve s, Σ_{d|P_s,x<d}ν(d) ≤ K(log z)^κ exp(−log x/log z).

For a fixed L>0 replace x by Lx and absorb the bounded factor L^(−1/log z) in K.

Proof or construction. Use weighted Rankin with a=1/log z and the tilted Euler-product estimate. This avoids integration of a divisor-count bound and so removes the extra log z loss of the source integral argument.

Acceptance. This is a worker-derived stronger finite-tail estimate, not a quotation of the source’s (log z)^(κ+1) bound. No infinite divisor tail is asserted.

Direct prerequisites: SieveMethodsAndPrimePatterns:SV.0/rankin-weighted-tail, SieveMethodsAndPrimePatterns:SV.0/log-dimension-euler-bound.

Source: KED-ANT-11, §11.4, Lemma 11.8 and (11.4.2). The same finite tail, bounded directly by Rankin instead of the stated integral route.

### Eratosthenes estimate with a justified mass and divisor cutoff

Node SieveMethodsAndPrimePatterns:SV.0/eratosthenes-mass-cutoff. Let x>0,c,M≥0 and 0<σ<1. If 0≤X≤Mx, |R_d|≤c dν(d) for divisors d≤x, and A_d=0 for divisors d>x, then |S−X∏_{p|P}(1−ν(p))|≤(c+M)x^σ∏_{p|P}(1+ν(p)p^(1−σ)).

s is the native BoundingSieve; A_d is its weighted multSum. The mass bound and the divisor cutoff are assumptions to prove in an application, never consequences of the residue-label representation.

Proof or construction. Split the native absolute Legendre remainder into d≤x and d>x. Bound the first piece by c times the weighted prefix. On the tail, A_d=0 gives |R_d|=Xν(d); apply weighted Rankin with a=1−σ and X≤Mx. Combine the common Euler product. With σ=1−1/log z and the dimension estimate obtain O_{fixed data,c,M}(x(log z)^κ exp(−log x/log z)).

Acceptance. This conditional statement does not claim the exact advertised Theorem 11.9 under its weaker printed hypotheses, nor does it fix the two-residue cutoff gap E7 in the Brun application.

Direct prerequisites: SieveMethodsAndPrimePatterns:SV.0/legendre-error, SieveMethodsAndPrimePatterns:SV.0/rankin-weighted-prefix, SieveMethodsAndPrimePatterns:SV.0/rankin-weighted-tail, mathlib:BoundingSieve.multSum_eq_main_err.

Source: KED-ANT-11, §11.4, Theorem 11.9 and Exercise 11.6.3; proof of Theorem 11.11. A mass-controlled, explicitly conditional variant derived from finite identities. The exact source statement and the twin-prime application remain gaps.

### Brun combinatorial coefficients

Node SieveMethodsAndPrimePatterns:SV.1/brun-coefficients. For squarefree P, y>1, β>1 and parity ε∈{0,1}, put λ_ε(d)=μ(d) if d|P and the decreasing prime factors p₁>⋯>p_r of d satisfy p_m<(y/(p₁⋯p_m))^(1/β) for every 1≤m≤r with m≡ε mod 2; otherwise put λ_ε(d)=0. Put λ⁺=λ₁ and λ⁻=λ₀. The empty prime list makes λ⁺(1)=λ⁻(1)=1.

Only positive divisors contribute. Prefix p₁⋯p_m includes p_m. Both coefficient systems retain every admissible prefix, not just divisors whose whole number of prime factors has one parity.

Proof or construction. Sort the native finite prime-factor set decreasingly. Test the specified one-based prefix constraints, then use the existing Möbius coefficient with its sign. Define zero outside the positive divisor finset.

Acceptance. For P=6,y=100,β=2, both systems retain d=1,2,3,6 and agree with μ on those divisors. For P=6,y=4,β=2,z=4, λ⁺ retains only 1 whereas λ⁻ retains 1,2,3; the first-order lower sum is negative on the two-prime obstruction.

Uses. Kedlaya Lemma 12.1 and Theorem 12.2: Supply the first-failure expansion and its finite support. Bary-Soroker–Koukoulopoulos–Kozma Brun route inventory: The scalar coefficient system is an input, not an assertion of independent polynomial reductions.

API.

- SieveBrun.brunCoefficients_one (simp): P squarefree,y>1 implies both coefficients at 1 are one.
- SieveBrun.brunCoefficients_of_not_dvd (simp): The coefficient is zero outside the positive divisors of P, including d=0.
- SieveBrun.abs_brunCoefficients_le_one (relation): Each coefficient has modulus at most one.
- SieveBrun.brunCoefficients_eq_moebius (characterisation): On a divisor, the coefficient equals μ(d) exactly when every required prefix constraint holds; failure makes it zero.
- SieveBrun.brunCoefficients_support_lt (relation): If all primes of P are <z≤y, y>1,β>1, every nonzero coefficient satisfies d<y.

Unit tests.

- brun_no_primes (degenerate): P=1,y=2,β=2: both coefficients are 1 at d=1 and zero elsewhere.
- brun_prefix_retained (computation): P=6,y=100,β=2: both coefficient lists at 1,2,3,6 are 1,−1,−1,1.
- brun_lower_parity (non-example): P=6,y=4,β=2,z=4: λ⁻(1)=1, λ⁻(2)=λ⁻(3)=−1, λ⁻(6)=0; its full divisor sum is −1.
- brun_strict_boundary (computation): For P=2,β=2,y=8 the positive coefficient at 2 is zero: 2³=8 fails the strict prefix constraint.

Direct prerequisites: mathlib:BoundingSieve, mathlib:Finset.sort, mathlib:ArithmeticFunction.moebius.

Source: KED-ANT-12, §12.2 definition of D± and §12.3 parameter choice. The exact prefix-dependent construction; the source’s informal parity wording is interpreted as constraints at each position, not a restriction to even/odd divisors.

### Brun pointwise divisor brackets

Node SieveMethodsAndPrimePatterns:SV.1/brun-divisor-brackets. For the Brun construction and every r|P, Σ_{d|r}λ⁻(d) ≤ 1_{r=1} ≤ Σ_{d|r}λ⁺(d). Hence Σ_{d|P}λ⁻(d)A_d≤S≤Σ_{d|P}λ⁺(d)A_d for nonnegative sample weights.

P squarefree,y>1,β>1; no distribution estimate is assumed.

Proof or construction. Use the decreasing-prime first-failure expansion of source Lemma 12.1 with the consistent strict prime cutoff and left-limit product at the last prime (E35), specialized to density one on the factors of r. Finite inclusion-exclusion leaves a sum of nonnegative first-failure contributions with the required parity sign. The combinatorial identity is polynomial and does not require the analytic strict-density hypothesis when specialized to one. Apply the native-carrier weighted divisor interchange at each sample. Multiply both brackets by its nonnegative weight and sum.

Acceptance. For r=1 both brackets equal one; for P=6,y=4,β=2 and r=6 the lower sum is −1, indicator zero and upper sum one.

Direct prerequisites: SieveMethodsAndPrimePatterns:SV.1/brun-coefficients, SieveMethodsAndPrimePatterns:SV.0/weighted-divisor-interchange, SieveMethodsAndPrimePatterns:SV.0/lower-sieve-sum.

Source: KED-ANT-12, Lemma 12.1, its specialization after the proof, and (12.2.1)–(12.2.2). Exact pointwise and weighted inequalities, preserving signs and the r=1 case.

### Brun coefficient modulus bound

Node SieveMethodsAndPrimePatterns:SV.1/brun-coefficient-bound. For every P,y,β,ε and d, |λ_ε(d)|≤1.

The assertion is valid even outside the analytic parameter range: each coefficient is zero or the existing Möbius value.

Proof or construction. Split by the explicit coefficient condition and apply the native Möbius modulus bound after casting to the reals.

Acceptance. No positivity of λ is claimed: selected one-prime divisors have coefficient −1.

Direct prerequisites: SieveMethodsAndPrimePatterns:SV.1/brun-coefficients, mathlib:ArithmeticFunction.abs_moebius_le_one.

Source: KED-ANT-12, §12.2 definition of λ± and error estimate. Promoted coefficient API for the fundamental estimate.

### Strict Brun coefficient support

Node SieveMethodsAndPrimePatterns:SV.1/brun-coefficient-support. For squarefree P,y>1,β>1 and ε∈{0,1}, if every prime of P is <z≤y, then λ_ε(d)≠0 implies d<y.

The single-prime lower-coefficient exception is controlled by p<z≤y. The unit needs y>1.

Proof or construction. For a nonempty decreasing list with last position of the required parity, its last prefix condition directly bounds the full product. Otherwise use the penultimate prefix condition and p_r<p_{r−1}≤p_{r−1}^β. Handle a one-prime lower list using the explicit prime cutoff; handle the empty list by y>1.

Acceptance. The result is a strict d<y bound; a large single prime in λ⁻ without the prime cutoff would be a counterexample.

Direct prerequisites: SieveMethodsAndPrimePatterns:SV.1/brun-coefficients.

Source: KED-ANT-12, §12.3, support exception for single primes in D−. Promoted support API, with the source’s exception retained explicitly.

### Dimension-controlled Brun main terms

Node SieveMethodsAndPrimePatterns:SV.1/brun-main-term-bounds. Let κ>0,K>1, β=9κ+1, u≥β,y>1,z=y^(1/u), all primes of P satisfy p<z, and g(p)=ν(p) on P and zero off P. Under HasProductSieveDimension(P,g,κ,K), with V=∏_{p|P}(1−ν(p)) and δ=exp(β−u)K^10, (1−δ)V ≤ mainSum(λ⁻) ≤ V ≤ mainSum(λ⁺) ≤ (1+δ)V.

P in the dimension predicate means the set of its prime factors. Strict prime-density bounds are supplied by BoundingSieve. The displayed non-strict inequalities include every degenerate empty-prime case.

Proof or construction. Use the finite first-failure expansion with strict prime cutoffs and the last-prime left-limit product (E35): V⁺−V is the sum of odd-length failure masses, and V−V⁻ the sum of even-length failure masses. Each summand is nonnegative. The prefix constraints give p_n≥z_n=z^(1−1/β)^n. Enlarge each summation domain; an ordered distinct-prime sum is at most the n-th power of the unrestricted prime sum divided by n!. The product-dimension bound controls V(z_n)/V(z); if z_n<2 use the identical empty-prime interval or the interval starting at 2. Use the source’s b=9, a=exp(1+1/9)/9<exp(−1), its factorial bound n!≥exp(1)(n/exp(1))^n, and vanishing for n+β≤u. Sum the geometric tail to obtain δ. The lower main term has 1−δ, not the source display’s 1+δ (E33).

Acceptance. δ may exceed one; then the lower bound can be negative and asserts no positive prime lower bound. Empty P gives V⁺=V⁻=V=1.

Direct prerequisites: SieveMethodsAndPrimePatterns:SV.1/brun-coefficients, SieveMethodsAndPrimePatterns:SV.0/product-sieve-dimension, mathlib:BoundingSieve, mathlib:BoundingSieve.mainSum.

Source: KED-ANT-12, §12.4 and Theorem 12.2, first two displays. Source estimate with the lower sign corrected from its first-failure proof.

### Brun fundamental sieve estimate

Node SieveMethodsAndPrimePatterns:SV.1/brun-fundamental-estimate. Under the Brun main-term hypotheses and X≥0, (1−δ)V X−remainderMass(s,y) ≤ S ≤ (1+δ)V X+remainderMass(s,y), where β=9κ+1,u≥β,z=y^(1/u), δ=exp(β−u)K^10.

This is the proved parameter range of this elementary combinatorial sieve. It is not a sharp beta-sieve theorem, a parity-breaking input or a Chen theorem.

Proof or construction. Expand A_d=ν(d)X+R_d in both weighted brackets. The promoted modulus and support lemmas give |λ±|≤1 and support d<y. Apply the promoted remainder-mass error lemma, then multiply the main-term inequalities by nonnegative X.

Acceptance. The range u≥9κ+1 and positivity of X are explicit. A positive sifted lower bound requires both δ<1 and a sufficiently small actual remainder mass.

Direct prerequisites: SieveMethodsAndPrimePatterns:SV.1/brun-main-term-bounds, SieveMethodsAndPrimePatterns:SV.1/brun-divisor-brackets, SieveMethodsAndPrimePatterns:SV.0/coefficient-error-remainder-mass, SieveMethodsAndPrimePatterns:SV.1/brun-coefficient-bound, SieveMethodsAndPrimePatterns:SV.1/brun-coefficient-support, mathlib:BoundingSieve.multSum_eq_main_err.

Source: KED-ANT-12, Theorem 12.2, consequence display. Exact weighted native-carrier form of the corrected combinatorial estimate.

### From roughness to an almost-prime bound

Node SieveMethodsAndPrimePatterns:SV.5/rough-to-at-most-almost-prime. Let natural z≥2, n≠0 and k≥0. If every prime p dividing n satisfies z≤p and n<z^(k+1), then Nat.IsAtMostAlmostPrime(k,n).

Prime factors are counted with multiplicity. The upper bound is strict and the unit n=1 is allowed.

Proof or construction. Every entry of the native prime factor list is at least z. Hence n, its product, is at least z raised to the list length Ω(n). If Ω(n)≥k+1, monotonicity of natural powers contradicts the strict upper bound. Use the existing at-most predicate, not the exact-k or distinct-factor predicate.

Acceptance. n=8,z=2,k=2 violates the strict cutoff and has Ω=3 although it has only one distinct prime factor; n=1 gives Ω=0; n=0 is excluded.

Direct prerequisites: mathlib:Nat.IsAtMostAlmostPrime, mathlib:ArithmeticFunction.cardFactors, mathlib:Nat.prod_primeFactorsList.

Source: KED-ANT-11, §11.1 rough-number observation. Exact endpoint-safe form of the source’s elementary prime-factor transfer. It supplies no sifted count or advanced-sieve analytic input.

## Current per-stage continuation inventory

### SieveMethodsAndPrimePatterns:SV.0 — partial

- The general finite-family/residue bridge is now decomposed, including repeated labels, empty local classes and full-residue obstruction. Concrete polynomial root sets, CRT counts and interval discrepancy bounds still require application-specific proofs; the prime-product labels supply no linear cutoff.
- Khayutin 2019 §8 and local-conic appendix: multiplicative-function class, polynomial local densities, singular corrections, conic normal forms and exact prime-2 hypotheses; Bary-Soroker–Koukoulopoulos–Kozma 2023 vector densities and Bonferroni.
- The logarithmic/product dimensions and quantitative family-level predicate are specified. Prove actual application-family distribution bounds; they are not consequences of the predicate or SelbergSieve.level. The generic Rankin smooth-number count is requested from AN.5, not redefined here. Establish the exact printed Theorem 11.9 under its stated hypotheses or repair them; the new mass-controlled version does not remove E7. Complete the two-residue Brun application and reciprocal convergence.

### SieveMethodsAndPrimePatterns:SV.1 — partial

- Read Kedlaya Chapters 13-14 and the remaining Heath-Brown Selberg proof; the source boundary read through Lemma 2.1 is not complete coverage.
- Import existing lambdaSquared upper coefficients and main-term diagonalization; plan only missing Selberg optimization, the remaining sieve estimates and applications, and explicit parity limitations. The elementary Chapter 12 Brun system is specified in this continuation.
- GGPY Lemmas 3–4 in dimension one are planned (SV.1/selberg-diagonal-sum-dimension-one, SV.1/selberg-smooth-diagonal-sum); the proof of Lemma 3 rests on the unread Halberstam–Richert Lemmas 5.3–5.4 (gap), and the dimension-κ version remains.
- Khayutin §8 convex-domain/divisibility sieve, level and decoupling estimates; Bary-Soroker–Koukoulopoulos–Kozma Brun bound with the exclusion set.
- Chapter 12 combinatorial coefficients, pointwise brackets, main-term bound and fundamental estimate are specified. Its prime-shift example and twenty-factor application still need a correct residue-class setup and a justified uniform prime-distribution input; no unconditional conclusion is inferred from that paragraph.

### SieveMethodsAndPrimePatterns:SV.2 — partial

- Bombieri’s H+2/δ additive theorem and the primitive-character reduction with H+2Q² are decomposed. The sharp H−1+1/δ additive and H−1+Q² multiplicative versions still require the Chapter 15 input; this continuation does not claim those constants.
- The exact Vaughan cutoff identity, incomplete logarithm, arbitrary-weight hyperbola/Type I–II decomposition and coefficient energies are decomposed, as are the rectangular primitive-character dyadic block estimate and finite large-modulus summation with its explicit J loss. The dependent hyperbola-to-rectangle reduction and source-specific Type I/II estimates remain open. Read Chapter 15 for the sharp additive input and squared-inequality duality adapter; native operator-norm duality is already built.
- Chapter 16 was read completely, but §16.3 Theorem 16.4, Lemma 16.5 and Linnik’s Theorem 16.7, the least-nonresidue definition, and §16.4 exercises remain undecomposed. Repair the recorded vanishing-support, CRT, theorem-reference, prime-two and smooth-number multiplicity issues before using that application.
- The finite diagonal/off-diagonal bound abstracts Bennett–Siksek (34)–(35) but does not supply their arithmetic family, individual character-correlation estimate, von Mangoldt norm estimate or sufficiently-large-parameter threshold. Keep those arithmetic owners distinct.
- Resolve the exact quadratic-symbol bilinear large-sieve need of ArithmeticStatistics:ST.5 and polynomial Farey large-sieve need of FiniteFieldsAndCharacterSums:FF.1; neither is the finite Gram theorem.
- The accepted 30 September RS-07 result withholds the non-atomic edge replacement: retain AN.3→SV.2; do not install SV.2→AN.3. Mathematical ownership and the exact supplier request are distinct from the unapplied edge change.
- BS20 finite Gram theorem already present; retain separate arithmetic correlations. Khayutin binary-form large sieve and averaging lemmas; Bary-Soroker–Koukoulopoulos–Kozma additive/polynomial Farey inequalities. Heath-Brown 1995 Corollary 4 for Skorobogatov–Sofos has its own quadratic-character family and norms. Jutila 1975 Lemma 3/Smith Proposition 6.6 for Koymans–Pagano is distinct, not a Heath-Brown quadratic-large-sieve citation.

### SieveMethodsAndPrimePatterns:SV.3 — partial

- Chapter 18 is read; the large-r primitive rectangular subargument of Theorem 18.3 now imports six explicit SV.2 nodes, with the J loss retained. Definition 18.1 discrepancy API; Lemma 18.2; conductor reduction and small-r estimates in Theorem 18.3; the totient-weighted s summation; Theorems 18.4–18.5; Corollary 18.6 and Exercises 18.4.3–5 remain work.
- E20 has a weaker finite replacement, not a proof of the source's advertised uniform aggregate bound: account for its J factor in every downstream loss. E19 and E21–E26 still require repairs before use. The exact Vaughan identity and primitive rectangular bound do not establish the missing hyperbola coverage or final balancing.
- State every A>0, a corresponding B and sufficiently large x, the range Q≤sqrt(x)/(log x)^B, weighted moduli sums and maxima over reduced residues. Import precisely stated small-modulus/zero-density inputs from AN.3 and the existing arithmetic Dirichlet-series owners. Stronger distribution remains an explicit hypothesis.
- The level-of-distribution definition (Maynard (1.3)), the Elliott–Halberstam hypothesis and the Bombieri–Vinogradov level θ<1/2 are planned; the latter's input, Kedlaya Theorem 18.4, is still to be decomposed.
- RT-AREA-combinatorics/9: propose deleting the obsolete SV.3→AdditiveCombinatorics:AC.4 edge; actual consumers use SV.1/AN.3 for modulus-uniform majorants and SV.2/AN.3 for AC.5. No other packet or atlas-data file is edited.
- Complete exact averaged-prime discrepancy proof; retain analytic suppliers and all maximum, conductor, cofactor, dyadic and logarithmic losses.

### SieveMethodsAndPrimePatterns:SV.4 — partial

- Preserve the Maynard checkpoint. Add the owned Bouniakowsky and Schinzel-H predicates of Skorobogatov–Sofos with positive leading coefficients and no fixed prime divisor; consumer Part II imports them.

### SieveMethodsAndPrimePatterns:SV.5 — partial

- Select and read original beta/weighted-sieve, Chen and affine-sieve sources separately.
- State each route's own bilinear/parity-breaking or expansion hypotheses, orbit/local-obstruction assumptions and number of prime factors counted with multiplicity; import existing almost-prime predicates.
- Select original beta/weighted, Chen and affine sources independently. Koymans–Milovic 2021 source sieve conversion FIMR Proposition 5.2, Type I/II and conditional spin-oscillation targets; generic number-field fundamental domains belong to TauGlobalNumberFieldsLayer3C, and C_{|S|n}/Corollary 2.2 are explicit supplier hypotheses, not unconditional theorems.
- The elementary roughness-to-Ω transfer is specified; no beta/weighted, Chen, affine or spin-sieve analytic theorem is supplied by it.
