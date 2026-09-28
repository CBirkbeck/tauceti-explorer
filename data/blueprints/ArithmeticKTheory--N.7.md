# K-theory of number fields and S-integers — regular primes, Bernoulli numbers and certified examples

Blueprint for the roadmap `ArithmeticKTheory`, stages **N.7** and **N.8**, job `BP-ArithmeticKTheory--N.7`
(issue #678). Packet: `research/blueprint/packets/ArithmeticKTheory--N.7.json`. Suggested Lean file:
`research/blueprint/suggested/ArithmeticKTheory--N.7.lean`. Handoff:
`research/blueprint/handoff/BP-ArithmeticKTheory--N.7.md`.

**Both layers in scope are `source_decomposed`.** 15 nodes (3 definitions, 1 constructions, 4
theorems, 2 comparisons, 5 applications), 23 API items, 16 unit tests, 6 planets; 21 pinned
declarations cited, 4 gaps, 8 requests, 2 structural proposals. No layer is `closed`: closure
means Lean, and nothing here is formalised.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## The source

- **`Kbook.2013`** — Charles A. Weibel, *The K-book: An Introduction to Algebraic K-theory*. Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013)
  <https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf>, read 2026-09-24. SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.

One source, freely available, and **the same file three other packets of this programme already
cite**: the hash reproduces the one recorded by `K2SymbolsBrauer--T.3.json`,
`Polylogarithms.json` and `MotivesAndAlgebraicCycles.json`. What was read for this job is
listed in the packet; in outline, III.5.2.2 and III.6.1–III.6.5.3 for the second K-groups and
the symbols, VI.2.4–VI.2.4.1 for the Bernoulli numbers and the regular primes, VI.5.3 for the
third K-group of a number field, VI.8.1–VI.8.6 for the classical data and Birch–Tate, and
VI.10.1–VI.10.8.2 for the tables, the regular-prime torsion and Vandiver.

## What the pinned libraries have, and what they do not

The reviewed audit **AUDIT-27** records both layers as *not built*. What it finds, and the
pinned index confirms: the Bernoulli numbers are there in **both** conventions — `bernoulli`
with `B₁ = −1/2`, which is this roadmap's arithmetic convention, and `bernoulli'` with `+1/2` —
together with the lemma relating them, von Staudt–Clausen and the p-adic valuation; cyclotomic
extensions, rings of integers, class numbers, the class group, ramification index and inertia
degree, the unit rank, the real and complex places and the Dedekind zeta function are all
pinned; and Mathlib proves that `p` has a **unique** prime above it in the `p`-th cyclotomic
field, with ramification index `p − 1` and inertia degree `1`, which is exactly the input N.7
needs for its S-integer question.

What is absent: **the word regular**. A grep for *regular prime* over both trees returns
nothing, and so does a grep for *Vandiver*. There is no Herbrand–Ribet, no Kummer criterion, no
tame kernel, and no K-group above the zeroth in either library. So the definition of a regular
prime — a composition of pinned objects — is one of the cheapest genuinely new definitions in
this area, and a structural proposal records it as an early library target.

**The three duplications.** AUDIT-27 records that `SpecialValuesBirchTate:B.3` asks for the
same base examples as its independent test of Birch–Tate; that `K2SymbolsBrauer:T.5` proves
`K₂(ℤ) = ℤ/2`, `K₂(𝔽_q) = 0` and the infinitude of `K₂(ℚ)`, and asks for a verified
presentation *in this roadmap*; and that `K3BlochGroups:V.5` proves `K₃(ℤ) = ℤ/48` and carries
`K₃(ℚ(i)) ≅ ℤ ⊕ ℤ/24` as a test. Every one of those computations is **imported here with its
owner named** and none is re-planned (PROTOCOL §15). What is left to N.8 is the *format* of a
certified example, the labelling rule and the consistency checks — and a structural proposal
asks that its stage text say so.

---

## N.7 — Regular primes and Bernoulli numbers

**Coverage: source_decomposed.** 8 nodes.

Eight nodes. The arithmetic Bernoulli convention with the conversion from the other numbering,
which Mathlib pins on both sides; the invariant w_i with its value over the rationals in both
parities, which is where the Bernoulli numbers enter K-theory; regular and irregular primes
with Iwasawa's equivalent form and the data the source gives; Kummer's criterion converting the
class-number condition into a finite check on numerators; the eigenspace decomposition of the
cyclotomic class group with the denominator restriction the layer's text demands and the
Herbrand-Ribet theorem; the vanishing of the l-primary tame kernel at an odd regular prime,
with the three inputs the stage text names and with the S-integer question answered by the
ramification data, the unique prime above l having residue field the prime field whose unit
group has order prime to l; the torsion consequences at a regular prime with their explicit
degrees and generator counts; and Vandiver's conjecture kept strictly separate, with the
unconditional statement about the groups in degrees divisible by four recorded alongside the
conditional table. The reviewed audit AUDIT-27 records the whole layer as not built and the
pinned index confirms it: neither library defines a regular prime, and neither mentions
Vandiver.

**Planets (5):** *The arithmetic Bernoulli convention*, *The invariant w_i(F)*, *Regular prime*, *Kummer's criterion*, *Regular primes and the tame kernel*.

### `bernoulli-conventions` — The two Bernoulli conventions, and the conversion between them ★

*definition* · planet **The arithmetic Bernoulli convention**

Fix the ARITHMETIC convention: the Bernoulli numbers are defined by the generating series
t/(e^t - 1), so that B_1 = -1/2. Mathlib's bernoulli is this convention and its bernoulli' is
the other one, with B_1 = +1/2, the two agreeing in every index other than one, which is the
content of the pinned lemma relating them. Every statement of this layer names the convention
it uses, and the conversion is stated once and used by name. Record also the classical facts
about the denominator: it is squarefree, divisible by six, and equal to the product of the
primes p with p - 1 dividing 2k; and if p - 1 does not divide 2k then p does not divide the
denominator of B_k/k even when p divides k.

**Hypotheses.**

- k is a natural number; the numbers are rational.
- Both conventions are pinned in Mathlib, together with the lemma that they agree away from
  index one; this layer imports them and defines nothing new.
- The statement about the denominator is von Staudt-Clausen with the refinement the source
  records; the numerator has no such description, which is what makes the regular-prime story
  non-trivial.

**Construction and proof.**

1. Import the two pinned definitions and the conversion lemma, and fix the arithmetic
   convention as this roadmap's default.
1. State the denominator facts as the source gives them, and record where each is proved in the
   pinned library.
1. Record the refinement: for p - 1 not dividing 2k, the prime p does not divide the
   denominator of B_k/k even if it divides k, the example being 5 dividing B_5.
1. Record that no statement of this roadmap may use a Bernoulli number without naming the
   convention, since the two differ exactly at the index the regular-prime criterion never uses
   but the topologists' formulas do.

**API.**

| name | role | statement |
| --- | --- | --- |
| `bernoulliArith` | data | The arithmetic Bernoulli numbers, which are Mathlib's bernoulli. |
| `bernoulliTop` | data | The other convention, which is Mathlib's bernoulli'. |
| `bernoulli_convert` | characterisation | The two agree away from index one, and differ in sign there. |
| `bernoulli_one_arith` | simp | B_1 is minus one half in the arithmetic convention. |
| `bernoulli_denominator` | characterisation | The denominator is the product of the primes p with p - 1 dividing 2k. |
| `bernoulli_denominator_squarefree` | characterisation | The denominator is squarefree and divisible by six. |

**Used by.** *N.7, the invariant w*: The invariant is the denominator of B_k/4k, so the convention must be fixed before it is defined. *N.7, Kummer's criterion*: The criterion is about the numerators, and the numerator is convention-independent away from index one. *The Handbook comparison*: Parts of the K-theory literature use the other numbering, and a translated statement must say which one it is in.

**Unit tests.**

- `b_one` — B_1 is minus one half here and plus one half in the other convention.
- `b_six_denominator` — The denominator of B_6 is 2730 = 2 . 3 . 5 . 7 . 13.
- `agree_away_from_one` — For every index other than one the two conventions agree.
- `five_divides_b_five` — Five divides B_5 but does not divide the numerator of B_5/5, which is
  the source’s example.

**Acceptance.**

- B_1 is minus one half in the arithmetic convention and plus one half in the other, and the
  two agree elsewhere.
- The denominator of B_6 is 2730, which is the product of the primes p with p - 1 dividing 12,
  namely 2, 3, 5, 7 and 13.
- The numerator has no analogous description, and a formalisation that treats it as computable
  by a closed formula is wrong.

**Depends on.** **libraries** `mathlib:bernoulli`, `mathlib:bernoulli'`, `mathlib:bernoulli_eq_bernoulli'_of_ne_one`, `mathlib:bernoulli_one`, `mathlib:bernoulli'_one`, `mathlib:Polynomial.bernoulli`.

**Source.** Kbook.2013, VI.2.4, before the lemma (PDF p. 465): “B_1 = -1/2, B_2 = 1/6, B_4 =
-1/30 ... The denominator of B_k is always squarefree, divisible by 6, and equal to the product
of all primes with (p-1) | 2k. Moreover, if (p-1) does not divide 2k then p is not in the
denominator of B_k/k even if p | k.” — The convention and the denominator facts, verbatim.

**Source.** Kbook.2013, VI.2.4.1 (PDF p. 466): “By Kummer's congruences, p does not divide the
numerator of any B_k/k (but 5 divides B_5). Thus only irregular primes can divide the numerator
of B_k/k.” — The refinement with its example, verbatim.

### `w-invariant` — The invariant w_i(F), and its value over the rationals ★

*construction* · planet **The invariant w_i(F)**

For a number field F and a positive integer i, the invariant w_i(F) is the largest integer m
such that the absolute Galois group acts trivially on the i-th Tate twist of the m-th roots of
unity; equivalently, the order of the group of roots of unity in the fixed field of that
action. Over the rationals it is 2 for odd i, and for i = 2k it is the DENOMINATOR of B_k/4k; a
prime divides w_i(Q) exactly when it is one more than a divisor of i. The invariant is what the
torsion of the odd K-groups of a ring of integers is measured by, so it is the arithmetic half
of the connection between Bernoulli numbers and K-theory that this layer exists to make
precise.

**Hypotheses.**

- F is a number field; i is a positive integer; the Bernoulli numbers are in the arithmetic
  convention of the previous node.
- The twisted module of roots of unity is the one K2SymbolsBrauer T.7 constructs; neither
  pinned library has it, and this layer imports it rather than building a second one.
- The statement over the rationals is a theorem about the denominator, not a definition.

**Construction and proof.**

1. Define the invariant by the largest-m characterisation and prove that the maximum exists,
   using that the Galois action on the roots of unity of order m factors through a finite
   quotient.
1. Prove the elementary properties: the invariant is even, it is divisible by the order of the
   roots of unity in F, and it is multiplicative in the evident sense under a field extension
   only up to the stated index.
1. Prove the value 2 for odd i over the rationals, which is the source's earlier computation.
1. Prove the value for even i over the rationals: the invariant is the denominator of B_k/4k,
   and a prime divides it exactly when one less than the prime divides i.
1. Record the two places where the invariant is used: the order of the torsion of the odd
   K-groups, and the Birch-Tate formula of N.8.

**API.**

| name | role | statement |
| --- | --- | --- |
| `wInvariant` | data | The invariant w_i(F). |
| `wInvariant_even` | characterisation | The invariant is even. |
| `wInvariant_odd_rat` | example | Over the rationals it is two for odd i. |
| `wInvariant_even_rat` | characterisation | Over the rationals at i = 2k it is the denominator of B_k/4k. |
| `wInvariant_prime_divides` | characterisation | A prime divides it exactly when one less than the prime divides i. |
| `wInvariant_two_rat` | example | Its value at i = 2 over the rationals is 24. |

**Used by.** *N.8, the Birch-Tate example*: The formula is the quotient of the order of the tame kernel by this invariant, so the worked example needs its value. *N.7, the torsion consequences*: The Harris-Segal torsion of the odd K-groups has order this invariant. *K3BlochGroups V.5*: The third K-group of a number field has a cyclic summand of order this invariant at i = 2, which is the computation that packet carries.

**Unit tests.**

- `w_two_rat` — The invariant at i = 2 over the rationals is 24.
- `w_odd` — For odd i over the rationals the invariant is 2.
- `w_gaussian` — For the Gaussian rationals the invariant at i = 2 is 24.
- `prime_divisibility` — The prime 7 divides the invariant at i = 6 over the rationals, since 6
  is divisible by 6.

**Acceptance.**

- Over the rationals the invariant at i = 2 is 24, which is the denominator of B_1/8 in the
  arithmetic convention and is the number that appears in the Birch-Tate formula.
- For odd i over the rationals the invariant is 2, so the odd twists contribute only two-
  torsion.
- For the Gaussian rationals the invariant at i = 2 is again 24, which is what makes the third
  K-group of that field have a cyclic summand of order 24.

**Depends on.** **inside this packet** `bernoulli-conventions`; **other roadmaps** `K2SymbolsBrauer:T.7`; **libraries** `mathlib:rootsOfUnity`, `mathlib:IsPrimitiveRoot`, `mathlib:NumberField`.

**Source.** Kbook.2013, VI.2.4 (PDF p. 465): “Lemma 2.4. If i = 2k is even then w_i(Q) is the
denominator of B_k/4k. The prime l divides w_i(Q) exactly when (l-1) divides i.” — The value
over the rationals, verbatim.

**Source.** Kbook.2013, VI.2.1.2, quoted at VI.2.4 (PDF p. 465): “Recall from 2.1.2 that w_i(Q)
= 2 when i is odd.” — The odd case, verbatim.

### `regular-prime` — Regular and irregular primes ★

*definition* · planet **Regular prime**

A prime p is IRREGULAR when it divides the class number of the p-th cyclotomic field, that is
the order of the Picard group of the ring of integers of the field obtained by adjoining a
primitive p-th root of unity; otherwise p is REGULAR. Iwasawa's equivalent form: p is regular
exactly when that Picard group has no p-power torsion at all. The smallest irregular primes are
37, 59, 67, 101, 103, 131 and 149, and Siegel conjectured that asymptotically about 39 per cent
of primes are irregular, a proportion the numerical evidence up to four million matches. The
definition is about the class number and nothing else: no statement of this roadmap may fold
Vandiver's conjecture, or any other class-group hypothesis, into the word regular.

**Hypotheses.**

- p is a prime; the cyclotomic field is the one obtained by adjoining a primitive p-th root of
  unity, and the Picard group is that of its ring of integers.
- Mathlib has the cyclotomic extension, the ring of integers and the class number, so the
  definition is a composition of pinned objects; what it does not have is the word, which
  neither library defines.
- Iwasawa's equivalent form is quoted from the source and is not proved here.

**Construction and proof.**

1. Define irregularity as divisibility of the class number of the cyclotomic field by the
   prime, using the pinned class number.
1. Define regularity as its negation and record that it is decidable for a given prime once the
   class number is computed.
1. Record Iwasawa's equivalent form, that regularity is the absence of p-power torsion in the
   Picard group, as a quoted statement.
1. Record the list of the smallest irregular primes and the statistical expectation, both as
   data with the source named.
1. State the discipline the layer's text demands: regularity is this property and nothing more,
   and any theorem that needs Vandiver's conjecture or another class-group hypothesis states it
   separately.

**API.**

| name | role | statement |
| --- | --- | --- |
| `IsRegularPrime` | data | The predicate on a prime. |
| `IsRegularPrime.iff_not_dvd_classNumber` | characterisation | The definition: the prime does not divide the class number of the cyclotomic field. |
| `IsRegularPrime.iwasawa` | characterisation | Iwasawa’s form: no p-power torsion in the Picard group. |
| `IsRegularPrime.decidable` | instance | Decidability for a given prime, once the class number is known. |
| `not_isRegularPrime_37` | example | The prime 37 is irregular. |
| `isRegularPrime_of_lt_37` | example | Every prime below 37 is regular. |

**Used by.** *N.7, Kummer's criterion*: The criterion is an equivalent condition on Bernoulli numerators for exactly this predicate. *N.7, the tame kernel theorem*: The vanishing theorem is stated for an odd regular prime. *N.8*: The certified examples are stated for explicit primes, and regularity is checked there.

**Unit tests.**

- `thirty_seven_irregular` — The prime 37 is irregular, so the predicate fails there.
- `small_primes_regular` — Every prime below 37 is regular.
- `not_vandiver` — The predicate is about the full cyclotomic class number, not about the real
  subfield; a definition that used the real subfield would be Vandiver’s condition and is a
  different predicate.
- `decidable_instance` — For a given prime the predicate is decidable once the class number is
  computed.

**Acceptance.**

- The first irregular prime is 37, so every prime below it is regular; this is the smallest
  instance of the definition.
- Regularity is not the same as the absence of torsion in the class group of the real subfield,
  which is Vandiver's conjecture and is a separate statement.
- The definition is decidable for a given prime, which is what makes the certified examples of
  N.8 possible.

**Depends on.** **inside this packet** `bernoulli-conventions`; **libraries** `mathlib:NumberField.classNumber`, `mathlib:IsCyclotomicExtension`, `mathlib:ClassGroup`, `mathlib:NumberField.RingOfIntegers`, `mathlib:Nat.Prime`.

**Source.** Kbook.2013, VI.2.4.1 (PDF p. 466): “A prime p is called irregular if p divides the
order h_p of Pic(Z[zeta_p]); if p is not irregular it is called regular. Iwasawa proved that a
prime p is regular if and only if Pic(Z[zeta_p]) has no p^nu-torsion for all nu. The smallest
irregular primes are 37, 59, 67, 101, 103, 131 and 149. Siegel conjectured that asymptotically
about 39% of all primes are irregular; about 39% of the ...” — The definition, the equivalent
form and the data, verbatim.

### `kummer-criterion` — Kummer's criterion, and what the numerators can be ★

*theorem* · planet **Kummer's criterion**

A prime p is irregular exactly when it divides the numerator of one of the Bernoulli numbers
B_k with k at most (p-3)/2. Consequently only irregular primes divide the numerator of any
B_k/k, by Kummer's congruences. The criterion converts a class-number condition into a finite
arithmetic check, which is what makes the regularity of a given prime decidable in practice and
what ties this layer's two halves together.

**Hypotheses.**

- p is an odd prime; the Bernoulli numbers are in the arithmetic convention, where the
  criterion is insensitive to the convention because it concerns even indices only.
- The source states the criterion and attributes it to Kummer, referring to Washington's book
  for the proof; that book was not obtained and the criterion is not proved here.
- The bound on k is (p-3)/2 and is part of the statement, since it is what makes the check
  finite.

**Construction and proof.**

1. State the criterion with its bound.
1. Record the direction that is used in practice: to certify that a prime is regular it
   suffices to check that it divides no numerator in the finite range.
1. Record the consequence through Kummer's congruences: a prime divides the numerator of B_k/k
   only if it is irregular, and the example 5 dividing B_5 but not the numerator of B_5/5.
1. Record the status: the criterion is quoted from the source, which cites Washington for the
   proof, and this packet does the same and records the gap.
1. Record the historical use the source records, Kummer's proof of the first case of Fermat's
   Last Theorem for regular exponents, as context and not as a target of this roadmap.

**Acceptance.**

- For p = 37 the criterion is satisfied at k = 16, which is why 37 is the first irregular
  prime; the source records the same fact from the K-theoretic side.
- For a prime below 37 the finite check finds no numerator divisibility, which certifies
  regularity.
- The criterion is an equivalence, so it may be used in both directions, but the proof is
  imported in both.

**Depends on.** **inside this packet** `regular-prime`, `bernoulli-conventions`.

**Source.** Kbook.2013, VI.2.4.1 (PDF p. 466): “Kummer proved that p is irregular if and only
if p divides the numerator of one of the Bernoulli numbers B_k, k at most (p-3)/2 (see
Washington). By Kummer's congruences, p does not divide the numerator of any B_k/k (but 5
divides B_5). Thus only irregular primes can divide the numerator of B_k/k.” — The criterion
and its consequence, verbatim, with the source’s own reference for the proof.

**Source.** Kbook.2013, VI.2.4.1, the historical remark (PDF p. 466): “The historical interest
in regular primes is Kummer's 1847 proof of Fermat's Last Theorem (case I) for regular primes:
x^p + y^p = z^p has no solution in which p does not divide xyz. For us, certain calculations of
K-groups become easier at regular primes.” — The context, verbatim; the second sentence is what
this layer is about.

### `eigenspaces-and-herbrand-ribet` — Character eigenspaces of the cyclotomic class group, and the Herbrand-Ribet theorem

*theorem*

Let l be an odd prime, G the Galois group of the l-th cyclotomic field over the rationals,
which is cyclic of order l-1, and P the Picard group of the ring of integers with the prime
inverted, modulo l. Since l-1 is invertible modulo l, the group algebra of G over the field
with l elements splits into the eigenspaces of the powers of the cyclotomic character, and P
decomposes accordingly. The Herbrand-Ribet theorem identifies the eigenspaces that can be non-
zero: l divides B_k exactly when the eigenspace of index l-2k is non-zero. Among irregular
primes below four thousand this happens for at most three values of k. The projectors are the
usual idempotents of the group algebra, and their denominators are exactly the factor l-1,
which is invertible; a statement that uses them must say so, since over the integers they do
not exist.

**Hypotheses.**

- l is an odd prime; the base field is the l-th cyclotomic field; the coefficients are the
  field with l elements.
- The projectors require the inverse of l-1 and therefore do not exist integrally; every
  statement using them carries that restriction, which is the denominator restriction the
  layer's text demands.
- The Herbrand-Ribet theorem is quoted from the source, which cites the original papers; it is
  not proved here.

**Construction and proof.**

1. Construct the idempotents of the group algebra attached to the powers of the cyclotomic
   character, and record the denominator l-1 and its invertibility modulo l.
1. Decompose the modulo-l Picard group into eigenspaces and prove that the decomposition is
   natural in the module.
1. State the Herbrand-Ribet theorem in the form the source gives: divisibility of B_k by l is
   equivalent to non-vanishing of the eigenspace of index l-2k.
1. Record the numerical statement: among irregular primes below four thousand at most three
   values of k occur.
1. Record how the eigenspace decomposition connects to the definition of regularity: the prime
   is regular exactly when every eigenspace vanishes, which is the class-number condition.

**Acceptance.**

- For a regular prime every eigenspace vanishes, which is the class-number condition of the
  definition.
- For l = 37 exactly one eigenspace is non-zero, at the index attached to k = 16, which the
  source records.
- The projectors are not available over the integers, so an integral statement that used them
  would be wrong; the restriction is part of the statement.

**Depends on.** **inside this packet** `regular-prime`, `kummer-criterion`; **libraries** `mathlib:ZMod`, `mathlib:IsCyclotomicExtension`, `mathlib:ClassGroup`.

**Source.** Kbook.2013, VI.10.8.1 (PDF p. 533): “Remark 10.8.1. The Herbrand-Ribet theorem
[states that] l divides B_k if and only if (Pic R/l)^{(l-2k)} is not zero. Among irregular
primes below 4000, this happens for at most 3 values of k. For example, 37 divides c_16.” — The
theorem and the numerical remark, verbatim.

**Source.** Kbook.2013, VI.10.4.1 and the surrounding discussion (PDF p. 529): “If i is even,
Z/l occurs only when i is congruent to 0 modulo l-1, corresponding to the i-th twist of the
roots of unity. If i is odd, exactly one term is Z/l; the invariants are Z/l on an explicit
generator, where i is congruent to 1 + 2j modulo l-1.” — The shape of the eigenspace
bookkeeping the source uses, verbatim; the indices are what the theorem is stated with.

### `tame-kernel-vanishing-at-a-regular-prime` — For an odd regular prime the l-primary tame kernel of the cyclotomic field vanishes ★

*theorem* · planet **Regular primes and the tame kernel**

Let l be an odd regular prime and F the l-th cyclotomic field. Then the l-primary part of the
tame kernel of F, that is of the second K-group of its ring of integers, vanishes. The proof
combines three inputs: Tate's comparison, which identifies the second K-group modulo l with a
Galois cohomology group; the class-group input, which is that the Picard group of the ring of
integers has no l-torsion, by definition of regularity; and the local Brauer calculation, which
is the exact sequence computing the Brauer group of a ring of S-integers from the real places
and the finite places in S. Moreover, inverting the unique prime above l introduces no
l-primary residue-field-unit term: that prime is totally ramified with inertia degree one, so
its residue field is the field with l elements, whose unit group has order l-1, which is prime
to l.

**Hypotheses.**

- l is an odd regular prime; F is the l-th cyclotomic field; S is either empty or the singleton
  of the unique prime above l.
- Tate's comparison is imported from MotivicEtaleKTheory M.3 and the tame kernel and its exact
  sequence from K2SymbolsBrauer T.5; neither is reproved here.
- The ramification statement, that l has a unique prime above it with ramification index l-1
  and inertia degree one, is pinned in Mathlib and is cited.

**Construction and proof.**

1. State the tame-kernel sequence for F, importing it from K2SymbolsBrauer T.5, and localise it
   at l.
1. Apply Tate's comparison to identify the l-primary part of the second K-group modulo l with
   the Galois cohomology of the twice-twisted roots of unity.
1. Use regularity: the Picard group has no l-torsion, so the class-group contribution to that
   cohomology vanishes.
1. Use the local Brauer calculation of the source's Classical Data to control the remaining
   contribution from the finite places.
1. Conclude the vanishing of the l-primary part.
1. For the S-integer version, compute the residue field at the unique prime above l: the prime
   is totally ramified with inertia degree one, so the residue field is the field with l
   elements and its unit group has order l-1, which is prime to l, so the residue term
   contributes nothing l-primary; this is the question the layer's text asks to be explained
   and it is answered by the ramification data, not by a K-theoretic argument.

**Acceptance.**

- For l = 5 the statement says that the tame kernel of the fifth cyclotomic field has no
  5-torsion.
- The residue-field remark is an elementary computation with the ramification data and does not
  need any K-theory; a proof that invoked a K-theoretic vanishing instead would be circular.
- For an irregular prime the argument breaks at the class-group step, which is exactly where
  the eigenspace analysis of the previous node takes over.

**Depends on.** **inside this packet** `regular-prime`, `eigenspaces-and-herbrand-ribet`; **other roadmaps** `K2SymbolsBrauer:T.5`, `K2SymbolsBrauer:T.7`, `MotivicEtaleKTheory:M.3`; **libraries** `mathlib:Ideal.ramificationIdx`, `mathlib:Ideal.inertiaDeg`, `mathlib:IsCyclotomicExtension`.

**Source.** Kbook.2013, VI.8.1, Classical Data, the Brauer sequence (PDF p. 507): “The Brauer
group of O_S is determined by the sequence 0 -> Br(O_S) -> (Z/2)^{r_1} + the sum over the
finite v in S of Q/Z -> Q/Z -> 0.” — The local Brauer calculation the argument uses, verbatim.

**Source.** Kbook.2013, VI.10.5 (PDF p. 530): “Proposition 10.5. When l is an odd regular
prime, the group K_{2i}(Z) has no l-torsion. Thus the only l-torsion subgroups of K_*(Z) are
the Harris-Segal subgroups Z/w_i(Q) of K_{2i-1}(Z) when i is congruent to 0 modulo l-1.” — The
analogous statement over the integers, which is the shape of the conclusion and is proved by
the same three inputs.

### `regular-prime-torsion-consequences` — Torsion in the K-groups at an odd regular prime

*theorem*

Let l be an odd regular prime. Then the even K-groups of the integers have no l-torsion, and
the only l-torsion in the K-groups of the integers is the Harris-Segal summand of order the
invariant w_i, sitting in the odd group K_{2i-1} when i is divisible by l-1. With finite
coefficients the statement is cleaner still: the mod-l K-theory of the integers with l inverted
is a free graded module over the polynomial ring on the Bott element in degree 2l-2, with
(l+3)/2 generators, namely the unit in degree zero, a class in degree 2l-3 and classes in the
degrees 4k+1 for k from zero to (l-3)/2. The degrees and the character indices are part of the
statement and may not be compressed.

**Hypotheses.**

- l is an odd regular prime; the ring is the integers, or the integers with l inverted for the
  statement with finite coefficients.
- The identification of the torsion as Harris-Segal summands is imported from the earlier parts
  of this roadmap, which own the etale descent computation.
- The free-module statement is the source's Theorem 10.6, stated for l odd and regular.

**Construction and proof.**

1. State the vanishing of l-torsion in the even groups.
1. State the identification of the remaining l-torsion with the Harris-Segal summands, with the
   index condition that i is divisible by l-1.
1. State the free graded module structure with finite coefficients, with the explicit generator
   count and degrees.
1. Record the example the source gives for l = 5: the groups are eight-periodic with ranks 1,
   1, 0, 0, 0, 1, 0, 1 in the degrees zero to seven, generated by a power of the Bott element
   times one of four explicit classes.
1. Record what is not claimed: nothing here is asserted at an irregular prime, where the module
   structure is not known and the eigenspace decomposition is the only available tool.

**Acceptance.**

- For l = 5 the explicit periodic structure is the source's worked example, and the generator
  in degree five is attached to the golden ratio.
- The count of generators is (l+3)/2, which for l = 5 is four, matching the four classes named.
- At an irregular prime none of these statements is asserted.

**Depends on.** **inside this packet** `tame-kernel-vanishing-at-a-regular-prime`, `w-invariant`; **other roadmaps** `K3BlochGroups:V.5`.

**Source.** Kbook.2013, VI.10.5 (PDF p. 530): “Proposition 10.5. When l is an odd regular
prime, the group K_{2i}(Z) has no l-torsion. Thus the only l-torsion subgroups of K_*(Z) are
the Harris-Segal subgroups Z/w_i(Q) of K_{2i-1}(Z) when i is congruent to 0 modulo l-1.” — The
first two statements, verbatim.

**Source.** Kbook.2013, VI.10.6 (PDF p. 530): “Theorem 10.6. If l is an odd regular prime then
K_* = K_*(Z[1/l]; Z/l) is a free graded module over the polynomial ring Z/l[beta] on the Bott
element in degree 2l-2. It has (l+3)/2 generators: 1 in K_0, v in K_{2l-3}, and the elements
y_k in K_{4k+1} for k from 0 to (l-3)/2.” — The module statement with its generators and
degrees, verbatim.

**Source.** Kbook.2013, VI.10.6, the worked case l = 5 (PDF p. 531): “When l = 5, the groups
K_n = K_n(Z[1/5]; Z/5) are 8-periodic, with respective ranks 1, 1, 0, 0, 0, 1, 0, 1 (n = 0,
..., 7), generated by an appropriate power of beta in K_8 times one of {1, ..., y_1, v}. Here
y_1 in K_5 (x_1 is the golden mean) and v in K_7.” — The example, verbatim.

### `vandiver-separation` — Vandiver's conjecture, and keeping the conditional results apart

*comparison*

Vandiver's conjecture asserts that for an irregular prime l the Picard group of the ring of
integers of the maximal real subfield of the l-th cyclotomic field has no l-torsion;
equivalently, that the representation of the Galois group on the modulo-l Picard group of the
full cyclotomic field is a sum of odd twists of the roots of unity, which says that complex
conjugation acts as minus one on the l-torsion. It has been verified for all primes up to a
hundred and sixty-three million and is open. Under it, the K-groups of the integers are given
by an explicit table, and in particular the groups in degrees divisible by four vanish;
unconditionally those groups are known only to have order a product of irregular primes greater
than ten to the eighth, and their vanishing is equivalent to Vandiver's conjecture. Every
statement of this roadmap that uses the conjecture says so in its hypotheses, and no definition
of regularity contains it.

**Hypotheses.**

- l is an irregular prime; the real subfield is the fixed field of complex conjugation.
- The equivalence between the two forms of the conjecture uses that complex conjugation is the
  unique element of order two in the Galois group, which the source records.
- The conditional table is the source's Theorem 10.2 and is quoted as conditional.

**Construction and proof.**

1. State the conjecture in both forms and record the equivalence and its reason.
1. Record the verification bound and the historical remark that the statement was discussed by
   Kummer and Kronecker long before Vandiver.
1. State the conditional theorem: under the conjecture the K-groups of the integers are given
   by the explicit table.
1. State the unconditional fact about the groups in degrees divisible by four: their order is a
   product of irregular primes greater than ten to the eighth, and their vanishing is
   equivalent to the conjecture.
1. State the discipline: a theorem conditional on the conjecture is labelled conditional, and
   the definition of a regular prime does not mention it.

**Acceptance.**

- The conjecture is open, and a formalisation that assumed it silently would make the
  conditional table look unconditional.
- The equivalence of the two forms is a statement about the action of complex conjugation and
  is proved, not assumed.
- The unconditional statement about the groups in degrees divisible by four is weaker and is
  what may be used without the conjecture.

**Depends on.** **inside this packet** `regular-prime`, `eigenspaces-and-herbrand-ribet`, `regular-prime-torsion-consequences`.

**Source.** Kbook.2013, VI.10.8 (PDF p. 533): “Vandiver's Conjecture 10.8. If l is an irregular
prime then Pic(Z[zeta_l + zeta_l^{-1}]) has no l-torsion. Equivalently, the natural
representation of G = Gal(Q(zeta_l)/Q) on Pic(Z[zeta_l])/l is a sum of G-modules with odd
twists. This means that complex conjugation c acts as multiplication by -1 on the l-torsion
subgroup of Pic(Z[zeta_l])/l, because c is the unique element of G of order ...” — The
conjecture, the equivalence, the reason and the verification bound, verbatim.

**Source.** Kbook.2013, VI.10.1.1, the table note (PDF p. 528): “For n = 4i at least 8, the
orders of the groups K_{4i}(Z) are known to be products of irregular primes l, with l greater
than 10^8, and are conjectured to be zero; this conjecture follows from, and implies,
Vandiver's conjecture.” — The unconditional statement and the equivalence with the conjecture,
verbatim.

**Source.** Kbook.2013, VI.10.8.2 (PDF p. 533): “What we now call Vandiver's conjecture was
actually discussed by Kummer and Kronecker in 1849-1853; Harry Vandiver was not born until 1882
and only started using this assumption circa 1920.” — The historical remark, verbatim.

---

## N.8 — Certified examples

**Coverage: source_decomposed.** 7 nodes.

Seven nodes. The format of a certified example, with the arithmetic data, the tame-kernel
certificate imported from K2SymbolsBrauer T.5 and the labelling rule that an order deduced from
Birch-Tate is a corollary and not a test of it; the first five K-groups of the integers with
the roadmap that owns each and the two consistency checks; the Gaussian case, where the tame
kernel vanishes by Tate's computation and the third K-group is the integers plus a cyclic group
of order twenty-four by the structure theorem, the contrast with the rationals being the real
place; the S-integer sequence for one inverted prime, obtained by comparing two instances of
the tame-kernel sequence rather than by a new localisation theorem, with the extension class
explicitly not determined; the check that the second K-group of the rationals is infinite while
the tame kernel has order two; the real quadratic example with the Birch-Tate comparison and
the worked rational instance as its model; and the status of the Birch-Tate formula, odd part a
theorem of Wiles for totally real abelian fields and two-primary part open in general but known
for abelian extensions of the rationals, so that an example says exactly what it rests on. The
audit records three duplications, with SpecialValuesBirchTate B.3, K2SymbolsBrauer T.5 and
K3BlochGroups V.5; every computation those layers own is imported here with its owner named and
none is re-planned.

**Planets (1):** *Certified example*.

### `certified-example-format` — What a certified example is ★

*definition* · planet **Certified example**

A certified example of this roadmap consists of three things: the ARITHMETIC DATA of the field,
namely its degree, its signature, its class number, its unit rank and the invariants w_i, each
with a proof or with the pinned declaration that computes it; a TAME-KERNEL CERTIFICATE in the
format K2SymbolsBrauer T.5 fixes, that is generators, relations, a generation proof and a proof
that the relations are complete, so that an upper bound and a surjection are never reported as
an isomorphism; and an explicit LABELLING of every number that is deduced rather than computed.
The last is the rule the layer's text insists on: an order obtained from the Birch-Tate formula
is a valid corollary of that formula and is labelled as one, and it may not then be used as the
independent test of the formula.

**Hypotheses.**

- F is a number field; the data are those of its ring of integers or of a ring of S-integers,
  as the example states.
- The tame-kernel certificate format is imported from K2SymbolsBrauer T.5 and is not redefined
  here.
- The labelling rule is a condition on the example, not on the mathematics: the same equality
  may appear as a computation in one example and as a corollary in another, and the example
  says which.

**Construction and proof.**

1. Define the record of arithmetic data with a field for each invariant and a proof obligation
   attached to it.
1. Import the tame-kernel certificate and record which of its fields are present in a given
   example.
1. Define the labelling: each numerical claim carries a tag saying whether it is computed,
   imported or deduced, and from what.
1. State the circularity rule: a claim tagged as deduced from a formula may not be cited as
   evidence for that formula.
1. Record the minimum an example must contain to be admissible: the arithmetic data, at least
   an upper bound for the tame kernel, and the labelling.

**API.**

| name | role | statement |
| --- | --- | --- |
| `ArithmeticData` | structure | Degree, signature, class number, unit rank and the invariants w_i, with their proofs. |
| `CertifiedExample` | structure | The arithmetic data, the tame-kernel certificate and the labelling. |
| `CertifiedExample.tag` | projection | The tag of a numerical claim: computed, imported or deduced. |
| `CertifiedExample.no_circularity` | characterisation | A claim tagged as deduced from a formula is not evidence for that formula. |
| `CertifiedExample.admissible` | characterisation | The minimum an example must contain. |

**Used by.** *N.8, every example*: Each of the five required examples is an instance of this record. *SpecialValuesBirchTate B.3*: That layer uses the same examples as its independent test, and the labelling is what keeps the test independent. *K2SymbolsBrauer T.5*: The certificate half is that layer’s format, imported here.

**Unit tests.**

- `deduced_not_evidence` — An order deduced from Birch-Tate cannot be listed as a test of
  Birch-Tate.
- `upper_bound_only` — Without the completeness proof the example reports an upper bound.
- `rationals_admissible` — The rational example is admissible: its three numbers are known
  independently.
- `data_from_libraries` — For the small fields used here the arithmetic data can be discharged
  from the pinned libraries.

**Acceptance.**

- An example whose tame-kernel order is deduced from Birch-Tate is admissible and is labelled
  as a corollary; the same example may not then be listed as a test of Birch-Tate.
- An example with a surjective presentation and no completeness proof reports an upper bound,
  not an order.
- The arithmetic data half can be discharged from the pinned libraries for the small fields
  this layer uses, which is why those are the required first examples.

**Depends on.** **other roadmaps** `K2SymbolsBrauer:T.5`; **libraries** `mathlib:NumberField.classNumber`, `mathlib:NumberField.Units.rank`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`.

**Source.** Kbook.2013, VI.8.6, the worked case of the rationals (PDF p. 513): “For example,
when F = Q we have zeta_Q(-1) = -1/12, |K_2(Z)| = 2 and w_2(Q) = 24; see the Classical Data.” —
The shape of a certified example: three independently known numbers checked against one
another.

### `k-groups-of-the-integers` — The first K-groups of the integers

*application*

The required first computation: the zeroth K-group of the integers is the integers, the first
is cyclic of order two, the second is cyclic of order two generated by the symbol of minus one
with itself, the third is cyclic of order forty-eight, and the fourth vanishes. The first two
are the classical computations of the roadmap's earlier layers; the second is K2SymbolsBrauer
T.5's, through Milnor's presentation and the sign symbol; the third is K3BlochGroups V.5's; the
fourth is the source's table. This node records the five values with the roadmap that owns
each, and the two consistency checks the layer's text asks for.

**Hypotheses.**

- The ring is the integers; the groups are Quillen's K-groups.
- Each value is attributed; none is proved here.
- The fourth group vanishing is a theorem, unlike the groups in higher degrees divisible by
  four, whose vanishing is equivalent to Vandiver's conjecture.

**Construction and proof.**

1. Record the five values with their owners.
1. Record the generator of the second group, the symbol of minus one with itself, and the sign
   symbol that detects it.
1. Record the first consistency check: the second group has order two while the second K-group
   of the rationals is infinite, and the tame-kernel sequence accounts for the difference.
1. Record the second consistency check: the third group has order forty-eight, which is twice
   the invariant w_2 of the rationals, matching the odd-degree formula for a field with a real
   place.
1. Record the boundary: the vanishing of the fourth group is a theorem, and the vanishing of
   the higher groups in degrees divisible by four is not.

**Acceptance.**

- The third group has order forty-eight and the invariant w_2 of the rationals is twenty-four;
  the factor of two is the real place, as the general formula predicts.
- The second group has order two, and the second K-group of the rationals is infinite; both are
  consistent with the tame-kernel sequence.
- The fourth group vanishes; the eighth is only conjectured to vanish, and the packet says so.

**Depends on.** **inside this packet** `certified-example-format`, `w-invariant`, `vandiver-separation`; **other roadmaps** `K2SymbolsBrauer:T.5`, `K3BlochGroups:V.5`.

**Source.** Kbook.2013, VI.10.1.1, Table 10.1.1 (PDF p. 528): “K_0(Z) = Z, K_1(Z) = Z/2, K_2(Z)
= Z/2, K_3(Z) = Z/48, K_4(Z) = 0, K_5(Z) = Z, K_6(Z) = 0, K_7(Z) = Z/240.” — The five values,
verbatim from the table.

**Source.** Kbook.2013, VI.10.1.1, the note to the table (PDF p. 528): “The notation (0?)
refers to a finite group, conjecturally zero, whose order is a product of irregular primes
greater than 10^8.” — The boundary between the theorem in degree four and the conjecture in the
higher degrees divisible by four, verbatim.

### `gaussian-and-imaginary-quadratic` — The Gaussian integers: a vanishing tame kernel and a third K-group of order twenty-four

*application*

For the Gaussian rationals the required computations are that the tame kernel vanishes and that
the third K-group is the direct sum of the integers and a cyclic group of order twenty-four.
The first is Tate's computation, recorded by the source together with the other imaginary
quadratic rings of class number one for which the same vanishing holds. The second follows from
the general structure theorem for the third K-group of a number field: for a totally imaginary
field with r_2 complex places the group is the direct sum of r_2 copies of the integers and a
cyclic group of order the invariant w_2; the Gaussian rationals have one complex place and no
real place, and their invariant w_2 is twenty-four, so the group is as stated.

**Hypotheses.**

- The field is the Gaussian rationals and the ring is the Gaussian integers; the field is
  totally imaginary with one complex place and no real place.
- The structure theorem for the third K-group is the source's Corollary 5.3, which this layer
  imports; the case distinction between the totally imaginary case and the case with a real
  place is part of it.
- The value twenty-four for the invariant is computed by N.7's node and is the same as for the
  rationals.

**Construction and proof.**

1. Record Tate's vanishing computation for the tame kernel of the Gaussian integers, with the
   other imaginary quadratic rings the source lists.
1. State the structure theorem for the third K-group of a number field in both cases, totally
   imaginary and with a real place.
1. Compute the signature of the Gaussian rationals and its invariant w_2.
1. Substitute into the totally imaginary case to obtain the direct sum of the integers and a
   cyclic group of order twenty-four.
1. Record the contrast with the rationals, where the real place contributes the extra factor of
   two that gives order forty-eight, and record that this contrast is the point of having both
   examples.

**Acceptance.**

- The tame kernel of the Gaussian integers vanishes, while that of the integers has order two;
  the difference is the absence of a real place.
- The third K-group of the Gaussian rationals has torsion of order twenty-four and that of the
  rationals of order forty-eight, and both are instances of the same formula.
- The vanishing is Tate's computation and is imported; a formalisation may not derive it from
  the structure theorem, which does not give the tame kernel.

**Depends on.** **inside this packet** `k-groups-of-the-integers`, `w-invariant`; **other roadmaps** `K3BlochGroups:V.5`, `K2SymbolsBrauer:T.5`.

**Source.** Kbook.2013, VI.5.3 (PDF p. 489): “Corollary 5.3. Let F be a number field, with r_1
real embeddings and r_2 complex embeddings, and set w = w_2(F). Then the indecomposable third
K-group is the direct sum of r_2 copies of Z and Z/w, and: (a) if F is totally imaginary then
K_3(F) is the direct sum of r_2 copies of Z and Z/w; (b) if F has r_1 > 0 embeddings into R
then K_3(F) is the direct sum of r_2 copies of Z, Z/(2w) and ...” — The structure theorem in
both cases, verbatim.

**Source.** Kbook.2013, III.5.2.2 (PDF p. 222): “Tate has used the same Euclidean algorithm
type techniques to show that ... K_2(R) = 1 for the imaginary quadratic rings R = Z[i], ...” —
The vanishing of the tame kernel of the Gaussian integers, verbatim.

### `s-integer-sequence-for-one-inverted-prime` — The S-integer sequence for the integers with one prime inverted

*application*

Comparing the tame-kernel sequence of the integers with that of the integers with a prime
inverted gives the short exact sequence whose left term is the second K-group of the integers,
whose middle term is the second K-group of the integers with that prime inverted, and whose
right map is the tame symbol at the inverted prime, onto the multiplicative group of the
residue field. So the second K-group of the S-integers is an extension of a cyclic group of
order p-1 by a cyclic group of order two. In degree one the sequence gives the unit group: the
units of the integers with a prime inverted form the direct sum of a cyclic group of order two
and an infinite cyclic group generated by the prime. The demonstration is what the layer's text
asks for, and it is obtained by comparing two instances of a sequence this roadmap already
owns, not by a new localisation theorem.

**Hypotheses.**

- p is a prime; S is the set consisting of p together with the infinite place; the ring is the
  integers with p inverted.
- The two tame-kernel sequences are K2SymbolsBrauer T.5's; the localisation theorem behind them
  is ArithmeticKTheory N.2's.
- The extension is not claimed to be split; its class is not determined here.

**Construction and proof.**

1. Write the tame-kernel sequence for the integers: the second K-group of the integers injects
   into that of the rationals with cokernel the sum over all primes of the multiplicative
   groups of the prime fields.
1. Write the same sequence for the integers with p inverted, where the sum omits the place p.
1. Compare the two, obtaining the short exact sequence with the tame symbol at p on the right.
1. Record the resulting order statement: the middle group has order twice p-1 when it is
   finite, and in particular is finite.
1. Record the degree-one instance: the unit group of the integers with p inverted is the direct
   sum of a cyclic group of order two and an infinite cyclic group.
1. Record what is not determined: whether the extension splits, which needs more than the
   comparison.

**Acceptance.**

- For p = 2 the residue field has one element in its multiplicative group, so the sequence
  gives that the second K-group of the integers with two inverted has order two.
- For p = 3 the group has order four.
- The extension class is not determined by the comparison, and a formalisation that asserted a
  splitting would be claiming more than the argument gives.

**Depends on.** **inside this packet** `k-groups-of-the-integers`; **other roadmaps** `K2SymbolsBrauer:T.5`, `ArithmeticKTheory:N.2`.

**Source.** Kbook.2013, VI.8.1, Classical Data (PDF p. 507): “The formulas for K_0(O_S) = Z +
Pic(O_S) and K_1(O_S) = the units of O_S, isomorphic to Z^{r_2 + |S| - 1} + the roots of unity
of F, are different.” — The degree-zero and degree-one terms of the S-integer computation,
verbatim; the unit statement specialises to the integers with one prime inverted.

**Source.** Kbook.2013, III.6.5.1 (PDF p. 245): “If R = Z then, since K_2(Z/p) = 1 and SK_1(Z)
= 1, we have an exact sequence 1 -> K_2(Z) -> K_2(Q) -> the direct sum of the F_p^times -> 1.”
— The sequence for the integers, which is one of the two compared here.

### `the-rationals-infinite-against-finite` — The rationals: an infinite second K-group over a tame kernel of order two

*application*

The explicit check the layer's text asks for: the second K-group of the rationals is infinite,
being the direct sum of a cyclic group of order two and the direct sum over the primes of the
multiplicative groups of the prime fields, while the tame kernel, that is the second K-group of
the integers, has order two. The two statements are consistent because the tame-kernel sequence
is exact and its right-hand term is the infinite direct sum; the splitting is given by the sign
symbol at the real place. Both halves are K2SymbolsBrauer T.5's and are imported; what this
node adds is the check itself and its record as a certified example.

**Hypotheses.**

- The field is the rationals and the ring the integers.
- Both computations are imported from K2SymbolsBrauer T.5; the sign symbol that splits the
  sequence is that layer's own contribution.
- The infinite direct sum is over all primes, and each summand is finite cyclic, so the sum is
  infinite but torsion.

**Construction and proof.**

1. Record the two statements with their owner.
1. Record the exact sequence that relates them and the splitting by the sign symbol.
1. Perform the check: the finite group on the left and the infinite group in the middle are
   consistent exactly because the right-hand term is infinite.
1. Record the resulting certified example: three numbers, the order two, the infinitude, and
   the splitting, each tagged with its status.
1. Record the contrast with the Gaussian case, where the tame kernel vanishes and there is no
   real place to split the sequence.

**Acceptance.**

- The second K-group of the rationals is infinite and torsion, which is not a contradiction.
- The tame kernel has order two and is a direct summand, by the sign symbol.
- The example is admissible in the sense of this layer's format: every number is tagged and
  none is deduced from Birch-Tate.

**Depends on.** **inside this packet** `certified-example-format`, `s-integer-sequence-for-one-inverted-prime`; **other roadmaps** `K2SymbolsBrauer:T.5`.

**Source.** Kbook.2013, III.6.5.1 (PDF p. 245): “As noted in Example 6.2.1, this sequence is
split by the symbol (r,s)_infinity, so we have K_2(Q) = K_2(Z) + the direct sum of the
F_p^times.” — The decomposition that makes the check, verbatim.

### `real-quadratic-example-and-birch-tate` — A real quadratic example, and the Birch-Tate check

*application*

The required real quadratic example: a real quadratic field with its arithmetic data certified,
its tame kernel presented in the format of this layer, and the Birch-Tate quotient computed and
compared. The Birch-Tate conjecture asserts, for a totally real number field, that the value of
the Dedekind zeta function at minus one equals, up to the sign given by the number of real
places, the order of the tame kernel divided by the invariant w_2. The worked instance the
source gives is the rationals, where the zeta value is minus one twelfth, the order is two and
the invariant is twenty-four. For a real quadratic field the same three numbers are computed
independently, and the labelling rule applies: if the order is obtained from the formula it is
a corollary and not a test.

**Hypotheses.**

- F is a real quadratic field, so both places are real and the field is totally real; the ring
  is its ring of integers.
- The arithmetic data can be discharged from the pinned libraries, which have class numbers,
  the Minkowski bound machinery and an extensive quadratic-field development.
- The tame-kernel presentation is not in the libraries and is the part the certificate must
  supply; the source cites the literature on second K-groups of quadratic fields for the
  computations.

**Construction and proof.**

1. Fix a real quadratic field and certify its arithmetic data from the pinned libraries:
   degree, signature, class number, unit rank and the invariant w_2.
1. Present the tame kernel in the certificate format, recording which half of the certificate
   is available.
1. Compute the two sides of the Birch-Tate formula independently where possible, and tag each
   number.
1. Record the worked rational instance of the source as the model, with its three numbers.
1. Record the status of the conjecture from the next node, so that the example does not appear
   to prove more than it does.

**Acceptance.**

- The rational instance checks: minus one twelfth equals minus one times two divided by twenty-
  four.
- For a real quadratic field with class number one the arithmetic data are available from the
  libraries and the tame-kernel presentation is the only missing half.
- An order read off from the formula is tagged as a corollary and the example is then not a
  test of the formula.

**Depends on.** **inside this packet** `certified-example-format`, `the-rationals-infinite-against-finite`, `w-invariant`; **other roadmaps** `SpecialValuesBirchTate:B.3`; **libraries** `mathlib:NumberField.classNumber`, `mathlib:NumberField.dedekindZeta`.

**Source.** Kbook.2013, VI.8.6 (PDF p. 513): “Birch-Tate Conjecture 8.6. If F is a number
field, the zeta function zeta_F(s) has a pole of order r_2 at s = -1. Birch and Tate
conjectured in 1970 that for totally real number fields (r_2 = 0) we have zeta_F(-1) =
(-1)^{r_1} |K_2(O_F)|/w_2(F).” — The formula with its hypothesis, verbatim.

**Source.** Kbook.2013, VI.8.6, the worked case (PDF p. 513): “For example, when F = Q we have
zeta_Q(-1) = -1/12, |K_2(Z)| = 2 and w_2(Q) = 24.” — The model instance, verbatim.

### `birch-tate-status` — What is known about the Birch-Tate formula, and what the examples may claim

*comparison*

The odd part of the Birch-Tate conjecture is a theorem of Wiles for totally real abelian
fields; the two-primary part is open in general but is known to follow from the two-adic Main
Conjecture of Iwasawa theory, and it is known for abelian extensions of the rationals, so the
full conjecture holds there. An example over a totally real abelian field may therefore use the
formula as a theorem, with the reference; an example over a general totally real field may not.
This node records the status so that the certified examples of this layer state exactly what
they rest on, and so that the labelling rule of the format node has something precise to point
at.

**Hypotheses.**

- F is a totally real number field; the abelian case is the one in which the full statement is
  available.
- The status is quoted from the source; neither the odd part nor the two-adic part is proved
  here.
- The pole order statement at minus one, that it is the number of complex places, is part of
  the conjecture's setting and holds unconditionally.

**Construction and proof.**

1. Record the odd part as Wiles's theorem for totally real abelian fields, with the source's
   reference.
1. Record the two-primary part as open in general and as a consequence of the two-adic Main
   Conjecture.
1. Record that for abelian extensions of the rationals the full formula holds, so an example
   over such a field may cite it.
1. State the consequence for this layer: an example over a totally real abelian field may treat
   the formula as a theorem and label its deductions accordingly; an example over another
   totally real field must treat it as conjectural.
1. Record that the roadmap SpecialValuesBirchTate owns the formula and its proof, and that this
   layer only uses it in examples.

**Acceptance.**

- For the rationals the formula is available as a theorem and the worked instance is a check of
  three independently known numbers.
- For a general totally real field the two-primary part is open, so an order deduced from the
  formula there is conditional and must be labelled as such.
- Nothing in this layer proves any part of the conjecture.

**Depends on.** **inside this packet** `real-quadratic-example-and-birch-tate`; **other roadmaps** `SpecialValuesBirchTate:B.3`.

**Source.** Kbook.2013, VI.8.6, the status (PDF p. 513): “The odd part of this conjecture was
proven by Wiles ... The two-primary part of the Birch-Tate conjecture is still open, but it is
known to be a consequence of the 2-adic Main Conjecture of Iwasawa Theory ... so the full
Birch-Tate Conjecture holds for all abelian extensions of Q.” — The exact status of both parts,
verbatim.

---

## Requests to other roadmaps

- `K2SymbolsBrauer:T.5` — The tame kernel with its exact sequence, the computations of the
  second K-groups of the integers, of the rationals and of a finite field, and the format of a
  certified finite presentation with the rule that an upper bound is not an isomorphism.
  AUDIT-27 records T.5 as owning exactly the computations N.8 needs, so they are imported by
  name and none is re-planned here.
- `K2SymbolsBrauer:T.7` — The twisted coefficient modules, the norm residue symbol and Tate's
  comparison. The invariant w_i is defined with the twisted modules and the tame-kernel
  vanishing theorem of N.7 is proved through Tate's comparison.
- `K3BlochGroups:V.5` — The third K-group of the integers, of the rationals and of the Gaussian
  rationals. AUDIT-27 names V.5 as owning the order forty-eight and the Gaussian computation
  that N.8 records.
- `MotivicEtaleKTheory:M.3` — The norm residue map and Tate's comparison for local and global
  fields, which is the first of the three inputs of N.7's tame-kernel vanishing theorem.
- `ArithmeticKTheory:N.2` — The localisation theorem for a ring of S-integers, which is what
  makes the tame-kernel sequence exact on the left and is the theorem the S-integer comparison
  of N.8 rests on.
- `ArithmeticKTheory:N.5` — The odd K-groups with their Harris-Segal summands, which is where
  the torsion consequences of N.7 live.
- `SpecialValuesBirchTate:B.3` — The Birch-Tate formula with its proved cases. AUDIT-27 records
  B.3 as asking for the same base examples as its independent test; the labelling rule of N.8
  is what keeps that test independent.
- `K2SymbolsBrauer:T.2` — Matsumoto's presentation of the second K-group of a field by
  Steinberg symbols, the skew-symmetry and the relation between the symbol of an element with
  itself and with minus one, all used by the computations N.8 imports.

## Gaps

**Washington's book, the source of Kummer's criterion, was not obtained.** The K-book states Kummer's criterion, that a prime is irregular exactly when it divides the numerator of one of the Bernoulli numbers in the finite range, and refers to Washington's Introduction to Cyclotomic Fields for the proof, as it does for Kummer's congruences. That book is not freely available and was not obtained. This packet states the criterion as the source states it, with the attribution, and proves nothing about it. NEXT SOURCE ACTION: obtain Washington, chapters 5 and 6, and decompose the proof of the criterion and of the congruences; both are needed before the criterion can be used as anything but an import.

**The Herbrand-Ribet theorem is quoted from a remark.** The eigenspace statement, that l divides the k-th Bernoulli number exactly when the eigenspace of index l-2k of the modulo-l class group is non-zero, appears in the K-book as a remark with a reference to the original papers of Herbrand and of Ribet. Neither was obtained. The node states the theorem in the form the remark gives and records the numerical statement that among irregular primes below four thousand at most three values of k occur. NEXT SOURCE ACTION: obtain Ribet's 1976 Inventiones paper and Herbrand's original, or Washington chapter 6, and decompose the proof; Ribet's half uses modular forms and is a substantial piece of work in its own right.

**The tame-kernel presentations of quadratic fields are in a paper that was not obtained.** The required real quadratic example needs a presentation of the tame kernel, and the K-book cites Browkin and Schinzel's 1982 paper in Crelle on the second K-groups of quadratic number fields for such computations. The paper was not obtained. The arithmetic half of the certificate is available from the pinned libraries, which have class numbers, the Minkowski bound and an extensive quadratic-field development; the presentation half is not. NEXT SOURCE ACTION: obtain Browkin and Schinzel, and one of the later tables of tame kernels of quadratic fields, and record a presentation with both bounds for one real quadratic field.

**The vanishing of the tame kernel of the Gaussian integers is cited, not proved.** The K-book records that Tate computed the second K-groups of the imaginary quadratic rings of small discriminant, obtaining the trivial group for the Gaussian integers, and attributes the method to the same Euclidean-algorithm techniques that Milnor uses for the integers. No proof is given there and none is given here. NEXT SOURCE ACTION: obtain Tate's computation, or Milnor's section 10 for the method, and decompose the argument for at least the Gaussian case; the argument is elementary and is a good candidate for an early formalisation.

## Structural proposals

### N.8 is a register of imports and should say so in its stage text

*kind: `note-duplicate-boundary`.* The reviewed audit AUDIT-27 records three duplications for N.8, and each names a genuine owner: SpecialValuesBirchTate B.3 asks for the same base examples as the independent test of Birch-Tate; K2SymbolsBrauer T.5 proves the second K-group of the integers, of a finite field and the infinitude for the rationals, and asks for a verified presentation in this roadmap; and K3BlochGroups V.5 proves the third K-group of the integers and carries the Gaussian computation as a test. Everything N.8's stage text asks to compute is therefore owned elsewhere, and what N.8 can own is the FORMAT of a certified example, the labelling rule, and the checks between the imported numbers. Proposal: rewrite N.8's stage text to say that the computations are imported from those three layers and that N.8 owns the certificate format, the labelling discipline and the consistency checks. As written the text reads as a computation task and invites a worker to re-plan three other layers.

### The word regular is missing from both libraries and is a cheap early target

*kind: `note-library-target`.* AUDIT-27 records that a grep for the phrase regular prime over both pinned trees returns nothing, and the same for Vandiver. Yet every ingredient is pinned: cyclotomic extensions, rings of integers, class numbers and the Bernoulli numbers in both conventions, with the conversion. The definition of a regular prime is therefore a composition of pinned objects and is one of the cheapest genuinely new definitions in this area, with the decidability instance for a given prime following from the pinned class number. Proposal: record it as an early library target of this roadmap, ahead of the theorems that use it, since it unblocks both the statement of N.7's main theorem and the certified examples of N.8.

## Checks

    python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheory--N.7.json --index $TAUCETI_BASELINE/declarations.tsv

reports **0 errors and 0 warnings** with the pinned declaration index in place, so all 21
baseline references were resolved against it. `python3 -m unittest discover -s tests` passes.
The suggested Lean file was **not compiled**: the Mathlib build on this machine is a shared
cache that must not be rebuilt, and this tree has no elaborated dependency modules. Nothing
here is claimed to be formalised; every `implementationStatus` is `unchecked`.
