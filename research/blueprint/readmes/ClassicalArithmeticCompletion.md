# Classical arithmetic, sequences, polynomials and reciprocity

Blueprint for the roadmap `ClassicalArithmeticCompletion`, job `BP-ClassicalArithmeticCompletion` (issue #1025).
Packet: `research/blueprint/packets/ClassicalArithmeticCompletion.json`. Suggested Lean file:
`research/blueprint/suggested/ClassicalArithmeticCompletion.lean`. Handoff:
`research/blueprint/handoff/BP-ClassicalArithmeticCompletion.md`.

**Status: partial.** CA.0 is closed; CA.1, CA.2, CA.3, CA.4 and CA.6 are partial, each with a precise
`remaining` list in the packet's coverage record; CA.5 is a process layer with no mathematics of its own; and
CA.7 is marked not read, because no free source for integral Galois module structure was obtained. The packet has
10 nodes, 27 API items and 18 unit tests, cites 56 declarations of the pinned libraries, records 5 gaps and
makes 0 requests to other roadmaps.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Sources

Every source is freely available and was opened and read; the sections read are listed in the packet.

- **`SHOUP.V2`** — Victor Shoup, *A Computational Introduction to Number Theory and Algebra (Version 2)*. Version 2, the author's freely distributable PDF, 598 pages
  <https://shoup.net/ntb/ntb-v2.pdf>, read 2026-09-24.
  SHA-256 `8e1abc54f4510c3f274dfbed07ea602a6a439ee24b2c916e61abe829b402ec06`.
- **`STANLEY.EC1`** — Richard P. Stanley, *Enumerative Combinatorics, Volume 1, second edition*. The author's freely posted PDF of the second edition
  <https://math.mit.edu/~rstan/ec/ec1.pdf>, read 2026-09-24.
  SHA-256 `f669d7b0d78730b7c812794a437fb6a78e0c182c10dfd520bc26d627cf45a1d5`.
- **`STEIN.ANT`** — William Stein, *Algebraic Number Theory, a Computational Approach*. The author's freely posted PDF
  <https://wstein.org/books/ant/ant.pdf>, read 2026-09-24.
  SHA-256 `4ea5168b966f36326a1b7e1a86471c6f4b8a5fe838e29b96b9f3bde648917107`.

## What is already built, and what is planned

The reviewed library audit in `data/library-coverage.json` gives this roadmap eight verdicts: CA.0 **built**,
CA.5 **process**, and CA.1, CA.2, CA.3, CA.4, CA.6 and CA.7 **partly built** or worse. The protocol is explicit
that a target the pinned libraries already contain is a baseline citation and never a node, that a partly built
layer gets nodes only for its missing targets, and that a process layer gets no nodes at all and a proposal for
its removal. This packet follows that exactly, which is why it is small: 10 nodes, against 56 pinned declarations
recording what is already there. A larger packet here would be a duplicate of Mathlib.

No request is made to another roadmap: every prerequisite of every node is either another node of this packet
or a declaration of the pinned libraries. The job's supplier list names `BP-FoundationsAndLibraryIntegration`,
which was retired on 16 September 2026; that is recorded as a gap rather than acted on.

One correction to the audit, checked at the pinned commit: the audit's CA.4 entry says that
`fermatLastTheoremThree` is "missing from the index". It is in the index, as
`Mathlib/NumberTheory/FLT/Three.lean:751`, and is cited as a baseline declaration below.

## Layers

---

## CA.0 Divisibility and multiplicative arithmetic

**Coverage: closed.** The reviewed library audit records this layer as built: greatest common divisors with Bezout and the extended Euclidean algorithm, unique factorisation, congruences and residue rings, the Chinese remainder theorem for coprime and for pairwise coprime families, p-adic valuations with Legendre's formula, the arithmetic functions with their multiplicativity, Dirichlet convolution and Moebius inversion are all in the pinned libraries, and are cited here as baseline declarations rather than planned. One statement inside a built target is recorded by the audit as unstated: the Chinese remainder theorem at non-coprime moduli in its integer form, the pinned library having only the natural number form. That is the single node of this layer, and with it the layer is closed.

The reviewed audit gives this layer the verdict **built**. Greatest common divisors with
Bézout and the extended Euclidean algorithm, unique factorisation, congruences and residue rings, the Chinese
remainder theorem in its coprime and pairwise-coprime and ideal-theoretic forms, `p`-adic valuations with
Legendre's formula, the arithmetic functions with their multiplicativity, Dirichlet convolution and Möbius
inversion are all in the pinned libraries. The protocol is explicit that such a target is a baseline citation
and never a node, so none of it is planned.

What is planned is the one statement the audit records as unstated inside a built target: the Chinese remainder
theorem at non-coprime moduli **over the integers**. Mathlib's `Nat.chineseRemainder'` takes exactly the right
hypothesis and returns a solution below the least common multiple, but over the naturals; the integer
existence form is not stated. That is the single node of this layer, and with it the layer is closed.

### Nodes (1)

#### `crt-at-non-coprime-moduli-over-the-integers` — The Chinese remainder theorem at non-coprime moduli, over the integers

*theorem.*

**Statement.** Let m and n be positive integers, let d be their greatest common divisor and let l be their least common multiple. For integers a and b there is an integer x with x congruent to a modulo m and x congruent to b modulo n if and only if a is congruent to b modulo d. When such an x exists, an integer y satisfies the same two congruences if and only if y is congruent to x modulo l.

**Hypotheses.**

- m and n are positive integers.
- a and b are arbitrary integers; no coprimality is assumed.
- The conclusion is over the integers, and the uniqueness is modulo the least common multiple, not modulo the product.

**Construction, or proof, in steps.**

1. For necessity, suppose x solves both congruences; then a minus b is a difference of two multiples of d, since d divides both m and n, so a is congruent to b modulo d.
2. For sufficiency, write d as an integer combination of m and n by the extended Euclidean algorithm, and use the hypothesis to exhibit the solution explicitly; this is the source's exercise.
3. For uniqueness, if x and y both solve the system then their difference is divisible by m and by n, hence by the least common multiple, and conversely.
4. Record that the natural number form of both statements is in the pinned library and that only the integer form is new; the proof of the integer form from the natural number form is a case split on signs and is one of the proof steps.

**Acceptance.**

- The criterion is congruence modulo the greatest common divisor, and the uniqueness is modulo the least common multiple. Using the product in place of the least common multiple is wrong as soon as the moduli share a factor.
- For coprime moduli the criterion is vacuous and the statement is the classical Chinese remainder theorem.
- For m equal to n the criterion says a is congruent to b modulo m, and the solution set is one residue class.

**Prerequisites.**

- `mathlib:Nat.chineseRemainder'`
- `mathlib:Int.ModEq`
- `mathlib:Nat.ModEq`
- `mathlib:Nat.xgcd`

**Sources.**

- SHOUP.V2 — Victor Shoup, *A Computational Introduction to Number Theory and Algebra (Version 2)*, Exercise 2.18 (printed p. 24, PDF p. 42).

  > Suppose n_1 and n_2 are positive integers, and let d := gcd(n_1, n_2). Let a_1 and a_2 be arbitrary integers. Show that there exists an integer a such that a is congruent to a_1 modulo n_1 and a is congruent to a_2 modulo n_2 if and only if a_1 is congruent to a_2 modulo d.

  The node is that exercise for the existence half. The source gives no uniqueness statement, so the second half of the node is proved here from the definition of the least common multiple, and the proof steps say so. The reviewed integrated decomposition of this roadmap records the same exercise, with its review correcting an earlier citation of Exercise 2.16, which is about linear congruences modulo pairwise coprime moduli.

---

## CA.1 Residues and reciprocity

**Coverage: partial.** Quadratic reciprocity for the Legendre and Jacobi symbols with both supplementary laws, Euler's criterion, Gauss and Jacobi sums with their product identities, and the criterion for the units modulo n to be cyclic are all in the pinned libraries and are cited as baseline declarations. Three of the audit's missing targets are planned here: the structure of the units modulo a power of two, with the explicit generators minus one and five, which is the one case the cyclicity criterion leaves open; the d-th power criterion in a finite cyclic group; and its specialisation to a finite field, which is the audit's exact missing statement.

**Remaining in this layer:**

- The n-th power residue symbols, modulo a prime and in a number field, and the Kummer pairing they are defined through. The criterion is planned here; the symbol is a further object and no source read for this packet defines it.
- The identity that the absolute value squared of a Gauss sum is the cardinality of the field, as a named lemma. The audit records it as two lines from the product identity that is in the library; no source read here states it as a lemma, so it is not planned rather than being written from memory.
- The Hilbert, that is norm-residue, symbols at two and at a real place, and the product formula tying the local symbols together. A free source that states and proves them exists and was located but not read in this session: John Voight, Quaternion Algebras, the author's freely posted book. A continuation job should read its chapters on the Hilbert symbol and plan these.
- Higher reciprocity through class field theory: cubic, quartic, Eisenstein, general power reciprocity and Artin reciprocity, with ramified primes excluded. The audit records the Artin symbol at unramified primes in Tau Ceti and no reciprocity law; this is a substantial body of work with its own sources and belongs to a continuation job.

Quadratic reciprocity is done. So are the Legendre and Jacobi symbols with both supplementary
laws, Euler's criterion, Gauss and Jacobi sums with their product identities, and the criterion for
`(ℤ/n)ˣ` to be cyclic. All of it is cited as baseline.

Three things the audit records as missing are planned. The cyclicity criterion tells you that
`(ℤ/2ᵉ)ˣ` is **not** cyclic for `e ≥ 3` and says nothing about what it is instead; the node here
supplies the decomposition with its explicit generators `-1` and `5`, which is what a user actually needs. And
the `d`-th power criterion, of which Euler's criterion is the case `d = 2`, is planned in a finite cyclic group
and then in a finite field, with the greatest common divisor in the exponent so that it holds for every `d` and
not only for `d` dividing the order.

What is not planned, and why, is in the remaining list: the `n`-th power residue symbols, the Gauss sum
absolute value as a named lemma, the Hilbert symbols at `2` and at a real place with the product formula (the
free source is located and named), and higher reciprocity through class field theory.

**Planets of this layer** (2): *Units modulo a power of two*, *Power residue criterion*.

### Nodes (3)

#### `unit-group-of-a-power-of-two` — The unit group modulo a power of two, with explicit generators

*construction.* **Planet:** *Units modulo a power of two*.

**Statement.** Let e be an integer at least three. The class of five in the units modulo two to the e has order two to the e minus two, the class of minus one has order two and is not a power of the class of five, and the two cyclic subgroups they generate intersect trivially and together fill the whole group. Hence the units modulo two to the e are the internal direct product of the subgroup generated by minus one and the subgroup generated by five, and are isomorphic to the product of a cyclic group of order two with a cyclic group of order two to the e minus two. For e equal to one or two the group is cyclic.

**Hypotheses.**

- e is an integer at least three for the decomposition; the cases e equal to one and two are stated separately and are cyclic.
- The generators are the classes of minus one and of five; the statement is about these explicit elements and not only about the abstract isomorphism type.

**Construction, or proof, in steps.**

1. Prove the lifting lemma: if a is congruent to one plus p to the e modulo p to the e plus one, and p to the e exceeds two, then a to the p is congruent to one plus p to the e plus one modulo p to the e plus two.
2. Apply it repeatedly to five modulo two to the e, reading the successive squares in binary, to see that the class of five has order two to the e minus two.
3. Show that minus one is not in the subgroup generated by five: a cyclic group of even order has exactly one element of order two, so if minus one were in that subgroup it would equal the relevant power of five, which the previous computation contradicts.
4. Conclude that the two subgroups intersect trivially, so their internal product is a subgroup whose order equals that of the whole group, hence is the whole group.
5. Record the two small cases e equal to one and two, which are verified directly.

**Acceptance.**

- The decomposition is with a cyclic factor of order two to the e minus two and not to the e minus one; the exponent is what fails if the lifting lemma is applied one step too far.
- The generators are explicit: minus one and five. A statement of the isomorphism type alone does not give the two projections a user needs.
- For e equal to three the group has order four and is the Klein four group, generated by the classes of minus one and five, which are three and five modulo eight.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `ZMod.unitsTwoPowEquiv` | data | The isomorphism between the units modulo two to the e and the product of a cyclic group of order two and one of order two to the e minus two, for e at least three. |
| `ZMod.orderOf_five` | characterisation | The class of five has order two to the e minus two. |
| `ZMod.neg_one_not_mem_zpowers_five` | characterisation | Minus one is not a power of five. |
| `ZMod.unitsTwoPow_eq_prod` | structure | Every unit is uniquely a power of five times a sign. |
| `ZMod.not_isCyclic_units_two_pow` | relation | For e at least three the group is not cyclic, which is the negative half of the pinned cyclicity criterion. |

**Uses.**

- `ClassicalArithmeticCompletion:CA.1/power-residue-criterion-in-a-cyclic-group`: the criterion applies to each cyclic factor once the group is decomposed
- `ClassicalArithmeticCompletion:CA.0`: the layer's decomposition of the units modulo n into prime power factors is completed by this case

**Unit tests.** A plausible wrong definition fails one of these.

- `modulus_eight`: The units modulo eight are the Klein four group, generated by the classes of three and five; every element squares to one.
- `modulus_sixteen`: The class of five has order four modulo sixteen, and the group is the product of that cyclic group of order four with the subgroup of order two generated by minus one.
- `not_cyclic`: For e at least three the group is not cyclic, so an implementation that returns a single generator is wrong.
- `small_cases`: For e equal to one the group is trivial and for e equal to two it is cyclic of order two, so the decomposition is stated only for e at least three.

**Prerequisites.**

- `mathlib:ZMod.isCyclic_units_iff`
- `mathlib:IsCyclic`
- `mathlib:orderOf`

**Sources.**

- SHOUP.V2 — Victor Shoup, *A Computational Introduction to Number Theory and Algebra (Version 2)*, Theorem 7.28 with the part of its proof for p equal to two (printed pp. 203 and 205), and Lemma 7.31.

  > The group of units modulo two to the e is cyclic for e equal to 1 or 2, but not for e at least 3. For e at least 3 it is isomorphic to the additive group of the integers modulo two, times the integers modulo two to the e minus two. Suppose e at least 3. Consider the subgroup G generated by the class of 5. We claim that the class of minus 1 is not in G.

  The node is the second half of that theorem, the part the pinned library does not have, together with the explicit generators the source's proof produces; the cyclicity criterion itself is a baseline citation and is not planned.

#### `power-residue-criterion-in-a-cyclic-group` — The d-th power criterion in a finite cyclic group

*theorem.*

**Statement.** Let G be a finite cyclic group of order N and let d be a positive integer. Then the subgroup of d-th powers of G is the unique subgroup of order N divided by the greatest common divisor of d and N, and an element a of G is a d-th power if and only if a raised to the power N divided by that greatest common divisor is the identity.

**Hypotheses.**

- G is cyclic of finite order N.
- d is a positive integer, not assumed to divide N.
- The criterion is an equivalence, in both directions.

**Construction, or proof, in steps.**

1. Fix a generator and identify G with the additive group of residues modulo N, under which the d-th power map becomes multiplication by d.
2. Compute the image of multiplication by d as the subgroup generated by the greatest common divisor of d and N, of index that greatest common divisor, hence of order N divided by it.
3. Use that a cyclic group has exactly one subgroup of each order dividing the order to identify the image with the kernel of raising to the power N divided by the greatest common divisor.
4. Read off the criterion as membership in that kernel.

**Acceptance.**

- The exponent in the criterion is N divided by the greatest common divisor of d and N, and not N divided by d; for d not dividing N the latter is not even an integer.
- For d equal to two and G the units modulo an odd prime this is Euler's criterion, which is the case the pinned library has.
- The subgroup of d-th powers has order N divided by that greatest common divisor, which pins its index.

**Prerequisites.**

- `mathlib:IsCyclic`
- `mathlib:orderOf`
- `mathlib:ZMod.euler_criterion`

**Sources.**

- SHOUP.V2 — Victor Shoup, *A Computational Introduction to Number Theory and Algebra (Version 2)*, Example 7.61 (printed p. 205).

  > Let d divide p minus one. Since the units modulo p form a cyclic group of order p minus one, the d-th powers form the unique subgroup of order (p minus one) over d, and it is the set of elements whose power by (p minus one) over d is one; that is, a is a d-th power if and only if a to the (p minus one) over d equals one.

  The node is that example, stated for an arbitrary finite cyclic group and for an arbitrary positive d, with the greatest common divisor in place of the source's divisibility hypothesis; the reduction to the source's case is the first proof step, since the d-th powers of a cyclic group of order N coincide with its g-th powers where g is that greatest common divisor.

#### `power-residue-criterion-in-a-finite-field` — The n-th power residue criterion in a finite field

*theorem.* **Planet:** *Power residue criterion*.

**Statement.** Let F be a finite field with q elements and let n be a positive integer. A nonzero element a of F is an n-th power in F if and only if a raised to the power q minus one divided by the greatest common divisor of n and q minus one is one. The n-th powers form a subgroup of index that greatest common divisor in the multiplicative group.

**Hypotheses.**

- F is a finite field with q elements and n is a positive integer.
- a is nonzero; the zero element is an n-th power trivially and is excluded from the multiplicative statement.

**Construction, or proof, in steps.**

1. Use that the multiplicative group of a finite field is cyclic of order q minus one.
2. Apply the criterion for a finite cyclic group with N equal to q minus one.
3. Read off the index statement from the order of the subgroup of n-th powers.

**Acceptance.**

- The criterion is stated with the greatest common divisor, so it applies for every n and not only for n dividing q minus one.
- For n equal to two and q odd it is Euler's criterion in the finite field.
- For n coprime to q minus one every nonzero element is an n-th power, since the greatest common divisor is one and the condition is vacuous.

**Prerequisites.**

- `ClassicalArithmeticCompletion:CA.1/power-residue-criterion-in-a-cyclic-group`
- `mathlib:ZMod.pow_card_sub_one_eq_one`
- `mathlib:ZMod.euler_criterion`

**Sources.**

- SHOUP.V2 — Victor Shoup, *A Computational Introduction to Number Theory and Algebra (Version 2)*, Example 7.61 (printed p. 205) together with Theorem 7.29.

  > Let D be an integral domain and G a subgroup of the units of D of finite order. Then G is cyclic. Since the units modulo p form a cyclic group of order p minus one, the d-th powers form the unique subgroup of order (p minus one) over d.

  The node is the same criterion with the units modulo a prime replaced by the multiplicative group of an arbitrary finite field, which is cyclic by Theorem 7.29; this is the exact statement the reviewed library audit of this layer records as missing.

---

## CA.2 Sequences and generating functions

**Coverage: partial.** Bernoulli numbers, the binomial identities of Vandermonde, Lucas and Kummer, the combinatorial number families, base-b digits of naturals and the solution space of a linear recurrence with its characteristic polynomial are in the pinned libraries and are cited as baseline declarations. Three of the audit's missing targets are planned here: the minimal polynomial of a linearly generated sequence, the rationality predicate for a formal power series, and the three-way equivalence between rationality of the generating function, the linear recurrence and the closed form, the last including the polynomial coefficients that a repeated root forces.

**Remaining in this layer:**

- Companion matrices in general rank, with the characteristic polynomial equal to the prescribed monic polynomial. Tau Ceti has the rank two case; no source read here treats the general case, and it is not planned.
- General Lucas sequences and their strong divisibility, and strong divisibility of elliptic divisibility sequences. The audit records Fibonacci strong divisibility and the elliptic net property as present.
- Euler numbers, that is the secant and zigzag numbers, which are absent from both libraries.
- The p-adic digit expansion as an equivalence between the p-adic integers and sequences of digits, and uniqueness of base-b expansions of reals.
- Automatic sequences: automata with output, k-kernels, the Thue-Morse sequence and Cobham's theorem, and with them Christol's theorem. Nothing in either library and no free source obtained for this packet.
- Farey sequences with mediants and the neighbour property, absent from both libraries and from every source read here.
- The convergent Bernoulli generating function on the disc of radius two pi, and a general transfer theorem from formal to analytic identities.

Bernoulli numbers, the binomial identities, the combinatorial number families and base-`b`
digits are all in the libraries. The solution space of a linear recurrence and its characteristic polynomial
are there too, with the geometric solutions attached to the roots.

What is missing, and planned here, is the part that repeated roots break. A root of multiplicity `dᵢ`
contributes not a geometric sequence but a polynomial of degree `< dᵢ` times a geometric sequence, and the
clean statement of that is Stanley's three-way equivalence: rational generating function, linear recurrence,
closed form. The rationality predicate itself is missing from the libraries and is planned as a definition, and
the minimal polynomial of a linearly generated sequence, which is the denominator in lowest terms, is planned
as a construction from Shoup's ideal-theoretic treatment.

**Planets of this layer** (3): *Minimal polynomial of a sequence*, *Rational power series*, *Rational generating functions*.

### Nodes (3)

#### `generating-polynomials-and-the-minimal-polynomial` — Linearly generated sequences and their minimal polynomial

*construction.* **Planet:** *Minimal polynomial of a sequence*.

**Statement.** Let F be a field, V an F-vector space and s an infinite sequence of elements of V. Call s linearly generated if it satisfies a linear recurrence with constant coefficients in F. For a polynomial g write g applied to s for the linear combination of the terms of s with the coefficients of g, and call g a generating polynomial of s if that combination vanishes on every shift of s. Then the set of generating polynomials of s is an ideal of the polynomial ring, s is linearly generated exactly when that ideal is nonzero, and the monic generator of the ideal, called the minimal polynomial of s, is the unique monic polynomial dividing every generating polynomial.

**Hypotheses.**

- F is a field and V an F-vector space, not assumed finite dimensional.
- The sequence is indexed by the natural numbers.
- The zero polynomial is a generating polynomial of every sequence and is excluded when the minimal polynomial is normalised.

**Construction, or proof, in steps.**

1. Define the pairing between a polynomial and the sequence, and check that it is additive in the polynomial and homogeneous for scalars.
2. Check that the set of generating polynomials is closed under addition, under multiplication by scalars and under multiplication by the indeterminate, and conclude that it is an ideal.
3. Use that the polynomial ring over a field is a principal ideal ring to write the ideal as generated by one polynomial, and normalise it to be monic when it is nonzero.
4. Record the equivalence: s is linearly generated exactly when the ideal is nonzero, and the coefficients of the recurrence are read off from the generator.
5. Record the two examples the source gives: for the sequence of powers of an element of a quotient of the polynomial ring the minimal polynomial of the sequence is the minimal polynomial of the element, and for the sequence of images of a vector under the iterates of a linear map it is the minimal polynomial of that vector under the map.

**Acceptance.**

- The generating polynomials form an ideal, not merely a subspace; closure under multiplication by the indeterminate is the shift invariance and is what makes the minimal polynomial divide every generating polynomial.
- The minimal polynomial is monic and unique.
- For the sequence of powers of an element the construction returns the usual minimal polynomial of that element, which is the compatibility a user needs.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Sequence.IsLinearlyGenerated` | data | The predicate that a sequence satisfies a linear recurrence with constant coefficients. |
| `Sequence.generatingIdeal` | data | The ideal of generating polynomials of a sequence. |
| `Sequence.minPoly` | data | The monic generator of that ideal, the minimal polynomial of the sequence. |
| `Sequence.minPoly_dvd` | characterisation | A polynomial is a generating polynomial exactly when the minimal polynomial divides it. |
| `Sequence.minPoly_of_powers` | compatibility | For the sequence of powers of an element of a finite extension the minimal polynomial of the sequence is the minimal polynomial of the element. |
| `Sequence.isLinearlyGenerated_iff` | characterisation | A sequence is linearly generated exactly when its minimal polynomial is nonzero. |

**Uses.**

- `ClassicalArithmeticCompletion:CA.2/rational-iff-linearly-generated`: the minimal polynomial is the denominator of the generating function in lowest terms
- `ClassicalArithmeticCompletion:CA.2/rational-power-series`: the rationality predicate is stated against the same recurrence

**Unit tests.** A plausible wrong definition fails one of these.

- `all_zero_sequence`: The only sequence for which the constant polynomial one is a generating polynomial is the zero sequence.
- `fibonacci`: The Fibonacci sequence has minimal polynomial X squared minus X minus one.
- `powers_of_an_element`: For the sequence of powers of an element of a field extension, the minimal polynomial of the sequence is the minimal polynomial of the element.
- `ideal_not_just_subspace`: The set of generating polynomials is closed under multiplication by the indeterminate; a definition that only asks for a subspace admits sets that are not ideals and has no well defined monic generator.

**Prerequisites.**

- `mathlib:Ideal.span`
- `mathlib:IsPrincipalIdealRing`
- `mathlib:Polynomial.Monic`
- `mathlib:Polynomial.degree`
- `mathlib:LinearRecurrence`

**Sources.**

- SHOUP.V2 — Victor Shoup, *A Computational Introduction to Number Theory and Algebra (Version 2)*, Section 18.1 (printed pp. 486 to 489): the definition of a linearly generated sequence, the definition of a generating polynomial, Theorem 18.1, and Examples 18.2 and 18.3.

  > s is linearly generated over F if there exist scalars c_0 to c_{k-1} such that the recurrence holds; equivalently, if there is a non-zero g with (X^i g) applied to s equal to 0 for all i, and such a g is a generating polynomial. Theorem 18.1. The set of generating polynomials is an ideal of F[X]. Since all ideals of F[X] are principal, we call its monic generator the minimal polynomial of s.

  The node is that definition and theorem together with the normalisation of the minimal polynomial and the two examples the source gives immediately after, which are what pin the construction against the minimal polynomial a reader already knows.

#### `rational-power-series` — The rationality predicate for a formal power series

*definition.* **Planet:** *Rational power series*.

**Statement.** Let K be a field. A formal power series over K is rational if it is equal, in the field of Laurent series, to the quotient of a polynomial by a polynomial with nonzero constant term. Equivalently there are polynomials P and Q with Q having constant term one such that the power series multiplied by Q is P. The degree condition that the numerator has degree less than that of the denominator is not part of the predicate and is a normalisation used in the equivalence with recurrences.

**Hypotheses.**

- K is a field.
- The denominator has nonzero constant term, so that its inverse exists as a power series.
- The predicate is about the power series and not about a chosen pair of polynomials.

**Construction, or proof, in steps.**

1. Define the predicate as the existence of such a pair.
2. Check that it does not depend on the choice of the pair, and that it is equivalent to lying in the image of the embedding of rational functions with no pole at zero into power series.
3. Check that the rational power series form a subring containing the polynomials and closed under the inverse of a series with invertible constant term.
4. Record that the pinned library has the embedding of rational functions into Laurent series but no such predicate, which is what makes this a node.

**Acceptance.**

- The predicate is on the series, not on a presentation; two different pairs of polynomials give the same predicate.
- The polynomials are rational, and so is the inverse of any series with invertible constant term.
- The exponential series is not rational, which is the non-example that distinguishes the predicate from being a formal power series at all.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `PowerSeries.IsRational` | data | The predicate that a formal power series is a quotient of polynomials with invertible denominator. |
| `PowerSeries.IsRational.polynomial` | constructor | Every polynomial is rational. |
| `PowerSeries.IsRational.inv` | constructor | The inverse of a series with invertible constant term is rational when the series is. |
| `PowerSeries.IsRational.subring` | structure | The rational power series form a subring. |
| `PowerSeries.isRational_iff_mem_range` | characterisation | A series is rational exactly when it lies in the image of the rational functions without a pole at zero. |

**Uses.**

- `ClassicalArithmeticCompletion:CA.2/rational-iff-linearly-generated`: the equivalence is stated with this predicate on one side
- `ClassicalArithmeticCompletion:CA.2/generating-polynomials-and-the-minimal-polynomial`: the denominator of a rational generating function is the reverse of the minimal polynomial of the coefficient sequence

**Unit tests.** A plausible wrong definition fails one of these.

- `geometric_series`: The series with all coefficients one is rational, being the inverse of one minus the indeterminate.
- `polynomial`: Every polynomial is rational.
- `exponential_not_rational`: Over a field of characteristic zero the series with coefficients the reciprocals of the factorials is not rational, since its coefficient sequence satisfies no linear recurrence with constant coefficients.

**Prerequisites.**

- `mathlib:PowerSeries`
- `mathlib:PowerSeries.coeff`
- `mathlib:PowerSeries.inv`
- `mathlib:RatFunc`
- `mathlib:LaurentSeries`

**Sources.**

- STANLEY.EC1 — Richard P. Stanley, *Enumerative Combinatorics, Volume 1, second edition*, Section 4.1, the statement of Theorem 4.1.1, condition (i).

  > The following conditions on a function f from the natural numbers to the complex numbers are equivalent: (i) the sum over n at least 0 of f(n) x^n equals P(x) over Q(x), where Q(x) equals 1 plus alpha_1 x plus ... plus alpha_d x^d and P(x) is a polynomial in x of degree less than d.

  The node is the predicate that condition (i) quantifies over, isolated as a definition. The source states it with the normalisation that the denominator has constant term one and the numerator has smaller degree; the node keeps the first as part of the predicate and records the second as a normalisation, since it is a consequence for a series and not a restriction.

#### `rational-iff-linearly-generated` — Rational generating functions, linear recurrences and closed forms

*theorem.* **Planet:** *Rational generating functions*.

**Statement.** Fix complex numbers alpha_1 to alpha_d with d at least one and alpha_d nonzero, and put Q equal to one plus the sum of alpha_i times the i-th power of the indeterminate. For a function f from the natural numbers to the complex numbers the following are equivalent: the generating function of f is the quotient of a polynomial of degree less than d by Q; f satisfies, for every n, the linear recurrence whose coefficients are the alpha_i; and f is the sum over the distinct nonzero reciprocal roots gamma_i of Q, with multiplicities d_i, of a polynomial of degree less than d_i in n times the n-th power of gamma_i.

**Hypotheses.**

- The alpha_i are complex numbers with alpha_d nonzero, so Q has degree exactly d and nonzero constant term.
- The gamma_i are the distinct nonzero numbers with Q equal to the product of one minus gamma_i times the indeterminate, raised to the multiplicity d_i.
- The third condition is the closed form, including the case of repeated roots, where the coefficient is a polynomial in n and not a constant.

**Construction, or proof, in steps.**

1. Introduce the four complex vector spaces the source compares: the functions satisfying each of the three conditions, and the functions whose generating function is a combination of the partial fractions attached to the roots.
2. Show the last has dimension d, by exhibiting the partial fractions as a spanning set of the right cardinality and proving their linear independence by multiplying a putative relation by the appropriate power and evaluating at the reciprocal of a root.
3. Show the first has dimension d, since the numerator's d coefficients are free, and that the second has dimension d, since the first d values are free and determine the rest.
4. Show the third has dimension at most d and contains the fourth, and conclude that all four coincide by comparing dimensions.
5. Record the two consequences the layer needs: a sequence is linearly generated exactly when its generating function is rational, and the closed form for a repeated root carries a polynomial factor in n.

**Acceptance.**

- The closed form has polynomial coefficients in n, of degree less than the multiplicity; a statement with constant coefficients is false as soon as Q has a repeated root, and the simplest witness is Q equal to one minus the indeterminate squared.
- The equivalence fixes the denominator Q, so it is a statement about a fixed recurrence and not only about the existence of some recurrence.
- The condition alpha_d nonzero is needed for the degree of Q, and the roots gamma_i are nonzero because Q has nonzero constant term.

**Prerequisites.**

- `ClassicalArithmeticCompletion:CA.2/rational-power-series`
- `ClassicalArithmeticCompletion:CA.2/generating-polynomials-and-the-minimal-polynomial`
- `mathlib:LinearRecurrence`
- `mathlib:LinearRecurrence.charPoly`
- `mathlib:Polynomial.roots`

**Sources.**

- STANLEY.EC1 — Richard P. Stanley, *Enumerative Combinatorics, Volume 1, second edition*, Theorem 4.1.1 with its proof (printed pp. 535 to 536).

  > Let alpha_1, ..., alpha_d be complex numbers, alpha_d nonzero. The following are equivalent: (i) the generating function is P(x)/Q(x), P of degree less than d; (ii) for all n, f(n+d) + alpha_1 f(n+d-1) + ... + alpha_d f(n) = 0; (iii) f(n) is the sum over i of P_i(n) gamma_i^n, where Q is the product of (1 - gamma_i x)^{d_i}, the gamma_i distinct and nonzero, and P_i of degree less than d_i.

  The node is that theorem with all three conditions, including the repeated-root closed form of (iii), which is exactly what the reviewed library audit of this layer records as missing; the proof steps follow the source's dimension count over the four spaces.

---

## CA.3 Polynomial and matrix arithmetic

**Coverage: partial.** Eisenstein and the other irreducibility criteria, resultants with the root-product formula, discriminants of polynomials with the root-difference formula and the reduction criterion, and the elementary-divisor form of the structure theorem are in the pinned libraries and are cited as baseline declarations. Two of the audit's missing targets are planned here: the Smith normal form of a rectangular or singular integer matrix, with invertible transformation matrices and the divisibility chain, and the invariant-factor form of the structure theorem that follows from it.

**Remaining in this layer:**

- The Hermite normal form over the integers, with existence and uniqueness. Absent from both libraries and from every source read here.
- The ring of integer-valued polynomials and Polya's theorem. Tau Ceti has the binomial basis and integral Newton interpolation; the ring itself and the theorem are not planned.
- The rational canonical form of an endomorphism in general rank; Tau Ceti has the two by two non-scalar case.
- Trinomial discriminant formulas and resultants of binary forms, both recorded by the audit as absent.
- Effective ideal arithmetic: ideal bases through the Hermite normal form and terminating normal-form algorithms. This is an algorithmic layer with its own sources.

The irreducibility criteria, resultants and discriminants are in the libraries, and so is the
structure theorem for finitely generated modules over a principal ideal domain — but in **elementary-divisor**
form, as a free part plus a sum of quotients by prime powers. The invariant-factor form, with the chain
`d₁ | d₂ | ⋯`, is a different statement, and it is the one that a Smith normal form produces.

Both are planned here: the Smith normal form of a rectangular, possibly singular integer matrix, with
invertible transformation matrices and the divisibility chain, and the invariant-factor structure theorem that
follows from it. Tau Ceti has the square nonsingular case for Gram matrices of lattices; this is the general
one. The Hermite normal form, the ring of integer-valued polynomials, the rational canonical form in general
rank and effective ideal arithmetic stay in the remaining list.

**Planets of this layer** (1): *Smith normal form*.

### Nodes (2)

#### `smith-normal-form-of-an-integer-matrix` — Smith normal form of a rectangular integer matrix

*construction.* **Planet:** *Smith normal form*.

**Statement.** Let A be an integer matrix with n rows and m columns. Then there are invertible integer matrices P and Q, of sizes n by n and m by m, such that the product P times A times Q has nonzero entries only on the diagonal, and those entries are positive integers n_1 to n_s followed by zeros, with n_1 dividing n_2, dividing n_3 and so on up to n_s. The integers n_1 to n_s and the number of zeros are determined by A.

**Hypotheses.**

- A is an arbitrary integer matrix; it is not assumed square, and its determinant is not assumed nonzero.
- P and Q are invertible over the integers, that is, of determinant plus or minus one.
- The divisibility chain is part of the statement, and the diagonal entries are positive.

**Construction, or proof, in steps.**

1. Perform integer row and column operations to move a nonzero entry of least absolute value into the top left corner.
2. Reduce every other entry of the first row and of the first column modulo that entry and repeat; the absolute value of the corner strictly decreases unless the row and the column are already cleared, so the process terminates.
3. If some entry of the remaining block is not divisible by the corner, add the row containing it to the first row and repeat the previous step; this again strictly decreases the corner and terminates, and at the end the corner divides every entry.
4. Recurse on the remaining block to produce the chain.
5. Record uniqueness of the diagonal entries, which the source obtains by reinterpreting the cokernel.

**Acceptance.**

- The statement covers rectangular and singular matrices, which is what the pinned libraries lack; the square nonsingular case is already in Tau Ceti for Gram matrices.
- The divisibility chain is asserted, not merely diagonality; a diagonal form without it is not unique.
- The transformation matrices are invertible over the integers, not over the rationals.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Matrix.smithNormalForm` | data | The diagonal form of an integer matrix, together with the two transformation matrices. |
| `Matrix.smithNormalForm_spec` | characterisation | The defining equation, that the product of the three matrices is diagonal with the stated entries. |
| `Matrix.smithInvariantFactors` | data | The list of positive diagonal entries. |
| `Matrix.smithInvariantFactors_dvd` | structure | Each invariant factor divides the next. |
| `Matrix.smithInvariantFactors_unique` | characterisation | The invariant factors and the number of zeros are determined by the matrix. |
| `Matrix.smithNormalForm_isUnit` | instance | The two transformation matrices are invertible over the integers. |

**Uses.**

- `ClassicalArithmeticCompletion:CA.3/invariant-factor-decomposition`: the structure theorem is read off from the Smith form of a presentation matrix
- `ClassicalArithmeticCompletion:CA.4/integer-linear-systems`: the solution set of an integer linear system is read off from the same form

**Unit tests.** A plausible wrong definition fails one of these.

- `two_by_three`: For the matrix with rows (2, 4, 6) and (3, 6, 9) the invariant factors are 1 and nothing else, with two zero columns; a computation returning 2 and 3 has not imposed the divisibility chain.
- `singular_square`: For the two by two matrix with rows (2, 0) and (0, 0) the form is itself, with one invariant factor 2 and one zero.
- `chain_is_not_automatic`: For the diagonal matrix with entries 2 and 3 the Smith form is the diagonal matrix with entries 1 and 6, not the original, since 2 does not divide 3.
- `transformations_are_unimodular`: The transformation matrices have determinant plus or minus one; allowing rational matrices makes every nonsingular matrix equivalent to the identity and destroys the invariants.

**Prerequisites.**

- `mathlib:Matrix.det`
- `mathlib:Matrix.GeneralLinearGroup`
- `mathlib:Ideal.smithCoeffs`
- `tauceti:TauCeti.IntegralLattice.exists_gramSmithInvariantFactors_smith_normal_form`
- `tauceti:TauCeti.IntegralLattice.gramSmithInvariantFactors_dvd`

**Sources.**

- STEIN.ANT — William Stein, *Algebraic Number Theory, a Computational Approach*, Proposition 2.1.5 with the paragraph introducing it (Section 2.1).

  > Suppose A is an n by m integer matrix. Then there exist invertible integer matrices P and Q such that P A Q only has nonzero entries along the diagonal, and these entries are n_1, n_2, ..., n_s, 0, ..., 0, where s at least 0, n_1 at least 1 and n_1 divides n_2 divides ... divides n_s.

  The node is that proposition; the proof steps are the source's row and column reduction, with the termination argument made explicit because it is what an implementation must supply.

#### `invariant-factor-decomposition` — The structure theorem in invariant-factor form

*theorem.*

**Statement.** Let G be a finitely generated abelian group. Then G is isomorphic to a direct sum of cyclic groups of orders n_1 to n_s and a free abelian group of rank r, where n_1 is greater than one and n_1 divides n_2, dividing n_3 and so on up to n_s. The integers r and n_1 to n_s are determined by G.

**Hypotheses.**

- G is a finitely generated abelian group.
- The n_i satisfy the divisibility chain and are each greater than one; this is the invariant-factor form and not the elementary-divisor form.

**Construction, or proof, in steps.**

1. Choose generators to write G as the cokernel of a homomorphism between two finitely generated free abelian groups, using that a subgroup of a finitely generated abelian group is finitely generated.
2. Choose bases to present that homomorphism by an integer matrix.
3. Apply the Smith normal form to the matrix and read off the cokernel as the displayed direct sum, the invariant factors giving the torsion part and the zero columns the free part.
4. Prove uniqueness by recovering the invariant factors from the group, for instance from the orders of the quotients by the subgroups of elements killed by a fixed integer.

**Acceptance.**

- The conclusion is the invariant-factor form with a divisibility chain, which the pinned library does not have; it has the elementary-divisor form, and the two are related by the Chinese remainder theorem but are different statements.
- The data r and the n_i are determined by G, which is what makes them invariants.
- For G the direct sum of a cyclic group of order two and one of order three, the invariant-factor form is a single cyclic group of order six.

**Prerequisites.**

- `ClassicalArithmeticCompletion:CA.3/smith-normal-form-of-an-integer-matrix`
- `mathlib:Module.equiv_free_prod_directSum`
- `mathlib:Module.equiv_directSum_of_isTorsion`
- `mathlib:Module.Finite`
- `mathlib:Module.Free`
- `mathlib:AddCommGroup`

**Sources.**

- STEIN.ANT — William Stein, *Algebraic Number Theory, a Computational Approach*, Theorem 2.1.2, Proposition 2.1.3 and Corollary 2.1.4 (Section 2.1).

  > Let G be a finitely generated abelian group. Then there is an isomorphism of G with a direct sum of the integers modulo n_1, ..., modulo n_s, and the integers to the r, where r, s at least 0, n_1 greater than 1 and n_1 divides n_2 divides ... divides n_s. Furthermore, the n_i and r are uniquely determined by G. If H is a subgroup of a finitely generated abelian group, then H is finitely generated.

  The node is that theorem with the source's route to it through a presentation and the Smith normal form; the elementary-divisor form is a baseline citation and the invariant-factor form is what is planned.

---

## CA.4 Classical Diophantine equations

**Coverage: partial.** The Pell equation with its fundamental solution and the classification of all solutions, Fermat's two-square theorem, Lagrange's four-square theorem, the descent results including Fermat's last theorem for the exponents three and four, and the classification of Pythagorean triples are in the pinned libraries and are cited as baseline declarations. One of the audit's missing targets is planned here: the solvability criterion and the full parametrisation of the solutions of an integer linear system, through the Smith normal form of the previous layer, which specialises to the classical parametrisation of a linear Diophantine equation in two unknowns.

**Remaining in this layer:**

- The negative and generalised Pell equations and the continued fraction algorithm that decides them. No source read for this packet treats continued fractions; Shoup says explicitly that they are not discussed in his book.
- Legendre's three-square theorem and Jacobi's representation counts, both absent from the libraries and from the sources read.
- Exponential Diophantine equations such as Catalan-Mihailescu and Ramanujan-Nagell, each of which needs its own primary source.
- The routing interface from genus-one and higher-genus equations to the rational-point owners, preserving primitivity and local solubility. This is an interface and not a theorem, and the audit records that nothing on the transfer side exists.
- Numerical semigroup theory beyond the Frobenius number of two coprime generators: genus, the gap count, Apery sets and symmetry.
- Egyptian-fraction identities with precise finite or asymptotic claims.

Pell, two squares, four squares, descent and Pythagorean triples are all in the libraries.
The linear side is not: Mathlib proves that `ax + by = n` is solvable when the greatest common divisor divides
`n`, and neither parametrises the solutions nor treats a system.

The node here does both, through the Smith normal form of the previous layer: the system `Ax = b` has an
integer solution exactly when the transformed right-hand side is divisible entry by entry by the invariant
factors and vanishes below them, and the solution set is then a coset of a free group whose basis is read off
from the columns of the second transformation matrix. The classical two-unknown parametrisation is the case of
one equation.

**Planets of this layer** (1): *Integer linear systems*.

### Nodes (1)

#### `integer-linear-systems` — Integer linear systems and the parametrisation of their solutions

*construction.* **Planet:** *Integer linear systems*.

**Statement.** Let A be an integer matrix with n rows and m columns and let b be an integer vector of length n. Write the Smith normal form of A as the product of P, A and Q, diagonal with invariant factors n_1 to n_s. Then the system A x equals b has an integer solution if and only if, writing c for P times b, the i-th entry of c is divisible by n_i for i at most s and the remaining entries of c are zero; and in that case the set of all integer solutions is a coset of the kernel of A, which is the free abelian group of rank m minus s spanned by the last m minus s columns of Q.

**Hypotheses.**

- A and b have integer entries; no rank or squareness hypothesis is made.
- The Smith normal form and its transformation matrices are those of the previous layer's node.
- The parametrisation is of the full solution set over the integers, not over the rationals.

**Construction, or proof, in steps.**

1. Change variables by y equal to the inverse of Q applied to x, so that the system becomes the diagonal system with right hand side P times b.
2. Solve the diagonal system entry by entry: the first s entries are determined by divisibility, and the remaining entries are free.
3. Read off the solvability criterion and a particular solution.
4. Translate back through Q to describe the solution set as a coset of the span of the last m minus s columns of Q, and check that that span is the kernel of A.
5. Record the special case of one equation in two unknowns, which is the classical parametrisation of a linear Diophantine equation.

**Acceptance.**

- Both halves are needed: the criterion and the parametrisation. The pinned library has solvability for one equation in two unknowns and neither the general criterion nor any parametrisation.
- The kernel is free of rank m minus s, so the solution set is a coset of a free group of that rank, not a single solution.
- For one equation a x plus b y equals n with g the greatest common divisor of a and b, the criterion is that g divides n and the parametrisation is the classical one with step b over g and minus a over g.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Matrix.IntSolvable` | data | The predicate that an integer linear system has an integer solution. |
| `Matrix.intSolvable_iff` | characterisation | The divisibility criterion on the transformed right hand side. |
| `Matrix.intSolutionSet` | data | The set of integer solutions, as a coset of the kernel. |
| `Matrix.intKernel_basis` | structure | A basis of the kernel, given by the last columns of the second transformation matrix. |
| `Matrix.intSolutionSet_eq` | characterisation | The solution set is the particular solution plus the span of that basis. |

**Uses.**

- `ClassicalArithmeticCompletion:CA.3/invariant-factor-decomposition`: the same diagonalisation gives the structure of the cokernel
- `ClassicalArithmeticCompletion:CA.4`: the layer's linear Diophantine target is the case of one equation

**Unit tests.** A plausible wrong definition fails one of these.

- `one_equation`: For 6 x plus 10 y equal to 4 the greatest common divisor is 2, which divides 4, and the solutions are x equal to minus 1 plus 5 t, y equal to 1 minus 3 t.
- `unsolvable`: For 6 x plus 10 y equal to 3 there is no integer solution, although there is a rational one; a criterion over the rationals is the wrong one.
- `kernel_rank`: For the one by two matrix with entries 6 and 10 the kernel is free of rank one, generated by (5, minus 3).

**Prerequisites.**

- `ClassicalArithmeticCompletion:CA.3/smith-normal-form-of-an-integer-matrix`
- `mathlib:Matrix.GeneralLinearGroup`
- `mathlib:Module.Free`

**Sources.**

- STEIN.ANT — William Stein, *Algebraic Number Theory, a Computational Approach*, Section 2.1, the paragraphs reinterpreting a presentation as a matrix and the cokernel as the group, with Proposition 2.1.5.

  > We view the homomorphism as left multiplication by the n by m matrix A whose columns are the images of the generators. The cokernel of A is the quotient of the integers to the n by the image of A, and this cokernel is isomorphic to G. The following proposition implies that we may choose bases such that the matrix only has nonzero entries along the diagonal.

  The node is the solvability and parametrisation statement obtained from that reinterpretation: the source diagonalises the matrix and describes the cokernel, and the criterion for b to lie in the image and the description of the kernel are the two readings of the same diagonalisation. The source does not state them as a theorem about linear systems, and the proof steps carry that derivation.

---

## CA.5 Number-field arithmetic handoff

**Coverage: source_decomposed.** The reviewed library audit gives this layer the verdict process: every one of its targets is an instruction to reuse an object that another layer or another roadmap owns, and the audit records each of them as already present in the pinned libraries, namely integral bases, unit groups with Dirichlet's theorem and the regulator, class groups with finiteness, the Minkowski bound and several explicit class numbers, relative discriminants and the different, Frobenius elements, and ideal factorisation through Dedekind-Kummer. The layer therefore has no mathematics of its own and gets no nodes, as the job instructions require for a process layer, and its removal is proposed in the restructure list. The one target the audit flags as partial, a certification pipeline from matrix computations to intrinsic invariants, is recorded there as belonging to ComputationalNumberTheory CN.2, so it is not this layer's work either.

The audit's verdict here is **process**, and the job instructions say what that means: a process
layer is not mathematics, gets no nodes, and its removal is proposed. Every target of this layer is an
instruction to reuse something another layer owns — integral bases, unit groups and the regulator, class
groups and the Minkowski bound, relative discriminants and the different, Frobenius elements, ideal
factorisation — and the audit records every one of them as already present in the pinned libraries.

The removal proposal is in the packet's `restructure` list, together with the suggestion that the layer's
content survive as stage links, so that the dependency it records is not lost when the layer goes.

### Nodes (0)

---

## CA.6 Special algebraic numbers and Mahler measure

**Coverage: partial.** The Mahler measure of a complex polynomial with multiplicativity and the root formula, the house of an algebraic number, the Northcott finiteness statements and the characterisation of roots of unity among algebraic integers are in the pinned libraries and are cited as baseline declarations. Nothing is planned here: every one of the audit's missing targets needs a source that was sought and not obtained.

**Remaining in this layer:**

- The Mahler measure of an algebraic number, defined as that of its minimal polynomial over the integers. The definition is short but is not planned without a source that states it, and the survey that does was not obtained.
- Pisot and Salem numbers with the certified classification by conjugate moduli.
- The comparison log of the Mahler measure equals the degree times the Weil height, and canonical heights of polarised dynamical systems.
- Smyth's, Dobrowolski's and Schinzel-Zassenhaus's lower bounds, with Lehmer's problem kept conjectural. The natural free source is Chris Smyth's survey on the Mahler measure of algebraic numbers; the author's page refused the download in this session and no arXiv version was located, which is recorded as a gap.

The Mahler measure of a **polynomial** is in Mathlib, with multiplicativity and the root
formula; so is the house of an algebraic number, and so are the Northcott finiteness statements and Kronecker's
theorem. The Mahler measure of an **algebraic number** — that of its minimal polynomial over `ℤ` — is not,
and neither are Pisot and Salem numbers, the comparison with the Weil height, or the lower bounds of Smyth,
Dobrowolski and Schinzel–Zassenhaus.

Nothing is planned here, for one reason: the free survey that states all of it with proofs could not be
downloaded in this session. Two routes were tried and both failed; the gap records exactly that, so that a
continuation job with access to it can plan the whole layer at once rather than repeat the search.

### Nodes (0)

---

## CA.7 Integral Galois modules and orders

**Coverage: not_read.** Integral Galois module structure. The reviewed audit records almost the whole layer as absent from both libraries: rings of integers as modules over a group ring, locally free class groups of orders, Galois resolvents in Frohlich's sense, Noether's theorem on tame ramification and local normal integral bases, the Hilbert-Speiser theorem, the Frohlich-Taylor class-group theorems, and orders in semisimple algebras. No source for any of this was obtained for this packet, so no node is planned and the layer is honestly marked as not read rather than partial.

**Remaining in this layer:**

- A free source for Galois module structure. Frohlich's book is not freely available; a continuation job should look for lecture notes or survey articles that state Noether's theorem and the Hilbert-Speiser theorem with proofs, and plan from those.
- The group-ring module structure on the ring of integers, on which everything else in the layer rests. The Galois action itself is in the pinned libraries and is the starting point.
- The normal basis theorem in its integral form. The audit records the rational normal basis theorem as present in Mathlib but missing from the declaration index; that claim was not re-checked for this packet beyond noting that no declaration matching the name appears in the pinned index.

This layer is marked **not read**, which is the honest status. Almost everything in it — rings
of integers as modules over group rings, locally free class groups of orders, Galois resolvents, Noether's
theorem, Hilbert–Speiser, the Fröhlich–Taylor theorems, orders in semisimple algebras — is recorded by the
audit as absent from both libraries, and no free source for any of it was obtained.

It is also, as the packet's second structural proposal argues, a different subject from everything else in this
roadmap: it shares no object, no source and no technique with CA.0 to CA.6. The proposal is to move it out.

### Nodes (0)

---

## Gaps

Each of these is something this packet could not establish from the sources read. None is papered over,
and no node depends on one without naming it.

### The free survey needed for CA.6 could not be downloaded

Every missing target of CA.6 - the Mahler measure of an algebraic number, Pisot and Salem numbers, the comparison with the Weil height, and the lower bounds of Smyth, Dobrowolski and Schinzel-Zassenhaus - is covered by Chris Smyth's survey on the Mahler measure of algebraic numbers. Two paths to a free copy were tried in this session: the author's page at the University of Edinburgh, which answered with a refusal rather than the file, and a search for an arXiv version, which did not turn one up. No node of CA.6 is planned, and the layer's coverage record lists each target as remaining. A continuation job with access to that survey, or to another free source stating these results with proofs, can plan the whole layer from it.

### No free source for integral Galois module structure was obtained

CA.7 asks for rings of integers as modules over group rings, locally free class groups of orders, Noether's theorem relating tame ramification to local freeness, the Hilbert-Speiser theorem and the Frohlich-Taylor theorems. The standard reference is Frohlich's book on Galois module structure of algebraic integers, which is not freely available, and no free lecture notes or survey covering the same ground were obtained in this session. The layer is marked not read, which is what the coverage vocabulary has for exactly this situation, and nothing is planned from memory.

### Continued fractions are not in the source read, so the Pell remainder is unsourced

CA.4's negative and generalised Pell equations are decided by the continued fraction expansion of a square root, and Shoup's book, which is otherwise the source for the elementary layers of this roadmap, says in its preface that continued fractions are not discussed in it. Stein's computational algebraic number theory book treats Pell's equation through unit groups rather than through continued fractions. Neither supplies the algorithm, so it is recorded as remaining rather than planned, and a continuation job needs a source for it.

### No free source for automatic sequences, Christol's theorem or Farey sequences

Three of CA.2's targets - automatic sequences with k-kernels and Cobham's theorem, Christol's theorem relating algebraic power series over a finite field to automatic coefficients, and Farey sequences with the neighbour property - are absent from both pinned libraries and from all three sources read for this packet. The standard references are books that are not freely available. The three are listed in CA.2's remaining list, and a continuation job should obtain a source before planning any of them.

### The job names a retired roadmap as a supplier

The issue for this job names BP-FoundationsAndLibraryIntegration among its suppliers. That roadmap was retired on 16 September 2026 and is listed in data/roadmap-retirements.json, and the blueprint checker warns on any prerequisite naming one of its stages. No node of this packet names it, and the targets it would have supplied - the elementary arithmetic that CA.0 rests on - are cited directly to the pinned libraries instead. This is recorded here so that the maintainer can see that the supplier list of this job is stale rather than that the supplier was ignored.

## Structural proposals

Recorded in the packet's `restructure` list. This packet works with the current structure.

### CA.5 is a process layer and should be removed (`remove-layer`)

The reviewed library audit gives ClassicalArithmeticCompletion:CA.5 the verdict process. Its seven targets are all instructions to reuse objects owned elsewhere - integral bases, unit groups and the regulator, class groups and the Minkowski bound, relative discriminants and the different, Frobenius elements, ideal factorisation - and the audit records every one of them as already present in the pinned libraries. There is no mathematics for a blueprint to plan, and the job instructions for this kind say that a process layer gets no nodes and that its removal should be proposed. The proposal is to remove the layer and to keep its content as stage links from the layers that own those objects to the layers of this roadmap that consume them, so that the dependency the layer records is not lost. The one target the audit calls partial, a certification pipeline from matrix computations to intrinsic invariants, is recorded there as belonging to ComputationalNumberTheory CN.2 and should be linked there rather than kept here.

### CA.7 is a different subject and should not sit in this roadmap (`split-roadmap`)

Layers CA.0 to CA.6 are elementary and classical: divisibility, reciprocity, sequences, polynomial and matrix arithmetic, Diophantine equations, and heights of algebraic numbers. CA.7 is integral Galois module structure: rings of integers as modules over group rings, locally free class groups of orders, Noether's theorem, Hilbert-Speiser, and the Frohlich-Taylor theorems. It shares no object, no source and no technique with the rest of the roadmap; the audit records essentially all of it as absent from both libraries, and its literature is a separate one. Keeping it here means that this roadmap can never be closed for a reason unrelated to everything else it contains, which is what has happened in this packet: seven layers have a verdict and a plan, and the eighth has neither because its sources are not free. The proposal is to move CA.7 out, either into the roadmap that owns Galois cohomology and Galois modules or as a small roadmap of its own with its own source route.

## Checks

    python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalArithmeticCompletion.json

Zero errors and zero warnings against the pinned declaration index.
