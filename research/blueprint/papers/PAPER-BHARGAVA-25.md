# PAPER-BHARGAVA-25 — Polynomial Galois groups: extraction and routing

**Issue:** #1059. **Agent:** ChatGPT Pro. **Session:** `astra-20260921-f6b2d8`.
**Date:** 2026-09-21. **Delivery:** source-extraction checkpoint, **partial**.

The accompanying `paper-v1` JSON contains **107 items**: **6 library imports, 10 planned
interfaces and 91 missing additions**. Every missing item is routed exactly once, through
six routes. All 31 numbered theorem/proposition/corollary/lemma units, and Remarks 14, 15
and 23, have corresponding entries; multipart statements are separated. These are planning
records, not declarations of formalized mathematics.

## 1. Source identity and the reason for partial status

The queued article is Manjul Bhargava, *Galois groups of random integer polynomials and
van der Waerden's Conjecture*, **Annals of Mathematics 201 (2025), no. 2, 339–377**,
DOI [10.4007/annals.2025.201.2.1](https://doi.org/10.4007/annals.2025.201.2.1).
The [publisher record](https://annals.math.princeton.edu/2025/201-2/p01) gives online
publication on 12 March 2025, revision on 13 February 2024 and acceptance on 14 February 2024.

The text actually read is **[arXiv:2111.06507v3](https://arxiv.org/html/2111.06507v3)**,
dated 28 September 2024: all eight sections, their numbered statements/proofs, and the
bibliography. The 34-page [PDF](https://arxiv.org/pdf/2111.06507v3) was visually checked
where extraction could change the mathematics, including Theorems 1–2, Lemma 24,
Corollary 8, the monic Fourier corollaries and the elimination/optimization/product proofs.
The 39-page journal text was not acquired. **No claim that v3 and the journal version
coincide is made.** The later expository outline is not substituted for this research paper.

The partial status has a concrete cause: the read version contains degree qualifications
that must be restored, two problematic corollaries, and a higher-index elimination step
whose exceptional-strata proof needs expansion. A routing packet must not silently turn
these into accepted theorem signatures. The work is usable as a source inventory and
ownership proposal, but the journal-version comparison and the gates below are required
before completion. None of the observations below is described as an author-issued erratum.

## 2. Repository and library baseline

Repository mathematical inputs were pinned to
`6eb690f8bea11dfc057110a2b84009844bf1d005`. The worker and paper rules were read in
`WORKERS.md`, `PROTOCOL.md` (including section 16), `BROWSER_AGENTS.md`,
`UPSTREAM_GUIDE.md` and the expansion protocol. The paper-routing guides in
`research/blueprint/papers/papers.json` were also inspected.

Library pins are **Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`** and
**Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`**. The large coverage file was
accessible only in a truncated response; this report does **not** claim a full new read of
that file. The relevant complete accepted review, `REV-AUDIT-07.md`, was read, together
with owner documents and exact pinned declarations. That review is the statistics/sieve
batch; `REV-AUDIT-27.md` is a different batch and is not used as a statistics audit.

The direct library checks matter, because an older roadmap inventory misses some work now
present at the pin:

| Pinned file | Actual reusable statements read | Boundary |
|---|---|---|
| Mathlib `FieldTheory/PolynomialGaloisGroup.lean` | `Polynomial.Gal`, `galActionHom`, its injectivity, and `galAction_isPretransitive` | A faithful distinct-root action is not an arbitrary degree-n enumeration. |
| Mathlib `GroupTheory/GroupAction/Primitive.lean` | `MulAction.IsPreprimitive` | Translate nonempty finite-degree hypotheses. |
| Mathlib `GroupTheory/GroupAction/Jordan.lean` | `Equiv.Perm.subgroup_eq_top_of_isPreprimitive_of_isSwap_mem`; `Equiv.Perm.alternatingGroup_le_of_isPreprimitive_of_isThreeCycle_mem` | Proposition 9 and the 3-cycle part of Proposition 10 do not need new Jordan proofs. The double-transposition branch is separate. |
| Tau Ceti `Order/Northcott.lean` | `TauCeti.normLE`, `TauCeti.summatory`, `summatory_apply` and the surrounding cutoff API | Natural-valued Northcott height with real cutoff; the polynomial-height instance still has to be supplied. |
| Tau Ceti `GroupTheory/Perm/WreathProduct.lean` | `TauCeti.WreathProduct`, `PermSubgroupWreathProduct`, their cardinality formulas | General wreath carriers exist. Product-action primitivity and sharp minimal degrees are not consequences of the definition. |

No Lean executable or pinned build was available in this environment. **No Lean compilation
was performed and no Lean file is submitted.** The exact library statements were read;
this is not a new exhaustive absence audit of both libraries.

## 3. The correct upstream anchor

The first candidate was the broad arithmetic-statistics roadmap. Reading the upstream
**Galois groups of polynomials** roadmap revealed the more precise extension point:
`tauceti:TauCetiRoadmap/PolynomialGaloisGroups`.
Its relevant Layers 0–3 and the resolvent/specialization contracts were inspected. The
complete relevant scopes of the other proposed owner READMEs were also read; this report
does not claim every line of every long upstream document was reread.

The upstream polynomial roadmap already owns the intrinsic root action, the orbit/factor
bijection, blocks and intermediate fields, general wreath actions, discriminant tests,
resolvents, the product/fiber-product dictionary, and the interpretation of Frobenius
factorization. Its complete transitive-group classification stops at degree five. It does
not plan the coefficient-box density theorem or the minimal-index estimates extracted here.

Consequently both new branches are **Part II extensions of that immutable roadmap**.
Neither duplicates its foundations, modifies its statements, or introduces a second
`Polynomial.Gal`. The elementary number-field ramification and index-square formula retain
**NumberFieldArithmetic** and **LocalFieldsRamification** as their owners. In particular,
the parent polynomial specialization layer imports NumberFieldArithmetic 3.10; it is not a
second owner of the ramification proof.

## 4. Proposed routing and ownership

| Route | Items | What it owns |
|---|---:|---|
| Source addition: `ArithmeticStatistics:ST.2` | 25 | Collision fibers, splitting weights, local Fourier/CRT estimates, their Poisson application, uniform tails and the per-field polynomial multiplicity input. |
| Source addition: `ArithmeticStatistics:ST.3` | 12 | Independent discriminant-ordered field counts, the small-generator/index refinement, small-action resolvent fields and field-count multiplicities. |
| Source addition: `ClassicalArithmeticCompletion:CA.3` | 2 | General all-lifts divisibility and its first-order Taylor/derivative consequence, Proposition 34. |
| Source addition: `SchemeAndStackFoundations:SF.5` | 1 | The general finite-fiber Bézout bound used by Proposition 22, as an early degree/intersection prefix. |
| Part II: `PermutationIndexBounds` | 13 | Fixed-point-sensitive index, minimal degrees, double transpositions, elemental actions and the two-action comparison. |
| Part II: `PolynomialGaloisGroupStatistics` | 38 | Actual coefficient-box counts, reductions, discriminant-support case assembly, elimination, optimization, product counts and the qualified final consequences. |

The two Part II briefs in the JSON are substantive design instructions, not titles standing
in for missing mathematics. They name the inherited endpoint, exact new theorems, proof
constructions, owner imports, tests and source gates. Their verified areas are
`grouptheory` and `algebraicnt`, respectively, from the repository's galaxy list.

The existing **Arithmetic statistics, counting fields and Selmer distributions** roadmap
has separate family, local-count and field-count layers. Its ST.2 already covers the relevant
arithmetic uniformity direction. The accepted restructuring proposal RS-07 also distinguishes
that direction from generic geometry of numbers. Thus generic lattice/minima theory is
imported from **Geometry of numbers, quadratic forms and homogeneous arithmetic**, especially
GN.0–GN.1/GN.4 and the upstream GlobalNumberFields lattice-count interface. It is not
re-created under ST.2. Similarly, the generic additive-character/Weil inputs retain
**FiniteFieldsAndCharacterSums FF.1–FF.2**, and height/Mahler comparison retains **CA.6**.

The integer gcd Bézout identity is not the algebraic-geometric Bézout theorem used in
Proposition 22. SF.5 owns the latter general intersection direction. Its early degree-bound
export must be separated from later GRR/surface applications; the weighted-power-sum proof
does not require all of those later endpoints. No new intersection theory is hidden inside ST.2.

### Dependency direction

The intended direction is:

`upstream polynomial and local/number-field foundations` → `pure group index bounds`;

`local collision/Fourier work in ST.2` + `group bounds` → `field counts in ST.3`;

`ST.2` + `ST.3` + `group bounds` → `coefficient-box theorem and consequences`.

Neither ST.3 nor the pure group branch imports the final polynomial-density theorem as an
input to the field exponent it supplies. The geometric sieve is not merely renamed large
sieve theory. The CFSG *statement* roadmap is not a proof of CFSG and cannot discharge a
Liebeck–Saxl/Guralnick–Magaard proof dependency.

## 5. What the mathematical extraction preserves

The output is more than a list of the introduction's corollaries. It includes all of the
following proof-critical data.

**Counting objects.** Fix the degree, coefficient box, permutation action up to conjugacy,
and distinction between polynomial tuples and field isomorphism classes. Handle the
repeated-root locus before using a bijection with `Fin n`. The generic count is the existing
Northcott summatory operation. A field discriminant is not the discriminant of an arbitrary
power-basis polynomial. A regular action means transitive with trivial stabilizers, not
merely a subgroup whose order equals the ambient degree.

**Group inputs.** Define index using all cycles, including fixed points. Import the existing
transposition and 3-cycle theorems; extract the additional double-transposition statement.
Keep Theorems 12–13's exclusions and the degree-28 refinements. In the non-elemental branch,
construct both actions of the same abstract group and prove their index comparison. The
small-action field must actually be obtained from a transitive faithful action with the
same normal closure. The number of reconstructions from one resolvent field is bounded;
there is no assumed injection of field isomorphism classes.

**Local algebra.** Proposition 22 needs that *every nonempty indexed subsum* of its weights
is nonzero. Vandermonde then controls the leading homogeneous system, and the finite-fiber
Bézout bound gives the factorial. Proposition 21 uses characteristic zero or p>n, the first
n−k coefficients and the actual partition factor. Its collision index counts geometric
root multiplicities; it is not the number of irreducible factors over F_p. The semialgebraic
or finite-field dimension bounds do not imply a globally triangular elimination system.

**Fourier estimates.** Binary coefficient space has dimension n+1, the monic slice n.
Splitting weights count partial divisibility patterns rather than just exact splitting type.
Normalization includes irreducible degrees and permutations of identical labels. The
zero-frequency term is p^(−k)/Aut(σ) with an error; nonzero decay differs between binary,
monic partial-symbol and monic full-symbol cases. The full monic case needs translation
averaging and a nonconstant phase of degree <p before the Weil estimate applies. CRT
rescales dual coordinates by units, and Poisson summation needs its correct sign, a
nonnegative Schwartz majorant and a uniformly controlled rapidly decaying tail.

**Moderate and small discriminants.** The moderate-support local count is summed over
powerful discriminants. The refined logarithmic pattern bound in Section 6 is retained as
a separate obligation; a weaker H^ε estimate is not silently replaced by a specified log
power. The small-discriminant branch sums the per-field discriminant weight by partial
summation, rather than multiplying the largest discriminant's reciprocal weight by the
number of smaller fields.

**Large support.** Prove that the residue class forces p²-divisibility of every lift's
discriminant. Ordinary divisibility of one field discriminant is not enough. Proposition 34
then annihilates the first derivatives modulo p. Use an actual resultant to eliminate the
last coefficient, prove its nonvanishing, and count its exceptional zero set. Removal of
H^ε relies on an intermediate divisor or a bounded number of sufficiently large prime
factors, not on a better slogan for the divisor bound.

**Final results.** Retain both alternatives of Theorem 2 and its additive H^(n+1−k) term,
all four finite thresholds in Corollary 3, both elemental asymptotics, the cyclic-prime
case, the correct hyperelliptic degree range, and dyadic product counting. Announced
nonmonic and restricted-coefficient extensions are not reported as fully expanded proofs.

## 6. V1: the degree-two boundary is genuinely different

With the printed definition of E_n, an unrestricted all-degree theorem cannot be used.
For H sufficiently large set m=floor(sqrt(H)/2), and consider

`f_(a,b)(X) = (X+a)(X+b),  1 <= a <= m,  a <= b <= floor(H/(2a)).`

The constant coefficient is at most H/2 and the linear coefficient is at most
H/2+sqrt(H)/2<=H. Ordered by a<=b, different pairs give different polynomials. Every
polynomial is reducible. Their number is

`sum_(a=1)^m (floor(H/(2a))-a+1)`

and is at least

`(H/2)*sum_(a=1)^m 1/a - m(m+1)/2 = (H/4)*log H - O(H).`

Thus E_2(H) is at least a positive constant times H log H, contradicting O(H). This is
an explicit lower-bound construction; no claim about an author correction is needed.
The intended source program is retained with **n>=3**, while E_1=0 is separate.

A finite injectivity/coefficient-bound check produced 11, 60, 318, 1,606 and 7,803
polynomials at H=16,64,256,1024,4096. These finite numbers illustrate the family; the
harmonic-sum argument, not a fitted numerical trend, proves the obstruction.

## 7. V2: the tame calculation in Lemma 24

In the read PDF's Lemma 24 proof the tame field exponent is printed as ef, and a reduction
of the form X^e is said to have index e. Both have a missing subtraction. The consistent
calculation is

`v_p Disc(L/Q_p) = (e-1)f`, and `ind(X^e)=e-1`.

After passage to an unramified residue extension the e-fold factors may coalesce, which
only increases the reduction index. This gives the intended inequality. A monic polynomial,
or a separately justified unit-leading normalization, is needed so that reduction preserves
the degree. Separability over Q gives the finite étale algebra used in the factorwise proof.

The unramified case e=1 is a decisive test: the discriminant exponent must be zero. The
report treats the repaired local calculation as a proposed proof correction to v3 and
preserves the statement's good-prime restriction p>n. It does not replace wild ramification
by the tame formula.

## 8. V3: Corollary 6 is not supplied by the printed substitution

There are two different issues.

First, Ellenberg–Venkatesh's **Proposition 2.8** in
[math/0309153](https://arxiv.org/abs/math/0309153) gives the 3/8+ε Galois-field exponent
with **|G|>4**. The relevant original proof text was inspected; this was not a full new
proof audit of that paper. The unqualified n=2 case of B25 Corollary 6 is false: choose
monic quadratics `X²+aX+b` with a even and b congruent to 2 modulo 4. There are order H²
such coefficient pairs and Eisenstein at 2 gives irreducibility, so their group is the
regular S_2. The claimed exponent is less than two.

Second, even after excluding those small degrees, the printed deduction drops a term.
At **n=8**, for any regular action the smallest prime divisor is two and k=4. Using the
advertised limiting a=3/8 and u=0, the two Theorem 2 alternatives are

`H^5 + H^(10/3)*(log H)^c`, and `H^(25/4)*(log H)^7`.

Their minimum still has an H^5 contribution. It does not imply the advertised
`H^(24/11+1.164)`, whose exponent is `9201/2750`, approximately 3.3458. Taking a positive
ε only worsens the substituted exponents. This is an exact rational computation.

**This does not disprove the regular-group estimate in every larger degree.** It identifies
a missing argument in its stated derivation. The item remains quarantined until the journal
version or an additional source proof provides the corrected range and the extra estimate.
The next worker must not remove H^(n+1−k) just because the other exponent is smaller.

## 9. V4: the S_9 factor in Corollary 8

The source's isolated M_11 exponent has a useful positive margin. At n=11,k=4,u=1/110 and
limiting a=5/2, its optimized exponent is exactly

`11 - 10*(3/4)/(5/2+3/4-1/110) = 6193/713 = 8.685834502... < 8.686.`

Theorem 20 supplies a=5/2+ε, not a=5/2. Choose ε sufficiently small and absorb the log
factor using the remaining positive margin. This is how to justify the rounded exponent.

The extension to **every** G<=S_k for k<=9 has a separate obstruction. Given a fixed
monic integral polynomial g realizing the natural M_11 action, vary monic degree-nine
polynomials h with group S_9 and coefficient height at most H/C_g. The valid n=9 main
theorem gives order H^9 such h. The two normal closures have no nontrivial common quotient:
M_11 is simple, and its order is divisible by 11 whereas |S_9| is not. Thus they are
linearly disjoint and the product polynomial has group S_9×M_11. Multiplication by g is
injective and its coefficient height is at most H after a fixed rescaling.

This yields an H^9 lower bound, incompatible with H^8.686. The logical fixed-factor
argument is explicit, but **an M_11 realization and its group certificate are not supplied
in this checkpoint**; the corresponding original source is an acquisition item. The
statement is therefore flagged as incompatible with such a realization, rather than claiming
that a new certified M_11 polynomial was constructed here.

Candidate corrected ranges are k<=8 for arbitrary G, or k=9 with G!=S_9, because those
factor counts have exponent at most eight. The broad all-G k<=9 conclusion would need an
H^9 term. These candidates still need action, epsilon and product-height verification.

## 10. V5: Theorem 2's denominator, transitivity and summation

Write

`A = a(G) + 1 - 1/k - u`.

The HTML's nested denominator is misleading; Section 6's optimization and the PDF fix this
formula. Record A and its positivity before any power of H is formed. The field count
F_n(G,X) concerns **transitive** actions. For an intransitive G it is zero, so any positive
a would satisfy a vacuous field bound, which cannot justify the proposed polynomial count.
The polynomial-count theorem is routed in its transitive setting, and the intransitive
case is routed through Theorem 7 instead.

The small-discriminant sum needs another explicit condition. If F(X)=O(X^a), partial
summation gives the useful Y^(a−u) bound for the sum of D^(−u) only when a>u. At a=u a
logarithm can appear, and at a<u the appropriate bound is bounded rather than a negative
power of Y. In particular, for D<=Y one has D^(−u)>=Y^(−u), not the upper bound that a
naive multiplication would require. The JSON carries all three cases.

The higher-index optimization uses the refined moderate-support logarithmic exponent,
then checks whether the balancing Y lies below the global O(H^(2n−2)) discriminant bound.
The second alternative is not a license to use an exponent from the wrong degree range.

## 11. V6: the product-count proof must use cumulative estimates correctly

There are three independent repairs to the exposition in Section 8.

The positive height is h_plus=max(1,h), since h(X^n)=0 but Mahler measure is one. The orbit
groups are quotient images of the full group, not necessarily subgroups of it. Finally,
a cumulative estimate `A(T)=O(T^alpha*(log T)^beta)` cannot be differentiated into a
one-step shell estimate `A(T)-A(T-1)=O(T^(alpha-1)*(log T)^beta)`.

For a concrete negative control put mass 2^j at each integer 2^j and zero elsewhere.
The cumulative mass at T is at most 2T, but its jumps are unbounded, not O(1).

A dyadic proof avoids this problem. Group each factor height in [2^j,2^(j+1)). Product
height bounds constrain the sum of the j's. After factoring out the largest power H^alpha,
the bins with smaller exponents form geometrically decaying sums. The tied maximal
exponents yield the log power

`sum_(alpha_i=alpha)(1+beta_i)-1`.

The extraction states alpha_i>0 and beta_i>=0 for this clean usable version. Zero-exponent
or unusual logarithmic bounds need a separate endpoint argument. A specified subdirect
product is bounded by the count of all factor tuples; there is no automatic equality with
the direct-product Galois group. The actual fiber-product/linear-disjointness theorem is
already owned by the upstream polynomial roadmap.

## 12. V7–V8: elimination and announced extensions

For the first elimination, set `P=Disc_X(f)` and use the actual integral polynomial
`R=Res_(a_n)(P,partial_(a_n)P)`. A resultant differs from the discriminant of P by a leading
coefficient and sign. The coefficient leading terms and exceptional primes have to be
accounted for before passing to the claimed divisibility. The family X^n−X+t supplies a
nonzero specialization in characteristic zero. The zero locus of a fixed nonzero polynomial
has a coefficient-box bound proved by induction, including its leading-coefficient failures.

For the higher-index step, the dimension n−k of a collision locus does not establish that
arbitrarily chosen successive resultants are nonzero or that every coordinate projection has
finite fibers. The next proof expansion must construct the actual triangular systems on
strata where leading coefficients do not vanish, control the other strata, and obtain
uniform prefix-fiber bounds. This is a precisely located remaining construction, not a
claim that Theorem 2 is false.

Likewise the nonmonic and fixed-coefficient remarks in the introduction have not been
upgraded to a universal family theorem. The nonmonic route must specify degree, content,
leading coefficient and primitive-form reduction. A fixed-coefficient statement must name
the coordinates and allowed values: fixing the constant term to zero, for example, destroys
the generic full-group family. These expansions remain separate from the proved monic
three-case program.

## 13. Source closure still to acquire

The JSON prerequisite list separates the two Lemke Oliver–Thorne papers: **1910.02122**
is the polynomial-per-field input; **2005.14110** is the field-count exponent. Other
load-bearing suppliers are Schmidt, the quartic/quintic field-density papers, the abelian
counting theorems of Maki/Wright, Chela and Widmer, the group minimal-degree sources,
Zarhin, the geometric sieve, Weil and Schwartz Poisson summation. Bibliography links are
explicitly discovery pointers where a full original text was not acquired; they are not
claims that each cited proof was read.

The refined numerical crossover, the full CFSG-dependent proof chain, the precise
Bézout locator and the M_11 realization remain source tasks. Historical improvements to
van der Waerden's estimate are contextual comparisons, not extra prerequisites imposed on
the new endpoint. Malle's conjecture is not assumed: a valid field exponent is a quantified
input with independent proved examples.

## 14. Validation and integration

An independent local `paper-v1` check passed on the **inspected** roadmap/stage inventory.
It checked item IDs, required statements/locators, statuses, library-prefix format, planned
stage IDs, source-route ownership, Part II parents/titles/areas, brief lengths, source-gate
references and exact-once routing of all 91 missing items. It also checked all 31 numbered
source units against item locators. This is not a whole-atlas or Lean proof check.

Mathematical regressions checked the explicit quadratic family for five cutoffs, the dyadic
jump example, exact rational regular-degree-eight substitution, the exact M_11 exponent,
the e=1 tame boundary, and the difference between ordinary and all-lifts p²-divisibility.
For p=3,5,7,11 an exhaustive finite Fourier calculation of the monic double-root quadratic
weight gave zero coefficient 1/p and nonzero maximum p^(−3/2), checking the normalization
and square-root decay in a small example. Floating-point Fourier arithmetic is a regression,
not a proof of the general Weil estimate or a formal certificate.

The repository's official `scripts/check_paper.py` and deliverable-path validation are to
run in the PR submission workflow. Only the issue's JSON/report and the allowed handoff
are submitted. No owner document, atlas, library, other issue's result, label or review
verdict is changed. A checkpoint merge is not independent mathematical acceptance, nor
permission to mark the unresolved source assertions proved.

## Summary for the orchestrator

Keep the existing polynomial-Galois roadmap unchanged. Add two Part II design candidates:
pure permutation indices, and quantitative polynomial Galois theory. Route local arithmetic
counting to ST.2, independent field estimates to ST.3, general derivative congruences to
CA.3 and the finite-fiber Bézout bound to SF.5's early intersection prefix. The 107-item
inventory imports six verified library packages and ten planned interfaces; all 91 additions
have one route. The main coefficient-box endpoint has n>=3. Before completing this paper
job, compare with the journal version, resolve the regular-group and M_11 product corollaries,
and expand higher-index exceptional-strata elimination. Preserve the explicit low-degree,
normalization, summation and product-count corrections. No Lean compilation or formalization
is claimed.

