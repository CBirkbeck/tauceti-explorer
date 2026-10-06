# K-theory of number fields and S-integers — regular primes, Bernoulli numbers and certified examples

Blueprint for the roadmap `ArithmeticKTheory`, stages **N.7** and **N.8**, job `BP-ArithmeticKTheory--N.7`
(issue #678). Packet: `research/blueprint/packets/ArithmeticKTheory--N.7.json`. Suggested Lean file:
`research/blueprint/suggested/ArithmeticKTheory--N.7.lean`. Handoff:
`research/blueprint/handoff/BP-ArithmeticKTheory--N.7.md`.

**N.7 and N.8 are `source_decomposed`**; the packet is `complete`. 20 nodes (4 definitions,
1 construction, 1 lemma, 8 theorems, 1 comparison, 5 applications), 34 API items, 25 unit
tests, 10 planets; 44 pinned declarations cited, 3 gaps, 10 requests, 4 structural proposals.
No layer is `closed`: source gaps and supplier requests remain. Planning closure is not Lean
formalisation; nothing here is formalised. Round two of the red-team fix
(FIX-RT-BP-ArithmeticKTheory--N.7~2, issue #5713) adds the two generation proofs of N.8: Tate's
method gives K₂(ℤ[i]) = 0, and restriction to ℚ(ζ₅) with transfer, together with Tate's
description of two-torsion, shows that {−1, −1} and {−1, ε} generate K₂ of the integers of
ℚ(√5). Report: `research/blueprint/redteam/RT-BP-ArithmeticKTheory--N.7.fixes-2.md`.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## The sources

- **`Kbook.2013`** — Charles A. Weibel, *The K-book: An Introduction to Algebraic K-theory*. Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013)
  <https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf>, read 2026-09-24. SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
- **`Tate.1976`** — John Tate, *Relations between K₂ and Galois cohomology*. Inventiones mathematicae 36 (1976), 257–274; the journal pages as scanned by the Göttingen digitisation centre (GDZ), without a text layer
  <https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf>, read 2026-10-06. SHA-256 `5d1ee68e3f9cc49ba6cac8269e1c9ca510411c6a154f36b559290849a72db7b7`.
- **`Browkin.2000`** — Jerzy Browkin, with an appendix by Karim Belabas and Herbert Gangl, *Computing the tame kernel of quadratic imaginary fields*. Mathematics of Computation 69 (2000), no. 232, 1667–1683; the publisher's PDF, free on the AMS site
  <https://www.ams.org/journals/mcom/2000-69-232/S0025-5718-00-01182-0/S0025-5718-00-01182-0.pdf>, read 2026-10-06. SHA-256 `99001ec60a5df5be749f6122877f944545b24e00513051f6dd8b2ddc2e2f7028`.
- **`ZhangXu.2016`** — Long Zhang and Kejian Xu, *The tame kernel of ℚ(ζ₅) is trivial*. Mathematics of Computation 85 (2016), no. 299, 1523–1538, electronically published 11 August 2015; the publisher's PDF, free on the AMS site
  <https://www.ams.org/journals/mcom/2016-85-299/S0025-5718-2015-03003-8/S0025-5718-2015-03003-8.pdf>, read 2026-10-06. SHA-256 `08576560a20ee5c8a45b3993d314d8d3818e4e98e4e99e724d0d94f5fd511ed3`.

The K-book is the main source, freely available, and **the same file three other packets of
this programme already cite**: the hash reproduces the one recorded by `K2SymbolsBrauer--T.3.json`,
`Polylogarithms.json` and `MotivesAndAlgebraicCycles.json`. What was read for this job is
listed in the packet; in outline, III.5.2.2 and III.6.1–III.6.5.3 for the second K-groups and
the symbols, VI.2.4–VI.2.4.1 for the Bernoulli numbers and the regular primes, VI.5.3 for the
third K-group of a number field, VI.8.1–VI.8.6 for the classical data and Birch–Tate, and
VI.10.1–VI.10.8.2 for the tables, the regular-prime torsion and Vandiver.

The generation proofs of N.8 (round two of the fix) use three further sources, all freely
readable. Tate's 1976 Inventiones paper, read from the page images of the Göttingen scan,
supplies Theorem (6.1) (an element of order l of K₂F is {z, a} when F contains a primitive l-th
root of unity z) and Theorem (6.2) (the structure of K₂O_S/l), both imported from
MotivicEtaleKTheory M.3. Browkin's 2000 paper states Tate's criterion (Tate's Proposition 1 and
Lemma 1) and the notation of Tate's method; Zhang and Xu's 2016 paper proves that the tame
kernel of ℚ(ζ₅) is trivial by that method. Tate's own appendix to Bass–Tate (Lecture Notes in
Mathematics 342), where the criterion and the Gaussian computation first appear, and Skalba's
generalised Thue theorem, which Zhang–Xu use, were not obtained; the proof of the criterion and
its application to ℤ[i] are written out in full in the packet, and Skalba's theorem is a
recorded gap.

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

For N.8's generation proofs the pin also has what Tate's method needs on the arithmetic side:
Mathlib's S-units (`Set.unit`) and absolute norm (`Ideal.absNorm`); the Euclidean division of
ℤ[i] (`GaussianInt.norm_mod_lt`, whose proof, though not its statement, contains the factor one
half the method uses); class number one of ℚ(ζ₅) (`IsCyclotomicExtension.Rat.five_pid`) and its
degree (`IsCyclotomicExtension.finrank`); and Minkowski's criterion
(`RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt`), which gives class number one for
ℚ(√5). There is no K₂, no tame symbol and no transfer in either library.

**The three duplications, and the fix.** AUDIT-27 records that `SpecialValuesBirchTate:B.3`
asks for the same base examples as its independent test of Birch–Tate; that
`K2SymbolsBrauer:T.5` proves `K₂(ℤ) = ℤ/2`, `K₂(𝔽_q) = 0` and the infinitude of `K₂(ℚ)`; and
that `K3BlochGroups:V.5` proves `K₃(ℤ) = ℤ/48` and carries `K₃(ℚ(i)) ≅ ℤ ⊕ ℤ/24` as a test. The
red team's RT-AREA-ktheory-1/9 and /11 (confirmed) settle the boundaries: N.8 imports `K₀(ℤ)`
from `KTheoryLowDegrees:Z.6`, `K₁(ℤ)` from `U.6`, `K₂(ℤ)` and `K₂(ℚ)` from T.5 and `K₃` from
V.5; it owns the certified examples `K₂(ℤ[i]) = 0` and the tame kernel of the real quadratic
field `ℚ(√5)`, built on ArithmeticKTheory N.6's certificate engine, and the localisation
sequence of `ℤ ⊂ ℤ[1/p]` in every degree; and the Birch–Tate check is B.3's, which imports
N.8's real-quadratic certificate and must not supply its order bound.

---

## N.7 — Regular primes and Bernoulli numbers

**Coverage: source_decomposed.** 9 nodes.

Nine nodes (including the separate residue-unit lemma). The arithmetic Bernoulli convention with the conversion from the other numbering,
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

Fix the ARITHMETIC convention: Mathlib's bernoulli, defined by the generating series t/(e^t −
1), so B_1 = −1/2, B_2 = 1/6 and B_n = 0 for odd n > 1. Mathlib's bernoulli' (B_1 = +1/2)
differs from it only at index one (bernoulli_eq_bernoulli'_of_ne_one). The SOURCE uses neither:
Weibel's K-book uses the topologists' numbers B_k^top = (−1)^(k+1) B_{2k} = |B_{2k}| (k ≥ 1),
all positive, with B_1^top = 1/6, B_5^top = 5/66 and B_6^top = 691/2730. Every formula quoted
from the source is therefore re-indexed here by k ↦ 2k: the source's B_k is the arithmetic
B_{2k} up to sign. The denominator facts are von Staudt–Clausen, which the pinned Mathlib
proves: for k ≥ 1 the denominator of B_{2k} is the product of the primes p with (p − 1) | 2k,
hence squarefree and divisible by 6 (Bernoulli.vonStaudt_clausen, dvd_den_bernoulli,
not_sq_dvd_den_bernoulli); and if (p − 1) ∤ 2k then p does not divide the denominator of
B_{2k}/k even when p | k.

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
| `bernoulliArith` | data | The arithmetic Bernoulli numbers: Mathlib's bernoulli, used directly (no new definition). |
| `bernoulliTop` | data | The source's topologists' numbers, bernoulliTop k := (−1)^(k+1) * bernoulli (2k), a named translation used only when quoting Weibel. |
| `bernoulliTop_eq_abs` | characterisation | For k ≥ 1, bernoulliTop k = |bernoulli (2k)| > 0. |
| `bernoulli_convert` | compatibility | bernoulli n = bernoulli' n for n ≠ 1 (Mathlib's bernoulli_eq_bernoulli'_of_ne_one); bernoulli' is NOT the source's convention. |
| `bernoulli_one_arith` | simp | bernoulli 1 = −1/2 (Mathlib's bernoulli_one). |
| `bernoulli_denominator` | compatibility | For k ≥ 1, (bernoulli (2k)).den = ∏_{p prime, (p−1) | 2k} p: von Staudt–Clausen with dvd_den_bernoulli and not_sq_dvd_den_bernoulli, all in the pinned Mathlib. |
| `bernoulli_denominator_squarefree` | compatibility | For k ≥ 1, (bernoulli (2k)).den is squarefree and divisible by 6 (2 and 3 always qualify). |

**Used by.** *N.7, the invariant w*: w_{2k}(Q) is the denominator of B_{2k}/4k in the arithmetic convention (the source's B_k/4k), so the re-indexing must be fixed first. *N.7, Kummer's criterion*: The criterion concerns the numerators of B_2, B_4, …, B_{p−3} (the source's B_1, …, B_{(p−3)/2}). *The Handbook comparison*: Parts of the K-theory literature use the topologists' numbering; a translated statement says which one it is in.

**Unit tests.**

- `b_one` — bernoulli 1 = −1/2 and bernoulli' 1 = +1/2.
- `b_twelve_denominator` — The denominator of bernoulli 12 = −691/2730 is 2730 = 2·3·5·7·13,
  the source's 'B_6 = 691/2730'; the arithmetic bernoulli 6 = 1/42. A statement that read the
  source's B_6 as bernoulli 6 fails.
- `agree_away_from_one` — For every index other than one, bernoulli and bernoulli' agree.
- `five_divides_top_b_five` — The source's B_5 = 5/66 is bernoulli 10: 5 divides it but not the
  numerator of bernoulli 10 / 5 = 1/66. The arithmetic bernoulli 5 is 0, so reading the
  source's example with the arithmetic index is vacuous.
- `top_not_primed` — bernoulliTop 1 = 1/6 while bernoulli' 1 = 1/2: the source's convention is
  not Mathlib's bernoulli'.

**Acceptance.**

- B_1 is minus one half in the arithmetic convention and plus one half in the other, and the
  two agree elsewhere.
- The denominator of B_6 is 2730, which is the product of the primes p with p - 1 dividing 12,
  namely 2, 3, 5, 7 and 13.
- The numerator has no analogous description, and a formalisation that treats it as computable
  by a closed formula is wrong.

**Depends on.** **libraries** `mathlib:bernoulli`, `mathlib:bernoulli'`, `mathlib:bernoulli_eq_bernoulli'_of_ne_one`, `mathlib:bernoulli_one`, `mathlib:bernoulli'_one`, `mathlib:Polynomial.bernoulli`, `mathlib:Bernoulli.vonStaudt_clausen`, `mathlib:Bernoulli.dvd_den_bernoulli`, `mathlib:Bernoulli.not_sq_dvd_den_bernoulli`, `mathlib:bernoulli_eq_zero_of_odd`, `mathlib:bernoulli_two`.

**Source.** Kbook.2013, VI.2, the paragraph 'Bernoulli numbers' before Lemma 2.4, printed p.
472 (PDF p. 480): “(We use the topologists' Bk from [135], all of which are positive. Number
theorists would write it as (−1)^{k+1} B_{2k}.) The first few Bernoulli numbers are: B1 = 1/6,
B2 = 1/30, B3 = 1/42, B4 = 1/30, B5 = 5/66, B6 = 691/2730, B7 = 7/6, B8 = 3617/510.” — The
source's convention and its first values, verbatim; the node re-indexes them. Prose verbatim
from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** Kbook.2013, VI.2, same paragraph, printed p. 472 (PDF p. 480): “The denominator of
Bk is always squarefree, divisible by 6, and equal to the product of all primes with (p −
1)|2k. Moreover, if (p − 1) ∤ 2k then p is not in the denominator of Bk/k even if p|k; see
[135].” — The denominator facts, in the source's indexing (its B_k = arithmetic B_{2k}). Prose
verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** Kbook.2013, VI.2.4.1, printed p. 472 (PDF p. 480): “By Kummer's congruences ([216,
5.14]), a regular prime p does not divide the numerator of any Bk/k (but 5|B5). Thus only
irregular primes can divide the numerator of Bk/k.” — The Kummer-congruence refinement and the
example 5 | B_5 (arithmetic B_10 = 5/66). Prose verbatim from the text layer of the
author-hosted PDF; formulas transcribed.

### `w-invariant` — The invariant w_i(F), and its value over the rationals ★

*construction* · planet **The invariant w_i(F)**

For a number field F and a positive integer i, the invariant w_i(F) is the largest integer m
such that the absolute Galois group acts trivially on the i-th Tate twist of the m-th roots of
unity; equivalently, the order of the group of roots of unity in the fixed field of that
action. Over the rationals it is 2 for odd i, and for i = 2k it is the DENOMINATOR of B_{2k}/4k
in the arithmetic convention (the source's 'B_k/4k' with its topologists' B_k); so w_2(Q) = 24
and w_4(Q) = 240; a prime divides w_i(Q) exactly when it is one more than a divisor of i. The
invariant is what the torsion of the odd K-groups of a ring of integers is measured by, so it
is the arithmetic half of the connection between Bernoulli numbers and K-theory that this layer
exists to make precise.

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
| `wInvariant_even_rat` | characterisation | Over the rationals, for k ≥ 1, w_{2k}(Q) = the denominator of bernoulli (2k) / 4k. |
| `wInvariant_prime_divides` | characterisation | A prime divides it exactly when one less than the prime divides i. |
| `wInvariant_two_rat` | example | Its value at i = 2 over the rationals is 24. |

**Used by.** *N.8, the Birch-Tate example*: The formula is the quotient of the order of the tame kernel by this invariant, so the worked example needs its value. *N.7, the torsion consequences*: The Harris-Segal torsion of the odd K-groups has order this invariant. *K3BlochGroups V.5*: The third K-group of a number field has a cyclic summand of order this invariant at i = 2, which is the computation that packet carries.

**Unit tests.**

- `w_two_rat` — w_2(Q) = 24 = denominator of (1/6)/4.
- `w_odd` — For odd i, w_i(Q) = 2.
- `w_gaussian` — w_2(Q(i)) = 24.
- `prime_divisibility` — 7 divides w_6(Q) = 504, since 6 is divisible by 6.
- `w_four_rat` — w_4(Q) = 240 = denominator of bernoulli 4 / 8 = −1/240; the unconverted
  formula with bernoulli 2 = 1/6 would give 48.

**Acceptance.**

- Over the rationals the invariant at i = 2 is 24, which is the denominator of B_1/8 in the
  arithmetic convention and is the number that appears in the Birch-Tate formula.
- For odd i over the rationals the invariant is 2, so the odd twists contribute only
  two-torsion.
- For the Gaussian rationals the invariant at i = 2 is again 24, which is what makes the third
  K-group of that field have a cyclic summand of order 24.

**Depends on.** **inside this packet** `bernoulli-conventions`; **other roadmaps** `K2SymbolsBrauer:T.7`; **libraries** `mathlib:rootsOfUnity`, `mathlib:IsPrimitiveRoot`, `mathlib:NumberField`.

**Source.** Kbook.2013, VI.2.4 (Lemma 2.4) and the recall of 2.1.2 before it, printed p. 472
(PDF p. 480): “Recall from 2.1.2 that wi(Q) = 2 when i is odd. Lemma 2.4. If i = 2k is even
then wi(Q) is the denominator of Bk/4k. The prime ℓ divides wi(Q) exactly when (ℓ − 1) divides
i.” — The value over the rationals, verbatim, in the source's indexing. Prose verbatim from the
text layer of the author-hosted PDF; formulas transcribed.

### `regular-prime` — Regular and irregular primes ★

*definition* · planet **Regular prime**

A prime p is IRREGULAR when it divides the class number of the p-th cyclotomic field, that is
the order of the Picard group of the ring of integers of the field obtained by adjoining a
primitive p-th root of unity; otherwise p is REGULAR. Iwasawa's equivalent form concerns the
whole cyclotomic tower: p is regular exactly when, for every ν ≥ 1, the Picard group of the
ring of integers of Q(μ_{p^ν}) has no p-torsion. The smallest irregular primes are 37, 59, 67,
101, 103, 131 and 149, and Siegel conjectured that asymptotically about 39 per cent of primes
are irregular, a proportion the numerical evidence up to four million matches. The definition
is about the class number and nothing else: no statement of this roadmap may fold Vandiver's
conjecture, or any other class-group hypothesis, into the word regular.

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
| `IsRegularPrime.iwasawa` | characterisation | p is regular iff for all ν ≥ 1, p does not divide the class number of Q(μ_{p^ν}). |
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

**Depends on.** **inside this packet** `bernoulli-conventions`; **libraries** `mathlib:NumberField.classNumber`, `mathlib:IsCyclotomicExtension`, `mathlib:ClassGroup`, `mathlib:NumberField.RingOfIntegers`, `mathlib:Nat.Prime`, `mathlib:CyclotomicField`.

**Source.** Kbook.2013, VI.2.4.1 (Example 2.4.1, Irregular Primes), printed p. 472 (PDF p.
480): “A prime p is called irregular if p divides the order hp of Pic(Z[µp]); if p is not
irregular it is called regular. Iwasawa proved that a prime p is regular if and only if
Pic(Z[µ_{p^ν}]) has no p-torsion for all ν. The smallest irregular primes are 37, 59, 67, 101,
103, 131 and 149.” — The definition, Iwasawa's equivalent form and the list, verbatim. Prose
verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### `kummer-criterion` — Kummer's criterion, and what the numerators can be ★

*theorem* · planet **Kummer's criterion**

An odd prime p is irregular exactly when it divides the numerator of one of the Bernoulli
numbers B_2, B_4, …, B_{p−3} (arithmetic convention; the source's B_k with k ≤ (p−3)/2).
Consequently, by Kummer's congruences, a regular prime divides the numerator of no B_{2k}/k:
only irregular primes can. The criterion converts a class-number condition into a finite
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
   only if it is irregular, and the example that 5 divides the source's B_5 = B_10 = 5/66 but
   not the numerator of B_10/5.
1. Record the status: the criterion is quoted from the source, which cites Washington for the
   proof, and this packet does the same and records the gap.
1. Record the historical use the source records, Kummer's proof of the first case of Fermat's
   Last Theorem for regular exponents, as context and not as a target of this roadmap.

**Acceptance.**

- For p = 37 the criterion is satisfied at B_32 (the source's k = 16), which is why 37 is the
  first irregular prime; the source records the same fact from the K-theoretic side.
- For a prime below 37 the finite check finds no numerator divisibility, which certifies
  regularity.
- The criterion is an equivalence, so it may be used in both directions, but the proof is
  imported in both.

**Depends on.** **inside this packet** `regular-prime`, `bernoulli-conventions`.

**Source.** Kbook.2013, VI.2.4.1, printed p. 472 (PDF p. 480): “Kummer proved that p is
irregular if and only if p divides the numerator of one of the Bernoulli numbers Bk, k ≤ (p −
3)/2 (see Washington [216, 5.34]).” — The criterion, verbatim, in the source's indexing, with
its reference for the proof. Prose verbatim from the text layer of the author-hosted PDF;
formulas transcribed.

**Source.** Kbook.2013, VI.2.4.1, the sentence after the criterion, printed p. 472 (PDF p.
480): “By Kummer's congruences ([216, 5.14]), a regular prime p does not divide the numerator
of any Bk/k (but 5|B5). Thus only irregular primes can divide the numerator of Bk/k.” — Its
consequence through Kummer's congruences, verbatim, with the source's reference. Prose verbatim
from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** Kbook.2013, VI.2.4.1, the historical remark, printed p. 472 (PDF p. 480): “The
historical interest in regular primes is Kummer's 1847 proof of Fermat's Last Theorem (case I)
for regular primes: x^p + y^p = z^p has no solution in which p ∤ xyz. For us, certain
calculations of K-groups become easier at regular primes.” — The context, verbatim. Prose
verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### `eigenspaces-and-herbrand-ribet` — Character eigenspaces of the cyclotomic class group, and the Herbrand-Ribet theorem

*theorem*

Let l be an odd prime, G the Galois group of the l-th cyclotomic field over the rationals,
which is cyclic of order l-1, and P the Picard group of the ring of integers with the prime
inverted, modulo l. Since l-1 is invertible modulo l, the group algebra of G over the field
with l elements splits into the eigenspaces of the powers of the cyclotomic character, and P
decomposes accordingly. The Herbrand-Ribet theorem identifies the eigenspaces that can be
non-zero: for 1 ≤ k ≤ (l−3)/2, l divides the numerator of B_{2k} (arithmetic convention; the
source's B_k) exactly when the eigenspace of index l−2k is non-zero. Among irregular primes
below four thousand this happens for at most three values of k. The projectors are the usual
idempotents of the group algebra, and their denominators are exactly the factor l-1, which is
invertible; a statement that uses them must say so, since over the integers they do not exist.

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
1. State the Herbrand-Ribet theorem in the form the source gives: divisibility of the numerator
   of B_{2k} by l is equivalent to non-vanishing of the eigenspace of index l-2k.
1. Record the numerical statement: among irregular primes below four thousand at most three
   values of k occur.
1. Record how the eigenspace decomposition connects to the definition of regularity: the prime
   is regular exactly when every eigenspace vanishes, which is the class-number condition.

**Acceptance.**

- For a regular prime every eigenspace vanishes, which is the class-number condition of the
  definition.
- For l = 37 exactly one eigenspace is non-zero, at index 37 − 32 = 5, attached to B_32 (the
  source's k = 16), which the source records.
- The projectors are not available over the integers, so an integral statement that used them
  would be wrong; the restriction is part of the statement.

**Depends on.** **inside this packet** `regular-prime`, `kummer-criterion`; **libraries** `mathlib:ZMod`, `mathlib:IsCyclotomicExtension`, `mathlib:ClassGroup`.

**Source.** Kbook.2013, VI.10.8.1 (Remark 10.8.1), printed p. 532 (PDF p. 540): “Remark 10.8.1.
The Herbrand-Ribet theorem [216, 6.17–18] states that ℓ|Bk if and only if (Pic R/ℓ)^[ℓ−2k] ≠ 0.
Among irregular primes < 4000, this happens for at most 3 values of k. For example, 37|c16 (see
10.3), so (Pic R/ℓ)^[5] = Z/37 and (Pic R/ℓ)^[k] = 0 for k ≠ 5.” — The theorem and the
numerical remark, verbatim, in the source's indexing. Prose verbatim from the text layer of the
author-hosted PDF; formulas transcribed.

**Source.** Kbook.2013, VI.10.4.2 (Example 10.4.2), printed p. 530 (PDF p. 538): “If i is even,
Z/ℓ occurs only when i ≡ 0 (mod ℓ − 1), corresponding to ζ^{⊗i}. If i is odd, exactly one term
of M is Z/ℓ; M^G is Z/ℓ on the generator xj ⊗ ζℓ^{i−1}, where i ≡ 1 + 2j (mod ℓ − 1).” — The
eigenspace bookkeeping, verbatim; the packet had cited it as 10.4.1. Prose verbatim from the
text layer of the author-hosted PDF; formulas transcribed.

### `residue-field-units-prime-to-l` — The residue field above a cyclotomic prime has prime-to-l unit order

*lemma*

Let l be a prime, F = Q(mu_l), and P a maximal ideal of its ring of integers lying over (l) in
Z. Then the actual quotient field k(P) = O_F/P has l elements, its multiplicative unit group
has l−1 elements, and l does not divide that order. No regularity or oddness is assumed.

**Hypotheses.**

- l is prime (including l=2); F is the l-th cyclotomic field over Q.
- P is maximal in O_F and lies over the ideal (l) of Z; the quotient is the genuine ideal
  quotient, with its field structure.
- The theorem is arithmetic and independent of tame-kernel or higher K-theory vanishing.

**Construction and proof.**

1. Use the pinned uniqueness theorem to identify P with (zeta−1), for a primitive l-th root.
   The previously cited inertia degree is one.
1. Use IsCyclotomicExtension.Rat.absNorm_span_zeta_sub_one at k=0, rewriting l^1=l, to obtain
   absolute norm l. Ideal.absNorm_apply and Submodule.cardQuot_apply identify this norm with
   the natural-number cardinality of O_F/P.
1. Install Ideal.Quotient.field P locally and apply Nat.card_units to get unit order l−1.
1. Since l≥2, 0<l−1<l; elementary divisibility implies l does not divide l−1. No K-theoretic
   input is used.

**Acceptance.**

- For l=2, the quotient has two elements and the unit group has order one.
- For l=5, the quotient has five elements and the unit group has order four.
- Removing regularity does not change the result; a supposed proof importing regular-prime
  K-theory is circular for its intended use.

**Depends on.** **libraries** `mathlib:CyclotomicField`, `mathlib:NumberField.RingOfIntegers`, `mathlib:Nat.Prime`, `mathlib:IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver'`, `mathlib:IsCyclotomicExtension.Rat.inertiaDeg_span_zeta_sub_one'`, `mathlib:IsCyclotomicExtension.Rat.absNorm_span_zeta_sub_one`, `mathlib:Ideal.absNorm_apply`, `mathlib:Submodule.cardQuot_apply`, `mathlib:Ideal.Quotient.field`, `mathlib:Nat.card_units`.

**Source.** Kbook.2013, VI.8.3.2 (Example 8.3.2), printed p. 514 (PDF p. 522); cyclotomic prime
arithmetic in the pinned Mathlib declarations listed as prerequisites: “Setting R = Z[ζℓ, 1/ℓ],
we have |S| = 1” — The book supplies the single-prime localisation used by the tame-kernel
application. The elementary residue-field/unit-order lemma is derived from the pinned
cyclotomic norm and quotient-cardinality declarations, not attributed as a separately stated
theorem of the book.

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
1. For the S-integer version, use residue-field-units-prime-to-l: the unique prime above l has
   residue-unit order l−1, which is prime to l. Localisation therefore adds no l-primary
   residue term. This named arithmetic input is proved without K-theory and no longer hidden
   inside the vanishing application.

**Acceptance.**

- For l = 5 the statement says that the tame kernel of the fifth cyclotomic field has no
  5-torsion.
- The residue-field remark is an elementary computation with the ramification data and does not
  need any K-theory; a proof that invoked a K-theoretic vanishing instead would be circular.
- For an irregular prime the argument breaks at the class-group step, which is exactly where
  the eigenspace analysis of the previous node takes over.

**Depends on.** **inside this packet** `regular-prime`, `eigenspaces-and-herbrand-ribet`, `residue-field-units-prime-to-l`; **other roadmaps** `K2SymbolsBrauer:T.5`, `K2SymbolsBrauer:T.7`, `MotivicEtaleKTheory:M.3`; **libraries** `mathlib:IsCyclotomicExtension`, `mathlib:IsCyclotomicExtension.Rat.ramificationIdx_span_zeta_sub_one'`, `mathlib:IsCyclotomicExtension.Rat.inertiaDeg_span_zeta_sub_one'`, `mathlib:IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver'`.

**Source.** Kbook.2013, VI.8.3.2 (Example 8.3.2), printed p. 514 (PDF p. 522): “Example 8.3.2.
If ℓ ≠ 2 is a regular prime (see 2.4.1), we claim that K2i(Z[ζℓ]) has no ℓ-torsion. The case K0
is tautological since Pic(OF)/ℓ = 0 by definition. Setting R = Z[ζℓ, 1/ℓ], we have |S| = 1 and
Br(R) = 0 by (8.1.1).” — The statement itself, for all K_{2i}, with the three inputs (Pic, |S|
= 1, Br = 0); the packet did not cite it. Prose verbatim from the text layer of the
author-hosted PDF; formulas transcribed.

**Source.** Kbook.2013, VI.8.1 (Classical Data), (8.1.1), printed p. 513 (PDF p. 521): “The
Brauer group of OS is determined by the sequence 0 → Br(OS) → (Z/2)^{r1} ⊕ ⊕_{v∈S finite} (Q/Z)
→ Q/Z → 0. (8.1.1)” — The Brauer sequence the argument uses. Prose verbatim from the text layer
of the author-hosted PDF; formulas transcribed.

**Source.** Kbook.2013, VI.10.5 (Proposition 10.5), printed p. 530 (PDF p. 538): “Proposition
10.5. When ℓ is an odd regular prime, the group K2i(Z) has no ℓ-torsion. Thus the only
ℓ-torsion subgroups of K∗(Z) are the Harris-Segal subgroups Z/wi(Q)_(ℓ) of K2i−1(Z) when i ≡ 0
(mod ℓ − 1).” — The analogous statement over the integers. Prose verbatim from the text layer
of the author-hosted PDF; formulas transcribed.

### `regular-prime-torsion-consequences` — Torsion in the K-groups at an odd regular prime

*theorem*

Let l be an odd regular prime. Then the even K-groups of the integers have no l-torsion, and
the only l-torsion in the K-groups of the integers is the l-primary part Z/w_i(Q)_(l) of the
Harris-Segal summand of the odd group K_{2i-1}, present exactly when i is divisible by l-1.
With finite coefficients the statement is cleaner still: the mod-l K-theory of the integers
with l inverted is a free graded module over the polynomial ring on β^(l-1), the (l-1)-st power
of the Bott element, in degree 2l-2, with (l+3)/2 generators, namely the unit in degree zero, a
class in degree 2l-3 and classes in the degrees 4k+1 for k from zero to (l-3)/2. The degrees
and the character indices are part of the statement and may not be compressed.

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

**Source.** Kbook.2013, VI.10.5 (Proposition 10.5), printed p. 530 (PDF p. 538): “Proposition
10.5. When ℓ is an odd regular prime, the group K2i(Z) has no ℓ-torsion. Thus the only
ℓ-torsion subgroups of K∗(Z) are the Harris-Segal subgroups Z/wi(Q)_(ℓ) of K2i−1(Z) when i ≡ 0
(mod ℓ − 1).” — The first two statements, verbatim. Prose verbatim from the text layer of the
author-hosted PDF; formulas transcribed.

**Source.** Kbook.2013, VI.10.6 (Theorem 10.6), printed p. 531 (PDF p. 539): “Theorem 10.6. If
ℓ is an odd regular prime then K∗ = K∗(Z[1/ℓ]; Z/ℓ) is a free graded module over the polynomial
ring Z/ℓ[β^{ℓ−1}]. It has (ℓ + 3)/2 generators: 1 ∈ K0, v ∈ K2ℓ−3, and the elements yk ∈ K4k+1
(k = 0, ..., (ℓ−3)/2) described above.” — The module statement, verbatim: the polynomial ring
is on β^{ℓ−1}. Prose verbatim from the text layer of the author-hosted PDF; formulas
transcribed.

**Source.** Kbook.2013, VI.10.6, the case ℓ = 5, printed p. 532 (PDF p. 540): “When ℓ = 5, the
groups Kn = Kn(Z[1/5]; Z/5) are 8-periodic, with respective ranks 1, 1, 0, 0, 0, 1, 0, 1 (n =
0, ..., 7), generated by an appropriate power of β^4 ∈ K8 times one of {1, [5], y1, v}.” — The
worked example, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas
transcribed.

### `vandiver-separation` — Vandiver's conjecture, and keeping the conditional results apart

*comparison*

Import Vandiver(l) from its single owner IntegralIwasawaTheory L3: for a prime l it is
nondivisibility by l of the class number of Q(mu_l)^+, identified with the pinned maximal real
subfield of CyclotomicField l Q. This node does not define a second predicate. Vandiver's
conjecture asserts that for an irregular prime l the Picard group of the ring of integers of
the maximal real subfield of the l-th cyclotomic field has no l-torsion; equivalently, that the
representation of the Galois group on the modulo-l Picard group of the full cyclotomic field is
a sum of odd twists of the roots of unity, which says that complex conjugation acts as minus
one on the l-torsion. The 2013 source reports verification for all primes up to a hundred and
sixty-three million and treats the global conjecture as open; this is historical source
evidence, not a claim about the latest verification bound or current status. Under it, the
K-groups of the integers are given by an explicit table, and in particular the groups K_{4i}(Z)
with 4i ≥ 8 vanish (K_4(Z) = 0 is a theorem, of Rognes); the 2013 source states unconditionally
that those higher groups have order a product of irregular primes greater than ten to the
eighth, and their joint vanishing for all i ≥ 2 is equivalent to the global Vandiver conjecture
at every odd prime. Every statement of this roadmap that uses the conjecture says so in its
hypotheses, and no definition of regularity contains it.

**Hypotheses.**

- l is an irregular prime; the real subfield is the fixed field of complex conjugation.
- The equivalence between the two forms of the conjecture uses that complex conjugation is the
  unique element of order two in the Galois group, which the source records.
- The conditional table is the source's Theorem 10.2 and is quoted as conditional.
- The predicate and its transport to the intrinsic maximal-real-subfield model are supplied by
  IntegralIwasawaTheory L3; the equivalence and conditional K-theory consequences, not that
  definition, are owned here.

**Construction and proof.**

1. Import IntegralIwasawaTheory L3's predicate, whose exact contract is l not dividing the
   class number of the maximal real subfield of Q(mu_l). Prove the comparison to the
   odd-character condition on the full cyclotomic class group; do not introduce a second
   definition.
1. Record the verification bound as historical to the 2013 source, without claiming it is the
   current bound, and the historical remark that the statement was discussed by Kummer and
   Kronecker long before Vandiver.
1. State the conditional theorem: under the conjecture the K-groups of the integers are given
   by the explicit table.
1. State the unconditional order restriction for K_{4i}(Z), i≥2, and the equivalence of their
   joint vanishing with the global Vandiver conjecture at every odd prime. A hypothesis at one
   irregular prime is not the global conjecture; K_4(Z)=0 is an unconditional imported result.
1. State the discipline: a theorem conditional on the conjecture is labelled conditional, and
   the definition of a regular prime does not mention it.

**Acceptance.**

- The conjecture is open, and a formalisation that assumed it silently would make the
  conditional table look unconditional.
- The equivalence of the two forms is a statement about the action of complex conjugation and
  is proved, not assumed.
- The unconditional statement about the groups in degrees divisible by four is weaker and is
  what may be used without the conjecture.

**Depends on.** **inside this packet** `regular-prime`, `eigenspaces-and-herbrand-ribet`, `regular-prime-torsion-consequences`; **other roadmaps** `IntegralIwasawaTheory:L3`; **libraries** `mathlib:NumberField.maximalRealSubfield`, `mathlib:NumberField.of_subfield`.

**Source.** Kbook.2013, VI.10.8 (Vandiver's Conjecture 10.8), printed p. 532 (PDF p. 540):
“Vandiver's Conjecture 10.8. If ℓ is an irregular prime then Pic(Z[ζℓ + ζℓ^{−1}]) has no
ℓ-torsion. Equivalently, the natural representation of G = Gal(Q(ζℓ)/Q) on Pic(Z[ζℓ])/ℓ is a
sum of G-modules µℓ^{⊗i} with i odd.” — The conjecture and the equivalence, verbatim. Prose
verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** Kbook.2013, VI.10.1, the paragraph before Table 10.1.1, printed p. 527 (PDF p.
535): “If n = 4i ≥ 8, the orders of the groups K4i(Z) are known to be products of irregular
primes ℓ, with ℓ > 10^8, and are conjectured to be zero; this conjecture follows from, and
implies, Vandiver's conjecture” — The unconditional statement and the equivalence, verbatim.
Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** Kbook.2013, VI.10.8.2 (Historical Remark 10.8.2), printed p. 532 (PDF p. 540):
“Historical Remark 10.8.2. What we now call “Vandiver's conjecture” was actually discussed by
Kummer and Kronecker in 1849–1853; Harry Vandiver was not born until 1882 and only started
using this assumption circa 1920” — The historical remark, verbatim. Prose verbatim from the
text layer of the author-hosted PDF; formulas transcribed.

---

## N.8 — Certified examples

**Coverage: source_decomposed.** 11 nodes.

Eleven nodes (RT-AREA-ktheory-1/9, /11; FIX-RT-BP-ArithmeticKTheory--N.7~2). The format of a
certified example (certified-example-format), which instantiates ArithmeticKTheory N.6's
certificate engine — a presentation with span and an independent lower bound — and carries the
labelling rule that an order deduced from Birch-Tate is a corollary and not a test of it; the
first five K-groups of the integers, imported from their owners (K₀ from KTheoryLowDegrees Z.6,
K₁ from U.6, K₂ from K2SymbolsBrauer T.5, K₃ from K3BlochGroups V.5) with the two consistency
checks; Tate's method for the span obligations: the filtration of K₂(F) by symbols of S_m-units
with the graded tame symbol (tate-norm-filtration) and Tate's criterion for the graded symbol
to be bijective, with Tate's Lemma 1 and the descent to step 0 (tate-criterion); the Gaussian
case, where Tate's criterion holds at every place and K₂(ℤ[i]) = 0
(gaussian-tame-kernel-vanishes), so that N.8's certificate K₂(ℤ[i]) = 0 is complete, and the
third K-group is the integers plus a cyclic group of order twenty-four by V.5's structure
theorem; the localisation sequence of ℤ ⊂ ℤ[1/p] in every degree, with T.5's relative sequence
in degree two; the check that K₂(ℚ) is infinite while the tame kernel has order two (T.5's
computations); Zhang and Xu's theorem that the tame kernel of ℚ(ζ₅) is trivial
(tame-kernel-of-q-zeta-five), whose construction of small residue generators rests on Skalba's
generalised Thue theorem (recorded gap); the generation theorem for ℚ(√5), by restriction to
ℚ(ζ₅), transfer and Tate's description of two-torsion (real-quadratic-upper-generation); and
the certified tame kernel of ℚ(√5), K₂ ≅ (ℤ/2)² with the sign symbols as lower bound, which N.8
owns and exports to SpecialValuesBirchTate B.3 (atlas edge N.8 → B.3, maintainer). No
certificate bound uses a zeta value: the Birch–Tate check is B.3's, which combines N.8's
certificate with its own w₂ and ζ-value. The former node birch-tate-status is deleted: the
status of the Birch–Tate formula (Wiles's odd part, the two-primary part for abelian fields) is
SpecialValuesBirchTate's (B.4, B.5), and what an example may claim is the labelling rule of
certified-example-format.

**Planets (5):** *Certified example*, *Tate's criterion for the tame symbol*, *K₂ of the Gaussian integers vanishes*, *Trivial tame kernel of ℚ(ζ₅)*, *Generators of the tame kernel of ℚ(√5)*.

How the two span proofs fit together. Tate's method orders the finite places by norm and
filters K₂(F) by the symbols of S_m-units (`tate-norm-filtration`); Tate's criterion
(`tate-criterion`) gives three conditions on finite sets W, C, G of S_{m−1}-units under which
the graded tame symbol at v_m is bijective, and when it is bijective at every place the tame
kernel is generated by symbols of units. For ℤ[i] the conditions hold at every place with
explicit sets, and the unit symbol {i, i} is trivial (`gaussian-tame-kernel-vanishes`). For
ℚ(√5) the method is not run directly: Zhang and Xu ran it for ℚ(ζ₅) ⊃ ℚ(√5)
(`tame-kernel-of-q-zeta-five`), and restriction followed by transfer kills K₂(𝓞_{ℚ(√5)}) by 2,
after which Tate's Theorem (6.1), class number one and the units leave only {−1, −1} and {−1,
ε} (`real-quadratic-upper-generation`). Neither argument uses a zeta value, so
SpecialValuesBirchTate B.3 can use the ℚ(√5) certificate as an independent test of the
Birch–Tate formula.

### `certified-example-format` — What a certified example is ★

*definition* · planet **Certified example**

A certified example of this roadmap consists of three things: the ARITHMETIC DATA of the field,
namely its degree, its signature, its class number, its unit rank and the invariants w_i, each
with a proof or with the pinned declaration that computes it; a TAME-KERNEL CERTIFICATE (or,
for an even K-group, an order certificate) in the format of ArithmeticKTheory
N.6/order-certificate, that is a finite presentation with a proof that its generators span (the
upper bound) and an independent lower bound — a surjection onto a group of the presented order,
from symbols (the real sign, tame or Hilbert symbols), from cohomology
(N.6/certificate-driven-computation) or from a complete kernel argument — so that an upper
bound and a surjection are never reported as an isomorphism; and an explicit LABELLING of every
number that is deduced rather than computed. The last is the rule the layer's text insists on:
an order obtained from the Birch-Tate formula is a valid corollary of that formula and is
labelled as one, it may not then be used as the independent test of the formula, and it may not
supply either bound of a certificate that SpecialValuesBirchTate B.3 uses as that test
(RT-AREA-ktheory-1/11).

**Hypotheses.**

- F is a number field; the data are those of its ring of integers or of a ring of S-integers,
  as the example states.
- The certificate format is ArithmeticKTheory N.6's (RT-AREA-ktheory-1/9) and is not redefined
  here; the tame kernel and its exact sequences are K2SymbolsBrauer T.5's.
- The labelling rule is a condition on the example, not on the mathematics: the same equality
  may appear as a computation in one example and as a corollary in another, and the example
  says which.

**Construction and proof.**

1. Define the record of arithmetic data with a field for each invariant and a proof obligation
   attached to it.
1. Import the order certificate of N.6/order-certificate and record which of its fields are
   present in a given example.
1. Define the labelling: each numerical claim carries a tag saying whether it is computed,
   imported or deduced, and from what.
1. State the circularity rule: a claim tagged as deduced from a formula may not be cited as
   evidence for that formula, and may not fill a bound of a certificate used to test it.
1. Record the minimum an example must contain to be admissible: the arithmetic data, at least
   an upper bound for the tame kernel, and the labelling; it is certified only with both
   bounds.

**API.**

| name | role | statement |
| --- | --- | --- |
| `ArithmeticData` | structure | Degree, signature, class number, unit rank and the invariants w_i, with their proofs. |
| `CertifiedExample` | structure | The arithmetic data, an order certificate in N.6's format (OrderCertificate) for the tame kernel, and the labelling. |
| `CertifiedExample.tag` | projection | The tag of a numerical claim: computed, imported or deduced. |
| `CertifiedExample.no_circularity` | characterisation | A claim tagged as deduced from a formula is not evidence for that formula. |
| `CertifiedExample.admissible` | characterisation | The minimum an example must contain. |

**Used by.** *N.8, every example*: Each of the five required examples is an instance of this record. *SpecialValuesBirchTate B.3*: B.3 imports N.8's certified examples, the real-quadratic tame kernel among them, as the independent input of its Birch–Tate check (atlas edge N.8 → B.3); the labelling is what keeps that check independent. *ArithmeticKTheory N.6/order-certificate*: The certificate half is N.6's format, imported here; K2SymbolsBrauer T.5 supplies the tame kernel it is applied to.

**Unit tests.**

- `deduced_not_evidence` — An order deduced from Birch-Tate cannot be listed as a test of
  Birch-Tate.
- `upper_bound_only` — Without the lower bound (or a complete kernel argument) the example
  reports an upper bound, not an order.
- `rationals_admissible` — The rational example is admissible: its three numbers are known
  independently.
- `data_from_libraries` — For the small fields used here the arithmetic data can be discharged
  from the pinned libraries.
- `gaussian_certified` — The Gaussian example is certified: no generators, span by
  N.8/gaussian-tame-kernel-vanishes, lower bound onto the trivial group; its tame-kernel order
  1 is tagged computed.
- `sqrt_five_certified` — The ℚ(√5) example is certified: generators {−1, −1}, {−1, ε} with
  relations 2g = 0, span by N.8/real-quadratic-upper-generation, lower bound the two sign
  symbols onto (ℤˣ)²; its order 4 is tagged computed, and the Birch–Tate identity 1/30 = 4/120
  is tagged as B.3's test of it.

**Acceptance.**

- An example whose tame-kernel order is deduced from Birch-Tate is admissible and is labelled
  as a corollary; the same example may not then be listed as a test of Birch-Tate.
- An example with a surjective presentation and no completeness proof reports an upper bound,
  not an order.
- The arithmetic data half can be discharged from the pinned libraries for the small fields
  this layer uses, which is why those are the required first examples.
- The tame-kernel certificates of this layer carry both bounds: K₂(ℤ) (span by K2SymbolsBrauer
  T.5's Silvester argument, lower bound the real sign symbol), K₂(ℤ[i]) = 0 (span by
  N.8/gaussian-tame-kernel-vanishes, trivial lower bound) and K₂(𝓞_{ℚ(√5)}) ≅ (ℤ/2)² (span by
  N.8/real-quadratic-upper-generation, lower bound the two sign symbols).

**Depends on.** **other roadmaps** `ArithmeticKTheory:N.6/order-certificate`; **libraries** `mathlib:NumberField.classNumber`, `mathlib:NumberField.Units.rank`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`.

**Source.** Kbook.2013, VI.8.6, the worked case of the rationals, printed p. 515 (PDF p. 523):
“For example, when F = Q we have ζQ(−1) = −1/12, |K2(Z)| = 2 and w2(Q) = 24; see the Classical
Data 8.1” — The shape of a certified example: three independently known numbers. Prose verbatim
from the text layer of the author-hosted PDF; formulas transcribed.

### `k-groups-of-the-integers` — The first K-groups of the integers

*application*

The required first computation: the zeroth K-group of the integers is the integers, the first
is cyclic of order two, the second is cyclic of order two generated by the symbol of minus one
with itself, the third is cyclic of order forty-eight, and the fourth vanishes. None is
computed here: K₀(ℤ) = ℤ is KTheoryLowDegrees Z.6's, K₁(ℤ) = {±1} is KTheoryLowDegrees U.6's,
K₂(ℤ) ≅ ℤ/2 with generator {−1, −1} is K2SymbolsBrauer T.5's (T.5/k2-of-the-integers, through
Milnor's bound and the sign symbol), and K₃(ℤ) ≅ ℤ/48 is K3BlochGroups V.5's; the fourth is the
source's table. This node records the five values with the roadmap that owns each, and the two
consistency checks the layer's text asks for.

**Hypotheses.**

- The ring is the integers; the groups are Quillen's K-groups.
- Each value is attributed; none is proved here.
- The fourth group vanishing is a theorem, unlike the groups in higher degrees divisible by
  four, whose vanishing is equivalent to Vandiver's conjecture.

**Construction and proof.**

1. Record the five values with their owners: Z.6 (K₀), U.6 (K₁), T.5/k2-of-the-integers (K₂),
   V.5 (K₃), the source's table (K₄).
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
- As a certified example, K₂(ℤ) instantiates N.6's engine with T.5's bounds: one generator {−1,
  −1}, the relation 2g = 0, span by Milnor's bound, lower bound the real sign symbol onto ℤˣ
  (the instance orderCertificate_k2_int of ArithmeticKTheory N.6/order-certificate).

**Depends on.** **inside this packet** `certified-example-format`, `w-invariant`, `vandiver-separation`; **other roadmaps** `KTheoryLowDegrees:Z.6`, `KTheoryLowDegrees:U.6`, `K2SymbolsBrauer:T.5/k2-of-the-integers`, `K2SymbolsBrauer:T.5/k2-of-the-rationals`, `K3BlochGroups:V.5`.

**Source.** Kbook.2013, VI.10.1.1 (Table 10.1.1) and its note, printed p. 528 (PDF p. 536):
“K0(Z) = Z, K1(Z) = Z/2, K2(Z) = Z/2, K3(Z) = Z/48, K4(Z) = 0, K5(Z) = Z, K6(Z) = 0, K7(Z) =
Z/240. Table 10.1.1: The groups Kn(Z), n < 20,000. The notation ‘(0?)’ refers to a finite
group, conjecturally zero, whose order is a product of irregular primes > 10^8.” — The first
column of the table (transcribed) and its note, verbatim. Prose verbatim from the text layer of
the author-hosted PDF; formulas transcribed.

### `tate-norm-filtration` — Tate's filtration of K₂ by symbols of S_m-units

*definition*

Let F be a number field. List its finite places as v₁, v₂, … with N v_{m−1} ≤ N v_m, where N v
= #k(v) is the absolute norm of the prime, and put S_m = {v₁, …, v_m}, S₀ = ∅. Let U_m be the
group of S_m-units, the a ∈ F^× with v(a) = 0 at every finite place v ∉ S_m (so U₀ = 𝓞_F^×),
and let K₂^{S_m}(F) be the subgroup of K₂(F) generated by the symbols {a, b} with a, b ∈ U_m.
Then K₂^{S_0}(F) ⊆ K₂^{S_1}(F) ⊆ ⋯ exhausts K₂(F), the tame symbol ∂_{v_m} vanishes on
K₂^{S_{m−1}}(F), and it induces the graded residue ∂_{v_m} : K₂^{S_m}(F)/K₂^{S_{m−1}}(F) →
k(v_m)^×. When the prime of 𝓞_{S_{m−1}} at v_m is principal, generated by π, put U = U_{m−1};
then U_m = U × π^ℤ, and there are homomorphisms α : U → K₂^{S_m}(F)/K₂^{S_{m−1}}(F), u ↦ {u,
π}, onto, and β : U → k(v_m)^×, u ↦ u mod v_m, with ∂_{v_m} ∘ α = β in the convention of
K2SymbolsBrauer T.3/tame-symbol (∂_v{u, t} = ū). Finally U₁ ⊆ U is the subgroup generated by (1
+ πU) ∩ U; it lies in ker β, and α kills it. This is the notation of Tate's method as Browkin
and Zhang–Xu state it; the only data are the ordering of the places and, at a principal place,
the generator π.

**Hypotheses.**

- F is a number field; places of equal norm are ordered arbitrarily, and every statement below
  holds for any such ordering.
- α, β and U₁ are defined at a place v_m whose prime in 𝓞_{S_{m−1}} is principal; every field
  this layer uses (ℚ(i), ℚ(√5), ℚ(ζ₅)) has class number one, so π can be taken in 𝓞_F.
- K₂(F) is described by Matsumoto's presentation (K2SymbolsBrauer T.2/matsumoto); the tame
  symbols are T.3's.

**Construction and proof.**

1. Order the finite places by the absolute norm of their primes (mathlib:Ideal.absNorm); only
   finitely many places have a given norm, so the enumeration exists. Take U_m to be Mathlib's
   S-units (mathlib:Set.unit) for S = S_m.
1. Define K₂^{S_m}(F) as the subgroup generated by the symbols of U_m. It is monotone in m, and
   it exhausts K₂(F) because K₂(F) is generated by symbols (T.2/matsumoto) and each a ∈ F^× has
   non-zero valuation at only finitely many places (T.3/finite-support).
1. ∂_{v_m} vanishes on K₂^{S_{m−1}}(F): a symbol of two v_m-units has tame symbol 1 by
   T.3/tame-symbol. Hence the graded residue is defined on the quotient.
1. At a principal v_m with generator π, every element of U_m is uπ^r with u ∈ U. By
   bimultiplicativity {uπ^r, u′π^s} is a product of {u, u′}, powers of {u, π} and {u′, π}^{±1},
   and {π, π}^{rs} = {π, −1}^{rs} (T.2/symbol-consequences); modulo K₂^{S_{m−1}}(F) this is a
   power product of values of α, so α is onto.
1. ∂_{v_m}{u, π} = ū for a v_m-unit u and the uniformiser π (T.3/tame-symbol), so ∂_{v_m} ∘ α =
   β.
1. U₁ ⊆ ker β because 1 + πx ≡ 1 mod π. α kills U₁: for x ∈ U with 1 + πx ∈ U, the Steinberg
   identity {1 + πx, −πx} = 1 (T.2/steinberg-identity, since −πx = 1 − (1 + πx)) gives {1 + πx,
   π} = {1 + πx, −x}^{−1}, a symbol of two elements of U, hence in K₂^{S_{m−1}}(F).
1. K₂^{S_0}(F) is generated by symbols of units of 𝓞_F and lies in the unramified subgroup of
   T.5/unramified-subgroup (symbol_mem_unramifiedSubgroup).

**API.**

| name | role | statement |
| --- | --- | --- |
| `tateFiltration` | data | For a number field F and an enumeration v : ℕ → finite places of F with nondecreasing absolute norm, m ↦ K₂^{S_m}(F), the subgroup of K₂(F) generated by the symbols of the S_m-units (Set.unit with S = {v₁, …, v_m}). |
| `tateFiltration_mono` | relation | Monotone in m. |
| `iSup_tateFiltration` | characterisation | ⨆ m, tateFiltration F v m = ⊤: every element of K₂(F) lies in some step. |
| `tameSymbol_eq_one_of_mem_tateFiltration` | simp | ∂_{v_m} x = 1 for x in step m − 1. |
| `tateGradedResidue` | constructor | The homomorphism step m ⧸ step (m − 1) → k(v_m)ˣ induced by ∂_{v_m}. |
| `tateAlpha` | constructor | For a generator π of the prime at v_m: u ↦ {u, π} from the S_{m−1}-units to step m ⧸ step (m − 1); surjective. |
| `tateGradedResidue_comp_tateAlpha` | compatibility | tateGradedResidue ∘ tateAlpha = β, reduction modulo v_m, in T.3's convention ∂_v{u, t} = ū. |
| `tateUnitSubgroup` | data | U₁, the subgroup of the S_{m−1}-units generated by (1 + πU) ∩ U. |
| `tateAlpha_tateUnitSubgroup` | relation | tateAlpha kills tateUnitSubgroup, and tateUnitSubgroup ≤ ker β. |
| `tateFiltration_zero_le_unramified` | compatibility | Step 0, generated by symbols of units of 𝓞_F, lies in K2SymbolsBrauer's unramifiedSubgroup. |

**Used by.** *N.8/tate-criterion*: Tate's criterion is a statement about the graded residue of one step, through α, β and U₁. *N.8/gaussian-tame-kernel-vanishes and N.8/tame-kernel-of-q-zeta-five*: both proofs show that every graded residue is bijective and conclude that the tame kernel equals step 0, generated by symbols of units. *ArithmeticKTheory N.6/order-certificate*: the span field of a tame-kernel certificate is discharged through this filtration in N.8's examples; N.6's format itself is not changed.

**Unit tests.**

- `tateFiltration_zero_rat` — For F = ℚ, step 0 is generated by the single unit symbol {−1,
  −1}.
- `tateUnitSubgroup_gaussian_one_add_i` — For F = ℚ(i) at v₁ = (1 + i): i = 1 + (1 + i)·i, so
  tateUnitSubgroup = ⟨i⟩ = U₀.
- `tateFiltration_units_not_integers` — Over ℚ, {−1, 3} is not in step 1 (S₁ = {2}), since
  ∂₃{−1, 3} = −1 ≠ 1 in 𝔽₃^×; a filtration generated by symbols of S_m-integers instead of
  S_m-units would put it in step 0, among the symbols of integers.
- `tateFiltration_zero_le_unramified_rat` — For F = ℚ, step 0 lies in the unramified subgroup
  of K2SymbolsBrauer T.5, which T.5/tame-kernel-sequence identifies with K₂(ℤ).
- `tateGradedResidue_surjective_rat_five` — For F = ℚ at v = (5): β(2) = 2 generates 𝔽₅^×, so
  the graded residue is onto, and {2, 5} maps to 2.

**Acceptance.**

- For F = ℚ(i) the first place is v₁ = (1 + i), of norm 2, followed by the two places of norm
  5, (2 + i) and (2 − i), in either order; U₀ = ⟨i⟩ and U₁ = ⟨i⟩ × (1 + i)^ℤ.
- At v₁ = (1 + i) one has i = 1 + (1 + i)·i ∈ (1 + πU) ∩ U, so the subgroup U₁ of this node
  (not to be confused with the group of S₁-units) is all of U = ⟨i⟩.
- For F = ℚ the filtration step at the prime p is generated, modulo the previous step, by the
  symbols {u, p} with u ∈ ⟨−1⟩ × ∏_{q<p} q^ℤ, and β is reduction mod p.

**Depends on.** **other roadmaps** `K2SymbolsBrauer:T.2/matsumoto`, `K2SymbolsBrauer:T.2/steinberg-identity`, `K2SymbolsBrauer:T.2/symbol-consequences`, `K2SymbolsBrauer:T.3/tame-symbol`, `K2SymbolsBrauer:T.3/finite-support`, `K2SymbolsBrauer:T.5/unramified-subgroup`; **libraries** `mathlib:Set.unit`, `mathlib:Ideal.absNorm`.

**Source.** Browkin.2000, §2, Notation (p. 1668): “Let K2^{S_m}(F) be the subgroup of K2F
generated by symbols {a, b}, where a, b ∈ U_{S_m}. Then K2F = ⋃_{m=1}^∞ K2^{S_m}(F). Let
∂_{v_m} : K2F −→ k*_{v_m} be the tame symbol corresponding to v_m. Then
∂_{v_m}(K2^{S_{m−1}}(F)) = 0, and we have the induced homomorphism (also denoted by ∂_{v_m})” —
The filtration, its exhaustion and the induced graded residue. Prose verbatim from the
publisher's text layer; sub- and superscripts transcribed.

**Source.** Browkin.2000, §2, Notation (p. 1668): “where α(u) = {u, π_m} (mod K2^{S_{m−1}}(F))
and β(u) = u (mod π_m), for u ∈ U_{S_{m−1}}. … Moreover, we denote by U1 the group generated by
(1 + πU) ∩ U.” — The maps α, β and the group U₁. The facts that α is onto and kills U₁ are not
stated there; proof steps 4 and 6 prove them from the Steinberg relations.

**Source.** ZhangXu.2016, §2, Preliminaries (p. 1524): “Now, we order all places according to
the values of their norms, i.e., we have v1, v2, v3, . . . , vn, . . . with N vi ≤ N vi+1, for
i = 1, 2, 3, · · · .” — The ordering of the places by norm. Verbatim from the publisher's text
layer.

### `tate-criterion` — Tate's criterion: when the graded tame symbol is bijective ★

*theorem* · planet **Tate's criterion for the tame symbol**

In the notation of N.8/tate-norm-filtration, let v = v_m (m ≥ 1) be a place whose prime is
principal, generated by π, and put U = U_{m−1}, β : U → k(v)^× and U₁ = ⟨(1 + πU) ∩ U⟩. (a)
Tate's Proposition 1. If W, C, G ⊆ U satisfy (1) W ⊆ C·U₁ and W generates U, (2) C·G ⊆ C·U₁ and
β(G) generates k(v)^×, and (3) 1 ∈ C and C ∩ ker β ⊆ U₁, then the graded residue ∂_v :
K₂^{S_m}(F)/K₂^{S_{m−1}}(F) → k(v)^× is bijective. (b) Tate's Lemma 1. If a, b ∈ 𝓞_F ∩ U, a ≡ b
mod v and |N_{F/ℚ}(a − b)| < (N v)², then a/b ∈ U₁; for an imaginary quadratic F it suffices
that |a| + |b| < N v. (c) Descent. If ∂_{v_j} is bijective for every j > m₀, then the tame
kernel K₂(𝓞_F) is contained in K₂^{S_{m₀}}(F); if this holds with m₀ = 0, then K₂(𝓞_F) =
K₂^{S_0}(F), the subgroup generated by the symbols of units of 𝓞_F.

**Hypotheses.**

- F is a number field with its finite places ordered by norm (N.8/tate-norm-filtration); v =
  v_m is principal, generated by π.
- W, C and G are arbitrary subsets of U; in the applications they are finite and explicit.
- In (b) the elements a and b are integral, and N_{F/ℚ} is the field norm; in (c) the tame
  kernel is the unramified subgroup, identified with K₂(𝓞_F) by K2SymbolsBrauer
  T.5/tame-kernel-sequence.

**Construction and proof.**

1. Reduction to β. By N.8/tate-norm-filtration, α : U → K₂^{S_m}(F)/K₂^{S_{m−1}}(F) is onto,
   ∂_v ∘ α = β, and α and β both kill U₁. So ∂_v ∘ ᾱ = β̄ on U/U₁ with ᾱ onto, and it suffices
   to prove ker β ⊆ U₁: then β̄ is injective, hence ᾱ is injective, hence bijective, and ∂_v =
   β̄ ∘ ᾱ^{−1} is injective. ∂_v is onto because β(G) generates the finite group k(v)^×.
1. β̄ is injective on the image C̄ of C. In the finite group k(v)^× every element is a product
   of elements of the generating set β(G), inverses included. Given c, c′ ∈ C with β(c) =
   β(c′), choose g₁, …, g_r ∈ G with β(c·g₁⋯g_r) = 1. Applying (2) r times gives c·g₁⋯g_r ∈
   c_r·U₁ with c_r ∈ C and β(c_r) = 1, so c_r ∈ U₁ by (3) and c·g₁⋯g_r ∈ U₁. The same word
   gives c′·g₁⋯g_r ∈ U₁, hence c/c′ ∈ U₁. (Browkin's Remark 1 records the related consequence
   β(C) = k^× of (2).)
1. C̄ = U/U₁. C̄ is finite, since β̄ is injective on it. By (2), multiplication by ḡ (g ∈ G)
   maps C̄ into itself, injectively, hence bijectively; so C̄ is stable under the subgroup ⟨Ḡ⟩
   and contains it, because 1 ∈ C. As β̄ is injective on C̄ and β̄(⟨Ḡ⟩) = k(v)^×, C̄ = ⟨Ḡ⟩ is a
   subgroup. By (1) it contains W̄, which generates U/U₁. Hence β̄ is injective on U/U₁, which
   is (a).
1. (b): if a ≠ b, write a − b = πd with d ∈ 𝓞_F. Then |N(d)| = |N(a − b)|/N v < N v, so every
   prime factor of d has norm < N v and is one of v₁, …, v_{m−1}; hence d ∈ U, and a/b = 1 +
   π·(d/b) with d/b ∈ U and a/b ∈ U, so a/b ∈ (1 + πU) ∩ U ⊆ U₁. For imaginary quadratic F,
   |N(a − b)| = |a − b|² ≤ (|a| + |b|)² < (N v)².
1. (c): every x ∈ K₂(F) lies in some K₂^{S_m}(F). If x is unramified and m > m₀, then
   ∂_{v_m}(x) = 1 and bijectivity put x in K₂^{S_{m−1}}(F); descend to m₀. With m₀ = 0,
   conversely K₂^{S_0}(F) ⊆ K₂(𝓞_F), since symbols of units are unramified
   (T.5/unramified-subgroup).

**Acceptance.**

- For F = ℚ(i) and v = (1 + i): W = {i} and C = G = {1} satisfy (1)–(3), because i = 1 + (1 +
  i)·i lies in (1 + πU) ∩ U; so the graded residue at the place of norm 2 is bijective onto the
  trivial group 𝔽₂^×.
- For F = ℚ(i) at every place of norm at least 5 the sets of N.8/gaussian-tame-kernel-vanishes
  satisfy (1)–(3), and for ℚ(ζ₅) at every place those of Zhang–Xu do
  (N.8/tame-kernel-of-q-zeta-five); in both cases (c) holds with m₀ = 0.
- (c) with m₀ = 0 for ℚ(ζ₅) is Zhang–Xu's reduction of K₂(ℤ[ζ₅]) to the six symbols {−1, −1},
  {−1, ζ}, {−1, ξ}, {ζ, ζ}, {ζ, ξ}, {ξ, ξ}.
- The criterion concerns one place at a time: Browkin notes that the number of places of small
  norm that must be treated individually grows quickly with the discriminant, which is why this
  layer uses the method only for fields of small discriminant.

**Depends on.** **inside this packet** `tate-norm-filtration`; **other roadmaps** `K2SymbolsBrauer:T.3/tame-symbol`, `K2SymbolsBrauer:T.5/unramified-subgroup`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`.

**Source.** Browkin.2000, §3, Theorem 1 (p. 1668): “Theorem 1 ([T], Proposition 1). Suppose
that W, C and G are subsets of U satisfying (1) W ⊂ CU1 and W generates U. (2) CG ⊂ CU1 and
β(G) generates k∗. (3) 1 ∈ C ∩ ker β ⊂ U1. Then ∂v is bijective.” — Part (a), verbatim. Browkin
states it without proof and cites Tate's appendix to Bass–Tate (Lecture Notes in Mathematics
342, 1973, pp. 429–446), which was not obtained; proof steps 1–3 are written for this packet
from the statement, using Browkin's Remark 1 (β(C) = k^×) as the first half of step 2.

**Source.** Browkin.2000, §3.2, Lemma 4 (p. 1671): “Lemma 4 ([T], Lemma 1). If a, b ∈ U ∩ OF,
β(a) = β(b) and |a| + |b| < N v, then a ∈ bU1.” — Part (b) in the imaginary quadratic form,
verbatim; stated without proof.

**Source.** ZhangXu.2016, §2, Lemma 2.2 (p. 1525): “Lemma 2.2. Suppose that the elements a, b ∈
OF ∩ Um satisfy the conditions a ≡ b (mod Pm+1) and N(a − b) < N²(Pm+1). Then a/b ∈ U′1.” —
Part (b) for a general number field, verbatim (Zhang–Xu index the place as v_{m+1}); they cite
Tate's letter to Iwasawa for the proof, which step 4 writes out.

**Source.** Browkin.2000, §2, Notation (p. 1668): “Therefore if we prove, for some m and all j
≥ m, that ∂vj is an isomorphism, then ker ∂ ⊂ K2^{S_{m−1}}(F).” — Part (c), verbatim.

### `gaussian-tame-kernel-vanishes` — K₂ of the Gaussian integers vanishes, by Tate's method ★

*theorem* · planet **K₂ of the Gaussian integers vanishes**

K₂(ℤ[i]) = 0. More precisely, for F = ℚ(i) with its places ordered by norm, the graded residue
∂_{v_m} : K₂^{S_m}(F)/K₂^{S_{m−1}}(F) → k(v_m)^× is bijective for every m ≥ 1, and K₂^{S_0}(F)
is generated by {i, i}, which is trivial; so the tame kernel, which is K₂(ℤ[i])
(K2SymbolsBrauer T.5/tame-kernel-sequence), vanishes. At a place of norm at least 5 Tate's
criterion applies with C = G = the non-zero Gaussian integers c with 2N(c) ≤ N v, and W = {i}
together with generators of the earlier primes; at the place 1 + i of norm 2 it applies with W
= {i} and C = G = {1}. This is the span obligation of the Gaussian certificate of
N.8/gaussian-and-imaginary-quadratic: the empty presentation generates.

**Hypotheses.**

- F = ℚ(i), 𝓞_F = ℤ[i], a Euclidean domain (mathlib:GaussianInt.norm_mod_lt) and so a principal
  ideal domain, with unit group ⟨i⟩ of order 4; N(x) = |x|² = x·x̄.
- The places are the Gaussian primes up to units, of norms 2 (the prime 1 + i), p for p ≡ 1 mod
  4 (two places) and p² for p ≡ 3 mod 4; every place other than 1 + i has norm at least 5.
- The vanishing is unconditional and uses no zeta value.

**Construction and proof.**

1. Small representatives. For π ≠ 0 every residue class mod π contains an r with 2N(r) ≤ N(π):
   round x/π to the nearest Gaussian integer, with error at most 1/2 in each coordinate. This
   is the intermediate bound normSq ≤ normSq(1/2 + i/2) = 1/2 in the proof of
   mathlib:GaussianInt.normSq_div_sub_div_lt_one, whose stated conclusion is only < 1; the
   suggested file states it as gaussian_two_mul_norm_mod_le.
1. Places of norm at least 5. Let v = v_m = (π), U = U_{m−1} = ⟨i⟩ × ∏_{j<m} π_j^ℤ. Put C = G =
   {c ∈ ℤ[i] : c ≠ 0, 2N(c) ≤ N v} and W = {i, π₁, …, π_{m−1}}, which generates U. Each c ∈ C
   has N(c) < N v, so its prime factors precede v and C ⊆ U ∩ ℤ[i]; and β(C) = k(v)^× by step
   1.
1. Check (1)–(3) of N.8/tate-criterion with its part (b) in the form |a| + |b| < N v. (3): 1 ∈
   C, and for c ∈ C ∩ ker β, |c| + 1 ≤ √(N v/2) + 1 < N v. (2): for c, c′ ∈ C choose c″ ∈ C
   with β(c″) = β(cc′); then |cc′| + |c″| ≤ N v/2 + √(N v/2) < N v because N v > 2. (1): for w
   ∈ W choose c ∈ C with β(c) = β(w); then |c| + |w| ≤ (1 + 1/√2)·√(N v) < N v because N v ≥ 5
   > (1 + 1/√2)² ≈ 2.91. So ∂_v is bijective.
1. The place 1 + i. Here N v = 2, U = ⟨i⟩ and k(v)^× = 1. Take W = {i} and C = G = {1}: i = 1 +
   (1 + i)·i lies in (1 + πU) ∩ U ⊆ U₁, so (1)–(3) hold and ∂_{v₁} is bijective, that is
   K₂^{S_1}(F) = K₂^{S_0}(F). Directly: the Steinberg identity {i, 1 − i} = 1, 1 − i = −i(1 +
   i) and {i, −i} = 1 give {i, 1 + i} = 1.
1. Step 0. K₂^{S_0}(F) is generated by {i, i}, and {i, i} = {i, −1} = {i, i²} = {i, i}²
   (K2SymbolsBrauer T.2/symbol-consequences), so {i, i} = 1 and K₂^{S_0}(F) = 1.
1. By N.8/tate-criterion (c) with m₀ = 0, K₂(ℤ[i]) = K₂^{S_0}(F) = 1.

**Acceptance.**

- {−1, −1} = {i², i²} = {i, i}⁴ = 1 in K₂(ℚ(i)), whereas {−1, −1} is the non-trivial element of
  K₂(ℤ) (K2SymbolsBrauer T.5/k2-of-the-integers): restriction to ℚ(i) kills it.
- At v = (2 + i), N v = 5: ℤ[i]/(2 + i) ≅ 𝔽₅ with i ↦ −2, the elements ±1, ±i already map onto
  𝔽₅^× = {1, 4, 3, 2}, and C = {±1, ±i, ±1 ± i}.
- The bound N v ≥ 5 in step 3 is used: at the place of norm 2 the inequality |c| + |w| < N v
  fails for c = w = 1, and that place is treated by the explicit unit identity i = 1 + (1 +
  i)·i.
- With this theorem the Gaussian certificate is complete: empty presentation, span by this
  node, trivial lower bound; no zeta value and no Birch–Tate statement enters.

**Depends on.** **inside this packet** `tate-criterion`, `tate-norm-filtration`; **other roadmaps** `K2SymbolsBrauer:T.2/symbol-consequences`, `K2SymbolsBrauer:T.2/steinberg-identity`, `K2SymbolsBrauer:T.2:symbols/symbol-negative-unit`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`; **libraries** `mathlib:GaussianInt.normSq_div_sub_div_lt_one`, `mathlib:GaussianInt.norm_mod_lt`.

**Source.** Kbook.2013, III.5.2.2 (Example 5.2.2), printed p. 218 (PDF p. 226): “Tate has used
the same Euclidean algorithm type techniques to show that K2(Z[√−7]) and K2(Z[√−15]) are also
cyclic of order 2, generated by the symbol {−1, −1}, while K2(R) = 1 for the imaginary
quadratic rings R = Z[i], Z[√−3], Z[√−2] and Z[√−11].” — The statement and its attribution to
Tate, verbatim.

**Source.** Browkin.2000, §1, Introduction (p. 1667): “J. Tate [T] has determined the tame
kernel of all quadratic imaginary Euclidean fields F and of F = Q(√−15).” — The attribution of
the Gaussian case to Tate, verbatim: ℤ[i] is a Euclidean imaginary quadratic ring.

**Source.** Browkin.2000, §1, Introduction (p. 1667): “He proved that all mappings ∂v (see
notation below) are isomorphisms if the norm of the prime ideal v of the field F is
sufficiently large. Then he investigated the remaining v’s (with small norms) performing
necessary computations with symbols.” — The shape of Tate's argument, verbatim. Tate's own
computation for ℤ[i] (in his appendix to Bass–Tate) was not obtained: the sets C, G and W of
steps 2–4 and the inequalities are this packet's application of N.8/tate-criterion, written out
in full.

### `gaussian-and-imaginary-quadratic` — The Gaussian integers: a vanishing tame kernel and a third K-group of order twenty-four

*application*

For the Gaussian rationals the required computations are that the tame kernel vanishes and that
the third K-group is the direct sum of the integers and a cyclic group of order twenty-four.
The first is Tate's computation, recorded by the source together with the other imaginary
quadratic rings of class number one for which the same vanishing holds; this node owns it as a
certified example in N.6's format (RT-AREA-ktheory-1/9): the tame kernel K₂(ℤ[i]) — T.5's
unramified subgroup of K₂(ℚ(i)) — is certified trivial by the empty presentation, whose span
obligation, that every element of K₂(ℤ[i]) is trivial, is N.8/gaussian-tame-kernel-vanishes
(Tate's method, through N.8/tate-criterion), the lower bound being trivial. The second follows
from the general structure theorem for the third K-group of a number field: for a totally
imaginary field with r_2 complex places the group is the direct sum of r_2 copies of the
integers and a cyclic group of order the invariant w_2; the Gaussian rationals have one complex
place and no real place, and their invariant w_2 is twenty-four, so the group is as stated.

**Hypotheses.**

- The field is the Gaussian rationals and the ring is the Gaussian integers; the field is
  totally imaginary with one complex place and no real place.
- The structure theorem for the third K-group is the source's Corollary 5.3, which
  K3BlochGroups V.5 owns and this layer imports; the case distinction between the totally
  imaginary case and the case with a real place is part of it.
- The value twenty-four for the invariant is computed by N.7's node and is the same as for the
  rationals.

**Construction and proof.**

1. Gaussian certificate in N.6's format: no generators and no relations, span by
   N.8/gaussian-tame-kernel-vanishes, lower bound the trivial group; equivalently the complete
   kernel argument OrderCertificate.ofIsPresentation with B = A = 0. Identify the tame kernel
   with K₂(ℤ[i]) through T.5/tame-kernel-sequence, and record the other imaginary quadratic
   cases in the source.
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
- The vanishing is Tate's computation, proved in N.8/gaussian-tame-kernel-vanishes by Tate's
  criterion at every place; a formalisation may not derive it from the structure theorem, which
  does not give the tame kernel.
- The certificate is complete: the presented group and the lower-bound group are both trivial,
  so soundness gives K₂(ℤ[i]) = 0 with no appeal to a zeta value.

**Depends on.** **inside this packet** `gaussian-tame-kernel-vanishes`, `k-groups-of-the-integers`, `certified-example-format`, `w-invariant`; **other roadmaps** `ArithmeticKTheory:N.6/order-certificate`, `K3BlochGroups:V.5`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`, `K2SymbolsBrauer:T.5/unramified-subgroup`.

**Source.** Kbook.2013, VI.5.3 (Corollary 5.3), printed p. 488 (PDF p. 496): “Corollary 5.3.
Let F be a number field, with r1 real embeddings and r2 complex embeddings, and set w = w2(F).
Then K3^ind(F) ≅ Z^{r2} ⊕ Z/w, and: (a) If F is totally imaginary then K3(F) ≅ Z^{r2} ⊕ Z/w;
(b) If F has r1 > 0 embeddings into R then K3(F) ≅ Z^{r2} ⊕ Z/(2w) ⊕ (Z/2)^{r1−1}.” — The
structure theorem in both cases, verbatim. Prose verbatim from the text layer of the
author-hosted PDF; formulas transcribed.

**Source.** Kbook.2013, III.5.2.2 (Example 5.2.2), printed p. 218 (PDF p. 226): “Tate has used
the same Euclidean algorithm type techniques to show that K2(Z[√−7]) and K2(Z[√−15]) are also
cyclic of order 2, generated by the symbol {−1, −1}, while K2(R) = 1 for the imaginary
quadratic rings R = Z[i], Z[√−3], Z[√−2] and Z[√−11].” — Tate's vanishing for Z[i] and the
other rings, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas
transcribed.

### `s-integer-sequence-for-one-inverted-prime` — The localisation sequence of the integers with one prime inverted, in every degree

*application*

Let p be a prime. The localisation sequence of ℤ ⊂ ℤ[1/p], whose fibre term is K_*(𝔽_p)
(N.2/finite-support with R = ℤ and s = p), breaks up into short exact sequences 0 → K_n(ℤ) →
K_n(ℤ[1/p]) → K_{n−1}(𝔽_p) → 0 for every n ≥ 1, and K₀(ℤ) → K₀(ℤ[1/p]) is an isomorphism. Hence
K_n(ℤ[1/p]) ≅ K_n(ℤ) for odd n ≥ 3; for n = 2i ≥ 2, K_{2i}(ℤ[1/p]) is an extension of ℤ/(p^i −
1) by K_{2i}(ℤ), of order #K_{2i}(ℤ)·(p^i − 1); and in degree one K₁(ℤ[1/p]) = ℤ[1/p]^× = {±1}
× p^ℤ ≅ ℤ/2 ⊕ ℤ (KTheoryLowDegrees U.6). In degree two the sequence is K2SymbolsBrauer T.5's
relative sequence 0 → K₂(ℤ) → K₂(ℤ[1/p]) → 𝔽_p^× → 0 (residue at p ∈ S), imported, and it
splits: the retraction K₂(ℚ) → K₂(ℤ) given by the real sign symbol (T.5/k2-of-the-rationals)
restricts to K₂(ℤ[1/p]). In the degrees 2i ≥ 4 the extension class is not determined here. The
demonstration is what the layer's text asks for ('demonstrate the S-integer exact sequence for
Z[1/p]'), and N.8 owns it in every degree (RT-AREA-ktheory-1/9).

**Hypotheses.**

- p is a prime; S = {p} (with the infinite place for the K-book's count of S-units); the ring
  is ℤ[1/p].
- The localisation sequence is N.2's (the sequence of R → R[1/s] of N.2/finite-support); the
  injectivity of K_n(ℤ) → K_n(ℚ) for n ≥ 1 is Bass–Milnor–Serre in degree one (SK₁(ℤ) = 0),
  N.2/even-degree-injectivity in even degrees (T.5 in degree two) and Soulé's theorem
  (N.5/soule-theorem) in odd degrees n ≥ 3.
- The extension class in degrees 2i ≥ 4 is not claimed; in degree two the splitting comes from
  the real place.

**Construction and proof.**

1. Take the localisation sequence of ℤ → ℤ[1/p] with fibre K_*(𝔽_p) (N.2/finite-support,
   dévissage for the p-torsion modules): ⋯ → K_n(𝔽_p) → K_n(ℤ) → K_n(ℤ[1/p]) → K_{n−1}(𝔽_p) →
   K_{n−1}(ℤ) → ⋯.
1. For n ≥ 1, K_n(ℤ) → K_n(ℚ) is injective (SK₁(ℤ) = 0, KTheoryLowDegrees U.6;
   N.2/even-degree-injectivity for even n; N.5/soule-theorem with S = ∅ for odd n ≥ 3); it
   factors through K_n(ℤ[1/p]), so K_n(ℤ) → K_n(ℤ[1/p]) is injective and every map K_n(𝔽_p) →
   K_n(ℤ), n ≥ 1, is zero.
1. Degree zero: K₀(𝔽_p) → K₀(ℤ) sends [𝔽_p] to [ℤ] − [pℤ] = 0 (N.2/the-three-classical-rows
   (a)), so 0 → K₁(ℤ) → K₁(ℤ[1/p]) → K₀(𝔽_p) = ℤ → 0 is exact and K₀(ℤ) ≅ K₀(ℤ[1/p]).
1. Insert Quillen's K_*(𝔽_p) (KTheoryFiniteLocalFields L.1): K_{2i}(𝔽_p) = 0 and K_{2i−1}(𝔽_p)
   ≅ ℤ/(p^i − 1) for i ≥ 1; this gives the odd-degree isomorphisms and the even-degree
   extensions.
1. Degree two: identify the sequence with T.5/relative-s-integer-sequence, and split it by
   restricting the retraction of T.5/k2-of-the-rationals.
1. Degree one: compare with K₁(ℤ[1/p]) = ℤ/2 ⊕ ℤ (KTheoryLowDegrees U.6), the map to K₀(𝔽_p) =
   ℤ being the p-adic valuation.

**Acceptance.**

- p = 2: K₂(ℤ[1/2]) ≅ K₂(ℤ) = ℤ/2, since 𝔽₂^× is trivial.
- p = 3: K₂(ℤ[1/3]) ≅ ℤ/2 ⊕ ℤ/2, split by the real sign symbol.
- K₃(ℤ[1/p]) ≅ K₃(ℤ) ≅ ℤ/48 for every p, and K₄(ℤ[1/p]) ≅ ℤ/(p² − 1) since K₄(ℤ) = 0 (the
  source's table); for p = 2 this is ℤ/3.
- Degree one: 0 → {±1} → {±1} × p^ℤ → ℤ → 0, the last map the p-adic valuation.
- A formalisation that asserted a splitting in degrees 2i ≥ 4 would be claiming more than the
  argument gives.

**Depends on.** **inside this packet** `k-groups-of-the-integers`; **other roadmaps** `ArithmeticKTheory:N.2/finite-support`, `ArithmeticKTheory:N.2/the-three-classical-rows`, `ArithmeticKTheory:N.2/even-degree-injectivity`, `ArithmeticKTheory:N.5/soule-theorem`, `KTheoryFiniteLocalFields:L.1`, `KTheoryLowDegrees:U.6`, `K2SymbolsBrauer:T.5/relative-s-integer-sequence`, `K2SymbolsBrauer:T.5/k2-of-the-rationals`.

**Source.** Kbook.2013, VI.8.1 (Classical Data), printed p. 513 (PDF p. 521): “The formulas for
K0(OS) = Z ⊕ Pic(OS) and K1(OS) = OS^× ≅ Z^{r2+|S|−1} ⊕ µ(F) are different; see II.2.6.3 and
III.1.3.6.” — The degree-zero and degree-one formulas. The printed rank r2 + |S| − 1 is wrong
for fields with real places (it gives rank 0 for Z[1/p]); the node uses the correct rank r1 +
r2 + |S| − 1 = 1, recorded as ArithmeticKTheory/E1. Prose verbatim from the text layer of the
author-hosted PDF; formulas transcribed.

**Source.** Kbook.2013, III.6.5.1 (Application 6.5.1), printed p. 236 (PDF p. 244):
“Application 6.5.1 (K2 Q). If R = Z then, since K2(Z/p) = 1 and SK1(Z) = 1, we have an exact
sequence 1 → K2(Z) → K2(Q) → ⊕ Fp^× → 1. As noted in Example 6.2.1, this sequence is split by
the symbol (r, s)∞, so we have K2(Q) ≅ K2(Z) ⊕ ⊕ Fp^×.” — The sequence for the integers, which
is one of the two compared. Prose verbatim from the text layer of the author-hosted PDF;
formulas transcribed.

**Source.** Kbook.2013, V.6.1, Application 6.1 and (6.1.1) (PDF p. 414; book p. 406): “The
prototype is the case when S = {s^n}.” — The localisation sequence for R → R[1/s], here with R
= ℤ and s = p, whose fibre is G_*(ℤ/p) = K_*(𝔽_p).

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
- Both computations are imported from K2SymbolsBrauer T.5 (T.5/k2-of-the-integers and
  T.5/k2-of-the-rationals); the sign symbol that splits the sequence is that layer's own
  contribution.
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

**Depends on.** **inside this packet** `certified-example-format`, `s-integer-sequence-for-one-inverted-prime`; **other roadmaps** `K2SymbolsBrauer:T.5/k2-of-the-integers`, `K2SymbolsBrauer:T.5/k2-of-the-rationals`.

**Source.** Kbook.2013, III.6.5.1 (Application 6.5.1), printed p. 236 (PDF p. 244):
“Application 6.5.1 (K2 Q). If R = Z then, since K2(Z/p) = 1 and SK1(Z) = 1, we have an exact
sequence 1 → K2(Z) → K2(Q) → ⊕ Fp^× → 1. As noted in Example 6.2.1, this sequence is split by
the symbol (r, s)∞, so we have K2(Q) ≅ K2(Z) ⊕ ⊕ Fp^×.” — The decomposition that makes the
check, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas
transcribed.

### `tame-kernel-of-q-zeta-five` — The tame kernel of ℚ(ζ₅) is trivial (Zhang–Xu) ★

*theorem* · planet **Trivial tame kernel of ℚ(ζ₅)**

Let E = ℚ(ζ), ζ = ζ₅, with 𝓞_E = ℤ[ζ]. Then K₂(𝓞_E) = 0. Zhang and Xu prove it by Tate's
method: the graded residue is bijective at every finite place of E, so K₂(𝓞_E) is generated by
the symbols of the units −ζ and ζξ, ξ = 1 + ζ + ζ², that is by {−1, −1}, {−1, ζ}, {−1, ξ}, {ζ,
ζ}, {ζ, ξ}, {ξ, ξ}; K₂(𝓞_E) has no element of order 2, so the symbols of order dividing two
vanish, and {ζ, ξ} = 1 by the Steinberg identity. N.8 uses the theorem only through restriction
and transfer to the real subfield ℚ(√5) (N.8/real-quadratic-upper-generation), where it
supplies the odd and the four-torsion part of the upper bound without the Birch–Tate formula.

**Hypotheses.**

- 𝓞_E = ℤ[ζ] is a principal ideal domain (mathlib:IsCyclotomicExtension.Rat.five_pid); [E : ℚ]
  = 4 (mathlib:IsCyclotomicExtension.finrank); E is totally complex with two complex places.
- The unit group is ⟨−ζ⟩ × (ζξ)^ℤ (Zhang–Xu, from Dirichlet's unit theorem; the unit rank is 1
  by mathlib:NumberField.Units.rank).
- 2 is inert in E (2 has order 4 modulo 5), with residue field 𝔽₁₆; 5 is totally ramified, (5)
  = (1 − ζ)⁴; 11, 31, 41, 61 and 71 split completely.
- Zhang–Xu's finite verifications at the places of norm at most 364 were made with GP/Pari;
  their tables give the data (generators of the primes, the sets C and G, the bounds M₁, M₂ and
  t) that a formal proof checks.

**Construction and proof.**

1. Generators. Each place v_{m+1} = (α) has a generator with |σ(ξ)| ≤ |σ(α)/α| ≤ |ξ| (Lemma
   3.1, multiplying by powers of the unit ξ); W_m = {α₁, …, α_m} ∪ {−1, ζ, ξ} generates U_m.
1. Representatives. Coordinate rounding in the basis 1, ζ, ζ², ζ³ (Lemma 3.2, with the norm
   formula of Lemma 2.3) gives in every residue class a c with N(c) ≤ (25/16)·N(P_{m+1}) and
   both archimedean sizes at most |ξ| times those of α_{m+1}; C_m is a set of such
   representatives containing 1, and condition (3) of N.8/tate-criterion holds by Lemma 2.2,
   which is part (b) of that node.
1. Generators of the residue group. G_m consists of elements of small size whose residues
   generate k(v)^×: from Skalba's generalised Thue theorem when N(P_{m+1}) ≥ (2/π)⁴·|D| ≈ 20.53
   (D = 125, recorded gap: the theorem was not obtained), and by the explicit lists of Tables 1
   and 2 otherwise.
1. Condition (1): Theorem 3.3 for N(P_{m+1}) ≥ 90, from (N(w)^{1/2} + |wσ(c)| + |cσ(w)| +
   N(c)^{1/2})² ≤ 86.25·N(P_{m+1}) and Lemma 2.2; Theorem 3.4 for the places of norm below 90
   (norms 5, 11, 16, 31, 41, 61, 71, 81), from explicit generators and a machine check.
1. Condition (2): Theorem 3.5 for N(P_m) > 364 by the analogous estimate (3.4); Theorem 3.6 for
   the places of norm at most 364 by the explicit data of Tables 1 and 2, machine-checked.
1. By N.8/tate-criterion (a) at every place and (c) with m₀ = 0, K₂(𝓞_E) = K₂^{S_0}(E),
   generated by the six symbols of −1, ζ and ξ; in particular K₂(𝓞_E) is finitely generated.
1. No element of order 2. Tate's Theorem (6.2) with l = 2 and S = {(2)} ∪ {the two complex
   places} (MotivicEtaleKTheory M.3): Pic(𝓞_{E,S}) = 0, a localisation of the principal ideal
   domain ℤ[ζ], and (∐_{v∈S−S_c} μ₂)₀ = 0, as only one place of S is not complex; so
   K₂(𝓞_{E,S})/2 = 0. The relative sequence 0 → K₂(𝓞_E) → K₂(𝓞_{E,S}) → 𝔽₁₆^× → 0
   (K2SymbolsBrauer T.5/relative-s-integer-sequence) has cokernel of odd order 15, so K₂(𝓞_E)/2
   = 0, and a finitely generated abelian group A with A = 2A is finite of odd order. Zhang–Xu
   quote this as the 2-rank formula r₁ + g₂ − 1 + rank₂ Cl(𝓞_E[1/2]) = 0 + 1 − 1 + 0 = 0, after
   Browkin.
1. Hence {−1, −1}, {−1, ζ} = {ζ, ζ} and {−1, ξ} = {ξ, ξ}, each of order dividing 2
   (K2SymbolsBrauer T.2/symbol-consequences), vanish, and {ζ, ξ} = {ζ, 1 − ζ}·{ζ, ξ} = {ζ, 1 −
   ζ³} = {ζ⁶, 1 − ζ³} = {ζ³, 1 − ζ³}² = 1 (K2SymbolsBrauer T.2/steinberg-identity). So K₂(𝓞_E)
   = 0.

**Acceptance.**

- The unit symbols reduce to six, and all six vanish: K₂(ℤ[ζ₅]) = 0.
- The 2-rank formula gives 0 + 1 − 1 + 0 = 0 for ℚ(ζ₅) (no real place, one prime above 2, class
  number one) and 2 + 1 − 1 + 0 = 2 for ℚ(√5); the second agrees with the two sign symbols of
  N.8/real-quadratic-example-and-birch-tate.
- The proof uses no zeta value and no Birch–Tate or Lichtenbaum statement: Browkin had
  conjectured the result assuming Lichtenbaum's conjecture, and Zhang–Xu prove it without that
  assumption.
- The machine-checked cases are finite: Theorems 3.4 and 3.6 concern the places of norm at most
  364, and a formalisation reproduces them from the data printed in the paper.

**Depends on.** **inside this packet** `tate-criterion`, `tate-norm-filtration`; **other roadmaps** `MotivicEtaleKTheory:M.3`, `K2SymbolsBrauer:T.5/relative-s-integer-sequence`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`, `K2SymbolsBrauer:T.2/steinberg-identity`, `K2SymbolsBrauer:T.2/symbol-consequences`; **libraries** `mathlib:IsCyclotomicExtension.Rat.five_pid`, `mathlib:IsCyclotomicExtension.finrank`, `mathlib:NumberField.Units.rank`.

**Source.** ZhangXu.2016, §3, Theorem 3.7 (p. 1536): “Theorem 3.7. For the cyclotomic field F =
Q(ζ), the tame kernel K2OF is trivial. Proof. By Lemma 2.1, Theorem 3.3, 3.4, 3.5 and 3.6, K2OF
is generated by {x, y} where x, y ∈ O*F. This implies that K2OF is generated by {−1, −1}, {−1,
ζ}, {−1, ξ}, {ζ, ζ}, {ζ, ξ}, {ξ, ξ}.” — The theorem and the reduction to unit symbols, verbatim
from the publisher's text layer.

**Source.** ZhangXu.2016, §3, proof of Theorem 3.7 (p. 1537): “It is well known that Cl(Z[ζ]) =
1 and that there is only one prime in Z[ζ] lying over 2. So this formula in our case takes the
form 2-rankK2OF = 0 + 1 − 1 + 0 = 0. So in K2OF there is no element of order 2.” — The 2-rank
step, verbatim; proof step 7 derives the formula's value from Tate's Theorem (6.2).

**Source.** ZhangXu.2016, §3.4, Theorem 3.3 (p. 1529): “Theorem 3.3. If N(Pm+1) ≥ 90, then Wm ⊆
CmU1.” — Condition (1) for the large places, verbatim; Theorems 3.4–3.6 are summarised in proof
steps 4–5.

**Source.** Tate.1976, §6, Theorem (6.2), printed p. 270 (PDF p. 15): “Let S be a finite
non-empty set of places of F containing the archimedean ones and the ones above l in the number
field case. Let Sc denote the set of complex places of F. Suppose μl ⊂ F. Then there is a
natural exact sequence 0 → μl ⊗ Pic OS → K2OS/lK2OS → (∐_{v∈S−Sc} μl)0 → 0” — Transcribed from
the page image; the subscript 0 denotes the elements with product 1.

### `real-quadratic-upper-generation` — {−1, −1} and {−1, ε} generate K₂ of the integers of ℚ(√5) ★

*theorem* · planet **Generators of the tame kernel of ℚ(√5)**

Let F = ℚ(√5), 𝓞_F = ℤ[ε], ε = (1 + √5)/2. Every element of K₂(𝓞_F) lies in the subgroup
generated by {−1, −1} and {−1, ε}; in particular 2·K₂(𝓞_F) = 0 and #K₂(𝓞_F) ≤ 4. Two inputs
give this. First, K₂(𝓞_F) is killed by 2: restriction to E = ℚ(ζ₅) ⊇ F lands in K₂(𝓞_E) = 0
(N.8/tame-kernel-of-q-zeta-five), and transfer after restriction is multiplication by [E : F] =
2. Second, an element of order dividing 2 is a symbol {−1, b} by Tate's Theorem (6.1), and
unramifiedness, class number one and the unit group force b ∈ ±ε^ℤ·2^ℤ·(F^×)², so {−1, b} is a
product of {−1, −1} and {−1, ε}. This is the span obligation of the certificate of
N.8/real-quadratic-example-and-birch-tate. Neither input uses a zeta value or the Birch–Tate
formula.

**Hypotheses.**

- F = ℚ(√5) ⊆ E = ℚ(ζ₅), since √5 = ζ − ζ² − ζ³ + ζ⁴ (the quadratic Gauss sum), and [E : F] =
  2, as [E : ℚ] = 4 (mathlib:IsCyclotomicExtension.finrank).
- 𝓞_F = ℤ[ε] is a principal ideal domain
  (mathlib:RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt: |d_F| = 5 < 16), its unit group
  is {±ε^n : n ∈ ℤ}, and 2 is inert, with residue field 𝔽₄.
- K₂(𝓞_F) is identified with the unramified subgroup of K₂(F) by K2SymbolsBrauer
  T.5/tame-kernel-sequence, and likewise for E.

**Construction and proof.**

1. Arithmetic of F. Class number one from
   mathlib:RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt with n = 2 and r₂ = 0: the bound
   is (2·2²/2!)² = 16 > 5 = |d_F|. The prime 2 is inert because X² − X − 1, the minimal
   polynomial of ε, has no root modulo 2. The units are ±ε^n: the unit rank is 1
   (mathlib:NumberField.Units.rank), and a unit (a + b√5)/2 > 1 has conjugate of absolute value
   < 1, so a = u + ū > 0 and b√5 = u − ū > 0, whence a, b ≥ 1 and u ≥ ε; so ε is the least unit
   greater than 1.
1. Killed by two. E = F(ζ) has degree 2 over F. For x ∈ K₂(𝓞_F) ⊆ K₂(F), res_{E/F}(x) is
   unramified at every finite place of E (T.5/unramified-subgroup, restriction), so it lies in
   K₂(𝓞_E) = 0 (N.8/tame-kernel-of-q-zeta-five). By K2SymbolsBrauer
   T.4/restriction-transfer-degree, applied to K₂ = K^M_2 through T.2/matsumoto, 2x =
   N_{E/F}(res_{E/F}(x)) = 0.
1. Two-torsion is a symbol. By Tate's Theorem (6.1) with l = 2 and z = −1 (MotivicEtaleKTheory
   M.3), x = {−1, b} for some b ∈ F^×.
1. Unramified condition. For a prime 𝔭 ∤ 2, ∂_𝔭{−1, b} = (−1)^{v_𝔭(b)} in k(𝔭)^×
   (K2SymbolsBrauer T.3/tame-symbol), and −1 ≠ 1 there, so v_𝔭(b) is even. At the inert prime
   (2) the residue field 𝔽₄ has −1 = 1, and there is no condition.
1. Class number one. b𝓞_F = (2)^k·𝔞² with 𝔞 = ∏_{𝔭∤2} 𝔭^{v_𝔭(b)/2} = (c); then u = b/(2^k c²)
   has valuation 0 everywhere, so u ∈ 𝓞_F^× = {±ε^n}.
1. Reduction. {−1, c²} = {−1, c}² = {1, c} = 1; {−1, 2} = {−1, 1 − (−1)} = 1 by the Steinberg
   identity (K2SymbolsBrauer T.2/steinberg-identity); {−1, ±ε^n} = {−1, ±1}·{−1, ε}^n. Hence x
   ∈ ⟨{−1, −1}, {−1, ε}⟩.
1. The subgroup is generated by two elements of order dividing 2, so it has at most 4 elements.
   This discharges the span field of ArithmeticKTheory N.6/order-certificate for the
   presentation with generators {−1, −1}, {−1, ε} and relations 2g = 0; the independent lower
   bound is the pair of sign symbols of N.8/real-quadratic-example-and-birch-tate.

**Acceptance.**

- Cross-check by Tate's Theorem (6.2) with l = 2 and S = {the two real places, (2)}:
  K₂(𝓞_F[1/2])/2 ≅ (μ₂³)₀ ≅ (ℤ/2)², and the relative sequence with cokernel 𝔽₄^× of order 3
  gives K₂(𝓞_F)/2 ≅ (ℤ/2)², the 2-rank r₁ + g₂ − 1 + rank₂ Cl(𝓞_F[1/2]) = 2 + 1 − 1 + 0 = 2.
- Consistency with the source: the K-book lists ℚ(√p), p ≡ 3, 5 mod 8, among the 2-regular
  fields, whose K₂(𝓞_F) is (ℤ/2)^{r₁} plus a finite group of odd order; for ℚ(√5) the odd part
  is excluded by step 2.
- The argument never mentions ζ_F(−1) or w₂(F): the Birch–Tate identity 1/30 = 4/120 of
  SpecialValuesBirchTate B.3 is a test this certificate passes, not an input.
- Other candidate b give nothing new: {−1, 5} = {−1, √5}² = 1 and {−1, 2} = 1 in K₂(F).
- Without step 2 the argument bounds only the 2-torsion subgroup; elements of odd order or of
  order 4 are excluded by restriction to ℚ(ζ₅) and transfer.

**Depends on.** **inside this packet** `tame-kernel-of-q-zeta-five`; **other roadmaps** `K2SymbolsBrauer:T.4/restriction-transfer-degree`, `K2SymbolsBrauer:T.5/unramified-subgroup`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`, `K2SymbolsBrauer:T.3/tame-symbol`, `K2SymbolsBrauer:T.2/matsumoto`, `K2SymbolsBrauer:T.2/steinberg-identity`, `MotivicEtaleKTheory:M.3`; **libraries** `mathlib:RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt`, `mathlib:NumberField.Units.rank`, `mathlib:IsCyclotomicExtension.finrank`.

**Source.** Tate.1976, §6, Theorem (6.1), printed p. 270 (PDF p. 15): “(6.1) Theorem. The top
row of diagram (3.3) is exact, i.e., the image of the map γ in diagram (3.3) is (K2F)l. In
particular, if F contains a primitive l-th root of unity z, then every element of order l in
K2F is of the form {z, a} for some a ∈ F*.” — The two-torsion step with l = 2 and z = −1.
Transcribed from the page image.

**Source.** Kbook.2013, III.6.8 (Theorem 6.8), printed p. 239 (PDF p. 247): “Theorem 6.8. If F
contains a primitive nth root of unity ζ, then every element of K2(F) of exponent n has the
form {ζ, x} for some x ∈ F×.” — The same statement for every field, proved there through
Hilbert's Theorem 90 for K₂; this packet imports the number-field case from MotivicEtaleKTheory
M.3, Tate's arithmetic route. Prose verbatim from the text layer.

**Source.** Kbook.2013, VI.9.9.2 (Example 9.9.2), printed p. 523 (PDF p. 531): “In this case,
we see from 9.9 that K8k+2(OF) is the sum of (Z/2)^{r1} and a finite odd group” — The
two-primary part for 2-regular fields; the example lists ℚ(√p) with p ≡ 3, 5 mod 8 among them.
Used only as a consistency check (acceptance 2).

**Source.** ZhangXu.2016, title and abstract (p. 1523): “In this paper, we prove that the tame
kernel of the cyclotomic field Q(ζ5) is trivial, which confirms a conjecture of Browkin.” — The
input of the restriction–transfer step. The deduction for the real subfield (step 2) is not in
the paper; it is written for this packet from T.4/restriction-transfer-degree.

### `real-quadratic-example-and-birch-tate` — An independent tame-kernel certificate for ℚ(√5), exported to SpecialValuesBirchTate B.3

*application*

The required real quadratic example is F = ℚ(√5), with 𝓞_F = ℤ[(1 + √5)/2] and fundamental unit
ε = (1 + √5)/2 of norm −1. The arithmetic data to certify are degree 2, signature (2, 0), class
number 1 and unit rank 1 with fundamental unit ε. The tame-kernel certificate in N.6's format
is K₂(𝓞_F) ≅ (ℤ/2)², generated by {−1, −1} and {−1, ε}. Lower bound: the sign symbols at the
two real places, σ₁(√5) > 0 and σ₂(√5) < 0, give a homomorphism K₂(𝓞_F) → K₂(F) → (ℤˣ)² sending
{−1, −1} to (−1, −1) and {−1, ε} to (1, −1) (σ₁(ε) > 0 > σ₂(ε)), hence onto a group of order 4;
both symbols are symbols of units and so lie in the tame kernel. Upper bound: the finite
presentation with generators {−1, −1}, {−1, ε} and relations 2g = 0 for each, whose span
obligation — that the two symbols generate K₂(𝓞_F) — is N.8/real-quadratic-upper-generation
(restriction to ℚ(ζ₅) and transfer, with Zhang–Xu's vanishing there, and Tate's description of
the two-torsion). The certificate uses neither the Birch–Tate formula nor a zeta value: N.8
owns it and exports it to SpecialValuesBirchTate B.3, which combines it with its own
computations of ζ_F(−1) = 1/30 and w₂(F) = 120 for the Birch–Tate check 1/30 = 4/120
(RT-AREA-ktheory-1/11); that check is B.3's and supplies neither bound here.

**Hypotheses.**

- F = ℚ(√5) is real quadratic, so totally real with two real places; the ring is its ring of
  integers.
- The format is N.6/order-certificate; the sign symbols are K2SymbolsBrauer
  T.5/real-sign-symbol at the two real embeddings, and the tame kernel is T.5's unramified
  subgroup, identified with K₂(𝓞_F) by T.5/tame-kernel-sequence.
- The upper bound is N.8/real-quadratic-upper-generation, whose inputs are Zhang–Xu's theorem
  K₂(ℤ[ζ₅]) = 0 (N.8/tame-kernel-of-q-zeta-five), restriction and transfer (K2SymbolsBrauer
  T.4/restriction-transfer-degree) and Tate's Theorem (6.1) (MotivicEtaleKTheory M.3). Browkin
  and Schinzel's paper, which the K-book cites for 2-torsion in K₂ of quadratic fields, is not
  used.
- Although the Birch–Tate formula is a theorem for this abelian field (Wiles, with the
  two-primary part; SpecialValuesBirchTate), reading #K₂(𝓞_F) = 4 off it would be a corollary,
  labelled as such, and not a certificate.

**Construction and proof.**

1. Certify the arithmetic data: degree and signature from the minimal polynomial X² − X − 1 of
   ε, the class number from the pinned quadratic-field and class-number API, the unit rank r_1
   + r_2 − 1 = 1 (Mathlib's NumberField.Units.rank) with ε fundamental.
1. Lower bound: compute the two sign symbols of {−1, −1} and {−1, ε} (T.5/real-sign-symbol;
   K-book Ex. III.6.4 for the surjection K₂(F) → {±1}^{r_1}) and conclude that K₂(𝓞_F) → (ℤˣ)²
   is onto.
1. Upper bound: present K₂(𝓞_F) by the two generators with relations 2g = 0; the span
   obligation is N.8/real-quadratic-upper-generation.
1. Fill N.6/order-certificate: the presented group (ℤ/2)² and the lower-bound group (ℤˣ)² have
   order 4, so certificate soundness gives K₂(𝓞_F) ≅ (ℤ/2)², with the two symbols as a basis.
1. Export the certificate to SpecialValuesBirchTate B.3 as the independent input of its
   Birch–Tate check; its ζ-value and w₂(F) computations are B.3's and fill neither bound.

**Acceptance.**

- The two sign symbols separate {−1, −1} and {−1, ε}: their images (−1, −1) and (1, −1)
  generate (ℤˣ)².
- Without the generation argument the example would report #K₂(𝓞_F) ≥ 4 only; with
  N.8/real-quadratic-upper-generation it reports the order 4 and the isomorphism K₂(𝓞_F) ≅
  (ℤ/2)².
- The Birch–Tate identity 1/30 = (+1)·4/120 is SpecialValuesBirchTate B.3's check, which uses
  this certificate as its independent input; an order read off from the formula would be tagged
  as a corollary and could not fill either bound.
- Every number in the example is tagged: degree, signature, class number and units are computed
  (Mathlib's Minkowski criterion and the unit argument of N.8/real-quadratic-upper-generation),
  the order 4 is computed from two independent bounds, and none is deduced from Birch–Tate.

**Depends on.** **inside this packet** `real-quadratic-upper-generation`, `certified-example-format`; **other roadmaps** `ArithmeticKTheory:N.6/order-certificate`, `K2SymbolsBrauer:T.5/real-sign-symbol`, `K2SymbolsBrauer:T.5/unramified-subgroup`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`; **libraries** `mathlib:NumberField.classNumber`, `mathlib:NumberField.Units.rank`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`.

**Source.** Kbook.2013, Ex. III.6.4 (PDF p. 251; book p. 243): “If F is a number ﬁeld with r1
distinct embeddings F֒ →R, show that the r1 symbols ( , )∞on F deﬁne a surjection K2(F)
→{±1}r1.” — The sign symbols at the real places, the lower bound of the certificate (text layer
as extracted; '֒ →' is the hooked arrow).

**Source.** Kbook.2013, VI.8.6 (Birch-Tate Conjecture 8.6), printed p. 515 (PDF p. 523): “Birch
and Tate conjectured in 1970 that for totally real number fields (r2 = 0) we have ζF(−1) =
(−1)^{r1} |K2(OF)|/w2(F). The odd part of this conjecture was proven by Wiles in [229]” — The
formula whose independent test in SpecialValuesBirchTate B.3 this certificate feeds, and which
may therefore not supply its bounds.

---

## Requests to other roadmaps

- `IntegralIwasawaTheory:L3` — Supply the single Vandiver(l) predicate for primes l, with its
  defining equivalence l not dividing the class number of Q(mu_l)^+, and transport along a
  rational cyclotomic-field isomorphism to NumberField.maximalRealSubfield (CyclotomicField l
  Q). Its Lean module/declaration is not yet published; N.7 records the import contract, not a
  second definition. The odd-character equivalence and conditional K-theory consequences remain
  in N.7. Needed by `ArithmeticKTheory:N.7/vandiver-separation`.
- `K2SymbolsBrauer:T.5` — The tame kernel and its exact sequences (T.5/unramified-subgroup,
  T.5/tame-kernel-sequence, T.5/relative-s-integer-sequence), the real sign symbol
  (T.5/real-sign-symbol), and the computations K₂(ℤ) ≅ ℤ/2 with generator {−1, −1}
  (T.5/k2-of-the-integers) and K₂(ℚ) ≅ K₂(ℤ) ⊕ ⊕_p 𝔽_p^×, infinite (T.5/k2-of-the-rationals),
  which N.8 imports and does not recompute (RT-AREA-ktheory-1/9). The certificate format is no
  longer requested from T.5: it is ArithmeticKTheory N.6/order-certificate, and T.5 drops its
  competing certificate paragraph. N.8's two generation proofs also use
  T.5/relative-s-integer-sequence for ℚ(ζ₅), the restriction clause of T.5/unramified-subgroup
  (unramifiedSubgroup_map_le) for ℚ(ζ₅)/ℚ(√5), and, from the same packet,
  T.4/restriction-transfer-degree and T.3/tame-symbol with its convention ∂_v{u, t} = ū.
- `K2SymbolsBrauer:T.7` — The twisted coefficient modules and the norm residue symbol. The
  invariant w_i is defined with the twisted modules. Tate's comparison K₂/m ≅ H² is no longer
  requested from T.7: MotivicEtaleKTheory M.3 owns it (RT-AREA-ktheory-1/8), and N.7's
  tame-kernel vanishing theorem imports it from there (request to M.3).
- `K3BlochGroups:V.5` — The third K-group of the integers, of the rationals and of the Gaussian
  rationals. AUDIT-27 names V.5 as owning the order forty-eight and the Gaussian computation
  that N.8 records.
- `MotivicEtaleKTheory:M.3` — The Galois symbol and Tate's comparison K₂/m ≅ H²(μ_m^{⊗2}) for
  local and global fields and for rings of S-integers with the primes above m inverted, M.3
  being its single owner (RT-AREA-ktheory-1/8): the first of the three inputs of N.7's
  tame-kernel vanishing theorem. N.8 also needs two consequences that Tate proves in §6 of
  'Relations between K₂ and Galois cohomology' (Invent. Math. 36, 1976): Theorem (6.1), that
  for a global field F containing a primitive l-th root of unity z every element of order l of
  K₂F is {z, a} (used with l = 2, z = −1 for ℚ(√5)); and Theorem (6.2), the exact sequence 0 →
  μ_l ⊗ Pic O_S → K₂O_S/l → (∐_{v∈S−S_c} μ_l)_0 → 0 for S containing the archimedean places and
  those above l, with μ_l ⊆ F (used with l = 2 for ℚ(ζ₅) and ℚ(√5)). The general-field form of
  (6.1), K-book III.6.8 through Hilbert's Theorem 90 for K₂, has no owner
  (KTheoryFiniteLocalFields records the proposal of a K2SymbolsBrauer part for it); N.8 needs
  only the number-field case. Needed by:
  `ArithmeticKTheory:N.7/tame-kernel-vanishing-at-a-regular-prime`,
  `ArithmeticKTheory:N.8/tame-kernel-of-q-zeta-five`,
  `ArithmeticKTheory:N.8/real-quadratic-upper-generation`.
- `ArithmeticKTheory:N.5` — The odd K-groups with their Harris-Segal summands, which is where
  the torsion consequences of N.7 live.
- `K2SymbolsBrauer:T.2` — Matsumoto's presentation of the second K-group of a field by
  Steinberg symbols, the skew-symmetry and the relation between the symbol of an element with
  itself and with minus one, all used by the computations N.8 imports. Tate's method in N.8
  (N.8/tate-norm-filtration, N.8/gaussian-tame-kernel-vanishes) uses the Steinberg identity
  (T.2/steinberg-identity), {a, a} = {a, −1} (T.2/symbol-consequences) and {r, −r} = 1
  (T.2:symbols/symbol-negative-unit).
- `KTheoryLowDegrees:U.6` — K₁(ℤ) = {±1} by the determinant (SK₁(ℤ) = 0), and K₁(ℤ[1/p]) =
  ℤ[1/p]^× ≅ ℤ/2 ⊕ ℤ with the p-adic valuation as boundary, which N.8 imports for the first
  K-groups of the integers and the degree-one row of the ℤ[1/p] sequence (RT-AREA-ktheory-1/9).
  The checkpointed KTheoryLowDegrees U.1 packet plans them as U.6/K1-integers and
  U.6/K1-integers-away-from-p; N.8 will cite them by id once that packet is accepted. U.6 → N.8
  is a new atlas edge; it is acyclic. Needed by:
  `ArithmeticKTheory:N.8/k-groups-of-the-integers`,
  `ArithmeticKTheory:N.8/s-integer-sequence-for-one-inverted-prime`.
- `KTheoryLowDegrees:Z.6` — K₀(ℤ) = ℤ (with π₀ of the K-theory space), which N.8 imports for
  the first K-groups of the integers (RT-AREA-ktheory-1/9). The checkpointed KTheoryLowDegrees
  Z.3 packet plans it as Z.6/integers-test. Z.6 → N.8 is a new atlas edge; it is acyclic.
  Needed by: `ArithmeticKTheory:N.8/k-groups-of-the-integers`.
- `KTheoryFiniteLocalFields:L.1` — Quillen's computation K₀(𝔽_q) = ℤ, K_{2i}(𝔽_q) = 0 and
  K_{2i−1}(𝔽_q) ≅ ℤ/(q^i − 1) for i ≥ 1 (K-book IV.1.13), which gives the residue terms of the
  localisation sequence of ℤ ⊂ ℤ[1/p] in N.8's example in every degree. The atlas already has
  L.1 upstream of ArithmeticKTheory (L.1 → N.2); no cycle. Needed by:
  `ArithmeticKTheory:N.8/s-integer-sequence-for-one-inverted-prime`.

## Gaps

**Washington's book, the source of Kummer's criterion, was not obtained.** The K-book states Kummer's criterion, that a prime is irregular exactly when it divides the numerator of one of the Bernoulli numbers in the finite range, and refers to Washington's Introduction to Cyclotomic Fields for the proof, as it does for Kummer's congruences. That book is not freely available and was not obtained. This packet states the criterion as the source states it, with the attribution, and proves nothing about it. NEXT SOURCE ACTION: obtain Washington, chapters 5 and 6, and decompose the proof of the criterion and of the congruences; both are needed before the criterion can be used as anything but an import.

**The Herbrand-Ribet theorem is quoted from a remark.** The eigenspace statement, that l divides the k-th Bernoulli number exactly when the eigenspace of index l-2k of the modulo-l class group is non-zero, appears in the K-book as a remark with a reference to the original papers of Herbrand and of Ribet. Neither was obtained. The node states the theorem in the form the remark gives and records the numerical statement that among irregular primes below four thousand at most three values of k occur. NEXT SOURCE ACTION: obtain Ribet's 1976 Inventiones paper and Herbrand's original, or Washington chapter 6, and decompose the proof; Ribet's half uses modular forms and is a substantial piece of work in its own right.

**Skalba's generalised Thue theorem, an input of Zhang–Xu's proof, was not obtained.** Zhang and Xu construct the sets G_m of small elements whose residues generate k(v)^× at the places of ℚ(ζ₅) of norm at least (2/π)⁴·125 ≈ 20.53 from M. Skalba's generalisation of Thue's theorem (J. Number Theory 46 (1994), 303–322), and their Theorem 3.5, condition (2) of Tate's criterion for the places of norm above 364, rests on it. The publisher's page refused access (HTTP 403) on 6 October 2026, and Browkin's Mathematics of Computation paper states the theorem only for imaginary quadratic fields. Everything else in N.8/tame-kernel-of-q-zeta-five is decomposed from the paper, which also prints the data of its machine-checked cases. NEXT SOURCE ACTION: obtain Skalba's paper, state the generalised Thue theorem for ℚ(ζ₅) with its constant, and decompose the construction of G_m (the proof of Skalba's Lemma 1.2 that Zhang–Xu cite).

## Structural proposals

### N.8 owns its certified examples and imports the rest

*kind: `note-duplicate-boundary`.* RT-AREA-ktheory-1/9 and /11 (confirmed) settle the boundaries. N.8 imports K₀(ℤ) (KTheoryLowDegrees Z.6), K₁(ℤ) (U.6), K₂(ℤ) and K₂(ℚ) (K2SymbolsBrauer T.5) and K₃(ℤ), K₃(ℚ(i)) (K3BlochGroups V.5); it owns the format of a certified example on ArithmeticKTheory N.6's certificate engine, the certificate K₂(ℤ[i]) = 0, the certified tame kernel of the real quadratic field ℚ(√5), and the localisation sequence of ℤ ⊂ ℤ[1/p] in every degree. The Birch–Tate check is SpecialValuesBirchTate B.3's, which imports N.8's real-quadratic certificate. Proposal for the stage text: name those owners, say that N.8 owns the certificates and the ℤ[1/p] sequence, and replace 'before checking Birch–Tate' by 'for SpecialValuesBirchTate B.3 to check Birch–Tate against'.

### The word regular is missing from both libraries and is a cheap early target

*kind: `note-library-target`.* AUDIT-27 records that a grep for the phrase regular prime over both pinned trees returns nothing, and the same for Vandiver. Yet every ingredient is pinned: cyclotomic extensions, rings of integers, class numbers and the Bernoulli numbers in both conventions, with the conversion. The definition of a regular prime is therefore a composition of pinned objects and is one of the cheapest genuinely new definitions in this area, with the decidability instance for a given prime following from the pinned class number. Proposal: record it as an early library target of this roadmap, ahead of the theorems that use it, since it unblocks both the statement of N.7's main theorem and the certified examples of N.8.

### N.8's real-quadratic certificate feeds SpecialValuesBirchTate B.3

*kind: `ownership`.* RT-AREA-ktheory-1/11 (confirmed): N.8 and B.3 both planned the certified real-quadratic tame kernel, and no edge made N.8 available to B.3, while N.8 imported B.3. N.8/real-quadratic-example-and-birch-tate now owns the certificate for ℚ(√5) (with N.6's engine) and no longer imports B.3; N.8/birch-tate-status, which imported B.3, is deleted. Proposal: add the atlas edge ArithmeticKTheory:N.8 → SpecialValuesBirchTate:B.3 (acyclic once N.8's imports of B.3 are gone, checked against the current packets) and let B.3/sqrt-five-birch-tate-check import the N.8 node instead of requesting the certificate from K2SymbolsBrauer T.5. B.3 keeps the w₂ computation, the L-function factorisation and the check, and must not supply the order bound.

### Tate's method is planned in N.8, its only consumer

*kind: `ownership`.* No roadmap plans Tate's method for computing tame kernels: the filtration of K₂(F) by symbols of S_m-units, the graded tame symbol and Tate's criterion (Tate's Proposition 1 and Lemma 1, in Browkin's and Zhang–Xu's statements). A search of the packets for Tate's method, Bass–Tate and the filtration K₂^{S_m} finds only other Bass–Tate results — the Milnor ring of a global field (K2SymbolsBrauer T.2:symbols) and the exact sequence for a rational function field (T.4/bass-tate-sequence) — which are different statements. N.8 needs the method for the span proofs of its two certificates and plans it there (N.8/tate-norm-filtration, N.8/tate-criterion), in the generality of an arbitrary number field. Proposal: if another layer comes to need explicit tame kernels (for instance further fields for SpecialValuesBirchTate, or the imaginary quadratic tables of Browkin and of Belabas–Gangl), move the two nodes to ArithmeticKTheory N.6, beside the certificate engine whose span field they discharge, and let N.8 import them; their ids and statements need no change.

## Suggested signatures and checks

FIX-RT-BP-ArithmeticKTheory--N.7 removes all remaining vacuous theorem declarations,
the arbitrary eigenspace Type stub and the condition replaced by an unstated
proposition. The residue-unit lemma has a genuine Lean signature at the pin.
Herbrand–Ribet awaits the canonical cyclotomic class-group action and its
ZMod l-module/eigenspace interface owned by N.7: its exact odd-prime, finite
Bernoulli range and character index are recorded in mathematical comments,
not asserted for an unrelated carrier. Higher K-group and Bott statements
likewise name the missing carriers, suppliers, hypotheses and full conclusions.
For Vandiver the imported condition is explicit; no second predicate is
defined. The global conjecture at all odd primes, not a condition at one
prime, is equivalent to joint vanishing of K_{4i}(ℤ) for i≥2. K₄(ℤ)=0 stays
unconditional.

FIX-RT-BP-ArithmeticKTheory--N.7~2 adds to the N.8 section genuine signatures for the
arithmetic inputs of the two generation proofs, which the pinned Mathlib can state: Tate's
group U₁ (`tateUnitSubgroup`, on Mathlib's S-units `Set.unit`); the factor one half of Gaussian
division (`gaussian_two_mul_norm_mod_le`), the set of small residues (`gaussianResidueReps`)
with the three inequalities of Tate's criterion and the unit identity i = 1 + (1 + i)·i at the
place of norm 2; for ℚ(ζ₅) the class number (Mathlib's `IsCyclotomicExtension.Rat.five_pid`),
the degree, the inertness of 2 and the Gauss sum √5 = ζ − ζ² − ζ³ + ζ⁴; and for a quadratic
field containing √5 the class number, the inertness of 2, the units ±εⁿ, the two real places
and Minkowski's numerical bound. The K₂ statements of the new nodes (the filtration with its
API and tests, Tate's criterion, the three vanishing or generation theorems) are `not stated
here` comments naming their suppliers, since neither library has K₂.

The packet is checked by the repository's `scripts/check_blueprint.py` with the shared pinned
declaration index: **0 errors, 0 warnings** (20 nodes, 44 baseline declarations, 34 API items,
25 unit tests, 10 planets, 3 gaps, 10 requests). The suggested file imports Mathlib only and
was elaborated with `lake env lean` in an existing build at the Mathlib pin on 6 October 2026:
its only warnings are the 36 placeholder proofs, one for each stated declaration that is left
unproved. Every implementationStatus remains unchecked. The independent review REV-FIX-RT-BP-ArithmeticKTheory--N.7~2 decides whether these
changes go live.
