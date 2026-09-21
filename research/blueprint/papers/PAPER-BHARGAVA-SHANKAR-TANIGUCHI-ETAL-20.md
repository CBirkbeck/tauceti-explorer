# BSTTTZ: balanced generators and the unreduced norm-curve argument

**Partial continuation, not a completed paper extraction.** Issue #1420.
Initial foundation: Codex, session `codex-a71f92`, merged in #1636.
Continuation: GPT-6 Astra Pro, session `g6ap-0921-classgroup-7c4e`,
21 September 2026.

The companion JSON retains the previous twenty stable item IDs and adds
fifteen items. There are **35 items: ten inherited library items, one
inherited planned item and twenty-four provisional missing items**, each
routed once. The new work expands the part of §4 for fields with **no
index-two subfield**, using the original Bombieri–Pila theorem. It does not
close the reduced-basis source obligation, the remaining relative-genus
argument, or the other branches of the paper. No new implementation,
independent review, or accepted routing decision is claimed.

## 1. Source identity and reading record

The target is M. Bhargava, A. Shankar, T. Taniguchi, F. Thorne, J. Tsimerman
and Y. Zhao, *Bounds on 2-torsion in class groups of number fields and
integral points on elliptic curves*, JAMS **33** (2020), no. 4,
1087–1099, [DOI 10.1090/jams/945](https://doi.org/10.1090/jams/945).
The [Princeton publication record](https://collaborate.princeton.edu/en/publications/bounds-on-2-torsion-in-class-groups-of-number-fields-and-integral/)
records revisions on November 1 and November 20, 2019. This verifies
bibliographic identity, **not agreement of the mathematical text** with
an earlier author copy.

The initial checkpoint read both available 2017 copies completely. The
continuation reread all parsed text of the February copy, concentrating on
§§2–4. The following byte hashes are **inherited measurements from #1636**,
not fresh measurements by this continuation.

| Public file | Version and extent of initial reading | SHA-256 |
| --- | --- | --- |
| [Taniguchi author copy](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf) | February 18, 2017; all 13 pages | `bba54fd02aadec75b51f2cdbb312c702c06f44384e45a7ec57832704e4e106ec` |
| [arXiv v1](https://arxiv.org/pdf/1701.02458) | January 11, 2017; all 12 pages | `99ee35275ecb42c52cd8bbc615538dbe6094326fb72894e88ef82c0b89286871` |
| [MPG deposit](https://pure.mpg.de/rest/items/item_3277755_1/component/file_3277756/content) | November 25, 2020 recompile retaining the arXiv-v1 stamp; opening only | `04e4e52e2e7d2902cfe6ef7c37793650b5a7c3128554cdc3a7a577fb176deb9d` |

The February copy adds §5.4 on degree-one del Pezzo surfaces and references.
Its later date and the MPG recompilation date do not make either a verified
copy of the final article. The MPG publisher-version attachment is
restricted and was not accessed. Ordinary public AMS article, PDF and
[accepted-manuscript](https://www.ams.org/jams/2020-33-04/S0894-0347-2020-00945-6/jams945_AM.pdf)
paths failed in the initial checkpoint; this continuation obtained 403 or
cache-miss failures on further public paths. No access restriction was
bypassed. Use **February-copy page numbers**, not invented journal locators.
Screenshots of the main paper's formula-heavy pages failed, so the present
continuation does not claim successful visual verification of those pages.

### A newly checked original input

Bombieri–Pila, *The number of integral points on arcs and ovals*, Duke
Mathematical Journal **59** (1989), 337–357,
[DOI 10.1215/S0012-7094-89-05915-2](https://doi.org/10.1215/S0012-7094-89-05915-2),
is available as an [author preprint](https://people.maths.ox.ac.uk/pila/Ovals.pdf)
linked from [Pila's Oxford page](https://www.maths.ox.ac.uk/people/jonathan.pila).
The **original Theorem 5 on printed page 17** and its concluding proof were
read; its formula and hypotheses were checked in a successfully rendered
screenshot (PDF page index 16). Earlier introductory and main-lemma passages
were also read, but the full preceding determinant-method proof has **not**
been decomposed or read in its entirety. Direct byte retrieval failed; no
hash is claimed for this additional source.

For an absolutely irreducible plane curve of total degree `d ≥ 2` and
`N ≥ exp(d^6)`, Theorem 5 gives

```text
#(C ∩ Z² ∩ [0,N]²)
  ≤ N^(1/d) exp(12 sqrt(d log N log log N)).
```

It does **not** require smoothness or a bound on the coefficients. Its final
proof explicitly separates the singular points. For fixed `d` and `ε > 0`,
the exponential factor is at most `N^ε` once `N` is sufficiently large in
terms of `d,ε`. The remaining bounded interval is handled by the grid bound
`(floor(N)+1)²`. Integer translation preserves both integer points and total
degree. Thus the usable bound is `O_(d,ε)(N^(1/d+ε))`, uniformly in the
coefficients and integer translates of the square. This conclusion uses the
original input, not a stronger modern replacement.

## 2. The inherited foundation and its unresolved lemma

The first ten library items retain the pinned declaration evidence recorded
by Codex in #1636. That checkpoint reports reading the actual declarations
and comparing seven files byte for byte with Mathlib at
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

- [ClassGroup/Basic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/ClassGroup/Basic.lean#L90),
  [ClassNumber](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/ClassNumber.lean#L58),
  and [Discriminant/Defs](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean#L37).
- [InfinitePlace/Basic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean#L57),
  [CanonicalEmbedding/Basic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean#L187),
  and [Discriminant/Basic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean#L124).
- [MeasureTheory/Group/GeometryOfNumbers](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean#L65).

These supply the ordinary class group, finiteness, signed discriminant,
archimedean places, mixed embedding, integer/fractional-ideal covolumes,
Minkowski's first theorem in strict and compact-boundary forms, and the
small-norm ideal representative. They do not supply the paper's balanced
generator or torsion power saving merely by being present.

The inherited reviewed AUDIT-02 evidence puts general successive minima
and the second theorem in `GeometryOfNumbersAndQuadraticArithmetic:GN.1`.
The inherited EffectiveBounds/AUDIT-03 reading distinguishes coarse existing
class-number and ideal-count bounds from the new application. Generic
reduction must remain with GN.1/GN.3; a new extension cannot own it again.

Two details of the foundation remain essential. First, with ordinary
complex modulus and product Lebesgue measure, a complex disc contributes
`πR_v²`. The weighted body in §2 has volume
`2^r π^s sqrt(D_K)/N(I)`, which is at least `2^n covol(I^(-1))`.
Use compact non-strict Minkowski, including the all-real equality case.
Do not mix this measure with a trace metric that doubles complex coordinates.

Second, the exact Siegel reduced-basis input still needs its original proof.
The source prints a comparison through index `n−2`, whereas the subsequent
argument uses it at `n−1`. The needed statement includes a primitive initial
vector `1`, a degree-uniform product bound, all comparison indices and the
quadratic case. The proof expansions below **consume** the recorded
controlled-basis and largest-minimum lemmas; they do not pretend that this
remaining source obligation has been discharged.

## 3. Expanded §4 argument: no subfield of index two

Here `K` has degree `n ≥ 3`, `D=|Disc(K)| ≥ 1`, and `R=D^(1/n)`. Define

```text
B_K(T) = {β ∈ O_K : |β|_v ≤ T at every infinite place v}.
```

All implicit constants depend only on the displayed degree, scale or epsilon,
not on the field. The following supplies explicit proof details for the new
items. Statements described as repairs or expansions are not attributed to
the source as verbatim named lemmas.

### 3.1 All 2-torsion classes, including the identity

The proof of Theorem 2.1 uses only that the chosen class is killed by `m`:
it starts with `I^m=(α)` and then takes `J=κI`, `β=ακ^m`. It therefore gives
the same balanced generator when the exact order divides `m`. In particular
for every `c ∈ Cl(K)[2]`, choose `J_c` and a nonzero `β_c ∈ B_K(R)` with
`J_c²=(β_c)`.

If `β_c=β_d`, then `J_c²=J_d²`. Unique factorization of nonzero integral
ideals gives `J_c=J_d`, hence `c=d`. Thus this choice is an injection into
the nonzero balanced elements of **absolute square norm**. Indeed,
`|N(β_c)|=N(J_c)²`; there is no reason for the signed field norm itself to
be nonnegative. Both signs must be retained in the curve count below.

### 3.2 Variable-radius counts and exceptional subfields

The lattice argument also gives a useful form with a varying radius. For a
degree-`d` field `F` and `T ≥ D_F^(1/d)`,

```text
#B_F(T) ≪_d T^d / sqrt(D_F).
```

The controlled-basis lemma and largest-minimum estimate put a fundamental
parallelepiped in `B_F(C_d T)`. Its translates by the points of `B_F(T)`
are disjoint up to boundaries and lie in `B_F((C_d+1)T)`. Divide the latter
volume by `2^(-s_F)sqrt(D_F)`. For `F=Q`, count the integers directly.
This argument is uniform in `T/D_F^(1/d)`; it is not a fixed-field
asymptotic with an uncontrolled error term.

Suppose now that `K` has no `F` with `[K:F]=2`, and consider `β` for which
`e=[K:Q(β)]` is even. Then `e≥4`. Put `F=Q(β)` and `d=n/e`. The
relative-discriminant identity gives `D_F^e ≤ D`, so
`D_F^(1/d) ≤ D^(1/n)=R`. An embedding of `F` extends to one of `K`, so
a balanced `β` is in `B_F(R)`. The displayed estimate gives

```text
#B_F(R) ≪_n D^(1/e) / sqrt(D_F) ≤ C_n D^(1/4).
```

There are only a degree-bounded number of subfields: the normal closure has
Galois group of order at most `n!`, and its subgroups are at most `2^(n!)`.
Summing therefore gives `O_n(D^(1/4))` for the entire even-index locus.
In odd degree it is empty. Neither the discriminant tower nor the subfield
count is proposed as a new foundational owner; import the genuine supplier
when completing the library audit.

### 3.3 Keep the unreduced norm curve

For each `β ∈ O_K`, use the **monic** convention

```text
P_β(X) = N_K/Q(X−β) = q_β(X)^e,
q_β = minpoly_Q(β),             e=[K:Q(β)].
```

The characteristic polynomial of multiplication on `O_K` defines the
integral polynomial. Restriction of scalars from `Q(β)`, or the norm tower,
gives the power identity. Since `q_β` is separable, each root has multiplicity
`e`. Consequently `P_β` is a square over `C[X]` precisely when `e` is even;
in that case its monic square root is in `Z[X]`.

If `e` is odd, then `P_β` is not a square in `C(X)`. For either sign `s`,
the monic quadratic `Y²−sP_β(X)` is irreducible over `C(X)`. Gauss's lemma
then makes it irreducible in `C[X,Y]`. Its total plane degree is **n**, even
when it is singular because `e>1`.

This resolves the squarefree-degree problem without changing the cited
input. The squarefree part has degree `[Q(β):Q]`, which can be smaller than
`n`; it cannot be assigned degree `n` in Bombieri–Pila. Instead apply the
original theorem to the **unreduced norm curve**, which really has degree
`n` and is absolutely irreducible. The theorem permits singularities. For
example, for rational `β=a` and odd `n≥3`, `Y²=(X−a)^n` is a singular
irreducible degree-`n` curve, while its squarefree part is linear. The two
models must not be confused for a coefficient-uniform plane-degree bound.

### 3.4 Count translation classes without assuming long boundary fibers

A direct division of `#B_K(R)` by `R` is unjustified: some fibers of the
original box can be very short. Instead choose one `β_L ∈ B_K(R)` for
each coset `L ∈ O_K/Z` that meets it. The map

```text
(L,m) ↦ β_L+m,                  |m| ≤ floor(R),
```

is injective and lands in `B_K(2R)`. Distinct cosets are disjoint, and within
one coset distinct integers give distinct elements. The inherited coarse
box estimate, applied at scale two, yields

```text
# {L : L meets B_K(R)}
 ≤ #B_K(2R)/(2 floor(R)+1)
 ≪_n D^(1/2)/R
 = D^(1/2−1/n).
```

All these sets are finite by the lattice discreteness and boundedness
already used in the box count. This proof deals with boundary fibers without
requiring a new projection-lattice estimate.

### 3.5 The rectangle, both signs, and the final exponent

Fix a representative `β_0 ∈ B_K(R)` in a coset of odd generated-field
index. That index is constant on the coset because
`Q(β_0+m)=Q(β_0)`. Write a counted element as `α=β_0−m`, with
`α ∈ B_K(R)`, `α≠0`. Any embedding gives `|m|≤2R`. Set
`y=sqrt(|N(α)|)`, a positive integer. The product formula with the correct
complex multiplicities gives `y≤sqrt(D)`.

Since `P_β0(m)=(-1)^nN(α)`, one of the two equations

```text
y² = P_β0(m),       y² = −P_β0(m)
```

holds. This maps the counted elements injectively into the disjoint union
of the two signed curves in the rectangle `|m|≤2R`, `0<y≤sqrt(D)`.
For `n≥3` and `D≥1`, the rectangle lies in an integer-translated square
of side `O_n(sqrt(D))`. Both curves are absolutely irreducible of total
degree `n`. The original Bombieri–Pila epsilon bound therefore yields
`O_(n,ε)(D^(1/(2n)+ε))` points in this coset (rescale epsilon if necessary).

Multiply by the translation-class bound and add the even-index exception:

```text
# {0 ≠ β ∈ B_K(R) : |N(β)| is a square}
 ≪_(n,ε) D^(1/2−1/n) D^(1/(2n)+ε) + D^(1/4)
 ≪_(n,ε) D^(1/2−1/(2n)+ε).
```

The last inequality uses `n≥3`. Combining with the injection of §3.1 gives

```text
|Cl(K)[2]| ≪_(n,ε) D_K^(1/2−1/(2n)+ε)
```

**when K has no subfield of index two**. This includes all odd degrees.
It is not a proof of the omitted index-two reduction, nor of the sharper
cubic/quartic exponent. The full extraction must still read the original
relative-genus estimate with its dependence on base class groups, units
and ramified primes. A quadratic-over-Q API is not that relative theorem.

## 4. Provisional ownership, not accepted new jobs

The existing proposed `EffectiveBoundsClassGroupTorsion` Part II is retained
and extended from nine to twenty-two provisional missing application items.
It builds on the completed `tauceti:Completed/EffectiveBounds` roadmap,
imports the class-group/norm/discriminant/ideal APIs and GN.1/GN.3, and owns
the balanced-generator and norm-curve application. The earlier Couveignes
paper's overlapping proposed extension is **not** an installed supplier;
reconcile the two at design time rather than duplicating reduced-basis work.

The two generic Bombieri–Pila items provisionally propose
`IntegralPointDeterminantMethods`, *Uniform integral-point bounds by
determinant methods*. Three full current roadmap documents were read:

- `HeightsRationalPointsAndObstructions`: RP.4 supplies Siegel/Faltings
  finiteness, not this coefficient-uniform finite-box estimate.
- `EffectiveDiophantineMethods`: certified algorithms, descent, logarithmic
  bounds and Chabauty/sieve workflows do not provide this theorem merely
  because they count or enumerate points.
- `LogicAndDefinabilityInNumberTheory`: LD.6 is Pila–Wilkie **outside the
  algebraic part**, not Bombieri–Pila on the algebraic curve itself.

The proposed counting owner must import algebraic geometry, determinants,
real analysis and intersection theory, not duplicate them. An exact-ID
search found no result, but a full catalogue, packets, reserved-ID and
library check remains necessary before the name or route is approved.
The result JSON contains an actionable brief with the exact endpoint,
singular-curve and small-N handling, and the remaining proof-acquisition
work. Function-field counting is **not** obtained by silently copying the
characteristic-zero statement.

## 5. Baseline and prerequisite audit boundary

The Tau Ceti pin remains `f790474821cf4256814db967cb154e7af3d0c369`.
The continuation opened Mathlib `RingTheory/Norm/Basic.lean` at the prescribed
Mathlib pin, lines 1–100: this includes the power-basis norm/constant-term
and norm/product-of-roots statements. It does **not** establish a matching
pinned declaration for the entire norm-polynomial package. Default-branch
keyword searches for norm/minimal-polynomial and Bombieri/Pila terminology
are leads, not proofs of absence at either pin.

The earlier seven-file library checks and reviewed GN/EffectiveBounds audit
readings are retained with attribution; they have not been independently
repeated here. All fifteen new statuses require the final pinned-library
and whole-atlas audit. Generic constituent results should become explicit
imports wherever supplied. The big reviewed library audit and every proposed
roadmap/reserved identifier have not been rechecked in this continuation.

The prerequisite array retains the earlier acquisition register, with the
Bombieri–Pila entry updated to the original source actually read. Siegel,
Helfgott–Venkatesh, Brumer–Kramer, Tsimerman, Sedunova and the §6 counting
sources still need precise original statements and ownership screening.
Links to the citing bibliography are labelled as such; they are not claims
to have accessed the cited original. The array is **not an audited claim that
every listed work is absent from the atlas**.

## 6. Remaining branches and correctness obligations

The following register preserves the substantive unfinished work from #1636.
No entry in it has become an extracted, baseline-verified theorem merely
because the author copy was read.

| Author-copy locus | Remaining work |
| --- | --- |
| Introduction / Theorem 1.1 | Extract torsion carriers and all degree/epsilon quantifiers; finish the relative index-two reduction and sharper cubic/quartic exponent `a=0.2784…`. Retain small-degree boundary cases. |
| Theorem 1.2(a–c), §5.2 | Separate elliptic 2-Selmer, rank and integral-point estimates; specify an integral nonsingular model and its discriminant. The rank bound is not an equality. |
| Theorem 1.3(a–b) | Check the hyperelliptic Jacobian descent input, reducible étale algebras and the distinction between field/étale-algebra, polynomial-order and curve-model discriminants. Algebra discriminant alone need not control the chosen model's bad primes. Compare with the final revision before asserting the exact bound. |
| §5.1 / Theorems 5.1–5.2 | Read Helfgott–Venkatesh packing/height bounds and Brumer–Kramer precisely. Construct the elliptic norm-curve family, verify coefficient/discriminant bounds, prime-divisor loss and feedback inequality. |
| §5.3 / Lemma 5.3, Remark 5.4 | Read Tsimerman's quartic/cubic-resolvent 2-torsion comparison, including the separate justification for reducible resolvents and discriminant comparisons. |
| §5.4 | The February-copy del Pezzo branch is absent from arXiv v1. Check weighted sextic presentation, anticanonical height, primitive representatives, singular fibers, height comparison and the height-sensitive integral-point estimate before claiming `O_X(N^2.87)`. Read Da Costa and the precise original inputs. |
| Theorem 1.4, §6 / (5)–(10), Remark 6.1 | Separate Baily's weighted-resolvent estimate, Cohn's cyclic-cubic count, fixed-quadratic-resolvent asymptotics and partial summation. Count isomorphism classes by normal-closure Galois group, not automorphism group. Constants for a fixed quadratic resolvent are not automatically uniform in it. Landau/Davenport–Heilbronn/Wong comparisons are historical inputs, not new proofs here. |
| §7 / Theorem 7.1 = 1.7 | For a smooth projective geometrically irreducible curve over `F_q`, justify a rational degree-g divisor and the passage from rational Picard points to divisor classes. Construct the even-divisor section locus and its surjection after projectivization; apply Riemann–Roch to obtain `(q^(g+1)−1)/(q−1)`. |
| §7 bounded-gonality branch | Read Sedunova's actual characteristic, degree, epsilon and uniformity hypotheses; the one-line analogy is not a full proof. In characteristic two geometric 2-torsion points have cardinality at most `2^g`, with equality depending on p-rank; distinguish point cardinality from group-scheme length. |

The feedback constants must be preserved exactly. In the author copy,
`α=√3/2` and

```text
b = ((1+α)/(2α)) log((1+α)/(2α))
  − ((1−α)/(2α)) log((1−α)/(2α)),
a = 1 / (6(1−b/log 2)).
```

The integral-point exponent is `ab/log 2`. Check the coefficient of
`log h_2` is below one before absorbing epsilon; do not infer the theorem
from rounded decimal constants.

The next atlas audit still includes EllipticCurves layers 6–7,
RP.0/RP.1, ST.0/ST.3/ST.4, SF.3/SF.5, finite-field curves/Jacobians,
and relative genus-theory suppliers. An average-Selmer programme is not a
pointwise discriminant bound. The new no-index-two argument does not remove
any of these obligations.

## 7. Validation and completion gate

The unmodified repository `scripts/check_paper.py` was executed on the
35-item result using a **scoped local catalogue** containing the inherited
GN.1 owner and completed EffectiveBounds parent. It reported `ok`.
The checker Git blob hash is
`cf3cae9e7d2d41209bf9fa4d719fd6fe17a69f1f`.
All stable IDs are unique, all twenty-four provisional missing items are
routed exactly once, and the ten library items retain their earlier
citations. This checks structure, referenced owner IDs and route
multiplicity, **not** final source agreement, source completeness, mathematical
acceptance or a full-atlas audit. Repository CI uses its full input set.
No Lean file was requested, produced or compiled.

Keep `status: partial`. Obtain the final article, finish the source and
prerequisite coverage, settle the relative-genus and reduced-basis inputs,
audit all statuses/routes and run the full repository checks before calling
this paper job complete. The handoff gives the next worker a concrete order.
