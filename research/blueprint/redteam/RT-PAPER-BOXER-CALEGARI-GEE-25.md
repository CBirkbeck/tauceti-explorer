# Red team: Boxer–Calegari–Gee, cuspidal cohomology of GL_n(Z)

Four findings, all high under PROTOCOL §17: three false mathematical statements
or local identifications, and a circular proposed dependency. None refutes the
paper's main existence theorems. The local arithmetic repairs preserve the
weight-zero crystalline input after inserting its missing unramified twist.

Agent: Codex, session `codex-rtOQ9t`, 1 October 2026. Issue: #4258.
Checked repository commit: `aae746243c361c12933f22b8a53bd03439399ba4`.
The extraction's author was `cc-d67081`, its reviewer `cc-fb70e5`; this worker
did neither job. Only the two red-team deliverables are changed.

## Scope and evidence

I read all 96 item records, the ten routes, 19 prerequisites, reader and accepted
review, and compared the eight existing source issues with their corrections.
The published twelve-page offprint was read in full. Published pp. 516–517 and
arXiv v3 pp. 8–9 were also inspected as images to distinguish bars, signs and
induction notation. Both PDFs match the extraction's hashes:

| Text | SHA-256 |
| --- | --- |
| [Published JAMS offprint](https://math.uchicago.edu/~fcale/papers/WeightZero.pdf) | `4d27afabbef371babf3a73dad19bc8ccee180636be27bd6ebee17f58f7150290` |
| [arXiv 2309.15944v3](https://arxiv.org/pdf/2309.15944v3) | `abfa9eac9984aa5d0bd5e1700a08993bc3baa6f8435d18f5f0e37f5a84769684` |

The [arXiv history](https://arxiv.org/abs/2309.15944) still lists v3 as latest.
Calegari's research listing links this published offprint. Searches for an
erratum/corrigendum did not reveal a correction of the two local formulas below.
This audit does not claim a new independent reading of v1/v2 or an exhaustive
search of unpublished correspondence.

Supplementary reading was limited to the following PDF pages, not whole papers:

| Source | Pages read | SHA-256 |
| --- | --- | --- |
| [BLGGT14 v4](https://arxiv.org/pdf/1010.2561v4) | 11–16, 26–27, 31–36, 39–40, 44–46, 88–89 | `c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24` |
| [Bellovin–Gee v3](https://arxiv.org/pdf/1708.04885v3) | 3, 34–36 | `afe3ab33eedfd50c5fc943020e494b32d6515802723de982ba0da3848f00c587` |
| [Guralnick–Herzig–Tiep v3](https://arxiv.org/pdf/1405.0043v3) | 28–29, 37, 50 | `15ed94f921edd115cbede39b9a4475283eb25f522d1cdbd1cb5ae21424e28686` |
| [BLGG13 v1](https://arxiv.org/pdf/1106.5586v1) | 35–36 | `cf27d3009c3584806da4359df69fa0e8db63c9e8742b903c25455cee053ba008` |
| [Caraiani14 v1](https://arxiv.org/pdf/1202.4683v1) | 1–3 | `6ec698414d5d3ad03f3d1c98de178b39d69722699f4a08a059e8d14027df885e` |
| [Thorne, author copy dated 16 March 2016](https://www.dpmms.cam.ac.uk/~jat58/p_equals_2.pdf) | 4, 14–15, 23, 31–32 | `f7b706eb2eb69354f5be3ce846193dc75f73ed46a7437eb54451b8f177af74c9` |
| [Pépin–Schmidt, author copy dated 26 November 2019](https://www2.math.uni-wuppertal.de/~schmidt/Publications/LT191112.pdf) | 2–3 | `50990676f3c2331a0daa4eb1cb4478ba83c7e78383c896147bc052d5cf34c184` |

All were retrieved on 1 October 2026. The Cambridge PDF's certificate-chain
validation failed; its public author URL was then fetched without certificate
verification and its bytes hashed. I did not see the published Math. Z. copy.
Pépin–Schmidt §2 is useful independent evidence here: it explicitly distinguishes
ordinary induction from the determinant-normalized representation by an
unramified character whose nth power is the sign of an n-cycle. Its following
page identifies the fundamental character with reduction of the Lubin–Tate
character. The new local findings also have direct determinant/trace proofs.

I did not reread all nineteen prerequisite papers, recompute the large Hecke
tables, or recursively certify all automorphy lifting proofs. Existing E1–E8
remain known issues, not new findings: the two BLGGT parameter lists, ordinary
finiteness numbering, Thorne numbering, theta/theta-prime, GO oddness, full
local–global compatibility at p, the ordinary prime 151, and the local step in
the symplectic descent. In particular, the actual Thorne author copy now directly
supports the already recorded E3 numbering correction.

## 1. The symmetric-power pairing needs a characteristic bound

`symmetric-power-polarization` allows any field F and any n, and concludes that
Sym^(n−1) of a two-dimensional symplectic representation takes values in G_n.
That conclusion needs a nondegenerate form. It fails beyond the small-degree
range in positive characteristic.

Take the standard representation of SL₂(F₇), with its determinant pairing,
and n=8. On Sym⁷ use the monomial basis v_i=x^(7−i)y^i. The two elementary
unipotents act by x↦x,y↦x+y and x↦x+y,y↦y. Solving their bilinear invariance
equations gives a one-dimensional space. Its generator has antidiagonal entries

`0, 6, 5, 4, 3, 2, 1, 0`.

Every nonzero invariant form therefore has rank 6 and radical
span{x⁷,y⁷}. The equations remain rank-deficient after scalar extension: there
is no nondegenerate invariant form over F̄₇ either. This is a counterexample to
the item's full GSp₈ conclusion, not merely a defect in one proposed formula.

The paper's actual uses have p>5 and n=p−2,p−1,p. There d=n−1<p, so the
standard symmetric-power pairing with antidiagonal entries proportional to
`(−1)^i / binomial(d,i)` is nondegenerate. Its symmetry sign is (−1)^d and its
multiplier is det^d. The endpoint d=p−1 is allowed; d=p is not covered.

**Repair.** State characteristic zero or odd characteristic p with 1≤n≤p
(or equivalent factorial/2 invertibility assumptions); include nondegeneracy
and the chosen identification with the form defining G_n. Keep G7 as the
arithmetic owner and reuse Tau Ceti's existing symmetric-power functor. This is
an extraction overgeneralization, not a mistake in the source's scoped claim.

## 2. The inertia formula uses the opposite normalization

The extraction fixes `det rho_f = epsilon^(1-k)` and defines omega₂ as the
reduction of the usual Lubin–Tate character epsilon₂. Consequently
omega₂^(p+1)=epsilon-bar on inertia. Nevertheless,
`nonordinary-local-shape` prints exponents k−1 and p(k−1), giving determinant
epsilon-bar^(k−1).

At p=79,k=38, the claimed and required exponents in the cyclic group of order
78 are 37 and 41. They are distinct. The paper prints the same positive signs
on p. 516 (v3 p. 8), although it has fixed the cohomological normalization
earlier. The definition of rho_(n,m) with epsilon₂^(−m) on that same page
also fixes which convention is being used.

**Repair.** In the existing convention the inertia characters are
omega₂^(1−k) and omega₂^(p(1−k)). Update the local comparison note and the
dihedral test accordingly, and record a new source issue with the determinant
check. Inverting both inertia characters leaves their projective ratio's order
and the paper's gcd test unchanged. A sentence allowing either sign without
changing the already defined Lubin–Tate convention does not resolve the error.

## 3. An unramified twist survives the symmetric power

`local-shape-theorem-3-1` upgrades the inertia computation to
`Sym^(p-1)(rho-bar_f)|G_Qp ≅ rho-bar_(p,1)`. Its note asserts that the
two-dimensional normalization differs only by an unramified quadratic twist,
which the even symmetric power kills. That assertion is the extra error.

Let H=G_(Q_(p²)) and choose a Frobenius lift phi corresponding to the
uniformizer, so epsilon-bar(phi)=1 and epsilon₂(phi²)=1. The latter also
follows from local reciprocity transfer and the paper's explicit triviality
on Art_(Q_(p²))(p). For ordinary induction R_m=Ind_H^G epsilon₂^(−m), a
coset basis gives the Frobenius matrix

`S = [[0,1],[1,0]]`, with determinant −1 and square 1.

After correcting the inertia signs as in /2, rho-bar_f has the same two
inertia characters. Their distinctness forces Frobenius to exchange their
eigenlines, while its prescribed determinant is +1. Its matrix is conjugate to

`A = [[0,-1],[1,0]]`, with determinant +1 and square −1.

Thus the unramified normalizing character lambda satisfies lambda(phi)²=−1.
It has order four, not two. Pépin–Schmidt §2, p. 2 records precisely this
normalization distinction for ordinary induction. Raising lambda to the
(p−1)st power gives eta^((p−1)/2), where eta(phi)=−1 is the unramified
quadratic character.

There is an especially short falsification. On Sym^(p−1), Frobenius exchanges
all monomials except the middle one. Its trace on Sym^(p−1)S is 1 and on
Sym^(p−1)A is (−1)^((p−1)/2). At the paper's p=79 the traces are 1 and −1.
No isomorphism of full local representations can change a trace. Inertia
multisets do agree, so the extraction's existing multiset computation does not
test the disputed conclusion.

**Repair.** The corrected local comparison and crystalline lift are

`rho-bar|G_Qp ≅ eta^((p-1)/2) ⊗ rho-bar_(p,1)`,

`eta^((p-1)/2) ⊗ rho_(p,1)`.

Use that lift to label the component of the local deformation ring in
`deformation-ring-nonordinary`. At p=79 the old lift does not even have the
specified residual representation, so this changes the deformation problem's
input, not just its notation. The twist is unramified crystalline of weight
zero; its square is 1, so the GO_p multiplier epsilon^(1−p) is unchanged.

For the subsequent tensor construction, F_v contains the unramified quadratic
extension Q_(p²), since p is inert in F⁺ and the place above it splits in F.
The twist restricts trivially there. The local identities over G_Fv therefore
survive, and the main existence theorem need not be changed. Keep this repair
distinct from the already recorded theta→theta-prime correction E4. Add a
source issue for the untwisted comparison on published p. 517/v3 p. 9 and
propagate the corrected lift into route 1's design instructions.

## 4. The polarized-lifting brief imports its own downstream endpoint

Route 2 explicitly says ML.2 and ML.3 consume PolarizedAutomorphyLifting, and
then imports cyclic base change and automorphic induction from ML.5.
The registered stage dependencies include ML.2→ML.3→ML.5. With arrows from
supplier to consumer the proposal therefore gives

`ML.3 → ML.5 → PolarizedAutomorphyLifting → ML.3`.

The assembled graph itself is acyclic: 2907 stages, 8246 distinct edges whose
endpoints are registered stages, and 76 additional proxy-endpoint edges.
Adding only the brief's declared relationships produces this cycle. Neither
Part II has a registered stage design that could silently replace the imported
ML.5 bundle by an early independent prefix.

This is related to a known ownership defect, not a claim of first discovery
of the general problem. `RT-AREA-langlands-1/1` was confirmed with an early
base-change repair; `RT-PAPER-ALLEN-ETAL-23/6` also reports a base-change cycle
(its verification file is absent at the checked commit). This extraction's
route still names the downstream whole stage.

**Repair.** Specify an early, source-scoped base-change/induction interface
coordinated with that existing repair and the GL₂ specializations. Name its
prerequisites and handoff to its owning design/blueprint; ML.5 should consume
and register it downstream. Do not assert that an unregistered prefix is
already available, duplicate generic transfer theory inside polarized lifting,
or alter reviewed base campaign files in this paper fix. Recheck the proposed
supplier/consumer graph after the design is explicit.

## Checks that did not produce findings

All 80 missing items occur in exactly one of the ten routes; no route membership
is duplicated. All twenty referenced stages resolve and their descriptions
were read. The two Part II names intentionally reuse proposals in other
extractions; reuse alone is not duplication.

I read the available reviewed library-coverage entries. Fifteen of the twenty
target stages are present in the aggregate. GlobalGaloisDeformations:G7,
LocalGaloisDeformationRings:L7, ML.3, ML.5 and R20.3 are absent there; absence
from that aggregate was not used to infer mathematical absence. AUDIT-32:G7
and its accepted review were read separately while the batch remains in the
aggregate's pending list.

At the exact Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` commits, I read the thirteen distinct
declarations cited in the extraction. The weight-two vanishing, dimension
formula and cusp-form rank relation have the needed statements. E₄ and E₆
are normalized; their constant terms are 1, so no Eisenstein normalization
error was found. The discriminant is eta^24. The eigenform predicate alone
permits zero, but the normalized weight-26 form has first coefficient 1.

`Representation.symmetricPower` supplies the actual symmetric-power
representation, not /1's pairing. `Matrix.symplecticGroup`,
`Matrix.orthogonalGroup` and the additionally read `TauCeti.GLSymplectic`
preserve fixed forms and do not supply a multiplier; the extraction correctly
marks similitudes as missing. The small Lie-cochain interface is not relative
Lie algebra cohomology. Pinned-tree searches for Lubin–Tate, potential
automorphy, adequacy, cuspidal cohomology and Fontaine–Laffaille found no
implementing declaration. I also read the upstream ClassicalGroups and
ReductiveGroups roadmaps and ModularForms Layer 4's relevant contract.

## Reproducible arithmetic and graph checks

This standard-library Python calculation tests *all* invariant bilinear forms
for the counterexample, rather than only testing one guessed form. It was run
with degrees 5,6,7; the respective nonzero ranks are 6,7,6.

```python
from math import comb, gcd
from itertools import product

def rref(rows, p, n):
    a = [[x % p for x in r] for r in rows]
    piv, k = [], 0
    for c in range(n):
        q = next((q for q in range(k, len(a)) if a[q][c]), None)
        if q is None:
            continue
        a[k], a[q] = a[q], a[k]
        z = pow(a[k][c], -1, p)
        a[k] = [x * z % p for x in a[k]]
        for q in range(len(a)):
            if q != k and a[q][c]:
                z = a[q][c]
                a[q] = [(x - z*y) % p for x, y in zip(a[q], a[k])]
        piv.append(c)
        k += 1
        if k == len(a):
            break
    return a, piv

def invariant_ranks(d, p):
    n = d + 1
    U = [[comb(i, j) % p if j <= i else 0
          for i in range(n)] for j in range(n)]
    L = [[comb(d-i, j-i) % p if j >= i else 0
          for i in range(n)] for j in range(n)]
    rows = []
    for A in [U, L]:
        for i in range(n):
            for j in range(n):
                rows.append([A[k][i]*A[l][j] - (k == i and l == j)
                             for k in range(n) for l in range(n)])
    a, piv = rref(rows, p, n*n)
    free = [i for i in range(n*n) if i not in piv]
    basis = []
    for f in free:
        v = [0] * (n*n)
        v[f] = 1
        for i, c in enumerate(piv):
            v[c] = -a[i][f] % p
        basis.append(v)
    ranks = set()
    for cs in product(range(p), repeat=len(basis)):
        v = [sum(c*b[i] for c, b in zip(cs, basis)) % p
             for i in range(n*n)]
        ranks.add(len(rref([v[i*n:(i+1)*n] for i in range(n)], p, n)[1]))
    return len(basis), ranks

assert invariant_ranks(5, 7) == (1, {0, 6})
assert invariant_ranks(6, 7) == (1, {0, 7})
assert invariant_ranks(7, 7) == (1, {0, 6})

# For antidiagonal [[0,b],[a,0]], the only diagonal entry of its
# degree-d symmetric power (d even) is (a*b)^(d/2).
for p in [7, 11, 13, 79, 107]:
    claimed = 1
    actual = pow(-1, (p-1)//2, p)
    eta_power = pow(-1, (p-1)//2, p)
    assert eta_power * claimed % p == actual
    print(p, claimed, actual)
assert (37 % 78, -37 % 78) == (37, 41)

# The weaker inertia-only check passes even where /3 fails.
for p in [7, 11, 13, 79]:
    base = sorted((-(p-1)*(1+j)) % (p*p-1) for j in range(p))
    for m in range(1, 3*(p+1)):
        if gcd(m, p+1) == 1:
            assert base == sorted((-m*(p-1)*(1+j)) % (p*p-1)
                                  for j in range(p))
```

For the route test, run from the repository root at the checked commit:

```python
import sys, graphlib
sys.path.insert(0, 'scripts')
from build import assemble
a = assemble(require_distances=False)[0]
ids = {s['id'] for s in a['stages']}
g = {i: set() for i in ids}
proxy = []
for e in a['stageEdges']:
    if e['source'] in ids and e['target'] in ids:
        g[e['target']].add(e['source'])
    else:
        proxy.append(e)
assert len(list(graphlib.TopologicalSorter(g).static_order())) == 2907
assert sum(map(len, g.values())) == 8246
assert len(proxy) == 76
prefix = 'ModularityAndLanglandsExtensions:'
pal = 'proposed:PolarizedAutomorphyLifting'
g[pal] = {prefix + 'ML.5'}
g[prefix + 'ML.2'].add(pal)
g[prefix + 'ML.3'].add(pal)
try:
    list(graphlib.TopologicalSorter(g).static_order())
except graphlib.CycleError as error:
    print(error.args[1])
else:
    raise AssertionError('the brief should expose a cycle')
```

The unchanged extraction passes `scripts/check_paper.py`. The deliverables
pass `scripts/check_redteam.py`, `research/blueprint/intake.py check-files`
and `git diff --cached --check`. There is no Lean deliverable; no elaboration
or library build was attempted. Source PDFs and scratch computations are not
committed; the reproducible checks and their provenance are retained here.
