# Sieve methods, prime gaps and prime patterns

This roadmap develops reusable sieves for weighted finite populations and then uses them for prime distribution, prime clusters and almost primes. The starting objects are Mathlib’s arithmetic functions, Dirichlet characters, finite residue spaces, `BoundingSieve` and `SelbergSieve`. The new work supplies quantitative dimension and remainder control, coefficient constructions and the inequalities that applications require. The application routes keep their distinct inputs: quadratic characters, polynomial Farey sums, corrected binary local densities, number-field spins, and congruence expansion on affine groups.

The scope is SV.0–SV.5. Every target below has a statement, its hypotheses, a proof route and direct prerequisites. Definitions have their use-derived API and discriminating tests. Unresolved arguments are stated under the affected targets and in the final gap list. These are mathematical plans: none of the declarations is claimed implemented, and none of the six layers is proof-closed.

The library baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Tau Ceti roadmaps determine ownership. IntegralLattices Layer 3 supplies local integral quadratic classification; GlobalNumberFields Layer 3, including its 3C milestones, supplies generator domains and unit arithmetic, and Layer 11 supplies quadratic orders. ArithmeticDirichletSeries supplies native ideal norm fibres. ClassFieldTheory Layer 14 supplies Hilbert reciprocity and local character comparisons; Chebotarev Layer 13 supplies the natural prime count in a principal ideal class. Those theories are imported here.

Conventions: a sieve population is weighted and may have repeated values. The approximate mass need not equal its actual total weight. Remainders retain signs until an absolute sum is explicitly taken. A strict divisor cutoff stays strict. Prime products specify whether the boundary prime is included. Almost-prime counts use Ω, with multiplicity, and exclude zero; signed polynomial values are handled through absolute value. Every displayed asymptotic has fixed-parameter dependence and a sufficiently-large threshold. A conjectural distribution or character estimate is an explicit hypothesis.

For a native `BoundingSieve` s, write P=s.prodPrimes, A=s.support, w=s.weights, X=s.totalMass, ν=s.nu, A_d=s.multSum(d), R_d=s.rem(d), and S=s.siftedSum. Thus A_d=Xν(d)+R_d for d dividing P. Divisor sums use positive natural divisors. A prime cutoff is strict unless the displayed formula specifies inclusion.

SV.2 owns Vaughan’s identity and its sieve uses. AnalyticNumberTheory supplies prime sums, PNT and small-conductor estimates. General smooth-number counts remain AN.5 work. AdditiveCombinatorics supplies the general product-growth statements for expansion, while SV.5 owns the affine sieve application. The polynomial local condition and the irreducible conjectural prime condition have separate names.

| Layer | Central objects and theorems |
| --- | --- |
| SV.0 | Polynomial local densities; Multiplicative sieve growth class; Polynomial-vector sieve data |
| SV.1 | Brun combinatorial sieve; Selberg optimal weights; Polynomial-vector Brun sieve; Parity phenomenon |
| SV.2 | Primitive-character large sieve; Sharp additive large sieve; Polynomial Farey large sieve |
| SV.3 | Level of distribution of the primes; Bombieri–Vinogradov theorem; Arithmetic progression discrepancy; Maximal Bombieri–Vinogradov theorem; Barban–Davenport–Halberstam theorem |
| SV.4 | Admissible tuple; Prime k-tuples conjecture; Maynard's variational quantity M_k; Maynard's refinement of the GPY sieve; Bounded gaps between primes (at most 600); m + 1 primes in bounded intervals |
| SV.5 | Linear sieve functions; Rosser–Iwaniec sieve; Richert’s logarithmic weights; Chen’s theorem; Joint-spin oscillation; Affine sieve |

The named declaration is a proposed library name. References to an earlier target link to its full statement below. Source identifiers link to the source list; locators always refer to the particular text read.

## SV.0 — Sieve data and local densities

Build exact finite weighted sieve identities and local residue adapters first. The quantitative predicates specify the logarithmic or product dimension and the actual remainder mass. Binary polynomial and conic applications add local counts without rebuilding the imported integral quadratic theory.

<a id="SV-0-weighted-divisor-interchange"></a>

### Weighted divisibility interchange

**Declaration:** `BoundingSieve.sum_multSum_eq_sum_gcd_divisors`. **Kind:** lemma.

For every coefficient function c:N→R, sum_{d|P} c(d) A_d = sum_{n in A} w(n) sum_{d|gcd(P,n)} c(d).

**Hypotheses and conventions.** c is arbitrary; its values need not be nonnegative.

**Prerequisites.** `BoundingSieve` (Mathlib); `BoundingSieve.multSum` (Mathlib); `BoundingSieve.prodPrimes_ne_zero` (Mathlib); `Nat.divisors_filter_dvd_of_dvd` (Mathlib).

**Proof route.** Expand each A_d and interchange two finite sums; retain c(d) with its sign.

**Acceptance.** For P=1 this reduces to c(1) times the total support weight, including a possible weight at zero.

**Source.** [HB-SIEVES](#source-hb-sieves), Section 1, p.5, interchange in (1.7)

<a id="SV-0-legendre-identity"></a>

### Exact Legendre sieve identity

**Declaration:** `BoundingSieve.siftedSum_eq_moebius_multSum`. **Kind:** theorem.

S = sum_{d|P} mu(d) A_d, where mu is the existing integer Möbius function cast to R.

**Prerequisites.** [Weighted divisibility interchange](#SV-0-weighted-divisor-interchange); `BoundingSieve.siftedSum_eq_sum_support_mul_ite` (Mathlib); `ArithmeticFunction.coe_moebius_mul_coe_zeta` (Mathlib); `ArithmeticFunction.coe_mul_zeta_apply` (Mathlib); `ArithmeticFunction.one_apply` (Mathlib).

**Proof route.** Specialize the weighted interchange to c(d)=mu(d).

**Acceptance.** Empty support gives zero; P=1 returns all support weight.

**Source.** [HB-SIEVES](#source-hb-sieves), Section 1, p.2, equation (1.1)

<a id="SV-0-legendre-main-remainder"></a>

### Euler-product main term with signed remainder

**Declaration:** `BoundingSieve.siftedSum_eq_eulerProduct_add_rem`. **Kind:** lemma.

S = X product_{p in primeFactors(P)}(1-nu(p)) + sum_{d|P} mu(d)R_d.

**Hypotheses and conventions.** No sign assumption on X and no normalization X=A_1 is added.

**Prerequisites.** [Exact Legendre sieve identity](#SV-0-legendre-identity); `BoundingSieve.multSum_eq_main_err` (Mathlib); `ArithmeticFunction.IsMultiplicative.prodPrimeFactors_one_sub_of_squarefree` (Mathlib).

**Proof route.** Substitute A_d=nu(d)X+R_d into the exact Legendre identity, distribute the finite sum and factor out X.

**Acceptance.** For P=1 the identity reads A_1=X+R_1.

**Source.** [HB-SIEVES](#source-hb-sieves), Section 1, p.3, (1.2)-(1.3)

<a id="SV-0-legendre-error"></a>

### Absolute Legendre error bound

**Declaration:** `BoundingSieve.abs_siftedSum_sub_eulerProduct_le`. **Kind:** theorem.

|S-X product_{p in primeFactors(P)}(1-nu(p))| <= sum_{d|P}|R_d|.

**Prerequisites.** [Euler-product main term with signed remainder](#SV-0-legendre-main-remainder); `BoundingSieve.squarefree_of_mem_divisors_prodPrimes` (Mathlib); `ArithmeticFunction.abs_moebius_eq_one_of_squarefree` (Mathlib).

**Proof route.** Subtract the Euler-product term in the exact identity.

**Acceptance.** With P=1, A_1=10 and X=7 the error is exactly |R_1|=3.

**Source.** [HB-SIEVES](#source-hb-sieves), Section 1, p.3, Corollary 1.1

<a id="SV-0-lower-sieve-sum"></a>

### Lower sieve coefficient inequality

**Declaration:** `BoundingSieve.sum_multSum_le_siftedSum_of_divisor_lower`. **Kind:** lemma.

If c:N→R satisfies sum_{d|r} c(d) <= 1_{r=1} for every r dividing P, then sum_{d|P}c(d)A_d <= S.

**Hypotheses and conventions.** The displayed lower coefficient condition is required only for positive divisors r of this P, not for all naturals.

**Prerequisites.** [Weighted divisibility interchange](#SV-0-weighted-divisor-interchange); `BoundingSieve.siftedSum_eq_sum_support_mul_ite` (Mathlib).

**Proof route.** Apply the coefficient condition at r=gcd(P,n), which divides P.

**Acceptance.** c=mu on the divisors of P gives equality.

**Source.** [HB-SIEVES](#source-hb-sieves), Section 1, p.5, (1.5), compared with derivation (1.7)

<a id="SV-0-lower-sieve-main-error"></a>

### Lower main term minus absolute remainder

**Declaration:** `BoundingSieve.mainSum_sub_errSum_le_siftedSum`. **Kind:** theorem.

Under the lower coefficient condition, X mainSum(c) - errSum(c) <= S, using exactly the existing mainSum and errSum.

**Hypotheses and conventions.** For every r dividing P, sum_{d|r}c(d)<=1_{r=1}.

**Prerequisites.** [Lower sieve coefficient inequality](#SV-0-lower-sieve-sum); `BoundingSieve.mainSum` (Mathlib); `BoundingSieve.errSum` (Mathlib); `BoundingSieve.multSum_eq_main_err` (Mathlib).

**Proof route.** Expand each A_d in the lower coefficient inequality and collect X sum c(d)nu(d).

**Acceptance.** The zero coefficient function yields the elementary inequality 0<=S.

**Source.** [HB-SIEVES](#source-hb-sieves), Section 1, p.5, (1.5) and the main/error calculation (1.7)-(1.8)

<a id="SV-0-truncated-coefficient-error"></a>

### Remainder bound at a coefficient cutoff

**Declaration:** `BoundingSieve.errSum_le_truncated_remSum`. **Kind:** lemma.

Let D be a natural number and C a nonnegative real. If c(d)=0 for every d|P with D<d, and |c(d)|<=C for d|P with d<=D, then errSum(c)<=C sum_{d|P,d<=D}|R_d|.

**Hypotheses and conventions.** D>=0 is an integer cutoff; the bound includes d=D. The support and absolute-coefficient assumptions are both necessary inputs; they are stated explicitly, not packaged in a new predicate.

**Prerequisites.** `BoundingSieve.errSum` (Mathlib).

**Proof route.** Split the divisor sum into d<=D and D<d. The latter terms vanish by the support condition.

**Acceptance.** For D=0 the supported divisor coefficients all vanish, so errSum=0.

**Source.** [HB-SIEVES](#source-hb-sieves), Section 1, p.5, (1.8); Section 2, p.7, support condition before the quadratic-form calculation

<a id="SV-0-first-order-lower-sieve"></a>

### First Bonferroni lower sieve bound

**Declaration:** `BoundingSieve.multSum_one_sub_prime_multSum_le_siftedSum`. **Kind:** theorem.

A_1 - sum_{p in primeFactors(P)} A_p <= S.

**Prerequisites.** `BoundingSieve.multSum` (Mathlib); `BoundingSieve.siftedSum_eq_sum_support_mul_ite` (Mathlib); `BoundingSieve.prodPrimes_ne_zero` (Mathlib); `Nat.ne_one_iff_exists_prime_dvd` (Mathlib); `Nat.mem_primeFactors_of_ne_zero` (Mathlib).

**Proof route.** For each n, let k count the sieving primes dividing n. If gcd(P,n)=1 then k=0; otherwise the existing prime-divisor existence theorem gives a prime dividing both P and n, so k>=1.

**Acceptance.** For P=1 there are no sieving primes, so equality holds.

**Source.** [KED-ANT-11](#source-ked-ant-11), Section 11.2, Lemma 11.1 and its pointwise proof; compare Heath-Brown p.5 (1.5)

<a id="SV-0-finite-family-sieve"></a>

### Weighted finite-family sieve

**Declaration:** `BoundingSieve.ofFiniteFamily`. **Kind:** construction.

Construct s.ofFiniteFamily(A,f,w) as a BoundingSieve with support f(A), weight at n equal to Σ_{a∈A,f(a)=n}w(a), and the same prime product, density and approximate mass as s.

**Hypotheses and conventions.** s is an existing BoundingSieve; A is a finite set of indices in any type; f maps indices to naturals; w is real-valued and nonnegative on A. No injectivity or positivity of f is assumed.

**Prerequisites.** `BoundingSieve` (Mathlib); `Finset.prod_fiberwise_eq_prod_filter` (Mathlib).

**Proof route.** Use the existing BoundingSieve record, replacing only support and weights by the displayed finite image and fiber sums.

**API.**

- `BoundingSieve.ofFiniteFamily_support` (projection): The new support is the finite image f(A).
- `BoundingSieve.ofFiniteFamily_weights` (characterisation): For every natural n the weight is Σ_{a∈A,f(a)=n}w(a), including repeated labels and zero labels.
- `BoundingSieve.ofFiniteFamily_prodPrimes` (simp): The prime product is exactly the template's prime product.
- `BoundingSieve.ofFiniteFamily_totalMass` (simp): The approximate mass is exactly the template's arbitrary real mass X.
- `BoundingSieve.ofFiniteFamily_nu` (simp): The entire multiplicative density function is exactly the template's density.
- `BoundingSieve.ofFiniteFamily_weights_of_not_mem` (simp): If n is outside the finite image f(A), its new weight is zero.
- `BoundingSieve.ofFiniteFamily_id_siftedSum` (compatibility): Taking A equal to the template support, f the identity and w the template weights preserves its sifted sum. Equality of the full records is not asserted: the original may have nonzero weights outside its support.

**Unit tests.**

- `family_collision_weights`: Two indices mapping to 7, of weights 2 and 3, give weight 5 at 7, not 1, 2 or 3.
- `family_empty_population`: An empty index set gives sifted sum zero for any template.
- `family_identity_agreement`: Using the template support, identity label and original weights preserves multSum(1).
- `family_polynomial_multiplicity`: The seven parameters 2≤n≤8 map under n(10−n) to four distinct values, but their unit-weight pushforward has multSum(1)=7, not 4.

**Acceptance.** All repeated labels contribute to the weight; this is not an unweighted image sieve.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6

<a id="SV-0-finite-family-multsum"></a>

### Divisibility sums of a weighted family

**Declaration:** `BoundingSieve.ofFiniteFamily_multSum`. **Kind:** lemma.

For every natural d, multSum(d) of s.ofFiniteFamily(A,f,w) equals Σ_{a∈A,d|f(a)}w(a).

**Hypotheses and conventions.** s is an existing BoundingSieve; A is a finite set of indices in any type; f maps indices to naturals; w is real-valued and nonnegative on A. No injectivity or positivity of f is assumed.

**Prerequisites.** [Weighted finite-family sieve](#SV-0-finite-family-sieve); `BoundingSieve.multSum` (Mathlib); `Finset.prod_fiberwise_eq_prod_filter` (Mathlib).

**Proof route.** Expand only the new support and weights and the existing multSum.

**Acceptance.** At d=1 the result is the total indexed weight, not the cardinality of the image.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6

<a id="SV-0-finite-family-siftedsum"></a>

### Sifted sums of a weighted family

**Declaration:** `BoundingSieve.ofFiniteFamily_siftedSum`. **Kind:** lemma.

The sifted sum of s.ofFiniteFamily(A,f,w) equals Σ_{a∈A,gcd(s.prodPrimes,f(a))=1}w(a).

**Hypotheses and conventions.** s is an existing BoundingSieve; A is a finite set of indices in any type; f maps indices to naturals; w is real-valued and nonnegative on A. No injectivity or positivity of f is assumed.

**Prerequisites.** [Weighted finite-family sieve](#SV-0-finite-family-sieve); `BoundingSieve.siftedSum` (Mathlib); `Finset.prod_fiberwise_eq_prod_filter` (Mathlib).

**Proof route.** Expand the carrier's sifted sum and restrict the finite image by coprimality with the unchanged prime product.

**Acceptance.** When the prime product is 1, even zero labels survive.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6

<a id="SV-0-prime-dvd-residue-label"></a>

### Prime divisibility of a residue label

**Declaration:** `BoundingSieve.prime_dvd_residueLabel_iff`. **Kind:** lemma.

Let Q be a finite set of primes and Ωp a finite subset of ZMod p. For any integer a and p∈Q, p divides L(a)=∏_{q∈Q,a mod q∈Ωq}q if and only if a mod p belongs to Ωp.

**Hypotheses and conventions.** No properness, nonemptiness, sign or interval condition is needed for Ω or a.

**Prerequisites.** `Nat.primeFactors_prod` (Mathlib); `Nat.mem_primeFactors_of_ne_zero` (Mathlib).

**Proof route.** The factors in L(a) are distinct primes, so the existing primeFactors_prod theorem identifies its prime-factor set with the defining filtered set.

**Acceptance.** The result handles negative integers by the existing integer cast to ZMod.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6

<a id="SV-0-divisor-dvd-residue-label"></a>

### Simultaneous local conditions as divisibility

**Declaration:** `BoundingSieve.dvd_residueLabel_iff`. **Kind:** lemma.

Under the same finite prime data, for every d dividing ∏_{p∈Q}p and every integer a, d divides L(a) if and only if a mod p belongs to Ωp for every p∈primeFactors(d).

**Hypotheses and conventions.** The divisor hypothesis is on the squarefree prime product; d=1 is allowed, and d=0 is excluded by that hypothesis.

**Prerequisites.** `Finset.squarefree_prod_of_pairwise_isCoprime` (Mathlib); `Nat.coprime_primes` (Mathlib); `Nat.coprime_iff_isRelPrime` (Mathlib); `Nat.prod_primeFactors_of_squarefree` (Mathlib); `Nat.prod_primeFactors_dvd_iff` (Mathlib); `Nat.primeFactors_prod` (Mathlib).

**Proof route.** Distinct primes are pairwise coprime, so the existing squarefree-product theorem makes the ambient product squarefree; hence its divisor d is squarefree.

**Acceptance.** At d=1 the local condition is vacuous and every label is divisible by d.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6

<a id="SV-0-residue-label-survival"></a>

### Local avoidance as coprimality

**Declaration:** `BoundingSieve.coprime_residueLabel_iff`. **Kind:** lemma.

For the same data, gcd(∏_{p∈Q}p,L(a))=1 if and only if a mod p is outside Ωp for every p∈Q.

**Hypotheses and conventions.** Q consists of primes; no assumption that the bad residue is zero. Empty and full local sets are allowed.

**Prerequisites.** [Prime divisibility of a residue label](#SV-0-prime-dvd-residue-label); `Nat.coprime_prod_left_iff` (Mathlib).

**Proof route.** Use the finite-product coprimality equivalence to reduce to coprimality of each p∈Q with L(a).

**Acceptance.** Bad residue {1} modulo 2 keeps the original integer zero and removes one.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6

<a id="SV-0-residue-class-sieve"></a>

### Sieve with arbitrary excluded residue classes

**Declaration:** `BoundingSieve.ofResidueClasses`. **Kind:** construction.

Construct BoundingSieve.ofResidueClasses(A,x,w,Q,Ω,X) with prime product P, multiplicative density prodPrimeFactors(ρ), approximate mass X, support the image of L∘x on A, and weights the sums over its fibers.

**Hypotheses and conventions.** A is a finite index set, x maps indices to integers, w is real-valued and nonnegative on A, Q is a finite set consisting of primes, Ωp is a finite subset of ZMod p for each natural p, card(Ωp)<p for p∈Q, and X is an arbitrary real. Write ρ(p)=card(Ωp)/p, Q+= {p∈Q : Ωp is nonempty}, P=∏_{p∈Q+}p and L(b)=∏_{p∈Q,b mod p∈Ωp}p. All products are finite, with empty product 1. These are local expressions, not new carriers or functions in the blueprint.

**Prerequisites.** [Weighted finite-family sieve](#SV-0-finite-family-sieve); `Finset.squarefree_prod_of_pairwise_isCoprime` (Mathlib); `Nat.coprime_primes` (Mathlib); `Nat.coprime_iff_isRelPrime` (Mathlib); `Nat.primeFactors_prod` (Mathlib); `ArithmeticFunction.prodPrimeFactors` (Mathlib); `ArithmeticFunction.IsMultiplicative.prodPrimeFactors` (Mathlib); `ArithmeticFunction.prodPrimeFactors_apply` (Mathlib); `Nat.Prime.primeFactors` (Mathlib).

**Proof route.** Remove precisely the empty local sets to form Q+. The product P is squarefree by the existing distinct-prime product theorem.

**API.**

- `BoundingSieve.ofResidueClasses_prodPrimes` (projection): The carrier's prime product is P=∏_{p∈Q,Ωp nonempty}p; empty local conditions are removed.
- `BoundingSieve.ofResidueClasses_nu` (characterisation): The density is the existing arithmetic function prodPrimeFactors(ρ), with ρ(p)=card(Ωp)/p: ν(0)=0 and ν(d)=∏_{p|d}ρ(p) for d>0.
- `BoundingSieve.ofResidueClasses_totalMass` (simp): The approximate mass equals the supplied real X, without a sign or normalization assumption.
- `BoundingSieve.ofResidueClasses_support` (projection): The support is the finite image of a↦L(x(a)), where L(b)=∏_{p∈Q, b mod p∈Ωp}p.
- `BoundingSieve.ofResidueClasses_weights` (characterisation): At a natural n the weight is the sum of w(a) over indices a∈A with L(x(a))=n. Equal labels retain all their multiplicities.
- `BoundingSieve.ofResidueClasses_nu_prime` (simp): For every prime p, including those outside Q, ν(p)=card(Ωp)/p.
- `BoundingSieve.ofResidueClasses_inactive_prime` (relation): If p∈Q and Ωp is empty, then p does not divide the carrier prime product. The zero density is not forced into a strictly positive carrier field.

**Unit tests.**

- `residue_empty_prime_set`: With no sieving primes, three integer samples −1,0,1 of weight 2 give sifted sum 6, independently of unused residue data.
- `residue_all_zero_densities`: For Q={2,3} and both local residue sets empty, the carrier has prime product 1 and all three weight-2 samples survive.
- `residue_nonzero_bad_class`: For Q={2}, bad residue {1}, sample 0 of weight 2 and sample 1 of weight 3, the sifted sum is 2. A divisibility-only interpretation would incorrectly give 3.
- `residue_mixed_empty_negative`: For Q={2,3}, empty bad set at 2 and bad residue {1} at 3, the prime product is 3 and the six unit-weight samples −2,…,3 have sifted sum 4.
- `residue_radical_density`: The existing prodPrimeFactors extension at a single bad residue modulo 2 has ν(4)=1/2, not 1/4. Complete multiplicativity is neither required nor asserted.

**Acceptance.** All-empty local data are valid and give P=1. Do not impose card(Ωp)>0 on the original Q.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6

<a id="SV-0-residue-class-multsum"></a>

### Divisibility sum equals the local intersection

**Declaration:** `BoundingSieve.ofResidueClasses_multSum`. **Kind:** lemma.

For s=ofResidueClasses(A,x,w,Q,Ω,X) and every d|s.prodPrimes, s.multSum(d)=Σ_{a∈A,∀p∈primeFactors(d),x(a) mod p∈Ωp}w(a).

**Hypotheses and conventions.** A is a finite index set, x maps indices to integers, w is real-valued and nonnegative on A, Q is a finite set consisting of primes, Ωp is a finite subset of ZMod p for each natural p, card(Ωp)<p for p∈Q, and X is an arbitrary real. Write ρ(p)=card(Ωp)/p, Q+= {p∈Q : Ωp is nonempty}, P=∏_{p∈Q+}p and L(b)=∏_{p∈Q,b mod p∈Ωp}p. All products are finite, with empty product 1. These are local expressions, not new carriers or functions in the blueprint.

**Prerequisites.** [Sieve with arbitrary excluded residue classes](#SV-0-residue-class-sieve); [Divisibility sums of a weighted family](#SV-0-finite-family-multsum); [Simultaneous local conditions as divisibility](#SV-0-divisor-dvd-residue-label); `Finset.prod_dvd_prod_of_subset` (Mathlib).

**Proof route.** The active prime product P divides the full Q prime product by finite-subset product divisibility, so d also divides the latter.

**Acceptance.** The local conditions are simultaneous, not a sum of separate prime conditions.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6

<a id="SV-0-residue-class-siftedsum"></a>

### Sifted sum equals the original local avoidance count

**Declaration:** `BoundingSieve.ofResidueClasses_siftedSum`. **Kind:** lemma.

For s=ofResidueClasses(A,x,w,Q,Ω,X), s.siftedSum=Σ_{a∈A,∀p∈Q,x(a) mod p∉Ωp}w(a).

**Hypotheses and conventions.** A is a finite index set, x maps indices to integers, w is real-valued and nonnegative on A, Q is a finite set consisting of primes, Ωp is a finite subset of ZMod p for each natural p, card(Ωp)<p for p∈Q, and X is an arbitrary real. Write ρ(p)=card(Ωp)/p, Q+= {p∈Q : Ωp is nonempty}, P=∏_{p∈Q+}p and L(b)=∏_{p∈Q,b mod p∈Ωp}p. All products are finite, with empty product 1. These are local expressions, not new carriers or functions in the blueprint.

**Prerequisites.** [Sieve with arbitrary excluded residue classes](#SV-0-residue-class-sieve); [Sifted sums of a weighted family](#SV-0-finite-family-siftedsum); [Local avoidance as coprimality](#SV-0-residue-label-survival).

**Proof route.** Apply finite-family-siftedsum to the label map and active prime product.

**Acceptance.** Zero survives when it avoids the chosen residues; it is not automatically removed just because the carrier is a divisibility sieve.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6

<a id="SV-0-residue-euler-product"></a>

### Deleting empty local conditions preserves the Euler product

**Declaration:** `BoundingSieve.ofResidueClasses_eulerProduct`. **Kind:** lemma.

For s=ofResidueClasses(A,x,w,Q,Ω,X), ∏_{p∈primeFactors(s.prodPrimes)}(1−s.nu(p)) = ∏_{p∈Q}(1−card(Ωp)/p).

**Hypotheses and conventions.** A is a finite index set, x maps indices to integers, w is real-valued and nonnegative on A, Q is a finite set consisting of primes, Ωp is a finite subset of ZMod p for each natural p, card(Ωp)<p for p∈Q, and X is an arbitrary real. Write ρ(p)=card(Ωp)/p, Q+= {p∈Q : Ωp is nonempty}, P=∏_{p∈Q+}p and L(b)=∏_{p∈Q,b mod p∈Ωp}p. All products are finite, with empty product 1. These are local expressions, not new carriers or functions in the blueprint.

**Prerequisites.** [Sieve with arbitrary excluded residue classes](#SV-0-residue-class-sieve); `Nat.primeFactors_prod` (Mathlib); `ArithmeticFunction.prodPrimeFactors_apply` (Mathlib); `Nat.Prime.primeFactors` (Mathlib).

**Proof route.** Use primeFactors_prod to identify the carrier prime factors with Q+.

**Acceptance.** Empty local sets contribute factors one, not zero.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6

<a id="SV-0-full-residue-obstruction"></a>

### A fully excluded residue space leaves no survivors

**Declaration:** `BoundingSieve.full_residueClass_siftedSum_eq_zero`. **Kind:** theorem.

For any finite indexed population A, integer sample map x, arbitrary real weights w, finite prime set Q and finite local sets Ωp, if p∈Q and card(Ωp)=p, then Σ_{a∈A,∀q∈Q,x(a) mod q∉Ωq}w(a)=0.

**Hypotheses and conventions.** No nonnegativity of weights and no properness of the other local sets is needed. This result is stated before constructing a BoundingSieve; density one is outside its permitted prime-density range.

**Prerequisites.** `ZMod.card` (Mathlib); `Finset.eq_univ_of_card` (Mathlib); `Finset.card_le_univ` (Mathlib).

**Proof route.** Since p is prime it is nonzero. The finite residue ring ZMod p has cardinality p.

**Unit tests.**

- `residue_full_class_obstruction`: Excluding every residue modulo 3 leaves weighted sum zero on −2,…,3.

**Acceptance.** The obstruction handles nonempty sample sets, not just the trivial empty-population case.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6

<a id="SV-0-residue-legendre-error"></a>

### Legendre error for arbitrary local residue conditions

**Declaration:** `BoundingSieve.residueClass_legendre_error`. **Kind:** theorem.

Under the proper local-set hypotheses, let S=Σ_{a∈A,∀p∈Q,x(a) mod p∉Ωp}w(a), ρ(p)=card(Ωp)/p and P=∏_{p∈Q,Ωp nonempty}p. Then |S−X∏_{p∈Q}(1−ρ(p))| ≤ Σ_{d|P}|Σ_{a∈A,∀p∈primeFactors(d),x(a) mod p∈Ωp}w(a)−X∏_{p∈primeFactors(d)}ρ(p)|.

**Hypotheses and conventions.** A is a finite index set, x maps indices to integers, w is real-valued and nonnegative on A, Q is a finite set consisting of primes, Ωp is a finite subset of ZMod p for each natural p, card(Ωp)<p for p∈Q, and X is an arbitrary real. The divisor sum includes d=1; X need not equal the indexed total weight. No analytic remainder, dimension or distribution hypothesis is implied.

**Prerequisites.** [Sieve with arbitrary excluded residue classes](#SV-0-residue-class-sieve); [Divisibility sum equals the local intersection](#SV-0-residue-class-multsum); [Sifted sum equals the original local avoidance count](#SV-0-residue-class-siftedsum); [Deleting empty local conditions preserves the Euler product](#SV-0-residue-euler-product); [Absolute Legendre error bound](#SV-0-legendre-error); `BoundingSieve.rem` (Mathlib); `ArithmeticFunction.prodPrimeFactors_apply` (Mathlib).

**Proof route.** Apply the inherited legendre-error theorem to the residue-class constructor.

**Unit tests.**

- `residue_label_has_no_linear_cutoff`: For bad residues {0,−2} and Q={3,5,7,11}, the integer 33 has prime-product label 1155; the label is not bounded by the original sample's size.

**Acceptance.** All-empty local data give the identity |Σw−X|≤|Σw−X|, retaining the mass-normalization error at d=1.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6

<a id="SV-0-log-sieve-dimension"></a>

### Logarithmic sieve dimension

**Declaration:** `SieveQuantitative.HasLogSieveDimension`. **Kind:** definition.

HasLogSieveDimension(P,g,κ,C) means: for every real z≥2, Σ_{p∈P, p prime, p≤z} g(p) log p ≤ κ log z+C. The sum is finite. P is a fixed set of naturals and g is a fixed real function; constants do not depend on z or on an application population.

**Hypotheses and conventions.** The predicate records only the displayed inequality. Positivity of g, κ and C are separate theorem hypotheses; it does not assert a local density or any distribution estimate. In Chapter 11 g(p)=ω(p)/p.

**Prerequisites.** `Real.log` (Mathlib).

**Proof route.** Use the finite prime set obtained by filtering naturals up to floor z. Quantify the bound over every real z≥2, not merely a single cutoff.

**API.**

- `SieveQuantitative.hasLogSieveDimension_iff` (characterisation): Equivalent to the displayed bound for every z≥2.
- `SieveQuantitative.HasLogSieveDimension.mono_constant` (functoriality): Increase C and retain the same dimension bound.
- `SieveQuantitative.HasLogSieveDimension.mono_dimension` (functoriality): Increasing κ preserves the condition because log z≥0 on the quantified domain.
- `SieveQuantitative.HasLogSieveDimension.mono_density` (functoriality): If h(p)≤g(p) at all selected primes, the bound for g implies the same bound for h.
- `SieveQuantitative.hasLogSieveDimension_empty` (simp): For empty P and nonnegative κ,C the predicate holds.

**Unit tests.**

- `dimension_empty`: P empty, κ=C=0 satisfies the bound with sum zero.
- `dimension_negative_constant`: P empty, κ=0,C=−1 does not satisfy the bound.
- `dimension_single_prime`: P={2}, g(2)=1/2, κ=0,C=log 2/2 satisfies the bound exactly at z=2.
- `dimension_single_cutoff_not_uniform`: A bound checked only at z=2 is not the all-z predicate; an unbounded density at larger primes is not constrained by that check.

**Acceptance.** A finite set at a single cutoff does not supply constants uniform across a varying prime family.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.4, (11.4.1)

<a id="SV-0-product-sieve-dimension"></a>

### Euler-product sieve dimension

**Declaration:** `SieveQuantitative.HasProductSieveDimension`. **Kind:** definition.

HasProductSieveDimension(P,g,κ,K) means: for every real 2≤w≤z, ∏_{p∈P, p prime, w≤p<z}(1−g(p))⁻¹ ≤ K (log z/log w)^κ.

**Hypotheses and conventions.** All endpoint choices are part of the definition: p=w is included and p=z is excluded. The predicate alone does not require g(p)<1; every sieve theorem requires 0≤g(p)<1 separately.

**Prerequisites.** `Real.log` (Mathlib).

**Proof route.** Take the finite product over primes below ceil z and filter by w≤p. Use real powers and the strictly positive logarithm of w.

**API.**

- `SieveQuantitative.hasProductSieveDimension_iff` (characterisation): Unfold to the exact interval product and logarithmic ratio.
- `SieveQuantitative.HasProductSieveDimension.mono_constant` (functoriality): K≤K′ preserves the bound since the logarithmic power is nonnegative.
- `SieveQuantitative.HasProductSieveDimension.mono_dimension` (functoriality): For K≥0 and κ≤κ′ increase the exponent of a ratio at least one.
- `SieveQuantitative.HasProductSieveDimension.interval_bound` (relation): Apply the predicate on any explicit interval with 2≤w≤z.
- `SieveQuantitative.hasProductSieveDimension_zero_density` (example): For g identically zero and κ≥0,K≥1 every product is one, so the predicate holds.

**Unit tests.**

- `product_dimension_zero`: Zero density with κ=0,K=1 satisfies the condition.
- `product_dimension_diagonal`: At w=z the empty product is one and the logarithmic ratio is one; K<1 cannot satisfy the predicate.
- `product_dimension_endpoint`: For P={2},g(2)=1/2, the interval [2,2) has product 1, whereas [2,3) has product 2.
- `product_dimension_unit_density`: g(2)=1 is forbidden by the sieve theorem even if the totalized inverse in the bare predicate is zero.

**Acceptance.** Do not infer this product-ratio condition from the logarithmic condition without controlling primes with g(p) near one.

**Source.** [KED-ANT-12](#source-ked-ant-12), §12.3, (12.3.1)

<a id="SV-0-remainder-mass"></a>

### Truncated remainder mass

**Declaration:** `SieveQuantitative.remainderMass`. **Kind:** definition.

For an existing BoundingSieve s and real D, remainderMass(s,D)=Σ_{d|s.prodPrimes, d<D}|s.rem(d)|. Divisors are positive; the cutoff is strict.

**Hypotheses and conventions.** D can be any real. The sum is zero if D≤1. If D>1 it includes d=1 and hence the mass-normalization error.

**Prerequisites.** `BoundingSieve` (Mathlib); `BoundingSieve.rem` (Mathlib).

**Proof route.** Filter the native positive divisor finset and sum absolute values of the existing remainder.

**API.**

- `SieveQuantitative.remainderMass_nonneg` (relation): Every remainder mass is nonnegative.
- `SieveQuantitative.remainderMass_mono` (functoriality): D≤E implies remainderMass(s,D)≤remainderMass(s,E).
- `SieveQuantitative.remainderMass_of_le_one` (simp): D≤1 implies remainderMass(s,D)=0.
- `SieveQuantitative.remainderMass_eq_of_remainders` (extensionality): The same prime product and equal remainders on its divisors give equal remainder masses.
- `SieveQuantitative.errSum_le_remainderMass` (relation): Coefficients of modulus≤L on divisors, vanishing for d≥D, have errSum≤L remainderMass(s,D), for L≥0.

**Unit tests.**

- `remainder_mass_endpoint`: P=6 and all four remainders equal one give masses 0 at D=1, 1 at D=2, 2 at D=3, 3 at D=6 and 4 at D=7.
- `remainder_mass_signed`: R_2=1 and R_3=−1 contribute 2 once D>3, not zero.
- `remainder_mass_mass_error`: P=1,D=2 gives |A_1−X|.
- `remainder_mass_negative_cutoff`: D=−3 gives zero even if zero belongs to the sample support.

**Acceptance.** This is not SelbergSieve.level, and signed cancellation cannot reduce it.

**Source.** [KED-ANT-12](#source-ked-ant-12), §12.2, display R(x,y) preceding §12.3

<a id="SV-0-family-sieve-level"></a>

### Level of distribution of a sieve family

**Declaration:** `SieveQuantitative.HasSieveLevel`. **Kind:** definition.

HasSieveLevel(F,θ) for a fixed family F:real→BoundingSieve means θ>0, X_F(x)≥0 for all x≥2, and: for every A>0 there exist B>0,C>0,x₀≥2 such that for all x≥x₀, remainderMass(F(x), x^θ/(log x)^B)≤ C X_F(x)/(log x)^A.

**Hypotheses and conventions.** F and θ are fixed before A is chosen. B,C,x₀ may depend on F,θ,A, not on the varying x. This is a weighted sieve-family predicate, not Maynard’s π-centred prime-distribution predicate.

**Prerequisites.** [Truncated remainder mass](#SV-0-remainder-mass); `BoundingSieve` (Mathlib).

**Proof route.** Write out the order of quantifiers. Retain the absolute divisor sum, its strict cutoff and its mass-normalization remainder.

**API.**

- `SieveQuantitative.hasSieveLevel_iff` (characterisation): Equivalent to the full quantified family estimate with positivity conditions.
- `SieveQuantitative.HasSieveLevel.bound` (relation): For a specified A>0 obtain one B,C,x₀ uniform for every x≥x₀.
- `SieveQuantitative.HasSieveLevel.mono` (functoriality): If 0<η≤θ a family of level θ has level η, using monotonicity of remainder mass and x≥2.
- `SieveQuantitative.HasSieveLevel.mass_nonneg` (projection): Every x≥2 has nonnegative approximate mass.
- `SieveQuantitative.hasSieveLevel_of_zero_remainders` (example): A nonnegative-mass family with every divisor remainder zero has every positive level.

**Unit tests.**

- `family_level_exact`: A nonnegative-mass family with all remainders zero satisfies the condition at θ=1.
- `family_level_zero`: θ=0 fails the stated positive-level predicate even for an exact family.
- `family_level_fixed_mass_error`: A family with X=1 and |R_1|=1 for every x≥2 has no positive level: the cutoff eventually exceeds 1 but no logarithmic saving controls R_1.
- `family_level_zero_mass`: The empty exact family X=0 is permitted and has every positive level.

**Acceptance.** An arbitrary coefficient level, a pointwise error without summed uniformity, or a negative approximate mass is not this condition.

**Source.** [KED-ANT-12](#source-ked-ant-12), §12.1 remainder discussion and §12.2 R(x,y)

<a id="SV-0-coefficient-error-remainder-mass"></a>

### Coefficient error controlled by remainder mass

**Declaration:** `SieveQuantitative.errSum_le_remainderMass`. **Kind:** lemma.

If L≥0, |c(d)|≤L on the divisors of P and c(d)=0 on every divisor d≥D, then s.errSum(c)≤L remainderMass(s,D).

**Hypotheses and conventions.** s is a BoundingSieve; D is real and the cutoff is strict. This promotes the remainderMass API item used by Brun’s estimate.

**Prerequisites.** [Truncated remainder mass](#SV-0-remainder-mass); `BoundingSieve.errSum` (Mathlib).

**Proof route.** Split the finite divisor sum by d<D. The complementary coefficients vanish. Bound each remaining nonnegative term by L|R_d| and factor the constant out.

**Acceptance.** D≤1 forces every contributing coefficient to vanish; L=0 gives zero error.

**Source.** [KED-ANT-12](#source-ked-ant-12), §12.2, error estimate for R±

<a id="SV-0-density-euler-moment"></a>

### Finite tilted density Euler product

**Declaration:** `SieveQuantitative.density_euler_moment`. **Kind:** lemma.

For any real a and BoundingSieve s, Σ_{d|P} ν(d)d^a = ∏_{p|P}(1+ν(p)p^a).

**Hypotheses and conventions.** P=s.prodPrimes is nonzero squarefree; all powers have positive natural bases, including d=1.

**Prerequisites.** `BoundingSieve` (Mathlib); `BoundingSieve.prod_primeFactors_nu` (Mathlib); `Nat.sum_divisors_filter_squarefree` (Mathlib).

**Proof route.** Use the native squarefree-divisor/subset correspondence. Multiplicativity of ν and real powers on positive products identify each subset term. Expand the finite product by choosing either 1 or ν(p)p^a at each prime.

**Acceptance.** P=1 gives 1=1 for every a; a=0 gives Σν(d)=∏(1+ν(p)).

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.3, Rankin proof; Exercise 11.6.1

<a id="SV-0-rankin-weighted-prefix"></a>

### Weighted Rankin cutoff bound

**Declaration:** `SieveQuantitative.rankin_weighted_prefix`. **Kind:** theorem.

For x>0 and σ≥0, Σ_{d|P, d≤x} dν(d) ≤ x^σ ∏_{p|P}(1+ν(p)p^(1−σ)).

**Hypotheses and conventions.** s is a BoundingSieve. The inclusive cutoff is explicit; x<1 gives an empty sum.

**Prerequisites.** [Finite tilted density Euler product](#SV-0-density-euler-moment); `BoundingSieve.nu_pos_of_dvd_prodPrimes` (Mathlib).

**Proof route.** For d≤x compare d^σ≤x^σ, multiply by ν(d)d^(1−σ), and sum. Extend the sum by nonnegative terms and apply the finite Euler-moment identity with exponent 1−σ.

**Acceptance.** σ=0 remains valid; x=1 retains the d=1 contribution; do not include d=0.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.3, Rankin proof; §11.4, Lemma 11.7 and Exercise 11.6.1

<a id="SV-0-rankin-weighted-tail"></a>

### Weighted Rankin remainder-tail bound

**Declaration:** `SieveQuantitative.rankin_weighted_tail`. **Kind:** theorem.

For x>0 and a≥0, Σ_{d|P, x<d} ν(d) ≤ x^(−a) ∏_{p|P}(1+ν(p)p^a).

**Hypotheses and conventions.** s is a BoundingSieve; the tail is strict.

**Prerequisites.** [Finite tilted density Euler product](#SV-0-density-euler-moment); `BoundingSieve.nu_pos_of_dvd_prodPrimes` (Mathlib).

**Proof route.** On the tail use 1≤(d/x)^a, retain nonnegative ν(d), and extend to all divisors. Apply the Euler-moment identity.

**Acceptance.** At x=P the tail is empty; x<1 includes d=1; a=0 gives the full density sum as an upper bound.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.3, Rankin proof; §11.4, Lemma 11.8

<a id="SV-0-log-dimension-euler-bound"></a>

### Tilted Euler-product estimate from logarithmic dimension

**Declaration:** `SieveQuantitative.log_dimension_euler_bound`. **Kind:** theorem.

Fix a set P and function g, with κ>0,C≥0, nonnegative g(p) for selected primes and HasLogSieveDimension(P,g,κ,C). There exist K>0,z₀≥exp(2) such that for every z≥z₀, ∏_{p∈P,p prime,p≤z}(1+g(p)p^(1/log z)) ≤ K(log z)^κ.

**Hypotheses and conventions.** All data P,g,κ,C are fixed before K,z₀ are chosen. The constants are independent of z and of every application population.

**Prerequisites.** [Logarithmic sieve dimension](#SV-0-log-sieve-dimension); `sum_mul_eq_sub_sub_integral_mul` (Mathlib); `Real.prod_one_add_le_exp_sum` (Mathlib).

**Proof route.** Set A(t)=Σ_{p≤t,p∈P}g(p)log p. Apply the native Abel formula on [2,z] to 1/log t, isolating p=2, to obtain Σg(p)≤κ log log z+O_{κ,C}(1). Its derivative is −1/(t(log t)²), integrable on this domain.

**Acceptance.** The lower endpoint is at least exp(2), so 0<1−1/log z<1 in the cutoff applications. No Mertens theorem is required when the logarithmic condition is given.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.4, Lemma 11.7; Exercise 11.6.1

<a id="SV-0-dimension-divisor-count"></a>

### Dimension-controlled weighted divisor count

**Declaration:** `SieveQuantitative.dimension_divisor_count`. **Kind:** theorem.

For fixed data of log-dimension-euler-bound, there exist K>0,z₀≥exp(2) such that for every z≥z₀, every x>0 and every BoundingSieve s whose prime factors are exactly the selected primes p≤z and whose ν(p)=g(p), Σ_{d|P_s,d≤x}dν(d) ≤ K x(log z)^κ exp(−log x/log z).

**Hypotheses and conventions.** Constants are uniform in x and s; all density data and dimension constants are fixed. This implies the strict-cutoff version of source Lemma 11.7.

**Prerequisites.** [Weighted Rankin cutoff bound](#SV-0-rankin-weighted-prefix); [Tilted Euler-product estimate from logarithmic dimension](#SV-0-log-dimension-euler-bound).

**Proof route.** Apply weighted Rankin with σ=1−1/log z, then bound its finite Euler product by the preceding theorem. Rewrite x^σ as x exp(−log x/log z).

**Acceptance.** The inclusive cutoff is a stronger conclusion than the source’s d<x; x<1 gives an empty divisor sum.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.4, Lemma 11.7 and Exercise 11.6.1

<a id="SV-0-dimension-divisor-tail"></a>

### Dimension-controlled divisor-density tail

**Declaration:** `SieveQuantitative.dimension_divisor_tail`. **Kind:** theorem.

For the same fixed data there exist K>0,z₀≥exp(2) such that for every z≥z₀,x>0 and matching sieve s, Σ_{d|P_s,x<d}ν(d) ≤ K(log z)^κ exp(−log x/log z).

**Hypotheses and conventions.** For a fixed L>0 replace x by Lx and absorb the bounded factor L^(−1/log z) in K.

**Prerequisites.** [Weighted Rankin remainder-tail bound](#SV-0-rankin-weighted-tail); [Tilted Euler-product estimate from logarithmic dimension](#SV-0-log-dimension-euler-bound).

**Proof route.** Use weighted Rankin with a=1/log z and the tilted Euler-product estimate. This avoids integration of a divisor-count bound and so removes the extra log z loss of the source integral argument.

**Acceptance.** This is a worker-derived stronger finite-tail estimate, not a quotation of the source’s (log z)^(κ+1) bound. No infinite divisor tail is asserted.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.4, Lemma 11.8 and (11.4.2)

<a id="SV-0-eratosthenes-mass-cutoff"></a>

### Eratosthenes estimate with a justified mass and divisor cutoff

**Declaration:** `SieveQuantitative.eratosthenes_mass_cutoff`. **Kind:** theorem.

Let x>0,c,M≥0 and 0<σ<1. If 0≤X≤Mx, |R_d|≤c dν(d) for divisors d≤x, and A_d=0 for divisors d>x, then |S−X∏_{p|P}(1−ν(p))|≤(c+M)x^σ∏_{p|P}(1+ν(p)p^(1−σ)).

**Hypotheses and conventions.** s is the native BoundingSieve; A_d is its weighted multSum. The mass bound and the divisor cutoff are assumptions to prove in an application, never consequences of the residue-label representation.

**Prerequisites.** [Absolute Legendre error bound](#SV-0-legendre-error); [Weighted Rankin cutoff bound](#SV-0-rankin-weighted-prefix); [Weighted Rankin remainder-tail bound](#SV-0-rankin-weighted-tail); `BoundingSieve.multSum_eq_main_err` (Mathlib).

**Proof route.** Split the native absolute Legendre remainder into d≤x and d>x. Bound the first piece by c times the weighted prefix. On the tail, A_d=0 gives |R_d|=Xν(d); apply weighted Rankin with a=1−σ and X≤Mx. Combine the common Euler product.

**Acceptance.** This conditional statement does not claim the exact advertised Theorem 11.9 under its weaker printed hypotheses, nor does it fix the two-residue cutoff gap E7 in the Brun application.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.4, Theorem 11.9 and Exercise 11.6.3; proof of Theorem 11.11

**Open proof inputs.** [Mass and remainder control in Eratosthenes applications](#g-mass).

<a id="SV-0-binary-local-densities"></a>

### Binary polynomial local densities

**Declaration:** `SieveBinary.rho`. **Kind:** definition.

For Q∈Z[x₀,x₁] and a>0, ρ_Q(a) counts zeros in (Z/aZ)², with ρ_Q(0)=0. For prime p and k≥1 a zero modulo p^k is smooth if some partial derivative is nonzero modulo p. Let ρsing_Q(p^k) count the remaining zeros, and let ρ̃_Q(p^k) count zeros which are smooth OR have no zero lift modulo p^(k+1). Extend ρ̃ multiplicatively to positive a, with ρ̃(1)=1 and ρ̃(0)=0. Do not replace it by a smooth-only count.

**Hypotheses and conventions.** Native two-variable polynomial over Z; positive moduli for counts; p prime and k≥1 for the singular correction.

**Prerequisites.** `MvPolynomial.eval₂` (Mathlib); `MvPolynomial.pderiv` (Mathlib); `ZMod` (Mathlib); `Nat.factorization` (Mathlib).

**Proof route.** Use finite native residue spaces and polynomial evaluation; define the reduction of a lift coordinatewise.

**API.**

- `SieveBinary.rho_one` (simp): ρ_Q(1)=1.
- `SieveBinary.rho_zero` (simp): ρ_Q(0)=0, an explicit extension outside the source’s positive domain.
- `SieveBinary.rho_coprime_mul` (relation): For coprime positive a,b, ρ_Q(ab)=ρ_Q(a)ρ_Q(b), by native CRT.
- `SieveBinary.rhoCorrectedPower` (constructor): Count the prime-power zero classes which are smooth or have no lift.
- `SieveBinary.rhoSingularPower` (constructor): Count the prime-power zero classes with both derivatives zero modulo p.
- `SieveBinary.rhoCorrected` (constructor): Multiplicative extension of the corrected counts.
- `SieveBinary.rhoCorrected_one` (simp): ρ̃_Q(1)=1.
- `SieveBinary.rhoCorrected_le_rho` (other): ρ̃_Q(a)≤ρ_Q(a) for every positive a.
- `SieveBinary.rhoCorrected_coprime_mul` (relation): ρ̃_Q is multiplicative on positive coprime arguments.
- `SieveBinary.rhoCorrected_sub_singular` (relation): For p prime,k≥1, p²ρ̃_Q(p^k)=p²ρ_Q(p^k)−ρsing_Q(p^(k+1)); use integer equality to avoid truncated natural subtraction.

**Unit tests.**

- `rho_linear`: For Q=x₀, ρ_Q(9)=9 and ρ̃_Q(9)=9.
- `rho_zero_polynomial`: For Q=0, ρ_Q(4)=16 but ρ̃_Q(4)=0.
- `rho_singular_no_lift`: For Q=2, ρ̃_Q(2)=4 and ρ̃_Q(4)=0; all the first-level zeros are singular with no lift.
- `rho_square_at_four`: For Q=x₀², ρ_Q(4)=8 and ρ̃_Q(4)=4.
- `rho_modulus_one`: Every Q has ρ_Q(1)=ρ̃_Q(1)=1.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Definition 9.1 and Lemma 9.3, pp.221–222

<a id="SV-0-curve-lifting-correction"></a>

### Curve lifting and singular correction

**Declaration:** `SieveBinary.curve_lifting_correction`. **Kind:** theorem.

For prime p,k≥1, every smooth zero modulo p^k has exactly p zero lifts to p^(k+1); a singular zero has either p² lifts or no lift. Thus p²ρ̃_Q(p^k)=p²ρ_Q(p^k)−ρsing_Q(p^(k+1)).

**Hypotheses and conventions.** p prime; k≥1.

**Prerequisites.** [Binary polynomial local densities](#SV-0-binary-local-densities); `MvPolynomial.pderiv` (Mathlib).

**Proof route.** Taylor-expand Q at x+p^k t modulo p^(k+1); higher terms vanish for k≥1.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Definition 9.1(3)–(5), Lemma 9.3, pp.221–222

<a id="SV-0-binary-schwartz-zippel"></a>

### Binary Schwartz–Zippel specialization

**Declaration:** `SieveBinary.rho_prime_le_degree_mul`. **Kind:** comparison.

If p is prime and the reduction of Q modulo p is nonzero, then ρ_Q(p)≤p·totalDegree(Q). The general Schwartz–Zippel theorem is already Mathlib; this node is its local-count adapter.

**Hypotheses and conventions.** p prime; Q mod p nonzero, not merely Q≠0 over Z.

**Prerequisites.** [Binary polynomial local densities](#SV-0-binary-local-densities); `MvPolynomial.schwartz_zippel_totalDegree` (Mathlib).

**Proof route.** Apply the native theorem to the full finite field and two variables. Clear its nonzero denominator p², and bound the degree after coefficient reduction by the original total degree.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Lemma 9.2, p.221

<a id="SV-0-multiplicative-growth-class"></a>

### Multiplicative sieve growth class

**Declaration:** `SieveBinary.HasMultiplicativeGrowth`. **Kind:** definition.

For a native real arithmetic function f, define M(A,B,ε) by A≥1,B>0,ε>0, multiplicativity, nonnegativity, and f(n)≤min(A^Ω(n),B n^ε) for every n>0. Ω counts prime factors with multiplicity. ArithmeticFunction already makes f(0)=0; no estimate at Q=0 is silently inferred.

**Hypotheses and conventions.** Native ArithmeticFunction R; A≥1,B>0,ε>0 included in the predicate.

**Prerequisites.** `ArithmeticFunction` (Mathlib); `ArithmeticFunction.cardFactors` (Mathlib); `ArithmeticFunction.IsMultiplicative` (Mathlib).

**Proof route.** Use the native arithmetic-function and multiplicativity APIs, with a concrete conjunction of the two growth inequalities.

**API.**

- `SieveBinary.HasMultiplicativeGrowth.nonneg` (other): f(n)≥0 for every n.
- `SieveBinary.HasMultiplicativeGrowth.prime_power` (other): f(p^k)≤min(A^k,B p^(kε)) for prime p,k≥1.
- `SieveBinary.HasMultiplicativeGrowth.mono` (relation): Increasing A,B or ε preserves membership when the new parameters are positive and A≥1.
- `SieveBinary.HasMultiplicativeGrowth.mul_coprime` (relation): For coprime a,b, f(ab)=f(a)f(b).
- `SieveBinary.zeta_hasMultiplicativeGrowth` (compatibility): The native all-ones-on-positive-integers ζ has M(1,1,ε) for every ε>0.

**Unit tests.**

- `growth_zeta`: ζ belongs to M(1,1,1).
- `growth_negative`: −ζ fails nonnegativity and multiplicativity.
- `growth_multiplicity`: The multiplicative function f(n)=2^Ω(n) for n>0 has f(4)=4, not 2, and belongs to M(2,1,1).
- `growth_not_dimension_zero`: The same f fails M(1,1,1) at n=2.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Definition 9.6, p.222; Proposition 10.10, pp.242–243

<a id="SV-0-binary-density-correction-factor"></a>

### Binary density correction factor

**Declaration:** `SieveBinary.thetaDensity`. **Kind:** definition.

Define θ_Q multiplicatively by θ_Q(p^k)=1+2ρ_Q(p)/p² when Q mod p≠0 and θ_Q(p^k)=1 at content primes, for k≥1. Define λ_Q(n)=μ(n)²2^ω(n)ρ_Q(n)/n² when n is coprime to every content prime, and zero otherwise, with λ_Q(1)=1 and λ_Q(0)=0. Then θ_Q=ζ*λ_Q for native Dirichlet convolution; ζ is the positive all-ones function, not the convolution unit.

**Hypotheses and conventions.** Positive integer arguments; content means all coefficients divisible by p.

**Prerequisites.** [Binary polynomial local densities](#SV-0-binary-local-densities); `ArithmeticFunction.zeta` (Mathlib); `ArithmeticFunction.moebius` (Mathlib); `ArithmeticFunction.cardDistinctFactors` (Mathlib).

**Proof route.** Use explicit prime-factor products for θ and the squarefree formula for λ, then prove the identity by multiplicativity and prime powers.

**API.**

- `SieveBinary.thetaDensity_one` (simp): θ_Q(1)=1.
- `SieveBinary.thetaDensity_prime_power` (simp): The factor is independent of the positive exponent.
- `SieveBinary.lambdaDensity` (constructor): Squarefree Möbius inversion factor with content primes removed.
- `SieveBinary.thetaDensity_eq_divisor_sum` (relation): θ_Q(n)=Σ_{d|n}λ_Q(d) for n>0.
- `SieveBinary.thetaDensity_nonneg` (other): θ_Q(n)≥1 for n>0.
- `SieveBinary.growth_mul_thetaDensity` (other): If f has M(A,B,ε), then fθ_Q has M(A′,B′,ε+ε′), for each ε′>0, with A′,B′ depending only on the indicated original parameters and degree.

**Unit tests.**

- `theta_linear_three`: For Q=x₀, θ_Q(9)=5/3 and λ_Q(9)=0.
- `theta_zero_polynomial`: For Q=0, θ_Q(n)=1 for all n>0 and λ_Q(n)=0 for n>1.
- `theta_unit`: θ_Q(1)=λ_Q(1)=1.
- `theta_coprime_product`: For Q=x₀, θ_Q(6)=10/3, not a factor evaluated only at 6.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Definition 9.15, Remark 9.16 and Corollary 9.17, pp.227–228

<a id="SV-0-conic-normal-form-adapter"></a>

### Integral local normal forms for conic counts

**Declaration:** `SieveConic.conic_normal_form_adapter`. **Kind:** comparison.

For primitive q=ax²+bxy+cy² of negative discriminant D=b²−4ac, the existing integral-local classification specializes to the following count-preserving changes of variables over Z_p: diagonal ux²+Ay² with u a unit if p is odd or p=2,D≡0 mod4; xy if p=2,D≡1 mod8; x²+xy+y² if p=2,D≡5 mod8. Reduce the isometries modulo every p^n to obtain bijections of the counted residue spaces. This imports the local classification, rather than planning Jordan theory again.

**Hypotheses and conventions.** Primitive q; D<0; integral GL₂(Z_p) equivalence, not just equivalence over Q_p.

**Prerequisites.** [Binary polynomial local densities](#SV-0-binary-local-densities).

**Proof route.** Import integral localization, odd-prime orthogonal bases and dyadic unimodular classification from the current IntegralLattices Layer 3.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Lemma B.1 and Remark B.2, p.265

**Open proof inputs.** [Integral conic normal-form comparison](#g-local-normal-form).

<a id="SV-0-conic-regular-density"></a>

### Regular-prime conic densities

**Declaration:** `SieveConic.conic_regular_density`. **Kind:** theorem.

For primitive q of discriminant D<0, Q=q−ωD, prime p with p∤ωD and n≥1, ρ_Q(p^n)=ρ̃_Q(p^n)=p^(n−1)(p−χ_D(p)), where χ_D is the Kronecker discriminant character. At 2 use the explicit dyadic value, not the native odd Jacobi convention.

**Hypotheses and conventions.** Primitive q; D<0; p∤ωD; n≥1.

**Prerequisites.** [Binary polynomial local densities](#SV-0-binary-local-densities); [Curve lifting and singular correction](#SV-0-curve-lifting-correction); [Integral local normal forms for conic counts](#SV-0-conic-normal-form-adapter); [Real discriminant character](#SV-2-real-discriminant-character).

**Proof route.** The reduction is smooth; count the projective conic and remove its zero, one or two points at infinity according to the splitting character.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Proposition B.3, pp.265–266

**Open proof inputs.** [Integral conic normal-form comparison](#g-local-normal-form).

<a id="SV-0-conic-singular-density-recursion"></a>

### Singular-prime conic density recursion

**Declaration:** `SieveConic.conic_singular_density_recursion`. **Kind:** theorem.

For odd p and a nondegenerate unit binary quadratic form q₀, let R(n,m) count q₀(x,y)≡u₃p^m mod p^n, with u₃ a unit. Set R(0,m)=1; R(n,0)=p^(n−1)(p−χ) where χ is its discriminant Legendre symbol. For m≥1 its smooth part is (p−1)(1+χ)p^(n−1); its singular part is p²R(n−2,m−2) when n,m≥2, zero for n≥2,m=1, and 1 for n=1. For a diagonal conic with p^ℓ exactly dividing D, n≤ℓ gives ρ_Q(p^n)=p^(n+floor(n/2)). For n>ℓ, rescale x=p^ceil(ℓ/2)x₀ and use the equation u p^(ℓ mod2)x₀²+u_Ay²+4ωu u_A≡0 mod p^(n−ℓ), with multiplicity p^(ℓ+floor(ℓ/2)).

**Hypotheses and conventions.** Odd prime p; unit coefficients; primitive conic; ℓ is the actual valuation of D. Dyadic diagonal case uses a separate bound.

**Prerequisites.** [Integral local normal forms for conic counts](#SV-0-conic-normal-form-adapter); [Curve lifting and singular correction](#SV-0-curve-lifting-correction); [Real discriminant character](#SV-2-real-discriminant-character).

**Proof route.** Separate primitive residue pairs from pairs divisible by p. For a split form the nonzero zero-level fibre has 2(p−1) points; for an anisotropic form it has none.

**Acceptance.** p=3,q₀=x²−y²,m=n=1 gives5 roots, not1.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Lemma B.4, equation (67), pp.266–268; Proposition B.5, equation (68), pp.268–269

**Open proof inputs.** [Integral conic normal-form comparison](#g-local-normal-form).

<a id="SV-0-conic-uniform-local-bound"></a>

### Uniform conic local-density bound

**Declaration:** `SieveConic.conic_uniform_local_bound`. **Kind:** theorem.

For primitive integral q=ax²+bxy+cy² of D<0, any integer ω, prime p and n≥1, ρ_{q−ωD}(p^n)≤16 p^(3n/2); therefore the same bound holds for corrected densities and supplies r=1/2,C=16. Constants do not depend on q,D,ω.

**Hypotheses and conventions.** Primitive q; D<0; every prime, including 2; n≥1.

**Prerequisites.** [Binary polynomial local densities](#SV-0-binary-local-densities); [Integral local normal forms for conic counts](#SV-0-conic-normal-form-adapter); [Singular-prime conic density recursion](#SV-0-conic-singular-density-recursion).

**Proof route.** A primitive binary quadratic has a primitive vector of unit value modulo p, so an integral basis change makes its leading coefficient a unit.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Corollary B.6, p.269

**Open proof inputs.** [Integral conic normal-form comparison](#g-local-normal-form), [Uniform dyadic conic root bound](#g-dyadic-roots).

<a id="SV-0-conic-genus-density-sum"></a>

### Genus-restricted conic density sum

**Declaration:** `SieveConic.conic_genus_density_sum`. **Kind:** theorem.

For odd p, unit integers u,u_A, q=ux²+p u_Ay², D=−4u u_Ap, p∤ω, ε=±1, and k=0 or1, sum ρ_{q−ωD}(p^k a;p²) over unit a mod p^(2−k) with (a/p)=ε. For k=0 the sum is p³(p−1) if (u/p)=ε and 0 otherwise. For k=1 it is p²[p−1−ε(u_A/p)−(−ωu/p)]/2. The last sign is required by the source’s definition Q=q−ωD.

**Hypotheses and conventions.** p odd prime; u,u_A,ω units mod p; ε=±1; congruence local counts as ρ_{Q−t}(modulus).

**Prerequisites.** [Binary polynomial local densities](#SV-0-binary-local-densities); [Curve lifting and singular correction](#SV-0-curve-lifting-correction); [Real discriminant character](#SV-2-real-discriminant-character).

**Proof route.** Introduce a nonzero square variable w so that p^k a=p^k u_εw², and divide the resulting count by the exact multiplicity 2p^k.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Proposition B.8, equations (69)–(72), pp.270–271

<a id="SV-0-quadratic-order-ideal-count-growth"></a>

### Quadratic-order ideal counts in the growth class

**Declaration:** `SieveBinary.quadratic_order_ideal_count_growth`. **Kind:** application.

For a fixed imaginary quadratic order Λ, let r_Λ(n) be the number of integral invertible Λ-ideals of norm n, with r_Λ(0)=0. Import that carrier and its norm fibres from the existing order/Picard and arithmetic Dirichlet-series roadmaps. The sieve specialization proves r_Λ is multiplicative and belongs to M(A_Λ,B_{Λ,ε},ε) for every ε>0, with the conductor-prime factors treated explicitly. For maximal orders one may take the standard divisor-count majorant.

**Hypotheses and conventions.** Fixed imaginary quadratic order; invertible ideals, not all proper ideals; ε>0.

**Prerequisites.** [GlobalNumberFields Layer 11 orders and picard groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/GlobalNumberFields/README.md#layer-11-orders-and-picard-groups); [ArithmeticDirichletSeries Layer 1 norm fibres and mathlib lseries](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/ArithmeticDirichletSeries/README.md#layer-1-norm-fibres-and-mathlib-lseries); [Multiplicative sieve growth class](#SV-0-multiplicative-growth-class); `AnalyticNumberTheory:AN.2`.

**Proof route.** Use the imported conductor-local ideal-count formula and coprime norm multiplicativity. At unramified primes there are at most k+1 ideals of norm p^k.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Proposition 10.10, §10.3, pp.242–243

**Open proof inputs.** [Conductor-local invertible-ideal counting](#g-order-count).

<a id="SV-0-polynomial-vector-sieve-data"></a>

### Polynomial-vector sieve data

**Declaration:** `SievePolynomialVector.vectorNorm`. **Kind:** construction.

For finitely many prime labels p_i use the native vector Π_i F_(p_i)[T], with monic sample components of fixed degree n and an arbitrary joint probability law. Define ||D||=∏p_i^deg D_i for nonzero components, zero when a component is zero; E_D is componentwise D_i|A_i. For finite sets I_i of monic irreducibles define E_(D,I) by D_i|A_i and no D_iJ dividing A_i for J∈I_i. This equals no J|A_i/D_i on the divisibility event. No independence of the reductions is assumed.

**Hypotheses and conventions.** Prime labels; monic D and A in sieve applications; finite I_i; normalized nonnegative mass.

**Prerequisites.** `Polynomial` (Mathlib); `Nat.Prime` (Mathlib); `ZMod` (Mathlib).

**Proof route.** Use dependent native polynomial types. Finite samples may be presented by coefficient tuples and a normalized finite mass, an adapter to the native probability-law carrier.

**API.**

- `SievePolynomialVector.vectorNorm` (data): The explicit product norm with zero-component convention.
- `SievePolynomialVector.vectorNorm_one` (simp): The all-one vector has norm one, including an empty index set.
- `SievePolynomialVector.vectorNorm_mul` (compatibility): For prime labels and nonzero native polynomial components, ||DG||=||D||||G||.
- `SievePolynomialVector.divisibilityProbability` (data): A finite normalized-mass presentation of Pr(D|A).
- `SievePolynomialVector.roughDivisibilityProbability` (data): Pr(D|A and no candidate J divides the quotient).
- `SievePolynomialVector.rough_probability_le` (relation): The rough-divisibility probability is at most Pr(D|A).
- `SievePolynomialVector.rough_empty` (simp): Empty candidate sets give the divisibility event.
- `SievePolynomialVector.probability_defect` (data): Pr(D|A)−1/||D||, for monic D.
- `SievePolynomialVector.quotient_event_iff` (characterisation): For monic D dividing A, D J∤A iff J∤A/D.

**Unit tests.**

- `polynomial_norm_degree`: At one label p=2, ||T³||=8.
- `polynomial_norm_zero`: A vector with a zero component has norm zero, not one.
- `polynomial_empty_candidates`: With an empty candidate set and D=1, the probability is one.
- `polynomial_repeated_factor`: For A=T²,D=T,I={T}, the rough event fails, although D|A.
- `polynomial_joint_law`: For two distinct labels p=2 and p=3 whose coefficients are equal Bernoulli bits, Pr(T divides both components)=1/2, not the product 1/4.

**Source.** [BSKK-23](#source-bskk-23), Notation before Proposition 8.1 and Lemma 8.2, p.39

## SV.1 — Brun and Selberg sieves

Brun coefficients give pointwise upper and lower brackets with a controlled strict support. Selberg weights use the existing quadratic-form diagonalization and add the optimizer. Applications preserve the denominator, progression and parity hypotheses. The binary and polynomial-vector routes require their own distribution inputs.

<a id="SV-1-selberg-diagonal-sum-dimension-one"></a>

### Selberg's diagonal sum in dimension one (GGPY Lemma 3, κ=1)

**Declaration:** `SieveSelberg.abs_sum_squarefree_diagonal_sub_le`. **Kind:** lemma.

Under (Ω₁) and (Ω₂(1,L)), the partial products of ∏_p (1 − γ(p)/p)^{−1}(1 − 1/p) converge to some c_γ, and for z≥2, Σ_{d<z} μ²(d)g(d) = c_γ log z + O(c_γ L). The implied constant depends only on A₁ and A₂.

**Hypotheses and conventions.** γ is multiplicative, A₁>1, A₂≥0 and L≥1. (Ω₁): 0 ≤ γ(p)/p ≤ 1 − 1/A₁ for every prime p. (Ω₂(1,L)): −L ≤ Σ_{w≤p<z} γ(p)log p/p − log(z/w) ≤ A₂ for 2≤w≤z. g(d) = ∏_{p|d} γ(p)/(p − γ(p)) on squarefree d. GGPY state (2.3) as γ(p)/p ≤ 1 − 1/A₁; Maynard's Lemma 6.1 writes 1 − A₁, an equivalent reparametrization. Only squarefree d contribute, so g need only be defined on squarefree integers. Maynard calls it totally multiplicative.

**Prerequisites.** `ArithmeticFunction.moebius` (Mathlib); `Squarefree` (Mathlib); `sum_mul_eq_sub_sub_integral_mul` (Mathlib); `AnalyticNumberTheory:AN.2`.

**Proof route.** Outline only: the source proof is Halberstam–Richert, Lemmas 5.3–5.4, which was not read (gap). Write G(y) = Σ_{d<y} μ²(d)g(d). For squarefree d, log d = Σ_{p|d} log p, so Σ_{d<z} μ²(d)g(d) log d = Σ_{p<z} g(p) log p·G_p(z/p), where G_p is G restricted to d coprime to p.

**Acceptance.** γ(p) = 1 for p∤W and γ(p) = 0 for p|W gives g(d) = 1/φ(d) on d coprime to W and c_γ = φ(W)/W, so Σ_{d<z,(d,W)=1} μ²(d)/φ(d) = (φ(W)/W)(log z + O(L)) with L ≪ 1 + Σ_{p|W} log p/p (Maynard (6.7)–(6.8)).

**Source.** [GGPY-2009](#source-ggpy-2009), §2, Lemma 3 with (2.3)–(2.5), pp. 9–10 (arXiv v1); [MAYNARD-2015](#source-maynard-2015), §6, Lemma 6.1 and its proof, p. 400

**Open proof inputs.** [Restricted Halberstam–Richert input in the Maynard route](#g-ggpy).

<a id="SV-1-selberg-smooth-diagonal-sum"></a>

### Smoothly weighted diagonal sum (Maynard Lemma 6.1, GGPY Lemma 4)

**Declaration:** `SieveSelberg.abs_sum_squarefree_diagonal_smooth_sub_le`. **Kind:** lemma.

Under (Ω₁) and (Ω₂(1,L)), for G: [0,1]→ℝ of class C¹ with G_max = sup_{[0,1]}(|G| + |G′|): Σ_{d<z} μ²(d)g(d)G(log d/log z) = c_γ log z ∫_0^1 G(x) dx + O(c_γ L G_max). The implied constant depends only on A₁ and A₂, not on L or G.

**Hypotheses and conventions.** γ is multiplicative, A₁>1, A₂≥0 and L≥1. (Ω₁): 0 ≤ γ(p)/p ≤ 1 − 1/A₁ for every prime p. (Ω₂(1,L)): −L ≤ Σ_{w≤p<z} γ(p)log p/p − log(z/w) ≤ A₂ for 2≤w≤z. g(d) = ∏_{p|d} γ(p)/(p − γ(p)) on squarefree d. GGPY state (2.3) as γ(p)/p ≤ 1 − 1/A₁; Maynard's Lemma 6.1 writes 1 − A₁, an equivalent reparametrization. GGPY state Lemma 4 for piecewise differentiable F evaluated at log(z/d)/log z. With G(x) = F(1−x) this is Maynard's form, with ∫_0^1 G = ∫_0^1 F(1−x) dx. Maynard writes S for c_γ.

**Prerequisites.** [Selberg's diagonal sum in dimension one (GGPY Lemma 3, κ=1)](#SV-1-selberg-diagonal-sum-dimension-one); `sum_mul_eq_sub_sub_integral_mul` (Mathlib).

**Proof route.** Write the sum as the Stieltjes integral ∫_{1−}^{z} G(log u/log z) d𝒢(u), where 𝒢(u) = Σ_{d<u} μ²(d)g(d) = c_γ log u + E(u) and |E(u)| ≤ C c_γ L by SV.1/selberg-diagonal-sum-dimension-one.

**Acceptance.** Maynard applies it with γ from (6.7), (6.11) and (6.19), obtaining (6.9), (6.13) and (6.21).

**Source.** [MAYNARD-2015](#source-maynard-2015), §6, Lemma 6.1, p. 400; [GGPY-2009](#source-ggpy-2009), §2, Lemma 4 and its proof, p. 10 (arXiv v1)

**Open proof inputs.** [Restricted Halberstam–Richert input in the Maynard route](#g-ggpy).

<a id="SV-1-brun-coefficients"></a>

### Brun combinatorial coefficients

**Declaration:** `SieveBrun.brunCoefficients`. **Kind:** construction.

For squarefree P, y>1, β>1 and parity ε∈{0,1}, put λ_ε(d)=μ(d) if d|P and the decreasing prime factors p₁>⋯>p_r of d satisfy p_m<(y/(p₁⋯p_m))^(1/β) for every 1≤m≤r with m≡ε mod 2; otherwise put λ_ε(d)=0. Put λ⁺=λ₁ and λ⁻=λ₀. The empty prime list makes λ⁺(1)=λ⁻(1)=1.

**Hypotheses and conventions.** Only positive divisors contribute. Prefix p₁⋯p_m includes p_m. Both coefficient systems retain every admissible prefix, not just divisors whose whole number of prime factors has one parity.

**Prerequisites.** `BoundingSieve` (Mathlib); `Finset.sort` (Mathlib); `ArithmeticFunction.moebius` (Mathlib).

**Proof route.** Sort the native finite prime-factor set decreasingly. Test the specified one-based prefix constraints, then use the existing Möbius coefficient with its sign. Define zero outside the positive divisor finset.

**API.**

- `SieveBrun.brunCoefficients_one` (simp): P squarefree,y>1 implies both coefficients at 1 are one.
- `SieveBrun.brunCoefficients_of_not_dvd` (simp): The coefficient is zero outside the positive divisors of P, including d=0.
- `SieveBrun.abs_brunCoefficients_le_one` (relation): Each coefficient has modulus at most one.
- `SieveBrun.brunCoefficients_eq_moebius` (characterisation): For squarefree P and d∣P, the selected coefficient equals μ(d) exactly when every parity-selected prime-prefix inequality holds; otherwise it is0. The squarefree divisor hypotheses prevent the zero Möbius ambiguity.
- `SieveBrun.brunCoefficients_support_lt` (relation): If all primes of P are <z≤y, y>1,β>1, every nonzero coefficient satisfies d<y.

**Unit tests.**

- `brun_no_primes`: P=1,y=2,β=2: both coefficients are 1 at d=1 and zero elsewhere.
- `brun_prefix_retained`: P=6,y=100,β=2: both coefficient lists at 1,2,3,6 are 1,−1,−1,1.
- `brun_lower_parity`: P=6,y=4,β=2,z=4: λ⁻(1)=1, λ⁻(2)=λ⁻(3)=−1, λ⁻(6)=0; its full divisor sum is −1.
- `brun_strict_boundary`: For P=2,β=2,y=8 the positive coefficient at 2 is zero: 2³=8 fails the strict prefix constraint.

**Acceptance.** For P=6,y=100,β=2, both systems retain d=1,2,3,6 and agree with μ on those divisors. For P=6,y=4,β=2,z=4, λ⁺ retains only 1 whereas λ⁻ retains 1,2,3; the first-order lower sum is negative on the two-prime obstruction.

**Source.** [KED-ANT-12](#source-ked-ant-12), §12.2 definition of D± and §12.3 parameter choice

<a id="SV-1-brun-divisor-brackets"></a>

### Brun pointwise divisor brackets

**Declaration:** `SieveBrun.brun_divisor_brackets`. **Kind:** theorem.

For the Brun construction and every r|P, Σ_{d|r}λ⁻(d) ≤ 1_{r=1} ≤ Σ_{d|r}λ⁺(d). Hence Σ_{d|P}λ⁻(d)A_d≤S≤Σ_{d|P}λ⁺(d)A_d for nonnegative sample weights.

**Hypotheses and conventions.** P squarefree,y>1,β>1; no distribution estimate is assumed.

**Prerequisites.** [Brun combinatorial coefficients](#SV-1-brun-coefficients); [Weighted divisibility interchange](#SV-0-weighted-divisor-interchange); [Lower sieve coefficient inequality](#SV-0-lower-sieve-sum).

**Proof route.** Use the decreasing-prime first-failure expansion of source Lemma 12.1 with the consistent strict prime cutoff and left-limit product at the last prime (E35), specialized to density one on the factors of r. Finite inclusion-exclusion leaves a sum of nonnegative first-failure contributions with the required parity sign. The combinatorial identity is polynomial and does not require the analytic strict-density hypothesis when specialized to one.

**Acceptance.** For r=1 both brackets equal one; for P=6,y=4,β=2 and r=6 the lower sum is −1, indicator zero and upper sum one.

**Source.** [KED-ANT-12](#source-ked-ant-12), Lemma 12.1, its specialization after the proof, and (12.2.1)–(12.2.2)

<a id="SV-1-brun-coefficient-bound"></a>

### Brun coefficient modulus bound

**Declaration:** `SieveBrun.abs_brunCoefficients_le_one`. **Kind:** lemma.

For every P,y,β,ε and d, |λ_ε(d)|≤1.

**Hypotheses and conventions.** The assertion is valid even outside the analytic parameter range: each coefficient is zero or the existing Möbius value.

**Prerequisites.** [Brun combinatorial coefficients](#SV-1-brun-coefficients); `ArithmeticFunction.abs_moebius_le_one` (Mathlib).

**Proof route.** Split by the explicit coefficient condition and apply the native Möbius modulus bound after casting to the reals.

**Acceptance.** No positivity of λ is claimed: selected one-prime divisors have coefficient −1.

**Source.** [KED-ANT-12](#source-ked-ant-12), §12.2 definition of λ± and error estimate

<a id="SV-1-brun-coefficient-support"></a>

### Strict Brun coefficient support

**Declaration:** `SieveBrun.brunCoefficients_support_lt`. **Kind:** lemma.

For squarefree P,y>1,β>1 and ε∈{0,1}, if every prime of P is <z≤y, then λ_ε(d)≠0 implies d<y.

**Hypotheses and conventions.** The single-prime lower-coefficient exception is controlled by p<z≤y. The unit needs y>1.

**Prerequisites.** [Brun combinatorial coefficients](#SV-1-brun-coefficients).

**Proof route.** For a nonempty decreasing list with last position of the required parity, its last prefix condition directly bounds the full product. Otherwise use the penultimate prefix condition and p_r<p_{r−1}≤p_{r−1}^β. Handle a one-prime lower list using the explicit prime cutoff; handle the empty list by y>1.

**Acceptance.** The result is a strict d<y bound; a large single prime in λ⁻ without the prime cutoff would be a counterexample.

**Source.** [KED-ANT-12](#source-ked-ant-12), §12.3, support exception for single primes in D−

<a id="SV-1-brun-main-term-bounds"></a>

### Dimension-controlled Brun main terms

**Declaration:** `SieveBrun.brun_main_term_bounds`. **Kind:** theorem.

Let κ>0,K>1, β=9κ+1, u≥β,y>1,z=y^(1/u), all primes of P satisfy p<z, and g(p)=ν(p) on P and zero off P. Under HasProductSieveDimension(P,g,κ,K), with V=∏_{p|P}(1−ν(p)) and δ=exp(β−u)K^10, (1−δ)V ≤ mainSum(λ⁻) ≤ V ≤ mainSum(λ⁺) ≤ (1+δ)V.

**Hypotheses and conventions.** P in the dimension predicate means the set of its prime factors. Strict prime-density bounds are supplied by BoundingSieve. The displayed non-strict inequalities include every degenerate empty-prime case.

**Prerequisites.** [Brun combinatorial coefficients](#SV-1-brun-coefficients); [Euler-product sieve dimension](#SV-0-product-sieve-dimension); `BoundingSieve` (Mathlib); `BoundingSieve.mainSum` (Mathlib).

**Proof route.** Use the finite first-failure expansion with strict prime cutoffs and the last-prime left-limit product (E35): V⁺−V is the sum of odd-length failure masses, and V−V⁻ the sum of even-length failure masses. Each summand is nonnegative.

**Acceptance.** δ may exceed one; then the lower bound can be negative and asserts no positive prime lower bound. Empty P gives V⁺=V⁻=V=1.

**Source.** [KED-ANT-12](#source-ked-ant-12), §12.4 and Theorem 12.2, first two displays

<a id="SV-1-brun-fundamental-estimate"></a>

### Brun fundamental sieve estimate

**Declaration:** `SieveBrun.brun_fundamental_estimate`. **Kind:** theorem.

Under the Brun main-term hypotheses and X≥0, (1−δ)V X−remainderMass(s,y) ≤ S ≤ (1+δ)V X+remainderMass(s,y), where β=9κ+1,u≥β,z=y^(1/u), δ=exp(β−u)K^10.

**Hypotheses and conventions.** This is the proved parameter range of this elementary combinatorial sieve. It is not a sharp beta-sieve theorem, a parity-breaking input or a Chen theorem.

**Prerequisites.** [Dimension-controlled Brun main terms](#SV-1-brun-main-term-bounds); [Brun pointwise divisor brackets](#SV-1-brun-divisor-brackets); [Coefficient error controlled by remainder mass](#SV-0-coefficient-error-remainder-mass); [Brun coefficient modulus bound](#SV-1-brun-coefficient-bound); [Strict Brun coefficient support](#SV-1-brun-coefficient-support); `BoundingSieve.multSum_eq_main_err` (Mathlib).

**Proof route.** Expand A_d=ν(d)X+R_d in both weighted brackets. The promoted modulus and support lemmas give |λ±|≤1 and support d<y. Apply the promoted remainder-mass error lemma, then multiply the main-term inequalities by nonnegative X.

**Acceptance.** The range u≥9κ+1 and positivity of X are explicit. A positive sifted lower bound requires both δ<1 and a sufficiently small actual remainder mass.

**Source.** [KED-ANT-12](#source-ked-ant-12), Theorem 12.2, consequence display

<a id="SV-1-selberg-optimal-weights"></a>

### Selberg optimal weights

**Declaration:** `SieveSelberg.optimalWeight`. **Kind:** construction.

For a native BoundingSieve s and real z>1, put G(s,z)=Σ_{d|P,d<z} s.selbergTerms(d). Define λ_z(d)=μ(d)/(ν(d)G(s,z)) times Σ_{l|P,d|l,l<z} s.selbergTerms(l) for d|P and d<z, and zero otherwise. Then G>0, λ_z(1)=1 and |λ_z(d)|≤1 on divisors of P. The native quadratic form has minimum 1/G among all weights supported on d<z and normalized at 1.

**Hypotheses and conventions.** P is the native squarefree prodPrimes and 0<ν(p)<1 on its prime factors. The cutoff is strict d<z. z>1 is essential: at z=1 the d=1 term is absent. Optimization concerns the main term, not the absolute remainder; the latter remains separate.

**Prerequisites.** `BoundingSieve.selbergTerms` (Mathlib); `BoundingSieve.mainSum_lambdaSquared_eq_sum_mul_sum_sq` (Mathlib); `BoundingSieve.lambdaSquared` (Mathlib); `ArithmeticFunction.moebius` (Mathlib).

**Proof route.** Use the native diagonalization, rather than introducing a second quadratic form.

**API.**

- `SieveSelberg.diagonalMass` (data): G(s,z), using the strict divisor cutoff.
- `SieveSelberg.optimalWeight_one` (simp): For z>1, λ_z(1)=1.
- `SieveSelberg.optimalWeight_eq_zero` (simp): λ_z(d)=0 if d does not divide P or d≥z.
- `SieveSelberg.abs_optimalWeight_le_one` (relation): For z>1 and d|P, |λ_z(d)|≤1.
- `SieveSelberg.optimalWeight_mainSum` (compatibility): s.mainSum(s.lambdaSquared λ_z)=1/G(s,z).
- `SieveSelberg.optimalWeight_minimizes` (universal-property): Every normalized weight w vanishing for d≥z satisfies 1/G≤s.mainSum(s.lambdaSquared w).

**Unit tests.**

- `optimizer_empty_primes`: For P=1 and z>1, G=1 and λ is the indicator of d=1.
- `optimizer_strict_cutoff`: For P=2, ν(2)=1/2 and z=2, G=1 and λ(2)=0.
- `optimizer_one_prime`: For P=2, ν(2)=1/2 and z=3, G=2, λ(2)=−1 and the main sum is 1/2.
- `optimizer_two_primes`: For P=6, ν(2)=1/2, ν(3)=1/3 and z=4, G=5/2, λ(2)=−4/5, λ(3)=−3/5 and λ(6)=0.

**Source.** [HB-SIEVES](#source-hb-sieves), §2, Lemma 2.1 and equations (2.5)–(2.10), pp.8–11

<a id="SV-1-selberg-upper-bound"></a>

### Selberg upper-bound sieve

**Declaration:** `SieveSelberg.selberg_upper_bound`. **Kind:** theorem.

For z>1, S(s)≤X/G(s,z)+Σ_{d|P,d<z²}3^{ω(d)}|r_d|, where ω is Mathlib cardDistinctFactors. More precisely S≤X/G+errSum(lambdaSquared λ_z); the displayed absolute-error bound follows from |λ_z|≤1 and the count of ordered squarefree divisor pairs with lcm d.

**Hypotheses and conventions.** The native weights are nonnegative; X is totalMass and r_d is the native rem, including d=1. No estimate of the remainder sum is assumed or inferred from the cutoff.

**Prerequisites.** [Selberg optimal weights](#SV-1-selberg-optimal-weights); `BoundingSieve.siftedSum_le_mainSum_errSum_of_upperMoebius` (Mathlib); `ArithmeticFunction.cardDistinctFactors` (Mathlib).

**Proof route.** Apply the native upper-Möbius theorem to λ_z(1)=1.

**Source.** [HB-SIEVES](#source-hb-sieves), §2, Theorem 2.1, pp.10–12

<a id="SV-1-binary-euler-denominator"></a>

### Binary sieve Euler denominator

**Declaration:** `SieveBinary.binary_euler_denominator`. **Kind:** theorem.

For each integer degree bound d≥1 there is c_d>0 such that a nonnegative multiplicative g with 0≤g(p)≤d satisfies Σ_{n≤z} μ(n)²g(n)/n≥c_d ∏_{d<p≤z}(1−g(p)/p)⁻¹ for z>1. The source starts with arbitrary real d>0; the integer version suffices for polynomial degree.

**Hypotheses and conventions.** Native multiplicative arithmetic function; nonnegative; prime values bounded by d; z>1.

**Prerequisites.** [Binary polynomial local densities](#SV-0-binary-local-densities); [Binary Schwartz–Zippel specialization](#SV-0-binary-schwartz-zippel); `AnalyticNumberTheory:AN.2`.

**Proof route.** Extend g’s prime values completely multiplicatively and compare with h(p)=d−g(p). Their squarefree Dirichlet convolution is d^ω.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Lemma 9.8 and equations (35)–(37), pp.223–224

**Open proof inputs.** [Uniform binary Euler and smooth-factor estimates](#g-binary-averages).

<a id="SV-1-binary-euler-cutoff-comparison"></a>

### Binary sieve cutoff comparison

**Declaration:** `SieveBinary.binary_euler_cutoff_comparison`. **Kind:** theorem.

For a polynomial of degree d≥1, z≥2 and s≥1, with content primes omitted on both sides, ∏_{d<p<z^(1/s)}(1−ρ_Q(p)/p²)≤C_d s^d ∏_{d<p<z}(1−ρ_Q(p)/p²). Constants depend only on d. Requiring s≥1 removes the false vanishing right side as s tends to zero.

**Hypotheses and conventions.** s≥1; z≥2; nonzero reduction at every included prime.

**Prerequisites.** [Binary polynomial local densities](#SV-0-binary-local-densities); [Binary Schwartz–Zippel specialization](#SV-0-binary-schwartz-zippel); `AnalyticNumberTheory:AN.2`.

**Proof route.** Use Schwartz–Zippel to bound the local factors and a uniform Mertens estimate between the two cutoffs. Bound primes in the fixed small range separately.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Lemma 9.11, p.225

**Open proof inputs.** [Uniform binary Euler and smooth-factor estimates](#g-binary-averages).

<a id="SV-1-binary-power-level-sieve"></a>

### Binary polynomial sieve at power level

**Declaration:** `SieveBinary.binary_power_level_sieve`. **Kind:** theorem.

If A≥1, R^θ≤A^(1−η), 0<η<1/2, θ∈(0,2], and 1≤z≤A^ς for fixed ς>0, the positive-value rough-point count is ≤C A∏_{deg Q<p<z}(1−ρ_Q(p)/p²), with C depending only on degree,C_l,η,ς. Content primes below z give an empty sifted set.

**Hypotheses and conventions.** L(C_l,θ) domain; polynomial nonzero; η∈(0,1/2); ς>0; positive Q-values.

**Prerequisites.** [Binary-form large sieve on convex domains](#SV-2-binary-convex-large-sieve); [Binary sieve cutoff comparison](#SV-1-binary-euler-cutoff-comparison); `GeometryOfNumbersAndQuadraticArithmetic:GN.4`.

**Proof route.** Apply the safe-cutoff large sieve at z₀=min(z,A^(η/5)); since η<1/2 this also satisfies z₀≤A^(1/4).

**Source.** [KHAYUTIN-19](#source-khayutin-19), Lemma 9.12, pp.225–226

**Open proof inputs.** [Curvature-uniform lattice discrepancy](#g-domain).

<a id="SV-1-binary-divisibility-sieve"></a>

### Binary sieve with divisibility conditions

**Declaration:** `SieveBinary.binary_divisibility_sieve`. **Kind:** theorem.

For A≥1, R^θ≤A^(1−3η), η∈(0,1/2), θ∈(0,2], a≥1 with a≤A^η, and 1≤z≤A^ς, the count of points with a|Q, gcd(a,Q/a)=1 and Q/a positive and z-rough is at most C Aρ̃_Q(a)/a² times ∏_{deg Q<p<z,p∤a}(1−ρ_Q(p)/p²). Without the gcd condition use ordinary ρ_Q(a).

**Hypotheses and conventions.** L-domain as above; positive quotient; integer a≥1; fixed ς>0.

**Prerequisites.** [Curve lifting and singular correction](#SV-0-curve-lifting-correction); [Binary polynomial sieve at power level](#SV-1-binary-power-level-sieve); `GeometryOfNumbersAndQuadraticArithmetic:GN.4`.

**Proof route.** Split into the zero residue classes modulo a and rescale the domain by a.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Lemma 9.13 and Corollary 9.14, pp.226–227

<a id="SV-1-multiplicative-decoupling"></a>

### Multiplicative decoupling inequality

**Declaration:** `SieveBinary.multiplicative_decoupling`. **Kind:** theorem.

For nonnegative multiplicative native arithmetic functions g,ψ, h=ζ*ψ, integer Z≥1 and prime-power tails Σ_{j≥v}g(p^j) summable, Σ_{a≤Z}g(a)h(a)≤Σ_{a≤Z}g(a)·∏_{p≤Z}[1+Σ_{1≤v≤floor(log Z/log p)}ψ(p^v)Σ_{j≥v}g(p^j)]. A finite-tail version with the full admissible exponent cutoff avoids unnecessary convergence assumptions.

**Hypotheses and conventions.** Nonnegative multiplicative functions; positive Z; summability required for real infinite sums.

**Prerequisites.** `ArithmeticFunction.IsMultiplicative` (Mathlib); `ArithmeticFunction.zeta` (Mathlib); `ArithmeticFunction.coe_zeta_mul_apply` (Mathlib).

**Proof route.** Expand the native divisor convolution. Write the cofactor as a part supported on primes of the divisor and a coprime part.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Lemma 9.18 and Remark 9.19, p.228

<a id="SV-1-binary-theta-average"></a>

### Average absorption of the density correction

**Declaration:** `SieveBinary.binary_theta_average`. **Kind:** theorem.

Assume ρ̃_Q(p^k)≤C p^{k(2−r)}, C>0,0<r≤1, and a nonnegative multiplicative f with f(n)≤B n^ε for n>0, B>0,0<ε<r. Then Σ_{a≤z} f(a)ρ̃_Q(a)θ_Q(a)/a²≤C′Σ_{a≤z}f(a)ρ̃_Q(a)/a² for every z≥1, with C′ depending only on degree,B,C,r,ε.

**Hypotheses and conventions.** Positive arguments; corrected local bound on every prime power.

**Prerequisites.** [Binary density correction factor](#SV-0-binary-density-correction-factor); [Multiplicative decoupling inequality](#SV-1-multiplicative-decoupling); [Binary Schwartz–Zippel specialization](#SV-0-binary-schwartz-zippel); `AnalyticNumberTheory:AN.2`.

**Proof route.** Apply decoupling with g=fρ̃/a² and ψ=λ_Q.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Lemma 9.20, p.229

**Open proof inputs.** [Uniform binary Euler and smooth-factor estimates](#g-binary-averages).

<a id="SV-1-binary-smooth-large-factor-average"></a>

### Large smooth-factor saving

**Declaration:** `SieveBinary.binary_smooth_large_factor_average`. **Kind:** theorem.

Under M(A,B,ε), the corrected density power bound C,r with 0<ε<r, α,s,κ>0,z>1 and κ≤(r−ε)log z/(2s), the sum of f(a)ρ̃_Q(a)/a² over z^α≤a≤z with every prime divisor≤z^(1/s) is ≤C′ exp(−sακ)Σ_{a≤z}f(a)ρ̃_Q(a)/a², with C′ depending only on κ,A,B,ε,C,r,degree.

**Hypotheses and conventions.** All displayed positive parameters and their inequality.

**Prerequisites.** [Multiplicative sieve growth class](#SV-0-multiplicative-growth-class); [Multiplicative decoupling inequality](#SV-1-multiplicative-decoupling).

**Proof route.** Use Rankin’s trick with β=κs/log z, then decouple the multiplicative tilt n^β.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Lemma 9.21 and equations (41)–(44), pp.229–231

**Open proof inputs.** [Uniform binary Euler and smooth-factor estimates](#g-binary-averages).

<a id="SV-1-binary-extremely-smooth-average"></a>

### Extremely smooth-factor saving

**Declaration:** `SieveBinary.binary_extremely_smooth_average`. **Kind:** theorem.

For ρ̃_Q(p^k)≤C p^{k(2−r)}, C>0,0<r≤1, α∈[0,1],β>0, and z≥3, Σ_{z^α≤a≤z, P⁺(a)≤log z·log log z}ρ̃_Q(a)/a²≤C′ z^(−rα+β). Here P⁺(1)=1 and zero is excluded.

**Hypotheses and conventions.** z≥3; positive a; α∈[0,1]; β>0.

**Prerequisites.** [Binary polynomial local densities](#SV-0-binary-local-densities); `AnalyticNumberTheory:AN.5`.

**Proof route.** Bound corrected density by C^ω(a)a^(2−r), then use the requested uniform smooth-number count.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Lemma 9.23, p.231

**Open proof inputs.** [Uniform binary Euler and smooth-factor estimates](#g-binary-averages).

<a id="SV-1-binary-multiplicative-sieve"></a>

### Binary multiplicative-function sieve

**Declaration:** `SieveBinary.binary_multiplicative_sieve`. **Kind:** theorem.

For a domain in L(C_l,θ), A≥1,R^θ≤A^(1−3η), η∈(0,1/2), θ∈(0,2], positive polynomial values ≤X≤A^δ with X≥1,δ>0, corrected densities ρ̃_Q(p^k)≤C p^{k(2−r)},C>0,0<r≤1, and f∈M(A_f,B,ε) with 0<ε<min(r,ηr/(4δ)), the sum of f(Q) over integer points is ≤C′ A∏_{deg Q<p≤X,p not content}(1−ρ_Q(p)/p²)Σ_{a≤X}f(a)ρ̃_Q(a)/a². C′ depends only on the listed fixed parameters and degree.

**Hypotheses and conventions.** Positive Q-values explicitly required because f is defined on naturals; every analytic parameter and bound shown above.

**Prerequisites.** [Binary sieve with divisibility conditions](#SV-1-binary-divisibility-sieve); [Average absorption of the density correction](#SV-1-binary-theta-average); [Large smooth-factor saving](#SV-1-binary-smooth-large-factor-average); [Extremely smooth-factor saving](#SV-1-binary-extremely-smooth-average); [Binary sieve cutoff comparison](#SV-1-binary-euler-cutoff-comparison); `GeometryOfNumbersAndQuadraticArithmetic:GN.4`.

**Proof route.** Split each value at the longest increasing-prime-power prefix below A^η, keeping the coprime factorization.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Theorem 9.7, pp.222–223; proof §9.6, pp.231–235

**Open proof inputs.** [Curvature-uniform lattice discrepancy](#g-domain), [Ordinary-density input in the binary main sieve](#g-binary-r2).

<a id="SV-1-binary-homogeneous-congruence-sieve"></a>

### Binary sieve with a fixed divisor

**Declaration:** `SieveBinary.binary_homogeneous_congruence_sieve`. **Kind:** theorem.

For k₀≥1, the binary multiplicative sieve bounds Σ_{k₀|Q}f(Q/k₀) by C′A times the Euler product over deg Q<p≤X/k₀ excluding content primes and p|k₀, times Σ_{a≤X/k₀} f(a)ρ̃_Q(k₀a)/(k₀a)². Require the rescaled curvature inequality (R/k₀)^θ≤(A/k₀²)^(1−3η), X≤A^δ k₀^(1−2δ), positive quotients, and the same fixed parameters. Constants are independent of k₀.

**Hypotheses and conventions.** All main-sieve hypotheses; k₀≥1; strengthened rescaled hypotheses displayed.

**Prerequisites.** [Binary multiplicative-function sieve](#SV-1-binary-multiplicative-sieve); [Curve lifting and singular correction](#SV-0-curve-lifting-correction); `GeometryOfNumbersAndQuadraticArithmetic:GN.4`.

**Proof route.** Split the zero residue classes modulo k₀ and apply the main theorem to each quotient polynomial and rescaled domain.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Proposition 9.25 and proof (50), pp.235–236

**Open proof inputs.** [Ordinary-density input in the binary main sieve](#g-binary-r2), [Corrected congruence transport for the binary sieve](#g-binary-congruence).

<a id="SV-1-binary-inhomogeneous-congruence-sieve"></a>

### Binary sieve with a unit congruence

**Declaration:** `SieveBinary.binary_inhomogeneous_congruence_sieve`. **Kind:** theorem.

For k₀,k₁,k₂≥1, prime support(k₁)⊆prime support(k₂), gcd(k₀,k₂)=1, k₀k₁k₂≤A^(η/2), ℓ a unit modulo k₂, R^θ≤A^(1−4η), X≤A^(δ/2), the sum of f(Q/k₀) restricted by Q≡k₀k₁ℓ mod k₀k₁k₂ is bounded by C′A f(k₁)ρ_Q(k₀k₁ℓ;k₁k₂)/(k₁k₂)² times the Euler product to X/(k₀k₁) excluding content primes and p|k₀k₂, times Σ_{a≤X/(k₀k₁),gcd(a,k₂)=1} f(a)ρ̃_Q(k₀a)/(k₀a)². Here ρ_Q(t;k)=ρ_{Q−t}(k).

**Hypotheses and conventions.** All main-sieve hypotheses and displayed strengthened restrictions; positive quotient values.

**Prerequisites.** [Binary sieve with a fixed divisor](#SV-1-binary-homogeneous-congruence-sieve); [Binary polynomial local densities](#SV-0-binary-local-densities); `GeometryOfNumbersAndQuadraticArithmetic:GN.4`.

**Proof route.** The correct residue target modulo k₁k₂ is k₀k₁ℓ, obtained by reducing the original congruence; the paper omits k₀ in that factor.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Definition 9.24 and Proposition 9.26, pp.235–237

**Open proof inputs.** [Ordinary-density input in the binary main sieve](#g-binary-r2), [Corrected congruence transport for the binary sieve](#g-binary-congruence).

<a id="SV-1-polynomial-bonferroni"></a>

### Polynomial Bonferroni brackets

**Declaration:** `SievePolynomialVector.polynomial_bonferroni`. **Kind:** theorem.

For a finite candidate set I and the subset B of candidates dividing the quotient, the alternating sum over subsets G⊆B of size≤2v−1 is ≤1_(B empty), and the sum through 2v is ≥ that indicator. The upper bracket is nonnegative, so its componentwise product is valid.

**Hypotheses and conventions.** Finite sets; v≥1 for the lower odd bracket; v=0 upper bracket equals one.

**Prerequisites.** [Polynomial-vector sieve data](#SV-0-polynomial-vector-sieve-data); `Finset` (Mathlib).

**Proof route.** Apply the finite binomial alternating-sum identity to |B|. The subsets select distinct irreducibles; do not count ordered tuples.

**Source.** [BSKK-23](#source-bskk-23), Equations (8.1)–(8.3), pp.39–40

<a id="SV-1-polynomial-brun-arbitrary-law"></a>

### Brun sieve for polynomial vectors

**Declaration:** `SievePolynomialVector.polynomial_brun_arbitrary_law`. **Kind:** theorem.

For r prime labels, arbitrary joint law on monic degree-n components, monic D_i, finite monic irreducible sets I_i of degrees≤ℓ_i with ℓ_i≥11, Pr(E_(D,I))≤2^r/||D||·∏i∏J∈I_i(1−p_i^(−deg J))+Σ_G|Pr(DG|A)−1/||DG|||. G_i runs over products of distinct J∈I_i with ω(G_i)≤6logℓ_i; hence deg G_i≤6ℓ_i logℓ_i. Independence is not required.

**Hypotheses and conventions.** ℓ_i≥11; finite candidate sets; prime labels; normalized probability law.

**Prerequisites.** [Polynomial Bonferroni brackets](#SV-1-polynomial-bonferroni); [Polynomial-vector sieve data](#SV-0-polynomial-vector-sieve-data); `FiniteFieldsAndCharacterSums:FF.1`.

**Proof route.** Choose v_i=ceil(3/2+2logℓ_i), so 2v_i≤6logℓ_i. Take expectation of the product of nonnegative upper brackets.

**Source.** [BSKK-23](#source-bskk-23), Lemma 8.2 and equations (8.4)–(8.7), pp.39–41

**Open proof inputs.** [Polynomial Brun uniform law estimates](#g-polynomial-brun).

<a id="SV-1-polynomial-euler-excluding-variable"></a>

### Polynomial Euler product excluding T

**Declaration:** `SievePolynomialVector.polynomial_euler_excluding_variable`. **Kind:** theorem.

For a prime p and integer m≥0, let I be every monic irreducible of degree≤m except T. Then ∏J∈I(1−p^(−deg J))≤2/(m+1). At m=0 the product is empty and equals one. Omitting an arbitrary further set does not preserve this bound.

**Hypotheses and conventions.** All irreducibles in the stated degree range, with T the only excluded one.

**Prerequisites.** [Polynomial-vector sieve data](#SV-0-polynomial-vector-sieve-data); `FiniteFieldsAndCharacterSums:FF.1`.

**Proof route.** Expand the reciprocal Euler product over monic m-smooth polynomials and retain all monics of degrees0,…,m. Their exact number is p^j.

**Source.** [BSKK-23](#source-bskk-23), Lemma 8.3, pp.41–42

**Open proof inputs.** [Polynomial Brun uniform law estimates](#g-polynomial-brun).

<a id="SV-1-selberg-prime-interval"></a>

### Prime upper bound in intervals

**Declaration:** `SieveApplications.prime_interval_upper`. **Kind:** theorem.

For real x,y≥2, π(x+y)−π(x)≤2y/log y+C y loglog(3y)/(log y)² with an absolute C. The cutoff sieves consecutive integers; primes below it contribute O(z).

**Hypotheses and conventions.** x,y≥2; constants independent of x.

**Prerequisites.** [Selberg upper-bound sieve](#SV-1-selberg-upper-bound); `AnalyticNumberTheory:AN.2`.

**Proof route.** Use density 1/p and interval remainder≤1. Choose z≈sqrt(y)/(log y)²; the native Selberg quadratic main term is optimized before estimating its denominator.

**Source.** [HB-SIEVES](#source-hb-sieves), Corollary 3.1, p.18

**Open proof inputs.** [Uniform Selberg denominator asymptotics](#g-selberg-denominator).

<a id="SV-1-selberg-progression-upper"></a>

### Prime upper bound in progressions

**Declaration:** `SieveApplications.progression_upper`. **Kind:** theorem.

There is an absolute C such that for k≥1, gcd(a,k)=1 and x≥4k, π(x;k,a)≤C x/[φ(k)log(x/k)]. Retaining C=4 requires the precise denominator estimate in the source; this target uses an unspecified absolute constant.

**Hypotheses and conventions.** x≥4k; reduced residue class.

**Prerequisites.** [Selberg upper-bound sieve](#SV-1-selberg-upper-bound); `AnalyticNumberTheory:AN.2`.

**Proof route.** Sieve the progression using primes not dividing k. The interval length is x/k; the local density is 1/p off k and zero at its prime divisors.

**Source.** [HB-SIEVES](#source-hb-sieves), Corollary 3.2, pp.18–19

**Open proof inputs.** [Uniform Selberg denominator asymptotics](#g-selberg-denominator).

<a id="SV-1-selberg-twin-goldbach-upper"></a>

### Selberg bounds for twin primes and Goldbach

**Declaration:** `SieveApplications.twin_goldbach_upper`. **Kind:** theorem.

For x≥3 the number of p≤x with p,p+2 prime is O(x/log²x). For even N≥4 the number of p with p,N−p prime is O(C₂·∏_(odd p|N)(p−1)/(p−2)·N/log²N), where C₂=∏_(p>2)(1−1/(p−1)²). The prime-two local factor is handled separately.

**Hypotheses and conventions.** Even N in the Goldbach bound; all constants absolute.

**Prerequisites.** [Selberg upper-bound sieve](#SV-1-selberg-upper-bound); `AnalyticNumberTheory:AN.2`.

**Proof route.** Use the union of the two forbidden residues at each odd prime. At divisors of N the two residues coincide. At two choose the surviving odd class before forming the product.

**Source.** [HB-SIEVES](#source-hb-sieves), Corollaries 3.3–3.4, pp.19–21

**Open proof inputs.** [Uniform Selberg denominator asymptotics](#g-selberg-denominator).

<a id="SV-1-brun-twin-reciprocals"></a>

### Brun reciprocal convergence

**Declaration:** `SieveApplications.brun_reciprocals`. **Kind:** theorem.

The sum of 1/p over primes p for which p+2 is prime converges, as does the sum including 1/(p+2).

**Hypotheses and conventions.** Twin-prime index set; positive terms.

**Prerequisites.** [Selberg bounds for twin primes and Goldbach](#SV-1-selberg-twin-goldbach-upper).

**Proof route.** Partial summation of the counting upper bound O(x/log²x) gives a convergent tail integral. The finitely many small primes have finite mass.

**Source.** [HB-SIEVES](#source-hb-sieves), Corollary 3.3 and discussion of Brun’s theorem, p.20

<a id="SV-1-selberg-dimension-kappa"></a>

### Selberg denominator in dimension κ

**Declaration:** `SieveApplications.selberg_dimension_kappa`. **Kind:** theorem.

Let g be nonnegative multiplicative, supported on squarefree integers, with g(p)<1, Σ_(p≤x)g(p)log p=κlog x+O(1), κ>0, and Σ_p g(p)²log p<∞. Then Σ_(d<z)∏_(p|d)g(p)/(1−g(p))∼(log z)^κ/[Γ(κ+1)H_g], where H_g=∏p(1−g(p))(1−1/p)^(-κ). The limit product is positive under the stated hypotheses.

**Hypotheses and conventions.** κ>0; both prime-sum hypotheses; strict d<z.

**Prerequisites.** [Selberg optimal weights](#SV-1-selberg-optimal-weights); `AnalyticNumberTheory:AN.2`.

**Proof route.** Import a precisely normalized Wirsing/Levin–Fainleib mean-value theorem from the analytic owner; apply it to g/(1−g) on squarefree integers.

**Source.** [KED-ANT-14](#source-ked-ant-14), §14.1–14.3, Theorems 14.1–14.2

**Open proof inputs.** [Uniform Selberg denominator asymptotics](#g-selberg-denominator).

<a id="SV-1-parity-witness"></a>

### Selberg parity sequences

**Declaration:** `SieveApplications.parityWeight`. **Kind:** definition.

For n>0 put a_odd(n)=(1−(-1)^Ω(n))/2 and a_even(n)=(1+(-1)^Ω(n))/2, with both weights zero at n=0. Here Ω counts prime factors with multiplicity. Their divisor sums have the same main term x/(2d), and remainders differing by the Liouville partial sum. At z>sqrt(x), the even sequence has only the survivor1 and the odd sequence the primes≥z.

**Hypotheses and conventions.** Positive integer support n≤x; all small primes sieved.

**Prerequisites.** `ArithmeticFunction.cardFactors` (Mathlib); `ArithmeticFunction.liouville` (Mathlib).

**Proof route.** Use native arithmetic functions, not a new factor-count convention. Exact divisor counts use complete multiplicativity of Liouville and the floor discrepancy.

**API.**

- `SieveApplications.parityWeight` (constructor): The displayed zero-at-zero weights, true for odd parity.
- `SieveApplications.parityWeight_zero` (simp): Both weights vanish at zero.
- `SieveApplications.parityWeight_complement` (relation): For n>0 the two weights sum to one.
- `SieveApplications.parityWeight_range` (relation): Each weight is zero or one.
- `SieveApplications.parity_divisor_sum` (characterisation): The exact floor/Liouville divisor-count identity.
- `SieveApplications.parity_rough_survivors` (characterisation): Above sqrt(x), the even survivor is1 and the odd survivors are primes≥z.

**Unit tests.**

- `parity_one`: 1 has even weight1 and odd weight0.
- `parity_square`: 4 is even parity, although it has only one distinct prime.
- `parity_three_factors`: 12 has odd weight1 since Ω(12)=3.
- `parity_zero`: Zero has neither weight1.

**Source.** [HB-SIEVES](#source-hb-sieves), §4, pp.22–24, equations (4.1)–(4.2)

## SV.2 — Large sieve and bilinear sums

The additive and primitive-character large sieves have both the elementary inherited constant and separate sharp targets. Quadratic/Jutila character estimates are distinct families. Vaughan’s identity is an exact native arithmetic-function identity before any analytic estimate is applied.

<a id="SV-2-gram-row-zero"></a>

### Vanishing Gram row detects the zero vector

**Declaration:** `SieveGram.gramRow_eq_zero_iff`. **Kind:** lemma.

For each i∈I, rᵢ=0 if and only if yᵢ=0.

**Hypotheses and conventions.** 𝕜 is ℝ or ℂ, represented by the existing RCLike structure; E is a normed inner-product space over 𝕜. Completeness and finite dimensionality are not assumed. I is a finite indexing type, possibly empty unless stated otherwise; y:I→E is an arbitrary indexed family. Repetitions, zero vectors and linear dependence are allowed. Use Mathlib's inner product, conjugate-linear in the first argument. Write Gᵢⱼ=⟨yᵢ,yⱼ⟩ and rᵢ=Σⱼ|Gᵢⱼ|. This is the existing Matrix.gram and an ordinary finite real sum, not a new carrier. Real division by zero is zero.

**Prerequisites.** `Matrix.gram` (Mathlib); `Matrix.gram_apply` (Mathlib); `inner_self_eq_zero` (Mathlib).

**Proof route.** Each summand defining rᵢ is nonnegative. The diagonal term |⟨yᵢ,yᵢ⟩| is at most rᵢ by finite-sum monotonicity.

**Acceptance.** A family containing a zero vector has a zero row without making any other denominator invalid.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.402, Proposition 1, denominator in the statement

<a id="SV-2-gram-row-quadratic"></a>

### Gram-row bound for a finite linear combination

**Declaration:** `SieveGram.norm_sum_smul_sq_le_gramRows`. **Kind:** lemma.

For every scalar family c:I→𝕜, ‖Σᵢcᵢyᵢ‖² ≤ Σᵢ|cᵢ|²rᵢ.

**Hypotheses and conventions.** 𝕜 is ℝ or ℂ, represented by the existing RCLike structure; E is a normed inner-product space over 𝕜. Completeness and finite dimensionality are not assumed. I is a finite indexing type, possibly empty unless stated otherwise; y:I→E is an arbitrary indexed family. Repetitions, zero vectors and linear dependence are allowed. Use Mathlib's inner product, conjugate-linear in the first argument. Write Gᵢⱼ=⟨yᵢ,yⱼ⟩ and rᵢ=Σⱼ|Gᵢⱼ|. This is the existing Matrix.gram and an ordinary finite real sum, not a new carrier. Real division by zero is zero.

**Prerequisites.** `InnerProductSpace` (Mathlib); `Matrix.star_dotProduct_gram_mulVec` (Mathlib); `sum_inner` (Mathlib); `inner_sum` (Mathlib); `inner_smul_left` (Mathlib); `inner_smul_right` (Mathlib); `norm_inner_symm` (Mathlib); `RCLike.re_le_norm` (Mathlib).

**Proof route.** Expand the squared norm as the real part of Σᵢⱼ conjugate(cᵢ)cⱼGᵢⱼ, using the existing Gram quadratic identity, or its finite inner-product sum laws.

**Acceptance.** The empty family gives 0≤0.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.402, equation (4) in the proof of Proposition 1

<a id="SV-2-selberg-defect"></a>

### Selberg's normalized projection defect bound

**Declaration:** `SieveGram.selberg_defect_le`. **Kind:** lemma.

Set cᵢ=⟨yᵢ,x⟩/rᵢ, casting the real denominator to 𝕜. Then ‖x−Σᵢcᵢyᵢ‖² ≤ ‖x‖²−Σᵢ|⟨x,yᵢ⟩|²/rᵢ.

**Hypotheses and conventions.** 𝕜 is ℝ or ℂ, represented by the existing RCLike structure; E is a normed inner-product space over 𝕜. Completeness and finite dimensionality are not assumed. I is a finite indexing type, possibly empty unless stated otherwise; y:I→E is an arbitrary indexed family. Repetitions, zero vectors and linear dependence are allowed. Use Mathlib's inner product, conjugate-linear in the first argument. Write Gᵢⱼ=⟨yᵢ,yⱼ⟩ and rᵢ=Σⱼ|Gᵢⱼ|. This is the existing Matrix.gram and an ordinary finite real sum, not a new carrier. Real division by zero is zero. x is any vector of E.

**Prerequisites.** [Gram-row bound for a finite linear combination](#SV-2-gram-row-quadratic); `norm_sub_sq` (Mathlib); `inner_sum` (Mathlib); `inner_smul_right` (Mathlib); `inner_conj_symm` (Mathlib); `norm_inner_symm` (Mathlib); `RCLike.mul_conj` (Mathlib); `RCLike.norm_ofReal` (Mathlib); `RCLike.div_re_ofReal` (Mathlib).

**Proof route.** Use the existing norm_sub_sq expansion with the finite linear combination. Apply gram-row-quadratic to its squared norm.

**Acceptance.** For x=1 and y=i in ℂ the coefficient is −i, and its multiple of y is 1. The opposite convention gives −1 and does not prove the defect estimate.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.402, equation (3), equation (4), and coefficient choice immediately after (4)

<a id="SV-2-selberg-weighted-inner"></a>

### Selberg's weighted inner-product inequality

**Declaration:** `SieveGram.selberg_weighted_inner`. **Kind:** theorem.

Σᵢ |⟨x,yᵢ⟩|²/rᵢ ≤ ‖x‖².

**Hypotheses and conventions.** 𝕜 is ℝ or ℂ, represented by the existing RCLike structure; E is a normed inner-product space over 𝕜. Completeness and finite dimensionality are not assumed. I is a finite indexing type, possibly empty unless stated otherwise; y:I→E is an arbitrary indexed family. Repetitions, zero vectors and linear dependence are allowed. Use Mathlib's inner product, conjugate-linear in the first argument. Write Gᵢⱼ=⟨yᵢ,yⱼ⟩ and rᵢ=Σⱼ|Gᵢⱼ|. This is the existing Matrix.gram and an ordinary finite real sum, not a new carrier. Real division by zero is zero. x is any vector of E; zero rows contribute zero.

**Prerequisites.** [Selberg's normalized projection defect bound](#SV-2-selberg-defect).

**Proof route.** The left-hand squared norm in selberg-defect is nonnegative. Move the weighted sum to the other side.

**Acceptance.** An empty or all-zero family has weighted sum zero.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.402, Proposition 1 (statement and complete proof)

<a id="SV-2-bombieri-row-bound"></a>

### Inner-product bound from a uniform Gram row estimate

**Declaration:** `SieveGram.bombieri_of_gramRow_le`. **Kind:** lemma.

If B≥0 and rᵢ≤B for every i, then Σᵢ|⟨x,yᵢ⟩|² ≤ ‖x‖²B.

**Hypotheses and conventions.** 𝕜 is ℝ or ℂ, represented by the existing RCLike structure; E is a normed inner-product space over 𝕜. Completeness and finite dimensionality are not assumed. I is a finite indexing type, possibly empty unless stated otherwise; y:I→E is an arbitrary indexed family. Repetitions, zero vectors and linear dependence are allowed. Use Mathlib's inner product, conjugate-linear in the first argument. Write Gᵢⱼ=⟨yᵢ,yⱼ⟩ and rᵢ=Σⱼ|Gᵢⱼ|. This is the existing Matrix.gram and an ordinary finite real sum, not a new carrier. Real division by zero is zero. x∈E; B is a real nonnegative bound, not a new bound predicate.

**Prerequisites.** [Vanishing Gram row detects the zero vector](#SV-2-gram-row-zero); [Selberg's weighted inner-product inequality](#SV-2-selberg-weighted-inner).

**Proof route.** If rᵢ=0 then gram-row-zero makes yᵢ=0, hence its unweighted numerator is zero.

**Acceptance.** B=0 forces every indexed vector zero.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.402, Proposition 1; p.403, reduction to uniform row bound (5)

<a id="SV-2-bombieri-selberg"></a>

### Bombieri–Selberg Gram-row inequality

**Declaration:** `SieveGram.bombieri_selberg`. **Kind:** theorem.

For nonempty I, Σᵢ|⟨x,yᵢ⟩|² ≤ ‖x‖² maxᵢ∈I rᵢ.

**Hypotheses and conventions.** 𝕜 is ℝ or ℂ, represented by the existing RCLike structure; E is a normed inner-product space over 𝕜. Completeness and finite dimensionality are not assumed. I is a finite indexing type, possibly empty unless stated otherwise; y:I→E is an arbitrary indexed family. Repetitions, zero vectors and linear dependence are allowed. Use Mathlib's inner product, conjugate-linear in the first argument. Write Gᵢⱼ=⟨yᵢ,yⱼ⟩ and rᵢ=Σⱼ|Gᵢⱼ|. This is the existing Matrix.gram and an ordinary finite real sum, not a new carrier. Real division by zero is zero. x∈E and I is nonempty; use the existing finite supremum, not a chosen default maximum.

**Prerequisites.** [Inner-product bound from a uniform Gram row estimate](#SV-2-bombieri-row-bound); `Finset.sup'` (Mathlib); `Finset.le_sup'` (Mathlib).

**Proof route.** Take B to be the existing finite supremum of the real row sums. Every row is bounded by it.

**Acceptance.** For m repeated copies of a unit vector and x that vector, both sides equal m, including the Gram off-diagonal contributions.

**Source.** [BENNETT-SIKSEK-2020](#source-bennett-siksek-2020), §8.2, Theorem 7, printed p.379; application (34), p.380; [BOMBIERI-1971](#source-bombieri-1971), pp.402–403, Proposition 1 and uniform-row reduction

<a id="SV-2-bombieri-diagonal-offdiagonal"></a>

### Diagonal and off-diagonal Gram estimate

**Declaration:** `SieveGram.bombieri_diagonal_offDiagonal`. **Kind:** theorem.

If D,C≥0, ‖yᵢ‖²≤D for every i, and |⟨yᵢ,yⱼ⟩|≤C whenever i≠j, then Σᵢ|⟨x,yᵢ⟩|² ≤ ‖x‖²(D+(|I|−1)₊C), where (|I|−1)₊ is natural truncated subtraction.

**Hypotheses and conventions.** 𝕜 is ℝ or ℂ, represented by the existing RCLike structure; E is a normed inner-product space over 𝕜. Completeness and finite dimensionality are not assumed. I is a finite indexing type, possibly empty unless stated otherwise; y:I→E is an arbitrary indexed family. Repetitions, zero vectors and linear dependence are allowed. Use Mathlib's inner product, conjugate-linear in the first argument. Write Gᵢⱼ=⟨yᵢ,yⱼ⟩ and rᵢ=Σⱼ|Gᵢⱼ|. This is the existing Matrix.gram and an ordinary finite real sum, not a new carrier. Real division by zero is zero. x∈E; I may be empty. D and C are real nonnegative constants.

**Prerequisites.** [Inner-product bound from a uniform Gram row estimate](#SV-2-bombieri-row-bound); `inner_self_re_eq_norm` (Mathlib); `inner_self_eq_norm_sq` (Mathlib); `Finset.mul_prod_erase` (Mathlib); `Finset.card_erase_of_mem` (Mathlib).

**Proof route.** For an index i, use the existing additive companion of mul_prod_erase to separate its diagonal term from the remaining finite row.

**Acceptance.** The empty family satisfies 0≤‖x‖²D and the singleton case has no off-diagonal contribution.

**Source.** [BENNETT-SIKSEK-2020](#source-bennett-siksek-2020), §8.2, printed p.380, diagonal/off-diagonal estimates between (34) and (35)

<a id="SV-2-difference-pair-count"></a>

### Multiplicity of an integer difference

**Declaration:** `SieveTaper.card_difference_pairs`. **Kind:** lemma.

For M∈ℕ and n∈ℤ, the number of ordered pairs 0≤a,b<M with a−b=n is M−|n|, using natural truncated subtraction M−n.natAbs.

**Hypotheses and conventions.** M may be zero; the difference a−b is in ℤ, not natural subtraction.

**Prerequisites.** `Finset.card_bij` (Mathlib); `Int.card_Icc` (Mathlib).

**Proof route.** For n≥0, send b in 0,…,M−n−1 to (b+n,b). For n<0, send a in 0,…,M−|n|−1 to (a,a+|n|). These are inverse coordinate projections on the filtered pair set.

**Acceptance.** M=3,n=−1 gives two pairs; M=3,n=3 gives none. Natural subtraction inside the filter would incorrectly count extra pairs at n=0.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.403, finite expansion underlying the displayed formula for K_M

<a id="SV-2-triangular-fourier"></a>

### Triangular Fourier sum as a squared modulus

**Declaration:** `SieveTaper.triangular_fourier`. **Kind:** lemma.

For every M∈ℕ and t∈ℝ, Σ_{n=−M}^{M}T_M(n)e(nt)=K_M(t), with the real right side cast to ℂ.

**Hypotheses and conventions.** Use only local expressions e(t)=(Real.fourierChar t:ℂ), T_M(n)=max(0,M−|n|), W_{N,L}(n)=(T_{N+L}(n)−T_N(n))/L, and K_M(t)=|Σ_{k=0}^{M−1}e(kt)|². The latter is the unnormalized finite Fejér expression, not a new kernel carrier. Cast naturals/integers to the displayed scalar field.

**Prerequisites.** [Multiplicity of an integer difference](#SV-2-difference-pair-count); `RCLike.mul_conj` (Mathlib); `AddChar.map_sub_eq_div` (Mathlib); `Circle.coe_inv_eq_conj` (Mathlib); `Circle.coe_div` (Mathlib); `Finset.prod_product` (Mathlib); `Finset.prod_fiberwise_of_maps_to'` (Mathlib).

**Proof route.** Expand the squared modulus of Σ_{a<M}e(at) as its product with its complex conjugate. The native Fourier character laws turn each pair term into e((a−b)t).

**Acceptance.** At t=0 the sum is M², not M; no normalized Fejér kernel is being used.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.403, displayed definition and evaluation of K_M

<a id="SV-2-geometric-sine-square"></a>

### Sine quotient for a finite Fourier sum

**Declaration:** `SieveTaper.geometric_sine_square`. **Kind:** lemma.

If sin(πt)≠0, then K_M(t)=(sin(πMt)/sin(πt))² for every M∈ℕ.

**Hypotheses and conventions.** Use only local expressions e(t)=(Real.fourierChar t:ℂ), T_M(n)=max(0,M−|n|), W_{N,L}(n)=(T_{N+L}(n)−T_N(n))/L, and K_M(t)=|Σ_{k=0}^{M−1}e(kt)|². The latter is the unnormalized finite Fejér expression, not a new kernel carrier. Cast naturals/integers to the displayed scalar field. The nonzero denominator is essential. At integer t the finite sum is instead M, and K_M(t)=M²; a totalized quotient would incorrectly give zero.

**Prerequisites.** `Real.fourierChar_apply` (Mathlib); `AddChar.map_nsmul_eq_pow` (Mathlib); `geom_sum_eq` (Mathlib); `Complex.norm_exp_I_mul_ofReal_sub_one` (Mathlib).

**Proof route.** Write e(kt)=e(t)^k using the native additive-character power law.

**Acceptance.** M=2,t=1/2 gives zero; M=1,t=1/2 gives one.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.403, sine-quotient evaluation of K_M

<a id="SV-2-taper-weight"></a>

### Piecewise taper weights and their bounds

**Declaration:** `SieveTaper.taper_weight`. **Kind:** lemma.

For L>0, W_{N,L}(n) equals 1 if |n|≤N, equals (N+L−|n|)/L if N<|n|≤N+L, and equals 0 otherwise. In all cases 0≤W_{N,L}(n)≤1.

**Hypotheses and conventions.** Use only local expressions e(t)=(Real.fourierChar t:ℂ), T_M(n)=max(0,M−|n|), W_{N,L}(n)=(T_{N+L}(n)−T_N(n))/L, and K_M(t)=|Σ_{k=0}^{M−1}e(kt)|². The latter is the unnormalized finite Fejér expression, not a new kernel carrier. Cast naturals/integers to the displayed scalar field. N,L∈ℕ, n∈ℤ; all inequalities in this formula are real after casting.

**Prerequisites.** Native finite constructions only..

**Proof route.** Split at |n|≤N and |n|≤N+L. In each branch evaluate the two maxima defining T.

**Acceptance.** N=1,L=2,n=2 gives 1/2; at |n|=N the value is 1, and at |n|=N+L it is zero.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.403, definition of φ_i and the split into its core and taper

<a id="SV-2-tapered-character"></a>

### Finite tapered Fourier vector

**Declaration:** `SieveTaper.taperedCharacter`. **Kind:** construction.

Construct φ_{N,L}(x) with coordinate k equal to √W_{N,L}(n_k)·e(−n_k x), as a vector in the existing finite Euclidean space. Real square roots are cast to ℂ.

**Hypotheses and conventions.** Use only local expressions e(t)=(Real.fourierChar t:ℂ), T_M(n)=max(0,M−|n|), W_{N,L}(n)=(T_{N+L}(n)−T_N(n))/L, and K_M(t)=|Σ_{k=0}^{M−1}e(kt)|². The latter is the unnormalized finite Fejér expression, not a new kernel carrier. Cast naturals/integers to the displayed scalar field. For natural N,L use the existing EuclideanSpace ℂ (Fin (2(N+L)+1)), with frequency n_k=k−(N+L). Mathlib's inner product is conjugate-linear in its first argument. Every sum here is finite. The constructor allows every natural L, including zero under totalized real division. The useful identities below require L>0.

**Prerequisites.** `Real.fourierChar` (Mathlib); `EuclideanSpace` (Mathlib); [Piecewise taper weights and their bounds](#SV-2-taper-weight).

**Proof route.** Use the native WithLp.toLp 2 constructor on the displayed coordinate function; no new vector-space or kernel structure is introduced.

**API.**

- `SieveTaper.taperedCharacter_apply` (projection): For every k, φ_{N,L}(x)_k=√W_{N,L}(n_k)·e(−n_kx).
- `SieveTaper.taperedCharacter_zero` (simp): For all N and x, φ_{N,0}(x)=0 under totalized real division.
- `SieveTaper.taperedCharacter_core` (simp): If L>0 and |n_k|≤N, then φ_{N,L}(x)_k=e(−n_kx).

**Unit tests.**

- `taper_zero_width`: For every N and x, φ_{N,0}(x) is the zero vector.
- `taper_unit_core`: φ_{0,1}(0) is the native Euclidean vector (0,1,0).
- `taper_quarter_phase`: For N=L=1,x=1/4, coordinate k=1 (frequency −1) is i, not −i.
- `taper_square_root_weight`: For N=0,L=2,x=0, coordinate k=1 (frequency −1) has squared modulus 1/2, not 1/4.
- `taper_diagonal_mass`: The native Euclidean squared norm of φ_{1,2}(0) is 4.

**Acceptance.** Do not replace √W by W: that changes the squared norm and the Gram kernel.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), pp.402–403, finite support of f and the definition of φ_i

<a id="SV-2-tapered-coordinate"></a>

### Coordinates of the tapered Fourier vector

**Declaration:** `SieveTaper.taperedCharacter_apply`. **Kind:** lemma.

For every k, φ_{N,L}(x)_k=√W_{N,L}(n_k)·e(−n_kx).

**Hypotheses and conventions.** Use only local expressions e(t)=(Real.fourierChar t:ℂ), T_M(n)=max(0,M−|n|), W_{N,L}(n)=(T_{N+L}(n)−T_N(n))/L, and K_M(t)=|Σ_{k=0}^{M−1}e(kt)|². The latter is the unnormalized finite Fejér expression, not a new kernel carrier. Cast naturals/integers to the displayed scalar field. For natural N,L use the existing EuclideanSpace ℂ (Fin (2(N+L)+1)), with frequency n_k=k−(N+L). Mathlib's inner product is conjugate-linear in its first argument. Every sum here is finite. N,L∈ℕ and x∈ℝ; L may be zero.

**Prerequisites.** [Finite tapered Fourier vector](#SV-2-tapered-character).

**Proof route.** Evaluate the native finite vector constructor at k. This is the promoted coordinate API, allowing the inner-product proof to avoid unfolding a new abstraction.

**Acceptance.** The frequency is k−(N+L), not k; the endpoints have zero weight when L>0.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.403, definition of φ_i

<a id="SV-2-tapered-core"></a>

### Untapered coordinates on the core

**Declaration:** `SieveTaper.taperedCharacter_core`. **Kind:** lemma.

If L>0 and |n_k|≤N, then φ_{N,L}(x)_k=e(−n_kx).

**Hypotheses and conventions.** Use only local expressions e(t)=(Real.fourierChar t:ℂ), T_M(n)=max(0,M−|n|), W_{N,L}(n)=(T_{N+L}(n)−T_N(n))/L, and K_M(t)=|Σ_{k=0}^{M−1}e(kt)|². The latter is the unnormalized finite Fejér expression, not a new kernel carrier. Cast naturals/integers to the displayed scalar field. For natural N,L use the existing EuclideanSpace ℂ (Fin (2(N+L)+1)), with frequency n_k=k−(N+L). Mathlib's inner product is conjugate-linear in its first argument. Every sum here is finite.

**Prerequisites.** [Coordinates of the tapered Fourier vector](#SV-2-tapered-coordinate); [Piecewise taper weights and their bounds](#SV-2-taper-weight).

**Proof route.** Use the coordinate interface and the first branch of taper-weight. The native real square root of 1 is 1, leaving precisely the phase.

**Acceptance.** The boundary frequencies ±N belong to the core; strict inequality would discard an actual coefficient in the pairing theorem.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.403, inner-product identification with S(x_i)

<a id="SV-2-tapered-gram"></a>

### Signed Gram kernel of tapered vectors

**Declaration:** `SieveTaper.taperedCharacter_inner`. **Kind:** lemma.

For L>0, ⟨φ_{N,L}(x),φ_{N,L}(y)⟩=(K_{N+L}(x−y)−K_N(x−y))/L, with the real quotient cast to ℂ.

**Hypotheses and conventions.** Use only local expressions e(t)=(Real.fourierChar t:ℂ), T_M(n)=max(0,M−|n|), W_{N,L}(n)=(T_{N+L}(n)−T_N(n))/L, and K_M(t)=|Σ_{k=0}^{M−1}e(kt)|². The latter is the unnormalized finite Fejér expression, not a new kernel carrier. Cast naturals/integers to the displayed scalar field. For natural N,L use the existing EuclideanSpace ℂ (Fin (2(N+L)+1)), with frequency n_k=k−(N+L). Mathlib's inner product is conjugate-linear in its first argument. Every sum here is finite.

**Prerequisites.** [Coordinates of the tapered Fourier vector](#SV-2-tapered-coordinate); [Piecewise taper weights and their bounds](#SV-2-taper-weight); [Triangular Fourier sum as a squared modulus](#SV-2-triangular-fourier); `EuclideanSpace.inner_toLp_toLp` (Mathlib); `Real.sq_sqrt` (Mathlib); `AddChar.map_sub_eq_div` (Mathlib); `Circle.coe_inv_eq_conj` (Mathlib); `Circle.coe_div` (Mathlib); `Finset.prod_eq_of_subset` (Mathlib).

**Proof route.** Expand the native finite inner product. The nonnegative square root has squared value W, and conjugation changes e(−n_kx) to e(n_kx), so the term is W(n_k)e(n_k(x−y)).

**Acceptance.** N=L=1 and x−y=1/2 give Gram value −1 and norm 1, not a negative norm.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.403, displayed off-diagonal inner-product formula after K_M

<a id="SV-2-tapered-diagonal"></a>

### Squared norm of the tapered Fourier vector

**Declaration:** `SieveTaper.taperedCharacter_norm_sq`. **Kind:** lemma.

For L>0, ‖φ_{N,L}(x)‖²=2N+L.

**Hypotheses and conventions.** Use only local expressions e(t)=(Real.fourierChar t:ℂ), T_M(n)=max(0,M−|n|), W_{N,L}(n)=(T_{N+L}(n)−T_N(n))/L, and K_M(t)=|Σ_{k=0}^{M−1}e(kt)|². The latter is the unnormalized finite Fejér expression, not a new kernel carrier. Cast naturals/integers to the displayed scalar field. For natural N,L use the existing EuclideanSpace ℂ (Fin (2(N+L)+1)), with frequency n_k=k−(N+L). Mathlib's inner product is conjugate-linear in its first argument. Every sum here is finite.

**Prerequisites.** [Signed Gram kernel of tapered vectors](#SV-2-tapered-gram); `inner_self_eq_norm_sq` (Mathlib); `AddChar.map_zero_eq_one` (Mathlib).

**Proof route.** Set y=x in the signed Gram identity. Every phase in K_M(0) is one, so K_M(0)=M².

**Acceptance.** N=0,L=1 has squared norm 1; N=1,L=2 has squared norm 4.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.403, displayed diagonal inner product

<a id="SV-2-tapered-offdiagonal"></a>

### Off-diagonal tapered Gram bound

**Declaration:** `SieveTaper.taperedCharacter_inner_norm_le`. **Kind:** lemma.

If L>0 and sin(π(x−y))≠0, then |⟨φ_{N,L}(x),φ_{N,L}(y)⟩|≤1/(L sin²(π(x−y))).

**Hypotheses and conventions.** Use only local expressions e(t)=(Real.fourierChar t:ℂ), T_M(n)=max(0,M−|n|), W_{N,L}(n)=(T_{N+L}(n)−T_N(n))/L, and K_M(t)=|Σ_{k=0}^{M−1}e(kt)|². The latter is the unnormalized finite Fejér expression, not a new kernel carrier. Cast naturals/integers to the displayed scalar field. For natural N,L use the existing EuclideanSpace ℂ (Fin (2(N+L)+1)), with frequency n_k=k−(N+L). Mathlib's inner product is conjugate-linear in its first argument. Every sum here is finite.

**Prerequisites.** [Signed Gram kernel of tapered vectors](#SV-2-tapered-gram); [Sine quotient for a finite Fourier sum](#SV-2-geometric-sine-square); `Real.sin_sq_le_one` (Mathlib).

**Proof route.** Put A=1/sin²(π(x−y)), which is positive. The sine-square formula and the native upper bound sin²≤1 give 0≤K_M(x−y)≤A for both M=N and M=N+L.

**Acceptance.** N=L=1,x−y=1/2 attains the bound 1, despite negative Gram value.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.403, off-diagonal estimate preceding the separation sum

<a id="SV-2-tapered-fourier-pairing"></a>

### Tapered pairing recovers a core Fourier sum

**Declaration:** `SieveTaper.taperedCharacter_pairing`. **Kind:** lemma.

For L>0 and f with f_k=0 whenever |n_k|>N, ⟨φ_{N,L}(x),f⟩=Σ_k f_k e(n_kx).

**Hypotheses and conventions.** Use only local expressions e(t)=(Real.fourierChar t:ℂ), T_M(n)=max(0,M−|n|), W_{N,L}(n)=(T_{N+L}(n)−T_N(n))/L, and K_M(t)=|Σ_{k=0}^{M−1}e(kt)|². The latter is the unnormalized finite Fejér expression, not a new kernel carrier. Cast naturals/integers to the displayed scalar field. For natural N,L use the existing EuclideanSpace ℂ (Fin (2(N+L)+1)), with frequency n_k=k−(N+L). Mathlib's inner product is conjugate-linear in its first argument. Every sum here is finite. f is any vector in the same native Euclidean space; coefficients may be arbitrary complex numbers.

**Prerequisites.** [Untapered coordinates on the core](#SV-2-tapered-core); `EuclideanSpace.inner_toLp_toLp` (Mathlib); `AddChar.map_sub_eq_div` (Mathlib); `Circle.coe_inv_eq_conj` (Mathlib); `Circle.coe_div` (Mathlib).

**Proof route.** Expand the finite inner product and split coordinates by |n_k|≤N.

**Acceptance.** The phase sign and order of the inner-product arguments matter for complex coefficients.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.403, (f,φ_i)=S(x_i), translated to the native convention

<a id="SV-2-tapered-row-large-sieve"></a>

### Large-sieve bound from cosecant row control

**Declaration:** `SieveTaper.largeSieve_of_cosecantRow_le`. **Kind:** theorem.

Let x_i be a finite real family and C≥0. Suppose sin(π(x_i−x_j))≠0 for i≠j and Σ_{j≠i}1/sin²(π(x_i−x_j))≤C for every i. For L>0 and core-supported f, Σ_i|Σ_k f_k e(n_kx_i)|²≤‖f‖²(2N+L+C/L).

**Hypotheses and conventions.** Use only local expressions e(t)=(Real.fourierChar t:ℂ), T_M(n)=max(0,M−|n|), W_{N,L}(n)=(T_{N+L}(n)−T_N(n))/L, and K_M(t)=|Σ_{k=0}^{M−1}e(kt)|². The latter is the unnormalized finite Fejér expression, not a new kernel carrier. Cast naturals/integers to the displayed scalar field. For natural N,L use the existing EuclideanSpace ℂ (Fin (2(N+L)+1)), with frequency n_k=k−(N+L). Mathlib's inner product is conjugate-linear in its first argument. Every sum here is finite. The indexing type may be empty. N,L∈ℕ, L>0, and f_k=0 whenever |n_k|>N. The explicit cosecant row bound is a hypothesis, not an inferred consequence of separation.

**Prerequisites.** [Squared norm of the tapered Fourier vector](#SV-2-tapered-diagonal); [Off-diagonal tapered Gram bound](#SV-2-tapered-offdiagonal); [Tapered pairing recovers a core Fourier sum](#SV-2-tapered-fourier-pairing); [Inner-product bound from a uniform Gram row estimate](#SV-2-bombieri-row-bound); `Finset.mul_prod_erase` (Mathlib); `norm_inner_symm` (Mathlib).

**Proof route.** For each i split the Gram row into its diagonal and its erased off-diagonal sum using the native additive erase identity.

**Acceptance.** The empty family gives 0≤‖f‖²B; a singleton has C=0.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), pp.403–404, reduction to (5) and its diagonal/off-diagonal decomposition

<a id="SV-2-circular-sine-square"></a>

### Sine lower bound from circular distance

**Declaration:** `SieveTaper.four_circle_norm_sq_le_sin_sq`. **Kind:** lemma.

For every real t, 4d(t)²≤sin²(πt).

**Hypotheses and conventions.** Write d(t)=‖(t:UnitAddCircle)‖ using the native real circle of period one, and e(t)=(Real.fourierChar t:ℂ)=exp(2πit). These are notation, not new carriers. Finite point families x:ι→ℝ are δ-separated when δ≤d(x_i−x_j) for all distinct labels i,j. δ>0 is explicit; no assumption that the family is nonempty.

**Prerequisites.** `UnitAddCircle.norm_eq` (Mathlib); `abs_sub_round` (Mathlib); `Real.le_sin_mul` (Mathlib); `Real.sin_sub_int_mul_pi` (Mathlib).

**Proof route.** Put r=t−round t and a=|r|=d(t). Native rounding gives 0≤a≤1/2.

**Acceptance.** At t=0 both sides vanish; at t=1/2 both sides equal one.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.404, the sine inequality preceding the reciprocal-square sum

<a id="SV-2-circular-bin-packing"></a>

### Two-point bound for circular radial bins

**Declaration:** `SieveTaper.circular_bin_card_le_two`. **Kind:** lemma.

For a δ-separated finite real family, fixed i and m∈ℕ, #{j≠i: floor(d(x_i−x_j)/δ)=m}≤2. No upper restriction on m is imposed.

**Hypotheses and conventions.** Write d(t)=‖(t:UnitAddCircle)‖ using the native real circle of period one, and e(t)=(Real.fourierChar t:ℂ)=exp(2πit). These are notation, not new carriers. Finite point families x:ι→ℝ are δ-separated when δ≤d(x_i−x_j) for all distinct labels i,j. δ>0 is explicit; no assumption that the family is nonempty.

**Prerequisites.** `UnitAddCircle.norm_eq` (Mathlib); `round_eq_iff` (Mathlib); `round_le` (Mathlib); `round_sub_intCast` (Mathlib); `Finset.card_le_card_of_injOn` (Mathlib); `Nat.floor_le` (Mathlib); `Nat.lt_floor_add_one` (Mathlib).

**Proof route.** For each j reduce x_j−x_i to r_j=(x_j−x_i)−round(x_j−x_i)∈[−1/2,1/2). Its absolute value is d(x_i−x_j), by native norm symmetry.

**Acceptance.** With δ=3/10 and x=(0,2/5), the off-diagonal point lies in m=1 although (m+1)δ>1/2.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.404, radial intervals I_m and their at-most-two assertion, with E11 corrected

<a id="SV-2-cosecant-row-bound"></a>

### Separated cosecant-square row bound

**Declaration:** `SieveTaper.cosecantRow_le`. **Kind:** lemma.

For every row i of a δ-separated finite family with δ>0, Σ_{j≠i}1/sin²(π(x_i−x_j))≤π²/(12δ²).

**Hypotheses and conventions.** Write d(t)=‖(t:UnitAddCircle)‖ using the native real circle of period one, and e(t)=(Real.fourierChar t:ℂ)=exp(2πit). These are notation, not new carriers. Finite point families x:ι→ℝ are δ-separated when δ≤d(x_i−x_j) for all distinct labels i,j. δ>0 is explicit; no assumption that the family is nonempty.

**Prerequisites.** [Sine lower bound from circular distance](#SV-2-circular-sine-square); [Two-point bound for circular radial bins](#SV-2-circular-bin-packing); `Nat.le_floor_iff` (Mathlib); `Nat.floor_le` (Mathlib); `Finset.prod_fiberwise_of_maps_to` (Mathlib); `hasSum_zeta_two` (Mathlib); `prod_le_hasProd` (Mathlib).

**Proof route.** For j≠i separation gives positive distance, hence nonzero sine by circular-sine-square. Put m_j=floor(d(x_i−x_j)/δ); then m_j≥1 and d(x_i−x_j)≥m_jδ.

**Acceptance.** Empty off-diagonal sums and singleton point families are allowed.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.404, displayed reciprocal-square row estimate

<a id="SV-2-integer-taper-choice"></a>

### Explicit positive integer taper width

**Declaration:** `SieveTaper.floor_taper_bound`. **Kind:** lemma.

If 0<δ≤1/2 and L=floor(1/δ)∈ℕ, then L>0 and L+[π²/(12δ²)]/L≤2/δ.

**Hypotheses and conventions.** Write d(t)=‖(t:UnitAddCircle)‖ using the native real circle of period one, and e(t)=(Real.fourierChar t:ℂ)=exp(2πit). These are notation, not new carriers. Finite point families x:ι→ℝ are δ-separated when δ≤d(x_i−x_j) for all distinct labels i,j. δ>0 is explicit; no assumption that the family is nonempty.

**Prerequisites.** `Nat.le_floor_iff` (Mathlib); `Nat.floor_le` (Mathlib); `Nat.lt_floor_add_one` (Mathlib); `Real.pi_lt_d2` (Mathlib).

**Proof route.** The floor inequalities give L≥2, Lδ≤1 and (L+1)δ>1. Set r=Lδ. Since L≥2, r>L/(L+1)≥2/3.

**Acceptance.** At δ=1/2, L=2; at δ=3/10, L=3.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.404, final integer choice after the row estimate

<a id="SV-2-separated-core"></a>

### Large sieve on the centered finite core

**Declaration:** `SieveTaper.largeSieve_centered`. **Kind:** theorem.

Let 0<δ≤1/2, L=floor(1/δ), N∈ℕ, and x be δ-separated. In EuclideanSpace ℂ (Fin(2(N+L)+1)), write n_k=k−(N+L). If f_k=0 for |n_k|>N, then Σ_i|Σ_k f_k e(n_kx_i)|²≤‖f‖²(2N+2/δ).

**Hypotheses and conventions.** Write d(t)=‖(t:UnitAddCircle)‖ using the native real circle of period one, and e(t)=(Real.fourierChar t:ℂ)=exp(2πit). These are notation, not new carriers. Finite point families x:ι→ℝ are δ-separated when δ≤d(x_i−x_j) for all distinct labels i,j. δ>0 is explicit; no assumption that the family is nonempty. The ambient width is this chosen L; the theorem does not silently alter an arbitrary input vector's dimension.

**Prerequisites.** [Sine lower bound from circular distance](#SV-2-circular-sine-square); [Separated cosecant-square row bound](#SV-2-cosecant-row-bound); [Explicit positive integer taper width](#SV-2-integer-taper-choice); [Large-sieve bound from cosecant row control](#SV-2-tapered-row-large-sieve).

**Proof route.** Set C=π²/(12δ²)≥0. Separation and circular-sine-square supply every nonzero sine required by tapered-row-large-sieve.

**Acceptance.** N=0 is allowed; the single central coefficient is embedded in the stated larger native space.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), pp.403–404, estimate (5) after the separation sum

<a id="SV-2-interval-vector"></a>

### Centered interval coefficient vector

**Declaration:** `SieveTaper.intervalVector`. **Kind:** construction.

For H,L∈ℕ and a:Fin H→ℂ, put N=floor(H/2), o=L+1−(H mod 2), and D=2(N+L)+1. Define intervalVector H L a∈EuclideanSpace ℂ (Fin D) by coordinate k equal to Σ_{j∈Fin H} [k=o+j]a_j. The bracket is the ordinary finite indicator, not a new scalar or carrier.

**Hypotheses and conventions.** Write d(t)=‖(t:UnitAddCircle)‖ using the native real circle of period one, and e(t)=(Real.fourierChar t:ℂ)=exp(2πit). These are notation, not new carriers. Finite point families x:ι→ℝ are δ-separated when δ≤d(x_i−x_j) for all distinct labels i,j. δ>0 is explicit; no assumption that the family is nonempty. Natural subtraction in o is nontruncating because H mod 2≤1≤L+1; no positivity of H or L is required.

**Prerequisites.** `EuclideanSpace` (Mathlib).

**Proof route.** Use the native EuclideanSpace constructor on the finite coordinate function; no new coefficient-vector space or quotient is introduced.

**API.**

- `intervalVector_apply` (data): For k in the ambient finite index, (intervalVector H L a)_k=Σ_{j∈Fin H, k=o+j}a_j, with o=L+1−(H mod 2); promoted as interval-coordinate.
- `intervalVector_support` (compatibility): Every coordinate with |k−(floor(H/2)+L)|>floor(H/2) is zero; promoted as interval-support.
- `intervalVector_norm_sq` (compatibility): The native squared norm equals Σ_{j∈Fin H}|a_j|²; promoted as interval-norm.
- `intervalVector_fourier` (compatibility): For c=M+ceil(H/2), the original interval sum equals e(cx) times the centered Fourier sum; promoted as interval-phase.

**Unit tests.**

- `interval_empty`: For every L and a:Fin 0→ℂ, intervalVector 0 L a is the zero native vector.
- `interval_even_padding`: For a,b∈ℂ, intervalVector 2 1 (a,b)=(0,0,a,b,0) in the five-dimensional native Euclidean space.
- `interval_odd_padding`: For a,b,c∈ℂ, intervalVector 3 1 (a,b,c)=(0,a,b,c,0) in the five-dimensional native Euclidean space.
- `interval_zero_taper`: For a,b∈ℂ, intervalVector 2 0 (a,b)=(0,a,b). Padding itself is valid at L=0 even though the taper theorem requires L>0.

**Acceptance.** Its uses and four discriminating tests are specified below.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.402, replacing the interval length by 2N or 2N+1 and translating the exponential sum

<a id="SV-2-interval-coordinate"></a>

### Coordinates of the centered interval vector

**Declaration:** `SieveTaper.intervalVector_apply`. **Kind:** lemma.

With N=floor(H/2), o=L+1−(H mod 2), each coordinate of intervalVector H L a is Σ_{j∈Fin H}[k=o+j]a_j.

**Hypotheses and conventions.** Write d(t)=‖(t:UnitAddCircle)‖ using the native real circle of period one, and e(t)=(Real.fourierChar t:ℂ)=exp(2πit). These are notation, not new carriers. Finite point families x:ι→ℝ are δ-separated when δ≤d(x_i−x_j) for all distinct labels i,j. δ>0 is explicit; no assumption that the family is nonempty. H,L∈ℕ; no positivity assumption.

**Prerequisites.** [Centered interval coefficient vector](#SV-2-interval-vector).

**Proof route.** Unfold only the construction and the native Euclidean coordinate map; this is the canonical evaluation rule.

**Acceptance.** The four construction tests distinguish empty, even, odd and zero-width indexing.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.402, centered coefficient family

<a id="SV-2-interval-support"></a>

### Core support of the interval vector

**Declaration:** `SieveTaper.intervalVector_support`. **Kind:** lemma.

For H,L∈ℕ, N=floor(H/2) and n_k=k−(N+L), |n_k|>N implies (intervalVector H L a)_k=0.

**Hypotheses and conventions.** Write d(t)=‖(t:UnitAddCircle)‖ using the native real circle of period one, and e(t)=(Real.fourierChar t:ℂ)=exp(2πit). These are notation, not new carriers. Finite point families x:ι→ℝ are δ-separated when δ≤d(x_i−x_j) for all distinct labels i,j. δ>0 is explicit; no assumption that the family is nonempty.

**Prerequisites.** [Coordinates of the centered interval vector](#SV-2-interval-coordinate).

**Proof route.** Write H=2N+ε with ε∈{0,1}. The offset is o=L+1−ε. For j<H, the occupied frequency is n_{o+j}=j+1−N−ε.

**Acceptance.** H=2 occupies frequencies 0 and 1, not −1 and 0 under this translation.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.402, replacement by even/odd centered intervals

<a id="SV-2-interval-norm"></a>

### Norm preservation under interval padding

**Declaration:** `SieveTaper.intervalVector_norm_sq`. **Kind:** lemma.

For every H,L∈ℕ and a:Fin H→ℂ, ‖intervalVector H L a‖²=Σ_j|a_j|².

**Hypotheses and conventions.** Write d(t)=‖(t:UnitAddCircle)‖ using the native real circle of period one, and e(t)=(Real.fourierChar t:ℂ)=exp(2πit). These are notation, not new carriers. Finite point families x:ι→ℝ are δ-separated when δ≤d(x_i−x_j) for all distinct labels i,j. δ>0 is explicit; no assumption that the family is nonempty.

**Prerequisites.** [Coordinates of the centered interval vector](#SV-2-interval-coordinate); `EuclideanSpace.norm_sq_eq` (Mathlib); `Finset.prod_fiberwise_of_maps_to` (Mathlib).

**Proof route.** The index map j↦o+j is injective. Using H=2N+ε and o=L+1−ε, verify 0≤o+j<2(N+L)+1 for every j<H; H=0 is empty.

**Acceptance.** For complex (1,i) and H=2,L=1, the squared norm is 2.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.402, preservation of the coefficient-square sum under translation

<a id="SV-2-interval-phase"></a>

### Fourier translation of the padded interval

**Declaration:** `SieveTaper.intervalVector_fourier`. **Kind:** lemma.

For M∈ℤ, H,L∈ℕ, a:Fin H→ℂ, x∈ℝ, N=floor(H/2), c=M+floor((H+1)/2), one has Σ_j a_j e((M+j+1)x)=e(cx)Σ_k(intervalVector H L a)_k e((k−(N+L))x).

**Hypotheses and conventions.** Write d(t)=‖(t:UnitAddCircle)‖ using the native real circle of period one, and e(t)=(Real.fourierChar t:ℂ)=exp(2πit). These are notation, not new carriers. Finite point families x:ι→ℝ are δ-separated when δ≤d(x_i−x_j) for all distinct labels i,j. δ>0 is explicit; no assumption that the family is nonempty.

**Prerequisites.** [Coordinates of the centered interval vector](#SV-2-interval-coordinate); `Finset.prod_fiberwise_of_maps_to` (Mathlib); `AddChar.map_sub_eq_div` (Mathlib).

**Proof route.** Expand interval-coordinate, interchange the finite sums and retain the unique coordinate k=o+j. The index is inside the ambient dimension by H=2N+ε.

**Acceptance.** For H=2,M=−2,a=(1,i),x=1/4 the original sum is 0; changing the phase sign makes it 2i.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.402, translation and the resulting trigonometric polynomial

<a id="SV-2-separation-card-small"></a>

### Cardinality above the circle diameter

**Declaration:** `SieveTaper.card_le_one_of_half_lt_separation`. **Kind:** lemma.

If δ>1/2 and a finite real family is δ-separated modulo one, its indexing type has cardinality at most one.

**Hypotheses and conventions.** Write d(t)=‖(t:UnitAddCircle)‖ using the native real circle of period one, and e(t)=(Real.fourierChar t:ℂ)=exp(2πit). These are notation, not new carriers. Finite point families x:ι→ℝ are δ-separated when δ≤d(x_i−x_j) for all distinct labels i,j. δ>0 is explicit; no assumption that the family is nonempty.

**Prerequisites.** `AddCircle.norm_le_half_period` (Mathlib).

**Proof route.** Two distinct labels would have δ≤d(x_i−x_j)≤1/2 by the native half-period bound, a contradiction.

**Acceptance.** For δ=2 a singleton is allowed, while floor(1/δ)=0.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.401, separated-point hypothesis of the main theorem

<a id="SV-2-additive-large-sieve"></a>

### Bombieri's additive large sieve

**Declaration:** `SieveTaper.additive_largeSieve`. **Kind:** theorem.

Let M∈ℤ, H∈ℕ, a:Fin H→ℂ, δ>0 and x:ι→ℝ be a finite δ-separated family modulo one. Then Σ_i|Σ_{j=0}^{H−1}a_j e((M+j+1)x_i)|²≤(H+2/δ)Σ_{j=0}^{H−1}|a_j|².

**Hypotheses and conventions.** Write d(t)=‖(t:UnitAddCircle)‖ using the native real circle of period one, and e(t)=(Real.fourierChar t:ℂ)=exp(2πit). These are notation, not new carriers. Finite point families x:ι→ℝ are δ-separated when δ≤d(x_i−x_j) for all distinct labels i,j. δ>0 is explicit; no assumption that the family is nonempty. Empty coefficient and point families are allowed. No restriction δ≤1/2 or normalization of coefficients is imposed.

**Prerequisites.** [Large sieve on the centered finite core](#SV-2-separated-core); [Core support of the interval vector](#SV-2-interval-support); [Norm preservation under interval padding](#SV-2-interval-norm); [Fourier translation of the padded interval](#SV-2-interval-phase); [Cardinality above the circle diameter](#SV-2-separation-card-small); `Circle.norm_coe` (Mathlib); `norm_sum_le` (Mathlib); `Finset.sum_mul_sq_le_sq_mul_sq` (Mathlib).

**Proof route.** When 0<δ≤1/2, set N=floor(H/2), L=floor(1/δ), and f=intervalVector H L a. Its support is interval-support, so separated-core applies.

**Acceptance.** The theorem has the original interval length H, not the centered N.

**Source.** [BOMBIERI-1971](#source-bombieri-1971), p.401, main Theorem; pp.402–404, complete finite proof

<a id="SV-2-reduced-fraction-separation"></a>

### Circular separation of reduced fractions

**Declaration:** `SieveCharacters.reduced_fraction_separation`. **Kind:** lemma.

For natural a,b,p,q,Q with 0<p,q≤Q, a<p, b<q, gcd(a,p)=gcd(b,q)=1 and (a,p)≠(b,q), one has ‖(a/p−b/q:UnitAddCircle)‖≥1/Q².

**Hypotheses and conventions.** Use e(t)=(Real.fourierChar t:ℂ)=exp(2πit), the existing UnitAddCircle norm, and the native DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate and its inverse. There is no new Fourier, character or Farey carrier.

**Prerequisites.** `Rat.div_int_inj` (Mathlib); `UnitAddCircle.norm_eq` (Mathlib).

**Proof route.** Put t=a/p−b/q and z=round(t). Since both fractions lie in [0,1), t lies strictly between −1 and 1. If t were an integer, it would therefore be zero. Equality of the rational fractions would force a=b and p=q by the native reduced-fraction uniqueness theorem, contradicting the hypothesis.

**Acceptance.** The sole reduced pair with numerator zero is (0,1); the endpoint 1/1 is excluded by a<p.

**Source.** [KED-ANT-16](#source-ked-ant-16), §16.1, (16.1.1)–(16.1.2)

<a id="SV-2-reduced-fraction-large-sieve"></a>

### Additive large sieve over reduced residues

**Declaration:** `SieveCharacters.reduced_fraction_largeSieve`. **Kind:** theorem.

Σ_{1≤q≤Q}Σ_{u∈(Z/qZ)×}|S(val(u)/q)|² ≤ (H+2Q²)Σ_{j<H}|a_j|².

**Hypotheses and conventions.** Use e(t)=(Real.fourierChar t:ℂ)=exp(2πit), the existing UnitAddCircle norm, and the native DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate and its inverse. There is no new Fourier, character or Farey carrier. M is any integer, H and Q are natural numbers, and a:Fin H→ℂ is arbitrary. Write n_j=M+j+1 and S(t)=Σ_{j<H}a_j e(n_j t). Empty intervals and Q=0 are permitted.

**Prerequisites.** [Circular separation of reduced fractions](#SV-2-reduced-fraction-separation); [Bombieri's additive large sieve](#SV-2-additive-large-sieve); `ZMod.val_lt` (Mathlib); `ZMod.val_coe_unit_coprime` (Mathlib); `Finset.prod_sigma` (Mathlib).

**Proof route.** For Q>0 index the family by the native dependent sum of q∈Fin Q and u∈(ZMod(q+1))ˣ, assigning the real point val(u)/(q+1). Native residue bounds and unit coprimality give the hypotheses of reduced-fraction-separation.

**Acceptance.** Modulus one contributes its single unit at phase zero; it is not discarded.

**Source.** [KED-ANT-16](#source-ked-ant-16), §16.1, Theorem 16.1 and its proof

<a id="SV-2-standard-character-phase"></a>

### Integer phase of the standard residue character

**Declaration:** `SieveCharacters.standard_character_phase`. **Kind:** lemma.

For u∈ZMod q and n∈ℤ, stdAddChar(u·n)=e(n·val(u)/q).

**Hypotheses and conventions.** Use e(t)=(Real.fourierChar t:ℂ)=exp(2πit), the existing UnitAddCircle norm, and the native DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate and its inverse. There is no new Fourier, character or Farey carrier. q is a positive natural number. The finite ring ZMod q and its unit group use their native instances, including the trivial ring q=1. Write φ(q)=q.totient and τ(χ)=gaussSum χ ZMod.stdAddChar.

**Prerequisites.** `ZMod.stdAddChar_coe` (Mathlib); `Real.fourierChar_apply` (Mathlib).

**Proof route.** Replace u by the integer cast of its native natural representative. Combine the residue casts into the cast of the integer product val(u)n.

**Acceptance.** At q=4,u=1,n=−1 the value is −i, detecting a sign reversal.

**Source.** [KED-ANT-16](#source-ked-ant-16), §16.2, the exponential convention in τ and S

<a id="SV-2-primitive-gauss-norm"></a>

### Squared norm of a primitive Dirichlet Gauss sum

**Declaration:** `SieveCharacters.primitive_gauss_norm_sq`. **Kind:** lemma.

For a primitive Dirichlet character χ modulo q>0, |τ(χ)|²=q.

**Hypotheses and conventions.** Use e(t)=(Real.fourierChar t:ℂ)=exp(2πit), the existing UnitAddCircle norm, and the native DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate and its inverse. There is no new Fourier, character or Farey carrier. q is a positive natural number. The finite ring ZMod q and its unit group use their native instances, including the trivial ring q=1. Write φ(q)=q.totient and τ(χ)=gaussSum χ ZMod.stdAddChar. χ.IsPrimitive is required; χ≠1 alone is not a substitute at composite modulus.

**Prerequisites.** `DirichletCharacter.conductor_inv` (Mathlib); `DirichletCharacter.IsPrimitive.fourierTransform_eq_inv_mul_gaussSum` (Mathlib); `ZMod.dft_dft` (Mathlib); `ZMod.dft_mul_const` (Mathlib); `ZMod.dft_comp_neg` (Mathlib); `star_gaussSum_eq` (Mathlib); `AddChar.inv_mulShift` (Mathlib); `gaussSum_mulShift_of_isPrimitive` (Mathlib); `RCLike.mul_conj` (Mathlib).

**Proof route.** Conductor invariance under inverse makes χ⁻¹ primitive. The native finite Fourier formula gives Dχ(k)=χ⁻¹(−k)τ(χ), using the unnormalized negative-phase DFT.

**Acceptance.** For q=1 the unique character is primitive and its Gauss sum is 1. Treating zero as a nonunit in this trivial ring would break the statement.

**Source.** [KED-ANT-16](#source-ked-ant-16), §16.2, proof of Theorem 16.2, |τ(χ)|=√q

<a id="SV-2-finite-gauss-expansion"></a>

### Gauss expansion of a finite character sum

**Declaration:** `SieveCharacters.finite_gauss_expansion`. **Kind:** lemma.

For primitive χ modulo q>0, τ(χ⁻¹)Σ_{j<H}a_jχ(n_j)=Σ_{u∈(Z/qZ)×}χ⁻¹(u)S(val(u)/q).

**Hypotheses and conventions.** Use e(t)=(Real.fourierChar t:ℂ)=exp(2πit), the existing UnitAddCircle norm, and the native DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate and its inverse. There is no new Fourier, character or Farey carrier. q is a positive natural number. The finite ring ZMod q and its unit group use their native instances, including the trivial ring q=1. Write φ(q)=q.totient and τ(χ)=gaussSum χ ZMod.stdAddChar. M is any integer, H and Q are natural numbers, and a:Fin H→ℂ is arbitrary. Write n_j=M+j+1 and S(t)=Σ_{j<H}a_j e(n_j t). Empty intervals and Q=0 are permitted. χ.IsPrimitive; Q is unused in this single-modulus statement.

**Prerequisites.** [Integer phase of the standard residue character](#SV-2-standard-character-phase); `DirichletCharacter.conductor_inv` (Mathlib); `gaussSum` (Mathlib); `gaussSum_mulShift_of_isPrimitive` (Mathlib); `MulChar.map_nonunit` (Mathlib).

**Proof route.** Apply the native primitive Gauss-shift theorem to χ⁻¹ and the residue n_j. Inversion of χ⁻¹ yields χ(n_j), even when n_j is not a unit.

**Acceptance.** The coefficients can be complex, and M can be negative.

**Source.** [KED-ANT-16](#source-ked-ant-16), §16.2, proof of Theorem 16.2, primitive Gauss expansion

<a id="SV-2-character-parseval"></a>

### Parseval identity over Dirichlet characters

**Declaration:** `SieveCharacters.character_parseval`. **Kind:** lemma.

For arbitrary F:(ZMod q)ˣ→ℂ, Σ_{χ mod q}|Σ_u χ⁻¹(u)F(u)|²=φ(q)Σ_u|F(u)|², summing over all Dirichlet characters modulo q.

**Hypotheses and conventions.** Use e(t)=(Real.fourierChar t:ℂ)=exp(2πit), the existing UnitAddCircle norm, and the native DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate and its inverse. There is no new Fourier, character or Farey carrier. q is a positive natural number. The finite ring ZMod q and its unit group use their native instances, including the trivial ring q=1. Write φ(q)=q.totient and τ(χ)=gaussSum χ ZMod.stdAddChar.

**Prerequisites.** `DirichletCharacter.sum_char_inv_mul_char_eq` (Mathlib); `MulChar.star_apply'` (Mathlib); `MulChar.inv_apply` (Mathlib); `RCLike.mul_conj` (Mathlib).

**Proof route.** Expand each squared norm as its complex product with its conjugate. Finite interchange gives a sum over pairs u,v of F(u)conjugate(F(v)) multiplied by Σχχ⁻¹(u)χ(v).

**Acceptance.** For q=4 and F≡1 on the two units, the left side is 4, equal to 2·2. Using q instead of φ(q) gives the wrong normalization.

**Source.** [KED-ANT-16](#source-ked-ant-16), §16.2, character-orthogonality step in Theorem 16.2

<a id="SV-2-primitive-modulus-energy"></a>

### Primitive character energy at one modulus

**Declaration:** `SieveCharacters.primitive_modulus_energy`. **Kind:** lemma.

(q/φ(q))Σ_{χ primitive mod q}|Σ_{j<H}a_jχ(n_j)|² ≤ Σ_{u∈(Z/qZ)×}|S(val(u)/q)|².

**Hypotheses and conventions.** Use e(t)=(Real.fourierChar t:ℂ)=exp(2πit), the existing UnitAddCircle norm, and the native DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate and its inverse. There is no new Fourier, character or Farey carrier. q is a positive natural number. The finite ring ZMod q and its unit group use their native instances, including the trivial ring q=1. Write φ(q)=q.totient and τ(χ)=gaussSum χ ZMod.stdAddChar. M is any integer, H and Q are natural numbers, and a:Fin H→ℂ is arbitrary. Write n_j=M+j+1 and S(t)=Σ_{j<H}a_j e(n_j t). Empty intervals and Q=0 are permitted.

**Prerequisites.** [Gauss expansion of a finite character sum](#SV-2-finite-gauss-expansion); [Squared norm of a primitive Dirichlet Gauss sum](#SV-2-primitive-gauss-norm); [Parseval identity over Dirichlet characters](#SV-2-character-parseval); `Nat.totient_pos` (Mathlib).

**Proof route.** For each primitive χ, take squared norms of finite-gauss-expansion. The inverse is primitive, so its Gauss square norm is q. Divide by positive φ(q), obtaining the source weighted identity.

**Acceptance.** The factor is q/φ(q); neither it nor the primitive filter is suppressed.

**Source.** [KED-ANT-16](#source-ked-ant-16), §16.2, weighted equality and enlargement to all characters

<a id="SV-2-primitive-large-sieve"></a>

### Primitive-character large sieve

**Declaration:** `SieveCharacters.primitive_largeSieve`. **Kind:** theorem.

Σ_{1≤q≤Q}(q/φ(q))Σ_{χ primitive mod q}|Σ_{j<H}a_jχ(M+j+1)|² ≤ (H+2Q²)Σ_{j<H}|a_j|².

**Hypotheses and conventions.** Use e(t)=(Real.fourierChar t:ℂ)=exp(2πit), the existing UnitAddCircle norm, and the native DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate and its inverse. There is no new Fourier, character or Farey carrier. M is any integer, H and Q are natural numbers, and a:Fin H→ℂ is arbitrary. Write n_j=M+j+1 and S(t)=Σ_{j<H}a_j e(n_j t). Empty intervals and Q=0 are permitted.

**Prerequisites.** [Primitive character energy at one modulus](#SV-2-primitive-modulus-energy); [Additive large sieve over reduced residues](#SV-2-reduced-fraction-large-sieve).

**Proof route.** Sum primitive-modulus-energy over moduli 1 through Q, represented in the seed by q∈Fin Q with actual modulus q+1.

**Acceptance.** This is the Bombieri–Davenport reduction with the inherited Bombieri constant. It does not claim the source sharp H−1+Q² constant.

**Source.** [KED-ANT-16](#source-ked-ant-16), §§16.1–16.2, Theorems 16.1–16.2 and full reduction proof

<a id="SV-2-incomplete-log"></a>

### Incomplete logarithm

**Declaration:** `SieveVaughan.incompleteLog`. **Kind:** construction.

Construct λ_V:ArithmeticFunction ℝ by λ_V(n)=Σ_{d|n,V<d}Λ(d). This is a cutoff divisor sum, not log(n/V) and not a multiplicative function.

**Hypotheses and conventions.** U,V,N,L,M,n,m,ℓ are natural numbers. Divisors are the native positive divisor finsets; n=0 has no divisors. μ is the native integer Möbius function, Λ the native real von Mangoldt function, and log is the real logarithm with its native value at zero. Write λ_V for incompleteLog V. All cutoffs are inclusive below and strict above. Ioc(a,b) means a<k≤b and is empty when b≤a. No positivity of U or V is needed for the finite identities.

**Prerequisites.** `ArithmeticFunction` (Mathlib); `ArithmeticFunction.vonMangoldt` (Mathlib); `ArithmeticFunction.coe_mul_zeta_apply` (Mathlib).

**Proof route.** Use the existing zero-preserving arithmetic-function carrier. The finite formula is zero at n=0 because the native divisor finset is empty.

**API.**

- `SieveVaughan.incompleteLog_apply` (projection): λ_V(n)=Σ_{d|n,V<d}Λ(d).
- `SieveVaughan.incompleteLog_eq_sub` (compatibility): λ_V(n)=log n−Σ_{d|n,d≤V}Λ(d); promoted as incomplete-log-sub.
- `SieveVaughan.incompleteLog_eq_zero_of_le` (simp): n≤V implies λ_V(n)=0; promoted as incomplete-log-support.
- `SieveVaughan.incompleteLog_bounds` (compatibility): 0≤λ_V(n)≤log n for every natural n; promoted as incomplete-log-bounds.
- `SieveVaughan.moebius_mul_incompleteLog` (compatibility): (μ*λ_V)(n)=Λ(n) if V<n, and zero otherwise; promoted as moebius-incomplete-log.
- `SieveVaughan.incompleteLog_zero_cutoff` (simp): λ_0 is the existing arithmetic logarithm.

**Unit tests.**

- `incomplete_zero_argument`: λ_2(0)=0, as required by the existing carrier.
- `incomplete_cutoff_boundary`: λ_4(4)=0; replacing V<d by V≤d would give log 2.
- `incomplete_prime_power`: λ_2(4)=log 2, not log 4: the retained divisor is 4.
- `incomplete_composite`: λ_2(12)=log 2+log 3, retaining the prime-power divisors 4 and 3.
- `incomplete_zero_cutoff`: λ_0(n)=log n for every n, including zero and one.

**Acceptance.** Keep every prime-power divisor, not just prime divisors.

**Source.** [KED-ANT-18](#source-ked-ant-18), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2

<a id="SV-2-incomplete-log-sub"></a>

### Subtracting the short von Mangoldt divisor sum

**Declaration:** `SieveVaughan.incompleteLog_eq_sub`. **Kind:** lemma.

λ_V(n)=log n−Σ_{d|n,d≤V}Λ(d).

**Hypotheses and conventions.** U,V,N,L,M,n,m,ℓ are natural numbers. Divisors are the native positive divisor finsets; n=0 has no divisors. μ is the native integer Möbius function, Λ the native real von Mangoldt function, and log is the real logarithm with its native value at zero. Write λ_V for incompleteLog V. All cutoffs are inclusive below and strict above. Ioc(a,b) means a<k≤b and is empty when b≤a. No positivity of U or V is needed for the finite identities.

**Prerequisites.** [Incomplete logarithm](#SV-2-incomplete-log); `ArithmeticFunction.vonMangoldt_sum` (Mathlib).

**Proof route.** Partition the finite positive divisors into V<d and d≤V; these are complementary predicates, including equality.

**Acceptance.** For n=4,V=2 the subtraction removes Λ(1)+Λ(2), leaving Λ(4).

**Source.** [KED-ANT-18](#source-ked-ant-18), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2

<a id="SV-2-incomplete-log-support"></a>

### Vanishing below the incomplete-log cutoff

**Declaration:** `SieveVaughan.incompleteLog_eq_zero_of_le`. **Kind:** lemma.

If n≤V then λ_V(n)=0.

**Hypotheses and conventions.** U,V,N,L,M,n,m,ℓ are natural numbers. Divisors are the native positive divisor finsets; n=0 has no divisors. μ is the native integer Möbius function, Λ the native real von Mangoldt function, and log is the real logarithm with its native value at zero. Write λ_V for incompleteLog V. All cutoffs are inclusive below and strict above. Ioc(a,b) means a<k≤b and is empty when b≤a. No positivity of U or V is needed for the finite identities.

**Prerequisites.** [Incomplete logarithm](#SV-2-incomplete-log); `Nat.divisor_le` (Mathlib).

**Proof route.** Every divisor in the defining sum satisfies d≤n by Nat.divisor_le.

**Acceptance.** The equality case n=V must vanish.

**Source.** [KED-ANT-18](#source-ked-ant-18), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2

<a id="SV-2-incomplete-log-bounds"></a>

### Pointwise incomplete-log coefficient bounds

**Declaration:** `SieveVaughan.incompleteLog_bounds`. **Kind:** lemma.

For every V,n, 0≤λ_V(n) and λ_V(n)≤log n.

**Hypotheses and conventions.** U,V,N,L,M,n,m,ℓ are natural numbers. Divisors are the native positive divisor finsets; n=0 has no divisors. μ is the native integer Möbius function, Λ the native real von Mangoldt function, and log is the real logarithm with its native value at zero. Write λ_V for incompleteLog V. All cutoffs are inclusive below and strict above. Ioc(a,b) means a<k≤b and is empty when b≤a. No positivity of U or V is needed for the finite identities.

**Prerequisites.** [Incomplete logarithm](#SV-2-incomplete-log); [Subtracting the short von Mangoldt divisor sum](#SV-2-incomplete-log-sub); `ArithmeticFunction.vonMangoldt_nonneg` (Mathlib).

**Proof route.** Every summand in the tail formula is nonnegative, so the finite sum is nonnegative.

**Acceptance.** For n=0 or 1 both bounds are equalities at zero.

**Source.** [KED-ANT-18](#source-ked-ant-18), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2

<a id="SV-2-moebius-incomplete-log"></a>

### Möbius inversion of the incomplete logarithm

**Declaration:** `SieveVaughan.moebius_mul_incompleteLog`. **Kind:** lemma.

(μ*λ_V)(n) equals Λ(n) if V<n and zero otherwise, where μ is cast to ArithmeticFunction ℝ and * is native Dirichlet convolution.

**Hypotheses and conventions.** U,V,N,L,M,n,m,ℓ are natural numbers. Divisors are the native positive divisor finsets; n=0 has no divisors. μ is the native integer Möbius function, Λ the native real von Mangoldt function, and log is the real logarithm with its native value at zero. Write λ_V for incompleteLog V. All cutoffs are inclusive below and strict above. Ioc(a,b) means a<k≤b and is empty when b≤a. No positivity of U or V is needed for the finite identities.

**Prerequisites.** [Incomplete logarithm](#SV-2-incomplete-log); `ArithmeticFunction.coe_moebius_mul_coe_zeta` (Mathlib).

**Proof route.** Use the local high-part h_V from the construction and the identity λ_V=h_V*ζ.

**Acceptance.** For n≤V the convolution vanishes, not Λ(n).

**Source.** [KED-ANT-18](#source-ked-ant-18), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2

<a id="SV-2-vaughan-identity"></a>

### Vaughan's identity with its boundary term

**Declaration:** `SieveVaughan.vaughan_identity`. **Kind:** theorem.

Λ(n)=1_{n≤V}Λ(n)+Σ_{b|n,b≤U}μ(b)log(n/b)−Σ_{b|n,b≤U}μ(b)Σ_{c|n/b,c≤V}Λ(c)+Σ_{b|n,U<b}μ(b)Σ_{c|n/b,V<c}Λ(c). All μ values are cast to ℝ, and n/b is exact natural division at divisor indices.

**Hypotheses and conventions.** U,V,N,L,M,n,m,ℓ are natural numbers. Divisors are the native positive divisor finsets; n=0 has no divisors. μ is the native integer Möbius function, Λ the native real von Mangoldt function, and log is the real logarithm with its native value at zero. Write λ_V for incompleteLog V. All cutoffs are inclusive below and strict above. Ioc(a,b) means a<k≤b and is empty when b≤a. No positivity of U or V is needed for the finite identities.

**Prerequisites.** [Möbius inversion of the incomplete logarithm](#SV-2-moebius-incomplete-log); [Subtracting the short von Mangoldt divisor sum](#SV-2-incomplete-log-sub); [Incomplete logarithm](#SV-2-incomplete-log); `ArithmeticFunction.mul_apply` (Mathlib); `Nat.prod_divisorsAntidiagonal` (Mathlib).

**Proof route.** Expand (μ*λ_V)(n) using native mul_apply and the generated additive companion of prod_divisorsAntidiagonal. This gives Σ_{b|n}μ(b)λ_V(n/b).

**Acceptance.** At n=V=2 the three nonboundary terms cancel to zero; the retained boundary is log 2.

**Source.** [KED-ANT-18](#source-ked-ant-18), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2

<a id="SV-2-weighted-vaughan-hyperbola"></a>

### Weighted Vaughan identity on a finite hyperbola

**Declaration:** `SieveVaughan.weighted_vaughan_hyperbola`. **Kind:** lemma.

For arbitrary w:ℕ→ℂ, Σ_{n∈Ioc(0,N)}Λ(n)w(n)=Σ_{n∈Ioc(0,min(N,V))}Λ(n)w(n)+Σ_{m∈Ioc(0,N)}μ(m)Σ_{ℓ∈Ioc(0,⌊N/m⌋)}λ_V(ℓ)w(mℓ). Real and integer coefficients are cast to ℂ.

**Hypotheses and conventions.** U,V,N,L,M,n,m,ℓ are natural numbers. Divisors are the native positive divisor finsets; n=0 has no divisors. μ is the native integer Möbius function, Λ the native real von Mangoldt function, and log is the real logarithm with its native value at zero. Write λ_V for incompleteLog V. All cutoffs are inclusive below and strict above. Ioc(a,b) means a<k≤b and is empty when b≤a. No positivity of U or V is needed for the finite identities.

**Prerequisites.** [Möbius inversion of the incomplete logarithm](#SV-2-moebius-incomplete-log); `ArithmeticFunction.mul_apply` (Mathlib); `Nat.divisorsAntidiagonal_eq_prod_filter_of_le` (Mathlib); `ArithmeticFunction.sum_Ioc_mul_eq_sum_sum` (Mathlib).

**Proof route.** Evaluate moebius-incomplete-log and separate the boundary at each n. Cast to ℂ, multiply by w(n) and sum; the boundary condition n≤V identifies Ioc(0,min(N,V)).

**Acceptance.** N=0 makes every sum empty.

**Source.** [KED-ANT-18](#source-ked-ant-18), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2

<a id="SV-2-vaughan-bilinear-support"></a>

### Exact support of the bilinear Vaughan term

**Declaration:** `SieveVaughan.vaughan_bilinear_support`. **Kind:** lemma.

If λ_V(ℓ)≠0 and mℓ≤N, then V<ℓ and m≤⌊N/(V+1)⌋.

**Hypotheses and conventions.** U,V,N,L,M,n,m,ℓ are natural numbers. Divisors are the native positive divisor finsets; n=0 has no divisors. μ is the native integer Möbius function, Λ the native real von Mangoldt function, and log is the real logarithm with its native value at zero. Write λ_V for incompleteLog V. All cutoffs are inclusive below and strict above. Ioc(a,b) means a<k≤b and is empty when b≤a. No positivity of U or V is needed for the finite identities.

**Prerequisites.** [Vanishing below the incomplete-log cutoff](#SV-2-incomplete-log-support).

**Proof route.** Contraposition of incomplete-log-support gives V<ℓ, hence V+1≤ℓ.

**Acceptance.** No converse is claimed: lying in this region does not imply a nonzero coefficient.

**Source.** [KED-ANT-18](#source-ked-ant-18), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2

<a id="SV-2-vaughan-type-i-ii"></a>

### Finite Type I–Type II Vaughan decomposition

**Declaration:** `SieveVaughan.vaughan_typeI_typeII`. **Kind:** theorem.

Put B=⌊N/(V+1)⌋. For arbitrary w:ℕ→ℂ, Σ_{0<n≤N}Λ(n)w(n)=Σ_{0<n≤min(N,V)}Λ(n)w(n)+Σ_{0<m≤min(U,B)}μ(m)Σ_{V<ℓ≤⌊N/m⌋}λ_V(ℓ)w(mℓ)+Σ_{U<m≤B}μ(m)Σ_{V<ℓ≤⌊N/m⌋}λ_V(ℓ)w(mℓ).

**Hypotheses and conventions.** U,V,N,L,M,n,m,ℓ are natural numbers. Divisors are the native positive divisor finsets; n=0 has no divisors. μ is the native integer Möbius function, Λ the native real von Mangoldt function, and log is the real logarithm with its native value at zero. Write λ_V for incompleteLog V. All cutoffs are inclusive below and strict above. Ioc(a,b) means a<k≤b and is empty when b≤a. No positivity of U or V is needed for the finite identities.

**Prerequisites.** [Weighted Vaughan identity on a finite hyperbola](#SV-2-weighted-vaughan-hyperbola); [Exact support of the bilinear Vaughan term](#SV-2-vaughan-bilinear-support); [Vanishing below the incomplete-log cutoff](#SV-2-incomplete-log-support).

**Proof route.** Start with weighted-vaughan-hyperbola. Remove ℓ≤V by incomplete-log-support; every removed summand is zero.

**Acceptance.** Both degenerate regimes U≥B (empty Type II) and V≥N (boundary only) are included.

**Source.** [KED-ANT-18](#source-ked-ant-18), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2

<a id="SV-2-vaughan-coefficient-energy"></a>

### Elementary Vaughan coefficient energies

**Declaration:** `SieveVaughan.vaughan_coefficient_energy`. **Kind:** lemma.

For L≤M, Σ_{ℓ∈Ioc(L,M)}λ_V(ℓ)²≤(M−L)(log M)² and Σ_{m∈Ioc(L,M)}(μ(m):ℝ)²≤M−L.

**Hypotheses and conventions.** U,V,N,L,M,n,m,ℓ are natural numbers. Divisors are the native positive divisor finsets; n=0 has no divisors. μ is the native integer Möbius function, Λ the native real von Mangoldt function, and log is the real logarithm with its native value at zero. Write λ_V for incompleteLog V. All cutoffs are inclusive below and strict above. Ioc(a,b) means a<k≤b and is empty when b≤a. No positivity of U or V is needed for the finite identities.

**Prerequisites.** [Pointwise incomplete-log coefficient bounds](#SV-2-incomplete-log-bounds); `Real.log_le_log` (Mathlib); `ArithmeticFunction.abs_moebius_le_one` (Mathlib); `Nat.card_Ioc` (Mathlib).

**Proof route.** If M=0 then L=0 and both sums are empty. Otherwise each index is positive and at most M.

**Acceptance.** At L=M both energies are zero.

**Source.** [KED-ANT-18](#source-ked-ant-18), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2

<a id="SV-2-dyadic-primitive-energy"></a>

### Primitive character energy on a dyadic band

**Declaration:** `SieveCharacters.dyadic_primitive_energy`. **Kind:** lemma.

Σ_{P<q≤2P}φ(q)⁻¹Σχ*|Aχ|² ≤ ((H+8P²)/P)E_a.

**Hypotheses and conventions.** M,N are arbitrary integers; H,K are natural interval lengths; a:Fin H→ℂ and b:Fin K→ℂ are arbitrary. Write Aχ=Σ_{j<H}a_jχ(M+j+1), Bχ=Σ_{j<K}b_jχ(N+j+1), E_a=Σ|a_j|² and E_b=Σ|b_j|². Character values use the native residue cast. φ(q) is the native totient. Every character sum is over primitive Dirichlet characters modulo the positive integer q. Write T(R,Q)=Σ_{R<q≤Q}φ(q)⁻¹Σχ*|Aχ||Bχ|; this is display notation, not a new carrier or bound predicate. Empty intervals and zero coefficients are allowed. P is a positive natural number.

**Prerequisites.** [Primitive-character large sieve](#SV-2-primitive-large-sieve); `Nat.totient_pos` (Mathlib).

**Proof route.** For each q>P, φ(q)>0 and 1/φ(q)≤q/(Pφ(q)). Multiply by the nonnegative primitive character energy.

**Acceptance.** At H=0 the energy is zero for every P and M.

**Source.** [KED-ANT-18](#source-ked-ant-18), §18.1, Theorem 18.3 proof: large-r dyadic block estimates and their summation, after (18.1.2)

<a id="SV-2-dyadic-primitive-bilinear"></a>

### Bilinear primitive character bound on one band

**Declaration:** `SieveCharacters.dyadic_primitive_bilinear`. **Kind:** theorem.

T(P,2P) ≤ P⁻¹√(H+8P²)√(K+8P²)√E_a√E_b.

**Hypotheses and conventions.** M,N are arbitrary integers; H,K are natural interval lengths; a:Fin H→ℂ and b:Fin K→ℂ are arbitrary. Write Aχ=Σ_{j<H}a_jχ(M+j+1), Bχ=Σ_{j<K}b_jχ(N+j+1), E_a=Σ|a_j|² and E_b=Σ|b_j|². Character values use the native residue cast. φ(q) is the native totient. Every character sum is over primitive Dirichlet characters modulo the positive integer q. Write T(R,Q)=Σ_{R<q≤Q}φ(q)⁻¹Σχ*|Aχ||Bχ|; this is display notation, not a new carrier or bound predicate. Empty intervals and zero coefficients are allowed. P is a positive natural number.

**Prerequisites.** [Primitive character energy on a dyadic band](#SV-2-dyadic-primitive-energy); `Real.sum_mul_le_sqrt_mul_sqrt` (Mathlib); `Real.sqrt_mul` (Mathlib); `Real.sq_sqrt` (Mathlib); `Real.sqrt_nonneg` (Mathlib); `Real.sqrt_le_sqrt` (Mathlib).

**Proof route.** Flatten the finite family of pairs (q,χ), P<q≤2P and χ primitive. Apply real finite Cauchy–Schwarz to the entries |Aχ|/√φ(q) and |Bχ|/√φ(q).

**Acceptance.** Setting b=a and K=H, N=M gives the same one-band energy bound.

**Source.** [KED-ANT-18](#source-ked-ant-18), §18.1, Theorem 18.3 proof: large-r dyadic block estimates and their summation, after (18.1.2)

<a id="SV-2-dyadic-modulus-partition"></a>

### Exact partition of the dyadic modulus interval

**Declaration:** `SieveCharacters.dyadic_modulus_partition`. **Kind:** lemma.

For R,J∈ℕ and arbitrary c:ℕ→ℝ, Σ_{R<q≤R2^J}c(q)=Σ_{i=0}^{J−1}Σ_{R2^i<q≤2R2^i}c(q).

**Hypotheses and conventions.** R and J are natural numbers, including zero. The real coefficient c may have either sign. Every interval is lower-open and upper-closed.

**Prerequisites.** `Finset.prod_Ioc_consecutive` (Mathlib).

**Proof route.** Use the generated additive companion of the indexed prod_Ioc_consecutive, or specialize that indexed statement to Multiplicative ℝ. This supplies the already built adjacent-interval sum identity.

**Acceptance.** At R=2,J=2 a point mass at q=4 contributes exactly once.

**Source.** [KED-ANT-18](#source-ked-ant-18), §18.1, Theorem 18.3 proof: large-r dyadic block estimates and their summation, after (18.1.2)

<a id="SV-2-dyadic-bilinear-kernel"></a>

### Finite sum of the bilinear dyadic coefficients

**Declaration:** `SieveCharacters.dyadic_bilinear_kernel`. **Kind:** lemma.

For real R>0, H,K≥0 and natural J, put P_i=R2^i. Then Σ_{i<J}√(H+8P_i²)√(K+8P_i²)/P_i ≤ 9R(2^J−1)+3J(√H+√K)+(2/R)(1−2^(−J))√H√K.

**Hypotheses and conventions.** R is a positive real number; H and K are nonnegative real numbers; J is natural, including zero. The reciprocal power is 2^(−J)=(1/2)^J, never natural subtraction in an exponent.

**Prerequisites.** `Real.sqrt_le_iff` (Mathlib); `Real.sq_sqrt` (Mathlib); `Real.sqrt_nonneg` (Mathlib); `geom_sum_eq` (Mathlib).

**Proof route.** For any P>0 and X≥0, square the nonnegative proposed upper bound √X+3P to prove √(X+8P²)≤√X+3P. This is deliberately weaker than using √8.

**Acceptance.** At H=K=0, R=2,J=3 the left side is 112; the displayed upper bound is 126.

**Source.** [KED-ANT-18](#source-ked-ant-18), §18.1, Theorem 18.3 proof: large-r dyadic block estimates and their summation, after (18.1.2)

<a id="SV-2-primitive-bilinear-dyadic-tail"></a>

### Primitive bilinear tail through a dyadic endpoint

**Declaration:** `SieveCharacters.primitive_bilinear_dyadic_tail`. **Kind:** theorem.

For R>0 and J∈ℕ, T(R,R2^J) ≤ [9R(2^J−1)+3J(√H+√K)+(2/R)(1−2^(−J))√H√K]√E_a√E_b.

**Hypotheses and conventions.** M,N are arbitrary integers; H,K are natural interval lengths; a:Fin H→ℂ and b:Fin K→ℂ are arbitrary. Write Aχ=Σ_{j<H}a_jχ(M+j+1), Bχ=Σ_{j<K}b_jχ(N+j+1), E_a=Σ|a_j|² and E_b=Σ|b_j|². Character values use the native residue cast. φ(q) is the native totient. Every character sum is over primitive Dirichlet characters modulo the positive integer q. Write T(R,Q)=Σ_{R<q≤Q}φ(q)⁻¹Σχ*|Aχ||Bχ|; this is display notation, not a new carrier or bound predicate. Empty intervals and zero coefficients are allowed. R is a positive natural number and J is any natural number. Every power and scalar factor on the right is interpreted in ℝ.

**Prerequisites.** [Exact partition of the dyadic modulus interval](#SV-2-dyadic-modulus-partition); [Bilinear primitive character bound on one band](#SV-2-dyadic-primitive-bilinear); [Finite sum of the bilinear dyadic coefficients](#SV-2-dyadic-bilinear-kernel).

**Proof route.** In the exact partition set c(q)=φ(q)⁻¹Σχ*|Aχ||Bχ| for q>0, and c(0)=0. No character family at modulus zero needs to be summed.

**Acceptance.** The empty-scale case is equality at zero, not an asymptotic exception.

**Source.** [KED-ANT-18](#source-ked-ant-18), §18.1, Theorem 18.3 proof: large-r dyadic block estimates and their summation, after (18.1.2)

<a id="SV-2-primitive-bilinear-cutoff"></a>

### Primitive bilinear tail at an arbitrary cutoff

**Declaration:** `SieveCharacters.primitive_bilinear_cutoff`. **Kind:** theorem.

If R>0 and Q≤R2^J≤2Q, then T(R,Q) ≤ [18Q+3J(√H+√K)+(2/R)√H√K]√E_a√E_b.

**Hypotheses and conventions.** M,N are arbitrary integers; H,K are natural interval lengths; a:Fin H→ℂ and b:Fin K→ℂ are arbitrary. Write Aχ=Σ_{j<H}a_jχ(M+j+1), Bχ=Σ_{j<K}b_jχ(N+j+1), E_a=Σ|a_j|² and E_b=Σ|b_j|². Character values use the native residue cast. φ(q) is the native totient. Every character sum is over primitive Dirichlet characters modulo the positive integer q. Write T(R,Q)=Σ_{R<q≤Q}φ(q)⁻¹Σχ*|Aχ||Bχ|; this is display notation, not a new carrier or bound predicate. Empty intervals and zero coefficients are allowed. R,Q,J are natural numbers with R>0 and Q≤R2^J≤2Q. These explicit cover and size hypotheses replace a hidden logarithmic rounding convention.

**Prerequisites.** [Primitive bilinear tail through a dyadic endpoint](#SV-2-primitive-bilinear-dyadic-tail).

**Proof route.** Use the positivity of every modulus contribution to enlarge (R,Q] to (R,R2^J], rather than discarding the last partial band.

**Acceptance.** R=2,Q=5,J=2 satisfies the hypotheses and keeps q=5 in the partial last band; J=1 fails the cover condition.

**Source.** [KED-ANT-18](#source-ked-ant-18), §18.1, Theorem 18.3 proof: large-r dyadic block estimates and their summation, after (18.1.2)

<a id="SV-2-squared-matrix-duality"></a>

### Squared finite large-sieve duality

**Declaration:** `SieveDuality.squared_matrix_duality`. **Kind:** theorem.

For finite index sets I,J, a complex matrix A and C≥0, the inequality Σ_i |Σ_j A_ij a_j|²≤CΣ_j|a_j|² for every a is equivalent to Σ_j |Σ_i conjugate(A_ij)b_i|²≤CΣ_i|b_i|² for every b. The conjugate is essential; C is the squared norm bound.

**Hypotheses and conventions.** I,J finite; C≥0.

**Prerequisites.** `ContinuousLinearMap.adjoint` (Mathlib).

**Proof route.** Realize the finite matrix as a continuous map between native finite l² spaces.

**Source.** [KED-chap-largesieve](#source-ked-chap-largesieve), Lemma 15.4, §15.1 (HTML, no printed page numbers)

<a id="SV-2-sharp-additive-large-sieve"></a>

### Sharp separated additive large sieve

**Declaration:** `SieveTaper.sharp_additive_largeSieve`. **Kind:** theorem.

For N≥1, δ>0 with δ≤1/2, distinct frequencies x_i separated modulo 1 by at least δ, and a_j on an interval of N consecutive integers, Σ_i |Σ_{j=1}^N a_j exp(2πi(M+j)x_i)|²≤(N−1+δ⁻¹)Σ_j|a_j|². The empty coefficient interval is handled separately by zero, not by extending a negative constant.

**Hypotheses and conventions.** N≥1; 0<δ≤1/2; finite frequency family; circular separation.

**Prerequisites.** [Squared finite large-sieve duality](#SV-2-squared-matrix-duality); [Bombieri's additive large sieve](#SV-2-additive-large-sieve); [Separated Hilbert inequality](#SV-2-separated-hilbert-inequality).

**Proof route.** Use the Hilbert inequality to control the off-diagonal geometric kernel, retaining both endpoints of the interval.

**Source.** [KED-chap-largesieve](#source-ked-chap-largesieve), Theorem 15.5, §15.2; Exercises 15.4.2 and 15.4.4 (HTML)

**Open proof inputs.** [Sharp Hilbert and additive large-sieve proofs](#g-sharp).

<a id="SV-2-quadratic-large-sieve"></a>

### Heath-Brown quadratic large sieve

**Declaration:** `SieveQuadratic.quadratic_largeSieve`. **Kind:** theorem.

For each ε>0 there is Cε>0 such that for integers M,N≥1 and arbitrary complex a_n, Σ_{1≤m≤M, m odd squarefree}|Σ_{1≤n≤N, n odd squarefree}a_n (n/m)|²≤Cε(MN)^ε(M+N)Σ_{n odd squarefree≤N}|a_n|². Both squarefree restrictions are part of this theorem.

**Hypotheses and conventions.** ε>0; M,N≥1; native Jacobi symbol at positive odd denominator.

**Prerequisites.** `jacobiSym` (Mathlib); [Squared finite large-sieve duality](#SV-2-squared-matrix-duality).

**Proof route.** Use the quadratic-symbol-specific reciprocity/Poisson iteration of Heath-Brown, not generic character orthogonality.

**Source.** [HB-REAL-95](#source-hb-real-95), Theorem 1, p.237; proof outline §2, pp.240–242

**Open proof inputs.** [Heath-Brown quadratic mean-value proof](#g-quadratic).

<a id="SV-2-quadratic-bilinear"></a>

### Heath-Brown quadratic bilinear estimate

**Declaration:** `SieveQuadratic.quadratic_bilinear`. **Kind:** theorem.

For each ε>0 there is Cε>0 such that M,N≥1 and complex coefficients with |a_m|,|b_n|≤1 satisfy |Σ_{m≤M,m odd}Σ_{n≤N} a_m b_n (n/m)|≤Cε(MN)^ε(M√N+√M N). Here squarefree restrictions have been removed using square-part decomposition; denominator m remains odd.

**Hypotheses and conventions.** ε>0; M,N≥1; coefficient sup norms at most 1.

**Prerequisites.** [Heath-Brown quadratic large sieve](#SV-2-quadratic-large-sieve); `jacobiSym` (Mathlib).

**Proof route.** Split numerator and denominator into square and squarefree parts as in the source Corollary 4 proof.

**Source.** [HB-REAL-95](#source-hb-real-95), Corollary 4, p.238; proof §9, pp.274–275

**Open proof inputs.** [Heath-Brown quadratic mean-value proof](#g-quadratic).

<a id="SV-2-prime-denominator-symbol"></a>

### Prime-denominator quadratic symbol

**Declaration:** `SieveQuadratic.primeDenominatorSymbol`. **Kind:** definition.

Define symbol₂(a,p) to be the native Jacobi symbol (a/p) for odd p; at p=2 it is 0 when a is even and 1 when a is odd. This is the convention of Skorobogatov–Sofos, not the Kronecker symbol at 2.

**Hypotheses and conventions.** Integer a; natural p; arithmetic applications assume p prime.

**Prerequisites.** `jacobiSym` (Mathlib).

**Proof route.** Use the native symbol off 2 and an explicit parity branch at 2.

**API.**

- `SieveQuadratic.primeDenominatorSymbol_odd` (compatibility): At an odd prime it equals the native Jacobi/Legendre symbol.
- `SieveQuadratic.primeDenominatorSymbol_two` (simp): At 2 it is the indicator that the numerator is odd.
- `SieveQuadratic.primeDenominatorSymbol_abs_le_one` (other): Absolute value is at most 1 at every prime.
- `SieveQuadratic.primeDenominatorSymbol_mul` (relation): For prime p, symbol₂(ab,p)=symbol₂(a,p)symbol₂(b,p).

**Unit tests.**

- `prime_symbol_two_odd`: symbol₂(3,2)=1 whereas the Kronecker value is −1.
- `prime_symbol_two_even`: symbol₂(6,2)=0.
- `prime_symbol_odd_nonsquare`: symbol₂(2,3)=−1.
- `prime_symbol_odd_zero`: symbol₂(9,3)=0.

**Source.** [SS-23](#source-ss-23), Lemma 6.3 and the preceding convention, §6, pp.725–726

<a id="SV-2-prime-quadratic-bilinear"></a>

### Prime quadratic-symbol bilinear estimate

**Declaration:** `SieveQuadratic.prime_quadratic_bilinear`. **Kind:** theorem.

For ε>0 there is Cε>0 such that K,L≥1 and arbitrary complex coefficients a_k,b_p satisfy |Σ_{k≤K}Σ_{p≤L,p prime}a_k b_p symbol₂(k,p)|≤Cε sup_{k≤K}|a_k| sup_{p≤L,p prime}|b_p| ((KL)^(1+ε)/√min(K,L)+K). Suprema on empty sets are 0. The additive K term covers p=2.

**Hypotheses and conventions.** ε>0; K,L≥1; finite restricted sup norms.

**Prerequisites.** [Heath-Brown quadratic bilinear estimate](#SV-2-quadratic-bilinear); [Prime-denominator quadratic symbol](#SV-2-prime-denominator-symbol).

**Proof route.** Apply the odd-denominator bilinear estimate with M=L,N=K and the prime indicator on denominators.

**Source.** [SS-23](#source-ss-23), Lemma 6.3, pp.725–726

**Open proof inputs.** [Heath-Brown quadratic mean-value proof](#g-quadratic).

<a id="SV-2-real-discriminant-character"></a>

### Real discriminant character

**Declaration:** `SieveQuadratic.discriminantCharacter`. **Kind:** definition.

For integer D and natural n>0 write n=2^v u with u odd. Define χ_D(n)=χ₂(D)^v jacobiSym(D,u), where χ₂(D)=1 for D≡1,7 mod8, −1 for D≡3,5 mod8, and 0 otherwise; put χ_D(0)=0. For nonzero D≡0,1 mod4 this is the real Dirichlet character attached to the discriminant D; D need not be fundamental.

**Hypotheses and conventions.** D integer; character comparison assumes D≠0 and D≡0 or1 mod4.

**Prerequisites.** `jacobiSym` (Mathlib); `Nat.factorization` (Mathlib).

**Proof route.** Split the natural argument by its native prime factorization at 2; evaluate the odd part with Mathlib and the dyadic part by the explicit mod-eight function.

**API.**

- `SieveQuadratic.discriminantCharacter_zero` (simp): Value at 0 is 0.
- `SieveQuadratic.discriminantCharacter_odd` (compatibility): For positive odd n, χ_D(n)=jacobiSym(D,n).
- `SieveQuadratic.discriminantCharacter_mul` (relation): χ_D is multiplicative on natural arguments.
- `SieveQuadratic.discriminantCharacter_abs_le_one` (other): The absolute value is at most 1.
- `SieveQuadratic.discriminantCharacter_periodic` (relation): For D≠0,D≡0,1 mod4 it has period |D|.

**Unit tests.**

- `discriminant_five_at_two`: χ_5(2)=−1.
- `discriminant_eight_at_two`: χ_8(2)=0.
- `discriminant_eight_at_three`: χ_8(3)=−1.
- `discriminant_zero_argument`: χ_5(0)=0, unlike native Jacobi at zero denominator.

**Source.** [JUTILA-ORIGINAL](#source-jutila-original), Notation preceding Theorem 1, p.192; Lemma 3, p.194

<a id="SV-2-jutila-real-character-mean"></a>

### Jutila mean value lemma

**Declaration:** `SieveQuadratic.jutila_real_character_mean`. **Kind:** theorem.

There is an absolute C>0 such that X≥3,N≥2 and complex a_1,…,a_N satisfy Σ_{|D|≤X, D≡0,1 mod4, D not a square}|Σ_{n=1}^N a_n χ_D(n)|²≤C[X Σ_{m,n≤N,mn a square}|a_m a_n|+√X N^(7/4)(Σ_{n≤N}|a_n|⁸)^(1/4)(log N)^5]. The discriminants are not restricted to fundamental discriminants.

**Hypotheses and conventions.** Integer X≥3,N≥2; all non-square discriminants in the indicated interval.

**Prerequisites.** [Real discriminant character](#SV-2-real-discriminant-character); `jacobiSym.quadratic_reciprocity` (Mathlib).

**Proof route.** Expand the square and retain the exact square-product diagonal.

**Source.** [JUTILA-ORIGINAL](#source-jutila-original), Lemma 3, equation (12), and proof (13)–(17), pp.194–195

**Open proof inputs.** [Jutila auxiliary mean-square input](#g-jutila).

<a id="SV-2-smith-prime-legendre-bilinear"></a>

### Smith prime Legendre-symbol estimate

**Declaration:** `SieveQuadratic.smith_prime_legendre_bilinear`. **Kind:** theorem.

For ε>0 there is Cε>0 such that disjoint finite sets X₁,X₂ of odd primes bounded by t₁,t₂≥2 satisfy Σ_{p∈X₁}|Σ_{q∈X₂} jacobiSym(p,q)|≤Cε[t₁ t₂^(3/4+ε)+t₂ t₁^(3/4+ε)].

**Hypotheses and conventions.** Disjoint sets of odd primes; t₁,t₂≥2; ε>0.

**Prerequisites.** [Jutila mean value lemma](#SV-2-jutila-real-character-mean); `jacobiSym.quadratic_reciprocity` (Mathlib).

**Proof route.** Specialize Jutila to coefficients supported on X₂, with arbitrary signs. The square-product diagonal is then exactly Σ|a_q|².

**Source.** [SMITH-17](#source-smith-17), Proposition 6.6 and proof, printed p.62; Koymans–Pagano §7.2, Proposition 7.6, equation (7.11), p.63

**Open proof inputs.** [Jutila auxiliary mean-square input](#g-jutila).

<a id="SV-2-binary-convex-large-sieve"></a>

### Binary-form large sieve on convex domains

**Declaration:** `SieveBinary.binary_convex_largeSieve`. **Kind:** theorem.

For a planar domain in L(C_l,θ), area A≥1 and radius R>0, θ∈(0,2], and 2≤z≤min((A/R^θ)^(1/5),A^(1/4)), the number of integer points with positive Q-value and no prime p<z dividing that value is at most C A∏_{deg Q<p<z}(1−ρ_Q(p)/p²). C depends only on degree and C_l. This safe-cutoff version uses p<z consistently; the paper’s wider A^(1/2) range is an explicit gap until its lcm discrepancy step is justified.

**Hypotheses and conventions.** Q mod p nonzero for every p<z; L-domain input; θ≤2; safe lcm cutoff z²≤√A.

**Prerequisites.** [Binary polynomial local densities](#SV-0-binary-local-densities); [Binary Schwartz–Zippel specialization](#SV-0-binary-schwartz-zippel); [Binary sieve Euler denominator](#SV-1-binary-euler-denominator); [Bombieri–Selberg Gram-row inequality](#SV-2-bombieri-selberg); `GeometryOfNumbersAndQuadraticArithmetic:GN.4`.

**Proof route.** Apply the generic finite Gram-row sieve to the two-dimensional residue characters, with squarefree moduli at most z.

**Source.** [KHAYUTIN-19](#source-khayutin-19), Lemma 9.9 and proof (38), pp.224–225

**Open proof inputs.** [Curvature-uniform lattice discrepancy](#g-domain).

<a id="SV-2-polynomial-farey-coefficients"></a>

### Polynomial Farey coefficient adapter

**Declaration:** `SievePolynomialVector.fareyCoefficient`. **Kind:** construction.

For prime p, monic H of degree ℓ and degG<ℓ, define c_j(G/H) as the coefficient of U^j in [Σ_(0≤i<ℓ)G_(ℓ−1−i)U^i]·(H.reverse(U))⁻¹. The unit constant coefficient of the reversed monic denominator is one. c_j is the coefficient of T^(−j−1) in G/H at infinity, and ψ_p(T^jG/H)=exp(2πi c_j.val/p). Use native Polynomial and PowerSeries.

**Hypotheses and conventions.** Monic H; deg G<ℓ, allowing G=0; prime p.

**Prerequisites.** `Polynomial` (Mathlib); `PowerSeries.coeff` (Mathlib); `PowerSeries.invOfUnit` (Mathlib); `Polynomial.reverse` (Mathlib).

**Proof route.** Reverse the denominator at its native degree and shift the numerator to the fixed denominator degree. Use invOfUnit with unit one; no new Laurent-series field is needed for this finite coefficient adapter.

**API.**

- `SievePolynomialVector.fareyCoefficient` (constructor): The displayed native power-series coefficient.
- `SievePolynomialVector.fareyCoefficient_zero` (simp): Zero numerator gives every coefficient zero.
- `SievePolynomialVector.fareyCoefficient_first` (characterisation): For monic H of positive degree ℓ, c₀=G_(ℓ−1).
- `SievePolynomialVector.fareyCoefficient_add` (compatibility): It is additive in the numerator.
- `SievePolynomialVector.fareyCoefficient_recurrence` (characterisation): For monic H the reciprocal recurrence determines each coefficient beyond the prescribed initial terms.
- `SievePolynomialVector.fareyCoefficient_residue` (compatibility): The j-th coefficient agrees with the native Laurent residue when that supplier interface is available.

**Unit tests.**

- `farey_variable`: For p=2,G=1,H=T, c₀=1 and c₁=0.
- `farey_inverse_one_plus`: For p=3,G=1,H=T+1, c₀=1 and c₁=−1.
- `farey_zero`: G=0 makes all coefficients zero, including denominator degree zero.
- `farey_degree_shift`: For G=1,H=T², c₀=0 and c₁=1; reversing G at its own degree would give the wrong shift.

**Source.** [BSKK-23](#source-bskk-23), §6.1 and Lemma 6.2, pp.31–33

**Open proof inputs.** [Native polynomial Farey residue comparison](#g-farey).

<a id="SV-2-polynomial-farey-large-sieve"></a>

### Polynomial Farey large sieve

**Declaration:** `SievePolynomialVector.polynomial_farey_large_sieve`. **Kind:** theorem.

For prime p, m,ℓ≥0 with 2ℓ≥m, and nonnegative f_j:F_p→R, Σ_(H monic degℓ)Σ_(degG<ℓ,(G,H)=1)∏_(j<m)f_j(c_j(G/H))≤p^(2ℓ−m)∏_(j<m)Σξ∈F_p f_j(ξ). This finite-field formulation is exactly the R/Z test-function statement after evaluating at ξ.val/p.

**Hypotheses and conventions.** Prime p; all f_j nonnegative; 2ℓ≥m; denominators monic and coprime numerator.

**Prerequisites.** [Polynomial Farey coefficient adapter](#SV-2-polynomial-farey-coefficients); `FiniteFieldsAndCharacterSums:FF.1`.

**Proof route.** Distinct reduced fractions of denominator degree ℓ differ at some coefficient before index2ℓ; otherwise GH′−G′H would have incompatible degree. Thus each initial m-coefficient word occurs at most p^(2ℓ−m) times.

**Source.** [BSKK-23](#source-bskk-23), Lemma 6.2, pp.32–33

**Open proof inputs.** [Native polynomial Farey residue comparison](#g-farey).

<a id="SV-2-bskk-additive-large-sieve"></a>

### Additive sieve for bounded integer coefficients

**Declaration:** `SievePolynomialVector.bskk_additive_large_sieve`. **Kind:** theorem.

For H,Y≥1 and complex a_n supported on integers −H≤n≤H, Σ_(1≤q≤Y)Σ_(a modq,(a,q)=1)|Σ_(|n|≤H)a_n exp(2πian/q)|²≤3(H+Y²)Σ|a_n|². The bound follows from the inherited H_interval+2Y² sieve with interval length2H+1.

**Hypotheses and conventions.** H,Y positive integers; primitive rational phases; arbitrary complex coefficients.

**Prerequisites.** [Additive large sieve over reduced residues](#SV-2-reduced-fraction-large-sieve).

**Proof route.** Apply the separated reduced-fraction inequality on an integer interval of length2H+1. Since H≥1,2H+1+2Y²≤3(H+Y²).

**Source.** [BSKK-23](#source-bskk-23), Equation (3.5) in the proof of Lemma 3.7, p.26

<a id="SV-2-sharp-primitive-large-sieve"></a>

### Sharp primitive-character large sieve

**Declaration:** `SieveApplications.sharp_primitive_largeSieve`. **Kind:** theorem.

For a complex sequence supported on H consecutive integers, H≥1, and Q≥1, Σ_(q≤Q)q/φ(q)Σ_(χ primitive modq)|Σ_n a_nχ(n)|²≤(H−1+Q²)Σ_n|a_n|².

**Hypotheses and conventions.** H,Q≥1; primitive characters; integer interval.

**Prerequisites.** [Sharp separated additive large sieve](#SV-2-sharp-additive-large-sieve); [Squared norm of a primitive Dirichlet Gauss sum](#SV-2-primitive-gauss-norm); [Parseval identity over Dirichlet characters](#SV-2-character-parseval).

**Proof route.** Reduced rational phases up to Q are Q⁻²-separated. Use the sharp additive theorem and the native Gauss expansion, then character Parseval.

**Source.** [KED-ANT-16](#source-ked-ant-16), Theorem 16.2, §16.2

**Open proof inputs.** [Sharp Hilbert and additive large-sieve proofs](#g-sharp).

<a id="SV-2-forbidden-residue-large-sieve"></a>

### Large sieve for forbidden residues

**Declaration:** `SieveApplications.forbidden_residue_largeSieve`. **Kind:** theorem.

Let finite prime set P have forbidden Ω_p⊆F_p, |Ω_p|<p. Suppose a_n vanishes on every forbidden residue and is supported on H consecutive integers. Put h(d)=μ²(d)∏_(p|d,p∈P)|Ω_p|/(p−|Ω_p|), zero if any prime factor is outside P, and J(Q)=Σ_(d≤Q)h(d). Then J(Q)|Σa_n|²≤(H−1+Q²)Σ|a_n|². The multiplied form includes J=0.

**Hypotheses and conventions.** Support actually avoids forbidden residues; squarefree moduli; Q,H≥1.

**Prerequisites.** [Sharp separated additive large sieve](#SV-2-sharp-additive-large-sieve); `ZMod` (Mathlib); `Finset` (Mathlib).

**Proof route.** For one prime, sum over allowed residue totals and apply Cauchy; finite additive orthogonality gives the missing nontrivial-phase energy.

**Source.** [KED-ANT-16](#source-ked-ant-16), Theorem 16.4 and Lemma 16.5, §16.3

**Open proof inputs.** [Sharp Hilbert and additive large-sieve proofs](#g-sharp).

<a id="SV-2-least-quadratic-nonresidue"></a>

### Least quadratic nonresidue

**Declaration:** `SieveApplications.leastNonresidue`. **Kind:** definition.

For odd prime p, q(p) is the least integer n≥1 with Jacobi(n,p)=−1; set q(p)=0 when p is not an odd prime. Divisible integers have symbol0 and are not nonresidues.

**Hypotheses and conventions.** Odd prime domain; explicit value outside it.

**Prerequisites.** `jacobiSym` (Mathlib); `Nat.find` (Mathlib).

**Proof route.** Use finite-field quadratic-character nontriviality to obtain existence, then native Nat.find. Do not include zero as a nonresidue.

**API.**

- `SieveApplications.leastNonresidue` (constructor): The least positive symbol−1 value, or0 outside odd primes.
- `SieveApplications.leastNonresidue_spec` (characterisation): At odd prime p it is positive and has symbol−1.
- `SieveApplications.leastNonresidue_min` (relation): All positive n below it have symbol different from−1.
- `SieveApplications.leastNonresidue_lt` (relation): q(p)<p at an odd prime.
- `SieveApplications.leastNonresidue_invalid` (simp): It is0 outside odd primes.

**Unit tests.**

- `nonresidue_three`: q(3)=2.
- `nonresidue_seven`: q(7)=3, since2 is a residue.
- `nonresidue_two`: q(2)=0 by the declared outside-domain convention.
- `nonresidue_zero_symbol`: 3 is not a nonresidue modulo3.

**Source.** [KED-ANT-16](#source-ked-ant-16), Definition 16.6, §16.3

<a id="SV-2-linnik-exceptional-nonresidues"></a>

### Linnik bounded exceptional primes

**Declaration:** `SieveApplications.linnik_exceptional`. **Kind:** theorem.

For each ε>0 there is C_ε such that for every N≥2, #{odd primes p≤N:q(p)>N^ε}≤C_ε.

**Hypotheses and conventions.** ε>0; odd primes; constant independent of N.

**Prerequisites.** [Least quadratic nonresidue](#SV-2-least-quadratic-nonresidue); [Large sieve for forbidden residues](#SV-2-forbidden-residue-large-sieve); `AnalyticNumberTheory:AN.5`.

**Proof route.** Apply the forbidden-residue sieve to smooth numbers, not to every integer in the interval. Numbers divisible by p have symbol0 and must be removed from that prime’s allowed support or handled with a corrected set.

**Source.** [KED-ANT-16](#source-ked-ant-16), Theorem 16.7 and proof, §16.3

**Open proof inputs.** [Multiplicity-safe smooth counts for Linnik](#g-linnik).

<a id="SV-2-separated-hilbert-inequality"></a>

### Separated Hilbert inequality

**Declaration:** `SieveDuality.separated_hilbert_inequality`. **Kind:** theorem.

For a finite family of real λ_i with |λ_i−λ_j|≥δ>0 for i≠j and complex z_i, the absolute value of Σ_(i≠j) z_i conjugate(z_j)/(λ_i−λ_j) is at most (π/δ)Σ_i|z_i|².

**Hypotheses and conventions.** Positive δ; separation on all distinct indices; empty and singleton families are included.

**Prerequisites.** `Complex.normSq` (Mathlib).

**Proof route.** Prove the separated Hilbert-transform norm bound of Exercise15.4.2, then apply Cauchy–Schwarz. Its proof is a recorded gap; squared matrix duality alone supplies no Hilbert constant.

**Source.** [KED-chap-largesieve](#source-ked-chap-largesieve), Lemma15.1 and Exercise15.4.2,§15.2 and§15.4 (live author HTML, unpaginated)

**Open proof inputs.** [Sharp Hilbert and additive large-sieve proofs](#g-sharp).

<a id="SV-2-koymans-pagano-row-mean"></a>

### Koymans–Pagano normalized row mean

**Declaration:** `SieveQuadratic.koymans_pagano_row_mean`. **Kind:** theorem.

Fix c₂,c₄,a>0. For every ε>0 there is C>0 such that finite disjoint odd-prime sets X₁,X₂ bounded by 3≤t₁≤t₂, with log t₂≤t₁^c₂ and |X_i|≥a t_i/(log t_i)^c₄ for i=1,2, satisfy Σ_(p∈X₁)|Σ_(q∈X₂)(p/q)|≤C|X₁||X₂| t₁^(−1/4+c₂c₄+ε). The constant depends only on c₂,c₄,a,ε. This is the normalized form of the routed equation(7.11); it does not include the consumer’s prebox equidistribution induction.

**Hypotheses and conventions.** All c₂,c₄,a,ε positive; disjoint odd-prime sets; the displayed growth and lower-cardinality conditions.

**Prerequisites.** [Smith prime Legendre-symbol estimate](#SV-2-smith-prime-legendre-bilinear).

**Proof route.** Since t₁≤t₂, the Smith bound is O_ε(t₂t₁^(3/4+ε/2)).

**Acceptance.** An exponentially large t₂ is allowed; no logarithm in t₂ may be absorbed into a t₁^ε factor without the explicit growth assumption.

**Source.** [KP-22](#source-kp-22), §7.2, Proposition7.6 assumptions(ii),(iii), pp.61–63; equation(7.11), p.63

**Open proof inputs.** [Jutila auxiliary mean-square input](#g-jutila).

## SV.3 — Average distribution of primes

Progression discrepancies use reduced residues, maximal cutoffs, primitive conductors and cofactor restrictions. The Bombieri–Vinogradov target allows every logarithmic saving after choosing a new modulus cutoff exponent. Weighted and second-moment variants record their additional losses.

<a id="SV-3-level-of-distribution"></a>

### Level of distribution of the primes (Maynard (1.3))

**Declaration:** `SieveDistribution.PrimesHaveLevel`. **Kind:** definition.

For real θ the primes have level of distribution θ if, for every A>0, Σ_{1≤q≤x^θ} max_{(a,q)=1} |π(x;q,a) − π(x)/φ(q)| = O_A(x/(log x)^A) as x→∞. Here π(x;q,a) counts the primes p≤x with p≡a (mod q), π(x) counts all primes p≤x and φ is Euler's function. The Elliott–Halberstam conjecture is the statement that the primes have level of distribution θ for every θ<1.

**Hypotheses and conventions.** x is real; q runs over the integers 1≤q≤⌊x^θ⌋ and a over the reduced residues 0≤a<q. The term q=1 vanishes identically. The comparison term is π(x)/φ(q), counting all primes up to x, exactly as in Maynard (1.3). His footnote 1 notes that other authors use slightly different definitions; this node fixes (1.3). Elliott–Halberstam is a named hypothesis. No node of this roadmap asserts it, and every consumer carries it as an explicit hypothesis (RS-07).

**Prerequisites.** `Nat.primeCounting` (Mathlib); `Nat.totient` (Mathlib); `Nat.ModEq` (Mathlib); `Asymptotics.IsBigO` (Mathlib).

**Proof route.** Define π(x;q,a) as the number of primes p≤⌊x⌋ with p≡a (mod q), the discrepancy as the supremum over reduced residues a<q of |π(x;q,a) − π(x)/φ(q)|, and PrimesHaveLevel θ as the family of big-O statements along x→∞ indexed by A>0.

**API.**

- `SieveDistribution.primeCountAP` (data): π(x;q,a), the number of primes p≤⌊x⌋ with p≡a (mod q).
- `SieveDistribution.discrepancy` (data): max over reduced a<q of |π(x;q,a) − π(x)/φ(q)|; the supremum over an empty index is zero.
- `SieveDistribution.windowError` (data): Maynard's E(N,q) of (5.16): 1 plus the largest deviation of the prime count in [N,2N) in a reduced class mod q from 1/φ(q) of the total.
- `SieveDistribution.ElliottHalberstam` (other): The Elliott–Halberstam conjecture: PrimesHaveLevel θ for every θ<1. It is a named hypothesis, never asserted.
- `SieveDistribution.discrepancy_one` (simp): discrepancy(x,1) = 0.
- `SieveDistribution.PrimesHaveLevel.mono` (relation): If θ′≤θ and the primes have level θ, they have level θ′.
- `SieveDistribution.primesHaveLevel_of_nonpos` (example): Every θ≤0 is a level of distribution.
- `SieveDistribution.PrimesHaveLevel.sum_windowError` (other): If the primes have level θ<1 and θ′<θ, then Σ_{1≤q≤N^θ′} windowError(N,q) = O_A(N/(log N)^A) for every A>0. This is the form Maynard uses in (5.20).

**Unit tests.**

- `discrepancy_ten_three`: discrepancy(10,3) = 1: π(10;3,1) = 1 (the prime 7), π(10;3,2) = 2 (the primes 2 and 5), and π(10)/φ(3) = 4/2 = 2.
- `primesHaveLevel_zero`: The primes have level 0: only q=1 occurs, and its discrepancy vanishes.
- `not_primesHaveLevel_of_one_lt`: For θ>1 the level fails. For each q in (x,x^θ] one of a=2,3 is coprime to q with π(x;q,a) = 1, while Σ_{q≤x^θ} π(x)/φ(q) = O(x). So the sum is ≫ x^θ, which is not O(x/(log x)^A). A definition that dropped the restriction q≤x^θ, or took the minimum over a, would accept these levels.
- `primeCountAP_one`: primeCountAP(x,1,0) = Nat.primeCounting ⌊x⌋₊: modulo 1 every prime up to x is counted, which agrees with Mathlib's prime-counting function.

**Acceptance.** The level is a statement for every A>0, with an implied constant depending on A. It is not a single-A bound.

**Source.** [MAYNARD-2015](#source-maynard-2015), §1, definition (1.3) and footnote 1, p. 383; Elliott–Halberstam conjecture, p. 384; [MAYNARD-2015](#source-maynard-2015), §1, p. 384

<a id="SV-3-bombieri-vinogradov-level"></a>

### Bombieri–Vinogradov: every level θ<1/2

**Declaration:** `SieveDistribution.primesHaveLevel_of_lt_half`. **Kind:** theorem.

For every θ<1/2 the primes have level of distribution θ in the sense of Maynard (1.3).

**Hypotheses and conventions.** The input is the ψ-form Bombieri–Vinogradov theorem, Kedlaya Theorem 18.4: for every A>0 there are c(A) and B(A) with Σ_{N≤Q} max_{m∈(ℤ/Nℤ)^×} |ψ(x;N,m) − x/φ(N)| ≤ c·x(log x)^{−A} for Q = x^{1/2}(log x)^{−B}. Its proof is the SV.3 decomposition still to be done (gap 'SV.3 remaining source decomposition'). The conclusion compares with π(x)/φ(q), as Maynard does, and not with li(x)/φ(q).

**Prerequisites.** [Level of distribution of the primes (Maynard (1.3))](#SV-3-level-of-distribution); `Chebyshev.psi` (Mathlib); `Chebyshev.theta` (Mathlib); `Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log` (Mathlib); `sum_mul_eq_sub_sub_integral_mul` (Mathlib).

**Proof route.** Input: Kedlaya Theorem 18.4. Its N=1 term alone gives |ψ(x) − x| ≤ c·x(log x)^{−A}.

**Acceptance.** θ<1/2 is strict: the theorem gives no level 1/2 (Maynard, p. 384).

**Source.** [MAYNARD-2015](#source-maynard-2015), §1, p. 384; [KED-ANT-18](#source-ked-ant-18), §18.3, Theorem 18.4 (Bombieri–Vinogradov)

<a id="SV-3-arithmetic-discrepancy"></a>

### Arithmetic progression discrepancy

**Declaration:** `SieveArithmeticDistribution.discrepancy`. **Kind:** definition.

For f:N→C, x≥0, q≥1 and integer a, D_f(x;q,a)=Σ_{1≤n≤floor x,n≡a modq}f(n)−φ(q)⁻¹Σ_{1≤n≤floor x,(n,q)=1}f(n). The modulus-zero extension is explicitly zero. The reduced-residue mean is not Σall f/φ(q).

**Hypotheses and conventions.** Native natural/integer congruences, totient and finite sums.

**Prerequisites.** `Nat.totient` (Mathlib); `DirichletCharacter` (Mathlib).

**Proof route.** Use finite interval sums and the native unit-residue predicate. Record the zero-modulus convention separately from every theorem’s positive-modulus hypothesis.

**API.**

- `SieveArithmeticDistribution.discrepancy` (constructor): The displayed finite formula, zero at q=0.
- `SieveArithmeticDistribution.discrepancy_add` (compatibility): D_(f+g)=D_f+D_g.
- `SieveArithmeticDistribution.discrepancy_smul` (compatibility): D_(c f)=cD_f.
- `SieveArithmeticDistribution.discrepancy_residue` (simp): Congruent a,b give identical discrepancies.
- `SieveArithmeticDistribution.discrepancy_one` (simp): D_f(x;1,a)=0.
- `SieveArithmeticDistribution.discrepancy_units_sum` (characterisation): The sum over reduced residue classes is zero.
- `SieveArithmeticDistribution.discrepancy_character_expansion` (characterisation): For a unit a and q≥1, D=φ(q)⁻¹Σχ≠1 conjχ(a)Σf(n)χ(n).

**Unit tests.**

- `discrepancy_nonunits`: For f=1_{n=2},x=2,q=2,a=1 the discrepancy is zero, since the mass at a nonunit is omitted from the mean.
- `discrepancy_unbalanced`: For f=1_{n=1},x=1,q=3, D at a=1 is 1/2 and at a=2 is −1/2.
- `discrepancy_modulus_one`: At modulus one every discrepancy vanishes.
- `discrepancy_linearity`: For f,g at a fixed positive modulus, D_(2f−g)=2D_f−D_g.

**Source.** [KED-ANT-18](#source-ked-ant-18), Definition 18.1, §18.1

<a id="SV-3-discrepancy-character-transfer"></a>

### Discrepancy to restricted character sums

**Declaration:** `SieveArithmeticDistribution.discrepancy_character_transfer`. **Kind:** theorem.

Let x≥1,0<Δ≤1, E_f²=Σ_{1≤n≤floor x}|f(n)|². Assume |D_f(x;N,a)|≤sqrt(x)Δ^9 E_f for every positive N and unit a. For a nonprincipal native character χ modr,r≥1 and s≥1, |Σ_{n≤x,(n,s)=1}f(n)χ(n)|≤2sqrt(x)Δ³rτ(s)E_f. The factor 2 is retained.

**Hypotheses and conventions.** The discrepancy hypothesis is quantified over every modulus, not one N.

**Prerequisites.** [Arithmetic progression discrepancy](#SV-3-arithmetic-discrepancy); `MulChar.sum_eq_zero_of_ne_one` (Mathlib); `ArithmeticFunction.moebius` (Mathlib).

**Proof route.** Möbius-expand the condition coprime to s. For divisors d>Δ⁻⁶ use Cauchy–Schwarz and the count of multiples d.

**Source.** [KED-ANT-18](#source-ked-ant-18), Lemma 18.2 and its proof, §18.1

<a id="SV-3-primitive-conductor-reduction"></a>

### Primitive-conductor reduction of discrepancies

**Declaration:** `SieveArithmeticDistribution.primitive_conductor_reduction`. **Kind:** theorem.

For finite-support f,g, positive Q, their Dirichlet convolution h and cutoff xy containing both supports, Σ_{q≤Q}max_unit a|D_h(xy;q,a)|≤Σ_{s≤Q}φ(s)⁻¹Σ_{2≤r≤Q/s}φ(r)⁻¹Σ_{χ primitive modr}|Σ_{m≤x,(m,s)=1}f(m)χ(m)| |Σ_{n≤y,(n,s)=1}g(n)χ(n)|. Keep rs≤Q rather than replacing the inner bound by Q unless recording that enlargement.

**Hypotheses and conventions.** Positive moduli; f,g supported in positive integer intervals; native character conductor/primitive API.

**Prerequisites.** [Arithmetic progression discrepancy](#SV-3-arithmetic-discrepancy); `DirichletCharacter.conductor` (Mathlib); `DirichletCharacter.IsPrimitive` (Mathlib); `ArithmeticFunction` (Mathlib).

**Proof route.** Expand the discrepancy by nonprincipal characters and split every character according to its primitive conductor r. The missing primes of the cofactor s appear as coprimality masks in both sums.

**Source.** [KED-ANT-18](#source-ked-ant-18), Theorem 18.3, equation (18.1.2), §18.1

<a id="SV-3-convolution-discrepancy-mean"></a>

### Convolution discrepancy mean value

**Declaration:** `SieveArithmeticDistribution.convolution_discrepancy_mean`. **Kind:** theorem.

Under the preceding all-moduli discrepancy hypothesis for f and finite supports x,y≥1, Q≥2, Σ_{q≤Q}max_unit|D_(f*g)(xy;q,a)|≤C E_f E_g(Δsqrt(xy)+sqrt x+sqrt y+Q)(1+log Q)^3. This is a conservative finite replacement for the printed log²Q statement: the inherited dyadic J loss is absorbed, not dropped.

**Hypotheses and conventions.** 0<Δ≤1; x,y≥1; Q≥2; support and global discrepancy hypotheses as in the transfer node.

**Prerequisites.** [Primitive-conductor reduction of discrepancies](#SV-3-primitive-conductor-reduction); [Discrepancy to restricted character sums](#SV-3-discrepancy-character-transfer); [Primitive bilinear tail through a dyadic endpoint](#SV-2-primitive-bilinear-dyadic-tail); `AnalyticNumberTheory:AN.2`.

**Proof route.** Split primitive r at Δ⁻¹. Apply the corrected transfer for small r and Cauchy–Schwarz for the g sum.

**Source.** [KED-ANT-18](#source-ked-ant-18), Theorem 18.3, §18.1

**Open proof inputs.** [Conductor reduction and Vaughan hyperbola balancing](#g-vaughan).

<a id="SV-3-bombieri-vinogradov-maximal"></a>

### Maximal Bombieri–Vinogradov theorem

**Declaration:** `SieveArithmeticDistribution.bombieri_vinogradov_maximal`. **Kind:** theorem.

For every A>0 there exist B,C>0 and x₀≥3 such that x≥x₀ and 1≤Q≤sqrt x/(log x)^B imply Σ_{1≤q≤Q} max_{(a,q)=1} sup_{0≤y≤x}|ψ(y;q,a)−y/φ(q)|≤Cx/(log x)^A. ψ includes prime powers through native von Mangoldt. Maximality in y is explicitly required by Chen and weighted sieves. The source’s fixed-x version is a consequence.

**Hypotheses and conventions.** Unconditional conclusion; constants depend on A. Separate analytic small-conductor and hyperbola/maximal proof inputs remain recorded requests/gaps.

**Prerequisites.** [Arithmetic progression discrepancy](#SV-3-arithmetic-discrepancy); [Weighted Vaughan identity on a finite hyperbola](#SV-2-weighted-vaughan-hyperbola); [Primitive bilinear tail through a dyadic endpoint](#SV-2-primitive-bilinear-dyadic-tail); [Convolution discrepancy mean value](#SV-3-convolution-discrepancy-mean); `AnalyticNumberTheory:AN.3`; `AnalyticNumberTheory:AN.2`.

**Proof route.** Use the exact Vaughan identity and coefficient energies, then split Type I/II regions with an actual complete hyperbola covering.

**Source.** [KED-ANT-18](#source-ked-ant-18), Theorem 18.4, §18.2; KED-chap-bombieri Theorem 17.1

**Open proof inputs.** [Conductor reduction and Vaughan hyperbola balancing](#g-vaughan), [Small-conductor Siegel–Walfisz estimates](#g-small-conductor).

<a id="SV-3-weighted-prime-distribution"></a>

### Weighted prime-distribution transfer

**Declaration:** `SieveArithmeticDistribution.weighted_prime_distribution`. **Kind:** theorem.

The maximal ψ estimate yields the corresponding maximal prime-counting estimate for π(y;q,a)−li(y)/φ(q), and the fixed-x discrepancy π(x;q,a)−π(x)/φ(q), with arbitrary prescribed log saving after increasing B. For a fixed integer j≥0, weighting the modulus sum by τ(q)^j is allowed after increasing the log budget and using second moments; it is not inferred by a pointwise bound τ(q)≤log^j q.

**Hypotheses and conventions.** Every A>0; j fixed; same Q≤sqrt x/(log x)^B; positive reduced residues.

**Prerequisites.** [Maximal Bombieri–Vinogradov theorem](#SV-3-bombieri-vinogradov-maximal); `AnalyticNumberTheory:AN.2`.

**Proof route.** Remove prime powers with their explicit sqrt x log²x cost, split small y, and apply partial summation to each maximal error.

**Acceptance.** Preserve maxima over all y≤x and reduced residue classes; the π variant centers at li(y)/φ(q).

**Source.** [KED-ANT-18](#source-ked-ant-18), Theorem 18.4 and Maynard (1.3), §§18.2 and source application

**Open proof inputs.** [Discrepancy variance and weighted transfer losses](#g-variance).

<a id="SV-3-arithmetic-discrepancy-variance"></a>

### Arithmetic discrepancy second moment

**Declaration:** `SieveArithmeticDistribution.arithmetic_discrepancy_variance`. **Kind:** theorem.

With the transfer node’s all-moduli hypothesis, x≥1,Q≥2, Σ_{q≤Q}Σ_{a units modq}|D_f(x;q,a)|²≤C E_f²(Δx+Q)(1+log Q)^5. The power five is a conservative replacement retaining conductor and dyadic losses. For arbitrary f the corresponding estimate uses x+Q and no Δ improvement.

**Hypotheses and conventions.** 0<Δ≤1; support in [1,x]; all positive moduli in the discrepancy hypothesis.

**Prerequisites.** [Arithmetic progression discrepancy](#SV-3-arithmetic-discrepancy); [Discrepancy to restricted character sums](#SV-3-discrepancy-character-transfer); [Primitive bilinear tail through a dyadic endpoint](#SV-2-primitive-bilinear-dyadic-tail); `AnalyticNumberTheory:AN.2`.

**Proof route.** Use finite Parseval and primitive-conductor reduction. Apply transfer below r=Δ⁻¹ and large sieve on dyadic intervals above it.

**Source.** [KED-ANT-18](#source-ked-ant-18), Theorem 18.5 and Exercise 18.4.4, §18.3

**Open proof inputs.** [Discrepancy variance and weighted transfer losses](#g-variance).

<a id="SV-3-barban-davenport-halberstam"></a>

### Barban–Davenport–Halberstam theorem

**Declaration:** `SieveArithmeticDistribution.barban_davenport_halberstam`. **Kind:** theorem.

For every A>0 there are B,C>0,x₀≥3 such that x≥x₀ and 1≤Q≤x/(log x)^B imply Σ_{q≤Q}Σ_{a units modq}|ψ(x;q,a)−x/φ(q)|²≤Cx²/(log x)^A. This is a second moment, not a maximum over residues.

**Hypotheses and conventions.** Unconditional theorem; all constants quantified; prime powers included.

**Prerequisites.** [Arithmetic discrepancy second moment](#SV-3-arithmetic-discrepancy-variance); [Maximal Bombieri–Vinogradov theorem](#SV-3-bombieri-vinogradov-maximal); `AnalyticNumberTheory:AN.3`; `AnalyticNumberTheory:AN.2`.

**Proof route.** Apply the variance route to a Vaughan decomposition, importing small-conductor estimates and bounding all cofactor sums.

**Source.** [KED-chap-bombieri](#source-ked-chap-bombieri), Theorem 17.4; KED-18 Theorem 18.5 and Exercise 18.4.4

**Open proof inputs.** [Small-conductor Siegel–Walfisz estimates](#g-small-conductor), [Discrepancy variance and weighted transfer losses](#g-variance).

<a id="SV-3-bilinear-congruence-correlation"></a>

### Bilinear congruence correlation

**Declaration:** `SieveArithmeticDistribution.bilinear_congruence_correlation`. **Kind:** theorem.

For a,b nonzero integers, x,y≥1,Q≥2, supports [1,x],[1,y] and the all-moduli Δ hypothesis for f, sum over q≤Q coprime to ab of the absolute deviation of Σ_{am≡bn modq,(mn,q)=1}f(m)g(n) from φ(q)⁻¹(Σ_(m,q)=1 f(m))(Σ_(n,q)=1 g(n)) is ≤C E_f E_g sqrt(Δx+Q)sqrt(y+Q)(1+log Q)^4. The Δ improvement stays on f’s x variable.

**Hypotheses and conventions.** 0<Δ≤1; a,b nonzero and q coprime to ab.

**Prerequisites.** [Arithmetic discrepancy second moment](#SV-3-arithmetic-discrepancy-variance); [Arithmetic progression discrepancy](#SV-3-arithmetic-discrepancy); [Primitive-character large sieve](#SV-2-primitive-large-sieve).

**Proof route.** Expand the congruence through characters with the correct conjugation, and use Cauchy–Schwarz across characters and moduli.

**Source.** [KED-ANT-18](#source-ked-ant-18), Corollary 18.6 and Exercise 18.4.5, §18.3

**Open proof inputs.** [Conductor reduction and Vaughan hyperbola balancing](#g-vaughan).

## SV.4 — Bounded gaps and clusters

Admissibility is a shared local avoidance condition. Maynard’s multidimensional weights and simplex functionals feed the positivity argument. Exact finite variational certificates and an explicit admissible tuple lead to the stated finite gap; stronger distribution conclusions remain conditional.

<a id="SV-4-admissible-tuple"></a>

### Admissible tuple

**Declaration:** `SieveMaynard.IsAdmissible`. **Kind:** definition.

A finite set H of nonnegative integers is admissible if, for every prime p, there is an integer a_p with a_p ≢ h (mod p) for every h∈H.

**Hypotheses and conventions.** H is a Finset ℕ. The empty set is admissible. Only primes p≤#H can obstruct admissibility, since #H elements meet at most #H residue classes.

**Prerequisites.** `Nat.ModEq` (Mathlib).

**Proof route.** Define IsAdmissible H as: for every prime p there is a with ¬ h ≡ a [MOD p] for all h∈H.

**API.**

- `SieveMaynard.isAdmissible_iff_card_image_lt` (characterisation): H is admissible iff, for every prime p≤#H, the image of H in ℤ/p has fewer than p elements.
- `SieveMaynard.IsAdmissible.mono` (relation): Subsets of admissible sets are admissible.
- `SieveMaynard.IsAdmissible.map_add` (relation): Translating an admissible set by c gives an admissible set.
- `SieveMaynard.isAdmissible_of_forall_not_dvd` (other): If no element of H is divisible by a prime p≤#H, then H is admissible.

**Unit tests.**

- `admissible_zero_two`: {0,2} is admissible: it misses 1 mod 2.
- `not_admissible_zero_two_four`: {0,2,4} is not admissible: it meets all three classes mod 3. A definition that checked only p=2, or only p>#H, would accept it.
- `admissible_zero_two_six_eight_twelve`: {0,2,6,8,12} is admissible: it misses 1 mod 2, 1 mod 3 and 4 mod 5.
- `admissible_empty`: ∅ is admissible.
- `not_admissible_zero_one`: {0,1} is not admissible: it covers ℤ/2.

**Acceptance.** {0,2,6,8,12} (Theorem 1.4) and Engelsma's 105-element set (footnote 2) are admissible. {0,2,4} is not, since it covers ℤ/3.

**Source.** [MAYNARD-2015](#source-maynard-2015), §1, p. 383

<a id="SV-4-prime-tuples-conjecture"></a>

### The prime k-tuples conjecture, as a named statement

**Declaration:** `SieveMaynard.PrimeTuplesConjecture`. **Kind:** definition.

For a finite H⊂ℕ let primeTranslates(H) = {n : n+h is prime for every h∈H}. The prime k-tuples conjecture asserts that primeTranslates(H) is infinite for every admissible H.

**Hypotheses and conventions.** It is a named statement, not an assumption. RS-07 moves the prime-tuple statement register here from AnalyticNumberTheory:AN.6, separately from Maynard's proven theorems.

**Prerequisites.** [Admissible tuple](#SV-4-admissible-tuple); `Nat.infinite_setOfPred_prime` (Mathlib).

**Proof route.** Define primeTranslates and PrimeTuplesConjecture as displayed.

**API.**

- `SieveMaynard.primeTranslates` (data): The set of n such that n+h is prime for every h∈H.
- `SieveMaynard.isAdmissible_of_infinite_primeTranslates` (relation): If primeTranslates(H) is infinite, then H is admissible.
- `SieveMaynard.primeTranslates_singleton_zero` (compatibility): primeTranslates({0}) is the set of primes.
- `SieveMaynard.PrimeTuplesConjecture.infinite_twin` (relation): The conjecture implies that there are infinitely many twin primes.

**Unit tests.**

- `primeTranslates_zero_infinite`: primeTranslates({0}) is infinite: this is Mathlib's infinitude of primes.
- `primeTranslates_zero_one`: primeTranslates({0,1}) = {2}. The set is finite but nonempty, so 'nonempty' cannot replace 'infinite' in the conjecture.
- `primeTranslates_zero_two_four`: primeTranslates({0,2,4}) = {3}: one of n, n+2, n+4 is divisible by 3.
- `primeTranslates_empty`: primeTranslates(∅) is all of ℕ.

**Acceptance.** Maynard's proven statement (SV.4/positive-proportion-prime-tuples) is a positive-proportion result, not this conjecture. The twin prime conjecture is the case H = {0,2}, and it is not proved.

**Source.** [MAYNARD-2015](#source-maynard-2015), §1, p. 383

<a id="SV-4-w-trick-residue"></a>

### The W-trick residue v₀ (Maynard (4.1))

**Declaration:** `SieveMaynard.wResidue`. **Kind:** construction.

For real D₀ let W = ∏_{p≤D₀} p, the primorial of ⌊D₀⌋. For admissible H there is v₀ with 0≤v₀<W and gcd(v₀+h, W) = 1 for every h∈H; wResidue(H,D₀) is the least such v₀ (0 if none exists). Maynard takes D₀ = log log log N, and then W ≪ (log log N)².

**Hypotheses and conventions.** H is admissible. Only ⌊D₀⌋ matters. AdditiveCombinatorics:AC.4 plans a separate W-trick for the Green–Tao majorant (one linear form). RS-07 keeps the two apart; this is the tuple version.

**Prerequisites.** [Admissible tuple](#SV-4-admissible-tuple); `primorial` (Mathlib); `primorial_le_four_pow` (Mathlib); `Nat.chineseRemainderOfFinset` (Mathlib).

**Proof route.** For each prime p≤D₀, admissibility gives a class a_p missed by H. Require v₀ ≡ −a_p (mod p); then v₀+h ≡ h − a_p ≢ 0 (mod p) for every h∈H.

**API.**

- `SieveMaynard.wModulus` (data): W = primorial ⌊D₀⌋.
- `SieveMaynard.wResidue_coprime` (characterisation): For admissible H, gcd(wResidue(H,D₀) + h, W) = 1 for every h∈H.
- `SieveMaynard.wResidue_lt` (projection): wResidue(H,D₀) < W.
- `SieveMaynard.wModulus_le` (other): W ≤ 4^{D₀} for D₀ ≥ 0.
- `SieveMaynard.eventually_wModulus_le` (other): wModulus(log log log N) ≤ (log log N)² for all large N.

**Unit tests.**

- `wModulus_three`: wModulus(3) = 6.
- `wResidue_zero_two`: wResidue({0,2}, 3) = 5.
- `wModulus_one`: wModulus(1) = 1: there are no primes ≤ 1, and every residue works.
- `no_wResidue_zero_one`: For H = {0,1} and W = wModulus(2) = 2, no v makes both v and v+1 coprime to 2. The construction genuinely needs admissibility.

**Acceptance.** For H = {0,2} and D₀ = 3: W = 6 and v₀ = 5, since 5 and 7 are both coprime to 6.

**Source.** [MAYNARD-2015](#source-maynard-2015), §4, (4.1) and the following sentence, pp. 388–389

<a id="SV-4-maynard-sieve-weights"></a>

### Maynard's multidimensional sieve weights

**Declaration:** `SieveMaynard.maynardLambda`. **Kind:** construction.

Fix k, W, R>1 and F: ℝ^k→ℝ. For r∈ℕ^k put y_r = F(log r₁/log R, …, log r_k/log R) when ∏rᵢ is squarefree, coprime to W and less than R, and y_r = 0 otherwise (6.3). Define λ_d = (∏ μ(dᵢ)dᵢ) Σ_{r: dᵢ|rᵢ} y_r/∏φ(rᵢ) (5.8), and the weight w_n = (Σ_{dᵢ|n+hᵢ ∀i} λ_d)² (2.4). With these, S₁ = Σ_{N≤n<2N, n≡v₀ (W)} w_n, S₂^{(m)} = Σ_{same n} χ_P(n+h_m)w_n, and y^{(m)}_r = (∏ μ(rᵢ)g(rᵢ)) Σ_{rᵢ|dᵢ, d_m=1} λ_d/∏φ(dᵢ), where g is totally multiplicative with g(p) = p−2 ((4.2), (5.14), (5.23)).

**Hypotheses and conventions.** λ built from a general y (maynardLambdaOfY) is what Lemmas 5.1–5.3 use; maynardLambda specializes to (6.3). Proposition 4.1 writes λ directly from F and replaces ∏rᵢ<R by 'F supported on ℛ_k'. The two differ only at ∏rᵢ = R, which does not affect the asymptotics. All sums are finite: rᵢ and dᵢ run below ⌈R⌉, and every other term vanishes by the support condition.

**Prerequisites.** [The W-trick residue v₀ (Maynard (4.1))](#SV-4-w-trick-residue); `ArithmeticFunction.moebius` (Mathlib); `Nat.totient` (Mathlib); `Squarefree` (Mathlib); `BoundingSieve.lambdaSquared` (Mathlib).

**Proof route.** Define y, λ, w, S₁, S₂^{(m)}, g and y^{(m)} as displayed.

**API.**

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

**Unit tests.**

- `maynardLambda_zero`: F = 0 gives λ = 0.
- `maynardWeight_R_two`: R = 2: w_n = F(0)² whenever every n+hᵢ ≠ 0.
- `maynardLambda_two_two`: k = 2 and d = (2,2): each dᵢ is squarefree but ∏dᵢ = 4 is not, so λ_d = 0. A definition that tested squarefreeness coordinatewise would get this wrong.

**Acceptance.** For R = 2 only r = (1,…,1) is supported, so λ_{(1,…,1)} = F(0), every other λ_d vanishes, and w_n = F(0)² for every n.

**Source.** [MAYNARD-2015](#source-maynard-2015), §2, (2.4)–(2.5), p. 387; [MAYNARD-2015](#source-maynard-2015), §4, Proposition 4.1, p. 388; §5, (5.7)–(5.8), p. 393; §6, (6.3), p. 400

<a id="SV-4-maynard-functionals"></a>

### Maynard's variational quantity M_k

**Declaration:** `SieveMaynard.maynardM`. **Kind:** definition.

Let ℛ_k = {t∈[0,1]^k : Σtᵢ ≤ 1}. For F: [0,1]^k→ℝ put I_k(F) = ∫F² and J_k^{(m)}(F) = ∫(∫_0^1 F dt_m)² dt₁…dt_{m−1}dt_{m+1}…dt_k. Let 𝒮_k be the set of F supported on ℛ_k with I_k(F) ≠ 0 and J_k^{(m)}(F) ≠ 0 for every m. Then M_k = sup_{F∈𝒮_k} Σ_m J_k^{(m)}(F)/I_k(F).

**Hypotheses and conventions.** Maynard's 𝒮_k consists of Riemann-integrable functions; here it consists of square-integrable functions on the cube. The suprema agree: every Riemann-integrable function is square-integrable, and SV.4/ratio-smooth-approximation approximates every square-integrable member by smooth functions supported on ℛ_k. J^{(m)} is integrated over the whole cube. Its integrand does not depend on t_m, so this is the (k−1)-fold integral of the source. G_{b,j} of Lemma 8.1 is included as data, with the r = 0 term (E31).

**Prerequisites.** `MeasureTheory.MemLp` (Mathlib); `Finset.Nat.antidiagonalTuple` (Mathlib).

**Proof route.** Define ℛ_k, I_k, J_k^{(m)}, the admissible class, the ratio, and M_k as the supremum of a set of reals bounded above by k.

**API.**

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

**Unit tests.**

- `maynardM_one`: M₁ = 1.
- `maynardI_J_triangle`: For k = 2 and F the indicator of ℛ₂: I = 1/2 and J^{(1)} = ∫_0^1 (1−t)² dt = 1/3, so the ratio is 4/3.
- `not_admissible_zero`: F = 0 is excluded, because I_k(0) = 0.
- `not_admissible_const_one`: F ≡ 1 on [0,1]² is not supported on ℛ₂ and has ratio 2. Without the support condition every M_k would be at least k.
- `simplexG_zero`: G_{0,2}(5) = 1: the r = 0 term that the printed formula omits (E31).

**Acceptance.** M₁ = 1: J^{(1)} = (∫F)² ≤ ∫F², with equality for F = 1 on [0,1].

**Source.** [MAYNARD-2015](#source-maynard-2015), §4, Proposition 4.1, p. 388, and Proposition 4.2, p. 389; [MAYNARD-2015](#source-maynard-2015), §6, remark after Lemma 6.3, p. 404

<a id="SV-4-ratio-smooth-approximation"></a>

### Smooth approximation within the simplex

**Declaration:** `SieveMaynard.exists_smooth_maynardRatio_gt`. **Kind:** lemma.

For F∈𝒮_k and δ>0 there is a smooth F₁∈𝒮_k, supported on ℛ_k, with I_k(F₁) > 0 and ratio(F₁) > ratio(F) − δ. In particular M_k is also the supremum over smooth functions supported on ℛ_k.

**Hypotheses and conventions.** 𝒮_k is the L² class of SV.4/maynard-functionals.

**Prerequisites.** [Maynard's variational quantity M_k](#SV-4-maynard-functionals); `ContDiffBump` (Mathlib).

**Proof route.** Shrink: F_η(t) = F((t − η𝟙)/(1 − (k+1)η)) vanishes unless tᵢ ≥ η and Σtᵢ ≤ 1 − η. I scales by (1 − (k+1)η)^k and each J^{(m)} by (1 − (k+1)η)^{k+1}, so the ratio is multiplied by 1 − (k+1)η.

**Acceptance.** Maynard's proof of Proposition 4.2 uses this step without proof; it is supplied here.

**Source.** [MAYNARD-2015](#source-maynard-2015), §4, proof of Proposition 4.2, p. 389

**Open proof inputs.** [Maynard asymptotic uniformity and smooth approximation](#g-maynard).

<a id="SV-4-gpy-positivity-criterion"></a>

### The GPY positivity criterion

**Declaration:** `SieveMaynard.exists_card_prime_gt_of_sum_pos`. **Kind:** lemma.

Let H be finite, N∈ℕ, w_n ≥ 0 and ρ∈ℝ. If Σ_{N≤n<2N} (#{h∈H : n+h prime} − ρ)w_n > 0, then some n∈[N,2N) has more than ρ, hence at least ⌊ρ+1⌋, of the n+h prime.

**Hypotheses and conventions.** No arithmetic input. The weights need only be nonnegative.

**Prerequisites.** [Admissible tuple](#SV-4-admissible-tuple).

**Proof route.** If every n had at most ρ of the n+h prime, each summand (#{…} − ρ)w_n would be ≤ 0, because w_n ≥ 0, and so would the sum.

**Acceptance.** With ρ = θM_k/2 − ε this is the positivity step of Proposition 4.2. For small ε>0, ⌊ρ+1⌋ = ⌈θM_k/2⌉.

**Source.** [MAYNARD-2015](#source-maynard-2015), §2, (2.1) and the following paragraph, p. 386

<a id="SV-4-lambda-max-bound"></a>

### Size of λ in terms of y (Maynard (5.9))

**Declaration:** `SieveMaynard.abs_maynardLambdaOfY_le`. **Kind:** lemma.

If y vanishes off the support (∏rᵢ squarefree, coprime to W, less than R) and |y_r| ≤ y_max, then |λ_d| ≤ y_max Σ_{u<R} μ²(u)τ_k(u)/φ(u) for every d. The right-hand side is O_k(y_max (log R)^k).

**Hypotheses and conventions.** τ_k(u) is the number of ordered factorizations u = c₁⋯c_k.

**Prerequisites.** [Maynard's multidimensional sieve weights](#SV-4-maynard-sieve-weights); `AnalyticNumberTheory:AN.2`.

**Proof route.** Insert |y_r| ≤ y_max into (5.8) and write rᵢ = dᵢr′ᵢ. Since ∏rᵢ is squarefree, the r′ᵢ are coprime to ∏dᵢ.

**Acceptance.** The O_k((log R)^k) bound is what turns the error O(λ_max²R²(log R)^{2k}) of (5.3) into O(y_max²R²(log R)^{4k}).

**Source.** [MAYNARD-2015](#source-maynard-2015), §5, (5.9) and the following sentence, pp. 393–394

<a id="SV-4-s1-diagonalization"></a>

### Diagonal form of S₁ (Maynard Lemma 5.1)

**Declaration:** `SieveMaynard.sieveSumS1_diagonal`. **Kind:** lemma.

Let y vanish off the support, with |y_r| ≤ y_max, and λ = λ(y). Then S₁ = (N/W) Σ_r y_r²/∏φ(rᵢ) + O(y_max² φ(W)^k N(log R)^k/(W^{k+1}D₀)).

**Hypotheses and conventions.** N is large, D₀ = log log log N, W = ∏_{p≤D₀}p, v₀ is the W-trick residue of the admissible H = {h₁,…,h_k} (distinct), R = N^{θ/2−δ} with 0<θ≤1 and δ>0 fixed. The implied constants depend on k, H, θ and δ, and not on N, y or F.

**Prerequisites.** [Maynard's multidimensional sieve weights](#SV-4-maynard-sieve-weights); [Size of λ in terms of y (Maynard (5.9))](#SV-4-lambda-max-bound); [The W-trick residue v₀ (Maynard (4.1))](#SV-4-w-trick-residue); `AnalyticNumberTheory:AN.2`.

**Proof route.** Expand the square and swap the sums (5.1). By the Chinese remainder theorem, the count of N≤n<2N with n≡v₀ (W) and [dᵢ,eᵢ] | n+hᵢ is N/q + O(1), q = W∏[dᵢ,eᵢ], when W, [d₁,e₁], …, [d_k,e_k] are pairwise coprime. Otherwise it is 0: a prime dividing [dᵢ,eᵢ] and [dⱼ,eⱼ] divides hᵢ − hⱼ and exceeds D₀ > max|hᵢ − hⱼ| (5.2).

**Acceptance.** The main term is diagonal in y: the change of variables diagonalizes the quadratic form S₁, as in the main term of Selberg's one-dimensional sieve (compare Mathlib's lambdaSquared).

**Source.** [MAYNARD-2015](#source-maynard-2015), §5, Lemma 5.1 and proof, (5.1)–(5.13), pp. 392–395

<a id="SV-4-s2-diagonalization"></a>

### Diagonal form of S₂^{(m)} (Maynard Lemma 5.2)

**Declaration:** `SieveMaynard.sieveSumS2_diagonal`. **Kind:** lemma.

Assume in addition that the primes have level of distribution θ, that k ≥ 2, and fix A>0. Then S₂^{(m)} = N/(φ(W) log N) Σ_r (y^{(m)}_r)²/∏g(rᵢ) + O((y^{(m)}_max)² φ(W)^{k−2}N(log N)^{k−2}/(W^{k−1}D₀)) + O(y_max² N/(log N)^A).

**Hypotheses and conventions.** N is large, D₀ = log log log N, W = ∏_{p≤D₀}p, v₀ is the W-trick residue of the admissible H = {h₁,…,h_k} (distinct), R = N^{θ/2−δ} with 0<θ≤1 and δ>0 fixed. The implied constants depend on k, H, θ and δ, and not on N, y or F. y^{(m)}_max bounds |y^{(m)}_r| for every r.

**Prerequisites.** [Maynard's multidimensional sieve weights](#SV-4-maynard-sieve-weights); [Size of λ in terms of y (Maynard (5.9))](#SV-4-lambda-max-bound); [The W-trick residue v₀ (Maynard (4.1))](#SV-4-w-trick-residue); [Level of distribution of the primes (Maynard (1.3))](#SV-3-level-of-distribution); `AnalyticNumberTheory:AN.2`.

**Proof route.** Expand as for S₁ (5.15). The inner sum runs over one class mod q = W∏[dᵢ,eᵢ] and is coprime to q exactly when d_m = e_m = 1. It equals X_N/φ(q) + O(E(N,q)), where X_N = #{N≤n<2N : n prime} and E is windowError (5.16)–(5.18).

**Acceptance.** This is the only use of the arithmetic hypothesis. Unconditional results come from SV.3/bombieri-vinogradov-level.

**Source.** [MAYNARD-2015](#source-maynard-2015), §5, Lemma 5.2 and proof, (5.14)–(5.27), pp. 395–398

<a id="SV-4-y-m-relation"></a>

### y^{(m)} in terms of y (Maynard Lemma 5.3)

**Declaration:** `SieveMaynard.maynardYm_sub_sum_le`. **Kind:** lemma.

If r_m = 1, then y^{(m)}_r = Σ_{a_m} y_{r₁,…,r_{m−1},a_m,r_{m+1},…,r_k}/φ(a_m) + O(y_max φ(W) log R/(W D₀)).

**Hypotheses and conventions.** N is large, D₀ = log log log N, W = ∏_{p≤D₀}p, v₀ is the W-trick residue of the admissible H = {h₁,…,h_k} (distinct), R = N^{θ/2−δ} with 0<θ≤1 and δ>0 fixed. The implied constants depend on k, H, θ and δ, and not on N, y or F.

**Prerequisites.** [Maynard's multidimensional sieve weights](#SV-4-maynard-sieve-weights); [The W-trick residue v₀ (Maynard (4.1))](#SV-4-w-trick-residue); [Selberg's diagonal sum in dimension one (GGPY Lemma 3, κ=1)](#SV-1-selberg-diagonal-sum-dimension-one).

**Proof route.** Substitute (5.8) into (5.23) (5.28), then swap the d and a sums (5.29).

**Acceptance.** y^{(m)} vanishes unless r_m = 1; the lemma is the only link between y^{(m)} and y.

**Source.** [MAYNARD-2015](#source-maynard-2015), §5, Lemma 5.3 and proof, (5.28)–(5.32), pp. 398–399

<a id="SV-4-s1-asymptotic"></a>

### Asymptotic for S₁ (Maynard Lemma 6.2)

**Declaration:** `SieveMaynard.sieveSumS1_smooth`. **Kind:** lemma.

S₁ = φ(W)^k N(log R)^k I_k(F)/W^{k+1} + O(F_max² φ(W)^k N(log R)^k/(W^{k+1}D₀)).

**Hypotheses and conventions.** N is large, D₀ = log log log N, W = ∏_{p≤D₀}p, v₀ is the W-trick residue of the admissible H = {h₁,…,h_k} (distinct), R = N^{θ/2−δ} with 0<θ≤1 and δ>0 fixed. The implied constants depend on k, H, θ and δ, and not on N, y or F. F is of class C¹ and supported on ℛ_k, and F_max = sup_{[0,1]^k} (|F| + Σᵢ|∂F/∂tᵢ|); y = y(F) is given by (6.3).

**Prerequisites.** [Diagonal form of S₁ (Maynard Lemma 5.1)](#SV-4-s1-diagonalization); [Smoothly weighted diagonal sum (Maynard Lemma 6.1, GGPY Lemma 4)](#SV-1-selberg-smooth-diagonal-sum); [Maynard's variational quantity M_k](#SV-4-maynard-functionals); `AnalyticNumberTheory:AN.2`.

**Proof route.** Insert (6.3) into Lemma 5.1 (6.4); y_max ≤ F_max.

**Acceptance.** The main term is positive whenever I_k(F) ≠ 0.

**Source.** [MAYNARD-2015](#source-maynard-2015), §6, Lemma 6.2 and proof, (6.4)–(6.9), pp. 401–402

**Open proof inputs.** [Restricted Halberstam–Richert input in the Maynard route](#g-ggpy), [Maynard asymptotic uniformity and smooth approximation](#g-maynard).

<a id="SV-4-s2-asymptotic"></a>

### Asymptotic for S₂^{(m)} (Maynard Lemma 6.3)

**Declaration:** `SieveMaynard.sieveSumS2_smooth`. **Kind:** lemma.

If the primes have level of distribution θ, then S₂^{(m)} = φ(W)^k N(log R)^{k+1} J_k^{(m)}(F)/(W^{k+1} log N) + O(F_max² φ(W)^k N(log R)^k/(W^{k+1}D₀)).

**Hypotheses and conventions.** N is large, D₀ = log log log N, W = ∏_{p≤D₀}p, v₀ is the W-trick residue of the admissible H = {h₁,…,h_k} (distinct), R = N^{θ/2−δ} with 0<θ≤1 and δ>0 fixed. The implied constants depend on k, H, θ and δ, and not on N, y or F. F is of class C¹ and supported on ℛ_k, and F_max = sup_{[0,1]^k} (|F| + Σᵢ|∂F/∂tᵢ|); y = y(F) is given by (6.3).

**Prerequisites.** [Diagonal form of S₂^{(m)} (Maynard Lemma 5.2)](#SV-4-s2-diagonalization); [y^{(m)} in terms of y (Maynard Lemma 5.3)](#SV-4-y-m-relation); [Smoothly weighted diagonal sum (Maynard Lemma 6.1, GGPY Lemma 4)](#SV-1-selberg-smooth-diagonal-sum); [Maynard's variational quantity M_k](#SV-4-maynard-functionals); `AnalyticNumberTheory:AN.2`.

**Proof route.** By Lemma 5.3 and (6.3): if r_m = 1 and ∏rᵢ is squarefree and coprime to W, then y^{(m)}_r = Σ_{(u,W∏rᵢ)=1} μ²(u)/φ(u)·F(…, log u/log R, …) + O(F_max φ(W) log R/(WD₀)) (6.10). In particular y^{(m)}_max ≪ φ(W)F_max log R/W.

**Acceptance.** Check of (6.19): p(p−1)²/(p³−p²−2p+1) = 1 − (p²−3p+1)/(p³−p²−2p+1). arXiv v2 printed a different γ; v3 and the published text agree on this one.

**Source.** [MAYNARD-2015](#source-maynard-2015), §6, Lemma 6.3 and proof, (6.10)–(6.22), pp. 402–404

**Open proof inputs.** [Restricted Halberstam–Richert input in the Maynard route](#g-ggpy), [Maynard asymptotic uniformity and smooth approximation](#g-maynard).

<a id="SV-4-maynard-sum-asymptotics"></a>

### Maynard's asymptotics for S₁ and S₂ (Proposition 4.1)

**Declaration:** `SieveMaynard.tendsto_sieveSums`. **Kind:** theorem.

Let the primes have level of distribution θ∈(0,1], let R = N^{θ/2−δ} with δ>0 fixed, and let F be smooth and supported on ℛ_k with I_k(F) ≠ 0 and J_k^{(m)}(F) ≠ 0 for every m. With λ built from F: S₁ = (1+o(1)) φ(W)^k N(log R)^k I_k(F)/W^{k+1}, and for every m, S₂^{(m)} = (1+o(1)) φ(W)^k N(log R)^{k+1} J_k^{(m)}(F)/(W^{k+1} log N); hence S₂ = Σ_m S₂^{(m)} has the stated asymptotic.

**Hypotheses and conventions.** N is large, D₀ = log log log N, W = ∏_{p≤D₀}p, v₀ is the W-trick residue of the admissible H = {h₁,…,h_k} (distinct), R = N^{θ/2−δ} with 0<θ≤1 and δ>0 fixed. The implied constants depend on k, H, θ and δ, and not on N, y or F. Maynard states Proposition 4.1 with 'exponent of distribution θ'; it is the level of distribution of (1.3).

**Prerequisites.** [Asymptotic for S₁ (Maynard Lemma 6.2)](#SV-4-s1-asymptotic); [Asymptotic for S₂^{(m)} (Maynard Lemma 6.3)](#SV-4-s2-asymptotic).

**Proof route.** Apply Lemmas 6.2 and 6.3 with F fixed: F_max is a constant and D₀ → ∞, so each error term is o(main term), because I_k(F) and J_k^{(m)}(F) are nonzero.

**Acceptance.** The S₂ asymptotic, summed over m, is Proposition 4.1's display with Σ_m J_k^{(m)}(F).

**Source.** [MAYNARD-2015](#source-maynard-2015), §4, Proposition 4.1, p. 388

<a id="SV-4-maynard-many-primes"></a>

### Primes in admissible tuples (Maynard Proposition 4.2)

**Declaration:** `SieveMaynard.infinite_many_primes_of_level`. **Kind:** theorem.

Let the primes have level of distribution θ∈(0,1] and let H = {h₁,…,h_k} be admissible. With r_k = ⌈θM_k/2⌉, there are infinitely many n such that at least r_k of n+h₁, …, n+h_k are prime. In particular liminf_n (p_{n+r_k−1} − p_n) ≤ max_{i,j}(hᵢ − hⱼ).

**Hypotheses and conventions.** The hᵢ are distinct. M_k is the quantity of SV.4/maynard-functionals.

**Prerequisites.** [Maynard's asymptotics for S₁ and S₂ (Proposition 4.1)](#SV-4-maynard-sum-asymptotics); [Smooth approximation within the simplex](#SV-4-ratio-smooth-approximation); [The GPY positivity criterion](#SV-4-gpy-positivity-criterion); [Maynard's variational quantity M_k](#SV-4-maynard-functionals); [Admissible tuple](#SV-4-admissible-tuple); [From prime clusters to prime gaps](#SV-4-clustered-primes-to-gaps).

**Proof route.** Choose F₀∈𝒮_k with ratio > M_k − δ, and then a smooth F₁ with ratio > M_k − 2δ (SV.4/ratio-smooth-approximation).

**Acceptance.** k = 105 and θ = 1/2 − ε give r₁₀₅ ≥ 2 (Theorem 1.3). k = 5 and θ = 1 − ε give r₅ ≥ 2 under Elliott–Halberstam (Theorem 1.4).

**Source.** [MAYNARD-2015](#source-maynard-2015), §4, Proposition 4.2 and proof, (4.4), p. 389

**Open proof inputs.** [Maynard asymptotic uniformity and smooth approximation](#g-maynard).

<a id="SV-4-clustered-primes-to-gaps"></a>

### From prime clusters to prime gaps

**Declaration:** `SieveMaynard.frequently_nth_prime_sub_le`. **Kind:** lemma.

Let H be finite and nonempty and r ≥ 1. If infinitely many n have at least r of the n+h (h∈H) prime, then p_{j+r−1} − p_j ≤ max H − min H for infinitely many j, i.e. liminf_j (p_{j+r−1} − p_j) ≤ max H − min H. Here p_j is the j-th prime, counted from 0.

**Hypotheses and conventions.** Maynard's p_n is 1-indexed. Differences p_{n+m} − p_n are unaffected by the shift.

**Prerequisites.** `Nat.nth` (Mathlib); `Nat.prime_nth_prime` (Mathlib).

**Proof route.** For such an n, let q₁ < … < q_r be r of the primes among the n+h, and let j be the index of q₁. The r primes lie in [q₁, q_r], so p_{j+r−1} ≤ q_r and p_{j+r−1} − p_j ≤ q_r − q₁ ≤ max H − min H.

**Acceptance.** With r = 2 and H of diameter 600 this is the step from Proposition 4.2 to liminf(p_{n+1} − p_n) ≤ 600.

**Source.** [MAYNARD-2015](#source-maynard-2015), §4, Proposition 4.2, last sentence, p. 389

<a id="SV-4-maynard-large-k-lower-bound"></a>

### Lower bound for M_k when k is large (Maynard Proposition 4.3(3))

**Declaration:** `SieveMaynard.eventually_log_sub_lt_maynardM`. **Kind:** theorem.

For all sufficiently large k, M_k > log k − 2 log log k − 2.

**Hypotheses and conventions.** The implied constants in §7 are independent of k.

**Prerequisites.** [Maynard's variational quantity M_k](#SV-4-maynard-functionals).

**Proof route.** Take F(t) = ∏g(ktᵢ) on ℛ_k (7.3), with g supported on [0,T], γ = ∫g², and μ = ∫ug²/γ < 1 − T/k (7.8). Then I_k ≤ k^{−k}γ^k (7.4), and J_k ≥ J′_k − E_k with J′_k = k^{−k−1}γ^{k−1}(∫g)² (7.5)–(7.7).

**Acceptance.** Only the leading term log k matters for Theorem 1.1. The −2 absorbs the loss log k/((log k)² + O(1)) in (7.21).

**Source.** [MAYNARD-2015](#source-maynard-2015), §7, (7.1)–(7.21), pp. 405–408

<a id="SV-4-simplex-dirichlet-moment"></a>

### Moments on the simplex (Maynard Lemma 8.1, corrected)

**Declaration:** `SieveMaynard.integral_simplex_moment`. **Kind:** lemma.

For integers k ≥ 1 and a, b, j ≥ 0: ∫_{ℛ_k} (1 − P₁)^a P_j^b dt = (a! b!/(k+a+jb)!) Σ_{b₁+…+b_k=b} ∏ᵢ (jbᵢ)!/bᵢ! = (a!/(k+jb+a)!)·G_{b,j}(k). Here P_j = Σtᵢ^j and G_{b,j}(x) = b! Σ_{r=0}^{b} C(x,r) Σ_{b₁,…,b_r≥1, Σbᵢ=b} ∏(jbᵢ)!/bᵢ!. The term r = 0, which makes G_{0,j} = 1, is needed; the printed formula starts at r = 1 (E31).

**Hypotheses and conventions.** The multinomial form, summed over all (b₁,…,b_k) including zero entries, needs no convention at b = 0.

**Prerequisites.** [Maynard's variational quantity M_k](#SV-4-maynard-functionals); `Finset.Nat.antidiagonalTuple` (Mathlib); `Complex.Gamma_mul_Gamma_eq_betaIntegral` (Mathlib).

**Proof route.** Dirichlet integral (8.2): ∫_{ℛ_k}(1−Σtᵢ)^a ∏tᵢ^{aᵢ} = a!∏aᵢ!/(k + a + Σaᵢ)!. Prove it by induction on k: integrate t₁ over [0, 1 − Σ_{i≥2}tᵢ] with v = t₁/(1 − Σ_{i≥2}tᵢ) and use the Beta integral ∫_0^1 t^a(1−t)^b dt = a!b!/(a+b+1)! (from Mathlib's Γ–Beta identity) (8.3).

**Acceptance.** k = 5, a = 2, b = 0: the integral is 2!/7! = 1/2520, while the printed formula gives 0.

**Source.** [MAYNARD-2015](#source-maynard-2015), §8, Lemma 8.1 and proof, (8.2)–(8.6), pp. 409–410

<a id="SV-4-symmetric-polynomial-quadratic-forms"></a>

### I_k and J_k as quadratic forms (Maynard Lemma 8.2)

**Declaration:** `SieveMaynard.maynardI_J_symmetricPoly`. **Kind:** lemma.

For P = Σ_{i=1}^d aᵢ(1 − P₁)^{bᵢ}P₂^{cᵢ} and F = P on ℛ_k (0 elsewhere), with k ≥ 2: I_k(F) = Σ_{i,j} aᵢaⱼ(bᵢ+bⱼ)! G_{cᵢ+cⱼ,2}(k)/(k+bᵢ+bⱼ+2cᵢ+2cⱼ)!, and J_k^{(m)}(F) = Σ_{i,j} aᵢaⱼ Σ_{c′₁≤cᵢ, c′₂≤cⱼ} C(cᵢ,c′₁)C(cⱼ,c′₂)·γ·G_{c′₁+c′₂,2}(k−1)/(k+bᵢ+bⱼ+2cᵢ+2cⱼ+1)!. Here γ = bᵢ!bⱼ!(2cᵢ−2c′₁)!(2cⱼ−2c′₂)!(bᵢ+bⱼ+2cᵢ+2cⱼ−2c′₁−2c′₂+2)!/((bᵢ+2cᵢ−2c′₁+1)!(bⱼ+2cⱼ−2c′₂+1)!), and G includes the r = 0 term (E31). So I_k and Σ_m J_k^{(m)} are quadratic forms aᵀA₁a and aᵀA₂a with rational A₁, A₂.

**Hypotheses and conventions.** F is symmetric, so J_k^{(m)} does not depend on m and Σ_m J_k^{(m)} = kJ_k^{(1)}.

**Prerequisites.** [Moments on the simplex (Maynard Lemma 8.1, corrected)](#SV-4-simplex-dirichlet-moment); [Maynard's variational quantity M_k](#SV-4-maynard-functionals).

**Proof route.** I_k: expand P² and apply the corrected Lemma 8.1 with j = 2 (8.7).

**Acceptance.** k = 5 with (8.16): exact rational arithmetic with these formulas gives I₅ = 29509/1222452000 and ratio 1417255/708216, which agrees with direct integration. The printed G (r ≥ 1) gives I₅ = 17753/977961600 and ratio 26784/17753 ≈ 1.509.

**Source.** [MAYNARD-2015](#source-maynard-2015), §8, Lemma 8.2 and proof, (8.7)–(8.10), pp. 410–411

<a id="SV-4-m5-lower-bound"></a>

### M₅ > 2 (Maynard Proposition 4.3(1))

**Declaration:** `SieveMaynard.maynardM_five_ge`. **Kind:** theorem.

M₅ ≥ 1417255/708216 > 2.

**Hypotheses and conventions.** F = P·1_{ℛ₅} with P = (1−P₁)P₂ + (7/10)(1−P₁)² + (1/14)P₂ − (3/14)(1−P₁) (8.16).

**Prerequisites.** [I_k and J_k as quadratic forms (Maynard Lemma 8.2)](#SV-4-symmetric-polynomial-quadratic-forms); [Maynard's variational quantity M_k](#SV-4-maynard-functionals).

**Proof route.** F is bounded and supported on ℛ₅, with I ≠ 0 and every J^{(m)} ≠ 0, so it is admissible.

**Acceptance.** 1417255/708216 ≈ 2.00115. The exact value was recomputed here, both by direct Dirichlet-integral expansion and by the corrected Lemma 8.2.

**Source.** [MAYNARD-2015](#source-maynard-2015), §8, (8.16)–(8.17), p. 412

<a id="SV-4-m105-lower-bound"></a>

### M₁₀₅ > 4 (Maynard Proposition 4.3(2))

**Declaration:** `SieveMaynard.four_lt_maynardM_105`. **Kind:** theorem.

M₁₀₅ > 4.

**Hypotheses and conventions.** P is a linear combination of the 42 monomials (1−P₁)^bP₂^c with b + 2c ≤ 11, and k = 105.

**Prerequisites.** [I_k and J_k as quadratic forms (Maynard Lemma 8.2)](#SV-4-symmetric-polynomial-quadratic-forms); [Maynard's variational quantity M_k](#SV-4-maynard-functionals).

**Proof route.** Form the 42×42 rational matrices A₁, A₂ of Lemma 8.2 at k = 105.

**Acceptance.** Recomputed here: the largest eigenvalue is 4.00206976…, and a rational coefficient vector (denominators 10^60) gives an exact ratio 4.0020697619… > 4.

**Source.** [MAYNARD-2015](#source-maynard-2015), §8, (8.15) and the following sentence, p. 412

<a id="SV-4-engelsma-admissible-105-tuple"></a>

### Engelsma's admissible 105-tuple of diameter 600

**Declaration:** `SieveMaynard.engelsma_tuple_admissible`. **Kind:** lemma.

The 105-element set H₁₀₅ = {0, 10, 12, 24, 28, …, 594, 598, 600} of Maynard's footnote 2 is admissible, contains 0 and 600, and lies in [0,600].

**Hypotheses and conventions.** The set is copied in full into the suggested Lean file.

**Prerequisites.** [Admissible tuple](#SV-4-admissible-tuple).

**Proof route.** By isAdmissible_iff_card_image_lt, only the 27 primes p ≤ 103 need checking. For each, exhibit a missed residue: for example 1 mod 2, 2 mod 3, 1 mod 5, 4 mod 7, 7 mod 11 and 6 mod 13.

**Acceptance.** Recomputed here: the 105 elements are distinct and sorted, the set is admissible, and its diameter is 600. The list in the published text agrees with arXiv v3.

**Source.** [MAYNARD-2015](#source-maynard-2015), §4, footnote 2, p. 390

<a id="SV-4-first-primes-above-k-admissible"></a>

### The first k primes above k are admissible

**Declaration:** `SieveMaynard.firstPrimesAbove_admissible`. **Kind:** lemma.

For every k, the first k primes greater than k form an admissible set. Its diameter p_{π(k)+k} − p_{π(k)+1} is O(k log k).

**Hypotheses and conventions.** In 0-indexed form the set is {nth prime (π(k) + i) : i < k}.

**Prerequisites.** [Admissible tuple](#SV-4-admissible-tuple); `Nat.nth` (Mathlib); `Nat.prime_nth_prime` (Mathlib); `Chebyshev.pi_ge'` (Mathlib).

**Proof route.** Every element is a prime greater than k, so none is divisible by a prime p ≤ k = #H; apply isAdmissible_of_forall_not_dvd. The published argument says 'less than k', and so omits p = k when k is prime (E29).

**Acceptance.** k = 5: {7, 11, 13, 17, 19}. It misses 0 mod 5 because no element is divisible by 5; this is the case p = k.

**Source.** [MAYNARD-2015](#source-maynard-2015), §4, proof of Theorem 1.1, p. 391

<a id="SV-4-bounded-gaps-600"></a>

### Bounded gaps between primes (Maynard Theorem 1.3)

**Declaration:** `SieveMaynard.frequently_nth_prime_succ_sub_le_600`. **Kind:** theorem.

liminf_n (p_{n+1} − p_n) ≤ 600.

**Hypotheses and conventions.** Unconditional. It uses Bombieri–Vinogradov and none of Zhang's technology.

**Prerequisites.** [Primes in admissible tuples (Maynard Proposition 4.2)](#SV-4-maynard-many-primes); [M₁₀₅ > 4 (Maynard Proposition 4.3(2))](#SV-4-m105-lower-bound); [Engelsma's admissible 105-tuple of diameter 600](#SV-4-engelsma-admissible-105-tuple); [Bombieri–Vinogradov: every level θ<1/2](#SV-3-bombieri-vinogradov-level); [From prime clusters to prime gaps](#SV-4-clustered-primes-to-gaps).

**Proof route.** Bombieri–Vinogradov gives level θ = 1/2 − ε. Since M₁₀₅ > 4, θM₁₀₅/2 > 1 for small ε, so r₁₀₅ = ⌈θM₁₀₅/2⌉ ≥ 2.

**Acceptance.** This is not the twin prime conjecture, and 600 is not optimal (Maynard, p. 385).

**Source.** [MAYNARD-2015](#source-maynard-2015), §1, Theorem 1.3, p. 385; proof, p. 390

**Open proof inputs.** [Maynard asymptotic uniformity and smooth approximation](#g-maynard).

<a id="SV-4-elliott-halberstam-gaps"></a>

### Gaps under Elliott–Halberstam (Maynard Theorem 1.4)

**Declaration:** `SieveMaynard.elliottHalberstam_gaps`. **Kind:** theorem.

If the primes have level of distribution θ for every θ < 1 (the Elliott–Halberstam conjecture), then liminf(p_{n+1} − p_n) ≤ 12 and liminf(p_{n+2} − p_n) ≤ 600.

**Hypotheses and conventions.** Conditional on the named hypothesis ElliottHalberstam of SV.3/level-of-distribution.

**Prerequisites.** [Primes in admissible tuples (Maynard Proposition 4.2)](#SV-4-maynard-many-primes); [M₅ > 2 (Maynard Proposition 4.3(1))](#SV-4-m5-lower-bound); [M₁₀₅ > 4 (Maynard Proposition 4.3(2))](#SV-4-m105-lower-bound); [Engelsma's admissible 105-tuple of diameter 600](#SV-4-engelsma-admissible-105-tuple); [Admissible tuple](#SV-4-admissible-tuple); [Level of distribution of the primes (Maynard (1.3))](#SV-3-level-of-distribution); [From prime clusters to prime gaps](#SV-4-clustered-primes-to-gaps).

**Proof route.** k = 105 and θ = 1 − ε: θM₁₀₅/2 > 2, so three primes occur among n + H₁₀₅ infinitely often, and liminf(p_{n+2} − p_n) ≤ 600.

**Acceptance.** 12 appears to be optimal for the method in its current form (Maynard, p. 385).

**Source.** [MAYNARD-2015](#source-maynard-2015), §1, Theorem 1.4, p. 385; proof, p. 390

<a id="SV-4-m-primes-bounded-intervals"></a>

### m + 1 primes in bounded intervals (Maynard Theorem 1.1)

**Declaration:** `SieveMaynard.exists_frequently_nth_prime_sub_le`. **Kind:** theorem.

There is an absolute constant C such that liminf_n (p_{n+m} − p_n) ≤ C m³ e^{4m} for every m ≥ 1.

**Hypotheses and conventions.** Unconditional.

**Prerequisites.** [Primes in admissible tuples (Maynard Proposition 4.2)](#SV-4-maynard-many-primes); [Lower bound for M_k when k is large (Maynard Proposition 4.3(3))](#SV-4-maynard-large-k-lower-bound); [The first k primes above k are admissible](#SV-4-first-primes-above-k-admissible); [Bombieri–Vinogradov: every level θ<1/2](#SV-3-bombieri-vinogradov-level); [From prime clusters to prime gaps](#SV-4-clustered-primes-to-gaps).

**Proof route.** Take θ = 1/2 − 1/k (Bombieri–Vinogradov). By Proposition 4.3(3), θM_k/2 ≥ (1/4 − 1/(2k))(log k − 2 log log k − 2) (4.5), which exceeds m once k ≥ C₀m²e^{4m} for an absolute C₀.

**Acceptance.** Under Elliott–Halberstam the bound improves to O(m³e^{2m}) (Maynard, p. 385); that is not planned here.

**Source.** [MAYNARD-2015](#source-maynard-2015), §1, Theorem 1.1, p. 384; proof, p. 391

<a id="SV-4-positive-proportion-prime-tuples"></a>

### A positive proportion of admissible m-tuples are prime (Maynard Theorem 1.2)

**Declaration:** `SieveMaynard.positive_proportion_prime_tuples`. **Kind:** theorem.

For every m ≥ 1 there are r₀ and c > 0 such that every set A of r ≥ r₀ distinct nonnegative integers has at least c·C(r,m) subsets {h₁,…,h_m} ⊆ A for which infinitely many n make every n + hᵢ prime.

**Hypotheses and conventions.** The source allows arbitrary integers. Translating A by a constant changes neither count, so natural numbers suffice.

**Prerequisites.** [Primes in admissible tuples (Maynard Proposition 4.2)](#SV-4-maynard-many-primes); [Lower bound for M_k when k is large (Maynard Proposition 4.3(3))](#SV-4-maynard-large-k-lower-bound); [Admissible tuple](#SV-4-admissible-tuple); [The prime k-tuples conjecture, as a named statement](#SV-4-prime-tuples-conjecture); [Bombieri–Vinogradov: every level θ<1/2](#SV-3-bombieri-vinogradov-level).

**Proof route.** With k = ⌈Cm²e^{4m}⌉ as in Theorem 1.1, every admissible k-set contains an m-subset with infinitely many prime translates.

**Acceptance.** This is a positive-proportion statement, not the prime m-tuples conjecture for any given tuple.

**Source.** [MAYNARD-2015](#source-maynard-2015), §1, Theorem 1.2, p. 385; proof, p. 391

<a id="SV-4-polynomial-prime-hypotheses"></a>

### Bouniakowsky and Schinzel hypotheses

**Declaration:** `SievePolynomial.BouniakowskyAdmissible`. **Kind:** definition.

For f∈ℤ[X], IsBouniakowskyPolynomial means positive leading coefficient and, for every prime p, an integer n with p∤f(n). IsSchinzelTuple means every entry has positive leading coefficient and, for each p, one n avoids divisibility in every entry. BouniakowskyAdmissible and SchinzelAdmissible additionally require irreducibility of each polynomial. The Bouniakowsky conjecture and Schinzel H assert infinitely many natural arguments yielding positive primes for every admissible polynomial or tuple. These conjectures are named hypotheses, never asserted.

**Hypotheses and conventions.** Polynomials are in the native Polynomial ℤ carrier. The local condition is on the product, with a common n for each prime; separate admissibility is insufficient. The empty tuple has the vacuous simultaneous-primality condition. Constant irreducible polynomials are excluded automatically by the local condition.

**Prerequisites.** `Nat.Prime` (Mathlib).

**Proof route.** Use native irreducibility, leadingCoeff and evaluation; define only the admissibility and conjecture predicates.

**API.**

- `SievePolynomial.IsBouniakowskyPolynomial` (data): Positive leading coefficient and absence of a fixed prime divisor; irreducibility is a separate hypothesis.
- `SievePolynomial.IsSchinzelTuple` (data): Positive leading coefficients and absence of a fixed prime divisor of the product, with one common argument per prime.
- `SievePolynomial.SchinzelAdmissible` (data): Pointwise irreducibility and positive leading coefficient, and a shared local avoidance condition.
- `SievePolynomial.BouniakowskyConjecture` (data): Every Bouniakowsky-admissible f has infinitely many n∈ℕ with 0<f(n) and f(n).natAbs prime.
- `SievePolynomial.SchinzelHypothesisH` (data): Every Schinzel-admissible finite tuple has infinitely many n∈ℕ with all values positive primes.
- `SievePolynomial.schinzel_singleton_iff` (compatibility): A one-entry tuple is Schinzel-admissible exactly when its entry is Bouniakowsky-admissible.
- `SievePolynomial.SchinzelHypothesisH.bouniakowsky` (relation): Schinzel H implies the Bouniakowsky conjecture.
- `SievePolynomial.schinzel_local_product_iff` (characterisation): The shared local condition is equivalent to p not dividing the product of the values, for every prime p and a suitable n.

**Unit tests.**

- `bouniakowsky_linear`: X+1 is Bouniakowsky-admissible.
- `bouniakowsky_fixed_divisor`: X²+X+2 is not admissible because every integer value is even.
- `schinzel_separate_not_joint`: X and X+1 are separately admissible but their pair fails the shared condition at 2.
- `schinzel_empty`: The empty tuple is Schinzel-admissible and its simultaneous-primality set is all ℕ.
- `bouniakowsky_reducible_local_condition`: X(X+2) is a Bouniakowsky polynomial in the source sense but is not BouniakowskyAdmissible, because it is reducible.

**Source.** [SS-23](#source-ss-23), §1, pp.674–675, definitions preceding Theorems 1.1 and 1.2

## SV.5 — Almost primes and advanced sieves

The linear and general beta sieves, Richert weights, Chen switching, joint spins and affine expansion are separate developments. Each has its own analytic or arithmetic inputs. The local factor and ordered switched-triple count are explicit, and the affine primitivity condition includes simultaneous avoidance at composite moduli.

<a id="SV-5-rough-to-at-most-almost-prime"></a>

### From roughness to an almost-prime bound

**Declaration:** `SieveAlmostPrime.rough_to_at_most_almost_prime`. **Kind:** theorem.

Let natural z≥2, n≠0 and k≥0. If every prime p dividing n satisfies z≤p and n<z^(k+1), then Nat.IsAtMostAlmostPrime(k,n).

**Hypotheses and conventions.** Prime factors are counted with multiplicity. The upper bound is strict and the unit n=1 is allowed.

**Prerequisites.** `Nat.IsAtMostAlmostPrime` (Mathlib); `ArithmeticFunction.cardFactors` (Mathlib); `Nat.prod_primeFactorsList` (Mathlib).

**Proof route.** Every entry of the native prime factor list is at least z. Hence n, its product, is at least z raised to the list length Ω(n). If Ω(n)≥k+1, monotonicity of natural powers contradicts the strict upper bound. Use the existing at-most predicate, not the exact-k or distinct-factor predicate.

**Acceptance.** n=8,z=2,k=2 violates the strict cutoff and has Ω=3 although it has only one distinct prime factor; n=1 gives Ω=0; n=0 is excluded.

**Source.** [KED-ANT-11](#source-ked-ant-11), §11.1 rough-number observation

<a id="SV-5-linear-sieve-functions"></a>

### Linear sieve functions

**Declaration:** `SieveWeighted.linearUpper`. **Kind:** definition.

On s>0, F(s)=2e^γ/s for s≤3 and f(s)=0 for s≤2. Extend by sF(s)=2e^γ+∫_3^s f(t−1)dt when s>3 and sf(s)=∫_2^s F(t−1)dt when s>2. Successive unit-interval extensions uniquely determine continuous positive-domain functions. Use the usual Euler constant γ.

**Hypotheses and conventions.** s>0; upper extension starts at3, lower at2.

**Prerequisites.** `Real.eulerMascheroniConstant` (Mathlib); `intervalIntegral` (Mathlib).

**Proof route.** Define a pair of approximants by the displayed integral operator and iterate ceil(max(s,0))+1 times; values on the required interval stabilize.

**API.**

- `SieveWeighted.linearUpper` (constructor): The upper function F through stabilized integral iteration.
- `SieveWeighted.linearLower` (constructor): The lower function f through the same iteration.
- `SieveWeighted.linearUpper_initial` (characterisation): F(s)=2e^γ/s for0<s≤3.
- `SieveWeighted.linearLower_initial` (characterisation): f(s)=0 for0<s≤2.
- `SieveWeighted.linear_delay_integrals` (characterisation): The two integral equations above.
- `SieveWeighted.linearLower_small` (characterisation): For2≤s≤4, f(s)=2e^γ log(s−1)/s.
- `SieveWeighted.linear_bounds` (relation): For s>0,0≤f(s)≤1≤F(s).
- `SieveWeighted.linear_limit` (compatibility): Both tend to1 as s tends to infinity; quantitative exponential decay is a separate proof gap.

**Unit tests.**

- `linear_upper_one`: F(1)=2e^γ.
- `linear_lower_two`: f(2)=0, so the linear lower sieve does not detect primes at s=2.
- `linear_lower_three`: f(3)=2e^γlog2/3>0.
- `linear_upper_three`: F(3)=2e^γ/3; extending the initial formula beyond3 would fail the delay equation.

**Source.** [HB-SIEVES](#source-hb-sieves), §4, p.27 and §5pp.35–38; Iwaniec delay equationspp.174–175

<a id="SV-5-rosser-weights"></a>

### Rosser sieve weights

**Declaration:** `SieveWeighted.rosserWeight`. **Kind:** construction.

For squarefree d<D list its prime divisors p₁>…>p_r. The upper weight is μ(d) if p₁…p_(j−1)p_j³<D at every odd j≤r, and0 otherwise; the lower weight uses every even j≤r. Both are0 for d≥D and nonsquarefree d. The d=1 prefix conditions are vacuous, giving weight1 when D>1.

**Hypotheses and conventions.** D>1; descending distinct prime order; strict cutoff.

**Prerequisites.** `ArithmeticFunction.moebius` (Mathlib); `Nat.primeFactorsList` (Mathlib).

**Proof route.** Sort native prime factors descending; use prefixes and the cubic stopping condition. The ambient d<D restriction is present even when the parity conditions are vacuous.

**API.**

- `SieveWeighted.rosserWeight` (constructor): The displayed upper/lower weights.
- `SieveWeighted.rosserWeight_one` (simp): At D>1 both give1 at d=1.
- `SieveWeighted.rosserWeight_support` (characterisation): Weights vanish outside squarefree d<D.
- `SieveWeighted.rosserWeight_abs` (relation): Coefficient modulus≤1.
- `SieveWeighted.rosser_divisor_brackets` (relation): For squarefree P all of whose prime factors are<D, the lower divisor sum over gcd(n,P) is≤1_(gcd=1), and the upper sum is≥that indicator.
- `SieveWeighted.rosser_remainder_bound` (compatibility): Native BoundingSieve error is bounded by Σ_(d<D)|R_d|.

**Unit tests.**

- `rosser_empty_prefix`: Both weights at d=1,D=2 are1.
- `rosser_prime_upper`: At d=2,D=8 the upper weight is0 because2³<8 fails.
- `rosser_prime_lower`: At d=2,D=8 the lower weight is−1 because there is no even prefix.
- `rosser_cutoff`: At d=D=2 the lower weight is0 despite its vacuous even-prefix conditions.
- `rosser_square`: At d=4,D=100 both are0.

**Source.** [HB-SIEVES](#source-hb-sieves), §5 equations(5.1)–(5.3),pp.30–34

<a id="SV-5-linear-sieve-main-estimate"></a>

### Rosser–Iwaniec linear sieve

**Declaration:** `SieveWeighted.linear_sieve_estimate`. **Kind:** theorem.

Under the dimension-one product condition ∏_(w≤p<z)(1−g(p))⁻¹≤(log z/log w)(1+K/log w),0≤g(p)<1, the Rosser weights give main terms at most V(z)[F(s)+C_K e^(−s)(log D)^(−1/3)] and at least V(z)[f(s)−C_K e^(−s)(log D)^(−1/3)], for D≥z≥2,s=log D/log z. Thus a native weighted sieve has the same brackets, plus/minus Σ_(d<D)|R_d|.

**Hypotheses and conventions.** Nonnegative mass; correct density/remainder data; D≥z≥2; fixed product-condition constant K.

**Prerequisites.** [Linear sieve functions](#SV-5-linear-sieve-functions); [Rosser sieve weights](#SV-5-rosser-weights); [Euler-product sieve dimension](#SV-0-product-sieve-dimension).

**Proof route.** Combinatorial brackets and coefficient support are finite. The analytic main terms require Iwaniec’s switching integrals and error-control proof §§3–5; that proof is a precise remaining gap.

**Source.** [IWA-ROSSER](#source-iwa-rosser), Theorem1,pp.172–174; HB Theorem5.1/Corollary5.1,pp.35–36

**Open proof inputs.** [Normalized general-dimension beta functions](#g-beta).

<a id="SV-5-beta-sieve-general-dimension"></a>

### Beta sieve in general dimension

**Declaration:** `SieveWeighted.beta_sieve_general_dimension`. **Kind:** theorem.

For each κ>0 the Iwaniec constants β_κ,A_κ,B_κ and delay functions F_κ,f_κ satisfy s^κF=A_κ for0<s≤β_κ+1, s^κf=B_κ for0<s≤β_κ, with the stated delayed derivatives beyond those endpoints and normalization at infinity. Under the corresponding κ product condition, Theorem1 bounds the sifted sum by XV(z) times these functions with error e^sqrt(K)Q_κ(s)(log D)^(-1/3), plus/minus the absolute remainder sum. For κ=1,β=2,A=2e^γ,B=0. The error control is Q_κ(s)≪_κ exp(−s log s+s log log(3s)+O_κ(s)). For0<κ<1/2, β=1 and B>0; atκ=1/2, β=1,A=2sqrt(e^γ/π),B=0; forκ>1/2,β>1,B=0. Their normalized existence and precise κ-dependent constants remain a proof/interface gap.

**Hypotheses and conventions.** κ>0; the κ-specific product condition with K≥2 and0<g(p)<1; D≥z≥2, so s≥1, with no additional s≥β_κ restriction.

**Prerequisites.** [Euler-product sieve dimension](#SV-0-product-sieve-dimension); [Rosser–Iwaniec linear sieve](#SV-5-linear-sieve-main-estimate).

**Proof route.** Import the complete κ-dependent delay-system existence and normalization proof from the original §§3–5. The linear prototype does not define general β_κ.

**Source.** [IWA-ROSSER](#source-iwa-rosser), Theorem1 and equations(1.5)–(1.10),pp.172–176

**Open proof inputs.** [Normalized general-dimension beta functions](#g-beta).

<a id="SV-5-weighted-fundamental-lemma"></a>

### Fundamental lemma for the linear sieve

**Declaration:** `SieveWeighted.weighted_fundamental_lemma`. **Kind:** theorem.

For a dimension-one family with Σ_(d<D)|R_d|=o(XV(z)), D≥z→∞ and log z=o(log D), the sifted sum is asymptotic to XV(z). The conclusion needs both the main-term functions tending to1 and a remainder small relative to XV, not merely relative to X.

**Hypotheses and conventions.** Uniform dimension constant; relative remainder; s→∞.

**Prerequisites.** [Rosser–Iwaniec linear sieve](#SV-5-linear-sieve-main-estimate); [Linear sieve functions](#SV-5-linear-sieve-functions).

**Proof route.** Apply both brackets and divide by positive XV. Control the linear-function error and the relative remainder independently.

**Source.** [IWA-ROSSER](#source-iwa-rosser), Theorem4,pp.176–177; HB Fundamental Lemma,p.38

<a id="SV-5-richert-logarithmic-weights"></a>

### Richert logarithmic weights

**Declaration:** `SieveWeighted.richertPrimeWeight`. **Kind:** definition.

For N>1,0<α<β,(r+1)β>1, define w_p=[β/((r+1)β−1)](1−log p/(βlog N)) when N^α≤p<N^β is prime, and0 otherwise. W(A)=Σ_(n∈A,n N^α-rough)(1−Σ_(p|n)w_p). The inner sum counts distinct prime factors; Ω almost-prime conclusions require a separate prime-square exception estimate.

**Hypotheses and conventions.** Positive n≤N; full prime set, or every prime factor outside it treated explicitly; nonnegative family mass.

**Prerequisites.** `Nat.primeFactors` (Mathlib); `ArithmeticFunction.cardFactors` (Mathlib); [Linear sieve functions](#SV-5-linear-sieve-functions).

**Proof route.** Use native prime-factor sets for the weight and native Ω for the conclusion. Pointwise positivity excludes ω(n)≥r+1; repeated prime factors below N^β form the exception.

**API.**

- `SieveWeighted.richertPrimeWeight` (constructor): The displayed prime weight with strict upper endpoint.
- `SieveWeighted.richertSum` (constructor): The rough weighted family sum.
- `SieveWeighted.richertPrimeWeight_nonnegative` (relation): Weights are nonnegative under the stated parameter range.
- `SieveWeighted.richertSum_expand` (compatibility): W=S(A,z)−Σp w_pS(A_p,z).
- `SieveWeighted.richert_nonpositive_many_distinct` (relation): For rough1≤n≤N with ω(n)≥r+1, the summand is nonpositive.
- `SieveWeighted.richert_almost_prime_transfer` (relation): W≤weighted count of Ω(n)≤r plus the mass of n having some p²|n with N^α≤p<N^β.

**Unit tests.**

- `richert_below_cutoff`: A prime p<N^α has weight0.
- `richert_upper_endpoint`: At p=N^β the weight is0.
- `richert_prime_power_exception`: For N=8,α=1/4,β=1,r=1, n=8 has only one weighted distinct prime, yet Ω(8)=3; it is caught by the square exception.
- `richert_empty_family`: The empty family has W=0.

**Source.** [HB-SIEVES](#source-hb-sieves), §6, equations(6.1)–(6.4),pp.39–44

<a id="SV-5-richert-weighted-sieve"></a>

### Richert weighted sieve

**Declaration:** `SieveWeighted.richert_weighted_sieve`. **Kind:** theorem.

For a family A_N⊆[1,N] with mass scale X_N, density g(p)=ω(p)/p, dimension-one prime-sum condition Σ_(z<p≤w)g(p)log p=log(w/z)+O(1), square-exception mass O(X_N/log²N), and remainder Σ_(d<N^γ)|R_d|=O(X_N/log²N), choose0<α<β<γ,(r+1)β>1. If f(γ/α)>[β/((r+1)β−1)]∫_α^β(1/v−1/β)F((γ−v)/α)dv, then the mass of P_r values is ≫X_N/log N. Uniform constants and sufficiently large N are part of the statement.

**Hypotheses and conventions.** All five hypotheses above; strict positivity; nonnegative weights; primes missing from the sieve treated separately.

**Prerequisites.** [Richert logarithmic weights](#SV-5-richert-logarithmic-weights); [Rosser–Iwaniec linear sieve](#SV-5-linear-sieve-main-estimate); `AnalyticNumberTheory:AN.2`.

**Proof route.** Apply the lower linear sieve to A and upper linear sieve to each A_p at level N^γ/p. Count each remainder only O_α,β,γ(1) times.

**Source.** [HB-SIEVES](#source-hb-sieves), Theorems6.1–6.2 and equations(6.3)–(6.6),pp.42–45

**Open proof inputs.** [Richert numerical optimization and square exception](#g-richert).

<a id="SV-5-richert-level-threshold"></a>

### Richert explicit level threshold

**Declaration:** `SieveWeighted.richert_threshold`. **Kind:** theorem.

For integer r≥1 put Λ_r=r+1−log(4/(1+3^(−r)))/log3. Under the other Richert assumptions, γ>1/Λ_r yields ≫X/log N P_r values by α=γ/4 and β=γ/(1+3^(−r)). In particular γ<1/2 sufficiently near1/2 gives Goldbach prime+P₃, whereas this criterion does not yield prime+P₂.

**Hypotheses and conventions.** Strict γ threshold; Λ_r>0; square and remainder hypotheses retained.

**Prerequisites.** [Richert weighted sieve](#SV-5-richert-weighted-sieve); [Weighted prime-distribution transfer](#SV-3-weighted-prime-distribution).

**Proof route.** Integrate the explicit small-range linear functions, then substitute α,β. Verify the strict threshold before invoking the transferred prime progression estimates.

**Source.** [HB-SIEVES](#source-hb-sieves), Theorem6.2 and Example2,pp.45–46

**Open proof inputs.** [Richert numerical optimization and square exception](#g-richert).

<a id="SV-5-chen-switching-weight"></a>

### Chen switching weight

**Declaration:** `SieveWeighted.chenWeight`. **Kind:** definition.

For N>1,z=N^(1/10) and0<n<N, let a_N(n) indicate a representation n=p₁p₂p₃ with primes p₁<N^(1/3)≤p₂≤p₃. Put c_N(n)=1_(n z-rough)[1−ω_[z,N^(1/3))(n)/2−a_N(n)/2]. On squarefree n, c_N(n)≤1_(Ω(n)≤2). Non-squarefree mass must be estimated separately.

**Hypotheses and conventions.** Strict n<N; full small-prime roughness, apart from fixed prime divisors of N that cannot divide N−p except finitely many primes.

**Prerequisites.** `Nat.primeFactors` (Mathlib); `ArithmeticFunction.cardFactors` (Mathlib).

**Proof route.** Count distinct small factors and distinguish the three-factor configuration with exactly one below N^(1/3). This is a weight inequality, not the analytical switched-sequence estimate.

**API.**

- `SieveWeighted.chenTriple` (constructor): The prime-factor triple indicator a_N.
- `SieveWeighted.chenWeight` (constructor): The explicit rough switching weight.
- `SieveWeighted.chenWeight_le_one` (relation): For0<n<N, c_N(n)≤1.
- `SieveWeighted.chenWeight_squarefree` (relation): On squarefree0<n<N, c_N(n)≤1_(Ω(n)≤2).
- `SieveWeighted.chenWeight_sum_bound` (compatibility): The weighted sum is bounded by the P₂ count plus the mass of nonsquarefree terms.

**Unit tests.**

- `chen_rough_prime`: For N=1000, n=11 has weight1.
- `chen_residual_triple`: For N=1000,n=2·11·13, the small factor2 and triple correction give weight0.
- `chen_small_factor`: For N=1000,n=3, the rough single-prime weight is1/2, not1.
- `chen_nonsquarefree`: For N=1000,n=3³=27 the weight is1/2 even though Ω=3; the squarefree restriction is necessary.

**Source.** [HB-SIEVES](#source-hb-sieves), Sketch of Chen’s theorem,pp.47–48, equation(6.7)

<a id="SV-5-chen-switched-distribution"></a>

### Chen switched triple upper bound

**Declaration:** `SieveWeighted.chen_switched_distribution`. **Kind:** theorem.

For even N sufficiently large, set Q_N=∏_(2≤q<N^(1/4),q prime)q. Count ordered prime triples satisfying N^(1/10)<p₁≤N^(1/3)<p₂≤sqrt(N/p₁), p₂≤p₃≤N/(p₁p₂), and gcd(N−p₁p₂p₃,Q_N)=1. Their count T_N is≤3.9404 C_N N/log²N, with C_N the Goldbach local factor. Each triple has its ordering and multiplicity; this is an upper bound for the switched correction, not ordinary BV.

**Hypotheses and conventions.** Even N above an absolute threshold; strict/inclusive cutoffs as displayed; all three entries prime; all primes dividing N retained in the local factor.

**Prerequisites.** [Goldbach local factor](#SV-5-goldbach-local-factor); [Selberg optimal weights](#SV-1-selberg-optimal-weights); [Primitive-character large sieve](#SV-2-primitive-large-sieve); `AnalyticNumberTheory:AN.3`.

**Proof route.** Use the explicit Selberg coefficients supported on d≤N^(1/4−ε/2), replace the p₃ sum by a smoothed von Mangoldt sum, and separate principal and primitive character contributions (original equations(5)–(11)).

**Source.** [CHEN-73-CN](#source-chen-73-cn), Definition of Ω,p.116; Lemmas5–7,pp.117–124; Lemma8 and equations(23)–(24),pp.124–125

**Open proof inputs.** [Chen switching distribution and numerical certificates](#g-chen).

<a id="SV-5-chen-goldbach"></a>

### Chen’s Goldbach theorem

**Declaration:** `SieveWeighted.chen_goldbach`. **Kind:** theorem.

There are absolute c>0,N₀ such that every even N≥N₀ has at least cN/log²N representations N=p+m with p prime and1≤Ω(m)≤2. A singular-factor refinement multiplies the bound by ∏_(odd p|N)(p−1)/(p−2); numerical constant0.67 in Chen’s normalization is not a claimed verified endpoint here.

**Hypotheses and conventions.** Even sufficiently large N; Ω counts multiplicity, so prime squares are allowed.

**Prerequisites.** [Chen switching weight](#SV-5-chen-switching-weight); [Chen switched triple upper bound](#SV-5-chen-switched-distribution); [Selberg upper-bound sieve](#SV-1-selberg-upper-bound); [Chen original-family lower estimate](#SV-5-chen-original-family-lower).

**Proof route.** Original equation(28),p.128 bounds the desired count below by the original weighted prime count minus T_N/2 minus N^0.91, after accounting for square and endpoint exceptions.

**Source.** [CHEN-73-CN](#source-chen-73-cn), Theorem1,p.112; HB Chen’s theorem,p.46

**Open proof inputs.** [Chen switching distribution and numerical certificates](#g-chen).

<a id="SV-5-chen-prime-shift"></a>

### Chen primes with an almost-prime shift

**Declaration:** `SieveWeighted.chen_prime_shift`. **Kind:** theorem.

For each fixed positive even h there are c_h>0,x_h such that for x≥x_h, #{p≤x:p prime,1≤Ω(p+h)≤2}≥c_hx/log²x. Thus there are infinitely many such primes.

**Hypotheses and conventions.** Fixed h>0 even; threshold and constant may depend on h.

**Prerequisites.** [Chen switched triple upper bound](#SV-5-chen-switched-distribution); [Chen switching weight](#SV-5-chen-switching-weight); [Weighted prime-distribution transfer](#SV-3-weighted-prime-distribution).

**Proof route.** Repeat the original switched argument for p+h with its h-dependent local factors; do not infer the shifted theorem merely from Goldbach.

**Source.** [CHEN-73-CN](#source-chen-73-cn), Theorem2,p.112

**Open proof inputs.** [Fixed even shift version of Chen switching](#g-chen-shift).

<a id="SV-5-joint-spin-setup"></a>

### Joint-spin arithmetic data

**Declaration:** `SieveJointSpin.JointSpinData`. **Kind:** construction.

Fix Galois K/Q of degree n, and if totally real assume every totally positive unit is a square. Choose nonempty S⊆Gal(K/Q) with σ∈S⇒σ⁻¹∉S. Choose two distinct odd integral ideals A_i,B_i in each ideal class, with squarefree norm of their combined product f; put F=2^(2h+3)N(f)D_K (use absolute discriminant for a positive modulus). Choose O_K^×=T_K×V_K and a residue weight ψ on units modF invariant under multiplying by unit squares.

**Hypotheses and conventions.** Native ring of integers, ideals, class group, embeddings, unit decomposition; ψ fixed and bounded.

**Prerequisites.** [GlobalNumberFields Layer 3 geometry of numbers and ray class ideal counting](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/GlobalNumberFields/README.md#layer-3-geometry-of-numbers-and-ray-class-ideal-counting); [GlobalNumberFields Layer 3 geometry of numbers and ray class ideal counting](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/GlobalNumberFields/README.md#layer-3-geometry-of-numbers-and-ray-class-ideal-counting); `ExponentialSumsAndCircleMethod:ES.0`; [Chebotarev Layer 13 ϑ_c and π_c](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Chebotarev/README.md#layer-13-ϑ_c-and-π_c).

**Proof route.** Use ray-class prime existence to choose class representatives with pairwise distinct degree-one norm primes avoiding2 and the discriminant.

**API.**

- `SieveJointSpin.JointSpinData` (data): Native arithmetic inputs and the specified class representatives, S,F and ψ.
- `SieveJointSpin.spinSet_no_identity` (relation): Identity cannot belong to S.
- `SieveJointSpin.spinSet_order_ge_three` (relation): Each σ∈S has order≥3.
- `SieveJointSpin.classRep_coprime_choice` (characterisation): For every integral ideal coprime toF select a representative from one of the two lists whose conjugates are also coprime to it.
- `SieveJointSpin.classRep_principal_generator` (compatibility): Multiplying an ideal by its inverse-class representative yields a native principal ideal with a generator in the imported domain.
- `SieveJointSpin.spinModulus_even` (relation): F is divisible by8 and by all class-representative norms and |D_K|.

**Unit tests.**

- `spin_identity_excluded`: S={id} fails the inverse-pair condition.
- `spin_involution_excluded`: An automorphism of order2 cannot be included.
- `spin_cubic_singleton`: In a cyclic cubic extension S={σ} is allowed, but S={σ,σ²} fails.
- `spin_bad_representatives`: Reusing one degree-one prime in A_i and B_j makes N(f) nonsquarefree and fails the setup.

**Source.** [KM-21](#source-km-21), §2.1–2.5,pp.3–8,equations(2.1)–(2.3)

**Open proof inputs.** [Native joint-spin arithmetic interfaces](#g-spin-native).

<a id="SV-5-joint-spin-symbol"></a>

### Joint spin of ideals

**Declaration:** `SieveJointSpin.jointSpin`. **Kind:** definition.

For odd totally positive α put spin_σ(α)=(α/σ(α))_(K,2), using the quadratic ideal residue symbol. For an odd principal ideal a=(α), prime toF, put s_a=Σ_(t∈T_K,v∈V_K/V_K²)1_(tvα totally positive)ψ(tvα modF)∏_(σ∈S)spin_σ(tvα); for other ideals put s_a=0. The coefficient sequence is independent of generator and coset representatives. Totally complex fields require the full unit average; real fields with the square-unit hypothesis have one positive coset.

**Hypotheses and conventions.** Odd nonzero denominator; ideals coprime toF for residue evaluation; ψ unit-square invariant.

**Prerequisites.** [Joint-spin arithmetic data](#SV-5-joint-spin-setup); [GlobalNumberFields Layer 3 geometry of numbers and ray class ideal counting](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/GlobalNumberFields/README.md#layer-3-geometry-of-numbers-and-ray-class-ideal-counting); [Quadratic ideal residue symbol adapter](#SV-5-ideal-quadratic-symbol); [ClassFieldTheory Layer 14 hilbert reciprocity and quadratic reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/ClassFieldTheory/README.md#layer-14-hilbert-reciprocity-and-quadratic-reciprocity).

**Proof route.** Assemble the native finite-field quadratic characters through ideal factorization using idealQuadraticSymbol. Import Hilbert reciprocity from ClassFieldTheory for the kernel comparison, retaining dyadic and infinite factors.

**API.**

- `SieveJointSpin.spin` (constructor): The individual element spin with the ideal-symbol denominator σ(α).
- `SieveJointSpin.jointSpin` (constructor): The finite unit-coset sum, zero off the specified ideal domain.
- `SieveJointSpin.spin_unit_square` (compatibility): spin_σ(u²α)=spin_σ(α) for an odd unit u.
- `SieveJointSpin.jointSpin_generator_independent` (characterisation): The sequence depends on the ideal, not its chosen generator.
- `SieveJointSpin.jointSpin_real` (characterisation): Under the real-unit hypothesis only the unique positive unit coset survives.
- `SieveJointSpin.jointSpin_complex` (characterisation): All torsion/free-unit cosets occur with the residue weight.
- `SieveJointSpin.jointSpin_abs` (relation): |s_a|≤|T_K|2^rank(V_K) sup|ψ|; the real bound is sup|ψ|.
- `SieveJointSpin.jointSpin_nonprincipal` (simp): Nonprincipal or even ideals have coefficient0.

**Unit tests.**

- `spin_unit_ideal`: spin_σ(1)=1: the unit denominator gives an empty prime-ideal product.
- `spin_rational_nonunit`: For odd integer m>1, spin_σ(m)=0 since numerator and denominator share every prime ideal dividing m.
- `spin_square_unit_invariance`: Replacing α by u²α preserves the individual spin; replacing it by an arbitrary unit need not.
- `spin_nonprincipal_zero`: A nonprincipal ideal has joint coefficient0 even if it is odd.
- `spin_complex_average`: With ψ=0 all joint coefficients vanish; a definition omitting ψ would fail.

**Source.** [KM-21](#source-km-21), §2.3,pp.5–6,equation(2.4)

**Open proof inputs.** [Native joint-spin arithmetic interfaces](#g-spin-native).

<a id="SV-5-joint-spin-short-character-input"></a>

### Short character input for joint spins

**Declaration:** `SieveJointSpin.joint_spin_short_input`. **Kind:** comparison.

Import Conjecture C_m with m=|S|n: for a primitive nonprincipal real Dirichlet character of conductor q, interval length N≤q^(1/m), the short sum is O_m(q^((1−δ)/m)) for some δ>0. The progression corollary for odd squarefree q>1 and q∤k uses reciprocity/reduction with a possibly smaller positive δ. This is an explicit hypothesis, not a theorem of this roadmap.

**Hypotheses and conventions.** C_|S|n; arbitrary interval origin; the source progression coprimality/reduction hypotheses.

**Prerequisites.** `ExponentialSumsAndCircleMethod:ES.0`; [Joint-spin arithmetic data](#SV-5-joint-spin-setup).

**Proof route.** ES.0 supplies the exact conductor-sensitive formulation and Corollary2.2; record the exponent(1−δ)/m.

**Source.** [KM-21](#source-km-21), §2.5,ConjectureC_n and Corollary2.2,pp.7–8

**Open proof inputs.** [Native joint-spin arithmetic interfaces](#g-spin-native).

<a id="SV-5-spin-squarefull-norm-tail"></a>

### Squarefull norm tail for spin divisors

**Declaration:** `SieveJointSpin.spin_squarefull_tail`. **Kind:** theorem.

For σ of order m≥3, choose O_K=O_(K^σ)⊕M′. For β∈M′ with every embedding bounded by x^(1/n), let g_σ(β) be the bad-prime ideal factor of β−σβ in KM§3 and g₀ its norm radical. Then #{β:g₀>Z}≪_(K,ε)x^(1−1/m+ε)Z^(−1+2/m).

**Hypotheses and conventions.** x≥2,Z≥1; the exact higher-residue-degree, conjugate-collision and repeated-prime bad factor; β−σβ≠0.

**Prerequisites.** [Joint-spin arithmetic data](#SV-5-joint-spin-setup); [GlobalNumberFields Layer 3 geometry of numbers and ray class ideal counting](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/GlobalNumberFields/README.md#layer-3-geometry-of-numbers-and-ray-class-ideal-counting); `GeometryOfNumbersAndQuadraticArithmetic:GN.4`.

**Proof route.** Bad factors have squarefull norm and the good quotient is a squarefree rational modulus. Sum over the norm tail using lattice covolume and successive minima.

**Source.** [KM-21](#source-km-21), Lemma3.1,pp.13–14

**Open proof inputs.** [Native joint-spin arithmetic interfaces](#g-spin-native), [Geometric lattice tails for joint spins](#g-spin-tails).

<a id="SV-5-spin-common-norm-tail"></a>

### Common norm tail for two spin differences

**Declaration:** `SieveJointSpin.spin_common_norm_tail`. **Kind:** theorem.

For σ,τ∈S distinct, decompose O_K=Z⊕M. For β∈M with all embeddings≤x^(1/n), #{β:gcd(|N(β−σβ)|,|N(β−τβ)|)>Z}≪_(K,ε)x^((n−1)/n+ε)Z^(−1/18)+x^((n−2)/n)+Z^((2n−4)/3).

**Hypotheses and conventions.** x≥2,Z≥1; S excludes inverse pairs; nonzero differences handled with their exceptional lower-dimensional locus.

**Prerequisites.** [Joint-spin arithmetic data](#SV-5-joint-spin-setup); `GeometryOfNumbersAndQuadraticArithmetic:GN.4`.

**Proof route.** Use independence of distinct automorphisms to obtain codimension-two reduction conditions outside finitely many primes.

**Source.** [KM-21](#source-km-21), Lemma3.2,pp.15–17

**Open proof inputs.** [Native joint-spin arithmetic interfaces](#g-spin-native), [Geometric lattice tails for joint spins](#g-spin-tails).

<a id="SV-5-joint-spin-type-i"></a>

### Type I estimate for joint spins

**Declaration:** `SieveJointSpin.joint_spin_typeI`. **Kind:** theorem.

Under C_|S|n with δ>0, for ε>0 the joint-spin sequence satisfies uniformly in integral ideal m, |Σ_(Na≤X,m|a)s_a|≪_(K,ψ,ε)X^(1−δ/(54n|S|²)+ε). Initially the proof treats m prime toF and its conjugates; extending to every m requires the explicit finite bad-prime and large-Nm cases.

**Hypotheses and conventions.** X≥2; fixed bounded ψ; the stated short-character conjecture; uniformity in m.

**Prerequisites.** [Joint spin of ideals](#SV-5-joint-spin-symbol); [Short character input for joint spins](#SV-5-joint-spin-short-character-input); [Squarefull norm tail for spin divisors](#SV-5-spin-squarefull-norm-tail); [Common norm tail for two spin differences](#SV-5-spin-common-norm-tail); [GlobalNumberFields Layer 3 geometry of numbers and ray class ideal counting](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/GlobalNumberFields/README.md#layer-3-geometry-of-numbers-and-ray-class-ideal-counting).

**Proof route.** Principalize with class representatives, slice the fundamental domain into one-dimensional rational lines and apply Corollary2.2.

**Source.** [KM-21](#source-km-21), Equation(2.5),p.8; entire§3,pp.9–18

**Open proof inputs.** [Native joint-spin arithmetic interfaces](#g-spin-native), [Geometric lattice tails for joint spins](#g-spin-tails), [Uniform ideal Type I and FIMR conversion](#g-spin-conversion).

<a id="SV-5-joint-spin-kernel"></a>

### Joint-spin bilinear kernel

**Declaration:** `SieveJointSpin.spinKernel`. **Kind:** definition.

For odd elements α,β coprime toF define Φ(α,β)=∏_(σ∈S)(α/[σ(β)σ⁻¹(β)])_(K,2). It is multiplicative in both arguments. Reciprocity gives Φ(α,β)=ε(α mod8,β mod8)Φ(β,α). For fixed nonzero β its α-character has period |Nβ|O_K; its full sum over this quotient is zero when |Nβ| is not squarefull.

**Hypotheses and conventions.** Element arguments, not ideals; nonzero odd denominator; S has no inverse pairs.

**Prerequisites.** [Joint spin of ideals](#SV-5-joint-spin-symbol); [GlobalNumberFields Layer 3 geometry of numbers and ray class ideal counting](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/GlobalNumberFields/README.md#layer-3-geometry-of-numbers-and-ray-class-ideal-counting); [Quadratic ideal residue symbol adapter](#SV-5-ideal-quadratic-symbol); [ClassFieldTheory Layer 14 hilbert reciprocity and quadratic reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/ClassFieldTheory/README.md#layer-14-hilbert-reciprocity-and-quadratic-reciprocity).

**Proof route.** Factor the denominator prime ideals, isolate a rational norm prime occurring once and show exactly one unpaired conjugate contributes a nontrivial quadratic character.

**API.**

- `SieveJointSpin.spinKernel` (constructor): The displayed product of ideal residue symbols.
- `SieveJointSpin.spinKernel_mul_left` (compatibility): Multiplicativity in α.
- `SieveJointSpin.spinKernel_mul_right` (compatibility): Multiplicativity in β.
- `SieveJointSpin.spinKernel_reciprocity` (relation): The exchange sign depends only on residues mod8.
- `SieveJointSpin.spinKernel_period` (characterisation): In α the period divides |Nβ|O_K.
- `SieveJointSpin.spinKernel_complete_zero` (relation): Its complete period sum vanishes when |Nβ| is not squarefull.

**Unit tests.**

- `spin_kernel_unit`: Φ(α,1)=1 for odd α: every denominator is a unit.
- `spin_kernel_zero_numerator`: For nonunit denominator, α divisible by a denominator prime gives kernel0, not±1.
- `spin_kernel_product`: Φ(α₁α₂,β)=Φ(α₁,β)Φ(α₂,β), retaining zero values.
- `spin_kernel_period_norm`: A nonsquarefull |Nβ| forces the complete sum over O_K/|Nβ|O_K to vanish; a sum over O_K/(β) is not the stated test.

**Source.** [KM-21](#source-km-21), §4,(4.2)–(4.3),pp.20–21; Lemma4.1(P1)–(P3),p.19

**Open proof inputs.** [Native joint-spin arithmetic interfaces](#g-spin-native).

<a id="SV-5-number-field-kernel-bilinear"></a>

### Bilinear bound for spin kernels

**Declaration:** `SieveJointSpin.number_field_kernel_bilinear`. **Kind:** theorem.

For the element kernel Φ satisfying the corrected reciprocal residue-sign, multiplicativity and complete rational-norm-period cancellation conditions, and bounded coefficients on the imported generator domains of norms≤M,≤N, the bilinear sum is O_(K,ε)((M^(−1/(6n))+N^(−1/(6n)))(MN)^(1+ε)). Coefficients are bounded by1; fixed residue classes and finitely many class pairs change the constant.

**Hypotheses and conventions.** n≥3; correct domain and rational norm period; squarefull norm exceptional set; all native lattice-count bounds.

**Prerequisites.** [Joint-spin bilinear kernel](#SV-5-joint-spin-kernel); [GlobalNumberFields Layer 3 geometry of numbers and ray class ideal counting](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/GlobalNumberFields/README.md#layer-3-geometry-of-numbers-and-ray-class-ideal-counting); [ArithmeticDirichletSeries Layer 1 norm fibres and mathlib lseries](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/ArithmeticDirichletSeries/README.md#layer-1-norm-fibres-and-mathlib-lseries).

**Proof route.** Reconcile KM Lemma4.1 with the element version of Koymans–Milovic2018 Proposition3.6 before importing its proof. This referenced proof has not been read and is a recorded gap.

**Source.** [KM-21](#source-km-21), Lemma4.1,p.20 and its proof reference; verificationpp.21–22 (arXiv v1)

**Open proof inputs.** [Native joint-spin arithmetic interfaces](#g-spin-native), [Uniform ideal Type I and FIMR conversion](#g-spin-conversion).

<a id="SV-5-joint-spin-type-ii"></a>

### Type II estimate for joint spins

**Declaration:** `SieveJointSpin.joint_spin_typeII`. **Kind:** theorem.

For |v_a|,|w_b|≤1 and X,Y≥2, |Σ_(Na≤X,Nb≤Y)v_aw_bs_(ab)|≪_(K,ψ,ε)(X^(−1/(6n))+Y^(−1/(6n)))(XY)^(1+ε).

**Hypotheses and conventions.** Fixed bounded ψ; arithmetic setup; no short-character conjecture is required by this bilinear estimate.

**Prerequisites.** [Joint spin of ideals](#SV-5-joint-spin-symbol); [Bilinear bound for spin kernels](#SV-5-number-field-kernel-bilinear); [GlobalNumberFields Layer 3 geometry of numbers and ray class ideal counting](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/GlobalNumberFields/README.md#layer-3-geometry-of-numbers-and-ray-class-ideal-counting).

**Proof route.** Split into ideal-class pairs and residue classes modF, choose coprime class representatives and generators, and express the joint spin of a product as separate bounded coefficients times Φ.

**Source.** [KM-21](#source-km-21), Equation(2.6),p.8 and entire§4,pp.18–21

**Open proof inputs.** [Native joint-spin arithmetic interfaces](#g-spin-native).

<a id="SV-5-fimr-prime-sieve-conversion"></a>

### FIMR sieve conversion to prime ideals

**Declaration:** `SieveJointSpin.fimr_prime_conversion`. **Kind:** theorem.

Let |a_a|≤1 on nonzero integral ideals of a fixed number field. Suppose every ideal-divisibility sum A_d(X) is O_ε(X^(1−ϑ+ε)), uniformly in d, and the ideal bilinear sums with |v_m|≤Λ(m),|w_n|≤τ(n) are O_ε((M+N)^θ(MN)^(1−θ+ε)), where0<ϑ,θ<1. Then Σ_(Na≤X)a_aΛ(a)=O_ε(X^(1−ϑθ/(2+θ)+ε)). Removing prime powers yields the same power saving for the unweighted prime sum, after partial summation.

**Hypotheses and conventions.** Uniform TypeI; divisor/logarithmic coefficient norms; ideal-count and divisor moments from ADS; X≥2.

**Prerequisites.** [ArithmeticDirichletSeries Layer 1 norm fibres and mathlib lseries](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/ArithmeticDirichletSeries/README.md#layer-1-norm-fibres-and-mathlib-lseries); [Type I estimate for joint spins](#SV-5-joint-spin-type-i); [Type II estimate for joint spins](#SV-5-joint-spin-type-ii).

**Proof route.** Proposition5.1 uses the exact ideal von Mangoldt convolution identity, the hyperbola separation kernel and a cutoff y with z=X/y≥y.

**Source.** [FIMR-13](#source-fimr-13), Propositions5.1–5.2,pp.21–24

**Open proof inputs.** [Native joint-spin arithmetic interfaces](#g-spin-native), [Uniform ideal Type I and FIMR conversion](#g-spin-conversion).

<a id="SV-5-joint-spin-prime-oscillation"></a>

### Oscillation of joint spins over prime ideals

**Declaration:** `SieveJointSpin.joint_spin_prime_oscillation`. **Kind:** theorem.

Under the arithmetic setup and C_|S|n with δ>0, for every ε>0, Σ_(Np≤X,p prime)s_p=O_(K,ψ,ε)(X^(1−δ/[54|S|²n(12n+1)]+ε)), X≥2. The source’s dependence only on K,ε is read with ψ fixed; unrestricted scaling of ψ cannot leave the constant unchanged.

**Hypotheses and conventions.** Fixed bounded ψ; all setup and TypeI uniformity hypotheses; conjectural short-character input.

**Prerequisites.** [FIMR sieve conversion to prime ideals](#SV-5-fimr-prime-sieve-conversion); [Type I estimate for joint spins](#SV-5-joint-spin-type-i); [Type II estimate for joint spins](#SV-5-joint-spin-type-ii).

**Proof route.** Use ϑ=δ/(54n|S|²),θ=1/(6n) in the FIMR exponent.

**Source.** [KM-21](#source-km-21), Theorem1,p.2 and §2.6,pp.8–9

**Open proof inputs.** [Native joint-spin arithmetic interfaces](#g-spin-native), [Uniform ideal Type I and FIMR conversion](#g-spin-conversion).

<a id="SV-5-joint-spin-sign-patterns"></a>

### Equidistribution of joint spin signs

**Declaration:** `SieveJointSpin.joint_spin_sign_patterns`. **Kind:** theorem.

For totally real Galois K/Q with the positive-unit square property, admissible nonempty S={σ₁,…,σ_t}, and C_tn, each sign vector e∈{±1}^t has asymptotic proportion2^(−t) among principal prime ideals of norm≤X as X→∞.

**Hypotheses and conventions.** Real field; principal prime denominator; no inverse pairs; short-character hypothesis.

**Prerequisites.** [Oscillation of joint spins over prime ideals](#SV-5-joint-spin-prime-oscillation); [Short character input for joint spins](#SV-5-joint-spin-short-character-input); [ArithmeticDirichletSeries Layer 1 norm fibres and mathlib lseries](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/ArithmeticDirichletSeries/README.md#layer-1-norm-fibres-and-mathlib-lseries); [Chebotarev Layer 13 ϑ_c and π_c](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Chebotarev/README.md#layer-13-ϑ_c-and-π_c).

**Proof route.** Expand the sign indicator into the finite Fourier sum over subsets of S. Apply the oscillation theorem to each nonempty subset using the explicit transferred short-character bound.

**Source.** [KM-21](#source-km-21), Theorem2,p.2; proof§2.6,pp.8–9

**Open proof inputs.** [Native joint-spin arithmetic interfaces](#g-spin-native), [Uniform ideal Type I and FIMR conversion](#g-spin-conversion).

<a id="SV-5-affine-primitive-pair"></a>

### Primitive affine sieve pair

**Declaration:** `SieveAffine.IsPrimitivePair`. **Kind:** definition.

For O⊆Z^d and integer polynomial f integral on O, (O,f) is primitive if for every integer q≥2 there is x∈O with gcd(|f(x)|,q)=1. This is stronger than gcd of all values being1: the surviving point must avoid every prime dividing a composite q simultaneously. Integer polynomial coordinates use native MvPolynomial.

**Hypotheses and conventions.** O nonempty follows from primitivity; integer-valued polynomial; nonzero/nonunit target hypotheses are additional.

**Prerequisites.** `MvPolynomial` (Mathlib).

**Proof route.** Use native integer evaluation and simultaneous congruence avoidance. Strong approximation supplies the finite local-obstruction reduction for the algebraic-group applications.

**API.**

- `SieveAffine.IsPrimitivePair` (constructor): The displayed all-composite-moduli coprimality predicate.
- `SieveAffine.primitivePair_nonempty` (relation): Primitive O is nonempty.
- `SieveAffine.primitivePair_sign` (compatibility): Replacing f by−f preserves primitivity.
- `SieveAffine.primitivePair_fixed_prime` (relation): If one prime divides every value then the pair is not primitive.
- `SieveAffine.primitivePair_moduli` (characterisation): It suffices to test squarefree moduli, retaining simultaneous avoidance.
- `SieveAffine.primitivePair_local_product` (compatibility): If reduction images split over the prime factors by CRT, primitivity is equivalent to avoiding each local zero locus.

**Unit tests.**

- `affine_variable_primitive`: For O=Z and f(T)=T, choose1; the pair is primitive.
- `affine_fixed_two`: For f(T)=2T+2 onZ the pair is not primitive.
- `affine_composite_obstruction`: Values{2,3} have gcd1 and individually avoid2 and3, but fail primitivity atq=6.
- `affine_empty_obstruction`: An empty orbit fails primitivity.

**Source.** [BGS-10](#source-bgs-10), Definition of primitive pair§1,pp.560–561; local obstruction discussion§2.4,pp.571–573

<a id="SV-5-affine-saturation-locus"></a>

### Affine almost-prime locus and saturation

**Declaration:** `SieveAffine.almostPrimeLocus`. **Kind:** definition.

For integer polynomial f and orbit O, O_r={x∈O:f(x)≠0 and Ω(|f(x)|)≤r}. The pair saturates when some O_r is Zariski dense in the Zariski closure of O, and its saturation number is the least such r. Use signed values through absolute value. For the affine-coordinate prototype, relative polynomial density means every rational polynomial vanishing on O_r vanishes on O; identify this adapter with the native Zariski closure before packaging.

**Hypotheses and conventions.** Finite coordinate dimension; native polynomial evaluation; no positivity restriction.

**Prerequisites.** `MvPolynomial` (Mathlib); `ArithmeticFunction.cardFactors` (Mathlib); `Nat.IsAtMostAlmostPrime` (Mathlib).

**Proof route.** Define the arithmetic locus using native Ω, excluding0. Reuse native zero loci/topology rather than constructing a second algebraic geometry. The polynomial-density characterization is an explicit comparison gap to the scheme carrier.

**API.**

- `SieveAffine.almostPrimeLocus` (constructor): The displayed subset O_r.
- `SieveAffine.PolynomiallyDenseOn` (constructor): The rational-polynomial vanishing adapter for relative Zariski density.
- `SieveAffine.IsSaturated` (constructor): Existence of an r with the relative-density property.
- `SieveAffine.saturationNumber` (constructor): The least such r, with0 as the non-saturating convention.
- `SieveAffine.almostPrimeLocus_mono` (relation): The loci increase with r.
- `SieveAffine.almostPrimeLocus_sign` (compatibility): Replacing f by−f gives the same locus.
- `SieveAffine.almostPrimeLocus_zero` (simp): Zeros never belong to the locus.
- `SieveAffine.saturationNumber_spec` (characterisation): For a saturated pair its least r has the relative-density property.

**Unit tests.**

- `affine_negative_semiprime`: A value−6 belongs to O₂; omitting absolute value fails.
- `affine_prime_cube`: A value8 fails O₂ since Ω(8)=3, despite one distinct prime factor.
- `affine_zero_excluded`: A value0 fails every locus, despite native Ω(0)=0.
- `affine_unit_locus`: Values±1 belong to O₀; the main theorem separately excludes a unit polynomial.

**Source.** [BGS-10](#source-bgs-10), Saturation definition§1,pp.560–561; signed-prime conventionp.563

**Open proof inputs.** [Native affine group and quotient interfaces](#g-affine-native).

<a id="SV-5-affine-walk-sieve-data"></a>

### Affine walk sieve data

**Declaration:** `SieveAffine.walkSieve`. **Kind:** construction.

For a finite set Ω_L of reduced words of length≤L in a free Zariski-dense subgroup Γ₁, map each word to its integral matrix/orbit point. Push forward counting mass to native BoundingSieve data for the divisibility of f. Repeated values retain their word multiplicity; X_L=#Ω_L. For squarefree d set β(d)=#{g∈Γ₁ mod d:f(g)=0}/#(Γ₁ mod d), and R_d=count_d−β(d)X_L.

**Hypotheses and conventions.** Integral orbit evaluation; finite word ball; native reduction maps; nonzero divisibility value0 is treated in the sifted zero-locus exception.

**Prerequisites.** [Weighted finite-family sieve](#SV-0-finite-family-sieve); [Primitive affine sieve pair](#SV-5-affine-primitive-pair); `AdelicAlgebraicGroups:AA.4`.

**Proof route.** Use the existing finite-family bridge and native finite group quotient. Do not replace a weighted multiset with a set of distinct polynomial values.

**API.**

- `SieveAffine.walkSieve` (constructor): The native sieve from word-evaluation multiplicities.
- `SieveAffine.walkSieve_mass` (compatibility): Total mass equals the number of words.
- `SieveAffine.walkSieve_divisibility` (characterisation): Its divisor sum counts the corresponding word preimages.
- `SieveAffine.walkSieve_remainder` (characterisation): The remainder is the exact count minus β(d)X_L.
- `SieveAffine.walkDensity_crt` (compatibility): On good coprime squarefree moduli the local densities multiply.
- `SieveAffine.walkSieve_sifted` (characterisation): The sifted sum counts words avoiding all specified small local primes.

**Unit tests.**

- `affine_repeated_values`: Two distinct words with the same f-value contribute mass2.
- `affine_identity_word`: The length0 word ball has one word, not an empty family.
- `affine_zero_value`: A word with f=0 is divisible by every prime and contributes no sifted mass once a prime is sieved.
- `affine_empty_prime_product`: With no local primes the sifted mass is the full word mass.

**Source.** [BGS-10](#source-bgs-10), §3.1pp.573–574; §3.3equations(3.24)–(3.32),pp.577–579

**Open proof inputs.** [Native affine group and quotient interfaces](#g-affine-native).

<a id="SV-5-affine-local-densities"></a>

### Local densities for affine orbits

**Declaration:** `SieveAffine.affine_local_density`. **Kind:** theorem.

For connected simply connected absolutely almost simple G/Q, finitely generated Zariski-dense integral Γ, and f a product of t distinct absolutely irreducible factors on G, outside finitely many primes β(p)=t/p+O(p^(−3/2)). The density is multiplicative on good squarefree moduli, and primitive(O,f) implies β(p)<1 at all relevant local primes. Thus the sieve has dimension t with the excluded finite primes explicitly included in the modulus.

**Hypotheses and conventions.** Geometric factors distinct; nonzero/nonunit f; good reduction; strong-approximation image statement; local primitivity.

**Prerequisites.** [Primitive affine sieve pair](#SV-5-affine-primitive-pair); `AdelicAlgebraicGroups:AA.4`; `FiniteFieldsAndCharacterSums:FF.2`.

**Proof route.** Use strong approximation for the finite reduction image and Lang–Weil on each geometric hypersurface. Intersections contribute lower-dimensional errors.

**Source.** [BGS-10](#source-bgs-10), §3.1–3.3,Proposition3.1 and equations(3.34)–(3.40),pp.574–581

**Open proof inputs.** [Native affine group and quotient interfaces](#g-affine-native).

<a id="SV-5-affine-expansion-level"></a>

### Affine sieve level from expansion

**Declaration:** `SieveAffine.affine_expansion_level`. **Kind:** theorem.

Assume a uniform squarefree congruence expansion bound yielding |R_d|≤C X_L^τ d^(dimG−1) with τ<1 for the word ball, uniformly for squarefree good d. Then Σ_(d≤D)|R_d|≤C′X_L^τD^dimG. Hence every δ<(1−τ)/dimG is an admissible power level D=X_L^δ.

**Hypotheses and conventions.** Fixed generators and finite excluded modulus; nonnegative finite-word mass; τ<1; actual spectral mixing estimate.

**Prerequisites.** [Affine walk sieve data](#SV-5-affine-walk-sieve-data); [Local densities for affine orbits](#SV-5-affine-local-densities).

**Proof route.** Complete the finite-quotient mixing argument with the word-ball recurrence and the operator spectral gap, then sum the polynomial error in d.

**Source.** [BGS-10](#source-bgs-10), Equations(3.29)–(3.33),pp.578–580

**Open proof inputs.** [Affine squarefree expansion and primitive coset reduction](#g-affine-expansion).

<a id="SV-5-affine-escape-subvarieties"></a>

### Escape from proper algebraic subvarieties

**Declaration:** `SieveAffine.affine_escape`. **Kind:** theorem.

For the same word balls with squarefree expansion, each proper algebraic subvariety W⊊G has # {words:w evaluates in W}≤C_WX_L^(1−δ_W) for some δ_W>0. This beats the sieve lower count ≫X_L/log^tX_L.

**Hypotheses and conventions.** Proper W; positive spectral gap; strong approximation; fixed variety and generators.

**Prerequisites.** [Affine sieve level from expansion](#SV-5-affine-expansion-level); `FiniteFieldsAndCharacterSums:FF.2`.

**Proof route.** Choose good primes for which the reduction of W has codimension≥1, use its O(p^(dimG−1)) point count and the congruence mixing error, and optimize p.

**Source.** [BGS-10](#source-bgs-10), Proposition3.2,pp.582–584

**Open proof inputs.** [Native affine group and quotient interfaces](#g-affine-native), [Affine squarefree expansion and primitive coset reduction](#g-affine-expansion).

<a id="SV-5-affine-sieve-saturation"></a>

### Affine sieve saturation with expansion

**Declaration:** `SieveAffine.affine_saturation`. **Kind:** theorem.

For connected simply connected absolutely almost simple G/Q, finitely generated Zariski-dense Γ⊆G(Q)∩GL_n(Z), integral nonzero nonunit f with t geometric irreducible factors, and primitive(Γ,f), uniform squarefree congruence expansion implies finite saturation number. The same follows for integral orbit images under the source’s pullback/covering hypotheses.

**Hypotheses and conventions.** All algebraic hypotheses; squarefree expansion; signed |f|; dominant orbit map for transfer.

**Prerequisites.** [Affine almost-prime locus and saturation](#SV-5-affine-saturation-locus); [Affine sieve level from expansion](#SV-5-affine-expansion-level); [Escape from proper algebraic subvarieties](#SV-5-affine-escape-subvarieties); [Brun fundamental sieve estimate](#SV-1-brun-fundamental-estimate).

**Proof route.** Extract a free Zariski-dense subgroup with a primitive coset/modulus adapter; this algebraic reduction needs the exact source§2 proof and is a recorded gap.

**Source.** [BGS-10](#source-bgs-10), Theorem1.1,p.564; §3.3equations(3.41)–(3.51),pp.581–584

**Open proof inputs.** [Native affine group and quotient interfaces](#g-affine-native), [Affine squarefree expansion and primitive coset reduction](#g-affine-expansion).

<a id="SV-5-affine-explicit-factor-bound"></a>

### Explicit affine almost-prime bound

**Declaration:** `SieveAffine.affine_factor_bound`. **Kind:** theorem.

For a free rank-k subgroup with word growth r=2k−1>1, mixing exponent τ<1, matrix-entry height base C>1, and f of polynomial degree d, every integer R strictly larger than 9t dim(G)d log C/[(1−τ)log r] is an admissible saturation bound after the source’s finite local modifications. Strict inequality permits the distribution and Brun endpoint losses.

**Hypotheses and conventions.** Actual free-word growth and height estimate; inherited primitive-coset and expansion hypotheses.

**Prerequisites.** [Affine sieve saturation with expansion](#SV-5-affine-sieve-saturation); [From roughness to an almost-prime bound](#SV-5-rough-to-at-most-almost-prime).

**Proof route.** Choose δ<(1−τ)/dimG and s>9t close enough to their endpoints. Compare Ω≤log|f|/logz and let L grow.

**Source.** [BGS-10](#source-bgs-10), Equation(3.51),p.581

**Open proof inputs.** [Native affine group and quotient interfaces](#g-affine-native), [Affine squarefree expansion and primitive coset reduction](#g-affine-expansion).

<a id="SV-5-sl2-squarefree-expansion"></a>

### Squarefree congruence expansion for SL₂

**Declaration:** `SieveAffine.sl2_squarefree_expansion`. **Kind:** theorem.

For finitely generated Zariski-dense Γ≤SL₂(Z) and a finite symmetric generating set, the Cayley graphs Γ/Γ(q) over squarefree q form a uniform expander family, in the ordinary spectral-gap sense. This proves the expansion hypothesis needed by the SL₂ affine-saturation case.

**Hypotheses and conventions.** Squarefree q; actual image quotient Γ/Γ(q); no claim for arbitrary prime powers or arbitrary G.

**Prerequisites.** `AdditiveCombinatorics:AC.1`; `AdelicAlgebraicGroups:AA.4`.

**Proof route.** Import the squarefree-ring sum-product theorem and noncommutative Balog–Szemerédi–Gowers input; these belong to AC.1.

**Source.** [BGS-10](#source-bgs-10), Theorem1.2,p.565; proof§4,pp.584–615

**Open proof inputs.** [Native affine group and quotient interfaces](#g-affine-native), [Affine squarefree expansion and primitive coset reduction](#g-affine-expansion).

<a id="SV-5-goldbach-local-factor"></a>

### Goldbach local factor

**Declaration:** `SieveWeighted.goldbachLocalFactor`. **Kind:** definition.

Let C₂=∏_(p>2 prime)(1−1/(p−1)²) and C_N=C₂∏_(odd p|N)(p−1)/(p−2) for N>0; use C₀=0. The infinite product converges to a positive constant and each finite correction is≥1. It is the same factor in Chen’s two main estimates.

**Hypotheses and conventions.** Natural N; odd primes in both products; the finite product uses distinct factors.

**Prerequisites.** `Nat.primeFactors` (Mathlib); `AnalyticNumberTheory:AN.2`.

**Proof route.** The sum of1/(p−1)² converges and each factor is positive; invoke the convergent positive-product criterion. The finite correction depends on the radical, not Ω.

**API.**

- `SieveWeighted.goldbachLocalFactor` (constructor): The displayed C_N including its zero convention.
- `SieveWeighted.goldbachLocalFactor_positive` (relation): C_N>0 for N>0.
- `SieveWeighted.goldbachLocalFactor_radical` (compatibility): Positive N,M with the same odd prime divisors have equal factors.
- `SieveWeighted.goldbachLocalFactor_two` (simp): C₂ at N=2 equals the universal odd-prime product.
- `SieveWeighted.goldbachLocalFactor_add_prime` (relation): For odd prime p∤N, C_(Np)=C_N(p−1)/(p−2).

**Unit tests.**

- `goldbach_factor_three`: C_6=2C_2.
- `goldbach_factor_five`: C_10=(4/3)C_2.
- `goldbach_factor_prime_power`: C_18=C_6; multiplicity does not add another local factor.
- `goldbach_factor_zero`: C_0=0; the infinite-divisor convention is not used.

**Source.** [CHEN-73-CN](#source-chen-73-cn), Theorem1,p.112; Lemmas7–9,pp.123–125

<a id="SV-5-chen-original-family-lower"></a>

### Chen original-family lower estimate

**Declaration:** `SieveWeighted.chen_original_lower`. **Kind:** theorem.

Let P_N(z) count primes p≤N for which q∤N−p for every prime3≤q<z. Let P_N(q,z) count those same primes additionally satisfying q|N−p. For even N sufficiently large, at z=N^(1/10), P_N(z)−(1/2)Σ_(z<q≤N^(1/3),q prime)P_N(q,z)≥2.6408 C_N N/log²N. The finite exceptional primes dividing N and endpoint equalities are estimated separately in the final conversion.

**Hypotheses and conventions.** N even and above an absolute threshold; cutoffs exactly as stated; q=2 omitted from the original-family sieve.

**Prerequisites.** [Goldbach local factor](#SV-5-goldbach-local-factor); [Rosser–Iwaniec linear sieve](#SV-5-linear-sieve-main-estimate); [Weighted prime-distribution transfer](#SV-3-weighted-prime-distribution).

**Proof route.** Apply Richert1969 TheoremA and its uniform progression estimates at the displayed levels N^(1/2−ε) and N^(1/2−ε)/q. That original source is unread and is an explicit proof gap.

**Source.** [CHEN-73-CN](#source-chen-73-cn), Lemma9,pp.125–127, equations(25)–(27)

**Open proof inputs.** [Chen switching distribution and numerical certificates](#g-chen).

<a id="SV-5-ideal-quadratic-symbol"></a>

### Quadratic ideal residue symbol adapter

**Declaration:** `SieveJointSpin.idealQuadraticSymbol`. **Kind:** definition.

For a number field K, an element α∈O_K and nonzero ideal a of odd absolute norm, define (α/a) as the product over prime-ideal factors p^e of quadraticChar(O_K/p)(α modp)^e. At the unit ideal the empty product is1. Extend by0 at the zero ideal and at even-norm ideals. This is an adapter of native finite-field characters and ideal factorization, not a competing finite-field character or Hilbert symbol. For a nonzero odd element β write (α/β)=(α/(β)).

**Hypotheses and conventions.** Odd means coprime to2, equivalently odd positive absolute norm; ideal factors include multiplicity.

**Prerequisites.** `quadraticChar` (Mathlib); `Ideal.absNorm` (Mathlib); `Ideal.uniqueFactorizationMonoid` (Mathlib); `Ideal.Quotient.field` (Mathlib).

**Proof route.** Use unique factorization of nonzero ideals and native finite prime-ideal quotient fields. Multiply the native quadratic characters with their ideal valuations. The zero/even extension is outside the source’s odd-denominator domain.

**API.**

- `SieveJointSpin.idealQuadraticSymbol_top` (simp): The unit-ideal denominator gives1 for every numerator, including0.
- `SieveJointSpin.idealQuadraticSymbol_bot` (simp): The zero ideal has value0 by the explicit out-of-domain convention.
- `SieveJointSpin.idealQuadraticSymbol_mul` (relation): For positive odd-norm ideals a,b, (α/ab)=(α/a)(α/b), without a coprimality requirement on a,b.
- `SieveJointSpin.idealQuadraticSymbol_mul_left` (relation): For an odd nonzero ideal a, (αβ/a)=(α/a)(β/a).
- `SieveJointSpin.idealQuadraticSymbol_period` (characterisation): If α−β∈a then (α/a)=(β/a), for a nonzero odd ideal.
- `SieveJointSpin.idealQuadraticSymbol_zero_iff` (characterisation): For nonzero odd a, the symbol vanishes exactly when (α)+a is a proper ideal.
- `SieveJointSpin.idealQuadraticSymbol_unit_square` (compatibility): Multiplying α by a square unit preserves the symbol.
- `SieveJointSpin.idealQuadraticSymbol_rat` (compatibility): Over Q, the symbol for the ideal(n), n positive odd, agrees with jacobiSym(α,n) for integer α.

**Unit tests.**

- `ideal_symbol_unit`: For K=Q, (0/O_K)=1; the empty denominator product is not0.
- `ideal_symbol_nonsquare`: For K=Q, (2/(5))=−1.
- `ideal_symbol_square`: For K=Q, (4/(5))=1.
- `ideal_symbol_nonunit`: For K=Q, (15/(5))=0.
- `ideal_symbol_even_degree`: For any degree-two number field K/Q, (2/(5O_K))=1, although the rational Legendre symbol (2/5)=−1. A rational ideal denominator is not a rational-prime denominator.

**Acceptance.** A repeated prime-ideal factor squares its character; taking only the radical would change values.

**Source.** [FIMR-13](#source-fimr-13), §2,pp.5–6, ideal quadratic symbol definition; Lemma2.1,p.6

**Open proof inputs.** [Native joint-spin arithmetic interfaces](#g-spin-native).

## Exact supplier inputs

The following requests specify the mathematics used above. A supplier’s carrier or general theorem name does not imply a stronger uniform estimate.

**1. `AnalyticNumberTheory:AN.2`.** (1) Mertens' first theorem: Σ_{p≤x} log p/p = log x + O(1), hence Σ_{w≤p<z} log p/p = log(z/w) + O(1) uniformly in 2 ≤ w ≤ z, and Σ_{p≤x} 1/p = log log x + O(1) by partial summation. (2) The prime number theorem with error, in the form π(2N) − π(N) = N/log N + O(N/(log N)²). Maynard uses (1) for the hypothesis (Ω₂) of GGPY's lemma, for L ≪ log D₀, and for the (log R)^k bound in (5.9); he uses (2) for X_N in (5.27). Mathlib 082e2d3 has Chebyshev's bounds and Nat.tendsto_primeCounting, but neither statement.

**2. `AnalyticNumberTheory:AN.5`.** Generic Rankin smooth-number bound: for N≥0, integer z≥0 and δ>0, #Nat.smoothNumbersUpTo(N,z+1) ≤ N^δ ∏_{p prime,p≤z}(1−p^(−δ))⁻¹, with N=0 handled separately. This is Kedlaya Lemma 11.5 with the native strict smoothness threshold z+1 and positive integers only; provide the finite-geometric/positive Euler-product proof, not the native weaker 2^π(z)√N count. SV.0 defines no competing smooth-number carrier and its finite squarefree weighted Rankin theorems do not depend on this generic-count request.

**3. `GeometryOfNumbersAndQuadraticArithmetic:GN.4`.** The Khayutin L(C_l,θ_l) planar-domain input: area A, maximal curvature radius R, and |#(a⁻¹(E−x₀)∩Z²)−A/a²|≤C_l(R/a)^θ_l whenever a≥1,A≥a², uniformly in integer translates. Supply van der Corput θ=2/3+ε for C² convex domains and Huxley θ=131/208+ε for ellipses with the required C³ geometry. Davenport’s semialgebraic estimate is not this curvature-uniform estimate.

**4. [GlobalNumberFields Layer 11 orders and picard groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/GlobalNumberFields/README.md#layer-11-orders-and-picard-groups).** Use the existing invertible-order-ideal carrier and give the conductor-local norm count required to bound r_Λ(p^k) uniformly in k for a fixed quadratic order. Proper ideals and invertible ideals must stay distinct.

**5. `AnalyticNumberTheory:AN.2`.** For every Q≥2, uniform sums Σ_{s≤Q}τ(s)/φ(s)≪(1+log Q)² and Στ(s)²/φ(s)≪(1+log Q)^4; arbitrary fixed divisor moments for the weighted BV transfer, and a PNT error smaller than any prescribed power of log x. Also the degree-uniform squarefree d^ω/n lower bound and prime-product comparisons required by Khayutin Lemmas 9.8,9.11.

**6. `AnalyticNumberTheory:AN.3`.** A uniform small-conductor Siegel–Walfisz estimate for von Mangoldt and the Vaughan-derived coefficient sequences, including coprimality cofactors, maximal cutoffs and exceptional-zero treatment; give exact conductor ranges and log budgets. This is an analytic supplier request; retain the accepted AN.3→SV.2 direction and do not add its reverse.

**7. `FiniteFieldsAndCharacterSums:FF.1`.** Exact monic-degree count #M_p(j)=p^j and prime-polynomial harmonic sum Σ_(degJ≤ℓ,monic irreducible) p^(−degJ)≤1+logℓ; supplies the native finite-field algebra to the polynomial Brun/Farey proof. The sieve inequalities themselves belong to SV.1/SV.2.

**8. `AnalyticNumberTheory:AN.2`.** Uniform Selberg Euler denominator estimates in dimension one/two with primes dividing the progression modulus removed; general κ Wirsing normalization including positive H_g and Γ(κ+1).

**9. `AnalyticNumberTheory:AN.5`.** For every ε>0, # {n≤N:P⁺(n)≤N^ε}≥c_εN for all sufficiently large N, with the exact multiplicity-safe counting proof. Also the extremely-smooth reciprocal/tail estimate used by Khayutin Lemma9.23.

**10. [GlobalNumberFields Layer 3 geometry of numbers and ray class ideal counting](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/GlobalNumberFields/README.md#layer-3-geometry-of-numbers-and-ray-class-ideal-counting).** Native class representatives with prescribed coprimality and squarefree degree-one prime norms, plus the unit decomposition and generator arithmetic of Layer3C. The finite prime-ideal quotients come from native number-field ideal arithmetic. The sieve assembles their quadratic characters; global reciprocity is imported from ClassFieldTheory, not from GlobalNumberFields.

**11. [GlobalNumberFields Layer 3 geometry of numbers and ray class ideal counting](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/GlobalNumberFields/README.md#layer-3-geometry-of-numbers-and-ray-class-ideal-counting).** The reviewed native element-generator fundamental domains, class-principalization and their scaling/translating APIs for the exact TypeI/II cutoffs. If the atlas has a stale Layer3C id, reconcile it with current upstream before packaging.

**12. `GeometryOfNumbersAndQuadraticArithmetic:GN.4`.** Widmer-type lattice counts with successive-minimum error on the spin sliced domains and the codimension-two geometric sieve used by KM Lemmas3.1–3.2 (Bhargava Theorem3.3).

**13. `ExponentialSumsAndCircleMethod:ES.0`.** Conjecture C_m in the exact q^((1−δ)/m) short-interval normalization, its progression Corollary2.2, and the subset-moment transfer of C_tn to weaker C_|T|n bounds.

**14. [ArithmeticDirichletSeries Layer 1 norm fibres and mathlib lseries](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/ArithmeticDirichletSeries/README.md#layer-1-norm-fibres-and-mathlib-lseries).** Native finite norm fibres, number-field ideal divisor/logarithmic coefficient bounds and prime-power removal. The principal-class prime asymptotic is a separate Chebotarev request, not inferred from ideal-counting or generic Tauberian infrastructure.

**15. `AdelicAlgebraicGroups:AA.4`.** Strong approximation for a finitely generated Zariski-dense subgroup at almost all squarefree moduli, including the exact reduction-image/CRT statement and the finite bad modulus; not just density of all G(Q).

**16. `FiniteFieldsAndCharacterSums:FF.2`.** Uniform Lang–Weil counts for the group and geometric hypersurface zero loci/intersections, and proper-subvariety O(p^(dimG−1)) reduction counts.

**17. `AdditiveCombinatorics:AC.1`.** BGS Theorem1.3 squarefree-ring sum-product with every large-divisor projection hypothesis, and the noncommutative Balog–Szemerédi–Gowers/product-growth inputs of the SL₂ flattening argument. Only these general combinatorial results are requested; the affine sieve and its expansion application remain SV.5 targets.

**18. `AnalyticNumberTheory:AN.2`.** Convergence and positivity of ∏_(odd prime p)(1−1/(p−1)²), and its role as the dimension-one local factor for Goldbach.

**19. `AnalyticNumberTheory:AN.3`.** The zero-free bounds for primitive Dirichlet L-functions and contour estimates used in Chen1973 Lemma6; specify the small-conductor range d≤log¹⁰⁰N, the L′/L line and smoothing before the M₂ bound is used.

**20. [ClassFieldTheory Layer 14 hilbert reciprocity and quadratic reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/ClassFieldTheory/README.md#layer-14-hilbert-reciprocity-and-quadratic-reciprocity).** The native Hilbert product formula, with the local quadratic-character identification at odd primes and the finite dyadic/infinite factors. SV.5 specializes it to (α/(β))(β/(α))=∏_(v|2∞)(α,β)_v for coprime odd elements, and then to the joint-spin kernel residue sign; it does not reconstruct local or global reciprocity.

**21. [Chebotarev Layer 13 ϑ_c and π_c](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Chebotarev/README.md#layer-13-ϑ_c-and-π_c).** Apply the natural prime-count asymptotic to the identity Frobenius class in the Hilbert class field, using ClassFieldTheory’s principal-ideal splitting criterion. This gives #{principal prime ideals with norm≤X}∼li(X)/h_K, with finite bad primes and higher-residue-degree terms removed. Dirichlet density alone is insufficient.

## Proof and native-interface gaps

The complete target inventory ends in the following explicit obligations as well as the suppliers above. They prevent proof closure. Finite checks and elaborated signatures do not discharge these obligations.

<a id="g-mass"></a>

### Mass and remainder control in Eratosthenes applications

The unconditional source example behind E7 needs a relation between approximate mass X, the divisor cutoff and absolute remainder mass. The new conditional theorem requires the concrete inequalities it uses. Establish those inequalities for any proposed application rather than inferring them from a sieve carrier or a level parameter.

Consumers: [Eratosthenes estimate with a justified mass and divisor cutoff](#SV-0-eratosthenes-mass-cutoff).

<a id="g-local-normal-form"></a>

### Integral conic normal-form comparison

Import IntegralLattices Layer 3 local classification. Supply the rank-two half-norm adapter from q=ax²+bxy+cy², including the dyadic discriminant cases, integral GL₂(Z_p) changes and bijections modulo every p^n. The pinned baseline has no assembled interface for this comparison; the native theorem prototype is omitted.

Consumers: [Integral local normal forms for conic counts](#SV-0-conic-normal-form-adapter), [Regular-prime conic densities](#SV-0-conic-regular-density), [Singular-prime conic density recursion](#SV-0-conic-singular-density-recursion), [Uniform conic local-density bound](#SV-0-conic-uniform-local-bound).

<a id="g-dyadic-roots"></a>

### Uniform dyadic conic root bound

Prove that a unit-leading quadratic modulo 2^n has at most a fixed constant times 2^(n/2) roots uniformly in its remaining coefficients, including repeated-root valuations. Sum over the second coordinate and track the factor16. Odd-prime finite regressions do not establish this bound.

Consumers: [Uniform conic local-density bound](#SV-0-conic-uniform-local-bound).

<a id="g-order-count"></a>

### Conductor-local invertible-ideal counting

GlobalNumberFields Layer 11 and ArithmeticDirichletSeries Layer 1 supply the order-ideal carrier and norm fibres. The missing input is a conductor-prime formula bounding r_Λ(p^k) for all k with fixed-order constants, and its coprime norm multiplicativity. Native order-count prototype omitted until that interface exists.

Consumers: [Quadratic-order ideal counts in the growth class](#SV-0-quadratic-order-ideal-count-growth).

<a id="g-domain"></a>

### Curvature-uniform lattice discrepancy

GN.4 must supply the scaled and translated planar lattice estimate at every modulus actually used: area A/a²≥1 and error C(R/a)^θ. The sharp Huxley/van der Corput ranges require their own regularity hypotheses. The binary large-sieve proof uses lcm(m,n)≤sqrt(A), hence the conservative z≤A^(1/4) cutoff.

Consumers: [Binary-form large sieve on convex domains](#SV-2-binary-convex-large-sieve), [Binary polynomial sieve at power level](#SV-1-binary-power-level-sieve), [Binary multiplicative-function sieve](#SV-1-binary-multiplicative-sieve).

<a id="g-binary-averages"></a>

### Uniform binary Euler and smooth-factor estimates

Complete degree-uniform squarefree Euler lower bounds, the absorption of θ_Q after increasing the growth exponent, and the two smooth-factor savings with constants depending only on the stated growth, density and degree parameters. AN.2 and AN.5 requests specify the prime-product and smooth-number inputs; their existence is not inferred from the finite Rankin lemmas.

Consumers: [Binary sieve Euler denominator](#SV-1-binary-euler-denominator), [Binary sieve cutoff comparison](#SV-1-binary-euler-cutoff-comparison), [Average absorption of the density correction](#SV-1-binary-theta-average), [Large smooth-factor saving](#SV-1-binary-smooth-large-factor-average), [Extremely smooth-factor saving](#SV-1-binary-extremely-smooth-average).

<a id="g-binary-r2"></a>

### Ordinary-density input in the binary main sieve

Theorem9.7 proof equation(47), p.233, bounds an R₂ contribution using ordinary ρ_Q(p^e) at strength O(p^e). Its hypothesis only bounds corrected densities by Cp^{e(2−r)}. Q=x₀² gives ρ_Q(p²)=p³, so the asserted ordinary bound is unavailable. Repair R₂ at the stated generality, or state and propagate a justified additional hypothesis. The intended main conclusion is retained as a planning target, not asserted proved.

Consumers: [Binary multiplicative-function sieve](#SV-1-binary-multiplicative-sieve), [Binary sieve with a fixed divisor](#SV-1-binary-homogeneous-congruence-sieve), [Binary sieve with a unit congruence](#SV-1-binary-inhomogeneous-congruence-sieve).

<a id="g-binary-congruence"></a>

### Corrected congruence transport for the binary sieve

Reconstruct Propositions9.25–9.26 after scaling. Retain (R/k₀)^θ≤(A/k₀²)^(1−3η), the transformed value bound, and local class Q≡k₀k₁ℓ mod k₁k₂. Show precisely how corrected densities of Q_r/k₀ recombine at primes dividing k₀, and how the coprime unit residue is transported. A formal substitution in the printed formulas is insufficient.

Consumers: [Binary sieve with a fixed divisor](#SV-1-binary-homogeneous-congruence-sieve), [Binary sieve with a unit congruence](#SV-1-binary-inhomogeneous-congruence-sieve).

<a id="g-selberg-denominator"></a>

### Uniform Selberg denominator asymptotics

AN.2 supplies prime sums/PNT and the requested Wirsing asymptotic. Prove positivity and the Γ(κ+1) Euler normalization of H_g, and uniformity when progression-modulus primes are removed. Track the log interval and totient factors for the interval, progression and dimension-two applications.

Consumers: [Prime upper bound in intervals](#SV-1-selberg-prime-interval), [Prime upper bound in progressions](#SV-1-selberg-progression-upper), [Selberg bounds for twin primes and Goldbach](#SV-1-selberg-twin-goldbach-upper), [Selberg denominator in dimension κ](#SV-1-selberg-dimension-kappa).

<a id="g-ggpy"></a>

### Restricted Halberstam–Richert input in the Maynard route

GGPY §2 Lemma3 cites Halberstam–Richert Lemmas5.3–5.4. That book is not cleared and was not read. Supply a freely readable proof of the exact dimension-one remainder and uniform L bound, or use a maintainer-cleared copy. GGPY Lemma4 and the Maynard asymptotics must retain this prerequisite.

Consumers: [Selberg's diagonal sum in dimension one (GGPY Lemma 3, κ=1)](#SV-1-selberg-diagonal-sum-dimension-one), [Smoothly weighted diagonal sum (Maynard Lemma 6.1, GGPY Lemma 4)](#SV-1-selberg-smooth-diagonal-sum), [Asymptotic for S₁ (Maynard Lemma 6.2)](#SV-4-s1-asymptotic), [Asymptotic for S₂^{(m)} (Maynard Lemma 6.3)](#SV-4-s2-asymptotic).

<a id="g-sharp"></a>

### Sharp Hilbert and additive large-sieve proofs

Kedlaya Chapter15 leaves the separated real-line Hilbert inequality and endpoint improvement as exercises. Prove the π/δ Hilbert constant, the periodic/circular adapter and H−1+δ⁻¹ inequality, including arbitrary interval origin, H≥1 and singleton cases. Squared matrix duality alone supplies no sharp constant.

Consumers: [Separated Hilbert inequality](#SV-2-separated-hilbert-inequality), [Sharp separated additive large sieve](#SV-2-sharp-additive-large-sieve), [Sharp primitive-character large sieve](#SV-2-sharp-primitive-large-sieve), [Large sieve for forbidden residues](#SV-2-forbidden-residue-large-sieve).

<a id="g-quadratic"></a>

### Heath-Brown quadratic mean-value proof

Heath-Brown1995 Theorem1 and Corollaries1–4 are read with the §2 outline and §9 bilinear proof. The iterative mean-value estimates in §§3–8 remain a proof input to reconstruct, including odd squarefree support, reciprocity signs and the (MN)^ε loss. The native statements do not prove those estimates.

Consumers: [Heath-Brown quadratic large sieve](#SV-2-quadratic-large-sieve), [Heath-Brown quadratic bilinear estimate](#SV-2-quadratic-bilinear), [Prime quadratic-symbol bilinear estimate](#SV-2-prime-quadratic-bilinear).

<a id="g-jutila"></a>

### Jutila auxiliary mean-square input

Jutila1975 Lemma3 is read in its original pp.194–195 proof, which invokes his 1973 Lemma2. That earlier lemma has not been read. Supply its precise real-character mean-square inequality and propagate its uniform constants through the original lemma, Smith Proposition6.6 and the Koymans–Pagano moment consequence. Do not substitute the different Heath-Brown quadratic large sieve.

Consumers: [Jutila mean value lemma](#SV-2-jutila-real-character-mean), [Smith prime Legendre-symbol estimate](#SV-2-smith-prime-legendre-bilinear), [Koymans–Pagano normalized row mean](#SV-2-koymans-pagano-row-mean).

<a id="g-linnik"></a>

### Multiplicity-safe smooth counts for Linnik

AN.5 must provide a positive-proportion bound for integers with P⁺(n)≤N^ε for fixed ε>0, using a multiplicity-safe argument. Repair the source’s ordered-tuple overcount before using the forbidden-residue large sieve. The least nonresidue excludes p=2, and the vanishing-support hypothesis is explicit.

Consumers: [Linnik bounded exceptional primes](#SV-2-linnik-exceptional-nonresidues).

<a id="g-farey"></a>

### Native polynomial Farey residue comparison

The coefficient adapter reverses a monic denominator and uses a power-series inverse. Prove agreement with the coefficient of T⁻¹ in the native Laurent expansion of a/J, and derive the complete polynomial Farey orthogonality/duality estimate with |M_p(m)|=p^m and the sharp p^m+p^{2ℓ} scale. fareyCoefficient_residue is omitted pending the LaurentSeries interface; FF.1 supplies finite-field counts, not this sieve theorem.

Consumers: [Polynomial Farey coefficient adapter](#SV-2-polynomial-farey-coefficients), [Polynomial Farey large sieve](#SV-2-polynomial-farey-large-sieve).

<a id="g-polynomial-brun"></a>

### Polynomial Brun uniform law estimates

Complete the Bonferroni truncation and error bound for arbitrary joint laws, keeping all labelled-coordinate dependencies. FF.1 supplies prime-polynomial harmonic counts. Track exclusion of T separately and do not replace the joint TV discrepancy with independent marginals.

Consumers: [Brun sieve for polynomial vectors](#SV-1-polynomial-brun-arbitrary-law), [Polynomial Euler product excluding T](#SV-1-polynomial-euler-excluding-variable).

<a id="g-vaughan"></a>

### Conductor reduction and Vaughan hyperbola balancing

Reconstruct the convolution-discrepancy proof with primitive conductor r, coprime cofactor s, small-r supplier estimates and exact hyperbola coverage. Keep the inherited dyadic J loss until a stronger aggregate bound is proved. Repair the partition endpoint and δ-range issues E19–E25, then choose U,V and the mesh to achieve every prescribed logarithmic saving.

Consumers: [Convolution discrepancy mean value](#SV-3-convolution-discrepancy-mean), [Maximal Bombieri–Vinogradov theorem](#SV-3-bombieri-vinogradov-maximal), [Bilinear congruence correlation](#SV-3-bilinear-congruence-correlation).

<a id="g-small-conductor"></a>

### Small-conductor Siegel–Walfisz estimates

AN.3 must supply uniform estimates for von Mangoldt and the required convolution coefficients, with maximal cutoffs, coprimality cofactors and exceptional-zero treatment. Give the conductor/log ranges that make the small-r contribution negligible. Retain the accepted AN.3→SV.2 stage direction; no reverse edge is installed here.

Consumers: [Maximal Bombieri–Vinogradov theorem](#SV-3-bombieri-vinogradov-maximal), [Barban–Davenport–Halberstam theorem](#SV-3-barban-davenport-halberstam).

<a id="g-variance"></a>

### Discrepancy variance and weighted transfer losses

Use AN.2 divisor-moment/totient estimates and character orthogonality to justify the variance with log⁵Q, including the cofactor τ(s)²/φ(s) sum and dyadic loss. For every weight exponent j and saving A choose a new BV log budget, transfer ψ to π by partial summation uniformly in y≤x, and center at li(y)/φ(q); the fixed-x centered variant is separate.

Consumers: [Arithmetic discrepancy second moment](#SV-3-arithmetic-discrepancy-variance), [Barban–Davenport–Halberstam theorem](#SV-3-barban-davenport-halberstam), [Weighted prime-distribution transfer](#SV-3-weighted-prime-distribution).

<a id="g-maynard"></a>

### Maynard asymptotic uniformity and smooth approximation

Finish the smooth-simplex approximation, dimension-one diagonal estimates and analytic error budget using the AN.2/AN.3 inputs. Retain exact rational certificates for M₅>2 and M₁₀₅>4 and the admissible105-tuple. The inherited numerical regressions are evidence, not a new proof of the variational or prime-distribution steps.

Consumers: [Smooth approximation within the simplex](#SV-4-ratio-smooth-approximation), [Asymptotic for S₁ (Maynard Lemma 6.2)](#SV-4-s1-asymptotic), [Asymptotic for S₂^{(m)} (Maynard Lemma 6.3)](#SV-4-s2-asymptotic), [Primes in admissible tuples (Maynard Proposition 4.2)](#SV-4-maynard-many-primes), [Bounded gaps between primes (Maynard Theorem 1.3)](#SV-4-bounded-gaps-600).

<a id="g-beta"></a>

### Normalized general-dimension beta functions

Read and reconstruct Iwaniec §§3–5 for existence, uniqueness, delay equations, κ-dependent Aκ,Bκ,βκ and Qκ(s). Only the κ=1 functions have native prototypes here. The general theorem is omitted until actual functions and constants can be stated; no hypothesis is represented by an opaque proposition field.

Consumers: [Beta sieve in general dimension](#SV-5-beta-sieve-general-dimension), [Rosser–Iwaniec linear sieve](#SV-5-linear-sieve-main-estimate).

<a id="g-richert"></a>

### Richert numerical optimization and square exception

Prove the integral criterion and explicit level threshold with certified inequalities for linear sieve functions. Distinct prime factors in the logarithmic weight need the stated square-divisor exceptional mass before concluding a bound on Ω with multiplicity. Preserve γ/4, β=γ/(1+3^(−r)) and the strict positivity margin.

Consumers: [Richert weighted sieve](#SV-5-richert-weighted-sieve), [Richert explicit level threshold](#SV-5-richert-level-threshold).

<a id="g-chen"></a>

### Chen switching distribution and numerical certificates

Prove the ordered sifted-triple bound T_N≤3.9404 C_N N/log²N and original-family lower bound≥2.6408 C_N N/log²N using the original 1973 pp.111–128 sequence. Required details include Lemma3 fourth-moment estimates on p.114, switched modulus/discrepancy control, and certified integration ∫_(1/10)^(1/3) log(2−3α)/(α(1−α))dα≤0.49255 and Lemma9 numerical inequalities. Lemma9 cites unread Richert1969 TheoremA. Keep the 0.6706−0.67 margin for the N^0.91 exceptional term; do not count only prime complements in T_N.

Consumers: [Chen switched triple upper bound](#SV-5-chen-switched-distribution), [Chen original-family lower estimate](#SV-5-chen-original-family-lower), [Chen’s Goldbach theorem](#SV-5-chen-goldbach).

<a id="g-chen-shift"></a>

### Fixed even shift version of Chen switching

The original Theorem2 announces the fixed positive even shift variant with a similar proof. Reconstruct its shifted family, local factors and modulus-uniform switching estimates for each h, with constants allowed to depend on h. The Goldbach count does not by itself prove the shifted theorem.

Consumers: [Chen primes with an almost-prime shift](#SV-5-chen-prime-shift).

<a id="g-spin-native"></a>

### Native joint-spin arithmetic interfaces

Reuse GlobalNumberFields Layer3/3C generators, embeddings, unit decomposition and ideal arithmetic. Assemble the ideal quadratic symbol from native finite-field characters. Import the Hilbert product formula and local comparisons from ClassFieldTheory, and the principal-class natural prime count from Chebotarev Layer13. Supply generator-independent unit averaging, class representatives and norm-modulus reduction. The native spin setup, averaging and bilinear interfaces not expressible at the pin are individually recorded in prototypeOmissions; the basic ideal-symbol adapter itself is prototyped.

Consumers: [Joint-spin arithmetic data](#SV-5-joint-spin-setup), [Joint spin of ideals](#SV-5-joint-spin-symbol), [Joint-spin bilinear kernel](#SV-5-joint-spin-kernel), [Short character input for joint spins](#SV-5-joint-spin-short-character-input), [Squarefull norm tail for spin divisors](#SV-5-spin-squarefull-norm-tail), [Common norm tail for two spin differences](#SV-5-spin-common-norm-tail), [Type I estimate for joint spins](#SV-5-joint-spin-type-i), [Bilinear bound for spin kernels](#SV-5-number-field-kernel-bilinear), [Type II estimate for joint spins](#SV-5-joint-spin-type-ii), [FIMR sieve conversion to prime ideals](#SV-5-fimr-prime-sieve-conversion), [Oscillation of joint spins over prime ideals](#SV-5-joint-spin-prime-oscillation), [Equidistribution of joint spin signs](#SV-5-joint-spin-sign-patterns), [Quadratic ideal residue symbol adapter](#SV-5-ideal-quadratic-symbol).

<a id="g-spin-tails"></a>

### Geometric lattice tails for joint spins

GN.4 supplies the covolume/successive-minimum estimate for the squarefull norm tail and the codimension-two geometric sieve for common norm divisors. Track zero-difference loci and the m≥3 condition. Balance Y,Z without losing the claimed 1/18 and TypeI exponents.

Consumers: [Squarefull norm tail for spin divisors](#SV-5-spin-squarefull-norm-tail), [Common norm tail for two spin differences](#SV-5-spin-common-norm-tail), [Type I estimate for joint spins](#SV-5-joint-spin-type-i).

<a id="g-spin-conversion"></a>

### Uniform ideal Type I and FIMR conversion

KM TypeI proof begins with m coprime toF and its conjugates. Extend to every integral m, including large norm, before applying FIMR Proposition5.2. Prove the required Λ/τ coefficient bounds and ideal-combinatorial conversion with normalized sup|ψ|/unit averages. Establish the squarefull-tail version of the element-kernel theorem and transfer C_|S|n to each subset for joint sign moments. ES.0 owns the short-character conjecture; Chebotarev Layer13 supplies principal-class prime-ideal normalization. Read the referenced KM2018 Proposition3.6 for the element-kernel proof and DFI Lemma9 for FIMR’s integrable hyperbola-separation kernel; neither proof has been read in this pass.

Consumers: [Type I estimate for joint spins](#SV-5-joint-spin-type-i), [Bilinear bound for spin kernels](#SV-5-number-field-kernel-bilinear), [FIMR sieve conversion to prime ideals](#SV-5-fimr-prime-sieve-conversion), [Oscillation of joint spins over prime ideals](#SV-5-joint-spin-prime-oscillation), [Equidistribution of joint spin signs](#SV-5-joint-spin-sign-patterns).

<a id="g-affine-native"></a>

### Native affine group and quotient interfaces

Import AlgebraicGroups strong approximation and finite reductions, FiniteFields Lang–Weil, and AlgebraicAnalysis rational Zariski closure. Identify polynomial relative density with the native topology. Supply the actual free-word orbit reduction and CRT density theorem; walkDensity_crt and five group/expansion theorem prototypes are omitted until their native interfaces exist.

Consumers: [Affine almost-prime locus and saturation](#SV-5-affine-saturation-locus), [Affine walk sieve data](#SV-5-affine-walk-sieve-data), [Local densities for affine orbits](#SV-5-affine-local-densities), [Escape from proper algebraic subvarieties](#SV-5-affine-escape-subvarieties), [Affine sieve saturation with expansion](#SV-5-affine-sieve-saturation), [Explicit affine almost-prime bound](#SV-5-affine-explicit-factor-bound), [Squarefree congruence expansion for SL₂](#SV-5-sl2-squarefree-expansion).

<a id="g-affine-expansion"></a>

### Affine squarefree expansion and primitive coset reduction

BGS §§2,3.2,4–5 have not been read in full. Reconstruct the free Zariski-dense subgroup/coset reduction preserving simultaneous primitivity, the word-ball spectral recurrence and squarefree SL₂ expansion from sum-product/flattening inputs. Track bad primes, polynomial height and growth r=2k−1. For escape from W choose good primes effectively and prove a power saving; a congruence mixing assumption alone does not give an unproved endpoint saturation bound.

Consumers: [Affine sieve level from expansion](#SV-5-affine-expansion-level), [Escape from proper algebraic subvarieties](#SV-5-affine-escape-subvarieties), [Affine sieve saturation with expansion](#SV-5-affine-sieve-saturation), [Explicit affine almost-prime bound](#SV-5-affine-explicit-factor-bound), [Squarefree congruence expansion for SL₂](#SV-5-sl2-squarefree-expansion).

## Suggested-file boundaries

The suggested file elaborates native finite and analytic signatures at the pinned Mathlib. The interfaces below cannot yet be expressed using the pinned carriers. Their mathematical statements, APIs and tests are specified above; the file names these omissions in a comment. The native interfaces must supply them before packaging. No missing condition is represented by a proposition-valued field.

| Target | Omitted native declarations |
| --- | --- |
| [Integral local normal forms for conic counts](#SV-0-conic-normal-form-adapter) | `SieveConic.conic_normal_form_adapter` |
| [Quadratic-order ideal counts in the growth class](#SV-0-quadratic-order-ideal-count-growth) | `SieveBinary.quadratic_order_ideal_count_growth` |
| [Polynomial Farey coefficient adapter](#SV-2-polynomial-farey-coefficients) | `SievePolynomialVector.fareyCoefficient_residue` |
| [Beta sieve in general dimension](#SV-5-beta-sieve-general-dimension) | `SieveWeighted.beta_sieve_general_dimension` |
| [Joint-spin arithmetic data](#SV-5-joint-spin-setup) | `SieveJointSpin.JointSpinData`, `SieveJointSpin.spinSet_no_identity`, `SieveJointSpin.spinSet_order_ge_three`, `SieveJointSpin.classRep_coprime_choice`, `SieveJointSpin.classRep_principal_generator`, `SieveJointSpin.spinModulus_even`, `spin_identity_excluded`, `spin_involution_excluded`, `spin_cubic_singleton`, `spin_bad_representatives` |
| [Joint spin of ideals](#SV-5-joint-spin-symbol) | `SieveJointSpin.jointSpin`, `SieveJointSpin.spin`, `SieveJointSpin.spin_unit_square`, `SieveJointSpin.jointSpin_generator_independent`, `SieveJointSpin.jointSpin_real`, `SieveJointSpin.jointSpin_complex`, `SieveJointSpin.jointSpin_abs`, `SieveJointSpin.jointSpin_nonprincipal`, `spin_unit_ideal`, `spin_rational_nonunit`, `spin_square_unit_invariance`, `spin_nonprincipal_zero`, `spin_complex_average` |
| [Short character input for joint spins](#SV-5-joint-spin-short-character-input) | `SieveJointSpin.joint_spin_short_input` |
| [Squarefull norm tail for spin divisors](#SV-5-spin-squarefull-norm-tail) | `SieveJointSpin.spin_squarefull_tail` |
| [Common norm tail for two spin differences](#SV-5-spin-common-norm-tail) | `SieveJointSpin.spin_common_norm_tail` |
| [Type I estimate for joint spins](#SV-5-joint-spin-type-i) | `SieveJointSpin.joint_spin_typeI` |
| [Joint-spin bilinear kernel](#SV-5-joint-spin-kernel) | `SieveJointSpin.spinKernel`, `SieveJointSpin.spinKernel_mul_left`, `SieveJointSpin.spinKernel_mul_right`, `SieveJointSpin.spinKernel_reciprocity`, `SieveJointSpin.spinKernel_period`, `SieveJointSpin.spinKernel_complete_zero`, `spin_kernel_unit`, `spin_kernel_zero_numerator`, `spin_kernel_product`, `spin_kernel_period_norm` |
| [Bilinear bound for spin kernels](#SV-5-number-field-kernel-bilinear) | `SieveJointSpin.number_field_kernel_bilinear` |
| [Type II estimate for joint spins](#SV-5-joint-spin-type-ii) | `SieveJointSpin.joint_spin_typeII` |
| [FIMR sieve conversion to prime ideals](#SV-5-fimr-prime-sieve-conversion) | `SieveJointSpin.fimr_prime_conversion` |
| [Oscillation of joint spins over prime ideals](#SV-5-joint-spin-prime-oscillation) | `SieveJointSpin.joint_spin_prime_oscillation` |
| [Equidistribution of joint spin signs](#SV-5-joint-spin-sign-patterns) | `SieveJointSpin.joint_spin_sign_patterns` |
| [Affine walk sieve data](#SV-5-affine-walk-sieve-data) | `SieveAffine.walkDensity_crt` |
| [Local densities for affine orbits](#SV-5-affine-local-densities) | `SieveAffine.affine_local_density` |
| [Escape from proper algebraic subvarieties](#SV-5-affine-escape-subvarieties) | `SieveAffine.affine_escape` |
| [Affine sieve saturation with expansion](#SV-5-affine-sieve-saturation) | `SieveAffine.affine_saturation` |
| [Explicit affine almost-prime bound](#SV-5-affine-explicit-factor-bound) | `SieveAffine.affine_factor_bound` |
| [Squarefree congruence expansion for SL₂](#SV-5-sl2-squarefree-expansion) | `SieveAffine.sl2_squarefree_expansion` |

## Routed-paper target map

The forty routed items are accounted for below. Khayutin’s journal uses §9 for the sieve material that the earlier preprint route called §8.

| Routed item | Owned targets |
| --- | --- |
| PAPER-KHAYUTIN-19/75 | [Binary polynomial local densities](#SV-0-binary-local-densities) |
| PAPER-KHAYUTIN-19/76 | [Binary Schwartz–Zippel specialization](#SV-0-binary-schwartz-zippel) |
| PAPER-KHAYUTIN-19/77 | [Curve lifting and singular correction](#SV-0-curve-lifting-correction) |
| PAPER-KHAYUTIN-19/78 | [Multiplicative sieve growth class](#SV-0-multiplicative-growth-class) |
| PAPER-KHAYUTIN-19/79 | [Binary multiplicative-function sieve](#SV-1-binary-multiplicative-sieve) |
| PAPER-KHAYUTIN-19/80 | [Binary sieve Euler denominator](#SV-1-binary-euler-denominator) |
| PAPER-KHAYUTIN-19/81 | [Binary-form large sieve on convex domains](#SV-2-binary-convex-large-sieve) |
| PAPER-KHAYUTIN-19/82 | [Binary polynomial sieve at power level](#SV-1-binary-power-level-sieve) |
| PAPER-KHAYUTIN-19/83 | [Binary sieve with divisibility conditions](#SV-1-binary-divisibility-sieve) |
| PAPER-KHAYUTIN-19/84 | [Binary density correction factor](#SV-0-binary-density-correction-factor) |
| PAPER-KHAYUTIN-19/85 | [Multiplicative decoupling inequality](#SV-1-multiplicative-decoupling) |
| PAPER-KHAYUTIN-19/86 | [Average absorption of the density correction](#SV-1-binary-theta-average), [Large smooth-factor saving](#SV-1-binary-smooth-large-factor-average), [Extremely smooth-factor saving](#SV-1-binary-extremely-smooth-average) |
| PAPER-KHAYUTIN-19/87 | [Binary sieve with a fixed divisor](#SV-1-binary-homogeneous-congruence-sieve), [Binary sieve with a unit congruence](#SV-1-binary-inhomogeneous-congruence-sieve) |
| PAPER-KHAYUTIN-19/109 | [Integral local normal forms for conic counts](#SV-0-conic-normal-form-adapter), [Regular-prime conic densities](#SV-0-conic-regular-density) |
| PAPER-KHAYUTIN-19/110 | [Singular-prime conic density recursion](#SV-0-conic-singular-density-recursion), [Uniform conic local-density bound](#SV-0-conic-uniform-local-bound) |
| PAPER-KHAYUTIN-19/111 | [Genus-restricted conic density sum](#SV-0-conic-genus-density-sum) |
| PAPER-KHAYUTIN-19/122 | [Quadratic-order ideal counts in the growth class](#SV-0-quadratic-order-ideal-count-growth) |
| PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/22 | [Polynomial Farey coefficient adapter](#SV-2-polynomial-farey-coefficients), [Polynomial Farey large sieve](#SV-2-polynomial-farey-large-sieve) |
| PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/56 | [Additive sieve for bounded integer coefficients](#SV-2-bskk-additive-large-sieve) |
| PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/72 | [Polynomial-vector sieve data](#SV-0-polynomial-vector-sieve-data) |
| PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/74 | [Polynomial Bonferroni brackets](#SV-1-polynomial-bonferroni) |
| PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/75 | [Brun sieve for polynomial vectors](#SV-1-polynomial-brun-arbitrary-law) |
| PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/76 | [Polynomial Euler product excluding T](#SV-1-polynomial-euler-excluding-variable) |
| PAPER-BENNETT-SIKSEK-20/45 | [Bombieri–Selberg Gram-row inequality](#SV-2-bombieri-selberg) |
| PAPER-SKOROBOGATOV-SOFOS-23/3 | [Bouniakowsky and Schinzel hypotheses](#SV-4-polynomial-prime-hypotheses) |
| PAPER-SKOROBOGATOV-SOFOS-23/4 | [Bouniakowsky and Schinzel hypotheses](#SV-4-polynomial-prime-hypotheses) |
| PAPER-SKOROBOGATOV-SOFOS-23/72 | [Prime-denominator quadratic symbol](#SV-2-prime-denominator-symbol), [Prime quadratic-symbol bilinear estimate](#SV-2-prime-quadratic-bilinear) |
| PAPER-SKOROBOGATOV-SOFOS-23/heath-brown-1995-cor4 | [Heath-Brown quadratic large sieve](#SV-2-quadratic-large-sieve), [Heath-Brown quadratic bilinear estimate](#SV-2-quadratic-bilinear) |
| PAPER-KOYMANS-MILOVIC-21/8 | [Joint-spin arithmetic data](#SV-5-joint-spin-setup) |
| PAPER-KOYMANS-MILOVIC-21/9 | [Joint spin of ideals](#SV-5-joint-spin-symbol) |
| PAPER-KOYMANS-MILOVIC-21/13 | [FIMR sieve conversion to prime ideals](#SV-5-fimr-prime-sieve-conversion) |
| PAPER-KOYMANS-MILOVIC-21/14 | [Short character input for joint spins](#SV-5-joint-spin-short-character-input), [Type I estimate for joint spins](#SV-5-joint-spin-type-i) |
| PAPER-KOYMANS-MILOVIC-21/15 | [Squarefull norm tail for spin divisors](#SV-5-spin-squarefull-norm-tail) |
| PAPER-KOYMANS-MILOVIC-21/16 | [Common norm tail for two spin differences](#SV-5-spin-common-norm-tail) |
| PAPER-KOYMANS-MILOVIC-21/20 | [Type II estimate for joint spins](#SV-5-joint-spin-type-ii) |
| PAPER-KOYMANS-MILOVIC-21/21 | [Bilinear bound for spin kernels](#SV-5-number-field-kernel-bilinear) |
| PAPER-KOYMANS-MILOVIC-21/22 | [Joint-spin bilinear kernel](#SV-5-joint-spin-kernel) |
| PAPER-KOYMANS-MILOVIC-21/23 | [Oscillation of joint spins over prime ideals](#SV-5-joint-spin-prime-oscillation) |
| PAPER-KOYMANS-MILOVIC-21/24 | [Equidistribution of joint spin signs](#SV-5-joint-spin-sign-patterns) |
| PAPER-KOYMANS-PAGANO/189 | [Jutila mean value lemma](#SV-2-jutila-real-character-mean), [Smith prime Legendre-symbol estimate](#SV-2-smith-prime-legendre-bilinear), [Koymans–Pagano normalized row mean](#SV-2-koymans-pagano-row-mean) |

## Source corrections used by the plan

The conic formulas use directly checked residue recurrences and rescaling, rather than the defective printed closed forms. In the binary sieve the local class retains k₀, the scaled curvature condition retains its power saving, and the R₂ proof remains open. Chen’s constant is the universal odd-prime product with a separate N-dependent correction. Joint-spin coefficients vanish off unit residue classes and their constants allow the fixed weight ψ.

The corrections above concern the particular acquired texts. The Khayutin corrections concern the published Annals text. The Heath-Brown and Koymans–Milovic corrections concern only the acquired preprints; the corresponding published texts were not collated. Exact versions, correction searches and finite witnesses are recorded with the source findings.

Finite regression evidence for the corrected conics consists of 108 odd-prime recursion checks, 318 regular-prime counts including the dyadic Kronecker case, 594 ramified rescaling counts and 324 genus-restricted counts. These tests identify finite formula errors; they do not prove the uniform dyadic bound or the analytic sieve theorem.

The Maynard route uses exact rational certificates: I₅=29509/1222452000 and ratio 1417255/708216>2, and a rational certificate with ratio>4 at k=105. The specified tuple of 105 shifts is admissible with diameter 600. These finite certificates are inputs to the variational and sieve asymptotic targets.

## Sources and reading boundaries

<a id="source-hb-sieves"></a>

- **HB-SIEVES** — D. R. Heath-Brown; notes taken by Boris Moroz. [Lectures on sieves](https://arxiv.org/pdf/math/0209360v1). arXiv:math/0209360v1, 25 September 2002; published separately in Bonner Mathematische Schriften 360 (2003), not collated here.. Reading boundary: Full 50-page arXiv v1 text read for this pass, especially §§1–4, Rosser§5pp.30–38, Richert/Chen§6pp.39–48, Vaughan§7pp.48–50; no claim of collation with the Bonner volume.

<a id="source-ked-ant-11"></a>

- **KED-ANT-11** — Kiran S. Kedlaya. [Notes on analytic number theory, Chapter 11: Revisiting the sieve of Eratosthenes](https://kskedlaya.org/ant/chap-eratosthenes.html). Live author HTML, accessed 27 September 2026; not identified with the dated edition in the campaign register.. Reading boundary: Complete live Chapter11, §§11.1–11.6 including exercises, read again; finite Rankin adapters and the corrected conditional mass-cutoff bound are planned. E7 remains a source-application gap.

<a id="source-bombieri-1971"></a>

- **BOMBIERI-1971** — Enrico Bombieri; Proposition 1 and its proof attributed to Atle Selberg. [A note on the large sieve](https://www.impan.pl/shop/en/publication/transaction/download/product/97707). Acta Arithmetica 18 (1971), 401–404, DOI 10.4064/aa-18-1-401-404; published scan.. Reading boundary: Full published pp.401–404 read in prior checkpoints; native Gram inequality, taper, packing and additive H+2/δ bound retained. The published volume errata p.450 does not correct these findings; no new independent review or fresh download is claimed.

<a id="source-bennett-siksek-2020"></a>

- **BENNETT-SIKSEK-2020** — Michael A. Bennett and Samir Siksek. [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf). Annals of Mathematics 191 (2020), 355–392, DOI 10.4007/annals.2020.191.2.2; publisher PDF.. Reading boundary: This sieve slice: §8.2 Theorem 7 and application, printed pp.379–380, text and rendered pages. Routed extraction item 45 checked. No complete-paper reading claim for this packet.

<a id="source-ked-ant-16"></a>

- **KED-ANT-16** — Kiran S. Kedlaya. [Kiran S. Kedlaya, Notes on analytic number theory, Chapter 16: A multiplicative large sieve inequality](https://kskedlaya.org/ant/chap-largesieve2.html). Live author HTML, Chapter 16, acquired 2026-09-27; SHA-256 e67fd81c6d07ccac764a83eba8bf0b1c132739a716d3ae657b0172d5071cce67.. Reading boundary: Complete live Chapter16, §§16.1–16.4 including exercises; native character transfer, primitive large sieve, forbidden-residue estimate and Linnik target are planned. Multiplicity-safe smooth counting remains an AN.5 request.

<a id="source-ked-ant-18"></a>

- **KED-ANT-18** — Kiran S. Kedlaya; identity attributed to R. C. Vaughan. [Notes on analytic number theory, Chapter 18: The Bombieri–Vinogradov theorem: proof](https://kskedlaya.org/ant/chap-bombieri2.html). Live author HTML, acquired 27 September 2026; collated with the author's MIT 18.785 handout revised 9 May 2007, not a journal version.. Reading boundary: Complete live Chapter18, §§18.1–18.4 including exercises; discrepancy, Vaughan, convolution mean, maximal BV, variance and congruence correlation are planned. E19–E26 and explicit analytic gaps constrain proof closure; the historical five-page 2007 handout collation is retained in sourceVersions.

<a id="source-maynard-2015"></a>

- **MAYNARD-2015** — James Maynard. [Small gaps between primes](https://annals.math.princeton.edu/wp-content/uploads/annals-v181-n1-p07-p.pdf). Annals of Mathematics 181 (2015), no. 1, 383–413, doi:10.4007/annals.2015.181.1.7, publisher PDF (printed page = PDF page + 382). Collated with arXiv:1311.4600 v1, v2 and v3.. Reading boundary: 2026-09-29 (cc-39fac3): the whole paper, §§1–8 and footnotes, read in arXiv v3 and in the published text. Every node of SV.4 cites the published pages. Findings E27–E32 were checked on rendered page images of the published PDF (pp. 389, 391, 393, 407, 409, 411) and are present in arXiv v1, v2 and v3. Section 8's numerical claims were recomputed in exact rational arithmetic: (8.17) exactly, and (8.15) as an eigenvalue plus an exact rational certificate. Engelsma's 105-tuple was recomputed as admissible with diameter 600.

<a id="source-ggpy-2009"></a>

- **GGPY-2009** — D. A. Goldston, S. W. Graham, J. Pintz, C. Y. Yıldırım. [Small gaps between products of two primes](https://arxiv.org/pdf/math/0609615v1). arXiv:math/0609615v1 (the preprint of Proc. London Math. Soc. (3) 98 (2009), 741–774). The published version was not acquired.. Reading boundary: 2026-09-29 (cc-39fac3): §2, Lemmas 1–4 with (2.1)–(2.6), pp. 9–10, read. Lemma 3 is cited there to Halberstam–Richert, Lemmas 5.3–5.4, which was not read (gap).

<a id="source-ked-ant-12"></a>

- **KED-ANT-12** — Kiran S. Kedlaya. [Notes on analytic number theory, Chapter 12: Brun’s combinatorial sieve](https://kskedlaya.org/ant/chap-brun.html). Live author HTML acquired 5 October 2026; no dated print version identified or collated.. Reading boundary: Complete live Chapter12, §§12.1–12.6 including exercises; Brun coefficients, support, brackets, main terms and fundamental estimate are planned with corrected endpoint/lower-sign conventions.

<a id="source-ss-23"></a>

- **SS-23** — Alexei N. Skorobogatov and Efthymios Sofos. [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf). Published open-access Inventiones Mathematicae 231 (2023), 673–739, DOI 10.1007/s00222-022-01153-6; publisher PDF deposited at Glasgow eprints 292484.. Reading boundary: §1, pp.674–675, Bouniakowsky and Schinzel tuple definitions and conjectural context; §6, Lemma 6.3 and proof, pp.725–726.

<a id="source-jutila-original"></a>

- **JUTILA-ORIGINAL** — Matti Jutila. [On mean values of Dirichlet polynomials with real characters](https://matwbn.icm.edu.pl/ksiazki/aa/aa27116.pdf). Acta Arithmetica 27 (1975), 191–198; original published scan. Reading boundary: Complete pp.191–198 visually read; the adjacent Szemerédi paper is excluded. Lemma 3 and its proof, pp.194–195, are the input used here.

<a id="source-hb-real-95"></a>

- **HB-REAL-95** — D. R. Heath-Brown. [A mean value estimate for real character sums](https://matwbn.icm.edu.pl/ksiazki/aa/aa72/aa7234.pdf). Acta Arithmetica 72 (1995), 235–275; publisher PDF. Reading boundary: Theorem 1 and Corollaries 1–4, pp.237–238; proof outline §2, pp.240–242; proof of Corollary 4, §9, pp.274–275. Detailed iterative estimates in §§3–8 have not yet been independently closed.

<a id="source-smith-17"></a>

- **SMITH-17** — Alexander Smith. [2∞-Selmer groups, 2∞-class groups, and Goldfeld’s conjecture](https://arxiv.org/pdf/1702.02325). arXiv:1702.02325, acquired public PDF; Proposition 6.6 only used. Reading boundary: Proposition 6.6 and proof, printed p.62; reference [14], printed p.79.

<a id="source-ked-chap-largesieve"></a>

- **KED-chap-largesieve** — Kiran S. Kedlaya. [Notes on analytic number theory: The large sieve](https://kskedlaya.org/ant/chap-largesieve.html). Live author HTML Chapter 15, accessed 10 October 2026. Reading boundary: §§15.1–15.4 including Lemma 15.1, Lemma 15.4, Theorem 15.5 and exercises. The Hilbert estimate and endpoint improvement are exercises rather than supplied proofs.

<a id="source-khayutin-19"></a>

- **KHAYUTIN-19** — Ilya Khayutin. [Joint equidistribution of CM points](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf). Annals of Mathematics 189 (2019), 145–276; published text. Reading boundary: §9, pp.220–237, all sieve statements and proofs; §10.3 Proposition 10.10, pp.242–243; Appendix B, pp.265–271. Published numbering is §9, not §8 in the earlier routing brief.

<a id="source-ked-chap-bombieri"></a>

- **KED-chap-bombieri** — Kiran S. Kedlaya. [Notes on analytic number theory: Bombieri–Vinogradov statement](https://kskedlaya.org/ant/chap-bombieri.html). Live HTML, read 2026-10-11. Reading boundary: Chapter 17, all statements and exercises; no unpublished proof assumed.

<a id="source-bskk-23"></a>

- **BSKK-23** — Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma. [Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3). arXiv:2007.14567v3, 2 June 2023. Reading boundary: §6.1–6.2 pp.31–33; §8 pp.38–42, read in full; §3 additive large-sieve statement; introductory definitions pp.1–5. Routed sieve targets only, not the full irreducibility proof.

<a id="source-ked-ant-14"></a>

- **KED-ANT-14** — Kiran S. Kedlaya. [Notes on analytic number theory: Chapter 14, The Selberg sieve: applications](https://kskedlaya.org/ant/chap-selberg2.html). live HTML, accessed 11 October 2026. Reading boundary: Entire chapter: dimension hypotheses, Wirsing mean value, denominator normalization, applications and exercises; official HTML read through web renderer after HTTP406 from local requests.

<a id="source-iwa-rosser"></a>

- **IWA-ROSSER** — Henryk Iwaniec. [Rosser’s sieve](https://matwbn.icm.edu.pl/ksiazki/aa/aa36/aa36210.pdf). Acta Arithmetica36 (1980),171–202; original publisher PDF. Reading boundary: Theorem1 and dimension condition pp.171–174; delay equations and κ=1 normalization pp.174–176; fundamental lemma pp.176–177. Combinatorial proof §§3–5 not read; exact proof gap recorded.

<a id="source-chen-73-cn"></a>

- **CHEN-73-CN** — Jingrun Chen. [On the representation of a large even integer as the sum of a prime and the product of at most two primes](https://raw.githubusercontent.com/lixiang90/chen_theorem/main/pdf/大偶数表为一个素数及一个不超过二个素数的乘积之和.pdf). Science in China, no.3 (1973),111–128, Chinese original, public CNKI scan mirror; not the separately paginated English Scientia Sinica edition. Reading boundary: Original pp.111–113,115–128 read visually; Theorems1–2, Lemmas4–9, numerical inequalities(24),(27), final inequality(28). p.114 Lemma3 proof requires a separate reread; Richert1969 input cited in Lemma9 has not been read.

<a id="source-km-21"></a>

- **KM-21** — Peter Koymans, Djordjo Milovic. [Joint distribution of spins](https://arxiv.org/pdf/1809.09597v1). arXiv:1809.09597v1,25 September2018; published Duke170 (2021). Reading boundary: All §§1–5,pp.1–23, read. Owned: setup and joint-spin data§2, TypeI§3, TypeII§4, Theorems1–2. Governing-field application§5 belongs to its algebraic consumer.

<a id="source-fimr-13"></a>

- **FIMR-13** — John Friedlander, Henryk Iwaniec, Barry Mazur, Karl Rubin. [The spin of prime ideals](https://arxiv.org/pdf/1110.6331v2). arXiv:1110.6331v2; Inventiones193 (2013). Reading boundary: Entire §5, pp.20–24, Propositions5.1–5.2 and their proof. Earlier arithmetic lemmas outside the additional §2 reading below remain unread; general reciprocity is imported from ClassFieldTheory. §2 definition of the ideal quadratic symbol, Lemma2.1 and Lemma2.3, pp.5–7; reciprocity is cited to the existing ClassFieldTheory roadmap. The even-numerator period proof beyond this boundary is not claimed read.

<a id="source-bgs-10"></a>

- **BGS-10** — Jean Bourgain, Alex Gamburd, Peter Sarnak. [Affine linear sieve, expanders, and sum-product](https://link.springer.com/content/pdf/10.1007/s00222-009-0225-3.pdf). Inventiones mathematicae179 (2010),559–644; published open-access PDF. Reading boundary: Introductionpp.559–567; §3.1pp.573–574 and §3.3pp.577–584 sieve analysis. Algebraic preliminaries§2 and expansion proof§§4–5 not read in full; the exact required strong-approximation, finite-field and expansion inputs are recorded separately.

<a id="source-kp-22"></a>

- **KP-22** — Peter Koymans and Carlo Pagano. [On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1). arXiv2201.13424v1, 31 January2022; published version not collated. Reading boundary: §7.2, Proposition7.6 and its proof, pp.60–63, especially assumptions(ii),(iii) and equation(7.11). This is the routed sieve consequence; other arithmetic-statistics targets are imported by their consumers.
