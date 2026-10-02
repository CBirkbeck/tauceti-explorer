# DESIGN-EllipticModularityEffectiveComparisons — arithmetic and norm-bound checkpoint

Refs #1691. ChatGPT — gpt-20261002-atlas-b73e. Date: 2026-10-02.
Claim 5960106395 was confirmed by bot 5960108537; the issue was reread after confirmation.

## Deliverables and state

This is the first partial blueprint for EllipticModularityEffectiveComparisons,
a Part II of EllipticCurveModularity in the automorphic area. All five job files
are supplied: definition, packet, reader, suggested signatures and this handoff.
The previous existence checks for the roadmap, packet and integrated decomposition
returned no file; no predecessor work was replaced.

Six stages cover all seven routed Bennett–Siksek items: /08 removed-prime bound,
/09 threshold definitions, /10 Kraus realization, /57 Martin's dimension bound,
/59 and /60 the two uniform irreducibility cutoffs, and /82 Lemos. The first three
stages have 20 declarations: five definitions, one comparison, twelve lemmas and
two theorems; sixteen API items; seventeen definition tests and matching admitted
Lean examples; three planets; twelve freshly inspected positive baseline records;
ten open supplier requests and six gap groups. No stage is closed and every
implementationStatus is unchecked. The reader has 5,531 words.

EC.3–EC.5 have precise endpoint contracts and source/proof gaps, not fabricated
nodes claiming those proofs are complete. The original Kraus proof, the full
Mazur–Kenku classification and the Lemos formal-immersion/image certificates remain
required. No blanket Serre uniformity theorem is asserted.

## Mathematical progress

The Martin argument is decomposed into a finite prime-power table, its actual
newspace comparison, product estimates, a coarse bound, all infinite-range
cases, three finite residual checks and the final sharp bound. The finite family
has 11,250 parameter tuples but 10,125 distinct levels. Every unbounded level falls
in an explicit case before this finite check is invoked. The equality cases are
N=35 and primes congruent to 11 modulo 12. The dimension-formula comparison is
still a source/native proof obligation; numerical agreement does not establish it.

The removed-prime argument separates the nonzero trace gap from the product norm
bound. Its integer-norm divisibility step now imports Ideal.absNorm_mem,
Ideal.absNorm_dvd_norm_of_mem and Algebra.coe_norm_int, rather than leaving an
unnamed number-field lemma. The embedding-count upper bound already suffices; no
normal coefficient-field hypothesis is added.

The library's newspace is a Gamma1 space. The packet uses its intersection with
the trivial-character space and the existing Gamma0 equivalence. The dimension
of the full Gamma1 space is never substituted. The geometric all-conjugates
coefficient estimate imports R19.6 and the finer DWP.1 Weil-estimate node, rather
than treating an analytic L-function estimate as Deligne purity.

The threshold definitions use the actual Gamma0 index, actual trivial-character
newspace and lcm(N,4). They keep this index separate from Möbius. Tests at N=4
falsify the incorrect replacement of lcm(N,4) by 4N. M0, the deleted conductor,
remains distinct from N, the prime-to-ell Artin conductor. Their comparison and
Serre weight two are explicit requirements at the Kraus handoff.

## Sources and read boundaries

Read the complete current issue and relevant parts of the accepted
PAPER-BENNETT-SIKSEK-20 extraction. Read the parent R29 audit targets and the full
REV-AUDIT-32 report; its 185-target audit is the earlier reviewer's work, not a
fresh audit by this session. No reviewed audit row exists for this new roadmap.
Selected relevant sections of upstream ModularForms and EllipticCurves were read
for native conventions and ownership; neither entire large document was freshly
re-audited. The source/layer closure in the packet remains partial.

Fresh primary reading:

- Bennett–Siksek, *A conjecture of Erdős, supersingular primes and short character
  sums*, Annals 191 (2020), §2 Theorem 3, Lemmas 2.1–2.2 and the recalled Kraus
  threshold theorem, pp.358–360, with selected §3 uses. Public PDF:
  https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf
  Parsed reading was available; screenshot attempts failed. No fresh PDF hash
  or visual verification of unrendered formulas is claimed.
- Martin, *Dimensions of the Spaces of Cusp Forms and Newforms on Gamma0(N) and
  Gamma1(N)*, arXiv math/0306128v1, 6 June 2003. Theorem 1 and Definitions 1A–1F,
  Theorem 2, and the full printed §4 bound proof, pp.14–16, were read. The table
  page rendered; the bound-proof screenshots failed. The full §2 convolution
  proof, its upstream modular inputs, and the published-version collation remain
  open. Public PDF: https://arxiv.org/pdf/math/0306128
- Lemos, *Serre's uniformity conjecture for elliptic curves with rational cyclic
  isogenies*, arXiv 1702.01985v2, 8 March 2017, introduction, proof overview and
  selected §2 local reduction argument. Public PDF:
  https://arxiv.org/pdf/1702.01985 . Full §3 formal-immersion proof, referenced
  classification and finite image certificates were not verified. No conclusion
  is based on an unread table.
- Kraus's publication record and the theorem recalled by Bennett–Siksek were
  inspected. The complete original *Majorations effectives pour l'équation de
  Fermat généralisée*, Canadian J. Math.49 (1997),1139–1161, Théorème4, was not
  acquired. No source-error verdict or proof closure is claimed for it.

Focused positive pin checks at Mathlib082e2d3 and Tau Cetif790474 include the native
newspace, its character intersection and Gamma0 equivalence; Nat.factorization
and its product identity; the rational totient product; product of embeddings for
the field norm; integral norms; ideal-norm membership/divisibility; integer/field
norm comparison; and card_algHom_le_finrank. Each cited statement and its ambient
hypotheses was read. This is not a full-tree absence audit.

Exact additional source receipts: AbsNorm.lean blob
00e6765ba0e20490bbe27999dc8e2f9e01bc483d; NumberField/Norm.lean
01580e7d942efceab6104f268968cee0afa741f8; FreeModule/Finite/Matrix.lean
4b4270610616d0184a141e2fb40c5d52ddc1f4ec; Totient.lean
e14c6e0393b2fd86b0b827db56ac0b18f0994990. The DWP.1 supplier statement was read
in packet blob10e31ce1a23a223a8720b7cf25a4580fd313e1fb. Its exact node is
DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties. The complete
forty-node automorphic Galois packet was not re-audited; its precise coefficient
adapter remains requested rather than declared implemented.

## Actual validation, and what it does not certify

The exact arithmetic script below was executed and rerun with identical output.
It checks 1,547 small levels, the 772 small-composite cases, 505 near-six cases,
all 11,250 bounded-family tuples (10,125 distinct levels), 30 high-prime-power
regressions and 2,000 independent old/new recursive comparisons. The bounded
family's minimum of N−12g is 18. All tests passed. There are no floating-point
bounds or finite-degree polynomial truncations in this computation.

A separate focused check passed JSON parsing, node IDs, coverage, source IDs,
listed baseline and request coverage, all definition API/test minima, reader and
signature-name parity, seventeen example names, planet limits, whitespace and
private-path scans. The own stage/declaration graph has 26 vertices and 54 edges
and is acyclic. This is not a check of every external supplier or the full atlas.

The repository-wide blueprint checker and indexed/world graph check were not
available locally. The Swarm submission check is separate and its actual outcome
belongs in the PR record. Lean was not compiled: no Lean/Lake or pre-existing
combined pinned build is available. No setup, cache download, library build,
language server or background compiler was started. All supplied proofs in the
suggested file remain admitted. Its missing geometric signature is explicitly
omitted, not replaced by a Prop-valued carrier or an assumed conclusion.

## Resume

First complete Martin's §2 convolution proof and the native Gamma0 newspace
comparison, preserving the trivial character and divisor multiplicities. Replace
the finite regression certificates by proof-producing native evaluations; do not
confuse numerical validation with the modular dimension theorem. Audit any
remaining named arithmetic helper and use existing declarations where available.

Then type the removed-prime comparison on the actual elliptic/residual objects.
Refine parent, R19 and R20 stage requests to existing exact nodes wherever they
suffice; keep any missing coefficient adapter as a precise request. Check ell=3
boundary hypotheses rather than applying an ell≥5 optimizer theorem outside its
range. Preserve the actual integer-ring, coefficient-field and prime-above-ell
maps in the norm argument.

Acquire and fully decompose Kraus's original theorem, including rational
coefficient recognition, Sturm input, exact conductor and full-two-torsion output.
Keep classification consequences separate from generic torsion/isogeny carriers;
confirm the owner and precise form of every Mazur–Kenku input before assigning a
new generic classification theorem. Complete Lemos's formal-immersion and local
arguments and make each finite residual-image check reproducible. No conjectural
extension to arbitrary non-CM curves is a theorem target.

Finally run the actual indexed blueprint and full graph checks and, only with an
existing correctly pinned build, elaborate the signatures. Independent review is
still required. All six gap groups name required work; none is hidden as an
implementation claim.

## Reproducible exact arithmetic certificate

Source SHA-256:
5a04da87c84cef77976a015878b3f144d542463a8787077e8ab5bc45ba21a494.
Stdout JSON SHA-256, including final newline:
d56b81d4a15a6ea3b997d19c6e08cd03a616c16e85e8e7fa64bb6dad275cb98c.
Extract the following block with its final newline and run it using Python3.

```python
"""Exact arithmetic checks for Martin's weight-two newspace bound.
The formula-to-native-newspace theorem is an imported proof obligation.
No computation here certifies modular forms or Lean declarations.
"""
from fractions import Fraction as Q
from itertools import product
from math import prod, gcd
from pathlib import Path
import hashlib, json


def factor(n):
    assert n >= 1
    out = {}
    p = 2
    while p*p <= n:
        while n % p == 0:
            out[p] = out.get(p, 0) + 1
            n //= p
        p += 1
    if n > 1:
        out[n] = 1
    return out


def terms(f):
    n = prod(p**e for p,e in f.items())
    s,vi,v2,v3,mu = Q(1),1,1,1,1
    for p,e in f.items():
        assert p >= 2 and e >= 1
        s *= (1-Q(1,p)) if e == 1 else ((1-Q(1,p)-Q(1,p*p)) if e == 2 else (1-Q(1,p))*(1-Q(1,p*p)))
        vi *= 0 if e % 2 else (p-2 if e == 2 else p**(e//2-2)*(p-1)**2)
        if p == 2:
            v2 *= {1:-1,2:-1,3:1}.get(e,0)
        else:
            v2 *= ({1:0,2:-1}.get(e,0) if p % 4 == 1 else {1:-2,2:1}.get(e,0))
        if p == 3:
            v3 *= {1:-1,2:-1,3:1}.get(e,0)
        else:
            v3 *= ({1:0,2:-1}.get(e,0) if p % 3 == 1 else {1:-2,2:1}.get(e,0))
        mu *= -1 if e == 1 else 0
    value = n*s/12-Q(vi,2)-Q(v2,4)-Q(v3,3)+mu
    assert value.denominator == 1 and value >= 0
    phi = prod(p**(e-1)*(p-1) for p,e in f.items())
    assert n*s <= phi and abs(v2) <= 2**len(f) and abs(v3) <= 2**len(f)
    assert vi >= 0 and vi*vi <= n
    assert 12*value <= phi + 7*2**len(f) + 12
    return n, int(value)


def value(n):
    return terms(factor(n))[1]


def index_mu(n):
    return prod(p**(e-1)*(p+1) for p,e in factor(n).items())


small_equality = []
small_composites = 0
small_largeprime = 0
for n in range(1,1548):
    f = factor(n)
    _,g = terms(f)
    expected = n == 35 or (len(f) == 1 and next(iter(f.values())) == 1 and n % 12 == 11)
    assert 12*g <= n+1
    assert (12*g == n+1) == expected
    if 12*g == n+1:
        small_equality.append(n)
    if n <= 1521 and n > 1 and not (len(f) == 1 and next(iter(f.values())) == 1) and len(f) <= 2:
        small_composites += 1
        assert 12*g <= n+1 and ((12*g == n+1) == (n == 35))
    if gcd(n,6) > 1 and any(p > 41 for p in f):
        small_largeprime += 1
        assert 12*g <= n

levels = {}
parameter_tuples = 0
for p in (7,11,13,17,19,23,29,31,37,41):
    for exps in product(range(6), repeat=4):
        if sum(e > 0 for e in exps) < 3:
            continue
        parameter_tuples += 1
        f = {q:e for q,e in zip((2,3,5,p),exps) if e}
        n,g = terms(f)
        assert 12*g <= n-18
        assert levels.get(n,(f,g)) == (f,g)
        levels[n]=(f,g)
assert len(levels) == 10125 and parameter_tuples == 11250
margin = min(n-12*g for n,(f,g) in levels.items())
assert margin == 18

# Broader regressions: compare the explicit formula with recursive old/new inversion.
# Classical genus formula at weight 2. The square-root sum uses phi(gcd(d,N/d)).
def divisors(f):
    return [prod(p**e for (p,_),e in zip(f.items(),es)) for es in product(*(range(e+1) for e in f.values()))]

def phi(n):
    return prod(p**(e-1)*(p-1) for p,e in factor(n).items())

def genus(n):
    f=factor(n)
    e2 = 0 if n%4 == 0 else prod((1 if p==2 else (2 if p%4==1 else 0)) for p in f)
    e3 = 0 if n%9 == 0 else prod((1 if p==3 else (2 if p%3==1 else 0)) for p in f)
    cusps = sum(phi(gcd(d,n//d)) for d in divisors(f))
    ans=Q(index_mu(n),12)-Q(e2,4)-Q(e3,3)-Q(cusps,2)+1
    assert ans.denominator == 1 and ans >= 0
    return int(ans)

new_recursive={}
for n in range(1,2001):
    divs=divisors(factor(n))
    new_recursive[n]=genus(n)-sum(len(divisors(factor(n//d)))*new_recursive[d] for d in divs if d<n)
    assert new_recursive[n] == value(n)

for p in (2,3,5,7,11,43):
    for e in range(6,11):
        n,g=terms({p:e})
        assert 12*g <= n-6

assert [value(n) for n in (1,4,11,23,30,35)] == [0,0,1,2,1,3]
assert [index_mu(n) for n in (1,4,11,16,35,44)] == [1,6,12,24,48,72]
assert index_mu(4) != index_mu(16)  # lcm(N,4), not 4N.

result={
    'small_levels_checked':1547,
    'small_composites_at_most_two_primes':small_composites,
    'small_gcd6_largeprime_cases':small_largeprime,
    'bounded_family_parameter_tuples':parameter_tuples,
    'bounded_family_distinct_levels':len(levels),
    'bounded_family_minimum_N_minus_12g':margin,
    'old_new_recursive_cross_checks':2000,
    'high_prime_power_regressions':30,
    'small_equality_levels':small_equality,
    'scope':'Exact arithmetic only. Modular dimension comparison and all Lean proofs are not certified.',
    'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
}
print(json.dumps(result,indent=2,sort_keys=True))
```
