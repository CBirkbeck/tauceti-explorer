# Canonical finite action-comparison checkpoint

Codex — codex-a71f92. Date: 2 October 2026. Refs #3403.
Claim comment 5955484391 was confirmed by bot 5955487412; the complete issue was reread.
Immutable audit/publication base: e997cbced863f78b70f701b63b07c00bfd93be4f.

Partial checkpoint, not completion, implementation or independent review.
The predecessor's mathematical finite comparison and native signatures are integrated
into the canonical packet and reader. Attribution is retained; these are explicit
algebraic derivations, not claimed new literature results.

[Complete predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/e997cbced863f78b70f701b63b07c00bfd93be4f/research/blueprint/handoff/DESIGN-FunctionFieldArithmeticPartII.md)
preserves its tower arguments, class-family CRT example, historical sources and tests,
and links to the earlier handoff. Historical receipts are not fresh readings here.

## Canonical exports and preservation

Fifteen new RS.0 nodes: one definition, six lemmas and eight theorems. They cover
the actual coordinate action comparison; pure tensors; source and target
coordinates; weighted monomials; kernel and image coefficients; coordinate kernel
and module-cokernel equivalences; injectivity, surjectivity and bijectivity;
unit inverse; specified matrix determinant; simultaneous zero-section rank.

The predecessor proposed fourteen packet nodes plus four API items. The pure-tensor
API is promoted to a separate lemma because downstream nodes use it as a
prerequisite (PROTOCOL section 4). Three projection/uniqueness APIs remain on the
definition, with all eight discriminating tests. The full mathematical statements,
hypotheses, proof inputs and regressions are in the reader, not only in this note.

All 104 inherited node IDs and statements, both routes (28 Yun–Zhang items and 38
Abdurrahman–Venkatesh items), source findings and versions, thirteen requests,
eight gap groups, 39 planets and the reserved root-stack key remain intact.
The sole inherited node edit refines RS.1/affine-chart's proof and prerequisite:
normalized coframes have a **unit parameter** u, satisfying aⁿ=u, and map to
the root chart through x↦ab when u bⁿ=f. Arbitrary coarse charts at f=0 are
not torsors over their coarse base.

The infinite fpqc torsor and Kummer comparison remains open. Neither the native
finite coordinate calculation nor successful finite-ring tests supply the
ordinary-stack, algebraicity, coarse-space or QCoh-descent interfaces.
All ten stages stay partial and every implementation status stays unchecked.

Totals: **119 nodes** (9 definitions, 18 constructions, 46 lemmas, 35 theorems,
10 comparisons, 1 application); **88 APIs, 89 unit tests, 39 planets,
73 baseline records, 8 gaps, 13 requests**. Nine new baseline records import
generic tensor lift, principal-ideal membership, module quotient/isomorphism,
determinant/sign and dimension results. No generic theory is replanned.

## Lean boundary and correction

The **complete suggested file was not compiled**. The existing exact-pinned
Mathlib build is usable, but the required native Tau Ceti line-bundle and
roots-of-unity compiled imports are absent. No project, cache download, library
build or language server was created. Available memory before the single targeted
Lean process was 74 GB; no compiler remains running.

The inherited appended tensor-power signatures had precedence failures: an
unparenthesized power adjacent to a pure-tensor operator was parsed as a power
whose exponent was a tensor. The first fragment run exposed those errors.
Explicit parentheses around each monomial power fix them without altering the
mathematical statements. All preceding native declarations and the entire
geometric omission ledger are byte-preserved; only the opening checking note and
the appended power parentheses change.

The corrected **Mathlib-native comparison fragment** elaborated using Lean
4.34.0-rc2, Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174: exit 0,
27 admitted-declaration warnings only. This fragment contains the eighteen
comparison signatures and eight examples, plus the existing admitted coaction
signature used as a scaffold. The native character generator is expanded to its
actual definition, Multiplicative.ofAdd(1); no replacement group scheme, abstract
coefficient module or assumed geometric predicate is used. This narrow check
does not certify preceding Tau Ceti declarations or the full file.

Fragment SHA-256:
fc42cafb32ee4e0cc7005bbfca4f1b3094232c5a33516f102f27764cc73362b3.
Complete suggested-file SHA-256:
86cbfe7bf454c69259042df9f1e8faf12a96bebc8a6e8a58006a9b5ff59aff33.

## Fresh source and baseline receipts

Freshly read primary scope:

- [Talpo–Vistoli v2](https://arxiv.org/pdf/1410.1164v2), §3.1 pp.14–16:
  character action, Lemma 3.7 proof, fpqc quotient, Lemma 3.12 and
  Proposition 3.10 proof/Corollary 3.13. PDF SHA-256:
  92a90d1e3d9ac46e17de8cc9d9524c1621d5e2a8caea7938de61d6503ec2a6c2.
- [Abramovich–Graber–Vistoli v2](https://arxiv.org/pdf/math/0603151v2),
  Appendix B.1–B.2 pp.52–54, root triples and quotient/fibre descriptions.
  PDF SHA-256:
  c2889c567c21aa5473ba0be75221dbb67ca122210fa4e4973f4727c490bdd5eb.
- [Stacks 040N](https://stacks.math.columbia.edu/tag/040N) and
  [Stacks 0245](https://stacks.math.columbia.edu/tag/0245):
  complete statements and proofs of the unit-parameter finite-free Kummer
  cover and effective affine fpqc descent. Use the former with n>0;
  it does not state the nonunit kernel/cokernel formulas.

Both PDF hashes match the inherited version receipts. No fresh whole-paper
Yun–Zhang, Bresciani or Abdurrahman–Venkatesh read, new erratum, or independent
review is claimed. The preserved source findings and all broader reading
boundaries retain their original attribution.

Read the current aggregate library audit's FunctionFieldArithmetic FA.0–FA.7
records and accepted REV-AUDIT-20 report. Reuse FA.2/FA.4 arithmetic imports;
do not create adeles or reciprocity anew. Read SF.1, R09.3–R09.5 ownership
descriptions and screen touching Part II link files. This continuous session's
complete JacobianChallenge and StableReduction upstream readings supply the
two-document style baseline.

Actual statements at Mathlib 082e2d3 were read in TensorProduct/Maps,
TensorProduct/Basis, AdjoinRoot, MonoidAlgebra/Module, Quotient/Defs and Basic,
Isomorphisms, Ideal/Span, Matrix/Determinant/Basic, Perm/Fin,
Dimension/StrongRankCondition and FiniteDimensional/Lemmas.
At Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 read
RootsOfUnity/Basic's generator and points equivalence, including the inverse
generator evaluation. These support only the concrete group-algebra point map,
not a polynomial quotient equivalence or a general torsor theorem.

## Executed validation

- Actual scripts/check_blueprint.py, exact immutable-tree overlay and pinned
  declaration index: **zero errors and warnings**.
- Actual intake file checks: all five allowed paths pass. JSON,
  whitespace and private-path screens pass. The reader's inherited literal
  placeholder-word mention is replaced with admitted-proof wording.
- Real atlas assemble overlay: **3005 stages, 8723 edges**, acyclic;
  all **52 expected supplier/roadmap stage edges** present; no current
  pending or skipped links.
- Reachable declaration prerequisite graph: **339 vertices**, acyclic.
- New native/API/test names and exact mathematical statements match the
  reader; old statements, requests, source findings/routes/versions,
  planets and the geometric native omission prefix are preserved.

A fresh dependency-free Python regression adapts the predecessor's script;
its finite-vector and multiplication loops are retained, while exact integer
Bareiss determinants replace the unavailable SymPy symbolic routine:

264 ring/exponent/parameter cases; 100100 tensor-monomial multiplicativity
checks; 73 exhaustive finite-ring linear-map cases; **1205091 source vectors
and 1205091 target vectors**; exact kernel and image criteria and cardinalities;
48 integer determinants for n=1,…,8 and f=−2,−1,0,1,2,3; eight
zero-section pivot/rank checks; 270 coefficient reductions; 1496 explicit
index-inverse checks; 2184 unit-inverse weight checks. Nilpotent parameters,
wild units, nonreduced cokernels and nonflat kernel changes pass. These are
regressions, not universal proofs or a geometric-stack certificate.
Script SHA-256:
849339968e4eb216d4d2bf72d55dcc75be4cc3878c5518c247ea34b4ab74460d.

## Exact continuation

Prove the native finite action comparison and all fifteen associated declarations,
then elaborate the complete file in an already-existing build at both pins.
The targeted successful Mathlib fragment does not remove LEAN-SECTION-COMP,
LEAN-GEOMETRY or TOWER-TYPING.

Continue the predecessor's **TOWER-AFF, KUMMER-FINITE and TOWER-TYPING**
contracts with actual scheme/site and coherent root-groupoid carriers:
affine faithfully-flat limits, finite quotient comparisons, factorial
reindexing, finite-stage isomorphism detection and compatible-class lifting.
Retain the explicit CRT family and all-roots-of-2 non-fppf counterexample.
Import D0 ordinary stack construction, R09.4 algebraicity/gerbes, R09.5 coarse
spaces and R09.3 QCoh descent; do not replace them with assumed predicates.

For geometric class field theory resolve ST-LISSE, ST-OPS, NORM-2EXACT,
FA-APPROX and EXTERIOR-COMP with the specified supplier statements. Preserve
all source corrections, the full nonreduced fibre, root-normalized coframe
orientation and the independent symplectic route split. The reserved
FunctionFieldArithmeticPartII:key/root-stacks remains a general partial plan,
not a completed geometric carrier.

## Reproducible arithmetic regression

The following dependency-free script is the exact script with the SHA-256 above.

```python
from itertools import product
from math import gcd
import json

counts = dict(basis_cases=0, multiplicativity_checks=0,
              enumerated_cases=0, source_vectors=0, target_vectors=0,
              integer_determinants=0, branch_ranks=0, reduction_checks=0)

# Independent multiplication of monomials in the two tensor algebras.
for q in (1,2,3,4,5,8,9,12):
    for n in range(1,7):
        for f in range(q):
            counts['basis_cases'] += 1
            def image(i,j):
                return i, (i+j)%n, pow(f,(i+j)//n,q)
            for i,j,a,b in product(range(n), repeat=4):
                iz,it,ic = image(i,j)
                az,at,ac = image(a,b)
                rz,rt,rc = image((i+a)%n,(j+b)%n)
                rc = rc*pow(f,(i+a)//n+(j+b)//n,q)%q
                tc = ic*ac*pow(f,(it+at)//n,q)%q
                assert rc == tc
                assert rc == 0 or (rz,rt) == ((iz+az)%n,(it+at)%n)
                counts['multiplicativity_checks'] += 1

# Exhaustive vector-space/module calculations over finite rings, not fields only.
for q,n in [(q,n) for q in (1,2,3,4,5,8,9) for n in (1,2)] + [(2,3),(3,3),(4,3)]:
    indices = list(product(range(n), repeat=2))
    E = n*(n-1)//2
    for f in range(q):
        perm = [i*n+(i+j)%n for i,j in indices]
        weights = [pow(f,(i+j)//n,q) for i,j in indices]
        im = set()
        kernel = 0
        for c in product(range(q), repeat=n*n):
            out = [0]*(n*n)
            for s,t in enumerate(perm): out[t] = weights[s]*c[s]%q
            out = tuple(out)
            predicted_kernel = all(c[s] == 0 if i+j<n else f*c[s]%q == 0
                                   for s,(i,j) in enumerate(indices))
            assert (not any(out)) == predicted_kernel
            kernel += not any(out)
            im.add(out)
            counts['source_vectors'] += 1
        multiples = {f*a%q for a in range(q)}
        for c in product(range(q), repeat=n*n):
            predicted_image = all(c[i*n+j] in multiples for i in range(n) for j in range(i))
            assert (c in im) == predicted_image
            counts['target_vectors'] += 1
        ann = gcd(f,q)
        assert kernel == ann**E
        assert len(im) == q**(n*n-E)*(q//ann)**E
        assert q**(n*n)//len(im) == ann**E
        assert (kernel == 1) == (n == 1 or ann == 1)
        assert (len(im) == q**(n*n)) == (n == 1 or ann == 1)
        counts['enumerated_cases'] += 1


def comparison_matrix(n,f):
    out=[[0]*(n*n) for _ in range(n*n)]
    for i in range(n):
        for j in range(n):out[i*n+(i+j)%n][i*n+j]=f**((i+j)//n)
    return out

def determinant(matrix):
    a=[list(row) for row in matrix]
    sign=1
    prev=1
    for k in range(len(a)-1):
        pivot=next((i for i in range(k,len(a)) if a[i][k]),None)
        if pivot is None:return 0
        if pivot!=k:
            a[k],a[pivot]=a[pivot],a[k]
            sign=-sign
        value=a[k][k]
        for i in range(k+1,len(a)):
            for j in range(k+1,len(a)):
                numerator=a[i][j]*value-a[i][k]*a[k][j]
                assert numerator%prev==0
                a[i][j]=numerator//prev
        for i in range(k+1,len(a)):a[i][k]=0
        prev=value
    return sign*a[-1][-1]

from fractions import Fraction
def rational_rank(matrix):
    a=[[Fraction(x) for x in row] for row in matrix]
    k=0
    for col in range(len(a[0])):
        p=next((i for i in range(k,len(a)) if a[i][col]),None)
        if p is None:continue
        a[k],a[p]=a[p],a[k]
        value=a[k][col]
        a[k]=[x/value for x in a[k]]
        for i in range(k+1,len(a)):
            value=a[i][col]
            if value:a[i]=[x-value*y for x,y in zip(a[i],a[k])]
        k+=1
        if k==len(a):break
    return k

for n in range(1,9):
    E=n*(n-1)//2
    for f in (-2,-1,0,1,2,3):
        M=comparison_matrix(n,f)
        assert determinant(M)==(-1)**((n-1)*E)*f**E
        counts['integer_determinants']+=1
    # The nonzero columns have separate coefficient-one pivots over every field.
    M=comparison_matrix(n,0)
    assert rational_rank(M)==n*(n+1)//2
    nonzero=[sum(bool(M[i][j]) for i in range(n*n)) for j in range(n*n)]
    assert sum(nonzero)==n*(n+1)//2 and all(x in (0,1) for x in nonzero)
    counts['branch_ranks']+=1

M=comparison_matrix(2,2)
assert determinant(M)==-2 and rational_rank(M)==4
assert sorted(abs(M[i][j]) for i in range(4) for j in range(4) if M[i][j])==[1,1,1,2]
assert rational_rank([[x%2 for x in row] for row in M])==3
# Actual nilpotent wrapping kernel for Z/4 and nonreduced quotient for Z/8.
assert tuple((row[3]*2)%4 for row in M)==(0,0,0,0)
assert 2 not in {4*a%8 for a in range(8)} and 4 in {4*a%8 for a in range(8)}
assert determinant(comparison_matrix(2,1))%2==1
assert ((1+1)%2,0)==(0,0) and (1,1)!=(0,0)

for q,r in ((4,2),(8,4),(9,3),(12,3),(12,4)):
    for n in range(1,7):
        for f in range(q):
            assert [[x%r for x in row] for row in comparison_matrix(n,f)]== \
                   [[x%r for x in row] for row in comparison_matrix(n,f%r)]
            counts['reduction_checks']+=1

# Explicit index inverses, integral triangular counts, and unit inverse weights.
counts['index_inverse_checks']=0
counts['unit_inverse_checks']=0
for n in range(1,17):
    wrapping=sum(i+j>=n for i in range(n) for j in range(n))
    assert wrapping==n*(n-1)//2
    for i,k in product(range(n),repeat=2):
        j=k-i if k>=i else n+k-i
        assert 0<=j<n and (i+j)%n==k and ((i+j)>=n)==(k<i)
        counts['index_inverse_checks']+=1
for q in (1,2,3,4,5,8,9,12):
    for n in range(1,7):
        for f in range(q):
            if gcd(f,q)!=1:continue
            inv=next(a for a in range(q) if f*a%q==1%q)
            for i,j in product(range(n),repeat=2):
                weight=pow(f,(i+j)//n,q)
                assert weight*pow(inv,(i+j)//n,q)%q==1%q
                counts['unit_inverse_checks']+=1

print(json.dumps(counts,sort_keys=True))
print('PASS: weighted multiplication, exhaustive kernel and image, exact finite kernel/cokernel sizes, integer determinants, characteristic-independent branch pivots, nilpotent/wild/nonflat/nonreduced tests, coefficient reductions, explicit index and unit inverses')
```
