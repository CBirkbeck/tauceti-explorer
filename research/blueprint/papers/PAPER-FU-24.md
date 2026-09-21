# PAPER-FU-24 — Bianchi multiplicities: extraction and routing checkpoint

Refs #1083. Continuation: Codex, session `codex-a71f92`, 21 September 2026.
Preserves and deepens the ChatGPT Pro checkpoint from PR1399.

**Status: partial checkpoint, not a completed extraction or an accepted route.**
The JSON now saves 123 declaration-sized draft items: nine narrowly identified
library inputs, eleven existing-stage imports, and 103 missing items. Every missing
item has exactly one proposed route. All 42 definitions/constructions have three
API entries and three mathematical unit-test contracts (126 of each). The exact
main-source archive, focused reviewed-audit reconciliation and full checker-access
gaps are closed. The published-version comparison and the specific proof tasks
below remain open. No new theorem is claimed formalized.

## Source and conventions

The main source is [Fu, arXiv:2201.11190v2, 15 February 2024](https://arxiv.org/pdf/2201.11190v2).
The [publisher record](https://annals.math.princeton.edu/2024/200-1/p03) identifies
*Annals of Mathematics* 200 (2024), no.1, 123–152,
DOI `10.4007/annals.2024.200.1.3`. The earlier worker read the complete HTML;
this continuation downloaded the 25-page v2 PDF and read every section, proof
and reference. Its SHA-256 is
`d71e9d3f8d3a1217743c3ba72c9a9630981f054ecefd943ff4edb4879b842614`.
The [public NSF published-version URL](https://par.nsf.gov/servlets/purl/10625156)
was identified, but browser and command-line retrieval timed out. No published-PDF
hash, full version collation or comprehensive visual comparison is claimed.

Ten exact primary PDFs are now registered with URLs, SHA-256 and inspected scope
in `sourceArchives`. Acquisition does not mean that all those papers were read
completely. The main paper was; auxiliary reading is limited to the passages
specified below and in that register.

Equation locators in the JSON refer to **v2 HTML**: the section-6 free-module
sequences are (33) and (34), dimension shifting is (35)–(36), coefficient comparison
is (37), and the global spectral sequence is (38). The polynomial Peter–Weyl
formulae are unnumbered displays before (32), not (29).

For the local argument, fix odd `p`, a product `G` of `m` first congruence subgroups
of `SL₂(Z_p)`, and `W_k = ⊠ Sym^{k_i}`. Write `D_k = ∏(k_i+1)`. Rational Iwasawa
coefficients mean the bounded-denominator algebra `Q_p ⊗ Z_p[[G]]`, not the
unrestricted inverse limit of rational finite group rings. Enveloping completion
is taken on an integral lattice **before** inverting `p`. General finite coefficient
extensions occur only in the statements that provide the relevant comparison.

For the global argument, distinguish `d = [F:Q] = r₁+2r₂` from the number
`r₁+r₂` of archimedean places. The global weight has the latter number of even
entries `κ_v ≥ 2`, and

`Δ(κ) = ∏_(real v) κ_v · ∏_(complex v) κ_v²`.

At a completely split auxiliary prime, a real entry gives the exponent `κ_v−2`
and a complex entry gives two exponents `κ_v/2−1`. This is the dictionary needed
to turn a local multiaffine bound into the global bound; it is not a relabeling
of one weight vector. Modules, duals and Ore fractions retain their handedness.

## What the proof adds

The local endpoint is Fu Theorem 1.4: for a finitely generated rational Iwasawa
module `M` of rank `a`, both the error in

`dim H₀(G, M ⊗ W_k) = a D_k + error`

and every positive-degree homology dimension are bounded by one multiaffine
polynomial of total degree at most `m−1`. First prove the torsion degree-zero
bound. The two finite-module exact sequences give the upper and lower rank
estimates without assuming `H₁` vanishes. Only then use dimension shifting and
finite global dimension. This order avoids a circular use of the desired
higher-homology bound.

The main inputs are the generic cyclic-module bound (Theorems 1.6/3.2), the
comparison of algebraic quotients through microlocalization (Theorem 4.3), and
injectivity after **every integral** Casimir specialization (Theorem 1.5).
Sections 2–3 supply the filtration, central PBW and integral-image calculations;
sections 4–5 supply the analytic and microlocal comparison. Neither “PBW” nor
“locally analytic distributions” alone supplies this chain.

For fixed level and `r₂>0`, the resulting automorphic endpoint is
`dim S_κ ≤ C Δ(κ)/min_v κ_v`, and in parallel weight it is `O(κ^(d−1))`.
The Bianchi specialization gives the linear upper bound. Its two-sided sharpness
uses a separate base-change lower bound at suitable levels; it is not a
consequence of the upper estimate. Historical bounds, the totally-real asymptotic
and conjectural stronger predictions are recorded as context, not silently added
to the proof's dependency graph.

## Existing owners and baseline checks

The initial checkpoint used explorer `5b3798c`. This continuation checked live
main `5de4697bb48359dc1143d6f87bf9fbf6a6a767e4` against the local atlas snapshot.
The implementation baselines are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

The following narrow interfaces were read directly in the pinned Lean sources.
They are imports, not new theorem targets:

| Existing input | Pinned source and scope |
| --- | --- |
| `IsRingFiltration`, `IsModuleFiltration`, integer-index constructor | Mathlib `RingTheory/FilteredAlgebra/Basic.lean`; does not supply the source-specific separation and strictness theorems. |
| Ore ring/module localization and its universal map | Mathlib `RingTheory/OreLocalization/Ring.lean`; an `OreSet` hypothesis is required, not manufactured by naming fractions. |
| PBW word filtration and exhaustivity | Tau Ceti `Algebra/Lie/UniversalEnveloping/PBW/Basic.lean`; no ordered-monomial independence is inferred. |
| PBW graded pieces, direct sum and generator equation | Tau Ceti `Algebra/Lie/UniversalEnveloping/PBW/AssociatedGraded.lean`; not the missing injectivity half of PBW. |
| Normalized `sl₂` Casimir operator and commutation | Tau Ceti `Algebra/Lie/Sl2/Casimir.lean`; field and characteristic restrictions are retained. |
| Primitive-vector eigenvalue `n(n+2)/2` | The same Casimir file, `sl2Casimir_apply_of_hasPrimitiveVectorWith`. |
| Integral standard lattice | `Sl2/IntegralLattice.lean`: `integralLattice`, coordinate equivalence, rank `n+1` and rational spanning. |
| Standard enveloping action | The same file: `repEnveloping` and generator formulas, with root-operator nilpotence. |
| Restricted Kostant action | The same file: `kostantFormRep`, ambient comparison, divided-power and Cartan-binomial preservation. |

The upstream **LieHighestWeight** roadmap owns the field PBW, highest-weight and
Harish–Chandra development. Its actual stage identifiers, including the `lλ`
suffix, are used. It is not re-planned. **ProfiniteProPGroups** supplies the
abstract profinite foundations, not all Lazard analytic theory.

**PadicMeasuresIwasawaAlgebras L1** already constructs completed group rings and
convolution for noncommutative profinite groups. **LocallyAnalyticDistributions
L0** already owns radius-indexed analytic function spaces, their inductive-limit
topology, continuous duals and the projective system of Banach duals. Its later
abelian Amice/character theory is not the general noncommutative Fréchet–Stein
algebra required here. **NoncommutativeAndEquivariantIwasawa NE.0** owns the
Lazard–Venjakob noetherian/homological direction; NE.1's canonical relative Ore
set is not Fu's microlocal set.

**ArithmeticLocallySymmetricSpaces ALS.0–1** supplies the quotient and local
systems. **CompletedCohomologyPartII CC.2–6** supplies the completed tower,
duality, finite chain models, finiteness/torsion and descent spectral sequence.
Its integrated decomposition already records the no-discrete-series torsion
input. Its existing source-proof gaps are not a reason to build another owner.

The relevant complete rows of reviewed AUDIT-13/14/25/26 were read: ALS.0–6
and finite-level duality, CC.0–6, LA L0–L4, NE.0–1 and PadicMeasures L0–L1.
All 50 relevant audit rows match live main. The seven relevant roadmap records
and all 60 of their stages also match the local atlas. The accepted CC torsion
and descent decomposition statements and their review qualifications were read;
the LA decomposition remains an L4 Fredholm/Riesz package, not the missing
noncommutative distribution algebra.

The full reserved-ID map contains no competing local-theory reservation. The
current tree has one blueprint packet (Lawrence–Venkatesh) and the same six
analytic/Habiro/Lawrence–Venkatesh new-roadmap definitions; none owns the proposed
extensions. No collision with the three proposed IDs was found. These checks
remove the former oversized-reader access gap. They are not an exhaustive proof
that every broad mathematical phrase in the entire catalogue has no overlap:
the independent review must still assess the route boundaries.

## Five proposed routes

### 1. `PadicEnvelopingAlgebras` — 33 missing items

A Part II of **Representations of semisimple Lie algebras, highest weight theory,
and the Weyl formulas**. It adds integral `sl₂` PBW lattices, saturated ideal
completion, central reductions and their normal forms, integral image lattices,
the generic annihilator estimate and the affinoid Verma central-annihilator
construction. The integral symmetric-power representation belongs here, before
restricting it to analytic compact groups. Existing filtered-ring, Ore and
ordinary field Lie interfaces remain imports.

The finite-image comparison distinguishes the integral image lattice from all
integral matrices; only the rational image is identified with the full
endomorphism algebra. Infinite low-coordinate strips in the growth estimate are
handled by a direct bound, not dismissed as finitely many exceptional weights.
The explicit uniform majorant and bounded PBW-division argument appear below.
The equal-Casimir nongeneric example is initially an algebraic module; a completed
analogue would need its own quotient and domain argument.

### 2. `NoncommutativeAnalyticDistributions` — 44 missing items

A Part II of **locally analytic distributions, growth, and character spaces**.
It imports the existing function/dual construction and the bounded completed
group ring, then adds uniform-group/Lie comparison, noncommutative analytic
convolution, radius algebras, flatness, microlocalization, algebraic quotient
recovery, crossed products, central analytic duality and the central injectivity
endpoint. The direct induced-character proof and the all-integral affinoid-Verma
route are distinct proof branches with explicit interfaces.

This is reusable local representation theory, not a hidden Bianchi-only lemma.
It does not include Colmez's correspondence or a geometric theorem about locally
analytic vectors of completed cohomology. Its coefficient, radius, handedness,
quotient and separatedness conditions must be present in the subsequent design.

### 3. `WeightAspectAutomorphicMultiplicity` — 25 missing items

A Part II of **Arithmetic locally symmetric spaces and their cohomology**.
It imports the two local extensions and the existing completed-homology library,
then proves the torsion estimate, two rank inequalities, higher homology,
coefficient-field/weight comparisons, global spectral bound and Bianchi result.
The suitable-level lower bound and the support/boundary comparison are required
mathematics, not notation. No totally-real degree saving or unrestricted
arbitrary-level lower bound is proposed.

### 4. Source addition to `CompletedCohomologyPartII`

Attach Fu section 7 and its Calegari–Emerton/Marshall inputs to **CC.2–CC.6**.
The four inventory items are already planned there. This gives an explicit
consumer and source trail rather than duplicating the tower or its spectral
sequence. In particular it does not reinstate the overstrong Ext/base-change
isomorphism criticized in the integrated CC review.

### 5. Source addition to `NoncommutativeAndEquivariantIwasawa:NE.0`

Make the exact Auslander-regular/finite-global-dimension input explicit inside
NE.0's existing homological programme. The JSON marks the source-specific theorem
missing rather than claiming that a broad direction already states every
hypothesis. Groups with `p`-torsion are not granted finite global dimension.

## Source issues requiring explicit resolution

These are recorded as `S1`–`S7` in the JSON. They distinguish checked discrepancies
from further proof obligations; they do not claim to invalidate the main theorem.

**S1 — support convention.** [Marshall 2012](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n3-p13-p.pdf),
section 2.1, uses `H_c` for the cuspidal subspace of ordinary cohomology and states
its dimension identity for nontrivial coefficients. Fu describes it as compactly
supported. Keep the cuspidal injection for the upper bound and prove the
boundary long exact sequence and Poincaré–Lefschetz comparison before transporting
the two-sided statement. The trivial coefficient is a separate case. The lower
bound uses [FGT](https://arxiv.org/abs/0808.1204), Theorem 4.17 and Corollary 4.20,
and the indicated congruence-level class, with restriction/trace for sublevels.

**S2 — bounded series are not norm-completed series.**
[Schneider–Teitelbaum 2003](https://arxiv.org/abs/math/0206056), section 4,
distinguishes the weighted-`c₀` radius completion from the larger bounded space.
Fu (16) displays only boundedness. At `r=p^(-1/p)`, coefficients `c_(pj)=p^(-j)`
have weighted size one, so do not tend to zero. Keep both spaces distinct and
check each claimed density and radius-transition map on the correct one.

**S3 — all integral characters.** Fu 1.5 quantifies over `Z_p^m`, whereas 5.1
first concerns characters induced over `Q_p`. At `p=3`, the scalar `λ=1` would
require `(a+1)²=3`, which has no solution in `Q₃`. The alternate route through
[Ardakov–Wadsley 2014](https://arxiv.org/abs/1308.5104), 4.6 and 5.4, uses a finite
coefficient extension with integral roots and then faithful descent. The `n=0`
case is included in the inspected theorem. The continuation supplies the finite-free coefficient/descent argument below;
these are proposed mathematical proof steps, not an identification of the two
parameter sets or existing Lean comparison declarations.

**S4 — coefficient ramification.** The microlocal set displayed in Fu (17) must
be matched to the uniformizer hypotheses in
[Ardakov–Wadsley 2013](https://arxiv.org/abs/1102.2606), section 10. If `p` lies in
the square of the maximal ideal, a literal set of the form
`∪_a (p^a + m^(a+1))` may contain zero. Start with the unramified construction
needed over `Q_p`; prove the finite-coefficient-extension comparison separately.

**S5 — quotient topology.** A weaker norm filtration on a quotient must be
proved separated before its domain property follows from the associated graded.
The topological PBW comparison left to the reader at the end of Fu 5.1 also needs
a norm/decay and injectivity proof. The bounded-division argument below addresses
that U_r comparison. It does not settle separation of the weaker filtration on
D_r's quotient. Keep Fu's arbitrary-radius statement in view; a proof at the
cofinal rational radii is not automatically the all-real-radius theorem.

**S6 — indices and asymptotic meaning.** Use actual archimedean entries for the
minimum, and separate them from local factors after splitting. The Bianchi
sharpness conclusion is an upper and lower bound up to constants, not a proved
leading constant or ratio-one asymptotic.

**S7 — a domain must be nonzero.** The printed Fu 5.7 statement ranges over
central characters without an integrality/nonzero-quotient qualification. Take
`r=p^(-2/3)`, `λ=p^(-1)` for odd p. The logarithmic coordinates give
`||Δ||_r ≤ p^(2/3) < p = |λ|`. Hence
`Δ−λ = −λ(1−Δ/λ)` is a unit by a convergent geometric series, and the central
quotient is zero. This does not contradict the main integral-parameter theorem.
It does prevent an unqualified nonzero-domain import of the auxiliary statement.
A zero associated graded alone would not prove a zero quotient without separation;
the explicit Banach inverse avoids that inference.

## Primary-source reconciliation

The continuation acquired and read the following exact inputs:

- [Kohlhaase, author PDF](https://www.esaga.uni-due.de/f/jan.kohlhaase/Kohlhaase_Invariant_Distributions.pdf),
  §1.4, the theorem attributed to Frommer and Corollary1.4.1 with proof:
  discretely valued coefficients, rational radii in `p^Q`, weighted-c0
  logarithmic coordinates and finite right-module freeness. It locates the
  original Frommer result at §1.4 Lemma3 and Corollaries1–3. The old original
  preprint URL failed certificate-hostname validation; a candidate modern path
  returned404. Its original proof remains unacquired.
- [AW14 v1](https://arxiv.org/pdf/1308.5104v1), §§4.4–4.6,5.1,5.4:
  the affinoid Verma central annihilator and faithful Iwasawa action, including
  deformation level zero, simple connectedness, integral Cartan weight and
  very-good-prime hypotheses.
- [Ardakov–Brown author PDF](https://people.maths.ox.ac.uk/ardakov/Localisables.pdf)
  and [arXiv v1](https://arxiv.org/pdf/math/0412401v1), §5.4:
  the **lemma** supplies the finite-crossed-product Ext comparison, hence grade
  invariance. The following corollary is about injective dimensions. Fu's
  Corollary5.4 locator is therefore replaced by the precise lemma in the
  extraction. This is *Primeness, semiprimeness and localisation in Iwasawa
  algebras*, not the similarly named survey.
- [ST03 v1](https://arxiv.org/pdf/math/0206056v1), §4:
  the two radius spaces, hypothesis HYP, multiplicativity/noetherianity,
  flatness and selected faithful-flatness proof passages. The rational-radius
  restriction is retained.
- [ST02a v1](https://arxiv.org/pdf/math/0005066v1), coefficient conventions,
  Lemma3.4 and Theorem3.5 with proofs: compact continuous duality and
  admissibility, not the unrestricted algebraic vector-space dual.
- [ST02b v1](https://arxiv.org/pdf/math/9912073v1), Proposition3.7 with proof:
  connectedness of the ambient algebraic group is what makes the enveloping
  center central in distributions.
- [Venjakob v1](https://arxiv.org/pdf/math/0106269v1), §1.2, Theorems3.26 and
  3.29 with proofs: no p-torsion, Auslander regularity, and rational global
  dimension `cd_p(G)`. Their filtered-ring and Ext prerequisites remain
  explicit source inputs.
- [FGT v1](https://arxiv.org/pdf/0808.1204v1), §1 support/boundary discussion,
  Theorem4.17, its concluding proof paragraph and Corollary4.20:
  the lower bound is for `SL2(O_K)`; finite-index sublevels use restriction
  and trace. The complete base-change/local-type proof was not read here.

## Additional mathematical proof steps

### A uniform polynomial with no exceptional-weight gap

Put `x_i=k_i+1`, and let `α` be the coordinatewise truncation degree obtained
from the generic element. One can take

`P_α(k)=2 Σ_i α_i ∏_(j≠i)(k_j+1)`.

When `k≥α`, telescope the difference of the two products of squares in Fu's
estimate. Each term is at most `2α_i x_i ∏_(j≠i)x_j²`; divide by
`D_k=∏x_i`. If `k_i<α_i`, then `D_k≤α_i∏_(j≠i)x_j≤P_α(k)`.
This covers the infinite low-coordinate strips directly. The polynomial has
nonnegative coefficients and total degree at most `m−1`.

### Bounded central PBW division

For one factor, put `M_(a,b,c)=e^a f^b h^c`. For `c≥2`, the exact identity is

`M_(a,b,c) = -4M_(a+1,b+1,c-2)+(4b+2)M_(a,b,c-1)
 +(2λ-4b(b+1))M_(a,b,c-2)+2M_(a,b,c-2)(Δ-λ)`.

It follows from `[e,f^b]=b f^(b-1)(h-b+1)` and `hf=f(h-2)`.
Induction on c constructs remainder/division maps N,Q with
`f=N(f)+(Δ−λ)Q(f)`. The remainder has h-degree at most one, its total degree
does not increase, and Q lowers total degree by at least two. For integral λ at
odd p, coefficients stay integral. For a PBW Gauss weight `ρ≥1`, this gives
`||N||≤1` and `||Q||≤ρ^(-2)`.

Complete the finite PBW polynomials in the weighted-c0 norm. Boundedness extends
N,Q and their identity to this completion. The kernel of N is the **actual**
central ideal, since the Q term explicitly divides it; it is not just an
assertion about a dense ideal. Divide successively for the commuting factors.
At Fu's radius `r_n`, Frommer's theorem gives the normalized e,f,h weight
`ρ=p^n`. Forgetting weights maps the surviving coefficient sequences
injectively to the weight-one central completion. The algebraic owner supplies
weighted completion and bounded division; the analytic owner supplies the
Frommer comparison. There is no reverse roadmap dependency.

This is a proposed proof of the U_r normal-form/injection step. It does not
prove Fu's weaker-quotient-filtration claim for D_r, nor erase S5.

### Finite coefficient descent for the all-integral branch

Adjoin roots of the monic polynomials `a_i²+2a_i−2λ_i`. They are integral in a
single finite extension K. A finite integral basis of O_K identifies the
completed group rings and PBW completions with finite-free coefficient
extension, component by component; decay and bounded denominators are
preserved. Flat extension commutes with the specified central quotients.

For `SL2^m`, odd p is very good and the normalized first-congruence lattice
is exactly the AW14 level-zero lattice. Apply AW14 4.6/5.4 to the integral
Cartan weight, using the existing highest-weight owner's center identification.
Faithfulness forces the Iwasawa-to-central-quotient map over K to be injective;
faithful field extension reflects this over Q_p. These comparison declarations
remain planned, but their mathematical route no longer depends on treating
every integral parameter as a Q_p-induced character.

### The fixed-cusp boundary calculation

At a neat cusp let `z1,z2` generate its lattice in C. On
`E_n=Sym^n⊗conjugate Sym^n`, the two monodromy logarithms are
`z_j A+conjugate(z_j)B`, with `A=e⊗1`, `B=1⊗e`.
Their coefficient matrix is invertible. For nilpotent N,
`exp(N)−1=N u(N)` with u an invertible polynomial. The commuting changes of
operators identify the torus cochain complex with the Koszul complex of A,B.
Each one-variable complex has one-dimensional kernel and cokernel, even at
n=0. Their tensor has cohomology dimensions `(1,2,1)`.

For c cusps this bounds the boundary independently of n, and the long exact
sequence gives `|dim H_c^i−dim H^i|≤3c` for i=1,2. The ordinary/cuspidal
injection and Poincare–Lefschetz comparison use ALS's existing geometric
contracts. Non-neat finite stabilizers still require characteristic-zero
invariants/transfer; they are not silently turned into torus components.

## Validation and continuation

The actual repository command

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-FU-24.result.json`

passes with the full local atlas loader. JSON parsing, 123 unique IDs, exact-once
routing of all 103 missing items, all 42 API/test bundles and the selected
123-vertex/173-edge item DAG pass. The graph of proposed route dependencies is
also acyclic, ordered algebraic core / existing CC and NE sources, then analytic
distributions, then weight-aspect applications. This is not a claim that every
dependency in the whole atlas has been certified.

The exact regression below passes **41,069 assertions**. It checks the explicit
majorant, central PBW dimension counts, standard-module and divided-power formulas,
rational matrix surjectivity versus integral counterexamples, logarithm/exponential
exponents, weighted-c0 counterexamples, finite cusp Koszul ranks and bounded
central-division identities. Finite checks support the formulas; they do not prove
the infinite-dimensional theorems. The 126 API unit-test contracts are mathematical
planning tests, not 126 executed Lean tests. No Lean file was requested or compiled.

The extraction remains partial. Resume with the published-version collation,
AW13/Frommer/DDMS source-proof tasks and the D_r quotient-filtration issue S5.
Preserve S7 and all inherited item IDs. Independent mathematical review and a
closed blueprint remain future work.

## Reproducible exact regression

The following Python3 program uses only the standard library. It creates no files.

```python
"""Exact finite regressions for PAPER-FU-24, not a proof/formalization certificate."""
from fractions import Fraction as Q
from functools import lru_cache
from itertools import product
from math import comb, factorial, prod

checks = 0


def check(condition):
    global checks
    assert condition
    checks += 1


def mat(n, fn):
    return [[Q(fn(i, j)) for j in range(n)] for i in range(n)]


def identity(n):
    return mat(n, lambda i, j: i == j)


def multiply(a, b):
    return [[sum(x * y for x, y in zip(row, col)) for col in zip(*b)] for row in a]


def power(a, n):
    result = identity(len(a))
    for _ in range(n):
        result = multiply(result, a)
    return result


def combine(a, b, scalar=1):
    return [[x + scalar * y for x, y in zip(ar, br)] for ar, br in zip(a, b)]


def scale(a, c):
    return [[c * x for x in row] for row in a]


def flat(a):
    return tuple(x for row in a for x in row)


def rank(rows, prime=None):
    pivots = {}
    for row in rows:
        v = [int(x) % prime for x in row] if prime else list(map(Q, row))
        for j in range(len(v)):
            if not v[j]:
                continue
            if j in pivots:
                c = v[j]
                v = [x - c * y for x, y in zip(v, pivots[j])]
                if prime:
                    v = [x % prime for x in v]
            else:
                c = pow(v[j], -1, prime) if prime else 1 / v[j]
                v = [(x * c) % prime if prime else x * c for x in v]
                pivots[j] = v
                break
    return len(pivots)


def sl2(n):
    size = n + 1
    e = mat(size, lambda i, j: j if i + 1 == j else 0)
    f = mat(size, lambda i, j: n - j if i == j + 1 else 0)
    h = mat(size, lambda i, j: n - 2 * i if i == j else 0)
    return e, f, h


def valuation(n, p):
    assert n > 0
    v = 0
    while n % p == 0:
        n //= p
        v += 1
    return v


def choose_integer(n, k):
    return prod(n - j for j in range(k)) // factorial(k)


# Explicit large-coordinate and infinite-strip majorants.
for m in range(1, 4):
    for alpha in product((0, 1, 3), repeat=m):
        for k in product(range(8), repeat=m):
            x = tuple(v + 1 for v in k)
            dimension = prod(x)
            bound = 2 * sum(alpha[i] * prod(x[j] for j in range(m) if j != i)
                            for i in range(m))
            check(bound >= 0)
            if all(k[i] >= alpha[i] for i in range(m)):
                difference = prod(v * v for v in x) - prod(
                    (x[i] - alpha[i]) ** 2 for i in range(m))
                check(0 <= difference <= bound * dimension)
            else:
                for i in range(m):
                    if k[i] < alpha[i]:
                        strip = alpha[i] * prod(x[j] for j in range(m) if j != i)
                        check(dimension <= strip <= bound)

# PBW normal-form count and explicit integral standard-module formulas.
for n in range(41):
    count = sum(1 for c in (0, 1) for a in range(n + 1)
                for b in range(n + 1) if a + b + c <= n)
    check(count == (n + 1) ** 2)

for n in range(8):
    e, f, h = sl2(n)
    zero = mat(n + 1, lambda i, j: 0)
    check(combine(multiply(e, f), multiply(f, e), -1) == h)
    check(combine(multiply(h, e), multiply(e, h), -1) == scale(e, 2))
    check(combine(multiply(h, f), multiply(f, h), -1) == scale(f, -2))
    casimir = combine(combine(scale(multiply(h, h), Q(1, 2)), h, -1),
                      scale(multiply(e, f), 2))
    check(casimir == scale(identity(n + 1), Q(n * (n + 2), 2)))
    check(power(e, n + 1) == zero)
    check(power(f, n + 1) == zero)
    for k in range(n + 3):
        ep, fp = scale(power(e, k), Q(1, factorial(k))), scale(power(f, k), Q(1, factorial(k)))
        for i in range(n + 1):
            for j in range(n + 1):
                check(ep[i][j] == (comb(i + k, k) if j == i + k else 0))
                check(fp[i][j] == (comb(n - i + k, k) if k <= i and j == i - k else 0))
            check(Q(prod(n - 2 * i - j for j in range(k)), factorial(k)).denominator == 1)
            check(choose_integer(n - 2 * i, k) == Q(prod(n - 2 * i - j for j in range(k)), factorial(k)))
    monomials = [flat(multiply(multiply(power(e, a), power(f, b)), power(h, c)))
                 for c in (0, 1) for a in range(n + 1) for b in range(n + 1)
                 if a + b + c <= n]
    check(len(monomials) == (n + 1) ** 2)
    check(rank(monomials) == (n + 1) ** 2)
    for p in (3, 5, 7):
        if n == p:
            check(rank(monomials, p) < (n + 1) ** 2)
            # The Frobenius span of X^p,Y^p is invariant modulo p.
            for a in (e, f, h):
                check(all(int(a[i][j]) % p == 0 for i in range(1, p) for j in (0, p)))

# Logarithm and exponential convergence: exact exponents of p, no floats.
for p in (3, 5, 7):
    for n in (1, 2, 3):
        exponents = [Q(valuation(j, p)) - Q(j, p ** n)
                     for j in range(1, p ** (n + 1) + 1)]
        check(max(exponents) == n - 1)
        for k in range(1, 101):
            vfactorial = sum(valuation(j, p) for j in range(1, k + 1))
            check(-k + vfactorial <= -Q(k * (p - 2), p - 1))
    for j in range(1, 101):
        # At r=p^(-1/p), the coefficient p^(-j) in degree pj has size 1.
        check(Q(j) - Q(p * j, p) == 0)
        # At r'=p^(-2/p), the same term has norm p^(-j).
        check(Q(j) - Q(2 * p * j, p) == -j)
    # At r=p^(-2/3), ||Delta||<=p^(2/3)<p=|p^(-1)|.
    check(Q(2) - 2 * Q(2, 3) == Q(2, 3) < 1)
    check(Q(2, 3) - 1 == -Q(1, 3))
    # No integral 3-adic square root of 3: all residue candidates fail mod9.
check(not any(x * x % 9 == 3 for x in range(9)))

# Two commuting nilpotent cusp directions; Koszul cohomology dimensions 1,2,1.
for n in range(6):
    e, _, _ = sl2(n)
    s = n + 1
    pairs = list(product(range(s), repeat=2))
    a = [[e[i][u] * (j == v) for u, v in pairs] for i, j in pairs]
    b = [[(i == u) * e[j][v] for u, v in pairs] for i, j in pairs]
    check(multiply(a, b) == multiply(b, a))
    rank_d0 = rank(a + b)
    rank_d1 = rank([[-x for x in br] + ar for ar, br in zip(a, b)])
    dim = s * s
    check(dim - rank_d0 == 1)
    check(2 * dim - rank_d0 - rank_d1 == 2)
    check(dim - rank_d1 == 1)

# Ordered-PBW division by Delta-lambda, checking the polynomial identity and
# degree bounds that make the normal-form/division operators bounded.
def poly_sum(*terms):
    out = {}
    for coefficient, polynomial in terms:
        for key, value in polynomial.items():
            out[key] = out.get(key, 0) + coefficient * value
    return {key: value for key, value in out.items() if value}


for lam in (Q(0), Q(1), Q(3), Q(-1), Q(1, 2)):
    @lru_cache(None)
    def divide(a, b, c):
        if c < 2:
            return {(a, b, c): Q(1)}, {}
        replacements = ((-4, (a + 1, b + 1, c - 2)),
                        (4 * b + 2, (a, b, c - 1)),
                        (2 * lam - 4 * b * (b + 1), (a, b, c - 2)))
        remainder, quotient = {}, {(a, b, c - 2): Q(2)}
        for coefficient, index in replacements:
            nr, nq = divide(*index)
            remainder = poly_sum((1, remainder), (coefficient, nr))
            quotient = poly_sum((1, quotient), (coefficient, nq))
        return remainder, quotient

    for a, b, c in product(range(5), range(5), range(11)):
        remainder, quotient = divide(a, b, c)
        reconstructed = dict(remainder)
        for (u, v, w), coefficient in quotient.items():
            times_central = {
                (u, v, w + 2): Q(1, 2),
                (u, v, w + 1): -2 * v - 1,
                (u + 1, v + 1, w): 2,
                (u, v, w): 2 * v * (v + 1) - lam,
            }
            reconstructed = poly_sum((1, reconstructed), (coefficient, times_central))
        check(reconstructed == {(a, b, c): 1})
        check(all(index[2] < 2 and sum(index) <= a + b + c for index in remainder))
        check(all(sum(index) <= a + b + c - 2 for index in quotient))
        check(all(value.denominator & (value.denominator - 1) == 0
                  for value in list(remainder.values()) + list(quotient.values())))

print(f"PASS: {checks} exact finite assertions; no Lean or infinite-dimensional proof certified")
```
