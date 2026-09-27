# Exponential sums, decoupling and the circle method

## Scope and source boundary

This is a partial blueprint for all six stages ES.0–ES.5, with a declaration-sized development of one source-routed branch inside ES.0. It plans the small-conductor part of the proof of Proposition 8.2 in Michael A. Bennett and Samir Siksek, *A conjecture of Erdős*, Annals of Mathematics 191 (2020), 355–392. The result concerns cancellation in products of distinct primitive quadratic characters. The branch developed here is more general in its finite-sum hypotheses: it works for an arbitrary nonprincipal complex Dirichlet character and an arbitrary positive exclusion modulus.

The outcome is a chain of twenty-one proposed declarations, not a completed implementation or a closed circle-method roadmap. Thirteen unchanged nodes supply exact interval reindexing, a Möbius expansion, the bounds qτ(M) and qM, and explicit and uniform square-root thresholds using the exact AN.5 divisor nodes. Eight new adapters reduce the product of distinct primitive quadratic characters to those inputs: they retain the excluded-prime mask and prove the conductor arithmetic needed to preserve the original growth exponent. The large-conductor branch, the externally quoted Graham–Ringrose theorem, and all the general circle-method targets require further source decomposition.

The version read is the [published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), SHA-256 `3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf`, accessed 26 September 2026. The complete selected §8.1 argument, printed pp.376–379, was read, including the two cases of Proposition 8.2. Pages 377–379 were also checked as images. This reading does not establish coverage of the entire article. In particular, neither the original Graham–Ringrose proof nor Iwaniec–Kowalski Theorem 12.13 was read for this checkpoint.

The accepted paper extraction, its independent review, and reviewed errata E2, E3 and E11 were read alongside the published argument. The generic periodic-sequence and floor-division lemmas below are worker derivations which expose the finite steps used by that argument. They are not attributed to the article as separately stated named theorems. The square-root threshold is an explicit consequence of the corrected subpower input, not a transcription of a claimed constant in the source.

The divisor supplier follows Terence Tao's [The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), 23 September 2008, SHA-256 `1a26cc2a78746463092d440c0a1e119bd8d4c3e223f805dd000ae8a76830b2f9`, accessed 26 September 2026. Both proofs in the main post were read while preparing AN.5; the comments are not used. The explicit constant D^B is the worker's quantified refinement of the small/large-prime proof, decomposed in AN.5. The previous continuation reread those exact supplier statements. The present continuation freshly reread all of the selected Bennett–Siksek pp.376–379 argument and the page 377 image on 27 September, along with the accepted paper and errata reviews. No new whole-paper reading is claimed.

## Ownership and the pinned starting point

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All six reviewed AUDIT-07 rows were read before selecting new work. The upstream EffectiveBounds and GlobalNumberFields documents supplied examples of exact conventions, proof granularity and acceptance checks.

RS-03 and its accepted review retain the six ES stages. ES.0 owns analytic completion, differencing and oscillation methods; FiniteFieldsAndCharacterSums:FF.2 owns the general finite-field character bounds they consume. Torus counting identities in ES.1 are not the same object as the finite additive-combinatorics Fourier package in AC.0. The optimized Diophantine circle-method endpoints in ES.4 likewise do not duplicate the finite-complexity pattern endpoint in AC.5. RS-07 and the current ES.4 contract distinguish the prime-weighted branch: AnalyticNumberTheory:AN.3 supplies uniform prime-progression analysis, while SieveMethodsAndPrimePatterns:SV.2 supplies the Vaughan/Heath-Brown and Type I/II interfaces. Retired AN stages are not invoked.

All 28 existing link records mentioning this roadmap were read. They record negative screens of differing depth, not proofs that no mathematical dependency exists. In particular, the negative IntegralLattices and GlobalQuadraticForms screens do not turn geometry-of-numbers estimates into the local-density or circle-method theorems needed here. All thirteen node objects from the preceding ES checkpoint are retained exactly. The eight additions consume the existing character constructors and conductor theorems; neither the generic primitive construction nor the AN.5 divisor proof is replanned.

The key reuse decisions are as follows.

- Characters are the existing `DirichletCharacter`, namely multiplicative characters on a residue ring with zero values at nonunits. No new character structure is introduced.
- Primitive reduction is already provided by `primitiveCharacter`, `changeLevel_primitiveCharacter` and `primitiveCharacter_isPrimitive`. Products at the ambient lcm and their primitive inducers are already `mul` and `primitive_mul`; the latter is primitive by `primitive_mul_isPrimitive`. The existing evaluation comparison has a coprimality hypothesis. The new all-integer adapter restores the missing excluded-prime mask.
- `conductor_changeLevel`, `conductor_inv` and `conductor_mul_dvd_lcm_conductor` already supply the general conductor algebra. The new cancelled-prime lemma is a consequence of these, not a duplicate conductor theory. Quadraticity is the existing `MulChar.IsQuadratic`, including principal characters.
- `Function.Periodic`, natural finite intervals, gcd/coprimality, `Nat.divisors` and `ArithmeticFunction.moebius` already exist. The new nodes are consequences and adapters, not replacement definitions.
- Complete character cancellation is already `MulChar.sum_eq_zero_of_ne_one`. The missing interface is the incomplete natural interval and its precise residual length.
- The convolution identity for Möbius and zeta is built. The weighted, exclusion-filtered finite interval formula is the adapter developed here.
- The divisor count is owned by AnalyticNumberTheory:AN.5. Its exact nodes `AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound` and `AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound` supply the needed estimates. These are proposed blueprint declarations, not implemented library results. Their proofs are not duplicated here.

## Conventions that affect the mathematics

Every endpoint is a natural number. The interval (A,B] means exactly the finite set of natural m with A<m and m≤B. It is empty when B≤A. Its cardinality is truncated B−A, not an integer difference interpreted as a signed interval.

Natural division is floor division. Reindexing m=dn changes both endpoints: (A,B] becomes (A div d,B div d]. The open lower endpoint is essential. In the half interval used by the paper, k div 2 is floor(k/2), so odd k presents no separate ambiguity. For example, k=7 gives precisely the four integers 4,5,6,7.

For q>0, a character modulo q is evaluated on a natural n by casting n to ZMod q. Nonprincipal means χ≠1 in the existing multiplicative-character monoid, not merely that the value at a selected residue differs from one. The principal character is zero at nonunits and one at units. Its complete sum is the number of units, so it must not be used in a zero-mean argument.

Write τ(M)=card(M.divisors). Positive divisors are the library finite set; its convention at zero is the empty set. Every expansion over an exclusion modulus assumes M>0. The coprimality mask is local notation for the expression which equals the summand on coprime arguments and zero otherwise. It is not a new definition of an arithmetic function, and the packet contains no new definition/construction nodes.

Complex norms are the ordinary absolute values. Real powers use positive or nonnegative real casts as specified. The final application requires c>0 and k≥1 before manipulating reciprocal exponents; these are hypotheses, not informal large-parameter conventions.

Three integers have different roles in the source application: the ambient modulus of the product, the conductor of its primitive inducing character, and the product of excluded primes. In the generic lemmas below q is any positive character modulus and M is any positive exclusion modulus. The product qM is a valid period but is not asserted to be a least period or a conductor. Neither coprimality of q and M nor squarefreeness of M is needed for the finite-sum estimates.

## The twenty-one declarations

The dependency chain begins with exact periodic cancellation, uses it to bound each Möbius-reindexed inner sum, and ends with two bounds and explicit constant absorption. Every node below has implementation status unchecked. Its proposed name is in `TauCeti.ExponentialSumsPlan`.

### 1. Zero-mean periodic interval remainder

Identifier: `ExponentialSumsAndCircleMethod:ES.0/periodic-interval-remainder`. Proposed declaration: `TauCeti.ExponentialSumsPlan.periodic_interval_remainder`.

For f:N→C, q>0, f(n+q)=f(n) and Σ_{0≤j<q}f(j)=0, and any natural A,B, Σ_{A<m≤B}f(m)=Σ_{0≤j<(B−A) mod q}f(A+j+1). Subtraction is truncated natural subtraction.

No ordering assumption on A,B. No norm bound on f is needed.

Proof plan:

1. If B≤A, both finite index sets are empty, so conclude directly.
2. For B>A, use the existing natural interval enumeration m=A+j+1 with 0≤j<B−A.
3. The sum f(1)+...+f(q) equals the range-q sum by f(q)=f(0). Moving a length-q block one step replaces f(a+1) by f(a+q+1), which is equal by periodicity; induction gives zero for every shifted full block.
4. Write B−A=tq+r with 0≤r<q. Reindex the first tq entries by t blocks of length q; each block contributes zero.
5. In the remaining r entries, apply periodicity t times to replace f(A+tq+j+1) by f(A+j+1).

The direct prerequisites are `mathlib:Function.Periodic`, `mathlib:Nat.card_Ioc`. The source use is the incomplete η-sums on p.379: Removes complete periods before taking norms.

Acceptance checks:

- For f(n)=(0,1,−1) indexed by n mod 3, the interval (0,2] sums to zero and (1,2] sums to −1.
- When q divides B−A, the sum is zero for every starting point.
- For B<A, both sides are zero; no signed-interval convention is used.

### 2. Norm bound by the residual interval length

Identifier: `ExponentialSumsAndCircleMethod:ES.0/periodic-interval-norm`. Proposed declaration: `TauCeti.ExponentialSumsPlan.periodic_interval_norm`.

Under the hypotheses of periodic-interval-remainder, also assume ‖f(n)‖≤1 for every natural n. Then ‖Σ_{A<m≤B}f(m)‖≤((B−A) mod q), with the natural remainder cast to R.

q>0; zero mean over a complete period; pointwise norm at most one.

Proof plan:

1. Rewrite the interval sum with periodic-interval-remainder.
2. Apply the finite-sum triangle inequality.
3. Bound each of the r summands by one, and evaluate the cardinality of range r. In particular this proves a bound strictly less than q, although the exported character adapter uses the weaker ≤q.

The direct prerequisites are `ExponentialSumsAndCircleMethod:ES.0/periodic-interval-remainder`, `mathlib:norm_sum_le`. The source use is the bound for each inner η-sum on p.379: Avoids the unnecessary 2q loss from subtracting two prefix estimates.

Acceptance checks:

- The χ3 table on (1,2] has norm 1 and remainder length 1, so equality occurs.
- A length-q interval has bound zero, not q.
- Scaling a nonzero zero-mean sequence by 2 can violate the bound: the pointwise hypothesis is essential.

### 3. Incomplete nonprincipal character bound

Identifier: `ExponentialSumsAndCircleMethod:ES.0/character-interval-bound`. Proposed declaration: `TauCeti.ExponentialSumsPlan.character_interval_bound`.

For q>0 and a nonprincipal complex Dirichlet character χ modulo q, ‖Σ_{A<m≤B}χ(m)‖≤q for all natural A,B. Values are taken by natural casting into ZMod q.

Nonprincipal means χ≠1 in the existing character monoid. Neither primitive nor quadratic is assumed.

Proof plan:

1. The character is q-periodic because q casts to zero in ZMod q.
2. Identify the q natural representatives 0,...,q−1 bijectively with ZMod q; use MulChar.sum_eq_zero_of_ne_one over C for the zero complete sum.
3. Use DirichletCharacter.norm_le_one pointwise.
4. Apply periodic-interval-norm; since q>0, the natural remainder is <q and hence ≤q.

The direct prerequisites are `ExponentialSumsAndCircleMethod:ES.0/periodic-interval-norm`, `mathlib:DirichletCharacter`, `mathlib:ZMod.natCast_self`, `mathlib:MulChar.sum_eq_zero_of_ne_one`, `mathlib:DirichletCharacter.norm_le_one`. The source use is p.379, inner sums indexed by k/(2d)<n≤k/d: Provides the uniform bound after each divisor reindexing.

Acceptance checks:

- The nonprincipal character modulo 3 has values (0,1,−1), and its (1,2] sum is −1.
- The principal character modulo 3 sums to 8 on (0,12], exceeding q=3.
- An imprimitive but nonprincipal character is allowed; conductor need not equal q.

### 4. Reindexing divisible interval entries

Identifier: `ExponentialSumsAndCircleMethod:ES.0/divisible-interval-reindex`. Proposed declaration: `TauCeti.ExponentialSumsPlan.divisible_interval_reindex`.

For f:N→C, natural A,B and d>0, Σ_{m∈(A,B], d|m}f(m)=Σ_{A div d<n≤B div d}f(dn), where div is natural floor division.

d>0 is required for injectivity and division. Both interval endpoints are divided, and the lower endpoint remains open.

Proof plan:

1. Map n to dn. Division with remainder gives A<dn iff A div d<n, and dn≤B iff n≤B div d.
2. Positive multiplication is injective, so no weight or multiplicity is introduced.
3. For each divisible m in the left index set, m=d(m div d); its quotient satisfies the right inequalities.
4. Use the finite-sum bijection. If B≤A both sides are empty because floor division is monotone.

The direct prerequisites are `mathlib:Nat.card_Ioc`. The source use is p.379, change from m to nd: Records both floors rather than suppressing endpoint conventions.

Acceptance checks:

- For f(n)=n, A=2,B=7,d=3, both sides sum 3+6=9.
- For A=3,B=6,d=3, only m=6 survives; including the lower endpoint would wrongly add 3.
- For A=1,B=2,d=3 there are no terms; rounding an upper endpoint upward gives a wrong term.

### 5. Weighted coprimality expansion

Identifier: `ExponentialSumsAndCircleMethod:ES.0/coprime-moebius-expansion`. Proposed declaration: `TauCeti.ExponentialSumsPlan.coprime_moebius_expansion`.

For f:N→C and natural A,B,M with M>0, Σ_{A<m≤B}1_{gcd(m,M)=1}f(m)=Σ_{d|M}μ(d) Σ_{A<m≤B,d|m}f(m), with μ(d) cast from Z to C and d ranging over M.divisors.

M>0; no squarefreeness assumption. The coprimality factor means f(m) if Nat.Coprime m M and zero otherwise, not a newly defined carrier.

Proof plan:

1. For each m, gcd(m,M)>0 because M>0.
2. Evaluate moebius_mul_coe_zeta at gcd(m,M), use coe_mul_zeta_apply and one_apply, and obtain Σ_{d|gcd(m,M)}μ(d)=1 if gcd(m,M)=1 and zero otherwise.
3. A positive d divides gcd(m,M) exactly when it divides both m and M. Replace this divisor sum by the divisor set of M filtered by d|m.
4. Multiply by f(m), distribute and interchange the two finite sums. Coerce the integer identity to C; no infinite summability input is involved.

The direct prerequisites are `mathlib:ArithmeticFunction.moebius`, `mathlib:ArithmeticFunction.moebius_mul_coe_zeta`, `mathlib:ArithmeticFunction.coe_mul_zeta_apply`, `mathlib:ArithmeticFunction.one_apply`, `mathlib:Nat.divisors`, `mathlib:Nat.mem_divisors`. The source use is p.378, Möbius divisor identity; p.379, first finite interchange: Uses the existing arithmetic function and gcd instead of rebuilding either.

Acceptance checks:

- M=1 retains every term, since its only divisor is 1 with μ(1)=1.
- For M=4, μ(4)=0 and the expansion is still correct; squarefreeness is not needed.
- M=0 is excluded: its library divisor set is empty, but the interval containing m=1 can have a nonzero coprime contribution.

### 6. Möbius expansion of an excluded character sum

Identifier: `ExponentialSumsAndCircleMethod:ES.0/character-exclusion-expansion`. Proposed declaration: `TauCeti.ExponentialSumsPlan.character_exclusion_expansion`.

For a complex Dirichlet character χ modulo any natural q and M>0, Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)=Σ_{d|M}μ(d)χ(d)Σ_{A div d<n≤B div d}χ(n).

q may be zero for this algebraic identity; positivity is imposed only for the subsequent finite-period bound. M may share prime factors with q and may be nonsquarefree.

Proof plan:

1. Apply coprime-moebius-expansion to the character-value function.
2. Every d in M.divisors is positive by Nat.pos_of_mem_divisors; apply divisible-interval-reindex to each inner sum.
3. Use multiplicativity χ(dn)=χ(d)χ(n), including zero values at nonunits.
4. Move the fixed scalar χ(d) outside its inner finite sum and associate the factors in C.

The direct prerequisites are `ExponentialSumsAndCircleMethod:ES.0/coprime-moebius-expansion`, `ExponentialSumsAndCircleMethod:ES.0/divisible-interval-reindex`, `mathlib:DirichletCharacter`, `mathlib:Nat.pos_of_mem_divisors`. The source use is p.379, final Möbius expansion: Exposes the only analytic input needed by each divisor term.

Acceptance checks:

- For χ3, M=2 and interval (0,2], the excluded sum is 1, not the unrestricted sum zero.
- For χ3 and M=3, divisors containing 3 contribute χ(3)=0; no coprimality hypothesis between q and M is required.
- Replacing M=2 by M=4 leaves the coprimality filter unchanged; μ(4)=0 makes the divisor expression compatible.

### 7. Divisor-weighted character bound

Identifier: `ExponentialSumsAndCircleMethod:ES.0/character-exclusion-bound`. Proposed declaration: `TauCeti.ExponentialSumsPlan.character_exclusion_bound`.

For q>0, nonprincipal χ modulo q, M>0, and natural A,B, ‖Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)‖≤τ(M)q, where τ(M)=card(M.divisors).

No primitivity, quadraticity, squarefreeness or gcd(q,M)=1 assumption. The inequality is non-strict and uniform in both endpoints.

Proof plan:

1. Use character-exclusion-expansion and the finite-sum triangle inequality.
2. Each coefficient μ(d)χ(d) has norm at most one: combine abs_moebius_le_one after scalar coercion and DirichletCharacter.norm_le_one.
3. Apply character-interval-bound to the interval with endpoints A div d and B div d; it is valid even when that interval is empty.
4. There are exactly τ(M) divisor terms, each bounded by q, so their sum is at most τ(M)q.

The direct prerequisites are `ExponentialSumsAndCircleMethod:ES.0/character-exclusion-expansion`, `ExponentialSumsAndCircleMethod:ES.0/character-interval-bound`, `mathlib:ArithmeticFunction.abs_moebius_le_one`, `mathlib:DirichletCharacter.norm_le_one`, `mathlib:norm_sum_le`. The source use is p.379, final displayed character-sum bound: Supplies the small-conductor cancellation input after a separately owned divisor estimate.

Acceptance checks:

- M=1 gives the ordinary bound q, since τ(1)=1.
- For M=6 there are four divisor terms and the stated upper bound is 4q, not 2q.
- τ(120)=16; the estimate makes no use of a false all-q logarithmic upper bound for τ.

### 8. Zero mean for the excluded product period

Identifier: `ExponentialSumsAndCircleMethod:ES.0/exclusion-complete-period`. Proposed declaration: `TauCeti.ExponentialSumsPlan.exclusion_complete_period`.

For q>0, nonprincipal χ modulo q and M>0, Σ_{0<m≤qM}1_{gcd(m,M)=1}χ(m)=0. The integer qM is a period, not an assertion about primitive conductor.

No gcd(q,M)=1 or squarefree M restriction.

Proof plan:

1. Apply character-exclusion-expansion with A=0,B=qM.
2. If d divides M then (qM) div d=q(M div d), so each inner character sum has length divisible by q.
3. The q-periodicity and zero complete character sum established in the proof of character-interval-bound give the hypotheses of periodic-interval-remainder; use it with this divisible length to get zero.
4. Every weighted term is zero, hence so is the finite divisor sum.

The direct prerequisites are `ExponentialSumsAndCircleMethod:ES.0/character-exclusion-expansion`, `ExponentialSumsAndCircleMethod:ES.0/periodic-interval-remainder`, `mathlib:ZMod.natCast_self`, `mathlib:MulChar.sum_eq_zero_of_ne_one`, `mathlib:Nat.mem_divisors`. The source use is p.378, direct period estimate in Case 2: Justifies the complete-period cancellation for the masked character.

Acceptance checks:

- For χ3 and M=2, the interval (0,6] contributes 1−1=0.
- For M=1 this is the usual complete-period cancellation.
- For χ3 and M=3 the interval (0,9] also sums to zero, despite shared prime factors.

### 9. Product-period character bound

Identifier: `ExponentialSumsAndCircleMethod:ES.0/exclusion-direct-period-bound`. Proposed declaration: `TauCeti.ExponentialSumsPlan.exclusion_direct_period_bound`.

For q>0, nonprincipal χ modulo q, M>0, and natural A,B, ‖Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)‖≤qM.

qM is only a valid period; it need not be the least period or an ambient conductor.

Proof plan:

1. Write F(m) for the existing expression equal to χ(m) when m is coprime to M and zero otherwise; this is local notation, not a new definition node.
2. The character factor is qM-periodic by q-periodicity. The indicator is qM-periodic by the existing coprimality invariance under adding multiples of M. Thus F is qM-periodic and has norm at most one.
3. Use exclusion-complete-period and F(qM)=F(0) to turn the sum over (0,qM] into the range-qM zero mean required by periodic-interval-norm.
4. Apply that bound with qM>0 and weaken the remainder bound to qM.

The direct prerequisites are `ExponentialSumsAndCircleMethod:ES.0/exclusion-complete-period`, `ExponentialSumsAndCircleMethod:ES.0/periodic-interval-norm`, `mathlib:Nat.coprime_add_mul_right_right`, `mathlib:DirichletCharacter.norm_le_one`, `mathlib:ZMod.natCast_self`. The source use is p.378, the direct bound preceding the assumption on M₂: Keeps the valid period estimate without the source's false modulus equality.

Acceptance checks:

- For χ3 and M=4, the bound is 12 although the masked sequence already has period 6; least-period minimality is not claimed.
- M=1 returns the ordinary q bound.
- The character identity χ8χ−8=χ−4 has ambient lcm 8 but primitive conductor 4; period and conductor cannot be conflated.

### 10. Small-conductor square-root saving

Identifier: `ExponentialSumsAndCircleMethod:ES.0/small-conductor-power-saving`. Proposed declaration: `TauCeti.ExponentialSumsPlan.small_conductor_power_saving`.

Let c>0, C≥1 and assume τ(M)≤C M^(1/(64c)) for every positive natural M. If k≥1 is natural with 8C≤k^(17/64), q>0, χ modulo q is nonprincipal, M>0, q≤8k^(7/32), and M≤k^c, then ‖Σ_{k div 2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2). All powers in the hypotheses and conclusion are real powers of nonnegative casts.

This conditional adapter takes the divisor estimate as an explicit hypothesis; the subsequent nodes instantiate it with exact AN.5 suppliers. The conclusion is this small-conductor branch, not the full distinct-quadratic-character proposition.

Proof plan:

1. Apply character-exclusion-bound to A=k div 2 and B=k.
2. Put ε=1/(64c)>0. Monotonicity of nonnegative real powers gives M^ε≤(k^c)^ε=k^(1/64); justify the exponent simplification using c>0 and k≥1.
3. The assumed divisor bound and q≤8k^(7/32) now give τ(M)q≤8C k^(15/64).
4. Multiply 8C≤k^(17/64) by the nonnegative k^(15/64) and use the real-power addition law: 17/64+15/64=1/2.
5. This proof needs no artificial split at M=k^(3/4); AN.5 supplies a uniform constant for every positive M.

The direct prerequisites are `ExponentialSumsAndCircleMethod:ES.0/character-exclusion-bound`, `mathlib:Real.rpow_le_rpow`, `mathlib:Real.rpow_mul`, `mathlib:Real.rpow_add`. The source use is pp.378–379, end of Case 2, using the corrected divisor estimate: Makes constant dependence and the large-k threshold explicit.

Acceptance checks:

- The exact exponent identity is 7/32+1/64+17/64=1/2.
- For odd k=7 the index interval begins after floor(7/2)=3, so it contains 4,5,6,7.
- Neither c=0 nor deletion of the lower-threshold condition is permitted; the reciprocal exponent and constant absorption need the stated hypotheses.

### 11. Explicit excluded-character subpower bound

Identifier: `ExponentialSumsAndCircleMethod:ES.0/character-exclusion-explicit-subpower-bound`. Proposed declaration: `TauCeti.ExponentialSumsPlan.character_exclusion_explicit_subpower_bound`.

For ε>0 and a natural B≥exp(1/ε), every nonprincipal complex character χ modulo q>0, positive exclusion modulus M and natural endpoints A,Z satisfy ‖Σ_{A<m≤Z}1_{gcd(m,M)=1}χ(m)‖≤D^B q M^ε, where D=max(1,(ε log2)⁻¹).

ε>0; B natural with exp(1/ε)≤B; q>0; χ≠1; M>0; A,Z natural with no ordering assumption.

Proof plan:

1. Apply character-exclusion-bound to bound the norm by τ(M)q.
2. Import AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound at ε,B,M, obtaining τ(M)≤D^B M^ε.
3. Multiply by q≥0 and rearrange the real factors. Neither the divisor function nor its subpower proof is duplicated.

The direct prerequisites are `ExponentialSumsAndCircleMethod:ES.0/character-exclusion-bound`, `AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound`. This is a worker-derived composition of the corrected Bennett–Siksek small-conductor argument and the AN.5 supplier, not a separately named theorem in the article.

Acceptance checks:

- The same constant works for every character and both endpoints.
- M=1 yields the coarser D^B q bound; the original sharper q theorem is retained.
- Shared prime factors of q,M and nonsquarefree M remain allowed.

### 12. Explicit small-conductor threshold

Identifier: `ExponentialSumsAndCircleMethod:ES.0/small-conductor-explicit-threshold`. Proposed declaration: `TauCeti.ExponentialSumsPlan.small_conductor_explicit_threshold`.

Let c>0, B∈ℕ with B≥exp(64c), and put D=max(1,((64c)⁻¹ log2)⁻¹), C=D^B. For natural k≥1 with (8C)^(64/17)≤k, every nonprincipal complex character χ modulo q>0 and M>0 satisfying q≤8k^(7/32) and M≤k^c obeys ‖Σ_{k div2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2).

c>0; B natural with exp(64c)≤B; k≥1; the displayed explicit size threshold; q>0; χ≠1; M>0; the two growth bounds.

Proof plan:

1. Set ε=(64c)⁻¹>0; 1/ε=64c. The imported explicit AN.5 bound with this B supplies τ(M)≤C M^ε for every M>0, and C≥1.
2. Monotonicity of the real power 17/64 applied to (8C)^(64/17)≤k gives 8C≤k^(17/64), using positive base 8C and (64/17)(17/64)=1.
3. Apply small-conductor-power-saving with this actual uniform divisor bound. No unspecified constant or unrecorded eventual condition remains.

The direct prerequisites are `ExponentialSumsAndCircleMethod:ES.0/small-conductor-power-saving`, `AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound`, `mathlib:Real.rpow_le_rpow`, `mathlib:Real.rpow_mul`. This is a worker-derived composition of the corrected Bennett–Siksek small-conductor argument and the AN.5 supplier, not a separately named theorem in the article.

Acceptance checks:

- Equality at the threshold is permitted.
- For C≥1 the size condition cannot hold at k=1; dropping it is detectable.
- B may be any certified integer upper bound, so exact real ceilings are not required.

### 13. Uniform eventual small-conductor cancellation

Identifier: `ExponentialSumsAndCircleMethod:ES.0/eventual-small-conductor-power-saving`. Proposed declaration: `TauCeti.ExponentialSumsPlan.eventual_small_conductor_power_saving`.

For each real c>0 there exists a natural K≥1 such that for all k≥K, all positive q, all nonprincipal complex Dirichlet characters χ modulo q, and all M>0, the inequalities q≤8k^(7/32) and M≤k^c imply ‖Σ_{k div2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2). K depends only on c, not on q,χ,M or k.

c>0; the universal variables satisfy the displayed positivity, nonprincipality and growth conditions.

Proof plan:

1. Import AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound at ε=(64c)⁻¹ to choose C≥1 independent of M.
2. Choose a natural K≥max(1,(8C)^(64/17)) using exists_nat_ge.
3. For every k≥K, real-power monotonicity and rpow_mul give 8C≤k^(17/64). Apply small-conductor-power-saving.
4. For an effectively presented positive c, the preceding explicit-threshold theorem gives a computable certified choice by taking B≥exp(64c) and C=max(1,((64c)⁻¹ log2)⁻¹)^B. The abstract real existence theorem is not an executable arbitrary-real algorithm.

The direct prerequisites are `ExponentialSumsAndCircleMethod:ES.0/small-conductor-power-saving`, `AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound`, `mathlib:exists_nat_ge`, `mathlib:Real.rpow_le_rpow`, `mathlib:Real.rpow_mul`. This is a worker-derived composition of the corrected Bennett–Siksek small-conductor argument and the AN.5 supplier, not a separately named theorem in the article.

Acceptance checks:

- The quantifier order is ∀c>0 ∃K ∀k,q,χ,M; separate thresholds per character are weaker.
- At c=1/64 the imported exponent is exactly 1.
- This is only the small-conductor branch; it does not assert the full product-character proposition.


## Product-conductor conventions

For declarations 14–21 only, write M=lcm(N1,N2), σ=χ1.mul χ2, q=cond(σ), η=χ1.primitive_mul χ2 and R=∏{p prime : p divides M and p does not divide q}p. These are local expressions in existing types, not new definitions. In declarations 15–17, σ may instead be any character modulo M>0. Do not confuse this ambient M with the arbitrary exclusion modulus called M in declarations 1–13; their application substitutes R for that exclusion modulus.

The exact identities are gcd(q,R)=1 and qR|M. R has each excluded prime once, so it is positive even when its prime set is empty. It need not equal M/q. For χ8χ−8=χ−4, M=8, q=4 and R=1. For χ3 times the primitive product χ3χ5 of conductor 15, M=15, q=5 and R=3. The comparison with the primitive character must include the R mask even at negative integers and at zero.

### 14. Integer evaluation of the ambient product

Identifier: `ExponentialSumsAndCircleMethod:ES.0/ambient-product-evaluation`. Proposed declaration: `TauCeti.ExponentialSumsPlan.ambient_product_evaluation`.

For positive N1,N2, complex Dirichlet characters χi modulo Ni and every integer a, the existing character σ=χ1.mul χ2 modulo M=lcm(N1,N2) satisfies σ(a)=χ1(a)χ2(a).

No primitivity, quadraticity, distinctness or coprimality of the moduli is required. Evaluations cast the same integer to each residue ring, including nonunits.

Proof plan:

1. Unfold the existing ambient product as A·B, with A and B the change-level lifts to M.
2. If a is coprime to M, apply the existing coprime change-level evaluation theorem to both factors.
3. If a is not coprime to M, choose a common prime of |a| and M. A prime divides an lcm exactly when it divides at least one input modulus, so at least one original character vanishes. The ambient character vanishes as well.
4. Use integer gcd via natural absolute values to cover a=0 and negative a; no division or representative choice is needed.

The direct prerequisites are `mathlib:DirichletCharacter.mul`, `mathlib:DirichletCharacter.changeLevel_eq_cast_of_dvd'`, `mathlib:DirichletCharacter.apply_eq_zero_iff`, `mathlib:Nat.Prime.dvd_lcm`, `mathlib:Nat.Prime.not_coprime_iff_dvd`. The source use is Bennett–Siksek §8.1, printed pp.377–379: Transfers the source's pointwise product into the already existing ambient character.

Acceptance checks:

- Do not apply the coprime change-level formula at a nonunit.
- Distinct characters of equal modulus are allowed.

### 15. Coprimality of conductor and excluded primes

Identifier: `ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-coprime`. Proposed declaration: `TauCeti.ExponentialSumsPlan.primitive_exclusion_coprime`.

For any complex character σ modulo M>0, put q=cond(σ) and R=∏{p prime : p divides M and p does not divide q}p. Then gcd(q,R)=1.

The finite prime set is the existing primeFactors(M) filtered by p not dividing q; the empty product is 1. σ may be principal or imprimitive.

Proof plan:

1. Every factor p is prime and does not divide q, hence is coprime to q.
2. Apply the finite-product coprimality equivalence; no prime power or multiplicity is included.

The direct prerequisites are `mathlib:Nat.primeFactors`, `mathlib:Nat.mem_primeFactors`, `mathlib:Nat.coprime_prod_right_iff`. The source use is Bennett–Siksek §8.1, printed pp.377–379: Provides the coprime primitive/exclusion split required before the CRT branch.

Acceptance checks:

- M=8,q=4 gives R=1.
- M=q=1 has an empty excluded-prime set and satisfies the result.

### 16. The reduced product divides the ambient modulus

Identifier: `ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-period-divides`. Proposed declaration: `TauCeti.ExponentialSumsPlan.primitive_exclusion_period_divides`.

For σ modulo M>0, q=cond(σ) and R the product of prime divisors of M absent from q, qR divides M.

No assertion that qR=M or that qR is a primitive conductor. All prime factors in R occur once; q>0 is supplied by conductor_ne_zero.

Proof plan:

1. The product R over a subset of primeFactors(M) divides the full prime product, which divides M.
2. The existing conductor theorem gives q dividing M.
3. Combine these two divisibilities using gcd(q,R)=1, or equivalently identify their lcm with qR.

The direct prerequisites are `ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-coprime`, `mathlib:DirichletCharacter.conductor_dvd_level`, `mathlib:DirichletCharacter.conductor_ne_zero`, `mathlib:Finset.prod_dvd_prod_of_subset`, `mathlib:Nat.prod_primeFactors_dvd`. The source use is Bennett–Siksek §8.1, printed pp.377–379: Replaces the source's unjustified equality between the ambient modulus and its reduced primitive/exclusion product.

Acceptance checks:

- The 2-adic example gives strict divisibility 4|8.
- For the principal character modulo 12, qR=6|12.

### 17. The primitive character with its exclusion mask

Identifier: `ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-evaluation`. Proposed declaration: `TauCeti.ExponentialSumsPlan.primitive_exclusion_evaluation`.

For every complex character σ modulo M>0 and integer a, let q=cond(σ), η=σ.primitiveCharacter and R the product of prime divisors of M absent from q. Then σ(a)=η(a) if gcd(|a|,R)=1, and σ(a)=0 otherwise.

No nonprincipality or primitivity hypothesis on σ; q=1 is allowed. The mask uses coprimality of integers, equivalent to natural coprimality for nonnegative inputs.

Proof plan:

1. If a is not coprime to R, a prime of R divides both a and M; the ambient character vanishes.
2. Suppose a is coprime to R. If a is also coprime to q, it is coprime to M: a hypothetical common prime of a and M either divides q or occurs among the factors of R, giving a contradiction.
3. In this coprime-to-M case use primitiveCharacter_apply_of_isCoprime to equate η(a) and σ(a).
4. In the remaining case a is not coprime to q. Since q divides M, neither character is evaluated at a unit, so both values vanish. These cases also handle a=0 and negative a.

The direct prerequisites are `mathlib:DirichletCharacter.primitiveCharacter`, `mathlib:DirichletCharacter.primitiveCharacter_apply_of_isCoprime`, `mathlib:DirichletCharacter.apply_eq_zero_iff`, `mathlib:DirichletCharacter.conductor_dvd_level`, `mathlib:Nat.mem_primeFactors`, `mathlib:Nat.Prime.not_coprime_iff_dvd`, `mathlib:Nat.isCoprime_iff_coprime`. The source use is Bennett–Siksek §8.1, printed pp.377–379: Turns the product evaluation into the exact masked finite sums already decomposed in the first thirteen nodes.

Acceptance checks:

- At M=15,q=5 the mask must remove multiples of 3 even when η is nonzero there.
- At M=12 for the principal character, η is the character modulo 1 and R=6; the masked identity includes a=0.
- The formula is valid for R=1; do not require a nonempty principal-factor family.

### 18. Cancelled primes divide both original conductors

Identifier: `ExponentialSumsAndCircleMethod:ES.0/cancelled-prime-common-support`. Proposed declaration: `TauCeti.ExponentialSumsPlan.cancelled_prime_common_support`.

Let χ1,χ2 be primitive complex Dirichlet characters of positive moduli N1,N2. Set M=lcm(N1,N2), σ=χ1.mul χ2, q=cond(σ), and R the product of prime divisors of M not dividing q. Then R divides gcd(N1,N2).

Quadraticity and distinctness are unnecessary, but primitivity of both inputs is required.

Proof plan:

1. Lift χ1,χ2 to A,B modulo M. By conductor_changeLevel and primitivity, their conductors are N1,N2.
2. Write A=(A·B)·B⁻¹. Apply conductor_mul_dvd_lcm_conductor and conductor_inv to obtain N1 dividing lcm(q,N2). Similarly N2 divides lcm(q,N1).
3. For a prime p of M not dividing q, the lcm criterion first gives p dividing at least one Ni. The corresponding reverse conductor divisibility then forces p to divide the other Ni.
4. Every factor of R is consequently a prime divisor of gcd(N1,N2). Its distinct-prime product divides the radical of that gcd, which divides the gcd.

The direct prerequisites are `mathlib:DirichletCharacter.IsPrimitive`, `mathlib:DirichletCharacter.conductor_changeLevel`, `mathlib:DirichletCharacter.conductor_inv`, `mathlib:DirichletCharacter.conductor_mul_dvd_lcm_conductor`, `mathlib:Nat.Prime.dvd_lcm`, `mathlib:Nat.mem_primeFactors`, `mathlib:Finset.prod_dvd_prod_of_subset`, `mathlib:Nat.prod_primeFactors_dvd`. The source use is Bennett–Siksek §8.1, printed pp.377–379: Supplies R≤min(N1,N2), preserving the source growth exponent c in the small-conductor application.

Acceptance checks:

- Do not infer the claim merely from q dividing M; the reverse conductor bounds are essential.
- The imprimitive principal modulo 8 paired with modulo 1 is a counterexample without primitivity.
- R is bounded by either original modulus, not merely by their product.

### 19. Quadraticity survives primitive reduction

Identifier: `ExponentialSumsAndCircleMethod:ES.0/primitive-product-quadratic`. Proposed declaration: `TauCeti.ExponentialSumsPlan.primitive_product_quadratic`.

For positive N1,N2 and quadratic complex Dirichlet characters χi modulo Ni, the existing primitive product η=χ1.primitive_mul χ2 is quadratic.

Quadratic means the existing predicate that every value is 0, 1 or −1; it includes the principal character. No input primitivity or distinctness is required.

Proof plan:

1. Use the existing equivalence between quadraticity and χ²=1.
2. Change level to M=lcm(N1,N2); the lifts preserve squares as monoid homomorphisms, so σ²=1.
3. The existing change-level equality sends η to σ. Apply injectivity of changeLevel from q to M to infer η²=1, and convert back to quadraticity.

The direct prerequisites are `mathlib:DirichletCharacter.mul`, `mathlib:DirichletCharacter.primitive_mul`, `mathlib:DirichletCharacter.changeLevel`, `mathlib:DirichletCharacter.changeLevel_injective`, `mathlib:DirichletCharacter.changeLevel_primitiveCharacter`, `mathlib:MulChar.IsQuadratic`, `mathlib:MulChar.IsQuadratic.sq_eq_one`, `mathlib:MulChar.isQuadratic_iff_sq_eq_one`. The source use is Bennett–Siksek §8.1, printed pp.377–379: Supplies the quadratic hypothesis for later large-conductor arithmetic; that later branch is not asserted here.

Acceptance checks:

- The diagonal product may become principal and is still quadratic.
- Primitivity of η is already primitive_mul_isPrimitive; do not introduce a new existence theorem.

### 20. Distinct primitive quadratic inputs give a nonprincipal inducer

Identifier: `ExponentialSumsAndCircleMethod:ES.0/primitive-product-nonprincipal`. Proposed declaration: `TauCeti.ExponentialSumsPlan.primitive_product_nonprincipal`.

For positive N1,N2, primitive quadratic complex characters χi modulo Ni, and an integer a with χ1(a)≠χ2(a), the primitive product η=χ1.primitive_mul χ2 is not principal.

Distinctness is as functions on integers; moduli may coincide. The interface retains both source quadratic hypotheses; the proof only needs the second input to square to the principal character.

Proof plan:

1. Assume η=1. Changing level to M gives A·B=1 for the two lifted inputs.
2. Quadraticity gives B²=1, so A=B.
3. Conductor invariance under changeLevel and input primitivity imply N1=N2.
4. Transport across this equality and apply injectivity of changeLevel to deduce χ1=χ2, contradicting the integer witness.

The direct prerequisites are `mathlib:DirichletCharacter.primitive_mul`, `mathlib:DirichletCharacter.changeLevel_primitiveCharacter`, `mathlib:DirichletCharacter.changeLevel_injective`, `mathlib:DirichletCharacter.conductor_changeLevel`, `mathlib:DirichletCharacter.IsPrimitive`, `mathlib:MulChar.IsQuadratic.sq_eq_one`. The source use is Bennett–Siksek §8.1, printed pp.377–379: Justifies the nonprincipal hypothesis needed by incomplete and masked character cancellation.

Acceptance checks:

- Equal primitive inputs give a principal product and must be excluded.
- Distinct conjugate order-three characters modulo 7 have principal product; distinctness without quadraticity is insufficient.
- The χ8,χ−8 example has equal moduli and different character values, so distinct-modulus hypotheses would be too restrictive.

### 21. Small-conductor cancellation for the original product

Identifier: `ExponentialSumsAndCircleMethod:ES.0/small-conductor-product-cancellation`. Proposed declaration: `TauCeti.ExponentialSumsPlan.small_conductor_product_cancellation`.

For each real c>0 there is a natural K≥1 such that, for every k≥K and every pair of distinct primitive quadratic complex Dirichlet characters χi of positive moduli Ni≤k^c, if q=cond(χ1.mul χ2)≤8k^(7/32), then ‖Σ_{k div2<a≤k}χ1(a)χ2(a)‖≤k^(1/2). The threshold K depends only on c.

Distinctness means an integer witness of different values; the moduli may be equal. There is no prime-factor smoothness hypothesis in this small-conductor branch. The theorem does not cover q>8k^(7/32), or assert full Proposition 8.2.

Proof plan:

1. Choose K from eventual-small-conductor-power-saving for the same c.
2. Form the existing σ and η, with q>0 and η nonprincipal by primitive-product-nonprincipal.
3. The excluded prime product R is positive, since all its factors are positive primes (including the empty product 1). By cancelled-prime-common-support, R divides gcd(N1,N2), hence R≤N1≤k^c.
4. Combine ambient-product-evaluation and primitive-exclusion-evaluation, converting integer coprimality to natural coprimality at the natural interval arguments.
5. Apply the uniform masked-character bound with character η modulo q and exclusion modulus R. The threshold is independent of both inputs; no exponent 2c from the ambient lcm is needed.

The direct prerequisites are `ExponentialSumsAndCircleMethod:ES.0/ambient-product-evaluation`, `ExponentialSumsAndCircleMethod:ES.0/primitive-exclusion-evaluation`, `ExponentialSumsAndCircleMethod:ES.0/cancelled-prime-common-support`, `ExponentialSumsAndCircleMethod:ES.0/primitive-product-nonprincipal`, `ExponentialSumsAndCircleMethod:ES.0/eventual-small-conductor-power-saving`, `mathlib:DirichletCharacter.conductor_ne_zero`, `mathlib:DirichletCharacter.primitive_mul_isPrimitive`, `mathlib:Nat.isCoprime_iff_coprime`. The source use is Bennett–Siksek §8.1, printed pp.377–379: Completes the product-to-masked-sum application for the small-conductor branch without duplicating AN.5 or claiming the large-conductor result.

Acceptance checks:

- Preserve the quantifier order ∀c>0 ∃K ∀k,N1,N2,χ1,χ2.
- The strict source Case 2 condition implies the stated non-strict bound; equality at the conductor threshold is harmless.
- R=1 needs no exceptional case. Equal inputs fail the nonprincipal reduction.

## Why the two interval bounds are different

The qM estimate comes from the period of the masked sequence. Its proof must establish zero mean for that sequence; periodicity alone is insufficient. The Möbius expansion proves exactly that zero mean, without a coprimality hypothesis between q and M. A length-qM block is then discarded in one step, and the remaining length is less than qM.

The qτ(M) estimate instead expands the mask into divisor terms and bounds each surviving incomplete character sum. It is substantially smaller when M has many repetitions of the same prime or otherwise has few divisors relative to its size. Both statements are useful interfaces: the period bound is the direct elementary step appearing in the source, and the divisor bound supports the quantitative small-conductor saving.

No cancellation between distinct divisor terms is required. The triangle inequality loses their signs deliberately, while retaining the exact number τ(M). This makes the proof work for complex, imprimitive, nonquadratic characters as long as the character is nonprincipal. The source's stronger quadratic/primitive hypotheses belong to the reduction and large-conductor steps, not to these interval estimates.

The final application uses the stronger uniform divisor statement with an explicit constant. Set ε=1/(64c). From M≤k^c, positivity gives M^ε≤k^(1/64). Multiplication by q≤8k^(7/32) yields 8C k^(15/64). The single lower threshold 8C≤k^(17/64) gives k^(1/2). This avoids introducing a separate condition M>k^(3/4) into a result which does not need it. The AN.5 explicit node supplies C from a certified natural upper bound B≥exp(64c). For effectively presented positive c this yields a computable certified threshold; an existence theorem over arbitrary reals is not an executable real-number algorithm. This does not furnish the other conductor branch of Proposition 8.2.

## Source corrections carried into the plan

The known errata are reproduced as cross-referenced source issues, without assigning a new independent-review verdict. They are scoped to the published version.

First, the claimed universal divisor bound with exponent 1/log log(3q) is false: τ(120)=16, whereas the displayed real-power expression is about14.89222. The corrected input is τ(q)≤Cε q^ε for every positive q and fixed ε>0. Constants and threshold dependence are part of the interface, not notation suppressed by the blueprint.

Second, the lcm of two primitive quadratic conductors is an ambient modulus of their product, not necessarily the product's primitive conductor. The example χ8χ−8=χ−4 has ambient modulus 8 and conductor 4. If M2 consists of primes of the ambient modulus absent from the primitive conductor M1, then the required relation is divisibility M1M2|M, not equality. Declarations 14–20 now decompose the exact masked-character identity and its conductor arithmetic using the pinned general conductor APIs. Declaration 21 applies the earlier uniform small-conductor estimate to the original product. The earlier qM period theorem remains valid in its greater generality, independently of the primitive reduction.

Third, Theorem 6 must use ambient moduli for the general character factors; primitivity is imposed on the distinguished factor. A principal character has conductor 1 even when represented at a larger modulus. The reviewed E11 specifically rejects a supposed missing M2=1 case: the principal-factor collection may be empty, with r=s. The source's r−2 counting argument remains sufficient. This checkpoint does not reintroduce the rejected objection.

The existing errata review's bounded correction search covered the publisher, Crossref, arXiv and the authors' pages on 23 September 2026. That provenance is recorded as inherited research. The present work freshly checked the published passage and the relevant finite counterexamples; it does not assert a newly discovered error or a fresh global search.

## Routed-input ledger

| Routed item | Disposition |
| --- | --- |
| PAPER-BENNETT-SIKSEK-20/44 | Open full Proposition 8.2; present nodes do not assert closure. |
| PAPER-BENNETT-SIKSEK-20/92 | Open complete Graham–Ringrose proof and corrected modulus interface. |
| PAPER-BENNETT-SIKSEK-20/93 | Existing primitiveCharacter/changeLevel/IsPrimitive APIs, with the coprime evaluation boundary recorded. |
| PAPER-BENNETT-SIKSEK-20/94 | Decomposed by the eight new conductor, exclusion and small-product adapters; existing primitive construction reused, all nodes unchecked. |
| PAPER-BENNETT-SIKSEK-20/95 | Open CRT packing; retain accepted E11 treatment of empty principal products. |
| PAPER-BENNETT-SIKSEK-20/96 | Exact AN.5 explicit and uniform divisor nodes imported; no ES-owned duplicate divisor-function theory. |
| PAPER-BENNETT-SIKSEK-20/97 | Thirteen unchanged masked-character nodes, now applied to the original product by declaration 21. |

The exact supplier `AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound` says that for ε>0 and a natural B≥exp(1/ε), every positive natural n satisfies τ(n)≤max(1,(ε log2)⁻¹)^B n^ε. Its companion `AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound` states that for every ε>0 there exists C≥1 such that τ(n)≤C n^ε for every positive n, with C depending only on ε. These contracts resolve the former stage-level request. Neither is an eventual-only estimate with an unrecorded lower cutoff.

The application takes ε=(64c)⁻¹, so 1/ε=64c. A certified integer B≥exp(64c) determines C, and any natural K≥max(1,(8C)^(64/17)) works simultaneously for every allowed character, modulus and exclusion modulus. Exact ceilings are unnecessary: larger certified integer upper bounds also work. No new definition of τ is requested. Source proof ownership and implementation status are unchanged by resolving this dependency.

## Remaining stage targets

Every stage remains partial. The audited presence of building blocks must not be confused with the realization of a complete analytic target.

### ExponentialSumsAndCircleMethod:ES.0

Twenty-one adapters decompose the small-conductor interval argument and its product-character conductor/exclusion reduction. Still required: CRT prime-block packing and its empty-product case; a complete proof of the Graham–Ringrose input and full Proposition 8.2 assembly; all Weyl, van der Corput, stationary-phase and completion targets not supplied by these adapters.

### ExponentialSumsAndCircleMethod:ES.1

Read exact source proofs for torus counting identities, normalized Haar measure, major/minor arc definitions and disjointness, and weighted/smoothed limiting arguments; finite additive orthogonality and torus Fourier basics already exist and must be reused.

### ExponentialSumsAndCircleMethod:ES.2

Select and read an entire efficient-congruencing or decoupling proof; decompose restriction/Kakeya inputs and Vinogradov mean values with both expected terms and epsilon loss, plus every low-degree case actually needed.

### ExponentialSumsAndCircleMethod:ES.3

Specify singular integral/series, their convergence and Euler factorization, normalized p-adic densities, and positivity from explicitly nonsingular local solutions at every place. Existing Haar infrastructure alone does not prove these analytic assertions.

### ExponentialSumsAndCircleMethod:ES.4

Separate Waring, prime-weighted, and forms-in-many-variables endpoints with exact variable/degree/singular-locus/error ranges. Import uniform progression estimates from AN.3 and Vaughan/Heath-Brown Type I/II interfaces from SV.2; unweighted mean values do not prove prime estimates.

### ExponentialSumsAndCircleMethod:ES.5

Read and decompose determinant-method point bounds and arithmetic-geometric comparison interfaces with explicit degree/coefficient/height dependence; distinguish upper bounds from positive-main-term asymptotics. Bounded-height finiteness and Pila–Wilkie are not substitutes.

For ES.0, a complete proof of the original source's large-conductor estimate is still necessary before its quotation can become a closed prerequisite. For the general circle-method programme, the campaign's BDG, KED-ANT and VAUGHAN routes identify leads, not read proofs. Source edition, exact theorem range and full proof must be selected before declaring those portions source-decomposed. In ES.2, the degree range of a selected decoupling theorem cannot silently provide unproved low-degree cases. In ES.3, local solvability alone does not replace source-scoped nonsingularity and positivity. In ES.4, the prime-weighted branch must not be inferred from unweighted Vinogradov mean values.

The remaining exact gaps are recorded in the packet; the first mathematical continuation is the product-character reduction, which turns the standalone finite-sum result into an input for Proposition 8.2. Its first discriminating case should be the 2-adic cancellation example, because odd-prime-only reasoning misses the conductor shrinkage that motivated the source correction.

## Contract tests and verification

The suggested file gives all twenty-one main signatures and thirty-six contract examples. Example names appear in comments next to their statements. Integer character tables in the tests are concrete value checks, not substitute character structures or a claim that their general character laws have been formalized there.

- `character_three_complete`: For the integer χ3 table (0,1,−1), Σ_{0<n≤2}χ3(n)=0.
- `reversed_interval`: Σ_{5<n≤4}(n:Z)=0.
- `character_three_singleton`: For the same table, Σ_{1<n≤2}χ3(n)=−1.
- `constant_nonexample`: The constant-one function sums to 12 on (0,12]; bounded values alone do not imply a bound by a fixed period.
- `divisible_sum_floor`: Σ_{2<n≤7,3|n}(n:C)=9.
- `divisible_sum_open_left`: Σ_{3<n≤6,3|n}(n:C)=6.
- `divisible_sum_empty`: Σ_{1<n≤2,3|n}(n:C)=0.
- `moebius_one`: Σ_{d|1}μ(d)=1.
- `moebius_six`: Σ_{d|6}μ(d)=0.
- `moebius_four`: Σ_{d|4}μ(d)=0.
- `moebius_square`: μ(4)=0.
- `divisor_count_six`: card(6.divisors)=4.
- `divisor_count_one`: card(1.divisors)=1.
- `divisor_count_counterexample`: card(120.divisors)=16.
- `excluded_complete_period`: For the integer χ3 table, Σ_{0<n≤6, gcd(n,2)=1}χ3(n)=0.
- `nonsquarefree_mask`: For the χ3 table on (0,6], the sums restricted by gcd(n,2)=1 and gcd(n,4)=1 are equal.
- `odd_half_endpoint`: Natural floor division gives 7 div 2=3.
- `saving_exponents`: As real numbers, 7/32+1/64+17/64=1/2.

- `explicit_constant_one_exponent`: For ε>0 and any natural B, max(1,(ε log2)⁻¹)^B≥1.
- `threshold_reciprocal_exponents`: (64/17)(17/64)=1 in the real numbers.
- `threshold_equality`: For C≥1, ((8C)^(64/17))^(17/64)=8C.
- `threshold_one_rejected`: For C≥1, the inequality 8C≤1^(17/64) is false.
- `divisor_supplier_exponent`: For c>0, 1/((64c)⁻¹)=64c.
- `one_small_conductor_exponent`: At c=1/64 the divisor exponent 1/(64c) equals 1.

The previous threshold continuation also proved eight checks in a separate scratch Lean file: all six new contract examples, the pointwise conversion from (8C)^(64/17)≤k to 8C≤k^(17/64), and the existence of one natural threshold valid for every later k. These checks contain no unproved declarations and produce no warnings. They test reciprocal exponents and the universal quantifier over k.

A separate scratch Lean file proved ten concrete interval, endpoint, exponent and masked-period examples with no unproved declarations and no warnings. Those proofs test the elementary conventions; they do not prove the general proposed signatures.

An exact-arithmetic regression, rerun for this continuation, checked 33,966 periodic intervals with zero-mean ternary periods of lengths 1–6, 3,900 positive-divisor reindexings, 5,200 weighted Möbius identities, and 43,560 exclusion-filtered intervals for four concrete quadratic-character tables. It also checked 129 instances of χ8χ−8=χ−4, including negative arguments. Shared-prime and nonsquarefree exclusion moduli are included. These are finite checks, not general proofs.

The new conductor contracts add the following discriminating examples:

- `exclusion_shrink_eight`: At ambient M=8 and primitive conductor q=4, R=1; repeated powers of 2 are not extra excluded primes.
- `exclusion_mixed_fifteen`: At M=15 and q=5, R=3.
- `exclusion_principal_twelve`: For the principal character modulo 12, q=1 and R=6, not 12.
- `exclusion_modulus_one`: At M=q=1 the empty prime product R equals 1.
- `period_divisibility_not_equality`: For χ8χ−8, qR=4 divides ambient 8 but is not equal to it.
- `common_prime_not_coprime_moduli`: For χ3 times the primitive χ15, q=5 and R=3 divides gcd(3,15); the original conductors need not be coprime.
- `imprimitive_support_obstruction`: If the inputs are principal modulo 8 and modulo 1, then q=1 and R=2 does not divide gcd(8,1); input primitivity is necessary for the common-support conclusion.
- `mask_negative_excluded`: For R=3 and a=−3, the mask kills the nonzero primitive χ5 value −1.
- `mask_negative_kept`: For R=3 and a=−2, the mask retains the primitive χ5 value −1.
- `mask_zero_excluded`: For the principal character modulo 12, primitive η modulo 1 takes value 1 at 0 but the R=6 mask makes the ambient value 0.
- `quadratic_two_adic_cancellation`: The integer residue tables satisfy χ8(a)χ−8(a)=χ−4(a) for every integer a, including negative a and even nonunits.
- `diagonal_principal_obstruction`: The square of χ3 sums to 2 on (0,3], whereas its primitive conductor is 1; equal input characters cannot satisfy a nonprincipal conductor bound.

A new independent finite regression enumerates 188 quadratic character tables at moduli up to 60 and checks multiplicativity directly. Among primitive characters of conductors at most 40, it checks all 729 ordered pairs, including 27 diagonal principal products and 702 distinct nonprincipal products. It verifies conductor/exclusion divisibility, common support, quadraticity, 470,087 signed masked evaluations and 4,212 interval inequalities. Conductor is computed from factorization through reduction on units, not guessed from an ambient period. Distinct conjugate order-three characters modulo 7 supply a counterexample to dropping quadraticity. These finite checks do not prove the general declarations.

Seventeen new scratch Lean checks are complete, with no unproved declarations, warnings or errors: five general proofs of conductor/exclusion coprimality, reduced-period divisibility, common support, quadraticity and nonprincipality, plus all twelve new contract examples. The all-integer exclusion mask remains a proposed declaration; it is not claimed to have been implemented by these checks.

The suggested file elaborates at the pins with exactly 57 expected unproved-declaration warnings and no errors or other warnings. All 8,482 reached Mathlib sources were byte-checked; there are no Tau Ceti imports. The pinned-index packet checker reports 0 errors and 0 warnings; the four-file intake check reports 0 problems, and the source-issue envelope has 0 errors. There are thirteen lemmas and eight theorems, no new definitions/constructions, fifty exact baseline declarations, eight gaps and six partial stages. The original thirteen node objects and reviewed source-finding/version objects are unchanged.

The five planets chosen for ES.0 are Divisor-weighted character bound, Product-period character bound, Small-conductor cancellation, Primitive character and exclusion mask, and Small-conductor product cancellation. They are central mathematical results rather than implementation checks. No other layer receives a planet from this partial chain.
