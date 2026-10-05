# REV-DirichletPadicLFunctions--L4

Accepted after the corrections below, as a completed planning pass. L4 remains
**planned**, with five explicit gaps and three supplier requests. All 192
implementation statuses remain unchecked. This review does not certify proof
closure, source statements rejected by the existing errata, geometric family
realization or whole-file elaboration.

Codex — codex-5ebb6f, 5 October 2026, issue #5877. The reviewed input is commit
`2f646213874960fa8dab54c4787588110255424d`. The plan was submitted by
codex-7e92bd in [PR #6106](https://github.com/CBirkbeck/tauceti-explorer/pull/6106).
I checked my session's previous changed paths against this input and its
combined predecessor; I authored neither. The packet's `review.checked` records
one verdict for every node. No mathematical node, API, test or planet was added
or removed in this review.

## Corrections

1. `baseline` entry `mathlib:ModularForm.E` called its constant term one for
   every natural weight at least three. The native constructor has that range,
   but the coefficient formula needs evenness. Odd-weight Eisenstein forms
   vanish. I corrected the baseline description; the node's actual coefficient
   API already has `Even k`, so its signatures remain unchanged.
2. `mathlib:ZMod.isUnit_iff_coprime` supplies the unit/coprimality criterion.
   It does not itself prove that additive translation is a single cycle. I
   narrowed the description to the native criterion and its separate additive
   use. The consuming residue-lift contracts retain their necessary hypotheses.
3. E8 and E9 are confirmed in the published text and v2. E9's alternative
   conventions now move the possible pole together with the exponent: unshifted
   Mellin coefficients use exponent w−1 and have the constant's possible pole
   at the inverse-coordinate character; inverse-coordinate twisting uses
   exponent w and the trivial-character pole. These are the existing extraction
   findings E52/E55, also consistent with E54. This review claims no new source
   discovery. The historical correction searches remain attributed historical
   evidence; my fresh version comparison is recorded separately.

## Sources and statement checks

I acquired the [published RJW PDF](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf)
and [arXiv v2](https://arxiv.org/pdf/2309.15692v2) afresh. Their SHA-256 values
agree with the retained source records. I read complete physical published
pages 20–24, 28–32, 38–41, 44–47 and 59–62, corresponding to printed
119–123, 127–131, 137–140, 143–146 and 158–161. I collated the entire §8
passage with v2 pages 43–45 and visually inspected published pages 160–161.
All 37 distinct locator records were checked against the relevant passages.
Short quotations were found after normalizing PDF text or stripping HTML.

I also read the complete displayed [Stein Eisenstein chapter](https://wstein.org/books/modform/modform/eisenstein.html),
especially Definition 5.1, equation (4), its two-case constant, and Theorem 5.8.
Its primitive/parity hypotheses and exceptional weight-two case match the
classical supplier request. The cited Miyake proof was not obtained or claimed
read; the request stays with its existing owner. Unused inherited source-version
records are not fresh verification receipts for this L4 review.

| Fresh acquisition | SHA-256 |
| --- | --- |
| RJW published | `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6` |
| RJW v2 | `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4` |
| Stein chapter | `eb50d5d211a33736da400c5953ce96cbb6a3d6332485cfe88d26888a760672fc` |

The [arXiv listing](https://arxiv.org/abs/2309.15692), checked 5 October, still
shows v2 dated 19 December 2024 as the latest revision. The publisher's article
page did not render in the browser tool; the published PDF was accessible.

## Independent mathematical audit

I read all 192 complete contracts, including their hypotheses, proof steps,
prerequisites, source matches, API, uses and tests. The following checks explain
why the existing corrections and qualifications suffice.

- **Positive coefficients:** finite sums count each divisor with multiplicity
  after reduction. Divisors divisible by p are deleted; an index divisible by p
  is retained. Totient precision requires the full modulus
  p^(r−1)(p−1), and residue resolution and coefficient precision are separate.
  Zero resolution and zero coefficient precision have their native meanings.
- **Classical comparison:** actual bundled forms and native level raising are
  used. Coefficients pass through a common rational or character field with
  its two embeddings. The weight is even and at least four in the level-one
  comparison. The p-stabilization scalar is p^(w−1).
- **Localized constant:** let d_a=aδ_a−1 and n_a=xλ_a. Then
  A₀=n_a/(2d_a). The cross-numerator identity proves clearing for every unit;
  canonical a=p+1 supplies regularity when an injection into the total quotient
  is needed. A numerical moment denominator being nonzero does not assert
  regularity of a measure. Ordinary pseudomeasure membership is rejected by
  the sign clearing factor and unbounded positive zeta moments. The actual
  inverse-coordinate character kills every shifted denominator, forbidding
  extensions to those localizations or the entire fraction ring.
- **Full congruences:** the integral cleared series has constant n_a and
  positive coefficient 2d_a A_n. All-test divisibility gives the integral
  congruence. After evaluation and division, the bound is
  p^(−r)/(‖Δ_e‖‖Δ_e′‖). Local equality of denominator norms needs its strict
  smallness assumption. The dyadic numerical controls below detect loss of
  precision on the uncleared constant.
- **Characters and coefficients:** the left factor is ψ(n/d), the right φ(d).
  Multiplying the index by p scales by ψ(p); Euler deletion uses φ(p)p^e.
  Wild twisting acts on the right character before finite projection, so a
  character conductor need not be below the projection resolution. Coefficient
  extension uses native valuation integers and valuation equivalence to reflect
  integral divisibility; it does not assume equality of numerical norm scales
  or replace p-powers with uniformizer powers.
- **Tame constants and normalization:** the doubled family's constant is the
  actual restriction of the tame measure to units, rather than its ambient
  mass. Residue indicators expose the dyadic half's failure of integrality.
  For nonprincipal characters the two-indicator witness has constant −1.
  The dyadic principal case at D>1 uses the separately supplied quadratic
  reference and strict character-distance estimate. At D=1 the tame constructor
  has zero constant and scalar integrality tests ‖2s‖≤1. At odd p, two is a
  native unit and the normalized positive coefficient one detects ‖s‖≤1.
- **New targets:** unit powers converge in a fixed weight component, giving
  the incompatible limits one and zero for alleged moments p^e. Principal tame
  Euler deletion uses distinct prime factors; D=1 recovers the whole localized
  family, and D=3 and D=9 agree. Native degeneracy maps give the classical
  finite sum at Γ₀(pD). Nontrivial primitive left conductor gives zero constant;
  parity and weight at least three remain mandatory.

## Libraries, suppliers and ownership

Every one of the 180 cited baseline statements was read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. I checked ambient typeclass
hypotheses as well as names, and matched source bytes to the pinned git objects.
The complete native Tau Ceti `ArithmeticFunction/TwistedDivisorSum` module was
read. The packet's `review.checks.baselineAudit` preserves each
reference, exact module, statement line, source-file hash and verdict. Hashes
are provenance alongside statement reading, not a substitute for it.

I read all 59 distinct directly referenced foreign node contracts and the two
foreign PMIA stage interfaces. The L1/L2 arithmetic contracts, PMIA finite
projection/restriction/weight/convolution/regularity contracts, and actual
ModularForms Layer 0 request supply precisely the imports used here. No supplier
is promoted from a planned statement into a library theorem. The three requests
retain the completed-algebra comparison on the existing ProfiniteProPGroups
anchor, the actual twist algebra equivalence and primitive-pair classical
Eisenstein forms. Finite-character principal specialization, conductor synthesis
and exceptional weights stay in the five stated gaps.

I checked the applicable AUDIT-24 coverage and RS-14 boundary, and the relevant
accepted RS-13, RS-16 and RS-08 ownership/link records. General Bernoulli and
classical Fourier construction stay with ModularForms; PMIA owns generic measure
algebra comparisons; PadicFamilies owns geometric realization. I read both full
upstream example documents before writing: ArithmeticDirichletSeries (424 lines)
and ModularForms (1601 lines).

## API, reader, signatures and verification boundary

The 28 constructions have 169 API entries and 111 construction tests in total;
there are 358 tests including theorem controls and six planets. Each
construction has at least three meaningful tests. Degenerate levels, weighted
collisions, swapped character order, inverse-character obstruction and dyadic
normalization failures distinguish incorrect constructions. Granularity is one
proposed declaration per node at LEMMA LEVEL; direct nonroutine inputs are linked
or requested. The six planet names identify mathematical objects or results.

I read all 301 typed declaration/API signatures and all 358 examples statically,
with their section variables and native imports. The completed-group-algebra
projection remains the explicit omission comment at suggested lines 4882–4888,
with its request; it is not replaced by an opaque proposition. All API/test
metadata names occur in the suggested file. I read the reader's introduction,
conventions, boundaries, targets and requests; an exact normalized text check
matched every catalogue statement, hypothesis, proof step, prerequisite,
acceptance, API statement and test statement to the already reviewed packet.

The suggested file was unchanged (SHA-256
`9768ed91c8cc0df42fb24f159e4ef49d184269b6168adb8bdd059564b1fef2f6`).
**I did not compile it.** No existing build provides its whole exact pinned
Tau Ceti/prototype dependency closure. Historical bounded-obstruction and
combined-file checks remain historical; I did not run the inherited recovery
scripts and do not turn their receipts into independent compiler evidence.
No Lean file or implementation was written outside the allowed deliverables.

Fresh checks: the indexed blueprint checker and source-issues checker pass;
`git diff --check` passes. The reader-contract comparison reports no mismatch.
The following independent Python controls report **38 exact controls passed**.
They verify concrete rational values and finite-coordinate counterexamples,
not the universal statements or Lean elaboration. The code is embedded so the
receipt does not depend on a deleted scratch directory.

```python
from fractions import Fraction as Q
from math import comb, gcd

B = [Q(1)]
for n in range(1, 59):
    B.append(-sum(Q(comb(n + 1, j)) * B[j] for j in range(n)) / (n + 1))

checks = 0
def check(actual, expected):
    global checks
    assert actual == expected, (actual, expected)
    checks += 1

def vp(x, p):
    x = Q(x)
    assert x
    n, d, v = abs(x.numerator), x.denominator, 0
    while n % p == 0:
        n //= p
        v += 1
    while d % p == 0:
        d //= p
        v -= 1
    return v

def norm(x, p):
    return Q(0) if not x else Q(p) ** (-vp(x, p))

def constant(p, e):
    return -(1 - p**e) * B[e + 1] / (2 * (e + 1))

def denominator(a, e):
    return 2 * (a**(e + 1) - 1)

def divsum(n, p, e, left=lambda x: 1, right=lambda x: 1):
    return sum(left(n // d) * right(d) * d**e for d in range(1, n + 1)
               if n % d == 0 and d % p != 0)

def bernpoly(n, x):
    return sum(comb(n, j) * B[j] * x**(n - j) for j in range(n + 1))

def tame_value(p, D, eta, e):
    L = -Q(D**e, e + 1) * sum(eta(a) * bernpoly(e + 1, Q(a, D))
                              for a in range(D))
    return (1 - eta(p) * p**e) * L

def residue(p, D, eta, n, a):
    return -Q(1, D) * sum(eta(a + p**n * j) * j for j in range(D))

eta3 = lambda a: (0, 1, -1)[a % 3]
eta4 = lambda a: (0, 1, 0, -1)[a % 4]
eta5 = lambda a: (0, 1, -1, -1, 1)[a % 5]
check(B[1], Q(-1, 2))
check(B[4], Q(-1, 30))
check(B[6], Q(1, 42))
check(divsum(6, 2, 3), 28)
check(divsum(2, 3, 3), 9)
check(divsum(2, 3, 4), 17)
check(constant(2, 3), Q(-7, 240))
check(constant(2, 7), Q(-127, 480))
check(constant(2, 7) - constant(2, 3), Q(-113, 480))
check(norm(constant(2, 7) - constant(2, 3), 2), 32)
check(denominator(3, 3), 160)
check(denominator(3, 7), 13120)
check(norm(denominator(3, 3), 2), Q(1, 32))
check(norm(denominator(3, 7), 2), Q(1, 64))
check(denominator(3, 3) * constant(2, 3), Q(-14, 3))
check(denominator(3, 7) * constant(2, 7), Q(-10414, 3))
check(vp(Q(-10400, 3), 2), 5)
check(Q(1, 8) / (norm(160, 2) * norm(13120, 2)), 256)
check(norm(denominator(4, 57), 3), norm(denominator(4, 3), 3))
assert norm(constant(3, 57) - constant(3, 3), 3) <= Q(1, 9)
checks += 1
check(denominator(6, 7) - denominator(6, 3), 3356640)
check(vp(3356640, 5), 1)
check(divsum(5, 2, 1, eta3), 4)
check(divsum(5, 2, 1, right=eta3), -4)
check(divsum(5, 2, 5, eta3) - divsum(5, 2, 1, eta3), 3120)
check(divsum(3, 2, 1, right=eta4), -2)
check([tame_value(2, 3, eta3, e) for e in range(3)], [Q(2, 3), 0, Q(-10, 9)])
check(residue(2, 3, eta3, 2, 1), Q(1, 3))
check(norm(residue(2, 3, eta3, 2, 1) / 2, 2), 2)
check(residue(2, 5, eta5, 4, 7) - residue(2, 5, eta5, 4, 1), -1)
check(tame_value(3, 4, eta4, 0), 1)
check(constant(2, 3) * (1 - 3**3), Q(91, 120))

# Finite coordinates retain weights and add colliding atoms.
def coordinates(n, p, r, left=lambda x: 1, right=lambda x: 1):
    out = {}
    for d in range(1, n + 1):
        if n % d == 0 and gcd(d, p) == 1:
            a = d % (p**r)
            out[a] = out.get(a, 0) + left(n // d) * right(d)
    return {a: c for a, c in out.items() if c}

check(coordinates(6, 2, 2), {1: 1, 3: 1})
check(coordinates(6, 2, 1), {1: 2})
check(coordinates(5, 2, 3, eta3), {1: -1, 5: 1})
check(coordinates(5, 2, 2, eta3), {})
check(coordinates(3, 2, 1, right=eta4), {})
check(coordinates(3, 2, 1), {1: 2})
print(f'{checks} exact rational and finite-coordinate controls passed')
```

The complete matrix of node verdicts and baseline provenance is in the packet.
The remaining five gaps and three requests are retained for subsequent workers.
