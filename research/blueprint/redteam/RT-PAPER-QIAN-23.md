# Red team: Qian, potential automorphy for GL_n

Completed 2026-10-01 by Codex, session `codex-rtOQ9t`, for #4154.
Target: `PAPER-QIAN-23` at atlas commit `84f496c`, including accepted
`REV-PAPER-QIAN-23`. The extraction, completion and review were done by other
sessions; their issue histories were checked before claiming.

Three high-severity findings concern the current extraction's mathematical
contracts. They do not assert that Qian's published potential-automorphy
theorems are false. The result JSON specifies the exact affected items and fixes.

## 1. E43 is accepted but its correction is absent from the planned statements

Items 087 and 088 retain the sign errors in the proof of published Lemma 4.3,
p.1273, although E43 in the same file explains and confirms their correction.
This matters because a worker following the items would try to prove the false
slope identity despite the report saying that the source issue has been handled.

Write `c_τ` for the first of the consecutive labelled Hodge–Tate weights to
avoid confusion with a coefficient prime. With the ACC+ convention
`HT(ε)={−1}`, these weights correspond to constant automorphic weight `+c_τ`.
The central character's Galois realization has weight `n c_τ`.
For an algebraic Hecke character with Galois weights `h_τ`, the local character
relation and compactness of the Galois image give

```text
r_ι(φ) ◦ Art_v = ι⁻¹φ_v · ∏τ τ(·)^(−h_τ),
val_l(ι⁻¹φ_v(ϖ_v)) = Στ h_τ val_l(τ(ϖ_v)).
```

Consequently the exponents in 088 must be `+n c_τ` and `+j c_τ`.
As an elementary sign test, the idèle norm has realization ε, Hodge–Tate
weight −1 and local value `q_v⁻¹`, of valuation `−f_v`. The printed rule would
give `+f_v`. This is a normalization check on the character step, independent
of any unproved local–global strengthening.

There are also rank-two tests within the stated cuspidal setting: start with
a weight-zero regular algebraic cuspidal representation over a CM field and
twist by `||det||⁻¹`. Its Galois realization is twisted by ε⁻¹, its weights
become `{1,2}`, and its central character's local valuation increases by
`2f_v`, whereas 088 prescribes `−2f_v`. Alternatively E43 already identifies
the nonzero value `c_τ=(N−3)/2` in the selected rank-two Dwork family.

Propagate E43 through both statements and proof outlines. Item 135 can use a
dual parameter as notation, but it must not substitute that parameter for
the Hodge–Tate starting weight without changing its sign. The correct
ordinary-automorphy conclusion and the review's semisimplicity qualification
should remain.

## 2. One root is not all roots

Item 076 assumes that the residue field contains an m-th root of every
element of the residual coefficient field. Its conclusion (iv) changes that
existential condition into containment of all roots of unity. Item 078 uses
the same weakened hypothesis before calling the character-root theorem.

A counterexample satisfies the arithmetic constraints of 076 itself:

```text
l = 3, n = m = 7, a = 0, s = 1,
N = 7381 = 11² · 61, F = Q(i), residual representation trivial.
ord_N(3) = 10, k(λ) = F_(3^10), #k(λ)× = 59048.
```

The field contains `F_9`. Seventh powering is bijective because
`gcd(7,59048)=1`, so the asserted existential root condition holds even for
every element of k. Nevertheless k contains no nontrivial seventh root of
unity. The conclusion `7 | #k×` is false. The additional condition excluding
the unitary case in 078 does not repair this: `N∤3^5+1=244`.

The source's §4 opening, published p.1268, and item 073 use the field generated
by all the relevant roots. Route 13's brief also has the stronger condition.
The repair is local and explicit: strengthen both 076 and 078 to that
all-roots condition, or add `μ_m⊂k` separately. E5's distinction between m
and n when l divides n is a different issue and should be preserved.

The numerical checks can be reproduced without a computer algebra package:

```python
from math import gcd
N, q = 7381, 3**10
assert N == 11**2 * 61 and N > 100*7 + 100
assert N % 2 and gcd(N, 3*7) == 1
assert pow(3, 10, N) == 1
assert all(pow(3, d, N) != 1 for d in (1, 2, 5))
assert gcd(7, q-1) == 1 and (q-1) % 7 != 0
assert (3**5 + 1) % N != 0
```

## 3. A zero exponent does not force maximal monodromy

The companion's Remark 1.2, p.2, supplies the shortcut adopted in item 139
and repeated in item 105's note. It fails for

```text
N = 5, a = (1,2,2,0,0), Σa_i = 0 mod 5.
```

Using A'Campo's hypergeometric parameters, choose `α=(0,3)` and `β=(1,2)`
modulo 5. They satisfy `Σα−Σβ = binomial(5,2) mod 5`; the β entries are
distinct and no α equals a β. Definition 2.1.2 reconstructs the exponent
tuple by adjoining to `−α=(0,2)` the complement of `−β`, namely `{0,1,2}`.
Thus it reconstructs a permutation of the displayed tuple. The rank is two.

Proposition 2.5.7 computes infinity's unipotent Jordan blocks from α's
multiplicities. Both multiplicities are one, so the operator is the identity.
Its minimal polynomial is `X−1`, whereas the maximal-monodromy hypothesis
requires `(X−1)²`. Multiplication by any unit modulo 5, corresponding to a
coefficient embedding, preserves the distinctness. The action convention
`(g⁻¹)*` versus `g*` cannot change this conclusion. If a p-adic setting is
desired, take `p=3` and `F=Q_3(ζ_5)`.

There is a useful intrinsic warning as well: simultaneously adding a constant
to all a_i leaves their H_0-character unchanged and allows a representative
with a zero entry. Zero occurrence alone cannot distinguish a special
maximal-monodromy class of characters. E27 already uses this tuple for a
different defect in a differential-equation reduction; it does not correct
Remark 1.2 or remove the shortcut from item 139.

Remove the shortcut, keep the actual maximal-monodromy hypothesis, and retain
the existing consecutive-Hodge–Tate-weight gate for the general companion
argument. The selected family has its own monodromy proof, Corollary 3.5
(item 049), so removing the shortcut does not invalidate that application.

## Coverage and limits

Read the whole published paper and the whole companion, all 145 extracted
items, 16 complete routes, 11 prerequisites, all 49 source-issue records,
and the extraction/review reports. The version comparison distinguishes
arXiv's direct Galois-ordinarity argument from the journal's Steinberg and
ordinary-Hecke argument. Existing issues, including the companion's omitted
Hodge–Tate hypothesis and E10's rejected diagnosis, were not repackaged as
new findings.

All 12 library classifications were checked against actual declaration
statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. In particular, the finite/Galois
restriction on the linear-disjointness converse, the Gauss-sum negation,
continuous-cohomology topology assumptions, and the finite-field involution
wrapper for the unitary group remain visible. Positive partial-library
leads were also checked, without promoting a rank-two or carrier-level result
to a general arithmetic theorem.

Read the 32 named campaign-stage records, their available reviewed audits,
and the four explicitly planned upstream stages. The four Part II identifiers
are proposed extensions at this snapshot. No new owner or duplicate theorem
is proposed by this audit. All 103 missing items occur in exactly one route;
all item dependencies resolve and their graph is acyclic. These are checks
of the extraction, not a certification of every source dependency or the
entire atlas graph. Paper-extraction requirements in §16 were used; absent
blueprint APIs on review-added items are not findings.

## Public sources inspected

Access date for these downloads and readings: **2026-10-01**.

| Source | Reading scope | SHA-256 of downloaded PDF |
| --- | --- | --- |
| [Qian, published paper](https://par.nsf.gov/servlets/purl/10388233) | All 37 PDF pages, journal pp.1239–1275; page images at 1268 and 1273 | `77969caa063c52027dc7274ccef679ce11a2382b8e0b5a8565847922a8d7c0d8` |
| [Qian, original preprint](https://arxiv.org/pdf/2104.09761v1) | pp.1–2,20–25 for the version comparison | `4110023d4691d628adbc96842793696978de962b6109044e5d32779160835415` |
| [Qian, companion](https://arxiv.org/pdf/2103.00106v1) | All 24 pages; page image at p.2 | `87c4ee8499f3a615a81307e17d38d6f00ab544da9d22384f213bbc06052722e9` |
| [A'Campo, Dwork motives](https://arxiv.org/pdf/2407.16481v1) | pp.7–8,15–20; page images at 7,8,19 | `39c42cfdc0367dab692cf11f3923c5846e42aed41f931b7d9b84fa1557bb1c63` |
| [ACC+, Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) | Conventions, weights, lifting and auxiliary-field passages: journal pp.906–908,987,1028–1030,1089–1091,1099–1103 | `c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02` |
| [BLGHT, A family of Calabi–Yau varieties and potential automorphy](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf) | Lemma 2.2, printed pp.17–18 | `225cab84210837ca6130c1c76a5eababeffeaa8d1594b6267e853ce0ae8eabb3` |

Publisher/arXiv metadata and bounded correction searches were consulted;
they do not prove the absence of an author-issued correction. Supplier-paper
reading was limited to the passages specified above.

Validation: `scripts/check_redteam.py`, intake deliverable validation and
`git diff --check`. Exact modular arithmetic and the item/route graph checks
were run separately. No Lean artifact is required for this red-team job,
and none was compiled. Only the two authorized deliverables were changed.
