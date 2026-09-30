# Independent verification of RT-BP-EllipticCurveModularity

Codex, session `codex-rtOQ9t`, 2026-09-30. Job #4434. Claim comment
5911564859 was confirmed by bot comment 5911567437. Inspection base:
`d870bd368776cdb91f54ffeeedc54008b5319247`.

All five findings are **confirmed**, with the qualifications below. The
original severities are one medium and four low. This review changes only its
two deliverables; it does not apply fixes or certify the whole blueprint.
The packet author was cc-39fac3, its reviewer cc-fb70e5, and the red-team
author cc-c2c06b. This verifier did none of those jobs.

## 1. Cross-level strong multiplicity one duplicates its owner

The full Layer 5 description in `data/atlas.json`, the corresponding section
of `content/tau-ceti/ModularForms/README.md`, its reviewed library audit in
`data/library-coverage.json`, and RS-06 agree on ownership. Layer 5 explicitly
plans cross-level strong multiplicity one with almost-everywhere **prime**
eigenvalue agreement. The audit distinguishes that target from built
fixed-space results. Specializing the target to weight two and trivial
character does not justify constructing it again in R29.3.

I read the actual declarations at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`:

- `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean`, lines 75–140:
  `HeckeRing.GL2.Newform` has level `N : ℕ`, `[NeZero N]`, weight `k : ℤ`,
  inherited eigenform/character data, newness and normalization.
- `TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean`,
  lines 67–120: `Newform.eq_of_forall_notMem_eigenvalue_eq` fixes the level
  and weight, assumes character equality, and compares all good indices
  outside a finite set. Its hypothesis is stronger than agreement merely
  at almost all good primes.
- `TauCeti/NumberTheory/ModularForms/Newforms/EigenvalueExtension.lean`,
  lines 44–84: the finite-exception extension there does not remove these
  fixed-level/all-good-index restrictions.

Delete `R29.3/strong-multiplicity-one-across-levels`; give each consumer a
Layer 5 prerequisite and a request spelling out the prime-agreement
interface. Preserve the level-11/22 acceptance example. The constructed
form initially has level M dividing the conductor N; the later exact-level
argument must remain. Retain the independent uses of Layer 4 for finiteness,
newforms and bad local factors. This confirms an ownership defect, not the
correctness of the duplicate node's proposed proof.

## 2. Missing explicit supplier prerequisites

I joined each request's `supplier` and `neededBy` against the actual node's
`prerequisites`. There are **nine pairs across eight nodes**, not seven.
Removing the duplicate of finding 1 leaves eight pairs across seven nodes.
All node suffixes below belong to `EllipticCurveModularity`.

| Supplier | Consumer node |
| --- | --- |
| EllipticCurves Layer 4 | `R29.1/residual-conductor-equality` |
| EllipticCurves Layer 4 | `R29.4/bad-euler-factors` |
| ModularForms Layer 4 | `R29.3/a-single-newform-for-infinitely-many-p-and-exact-coefficients` |
| ModularForms Layer 4 | `R29.3/strong-multiplicity-one-across-levels` |
| ModularForms Layer 4 | `R29.3/newform-of-E` |
| ModularForms Layer 4 | `R29.4/bad-euler-factors` |
| ModularForms Layer 8g | `R29.3/rational-coefficient-field` |
| JacobianChallenge Layer F | `R29.5/modular-parametrisation` |
| ModularForms Layer 7 | `R29.6/l-function-continuation` |

Use the complete supplier IDs already present in `requests`, without
inventing aliases in the packet. The proof text invokes the requested
results: Tate uniformization, finiteness/newform decomposition, Galois
conjugation, Abel–Jacobi, and Hecke continuation respectively.

The production assembly has 2,840 stages and 8,007 edges. All nine sources
reach the consumers' **parent stages**. Eight corresponding parent-stage
pairs have direct edges; the remaining path is
EllipticCurves Layer 4 → NeronModelsAndSemistableAbelianVarieties:R11.6 →
EllipticCurveModularity:R29.1. None of the exact nine source/node pairs is
integrated. Parent-stage reachability does not replace the explicit node
prerequisite required by §3. The correction is local prerequisite closure,
with Layer 5 dependencies also added where finding 1 requires them.

The pair comparison is reproducible using the packet's real schema:

```python
nodes = {n['id']: n for n in packet['nodes']}
missing = [(r['supplier'], n)
           for r in packet['requests'] for n in r['neededBy']
           if n in nodes and r['supplier'] not in nodes[n]['prerequisites']]
assert len(missing) == 9
assert len({n for _, n in missing}) == 8
```

## 3. The Jacobian formula drops oldform multiplicities

I read [Cremona, Chapter II, §2.7, printed pp. 26–27](https://johncremona.github.io/book/fulltext/chapter2.pdf),
including the oldclass construction and direct-sum decomposition, and §2.1.1
for the genus/dimension relation. A newform of level M contributes its
degeneracy translates indexed by the divisors of N/M.

The genus formula gives the following exact check. Here μ is the index,
e₂ and e₃ the elliptic-point counts, and c the cusp count:

| N | μ | e₂ | e₃ | c | 1 + μ/12 − e₂/4 − e₃/3 − c/2 |
| --- | --- | --- | --- | --- | --- |
| 1 | 1 | 1 | 1 | 1 | 0 |
| 2 | 3 | 1 | 0 | 2 | 0 |
| 11 | 12 | 0 | 0 | 2 | 1 |
| 22 | 36 | 0 | 0 | 4 | 2 |

The [official Sage genus examples](https://doc.sagemath.org/html/en/reference/arithgroup/sage/modular/arithgroup/arithgroup_generic.html#sage.modular.arithgroup.arithgroup_generic.ArithmeticSubgroup.genus)
independently give genus one at 11 and two at 22. The unique level-11
newform's two old copies exhaust the dimension at 22; levels 1 and 2
contribute nothing. Thus the Jacobian Tate module at 22 has dimension four,
whereas the displayed multiplicity-free expression gives two.

The repair must handle coefficient fields as well as multiplicities. A
full rational Tate-module decomposition indexes newforms by Galois orbits,
includes the divisor multiplicity, and restricts scalars from each
coefficient-field completion. A correctly stated constituent result can
avoid unnecessary full-decomposition notation.

I also read the entire current R14.5 and R19.6 descriptions. R14.5 constructs
the weight-two quotient A_f and handles oldforms; R19.6 compares the Tate
module of **that individual A_f** with its representations. R19.6 does not
currently state the entire Jacobian old/new decomposition. Request that
decomposition from R14.5 using ModularForms Layer 4, then use the individual
R19.6 comparison. Do not silently expand R19.6 into an unsupported citation.
This verifies the erroneous displayed formula; it does not certify every
step of the converse. In particular, semisimplicity alone cannot justify
calling a two-dimensional quotient irreducible.

## 4. Exceptional-set tests miss substantive clauses

I read Serre's §4.6, printed pp. 207–208, and compared the packet's actual
definition and three tests. Dropping both the isogeny and multiplicative
j-valuation clauses still satisfies their stated membership assertions;
adding an extra prime does too. I recomputed invariants, rational-point
multiples and small finite-field point counts using exact rational/integer
arithmetic, rather than relying on curve labels.

For 11a1, `y²+y=x³−x²−10x−20`, one obtains c₄=496,
Δ=−11⁵ and j=−122023936/161051. Hence v₁₁(j)=−5. Multiples of (5,5) are
(5,5), (16,−61), (16,60), (5,−6), O, confirming order five. At the good
prime 3 the curve has five points, so a₃=−1. The characteristic polynomial
of Frobenius on E[7] has discriminant 1−12=3 modulo 7, a nonsquare. A
rational cyclic subgroup of order seven would give an invariant line and
make this polynomial split. Thus there is no such subgroup. The curve has
good reduction at 7 and its only possible bad prime is 11, whose negative
j-valuation is not divisible by 7. This proves **7∉Σ** without needing a
classification of all rational isogenies. The [11.a2 database page](https://www.lmfdb.org/EllipticCurve/Q/11/a/2)
was a cross-check of the equation/label, not a substitute for this argument.

For the equation called 26b1 in Cremona notation,
`y²+xy+y=x³−x²−3x+3`, c₄=129, Δ=−2⁷·13 and
j=−2146689/1664. Multiples of (1,0) are
(1,0), (−1,−2), (3,−6), (3,2), (−1,2), (1,−2), O.
Thus it has order seven. The model has multiplicative reduction at 2
(c₄ is a unit), v₂(j)=−7, and good reduction at 7. Both substantive
clauses therefore imply **7∈Σ**. This example catches deleting both clauses
together; it does **not** independently test each one.

A useful additional valuation-only case is
`y²+xy=x³−7x+9`. Its c₄=337, Δ=−2⁷·137 and
j=−38272753/17536 give multiplicative reduction at 2 and v₂(j)=−7.
It has good reduction at 7. Over F₃ it has six points, so a₃=−2 and the
mod-7 Frobenius discriminant is 4−12=6, again a nonsquare. It has no
rational cyclic subgroup of order seven. Hence 7 belongs to Σ through
the valuation clause alone. An isogeny-only positive case remains a
separate test-design task; this review does not claim these examples
exhaust the definition's behavior.

The arithmetic uses the general Weierstrass formulas
b₂=a₁²+4a₂, b₄=2a₄+a₁a₃, b₆=a₃²+4a₆,
b₈=a₁²a₆+4a₂a₆−a₁a₃a₄+a₂a₃²−a₄²,
c₄=b₂²−24b₄ and
Δ=−b₂²b₈−8b₄³−27b₆²+9b₂b₄b₆. Finite-field counts enumerate all
pairs (x,y) and add the point at infinity; no floating-point arithmetic
or database conductor assumption enters the non-membership tests.

## 5. Suggested-file coverage and a necessary fix qualification

I read the whole suggested file and compared every name with the packet.
None of its twelve named tests occurs. Eight API names are absent even
from comments: `goodReduction_of_not_mem`, `serreWitness`,
`serreWitness_level`, `serreWitness_trace`, `serreWitness_residual`,
`newformOf_unique`, `modularParametrisation_nonconstant`, and
`modularParametrisation_pullback`. The existing general examples and renamed
small-prime facts do not establish the requested coverage.

Correct the header's assertion that newforms are absent: the pinned
structure in §1 exists. Use its actual carrier and hypotheses wherever an
API can be stated. However, the proposed fix's arbitrary explicit level N
plus a comment is insufficient: an arbitrary elliptic curve cannot produce
a weight-two newform at every N, already because the level-one cusp space
is zero. Preserve `[NeZero N]` and a mathematically sufficient relation
between level and curve, and distinguish the initial M|N construction from
the later exact-level result. If the required conductor carrier is not yet
available, document the precise unstateable contract honestly rather than
write a false universal declaration or hide the condition in an opaque
proposition field.

Add stateable exceptional-set tests under the packet's names, and retain a
precise name/contract ledger for genuinely unavailable residual/Jacobian
interfaces. Comments are not elaborated APIs. This review did not perform
a complete library absence audit for those other carriers.

## Evidence and validation

Fresh primary-source reads on 2026-09-30:

- [Serre 1987, §4.6](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf),
  SHA-256 `8048919db24dcb972435aaaa2a74d1168d0fe533af3aa26c6c809b12ddaee038`.
- Cremona Chapter II, cited above, SHA-256
  `432fa5290b2b2ac0d623169e9198d928e5dd75acb490db2d58775630d0f6ea94`.

Both PDF hashes match the packet's source versions. Input hashes at the
inspection base:

| Input | SHA-256 |
| --- | --- |
| Red-team result | `3b0b51d976aeb8b142512929e73fb533557c047c91ba05aedae1c225d22e0cc8` |
| Blueprint packet | `5eb2631efd9128f36e333420d4c67e10720b1e462134ada41b5dcc073d62364e` |
| Suggested Lean file | `0add214f6dfa2435380bce5a8b1c2e692b22132acaa90ee9deaa7263aaa61e39` |
| ModularForms README | `f39069611e8c70ee1314029b0af3db5ea9b387d860e775cabb5f7769db945578` |

The red-team report/result, original review, relevant packet nodes, every
request, API/test lists, suggested file, RS-06 ownership, Layer 5 audit and
the cited supplier descriptions were inspected. This is finding-by-finding
verification, not a fresh complete proof audit of all 21 nodes. No claim
is made that the planned mathematics is formalized.

`scripts/check_blueprint.py` reports zero errors and zero counted warnings
for the unchanged packet. Its preliminary declaration-index diagnostic
states that baseline references were checked for form only; the relevant
pinned Newform declarations were read directly as described above.
The red-team checker passed and the deliverable intake check reported two
files and zero problems. The staged whitespace check passed. No Lean file is changed or compiled in
this review; the previous review's compilation is not claimed as ours.
